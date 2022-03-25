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

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_263 - OBJ
      ?auto_262 - LOCATION
    )
    :vars
    (
      ?auto_264 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_264 ?auto_262 ) ( IN-TRUCK ?auto_263 ?auto_264 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_263 ?auto_264 ?auto_262 )
      ( DELIVER-1PKG-VERIFY ?auto_263 ?auto_262 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_270 - OBJ
      ?auto_269 - LOCATION
    )
    :vars
    (
      ?auto_271 - TRUCK
      ?auto_272 - LOCATION
      ?auto_273 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_270 ?auto_271 ) ( TRUCK-AT ?auto_271 ?auto_272 ) ( IN-CITY ?auto_272 ?auto_273 ) ( IN-CITY ?auto_269 ?auto_273 ) ( not ( = ?auto_269 ?auto_272 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_271 ?auto_272 ?auto_269 ?auto_273 )
      ( DELIVER-1PKG ?auto_270 ?auto_269 )
      ( DELIVER-1PKG-VERIFY ?auto_270 ?auto_269 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_281 - OBJ
      ?auto_280 - LOCATION
    )
    :vars
    (
      ?auto_283 - TRUCK
      ?auto_282 - LOCATION
      ?auto_284 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_283 ?auto_282 ) ( IN-CITY ?auto_282 ?auto_284 ) ( IN-CITY ?auto_280 ?auto_284 ) ( not ( = ?auto_280 ?auto_282 ) ) ( OBJ-AT ?auto_281 ?auto_282 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_281 ?auto_283 ?auto_282 )
      ( DELIVER-1PKG ?auto_281 ?auto_280 )
      ( DELIVER-1PKG-VERIFY ?auto_281 ?auto_280 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_292 - OBJ
      ?auto_291 - LOCATION
    )
    :vars
    (
      ?auto_294 - LOCATION
      ?auto_293 - CITY
      ?auto_295 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_294 ?auto_293 ) ( IN-CITY ?auto_291 ?auto_293 ) ( not ( = ?auto_291 ?auto_294 ) ) ( OBJ-AT ?auto_292 ?auto_294 ) ( TRUCK-AT ?auto_295 ?auto_291 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_295 ?auto_291 ?auto_294 ?auto_293 )
      ( DELIVER-1PKG ?auto_292 ?auto_291 )
      ( DELIVER-1PKG-VERIFY ?auto_292 ?auto_291 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_314 - OBJ
      ?auto_313 - LOCATION
    )
    :vars
    (
      ?auto_315 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_315 ?auto_313 ) ( IN-TRUCK ?auto_314 ?auto_315 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_314 ?auto_315 ?auto_313 )
      ( DELIVER-1PKG-VERIFY ?auto_314 ?auto_313 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_317 - OBJ
      ?auto_318 - OBJ
      ?auto_316 - LOCATION
    )
    :vars
    (
      ?auto_319 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_319 ?auto_316 ) ( IN-TRUCK ?auto_318 ?auto_319 ) ( OBJ-AT ?auto_317 ?auto_316 ) ( not ( = ?auto_317 ?auto_318 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_318 ?auto_316 )
      ( DELIVER-2PKG-VERIFY ?auto_317 ?auto_318 ?auto_316 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_321 - OBJ
      ?auto_322 - OBJ
      ?auto_320 - LOCATION
    )
    :vars
    (
      ?auto_323 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_323 ?auto_320 ) ( IN-TRUCK ?auto_321 ?auto_323 ) ( OBJ-AT ?auto_322 ?auto_320 ) ( not ( = ?auto_321 ?auto_322 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_321 ?auto_320 )
      ( DELIVER-2PKG-VERIFY ?auto_321 ?auto_322 ?auto_320 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_329 - OBJ
      ?auto_328 - LOCATION
    )
    :vars
    (
      ?auto_330 - TRUCK
      ?auto_331 - LOCATION
      ?auto_332 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_329 ?auto_330 ) ( TRUCK-AT ?auto_330 ?auto_331 ) ( IN-CITY ?auto_331 ?auto_332 ) ( IN-CITY ?auto_328 ?auto_332 ) ( not ( = ?auto_328 ?auto_331 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_330 ?auto_331 ?auto_328 ?auto_332 )
      ( DELIVER-1PKG ?auto_329 ?auto_328 )
      ( DELIVER-1PKG-VERIFY ?auto_329 ?auto_328 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_334 - OBJ
      ?auto_335 - OBJ
      ?auto_333 - LOCATION
    )
    :vars
    (
      ?auto_338 - TRUCK
      ?auto_337 - LOCATION
      ?auto_336 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_335 ?auto_338 ) ( TRUCK-AT ?auto_338 ?auto_337 ) ( IN-CITY ?auto_337 ?auto_336 ) ( IN-CITY ?auto_333 ?auto_336 ) ( not ( = ?auto_333 ?auto_337 ) ) ( OBJ-AT ?auto_334 ?auto_333 ) ( not ( = ?auto_334 ?auto_335 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_335 ?auto_333 )
      ( DELIVER-2PKG-VERIFY ?auto_334 ?auto_335 ?auto_333 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_340 - OBJ
      ?auto_341 - OBJ
      ?auto_339 - LOCATION
    )
    :vars
    (
      ?auto_344 - TRUCK
      ?auto_343 - LOCATION
      ?auto_342 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_340 ?auto_344 ) ( TRUCK-AT ?auto_344 ?auto_343 ) ( IN-CITY ?auto_343 ?auto_342 ) ( IN-CITY ?auto_339 ?auto_342 ) ( not ( = ?auto_339 ?auto_343 ) ) ( OBJ-AT ?auto_341 ?auto_339 ) ( not ( = ?auto_341 ?auto_340 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_341 ?auto_340 ?auto_339 )
      ( DELIVER-2PKG-VERIFY ?auto_340 ?auto_341 ?auto_339 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_353 - OBJ
      ?auto_352 - LOCATION
    )
    :vars
    (
      ?auto_356 - TRUCK
      ?auto_355 - LOCATION
      ?auto_354 - CITY
      ?auto_357 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_356 ?auto_355 ) ( IN-CITY ?auto_355 ?auto_354 ) ( IN-CITY ?auto_352 ?auto_354 ) ( not ( = ?auto_352 ?auto_355 ) ) ( OBJ-AT ?auto_357 ?auto_352 ) ( not ( = ?auto_357 ?auto_353 ) ) ( OBJ-AT ?auto_353 ?auto_355 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_353 ?auto_356 ?auto_355 )
      ( DELIVER-2PKG ?auto_357 ?auto_353 ?auto_352 )
      ( DELIVER-1PKG-VERIFY ?auto_353 ?auto_352 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_359 - OBJ
      ?auto_360 - OBJ
      ?auto_358 - LOCATION
    )
    :vars
    (
      ?auto_362 - TRUCK
      ?auto_361 - LOCATION
      ?auto_363 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_362 ?auto_361 ) ( IN-CITY ?auto_361 ?auto_363 ) ( IN-CITY ?auto_358 ?auto_363 ) ( not ( = ?auto_358 ?auto_361 ) ) ( OBJ-AT ?auto_359 ?auto_358 ) ( not ( = ?auto_359 ?auto_360 ) ) ( OBJ-AT ?auto_360 ?auto_361 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_360 ?auto_358 )
      ( DELIVER-2PKG-VERIFY ?auto_359 ?auto_360 ?auto_358 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_365 - OBJ
      ?auto_366 - OBJ
      ?auto_364 - LOCATION
    )
    :vars
    (
      ?auto_369 - TRUCK
      ?auto_368 - LOCATION
      ?auto_367 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_369 ?auto_368 ) ( IN-CITY ?auto_368 ?auto_367 ) ( IN-CITY ?auto_364 ?auto_367 ) ( not ( = ?auto_364 ?auto_368 ) ) ( OBJ-AT ?auto_366 ?auto_364 ) ( not ( = ?auto_366 ?auto_365 ) ) ( OBJ-AT ?auto_365 ?auto_368 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_366 ?auto_365 ?auto_364 )
      ( DELIVER-2PKG-VERIFY ?auto_365 ?auto_366 ?auto_364 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_378 - OBJ
      ?auto_377 - LOCATION
    )
    :vars
    (
      ?auto_381 - LOCATION
      ?auto_380 - CITY
      ?auto_379 - OBJ
      ?auto_382 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_381 ?auto_380 ) ( IN-CITY ?auto_377 ?auto_380 ) ( not ( = ?auto_377 ?auto_381 ) ) ( OBJ-AT ?auto_379 ?auto_377 ) ( not ( = ?auto_379 ?auto_378 ) ) ( OBJ-AT ?auto_378 ?auto_381 ) ( TRUCK-AT ?auto_382 ?auto_377 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_382 ?auto_377 ?auto_381 ?auto_380 )
      ( DELIVER-2PKG ?auto_379 ?auto_378 ?auto_377 )
      ( DELIVER-1PKG-VERIFY ?auto_378 ?auto_377 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_384 - OBJ
      ?auto_385 - OBJ
      ?auto_383 - LOCATION
    )
    :vars
    (
      ?auto_386 - LOCATION
      ?auto_388 - CITY
      ?auto_387 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_386 ?auto_388 ) ( IN-CITY ?auto_383 ?auto_388 ) ( not ( = ?auto_383 ?auto_386 ) ) ( OBJ-AT ?auto_384 ?auto_383 ) ( not ( = ?auto_384 ?auto_385 ) ) ( OBJ-AT ?auto_385 ?auto_386 ) ( TRUCK-AT ?auto_387 ?auto_383 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_385 ?auto_383 )
      ( DELIVER-2PKG-VERIFY ?auto_384 ?auto_385 ?auto_383 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_390 - OBJ
      ?auto_391 - OBJ
      ?auto_389 - LOCATION
    )
    :vars
    (
      ?auto_394 - LOCATION
      ?auto_392 - CITY
      ?auto_393 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_394 ?auto_392 ) ( IN-CITY ?auto_389 ?auto_392 ) ( not ( = ?auto_389 ?auto_394 ) ) ( OBJ-AT ?auto_391 ?auto_389 ) ( not ( = ?auto_391 ?auto_390 ) ) ( OBJ-AT ?auto_390 ?auto_394 ) ( TRUCK-AT ?auto_393 ?auto_389 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_391 ?auto_390 ?auto_389 )
      ( DELIVER-2PKG-VERIFY ?auto_390 ?auto_391 ?auto_389 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_403 - OBJ
      ?auto_402 - LOCATION
    )
    :vars
    (
      ?auto_407 - LOCATION
      ?auto_404 - CITY
      ?auto_405 - OBJ
      ?auto_406 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_407 ?auto_404 ) ( IN-CITY ?auto_402 ?auto_404 ) ( not ( = ?auto_402 ?auto_407 ) ) ( not ( = ?auto_405 ?auto_403 ) ) ( OBJ-AT ?auto_403 ?auto_407 ) ( TRUCK-AT ?auto_406 ?auto_402 ) ( IN-TRUCK ?auto_405 ?auto_406 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_405 ?auto_402 )
      ( DELIVER-2PKG ?auto_405 ?auto_403 ?auto_402 )
      ( DELIVER-1PKG-VERIFY ?auto_403 ?auto_402 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_409 - OBJ
      ?auto_410 - OBJ
      ?auto_408 - LOCATION
    )
    :vars
    (
      ?auto_413 - LOCATION
      ?auto_412 - CITY
      ?auto_411 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_413 ?auto_412 ) ( IN-CITY ?auto_408 ?auto_412 ) ( not ( = ?auto_408 ?auto_413 ) ) ( not ( = ?auto_409 ?auto_410 ) ) ( OBJ-AT ?auto_410 ?auto_413 ) ( TRUCK-AT ?auto_411 ?auto_408 ) ( IN-TRUCK ?auto_409 ?auto_411 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_410 ?auto_408 )
      ( DELIVER-2PKG-VERIFY ?auto_409 ?auto_410 ?auto_408 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_415 - OBJ
      ?auto_416 - OBJ
      ?auto_414 - LOCATION
    )
    :vars
    (
      ?auto_417 - LOCATION
      ?auto_419 - CITY
      ?auto_418 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_417 ?auto_419 ) ( IN-CITY ?auto_414 ?auto_419 ) ( not ( = ?auto_414 ?auto_417 ) ) ( not ( = ?auto_416 ?auto_415 ) ) ( OBJ-AT ?auto_415 ?auto_417 ) ( TRUCK-AT ?auto_418 ?auto_414 ) ( IN-TRUCK ?auto_416 ?auto_418 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_416 ?auto_415 ?auto_414 )
      ( DELIVER-2PKG-VERIFY ?auto_415 ?auto_416 ?auto_414 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_428 - OBJ
      ?auto_427 - LOCATION
    )
    :vars
    (
      ?auto_429 - LOCATION
      ?auto_432 - CITY
      ?auto_430 - OBJ
      ?auto_431 - TRUCK
      ?auto_433 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_429 ?auto_432 ) ( IN-CITY ?auto_427 ?auto_432 ) ( not ( = ?auto_427 ?auto_429 ) ) ( not ( = ?auto_430 ?auto_428 ) ) ( OBJ-AT ?auto_428 ?auto_429 ) ( IN-TRUCK ?auto_430 ?auto_431 ) ( TRUCK-AT ?auto_431 ?auto_433 ) ( IN-CITY ?auto_433 ?auto_432 ) ( not ( = ?auto_427 ?auto_433 ) ) ( not ( = ?auto_429 ?auto_433 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_431 ?auto_433 ?auto_427 ?auto_432 )
      ( DELIVER-2PKG ?auto_430 ?auto_428 ?auto_427 )
      ( DELIVER-1PKG-VERIFY ?auto_428 ?auto_427 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_435 - OBJ
      ?auto_436 - OBJ
      ?auto_434 - LOCATION
    )
    :vars
    (
      ?auto_439 - LOCATION
      ?auto_440 - CITY
      ?auto_437 - TRUCK
      ?auto_438 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_439 ?auto_440 ) ( IN-CITY ?auto_434 ?auto_440 ) ( not ( = ?auto_434 ?auto_439 ) ) ( not ( = ?auto_435 ?auto_436 ) ) ( OBJ-AT ?auto_436 ?auto_439 ) ( IN-TRUCK ?auto_435 ?auto_437 ) ( TRUCK-AT ?auto_437 ?auto_438 ) ( IN-CITY ?auto_438 ?auto_440 ) ( not ( = ?auto_434 ?auto_438 ) ) ( not ( = ?auto_439 ?auto_438 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_436 ?auto_434 )
      ( DELIVER-2PKG-VERIFY ?auto_435 ?auto_436 ?auto_434 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_442 - OBJ
      ?auto_443 - OBJ
      ?auto_441 - LOCATION
    )
    :vars
    (
      ?auto_446 - LOCATION
      ?auto_445 - CITY
      ?auto_444 - TRUCK
      ?auto_447 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_446 ?auto_445 ) ( IN-CITY ?auto_441 ?auto_445 ) ( not ( = ?auto_441 ?auto_446 ) ) ( not ( = ?auto_443 ?auto_442 ) ) ( OBJ-AT ?auto_442 ?auto_446 ) ( IN-TRUCK ?auto_443 ?auto_444 ) ( TRUCK-AT ?auto_444 ?auto_447 ) ( IN-CITY ?auto_447 ?auto_445 ) ( not ( = ?auto_441 ?auto_447 ) ) ( not ( = ?auto_446 ?auto_447 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_443 ?auto_442 ?auto_441 )
      ( DELIVER-2PKG-VERIFY ?auto_442 ?auto_443 ?auto_441 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_457 - OBJ
      ?auto_456 - LOCATION
    )
    :vars
    (
      ?auto_460 - LOCATION
      ?auto_459 - CITY
      ?auto_462 - OBJ
      ?auto_458 - TRUCK
      ?auto_461 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_460 ?auto_459 ) ( IN-CITY ?auto_456 ?auto_459 ) ( not ( = ?auto_456 ?auto_460 ) ) ( not ( = ?auto_462 ?auto_457 ) ) ( OBJ-AT ?auto_457 ?auto_460 ) ( TRUCK-AT ?auto_458 ?auto_461 ) ( IN-CITY ?auto_461 ?auto_459 ) ( not ( = ?auto_456 ?auto_461 ) ) ( not ( = ?auto_460 ?auto_461 ) ) ( OBJ-AT ?auto_462 ?auto_461 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_462 ?auto_458 ?auto_461 )
      ( DELIVER-2PKG ?auto_462 ?auto_457 ?auto_456 )
      ( DELIVER-1PKG-VERIFY ?auto_457 ?auto_456 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_464 - OBJ
      ?auto_465 - OBJ
      ?auto_463 - LOCATION
    )
    :vars
    (
      ?auto_467 - LOCATION
      ?auto_468 - CITY
      ?auto_469 - TRUCK
      ?auto_466 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_467 ?auto_468 ) ( IN-CITY ?auto_463 ?auto_468 ) ( not ( = ?auto_463 ?auto_467 ) ) ( not ( = ?auto_464 ?auto_465 ) ) ( OBJ-AT ?auto_465 ?auto_467 ) ( TRUCK-AT ?auto_469 ?auto_466 ) ( IN-CITY ?auto_466 ?auto_468 ) ( not ( = ?auto_463 ?auto_466 ) ) ( not ( = ?auto_467 ?auto_466 ) ) ( OBJ-AT ?auto_464 ?auto_466 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_465 ?auto_463 )
      ( DELIVER-2PKG-VERIFY ?auto_464 ?auto_465 ?auto_463 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_471 - OBJ
      ?auto_472 - OBJ
      ?auto_470 - LOCATION
    )
    :vars
    (
      ?auto_475 - LOCATION
      ?auto_474 - CITY
      ?auto_476 - TRUCK
      ?auto_473 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_475 ?auto_474 ) ( IN-CITY ?auto_470 ?auto_474 ) ( not ( = ?auto_470 ?auto_475 ) ) ( not ( = ?auto_472 ?auto_471 ) ) ( OBJ-AT ?auto_471 ?auto_475 ) ( TRUCK-AT ?auto_476 ?auto_473 ) ( IN-CITY ?auto_473 ?auto_474 ) ( not ( = ?auto_470 ?auto_473 ) ) ( not ( = ?auto_475 ?auto_473 ) ) ( OBJ-AT ?auto_472 ?auto_473 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_472 ?auto_471 ?auto_470 )
      ( DELIVER-2PKG-VERIFY ?auto_471 ?auto_472 ?auto_470 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_486 - OBJ
      ?auto_485 - LOCATION
    )
    :vars
    (
      ?auto_489 - LOCATION
      ?auto_488 - CITY
      ?auto_491 - OBJ
      ?auto_487 - LOCATION
      ?auto_490 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_489 ?auto_488 ) ( IN-CITY ?auto_485 ?auto_488 ) ( not ( = ?auto_485 ?auto_489 ) ) ( not ( = ?auto_491 ?auto_486 ) ) ( OBJ-AT ?auto_486 ?auto_489 ) ( IN-CITY ?auto_487 ?auto_488 ) ( not ( = ?auto_485 ?auto_487 ) ) ( not ( = ?auto_489 ?auto_487 ) ) ( OBJ-AT ?auto_491 ?auto_487 ) ( TRUCK-AT ?auto_490 ?auto_485 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_490 ?auto_485 ?auto_487 ?auto_488 )
      ( DELIVER-2PKG ?auto_491 ?auto_486 ?auto_485 )
      ( DELIVER-1PKG-VERIFY ?auto_486 ?auto_485 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_493 - OBJ
      ?auto_494 - OBJ
      ?auto_492 - LOCATION
    )
    :vars
    (
      ?auto_497 - LOCATION
      ?auto_498 - CITY
      ?auto_495 - LOCATION
      ?auto_496 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_497 ?auto_498 ) ( IN-CITY ?auto_492 ?auto_498 ) ( not ( = ?auto_492 ?auto_497 ) ) ( not ( = ?auto_493 ?auto_494 ) ) ( OBJ-AT ?auto_494 ?auto_497 ) ( IN-CITY ?auto_495 ?auto_498 ) ( not ( = ?auto_492 ?auto_495 ) ) ( not ( = ?auto_497 ?auto_495 ) ) ( OBJ-AT ?auto_493 ?auto_495 ) ( TRUCK-AT ?auto_496 ?auto_492 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_494 ?auto_492 )
      ( DELIVER-2PKG-VERIFY ?auto_493 ?auto_494 ?auto_492 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_500 - OBJ
      ?auto_501 - OBJ
      ?auto_499 - LOCATION
    )
    :vars
    (
      ?auto_502 - LOCATION
      ?auto_505 - CITY
      ?auto_503 - LOCATION
      ?auto_504 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_502 ?auto_505 ) ( IN-CITY ?auto_499 ?auto_505 ) ( not ( = ?auto_499 ?auto_502 ) ) ( not ( = ?auto_501 ?auto_500 ) ) ( OBJ-AT ?auto_500 ?auto_502 ) ( IN-CITY ?auto_503 ?auto_505 ) ( not ( = ?auto_499 ?auto_503 ) ) ( not ( = ?auto_502 ?auto_503 ) ) ( OBJ-AT ?auto_501 ?auto_503 ) ( TRUCK-AT ?auto_504 ?auto_499 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_501 ?auto_500 ?auto_499 )
      ( DELIVER-2PKG-VERIFY ?auto_500 ?auto_501 ?auto_499 ) )
  )

)

