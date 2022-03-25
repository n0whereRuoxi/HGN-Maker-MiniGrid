( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_254 - OBJ
      ?auto_253 - LOCATION
    )
    :vars
    (
      ?auto_255 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_255 ?auto_253 ) ( IN-TRUCK ?auto_254 ?auto_255 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_254 ?auto_255 ?auto_253 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_261 - OBJ
      ?auto_260 - LOCATION
    )
    :vars
    (
      ?auto_262 - TRUCK
      ?auto_263 - LOCATION
      ?auto_264 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_261 ?auto_262 ) ( TRUCK-AT ?auto_262 ?auto_263 ) ( IN-CITY ?auto_263 ?auto_264 ) ( IN-CITY ?auto_260 ?auto_264 ) ( not ( = ?auto_260 ?auto_263 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_262 ?auto_263 ?auto_260 ?auto_264 )
      ( DELIVER-1PKG ?auto_261 ?auto_260 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_272 - OBJ
      ?auto_271 - LOCATION
    )
    :vars
    (
      ?auto_275 - TRUCK
      ?auto_274 - LOCATION
      ?auto_273 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_275 ?auto_274 ) ( IN-CITY ?auto_274 ?auto_273 ) ( IN-CITY ?auto_271 ?auto_273 ) ( not ( = ?auto_271 ?auto_274 ) ) ( OBJ-AT ?auto_272 ?auto_274 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_272 ?auto_275 ?auto_274 )
      ( DELIVER-1PKG ?auto_272 ?auto_271 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_283 - OBJ
      ?auto_282 - LOCATION
    )
    :vars
    (
      ?auto_285 - LOCATION
      ?auto_286 - CITY
      ?auto_284 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_285 ?auto_286 ) ( IN-CITY ?auto_282 ?auto_286 ) ( not ( = ?auto_282 ?auto_285 ) ) ( OBJ-AT ?auto_283 ?auto_285 ) ( TRUCK-AT ?auto_284 ?auto_282 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_284 ?auto_282 ?auto_285 ?auto_286 )
      ( DELIVER-1PKG ?auto_283 ?auto_282 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_308 - OBJ
      ?auto_309 - OBJ
      ?auto_307 - LOCATION
    )
    :vars
    (
      ?auto_310 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_310 ?auto_307 ) ( IN-TRUCK ?auto_309 ?auto_310 ) ( OBJ-AT ?auto_308 ?auto_307 ) ( not ( = ?auto_308 ?auto_309 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_309 ?auto_307 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_312 - OBJ
      ?auto_313 - OBJ
      ?auto_311 - LOCATION
    )
    :vars
    (
      ?auto_314 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_314 ?auto_311 ) ( IN-TRUCK ?auto_312 ?auto_314 ) ( OBJ-AT ?auto_313 ?auto_311 ) ( not ( = ?auto_312 ?auto_313 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_312 ?auto_311 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_325 - OBJ
      ?auto_326 - OBJ
      ?auto_324 - LOCATION
    )
    :vars
    (
      ?auto_329 - TRUCK
      ?auto_327 - LOCATION
      ?auto_328 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_326 ?auto_329 ) ( TRUCK-AT ?auto_329 ?auto_327 ) ( IN-CITY ?auto_327 ?auto_328 ) ( IN-CITY ?auto_324 ?auto_328 ) ( not ( = ?auto_324 ?auto_327 ) ) ( OBJ-AT ?auto_325 ?auto_324 ) ( not ( = ?auto_325 ?auto_326 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_326 ?auto_324 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_331 - OBJ
      ?auto_332 - OBJ
      ?auto_330 - LOCATION
    )
    :vars
    (
      ?auto_334 - TRUCK
      ?auto_333 - LOCATION
      ?auto_335 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_331 ?auto_334 ) ( TRUCK-AT ?auto_334 ?auto_333 ) ( IN-CITY ?auto_333 ?auto_335 ) ( IN-CITY ?auto_330 ?auto_335 ) ( not ( = ?auto_330 ?auto_333 ) ) ( OBJ-AT ?auto_332 ?auto_330 ) ( not ( = ?auto_332 ?auto_331 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_332 ?auto_331 ?auto_330 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_344 - OBJ
      ?auto_343 - LOCATION
    )
    :vars
    (
      ?auto_347 - TRUCK
      ?auto_346 - LOCATION
      ?auto_348 - CITY
      ?auto_345 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_347 ?auto_346 ) ( IN-CITY ?auto_346 ?auto_348 ) ( IN-CITY ?auto_343 ?auto_348 ) ( not ( = ?auto_343 ?auto_346 ) ) ( OBJ-AT ?auto_345 ?auto_343 ) ( not ( = ?auto_345 ?auto_344 ) ) ( OBJ-AT ?auto_344 ?auto_346 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_344 ?auto_347 ?auto_346 )
      ( DELIVER-2PKG ?auto_345 ?auto_344 ?auto_343 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_350 - OBJ
      ?auto_351 - OBJ
      ?auto_349 - LOCATION
    )
    :vars
    (
      ?auto_353 - TRUCK
      ?auto_354 - LOCATION
      ?auto_352 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_353 ?auto_354 ) ( IN-CITY ?auto_354 ?auto_352 ) ( IN-CITY ?auto_349 ?auto_352 ) ( not ( = ?auto_349 ?auto_354 ) ) ( OBJ-AT ?auto_350 ?auto_349 ) ( not ( = ?auto_350 ?auto_351 ) ) ( OBJ-AT ?auto_351 ?auto_354 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_351 ?auto_349 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_356 - OBJ
      ?auto_357 - OBJ
      ?auto_355 - LOCATION
    )
    :vars
    (
      ?auto_360 - TRUCK
      ?auto_359 - LOCATION
      ?auto_358 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_360 ?auto_359 ) ( IN-CITY ?auto_359 ?auto_358 ) ( IN-CITY ?auto_355 ?auto_358 ) ( not ( = ?auto_355 ?auto_359 ) ) ( OBJ-AT ?auto_357 ?auto_355 ) ( not ( = ?auto_357 ?auto_356 ) ) ( OBJ-AT ?auto_356 ?auto_359 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_357 ?auto_356 ?auto_355 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_369 - OBJ
      ?auto_368 - LOCATION
    )
    :vars
    (
      ?auto_372 - LOCATION
      ?auto_370 - CITY
      ?auto_371 - OBJ
      ?auto_373 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_372 ?auto_370 ) ( IN-CITY ?auto_368 ?auto_370 ) ( not ( = ?auto_368 ?auto_372 ) ) ( OBJ-AT ?auto_371 ?auto_368 ) ( not ( = ?auto_371 ?auto_369 ) ) ( OBJ-AT ?auto_369 ?auto_372 ) ( TRUCK-AT ?auto_373 ?auto_368 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_373 ?auto_368 ?auto_372 ?auto_370 )
      ( DELIVER-2PKG ?auto_371 ?auto_369 ?auto_368 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_375 - OBJ
      ?auto_376 - OBJ
      ?auto_374 - LOCATION
    )
    :vars
    (
      ?auto_379 - LOCATION
      ?auto_377 - CITY
      ?auto_378 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_379 ?auto_377 ) ( IN-CITY ?auto_374 ?auto_377 ) ( not ( = ?auto_374 ?auto_379 ) ) ( OBJ-AT ?auto_375 ?auto_374 ) ( not ( = ?auto_375 ?auto_376 ) ) ( OBJ-AT ?auto_376 ?auto_379 ) ( TRUCK-AT ?auto_378 ?auto_374 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_376 ?auto_374 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_381 - OBJ
      ?auto_382 - OBJ
      ?auto_380 - LOCATION
    )
    :vars
    (
      ?auto_385 - LOCATION
      ?auto_383 - CITY
      ?auto_384 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_385 ?auto_383 ) ( IN-CITY ?auto_380 ?auto_383 ) ( not ( = ?auto_380 ?auto_385 ) ) ( OBJ-AT ?auto_382 ?auto_380 ) ( not ( = ?auto_382 ?auto_381 ) ) ( OBJ-AT ?auto_381 ?auto_385 ) ( TRUCK-AT ?auto_384 ?auto_380 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_382 ?auto_381 ?auto_380 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_394 - OBJ
      ?auto_393 - LOCATION
    )
    :vars
    (
      ?auto_398 - LOCATION
      ?auto_395 - CITY
      ?auto_396 - OBJ
      ?auto_397 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_398 ?auto_395 ) ( IN-CITY ?auto_393 ?auto_395 ) ( not ( = ?auto_393 ?auto_398 ) ) ( not ( = ?auto_396 ?auto_394 ) ) ( OBJ-AT ?auto_394 ?auto_398 ) ( TRUCK-AT ?auto_397 ?auto_393 ) ( IN-TRUCK ?auto_396 ?auto_397 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_396 ?auto_393 )
      ( DELIVER-2PKG ?auto_396 ?auto_394 ?auto_393 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_400 - OBJ
      ?auto_401 - OBJ
      ?auto_399 - LOCATION
    )
    :vars
    (
      ?auto_404 - LOCATION
      ?auto_402 - CITY
      ?auto_403 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_404 ?auto_402 ) ( IN-CITY ?auto_399 ?auto_402 ) ( not ( = ?auto_399 ?auto_404 ) ) ( not ( = ?auto_400 ?auto_401 ) ) ( OBJ-AT ?auto_401 ?auto_404 ) ( TRUCK-AT ?auto_403 ?auto_399 ) ( IN-TRUCK ?auto_400 ?auto_403 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_401 ?auto_399 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_406 - OBJ
      ?auto_407 - OBJ
      ?auto_405 - LOCATION
    )
    :vars
    (
      ?auto_409 - LOCATION
      ?auto_408 - CITY
      ?auto_410 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_409 ?auto_408 ) ( IN-CITY ?auto_405 ?auto_408 ) ( not ( = ?auto_405 ?auto_409 ) ) ( not ( = ?auto_407 ?auto_406 ) ) ( OBJ-AT ?auto_406 ?auto_409 ) ( TRUCK-AT ?auto_410 ?auto_405 ) ( IN-TRUCK ?auto_407 ?auto_410 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_407 ?auto_406 ?auto_405 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_419 - OBJ
      ?auto_418 - LOCATION
    )
    :vars
    (
      ?auto_421 - LOCATION
      ?auto_420 - CITY
      ?auto_423 - OBJ
      ?auto_422 - TRUCK
      ?auto_424 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_421 ?auto_420 ) ( IN-CITY ?auto_418 ?auto_420 ) ( not ( = ?auto_418 ?auto_421 ) ) ( not ( = ?auto_423 ?auto_419 ) ) ( OBJ-AT ?auto_419 ?auto_421 ) ( IN-TRUCK ?auto_423 ?auto_422 ) ( TRUCK-AT ?auto_422 ?auto_424 ) ( IN-CITY ?auto_424 ?auto_420 ) ( not ( = ?auto_418 ?auto_424 ) ) ( not ( = ?auto_421 ?auto_424 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_422 ?auto_424 ?auto_418 ?auto_420 )
      ( DELIVER-2PKG ?auto_423 ?auto_419 ?auto_418 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_426 - OBJ
      ?auto_427 - OBJ
      ?auto_425 - LOCATION
    )
    :vars
    (
      ?auto_429 - LOCATION
      ?auto_431 - CITY
      ?auto_428 - TRUCK
      ?auto_430 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_429 ?auto_431 ) ( IN-CITY ?auto_425 ?auto_431 ) ( not ( = ?auto_425 ?auto_429 ) ) ( not ( = ?auto_426 ?auto_427 ) ) ( OBJ-AT ?auto_427 ?auto_429 ) ( IN-TRUCK ?auto_426 ?auto_428 ) ( TRUCK-AT ?auto_428 ?auto_430 ) ( IN-CITY ?auto_430 ?auto_431 ) ( not ( = ?auto_425 ?auto_430 ) ) ( not ( = ?auto_429 ?auto_430 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_427 ?auto_425 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_433 - OBJ
      ?auto_434 - OBJ
      ?auto_432 - LOCATION
    )
    :vars
    (
      ?auto_437 - LOCATION
      ?auto_438 - CITY
      ?auto_436 - TRUCK
      ?auto_435 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_437 ?auto_438 ) ( IN-CITY ?auto_432 ?auto_438 ) ( not ( = ?auto_432 ?auto_437 ) ) ( not ( = ?auto_434 ?auto_433 ) ) ( OBJ-AT ?auto_433 ?auto_437 ) ( IN-TRUCK ?auto_434 ?auto_436 ) ( TRUCK-AT ?auto_436 ?auto_435 ) ( IN-CITY ?auto_435 ?auto_438 ) ( not ( = ?auto_432 ?auto_435 ) ) ( not ( = ?auto_437 ?auto_435 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_434 ?auto_433 ?auto_432 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_448 - OBJ
      ?auto_447 - LOCATION
    )
    :vars
    (
      ?auto_452 - LOCATION
      ?auto_453 - CITY
      ?auto_449 - OBJ
      ?auto_451 - TRUCK
      ?auto_450 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_452 ?auto_453 ) ( IN-CITY ?auto_447 ?auto_453 ) ( not ( = ?auto_447 ?auto_452 ) ) ( not ( = ?auto_449 ?auto_448 ) ) ( OBJ-AT ?auto_448 ?auto_452 ) ( TRUCK-AT ?auto_451 ?auto_450 ) ( IN-CITY ?auto_450 ?auto_453 ) ( not ( = ?auto_447 ?auto_450 ) ) ( not ( = ?auto_452 ?auto_450 ) ) ( OBJ-AT ?auto_449 ?auto_450 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_449 ?auto_451 ?auto_450 )
      ( DELIVER-2PKG ?auto_449 ?auto_448 ?auto_447 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_455 - OBJ
      ?auto_456 - OBJ
      ?auto_454 - LOCATION
    )
    :vars
    (
      ?auto_460 - LOCATION
      ?auto_459 - CITY
      ?auto_458 - TRUCK
      ?auto_457 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_460 ?auto_459 ) ( IN-CITY ?auto_454 ?auto_459 ) ( not ( = ?auto_454 ?auto_460 ) ) ( not ( = ?auto_455 ?auto_456 ) ) ( OBJ-AT ?auto_456 ?auto_460 ) ( TRUCK-AT ?auto_458 ?auto_457 ) ( IN-CITY ?auto_457 ?auto_459 ) ( not ( = ?auto_454 ?auto_457 ) ) ( not ( = ?auto_460 ?auto_457 ) ) ( OBJ-AT ?auto_455 ?auto_457 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_456 ?auto_454 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_462 - OBJ
      ?auto_463 - OBJ
      ?auto_461 - LOCATION
    )
    :vars
    (
      ?auto_467 - LOCATION
      ?auto_465 - CITY
      ?auto_464 - TRUCK
      ?auto_466 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_467 ?auto_465 ) ( IN-CITY ?auto_461 ?auto_465 ) ( not ( = ?auto_461 ?auto_467 ) ) ( not ( = ?auto_463 ?auto_462 ) ) ( OBJ-AT ?auto_462 ?auto_467 ) ( TRUCK-AT ?auto_464 ?auto_466 ) ( IN-CITY ?auto_466 ?auto_465 ) ( not ( = ?auto_461 ?auto_466 ) ) ( not ( = ?auto_467 ?auto_466 ) ) ( OBJ-AT ?auto_463 ?auto_466 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_463 ?auto_462 ?auto_461 ) )
  )

)

