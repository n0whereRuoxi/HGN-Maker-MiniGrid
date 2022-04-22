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
      ?AUTO_28 - OBJ
      ?AUTO_29 - LOCATION
    )
    :vars
    (
      ?AUTO_30 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_28 ?AUTO_30 ) ( AIRPLANE-AT ?AUTO_30 ?AUTO_29 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_28 ?AUTO_30 ?AUTO_29 )
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
      ?AUTO_35 - AIRPLANE
      ?AUTO_39 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_33 ?AUTO_35 ) ( AIRPORT ?AUTO_39 ) ( AIRPORT ?AUTO_34 ) ( AIRPLANE-AT ?AUTO_35 ?AUTO_39 ) ( not ( = ?AUTO_39 ?AUTO_34 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_35 ?AUTO_39 ?AUTO_34 )
      ( DELIVER-PKG ?AUTO_33 ?AUTO_34 )
      ( DELIVER-PKG-VERIFY ?AUTO_33 ?AUTO_34 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_41 - OBJ
      ?AUTO_42 - LOCATION
    )
    :vars
    (
      ?AUTO_43 - LOCATION
      ?AUTO_46 - AIRPLANE
      ?AUTO_48 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_43 ) ( AIRPORT ?AUTO_42 ) ( AIRPLANE-AT ?AUTO_46 ?AUTO_43 ) ( not ( = ?AUTO_43 ?AUTO_42 ) ) ( OBJ-AT ?AUTO_41 ?AUTO_48 ) ( AIRPLANE-AT ?AUTO_46 ?AUTO_48 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_41 ?AUTO_46 ?AUTO_48 )
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
      ?AUTO_53 - LOCATION
      ?AUTO_58 - LOCATION
      ?AUTO_56 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_53 ) ( AIRPORT ?AUTO_51 ) ( not ( = ?AUTO_53 ?AUTO_51 ) ) ( OBJ-AT ?AUTO_50 ?AUTO_53 ) ( AIRPORT ?AUTO_58 ) ( AIRPLANE-AT ?AUTO_56 ?AUTO_58 ) ( not ( = ?AUTO_58 ?AUTO_53 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_56 ?AUTO_58 ?AUTO_53 )
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
      ?AUTO_66 - LOCATION
      ?AUTO_64 - LOCATION
      ?AUTO_65 - AIRPLANE
      ?AUTO_67 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_66 ) ( AIRPORT ?AUTO_61 ) ( not ( = ?AUTO_66 ?AUTO_61 ) ) ( AIRPORT ?AUTO_64 ) ( AIRPLANE-AT ?AUTO_65 ?AUTO_64 ) ( not ( = ?AUTO_64 ?AUTO_66 ) ) ( TRUCK-AT ?AUTO_67 ?AUTO_66 ) ( IN-TRUCK ?AUTO_60 ?AUTO_67 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_60 ?AUTO_67 ?AUTO_66 )
      ( DELIVER-PKG ?AUTO_60 ?AUTO_61 )
      ( DELIVER-PKG-VERIFY ?AUTO_60 ?AUTO_61 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_70 - OBJ
      ?AUTO_71 - LOCATION
    )
    :vars
    (
      ?AUTO_74 - LOCATION
      ?AUTO_76 - LOCATION
      ?AUTO_77 - AIRPLANE
      ?AUTO_72 - TRUCK
      ?AUTO_80 - LOCATION
      ?AUTO_79 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_74 ) ( AIRPORT ?AUTO_71 ) ( not ( = ?AUTO_74 ?AUTO_71 ) ) ( AIRPORT ?AUTO_76 ) ( AIRPLANE-AT ?AUTO_77 ?AUTO_76 ) ( not ( = ?AUTO_76 ?AUTO_74 ) ) ( IN-TRUCK ?AUTO_70 ?AUTO_72 ) ( TRUCK-AT ?AUTO_72 ?AUTO_80 ) ( IN-CITY ?AUTO_80 ?AUTO_79 ) ( IN-CITY ?AUTO_74 ?AUTO_79 ) ( not ( = ?AUTO_74 ?AUTO_80 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_72 ?AUTO_80 ?AUTO_74 ?AUTO_79 )
      ( DELIVER-PKG ?AUTO_70 ?AUTO_71 )
      ( DELIVER-PKG-VERIFY ?AUTO_70 ?AUTO_71 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_82 - OBJ
      ?AUTO_83 - LOCATION
    )
    :vars
    (
      ?AUTO_89 - LOCATION
      ?AUTO_87 - LOCATION
      ?AUTO_88 - AIRPLANE
      ?AUTO_86 - TRUCK
      ?AUTO_91 - LOCATION
      ?AUTO_90 - CITY
      ?AUTO_93 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_89 ) ( AIRPORT ?AUTO_83 ) ( not ( = ?AUTO_89 ?AUTO_83 ) ) ( AIRPORT ?AUTO_87 ) ( AIRPLANE-AT ?AUTO_88 ?AUTO_87 ) ( not ( = ?AUTO_87 ?AUTO_89 ) ) ( TRUCK-AT ?AUTO_86 ?AUTO_91 ) ( IN-CITY ?AUTO_91 ?AUTO_90 ) ( IN-CITY ?AUTO_89 ?AUTO_90 ) ( not ( = ?AUTO_89 ?AUTO_91 ) ) ( TRUCK-AT ?AUTO_86 ?AUTO_93 ) ( OBJ-AT ?AUTO_82 ?AUTO_93 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_82 ?AUTO_86 ?AUTO_93 )
      ( DELIVER-PKG ?AUTO_82 ?AUTO_83 )
      ( DELIVER-PKG-VERIFY ?AUTO_82 ?AUTO_83 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_96 - OBJ
      ?AUTO_97 - LOCATION
    )
    :vars
    (
      ?AUTO_98 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_96 ?AUTO_98 ) ( AIRPLANE-AT ?AUTO_98 ?AUTO_97 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_96 ?AUTO_98 ?AUTO_97 )
      ( DELIVER-PKG-VERIFY ?AUTO_96 ?AUTO_97 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_101 - OBJ
      ?AUTO_102 - LOCATION
    )
    :vars
    (
      ?AUTO_105 - AIRPLANE
      ?AUTO_107 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_101 ?AUTO_105 ) ( AIRPORT ?AUTO_107 ) ( AIRPORT ?AUTO_102 ) ( AIRPLANE-AT ?AUTO_105 ?AUTO_107 ) ( not ( = ?AUTO_107 ?AUTO_102 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_105 ?AUTO_107 ?AUTO_102 )
      ( DELIVER-PKG ?AUTO_101 ?AUTO_102 )
      ( DELIVER-PKG-VERIFY ?AUTO_101 ?AUTO_102 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_123 - OBJ
      ?AUTO_124 - LOCATION
    )
    :vars
    (
      ?AUTO_125 - LOCATION
      ?AUTO_127 - AIRPLANE
      ?AUTO_130 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_125 ) ( AIRPORT ?AUTO_124 ) ( AIRPLANE-AT ?AUTO_127 ?AUTO_125 ) ( not ( = ?AUTO_125 ?AUTO_124 ) ) ( OBJ-AT ?AUTO_123 ?AUTO_130 ) ( AIRPLANE-AT ?AUTO_127 ?AUTO_130 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_123 ?AUTO_127 ?AUTO_130 )
      ( DELIVER-PKG ?AUTO_123 ?AUTO_124 )
      ( DELIVER-PKG-VERIFY ?AUTO_123 ?AUTO_124 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_142 - OBJ
      ?AUTO_143 - LOCATION
    )
    :vars
    (
      ?AUTO_144 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_144 ?AUTO_143 ) ( IN-TRUCK ?AUTO_142 ?AUTO_144 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_142 ?AUTO_144 ?AUTO_143 )
      ( DELIVER-PKG-VERIFY ?AUTO_142 ?AUTO_143 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_147 - OBJ
      ?AUTO_148 - LOCATION
    )
    :vars
    (
      ?AUTO_151 - TRUCK
      ?AUTO_154 - LOCATION
      ?AUTO_153 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_147 ?AUTO_151 ) ( TRUCK-AT ?AUTO_151 ?AUTO_154 ) ( IN-CITY ?AUTO_154 ?AUTO_153 ) ( IN-CITY ?AUTO_148 ?AUTO_153 ) ( not ( = ?AUTO_148 ?AUTO_154 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_151 ?AUTO_154 ?AUTO_148 ?AUTO_153 )
      ( DELIVER-PKG ?AUTO_147 ?AUTO_148 )
      ( DELIVER-PKG-VERIFY ?AUTO_147 ?AUTO_148 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_182 - OBJ
      ?AUTO_183 - LOCATION
    )
    :vars
    (
      ?AUTO_184 - TRUCK
      ?AUTO_185 - LOCATION
      ?AUTO_188 - CITY
      ?AUTO_190 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_184 ?AUTO_185 ) ( IN-CITY ?AUTO_185 ?AUTO_188 ) ( IN-CITY ?AUTO_183 ?AUTO_188 ) ( not ( = ?AUTO_183 ?AUTO_185 ) ) ( TRUCK-AT ?AUTO_184 ?AUTO_190 ) ( OBJ-AT ?AUTO_182 ?AUTO_190 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_182 ?AUTO_184 ?AUTO_190 )
      ( DELIVER-PKG ?AUTO_182 ?AUTO_183 )
      ( DELIVER-PKG-VERIFY ?AUTO_182 ?AUTO_183 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_194 - OBJ
      ?AUTO_195 - LOCATION
    )
    :vars
    (
      ?AUTO_196 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_196 ?AUTO_195 ) ( IN-TRUCK ?AUTO_194 ?AUTO_196 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_194 ?AUTO_196 ?AUTO_195 )
      ( DELIVER-PKG-VERIFY ?AUTO_194 ?AUTO_195 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_223 - OBJ
      ?AUTO_224 - LOCATION
    )
    :vars
    (
      ?AUTO_226 - TRUCK
      ?AUTO_227 - LOCATION
      ?AUTO_225 - CITY
      ?AUTO_231 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_226 ?AUTO_227 ) ( IN-CITY ?AUTO_227 ?AUTO_225 ) ( IN-CITY ?AUTO_224 ?AUTO_225 ) ( not ( = ?AUTO_224 ?AUTO_227 ) ) ( TRUCK-AT ?AUTO_226 ?AUTO_231 ) ( OBJ-AT ?AUTO_223 ?AUTO_231 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_223 ?AUTO_226 ?AUTO_231 )
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
      ?AUTO_240 - LOCATION
      ?AUTO_238 - CITY
      ?AUTO_237 - TRUCK
      ?AUTO_243 - LOCATION
      ?AUTO_242 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_240 ?AUTO_238 ) ( IN-CITY ?AUTO_234 ?AUTO_238 ) ( not ( = ?AUTO_234 ?AUTO_240 ) ) ( OBJ-AT ?AUTO_233 ?AUTO_240 ) ( TRUCK-AT ?AUTO_237 ?AUTO_243 ) ( IN-CITY ?AUTO_243 ?AUTO_242 ) ( IN-CITY ?AUTO_240 ?AUTO_242 ) ( not ( = ?AUTO_240 ?AUTO_243 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_237 ?AUTO_243 ?AUTO_240 ?AUTO_242 )
      ( DELIVER-PKG ?AUTO_233 ?AUTO_234 )
      ( DELIVER-PKG-VERIFY ?AUTO_233 ?AUTO_234 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_251 - OBJ
      ?AUTO_252 - LOCATION
    )
    :vars
    (
      ?AUTO_253 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_251 ?AUTO_253 ) ( AIRPLANE-AT ?AUTO_253 ?AUTO_252 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_251 ?AUTO_253 ?AUTO_252 )
      ( DELIVER-PKG-VERIFY ?AUTO_251 ?AUTO_252 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_258 - OBJ
      ?AUTO_259 - LOCATION
    )
    :vars
    (
      ?AUTO_261 - AIRPLANE
      ?AUTO_264 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_258 ?AUTO_261 ) ( AIRPORT ?AUTO_264 ) ( AIRPORT ?AUTO_259 ) ( AIRPLANE-AT ?AUTO_261 ?AUTO_264 ) ( not ( = ?AUTO_264 ?AUTO_259 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_261 ?AUTO_264 ?AUTO_259 )
      ( DELIVER-PKG ?AUTO_258 ?AUTO_259 )
      ( DELIVER-PKG-VERIFY ?AUTO_258 ?AUTO_259 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_288 - OBJ
      ?AUTO_289 - LOCATION
    )
    :vars
    (
      ?AUTO_292 - LOCATION
      ?AUTO_290 - AIRPLANE
      ?AUTO_295 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_292 ) ( AIRPORT ?AUTO_289 ) ( AIRPLANE-AT ?AUTO_290 ?AUTO_292 ) ( not ( = ?AUTO_292 ?AUTO_289 ) ) ( OBJ-AT ?AUTO_288 ?AUTO_295 ) ( AIRPLANE-AT ?AUTO_290 ?AUTO_295 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_288 ?AUTO_290 ?AUTO_295 )
      ( DELIVER-PKG ?AUTO_288 ?AUTO_289 )
      ( DELIVER-PKG-VERIFY ?AUTO_288 ?AUTO_289 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_297 - OBJ
      ?AUTO_298 - LOCATION
    )
    :vars
    (
      ?AUTO_303 - LOCATION
      ?AUTO_305 - LOCATION
      ?AUTO_301 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_303 ) ( AIRPORT ?AUTO_298 ) ( not ( = ?AUTO_303 ?AUTO_298 ) ) ( OBJ-AT ?AUTO_297 ?AUTO_303 ) ( AIRPORT ?AUTO_305 ) ( AIRPLANE-AT ?AUTO_301 ?AUTO_305 ) ( not ( = ?AUTO_305 ?AUTO_303 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_301 ?AUTO_305 ?AUTO_303 )
      ( DELIVER-PKG ?AUTO_297 ?AUTO_298 )
      ( DELIVER-PKG-VERIFY ?AUTO_297 ?AUTO_298 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_325 - OBJ
      ?AUTO_326 - LOCATION
    )
    :vars
    (
      ?AUTO_327 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_325 ?AUTO_327 ) ( AIRPLANE-AT ?AUTO_327 ?AUTO_326 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_325 ?AUTO_327 ?AUTO_326 )
      ( DELIVER-PKG-VERIFY ?AUTO_325 ?AUTO_326 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_340 - OBJ
      ?AUTO_341 - LOCATION
    )
    :vars
    (
      ?AUTO_342 - LOCATION
      ?AUTO_343 - AIRPLANE
      ?AUTO_347 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_342 ) ( AIRPORT ?AUTO_341 ) ( AIRPLANE-AT ?AUTO_343 ?AUTO_342 ) ( not ( = ?AUTO_342 ?AUTO_341 ) ) ( OBJ-AT ?AUTO_340 ?AUTO_347 ) ( AIRPLANE-AT ?AUTO_343 ?AUTO_347 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_340 ?AUTO_343 ?AUTO_347 )
      ( DELIVER-PKG ?AUTO_340 ?AUTO_341 )
      ( DELIVER-PKG-VERIFY ?AUTO_340 ?AUTO_341 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_351 - OBJ
      ?AUTO_352 - LOCATION
    )
    :vars
    (
      ?AUTO_354 - LOCATION
      ?AUTO_356 - AIRPLANE
      ?AUTO_357 - LOCATION
      ?AUTO_358 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_354 ) ( AIRPORT ?AUTO_352 ) ( AIRPLANE-AT ?AUTO_356 ?AUTO_354 ) ( not ( = ?AUTO_354 ?AUTO_352 ) ) ( AIRPLANE-AT ?AUTO_356 ?AUTO_357 ) ( TRUCK-AT ?AUTO_358 ?AUTO_357 ) ( IN-TRUCK ?AUTO_351 ?AUTO_358 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_351 ?AUTO_358 ?AUTO_357 )
      ( DELIVER-PKG ?AUTO_351 ?AUTO_352 )
      ( DELIVER-PKG-VERIFY ?AUTO_351 ?AUTO_352 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_363 - OBJ
      ?AUTO_364 - LOCATION
    )
    :vars
    (
      ?AUTO_366 - LOCATION
      ?AUTO_367 - AIRPLANE
      ?AUTO_370 - LOCATION
      ?AUTO_369 - TRUCK
      ?AUTO_373 - LOCATION
      ?AUTO_372 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_366 ) ( AIRPORT ?AUTO_364 ) ( AIRPLANE-AT ?AUTO_367 ?AUTO_366 ) ( not ( = ?AUTO_366 ?AUTO_364 ) ) ( AIRPLANE-AT ?AUTO_367 ?AUTO_370 ) ( IN-TRUCK ?AUTO_363 ?AUTO_369 ) ( TRUCK-AT ?AUTO_369 ?AUTO_373 ) ( IN-CITY ?AUTO_373 ?AUTO_372 ) ( IN-CITY ?AUTO_370 ?AUTO_372 ) ( not ( = ?AUTO_370 ?AUTO_373 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_369 ?AUTO_373 ?AUTO_370 ?AUTO_372 )
      ( DELIVER-PKG ?AUTO_363 ?AUTO_364 )
      ( DELIVER-PKG-VERIFY ?AUTO_363 ?AUTO_364 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_391 - OBJ
      ?AUTO_392 - LOCATION
    )
    :vars
    (
      ?AUTO_398 - LOCATION
      ?AUTO_397 - TRUCK
      ?AUTO_394 - LOCATION
      ?AUTO_399 - CITY
      ?AUTO_402 - LOCATION
      ?AUTO_400 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_398 ) ( AIRPORT ?AUTO_392 ) ( not ( = ?AUTO_398 ?AUTO_392 ) ) ( IN-TRUCK ?AUTO_391 ?AUTO_397 ) ( TRUCK-AT ?AUTO_397 ?AUTO_394 ) ( IN-CITY ?AUTO_394 ?AUTO_399 ) ( IN-CITY ?AUTO_398 ?AUTO_399 ) ( not ( = ?AUTO_398 ?AUTO_394 ) ) ( AIRPORT ?AUTO_402 ) ( AIRPLANE-AT ?AUTO_400 ?AUTO_402 ) ( not ( = ?AUTO_402 ?AUTO_398 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_400 ?AUTO_402 ?AUTO_398 )
      ( DELIVER-PKG ?AUTO_391 ?AUTO_392 )
      ( DELIVER-PKG-VERIFY ?AUTO_391 ?AUTO_392 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_406 - OBJ
      ?AUTO_407 - LOCATION
    )
    :vars
    (
      ?AUTO_409 - LOCATION
      ?AUTO_410 - TRUCK
      ?AUTO_408 - LOCATION
      ?AUTO_415 - CITY
      ?AUTO_412 - LOCATION
      ?AUTO_413 - AIRPLANE
      ?AUTO_417 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_409 ) ( AIRPORT ?AUTO_407 ) ( not ( = ?AUTO_409 ?AUTO_407 ) ) ( TRUCK-AT ?AUTO_410 ?AUTO_408 ) ( IN-CITY ?AUTO_408 ?AUTO_415 ) ( IN-CITY ?AUTO_409 ?AUTO_415 ) ( not ( = ?AUTO_409 ?AUTO_408 ) ) ( AIRPORT ?AUTO_412 ) ( AIRPLANE-AT ?AUTO_413 ?AUTO_412 ) ( not ( = ?AUTO_412 ?AUTO_409 ) ) ( TRUCK-AT ?AUTO_410 ?AUTO_417 ) ( OBJ-AT ?AUTO_406 ?AUTO_417 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_406 ?AUTO_410 ?AUTO_417 )
      ( DELIVER-PKG ?AUTO_406 ?AUTO_407 )
      ( DELIVER-PKG-VERIFY ?AUTO_406 ?AUTO_407 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_419 - OBJ
      ?AUTO_420 - LOCATION
    )
    :vars
    (
      ?AUTO_426 - LOCATION
      ?AUTO_429 - LOCATION
      ?AUTO_424 - CITY
      ?AUTO_427 - LOCATION
      ?AUTO_423 - AIRPLANE
      ?AUTO_428 - TRUCK
      ?AUTO_432 - LOCATION
      ?AUTO_431 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_426 ) ( AIRPORT ?AUTO_420 ) ( not ( = ?AUTO_426 ?AUTO_420 ) ) ( IN-CITY ?AUTO_429 ?AUTO_424 ) ( IN-CITY ?AUTO_426 ?AUTO_424 ) ( not ( = ?AUTO_426 ?AUTO_429 ) ) ( AIRPORT ?AUTO_427 ) ( AIRPLANE-AT ?AUTO_423 ?AUTO_427 ) ( not ( = ?AUTO_427 ?AUTO_426 ) ) ( OBJ-AT ?AUTO_419 ?AUTO_429 ) ( TRUCK-AT ?AUTO_428 ?AUTO_432 ) ( IN-CITY ?AUTO_432 ?AUTO_431 ) ( IN-CITY ?AUTO_429 ?AUTO_431 ) ( not ( = ?AUTO_429 ?AUTO_432 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_428 ?AUTO_432 ?AUTO_429 ?AUTO_431 )
      ( DELIVER-PKG ?AUTO_419 ?AUTO_420 )
      ( DELIVER-PKG-VERIFY ?AUTO_419 ?AUTO_420 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_440 - OBJ
      ?AUTO_441 - LOCATION
    )
    :vars
    (
      ?AUTO_442 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_442 ?AUTO_441 ) ( IN-TRUCK ?AUTO_440 ?AUTO_442 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_440 ?AUTO_442 ?AUTO_441 )
      ( DELIVER-PKG-VERIFY ?AUTO_440 ?AUTO_441 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_459 - OBJ
      ?AUTO_460 - LOCATION
    )
    :vars
    (
      ?AUTO_461 - TRUCK
      ?AUTO_466 - LOCATION
      ?AUTO_465 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_459 ?AUTO_461 ) ( TRUCK-AT ?AUTO_461 ?AUTO_466 ) ( IN-CITY ?AUTO_466 ?AUTO_465 ) ( IN-CITY ?AUTO_460 ?AUTO_465 ) ( not ( = ?AUTO_460 ?AUTO_466 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_461 ?AUTO_466 ?AUTO_460 ?AUTO_465 )
      ( DELIVER-PKG ?AUTO_459 ?AUTO_460 )
      ( DELIVER-PKG-VERIFY ?AUTO_459 ?AUTO_460 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_468 - OBJ
      ?AUTO_469 - LOCATION
    )
    :vars
    (
      ?AUTO_471 - TRUCK
      ?AUTO_474 - LOCATION
      ?AUTO_473 - CITY
      ?AUTO_476 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_471 ?AUTO_474 ) ( IN-CITY ?AUTO_474 ?AUTO_473 ) ( IN-CITY ?AUTO_469 ?AUTO_473 ) ( not ( = ?AUTO_469 ?AUTO_474 ) ) ( TRUCK-AT ?AUTO_471 ?AUTO_476 ) ( OBJ-AT ?AUTO_468 ?AUTO_476 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_468 ?AUTO_471 ?AUTO_476 )
      ( DELIVER-PKG ?AUTO_468 ?AUTO_469 )
      ( DELIVER-PKG-VERIFY ?AUTO_468 ?AUTO_469 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_486 - OBJ
      ?AUTO_487 - LOCATION
    )
    :vars
    (
      ?AUTO_493 - LOCATION
      ?AUTO_492 - CITY
      ?AUTO_491 - TRUCK
      ?AUTO_496 - LOCATION
      ?AUTO_495 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_493 ?AUTO_492 ) ( IN-CITY ?AUTO_487 ?AUTO_492 ) ( not ( = ?AUTO_487 ?AUTO_493 ) ) ( OBJ-AT ?AUTO_486 ?AUTO_493 ) ( TRUCK-AT ?AUTO_491 ?AUTO_496 ) ( IN-CITY ?AUTO_496 ?AUTO_495 ) ( IN-CITY ?AUTO_493 ?AUTO_495 ) ( not ( = ?AUTO_493 ?AUTO_496 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_491 ?AUTO_496 ?AUTO_493 ?AUTO_495 )
      ( DELIVER-PKG ?AUTO_486 ?AUTO_487 )
      ( DELIVER-PKG-VERIFY ?AUTO_486 ?AUTO_487 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_498 - OBJ
      ?AUTO_499 - LOCATION
    )
    :vars
    (
      ?AUTO_502 - LOCATION
      ?AUTO_503 - CITY
      ?AUTO_504 - TRUCK
      ?AUTO_506 - LOCATION
      ?AUTO_505 - CITY
      ?AUTO_507 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_502 ?AUTO_503 ) ( IN-CITY ?AUTO_499 ?AUTO_503 ) ( not ( = ?AUTO_499 ?AUTO_502 ) ) ( TRUCK-AT ?AUTO_504 ?AUTO_506 ) ( IN-CITY ?AUTO_506 ?AUTO_505 ) ( IN-CITY ?AUTO_502 ?AUTO_505 ) ( not ( = ?AUTO_502 ?AUTO_506 ) ) ( IN-AIRPLANE ?AUTO_498 ?AUTO_507 ) ( AIRPLANE-AT ?AUTO_507 ?AUTO_502 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_498 ?AUTO_507 ?AUTO_502 )
      ( DELIVER-PKG ?AUTO_498 ?AUTO_499 )
      ( DELIVER-PKG-VERIFY ?AUTO_498 ?AUTO_499 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_510 - OBJ
      ?AUTO_511 - LOCATION
    )
    :vars
    (
      ?AUTO_517 - LOCATION
      ?AUTO_514 - CITY
      ?AUTO_512 - TRUCK
      ?AUTO_519 - LOCATION
      ?AUTO_518 - CITY
      ?AUTO_513 - AIRPLANE
      ?AUTO_521 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_517 ?AUTO_514 ) ( IN-CITY ?AUTO_511 ?AUTO_514 ) ( not ( = ?AUTO_511 ?AUTO_517 ) ) ( TRUCK-AT ?AUTO_512 ?AUTO_519 ) ( IN-CITY ?AUTO_519 ?AUTO_518 ) ( IN-CITY ?AUTO_517 ?AUTO_518 ) ( not ( = ?AUTO_517 ?AUTO_519 ) ) ( IN-AIRPLANE ?AUTO_510 ?AUTO_513 ) ( AIRPORT ?AUTO_521 ) ( AIRPORT ?AUTO_517 ) ( AIRPLANE-AT ?AUTO_513 ?AUTO_521 ) ( not ( = ?AUTO_521 ?AUTO_517 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_513 ?AUTO_521 ?AUTO_517 )
      ( DELIVER-PKG ?AUTO_510 ?AUTO_511 )
      ( DELIVER-PKG-VERIFY ?AUTO_510 ?AUTO_511 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_537 - OBJ
      ?AUTO_538 - LOCATION
    )
    :vars
    (
      ?AUTO_545 - LOCATION
      ?AUTO_546 - CITY
      ?AUTO_544 - TRUCK
      ?AUTO_540 - LOCATION
      ?AUTO_542 - CITY
      ?AUTO_547 - LOCATION
      ?AUTO_543 - AIRPLANE
      ?AUTO_549 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_545 ?AUTO_546 ) ( IN-CITY ?AUTO_538 ?AUTO_546 ) ( not ( = ?AUTO_538 ?AUTO_545 ) ) ( TRUCK-AT ?AUTO_544 ?AUTO_540 ) ( IN-CITY ?AUTO_540 ?AUTO_542 ) ( IN-CITY ?AUTO_545 ?AUTO_542 ) ( not ( = ?AUTO_545 ?AUTO_540 ) ) ( AIRPORT ?AUTO_547 ) ( AIRPORT ?AUTO_545 ) ( AIRPLANE-AT ?AUTO_543 ?AUTO_547 ) ( not ( = ?AUTO_547 ?AUTO_545 ) ) ( OBJ-AT ?AUTO_537 ?AUTO_549 ) ( AIRPLANE-AT ?AUTO_543 ?AUTO_549 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_537 ?AUTO_543 ?AUTO_549 )
      ( DELIVER-PKG ?AUTO_537 ?AUTO_538 )
      ( DELIVER-PKG-VERIFY ?AUTO_537 ?AUTO_538 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_561 - OBJ
      ?AUTO_562 - LOCATION
    )
    :vars
    (
      ?AUTO_563 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_561 ?AUTO_563 ) ( AIRPLANE-AT ?AUTO_563 ?AUTO_562 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_561 ?AUTO_563 ?AUTO_562 )
      ( DELIVER-PKG-VERIFY ?AUTO_561 ?AUTO_562 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_626 - OBJ
      ?AUTO_627 - LOCATION
    )
    :vars
    (
      ?AUTO_628 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_626 ?AUTO_628 ) ( AIRPLANE-AT ?AUTO_628 ?AUTO_627 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_626 ?AUTO_628 ?AUTO_627 )
      ( DELIVER-PKG-VERIFY ?AUTO_626 ?AUTO_627 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_669 - OBJ
      ?AUTO_670 - LOCATION
    )
    :vars
    (
      ?AUTO_674 - LOCATION
      ?AUTO_677 - LOCATION
      ?AUTO_673 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_674 ) ( AIRPORT ?AUTO_670 ) ( not ( = ?AUTO_674 ?AUTO_670 ) ) ( OBJ-AT ?AUTO_669 ?AUTO_674 ) ( AIRPORT ?AUTO_677 ) ( AIRPLANE-AT ?AUTO_673 ?AUTO_677 ) ( not ( = ?AUTO_677 ?AUTO_674 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_673 ?AUTO_677 ?AUTO_674 )
      ( DELIVER-PKG ?AUTO_669 ?AUTO_670 )
      ( DELIVER-PKG-VERIFY ?AUTO_669 ?AUTO_670 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_701 - OBJ
      ?AUTO_702 - LOCATION
    )
    :vars
    (
      ?AUTO_703 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_701 ?AUTO_703 ) ( AIRPLANE-AT ?AUTO_703 ?AUTO_702 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_701 ?AUTO_703 ?AUTO_702 )
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
      ?AUTO_710 - AIRPLANE
      ?AUTO_712 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_706 ?AUTO_710 ) ( AIRPORT ?AUTO_712 ) ( AIRPORT ?AUTO_707 ) ( AIRPLANE-AT ?AUTO_710 ?AUTO_712 ) ( not ( = ?AUTO_712 ?AUTO_707 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_710 ?AUTO_712 ?AUTO_707 )
      ( DELIVER-PKG ?AUTO_706 ?AUTO_707 )
      ( DELIVER-PKG-VERIFY ?AUTO_706 ?AUTO_707 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_778 - OBJ
      ?AUTO_779 - LOCATION
    )
    :vars
    (
      ?AUTO_780 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_778 ?AUTO_780 ) ( AIRPLANE-AT ?AUTO_780 ?AUTO_779 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_778 ?AUTO_780 ?AUTO_779 )
      ( DELIVER-PKG-VERIFY ?AUTO_778 ?AUTO_779 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_803 - OBJ
      ?AUTO_804 - LOCATION
    )
    :vars
    (
      ?AUTO_805 - LOCATION
      ?AUTO_806 - AIRPLANE
      ?AUTO_810 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_805 ) ( AIRPORT ?AUTO_804 ) ( AIRPLANE-AT ?AUTO_806 ?AUTO_805 ) ( not ( = ?AUTO_805 ?AUTO_804 ) ) ( OBJ-AT ?AUTO_803 ?AUTO_810 ) ( AIRPLANE-AT ?AUTO_806 ?AUTO_810 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_803 ?AUTO_806 ?AUTO_810 )
      ( DELIVER-PKG ?AUTO_803 ?AUTO_804 )
      ( DELIVER-PKG-VERIFY ?AUTO_803 ?AUTO_804 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_812 - OBJ
      ?AUTO_813 - LOCATION
    )
    :vars
    (
      ?AUTO_818 - LOCATION
      ?AUTO_820 - LOCATION
      ?AUTO_817 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_818 ) ( AIRPORT ?AUTO_813 ) ( not ( = ?AUTO_818 ?AUTO_813 ) ) ( OBJ-AT ?AUTO_812 ?AUTO_818 ) ( AIRPORT ?AUTO_820 ) ( AIRPLANE-AT ?AUTO_817 ?AUTO_820 ) ( not ( = ?AUTO_820 ?AUTO_818 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_817 ?AUTO_820 ?AUTO_818 )
      ( DELIVER-PKG ?AUTO_812 ?AUTO_813 )
      ( DELIVER-PKG-VERIFY ?AUTO_812 ?AUTO_813 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_866 - OBJ
      ?AUTO_867 - LOCATION
    )
    :vars
    (
      ?AUTO_868 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_868 ?AUTO_867 ) ( IN-TRUCK ?AUTO_866 ?AUTO_868 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_866 ?AUTO_868 ?AUTO_867 )
      ( DELIVER-PKG-VERIFY ?AUTO_866 ?AUTO_867 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_871 - OBJ
      ?AUTO_872 - LOCATION
    )
    :vars
    (
      ?AUTO_873 - TRUCK
      ?AUTO_878 - LOCATION
      ?AUTO_877 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_871 ?AUTO_873 ) ( TRUCK-AT ?AUTO_873 ?AUTO_878 ) ( IN-CITY ?AUTO_878 ?AUTO_877 ) ( IN-CITY ?AUTO_872 ?AUTO_877 ) ( not ( = ?AUTO_872 ?AUTO_878 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_873 ?AUTO_878 ?AUTO_872 ?AUTO_877 )
      ( DELIVER-PKG ?AUTO_871 ?AUTO_872 )
      ( DELIVER-PKG-VERIFY ?AUTO_871 ?AUTO_872 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_882 - OBJ
      ?AUTO_883 - LOCATION
    )
    :vars
    (
      ?AUTO_884 - TRUCK
      ?AUTO_886 - LOCATION
      ?AUTO_887 - CITY
      ?AUTO_890 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_884 ?AUTO_886 ) ( IN-CITY ?AUTO_886 ?AUTO_887 ) ( IN-CITY ?AUTO_883 ?AUTO_887 ) ( not ( = ?AUTO_883 ?AUTO_886 ) ) ( TRUCK-AT ?AUTO_884 ?AUTO_890 ) ( OBJ-AT ?AUTO_882 ?AUTO_890 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_882 ?AUTO_884 ?AUTO_890 )
      ( DELIVER-PKG ?AUTO_882 ?AUTO_883 )
      ( DELIVER-PKG-VERIFY ?AUTO_882 ?AUTO_883 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_892 - OBJ
      ?AUTO_893 - LOCATION
    )
    :vars
    (
      ?AUTO_896 - TRUCK
      ?AUTO_897 - LOCATION
      ?AUTO_898 - CITY
      ?AUTO_899 - LOCATION
      ?AUTO_900 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_896 ?AUTO_897 ) ( IN-CITY ?AUTO_897 ?AUTO_898 ) ( IN-CITY ?AUTO_893 ?AUTO_898 ) ( not ( = ?AUTO_893 ?AUTO_897 ) ) ( TRUCK-AT ?AUTO_896 ?AUTO_899 ) ( IN-AIRPLANE ?AUTO_892 ?AUTO_900 ) ( AIRPLANE-AT ?AUTO_900 ?AUTO_899 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_892 ?AUTO_900 ?AUTO_899 )
      ( DELIVER-PKG ?AUTO_892 ?AUTO_893 )
      ( DELIVER-PKG-VERIFY ?AUTO_892 ?AUTO_893 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_905 - OBJ
      ?AUTO_906 - LOCATION
    )
    :vars
    (
      ?AUTO_909 - TRUCK
      ?AUTO_913 - LOCATION
      ?AUTO_910 - CITY
      ?AUTO_912 - LOCATION
      ?AUTO_907 - AIRPLANE
      ?AUTO_915 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_909 ?AUTO_913 ) ( IN-CITY ?AUTO_913 ?AUTO_910 ) ( IN-CITY ?AUTO_906 ?AUTO_910 ) ( not ( = ?AUTO_906 ?AUTO_913 ) ) ( TRUCK-AT ?AUTO_909 ?AUTO_912 ) ( IN-AIRPLANE ?AUTO_905 ?AUTO_907 ) ( AIRPORT ?AUTO_915 ) ( AIRPORT ?AUTO_912 ) ( AIRPLANE-AT ?AUTO_907 ?AUTO_915 ) ( not ( = ?AUTO_915 ?AUTO_912 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_907 ?AUTO_915 ?AUTO_912 )
      ( DELIVER-PKG ?AUTO_905 ?AUTO_906 )
      ( DELIVER-PKG-VERIFY ?AUTO_905 ?AUTO_906 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_933 - OBJ
      ?AUTO_934 - LOCATION
    )
    :vars
    (
      ?AUTO_940 - TRUCK
      ?AUTO_937 - LOCATION
      ?AUTO_941 - CITY
      ?AUTO_939 - LOCATION
      ?AUTO_942 - LOCATION
      ?AUTO_936 - AIRPLANE
      ?AUTO_944 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_940 ?AUTO_937 ) ( IN-CITY ?AUTO_937 ?AUTO_941 ) ( IN-CITY ?AUTO_934 ?AUTO_941 ) ( not ( = ?AUTO_934 ?AUTO_937 ) ) ( TRUCK-AT ?AUTO_940 ?AUTO_939 ) ( AIRPORT ?AUTO_942 ) ( AIRPORT ?AUTO_939 ) ( AIRPLANE-AT ?AUTO_936 ?AUTO_942 ) ( not ( = ?AUTO_942 ?AUTO_939 ) ) ( OBJ-AT ?AUTO_933 ?AUTO_944 ) ( AIRPLANE-AT ?AUTO_936 ?AUTO_944 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_933 ?AUTO_936 ?AUTO_944 )
      ( DELIVER-PKG ?AUTO_933 ?AUTO_934 )
      ( DELIVER-PKG-VERIFY ?AUTO_933 ?AUTO_934 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_946 - OBJ
      ?AUTO_947 - LOCATION
    )
    :vars
    (
      ?AUTO_954 - TRUCK
      ?AUTO_955 - LOCATION
      ?AUTO_953 - CITY
      ?AUTO_950 - LOCATION
      ?AUTO_956 - LOCATION
      ?AUTO_958 - LOCATION
      ?AUTO_951 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_954 ?AUTO_955 ) ( IN-CITY ?AUTO_955 ?AUTO_953 ) ( IN-CITY ?AUTO_947 ?AUTO_953 ) ( not ( = ?AUTO_947 ?AUTO_955 ) ) ( TRUCK-AT ?AUTO_954 ?AUTO_950 ) ( AIRPORT ?AUTO_956 ) ( AIRPORT ?AUTO_950 ) ( not ( = ?AUTO_956 ?AUTO_950 ) ) ( OBJ-AT ?AUTO_946 ?AUTO_956 ) ( AIRPORT ?AUTO_958 ) ( AIRPLANE-AT ?AUTO_951 ?AUTO_958 ) ( not ( = ?AUTO_958 ?AUTO_956 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_951 ?AUTO_958 ?AUTO_956 )
      ( DELIVER-PKG ?AUTO_946 ?AUTO_947 )
      ( DELIVER-PKG-VERIFY ?AUTO_946 ?AUTO_947 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1004 - OBJ
      ?AUTO_1005 - LOCATION
    )
    :vars
    (
      ?AUTO_1006 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1006 ?AUTO_1005 ) ( IN-TRUCK ?AUTO_1004 ?AUTO_1006 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1004 ?AUTO_1006 ?AUTO_1005 )
      ( DELIVER-PKG-VERIFY ?AUTO_1004 ?AUTO_1005 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1009 - OBJ
      ?AUTO_1010 - LOCATION
    )
    :vars
    (
      ?AUTO_1013 - TRUCK
      ?AUTO_1016 - LOCATION
      ?AUTO_1015 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1009 ?AUTO_1013 ) ( TRUCK-AT ?AUTO_1013 ?AUTO_1016 ) ( IN-CITY ?AUTO_1016 ?AUTO_1015 ) ( IN-CITY ?AUTO_1010 ?AUTO_1015 ) ( not ( = ?AUTO_1010 ?AUTO_1016 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1013 ?AUTO_1016 ?AUTO_1010 ?AUTO_1015 )
      ( DELIVER-PKG ?AUTO_1009 ?AUTO_1010 )
      ( DELIVER-PKG-VERIFY ?AUTO_1009 ?AUTO_1010 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1022 - OBJ
      ?AUTO_1023 - LOCATION
    )
    :vars
    (
      ?AUTO_1028 - TRUCK
      ?AUTO_1027 - LOCATION
      ?AUTO_1024 - CITY
      ?AUTO_1030 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1028 ?AUTO_1027 ) ( IN-CITY ?AUTO_1027 ?AUTO_1024 ) ( IN-CITY ?AUTO_1023 ?AUTO_1024 ) ( not ( = ?AUTO_1023 ?AUTO_1027 ) ) ( TRUCK-AT ?AUTO_1028 ?AUTO_1030 ) ( OBJ-AT ?AUTO_1022 ?AUTO_1030 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1022 ?AUTO_1028 ?AUTO_1030 )
      ( DELIVER-PKG ?AUTO_1022 ?AUTO_1023 )
      ( DELIVER-PKG-VERIFY ?AUTO_1022 ?AUTO_1023 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1070 - OBJ
      ?AUTO_1071 - LOCATION
    )
    :vars
    (
      ?AUTO_1078 - TRUCK
      ?AUTO_1080 - LOCATION
      ?AUTO_1073 - CITY
      ?AUTO_1075 - LOCATION
      ?AUTO_1072 - LOCATION
      ?AUTO_1077 - LOCATION
      ?AUTO_1074 - AIRPLANE
      ?AUTO_1081 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1078 ?AUTO_1080 ) ( IN-CITY ?AUTO_1080 ?AUTO_1073 ) ( IN-CITY ?AUTO_1071 ?AUTO_1073 ) ( not ( = ?AUTO_1071 ?AUTO_1080 ) ) ( TRUCK-AT ?AUTO_1078 ?AUTO_1075 ) ( AIRPORT ?AUTO_1072 ) ( AIRPORT ?AUTO_1075 ) ( not ( = ?AUTO_1072 ?AUTO_1075 ) ) ( AIRPORT ?AUTO_1077 ) ( AIRPLANE-AT ?AUTO_1074 ?AUTO_1077 ) ( not ( = ?AUTO_1077 ?AUTO_1072 ) ) ( TRUCK-AT ?AUTO_1081 ?AUTO_1072 ) ( IN-TRUCK ?AUTO_1070 ?AUTO_1081 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1070 ?AUTO_1081 ?AUTO_1072 )
      ( DELIVER-PKG ?AUTO_1070 ?AUTO_1071 )
      ( DELIVER-PKG-VERIFY ?AUTO_1070 ?AUTO_1071 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1084 - OBJ
      ?AUTO_1085 - LOCATION
    )
    :vars
    (
      ?AUTO_1094 - TRUCK
      ?AUTO_1093 - LOCATION
      ?AUTO_1087 - CITY
      ?AUTO_1090 - LOCATION
      ?AUTO_1092 - LOCATION
      ?AUTO_1089 - LOCATION
      ?AUTO_1091 - AIRPLANE
      ?AUTO_1095 - TRUCK
      ?AUTO_1098 - LOCATION
      ?AUTO_1097 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1094 ?AUTO_1093 ) ( IN-CITY ?AUTO_1093 ?AUTO_1087 ) ( IN-CITY ?AUTO_1085 ?AUTO_1087 ) ( not ( = ?AUTO_1085 ?AUTO_1093 ) ) ( TRUCK-AT ?AUTO_1094 ?AUTO_1090 ) ( AIRPORT ?AUTO_1092 ) ( AIRPORT ?AUTO_1090 ) ( not ( = ?AUTO_1092 ?AUTO_1090 ) ) ( AIRPORT ?AUTO_1089 ) ( AIRPLANE-AT ?AUTO_1091 ?AUTO_1089 ) ( not ( = ?AUTO_1089 ?AUTO_1092 ) ) ( IN-TRUCK ?AUTO_1084 ?AUTO_1095 ) ( TRUCK-AT ?AUTO_1095 ?AUTO_1098 ) ( IN-CITY ?AUTO_1098 ?AUTO_1097 ) ( IN-CITY ?AUTO_1092 ?AUTO_1097 ) ( not ( = ?AUTO_1092 ?AUTO_1098 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1095 ?AUTO_1098 ?AUTO_1092 ?AUTO_1097 )
      ( DELIVER-PKG ?AUTO_1084 ?AUTO_1085 )
      ( DELIVER-PKG-VERIFY ?AUTO_1084 ?AUTO_1085 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1126 - OBJ
      ?AUTO_1127 - LOCATION
    )
    :vars
    (
      ?AUTO_1132 - TRUCK
      ?AUTO_1136 - LOCATION
      ?AUTO_1137 - CITY
      ?AUTO_1131 - LOCATION
      ?AUTO_1130 - LOCATION
      ?AUTO_1138 - LOCATION
      ?AUTO_1134 - AIRPLANE
      ?AUTO_1133 - TRUCK
      ?AUTO_1135 - LOCATION
      ?AUTO_1129 - CITY
      ?AUTO_1141 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1132 ?AUTO_1136 ) ( IN-CITY ?AUTO_1136 ?AUTO_1137 ) ( IN-CITY ?AUTO_1127 ?AUTO_1137 ) ( not ( = ?AUTO_1127 ?AUTO_1136 ) ) ( TRUCK-AT ?AUTO_1132 ?AUTO_1131 ) ( AIRPORT ?AUTO_1130 ) ( AIRPORT ?AUTO_1131 ) ( not ( = ?AUTO_1130 ?AUTO_1131 ) ) ( AIRPORT ?AUTO_1138 ) ( AIRPLANE-AT ?AUTO_1134 ?AUTO_1138 ) ( not ( = ?AUTO_1138 ?AUTO_1130 ) ) ( TRUCK-AT ?AUTO_1133 ?AUTO_1135 ) ( IN-CITY ?AUTO_1135 ?AUTO_1129 ) ( IN-CITY ?AUTO_1130 ?AUTO_1129 ) ( not ( = ?AUTO_1130 ?AUTO_1135 ) ) ( TRUCK-AT ?AUTO_1133 ?AUTO_1141 ) ( OBJ-AT ?AUTO_1126 ?AUTO_1141 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1126 ?AUTO_1133 ?AUTO_1141 )
      ( DELIVER-PKG ?AUTO_1126 ?AUTO_1127 )
      ( DELIVER-PKG-VERIFY ?AUTO_1126 ?AUTO_1127 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1145 - OBJ
      ?AUTO_1146 - LOCATION
    )
    :vars
    (
      ?AUTO_1147 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1147 ?AUTO_1146 ) ( IN-TRUCK ?AUTO_1145 ?AUTO_1147 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1145 ?AUTO_1147 ?AUTO_1146 )
      ( DELIVER-PKG-VERIFY ?AUTO_1145 ?AUTO_1146 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1232 - OBJ
      ?AUTO_1233 - LOCATION
    )
    :vars
    (
      ?AUTO_1234 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1234 ?AUTO_1233 ) ( IN-TRUCK ?AUTO_1232 ?AUTO_1234 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1232 ?AUTO_1234 ?AUTO_1233 )
      ( DELIVER-PKG-VERIFY ?AUTO_1232 ?AUTO_1233 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1237 - OBJ
      ?AUTO_1238 - LOCATION
    )
    :vars
    (
      ?AUTO_1241 - TRUCK
      ?AUTO_1244 - LOCATION
      ?AUTO_1243 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1237 ?AUTO_1241 ) ( TRUCK-AT ?AUTO_1241 ?AUTO_1244 ) ( IN-CITY ?AUTO_1244 ?AUTO_1243 ) ( IN-CITY ?AUTO_1238 ?AUTO_1243 ) ( not ( = ?AUTO_1238 ?AUTO_1244 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1241 ?AUTO_1244 ?AUTO_1238 ?AUTO_1243 )
      ( DELIVER-PKG ?AUTO_1237 ?AUTO_1238 )
      ( DELIVER-PKG-VERIFY ?AUTO_1237 ?AUTO_1238 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1294 - OBJ
      ?AUTO_1295 - LOCATION
    )
    :vars
    (
      ?AUTO_1296 - TRUCK
      ?AUTO_1303 - LOCATION
      ?AUTO_1301 - CITY
      ?AUTO_1302 - LOCATION
      ?AUTO_1304 - LOCATION
      ?AUTO_1298 - LOCATION
      ?AUTO_1299 - AIRPLANE
      ?AUTO_1305 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1296 ?AUTO_1303 ) ( IN-CITY ?AUTO_1303 ?AUTO_1301 ) ( IN-CITY ?AUTO_1295 ?AUTO_1301 ) ( not ( = ?AUTO_1295 ?AUTO_1303 ) ) ( TRUCK-AT ?AUTO_1296 ?AUTO_1302 ) ( AIRPORT ?AUTO_1304 ) ( AIRPORT ?AUTO_1302 ) ( not ( = ?AUTO_1304 ?AUTO_1302 ) ) ( AIRPORT ?AUTO_1298 ) ( AIRPLANE-AT ?AUTO_1299 ?AUTO_1298 ) ( not ( = ?AUTO_1298 ?AUTO_1304 ) ) ( TRUCK-AT ?AUTO_1305 ?AUTO_1304 ) ( IN-TRUCK ?AUTO_1294 ?AUTO_1305 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1294 ?AUTO_1305 ?AUTO_1304 )
      ( DELIVER-PKG ?AUTO_1294 ?AUTO_1295 )
      ( DELIVER-PKG-VERIFY ?AUTO_1294 ?AUTO_1295 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1332 - OBJ
      ?AUTO_1333 - LOCATION
    )
    :vars
    (
      ?AUTO_1336 - TRUCK
      ?AUTO_1335 - LOCATION
      ?AUTO_1341 - CITY
      ?AUTO_1345 - LOCATION
      ?AUTO_1340 - LOCATION
      ?AUTO_1338 - LOCATION
      ?AUTO_1337 - AIRPLANE
      ?AUTO_1344 - TRUCK
      ?AUTO_1339 - LOCATION
      ?AUTO_1334 - CITY
      ?AUTO_1347 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1336 ?AUTO_1335 ) ( IN-CITY ?AUTO_1335 ?AUTO_1341 ) ( IN-CITY ?AUTO_1333 ?AUTO_1341 ) ( not ( = ?AUTO_1333 ?AUTO_1335 ) ) ( TRUCK-AT ?AUTO_1336 ?AUTO_1345 ) ( AIRPORT ?AUTO_1340 ) ( AIRPORT ?AUTO_1345 ) ( not ( = ?AUTO_1340 ?AUTO_1345 ) ) ( AIRPORT ?AUTO_1338 ) ( AIRPLANE-AT ?AUTO_1337 ?AUTO_1338 ) ( not ( = ?AUTO_1338 ?AUTO_1340 ) ) ( TRUCK-AT ?AUTO_1344 ?AUTO_1339 ) ( IN-CITY ?AUTO_1339 ?AUTO_1334 ) ( IN-CITY ?AUTO_1340 ?AUTO_1334 ) ( not ( = ?AUTO_1340 ?AUTO_1339 ) ) ( TRUCK-AT ?AUTO_1344 ?AUTO_1347 ) ( OBJ-AT ?AUTO_1332 ?AUTO_1347 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1332 ?AUTO_1344 ?AUTO_1347 )
      ( DELIVER-PKG ?AUTO_1332 ?AUTO_1333 )
      ( DELIVER-PKG-VERIFY ?AUTO_1332 ?AUTO_1333 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1349 - OBJ
      ?AUTO_1350 - LOCATION
    )
    :vars
    (
      ?AUTO_1354 - TRUCK
      ?AUTO_1359 - LOCATION
      ?AUTO_1360 - CITY
      ?AUTO_1363 - LOCATION
      ?AUTO_1355 - LOCATION
      ?AUTO_1353 - LOCATION
      ?AUTO_1352 - AIRPLANE
      ?AUTO_1362 - LOCATION
      ?AUTO_1361 - CITY
      ?AUTO_1357 - TRUCK
      ?AUTO_1366 - LOCATION
      ?AUTO_1365 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1354 ?AUTO_1359 ) ( IN-CITY ?AUTO_1359 ?AUTO_1360 ) ( IN-CITY ?AUTO_1350 ?AUTO_1360 ) ( not ( = ?AUTO_1350 ?AUTO_1359 ) ) ( TRUCK-AT ?AUTO_1354 ?AUTO_1363 ) ( AIRPORT ?AUTO_1355 ) ( AIRPORT ?AUTO_1363 ) ( not ( = ?AUTO_1355 ?AUTO_1363 ) ) ( AIRPORT ?AUTO_1353 ) ( AIRPLANE-AT ?AUTO_1352 ?AUTO_1353 ) ( not ( = ?AUTO_1353 ?AUTO_1355 ) ) ( IN-CITY ?AUTO_1362 ?AUTO_1361 ) ( IN-CITY ?AUTO_1355 ?AUTO_1361 ) ( not ( = ?AUTO_1355 ?AUTO_1362 ) ) ( OBJ-AT ?AUTO_1349 ?AUTO_1362 ) ( TRUCK-AT ?AUTO_1357 ?AUTO_1366 ) ( IN-CITY ?AUTO_1366 ?AUTO_1365 ) ( IN-CITY ?AUTO_1362 ?AUTO_1365 ) ( not ( = ?AUTO_1362 ?AUTO_1366 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1357 ?AUTO_1366 ?AUTO_1362 ?AUTO_1365 )
      ( DELIVER-PKG ?AUTO_1349 ?AUTO_1350 )
      ( DELIVER-PKG-VERIFY ?AUTO_1349 ?AUTO_1350 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1369 - OBJ
      ?AUTO_1370 - LOCATION
    )
    :vars
    (
      ?AUTO_1371 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1371 ?AUTO_1370 ) ( IN-TRUCK ?AUTO_1369 ?AUTO_1371 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1369 ?AUTO_1371 ?AUTO_1370 )
      ( DELIVER-PKG-VERIFY ?AUTO_1369 ?AUTO_1370 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1374 - OBJ
      ?AUTO_1375 - LOCATION
    )
    :vars
    (
      ?AUTO_1378 - TRUCK
      ?AUTO_1381 - LOCATION
      ?AUTO_1380 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1374 ?AUTO_1378 ) ( TRUCK-AT ?AUTO_1378 ?AUTO_1381 ) ( IN-CITY ?AUTO_1381 ?AUTO_1380 ) ( IN-CITY ?AUTO_1375 ?AUTO_1380 ) ( not ( = ?AUTO_1375 ?AUTO_1381 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1378 ?AUTO_1381 ?AUTO_1375 ?AUTO_1380 )
      ( DELIVER-PKG ?AUTO_1374 ?AUTO_1375 )
      ( DELIVER-PKG-VERIFY ?AUTO_1374 ?AUTO_1375 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1383 - OBJ
      ?AUTO_1384 - LOCATION
    )
    :vars
    (
      ?AUTO_1387 - TRUCK
      ?AUTO_1389 - LOCATION
      ?AUTO_1388 - CITY
      ?AUTO_1391 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1387 ?AUTO_1389 ) ( IN-CITY ?AUTO_1389 ?AUTO_1388 ) ( IN-CITY ?AUTO_1384 ?AUTO_1388 ) ( not ( = ?AUTO_1384 ?AUTO_1389 ) ) ( TRUCK-AT ?AUTO_1387 ?AUTO_1391 ) ( OBJ-AT ?AUTO_1383 ?AUTO_1391 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1383 ?AUTO_1387 ?AUTO_1391 )
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
      ?AUTO_1397 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1395 ?AUTO_1397 ) ( AIRPLANE-AT ?AUTO_1397 ?AUTO_1396 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1395 ?AUTO_1397 ?AUTO_1396 )
      ( DELIVER-PKG-VERIFY ?AUTO_1395 ?AUTO_1396 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1400 - OBJ
      ?AUTO_1401 - LOCATION
    )
    :vars
    (
      ?AUTO_1404 - AIRPLANE
      ?AUTO_1406 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1400 ?AUTO_1404 ) ( AIRPORT ?AUTO_1406 ) ( AIRPORT ?AUTO_1401 ) ( AIRPLANE-AT ?AUTO_1404 ?AUTO_1406 ) ( not ( = ?AUTO_1406 ?AUTO_1401 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1404 ?AUTO_1406 ?AUTO_1401 )
      ( DELIVER-PKG ?AUTO_1400 ?AUTO_1401 )
      ( DELIVER-PKG-VERIFY ?AUTO_1400 ?AUTO_1401 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1408 - OBJ
      ?AUTO_1409 - LOCATION
    )
    :vars
    (
      ?AUTO_1413 - LOCATION
      ?AUTO_1412 - AIRPLANE
      ?AUTO_1415 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1413 ) ( AIRPORT ?AUTO_1409 ) ( AIRPLANE-AT ?AUTO_1412 ?AUTO_1413 ) ( not ( = ?AUTO_1413 ?AUTO_1409 ) ) ( OBJ-AT ?AUTO_1408 ?AUTO_1415 ) ( AIRPLANE-AT ?AUTO_1412 ?AUTO_1415 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1408 ?AUTO_1412 ?AUTO_1415 )
      ( DELIVER-PKG ?AUTO_1408 ?AUTO_1409 )
      ( DELIVER-PKG-VERIFY ?AUTO_1408 ?AUTO_1409 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1417 - OBJ
      ?AUTO_1418 - LOCATION
    )
    :vars
    (
      ?AUTO_1423 - LOCATION
      ?AUTO_1425 - LOCATION
      ?AUTO_1421 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1423 ) ( AIRPORT ?AUTO_1418 ) ( not ( = ?AUTO_1423 ?AUTO_1418 ) ) ( OBJ-AT ?AUTO_1417 ?AUTO_1423 ) ( AIRPORT ?AUTO_1425 ) ( AIRPLANE-AT ?AUTO_1421 ?AUTO_1425 ) ( not ( = ?AUTO_1425 ?AUTO_1423 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1421 ?AUTO_1425 ?AUTO_1423 )
      ( DELIVER-PKG ?AUTO_1417 ?AUTO_1418 )
      ( DELIVER-PKG-VERIFY ?AUTO_1417 ?AUTO_1418 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1447 - OBJ
      ?AUTO_1448 - LOCATION
    )
    :vars
    (
      ?AUTO_1449 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1447 ?AUTO_1449 ) ( AIRPLANE-AT ?AUTO_1449 ?AUTO_1448 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1447 ?AUTO_1449 ?AUTO_1448 )
      ( DELIVER-PKG-VERIFY ?AUTO_1447 ?AUTO_1448 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1452 - OBJ
      ?AUTO_1453 - LOCATION
    )
    :vars
    (
      ?AUTO_1456 - AIRPLANE
      ?AUTO_1458 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1452 ?AUTO_1456 ) ( AIRPORT ?AUTO_1458 ) ( AIRPORT ?AUTO_1453 ) ( AIRPLANE-AT ?AUTO_1456 ?AUTO_1458 ) ( not ( = ?AUTO_1458 ?AUTO_1453 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1456 ?AUTO_1458 ?AUTO_1453 )
      ( DELIVER-PKG ?AUTO_1452 ?AUTO_1453 )
      ( DELIVER-PKG-VERIFY ?AUTO_1452 ?AUTO_1453 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1480 - OBJ
      ?AUTO_1481 - LOCATION
    )
    :vars
    (
      ?AUTO_1483 - LOCATION
      ?AUTO_1484 - LOCATION
      ?AUTO_1485 - AIRPLANE
      ?AUTO_1487 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1483 ) ( AIRPORT ?AUTO_1481 ) ( not ( = ?AUTO_1483 ?AUTO_1481 ) ) ( AIRPORT ?AUTO_1484 ) ( AIRPLANE-AT ?AUTO_1485 ?AUTO_1484 ) ( not ( = ?AUTO_1484 ?AUTO_1483 ) ) ( TRUCK-AT ?AUTO_1487 ?AUTO_1483 ) ( IN-TRUCK ?AUTO_1480 ?AUTO_1487 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1480 ?AUTO_1487 ?AUTO_1483 )
      ( DELIVER-PKG ?AUTO_1480 ?AUTO_1481 )
      ( DELIVER-PKG-VERIFY ?AUTO_1480 ?AUTO_1481 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1490 - OBJ
      ?AUTO_1491 - LOCATION
    )
    :vars
    (
      ?AUTO_1494 - LOCATION
      ?AUTO_1496 - LOCATION
      ?AUTO_1495 - AIRPLANE
      ?AUTO_1497 - TRUCK
      ?AUTO_1500 - LOCATION
      ?AUTO_1499 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1494 ) ( AIRPORT ?AUTO_1491 ) ( not ( = ?AUTO_1494 ?AUTO_1491 ) ) ( AIRPORT ?AUTO_1496 ) ( AIRPLANE-AT ?AUTO_1495 ?AUTO_1496 ) ( not ( = ?AUTO_1496 ?AUTO_1494 ) ) ( IN-TRUCK ?AUTO_1490 ?AUTO_1497 ) ( TRUCK-AT ?AUTO_1497 ?AUTO_1500 ) ( IN-CITY ?AUTO_1500 ?AUTO_1499 ) ( IN-CITY ?AUTO_1494 ?AUTO_1499 ) ( not ( = ?AUTO_1494 ?AUTO_1500 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1497 ?AUTO_1500 ?AUTO_1494 ?AUTO_1499 )
      ( DELIVER-PKG ?AUTO_1490 ?AUTO_1491 )
      ( DELIVER-PKG-VERIFY ?AUTO_1490 ?AUTO_1491 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1502 - OBJ
      ?AUTO_1503 - LOCATION
    )
    :vars
    (
      ?AUTO_1509 - LOCATION
      ?AUTO_1505 - LOCATION
      ?AUTO_1510 - AIRPLANE
      ?AUTO_1508 - TRUCK
      ?AUTO_1511 - LOCATION
      ?AUTO_1504 - CITY
      ?AUTO_1513 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1509 ) ( AIRPORT ?AUTO_1503 ) ( not ( = ?AUTO_1509 ?AUTO_1503 ) ) ( AIRPORT ?AUTO_1505 ) ( AIRPLANE-AT ?AUTO_1510 ?AUTO_1505 ) ( not ( = ?AUTO_1505 ?AUTO_1509 ) ) ( TRUCK-AT ?AUTO_1508 ?AUTO_1511 ) ( IN-CITY ?AUTO_1511 ?AUTO_1504 ) ( IN-CITY ?AUTO_1509 ?AUTO_1504 ) ( not ( = ?AUTO_1509 ?AUTO_1511 ) ) ( TRUCK-AT ?AUTO_1508 ?AUTO_1513 ) ( OBJ-AT ?AUTO_1502 ?AUTO_1513 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1502 ?AUTO_1508 ?AUTO_1513 )
      ( DELIVER-PKG ?AUTO_1502 ?AUTO_1503 )
      ( DELIVER-PKG-VERIFY ?AUTO_1502 ?AUTO_1503 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1517 - OBJ
      ?AUTO_1518 - LOCATION
    )
    :vars
    (
      ?AUTO_1519 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_1517 ?AUTO_1519 ) ( AIRPLANE-AT ?AUTO_1519 ?AUTO_1518 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1517 ?AUTO_1519 ?AUTO_1518 )
      ( DELIVER-PKG-VERIFY ?AUTO_1517 ?AUTO_1518 ) )
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
      ?AUTO_1565 - OBJ
      ?AUTO_1566 - LOCATION
    )
    :vars
    (
      ?AUTO_1567 - TRUCK
      ?AUTO_1572 - LOCATION
      ?AUTO_1571 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1565 ?AUTO_1567 ) ( TRUCK-AT ?AUTO_1567 ?AUTO_1572 ) ( IN-CITY ?AUTO_1572 ?AUTO_1571 ) ( IN-CITY ?AUTO_1566 ?AUTO_1571 ) ( not ( = ?AUTO_1566 ?AUTO_1572 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1567 ?AUTO_1572 ?AUTO_1566 ?AUTO_1571 )
      ( DELIVER-PKG ?AUTO_1565 ?AUTO_1566 )
      ( DELIVER-PKG-VERIFY ?AUTO_1565 ?AUTO_1566 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1574 - OBJ
      ?AUTO_1575 - LOCATION
    )
    :vars
    (
      ?AUTO_1578 - TRUCK
      ?AUTO_1580 - LOCATION
      ?AUTO_1579 - CITY
      ?AUTO_1582 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1578 ?AUTO_1580 ) ( IN-CITY ?AUTO_1580 ?AUTO_1579 ) ( IN-CITY ?AUTO_1575 ?AUTO_1579 ) ( not ( = ?AUTO_1575 ?AUTO_1580 ) ) ( TRUCK-AT ?AUTO_1578 ?AUTO_1582 ) ( OBJ-AT ?AUTO_1574 ?AUTO_1582 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1574 ?AUTO_1578 ?AUTO_1582 )
      ( DELIVER-PKG ?AUTO_1574 ?AUTO_1575 )
      ( DELIVER-PKG-VERIFY ?AUTO_1574 ?AUTO_1575 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1584 - OBJ
      ?AUTO_1585 - LOCATION
    )
    :vars
    (
      ?AUTO_1588 - TRUCK
      ?AUTO_1590 - LOCATION
      ?AUTO_1589 - CITY
      ?AUTO_1591 - LOCATION
      ?AUTO_1592 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1588 ?AUTO_1590 ) ( IN-CITY ?AUTO_1590 ?AUTO_1589 ) ( IN-CITY ?AUTO_1585 ?AUTO_1589 ) ( not ( = ?AUTO_1585 ?AUTO_1590 ) ) ( TRUCK-AT ?AUTO_1588 ?AUTO_1591 ) ( IN-AIRPLANE ?AUTO_1584 ?AUTO_1592 ) ( AIRPLANE-AT ?AUTO_1592 ?AUTO_1591 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1584 ?AUTO_1592 ?AUTO_1591 )
      ( DELIVER-PKG ?AUTO_1584 ?AUTO_1585 )
      ( DELIVER-PKG-VERIFY ?AUTO_1584 ?AUTO_1585 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1595 - OBJ
      ?AUTO_1596 - LOCATION
    )
    :vars
    (
      ?AUTO_1603 - TRUCK
      ?AUTO_1598 - LOCATION
      ?AUTO_1600 - CITY
      ?AUTO_1602 - LOCATION
      ?AUTO_1597 - AIRPLANE
      ?AUTO_1605 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1603 ?AUTO_1598 ) ( IN-CITY ?AUTO_1598 ?AUTO_1600 ) ( IN-CITY ?AUTO_1596 ?AUTO_1600 ) ( not ( = ?AUTO_1596 ?AUTO_1598 ) ) ( TRUCK-AT ?AUTO_1603 ?AUTO_1602 ) ( IN-AIRPLANE ?AUTO_1595 ?AUTO_1597 ) ( AIRPORT ?AUTO_1605 ) ( AIRPORT ?AUTO_1602 ) ( AIRPLANE-AT ?AUTO_1597 ?AUTO_1605 ) ( not ( = ?AUTO_1605 ?AUTO_1602 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1597 ?AUTO_1605 ?AUTO_1602 )
      ( DELIVER-PKG ?AUTO_1595 ?AUTO_1596 )
      ( DELIVER-PKG-VERIFY ?AUTO_1595 ?AUTO_1596 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1619 - OBJ
      ?AUTO_1620 - LOCATION
    )
    :vars
    (
      ?AUTO_1624 - TRUCK
      ?AUTO_1623 - LOCATION
      ?AUTO_1622 - CITY
      ?AUTO_1628 - LOCATION
      ?AUTO_1626 - LOCATION
      ?AUTO_1625 - AIRPLANE
      ?AUTO_1630 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1624 ?AUTO_1623 ) ( IN-CITY ?AUTO_1623 ?AUTO_1622 ) ( IN-CITY ?AUTO_1620 ?AUTO_1622 ) ( not ( = ?AUTO_1620 ?AUTO_1623 ) ) ( TRUCK-AT ?AUTO_1624 ?AUTO_1628 ) ( AIRPORT ?AUTO_1626 ) ( AIRPORT ?AUTO_1628 ) ( AIRPLANE-AT ?AUTO_1625 ?AUTO_1626 ) ( not ( = ?AUTO_1626 ?AUTO_1628 ) ) ( OBJ-AT ?AUTO_1619 ?AUTO_1630 ) ( AIRPLANE-AT ?AUTO_1625 ?AUTO_1630 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1619 ?AUTO_1625 ?AUTO_1630 )
      ( DELIVER-PKG ?AUTO_1619 ?AUTO_1620 )
      ( DELIVER-PKG-VERIFY ?AUTO_1619 ?AUTO_1620 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1632 - OBJ
      ?AUTO_1633 - LOCATION
    )
    :vars
    (
      ?AUTO_1641 - TRUCK
      ?AUTO_1639 - LOCATION
      ?AUTO_1638 - CITY
      ?AUTO_1636 - LOCATION
      ?AUTO_1642 - LOCATION
      ?AUTO_1644 - LOCATION
      ?AUTO_1640 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1641 ?AUTO_1639 ) ( IN-CITY ?AUTO_1639 ?AUTO_1638 ) ( IN-CITY ?AUTO_1633 ?AUTO_1638 ) ( not ( = ?AUTO_1633 ?AUTO_1639 ) ) ( TRUCK-AT ?AUTO_1641 ?AUTO_1636 ) ( AIRPORT ?AUTO_1642 ) ( AIRPORT ?AUTO_1636 ) ( not ( = ?AUTO_1642 ?AUTO_1636 ) ) ( OBJ-AT ?AUTO_1632 ?AUTO_1642 ) ( AIRPORT ?AUTO_1644 ) ( AIRPLANE-AT ?AUTO_1640 ?AUTO_1644 ) ( not ( = ?AUTO_1644 ?AUTO_1642 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1640 ?AUTO_1644 ?AUTO_1642 )
      ( DELIVER-PKG ?AUTO_1632 ?AUTO_1633 )
      ( DELIVER-PKG-VERIFY ?AUTO_1632 ?AUTO_1633 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1646 - OBJ
      ?AUTO_1647 - LOCATION
    )
    :vars
    (
      ?AUTO_1655 - LOCATION
      ?AUTO_1652 - CITY
      ?AUTO_1653 - LOCATION
      ?AUTO_1656 - LOCATION
      ?AUTO_1648 - AIRPLANE
      ?AUTO_1651 - TRUCK
      ?AUTO_1659 - LOCATION
      ?AUTO_1658 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1655 ?AUTO_1652 ) ( IN-CITY ?AUTO_1647 ?AUTO_1652 ) ( not ( = ?AUTO_1647 ?AUTO_1655 ) ) ( AIRPORT ?AUTO_1653 ) ( AIRPORT ?AUTO_1655 ) ( not ( = ?AUTO_1653 ?AUTO_1655 ) ) ( OBJ-AT ?AUTO_1646 ?AUTO_1653 ) ( AIRPORT ?AUTO_1656 ) ( AIRPLANE-AT ?AUTO_1648 ?AUTO_1656 ) ( not ( = ?AUTO_1656 ?AUTO_1653 ) ) ( TRUCK-AT ?AUTO_1651 ?AUTO_1659 ) ( IN-CITY ?AUTO_1659 ?AUTO_1658 ) ( IN-CITY ?AUTO_1655 ?AUTO_1658 ) ( not ( = ?AUTO_1655 ?AUTO_1659 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1651 ?AUTO_1659 ?AUTO_1655 ?AUTO_1658 )
      ( DELIVER-PKG ?AUTO_1646 ?AUTO_1647 )
      ( DELIVER-PKG-VERIFY ?AUTO_1646 ?AUTO_1647 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1663 - OBJ
      ?AUTO_1664 - LOCATION
    )
    :vars
    (
      ?AUTO_1669 - LOCATION
      ?AUTO_1670 - CITY
      ?AUTO_1667 - LOCATION
      ?AUTO_1672 - LOCATION
      ?AUTO_1674 - AIRPLANE
      ?AUTO_1665 - TRUCK
      ?AUTO_1673 - LOCATION
      ?AUTO_1668 - CITY
      ?AUTO_1675 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1669 ?AUTO_1670 ) ( IN-CITY ?AUTO_1664 ?AUTO_1670 ) ( not ( = ?AUTO_1664 ?AUTO_1669 ) ) ( AIRPORT ?AUTO_1667 ) ( AIRPORT ?AUTO_1669 ) ( not ( = ?AUTO_1667 ?AUTO_1669 ) ) ( AIRPORT ?AUTO_1672 ) ( AIRPLANE-AT ?AUTO_1674 ?AUTO_1672 ) ( not ( = ?AUTO_1672 ?AUTO_1667 ) ) ( TRUCK-AT ?AUTO_1665 ?AUTO_1673 ) ( IN-CITY ?AUTO_1673 ?AUTO_1668 ) ( IN-CITY ?AUTO_1669 ?AUTO_1668 ) ( not ( = ?AUTO_1669 ?AUTO_1673 ) ) ( TRUCK-AT ?AUTO_1675 ?AUTO_1667 ) ( IN-TRUCK ?AUTO_1663 ?AUTO_1675 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1663 ?AUTO_1675 ?AUTO_1667 )
      ( DELIVER-PKG ?AUTO_1663 ?AUTO_1664 )
      ( DELIVER-PKG-VERIFY ?AUTO_1663 ?AUTO_1664 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1678 - OBJ
      ?AUTO_1679 - LOCATION
    )
    :vars
    (
      ?AUTO_1689 - LOCATION
      ?AUTO_1685 - CITY
      ?AUTO_1688 - LOCATION
      ?AUTO_1681 - LOCATION
      ?AUTO_1686 - AIRPLANE
      ?AUTO_1683 - TRUCK
      ?AUTO_1687 - LOCATION
      ?AUTO_1690 - CITY
      ?AUTO_1682 - TRUCK
      ?AUTO_1693 - LOCATION
      ?AUTO_1692 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1689 ?AUTO_1685 ) ( IN-CITY ?AUTO_1679 ?AUTO_1685 ) ( not ( = ?AUTO_1679 ?AUTO_1689 ) ) ( AIRPORT ?AUTO_1688 ) ( AIRPORT ?AUTO_1689 ) ( not ( = ?AUTO_1688 ?AUTO_1689 ) ) ( AIRPORT ?AUTO_1681 ) ( AIRPLANE-AT ?AUTO_1686 ?AUTO_1681 ) ( not ( = ?AUTO_1681 ?AUTO_1688 ) ) ( TRUCK-AT ?AUTO_1683 ?AUTO_1687 ) ( IN-CITY ?AUTO_1687 ?AUTO_1690 ) ( IN-CITY ?AUTO_1689 ?AUTO_1690 ) ( not ( = ?AUTO_1689 ?AUTO_1687 ) ) ( IN-TRUCK ?AUTO_1678 ?AUTO_1682 ) ( TRUCK-AT ?AUTO_1682 ?AUTO_1693 ) ( IN-CITY ?AUTO_1693 ?AUTO_1692 ) ( IN-CITY ?AUTO_1688 ?AUTO_1692 ) ( not ( = ?AUTO_1688 ?AUTO_1693 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1682 ?AUTO_1693 ?AUTO_1688 ?AUTO_1692 )
      ( DELIVER-PKG ?AUTO_1678 ?AUTO_1679 )
      ( DELIVER-PKG-VERIFY ?AUTO_1678 ?AUTO_1679 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1695 - OBJ
      ?AUTO_1696 - LOCATION
    )
    :vars
    (
      ?AUTO_1697 - LOCATION
      ?AUTO_1702 - CITY
      ?AUTO_1699 - LOCATION
      ?AUTO_1698 - LOCATION
      ?AUTO_1704 - AIRPLANE
      ?AUTO_1705 - TRUCK
      ?AUTO_1708 - LOCATION
      ?AUTO_1707 - CITY
      ?AUTO_1706 - TRUCK
      ?AUTO_1709 - LOCATION
      ?AUTO_1703 - CITY
      ?AUTO_1711 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1697 ?AUTO_1702 ) ( IN-CITY ?AUTO_1696 ?AUTO_1702 ) ( not ( = ?AUTO_1696 ?AUTO_1697 ) ) ( AIRPORT ?AUTO_1699 ) ( AIRPORT ?AUTO_1697 ) ( not ( = ?AUTO_1699 ?AUTO_1697 ) ) ( AIRPORT ?AUTO_1698 ) ( AIRPLANE-AT ?AUTO_1704 ?AUTO_1698 ) ( not ( = ?AUTO_1698 ?AUTO_1699 ) ) ( TRUCK-AT ?AUTO_1705 ?AUTO_1708 ) ( IN-CITY ?AUTO_1708 ?AUTO_1707 ) ( IN-CITY ?AUTO_1697 ?AUTO_1707 ) ( not ( = ?AUTO_1697 ?AUTO_1708 ) ) ( TRUCK-AT ?AUTO_1706 ?AUTO_1709 ) ( IN-CITY ?AUTO_1709 ?AUTO_1703 ) ( IN-CITY ?AUTO_1699 ?AUTO_1703 ) ( not ( = ?AUTO_1699 ?AUTO_1709 ) ) ( TRUCK-AT ?AUTO_1706 ?AUTO_1711 ) ( OBJ-AT ?AUTO_1695 ?AUTO_1711 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1695 ?AUTO_1706 ?AUTO_1711 )
      ( DELIVER-PKG ?AUTO_1695 ?AUTO_1696 )
      ( DELIVER-PKG-VERIFY ?AUTO_1695 ?AUTO_1696 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1715 - OBJ
      ?AUTO_1716 - LOCATION
    )
    :vars
    (
      ?AUTO_1717 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1717 ?AUTO_1716 ) ( IN-TRUCK ?AUTO_1715 ?AUTO_1717 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1715 ?AUTO_1717 ?AUTO_1716 )
      ( DELIVER-PKG-VERIFY ?AUTO_1715 ?AUTO_1716 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1720 - OBJ
      ?AUTO_1721 - LOCATION
    )
    :vars
    (
      ?AUTO_1722 - TRUCK
      ?AUTO_1727 - LOCATION
      ?AUTO_1726 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1720 ?AUTO_1722 ) ( TRUCK-AT ?AUTO_1722 ?AUTO_1727 ) ( IN-CITY ?AUTO_1727 ?AUTO_1726 ) ( IN-CITY ?AUTO_1721 ?AUTO_1726 ) ( not ( = ?AUTO_1721 ?AUTO_1727 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1722 ?AUTO_1727 ?AUTO_1721 ?AUTO_1726 )
      ( DELIVER-PKG ?AUTO_1720 ?AUTO_1721 )
      ( DELIVER-PKG-VERIFY ?AUTO_1720 ?AUTO_1721 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1731 - OBJ
      ?AUTO_1732 - LOCATION
    )
    :vars
    (
      ?AUTO_1734 - TRUCK
      ?AUTO_1735 - LOCATION
      ?AUTO_1736 - CITY
      ?AUTO_1739 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1734 ?AUTO_1735 ) ( IN-CITY ?AUTO_1735 ?AUTO_1736 ) ( IN-CITY ?AUTO_1732 ?AUTO_1736 ) ( not ( = ?AUTO_1732 ?AUTO_1735 ) ) ( TRUCK-AT ?AUTO_1734 ?AUTO_1739 ) ( OBJ-AT ?AUTO_1731 ?AUTO_1739 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1731 ?AUTO_1734 ?AUTO_1739 )
      ( DELIVER-PKG ?AUTO_1731 ?AUTO_1732 )
      ( DELIVER-PKG-VERIFY ?AUTO_1731 ?AUTO_1732 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1741 - OBJ
      ?AUTO_1742 - LOCATION
    )
    :vars
    (
      ?AUTO_1748 - LOCATION
      ?AUTO_1747 - CITY
      ?AUTO_1746 - TRUCK
      ?AUTO_1751 - LOCATION
      ?AUTO_1750 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1748 ?AUTO_1747 ) ( IN-CITY ?AUTO_1742 ?AUTO_1747 ) ( not ( = ?AUTO_1742 ?AUTO_1748 ) ) ( OBJ-AT ?AUTO_1741 ?AUTO_1748 ) ( TRUCK-AT ?AUTO_1746 ?AUTO_1751 ) ( IN-CITY ?AUTO_1751 ?AUTO_1750 ) ( IN-CITY ?AUTO_1748 ?AUTO_1750 ) ( not ( = ?AUTO_1748 ?AUTO_1751 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1746 ?AUTO_1751 ?AUTO_1748 ?AUTO_1750 )
      ( DELIVER-PKG ?AUTO_1741 ?AUTO_1742 )
      ( DELIVER-PKG-VERIFY ?AUTO_1741 ?AUTO_1742 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1793 - OBJ
      ?AUTO_1794 - LOCATION
    )
    :vars
    (
      ?AUTO_1795 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1795 ?AUTO_1794 ) ( IN-TRUCK ?AUTO_1793 ?AUTO_1795 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1793 ?AUTO_1795 ?AUTO_1794 )
      ( DELIVER-PKG-VERIFY ?AUTO_1793 ?AUTO_1794 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1802 - OBJ
      ?AUTO_1803 - LOCATION
    )
    :vars
    (
      ?AUTO_1807 - TRUCK
      ?AUTO_1806 - LOCATION
      ?AUTO_1804 - CITY
      ?AUTO_1810 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1807 ?AUTO_1806 ) ( IN-CITY ?AUTO_1806 ?AUTO_1804 ) ( IN-CITY ?AUTO_1803 ?AUTO_1804 ) ( not ( = ?AUTO_1803 ?AUTO_1806 ) ) ( TRUCK-AT ?AUTO_1807 ?AUTO_1810 ) ( OBJ-AT ?AUTO_1802 ?AUTO_1810 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1802 ?AUTO_1807 ?AUTO_1810 )
      ( DELIVER-PKG ?AUTO_1802 ?AUTO_1803 )
      ( DELIVER-PKG-VERIFY ?AUTO_1802 ?AUTO_1803 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1856 - OBJ
      ?AUTO_1857 - LOCATION
    )
    :vars
    (
      ?AUTO_1858 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1858 ?AUTO_1857 ) ( IN-TRUCK ?AUTO_1856 ?AUTO_1858 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1856 ?AUTO_1858 ?AUTO_1857 )
      ( DELIVER-PKG-VERIFY ?AUTO_1856 ?AUTO_1857 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1861 - OBJ
      ?AUTO_1862 - LOCATION
    )
    :vars
    (
      ?AUTO_1865 - TRUCK
      ?AUTO_1868 - LOCATION
      ?AUTO_1867 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1861 ?AUTO_1865 ) ( TRUCK-AT ?AUTO_1865 ?AUTO_1868 ) ( IN-CITY ?AUTO_1868 ?AUTO_1867 ) ( IN-CITY ?AUTO_1862 ?AUTO_1867 ) ( not ( = ?AUTO_1862 ?AUTO_1868 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1865 ?AUTO_1868 ?AUTO_1862 ?AUTO_1867 )
      ( DELIVER-PKG ?AUTO_1861 ?AUTO_1862 )
      ( DELIVER-PKG-VERIFY ?AUTO_1861 ?AUTO_1862 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1922 - OBJ
      ?AUTO_1923 - LOCATION
    )
    :vars
    (
      ?AUTO_1924 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1924 ?AUTO_1923 ) ( IN-TRUCK ?AUTO_1922 ?AUTO_1924 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1922 ?AUTO_1924 ?AUTO_1923 )
      ( DELIVER-PKG-VERIFY ?AUTO_1922 ?AUTO_1923 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1937 - OBJ
      ?AUTO_1938 - LOCATION
    )
    :vars
    (
      ?AUTO_1939 - TRUCK
      ?AUTO_1944 - LOCATION
      ?AUTO_1943 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_1937 ?AUTO_1939 ) ( TRUCK-AT ?AUTO_1939 ?AUTO_1944 ) ( IN-CITY ?AUTO_1944 ?AUTO_1943 ) ( IN-CITY ?AUTO_1938 ?AUTO_1943 ) ( not ( = ?AUTO_1938 ?AUTO_1944 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1939 ?AUTO_1944 ?AUTO_1938 ?AUTO_1943 )
      ( DELIVER-PKG ?AUTO_1937 ?AUTO_1938 )
      ( DELIVER-PKG-VERIFY ?AUTO_1937 ?AUTO_1938 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1946 - OBJ
      ?AUTO_1947 - LOCATION
    )
    :vars
    (
      ?AUTO_1950 - TRUCK
      ?AUTO_1952 - LOCATION
      ?AUTO_1951 - CITY
      ?AUTO_1954 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1950 ?AUTO_1952 ) ( IN-CITY ?AUTO_1952 ?AUTO_1951 ) ( IN-CITY ?AUTO_1947 ?AUTO_1951 ) ( not ( = ?AUTO_1947 ?AUTO_1952 ) ) ( TRUCK-AT ?AUTO_1950 ?AUTO_1954 ) ( OBJ-AT ?AUTO_1946 ?AUTO_1954 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1946 ?AUTO_1950 ?AUTO_1954 )
      ( DELIVER-PKG ?AUTO_1946 ?AUTO_1947 )
      ( DELIVER-PKG-VERIFY ?AUTO_1946 ?AUTO_1947 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1958 - OBJ
      ?AUTO_1959 - LOCATION
    )
    :vars
    (
      ?AUTO_1961 - LOCATION
      ?AUTO_1964 - CITY
      ?AUTO_1963 - TRUCK
      ?AUTO_1968 - LOCATION
      ?AUTO_1967 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1961 ?AUTO_1964 ) ( IN-CITY ?AUTO_1959 ?AUTO_1964 ) ( not ( = ?AUTO_1959 ?AUTO_1961 ) ) ( OBJ-AT ?AUTO_1958 ?AUTO_1961 ) ( TRUCK-AT ?AUTO_1963 ?AUTO_1968 ) ( IN-CITY ?AUTO_1968 ?AUTO_1967 ) ( IN-CITY ?AUTO_1961 ?AUTO_1967 ) ( not ( = ?AUTO_1961 ?AUTO_1968 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1963 ?AUTO_1968 ?AUTO_1961 ?AUTO_1967 )
      ( DELIVER-PKG ?AUTO_1958 ?AUTO_1959 )
      ( DELIVER-PKG-VERIFY ?AUTO_1958 ?AUTO_1959 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1984 - OBJ
      ?AUTO_1985 - LOCATION
    )
    :vars
    (
      ?AUTO_1987 - LOCATION
      ?AUTO_1986 - CITY
      ?AUTO_1988 - TRUCK
      ?AUTO_1990 - LOCATION
      ?AUTO_1991 - CITY
      ?AUTO_1993 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1987 ?AUTO_1986 ) ( IN-CITY ?AUTO_1985 ?AUTO_1986 ) ( not ( = ?AUTO_1985 ?AUTO_1987 ) ) ( TRUCK-AT ?AUTO_1988 ?AUTO_1990 ) ( IN-CITY ?AUTO_1990 ?AUTO_1991 ) ( IN-CITY ?AUTO_1987 ?AUTO_1991 ) ( not ( = ?AUTO_1987 ?AUTO_1990 ) ) ( IN-AIRPLANE ?AUTO_1984 ?AUTO_1993 ) ( AIRPLANE-AT ?AUTO_1993 ?AUTO_1987 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1984 ?AUTO_1993 ?AUTO_1987 )
      ( DELIVER-PKG ?AUTO_1984 ?AUTO_1985 )
      ( DELIVER-PKG-VERIFY ?AUTO_1984 ?AUTO_1985 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2012 - OBJ
      ?AUTO_2013 - LOCATION
    )
    :vars
    (
      ?AUTO_2016 - TRUCK
      ?AUTO_2019 - LOCATION
      ?AUTO_2014 - CITY
      ?AUTO_2020 - LOCATION
      ?AUTO_2017 - LOCATION
      ?AUTO_2015 - AIRPLANE
      ?AUTO_2023 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2016 ?AUTO_2019 ) ( IN-CITY ?AUTO_2019 ?AUTO_2014 ) ( IN-CITY ?AUTO_2013 ?AUTO_2014 ) ( not ( = ?AUTO_2013 ?AUTO_2019 ) ) ( TRUCK-AT ?AUTO_2016 ?AUTO_2020 ) ( AIRPORT ?AUTO_2017 ) ( AIRPORT ?AUTO_2020 ) ( AIRPLANE-AT ?AUTO_2015 ?AUTO_2017 ) ( not ( = ?AUTO_2017 ?AUTO_2020 ) ) ( OBJ-AT ?AUTO_2012 ?AUTO_2023 ) ( AIRPLANE-AT ?AUTO_2015 ?AUTO_2023 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2012 ?AUTO_2015 ?AUTO_2023 )
      ( DELIVER-PKG ?AUTO_2012 ?AUTO_2013 )
      ( DELIVER-PKG-VERIFY ?AUTO_2012 ?AUTO_2013 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2025 - OBJ
      ?AUTO_2026 - LOCATION
    )
    :vars
    (
      ?AUTO_2033 - TRUCK
      ?AUTO_2030 - LOCATION
      ?AUTO_2032 - CITY
      ?AUTO_2031 - LOCATION
      ?AUTO_2035 - LOCATION
      ?AUTO_2037 - LOCATION
      ?AUTO_2029 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2033 ?AUTO_2030 ) ( IN-CITY ?AUTO_2030 ?AUTO_2032 ) ( IN-CITY ?AUTO_2026 ?AUTO_2032 ) ( not ( = ?AUTO_2026 ?AUTO_2030 ) ) ( TRUCK-AT ?AUTO_2033 ?AUTO_2031 ) ( AIRPORT ?AUTO_2035 ) ( AIRPORT ?AUTO_2031 ) ( not ( = ?AUTO_2035 ?AUTO_2031 ) ) ( OBJ-AT ?AUTO_2025 ?AUTO_2035 ) ( AIRPORT ?AUTO_2037 ) ( AIRPLANE-AT ?AUTO_2029 ?AUTO_2037 ) ( not ( = ?AUTO_2037 ?AUTO_2035 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2029 ?AUTO_2037 ?AUTO_2035 )
      ( DELIVER-PKG ?AUTO_2025 ?AUTO_2026 )
      ( DELIVER-PKG-VERIFY ?AUTO_2025 ?AUTO_2026 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2055 - OBJ
      ?AUTO_2056 - LOCATION
    )
    :vars
    (
      ?AUTO_2057 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2055 ?AUTO_2057 ) ( AIRPLANE-AT ?AUTO_2057 ?AUTO_2056 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2055 ?AUTO_2057 ?AUTO_2056 )
      ( DELIVER-PKG-VERIFY ?AUTO_2055 ?AUTO_2056 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2062 - OBJ
      ?AUTO_2063 - LOCATION
    )
    :vars
    (
      ?AUTO_2064 - AIRPLANE
      ?AUTO_2068 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2062 ?AUTO_2064 ) ( AIRPORT ?AUTO_2068 ) ( AIRPORT ?AUTO_2063 ) ( AIRPLANE-AT ?AUTO_2064 ?AUTO_2068 ) ( not ( = ?AUTO_2068 ?AUTO_2063 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2064 ?AUTO_2068 ?AUTO_2063 )
      ( DELIVER-PKG ?AUTO_2062 ?AUTO_2063 )
      ( DELIVER-PKG-VERIFY ?AUTO_2062 ?AUTO_2063 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2076 - OBJ
      ?AUTO_2077 - LOCATION
    )
    :vars
    (
      ?AUTO_2080 - LOCATION
      ?AUTO_2078 - AIRPLANE
      ?AUTO_2083 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2080 ) ( AIRPORT ?AUTO_2077 ) ( AIRPLANE-AT ?AUTO_2078 ?AUTO_2080 ) ( not ( = ?AUTO_2080 ?AUTO_2077 ) ) ( OBJ-AT ?AUTO_2076 ?AUTO_2083 ) ( AIRPLANE-AT ?AUTO_2078 ?AUTO_2083 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2076 ?AUTO_2078 ?AUTO_2083 )
      ( DELIVER-PKG ?AUTO_2076 ?AUTO_2077 )
      ( DELIVER-PKG-VERIFY ?AUTO_2076 ?AUTO_2077 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2089 - OBJ
      ?AUTO_2090 - LOCATION
    )
    :vars
    (
      ?AUTO_2095 - LOCATION
      ?AUTO_2091 - AIRPLANE
      ?AUTO_2092 - LOCATION
      ?AUTO_2096 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2095 ) ( AIRPORT ?AUTO_2090 ) ( AIRPLANE-AT ?AUTO_2091 ?AUTO_2095 ) ( not ( = ?AUTO_2095 ?AUTO_2090 ) ) ( AIRPLANE-AT ?AUTO_2091 ?AUTO_2092 ) ( TRUCK-AT ?AUTO_2096 ?AUTO_2092 ) ( IN-TRUCK ?AUTO_2089 ?AUTO_2096 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2089 ?AUTO_2096 ?AUTO_2092 )
      ( DELIVER-PKG ?AUTO_2089 ?AUTO_2090 )
      ( DELIVER-PKG-VERIFY ?AUTO_2089 ?AUTO_2090 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2099 - OBJ
      ?AUTO_2100 - LOCATION
    )
    :vars
    (
      ?AUTO_2105 - LOCATION
      ?AUTO_2103 - AIRPLANE
      ?AUTO_2104 - LOCATION
      ?AUTO_2106 - TRUCK
      ?AUTO_2109 - LOCATION
      ?AUTO_2108 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2105 ) ( AIRPORT ?AUTO_2100 ) ( AIRPLANE-AT ?AUTO_2103 ?AUTO_2105 ) ( not ( = ?AUTO_2105 ?AUTO_2100 ) ) ( AIRPLANE-AT ?AUTO_2103 ?AUTO_2104 ) ( IN-TRUCK ?AUTO_2099 ?AUTO_2106 ) ( TRUCK-AT ?AUTO_2106 ?AUTO_2109 ) ( IN-CITY ?AUTO_2109 ?AUTO_2108 ) ( IN-CITY ?AUTO_2104 ?AUTO_2108 ) ( not ( = ?AUTO_2104 ?AUTO_2109 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2106 ?AUTO_2109 ?AUTO_2104 ?AUTO_2108 )
      ( DELIVER-PKG ?AUTO_2099 ?AUTO_2100 )
      ( DELIVER-PKG-VERIFY ?AUTO_2099 ?AUTO_2100 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2133 - OBJ
      ?AUTO_2134 - LOCATION
    )
    :vars
    (
      ?AUTO_2138 - LOCATION
      ?AUTO_2136 - TRUCK
      ?AUTO_2140 - LOCATION
      ?AUTO_2142 - CITY
      ?AUTO_2144 - LOCATION
      ?AUTO_2139 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2138 ) ( AIRPORT ?AUTO_2134 ) ( not ( = ?AUTO_2138 ?AUTO_2134 ) ) ( IN-TRUCK ?AUTO_2133 ?AUTO_2136 ) ( TRUCK-AT ?AUTO_2136 ?AUTO_2140 ) ( IN-CITY ?AUTO_2140 ?AUTO_2142 ) ( IN-CITY ?AUTO_2138 ?AUTO_2142 ) ( not ( = ?AUTO_2138 ?AUTO_2140 ) ) ( AIRPORT ?AUTO_2144 ) ( AIRPLANE-AT ?AUTO_2139 ?AUTO_2144 ) ( not ( = ?AUTO_2144 ?AUTO_2138 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2139 ?AUTO_2144 ?AUTO_2138 )
      ( DELIVER-PKG ?AUTO_2133 ?AUTO_2134 )
      ( DELIVER-PKG-VERIFY ?AUTO_2133 ?AUTO_2134 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2164 - OBJ
      ?AUTO_2165 - LOCATION
    )
    :vars
    (
      ?AUTO_2167 - LOCATION
      ?AUTO_2172 - TRUCK
      ?AUTO_2170 - LOCATION
      ?AUTO_2168 - CITY
      ?AUTO_2171 - LOCATION
      ?AUTO_2169 - AIRPLANE
      ?AUTO_2175 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2167 ) ( AIRPORT ?AUTO_2165 ) ( not ( = ?AUTO_2167 ?AUTO_2165 ) ) ( TRUCK-AT ?AUTO_2172 ?AUTO_2170 ) ( IN-CITY ?AUTO_2170 ?AUTO_2168 ) ( IN-CITY ?AUTO_2167 ?AUTO_2168 ) ( not ( = ?AUTO_2167 ?AUTO_2170 ) ) ( AIRPORT ?AUTO_2171 ) ( AIRPLANE-AT ?AUTO_2169 ?AUTO_2171 ) ( not ( = ?AUTO_2171 ?AUTO_2167 ) ) ( TRUCK-AT ?AUTO_2172 ?AUTO_2175 ) ( OBJ-AT ?AUTO_2164 ?AUTO_2175 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2164 ?AUTO_2172 ?AUTO_2175 )
      ( DELIVER-PKG ?AUTO_2164 ?AUTO_2165 )
      ( DELIVER-PKG-VERIFY ?AUTO_2164 ?AUTO_2165 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2185 - OBJ
      ?AUTO_2186 - LOCATION
    )
    :vars
    (
      ?AUTO_2187 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2185 ?AUTO_2187 ) ( AIRPLANE-AT ?AUTO_2187 ?AUTO_2186 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2185 ?AUTO_2187 ?AUTO_2186 )
      ( DELIVER-PKG-VERIFY ?AUTO_2185 ?AUTO_2186 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2190 - OBJ
      ?AUTO_2191 - LOCATION
    )
    :vars
    (
      ?AUTO_2192 - AIRPLANE
      ?AUTO_2196 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2190 ?AUTO_2192 ) ( AIRPORT ?AUTO_2196 ) ( AIRPORT ?AUTO_2191 ) ( AIRPLANE-AT ?AUTO_2192 ?AUTO_2196 ) ( not ( = ?AUTO_2196 ?AUTO_2191 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2192 ?AUTO_2196 ?AUTO_2191 )
      ( DELIVER-PKG ?AUTO_2190 ?AUTO_2191 )
      ( DELIVER-PKG-VERIFY ?AUTO_2190 ?AUTO_2191 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2206 - OBJ
      ?AUTO_2207 - LOCATION
    )
    :vars
    (
      ?AUTO_2208 - LOCATION
      ?AUTO_2211 - AIRPLANE
      ?AUTO_2213 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2208 ) ( AIRPORT ?AUTO_2207 ) ( AIRPLANE-AT ?AUTO_2211 ?AUTO_2208 ) ( not ( = ?AUTO_2208 ?AUTO_2207 ) ) ( OBJ-AT ?AUTO_2206 ?AUTO_2213 ) ( AIRPLANE-AT ?AUTO_2211 ?AUTO_2213 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2206 ?AUTO_2211 ?AUTO_2213 )
      ( DELIVER-PKG ?AUTO_2206 ?AUTO_2207 )
      ( DELIVER-PKG-VERIFY ?AUTO_2206 ?AUTO_2207 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2215 - OBJ
      ?AUTO_2216 - LOCATION
    )
    :vars
    (
      ?AUTO_2221 - LOCATION
      ?AUTO_2223 - LOCATION
      ?AUTO_2220 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2221 ) ( AIRPORT ?AUTO_2216 ) ( not ( = ?AUTO_2221 ?AUTO_2216 ) ) ( OBJ-AT ?AUTO_2215 ?AUTO_2221 ) ( AIRPORT ?AUTO_2223 ) ( AIRPLANE-AT ?AUTO_2220 ?AUTO_2223 ) ( not ( = ?AUTO_2223 ?AUTO_2221 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2220 ?AUTO_2223 ?AUTO_2221 )
      ( DELIVER-PKG ?AUTO_2215 ?AUTO_2216 )
      ( DELIVER-PKG-VERIFY ?AUTO_2215 ?AUTO_2216 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2237 - OBJ
      ?AUTO_2238 - LOCATION
    )
    :vars
    (
      ?AUTO_2239 - LOCATION
      ?AUTO_2243 - LOCATION
      ?AUTO_2241 - AIRPLANE
      ?AUTO_2244 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2239 ) ( AIRPORT ?AUTO_2238 ) ( not ( = ?AUTO_2239 ?AUTO_2238 ) ) ( AIRPORT ?AUTO_2243 ) ( AIRPLANE-AT ?AUTO_2241 ?AUTO_2243 ) ( not ( = ?AUTO_2243 ?AUTO_2239 ) ) ( TRUCK-AT ?AUTO_2244 ?AUTO_2239 ) ( IN-TRUCK ?AUTO_2237 ?AUTO_2244 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2237 ?AUTO_2244 ?AUTO_2239 )
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
      ?AUTO_2254 - LOCATION
      ?AUTO_2251 - LOCATION
      ?AUTO_2252 - AIRPLANE
      ?AUTO_2253 - TRUCK
      ?AUTO_2257 - LOCATION
      ?AUTO_2256 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2254 ) ( AIRPORT ?AUTO_2248 ) ( not ( = ?AUTO_2254 ?AUTO_2248 ) ) ( AIRPORT ?AUTO_2251 ) ( AIRPLANE-AT ?AUTO_2252 ?AUTO_2251 ) ( not ( = ?AUTO_2251 ?AUTO_2254 ) ) ( IN-TRUCK ?AUTO_2247 ?AUTO_2253 ) ( TRUCK-AT ?AUTO_2253 ?AUTO_2257 ) ( IN-CITY ?AUTO_2257 ?AUTO_2256 ) ( IN-CITY ?AUTO_2254 ?AUTO_2256 ) ( not ( = ?AUTO_2254 ?AUTO_2257 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2253 ?AUTO_2257 ?AUTO_2254 ?AUTO_2256 )
      ( DELIVER-PKG ?AUTO_2247 ?AUTO_2248 )
      ( DELIVER-PKG-VERIFY ?AUTO_2247 ?AUTO_2248 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2261 - OBJ
      ?AUTO_2262 - LOCATION
    )
    :vars
    (
      ?AUTO_2266 - LOCATION
      ?AUTO_2263 - LOCATION
      ?AUTO_2265 - AIRPLANE
      ?AUTO_2270 - TRUCK
      ?AUTO_2267 - LOCATION
      ?AUTO_2269 - CITY
      ?AUTO_2272 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2266 ) ( AIRPORT ?AUTO_2262 ) ( not ( = ?AUTO_2266 ?AUTO_2262 ) ) ( AIRPORT ?AUTO_2263 ) ( AIRPLANE-AT ?AUTO_2265 ?AUTO_2263 ) ( not ( = ?AUTO_2263 ?AUTO_2266 ) ) ( TRUCK-AT ?AUTO_2270 ?AUTO_2267 ) ( IN-CITY ?AUTO_2267 ?AUTO_2269 ) ( IN-CITY ?AUTO_2266 ?AUTO_2269 ) ( not ( = ?AUTO_2266 ?AUTO_2267 ) ) ( TRUCK-AT ?AUTO_2270 ?AUTO_2272 ) ( OBJ-AT ?AUTO_2261 ?AUTO_2272 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2261 ?AUTO_2270 ?AUTO_2272 )
      ( DELIVER-PKG ?AUTO_2261 ?AUTO_2262 )
      ( DELIVER-PKG-VERIFY ?AUTO_2261 ?AUTO_2262 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2274 - OBJ
      ?AUTO_2275 - LOCATION
    )
    :vars
    (
      ?AUTO_2279 - LOCATION
      ?AUTO_2281 - LOCATION
      ?AUTO_2280 - AIRPLANE
      ?AUTO_2284 - LOCATION
      ?AUTO_2283 - CITY
      ?AUTO_2282 - TRUCK
      ?AUTO_2287 - LOCATION
      ?AUTO_2286 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2279 ) ( AIRPORT ?AUTO_2275 ) ( not ( = ?AUTO_2279 ?AUTO_2275 ) ) ( AIRPORT ?AUTO_2281 ) ( AIRPLANE-AT ?AUTO_2280 ?AUTO_2281 ) ( not ( = ?AUTO_2281 ?AUTO_2279 ) ) ( IN-CITY ?AUTO_2284 ?AUTO_2283 ) ( IN-CITY ?AUTO_2279 ?AUTO_2283 ) ( not ( = ?AUTO_2279 ?AUTO_2284 ) ) ( OBJ-AT ?AUTO_2274 ?AUTO_2284 ) ( TRUCK-AT ?AUTO_2282 ?AUTO_2287 ) ( IN-CITY ?AUTO_2287 ?AUTO_2286 ) ( IN-CITY ?AUTO_2284 ?AUTO_2286 ) ( not ( = ?AUTO_2284 ?AUTO_2287 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2282 ?AUTO_2287 ?AUTO_2284 ?AUTO_2286 )
      ( DELIVER-PKG ?AUTO_2274 ?AUTO_2275 )
      ( DELIVER-PKG-VERIFY ?AUTO_2274 ?AUTO_2275 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2329 - OBJ
      ?AUTO_2330 - LOCATION
    )
    :vars
    (
      ?AUTO_2331 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2331 ?AUTO_2330 ) ( IN-TRUCK ?AUTO_2329 ?AUTO_2331 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2329 ?AUTO_2331 ?AUTO_2330 )
      ( DELIVER-PKG-VERIFY ?AUTO_2329 ?AUTO_2330 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2334 - OBJ
      ?AUTO_2335 - LOCATION
    )
    :vars
    (
      ?AUTO_2338 - TRUCK
      ?AUTO_2341 - LOCATION
      ?AUTO_2340 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2334 ?AUTO_2338 ) ( TRUCK-AT ?AUTO_2338 ?AUTO_2341 ) ( IN-CITY ?AUTO_2341 ?AUTO_2340 ) ( IN-CITY ?AUTO_2335 ?AUTO_2340 ) ( not ( = ?AUTO_2335 ?AUTO_2341 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2338 ?AUTO_2341 ?AUTO_2335 ?AUTO_2340 )
      ( DELIVER-PKG ?AUTO_2334 ?AUTO_2335 )
      ( DELIVER-PKG-VERIFY ?AUTO_2334 ?AUTO_2335 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2343 - OBJ
      ?AUTO_2344 - LOCATION
    )
    :vars
    (
      ?AUTO_2346 - TRUCK
      ?AUTO_2349 - LOCATION
      ?AUTO_2348 - CITY
      ?AUTO_2351 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2346 ?AUTO_2349 ) ( IN-CITY ?AUTO_2349 ?AUTO_2348 ) ( IN-CITY ?AUTO_2344 ?AUTO_2348 ) ( not ( = ?AUTO_2344 ?AUTO_2349 ) ) ( TRUCK-AT ?AUTO_2346 ?AUTO_2351 ) ( OBJ-AT ?AUTO_2343 ?AUTO_2351 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2343 ?AUTO_2346 ?AUTO_2351 )
      ( DELIVER-PKG ?AUTO_2343 ?AUTO_2344 )
      ( DELIVER-PKG-VERIFY ?AUTO_2343 ?AUTO_2344 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2353 - OBJ
      ?AUTO_2354 - LOCATION
    )
    :vars
    (
      ?AUTO_2358 - TRUCK
      ?AUTO_2355 - LOCATION
      ?AUTO_2359 - CITY
      ?AUTO_2360 - LOCATION
      ?AUTO_2361 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2358 ?AUTO_2355 ) ( IN-CITY ?AUTO_2355 ?AUTO_2359 ) ( IN-CITY ?AUTO_2354 ?AUTO_2359 ) ( not ( = ?AUTO_2354 ?AUTO_2355 ) ) ( TRUCK-AT ?AUTO_2358 ?AUTO_2360 ) ( IN-AIRPLANE ?AUTO_2353 ?AUTO_2361 ) ( AIRPLANE-AT ?AUTO_2361 ?AUTO_2360 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2353 ?AUTO_2361 ?AUTO_2360 )
      ( DELIVER-PKG ?AUTO_2353 ?AUTO_2354 )
      ( DELIVER-PKG-VERIFY ?AUTO_2353 ?AUTO_2354 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2364 - OBJ
      ?AUTO_2365 - LOCATION
    )
    :vars
    (
      ?AUTO_2371 - TRUCK
      ?AUTO_2372 - LOCATION
      ?AUTO_2367 - CITY
      ?AUTO_2369 - LOCATION
      ?AUTO_2366 - AIRPLANE
      ?AUTO_2374 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2371 ?AUTO_2372 ) ( IN-CITY ?AUTO_2372 ?AUTO_2367 ) ( IN-CITY ?AUTO_2365 ?AUTO_2367 ) ( not ( = ?AUTO_2365 ?AUTO_2372 ) ) ( TRUCK-AT ?AUTO_2371 ?AUTO_2369 ) ( IN-AIRPLANE ?AUTO_2364 ?AUTO_2366 ) ( AIRPORT ?AUTO_2374 ) ( AIRPORT ?AUTO_2369 ) ( AIRPLANE-AT ?AUTO_2366 ?AUTO_2374 ) ( not ( = ?AUTO_2374 ?AUTO_2369 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2366 ?AUTO_2374 ?AUTO_2369 )
      ( DELIVER-PKG ?AUTO_2364 ?AUTO_2365 )
      ( DELIVER-PKG-VERIFY ?AUTO_2364 ?AUTO_2365 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2384 - OBJ
      ?AUTO_2385 - LOCATION
    )
    :vars
    (
      ?AUTO_2387 - TRUCK
      ?AUTO_2390 - LOCATION
      ?AUTO_2388 - CITY
      ?AUTO_2389 - LOCATION
      ?AUTO_2391 - LOCATION
      ?AUTO_2393 - AIRPLANE
      ?AUTO_2395 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2387 ?AUTO_2390 ) ( IN-CITY ?AUTO_2390 ?AUTO_2388 ) ( IN-CITY ?AUTO_2385 ?AUTO_2388 ) ( not ( = ?AUTO_2385 ?AUTO_2390 ) ) ( TRUCK-AT ?AUTO_2387 ?AUTO_2389 ) ( AIRPORT ?AUTO_2391 ) ( AIRPORT ?AUTO_2389 ) ( AIRPLANE-AT ?AUTO_2393 ?AUTO_2391 ) ( not ( = ?AUTO_2391 ?AUTO_2389 ) ) ( OBJ-AT ?AUTO_2384 ?AUTO_2395 ) ( AIRPLANE-AT ?AUTO_2393 ?AUTO_2395 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2384 ?AUTO_2393 ?AUTO_2395 )
      ( DELIVER-PKG ?AUTO_2384 ?AUTO_2385 )
      ( DELIVER-PKG-VERIFY ?AUTO_2384 ?AUTO_2385 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2397 - OBJ
      ?AUTO_2398 - LOCATION
    )
    :vars
    (
      ?AUTO_2402 - TRUCK
      ?AUTO_2403 - LOCATION
      ?AUTO_2406 - CITY
      ?AUTO_2404 - LOCATION
      ?AUTO_2407 - LOCATION
      ?AUTO_2409 - LOCATION
      ?AUTO_2401 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2402 ?AUTO_2403 ) ( IN-CITY ?AUTO_2403 ?AUTO_2406 ) ( IN-CITY ?AUTO_2398 ?AUTO_2406 ) ( not ( = ?AUTO_2398 ?AUTO_2403 ) ) ( TRUCK-AT ?AUTO_2402 ?AUTO_2404 ) ( AIRPORT ?AUTO_2407 ) ( AIRPORT ?AUTO_2404 ) ( not ( = ?AUTO_2407 ?AUTO_2404 ) ) ( OBJ-AT ?AUTO_2397 ?AUTO_2407 ) ( AIRPORT ?AUTO_2409 ) ( AIRPLANE-AT ?AUTO_2401 ?AUTO_2409 ) ( not ( = ?AUTO_2409 ?AUTO_2407 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2401 ?AUTO_2409 ?AUTO_2407 )
      ( DELIVER-PKG ?AUTO_2397 ?AUTO_2398 )
      ( DELIVER-PKG-VERIFY ?AUTO_2397 ?AUTO_2398 ) )
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
      ?AUTO_2425 - LOCATION
      ?AUTO_2432 - CITY
      ?AUTO_2430 - LOCATION
      ?AUTO_2431 - LOCATION
      ?AUTO_2428 - LOCATION
      ?AUTO_2427 - AIRPLANE
      ?AUTO_2434 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2429 ?AUTO_2425 ) ( IN-CITY ?AUTO_2425 ?AUTO_2432 ) ( IN-CITY ?AUTO_2424 ?AUTO_2432 ) ( not ( = ?AUTO_2424 ?AUTO_2425 ) ) ( TRUCK-AT ?AUTO_2429 ?AUTO_2430 ) ( AIRPORT ?AUTO_2431 ) ( AIRPORT ?AUTO_2430 ) ( not ( = ?AUTO_2431 ?AUTO_2430 ) ) ( AIRPORT ?AUTO_2428 ) ( AIRPLANE-AT ?AUTO_2427 ?AUTO_2428 ) ( not ( = ?AUTO_2428 ?AUTO_2431 ) ) ( TRUCK-AT ?AUTO_2434 ?AUTO_2431 ) ( IN-TRUCK ?AUTO_2423 ?AUTO_2434 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2423 ?AUTO_2434 ?AUTO_2431 )
      ( DELIVER-PKG ?AUTO_2423 ?AUTO_2424 )
      ( DELIVER-PKG-VERIFY ?AUTO_2423 ?AUTO_2424 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2437 - OBJ
      ?AUTO_2438 - LOCATION
    )
    :vars
    (
      ?AUTO_2446 - TRUCK
      ?AUTO_2443 - LOCATION
      ?AUTO_2445 - CITY
      ?AUTO_2448 - LOCATION
      ?AUTO_2447 - LOCATION
      ?AUTO_2442 - LOCATION
      ?AUTO_2444 - AIRPLANE
      ?AUTO_2441 - TRUCK
      ?AUTO_2451 - LOCATION
      ?AUTO_2450 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2446 ?AUTO_2443 ) ( IN-CITY ?AUTO_2443 ?AUTO_2445 ) ( IN-CITY ?AUTO_2438 ?AUTO_2445 ) ( not ( = ?AUTO_2438 ?AUTO_2443 ) ) ( TRUCK-AT ?AUTO_2446 ?AUTO_2448 ) ( AIRPORT ?AUTO_2447 ) ( AIRPORT ?AUTO_2448 ) ( not ( = ?AUTO_2447 ?AUTO_2448 ) ) ( AIRPORT ?AUTO_2442 ) ( AIRPLANE-AT ?AUTO_2444 ?AUTO_2442 ) ( not ( = ?AUTO_2442 ?AUTO_2447 ) ) ( IN-TRUCK ?AUTO_2437 ?AUTO_2441 ) ( TRUCK-AT ?AUTO_2441 ?AUTO_2451 ) ( IN-CITY ?AUTO_2451 ?AUTO_2450 ) ( IN-CITY ?AUTO_2447 ?AUTO_2450 ) ( not ( = ?AUTO_2447 ?AUTO_2451 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2441 ?AUTO_2451 ?AUTO_2447 ?AUTO_2450 )
      ( DELIVER-PKG ?AUTO_2437 ?AUTO_2438 )
      ( DELIVER-PKG-VERIFY ?AUTO_2437 ?AUTO_2438 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2455 - OBJ
      ?AUTO_2456 - LOCATION
    )
    :vars
    (
      ?AUTO_2458 - TRUCK
      ?AUTO_2466 - LOCATION
      ?AUTO_2468 - CITY
      ?AUTO_2459 - LOCATION
      ?AUTO_2467 - LOCATION
      ?AUTO_2457 - LOCATION
      ?AUTO_2462 - AIRPLANE
      ?AUTO_2461 - TRUCK
      ?AUTO_2464 - LOCATION
      ?AUTO_2463 - CITY
      ?AUTO_2470 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2458 ?AUTO_2466 ) ( IN-CITY ?AUTO_2466 ?AUTO_2468 ) ( IN-CITY ?AUTO_2456 ?AUTO_2468 ) ( not ( = ?AUTO_2456 ?AUTO_2466 ) ) ( TRUCK-AT ?AUTO_2458 ?AUTO_2459 ) ( AIRPORT ?AUTO_2467 ) ( AIRPORT ?AUTO_2459 ) ( not ( = ?AUTO_2467 ?AUTO_2459 ) ) ( AIRPORT ?AUTO_2457 ) ( AIRPLANE-AT ?AUTO_2462 ?AUTO_2457 ) ( not ( = ?AUTO_2457 ?AUTO_2467 ) ) ( TRUCK-AT ?AUTO_2461 ?AUTO_2464 ) ( IN-CITY ?AUTO_2464 ?AUTO_2463 ) ( IN-CITY ?AUTO_2467 ?AUTO_2463 ) ( not ( = ?AUTO_2467 ?AUTO_2464 ) ) ( TRUCK-AT ?AUTO_2461 ?AUTO_2470 ) ( OBJ-AT ?AUTO_2455 ?AUTO_2470 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2455 ?AUTO_2461 ?AUTO_2470 )
      ( DELIVER-PKG ?AUTO_2455 ?AUTO_2456 )
      ( DELIVER-PKG-VERIFY ?AUTO_2455 ?AUTO_2456 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2472 - OBJ
      ?AUTO_2473 - LOCATION
    )
    :vars
    (
      ?AUTO_2486 - TRUCK
      ?AUTO_2481 - LOCATION
      ?AUTO_2477 - CITY
      ?AUTO_2479 - LOCATION
      ?AUTO_2484 - LOCATION
      ?AUTO_2482 - LOCATION
      ?AUTO_2478 - AIRPLANE
      ?AUTO_2475 - LOCATION
      ?AUTO_2480 - CITY
      ?AUTO_2483 - TRUCK
      ?AUTO_2489 - LOCATION
      ?AUTO_2488 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2486 ?AUTO_2481 ) ( IN-CITY ?AUTO_2481 ?AUTO_2477 ) ( IN-CITY ?AUTO_2473 ?AUTO_2477 ) ( not ( = ?AUTO_2473 ?AUTO_2481 ) ) ( TRUCK-AT ?AUTO_2486 ?AUTO_2479 ) ( AIRPORT ?AUTO_2484 ) ( AIRPORT ?AUTO_2479 ) ( not ( = ?AUTO_2484 ?AUTO_2479 ) ) ( AIRPORT ?AUTO_2482 ) ( AIRPLANE-AT ?AUTO_2478 ?AUTO_2482 ) ( not ( = ?AUTO_2482 ?AUTO_2484 ) ) ( IN-CITY ?AUTO_2475 ?AUTO_2480 ) ( IN-CITY ?AUTO_2484 ?AUTO_2480 ) ( not ( = ?AUTO_2484 ?AUTO_2475 ) ) ( OBJ-AT ?AUTO_2472 ?AUTO_2475 ) ( TRUCK-AT ?AUTO_2483 ?AUTO_2489 ) ( IN-CITY ?AUTO_2489 ?AUTO_2488 ) ( IN-CITY ?AUTO_2475 ?AUTO_2488 ) ( not ( = ?AUTO_2475 ?AUTO_2489 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2483 ?AUTO_2489 ?AUTO_2475 ?AUTO_2488 )
      ( DELIVER-PKG ?AUTO_2472 ?AUTO_2473 )
      ( DELIVER-PKG-VERIFY ?AUTO_2472 ?AUTO_2473 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2531 - OBJ
      ?AUTO_2532 - LOCATION
    )
    :vars
    (
      ?AUTO_2533 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2531 ?AUTO_2533 ) ( AIRPLANE-AT ?AUTO_2533 ?AUTO_2532 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2531 ?AUTO_2533 ?AUTO_2532 )
      ( DELIVER-PKG-VERIFY ?AUTO_2531 ?AUTO_2532 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2552 - OBJ
      ?AUTO_2553 - LOCATION
    )
    :vars
    (
      ?AUTO_2555 - TRUCK
      ?AUTO_2560 - LOCATION
      ?AUTO_2557 - CITY
      ?AUTO_2556 - LOCATION
      ?AUTO_2558 - LOCATION
      ?AUTO_2561 - AIRPLANE
      ?AUTO_2563 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2555 ?AUTO_2560 ) ( IN-CITY ?AUTO_2560 ?AUTO_2557 ) ( IN-CITY ?AUTO_2553 ?AUTO_2557 ) ( not ( = ?AUTO_2553 ?AUTO_2560 ) ) ( TRUCK-AT ?AUTO_2555 ?AUTO_2556 ) ( AIRPORT ?AUTO_2558 ) ( AIRPORT ?AUTO_2556 ) ( AIRPLANE-AT ?AUTO_2561 ?AUTO_2558 ) ( not ( = ?AUTO_2558 ?AUTO_2556 ) ) ( OBJ-AT ?AUTO_2552 ?AUTO_2563 ) ( AIRPLANE-AT ?AUTO_2561 ?AUTO_2563 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2552 ?AUTO_2561 ?AUTO_2563 )
      ( DELIVER-PKG ?AUTO_2552 ?AUTO_2553 )
      ( DELIVER-PKG-VERIFY ?AUTO_2552 ?AUTO_2553 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2579 - OBJ
      ?AUTO_2580 - LOCATION
    )
    :vars
    (
      ?AUTO_2584 - TRUCK
      ?AUTO_2583 - LOCATION
      ?AUTO_2586 - CITY
      ?AUTO_2582 - LOCATION
      ?AUTO_2581 - LOCATION
      ?AUTO_2587 - LOCATION
      ?AUTO_2589 - AIRPLANE
      ?AUTO_2590 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2584 ?AUTO_2583 ) ( IN-CITY ?AUTO_2583 ?AUTO_2586 ) ( IN-CITY ?AUTO_2580 ?AUTO_2586 ) ( not ( = ?AUTO_2580 ?AUTO_2583 ) ) ( TRUCK-AT ?AUTO_2584 ?AUTO_2582 ) ( AIRPORT ?AUTO_2581 ) ( AIRPORT ?AUTO_2582 ) ( not ( = ?AUTO_2581 ?AUTO_2582 ) ) ( AIRPORT ?AUTO_2587 ) ( AIRPLANE-AT ?AUTO_2589 ?AUTO_2587 ) ( not ( = ?AUTO_2587 ?AUTO_2581 ) ) ( TRUCK-AT ?AUTO_2590 ?AUTO_2581 ) ( IN-TRUCK ?AUTO_2579 ?AUTO_2590 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2579 ?AUTO_2590 ?AUTO_2581 )
      ( DELIVER-PKG ?AUTO_2579 ?AUTO_2580 )
      ( DELIVER-PKG-VERIFY ?AUTO_2579 ?AUTO_2580 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2597 - OBJ
      ?AUTO_2598 - LOCATION
    )
    :vars
    (
      ?AUTO_2607 - TRUCK
      ?AUTO_2602 - LOCATION
      ?AUTO_2603 - CITY
      ?AUTO_2608 - LOCATION
      ?AUTO_2606 - LOCATION
      ?AUTO_2610 - LOCATION
      ?AUTO_2605 - AIRPLANE
      ?AUTO_2600 - TRUCK
      ?AUTO_2599 - LOCATION
      ?AUTO_2601 - CITY
      ?AUTO_2612 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2607 ?AUTO_2602 ) ( IN-CITY ?AUTO_2602 ?AUTO_2603 ) ( IN-CITY ?AUTO_2598 ?AUTO_2603 ) ( not ( = ?AUTO_2598 ?AUTO_2602 ) ) ( TRUCK-AT ?AUTO_2607 ?AUTO_2608 ) ( AIRPORT ?AUTO_2606 ) ( AIRPORT ?AUTO_2608 ) ( not ( = ?AUTO_2606 ?AUTO_2608 ) ) ( AIRPORT ?AUTO_2610 ) ( AIRPLANE-AT ?AUTO_2605 ?AUTO_2610 ) ( not ( = ?AUTO_2610 ?AUTO_2606 ) ) ( TRUCK-AT ?AUTO_2600 ?AUTO_2599 ) ( IN-CITY ?AUTO_2599 ?AUTO_2601 ) ( IN-CITY ?AUTO_2606 ?AUTO_2601 ) ( not ( = ?AUTO_2606 ?AUTO_2599 ) ) ( TRUCK-AT ?AUTO_2600 ?AUTO_2612 ) ( OBJ-AT ?AUTO_2597 ?AUTO_2612 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2597 ?AUTO_2600 ?AUTO_2612 )
      ( DELIVER-PKG ?AUTO_2597 ?AUTO_2598 )
      ( DELIVER-PKG-VERIFY ?AUTO_2597 ?AUTO_2598 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2658 - OBJ
      ?AUTO_2659 - LOCATION
    )
    :vars
    (
      ?AUTO_2660 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2660 ?AUTO_2659 ) ( IN-TRUCK ?AUTO_2658 ?AUTO_2660 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2658 ?AUTO_2660 ?AUTO_2659 )
      ( DELIVER-PKG-VERIFY ?AUTO_2658 ?AUTO_2659 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2663 - OBJ
      ?AUTO_2664 - LOCATION
    )
    :vars
    (
      ?AUTO_2667 - TRUCK
      ?AUTO_2670 - LOCATION
      ?AUTO_2669 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2663 ?AUTO_2667 ) ( TRUCK-AT ?AUTO_2667 ?AUTO_2670 ) ( IN-CITY ?AUTO_2670 ?AUTO_2669 ) ( IN-CITY ?AUTO_2664 ?AUTO_2669 ) ( not ( = ?AUTO_2664 ?AUTO_2670 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2667 ?AUTO_2670 ?AUTO_2664 ?AUTO_2669 )
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
      ?AUTO_2677 - TRUCK
      ?AUTO_2675 - LOCATION
      ?AUTO_2674 - CITY
      ?AUTO_2680 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2677 ?AUTO_2675 ) ( IN-CITY ?AUTO_2675 ?AUTO_2674 ) ( IN-CITY ?AUTO_2673 ?AUTO_2674 ) ( not ( = ?AUTO_2673 ?AUTO_2675 ) ) ( TRUCK-AT ?AUTO_2677 ?AUTO_2680 ) ( OBJ-AT ?AUTO_2672 ?AUTO_2680 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2672 ?AUTO_2677 ?AUTO_2680 )
      ( DELIVER-PKG ?AUTO_2672 ?AUTO_2673 )
      ( DELIVER-PKG-VERIFY ?AUTO_2672 ?AUTO_2673 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2682 - OBJ
      ?AUTO_2683 - LOCATION
    )
    :vars
    (
      ?AUTO_2685 - LOCATION
      ?AUTO_2687 - CITY
      ?AUTO_2684 - TRUCK
      ?AUTO_2692 - LOCATION
      ?AUTO_2691 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2685 ?AUTO_2687 ) ( IN-CITY ?AUTO_2683 ?AUTO_2687 ) ( not ( = ?AUTO_2683 ?AUTO_2685 ) ) ( OBJ-AT ?AUTO_2682 ?AUTO_2685 ) ( TRUCK-AT ?AUTO_2684 ?AUTO_2692 ) ( IN-CITY ?AUTO_2692 ?AUTO_2691 ) ( IN-CITY ?AUTO_2685 ?AUTO_2691 ) ( not ( = ?AUTO_2685 ?AUTO_2692 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2684 ?AUTO_2692 ?AUTO_2685 ?AUTO_2691 )
      ( DELIVER-PKG ?AUTO_2682 ?AUTO_2683 )
      ( DELIVER-PKG-VERIFY ?AUTO_2682 ?AUTO_2683 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2695 - OBJ
      ?AUTO_2696 - LOCATION
    )
    :vars
    (
      ?AUTO_2697 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2697 ?AUTO_2696 ) ( IN-TRUCK ?AUTO_2695 ?AUTO_2697 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2695 ?AUTO_2697 ?AUTO_2696 )
      ( DELIVER-PKG-VERIFY ?AUTO_2695 ?AUTO_2696 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2700 - OBJ
      ?AUTO_2701 - LOCATION
    )
    :vars
    (
      ?AUTO_2704 - TRUCK
      ?AUTO_2707 - LOCATION
      ?AUTO_2706 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2700 ?AUTO_2704 ) ( TRUCK-AT ?AUTO_2704 ?AUTO_2707 ) ( IN-CITY ?AUTO_2707 ?AUTO_2706 ) ( IN-CITY ?AUTO_2701 ?AUTO_2706 ) ( not ( = ?AUTO_2701 ?AUTO_2707 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2704 ?AUTO_2707 ?AUTO_2701 ?AUTO_2706 )
      ( DELIVER-PKG ?AUTO_2700 ?AUTO_2701 )
      ( DELIVER-PKG-VERIFY ?AUTO_2700 ?AUTO_2701 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2709 - OBJ
      ?AUTO_2710 - LOCATION
    )
    :vars
    (
      ?AUTO_2713 - TRUCK
      ?AUTO_2715 - LOCATION
      ?AUTO_2714 - CITY
      ?AUTO_2717 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2713 ?AUTO_2715 ) ( IN-CITY ?AUTO_2715 ?AUTO_2714 ) ( IN-CITY ?AUTO_2710 ?AUTO_2714 ) ( not ( = ?AUTO_2710 ?AUTO_2715 ) ) ( TRUCK-AT ?AUTO_2713 ?AUTO_2717 ) ( OBJ-AT ?AUTO_2709 ?AUTO_2717 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2709 ?AUTO_2713 ?AUTO_2717 )
      ( DELIVER-PKG ?AUTO_2709 ?AUTO_2710 )
      ( DELIVER-PKG-VERIFY ?AUTO_2709 ?AUTO_2710 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2719 - OBJ
      ?AUTO_2720 - LOCATION
    )
    :vars
    (
      ?AUTO_2726 - LOCATION
      ?AUTO_2725 - CITY
      ?AUTO_2724 - TRUCK
      ?AUTO_2729 - LOCATION
      ?AUTO_2728 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2726 ?AUTO_2725 ) ( IN-CITY ?AUTO_2720 ?AUTO_2725 ) ( not ( = ?AUTO_2720 ?AUTO_2726 ) ) ( OBJ-AT ?AUTO_2719 ?AUTO_2726 ) ( TRUCK-AT ?AUTO_2724 ?AUTO_2729 ) ( IN-CITY ?AUTO_2729 ?AUTO_2728 ) ( IN-CITY ?AUTO_2726 ?AUTO_2728 ) ( not ( = ?AUTO_2726 ?AUTO_2729 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2724 ?AUTO_2729 ?AUTO_2726 ?AUTO_2728 )
      ( DELIVER-PKG ?AUTO_2719 ?AUTO_2720 )
      ( DELIVER-PKG-VERIFY ?AUTO_2719 ?AUTO_2720 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2737 - OBJ
      ?AUTO_2738 - LOCATION
    )
    :vars
    (
      ?AUTO_2739 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2737 ?AUTO_2739 ) ( AIRPLANE-AT ?AUTO_2739 ?AUTO_2738 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2737 ?AUTO_2739 ?AUTO_2738 )
      ( DELIVER-PKG-VERIFY ?AUTO_2737 ?AUTO_2738 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2742 - OBJ
      ?AUTO_2743 - LOCATION
    )
    :vars
    (
      ?AUTO_2746 - AIRPLANE
      ?AUTO_2748 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2742 ?AUTO_2746 ) ( AIRPORT ?AUTO_2748 ) ( AIRPORT ?AUTO_2743 ) ( AIRPLANE-AT ?AUTO_2746 ?AUTO_2748 ) ( not ( = ?AUTO_2748 ?AUTO_2743 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2746 ?AUTO_2748 ?AUTO_2743 )
      ( DELIVER-PKG ?AUTO_2742 ?AUTO_2743 )
      ( DELIVER-PKG-VERIFY ?AUTO_2742 ?AUTO_2743 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2750 - OBJ
      ?AUTO_2751 - LOCATION
    )
    :vars
    (
      ?AUTO_2755 - LOCATION
      ?AUTO_2754 - AIRPLANE
      ?AUTO_2757 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2755 ) ( AIRPORT ?AUTO_2751 ) ( AIRPLANE-AT ?AUTO_2754 ?AUTO_2755 ) ( not ( = ?AUTO_2755 ?AUTO_2751 ) ) ( OBJ-AT ?AUTO_2750 ?AUTO_2757 ) ( AIRPLANE-AT ?AUTO_2754 ?AUTO_2757 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2750 ?AUTO_2754 ?AUTO_2757 )
      ( DELIVER-PKG ?AUTO_2750 ?AUTO_2751 )
      ( DELIVER-PKG-VERIFY ?AUTO_2750 ?AUTO_2751 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2759 - OBJ
      ?AUTO_2760 - LOCATION
    )
    :vars
    (
      ?AUTO_2765 - LOCATION
      ?AUTO_2767 - LOCATION
      ?AUTO_2763 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2765 ) ( AIRPORT ?AUTO_2760 ) ( not ( = ?AUTO_2765 ?AUTO_2760 ) ) ( OBJ-AT ?AUTO_2759 ?AUTO_2765 ) ( AIRPORT ?AUTO_2767 ) ( AIRPLANE-AT ?AUTO_2763 ?AUTO_2767 ) ( not ( = ?AUTO_2767 ?AUTO_2765 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2763 ?AUTO_2767 ?AUTO_2765 )
      ( DELIVER-PKG ?AUTO_2759 ?AUTO_2760 )
      ( DELIVER-PKG-VERIFY ?AUTO_2759 ?AUTO_2760 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2787 - OBJ
      ?AUTO_2788 - LOCATION
    )
    :vars
    (
      ?AUTO_2789 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2789 ?AUTO_2788 ) ( IN-TRUCK ?AUTO_2787 ?AUTO_2789 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2787 ?AUTO_2789 ?AUTO_2788 )
      ( DELIVER-PKG-VERIFY ?AUTO_2787 ?AUTO_2788 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2792 - OBJ
      ?AUTO_2793 - LOCATION
    )
    :vars
    (
      ?AUTO_2796 - TRUCK
      ?AUTO_2799 - LOCATION
      ?AUTO_2798 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2792 ?AUTO_2796 ) ( TRUCK-AT ?AUTO_2796 ?AUTO_2799 ) ( IN-CITY ?AUTO_2799 ?AUTO_2798 ) ( IN-CITY ?AUTO_2793 ?AUTO_2798 ) ( not ( = ?AUTO_2793 ?AUTO_2799 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2796 ?AUTO_2799 ?AUTO_2793 ?AUTO_2798 )
      ( DELIVER-PKG ?AUTO_2792 ?AUTO_2793 )
      ( DELIVER-PKG-VERIFY ?AUTO_2792 ?AUTO_2793 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2801 - OBJ
      ?AUTO_2802 - LOCATION
    )
    :vars
    (
      ?AUTO_2805 - TRUCK
      ?AUTO_2807 - LOCATION
      ?AUTO_2806 - CITY
      ?AUTO_2809 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2805 ?AUTO_2807 ) ( IN-CITY ?AUTO_2807 ?AUTO_2806 ) ( IN-CITY ?AUTO_2802 ?AUTO_2806 ) ( not ( = ?AUTO_2802 ?AUTO_2807 ) ) ( TRUCK-AT ?AUTO_2805 ?AUTO_2809 ) ( OBJ-AT ?AUTO_2801 ?AUTO_2809 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2801 ?AUTO_2805 ?AUTO_2809 )
      ( DELIVER-PKG ?AUTO_2801 ?AUTO_2802 )
      ( DELIVER-PKG-VERIFY ?AUTO_2801 ?AUTO_2802 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2811 - OBJ
      ?AUTO_2812 - LOCATION
    )
    :vars
    (
      ?AUTO_2816 - TRUCK
      ?AUTO_2813 - LOCATION
      ?AUTO_2817 - CITY
      ?AUTO_2818 - LOCATION
      ?AUTO_2819 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2816 ?AUTO_2813 ) ( IN-CITY ?AUTO_2813 ?AUTO_2817 ) ( IN-CITY ?AUTO_2812 ?AUTO_2817 ) ( not ( = ?AUTO_2812 ?AUTO_2813 ) ) ( TRUCK-AT ?AUTO_2816 ?AUTO_2818 ) ( IN-AIRPLANE ?AUTO_2811 ?AUTO_2819 ) ( AIRPLANE-AT ?AUTO_2819 ?AUTO_2818 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2811 ?AUTO_2819 ?AUTO_2818 )
      ( DELIVER-PKG ?AUTO_2811 ?AUTO_2812 )
      ( DELIVER-PKG-VERIFY ?AUTO_2811 ?AUTO_2812 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2822 - OBJ
      ?AUTO_2823 - LOCATION
    )
    :vars
    (
      ?AUTO_2829 - TRUCK
      ?AUTO_2830 - LOCATION
      ?AUTO_2825 - CITY
      ?AUTO_2827 - LOCATION
      ?AUTO_2824 - AIRPLANE
      ?AUTO_2832 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2829 ?AUTO_2830 ) ( IN-CITY ?AUTO_2830 ?AUTO_2825 ) ( IN-CITY ?AUTO_2823 ?AUTO_2825 ) ( not ( = ?AUTO_2823 ?AUTO_2830 ) ) ( TRUCK-AT ?AUTO_2829 ?AUTO_2827 ) ( IN-AIRPLANE ?AUTO_2822 ?AUTO_2824 ) ( AIRPORT ?AUTO_2832 ) ( AIRPORT ?AUTO_2827 ) ( AIRPLANE-AT ?AUTO_2824 ?AUTO_2832 ) ( not ( = ?AUTO_2832 ?AUTO_2827 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2824 ?AUTO_2832 ?AUTO_2827 )
      ( DELIVER-PKG ?AUTO_2822 ?AUTO_2823 )
      ( DELIVER-PKG-VERIFY ?AUTO_2822 ?AUTO_2823 ) )
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
      ?AUTO_2842 - LOCATION
      ?AUTO_2837 - CITY
      ?AUTO_2843 - LOCATION
      ?AUTO_2839 - LOCATION
      ?AUTO_2841 - AIRPLANE
      ?AUTO_2845 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2836 ?AUTO_2842 ) ( IN-CITY ?AUTO_2842 ?AUTO_2837 ) ( IN-CITY ?AUTO_2835 ?AUTO_2837 ) ( not ( = ?AUTO_2835 ?AUTO_2842 ) ) ( TRUCK-AT ?AUTO_2836 ?AUTO_2843 ) ( AIRPORT ?AUTO_2839 ) ( AIRPORT ?AUTO_2843 ) ( AIRPLANE-AT ?AUTO_2841 ?AUTO_2839 ) ( not ( = ?AUTO_2839 ?AUTO_2843 ) ) ( OBJ-AT ?AUTO_2834 ?AUTO_2845 ) ( AIRPLANE-AT ?AUTO_2841 ?AUTO_2845 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_2834 ?AUTO_2841 ?AUTO_2845 )
      ( DELIVER-PKG ?AUTO_2834 ?AUTO_2835 )
      ( DELIVER-PKG-VERIFY ?AUTO_2834 ?AUTO_2835 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2847 - OBJ
      ?AUTO_2848 - LOCATION
    )
    :vars
    (
      ?AUTO_2852 - TRUCK
      ?AUTO_2856 - LOCATION
      ?AUTO_2851 - CITY
      ?AUTO_2854 - LOCATION
      ?AUTO_2853 - LOCATION
      ?AUTO_2859 - LOCATION
      ?AUTO_2857 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2852 ?AUTO_2856 ) ( IN-CITY ?AUTO_2856 ?AUTO_2851 ) ( IN-CITY ?AUTO_2848 ?AUTO_2851 ) ( not ( = ?AUTO_2848 ?AUTO_2856 ) ) ( TRUCK-AT ?AUTO_2852 ?AUTO_2854 ) ( AIRPORT ?AUTO_2853 ) ( AIRPORT ?AUTO_2854 ) ( not ( = ?AUTO_2853 ?AUTO_2854 ) ) ( OBJ-AT ?AUTO_2847 ?AUTO_2853 ) ( AIRPORT ?AUTO_2859 ) ( AIRPLANE-AT ?AUTO_2857 ?AUTO_2859 ) ( not ( = ?AUTO_2859 ?AUTO_2853 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2857 ?AUTO_2859 ?AUTO_2853 )
      ( DELIVER-PKG ?AUTO_2847 ?AUTO_2848 )
      ( DELIVER-PKG-VERIFY ?AUTO_2847 ?AUTO_2848 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2875 - OBJ
      ?AUTO_2876 - LOCATION
    )
    :vars
    (
      ?AUTO_2880 - LOCATION
      ?AUTO_2882 - CITY
      ?AUTO_2878 - LOCATION
      ?AUTO_2885 - LOCATION
      ?AUTO_2879 - AIRPLANE
      ?AUTO_2881 - TRUCK
      ?AUTO_2888 - LOCATION
      ?AUTO_2887 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2880 ?AUTO_2882 ) ( IN-CITY ?AUTO_2876 ?AUTO_2882 ) ( not ( = ?AUTO_2876 ?AUTO_2880 ) ) ( AIRPORT ?AUTO_2878 ) ( AIRPORT ?AUTO_2880 ) ( not ( = ?AUTO_2878 ?AUTO_2880 ) ) ( OBJ-AT ?AUTO_2875 ?AUTO_2878 ) ( AIRPORT ?AUTO_2885 ) ( AIRPLANE-AT ?AUTO_2879 ?AUTO_2885 ) ( not ( = ?AUTO_2885 ?AUTO_2878 ) ) ( TRUCK-AT ?AUTO_2881 ?AUTO_2888 ) ( IN-CITY ?AUTO_2888 ?AUTO_2887 ) ( IN-CITY ?AUTO_2880 ?AUTO_2887 ) ( not ( = ?AUTO_2880 ?AUTO_2888 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2881 ?AUTO_2888 ?AUTO_2880 ?AUTO_2887 )
      ( DELIVER-PKG ?AUTO_2875 ?AUTO_2876 )
      ( DELIVER-PKG-VERIFY ?AUTO_2875 ?AUTO_2876 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2892 - OBJ
      ?AUTO_2893 - LOCATION
    )
    :vars
    (
      ?AUTO_2894 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2894 ?AUTO_2893 ) ( IN-TRUCK ?AUTO_2892 ?AUTO_2894 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2892 ?AUTO_2894 ?AUTO_2893 )
      ( DELIVER-PKG-VERIFY ?AUTO_2892 ?AUTO_2893 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2897 - OBJ
      ?AUTO_2898 - LOCATION
    )
    :vars
    (
      ?AUTO_2901 - TRUCK
      ?AUTO_2904 - LOCATION
      ?AUTO_2903 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_2897 ?AUTO_2901 ) ( TRUCK-AT ?AUTO_2901 ?AUTO_2904 ) ( IN-CITY ?AUTO_2904 ?AUTO_2903 ) ( IN-CITY ?AUTO_2898 ?AUTO_2903 ) ( not ( = ?AUTO_2898 ?AUTO_2904 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2901 ?AUTO_2904 ?AUTO_2898 ?AUTO_2903 )
      ( DELIVER-PKG ?AUTO_2897 ?AUTO_2898 )
      ( DELIVER-PKG-VERIFY ?AUTO_2897 ?AUTO_2898 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2906 - OBJ
      ?AUTO_2907 - LOCATION
    )
    :vars
    (
      ?AUTO_2910 - TRUCK
      ?AUTO_2912 - LOCATION
      ?AUTO_2911 - CITY
      ?AUTO_2914 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2910 ?AUTO_2912 ) ( IN-CITY ?AUTO_2912 ?AUTO_2911 ) ( IN-CITY ?AUTO_2907 ?AUTO_2911 ) ( not ( = ?AUTO_2907 ?AUTO_2912 ) ) ( TRUCK-AT ?AUTO_2910 ?AUTO_2914 ) ( OBJ-AT ?AUTO_2906 ?AUTO_2914 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2906 ?AUTO_2910 ?AUTO_2914 )
      ( DELIVER-PKG ?AUTO_2906 ?AUTO_2907 )
      ( DELIVER-PKG-VERIFY ?AUTO_2906 ?AUTO_2907 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2916 - OBJ
      ?AUTO_2917 - LOCATION
    )
    :vars
    (
      ?AUTO_2923 - LOCATION
      ?AUTO_2922 - CITY
      ?AUTO_2921 - TRUCK
      ?AUTO_2926 - LOCATION
      ?AUTO_2925 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2923 ?AUTO_2922 ) ( IN-CITY ?AUTO_2917 ?AUTO_2922 ) ( not ( = ?AUTO_2917 ?AUTO_2923 ) ) ( OBJ-AT ?AUTO_2916 ?AUTO_2923 ) ( TRUCK-AT ?AUTO_2921 ?AUTO_2926 ) ( IN-CITY ?AUTO_2926 ?AUTO_2925 ) ( IN-CITY ?AUTO_2923 ?AUTO_2925 ) ( not ( = ?AUTO_2923 ?AUTO_2926 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2921 ?AUTO_2926 ?AUTO_2923 ?AUTO_2925 )
      ( DELIVER-PKG ?AUTO_2916 ?AUTO_2917 )
      ( DELIVER-PKG-VERIFY ?AUTO_2916 ?AUTO_2917 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2960 - OBJ
      ?AUTO_2961 - LOCATION
    )
    :vars
    (
      ?AUTO_2962 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2960 ?AUTO_2962 ) ( AIRPLANE-AT ?AUTO_2962 ?AUTO_2961 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_2960 ?AUTO_2962 ?AUTO_2961 )
      ( DELIVER-PKG-VERIFY ?AUTO_2960 ?AUTO_2961 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2967 - OBJ
      ?AUTO_2968 - LOCATION
    )
    :vars
    (
      ?AUTO_2971 - AIRPLANE
      ?AUTO_2973 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_2967 ?AUTO_2971 ) ( AIRPORT ?AUTO_2973 ) ( AIRPORT ?AUTO_2968 ) ( AIRPLANE-AT ?AUTO_2971 ?AUTO_2973 ) ( not ( = ?AUTO_2973 ?AUTO_2968 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2971 ?AUTO_2973 ?AUTO_2968 )
      ( DELIVER-PKG ?AUTO_2967 ?AUTO_2968 )
      ( DELIVER-PKG-VERIFY ?AUTO_2967 ?AUTO_2968 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3001 - OBJ
      ?AUTO_3002 - LOCATION
    )
    :vars
    (
      ?AUTO_3004 - LOCATION
      ?AUTO_3006 - LOCATION
      ?AUTO_3007 - AIRPLANE
      ?AUTO_3008 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3004 ) ( AIRPORT ?AUTO_3002 ) ( not ( = ?AUTO_3004 ?AUTO_3002 ) ) ( AIRPORT ?AUTO_3006 ) ( AIRPLANE-AT ?AUTO_3007 ?AUTO_3006 ) ( not ( = ?AUTO_3006 ?AUTO_3004 ) ) ( TRUCK-AT ?AUTO_3008 ?AUTO_3004 ) ( IN-TRUCK ?AUTO_3001 ?AUTO_3008 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3001 ?AUTO_3008 ?AUTO_3004 )
      ( DELIVER-PKG ?AUTO_3001 ?AUTO_3002 )
      ( DELIVER-PKG-VERIFY ?AUTO_3001 ?AUTO_3002 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3011 - OBJ
      ?AUTO_3012 - LOCATION
    )
    :vars
    (
      ?AUTO_3016 - LOCATION
      ?AUTO_3015 - LOCATION
      ?AUTO_3017 - AIRPLANE
      ?AUTO_3018 - TRUCK
      ?AUTO_3021 - LOCATION
      ?AUTO_3020 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3016 ) ( AIRPORT ?AUTO_3012 ) ( not ( = ?AUTO_3016 ?AUTO_3012 ) ) ( AIRPORT ?AUTO_3015 ) ( AIRPLANE-AT ?AUTO_3017 ?AUTO_3015 ) ( not ( = ?AUTO_3015 ?AUTO_3016 ) ) ( IN-TRUCK ?AUTO_3011 ?AUTO_3018 ) ( TRUCK-AT ?AUTO_3018 ?AUTO_3021 ) ( IN-CITY ?AUTO_3021 ?AUTO_3020 ) ( IN-CITY ?AUTO_3016 ?AUTO_3020 ) ( not ( = ?AUTO_3016 ?AUTO_3021 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3018 ?AUTO_3021 ?AUTO_3016 ?AUTO_3020 )
      ( DELIVER-PKG ?AUTO_3011 ?AUTO_3012 )
      ( DELIVER-PKG-VERIFY ?AUTO_3011 ?AUTO_3012 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3023 - OBJ
      ?AUTO_3024 - LOCATION
    )
    :vars
    (
      ?AUTO_3028 - LOCATION
      ?AUTO_3025 - LOCATION
      ?AUTO_3030 - AIRPLANE
      ?AUTO_3031 - TRUCK
      ?AUTO_3027 - LOCATION
      ?AUTO_3032 - CITY
      ?AUTO_3034 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3028 ) ( AIRPORT ?AUTO_3024 ) ( not ( = ?AUTO_3028 ?AUTO_3024 ) ) ( AIRPORT ?AUTO_3025 ) ( AIRPLANE-AT ?AUTO_3030 ?AUTO_3025 ) ( not ( = ?AUTO_3025 ?AUTO_3028 ) ) ( TRUCK-AT ?AUTO_3031 ?AUTO_3027 ) ( IN-CITY ?AUTO_3027 ?AUTO_3032 ) ( IN-CITY ?AUTO_3028 ?AUTO_3032 ) ( not ( = ?AUTO_3028 ?AUTO_3027 ) ) ( TRUCK-AT ?AUTO_3031 ?AUTO_3034 ) ( OBJ-AT ?AUTO_3023 ?AUTO_3034 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3023 ?AUTO_3031 ?AUTO_3034 )
      ( DELIVER-PKG ?AUTO_3023 ?AUTO_3024 )
      ( DELIVER-PKG-VERIFY ?AUTO_3023 ?AUTO_3024 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3036 - OBJ
      ?AUTO_3037 - LOCATION
    )
    :vars
    (
      ?AUTO_3042 - LOCATION
      ?AUTO_3046 - LOCATION
      ?AUTO_3045 - AIRPLANE
      ?AUTO_3044 - LOCATION
      ?AUTO_3038 - CITY
      ?AUTO_3041 - TRUCK
      ?AUTO_3049 - LOCATION
      ?AUTO_3048 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3042 ) ( AIRPORT ?AUTO_3037 ) ( not ( = ?AUTO_3042 ?AUTO_3037 ) ) ( AIRPORT ?AUTO_3046 ) ( AIRPLANE-AT ?AUTO_3045 ?AUTO_3046 ) ( not ( = ?AUTO_3046 ?AUTO_3042 ) ) ( IN-CITY ?AUTO_3044 ?AUTO_3038 ) ( IN-CITY ?AUTO_3042 ?AUTO_3038 ) ( not ( = ?AUTO_3042 ?AUTO_3044 ) ) ( OBJ-AT ?AUTO_3036 ?AUTO_3044 ) ( TRUCK-AT ?AUTO_3041 ?AUTO_3049 ) ( IN-CITY ?AUTO_3049 ?AUTO_3048 ) ( IN-CITY ?AUTO_3044 ?AUTO_3048 ) ( not ( = ?AUTO_3044 ?AUTO_3049 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3041 ?AUTO_3049 ?AUTO_3044 ?AUTO_3048 )
      ( DELIVER-PKG ?AUTO_3036 ?AUTO_3037 )
      ( DELIVER-PKG-VERIFY ?AUTO_3036 ?AUTO_3037 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3057 - OBJ
      ?AUTO_3058 - LOCATION
    )
    :vars
    (
      ?AUTO_3059 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3057 ?AUTO_3059 ) ( AIRPLANE-AT ?AUTO_3059 ?AUTO_3058 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3057 ?AUTO_3059 ?AUTO_3058 )
      ( DELIVER-PKG-VERIFY ?AUTO_3057 ?AUTO_3058 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3062 - OBJ
      ?AUTO_3063 - LOCATION
    )
    :vars
    (
      ?AUTO_3066 - AIRPLANE
      ?AUTO_3068 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3062 ?AUTO_3066 ) ( AIRPORT ?AUTO_3068 ) ( AIRPORT ?AUTO_3063 ) ( AIRPLANE-AT ?AUTO_3066 ?AUTO_3068 ) ( not ( = ?AUTO_3068 ?AUTO_3063 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3066 ?AUTO_3068 ?AUTO_3063 )
      ( DELIVER-PKG ?AUTO_3062 ?AUTO_3063 )
      ( DELIVER-PKG-VERIFY ?AUTO_3062 ?AUTO_3063 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3078 - OBJ
      ?AUTO_3079 - LOCATION
    )
    :vars
    (
      ?AUTO_3080 - LOCATION
      ?AUTO_3083 - AIRPLANE
      ?AUTO_3085 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3080 ) ( AIRPORT ?AUTO_3079 ) ( AIRPLANE-AT ?AUTO_3083 ?AUTO_3080 ) ( not ( = ?AUTO_3080 ?AUTO_3079 ) ) ( OBJ-AT ?AUTO_3078 ?AUTO_3085 ) ( AIRPLANE-AT ?AUTO_3083 ?AUTO_3085 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3078 ?AUTO_3083 ?AUTO_3085 )
      ( DELIVER-PKG ?AUTO_3078 ?AUTO_3079 )
      ( DELIVER-PKG-VERIFY ?AUTO_3078 ?AUTO_3079 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3087 - OBJ
      ?AUTO_3088 - LOCATION
    )
    :vars
    (
      ?AUTO_3093 - LOCATION
      ?AUTO_3095 - LOCATION
      ?AUTO_3092 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3093 ) ( AIRPORT ?AUTO_3088 ) ( not ( = ?AUTO_3093 ?AUTO_3088 ) ) ( OBJ-AT ?AUTO_3087 ?AUTO_3093 ) ( AIRPORT ?AUTO_3095 ) ( AIRPLANE-AT ?AUTO_3092 ?AUTO_3095 ) ( not ( = ?AUTO_3095 ?AUTO_3093 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3092 ?AUTO_3095 ?AUTO_3093 )
      ( DELIVER-PKG ?AUTO_3087 ?AUTO_3088 )
      ( DELIVER-PKG-VERIFY ?AUTO_3087 ?AUTO_3088 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3137 - OBJ
      ?AUTO_3138 - LOCATION
    )
    :vars
    (
      ?AUTO_3139 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3139 ?AUTO_3138 ) ( IN-TRUCK ?AUTO_3137 ?AUTO_3139 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3137 ?AUTO_3139 ?AUTO_3138 )
      ( DELIVER-PKG-VERIFY ?AUTO_3137 ?AUTO_3138 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3144 - OBJ
      ?AUTO_3145 - LOCATION
    )
    :vars
    (
      ?AUTO_3148 - TRUCK
      ?AUTO_3151 - LOCATION
      ?AUTO_3150 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3144 ?AUTO_3148 ) ( TRUCK-AT ?AUTO_3148 ?AUTO_3151 ) ( IN-CITY ?AUTO_3151 ?AUTO_3150 ) ( IN-CITY ?AUTO_3145 ?AUTO_3150 ) ( not ( = ?AUTO_3145 ?AUTO_3151 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3148 ?AUTO_3151 ?AUTO_3145 ?AUTO_3150 )
      ( DELIVER-PKG ?AUTO_3144 ?AUTO_3145 )
      ( DELIVER-PKG-VERIFY ?AUTO_3144 ?AUTO_3145 ) )
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
      ?AUTO_3159 - LOCATION
      ?AUTO_3158 - CITY
      ?AUTO_3161 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3157 ?AUTO_3159 ) ( IN-CITY ?AUTO_3159 ?AUTO_3158 ) ( IN-CITY ?AUTO_3154 ?AUTO_3158 ) ( not ( = ?AUTO_3154 ?AUTO_3159 ) ) ( TRUCK-AT ?AUTO_3157 ?AUTO_3161 ) ( OBJ-AT ?AUTO_3153 ?AUTO_3161 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3153 ?AUTO_3157 ?AUTO_3161 )
      ( DELIVER-PKG ?AUTO_3153 ?AUTO_3154 )
      ( DELIVER-PKG-VERIFY ?AUTO_3153 ?AUTO_3154 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3163 - OBJ
      ?AUTO_3164 - LOCATION
    )
    :vars
    (
      ?AUTO_3167 - TRUCK
      ?AUTO_3169 - LOCATION
      ?AUTO_3168 - CITY
      ?AUTO_3170 - LOCATION
      ?AUTO_3171 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3167 ?AUTO_3169 ) ( IN-CITY ?AUTO_3169 ?AUTO_3168 ) ( IN-CITY ?AUTO_3164 ?AUTO_3168 ) ( not ( = ?AUTO_3164 ?AUTO_3169 ) ) ( TRUCK-AT ?AUTO_3167 ?AUTO_3170 ) ( IN-AIRPLANE ?AUTO_3163 ?AUTO_3171 ) ( AIRPLANE-AT ?AUTO_3171 ?AUTO_3170 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3163 ?AUTO_3171 ?AUTO_3170 )
      ( DELIVER-PKG ?AUTO_3163 ?AUTO_3164 )
      ( DELIVER-PKG-VERIFY ?AUTO_3163 ?AUTO_3164 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3174 - OBJ
      ?AUTO_3175 - LOCATION
    )
    :vars
    (
      ?AUTO_3182 - TRUCK
      ?AUTO_3177 - LOCATION
      ?AUTO_3179 - CITY
      ?AUTO_3181 - LOCATION
      ?AUTO_3176 - AIRPLANE
      ?AUTO_3184 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3182 ?AUTO_3177 ) ( IN-CITY ?AUTO_3177 ?AUTO_3179 ) ( IN-CITY ?AUTO_3175 ?AUTO_3179 ) ( not ( = ?AUTO_3175 ?AUTO_3177 ) ) ( TRUCK-AT ?AUTO_3182 ?AUTO_3181 ) ( IN-AIRPLANE ?AUTO_3174 ?AUTO_3176 ) ( AIRPORT ?AUTO_3184 ) ( AIRPORT ?AUTO_3181 ) ( AIRPLANE-AT ?AUTO_3176 ?AUTO_3184 ) ( not ( = ?AUTO_3184 ?AUTO_3181 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3176 ?AUTO_3184 ?AUTO_3181 )
      ( DELIVER-PKG ?AUTO_3174 ?AUTO_3175 )
      ( DELIVER-PKG-VERIFY ?AUTO_3174 ?AUTO_3175 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3194 - OBJ
      ?AUTO_3195 - LOCATION
    )
    :vars
    (
      ?AUTO_3197 - TRUCK
      ?AUTO_3201 - LOCATION
      ?AUTO_3196 - CITY
      ?AUTO_3198 - LOCATION
      ?AUTO_3203 - LOCATION
      ?AUTO_3202 - AIRPLANE
      ?AUTO_3205 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3197 ?AUTO_3201 ) ( IN-CITY ?AUTO_3201 ?AUTO_3196 ) ( IN-CITY ?AUTO_3195 ?AUTO_3196 ) ( not ( = ?AUTO_3195 ?AUTO_3201 ) ) ( TRUCK-AT ?AUTO_3197 ?AUTO_3198 ) ( AIRPORT ?AUTO_3203 ) ( AIRPORT ?AUTO_3198 ) ( AIRPLANE-AT ?AUTO_3202 ?AUTO_3203 ) ( not ( = ?AUTO_3203 ?AUTO_3198 ) ) ( OBJ-AT ?AUTO_3194 ?AUTO_3205 ) ( AIRPLANE-AT ?AUTO_3202 ?AUTO_3205 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3194 ?AUTO_3202 ?AUTO_3205 )
      ( DELIVER-PKG ?AUTO_3194 ?AUTO_3195 )
      ( DELIVER-PKG-VERIFY ?AUTO_3194 ?AUTO_3195 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3207 - OBJ
      ?AUTO_3208 - LOCATION
    )
    :vars
    (
      ?AUTO_3211 - TRUCK
      ?AUTO_3214 - LOCATION
      ?AUTO_3213 - CITY
      ?AUTO_3215 - LOCATION
      ?AUTO_3217 - LOCATION
      ?AUTO_3219 - LOCATION
      ?AUTO_3216 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3211 ?AUTO_3214 ) ( IN-CITY ?AUTO_3214 ?AUTO_3213 ) ( IN-CITY ?AUTO_3208 ?AUTO_3213 ) ( not ( = ?AUTO_3208 ?AUTO_3214 ) ) ( TRUCK-AT ?AUTO_3211 ?AUTO_3215 ) ( AIRPORT ?AUTO_3217 ) ( AIRPORT ?AUTO_3215 ) ( not ( = ?AUTO_3217 ?AUTO_3215 ) ) ( OBJ-AT ?AUTO_3207 ?AUTO_3217 ) ( AIRPORT ?AUTO_3219 ) ( AIRPLANE-AT ?AUTO_3216 ?AUTO_3219 ) ( not ( = ?AUTO_3219 ?AUTO_3217 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3216 ?AUTO_3219 ?AUTO_3217 )
      ( DELIVER-PKG ?AUTO_3207 ?AUTO_3208 )
      ( DELIVER-PKG-VERIFY ?AUTO_3207 ?AUTO_3208 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3261 - OBJ
      ?AUTO_3262 - LOCATION
    )
    :vars
    (
      ?AUTO_3263 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3263 ?AUTO_3262 ) ( IN-TRUCK ?AUTO_3261 ?AUTO_3263 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3261 ?AUTO_3263 ?AUTO_3262 )
      ( DELIVER-PKG-VERIFY ?AUTO_3261 ?AUTO_3262 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3292 - OBJ
      ?AUTO_3293 - LOCATION
    )
    :vars
    (
      ?AUTO_3300 - LOCATION
      ?AUTO_3294 - CITY
      ?AUTO_3296 - AIRPLANE
      ?AUTO_3298 - LOCATION
      ?AUTO_3299 - TRUCK
      ?AUTO_3304 - LOCATION
      ?AUTO_3303 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3300 ?AUTO_3294 ) ( IN-CITY ?AUTO_3293 ?AUTO_3294 ) ( not ( = ?AUTO_3293 ?AUTO_3300 ) ) ( IN-AIRPLANE ?AUTO_3292 ?AUTO_3296 ) ( AIRPORT ?AUTO_3298 ) ( AIRPORT ?AUTO_3300 ) ( AIRPLANE-AT ?AUTO_3296 ?AUTO_3298 ) ( not ( = ?AUTO_3298 ?AUTO_3300 ) ) ( TRUCK-AT ?AUTO_3299 ?AUTO_3304 ) ( IN-CITY ?AUTO_3304 ?AUTO_3303 ) ( IN-CITY ?AUTO_3300 ?AUTO_3303 ) ( not ( = ?AUTO_3300 ?AUTO_3304 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3299 ?AUTO_3304 ?AUTO_3300 ?AUTO_3303 )
      ( DELIVER-PKG ?AUTO_3292 ?AUTO_3293 )
      ( DELIVER-PKG-VERIFY ?AUTO_3292 ?AUTO_3293 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3326 - OBJ
      ?AUTO_3327 - LOCATION
    )
    :vars
    (
      ?AUTO_3331 - LOCATION
      ?AUTO_3328 - CITY
      ?AUTO_3336 - LOCATION
      ?AUTO_3335 - AIRPLANE
      ?AUTO_3329 - TRUCK
      ?AUTO_3330 - LOCATION
      ?AUTO_3332 - CITY
      ?AUTO_3338 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3331 ?AUTO_3328 ) ( IN-CITY ?AUTO_3327 ?AUTO_3328 ) ( not ( = ?AUTO_3327 ?AUTO_3331 ) ) ( AIRPORT ?AUTO_3336 ) ( AIRPORT ?AUTO_3331 ) ( AIRPLANE-AT ?AUTO_3335 ?AUTO_3336 ) ( not ( = ?AUTO_3336 ?AUTO_3331 ) ) ( TRUCK-AT ?AUTO_3329 ?AUTO_3330 ) ( IN-CITY ?AUTO_3330 ?AUTO_3332 ) ( IN-CITY ?AUTO_3331 ?AUTO_3332 ) ( not ( = ?AUTO_3331 ?AUTO_3330 ) ) ( OBJ-AT ?AUTO_3326 ?AUTO_3338 ) ( AIRPLANE-AT ?AUTO_3335 ?AUTO_3338 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3326 ?AUTO_3335 ?AUTO_3338 )
      ( DELIVER-PKG ?AUTO_3326 ?AUTO_3327 )
      ( DELIVER-PKG-VERIFY ?AUTO_3326 ?AUTO_3327 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3340 - OBJ
      ?AUTO_3341 - LOCATION
    )
    :vars
    (
      ?AUTO_3351 - LOCATION
      ?AUTO_3346 - CITY
      ?AUTO_3350 - LOCATION
      ?AUTO_3347 - AIRPLANE
      ?AUTO_3345 - TRUCK
      ?AUTO_3349 - LOCATION
      ?AUTO_3344 - CITY
      ?AUTO_3348 - LOCATION
      ?AUTO_3352 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3351 ?AUTO_3346 ) ( IN-CITY ?AUTO_3341 ?AUTO_3346 ) ( not ( = ?AUTO_3341 ?AUTO_3351 ) ) ( AIRPORT ?AUTO_3350 ) ( AIRPORT ?AUTO_3351 ) ( AIRPLANE-AT ?AUTO_3347 ?AUTO_3350 ) ( not ( = ?AUTO_3350 ?AUTO_3351 ) ) ( TRUCK-AT ?AUTO_3345 ?AUTO_3349 ) ( IN-CITY ?AUTO_3349 ?AUTO_3344 ) ( IN-CITY ?AUTO_3351 ?AUTO_3344 ) ( not ( = ?AUTO_3351 ?AUTO_3349 ) ) ( AIRPLANE-AT ?AUTO_3347 ?AUTO_3348 ) ( TRUCK-AT ?AUTO_3352 ?AUTO_3348 ) ( IN-TRUCK ?AUTO_3340 ?AUTO_3352 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3340 ?AUTO_3352 ?AUTO_3348 )
      ( DELIVER-PKG ?AUTO_3340 ?AUTO_3341 )
      ( DELIVER-PKG-VERIFY ?AUTO_3340 ?AUTO_3341 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3355 - OBJ
      ?AUTO_3356 - LOCATION
    )
    :vars
    (
      ?AUTO_3364 - LOCATION
      ?AUTO_3367 - CITY
      ?AUTO_3365 - LOCATION
      ?AUTO_3366 - AIRPLANE
      ?AUTO_3358 - TRUCK
      ?AUTO_3361 - LOCATION
      ?AUTO_3363 - CITY
      ?AUTO_3359 - LOCATION
      ?AUTO_3360 - TRUCK
      ?AUTO_3370 - LOCATION
      ?AUTO_3369 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3364 ?AUTO_3367 ) ( IN-CITY ?AUTO_3356 ?AUTO_3367 ) ( not ( = ?AUTO_3356 ?AUTO_3364 ) ) ( AIRPORT ?AUTO_3365 ) ( AIRPORT ?AUTO_3364 ) ( AIRPLANE-AT ?AUTO_3366 ?AUTO_3365 ) ( not ( = ?AUTO_3365 ?AUTO_3364 ) ) ( TRUCK-AT ?AUTO_3358 ?AUTO_3361 ) ( IN-CITY ?AUTO_3361 ?AUTO_3363 ) ( IN-CITY ?AUTO_3364 ?AUTO_3363 ) ( not ( = ?AUTO_3364 ?AUTO_3361 ) ) ( AIRPLANE-AT ?AUTO_3366 ?AUTO_3359 ) ( IN-TRUCK ?AUTO_3355 ?AUTO_3360 ) ( TRUCK-AT ?AUTO_3360 ?AUTO_3370 ) ( IN-CITY ?AUTO_3370 ?AUTO_3369 ) ( IN-CITY ?AUTO_3359 ?AUTO_3369 ) ( not ( = ?AUTO_3359 ?AUTO_3370 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3360 ?AUTO_3370 ?AUTO_3359 ?AUTO_3369 )
      ( DELIVER-PKG ?AUTO_3355 ?AUTO_3356 )
      ( DELIVER-PKG-VERIFY ?AUTO_3355 ?AUTO_3356 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3372 - OBJ
      ?AUTO_3373 - LOCATION
    )
    :vars
    (
      ?AUTO_3379 - LOCATION
      ?AUTO_3378 - CITY
      ?AUTO_3381 - LOCATION
      ?AUTO_3377 - AIRPLANE
      ?AUTO_3385 - TRUCK
      ?AUTO_3382 - LOCATION
      ?AUTO_3380 - CITY
      ?AUTO_3384 - LOCATION
      ?AUTO_3383 - TRUCK
      ?AUTO_3375 - LOCATION
      ?AUTO_3386 - CITY
      ?AUTO_3388 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3379 ?AUTO_3378 ) ( IN-CITY ?AUTO_3373 ?AUTO_3378 ) ( not ( = ?AUTO_3373 ?AUTO_3379 ) ) ( AIRPORT ?AUTO_3381 ) ( AIRPORT ?AUTO_3379 ) ( AIRPLANE-AT ?AUTO_3377 ?AUTO_3381 ) ( not ( = ?AUTO_3381 ?AUTO_3379 ) ) ( TRUCK-AT ?AUTO_3385 ?AUTO_3382 ) ( IN-CITY ?AUTO_3382 ?AUTO_3380 ) ( IN-CITY ?AUTO_3379 ?AUTO_3380 ) ( not ( = ?AUTO_3379 ?AUTO_3382 ) ) ( AIRPLANE-AT ?AUTO_3377 ?AUTO_3384 ) ( TRUCK-AT ?AUTO_3383 ?AUTO_3375 ) ( IN-CITY ?AUTO_3375 ?AUTO_3386 ) ( IN-CITY ?AUTO_3384 ?AUTO_3386 ) ( not ( = ?AUTO_3384 ?AUTO_3375 ) ) ( TRUCK-AT ?AUTO_3383 ?AUTO_3388 ) ( OBJ-AT ?AUTO_3372 ?AUTO_3388 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3372 ?AUTO_3383 ?AUTO_3388 )
      ( DELIVER-PKG ?AUTO_3372 ?AUTO_3373 )
      ( DELIVER-PKG-VERIFY ?AUTO_3372 ?AUTO_3373 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3390 - OBJ
      ?AUTO_3391 - LOCATION
    )
    :vars
    (
      ?AUTO_3393 - LOCATION
      ?AUTO_3397 - CITY
      ?AUTO_3399 - LOCATION
      ?AUTO_3394 - AIRPLANE
      ?AUTO_3398 - TRUCK
      ?AUTO_3401 - LOCATION
      ?AUTO_3403 - CITY
      ?AUTO_3405 - LOCATION
      ?AUTO_3404 - LOCATION
      ?AUTO_3400 - CITY
      ?AUTO_3402 - TRUCK
      ?AUTO_3408 - LOCATION
      ?AUTO_3407 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3393 ?AUTO_3397 ) ( IN-CITY ?AUTO_3391 ?AUTO_3397 ) ( not ( = ?AUTO_3391 ?AUTO_3393 ) ) ( AIRPORT ?AUTO_3399 ) ( AIRPORT ?AUTO_3393 ) ( AIRPLANE-AT ?AUTO_3394 ?AUTO_3399 ) ( not ( = ?AUTO_3399 ?AUTO_3393 ) ) ( TRUCK-AT ?AUTO_3398 ?AUTO_3401 ) ( IN-CITY ?AUTO_3401 ?AUTO_3403 ) ( IN-CITY ?AUTO_3393 ?AUTO_3403 ) ( not ( = ?AUTO_3393 ?AUTO_3401 ) ) ( AIRPLANE-AT ?AUTO_3394 ?AUTO_3405 ) ( IN-CITY ?AUTO_3404 ?AUTO_3400 ) ( IN-CITY ?AUTO_3405 ?AUTO_3400 ) ( not ( = ?AUTO_3405 ?AUTO_3404 ) ) ( OBJ-AT ?AUTO_3390 ?AUTO_3404 ) ( TRUCK-AT ?AUTO_3402 ?AUTO_3408 ) ( IN-CITY ?AUTO_3408 ?AUTO_3407 ) ( IN-CITY ?AUTO_3404 ?AUTO_3407 ) ( not ( = ?AUTO_3404 ?AUTO_3408 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3402 ?AUTO_3408 ?AUTO_3404 ?AUTO_3407 )
      ( DELIVER-PKG ?AUTO_3390 ?AUTO_3391 )
      ( DELIVER-PKG-VERIFY ?AUTO_3390 ?AUTO_3391 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3416 - OBJ
      ?AUTO_3417 - LOCATION
    )
    :vars
    (
      ?AUTO_3418 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3416 ?AUTO_3418 ) ( AIRPLANE-AT ?AUTO_3418 ?AUTO_3417 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3416 ?AUTO_3418 ?AUTO_3417 )
      ( DELIVER-PKG-VERIFY ?AUTO_3416 ?AUTO_3417 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3425 - OBJ
      ?AUTO_3426 - LOCATION
    )
    :vars
    (
      ?AUTO_3427 - AIRPLANE
      ?AUTO_3431 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3425 ?AUTO_3427 ) ( AIRPORT ?AUTO_3431 ) ( AIRPORT ?AUTO_3426 ) ( AIRPLANE-AT ?AUTO_3427 ?AUTO_3431 ) ( not ( = ?AUTO_3431 ?AUTO_3426 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3427 ?AUTO_3431 ?AUTO_3426 )
      ( DELIVER-PKG ?AUTO_3425 ?AUTO_3426 )
      ( DELIVER-PKG-VERIFY ?AUTO_3425 ?AUTO_3426 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3441 - OBJ
      ?AUTO_3442 - LOCATION
    )
    :vars
    (
      ?AUTO_3444 - LOCATION
      ?AUTO_3446 - AIRPLANE
      ?AUTO_3448 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3444 ) ( AIRPORT ?AUTO_3442 ) ( AIRPLANE-AT ?AUTO_3446 ?AUTO_3444 ) ( not ( = ?AUTO_3444 ?AUTO_3442 ) ) ( OBJ-AT ?AUTO_3441 ?AUTO_3448 ) ( AIRPLANE-AT ?AUTO_3446 ?AUTO_3448 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3441 ?AUTO_3446 ?AUTO_3448 )
      ( DELIVER-PKG ?AUTO_3441 ?AUTO_3442 )
      ( DELIVER-PKG-VERIFY ?AUTO_3441 ?AUTO_3442 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3460 - OBJ
      ?AUTO_3461 - LOCATION
    )
    :vars
    (
      ?AUTO_3467 - TRUCK
      ?AUTO_3469 - LOCATION
      ?AUTO_3470 - CITY
      ?AUTO_3468 - LOCATION
      ?AUTO_3465 - LOCATION
      ?AUTO_3466 - LOCATION
      ?AUTO_3462 - AIRPLANE
      ?AUTO_3471 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3467 ?AUTO_3469 ) ( IN-CITY ?AUTO_3469 ?AUTO_3470 ) ( IN-CITY ?AUTO_3461 ?AUTO_3470 ) ( not ( = ?AUTO_3461 ?AUTO_3469 ) ) ( TRUCK-AT ?AUTO_3467 ?AUTO_3468 ) ( AIRPORT ?AUTO_3465 ) ( AIRPORT ?AUTO_3468 ) ( not ( = ?AUTO_3465 ?AUTO_3468 ) ) ( AIRPORT ?AUTO_3466 ) ( AIRPLANE-AT ?AUTO_3462 ?AUTO_3466 ) ( not ( = ?AUTO_3466 ?AUTO_3465 ) ) ( TRUCK-AT ?AUTO_3471 ?AUTO_3465 ) ( IN-TRUCK ?AUTO_3460 ?AUTO_3471 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3460 ?AUTO_3471 ?AUTO_3465 )
      ( DELIVER-PKG ?AUTO_3460 ?AUTO_3461 )
      ( DELIVER-PKG-VERIFY ?AUTO_3460 ?AUTO_3461 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3474 - OBJ
      ?AUTO_3475 - LOCATION
    )
    :vars
    (
      ?AUTO_3483 - TRUCK
      ?AUTO_3477 - LOCATION
      ?AUTO_3478 - CITY
      ?AUTO_3480 - LOCATION
      ?AUTO_3481 - LOCATION
      ?AUTO_3484 - LOCATION
      ?AUTO_3479 - AIRPLANE
      ?AUTO_3485 - TRUCK
      ?AUTO_3488 - LOCATION
      ?AUTO_3487 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3483 ?AUTO_3477 ) ( IN-CITY ?AUTO_3477 ?AUTO_3478 ) ( IN-CITY ?AUTO_3475 ?AUTO_3478 ) ( not ( = ?AUTO_3475 ?AUTO_3477 ) ) ( TRUCK-AT ?AUTO_3483 ?AUTO_3480 ) ( AIRPORT ?AUTO_3481 ) ( AIRPORT ?AUTO_3480 ) ( not ( = ?AUTO_3481 ?AUTO_3480 ) ) ( AIRPORT ?AUTO_3484 ) ( AIRPLANE-AT ?AUTO_3479 ?AUTO_3484 ) ( not ( = ?AUTO_3484 ?AUTO_3481 ) ) ( IN-TRUCK ?AUTO_3474 ?AUTO_3485 ) ( TRUCK-AT ?AUTO_3485 ?AUTO_3488 ) ( IN-CITY ?AUTO_3488 ?AUTO_3487 ) ( IN-CITY ?AUTO_3481 ?AUTO_3487 ) ( not ( = ?AUTO_3481 ?AUTO_3488 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3485 ?AUTO_3488 ?AUTO_3481 ?AUTO_3487 )
      ( DELIVER-PKG ?AUTO_3474 ?AUTO_3475 )
      ( DELIVER-PKG-VERIFY ?AUTO_3474 ?AUTO_3475 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3490 - OBJ
      ?AUTO_3491 - LOCATION
    )
    :vars
    (
      ?AUTO_3502 - TRUCK
      ?AUTO_3493 - LOCATION
      ?AUTO_3494 - CITY
      ?AUTO_3498 - LOCATION
      ?AUTO_3501 - LOCATION
      ?AUTO_3500 - LOCATION
      ?AUTO_3492 - AIRPLANE
      ?AUTO_3497 - TRUCK
      ?AUTO_3495 - LOCATION
      ?AUTO_3503 - CITY
      ?AUTO_3505 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3502 ?AUTO_3493 ) ( IN-CITY ?AUTO_3493 ?AUTO_3494 ) ( IN-CITY ?AUTO_3491 ?AUTO_3494 ) ( not ( = ?AUTO_3491 ?AUTO_3493 ) ) ( TRUCK-AT ?AUTO_3502 ?AUTO_3498 ) ( AIRPORT ?AUTO_3501 ) ( AIRPORT ?AUTO_3498 ) ( not ( = ?AUTO_3501 ?AUTO_3498 ) ) ( AIRPORT ?AUTO_3500 ) ( AIRPLANE-AT ?AUTO_3492 ?AUTO_3500 ) ( not ( = ?AUTO_3500 ?AUTO_3501 ) ) ( TRUCK-AT ?AUTO_3497 ?AUTO_3495 ) ( IN-CITY ?AUTO_3495 ?AUTO_3503 ) ( IN-CITY ?AUTO_3501 ?AUTO_3503 ) ( not ( = ?AUTO_3501 ?AUTO_3495 ) ) ( TRUCK-AT ?AUTO_3497 ?AUTO_3505 ) ( OBJ-AT ?AUTO_3490 ?AUTO_3505 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3490 ?AUTO_3497 ?AUTO_3505 )
      ( DELIVER-PKG ?AUTO_3490 ?AUTO_3491 )
      ( DELIVER-PKG-VERIFY ?AUTO_3490 ?AUTO_3491 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3507 - OBJ
      ?AUTO_3508 - LOCATION
    )
    :vars
    (
      ?AUTO_3512 - TRUCK
      ?AUTO_3518 - LOCATION
      ?AUTO_3519 - CITY
      ?AUTO_3509 - LOCATION
      ?AUTO_3516 - LOCATION
      ?AUTO_3517 - LOCATION
      ?AUTO_3515 - AIRPLANE
      ?AUTO_3514 - LOCATION
      ?AUTO_3520 - CITY
      ?AUTO_3510 - TRUCK
      ?AUTO_3524 - LOCATION
      ?AUTO_3523 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3512 ?AUTO_3518 ) ( IN-CITY ?AUTO_3518 ?AUTO_3519 ) ( IN-CITY ?AUTO_3508 ?AUTO_3519 ) ( not ( = ?AUTO_3508 ?AUTO_3518 ) ) ( TRUCK-AT ?AUTO_3512 ?AUTO_3509 ) ( AIRPORT ?AUTO_3516 ) ( AIRPORT ?AUTO_3509 ) ( not ( = ?AUTO_3516 ?AUTO_3509 ) ) ( AIRPORT ?AUTO_3517 ) ( AIRPLANE-AT ?AUTO_3515 ?AUTO_3517 ) ( not ( = ?AUTO_3517 ?AUTO_3516 ) ) ( IN-CITY ?AUTO_3514 ?AUTO_3520 ) ( IN-CITY ?AUTO_3516 ?AUTO_3520 ) ( not ( = ?AUTO_3516 ?AUTO_3514 ) ) ( OBJ-AT ?AUTO_3507 ?AUTO_3514 ) ( TRUCK-AT ?AUTO_3510 ?AUTO_3524 ) ( IN-CITY ?AUTO_3524 ?AUTO_3523 ) ( IN-CITY ?AUTO_3514 ?AUTO_3523 ) ( not ( = ?AUTO_3514 ?AUTO_3524 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3510 ?AUTO_3524 ?AUTO_3514 ?AUTO_3523 )
      ( DELIVER-PKG ?AUTO_3507 ?AUTO_3508 )
      ( DELIVER-PKG-VERIFY ?AUTO_3507 ?AUTO_3508 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3527 - OBJ
      ?AUTO_3528 - LOCATION
    )
    :vars
    (
      ?AUTO_3529 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3527 ?AUTO_3529 ) ( AIRPLANE-AT ?AUTO_3529 ?AUTO_3528 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3527 ?AUTO_3529 ?AUTO_3528 )
      ( DELIVER-PKG-VERIFY ?AUTO_3527 ?AUTO_3528 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3532 - OBJ
      ?AUTO_3533 - LOCATION
    )
    :vars
    (
      ?AUTO_3536 - AIRPLANE
      ?AUTO_3538 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3532 ?AUTO_3536 ) ( AIRPORT ?AUTO_3538 ) ( AIRPORT ?AUTO_3533 ) ( AIRPLANE-AT ?AUTO_3536 ?AUTO_3538 ) ( not ( = ?AUTO_3538 ?AUTO_3533 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3536 ?AUTO_3538 ?AUTO_3533 )
      ( DELIVER-PKG ?AUTO_3532 ?AUTO_3533 )
      ( DELIVER-PKG-VERIFY ?AUTO_3532 ?AUTO_3533 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3540 - OBJ
      ?AUTO_3541 - LOCATION
    )
    :vars
    (
      ?AUTO_3545 - LOCATION
      ?AUTO_3544 - AIRPLANE
      ?AUTO_3547 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3545 ) ( AIRPORT ?AUTO_3541 ) ( AIRPLANE-AT ?AUTO_3544 ?AUTO_3545 ) ( not ( = ?AUTO_3545 ?AUTO_3541 ) ) ( OBJ-AT ?AUTO_3540 ?AUTO_3547 ) ( AIRPLANE-AT ?AUTO_3544 ?AUTO_3547 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3540 ?AUTO_3544 ?AUTO_3547 )
      ( DELIVER-PKG ?AUTO_3540 ?AUTO_3541 )
      ( DELIVER-PKG-VERIFY ?AUTO_3540 ?AUTO_3541 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3549 - OBJ
      ?AUTO_3550 - LOCATION
    )
    :vars
    (
      ?AUTO_3555 - LOCATION
      ?AUTO_3557 - LOCATION
      ?AUTO_3553 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3555 ) ( AIRPORT ?AUTO_3550 ) ( not ( = ?AUTO_3555 ?AUTO_3550 ) ) ( OBJ-AT ?AUTO_3549 ?AUTO_3555 ) ( AIRPORT ?AUTO_3557 ) ( AIRPLANE-AT ?AUTO_3553 ?AUTO_3557 ) ( not ( = ?AUTO_3557 ?AUTO_3555 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3553 ?AUTO_3557 ?AUTO_3555 )
      ( DELIVER-PKG ?AUTO_3549 ?AUTO_3550 )
      ( DELIVER-PKG-VERIFY ?AUTO_3549 ?AUTO_3550 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3563 - OBJ
      ?AUTO_3564 - LOCATION
    )
    :vars
    (
      ?AUTO_3565 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3565 ?AUTO_3564 ) ( IN-TRUCK ?AUTO_3563 ?AUTO_3565 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3563 ?AUTO_3565 ?AUTO_3564 )
      ( DELIVER-PKG-VERIFY ?AUTO_3563 ?AUTO_3564 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3568 - OBJ
      ?AUTO_3569 - LOCATION
    )
    :vars
    (
      ?AUTO_3572 - TRUCK
      ?AUTO_3575 - LOCATION
      ?AUTO_3574 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3568 ?AUTO_3572 ) ( TRUCK-AT ?AUTO_3572 ?AUTO_3575 ) ( IN-CITY ?AUTO_3575 ?AUTO_3574 ) ( IN-CITY ?AUTO_3569 ?AUTO_3574 ) ( not ( = ?AUTO_3569 ?AUTO_3575 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3572 ?AUTO_3575 ?AUTO_3569 ?AUTO_3574 )
      ( DELIVER-PKG ?AUTO_3568 ?AUTO_3569 )
      ( DELIVER-PKG-VERIFY ?AUTO_3568 ?AUTO_3569 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3579 - OBJ
      ?AUTO_3580 - LOCATION
    )
    :vars
    (
      ?AUTO_3581 - TRUCK
      ?AUTO_3583 - LOCATION
      ?AUTO_3584 - CITY
      ?AUTO_3587 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3581 ?AUTO_3583 ) ( IN-CITY ?AUTO_3583 ?AUTO_3584 ) ( IN-CITY ?AUTO_3580 ?AUTO_3584 ) ( not ( = ?AUTO_3580 ?AUTO_3583 ) ) ( TRUCK-AT ?AUTO_3581 ?AUTO_3587 ) ( OBJ-AT ?AUTO_3579 ?AUTO_3587 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3579 ?AUTO_3581 ?AUTO_3587 )
      ( DELIVER-PKG ?AUTO_3579 ?AUTO_3580 )
      ( DELIVER-PKG-VERIFY ?AUTO_3579 ?AUTO_3580 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3589 - OBJ
      ?AUTO_3590 - LOCATION
    )
    :vars
    (
      ?AUTO_3596 - LOCATION
      ?AUTO_3595 - CITY
      ?AUTO_3593 - TRUCK
      ?AUTO_3599 - LOCATION
      ?AUTO_3598 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3596 ?AUTO_3595 ) ( IN-CITY ?AUTO_3590 ?AUTO_3595 ) ( not ( = ?AUTO_3590 ?AUTO_3596 ) ) ( OBJ-AT ?AUTO_3589 ?AUTO_3596 ) ( TRUCK-AT ?AUTO_3593 ?AUTO_3599 ) ( IN-CITY ?AUTO_3599 ?AUTO_3598 ) ( IN-CITY ?AUTO_3596 ?AUTO_3598 ) ( not ( = ?AUTO_3596 ?AUTO_3599 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3593 ?AUTO_3599 ?AUTO_3596 ?AUTO_3598 )
      ( DELIVER-PKG ?AUTO_3589 ?AUTO_3590 )
      ( DELIVER-PKG-VERIFY ?AUTO_3589 ?AUTO_3590 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3613 - OBJ
      ?AUTO_3614 - LOCATION
    )
    :vars
    (
      ?AUTO_3615 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3615 ?AUTO_3614 ) ( IN-TRUCK ?AUTO_3613 ?AUTO_3615 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3613 ?AUTO_3615 ?AUTO_3614 )
      ( DELIVER-PKG-VERIFY ?AUTO_3613 ?AUTO_3614 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3624 - OBJ
      ?AUTO_3625 - LOCATION
    )
    :vars
    (
      ?AUTO_3627 - TRUCK
      ?AUTO_3628 - LOCATION
      ?AUTO_3626 - CITY
      ?AUTO_3632 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3627 ?AUTO_3628 ) ( IN-CITY ?AUTO_3628 ?AUTO_3626 ) ( IN-CITY ?AUTO_3625 ?AUTO_3626 ) ( not ( = ?AUTO_3625 ?AUTO_3628 ) ) ( TRUCK-AT ?AUTO_3627 ?AUTO_3632 ) ( OBJ-AT ?AUTO_3624 ?AUTO_3632 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3624 ?AUTO_3627 ?AUTO_3632 )
      ( DELIVER-PKG ?AUTO_3624 ?AUTO_3625 )
      ( DELIVER-PKG-VERIFY ?AUTO_3624 ?AUTO_3625 ) )
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
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3652 ?AUTO_3651 ) ( IN-TRUCK ?AUTO_3650 ?AUTO_3652 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3650 ?AUTO_3652 ?AUTO_3651 )
      ( DELIVER-PKG-VERIFY ?AUTO_3650 ?AUTO_3651 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3655 - OBJ
      ?AUTO_3656 - LOCATION
    )
    :vars
    (
      ?AUTO_3659 - TRUCK
      ?AUTO_3662 - LOCATION
      ?AUTO_3661 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3655 ?AUTO_3659 ) ( TRUCK-AT ?AUTO_3659 ?AUTO_3662 ) ( IN-CITY ?AUTO_3662 ?AUTO_3661 ) ( IN-CITY ?AUTO_3656 ?AUTO_3661 ) ( not ( = ?AUTO_3656 ?AUTO_3662 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3659 ?AUTO_3662 ?AUTO_3656 ?AUTO_3661 )
      ( DELIVER-PKG ?AUTO_3655 ?AUTO_3656 )
      ( DELIVER-PKG-VERIFY ?AUTO_3655 ?AUTO_3656 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3666 - OBJ
      ?AUTO_3667 - LOCATION
    )
    :vars
    (
      ?AUTO_3668 - TRUCK
      ?AUTO_3670 - LOCATION
      ?AUTO_3671 - CITY
      ?AUTO_3674 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3668 ?AUTO_3670 ) ( IN-CITY ?AUTO_3670 ?AUTO_3671 ) ( IN-CITY ?AUTO_3667 ?AUTO_3671 ) ( not ( = ?AUTO_3667 ?AUTO_3670 ) ) ( TRUCK-AT ?AUTO_3668 ?AUTO_3674 ) ( OBJ-AT ?AUTO_3666 ?AUTO_3674 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3666 ?AUTO_3668 ?AUTO_3674 )
      ( DELIVER-PKG ?AUTO_3666 ?AUTO_3667 )
      ( DELIVER-PKG-VERIFY ?AUTO_3666 ?AUTO_3667 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3678 - OBJ
      ?AUTO_3679 - LOCATION
    )
    :vars
    (
      ?AUTO_3682 - LOCATION
      ?AUTO_3685 - CITY
      ?AUTO_3683 - TRUCK
      ?AUTO_3688 - LOCATION
      ?AUTO_3687 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3682 ?AUTO_3685 ) ( IN-CITY ?AUTO_3679 ?AUTO_3685 ) ( not ( = ?AUTO_3679 ?AUTO_3682 ) ) ( OBJ-AT ?AUTO_3678 ?AUTO_3682 ) ( TRUCK-AT ?AUTO_3683 ?AUTO_3688 ) ( IN-CITY ?AUTO_3688 ?AUTO_3687 ) ( IN-CITY ?AUTO_3682 ?AUTO_3687 ) ( not ( = ?AUTO_3682 ?AUTO_3688 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3683 ?AUTO_3688 ?AUTO_3682 ?AUTO_3687 )
      ( DELIVER-PKG ?AUTO_3678 ?AUTO_3679 )
      ( DELIVER-PKG-VERIFY ?AUTO_3678 ?AUTO_3679 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3708 - OBJ
      ?AUTO_3709 - LOCATION
    )
    :vars
    (
      ?AUTO_3710 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3708 ?AUTO_3710 ) ( AIRPLANE-AT ?AUTO_3710 ?AUTO_3709 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3708 ?AUTO_3710 ?AUTO_3709 )
      ( DELIVER-PKG-VERIFY ?AUTO_3708 ?AUTO_3709 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3717 - OBJ
      ?AUTO_3718 - LOCATION
    )
    :vars
    (
      ?AUTO_3721 - AIRPLANE
      ?AUTO_3723 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3717 ?AUTO_3721 ) ( AIRPORT ?AUTO_3723 ) ( AIRPORT ?AUTO_3718 ) ( AIRPLANE-AT ?AUTO_3721 ?AUTO_3723 ) ( not ( = ?AUTO_3723 ?AUTO_3718 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3721 ?AUTO_3723 ?AUTO_3718 )
      ( DELIVER-PKG ?AUTO_3717 ?AUTO_3718 )
      ( DELIVER-PKG-VERIFY ?AUTO_3717 ?AUTO_3718 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3725 - OBJ
      ?AUTO_3726 - LOCATION
    )
    :vars
    (
      ?AUTO_3730 - LOCATION
      ?AUTO_3729 - AIRPLANE
      ?AUTO_3732 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3730 ) ( AIRPORT ?AUTO_3726 ) ( AIRPLANE-AT ?AUTO_3729 ?AUTO_3730 ) ( not ( = ?AUTO_3730 ?AUTO_3726 ) ) ( OBJ-AT ?AUTO_3725 ?AUTO_3732 ) ( AIRPLANE-AT ?AUTO_3729 ?AUTO_3732 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3725 ?AUTO_3729 ?AUTO_3732 )
      ( DELIVER-PKG ?AUTO_3725 ?AUTO_3726 )
      ( DELIVER-PKG-VERIFY ?AUTO_3725 ?AUTO_3726 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3736 - OBJ
      ?AUTO_3737 - LOCATION
    )
    :vars
    (
      ?AUTO_3742 - LOCATION
      ?AUTO_3744 - LOCATION
      ?AUTO_3739 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3742 ) ( AIRPORT ?AUTO_3737 ) ( not ( = ?AUTO_3742 ?AUTO_3737 ) ) ( OBJ-AT ?AUTO_3736 ?AUTO_3742 ) ( AIRPORT ?AUTO_3744 ) ( AIRPLANE-AT ?AUTO_3739 ?AUTO_3744 ) ( not ( = ?AUTO_3744 ?AUTO_3742 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3739 ?AUTO_3744 ?AUTO_3742 )
      ( DELIVER-PKG ?AUTO_3736 ?AUTO_3737 )
      ( DELIVER-PKG-VERIFY ?AUTO_3736 ?AUTO_3737 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3776 - OBJ
      ?AUTO_3777 - LOCATION
    )
    :vars
    (
      ?AUTO_3778 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3776 ?AUTO_3778 ) ( AIRPLANE-AT ?AUTO_3778 ?AUTO_3777 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3776 ?AUTO_3778 ?AUTO_3777 )
      ( DELIVER-PKG-VERIFY ?AUTO_3776 ?AUTO_3777 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3783 - OBJ
      ?AUTO_3784 - LOCATION
    )
    :vars
    (
      ?AUTO_3787 - AIRPLANE
      ?AUTO_3789 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_3783 ?AUTO_3787 ) ( AIRPORT ?AUTO_3789 ) ( AIRPORT ?AUTO_3784 ) ( AIRPLANE-AT ?AUTO_3787 ?AUTO_3789 ) ( not ( = ?AUTO_3789 ?AUTO_3784 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3787 ?AUTO_3789 ?AUTO_3784 )
      ( DELIVER-PKG ?AUTO_3783 ?AUTO_3784 )
      ( DELIVER-PKG-VERIFY ?AUTO_3783 ?AUTO_3784 ) )
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
      ?AUTO_3795 - AIRPLANE
      ?AUTO_3798 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3796 ) ( AIRPORT ?AUTO_3792 ) ( AIRPLANE-AT ?AUTO_3795 ?AUTO_3796 ) ( not ( = ?AUTO_3796 ?AUTO_3792 ) ) ( OBJ-AT ?AUTO_3791 ?AUTO_3798 ) ( AIRPLANE-AT ?AUTO_3795 ?AUTO_3798 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3791 ?AUTO_3795 ?AUTO_3798 )
      ( DELIVER-PKG ?AUTO_3791 ?AUTO_3792 )
      ( DELIVER-PKG-VERIFY ?AUTO_3791 ?AUTO_3792 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3804 - OBJ
      ?AUTO_3805 - LOCATION
    )
    :vars
    (
      ?AUTO_3809 - LOCATION
      ?AUTO_3812 - LOCATION
      ?AUTO_3807 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3809 ) ( AIRPORT ?AUTO_3805 ) ( not ( = ?AUTO_3809 ?AUTO_3805 ) ) ( OBJ-AT ?AUTO_3804 ?AUTO_3809 ) ( AIRPORT ?AUTO_3812 ) ( AIRPLANE-AT ?AUTO_3807 ?AUTO_3812 ) ( not ( = ?AUTO_3812 ?AUTO_3809 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3807 ?AUTO_3812 ?AUTO_3809 )
      ( DELIVER-PKG ?AUTO_3804 ?AUTO_3805 )
      ( DELIVER-PKG-VERIFY ?AUTO_3804 ?AUTO_3805 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3824 - OBJ
      ?AUTO_3825 - LOCATION
    )
    :vars
    (
      ?AUTO_3828 - LOCATION
      ?AUTO_3826 - LOCATION
      ?AUTO_3829 - AIRPLANE
      ?AUTO_3831 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3828 ) ( AIRPORT ?AUTO_3825 ) ( not ( = ?AUTO_3828 ?AUTO_3825 ) ) ( AIRPORT ?AUTO_3826 ) ( AIRPLANE-AT ?AUTO_3829 ?AUTO_3826 ) ( not ( = ?AUTO_3826 ?AUTO_3828 ) ) ( TRUCK-AT ?AUTO_3831 ?AUTO_3828 ) ( IN-TRUCK ?AUTO_3824 ?AUTO_3831 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3824 ?AUTO_3831 ?AUTO_3828 )
      ( DELIVER-PKG ?AUTO_3824 ?AUTO_3825 )
      ( DELIVER-PKG-VERIFY ?AUTO_3824 ?AUTO_3825 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3834 - OBJ
      ?AUTO_3835 - LOCATION
    )
    :vars
    (
      ?AUTO_3840 - LOCATION
      ?AUTO_3838 - LOCATION
      ?AUTO_3839 - AIRPLANE
      ?AUTO_3841 - TRUCK
      ?AUTO_3844 - LOCATION
      ?AUTO_3843 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3840 ) ( AIRPORT ?AUTO_3835 ) ( not ( = ?AUTO_3840 ?AUTO_3835 ) ) ( AIRPORT ?AUTO_3838 ) ( AIRPLANE-AT ?AUTO_3839 ?AUTO_3838 ) ( not ( = ?AUTO_3838 ?AUTO_3840 ) ) ( IN-TRUCK ?AUTO_3834 ?AUTO_3841 ) ( TRUCK-AT ?AUTO_3841 ?AUTO_3844 ) ( IN-CITY ?AUTO_3844 ?AUTO_3843 ) ( IN-CITY ?AUTO_3840 ?AUTO_3843 ) ( not ( = ?AUTO_3840 ?AUTO_3844 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3841 ?AUTO_3844 ?AUTO_3840 ?AUTO_3843 )
      ( DELIVER-PKG ?AUTO_3834 ?AUTO_3835 )
      ( DELIVER-PKG-VERIFY ?AUTO_3834 ?AUTO_3835 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3848 - OBJ
      ?AUTO_3849 - LOCATION
    )
    :vars
    (
      ?AUTO_3852 - LOCATION
      ?AUTO_3856 - LOCATION
      ?AUTO_3850 - AIRPLANE
      ?AUTO_3857 - TRUCK
      ?AUTO_3853 - LOCATION
      ?AUTO_3851 - CITY
      ?AUTO_3859 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3852 ) ( AIRPORT ?AUTO_3849 ) ( not ( = ?AUTO_3852 ?AUTO_3849 ) ) ( AIRPORT ?AUTO_3856 ) ( AIRPLANE-AT ?AUTO_3850 ?AUTO_3856 ) ( not ( = ?AUTO_3856 ?AUTO_3852 ) ) ( TRUCK-AT ?AUTO_3857 ?AUTO_3853 ) ( IN-CITY ?AUTO_3853 ?AUTO_3851 ) ( IN-CITY ?AUTO_3852 ?AUTO_3851 ) ( not ( = ?AUTO_3852 ?AUTO_3853 ) ) ( TRUCK-AT ?AUTO_3857 ?AUTO_3859 ) ( OBJ-AT ?AUTO_3848 ?AUTO_3859 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3848 ?AUTO_3857 ?AUTO_3859 )
      ( DELIVER-PKG ?AUTO_3848 ?AUTO_3849 )
      ( DELIVER-PKG-VERIFY ?AUTO_3848 ?AUTO_3849 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3861 - OBJ
      ?AUTO_3862 - LOCATION
    )
    :vars
    (
      ?AUTO_3867 - LOCATION
      ?AUTO_3866 - LOCATION
      ?AUTO_3868 - AIRPLANE
      ?AUTO_3863 - LOCATION
      ?AUTO_3871 - CITY
      ?AUTO_3869 - TRUCK
      ?AUTO_3874 - LOCATION
      ?AUTO_3873 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3867 ) ( AIRPORT ?AUTO_3862 ) ( not ( = ?AUTO_3867 ?AUTO_3862 ) ) ( AIRPORT ?AUTO_3866 ) ( AIRPLANE-AT ?AUTO_3868 ?AUTO_3866 ) ( not ( = ?AUTO_3866 ?AUTO_3867 ) ) ( IN-CITY ?AUTO_3863 ?AUTO_3871 ) ( IN-CITY ?AUTO_3867 ?AUTO_3871 ) ( not ( = ?AUTO_3867 ?AUTO_3863 ) ) ( OBJ-AT ?AUTO_3861 ?AUTO_3863 ) ( TRUCK-AT ?AUTO_3869 ?AUTO_3874 ) ( IN-CITY ?AUTO_3874 ?AUTO_3873 ) ( IN-CITY ?AUTO_3863 ?AUTO_3873 ) ( not ( = ?AUTO_3863 ?AUTO_3874 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3869 ?AUTO_3874 ?AUTO_3863 ?AUTO_3873 )
      ( DELIVER-PKG ?AUTO_3861 ?AUTO_3862 )
      ( DELIVER-PKG-VERIFY ?AUTO_3861 ?AUTO_3862 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3888 - OBJ
      ?AUTO_3889 - LOCATION
    )
    :vars
    (
      ?AUTO_3890 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3890 ?AUTO_3889 ) ( IN-TRUCK ?AUTO_3888 ?AUTO_3890 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3888 ?AUTO_3890 ?AUTO_3889 )
      ( DELIVER-PKG-VERIFY ?AUTO_3888 ?AUTO_3889 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3893 - OBJ
      ?AUTO_3894 - LOCATION
    )
    :vars
    (
      ?AUTO_3897 - TRUCK
      ?AUTO_3900 - LOCATION
      ?AUTO_3899 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_3893 ?AUTO_3897 ) ( TRUCK-AT ?AUTO_3897 ?AUTO_3900 ) ( IN-CITY ?AUTO_3900 ?AUTO_3899 ) ( IN-CITY ?AUTO_3894 ?AUTO_3899 ) ( not ( = ?AUTO_3894 ?AUTO_3900 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3897 ?AUTO_3900 ?AUTO_3894 ?AUTO_3899 )
      ( DELIVER-PKG ?AUTO_3893 ?AUTO_3894 )
      ( DELIVER-PKG-VERIFY ?AUTO_3893 ?AUTO_3894 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3904 - OBJ
      ?AUTO_3905 - LOCATION
    )
    :vars
    (
      ?AUTO_3906 - TRUCK
      ?AUTO_3908 - LOCATION
      ?AUTO_3909 - CITY
      ?AUTO_3912 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3906 ?AUTO_3908 ) ( IN-CITY ?AUTO_3908 ?AUTO_3909 ) ( IN-CITY ?AUTO_3905 ?AUTO_3909 ) ( not ( = ?AUTO_3905 ?AUTO_3908 ) ) ( TRUCK-AT ?AUTO_3906 ?AUTO_3912 ) ( OBJ-AT ?AUTO_3904 ?AUTO_3912 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3904 ?AUTO_3906 ?AUTO_3912 )
      ( DELIVER-PKG ?AUTO_3904 ?AUTO_3905 )
      ( DELIVER-PKG-VERIFY ?AUTO_3904 ?AUTO_3905 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3916 - OBJ
      ?AUTO_3917 - LOCATION
    )
    :vars
    (
      ?AUTO_3921 - TRUCK
      ?AUTO_3922 - LOCATION
      ?AUTO_3923 - CITY
      ?AUTO_3920 - LOCATION
      ?AUTO_3924 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3921 ?AUTO_3922 ) ( IN-CITY ?AUTO_3922 ?AUTO_3923 ) ( IN-CITY ?AUTO_3917 ?AUTO_3923 ) ( not ( = ?AUTO_3917 ?AUTO_3922 ) ) ( TRUCK-AT ?AUTO_3921 ?AUTO_3920 ) ( IN-AIRPLANE ?AUTO_3916 ?AUTO_3924 ) ( AIRPLANE-AT ?AUTO_3924 ?AUTO_3920 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_3916 ?AUTO_3924 ?AUTO_3920 )
      ( DELIVER-PKG ?AUTO_3916 ?AUTO_3917 )
      ( DELIVER-PKG-VERIFY ?AUTO_3916 ?AUTO_3917 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3931 - OBJ
      ?AUTO_3932 - LOCATION
    )
    :vars
    (
      ?AUTO_3934 - TRUCK
      ?AUTO_3933 - LOCATION
      ?AUTO_3935 - CITY
      ?AUTO_3936 - LOCATION
      ?AUTO_3938 - AIRPLANE
      ?AUTO_3941 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3934 ?AUTO_3933 ) ( IN-CITY ?AUTO_3933 ?AUTO_3935 ) ( IN-CITY ?AUTO_3932 ?AUTO_3935 ) ( not ( = ?AUTO_3932 ?AUTO_3933 ) ) ( TRUCK-AT ?AUTO_3934 ?AUTO_3936 ) ( IN-AIRPLANE ?AUTO_3931 ?AUTO_3938 ) ( AIRPORT ?AUTO_3941 ) ( AIRPORT ?AUTO_3936 ) ( AIRPLANE-AT ?AUTO_3938 ?AUTO_3941 ) ( not ( = ?AUTO_3941 ?AUTO_3936 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3938 ?AUTO_3941 ?AUTO_3936 )
      ( DELIVER-PKG ?AUTO_3931 ?AUTO_3932 )
      ( DELIVER-PKG-VERIFY ?AUTO_3931 ?AUTO_3932 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3943 - OBJ
      ?AUTO_3944 - LOCATION
    )
    :vars
    (
      ?AUTO_3949 - TRUCK
      ?AUTO_3948 - LOCATION
      ?AUTO_3950 - CITY
      ?AUTO_3951 - LOCATION
      ?AUTO_3952 - LOCATION
      ?AUTO_3947 - AIRPLANE
      ?AUTO_3954 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3949 ?AUTO_3948 ) ( IN-CITY ?AUTO_3948 ?AUTO_3950 ) ( IN-CITY ?AUTO_3944 ?AUTO_3950 ) ( not ( = ?AUTO_3944 ?AUTO_3948 ) ) ( TRUCK-AT ?AUTO_3949 ?AUTO_3951 ) ( AIRPORT ?AUTO_3952 ) ( AIRPORT ?AUTO_3951 ) ( AIRPLANE-AT ?AUTO_3947 ?AUTO_3952 ) ( not ( = ?AUTO_3952 ?AUTO_3951 ) ) ( OBJ-AT ?AUTO_3943 ?AUTO_3954 ) ( AIRPLANE-AT ?AUTO_3947 ?AUTO_3954 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_3943 ?AUTO_3947 ?AUTO_3954 )
      ( DELIVER-PKG ?AUTO_3943 ?AUTO_3944 )
      ( DELIVER-PKG-VERIFY ?AUTO_3943 ?AUTO_3944 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3958 - OBJ
      ?AUTO_3959 - LOCATION
    )
    :vars
    (
      ?AUTO_3962 - TRUCK
      ?AUTO_3965 - LOCATION
      ?AUTO_3966 - CITY
      ?AUTO_3964 - LOCATION
      ?AUTO_3968 - LOCATION
      ?AUTO_3970 - LOCATION
      ?AUTO_3967 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3962 ?AUTO_3965 ) ( IN-CITY ?AUTO_3965 ?AUTO_3966 ) ( IN-CITY ?AUTO_3959 ?AUTO_3966 ) ( not ( = ?AUTO_3959 ?AUTO_3965 ) ) ( TRUCK-AT ?AUTO_3962 ?AUTO_3964 ) ( AIRPORT ?AUTO_3968 ) ( AIRPORT ?AUTO_3964 ) ( not ( = ?AUTO_3968 ?AUTO_3964 ) ) ( OBJ-AT ?AUTO_3958 ?AUTO_3968 ) ( AIRPORT ?AUTO_3970 ) ( AIRPLANE-AT ?AUTO_3967 ?AUTO_3970 ) ( not ( = ?AUTO_3970 ?AUTO_3968 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3967 ?AUTO_3970 ?AUTO_3968 )
      ( DELIVER-PKG ?AUTO_3958 ?AUTO_3959 )
      ( DELIVER-PKG-VERIFY ?AUTO_3958 ?AUTO_3959 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3998 - OBJ
      ?AUTO_3999 - LOCATION
    )
    :vars
    (
      ?AUTO_4006 - LOCATION
      ?AUTO_4007 - CITY
      ?AUTO_4005 - LOCATION
      ?AUTO_4000 - LOCATION
      ?AUTO_4003 - AIRPLANE
      ?AUTO_4004 - TRUCK
      ?AUTO_4011 - LOCATION
      ?AUTO_4010 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4006 ?AUTO_4007 ) ( IN-CITY ?AUTO_3999 ?AUTO_4007 ) ( not ( = ?AUTO_3999 ?AUTO_4006 ) ) ( AIRPORT ?AUTO_4005 ) ( AIRPORT ?AUTO_4006 ) ( not ( = ?AUTO_4005 ?AUTO_4006 ) ) ( OBJ-AT ?AUTO_3998 ?AUTO_4005 ) ( AIRPORT ?AUTO_4000 ) ( AIRPLANE-AT ?AUTO_4003 ?AUTO_4000 ) ( not ( = ?AUTO_4000 ?AUTO_4005 ) ) ( TRUCK-AT ?AUTO_4004 ?AUTO_4011 ) ( IN-CITY ?AUTO_4011 ?AUTO_4010 ) ( IN-CITY ?AUTO_4006 ?AUTO_4010 ) ( not ( = ?AUTO_4006 ?AUTO_4011 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4004 ?AUTO_4011 ?AUTO_4006 ?AUTO_4010 )
      ( DELIVER-PKG ?AUTO_3998 ?AUTO_3999 )
      ( DELIVER-PKG-VERIFY ?AUTO_3998 ?AUTO_3999 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4015 - OBJ
      ?AUTO_4016 - LOCATION
    )
    :vars
    (
      ?AUTO_4017 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4017 ?AUTO_4016 ) ( IN-TRUCK ?AUTO_4015 ?AUTO_4017 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4015 ?AUTO_4017 ?AUTO_4016 )
      ( DELIVER-PKG-VERIFY ?AUTO_4015 ?AUTO_4016 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4024 - OBJ
      ?AUTO_4025 - LOCATION
    )
    :vars
    (
      ?AUTO_4027 - TRUCK
      ?AUTO_4028 - LOCATION
      ?AUTO_4026 - CITY
      ?AUTO_4032 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4027 ?AUTO_4028 ) ( IN-CITY ?AUTO_4028 ?AUTO_4026 ) ( IN-CITY ?AUTO_4025 ?AUTO_4026 ) ( not ( = ?AUTO_4025 ?AUTO_4028 ) ) ( TRUCK-AT ?AUTO_4027 ?AUTO_4032 ) ( OBJ-AT ?AUTO_4024 ?AUTO_4032 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4024 ?AUTO_4027 ?AUTO_4032 )
      ( DELIVER-PKG ?AUTO_4024 ?AUTO_4025 )
      ( DELIVER-PKG-VERIFY ?AUTO_4024 ?AUTO_4025 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4036 - OBJ
      ?AUTO_4037 - LOCATION
    )
    :vars
    (
      ?AUTO_4040 - TRUCK
      ?AUTO_4042 - LOCATION
      ?AUTO_4041 - CITY
      ?AUTO_4043 - LOCATION
      ?AUTO_4044 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4040 ?AUTO_4042 ) ( IN-CITY ?AUTO_4042 ?AUTO_4041 ) ( IN-CITY ?AUTO_4037 ?AUTO_4041 ) ( not ( = ?AUTO_4037 ?AUTO_4042 ) ) ( TRUCK-AT ?AUTO_4040 ?AUTO_4043 ) ( IN-AIRPLANE ?AUTO_4036 ?AUTO_4044 ) ( AIRPLANE-AT ?AUTO_4044 ?AUTO_4043 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4036 ?AUTO_4044 ?AUTO_4043 )
      ( DELIVER-PKG ?AUTO_4036 ?AUTO_4037 )
      ( DELIVER-PKG-VERIFY ?AUTO_4036 ?AUTO_4037 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4049 - OBJ
      ?AUTO_4050 - LOCATION
    )
    :vars
    (
      ?AUTO_4056 - TRUCK
      ?AUTO_4051 - LOCATION
      ?AUTO_4055 - CITY
      ?AUTO_4052 - LOCATION
      ?AUTO_4057 - AIRPLANE
      ?AUTO_4059 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4056 ?AUTO_4051 ) ( IN-CITY ?AUTO_4051 ?AUTO_4055 ) ( IN-CITY ?AUTO_4050 ?AUTO_4055 ) ( not ( = ?AUTO_4050 ?AUTO_4051 ) ) ( TRUCK-AT ?AUTO_4056 ?AUTO_4052 ) ( IN-AIRPLANE ?AUTO_4049 ?AUTO_4057 ) ( AIRPORT ?AUTO_4059 ) ( AIRPORT ?AUTO_4052 ) ( AIRPLANE-AT ?AUTO_4057 ?AUTO_4059 ) ( not ( = ?AUTO_4059 ?AUTO_4052 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4057 ?AUTO_4059 ?AUTO_4052 )
      ( DELIVER-PKG ?AUTO_4049 ?AUTO_4050 )
      ( DELIVER-PKG-VERIFY ?AUTO_4049 ?AUTO_4050 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4061 - OBJ
      ?AUTO_4062 - LOCATION
    )
    :vars
    (
      ?AUTO_4069 - TRUCK
      ?AUTO_4067 - LOCATION
      ?AUTO_4065 - CITY
      ?AUTO_4068 - LOCATION
      ?AUTO_4070 - LOCATION
      ?AUTO_4066 - AIRPLANE
      ?AUTO_4072 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4069 ?AUTO_4067 ) ( IN-CITY ?AUTO_4067 ?AUTO_4065 ) ( IN-CITY ?AUTO_4062 ?AUTO_4065 ) ( not ( = ?AUTO_4062 ?AUTO_4067 ) ) ( TRUCK-AT ?AUTO_4069 ?AUTO_4068 ) ( AIRPORT ?AUTO_4070 ) ( AIRPORT ?AUTO_4068 ) ( AIRPLANE-AT ?AUTO_4066 ?AUTO_4070 ) ( not ( = ?AUTO_4070 ?AUTO_4068 ) ) ( OBJ-AT ?AUTO_4061 ?AUTO_4072 ) ( AIRPLANE-AT ?AUTO_4066 ?AUTO_4072 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4061 ?AUTO_4066 ?AUTO_4072 )
      ( DELIVER-PKG ?AUTO_4061 ?AUTO_4062 )
      ( DELIVER-PKG-VERIFY ?AUTO_4061 ?AUTO_4062 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4078 - OBJ
      ?AUTO_4079 - LOCATION
    )
    :vars
    (
      ?AUTO_4084 - TRUCK
      ?AUTO_4088 - LOCATION
      ?AUTO_4080 - CITY
      ?AUTO_4082 - LOCATION
      ?AUTO_4083 - LOCATION
      ?AUTO_4090 - LOCATION
      ?AUTO_4085 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4084 ?AUTO_4088 ) ( IN-CITY ?AUTO_4088 ?AUTO_4080 ) ( IN-CITY ?AUTO_4079 ?AUTO_4080 ) ( not ( = ?AUTO_4079 ?AUTO_4088 ) ) ( TRUCK-AT ?AUTO_4084 ?AUTO_4082 ) ( AIRPORT ?AUTO_4083 ) ( AIRPORT ?AUTO_4082 ) ( not ( = ?AUTO_4083 ?AUTO_4082 ) ) ( OBJ-AT ?AUTO_4078 ?AUTO_4083 ) ( AIRPORT ?AUTO_4090 ) ( AIRPLANE-AT ?AUTO_4085 ?AUTO_4090 ) ( not ( = ?AUTO_4090 ?AUTO_4083 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4085 ?AUTO_4090 ?AUTO_4083 )
      ( DELIVER-PKG ?AUTO_4078 ?AUTO_4079 )
      ( DELIVER-PKG-VERIFY ?AUTO_4078 ?AUTO_4079 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4102 - OBJ
      ?AUTO_4103 - LOCATION
    )
    :vars
    (
      ?AUTO_4109 - TRUCK
      ?AUTO_4108 - LOCATION
      ?AUTO_4106 - CITY
      ?AUTO_4105 - LOCATION
      ?AUTO_4104 - LOCATION
      ?AUTO_4107 - LOCATION
      ?AUTO_4112 - AIRPLANE
      ?AUTO_4113 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4109 ?AUTO_4108 ) ( IN-CITY ?AUTO_4108 ?AUTO_4106 ) ( IN-CITY ?AUTO_4103 ?AUTO_4106 ) ( not ( = ?AUTO_4103 ?AUTO_4108 ) ) ( TRUCK-AT ?AUTO_4109 ?AUTO_4105 ) ( AIRPORT ?AUTO_4104 ) ( AIRPORT ?AUTO_4105 ) ( not ( = ?AUTO_4104 ?AUTO_4105 ) ) ( AIRPORT ?AUTO_4107 ) ( AIRPLANE-AT ?AUTO_4112 ?AUTO_4107 ) ( not ( = ?AUTO_4107 ?AUTO_4104 ) ) ( TRUCK-AT ?AUTO_4113 ?AUTO_4104 ) ( IN-TRUCK ?AUTO_4102 ?AUTO_4113 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4102 ?AUTO_4113 ?AUTO_4104 )
      ( DELIVER-PKG ?AUTO_4102 ?AUTO_4103 )
      ( DELIVER-PKG-VERIFY ?AUTO_4102 ?AUTO_4103 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4116 - OBJ
      ?AUTO_4117 - LOCATION
    )
    :vars
    (
      ?AUTO_4121 - TRUCK
      ?AUTO_4123 - LOCATION
      ?AUTO_4126 - CITY
      ?AUTO_4122 - LOCATION
      ?AUTO_4124 - LOCATION
      ?AUTO_4127 - LOCATION
      ?AUTO_4125 - AIRPLANE
      ?AUTO_4120 - TRUCK
      ?AUTO_4130 - LOCATION
      ?AUTO_4129 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4121 ?AUTO_4123 ) ( IN-CITY ?AUTO_4123 ?AUTO_4126 ) ( IN-CITY ?AUTO_4117 ?AUTO_4126 ) ( not ( = ?AUTO_4117 ?AUTO_4123 ) ) ( TRUCK-AT ?AUTO_4121 ?AUTO_4122 ) ( AIRPORT ?AUTO_4124 ) ( AIRPORT ?AUTO_4122 ) ( not ( = ?AUTO_4124 ?AUTO_4122 ) ) ( AIRPORT ?AUTO_4127 ) ( AIRPLANE-AT ?AUTO_4125 ?AUTO_4127 ) ( not ( = ?AUTO_4127 ?AUTO_4124 ) ) ( IN-TRUCK ?AUTO_4116 ?AUTO_4120 ) ( TRUCK-AT ?AUTO_4120 ?AUTO_4130 ) ( IN-CITY ?AUTO_4130 ?AUTO_4129 ) ( IN-CITY ?AUTO_4124 ?AUTO_4129 ) ( not ( = ?AUTO_4124 ?AUTO_4130 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4120 ?AUTO_4130 ?AUTO_4124 ?AUTO_4129 )
      ( DELIVER-PKG ?AUTO_4116 ?AUTO_4117 )
      ( DELIVER-PKG-VERIFY ?AUTO_4116 ?AUTO_4117 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4134 - OBJ
      ?AUTO_4135 - LOCATION
    )
    :vars
    (
      ?AUTO_4146 - TRUCK
      ?AUTO_4145 - LOCATION
      ?AUTO_4144 - CITY
      ?AUTO_4139 - LOCATION
      ?AUTO_4137 - LOCATION
      ?AUTO_4138 - LOCATION
      ?AUTO_4140 - AIRPLANE
      ?AUTO_4147 - TRUCK
      ?AUTO_4143 - LOCATION
      ?AUTO_4141 - CITY
      ?AUTO_4149 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4146 ?AUTO_4145 ) ( IN-CITY ?AUTO_4145 ?AUTO_4144 ) ( IN-CITY ?AUTO_4135 ?AUTO_4144 ) ( not ( = ?AUTO_4135 ?AUTO_4145 ) ) ( TRUCK-AT ?AUTO_4146 ?AUTO_4139 ) ( AIRPORT ?AUTO_4137 ) ( AIRPORT ?AUTO_4139 ) ( not ( = ?AUTO_4137 ?AUTO_4139 ) ) ( AIRPORT ?AUTO_4138 ) ( AIRPLANE-AT ?AUTO_4140 ?AUTO_4138 ) ( not ( = ?AUTO_4138 ?AUTO_4137 ) ) ( TRUCK-AT ?AUTO_4147 ?AUTO_4143 ) ( IN-CITY ?AUTO_4143 ?AUTO_4141 ) ( IN-CITY ?AUTO_4137 ?AUTO_4141 ) ( not ( = ?AUTO_4137 ?AUTO_4143 ) ) ( TRUCK-AT ?AUTO_4147 ?AUTO_4149 ) ( OBJ-AT ?AUTO_4134 ?AUTO_4149 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4134 ?AUTO_4147 ?AUTO_4149 )
      ( DELIVER-PKG ?AUTO_4134 ?AUTO_4135 )
      ( DELIVER-PKG-VERIFY ?AUTO_4134 ?AUTO_4135 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4151 - OBJ
      ?AUTO_4152 - LOCATION
    )
    :vars
    (
      ?AUTO_4159 - TRUCK
      ?AUTO_4160 - LOCATION
      ?AUTO_4161 - CITY
      ?AUTO_4155 - LOCATION
      ?AUTO_4163 - LOCATION
      ?AUTO_4165 - LOCATION
      ?AUTO_4164 - AIRPLANE
      ?AUTO_4162 - LOCATION
      ?AUTO_4154 - CITY
      ?AUTO_4158 - TRUCK
      ?AUTO_4168 - LOCATION
      ?AUTO_4167 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4159 ?AUTO_4160 ) ( IN-CITY ?AUTO_4160 ?AUTO_4161 ) ( IN-CITY ?AUTO_4152 ?AUTO_4161 ) ( not ( = ?AUTO_4152 ?AUTO_4160 ) ) ( TRUCK-AT ?AUTO_4159 ?AUTO_4155 ) ( AIRPORT ?AUTO_4163 ) ( AIRPORT ?AUTO_4155 ) ( not ( = ?AUTO_4163 ?AUTO_4155 ) ) ( AIRPORT ?AUTO_4165 ) ( AIRPLANE-AT ?AUTO_4164 ?AUTO_4165 ) ( not ( = ?AUTO_4165 ?AUTO_4163 ) ) ( IN-CITY ?AUTO_4162 ?AUTO_4154 ) ( IN-CITY ?AUTO_4163 ?AUTO_4154 ) ( not ( = ?AUTO_4163 ?AUTO_4162 ) ) ( OBJ-AT ?AUTO_4151 ?AUTO_4162 ) ( TRUCK-AT ?AUTO_4158 ?AUTO_4168 ) ( IN-CITY ?AUTO_4168 ?AUTO_4167 ) ( IN-CITY ?AUTO_4162 ?AUTO_4167 ) ( not ( = ?AUTO_4162 ?AUTO_4168 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4158 ?AUTO_4168 ?AUTO_4162 ?AUTO_4167 )
      ( DELIVER-PKG ?AUTO_4151 ?AUTO_4152 )
      ( DELIVER-PKG-VERIFY ?AUTO_4151 ?AUTO_4152 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4178 - OBJ
      ?AUTO_4179 - LOCATION
    )
    :vars
    (
      ?AUTO_4183 - LOCATION
      ?AUTO_4191 - CITY
      ?AUTO_4193 - LOCATION
      ?AUTO_4188 - LOCATION
      ?AUTO_4181 - AIRPLANE
      ?AUTO_4190 - LOCATION
      ?AUTO_4186 - CITY
      ?AUTO_4180 - TRUCK
      ?AUTO_4187 - LOCATION
      ?AUTO_4192 - CITY
      ?AUTO_4184 - TRUCK
      ?AUTO_4196 - LOCATION
      ?AUTO_4195 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4183 ?AUTO_4191 ) ( IN-CITY ?AUTO_4179 ?AUTO_4191 ) ( not ( = ?AUTO_4179 ?AUTO_4183 ) ) ( AIRPORT ?AUTO_4193 ) ( AIRPORT ?AUTO_4183 ) ( not ( = ?AUTO_4193 ?AUTO_4183 ) ) ( AIRPORT ?AUTO_4188 ) ( AIRPLANE-AT ?AUTO_4181 ?AUTO_4188 ) ( not ( = ?AUTO_4188 ?AUTO_4193 ) ) ( IN-CITY ?AUTO_4190 ?AUTO_4186 ) ( IN-CITY ?AUTO_4193 ?AUTO_4186 ) ( not ( = ?AUTO_4193 ?AUTO_4190 ) ) ( OBJ-AT ?AUTO_4178 ?AUTO_4190 ) ( TRUCK-AT ?AUTO_4180 ?AUTO_4187 ) ( IN-CITY ?AUTO_4187 ?AUTO_4192 ) ( IN-CITY ?AUTO_4190 ?AUTO_4192 ) ( not ( = ?AUTO_4190 ?AUTO_4187 ) ) ( TRUCK-AT ?AUTO_4184 ?AUTO_4196 ) ( IN-CITY ?AUTO_4196 ?AUTO_4195 ) ( IN-CITY ?AUTO_4183 ?AUTO_4195 ) ( not ( = ?AUTO_4183 ?AUTO_4196 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4184 ?AUTO_4196 ?AUTO_4183 ?AUTO_4195 )
      ( DELIVER-PKG ?AUTO_4178 ?AUTO_4179 )
      ( DELIVER-PKG-VERIFY ?AUTO_4178 ?AUTO_4179 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4199 - OBJ
      ?AUTO_4200 - LOCATION
    )
    :vars
    (
      ?AUTO_4201 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4201 ?AUTO_4200 ) ( IN-TRUCK ?AUTO_4199 ?AUTO_4201 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4199 ?AUTO_4201 ?AUTO_4200 )
      ( DELIVER-PKG-VERIFY ?AUTO_4199 ?AUTO_4200 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4204 - OBJ
      ?AUTO_4205 - LOCATION
    )
    :vars
    (
      ?AUTO_4208 - TRUCK
      ?AUTO_4211 - LOCATION
      ?AUTO_4210 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4204 ?AUTO_4208 ) ( TRUCK-AT ?AUTO_4208 ?AUTO_4211 ) ( IN-CITY ?AUTO_4211 ?AUTO_4210 ) ( IN-CITY ?AUTO_4205 ?AUTO_4210 ) ( not ( = ?AUTO_4205 ?AUTO_4211 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4208 ?AUTO_4211 ?AUTO_4205 ?AUTO_4210 )
      ( DELIVER-PKG ?AUTO_4204 ?AUTO_4205 )
      ( DELIVER-PKG-VERIFY ?AUTO_4204 ?AUTO_4205 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4217 - OBJ
      ?AUTO_4218 - LOCATION
    )
    :vars
    (
      ?AUTO_4223 - TRUCK
      ?AUTO_4220 - LOCATION
      ?AUTO_4219 - CITY
      ?AUTO_4225 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4223 ?AUTO_4220 ) ( IN-CITY ?AUTO_4220 ?AUTO_4219 ) ( IN-CITY ?AUTO_4218 ?AUTO_4219 ) ( not ( = ?AUTO_4218 ?AUTO_4220 ) ) ( TRUCK-AT ?AUTO_4223 ?AUTO_4225 ) ( OBJ-AT ?AUTO_4217 ?AUTO_4225 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4217 ?AUTO_4223 ?AUTO_4225 )
      ( DELIVER-PKG ?AUTO_4217 ?AUTO_4218 )
      ( DELIVER-PKG-VERIFY ?AUTO_4217 ?AUTO_4218 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4227 - OBJ
      ?AUTO_4228 - LOCATION
    )
    :vars
    (
      ?AUTO_4234 - LOCATION
      ?AUTO_4231 - CITY
      ?AUTO_4233 - TRUCK
      ?AUTO_4237 - LOCATION
      ?AUTO_4236 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4234 ?AUTO_4231 ) ( IN-CITY ?AUTO_4228 ?AUTO_4231 ) ( not ( = ?AUTO_4228 ?AUTO_4234 ) ) ( OBJ-AT ?AUTO_4227 ?AUTO_4234 ) ( TRUCK-AT ?AUTO_4233 ?AUTO_4237 ) ( IN-CITY ?AUTO_4237 ?AUTO_4236 ) ( IN-CITY ?AUTO_4234 ?AUTO_4236 ) ( not ( = ?AUTO_4234 ?AUTO_4237 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4233 ?AUTO_4237 ?AUTO_4234 ?AUTO_4236 )
      ( DELIVER-PKG ?AUTO_4227 ?AUTO_4228 )
      ( DELIVER-PKG-VERIFY ?AUTO_4227 ?AUTO_4228 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4241 - OBJ
      ?AUTO_4242 - LOCATION
    )
    :vars
    (
      ?AUTO_4243 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4243 ?AUTO_4242 ) ( IN-TRUCK ?AUTO_4241 ?AUTO_4243 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4241 ?AUTO_4243 ?AUTO_4242 )
      ( DELIVER-PKG-VERIFY ?AUTO_4241 ?AUTO_4242 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4250 - OBJ
      ?AUTO_4251 - LOCATION
    )
    :vars
    (
      ?AUTO_4253 - TRUCK
      ?AUTO_4254 - LOCATION
      ?AUTO_4252 - CITY
      ?AUTO_4258 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4253 ?AUTO_4254 ) ( IN-CITY ?AUTO_4254 ?AUTO_4252 ) ( IN-CITY ?AUTO_4251 ?AUTO_4252 ) ( not ( = ?AUTO_4251 ?AUTO_4254 ) ) ( TRUCK-AT ?AUTO_4253 ?AUTO_4258 ) ( OBJ-AT ?AUTO_4250 ?AUTO_4258 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4250 ?AUTO_4253 ?AUTO_4258 )
      ( DELIVER-PKG ?AUTO_4250 ?AUTO_4251 )
      ( DELIVER-PKG-VERIFY ?AUTO_4250 ?AUTO_4251 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4260 - OBJ
      ?AUTO_4261 - LOCATION
    )
    :vars
    (
      ?AUTO_4267 - LOCATION
      ?AUTO_4265 - CITY
      ?AUTO_4264 - TRUCK
      ?AUTO_4270 - LOCATION
      ?AUTO_4269 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4267 ?AUTO_4265 ) ( IN-CITY ?AUTO_4261 ?AUTO_4265 ) ( not ( = ?AUTO_4261 ?AUTO_4267 ) ) ( OBJ-AT ?AUTO_4260 ?AUTO_4267 ) ( TRUCK-AT ?AUTO_4264 ?AUTO_4270 ) ( IN-CITY ?AUTO_4270 ?AUTO_4269 ) ( IN-CITY ?AUTO_4267 ?AUTO_4269 ) ( not ( = ?AUTO_4267 ?AUTO_4270 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4264 ?AUTO_4270 ?AUTO_4267 ?AUTO_4269 )
      ( DELIVER-PKG ?AUTO_4260 ?AUTO_4261 )
      ( DELIVER-PKG-VERIFY ?AUTO_4260 ?AUTO_4261 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4278 - OBJ
      ?AUTO_4279 - LOCATION
    )
    :vars
    (
      ?AUTO_4280 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4280 ?AUTO_4279 ) ( IN-TRUCK ?AUTO_4278 ?AUTO_4280 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4278 ?AUTO_4280 ?AUTO_4279 )
      ( DELIVER-PKG-VERIFY ?AUTO_4278 ?AUTO_4279 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4283 - OBJ
      ?AUTO_4284 - LOCATION
    )
    :vars
    (
      ?AUTO_4287 - TRUCK
      ?AUTO_4290 - LOCATION
      ?AUTO_4289 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4283 ?AUTO_4287 ) ( TRUCK-AT ?AUTO_4287 ?AUTO_4290 ) ( IN-CITY ?AUTO_4290 ?AUTO_4289 ) ( IN-CITY ?AUTO_4284 ?AUTO_4289 ) ( not ( = ?AUTO_4284 ?AUTO_4290 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4287 ?AUTO_4290 ?AUTO_4284 ?AUTO_4289 )
      ( DELIVER-PKG ?AUTO_4283 ?AUTO_4284 )
      ( DELIVER-PKG-VERIFY ?AUTO_4283 ?AUTO_4284 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4292 - OBJ
      ?AUTO_4293 - LOCATION
    )
    :vars
    (
      ?AUTO_4296 - TRUCK
      ?AUTO_4298 - LOCATION
      ?AUTO_4297 - CITY
      ?AUTO_4300 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4296 ?AUTO_4298 ) ( IN-CITY ?AUTO_4298 ?AUTO_4297 ) ( IN-CITY ?AUTO_4293 ?AUTO_4297 ) ( not ( = ?AUTO_4293 ?AUTO_4298 ) ) ( TRUCK-AT ?AUTO_4296 ?AUTO_4300 ) ( OBJ-AT ?AUTO_4292 ?AUTO_4300 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4292 ?AUTO_4296 ?AUTO_4300 )
      ( DELIVER-PKG ?AUTO_4292 ?AUTO_4293 )
      ( DELIVER-PKG-VERIFY ?AUTO_4292 ?AUTO_4293 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4302 - OBJ
      ?AUTO_4303 - LOCATION
    )
    :vars
    (
      ?AUTO_4309 - LOCATION
      ?AUTO_4308 - CITY
      ?AUTO_4307 - TRUCK
      ?AUTO_4312 - LOCATION
      ?AUTO_4311 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4309 ?AUTO_4308 ) ( IN-CITY ?AUTO_4303 ?AUTO_4308 ) ( not ( = ?AUTO_4303 ?AUTO_4309 ) ) ( OBJ-AT ?AUTO_4302 ?AUTO_4309 ) ( TRUCK-AT ?AUTO_4307 ?AUTO_4312 ) ( IN-CITY ?AUTO_4312 ?AUTO_4311 ) ( IN-CITY ?AUTO_4309 ?AUTO_4311 ) ( not ( = ?AUTO_4309 ?AUTO_4312 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4307 ?AUTO_4312 ?AUTO_4309 ?AUTO_4311 )
      ( DELIVER-PKG ?AUTO_4302 ?AUTO_4303 )
      ( DELIVER-PKG-VERIFY ?AUTO_4302 ?AUTO_4303 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4332 - OBJ
      ?AUTO_4333 - LOCATION
    )
    :vars
    (
      ?AUTO_4334 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4334 ?AUTO_4333 ) ( IN-TRUCK ?AUTO_4332 ?AUTO_4334 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4332 ?AUTO_4334 ?AUTO_4333 )
      ( DELIVER-PKG-VERIFY ?AUTO_4332 ?AUTO_4333 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4337 - OBJ
      ?AUTO_4338 - LOCATION
    )
    :vars
    (
      ?AUTO_4341 - TRUCK
      ?AUTO_4344 - LOCATION
      ?AUTO_4343 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4337 ?AUTO_4341 ) ( TRUCK-AT ?AUTO_4341 ?AUTO_4344 ) ( IN-CITY ?AUTO_4344 ?AUTO_4343 ) ( IN-CITY ?AUTO_4338 ?AUTO_4343 ) ( not ( = ?AUTO_4338 ?AUTO_4344 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4341 ?AUTO_4344 ?AUTO_4338 ?AUTO_4343 )
      ( DELIVER-PKG ?AUTO_4337 ?AUTO_4338 )
      ( DELIVER-PKG-VERIFY ?AUTO_4337 ?AUTO_4338 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4372 - OBJ
      ?AUTO_4373 - LOCATION
    )
    :vars
    (
      ?AUTO_4374 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4372 ?AUTO_4374 ) ( AIRPLANE-AT ?AUTO_4374 ?AUTO_4373 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4372 ?AUTO_4374 ?AUTO_4373 )
      ( DELIVER-PKG-VERIFY ?AUTO_4372 ?AUTO_4373 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4379 - OBJ
      ?AUTO_4380 - LOCATION
    )
    :vars
    (
      ?AUTO_4383 - AIRPLANE
      ?AUTO_4385 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4379 ?AUTO_4383 ) ( AIRPORT ?AUTO_4385 ) ( AIRPORT ?AUTO_4380 ) ( AIRPLANE-AT ?AUTO_4383 ?AUTO_4385 ) ( not ( = ?AUTO_4385 ?AUTO_4380 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4383 ?AUTO_4385 ?AUTO_4380 )
      ( DELIVER-PKG ?AUTO_4379 ?AUTO_4380 )
      ( DELIVER-PKG-VERIFY ?AUTO_4379 ?AUTO_4380 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4387 - OBJ
      ?AUTO_4388 - LOCATION
    )
    :vars
    (
      ?AUTO_4392 - LOCATION
      ?AUTO_4391 - AIRPLANE
      ?AUTO_4394 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4392 ) ( AIRPORT ?AUTO_4388 ) ( AIRPLANE-AT ?AUTO_4391 ?AUTO_4392 ) ( not ( = ?AUTO_4392 ?AUTO_4388 ) ) ( OBJ-AT ?AUTO_4387 ?AUTO_4394 ) ( AIRPLANE-AT ?AUTO_4391 ?AUTO_4394 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4387 ?AUTO_4391 ?AUTO_4394 )
      ( DELIVER-PKG ?AUTO_4387 ?AUTO_4388 )
      ( DELIVER-PKG-VERIFY ?AUTO_4387 ?AUTO_4388 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4396 - OBJ
      ?AUTO_4397 - LOCATION
    )
    :vars
    (
      ?AUTO_4401 - LOCATION
      ?AUTO_4400 - AIRPLANE
      ?AUTO_4402 - LOCATION
      ?AUTO_4403 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4401 ) ( AIRPORT ?AUTO_4397 ) ( AIRPLANE-AT ?AUTO_4400 ?AUTO_4401 ) ( not ( = ?AUTO_4401 ?AUTO_4397 ) ) ( AIRPLANE-AT ?AUTO_4400 ?AUTO_4402 ) ( TRUCK-AT ?AUTO_4403 ?AUTO_4402 ) ( IN-TRUCK ?AUTO_4396 ?AUTO_4403 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4396 ?AUTO_4403 ?AUTO_4402 )
      ( DELIVER-PKG ?AUTO_4396 ?AUTO_4397 )
      ( DELIVER-PKG-VERIFY ?AUTO_4396 ?AUTO_4397 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4406 - OBJ
      ?AUTO_4407 - LOCATION
    )
    :vars
    (
      ?AUTO_4410 - LOCATION
      ?AUTO_4412 - AIRPLANE
      ?AUTO_4408 - LOCATION
      ?AUTO_4413 - TRUCK
      ?AUTO_4416 - LOCATION
      ?AUTO_4415 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4410 ) ( AIRPORT ?AUTO_4407 ) ( AIRPLANE-AT ?AUTO_4412 ?AUTO_4410 ) ( not ( = ?AUTO_4410 ?AUTO_4407 ) ) ( AIRPLANE-AT ?AUTO_4412 ?AUTO_4408 ) ( IN-TRUCK ?AUTO_4406 ?AUTO_4413 ) ( TRUCK-AT ?AUTO_4413 ?AUTO_4416 ) ( IN-CITY ?AUTO_4416 ?AUTO_4415 ) ( IN-CITY ?AUTO_4408 ?AUTO_4415 ) ( not ( = ?AUTO_4408 ?AUTO_4416 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4413 ?AUTO_4416 ?AUTO_4408 ?AUTO_4415 )
      ( DELIVER-PKG ?AUTO_4406 ?AUTO_4407 )
      ( DELIVER-PKG-VERIFY ?AUTO_4406 ?AUTO_4407 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4426 - OBJ
      ?AUTO_4427 - LOCATION
    )
    :vars
    (
      ?AUTO_4432 - LOCATION
      ?AUTO_4433 - AIRPLANE
      ?AUTO_4428 - LOCATION
      ?AUTO_4431 - TRUCK
      ?AUTO_4434 - LOCATION
      ?AUTO_4435 - CITY
      ?AUTO_4437 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4432 ) ( AIRPORT ?AUTO_4427 ) ( AIRPLANE-AT ?AUTO_4433 ?AUTO_4432 ) ( not ( = ?AUTO_4432 ?AUTO_4427 ) ) ( AIRPLANE-AT ?AUTO_4433 ?AUTO_4428 ) ( TRUCK-AT ?AUTO_4431 ?AUTO_4434 ) ( IN-CITY ?AUTO_4434 ?AUTO_4435 ) ( IN-CITY ?AUTO_4428 ?AUTO_4435 ) ( not ( = ?AUTO_4428 ?AUTO_4434 ) ) ( TRUCK-AT ?AUTO_4431 ?AUTO_4437 ) ( OBJ-AT ?AUTO_4426 ?AUTO_4437 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4426 ?AUTO_4431 ?AUTO_4437 )
      ( DELIVER-PKG ?AUTO_4426 ?AUTO_4427 )
      ( DELIVER-PKG-VERIFY ?AUTO_4426 ?AUTO_4427 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4455 - OBJ
      ?AUTO_4456 - LOCATION
    )
    :vars
    (
      ?AUTO_4457 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4455 ?AUTO_4457 ) ( AIRPLANE-AT ?AUTO_4457 ?AUTO_4456 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4455 ?AUTO_4457 ?AUTO_4456 )
      ( DELIVER-PKG-VERIFY ?AUTO_4455 ?AUTO_4456 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4460 - OBJ
      ?AUTO_4461 - LOCATION
    )
    :vars
    (
      ?AUTO_4464 - AIRPLANE
      ?AUTO_4466 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4460 ?AUTO_4464 ) ( AIRPORT ?AUTO_4466 ) ( AIRPORT ?AUTO_4461 ) ( AIRPLANE-AT ?AUTO_4464 ?AUTO_4466 ) ( not ( = ?AUTO_4466 ?AUTO_4461 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4464 ?AUTO_4466 ?AUTO_4461 )
      ( DELIVER-PKG ?AUTO_4460 ?AUTO_4461 )
      ( DELIVER-PKG-VERIFY ?AUTO_4460 ?AUTO_4461 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4470 - OBJ
      ?AUTO_4471 - LOCATION
    )
    :vars
    (
      ?AUTO_4475 - LOCATION
      ?AUTO_4472 - AIRPLANE
      ?AUTO_4477 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4475 ) ( AIRPORT ?AUTO_4471 ) ( AIRPLANE-AT ?AUTO_4472 ?AUTO_4475 ) ( not ( = ?AUTO_4475 ?AUTO_4471 ) ) ( OBJ-AT ?AUTO_4470 ?AUTO_4477 ) ( AIRPLANE-AT ?AUTO_4472 ?AUTO_4477 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4470 ?AUTO_4472 ?AUTO_4477 )
      ( DELIVER-PKG ?AUTO_4470 ?AUTO_4471 )
      ( DELIVER-PKG-VERIFY ?AUTO_4470 ?AUTO_4471 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4479 - OBJ
      ?AUTO_4480 - LOCATION
    )
    :vars
    (
      ?AUTO_4485 - LOCATION
      ?AUTO_4487 - LOCATION
      ?AUTO_4483 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4485 ) ( AIRPORT ?AUTO_4480 ) ( not ( = ?AUTO_4485 ?AUTO_4480 ) ) ( OBJ-AT ?AUTO_4479 ?AUTO_4485 ) ( AIRPORT ?AUTO_4487 ) ( AIRPLANE-AT ?AUTO_4483 ?AUTO_4487 ) ( not ( = ?AUTO_4487 ?AUTO_4485 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4483 ?AUTO_4487 ?AUTO_4485 )
      ( DELIVER-PKG ?AUTO_4479 ?AUTO_4480 )
      ( DELIVER-PKG-VERIFY ?AUTO_4479 ?AUTO_4480 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4495 - OBJ
      ?AUTO_4496 - LOCATION
    )
    :vars
    (
      ?AUTO_4498 - LOCATION
      ?AUTO_4499 - LOCATION
      ?AUTO_4500 - AIRPLANE
      ?AUTO_4502 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4498 ) ( AIRPORT ?AUTO_4496 ) ( not ( = ?AUTO_4498 ?AUTO_4496 ) ) ( AIRPORT ?AUTO_4499 ) ( AIRPLANE-AT ?AUTO_4500 ?AUTO_4499 ) ( not ( = ?AUTO_4499 ?AUTO_4498 ) ) ( TRUCK-AT ?AUTO_4502 ?AUTO_4498 ) ( IN-TRUCK ?AUTO_4495 ?AUTO_4502 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4495 ?AUTO_4502 ?AUTO_4498 )
      ( DELIVER-PKG ?AUTO_4495 ?AUTO_4496 )
      ( DELIVER-PKG-VERIFY ?AUTO_4495 ?AUTO_4496 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4505 - OBJ
      ?AUTO_4506 - LOCATION
    )
    :vars
    (
      ?AUTO_4508 - LOCATION
      ?AUTO_4510 - LOCATION
      ?AUTO_4512 - AIRPLANE
      ?AUTO_4511 - TRUCK
      ?AUTO_4515 - LOCATION
      ?AUTO_4514 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4508 ) ( AIRPORT ?AUTO_4506 ) ( not ( = ?AUTO_4508 ?AUTO_4506 ) ) ( AIRPORT ?AUTO_4510 ) ( AIRPLANE-AT ?AUTO_4512 ?AUTO_4510 ) ( not ( = ?AUTO_4510 ?AUTO_4508 ) ) ( IN-TRUCK ?AUTO_4505 ?AUTO_4511 ) ( TRUCK-AT ?AUTO_4511 ?AUTO_4515 ) ( IN-CITY ?AUTO_4515 ?AUTO_4514 ) ( IN-CITY ?AUTO_4508 ?AUTO_4514 ) ( not ( = ?AUTO_4508 ?AUTO_4515 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4511 ?AUTO_4515 ?AUTO_4508 ?AUTO_4514 )
      ( DELIVER-PKG ?AUTO_4505 ?AUTO_4506 )
      ( DELIVER-PKG-VERIFY ?AUTO_4505 ?AUTO_4506 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4517 - OBJ
      ?AUTO_4518 - LOCATION
    )
    :vars
    (
      ?AUTO_4525 - LOCATION
      ?AUTO_4522 - LOCATION
      ?AUTO_4523 - AIRPLANE
      ?AUTO_4521 - TRUCK
      ?AUTO_4526 - LOCATION
      ?AUTO_4524 - CITY
      ?AUTO_4528 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4525 ) ( AIRPORT ?AUTO_4518 ) ( not ( = ?AUTO_4525 ?AUTO_4518 ) ) ( AIRPORT ?AUTO_4522 ) ( AIRPLANE-AT ?AUTO_4523 ?AUTO_4522 ) ( not ( = ?AUTO_4522 ?AUTO_4525 ) ) ( TRUCK-AT ?AUTO_4521 ?AUTO_4526 ) ( IN-CITY ?AUTO_4526 ?AUTO_4524 ) ( IN-CITY ?AUTO_4525 ?AUTO_4524 ) ( not ( = ?AUTO_4525 ?AUTO_4526 ) ) ( TRUCK-AT ?AUTO_4521 ?AUTO_4528 ) ( OBJ-AT ?AUTO_4517 ?AUTO_4528 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4517 ?AUTO_4521 ?AUTO_4528 )
      ( DELIVER-PKG ?AUTO_4517 ?AUTO_4518 )
      ( DELIVER-PKG-VERIFY ?AUTO_4517 ?AUTO_4518 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4530 - OBJ
      ?AUTO_4531 - LOCATION
    )
    :vars
    (
      ?AUTO_4536 - LOCATION
      ?AUTO_4540 - LOCATION
      ?AUTO_4537 - AIRPLANE
      ?AUTO_4534 - LOCATION
      ?AUTO_4539 - CITY
      ?AUTO_4538 - TRUCK
      ?AUTO_4543 - LOCATION
      ?AUTO_4542 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4536 ) ( AIRPORT ?AUTO_4531 ) ( not ( = ?AUTO_4536 ?AUTO_4531 ) ) ( AIRPORT ?AUTO_4540 ) ( AIRPLANE-AT ?AUTO_4537 ?AUTO_4540 ) ( not ( = ?AUTO_4540 ?AUTO_4536 ) ) ( IN-CITY ?AUTO_4534 ?AUTO_4539 ) ( IN-CITY ?AUTO_4536 ?AUTO_4539 ) ( not ( = ?AUTO_4536 ?AUTO_4534 ) ) ( OBJ-AT ?AUTO_4530 ?AUTO_4534 ) ( TRUCK-AT ?AUTO_4538 ?AUTO_4543 ) ( IN-CITY ?AUTO_4543 ?AUTO_4542 ) ( IN-CITY ?AUTO_4534 ?AUTO_4542 ) ( not ( = ?AUTO_4534 ?AUTO_4543 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4538 ?AUTO_4543 ?AUTO_4534 ?AUTO_4542 )
      ( DELIVER-PKG ?AUTO_4530 ?AUTO_4531 )
      ( DELIVER-PKG-VERIFY ?AUTO_4530 ?AUTO_4531 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4563 - OBJ
      ?AUTO_4564 - LOCATION
    )
    :vars
    (
      ?AUTO_4565 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4563 ?AUTO_4565 ) ( AIRPLANE-AT ?AUTO_4565 ?AUTO_4564 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4563 ?AUTO_4565 ?AUTO_4564 )
      ( DELIVER-PKG-VERIFY ?AUTO_4563 ?AUTO_4564 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4568 - OBJ
      ?AUTO_4569 - LOCATION
    )
    :vars
    (
      ?AUTO_4572 - AIRPLANE
      ?AUTO_4574 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4568 ?AUTO_4572 ) ( AIRPORT ?AUTO_4574 ) ( AIRPORT ?AUTO_4569 ) ( AIRPLANE-AT ?AUTO_4572 ?AUTO_4574 ) ( not ( = ?AUTO_4574 ?AUTO_4569 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4572 ?AUTO_4574 ?AUTO_4569 )
      ( DELIVER-PKG ?AUTO_4568 ?AUTO_4569 )
      ( DELIVER-PKG-VERIFY ?AUTO_4568 ?AUTO_4569 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4578 - OBJ
      ?AUTO_4579 - LOCATION
    )
    :vars
    (
      ?AUTO_4583 - LOCATION
      ?AUTO_4580 - AIRPLANE
      ?AUTO_4585 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4583 ) ( AIRPORT ?AUTO_4579 ) ( AIRPLANE-AT ?AUTO_4580 ?AUTO_4583 ) ( not ( = ?AUTO_4583 ?AUTO_4579 ) ) ( OBJ-AT ?AUTO_4578 ?AUTO_4585 ) ( AIRPLANE-AT ?AUTO_4580 ?AUTO_4585 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4578 ?AUTO_4580 ?AUTO_4585 )
      ( DELIVER-PKG ?AUTO_4578 ?AUTO_4579 )
      ( DELIVER-PKG-VERIFY ?AUTO_4578 ?AUTO_4579 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4587 - OBJ
      ?AUTO_4588 - LOCATION
    )
    :vars
    (
      ?AUTO_4593 - LOCATION
      ?AUTO_4595 - LOCATION
      ?AUTO_4591 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4593 ) ( AIRPORT ?AUTO_4588 ) ( not ( = ?AUTO_4593 ?AUTO_4588 ) ) ( OBJ-AT ?AUTO_4587 ?AUTO_4593 ) ( AIRPORT ?AUTO_4595 ) ( AIRPLANE-AT ?AUTO_4591 ?AUTO_4595 ) ( not ( = ?AUTO_4595 ?AUTO_4593 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4591 ?AUTO_4595 ?AUTO_4593 )
      ( DELIVER-PKG ?AUTO_4587 ?AUTO_4588 )
      ( DELIVER-PKG-VERIFY ?AUTO_4587 ?AUTO_4588 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4641 - OBJ
      ?AUTO_4642 - LOCATION
    )
    :vars
    (
      ?AUTO_4643 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_4641 ?AUTO_4643 ) ( AIRPLANE-AT ?AUTO_4643 ?AUTO_4642 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4641 ?AUTO_4643 ?AUTO_4642 )
      ( DELIVER-PKG-VERIFY ?AUTO_4641 ?AUTO_4642 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4650 - OBJ
      ?AUTO_4651 - LOCATION
    )
    :vars
    (
      ?AUTO_4652 - LOCATION
      ?AUTO_4653 - AIRPLANE
      ?AUTO_4657 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_4652 ) ( AIRPORT ?AUTO_4651 ) ( AIRPLANE-AT ?AUTO_4653 ?AUTO_4652 ) ( not ( = ?AUTO_4652 ?AUTO_4651 ) ) ( OBJ-AT ?AUTO_4650 ?AUTO_4657 ) ( AIRPLANE-AT ?AUTO_4653 ?AUTO_4657 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4650 ?AUTO_4653 ?AUTO_4657 )
      ( DELIVER-PKG ?AUTO_4650 ?AUTO_4651 )
      ( DELIVER-PKG-VERIFY ?AUTO_4650 ?AUTO_4651 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4707 - OBJ
      ?AUTO_4708 - LOCATION
    )
    :vars
    (
      ?AUTO_4709 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4709 ?AUTO_4708 ) ( IN-TRUCK ?AUTO_4707 ?AUTO_4709 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4707 ?AUTO_4709 ?AUTO_4708 )
      ( DELIVER-PKG-VERIFY ?AUTO_4707 ?AUTO_4708 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4712 - OBJ
      ?AUTO_4713 - LOCATION
    )
    :vars
    (
      ?AUTO_4716 - TRUCK
      ?AUTO_4719 - LOCATION
      ?AUTO_4718 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_4712 ?AUTO_4716 ) ( TRUCK-AT ?AUTO_4716 ?AUTO_4719 ) ( IN-CITY ?AUTO_4719 ?AUTO_4718 ) ( IN-CITY ?AUTO_4713 ?AUTO_4718 ) ( not ( = ?AUTO_4713 ?AUTO_4719 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4716 ?AUTO_4719 ?AUTO_4713 ?AUTO_4718 )
      ( DELIVER-PKG ?AUTO_4712 ?AUTO_4713 )
      ( DELIVER-PKG-VERIFY ?AUTO_4712 ?AUTO_4713 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4723 - OBJ
      ?AUTO_4724 - LOCATION
    )
    :vars
    (
      ?AUTO_4725 - TRUCK
      ?AUTO_4727 - LOCATION
      ?AUTO_4728 - CITY
      ?AUTO_4731 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4725 ?AUTO_4727 ) ( IN-CITY ?AUTO_4727 ?AUTO_4728 ) ( IN-CITY ?AUTO_4724 ?AUTO_4728 ) ( not ( = ?AUTO_4724 ?AUTO_4727 ) ) ( TRUCK-AT ?AUTO_4725 ?AUTO_4731 ) ( OBJ-AT ?AUTO_4723 ?AUTO_4731 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4723 ?AUTO_4725 ?AUTO_4731 )
      ( DELIVER-PKG ?AUTO_4723 ?AUTO_4724 )
      ( DELIVER-PKG-VERIFY ?AUTO_4723 ?AUTO_4724 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4735 - OBJ
      ?AUTO_4736 - LOCATION
    )
    :vars
    (
      ?AUTO_4740 - TRUCK
      ?AUTO_4741 - LOCATION
      ?AUTO_4742 - CITY
      ?AUTO_4739 - LOCATION
      ?AUTO_4743 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4740 ?AUTO_4741 ) ( IN-CITY ?AUTO_4741 ?AUTO_4742 ) ( IN-CITY ?AUTO_4736 ?AUTO_4742 ) ( not ( = ?AUTO_4736 ?AUTO_4741 ) ) ( TRUCK-AT ?AUTO_4740 ?AUTO_4739 ) ( IN-AIRPLANE ?AUTO_4735 ?AUTO_4743 ) ( AIRPLANE-AT ?AUTO_4743 ?AUTO_4739 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_4735 ?AUTO_4743 ?AUTO_4739 )
      ( DELIVER-PKG ?AUTO_4735 ?AUTO_4736 )
      ( DELIVER-PKG-VERIFY ?AUTO_4735 ?AUTO_4736 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4746 - OBJ
      ?AUTO_4747 - LOCATION
    )
    :vars
    (
      ?AUTO_4752 - TRUCK
      ?AUTO_4753 - LOCATION
      ?AUTO_4751 - CITY
      ?AUTO_4750 - LOCATION
      ?AUTO_4754 - AIRPLANE
      ?AUTO_4756 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4752 ?AUTO_4753 ) ( IN-CITY ?AUTO_4753 ?AUTO_4751 ) ( IN-CITY ?AUTO_4747 ?AUTO_4751 ) ( not ( = ?AUTO_4747 ?AUTO_4753 ) ) ( TRUCK-AT ?AUTO_4752 ?AUTO_4750 ) ( IN-AIRPLANE ?AUTO_4746 ?AUTO_4754 ) ( AIRPORT ?AUTO_4756 ) ( AIRPORT ?AUTO_4750 ) ( AIRPLANE-AT ?AUTO_4754 ?AUTO_4756 ) ( not ( = ?AUTO_4756 ?AUTO_4750 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4754 ?AUTO_4756 ?AUTO_4750 )
      ( DELIVER-PKG ?AUTO_4746 ?AUTO_4747 )
      ( DELIVER-PKG-VERIFY ?AUTO_4746 ?AUTO_4747 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4760 - OBJ
      ?AUTO_4761 - LOCATION
    )
    :vars
    (
      ?AUTO_4763 - TRUCK
      ?AUTO_4769 - LOCATION
      ?AUTO_4766 - CITY
      ?AUTO_4767 - LOCATION
      ?AUTO_4764 - LOCATION
      ?AUTO_4765 - AIRPLANE
      ?AUTO_4771 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4763 ?AUTO_4769 ) ( IN-CITY ?AUTO_4769 ?AUTO_4766 ) ( IN-CITY ?AUTO_4761 ?AUTO_4766 ) ( not ( = ?AUTO_4761 ?AUTO_4769 ) ) ( TRUCK-AT ?AUTO_4763 ?AUTO_4767 ) ( AIRPORT ?AUTO_4764 ) ( AIRPORT ?AUTO_4767 ) ( AIRPLANE-AT ?AUTO_4765 ?AUTO_4764 ) ( not ( = ?AUTO_4764 ?AUTO_4767 ) ) ( OBJ-AT ?AUTO_4760 ?AUTO_4771 ) ( AIRPLANE-AT ?AUTO_4765 ?AUTO_4771 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_4760 ?AUTO_4765 ?AUTO_4771 )
      ( DELIVER-PKG ?AUTO_4760 ?AUTO_4761 )
      ( DELIVER-PKG-VERIFY ?AUTO_4760 ?AUTO_4761 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4773 - OBJ
      ?AUTO_4774 - LOCATION
    )
    :vars
    (
      ?AUTO_4778 - TRUCK
      ?AUTO_4780 - LOCATION
      ?AUTO_4782 - CITY
      ?AUTO_4779 - LOCATION
      ?AUTO_4783 - LOCATION
      ?AUTO_4785 - LOCATION
      ?AUTO_4781 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4778 ?AUTO_4780 ) ( IN-CITY ?AUTO_4780 ?AUTO_4782 ) ( IN-CITY ?AUTO_4774 ?AUTO_4782 ) ( not ( = ?AUTO_4774 ?AUTO_4780 ) ) ( TRUCK-AT ?AUTO_4778 ?AUTO_4779 ) ( AIRPORT ?AUTO_4783 ) ( AIRPORT ?AUTO_4779 ) ( not ( = ?AUTO_4783 ?AUTO_4779 ) ) ( OBJ-AT ?AUTO_4773 ?AUTO_4783 ) ( AIRPORT ?AUTO_4785 ) ( AIRPLANE-AT ?AUTO_4781 ?AUTO_4785 ) ( not ( = ?AUTO_4785 ?AUTO_4783 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_4781 ?AUTO_4785 ?AUTO_4783 )
      ( DELIVER-PKG ?AUTO_4773 ?AUTO_4774 )
      ( DELIVER-PKG-VERIFY ?AUTO_4773 ?AUTO_4774 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4803 - OBJ
      ?AUTO_4804 - LOCATION
    )
    :vars
    (
      ?AUTO_4813 - LOCATION
      ?AUTO_4806 - CITY
      ?AUTO_4805 - LOCATION
      ?AUTO_4810 - LOCATION
      ?AUTO_4812 - AIRPLANE
      ?AUTO_4807 - TRUCK
      ?AUTO_4816 - LOCATION
      ?AUTO_4815 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4813 ?AUTO_4806 ) ( IN-CITY ?AUTO_4804 ?AUTO_4806 ) ( not ( = ?AUTO_4804 ?AUTO_4813 ) ) ( AIRPORT ?AUTO_4805 ) ( AIRPORT ?AUTO_4813 ) ( not ( = ?AUTO_4805 ?AUTO_4813 ) ) ( OBJ-AT ?AUTO_4803 ?AUTO_4805 ) ( AIRPORT ?AUTO_4810 ) ( AIRPLANE-AT ?AUTO_4812 ?AUTO_4810 ) ( not ( = ?AUTO_4810 ?AUTO_4805 ) ) ( TRUCK-AT ?AUTO_4807 ?AUTO_4816 ) ( IN-CITY ?AUTO_4816 ?AUTO_4815 ) ( IN-CITY ?AUTO_4813 ?AUTO_4815 ) ( not ( = ?AUTO_4813 ?AUTO_4816 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4807 ?AUTO_4816 ?AUTO_4813 ?AUTO_4815 )
      ( DELIVER-PKG ?AUTO_4803 ?AUTO_4804 )
      ( DELIVER-PKG-VERIFY ?AUTO_4803 ?AUTO_4804 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4830 - OBJ
      ?AUTO_4831 - LOCATION
    )
    :vars
    (
      ?AUTO_4840 - LOCATION
      ?AUTO_4841 - CITY
      ?AUTO_4839 - LOCATION
      ?AUTO_4835 - LOCATION
      ?AUTO_4833 - AIRPLANE
      ?AUTO_4832 - TRUCK
      ?AUTO_4836 - LOCATION
      ?AUTO_4838 - CITY
      ?AUTO_4842 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4840 ?AUTO_4841 ) ( IN-CITY ?AUTO_4831 ?AUTO_4841 ) ( not ( = ?AUTO_4831 ?AUTO_4840 ) ) ( AIRPORT ?AUTO_4839 ) ( AIRPORT ?AUTO_4840 ) ( not ( = ?AUTO_4839 ?AUTO_4840 ) ) ( AIRPORT ?AUTO_4835 ) ( AIRPLANE-AT ?AUTO_4833 ?AUTO_4835 ) ( not ( = ?AUTO_4835 ?AUTO_4839 ) ) ( TRUCK-AT ?AUTO_4832 ?AUTO_4836 ) ( IN-CITY ?AUTO_4836 ?AUTO_4838 ) ( IN-CITY ?AUTO_4840 ?AUTO_4838 ) ( not ( = ?AUTO_4840 ?AUTO_4836 ) ) ( TRUCK-AT ?AUTO_4842 ?AUTO_4839 ) ( IN-TRUCK ?AUTO_4830 ?AUTO_4842 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4830 ?AUTO_4842 ?AUTO_4839 )
      ( DELIVER-PKG ?AUTO_4830 ?AUTO_4831 )
      ( DELIVER-PKG-VERIFY ?AUTO_4830 ?AUTO_4831 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4845 - OBJ
      ?AUTO_4846 - LOCATION
    )
    :vars
    (
      ?AUTO_4852 - LOCATION
      ?AUTO_4857 - CITY
      ?AUTO_4849 - LOCATION
      ?AUTO_4853 - LOCATION
      ?AUTO_4856 - AIRPLANE
      ?AUTO_4850 - TRUCK
      ?AUTO_4855 - LOCATION
      ?AUTO_4851 - CITY
      ?AUTO_4854 - TRUCK
      ?AUTO_4860 - LOCATION
      ?AUTO_4859 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4852 ?AUTO_4857 ) ( IN-CITY ?AUTO_4846 ?AUTO_4857 ) ( not ( = ?AUTO_4846 ?AUTO_4852 ) ) ( AIRPORT ?AUTO_4849 ) ( AIRPORT ?AUTO_4852 ) ( not ( = ?AUTO_4849 ?AUTO_4852 ) ) ( AIRPORT ?AUTO_4853 ) ( AIRPLANE-AT ?AUTO_4856 ?AUTO_4853 ) ( not ( = ?AUTO_4853 ?AUTO_4849 ) ) ( TRUCK-AT ?AUTO_4850 ?AUTO_4855 ) ( IN-CITY ?AUTO_4855 ?AUTO_4851 ) ( IN-CITY ?AUTO_4852 ?AUTO_4851 ) ( not ( = ?AUTO_4852 ?AUTO_4855 ) ) ( IN-TRUCK ?AUTO_4845 ?AUTO_4854 ) ( TRUCK-AT ?AUTO_4854 ?AUTO_4860 ) ( IN-CITY ?AUTO_4860 ?AUTO_4859 ) ( IN-CITY ?AUTO_4849 ?AUTO_4859 ) ( not ( = ?AUTO_4849 ?AUTO_4860 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4854 ?AUTO_4860 ?AUTO_4849 ?AUTO_4859 )
      ( DELIVER-PKG ?AUTO_4845 ?AUTO_4846 )
      ( DELIVER-PKG-VERIFY ?AUTO_4845 ?AUTO_4846 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4866 - OBJ
      ?AUTO_4867 - LOCATION
    )
    :vars
    (
      ?AUTO_4871 - LOCATION
      ?AUTO_4880 - CITY
      ?AUTO_4878 - LOCATION
      ?AUTO_4868 - LOCATION
      ?AUTO_4877 - AIRPLANE
      ?AUTO_4875 - TRUCK
      ?AUTO_4873 - LOCATION
      ?AUTO_4876 - CITY
      ?AUTO_4874 - TRUCK
      ?AUTO_4872 - LOCATION
      ?AUTO_4879 - CITY
      ?AUTO_4882 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4871 ?AUTO_4880 ) ( IN-CITY ?AUTO_4867 ?AUTO_4880 ) ( not ( = ?AUTO_4867 ?AUTO_4871 ) ) ( AIRPORT ?AUTO_4878 ) ( AIRPORT ?AUTO_4871 ) ( not ( = ?AUTO_4878 ?AUTO_4871 ) ) ( AIRPORT ?AUTO_4868 ) ( AIRPLANE-AT ?AUTO_4877 ?AUTO_4868 ) ( not ( = ?AUTO_4868 ?AUTO_4878 ) ) ( TRUCK-AT ?AUTO_4875 ?AUTO_4873 ) ( IN-CITY ?AUTO_4873 ?AUTO_4876 ) ( IN-CITY ?AUTO_4871 ?AUTO_4876 ) ( not ( = ?AUTO_4871 ?AUTO_4873 ) ) ( TRUCK-AT ?AUTO_4874 ?AUTO_4872 ) ( IN-CITY ?AUTO_4872 ?AUTO_4879 ) ( IN-CITY ?AUTO_4878 ?AUTO_4879 ) ( not ( = ?AUTO_4878 ?AUTO_4872 ) ) ( TRUCK-AT ?AUTO_4874 ?AUTO_4882 ) ( OBJ-AT ?AUTO_4866 ?AUTO_4882 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4866 ?AUTO_4874 ?AUTO_4882 )
      ( DELIVER-PKG ?AUTO_4866 ?AUTO_4867 )
      ( DELIVER-PKG-VERIFY ?AUTO_4866 ?AUTO_4867 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4884 - OBJ
      ?AUTO_4885 - LOCATION
    )
    :vars
    (
      ?AUTO_4894 - LOCATION
      ?AUTO_4893 - CITY
      ?AUTO_4895 - LOCATION
      ?AUTO_4897 - LOCATION
      ?AUTO_4899 - AIRPLANE
      ?AUTO_4889 - TRUCK
      ?AUTO_4892 - LOCATION
      ?AUTO_4891 - CITY
      ?AUTO_4896 - LOCATION
      ?AUTO_4887 - CITY
      ?AUTO_4890 - TRUCK
      ?AUTO_4902 - LOCATION
      ?AUTO_4901 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4894 ?AUTO_4893 ) ( IN-CITY ?AUTO_4885 ?AUTO_4893 ) ( not ( = ?AUTO_4885 ?AUTO_4894 ) ) ( AIRPORT ?AUTO_4895 ) ( AIRPORT ?AUTO_4894 ) ( not ( = ?AUTO_4895 ?AUTO_4894 ) ) ( AIRPORT ?AUTO_4897 ) ( AIRPLANE-AT ?AUTO_4899 ?AUTO_4897 ) ( not ( = ?AUTO_4897 ?AUTO_4895 ) ) ( TRUCK-AT ?AUTO_4889 ?AUTO_4892 ) ( IN-CITY ?AUTO_4892 ?AUTO_4891 ) ( IN-CITY ?AUTO_4894 ?AUTO_4891 ) ( not ( = ?AUTO_4894 ?AUTO_4892 ) ) ( IN-CITY ?AUTO_4896 ?AUTO_4887 ) ( IN-CITY ?AUTO_4895 ?AUTO_4887 ) ( not ( = ?AUTO_4895 ?AUTO_4896 ) ) ( OBJ-AT ?AUTO_4884 ?AUTO_4896 ) ( TRUCK-AT ?AUTO_4890 ?AUTO_4902 ) ( IN-CITY ?AUTO_4902 ?AUTO_4901 ) ( IN-CITY ?AUTO_4896 ?AUTO_4901 ) ( not ( = ?AUTO_4896 ?AUTO_4902 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4890 ?AUTO_4902 ?AUTO_4896 ?AUTO_4901 )
      ( DELIVER-PKG ?AUTO_4884 ?AUTO_4885 )
      ( DELIVER-PKG-VERIFY ?AUTO_4884 ?AUTO_4885 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4906 - OBJ
      ?AUTO_4907 - LOCATION
    )
    :vars
    (
      ?AUTO_4908 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4908 ?AUTO_4907 ) ( IN-TRUCK ?AUTO_4906 ?AUTO_4908 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4906 ?AUTO_4908 ?AUTO_4907 )
      ( DELIVER-PKG-VERIFY ?AUTO_4906 ?AUTO_4907 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4949 - OBJ
      ?AUTO_4950 - LOCATION
    )
    :vars
    (
      ?AUTO_4955 - LOCATION
      ?AUTO_4951 - CITY
      ?AUTO_4954 - LOCATION
      ?AUTO_4957 - LOCATION
      ?AUTO_4960 - AIRPLANE
      ?AUTO_4959 - TRUCK
      ?AUTO_4952 - LOCATION
      ?AUTO_4956 - CITY
      ?AUTO_4961 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4955 ?AUTO_4951 ) ( IN-CITY ?AUTO_4950 ?AUTO_4951 ) ( not ( = ?AUTO_4950 ?AUTO_4955 ) ) ( AIRPORT ?AUTO_4954 ) ( AIRPORT ?AUTO_4955 ) ( not ( = ?AUTO_4954 ?AUTO_4955 ) ) ( AIRPORT ?AUTO_4957 ) ( AIRPLANE-AT ?AUTO_4960 ?AUTO_4957 ) ( not ( = ?AUTO_4957 ?AUTO_4954 ) ) ( TRUCK-AT ?AUTO_4959 ?AUTO_4952 ) ( IN-CITY ?AUTO_4952 ?AUTO_4956 ) ( IN-CITY ?AUTO_4955 ?AUTO_4956 ) ( not ( = ?AUTO_4955 ?AUTO_4952 ) ) ( TRUCK-AT ?AUTO_4961 ?AUTO_4954 ) ( IN-TRUCK ?AUTO_4949 ?AUTO_4961 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4949 ?AUTO_4961 ?AUTO_4954 )
      ( DELIVER-PKG ?AUTO_4949 ?AUTO_4950 )
      ( DELIVER-PKG-VERIFY ?AUTO_4949 ?AUTO_4950 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4964 - OBJ
      ?AUTO_4965 - LOCATION
    )
    :vars
    (
      ?AUTO_4972 - LOCATION
      ?AUTO_4968 - CITY
      ?AUTO_4971 - LOCATION
      ?AUTO_4973 - LOCATION
      ?AUTO_4969 - AIRPLANE
      ?AUTO_4974 - TRUCK
      ?AUTO_4975 - LOCATION
      ?AUTO_4970 - CITY
      ?AUTO_4976 - TRUCK
      ?AUTO_4979 - LOCATION
      ?AUTO_4978 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4972 ?AUTO_4968 ) ( IN-CITY ?AUTO_4965 ?AUTO_4968 ) ( not ( = ?AUTO_4965 ?AUTO_4972 ) ) ( AIRPORT ?AUTO_4971 ) ( AIRPORT ?AUTO_4972 ) ( not ( = ?AUTO_4971 ?AUTO_4972 ) ) ( AIRPORT ?AUTO_4973 ) ( AIRPLANE-AT ?AUTO_4969 ?AUTO_4973 ) ( not ( = ?AUTO_4973 ?AUTO_4971 ) ) ( TRUCK-AT ?AUTO_4974 ?AUTO_4975 ) ( IN-CITY ?AUTO_4975 ?AUTO_4970 ) ( IN-CITY ?AUTO_4972 ?AUTO_4970 ) ( not ( = ?AUTO_4972 ?AUTO_4975 ) ) ( IN-TRUCK ?AUTO_4964 ?AUTO_4976 ) ( TRUCK-AT ?AUTO_4976 ?AUTO_4979 ) ( IN-CITY ?AUTO_4979 ?AUTO_4978 ) ( IN-CITY ?AUTO_4971 ?AUTO_4978 ) ( not ( = ?AUTO_4971 ?AUTO_4979 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4976 ?AUTO_4979 ?AUTO_4971 ?AUTO_4978 )
      ( DELIVER-PKG ?AUTO_4964 ?AUTO_4965 )
      ( DELIVER-PKG-VERIFY ?AUTO_4964 ?AUTO_4965 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4981 - OBJ
      ?AUTO_4982 - LOCATION
    )
    :vars
    (
      ?AUTO_4988 - LOCATION
      ?AUTO_4993 - CITY
      ?AUTO_4986 - LOCATION
      ?AUTO_4989 - LOCATION
      ?AUTO_4991 - AIRPLANE
      ?AUTO_4990 - TRUCK
      ?AUTO_4987 - LOCATION
      ?AUTO_4992 - CITY
      ?AUTO_4985 - TRUCK
      ?AUTO_4994 - LOCATION
      ?AUTO_4995 - CITY
      ?AUTO_4997 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4988 ?AUTO_4993 ) ( IN-CITY ?AUTO_4982 ?AUTO_4993 ) ( not ( = ?AUTO_4982 ?AUTO_4988 ) ) ( AIRPORT ?AUTO_4986 ) ( AIRPORT ?AUTO_4988 ) ( not ( = ?AUTO_4986 ?AUTO_4988 ) ) ( AIRPORT ?AUTO_4989 ) ( AIRPLANE-AT ?AUTO_4991 ?AUTO_4989 ) ( not ( = ?AUTO_4989 ?AUTO_4986 ) ) ( TRUCK-AT ?AUTO_4990 ?AUTO_4987 ) ( IN-CITY ?AUTO_4987 ?AUTO_4992 ) ( IN-CITY ?AUTO_4988 ?AUTO_4992 ) ( not ( = ?AUTO_4988 ?AUTO_4987 ) ) ( TRUCK-AT ?AUTO_4985 ?AUTO_4994 ) ( IN-CITY ?AUTO_4994 ?AUTO_4995 ) ( IN-CITY ?AUTO_4986 ?AUTO_4995 ) ( not ( = ?AUTO_4986 ?AUTO_4994 ) ) ( TRUCK-AT ?AUTO_4985 ?AUTO_4997 ) ( OBJ-AT ?AUTO_4981 ?AUTO_4997 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4981 ?AUTO_4985 ?AUTO_4997 )
      ( DELIVER-PKG ?AUTO_4981 ?AUTO_4982 )
      ( DELIVER-PKG-VERIFY ?AUTO_4981 ?AUTO_4982 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4999 - OBJ
      ?AUTO_5000 - LOCATION
    )
    :vars
    (
      ?AUTO_5005 - LOCATION
      ?AUTO_5008 - CITY
      ?AUTO_5003 - LOCATION
      ?AUTO_5010 - LOCATION
      ?AUTO_5009 - AIRPLANE
      ?AUTO_5012 - TRUCK
      ?AUTO_5011 - LOCATION
      ?AUTO_5007 - CITY
      ?AUTO_5006 - LOCATION
      ?AUTO_5004 - CITY
      ?AUTO_5014 - TRUCK
      ?AUTO_5017 - LOCATION
      ?AUTO_5016 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_5005 ?AUTO_5008 ) ( IN-CITY ?AUTO_5000 ?AUTO_5008 ) ( not ( = ?AUTO_5000 ?AUTO_5005 ) ) ( AIRPORT ?AUTO_5003 ) ( AIRPORT ?AUTO_5005 ) ( not ( = ?AUTO_5003 ?AUTO_5005 ) ) ( AIRPORT ?AUTO_5010 ) ( AIRPLANE-AT ?AUTO_5009 ?AUTO_5010 ) ( not ( = ?AUTO_5010 ?AUTO_5003 ) ) ( TRUCK-AT ?AUTO_5012 ?AUTO_5011 ) ( IN-CITY ?AUTO_5011 ?AUTO_5007 ) ( IN-CITY ?AUTO_5005 ?AUTO_5007 ) ( not ( = ?AUTO_5005 ?AUTO_5011 ) ) ( IN-CITY ?AUTO_5006 ?AUTO_5004 ) ( IN-CITY ?AUTO_5003 ?AUTO_5004 ) ( not ( = ?AUTO_5003 ?AUTO_5006 ) ) ( OBJ-AT ?AUTO_4999 ?AUTO_5006 ) ( TRUCK-AT ?AUTO_5014 ?AUTO_5017 ) ( IN-CITY ?AUTO_5017 ?AUTO_5016 ) ( IN-CITY ?AUTO_5006 ?AUTO_5016 ) ( not ( = ?AUTO_5006 ?AUTO_5017 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5014 ?AUTO_5017 ?AUTO_5006 ?AUTO_5016 )
      ( DELIVER-PKG ?AUTO_4999 ?AUTO_5000 )
      ( DELIVER-PKG-VERIFY ?AUTO_4999 ?AUTO_5000 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5037 - OBJ
      ?AUTO_5038 - LOCATION
    )
    :vars
    (
      ?AUTO_5039 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5039 ?AUTO_5038 ) ( IN-TRUCK ?AUTO_5037 ?AUTO_5039 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_5037 ?AUTO_5039 ?AUTO_5038 )
      ( DELIVER-PKG-VERIFY ?AUTO_5037 ?AUTO_5038 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5042 - OBJ
      ?AUTO_5043 - LOCATION
    )
    :vars
    (
      ?AUTO_5046 - TRUCK
      ?AUTO_5049 - LOCATION
      ?AUTO_5048 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_5042 ?AUTO_5046 ) ( TRUCK-AT ?AUTO_5046 ?AUTO_5049 ) ( IN-CITY ?AUTO_5049 ?AUTO_5048 ) ( IN-CITY ?AUTO_5043 ?AUTO_5048 ) ( not ( = ?AUTO_5043 ?AUTO_5049 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5046 ?AUTO_5049 ?AUTO_5043 ?AUTO_5048 )
      ( DELIVER-PKG ?AUTO_5042 ?AUTO_5043 )
      ( DELIVER-PKG-VERIFY ?AUTO_5042 ?AUTO_5043 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5057 - OBJ
      ?AUTO_5058 - LOCATION
    )
    :vars
    (
      ?AUTO_5062 - TRUCK
      ?AUTO_5063 - LOCATION
      ?AUTO_5059 - CITY
      ?AUTO_5065 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5062 ?AUTO_5063 ) ( IN-CITY ?AUTO_5063 ?AUTO_5059 ) ( IN-CITY ?AUTO_5058 ?AUTO_5059 ) ( not ( = ?AUTO_5058 ?AUTO_5063 ) ) ( TRUCK-AT ?AUTO_5062 ?AUTO_5065 ) ( OBJ-AT ?AUTO_5057 ?AUTO_5065 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5057 ?AUTO_5062 ?AUTO_5065 )
      ( DELIVER-PKG ?AUTO_5057 ?AUTO_5058 )
      ( DELIVER-PKG-VERIFY ?AUTO_5057 ?AUTO_5058 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5069 - OBJ
      ?AUTO_5070 - LOCATION
    )
    :vars
    (
      ?AUTO_5074 - TRUCK
      ?AUTO_5075 - LOCATION
      ?AUTO_5076 - CITY
      ?AUTO_5073 - LOCATION
      ?AUTO_5077 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5074 ?AUTO_5075 ) ( IN-CITY ?AUTO_5075 ?AUTO_5076 ) ( IN-CITY ?AUTO_5070 ?AUTO_5076 ) ( not ( = ?AUTO_5070 ?AUTO_5075 ) ) ( TRUCK-AT ?AUTO_5074 ?AUTO_5073 ) ( IN-AIRPLANE ?AUTO_5069 ?AUTO_5077 ) ( AIRPLANE-AT ?AUTO_5077 ?AUTO_5073 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_5069 ?AUTO_5077 ?AUTO_5073 )
      ( DELIVER-PKG ?AUTO_5069 ?AUTO_5070 )
      ( DELIVER-PKG-VERIFY ?AUTO_5069 ?AUTO_5070 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5084 - OBJ
      ?AUTO_5085 - LOCATION
    )
    :vars
    (
      ?AUTO_5089 - TRUCK
      ?AUTO_5090 - LOCATION
      ?AUTO_5087 - CITY
      ?AUTO_5088 - LOCATION
      ?AUTO_5093 - LOCATION
      ?AUTO_5091 - AIRPLANE
      ?AUTO_5095 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5089 ?AUTO_5090 ) ( IN-CITY ?AUTO_5090 ?AUTO_5087 ) ( IN-CITY ?AUTO_5085 ?AUTO_5087 ) ( not ( = ?AUTO_5085 ?AUTO_5090 ) ) ( TRUCK-AT ?AUTO_5089 ?AUTO_5088 ) ( AIRPORT ?AUTO_5093 ) ( AIRPORT ?AUTO_5088 ) ( AIRPLANE-AT ?AUTO_5091 ?AUTO_5093 ) ( not ( = ?AUTO_5093 ?AUTO_5088 ) ) ( OBJ-AT ?AUTO_5084 ?AUTO_5095 ) ( AIRPLANE-AT ?AUTO_5091 ?AUTO_5095 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_5084 ?AUTO_5091 ?AUTO_5095 )
      ( DELIVER-PKG ?AUTO_5084 ?AUTO_5085 )
      ( DELIVER-PKG-VERIFY ?AUTO_5084 ?AUTO_5085 ) )
  )

)

