( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?above - SURFACE
      ?below - SURFACE
    )
    :precondition
    ( and ( ON ?above ?below ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_346 - SURFACE
      ?auto_345 - SURFACE
    )
    :vars
    (
      ?auto_347 - HOIST
      ?auto_348 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_347 ?auto_348 ) ( SURFACE-AT ?auto_345 ?auto_348 ) ( CLEAR ?auto_345 ) ( LIFTING ?auto_347 ?auto_346 ) ( IS-CRATE ?auto_346 ) ( not ( = ?auto_346 ?auto_345 ) ) )
    :subtasks
    ( ( !DROP ?auto_347 ?auto_346 ?auto_345 ?auto_348 )
      ( MAKE-ON-VERIFY ?auto_346 ?auto_345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_350 - SURFACE
      ?auto_349 - SURFACE
    )
    :vars
    (
      ?auto_351 - HOIST
      ?auto_352 - PLACE
      ?auto_353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_351 ?auto_352 ) ( SURFACE-AT ?auto_349 ?auto_352 ) ( CLEAR ?auto_349 ) ( IS-CRATE ?auto_350 ) ( not ( = ?auto_350 ?auto_349 ) ) ( TRUCK-AT ?auto_353 ?auto_352 ) ( AVAILABLE ?auto_351 ) ( IN ?auto_350 ?auto_353 ) )
    :subtasks
    ( ( !UNLOAD ?auto_351 ?auto_350 ?auto_353 ?auto_352 )
      ( MAKE-ON ?auto_350 ?auto_349 )
      ( MAKE-ON-VERIFY ?auto_350 ?auto_349 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_355 - SURFACE
      ?auto_354 - SURFACE
    )
    :vars
    (
      ?auto_358 - HOIST
      ?auto_357 - PLACE
      ?auto_356 - TRUCK
      ?auto_359 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_358 ?auto_357 ) ( SURFACE-AT ?auto_354 ?auto_357 ) ( CLEAR ?auto_354 ) ( IS-CRATE ?auto_355 ) ( not ( = ?auto_355 ?auto_354 ) ) ( TRUCK-AT ?auto_356 ?auto_357 ) ( IN ?auto_355 ?auto_356 ) ( LIFTING ?auto_358 ?auto_359 ) ( IS-CRATE ?auto_359 ) ( not ( = ?auto_355 ?auto_359 ) ) ( not ( = ?auto_354 ?auto_359 ) ) )
    :subtasks
    ( ( !LOAD ?auto_358 ?auto_359 ?auto_356 ?auto_357 )
      ( MAKE-ON ?auto_355 ?auto_354 )
      ( MAKE-ON-VERIFY ?auto_355 ?auto_354 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_361 - SURFACE
      ?auto_360 - SURFACE
    )
    :vars
    (
      ?auto_362 - HOIST
      ?auto_364 - PLACE
      ?auto_365 - TRUCK
      ?auto_363 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_362 ?auto_364 ) ( SURFACE-AT ?auto_360 ?auto_364 ) ( IS-CRATE ?auto_361 ) ( not ( = ?auto_361 ?auto_360 ) ) ( TRUCK-AT ?auto_365 ?auto_364 ) ( IN ?auto_361 ?auto_365 ) ( IS-CRATE ?auto_363 ) ( not ( = ?auto_361 ?auto_363 ) ) ( not ( = ?auto_360 ?auto_363 ) ) ( AVAILABLE ?auto_362 ) ( SURFACE-AT ?auto_363 ?auto_364 ) ( ON ?auto_363 ?auto_360 ) ( CLEAR ?auto_363 ) )
    :subtasks
    ( ( !LIFT ?auto_362 ?auto_363 ?auto_360 ?auto_364 )
      ( MAKE-ON ?auto_361 ?auto_360 )
      ( MAKE-ON-VERIFY ?auto_361 ?auto_360 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_367 - SURFACE
      ?auto_366 - SURFACE
    )
    :vars
    (
      ?auto_369 - HOIST
      ?auto_371 - PLACE
      ?auto_370 - TRUCK
      ?auto_368 - SURFACE
      ?auto_372 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_369 ?auto_371 ) ( SURFACE-AT ?auto_366 ?auto_371 ) ( IS-CRATE ?auto_367 ) ( not ( = ?auto_367 ?auto_366 ) ) ( TRUCK-AT ?auto_370 ?auto_371 ) ( IN ?auto_367 ?auto_370 ) ( IS-CRATE ?auto_368 ) ( not ( = ?auto_367 ?auto_368 ) ) ( not ( = ?auto_366 ?auto_368 ) ) ( SURFACE-AT ?auto_368 ?auto_371 ) ( ON ?auto_368 ?auto_366 ) ( CLEAR ?auto_368 ) ( LIFTING ?auto_369 ?auto_372 ) ( IS-CRATE ?auto_372 ) ( not ( = ?auto_367 ?auto_372 ) ) ( not ( = ?auto_366 ?auto_372 ) ) ( not ( = ?auto_368 ?auto_372 ) ) )
    :subtasks
    ( ( !LOAD ?auto_369 ?auto_372 ?auto_370 ?auto_371 )
      ( MAKE-ON ?auto_367 ?auto_366 )
      ( MAKE-ON-VERIFY ?auto_367 ?auto_366 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_374 - SURFACE
      ?auto_373 - SURFACE
    )
    :vars
    (
      ?auto_378 - HOIST
      ?auto_379 - PLACE
      ?auto_375 - TRUCK
      ?auto_377 - SURFACE
      ?auto_376 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_378 ?auto_379 ) ( SURFACE-AT ?auto_373 ?auto_379 ) ( IS-CRATE ?auto_374 ) ( not ( = ?auto_374 ?auto_373 ) ) ( TRUCK-AT ?auto_375 ?auto_379 ) ( IN ?auto_374 ?auto_375 ) ( IS-CRATE ?auto_377 ) ( not ( = ?auto_374 ?auto_377 ) ) ( not ( = ?auto_373 ?auto_377 ) ) ( SURFACE-AT ?auto_377 ?auto_379 ) ( ON ?auto_377 ?auto_373 ) ( IS-CRATE ?auto_376 ) ( not ( = ?auto_374 ?auto_376 ) ) ( not ( = ?auto_373 ?auto_376 ) ) ( not ( = ?auto_377 ?auto_376 ) ) ( AVAILABLE ?auto_378 ) ( SURFACE-AT ?auto_376 ?auto_379 ) ( ON ?auto_376 ?auto_377 ) ( CLEAR ?auto_376 ) )
    :subtasks
    ( ( !LIFT ?auto_378 ?auto_376 ?auto_377 ?auto_379 )
      ( MAKE-ON ?auto_374 ?auto_373 )
      ( MAKE-ON-VERIFY ?auto_374 ?auto_373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_381 - SURFACE
      ?auto_380 - SURFACE
    )
    :vars
    (
      ?auto_382 - HOIST
      ?auto_384 - PLACE
      ?auto_386 - TRUCK
      ?auto_385 - SURFACE
      ?auto_383 - SURFACE
      ?auto_387 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_382 ?auto_384 ) ( SURFACE-AT ?auto_380 ?auto_384 ) ( IS-CRATE ?auto_381 ) ( not ( = ?auto_381 ?auto_380 ) ) ( IN ?auto_381 ?auto_386 ) ( IS-CRATE ?auto_385 ) ( not ( = ?auto_381 ?auto_385 ) ) ( not ( = ?auto_380 ?auto_385 ) ) ( SURFACE-AT ?auto_385 ?auto_384 ) ( ON ?auto_385 ?auto_380 ) ( IS-CRATE ?auto_383 ) ( not ( = ?auto_381 ?auto_383 ) ) ( not ( = ?auto_380 ?auto_383 ) ) ( not ( = ?auto_385 ?auto_383 ) ) ( AVAILABLE ?auto_382 ) ( SURFACE-AT ?auto_383 ?auto_384 ) ( ON ?auto_383 ?auto_385 ) ( CLEAR ?auto_383 ) ( TRUCK-AT ?auto_386 ?auto_387 ) ( not ( = ?auto_387 ?auto_384 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_386 ?auto_387 ?auto_384 )
      ( MAKE-ON ?auto_381 ?auto_380 )
      ( MAKE-ON-VERIFY ?auto_381 ?auto_380 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_389 - SURFACE
      ?auto_388 - SURFACE
    )
    :vars
    (
      ?auto_394 - HOIST
      ?auto_390 - PLACE
      ?auto_393 - SURFACE
      ?auto_391 - SURFACE
      ?auto_392 - TRUCK
      ?auto_395 - PLACE
      ?auto_396 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_394 ?auto_390 ) ( SURFACE-AT ?auto_388 ?auto_390 ) ( IS-CRATE ?auto_389 ) ( not ( = ?auto_389 ?auto_388 ) ) ( IS-CRATE ?auto_393 ) ( not ( = ?auto_389 ?auto_393 ) ) ( not ( = ?auto_388 ?auto_393 ) ) ( SURFACE-AT ?auto_393 ?auto_390 ) ( ON ?auto_393 ?auto_388 ) ( IS-CRATE ?auto_391 ) ( not ( = ?auto_389 ?auto_391 ) ) ( not ( = ?auto_388 ?auto_391 ) ) ( not ( = ?auto_393 ?auto_391 ) ) ( AVAILABLE ?auto_394 ) ( SURFACE-AT ?auto_391 ?auto_390 ) ( ON ?auto_391 ?auto_393 ) ( CLEAR ?auto_391 ) ( TRUCK-AT ?auto_392 ?auto_395 ) ( not ( = ?auto_395 ?auto_390 ) ) ( HOIST-AT ?auto_396 ?auto_395 ) ( LIFTING ?auto_396 ?auto_389 ) ( not ( = ?auto_394 ?auto_396 ) ) )
    :subtasks
    ( ( !LOAD ?auto_396 ?auto_389 ?auto_392 ?auto_395 )
      ( MAKE-ON ?auto_389 ?auto_388 )
      ( MAKE-ON-VERIFY ?auto_389 ?auto_388 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_398 - SURFACE
      ?auto_397 - SURFACE
    )
    :vars
    (
      ?auto_402 - HOIST
      ?auto_400 - PLACE
      ?auto_405 - SURFACE
      ?auto_399 - SURFACE
      ?auto_403 - TRUCK
      ?auto_404 - PLACE
      ?auto_401 - HOIST
      ?auto_406 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_402 ?auto_400 ) ( SURFACE-AT ?auto_397 ?auto_400 ) ( IS-CRATE ?auto_398 ) ( not ( = ?auto_398 ?auto_397 ) ) ( IS-CRATE ?auto_405 ) ( not ( = ?auto_398 ?auto_405 ) ) ( not ( = ?auto_397 ?auto_405 ) ) ( SURFACE-AT ?auto_405 ?auto_400 ) ( ON ?auto_405 ?auto_397 ) ( IS-CRATE ?auto_399 ) ( not ( = ?auto_398 ?auto_399 ) ) ( not ( = ?auto_397 ?auto_399 ) ) ( not ( = ?auto_405 ?auto_399 ) ) ( AVAILABLE ?auto_402 ) ( SURFACE-AT ?auto_399 ?auto_400 ) ( ON ?auto_399 ?auto_405 ) ( CLEAR ?auto_399 ) ( TRUCK-AT ?auto_403 ?auto_404 ) ( not ( = ?auto_404 ?auto_400 ) ) ( HOIST-AT ?auto_401 ?auto_404 ) ( not ( = ?auto_402 ?auto_401 ) ) ( AVAILABLE ?auto_401 ) ( SURFACE-AT ?auto_398 ?auto_404 ) ( ON ?auto_398 ?auto_406 ) ( CLEAR ?auto_398 ) ( not ( = ?auto_398 ?auto_406 ) ) ( not ( = ?auto_397 ?auto_406 ) ) ( not ( = ?auto_405 ?auto_406 ) ) ( not ( = ?auto_399 ?auto_406 ) ) )
    :subtasks
    ( ( !LIFT ?auto_401 ?auto_398 ?auto_406 ?auto_404 )
      ( MAKE-ON ?auto_398 ?auto_397 )
      ( MAKE-ON-VERIFY ?auto_398 ?auto_397 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_419 - SURFACE
      ?auto_418 - SURFACE
    )
    :vars
    (
      ?auto_422 - HOIST
      ?auto_420 - PLACE
      ?auto_421 - TRUCK
      ?auto_423 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_422 ?auto_420 ) ( SURFACE-AT ?auto_418 ?auto_420 ) ( CLEAR ?auto_418 ) ( IS-CRATE ?auto_419 ) ( not ( = ?auto_419 ?auto_418 ) ) ( AVAILABLE ?auto_422 ) ( IN ?auto_419 ?auto_421 ) ( TRUCK-AT ?auto_421 ?auto_423 ) ( not ( = ?auto_423 ?auto_420 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_421 ?auto_423 ?auto_420 )
      ( MAKE-ON ?auto_419 ?auto_418 )
      ( MAKE-ON-VERIFY ?auto_419 ?auto_418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_433 - SURFACE
      ?auto_432 - SURFACE
    )
    :vars
    (
      ?auto_436 - HOIST
      ?auto_434 - PLACE
      ?auto_435 - TRUCK
      ?auto_437 - PLACE
      ?auto_438 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_436 ?auto_434 ) ( SURFACE-AT ?auto_432 ?auto_434 ) ( CLEAR ?auto_432 ) ( IS-CRATE ?auto_433 ) ( not ( = ?auto_433 ?auto_432 ) ) ( AVAILABLE ?auto_436 ) ( TRUCK-AT ?auto_435 ?auto_437 ) ( not ( = ?auto_437 ?auto_434 ) ) ( HOIST-AT ?auto_438 ?auto_437 ) ( LIFTING ?auto_438 ?auto_433 ) ( not ( = ?auto_436 ?auto_438 ) ) )
    :subtasks
    ( ( !LOAD ?auto_438 ?auto_433 ?auto_435 ?auto_437 )
      ( MAKE-ON ?auto_433 ?auto_432 )
      ( MAKE-ON-VERIFY ?auto_433 ?auto_432 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_440 - SURFACE
      ?auto_439 - SURFACE
    )
    :vars
    (
      ?auto_445 - HOIST
      ?auto_444 - PLACE
      ?auto_443 - TRUCK
      ?auto_441 - PLACE
      ?auto_442 - HOIST
      ?auto_446 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_445 ?auto_444 ) ( SURFACE-AT ?auto_439 ?auto_444 ) ( CLEAR ?auto_439 ) ( IS-CRATE ?auto_440 ) ( not ( = ?auto_440 ?auto_439 ) ) ( AVAILABLE ?auto_445 ) ( TRUCK-AT ?auto_443 ?auto_441 ) ( not ( = ?auto_441 ?auto_444 ) ) ( HOIST-AT ?auto_442 ?auto_441 ) ( not ( = ?auto_445 ?auto_442 ) ) ( AVAILABLE ?auto_442 ) ( SURFACE-AT ?auto_440 ?auto_441 ) ( ON ?auto_440 ?auto_446 ) ( CLEAR ?auto_440 ) ( not ( = ?auto_440 ?auto_446 ) ) ( not ( = ?auto_439 ?auto_446 ) ) )
    :subtasks
    ( ( !LIFT ?auto_442 ?auto_440 ?auto_446 ?auto_441 )
      ( MAKE-ON ?auto_440 ?auto_439 )
      ( MAKE-ON-VERIFY ?auto_440 ?auto_439 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_448 - SURFACE
      ?auto_447 - SURFACE
    )
    :vars
    (
      ?auto_450 - HOIST
      ?auto_453 - PLACE
      ?auto_454 - PLACE
      ?auto_449 - HOIST
      ?auto_452 - SURFACE
      ?auto_451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_450 ?auto_453 ) ( SURFACE-AT ?auto_447 ?auto_453 ) ( CLEAR ?auto_447 ) ( IS-CRATE ?auto_448 ) ( not ( = ?auto_448 ?auto_447 ) ) ( AVAILABLE ?auto_450 ) ( not ( = ?auto_454 ?auto_453 ) ) ( HOIST-AT ?auto_449 ?auto_454 ) ( not ( = ?auto_450 ?auto_449 ) ) ( AVAILABLE ?auto_449 ) ( SURFACE-AT ?auto_448 ?auto_454 ) ( ON ?auto_448 ?auto_452 ) ( CLEAR ?auto_448 ) ( not ( = ?auto_448 ?auto_452 ) ) ( not ( = ?auto_447 ?auto_452 ) ) ( TRUCK-AT ?auto_451 ?auto_453 ) )
    :subtasks
    ( ( !DRIVE ?auto_451 ?auto_453 ?auto_454 )
      ( MAKE-ON ?auto_448 ?auto_447 )
      ( MAKE-ON-VERIFY ?auto_448 ?auto_447 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_456 - SURFACE
      ?auto_455 - SURFACE
    )
    :vars
    (
      ?auto_459 - HOIST
      ?auto_462 - PLACE
      ?auto_457 - PLACE
      ?auto_461 - HOIST
      ?auto_458 - SURFACE
      ?auto_460 - TRUCK
      ?auto_463 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_459 ?auto_462 ) ( SURFACE-AT ?auto_455 ?auto_462 ) ( CLEAR ?auto_455 ) ( IS-CRATE ?auto_456 ) ( not ( = ?auto_456 ?auto_455 ) ) ( not ( = ?auto_457 ?auto_462 ) ) ( HOIST-AT ?auto_461 ?auto_457 ) ( not ( = ?auto_459 ?auto_461 ) ) ( AVAILABLE ?auto_461 ) ( SURFACE-AT ?auto_456 ?auto_457 ) ( ON ?auto_456 ?auto_458 ) ( CLEAR ?auto_456 ) ( not ( = ?auto_456 ?auto_458 ) ) ( not ( = ?auto_455 ?auto_458 ) ) ( TRUCK-AT ?auto_460 ?auto_462 ) ( LIFTING ?auto_459 ?auto_463 ) ( IS-CRATE ?auto_463 ) ( not ( = ?auto_456 ?auto_463 ) ) ( not ( = ?auto_455 ?auto_463 ) ) ( not ( = ?auto_458 ?auto_463 ) ) )
    :subtasks
    ( ( !LOAD ?auto_459 ?auto_463 ?auto_460 ?auto_462 )
      ( MAKE-ON ?auto_456 ?auto_455 )
      ( MAKE-ON-VERIFY ?auto_456 ?auto_455 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_518 - SURFACE
      ?auto_517 - SURFACE
    )
    :vars
    (
      ?auto_522 - HOIST
      ?auto_523 - PLACE
      ?auto_520 - TRUCK
      ?auto_519 - SURFACE
      ?auto_521 - SURFACE
      ?auto_525 - SURFACE
      ?auto_524 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_522 ?auto_523 ) ( SURFACE-AT ?auto_517 ?auto_523 ) ( IS-CRATE ?auto_518 ) ( not ( = ?auto_518 ?auto_517 ) ) ( TRUCK-AT ?auto_520 ?auto_523 ) ( IN ?auto_518 ?auto_520 ) ( IS-CRATE ?auto_519 ) ( not ( = ?auto_518 ?auto_519 ) ) ( not ( = ?auto_517 ?auto_519 ) ) ( SURFACE-AT ?auto_519 ?auto_523 ) ( ON ?auto_519 ?auto_517 ) ( IS-CRATE ?auto_521 ) ( not ( = ?auto_518 ?auto_521 ) ) ( not ( = ?auto_517 ?auto_521 ) ) ( not ( = ?auto_519 ?auto_521 ) ) ( SURFACE-AT ?auto_521 ?auto_523 ) ( ON ?auto_521 ?auto_519 ) ( CLEAR ?auto_521 ) ( SURFACE-AT ?auto_525 ?auto_523 ) ( CLEAR ?auto_525 ) ( LIFTING ?auto_522 ?auto_524 ) ( IS-CRATE ?auto_524 ) ( not ( = ?auto_518 ?auto_525 ) ) ( not ( = ?auto_518 ?auto_524 ) ) ( not ( = ?auto_517 ?auto_525 ) ) ( not ( = ?auto_517 ?auto_524 ) ) ( not ( = ?auto_519 ?auto_525 ) ) ( not ( = ?auto_519 ?auto_524 ) ) ( not ( = ?auto_521 ?auto_525 ) ) ( not ( = ?auto_521 ?auto_524 ) ) ( not ( = ?auto_525 ?auto_524 ) ) )
    :subtasks
    ( ( !DROP ?auto_522 ?auto_524 ?auto_525 ?auto_523 )
      ( MAKE-ON ?auto_518 ?auto_517 )
      ( MAKE-ON-VERIFY ?auto_518 ?auto_517 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_529 - SURFACE
      ?auto_528 - SURFACE
    )
    :vars
    (
      ?auto_533 - HOIST
      ?auto_532 - PLACE
      ?auto_531 - TRUCK
      ?auto_530 - SURFACE
      ?auto_534 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_533 ?auto_532 ) ( SURFACE-AT ?auto_528 ?auto_532 ) ( IS-CRATE ?auto_529 ) ( not ( = ?auto_529 ?auto_528 ) ) ( TRUCK-AT ?auto_531 ?auto_532 ) ( IS-CRATE ?auto_530 ) ( not ( = ?auto_529 ?auto_530 ) ) ( not ( = ?auto_528 ?auto_530 ) ) ( SURFACE-AT ?auto_530 ?auto_532 ) ( ON ?auto_530 ?auto_528 ) ( IS-CRATE ?auto_534 ) ( not ( = ?auto_529 ?auto_534 ) ) ( not ( = ?auto_528 ?auto_534 ) ) ( not ( = ?auto_530 ?auto_534 ) ) ( SURFACE-AT ?auto_534 ?auto_532 ) ( ON ?auto_534 ?auto_530 ) ( CLEAR ?auto_534 ) ( LIFTING ?auto_533 ?auto_529 ) )
    :subtasks
    ( ( !LOAD ?auto_533 ?auto_529 ?auto_531 ?auto_532 )
      ( MAKE-ON ?auto_529 ?auto_528 )
      ( MAKE-ON-VERIFY ?auto_529 ?auto_528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_536 - SURFACE
      ?auto_535 - SURFACE
    )
    :vars
    (
      ?auto_541 - HOIST
      ?auto_540 - PLACE
      ?auto_537 - TRUCK
      ?auto_538 - SURFACE
      ?auto_539 - SURFACE
      ?auto_542 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_541 ?auto_540 ) ( SURFACE-AT ?auto_535 ?auto_540 ) ( IS-CRATE ?auto_536 ) ( not ( = ?auto_536 ?auto_535 ) ) ( TRUCK-AT ?auto_537 ?auto_540 ) ( IS-CRATE ?auto_538 ) ( not ( = ?auto_536 ?auto_538 ) ) ( not ( = ?auto_535 ?auto_538 ) ) ( SURFACE-AT ?auto_538 ?auto_540 ) ( ON ?auto_538 ?auto_535 ) ( IS-CRATE ?auto_539 ) ( not ( = ?auto_536 ?auto_539 ) ) ( not ( = ?auto_535 ?auto_539 ) ) ( not ( = ?auto_538 ?auto_539 ) ) ( SURFACE-AT ?auto_539 ?auto_540 ) ( ON ?auto_539 ?auto_538 ) ( CLEAR ?auto_539 ) ( AVAILABLE ?auto_541 ) ( SURFACE-AT ?auto_536 ?auto_540 ) ( ON ?auto_536 ?auto_542 ) ( CLEAR ?auto_536 ) ( not ( = ?auto_536 ?auto_542 ) ) ( not ( = ?auto_535 ?auto_542 ) ) ( not ( = ?auto_538 ?auto_542 ) ) ( not ( = ?auto_539 ?auto_542 ) ) )
    :subtasks
    ( ( !LIFT ?auto_541 ?auto_536 ?auto_542 ?auto_540 )
      ( MAKE-ON ?auto_536 ?auto_535 )
      ( MAKE-ON-VERIFY ?auto_536 ?auto_535 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_544 - SURFACE
      ?auto_543 - SURFACE
    )
    :vars
    (
      ?auto_549 - HOIST
      ?auto_550 - PLACE
      ?auto_547 - TRUCK
      ?auto_545 - SURFACE
      ?auto_546 - SURFACE
      ?auto_548 - SURFACE
      ?auto_551 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_549 ?auto_550 ) ( SURFACE-AT ?auto_543 ?auto_550 ) ( IS-CRATE ?auto_544 ) ( not ( = ?auto_544 ?auto_543 ) ) ( TRUCK-AT ?auto_547 ?auto_550 ) ( IS-CRATE ?auto_545 ) ( not ( = ?auto_544 ?auto_545 ) ) ( not ( = ?auto_543 ?auto_545 ) ) ( SURFACE-AT ?auto_545 ?auto_550 ) ( ON ?auto_545 ?auto_543 ) ( IS-CRATE ?auto_546 ) ( not ( = ?auto_544 ?auto_546 ) ) ( not ( = ?auto_543 ?auto_546 ) ) ( not ( = ?auto_545 ?auto_546 ) ) ( SURFACE-AT ?auto_546 ?auto_550 ) ( ON ?auto_546 ?auto_545 ) ( CLEAR ?auto_546 ) ( SURFACE-AT ?auto_544 ?auto_550 ) ( ON ?auto_544 ?auto_548 ) ( CLEAR ?auto_544 ) ( not ( = ?auto_544 ?auto_548 ) ) ( not ( = ?auto_543 ?auto_548 ) ) ( not ( = ?auto_545 ?auto_548 ) ) ( not ( = ?auto_546 ?auto_548 ) ) ( LIFTING ?auto_549 ?auto_551 ) ( IS-CRATE ?auto_551 ) ( not ( = ?auto_544 ?auto_551 ) ) ( not ( = ?auto_543 ?auto_551 ) ) ( not ( = ?auto_545 ?auto_551 ) ) ( not ( = ?auto_546 ?auto_551 ) ) ( not ( = ?auto_548 ?auto_551 ) ) )
    :subtasks
    ( ( !LOAD ?auto_549 ?auto_551 ?auto_547 ?auto_550 )
      ( MAKE-ON ?auto_544 ?auto_543 )
      ( MAKE-ON-VERIFY ?auto_544 ?auto_543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_553 - SURFACE
      ?auto_552 - SURFACE
    )
    :vars
    (
      ?auto_560 - HOIST
      ?auto_554 - PLACE
      ?auto_555 - TRUCK
      ?auto_557 - SURFACE
      ?auto_556 - SURFACE
      ?auto_559 - SURFACE
      ?auto_558 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_560 ?auto_554 ) ( SURFACE-AT ?auto_552 ?auto_554 ) ( IS-CRATE ?auto_553 ) ( not ( = ?auto_553 ?auto_552 ) ) ( TRUCK-AT ?auto_555 ?auto_554 ) ( IS-CRATE ?auto_557 ) ( not ( = ?auto_553 ?auto_557 ) ) ( not ( = ?auto_552 ?auto_557 ) ) ( SURFACE-AT ?auto_557 ?auto_554 ) ( ON ?auto_557 ?auto_552 ) ( IS-CRATE ?auto_556 ) ( not ( = ?auto_553 ?auto_556 ) ) ( not ( = ?auto_552 ?auto_556 ) ) ( not ( = ?auto_557 ?auto_556 ) ) ( SURFACE-AT ?auto_556 ?auto_554 ) ( ON ?auto_556 ?auto_557 ) ( CLEAR ?auto_556 ) ( SURFACE-AT ?auto_553 ?auto_554 ) ( ON ?auto_553 ?auto_559 ) ( not ( = ?auto_553 ?auto_559 ) ) ( not ( = ?auto_552 ?auto_559 ) ) ( not ( = ?auto_557 ?auto_559 ) ) ( not ( = ?auto_556 ?auto_559 ) ) ( IS-CRATE ?auto_558 ) ( not ( = ?auto_553 ?auto_558 ) ) ( not ( = ?auto_552 ?auto_558 ) ) ( not ( = ?auto_557 ?auto_558 ) ) ( not ( = ?auto_556 ?auto_558 ) ) ( not ( = ?auto_559 ?auto_558 ) ) ( AVAILABLE ?auto_560 ) ( SURFACE-AT ?auto_558 ?auto_554 ) ( ON ?auto_558 ?auto_553 ) ( CLEAR ?auto_558 ) )
    :subtasks
    ( ( !LIFT ?auto_560 ?auto_558 ?auto_553 ?auto_554 )
      ( MAKE-ON ?auto_553 ?auto_552 )
      ( MAKE-ON-VERIFY ?auto_553 ?auto_552 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_562 - SURFACE
      ?auto_561 - SURFACE
    )
    :vars
    (
      ?auto_566 - HOIST
      ?auto_564 - PLACE
      ?auto_568 - SURFACE
      ?auto_567 - SURFACE
      ?auto_565 - SURFACE
      ?auto_563 - SURFACE
      ?auto_569 - TRUCK
      ?auto_570 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_566 ?auto_564 ) ( SURFACE-AT ?auto_561 ?auto_564 ) ( IS-CRATE ?auto_562 ) ( not ( = ?auto_562 ?auto_561 ) ) ( IS-CRATE ?auto_568 ) ( not ( = ?auto_562 ?auto_568 ) ) ( not ( = ?auto_561 ?auto_568 ) ) ( SURFACE-AT ?auto_568 ?auto_564 ) ( ON ?auto_568 ?auto_561 ) ( IS-CRATE ?auto_567 ) ( not ( = ?auto_562 ?auto_567 ) ) ( not ( = ?auto_561 ?auto_567 ) ) ( not ( = ?auto_568 ?auto_567 ) ) ( SURFACE-AT ?auto_567 ?auto_564 ) ( ON ?auto_567 ?auto_568 ) ( CLEAR ?auto_567 ) ( SURFACE-AT ?auto_562 ?auto_564 ) ( ON ?auto_562 ?auto_565 ) ( not ( = ?auto_562 ?auto_565 ) ) ( not ( = ?auto_561 ?auto_565 ) ) ( not ( = ?auto_568 ?auto_565 ) ) ( not ( = ?auto_567 ?auto_565 ) ) ( IS-CRATE ?auto_563 ) ( not ( = ?auto_562 ?auto_563 ) ) ( not ( = ?auto_561 ?auto_563 ) ) ( not ( = ?auto_568 ?auto_563 ) ) ( not ( = ?auto_567 ?auto_563 ) ) ( not ( = ?auto_565 ?auto_563 ) ) ( AVAILABLE ?auto_566 ) ( SURFACE-AT ?auto_563 ?auto_564 ) ( ON ?auto_563 ?auto_562 ) ( CLEAR ?auto_563 ) ( TRUCK-AT ?auto_569 ?auto_570 ) ( not ( = ?auto_570 ?auto_564 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_569 ?auto_570 ?auto_564 )
      ( MAKE-ON ?auto_562 ?auto_561 )
      ( MAKE-ON-VERIFY ?auto_562 ?auto_561 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_587 - SURFACE
      ?auto_586 - SURFACE
    )
    :vars
    (
      ?auto_588 - HOIST
      ?auto_590 - PLACE
      ?auto_589 - TRUCK
      ?auto_591 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_588 ?auto_590 ) ( IS-CRATE ?auto_587 ) ( not ( = ?auto_587 ?auto_586 ) ) ( TRUCK-AT ?auto_589 ?auto_590 ) ( IN ?auto_587 ?auto_589 ) ( SURFACE-AT ?auto_591 ?auto_590 ) ( CLEAR ?auto_591 ) ( LIFTING ?auto_588 ?auto_586 ) ( IS-CRATE ?auto_586 ) ( not ( = ?auto_587 ?auto_591 ) ) ( not ( = ?auto_586 ?auto_591 ) ) )
    :subtasks
    ( ( !DROP ?auto_588 ?auto_586 ?auto_591 ?auto_590 )
      ( MAKE-ON ?auto_587 ?auto_586 )
      ( MAKE-ON-VERIFY ?auto_587 ?auto_586 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_593 - SURFACE
      ?auto_592 - SURFACE
    )
    :vars
    (
      ?auto_597 - HOIST
      ?auto_594 - PLACE
      ?auto_596 - TRUCK
      ?auto_595 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_597 ?auto_594 ) ( IS-CRATE ?auto_593 ) ( not ( = ?auto_593 ?auto_592 ) ) ( TRUCK-AT ?auto_596 ?auto_594 ) ( IN ?auto_593 ?auto_596 ) ( SURFACE-AT ?auto_595 ?auto_594 ) ( CLEAR ?auto_595 ) ( IS-CRATE ?auto_592 ) ( not ( = ?auto_593 ?auto_595 ) ) ( not ( = ?auto_592 ?auto_595 ) ) ( AVAILABLE ?auto_597 ) ( IN ?auto_592 ?auto_596 ) )
    :subtasks
    ( ( !UNLOAD ?auto_597 ?auto_592 ?auto_596 ?auto_594 )
      ( MAKE-ON ?auto_593 ?auto_592 )
      ( MAKE-ON-VERIFY ?auto_593 ?auto_592 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_599 - SURFACE
      ?auto_598 - SURFACE
    )
    :vars
    (
      ?auto_600 - HOIST
      ?auto_602 - PLACE
      ?auto_601 - TRUCK
      ?auto_603 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_600 ?auto_602 ) ( IS-CRATE ?auto_599 ) ( not ( = ?auto_599 ?auto_598 ) ) ( TRUCK-AT ?auto_601 ?auto_602 ) ( SURFACE-AT ?auto_603 ?auto_602 ) ( CLEAR ?auto_603 ) ( IS-CRATE ?auto_598 ) ( not ( = ?auto_599 ?auto_603 ) ) ( not ( = ?auto_598 ?auto_603 ) ) ( IN ?auto_598 ?auto_601 ) ( LIFTING ?auto_600 ?auto_599 ) )
    :subtasks
    ( ( !LOAD ?auto_600 ?auto_599 ?auto_601 ?auto_602 )
      ( MAKE-ON ?auto_599 ?auto_598 )
      ( MAKE-ON-VERIFY ?auto_599 ?auto_598 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_605 - SURFACE
      ?auto_604 - SURFACE
    )
    :vars
    (
      ?auto_608 - HOIST
      ?auto_606 - PLACE
      ?auto_609 - TRUCK
      ?auto_607 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_608 ?auto_606 ) ( IS-CRATE ?auto_605 ) ( not ( = ?auto_605 ?auto_604 ) ) ( TRUCK-AT ?auto_609 ?auto_606 ) ( SURFACE-AT ?auto_607 ?auto_606 ) ( IS-CRATE ?auto_604 ) ( not ( = ?auto_605 ?auto_607 ) ) ( not ( = ?auto_604 ?auto_607 ) ) ( IN ?auto_604 ?auto_609 ) ( AVAILABLE ?auto_608 ) ( SURFACE-AT ?auto_605 ?auto_606 ) ( ON ?auto_605 ?auto_607 ) ( CLEAR ?auto_605 ) )
    :subtasks
    ( ( !LIFT ?auto_608 ?auto_605 ?auto_607 ?auto_606 )
      ( MAKE-ON ?auto_605 ?auto_604 )
      ( MAKE-ON-VERIFY ?auto_605 ?auto_604 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_611 - SURFACE
      ?auto_610 - SURFACE
    )
    :vars
    (
      ?auto_613 - HOIST
      ?auto_614 - PLACE
      ?auto_612 - TRUCK
      ?auto_615 - SURFACE
      ?auto_616 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_613 ?auto_614 ) ( IS-CRATE ?auto_611 ) ( not ( = ?auto_611 ?auto_610 ) ) ( TRUCK-AT ?auto_612 ?auto_614 ) ( SURFACE-AT ?auto_615 ?auto_614 ) ( IS-CRATE ?auto_610 ) ( not ( = ?auto_611 ?auto_615 ) ) ( not ( = ?auto_610 ?auto_615 ) ) ( IN ?auto_610 ?auto_612 ) ( SURFACE-AT ?auto_611 ?auto_614 ) ( ON ?auto_611 ?auto_615 ) ( CLEAR ?auto_611 ) ( LIFTING ?auto_613 ?auto_616 ) ( IS-CRATE ?auto_616 ) ( not ( = ?auto_611 ?auto_616 ) ) ( not ( = ?auto_610 ?auto_616 ) ) ( not ( = ?auto_615 ?auto_616 ) ) )
    :subtasks
    ( ( !LOAD ?auto_613 ?auto_616 ?auto_612 ?auto_614 )
      ( MAKE-ON ?auto_611 ?auto_610 )
      ( MAKE-ON-VERIFY ?auto_611 ?auto_610 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_618 - SURFACE
      ?auto_617 - SURFACE
    )
    :vars
    (
      ?auto_619 - HOIST
      ?auto_621 - PLACE
      ?auto_623 - TRUCK
      ?auto_622 - SURFACE
      ?auto_620 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_619 ?auto_621 ) ( IS-CRATE ?auto_618 ) ( not ( = ?auto_618 ?auto_617 ) ) ( TRUCK-AT ?auto_623 ?auto_621 ) ( SURFACE-AT ?auto_622 ?auto_621 ) ( IS-CRATE ?auto_617 ) ( not ( = ?auto_618 ?auto_622 ) ) ( not ( = ?auto_617 ?auto_622 ) ) ( IN ?auto_617 ?auto_623 ) ( SURFACE-AT ?auto_618 ?auto_621 ) ( ON ?auto_618 ?auto_622 ) ( IS-CRATE ?auto_620 ) ( not ( = ?auto_618 ?auto_620 ) ) ( not ( = ?auto_617 ?auto_620 ) ) ( not ( = ?auto_622 ?auto_620 ) ) ( AVAILABLE ?auto_619 ) ( SURFACE-AT ?auto_620 ?auto_621 ) ( ON ?auto_620 ?auto_618 ) ( CLEAR ?auto_620 ) )
    :subtasks
    ( ( !LIFT ?auto_619 ?auto_620 ?auto_618 ?auto_621 )
      ( MAKE-ON ?auto_618 ?auto_617 )
      ( MAKE-ON-VERIFY ?auto_618 ?auto_617 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_625 - SURFACE
      ?auto_624 - SURFACE
    )
    :vars
    (
      ?auto_628 - HOIST
      ?auto_626 - PLACE
      ?auto_630 - SURFACE
      ?auto_629 - TRUCK
      ?auto_627 - SURFACE
      ?auto_631 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_628 ?auto_626 ) ( IS-CRATE ?auto_625 ) ( not ( = ?auto_625 ?auto_624 ) ) ( SURFACE-AT ?auto_630 ?auto_626 ) ( IS-CRATE ?auto_624 ) ( not ( = ?auto_625 ?auto_630 ) ) ( not ( = ?auto_624 ?auto_630 ) ) ( IN ?auto_624 ?auto_629 ) ( SURFACE-AT ?auto_625 ?auto_626 ) ( ON ?auto_625 ?auto_630 ) ( IS-CRATE ?auto_627 ) ( not ( = ?auto_625 ?auto_627 ) ) ( not ( = ?auto_624 ?auto_627 ) ) ( not ( = ?auto_630 ?auto_627 ) ) ( AVAILABLE ?auto_628 ) ( SURFACE-AT ?auto_627 ?auto_626 ) ( ON ?auto_627 ?auto_625 ) ( CLEAR ?auto_627 ) ( TRUCK-AT ?auto_629 ?auto_631 ) ( not ( = ?auto_631 ?auto_626 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_629 ?auto_631 ?auto_626 )
      ( MAKE-ON ?auto_625 ?auto_624 )
      ( MAKE-ON-VERIFY ?auto_625 ?auto_624 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_639 - SURFACE
      ?auto_638 - SURFACE
    )
    :vars
    (
      ?auto_640 - HOIST
      ?auto_644 - PLACE
      ?auto_643 - TRUCK
      ?auto_642 - SURFACE
      ?auto_641 - SURFACE
      ?auto_646 - SURFACE
      ?auto_645 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_640 ?auto_644 ) ( IS-CRATE ?auto_639 ) ( not ( = ?auto_639 ?auto_638 ) ) ( TRUCK-AT ?auto_643 ?auto_644 ) ( SURFACE-AT ?auto_642 ?auto_644 ) ( IS-CRATE ?auto_638 ) ( not ( = ?auto_639 ?auto_642 ) ) ( not ( = ?auto_638 ?auto_642 ) ) ( IN ?auto_638 ?auto_643 ) ( SURFACE-AT ?auto_639 ?auto_644 ) ( ON ?auto_639 ?auto_642 ) ( IS-CRATE ?auto_641 ) ( not ( = ?auto_639 ?auto_641 ) ) ( not ( = ?auto_638 ?auto_641 ) ) ( not ( = ?auto_642 ?auto_641 ) ) ( SURFACE-AT ?auto_641 ?auto_644 ) ( ON ?auto_641 ?auto_639 ) ( CLEAR ?auto_641 ) ( SURFACE-AT ?auto_646 ?auto_644 ) ( CLEAR ?auto_646 ) ( LIFTING ?auto_640 ?auto_645 ) ( IS-CRATE ?auto_645 ) ( not ( = ?auto_639 ?auto_646 ) ) ( not ( = ?auto_639 ?auto_645 ) ) ( not ( = ?auto_638 ?auto_646 ) ) ( not ( = ?auto_638 ?auto_645 ) ) ( not ( = ?auto_642 ?auto_646 ) ) ( not ( = ?auto_642 ?auto_645 ) ) ( not ( = ?auto_641 ?auto_646 ) ) ( not ( = ?auto_641 ?auto_645 ) ) ( not ( = ?auto_646 ?auto_645 ) ) )
    :subtasks
    ( ( !DROP ?auto_640 ?auto_645 ?auto_646 ?auto_644 )
      ( MAKE-ON ?auto_639 ?auto_638 )
      ( MAKE-ON-VERIFY ?auto_639 ?auto_638 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_650 - SURFACE
      ?auto_649 - SURFACE
    )
    :vars
    (
      ?auto_654 - HOIST
      ?auto_652 - PLACE
      ?auto_655 - TRUCK
      ?auto_653 - SURFACE
      ?auto_651 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_654 ?auto_652 ) ( IS-CRATE ?auto_650 ) ( not ( = ?auto_650 ?auto_649 ) ) ( TRUCK-AT ?auto_655 ?auto_652 ) ( SURFACE-AT ?auto_653 ?auto_652 ) ( IS-CRATE ?auto_649 ) ( not ( = ?auto_650 ?auto_653 ) ) ( not ( = ?auto_649 ?auto_653 ) ) ( SURFACE-AT ?auto_650 ?auto_652 ) ( ON ?auto_650 ?auto_653 ) ( IS-CRATE ?auto_651 ) ( not ( = ?auto_650 ?auto_651 ) ) ( not ( = ?auto_649 ?auto_651 ) ) ( not ( = ?auto_653 ?auto_651 ) ) ( SURFACE-AT ?auto_651 ?auto_652 ) ( ON ?auto_651 ?auto_650 ) ( CLEAR ?auto_651 ) ( LIFTING ?auto_654 ?auto_649 ) )
    :subtasks
    ( ( !LOAD ?auto_654 ?auto_649 ?auto_655 ?auto_652 )
      ( MAKE-ON ?auto_650 ?auto_649 )
      ( MAKE-ON-VERIFY ?auto_650 ?auto_649 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_657 - SURFACE
      ?auto_656 - SURFACE
    )
    :vars
    (
      ?auto_660 - HOIST
      ?auto_658 - PLACE
      ?auto_659 - TRUCK
      ?auto_661 - SURFACE
      ?auto_662 - SURFACE
      ?auto_663 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_660 ?auto_658 ) ( IS-CRATE ?auto_657 ) ( not ( = ?auto_657 ?auto_656 ) ) ( TRUCK-AT ?auto_659 ?auto_658 ) ( SURFACE-AT ?auto_661 ?auto_658 ) ( IS-CRATE ?auto_656 ) ( not ( = ?auto_657 ?auto_661 ) ) ( not ( = ?auto_656 ?auto_661 ) ) ( SURFACE-AT ?auto_657 ?auto_658 ) ( ON ?auto_657 ?auto_661 ) ( IS-CRATE ?auto_662 ) ( not ( = ?auto_657 ?auto_662 ) ) ( not ( = ?auto_656 ?auto_662 ) ) ( not ( = ?auto_661 ?auto_662 ) ) ( SURFACE-AT ?auto_662 ?auto_658 ) ( ON ?auto_662 ?auto_657 ) ( CLEAR ?auto_662 ) ( AVAILABLE ?auto_660 ) ( SURFACE-AT ?auto_656 ?auto_658 ) ( ON ?auto_656 ?auto_663 ) ( CLEAR ?auto_656 ) ( not ( = ?auto_657 ?auto_663 ) ) ( not ( = ?auto_656 ?auto_663 ) ) ( not ( = ?auto_661 ?auto_663 ) ) ( not ( = ?auto_662 ?auto_663 ) ) )
    :subtasks
    ( ( !LIFT ?auto_660 ?auto_656 ?auto_663 ?auto_658 )
      ( MAKE-ON ?auto_657 ?auto_656 )
      ( MAKE-ON-VERIFY ?auto_657 ?auto_656 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_665 - SURFACE
      ?auto_664 - SURFACE
    )
    :vars
    (
      ?auto_670 - HOIST
      ?auto_666 - PLACE
      ?auto_669 - TRUCK
      ?auto_668 - SURFACE
      ?auto_667 - SURFACE
      ?auto_671 - SURFACE
      ?auto_672 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_670 ?auto_666 ) ( IS-CRATE ?auto_665 ) ( not ( = ?auto_665 ?auto_664 ) ) ( TRUCK-AT ?auto_669 ?auto_666 ) ( SURFACE-AT ?auto_668 ?auto_666 ) ( IS-CRATE ?auto_664 ) ( not ( = ?auto_665 ?auto_668 ) ) ( not ( = ?auto_664 ?auto_668 ) ) ( SURFACE-AT ?auto_665 ?auto_666 ) ( ON ?auto_665 ?auto_668 ) ( IS-CRATE ?auto_667 ) ( not ( = ?auto_665 ?auto_667 ) ) ( not ( = ?auto_664 ?auto_667 ) ) ( not ( = ?auto_668 ?auto_667 ) ) ( SURFACE-AT ?auto_667 ?auto_666 ) ( ON ?auto_667 ?auto_665 ) ( CLEAR ?auto_667 ) ( SURFACE-AT ?auto_664 ?auto_666 ) ( ON ?auto_664 ?auto_671 ) ( CLEAR ?auto_664 ) ( not ( = ?auto_665 ?auto_671 ) ) ( not ( = ?auto_664 ?auto_671 ) ) ( not ( = ?auto_668 ?auto_671 ) ) ( not ( = ?auto_667 ?auto_671 ) ) ( LIFTING ?auto_670 ?auto_672 ) ( IS-CRATE ?auto_672 ) ( not ( = ?auto_665 ?auto_672 ) ) ( not ( = ?auto_664 ?auto_672 ) ) ( not ( = ?auto_668 ?auto_672 ) ) ( not ( = ?auto_667 ?auto_672 ) ) ( not ( = ?auto_671 ?auto_672 ) ) )
    :subtasks
    ( ( !LOAD ?auto_670 ?auto_672 ?auto_669 ?auto_666 )
      ( MAKE-ON ?auto_665 ?auto_664 )
      ( MAKE-ON-VERIFY ?auto_665 ?auto_664 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_674 - SURFACE
      ?auto_673 - SURFACE
    )
    :vars
    (
      ?auto_677 - HOIST
      ?auto_679 - PLACE
      ?auto_681 - TRUCK
      ?auto_675 - SURFACE
      ?auto_680 - SURFACE
      ?auto_678 - SURFACE
      ?auto_676 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_677 ?auto_679 ) ( IS-CRATE ?auto_674 ) ( not ( = ?auto_674 ?auto_673 ) ) ( TRUCK-AT ?auto_681 ?auto_679 ) ( SURFACE-AT ?auto_675 ?auto_679 ) ( IS-CRATE ?auto_673 ) ( not ( = ?auto_674 ?auto_675 ) ) ( not ( = ?auto_673 ?auto_675 ) ) ( SURFACE-AT ?auto_674 ?auto_679 ) ( ON ?auto_674 ?auto_675 ) ( IS-CRATE ?auto_680 ) ( not ( = ?auto_674 ?auto_680 ) ) ( not ( = ?auto_673 ?auto_680 ) ) ( not ( = ?auto_675 ?auto_680 ) ) ( SURFACE-AT ?auto_680 ?auto_679 ) ( ON ?auto_680 ?auto_674 ) ( CLEAR ?auto_680 ) ( SURFACE-AT ?auto_673 ?auto_679 ) ( ON ?auto_673 ?auto_678 ) ( not ( = ?auto_674 ?auto_678 ) ) ( not ( = ?auto_673 ?auto_678 ) ) ( not ( = ?auto_675 ?auto_678 ) ) ( not ( = ?auto_680 ?auto_678 ) ) ( IS-CRATE ?auto_676 ) ( not ( = ?auto_674 ?auto_676 ) ) ( not ( = ?auto_673 ?auto_676 ) ) ( not ( = ?auto_675 ?auto_676 ) ) ( not ( = ?auto_680 ?auto_676 ) ) ( not ( = ?auto_678 ?auto_676 ) ) ( AVAILABLE ?auto_677 ) ( SURFACE-AT ?auto_676 ?auto_679 ) ( ON ?auto_676 ?auto_673 ) ( CLEAR ?auto_676 ) )
    :subtasks
    ( ( !LIFT ?auto_677 ?auto_676 ?auto_673 ?auto_679 )
      ( MAKE-ON ?auto_674 ?auto_673 )
      ( MAKE-ON-VERIFY ?auto_674 ?auto_673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_683 - SURFACE
      ?auto_682 - SURFACE
    )
    :vars
    (
      ?auto_686 - HOIST
      ?auto_687 - PLACE
      ?auto_688 - SURFACE
      ?auto_684 - SURFACE
      ?auto_689 - SURFACE
      ?auto_690 - SURFACE
      ?auto_685 - TRUCK
      ?auto_691 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_686 ?auto_687 ) ( IS-CRATE ?auto_683 ) ( not ( = ?auto_683 ?auto_682 ) ) ( SURFACE-AT ?auto_688 ?auto_687 ) ( IS-CRATE ?auto_682 ) ( not ( = ?auto_683 ?auto_688 ) ) ( not ( = ?auto_682 ?auto_688 ) ) ( SURFACE-AT ?auto_683 ?auto_687 ) ( ON ?auto_683 ?auto_688 ) ( IS-CRATE ?auto_684 ) ( not ( = ?auto_683 ?auto_684 ) ) ( not ( = ?auto_682 ?auto_684 ) ) ( not ( = ?auto_688 ?auto_684 ) ) ( SURFACE-AT ?auto_684 ?auto_687 ) ( ON ?auto_684 ?auto_683 ) ( CLEAR ?auto_684 ) ( SURFACE-AT ?auto_682 ?auto_687 ) ( ON ?auto_682 ?auto_689 ) ( not ( = ?auto_683 ?auto_689 ) ) ( not ( = ?auto_682 ?auto_689 ) ) ( not ( = ?auto_688 ?auto_689 ) ) ( not ( = ?auto_684 ?auto_689 ) ) ( IS-CRATE ?auto_690 ) ( not ( = ?auto_683 ?auto_690 ) ) ( not ( = ?auto_682 ?auto_690 ) ) ( not ( = ?auto_688 ?auto_690 ) ) ( not ( = ?auto_684 ?auto_690 ) ) ( not ( = ?auto_689 ?auto_690 ) ) ( AVAILABLE ?auto_686 ) ( SURFACE-AT ?auto_690 ?auto_687 ) ( ON ?auto_690 ?auto_682 ) ( CLEAR ?auto_690 ) ( TRUCK-AT ?auto_685 ?auto_691 ) ( not ( = ?auto_691 ?auto_687 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_685 ?auto_691 ?auto_687 )
      ( MAKE-ON ?auto_683 ?auto_682 )
      ( MAKE-ON-VERIFY ?auto_683 ?auto_682 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_720 - SURFACE
      ?auto_719 - SURFACE
    )
    :vars
    (
      ?auto_722 - HOIST
      ?auto_724 - PLACE
      ?auto_721 - TRUCK
      ?auto_723 - SURFACE
      ?auto_725 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_722 ?auto_724 ) ( IS-CRATE ?auto_720 ) ( not ( = ?auto_720 ?auto_719 ) ) ( TRUCK-AT ?auto_721 ?auto_724 ) ( IN ?auto_720 ?auto_721 ) ( IS-CRATE ?auto_719 ) ( not ( = ?auto_720 ?auto_723 ) ) ( not ( = ?auto_719 ?auto_723 ) ) ( IN ?auto_719 ?auto_721 ) ( SURFACE-AT ?auto_725 ?auto_724 ) ( CLEAR ?auto_725 ) ( LIFTING ?auto_722 ?auto_723 ) ( IS-CRATE ?auto_723 ) ( not ( = ?auto_720 ?auto_725 ) ) ( not ( = ?auto_719 ?auto_725 ) ) ( not ( = ?auto_723 ?auto_725 ) ) )
    :subtasks
    ( ( !DROP ?auto_722 ?auto_723 ?auto_725 ?auto_724 )
      ( MAKE-ON ?auto_720 ?auto_719 )
      ( MAKE-ON-VERIFY ?auto_720 ?auto_719 ) )
  )

)

