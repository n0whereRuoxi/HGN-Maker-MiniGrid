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
      ?auto_225 - OBJ
      ?auto_224 - LOCATION
    )
    :vars
    (
      ?auto_227 - LOCATION
      ?auto_228 - CITY
      ?auto_226 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_227 ?auto_228 ) ( IN-CITY ?auto_224 ?auto_228 ) ( not ( = ?auto_224 ?auto_227 ) ) ( OBJ-AT ?auto_225 ?auto_227 ) ( TRUCK-AT ?auto_226 ?auto_224 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_226 ?auto_224 ?auto_227 ?auto_228 )
      ( !LOAD-TRUCK ?auto_225 ?auto_226 ?auto_227 )
      ( !DRIVE-TRUCK ?auto_226 ?auto_227 ?auto_224 ?auto_228 )
      ( !UNLOAD-TRUCK ?auto_225 ?auto_226 ?auto_224 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_232 - OBJ
      ?auto_231 - LOCATION
    )
    :vars
    (
      ?auto_234 - LOCATION
      ?auto_235 - CITY
      ?auto_233 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234 ?auto_235 ) ( IN-CITY ?auto_231 ?auto_235 ) ( not ( = ?auto_231 ?auto_234 ) ) ( OBJ-AT ?auto_232 ?auto_234 ) ( TRUCK-AT ?auto_233 ?auto_231 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_233 ?auto_231 ?auto_234 ?auto_235 )
      ( !LOAD-TRUCK ?auto_232 ?auto_233 ?auto_234 )
      ( !DRIVE-TRUCK ?auto_233 ?auto_234 ?auto_231 ?auto_235 )
      ( !UNLOAD-TRUCK ?auto_232 ?auto_233 ?auto_231 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_246 - OBJ
      ?auto_247 - OBJ
      ?auto_245 - LOCATION
    )
    :vars
    (
      ?auto_250 - LOCATION
      ?auto_248 - CITY
      ?auto_251 - LOCATION
      ?auto_249 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_250 ?auto_248 ) ( IN-CITY ?auto_245 ?auto_248 ) ( not ( = ?auto_245 ?auto_250 ) ) ( OBJ-AT ?auto_247 ?auto_250 ) ( IN-CITY ?auto_251 ?auto_248 ) ( not ( = ?auto_245 ?auto_251 ) ) ( OBJ-AT ?auto_246 ?auto_251 ) ( TRUCK-AT ?auto_249 ?auto_245 ) ( not ( = ?auto_246 ?auto_247 ) ) ( not ( = ?auto_250 ?auto_251 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_246 ?auto_245 )
      ( DELIVER-1PKG ?auto_247 ?auto_245 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_253 - OBJ
      ?auto_254 - OBJ
      ?auto_252 - LOCATION
    )
    :vars
    (
      ?auto_256 - LOCATION
      ?auto_255 - CITY
      ?auto_258 - LOCATION
      ?auto_257 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_256 ?auto_255 ) ( IN-CITY ?auto_252 ?auto_255 ) ( not ( = ?auto_252 ?auto_256 ) ) ( OBJ-AT ?auto_253 ?auto_256 ) ( IN-CITY ?auto_258 ?auto_255 ) ( not ( = ?auto_252 ?auto_258 ) ) ( OBJ-AT ?auto_254 ?auto_258 ) ( TRUCK-AT ?auto_257 ?auto_252 ) ( not ( = ?auto_254 ?auto_253 ) ) ( not ( = ?auto_256 ?auto_258 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_254 ?auto_253 ?auto_252 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_270 - OBJ
      ?auto_269 - LOCATION
    )
    :vars
    (
      ?auto_272 - LOCATION
      ?auto_273 - CITY
      ?auto_271 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_272 ?auto_273 ) ( IN-CITY ?auto_269 ?auto_273 ) ( not ( = ?auto_269 ?auto_272 ) ) ( OBJ-AT ?auto_270 ?auto_272 ) ( TRUCK-AT ?auto_271 ?auto_269 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_271 ?auto_269 ?auto_272 ?auto_273 )
      ( !LOAD-TRUCK ?auto_270 ?auto_271 ?auto_272 )
      ( !DRIVE-TRUCK ?auto_271 ?auto_272 ?auto_269 ?auto_273 )
      ( !UNLOAD-TRUCK ?auto_270 ?auto_271 ?auto_269 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_361 - OBJ
      ?auto_362 - OBJ
      ?auto_363 - OBJ
      ?auto_360 - LOCATION
    )
    :vars
    (
      ?auto_365 - LOCATION
      ?auto_364 - CITY
      ?auto_368 - LOCATION
      ?auto_367 - LOCATION
      ?auto_366 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_365 ?auto_364 ) ( IN-CITY ?auto_360 ?auto_364 ) ( not ( = ?auto_360 ?auto_365 ) ) ( OBJ-AT ?auto_363 ?auto_365 ) ( IN-CITY ?auto_368 ?auto_364 ) ( not ( = ?auto_360 ?auto_368 ) ) ( OBJ-AT ?auto_362 ?auto_368 ) ( IN-CITY ?auto_367 ?auto_364 ) ( not ( = ?auto_360 ?auto_367 ) ) ( OBJ-AT ?auto_361 ?auto_367 ) ( TRUCK-AT ?auto_366 ?auto_360 ) ( not ( = ?auto_361 ?auto_362 ) ) ( not ( = ?auto_368 ?auto_367 ) ) ( not ( = ?auto_361 ?auto_363 ) ) ( not ( = ?auto_362 ?auto_363 ) ) ( not ( = ?auto_365 ?auto_368 ) ) ( not ( = ?auto_365 ?auto_367 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_362 ?auto_361 ?auto_360 )
      ( DELIVER-1PKG ?auto_363 ?auto_360 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_380 - OBJ
      ?auto_381 - OBJ
      ?auto_382 - OBJ
      ?auto_379 - LOCATION
    )
    :vars
    (
      ?auto_387 - LOCATION
      ?auto_385 - CITY
      ?auto_384 - LOCATION
      ?auto_383 - LOCATION
      ?auto_386 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_387 ?auto_385 ) ( IN-CITY ?auto_379 ?auto_385 ) ( not ( = ?auto_379 ?auto_387 ) ) ( OBJ-AT ?auto_381 ?auto_387 ) ( IN-CITY ?auto_384 ?auto_385 ) ( not ( = ?auto_379 ?auto_384 ) ) ( OBJ-AT ?auto_382 ?auto_384 ) ( IN-CITY ?auto_383 ?auto_385 ) ( not ( = ?auto_379 ?auto_383 ) ) ( OBJ-AT ?auto_380 ?auto_383 ) ( TRUCK-AT ?auto_386 ?auto_379 ) ( not ( = ?auto_380 ?auto_382 ) ) ( not ( = ?auto_384 ?auto_383 ) ) ( not ( = ?auto_380 ?auto_381 ) ) ( not ( = ?auto_382 ?auto_381 ) ) ( not ( = ?auto_387 ?auto_384 ) ) ( not ( = ?auto_387 ?auto_383 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_380 ?auto_382 ?auto_381 ?auto_379 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_399 - OBJ
      ?auto_400 - OBJ
      ?auto_401 - OBJ
      ?auto_398 - LOCATION
    )
    :vars
    (
      ?auto_403 - LOCATION
      ?auto_404 - CITY
      ?auto_406 - LOCATION
      ?auto_405 - LOCATION
      ?auto_402 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_403 ?auto_404 ) ( IN-CITY ?auto_398 ?auto_404 ) ( not ( = ?auto_398 ?auto_403 ) ) ( OBJ-AT ?auto_401 ?auto_403 ) ( IN-CITY ?auto_406 ?auto_404 ) ( not ( = ?auto_398 ?auto_406 ) ) ( OBJ-AT ?auto_399 ?auto_406 ) ( IN-CITY ?auto_405 ?auto_404 ) ( not ( = ?auto_398 ?auto_405 ) ) ( OBJ-AT ?auto_400 ?auto_405 ) ( TRUCK-AT ?auto_402 ?auto_398 ) ( not ( = ?auto_400 ?auto_399 ) ) ( not ( = ?auto_406 ?auto_405 ) ) ( not ( = ?auto_400 ?auto_401 ) ) ( not ( = ?auto_399 ?auto_401 ) ) ( not ( = ?auto_403 ?auto_406 ) ) ( not ( = ?auto_403 ?auto_405 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_400 ?auto_401 ?auto_399 ?auto_398 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_418 - OBJ
      ?auto_419 - OBJ
      ?auto_420 - OBJ
      ?auto_417 - LOCATION
    )
    :vars
    (
      ?auto_422 - LOCATION
      ?auto_423 - CITY
      ?auto_425 - LOCATION
      ?auto_424 - LOCATION
      ?auto_421 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_422 ?auto_423 ) ( IN-CITY ?auto_417 ?auto_423 ) ( not ( = ?auto_417 ?auto_422 ) ) ( OBJ-AT ?auto_419 ?auto_422 ) ( IN-CITY ?auto_425 ?auto_423 ) ( not ( = ?auto_417 ?auto_425 ) ) ( OBJ-AT ?auto_418 ?auto_425 ) ( IN-CITY ?auto_424 ?auto_423 ) ( not ( = ?auto_417 ?auto_424 ) ) ( OBJ-AT ?auto_420 ?auto_424 ) ( TRUCK-AT ?auto_421 ?auto_417 ) ( not ( = ?auto_420 ?auto_418 ) ) ( not ( = ?auto_425 ?auto_424 ) ) ( not ( = ?auto_420 ?auto_419 ) ) ( not ( = ?auto_418 ?auto_419 ) ) ( not ( = ?auto_422 ?auto_425 ) ) ( not ( = ?auto_422 ?auto_424 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_420 ?auto_419 ?auto_418 ?auto_417 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_457 - OBJ
      ?auto_458 - OBJ
      ?auto_459 - OBJ
      ?auto_456 - LOCATION
    )
    :vars
    (
      ?auto_461 - LOCATION
      ?auto_462 - CITY
      ?auto_464 - LOCATION
      ?auto_463 - LOCATION
      ?auto_460 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_461 ?auto_462 ) ( IN-CITY ?auto_456 ?auto_462 ) ( not ( = ?auto_456 ?auto_461 ) ) ( OBJ-AT ?auto_457 ?auto_461 ) ( IN-CITY ?auto_464 ?auto_462 ) ( not ( = ?auto_456 ?auto_464 ) ) ( OBJ-AT ?auto_459 ?auto_464 ) ( IN-CITY ?auto_463 ?auto_462 ) ( not ( = ?auto_456 ?auto_463 ) ) ( OBJ-AT ?auto_458 ?auto_463 ) ( TRUCK-AT ?auto_460 ?auto_456 ) ( not ( = ?auto_458 ?auto_459 ) ) ( not ( = ?auto_464 ?auto_463 ) ) ( not ( = ?auto_458 ?auto_457 ) ) ( not ( = ?auto_459 ?auto_457 ) ) ( not ( = ?auto_461 ?auto_464 ) ) ( not ( = ?auto_461 ?auto_463 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_458 ?auto_457 ?auto_459 ?auto_456 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_476 - OBJ
      ?auto_477 - OBJ
      ?auto_478 - OBJ
      ?auto_475 - LOCATION
    )
    :vars
    (
      ?auto_480 - LOCATION
      ?auto_481 - CITY
      ?auto_483 - LOCATION
      ?auto_482 - LOCATION
      ?auto_479 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_480 ?auto_481 ) ( IN-CITY ?auto_475 ?auto_481 ) ( not ( = ?auto_475 ?auto_480 ) ) ( OBJ-AT ?auto_476 ?auto_480 ) ( IN-CITY ?auto_483 ?auto_481 ) ( not ( = ?auto_475 ?auto_483 ) ) ( OBJ-AT ?auto_477 ?auto_483 ) ( IN-CITY ?auto_482 ?auto_481 ) ( not ( = ?auto_475 ?auto_482 ) ) ( OBJ-AT ?auto_478 ?auto_482 ) ( TRUCK-AT ?auto_479 ?auto_475 ) ( not ( = ?auto_478 ?auto_477 ) ) ( not ( = ?auto_483 ?auto_482 ) ) ( not ( = ?auto_478 ?auto_476 ) ) ( not ( = ?auto_477 ?auto_476 ) ) ( not ( = ?auto_480 ?auto_483 ) ) ( not ( = ?auto_480 ?auto_482 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_478 ?auto_476 ?auto_477 ?auto_475 ) )
  )

)

