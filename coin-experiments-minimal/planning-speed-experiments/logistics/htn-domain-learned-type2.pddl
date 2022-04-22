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
      ?AUTO_92 - LOCATION
      ?AUTO_91 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_88 ) ( AIRPORT ?AUTO_87 ) ( AIRPLANE-AT ?AUTO_89 ?AUTO_88 ) ( not ( = ?AUTO_88 ?AUTO_87 ) ) ( IN-TRUCK ?AUTO_86 ?AUTO_90 ) ( TRUCK-AT ?AUTO_90 ?AUTO_92 ) ( IN-CITY ?AUTO_92 ?AUTO_91 ) ( IN-CITY ?AUTO_88 ?AUTO_91 ) ( not ( = ?AUTO_88 ?AUTO_92 ) ) ( not ( = ?AUTO_87 ?AUTO_92 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_90 ?AUTO_92 ?AUTO_88 ?AUTO_91 )
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
      ?AUTO_98 - TRUCK
      ?AUTO_99 - LOCATION
      ?AUTO_97 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_96 ) ( AIRPORT ?AUTO_94 ) ( AIRPLANE-AT ?AUTO_95 ?AUTO_96 ) ( not ( = ?AUTO_96 ?AUTO_94 ) ) ( TRUCK-AT ?AUTO_98 ?AUTO_99 ) ( IN-CITY ?AUTO_99 ?AUTO_97 ) ( IN-CITY ?AUTO_96 ?AUTO_97 ) ( not ( = ?AUTO_96 ?AUTO_99 ) ) ( not ( = ?AUTO_94 ?AUTO_99 ) ) ( OBJ-AT ?AUTO_93 ?AUTO_99 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_93 ?AUTO_98 ?AUTO_99 )
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
      ?AUTO_103 - AIRPLANE
      ?AUTO_105 - LOCATION
      ?AUTO_106 - CITY
      ?AUTO_104 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_102 ) ( AIRPORT ?AUTO_101 ) ( AIRPLANE-AT ?AUTO_103 ?AUTO_102 ) ( not ( = ?AUTO_102 ?AUTO_101 ) ) ( IN-CITY ?AUTO_105 ?AUTO_106 ) ( IN-CITY ?AUTO_102 ?AUTO_106 ) ( not ( = ?AUTO_102 ?AUTO_105 ) ) ( not ( = ?AUTO_101 ?AUTO_105 ) ) ( OBJ-AT ?AUTO_100 ?AUTO_105 ) ( TRUCK-AT ?AUTO_104 ?AUTO_102 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_104 ?AUTO_102 ?AUTO_105 ?AUTO_106 )
      ( DELIVER-PKG ?AUTO_100 ?AUTO_101 )
      ( DELIVER-PKG-VERIFY ?AUTO_100 ?AUTO_101 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_148 - OBJ
      ?AUTO_149 - LOCATION
    )
    :vars
    (
      ?AUTO_151 - LOCATION
      ?AUTO_150 - LOCATION
      ?AUTO_153 - CITY
      ?AUTO_154 - TRUCK
      ?AUTO_155 - LOCATION
      ?AUTO_152 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_151 ) ( AIRPORT ?AUTO_149 ) ( not ( = ?AUTO_151 ?AUTO_149 ) ) ( IN-CITY ?AUTO_150 ?AUTO_153 ) ( IN-CITY ?AUTO_151 ?AUTO_153 ) ( not ( = ?AUTO_151 ?AUTO_150 ) ) ( not ( = ?AUTO_149 ?AUTO_150 ) ) ( OBJ-AT ?AUTO_148 ?AUTO_150 ) ( TRUCK-AT ?AUTO_154 ?AUTO_151 ) ( AIRPORT ?AUTO_155 ) ( AIRPLANE-AT ?AUTO_152 ?AUTO_155 ) ( not ( = ?AUTO_155 ?AUTO_151 ) ) ( not ( = ?AUTO_149 ?AUTO_155 ) ) ( not ( = ?AUTO_150 ?AUTO_155 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_152 ?AUTO_155 ?AUTO_151 )
      ( DELIVER-PKG ?AUTO_148 ?AUTO_149 )
      ( DELIVER-PKG-VERIFY ?AUTO_148 ?AUTO_149 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_236 - OBJ
      ?AUTO_237 - LOCATION
    )
    :vars
    (
      ?AUTO_240 - LOCATION
      ?AUTO_238 - CITY
      ?AUTO_239 - TRUCK
      ?AUTO_241 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_240 ?AUTO_238 ) ( IN-CITY ?AUTO_237 ?AUTO_238 ) ( not ( = ?AUTO_237 ?AUTO_240 ) ) ( TRUCK-AT ?AUTO_239 ?AUTO_237 ) ( IN-AIRPLANE ?AUTO_236 ?AUTO_241 ) ( AIRPLANE-AT ?AUTO_241 ?AUTO_240 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_236 ?AUTO_241 ?AUTO_240 )
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
      ?AUTO_246 - LOCATION
      ?AUTO_245 - CITY
      ?AUTO_244 - TRUCK
      ?AUTO_247 - AIRPLANE
      ?AUTO_248 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_246 ?AUTO_245 ) ( IN-CITY ?AUTO_243 ?AUTO_245 ) ( not ( = ?AUTO_243 ?AUTO_246 ) ) ( TRUCK-AT ?AUTO_244 ?AUTO_243 ) ( IN-AIRPLANE ?AUTO_242 ?AUTO_247 ) ( AIRPORT ?AUTO_248 ) ( AIRPORT ?AUTO_246 ) ( AIRPLANE-AT ?AUTO_247 ?AUTO_248 ) ( not ( = ?AUTO_248 ?AUTO_246 ) ) ( not ( = ?AUTO_243 ?AUTO_248 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_247 ?AUTO_248 ?AUTO_246 )
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
      ?AUTO_263 - CITY
      ?AUTO_264 - TRUCK
      ?AUTO_266 - LOCATION
      ?AUTO_267 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_265 ?AUTO_263 ) ( IN-CITY ?AUTO_262 ?AUTO_263 ) ( not ( = ?AUTO_262 ?AUTO_265 ) ) ( TRUCK-AT ?AUTO_264 ?AUTO_262 ) ( AIRPORT ?AUTO_266 ) ( AIRPORT ?AUTO_265 ) ( AIRPLANE-AT ?AUTO_267 ?AUTO_266 ) ( not ( = ?AUTO_266 ?AUTO_265 ) ) ( not ( = ?AUTO_262 ?AUTO_266 ) ) ( OBJ-AT ?AUTO_261 ?AUTO_266 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_261 ?AUTO_267 ?AUTO_266 )
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
      ?AUTO_271 - CITY
      ?AUTO_270 - TRUCK
      ?AUTO_273 - LOCATION
      ?AUTO_272 - AIRPLANE
      ?AUTO_275 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_274 ?AUTO_271 ) ( IN-CITY ?AUTO_269 ?AUTO_271 ) ( not ( = ?AUTO_269 ?AUTO_274 ) ) ( TRUCK-AT ?AUTO_270 ?AUTO_269 ) ( AIRPORT ?AUTO_273 ) ( AIRPORT ?AUTO_274 ) ( AIRPLANE-AT ?AUTO_272 ?AUTO_273 ) ( not ( = ?AUTO_273 ?AUTO_274 ) ) ( not ( = ?AUTO_269 ?AUTO_273 ) ) ( TRUCK-AT ?AUTO_275 ?AUTO_273 ) ( IN-TRUCK ?AUTO_268 ?AUTO_275 ) ( not ( = ?AUTO_270 ?AUTO_275 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_268 ?AUTO_275 ?AUTO_273 )
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
      ?AUTO_279 - CITY
      ?AUTO_282 - TRUCK
      ?AUTO_280 - LOCATION
      ?AUTO_281 - AIRPLANE
      ?AUTO_283 - TRUCK
      ?AUTO_285 - LOCATION
      ?AUTO_284 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_278 ?AUTO_279 ) ( IN-CITY ?AUTO_277 ?AUTO_279 ) ( not ( = ?AUTO_277 ?AUTO_278 ) ) ( TRUCK-AT ?AUTO_282 ?AUTO_277 ) ( AIRPORT ?AUTO_280 ) ( AIRPORT ?AUTO_278 ) ( AIRPLANE-AT ?AUTO_281 ?AUTO_280 ) ( not ( = ?AUTO_280 ?AUTO_278 ) ) ( not ( = ?AUTO_277 ?AUTO_280 ) ) ( IN-TRUCK ?AUTO_276 ?AUTO_283 ) ( not ( = ?AUTO_282 ?AUTO_283 ) ) ( TRUCK-AT ?AUTO_283 ?AUTO_285 ) ( IN-CITY ?AUTO_285 ?AUTO_284 ) ( IN-CITY ?AUTO_280 ?AUTO_284 ) ( not ( = ?AUTO_280 ?AUTO_285 ) ) ( not ( = ?AUTO_277 ?AUTO_285 ) ) ( not ( = ?AUTO_278 ?AUTO_285 ) ) ( not ( = ?AUTO_279 ?AUTO_284 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_283 ?AUTO_285 ?AUTO_280 ?AUTO_284 )
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
      ?AUTO_291 - LOCATION
      ?AUTO_289 - CITY
      ?AUTO_288 - TRUCK
      ?AUTO_294 - LOCATION
      ?AUTO_290 - AIRPLANE
      ?AUTO_292 - TRUCK
      ?AUTO_295 - LOCATION
      ?AUTO_293 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_291 ?AUTO_289 ) ( IN-CITY ?AUTO_287 ?AUTO_289 ) ( not ( = ?AUTO_287 ?AUTO_291 ) ) ( TRUCK-AT ?AUTO_288 ?AUTO_287 ) ( AIRPORT ?AUTO_294 ) ( AIRPORT ?AUTO_291 ) ( AIRPLANE-AT ?AUTO_290 ?AUTO_294 ) ( not ( = ?AUTO_294 ?AUTO_291 ) ) ( not ( = ?AUTO_287 ?AUTO_294 ) ) ( not ( = ?AUTO_288 ?AUTO_292 ) ) ( TRUCK-AT ?AUTO_292 ?AUTO_295 ) ( IN-CITY ?AUTO_295 ?AUTO_293 ) ( IN-CITY ?AUTO_294 ?AUTO_293 ) ( not ( = ?AUTO_294 ?AUTO_295 ) ) ( not ( = ?AUTO_287 ?AUTO_295 ) ) ( not ( = ?AUTO_291 ?AUTO_295 ) ) ( not ( = ?AUTO_289 ?AUTO_293 ) ) ( OBJ-AT ?AUTO_286 ?AUTO_295 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_286 ?AUTO_292 ?AUTO_295 )
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
      ?AUTO_301 - LOCATION
      ?AUTO_305 - CITY
      ?AUTO_298 - TRUCK
      ?AUTO_299 - LOCATION
      ?AUTO_304 - AIRPLANE
      ?AUTO_300 - TRUCK
      ?AUTO_302 - LOCATION
      ?AUTO_303 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_301 ?AUTO_305 ) ( IN-CITY ?AUTO_297 ?AUTO_305 ) ( not ( = ?AUTO_297 ?AUTO_301 ) ) ( TRUCK-AT ?AUTO_298 ?AUTO_297 ) ( AIRPORT ?AUTO_299 ) ( AIRPORT ?AUTO_301 ) ( AIRPLANE-AT ?AUTO_304 ?AUTO_299 ) ( not ( = ?AUTO_299 ?AUTO_301 ) ) ( not ( = ?AUTO_297 ?AUTO_299 ) ) ( not ( = ?AUTO_298 ?AUTO_300 ) ) ( IN-CITY ?AUTO_302 ?AUTO_303 ) ( IN-CITY ?AUTO_299 ?AUTO_303 ) ( not ( = ?AUTO_299 ?AUTO_302 ) ) ( not ( = ?AUTO_297 ?AUTO_302 ) ) ( not ( = ?AUTO_301 ?AUTO_302 ) ) ( not ( = ?AUTO_305 ?AUTO_303 ) ) ( OBJ-AT ?AUTO_296 ?AUTO_302 ) ( TRUCK-AT ?AUTO_300 ?AUTO_299 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_300 ?AUTO_299 ?AUTO_302 ?AUTO_303 )
      ( DELIVER-PKG ?AUTO_296 ?AUTO_297 )
      ( DELIVER-PKG-VERIFY ?AUTO_296 ?AUTO_297 ) )
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
      ?AUTO_348 - TRUCK
      ?AUTO_347 - LOCATION
      ?AUTO_346 - CITY
      ?AUTO_350 - LOCATION
      ?AUTO_349 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_345 ) ( AIRPORT ?AUTO_344 ) ( not ( = ?AUTO_345 ?AUTO_344 ) ) ( IN-TRUCK ?AUTO_343 ?AUTO_348 ) ( TRUCK-AT ?AUTO_348 ?AUTO_347 ) ( IN-CITY ?AUTO_347 ?AUTO_346 ) ( IN-CITY ?AUTO_345 ?AUTO_346 ) ( not ( = ?AUTO_345 ?AUTO_347 ) ) ( not ( = ?AUTO_344 ?AUTO_347 ) ) ( AIRPORT ?AUTO_350 ) ( AIRPLANE-AT ?AUTO_349 ?AUTO_350 ) ( not ( = ?AUTO_350 ?AUTO_345 ) ) ( not ( = ?AUTO_344 ?AUTO_350 ) ) ( not ( = ?AUTO_347 ?AUTO_350 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_349 ?AUTO_350 ?AUTO_345 )
      ( DELIVER-PKG ?AUTO_343 ?AUTO_344 )
      ( DELIVER-PKG-VERIFY ?AUTO_343 ?AUTO_344 ) )
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
      ?AUTO_384 - OBJ
      ?AUTO_385 - LOCATION
    )
    :vars
    (
      ?AUTO_388 - LOCATION
      ?AUTO_386 - CITY
      ?AUTO_387 - TRUCK
      ?AUTO_389 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_388 ?AUTO_386 ) ( IN-CITY ?AUTO_385 ?AUTO_386 ) ( not ( = ?AUTO_385 ?AUTO_388 ) ) ( OBJ-AT ?AUTO_384 ?AUTO_388 ) ( TRUCK-AT ?AUTO_387 ?AUTO_389 ) ( IN-CITY ?AUTO_389 ?AUTO_386 ) ( not ( = ?AUTO_388 ?AUTO_389 ) ) ( not ( = ?AUTO_385 ?AUTO_389 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_387 ?AUTO_389 ?AUTO_388 ?AUTO_386 )
      ( DELIVER-PKG ?AUTO_384 ?AUTO_385 )
      ( DELIVER-PKG-VERIFY ?AUTO_384 ?AUTO_385 ) )
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
      ?AUTO_469 - LOCATION
      ?AUTO_468 - AIRPLANE
      ?AUTO_470 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_467 ) ( AIRPORT ?AUTO_466 ) ( not ( = ?AUTO_467 ?AUTO_466 ) ) ( AIRPORT ?AUTO_469 ) ( AIRPLANE-AT ?AUTO_468 ?AUTO_469 ) ( not ( = ?AUTO_469 ?AUTO_467 ) ) ( not ( = ?AUTO_466 ?AUTO_469 ) ) ( TRUCK-AT ?AUTO_470 ?AUTO_467 ) ( IN-TRUCK ?AUTO_465 ?AUTO_470 ) )
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
      ?AUTO_475 - LOCATION
      ?AUTO_473 - AIRPLANE
      ?AUTO_476 - TRUCK
      ?AUTO_478 - LOCATION
      ?AUTO_477 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_474 ) ( AIRPORT ?AUTO_472 ) ( not ( = ?AUTO_474 ?AUTO_472 ) ) ( AIRPORT ?AUTO_475 ) ( AIRPLANE-AT ?AUTO_473 ?AUTO_475 ) ( not ( = ?AUTO_475 ?AUTO_474 ) ) ( not ( = ?AUTO_472 ?AUTO_475 ) ) ( IN-TRUCK ?AUTO_471 ?AUTO_476 ) ( TRUCK-AT ?AUTO_476 ?AUTO_478 ) ( IN-CITY ?AUTO_478 ?AUTO_477 ) ( IN-CITY ?AUTO_474 ?AUTO_477 ) ( not ( = ?AUTO_474 ?AUTO_478 ) ) ( not ( = ?AUTO_472 ?AUTO_478 ) ) ( not ( = ?AUTO_475 ?AUTO_478 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_476 ?AUTO_478 ?AUTO_474 ?AUTO_477 )
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
      ?AUTO_485 - LOCATION
      ?AUTO_481 - AIRPLANE
      ?AUTO_482 - TRUCK
      ?AUTO_484 - LOCATION
      ?AUTO_486 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_483 ) ( AIRPORT ?AUTO_480 ) ( not ( = ?AUTO_483 ?AUTO_480 ) ) ( AIRPORT ?AUTO_485 ) ( AIRPLANE-AT ?AUTO_481 ?AUTO_485 ) ( not ( = ?AUTO_485 ?AUTO_483 ) ) ( not ( = ?AUTO_480 ?AUTO_485 ) ) ( TRUCK-AT ?AUTO_482 ?AUTO_484 ) ( IN-CITY ?AUTO_484 ?AUTO_486 ) ( IN-CITY ?AUTO_483 ?AUTO_486 ) ( not ( = ?AUTO_483 ?AUTO_484 ) ) ( not ( = ?AUTO_480 ?AUTO_484 ) ) ( not ( = ?AUTO_485 ?AUTO_484 ) ) ( OBJ-AT ?AUTO_479 ?AUTO_484 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_479 ?AUTO_482 ?AUTO_484 )
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
      ?AUTO_492 - LOCATION
      ?AUTO_490 - LOCATION
      ?AUTO_489 - AIRPLANE
      ?AUTO_493 - LOCATION
      ?AUTO_491 - CITY
      ?AUTO_494 - TRUCK
      ?AUTO_495 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_492 ) ( AIRPORT ?AUTO_488 ) ( not ( = ?AUTO_492 ?AUTO_488 ) ) ( AIRPORT ?AUTO_490 ) ( AIRPLANE-AT ?AUTO_489 ?AUTO_490 ) ( not ( = ?AUTO_490 ?AUTO_492 ) ) ( not ( = ?AUTO_488 ?AUTO_490 ) ) ( IN-CITY ?AUTO_493 ?AUTO_491 ) ( IN-CITY ?AUTO_492 ?AUTO_491 ) ( not ( = ?AUTO_492 ?AUTO_493 ) ) ( not ( = ?AUTO_488 ?AUTO_493 ) ) ( not ( = ?AUTO_490 ?AUTO_493 ) ) ( OBJ-AT ?AUTO_487 ?AUTO_493 ) ( TRUCK-AT ?AUTO_494 ?AUTO_495 ) ( IN-CITY ?AUTO_495 ?AUTO_491 ) ( not ( = ?AUTO_493 ?AUTO_495 ) ) ( not ( = ?AUTO_488 ?AUTO_495 ) ) ( not ( = ?AUTO_492 ?AUTO_495 ) ) ( not ( = ?AUTO_490 ?AUTO_495 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_494 ?AUTO_495 ?AUTO_493 ?AUTO_491 )
      ( DELIVER-PKG ?AUTO_487 ?AUTO_488 )
      ( DELIVER-PKG-VERIFY ?AUTO_487 ?AUTO_488 ) )
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
      ?AUTO_715 - LOCATION
      ?AUTO_713 - CITY
      ?AUTO_716 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_714 ?AUTO_715 ) ( IN-CITY ?AUTO_715 ?AUTO_713 ) ( IN-CITY ?AUTO_712 ?AUTO_713 ) ( not ( = ?AUTO_712 ?AUTO_715 ) ) ( IN-AIRPLANE ?AUTO_711 ?AUTO_716 ) ( AIRPLANE-AT ?AUTO_716 ?AUTO_715 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_711 ?AUTO_716 ?AUTO_715 )
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
      ?AUTO_720 - LOCATION
      ?AUTO_719 - CITY
      ?AUTO_722 - AIRPLANE
      ?AUTO_723 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_721 ?AUTO_720 ) ( IN-CITY ?AUTO_720 ?AUTO_719 ) ( IN-CITY ?AUTO_718 ?AUTO_719 ) ( not ( = ?AUTO_718 ?AUTO_720 ) ) ( IN-AIRPLANE ?AUTO_717 ?AUTO_722 ) ( AIRPORT ?AUTO_723 ) ( AIRPORT ?AUTO_720 ) ( AIRPLANE-AT ?AUTO_722 ?AUTO_723 ) ( not ( = ?AUTO_723 ?AUTO_720 ) ) ( not ( = ?AUTO_718 ?AUTO_723 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_722 ?AUTO_723 ?AUTO_720 )
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
      ?AUTO_729 - TRUCK
      ?AUTO_732 - LOCATION
      ?AUTO_731 - CITY
      ?AUTO_730 - LOCATION
      ?AUTO_728 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_729 ?AUTO_732 ) ( IN-CITY ?AUTO_732 ?AUTO_731 ) ( IN-CITY ?AUTO_727 ?AUTO_731 ) ( not ( = ?AUTO_727 ?AUTO_732 ) ) ( AIRPORT ?AUTO_730 ) ( AIRPORT ?AUTO_732 ) ( AIRPLANE-AT ?AUTO_728 ?AUTO_730 ) ( not ( = ?AUTO_730 ?AUTO_732 ) ) ( not ( = ?AUTO_727 ?AUTO_730 ) ) ( OBJ-AT ?AUTO_726 ?AUTO_730 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_726 ?AUTO_728 ?AUTO_730 )
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
      ?AUTO_738 - TRUCK
      ?AUTO_735 - LOCATION
      ?AUTO_739 - CITY
      ?AUTO_737 - LOCATION
      ?AUTO_740 - LOCATION
      ?AUTO_736 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_738 ?AUTO_735 ) ( IN-CITY ?AUTO_735 ?AUTO_739 ) ( IN-CITY ?AUTO_734 ?AUTO_739 ) ( not ( = ?AUTO_734 ?AUTO_735 ) ) ( AIRPORT ?AUTO_737 ) ( AIRPORT ?AUTO_735 ) ( not ( = ?AUTO_737 ?AUTO_735 ) ) ( not ( = ?AUTO_734 ?AUTO_737 ) ) ( OBJ-AT ?AUTO_733 ?AUTO_737 ) ( AIRPORT ?AUTO_740 ) ( AIRPLANE-AT ?AUTO_736 ?AUTO_740 ) ( not ( = ?AUTO_740 ?AUTO_737 ) ) ( not ( = ?AUTO_734 ?AUTO_740 ) ) ( not ( = ?AUTO_735 ?AUTO_740 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_736 ?AUTO_740 ?AUTO_737 )
      ( DELIVER-PKG ?AUTO_733 ?AUTO_734 )
      ( DELIVER-PKG-VERIFY ?AUTO_733 ?AUTO_734 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_929 - OBJ
      ?AUTO_930 - LOCATION
    )
    :vars
    (
      ?AUTO_933 - LOCATION
      ?AUTO_932 - CITY
      ?AUTO_934 - TRUCK
      ?AUTO_931 - LOCATION
      ?AUTO_935 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_933 ?AUTO_932 ) ( IN-CITY ?AUTO_930 ?AUTO_932 ) ( not ( = ?AUTO_930 ?AUTO_933 ) ) ( TRUCK-AT ?AUTO_934 ?AUTO_931 ) ( IN-CITY ?AUTO_931 ?AUTO_932 ) ( not ( = ?AUTO_933 ?AUTO_931 ) ) ( not ( = ?AUTO_930 ?AUTO_931 ) ) ( IN-AIRPLANE ?AUTO_929 ?AUTO_935 ) ( AIRPLANE-AT ?AUTO_935 ?AUTO_933 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_929 ?AUTO_935 ?AUTO_933 )
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
      ?AUTO_941 - LOCATION
      ?AUTO_938 - CITY
      ?AUTO_940 - TRUCK
      ?AUTO_939 - LOCATION
      ?AUTO_942 - AIRPLANE
      ?AUTO_943 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_941 ?AUTO_938 ) ( IN-CITY ?AUTO_937 ?AUTO_938 ) ( not ( = ?AUTO_937 ?AUTO_941 ) ) ( TRUCK-AT ?AUTO_940 ?AUTO_939 ) ( IN-CITY ?AUTO_939 ?AUTO_938 ) ( not ( = ?AUTO_941 ?AUTO_939 ) ) ( not ( = ?AUTO_937 ?AUTO_939 ) ) ( IN-AIRPLANE ?AUTO_936 ?AUTO_942 ) ( AIRPORT ?AUTO_943 ) ( AIRPORT ?AUTO_941 ) ( AIRPLANE-AT ?AUTO_942 ?AUTO_943 ) ( not ( = ?AUTO_943 ?AUTO_941 ) ) ( not ( = ?AUTO_937 ?AUTO_943 ) ) ( not ( = ?AUTO_939 ?AUTO_943 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_942 ?AUTO_943 ?AUTO_941 )
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
      ?AUTO_972 - CITY
      ?AUTO_971 - TRUCK
      ?AUTO_975 - LOCATION
      ?AUTO_970 - LOCATION
      ?AUTO_974 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_973 ?AUTO_972 ) ( IN-CITY ?AUTO_969 ?AUTO_972 ) ( not ( = ?AUTO_969 ?AUTO_973 ) ) ( TRUCK-AT ?AUTO_971 ?AUTO_975 ) ( IN-CITY ?AUTO_975 ?AUTO_972 ) ( not ( = ?AUTO_973 ?AUTO_975 ) ) ( not ( = ?AUTO_969 ?AUTO_975 ) ) ( AIRPORT ?AUTO_970 ) ( AIRPORT ?AUTO_973 ) ( AIRPLANE-AT ?AUTO_974 ?AUTO_970 ) ( not ( = ?AUTO_970 ?AUTO_973 ) ) ( not ( = ?AUTO_969 ?AUTO_970 ) ) ( not ( = ?AUTO_975 ?AUTO_970 ) ) ( OBJ-AT ?AUTO_968 ?AUTO_970 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_968 ?AUTO_974 ?AUTO_970 )
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
      ?AUTO_980 - LOCATION
      ?AUTO_978 - CITY
      ?AUTO_982 - TRUCK
      ?AUTO_981 - LOCATION
      ?AUTO_979 - LOCATION
      ?AUTO_983 - AIRPLANE
      ?AUTO_984 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_980 ?AUTO_978 ) ( IN-CITY ?AUTO_977 ?AUTO_978 ) ( not ( = ?AUTO_977 ?AUTO_980 ) ) ( TRUCK-AT ?AUTO_982 ?AUTO_981 ) ( IN-CITY ?AUTO_981 ?AUTO_978 ) ( not ( = ?AUTO_980 ?AUTO_981 ) ) ( not ( = ?AUTO_977 ?AUTO_981 ) ) ( AIRPORT ?AUTO_979 ) ( AIRPORT ?AUTO_980 ) ( AIRPLANE-AT ?AUTO_983 ?AUTO_979 ) ( not ( = ?AUTO_979 ?AUTO_980 ) ) ( not ( = ?AUTO_977 ?AUTO_979 ) ) ( not ( = ?AUTO_981 ?AUTO_979 ) ) ( TRUCK-AT ?AUTO_984 ?AUTO_979 ) ( IN-TRUCK ?AUTO_976 ?AUTO_984 ) ( not ( = ?AUTO_982 ?AUTO_984 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_976 ?AUTO_984 ?AUTO_979 )
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
      ?AUTO_990 - LOCATION
      ?AUTO_988 - CITY
      ?AUTO_992 - TRUCK
      ?AUTO_989 - LOCATION
      ?AUTO_987 - LOCATION
      ?AUTO_991 - AIRPLANE
      ?AUTO_993 - TRUCK
      ?AUTO_995 - LOCATION
      ?AUTO_994 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_990 ?AUTO_988 ) ( IN-CITY ?AUTO_986 ?AUTO_988 ) ( not ( = ?AUTO_986 ?AUTO_990 ) ) ( TRUCK-AT ?AUTO_992 ?AUTO_989 ) ( IN-CITY ?AUTO_989 ?AUTO_988 ) ( not ( = ?AUTO_990 ?AUTO_989 ) ) ( not ( = ?AUTO_986 ?AUTO_989 ) ) ( AIRPORT ?AUTO_987 ) ( AIRPORT ?AUTO_990 ) ( AIRPLANE-AT ?AUTO_991 ?AUTO_987 ) ( not ( = ?AUTO_987 ?AUTO_990 ) ) ( not ( = ?AUTO_986 ?AUTO_987 ) ) ( not ( = ?AUTO_989 ?AUTO_987 ) ) ( IN-TRUCK ?AUTO_985 ?AUTO_993 ) ( not ( = ?AUTO_992 ?AUTO_993 ) ) ( TRUCK-AT ?AUTO_993 ?AUTO_995 ) ( IN-CITY ?AUTO_995 ?AUTO_994 ) ( IN-CITY ?AUTO_987 ?AUTO_994 ) ( not ( = ?AUTO_987 ?AUTO_995 ) ) ( not ( = ?AUTO_986 ?AUTO_995 ) ) ( not ( = ?AUTO_990 ?AUTO_995 ) ) ( not ( = ?AUTO_988 ?AUTO_994 ) ) ( not ( = ?AUTO_989 ?AUTO_995 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_993 ?AUTO_995 ?AUTO_987 ?AUTO_994 )
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
      ?AUTO_999 - LOCATION
      ?AUTO_1002 - CITY
      ?AUTO_1001 - TRUCK
      ?AUTO_1005 - LOCATION
      ?AUTO_1000 - LOCATION
      ?AUTO_998 - AIRPLANE
      ?AUTO_1006 - TRUCK
      ?AUTO_1004 - LOCATION
      ?AUTO_1003 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_999 ?AUTO_1002 ) ( IN-CITY ?AUTO_997 ?AUTO_1002 ) ( not ( = ?AUTO_997 ?AUTO_999 ) ) ( TRUCK-AT ?AUTO_1001 ?AUTO_1005 ) ( IN-CITY ?AUTO_1005 ?AUTO_1002 ) ( not ( = ?AUTO_999 ?AUTO_1005 ) ) ( not ( = ?AUTO_997 ?AUTO_1005 ) ) ( AIRPORT ?AUTO_1000 ) ( AIRPORT ?AUTO_999 ) ( AIRPLANE-AT ?AUTO_998 ?AUTO_1000 ) ( not ( = ?AUTO_1000 ?AUTO_999 ) ) ( not ( = ?AUTO_997 ?AUTO_1000 ) ) ( not ( = ?AUTO_1005 ?AUTO_1000 ) ) ( not ( = ?AUTO_1001 ?AUTO_1006 ) ) ( TRUCK-AT ?AUTO_1006 ?AUTO_1004 ) ( IN-CITY ?AUTO_1004 ?AUTO_1003 ) ( IN-CITY ?AUTO_1000 ?AUTO_1003 ) ( not ( = ?AUTO_1000 ?AUTO_1004 ) ) ( not ( = ?AUTO_997 ?AUTO_1004 ) ) ( not ( = ?AUTO_999 ?AUTO_1004 ) ) ( not ( = ?AUTO_1002 ?AUTO_1003 ) ) ( not ( = ?AUTO_1005 ?AUTO_1004 ) ) ( OBJ-AT ?AUTO_996 ?AUTO_1004 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_996 ?AUTO_1006 ?AUTO_1004 )
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
      ?AUTO_1010 - LOCATION
      ?AUTO_1014 - CITY
      ?AUTO_1013 - TRUCK
      ?AUTO_1016 - LOCATION
      ?AUTO_1009 - LOCATION
      ?AUTO_1015 - AIRPLANE
      ?AUTO_1017 - TRUCK
      ?AUTO_1012 - LOCATION
      ?AUTO_1011 - CITY
      ?AUTO_1018 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1010 ?AUTO_1014 ) ( IN-CITY ?AUTO_1008 ?AUTO_1014 ) ( not ( = ?AUTO_1008 ?AUTO_1010 ) ) ( TRUCK-AT ?AUTO_1013 ?AUTO_1016 ) ( IN-CITY ?AUTO_1016 ?AUTO_1014 ) ( not ( = ?AUTO_1010 ?AUTO_1016 ) ) ( not ( = ?AUTO_1008 ?AUTO_1016 ) ) ( AIRPORT ?AUTO_1009 ) ( AIRPORT ?AUTO_1010 ) ( AIRPLANE-AT ?AUTO_1015 ?AUTO_1009 ) ( not ( = ?AUTO_1009 ?AUTO_1010 ) ) ( not ( = ?AUTO_1008 ?AUTO_1009 ) ) ( not ( = ?AUTO_1016 ?AUTO_1009 ) ) ( not ( = ?AUTO_1013 ?AUTO_1017 ) ) ( IN-CITY ?AUTO_1012 ?AUTO_1011 ) ( IN-CITY ?AUTO_1009 ?AUTO_1011 ) ( not ( = ?AUTO_1009 ?AUTO_1012 ) ) ( not ( = ?AUTO_1008 ?AUTO_1012 ) ) ( not ( = ?AUTO_1010 ?AUTO_1012 ) ) ( not ( = ?AUTO_1014 ?AUTO_1011 ) ) ( not ( = ?AUTO_1016 ?AUTO_1012 ) ) ( OBJ-AT ?AUTO_1007 ?AUTO_1012 ) ( TRUCK-AT ?AUTO_1017 ?AUTO_1018 ) ( IN-CITY ?AUTO_1018 ?AUTO_1011 ) ( not ( = ?AUTO_1012 ?AUTO_1018 ) ) ( not ( = ?AUTO_1008 ?AUTO_1018 ) ) ( not ( = ?AUTO_1010 ?AUTO_1018 ) ) ( not ( = ?AUTO_1016 ?AUTO_1018 ) ) ( not ( = ?AUTO_1009 ?AUTO_1018 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1017 ?AUTO_1018 ?AUTO_1012 ?AUTO_1011 )
      ( DELIVER-PKG ?AUTO_1007 ?AUTO_1008 )
      ( DELIVER-PKG-VERIFY ?AUTO_1007 ?AUTO_1008 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1101 - OBJ
      ?AUTO_1102 - LOCATION
    )
    :vars
    (
      ?AUTO_1107 - LOCATION
      ?AUTO_1108 - CITY
      ?AUTO_1105 - TRUCK
      ?AUTO_1104 - LOCATION
      ?AUTO_1103 - LOCATION
      ?AUTO_1109 - LOCATION
      ?AUTO_1106 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1107 ?AUTO_1108 ) ( IN-CITY ?AUTO_1102 ?AUTO_1108 ) ( not ( = ?AUTO_1102 ?AUTO_1107 ) ) ( TRUCK-AT ?AUTO_1105 ?AUTO_1104 ) ( IN-CITY ?AUTO_1104 ?AUTO_1108 ) ( not ( = ?AUTO_1107 ?AUTO_1104 ) ) ( not ( = ?AUTO_1102 ?AUTO_1104 ) ) ( AIRPORT ?AUTO_1103 ) ( AIRPORT ?AUTO_1107 ) ( not ( = ?AUTO_1103 ?AUTO_1107 ) ) ( not ( = ?AUTO_1102 ?AUTO_1103 ) ) ( not ( = ?AUTO_1104 ?AUTO_1103 ) ) ( OBJ-AT ?AUTO_1101 ?AUTO_1103 ) ( AIRPORT ?AUTO_1109 ) ( AIRPLANE-AT ?AUTO_1106 ?AUTO_1109 ) ( not ( = ?AUTO_1109 ?AUTO_1103 ) ) ( not ( = ?AUTO_1102 ?AUTO_1109 ) ) ( not ( = ?AUTO_1107 ?AUTO_1109 ) ) ( not ( = ?AUTO_1104 ?AUTO_1109 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1106 ?AUTO_1109 ?AUTO_1103 )
      ( DELIVER-PKG ?AUTO_1101 ?AUTO_1102 )
      ( DELIVER-PKG-VERIFY ?AUTO_1101 ?AUTO_1102 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1397 - OBJ
      ?AUTO_1398 - LOCATION
    )
    :vars
    (
      ?AUTO_1400 - LOCATION
      ?AUTO_1399 - CITY
      ?AUTO_1402 - TRUCK
      ?AUTO_1403 - LOCATION
      ?AUTO_1404 - LOCATION
      ?AUTO_1401 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1400 ?AUTO_1399 ) ( IN-CITY ?AUTO_1398 ?AUTO_1399 ) ( not ( = ?AUTO_1398 ?AUTO_1400 ) ) ( TRUCK-AT ?AUTO_1402 ?AUTO_1398 ) ( AIRPORT ?AUTO_1403 ) ( AIRPORT ?AUTO_1400 ) ( not ( = ?AUTO_1403 ?AUTO_1400 ) ) ( not ( = ?AUTO_1398 ?AUTO_1403 ) ) ( OBJ-AT ?AUTO_1397 ?AUTO_1403 ) ( AIRPORT ?AUTO_1404 ) ( AIRPLANE-AT ?AUTO_1401 ?AUTO_1404 ) ( not ( = ?AUTO_1404 ?AUTO_1403 ) ) ( not ( = ?AUTO_1398 ?AUTO_1404 ) ) ( not ( = ?AUTO_1400 ?AUTO_1404 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1401 ?AUTO_1404 ?AUTO_1403 )
      ( DELIVER-PKG ?AUTO_1397 ?AUTO_1398 )
      ( DELIVER-PKG-VERIFY ?AUTO_1397 ?AUTO_1398 ) )
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
      ?AUTO_1616 - LOCATION
      ?AUTO_1615 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1614 ) ( AIRPORT ?AUTO_1611 ) ( not ( = ?AUTO_1614 ?AUTO_1611 ) ) ( AIRPLANE-AT ?AUTO_1613 ?AUTO_1611 ) ( IN-TRUCK ?AUTO_1610 ?AUTO_1612 ) ( TRUCK-AT ?AUTO_1612 ?AUTO_1616 ) ( IN-CITY ?AUTO_1616 ?AUTO_1615 ) ( IN-CITY ?AUTO_1614 ?AUTO_1615 ) ( not ( = ?AUTO_1614 ?AUTO_1616 ) ) ( not ( = ?AUTO_1611 ?AUTO_1616 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1612 ?AUTO_1616 ?AUTO_1614 ?AUTO_1615 )
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
      ?AUTO_1621 - LOCATION
      ?AUTO_1619 - AIRPLANE
      ?AUTO_1620 - TRUCK
      ?AUTO_1623 - LOCATION
      ?AUTO_1622 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1621 ) ( AIRPORT ?AUTO_1618 ) ( not ( = ?AUTO_1621 ?AUTO_1618 ) ) ( AIRPLANE-AT ?AUTO_1619 ?AUTO_1618 ) ( TRUCK-AT ?AUTO_1620 ?AUTO_1623 ) ( IN-CITY ?AUTO_1623 ?AUTO_1622 ) ( IN-CITY ?AUTO_1621 ?AUTO_1622 ) ( not ( = ?AUTO_1621 ?AUTO_1623 ) ) ( not ( = ?AUTO_1618 ?AUTO_1623 ) ) ( OBJ-AT ?AUTO_1617 ?AUTO_1623 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1617 ?AUTO_1620 ?AUTO_1623 )
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
      ?AUTO_1630 - LOCATION
      ?AUTO_1626 - AIRPLANE
      ?AUTO_1627 - LOCATION
      ?AUTO_1629 - CITY
      ?AUTO_1628 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1630 ) ( AIRPORT ?AUTO_1625 ) ( not ( = ?AUTO_1630 ?AUTO_1625 ) ) ( AIRPLANE-AT ?AUTO_1626 ?AUTO_1625 ) ( IN-CITY ?AUTO_1627 ?AUTO_1629 ) ( IN-CITY ?AUTO_1630 ?AUTO_1629 ) ( not ( = ?AUTO_1630 ?AUTO_1627 ) ) ( not ( = ?AUTO_1625 ?AUTO_1627 ) ) ( OBJ-AT ?AUTO_1624 ?AUTO_1627 ) ( TRUCK-AT ?AUTO_1628 ?AUTO_1630 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1628 ?AUTO_1630 ?AUTO_1627 ?AUTO_1629 )
      ( DELIVER-PKG ?AUTO_1624 ?AUTO_1625 )
      ( DELIVER-PKG-VERIFY ?AUTO_1624 ?AUTO_1625 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1706 - OBJ
      ?AUTO_1707 - LOCATION
    )
    :vars
    (
      ?AUTO_1709 - LOCATION
      ?AUTO_1710 - AIRPLANE
      ?AUTO_1712 - LOCATION
      ?AUTO_1708 - CITY
      ?AUTO_1711 - TRUCK
      ?AUTO_1713 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_1709 ) ( AIRPORT ?AUTO_1707 ) ( not ( = ?AUTO_1709 ?AUTO_1707 ) ) ( AIRPLANE-AT ?AUTO_1710 ?AUTO_1707 ) ( IN-CITY ?AUTO_1712 ?AUTO_1708 ) ( IN-CITY ?AUTO_1709 ?AUTO_1708 ) ( not ( = ?AUTO_1709 ?AUTO_1712 ) ) ( not ( = ?AUTO_1707 ?AUTO_1712 ) ) ( OBJ-AT ?AUTO_1706 ?AUTO_1712 ) ( TRUCK-AT ?AUTO_1711 ?AUTO_1713 ) ( IN-CITY ?AUTO_1713 ?AUTO_1708 ) ( not ( = ?AUTO_1712 ?AUTO_1713 ) ) ( not ( = ?AUTO_1707 ?AUTO_1713 ) ) ( not ( = ?AUTO_1709 ?AUTO_1713 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1711 ?AUTO_1713 ?AUTO_1712 ?AUTO_1708 )
      ( DELIVER-PKG ?AUTO_1706 ?AUTO_1707 )
      ( DELIVER-PKG-VERIFY ?AUTO_1706 ?AUTO_1707 ) )
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
      ?AUTO_1823 - LOCATION
      ?AUTO_1825 - CITY
      ?AUTO_1826 - LOCATION
      ?AUTO_1822 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1824 ?AUTO_1823 ) ( IN-CITY ?AUTO_1823 ?AUTO_1825 ) ( IN-CITY ?AUTO_1821 ?AUTO_1825 ) ( not ( = ?AUTO_1821 ?AUTO_1823 ) ) ( AIRPORT ?AUTO_1826 ) ( AIRPORT ?AUTO_1823 ) ( not ( = ?AUTO_1826 ?AUTO_1823 ) ) ( not ( = ?AUTO_1821 ?AUTO_1826 ) ) ( OBJ-AT ?AUTO_1820 ?AUTO_1826 ) ( AIRPLANE-AT ?AUTO_1822 ?AUTO_1823 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1822 ?AUTO_1823 ?AUTO_1826 )
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
      ?AUTO_1848 - CITY
      ?AUTO_1845 - LOCATION
      ?AUTO_1847 - AIRPLANE
      ?AUTO_1846 - TRUCK
      ?AUTO_1850 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1849 ?AUTO_1848 ) ( IN-CITY ?AUTO_1844 ?AUTO_1848 ) ( not ( = ?AUTO_1844 ?AUTO_1849 ) ) ( AIRPORT ?AUTO_1845 ) ( AIRPORT ?AUTO_1849 ) ( not ( = ?AUTO_1845 ?AUTO_1849 ) ) ( not ( = ?AUTO_1844 ?AUTO_1845 ) ) ( OBJ-AT ?AUTO_1843 ?AUTO_1845 ) ( AIRPLANE-AT ?AUTO_1847 ?AUTO_1849 ) ( TRUCK-AT ?AUTO_1846 ?AUTO_1850 ) ( IN-CITY ?AUTO_1850 ?AUTO_1848 ) ( not ( = ?AUTO_1849 ?AUTO_1850 ) ) ( not ( = ?AUTO_1844 ?AUTO_1850 ) ) ( not ( = ?AUTO_1845 ?AUTO_1850 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1846 ?AUTO_1850 ?AUTO_1849 ?AUTO_1848 )
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
      ?AUTO_1867 - LOCATION
      ?AUTO_1870 - CITY
      ?AUTO_1868 - LOCATION
      ?AUTO_1869 - AIRPLANE
      ?AUTO_1866 - TRUCK
      ?AUTO_1865 - LOCATION
      ?AUTO_1871 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1867 ?AUTO_1870 ) ( IN-CITY ?AUTO_1864 ?AUTO_1870 ) ( not ( = ?AUTO_1864 ?AUTO_1867 ) ) ( AIRPORT ?AUTO_1868 ) ( AIRPORT ?AUTO_1867 ) ( not ( = ?AUTO_1868 ?AUTO_1867 ) ) ( not ( = ?AUTO_1864 ?AUTO_1868 ) ) ( AIRPLANE-AT ?AUTO_1869 ?AUTO_1867 ) ( TRUCK-AT ?AUTO_1866 ?AUTO_1865 ) ( IN-CITY ?AUTO_1865 ?AUTO_1870 ) ( not ( = ?AUTO_1867 ?AUTO_1865 ) ) ( not ( = ?AUTO_1864 ?AUTO_1865 ) ) ( not ( = ?AUTO_1868 ?AUTO_1865 ) ) ( TRUCK-AT ?AUTO_1871 ?AUTO_1868 ) ( IN-TRUCK ?AUTO_1863 ?AUTO_1871 ) ( not ( = ?AUTO_1866 ?AUTO_1871 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_1863 ?AUTO_1871 ?AUTO_1868 )
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
      ?AUTO_1880 - LOCATION
      ?AUTO_1874 - CITY
      ?AUTO_1879 - LOCATION
      ?AUTO_1878 - AIRPLANE
      ?AUTO_1876 - TRUCK
      ?AUTO_1877 - LOCATION
      ?AUTO_1875 - TRUCK
      ?AUTO_1882 - LOCATION
      ?AUTO_1881 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1880 ?AUTO_1874 ) ( IN-CITY ?AUTO_1873 ?AUTO_1874 ) ( not ( = ?AUTO_1873 ?AUTO_1880 ) ) ( AIRPORT ?AUTO_1879 ) ( AIRPORT ?AUTO_1880 ) ( not ( = ?AUTO_1879 ?AUTO_1880 ) ) ( not ( = ?AUTO_1873 ?AUTO_1879 ) ) ( AIRPLANE-AT ?AUTO_1878 ?AUTO_1880 ) ( TRUCK-AT ?AUTO_1876 ?AUTO_1877 ) ( IN-CITY ?AUTO_1877 ?AUTO_1874 ) ( not ( = ?AUTO_1880 ?AUTO_1877 ) ) ( not ( = ?AUTO_1873 ?AUTO_1877 ) ) ( not ( = ?AUTO_1879 ?AUTO_1877 ) ) ( IN-TRUCK ?AUTO_1872 ?AUTO_1875 ) ( not ( = ?AUTO_1876 ?AUTO_1875 ) ) ( TRUCK-AT ?AUTO_1875 ?AUTO_1882 ) ( IN-CITY ?AUTO_1882 ?AUTO_1881 ) ( IN-CITY ?AUTO_1879 ?AUTO_1881 ) ( not ( = ?AUTO_1879 ?AUTO_1882 ) ) ( not ( = ?AUTO_1873 ?AUTO_1882 ) ) ( not ( = ?AUTO_1880 ?AUTO_1882 ) ) ( not ( = ?AUTO_1874 ?AUTO_1881 ) ) ( not ( = ?AUTO_1877 ?AUTO_1882 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1875 ?AUTO_1882 ?AUTO_1879 ?AUTO_1881 )
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
      ?AUTO_1889 - CITY
      ?AUTO_1893 - LOCATION
      ?AUTO_1897 - AIRPLANE
      ?AUTO_1896 - TRUCK
      ?AUTO_1890 - LOCATION
      ?AUTO_1894 - TRUCK
      ?AUTO_1895 - LOCATION
      ?AUTO_1892 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1891 ?AUTO_1889 ) ( IN-CITY ?AUTO_1888 ?AUTO_1889 ) ( not ( = ?AUTO_1888 ?AUTO_1891 ) ) ( AIRPORT ?AUTO_1893 ) ( AIRPORT ?AUTO_1891 ) ( not ( = ?AUTO_1893 ?AUTO_1891 ) ) ( not ( = ?AUTO_1888 ?AUTO_1893 ) ) ( AIRPLANE-AT ?AUTO_1897 ?AUTO_1891 ) ( TRUCK-AT ?AUTO_1896 ?AUTO_1890 ) ( IN-CITY ?AUTO_1890 ?AUTO_1889 ) ( not ( = ?AUTO_1891 ?AUTO_1890 ) ) ( not ( = ?AUTO_1888 ?AUTO_1890 ) ) ( not ( = ?AUTO_1893 ?AUTO_1890 ) ) ( not ( = ?AUTO_1896 ?AUTO_1894 ) ) ( TRUCK-AT ?AUTO_1894 ?AUTO_1895 ) ( IN-CITY ?AUTO_1895 ?AUTO_1892 ) ( IN-CITY ?AUTO_1893 ?AUTO_1892 ) ( not ( = ?AUTO_1893 ?AUTO_1895 ) ) ( not ( = ?AUTO_1888 ?AUTO_1895 ) ) ( not ( = ?AUTO_1891 ?AUTO_1895 ) ) ( not ( = ?AUTO_1889 ?AUTO_1892 ) ) ( not ( = ?AUTO_1890 ?AUTO_1895 ) ) ( OBJ-AT ?AUTO_1887 ?AUTO_1895 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_1887 ?AUTO_1894 ?AUTO_1895 )
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
      ?AUTO_1907 - LOCATION
      ?AUTO_1906 - CITY
      ?AUTO_1901 - LOCATION
      ?AUTO_1903 - AIRPLANE
      ?AUTO_1902 - TRUCK
      ?AUTO_1905 - LOCATION
      ?AUTO_1900 - TRUCK
      ?AUTO_1904 - LOCATION
      ?AUTO_1908 - CITY
      ?AUTO_1909 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1907 ?AUTO_1906 ) ( IN-CITY ?AUTO_1899 ?AUTO_1906 ) ( not ( = ?AUTO_1899 ?AUTO_1907 ) ) ( AIRPORT ?AUTO_1901 ) ( AIRPORT ?AUTO_1907 ) ( not ( = ?AUTO_1901 ?AUTO_1907 ) ) ( not ( = ?AUTO_1899 ?AUTO_1901 ) ) ( AIRPLANE-AT ?AUTO_1903 ?AUTO_1907 ) ( TRUCK-AT ?AUTO_1902 ?AUTO_1905 ) ( IN-CITY ?AUTO_1905 ?AUTO_1906 ) ( not ( = ?AUTO_1907 ?AUTO_1905 ) ) ( not ( = ?AUTO_1899 ?AUTO_1905 ) ) ( not ( = ?AUTO_1901 ?AUTO_1905 ) ) ( not ( = ?AUTO_1902 ?AUTO_1900 ) ) ( IN-CITY ?AUTO_1904 ?AUTO_1908 ) ( IN-CITY ?AUTO_1901 ?AUTO_1908 ) ( not ( = ?AUTO_1901 ?AUTO_1904 ) ) ( not ( = ?AUTO_1899 ?AUTO_1904 ) ) ( not ( = ?AUTO_1907 ?AUTO_1904 ) ) ( not ( = ?AUTO_1906 ?AUTO_1908 ) ) ( not ( = ?AUTO_1905 ?AUTO_1904 ) ) ( OBJ-AT ?AUTO_1898 ?AUTO_1904 ) ( TRUCK-AT ?AUTO_1900 ?AUTO_1909 ) ( IN-CITY ?AUTO_1909 ?AUTO_1908 ) ( not ( = ?AUTO_1904 ?AUTO_1909 ) ) ( not ( = ?AUTO_1899 ?AUTO_1909 ) ) ( not ( = ?AUTO_1907 ?AUTO_1909 ) ) ( not ( = ?AUTO_1901 ?AUTO_1909 ) ) ( not ( = ?AUTO_1905 ?AUTO_1909 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1900 ?AUTO_1909 ?AUTO_1904 ?AUTO_1908 )
      ( DELIVER-PKG ?AUTO_1898 ?AUTO_1899 )
      ( DELIVER-PKG-VERIFY ?AUTO_1898 ?AUTO_1899 ) )
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
      ?AUTO_1987 - CITY
      ?AUTO_1989 - LOCATION
      ?AUTO_1986 - AIRPLANE
      ?AUTO_1988 - TRUCK
      ?AUTO_1990 - LOCATION
      ?AUTO_1991 - TRUCK
      ?AUTO_1992 - LOCATION
      ?AUTO_1993 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1994 ?AUTO_1987 ) ( IN-CITY ?AUTO_1985 ?AUTO_1987 ) ( not ( = ?AUTO_1985 ?AUTO_1994 ) ) ( AIRPORT ?AUTO_1989 ) ( AIRPORT ?AUTO_1994 ) ( not ( = ?AUTO_1989 ?AUTO_1994 ) ) ( not ( = ?AUTO_1985 ?AUTO_1989 ) ) ( AIRPLANE-AT ?AUTO_1986 ?AUTO_1994 ) ( TRUCK-AT ?AUTO_1988 ?AUTO_1990 ) ( IN-CITY ?AUTO_1990 ?AUTO_1987 ) ( not ( = ?AUTO_1994 ?AUTO_1990 ) ) ( not ( = ?AUTO_1985 ?AUTO_1990 ) ) ( not ( = ?AUTO_1989 ?AUTO_1990 ) ) ( not ( = ?AUTO_1988 ?AUTO_1991 ) ) ( IN-CITY ?AUTO_1992 ?AUTO_1993 ) ( IN-CITY ?AUTO_1989 ?AUTO_1993 ) ( not ( = ?AUTO_1989 ?AUTO_1992 ) ) ( not ( = ?AUTO_1985 ?AUTO_1992 ) ) ( not ( = ?AUTO_1994 ?AUTO_1992 ) ) ( not ( = ?AUTO_1987 ?AUTO_1993 ) ) ( not ( = ?AUTO_1990 ?AUTO_1992 ) ) ( OBJ-AT ?AUTO_1984 ?AUTO_1992 ) ( TRUCK-AT ?AUTO_1991 ?AUTO_1989 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_1991 ?AUTO_1989 ?AUTO_1992 ?AUTO_1993 )
      ( DELIVER-PKG ?AUTO_1984 ?AUTO_1985 )
      ( DELIVER-PKG-VERIFY ?AUTO_1984 ?AUTO_1985 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2071 - OBJ
      ?AUTO_2072 - LOCATION
    )
    :vars
    (
      ?AUTO_2077 - LOCATION
      ?AUTO_2073 - CITY
      ?AUTO_2076 - LOCATION
      ?AUTO_2075 - AIRPLANE
      ?AUTO_2074 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2077 ?AUTO_2073 ) ( IN-CITY ?AUTO_2072 ?AUTO_2073 ) ( not ( = ?AUTO_2072 ?AUTO_2077 ) ) ( AIRPORT ?AUTO_2076 ) ( AIRPORT ?AUTO_2077 ) ( not ( = ?AUTO_2076 ?AUTO_2077 ) ) ( not ( = ?AUTO_2072 ?AUTO_2076 ) ) ( OBJ-AT ?AUTO_2071 ?AUTO_2076 ) ( AIRPLANE-AT ?AUTO_2075 ?AUTO_2077 ) ( TRUCK-AT ?AUTO_2074 ?AUTO_2072 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2074 ?AUTO_2072 ?AUTO_2077 ?AUTO_2073 )
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
      ?AUTO_2092 - LOCATION
      ?AUTO_2090 - AIRPLANE
      ?AUTO_2093 - TRUCK
      ?AUTO_2095 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2091 ?AUTO_2094 ) ( IN-CITY ?AUTO_2089 ?AUTO_2094 ) ( not ( = ?AUTO_2089 ?AUTO_2091 ) ) ( AIRPORT ?AUTO_2092 ) ( AIRPORT ?AUTO_2091 ) ( not ( = ?AUTO_2092 ?AUTO_2091 ) ) ( not ( = ?AUTO_2089 ?AUTO_2092 ) ) ( AIRPLANE-AT ?AUTO_2090 ?AUTO_2091 ) ( TRUCK-AT ?AUTO_2093 ?AUTO_2089 ) ( TRUCK-AT ?AUTO_2095 ?AUTO_2092 ) ( IN-TRUCK ?AUTO_2088 ?AUTO_2095 ) ( not ( = ?AUTO_2093 ?AUTO_2095 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2088 ?AUTO_2095 ?AUTO_2092 )
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
      ?AUTO_2101 - LOCATION
      ?AUTO_2103 - CITY
      ?AUTO_2102 - LOCATION
      ?AUTO_2104 - AIRPLANE
      ?AUTO_2100 - TRUCK
      ?AUTO_2105 - TRUCK
      ?AUTO_2107 - LOCATION
      ?AUTO_2106 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2101 ?AUTO_2103 ) ( IN-CITY ?AUTO_2099 ?AUTO_2103 ) ( not ( = ?AUTO_2099 ?AUTO_2101 ) ) ( AIRPORT ?AUTO_2102 ) ( AIRPORT ?AUTO_2101 ) ( not ( = ?AUTO_2102 ?AUTO_2101 ) ) ( not ( = ?AUTO_2099 ?AUTO_2102 ) ) ( AIRPLANE-AT ?AUTO_2104 ?AUTO_2101 ) ( TRUCK-AT ?AUTO_2100 ?AUTO_2099 ) ( IN-TRUCK ?AUTO_2098 ?AUTO_2105 ) ( not ( = ?AUTO_2100 ?AUTO_2105 ) ) ( TRUCK-AT ?AUTO_2105 ?AUTO_2107 ) ( IN-CITY ?AUTO_2107 ?AUTO_2106 ) ( IN-CITY ?AUTO_2102 ?AUTO_2106 ) ( not ( = ?AUTO_2102 ?AUTO_2107 ) ) ( not ( = ?AUTO_2099 ?AUTO_2107 ) ) ( not ( = ?AUTO_2101 ?AUTO_2107 ) ) ( not ( = ?AUTO_2103 ?AUTO_2106 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2105 ?AUTO_2107 ?AUTO_2102 ?AUTO_2106 )
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
      ?AUTO_2114 - LOCATION
      ?AUTO_2111 - CITY
      ?AUTO_2116 - LOCATION
      ?AUTO_2112 - AIRPLANE
      ?AUTO_2115 - TRUCK
      ?AUTO_2110 - TRUCK
      ?AUTO_2117 - LOCATION
      ?AUTO_2113 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2114 ?AUTO_2111 ) ( IN-CITY ?AUTO_2109 ?AUTO_2111 ) ( not ( = ?AUTO_2109 ?AUTO_2114 ) ) ( AIRPORT ?AUTO_2116 ) ( AIRPORT ?AUTO_2114 ) ( not ( = ?AUTO_2116 ?AUTO_2114 ) ) ( not ( = ?AUTO_2109 ?AUTO_2116 ) ) ( AIRPLANE-AT ?AUTO_2112 ?AUTO_2114 ) ( TRUCK-AT ?AUTO_2115 ?AUTO_2109 ) ( not ( = ?AUTO_2115 ?AUTO_2110 ) ) ( TRUCK-AT ?AUTO_2110 ?AUTO_2117 ) ( IN-CITY ?AUTO_2117 ?AUTO_2113 ) ( IN-CITY ?AUTO_2116 ?AUTO_2113 ) ( not ( = ?AUTO_2116 ?AUTO_2117 ) ) ( not ( = ?AUTO_2109 ?AUTO_2117 ) ) ( not ( = ?AUTO_2114 ?AUTO_2117 ) ) ( not ( = ?AUTO_2111 ?AUTO_2113 ) ) ( OBJ-AT ?AUTO_2108 ?AUTO_2117 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2108 ?AUTO_2110 ?AUTO_2117 )
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
      ?AUTO_2124 - LOCATION
      ?AUTO_2121 - CITY
      ?AUTO_2126 - LOCATION
      ?AUTO_2123 - AIRPLANE
      ?AUTO_2122 - TRUCK
      ?AUTO_2120 - TRUCK
      ?AUTO_2125 - LOCATION
      ?AUTO_2127 - CITY
      ?AUTO_2128 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2124 ?AUTO_2121 ) ( IN-CITY ?AUTO_2119 ?AUTO_2121 ) ( not ( = ?AUTO_2119 ?AUTO_2124 ) ) ( AIRPORT ?AUTO_2126 ) ( AIRPORT ?AUTO_2124 ) ( not ( = ?AUTO_2126 ?AUTO_2124 ) ) ( not ( = ?AUTO_2119 ?AUTO_2126 ) ) ( AIRPLANE-AT ?AUTO_2123 ?AUTO_2124 ) ( TRUCK-AT ?AUTO_2122 ?AUTO_2119 ) ( not ( = ?AUTO_2122 ?AUTO_2120 ) ) ( IN-CITY ?AUTO_2125 ?AUTO_2127 ) ( IN-CITY ?AUTO_2126 ?AUTO_2127 ) ( not ( = ?AUTO_2126 ?AUTO_2125 ) ) ( not ( = ?AUTO_2119 ?AUTO_2125 ) ) ( not ( = ?AUTO_2124 ?AUTO_2125 ) ) ( not ( = ?AUTO_2121 ?AUTO_2127 ) ) ( OBJ-AT ?AUTO_2118 ?AUTO_2125 ) ( TRUCK-AT ?AUTO_2120 ?AUTO_2128 ) ( IN-CITY ?AUTO_2128 ?AUTO_2127 ) ( not ( = ?AUTO_2125 ?AUTO_2128 ) ) ( not ( = ?AUTO_2119 ?AUTO_2128 ) ) ( not ( = ?AUTO_2124 ?AUTO_2128 ) ) ( not ( = ?AUTO_2126 ?AUTO_2128 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2120 ?AUTO_2128 ?AUTO_2125 ?AUTO_2127 )
      ( DELIVER-PKG ?AUTO_2118 ?AUTO_2119 )
      ( DELIVER-PKG-VERIFY ?AUTO_2118 ?AUTO_2119 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2249 - OBJ
      ?AUTO_2250 - LOCATION
    )
    :vars
    (
      ?AUTO_2251 - TRUCK
      ?AUTO_2256 - LOCATION
      ?AUTO_2253 - CITY
      ?AUTO_2254 - LOCATION
      ?AUTO_2255 - LOCATION
      ?AUTO_2252 - AIRPLANE
      ?AUTO_2257 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2251 ?AUTO_2256 ) ( IN-CITY ?AUTO_2256 ?AUTO_2253 ) ( IN-CITY ?AUTO_2250 ?AUTO_2253 ) ( not ( = ?AUTO_2250 ?AUTO_2256 ) ) ( AIRPORT ?AUTO_2254 ) ( AIRPORT ?AUTO_2256 ) ( not ( = ?AUTO_2254 ?AUTO_2256 ) ) ( not ( = ?AUTO_2250 ?AUTO_2254 ) ) ( AIRPORT ?AUTO_2255 ) ( AIRPLANE-AT ?AUTO_2252 ?AUTO_2255 ) ( not ( = ?AUTO_2255 ?AUTO_2254 ) ) ( not ( = ?AUTO_2250 ?AUTO_2255 ) ) ( not ( = ?AUTO_2256 ?AUTO_2255 ) ) ( TRUCK-AT ?AUTO_2257 ?AUTO_2254 ) ( IN-TRUCK ?AUTO_2249 ?AUTO_2257 ) ( not ( = ?AUTO_2251 ?AUTO_2257 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2249 ?AUTO_2257 ?AUTO_2254 )
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
      ?AUTO_2261 - TRUCK
      ?AUTO_2262 - LOCATION
      ?AUTO_2264 - CITY
      ?AUTO_2263 - LOCATION
      ?AUTO_2265 - LOCATION
      ?AUTO_2260 - AIRPLANE
      ?AUTO_2266 - TRUCK
      ?AUTO_2268 - LOCATION
      ?AUTO_2267 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2261 ?AUTO_2262 ) ( IN-CITY ?AUTO_2262 ?AUTO_2264 ) ( IN-CITY ?AUTO_2259 ?AUTO_2264 ) ( not ( = ?AUTO_2259 ?AUTO_2262 ) ) ( AIRPORT ?AUTO_2263 ) ( AIRPORT ?AUTO_2262 ) ( not ( = ?AUTO_2263 ?AUTO_2262 ) ) ( not ( = ?AUTO_2259 ?AUTO_2263 ) ) ( AIRPORT ?AUTO_2265 ) ( AIRPLANE-AT ?AUTO_2260 ?AUTO_2265 ) ( not ( = ?AUTO_2265 ?AUTO_2263 ) ) ( not ( = ?AUTO_2259 ?AUTO_2265 ) ) ( not ( = ?AUTO_2262 ?AUTO_2265 ) ) ( IN-TRUCK ?AUTO_2258 ?AUTO_2266 ) ( not ( = ?AUTO_2261 ?AUTO_2266 ) ) ( TRUCK-AT ?AUTO_2266 ?AUTO_2268 ) ( IN-CITY ?AUTO_2268 ?AUTO_2267 ) ( IN-CITY ?AUTO_2263 ?AUTO_2267 ) ( not ( = ?AUTO_2263 ?AUTO_2268 ) ) ( not ( = ?AUTO_2259 ?AUTO_2268 ) ) ( not ( = ?AUTO_2262 ?AUTO_2268 ) ) ( not ( = ?AUTO_2264 ?AUTO_2267 ) ) ( not ( = ?AUTO_2265 ?AUTO_2268 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2266 ?AUTO_2268 ?AUTO_2263 ?AUTO_2267 )
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
      ?AUTO_2277 - TRUCK
      ?AUTO_2278 - LOCATION
      ?AUTO_2272 - CITY
      ?AUTO_2273 - LOCATION
      ?AUTO_2274 - LOCATION
      ?AUTO_2276 - AIRPLANE
      ?AUTO_2275 - TRUCK
      ?AUTO_2279 - LOCATION
      ?AUTO_2271 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2277 ?AUTO_2278 ) ( IN-CITY ?AUTO_2278 ?AUTO_2272 ) ( IN-CITY ?AUTO_2270 ?AUTO_2272 ) ( not ( = ?AUTO_2270 ?AUTO_2278 ) ) ( AIRPORT ?AUTO_2273 ) ( AIRPORT ?AUTO_2278 ) ( not ( = ?AUTO_2273 ?AUTO_2278 ) ) ( not ( = ?AUTO_2270 ?AUTO_2273 ) ) ( AIRPORT ?AUTO_2274 ) ( AIRPLANE-AT ?AUTO_2276 ?AUTO_2274 ) ( not ( = ?AUTO_2274 ?AUTO_2273 ) ) ( not ( = ?AUTO_2270 ?AUTO_2274 ) ) ( not ( = ?AUTO_2278 ?AUTO_2274 ) ) ( not ( = ?AUTO_2277 ?AUTO_2275 ) ) ( TRUCK-AT ?AUTO_2275 ?AUTO_2279 ) ( IN-CITY ?AUTO_2279 ?AUTO_2271 ) ( IN-CITY ?AUTO_2273 ?AUTO_2271 ) ( not ( = ?AUTO_2273 ?AUTO_2279 ) ) ( not ( = ?AUTO_2270 ?AUTO_2279 ) ) ( not ( = ?AUTO_2278 ?AUTO_2279 ) ) ( not ( = ?AUTO_2272 ?AUTO_2271 ) ) ( not ( = ?AUTO_2274 ?AUTO_2279 ) ) ( OBJ-AT ?AUTO_2269 ?AUTO_2279 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2269 ?AUTO_2275 ?AUTO_2279 )
      ( DELIVER-PKG ?AUTO_2269 ?AUTO_2270 )
      ( DELIVER-PKG-VERIFY ?AUTO_2269 ?AUTO_2270 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2644 - OBJ
      ?AUTO_2645 - LOCATION
    )
    :vars
    (
      ?AUTO_2650 - LOCATION
      ?AUTO_2646 - TRUCK
      ?AUTO_2651 - LOCATION
      ?AUTO_2647 - CITY
      ?AUTO_2649 - LOCATION
      ?AUTO_2648 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_2650 ) ( AIRPORT ?AUTO_2645 ) ( not ( = ?AUTO_2650 ?AUTO_2645 ) ) ( IN-TRUCK ?AUTO_2644 ?AUTO_2646 ) ( TRUCK-AT ?AUTO_2646 ?AUTO_2651 ) ( IN-CITY ?AUTO_2651 ?AUTO_2647 ) ( IN-CITY ?AUTO_2650 ?AUTO_2647 ) ( not ( = ?AUTO_2650 ?AUTO_2651 ) ) ( not ( = ?AUTO_2645 ?AUTO_2651 ) ) ( AIRPORT ?AUTO_2649 ) ( not ( = ?AUTO_2649 ?AUTO_2650 ) ) ( not ( = ?AUTO_2645 ?AUTO_2649 ) ) ( not ( = ?AUTO_2651 ?AUTO_2649 ) ) ( AIRPLANE-AT ?AUTO_2648 ?AUTO_2645 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2648 ?AUTO_2645 ?AUTO_2649 )
      ( DELIVER-PKG ?AUTO_2644 ?AUTO_2645 )
      ( DELIVER-PKG-VERIFY ?AUTO_2644 ?AUTO_2645 ) )
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
      ?AUTO_2764 - CITY
      ?AUTO_2763 - LOCATION
      ?AUTO_2765 - LOCATION
      ?AUTO_2762 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2761 ?AUTO_2760 ) ( IN-CITY ?AUTO_2760 ?AUTO_2764 ) ( IN-CITY ?AUTO_2759 ?AUTO_2764 ) ( not ( = ?AUTO_2759 ?AUTO_2760 ) ) ( AIRPORT ?AUTO_2763 ) ( AIRPORT ?AUTO_2760 ) ( not ( = ?AUTO_2763 ?AUTO_2760 ) ) ( not ( = ?AUTO_2759 ?AUTO_2763 ) ) ( OBJ-AT ?AUTO_2758 ?AUTO_2763 ) ( AIRPORT ?AUTO_2765 ) ( AIRPLANE-AT ?AUTO_2762 ?AUTO_2765 ) ( not ( = ?AUTO_2765 ?AUTO_2760 ) ) ( not ( = ?AUTO_2759 ?AUTO_2765 ) ) ( not ( = ?AUTO_2763 ?AUTO_2765 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_2762 ?AUTO_2765 ?AUTO_2760 )
      ( DELIVER-PKG ?AUTO_2758 ?AUTO_2759 )
      ( DELIVER-PKG-VERIFY ?AUTO_2758 ?AUTO_2759 ) )
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
      ?AUTO_3041 - CITY
      ?AUTO_3040 - AIRPLANE
      ?AUTO_3042 - TRUCK
      ?AUTO_3044 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3043 ?AUTO_3041 ) ( IN-CITY ?AUTO_3039 ?AUTO_3041 ) ( not ( = ?AUTO_3039 ?AUTO_3043 ) ) ( IN-AIRPLANE ?AUTO_3038 ?AUTO_3040 ) ( AIRPLANE-AT ?AUTO_3040 ?AUTO_3043 ) ( TRUCK-AT ?AUTO_3042 ?AUTO_3044 ) ( IN-CITY ?AUTO_3044 ?AUTO_3041 ) ( not ( = ?AUTO_3043 ?AUTO_3044 ) ) ( not ( = ?AUTO_3039 ?AUTO_3044 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3042 ?AUTO_3044 ?AUTO_3043 ?AUTO_3041 )
      ( DELIVER-PKG ?AUTO_3038 ?AUTO_3039 )
      ( DELIVER-PKG-VERIFY ?AUTO_3038 ?AUTO_3039 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3076 - OBJ
      ?AUTO_3077 - LOCATION
    )
    :vars
    (
      ?AUTO_3082 - LOCATION
      ?AUTO_3079 - CITY
      ?AUTO_3081 - TRUCK
      ?AUTO_3078 - LOCATION
      ?AUTO_3083 - LOCATION
      ?AUTO_3084 - LOCATION
      ?AUTO_3080 - AIRPLANE
      ?AUTO_3085 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3082 ?AUTO_3079 ) ( IN-CITY ?AUTO_3077 ?AUTO_3079 ) ( not ( = ?AUTO_3077 ?AUTO_3082 ) ) ( TRUCK-AT ?AUTO_3081 ?AUTO_3078 ) ( IN-CITY ?AUTO_3078 ?AUTO_3079 ) ( not ( = ?AUTO_3082 ?AUTO_3078 ) ) ( not ( = ?AUTO_3077 ?AUTO_3078 ) ) ( AIRPORT ?AUTO_3083 ) ( AIRPORT ?AUTO_3082 ) ( not ( = ?AUTO_3083 ?AUTO_3082 ) ) ( not ( = ?AUTO_3077 ?AUTO_3083 ) ) ( not ( = ?AUTO_3078 ?AUTO_3083 ) ) ( AIRPORT ?AUTO_3084 ) ( AIRPLANE-AT ?AUTO_3080 ?AUTO_3084 ) ( not ( = ?AUTO_3084 ?AUTO_3083 ) ) ( not ( = ?AUTO_3077 ?AUTO_3084 ) ) ( not ( = ?AUTO_3082 ?AUTO_3084 ) ) ( not ( = ?AUTO_3078 ?AUTO_3084 ) ) ( TRUCK-AT ?AUTO_3085 ?AUTO_3083 ) ( IN-TRUCK ?AUTO_3076 ?AUTO_3085 ) ( not ( = ?AUTO_3081 ?AUTO_3085 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3076 ?AUTO_3085 ?AUTO_3083 )
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
      ?AUTO_3096 - LOCATION
      ?AUTO_3094 - CITY
      ?AUTO_3093 - TRUCK
      ?AUTO_3091 - LOCATION
      ?AUTO_3095 - LOCATION
      ?AUTO_3090 - LOCATION
      ?AUTO_3097 - AIRPLANE
      ?AUTO_3092 - TRUCK
      ?AUTO_3099 - LOCATION
      ?AUTO_3098 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3096 ?AUTO_3094 ) ( IN-CITY ?AUTO_3089 ?AUTO_3094 ) ( not ( = ?AUTO_3089 ?AUTO_3096 ) ) ( TRUCK-AT ?AUTO_3093 ?AUTO_3091 ) ( IN-CITY ?AUTO_3091 ?AUTO_3094 ) ( not ( = ?AUTO_3096 ?AUTO_3091 ) ) ( not ( = ?AUTO_3089 ?AUTO_3091 ) ) ( AIRPORT ?AUTO_3095 ) ( AIRPORT ?AUTO_3096 ) ( not ( = ?AUTO_3095 ?AUTO_3096 ) ) ( not ( = ?AUTO_3089 ?AUTO_3095 ) ) ( not ( = ?AUTO_3091 ?AUTO_3095 ) ) ( AIRPORT ?AUTO_3090 ) ( AIRPLANE-AT ?AUTO_3097 ?AUTO_3090 ) ( not ( = ?AUTO_3090 ?AUTO_3095 ) ) ( not ( = ?AUTO_3089 ?AUTO_3090 ) ) ( not ( = ?AUTO_3096 ?AUTO_3090 ) ) ( not ( = ?AUTO_3091 ?AUTO_3090 ) ) ( IN-TRUCK ?AUTO_3088 ?AUTO_3092 ) ( not ( = ?AUTO_3093 ?AUTO_3092 ) ) ( TRUCK-AT ?AUTO_3092 ?AUTO_3099 ) ( IN-CITY ?AUTO_3099 ?AUTO_3098 ) ( IN-CITY ?AUTO_3095 ?AUTO_3098 ) ( not ( = ?AUTO_3095 ?AUTO_3099 ) ) ( not ( = ?AUTO_3089 ?AUTO_3099 ) ) ( not ( = ?AUTO_3096 ?AUTO_3099 ) ) ( not ( = ?AUTO_3094 ?AUTO_3098 ) ) ( not ( = ?AUTO_3091 ?AUTO_3099 ) ) ( not ( = ?AUTO_3090 ?AUTO_3099 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3092 ?AUTO_3099 ?AUTO_3095 ?AUTO_3098 )
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
      ?AUTO_3102 - LOCATION
      ?AUTO_3110 - CITY
      ?AUTO_3103 - TRUCK
      ?AUTO_3105 - LOCATION
      ?AUTO_3109 - LOCATION
      ?AUTO_3106 - LOCATION
      ?AUTO_3107 - AIRPLANE
      ?AUTO_3111 - TRUCK
      ?AUTO_3104 - LOCATION
      ?AUTO_3108 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3102 ?AUTO_3110 ) ( IN-CITY ?AUTO_3101 ?AUTO_3110 ) ( not ( = ?AUTO_3101 ?AUTO_3102 ) ) ( TRUCK-AT ?AUTO_3103 ?AUTO_3105 ) ( IN-CITY ?AUTO_3105 ?AUTO_3110 ) ( not ( = ?AUTO_3102 ?AUTO_3105 ) ) ( not ( = ?AUTO_3101 ?AUTO_3105 ) ) ( AIRPORT ?AUTO_3109 ) ( AIRPORT ?AUTO_3102 ) ( not ( = ?AUTO_3109 ?AUTO_3102 ) ) ( not ( = ?AUTO_3101 ?AUTO_3109 ) ) ( not ( = ?AUTO_3105 ?AUTO_3109 ) ) ( AIRPORT ?AUTO_3106 ) ( AIRPLANE-AT ?AUTO_3107 ?AUTO_3106 ) ( not ( = ?AUTO_3106 ?AUTO_3109 ) ) ( not ( = ?AUTO_3101 ?AUTO_3106 ) ) ( not ( = ?AUTO_3102 ?AUTO_3106 ) ) ( not ( = ?AUTO_3105 ?AUTO_3106 ) ) ( not ( = ?AUTO_3103 ?AUTO_3111 ) ) ( TRUCK-AT ?AUTO_3111 ?AUTO_3104 ) ( IN-CITY ?AUTO_3104 ?AUTO_3108 ) ( IN-CITY ?AUTO_3109 ?AUTO_3108 ) ( not ( = ?AUTO_3109 ?AUTO_3104 ) ) ( not ( = ?AUTO_3101 ?AUTO_3104 ) ) ( not ( = ?AUTO_3102 ?AUTO_3104 ) ) ( not ( = ?AUTO_3110 ?AUTO_3108 ) ) ( not ( = ?AUTO_3105 ?AUTO_3104 ) ) ( not ( = ?AUTO_3106 ?AUTO_3104 ) ) ( OBJ-AT ?AUTO_3100 ?AUTO_3104 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_3100 ?AUTO_3111 ?AUTO_3104 )
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
      ?AUTO_3117 - LOCATION
      ?AUTO_3122 - CITY
      ?AUTO_3121 - TRUCK
      ?AUTO_3120 - LOCATION
      ?AUTO_3115 - LOCATION
      ?AUTO_3119 - LOCATION
      ?AUTO_3118 - AIRPLANE
      ?AUTO_3123 - TRUCK
      ?AUTO_3114 - LOCATION
      ?AUTO_3116 - CITY
      ?AUTO_3124 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3117 ?AUTO_3122 ) ( IN-CITY ?AUTO_3113 ?AUTO_3122 ) ( not ( = ?AUTO_3113 ?AUTO_3117 ) ) ( TRUCK-AT ?AUTO_3121 ?AUTO_3120 ) ( IN-CITY ?AUTO_3120 ?AUTO_3122 ) ( not ( = ?AUTO_3117 ?AUTO_3120 ) ) ( not ( = ?AUTO_3113 ?AUTO_3120 ) ) ( AIRPORT ?AUTO_3115 ) ( AIRPORT ?AUTO_3117 ) ( not ( = ?AUTO_3115 ?AUTO_3117 ) ) ( not ( = ?AUTO_3113 ?AUTO_3115 ) ) ( not ( = ?AUTO_3120 ?AUTO_3115 ) ) ( AIRPORT ?AUTO_3119 ) ( AIRPLANE-AT ?AUTO_3118 ?AUTO_3119 ) ( not ( = ?AUTO_3119 ?AUTO_3115 ) ) ( not ( = ?AUTO_3113 ?AUTO_3119 ) ) ( not ( = ?AUTO_3117 ?AUTO_3119 ) ) ( not ( = ?AUTO_3120 ?AUTO_3119 ) ) ( not ( = ?AUTO_3121 ?AUTO_3123 ) ) ( IN-CITY ?AUTO_3114 ?AUTO_3116 ) ( IN-CITY ?AUTO_3115 ?AUTO_3116 ) ( not ( = ?AUTO_3115 ?AUTO_3114 ) ) ( not ( = ?AUTO_3113 ?AUTO_3114 ) ) ( not ( = ?AUTO_3117 ?AUTO_3114 ) ) ( not ( = ?AUTO_3122 ?AUTO_3116 ) ) ( not ( = ?AUTO_3120 ?AUTO_3114 ) ) ( not ( = ?AUTO_3119 ?AUTO_3114 ) ) ( OBJ-AT ?AUTO_3112 ?AUTO_3114 ) ( TRUCK-AT ?AUTO_3123 ?AUTO_3124 ) ( IN-CITY ?AUTO_3124 ?AUTO_3116 ) ( not ( = ?AUTO_3114 ?AUTO_3124 ) ) ( not ( = ?AUTO_3113 ?AUTO_3124 ) ) ( not ( = ?AUTO_3117 ?AUTO_3124 ) ) ( not ( = ?AUTO_3120 ?AUTO_3124 ) ) ( not ( = ?AUTO_3115 ?AUTO_3124 ) ) ( not ( = ?AUTO_3119 ?AUTO_3124 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3123 ?AUTO_3124 ?AUTO_3114 ?AUTO_3116 )
      ( DELIVER-PKG ?AUTO_3112 ?AUTO_3113 )
      ( DELIVER-PKG-VERIFY ?AUTO_3112 ?AUTO_3113 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3311 - OBJ
      ?AUTO_3312 - LOCATION
    )
    :vars
    (
      ?AUTO_3314 - TRUCK
      ?AUTO_3315 - LOCATION
      ?AUTO_3313 - CITY
      ?AUTO_3317 - LOCATION
      ?AUTO_3316 - AIRPLANE
      ?AUTO_3318 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3314 ?AUTO_3315 ) ( IN-CITY ?AUTO_3315 ?AUTO_3313 ) ( IN-CITY ?AUTO_3312 ?AUTO_3313 ) ( not ( = ?AUTO_3312 ?AUTO_3315 ) ) ( AIRPORT ?AUTO_3317 ) ( AIRPORT ?AUTO_3315 ) ( AIRPLANE-AT ?AUTO_3316 ?AUTO_3317 ) ( not ( = ?AUTO_3317 ?AUTO_3315 ) ) ( not ( = ?AUTO_3312 ?AUTO_3317 ) ) ( TRUCK-AT ?AUTO_3318 ?AUTO_3317 ) ( IN-TRUCK ?AUTO_3311 ?AUTO_3318 ) ( not ( = ?AUTO_3314 ?AUTO_3318 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_3311 ?AUTO_3318 ?AUTO_3317 )
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
      ?AUTO_3324 - TRUCK
      ?AUTO_3323 - LOCATION
      ?AUTO_3322 - CITY
      ?AUTO_3325 - LOCATION
      ?AUTO_3321 - AIRPLANE
      ?AUTO_3326 - TRUCK
      ?AUTO_3328 - LOCATION
      ?AUTO_3327 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3324 ?AUTO_3323 ) ( IN-CITY ?AUTO_3323 ?AUTO_3322 ) ( IN-CITY ?AUTO_3320 ?AUTO_3322 ) ( not ( = ?AUTO_3320 ?AUTO_3323 ) ) ( AIRPORT ?AUTO_3325 ) ( AIRPORT ?AUTO_3323 ) ( AIRPLANE-AT ?AUTO_3321 ?AUTO_3325 ) ( not ( = ?AUTO_3325 ?AUTO_3323 ) ) ( not ( = ?AUTO_3320 ?AUTO_3325 ) ) ( IN-TRUCK ?AUTO_3319 ?AUTO_3326 ) ( not ( = ?AUTO_3324 ?AUTO_3326 ) ) ( TRUCK-AT ?AUTO_3326 ?AUTO_3328 ) ( IN-CITY ?AUTO_3328 ?AUTO_3327 ) ( IN-CITY ?AUTO_3325 ?AUTO_3327 ) ( not ( = ?AUTO_3325 ?AUTO_3328 ) ) ( not ( = ?AUTO_3320 ?AUTO_3328 ) ) ( not ( = ?AUTO_3323 ?AUTO_3328 ) ) ( not ( = ?AUTO_3322 ?AUTO_3327 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3326 ?AUTO_3328 ?AUTO_3325 ?AUTO_3327 )
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
      ?AUTO_3332 - TRUCK
      ?AUTO_3336 - LOCATION
      ?AUTO_3331 - CITY
      ?AUTO_3337 - LOCATION
      ?AUTO_3335 - TRUCK
      ?AUTO_3338 - LOCATION
      ?AUTO_3334 - CITY
      ?AUTO_3339 - LOCATION
      ?AUTO_3333 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3332 ?AUTO_3336 ) ( IN-CITY ?AUTO_3336 ?AUTO_3331 ) ( IN-CITY ?AUTO_3330 ?AUTO_3331 ) ( not ( = ?AUTO_3330 ?AUTO_3336 ) ) ( AIRPORT ?AUTO_3337 ) ( AIRPORT ?AUTO_3336 ) ( not ( = ?AUTO_3337 ?AUTO_3336 ) ) ( not ( = ?AUTO_3330 ?AUTO_3337 ) ) ( IN-TRUCK ?AUTO_3329 ?AUTO_3335 ) ( not ( = ?AUTO_3332 ?AUTO_3335 ) ) ( TRUCK-AT ?AUTO_3335 ?AUTO_3338 ) ( IN-CITY ?AUTO_3338 ?AUTO_3334 ) ( IN-CITY ?AUTO_3337 ?AUTO_3334 ) ( not ( = ?AUTO_3337 ?AUTO_3338 ) ) ( not ( = ?AUTO_3330 ?AUTO_3338 ) ) ( not ( = ?AUTO_3336 ?AUTO_3338 ) ) ( not ( = ?AUTO_3331 ?AUTO_3334 ) ) ( AIRPORT ?AUTO_3339 ) ( AIRPLANE-AT ?AUTO_3333 ?AUTO_3339 ) ( not ( = ?AUTO_3339 ?AUTO_3337 ) ) ( not ( = ?AUTO_3330 ?AUTO_3339 ) ) ( not ( = ?AUTO_3336 ?AUTO_3339 ) ) ( not ( = ?AUTO_3338 ?AUTO_3339 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_3333 ?AUTO_3339 ?AUTO_3337 )
      ( DELIVER-PKG ?AUTO_3329 ?AUTO_3330 )
      ( DELIVER-PKG-VERIFY ?AUTO_3329 ?AUTO_3330 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3554 - OBJ
      ?AUTO_3555 - LOCATION
    )
    :vars
    (
      ?AUTO_3558 - LOCATION
      ?AUTO_3560 - LOCATION
      ?AUTO_3556 - AIRPLANE
      ?AUTO_3559 - LOCATION
      ?AUTO_3557 - CITY
      ?AUTO_3561 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_3558 ) ( AIRPORT ?AUTO_3555 ) ( not ( = ?AUTO_3558 ?AUTO_3555 ) ) ( AIRPORT ?AUTO_3560 ) ( AIRPLANE-AT ?AUTO_3556 ?AUTO_3560 ) ( not ( = ?AUTO_3560 ?AUTO_3558 ) ) ( not ( = ?AUTO_3555 ?AUTO_3560 ) ) ( IN-CITY ?AUTO_3559 ?AUTO_3557 ) ( IN-CITY ?AUTO_3558 ?AUTO_3557 ) ( not ( = ?AUTO_3558 ?AUTO_3559 ) ) ( not ( = ?AUTO_3555 ?AUTO_3559 ) ) ( not ( = ?AUTO_3560 ?AUTO_3559 ) ) ( OBJ-AT ?AUTO_3554 ?AUTO_3559 ) ( TRUCK-AT ?AUTO_3561 ?AUTO_3558 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3561 ?AUTO_3558 ?AUTO_3559 ?AUTO_3557 )
      ( DELIVER-PKG ?AUTO_3554 ?AUTO_3555 )
      ( DELIVER-PKG-VERIFY ?AUTO_3554 ?AUTO_3555 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3672 - OBJ
      ?AUTO_3673 - LOCATION
    )
    :vars
    (
      ?AUTO_3675 - TRUCK
      ?AUTO_3679 - LOCATION
      ?AUTO_3676 - CITY
      ?AUTO_3680 - LOCATION
      ?AUTO_3681 - LOCATION
      ?AUTO_3678 - AIRPLANE
      ?AUTO_3674 - TRUCK
      ?AUTO_3677 - LOCATION
      ?AUTO_3682 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_3675 ?AUTO_3679 ) ( IN-CITY ?AUTO_3679 ?AUTO_3676 ) ( IN-CITY ?AUTO_3673 ?AUTO_3676 ) ( not ( = ?AUTO_3673 ?AUTO_3679 ) ) ( AIRPORT ?AUTO_3680 ) ( AIRPORT ?AUTO_3679 ) ( not ( = ?AUTO_3680 ?AUTO_3679 ) ) ( not ( = ?AUTO_3673 ?AUTO_3680 ) ) ( AIRPORT ?AUTO_3681 ) ( AIRPLANE-AT ?AUTO_3678 ?AUTO_3681 ) ( not ( = ?AUTO_3681 ?AUTO_3680 ) ) ( not ( = ?AUTO_3673 ?AUTO_3681 ) ) ( not ( = ?AUTO_3679 ?AUTO_3681 ) ) ( not ( = ?AUTO_3675 ?AUTO_3674 ) ) ( IN-CITY ?AUTO_3677 ?AUTO_3682 ) ( IN-CITY ?AUTO_3680 ?AUTO_3682 ) ( not ( = ?AUTO_3680 ?AUTO_3677 ) ) ( not ( = ?AUTO_3673 ?AUTO_3677 ) ) ( not ( = ?AUTO_3679 ?AUTO_3677 ) ) ( not ( = ?AUTO_3676 ?AUTO_3682 ) ) ( not ( = ?AUTO_3681 ?AUTO_3677 ) ) ( OBJ-AT ?AUTO_3672 ?AUTO_3677 ) ( TRUCK-AT ?AUTO_3674 ?AUTO_3680 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3674 ?AUTO_3680 ?AUTO_3677 ?AUTO_3682 )
      ( DELIVER-PKG ?AUTO_3672 ?AUTO_3673 )
      ( DELIVER-PKG-VERIFY ?AUTO_3672 ?AUTO_3673 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4211 - OBJ
      ?AUTO_4212 - LOCATION
    )
    :vars
    (
      ?AUTO_4217 - LOCATION
      ?AUTO_4221 - CITY
      ?AUTO_4215 - LOCATION
      ?AUTO_4220 - LOCATION
      ?AUTO_4218 - AIRPLANE
      ?AUTO_4216 - TRUCK
      ?AUTO_4214 - TRUCK
      ?AUTO_4219 - LOCATION
      ?AUTO_4213 - CITY
      ?AUTO_4222 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4217 ?AUTO_4221 ) ( IN-CITY ?AUTO_4212 ?AUTO_4221 ) ( not ( = ?AUTO_4212 ?AUTO_4217 ) ) ( AIRPORT ?AUTO_4215 ) ( AIRPORT ?AUTO_4217 ) ( not ( = ?AUTO_4215 ?AUTO_4217 ) ) ( not ( = ?AUTO_4212 ?AUTO_4215 ) ) ( AIRPORT ?AUTO_4220 ) ( AIRPLANE-AT ?AUTO_4218 ?AUTO_4220 ) ( not ( = ?AUTO_4220 ?AUTO_4215 ) ) ( not ( = ?AUTO_4212 ?AUTO_4220 ) ) ( not ( = ?AUTO_4217 ?AUTO_4220 ) ) ( not ( = ?AUTO_4216 ?AUTO_4214 ) ) ( IN-CITY ?AUTO_4219 ?AUTO_4213 ) ( IN-CITY ?AUTO_4215 ?AUTO_4213 ) ( not ( = ?AUTO_4215 ?AUTO_4219 ) ) ( not ( = ?AUTO_4212 ?AUTO_4219 ) ) ( not ( = ?AUTO_4217 ?AUTO_4219 ) ) ( not ( = ?AUTO_4221 ?AUTO_4213 ) ) ( not ( = ?AUTO_4220 ?AUTO_4219 ) ) ( OBJ-AT ?AUTO_4211 ?AUTO_4219 ) ( TRUCK-AT ?AUTO_4214 ?AUTO_4215 ) ( TRUCK-AT ?AUTO_4216 ?AUTO_4222 ) ( IN-CITY ?AUTO_4222 ?AUTO_4221 ) ( not ( = ?AUTO_4217 ?AUTO_4222 ) ) ( not ( = ?AUTO_4212 ?AUTO_4222 ) ) ( not ( = ?AUTO_4215 ?AUTO_4222 ) ) ( not ( = ?AUTO_4220 ?AUTO_4222 ) ) ( not ( = ?AUTO_4219 ?AUTO_4222 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4216 ?AUTO_4222 ?AUTO_4217 ?AUTO_4221 )
      ( DELIVER-PKG ?AUTO_4211 ?AUTO_4212 )
      ( DELIVER-PKG-VERIFY ?AUTO_4211 ?AUTO_4212 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4619 - OBJ
      ?AUTO_4620 - LOCATION
    )
    :vars
    (
      ?AUTO_4625 - TRUCK
      ?AUTO_4622 - LOCATION
      ?AUTO_4621 - CITY
      ?AUTO_4623 - LOCATION
      ?AUTO_4624 - AIRPLANE
      ?AUTO_4626 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4625 ?AUTO_4622 ) ( IN-CITY ?AUTO_4622 ?AUTO_4621 ) ( IN-CITY ?AUTO_4620 ?AUTO_4621 ) ( not ( = ?AUTO_4620 ?AUTO_4622 ) ) ( AIRPORT ?AUTO_4623 ) ( AIRPORT ?AUTO_4622 ) ( not ( = ?AUTO_4623 ?AUTO_4622 ) ) ( not ( = ?AUTO_4620 ?AUTO_4623 ) ) ( AIRPLANE-AT ?AUTO_4624 ?AUTO_4622 ) ( TRUCK-AT ?AUTO_4626 ?AUTO_4623 ) ( IN-TRUCK ?AUTO_4619 ?AUTO_4626 ) ( not ( = ?AUTO_4625 ?AUTO_4626 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4619 ?AUTO_4626 ?AUTO_4623 )
      ( DELIVER-PKG ?AUTO_4619 ?AUTO_4620 )
      ( DELIVER-PKG-VERIFY ?AUTO_4619 ?AUTO_4620 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4631 - OBJ
      ?AUTO_4632 - LOCATION
    )
    :vars
    (
      ?AUTO_4634 - TRUCK
      ?AUTO_4635 - LOCATION
      ?AUTO_4633 - CITY
      ?AUTO_4636 - LOCATION
      ?AUTO_4638 - AIRPLANE
      ?AUTO_4637 - TRUCK
      ?AUTO_4640 - LOCATION
      ?AUTO_4639 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_4634 ?AUTO_4635 ) ( IN-CITY ?AUTO_4635 ?AUTO_4633 ) ( IN-CITY ?AUTO_4632 ?AUTO_4633 ) ( not ( = ?AUTO_4632 ?AUTO_4635 ) ) ( AIRPORT ?AUTO_4636 ) ( AIRPORT ?AUTO_4635 ) ( not ( = ?AUTO_4636 ?AUTO_4635 ) ) ( not ( = ?AUTO_4632 ?AUTO_4636 ) ) ( AIRPLANE-AT ?AUTO_4638 ?AUTO_4635 ) ( IN-TRUCK ?AUTO_4631 ?AUTO_4637 ) ( not ( = ?AUTO_4634 ?AUTO_4637 ) ) ( TRUCK-AT ?AUTO_4637 ?AUTO_4640 ) ( IN-CITY ?AUTO_4640 ?AUTO_4639 ) ( IN-CITY ?AUTO_4636 ?AUTO_4639 ) ( not ( = ?AUTO_4636 ?AUTO_4640 ) ) ( not ( = ?AUTO_4632 ?AUTO_4640 ) ) ( not ( = ?AUTO_4635 ?AUTO_4640 ) ) ( not ( = ?AUTO_4633 ?AUTO_4639 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4637 ?AUTO_4640 ?AUTO_4636 ?AUTO_4639 )
      ( DELIVER-PKG ?AUTO_4631 ?AUTO_4632 )
      ( DELIVER-PKG-VERIFY ?AUTO_4631 ?AUTO_4632 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4800 - OBJ
      ?AUTO_4801 - LOCATION
    )
    :vars
    (
      ?AUTO_4802 - LOCATION
      ?AUTO_4803 - CITY
      ?AUTO_4807 - TRUCK
      ?AUTO_4805 - LOCATION
      ?AUTO_4806 - LOCATION
      ?AUTO_4804 - AIRPLANE
      ?AUTO_4808 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4802 ?AUTO_4803 ) ( IN-CITY ?AUTO_4801 ?AUTO_4803 ) ( not ( = ?AUTO_4801 ?AUTO_4802 ) ) ( TRUCK-AT ?AUTO_4807 ?AUTO_4801 ) ( AIRPORT ?AUTO_4805 ) ( AIRPORT ?AUTO_4802 ) ( not ( = ?AUTO_4805 ?AUTO_4802 ) ) ( not ( = ?AUTO_4801 ?AUTO_4805 ) ) ( AIRPORT ?AUTO_4806 ) ( AIRPLANE-AT ?AUTO_4804 ?AUTO_4806 ) ( not ( = ?AUTO_4806 ?AUTO_4805 ) ) ( not ( = ?AUTO_4801 ?AUTO_4806 ) ) ( not ( = ?AUTO_4802 ?AUTO_4806 ) ) ( TRUCK-AT ?AUTO_4808 ?AUTO_4805 ) ( IN-TRUCK ?AUTO_4800 ?AUTO_4808 ) ( not ( = ?AUTO_4807 ?AUTO_4808 ) ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_4800 ?AUTO_4808 ?AUTO_4805 )
      ( DELIVER-PKG ?AUTO_4800 ?AUTO_4801 )
      ( DELIVER-PKG-VERIFY ?AUTO_4800 ?AUTO_4801 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4809 - OBJ
      ?AUTO_4810 - LOCATION
    )
    :vars
    (
      ?AUTO_4816 - LOCATION
      ?AUTO_4812 - CITY
      ?AUTO_4815 - TRUCK
      ?AUTO_4813 - LOCATION
      ?AUTO_4811 - LOCATION
      ?AUTO_4817 - AIRPLANE
      ?AUTO_4814 - TRUCK
      ?AUTO_4819 - LOCATION
      ?AUTO_4818 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4816 ?AUTO_4812 ) ( IN-CITY ?AUTO_4810 ?AUTO_4812 ) ( not ( = ?AUTO_4810 ?AUTO_4816 ) ) ( TRUCK-AT ?AUTO_4815 ?AUTO_4810 ) ( AIRPORT ?AUTO_4813 ) ( AIRPORT ?AUTO_4816 ) ( not ( = ?AUTO_4813 ?AUTO_4816 ) ) ( not ( = ?AUTO_4810 ?AUTO_4813 ) ) ( AIRPORT ?AUTO_4811 ) ( AIRPLANE-AT ?AUTO_4817 ?AUTO_4811 ) ( not ( = ?AUTO_4811 ?AUTO_4813 ) ) ( not ( = ?AUTO_4810 ?AUTO_4811 ) ) ( not ( = ?AUTO_4816 ?AUTO_4811 ) ) ( IN-TRUCK ?AUTO_4809 ?AUTO_4814 ) ( not ( = ?AUTO_4815 ?AUTO_4814 ) ) ( TRUCK-AT ?AUTO_4814 ?AUTO_4819 ) ( IN-CITY ?AUTO_4819 ?AUTO_4818 ) ( IN-CITY ?AUTO_4813 ?AUTO_4818 ) ( not ( = ?AUTO_4813 ?AUTO_4819 ) ) ( not ( = ?AUTO_4810 ?AUTO_4819 ) ) ( not ( = ?AUTO_4816 ?AUTO_4819 ) ) ( not ( = ?AUTO_4812 ?AUTO_4818 ) ) ( not ( = ?AUTO_4811 ?AUTO_4819 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4814 ?AUTO_4819 ?AUTO_4813 ?AUTO_4818 )
      ( DELIVER-PKG ?AUTO_4809 ?AUTO_4810 )
      ( DELIVER-PKG-VERIFY ?AUTO_4809 ?AUTO_4810 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4820 - OBJ
      ?AUTO_4821 - LOCATION
    )
    :vars
    (
      ?AUTO_4825 - LOCATION
      ?AUTO_4822 - CITY
      ?AUTO_4830 - TRUCK
      ?AUTO_4828 - LOCATION
      ?AUTO_4826 - LOCATION
      ?AUTO_4827 - AIRPLANE
      ?AUTO_4829 - TRUCK
      ?AUTO_4823 - LOCATION
      ?AUTO_4824 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4825 ?AUTO_4822 ) ( IN-CITY ?AUTO_4821 ?AUTO_4822 ) ( not ( = ?AUTO_4821 ?AUTO_4825 ) ) ( TRUCK-AT ?AUTO_4830 ?AUTO_4821 ) ( AIRPORT ?AUTO_4828 ) ( AIRPORT ?AUTO_4825 ) ( not ( = ?AUTO_4828 ?AUTO_4825 ) ) ( not ( = ?AUTO_4821 ?AUTO_4828 ) ) ( AIRPORT ?AUTO_4826 ) ( AIRPLANE-AT ?AUTO_4827 ?AUTO_4826 ) ( not ( = ?AUTO_4826 ?AUTO_4828 ) ) ( not ( = ?AUTO_4821 ?AUTO_4826 ) ) ( not ( = ?AUTO_4825 ?AUTO_4826 ) ) ( not ( = ?AUTO_4830 ?AUTO_4829 ) ) ( TRUCK-AT ?AUTO_4829 ?AUTO_4823 ) ( IN-CITY ?AUTO_4823 ?AUTO_4824 ) ( IN-CITY ?AUTO_4828 ?AUTO_4824 ) ( not ( = ?AUTO_4828 ?AUTO_4823 ) ) ( not ( = ?AUTO_4821 ?AUTO_4823 ) ) ( not ( = ?AUTO_4825 ?AUTO_4823 ) ) ( not ( = ?AUTO_4822 ?AUTO_4824 ) ) ( not ( = ?AUTO_4826 ?AUTO_4823 ) ) ( OBJ-AT ?AUTO_4820 ?AUTO_4823 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_4820 ?AUTO_4829 ?AUTO_4823 )
      ( DELIVER-PKG ?AUTO_4820 ?AUTO_4821 )
      ( DELIVER-PKG-VERIFY ?AUTO_4820 ?AUTO_4821 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_4831 - OBJ
      ?AUTO_4832 - LOCATION
    )
    :vars
    (
      ?AUTO_4839 - LOCATION
      ?AUTO_4835 - CITY
      ?AUTO_4841 - TRUCK
      ?AUTO_4838 - LOCATION
      ?AUTO_4836 - LOCATION
      ?AUTO_4837 - AIRPLANE
      ?AUTO_4840 - TRUCK
      ?AUTO_4834 - LOCATION
      ?AUTO_4833 - CITY
      ?AUTO_4842 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_4839 ?AUTO_4835 ) ( IN-CITY ?AUTO_4832 ?AUTO_4835 ) ( not ( = ?AUTO_4832 ?AUTO_4839 ) ) ( TRUCK-AT ?AUTO_4841 ?AUTO_4832 ) ( AIRPORT ?AUTO_4838 ) ( AIRPORT ?AUTO_4839 ) ( not ( = ?AUTO_4838 ?AUTO_4839 ) ) ( not ( = ?AUTO_4832 ?AUTO_4838 ) ) ( AIRPORT ?AUTO_4836 ) ( AIRPLANE-AT ?AUTO_4837 ?AUTO_4836 ) ( not ( = ?AUTO_4836 ?AUTO_4838 ) ) ( not ( = ?AUTO_4832 ?AUTO_4836 ) ) ( not ( = ?AUTO_4839 ?AUTO_4836 ) ) ( not ( = ?AUTO_4841 ?AUTO_4840 ) ) ( IN-CITY ?AUTO_4834 ?AUTO_4833 ) ( IN-CITY ?AUTO_4838 ?AUTO_4833 ) ( not ( = ?AUTO_4838 ?AUTO_4834 ) ) ( not ( = ?AUTO_4832 ?AUTO_4834 ) ) ( not ( = ?AUTO_4839 ?AUTO_4834 ) ) ( not ( = ?AUTO_4835 ?AUTO_4833 ) ) ( not ( = ?AUTO_4836 ?AUTO_4834 ) ) ( OBJ-AT ?AUTO_4831 ?AUTO_4834 ) ( TRUCK-AT ?AUTO_4840 ?AUTO_4842 ) ( IN-CITY ?AUTO_4842 ?AUTO_4833 ) ( not ( = ?AUTO_4834 ?AUTO_4842 ) ) ( not ( = ?AUTO_4832 ?AUTO_4842 ) ) ( not ( = ?AUTO_4839 ?AUTO_4842 ) ) ( not ( = ?AUTO_4838 ?AUTO_4842 ) ) ( not ( = ?AUTO_4836 ?AUTO_4842 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_4840 ?AUTO_4842 ?AUTO_4834 ?AUTO_4833 )
      ( DELIVER-PKG ?AUTO_4831 ?AUTO_4832 )
      ( DELIVER-PKG-VERIFY ?AUTO_4831 ?AUTO_4832 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5091 - OBJ
      ?AUTO_5092 - LOCATION
    )
    :vars
    (
      ?AUTO_5097 - TRUCK
      ?AUTO_5093 - LOCATION
      ?AUTO_5099 - CITY
      ?AUTO_5094 - LOCATION
      ?AUTO_5095 - AIRPLANE
      ?AUTO_5096 - TRUCK
      ?AUTO_5100 - LOCATION
      ?AUTO_5098 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_5097 ?AUTO_5093 ) ( IN-CITY ?AUTO_5093 ?AUTO_5099 ) ( IN-CITY ?AUTO_5092 ?AUTO_5099 ) ( not ( = ?AUTO_5092 ?AUTO_5093 ) ) ( AIRPORT ?AUTO_5094 ) ( AIRPORT ?AUTO_5093 ) ( AIRPLANE-AT ?AUTO_5095 ?AUTO_5094 ) ( not ( = ?AUTO_5094 ?AUTO_5093 ) ) ( not ( = ?AUTO_5092 ?AUTO_5094 ) ) ( not ( = ?AUTO_5097 ?AUTO_5096 ) ) ( TRUCK-AT ?AUTO_5096 ?AUTO_5100 ) ( IN-CITY ?AUTO_5100 ?AUTO_5098 ) ( IN-CITY ?AUTO_5094 ?AUTO_5098 ) ( not ( = ?AUTO_5094 ?AUTO_5100 ) ) ( not ( = ?AUTO_5092 ?AUTO_5100 ) ) ( not ( = ?AUTO_5093 ?AUTO_5100 ) ) ( not ( = ?AUTO_5099 ?AUTO_5098 ) ) ( OBJ-AT ?AUTO_5091 ?AUTO_5100 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_5091 ?AUTO_5096 ?AUTO_5100 )
      ( DELIVER-PKG ?AUTO_5091 ?AUTO_5092 )
      ( DELIVER-PKG-VERIFY ?AUTO_5091 ?AUTO_5092 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5678 - OBJ
      ?AUTO_5679 - LOCATION
    )
    :vars
    (
      ?AUTO_5680 - LOCATION
      ?AUTO_5682 - AIRPLANE
      ?AUTO_5681 - LOCATION
      ?AUTO_5683 - CITY
      ?AUTO_5684 - TRUCK
      ?AUTO_5685 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5680 ) ( AIRPORT ?AUTO_5679 ) ( AIRPLANE-AT ?AUTO_5682 ?AUTO_5680 ) ( not ( = ?AUTO_5680 ?AUTO_5679 ) ) ( IN-CITY ?AUTO_5681 ?AUTO_5683 ) ( IN-CITY ?AUTO_5680 ?AUTO_5683 ) ( not ( = ?AUTO_5680 ?AUTO_5681 ) ) ( not ( = ?AUTO_5679 ?AUTO_5681 ) ) ( OBJ-AT ?AUTO_5678 ?AUTO_5681 ) ( TRUCK-AT ?AUTO_5684 ?AUTO_5685 ) ( IN-CITY ?AUTO_5685 ?AUTO_5683 ) ( not ( = ?AUTO_5681 ?AUTO_5685 ) ) ( not ( = ?AUTO_5679 ?AUTO_5685 ) ) ( not ( = ?AUTO_5680 ?AUTO_5685 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_5684 ?AUTO_5685 ?AUTO_5681 ?AUTO_5683 )
      ( DELIVER-PKG ?AUTO_5678 ?AUTO_5679 )
      ( DELIVER-PKG-VERIFY ?AUTO_5678 ?AUTO_5679 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_5686 - OBJ
      ?AUTO_5687 - LOCATION
    )
    :vars
    (
      ?AUTO_5689 - LOCATION
      ?AUTO_5688 - LOCATION
      ?AUTO_5691 - CITY
      ?AUTO_5692 - TRUCK
      ?AUTO_5693 - LOCATION
      ?AUTO_5694 - LOCATION
      ?AUTO_5690 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_5689 ) ( AIRPORT ?AUTO_5687 ) ( not ( = ?AUTO_5689 ?AUTO_5687 ) ) ( IN-CITY ?AUTO_5688 ?AUTO_5691 ) ( IN-CITY ?AUTO_5689 ?AUTO_5691 ) ( not ( = ?AUTO_5689 ?AUTO_5688 ) ) ( not ( = ?AUTO_5687 ?AUTO_5688 ) ) ( OBJ-AT ?AUTO_5686 ?AUTO_5688 ) ( TRUCK-AT ?AUTO_5692 ?AUTO_5693 ) ( IN-CITY ?AUTO_5693 ?AUTO_5691 ) ( not ( = ?AUTO_5688 ?AUTO_5693 ) ) ( not ( = ?AUTO_5687 ?AUTO_5693 ) ) ( not ( = ?AUTO_5689 ?AUTO_5693 ) ) ( AIRPORT ?AUTO_5694 ) ( AIRPLANE-AT ?AUTO_5690 ?AUTO_5694 ) ( not ( = ?AUTO_5694 ?AUTO_5689 ) ) ( not ( = ?AUTO_5687 ?AUTO_5694 ) ) ( not ( = ?AUTO_5688 ?AUTO_5694 ) ) ( not ( = ?AUTO_5693 ?AUTO_5694 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_5690 ?AUTO_5694 ?AUTO_5689 )
      ( DELIVER-PKG ?AUTO_5686 ?AUTO_5687 )
      ( DELIVER-PKG-VERIFY ?AUTO_5686 ?AUTO_5687 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6139 - OBJ
      ?AUTO_6140 - LOCATION
    )
    :vars
    (
      ?AUTO_6145 - LOCATION
      ?AUTO_6144 - CITY
      ?AUTO_6141 - LOCATION
      ?AUTO_6146 - LOCATION
      ?AUTO_6142 - AIRPLANE
      ?AUTO_6143 - TRUCK
      ?AUTO_6147 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6145 ?AUTO_6144 ) ( IN-CITY ?AUTO_6140 ?AUTO_6144 ) ( not ( = ?AUTO_6140 ?AUTO_6145 ) ) ( AIRPORT ?AUTO_6141 ) ( AIRPORT ?AUTO_6145 ) ( not ( = ?AUTO_6141 ?AUTO_6145 ) ) ( not ( = ?AUTO_6140 ?AUTO_6141 ) ) ( OBJ-AT ?AUTO_6139 ?AUTO_6141 ) ( AIRPORT ?AUTO_6146 ) ( AIRPLANE-AT ?AUTO_6142 ?AUTO_6146 ) ( not ( = ?AUTO_6146 ?AUTO_6141 ) ) ( not ( = ?AUTO_6140 ?AUTO_6146 ) ) ( not ( = ?AUTO_6145 ?AUTO_6146 ) ) ( TRUCK-AT ?AUTO_6143 ?AUTO_6147 ) ( IN-CITY ?AUTO_6147 ?AUTO_6144 ) ( not ( = ?AUTO_6145 ?AUTO_6147 ) ) ( not ( = ?AUTO_6140 ?AUTO_6147 ) ) ( not ( = ?AUTO_6141 ?AUTO_6147 ) ) ( not ( = ?AUTO_6146 ?AUTO_6147 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6143 ?AUTO_6147 ?AUTO_6145 ?AUTO_6144 )
      ( DELIVER-PKG ?AUTO_6139 ?AUTO_6140 )
      ( DELIVER-PKG-VERIFY ?AUTO_6139 ?AUTO_6140 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6248 - OBJ
      ?AUTO_6249 - LOCATION
    )
    :vars
    (
      ?AUTO_6251 - LOCATION
      ?AUTO_6250 - CITY
      ?AUTO_6254 - LOCATION
      ?AUTO_6252 - AIRPLANE
      ?AUTO_6253 - LOCATION
      ?AUTO_6255 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6251 ?AUTO_6250 ) ( IN-CITY ?AUTO_6249 ?AUTO_6250 ) ( not ( = ?AUTO_6249 ?AUTO_6251 ) ) ( AIRPORT ?AUTO_6254 ) ( AIRPORT ?AUTO_6251 ) ( not ( = ?AUTO_6254 ?AUTO_6251 ) ) ( not ( = ?AUTO_6249 ?AUTO_6254 ) ) ( OBJ-AT ?AUTO_6248 ?AUTO_6254 ) ( AIRPLANE-AT ?AUTO_6252 ?AUTO_6251 ) ( IN-CITY ?AUTO_6253 ?AUTO_6250 ) ( not ( = ?AUTO_6251 ?AUTO_6253 ) ) ( not ( = ?AUTO_6249 ?AUTO_6253 ) ) ( not ( = ?AUTO_6254 ?AUTO_6253 ) ) ( TRUCK-AT ?AUTO_6255 ?AUTO_6249 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6255 ?AUTO_6249 ?AUTO_6253 ?AUTO_6250 )
      ( DELIVER-PKG ?AUTO_6248 ?AUTO_6249 )
      ( DELIVER-PKG-VERIFY ?AUTO_6248 ?AUTO_6249 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6256 - OBJ
      ?AUTO_6257 - LOCATION
    )
    :vars
    (
      ?AUTO_6261 - LOCATION
      ?AUTO_6258 - CITY
      ?AUTO_6262 - LOCATION
      ?AUTO_6263 - LOCATION
      ?AUTO_6259 - TRUCK
      ?AUTO_6264 - LOCATION
      ?AUTO_6260 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6261 ?AUTO_6258 ) ( IN-CITY ?AUTO_6257 ?AUTO_6258 ) ( not ( = ?AUTO_6257 ?AUTO_6261 ) ) ( AIRPORT ?AUTO_6262 ) ( AIRPORT ?AUTO_6261 ) ( not ( = ?AUTO_6262 ?AUTO_6261 ) ) ( not ( = ?AUTO_6257 ?AUTO_6262 ) ) ( OBJ-AT ?AUTO_6256 ?AUTO_6262 ) ( IN-CITY ?AUTO_6263 ?AUTO_6258 ) ( not ( = ?AUTO_6261 ?AUTO_6263 ) ) ( not ( = ?AUTO_6257 ?AUTO_6263 ) ) ( not ( = ?AUTO_6262 ?AUTO_6263 ) ) ( TRUCK-AT ?AUTO_6259 ?AUTO_6257 ) ( AIRPORT ?AUTO_6264 ) ( AIRPLANE-AT ?AUTO_6260 ?AUTO_6264 ) ( not ( = ?AUTO_6264 ?AUTO_6261 ) ) ( not ( = ?AUTO_6257 ?AUTO_6264 ) ) ( not ( = ?AUTO_6262 ?AUTO_6264 ) ) ( not ( = ?AUTO_6263 ?AUTO_6264 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6260 ?AUTO_6264 ?AUTO_6261 )
      ( DELIVER-PKG ?AUTO_6256 ?AUTO_6257 )
      ( DELIVER-PKG-VERIFY ?AUTO_6256 ?AUTO_6257 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6709 - OBJ
      ?AUTO_6710 - LOCATION
    )
    :vars
    (
      ?AUTO_6711 - LOCATION
      ?AUTO_6715 - CITY
      ?AUTO_6717 - TRUCK
      ?AUTO_6713 - LOCATION
      ?AUTO_6714 - AIRPLANE
      ?AUTO_6718 - TRUCK
      ?AUTO_6716 - LOCATION
      ?AUTO_6712 - CITY
      ?AUTO_6719 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6711 ?AUTO_6715 ) ( IN-CITY ?AUTO_6710 ?AUTO_6715 ) ( not ( = ?AUTO_6710 ?AUTO_6711 ) ) ( TRUCK-AT ?AUTO_6717 ?AUTO_6710 ) ( AIRPORT ?AUTO_6713 ) ( AIRPORT ?AUTO_6711 ) ( AIRPLANE-AT ?AUTO_6714 ?AUTO_6713 ) ( not ( = ?AUTO_6713 ?AUTO_6711 ) ) ( not ( = ?AUTO_6710 ?AUTO_6713 ) ) ( not ( = ?AUTO_6717 ?AUTO_6718 ) ) ( IN-CITY ?AUTO_6716 ?AUTO_6712 ) ( IN-CITY ?AUTO_6713 ?AUTO_6712 ) ( not ( = ?AUTO_6713 ?AUTO_6716 ) ) ( not ( = ?AUTO_6710 ?AUTO_6716 ) ) ( not ( = ?AUTO_6711 ?AUTO_6716 ) ) ( not ( = ?AUTO_6715 ?AUTO_6712 ) ) ( OBJ-AT ?AUTO_6709 ?AUTO_6716 ) ( TRUCK-AT ?AUTO_6718 ?AUTO_6719 ) ( IN-CITY ?AUTO_6719 ?AUTO_6712 ) ( not ( = ?AUTO_6716 ?AUTO_6719 ) ) ( not ( = ?AUTO_6710 ?AUTO_6719 ) ) ( not ( = ?AUTO_6711 ?AUTO_6719 ) ) ( not ( = ?AUTO_6713 ?AUTO_6719 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_6718 ?AUTO_6719 ?AUTO_6716 ?AUTO_6712 )
      ( DELIVER-PKG ?AUTO_6709 ?AUTO_6710 )
      ( DELIVER-PKG-VERIFY ?AUTO_6709 ?AUTO_6710 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_6720 - OBJ
      ?AUTO_6721 - LOCATION
    )
    :vars
    (
      ?AUTO_6726 - LOCATION
      ?AUTO_6730 - CITY
      ?AUTO_6728 - TRUCK
      ?AUTO_6724 - LOCATION
      ?AUTO_6723 - TRUCK
      ?AUTO_6725 - LOCATION
      ?AUTO_6727 - CITY
      ?AUTO_6729 - LOCATION
      ?AUTO_6731 - LOCATION
      ?AUTO_6722 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_6726 ?AUTO_6730 ) ( IN-CITY ?AUTO_6721 ?AUTO_6730 ) ( not ( = ?AUTO_6721 ?AUTO_6726 ) ) ( TRUCK-AT ?AUTO_6728 ?AUTO_6721 ) ( AIRPORT ?AUTO_6724 ) ( AIRPORT ?AUTO_6726 ) ( not ( = ?AUTO_6724 ?AUTO_6726 ) ) ( not ( = ?AUTO_6721 ?AUTO_6724 ) ) ( not ( = ?AUTO_6728 ?AUTO_6723 ) ) ( IN-CITY ?AUTO_6725 ?AUTO_6727 ) ( IN-CITY ?AUTO_6724 ?AUTO_6727 ) ( not ( = ?AUTO_6724 ?AUTO_6725 ) ) ( not ( = ?AUTO_6721 ?AUTO_6725 ) ) ( not ( = ?AUTO_6726 ?AUTO_6725 ) ) ( not ( = ?AUTO_6730 ?AUTO_6727 ) ) ( OBJ-AT ?AUTO_6720 ?AUTO_6725 ) ( TRUCK-AT ?AUTO_6723 ?AUTO_6729 ) ( IN-CITY ?AUTO_6729 ?AUTO_6727 ) ( not ( = ?AUTO_6725 ?AUTO_6729 ) ) ( not ( = ?AUTO_6721 ?AUTO_6729 ) ) ( not ( = ?AUTO_6726 ?AUTO_6729 ) ) ( not ( = ?AUTO_6724 ?AUTO_6729 ) ) ( AIRPORT ?AUTO_6731 ) ( AIRPLANE-AT ?AUTO_6722 ?AUTO_6731 ) ( not ( = ?AUTO_6731 ?AUTO_6724 ) ) ( not ( = ?AUTO_6721 ?AUTO_6731 ) ) ( not ( = ?AUTO_6726 ?AUTO_6731 ) ) ( not ( = ?AUTO_6725 ?AUTO_6731 ) ) ( not ( = ?AUTO_6729 ?AUTO_6731 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_6722 ?AUTO_6731 ?AUTO_6724 )
      ( DELIVER-PKG ?AUTO_6720 ?AUTO_6721 )
      ( DELIVER-PKG-VERIFY ?AUTO_6720 ?AUTO_6721 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7220 - OBJ
      ?AUTO_7221 - LOCATION
    )
    :vars
    (
      ?AUTO_7224 - LOCATION
      ?AUTO_7222 - CITY
      ?AUTO_7225 - TRUCK
      ?AUTO_7226 - LOCATION
      ?AUTO_7223 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7224 ?AUTO_7222 ) ( IN-CITY ?AUTO_7221 ?AUTO_7222 ) ( not ( = ?AUTO_7221 ?AUTO_7224 ) ) ( TRUCK-AT ?AUTO_7225 ?AUTO_7221 ) ( AIRPORT ?AUTO_7226 ) ( AIRPORT ?AUTO_7224 ) ( not ( = ?AUTO_7226 ?AUTO_7224 ) ) ( not ( = ?AUTO_7221 ?AUTO_7226 ) ) ( OBJ-AT ?AUTO_7220 ?AUTO_7226 ) ( AIRPLANE-AT ?AUTO_7223 ?AUTO_7224 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7223 ?AUTO_7224 ?AUTO_7226 )
      ( DELIVER-PKG ?AUTO_7220 ?AUTO_7221 )
      ( DELIVER-PKG-VERIFY ?AUTO_7220 ?AUTO_7221 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7241 - OBJ
      ?AUTO_7242 - LOCATION
    )
    :vars
    (
      ?AUTO_7244 - LOCATION
      ?AUTO_7243 - CITY
      ?AUTO_7245 - LOCATION
      ?AUTO_7247 - AIRPLANE
      ?AUTO_7246 - TRUCK
      ?AUTO_7248 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7244 ?AUTO_7243 ) ( IN-CITY ?AUTO_7242 ?AUTO_7243 ) ( not ( = ?AUTO_7242 ?AUTO_7244 ) ) ( AIRPORT ?AUTO_7245 ) ( AIRPORT ?AUTO_7244 ) ( not ( = ?AUTO_7245 ?AUTO_7244 ) ) ( not ( = ?AUTO_7242 ?AUTO_7245 ) ) ( OBJ-AT ?AUTO_7241 ?AUTO_7245 ) ( AIRPLANE-AT ?AUTO_7247 ?AUTO_7244 ) ( TRUCK-AT ?AUTO_7246 ?AUTO_7248 ) ( IN-CITY ?AUTO_7248 ?AUTO_7243 ) ( not ( = ?AUTO_7242 ?AUTO_7248 ) ) ( not ( = ?AUTO_7244 ?AUTO_7248 ) ) ( not ( = ?AUTO_7245 ?AUTO_7248 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7246 ?AUTO_7248 ?AUTO_7242 ?AUTO_7243 )
      ( DELIVER-PKG ?AUTO_7241 ?AUTO_7242 )
      ( DELIVER-PKG-VERIFY ?AUTO_7241 ?AUTO_7242 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7347 - OBJ
      ?AUTO_7348 - LOCATION
    )
    :vars
    (
      ?AUTO_7349 - LOCATION
      ?AUTO_7353 - TRUCK
      ?AUTO_7350 - LOCATION
      ?AUTO_7351 - CITY
      ?AUTO_7352 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7349 ) ( AIRPORT ?AUTO_7348 ) ( not ( = ?AUTO_7349 ?AUTO_7348 ) ) ( IN-TRUCK ?AUTO_7347 ?AUTO_7353 ) ( TRUCK-AT ?AUTO_7353 ?AUTO_7350 ) ( IN-CITY ?AUTO_7350 ?AUTO_7351 ) ( IN-CITY ?AUTO_7349 ?AUTO_7351 ) ( not ( = ?AUTO_7349 ?AUTO_7350 ) ) ( not ( = ?AUTO_7348 ?AUTO_7350 ) ) ( AIRPLANE-AT ?AUTO_7352 ?AUTO_7349 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7352 ?AUTO_7349 ?AUTO_7348 )
      ( DELIVER-PKG ?AUTO_7347 ?AUTO_7348 )
      ( DELIVER-PKG-VERIFY ?AUTO_7347 ?AUTO_7348 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7465 - OBJ
      ?AUTO_7466 - LOCATION
    )
    :vars
    (
      ?AUTO_7468 - LOCATION
      ?AUTO_7467 - CITY
      ?AUTO_7469 - TRUCK
      ?AUTO_7470 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7468 ?AUTO_7467 ) ( IN-CITY ?AUTO_7466 ?AUTO_7467 ) ( not ( = ?AUTO_7466 ?AUTO_7468 ) ) ( OBJ-AT ?AUTO_7465 ?AUTO_7468 ) ( TRUCK-AT ?AUTO_7469 ?AUTO_7470 ) ( IN-CITY ?AUTO_7470 ?AUTO_7467 ) ( not ( = ?AUTO_7466 ?AUTO_7470 ) ) ( not ( = ?AUTO_7468 ?AUTO_7470 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7469 ?AUTO_7470 ?AUTO_7466 ?AUTO_7467 )
      ( DELIVER-PKG ?AUTO_7465 ?AUTO_7466 )
      ( DELIVER-PKG-VERIFY ?AUTO_7465 ?AUTO_7466 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7618 - OBJ
      ?AUTO_7619 - LOCATION
    )
    :vars
    (
      ?AUTO_7625 - LOCATION
      ?AUTO_7624 - LOCATION
      ?AUTO_7620 - CITY
      ?AUTO_7621 - LOCATION
      ?AUTO_7623 - AIRPLANE
      ?AUTO_7622 - TRUCK
      ?AUTO_7626 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7625 ) ( AIRPORT ?AUTO_7619 ) ( not ( = ?AUTO_7625 ?AUTO_7619 ) ) ( IN-CITY ?AUTO_7624 ?AUTO_7620 ) ( IN-CITY ?AUTO_7625 ?AUTO_7620 ) ( not ( = ?AUTO_7625 ?AUTO_7624 ) ) ( not ( = ?AUTO_7619 ?AUTO_7624 ) ) ( OBJ-AT ?AUTO_7618 ?AUTO_7624 ) ( AIRPORT ?AUTO_7621 ) ( AIRPLANE-AT ?AUTO_7623 ?AUTO_7621 ) ( not ( = ?AUTO_7621 ?AUTO_7625 ) ) ( not ( = ?AUTO_7619 ?AUTO_7621 ) ) ( not ( = ?AUTO_7624 ?AUTO_7621 ) ) ( TRUCK-AT ?AUTO_7622 ?AUTO_7626 ) ( IN-CITY ?AUTO_7626 ?AUTO_7620 ) ( not ( = ?AUTO_7625 ?AUTO_7626 ) ) ( not ( = ?AUTO_7619 ?AUTO_7626 ) ) ( not ( = ?AUTO_7624 ?AUTO_7626 ) ) ( not ( = ?AUTO_7621 ?AUTO_7626 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7622 ?AUTO_7626 ?AUTO_7625 ?AUTO_7620 )
      ( DELIVER-PKG ?AUTO_7618 ?AUTO_7619 )
      ( DELIVER-PKG-VERIFY ?AUTO_7618 ?AUTO_7619 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7671 - OBJ
      ?AUTO_7672 - LOCATION
    )
    :vars
    (
      ?AUTO_7674 - LOCATION
      ?AUTO_7673 - LOCATION
      ?AUTO_7675 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_7674 ) ( AIRPORT ?AUTO_7672 ) ( not ( = ?AUTO_7674 ?AUTO_7672 ) ) ( OBJ-AT ?AUTO_7671 ?AUTO_7674 ) ( AIRPORT ?AUTO_7673 ) ( not ( = ?AUTO_7673 ?AUTO_7674 ) ) ( not ( = ?AUTO_7672 ?AUTO_7673 ) ) ( AIRPLANE-AT ?AUTO_7675 ?AUTO_7672 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7675 ?AUTO_7672 ?AUTO_7673 )
      ( DELIVER-PKG ?AUTO_7671 ?AUTO_7672 )
      ( DELIVER-PKG-VERIFY ?AUTO_7671 ?AUTO_7672 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7875 - OBJ
      ?AUTO_7876 - LOCATION
    )
    :vars
    (
      ?AUTO_7883 - LOCATION
      ?AUTO_7878 - CITY
      ?AUTO_7882 - LOCATION
      ?AUTO_7880 - AIRPLANE
      ?AUTO_7877 - TRUCK
      ?AUTO_7881 - TRUCK
      ?AUTO_7884 - LOCATION
      ?AUTO_7879 - CITY
      ?AUTO_7885 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7883 ?AUTO_7878 ) ( IN-CITY ?AUTO_7876 ?AUTO_7878 ) ( not ( = ?AUTO_7876 ?AUTO_7883 ) ) ( AIRPORT ?AUTO_7882 ) ( AIRPORT ?AUTO_7883 ) ( not ( = ?AUTO_7882 ?AUTO_7883 ) ) ( not ( = ?AUTO_7876 ?AUTO_7882 ) ) ( AIRPLANE-AT ?AUTO_7880 ?AUTO_7883 ) ( IN-TRUCK ?AUTO_7875 ?AUTO_7877 ) ( not ( = ?AUTO_7881 ?AUTO_7877 ) ) ( TRUCK-AT ?AUTO_7877 ?AUTO_7884 ) ( IN-CITY ?AUTO_7884 ?AUTO_7879 ) ( IN-CITY ?AUTO_7882 ?AUTO_7879 ) ( not ( = ?AUTO_7882 ?AUTO_7884 ) ) ( not ( = ?AUTO_7876 ?AUTO_7884 ) ) ( not ( = ?AUTO_7883 ?AUTO_7884 ) ) ( not ( = ?AUTO_7878 ?AUTO_7879 ) ) ( TRUCK-AT ?AUTO_7881 ?AUTO_7885 ) ( IN-CITY ?AUTO_7885 ?AUTO_7878 ) ( not ( = ?AUTO_7883 ?AUTO_7885 ) ) ( not ( = ?AUTO_7876 ?AUTO_7885 ) ) ( not ( = ?AUTO_7882 ?AUTO_7885 ) ) ( not ( = ?AUTO_7884 ?AUTO_7885 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_7881 ?AUTO_7885 ?AUTO_7883 ?AUTO_7878 )
      ( DELIVER-PKG ?AUTO_7875 ?AUTO_7876 )
      ( DELIVER-PKG-VERIFY ?AUTO_7875 ?AUTO_7876 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7886 - OBJ
      ?AUTO_7887 - LOCATION
    )
    :vars
    (
      ?AUTO_7889 - LOCATION
      ?AUTO_7888 - CITY
      ?AUTO_7892 - LOCATION
      ?AUTO_7891 - TRUCK
      ?AUTO_7893 - TRUCK
      ?AUTO_7890 - LOCATION
      ?AUTO_7895 - CITY
      ?AUTO_7896 - LOCATION
      ?AUTO_7894 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7889 ?AUTO_7888 ) ( IN-CITY ?AUTO_7887 ?AUTO_7888 ) ( not ( = ?AUTO_7887 ?AUTO_7889 ) ) ( AIRPORT ?AUTO_7892 ) ( AIRPORT ?AUTO_7889 ) ( not ( = ?AUTO_7892 ?AUTO_7889 ) ) ( not ( = ?AUTO_7887 ?AUTO_7892 ) ) ( IN-TRUCK ?AUTO_7886 ?AUTO_7891 ) ( not ( = ?AUTO_7893 ?AUTO_7891 ) ) ( TRUCK-AT ?AUTO_7891 ?AUTO_7890 ) ( IN-CITY ?AUTO_7890 ?AUTO_7895 ) ( IN-CITY ?AUTO_7892 ?AUTO_7895 ) ( not ( = ?AUTO_7892 ?AUTO_7890 ) ) ( not ( = ?AUTO_7887 ?AUTO_7890 ) ) ( not ( = ?AUTO_7889 ?AUTO_7890 ) ) ( not ( = ?AUTO_7888 ?AUTO_7895 ) ) ( TRUCK-AT ?AUTO_7893 ?AUTO_7896 ) ( IN-CITY ?AUTO_7896 ?AUTO_7888 ) ( not ( = ?AUTO_7889 ?AUTO_7896 ) ) ( not ( = ?AUTO_7887 ?AUTO_7896 ) ) ( not ( = ?AUTO_7892 ?AUTO_7896 ) ) ( not ( = ?AUTO_7890 ?AUTO_7896 ) ) ( AIRPLANE-AT ?AUTO_7894 ?AUTO_7892 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7894 ?AUTO_7892 ?AUTO_7889 )
      ( DELIVER-PKG ?AUTO_7886 ?AUTO_7887 )
      ( DELIVER-PKG-VERIFY ?AUTO_7886 ?AUTO_7887 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_7899 - OBJ
      ?AUTO_7900 - LOCATION
    )
    :vars
    (
      ?AUTO_7903 - LOCATION
      ?AUTO_7907 - CITY
      ?AUTO_7901 - LOCATION
      ?AUTO_7902 - TRUCK
      ?AUTO_7909 - TRUCK
      ?AUTO_7905 - LOCATION
      ?AUTO_7908 - CITY
      ?AUTO_7906 - LOCATION
      ?AUTO_7910 - LOCATION
      ?AUTO_7904 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_7903 ?AUTO_7907 ) ( IN-CITY ?AUTO_7900 ?AUTO_7907 ) ( not ( = ?AUTO_7900 ?AUTO_7903 ) ) ( AIRPORT ?AUTO_7901 ) ( AIRPORT ?AUTO_7903 ) ( not ( = ?AUTO_7901 ?AUTO_7903 ) ) ( not ( = ?AUTO_7900 ?AUTO_7901 ) ) ( IN-TRUCK ?AUTO_7899 ?AUTO_7902 ) ( not ( = ?AUTO_7909 ?AUTO_7902 ) ) ( TRUCK-AT ?AUTO_7902 ?AUTO_7905 ) ( IN-CITY ?AUTO_7905 ?AUTO_7908 ) ( IN-CITY ?AUTO_7901 ?AUTO_7908 ) ( not ( = ?AUTO_7901 ?AUTO_7905 ) ) ( not ( = ?AUTO_7900 ?AUTO_7905 ) ) ( not ( = ?AUTO_7903 ?AUTO_7905 ) ) ( not ( = ?AUTO_7907 ?AUTO_7908 ) ) ( TRUCK-AT ?AUTO_7909 ?AUTO_7906 ) ( IN-CITY ?AUTO_7906 ?AUTO_7907 ) ( not ( = ?AUTO_7903 ?AUTO_7906 ) ) ( not ( = ?AUTO_7900 ?AUTO_7906 ) ) ( not ( = ?AUTO_7901 ?AUTO_7906 ) ) ( not ( = ?AUTO_7905 ?AUTO_7906 ) ) ( AIRPORT ?AUTO_7910 ) ( AIRPLANE-AT ?AUTO_7904 ?AUTO_7910 ) ( not ( = ?AUTO_7910 ?AUTO_7901 ) ) ( not ( = ?AUTO_7900 ?AUTO_7910 ) ) ( not ( = ?AUTO_7903 ?AUTO_7910 ) ) ( not ( = ?AUTO_7905 ?AUTO_7910 ) ) ( not ( = ?AUTO_7906 ?AUTO_7910 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_7904 ?AUTO_7910 ?AUTO_7901 )
      ( DELIVER-PKG ?AUTO_7899 ?AUTO_7900 )
      ( DELIVER-PKG-VERIFY ?AUTO_7899 ?AUTO_7900 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8027 - OBJ
      ?AUTO_8028 - LOCATION
    )
    :vars
    (
      ?AUTO_8030 - TRUCK
      ?AUTO_8034 - LOCATION
      ?AUTO_8032 - CITY
      ?AUTO_8033 - LOCATION
      ?AUTO_8031 - LOCATION
      ?AUTO_8029 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8030 ?AUTO_8034 ) ( IN-CITY ?AUTO_8034 ?AUTO_8032 ) ( IN-CITY ?AUTO_8028 ?AUTO_8032 ) ( not ( = ?AUTO_8028 ?AUTO_8034 ) ) ( AIRPORT ?AUTO_8033 ) ( AIRPORT ?AUTO_8034 ) ( not ( = ?AUTO_8033 ?AUTO_8034 ) ) ( not ( = ?AUTO_8028 ?AUTO_8033 ) ) ( OBJ-AT ?AUTO_8027 ?AUTO_8033 ) ( AIRPORT ?AUTO_8031 ) ( not ( = ?AUTO_8031 ?AUTO_8033 ) ) ( not ( = ?AUTO_8028 ?AUTO_8031 ) ) ( not ( = ?AUTO_8034 ?AUTO_8031 ) ) ( AIRPLANE-AT ?AUTO_8029 ?AUTO_8034 ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8029 ?AUTO_8034 ?AUTO_8031 )
      ( DELIVER-PKG ?AUTO_8027 ?AUTO_8028 )
      ( DELIVER-PKG-VERIFY ?AUTO_8027 ?AUTO_8028 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8229 - OBJ
      ?AUTO_8230 - LOCATION
    )
    :vars
    (
      ?AUTO_8237 - TRUCK
      ?AUTO_8232 - LOCATION
      ?AUTO_8238 - CITY
      ?AUTO_8231 - LOCATION
      ?AUTO_8235 - LOCATION
      ?AUTO_8236 - AIRPLANE
      ?AUTO_8239 - TRUCK
      ?AUTO_8234 - LOCATION
      ?AUTO_8233 - CITY
      ?AUTO_8240 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_8237 ?AUTO_8232 ) ( IN-CITY ?AUTO_8232 ?AUTO_8238 ) ( IN-CITY ?AUTO_8230 ?AUTO_8238 ) ( not ( = ?AUTO_8230 ?AUTO_8232 ) ) ( AIRPORT ?AUTO_8231 ) ( AIRPORT ?AUTO_8232 ) ( not ( = ?AUTO_8231 ?AUTO_8232 ) ) ( not ( = ?AUTO_8230 ?AUTO_8231 ) ) ( AIRPORT ?AUTO_8235 ) ( AIRPLANE-AT ?AUTO_8236 ?AUTO_8235 ) ( not ( = ?AUTO_8235 ?AUTO_8231 ) ) ( not ( = ?AUTO_8230 ?AUTO_8235 ) ) ( not ( = ?AUTO_8232 ?AUTO_8235 ) ) ( not ( = ?AUTO_8237 ?AUTO_8239 ) ) ( IN-CITY ?AUTO_8234 ?AUTO_8233 ) ( IN-CITY ?AUTO_8231 ?AUTO_8233 ) ( not ( = ?AUTO_8231 ?AUTO_8234 ) ) ( not ( = ?AUTO_8230 ?AUTO_8234 ) ) ( not ( = ?AUTO_8232 ?AUTO_8234 ) ) ( not ( = ?AUTO_8238 ?AUTO_8233 ) ) ( not ( = ?AUTO_8235 ?AUTO_8234 ) ) ( OBJ-AT ?AUTO_8229 ?AUTO_8234 ) ( TRUCK-AT ?AUTO_8239 ?AUTO_8240 ) ( IN-CITY ?AUTO_8240 ?AUTO_8233 ) ( not ( = ?AUTO_8234 ?AUTO_8240 ) ) ( not ( = ?AUTO_8230 ?AUTO_8240 ) ) ( not ( = ?AUTO_8232 ?AUTO_8240 ) ) ( not ( = ?AUTO_8231 ?AUTO_8240 ) ) ( not ( = ?AUTO_8235 ?AUTO_8240 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8239 ?AUTO_8240 ?AUTO_8234 ?AUTO_8233 )
      ( DELIVER-PKG ?AUTO_8229 ?AUTO_8230 )
      ( DELIVER-PKG-VERIFY ?AUTO_8229 ?AUTO_8230 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8483 - OBJ
      ?AUTO_8484 - LOCATION
    )
    :vars
    (
      ?AUTO_8487 - LOCATION
      ?AUTO_8485 - CITY
      ?AUTO_8486 - LOCATION
      ?AUTO_8488 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8487 ?AUTO_8485 ) ( IN-CITY ?AUTO_8484 ?AUTO_8485 ) ( not ( = ?AUTO_8484 ?AUTO_8487 ) ) ( OBJ-AT ?AUTO_8483 ?AUTO_8487 ) ( IN-CITY ?AUTO_8486 ?AUTO_8485 ) ( not ( = ?AUTO_8487 ?AUTO_8486 ) ) ( not ( = ?AUTO_8484 ?AUTO_8486 ) ) ( TRUCK-AT ?AUTO_8488 ?AUTO_8484 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_8488 ?AUTO_8484 ?AUTO_8486 ?AUTO_8485 )
      ( DELIVER-PKG ?AUTO_8483 ?AUTO_8484 )
      ( DELIVER-PKG-VERIFY ?AUTO_8483 ?AUTO_8484 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_8556 - OBJ
      ?AUTO_8557 - LOCATION
    )
    :vars
    (
      ?AUTO_8565 - LOCATION
      ?AUTO_8566 - CITY
      ?AUTO_8564 - LOCATION
      ?AUTO_8561 - TRUCK
      ?AUTO_8558 - LOCATION
      ?AUTO_8560 - TRUCK
      ?AUTO_8559 - LOCATION
      ?AUTO_8563 - CITY
      ?AUTO_8567 - LOCATION
      ?AUTO_8562 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_8565 ?AUTO_8566 ) ( IN-CITY ?AUTO_8557 ?AUTO_8566 ) ( not ( = ?AUTO_8557 ?AUTO_8565 ) ) ( IN-CITY ?AUTO_8564 ?AUTO_8566 ) ( not ( = ?AUTO_8565 ?AUTO_8564 ) ) ( not ( = ?AUTO_8557 ?AUTO_8564 ) ) ( TRUCK-AT ?AUTO_8561 ?AUTO_8557 ) ( AIRPORT ?AUTO_8558 ) ( AIRPORT ?AUTO_8565 ) ( not ( = ?AUTO_8558 ?AUTO_8565 ) ) ( not ( = ?AUTO_8557 ?AUTO_8558 ) ) ( not ( = ?AUTO_8564 ?AUTO_8558 ) ) ( not ( = ?AUTO_8561 ?AUTO_8560 ) ) ( IN-CITY ?AUTO_8559 ?AUTO_8563 ) ( IN-CITY ?AUTO_8558 ?AUTO_8563 ) ( not ( = ?AUTO_8558 ?AUTO_8559 ) ) ( not ( = ?AUTO_8557 ?AUTO_8559 ) ) ( not ( = ?AUTO_8565 ?AUTO_8559 ) ) ( not ( = ?AUTO_8566 ?AUTO_8563 ) ) ( not ( = ?AUTO_8564 ?AUTO_8559 ) ) ( OBJ-AT ?AUTO_8556 ?AUTO_8559 ) ( TRUCK-AT ?AUTO_8560 ?AUTO_8558 ) ( AIRPORT ?AUTO_8567 ) ( AIRPLANE-AT ?AUTO_8562 ?AUTO_8567 ) ( not ( = ?AUTO_8567 ?AUTO_8558 ) ) ( not ( = ?AUTO_8557 ?AUTO_8567 ) ) ( not ( = ?AUTO_8565 ?AUTO_8567 ) ) ( not ( = ?AUTO_8564 ?AUTO_8567 ) ) ( not ( = ?AUTO_8559 ?AUTO_8567 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_8562 ?AUTO_8567 ?AUTO_8558 )
      ( DELIVER-PKG ?AUTO_8556 ?AUTO_8557 )
      ( DELIVER-PKG-VERIFY ?AUTO_8556 ?AUTO_8557 ) )
  )

)

