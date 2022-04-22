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
      ?AUTO_15 - LOCATION
      ?AUTO_13 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?AUTO_7 ?AUTO_11 ) ( TRUCK-AT ?AUTO_11 ?AUTO_15 ) ( IN-CITY ?AUTO_15 ?AUTO_13 ) ( IN-CITY ?AUTO_8 ?AUTO_13 ) ( not ( = ?AUTO_8 ?AUTO_15 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_11 ?AUTO_15 ?AUTO_8 ?AUTO_13 )
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
      ?AUTO_26 - OBJ
      ?AUTO_27 - LOCATION
    )
    :vars
    (
      ?AUTO_28 - LOCATION
      ?AUTO_31 - CITY
      ?AUTO_32 - TRUCK
      ?AUTO_37 - LOCATION
      ?AUTO_35 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_28 ?AUTO_31 ) ( IN-CITY ?AUTO_27 ?AUTO_31 ) ( not ( = ?AUTO_27 ?AUTO_28 ) ) ( OBJ-AT ?AUTO_26 ?AUTO_28 ) ( TRUCK-AT ?AUTO_32 ?AUTO_37 ) ( IN-CITY ?AUTO_37 ?AUTO_35 ) ( IN-CITY ?AUTO_28 ?AUTO_35 ) ( not ( = ?AUTO_28 ?AUTO_37 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_32 ?AUTO_37 ?AUTO_28 ?AUTO_35 )
      ( DELIVER-PKG ?AUTO_26 ?AUTO_27 )
      ( DELIVER-PKG-VERIFY ?AUTO_26 ?AUTO_27 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_94 - OBJ
      ?AUTO_95 - LOCATION
    )
    :vars
    (
      ?AUTO_96 - AIRPLANE
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_94 ?AUTO_96 ) ( AIRPLANE-AT ?AUTO_96 ?AUTO_95 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_94 ?AUTO_96 ?AUTO_95 )
      ( DELIVER-PKG-VERIFY ?AUTO_94 ?AUTO_95 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_99 - OBJ
      ?AUTO_100 - LOCATION
    )
    :vars
    (
      ?AUTO_103 - AIRPLANE
      ?AUTO_106 - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?AUTO_99 ?AUTO_103 ) ( AIRPORT ?AUTO_106 ) ( AIRPORT ?AUTO_100 ) ( AIRPLANE-AT ?AUTO_103 ?AUTO_106 ) ( not ( = ?AUTO_106 ?AUTO_100 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_103 ?AUTO_106 ?AUTO_100 )
      ( DELIVER-PKG ?AUTO_99 ?AUTO_100 )
      ( DELIVER-PKG-VERIFY ?AUTO_99 ?AUTO_100 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_119 - OBJ
      ?AUTO_120 - LOCATION
    )
    :vars
    (
      ?AUTO_122 - LOCATION
      ?AUTO_124 - AIRPLANE
      ?AUTO_126 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_122 ) ( AIRPORT ?AUTO_120 ) ( AIRPLANE-AT ?AUTO_124 ?AUTO_122 ) ( not ( = ?AUTO_122 ?AUTO_120 ) ) ( OBJ-AT ?AUTO_119 ?AUTO_126 ) ( AIRPLANE-AT ?AUTO_124 ?AUTO_126 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_119 ?AUTO_124 ?AUTO_126 )
      ( DELIVER-PKG ?AUTO_119 ?AUTO_120 )
      ( DELIVER-PKG-VERIFY ?AUTO_119 ?AUTO_120 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_128 - OBJ
      ?AUTO_129 - LOCATION
    )
    :vars
    (
      ?AUTO_133 - LOCATION
      ?AUTO_130 - AIRPLANE
      ?AUTO_134 - LOCATION
      ?AUTO_135 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_133 ) ( AIRPORT ?AUTO_129 ) ( AIRPLANE-AT ?AUTO_130 ?AUTO_133 ) ( not ( = ?AUTO_133 ?AUTO_129 ) ) ( AIRPLANE-AT ?AUTO_130 ?AUTO_134 ) ( TRUCK-AT ?AUTO_135 ?AUTO_134 ) ( IN-TRUCK ?AUTO_128 ?AUTO_135 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_128 ?AUTO_135 ?AUTO_134 )
      ( DELIVER-PKG ?AUTO_128 ?AUTO_129 )
      ( DELIVER-PKG-VERIFY ?AUTO_128 ?AUTO_129 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_138 - OBJ
      ?AUTO_139 - LOCATION
    )
    :vars
    (
      ?AUTO_144 - LOCATION
      ?AUTO_142 - AIRPLANE
      ?AUTO_140 - LOCATION
      ?AUTO_145 - TRUCK
      ?AUTO_149 - LOCATION
      ?AUTO_147 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_144 ) ( AIRPORT ?AUTO_139 ) ( AIRPLANE-AT ?AUTO_142 ?AUTO_144 ) ( not ( = ?AUTO_144 ?AUTO_139 ) ) ( AIRPLANE-AT ?AUTO_142 ?AUTO_140 ) ( IN-TRUCK ?AUTO_138 ?AUTO_145 ) ( TRUCK-AT ?AUTO_145 ?AUTO_149 ) ( IN-CITY ?AUTO_149 ?AUTO_147 ) ( IN-CITY ?AUTO_140 ?AUTO_147 ) ( not ( = ?AUTO_140 ?AUTO_149 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_145 ?AUTO_149 ?AUTO_140 ?AUTO_147 )
      ( DELIVER-PKG ?AUTO_138 ?AUTO_139 )
      ( DELIVER-PKG-VERIFY ?AUTO_138 ?AUTO_139 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_150 - OBJ
      ?AUTO_151 - LOCATION
    )
    :vars
    (
      ?AUTO_157 - LOCATION
      ?AUTO_156 - AIRPLANE
      ?AUTO_158 - LOCATION
      ?AUTO_153 - TRUCK
      ?AUTO_159 - LOCATION
      ?AUTO_154 - CITY
      ?AUTO_161 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_157 ) ( AIRPORT ?AUTO_151 ) ( AIRPLANE-AT ?AUTO_156 ?AUTO_157 ) ( not ( = ?AUTO_157 ?AUTO_151 ) ) ( AIRPLANE-AT ?AUTO_156 ?AUTO_158 ) ( TRUCK-AT ?AUTO_153 ?AUTO_159 ) ( IN-CITY ?AUTO_159 ?AUTO_154 ) ( IN-CITY ?AUTO_158 ?AUTO_154 ) ( not ( = ?AUTO_158 ?AUTO_159 ) ) ( TRUCK-AT ?AUTO_153 ?AUTO_161 ) ( OBJ-AT ?AUTO_150 ?AUTO_161 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_150 ?AUTO_153 ?AUTO_161 )
      ( DELIVER-PKG ?AUTO_150 ?AUTO_151 )
      ( DELIVER-PKG-VERIFY ?AUTO_150 ?AUTO_151 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_163 - OBJ
      ?AUTO_164 - LOCATION
    )
    :vars
    (
      ?AUTO_169 - LOCATION
      ?AUTO_167 - AIRPLANE
      ?AUTO_170 - LOCATION
      ?AUTO_173 - LOCATION
      ?AUTO_172 - CITY
      ?AUTO_171 - TRUCK
      ?AUTO_177 - LOCATION
      ?AUTO_175 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_169 ) ( AIRPORT ?AUTO_164 ) ( AIRPLANE-AT ?AUTO_167 ?AUTO_169 ) ( not ( = ?AUTO_169 ?AUTO_164 ) ) ( AIRPLANE-AT ?AUTO_167 ?AUTO_170 ) ( IN-CITY ?AUTO_173 ?AUTO_172 ) ( IN-CITY ?AUTO_170 ?AUTO_172 ) ( not ( = ?AUTO_170 ?AUTO_173 ) ) ( OBJ-AT ?AUTO_163 ?AUTO_173 ) ( TRUCK-AT ?AUTO_171 ?AUTO_177 ) ( IN-CITY ?AUTO_177 ?AUTO_175 ) ( IN-CITY ?AUTO_173 ?AUTO_175 ) ( not ( = ?AUTO_173 ?AUTO_177 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_171 ?AUTO_177 ?AUTO_173 ?AUTO_175 )
      ( DELIVER-PKG ?AUTO_163 ?AUTO_164 )
      ( DELIVER-PKG-VERIFY ?AUTO_163 ?AUTO_164 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_250 - OBJ
      ?AUTO_251 - LOCATION
    )
    :vars
    (
      ?AUTO_253 - LOCATION
      ?AUTO_257 - LOCATION
      ?AUTO_260 - CITY
      ?AUTO_256 - TRUCK
      ?AUTO_261 - LOCATION
      ?AUTO_259 - CITY
      ?AUTO_264 - LOCATION
      ?AUTO_255 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_253 ) ( AIRPORT ?AUTO_251 ) ( not ( = ?AUTO_253 ?AUTO_251 ) ) ( IN-CITY ?AUTO_257 ?AUTO_260 ) ( IN-CITY ?AUTO_253 ?AUTO_260 ) ( not ( = ?AUTO_253 ?AUTO_257 ) ) ( OBJ-AT ?AUTO_250 ?AUTO_257 ) ( TRUCK-AT ?AUTO_256 ?AUTO_261 ) ( IN-CITY ?AUTO_261 ?AUTO_259 ) ( IN-CITY ?AUTO_257 ?AUTO_259 ) ( not ( = ?AUTO_257 ?AUTO_261 ) ) ( AIRPORT ?AUTO_264 ) ( AIRPLANE-AT ?AUTO_255 ?AUTO_264 ) ( not ( = ?AUTO_264 ?AUTO_253 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_255 ?AUTO_264 ?AUTO_253 )
      ( DELIVER-PKG ?AUTO_250 ?AUTO_251 )
      ( DELIVER-PKG-VERIFY ?AUTO_250 ?AUTO_251 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_369 - OBJ
      ?AUTO_370 - LOCATION
    )
    :vars
    (
      ?AUTO_373 - LOCATION
      ?AUTO_372 - CITY
      ?AUTO_371 - TRUCK
      ?AUTO_375 - LOCATION
      ?AUTO_376 - CITY
      ?AUTO_378 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_373 ?AUTO_372 ) ( IN-CITY ?AUTO_370 ?AUTO_372 ) ( not ( = ?AUTO_370 ?AUTO_373 ) ) ( TRUCK-AT ?AUTO_371 ?AUTO_375 ) ( IN-CITY ?AUTO_375 ?AUTO_376 ) ( IN-CITY ?AUTO_373 ?AUTO_376 ) ( not ( = ?AUTO_373 ?AUTO_375 ) ) ( IN-AIRPLANE ?AUTO_369 ?AUTO_378 ) ( AIRPLANE-AT ?AUTO_378 ?AUTO_373 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_369 ?AUTO_378 ?AUTO_373 )
      ( DELIVER-PKG ?AUTO_369 ?AUTO_370 )
      ( DELIVER-PKG-VERIFY ?AUTO_369 ?AUTO_370 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_381 - OBJ
      ?AUTO_382 - LOCATION
    )
    :vars
    (
      ?AUTO_384 - LOCATION
      ?AUTO_387 - CITY
      ?AUTO_386 - TRUCK
      ?AUTO_388 - LOCATION
      ?AUTO_385 - CITY
      ?AUTO_390 - AIRPLANE
      ?AUTO_393 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_384 ?AUTO_387 ) ( IN-CITY ?AUTO_382 ?AUTO_387 ) ( not ( = ?AUTO_382 ?AUTO_384 ) ) ( TRUCK-AT ?AUTO_386 ?AUTO_388 ) ( IN-CITY ?AUTO_388 ?AUTO_385 ) ( IN-CITY ?AUTO_384 ?AUTO_385 ) ( not ( = ?AUTO_384 ?AUTO_388 ) ) ( IN-AIRPLANE ?AUTO_381 ?AUTO_390 ) ( AIRPORT ?AUTO_393 ) ( AIRPORT ?AUTO_384 ) ( AIRPLANE-AT ?AUTO_390 ?AUTO_393 ) ( not ( = ?AUTO_393 ?AUTO_384 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_390 ?AUTO_393 ?AUTO_384 )
      ( DELIVER-PKG ?AUTO_381 ?AUTO_382 )
      ( DELIVER-PKG-VERIFY ?AUTO_381 ?AUTO_382 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_406 - OBJ
      ?AUTO_407 - LOCATION
    )
    :vars
    (
      ?AUTO_412 - LOCATION
      ?AUTO_416 - CITY
      ?AUTO_414 - TRUCK
      ?AUTO_415 - LOCATION
      ?AUTO_410 - CITY
      ?AUTO_411 - LOCATION
      ?AUTO_409 - AIRPLANE
      ?AUTO_418 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_412 ?AUTO_416 ) ( IN-CITY ?AUTO_407 ?AUTO_416 ) ( not ( = ?AUTO_407 ?AUTO_412 ) ) ( TRUCK-AT ?AUTO_414 ?AUTO_415 ) ( IN-CITY ?AUTO_415 ?AUTO_410 ) ( IN-CITY ?AUTO_412 ?AUTO_410 ) ( not ( = ?AUTO_412 ?AUTO_415 ) ) ( AIRPORT ?AUTO_411 ) ( AIRPORT ?AUTO_412 ) ( AIRPLANE-AT ?AUTO_409 ?AUTO_411 ) ( not ( = ?AUTO_411 ?AUTO_412 ) ) ( OBJ-AT ?AUTO_406 ?AUTO_418 ) ( AIRPLANE-AT ?AUTO_409 ?AUTO_418 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_406 ?AUTO_409 ?AUTO_418 )
      ( DELIVER-PKG ?AUTO_406 ?AUTO_407 )
      ( DELIVER-PKG-VERIFY ?AUTO_406 ?AUTO_407 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_420 - OBJ
      ?AUTO_421 - LOCATION
    )
    :vars
    (
      ?AUTO_426 - LOCATION
      ?AUTO_431 - CITY
      ?AUTO_430 - TRUCK
      ?AUTO_425 - LOCATION
      ?AUTO_427 - CITY
      ?AUTO_424 - LOCATION
      ?AUTO_429 - AIRPLANE
      ?AUTO_423 - LOCATION
      ?AUTO_432 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_426 ?AUTO_431 ) ( IN-CITY ?AUTO_421 ?AUTO_431 ) ( not ( = ?AUTO_421 ?AUTO_426 ) ) ( TRUCK-AT ?AUTO_430 ?AUTO_425 ) ( IN-CITY ?AUTO_425 ?AUTO_427 ) ( IN-CITY ?AUTO_426 ?AUTO_427 ) ( not ( = ?AUTO_426 ?AUTO_425 ) ) ( AIRPORT ?AUTO_424 ) ( AIRPORT ?AUTO_426 ) ( AIRPLANE-AT ?AUTO_429 ?AUTO_424 ) ( not ( = ?AUTO_424 ?AUTO_426 ) ) ( AIRPLANE-AT ?AUTO_429 ?AUTO_423 ) ( TRUCK-AT ?AUTO_432 ?AUTO_423 ) ( IN-TRUCK ?AUTO_420 ?AUTO_432 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_420 ?AUTO_432 ?AUTO_423 )
      ( DELIVER-PKG ?AUTO_420 ?AUTO_421 )
      ( DELIVER-PKG-VERIFY ?AUTO_420 ?AUTO_421 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_435 - OBJ
      ?AUTO_436 - LOCATION
    )
    :vars
    (
      ?AUTO_442 - LOCATION
      ?AUTO_447 - CITY
      ?AUTO_440 - TRUCK
      ?AUTO_444 - LOCATION
      ?AUTO_445 - CITY
      ?AUTO_439 - LOCATION
      ?AUTO_443 - AIRPLANE
      ?AUTO_441 - LOCATION
      ?AUTO_437 - TRUCK
      ?AUTO_451 - LOCATION
      ?AUTO_449 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_442 ?AUTO_447 ) ( IN-CITY ?AUTO_436 ?AUTO_447 ) ( not ( = ?AUTO_436 ?AUTO_442 ) ) ( TRUCK-AT ?AUTO_440 ?AUTO_444 ) ( IN-CITY ?AUTO_444 ?AUTO_445 ) ( IN-CITY ?AUTO_442 ?AUTO_445 ) ( not ( = ?AUTO_442 ?AUTO_444 ) ) ( AIRPORT ?AUTO_439 ) ( AIRPORT ?AUTO_442 ) ( AIRPLANE-AT ?AUTO_443 ?AUTO_439 ) ( not ( = ?AUTO_439 ?AUTO_442 ) ) ( AIRPLANE-AT ?AUTO_443 ?AUTO_441 ) ( IN-TRUCK ?AUTO_435 ?AUTO_437 ) ( TRUCK-AT ?AUTO_437 ?AUTO_451 ) ( IN-CITY ?AUTO_451 ?AUTO_449 ) ( IN-CITY ?AUTO_441 ?AUTO_449 ) ( not ( = ?AUTO_441 ?AUTO_451 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_437 ?AUTO_451 ?AUTO_441 ?AUTO_449 )
      ( DELIVER-PKG ?AUTO_435 ?AUTO_436 )
      ( DELIVER-PKG-VERIFY ?AUTO_435 ?AUTO_436 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_452 - OBJ
      ?AUTO_453 - LOCATION
    )
    :vars
    (
      ?AUTO_465 - LOCATION
      ?AUTO_456 - CITY
      ?AUTO_458 - TRUCK
      ?AUTO_455 - LOCATION
      ?AUTO_463 - CITY
      ?AUTO_457 - LOCATION
      ?AUTO_464 - AIRPLANE
      ?AUTO_466 - LOCATION
      ?AUTO_459 - TRUCK
      ?AUTO_462 - LOCATION
      ?AUTO_461 - CITY
      ?AUTO_468 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_465 ?AUTO_456 ) ( IN-CITY ?AUTO_453 ?AUTO_456 ) ( not ( = ?AUTO_453 ?AUTO_465 ) ) ( TRUCK-AT ?AUTO_458 ?AUTO_455 ) ( IN-CITY ?AUTO_455 ?AUTO_463 ) ( IN-CITY ?AUTO_465 ?AUTO_463 ) ( not ( = ?AUTO_465 ?AUTO_455 ) ) ( AIRPORT ?AUTO_457 ) ( AIRPORT ?AUTO_465 ) ( AIRPLANE-AT ?AUTO_464 ?AUTO_457 ) ( not ( = ?AUTO_457 ?AUTO_465 ) ) ( AIRPLANE-AT ?AUTO_464 ?AUTO_466 ) ( TRUCK-AT ?AUTO_459 ?AUTO_462 ) ( IN-CITY ?AUTO_462 ?AUTO_461 ) ( IN-CITY ?AUTO_466 ?AUTO_461 ) ( not ( = ?AUTO_466 ?AUTO_462 ) ) ( TRUCK-AT ?AUTO_459 ?AUTO_468 ) ( OBJ-AT ?AUTO_452 ?AUTO_468 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_452 ?AUTO_459 ?AUTO_468 )
      ( DELIVER-PKG ?AUTO_452 ?AUTO_453 )
      ( DELIVER-PKG-VERIFY ?AUTO_452 ?AUTO_453 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_470 - OBJ
      ?AUTO_471 - LOCATION
    )
    :vars
    (
      ?AUTO_472 - LOCATION
      ?AUTO_484 - CITY
      ?AUTO_481 - TRUCK
      ?AUTO_474 - LOCATION
      ?AUTO_480 - CITY
      ?AUTO_483 - LOCATION
      ?AUTO_473 - AIRPLANE
      ?AUTO_478 - LOCATION
      ?AUTO_479 - LOCATION
      ?AUTO_482 - CITY
      ?AUTO_477 - TRUCK
      ?AUTO_489 - LOCATION
      ?AUTO_487 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_472 ?AUTO_484 ) ( IN-CITY ?AUTO_471 ?AUTO_484 ) ( not ( = ?AUTO_471 ?AUTO_472 ) ) ( TRUCK-AT ?AUTO_481 ?AUTO_474 ) ( IN-CITY ?AUTO_474 ?AUTO_480 ) ( IN-CITY ?AUTO_472 ?AUTO_480 ) ( not ( = ?AUTO_472 ?AUTO_474 ) ) ( AIRPORT ?AUTO_483 ) ( AIRPORT ?AUTO_472 ) ( AIRPLANE-AT ?AUTO_473 ?AUTO_483 ) ( not ( = ?AUTO_483 ?AUTO_472 ) ) ( AIRPLANE-AT ?AUTO_473 ?AUTO_478 ) ( IN-CITY ?AUTO_479 ?AUTO_482 ) ( IN-CITY ?AUTO_478 ?AUTO_482 ) ( not ( = ?AUTO_478 ?AUTO_479 ) ) ( OBJ-AT ?AUTO_470 ?AUTO_479 ) ( TRUCK-AT ?AUTO_477 ?AUTO_489 ) ( IN-CITY ?AUTO_489 ?AUTO_487 ) ( IN-CITY ?AUTO_479 ?AUTO_487 ) ( not ( = ?AUTO_479 ?AUTO_489 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_477 ?AUTO_489 ?AUTO_479 ?AUTO_487 )
      ( DELIVER-PKG ?AUTO_470 ?AUTO_471 )
      ( DELIVER-PKG-VERIFY ?AUTO_470 ?AUTO_471 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_548 - OBJ
      ?AUTO_549 - LOCATION
    )
    :vars
    (
      ?AUTO_550 - LOCATION
      ?AUTO_555 - TRUCK
      ?AUTO_552 - LOCATION
      ?AUTO_557 - CITY
      ?AUTO_560 - LOCATION
      ?AUTO_553 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_550 ) ( AIRPORT ?AUTO_549 ) ( not ( = ?AUTO_550 ?AUTO_549 ) ) ( IN-TRUCK ?AUTO_548 ?AUTO_555 ) ( TRUCK-AT ?AUTO_555 ?AUTO_552 ) ( IN-CITY ?AUTO_552 ?AUTO_557 ) ( IN-CITY ?AUTO_550 ?AUTO_557 ) ( not ( = ?AUTO_550 ?AUTO_552 ) ) ( AIRPORT ?AUTO_560 ) ( AIRPLANE-AT ?AUTO_553 ?AUTO_560 ) ( not ( = ?AUTO_560 ?AUTO_550 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_553 ?AUTO_560 ?AUTO_550 )
      ( DELIVER-PKG ?AUTO_548 ?AUTO_549 )
      ( DELIVER-PKG-VERIFY ?AUTO_548 ?AUTO_549 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_585 - OBJ
      ?AUTO_586 - LOCATION
    )
    :vars
    (
      ?AUTO_591 - LOCATION
      ?AUTO_594 - LOCATION
      ?AUTO_589 - AIRPLANE
    )
    :precondition
    ( and ( AIRPORT ?AUTO_591 ) ( AIRPORT ?AUTO_586 ) ( not ( = ?AUTO_591 ?AUTO_586 ) ) ( OBJ-AT ?AUTO_585 ?AUTO_591 ) ( AIRPORT ?AUTO_594 ) ( AIRPLANE-AT ?AUTO_589 ?AUTO_594 ) ( not ( = ?AUTO_594 ?AUTO_591 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_589 ?AUTO_594 ?AUTO_591 )
      ( DELIVER-PKG ?AUTO_585 ?AUTO_586 )
      ( DELIVER-PKG-VERIFY ?AUTO_585 ?AUTO_586 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_730 - OBJ
      ?AUTO_731 - LOCATION
    )
    :vars
    (
      ?AUTO_732 - LOCATION
      ?AUTO_734 - LOCATION
      ?AUTO_733 - AIRPLANE
      ?AUTO_737 - TRUCK
    )
    :precondition
    ( and ( AIRPORT ?AUTO_732 ) ( AIRPORT ?AUTO_731 ) ( not ( = ?AUTO_732 ?AUTO_731 ) ) ( AIRPORT ?AUTO_734 ) ( AIRPLANE-AT ?AUTO_733 ?AUTO_734 ) ( not ( = ?AUTO_734 ?AUTO_732 ) ) ( TRUCK-AT ?AUTO_737 ?AUTO_732 ) ( IN-TRUCK ?AUTO_730 ?AUTO_737 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_730 ?AUTO_737 ?AUTO_732 )
      ( DELIVER-PKG ?AUTO_730 ?AUTO_731 )
      ( DELIVER-PKG-VERIFY ?AUTO_730 ?AUTO_731 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_740 - OBJ
      ?AUTO_741 - LOCATION
    )
    :vars
    (
      ?AUTO_745 - LOCATION
      ?AUTO_746 - LOCATION
      ?AUTO_744 - AIRPLANE
      ?AUTO_747 - TRUCK
      ?AUTO_751 - LOCATION
      ?AUTO_749 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_745 ) ( AIRPORT ?AUTO_741 ) ( not ( = ?AUTO_745 ?AUTO_741 ) ) ( AIRPORT ?AUTO_746 ) ( AIRPLANE-AT ?AUTO_744 ?AUTO_746 ) ( not ( = ?AUTO_746 ?AUTO_745 ) ) ( IN-TRUCK ?AUTO_740 ?AUTO_747 ) ( TRUCK-AT ?AUTO_747 ?AUTO_751 ) ( IN-CITY ?AUTO_751 ?AUTO_749 ) ( IN-CITY ?AUTO_745 ?AUTO_749 ) ( not ( = ?AUTO_745 ?AUTO_751 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_747 ?AUTO_751 ?AUTO_745 ?AUTO_749 )
      ( DELIVER-PKG ?AUTO_740 ?AUTO_741 )
      ( DELIVER-PKG-VERIFY ?AUTO_740 ?AUTO_741 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_752 - OBJ
      ?AUTO_753 - LOCATION
    )
    :vars
    (
      ?AUTO_759 - LOCATION
      ?AUTO_761 - LOCATION
      ?AUTO_757 - AIRPLANE
      ?AUTO_760 - TRUCK
      ?AUTO_758 - LOCATION
      ?AUTO_754 - CITY
      ?AUTO_763 - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?AUTO_759 ) ( AIRPORT ?AUTO_753 ) ( not ( = ?AUTO_759 ?AUTO_753 ) ) ( AIRPORT ?AUTO_761 ) ( AIRPLANE-AT ?AUTO_757 ?AUTO_761 ) ( not ( = ?AUTO_761 ?AUTO_759 ) ) ( TRUCK-AT ?AUTO_760 ?AUTO_758 ) ( IN-CITY ?AUTO_758 ?AUTO_754 ) ( IN-CITY ?AUTO_759 ?AUTO_754 ) ( not ( = ?AUTO_759 ?AUTO_758 ) ) ( TRUCK-AT ?AUTO_760 ?AUTO_763 ) ( OBJ-AT ?AUTO_752 ?AUTO_763 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_752 ?AUTO_760 ?AUTO_763 )
      ( DELIVER-PKG ?AUTO_752 ?AUTO_753 )
      ( DELIVER-PKG-VERIFY ?AUTO_752 ?AUTO_753 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_765 - OBJ
      ?AUTO_766 - LOCATION
    )
    :vars
    (
      ?AUTO_769 - LOCATION
      ?AUTO_774 - LOCATION
      ?AUTO_768 - AIRPLANE
      ?AUTO_775 - LOCATION
      ?AUTO_767 - CITY
      ?AUTO_773 - TRUCK
      ?AUTO_779 - LOCATION
      ?AUTO_777 - CITY
    )
    :precondition
    ( and ( AIRPORT ?AUTO_769 ) ( AIRPORT ?AUTO_766 ) ( not ( = ?AUTO_769 ?AUTO_766 ) ) ( AIRPORT ?AUTO_774 ) ( AIRPLANE-AT ?AUTO_768 ?AUTO_774 ) ( not ( = ?AUTO_774 ?AUTO_769 ) ) ( IN-CITY ?AUTO_775 ?AUTO_767 ) ( IN-CITY ?AUTO_769 ?AUTO_767 ) ( not ( = ?AUTO_769 ?AUTO_775 ) ) ( OBJ-AT ?AUTO_765 ?AUTO_775 ) ( TRUCK-AT ?AUTO_773 ?AUTO_779 ) ( IN-CITY ?AUTO_779 ?AUTO_777 ) ( IN-CITY ?AUTO_775 ?AUTO_777 ) ( not ( = ?AUTO_775 ?AUTO_779 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_773 ?AUTO_779 ?AUTO_775 ?AUTO_777 )
      ( DELIVER-PKG ?AUTO_765 ?AUTO_766 )
      ( DELIVER-PKG-VERIFY ?AUTO_765 ?AUTO_766 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1019 - OBJ
      ?AUTO_1020 - LOCATION
    )
    :vars
    (
      ?AUTO_1023 - TRUCK
      ?AUTO_1025 - LOCATION
      ?AUTO_1024 - CITY
      ?AUTO_1026 - LOCATION
      ?AUTO_1027 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1023 ?AUTO_1025 ) ( IN-CITY ?AUTO_1025 ?AUTO_1024 ) ( IN-CITY ?AUTO_1020 ?AUTO_1024 ) ( not ( = ?AUTO_1020 ?AUTO_1025 ) ) ( TRUCK-AT ?AUTO_1023 ?AUTO_1026 ) ( IN-AIRPLANE ?AUTO_1019 ?AUTO_1027 ) ( AIRPLANE-AT ?AUTO_1027 ?AUTO_1026 ) )
    :subtasks
    ( ( !UNLOAD-AIRPLANE ?AUTO_1019 ?AUTO_1027 ?AUTO_1026 )
      ( DELIVER-PKG ?AUTO_1019 ?AUTO_1020 )
      ( DELIVER-PKG-VERIFY ?AUTO_1019 ?AUTO_1020 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1030 - OBJ
      ?AUTO_1031 - LOCATION
    )
    :vars
    (
      ?AUTO_1037 - TRUCK
      ?AUTO_1033 - LOCATION
      ?AUTO_1036 - CITY
      ?AUTO_1035 - LOCATION
      ?AUTO_1032 - AIRPLANE
      ?AUTO_1041 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1037 ?AUTO_1033 ) ( IN-CITY ?AUTO_1033 ?AUTO_1036 ) ( IN-CITY ?AUTO_1031 ?AUTO_1036 ) ( not ( = ?AUTO_1031 ?AUTO_1033 ) ) ( TRUCK-AT ?AUTO_1037 ?AUTO_1035 ) ( IN-AIRPLANE ?AUTO_1030 ?AUTO_1032 ) ( AIRPORT ?AUTO_1041 ) ( AIRPORT ?AUTO_1035 ) ( AIRPLANE-AT ?AUTO_1032 ?AUTO_1041 ) ( not ( = ?AUTO_1041 ?AUTO_1035 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1032 ?AUTO_1041 ?AUTO_1035 )
      ( DELIVER-PKG ?AUTO_1030 ?AUTO_1031 )
      ( DELIVER-PKG-VERIFY ?AUTO_1030 ?AUTO_1031 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1044 - OBJ
      ?AUTO_1045 - LOCATION
    )
    :vars
    (
      ?AUTO_1052 - TRUCK
      ?AUTO_1047 - LOCATION
      ?AUTO_1050 - CITY
      ?AUTO_1048 - LOCATION
      ?AUTO_1046 - LOCATION
      ?AUTO_1053 - AIRPLANE
      ?AUTO_1055 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1052 ?AUTO_1047 ) ( IN-CITY ?AUTO_1047 ?AUTO_1050 ) ( IN-CITY ?AUTO_1045 ?AUTO_1050 ) ( not ( = ?AUTO_1045 ?AUTO_1047 ) ) ( TRUCK-AT ?AUTO_1052 ?AUTO_1048 ) ( AIRPORT ?AUTO_1046 ) ( AIRPORT ?AUTO_1048 ) ( AIRPLANE-AT ?AUTO_1053 ?AUTO_1046 ) ( not ( = ?AUTO_1046 ?AUTO_1048 ) ) ( OBJ-AT ?AUTO_1044 ?AUTO_1055 ) ( AIRPLANE-AT ?AUTO_1053 ?AUTO_1055 ) )
    :subtasks
    ( ( !LOAD-AIRPLANE ?AUTO_1044 ?AUTO_1053 ?AUTO_1055 )
      ( DELIVER-PKG ?AUTO_1044 ?AUTO_1045 )
      ( DELIVER-PKG-VERIFY ?AUTO_1044 ?AUTO_1045 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1057 - OBJ
      ?AUTO_1058 - LOCATION
    )
    :vars
    (
      ?AUTO_1061 - TRUCK
      ?AUTO_1062 - LOCATION
      ?AUTO_1064 - CITY
      ?AUTO_1059 - LOCATION
      ?AUTO_1067 - LOCATION
      ?AUTO_1070 - LOCATION
      ?AUTO_1065 - AIRPLANE
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_1061 ?AUTO_1062 ) ( IN-CITY ?AUTO_1062 ?AUTO_1064 ) ( IN-CITY ?AUTO_1058 ?AUTO_1064 ) ( not ( = ?AUTO_1058 ?AUTO_1062 ) ) ( TRUCK-AT ?AUTO_1061 ?AUTO_1059 ) ( AIRPORT ?AUTO_1067 ) ( AIRPORT ?AUTO_1059 ) ( not ( = ?AUTO_1067 ?AUTO_1059 ) ) ( OBJ-AT ?AUTO_1057 ?AUTO_1067 ) ( AIRPORT ?AUTO_1070 ) ( AIRPLANE-AT ?AUTO_1065 ?AUTO_1070 ) ( not ( = ?AUTO_1070 ?AUTO_1067 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1065 ?AUTO_1070 ?AUTO_1067 )
      ( DELIVER-PKG ?AUTO_1057 ?AUTO_1058 )
      ( DELIVER-PKG-VERIFY ?AUTO_1057 ?AUTO_1058 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_1531 - OBJ
      ?AUTO_1532 - LOCATION
    )
    :vars
    (
      ?AUTO_1539 - LOCATION
      ?AUTO_1541 - CITY
      ?AUTO_1538 - TRUCK
      ?AUTO_1535 - LOCATION
      ?AUTO_1533 - CITY
      ?AUTO_1540 - LOCATION
      ?AUTO_1545 - LOCATION
      ?AUTO_1536 - AIRPLANE
    )
    :precondition
    ( and ( IN-CITY ?AUTO_1539 ?AUTO_1541 ) ( IN-CITY ?AUTO_1532 ?AUTO_1541 ) ( not ( = ?AUTO_1532 ?AUTO_1539 ) ) ( TRUCK-AT ?AUTO_1538 ?AUTO_1535 ) ( IN-CITY ?AUTO_1535 ?AUTO_1533 ) ( IN-CITY ?AUTO_1539 ?AUTO_1533 ) ( not ( = ?AUTO_1539 ?AUTO_1535 ) ) ( AIRPORT ?AUTO_1540 ) ( AIRPORT ?AUTO_1539 ) ( not ( = ?AUTO_1540 ?AUTO_1539 ) ) ( OBJ-AT ?AUTO_1531 ?AUTO_1540 ) ( AIRPORT ?AUTO_1545 ) ( AIRPLANE-AT ?AUTO_1536 ?AUTO_1545 ) ( not ( = ?AUTO_1545 ?AUTO_1540 ) ) )
    :subtasks
    ( ( !FLY-AIRPLANE ?AUTO_1536 ?AUTO_1545 ?AUTO_1540 )
      ( DELIVER-PKG ?AUTO_1531 ?AUTO_1532 )
      ( DELIVER-PKG-VERIFY ?AUTO_1531 ?AUTO_1532 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2152 - OBJ
      ?AUTO_2153 - LOCATION
    )
    :vars
    (
      ?AUTO_2160 - LOCATION
      ?AUTO_2155 - CITY
      ?AUTO_2156 - LOCATION
      ?AUTO_2159 - LOCATION
      ?AUTO_2158 - AIRPLANE
      ?AUTO_2154 - TRUCK
      ?AUTO_2166 - LOCATION
      ?AUTO_2164 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2160 ?AUTO_2155 ) ( IN-CITY ?AUTO_2153 ?AUTO_2155 ) ( not ( = ?AUTO_2153 ?AUTO_2160 ) ) ( AIRPORT ?AUTO_2156 ) ( AIRPORT ?AUTO_2160 ) ( not ( = ?AUTO_2156 ?AUTO_2160 ) ) ( OBJ-AT ?AUTO_2152 ?AUTO_2156 ) ( AIRPORT ?AUTO_2159 ) ( AIRPLANE-AT ?AUTO_2158 ?AUTO_2159 ) ( not ( = ?AUTO_2159 ?AUTO_2156 ) ) ( TRUCK-AT ?AUTO_2154 ?AUTO_2166 ) ( IN-CITY ?AUTO_2166 ?AUTO_2164 ) ( IN-CITY ?AUTO_2160 ?AUTO_2164 ) ( not ( = ?AUTO_2160 ?AUTO_2166 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2154 ?AUTO_2166 ?AUTO_2160 ?AUTO_2164 )
      ( DELIVER-PKG ?AUTO_2152 ?AUTO_2153 )
      ( DELIVER-PKG-VERIFY ?AUTO_2152 ?AUTO_2153 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2179 - OBJ
      ?AUTO_2180 - LOCATION
    )
    :vars
    (
      ?AUTO_2182 - LOCATION
      ?AUTO_2189 - CITY
      ?AUTO_2188 - LOCATION
      ?AUTO_2185 - LOCATION
      ?AUTO_2181 - AIRPLANE
      ?AUTO_2184 - TRUCK
      ?AUTO_2187 - LOCATION
      ?AUTO_2190 - CITY
      ?AUTO_2191 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2182 ?AUTO_2189 ) ( IN-CITY ?AUTO_2180 ?AUTO_2189 ) ( not ( = ?AUTO_2180 ?AUTO_2182 ) ) ( AIRPORT ?AUTO_2188 ) ( AIRPORT ?AUTO_2182 ) ( not ( = ?AUTO_2188 ?AUTO_2182 ) ) ( AIRPORT ?AUTO_2185 ) ( AIRPLANE-AT ?AUTO_2181 ?AUTO_2185 ) ( not ( = ?AUTO_2185 ?AUTO_2188 ) ) ( TRUCK-AT ?AUTO_2184 ?AUTO_2187 ) ( IN-CITY ?AUTO_2187 ?AUTO_2190 ) ( IN-CITY ?AUTO_2182 ?AUTO_2190 ) ( not ( = ?AUTO_2182 ?AUTO_2187 ) ) ( TRUCK-AT ?AUTO_2191 ?AUTO_2188 ) ( IN-TRUCK ?AUTO_2179 ?AUTO_2191 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2179 ?AUTO_2191 ?AUTO_2188 )
      ( DELIVER-PKG ?AUTO_2179 ?AUTO_2180 )
      ( DELIVER-PKG-VERIFY ?AUTO_2179 ?AUTO_2180 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2194 - OBJ
      ?AUTO_2195 - LOCATION
    )
    :vars
    (
      ?AUTO_2205 - LOCATION
      ?AUTO_2202 - CITY
      ?AUTO_2199 - LOCATION
      ?AUTO_2204 - LOCATION
      ?AUTO_2200 - AIRPLANE
      ?AUTO_2203 - TRUCK
      ?AUTO_2201 - LOCATION
      ?AUTO_2206 - CITY
      ?AUTO_2198 - TRUCK
      ?AUTO_2210 - LOCATION
      ?AUTO_2208 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2205 ?AUTO_2202 ) ( IN-CITY ?AUTO_2195 ?AUTO_2202 ) ( not ( = ?AUTO_2195 ?AUTO_2205 ) ) ( AIRPORT ?AUTO_2199 ) ( AIRPORT ?AUTO_2205 ) ( not ( = ?AUTO_2199 ?AUTO_2205 ) ) ( AIRPORT ?AUTO_2204 ) ( AIRPLANE-AT ?AUTO_2200 ?AUTO_2204 ) ( not ( = ?AUTO_2204 ?AUTO_2199 ) ) ( TRUCK-AT ?AUTO_2203 ?AUTO_2201 ) ( IN-CITY ?AUTO_2201 ?AUTO_2206 ) ( IN-CITY ?AUTO_2205 ?AUTO_2206 ) ( not ( = ?AUTO_2205 ?AUTO_2201 ) ) ( IN-TRUCK ?AUTO_2194 ?AUTO_2198 ) ( TRUCK-AT ?AUTO_2198 ?AUTO_2210 ) ( IN-CITY ?AUTO_2210 ?AUTO_2208 ) ( IN-CITY ?AUTO_2199 ?AUTO_2208 ) ( not ( = ?AUTO_2199 ?AUTO_2210 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2198 ?AUTO_2210 ?AUTO_2199 ?AUTO_2208 )
      ( DELIVER-PKG ?AUTO_2194 ?AUTO_2195 )
      ( DELIVER-PKG-VERIFY ?AUTO_2194 ?AUTO_2195 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2215 - OBJ
      ?AUTO_2216 - LOCATION
    )
    :vars
    (
      ?AUTO_2229 - LOCATION
      ?AUTO_2222 - CITY
      ?AUTO_2219 - LOCATION
      ?AUTO_2225 - LOCATION
      ?AUTO_2218 - AIRPLANE
      ?AUTO_2221 - TRUCK
      ?AUTO_2227 - LOCATION
      ?AUTO_2228 - CITY
      ?AUTO_2224 - TRUCK
      ?AUTO_2223 - LOCATION
      ?AUTO_2220 - CITY
      ?AUTO_2231 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2229 ?AUTO_2222 ) ( IN-CITY ?AUTO_2216 ?AUTO_2222 ) ( not ( = ?AUTO_2216 ?AUTO_2229 ) ) ( AIRPORT ?AUTO_2219 ) ( AIRPORT ?AUTO_2229 ) ( not ( = ?AUTO_2219 ?AUTO_2229 ) ) ( AIRPORT ?AUTO_2225 ) ( AIRPLANE-AT ?AUTO_2218 ?AUTO_2225 ) ( not ( = ?AUTO_2225 ?AUTO_2219 ) ) ( TRUCK-AT ?AUTO_2221 ?AUTO_2227 ) ( IN-CITY ?AUTO_2227 ?AUTO_2228 ) ( IN-CITY ?AUTO_2229 ?AUTO_2228 ) ( not ( = ?AUTO_2229 ?AUTO_2227 ) ) ( TRUCK-AT ?AUTO_2224 ?AUTO_2223 ) ( IN-CITY ?AUTO_2223 ?AUTO_2220 ) ( IN-CITY ?AUTO_2219 ?AUTO_2220 ) ( not ( = ?AUTO_2219 ?AUTO_2223 ) ) ( TRUCK-AT ?AUTO_2224 ?AUTO_2231 ) ( OBJ-AT ?AUTO_2215 ?AUTO_2231 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2215 ?AUTO_2224 ?AUTO_2231 )
      ( DELIVER-PKG ?AUTO_2215 ?AUTO_2216 )
      ( DELIVER-PKG-VERIFY ?AUTO_2215 ?AUTO_2216 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2233 - OBJ
      ?AUTO_2234 - LOCATION
    )
    :vars
    (
      ?AUTO_2241 - LOCATION
      ?AUTO_2248 - CITY
      ?AUTO_2237 - LOCATION
      ?AUTO_2236 - LOCATION
      ?AUTO_2238 - AIRPLANE
      ?AUTO_2242 - TRUCK
      ?AUTO_2240 - LOCATION
      ?AUTO_2246 - CITY
      ?AUTO_2247 - LOCATION
      ?AUTO_2239 - CITY
      ?AUTO_2243 - TRUCK
      ?AUTO_2252 - LOCATION
      ?AUTO_2250 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_2241 ?AUTO_2248 ) ( IN-CITY ?AUTO_2234 ?AUTO_2248 ) ( not ( = ?AUTO_2234 ?AUTO_2241 ) ) ( AIRPORT ?AUTO_2237 ) ( AIRPORT ?AUTO_2241 ) ( not ( = ?AUTO_2237 ?AUTO_2241 ) ) ( AIRPORT ?AUTO_2236 ) ( AIRPLANE-AT ?AUTO_2238 ?AUTO_2236 ) ( not ( = ?AUTO_2236 ?AUTO_2237 ) ) ( TRUCK-AT ?AUTO_2242 ?AUTO_2240 ) ( IN-CITY ?AUTO_2240 ?AUTO_2246 ) ( IN-CITY ?AUTO_2241 ?AUTO_2246 ) ( not ( = ?AUTO_2241 ?AUTO_2240 ) ) ( IN-CITY ?AUTO_2247 ?AUTO_2239 ) ( IN-CITY ?AUTO_2237 ?AUTO_2239 ) ( not ( = ?AUTO_2237 ?AUTO_2247 ) ) ( OBJ-AT ?AUTO_2233 ?AUTO_2247 ) ( TRUCK-AT ?AUTO_2243 ?AUTO_2252 ) ( IN-CITY ?AUTO_2252 ?AUTO_2250 ) ( IN-CITY ?AUTO_2247 ?AUTO_2250 ) ( not ( = ?AUTO_2247 ?AUTO_2252 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2243 ?AUTO_2252 ?AUTO_2247 ?AUTO_2250 )
      ( DELIVER-PKG ?AUTO_2233 ?AUTO_2234 )
      ( DELIVER-PKG-VERIFY ?AUTO_2233 ?AUTO_2234 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2673 - OBJ
      ?AUTO_2674 - LOCATION
    )
    :vars
    (
      ?AUTO_2675 - TRUCK
      ?AUTO_2677 - LOCATION
      ?AUTO_2681 - CITY
      ?AUTO_2678 - LOCATION
      ?AUTO_2679 - LOCATION
      ?AUTO_2683 - LOCATION
      ?AUTO_2682 - AIRPLANE
      ?AUTO_2684 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2675 ?AUTO_2677 ) ( IN-CITY ?AUTO_2677 ?AUTO_2681 ) ( IN-CITY ?AUTO_2674 ?AUTO_2681 ) ( not ( = ?AUTO_2674 ?AUTO_2677 ) ) ( TRUCK-AT ?AUTO_2675 ?AUTO_2678 ) ( AIRPORT ?AUTO_2679 ) ( AIRPORT ?AUTO_2678 ) ( not ( = ?AUTO_2679 ?AUTO_2678 ) ) ( AIRPORT ?AUTO_2683 ) ( AIRPLANE-AT ?AUTO_2682 ?AUTO_2683 ) ( not ( = ?AUTO_2683 ?AUTO_2679 ) ) ( TRUCK-AT ?AUTO_2684 ?AUTO_2679 ) ( IN-TRUCK ?AUTO_2673 ?AUTO_2684 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?AUTO_2673 ?AUTO_2684 ?AUTO_2679 )
      ( DELIVER-PKG ?AUTO_2673 ?AUTO_2674 )
      ( DELIVER-PKG-VERIFY ?AUTO_2673 ?AUTO_2674 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2687 - OBJ
      ?AUTO_2688 - LOCATION
    )
    :vars
    (
      ?AUTO_2695 - TRUCK
      ?AUTO_2697 - LOCATION
      ?AUTO_2694 - CITY
      ?AUTO_2698 - LOCATION
      ?AUTO_2692 - LOCATION
      ?AUTO_2693 - LOCATION
      ?AUTO_2696 - AIRPLANE
      ?AUTO_2691 - TRUCK
      ?AUTO_2702 - LOCATION
      ?AUTO_2700 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2695 ?AUTO_2697 ) ( IN-CITY ?AUTO_2697 ?AUTO_2694 ) ( IN-CITY ?AUTO_2688 ?AUTO_2694 ) ( not ( = ?AUTO_2688 ?AUTO_2697 ) ) ( TRUCK-AT ?AUTO_2695 ?AUTO_2698 ) ( AIRPORT ?AUTO_2692 ) ( AIRPORT ?AUTO_2698 ) ( not ( = ?AUTO_2692 ?AUTO_2698 ) ) ( AIRPORT ?AUTO_2693 ) ( AIRPLANE-AT ?AUTO_2696 ?AUTO_2693 ) ( not ( = ?AUTO_2693 ?AUTO_2692 ) ) ( IN-TRUCK ?AUTO_2687 ?AUTO_2691 ) ( TRUCK-AT ?AUTO_2691 ?AUTO_2702 ) ( IN-CITY ?AUTO_2702 ?AUTO_2700 ) ( IN-CITY ?AUTO_2692 ?AUTO_2700 ) ( not ( = ?AUTO_2692 ?AUTO_2702 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2691 ?AUTO_2702 ?AUTO_2692 ?AUTO_2700 )
      ( DELIVER-PKG ?AUTO_2687 ?AUTO_2688 )
      ( DELIVER-PKG-VERIFY ?AUTO_2687 ?AUTO_2688 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2703 - OBJ
      ?AUTO_2704 - LOCATION
    )
    :vars
    (
      ?AUTO_2710 - TRUCK
      ?AUTO_2708 - LOCATION
      ?AUTO_2709 - CITY
      ?AUTO_2706 - LOCATION
      ?AUTO_2713 - LOCATION
      ?AUTO_2715 - LOCATION
      ?AUTO_2705 - AIRPLANE
      ?AUTO_2711 - TRUCK
      ?AUTO_2716 - LOCATION
      ?AUTO_2714 - CITY
      ?AUTO_2718 - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2710 ?AUTO_2708 ) ( IN-CITY ?AUTO_2708 ?AUTO_2709 ) ( IN-CITY ?AUTO_2704 ?AUTO_2709 ) ( not ( = ?AUTO_2704 ?AUTO_2708 ) ) ( TRUCK-AT ?AUTO_2710 ?AUTO_2706 ) ( AIRPORT ?AUTO_2713 ) ( AIRPORT ?AUTO_2706 ) ( not ( = ?AUTO_2713 ?AUTO_2706 ) ) ( AIRPORT ?AUTO_2715 ) ( AIRPLANE-AT ?AUTO_2705 ?AUTO_2715 ) ( not ( = ?AUTO_2715 ?AUTO_2713 ) ) ( TRUCK-AT ?AUTO_2711 ?AUTO_2716 ) ( IN-CITY ?AUTO_2716 ?AUTO_2714 ) ( IN-CITY ?AUTO_2713 ?AUTO_2714 ) ( not ( = ?AUTO_2713 ?AUTO_2716 ) ) ( TRUCK-AT ?AUTO_2711 ?AUTO_2718 ) ( OBJ-AT ?AUTO_2703 ?AUTO_2718 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?AUTO_2703 ?AUTO_2711 ?AUTO_2718 )
      ( DELIVER-PKG ?AUTO_2703 ?AUTO_2704 )
      ( DELIVER-PKG-VERIFY ?AUTO_2703 ?AUTO_2704 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_2720 - OBJ
      ?AUTO_2721 - LOCATION
    )
    :vars
    (
      ?AUTO_2722 - TRUCK
      ?AUTO_2726 - LOCATION
      ?AUTO_2723 - CITY
      ?AUTO_2731 - LOCATION
      ?AUTO_2727 - LOCATION
      ?AUTO_2730 - LOCATION
      ?AUTO_2732 - AIRPLANE
      ?AUTO_2734 - LOCATION
      ?AUTO_2725 - CITY
      ?AUTO_2733 - TRUCK
      ?AUTO_2738 - LOCATION
      ?AUTO_2736 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?AUTO_2722 ?AUTO_2726 ) ( IN-CITY ?AUTO_2726 ?AUTO_2723 ) ( IN-CITY ?AUTO_2721 ?AUTO_2723 ) ( not ( = ?AUTO_2721 ?AUTO_2726 ) ) ( TRUCK-AT ?AUTO_2722 ?AUTO_2731 ) ( AIRPORT ?AUTO_2727 ) ( AIRPORT ?AUTO_2731 ) ( not ( = ?AUTO_2727 ?AUTO_2731 ) ) ( AIRPORT ?AUTO_2730 ) ( AIRPLANE-AT ?AUTO_2732 ?AUTO_2730 ) ( not ( = ?AUTO_2730 ?AUTO_2727 ) ) ( IN-CITY ?AUTO_2734 ?AUTO_2725 ) ( IN-CITY ?AUTO_2727 ?AUTO_2725 ) ( not ( = ?AUTO_2727 ?AUTO_2734 ) ) ( OBJ-AT ?AUTO_2720 ?AUTO_2734 ) ( TRUCK-AT ?AUTO_2733 ?AUTO_2738 ) ( IN-CITY ?AUTO_2738 ?AUTO_2736 ) ( IN-CITY ?AUTO_2734 ?AUTO_2736 ) ( not ( = ?AUTO_2734 ?AUTO_2738 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_2733 ?AUTO_2738 ?AUTO_2734 ?AUTO_2736 )
      ( DELIVER-PKG ?AUTO_2720 ?AUTO_2721 )
      ( DELIVER-PKG-VERIFY ?AUTO_2720 ?AUTO_2721 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?AUTO_3363 - OBJ
      ?AUTO_3364 - LOCATION
    )
    :vars
    (
      ?AUTO_3373 - LOCATION
      ?AUTO_3374 - CITY
      ?AUTO_3372 - LOCATION
      ?AUTO_3378 - LOCATION
      ?AUTO_3377 - AIRPLANE
      ?AUTO_3369 - LOCATION
      ?AUTO_3376 - CITY
      ?AUTO_3375 - TRUCK
      ?AUTO_3371 - LOCATION
      ?AUTO_3366 - CITY
      ?AUTO_3368 - TRUCK
      ?AUTO_3382 - LOCATION
      ?AUTO_3380 - CITY
    )
    :precondition
    ( and ( IN-CITY ?AUTO_3373 ?AUTO_3374 ) ( IN-CITY ?AUTO_3364 ?AUTO_3374 ) ( not ( = ?AUTO_3364 ?AUTO_3373 ) ) ( AIRPORT ?AUTO_3372 ) ( AIRPORT ?AUTO_3373 ) ( not ( = ?AUTO_3372 ?AUTO_3373 ) ) ( AIRPORT ?AUTO_3378 ) ( AIRPLANE-AT ?AUTO_3377 ?AUTO_3378 ) ( not ( = ?AUTO_3378 ?AUTO_3372 ) ) ( IN-CITY ?AUTO_3369 ?AUTO_3376 ) ( IN-CITY ?AUTO_3372 ?AUTO_3376 ) ( not ( = ?AUTO_3372 ?AUTO_3369 ) ) ( OBJ-AT ?AUTO_3363 ?AUTO_3369 ) ( TRUCK-AT ?AUTO_3375 ?AUTO_3371 ) ( IN-CITY ?AUTO_3371 ?AUTO_3366 ) ( IN-CITY ?AUTO_3369 ?AUTO_3366 ) ( not ( = ?AUTO_3369 ?AUTO_3371 ) ) ( TRUCK-AT ?AUTO_3368 ?AUTO_3382 ) ( IN-CITY ?AUTO_3382 ?AUTO_3380 ) ( IN-CITY ?AUTO_3373 ?AUTO_3380 ) ( not ( = ?AUTO_3373 ?AUTO_3382 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?AUTO_3368 ?AUTO_3382 ?AUTO_3373 ?AUTO_3380 )
      ( DELIVER-PKG ?AUTO_3363 ?AUTO_3364 )
      ( DELIVER-PKG-VERIFY ?AUTO_3363 ?AUTO_3364 ) )
  )

)

