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
      ?auto_283 - LOCATION
      ?auto_284 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_282 ?auto_283 ) ( IN-CITY ?auto_283 ?auto_284 ) ( IN-CITY ?auto_280 ?auto_284 ) ( not ( = ?auto_280 ?auto_283 ) ) ( OBJ-AT ?auto_281 ?auto_283 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_281 ?auto_282 ?auto_283 )
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
      ?auto_293 - LOCATION
      ?auto_295 - CITY
      ?auto_294 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_293 ?auto_295 ) ( IN-CITY ?auto_291 ?auto_295 ) ( not ( = ?auto_291 ?auto_293 ) ) ( OBJ-AT ?auto_292 ?auto_293 ) ( TRUCK-AT ?auto_294 ?auto_291 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_294 ?auto_291 ?auto_293 ?auto_295 )
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
      ?auto_336 - TRUCK
      ?auto_337 - LOCATION
      ?auto_338 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_335 ?auto_336 ) ( TRUCK-AT ?auto_336 ?auto_337 ) ( IN-CITY ?auto_337 ?auto_338 ) ( IN-CITY ?auto_333 ?auto_338 ) ( not ( = ?auto_333 ?auto_337 ) ) ( OBJ-AT ?auto_334 ?auto_333 ) ( not ( = ?auto_334 ?auto_335 ) ) )
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
      ?auto_355 - TRUCK
      ?auto_354 - LOCATION
      ?auto_357 - CITY
      ?auto_356 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_355 ?auto_354 ) ( IN-CITY ?auto_354 ?auto_357 ) ( IN-CITY ?auto_352 ?auto_357 ) ( not ( = ?auto_352 ?auto_354 ) ) ( OBJ-AT ?auto_356 ?auto_352 ) ( not ( = ?auto_356 ?auto_353 ) ) ( OBJ-AT ?auto_353 ?auto_354 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_353 ?auto_355 ?auto_354 )
      ( DELIVER-2PKG ?auto_356 ?auto_353 ?auto_352 ) )
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
      ?auto_369 - TRUCK
      ?auto_367 - LOCATION
      ?auto_368 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_369 ?auto_367 ) ( IN-CITY ?auto_367 ?auto_368 ) ( IN-CITY ?auto_364 ?auto_368 ) ( not ( = ?auto_364 ?auto_367 ) ) ( OBJ-AT ?auto_366 ?auto_364 ) ( not ( = ?auto_366 ?auto_365 ) ) ( OBJ-AT ?auto_365 ?auto_367 ) )
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
      ?auto_380 - LOCATION
      ?auto_381 - CITY
      ?auto_379 - OBJ
      ?auto_382 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_380 ?auto_381 ) ( IN-CITY ?auto_377 ?auto_381 ) ( not ( = ?auto_377 ?auto_380 ) ) ( OBJ-AT ?auto_379 ?auto_377 ) ( not ( = ?auto_379 ?auto_378 ) ) ( OBJ-AT ?auto_378 ?auto_380 ) ( TRUCK-AT ?auto_382 ?auto_377 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_382 ?auto_377 ?auto_380 ?auto_381 )
      ( DELIVER-2PKG ?auto_379 ?auto_378 ?auto_377 ) )
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
      ?auto_387 - LOCATION
      ?auto_388 - CITY
      ?auto_386 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_387 ?auto_388 ) ( IN-CITY ?auto_383 ?auto_388 ) ( not ( = ?auto_383 ?auto_387 ) ) ( OBJ-AT ?auto_384 ?auto_383 ) ( not ( = ?auto_384 ?auto_385 ) ) ( OBJ-AT ?auto_385 ?auto_387 ) ( TRUCK-AT ?auto_386 ?auto_383 ) )
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
      ?auto_394 - LOCATION
      ?auto_393 - CITY
      ?auto_392 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_394 ?auto_393 ) ( IN-CITY ?auto_389 ?auto_393 ) ( not ( = ?auto_389 ?auto_394 ) ) ( OBJ-AT ?auto_391 ?auto_389 ) ( not ( = ?auto_391 ?auto_390 ) ) ( OBJ-AT ?auto_390 ?auto_394 ) ( TRUCK-AT ?auto_392 ?auto_389 ) )
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
      ?auto_406 - LOCATION
      ?auto_405 - CITY
      ?auto_407 - OBJ
      ?auto_404 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_406 ?auto_405 ) ( IN-CITY ?auto_402 ?auto_405 ) ( not ( = ?auto_402 ?auto_406 ) ) ( not ( = ?auto_407 ?auto_403 ) ) ( OBJ-AT ?auto_403 ?auto_406 ) ( TRUCK-AT ?auto_404 ?auto_402 ) ( IN-TRUCK ?auto_407 ?auto_404 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_407 ?auto_402 )
      ( DELIVER-2PKG ?auto_407 ?auto_403 ?auto_402 ) )
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
      ?auto_418 - CITY
      ?auto_417 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_419 ?auto_418 ) ( IN-CITY ?auto_414 ?auto_418 ) ( not ( = ?auto_414 ?auto_419 ) ) ( not ( = ?auto_416 ?auto_415 ) ) ( OBJ-AT ?auto_415 ?auto_419 ) ( TRUCK-AT ?auto_417 ?auto_414 ) ( IN-TRUCK ?auto_416 ?auto_417 ) )
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
      ?auto_430 - CITY
      ?auto_432 - OBJ
      ?auto_429 - TRUCK
      ?auto_433 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_431 ?auto_430 ) ( IN-CITY ?auto_427 ?auto_430 ) ( not ( = ?auto_427 ?auto_431 ) ) ( not ( = ?auto_432 ?auto_428 ) ) ( OBJ-AT ?auto_428 ?auto_431 ) ( IN-TRUCK ?auto_432 ?auto_429 ) ( TRUCK-AT ?auto_429 ?auto_433 ) ( IN-CITY ?auto_433 ?auto_430 ) ( not ( = ?auto_427 ?auto_433 ) ) ( not ( = ?auto_431 ?auto_433 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_429 ?auto_433 ?auto_427 ?auto_430 )
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
      ?auto_440 - LOCATION
      ?auto_439 - CITY
      ?auto_437 - TRUCK
      ?auto_438 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_440 ?auto_439 ) ( IN-CITY ?auto_434 ?auto_439 ) ( not ( = ?auto_434 ?auto_440 ) ) ( not ( = ?auto_435 ?auto_436 ) ) ( OBJ-AT ?auto_436 ?auto_440 ) ( IN-TRUCK ?auto_435 ?auto_437 ) ( TRUCK-AT ?auto_437 ?auto_438 ) ( IN-CITY ?auto_438 ?auto_439 ) ( not ( = ?auto_434 ?auto_438 ) ) ( not ( = ?auto_440 ?auto_438 ) ) )
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
      ?auto_446 - LOCATION
      ?auto_445 - CITY
      ?auto_444 - TRUCK
      ?auto_447 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_446 ?auto_445 ) ( IN-CITY ?auto_441 ?auto_445 ) ( not ( = ?auto_441 ?auto_446 ) ) ( not ( = ?auto_443 ?auto_442 ) ) ( OBJ-AT ?auto_442 ?auto_446 ) ( IN-TRUCK ?auto_443 ?auto_444 ) ( TRUCK-AT ?auto_444 ?auto_447 ) ( IN-CITY ?auto_447 ?auto_445 ) ( not ( = ?auto_441 ?auto_447 ) ) ( not ( = ?auto_446 ?auto_447 ) ) )
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
      ( DELIVER-2PKG ?auto_462 ?auto_457 ?auto_456 ) )
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
      ?auto_469 - LOCATION
      ?auto_468 - CITY
      ?auto_467 - TRUCK
      ?auto_466 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_469 ?auto_468 ) ( IN-CITY ?auto_463 ?auto_468 ) ( not ( = ?auto_463 ?auto_469 ) ) ( not ( = ?auto_464 ?auto_465 ) ) ( OBJ-AT ?auto_465 ?auto_469 ) ( TRUCK-AT ?auto_467 ?auto_466 ) ( IN-CITY ?auto_466 ?auto_468 ) ( not ( = ?auto_463 ?auto_466 ) ) ( not ( = ?auto_469 ?auto_466 ) ) ( OBJ-AT ?auto_464 ?auto_466 ) )
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
      ?auto_476 - LOCATION
      ?auto_474 - CITY
      ?auto_473 - TRUCK
      ?auto_475 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_476 ?auto_474 ) ( IN-CITY ?auto_470 ?auto_474 ) ( not ( = ?auto_470 ?auto_476 ) ) ( not ( = ?auto_472 ?auto_471 ) ) ( OBJ-AT ?auto_471 ?auto_476 ) ( TRUCK-AT ?auto_473 ?auto_475 ) ( IN-CITY ?auto_475 ?auto_474 ) ( not ( = ?auto_470 ?auto_475 ) ) ( not ( = ?auto_476 ?auto_475 ) ) ( OBJ-AT ?auto_472 ?auto_475 ) )
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
      ?auto_490 - LOCATION
      ?auto_488 - CITY
      ?auto_491 - OBJ
      ?auto_489 - LOCATION
      ?auto_487 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_490 ?auto_488 ) ( IN-CITY ?auto_485 ?auto_488 ) ( not ( = ?auto_485 ?auto_490 ) ) ( not ( = ?auto_491 ?auto_486 ) ) ( OBJ-AT ?auto_486 ?auto_490 ) ( IN-CITY ?auto_489 ?auto_488 ) ( not ( = ?auto_485 ?auto_489 ) ) ( not ( = ?auto_490 ?auto_489 ) ) ( OBJ-AT ?auto_491 ?auto_489 ) ( TRUCK-AT ?auto_487 ?auto_485 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_487 ?auto_485 ?auto_489 ?auto_488 )
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
      ?auto_497 - LOCATION
      ?auto_498 - CITY
      ?auto_495 - LOCATION
      ?auto_496 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_497 ?auto_498 ) ( IN-CITY ?auto_492 ?auto_498 ) ( not ( = ?auto_492 ?auto_497 ) ) ( not ( = ?auto_493 ?auto_494 ) ) ( OBJ-AT ?auto_494 ?auto_497 ) ( IN-CITY ?auto_495 ?auto_498 ) ( not ( = ?auto_492 ?auto_495 ) ) ( not ( = ?auto_497 ?auto_495 ) ) ( OBJ-AT ?auto_493 ?auto_495 ) ( TRUCK-AT ?auto_496 ?auto_492 ) )
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
      ?auto_505 - CITY
      ?auto_503 - LOCATION
      ?auto_504 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_502 ?auto_505 ) ( IN-CITY ?auto_499 ?auto_505 ) ( not ( = ?auto_499 ?auto_502 ) ) ( not ( = ?auto_501 ?auto_500 ) ) ( OBJ-AT ?auto_500 ?auto_502 ) ( IN-CITY ?auto_503 ?auto_505 ) ( not ( = ?auto_499 ?auto_503 ) ) ( not ( = ?auto_502 ?auto_503 ) ) ( OBJ-AT ?auto_501 ?auto_503 ) ( TRUCK-AT ?auto_504 ?auto_499 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_501 ?auto_500 ?auto_499 ) )
  )

)

