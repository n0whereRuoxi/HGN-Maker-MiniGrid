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
    ( ( !UNLOAD-TRUCK ?auto_263 ?auto_264 ?auto_262 ) )
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
      ( DELIVER-1PKG ?auto_270 ?auto_269 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_281 - OBJ
      ?auto_280 - LOCATION
    )
    :vars
    (
      ?auto_282 - TRUCK
      ?auto_284 - LOCATION
      ?auto_283 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_282 ?auto_284 ) ( IN-CITY ?auto_284 ?auto_283 ) ( IN-CITY ?auto_280 ?auto_283 ) ( not ( = ?auto_280 ?auto_284 ) ) ( OBJ-AT ?auto_281 ?auto_284 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_281 ?auto_282 ?auto_284 )
      ( DELIVER-1PKG ?auto_281 ?auto_280 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_292 - OBJ
      ?auto_291 - LOCATION
    )
    :vars
    (
      ?auto_295 - LOCATION
      ?auto_293 - CITY
      ?auto_294 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_295 ?auto_293 ) ( IN-CITY ?auto_291 ?auto_293 ) ( not ( = ?auto_291 ?auto_295 ) ) ( OBJ-AT ?auto_292 ?auto_295 ) ( TRUCK-AT ?auto_294 ?auto_291 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_294 ?auto_291 ?auto_295 ?auto_293 )
      ( DELIVER-1PKG ?auto_292 ?auto_291 ) )
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
    ( ( !UNLOAD-TRUCK ?auto_314 ?auto_315 ?auto_313 ) )
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
    ( ( DELIVER-1PKG ?auto_318 ?auto_316 ) )
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
    ( ( DELIVER-1PKG ?auto_321 ?auto_320 ) )
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
      ( DELIVER-1PKG ?auto_329 ?auto_328 ) )
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
      ?auto_337 - TRUCK
      ?auto_338 - LOCATION
      ?auto_336 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_335 ?auto_337 ) ( TRUCK-AT ?auto_337 ?auto_338 ) ( IN-CITY ?auto_338 ?auto_336 ) ( IN-CITY ?auto_333 ?auto_336 ) ( not ( = ?auto_333 ?auto_338 ) ) ( OBJ-AT ?auto_334 ?auto_333 ) ( not ( = ?auto_334 ?auto_335 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_335 ?auto_333 ) )
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
      ?auto_343 - TRUCK
      ?auto_342 - LOCATION
      ?auto_344 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_340 ?auto_343 ) ( TRUCK-AT ?auto_343 ?auto_342 ) ( IN-CITY ?auto_342 ?auto_344 ) ( IN-CITY ?auto_339 ?auto_344 ) ( not ( = ?auto_339 ?auto_342 ) ) ( OBJ-AT ?auto_341 ?auto_339 ) ( not ( = ?auto_341 ?auto_340 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_341 ?auto_340 ?auto_339 ) )
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
      ?auto_357 - CITY
      ?auto_354 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_356 ?auto_355 ) ( IN-CITY ?auto_355 ?auto_357 ) ( IN-CITY ?auto_352 ?auto_357 ) ( not ( = ?auto_352 ?auto_355 ) ) ( OBJ-AT ?auto_354 ?auto_352 ) ( not ( = ?auto_354 ?auto_353 ) ) ( OBJ-AT ?auto_353 ?auto_355 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_353 ?auto_356 ?auto_355 )
      ( DELIVER-2PKG ?auto_354 ?auto_353 ?auto_352 ) )
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
      ?auto_363 - TRUCK
      ?auto_361 - LOCATION
      ?auto_362 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_363 ?auto_361 ) ( IN-CITY ?auto_361 ?auto_362 ) ( IN-CITY ?auto_358 ?auto_362 ) ( not ( = ?auto_358 ?auto_361 ) ) ( OBJ-AT ?auto_359 ?auto_358 ) ( not ( = ?auto_359 ?auto_360 ) ) ( OBJ-AT ?auto_360 ?auto_361 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_360 ?auto_358 ) )
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
      ?auto_368 - TRUCK
      ?auto_369 - LOCATION
      ?auto_367 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_368 ?auto_369 ) ( IN-CITY ?auto_369 ?auto_367 ) ( IN-CITY ?auto_364 ?auto_367 ) ( not ( = ?auto_364 ?auto_369 ) ) ( OBJ-AT ?auto_366 ?auto_364 ) ( not ( = ?auto_366 ?auto_365 ) ) ( OBJ-AT ?auto_365 ?auto_369 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_366 ?auto_365 ?auto_364 ) )
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
      ?auto_379 - CITY
      ?auto_382 - OBJ
      ?auto_380 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_381 ?auto_379 ) ( IN-CITY ?auto_377 ?auto_379 ) ( not ( = ?auto_377 ?auto_381 ) ) ( OBJ-AT ?auto_382 ?auto_377 ) ( not ( = ?auto_382 ?auto_378 ) ) ( OBJ-AT ?auto_378 ?auto_381 ) ( TRUCK-AT ?auto_380 ?auto_377 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_380 ?auto_377 ?auto_381 ?auto_379 )
      ( DELIVER-2PKG ?auto_382 ?auto_378 ?auto_377 ) )
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
      ?auto_387 - CITY
      ?auto_388 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_386 ?auto_387 ) ( IN-CITY ?auto_383 ?auto_387 ) ( not ( = ?auto_383 ?auto_386 ) ) ( OBJ-AT ?auto_384 ?auto_383 ) ( not ( = ?auto_384 ?auto_385 ) ) ( OBJ-AT ?auto_385 ?auto_386 ) ( TRUCK-AT ?auto_388 ?auto_383 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_385 ?auto_383 ) )
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
      ?auto_393 - LOCATION
      ?auto_392 - CITY
      ?auto_394 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_393 ?auto_392 ) ( IN-CITY ?auto_389 ?auto_392 ) ( not ( = ?auto_389 ?auto_393 ) ) ( OBJ-AT ?auto_391 ?auto_389 ) ( not ( = ?auto_391 ?auto_390 ) ) ( OBJ-AT ?auto_390 ?auto_393 ) ( TRUCK-AT ?auto_394 ?auto_389 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_391 ?auto_390 ?auto_389 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_403 - OBJ
      ?auto_402 - LOCATION
    )
    :vars
    (
      ?auto_405 - LOCATION
      ?auto_404 - CITY
      ?auto_406 - OBJ
      ?auto_407 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_405 ?auto_404 ) ( IN-CITY ?auto_402 ?auto_404 ) ( not ( = ?auto_402 ?auto_405 ) ) ( not ( = ?auto_406 ?auto_403 ) ) ( OBJ-AT ?auto_403 ?auto_405 ) ( TRUCK-AT ?auto_407 ?auto_402 ) ( IN-TRUCK ?auto_406 ?auto_407 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_406 ?auto_402 )
      ( DELIVER-2PKG ?auto_406 ?auto_403 ?auto_402 ) )
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
      ?auto_411 - CITY
      ?auto_412 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_413 ?auto_411 ) ( IN-CITY ?auto_408 ?auto_411 ) ( not ( = ?auto_408 ?auto_413 ) ) ( not ( = ?auto_409 ?auto_410 ) ) ( OBJ-AT ?auto_410 ?auto_413 ) ( TRUCK-AT ?auto_412 ?auto_408 ) ( IN-TRUCK ?auto_409 ?auto_412 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_410 ?auto_408 ) )
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
      ?auto_419 - LOCATION
      ?auto_417 - CITY
      ?auto_418 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_419 ?auto_417 ) ( IN-CITY ?auto_414 ?auto_417 ) ( not ( = ?auto_414 ?auto_419 ) ) ( not ( = ?auto_416 ?auto_415 ) ) ( OBJ-AT ?auto_415 ?auto_419 ) ( TRUCK-AT ?auto_418 ?auto_414 ) ( IN-TRUCK ?auto_416 ?auto_418 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_416 ?auto_415 ?auto_414 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_428 - OBJ
      ?auto_427 - LOCATION
    )
    :vars
    (
      ?auto_431 - LOCATION
      ?auto_429 - CITY
      ?auto_432 - OBJ
      ?auto_430 - TRUCK
      ?auto_433 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_431 ?auto_429 ) ( IN-CITY ?auto_427 ?auto_429 ) ( not ( = ?auto_427 ?auto_431 ) ) ( not ( = ?auto_432 ?auto_428 ) ) ( OBJ-AT ?auto_428 ?auto_431 ) ( IN-TRUCK ?auto_432 ?auto_430 ) ( TRUCK-AT ?auto_430 ?auto_433 ) ( IN-CITY ?auto_433 ?auto_429 ) ( not ( = ?auto_427 ?auto_433 ) ) ( not ( = ?auto_431 ?auto_433 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_430 ?auto_433 ?auto_427 ?auto_429 )
      ( DELIVER-2PKG ?auto_432 ?auto_428 ?auto_427 ) )
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
      ?auto_438 - LOCATION
      ?auto_439 - CITY
      ?auto_437 - TRUCK
      ?auto_440 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_438 ?auto_439 ) ( IN-CITY ?auto_434 ?auto_439 ) ( not ( = ?auto_434 ?auto_438 ) ) ( not ( = ?auto_435 ?auto_436 ) ) ( OBJ-AT ?auto_436 ?auto_438 ) ( IN-TRUCK ?auto_435 ?auto_437 ) ( TRUCK-AT ?auto_437 ?auto_440 ) ( IN-CITY ?auto_440 ?auto_439 ) ( not ( = ?auto_434 ?auto_440 ) ) ( not ( = ?auto_438 ?auto_440 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_436 ?auto_434 ) )
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
      ?auto_444 - LOCATION
      ?auto_446 - CITY
      ?auto_445 - TRUCK
      ?auto_447 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_444 ?auto_446 ) ( IN-CITY ?auto_441 ?auto_446 ) ( not ( = ?auto_441 ?auto_444 ) ) ( not ( = ?auto_443 ?auto_442 ) ) ( OBJ-AT ?auto_442 ?auto_444 ) ( IN-TRUCK ?auto_443 ?auto_445 ) ( TRUCK-AT ?auto_445 ?auto_447 ) ( IN-CITY ?auto_447 ?auto_446 ) ( not ( = ?auto_441 ?auto_447 ) ) ( not ( = ?auto_444 ?auto_447 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_443 ?auto_442 ?auto_441 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_457 - OBJ
      ?auto_456 - LOCATION
    )
    :vars
    (
      ?auto_458 - LOCATION
      ?auto_461 - CITY
      ?auto_460 - OBJ
      ?auto_459 - TRUCK
      ?auto_462 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_458 ?auto_461 ) ( IN-CITY ?auto_456 ?auto_461 ) ( not ( = ?auto_456 ?auto_458 ) ) ( not ( = ?auto_460 ?auto_457 ) ) ( OBJ-AT ?auto_457 ?auto_458 ) ( TRUCK-AT ?auto_459 ?auto_462 ) ( IN-CITY ?auto_462 ?auto_461 ) ( not ( = ?auto_456 ?auto_462 ) ) ( not ( = ?auto_458 ?auto_462 ) ) ( OBJ-AT ?auto_460 ?auto_462 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_460 ?auto_459 ?auto_462 )
      ( DELIVER-2PKG ?auto_460 ?auto_457 ?auto_456 ) )
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
      ?auto_468 - LOCATION
      ?auto_467 - CITY
      ?auto_466 - TRUCK
      ?auto_469 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_468 ?auto_467 ) ( IN-CITY ?auto_463 ?auto_467 ) ( not ( = ?auto_463 ?auto_468 ) ) ( not ( = ?auto_464 ?auto_465 ) ) ( OBJ-AT ?auto_465 ?auto_468 ) ( TRUCK-AT ?auto_466 ?auto_469 ) ( IN-CITY ?auto_469 ?auto_467 ) ( not ( = ?auto_463 ?auto_469 ) ) ( not ( = ?auto_468 ?auto_469 ) ) ( OBJ-AT ?auto_464 ?auto_469 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_465 ?auto_463 ) )
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
      ?auto_473 - TRUCK
      ?auto_476 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_475 ?auto_474 ) ( IN-CITY ?auto_470 ?auto_474 ) ( not ( = ?auto_470 ?auto_475 ) ) ( not ( = ?auto_472 ?auto_471 ) ) ( OBJ-AT ?auto_471 ?auto_475 ) ( TRUCK-AT ?auto_473 ?auto_476 ) ( IN-CITY ?auto_476 ?auto_474 ) ( not ( = ?auto_470 ?auto_476 ) ) ( not ( = ?auto_475 ?auto_476 ) ) ( OBJ-AT ?auto_472 ?auto_476 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_472 ?auto_471 ?auto_470 ) )
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
      ?auto_490 - LOCATION
      ?auto_487 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_489 ?auto_488 ) ( IN-CITY ?auto_485 ?auto_488 ) ( not ( = ?auto_485 ?auto_489 ) ) ( not ( = ?auto_491 ?auto_486 ) ) ( OBJ-AT ?auto_486 ?auto_489 ) ( IN-CITY ?auto_490 ?auto_488 ) ( not ( = ?auto_485 ?auto_490 ) ) ( not ( = ?auto_489 ?auto_490 ) ) ( OBJ-AT ?auto_491 ?auto_490 ) ( TRUCK-AT ?auto_487 ?auto_485 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_487 ?auto_485 ?auto_490 ?auto_488 )
      ( DELIVER-2PKG ?auto_491 ?auto_486 ?auto_485 ) )
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
      ?auto_495 - LOCATION
      ?auto_498 - CITY
      ?auto_497 - LOCATION
      ?auto_496 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_495 ?auto_498 ) ( IN-CITY ?auto_492 ?auto_498 ) ( not ( = ?auto_492 ?auto_495 ) ) ( not ( = ?auto_493 ?auto_494 ) ) ( OBJ-AT ?auto_494 ?auto_495 ) ( IN-CITY ?auto_497 ?auto_498 ) ( not ( = ?auto_492 ?auto_497 ) ) ( not ( = ?auto_495 ?auto_497 ) ) ( OBJ-AT ?auto_493 ?auto_497 ) ( TRUCK-AT ?auto_496 ?auto_492 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_494 ?auto_492 ) )
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
      ?auto_504 - CITY
      ?auto_503 - LOCATION
      ?auto_505 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_502 ?auto_504 ) ( IN-CITY ?auto_499 ?auto_504 ) ( not ( = ?auto_499 ?auto_502 ) ) ( not ( = ?auto_501 ?auto_500 ) ) ( OBJ-AT ?auto_500 ?auto_502 ) ( IN-CITY ?auto_503 ?auto_504 ) ( not ( = ?auto_499 ?auto_503 ) ) ( not ( = ?auto_502 ?auto_503 ) ) ( OBJ-AT ?auto_501 ?auto_503 ) ( TRUCK-AT ?auto_505 ?auto_499 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_501 ?auto_500 ?auto_499 ) )
  )

)

