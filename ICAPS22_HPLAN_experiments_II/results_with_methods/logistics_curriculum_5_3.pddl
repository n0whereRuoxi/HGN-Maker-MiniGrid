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
      ?auto_147126 - OBJ
      ?auto_147125 - LOCATION
    )
    :vars
    (
      ?auto_147128 - LOCATION
      ?auto_147129 - CITY
      ?auto_147127 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147128 ?auto_147129 ) ( IN-CITY ?auto_147125 ?auto_147129 ) ( not ( = ?auto_147125 ?auto_147128 ) ) ( OBJ-AT ?auto_147126 ?auto_147128 ) ( TRUCK-AT ?auto_147127 ?auto_147125 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_147127 ?auto_147125 ?auto_147128 ?auto_147129 )
      ( !LOAD-TRUCK ?auto_147126 ?auto_147127 ?auto_147128 )
      ( !DRIVE-TRUCK ?auto_147127 ?auto_147128 ?auto_147125 ?auto_147129 )
      ( !UNLOAD-TRUCK ?auto_147126 ?auto_147127 ?auto_147125 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_147133 - OBJ
      ?auto_147132 - LOCATION
    )
    :vars
    (
      ?auto_147135 - LOCATION
      ?auto_147136 - CITY
      ?auto_147134 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147135 ?auto_147136 ) ( IN-CITY ?auto_147132 ?auto_147136 ) ( not ( = ?auto_147132 ?auto_147135 ) ) ( OBJ-AT ?auto_147133 ?auto_147135 ) ( TRUCK-AT ?auto_147134 ?auto_147132 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_147134 ?auto_147132 ?auto_147135 ?auto_147136 )
      ( !LOAD-TRUCK ?auto_147133 ?auto_147134 ?auto_147135 )
      ( !DRIVE-TRUCK ?auto_147134 ?auto_147135 ?auto_147132 ?auto_147136 )
      ( !UNLOAD-TRUCK ?auto_147133 ?auto_147134 ?auto_147132 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_147147 - OBJ
      ?auto_147148 - OBJ
      ?auto_147146 - LOCATION
    )
    :vars
    (
      ?auto_147149 - LOCATION
      ?auto_147151 - CITY
      ?auto_147150 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147149 ?auto_147151 ) ( IN-CITY ?auto_147146 ?auto_147151 ) ( not ( = ?auto_147146 ?auto_147149 ) ) ( OBJ-AT ?auto_147148 ?auto_147149 ) ( OBJ-AT ?auto_147147 ?auto_147149 ) ( TRUCK-AT ?auto_147150 ?auto_147146 ) ( not ( = ?auto_147147 ?auto_147148 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_147147 ?auto_147146 )
      ( DELIVER-1PKG ?auto_147148 ?auto_147146 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_147153 - OBJ
      ?auto_147154 - OBJ
      ?auto_147152 - LOCATION
    )
    :vars
    (
      ?auto_147156 - LOCATION
      ?auto_147157 - CITY
      ?auto_147155 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147156 ?auto_147157 ) ( IN-CITY ?auto_147152 ?auto_147157 ) ( not ( = ?auto_147152 ?auto_147156 ) ) ( OBJ-AT ?auto_147153 ?auto_147156 ) ( OBJ-AT ?auto_147154 ?auto_147156 ) ( TRUCK-AT ?auto_147155 ?auto_147152 ) ( not ( = ?auto_147154 ?auto_147153 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_147154 ?auto_147153 ?auto_147152 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_147168 - OBJ
      ?auto_147167 - LOCATION
    )
    :vars
    (
      ?auto_147170 - LOCATION
      ?auto_147171 - CITY
      ?auto_147169 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147170 ?auto_147171 ) ( IN-CITY ?auto_147167 ?auto_147171 ) ( not ( = ?auto_147167 ?auto_147170 ) ) ( OBJ-AT ?auto_147168 ?auto_147170 ) ( TRUCK-AT ?auto_147169 ?auto_147167 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_147169 ?auto_147167 ?auto_147170 ?auto_147171 )
      ( !LOAD-TRUCK ?auto_147168 ?auto_147169 ?auto_147170 )
      ( !DRIVE-TRUCK ?auto_147169 ?auto_147170 ?auto_147167 ?auto_147171 )
      ( !UNLOAD-TRUCK ?auto_147168 ?auto_147169 ?auto_147167 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_147258 - OBJ
      ?auto_147259 - OBJ
      ?auto_147260 - OBJ
      ?auto_147257 - LOCATION
    )
    :vars
    (
      ?auto_147261 - LOCATION
      ?auto_147262 - CITY
      ?auto_147264 - LOCATION
      ?auto_147263 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147261 ?auto_147262 ) ( IN-CITY ?auto_147257 ?auto_147262 ) ( not ( = ?auto_147257 ?auto_147261 ) ) ( OBJ-AT ?auto_147260 ?auto_147261 ) ( IN-CITY ?auto_147264 ?auto_147262 ) ( not ( = ?auto_147257 ?auto_147264 ) ) ( OBJ-AT ?auto_147259 ?auto_147264 ) ( OBJ-AT ?auto_147258 ?auto_147264 ) ( TRUCK-AT ?auto_147263 ?auto_147257 ) ( not ( = ?auto_147258 ?auto_147259 ) ) ( not ( = ?auto_147258 ?auto_147260 ) ) ( not ( = ?auto_147259 ?auto_147260 ) ) ( not ( = ?auto_147261 ?auto_147264 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_147259 ?auto_147258 ?auto_147257 )
      ( DELIVER-1PKG ?auto_147260 ?auto_147257 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_147275 - OBJ
      ?auto_147276 - OBJ
      ?auto_147277 - OBJ
      ?auto_147274 - LOCATION
    )
    :vars
    (
      ?auto_147278 - LOCATION
      ?auto_147280 - CITY
      ?auto_147281 - LOCATION
      ?auto_147279 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147278 ?auto_147280 ) ( IN-CITY ?auto_147274 ?auto_147280 ) ( not ( = ?auto_147274 ?auto_147278 ) ) ( OBJ-AT ?auto_147276 ?auto_147278 ) ( IN-CITY ?auto_147281 ?auto_147280 ) ( not ( = ?auto_147274 ?auto_147281 ) ) ( OBJ-AT ?auto_147277 ?auto_147281 ) ( OBJ-AT ?auto_147275 ?auto_147281 ) ( TRUCK-AT ?auto_147279 ?auto_147274 ) ( not ( = ?auto_147275 ?auto_147277 ) ) ( not ( = ?auto_147275 ?auto_147276 ) ) ( not ( = ?auto_147277 ?auto_147276 ) ) ( not ( = ?auto_147278 ?auto_147281 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_147275 ?auto_147277 ?auto_147276 ?auto_147274 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_147292 - OBJ
      ?auto_147293 - OBJ
      ?auto_147294 - OBJ
      ?auto_147291 - LOCATION
    )
    :vars
    (
      ?auto_147295 - LOCATION
      ?auto_147296 - CITY
      ?auto_147298 - LOCATION
      ?auto_147297 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147295 ?auto_147296 ) ( IN-CITY ?auto_147291 ?auto_147296 ) ( not ( = ?auto_147291 ?auto_147295 ) ) ( OBJ-AT ?auto_147294 ?auto_147295 ) ( IN-CITY ?auto_147298 ?auto_147296 ) ( not ( = ?auto_147291 ?auto_147298 ) ) ( OBJ-AT ?auto_147292 ?auto_147298 ) ( OBJ-AT ?auto_147293 ?auto_147298 ) ( TRUCK-AT ?auto_147297 ?auto_147291 ) ( not ( = ?auto_147293 ?auto_147292 ) ) ( not ( = ?auto_147293 ?auto_147294 ) ) ( not ( = ?auto_147292 ?auto_147294 ) ) ( not ( = ?auto_147295 ?auto_147298 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_147293 ?auto_147294 ?auto_147292 ?auto_147291 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_147309 - OBJ
      ?auto_147310 - OBJ
      ?auto_147311 - OBJ
      ?auto_147308 - LOCATION
    )
    :vars
    (
      ?auto_147312 - LOCATION
      ?auto_147313 - CITY
      ?auto_147315 - LOCATION
      ?auto_147314 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147312 ?auto_147313 ) ( IN-CITY ?auto_147308 ?auto_147313 ) ( not ( = ?auto_147308 ?auto_147312 ) ) ( OBJ-AT ?auto_147310 ?auto_147312 ) ( IN-CITY ?auto_147315 ?auto_147313 ) ( not ( = ?auto_147308 ?auto_147315 ) ) ( OBJ-AT ?auto_147309 ?auto_147315 ) ( OBJ-AT ?auto_147311 ?auto_147315 ) ( TRUCK-AT ?auto_147314 ?auto_147308 ) ( not ( = ?auto_147311 ?auto_147309 ) ) ( not ( = ?auto_147311 ?auto_147310 ) ) ( not ( = ?auto_147309 ?auto_147310 ) ) ( not ( = ?auto_147312 ?auto_147315 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_147311 ?auto_147310 ?auto_147309 ?auto_147308 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_147344 - OBJ
      ?auto_147345 - OBJ
      ?auto_147346 - OBJ
      ?auto_147343 - LOCATION
    )
    :vars
    (
      ?auto_147347 - LOCATION
      ?auto_147348 - CITY
      ?auto_147350 - LOCATION
      ?auto_147349 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147347 ?auto_147348 ) ( IN-CITY ?auto_147343 ?auto_147348 ) ( not ( = ?auto_147343 ?auto_147347 ) ) ( OBJ-AT ?auto_147344 ?auto_147347 ) ( IN-CITY ?auto_147350 ?auto_147348 ) ( not ( = ?auto_147343 ?auto_147350 ) ) ( OBJ-AT ?auto_147346 ?auto_147350 ) ( OBJ-AT ?auto_147345 ?auto_147350 ) ( TRUCK-AT ?auto_147349 ?auto_147343 ) ( not ( = ?auto_147345 ?auto_147346 ) ) ( not ( = ?auto_147345 ?auto_147344 ) ) ( not ( = ?auto_147346 ?auto_147344 ) ) ( not ( = ?auto_147347 ?auto_147350 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_147345 ?auto_147344 ?auto_147346 ?auto_147343 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_147361 - OBJ
      ?auto_147362 - OBJ
      ?auto_147363 - OBJ
      ?auto_147360 - LOCATION
    )
    :vars
    (
      ?auto_147364 - LOCATION
      ?auto_147365 - CITY
      ?auto_147367 - LOCATION
      ?auto_147366 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147364 ?auto_147365 ) ( IN-CITY ?auto_147360 ?auto_147365 ) ( not ( = ?auto_147360 ?auto_147364 ) ) ( OBJ-AT ?auto_147361 ?auto_147364 ) ( IN-CITY ?auto_147367 ?auto_147365 ) ( not ( = ?auto_147360 ?auto_147367 ) ) ( OBJ-AT ?auto_147362 ?auto_147367 ) ( OBJ-AT ?auto_147363 ?auto_147367 ) ( TRUCK-AT ?auto_147366 ?auto_147360 ) ( not ( = ?auto_147363 ?auto_147362 ) ) ( not ( = ?auto_147363 ?auto_147361 ) ) ( not ( = ?auto_147362 ?auto_147361 ) ) ( not ( = ?auto_147364 ?auto_147367 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_147363 ?auto_147361 ?auto_147362 ?auto_147360 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_147417 - OBJ
      ?auto_147416 - LOCATION
    )
    :vars
    (
      ?auto_147419 - LOCATION
      ?auto_147420 - CITY
      ?auto_147418 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147419 ?auto_147420 ) ( IN-CITY ?auto_147416 ?auto_147420 ) ( not ( = ?auto_147416 ?auto_147419 ) ) ( OBJ-AT ?auto_147417 ?auto_147419 ) ( TRUCK-AT ?auto_147418 ?auto_147416 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_147418 ?auto_147416 ?auto_147419 ?auto_147420 )
      ( !LOAD-TRUCK ?auto_147417 ?auto_147418 ?auto_147419 )
      ( !DRIVE-TRUCK ?auto_147418 ?auto_147419 ?auto_147416 ?auto_147420 )
      ( !UNLOAD-TRUCK ?auto_147417 ?auto_147418 ?auto_147416 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_148399 - OBJ
      ?auto_148400 - OBJ
      ?auto_148401 - OBJ
      ?auto_148402 - OBJ
      ?auto_148398 - LOCATION
    )
    :vars
    (
      ?auto_148405 - LOCATION
      ?auto_148403 - CITY
      ?auto_148406 - LOCATION
      ?auto_148407 - LOCATION
      ?auto_148404 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148405 ?auto_148403 ) ( IN-CITY ?auto_148398 ?auto_148403 ) ( not ( = ?auto_148398 ?auto_148405 ) ) ( OBJ-AT ?auto_148402 ?auto_148405 ) ( IN-CITY ?auto_148406 ?auto_148403 ) ( not ( = ?auto_148398 ?auto_148406 ) ) ( OBJ-AT ?auto_148401 ?auto_148406 ) ( IN-CITY ?auto_148407 ?auto_148403 ) ( not ( = ?auto_148398 ?auto_148407 ) ) ( OBJ-AT ?auto_148400 ?auto_148407 ) ( OBJ-AT ?auto_148399 ?auto_148407 ) ( TRUCK-AT ?auto_148404 ?auto_148398 ) ( not ( = ?auto_148399 ?auto_148400 ) ) ( not ( = ?auto_148399 ?auto_148401 ) ) ( not ( = ?auto_148400 ?auto_148401 ) ) ( not ( = ?auto_148406 ?auto_148407 ) ) ( not ( = ?auto_148399 ?auto_148402 ) ) ( not ( = ?auto_148400 ?auto_148402 ) ) ( not ( = ?auto_148401 ?auto_148402 ) ) ( not ( = ?auto_148405 ?auto_148406 ) ) ( not ( = ?auto_148405 ?auto_148407 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_148399 ?auto_148401 ?auto_148400 ?auto_148398 )
      ( DELIVER-1PKG ?auto_148402 ?auto_148398 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_148431 - OBJ
      ?auto_148432 - OBJ
      ?auto_148433 - OBJ
      ?auto_148434 - OBJ
      ?auto_148430 - LOCATION
    )
    :vars
    (
      ?auto_148436 - LOCATION
      ?auto_148435 - CITY
      ?auto_148439 - LOCATION
      ?auto_148438 - LOCATION
      ?auto_148437 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148436 ?auto_148435 ) ( IN-CITY ?auto_148430 ?auto_148435 ) ( not ( = ?auto_148430 ?auto_148436 ) ) ( OBJ-AT ?auto_148433 ?auto_148436 ) ( IN-CITY ?auto_148439 ?auto_148435 ) ( not ( = ?auto_148430 ?auto_148439 ) ) ( OBJ-AT ?auto_148434 ?auto_148439 ) ( IN-CITY ?auto_148438 ?auto_148435 ) ( not ( = ?auto_148430 ?auto_148438 ) ) ( OBJ-AT ?auto_148432 ?auto_148438 ) ( OBJ-AT ?auto_148431 ?auto_148438 ) ( TRUCK-AT ?auto_148437 ?auto_148430 ) ( not ( = ?auto_148431 ?auto_148432 ) ) ( not ( = ?auto_148431 ?auto_148434 ) ) ( not ( = ?auto_148432 ?auto_148434 ) ) ( not ( = ?auto_148439 ?auto_148438 ) ) ( not ( = ?auto_148431 ?auto_148433 ) ) ( not ( = ?auto_148432 ?auto_148433 ) ) ( not ( = ?auto_148434 ?auto_148433 ) ) ( not ( = ?auto_148436 ?auto_148439 ) ) ( not ( = ?auto_148436 ?auto_148438 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_148431 ?auto_148432 ?auto_148434 ?auto_148433 ?auto_148430 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_148463 - OBJ
      ?auto_148464 - OBJ
      ?auto_148465 - OBJ
      ?auto_148466 - OBJ
      ?auto_148462 - LOCATION
    )
    :vars
    (
      ?auto_148469 - LOCATION
      ?auto_148468 - CITY
      ?auto_148470 - LOCATION
      ?auto_148471 - LOCATION
      ?auto_148467 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148469 ?auto_148468 ) ( IN-CITY ?auto_148462 ?auto_148468 ) ( not ( = ?auto_148462 ?auto_148469 ) ) ( OBJ-AT ?auto_148466 ?auto_148469 ) ( IN-CITY ?auto_148470 ?auto_148468 ) ( not ( = ?auto_148462 ?auto_148470 ) ) ( OBJ-AT ?auto_148464 ?auto_148470 ) ( IN-CITY ?auto_148471 ?auto_148468 ) ( not ( = ?auto_148462 ?auto_148471 ) ) ( OBJ-AT ?auto_148465 ?auto_148471 ) ( OBJ-AT ?auto_148463 ?auto_148471 ) ( TRUCK-AT ?auto_148467 ?auto_148462 ) ( not ( = ?auto_148463 ?auto_148465 ) ) ( not ( = ?auto_148463 ?auto_148464 ) ) ( not ( = ?auto_148465 ?auto_148464 ) ) ( not ( = ?auto_148470 ?auto_148471 ) ) ( not ( = ?auto_148463 ?auto_148466 ) ) ( not ( = ?auto_148465 ?auto_148466 ) ) ( not ( = ?auto_148464 ?auto_148466 ) ) ( not ( = ?auto_148469 ?auto_148470 ) ) ( not ( = ?auto_148469 ?auto_148471 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_148463 ?auto_148465 ?auto_148466 ?auto_148464 ?auto_148462 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_148495 - OBJ
      ?auto_148496 - OBJ
      ?auto_148497 - OBJ
      ?auto_148498 - OBJ
      ?auto_148494 - LOCATION
    )
    :vars
    (
      ?auto_148501 - LOCATION
      ?auto_148500 - CITY
      ?auto_148502 - LOCATION
      ?auto_148503 - LOCATION
      ?auto_148499 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148501 ?auto_148500 ) ( IN-CITY ?auto_148494 ?auto_148500 ) ( not ( = ?auto_148494 ?auto_148501 ) ) ( OBJ-AT ?auto_148497 ?auto_148501 ) ( IN-CITY ?auto_148502 ?auto_148500 ) ( not ( = ?auto_148494 ?auto_148502 ) ) ( OBJ-AT ?auto_148496 ?auto_148502 ) ( IN-CITY ?auto_148503 ?auto_148500 ) ( not ( = ?auto_148494 ?auto_148503 ) ) ( OBJ-AT ?auto_148498 ?auto_148503 ) ( OBJ-AT ?auto_148495 ?auto_148503 ) ( TRUCK-AT ?auto_148499 ?auto_148494 ) ( not ( = ?auto_148495 ?auto_148498 ) ) ( not ( = ?auto_148495 ?auto_148496 ) ) ( not ( = ?auto_148498 ?auto_148496 ) ) ( not ( = ?auto_148502 ?auto_148503 ) ) ( not ( = ?auto_148495 ?auto_148497 ) ) ( not ( = ?auto_148498 ?auto_148497 ) ) ( not ( = ?auto_148496 ?auto_148497 ) ) ( not ( = ?auto_148501 ?auto_148502 ) ) ( not ( = ?auto_148501 ?auto_148503 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_148495 ?auto_148498 ?auto_148497 ?auto_148496 ?auto_148494 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_148595 - OBJ
      ?auto_148596 - OBJ
      ?auto_148597 - OBJ
      ?auto_148598 - OBJ
      ?auto_148594 - LOCATION
    )
    :vars
    (
      ?auto_148601 - LOCATION
      ?auto_148600 - CITY
      ?auto_148602 - LOCATION
      ?auto_148603 - LOCATION
      ?auto_148599 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148601 ?auto_148600 ) ( IN-CITY ?auto_148594 ?auto_148600 ) ( not ( = ?auto_148594 ?auto_148601 ) ) ( OBJ-AT ?auto_148596 ?auto_148601 ) ( IN-CITY ?auto_148602 ?auto_148600 ) ( not ( = ?auto_148594 ?auto_148602 ) ) ( OBJ-AT ?auto_148598 ?auto_148602 ) ( IN-CITY ?auto_148603 ?auto_148600 ) ( not ( = ?auto_148594 ?auto_148603 ) ) ( OBJ-AT ?auto_148597 ?auto_148603 ) ( OBJ-AT ?auto_148595 ?auto_148603 ) ( TRUCK-AT ?auto_148599 ?auto_148594 ) ( not ( = ?auto_148595 ?auto_148597 ) ) ( not ( = ?auto_148595 ?auto_148598 ) ) ( not ( = ?auto_148597 ?auto_148598 ) ) ( not ( = ?auto_148602 ?auto_148603 ) ) ( not ( = ?auto_148595 ?auto_148596 ) ) ( not ( = ?auto_148597 ?auto_148596 ) ) ( not ( = ?auto_148598 ?auto_148596 ) ) ( not ( = ?auto_148601 ?auto_148602 ) ) ( not ( = ?auto_148601 ?auto_148603 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_148595 ?auto_148597 ?auto_148596 ?auto_148598 ?auto_148594 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_148627 - OBJ
      ?auto_148628 - OBJ
      ?auto_148629 - OBJ
      ?auto_148630 - OBJ
      ?auto_148626 - LOCATION
    )
    :vars
    (
      ?auto_148633 - LOCATION
      ?auto_148632 - CITY
      ?auto_148634 - LOCATION
      ?auto_148635 - LOCATION
      ?auto_148631 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148633 ?auto_148632 ) ( IN-CITY ?auto_148626 ?auto_148632 ) ( not ( = ?auto_148626 ?auto_148633 ) ) ( OBJ-AT ?auto_148628 ?auto_148633 ) ( IN-CITY ?auto_148634 ?auto_148632 ) ( not ( = ?auto_148626 ?auto_148634 ) ) ( OBJ-AT ?auto_148629 ?auto_148634 ) ( IN-CITY ?auto_148635 ?auto_148632 ) ( not ( = ?auto_148626 ?auto_148635 ) ) ( OBJ-AT ?auto_148630 ?auto_148635 ) ( OBJ-AT ?auto_148627 ?auto_148635 ) ( TRUCK-AT ?auto_148631 ?auto_148626 ) ( not ( = ?auto_148627 ?auto_148630 ) ) ( not ( = ?auto_148627 ?auto_148629 ) ) ( not ( = ?auto_148630 ?auto_148629 ) ) ( not ( = ?auto_148634 ?auto_148635 ) ) ( not ( = ?auto_148627 ?auto_148628 ) ) ( not ( = ?auto_148630 ?auto_148628 ) ) ( not ( = ?auto_148629 ?auto_148628 ) ) ( not ( = ?auto_148633 ?auto_148634 ) ) ( not ( = ?auto_148633 ?auto_148635 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_148627 ?auto_148630 ?auto_148628 ?auto_148629 ?auto_148626 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_148727 - OBJ
      ?auto_148728 - OBJ
      ?auto_148729 - OBJ
      ?auto_148730 - OBJ
      ?auto_148726 - LOCATION
    )
    :vars
    (
      ?auto_148733 - LOCATION
      ?auto_148732 - CITY
      ?auto_148734 - LOCATION
      ?auto_148735 - LOCATION
      ?auto_148731 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148733 ?auto_148732 ) ( IN-CITY ?auto_148726 ?auto_148732 ) ( not ( = ?auto_148726 ?auto_148733 ) ) ( OBJ-AT ?auto_148730 ?auto_148733 ) ( IN-CITY ?auto_148734 ?auto_148732 ) ( not ( = ?auto_148726 ?auto_148734 ) ) ( OBJ-AT ?auto_148729 ?auto_148734 ) ( IN-CITY ?auto_148735 ?auto_148732 ) ( not ( = ?auto_148726 ?auto_148735 ) ) ( OBJ-AT ?auto_148727 ?auto_148735 ) ( OBJ-AT ?auto_148728 ?auto_148735 ) ( TRUCK-AT ?auto_148731 ?auto_148726 ) ( not ( = ?auto_148728 ?auto_148727 ) ) ( not ( = ?auto_148728 ?auto_148729 ) ) ( not ( = ?auto_148727 ?auto_148729 ) ) ( not ( = ?auto_148734 ?auto_148735 ) ) ( not ( = ?auto_148728 ?auto_148730 ) ) ( not ( = ?auto_148727 ?auto_148730 ) ) ( not ( = ?auto_148729 ?auto_148730 ) ) ( not ( = ?auto_148733 ?auto_148734 ) ) ( not ( = ?auto_148733 ?auto_148735 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_148728 ?auto_148727 ?auto_148730 ?auto_148729 ?auto_148726 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_148759 - OBJ
      ?auto_148760 - OBJ
      ?auto_148761 - OBJ
      ?auto_148762 - OBJ
      ?auto_148758 - LOCATION
    )
    :vars
    (
      ?auto_148765 - LOCATION
      ?auto_148764 - CITY
      ?auto_148766 - LOCATION
      ?auto_148767 - LOCATION
      ?auto_148763 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148765 ?auto_148764 ) ( IN-CITY ?auto_148758 ?auto_148764 ) ( not ( = ?auto_148758 ?auto_148765 ) ) ( OBJ-AT ?auto_148761 ?auto_148765 ) ( IN-CITY ?auto_148766 ?auto_148764 ) ( not ( = ?auto_148758 ?auto_148766 ) ) ( OBJ-AT ?auto_148762 ?auto_148766 ) ( IN-CITY ?auto_148767 ?auto_148764 ) ( not ( = ?auto_148758 ?auto_148767 ) ) ( OBJ-AT ?auto_148759 ?auto_148767 ) ( OBJ-AT ?auto_148760 ?auto_148767 ) ( TRUCK-AT ?auto_148763 ?auto_148758 ) ( not ( = ?auto_148760 ?auto_148759 ) ) ( not ( = ?auto_148760 ?auto_148762 ) ) ( not ( = ?auto_148759 ?auto_148762 ) ) ( not ( = ?auto_148766 ?auto_148767 ) ) ( not ( = ?auto_148760 ?auto_148761 ) ) ( not ( = ?auto_148759 ?auto_148761 ) ) ( not ( = ?auto_148762 ?auto_148761 ) ) ( not ( = ?auto_148765 ?auto_148766 ) ) ( not ( = ?auto_148765 ?auto_148767 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_148760 ?auto_148759 ?auto_148761 ?auto_148762 ?auto_148758 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_148860 - OBJ
      ?auto_148861 - OBJ
      ?auto_148862 - OBJ
      ?auto_148863 - OBJ
      ?auto_148859 - LOCATION
    )
    :vars
    (
      ?auto_148866 - LOCATION
      ?auto_148865 - CITY
      ?auto_148867 - LOCATION
      ?auto_148868 - LOCATION
      ?auto_148864 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148866 ?auto_148865 ) ( IN-CITY ?auto_148859 ?auto_148865 ) ( not ( = ?auto_148859 ?auto_148866 ) ) ( OBJ-AT ?auto_148863 ?auto_148866 ) ( IN-CITY ?auto_148867 ?auto_148865 ) ( not ( = ?auto_148859 ?auto_148867 ) ) ( OBJ-AT ?auto_148861 ?auto_148867 ) ( IN-CITY ?auto_148868 ?auto_148865 ) ( not ( = ?auto_148859 ?auto_148868 ) ) ( OBJ-AT ?auto_148860 ?auto_148868 ) ( OBJ-AT ?auto_148862 ?auto_148868 ) ( TRUCK-AT ?auto_148864 ?auto_148859 ) ( not ( = ?auto_148862 ?auto_148860 ) ) ( not ( = ?auto_148862 ?auto_148861 ) ) ( not ( = ?auto_148860 ?auto_148861 ) ) ( not ( = ?auto_148867 ?auto_148868 ) ) ( not ( = ?auto_148862 ?auto_148863 ) ) ( not ( = ?auto_148860 ?auto_148863 ) ) ( not ( = ?auto_148861 ?auto_148863 ) ) ( not ( = ?auto_148866 ?auto_148867 ) ) ( not ( = ?auto_148866 ?auto_148868 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_148862 ?auto_148860 ?auto_148863 ?auto_148861 ?auto_148859 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_148892 - OBJ
      ?auto_148893 - OBJ
      ?auto_148894 - OBJ
      ?auto_148895 - OBJ
      ?auto_148891 - LOCATION
    )
    :vars
    (
      ?auto_148898 - LOCATION
      ?auto_148897 - CITY
      ?auto_148899 - LOCATION
      ?auto_148900 - LOCATION
      ?auto_148896 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148898 ?auto_148897 ) ( IN-CITY ?auto_148891 ?auto_148897 ) ( not ( = ?auto_148891 ?auto_148898 ) ) ( OBJ-AT ?auto_148894 ?auto_148898 ) ( IN-CITY ?auto_148899 ?auto_148897 ) ( not ( = ?auto_148891 ?auto_148899 ) ) ( OBJ-AT ?auto_148893 ?auto_148899 ) ( IN-CITY ?auto_148900 ?auto_148897 ) ( not ( = ?auto_148891 ?auto_148900 ) ) ( OBJ-AT ?auto_148892 ?auto_148900 ) ( OBJ-AT ?auto_148895 ?auto_148900 ) ( TRUCK-AT ?auto_148896 ?auto_148891 ) ( not ( = ?auto_148895 ?auto_148892 ) ) ( not ( = ?auto_148895 ?auto_148893 ) ) ( not ( = ?auto_148892 ?auto_148893 ) ) ( not ( = ?auto_148899 ?auto_148900 ) ) ( not ( = ?auto_148895 ?auto_148894 ) ) ( not ( = ?auto_148892 ?auto_148894 ) ) ( not ( = ?auto_148893 ?auto_148894 ) ) ( not ( = ?auto_148898 ?auto_148899 ) ) ( not ( = ?auto_148898 ?auto_148900 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_148895 ?auto_148892 ?auto_148894 ?auto_148893 ?auto_148891 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_148957 - OBJ
      ?auto_148958 - OBJ
      ?auto_148959 - OBJ
      ?auto_148960 - OBJ
      ?auto_148956 - LOCATION
    )
    :vars
    (
      ?auto_148963 - LOCATION
      ?auto_148962 - CITY
      ?auto_148964 - LOCATION
      ?auto_148965 - LOCATION
      ?auto_148961 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_148963 ?auto_148962 ) ( IN-CITY ?auto_148956 ?auto_148962 ) ( not ( = ?auto_148956 ?auto_148963 ) ) ( OBJ-AT ?auto_148958 ?auto_148963 ) ( IN-CITY ?auto_148964 ?auto_148962 ) ( not ( = ?auto_148956 ?auto_148964 ) ) ( OBJ-AT ?auto_148960 ?auto_148964 ) ( IN-CITY ?auto_148965 ?auto_148962 ) ( not ( = ?auto_148956 ?auto_148965 ) ) ( OBJ-AT ?auto_148957 ?auto_148965 ) ( OBJ-AT ?auto_148959 ?auto_148965 ) ( TRUCK-AT ?auto_148961 ?auto_148956 ) ( not ( = ?auto_148959 ?auto_148957 ) ) ( not ( = ?auto_148959 ?auto_148960 ) ) ( not ( = ?auto_148957 ?auto_148960 ) ) ( not ( = ?auto_148964 ?auto_148965 ) ) ( not ( = ?auto_148959 ?auto_148958 ) ) ( not ( = ?auto_148957 ?auto_148958 ) ) ( not ( = ?auto_148960 ?auto_148958 ) ) ( not ( = ?auto_148963 ?auto_148964 ) ) ( not ( = ?auto_148963 ?auto_148965 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_148959 ?auto_148957 ?auto_148958 ?auto_148960 ?auto_148956 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149024 - OBJ
      ?auto_149025 - OBJ
      ?auto_149026 - OBJ
      ?auto_149027 - OBJ
      ?auto_149023 - LOCATION
    )
    :vars
    (
      ?auto_149030 - LOCATION
      ?auto_149029 - CITY
      ?auto_149031 - LOCATION
      ?auto_149032 - LOCATION
      ?auto_149028 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149030 ?auto_149029 ) ( IN-CITY ?auto_149023 ?auto_149029 ) ( not ( = ?auto_149023 ?auto_149030 ) ) ( OBJ-AT ?auto_149025 ?auto_149030 ) ( IN-CITY ?auto_149031 ?auto_149029 ) ( not ( = ?auto_149023 ?auto_149031 ) ) ( OBJ-AT ?auto_149026 ?auto_149031 ) ( IN-CITY ?auto_149032 ?auto_149029 ) ( not ( = ?auto_149023 ?auto_149032 ) ) ( OBJ-AT ?auto_149024 ?auto_149032 ) ( OBJ-AT ?auto_149027 ?auto_149032 ) ( TRUCK-AT ?auto_149028 ?auto_149023 ) ( not ( = ?auto_149027 ?auto_149024 ) ) ( not ( = ?auto_149027 ?auto_149026 ) ) ( not ( = ?auto_149024 ?auto_149026 ) ) ( not ( = ?auto_149031 ?auto_149032 ) ) ( not ( = ?auto_149027 ?auto_149025 ) ) ( not ( = ?auto_149024 ?auto_149025 ) ) ( not ( = ?auto_149026 ?auto_149025 ) ) ( not ( = ?auto_149030 ?auto_149031 ) ) ( not ( = ?auto_149030 ?auto_149032 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149027 ?auto_149024 ?auto_149025 ?auto_149026 ?auto_149023 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149124 - OBJ
      ?auto_149125 - OBJ
      ?auto_149126 - OBJ
      ?auto_149127 - OBJ
      ?auto_149123 - LOCATION
    )
    :vars
    (
      ?auto_149130 - LOCATION
      ?auto_149129 - CITY
      ?auto_149131 - LOCATION
      ?auto_149132 - LOCATION
      ?auto_149128 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149130 ?auto_149129 ) ( IN-CITY ?auto_149123 ?auto_149129 ) ( not ( = ?auto_149123 ?auto_149130 ) ) ( OBJ-AT ?auto_149127 ?auto_149130 ) ( IN-CITY ?auto_149131 ?auto_149129 ) ( not ( = ?auto_149123 ?auto_149131 ) ) ( OBJ-AT ?auto_149124 ?auto_149131 ) ( IN-CITY ?auto_149132 ?auto_149129 ) ( not ( = ?auto_149123 ?auto_149132 ) ) ( OBJ-AT ?auto_149126 ?auto_149132 ) ( OBJ-AT ?auto_149125 ?auto_149132 ) ( TRUCK-AT ?auto_149128 ?auto_149123 ) ( not ( = ?auto_149125 ?auto_149126 ) ) ( not ( = ?auto_149125 ?auto_149124 ) ) ( not ( = ?auto_149126 ?auto_149124 ) ) ( not ( = ?auto_149131 ?auto_149132 ) ) ( not ( = ?auto_149125 ?auto_149127 ) ) ( not ( = ?auto_149126 ?auto_149127 ) ) ( not ( = ?auto_149124 ?auto_149127 ) ) ( not ( = ?auto_149130 ?auto_149131 ) ) ( not ( = ?auto_149130 ?auto_149132 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149125 ?auto_149126 ?auto_149127 ?auto_149124 ?auto_149123 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149156 - OBJ
      ?auto_149157 - OBJ
      ?auto_149158 - OBJ
      ?auto_149159 - OBJ
      ?auto_149155 - LOCATION
    )
    :vars
    (
      ?auto_149162 - LOCATION
      ?auto_149161 - CITY
      ?auto_149163 - LOCATION
      ?auto_149164 - LOCATION
      ?auto_149160 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149162 ?auto_149161 ) ( IN-CITY ?auto_149155 ?auto_149161 ) ( not ( = ?auto_149155 ?auto_149162 ) ) ( OBJ-AT ?auto_149158 ?auto_149162 ) ( IN-CITY ?auto_149163 ?auto_149161 ) ( not ( = ?auto_149155 ?auto_149163 ) ) ( OBJ-AT ?auto_149156 ?auto_149163 ) ( IN-CITY ?auto_149164 ?auto_149161 ) ( not ( = ?auto_149155 ?auto_149164 ) ) ( OBJ-AT ?auto_149159 ?auto_149164 ) ( OBJ-AT ?auto_149157 ?auto_149164 ) ( TRUCK-AT ?auto_149160 ?auto_149155 ) ( not ( = ?auto_149157 ?auto_149159 ) ) ( not ( = ?auto_149157 ?auto_149156 ) ) ( not ( = ?auto_149159 ?auto_149156 ) ) ( not ( = ?auto_149163 ?auto_149164 ) ) ( not ( = ?auto_149157 ?auto_149158 ) ) ( not ( = ?auto_149159 ?auto_149158 ) ) ( not ( = ?auto_149156 ?auto_149158 ) ) ( not ( = ?auto_149162 ?auto_149163 ) ) ( not ( = ?auto_149162 ?auto_149164 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149157 ?auto_149159 ?auto_149158 ?auto_149156 ?auto_149155 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149188 - OBJ
      ?auto_149189 - OBJ
      ?auto_149190 - OBJ
      ?auto_149191 - OBJ
      ?auto_149187 - LOCATION
    )
    :vars
    (
      ?auto_149194 - LOCATION
      ?auto_149193 - CITY
      ?auto_149195 - LOCATION
      ?auto_149196 - LOCATION
      ?auto_149192 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149194 ?auto_149193 ) ( IN-CITY ?auto_149187 ?auto_149193 ) ( not ( = ?auto_149187 ?auto_149194 ) ) ( OBJ-AT ?auto_149191 ?auto_149194 ) ( IN-CITY ?auto_149195 ?auto_149193 ) ( not ( = ?auto_149187 ?auto_149195 ) ) ( OBJ-AT ?auto_149188 ?auto_149195 ) ( IN-CITY ?auto_149196 ?auto_149193 ) ( not ( = ?auto_149187 ?auto_149196 ) ) ( OBJ-AT ?auto_149189 ?auto_149196 ) ( OBJ-AT ?auto_149190 ?auto_149196 ) ( TRUCK-AT ?auto_149192 ?auto_149187 ) ( not ( = ?auto_149190 ?auto_149189 ) ) ( not ( = ?auto_149190 ?auto_149188 ) ) ( not ( = ?auto_149189 ?auto_149188 ) ) ( not ( = ?auto_149195 ?auto_149196 ) ) ( not ( = ?auto_149190 ?auto_149191 ) ) ( not ( = ?auto_149189 ?auto_149191 ) ) ( not ( = ?auto_149188 ?auto_149191 ) ) ( not ( = ?auto_149194 ?auto_149195 ) ) ( not ( = ?auto_149194 ?auto_149196 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149190 ?auto_149189 ?auto_149191 ?auto_149188 ?auto_149187 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149220 - OBJ
      ?auto_149221 - OBJ
      ?auto_149222 - OBJ
      ?auto_149223 - OBJ
      ?auto_149219 - LOCATION
    )
    :vars
    (
      ?auto_149226 - LOCATION
      ?auto_149225 - CITY
      ?auto_149227 - LOCATION
      ?auto_149228 - LOCATION
      ?auto_149224 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149226 ?auto_149225 ) ( IN-CITY ?auto_149219 ?auto_149225 ) ( not ( = ?auto_149219 ?auto_149226 ) ) ( OBJ-AT ?auto_149222 ?auto_149226 ) ( IN-CITY ?auto_149227 ?auto_149225 ) ( not ( = ?auto_149219 ?auto_149227 ) ) ( OBJ-AT ?auto_149220 ?auto_149227 ) ( IN-CITY ?auto_149228 ?auto_149225 ) ( not ( = ?auto_149219 ?auto_149228 ) ) ( OBJ-AT ?auto_149221 ?auto_149228 ) ( OBJ-AT ?auto_149223 ?auto_149228 ) ( TRUCK-AT ?auto_149224 ?auto_149219 ) ( not ( = ?auto_149223 ?auto_149221 ) ) ( not ( = ?auto_149223 ?auto_149220 ) ) ( not ( = ?auto_149221 ?auto_149220 ) ) ( not ( = ?auto_149227 ?auto_149228 ) ) ( not ( = ?auto_149223 ?auto_149222 ) ) ( not ( = ?auto_149221 ?auto_149222 ) ) ( not ( = ?auto_149220 ?auto_149222 ) ) ( not ( = ?auto_149226 ?auto_149227 ) ) ( not ( = ?auto_149226 ?auto_149228 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149223 ?auto_149221 ?auto_149222 ?auto_149220 ?auto_149219 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149354 - OBJ
      ?auto_149355 - OBJ
      ?auto_149356 - OBJ
      ?auto_149357 - OBJ
      ?auto_149353 - LOCATION
    )
    :vars
    (
      ?auto_149360 - LOCATION
      ?auto_149359 - CITY
      ?auto_149361 - LOCATION
      ?auto_149362 - LOCATION
      ?auto_149358 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149360 ?auto_149359 ) ( IN-CITY ?auto_149353 ?auto_149359 ) ( not ( = ?auto_149353 ?auto_149360 ) ) ( OBJ-AT ?auto_149355 ?auto_149360 ) ( IN-CITY ?auto_149361 ?auto_149359 ) ( not ( = ?auto_149353 ?auto_149361 ) ) ( OBJ-AT ?auto_149354 ?auto_149361 ) ( IN-CITY ?auto_149362 ?auto_149359 ) ( not ( = ?auto_149353 ?auto_149362 ) ) ( OBJ-AT ?auto_149357 ?auto_149362 ) ( OBJ-AT ?auto_149356 ?auto_149362 ) ( TRUCK-AT ?auto_149358 ?auto_149353 ) ( not ( = ?auto_149356 ?auto_149357 ) ) ( not ( = ?auto_149356 ?auto_149354 ) ) ( not ( = ?auto_149357 ?auto_149354 ) ) ( not ( = ?auto_149361 ?auto_149362 ) ) ( not ( = ?auto_149356 ?auto_149355 ) ) ( not ( = ?auto_149357 ?auto_149355 ) ) ( not ( = ?auto_149354 ?auto_149355 ) ) ( not ( = ?auto_149360 ?auto_149361 ) ) ( not ( = ?auto_149360 ?auto_149362 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149356 ?auto_149357 ?auto_149355 ?auto_149354 ?auto_149353 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149386 - OBJ
      ?auto_149387 - OBJ
      ?auto_149388 - OBJ
      ?auto_149389 - OBJ
      ?auto_149385 - LOCATION
    )
    :vars
    (
      ?auto_149392 - LOCATION
      ?auto_149391 - CITY
      ?auto_149393 - LOCATION
      ?auto_149394 - LOCATION
      ?auto_149390 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149392 ?auto_149391 ) ( IN-CITY ?auto_149385 ?auto_149391 ) ( not ( = ?auto_149385 ?auto_149392 ) ) ( OBJ-AT ?auto_149387 ?auto_149392 ) ( IN-CITY ?auto_149393 ?auto_149391 ) ( not ( = ?auto_149385 ?auto_149393 ) ) ( OBJ-AT ?auto_149386 ?auto_149393 ) ( IN-CITY ?auto_149394 ?auto_149391 ) ( not ( = ?auto_149385 ?auto_149394 ) ) ( OBJ-AT ?auto_149388 ?auto_149394 ) ( OBJ-AT ?auto_149389 ?auto_149394 ) ( TRUCK-AT ?auto_149390 ?auto_149385 ) ( not ( = ?auto_149389 ?auto_149388 ) ) ( not ( = ?auto_149389 ?auto_149386 ) ) ( not ( = ?auto_149388 ?auto_149386 ) ) ( not ( = ?auto_149393 ?auto_149394 ) ) ( not ( = ?auto_149389 ?auto_149387 ) ) ( not ( = ?auto_149388 ?auto_149387 ) ) ( not ( = ?auto_149386 ?auto_149387 ) ) ( not ( = ?auto_149392 ?auto_149393 ) ) ( not ( = ?auto_149392 ?auto_149394 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149389 ?auto_149388 ?auto_149387 ?auto_149386 ?auto_149385 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149589 - OBJ
      ?auto_149590 - OBJ
      ?auto_149591 - OBJ
      ?auto_149592 - OBJ
      ?auto_149588 - LOCATION
    )
    :vars
    (
      ?auto_149595 - LOCATION
      ?auto_149594 - CITY
      ?auto_149596 - LOCATION
      ?auto_149597 - LOCATION
      ?auto_149593 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149595 ?auto_149594 ) ( IN-CITY ?auto_149588 ?auto_149594 ) ( not ( = ?auto_149588 ?auto_149595 ) ) ( OBJ-AT ?auto_149589 ?auto_149595 ) ( IN-CITY ?auto_149596 ?auto_149594 ) ( not ( = ?auto_149588 ?auto_149596 ) ) ( OBJ-AT ?auto_149592 ?auto_149596 ) ( IN-CITY ?auto_149597 ?auto_149594 ) ( not ( = ?auto_149588 ?auto_149597 ) ) ( OBJ-AT ?auto_149591 ?auto_149597 ) ( OBJ-AT ?auto_149590 ?auto_149597 ) ( TRUCK-AT ?auto_149593 ?auto_149588 ) ( not ( = ?auto_149590 ?auto_149591 ) ) ( not ( = ?auto_149590 ?auto_149592 ) ) ( not ( = ?auto_149591 ?auto_149592 ) ) ( not ( = ?auto_149596 ?auto_149597 ) ) ( not ( = ?auto_149590 ?auto_149589 ) ) ( not ( = ?auto_149591 ?auto_149589 ) ) ( not ( = ?auto_149592 ?auto_149589 ) ) ( not ( = ?auto_149595 ?auto_149596 ) ) ( not ( = ?auto_149595 ?auto_149597 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149590 ?auto_149591 ?auto_149589 ?auto_149592 ?auto_149588 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149621 - OBJ
      ?auto_149622 - OBJ
      ?auto_149623 - OBJ
      ?auto_149624 - OBJ
      ?auto_149620 - LOCATION
    )
    :vars
    (
      ?auto_149627 - LOCATION
      ?auto_149626 - CITY
      ?auto_149628 - LOCATION
      ?auto_149629 - LOCATION
      ?auto_149625 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149627 ?auto_149626 ) ( IN-CITY ?auto_149620 ?auto_149626 ) ( not ( = ?auto_149620 ?auto_149627 ) ) ( OBJ-AT ?auto_149621 ?auto_149627 ) ( IN-CITY ?auto_149628 ?auto_149626 ) ( not ( = ?auto_149620 ?auto_149628 ) ) ( OBJ-AT ?auto_149623 ?auto_149628 ) ( IN-CITY ?auto_149629 ?auto_149626 ) ( not ( = ?auto_149620 ?auto_149629 ) ) ( OBJ-AT ?auto_149624 ?auto_149629 ) ( OBJ-AT ?auto_149622 ?auto_149629 ) ( TRUCK-AT ?auto_149625 ?auto_149620 ) ( not ( = ?auto_149622 ?auto_149624 ) ) ( not ( = ?auto_149622 ?auto_149623 ) ) ( not ( = ?auto_149624 ?auto_149623 ) ) ( not ( = ?auto_149628 ?auto_149629 ) ) ( not ( = ?auto_149622 ?auto_149621 ) ) ( not ( = ?auto_149624 ?auto_149621 ) ) ( not ( = ?auto_149623 ?auto_149621 ) ) ( not ( = ?auto_149627 ?auto_149628 ) ) ( not ( = ?auto_149627 ?auto_149629 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149622 ?auto_149624 ?auto_149621 ?auto_149623 ?auto_149620 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149721 - OBJ
      ?auto_149722 - OBJ
      ?auto_149723 - OBJ
      ?auto_149724 - OBJ
      ?auto_149720 - LOCATION
    )
    :vars
    (
      ?auto_149727 - LOCATION
      ?auto_149726 - CITY
      ?auto_149728 - LOCATION
      ?auto_149729 - LOCATION
      ?auto_149725 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149727 ?auto_149726 ) ( IN-CITY ?auto_149720 ?auto_149726 ) ( not ( = ?auto_149720 ?auto_149727 ) ) ( OBJ-AT ?auto_149721 ?auto_149727 ) ( IN-CITY ?auto_149728 ?auto_149726 ) ( not ( = ?auto_149720 ?auto_149728 ) ) ( OBJ-AT ?auto_149724 ?auto_149728 ) ( IN-CITY ?auto_149729 ?auto_149726 ) ( not ( = ?auto_149720 ?auto_149729 ) ) ( OBJ-AT ?auto_149722 ?auto_149729 ) ( OBJ-AT ?auto_149723 ?auto_149729 ) ( TRUCK-AT ?auto_149725 ?auto_149720 ) ( not ( = ?auto_149723 ?auto_149722 ) ) ( not ( = ?auto_149723 ?auto_149724 ) ) ( not ( = ?auto_149722 ?auto_149724 ) ) ( not ( = ?auto_149728 ?auto_149729 ) ) ( not ( = ?auto_149723 ?auto_149721 ) ) ( not ( = ?auto_149722 ?auto_149721 ) ) ( not ( = ?auto_149724 ?auto_149721 ) ) ( not ( = ?auto_149727 ?auto_149728 ) ) ( not ( = ?auto_149727 ?auto_149729 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149723 ?auto_149722 ?auto_149721 ?auto_149724 ?auto_149720 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149788 - OBJ
      ?auto_149789 - OBJ
      ?auto_149790 - OBJ
      ?auto_149791 - OBJ
      ?auto_149787 - LOCATION
    )
    :vars
    (
      ?auto_149794 - LOCATION
      ?auto_149793 - CITY
      ?auto_149795 - LOCATION
      ?auto_149796 - LOCATION
      ?auto_149792 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149794 ?auto_149793 ) ( IN-CITY ?auto_149787 ?auto_149793 ) ( not ( = ?auto_149787 ?auto_149794 ) ) ( OBJ-AT ?auto_149788 ?auto_149794 ) ( IN-CITY ?auto_149795 ?auto_149793 ) ( not ( = ?auto_149787 ?auto_149795 ) ) ( OBJ-AT ?auto_149790 ?auto_149795 ) ( IN-CITY ?auto_149796 ?auto_149793 ) ( not ( = ?auto_149787 ?auto_149796 ) ) ( OBJ-AT ?auto_149789 ?auto_149796 ) ( OBJ-AT ?auto_149791 ?auto_149796 ) ( TRUCK-AT ?auto_149792 ?auto_149787 ) ( not ( = ?auto_149791 ?auto_149789 ) ) ( not ( = ?auto_149791 ?auto_149790 ) ) ( not ( = ?auto_149789 ?auto_149790 ) ) ( not ( = ?auto_149795 ?auto_149796 ) ) ( not ( = ?auto_149791 ?auto_149788 ) ) ( not ( = ?auto_149789 ?auto_149788 ) ) ( not ( = ?auto_149790 ?auto_149788 ) ) ( not ( = ?auto_149794 ?auto_149795 ) ) ( not ( = ?auto_149794 ?auto_149796 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149791 ?auto_149789 ?auto_149788 ?auto_149790 ?auto_149787 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149888 - OBJ
      ?auto_149889 - OBJ
      ?auto_149890 - OBJ
      ?auto_149891 - OBJ
      ?auto_149887 - LOCATION
    )
    :vars
    (
      ?auto_149894 - LOCATION
      ?auto_149893 - CITY
      ?auto_149895 - LOCATION
      ?auto_149896 - LOCATION
      ?auto_149892 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149894 ?auto_149893 ) ( IN-CITY ?auto_149887 ?auto_149893 ) ( not ( = ?auto_149887 ?auto_149894 ) ) ( OBJ-AT ?auto_149888 ?auto_149894 ) ( IN-CITY ?auto_149895 ?auto_149893 ) ( not ( = ?auto_149887 ?auto_149895 ) ) ( OBJ-AT ?auto_149889 ?auto_149895 ) ( IN-CITY ?auto_149896 ?auto_149893 ) ( not ( = ?auto_149887 ?auto_149896 ) ) ( OBJ-AT ?auto_149891 ?auto_149896 ) ( OBJ-AT ?auto_149890 ?auto_149896 ) ( TRUCK-AT ?auto_149892 ?auto_149887 ) ( not ( = ?auto_149890 ?auto_149891 ) ) ( not ( = ?auto_149890 ?auto_149889 ) ) ( not ( = ?auto_149891 ?auto_149889 ) ) ( not ( = ?auto_149895 ?auto_149896 ) ) ( not ( = ?auto_149890 ?auto_149888 ) ) ( not ( = ?auto_149891 ?auto_149888 ) ) ( not ( = ?auto_149889 ?auto_149888 ) ) ( not ( = ?auto_149894 ?auto_149895 ) ) ( not ( = ?auto_149894 ?auto_149896 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149890 ?auto_149891 ?auto_149888 ?auto_149889 ?auto_149887 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_149920 - OBJ
      ?auto_149921 - OBJ
      ?auto_149922 - OBJ
      ?auto_149923 - OBJ
      ?auto_149919 - LOCATION
    )
    :vars
    (
      ?auto_149926 - LOCATION
      ?auto_149925 - CITY
      ?auto_149927 - LOCATION
      ?auto_149928 - LOCATION
      ?auto_149924 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_149926 ?auto_149925 ) ( IN-CITY ?auto_149919 ?auto_149925 ) ( not ( = ?auto_149919 ?auto_149926 ) ) ( OBJ-AT ?auto_149920 ?auto_149926 ) ( IN-CITY ?auto_149927 ?auto_149925 ) ( not ( = ?auto_149919 ?auto_149927 ) ) ( OBJ-AT ?auto_149921 ?auto_149927 ) ( IN-CITY ?auto_149928 ?auto_149925 ) ( not ( = ?auto_149919 ?auto_149928 ) ) ( OBJ-AT ?auto_149922 ?auto_149928 ) ( OBJ-AT ?auto_149923 ?auto_149928 ) ( TRUCK-AT ?auto_149924 ?auto_149919 ) ( not ( = ?auto_149923 ?auto_149922 ) ) ( not ( = ?auto_149923 ?auto_149921 ) ) ( not ( = ?auto_149922 ?auto_149921 ) ) ( not ( = ?auto_149927 ?auto_149928 ) ) ( not ( = ?auto_149923 ?auto_149920 ) ) ( not ( = ?auto_149922 ?auto_149920 ) ) ( not ( = ?auto_149921 ?auto_149920 ) ) ( not ( = ?auto_149926 ?auto_149927 ) ) ( not ( = ?auto_149926 ?auto_149928 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_149923 ?auto_149922 ?auto_149920 ?auto_149921 ?auto_149919 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_150244 - OBJ
      ?auto_150243 - LOCATION
    )
    :vars
    (
      ?auto_150246 - LOCATION
      ?auto_150247 - CITY
      ?auto_150245 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_150246 ?auto_150247 ) ( IN-CITY ?auto_150243 ?auto_150247 ) ( not ( = ?auto_150243 ?auto_150246 ) ) ( OBJ-AT ?auto_150244 ?auto_150246 ) ( TRUCK-AT ?auto_150245 ?auto_150243 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_150245 ?auto_150243 ?auto_150246 ?auto_150247 )
      ( !LOAD-TRUCK ?auto_150244 ?auto_150245 ?auto_150246 )
      ( !DRIVE-TRUCK ?auto_150245 ?auto_150246 ?auto_150243 ?auto_150247 )
      ( !UNLOAD-TRUCK ?auto_150244 ?auto_150245 ?auto_150243 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_163981 - OBJ
      ?auto_163982 - OBJ
      ?auto_163983 - OBJ
      ?auto_163984 - OBJ
      ?auto_163985 - OBJ
      ?auto_163980 - LOCATION
    )
    :vars
    (
      ?auto_163988 - LOCATION
      ?auto_163986 - CITY
      ?auto_163989 - LOCATION
      ?auto_163990 - LOCATION
      ?auto_163991 - LOCATION
      ?auto_163987 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_163988 ?auto_163986 ) ( IN-CITY ?auto_163980 ?auto_163986 ) ( not ( = ?auto_163980 ?auto_163988 ) ) ( OBJ-AT ?auto_163985 ?auto_163988 ) ( IN-CITY ?auto_163989 ?auto_163986 ) ( not ( = ?auto_163980 ?auto_163989 ) ) ( OBJ-AT ?auto_163984 ?auto_163989 ) ( IN-CITY ?auto_163990 ?auto_163986 ) ( not ( = ?auto_163980 ?auto_163990 ) ) ( OBJ-AT ?auto_163983 ?auto_163990 ) ( IN-CITY ?auto_163991 ?auto_163986 ) ( not ( = ?auto_163980 ?auto_163991 ) ) ( OBJ-AT ?auto_163982 ?auto_163991 ) ( OBJ-AT ?auto_163981 ?auto_163991 ) ( TRUCK-AT ?auto_163987 ?auto_163980 ) ( not ( = ?auto_163981 ?auto_163982 ) ) ( not ( = ?auto_163981 ?auto_163983 ) ) ( not ( = ?auto_163982 ?auto_163983 ) ) ( not ( = ?auto_163990 ?auto_163991 ) ) ( not ( = ?auto_163981 ?auto_163984 ) ) ( not ( = ?auto_163982 ?auto_163984 ) ) ( not ( = ?auto_163983 ?auto_163984 ) ) ( not ( = ?auto_163989 ?auto_163990 ) ) ( not ( = ?auto_163989 ?auto_163991 ) ) ( not ( = ?auto_163981 ?auto_163985 ) ) ( not ( = ?auto_163982 ?auto_163985 ) ) ( not ( = ?auto_163983 ?auto_163985 ) ) ( not ( = ?auto_163984 ?auto_163985 ) ) ( not ( = ?auto_163988 ?auto_163989 ) ) ( not ( = ?auto_163988 ?auto_163990 ) ) ( not ( = ?auto_163988 ?auto_163991 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_163981 ?auto_163982 ?auto_163984 ?auto_163983 ?auto_163980 )
      ( DELIVER-1PKG ?auto_163985 ?auto_163980 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_164032 - OBJ
      ?auto_164033 - OBJ
      ?auto_164034 - OBJ
      ?auto_164035 - OBJ
      ?auto_164036 - OBJ
      ?auto_164031 - LOCATION
    )
    :vars
    (
      ?auto_164040 - LOCATION
      ?auto_164042 - CITY
      ?auto_164037 - LOCATION
      ?auto_164039 - LOCATION
      ?auto_164041 - LOCATION
      ?auto_164038 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_164040 ?auto_164042 ) ( IN-CITY ?auto_164031 ?auto_164042 ) ( not ( = ?auto_164031 ?auto_164040 ) ) ( OBJ-AT ?auto_164035 ?auto_164040 ) ( IN-CITY ?auto_164037 ?auto_164042 ) ( not ( = ?auto_164031 ?auto_164037 ) ) ( OBJ-AT ?auto_164036 ?auto_164037 ) ( IN-CITY ?auto_164039 ?auto_164042 ) ( not ( = ?auto_164031 ?auto_164039 ) ) ( OBJ-AT ?auto_164034 ?auto_164039 ) ( IN-CITY ?auto_164041 ?auto_164042 ) ( not ( = ?auto_164031 ?auto_164041 ) ) ( OBJ-AT ?auto_164033 ?auto_164041 ) ( OBJ-AT ?auto_164032 ?auto_164041 ) ( TRUCK-AT ?auto_164038 ?auto_164031 ) ( not ( = ?auto_164032 ?auto_164033 ) ) ( not ( = ?auto_164032 ?auto_164034 ) ) ( not ( = ?auto_164033 ?auto_164034 ) ) ( not ( = ?auto_164039 ?auto_164041 ) ) ( not ( = ?auto_164032 ?auto_164036 ) ) ( not ( = ?auto_164033 ?auto_164036 ) ) ( not ( = ?auto_164034 ?auto_164036 ) ) ( not ( = ?auto_164037 ?auto_164039 ) ) ( not ( = ?auto_164037 ?auto_164041 ) ) ( not ( = ?auto_164032 ?auto_164035 ) ) ( not ( = ?auto_164033 ?auto_164035 ) ) ( not ( = ?auto_164034 ?auto_164035 ) ) ( not ( = ?auto_164036 ?auto_164035 ) ) ( not ( = ?auto_164040 ?auto_164037 ) ) ( not ( = ?auto_164040 ?auto_164039 ) ) ( not ( = ?auto_164040 ?auto_164041 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_164032 ?auto_164033 ?auto_164034 ?auto_164036 ?auto_164035 ?auto_164031 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_164083 - OBJ
      ?auto_164084 - OBJ
      ?auto_164085 - OBJ
      ?auto_164086 - OBJ
      ?auto_164087 - OBJ
      ?auto_164082 - LOCATION
    )
    :vars
    (
      ?auto_164091 - LOCATION
      ?auto_164092 - CITY
      ?auto_164093 - LOCATION
      ?auto_164089 - LOCATION
      ?auto_164090 - LOCATION
      ?auto_164088 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_164091 ?auto_164092 ) ( IN-CITY ?auto_164082 ?auto_164092 ) ( not ( = ?auto_164082 ?auto_164091 ) ) ( OBJ-AT ?auto_164087 ?auto_164091 ) ( IN-CITY ?auto_164093 ?auto_164092 ) ( not ( = ?auto_164082 ?auto_164093 ) ) ( OBJ-AT ?auto_164085 ?auto_164093 ) ( IN-CITY ?auto_164089 ?auto_164092 ) ( not ( = ?auto_164082 ?auto_164089 ) ) ( OBJ-AT ?auto_164086 ?auto_164089 ) ( IN-CITY ?auto_164090 ?auto_164092 ) ( not ( = ?auto_164082 ?auto_164090 ) ) ( OBJ-AT ?auto_164084 ?auto_164090 ) ( OBJ-AT ?auto_164083 ?auto_164090 ) ( TRUCK-AT ?auto_164088 ?auto_164082 ) ( not ( = ?auto_164083 ?auto_164084 ) ) ( not ( = ?auto_164083 ?auto_164086 ) ) ( not ( = ?auto_164084 ?auto_164086 ) ) ( not ( = ?auto_164089 ?auto_164090 ) ) ( not ( = ?auto_164083 ?auto_164085 ) ) ( not ( = ?auto_164084 ?auto_164085 ) ) ( not ( = ?auto_164086 ?auto_164085 ) ) ( not ( = ?auto_164093 ?auto_164089 ) ) ( not ( = ?auto_164093 ?auto_164090 ) ) ( not ( = ?auto_164083 ?auto_164087 ) ) ( not ( = ?auto_164084 ?auto_164087 ) ) ( not ( = ?auto_164086 ?auto_164087 ) ) ( not ( = ?auto_164085 ?auto_164087 ) ) ( not ( = ?auto_164091 ?auto_164093 ) ) ( not ( = ?auto_164091 ?auto_164089 ) ) ( not ( = ?auto_164091 ?auto_164090 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_164083 ?auto_164084 ?auto_164086 ?auto_164087 ?auto_164085 ?auto_164082 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_164134 - OBJ
      ?auto_164135 - OBJ
      ?auto_164136 - OBJ
      ?auto_164137 - OBJ
      ?auto_164138 - OBJ
      ?auto_164133 - LOCATION
    )
    :vars
    (
      ?auto_164142 - LOCATION
      ?auto_164143 - CITY
      ?auto_164144 - LOCATION
      ?auto_164140 - LOCATION
      ?auto_164141 - LOCATION
      ?auto_164139 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_164142 ?auto_164143 ) ( IN-CITY ?auto_164133 ?auto_164143 ) ( not ( = ?auto_164133 ?auto_164142 ) ) ( OBJ-AT ?auto_164137 ?auto_164142 ) ( IN-CITY ?auto_164144 ?auto_164143 ) ( not ( = ?auto_164133 ?auto_164144 ) ) ( OBJ-AT ?auto_164136 ?auto_164144 ) ( IN-CITY ?auto_164140 ?auto_164143 ) ( not ( = ?auto_164133 ?auto_164140 ) ) ( OBJ-AT ?auto_164138 ?auto_164140 ) ( IN-CITY ?auto_164141 ?auto_164143 ) ( not ( = ?auto_164133 ?auto_164141 ) ) ( OBJ-AT ?auto_164135 ?auto_164141 ) ( OBJ-AT ?auto_164134 ?auto_164141 ) ( TRUCK-AT ?auto_164139 ?auto_164133 ) ( not ( = ?auto_164134 ?auto_164135 ) ) ( not ( = ?auto_164134 ?auto_164138 ) ) ( not ( = ?auto_164135 ?auto_164138 ) ) ( not ( = ?auto_164140 ?auto_164141 ) ) ( not ( = ?auto_164134 ?auto_164136 ) ) ( not ( = ?auto_164135 ?auto_164136 ) ) ( not ( = ?auto_164138 ?auto_164136 ) ) ( not ( = ?auto_164144 ?auto_164140 ) ) ( not ( = ?auto_164144 ?auto_164141 ) ) ( not ( = ?auto_164134 ?auto_164137 ) ) ( not ( = ?auto_164135 ?auto_164137 ) ) ( not ( = ?auto_164138 ?auto_164137 ) ) ( not ( = ?auto_164136 ?auto_164137 ) ) ( not ( = ?auto_164142 ?auto_164144 ) ) ( not ( = ?auto_164142 ?auto_164140 ) ) ( not ( = ?auto_164142 ?auto_164141 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_164134 ?auto_164135 ?auto_164138 ?auto_164137 ?auto_164136 ?auto_164133 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_164347 - OBJ
      ?auto_164348 - OBJ
      ?auto_164349 - OBJ
      ?auto_164350 - OBJ
      ?auto_164351 - OBJ
      ?auto_164346 - LOCATION
    )
    :vars
    (
      ?auto_164355 - LOCATION
      ?auto_164356 - CITY
      ?auto_164357 - LOCATION
      ?auto_164353 - LOCATION
      ?auto_164354 - LOCATION
      ?auto_164352 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_164355 ?auto_164356 ) ( IN-CITY ?auto_164346 ?auto_164356 ) ( not ( = ?auto_164346 ?auto_164355 ) ) ( OBJ-AT ?auto_164349 ?auto_164355 ) ( IN-CITY ?auto_164357 ?auto_164356 ) ( not ( = ?auto_164346 ?auto_164357 ) ) ( OBJ-AT ?auto_164351 ?auto_164357 ) ( IN-CITY ?auto_164353 ?auto_164356 ) ( not ( = ?auto_164346 ?auto_164353 ) ) ( OBJ-AT ?auto_164350 ?auto_164353 ) ( IN-CITY ?auto_164354 ?auto_164356 ) ( not ( = ?auto_164346 ?auto_164354 ) ) ( OBJ-AT ?auto_164348 ?auto_164354 ) ( OBJ-AT ?auto_164347 ?auto_164354 ) ( TRUCK-AT ?auto_164352 ?auto_164346 ) ( not ( = ?auto_164347 ?auto_164348 ) ) ( not ( = ?auto_164347 ?auto_164350 ) ) ( not ( = ?auto_164348 ?auto_164350 ) ) ( not ( = ?auto_164353 ?auto_164354 ) ) ( not ( = ?auto_164347 ?auto_164351 ) ) ( not ( = ?auto_164348 ?auto_164351 ) ) ( not ( = ?auto_164350 ?auto_164351 ) ) ( not ( = ?auto_164357 ?auto_164353 ) ) ( not ( = ?auto_164357 ?auto_164354 ) ) ( not ( = ?auto_164347 ?auto_164349 ) ) ( not ( = ?auto_164348 ?auto_164349 ) ) ( not ( = ?auto_164350 ?auto_164349 ) ) ( not ( = ?auto_164351 ?auto_164349 ) ) ( not ( = ?auto_164355 ?auto_164357 ) ) ( not ( = ?auto_164355 ?auto_164353 ) ) ( not ( = ?auto_164355 ?auto_164354 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_164347 ?auto_164348 ?auto_164350 ?auto_164349 ?auto_164351 ?auto_164346 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_164398 - OBJ
      ?auto_164399 - OBJ
      ?auto_164400 - OBJ
      ?auto_164401 - OBJ
      ?auto_164402 - OBJ
      ?auto_164397 - LOCATION
    )
    :vars
    (
      ?auto_164406 - LOCATION
      ?auto_164407 - CITY
      ?auto_164408 - LOCATION
      ?auto_164404 - LOCATION
      ?auto_164405 - LOCATION
      ?auto_164403 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_164406 ?auto_164407 ) ( IN-CITY ?auto_164397 ?auto_164407 ) ( not ( = ?auto_164397 ?auto_164406 ) ) ( OBJ-AT ?auto_164400 ?auto_164406 ) ( IN-CITY ?auto_164408 ?auto_164407 ) ( not ( = ?auto_164397 ?auto_164408 ) ) ( OBJ-AT ?auto_164401 ?auto_164408 ) ( IN-CITY ?auto_164404 ?auto_164407 ) ( not ( = ?auto_164397 ?auto_164404 ) ) ( OBJ-AT ?auto_164402 ?auto_164404 ) ( IN-CITY ?auto_164405 ?auto_164407 ) ( not ( = ?auto_164397 ?auto_164405 ) ) ( OBJ-AT ?auto_164399 ?auto_164405 ) ( OBJ-AT ?auto_164398 ?auto_164405 ) ( TRUCK-AT ?auto_164403 ?auto_164397 ) ( not ( = ?auto_164398 ?auto_164399 ) ) ( not ( = ?auto_164398 ?auto_164402 ) ) ( not ( = ?auto_164399 ?auto_164402 ) ) ( not ( = ?auto_164404 ?auto_164405 ) ) ( not ( = ?auto_164398 ?auto_164401 ) ) ( not ( = ?auto_164399 ?auto_164401 ) ) ( not ( = ?auto_164402 ?auto_164401 ) ) ( not ( = ?auto_164408 ?auto_164404 ) ) ( not ( = ?auto_164408 ?auto_164405 ) ) ( not ( = ?auto_164398 ?auto_164400 ) ) ( not ( = ?auto_164399 ?auto_164400 ) ) ( not ( = ?auto_164402 ?auto_164400 ) ) ( not ( = ?auto_164401 ?auto_164400 ) ) ( not ( = ?auto_164406 ?auto_164408 ) ) ( not ( = ?auto_164406 ?auto_164404 ) ) ( not ( = ?auto_164406 ?auto_164405 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_164398 ?auto_164399 ?auto_164402 ?auto_164400 ?auto_164401 ?auto_164397 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_164665 - OBJ
      ?auto_164666 - OBJ
      ?auto_164667 - OBJ
      ?auto_164668 - OBJ
      ?auto_164669 - OBJ
      ?auto_164664 - LOCATION
    )
    :vars
    (
      ?auto_164673 - LOCATION
      ?auto_164674 - CITY
      ?auto_164675 - LOCATION
      ?auto_164671 - LOCATION
      ?auto_164672 - LOCATION
      ?auto_164670 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_164673 ?auto_164674 ) ( IN-CITY ?auto_164664 ?auto_164674 ) ( not ( = ?auto_164664 ?auto_164673 ) ) ( OBJ-AT ?auto_164669 ?auto_164673 ) ( IN-CITY ?auto_164675 ?auto_164674 ) ( not ( = ?auto_164664 ?auto_164675 ) ) ( OBJ-AT ?auto_164668 ?auto_164675 ) ( IN-CITY ?auto_164671 ?auto_164674 ) ( not ( = ?auto_164664 ?auto_164671 ) ) ( OBJ-AT ?auto_164666 ?auto_164671 ) ( IN-CITY ?auto_164672 ?auto_164674 ) ( not ( = ?auto_164664 ?auto_164672 ) ) ( OBJ-AT ?auto_164667 ?auto_164672 ) ( OBJ-AT ?auto_164665 ?auto_164672 ) ( TRUCK-AT ?auto_164670 ?auto_164664 ) ( not ( = ?auto_164665 ?auto_164667 ) ) ( not ( = ?auto_164665 ?auto_164666 ) ) ( not ( = ?auto_164667 ?auto_164666 ) ) ( not ( = ?auto_164671 ?auto_164672 ) ) ( not ( = ?auto_164665 ?auto_164668 ) ) ( not ( = ?auto_164667 ?auto_164668 ) ) ( not ( = ?auto_164666 ?auto_164668 ) ) ( not ( = ?auto_164675 ?auto_164671 ) ) ( not ( = ?auto_164675 ?auto_164672 ) ) ( not ( = ?auto_164665 ?auto_164669 ) ) ( not ( = ?auto_164667 ?auto_164669 ) ) ( not ( = ?auto_164666 ?auto_164669 ) ) ( not ( = ?auto_164668 ?auto_164669 ) ) ( not ( = ?auto_164673 ?auto_164675 ) ) ( not ( = ?auto_164673 ?auto_164671 ) ) ( not ( = ?auto_164673 ?auto_164672 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_164665 ?auto_164667 ?auto_164666 ?auto_164669 ?auto_164668 ?auto_164664 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_164716 - OBJ
      ?auto_164717 - OBJ
      ?auto_164718 - OBJ
      ?auto_164719 - OBJ
      ?auto_164720 - OBJ
      ?auto_164715 - LOCATION
    )
    :vars
    (
      ?auto_164724 - LOCATION
      ?auto_164725 - CITY
      ?auto_164726 - LOCATION
      ?auto_164722 - LOCATION
      ?auto_164723 - LOCATION
      ?auto_164721 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_164724 ?auto_164725 ) ( IN-CITY ?auto_164715 ?auto_164725 ) ( not ( = ?auto_164715 ?auto_164724 ) ) ( OBJ-AT ?auto_164719 ?auto_164724 ) ( IN-CITY ?auto_164726 ?auto_164725 ) ( not ( = ?auto_164715 ?auto_164726 ) ) ( OBJ-AT ?auto_164720 ?auto_164726 ) ( IN-CITY ?auto_164722 ?auto_164725 ) ( not ( = ?auto_164715 ?auto_164722 ) ) ( OBJ-AT ?auto_164717 ?auto_164722 ) ( IN-CITY ?auto_164723 ?auto_164725 ) ( not ( = ?auto_164715 ?auto_164723 ) ) ( OBJ-AT ?auto_164718 ?auto_164723 ) ( OBJ-AT ?auto_164716 ?auto_164723 ) ( TRUCK-AT ?auto_164721 ?auto_164715 ) ( not ( = ?auto_164716 ?auto_164718 ) ) ( not ( = ?auto_164716 ?auto_164717 ) ) ( not ( = ?auto_164718 ?auto_164717 ) ) ( not ( = ?auto_164722 ?auto_164723 ) ) ( not ( = ?auto_164716 ?auto_164720 ) ) ( not ( = ?auto_164718 ?auto_164720 ) ) ( not ( = ?auto_164717 ?auto_164720 ) ) ( not ( = ?auto_164726 ?auto_164722 ) ) ( not ( = ?auto_164726 ?auto_164723 ) ) ( not ( = ?auto_164716 ?auto_164719 ) ) ( not ( = ?auto_164718 ?auto_164719 ) ) ( not ( = ?auto_164717 ?auto_164719 ) ) ( not ( = ?auto_164720 ?auto_164719 ) ) ( not ( = ?auto_164724 ?auto_164726 ) ) ( not ( = ?auto_164724 ?auto_164722 ) ) ( not ( = ?auto_164724 ?auto_164723 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_164716 ?auto_164718 ?auto_164717 ?auto_164719 ?auto_164720 ?auto_164715 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_164876 - OBJ
      ?auto_164877 - OBJ
      ?auto_164878 - OBJ
      ?auto_164879 - OBJ
      ?auto_164880 - OBJ
      ?auto_164875 - LOCATION
    )
    :vars
    (
      ?auto_164884 - LOCATION
      ?auto_164885 - CITY
      ?auto_164886 - LOCATION
      ?auto_164882 - LOCATION
      ?auto_164883 - LOCATION
      ?auto_164881 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_164884 ?auto_164885 ) ( IN-CITY ?auto_164875 ?auto_164885 ) ( not ( = ?auto_164875 ?auto_164884 ) ) ( OBJ-AT ?auto_164880 ?auto_164884 ) ( IN-CITY ?auto_164886 ?auto_164885 ) ( not ( = ?auto_164875 ?auto_164886 ) ) ( OBJ-AT ?auto_164878 ?auto_164886 ) ( IN-CITY ?auto_164882 ?auto_164885 ) ( not ( = ?auto_164875 ?auto_164882 ) ) ( OBJ-AT ?auto_164877 ?auto_164882 ) ( IN-CITY ?auto_164883 ?auto_164885 ) ( not ( = ?auto_164875 ?auto_164883 ) ) ( OBJ-AT ?auto_164879 ?auto_164883 ) ( OBJ-AT ?auto_164876 ?auto_164883 ) ( TRUCK-AT ?auto_164881 ?auto_164875 ) ( not ( = ?auto_164876 ?auto_164879 ) ) ( not ( = ?auto_164876 ?auto_164877 ) ) ( not ( = ?auto_164879 ?auto_164877 ) ) ( not ( = ?auto_164882 ?auto_164883 ) ) ( not ( = ?auto_164876 ?auto_164878 ) ) ( not ( = ?auto_164879 ?auto_164878 ) ) ( not ( = ?auto_164877 ?auto_164878 ) ) ( not ( = ?auto_164886 ?auto_164882 ) ) ( not ( = ?auto_164886 ?auto_164883 ) ) ( not ( = ?auto_164876 ?auto_164880 ) ) ( not ( = ?auto_164879 ?auto_164880 ) ) ( not ( = ?auto_164877 ?auto_164880 ) ) ( not ( = ?auto_164878 ?auto_164880 ) ) ( not ( = ?auto_164884 ?auto_164886 ) ) ( not ( = ?auto_164884 ?auto_164882 ) ) ( not ( = ?auto_164884 ?auto_164883 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_164876 ?auto_164879 ?auto_164877 ?auto_164880 ?auto_164878 ?auto_164875 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_164927 - OBJ
      ?auto_164928 - OBJ
      ?auto_164929 - OBJ
      ?auto_164930 - OBJ
      ?auto_164931 - OBJ
      ?auto_164926 - LOCATION
    )
    :vars
    (
      ?auto_164935 - LOCATION
      ?auto_164936 - CITY
      ?auto_164937 - LOCATION
      ?auto_164933 - LOCATION
      ?auto_164934 - LOCATION
      ?auto_164932 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_164935 ?auto_164936 ) ( IN-CITY ?auto_164926 ?auto_164936 ) ( not ( = ?auto_164926 ?auto_164935 ) ) ( OBJ-AT ?auto_164930 ?auto_164935 ) ( IN-CITY ?auto_164937 ?auto_164936 ) ( not ( = ?auto_164926 ?auto_164937 ) ) ( OBJ-AT ?auto_164929 ?auto_164937 ) ( IN-CITY ?auto_164933 ?auto_164936 ) ( not ( = ?auto_164926 ?auto_164933 ) ) ( OBJ-AT ?auto_164928 ?auto_164933 ) ( IN-CITY ?auto_164934 ?auto_164936 ) ( not ( = ?auto_164926 ?auto_164934 ) ) ( OBJ-AT ?auto_164931 ?auto_164934 ) ( OBJ-AT ?auto_164927 ?auto_164934 ) ( TRUCK-AT ?auto_164932 ?auto_164926 ) ( not ( = ?auto_164927 ?auto_164931 ) ) ( not ( = ?auto_164927 ?auto_164928 ) ) ( not ( = ?auto_164931 ?auto_164928 ) ) ( not ( = ?auto_164933 ?auto_164934 ) ) ( not ( = ?auto_164927 ?auto_164929 ) ) ( not ( = ?auto_164931 ?auto_164929 ) ) ( not ( = ?auto_164928 ?auto_164929 ) ) ( not ( = ?auto_164937 ?auto_164933 ) ) ( not ( = ?auto_164937 ?auto_164934 ) ) ( not ( = ?auto_164927 ?auto_164930 ) ) ( not ( = ?auto_164931 ?auto_164930 ) ) ( not ( = ?auto_164928 ?auto_164930 ) ) ( not ( = ?auto_164929 ?auto_164930 ) ) ( not ( = ?auto_164935 ?auto_164937 ) ) ( not ( = ?auto_164935 ?auto_164933 ) ) ( not ( = ?auto_164935 ?auto_164934 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_164927 ?auto_164931 ?auto_164928 ?auto_164930 ?auto_164929 ?auto_164926 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165085 - OBJ
      ?auto_165086 - OBJ
      ?auto_165087 - OBJ
      ?auto_165088 - OBJ
      ?auto_165089 - OBJ
      ?auto_165084 - LOCATION
    )
    :vars
    (
      ?auto_165093 - LOCATION
      ?auto_165094 - CITY
      ?auto_165095 - LOCATION
      ?auto_165091 - LOCATION
      ?auto_165092 - LOCATION
      ?auto_165090 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165093 ?auto_165094 ) ( IN-CITY ?auto_165084 ?auto_165094 ) ( not ( = ?auto_165084 ?auto_165093 ) ) ( OBJ-AT ?auto_165087 ?auto_165093 ) ( IN-CITY ?auto_165095 ?auto_165094 ) ( not ( = ?auto_165084 ?auto_165095 ) ) ( OBJ-AT ?auto_165089 ?auto_165095 ) ( IN-CITY ?auto_165091 ?auto_165094 ) ( not ( = ?auto_165084 ?auto_165091 ) ) ( OBJ-AT ?auto_165086 ?auto_165091 ) ( IN-CITY ?auto_165092 ?auto_165094 ) ( not ( = ?auto_165084 ?auto_165092 ) ) ( OBJ-AT ?auto_165088 ?auto_165092 ) ( OBJ-AT ?auto_165085 ?auto_165092 ) ( TRUCK-AT ?auto_165090 ?auto_165084 ) ( not ( = ?auto_165085 ?auto_165088 ) ) ( not ( = ?auto_165085 ?auto_165086 ) ) ( not ( = ?auto_165088 ?auto_165086 ) ) ( not ( = ?auto_165091 ?auto_165092 ) ) ( not ( = ?auto_165085 ?auto_165089 ) ) ( not ( = ?auto_165088 ?auto_165089 ) ) ( not ( = ?auto_165086 ?auto_165089 ) ) ( not ( = ?auto_165095 ?auto_165091 ) ) ( not ( = ?auto_165095 ?auto_165092 ) ) ( not ( = ?auto_165085 ?auto_165087 ) ) ( not ( = ?auto_165088 ?auto_165087 ) ) ( not ( = ?auto_165086 ?auto_165087 ) ) ( not ( = ?auto_165089 ?auto_165087 ) ) ( not ( = ?auto_165093 ?auto_165095 ) ) ( not ( = ?auto_165093 ?auto_165091 ) ) ( not ( = ?auto_165093 ?auto_165092 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165085 ?auto_165088 ?auto_165086 ?auto_165087 ?auto_165089 ?auto_165084 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165191 - OBJ
      ?auto_165192 - OBJ
      ?auto_165193 - OBJ
      ?auto_165194 - OBJ
      ?auto_165195 - OBJ
      ?auto_165190 - LOCATION
    )
    :vars
    (
      ?auto_165199 - LOCATION
      ?auto_165200 - CITY
      ?auto_165201 - LOCATION
      ?auto_165197 - LOCATION
      ?auto_165198 - LOCATION
      ?auto_165196 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165199 ?auto_165200 ) ( IN-CITY ?auto_165190 ?auto_165200 ) ( not ( = ?auto_165190 ?auto_165199 ) ) ( OBJ-AT ?auto_165193 ?auto_165199 ) ( IN-CITY ?auto_165201 ?auto_165200 ) ( not ( = ?auto_165190 ?auto_165201 ) ) ( OBJ-AT ?auto_165194 ?auto_165201 ) ( IN-CITY ?auto_165197 ?auto_165200 ) ( not ( = ?auto_165190 ?auto_165197 ) ) ( OBJ-AT ?auto_165192 ?auto_165197 ) ( IN-CITY ?auto_165198 ?auto_165200 ) ( not ( = ?auto_165190 ?auto_165198 ) ) ( OBJ-AT ?auto_165195 ?auto_165198 ) ( OBJ-AT ?auto_165191 ?auto_165198 ) ( TRUCK-AT ?auto_165196 ?auto_165190 ) ( not ( = ?auto_165191 ?auto_165195 ) ) ( not ( = ?auto_165191 ?auto_165192 ) ) ( not ( = ?auto_165195 ?auto_165192 ) ) ( not ( = ?auto_165197 ?auto_165198 ) ) ( not ( = ?auto_165191 ?auto_165194 ) ) ( not ( = ?auto_165195 ?auto_165194 ) ) ( not ( = ?auto_165192 ?auto_165194 ) ) ( not ( = ?auto_165201 ?auto_165197 ) ) ( not ( = ?auto_165201 ?auto_165198 ) ) ( not ( = ?auto_165191 ?auto_165193 ) ) ( not ( = ?auto_165195 ?auto_165193 ) ) ( not ( = ?auto_165192 ?auto_165193 ) ) ( not ( = ?auto_165194 ?auto_165193 ) ) ( not ( = ?auto_165199 ?auto_165201 ) ) ( not ( = ?auto_165199 ?auto_165197 ) ) ( not ( = ?auto_165199 ?auto_165198 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165191 ?auto_165195 ?auto_165192 ?auto_165193 ?auto_165194 ?auto_165190 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165458 - OBJ
      ?auto_165459 - OBJ
      ?auto_165460 - OBJ
      ?auto_165461 - OBJ
      ?auto_165462 - OBJ
      ?auto_165457 - LOCATION
    )
    :vars
    (
      ?auto_165466 - LOCATION
      ?auto_165467 - CITY
      ?auto_165468 - LOCATION
      ?auto_165464 - LOCATION
      ?auto_165465 - LOCATION
      ?auto_165463 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165466 ?auto_165467 ) ( IN-CITY ?auto_165457 ?auto_165467 ) ( not ( = ?auto_165457 ?auto_165466 ) ) ( OBJ-AT ?auto_165462 ?auto_165466 ) ( IN-CITY ?auto_165468 ?auto_165467 ) ( not ( = ?auto_165457 ?auto_165468 ) ) ( OBJ-AT ?auto_165459 ?auto_165468 ) ( IN-CITY ?auto_165464 ?auto_165467 ) ( not ( = ?auto_165457 ?auto_165464 ) ) ( OBJ-AT ?auto_165461 ?auto_165464 ) ( IN-CITY ?auto_165465 ?auto_165467 ) ( not ( = ?auto_165457 ?auto_165465 ) ) ( OBJ-AT ?auto_165460 ?auto_165465 ) ( OBJ-AT ?auto_165458 ?auto_165465 ) ( TRUCK-AT ?auto_165463 ?auto_165457 ) ( not ( = ?auto_165458 ?auto_165460 ) ) ( not ( = ?auto_165458 ?auto_165461 ) ) ( not ( = ?auto_165460 ?auto_165461 ) ) ( not ( = ?auto_165464 ?auto_165465 ) ) ( not ( = ?auto_165458 ?auto_165459 ) ) ( not ( = ?auto_165460 ?auto_165459 ) ) ( not ( = ?auto_165461 ?auto_165459 ) ) ( not ( = ?auto_165468 ?auto_165464 ) ) ( not ( = ?auto_165468 ?auto_165465 ) ) ( not ( = ?auto_165458 ?auto_165462 ) ) ( not ( = ?auto_165460 ?auto_165462 ) ) ( not ( = ?auto_165461 ?auto_165462 ) ) ( not ( = ?auto_165459 ?auto_165462 ) ) ( not ( = ?auto_165466 ?auto_165468 ) ) ( not ( = ?auto_165466 ?auto_165464 ) ) ( not ( = ?auto_165466 ?auto_165465 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165458 ?auto_165460 ?auto_165461 ?auto_165462 ?auto_165459 ?auto_165457 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165509 - OBJ
      ?auto_165510 - OBJ
      ?auto_165511 - OBJ
      ?auto_165512 - OBJ
      ?auto_165513 - OBJ
      ?auto_165508 - LOCATION
    )
    :vars
    (
      ?auto_165517 - LOCATION
      ?auto_165518 - CITY
      ?auto_165519 - LOCATION
      ?auto_165515 - LOCATION
      ?auto_165516 - LOCATION
      ?auto_165514 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165517 ?auto_165518 ) ( IN-CITY ?auto_165508 ?auto_165518 ) ( not ( = ?auto_165508 ?auto_165517 ) ) ( OBJ-AT ?auto_165512 ?auto_165517 ) ( IN-CITY ?auto_165519 ?auto_165518 ) ( not ( = ?auto_165508 ?auto_165519 ) ) ( OBJ-AT ?auto_165510 ?auto_165519 ) ( IN-CITY ?auto_165515 ?auto_165518 ) ( not ( = ?auto_165508 ?auto_165515 ) ) ( OBJ-AT ?auto_165513 ?auto_165515 ) ( IN-CITY ?auto_165516 ?auto_165518 ) ( not ( = ?auto_165508 ?auto_165516 ) ) ( OBJ-AT ?auto_165511 ?auto_165516 ) ( OBJ-AT ?auto_165509 ?auto_165516 ) ( TRUCK-AT ?auto_165514 ?auto_165508 ) ( not ( = ?auto_165509 ?auto_165511 ) ) ( not ( = ?auto_165509 ?auto_165513 ) ) ( not ( = ?auto_165511 ?auto_165513 ) ) ( not ( = ?auto_165515 ?auto_165516 ) ) ( not ( = ?auto_165509 ?auto_165510 ) ) ( not ( = ?auto_165511 ?auto_165510 ) ) ( not ( = ?auto_165513 ?auto_165510 ) ) ( not ( = ?auto_165519 ?auto_165515 ) ) ( not ( = ?auto_165519 ?auto_165516 ) ) ( not ( = ?auto_165509 ?auto_165512 ) ) ( not ( = ?auto_165511 ?auto_165512 ) ) ( not ( = ?auto_165513 ?auto_165512 ) ) ( not ( = ?auto_165510 ?auto_165512 ) ) ( not ( = ?auto_165517 ?auto_165519 ) ) ( not ( = ?auto_165517 ?auto_165515 ) ) ( not ( = ?auto_165517 ?auto_165516 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165509 ?auto_165511 ?auto_165513 ?auto_165512 ?auto_165510 ?auto_165508 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165560 - OBJ
      ?auto_165561 - OBJ
      ?auto_165562 - OBJ
      ?auto_165563 - OBJ
      ?auto_165564 - OBJ
      ?auto_165559 - LOCATION
    )
    :vars
    (
      ?auto_165568 - LOCATION
      ?auto_165569 - CITY
      ?auto_165570 - LOCATION
      ?auto_165566 - LOCATION
      ?auto_165567 - LOCATION
      ?auto_165565 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165568 ?auto_165569 ) ( IN-CITY ?auto_165559 ?auto_165569 ) ( not ( = ?auto_165559 ?auto_165568 ) ) ( OBJ-AT ?auto_165564 ?auto_165568 ) ( IN-CITY ?auto_165570 ?auto_165569 ) ( not ( = ?auto_165559 ?auto_165570 ) ) ( OBJ-AT ?auto_165561 ?auto_165570 ) ( IN-CITY ?auto_165566 ?auto_165569 ) ( not ( = ?auto_165559 ?auto_165566 ) ) ( OBJ-AT ?auto_165562 ?auto_165566 ) ( IN-CITY ?auto_165567 ?auto_165569 ) ( not ( = ?auto_165559 ?auto_165567 ) ) ( OBJ-AT ?auto_165563 ?auto_165567 ) ( OBJ-AT ?auto_165560 ?auto_165567 ) ( TRUCK-AT ?auto_165565 ?auto_165559 ) ( not ( = ?auto_165560 ?auto_165563 ) ) ( not ( = ?auto_165560 ?auto_165562 ) ) ( not ( = ?auto_165563 ?auto_165562 ) ) ( not ( = ?auto_165566 ?auto_165567 ) ) ( not ( = ?auto_165560 ?auto_165561 ) ) ( not ( = ?auto_165563 ?auto_165561 ) ) ( not ( = ?auto_165562 ?auto_165561 ) ) ( not ( = ?auto_165570 ?auto_165566 ) ) ( not ( = ?auto_165570 ?auto_165567 ) ) ( not ( = ?auto_165560 ?auto_165564 ) ) ( not ( = ?auto_165563 ?auto_165564 ) ) ( not ( = ?auto_165562 ?auto_165564 ) ) ( not ( = ?auto_165561 ?auto_165564 ) ) ( not ( = ?auto_165568 ?auto_165570 ) ) ( not ( = ?auto_165568 ?auto_165566 ) ) ( not ( = ?auto_165568 ?auto_165567 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165560 ?auto_165563 ?auto_165562 ?auto_165564 ?auto_165561 ?auto_165559 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165611 - OBJ
      ?auto_165612 - OBJ
      ?auto_165613 - OBJ
      ?auto_165614 - OBJ
      ?auto_165615 - OBJ
      ?auto_165610 - LOCATION
    )
    :vars
    (
      ?auto_165619 - LOCATION
      ?auto_165620 - CITY
      ?auto_165621 - LOCATION
      ?auto_165617 - LOCATION
      ?auto_165618 - LOCATION
      ?auto_165616 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165619 ?auto_165620 ) ( IN-CITY ?auto_165610 ?auto_165620 ) ( not ( = ?auto_165610 ?auto_165619 ) ) ( OBJ-AT ?auto_165614 ?auto_165619 ) ( IN-CITY ?auto_165621 ?auto_165620 ) ( not ( = ?auto_165610 ?auto_165621 ) ) ( OBJ-AT ?auto_165612 ?auto_165621 ) ( IN-CITY ?auto_165617 ?auto_165620 ) ( not ( = ?auto_165610 ?auto_165617 ) ) ( OBJ-AT ?auto_165613 ?auto_165617 ) ( IN-CITY ?auto_165618 ?auto_165620 ) ( not ( = ?auto_165610 ?auto_165618 ) ) ( OBJ-AT ?auto_165615 ?auto_165618 ) ( OBJ-AT ?auto_165611 ?auto_165618 ) ( TRUCK-AT ?auto_165616 ?auto_165610 ) ( not ( = ?auto_165611 ?auto_165615 ) ) ( not ( = ?auto_165611 ?auto_165613 ) ) ( not ( = ?auto_165615 ?auto_165613 ) ) ( not ( = ?auto_165617 ?auto_165618 ) ) ( not ( = ?auto_165611 ?auto_165612 ) ) ( not ( = ?auto_165615 ?auto_165612 ) ) ( not ( = ?auto_165613 ?auto_165612 ) ) ( not ( = ?auto_165621 ?auto_165617 ) ) ( not ( = ?auto_165621 ?auto_165618 ) ) ( not ( = ?auto_165611 ?auto_165614 ) ) ( not ( = ?auto_165615 ?auto_165614 ) ) ( not ( = ?auto_165613 ?auto_165614 ) ) ( not ( = ?auto_165612 ?auto_165614 ) ) ( not ( = ?auto_165619 ?auto_165621 ) ) ( not ( = ?auto_165619 ?auto_165617 ) ) ( not ( = ?auto_165619 ?auto_165618 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165611 ?auto_165615 ?auto_165613 ?auto_165614 ?auto_165612 ?auto_165610 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165878 - OBJ
      ?auto_165879 - OBJ
      ?auto_165880 - OBJ
      ?auto_165881 - OBJ
      ?auto_165882 - OBJ
      ?auto_165877 - LOCATION
    )
    :vars
    (
      ?auto_165886 - LOCATION
      ?auto_165887 - CITY
      ?auto_165888 - LOCATION
      ?auto_165884 - LOCATION
      ?auto_165885 - LOCATION
      ?auto_165883 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165886 ?auto_165887 ) ( IN-CITY ?auto_165877 ?auto_165887 ) ( not ( = ?auto_165877 ?auto_165886 ) ) ( OBJ-AT ?auto_165880 ?auto_165886 ) ( IN-CITY ?auto_165888 ?auto_165887 ) ( not ( = ?auto_165877 ?auto_165888 ) ) ( OBJ-AT ?auto_165879 ?auto_165888 ) ( IN-CITY ?auto_165884 ?auto_165887 ) ( not ( = ?auto_165877 ?auto_165884 ) ) ( OBJ-AT ?auto_165882 ?auto_165884 ) ( IN-CITY ?auto_165885 ?auto_165887 ) ( not ( = ?auto_165877 ?auto_165885 ) ) ( OBJ-AT ?auto_165881 ?auto_165885 ) ( OBJ-AT ?auto_165878 ?auto_165885 ) ( TRUCK-AT ?auto_165883 ?auto_165877 ) ( not ( = ?auto_165878 ?auto_165881 ) ) ( not ( = ?auto_165878 ?auto_165882 ) ) ( not ( = ?auto_165881 ?auto_165882 ) ) ( not ( = ?auto_165884 ?auto_165885 ) ) ( not ( = ?auto_165878 ?auto_165879 ) ) ( not ( = ?auto_165881 ?auto_165879 ) ) ( not ( = ?auto_165882 ?auto_165879 ) ) ( not ( = ?auto_165888 ?auto_165884 ) ) ( not ( = ?auto_165888 ?auto_165885 ) ) ( not ( = ?auto_165878 ?auto_165880 ) ) ( not ( = ?auto_165881 ?auto_165880 ) ) ( not ( = ?auto_165882 ?auto_165880 ) ) ( not ( = ?auto_165879 ?auto_165880 ) ) ( not ( = ?auto_165886 ?auto_165888 ) ) ( not ( = ?auto_165886 ?auto_165884 ) ) ( not ( = ?auto_165886 ?auto_165885 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165878 ?auto_165881 ?auto_165882 ?auto_165880 ?auto_165879 ?auto_165877 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_165929 - OBJ
      ?auto_165930 - OBJ
      ?auto_165931 - OBJ
      ?auto_165932 - OBJ
      ?auto_165933 - OBJ
      ?auto_165928 - LOCATION
    )
    :vars
    (
      ?auto_165937 - LOCATION
      ?auto_165938 - CITY
      ?auto_165939 - LOCATION
      ?auto_165935 - LOCATION
      ?auto_165936 - LOCATION
      ?auto_165934 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_165937 ?auto_165938 ) ( IN-CITY ?auto_165928 ?auto_165938 ) ( not ( = ?auto_165928 ?auto_165937 ) ) ( OBJ-AT ?auto_165931 ?auto_165937 ) ( IN-CITY ?auto_165939 ?auto_165938 ) ( not ( = ?auto_165928 ?auto_165939 ) ) ( OBJ-AT ?auto_165930 ?auto_165939 ) ( IN-CITY ?auto_165935 ?auto_165938 ) ( not ( = ?auto_165928 ?auto_165935 ) ) ( OBJ-AT ?auto_165932 ?auto_165935 ) ( IN-CITY ?auto_165936 ?auto_165938 ) ( not ( = ?auto_165928 ?auto_165936 ) ) ( OBJ-AT ?auto_165933 ?auto_165936 ) ( OBJ-AT ?auto_165929 ?auto_165936 ) ( TRUCK-AT ?auto_165934 ?auto_165928 ) ( not ( = ?auto_165929 ?auto_165933 ) ) ( not ( = ?auto_165929 ?auto_165932 ) ) ( not ( = ?auto_165933 ?auto_165932 ) ) ( not ( = ?auto_165935 ?auto_165936 ) ) ( not ( = ?auto_165929 ?auto_165930 ) ) ( not ( = ?auto_165933 ?auto_165930 ) ) ( not ( = ?auto_165932 ?auto_165930 ) ) ( not ( = ?auto_165939 ?auto_165935 ) ) ( not ( = ?auto_165939 ?auto_165936 ) ) ( not ( = ?auto_165929 ?auto_165931 ) ) ( not ( = ?auto_165933 ?auto_165931 ) ) ( not ( = ?auto_165932 ?auto_165931 ) ) ( not ( = ?auto_165930 ?auto_165931 ) ) ( not ( = ?auto_165937 ?auto_165939 ) ) ( not ( = ?auto_165937 ?auto_165935 ) ) ( not ( = ?auto_165937 ?auto_165936 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_165929 ?auto_165933 ?auto_165932 ?auto_165931 ?auto_165930 ?auto_165928 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_166639 - OBJ
      ?auto_166640 - OBJ
      ?auto_166641 - OBJ
      ?auto_166642 - OBJ
      ?auto_166643 - OBJ
      ?auto_166638 - LOCATION
    )
    :vars
    (
      ?auto_166647 - LOCATION
      ?auto_166648 - CITY
      ?auto_166649 - LOCATION
      ?auto_166645 - LOCATION
      ?auto_166646 - LOCATION
      ?auto_166644 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_166647 ?auto_166648 ) ( IN-CITY ?auto_166638 ?auto_166648 ) ( not ( = ?auto_166638 ?auto_166647 ) ) ( OBJ-AT ?auto_166640 ?auto_166647 ) ( IN-CITY ?auto_166649 ?auto_166648 ) ( not ( = ?auto_166638 ?auto_166649 ) ) ( OBJ-AT ?auto_166643 ?auto_166649 ) ( IN-CITY ?auto_166645 ?auto_166648 ) ( not ( = ?auto_166638 ?auto_166645 ) ) ( OBJ-AT ?auto_166642 ?auto_166645 ) ( IN-CITY ?auto_166646 ?auto_166648 ) ( not ( = ?auto_166638 ?auto_166646 ) ) ( OBJ-AT ?auto_166641 ?auto_166646 ) ( OBJ-AT ?auto_166639 ?auto_166646 ) ( TRUCK-AT ?auto_166644 ?auto_166638 ) ( not ( = ?auto_166639 ?auto_166641 ) ) ( not ( = ?auto_166639 ?auto_166642 ) ) ( not ( = ?auto_166641 ?auto_166642 ) ) ( not ( = ?auto_166645 ?auto_166646 ) ) ( not ( = ?auto_166639 ?auto_166643 ) ) ( not ( = ?auto_166641 ?auto_166643 ) ) ( not ( = ?auto_166642 ?auto_166643 ) ) ( not ( = ?auto_166649 ?auto_166645 ) ) ( not ( = ?auto_166649 ?auto_166646 ) ) ( not ( = ?auto_166639 ?auto_166640 ) ) ( not ( = ?auto_166641 ?auto_166640 ) ) ( not ( = ?auto_166642 ?auto_166640 ) ) ( not ( = ?auto_166643 ?auto_166640 ) ) ( not ( = ?auto_166647 ?auto_166649 ) ) ( not ( = ?auto_166647 ?auto_166645 ) ) ( not ( = ?auto_166647 ?auto_166646 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_166639 ?auto_166641 ?auto_166642 ?auto_166640 ?auto_166643 ?auto_166638 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_166690 - OBJ
      ?auto_166691 - OBJ
      ?auto_166692 - OBJ
      ?auto_166693 - OBJ
      ?auto_166694 - OBJ
      ?auto_166689 - LOCATION
    )
    :vars
    (
      ?auto_166698 - LOCATION
      ?auto_166699 - CITY
      ?auto_166700 - LOCATION
      ?auto_166696 - LOCATION
      ?auto_166697 - LOCATION
      ?auto_166695 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_166698 ?auto_166699 ) ( IN-CITY ?auto_166689 ?auto_166699 ) ( not ( = ?auto_166689 ?auto_166698 ) ) ( OBJ-AT ?auto_166691 ?auto_166698 ) ( IN-CITY ?auto_166700 ?auto_166699 ) ( not ( = ?auto_166689 ?auto_166700 ) ) ( OBJ-AT ?auto_166693 ?auto_166700 ) ( IN-CITY ?auto_166696 ?auto_166699 ) ( not ( = ?auto_166689 ?auto_166696 ) ) ( OBJ-AT ?auto_166694 ?auto_166696 ) ( IN-CITY ?auto_166697 ?auto_166699 ) ( not ( = ?auto_166689 ?auto_166697 ) ) ( OBJ-AT ?auto_166692 ?auto_166697 ) ( OBJ-AT ?auto_166690 ?auto_166697 ) ( TRUCK-AT ?auto_166695 ?auto_166689 ) ( not ( = ?auto_166690 ?auto_166692 ) ) ( not ( = ?auto_166690 ?auto_166694 ) ) ( not ( = ?auto_166692 ?auto_166694 ) ) ( not ( = ?auto_166696 ?auto_166697 ) ) ( not ( = ?auto_166690 ?auto_166693 ) ) ( not ( = ?auto_166692 ?auto_166693 ) ) ( not ( = ?auto_166694 ?auto_166693 ) ) ( not ( = ?auto_166700 ?auto_166696 ) ) ( not ( = ?auto_166700 ?auto_166697 ) ) ( not ( = ?auto_166690 ?auto_166691 ) ) ( not ( = ?auto_166692 ?auto_166691 ) ) ( not ( = ?auto_166694 ?auto_166691 ) ) ( not ( = ?auto_166693 ?auto_166691 ) ) ( not ( = ?auto_166698 ?auto_166700 ) ) ( not ( = ?auto_166698 ?auto_166696 ) ) ( not ( = ?auto_166698 ?auto_166697 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_166690 ?auto_166692 ?auto_166694 ?auto_166691 ?auto_166693 ?auto_166689 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_166903 - OBJ
      ?auto_166904 - OBJ
      ?auto_166905 - OBJ
      ?auto_166906 - OBJ
      ?auto_166907 - OBJ
      ?auto_166902 - LOCATION
    )
    :vars
    (
      ?auto_166911 - LOCATION
      ?auto_166912 - CITY
      ?auto_166913 - LOCATION
      ?auto_166909 - LOCATION
      ?auto_166910 - LOCATION
      ?auto_166908 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_166911 ?auto_166912 ) ( IN-CITY ?auto_166902 ?auto_166912 ) ( not ( = ?auto_166902 ?auto_166911 ) ) ( OBJ-AT ?auto_166904 ?auto_166911 ) ( IN-CITY ?auto_166913 ?auto_166912 ) ( not ( = ?auto_166902 ?auto_166913 ) ) ( OBJ-AT ?auto_166907 ?auto_166913 ) ( IN-CITY ?auto_166909 ?auto_166912 ) ( not ( = ?auto_166902 ?auto_166909 ) ) ( OBJ-AT ?auto_166905 ?auto_166909 ) ( IN-CITY ?auto_166910 ?auto_166912 ) ( not ( = ?auto_166902 ?auto_166910 ) ) ( OBJ-AT ?auto_166906 ?auto_166910 ) ( OBJ-AT ?auto_166903 ?auto_166910 ) ( TRUCK-AT ?auto_166908 ?auto_166902 ) ( not ( = ?auto_166903 ?auto_166906 ) ) ( not ( = ?auto_166903 ?auto_166905 ) ) ( not ( = ?auto_166906 ?auto_166905 ) ) ( not ( = ?auto_166909 ?auto_166910 ) ) ( not ( = ?auto_166903 ?auto_166907 ) ) ( not ( = ?auto_166906 ?auto_166907 ) ) ( not ( = ?auto_166905 ?auto_166907 ) ) ( not ( = ?auto_166913 ?auto_166909 ) ) ( not ( = ?auto_166913 ?auto_166910 ) ) ( not ( = ?auto_166903 ?auto_166904 ) ) ( not ( = ?auto_166906 ?auto_166904 ) ) ( not ( = ?auto_166905 ?auto_166904 ) ) ( not ( = ?auto_166907 ?auto_166904 ) ) ( not ( = ?auto_166911 ?auto_166913 ) ) ( not ( = ?auto_166911 ?auto_166909 ) ) ( not ( = ?auto_166911 ?auto_166910 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_166903 ?auto_166906 ?auto_166905 ?auto_166904 ?auto_166907 ?auto_166902 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167009 - OBJ
      ?auto_167010 - OBJ
      ?auto_167011 - OBJ
      ?auto_167012 - OBJ
      ?auto_167013 - OBJ
      ?auto_167008 - LOCATION
    )
    :vars
    (
      ?auto_167017 - LOCATION
      ?auto_167018 - CITY
      ?auto_167019 - LOCATION
      ?auto_167015 - LOCATION
      ?auto_167016 - LOCATION
      ?auto_167014 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167017 ?auto_167018 ) ( IN-CITY ?auto_167008 ?auto_167018 ) ( not ( = ?auto_167008 ?auto_167017 ) ) ( OBJ-AT ?auto_167010 ?auto_167017 ) ( IN-CITY ?auto_167019 ?auto_167018 ) ( not ( = ?auto_167008 ?auto_167019 ) ) ( OBJ-AT ?auto_167012 ?auto_167019 ) ( IN-CITY ?auto_167015 ?auto_167018 ) ( not ( = ?auto_167008 ?auto_167015 ) ) ( OBJ-AT ?auto_167011 ?auto_167015 ) ( IN-CITY ?auto_167016 ?auto_167018 ) ( not ( = ?auto_167008 ?auto_167016 ) ) ( OBJ-AT ?auto_167013 ?auto_167016 ) ( OBJ-AT ?auto_167009 ?auto_167016 ) ( TRUCK-AT ?auto_167014 ?auto_167008 ) ( not ( = ?auto_167009 ?auto_167013 ) ) ( not ( = ?auto_167009 ?auto_167011 ) ) ( not ( = ?auto_167013 ?auto_167011 ) ) ( not ( = ?auto_167015 ?auto_167016 ) ) ( not ( = ?auto_167009 ?auto_167012 ) ) ( not ( = ?auto_167013 ?auto_167012 ) ) ( not ( = ?auto_167011 ?auto_167012 ) ) ( not ( = ?auto_167019 ?auto_167015 ) ) ( not ( = ?auto_167019 ?auto_167016 ) ) ( not ( = ?auto_167009 ?auto_167010 ) ) ( not ( = ?auto_167013 ?auto_167010 ) ) ( not ( = ?auto_167011 ?auto_167010 ) ) ( not ( = ?auto_167012 ?auto_167010 ) ) ( not ( = ?auto_167017 ?auto_167019 ) ) ( not ( = ?auto_167017 ?auto_167015 ) ) ( not ( = ?auto_167017 ?auto_167016 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_167009 ?auto_167013 ?auto_167011 ?auto_167010 ?auto_167012 ?auto_167008 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167222 - OBJ
      ?auto_167223 - OBJ
      ?auto_167224 - OBJ
      ?auto_167225 - OBJ
      ?auto_167226 - OBJ
      ?auto_167221 - LOCATION
    )
    :vars
    (
      ?auto_167230 - LOCATION
      ?auto_167231 - CITY
      ?auto_167232 - LOCATION
      ?auto_167228 - LOCATION
      ?auto_167229 - LOCATION
      ?auto_167227 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167230 ?auto_167231 ) ( IN-CITY ?auto_167221 ?auto_167231 ) ( not ( = ?auto_167221 ?auto_167230 ) ) ( OBJ-AT ?auto_167223 ?auto_167230 ) ( IN-CITY ?auto_167232 ?auto_167231 ) ( not ( = ?auto_167221 ?auto_167232 ) ) ( OBJ-AT ?auto_167224 ?auto_167232 ) ( IN-CITY ?auto_167228 ?auto_167231 ) ( not ( = ?auto_167221 ?auto_167228 ) ) ( OBJ-AT ?auto_167226 ?auto_167228 ) ( IN-CITY ?auto_167229 ?auto_167231 ) ( not ( = ?auto_167221 ?auto_167229 ) ) ( OBJ-AT ?auto_167225 ?auto_167229 ) ( OBJ-AT ?auto_167222 ?auto_167229 ) ( TRUCK-AT ?auto_167227 ?auto_167221 ) ( not ( = ?auto_167222 ?auto_167225 ) ) ( not ( = ?auto_167222 ?auto_167226 ) ) ( not ( = ?auto_167225 ?auto_167226 ) ) ( not ( = ?auto_167228 ?auto_167229 ) ) ( not ( = ?auto_167222 ?auto_167224 ) ) ( not ( = ?auto_167225 ?auto_167224 ) ) ( not ( = ?auto_167226 ?auto_167224 ) ) ( not ( = ?auto_167232 ?auto_167228 ) ) ( not ( = ?auto_167232 ?auto_167229 ) ) ( not ( = ?auto_167222 ?auto_167223 ) ) ( not ( = ?auto_167225 ?auto_167223 ) ) ( not ( = ?auto_167226 ?auto_167223 ) ) ( not ( = ?auto_167224 ?auto_167223 ) ) ( not ( = ?auto_167230 ?auto_167232 ) ) ( not ( = ?auto_167230 ?auto_167228 ) ) ( not ( = ?auto_167230 ?auto_167229 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_167222 ?auto_167225 ?auto_167226 ?auto_167223 ?auto_167224 ?auto_167221 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_167273 - OBJ
      ?auto_167274 - OBJ
      ?auto_167275 - OBJ
      ?auto_167276 - OBJ
      ?auto_167277 - OBJ
      ?auto_167272 - LOCATION
    )
    :vars
    (
      ?auto_167281 - LOCATION
      ?auto_167282 - CITY
      ?auto_167283 - LOCATION
      ?auto_167279 - LOCATION
      ?auto_167280 - LOCATION
      ?auto_167278 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_167281 ?auto_167282 ) ( IN-CITY ?auto_167272 ?auto_167282 ) ( not ( = ?auto_167272 ?auto_167281 ) ) ( OBJ-AT ?auto_167274 ?auto_167281 ) ( IN-CITY ?auto_167283 ?auto_167282 ) ( not ( = ?auto_167272 ?auto_167283 ) ) ( OBJ-AT ?auto_167275 ?auto_167283 ) ( IN-CITY ?auto_167279 ?auto_167282 ) ( not ( = ?auto_167272 ?auto_167279 ) ) ( OBJ-AT ?auto_167276 ?auto_167279 ) ( IN-CITY ?auto_167280 ?auto_167282 ) ( not ( = ?auto_167272 ?auto_167280 ) ) ( OBJ-AT ?auto_167277 ?auto_167280 ) ( OBJ-AT ?auto_167273 ?auto_167280 ) ( TRUCK-AT ?auto_167278 ?auto_167272 ) ( not ( = ?auto_167273 ?auto_167277 ) ) ( not ( = ?auto_167273 ?auto_167276 ) ) ( not ( = ?auto_167277 ?auto_167276 ) ) ( not ( = ?auto_167279 ?auto_167280 ) ) ( not ( = ?auto_167273 ?auto_167275 ) ) ( not ( = ?auto_167277 ?auto_167275 ) ) ( not ( = ?auto_167276 ?auto_167275 ) ) ( not ( = ?auto_167283 ?auto_167279 ) ) ( not ( = ?auto_167283 ?auto_167280 ) ) ( not ( = ?auto_167273 ?auto_167274 ) ) ( not ( = ?auto_167277 ?auto_167274 ) ) ( not ( = ?auto_167276 ?auto_167274 ) ) ( not ( = ?auto_167275 ?auto_167274 ) ) ( not ( = ?auto_167281 ?auto_167283 ) ) ( not ( = ?auto_167281 ?auto_167279 ) ) ( not ( = ?auto_167281 ?auto_167280 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_167273 ?auto_167277 ?auto_167276 ?auto_167274 ?auto_167275 ?auto_167272 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168091 - OBJ
      ?auto_168092 - OBJ
      ?auto_168093 - OBJ
      ?auto_168094 - OBJ
      ?auto_168095 - OBJ
      ?auto_168090 - LOCATION
    )
    :vars
    (
      ?auto_168099 - LOCATION
      ?auto_168100 - CITY
      ?auto_168101 - LOCATION
      ?auto_168097 - LOCATION
      ?auto_168098 - LOCATION
      ?auto_168096 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168099 ?auto_168100 ) ( IN-CITY ?auto_168090 ?auto_168100 ) ( not ( = ?auto_168090 ?auto_168099 ) ) ( OBJ-AT ?auto_168095 ?auto_168099 ) ( IN-CITY ?auto_168101 ?auto_168100 ) ( not ( = ?auto_168090 ?auto_168101 ) ) ( OBJ-AT ?auto_168094 ?auto_168101 ) ( IN-CITY ?auto_168097 ?auto_168100 ) ( not ( = ?auto_168090 ?auto_168097 ) ) ( OBJ-AT ?auto_168093 ?auto_168097 ) ( IN-CITY ?auto_168098 ?auto_168100 ) ( not ( = ?auto_168090 ?auto_168098 ) ) ( OBJ-AT ?auto_168091 ?auto_168098 ) ( OBJ-AT ?auto_168092 ?auto_168098 ) ( TRUCK-AT ?auto_168096 ?auto_168090 ) ( not ( = ?auto_168092 ?auto_168091 ) ) ( not ( = ?auto_168092 ?auto_168093 ) ) ( not ( = ?auto_168091 ?auto_168093 ) ) ( not ( = ?auto_168097 ?auto_168098 ) ) ( not ( = ?auto_168092 ?auto_168094 ) ) ( not ( = ?auto_168091 ?auto_168094 ) ) ( not ( = ?auto_168093 ?auto_168094 ) ) ( not ( = ?auto_168101 ?auto_168097 ) ) ( not ( = ?auto_168101 ?auto_168098 ) ) ( not ( = ?auto_168092 ?auto_168095 ) ) ( not ( = ?auto_168091 ?auto_168095 ) ) ( not ( = ?auto_168093 ?auto_168095 ) ) ( not ( = ?auto_168094 ?auto_168095 ) ) ( not ( = ?auto_168099 ?auto_168101 ) ) ( not ( = ?auto_168099 ?auto_168097 ) ) ( not ( = ?auto_168099 ?auto_168098 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168092 ?auto_168091 ?auto_168093 ?auto_168095 ?auto_168094 ?auto_168090 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168142 - OBJ
      ?auto_168143 - OBJ
      ?auto_168144 - OBJ
      ?auto_168145 - OBJ
      ?auto_168146 - OBJ
      ?auto_168141 - LOCATION
    )
    :vars
    (
      ?auto_168150 - LOCATION
      ?auto_168151 - CITY
      ?auto_168152 - LOCATION
      ?auto_168148 - LOCATION
      ?auto_168149 - LOCATION
      ?auto_168147 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168150 ?auto_168151 ) ( IN-CITY ?auto_168141 ?auto_168151 ) ( not ( = ?auto_168141 ?auto_168150 ) ) ( OBJ-AT ?auto_168145 ?auto_168150 ) ( IN-CITY ?auto_168152 ?auto_168151 ) ( not ( = ?auto_168141 ?auto_168152 ) ) ( OBJ-AT ?auto_168146 ?auto_168152 ) ( IN-CITY ?auto_168148 ?auto_168151 ) ( not ( = ?auto_168141 ?auto_168148 ) ) ( OBJ-AT ?auto_168144 ?auto_168148 ) ( IN-CITY ?auto_168149 ?auto_168151 ) ( not ( = ?auto_168141 ?auto_168149 ) ) ( OBJ-AT ?auto_168142 ?auto_168149 ) ( OBJ-AT ?auto_168143 ?auto_168149 ) ( TRUCK-AT ?auto_168147 ?auto_168141 ) ( not ( = ?auto_168143 ?auto_168142 ) ) ( not ( = ?auto_168143 ?auto_168144 ) ) ( not ( = ?auto_168142 ?auto_168144 ) ) ( not ( = ?auto_168148 ?auto_168149 ) ) ( not ( = ?auto_168143 ?auto_168146 ) ) ( not ( = ?auto_168142 ?auto_168146 ) ) ( not ( = ?auto_168144 ?auto_168146 ) ) ( not ( = ?auto_168152 ?auto_168148 ) ) ( not ( = ?auto_168152 ?auto_168149 ) ) ( not ( = ?auto_168143 ?auto_168145 ) ) ( not ( = ?auto_168142 ?auto_168145 ) ) ( not ( = ?auto_168144 ?auto_168145 ) ) ( not ( = ?auto_168146 ?auto_168145 ) ) ( not ( = ?auto_168150 ?auto_168152 ) ) ( not ( = ?auto_168150 ?auto_168148 ) ) ( not ( = ?auto_168150 ?auto_168149 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168143 ?auto_168142 ?auto_168144 ?auto_168145 ?auto_168146 ?auto_168141 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168193 - OBJ
      ?auto_168194 - OBJ
      ?auto_168195 - OBJ
      ?auto_168196 - OBJ
      ?auto_168197 - OBJ
      ?auto_168192 - LOCATION
    )
    :vars
    (
      ?auto_168201 - LOCATION
      ?auto_168202 - CITY
      ?auto_168203 - LOCATION
      ?auto_168199 - LOCATION
      ?auto_168200 - LOCATION
      ?auto_168198 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168201 ?auto_168202 ) ( IN-CITY ?auto_168192 ?auto_168202 ) ( not ( = ?auto_168192 ?auto_168201 ) ) ( OBJ-AT ?auto_168197 ?auto_168201 ) ( IN-CITY ?auto_168203 ?auto_168202 ) ( not ( = ?auto_168192 ?auto_168203 ) ) ( OBJ-AT ?auto_168195 ?auto_168203 ) ( IN-CITY ?auto_168199 ?auto_168202 ) ( not ( = ?auto_168192 ?auto_168199 ) ) ( OBJ-AT ?auto_168196 ?auto_168199 ) ( IN-CITY ?auto_168200 ?auto_168202 ) ( not ( = ?auto_168192 ?auto_168200 ) ) ( OBJ-AT ?auto_168193 ?auto_168200 ) ( OBJ-AT ?auto_168194 ?auto_168200 ) ( TRUCK-AT ?auto_168198 ?auto_168192 ) ( not ( = ?auto_168194 ?auto_168193 ) ) ( not ( = ?auto_168194 ?auto_168196 ) ) ( not ( = ?auto_168193 ?auto_168196 ) ) ( not ( = ?auto_168199 ?auto_168200 ) ) ( not ( = ?auto_168194 ?auto_168195 ) ) ( not ( = ?auto_168193 ?auto_168195 ) ) ( not ( = ?auto_168196 ?auto_168195 ) ) ( not ( = ?auto_168203 ?auto_168199 ) ) ( not ( = ?auto_168203 ?auto_168200 ) ) ( not ( = ?auto_168194 ?auto_168197 ) ) ( not ( = ?auto_168193 ?auto_168197 ) ) ( not ( = ?auto_168196 ?auto_168197 ) ) ( not ( = ?auto_168195 ?auto_168197 ) ) ( not ( = ?auto_168201 ?auto_168203 ) ) ( not ( = ?auto_168201 ?auto_168199 ) ) ( not ( = ?auto_168201 ?auto_168200 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168194 ?auto_168193 ?auto_168196 ?auto_168197 ?auto_168195 ?auto_168192 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168244 - OBJ
      ?auto_168245 - OBJ
      ?auto_168246 - OBJ
      ?auto_168247 - OBJ
      ?auto_168248 - OBJ
      ?auto_168243 - LOCATION
    )
    :vars
    (
      ?auto_168252 - LOCATION
      ?auto_168253 - CITY
      ?auto_168254 - LOCATION
      ?auto_168250 - LOCATION
      ?auto_168251 - LOCATION
      ?auto_168249 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168252 ?auto_168253 ) ( IN-CITY ?auto_168243 ?auto_168253 ) ( not ( = ?auto_168243 ?auto_168252 ) ) ( OBJ-AT ?auto_168247 ?auto_168252 ) ( IN-CITY ?auto_168254 ?auto_168253 ) ( not ( = ?auto_168243 ?auto_168254 ) ) ( OBJ-AT ?auto_168246 ?auto_168254 ) ( IN-CITY ?auto_168250 ?auto_168253 ) ( not ( = ?auto_168243 ?auto_168250 ) ) ( OBJ-AT ?auto_168248 ?auto_168250 ) ( IN-CITY ?auto_168251 ?auto_168253 ) ( not ( = ?auto_168243 ?auto_168251 ) ) ( OBJ-AT ?auto_168244 ?auto_168251 ) ( OBJ-AT ?auto_168245 ?auto_168251 ) ( TRUCK-AT ?auto_168249 ?auto_168243 ) ( not ( = ?auto_168245 ?auto_168244 ) ) ( not ( = ?auto_168245 ?auto_168248 ) ) ( not ( = ?auto_168244 ?auto_168248 ) ) ( not ( = ?auto_168250 ?auto_168251 ) ) ( not ( = ?auto_168245 ?auto_168246 ) ) ( not ( = ?auto_168244 ?auto_168246 ) ) ( not ( = ?auto_168248 ?auto_168246 ) ) ( not ( = ?auto_168254 ?auto_168250 ) ) ( not ( = ?auto_168254 ?auto_168251 ) ) ( not ( = ?auto_168245 ?auto_168247 ) ) ( not ( = ?auto_168244 ?auto_168247 ) ) ( not ( = ?auto_168248 ?auto_168247 ) ) ( not ( = ?auto_168246 ?auto_168247 ) ) ( not ( = ?auto_168252 ?auto_168254 ) ) ( not ( = ?auto_168252 ?auto_168250 ) ) ( not ( = ?auto_168252 ?auto_168251 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168245 ?auto_168244 ?auto_168248 ?auto_168247 ?auto_168246 ?auto_168243 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168457 - OBJ
      ?auto_168458 - OBJ
      ?auto_168459 - OBJ
      ?auto_168460 - OBJ
      ?auto_168461 - OBJ
      ?auto_168456 - LOCATION
    )
    :vars
    (
      ?auto_168465 - LOCATION
      ?auto_168466 - CITY
      ?auto_168467 - LOCATION
      ?auto_168463 - LOCATION
      ?auto_168464 - LOCATION
      ?auto_168462 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168465 ?auto_168466 ) ( IN-CITY ?auto_168456 ?auto_168466 ) ( not ( = ?auto_168456 ?auto_168465 ) ) ( OBJ-AT ?auto_168459 ?auto_168465 ) ( IN-CITY ?auto_168467 ?auto_168466 ) ( not ( = ?auto_168456 ?auto_168467 ) ) ( OBJ-AT ?auto_168461 ?auto_168467 ) ( IN-CITY ?auto_168463 ?auto_168466 ) ( not ( = ?auto_168456 ?auto_168463 ) ) ( OBJ-AT ?auto_168460 ?auto_168463 ) ( IN-CITY ?auto_168464 ?auto_168466 ) ( not ( = ?auto_168456 ?auto_168464 ) ) ( OBJ-AT ?auto_168457 ?auto_168464 ) ( OBJ-AT ?auto_168458 ?auto_168464 ) ( TRUCK-AT ?auto_168462 ?auto_168456 ) ( not ( = ?auto_168458 ?auto_168457 ) ) ( not ( = ?auto_168458 ?auto_168460 ) ) ( not ( = ?auto_168457 ?auto_168460 ) ) ( not ( = ?auto_168463 ?auto_168464 ) ) ( not ( = ?auto_168458 ?auto_168461 ) ) ( not ( = ?auto_168457 ?auto_168461 ) ) ( not ( = ?auto_168460 ?auto_168461 ) ) ( not ( = ?auto_168467 ?auto_168463 ) ) ( not ( = ?auto_168467 ?auto_168464 ) ) ( not ( = ?auto_168458 ?auto_168459 ) ) ( not ( = ?auto_168457 ?auto_168459 ) ) ( not ( = ?auto_168460 ?auto_168459 ) ) ( not ( = ?auto_168461 ?auto_168459 ) ) ( not ( = ?auto_168465 ?auto_168467 ) ) ( not ( = ?auto_168465 ?auto_168463 ) ) ( not ( = ?auto_168465 ?auto_168464 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168458 ?auto_168457 ?auto_168460 ?auto_168459 ?auto_168461 ?auto_168456 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_168508 - OBJ
      ?auto_168509 - OBJ
      ?auto_168510 - OBJ
      ?auto_168511 - OBJ
      ?auto_168512 - OBJ
      ?auto_168507 - LOCATION
    )
    :vars
    (
      ?auto_168516 - LOCATION
      ?auto_168517 - CITY
      ?auto_168518 - LOCATION
      ?auto_168514 - LOCATION
      ?auto_168515 - LOCATION
      ?auto_168513 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_168516 ?auto_168517 ) ( IN-CITY ?auto_168507 ?auto_168517 ) ( not ( = ?auto_168507 ?auto_168516 ) ) ( OBJ-AT ?auto_168510 ?auto_168516 ) ( IN-CITY ?auto_168518 ?auto_168517 ) ( not ( = ?auto_168507 ?auto_168518 ) ) ( OBJ-AT ?auto_168511 ?auto_168518 ) ( IN-CITY ?auto_168514 ?auto_168517 ) ( not ( = ?auto_168507 ?auto_168514 ) ) ( OBJ-AT ?auto_168512 ?auto_168514 ) ( IN-CITY ?auto_168515 ?auto_168517 ) ( not ( = ?auto_168507 ?auto_168515 ) ) ( OBJ-AT ?auto_168508 ?auto_168515 ) ( OBJ-AT ?auto_168509 ?auto_168515 ) ( TRUCK-AT ?auto_168513 ?auto_168507 ) ( not ( = ?auto_168509 ?auto_168508 ) ) ( not ( = ?auto_168509 ?auto_168512 ) ) ( not ( = ?auto_168508 ?auto_168512 ) ) ( not ( = ?auto_168514 ?auto_168515 ) ) ( not ( = ?auto_168509 ?auto_168511 ) ) ( not ( = ?auto_168508 ?auto_168511 ) ) ( not ( = ?auto_168512 ?auto_168511 ) ) ( not ( = ?auto_168518 ?auto_168514 ) ) ( not ( = ?auto_168518 ?auto_168515 ) ) ( not ( = ?auto_168509 ?auto_168510 ) ) ( not ( = ?auto_168508 ?auto_168510 ) ) ( not ( = ?auto_168512 ?auto_168510 ) ) ( not ( = ?auto_168511 ?auto_168510 ) ) ( not ( = ?auto_168516 ?auto_168518 ) ) ( not ( = ?auto_168516 ?auto_168514 ) ) ( not ( = ?auto_168516 ?auto_168515 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_168509 ?auto_168508 ?auto_168512 ?auto_168510 ?auto_168511 ?auto_168507 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_169496 - OBJ
      ?auto_169497 - OBJ
      ?auto_169498 - OBJ
      ?auto_169499 - OBJ
      ?auto_169500 - OBJ
      ?auto_169495 - LOCATION
    )
    :vars
    (
      ?auto_169504 - LOCATION
      ?auto_169505 - CITY
      ?auto_169506 - LOCATION
      ?auto_169502 - LOCATION
      ?auto_169503 - LOCATION
      ?auto_169501 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_169504 ?auto_169505 ) ( IN-CITY ?auto_169495 ?auto_169505 ) ( not ( = ?auto_169495 ?auto_169504 ) ) ( OBJ-AT ?auto_169500 ?auto_169504 ) ( IN-CITY ?auto_169506 ?auto_169505 ) ( not ( = ?auto_169495 ?auto_169506 ) ) ( OBJ-AT ?auto_169499 ?auto_169506 ) ( IN-CITY ?auto_169502 ?auto_169505 ) ( not ( = ?auto_169495 ?auto_169502 ) ) ( OBJ-AT ?auto_169497 ?auto_169502 ) ( IN-CITY ?auto_169503 ?auto_169505 ) ( not ( = ?auto_169495 ?auto_169503 ) ) ( OBJ-AT ?auto_169496 ?auto_169503 ) ( OBJ-AT ?auto_169498 ?auto_169503 ) ( TRUCK-AT ?auto_169501 ?auto_169495 ) ( not ( = ?auto_169498 ?auto_169496 ) ) ( not ( = ?auto_169498 ?auto_169497 ) ) ( not ( = ?auto_169496 ?auto_169497 ) ) ( not ( = ?auto_169502 ?auto_169503 ) ) ( not ( = ?auto_169498 ?auto_169499 ) ) ( not ( = ?auto_169496 ?auto_169499 ) ) ( not ( = ?auto_169497 ?auto_169499 ) ) ( not ( = ?auto_169506 ?auto_169502 ) ) ( not ( = ?auto_169506 ?auto_169503 ) ) ( not ( = ?auto_169498 ?auto_169500 ) ) ( not ( = ?auto_169496 ?auto_169500 ) ) ( not ( = ?auto_169497 ?auto_169500 ) ) ( not ( = ?auto_169499 ?auto_169500 ) ) ( not ( = ?auto_169504 ?auto_169506 ) ) ( not ( = ?auto_169504 ?auto_169502 ) ) ( not ( = ?auto_169504 ?auto_169503 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_169498 ?auto_169496 ?auto_169497 ?auto_169500 ?auto_169499 ?auto_169495 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_169547 - OBJ
      ?auto_169548 - OBJ
      ?auto_169549 - OBJ
      ?auto_169550 - OBJ
      ?auto_169551 - OBJ
      ?auto_169546 - LOCATION
    )
    :vars
    (
      ?auto_169555 - LOCATION
      ?auto_169556 - CITY
      ?auto_169557 - LOCATION
      ?auto_169553 - LOCATION
      ?auto_169554 - LOCATION
      ?auto_169552 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_169555 ?auto_169556 ) ( IN-CITY ?auto_169546 ?auto_169556 ) ( not ( = ?auto_169546 ?auto_169555 ) ) ( OBJ-AT ?auto_169550 ?auto_169555 ) ( IN-CITY ?auto_169557 ?auto_169556 ) ( not ( = ?auto_169546 ?auto_169557 ) ) ( OBJ-AT ?auto_169551 ?auto_169557 ) ( IN-CITY ?auto_169553 ?auto_169556 ) ( not ( = ?auto_169546 ?auto_169553 ) ) ( OBJ-AT ?auto_169548 ?auto_169553 ) ( IN-CITY ?auto_169554 ?auto_169556 ) ( not ( = ?auto_169546 ?auto_169554 ) ) ( OBJ-AT ?auto_169547 ?auto_169554 ) ( OBJ-AT ?auto_169549 ?auto_169554 ) ( TRUCK-AT ?auto_169552 ?auto_169546 ) ( not ( = ?auto_169549 ?auto_169547 ) ) ( not ( = ?auto_169549 ?auto_169548 ) ) ( not ( = ?auto_169547 ?auto_169548 ) ) ( not ( = ?auto_169553 ?auto_169554 ) ) ( not ( = ?auto_169549 ?auto_169551 ) ) ( not ( = ?auto_169547 ?auto_169551 ) ) ( not ( = ?auto_169548 ?auto_169551 ) ) ( not ( = ?auto_169557 ?auto_169553 ) ) ( not ( = ?auto_169557 ?auto_169554 ) ) ( not ( = ?auto_169549 ?auto_169550 ) ) ( not ( = ?auto_169547 ?auto_169550 ) ) ( not ( = ?auto_169548 ?auto_169550 ) ) ( not ( = ?auto_169551 ?auto_169550 ) ) ( not ( = ?auto_169555 ?auto_169557 ) ) ( not ( = ?auto_169555 ?auto_169553 ) ) ( not ( = ?auto_169555 ?auto_169554 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_169549 ?auto_169547 ?auto_169548 ?auto_169550 ?auto_169551 ?auto_169546 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_169816 - OBJ
      ?auto_169817 - OBJ
      ?auto_169818 - OBJ
      ?auto_169819 - OBJ
      ?auto_169820 - OBJ
      ?auto_169815 - LOCATION
    )
    :vars
    (
      ?auto_169824 - LOCATION
      ?auto_169825 - CITY
      ?auto_169826 - LOCATION
      ?auto_169822 - LOCATION
      ?auto_169823 - LOCATION
      ?auto_169821 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_169824 ?auto_169825 ) ( IN-CITY ?auto_169815 ?auto_169825 ) ( not ( = ?auto_169815 ?auto_169824 ) ) ( OBJ-AT ?auto_169820 ?auto_169824 ) ( IN-CITY ?auto_169826 ?auto_169825 ) ( not ( = ?auto_169815 ?auto_169826 ) ) ( OBJ-AT ?auto_169818 ?auto_169826 ) ( IN-CITY ?auto_169822 ?auto_169825 ) ( not ( = ?auto_169815 ?auto_169822 ) ) ( OBJ-AT ?auto_169817 ?auto_169822 ) ( IN-CITY ?auto_169823 ?auto_169825 ) ( not ( = ?auto_169815 ?auto_169823 ) ) ( OBJ-AT ?auto_169816 ?auto_169823 ) ( OBJ-AT ?auto_169819 ?auto_169823 ) ( TRUCK-AT ?auto_169821 ?auto_169815 ) ( not ( = ?auto_169819 ?auto_169816 ) ) ( not ( = ?auto_169819 ?auto_169817 ) ) ( not ( = ?auto_169816 ?auto_169817 ) ) ( not ( = ?auto_169822 ?auto_169823 ) ) ( not ( = ?auto_169819 ?auto_169818 ) ) ( not ( = ?auto_169816 ?auto_169818 ) ) ( not ( = ?auto_169817 ?auto_169818 ) ) ( not ( = ?auto_169826 ?auto_169822 ) ) ( not ( = ?auto_169826 ?auto_169823 ) ) ( not ( = ?auto_169819 ?auto_169820 ) ) ( not ( = ?auto_169816 ?auto_169820 ) ) ( not ( = ?auto_169817 ?auto_169820 ) ) ( not ( = ?auto_169818 ?auto_169820 ) ) ( not ( = ?auto_169824 ?auto_169826 ) ) ( not ( = ?auto_169824 ?auto_169822 ) ) ( not ( = ?auto_169824 ?auto_169823 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_169819 ?auto_169816 ?auto_169817 ?auto_169820 ?auto_169818 ?auto_169815 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_169867 - OBJ
      ?auto_169868 - OBJ
      ?auto_169869 - OBJ
      ?auto_169870 - OBJ
      ?auto_169871 - OBJ
      ?auto_169866 - LOCATION
    )
    :vars
    (
      ?auto_169875 - LOCATION
      ?auto_169876 - CITY
      ?auto_169877 - LOCATION
      ?auto_169873 - LOCATION
      ?auto_169874 - LOCATION
      ?auto_169872 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_169875 ?auto_169876 ) ( IN-CITY ?auto_169866 ?auto_169876 ) ( not ( = ?auto_169866 ?auto_169875 ) ) ( OBJ-AT ?auto_169870 ?auto_169875 ) ( IN-CITY ?auto_169877 ?auto_169876 ) ( not ( = ?auto_169866 ?auto_169877 ) ) ( OBJ-AT ?auto_169869 ?auto_169877 ) ( IN-CITY ?auto_169873 ?auto_169876 ) ( not ( = ?auto_169866 ?auto_169873 ) ) ( OBJ-AT ?auto_169868 ?auto_169873 ) ( IN-CITY ?auto_169874 ?auto_169876 ) ( not ( = ?auto_169866 ?auto_169874 ) ) ( OBJ-AT ?auto_169867 ?auto_169874 ) ( OBJ-AT ?auto_169871 ?auto_169874 ) ( TRUCK-AT ?auto_169872 ?auto_169866 ) ( not ( = ?auto_169871 ?auto_169867 ) ) ( not ( = ?auto_169871 ?auto_169868 ) ) ( not ( = ?auto_169867 ?auto_169868 ) ) ( not ( = ?auto_169873 ?auto_169874 ) ) ( not ( = ?auto_169871 ?auto_169869 ) ) ( not ( = ?auto_169867 ?auto_169869 ) ) ( not ( = ?auto_169868 ?auto_169869 ) ) ( not ( = ?auto_169877 ?auto_169873 ) ) ( not ( = ?auto_169877 ?auto_169874 ) ) ( not ( = ?auto_169871 ?auto_169870 ) ) ( not ( = ?auto_169867 ?auto_169870 ) ) ( not ( = ?auto_169868 ?auto_169870 ) ) ( not ( = ?auto_169869 ?auto_169870 ) ) ( not ( = ?auto_169875 ?auto_169877 ) ) ( not ( = ?auto_169875 ?auto_169873 ) ) ( not ( = ?auto_169875 ?auto_169874 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_169871 ?auto_169867 ?auto_169868 ?auto_169870 ?auto_169869 ?auto_169866 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_169970 - OBJ
      ?auto_169971 - OBJ
      ?auto_169972 - OBJ
      ?auto_169973 - OBJ
      ?auto_169974 - OBJ
      ?auto_169969 - LOCATION
    )
    :vars
    (
      ?auto_169978 - LOCATION
      ?auto_169979 - CITY
      ?auto_169980 - LOCATION
      ?auto_169976 - LOCATION
      ?auto_169977 - LOCATION
      ?auto_169975 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_169978 ?auto_169979 ) ( IN-CITY ?auto_169969 ?auto_169979 ) ( not ( = ?auto_169969 ?auto_169978 ) ) ( OBJ-AT ?auto_169972 ?auto_169978 ) ( IN-CITY ?auto_169980 ?auto_169979 ) ( not ( = ?auto_169969 ?auto_169980 ) ) ( OBJ-AT ?auto_169974 ?auto_169980 ) ( IN-CITY ?auto_169976 ?auto_169979 ) ( not ( = ?auto_169969 ?auto_169976 ) ) ( OBJ-AT ?auto_169971 ?auto_169976 ) ( IN-CITY ?auto_169977 ?auto_169979 ) ( not ( = ?auto_169969 ?auto_169977 ) ) ( OBJ-AT ?auto_169970 ?auto_169977 ) ( OBJ-AT ?auto_169973 ?auto_169977 ) ( TRUCK-AT ?auto_169975 ?auto_169969 ) ( not ( = ?auto_169973 ?auto_169970 ) ) ( not ( = ?auto_169973 ?auto_169971 ) ) ( not ( = ?auto_169970 ?auto_169971 ) ) ( not ( = ?auto_169976 ?auto_169977 ) ) ( not ( = ?auto_169973 ?auto_169974 ) ) ( not ( = ?auto_169970 ?auto_169974 ) ) ( not ( = ?auto_169971 ?auto_169974 ) ) ( not ( = ?auto_169980 ?auto_169976 ) ) ( not ( = ?auto_169980 ?auto_169977 ) ) ( not ( = ?auto_169973 ?auto_169972 ) ) ( not ( = ?auto_169970 ?auto_169972 ) ) ( not ( = ?auto_169971 ?auto_169972 ) ) ( not ( = ?auto_169974 ?auto_169972 ) ) ( not ( = ?auto_169978 ?auto_169980 ) ) ( not ( = ?auto_169978 ?auto_169976 ) ) ( not ( = ?auto_169978 ?auto_169977 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_169973 ?auto_169970 ?auto_169971 ?auto_169972 ?auto_169974 ?auto_169969 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170131 - OBJ
      ?auto_170132 - OBJ
      ?auto_170133 - OBJ
      ?auto_170134 - OBJ
      ?auto_170135 - OBJ
      ?auto_170130 - LOCATION
    )
    :vars
    (
      ?auto_170139 - LOCATION
      ?auto_170140 - CITY
      ?auto_170141 - LOCATION
      ?auto_170137 - LOCATION
      ?auto_170138 - LOCATION
      ?auto_170136 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170139 ?auto_170140 ) ( IN-CITY ?auto_170130 ?auto_170140 ) ( not ( = ?auto_170130 ?auto_170139 ) ) ( OBJ-AT ?auto_170133 ?auto_170139 ) ( IN-CITY ?auto_170141 ?auto_170140 ) ( not ( = ?auto_170130 ?auto_170141 ) ) ( OBJ-AT ?auto_170134 ?auto_170141 ) ( IN-CITY ?auto_170137 ?auto_170140 ) ( not ( = ?auto_170130 ?auto_170137 ) ) ( OBJ-AT ?auto_170132 ?auto_170137 ) ( IN-CITY ?auto_170138 ?auto_170140 ) ( not ( = ?auto_170130 ?auto_170138 ) ) ( OBJ-AT ?auto_170131 ?auto_170138 ) ( OBJ-AT ?auto_170135 ?auto_170138 ) ( TRUCK-AT ?auto_170136 ?auto_170130 ) ( not ( = ?auto_170135 ?auto_170131 ) ) ( not ( = ?auto_170135 ?auto_170132 ) ) ( not ( = ?auto_170131 ?auto_170132 ) ) ( not ( = ?auto_170137 ?auto_170138 ) ) ( not ( = ?auto_170135 ?auto_170134 ) ) ( not ( = ?auto_170131 ?auto_170134 ) ) ( not ( = ?auto_170132 ?auto_170134 ) ) ( not ( = ?auto_170141 ?auto_170137 ) ) ( not ( = ?auto_170141 ?auto_170138 ) ) ( not ( = ?auto_170135 ?auto_170133 ) ) ( not ( = ?auto_170131 ?auto_170133 ) ) ( not ( = ?auto_170132 ?auto_170133 ) ) ( not ( = ?auto_170134 ?auto_170133 ) ) ( not ( = ?auto_170139 ?auto_170141 ) ) ( not ( = ?auto_170139 ?auto_170137 ) ) ( not ( = ?auto_170139 ?auto_170138 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170135 ?auto_170131 ?auto_170132 ?auto_170133 ?auto_170134 ?auto_170130 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170289 - OBJ
      ?auto_170290 - OBJ
      ?auto_170291 - OBJ
      ?auto_170292 - OBJ
      ?auto_170293 - OBJ
      ?auto_170288 - LOCATION
    )
    :vars
    (
      ?auto_170297 - LOCATION
      ?auto_170298 - CITY
      ?auto_170299 - LOCATION
      ?auto_170295 - LOCATION
      ?auto_170296 - LOCATION
      ?auto_170294 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170297 ?auto_170298 ) ( IN-CITY ?auto_170288 ?auto_170298 ) ( not ( = ?auto_170288 ?auto_170297 ) ) ( OBJ-AT ?auto_170293 ?auto_170297 ) ( IN-CITY ?auto_170299 ?auto_170298 ) ( not ( = ?auto_170288 ?auto_170299 ) ) ( OBJ-AT ?auto_170290 ?auto_170299 ) ( IN-CITY ?auto_170295 ?auto_170298 ) ( not ( = ?auto_170288 ?auto_170295 ) ) ( OBJ-AT ?auto_170292 ?auto_170295 ) ( IN-CITY ?auto_170296 ?auto_170298 ) ( not ( = ?auto_170288 ?auto_170296 ) ) ( OBJ-AT ?auto_170289 ?auto_170296 ) ( OBJ-AT ?auto_170291 ?auto_170296 ) ( TRUCK-AT ?auto_170294 ?auto_170288 ) ( not ( = ?auto_170291 ?auto_170289 ) ) ( not ( = ?auto_170291 ?auto_170292 ) ) ( not ( = ?auto_170289 ?auto_170292 ) ) ( not ( = ?auto_170295 ?auto_170296 ) ) ( not ( = ?auto_170291 ?auto_170290 ) ) ( not ( = ?auto_170289 ?auto_170290 ) ) ( not ( = ?auto_170292 ?auto_170290 ) ) ( not ( = ?auto_170299 ?auto_170295 ) ) ( not ( = ?auto_170299 ?auto_170296 ) ) ( not ( = ?auto_170291 ?auto_170293 ) ) ( not ( = ?auto_170289 ?auto_170293 ) ) ( not ( = ?auto_170292 ?auto_170293 ) ) ( not ( = ?auto_170290 ?auto_170293 ) ) ( not ( = ?auto_170297 ?auto_170299 ) ) ( not ( = ?auto_170297 ?auto_170295 ) ) ( not ( = ?auto_170297 ?auto_170296 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170291 ?auto_170289 ?auto_170292 ?auto_170293 ?auto_170290 ?auto_170288 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170340 - OBJ
      ?auto_170341 - OBJ
      ?auto_170342 - OBJ
      ?auto_170343 - OBJ
      ?auto_170344 - OBJ
      ?auto_170339 - LOCATION
    )
    :vars
    (
      ?auto_170348 - LOCATION
      ?auto_170349 - CITY
      ?auto_170350 - LOCATION
      ?auto_170346 - LOCATION
      ?auto_170347 - LOCATION
      ?auto_170345 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170348 ?auto_170349 ) ( IN-CITY ?auto_170339 ?auto_170349 ) ( not ( = ?auto_170339 ?auto_170348 ) ) ( OBJ-AT ?auto_170343 ?auto_170348 ) ( IN-CITY ?auto_170350 ?auto_170349 ) ( not ( = ?auto_170339 ?auto_170350 ) ) ( OBJ-AT ?auto_170341 ?auto_170350 ) ( IN-CITY ?auto_170346 ?auto_170349 ) ( not ( = ?auto_170339 ?auto_170346 ) ) ( OBJ-AT ?auto_170344 ?auto_170346 ) ( IN-CITY ?auto_170347 ?auto_170349 ) ( not ( = ?auto_170339 ?auto_170347 ) ) ( OBJ-AT ?auto_170340 ?auto_170347 ) ( OBJ-AT ?auto_170342 ?auto_170347 ) ( TRUCK-AT ?auto_170345 ?auto_170339 ) ( not ( = ?auto_170342 ?auto_170340 ) ) ( not ( = ?auto_170342 ?auto_170344 ) ) ( not ( = ?auto_170340 ?auto_170344 ) ) ( not ( = ?auto_170346 ?auto_170347 ) ) ( not ( = ?auto_170342 ?auto_170341 ) ) ( not ( = ?auto_170340 ?auto_170341 ) ) ( not ( = ?auto_170344 ?auto_170341 ) ) ( not ( = ?auto_170350 ?auto_170346 ) ) ( not ( = ?auto_170350 ?auto_170347 ) ) ( not ( = ?auto_170342 ?auto_170343 ) ) ( not ( = ?auto_170340 ?auto_170343 ) ) ( not ( = ?auto_170344 ?auto_170343 ) ) ( not ( = ?auto_170341 ?auto_170343 ) ) ( not ( = ?auto_170348 ?auto_170350 ) ) ( not ( = ?auto_170348 ?auto_170346 ) ) ( not ( = ?auto_170348 ?auto_170347 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170342 ?auto_170340 ?auto_170344 ?auto_170343 ?auto_170341 ?auto_170339 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170500 - OBJ
      ?auto_170501 - OBJ
      ?auto_170502 - OBJ
      ?auto_170503 - OBJ
      ?auto_170504 - OBJ
      ?auto_170499 - LOCATION
    )
    :vars
    (
      ?auto_170508 - LOCATION
      ?auto_170509 - CITY
      ?auto_170510 - LOCATION
      ?auto_170506 - LOCATION
      ?auto_170507 - LOCATION
      ?auto_170505 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170508 ?auto_170509 ) ( IN-CITY ?auto_170499 ?auto_170509 ) ( not ( = ?auto_170499 ?auto_170508 ) ) ( OBJ-AT ?auto_170504 ?auto_170508 ) ( IN-CITY ?auto_170510 ?auto_170509 ) ( not ( = ?auto_170499 ?auto_170510 ) ) ( OBJ-AT ?auto_170501 ?auto_170510 ) ( IN-CITY ?auto_170506 ?auto_170509 ) ( not ( = ?auto_170499 ?auto_170506 ) ) ( OBJ-AT ?auto_170502 ?auto_170506 ) ( IN-CITY ?auto_170507 ?auto_170509 ) ( not ( = ?auto_170499 ?auto_170507 ) ) ( OBJ-AT ?auto_170500 ?auto_170507 ) ( OBJ-AT ?auto_170503 ?auto_170507 ) ( TRUCK-AT ?auto_170505 ?auto_170499 ) ( not ( = ?auto_170503 ?auto_170500 ) ) ( not ( = ?auto_170503 ?auto_170502 ) ) ( not ( = ?auto_170500 ?auto_170502 ) ) ( not ( = ?auto_170506 ?auto_170507 ) ) ( not ( = ?auto_170503 ?auto_170501 ) ) ( not ( = ?auto_170500 ?auto_170501 ) ) ( not ( = ?auto_170502 ?auto_170501 ) ) ( not ( = ?auto_170510 ?auto_170506 ) ) ( not ( = ?auto_170510 ?auto_170507 ) ) ( not ( = ?auto_170503 ?auto_170504 ) ) ( not ( = ?auto_170500 ?auto_170504 ) ) ( not ( = ?auto_170502 ?auto_170504 ) ) ( not ( = ?auto_170501 ?auto_170504 ) ) ( not ( = ?auto_170508 ?auto_170510 ) ) ( not ( = ?auto_170508 ?auto_170506 ) ) ( not ( = ?auto_170508 ?auto_170507 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170503 ?auto_170500 ?auto_170502 ?auto_170504 ?auto_170501 ?auto_170499 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170551 - OBJ
      ?auto_170552 - OBJ
      ?auto_170553 - OBJ
      ?auto_170554 - OBJ
      ?auto_170555 - OBJ
      ?auto_170550 - LOCATION
    )
    :vars
    (
      ?auto_170559 - LOCATION
      ?auto_170560 - CITY
      ?auto_170561 - LOCATION
      ?auto_170557 - LOCATION
      ?auto_170558 - LOCATION
      ?auto_170556 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170559 ?auto_170560 ) ( IN-CITY ?auto_170550 ?auto_170560 ) ( not ( = ?auto_170550 ?auto_170559 ) ) ( OBJ-AT ?auto_170554 ?auto_170559 ) ( IN-CITY ?auto_170561 ?auto_170560 ) ( not ( = ?auto_170550 ?auto_170561 ) ) ( OBJ-AT ?auto_170552 ?auto_170561 ) ( IN-CITY ?auto_170557 ?auto_170560 ) ( not ( = ?auto_170550 ?auto_170557 ) ) ( OBJ-AT ?auto_170553 ?auto_170557 ) ( IN-CITY ?auto_170558 ?auto_170560 ) ( not ( = ?auto_170550 ?auto_170558 ) ) ( OBJ-AT ?auto_170551 ?auto_170558 ) ( OBJ-AT ?auto_170555 ?auto_170558 ) ( TRUCK-AT ?auto_170556 ?auto_170550 ) ( not ( = ?auto_170555 ?auto_170551 ) ) ( not ( = ?auto_170555 ?auto_170553 ) ) ( not ( = ?auto_170551 ?auto_170553 ) ) ( not ( = ?auto_170557 ?auto_170558 ) ) ( not ( = ?auto_170555 ?auto_170552 ) ) ( not ( = ?auto_170551 ?auto_170552 ) ) ( not ( = ?auto_170553 ?auto_170552 ) ) ( not ( = ?auto_170561 ?auto_170557 ) ) ( not ( = ?auto_170561 ?auto_170558 ) ) ( not ( = ?auto_170555 ?auto_170554 ) ) ( not ( = ?auto_170551 ?auto_170554 ) ) ( not ( = ?auto_170553 ?auto_170554 ) ) ( not ( = ?auto_170552 ?auto_170554 ) ) ( not ( = ?auto_170559 ?auto_170561 ) ) ( not ( = ?auto_170559 ?auto_170557 ) ) ( not ( = ?auto_170559 ?auto_170558 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170555 ?auto_170551 ?auto_170553 ?auto_170554 ?auto_170552 ?auto_170550 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170763 - OBJ
      ?auto_170764 - OBJ
      ?auto_170765 - OBJ
      ?auto_170766 - OBJ
      ?auto_170767 - OBJ
      ?auto_170762 - LOCATION
    )
    :vars
    (
      ?auto_170771 - LOCATION
      ?auto_170772 - CITY
      ?auto_170773 - LOCATION
      ?auto_170769 - LOCATION
      ?auto_170770 - LOCATION
      ?auto_170768 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170771 ?auto_170772 ) ( IN-CITY ?auto_170762 ?auto_170772 ) ( not ( = ?auto_170762 ?auto_170771 ) ) ( OBJ-AT ?auto_170765 ?auto_170771 ) ( IN-CITY ?auto_170773 ?auto_170772 ) ( not ( = ?auto_170762 ?auto_170773 ) ) ( OBJ-AT ?auto_170764 ?auto_170773 ) ( IN-CITY ?auto_170769 ?auto_170772 ) ( not ( = ?auto_170762 ?auto_170769 ) ) ( OBJ-AT ?auto_170767 ?auto_170769 ) ( IN-CITY ?auto_170770 ?auto_170772 ) ( not ( = ?auto_170762 ?auto_170770 ) ) ( OBJ-AT ?auto_170763 ?auto_170770 ) ( OBJ-AT ?auto_170766 ?auto_170770 ) ( TRUCK-AT ?auto_170768 ?auto_170762 ) ( not ( = ?auto_170766 ?auto_170763 ) ) ( not ( = ?auto_170766 ?auto_170767 ) ) ( not ( = ?auto_170763 ?auto_170767 ) ) ( not ( = ?auto_170769 ?auto_170770 ) ) ( not ( = ?auto_170766 ?auto_170764 ) ) ( not ( = ?auto_170763 ?auto_170764 ) ) ( not ( = ?auto_170767 ?auto_170764 ) ) ( not ( = ?auto_170773 ?auto_170769 ) ) ( not ( = ?auto_170773 ?auto_170770 ) ) ( not ( = ?auto_170766 ?auto_170765 ) ) ( not ( = ?auto_170763 ?auto_170765 ) ) ( not ( = ?auto_170767 ?auto_170765 ) ) ( not ( = ?auto_170764 ?auto_170765 ) ) ( not ( = ?auto_170771 ?auto_170773 ) ) ( not ( = ?auto_170771 ?auto_170769 ) ) ( not ( = ?auto_170771 ?auto_170770 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170766 ?auto_170763 ?auto_170767 ?auto_170765 ?auto_170764 ?auto_170762 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_170869 - OBJ
      ?auto_170870 - OBJ
      ?auto_170871 - OBJ
      ?auto_170872 - OBJ
      ?auto_170873 - OBJ
      ?auto_170868 - LOCATION
    )
    :vars
    (
      ?auto_170877 - LOCATION
      ?auto_170878 - CITY
      ?auto_170879 - LOCATION
      ?auto_170875 - LOCATION
      ?auto_170876 - LOCATION
      ?auto_170874 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_170877 ?auto_170878 ) ( IN-CITY ?auto_170868 ?auto_170878 ) ( not ( = ?auto_170868 ?auto_170877 ) ) ( OBJ-AT ?auto_170871 ?auto_170877 ) ( IN-CITY ?auto_170879 ?auto_170878 ) ( not ( = ?auto_170868 ?auto_170879 ) ) ( OBJ-AT ?auto_170870 ?auto_170879 ) ( IN-CITY ?auto_170875 ?auto_170878 ) ( not ( = ?auto_170868 ?auto_170875 ) ) ( OBJ-AT ?auto_170872 ?auto_170875 ) ( IN-CITY ?auto_170876 ?auto_170878 ) ( not ( = ?auto_170868 ?auto_170876 ) ) ( OBJ-AT ?auto_170869 ?auto_170876 ) ( OBJ-AT ?auto_170873 ?auto_170876 ) ( TRUCK-AT ?auto_170874 ?auto_170868 ) ( not ( = ?auto_170873 ?auto_170869 ) ) ( not ( = ?auto_170873 ?auto_170872 ) ) ( not ( = ?auto_170869 ?auto_170872 ) ) ( not ( = ?auto_170875 ?auto_170876 ) ) ( not ( = ?auto_170873 ?auto_170870 ) ) ( not ( = ?auto_170869 ?auto_170870 ) ) ( not ( = ?auto_170872 ?auto_170870 ) ) ( not ( = ?auto_170879 ?auto_170875 ) ) ( not ( = ?auto_170879 ?auto_170876 ) ) ( not ( = ?auto_170873 ?auto_170871 ) ) ( not ( = ?auto_170869 ?auto_170871 ) ) ( not ( = ?auto_170872 ?auto_170871 ) ) ( not ( = ?auto_170870 ?auto_170871 ) ) ( not ( = ?auto_170877 ?auto_170879 ) ) ( not ( = ?auto_170877 ?auto_170875 ) ) ( not ( = ?auto_170877 ?auto_170876 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_170873 ?auto_170869 ?auto_170872 ?auto_170871 ?auto_170870 ?auto_170868 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_171244 - OBJ
      ?auto_171245 - OBJ
      ?auto_171246 - OBJ
      ?auto_171247 - OBJ
      ?auto_171248 - OBJ
      ?auto_171243 - LOCATION
    )
    :vars
    (
      ?auto_171252 - LOCATION
      ?auto_171253 - CITY
      ?auto_171254 - LOCATION
      ?auto_171250 - LOCATION
      ?auto_171251 - LOCATION
      ?auto_171249 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_171252 ?auto_171253 ) ( IN-CITY ?auto_171243 ?auto_171253 ) ( not ( = ?auto_171243 ?auto_171252 ) ) ( OBJ-AT ?auto_171245 ?auto_171252 ) ( IN-CITY ?auto_171254 ?auto_171253 ) ( not ( = ?auto_171243 ?auto_171254 ) ) ( OBJ-AT ?auto_171248 ?auto_171254 ) ( IN-CITY ?auto_171250 ?auto_171253 ) ( not ( = ?auto_171243 ?auto_171250 ) ) ( OBJ-AT ?auto_171247 ?auto_171250 ) ( IN-CITY ?auto_171251 ?auto_171253 ) ( not ( = ?auto_171243 ?auto_171251 ) ) ( OBJ-AT ?auto_171244 ?auto_171251 ) ( OBJ-AT ?auto_171246 ?auto_171251 ) ( TRUCK-AT ?auto_171249 ?auto_171243 ) ( not ( = ?auto_171246 ?auto_171244 ) ) ( not ( = ?auto_171246 ?auto_171247 ) ) ( not ( = ?auto_171244 ?auto_171247 ) ) ( not ( = ?auto_171250 ?auto_171251 ) ) ( not ( = ?auto_171246 ?auto_171248 ) ) ( not ( = ?auto_171244 ?auto_171248 ) ) ( not ( = ?auto_171247 ?auto_171248 ) ) ( not ( = ?auto_171254 ?auto_171250 ) ) ( not ( = ?auto_171254 ?auto_171251 ) ) ( not ( = ?auto_171246 ?auto_171245 ) ) ( not ( = ?auto_171244 ?auto_171245 ) ) ( not ( = ?auto_171247 ?auto_171245 ) ) ( not ( = ?auto_171248 ?auto_171245 ) ) ( not ( = ?auto_171252 ?auto_171254 ) ) ( not ( = ?auto_171252 ?auto_171250 ) ) ( not ( = ?auto_171252 ?auto_171251 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_171246 ?auto_171244 ?auto_171247 ?auto_171245 ?auto_171248 ?auto_171243 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_171295 - OBJ
      ?auto_171296 - OBJ
      ?auto_171297 - OBJ
      ?auto_171298 - OBJ
      ?auto_171299 - OBJ
      ?auto_171294 - LOCATION
    )
    :vars
    (
      ?auto_171303 - LOCATION
      ?auto_171304 - CITY
      ?auto_171305 - LOCATION
      ?auto_171301 - LOCATION
      ?auto_171302 - LOCATION
      ?auto_171300 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_171303 ?auto_171304 ) ( IN-CITY ?auto_171294 ?auto_171304 ) ( not ( = ?auto_171294 ?auto_171303 ) ) ( OBJ-AT ?auto_171296 ?auto_171303 ) ( IN-CITY ?auto_171305 ?auto_171304 ) ( not ( = ?auto_171294 ?auto_171305 ) ) ( OBJ-AT ?auto_171298 ?auto_171305 ) ( IN-CITY ?auto_171301 ?auto_171304 ) ( not ( = ?auto_171294 ?auto_171301 ) ) ( OBJ-AT ?auto_171299 ?auto_171301 ) ( IN-CITY ?auto_171302 ?auto_171304 ) ( not ( = ?auto_171294 ?auto_171302 ) ) ( OBJ-AT ?auto_171295 ?auto_171302 ) ( OBJ-AT ?auto_171297 ?auto_171302 ) ( TRUCK-AT ?auto_171300 ?auto_171294 ) ( not ( = ?auto_171297 ?auto_171295 ) ) ( not ( = ?auto_171297 ?auto_171299 ) ) ( not ( = ?auto_171295 ?auto_171299 ) ) ( not ( = ?auto_171301 ?auto_171302 ) ) ( not ( = ?auto_171297 ?auto_171298 ) ) ( not ( = ?auto_171295 ?auto_171298 ) ) ( not ( = ?auto_171299 ?auto_171298 ) ) ( not ( = ?auto_171305 ?auto_171301 ) ) ( not ( = ?auto_171305 ?auto_171302 ) ) ( not ( = ?auto_171297 ?auto_171296 ) ) ( not ( = ?auto_171295 ?auto_171296 ) ) ( not ( = ?auto_171299 ?auto_171296 ) ) ( not ( = ?auto_171298 ?auto_171296 ) ) ( not ( = ?auto_171303 ?auto_171305 ) ) ( not ( = ?auto_171303 ?auto_171301 ) ) ( not ( = ?auto_171303 ?auto_171302 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_171297 ?auto_171295 ?auto_171299 ?auto_171296 ?auto_171298 ?auto_171294 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_171788 - OBJ
      ?auto_171789 - OBJ
      ?auto_171790 - OBJ
      ?auto_171791 - OBJ
      ?auto_171792 - OBJ
      ?auto_171787 - LOCATION
    )
    :vars
    (
      ?auto_171796 - LOCATION
      ?auto_171797 - CITY
      ?auto_171798 - LOCATION
      ?auto_171794 - LOCATION
      ?auto_171795 - LOCATION
      ?auto_171793 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_171796 ?auto_171797 ) ( IN-CITY ?auto_171787 ?auto_171797 ) ( not ( = ?auto_171787 ?auto_171796 ) ) ( OBJ-AT ?auto_171789 ?auto_171796 ) ( IN-CITY ?auto_171798 ?auto_171797 ) ( not ( = ?auto_171787 ?auto_171798 ) ) ( OBJ-AT ?auto_171792 ?auto_171798 ) ( IN-CITY ?auto_171794 ?auto_171797 ) ( not ( = ?auto_171787 ?auto_171794 ) ) ( OBJ-AT ?auto_171790 ?auto_171794 ) ( IN-CITY ?auto_171795 ?auto_171797 ) ( not ( = ?auto_171787 ?auto_171795 ) ) ( OBJ-AT ?auto_171788 ?auto_171795 ) ( OBJ-AT ?auto_171791 ?auto_171795 ) ( TRUCK-AT ?auto_171793 ?auto_171787 ) ( not ( = ?auto_171791 ?auto_171788 ) ) ( not ( = ?auto_171791 ?auto_171790 ) ) ( not ( = ?auto_171788 ?auto_171790 ) ) ( not ( = ?auto_171794 ?auto_171795 ) ) ( not ( = ?auto_171791 ?auto_171792 ) ) ( not ( = ?auto_171788 ?auto_171792 ) ) ( not ( = ?auto_171790 ?auto_171792 ) ) ( not ( = ?auto_171798 ?auto_171794 ) ) ( not ( = ?auto_171798 ?auto_171795 ) ) ( not ( = ?auto_171791 ?auto_171789 ) ) ( not ( = ?auto_171788 ?auto_171789 ) ) ( not ( = ?auto_171790 ?auto_171789 ) ) ( not ( = ?auto_171792 ?auto_171789 ) ) ( not ( = ?auto_171796 ?auto_171798 ) ) ( not ( = ?auto_171796 ?auto_171794 ) ) ( not ( = ?auto_171796 ?auto_171795 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_171791 ?auto_171788 ?auto_171790 ?auto_171789 ?auto_171792 ?auto_171787 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_171949 - OBJ
      ?auto_171950 - OBJ
      ?auto_171951 - OBJ
      ?auto_171952 - OBJ
      ?auto_171953 - OBJ
      ?auto_171948 - LOCATION
    )
    :vars
    (
      ?auto_171957 - LOCATION
      ?auto_171958 - CITY
      ?auto_171959 - LOCATION
      ?auto_171955 - LOCATION
      ?auto_171956 - LOCATION
      ?auto_171954 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_171957 ?auto_171958 ) ( IN-CITY ?auto_171948 ?auto_171958 ) ( not ( = ?auto_171948 ?auto_171957 ) ) ( OBJ-AT ?auto_171950 ?auto_171957 ) ( IN-CITY ?auto_171959 ?auto_171958 ) ( not ( = ?auto_171948 ?auto_171959 ) ) ( OBJ-AT ?auto_171952 ?auto_171959 ) ( IN-CITY ?auto_171955 ?auto_171958 ) ( not ( = ?auto_171948 ?auto_171955 ) ) ( OBJ-AT ?auto_171951 ?auto_171955 ) ( IN-CITY ?auto_171956 ?auto_171958 ) ( not ( = ?auto_171948 ?auto_171956 ) ) ( OBJ-AT ?auto_171949 ?auto_171956 ) ( OBJ-AT ?auto_171953 ?auto_171956 ) ( TRUCK-AT ?auto_171954 ?auto_171948 ) ( not ( = ?auto_171953 ?auto_171949 ) ) ( not ( = ?auto_171953 ?auto_171951 ) ) ( not ( = ?auto_171949 ?auto_171951 ) ) ( not ( = ?auto_171955 ?auto_171956 ) ) ( not ( = ?auto_171953 ?auto_171952 ) ) ( not ( = ?auto_171949 ?auto_171952 ) ) ( not ( = ?auto_171951 ?auto_171952 ) ) ( not ( = ?auto_171959 ?auto_171955 ) ) ( not ( = ?auto_171959 ?auto_171956 ) ) ( not ( = ?auto_171953 ?auto_171950 ) ) ( not ( = ?auto_171949 ?auto_171950 ) ) ( not ( = ?auto_171951 ?auto_171950 ) ) ( not ( = ?auto_171952 ?auto_171950 ) ) ( not ( = ?auto_171957 ?auto_171959 ) ) ( not ( = ?auto_171957 ?auto_171955 ) ) ( not ( = ?auto_171957 ?auto_171956 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_171953 ?auto_171949 ?auto_171951 ?auto_171950 ?auto_171952 ?auto_171948 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_172107 - OBJ
      ?auto_172108 - OBJ
      ?auto_172109 - OBJ
      ?auto_172110 - OBJ
      ?auto_172111 - OBJ
      ?auto_172106 - LOCATION
    )
    :vars
    (
      ?auto_172115 - LOCATION
      ?auto_172116 - CITY
      ?auto_172117 - LOCATION
      ?auto_172113 - LOCATION
      ?auto_172114 - LOCATION
      ?auto_172112 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_172115 ?auto_172116 ) ( IN-CITY ?auto_172106 ?auto_172116 ) ( not ( = ?auto_172106 ?auto_172115 ) ) ( OBJ-AT ?auto_172108 ?auto_172115 ) ( IN-CITY ?auto_172117 ?auto_172116 ) ( not ( = ?auto_172106 ?auto_172117 ) ) ( OBJ-AT ?auto_172109 ?auto_172117 ) ( IN-CITY ?auto_172113 ?auto_172116 ) ( not ( = ?auto_172106 ?auto_172113 ) ) ( OBJ-AT ?auto_172111 ?auto_172113 ) ( IN-CITY ?auto_172114 ?auto_172116 ) ( not ( = ?auto_172106 ?auto_172114 ) ) ( OBJ-AT ?auto_172107 ?auto_172114 ) ( OBJ-AT ?auto_172110 ?auto_172114 ) ( TRUCK-AT ?auto_172112 ?auto_172106 ) ( not ( = ?auto_172110 ?auto_172107 ) ) ( not ( = ?auto_172110 ?auto_172111 ) ) ( not ( = ?auto_172107 ?auto_172111 ) ) ( not ( = ?auto_172113 ?auto_172114 ) ) ( not ( = ?auto_172110 ?auto_172109 ) ) ( not ( = ?auto_172107 ?auto_172109 ) ) ( not ( = ?auto_172111 ?auto_172109 ) ) ( not ( = ?auto_172117 ?auto_172113 ) ) ( not ( = ?auto_172117 ?auto_172114 ) ) ( not ( = ?auto_172110 ?auto_172108 ) ) ( not ( = ?auto_172107 ?auto_172108 ) ) ( not ( = ?auto_172111 ?auto_172108 ) ) ( not ( = ?auto_172109 ?auto_172108 ) ) ( not ( = ?auto_172115 ?auto_172117 ) ) ( not ( = ?auto_172115 ?auto_172113 ) ) ( not ( = ?auto_172115 ?auto_172114 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_172110 ?auto_172107 ?auto_172111 ?auto_172108 ?auto_172109 ?auto_172106 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_172213 - OBJ
      ?auto_172214 - OBJ
      ?auto_172215 - OBJ
      ?auto_172216 - OBJ
      ?auto_172217 - OBJ
      ?auto_172212 - LOCATION
    )
    :vars
    (
      ?auto_172221 - LOCATION
      ?auto_172222 - CITY
      ?auto_172223 - LOCATION
      ?auto_172219 - LOCATION
      ?auto_172220 - LOCATION
      ?auto_172218 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_172221 ?auto_172222 ) ( IN-CITY ?auto_172212 ?auto_172222 ) ( not ( = ?auto_172212 ?auto_172221 ) ) ( OBJ-AT ?auto_172214 ?auto_172221 ) ( IN-CITY ?auto_172223 ?auto_172222 ) ( not ( = ?auto_172212 ?auto_172223 ) ) ( OBJ-AT ?auto_172215 ?auto_172223 ) ( IN-CITY ?auto_172219 ?auto_172222 ) ( not ( = ?auto_172212 ?auto_172219 ) ) ( OBJ-AT ?auto_172216 ?auto_172219 ) ( IN-CITY ?auto_172220 ?auto_172222 ) ( not ( = ?auto_172212 ?auto_172220 ) ) ( OBJ-AT ?auto_172213 ?auto_172220 ) ( OBJ-AT ?auto_172217 ?auto_172220 ) ( TRUCK-AT ?auto_172218 ?auto_172212 ) ( not ( = ?auto_172217 ?auto_172213 ) ) ( not ( = ?auto_172217 ?auto_172216 ) ) ( not ( = ?auto_172213 ?auto_172216 ) ) ( not ( = ?auto_172219 ?auto_172220 ) ) ( not ( = ?auto_172217 ?auto_172215 ) ) ( not ( = ?auto_172213 ?auto_172215 ) ) ( not ( = ?auto_172216 ?auto_172215 ) ) ( not ( = ?auto_172223 ?auto_172219 ) ) ( not ( = ?auto_172223 ?auto_172220 ) ) ( not ( = ?auto_172217 ?auto_172214 ) ) ( not ( = ?auto_172213 ?auto_172214 ) ) ( not ( = ?auto_172216 ?auto_172214 ) ) ( not ( = ?auto_172215 ?auto_172214 ) ) ( not ( = ?auto_172221 ?auto_172223 ) ) ( not ( = ?auto_172221 ?auto_172219 ) ) ( not ( = ?auto_172221 ?auto_172220 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_172217 ?auto_172213 ?auto_172216 ?auto_172214 ?auto_172215 ?auto_172212 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_172922 - OBJ
      ?auto_172923 - OBJ
      ?auto_172924 - OBJ
      ?auto_172925 - OBJ
      ?auto_172926 - OBJ
      ?auto_172921 - LOCATION
    )
    :vars
    (
      ?auto_172930 - LOCATION
      ?auto_172931 - CITY
      ?auto_172932 - LOCATION
      ?auto_172928 - LOCATION
      ?auto_172929 - LOCATION
      ?auto_172927 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_172930 ?auto_172931 ) ( IN-CITY ?auto_172921 ?auto_172931 ) ( not ( = ?auto_172921 ?auto_172930 ) ) ( OBJ-AT ?auto_172926 ?auto_172930 ) ( IN-CITY ?auto_172932 ?auto_172931 ) ( not ( = ?auto_172921 ?auto_172932 ) ) ( OBJ-AT ?auto_172925 ?auto_172932 ) ( IN-CITY ?auto_172928 ?auto_172931 ) ( not ( = ?auto_172921 ?auto_172928 ) ) ( OBJ-AT ?auto_172922 ?auto_172928 ) ( IN-CITY ?auto_172929 ?auto_172931 ) ( not ( = ?auto_172921 ?auto_172929 ) ) ( OBJ-AT ?auto_172924 ?auto_172929 ) ( OBJ-AT ?auto_172923 ?auto_172929 ) ( TRUCK-AT ?auto_172927 ?auto_172921 ) ( not ( = ?auto_172923 ?auto_172924 ) ) ( not ( = ?auto_172923 ?auto_172922 ) ) ( not ( = ?auto_172924 ?auto_172922 ) ) ( not ( = ?auto_172928 ?auto_172929 ) ) ( not ( = ?auto_172923 ?auto_172925 ) ) ( not ( = ?auto_172924 ?auto_172925 ) ) ( not ( = ?auto_172922 ?auto_172925 ) ) ( not ( = ?auto_172932 ?auto_172928 ) ) ( not ( = ?auto_172932 ?auto_172929 ) ) ( not ( = ?auto_172923 ?auto_172926 ) ) ( not ( = ?auto_172924 ?auto_172926 ) ) ( not ( = ?auto_172922 ?auto_172926 ) ) ( not ( = ?auto_172925 ?auto_172926 ) ) ( not ( = ?auto_172930 ?auto_172932 ) ) ( not ( = ?auto_172930 ?auto_172928 ) ) ( not ( = ?auto_172930 ?auto_172929 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_172923 ?auto_172924 ?auto_172922 ?auto_172926 ?auto_172925 ?auto_172921 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_172973 - OBJ
      ?auto_172974 - OBJ
      ?auto_172975 - OBJ
      ?auto_172976 - OBJ
      ?auto_172977 - OBJ
      ?auto_172972 - LOCATION
    )
    :vars
    (
      ?auto_172981 - LOCATION
      ?auto_172982 - CITY
      ?auto_172983 - LOCATION
      ?auto_172979 - LOCATION
      ?auto_172980 - LOCATION
      ?auto_172978 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_172981 ?auto_172982 ) ( IN-CITY ?auto_172972 ?auto_172982 ) ( not ( = ?auto_172972 ?auto_172981 ) ) ( OBJ-AT ?auto_172976 ?auto_172981 ) ( IN-CITY ?auto_172983 ?auto_172982 ) ( not ( = ?auto_172972 ?auto_172983 ) ) ( OBJ-AT ?auto_172977 ?auto_172983 ) ( IN-CITY ?auto_172979 ?auto_172982 ) ( not ( = ?auto_172972 ?auto_172979 ) ) ( OBJ-AT ?auto_172973 ?auto_172979 ) ( IN-CITY ?auto_172980 ?auto_172982 ) ( not ( = ?auto_172972 ?auto_172980 ) ) ( OBJ-AT ?auto_172975 ?auto_172980 ) ( OBJ-AT ?auto_172974 ?auto_172980 ) ( TRUCK-AT ?auto_172978 ?auto_172972 ) ( not ( = ?auto_172974 ?auto_172975 ) ) ( not ( = ?auto_172974 ?auto_172973 ) ) ( not ( = ?auto_172975 ?auto_172973 ) ) ( not ( = ?auto_172979 ?auto_172980 ) ) ( not ( = ?auto_172974 ?auto_172977 ) ) ( not ( = ?auto_172975 ?auto_172977 ) ) ( not ( = ?auto_172973 ?auto_172977 ) ) ( not ( = ?auto_172983 ?auto_172979 ) ) ( not ( = ?auto_172983 ?auto_172980 ) ) ( not ( = ?auto_172974 ?auto_172976 ) ) ( not ( = ?auto_172975 ?auto_172976 ) ) ( not ( = ?auto_172973 ?auto_172976 ) ) ( not ( = ?auto_172977 ?auto_172976 ) ) ( not ( = ?auto_172981 ?auto_172983 ) ) ( not ( = ?auto_172981 ?auto_172979 ) ) ( not ( = ?auto_172981 ?auto_172980 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_172974 ?auto_172975 ?auto_172973 ?auto_172976 ?auto_172977 ?auto_172972 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_173133 - OBJ
      ?auto_173134 - OBJ
      ?auto_173135 - OBJ
      ?auto_173136 - OBJ
      ?auto_173137 - OBJ
      ?auto_173132 - LOCATION
    )
    :vars
    (
      ?auto_173141 - LOCATION
      ?auto_173142 - CITY
      ?auto_173143 - LOCATION
      ?auto_173139 - LOCATION
      ?auto_173140 - LOCATION
      ?auto_173138 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_173141 ?auto_173142 ) ( IN-CITY ?auto_173132 ?auto_173142 ) ( not ( = ?auto_173132 ?auto_173141 ) ) ( OBJ-AT ?auto_173137 ?auto_173141 ) ( IN-CITY ?auto_173143 ?auto_173142 ) ( not ( = ?auto_173132 ?auto_173143 ) ) ( OBJ-AT ?auto_173135 ?auto_173143 ) ( IN-CITY ?auto_173139 ?auto_173142 ) ( not ( = ?auto_173132 ?auto_173139 ) ) ( OBJ-AT ?auto_173133 ?auto_173139 ) ( IN-CITY ?auto_173140 ?auto_173142 ) ( not ( = ?auto_173132 ?auto_173140 ) ) ( OBJ-AT ?auto_173136 ?auto_173140 ) ( OBJ-AT ?auto_173134 ?auto_173140 ) ( TRUCK-AT ?auto_173138 ?auto_173132 ) ( not ( = ?auto_173134 ?auto_173136 ) ) ( not ( = ?auto_173134 ?auto_173133 ) ) ( not ( = ?auto_173136 ?auto_173133 ) ) ( not ( = ?auto_173139 ?auto_173140 ) ) ( not ( = ?auto_173134 ?auto_173135 ) ) ( not ( = ?auto_173136 ?auto_173135 ) ) ( not ( = ?auto_173133 ?auto_173135 ) ) ( not ( = ?auto_173143 ?auto_173139 ) ) ( not ( = ?auto_173143 ?auto_173140 ) ) ( not ( = ?auto_173134 ?auto_173137 ) ) ( not ( = ?auto_173136 ?auto_173137 ) ) ( not ( = ?auto_173133 ?auto_173137 ) ) ( not ( = ?auto_173135 ?auto_173137 ) ) ( not ( = ?auto_173141 ?auto_173143 ) ) ( not ( = ?auto_173141 ?auto_173139 ) ) ( not ( = ?auto_173141 ?auto_173140 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_173134 ?auto_173136 ?auto_173133 ?auto_173137 ?auto_173135 ?auto_173132 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_173184 - OBJ
      ?auto_173185 - OBJ
      ?auto_173186 - OBJ
      ?auto_173187 - OBJ
      ?auto_173188 - OBJ
      ?auto_173183 - LOCATION
    )
    :vars
    (
      ?auto_173192 - LOCATION
      ?auto_173193 - CITY
      ?auto_173194 - LOCATION
      ?auto_173190 - LOCATION
      ?auto_173191 - LOCATION
      ?auto_173189 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_173192 ?auto_173193 ) ( IN-CITY ?auto_173183 ?auto_173193 ) ( not ( = ?auto_173183 ?auto_173192 ) ) ( OBJ-AT ?auto_173187 ?auto_173192 ) ( IN-CITY ?auto_173194 ?auto_173193 ) ( not ( = ?auto_173183 ?auto_173194 ) ) ( OBJ-AT ?auto_173186 ?auto_173194 ) ( IN-CITY ?auto_173190 ?auto_173193 ) ( not ( = ?auto_173183 ?auto_173190 ) ) ( OBJ-AT ?auto_173184 ?auto_173190 ) ( IN-CITY ?auto_173191 ?auto_173193 ) ( not ( = ?auto_173183 ?auto_173191 ) ) ( OBJ-AT ?auto_173188 ?auto_173191 ) ( OBJ-AT ?auto_173185 ?auto_173191 ) ( TRUCK-AT ?auto_173189 ?auto_173183 ) ( not ( = ?auto_173185 ?auto_173188 ) ) ( not ( = ?auto_173185 ?auto_173184 ) ) ( not ( = ?auto_173188 ?auto_173184 ) ) ( not ( = ?auto_173190 ?auto_173191 ) ) ( not ( = ?auto_173185 ?auto_173186 ) ) ( not ( = ?auto_173188 ?auto_173186 ) ) ( not ( = ?auto_173184 ?auto_173186 ) ) ( not ( = ?auto_173194 ?auto_173190 ) ) ( not ( = ?auto_173194 ?auto_173191 ) ) ( not ( = ?auto_173185 ?auto_173187 ) ) ( not ( = ?auto_173188 ?auto_173187 ) ) ( not ( = ?auto_173184 ?auto_173187 ) ) ( not ( = ?auto_173186 ?auto_173187 ) ) ( not ( = ?auto_173192 ?auto_173194 ) ) ( not ( = ?auto_173192 ?auto_173190 ) ) ( not ( = ?auto_173192 ?auto_173191 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_173185 ?auto_173188 ?auto_173184 ?auto_173187 ?auto_173186 ?auto_173183 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_173342 - OBJ
      ?auto_173343 - OBJ
      ?auto_173344 - OBJ
      ?auto_173345 - OBJ
      ?auto_173346 - OBJ
      ?auto_173341 - LOCATION
    )
    :vars
    (
      ?auto_173350 - LOCATION
      ?auto_173351 - CITY
      ?auto_173352 - LOCATION
      ?auto_173348 - LOCATION
      ?auto_173349 - LOCATION
      ?auto_173347 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_173350 ?auto_173351 ) ( IN-CITY ?auto_173341 ?auto_173351 ) ( not ( = ?auto_173341 ?auto_173350 ) ) ( OBJ-AT ?auto_173344 ?auto_173350 ) ( IN-CITY ?auto_173352 ?auto_173351 ) ( not ( = ?auto_173341 ?auto_173352 ) ) ( OBJ-AT ?auto_173346 ?auto_173352 ) ( IN-CITY ?auto_173348 ?auto_173351 ) ( not ( = ?auto_173341 ?auto_173348 ) ) ( OBJ-AT ?auto_173342 ?auto_173348 ) ( IN-CITY ?auto_173349 ?auto_173351 ) ( not ( = ?auto_173341 ?auto_173349 ) ) ( OBJ-AT ?auto_173345 ?auto_173349 ) ( OBJ-AT ?auto_173343 ?auto_173349 ) ( TRUCK-AT ?auto_173347 ?auto_173341 ) ( not ( = ?auto_173343 ?auto_173345 ) ) ( not ( = ?auto_173343 ?auto_173342 ) ) ( not ( = ?auto_173345 ?auto_173342 ) ) ( not ( = ?auto_173348 ?auto_173349 ) ) ( not ( = ?auto_173343 ?auto_173346 ) ) ( not ( = ?auto_173345 ?auto_173346 ) ) ( not ( = ?auto_173342 ?auto_173346 ) ) ( not ( = ?auto_173352 ?auto_173348 ) ) ( not ( = ?auto_173352 ?auto_173349 ) ) ( not ( = ?auto_173343 ?auto_173344 ) ) ( not ( = ?auto_173345 ?auto_173344 ) ) ( not ( = ?auto_173342 ?auto_173344 ) ) ( not ( = ?auto_173346 ?auto_173344 ) ) ( not ( = ?auto_173350 ?auto_173352 ) ) ( not ( = ?auto_173350 ?auto_173348 ) ) ( not ( = ?auto_173350 ?auto_173349 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_173343 ?auto_173345 ?auto_173342 ?auto_173344 ?auto_173346 ?auto_173341 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_173448 - OBJ
      ?auto_173449 - OBJ
      ?auto_173450 - OBJ
      ?auto_173451 - OBJ
      ?auto_173452 - OBJ
      ?auto_173447 - LOCATION
    )
    :vars
    (
      ?auto_173456 - LOCATION
      ?auto_173457 - CITY
      ?auto_173458 - LOCATION
      ?auto_173454 - LOCATION
      ?auto_173455 - LOCATION
      ?auto_173453 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_173456 ?auto_173457 ) ( IN-CITY ?auto_173447 ?auto_173457 ) ( not ( = ?auto_173447 ?auto_173456 ) ) ( OBJ-AT ?auto_173450 ?auto_173456 ) ( IN-CITY ?auto_173458 ?auto_173457 ) ( not ( = ?auto_173447 ?auto_173458 ) ) ( OBJ-AT ?auto_173451 ?auto_173458 ) ( IN-CITY ?auto_173454 ?auto_173457 ) ( not ( = ?auto_173447 ?auto_173454 ) ) ( OBJ-AT ?auto_173448 ?auto_173454 ) ( IN-CITY ?auto_173455 ?auto_173457 ) ( not ( = ?auto_173447 ?auto_173455 ) ) ( OBJ-AT ?auto_173452 ?auto_173455 ) ( OBJ-AT ?auto_173449 ?auto_173455 ) ( TRUCK-AT ?auto_173453 ?auto_173447 ) ( not ( = ?auto_173449 ?auto_173452 ) ) ( not ( = ?auto_173449 ?auto_173448 ) ) ( not ( = ?auto_173452 ?auto_173448 ) ) ( not ( = ?auto_173454 ?auto_173455 ) ) ( not ( = ?auto_173449 ?auto_173451 ) ) ( not ( = ?auto_173452 ?auto_173451 ) ) ( not ( = ?auto_173448 ?auto_173451 ) ) ( not ( = ?auto_173458 ?auto_173454 ) ) ( not ( = ?auto_173458 ?auto_173455 ) ) ( not ( = ?auto_173449 ?auto_173450 ) ) ( not ( = ?auto_173452 ?auto_173450 ) ) ( not ( = ?auto_173448 ?auto_173450 ) ) ( not ( = ?auto_173451 ?auto_173450 ) ) ( not ( = ?auto_173456 ?auto_173458 ) ) ( not ( = ?auto_173456 ?auto_173454 ) ) ( not ( = ?auto_173456 ?auto_173455 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_173449 ?auto_173452 ?auto_173448 ?auto_173450 ?auto_173451 ?auto_173447 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_173606 - OBJ
      ?auto_173607 - OBJ
      ?auto_173608 - OBJ
      ?auto_173609 - OBJ
      ?auto_173610 - OBJ
      ?auto_173605 - LOCATION
    )
    :vars
    (
      ?auto_173614 - LOCATION
      ?auto_173615 - CITY
      ?auto_173616 - LOCATION
      ?auto_173612 - LOCATION
      ?auto_173613 - LOCATION
      ?auto_173611 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_173614 ?auto_173615 ) ( IN-CITY ?auto_173605 ?auto_173615 ) ( not ( = ?auto_173605 ?auto_173614 ) ) ( OBJ-AT ?auto_173610 ?auto_173614 ) ( IN-CITY ?auto_173616 ?auto_173615 ) ( not ( = ?auto_173605 ?auto_173616 ) ) ( OBJ-AT ?auto_173609 ?auto_173616 ) ( IN-CITY ?auto_173612 ?auto_173615 ) ( not ( = ?auto_173605 ?auto_173612 ) ) ( OBJ-AT ?auto_173606 ?auto_173612 ) ( IN-CITY ?auto_173613 ?auto_173615 ) ( not ( = ?auto_173605 ?auto_173613 ) ) ( OBJ-AT ?auto_173607 ?auto_173613 ) ( OBJ-AT ?auto_173608 ?auto_173613 ) ( TRUCK-AT ?auto_173611 ?auto_173605 ) ( not ( = ?auto_173608 ?auto_173607 ) ) ( not ( = ?auto_173608 ?auto_173606 ) ) ( not ( = ?auto_173607 ?auto_173606 ) ) ( not ( = ?auto_173612 ?auto_173613 ) ) ( not ( = ?auto_173608 ?auto_173609 ) ) ( not ( = ?auto_173607 ?auto_173609 ) ) ( not ( = ?auto_173606 ?auto_173609 ) ) ( not ( = ?auto_173616 ?auto_173612 ) ) ( not ( = ?auto_173616 ?auto_173613 ) ) ( not ( = ?auto_173608 ?auto_173610 ) ) ( not ( = ?auto_173607 ?auto_173610 ) ) ( not ( = ?auto_173606 ?auto_173610 ) ) ( not ( = ?auto_173609 ?auto_173610 ) ) ( not ( = ?auto_173614 ?auto_173616 ) ) ( not ( = ?auto_173614 ?auto_173612 ) ) ( not ( = ?auto_173614 ?auto_173613 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_173608 ?auto_173607 ?auto_173606 ?auto_173610 ?auto_173609 ?auto_173605 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_173657 - OBJ
      ?auto_173658 - OBJ
      ?auto_173659 - OBJ
      ?auto_173660 - OBJ
      ?auto_173661 - OBJ
      ?auto_173656 - LOCATION
    )
    :vars
    (
      ?auto_173665 - LOCATION
      ?auto_173666 - CITY
      ?auto_173667 - LOCATION
      ?auto_173663 - LOCATION
      ?auto_173664 - LOCATION
      ?auto_173662 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_173665 ?auto_173666 ) ( IN-CITY ?auto_173656 ?auto_173666 ) ( not ( = ?auto_173656 ?auto_173665 ) ) ( OBJ-AT ?auto_173660 ?auto_173665 ) ( IN-CITY ?auto_173667 ?auto_173666 ) ( not ( = ?auto_173656 ?auto_173667 ) ) ( OBJ-AT ?auto_173661 ?auto_173667 ) ( IN-CITY ?auto_173663 ?auto_173666 ) ( not ( = ?auto_173656 ?auto_173663 ) ) ( OBJ-AT ?auto_173657 ?auto_173663 ) ( IN-CITY ?auto_173664 ?auto_173666 ) ( not ( = ?auto_173656 ?auto_173664 ) ) ( OBJ-AT ?auto_173658 ?auto_173664 ) ( OBJ-AT ?auto_173659 ?auto_173664 ) ( TRUCK-AT ?auto_173662 ?auto_173656 ) ( not ( = ?auto_173659 ?auto_173658 ) ) ( not ( = ?auto_173659 ?auto_173657 ) ) ( not ( = ?auto_173658 ?auto_173657 ) ) ( not ( = ?auto_173663 ?auto_173664 ) ) ( not ( = ?auto_173659 ?auto_173661 ) ) ( not ( = ?auto_173658 ?auto_173661 ) ) ( not ( = ?auto_173657 ?auto_173661 ) ) ( not ( = ?auto_173667 ?auto_173663 ) ) ( not ( = ?auto_173667 ?auto_173664 ) ) ( not ( = ?auto_173659 ?auto_173660 ) ) ( not ( = ?auto_173658 ?auto_173660 ) ) ( not ( = ?auto_173657 ?auto_173660 ) ) ( not ( = ?auto_173661 ?auto_173660 ) ) ( not ( = ?auto_173665 ?auto_173667 ) ) ( not ( = ?auto_173665 ?auto_173663 ) ) ( not ( = ?auto_173665 ?auto_173664 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_173659 ?auto_173658 ?auto_173657 ?auto_173660 ?auto_173661 ?auto_173656 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_173926 - OBJ
      ?auto_173927 - OBJ
      ?auto_173928 - OBJ
      ?auto_173929 - OBJ
      ?auto_173930 - OBJ
      ?auto_173925 - LOCATION
    )
    :vars
    (
      ?auto_173934 - LOCATION
      ?auto_173935 - CITY
      ?auto_173936 - LOCATION
      ?auto_173932 - LOCATION
      ?auto_173933 - LOCATION
      ?auto_173931 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_173934 ?auto_173935 ) ( IN-CITY ?auto_173925 ?auto_173935 ) ( not ( = ?auto_173925 ?auto_173934 ) ) ( OBJ-AT ?auto_173930 ?auto_173934 ) ( IN-CITY ?auto_173936 ?auto_173935 ) ( not ( = ?auto_173925 ?auto_173936 ) ) ( OBJ-AT ?auto_173928 ?auto_173936 ) ( IN-CITY ?auto_173932 ?auto_173935 ) ( not ( = ?auto_173925 ?auto_173932 ) ) ( OBJ-AT ?auto_173926 ?auto_173932 ) ( IN-CITY ?auto_173933 ?auto_173935 ) ( not ( = ?auto_173925 ?auto_173933 ) ) ( OBJ-AT ?auto_173927 ?auto_173933 ) ( OBJ-AT ?auto_173929 ?auto_173933 ) ( TRUCK-AT ?auto_173931 ?auto_173925 ) ( not ( = ?auto_173929 ?auto_173927 ) ) ( not ( = ?auto_173929 ?auto_173926 ) ) ( not ( = ?auto_173927 ?auto_173926 ) ) ( not ( = ?auto_173932 ?auto_173933 ) ) ( not ( = ?auto_173929 ?auto_173928 ) ) ( not ( = ?auto_173927 ?auto_173928 ) ) ( not ( = ?auto_173926 ?auto_173928 ) ) ( not ( = ?auto_173936 ?auto_173932 ) ) ( not ( = ?auto_173936 ?auto_173933 ) ) ( not ( = ?auto_173929 ?auto_173930 ) ) ( not ( = ?auto_173927 ?auto_173930 ) ) ( not ( = ?auto_173926 ?auto_173930 ) ) ( not ( = ?auto_173928 ?auto_173930 ) ) ( not ( = ?auto_173934 ?auto_173936 ) ) ( not ( = ?auto_173934 ?auto_173932 ) ) ( not ( = ?auto_173934 ?auto_173933 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_173929 ?auto_173927 ?auto_173926 ?auto_173930 ?auto_173928 ?auto_173925 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_173977 - OBJ
      ?auto_173978 - OBJ
      ?auto_173979 - OBJ
      ?auto_173980 - OBJ
      ?auto_173981 - OBJ
      ?auto_173976 - LOCATION
    )
    :vars
    (
      ?auto_173985 - LOCATION
      ?auto_173986 - CITY
      ?auto_173987 - LOCATION
      ?auto_173983 - LOCATION
      ?auto_173984 - LOCATION
      ?auto_173982 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_173985 ?auto_173986 ) ( IN-CITY ?auto_173976 ?auto_173986 ) ( not ( = ?auto_173976 ?auto_173985 ) ) ( OBJ-AT ?auto_173980 ?auto_173985 ) ( IN-CITY ?auto_173987 ?auto_173986 ) ( not ( = ?auto_173976 ?auto_173987 ) ) ( OBJ-AT ?auto_173979 ?auto_173987 ) ( IN-CITY ?auto_173983 ?auto_173986 ) ( not ( = ?auto_173976 ?auto_173983 ) ) ( OBJ-AT ?auto_173977 ?auto_173983 ) ( IN-CITY ?auto_173984 ?auto_173986 ) ( not ( = ?auto_173976 ?auto_173984 ) ) ( OBJ-AT ?auto_173978 ?auto_173984 ) ( OBJ-AT ?auto_173981 ?auto_173984 ) ( TRUCK-AT ?auto_173982 ?auto_173976 ) ( not ( = ?auto_173981 ?auto_173978 ) ) ( not ( = ?auto_173981 ?auto_173977 ) ) ( not ( = ?auto_173978 ?auto_173977 ) ) ( not ( = ?auto_173983 ?auto_173984 ) ) ( not ( = ?auto_173981 ?auto_173979 ) ) ( not ( = ?auto_173978 ?auto_173979 ) ) ( not ( = ?auto_173977 ?auto_173979 ) ) ( not ( = ?auto_173987 ?auto_173983 ) ) ( not ( = ?auto_173987 ?auto_173984 ) ) ( not ( = ?auto_173981 ?auto_173980 ) ) ( not ( = ?auto_173978 ?auto_173980 ) ) ( not ( = ?auto_173977 ?auto_173980 ) ) ( not ( = ?auto_173979 ?auto_173980 ) ) ( not ( = ?auto_173985 ?auto_173987 ) ) ( not ( = ?auto_173985 ?auto_173983 ) ) ( not ( = ?auto_173985 ?auto_173984 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_173981 ?auto_173978 ?auto_173977 ?auto_173980 ?auto_173979 ?auto_173976 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_174080 - OBJ
      ?auto_174081 - OBJ
      ?auto_174082 - OBJ
      ?auto_174083 - OBJ
      ?auto_174084 - OBJ
      ?auto_174079 - LOCATION
    )
    :vars
    (
      ?auto_174088 - LOCATION
      ?auto_174089 - CITY
      ?auto_174090 - LOCATION
      ?auto_174086 - LOCATION
      ?auto_174087 - LOCATION
      ?auto_174085 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_174088 ?auto_174089 ) ( IN-CITY ?auto_174079 ?auto_174089 ) ( not ( = ?auto_174079 ?auto_174088 ) ) ( OBJ-AT ?auto_174082 ?auto_174088 ) ( IN-CITY ?auto_174090 ?auto_174089 ) ( not ( = ?auto_174079 ?auto_174090 ) ) ( OBJ-AT ?auto_174084 ?auto_174090 ) ( IN-CITY ?auto_174086 ?auto_174089 ) ( not ( = ?auto_174079 ?auto_174086 ) ) ( OBJ-AT ?auto_174080 ?auto_174086 ) ( IN-CITY ?auto_174087 ?auto_174089 ) ( not ( = ?auto_174079 ?auto_174087 ) ) ( OBJ-AT ?auto_174081 ?auto_174087 ) ( OBJ-AT ?auto_174083 ?auto_174087 ) ( TRUCK-AT ?auto_174085 ?auto_174079 ) ( not ( = ?auto_174083 ?auto_174081 ) ) ( not ( = ?auto_174083 ?auto_174080 ) ) ( not ( = ?auto_174081 ?auto_174080 ) ) ( not ( = ?auto_174086 ?auto_174087 ) ) ( not ( = ?auto_174083 ?auto_174084 ) ) ( not ( = ?auto_174081 ?auto_174084 ) ) ( not ( = ?auto_174080 ?auto_174084 ) ) ( not ( = ?auto_174090 ?auto_174086 ) ) ( not ( = ?auto_174090 ?auto_174087 ) ) ( not ( = ?auto_174083 ?auto_174082 ) ) ( not ( = ?auto_174081 ?auto_174082 ) ) ( not ( = ?auto_174080 ?auto_174082 ) ) ( not ( = ?auto_174084 ?auto_174082 ) ) ( not ( = ?auto_174088 ?auto_174090 ) ) ( not ( = ?auto_174088 ?auto_174086 ) ) ( not ( = ?auto_174088 ?auto_174087 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_174083 ?auto_174081 ?auto_174080 ?auto_174082 ?auto_174084 ?auto_174079 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_174241 - OBJ
      ?auto_174242 - OBJ
      ?auto_174243 - OBJ
      ?auto_174244 - OBJ
      ?auto_174245 - OBJ
      ?auto_174240 - LOCATION
    )
    :vars
    (
      ?auto_174249 - LOCATION
      ?auto_174250 - CITY
      ?auto_174251 - LOCATION
      ?auto_174247 - LOCATION
      ?auto_174248 - LOCATION
      ?auto_174246 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_174249 ?auto_174250 ) ( IN-CITY ?auto_174240 ?auto_174250 ) ( not ( = ?auto_174240 ?auto_174249 ) ) ( OBJ-AT ?auto_174243 ?auto_174249 ) ( IN-CITY ?auto_174251 ?auto_174250 ) ( not ( = ?auto_174240 ?auto_174251 ) ) ( OBJ-AT ?auto_174244 ?auto_174251 ) ( IN-CITY ?auto_174247 ?auto_174250 ) ( not ( = ?auto_174240 ?auto_174247 ) ) ( OBJ-AT ?auto_174241 ?auto_174247 ) ( IN-CITY ?auto_174248 ?auto_174250 ) ( not ( = ?auto_174240 ?auto_174248 ) ) ( OBJ-AT ?auto_174242 ?auto_174248 ) ( OBJ-AT ?auto_174245 ?auto_174248 ) ( TRUCK-AT ?auto_174246 ?auto_174240 ) ( not ( = ?auto_174245 ?auto_174242 ) ) ( not ( = ?auto_174245 ?auto_174241 ) ) ( not ( = ?auto_174242 ?auto_174241 ) ) ( not ( = ?auto_174247 ?auto_174248 ) ) ( not ( = ?auto_174245 ?auto_174244 ) ) ( not ( = ?auto_174242 ?auto_174244 ) ) ( not ( = ?auto_174241 ?auto_174244 ) ) ( not ( = ?auto_174251 ?auto_174247 ) ) ( not ( = ?auto_174251 ?auto_174248 ) ) ( not ( = ?auto_174245 ?auto_174243 ) ) ( not ( = ?auto_174242 ?auto_174243 ) ) ( not ( = ?auto_174241 ?auto_174243 ) ) ( not ( = ?auto_174244 ?auto_174243 ) ) ( not ( = ?auto_174249 ?auto_174251 ) ) ( not ( = ?auto_174249 ?auto_174247 ) ) ( not ( = ?auto_174249 ?auto_174248 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_174245 ?auto_174242 ?auto_174241 ?auto_174243 ?auto_174244 ?auto_174240 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_175229 - OBJ
      ?auto_175230 - OBJ
      ?auto_175231 - OBJ
      ?auto_175232 - OBJ
      ?auto_175233 - OBJ
      ?auto_175228 - LOCATION
    )
    :vars
    (
      ?auto_175237 - LOCATION
      ?auto_175238 - CITY
      ?auto_175239 - LOCATION
      ?auto_175235 - LOCATION
      ?auto_175236 - LOCATION
      ?auto_175234 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175237 ?auto_175238 ) ( IN-CITY ?auto_175228 ?auto_175238 ) ( not ( = ?auto_175228 ?auto_175237 ) ) ( OBJ-AT ?auto_175233 ?auto_175237 ) ( IN-CITY ?auto_175239 ?auto_175238 ) ( not ( = ?auto_175228 ?auto_175239 ) ) ( OBJ-AT ?auto_175230 ?auto_175239 ) ( IN-CITY ?auto_175235 ?auto_175238 ) ( not ( = ?auto_175228 ?auto_175235 ) ) ( OBJ-AT ?auto_175229 ?auto_175235 ) ( IN-CITY ?auto_175236 ?auto_175238 ) ( not ( = ?auto_175228 ?auto_175236 ) ) ( OBJ-AT ?auto_175232 ?auto_175236 ) ( OBJ-AT ?auto_175231 ?auto_175236 ) ( TRUCK-AT ?auto_175234 ?auto_175228 ) ( not ( = ?auto_175231 ?auto_175232 ) ) ( not ( = ?auto_175231 ?auto_175229 ) ) ( not ( = ?auto_175232 ?auto_175229 ) ) ( not ( = ?auto_175235 ?auto_175236 ) ) ( not ( = ?auto_175231 ?auto_175230 ) ) ( not ( = ?auto_175232 ?auto_175230 ) ) ( not ( = ?auto_175229 ?auto_175230 ) ) ( not ( = ?auto_175239 ?auto_175235 ) ) ( not ( = ?auto_175239 ?auto_175236 ) ) ( not ( = ?auto_175231 ?auto_175233 ) ) ( not ( = ?auto_175232 ?auto_175233 ) ) ( not ( = ?auto_175229 ?auto_175233 ) ) ( not ( = ?auto_175230 ?auto_175233 ) ) ( not ( = ?auto_175237 ?auto_175239 ) ) ( not ( = ?auto_175237 ?auto_175235 ) ) ( not ( = ?auto_175237 ?auto_175236 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_175231 ?auto_175232 ?auto_175229 ?auto_175233 ?auto_175230 ?auto_175228 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_175280 - OBJ
      ?auto_175281 - OBJ
      ?auto_175282 - OBJ
      ?auto_175283 - OBJ
      ?auto_175284 - OBJ
      ?auto_175279 - LOCATION
    )
    :vars
    (
      ?auto_175288 - LOCATION
      ?auto_175289 - CITY
      ?auto_175290 - LOCATION
      ?auto_175286 - LOCATION
      ?auto_175287 - LOCATION
      ?auto_175285 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175288 ?auto_175289 ) ( IN-CITY ?auto_175279 ?auto_175289 ) ( not ( = ?auto_175279 ?auto_175288 ) ) ( OBJ-AT ?auto_175283 ?auto_175288 ) ( IN-CITY ?auto_175290 ?auto_175289 ) ( not ( = ?auto_175279 ?auto_175290 ) ) ( OBJ-AT ?auto_175281 ?auto_175290 ) ( IN-CITY ?auto_175286 ?auto_175289 ) ( not ( = ?auto_175279 ?auto_175286 ) ) ( OBJ-AT ?auto_175280 ?auto_175286 ) ( IN-CITY ?auto_175287 ?auto_175289 ) ( not ( = ?auto_175279 ?auto_175287 ) ) ( OBJ-AT ?auto_175284 ?auto_175287 ) ( OBJ-AT ?auto_175282 ?auto_175287 ) ( TRUCK-AT ?auto_175285 ?auto_175279 ) ( not ( = ?auto_175282 ?auto_175284 ) ) ( not ( = ?auto_175282 ?auto_175280 ) ) ( not ( = ?auto_175284 ?auto_175280 ) ) ( not ( = ?auto_175286 ?auto_175287 ) ) ( not ( = ?auto_175282 ?auto_175281 ) ) ( not ( = ?auto_175284 ?auto_175281 ) ) ( not ( = ?auto_175280 ?auto_175281 ) ) ( not ( = ?auto_175290 ?auto_175286 ) ) ( not ( = ?auto_175290 ?auto_175287 ) ) ( not ( = ?auto_175282 ?auto_175283 ) ) ( not ( = ?auto_175284 ?auto_175283 ) ) ( not ( = ?auto_175280 ?auto_175283 ) ) ( not ( = ?auto_175281 ?auto_175283 ) ) ( not ( = ?auto_175288 ?auto_175290 ) ) ( not ( = ?auto_175288 ?auto_175286 ) ) ( not ( = ?auto_175288 ?auto_175287 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_175282 ?auto_175284 ?auto_175280 ?auto_175283 ?auto_175281 ?auto_175279 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_175331 - OBJ
      ?auto_175332 - OBJ
      ?auto_175333 - OBJ
      ?auto_175334 - OBJ
      ?auto_175335 - OBJ
      ?auto_175330 - LOCATION
    )
    :vars
    (
      ?auto_175339 - LOCATION
      ?auto_175340 - CITY
      ?auto_175341 - LOCATION
      ?auto_175337 - LOCATION
      ?auto_175338 - LOCATION
      ?auto_175336 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175339 ?auto_175340 ) ( IN-CITY ?auto_175330 ?auto_175340 ) ( not ( = ?auto_175330 ?auto_175339 ) ) ( OBJ-AT ?auto_175335 ?auto_175339 ) ( IN-CITY ?auto_175341 ?auto_175340 ) ( not ( = ?auto_175330 ?auto_175341 ) ) ( OBJ-AT ?auto_175332 ?auto_175341 ) ( IN-CITY ?auto_175337 ?auto_175340 ) ( not ( = ?auto_175330 ?auto_175337 ) ) ( OBJ-AT ?auto_175331 ?auto_175337 ) ( IN-CITY ?auto_175338 ?auto_175340 ) ( not ( = ?auto_175330 ?auto_175338 ) ) ( OBJ-AT ?auto_175333 ?auto_175338 ) ( OBJ-AT ?auto_175334 ?auto_175338 ) ( TRUCK-AT ?auto_175336 ?auto_175330 ) ( not ( = ?auto_175334 ?auto_175333 ) ) ( not ( = ?auto_175334 ?auto_175331 ) ) ( not ( = ?auto_175333 ?auto_175331 ) ) ( not ( = ?auto_175337 ?auto_175338 ) ) ( not ( = ?auto_175334 ?auto_175332 ) ) ( not ( = ?auto_175333 ?auto_175332 ) ) ( not ( = ?auto_175331 ?auto_175332 ) ) ( not ( = ?auto_175341 ?auto_175337 ) ) ( not ( = ?auto_175341 ?auto_175338 ) ) ( not ( = ?auto_175334 ?auto_175335 ) ) ( not ( = ?auto_175333 ?auto_175335 ) ) ( not ( = ?auto_175331 ?auto_175335 ) ) ( not ( = ?auto_175332 ?auto_175335 ) ) ( not ( = ?auto_175339 ?auto_175341 ) ) ( not ( = ?auto_175339 ?auto_175337 ) ) ( not ( = ?auto_175339 ?auto_175338 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_175334 ?auto_175333 ?auto_175331 ?auto_175335 ?auto_175332 ?auto_175330 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_175382 - OBJ
      ?auto_175383 - OBJ
      ?auto_175384 - OBJ
      ?auto_175385 - OBJ
      ?auto_175386 - OBJ
      ?auto_175381 - LOCATION
    )
    :vars
    (
      ?auto_175390 - LOCATION
      ?auto_175391 - CITY
      ?auto_175392 - LOCATION
      ?auto_175388 - LOCATION
      ?auto_175389 - LOCATION
      ?auto_175387 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175390 ?auto_175391 ) ( IN-CITY ?auto_175381 ?auto_175391 ) ( not ( = ?auto_175381 ?auto_175390 ) ) ( OBJ-AT ?auto_175385 ?auto_175390 ) ( IN-CITY ?auto_175392 ?auto_175391 ) ( not ( = ?auto_175381 ?auto_175392 ) ) ( OBJ-AT ?auto_175383 ?auto_175392 ) ( IN-CITY ?auto_175388 ?auto_175391 ) ( not ( = ?auto_175381 ?auto_175388 ) ) ( OBJ-AT ?auto_175382 ?auto_175388 ) ( IN-CITY ?auto_175389 ?auto_175391 ) ( not ( = ?auto_175381 ?auto_175389 ) ) ( OBJ-AT ?auto_175384 ?auto_175389 ) ( OBJ-AT ?auto_175386 ?auto_175389 ) ( TRUCK-AT ?auto_175387 ?auto_175381 ) ( not ( = ?auto_175386 ?auto_175384 ) ) ( not ( = ?auto_175386 ?auto_175382 ) ) ( not ( = ?auto_175384 ?auto_175382 ) ) ( not ( = ?auto_175388 ?auto_175389 ) ) ( not ( = ?auto_175386 ?auto_175383 ) ) ( not ( = ?auto_175384 ?auto_175383 ) ) ( not ( = ?auto_175382 ?auto_175383 ) ) ( not ( = ?auto_175392 ?auto_175388 ) ) ( not ( = ?auto_175392 ?auto_175389 ) ) ( not ( = ?auto_175386 ?auto_175385 ) ) ( not ( = ?auto_175384 ?auto_175385 ) ) ( not ( = ?auto_175382 ?auto_175385 ) ) ( not ( = ?auto_175383 ?auto_175385 ) ) ( not ( = ?auto_175390 ?auto_175392 ) ) ( not ( = ?auto_175390 ?auto_175388 ) ) ( not ( = ?auto_175390 ?auto_175389 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_175386 ?auto_175384 ?auto_175382 ?auto_175385 ?auto_175383 ?auto_175381 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_175703 - OBJ
      ?auto_175704 - OBJ
      ?auto_175705 - OBJ
      ?auto_175706 - OBJ
      ?auto_175707 - OBJ
      ?auto_175702 - LOCATION
    )
    :vars
    (
      ?auto_175711 - LOCATION
      ?auto_175712 - CITY
      ?auto_175713 - LOCATION
      ?auto_175709 - LOCATION
      ?auto_175710 - LOCATION
      ?auto_175708 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175711 ?auto_175712 ) ( IN-CITY ?auto_175702 ?auto_175712 ) ( not ( = ?auto_175702 ?auto_175711 ) ) ( OBJ-AT ?auto_175705 ?auto_175711 ) ( IN-CITY ?auto_175713 ?auto_175712 ) ( not ( = ?auto_175702 ?auto_175713 ) ) ( OBJ-AT ?auto_175704 ?auto_175713 ) ( IN-CITY ?auto_175709 ?auto_175712 ) ( not ( = ?auto_175702 ?auto_175709 ) ) ( OBJ-AT ?auto_175703 ?auto_175709 ) ( IN-CITY ?auto_175710 ?auto_175712 ) ( not ( = ?auto_175702 ?auto_175710 ) ) ( OBJ-AT ?auto_175707 ?auto_175710 ) ( OBJ-AT ?auto_175706 ?auto_175710 ) ( TRUCK-AT ?auto_175708 ?auto_175702 ) ( not ( = ?auto_175706 ?auto_175707 ) ) ( not ( = ?auto_175706 ?auto_175703 ) ) ( not ( = ?auto_175707 ?auto_175703 ) ) ( not ( = ?auto_175709 ?auto_175710 ) ) ( not ( = ?auto_175706 ?auto_175704 ) ) ( not ( = ?auto_175707 ?auto_175704 ) ) ( not ( = ?auto_175703 ?auto_175704 ) ) ( not ( = ?auto_175713 ?auto_175709 ) ) ( not ( = ?auto_175713 ?auto_175710 ) ) ( not ( = ?auto_175706 ?auto_175705 ) ) ( not ( = ?auto_175707 ?auto_175705 ) ) ( not ( = ?auto_175703 ?auto_175705 ) ) ( not ( = ?auto_175704 ?auto_175705 ) ) ( not ( = ?auto_175711 ?auto_175713 ) ) ( not ( = ?auto_175711 ?auto_175709 ) ) ( not ( = ?auto_175711 ?auto_175710 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_175706 ?auto_175707 ?auto_175703 ?auto_175705 ?auto_175704 ?auto_175702 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_175754 - OBJ
      ?auto_175755 - OBJ
      ?auto_175756 - OBJ
      ?auto_175757 - OBJ
      ?auto_175758 - OBJ
      ?auto_175753 - LOCATION
    )
    :vars
    (
      ?auto_175762 - LOCATION
      ?auto_175763 - CITY
      ?auto_175764 - LOCATION
      ?auto_175760 - LOCATION
      ?auto_175761 - LOCATION
      ?auto_175759 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_175762 ?auto_175763 ) ( IN-CITY ?auto_175753 ?auto_175763 ) ( not ( = ?auto_175753 ?auto_175762 ) ) ( OBJ-AT ?auto_175756 ?auto_175762 ) ( IN-CITY ?auto_175764 ?auto_175763 ) ( not ( = ?auto_175753 ?auto_175764 ) ) ( OBJ-AT ?auto_175755 ?auto_175764 ) ( IN-CITY ?auto_175760 ?auto_175763 ) ( not ( = ?auto_175753 ?auto_175760 ) ) ( OBJ-AT ?auto_175754 ?auto_175760 ) ( IN-CITY ?auto_175761 ?auto_175763 ) ( not ( = ?auto_175753 ?auto_175761 ) ) ( OBJ-AT ?auto_175757 ?auto_175761 ) ( OBJ-AT ?auto_175758 ?auto_175761 ) ( TRUCK-AT ?auto_175759 ?auto_175753 ) ( not ( = ?auto_175758 ?auto_175757 ) ) ( not ( = ?auto_175758 ?auto_175754 ) ) ( not ( = ?auto_175757 ?auto_175754 ) ) ( not ( = ?auto_175760 ?auto_175761 ) ) ( not ( = ?auto_175758 ?auto_175755 ) ) ( not ( = ?auto_175757 ?auto_175755 ) ) ( not ( = ?auto_175754 ?auto_175755 ) ) ( not ( = ?auto_175764 ?auto_175760 ) ) ( not ( = ?auto_175764 ?auto_175761 ) ) ( not ( = ?auto_175758 ?auto_175756 ) ) ( not ( = ?auto_175757 ?auto_175756 ) ) ( not ( = ?auto_175754 ?auto_175756 ) ) ( not ( = ?auto_175755 ?auto_175756 ) ) ( not ( = ?auto_175762 ?auto_175764 ) ) ( not ( = ?auto_175762 ?auto_175760 ) ) ( not ( = ?auto_175762 ?auto_175761 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_175758 ?auto_175757 ?auto_175754 ?auto_175756 ?auto_175755 ?auto_175753 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_176129 - OBJ
      ?auto_176130 - OBJ
      ?auto_176131 - OBJ
      ?auto_176132 - OBJ
      ?auto_176133 - OBJ
      ?auto_176128 - LOCATION
    )
    :vars
    (
      ?auto_176137 - LOCATION
      ?auto_176138 - CITY
      ?auto_176139 - LOCATION
      ?auto_176135 - LOCATION
      ?auto_176136 - LOCATION
      ?auto_176134 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176137 ?auto_176138 ) ( IN-CITY ?auto_176128 ?auto_176138 ) ( not ( = ?auto_176128 ?auto_176137 ) ) ( OBJ-AT ?auto_176130 ?auto_176137 ) ( IN-CITY ?auto_176139 ?auto_176138 ) ( not ( = ?auto_176128 ?auto_176139 ) ) ( OBJ-AT ?auto_176133 ?auto_176139 ) ( IN-CITY ?auto_176135 ?auto_176138 ) ( not ( = ?auto_176128 ?auto_176135 ) ) ( OBJ-AT ?auto_176129 ?auto_176135 ) ( IN-CITY ?auto_176136 ?auto_176138 ) ( not ( = ?auto_176128 ?auto_176136 ) ) ( OBJ-AT ?auto_176132 ?auto_176136 ) ( OBJ-AT ?auto_176131 ?auto_176136 ) ( TRUCK-AT ?auto_176134 ?auto_176128 ) ( not ( = ?auto_176131 ?auto_176132 ) ) ( not ( = ?auto_176131 ?auto_176129 ) ) ( not ( = ?auto_176132 ?auto_176129 ) ) ( not ( = ?auto_176135 ?auto_176136 ) ) ( not ( = ?auto_176131 ?auto_176133 ) ) ( not ( = ?auto_176132 ?auto_176133 ) ) ( not ( = ?auto_176129 ?auto_176133 ) ) ( not ( = ?auto_176139 ?auto_176135 ) ) ( not ( = ?auto_176139 ?auto_176136 ) ) ( not ( = ?auto_176131 ?auto_176130 ) ) ( not ( = ?auto_176132 ?auto_176130 ) ) ( not ( = ?auto_176129 ?auto_176130 ) ) ( not ( = ?auto_176133 ?auto_176130 ) ) ( not ( = ?auto_176137 ?auto_176139 ) ) ( not ( = ?auto_176137 ?auto_176135 ) ) ( not ( = ?auto_176137 ?auto_176136 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_176131 ?auto_176132 ?auto_176129 ?auto_176130 ?auto_176133 ?auto_176128 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_176235 - OBJ
      ?auto_176236 - OBJ
      ?auto_176237 - OBJ
      ?auto_176238 - OBJ
      ?auto_176239 - OBJ
      ?auto_176234 - LOCATION
    )
    :vars
    (
      ?auto_176243 - LOCATION
      ?auto_176244 - CITY
      ?auto_176245 - LOCATION
      ?auto_176241 - LOCATION
      ?auto_176242 - LOCATION
      ?auto_176240 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176243 ?auto_176244 ) ( IN-CITY ?auto_176234 ?auto_176244 ) ( not ( = ?auto_176234 ?auto_176243 ) ) ( OBJ-AT ?auto_176236 ?auto_176243 ) ( IN-CITY ?auto_176245 ?auto_176244 ) ( not ( = ?auto_176234 ?auto_176245 ) ) ( OBJ-AT ?auto_176238 ?auto_176245 ) ( IN-CITY ?auto_176241 ?auto_176244 ) ( not ( = ?auto_176234 ?auto_176241 ) ) ( OBJ-AT ?auto_176235 ?auto_176241 ) ( IN-CITY ?auto_176242 ?auto_176244 ) ( not ( = ?auto_176234 ?auto_176242 ) ) ( OBJ-AT ?auto_176239 ?auto_176242 ) ( OBJ-AT ?auto_176237 ?auto_176242 ) ( TRUCK-AT ?auto_176240 ?auto_176234 ) ( not ( = ?auto_176237 ?auto_176239 ) ) ( not ( = ?auto_176237 ?auto_176235 ) ) ( not ( = ?auto_176239 ?auto_176235 ) ) ( not ( = ?auto_176241 ?auto_176242 ) ) ( not ( = ?auto_176237 ?auto_176238 ) ) ( not ( = ?auto_176239 ?auto_176238 ) ) ( not ( = ?auto_176235 ?auto_176238 ) ) ( not ( = ?auto_176245 ?auto_176241 ) ) ( not ( = ?auto_176245 ?auto_176242 ) ) ( not ( = ?auto_176237 ?auto_176236 ) ) ( not ( = ?auto_176239 ?auto_176236 ) ) ( not ( = ?auto_176235 ?auto_176236 ) ) ( not ( = ?auto_176238 ?auto_176236 ) ) ( not ( = ?auto_176243 ?auto_176245 ) ) ( not ( = ?auto_176243 ?auto_176241 ) ) ( not ( = ?auto_176243 ?auto_176242 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_176237 ?auto_176239 ?auto_176235 ?auto_176236 ?auto_176238 ?auto_176234 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_176393 - OBJ
      ?auto_176394 - OBJ
      ?auto_176395 - OBJ
      ?auto_176396 - OBJ
      ?auto_176397 - OBJ
      ?auto_176392 - LOCATION
    )
    :vars
    (
      ?auto_176401 - LOCATION
      ?auto_176402 - CITY
      ?auto_176403 - LOCATION
      ?auto_176399 - LOCATION
      ?auto_176400 - LOCATION
      ?auto_176398 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176401 ?auto_176402 ) ( IN-CITY ?auto_176392 ?auto_176402 ) ( not ( = ?auto_176392 ?auto_176401 ) ) ( OBJ-AT ?auto_176394 ?auto_176401 ) ( IN-CITY ?auto_176403 ?auto_176402 ) ( not ( = ?auto_176392 ?auto_176403 ) ) ( OBJ-AT ?auto_176397 ?auto_176403 ) ( IN-CITY ?auto_176399 ?auto_176402 ) ( not ( = ?auto_176392 ?auto_176399 ) ) ( OBJ-AT ?auto_176393 ?auto_176399 ) ( IN-CITY ?auto_176400 ?auto_176402 ) ( not ( = ?auto_176392 ?auto_176400 ) ) ( OBJ-AT ?auto_176395 ?auto_176400 ) ( OBJ-AT ?auto_176396 ?auto_176400 ) ( TRUCK-AT ?auto_176398 ?auto_176392 ) ( not ( = ?auto_176396 ?auto_176395 ) ) ( not ( = ?auto_176396 ?auto_176393 ) ) ( not ( = ?auto_176395 ?auto_176393 ) ) ( not ( = ?auto_176399 ?auto_176400 ) ) ( not ( = ?auto_176396 ?auto_176397 ) ) ( not ( = ?auto_176395 ?auto_176397 ) ) ( not ( = ?auto_176393 ?auto_176397 ) ) ( not ( = ?auto_176403 ?auto_176399 ) ) ( not ( = ?auto_176403 ?auto_176400 ) ) ( not ( = ?auto_176396 ?auto_176394 ) ) ( not ( = ?auto_176395 ?auto_176394 ) ) ( not ( = ?auto_176393 ?auto_176394 ) ) ( not ( = ?auto_176397 ?auto_176394 ) ) ( not ( = ?auto_176401 ?auto_176403 ) ) ( not ( = ?auto_176401 ?auto_176399 ) ) ( not ( = ?auto_176401 ?auto_176400 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_176396 ?auto_176395 ?auto_176393 ?auto_176394 ?auto_176397 ?auto_176392 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_176554 - OBJ
      ?auto_176555 - OBJ
      ?auto_176556 - OBJ
      ?auto_176557 - OBJ
      ?auto_176558 - OBJ
      ?auto_176553 - LOCATION
    )
    :vars
    (
      ?auto_176562 - LOCATION
      ?auto_176563 - CITY
      ?auto_176564 - LOCATION
      ?auto_176560 - LOCATION
      ?auto_176561 - LOCATION
      ?auto_176559 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_176562 ?auto_176563 ) ( IN-CITY ?auto_176553 ?auto_176563 ) ( not ( = ?auto_176553 ?auto_176562 ) ) ( OBJ-AT ?auto_176555 ?auto_176562 ) ( IN-CITY ?auto_176564 ?auto_176563 ) ( not ( = ?auto_176553 ?auto_176564 ) ) ( OBJ-AT ?auto_176557 ?auto_176564 ) ( IN-CITY ?auto_176560 ?auto_176563 ) ( not ( = ?auto_176553 ?auto_176560 ) ) ( OBJ-AT ?auto_176554 ?auto_176560 ) ( IN-CITY ?auto_176561 ?auto_176563 ) ( not ( = ?auto_176553 ?auto_176561 ) ) ( OBJ-AT ?auto_176556 ?auto_176561 ) ( OBJ-AT ?auto_176558 ?auto_176561 ) ( TRUCK-AT ?auto_176559 ?auto_176553 ) ( not ( = ?auto_176558 ?auto_176556 ) ) ( not ( = ?auto_176558 ?auto_176554 ) ) ( not ( = ?auto_176556 ?auto_176554 ) ) ( not ( = ?auto_176560 ?auto_176561 ) ) ( not ( = ?auto_176558 ?auto_176557 ) ) ( not ( = ?auto_176556 ?auto_176557 ) ) ( not ( = ?auto_176554 ?auto_176557 ) ) ( not ( = ?auto_176564 ?auto_176560 ) ) ( not ( = ?auto_176564 ?auto_176561 ) ) ( not ( = ?auto_176558 ?auto_176555 ) ) ( not ( = ?auto_176556 ?auto_176555 ) ) ( not ( = ?auto_176554 ?auto_176555 ) ) ( not ( = ?auto_176557 ?auto_176555 ) ) ( not ( = ?auto_176562 ?auto_176564 ) ) ( not ( = ?auto_176562 ?auto_176560 ) ) ( not ( = ?auto_176562 ?auto_176561 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_176558 ?auto_176556 ?auto_176554 ?auto_176555 ?auto_176557 ?auto_176553 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_177047 - OBJ
      ?auto_177048 - OBJ
      ?auto_177049 - OBJ
      ?auto_177050 - OBJ
      ?auto_177051 - OBJ
      ?auto_177046 - LOCATION
    )
    :vars
    (
      ?auto_177055 - LOCATION
      ?auto_177056 - CITY
      ?auto_177057 - LOCATION
      ?auto_177053 - LOCATION
      ?auto_177054 - LOCATION
      ?auto_177052 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177055 ?auto_177056 ) ( IN-CITY ?auto_177046 ?auto_177056 ) ( not ( = ?auto_177046 ?auto_177055 ) ) ( OBJ-AT ?auto_177048 ?auto_177055 ) ( IN-CITY ?auto_177057 ?auto_177056 ) ( not ( = ?auto_177046 ?auto_177057 ) ) ( OBJ-AT ?auto_177049 ?auto_177057 ) ( IN-CITY ?auto_177053 ?auto_177056 ) ( not ( = ?auto_177046 ?auto_177053 ) ) ( OBJ-AT ?auto_177047 ?auto_177053 ) ( IN-CITY ?auto_177054 ?auto_177056 ) ( not ( = ?auto_177046 ?auto_177054 ) ) ( OBJ-AT ?auto_177051 ?auto_177054 ) ( OBJ-AT ?auto_177050 ?auto_177054 ) ( TRUCK-AT ?auto_177052 ?auto_177046 ) ( not ( = ?auto_177050 ?auto_177051 ) ) ( not ( = ?auto_177050 ?auto_177047 ) ) ( not ( = ?auto_177051 ?auto_177047 ) ) ( not ( = ?auto_177053 ?auto_177054 ) ) ( not ( = ?auto_177050 ?auto_177049 ) ) ( not ( = ?auto_177051 ?auto_177049 ) ) ( not ( = ?auto_177047 ?auto_177049 ) ) ( not ( = ?auto_177057 ?auto_177053 ) ) ( not ( = ?auto_177057 ?auto_177054 ) ) ( not ( = ?auto_177050 ?auto_177048 ) ) ( not ( = ?auto_177051 ?auto_177048 ) ) ( not ( = ?auto_177047 ?auto_177048 ) ) ( not ( = ?auto_177049 ?auto_177048 ) ) ( not ( = ?auto_177055 ?auto_177057 ) ) ( not ( = ?auto_177055 ?auto_177053 ) ) ( not ( = ?auto_177055 ?auto_177054 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_177050 ?auto_177051 ?auto_177047 ?auto_177048 ?auto_177049 ?auto_177046 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_177098 - OBJ
      ?auto_177099 - OBJ
      ?auto_177100 - OBJ
      ?auto_177101 - OBJ
      ?auto_177102 - OBJ
      ?auto_177097 - LOCATION
    )
    :vars
    (
      ?auto_177106 - LOCATION
      ?auto_177107 - CITY
      ?auto_177108 - LOCATION
      ?auto_177104 - LOCATION
      ?auto_177105 - LOCATION
      ?auto_177103 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177106 ?auto_177107 ) ( IN-CITY ?auto_177097 ?auto_177107 ) ( not ( = ?auto_177097 ?auto_177106 ) ) ( OBJ-AT ?auto_177099 ?auto_177106 ) ( IN-CITY ?auto_177108 ?auto_177107 ) ( not ( = ?auto_177097 ?auto_177108 ) ) ( OBJ-AT ?auto_177100 ?auto_177108 ) ( IN-CITY ?auto_177104 ?auto_177107 ) ( not ( = ?auto_177097 ?auto_177104 ) ) ( OBJ-AT ?auto_177098 ?auto_177104 ) ( IN-CITY ?auto_177105 ?auto_177107 ) ( not ( = ?auto_177097 ?auto_177105 ) ) ( OBJ-AT ?auto_177101 ?auto_177105 ) ( OBJ-AT ?auto_177102 ?auto_177105 ) ( TRUCK-AT ?auto_177103 ?auto_177097 ) ( not ( = ?auto_177102 ?auto_177101 ) ) ( not ( = ?auto_177102 ?auto_177098 ) ) ( not ( = ?auto_177101 ?auto_177098 ) ) ( not ( = ?auto_177104 ?auto_177105 ) ) ( not ( = ?auto_177102 ?auto_177100 ) ) ( not ( = ?auto_177101 ?auto_177100 ) ) ( not ( = ?auto_177098 ?auto_177100 ) ) ( not ( = ?auto_177108 ?auto_177104 ) ) ( not ( = ?auto_177108 ?auto_177105 ) ) ( not ( = ?auto_177102 ?auto_177099 ) ) ( not ( = ?auto_177101 ?auto_177099 ) ) ( not ( = ?auto_177098 ?auto_177099 ) ) ( not ( = ?auto_177100 ?auto_177099 ) ) ( not ( = ?auto_177106 ?auto_177108 ) ) ( not ( = ?auto_177106 ?auto_177104 ) ) ( not ( = ?auto_177106 ?auto_177105 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_177102 ?auto_177101 ?auto_177098 ?auto_177099 ?auto_177100 ?auto_177097 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_177862 - OBJ
      ?auto_177863 - OBJ
      ?auto_177864 - OBJ
      ?auto_177865 - OBJ
      ?auto_177866 - OBJ
      ?auto_177861 - LOCATION
    )
    :vars
    (
      ?auto_177870 - LOCATION
      ?auto_177871 - CITY
      ?auto_177872 - LOCATION
      ?auto_177868 - LOCATION
      ?auto_177869 - LOCATION
      ?auto_177867 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177870 ?auto_177871 ) ( IN-CITY ?auto_177861 ?auto_177871 ) ( not ( = ?auto_177861 ?auto_177870 ) ) ( OBJ-AT ?auto_177866 ?auto_177870 ) ( IN-CITY ?auto_177872 ?auto_177871 ) ( not ( = ?auto_177861 ?auto_177872 ) ) ( OBJ-AT ?auto_177862 ?auto_177872 ) ( IN-CITY ?auto_177868 ?auto_177871 ) ( not ( = ?auto_177861 ?auto_177868 ) ) ( OBJ-AT ?auto_177865 ?auto_177868 ) ( IN-CITY ?auto_177869 ?auto_177871 ) ( not ( = ?auto_177861 ?auto_177869 ) ) ( OBJ-AT ?auto_177864 ?auto_177869 ) ( OBJ-AT ?auto_177863 ?auto_177869 ) ( TRUCK-AT ?auto_177867 ?auto_177861 ) ( not ( = ?auto_177863 ?auto_177864 ) ) ( not ( = ?auto_177863 ?auto_177865 ) ) ( not ( = ?auto_177864 ?auto_177865 ) ) ( not ( = ?auto_177868 ?auto_177869 ) ) ( not ( = ?auto_177863 ?auto_177862 ) ) ( not ( = ?auto_177864 ?auto_177862 ) ) ( not ( = ?auto_177865 ?auto_177862 ) ) ( not ( = ?auto_177872 ?auto_177868 ) ) ( not ( = ?auto_177872 ?auto_177869 ) ) ( not ( = ?auto_177863 ?auto_177866 ) ) ( not ( = ?auto_177864 ?auto_177866 ) ) ( not ( = ?auto_177865 ?auto_177866 ) ) ( not ( = ?auto_177862 ?auto_177866 ) ) ( not ( = ?auto_177870 ?auto_177872 ) ) ( not ( = ?auto_177870 ?auto_177868 ) ) ( not ( = ?auto_177870 ?auto_177869 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_177863 ?auto_177864 ?auto_177865 ?auto_177866 ?auto_177862 ?auto_177861 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_177913 - OBJ
      ?auto_177914 - OBJ
      ?auto_177915 - OBJ
      ?auto_177916 - OBJ
      ?auto_177917 - OBJ
      ?auto_177912 - LOCATION
    )
    :vars
    (
      ?auto_177921 - LOCATION
      ?auto_177922 - CITY
      ?auto_177923 - LOCATION
      ?auto_177919 - LOCATION
      ?auto_177920 - LOCATION
      ?auto_177918 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177921 ?auto_177922 ) ( IN-CITY ?auto_177912 ?auto_177922 ) ( not ( = ?auto_177912 ?auto_177921 ) ) ( OBJ-AT ?auto_177916 ?auto_177921 ) ( IN-CITY ?auto_177923 ?auto_177922 ) ( not ( = ?auto_177912 ?auto_177923 ) ) ( OBJ-AT ?auto_177913 ?auto_177923 ) ( IN-CITY ?auto_177919 ?auto_177922 ) ( not ( = ?auto_177912 ?auto_177919 ) ) ( OBJ-AT ?auto_177917 ?auto_177919 ) ( IN-CITY ?auto_177920 ?auto_177922 ) ( not ( = ?auto_177912 ?auto_177920 ) ) ( OBJ-AT ?auto_177915 ?auto_177920 ) ( OBJ-AT ?auto_177914 ?auto_177920 ) ( TRUCK-AT ?auto_177918 ?auto_177912 ) ( not ( = ?auto_177914 ?auto_177915 ) ) ( not ( = ?auto_177914 ?auto_177917 ) ) ( not ( = ?auto_177915 ?auto_177917 ) ) ( not ( = ?auto_177919 ?auto_177920 ) ) ( not ( = ?auto_177914 ?auto_177913 ) ) ( not ( = ?auto_177915 ?auto_177913 ) ) ( not ( = ?auto_177917 ?auto_177913 ) ) ( not ( = ?auto_177923 ?auto_177919 ) ) ( not ( = ?auto_177923 ?auto_177920 ) ) ( not ( = ?auto_177914 ?auto_177916 ) ) ( not ( = ?auto_177915 ?auto_177916 ) ) ( not ( = ?auto_177917 ?auto_177916 ) ) ( not ( = ?auto_177913 ?auto_177916 ) ) ( not ( = ?auto_177921 ?auto_177923 ) ) ( not ( = ?auto_177921 ?auto_177919 ) ) ( not ( = ?auto_177921 ?auto_177920 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_177914 ?auto_177915 ?auto_177917 ?auto_177916 ?auto_177913 ?auto_177912 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_177964 - OBJ
      ?auto_177965 - OBJ
      ?auto_177966 - OBJ
      ?auto_177967 - OBJ
      ?auto_177968 - OBJ
      ?auto_177963 - LOCATION
    )
    :vars
    (
      ?auto_177972 - LOCATION
      ?auto_177973 - CITY
      ?auto_177974 - LOCATION
      ?auto_177970 - LOCATION
      ?auto_177971 - LOCATION
      ?auto_177969 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_177972 ?auto_177973 ) ( IN-CITY ?auto_177963 ?auto_177973 ) ( not ( = ?auto_177963 ?auto_177972 ) ) ( OBJ-AT ?auto_177968 ?auto_177972 ) ( IN-CITY ?auto_177974 ?auto_177973 ) ( not ( = ?auto_177963 ?auto_177974 ) ) ( OBJ-AT ?auto_177964 ?auto_177974 ) ( IN-CITY ?auto_177970 ?auto_177973 ) ( not ( = ?auto_177963 ?auto_177970 ) ) ( OBJ-AT ?auto_177966 ?auto_177970 ) ( IN-CITY ?auto_177971 ?auto_177973 ) ( not ( = ?auto_177963 ?auto_177971 ) ) ( OBJ-AT ?auto_177967 ?auto_177971 ) ( OBJ-AT ?auto_177965 ?auto_177971 ) ( TRUCK-AT ?auto_177969 ?auto_177963 ) ( not ( = ?auto_177965 ?auto_177967 ) ) ( not ( = ?auto_177965 ?auto_177966 ) ) ( not ( = ?auto_177967 ?auto_177966 ) ) ( not ( = ?auto_177970 ?auto_177971 ) ) ( not ( = ?auto_177965 ?auto_177964 ) ) ( not ( = ?auto_177967 ?auto_177964 ) ) ( not ( = ?auto_177966 ?auto_177964 ) ) ( not ( = ?auto_177974 ?auto_177970 ) ) ( not ( = ?auto_177974 ?auto_177971 ) ) ( not ( = ?auto_177965 ?auto_177968 ) ) ( not ( = ?auto_177967 ?auto_177968 ) ) ( not ( = ?auto_177966 ?auto_177968 ) ) ( not ( = ?auto_177964 ?auto_177968 ) ) ( not ( = ?auto_177972 ?auto_177974 ) ) ( not ( = ?auto_177972 ?auto_177970 ) ) ( not ( = ?auto_177972 ?auto_177971 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_177965 ?auto_177967 ?auto_177966 ?auto_177968 ?auto_177964 ?auto_177963 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_178015 - OBJ
      ?auto_178016 - OBJ
      ?auto_178017 - OBJ
      ?auto_178018 - OBJ
      ?auto_178019 - OBJ
      ?auto_178014 - LOCATION
    )
    :vars
    (
      ?auto_178023 - LOCATION
      ?auto_178024 - CITY
      ?auto_178025 - LOCATION
      ?auto_178021 - LOCATION
      ?auto_178022 - LOCATION
      ?auto_178020 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178023 ?auto_178024 ) ( IN-CITY ?auto_178014 ?auto_178024 ) ( not ( = ?auto_178014 ?auto_178023 ) ) ( OBJ-AT ?auto_178018 ?auto_178023 ) ( IN-CITY ?auto_178025 ?auto_178024 ) ( not ( = ?auto_178014 ?auto_178025 ) ) ( OBJ-AT ?auto_178015 ?auto_178025 ) ( IN-CITY ?auto_178021 ?auto_178024 ) ( not ( = ?auto_178014 ?auto_178021 ) ) ( OBJ-AT ?auto_178017 ?auto_178021 ) ( IN-CITY ?auto_178022 ?auto_178024 ) ( not ( = ?auto_178014 ?auto_178022 ) ) ( OBJ-AT ?auto_178019 ?auto_178022 ) ( OBJ-AT ?auto_178016 ?auto_178022 ) ( TRUCK-AT ?auto_178020 ?auto_178014 ) ( not ( = ?auto_178016 ?auto_178019 ) ) ( not ( = ?auto_178016 ?auto_178017 ) ) ( not ( = ?auto_178019 ?auto_178017 ) ) ( not ( = ?auto_178021 ?auto_178022 ) ) ( not ( = ?auto_178016 ?auto_178015 ) ) ( not ( = ?auto_178019 ?auto_178015 ) ) ( not ( = ?auto_178017 ?auto_178015 ) ) ( not ( = ?auto_178025 ?auto_178021 ) ) ( not ( = ?auto_178025 ?auto_178022 ) ) ( not ( = ?auto_178016 ?auto_178018 ) ) ( not ( = ?auto_178019 ?auto_178018 ) ) ( not ( = ?auto_178017 ?auto_178018 ) ) ( not ( = ?auto_178015 ?auto_178018 ) ) ( not ( = ?auto_178023 ?auto_178025 ) ) ( not ( = ?auto_178023 ?auto_178021 ) ) ( not ( = ?auto_178023 ?auto_178022 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_178016 ?auto_178019 ?auto_178017 ?auto_178018 ?auto_178015 ?auto_178014 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_178282 - OBJ
      ?auto_178283 - OBJ
      ?auto_178284 - OBJ
      ?auto_178285 - OBJ
      ?auto_178286 - OBJ
      ?auto_178281 - LOCATION
    )
    :vars
    (
      ?auto_178290 - LOCATION
      ?auto_178291 - CITY
      ?auto_178292 - LOCATION
      ?auto_178288 - LOCATION
      ?auto_178289 - LOCATION
      ?auto_178287 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178290 ?auto_178291 ) ( IN-CITY ?auto_178281 ?auto_178291 ) ( not ( = ?auto_178281 ?auto_178290 ) ) ( OBJ-AT ?auto_178284 ?auto_178290 ) ( IN-CITY ?auto_178292 ?auto_178291 ) ( not ( = ?auto_178281 ?auto_178292 ) ) ( OBJ-AT ?auto_178282 ?auto_178292 ) ( IN-CITY ?auto_178288 ?auto_178291 ) ( not ( = ?auto_178281 ?auto_178288 ) ) ( OBJ-AT ?auto_178286 ?auto_178288 ) ( IN-CITY ?auto_178289 ?auto_178291 ) ( not ( = ?auto_178281 ?auto_178289 ) ) ( OBJ-AT ?auto_178285 ?auto_178289 ) ( OBJ-AT ?auto_178283 ?auto_178289 ) ( TRUCK-AT ?auto_178287 ?auto_178281 ) ( not ( = ?auto_178283 ?auto_178285 ) ) ( not ( = ?auto_178283 ?auto_178286 ) ) ( not ( = ?auto_178285 ?auto_178286 ) ) ( not ( = ?auto_178288 ?auto_178289 ) ) ( not ( = ?auto_178283 ?auto_178282 ) ) ( not ( = ?auto_178285 ?auto_178282 ) ) ( not ( = ?auto_178286 ?auto_178282 ) ) ( not ( = ?auto_178292 ?auto_178288 ) ) ( not ( = ?auto_178292 ?auto_178289 ) ) ( not ( = ?auto_178283 ?auto_178284 ) ) ( not ( = ?auto_178285 ?auto_178284 ) ) ( not ( = ?auto_178286 ?auto_178284 ) ) ( not ( = ?auto_178282 ?auto_178284 ) ) ( not ( = ?auto_178290 ?auto_178292 ) ) ( not ( = ?auto_178290 ?auto_178288 ) ) ( not ( = ?auto_178290 ?auto_178289 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_178283 ?auto_178285 ?auto_178286 ?auto_178284 ?auto_178282 ?auto_178281 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_178333 - OBJ
      ?auto_178334 - OBJ
      ?auto_178335 - OBJ
      ?auto_178336 - OBJ
      ?auto_178337 - OBJ
      ?auto_178332 - LOCATION
    )
    :vars
    (
      ?auto_178341 - LOCATION
      ?auto_178342 - CITY
      ?auto_178343 - LOCATION
      ?auto_178339 - LOCATION
      ?auto_178340 - LOCATION
      ?auto_178338 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178341 ?auto_178342 ) ( IN-CITY ?auto_178332 ?auto_178342 ) ( not ( = ?auto_178332 ?auto_178341 ) ) ( OBJ-AT ?auto_178335 ?auto_178341 ) ( IN-CITY ?auto_178343 ?auto_178342 ) ( not ( = ?auto_178332 ?auto_178343 ) ) ( OBJ-AT ?auto_178333 ?auto_178343 ) ( IN-CITY ?auto_178339 ?auto_178342 ) ( not ( = ?auto_178332 ?auto_178339 ) ) ( OBJ-AT ?auto_178336 ?auto_178339 ) ( IN-CITY ?auto_178340 ?auto_178342 ) ( not ( = ?auto_178332 ?auto_178340 ) ) ( OBJ-AT ?auto_178337 ?auto_178340 ) ( OBJ-AT ?auto_178334 ?auto_178340 ) ( TRUCK-AT ?auto_178338 ?auto_178332 ) ( not ( = ?auto_178334 ?auto_178337 ) ) ( not ( = ?auto_178334 ?auto_178336 ) ) ( not ( = ?auto_178337 ?auto_178336 ) ) ( not ( = ?auto_178339 ?auto_178340 ) ) ( not ( = ?auto_178334 ?auto_178333 ) ) ( not ( = ?auto_178337 ?auto_178333 ) ) ( not ( = ?auto_178336 ?auto_178333 ) ) ( not ( = ?auto_178343 ?auto_178339 ) ) ( not ( = ?auto_178343 ?auto_178340 ) ) ( not ( = ?auto_178334 ?auto_178335 ) ) ( not ( = ?auto_178337 ?auto_178335 ) ) ( not ( = ?auto_178336 ?auto_178335 ) ) ( not ( = ?auto_178333 ?auto_178335 ) ) ( not ( = ?auto_178341 ?auto_178343 ) ) ( not ( = ?auto_178341 ?auto_178339 ) ) ( not ( = ?auto_178341 ?auto_178340 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_178334 ?auto_178337 ?auto_178336 ?auto_178335 ?auto_178333 ?auto_178332 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_178546 - OBJ
      ?auto_178547 - OBJ
      ?auto_178548 - OBJ
      ?auto_178549 - OBJ
      ?auto_178550 - OBJ
      ?auto_178545 - LOCATION
    )
    :vars
    (
      ?auto_178554 - LOCATION
      ?auto_178555 - CITY
      ?auto_178556 - LOCATION
      ?auto_178552 - LOCATION
      ?auto_178553 - LOCATION
      ?auto_178551 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178554 ?auto_178555 ) ( IN-CITY ?auto_178545 ?auto_178555 ) ( not ( = ?auto_178545 ?auto_178554 ) ) ( OBJ-AT ?auto_178550 ?auto_178554 ) ( IN-CITY ?auto_178556 ?auto_178555 ) ( not ( = ?auto_178545 ?auto_178556 ) ) ( OBJ-AT ?auto_178546 ?auto_178556 ) ( IN-CITY ?auto_178552 ?auto_178555 ) ( not ( = ?auto_178545 ?auto_178552 ) ) ( OBJ-AT ?auto_178549 ?auto_178552 ) ( IN-CITY ?auto_178553 ?auto_178555 ) ( not ( = ?auto_178545 ?auto_178553 ) ) ( OBJ-AT ?auto_178547 ?auto_178553 ) ( OBJ-AT ?auto_178548 ?auto_178553 ) ( TRUCK-AT ?auto_178551 ?auto_178545 ) ( not ( = ?auto_178548 ?auto_178547 ) ) ( not ( = ?auto_178548 ?auto_178549 ) ) ( not ( = ?auto_178547 ?auto_178549 ) ) ( not ( = ?auto_178552 ?auto_178553 ) ) ( not ( = ?auto_178548 ?auto_178546 ) ) ( not ( = ?auto_178547 ?auto_178546 ) ) ( not ( = ?auto_178549 ?auto_178546 ) ) ( not ( = ?auto_178556 ?auto_178552 ) ) ( not ( = ?auto_178556 ?auto_178553 ) ) ( not ( = ?auto_178548 ?auto_178550 ) ) ( not ( = ?auto_178547 ?auto_178550 ) ) ( not ( = ?auto_178549 ?auto_178550 ) ) ( not ( = ?auto_178546 ?auto_178550 ) ) ( not ( = ?auto_178554 ?auto_178556 ) ) ( not ( = ?auto_178554 ?auto_178552 ) ) ( not ( = ?auto_178554 ?auto_178553 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_178548 ?auto_178547 ?auto_178549 ?auto_178550 ?auto_178546 ?auto_178545 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_178597 - OBJ
      ?auto_178598 - OBJ
      ?auto_178599 - OBJ
      ?auto_178600 - OBJ
      ?auto_178601 - OBJ
      ?auto_178596 - LOCATION
    )
    :vars
    (
      ?auto_178605 - LOCATION
      ?auto_178606 - CITY
      ?auto_178607 - LOCATION
      ?auto_178603 - LOCATION
      ?auto_178604 - LOCATION
      ?auto_178602 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178605 ?auto_178606 ) ( IN-CITY ?auto_178596 ?auto_178606 ) ( not ( = ?auto_178596 ?auto_178605 ) ) ( OBJ-AT ?auto_178600 ?auto_178605 ) ( IN-CITY ?auto_178607 ?auto_178606 ) ( not ( = ?auto_178596 ?auto_178607 ) ) ( OBJ-AT ?auto_178597 ?auto_178607 ) ( IN-CITY ?auto_178603 ?auto_178606 ) ( not ( = ?auto_178596 ?auto_178603 ) ) ( OBJ-AT ?auto_178601 ?auto_178603 ) ( IN-CITY ?auto_178604 ?auto_178606 ) ( not ( = ?auto_178596 ?auto_178604 ) ) ( OBJ-AT ?auto_178598 ?auto_178604 ) ( OBJ-AT ?auto_178599 ?auto_178604 ) ( TRUCK-AT ?auto_178602 ?auto_178596 ) ( not ( = ?auto_178599 ?auto_178598 ) ) ( not ( = ?auto_178599 ?auto_178601 ) ) ( not ( = ?auto_178598 ?auto_178601 ) ) ( not ( = ?auto_178603 ?auto_178604 ) ) ( not ( = ?auto_178599 ?auto_178597 ) ) ( not ( = ?auto_178598 ?auto_178597 ) ) ( not ( = ?auto_178601 ?auto_178597 ) ) ( not ( = ?auto_178607 ?auto_178603 ) ) ( not ( = ?auto_178607 ?auto_178604 ) ) ( not ( = ?auto_178599 ?auto_178600 ) ) ( not ( = ?auto_178598 ?auto_178600 ) ) ( not ( = ?auto_178601 ?auto_178600 ) ) ( not ( = ?auto_178597 ?auto_178600 ) ) ( not ( = ?auto_178605 ?auto_178607 ) ) ( not ( = ?auto_178605 ?auto_178603 ) ) ( not ( = ?auto_178605 ?auto_178604 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_178599 ?auto_178598 ?auto_178601 ?auto_178600 ?auto_178597 ?auto_178596 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_178757 - OBJ
      ?auto_178758 - OBJ
      ?auto_178759 - OBJ
      ?auto_178760 - OBJ
      ?auto_178761 - OBJ
      ?auto_178756 - LOCATION
    )
    :vars
    (
      ?auto_178765 - LOCATION
      ?auto_178766 - CITY
      ?auto_178767 - LOCATION
      ?auto_178763 - LOCATION
      ?auto_178764 - LOCATION
      ?auto_178762 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178765 ?auto_178766 ) ( IN-CITY ?auto_178756 ?auto_178766 ) ( not ( = ?auto_178756 ?auto_178765 ) ) ( OBJ-AT ?auto_178761 ?auto_178765 ) ( IN-CITY ?auto_178767 ?auto_178766 ) ( not ( = ?auto_178756 ?auto_178767 ) ) ( OBJ-AT ?auto_178757 ?auto_178767 ) ( IN-CITY ?auto_178763 ?auto_178766 ) ( not ( = ?auto_178756 ?auto_178763 ) ) ( OBJ-AT ?auto_178759 ?auto_178763 ) ( IN-CITY ?auto_178764 ?auto_178766 ) ( not ( = ?auto_178756 ?auto_178764 ) ) ( OBJ-AT ?auto_178758 ?auto_178764 ) ( OBJ-AT ?auto_178760 ?auto_178764 ) ( TRUCK-AT ?auto_178762 ?auto_178756 ) ( not ( = ?auto_178760 ?auto_178758 ) ) ( not ( = ?auto_178760 ?auto_178759 ) ) ( not ( = ?auto_178758 ?auto_178759 ) ) ( not ( = ?auto_178763 ?auto_178764 ) ) ( not ( = ?auto_178760 ?auto_178757 ) ) ( not ( = ?auto_178758 ?auto_178757 ) ) ( not ( = ?auto_178759 ?auto_178757 ) ) ( not ( = ?auto_178767 ?auto_178763 ) ) ( not ( = ?auto_178767 ?auto_178764 ) ) ( not ( = ?auto_178760 ?auto_178761 ) ) ( not ( = ?auto_178758 ?auto_178761 ) ) ( not ( = ?auto_178759 ?auto_178761 ) ) ( not ( = ?auto_178757 ?auto_178761 ) ) ( not ( = ?auto_178765 ?auto_178767 ) ) ( not ( = ?auto_178765 ?auto_178763 ) ) ( not ( = ?auto_178765 ?auto_178764 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_178760 ?auto_178758 ?auto_178759 ?auto_178761 ?auto_178757 ?auto_178756 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_178808 - OBJ
      ?auto_178809 - OBJ
      ?auto_178810 - OBJ
      ?auto_178811 - OBJ
      ?auto_178812 - OBJ
      ?auto_178807 - LOCATION
    )
    :vars
    (
      ?auto_178816 - LOCATION
      ?auto_178817 - CITY
      ?auto_178818 - LOCATION
      ?auto_178814 - LOCATION
      ?auto_178815 - LOCATION
      ?auto_178813 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_178816 ?auto_178817 ) ( IN-CITY ?auto_178807 ?auto_178817 ) ( not ( = ?auto_178807 ?auto_178816 ) ) ( OBJ-AT ?auto_178811 ?auto_178816 ) ( IN-CITY ?auto_178818 ?auto_178817 ) ( not ( = ?auto_178807 ?auto_178818 ) ) ( OBJ-AT ?auto_178808 ?auto_178818 ) ( IN-CITY ?auto_178814 ?auto_178817 ) ( not ( = ?auto_178807 ?auto_178814 ) ) ( OBJ-AT ?auto_178810 ?auto_178814 ) ( IN-CITY ?auto_178815 ?auto_178817 ) ( not ( = ?auto_178807 ?auto_178815 ) ) ( OBJ-AT ?auto_178809 ?auto_178815 ) ( OBJ-AT ?auto_178812 ?auto_178815 ) ( TRUCK-AT ?auto_178813 ?auto_178807 ) ( not ( = ?auto_178812 ?auto_178809 ) ) ( not ( = ?auto_178812 ?auto_178810 ) ) ( not ( = ?auto_178809 ?auto_178810 ) ) ( not ( = ?auto_178814 ?auto_178815 ) ) ( not ( = ?auto_178812 ?auto_178808 ) ) ( not ( = ?auto_178809 ?auto_178808 ) ) ( not ( = ?auto_178810 ?auto_178808 ) ) ( not ( = ?auto_178818 ?auto_178814 ) ) ( not ( = ?auto_178818 ?auto_178815 ) ) ( not ( = ?auto_178812 ?auto_178811 ) ) ( not ( = ?auto_178809 ?auto_178811 ) ) ( not ( = ?auto_178810 ?auto_178811 ) ) ( not ( = ?auto_178808 ?auto_178811 ) ) ( not ( = ?auto_178816 ?auto_178818 ) ) ( not ( = ?auto_178816 ?auto_178814 ) ) ( not ( = ?auto_178816 ?auto_178815 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_178812 ?auto_178809 ?auto_178810 ?auto_178811 ?auto_178808 ?auto_178807 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179020 - OBJ
      ?auto_179021 - OBJ
      ?auto_179022 - OBJ
      ?auto_179023 - OBJ
      ?auto_179024 - OBJ
      ?auto_179019 - LOCATION
    )
    :vars
    (
      ?auto_179028 - LOCATION
      ?auto_179029 - CITY
      ?auto_179030 - LOCATION
      ?auto_179026 - LOCATION
      ?auto_179027 - LOCATION
      ?auto_179025 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179028 ?auto_179029 ) ( IN-CITY ?auto_179019 ?auto_179029 ) ( not ( = ?auto_179019 ?auto_179028 ) ) ( OBJ-AT ?auto_179022 ?auto_179028 ) ( IN-CITY ?auto_179030 ?auto_179029 ) ( not ( = ?auto_179019 ?auto_179030 ) ) ( OBJ-AT ?auto_179020 ?auto_179030 ) ( IN-CITY ?auto_179026 ?auto_179029 ) ( not ( = ?auto_179019 ?auto_179026 ) ) ( OBJ-AT ?auto_179024 ?auto_179026 ) ( IN-CITY ?auto_179027 ?auto_179029 ) ( not ( = ?auto_179019 ?auto_179027 ) ) ( OBJ-AT ?auto_179021 ?auto_179027 ) ( OBJ-AT ?auto_179023 ?auto_179027 ) ( TRUCK-AT ?auto_179025 ?auto_179019 ) ( not ( = ?auto_179023 ?auto_179021 ) ) ( not ( = ?auto_179023 ?auto_179024 ) ) ( not ( = ?auto_179021 ?auto_179024 ) ) ( not ( = ?auto_179026 ?auto_179027 ) ) ( not ( = ?auto_179023 ?auto_179020 ) ) ( not ( = ?auto_179021 ?auto_179020 ) ) ( not ( = ?auto_179024 ?auto_179020 ) ) ( not ( = ?auto_179030 ?auto_179026 ) ) ( not ( = ?auto_179030 ?auto_179027 ) ) ( not ( = ?auto_179023 ?auto_179022 ) ) ( not ( = ?auto_179021 ?auto_179022 ) ) ( not ( = ?auto_179024 ?auto_179022 ) ) ( not ( = ?auto_179020 ?auto_179022 ) ) ( not ( = ?auto_179028 ?auto_179030 ) ) ( not ( = ?auto_179028 ?auto_179026 ) ) ( not ( = ?auto_179028 ?auto_179027 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179023 ?auto_179021 ?auto_179024 ?auto_179022 ?auto_179020 ?auto_179019 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179126 - OBJ
      ?auto_179127 - OBJ
      ?auto_179128 - OBJ
      ?auto_179129 - OBJ
      ?auto_179130 - OBJ
      ?auto_179125 - LOCATION
    )
    :vars
    (
      ?auto_179134 - LOCATION
      ?auto_179135 - CITY
      ?auto_179136 - LOCATION
      ?auto_179132 - LOCATION
      ?auto_179133 - LOCATION
      ?auto_179131 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179134 ?auto_179135 ) ( IN-CITY ?auto_179125 ?auto_179135 ) ( not ( = ?auto_179125 ?auto_179134 ) ) ( OBJ-AT ?auto_179128 ?auto_179134 ) ( IN-CITY ?auto_179136 ?auto_179135 ) ( not ( = ?auto_179125 ?auto_179136 ) ) ( OBJ-AT ?auto_179126 ?auto_179136 ) ( IN-CITY ?auto_179132 ?auto_179135 ) ( not ( = ?auto_179125 ?auto_179132 ) ) ( OBJ-AT ?auto_179129 ?auto_179132 ) ( IN-CITY ?auto_179133 ?auto_179135 ) ( not ( = ?auto_179125 ?auto_179133 ) ) ( OBJ-AT ?auto_179127 ?auto_179133 ) ( OBJ-AT ?auto_179130 ?auto_179133 ) ( TRUCK-AT ?auto_179131 ?auto_179125 ) ( not ( = ?auto_179130 ?auto_179127 ) ) ( not ( = ?auto_179130 ?auto_179129 ) ) ( not ( = ?auto_179127 ?auto_179129 ) ) ( not ( = ?auto_179132 ?auto_179133 ) ) ( not ( = ?auto_179130 ?auto_179126 ) ) ( not ( = ?auto_179127 ?auto_179126 ) ) ( not ( = ?auto_179129 ?auto_179126 ) ) ( not ( = ?auto_179136 ?auto_179132 ) ) ( not ( = ?auto_179136 ?auto_179133 ) ) ( not ( = ?auto_179130 ?auto_179128 ) ) ( not ( = ?auto_179127 ?auto_179128 ) ) ( not ( = ?auto_179129 ?auto_179128 ) ) ( not ( = ?auto_179126 ?auto_179128 ) ) ( not ( = ?auto_179134 ?auto_179136 ) ) ( not ( = ?auto_179134 ?auto_179132 ) ) ( not ( = ?auto_179134 ?auto_179133 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179130 ?auto_179127 ?auto_179129 ?auto_179128 ?auto_179126 ?auto_179125 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179339 - OBJ
      ?auto_179340 - OBJ
      ?auto_179341 - OBJ
      ?auto_179342 - OBJ
      ?auto_179343 - OBJ
      ?auto_179338 - LOCATION
    )
    :vars
    (
      ?auto_179347 - LOCATION
      ?auto_179348 - CITY
      ?auto_179349 - LOCATION
      ?auto_179345 - LOCATION
      ?auto_179346 - LOCATION
      ?auto_179344 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179347 ?auto_179348 ) ( IN-CITY ?auto_179338 ?auto_179348 ) ( not ( = ?auto_179338 ?auto_179347 ) ) ( OBJ-AT ?auto_179343 ?auto_179347 ) ( IN-CITY ?auto_179349 ?auto_179348 ) ( not ( = ?auto_179338 ?auto_179349 ) ) ( OBJ-AT ?auto_179339 ?auto_179349 ) ( IN-CITY ?auto_179345 ?auto_179348 ) ( not ( = ?auto_179338 ?auto_179345 ) ) ( OBJ-AT ?auto_179340 ?auto_179345 ) ( IN-CITY ?auto_179346 ?auto_179348 ) ( not ( = ?auto_179338 ?auto_179346 ) ) ( OBJ-AT ?auto_179342 ?auto_179346 ) ( OBJ-AT ?auto_179341 ?auto_179346 ) ( TRUCK-AT ?auto_179344 ?auto_179338 ) ( not ( = ?auto_179341 ?auto_179342 ) ) ( not ( = ?auto_179341 ?auto_179340 ) ) ( not ( = ?auto_179342 ?auto_179340 ) ) ( not ( = ?auto_179345 ?auto_179346 ) ) ( not ( = ?auto_179341 ?auto_179339 ) ) ( not ( = ?auto_179342 ?auto_179339 ) ) ( not ( = ?auto_179340 ?auto_179339 ) ) ( not ( = ?auto_179349 ?auto_179345 ) ) ( not ( = ?auto_179349 ?auto_179346 ) ) ( not ( = ?auto_179341 ?auto_179343 ) ) ( not ( = ?auto_179342 ?auto_179343 ) ) ( not ( = ?auto_179340 ?auto_179343 ) ) ( not ( = ?auto_179339 ?auto_179343 ) ) ( not ( = ?auto_179347 ?auto_179349 ) ) ( not ( = ?auto_179347 ?auto_179345 ) ) ( not ( = ?auto_179347 ?auto_179346 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179341 ?auto_179342 ?auto_179340 ?auto_179343 ?auto_179339 ?auto_179338 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179390 - OBJ
      ?auto_179391 - OBJ
      ?auto_179392 - OBJ
      ?auto_179393 - OBJ
      ?auto_179394 - OBJ
      ?auto_179389 - LOCATION
    )
    :vars
    (
      ?auto_179398 - LOCATION
      ?auto_179399 - CITY
      ?auto_179400 - LOCATION
      ?auto_179396 - LOCATION
      ?auto_179397 - LOCATION
      ?auto_179395 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179398 ?auto_179399 ) ( IN-CITY ?auto_179389 ?auto_179399 ) ( not ( = ?auto_179389 ?auto_179398 ) ) ( OBJ-AT ?auto_179393 ?auto_179398 ) ( IN-CITY ?auto_179400 ?auto_179399 ) ( not ( = ?auto_179389 ?auto_179400 ) ) ( OBJ-AT ?auto_179390 ?auto_179400 ) ( IN-CITY ?auto_179396 ?auto_179399 ) ( not ( = ?auto_179389 ?auto_179396 ) ) ( OBJ-AT ?auto_179391 ?auto_179396 ) ( IN-CITY ?auto_179397 ?auto_179399 ) ( not ( = ?auto_179389 ?auto_179397 ) ) ( OBJ-AT ?auto_179394 ?auto_179397 ) ( OBJ-AT ?auto_179392 ?auto_179397 ) ( TRUCK-AT ?auto_179395 ?auto_179389 ) ( not ( = ?auto_179392 ?auto_179394 ) ) ( not ( = ?auto_179392 ?auto_179391 ) ) ( not ( = ?auto_179394 ?auto_179391 ) ) ( not ( = ?auto_179396 ?auto_179397 ) ) ( not ( = ?auto_179392 ?auto_179390 ) ) ( not ( = ?auto_179394 ?auto_179390 ) ) ( not ( = ?auto_179391 ?auto_179390 ) ) ( not ( = ?auto_179400 ?auto_179396 ) ) ( not ( = ?auto_179400 ?auto_179397 ) ) ( not ( = ?auto_179392 ?auto_179393 ) ) ( not ( = ?auto_179394 ?auto_179393 ) ) ( not ( = ?auto_179391 ?auto_179393 ) ) ( not ( = ?auto_179390 ?auto_179393 ) ) ( not ( = ?auto_179398 ?auto_179400 ) ) ( not ( = ?auto_179398 ?auto_179396 ) ) ( not ( = ?auto_179398 ?auto_179397 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179392 ?auto_179394 ?auto_179391 ?auto_179393 ?auto_179390 ?auto_179389 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179441 - OBJ
      ?auto_179442 - OBJ
      ?auto_179443 - OBJ
      ?auto_179444 - OBJ
      ?auto_179445 - OBJ
      ?auto_179440 - LOCATION
    )
    :vars
    (
      ?auto_179449 - LOCATION
      ?auto_179450 - CITY
      ?auto_179451 - LOCATION
      ?auto_179447 - LOCATION
      ?auto_179448 - LOCATION
      ?auto_179446 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179449 ?auto_179450 ) ( IN-CITY ?auto_179440 ?auto_179450 ) ( not ( = ?auto_179440 ?auto_179449 ) ) ( OBJ-AT ?auto_179445 ?auto_179449 ) ( IN-CITY ?auto_179451 ?auto_179450 ) ( not ( = ?auto_179440 ?auto_179451 ) ) ( OBJ-AT ?auto_179441 ?auto_179451 ) ( IN-CITY ?auto_179447 ?auto_179450 ) ( not ( = ?auto_179440 ?auto_179447 ) ) ( OBJ-AT ?auto_179442 ?auto_179447 ) ( IN-CITY ?auto_179448 ?auto_179450 ) ( not ( = ?auto_179440 ?auto_179448 ) ) ( OBJ-AT ?auto_179443 ?auto_179448 ) ( OBJ-AT ?auto_179444 ?auto_179448 ) ( TRUCK-AT ?auto_179446 ?auto_179440 ) ( not ( = ?auto_179444 ?auto_179443 ) ) ( not ( = ?auto_179444 ?auto_179442 ) ) ( not ( = ?auto_179443 ?auto_179442 ) ) ( not ( = ?auto_179447 ?auto_179448 ) ) ( not ( = ?auto_179444 ?auto_179441 ) ) ( not ( = ?auto_179443 ?auto_179441 ) ) ( not ( = ?auto_179442 ?auto_179441 ) ) ( not ( = ?auto_179451 ?auto_179447 ) ) ( not ( = ?auto_179451 ?auto_179448 ) ) ( not ( = ?auto_179444 ?auto_179445 ) ) ( not ( = ?auto_179443 ?auto_179445 ) ) ( not ( = ?auto_179442 ?auto_179445 ) ) ( not ( = ?auto_179441 ?auto_179445 ) ) ( not ( = ?auto_179449 ?auto_179451 ) ) ( not ( = ?auto_179449 ?auto_179447 ) ) ( not ( = ?auto_179449 ?auto_179448 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179444 ?auto_179443 ?auto_179442 ?auto_179445 ?auto_179441 ?auto_179440 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179492 - OBJ
      ?auto_179493 - OBJ
      ?auto_179494 - OBJ
      ?auto_179495 - OBJ
      ?auto_179496 - OBJ
      ?auto_179491 - LOCATION
    )
    :vars
    (
      ?auto_179500 - LOCATION
      ?auto_179501 - CITY
      ?auto_179502 - LOCATION
      ?auto_179498 - LOCATION
      ?auto_179499 - LOCATION
      ?auto_179497 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179500 ?auto_179501 ) ( IN-CITY ?auto_179491 ?auto_179501 ) ( not ( = ?auto_179491 ?auto_179500 ) ) ( OBJ-AT ?auto_179495 ?auto_179500 ) ( IN-CITY ?auto_179502 ?auto_179501 ) ( not ( = ?auto_179491 ?auto_179502 ) ) ( OBJ-AT ?auto_179492 ?auto_179502 ) ( IN-CITY ?auto_179498 ?auto_179501 ) ( not ( = ?auto_179491 ?auto_179498 ) ) ( OBJ-AT ?auto_179493 ?auto_179498 ) ( IN-CITY ?auto_179499 ?auto_179501 ) ( not ( = ?auto_179491 ?auto_179499 ) ) ( OBJ-AT ?auto_179494 ?auto_179499 ) ( OBJ-AT ?auto_179496 ?auto_179499 ) ( TRUCK-AT ?auto_179497 ?auto_179491 ) ( not ( = ?auto_179496 ?auto_179494 ) ) ( not ( = ?auto_179496 ?auto_179493 ) ) ( not ( = ?auto_179494 ?auto_179493 ) ) ( not ( = ?auto_179498 ?auto_179499 ) ) ( not ( = ?auto_179496 ?auto_179492 ) ) ( not ( = ?auto_179494 ?auto_179492 ) ) ( not ( = ?auto_179493 ?auto_179492 ) ) ( not ( = ?auto_179502 ?auto_179498 ) ) ( not ( = ?auto_179502 ?auto_179499 ) ) ( not ( = ?auto_179496 ?auto_179495 ) ) ( not ( = ?auto_179494 ?auto_179495 ) ) ( not ( = ?auto_179493 ?auto_179495 ) ) ( not ( = ?auto_179492 ?auto_179495 ) ) ( not ( = ?auto_179500 ?auto_179502 ) ) ( not ( = ?auto_179500 ?auto_179498 ) ) ( not ( = ?auto_179500 ?auto_179499 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179496 ?auto_179494 ?auto_179493 ?auto_179495 ?auto_179492 ?auto_179491 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179813 - OBJ
      ?auto_179814 - OBJ
      ?auto_179815 - OBJ
      ?auto_179816 - OBJ
      ?auto_179817 - OBJ
      ?auto_179812 - LOCATION
    )
    :vars
    (
      ?auto_179821 - LOCATION
      ?auto_179822 - CITY
      ?auto_179823 - LOCATION
      ?auto_179819 - LOCATION
      ?auto_179820 - LOCATION
      ?auto_179818 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179821 ?auto_179822 ) ( IN-CITY ?auto_179812 ?auto_179822 ) ( not ( = ?auto_179812 ?auto_179821 ) ) ( OBJ-AT ?auto_179815 ?auto_179821 ) ( IN-CITY ?auto_179823 ?auto_179822 ) ( not ( = ?auto_179812 ?auto_179823 ) ) ( OBJ-AT ?auto_179813 ?auto_179823 ) ( IN-CITY ?auto_179819 ?auto_179822 ) ( not ( = ?auto_179812 ?auto_179819 ) ) ( OBJ-AT ?auto_179814 ?auto_179819 ) ( IN-CITY ?auto_179820 ?auto_179822 ) ( not ( = ?auto_179812 ?auto_179820 ) ) ( OBJ-AT ?auto_179817 ?auto_179820 ) ( OBJ-AT ?auto_179816 ?auto_179820 ) ( TRUCK-AT ?auto_179818 ?auto_179812 ) ( not ( = ?auto_179816 ?auto_179817 ) ) ( not ( = ?auto_179816 ?auto_179814 ) ) ( not ( = ?auto_179817 ?auto_179814 ) ) ( not ( = ?auto_179819 ?auto_179820 ) ) ( not ( = ?auto_179816 ?auto_179813 ) ) ( not ( = ?auto_179817 ?auto_179813 ) ) ( not ( = ?auto_179814 ?auto_179813 ) ) ( not ( = ?auto_179823 ?auto_179819 ) ) ( not ( = ?auto_179823 ?auto_179820 ) ) ( not ( = ?auto_179816 ?auto_179815 ) ) ( not ( = ?auto_179817 ?auto_179815 ) ) ( not ( = ?auto_179814 ?auto_179815 ) ) ( not ( = ?auto_179813 ?auto_179815 ) ) ( not ( = ?auto_179821 ?auto_179823 ) ) ( not ( = ?auto_179821 ?auto_179819 ) ) ( not ( = ?auto_179821 ?auto_179820 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179816 ?auto_179817 ?auto_179814 ?auto_179815 ?auto_179813 ?auto_179812 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_179864 - OBJ
      ?auto_179865 - OBJ
      ?auto_179866 - OBJ
      ?auto_179867 - OBJ
      ?auto_179868 - OBJ
      ?auto_179863 - LOCATION
    )
    :vars
    (
      ?auto_179872 - LOCATION
      ?auto_179873 - CITY
      ?auto_179874 - LOCATION
      ?auto_179870 - LOCATION
      ?auto_179871 - LOCATION
      ?auto_179869 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_179872 ?auto_179873 ) ( IN-CITY ?auto_179863 ?auto_179873 ) ( not ( = ?auto_179863 ?auto_179872 ) ) ( OBJ-AT ?auto_179866 ?auto_179872 ) ( IN-CITY ?auto_179874 ?auto_179873 ) ( not ( = ?auto_179863 ?auto_179874 ) ) ( OBJ-AT ?auto_179864 ?auto_179874 ) ( IN-CITY ?auto_179870 ?auto_179873 ) ( not ( = ?auto_179863 ?auto_179870 ) ) ( OBJ-AT ?auto_179865 ?auto_179870 ) ( IN-CITY ?auto_179871 ?auto_179873 ) ( not ( = ?auto_179863 ?auto_179871 ) ) ( OBJ-AT ?auto_179867 ?auto_179871 ) ( OBJ-AT ?auto_179868 ?auto_179871 ) ( TRUCK-AT ?auto_179869 ?auto_179863 ) ( not ( = ?auto_179868 ?auto_179867 ) ) ( not ( = ?auto_179868 ?auto_179865 ) ) ( not ( = ?auto_179867 ?auto_179865 ) ) ( not ( = ?auto_179870 ?auto_179871 ) ) ( not ( = ?auto_179868 ?auto_179864 ) ) ( not ( = ?auto_179867 ?auto_179864 ) ) ( not ( = ?auto_179865 ?auto_179864 ) ) ( not ( = ?auto_179874 ?auto_179870 ) ) ( not ( = ?auto_179874 ?auto_179871 ) ) ( not ( = ?auto_179868 ?auto_179866 ) ) ( not ( = ?auto_179867 ?auto_179866 ) ) ( not ( = ?auto_179865 ?auto_179866 ) ) ( not ( = ?auto_179864 ?auto_179866 ) ) ( not ( = ?auto_179872 ?auto_179874 ) ) ( not ( = ?auto_179872 ?auto_179870 ) ) ( not ( = ?auto_179872 ?auto_179871 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_179868 ?auto_179867 ?auto_179865 ?auto_179866 ?auto_179864 ?auto_179863 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_181069 - OBJ
      ?auto_181070 - OBJ
      ?auto_181071 - OBJ
      ?auto_181072 - OBJ
      ?auto_181073 - OBJ
      ?auto_181068 - LOCATION
    )
    :vars
    (
      ?auto_181077 - LOCATION
      ?auto_181078 - CITY
      ?auto_181079 - LOCATION
      ?auto_181075 - LOCATION
      ?auto_181076 - LOCATION
      ?auto_181074 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181077 ?auto_181078 ) ( IN-CITY ?auto_181068 ?auto_181078 ) ( not ( = ?auto_181068 ?auto_181077 ) ) ( OBJ-AT ?auto_181070 ?auto_181077 ) ( IN-CITY ?auto_181079 ?auto_181078 ) ( not ( = ?auto_181068 ?auto_181079 ) ) ( OBJ-AT ?auto_181069 ?auto_181079 ) ( IN-CITY ?auto_181075 ?auto_181078 ) ( not ( = ?auto_181068 ?auto_181075 ) ) ( OBJ-AT ?auto_181073 ?auto_181075 ) ( IN-CITY ?auto_181076 ?auto_181078 ) ( not ( = ?auto_181068 ?auto_181076 ) ) ( OBJ-AT ?auto_181072 ?auto_181076 ) ( OBJ-AT ?auto_181071 ?auto_181076 ) ( TRUCK-AT ?auto_181074 ?auto_181068 ) ( not ( = ?auto_181071 ?auto_181072 ) ) ( not ( = ?auto_181071 ?auto_181073 ) ) ( not ( = ?auto_181072 ?auto_181073 ) ) ( not ( = ?auto_181075 ?auto_181076 ) ) ( not ( = ?auto_181071 ?auto_181069 ) ) ( not ( = ?auto_181072 ?auto_181069 ) ) ( not ( = ?auto_181073 ?auto_181069 ) ) ( not ( = ?auto_181079 ?auto_181075 ) ) ( not ( = ?auto_181079 ?auto_181076 ) ) ( not ( = ?auto_181071 ?auto_181070 ) ) ( not ( = ?auto_181072 ?auto_181070 ) ) ( not ( = ?auto_181073 ?auto_181070 ) ) ( not ( = ?auto_181069 ?auto_181070 ) ) ( not ( = ?auto_181077 ?auto_181079 ) ) ( not ( = ?auto_181077 ?auto_181075 ) ) ( not ( = ?auto_181077 ?auto_181076 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_181071 ?auto_181072 ?auto_181073 ?auto_181070 ?auto_181069 ?auto_181068 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_181120 - OBJ
      ?auto_181121 - OBJ
      ?auto_181122 - OBJ
      ?auto_181123 - OBJ
      ?auto_181124 - OBJ
      ?auto_181119 - LOCATION
    )
    :vars
    (
      ?auto_181128 - LOCATION
      ?auto_181129 - CITY
      ?auto_181130 - LOCATION
      ?auto_181126 - LOCATION
      ?auto_181127 - LOCATION
      ?auto_181125 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181128 ?auto_181129 ) ( IN-CITY ?auto_181119 ?auto_181129 ) ( not ( = ?auto_181119 ?auto_181128 ) ) ( OBJ-AT ?auto_181121 ?auto_181128 ) ( IN-CITY ?auto_181130 ?auto_181129 ) ( not ( = ?auto_181119 ?auto_181130 ) ) ( OBJ-AT ?auto_181120 ?auto_181130 ) ( IN-CITY ?auto_181126 ?auto_181129 ) ( not ( = ?auto_181119 ?auto_181126 ) ) ( OBJ-AT ?auto_181123 ?auto_181126 ) ( IN-CITY ?auto_181127 ?auto_181129 ) ( not ( = ?auto_181119 ?auto_181127 ) ) ( OBJ-AT ?auto_181124 ?auto_181127 ) ( OBJ-AT ?auto_181122 ?auto_181127 ) ( TRUCK-AT ?auto_181125 ?auto_181119 ) ( not ( = ?auto_181122 ?auto_181124 ) ) ( not ( = ?auto_181122 ?auto_181123 ) ) ( not ( = ?auto_181124 ?auto_181123 ) ) ( not ( = ?auto_181126 ?auto_181127 ) ) ( not ( = ?auto_181122 ?auto_181120 ) ) ( not ( = ?auto_181124 ?auto_181120 ) ) ( not ( = ?auto_181123 ?auto_181120 ) ) ( not ( = ?auto_181130 ?auto_181126 ) ) ( not ( = ?auto_181130 ?auto_181127 ) ) ( not ( = ?auto_181122 ?auto_181121 ) ) ( not ( = ?auto_181124 ?auto_181121 ) ) ( not ( = ?auto_181123 ?auto_181121 ) ) ( not ( = ?auto_181120 ?auto_181121 ) ) ( not ( = ?auto_181128 ?auto_181130 ) ) ( not ( = ?auto_181128 ?auto_181126 ) ) ( not ( = ?auto_181128 ?auto_181127 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_181122 ?auto_181124 ?auto_181123 ?auto_181121 ?auto_181120 ?auto_181119 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_181333 - OBJ
      ?auto_181334 - OBJ
      ?auto_181335 - OBJ
      ?auto_181336 - OBJ
      ?auto_181337 - OBJ
      ?auto_181332 - LOCATION
    )
    :vars
    (
      ?auto_181341 - LOCATION
      ?auto_181342 - CITY
      ?auto_181343 - LOCATION
      ?auto_181339 - LOCATION
      ?auto_181340 - LOCATION
      ?auto_181338 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181341 ?auto_181342 ) ( IN-CITY ?auto_181332 ?auto_181342 ) ( not ( = ?auto_181332 ?auto_181341 ) ) ( OBJ-AT ?auto_181334 ?auto_181341 ) ( IN-CITY ?auto_181343 ?auto_181342 ) ( not ( = ?auto_181332 ?auto_181343 ) ) ( OBJ-AT ?auto_181333 ?auto_181343 ) ( IN-CITY ?auto_181339 ?auto_181342 ) ( not ( = ?auto_181332 ?auto_181339 ) ) ( OBJ-AT ?auto_181337 ?auto_181339 ) ( IN-CITY ?auto_181340 ?auto_181342 ) ( not ( = ?auto_181332 ?auto_181340 ) ) ( OBJ-AT ?auto_181335 ?auto_181340 ) ( OBJ-AT ?auto_181336 ?auto_181340 ) ( TRUCK-AT ?auto_181338 ?auto_181332 ) ( not ( = ?auto_181336 ?auto_181335 ) ) ( not ( = ?auto_181336 ?auto_181337 ) ) ( not ( = ?auto_181335 ?auto_181337 ) ) ( not ( = ?auto_181339 ?auto_181340 ) ) ( not ( = ?auto_181336 ?auto_181333 ) ) ( not ( = ?auto_181335 ?auto_181333 ) ) ( not ( = ?auto_181337 ?auto_181333 ) ) ( not ( = ?auto_181343 ?auto_181339 ) ) ( not ( = ?auto_181343 ?auto_181340 ) ) ( not ( = ?auto_181336 ?auto_181334 ) ) ( not ( = ?auto_181335 ?auto_181334 ) ) ( not ( = ?auto_181337 ?auto_181334 ) ) ( not ( = ?auto_181333 ?auto_181334 ) ) ( not ( = ?auto_181341 ?auto_181343 ) ) ( not ( = ?auto_181341 ?auto_181339 ) ) ( not ( = ?auto_181341 ?auto_181340 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_181336 ?auto_181335 ?auto_181337 ?auto_181334 ?auto_181333 ?auto_181332 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_181439 - OBJ
      ?auto_181440 - OBJ
      ?auto_181441 - OBJ
      ?auto_181442 - OBJ
      ?auto_181443 - OBJ
      ?auto_181438 - LOCATION
    )
    :vars
    (
      ?auto_181447 - LOCATION
      ?auto_181448 - CITY
      ?auto_181449 - LOCATION
      ?auto_181445 - LOCATION
      ?auto_181446 - LOCATION
      ?auto_181444 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181447 ?auto_181448 ) ( IN-CITY ?auto_181438 ?auto_181448 ) ( not ( = ?auto_181438 ?auto_181447 ) ) ( OBJ-AT ?auto_181440 ?auto_181447 ) ( IN-CITY ?auto_181449 ?auto_181448 ) ( not ( = ?auto_181438 ?auto_181449 ) ) ( OBJ-AT ?auto_181439 ?auto_181449 ) ( IN-CITY ?auto_181445 ?auto_181448 ) ( not ( = ?auto_181438 ?auto_181445 ) ) ( OBJ-AT ?auto_181442 ?auto_181445 ) ( IN-CITY ?auto_181446 ?auto_181448 ) ( not ( = ?auto_181438 ?auto_181446 ) ) ( OBJ-AT ?auto_181441 ?auto_181446 ) ( OBJ-AT ?auto_181443 ?auto_181446 ) ( TRUCK-AT ?auto_181444 ?auto_181438 ) ( not ( = ?auto_181443 ?auto_181441 ) ) ( not ( = ?auto_181443 ?auto_181442 ) ) ( not ( = ?auto_181441 ?auto_181442 ) ) ( not ( = ?auto_181445 ?auto_181446 ) ) ( not ( = ?auto_181443 ?auto_181439 ) ) ( not ( = ?auto_181441 ?auto_181439 ) ) ( not ( = ?auto_181442 ?auto_181439 ) ) ( not ( = ?auto_181449 ?auto_181445 ) ) ( not ( = ?auto_181449 ?auto_181446 ) ) ( not ( = ?auto_181443 ?auto_181440 ) ) ( not ( = ?auto_181441 ?auto_181440 ) ) ( not ( = ?auto_181442 ?auto_181440 ) ) ( not ( = ?auto_181439 ?auto_181440 ) ) ( not ( = ?auto_181447 ?auto_181449 ) ) ( not ( = ?auto_181447 ?auto_181445 ) ) ( not ( = ?auto_181447 ?auto_181446 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_181443 ?auto_181441 ?auto_181442 ?auto_181440 ?auto_181439 ?auto_181438 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_181652 - OBJ
      ?auto_181653 - OBJ
      ?auto_181654 - OBJ
      ?auto_181655 - OBJ
      ?auto_181656 - OBJ
      ?auto_181651 - LOCATION
    )
    :vars
    (
      ?auto_181660 - LOCATION
      ?auto_181661 - CITY
      ?auto_181662 - LOCATION
      ?auto_181658 - LOCATION
      ?auto_181659 - LOCATION
      ?auto_181657 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181660 ?auto_181661 ) ( IN-CITY ?auto_181651 ?auto_181661 ) ( not ( = ?auto_181651 ?auto_181660 ) ) ( OBJ-AT ?auto_181653 ?auto_181660 ) ( IN-CITY ?auto_181662 ?auto_181661 ) ( not ( = ?auto_181651 ?auto_181662 ) ) ( OBJ-AT ?auto_181652 ?auto_181662 ) ( IN-CITY ?auto_181658 ?auto_181661 ) ( not ( = ?auto_181651 ?auto_181658 ) ) ( OBJ-AT ?auto_181654 ?auto_181658 ) ( IN-CITY ?auto_181659 ?auto_181661 ) ( not ( = ?auto_181651 ?auto_181659 ) ) ( OBJ-AT ?auto_181656 ?auto_181659 ) ( OBJ-AT ?auto_181655 ?auto_181659 ) ( TRUCK-AT ?auto_181657 ?auto_181651 ) ( not ( = ?auto_181655 ?auto_181656 ) ) ( not ( = ?auto_181655 ?auto_181654 ) ) ( not ( = ?auto_181656 ?auto_181654 ) ) ( not ( = ?auto_181658 ?auto_181659 ) ) ( not ( = ?auto_181655 ?auto_181652 ) ) ( not ( = ?auto_181656 ?auto_181652 ) ) ( not ( = ?auto_181654 ?auto_181652 ) ) ( not ( = ?auto_181662 ?auto_181658 ) ) ( not ( = ?auto_181662 ?auto_181659 ) ) ( not ( = ?auto_181655 ?auto_181653 ) ) ( not ( = ?auto_181656 ?auto_181653 ) ) ( not ( = ?auto_181654 ?auto_181653 ) ) ( not ( = ?auto_181652 ?auto_181653 ) ) ( not ( = ?auto_181660 ?auto_181662 ) ) ( not ( = ?auto_181660 ?auto_181658 ) ) ( not ( = ?auto_181660 ?auto_181659 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_181655 ?auto_181656 ?auto_181654 ?auto_181653 ?auto_181652 ?auto_181651 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_181703 - OBJ
      ?auto_181704 - OBJ
      ?auto_181705 - OBJ
      ?auto_181706 - OBJ
      ?auto_181707 - OBJ
      ?auto_181702 - LOCATION
    )
    :vars
    (
      ?auto_181711 - LOCATION
      ?auto_181712 - CITY
      ?auto_181713 - LOCATION
      ?auto_181709 - LOCATION
      ?auto_181710 - LOCATION
      ?auto_181708 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_181711 ?auto_181712 ) ( IN-CITY ?auto_181702 ?auto_181712 ) ( not ( = ?auto_181702 ?auto_181711 ) ) ( OBJ-AT ?auto_181704 ?auto_181711 ) ( IN-CITY ?auto_181713 ?auto_181712 ) ( not ( = ?auto_181702 ?auto_181713 ) ) ( OBJ-AT ?auto_181703 ?auto_181713 ) ( IN-CITY ?auto_181709 ?auto_181712 ) ( not ( = ?auto_181702 ?auto_181709 ) ) ( OBJ-AT ?auto_181705 ?auto_181709 ) ( IN-CITY ?auto_181710 ?auto_181712 ) ( not ( = ?auto_181702 ?auto_181710 ) ) ( OBJ-AT ?auto_181706 ?auto_181710 ) ( OBJ-AT ?auto_181707 ?auto_181710 ) ( TRUCK-AT ?auto_181708 ?auto_181702 ) ( not ( = ?auto_181707 ?auto_181706 ) ) ( not ( = ?auto_181707 ?auto_181705 ) ) ( not ( = ?auto_181706 ?auto_181705 ) ) ( not ( = ?auto_181709 ?auto_181710 ) ) ( not ( = ?auto_181707 ?auto_181703 ) ) ( not ( = ?auto_181706 ?auto_181703 ) ) ( not ( = ?auto_181705 ?auto_181703 ) ) ( not ( = ?auto_181713 ?auto_181709 ) ) ( not ( = ?auto_181713 ?auto_181710 ) ) ( not ( = ?auto_181707 ?auto_181704 ) ) ( not ( = ?auto_181706 ?auto_181704 ) ) ( not ( = ?auto_181705 ?auto_181704 ) ) ( not ( = ?auto_181703 ?auto_181704 ) ) ( not ( = ?auto_181711 ?auto_181713 ) ) ( not ( = ?auto_181711 ?auto_181709 ) ) ( not ( = ?auto_181711 ?auto_181710 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_181707 ?auto_181706 ?auto_181705 ?auto_181704 ?auto_181703 ?auto_181702 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_183190 - OBJ
      ?auto_183191 - OBJ
      ?auto_183192 - OBJ
      ?auto_183193 - OBJ
      ?auto_183194 - OBJ
      ?auto_183189 - LOCATION
    )
    :vars
    (
      ?auto_183198 - LOCATION
      ?auto_183199 - CITY
      ?auto_183200 - LOCATION
      ?auto_183196 - LOCATION
      ?auto_183197 - LOCATION
      ?auto_183195 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_183198 ?auto_183199 ) ( IN-CITY ?auto_183189 ?auto_183199 ) ( not ( = ?auto_183189 ?auto_183198 ) ) ( OBJ-AT ?auto_183190 ?auto_183198 ) ( IN-CITY ?auto_183200 ?auto_183199 ) ( not ( = ?auto_183189 ?auto_183200 ) ) ( OBJ-AT ?auto_183194 ?auto_183200 ) ( IN-CITY ?auto_183196 ?auto_183199 ) ( not ( = ?auto_183189 ?auto_183196 ) ) ( OBJ-AT ?auto_183193 ?auto_183196 ) ( IN-CITY ?auto_183197 ?auto_183199 ) ( not ( = ?auto_183189 ?auto_183197 ) ) ( OBJ-AT ?auto_183192 ?auto_183197 ) ( OBJ-AT ?auto_183191 ?auto_183197 ) ( TRUCK-AT ?auto_183195 ?auto_183189 ) ( not ( = ?auto_183191 ?auto_183192 ) ) ( not ( = ?auto_183191 ?auto_183193 ) ) ( not ( = ?auto_183192 ?auto_183193 ) ) ( not ( = ?auto_183196 ?auto_183197 ) ) ( not ( = ?auto_183191 ?auto_183194 ) ) ( not ( = ?auto_183192 ?auto_183194 ) ) ( not ( = ?auto_183193 ?auto_183194 ) ) ( not ( = ?auto_183200 ?auto_183196 ) ) ( not ( = ?auto_183200 ?auto_183197 ) ) ( not ( = ?auto_183191 ?auto_183190 ) ) ( not ( = ?auto_183192 ?auto_183190 ) ) ( not ( = ?auto_183193 ?auto_183190 ) ) ( not ( = ?auto_183194 ?auto_183190 ) ) ( not ( = ?auto_183198 ?auto_183200 ) ) ( not ( = ?auto_183198 ?auto_183196 ) ) ( not ( = ?auto_183198 ?auto_183197 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_183191 ?auto_183192 ?auto_183193 ?auto_183190 ?auto_183194 ?auto_183189 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_183241 - OBJ
      ?auto_183242 - OBJ
      ?auto_183243 - OBJ
      ?auto_183244 - OBJ
      ?auto_183245 - OBJ
      ?auto_183240 - LOCATION
    )
    :vars
    (
      ?auto_183249 - LOCATION
      ?auto_183250 - CITY
      ?auto_183251 - LOCATION
      ?auto_183247 - LOCATION
      ?auto_183248 - LOCATION
      ?auto_183246 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_183249 ?auto_183250 ) ( IN-CITY ?auto_183240 ?auto_183250 ) ( not ( = ?auto_183240 ?auto_183249 ) ) ( OBJ-AT ?auto_183241 ?auto_183249 ) ( IN-CITY ?auto_183251 ?auto_183250 ) ( not ( = ?auto_183240 ?auto_183251 ) ) ( OBJ-AT ?auto_183244 ?auto_183251 ) ( IN-CITY ?auto_183247 ?auto_183250 ) ( not ( = ?auto_183240 ?auto_183247 ) ) ( OBJ-AT ?auto_183245 ?auto_183247 ) ( IN-CITY ?auto_183248 ?auto_183250 ) ( not ( = ?auto_183240 ?auto_183248 ) ) ( OBJ-AT ?auto_183243 ?auto_183248 ) ( OBJ-AT ?auto_183242 ?auto_183248 ) ( TRUCK-AT ?auto_183246 ?auto_183240 ) ( not ( = ?auto_183242 ?auto_183243 ) ) ( not ( = ?auto_183242 ?auto_183245 ) ) ( not ( = ?auto_183243 ?auto_183245 ) ) ( not ( = ?auto_183247 ?auto_183248 ) ) ( not ( = ?auto_183242 ?auto_183244 ) ) ( not ( = ?auto_183243 ?auto_183244 ) ) ( not ( = ?auto_183245 ?auto_183244 ) ) ( not ( = ?auto_183251 ?auto_183247 ) ) ( not ( = ?auto_183251 ?auto_183248 ) ) ( not ( = ?auto_183242 ?auto_183241 ) ) ( not ( = ?auto_183243 ?auto_183241 ) ) ( not ( = ?auto_183245 ?auto_183241 ) ) ( not ( = ?auto_183244 ?auto_183241 ) ) ( not ( = ?auto_183249 ?auto_183251 ) ) ( not ( = ?auto_183249 ?auto_183247 ) ) ( not ( = ?auto_183249 ?auto_183248 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_183242 ?auto_183243 ?auto_183245 ?auto_183241 ?auto_183244 ?auto_183240 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_183454 - OBJ
      ?auto_183455 - OBJ
      ?auto_183456 - OBJ
      ?auto_183457 - OBJ
      ?auto_183458 - OBJ
      ?auto_183453 - LOCATION
    )
    :vars
    (
      ?auto_183462 - LOCATION
      ?auto_183463 - CITY
      ?auto_183464 - LOCATION
      ?auto_183460 - LOCATION
      ?auto_183461 - LOCATION
      ?auto_183459 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_183462 ?auto_183463 ) ( IN-CITY ?auto_183453 ?auto_183463 ) ( not ( = ?auto_183453 ?auto_183462 ) ) ( OBJ-AT ?auto_183454 ?auto_183462 ) ( IN-CITY ?auto_183464 ?auto_183463 ) ( not ( = ?auto_183453 ?auto_183464 ) ) ( OBJ-AT ?auto_183458 ?auto_183464 ) ( IN-CITY ?auto_183460 ?auto_183463 ) ( not ( = ?auto_183453 ?auto_183460 ) ) ( OBJ-AT ?auto_183456 ?auto_183460 ) ( IN-CITY ?auto_183461 ?auto_183463 ) ( not ( = ?auto_183453 ?auto_183461 ) ) ( OBJ-AT ?auto_183457 ?auto_183461 ) ( OBJ-AT ?auto_183455 ?auto_183461 ) ( TRUCK-AT ?auto_183459 ?auto_183453 ) ( not ( = ?auto_183455 ?auto_183457 ) ) ( not ( = ?auto_183455 ?auto_183456 ) ) ( not ( = ?auto_183457 ?auto_183456 ) ) ( not ( = ?auto_183460 ?auto_183461 ) ) ( not ( = ?auto_183455 ?auto_183458 ) ) ( not ( = ?auto_183457 ?auto_183458 ) ) ( not ( = ?auto_183456 ?auto_183458 ) ) ( not ( = ?auto_183464 ?auto_183460 ) ) ( not ( = ?auto_183464 ?auto_183461 ) ) ( not ( = ?auto_183455 ?auto_183454 ) ) ( not ( = ?auto_183457 ?auto_183454 ) ) ( not ( = ?auto_183456 ?auto_183454 ) ) ( not ( = ?auto_183458 ?auto_183454 ) ) ( not ( = ?auto_183462 ?auto_183464 ) ) ( not ( = ?auto_183462 ?auto_183460 ) ) ( not ( = ?auto_183462 ?auto_183461 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_183455 ?auto_183457 ?auto_183456 ?auto_183454 ?auto_183458 ?auto_183453 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_183560 - OBJ
      ?auto_183561 - OBJ
      ?auto_183562 - OBJ
      ?auto_183563 - OBJ
      ?auto_183564 - OBJ
      ?auto_183559 - LOCATION
    )
    :vars
    (
      ?auto_183568 - LOCATION
      ?auto_183569 - CITY
      ?auto_183570 - LOCATION
      ?auto_183566 - LOCATION
      ?auto_183567 - LOCATION
      ?auto_183565 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_183568 ?auto_183569 ) ( IN-CITY ?auto_183559 ?auto_183569 ) ( not ( = ?auto_183559 ?auto_183568 ) ) ( OBJ-AT ?auto_183560 ?auto_183568 ) ( IN-CITY ?auto_183570 ?auto_183569 ) ( not ( = ?auto_183559 ?auto_183570 ) ) ( OBJ-AT ?auto_183563 ?auto_183570 ) ( IN-CITY ?auto_183566 ?auto_183569 ) ( not ( = ?auto_183559 ?auto_183566 ) ) ( OBJ-AT ?auto_183562 ?auto_183566 ) ( IN-CITY ?auto_183567 ?auto_183569 ) ( not ( = ?auto_183559 ?auto_183567 ) ) ( OBJ-AT ?auto_183564 ?auto_183567 ) ( OBJ-AT ?auto_183561 ?auto_183567 ) ( TRUCK-AT ?auto_183565 ?auto_183559 ) ( not ( = ?auto_183561 ?auto_183564 ) ) ( not ( = ?auto_183561 ?auto_183562 ) ) ( not ( = ?auto_183564 ?auto_183562 ) ) ( not ( = ?auto_183566 ?auto_183567 ) ) ( not ( = ?auto_183561 ?auto_183563 ) ) ( not ( = ?auto_183564 ?auto_183563 ) ) ( not ( = ?auto_183562 ?auto_183563 ) ) ( not ( = ?auto_183570 ?auto_183566 ) ) ( not ( = ?auto_183570 ?auto_183567 ) ) ( not ( = ?auto_183561 ?auto_183560 ) ) ( not ( = ?auto_183564 ?auto_183560 ) ) ( not ( = ?auto_183562 ?auto_183560 ) ) ( not ( = ?auto_183563 ?auto_183560 ) ) ( not ( = ?auto_183568 ?auto_183570 ) ) ( not ( = ?auto_183568 ?auto_183566 ) ) ( not ( = ?auto_183568 ?auto_183567 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_183561 ?auto_183564 ?auto_183562 ?auto_183560 ?auto_183563 ?auto_183559 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_183773 - OBJ
      ?auto_183774 - OBJ
      ?auto_183775 - OBJ
      ?auto_183776 - OBJ
      ?auto_183777 - OBJ
      ?auto_183772 - LOCATION
    )
    :vars
    (
      ?auto_183781 - LOCATION
      ?auto_183782 - CITY
      ?auto_183783 - LOCATION
      ?auto_183779 - LOCATION
      ?auto_183780 - LOCATION
      ?auto_183778 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_183781 ?auto_183782 ) ( IN-CITY ?auto_183772 ?auto_183782 ) ( not ( = ?auto_183772 ?auto_183781 ) ) ( OBJ-AT ?auto_183773 ?auto_183781 ) ( IN-CITY ?auto_183783 ?auto_183782 ) ( not ( = ?auto_183772 ?auto_183783 ) ) ( OBJ-AT ?auto_183775 ?auto_183783 ) ( IN-CITY ?auto_183779 ?auto_183782 ) ( not ( = ?auto_183772 ?auto_183779 ) ) ( OBJ-AT ?auto_183777 ?auto_183779 ) ( IN-CITY ?auto_183780 ?auto_183782 ) ( not ( = ?auto_183772 ?auto_183780 ) ) ( OBJ-AT ?auto_183776 ?auto_183780 ) ( OBJ-AT ?auto_183774 ?auto_183780 ) ( TRUCK-AT ?auto_183778 ?auto_183772 ) ( not ( = ?auto_183774 ?auto_183776 ) ) ( not ( = ?auto_183774 ?auto_183777 ) ) ( not ( = ?auto_183776 ?auto_183777 ) ) ( not ( = ?auto_183779 ?auto_183780 ) ) ( not ( = ?auto_183774 ?auto_183775 ) ) ( not ( = ?auto_183776 ?auto_183775 ) ) ( not ( = ?auto_183777 ?auto_183775 ) ) ( not ( = ?auto_183783 ?auto_183779 ) ) ( not ( = ?auto_183783 ?auto_183780 ) ) ( not ( = ?auto_183774 ?auto_183773 ) ) ( not ( = ?auto_183776 ?auto_183773 ) ) ( not ( = ?auto_183777 ?auto_183773 ) ) ( not ( = ?auto_183775 ?auto_183773 ) ) ( not ( = ?auto_183781 ?auto_183783 ) ) ( not ( = ?auto_183781 ?auto_183779 ) ) ( not ( = ?auto_183781 ?auto_183780 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_183774 ?auto_183776 ?auto_183777 ?auto_183773 ?auto_183775 ?auto_183772 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_183824 - OBJ
      ?auto_183825 - OBJ
      ?auto_183826 - OBJ
      ?auto_183827 - OBJ
      ?auto_183828 - OBJ
      ?auto_183823 - LOCATION
    )
    :vars
    (
      ?auto_183832 - LOCATION
      ?auto_183833 - CITY
      ?auto_183834 - LOCATION
      ?auto_183830 - LOCATION
      ?auto_183831 - LOCATION
      ?auto_183829 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_183832 ?auto_183833 ) ( IN-CITY ?auto_183823 ?auto_183833 ) ( not ( = ?auto_183823 ?auto_183832 ) ) ( OBJ-AT ?auto_183824 ?auto_183832 ) ( IN-CITY ?auto_183834 ?auto_183833 ) ( not ( = ?auto_183823 ?auto_183834 ) ) ( OBJ-AT ?auto_183826 ?auto_183834 ) ( IN-CITY ?auto_183830 ?auto_183833 ) ( not ( = ?auto_183823 ?auto_183830 ) ) ( OBJ-AT ?auto_183827 ?auto_183830 ) ( IN-CITY ?auto_183831 ?auto_183833 ) ( not ( = ?auto_183823 ?auto_183831 ) ) ( OBJ-AT ?auto_183828 ?auto_183831 ) ( OBJ-AT ?auto_183825 ?auto_183831 ) ( TRUCK-AT ?auto_183829 ?auto_183823 ) ( not ( = ?auto_183825 ?auto_183828 ) ) ( not ( = ?auto_183825 ?auto_183827 ) ) ( not ( = ?auto_183828 ?auto_183827 ) ) ( not ( = ?auto_183830 ?auto_183831 ) ) ( not ( = ?auto_183825 ?auto_183826 ) ) ( not ( = ?auto_183828 ?auto_183826 ) ) ( not ( = ?auto_183827 ?auto_183826 ) ) ( not ( = ?auto_183834 ?auto_183830 ) ) ( not ( = ?auto_183834 ?auto_183831 ) ) ( not ( = ?auto_183825 ?auto_183824 ) ) ( not ( = ?auto_183828 ?auto_183824 ) ) ( not ( = ?auto_183827 ?auto_183824 ) ) ( not ( = ?auto_183826 ?auto_183824 ) ) ( not ( = ?auto_183832 ?auto_183834 ) ) ( not ( = ?auto_183832 ?auto_183830 ) ) ( not ( = ?auto_183832 ?auto_183831 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_183825 ?auto_183828 ?auto_183827 ?auto_183824 ?auto_183826 ?auto_183823 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_184534 - OBJ
      ?auto_184535 - OBJ
      ?auto_184536 - OBJ
      ?auto_184537 - OBJ
      ?auto_184538 - OBJ
      ?auto_184533 - LOCATION
    )
    :vars
    (
      ?auto_184542 - LOCATION
      ?auto_184543 - CITY
      ?auto_184544 - LOCATION
      ?auto_184540 - LOCATION
      ?auto_184541 - LOCATION
      ?auto_184539 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_184542 ?auto_184543 ) ( IN-CITY ?auto_184533 ?auto_184543 ) ( not ( = ?auto_184533 ?auto_184542 ) ) ( OBJ-AT ?auto_184534 ?auto_184542 ) ( IN-CITY ?auto_184544 ?auto_184543 ) ( not ( = ?auto_184533 ?auto_184544 ) ) ( OBJ-AT ?auto_184538 ?auto_184544 ) ( IN-CITY ?auto_184540 ?auto_184543 ) ( not ( = ?auto_184533 ?auto_184540 ) ) ( OBJ-AT ?auto_184537 ?auto_184540 ) ( IN-CITY ?auto_184541 ?auto_184543 ) ( not ( = ?auto_184533 ?auto_184541 ) ) ( OBJ-AT ?auto_184535 ?auto_184541 ) ( OBJ-AT ?auto_184536 ?auto_184541 ) ( TRUCK-AT ?auto_184539 ?auto_184533 ) ( not ( = ?auto_184536 ?auto_184535 ) ) ( not ( = ?auto_184536 ?auto_184537 ) ) ( not ( = ?auto_184535 ?auto_184537 ) ) ( not ( = ?auto_184540 ?auto_184541 ) ) ( not ( = ?auto_184536 ?auto_184538 ) ) ( not ( = ?auto_184535 ?auto_184538 ) ) ( not ( = ?auto_184537 ?auto_184538 ) ) ( not ( = ?auto_184544 ?auto_184540 ) ) ( not ( = ?auto_184544 ?auto_184541 ) ) ( not ( = ?auto_184536 ?auto_184534 ) ) ( not ( = ?auto_184535 ?auto_184534 ) ) ( not ( = ?auto_184537 ?auto_184534 ) ) ( not ( = ?auto_184538 ?auto_184534 ) ) ( not ( = ?auto_184542 ?auto_184544 ) ) ( not ( = ?auto_184542 ?auto_184540 ) ) ( not ( = ?auto_184542 ?auto_184541 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_184536 ?auto_184535 ?auto_184537 ?auto_184534 ?auto_184538 ?auto_184533 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_184585 - OBJ
      ?auto_184586 - OBJ
      ?auto_184587 - OBJ
      ?auto_184588 - OBJ
      ?auto_184589 - OBJ
      ?auto_184584 - LOCATION
    )
    :vars
    (
      ?auto_184593 - LOCATION
      ?auto_184594 - CITY
      ?auto_184595 - LOCATION
      ?auto_184591 - LOCATION
      ?auto_184592 - LOCATION
      ?auto_184590 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_184593 ?auto_184594 ) ( IN-CITY ?auto_184584 ?auto_184594 ) ( not ( = ?auto_184584 ?auto_184593 ) ) ( OBJ-AT ?auto_184585 ?auto_184593 ) ( IN-CITY ?auto_184595 ?auto_184594 ) ( not ( = ?auto_184584 ?auto_184595 ) ) ( OBJ-AT ?auto_184588 ?auto_184595 ) ( IN-CITY ?auto_184591 ?auto_184594 ) ( not ( = ?auto_184584 ?auto_184591 ) ) ( OBJ-AT ?auto_184589 ?auto_184591 ) ( IN-CITY ?auto_184592 ?auto_184594 ) ( not ( = ?auto_184584 ?auto_184592 ) ) ( OBJ-AT ?auto_184586 ?auto_184592 ) ( OBJ-AT ?auto_184587 ?auto_184592 ) ( TRUCK-AT ?auto_184590 ?auto_184584 ) ( not ( = ?auto_184587 ?auto_184586 ) ) ( not ( = ?auto_184587 ?auto_184589 ) ) ( not ( = ?auto_184586 ?auto_184589 ) ) ( not ( = ?auto_184591 ?auto_184592 ) ) ( not ( = ?auto_184587 ?auto_184588 ) ) ( not ( = ?auto_184586 ?auto_184588 ) ) ( not ( = ?auto_184589 ?auto_184588 ) ) ( not ( = ?auto_184595 ?auto_184591 ) ) ( not ( = ?auto_184595 ?auto_184592 ) ) ( not ( = ?auto_184587 ?auto_184585 ) ) ( not ( = ?auto_184586 ?auto_184585 ) ) ( not ( = ?auto_184589 ?auto_184585 ) ) ( not ( = ?auto_184588 ?auto_184585 ) ) ( not ( = ?auto_184593 ?auto_184595 ) ) ( not ( = ?auto_184593 ?auto_184591 ) ) ( not ( = ?auto_184593 ?auto_184592 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_184587 ?auto_184586 ?auto_184589 ?auto_184585 ?auto_184588 ?auto_184584 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_185078 - OBJ
      ?auto_185079 - OBJ
      ?auto_185080 - OBJ
      ?auto_185081 - OBJ
      ?auto_185082 - OBJ
      ?auto_185077 - LOCATION
    )
    :vars
    (
      ?auto_185086 - LOCATION
      ?auto_185087 - CITY
      ?auto_185088 - LOCATION
      ?auto_185084 - LOCATION
      ?auto_185085 - LOCATION
      ?auto_185083 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_185086 ?auto_185087 ) ( IN-CITY ?auto_185077 ?auto_185087 ) ( not ( = ?auto_185077 ?auto_185086 ) ) ( OBJ-AT ?auto_185078 ?auto_185086 ) ( IN-CITY ?auto_185088 ?auto_185087 ) ( not ( = ?auto_185077 ?auto_185088 ) ) ( OBJ-AT ?auto_185082 ?auto_185088 ) ( IN-CITY ?auto_185084 ?auto_185087 ) ( not ( = ?auto_185077 ?auto_185084 ) ) ( OBJ-AT ?auto_185080 ?auto_185084 ) ( IN-CITY ?auto_185085 ?auto_185087 ) ( not ( = ?auto_185077 ?auto_185085 ) ) ( OBJ-AT ?auto_185079 ?auto_185085 ) ( OBJ-AT ?auto_185081 ?auto_185085 ) ( TRUCK-AT ?auto_185083 ?auto_185077 ) ( not ( = ?auto_185081 ?auto_185079 ) ) ( not ( = ?auto_185081 ?auto_185080 ) ) ( not ( = ?auto_185079 ?auto_185080 ) ) ( not ( = ?auto_185084 ?auto_185085 ) ) ( not ( = ?auto_185081 ?auto_185082 ) ) ( not ( = ?auto_185079 ?auto_185082 ) ) ( not ( = ?auto_185080 ?auto_185082 ) ) ( not ( = ?auto_185088 ?auto_185084 ) ) ( not ( = ?auto_185088 ?auto_185085 ) ) ( not ( = ?auto_185081 ?auto_185078 ) ) ( not ( = ?auto_185079 ?auto_185078 ) ) ( not ( = ?auto_185080 ?auto_185078 ) ) ( not ( = ?auto_185082 ?auto_185078 ) ) ( not ( = ?auto_185086 ?auto_185088 ) ) ( not ( = ?auto_185086 ?auto_185084 ) ) ( not ( = ?auto_185086 ?auto_185085 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_185081 ?auto_185079 ?auto_185080 ?auto_185078 ?auto_185082 ?auto_185077 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_185239 - OBJ
      ?auto_185240 - OBJ
      ?auto_185241 - OBJ
      ?auto_185242 - OBJ
      ?auto_185243 - OBJ
      ?auto_185238 - LOCATION
    )
    :vars
    (
      ?auto_185247 - LOCATION
      ?auto_185248 - CITY
      ?auto_185249 - LOCATION
      ?auto_185245 - LOCATION
      ?auto_185246 - LOCATION
      ?auto_185244 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_185247 ?auto_185248 ) ( IN-CITY ?auto_185238 ?auto_185248 ) ( not ( = ?auto_185238 ?auto_185247 ) ) ( OBJ-AT ?auto_185239 ?auto_185247 ) ( IN-CITY ?auto_185249 ?auto_185248 ) ( not ( = ?auto_185238 ?auto_185249 ) ) ( OBJ-AT ?auto_185242 ?auto_185249 ) ( IN-CITY ?auto_185245 ?auto_185248 ) ( not ( = ?auto_185238 ?auto_185245 ) ) ( OBJ-AT ?auto_185241 ?auto_185245 ) ( IN-CITY ?auto_185246 ?auto_185248 ) ( not ( = ?auto_185238 ?auto_185246 ) ) ( OBJ-AT ?auto_185240 ?auto_185246 ) ( OBJ-AT ?auto_185243 ?auto_185246 ) ( TRUCK-AT ?auto_185244 ?auto_185238 ) ( not ( = ?auto_185243 ?auto_185240 ) ) ( not ( = ?auto_185243 ?auto_185241 ) ) ( not ( = ?auto_185240 ?auto_185241 ) ) ( not ( = ?auto_185245 ?auto_185246 ) ) ( not ( = ?auto_185243 ?auto_185242 ) ) ( not ( = ?auto_185240 ?auto_185242 ) ) ( not ( = ?auto_185241 ?auto_185242 ) ) ( not ( = ?auto_185249 ?auto_185245 ) ) ( not ( = ?auto_185249 ?auto_185246 ) ) ( not ( = ?auto_185243 ?auto_185239 ) ) ( not ( = ?auto_185240 ?auto_185239 ) ) ( not ( = ?auto_185241 ?auto_185239 ) ) ( not ( = ?auto_185242 ?auto_185239 ) ) ( not ( = ?auto_185247 ?auto_185249 ) ) ( not ( = ?auto_185247 ?auto_185245 ) ) ( not ( = ?auto_185247 ?auto_185246 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_185243 ?auto_185240 ?auto_185241 ?auto_185239 ?auto_185242 ?auto_185238 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_185397 - OBJ
      ?auto_185398 - OBJ
      ?auto_185399 - OBJ
      ?auto_185400 - OBJ
      ?auto_185401 - OBJ
      ?auto_185396 - LOCATION
    )
    :vars
    (
      ?auto_185405 - LOCATION
      ?auto_185406 - CITY
      ?auto_185407 - LOCATION
      ?auto_185403 - LOCATION
      ?auto_185404 - LOCATION
      ?auto_185402 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_185405 ?auto_185406 ) ( IN-CITY ?auto_185396 ?auto_185406 ) ( not ( = ?auto_185396 ?auto_185405 ) ) ( OBJ-AT ?auto_185397 ?auto_185405 ) ( IN-CITY ?auto_185407 ?auto_185406 ) ( not ( = ?auto_185396 ?auto_185407 ) ) ( OBJ-AT ?auto_185399 ?auto_185407 ) ( IN-CITY ?auto_185403 ?auto_185406 ) ( not ( = ?auto_185396 ?auto_185403 ) ) ( OBJ-AT ?auto_185401 ?auto_185403 ) ( IN-CITY ?auto_185404 ?auto_185406 ) ( not ( = ?auto_185396 ?auto_185404 ) ) ( OBJ-AT ?auto_185398 ?auto_185404 ) ( OBJ-AT ?auto_185400 ?auto_185404 ) ( TRUCK-AT ?auto_185402 ?auto_185396 ) ( not ( = ?auto_185400 ?auto_185398 ) ) ( not ( = ?auto_185400 ?auto_185401 ) ) ( not ( = ?auto_185398 ?auto_185401 ) ) ( not ( = ?auto_185403 ?auto_185404 ) ) ( not ( = ?auto_185400 ?auto_185399 ) ) ( not ( = ?auto_185398 ?auto_185399 ) ) ( not ( = ?auto_185401 ?auto_185399 ) ) ( not ( = ?auto_185407 ?auto_185403 ) ) ( not ( = ?auto_185407 ?auto_185404 ) ) ( not ( = ?auto_185400 ?auto_185397 ) ) ( not ( = ?auto_185398 ?auto_185397 ) ) ( not ( = ?auto_185401 ?auto_185397 ) ) ( not ( = ?auto_185399 ?auto_185397 ) ) ( not ( = ?auto_185405 ?auto_185407 ) ) ( not ( = ?auto_185405 ?auto_185403 ) ) ( not ( = ?auto_185405 ?auto_185404 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_185400 ?auto_185398 ?auto_185401 ?auto_185397 ?auto_185399 ?auto_185396 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_185503 - OBJ
      ?auto_185504 - OBJ
      ?auto_185505 - OBJ
      ?auto_185506 - OBJ
      ?auto_185507 - OBJ
      ?auto_185502 - LOCATION
    )
    :vars
    (
      ?auto_185511 - LOCATION
      ?auto_185512 - CITY
      ?auto_185513 - LOCATION
      ?auto_185509 - LOCATION
      ?auto_185510 - LOCATION
      ?auto_185508 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_185511 ?auto_185512 ) ( IN-CITY ?auto_185502 ?auto_185512 ) ( not ( = ?auto_185502 ?auto_185511 ) ) ( OBJ-AT ?auto_185503 ?auto_185511 ) ( IN-CITY ?auto_185513 ?auto_185512 ) ( not ( = ?auto_185502 ?auto_185513 ) ) ( OBJ-AT ?auto_185505 ?auto_185513 ) ( IN-CITY ?auto_185509 ?auto_185512 ) ( not ( = ?auto_185502 ?auto_185509 ) ) ( OBJ-AT ?auto_185506 ?auto_185509 ) ( IN-CITY ?auto_185510 ?auto_185512 ) ( not ( = ?auto_185502 ?auto_185510 ) ) ( OBJ-AT ?auto_185504 ?auto_185510 ) ( OBJ-AT ?auto_185507 ?auto_185510 ) ( TRUCK-AT ?auto_185508 ?auto_185502 ) ( not ( = ?auto_185507 ?auto_185504 ) ) ( not ( = ?auto_185507 ?auto_185506 ) ) ( not ( = ?auto_185504 ?auto_185506 ) ) ( not ( = ?auto_185509 ?auto_185510 ) ) ( not ( = ?auto_185507 ?auto_185505 ) ) ( not ( = ?auto_185504 ?auto_185505 ) ) ( not ( = ?auto_185506 ?auto_185505 ) ) ( not ( = ?auto_185513 ?auto_185509 ) ) ( not ( = ?auto_185513 ?auto_185510 ) ) ( not ( = ?auto_185507 ?auto_185503 ) ) ( not ( = ?auto_185504 ?auto_185503 ) ) ( not ( = ?auto_185506 ?auto_185503 ) ) ( not ( = ?auto_185505 ?auto_185503 ) ) ( not ( = ?auto_185511 ?auto_185513 ) ) ( not ( = ?auto_185511 ?auto_185509 ) ) ( not ( = ?auto_185511 ?auto_185510 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_185507 ?auto_185504 ?auto_185506 ?auto_185503 ?auto_185505 ?auto_185502 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_186158 - OBJ
      ?auto_186159 - OBJ
      ?auto_186160 - OBJ
      ?auto_186161 - OBJ
      ?auto_186162 - OBJ
      ?auto_186157 - LOCATION
    )
    :vars
    (
      ?auto_186166 - LOCATION
      ?auto_186167 - CITY
      ?auto_186168 - LOCATION
      ?auto_186164 - LOCATION
      ?auto_186165 - LOCATION
      ?auto_186163 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_186166 ?auto_186167 ) ( IN-CITY ?auto_186157 ?auto_186167 ) ( not ( = ?auto_186157 ?auto_186166 ) ) ( OBJ-AT ?auto_186158 ?auto_186166 ) ( IN-CITY ?auto_186168 ?auto_186167 ) ( not ( = ?auto_186157 ?auto_186168 ) ) ( OBJ-AT ?auto_186162 ?auto_186168 ) ( IN-CITY ?auto_186164 ?auto_186167 ) ( not ( = ?auto_186157 ?auto_186164 ) ) ( OBJ-AT ?auto_186159 ?auto_186164 ) ( IN-CITY ?auto_186165 ?auto_186167 ) ( not ( = ?auto_186157 ?auto_186165 ) ) ( OBJ-AT ?auto_186161 ?auto_186165 ) ( OBJ-AT ?auto_186160 ?auto_186165 ) ( TRUCK-AT ?auto_186163 ?auto_186157 ) ( not ( = ?auto_186160 ?auto_186161 ) ) ( not ( = ?auto_186160 ?auto_186159 ) ) ( not ( = ?auto_186161 ?auto_186159 ) ) ( not ( = ?auto_186164 ?auto_186165 ) ) ( not ( = ?auto_186160 ?auto_186162 ) ) ( not ( = ?auto_186161 ?auto_186162 ) ) ( not ( = ?auto_186159 ?auto_186162 ) ) ( not ( = ?auto_186168 ?auto_186164 ) ) ( not ( = ?auto_186168 ?auto_186165 ) ) ( not ( = ?auto_186160 ?auto_186158 ) ) ( not ( = ?auto_186161 ?auto_186158 ) ) ( not ( = ?auto_186159 ?auto_186158 ) ) ( not ( = ?auto_186162 ?auto_186158 ) ) ( not ( = ?auto_186166 ?auto_186168 ) ) ( not ( = ?auto_186166 ?auto_186164 ) ) ( not ( = ?auto_186166 ?auto_186165 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_186160 ?auto_186161 ?auto_186159 ?auto_186158 ?auto_186162 ?auto_186157 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_186264 - OBJ
      ?auto_186265 - OBJ
      ?auto_186266 - OBJ
      ?auto_186267 - OBJ
      ?auto_186268 - OBJ
      ?auto_186263 - LOCATION
    )
    :vars
    (
      ?auto_186272 - LOCATION
      ?auto_186273 - CITY
      ?auto_186274 - LOCATION
      ?auto_186270 - LOCATION
      ?auto_186271 - LOCATION
      ?auto_186269 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_186272 ?auto_186273 ) ( IN-CITY ?auto_186263 ?auto_186273 ) ( not ( = ?auto_186263 ?auto_186272 ) ) ( OBJ-AT ?auto_186264 ?auto_186272 ) ( IN-CITY ?auto_186274 ?auto_186273 ) ( not ( = ?auto_186263 ?auto_186274 ) ) ( OBJ-AT ?auto_186267 ?auto_186274 ) ( IN-CITY ?auto_186270 ?auto_186273 ) ( not ( = ?auto_186263 ?auto_186270 ) ) ( OBJ-AT ?auto_186265 ?auto_186270 ) ( IN-CITY ?auto_186271 ?auto_186273 ) ( not ( = ?auto_186263 ?auto_186271 ) ) ( OBJ-AT ?auto_186268 ?auto_186271 ) ( OBJ-AT ?auto_186266 ?auto_186271 ) ( TRUCK-AT ?auto_186269 ?auto_186263 ) ( not ( = ?auto_186266 ?auto_186268 ) ) ( not ( = ?auto_186266 ?auto_186265 ) ) ( not ( = ?auto_186268 ?auto_186265 ) ) ( not ( = ?auto_186270 ?auto_186271 ) ) ( not ( = ?auto_186266 ?auto_186267 ) ) ( not ( = ?auto_186268 ?auto_186267 ) ) ( not ( = ?auto_186265 ?auto_186267 ) ) ( not ( = ?auto_186274 ?auto_186270 ) ) ( not ( = ?auto_186274 ?auto_186271 ) ) ( not ( = ?auto_186266 ?auto_186264 ) ) ( not ( = ?auto_186268 ?auto_186264 ) ) ( not ( = ?auto_186265 ?auto_186264 ) ) ( not ( = ?auto_186267 ?auto_186264 ) ) ( not ( = ?auto_186272 ?auto_186274 ) ) ( not ( = ?auto_186272 ?auto_186270 ) ) ( not ( = ?auto_186272 ?auto_186271 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_186266 ?auto_186268 ?auto_186265 ?auto_186264 ?auto_186267 ?auto_186263 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_186422 - OBJ
      ?auto_186423 - OBJ
      ?auto_186424 - OBJ
      ?auto_186425 - OBJ
      ?auto_186426 - OBJ
      ?auto_186421 - LOCATION
    )
    :vars
    (
      ?auto_186430 - LOCATION
      ?auto_186431 - CITY
      ?auto_186432 - LOCATION
      ?auto_186428 - LOCATION
      ?auto_186429 - LOCATION
      ?auto_186427 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_186430 ?auto_186431 ) ( IN-CITY ?auto_186421 ?auto_186431 ) ( not ( = ?auto_186421 ?auto_186430 ) ) ( OBJ-AT ?auto_186422 ?auto_186430 ) ( IN-CITY ?auto_186432 ?auto_186431 ) ( not ( = ?auto_186421 ?auto_186432 ) ) ( OBJ-AT ?auto_186426 ?auto_186432 ) ( IN-CITY ?auto_186428 ?auto_186431 ) ( not ( = ?auto_186421 ?auto_186428 ) ) ( OBJ-AT ?auto_186423 ?auto_186428 ) ( IN-CITY ?auto_186429 ?auto_186431 ) ( not ( = ?auto_186421 ?auto_186429 ) ) ( OBJ-AT ?auto_186424 ?auto_186429 ) ( OBJ-AT ?auto_186425 ?auto_186429 ) ( TRUCK-AT ?auto_186427 ?auto_186421 ) ( not ( = ?auto_186425 ?auto_186424 ) ) ( not ( = ?auto_186425 ?auto_186423 ) ) ( not ( = ?auto_186424 ?auto_186423 ) ) ( not ( = ?auto_186428 ?auto_186429 ) ) ( not ( = ?auto_186425 ?auto_186426 ) ) ( not ( = ?auto_186424 ?auto_186426 ) ) ( not ( = ?auto_186423 ?auto_186426 ) ) ( not ( = ?auto_186432 ?auto_186428 ) ) ( not ( = ?auto_186432 ?auto_186429 ) ) ( not ( = ?auto_186425 ?auto_186422 ) ) ( not ( = ?auto_186424 ?auto_186422 ) ) ( not ( = ?auto_186423 ?auto_186422 ) ) ( not ( = ?auto_186426 ?auto_186422 ) ) ( not ( = ?auto_186430 ?auto_186432 ) ) ( not ( = ?auto_186430 ?auto_186428 ) ) ( not ( = ?auto_186430 ?auto_186429 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_186425 ?auto_186424 ?auto_186423 ?auto_186422 ?auto_186426 ?auto_186421 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_186583 - OBJ
      ?auto_186584 - OBJ
      ?auto_186585 - OBJ
      ?auto_186586 - OBJ
      ?auto_186587 - OBJ
      ?auto_186582 - LOCATION
    )
    :vars
    (
      ?auto_186591 - LOCATION
      ?auto_186592 - CITY
      ?auto_186593 - LOCATION
      ?auto_186589 - LOCATION
      ?auto_186590 - LOCATION
      ?auto_186588 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_186591 ?auto_186592 ) ( IN-CITY ?auto_186582 ?auto_186592 ) ( not ( = ?auto_186582 ?auto_186591 ) ) ( OBJ-AT ?auto_186583 ?auto_186591 ) ( IN-CITY ?auto_186593 ?auto_186592 ) ( not ( = ?auto_186582 ?auto_186593 ) ) ( OBJ-AT ?auto_186586 ?auto_186593 ) ( IN-CITY ?auto_186589 ?auto_186592 ) ( not ( = ?auto_186582 ?auto_186589 ) ) ( OBJ-AT ?auto_186584 ?auto_186589 ) ( IN-CITY ?auto_186590 ?auto_186592 ) ( not ( = ?auto_186582 ?auto_186590 ) ) ( OBJ-AT ?auto_186585 ?auto_186590 ) ( OBJ-AT ?auto_186587 ?auto_186590 ) ( TRUCK-AT ?auto_186588 ?auto_186582 ) ( not ( = ?auto_186587 ?auto_186585 ) ) ( not ( = ?auto_186587 ?auto_186584 ) ) ( not ( = ?auto_186585 ?auto_186584 ) ) ( not ( = ?auto_186589 ?auto_186590 ) ) ( not ( = ?auto_186587 ?auto_186586 ) ) ( not ( = ?auto_186585 ?auto_186586 ) ) ( not ( = ?auto_186584 ?auto_186586 ) ) ( not ( = ?auto_186593 ?auto_186589 ) ) ( not ( = ?auto_186593 ?auto_186590 ) ) ( not ( = ?auto_186587 ?auto_186583 ) ) ( not ( = ?auto_186585 ?auto_186583 ) ) ( not ( = ?auto_186584 ?auto_186583 ) ) ( not ( = ?auto_186586 ?auto_186583 ) ) ( not ( = ?auto_186591 ?auto_186593 ) ) ( not ( = ?auto_186591 ?auto_186589 ) ) ( not ( = ?auto_186591 ?auto_186590 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_186587 ?auto_186585 ?auto_186584 ?auto_186583 ?auto_186586 ?auto_186582 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_187076 - OBJ
      ?auto_187077 - OBJ
      ?auto_187078 - OBJ
      ?auto_187079 - OBJ
      ?auto_187080 - OBJ
      ?auto_187075 - LOCATION
    )
    :vars
    (
      ?auto_187084 - LOCATION
      ?auto_187085 - CITY
      ?auto_187086 - LOCATION
      ?auto_187082 - LOCATION
      ?auto_187083 - LOCATION
      ?auto_187081 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187084 ?auto_187085 ) ( IN-CITY ?auto_187075 ?auto_187085 ) ( not ( = ?auto_187075 ?auto_187084 ) ) ( OBJ-AT ?auto_187076 ?auto_187084 ) ( IN-CITY ?auto_187086 ?auto_187085 ) ( not ( = ?auto_187075 ?auto_187086 ) ) ( OBJ-AT ?auto_187078 ?auto_187086 ) ( IN-CITY ?auto_187082 ?auto_187085 ) ( not ( = ?auto_187075 ?auto_187082 ) ) ( OBJ-AT ?auto_187077 ?auto_187082 ) ( IN-CITY ?auto_187083 ?auto_187085 ) ( not ( = ?auto_187075 ?auto_187083 ) ) ( OBJ-AT ?auto_187080 ?auto_187083 ) ( OBJ-AT ?auto_187079 ?auto_187083 ) ( TRUCK-AT ?auto_187081 ?auto_187075 ) ( not ( = ?auto_187079 ?auto_187080 ) ) ( not ( = ?auto_187079 ?auto_187077 ) ) ( not ( = ?auto_187080 ?auto_187077 ) ) ( not ( = ?auto_187082 ?auto_187083 ) ) ( not ( = ?auto_187079 ?auto_187078 ) ) ( not ( = ?auto_187080 ?auto_187078 ) ) ( not ( = ?auto_187077 ?auto_187078 ) ) ( not ( = ?auto_187086 ?auto_187082 ) ) ( not ( = ?auto_187086 ?auto_187083 ) ) ( not ( = ?auto_187079 ?auto_187076 ) ) ( not ( = ?auto_187080 ?auto_187076 ) ) ( not ( = ?auto_187077 ?auto_187076 ) ) ( not ( = ?auto_187078 ?auto_187076 ) ) ( not ( = ?auto_187084 ?auto_187086 ) ) ( not ( = ?auto_187084 ?auto_187082 ) ) ( not ( = ?auto_187084 ?auto_187083 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_187079 ?auto_187080 ?auto_187077 ?auto_187076 ?auto_187078 ?auto_187075 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_187127 - OBJ
      ?auto_187128 - OBJ
      ?auto_187129 - OBJ
      ?auto_187130 - OBJ
      ?auto_187131 - OBJ
      ?auto_187126 - LOCATION
    )
    :vars
    (
      ?auto_187135 - LOCATION
      ?auto_187136 - CITY
      ?auto_187137 - LOCATION
      ?auto_187133 - LOCATION
      ?auto_187134 - LOCATION
      ?auto_187132 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187135 ?auto_187136 ) ( IN-CITY ?auto_187126 ?auto_187136 ) ( not ( = ?auto_187126 ?auto_187135 ) ) ( OBJ-AT ?auto_187127 ?auto_187135 ) ( IN-CITY ?auto_187137 ?auto_187136 ) ( not ( = ?auto_187126 ?auto_187137 ) ) ( OBJ-AT ?auto_187129 ?auto_187137 ) ( IN-CITY ?auto_187133 ?auto_187136 ) ( not ( = ?auto_187126 ?auto_187133 ) ) ( OBJ-AT ?auto_187128 ?auto_187133 ) ( IN-CITY ?auto_187134 ?auto_187136 ) ( not ( = ?auto_187126 ?auto_187134 ) ) ( OBJ-AT ?auto_187130 ?auto_187134 ) ( OBJ-AT ?auto_187131 ?auto_187134 ) ( TRUCK-AT ?auto_187132 ?auto_187126 ) ( not ( = ?auto_187131 ?auto_187130 ) ) ( not ( = ?auto_187131 ?auto_187128 ) ) ( not ( = ?auto_187130 ?auto_187128 ) ) ( not ( = ?auto_187133 ?auto_187134 ) ) ( not ( = ?auto_187131 ?auto_187129 ) ) ( not ( = ?auto_187130 ?auto_187129 ) ) ( not ( = ?auto_187128 ?auto_187129 ) ) ( not ( = ?auto_187137 ?auto_187133 ) ) ( not ( = ?auto_187137 ?auto_187134 ) ) ( not ( = ?auto_187131 ?auto_187127 ) ) ( not ( = ?auto_187130 ?auto_187127 ) ) ( not ( = ?auto_187128 ?auto_187127 ) ) ( not ( = ?auto_187129 ?auto_187127 ) ) ( not ( = ?auto_187135 ?auto_187137 ) ) ( not ( = ?auto_187135 ?auto_187133 ) ) ( not ( = ?auto_187135 ?auto_187134 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_187131 ?auto_187130 ?auto_187128 ?auto_187127 ?auto_187129 ?auto_187126 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_187837 - OBJ
      ?auto_187838 - OBJ
      ?auto_187839 - OBJ
      ?auto_187840 - OBJ
      ?auto_187841 - OBJ
      ?auto_187836 - LOCATION
    )
    :vars
    (
      ?auto_187845 - LOCATION
      ?auto_187846 - CITY
      ?auto_187847 - LOCATION
      ?auto_187843 - LOCATION
      ?auto_187844 - LOCATION
      ?auto_187842 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187845 ?auto_187846 ) ( IN-CITY ?auto_187836 ?auto_187846 ) ( not ( = ?auto_187836 ?auto_187845 ) ) ( OBJ-AT ?auto_187837 ?auto_187845 ) ( IN-CITY ?auto_187847 ?auto_187846 ) ( not ( = ?auto_187836 ?auto_187847 ) ) ( OBJ-AT ?auto_187838 ?auto_187847 ) ( IN-CITY ?auto_187843 ?auto_187846 ) ( not ( = ?auto_187836 ?auto_187843 ) ) ( OBJ-AT ?auto_187841 ?auto_187843 ) ( IN-CITY ?auto_187844 ?auto_187846 ) ( not ( = ?auto_187836 ?auto_187844 ) ) ( OBJ-AT ?auto_187840 ?auto_187844 ) ( OBJ-AT ?auto_187839 ?auto_187844 ) ( TRUCK-AT ?auto_187842 ?auto_187836 ) ( not ( = ?auto_187839 ?auto_187840 ) ) ( not ( = ?auto_187839 ?auto_187841 ) ) ( not ( = ?auto_187840 ?auto_187841 ) ) ( not ( = ?auto_187843 ?auto_187844 ) ) ( not ( = ?auto_187839 ?auto_187838 ) ) ( not ( = ?auto_187840 ?auto_187838 ) ) ( not ( = ?auto_187841 ?auto_187838 ) ) ( not ( = ?auto_187847 ?auto_187843 ) ) ( not ( = ?auto_187847 ?auto_187844 ) ) ( not ( = ?auto_187839 ?auto_187837 ) ) ( not ( = ?auto_187840 ?auto_187837 ) ) ( not ( = ?auto_187841 ?auto_187837 ) ) ( not ( = ?auto_187838 ?auto_187837 ) ) ( not ( = ?auto_187845 ?auto_187847 ) ) ( not ( = ?auto_187845 ?auto_187843 ) ) ( not ( = ?auto_187845 ?auto_187844 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_187839 ?auto_187840 ?auto_187841 ?auto_187837 ?auto_187838 ?auto_187836 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_187888 - OBJ
      ?auto_187889 - OBJ
      ?auto_187890 - OBJ
      ?auto_187891 - OBJ
      ?auto_187892 - OBJ
      ?auto_187887 - LOCATION
    )
    :vars
    (
      ?auto_187896 - LOCATION
      ?auto_187897 - CITY
      ?auto_187898 - LOCATION
      ?auto_187894 - LOCATION
      ?auto_187895 - LOCATION
      ?auto_187893 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187896 ?auto_187897 ) ( IN-CITY ?auto_187887 ?auto_187897 ) ( not ( = ?auto_187887 ?auto_187896 ) ) ( OBJ-AT ?auto_187888 ?auto_187896 ) ( IN-CITY ?auto_187898 ?auto_187897 ) ( not ( = ?auto_187887 ?auto_187898 ) ) ( OBJ-AT ?auto_187889 ?auto_187898 ) ( IN-CITY ?auto_187894 ?auto_187897 ) ( not ( = ?auto_187887 ?auto_187894 ) ) ( OBJ-AT ?auto_187891 ?auto_187894 ) ( IN-CITY ?auto_187895 ?auto_187897 ) ( not ( = ?auto_187887 ?auto_187895 ) ) ( OBJ-AT ?auto_187892 ?auto_187895 ) ( OBJ-AT ?auto_187890 ?auto_187895 ) ( TRUCK-AT ?auto_187893 ?auto_187887 ) ( not ( = ?auto_187890 ?auto_187892 ) ) ( not ( = ?auto_187890 ?auto_187891 ) ) ( not ( = ?auto_187892 ?auto_187891 ) ) ( not ( = ?auto_187894 ?auto_187895 ) ) ( not ( = ?auto_187890 ?auto_187889 ) ) ( not ( = ?auto_187892 ?auto_187889 ) ) ( not ( = ?auto_187891 ?auto_187889 ) ) ( not ( = ?auto_187898 ?auto_187894 ) ) ( not ( = ?auto_187898 ?auto_187895 ) ) ( not ( = ?auto_187890 ?auto_187888 ) ) ( not ( = ?auto_187892 ?auto_187888 ) ) ( not ( = ?auto_187891 ?auto_187888 ) ) ( not ( = ?auto_187889 ?auto_187888 ) ) ( not ( = ?auto_187896 ?auto_187898 ) ) ( not ( = ?auto_187896 ?auto_187894 ) ) ( not ( = ?auto_187896 ?auto_187895 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_187890 ?auto_187892 ?auto_187891 ?auto_187888 ?auto_187889 ?auto_187887 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_188101 - OBJ
      ?auto_188102 - OBJ
      ?auto_188103 - OBJ
      ?auto_188104 - OBJ
      ?auto_188105 - OBJ
      ?auto_188100 - LOCATION
    )
    :vars
    (
      ?auto_188109 - LOCATION
      ?auto_188110 - CITY
      ?auto_188111 - LOCATION
      ?auto_188107 - LOCATION
      ?auto_188108 - LOCATION
      ?auto_188106 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_188109 ?auto_188110 ) ( IN-CITY ?auto_188100 ?auto_188110 ) ( not ( = ?auto_188100 ?auto_188109 ) ) ( OBJ-AT ?auto_188101 ?auto_188109 ) ( IN-CITY ?auto_188111 ?auto_188110 ) ( not ( = ?auto_188100 ?auto_188111 ) ) ( OBJ-AT ?auto_188102 ?auto_188111 ) ( IN-CITY ?auto_188107 ?auto_188110 ) ( not ( = ?auto_188100 ?auto_188107 ) ) ( OBJ-AT ?auto_188105 ?auto_188107 ) ( IN-CITY ?auto_188108 ?auto_188110 ) ( not ( = ?auto_188100 ?auto_188108 ) ) ( OBJ-AT ?auto_188103 ?auto_188108 ) ( OBJ-AT ?auto_188104 ?auto_188108 ) ( TRUCK-AT ?auto_188106 ?auto_188100 ) ( not ( = ?auto_188104 ?auto_188103 ) ) ( not ( = ?auto_188104 ?auto_188105 ) ) ( not ( = ?auto_188103 ?auto_188105 ) ) ( not ( = ?auto_188107 ?auto_188108 ) ) ( not ( = ?auto_188104 ?auto_188102 ) ) ( not ( = ?auto_188103 ?auto_188102 ) ) ( not ( = ?auto_188105 ?auto_188102 ) ) ( not ( = ?auto_188111 ?auto_188107 ) ) ( not ( = ?auto_188111 ?auto_188108 ) ) ( not ( = ?auto_188104 ?auto_188101 ) ) ( not ( = ?auto_188103 ?auto_188101 ) ) ( not ( = ?auto_188105 ?auto_188101 ) ) ( not ( = ?auto_188102 ?auto_188101 ) ) ( not ( = ?auto_188109 ?auto_188111 ) ) ( not ( = ?auto_188109 ?auto_188107 ) ) ( not ( = ?auto_188109 ?auto_188108 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_188104 ?auto_188103 ?auto_188105 ?auto_188101 ?auto_188102 ?auto_188100 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_188207 - OBJ
      ?auto_188208 - OBJ
      ?auto_188209 - OBJ
      ?auto_188210 - OBJ
      ?auto_188211 - OBJ
      ?auto_188206 - LOCATION
    )
    :vars
    (
      ?auto_188215 - LOCATION
      ?auto_188216 - CITY
      ?auto_188217 - LOCATION
      ?auto_188213 - LOCATION
      ?auto_188214 - LOCATION
      ?auto_188212 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_188215 ?auto_188216 ) ( IN-CITY ?auto_188206 ?auto_188216 ) ( not ( = ?auto_188206 ?auto_188215 ) ) ( OBJ-AT ?auto_188207 ?auto_188215 ) ( IN-CITY ?auto_188217 ?auto_188216 ) ( not ( = ?auto_188206 ?auto_188217 ) ) ( OBJ-AT ?auto_188208 ?auto_188217 ) ( IN-CITY ?auto_188213 ?auto_188216 ) ( not ( = ?auto_188206 ?auto_188213 ) ) ( OBJ-AT ?auto_188210 ?auto_188213 ) ( IN-CITY ?auto_188214 ?auto_188216 ) ( not ( = ?auto_188206 ?auto_188214 ) ) ( OBJ-AT ?auto_188209 ?auto_188214 ) ( OBJ-AT ?auto_188211 ?auto_188214 ) ( TRUCK-AT ?auto_188212 ?auto_188206 ) ( not ( = ?auto_188211 ?auto_188209 ) ) ( not ( = ?auto_188211 ?auto_188210 ) ) ( not ( = ?auto_188209 ?auto_188210 ) ) ( not ( = ?auto_188213 ?auto_188214 ) ) ( not ( = ?auto_188211 ?auto_188208 ) ) ( not ( = ?auto_188209 ?auto_188208 ) ) ( not ( = ?auto_188210 ?auto_188208 ) ) ( not ( = ?auto_188217 ?auto_188213 ) ) ( not ( = ?auto_188217 ?auto_188214 ) ) ( not ( = ?auto_188211 ?auto_188207 ) ) ( not ( = ?auto_188209 ?auto_188207 ) ) ( not ( = ?auto_188210 ?auto_188207 ) ) ( not ( = ?auto_188208 ?auto_188207 ) ) ( not ( = ?auto_188215 ?auto_188217 ) ) ( not ( = ?auto_188215 ?auto_188213 ) ) ( not ( = ?auto_188215 ?auto_188214 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_188211 ?auto_188209 ?auto_188210 ?auto_188207 ?auto_188208 ?auto_188206 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_188420 - OBJ
      ?auto_188421 - OBJ
      ?auto_188422 - OBJ
      ?auto_188423 - OBJ
      ?auto_188424 - OBJ
      ?auto_188419 - LOCATION
    )
    :vars
    (
      ?auto_188428 - LOCATION
      ?auto_188429 - CITY
      ?auto_188430 - LOCATION
      ?auto_188426 - LOCATION
      ?auto_188427 - LOCATION
      ?auto_188425 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_188428 ?auto_188429 ) ( IN-CITY ?auto_188419 ?auto_188429 ) ( not ( = ?auto_188419 ?auto_188428 ) ) ( OBJ-AT ?auto_188420 ?auto_188428 ) ( IN-CITY ?auto_188430 ?auto_188429 ) ( not ( = ?auto_188419 ?auto_188430 ) ) ( OBJ-AT ?auto_188421 ?auto_188430 ) ( IN-CITY ?auto_188426 ?auto_188429 ) ( not ( = ?auto_188419 ?auto_188426 ) ) ( OBJ-AT ?auto_188422 ?auto_188426 ) ( IN-CITY ?auto_188427 ?auto_188429 ) ( not ( = ?auto_188419 ?auto_188427 ) ) ( OBJ-AT ?auto_188424 ?auto_188427 ) ( OBJ-AT ?auto_188423 ?auto_188427 ) ( TRUCK-AT ?auto_188425 ?auto_188419 ) ( not ( = ?auto_188423 ?auto_188424 ) ) ( not ( = ?auto_188423 ?auto_188422 ) ) ( not ( = ?auto_188424 ?auto_188422 ) ) ( not ( = ?auto_188426 ?auto_188427 ) ) ( not ( = ?auto_188423 ?auto_188421 ) ) ( not ( = ?auto_188424 ?auto_188421 ) ) ( not ( = ?auto_188422 ?auto_188421 ) ) ( not ( = ?auto_188430 ?auto_188426 ) ) ( not ( = ?auto_188430 ?auto_188427 ) ) ( not ( = ?auto_188423 ?auto_188420 ) ) ( not ( = ?auto_188424 ?auto_188420 ) ) ( not ( = ?auto_188422 ?auto_188420 ) ) ( not ( = ?auto_188421 ?auto_188420 ) ) ( not ( = ?auto_188428 ?auto_188430 ) ) ( not ( = ?auto_188428 ?auto_188426 ) ) ( not ( = ?auto_188428 ?auto_188427 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_188423 ?auto_188424 ?auto_188422 ?auto_188420 ?auto_188421 ?auto_188419 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_188471 - OBJ
      ?auto_188472 - OBJ
      ?auto_188473 - OBJ
      ?auto_188474 - OBJ
      ?auto_188475 - OBJ
      ?auto_188470 - LOCATION
    )
    :vars
    (
      ?auto_188479 - LOCATION
      ?auto_188480 - CITY
      ?auto_188481 - LOCATION
      ?auto_188477 - LOCATION
      ?auto_188478 - LOCATION
      ?auto_188476 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_188479 ?auto_188480 ) ( IN-CITY ?auto_188470 ?auto_188480 ) ( not ( = ?auto_188470 ?auto_188479 ) ) ( OBJ-AT ?auto_188471 ?auto_188479 ) ( IN-CITY ?auto_188481 ?auto_188480 ) ( not ( = ?auto_188470 ?auto_188481 ) ) ( OBJ-AT ?auto_188472 ?auto_188481 ) ( IN-CITY ?auto_188477 ?auto_188480 ) ( not ( = ?auto_188470 ?auto_188477 ) ) ( OBJ-AT ?auto_188473 ?auto_188477 ) ( IN-CITY ?auto_188478 ?auto_188480 ) ( not ( = ?auto_188470 ?auto_188478 ) ) ( OBJ-AT ?auto_188474 ?auto_188478 ) ( OBJ-AT ?auto_188475 ?auto_188478 ) ( TRUCK-AT ?auto_188476 ?auto_188470 ) ( not ( = ?auto_188475 ?auto_188474 ) ) ( not ( = ?auto_188475 ?auto_188473 ) ) ( not ( = ?auto_188474 ?auto_188473 ) ) ( not ( = ?auto_188477 ?auto_188478 ) ) ( not ( = ?auto_188475 ?auto_188472 ) ) ( not ( = ?auto_188474 ?auto_188472 ) ) ( not ( = ?auto_188473 ?auto_188472 ) ) ( not ( = ?auto_188481 ?auto_188477 ) ) ( not ( = ?auto_188481 ?auto_188478 ) ) ( not ( = ?auto_188475 ?auto_188471 ) ) ( not ( = ?auto_188474 ?auto_188471 ) ) ( not ( = ?auto_188473 ?auto_188471 ) ) ( not ( = ?auto_188472 ?auto_188471 ) ) ( not ( = ?auto_188479 ?auto_188481 ) ) ( not ( = ?auto_188479 ?auto_188477 ) ) ( not ( = ?auto_188479 ?auto_188478 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_188475 ?auto_188474 ?auto_188473 ?auto_188471 ?auto_188472 ?auto_188470 ) )
  )

)

