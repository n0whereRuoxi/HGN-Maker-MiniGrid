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
      ?auto_249 - CITY
      ?auto_251 - LOCATION
      ?auto_248 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_250 ?auto_249 ) ( IN-CITY ?auto_245 ?auto_249 ) ( not ( = ?auto_245 ?auto_250 ) ) ( OBJ-AT ?auto_247 ?auto_250 ) ( IN-CITY ?auto_251 ?auto_249 ) ( not ( = ?auto_245 ?auto_251 ) ) ( OBJ-AT ?auto_246 ?auto_251 ) ( TRUCK-AT ?auto_248 ?auto_245 ) ( not ( = ?auto_246 ?auto_247 ) ) ( not ( = ?auto_250 ?auto_251 ) ) )
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
      ?auto_257 - CITY
      ?auto_258 - LOCATION
      ?auto_255 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_256 ?auto_257 ) ( IN-CITY ?auto_252 ?auto_257 ) ( not ( = ?auto_252 ?auto_256 ) ) ( OBJ-AT ?auto_253 ?auto_256 ) ( IN-CITY ?auto_258 ?auto_257 ) ( not ( = ?auto_252 ?auto_258 ) ) ( OBJ-AT ?auto_254 ?auto_258 ) ( TRUCK-AT ?auto_255 ?auto_252 ) ( not ( = ?auto_254 ?auto_253 ) ) ( not ( = ?auto_256 ?auto_258 ) ) )
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
      ?auto_360 - OBJ
      ?auto_361 - OBJ
      ?auto_362 - OBJ
      ?auto_359 - LOCATION
    )
    :vars
    (
      ?auto_365 - LOCATION
      ?auto_364 - CITY
      ?auto_366 - LOCATION
      ?auto_363 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_365 ?auto_364 ) ( IN-CITY ?auto_359 ?auto_364 ) ( not ( = ?auto_359 ?auto_365 ) ) ( OBJ-AT ?auto_362 ?auto_365 ) ( IN-CITY ?auto_366 ?auto_364 ) ( not ( = ?auto_359 ?auto_366 ) ) ( OBJ-AT ?auto_361 ?auto_366 ) ( OBJ-AT ?auto_360 ?auto_365 ) ( TRUCK-AT ?auto_363 ?auto_359 ) ( not ( = ?auto_360 ?auto_361 ) ) ( not ( = ?auto_366 ?auto_365 ) ) ( not ( = ?auto_360 ?auto_362 ) ) ( not ( = ?auto_361 ?auto_362 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_361 ?auto_360 ?auto_359 )
      ( DELIVER-1PKG ?auto_362 ?auto_359 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_377 - OBJ
      ?auto_378 - OBJ
      ?auto_379 - OBJ
      ?auto_376 - LOCATION
    )
    :vars
    (
      ?auto_381 - LOCATION
      ?auto_380 - CITY
      ?auto_383 - LOCATION
      ?auto_382 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_381 ?auto_380 ) ( IN-CITY ?auto_376 ?auto_380 ) ( not ( = ?auto_376 ?auto_381 ) ) ( OBJ-AT ?auto_378 ?auto_381 ) ( IN-CITY ?auto_383 ?auto_380 ) ( not ( = ?auto_376 ?auto_383 ) ) ( OBJ-AT ?auto_379 ?auto_383 ) ( OBJ-AT ?auto_377 ?auto_381 ) ( TRUCK-AT ?auto_382 ?auto_376 ) ( not ( = ?auto_377 ?auto_379 ) ) ( not ( = ?auto_383 ?auto_381 ) ) ( not ( = ?auto_377 ?auto_378 ) ) ( not ( = ?auto_379 ?auto_378 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_377 ?auto_379 ?auto_378 ?auto_376 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_394 - OBJ
      ?auto_395 - OBJ
      ?auto_396 - OBJ
      ?auto_393 - LOCATION
    )
    :vars
    (
      ?auto_400 - LOCATION
      ?auto_399 - CITY
      ?auto_397 - LOCATION
      ?auto_398 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_400 ?auto_399 ) ( IN-CITY ?auto_393 ?auto_399 ) ( not ( = ?auto_393 ?auto_400 ) ) ( OBJ-AT ?auto_396 ?auto_400 ) ( IN-CITY ?auto_397 ?auto_399 ) ( not ( = ?auto_393 ?auto_397 ) ) ( OBJ-AT ?auto_394 ?auto_397 ) ( OBJ-AT ?auto_395 ?auto_400 ) ( TRUCK-AT ?auto_398 ?auto_393 ) ( not ( = ?auto_395 ?auto_394 ) ) ( not ( = ?auto_397 ?auto_400 ) ) ( not ( = ?auto_395 ?auto_396 ) ) ( not ( = ?auto_394 ?auto_396 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_395 ?auto_396 ?auto_394 ?auto_393 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_411 - OBJ
      ?auto_412 - OBJ
      ?auto_413 - OBJ
      ?auto_410 - LOCATION
    )
    :vars
    (
      ?auto_417 - LOCATION
      ?auto_416 - CITY
      ?auto_414 - LOCATION
      ?auto_415 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_417 ?auto_416 ) ( IN-CITY ?auto_410 ?auto_416 ) ( not ( = ?auto_410 ?auto_417 ) ) ( OBJ-AT ?auto_412 ?auto_417 ) ( IN-CITY ?auto_414 ?auto_416 ) ( not ( = ?auto_410 ?auto_414 ) ) ( OBJ-AT ?auto_411 ?auto_414 ) ( OBJ-AT ?auto_413 ?auto_417 ) ( TRUCK-AT ?auto_415 ?auto_410 ) ( not ( = ?auto_413 ?auto_411 ) ) ( not ( = ?auto_414 ?auto_417 ) ) ( not ( = ?auto_413 ?auto_412 ) ) ( not ( = ?auto_411 ?auto_412 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_413 ?auto_412 ?auto_411 ?auto_410 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_446 - OBJ
      ?auto_447 - OBJ
      ?auto_448 - OBJ
      ?auto_445 - LOCATION
    )
    :vars
    (
      ?auto_452 - LOCATION
      ?auto_451 - CITY
      ?auto_449 - LOCATION
      ?auto_450 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_452 ?auto_451 ) ( IN-CITY ?auto_445 ?auto_451 ) ( not ( = ?auto_445 ?auto_452 ) ) ( OBJ-AT ?auto_446 ?auto_452 ) ( IN-CITY ?auto_449 ?auto_451 ) ( not ( = ?auto_445 ?auto_449 ) ) ( OBJ-AT ?auto_448 ?auto_449 ) ( OBJ-AT ?auto_447 ?auto_452 ) ( TRUCK-AT ?auto_450 ?auto_445 ) ( not ( = ?auto_447 ?auto_448 ) ) ( not ( = ?auto_449 ?auto_452 ) ) ( not ( = ?auto_447 ?auto_446 ) ) ( not ( = ?auto_448 ?auto_446 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_447 ?auto_446 ?auto_448 ?auto_445 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_463 - OBJ
      ?auto_464 - OBJ
      ?auto_465 - OBJ
      ?auto_462 - LOCATION
    )
    :vars
    (
      ?auto_469 - LOCATION
      ?auto_468 - CITY
      ?auto_466 - LOCATION
      ?auto_467 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_469 ?auto_468 ) ( IN-CITY ?auto_462 ?auto_468 ) ( not ( = ?auto_462 ?auto_469 ) ) ( OBJ-AT ?auto_463 ?auto_469 ) ( IN-CITY ?auto_466 ?auto_468 ) ( not ( = ?auto_462 ?auto_466 ) ) ( OBJ-AT ?auto_464 ?auto_466 ) ( OBJ-AT ?auto_465 ?auto_469 ) ( TRUCK-AT ?auto_467 ?auto_462 ) ( not ( = ?auto_465 ?auto_464 ) ) ( not ( = ?auto_466 ?auto_469 ) ) ( not ( = ?auto_465 ?auto_463 ) ) ( not ( = ?auto_464 ?auto_463 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_465 ?auto_463 ?auto_464 ?auto_462 ) )
  )

)

