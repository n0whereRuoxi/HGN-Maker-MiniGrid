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

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95062 - OBJ
      ?auto_95061 - LOCATION
    )
    :vars
    (
      ?auto_95063 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95063 ?auto_95061 ) ( IN-TRUCK ?auto_95062 ?auto_95063 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_95062 ?auto_95063 ?auto_95061 )
      ( DELIVER-1PKG-VERIFY ?auto_95062 ?auto_95061 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95080 - OBJ
      ?auto_95079 - LOCATION
    )
    :vars
    (
      ?auto_95081 - TRUCK
      ?auto_95082 - LOCATION
      ?auto_95083 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95080 ?auto_95081 ) ( TRUCK-AT ?auto_95081 ?auto_95082 ) ( IN-CITY ?auto_95082 ?auto_95083 ) ( IN-CITY ?auto_95079 ?auto_95083 ) ( not ( = ?auto_95079 ?auto_95082 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_95081 ?auto_95082 ?auto_95079 ?auto_95083 )
      ( DELIVER-1PKG ?auto_95080 ?auto_95079 )
      ( DELIVER-1PKG-VERIFY ?auto_95080 ?auto_95079 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95106 - OBJ
      ?auto_95105 - LOCATION
    )
    :vars
    (
      ?auto_95108 - TRUCK
      ?auto_95109 - LOCATION
      ?auto_95107 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95108 ?auto_95109 ) ( IN-CITY ?auto_95109 ?auto_95107 ) ( IN-CITY ?auto_95105 ?auto_95107 ) ( not ( = ?auto_95105 ?auto_95109 ) ) ( OBJ-AT ?auto_95106 ?auto_95109 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_95106 ?auto_95108 ?auto_95109 )
      ( DELIVER-1PKG ?auto_95106 ?auto_95105 )
      ( DELIVER-1PKG-VERIFY ?auto_95106 ?auto_95105 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95132 - OBJ
      ?auto_95131 - LOCATION
    )
    :vars
    (
      ?auto_95135 - LOCATION
      ?auto_95133 - CITY
      ?auto_95134 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95135 ?auto_95133 ) ( IN-CITY ?auto_95131 ?auto_95133 ) ( not ( = ?auto_95131 ?auto_95135 ) ) ( OBJ-AT ?auto_95132 ?auto_95135 ) ( TRUCK-AT ?auto_95134 ?auto_95131 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_95134 ?auto_95131 ?auto_95135 ?auto_95133 )
      ( DELIVER-1PKG ?auto_95132 ?auto_95131 )
      ( DELIVER-1PKG-VERIFY ?auto_95132 ?auto_95131 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95275 - OBJ
      ?auto_95276 - OBJ
      ?auto_95274 - LOCATION
    )
    :vars
    (
      ?auto_95277 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95277 ?auto_95274 ) ( IN-TRUCK ?auto_95276 ?auto_95277 ) ( OBJ-AT ?auto_95275 ?auto_95274 ) ( not ( = ?auto_95275 ?auto_95276 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95276 ?auto_95274 )
      ( DELIVER-2PKG-VERIFY ?auto_95275 ?auto_95276 ?auto_95274 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95279 - OBJ
      ?auto_95280 - OBJ
      ?auto_95278 - LOCATION
    )
    :vars
    (
      ?auto_95281 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95281 ?auto_95278 ) ( IN-TRUCK ?auto_95279 ?auto_95281 ) ( OBJ-AT ?auto_95280 ?auto_95278 ) ( not ( = ?auto_95279 ?auto_95280 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95279 ?auto_95278 )
      ( DELIVER-2PKG-VERIFY ?auto_95279 ?auto_95280 ?auto_95278 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95287 - OBJ
      ?auto_95288 - OBJ
      ?auto_95289 - OBJ
      ?auto_95286 - LOCATION
    )
    :vars
    (
      ?auto_95290 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95290 ?auto_95286 ) ( IN-TRUCK ?auto_95289 ?auto_95290 ) ( OBJ-AT ?auto_95287 ?auto_95286 ) ( OBJ-AT ?auto_95288 ?auto_95286 ) ( not ( = ?auto_95287 ?auto_95288 ) ) ( not ( = ?auto_95287 ?auto_95289 ) ) ( not ( = ?auto_95288 ?auto_95289 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95289 ?auto_95286 )
      ( DELIVER-3PKG-VERIFY ?auto_95287 ?auto_95288 ?auto_95289 ?auto_95286 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95292 - OBJ
      ?auto_95293 - OBJ
      ?auto_95294 - OBJ
      ?auto_95291 - LOCATION
    )
    :vars
    (
      ?auto_95295 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95295 ?auto_95291 ) ( IN-TRUCK ?auto_95293 ?auto_95295 ) ( OBJ-AT ?auto_95292 ?auto_95291 ) ( OBJ-AT ?auto_95294 ?auto_95291 ) ( not ( = ?auto_95292 ?auto_95293 ) ) ( not ( = ?auto_95292 ?auto_95294 ) ) ( not ( = ?auto_95293 ?auto_95294 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95293 ?auto_95291 )
      ( DELIVER-3PKG-VERIFY ?auto_95292 ?auto_95293 ?auto_95294 ?auto_95291 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95302 - OBJ
      ?auto_95303 - OBJ
      ?auto_95304 - OBJ
      ?auto_95301 - LOCATION
    )
    :vars
    (
      ?auto_95305 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95305 ?auto_95301 ) ( IN-TRUCK ?auto_95302 ?auto_95305 ) ( OBJ-AT ?auto_95303 ?auto_95301 ) ( OBJ-AT ?auto_95304 ?auto_95301 ) ( not ( = ?auto_95302 ?auto_95303 ) ) ( not ( = ?auto_95302 ?auto_95304 ) ) ( not ( = ?auto_95303 ?auto_95304 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95302 ?auto_95301 )
      ( DELIVER-3PKG-VERIFY ?auto_95302 ?auto_95303 ?auto_95304 ?auto_95301 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95322 - OBJ
      ?auto_95323 - OBJ
      ?auto_95324 - OBJ
      ?auto_95325 - OBJ
      ?auto_95321 - LOCATION
    )
    :vars
    (
      ?auto_95326 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95326 ?auto_95321 ) ( IN-TRUCK ?auto_95325 ?auto_95326 ) ( OBJ-AT ?auto_95322 ?auto_95321 ) ( OBJ-AT ?auto_95323 ?auto_95321 ) ( OBJ-AT ?auto_95324 ?auto_95321 ) ( not ( = ?auto_95322 ?auto_95323 ) ) ( not ( = ?auto_95322 ?auto_95324 ) ) ( not ( = ?auto_95322 ?auto_95325 ) ) ( not ( = ?auto_95323 ?auto_95324 ) ) ( not ( = ?auto_95323 ?auto_95325 ) ) ( not ( = ?auto_95324 ?auto_95325 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95325 ?auto_95321 )
      ( DELIVER-4PKG-VERIFY ?auto_95322 ?auto_95323 ?auto_95324 ?auto_95325 ?auto_95321 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95328 - OBJ
      ?auto_95329 - OBJ
      ?auto_95330 - OBJ
      ?auto_95331 - OBJ
      ?auto_95327 - LOCATION
    )
    :vars
    (
      ?auto_95332 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95332 ?auto_95327 ) ( IN-TRUCK ?auto_95330 ?auto_95332 ) ( OBJ-AT ?auto_95328 ?auto_95327 ) ( OBJ-AT ?auto_95329 ?auto_95327 ) ( OBJ-AT ?auto_95331 ?auto_95327 ) ( not ( = ?auto_95328 ?auto_95329 ) ) ( not ( = ?auto_95328 ?auto_95330 ) ) ( not ( = ?auto_95328 ?auto_95331 ) ) ( not ( = ?auto_95329 ?auto_95330 ) ) ( not ( = ?auto_95329 ?auto_95331 ) ) ( not ( = ?auto_95330 ?auto_95331 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95330 ?auto_95327 )
      ( DELIVER-4PKG-VERIFY ?auto_95328 ?auto_95329 ?auto_95330 ?auto_95331 ?auto_95327 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95340 - OBJ
      ?auto_95341 - OBJ
      ?auto_95342 - OBJ
      ?auto_95343 - OBJ
      ?auto_95339 - LOCATION
    )
    :vars
    (
      ?auto_95344 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95344 ?auto_95339 ) ( IN-TRUCK ?auto_95341 ?auto_95344 ) ( OBJ-AT ?auto_95340 ?auto_95339 ) ( OBJ-AT ?auto_95342 ?auto_95339 ) ( OBJ-AT ?auto_95343 ?auto_95339 ) ( not ( = ?auto_95340 ?auto_95341 ) ) ( not ( = ?auto_95340 ?auto_95342 ) ) ( not ( = ?auto_95340 ?auto_95343 ) ) ( not ( = ?auto_95341 ?auto_95342 ) ) ( not ( = ?auto_95341 ?auto_95343 ) ) ( not ( = ?auto_95342 ?auto_95343 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95341 ?auto_95339 )
      ( DELIVER-4PKG-VERIFY ?auto_95340 ?auto_95341 ?auto_95342 ?auto_95343 ?auto_95339 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95364 - OBJ
      ?auto_95365 - OBJ
      ?auto_95366 - OBJ
      ?auto_95367 - OBJ
      ?auto_95363 - LOCATION
    )
    :vars
    (
      ?auto_95368 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95368 ?auto_95363 ) ( IN-TRUCK ?auto_95364 ?auto_95368 ) ( OBJ-AT ?auto_95365 ?auto_95363 ) ( OBJ-AT ?auto_95366 ?auto_95363 ) ( OBJ-AT ?auto_95367 ?auto_95363 ) ( not ( = ?auto_95364 ?auto_95365 ) ) ( not ( = ?auto_95364 ?auto_95366 ) ) ( not ( = ?auto_95364 ?auto_95367 ) ) ( not ( = ?auto_95365 ?auto_95366 ) ) ( not ( = ?auto_95365 ?auto_95367 ) ) ( not ( = ?auto_95366 ?auto_95367 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95364 ?auto_95363 )
      ( DELIVER-4PKG-VERIFY ?auto_95364 ?auto_95365 ?auto_95366 ?auto_95367 ?auto_95363 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95417 - OBJ
      ?auto_95418 - OBJ
      ?auto_95416 - LOCATION
    )
    :vars
    (
      ?auto_95421 - TRUCK
      ?auto_95419 - LOCATION
      ?auto_95420 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95418 ?auto_95421 ) ( TRUCK-AT ?auto_95421 ?auto_95419 ) ( IN-CITY ?auto_95419 ?auto_95420 ) ( IN-CITY ?auto_95416 ?auto_95420 ) ( not ( = ?auto_95416 ?auto_95419 ) ) ( OBJ-AT ?auto_95417 ?auto_95416 ) ( not ( = ?auto_95417 ?auto_95418 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95418 ?auto_95416 )
      ( DELIVER-2PKG-VERIFY ?auto_95417 ?auto_95418 ?auto_95416 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95423 - OBJ
      ?auto_95424 - OBJ
      ?auto_95422 - LOCATION
    )
    :vars
    (
      ?auto_95426 - TRUCK
      ?auto_95425 - LOCATION
      ?auto_95427 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95423 ?auto_95426 ) ( TRUCK-AT ?auto_95426 ?auto_95425 ) ( IN-CITY ?auto_95425 ?auto_95427 ) ( IN-CITY ?auto_95422 ?auto_95427 ) ( not ( = ?auto_95422 ?auto_95425 ) ) ( OBJ-AT ?auto_95424 ?auto_95422 ) ( not ( = ?auto_95424 ?auto_95423 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95424 ?auto_95423 ?auto_95422 )
      ( DELIVER-2PKG-VERIFY ?auto_95423 ?auto_95424 ?auto_95422 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95436 - OBJ
      ?auto_95437 - OBJ
      ?auto_95438 - OBJ
      ?auto_95435 - LOCATION
    )
    :vars
    (
      ?auto_95440 - TRUCK
      ?auto_95439 - LOCATION
      ?auto_95441 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95438 ?auto_95440 ) ( TRUCK-AT ?auto_95440 ?auto_95439 ) ( IN-CITY ?auto_95439 ?auto_95441 ) ( IN-CITY ?auto_95435 ?auto_95441 ) ( not ( = ?auto_95435 ?auto_95439 ) ) ( OBJ-AT ?auto_95437 ?auto_95435 ) ( not ( = ?auto_95437 ?auto_95438 ) ) ( OBJ-AT ?auto_95436 ?auto_95435 ) ( not ( = ?auto_95436 ?auto_95437 ) ) ( not ( = ?auto_95436 ?auto_95438 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95437 ?auto_95438 ?auto_95435 )
      ( DELIVER-3PKG-VERIFY ?auto_95436 ?auto_95437 ?auto_95438 ?auto_95435 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95443 - OBJ
      ?auto_95444 - OBJ
      ?auto_95445 - OBJ
      ?auto_95442 - LOCATION
    )
    :vars
    (
      ?auto_95447 - TRUCK
      ?auto_95446 - LOCATION
      ?auto_95448 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95444 ?auto_95447 ) ( TRUCK-AT ?auto_95447 ?auto_95446 ) ( IN-CITY ?auto_95446 ?auto_95448 ) ( IN-CITY ?auto_95442 ?auto_95448 ) ( not ( = ?auto_95442 ?auto_95446 ) ) ( OBJ-AT ?auto_95445 ?auto_95442 ) ( not ( = ?auto_95445 ?auto_95444 ) ) ( OBJ-AT ?auto_95443 ?auto_95442 ) ( not ( = ?auto_95443 ?auto_95444 ) ) ( not ( = ?auto_95443 ?auto_95445 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95445 ?auto_95444 ?auto_95442 )
      ( DELIVER-3PKG-VERIFY ?auto_95443 ?auto_95444 ?auto_95445 ?auto_95442 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95457 - OBJ
      ?auto_95458 - OBJ
      ?auto_95459 - OBJ
      ?auto_95456 - LOCATION
    )
    :vars
    (
      ?auto_95461 - TRUCK
      ?auto_95460 - LOCATION
      ?auto_95462 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95457 ?auto_95461 ) ( TRUCK-AT ?auto_95461 ?auto_95460 ) ( IN-CITY ?auto_95460 ?auto_95462 ) ( IN-CITY ?auto_95456 ?auto_95462 ) ( not ( = ?auto_95456 ?auto_95460 ) ) ( OBJ-AT ?auto_95458 ?auto_95456 ) ( not ( = ?auto_95458 ?auto_95457 ) ) ( OBJ-AT ?auto_95459 ?auto_95456 ) ( not ( = ?auto_95457 ?auto_95459 ) ) ( not ( = ?auto_95458 ?auto_95459 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95458 ?auto_95457 ?auto_95456 )
      ( DELIVER-3PKG-VERIFY ?auto_95457 ?auto_95458 ?auto_95459 ?auto_95456 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95486 - OBJ
      ?auto_95487 - OBJ
      ?auto_95488 - OBJ
      ?auto_95489 - OBJ
      ?auto_95485 - LOCATION
    )
    :vars
    (
      ?auto_95491 - TRUCK
      ?auto_95490 - LOCATION
      ?auto_95492 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95489 ?auto_95491 ) ( TRUCK-AT ?auto_95491 ?auto_95490 ) ( IN-CITY ?auto_95490 ?auto_95492 ) ( IN-CITY ?auto_95485 ?auto_95492 ) ( not ( = ?auto_95485 ?auto_95490 ) ) ( OBJ-AT ?auto_95488 ?auto_95485 ) ( not ( = ?auto_95488 ?auto_95489 ) ) ( OBJ-AT ?auto_95486 ?auto_95485 ) ( OBJ-AT ?auto_95487 ?auto_95485 ) ( not ( = ?auto_95486 ?auto_95487 ) ) ( not ( = ?auto_95486 ?auto_95488 ) ) ( not ( = ?auto_95486 ?auto_95489 ) ) ( not ( = ?auto_95487 ?auto_95488 ) ) ( not ( = ?auto_95487 ?auto_95489 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95488 ?auto_95489 ?auto_95485 )
      ( DELIVER-4PKG-VERIFY ?auto_95486 ?auto_95487 ?auto_95488 ?auto_95489 ?auto_95485 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95494 - OBJ
      ?auto_95495 - OBJ
      ?auto_95496 - OBJ
      ?auto_95497 - OBJ
      ?auto_95493 - LOCATION
    )
    :vars
    (
      ?auto_95499 - TRUCK
      ?auto_95498 - LOCATION
      ?auto_95500 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95496 ?auto_95499 ) ( TRUCK-AT ?auto_95499 ?auto_95498 ) ( IN-CITY ?auto_95498 ?auto_95500 ) ( IN-CITY ?auto_95493 ?auto_95500 ) ( not ( = ?auto_95493 ?auto_95498 ) ) ( OBJ-AT ?auto_95494 ?auto_95493 ) ( not ( = ?auto_95494 ?auto_95496 ) ) ( OBJ-AT ?auto_95495 ?auto_95493 ) ( OBJ-AT ?auto_95497 ?auto_95493 ) ( not ( = ?auto_95494 ?auto_95495 ) ) ( not ( = ?auto_95494 ?auto_95497 ) ) ( not ( = ?auto_95495 ?auto_95496 ) ) ( not ( = ?auto_95495 ?auto_95497 ) ) ( not ( = ?auto_95496 ?auto_95497 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95494 ?auto_95496 ?auto_95493 )
      ( DELIVER-4PKG-VERIFY ?auto_95494 ?auto_95495 ?auto_95496 ?auto_95497 ?auto_95493 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95510 - OBJ
      ?auto_95511 - OBJ
      ?auto_95512 - OBJ
      ?auto_95513 - OBJ
      ?auto_95509 - LOCATION
    )
    :vars
    (
      ?auto_95515 - TRUCK
      ?auto_95514 - LOCATION
      ?auto_95516 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95511 ?auto_95515 ) ( TRUCK-AT ?auto_95515 ?auto_95514 ) ( IN-CITY ?auto_95514 ?auto_95516 ) ( IN-CITY ?auto_95509 ?auto_95516 ) ( not ( = ?auto_95509 ?auto_95514 ) ) ( OBJ-AT ?auto_95510 ?auto_95509 ) ( not ( = ?auto_95510 ?auto_95511 ) ) ( OBJ-AT ?auto_95512 ?auto_95509 ) ( OBJ-AT ?auto_95513 ?auto_95509 ) ( not ( = ?auto_95510 ?auto_95512 ) ) ( not ( = ?auto_95510 ?auto_95513 ) ) ( not ( = ?auto_95511 ?auto_95512 ) ) ( not ( = ?auto_95511 ?auto_95513 ) ) ( not ( = ?auto_95512 ?auto_95513 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95510 ?auto_95511 ?auto_95509 )
      ( DELIVER-4PKG-VERIFY ?auto_95510 ?auto_95511 ?auto_95512 ?auto_95513 ?auto_95509 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95542 - OBJ
      ?auto_95543 - OBJ
      ?auto_95544 - OBJ
      ?auto_95545 - OBJ
      ?auto_95541 - LOCATION
    )
    :vars
    (
      ?auto_95547 - TRUCK
      ?auto_95546 - LOCATION
      ?auto_95548 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95542 ?auto_95547 ) ( TRUCK-AT ?auto_95547 ?auto_95546 ) ( IN-CITY ?auto_95546 ?auto_95548 ) ( IN-CITY ?auto_95541 ?auto_95548 ) ( not ( = ?auto_95541 ?auto_95546 ) ) ( OBJ-AT ?auto_95544 ?auto_95541 ) ( not ( = ?auto_95544 ?auto_95542 ) ) ( OBJ-AT ?auto_95543 ?auto_95541 ) ( OBJ-AT ?auto_95545 ?auto_95541 ) ( not ( = ?auto_95542 ?auto_95543 ) ) ( not ( = ?auto_95542 ?auto_95545 ) ) ( not ( = ?auto_95543 ?auto_95544 ) ) ( not ( = ?auto_95543 ?auto_95545 ) ) ( not ( = ?auto_95544 ?auto_95545 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95544 ?auto_95542 ?auto_95541 )
      ( DELIVER-4PKG-VERIFY ?auto_95542 ?auto_95543 ?auto_95544 ?auto_95545 ?auto_95541 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95607 - OBJ
      ?auto_95606 - LOCATION
    )
    :vars
    (
      ?auto_95609 - TRUCK
      ?auto_95608 - LOCATION
      ?auto_95610 - CITY
      ?auto_95611 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95609 ?auto_95608 ) ( IN-CITY ?auto_95608 ?auto_95610 ) ( IN-CITY ?auto_95606 ?auto_95610 ) ( not ( = ?auto_95606 ?auto_95608 ) ) ( OBJ-AT ?auto_95611 ?auto_95606 ) ( not ( = ?auto_95611 ?auto_95607 ) ) ( OBJ-AT ?auto_95607 ?auto_95608 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_95607 ?auto_95609 ?auto_95608 )
      ( DELIVER-2PKG ?auto_95611 ?auto_95607 ?auto_95606 )
      ( DELIVER-1PKG-VERIFY ?auto_95607 ?auto_95606 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95613 - OBJ
      ?auto_95614 - OBJ
      ?auto_95612 - LOCATION
    )
    :vars
    (
      ?auto_95616 - TRUCK
      ?auto_95617 - LOCATION
      ?auto_95615 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95616 ?auto_95617 ) ( IN-CITY ?auto_95617 ?auto_95615 ) ( IN-CITY ?auto_95612 ?auto_95615 ) ( not ( = ?auto_95612 ?auto_95617 ) ) ( OBJ-AT ?auto_95613 ?auto_95612 ) ( not ( = ?auto_95613 ?auto_95614 ) ) ( OBJ-AT ?auto_95614 ?auto_95617 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95614 ?auto_95612 )
      ( DELIVER-2PKG-VERIFY ?auto_95613 ?auto_95614 ?auto_95612 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95619 - OBJ
      ?auto_95620 - OBJ
      ?auto_95618 - LOCATION
    )
    :vars
    (
      ?auto_95622 - TRUCK
      ?auto_95621 - LOCATION
      ?auto_95623 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95622 ?auto_95621 ) ( IN-CITY ?auto_95621 ?auto_95623 ) ( IN-CITY ?auto_95618 ?auto_95623 ) ( not ( = ?auto_95618 ?auto_95621 ) ) ( OBJ-AT ?auto_95620 ?auto_95618 ) ( not ( = ?auto_95620 ?auto_95619 ) ) ( OBJ-AT ?auto_95619 ?auto_95621 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95620 ?auto_95619 ?auto_95618 )
      ( DELIVER-2PKG-VERIFY ?auto_95619 ?auto_95620 ?auto_95618 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95632 - OBJ
      ?auto_95633 - OBJ
      ?auto_95634 - OBJ
      ?auto_95631 - LOCATION
    )
    :vars
    (
      ?auto_95636 - TRUCK
      ?auto_95635 - LOCATION
      ?auto_95637 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95636 ?auto_95635 ) ( IN-CITY ?auto_95635 ?auto_95637 ) ( IN-CITY ?auto_95631 ?auto_95637 ) ( not ( = ?auto_95631 ?auto_95635 ) ) ( OBJ-AT ?auto_95633 ?auto_95631 ) ( not ( = ?auto_95633 ?auto_95634 ) ) ( OBJ-AT ?auto_95634 ?auto_95635 ) ( OBJ-AT ?auto_95632 ?auto_95631 ) ( not ( = ?auto_95632 ?auto_95633 ) ) ( not ( = ?auto_95632 ?auto_95634 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95633 ?auto_95634 ?auto_95631 )
      ( DELIVER-3PKG-VERIFY ?auto_95632 ?auto_95633 ?auto_95634 ?auto_95631 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95639 - OBJ
      ?auto_95640 - OBJ
      ?auto_95641 - OBJ
      ?auto_95638 - LOCATION
    )
    :vars
    (
      ?auto_95643 - TRUCK
      ?auto_95642 - LOCATION
      ?auto_95644 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95643 ?auto_95642 ) ( IN-CITY ?auto_95642 ?auto_95644 ) ( IN-CITY ?auto_95638 ?auto_95644 ) ( not ( = ?auto_95638 ?auto_95642 ) ) ( OBJ-AT ?auto_95639 ?auto_95638 ) ( not ( = ?auto_95639 ?auto_95640 ) ) ( OBJ-AT ?auto_95640 ?auto_95642 ) ( OBJ-AT ?auto_95641 ?auto_95638 ) ( not ( = ?auto_95639 ?auto_95641 ) ) ( not ( = ?auto_95640 ?auto_95641 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95639 ?auto_95640 ?auto_95638 )
      ( DELIVER-3PKG-VERIFY ?auto_95639 ?auto_95640 ?auto_95641 ?auto_95638 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95653 - OBJ
      ?auto_95654 - OBJ
      ?auto_95655 - OBJ
      ?auto_95652 - LOCATION
    )
    :vars
    (
      ?auto_95657 - TRUCK
      ?auto_95656 - LOCATION
      ?auto_95658 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95657 ?auto_95656 ) ( IN-CITY ?auto_95656 ?auto_95658 ) ( IN-CITY ?auto_95652 ?auto_95658 ) ( not ( = ?auto_95652 ?auto_95656 ) ) ( OBJ-AT ?auto_95654 ?auto_95652 ) ( not ( = ?auto_95654 ?auto_95653 ) ) ( OBJ-AT ?auto_95653 ?auto_95656 ) ( OBJ-AT ?auto_95655 ?auto_95652 ) ( not ( = ?auto_95653 ?auto_95655 ) ) ( not ( = ?auto_95654 ?auto_95655 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95654 ?auto_95653 ?auto_95652 )
      ( DELIVER-3PKG-VERIFY ?auto_95653 ?auto_95654 ?auto_95655 ?auto_95652 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95682 - OBJ
      ?auto_95683 - OBJ
      ?auto_95684 - OBJ
      ?auto_95685 - OBJ
      ?auto_95681 - LOCATION
    )
    :vars
    (
      ?auto_95687 - TRUCK
      ?auto_95686 - LOCATION
      ?auto_95688 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95687 ?auto_95686 ) ( IN-CITY ?auto_95686 ?auto_95688 ) ( IN-CITY ?auto_95681 ?auto_95688 ) ( not ( = ?auto_95681 ?auto_95686 ) ) ( OBJ-AT ?auto_95684 ?auto_95681 ) ( not ( = ?auto_95684 ?auto_95685 ) ) ( OBJ-AT ?auto_95685 ?auto_95686 ) ( OBJ-AT ?auto_95682 ?auto_95681 ) ( OBJ-AT ?auto_95683 ?auto_95681 ) ( not ( = ?auto_95682 ?auto_95683 ) ) ( not ( = ?auto_95682 ?auto_95684 ) ) ( not ( = ?auto_95682 ?auto_95685 ) ) ( not ( = ?auto_95683 ?auto_95684 ) ) ( not ( = ?auto_95683 ?auto_95685 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95684 ?auto_95685 ?auto_95681 )
      ( DELIVER-4PKG-VERIFY ?auto_95682 ?auto_95683 ?auto_95684 ?auto_95685 ?auto_95681 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95690 - OBJ
      ?auto_95691 - OBJ
      ?auto_95692 - OBJ
      ?auto_95693 - OBJ
      ?auto_95689 - LOCATION
    )
    :vars
    (
      ?auto_95695 - TRUCK
      ?auto_95694 - LOCATION
      ?auto_95696 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95695 ?auto_95694 ) ( IN-CITY ?auto_95694 ?auto_95696 ) ( IN-CITY ?auto_95689 ?auto_95696 ) ( not ( = ?auto_95689 ?auto_95694 ) ) ( OBJ-AT ?auto_95693 ?auto_95689 ) ( not ( = ?auto_95693 ?auto_95692 ) ) ( OBJ-AT ?auto_95692 ?auto_95694 ) ( OBJ-AT ?auto_95690 ?auto_95689 ) ( OBJ-AT ?auto_95691 ?auto_95689 ) ( not ( = ?auto_95690 ?auto_95691 ) ) ( not ( = ?auto_95690 ?auto_95692 ) ) ( not ( = ?auto_95690 ?auto_95693 ) ) ( not ( = ?auto_95691 ?auto_95692 ) ) ( not ( = ?auto_95691 ?auto_95693 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95693 ?auto_95692 ?auto_95689 )
      ( DELIVER-4PKG-VERIFY ?auto_95690 ?auto_95691 ?auto_95692 ?auto_95693 ?auto_95689 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95706 - OBJ
      ?auto_95707 - OBJ
      ?auto_95708 - OBJ
      ?auto_95709 - OBJ
      ?auto_95705 - LOCATION
    )
    :vars
    (
      ?auto_95711 - TRUCK
      ?auto_95710 - LOCATION
      ?auto_95712 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95711 ?auto_95710 ) ( IN-CITY ?auto_95710 ?auto_95712 ) ( IN-CITY ?auto_95705 ?auto_95712 ) ( not ( = ?auto_95705 ?auto_95710 ) ) ( OBJ-AT ?auto_95706 ?auto_95705 ) ( not ( = ?auto_95706 ?auto_95707 ) ) ( OBJ-AT ?auto_95707 ?auto_95710 ) ( OBJ-AT ?auto_95708 ?auto_95705 ) ( OBJ-AT ?auto_95709 ?auto_95705 ) ( not ( = ?auto_95706 ?auto_95708 ) ) ( not ( = ?auto_95706 ?auto_95709 ) ) ( not ( = ?auto_95707 ?auto_95708 ) ) ( not ( = ?auto_95707 ?auto_95709 ) ) ( not ( = ?auto_95708 ?auto_95709 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95706 ?auto_95707 ?auto_95705 )
      ( DELIVER-4PKG-VERIFY ?auto_95706 ?auto_95707 ?auto_95708 ?auto_95709 ?auto_95705 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95738 - OBJ
      ?auto_95739 - OBJ
      ?auto_95740 - OBJ
      ?auto_95741 - OBJ
      ?auto_95737 - LOCATION
    )
    :vars
    (
      ?auto_95743 - TRUCK
      ?auto_95742 - LOCATION
      ?auto_95744 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95743 ?auto_95742 ) ( IN-CITY ?auto_95742 ?auto_95744 ) ( IN-CITY ?auto_95737 ?auto_95744 ) ( not ( = ?auto_95737 ?auto_95742 ) ) ( OBJ-AT ?auto_95740 ?auto_95737 ) ( not ( = ?auto_95740 ?auto_95738 ) ) ( OBJ-AT ?auto_95738 ?auto_95742 ) ( OBJ-AT ?auto_95739 ?auto_95737 ) ( OBJ-AT ?auto_95741 ?auto_95737 ) ( not ( = ?auto_95738 ?auto_95739 ) ) ( not ( = ?auto_95738 ?auto_95741 ) ) ( not ( = ?auto_95739 ?auto_95740 ) ) ( not ( = ?auto_95739 ?auto_95741 ) ) ( not ( = ?auto_95740 ?auto_95741 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95740 ?auto_95738 ?auto_95737 )
      ( DELIVER-4PKG-VERIFY ?auto_95738 ?auto_95739 ?auto_95740 ?auto_95741 ?auto_95737 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95803 - OBJ
      ?auto_95802 - LOCATION
    )
    :vars
    (
      ?auto_95804 - LOCATION
      ?auto_95807 - CITY
      ?auto_95806 - OBJ
      ?auto_95805 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95804 ?auto_95807 ) ( IN-CITY ?auto_95802 ?auto_95807 ) ( not ( = ?auto_95802 ?auto_95804 ) ) ( OBJ-AT ?auto_95806 ?auto_95802 ) ( not ( = ?auto_95806 ?auto_95803 ) ) ( OBJ-AT ?auto_95803 ?auto_95804 ) ( TRUCK-AT ?auto_95805 ?auto_95802 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_95805 ?auto_95802 ?auto_95804 ?auto_95807 )
      ( DELIVER-2PKG ?auto_95806 ?auto_95803 ?auto_95802 )
      ( DELIVER-1PKG-VERIFY ?auto_95803 ?auto_95802 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95809 - OBJ
      ?auto_95810 - OBJ
      ?auto_95808 - LOCATION
    )
    :vars
    (
      ?auto_95811 - LOCATION
      ?auto_95813 - CITY
      ?auto_95812 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95811 ?auto_95813 ) ( IN-CITY ?auto_95808 ?auto_95813 ) ( not ( = ?auto_95808 ?auto_95811 ) ) ( OBJ-AT ?auto_95809 ?auto_95808 ) ( not ( = ?auto_95809 ?auto_95810 ) ) ( OBJ-AT ?auto_95810 ?auto_95811 ) ( TRUCK-AT ?auto_95812 ?auto_95808 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95810 ?auto_95808 )
      ( DELIVER-2PKG-VERIFY ?auto_95809 ?auto_95810 ?auto_95808 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_95815 - OBJ
      ?auto_95816 - OBJ
      ?auto_95814 - LOCATION
    )
    :vars
    (
      ?auto_95817 - LOCATION
      ?auto_95818 - CITY
      ?auto_95819 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95817 ?auto_95818 ) ( IN-CITY ?auto_95814 ?auto_95818 ) ( not ( = ?auto_95814 ?auto_95817 ) ) ( OBJ-AT ?auto_95816 ?auto_95814 ) ( not ( = ?auto_95816 ?auto_95815 ) ) ( OBJ-AT ?auto_95815 ?auto_95817 ) ( TRUCK-AT ?auto_95819 ?auto_95814 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95816 ?auto_95815 ?auto_95814 )
      ( DELIVER-2PKG-VERIFY ?auto_95815 ?auto_95816 ?auto_95814 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95828 - OBJ
      ?auto_95829 - OBJ
      ?auto_95830 - OBJ
      ?auto_95827 - LOCATION
    )
    :vars
    (
      ?auto_95831 - LOCATION
      ?auto_95832 - CITY
      ?auto_95833 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95831 ?auto_95832 ) ( IN-CITY ?auto_95827 ?auto_95832 ) ( not ( = ?auto_95827 ?auto_95831 ) ) ( OBJ-AT ?auto_95828 ?auto_95827 ) ( not ( = ?auto_95828 ?auto_95830 ) ) ( OBJ-AT ?auto_95830 ?auto_95831 ) ( TRUCK-AT ?auto_95833 ?auto_95827 ) ( OBJ-AT ?auto_95829 ?auto_95827 ) ( not ( = ?auto_95828 ?auto_95829 ) ) ( not ( = ?auto_95829 ?auto_95830 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95828 ?auto_95830 ?auto_95827 )
      ( DELIVER-3PKG-VERIFY ?auto_95828 ?auto_95829 ?auto_95830 ?auto_95827 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95835 - OBJ
      ?auto_95836 - OBJ
      ?auto_95837 - OBJ
      ?auto_95834 - LOCATION
    )
    :vars
    (
      ?auto_95838 - LOCATION
      ?auto_95839 - CITY
      ?auto_95840 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95838 ?auto_95839 ) ( IN-CITY ?auto_95834 ?auto_95839 ) ( not ( = ?auto_95834 ?auto_95838 ) ) ( OBJ-AT ?auto_95837 ?auto_95834 ) ( not ( = ?auto_95837 ?auto_95836 ) ) ( OBJ-AT ?auto_95836 ?auto_95838 ) ( TRUCK-AT ?auto_95840 ?auto_95834 ) ( OBJ-AT ?auto_95835 ?auto_95834 ) ( not ( = ?auto_95835 ?auto_95836 ) ) ( not ( = ?auto_95835 ?auto_95837 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95837 ?auto_95836 ?auto_95834 )
      ( DELIVER-3PKG-VERIFY ?auto_95835 ?auto_95836 ?auto_95837 ?auto_95834 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_95849 - OBJ
      ?auto_95850 - OBJ
      ?auto_95851 - OBJ
      ?auto_95848 - LOCATION
    )
    :vars
    (
      ?auto_95852 - LOCATION
      ?auto_95853 - CITY
      ?auto_95854 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95852 ?auto_95853 ) ( IN-CITY ?auto_95848 ?auto_95853 ) ( not ( = ?auto_95848 ?auto_95852 ) ) ( OBJ-AT ?auto_95851 ?auto_95848 ) ( not ( = ?auto_95851 ?auto_95849 ) ) ( OBJ-AT ?auto_95849 ?auto_95852 ) ( TRUCK-AT ?auto_95854 ?auto_95848 ) ( OBJ-AT ?auto_95850 ?auto_95848 ) ( not ( = ?auto_95849 ?auto_95850 ) ) ( not ( = ?auto_95850 ?auto_95851 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95851 ?auto_95849 ?auto_95848 )
      ( DELIVER-3PKG-VERIFY ?auto_95849 ?auto_95850 ?auto_95851 ?auto_95848 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95878 - OBJ
      ?auto_95879 - OBJ
      ?auto_95880 - OBJ
      ?auto_95881 - OBJ
      ?auto_95877 - LOCATION
    )
    :vars
    (
      ?auto_95882 - LOCATION
      ?auto_95883 - CITY
      ?auto_95884 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95882 ?auto_95883 ) ( IN-CITY ?auto_95877 ?auto_95883 ) ( not ( = ?auto_95877 ?auto_95882 ) ) ( OBJ-AT ?auto_95880 ?auto_95877 ) ( not ( = ?auto_95880 ?auto_95881 ) ) ( OBJ-AT ?auto_95881 ?auto_95882 ) ( TRUCK-AT ?auto_95884 ?auto_95877 ) ( OBJ-AT ?auto_95878 ?auto_95877 ) ( OBJ-AT ?auto_95879 ?auto_95877 ) ( not ( = ?auto_95878 ?auto_95879 ) ) ( not ( = ?auto_95878 ?auto_95880 ) ) ( not ( = ?auto_95878 ?auto_95881 ) ) ( not ( = ?auto_95879 ?auto_95880 ) ) ( not ( = ?auto_95879 ?auto_95881 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95880 ?auto_95881 ?auto_95877 )
      ( DELIVER-4PKG-VERIFY ?auto_95878 ?auto_95879 ?auto_95880 ?auto_95881 ?auto_95877 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95886 - OBJ
      ?auto_95887 - OBJ
      ?auto_95888 - OBJ
      ?auto_95889 - OBJ
      ?auto_95885 - LOCATION
    )
    :vars
    (
      ?auto_95890 - LOCATION
      ?auto_95891 - CITY
      ?auto_95892 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95890 ?auto_95891 ) ( IN-CITY ?auto_95885 ?auto_95891 ) ( not ( = ?auto_95885 ?auto_95890 ) ) ( OBJ-AT ?auto_95889 ?auto_95885 ) ( not ( = ?auto_95889 ?auto_95888 ) ) ( OBJ-AT ?auto_95888 ?auto_95890 ) ( TRUCK-AT ?auto_95892 ?auto_95885 ) ( OBJ-AT ?auto_95886 ?auto_95885 ) ( OBJ-AT ?auto_95887 ?auto_95885 ) ( not ( = ?auto_95886 ?auto_95887 ) ) ( not ( = ?auto_95886 ?auto_95888 ) ) ( not ( = ?auto_95886 ?auto_95889 ) ) ( not ( = ?auto_95887 ?auto_95888 ) ) ( not ( = ?auto_95887 ?auto_95889 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95889 ?auto_95888 ?auto_95885 )
      ( DELIVER-4PKG-VERIFY ?auto_95886 ?auto_95887 ?auto_95888 ?auto_95889 ?auto_95885 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95902 - OBJ
      ?auto_95903 - OBJ
      ?auto_95904 - OBJ
      ?auto_95905 - OBJ
      ?auto_95901 - LOCATION
    )
    :vars
    (
      ?auto_95906 - LOCATION
      ?auto_95907 - CITY
      ?auto_95908 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95906 ?auto_95907 ) ( IN-CITY ?auto_95901 ?auto_95907 ) ( not ( = ?auto_95901 ?auto_95906 ) ) ( OBJ-AT ?auto_95904 ?auto_95901 ) ( not ( = ?auto_95904 ?auto_95903 ) ) ( OBJ-AT ?auto_95903 ?auto_95906 ) ( TRUCK-AT ?auto_95908 ?auto_95901 ) ( OBJ-AT ?auto_95902 ?auto_95901 ) ( OBJ-AT ?auto_95905 ?auto_95901 ) ( not ( = ?auto_95902 ?auto_95903 ) ) ( not ( = ?auto_95902 ?auto_95904 ) ) ( not ( = ?auto_95902 ?auto_95905 ) ) ( not ( = ?auto_95903 ?auto_95905 ) ) ( not ( = ?auto_95904 ?auto_95905 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95904 ?auto_95903 ?auto_95901 )
      ( DELIVER-4PKG-VERIFY ?auto_95902 ?auto_95903 ?auto_95904 ?auto_95905 ?auto_95901 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_95934 - OBJ
      ?auto_95935 - OBJ
      ?auto_95936 - OBJ
      ?auto_95937 - OBJ
      ?auto_95933 - LOCATION
    )
    :vars
    (
      ?auto_95938 - LOCATION
      ?auto_95939 - CITY
      ?auto_95940 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95938 ?auto_95939 ) ( IN-CITY ?auto_95933 ?auto_95939 ) ( not ( = ?auto_95933 ?auto_95938 ) ) ( OBJ-AT ?auto_95936 ?auto_95933 ) ( not ( = ?auto_95936 ?auto_95934 ) ) ( OBJ-AT ?auto_95934 ?auto_95938 ) ( TRUCK-AT ?auto_95940 ?auto_95933 ) ( OBJ-AT ?auto_95935 ?auto_95933 ) ( OBJ-AT ?auto_95937 ?auto_95933 ) ( not ( = ?auto_95934 ?auto_95935 ) ) ( not ( = ?auto_95934 ?auto_95937 ) ) ( not ( = ?auto_95935 ?auto_95936 ) ) ( not ( = ?auto_95935 ?auto_95937 ) ) ( not ( = ?auto_95936 ?auto_95937 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95936 ?auto_95934 ?auto_95933 )
      ( DELIVER-4PKG-VERIFY ?auto_95934 ?auto_95935 ?auto_95936 ?auto_95937 ?auto_95933 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95999 - OBJ
      ?auto_95998 - LOCATION
    )
    :vars
    (
      ?auto_96001 - LOCATION
      ?auto_96002 - CITY
      ?auto_96000 - OBJ
      ?auto_96003 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96001 ?auto_96002 ) ( IN-CITY ?auto_95998 ?auto_96002 ) ( not ( = ?auto_95998 ?auto_96001 ) ) ( not ( = ?auto_96000 ?auto_95999 ) ) ( OBJ-AT ?auto_95999 ?auto_96001 ) ( TRUCK-AT ?auto_96003 ?auto_95998 ) ( IN-TRUCK ?auto_96000 ?auto_96003 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96000 ?auto_95998 )
      ( DELIVER-2PKG ?auto_96000 ?auto_95999 ?auto_95998 )
      ( DELIVER-1PKG-VERIFY ?auto_95999 ?auto_95998 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96005 - OBJ
      ?auto_96006 - OBJ
      ?auto_96004 - LOCATION
    )
    :vars
    (
      ?auto_96007 - LOCATION
      ?auto_96008 - CITY
      ?auto_96009 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96007 ?auto_96008 ) ( IN-CITY ?auto_96004 ?auto_96008 ) ( not ( = ?auto_96004 ?auto_96007 ) ) ( not ( = ?auto_96005 ?auto_96006 ) ) ( OBJ-AT ?auto_96006 ?auto_96007 ) ( TRUCK-AT ?auto_96009 ?auto_96004 ) ( IN-TRUCK ?auto_96005 ?auto_96009 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96006 ?auto_96004 )
      ( DELIVER-2PKG-VERIFY ?auto_96005 ?auto_96006 ?auto_96004 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96011 - OBJ
      ?auto_96012 - OBJ
      ?auto_96010 - LOCATION
    )
    :vars
    (
      ?auto_96014 - LOCATION
      ?auto_96015 - CITY
      ?auto_96013 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96014 ?auto_96015 ) ( IN-CITY ?auto_96010 ?auto_96015 ) ( not ( = ?auto_96010 ?auto_96014 ) ) ( not ( = ?auto_96012 ?auto_96011 ) ) ( OBJ-AT ?auto_96011 ?auto_96014 ) ( TRUCK-AT ?auto_96013 ?auto_96010 ) ( IN-TRUCK ?auto_96012 ?auto_96013 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96012 ?auto_96011 ?auto_96010 )
      ( DELIVER-2PKG-VERIFY ?auto_96011 ?auto_96012 ?auto_96010 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96195 - OBJ
      ?auto_96194 - LOCATION
    )
    :vars
    (
      ?auto_96197 - LOCATION
      ?auto_96199 - CITY
      ?auto_96198 - OBJ
      ?auto_96196 - TRUCK
      ?auto_96200 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96197 ?auto_96199 ) ( IN-CITY ?auto_96194 ?auto_96199 ) ( not ( = ?auto_96194 ?auto_96197 ) ) ( not ( = ?auto_96198 ?auto_96195 ) ) ( OBJ-AT ?auto_96195 ?auto_96197 ) ( IN-TRUCK ?auto_96198 ?auto_96196 ) ( TRUCK-AT ?auto_96196 ?auto_96200 ) ( IN-CITY ?auto_96200 ?auto_96199 ) ( not ( = ?auto_96194 ?auto_96200 ) ) ( not ( = ?auto_96197 ?auto_96200 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_96196 ?auto_96200 ?auto_96194 ?auto_96199 )
      ( DELIVER-2PKG ?auto_96198 ?auto_96195 ?auto_96194 )
      ( DELIVER-1PKG-VERIFY ?auto_96195 ?auto_96194 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96202 - OBJ
      ?auto_96203 - OBJ
      ?auto_96201 - LOCATION
    )
    :vars
    (
      ?auto_96207 - LOCATION
      ?auto_96204 - CITY
      ?auto_96206 - TRUCK
      ?auto_96205 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96207 ?auto_96204 ) ( IN-CITY ?auto_96201 ?auto_96204 ) ( not ( = ?auto_96201 ?auto_96207 ) ) ( not ( = ?auto_96202 ?auto_96203 ) ) ( OBJ-AT ?auto_96203 ?auto_96207 ) ( IN-TRUCK ?auto_96202 ?auto_96206 ) ( TRUCK-AT ?auto_96206 ?auto_96205 ) ( IN-CITY ?auto_96205 ?auto_96204 ) ( not ( = ?auto_96201 ?auto_96205 ) ) ( not ( = ?auto_96207 ?auto_96205 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96203 ?auto_96201 )
      ( DELIVER-2PKG-VERIFY ?auto_96202 ?auto_96203 ?auto_96201 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96209 - OBJ
      ?auto_96210 - OBJ
      ?auto_96208 - LOCATION
    )
    :vars
    (
      ?auto_96211 - LOCATION
      ?auto_96213 - CITY
      ?auto_96212 - TRUCK
      ?auto_96214 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96211 ?auto_96213 ) ( IN-CITY ?auto_96208 ?auto_96213 ) ( not ( = ?auto_96208 ?auto_96211 ) ) ( not ( = ?auto_96210 ?auto_96209 ) ) ( OBJ-AT ?auto_96209 ?auto_96211 ) ( IN-TRUCK ?auto_96210 ?auto_96212 ) ( TRUCK-AT ?auto_96212 ?auto_96214 ) ( IN-CITY ?auto_96214 ?auto_96213 ) ( not ( = ?auto_96208 ?auto_96214 ) ) ( not ( = ?auto_96211 ?auto_96214 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96210 ?auto_96209 ?auto_96208 )
      ( DELIVER-2PKG-VERIFY ?auto_96209 ?auto_96210 ?auto_96208 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96417 - OBJ
      ?auto_96416 - LOCATION
    )
    :vars
    (
      ?auto_96418 - LOCATION
      ?auto_96421 - CITY
      ?auto_96420 - OBJ
      ?auto_96419 - TRUCK
      ?auto_96422 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96418 ?auto_96421 ) ( IN-CITY ?auto_96416 ?auto_96421 ) ( not ( = ?auto_96416 ?auto_96418 ) ) ( not ( = ?auto_96420 ?auto_96417 ) ) ( OBJ-AT ?auto_96417 ?auto_96418 ) ( TRUCK-AT ?auto_96419 ?auto_96422 ) ( IN-CITY ?auto_96422 ?auto_96421 ) ( not ( = ?auto_96416 ?auto_96422 ) ) ( not ( = ?auto_96418 ?auto_96422 ) ) ( OBJ-AT ?auto_96420 ?auto_96422 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_96420 ?auto_96419 ?auto_96422 )
      ( DELIVER-2PKG ?auto_96420 ?auto_96417 ?auto_96416 )
      ( DELIVER-1PKG-VERIFY ?auto_96417 ?auto_96416 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96424 - OBJ
      ?auto_96425 - OBJ
      ?auto_96423 - LOCATION
    )
    :vars
    (
      ?auto_96426 - LOCATION
      ?auto_96428 - CITY
      ?auto_96427 - TRUCK
      ?auto_96429 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96426 ?auto_96428 ) ( IN-CITY ?auto_96423 ?auto_96428 ) ( not ( = ?auto_96423 ?auto_96426 ) ) ( not ( = ?auto_96424 ?auto_96425 ) ) ( OBJ-AT ?auto_96425 ?auto_96426 ) ( TRUCK-AT ?auto_96427 ?auto_96429 ) ( IN-CITY ?auto_96429 ?auto_96428 ) ( not ( = ?auto_96423 ?auto_96429 ) ) ( not ( = ?auto_96426 ?auto_96429 ) ) ( OBJ-AT ?auto_96424 ?auto_96429 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96425 ?auto_96423 )
      ( DELIVER-2PKG-VERIFY ?auto_96424 ?auto_96425 ?auto_96423 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_96431 - OBJ
      ?auto_96432 - OBJ
      ?auto_96430 - LOCATION
    )
    :vars
    (
      ?auto_96435 - LOCATION
      ?auto_96433 - CITY
      ?auto_96434 - TRUCK
      ?auto_96436 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96435 ?auto_96433 ) ( IN-CITY ?auto_96430 ?auto_96433 ) ( not ( = ?auto_96430 ?auto_96435 ) ) ( not ( = ?auto_96432 ?auto_96431 ) ) ( OBJ-AT ?auto_96431 ?auto_96435 ) ( TRUCK-AT ?auto_96434 ?auto_96436 ) ( IN-CITY ?auto_96436 ?auto_96433 ) ( not ( = ?auto_96430 ?auto_96436 ) ) ( not ( = ?auto_96435 ?auto_96436 ) ) ( OBJ-AT ?auto_96432 ?auto_96436 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96432 ?auto_96431 ?auto_96430 )
      ( DELIVER-2PKG-VERIFY ?auto_96431 ?auto_96432 ?auto_96430 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97787 - OBJ
      ?auto_97788 - OBJ
      ?auto_97789 - OBJ
      ?auto_97786 - LOCATION
    )
    :vars
    (
      ?auto_97792 - TRUCK
      ?auto_97791 - LOCATION
      ?auto_97790 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97788 ?auto_97792 ) ( TRUCK-AT ?auto_97792 ?auto_97791 ) ( IN-CITY ?auto_97791 ?auto_97790 ) ( IN-CITY ?auto_97786 ?auto_97790 ) ( not ( = ?auto_97786 ?auto_97791 ) ) ( OBJ-AT ?auto_97787 ?auto_97786 ) ( not ( = ?auto_97787 ?auto_97788 ) ) ( OBJ-AT ?auto_97789 ?auto_97786 ) ( not ( = ?auto_97787 ?auto_97789 ) ) ( not ( = ?auto_97788 ?auto_97789 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97787 ?auto_97788 ?auto_97786 )
      ( DELIVER-3PKG-VERIFY ?auto_97787 ?auto_97788 ?auto_97789 ?auto_97786 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97809 - OBJ
      ?auto_97810 - OBJ
      ?auto_97811 - OBJ
      ?auto_97808 - LOCATION
    )
    :vars
    (
      ?auto_97815 - TRUCK
      ?auto_97814 - LOCATION
      ?auto_97813 - CITY
      ?auto_97812 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97811 ?auto_97815 ) ( TRUCK-AT ?auto_97815 ?auto_97814 ) ( IN-CITY ?auto_97814 ?auto_97813 ) ( IN-CITY ?auto_97808 ?auto_97813 ) ( not ( = ?auto_97808 ?auto_97814 ) ) ( OBJ-AT ?auto_97812 ?auto_97808 ) ( not ( = ?auto_97812 ?auto_97811 ) ) ( OBJ-AT ?auto_97809 ?auto_97808 ) ( OBJ-AT ?auto_97810 ?auto_97808 ) ( not ( = ?auto_97809 ?auto_97810 ) ) ( not ( = ?auto_97809 ?auto_97811 ) ) ( not ( = ?auto_97809 ?auto_97812 ) ) ( not ( = ?auto_97810 ?auto_97811 ) ) ( not ( = ?auto_97810 ?auto_97812 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97812 ?auto_97811 ?auto_97808 )
      ( DELIVER-3PKG-VERIFY ?auto_97809 ?auto_97810 ?auto_97811 ?auto_97808 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97821 - OBJ
      ?auto_97822 - OBJ
      ?auto_97823 - OBJ
      ?auto_97820 - LOCATION
    )
    :vars
    (
      ?auto_97827 - TRUCK
      ?auto_97826 - LOCATION
      ?auto_97825 - CITY
      ?auto_97824 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97822 ?auto_97827 ) ( TRUCK-AT ?auto_97827 ?auto_97826 ) ( IN-CITY ?auto_97826 ?auto_97825 ) ( IN-CITY ?auto_97820 ?auto_97825 ) ( not ( = ?auto_97820 ?auto_97826 ) ) ( OBJ-AT ?auto_97824 ?auto_97820 ) ( not ( = ?auto_97824 ?auto_97822 ) ) ( OBJ-AT ?auto_97821 ?auto_97820 ) ( OBJ-AT ?auto_97823 ?auto_97820 ) ( not ( = ?auto_97821 ?auto_97822 ) ) ( not ( = ?auto_97821 ?auto_97823 ) ) ( not ( = ?auto_97821 ?auto_97824 ) ) ( not ( = ?auto_97822 ?auto_97823 ) ) ( not ( = ?auto_97823 ?auto_97824 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97824 ?auto_97822 ?auto_97820 )
      ( DELIVER-3PKG-VERIFY ?auto_97821 ?auto_97822 ?auto_97823 ?auto_97820 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97837 - OBJ
      ?auto_97838 - OBJ
      ?auto_97839 - OBJ
      ?auto_97836 - LOCATION
    )
    :vars
    (
      ?auto_97842 - TRUCK
      ?auto_97841 - LOCATION
      ?auto_97840 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97837 ?auto_97842 ) ( TRUCK-AT ?auto_97842 ?auto_97841 ) ( IN-CITY ?auto_97841 ?auto_97840 ) ( IN-CITY ?auto_97836 ?auto_97840 ) ( not ( = ?auto_97836 ?auto_97841 ) ) ( OBJ-AT ?auto_97839 ?auto_97836 ) ( not ( = ?auto_97839 ?auto_97837 ) ) ( OBJ-AT ?auto_97838 ?auto_97836 ) ( not ( = ?auto_97837 ?auto_97838 ) ) ( not ( = ?auto_97838 ?auto_97839 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97839 ?auto_97837 ?auto_97836 )
      ( DELIVER-3PKG-VERIFY ?auto_97837 ?auto_97838 ?auto_97839 ?auto_97836 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_97859 - OBJ
      ?auto_97860 - OBJ
      ?auto_97861 - OBJ
      ?auto_97858 - LOCATION
    )
    :vars
    (
      ?auto_97865 - TRUCK
      ?auto_97864 - LOCATION
      ?auto_97863 - CITY
      ?auto_97862 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97859 ?auto_97865 ) ( TRUCK-AT ?auto_97865 ?auto_97864 ) ( IN-CITY ?auto_97864 ?auto_97863 ) ( IN-CITY ?auto_97858 ?auto_97863 ) ( not ( = ?auto_97858 ?auto_97864 ) ) ( OBJ-AT ?auto_97862 ?auto_97858 ) ( not ( = ?auto_97862 ?auto_97859 ) ) ( OBJ-AT ?auto_97860 ?auto_97858 ) ( OBJ-AT ?auto_97861 ?auto_97858 ) ( not ( = ?auto_97859 ?auto_97860 ) ) ( not ( = ?auto_97859 ?auto_97861 ) ) ( not ( = ?auto_97860 ?auto_97861 ) ) ( not ( = ?auto_97860 ?auto_97862 ) ) ( not ( = ?auto_97861 ?auto_97862 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97862 ?auto_97859 ?auto_97858 )
      ( DELIVER-3PKG-VERIFY ?auto_97859 ?auto_97860 ?auto_97861 ?auto_97858 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_97906 - OBJ
      ?auto_97907 - OBJ
      ?auto_97908 - OBJ
      ?auto_97909 - OBJ
      ?auto_97905 - LOCATION
    )
    :vars
    (
      ?auto_97912 - TRUCK
      ?auto_97911 - LOCATION
      ?auto_97910 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97909 ?auto_97912 ) ( TRUCK-AT ?auto_97912 ?auto_97911 ) ( IN-CITY ?auto_97911 ?auto_97910 ) ( IN-CITY ?auto_97905 ?auto_97910 ) ( not ( = ?auto_97905 ?auto_97911 ) ) ( OBJ-AT ?auto_97907 ?auto_97905 ) ( not ( = ?auto_97907 ?auto_97909 ) ) ( OBJ-AT ?auto_97906 ?auto_97905 ) ( OBJ-AT ?auto_97908 ?auto_97905 ) ( not ( = ?auto_97906 ?auto_97907 ) ) ( not ( = ?auto_97906 ?auto_97908 ) ) ( not ( = ?auto_97906 ?auto_97909 ) ) ( not ( = ?auto_97907 ?auto_97908 ) ) ( not ( = ?auto_97908 ?auto_97909 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97907 ?auto_97909 ?auto_97905 )
      ( DELIVER-4PKG-VERIFY ?auto_97906 ?auto_97907 ?auto_97908 ?auto_97909 ?auto_97905 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_97914 - OBJ
      ?auto_97915 - OBJ
      ?auto_97916 - OBJ
      ?auto_97917 - OBJ
      ?auto_97913 - LOCATION
    )
    :vars
    (
      ?auto_97920 - TRUCK
      ?auto_97919 - LOCATION
      ?auto_97918 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97916 ?auto_97920 ) ( TRUCK-AT ?auto_97920 ?auto_97919 ) ( IN-CITY ?auto_97919 ?auto_97918 ) ( IN-CITY ?auto_97913 ?auto_97918 ) ( not ( = ?auto_97913 ?auto_97919 ) ) ( OBJ-AT ?auto_97917 ?auto_97913 ) ( not ( = ?auto_97917 ?auto_97916 ) ) ( OBJ-AT ?auto_97914 ?auto_97913 ) ( OBJ-AT ?auto_97915 ?auto_97913 ) ( not ( = ?auto_97914 ?auto_97915 ) ) ( not ( = ?auto_97914 ?auto_97916 ) ) ( not ( = ?auto_97914 ?auto_97917 ) ) ( not ( = ?auto_97915 ?auto_97916 ) ) ( not ( = ?auto_97915 ?auto_97917 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97917 ?auto_97916 ?auto_97913 )
      ( DELIVER-4PKG-VERIFY ?auto_97914 ?auto_97915 ?auto_97916 ?auto_97917 ?auto_97913 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_97946 - OBJ
      ?auto_97947 - OBJ
      ?auto_97948 - OBJ
      ?auto_97949 - OBJ
      ?auto_97945 - LOCATION
    )
    :vars
    (
      ?auto_97952 - TRUCK
      ?auto_97951 - LOCATION
      ?auto_97950 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97949 ?auto_97952 ) ( TRUCK-AT ?auto_97952 ?auto_97951 ) ( IN-CITY ?auto_97951 ?auto_97950 ) ( IN-CITY ?auto_97945 ?auto_97950 ) ( not ( = ?auto_97945 ?auto_97951 ) ) ( OBJ-AT ?auto_97946 ?auto_97945 ) ( not ( = ?auto_97946 ?auto_97949 ) ) ( OBJ-AT ?auto_97947 ?auto_97945 ) ( OBJ-AT ?auto_97948 ?auto_97945 ) ( not ( = ?auto_97946 ?auto_97947 ) ) ( not ( = ?auto_97946 ?auto_97948 ) ) ( not ( = ?auto_97947 ?auto_97948 ) ) ( not ( = ?auto_97947 ?auto_97949 ) ) ( not ( = ?auto_97948 ?auto_97949 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97946 ?auto_97949 ?auto_97945 )
      ( DELIVER-4PKG-VERIFY ?auto_97946 ?auto_97947 ?auto_97948 ?auto_97949 ?auto_97945 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_97978 - OBJ
      ?auto_97979 - OBJ
      ?auto_97980 - OBJ
      ?auto_97981 - OBJ
      ?auto_97977 - LOCATION
    )
    :vars
    (
      ?auto_97984 - TRUCK
      ?auto_97983 - LOCATION
      ?auto_97982 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97979 ?auto_97984 ) ( TRUCK-AT ?auto_97984 ?auto_97983 ) ( IN-CITY ?auto_97983 ?auto_97982 ) ( IN-CITY ?auto_97977 ?auto_97982 ) ( not ( = ?auto_97977 ?auto_97983 ) ) ( OBJ-AT ?auto_97980 ?auto_97977 ) ( not ( = ?auto_97980 ?auto_97979 ) ) ( OBJ-AT ?auto_97978 ?auto_97977 ) ( OBJ-AT ?auto_97981 ?auto_97977 ) ( not ( = ?auto_97978 ?auto_97979 ) ) ( not ( = ?auto_97978 ?auto_97980 ) ) ( not ( = ?auto_97978 ?auto_97981 ) ) ( not ( = ?auto_97979 ?auto_97981 ) ) ( not ( = ?auto_97980 ?auto_97981 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97980 ?auto_97979 ?auto_97977 )
      ( DELIVER-4PKG-VERIFY ?auto_97978 ?auto_97979 ?auto_97980 ?auto_97981 ?auto_97977 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98074 - OBJ
      ?auto_98075 - OBJ
      ?auto_98076 - OBJ
      ?auto_98077 - OBJ
      ?auto_98073 - LOCATION
    )
    :vars
    (
      ?auto_98080 - TRUCK
      ?auto_98079 - LOCATION
      ?auto_98078 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98076 ?auto_98080 ) ( TRUCK-AT ?auto_98080 ?auto_98079 ) ( IN-CITY ?auto_98079 ?auto_98078 ) ( IN-CITY ?auto_98073 ?auto_98078 ) ( not ( = ?auto_98073 ?auto_98079 ) ) ( OBJ-AT ?auto_98075 ?auto_98073 ) ( not ( = ?auto_98075 ?auto_98076 ) ) ( OBJ-AT ?auto_98074 ?auto_98073 ) ( OBJ-AT ?auto_98077 ?auto_98073 ) ( not ( = ?auto_98074 ?auto_98075 ) ) ( not ( = ?auto_98074 ?auto_98076 ) ) ( not ( = ?auto_98074 ?auto_98077 ) ) ( not ( = ?auto_98075 ?auto_98077 ) ) ( not ( = ?auto_98076 ?auto_98077 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98075 ?auto_98076 ?auto_98073 )
      ( DELIVER-4PKG-VERIFY ?auto_98074 ?auto_98075 ?auto_98076 ?auto_98077 ?auto_98073 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98098 - OBJ
      ?auto_98099 - OBJ
      ?auto_98100 - OBJ
      ?auto_98101 - OBJ
      ?auto_98097 - LOCATION
    )
    :vars
    (
      ?auto_98105 - TRUCK
      ?auto_98104 - LOCATION
      ?auto_98103 - CITY
      ?auto_98102 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98101 ?auto_98105 ) ( TRUCK-AT ?auto_98105 ?auto_98104 ) ( IN-CITY ?auto_98104 ?auto_98103 ) ( IN-CITY ?auto_98097 ?auto_98103 ) ( not ( = ?auto_98097 ?auto_98104 ) ) ( OBJ-AT ?auto_98102 ?auto_98097 ) ( not ( = ?auto_98102 ?auto_98101 ) ) ( OBJ-AT ?auto_98098 ?auto_98097 ) ( OBJ-AT ?auto_98099 ?auto_98097 ) ( OBJ-AT ?auto_98100 ?auto_98097 ) ( not ( = ?auto_98098 ?auto_98099 ) ) ( not ( = ?auto_98098 ?auto_98100 ) ) ( not ( = ?auto_98098 ?auto_98101 ) ) ( not ( = ?auto_98098 ?auto_98102 ) ) ( not ( = ?auto_98099 ?auto_98100 ) ) ( not ( = ?auto_98099 ?auto_98101 ) ) ( not ( = ?auto_98099 ?auto_98102 ) ) ( not ( = ?auto_98100 ?auto_98101 ) ) ( not ( = ?auto_98100 ?auto_98102 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98102 ?auto_98101 ?auto_98097 )
      ( DELIVER-4PKG-VERIFY ?auto_98098 ?auto_98099 ?auto_98100 ?auto_98101 ?auto_98097 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98115 - OBJ
      ?auto_98116 - OBJ
      ?auto_98117 - OBJ
      ?auto_98118 - OBJ
      ?auto_98114 - LOCATION
    )
    :vars
    (
      ?auto_98122 - TRUCK
      ?auto_98121 - LOCATION
      ?auto_98120 - CITY
      ?auto_98119 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98117 ?auto_98122 ) ( TRUCK-AT ?auto_98122 ?auto_98121 ) ( IN-CITY ?auto_98121 ?auto_98120 ) ( IN-CITY ?auto_98114 ?auto_98120 ) ( not ( = ?auto_98114 ?auto_98121 ) ) ( OBJ-AT ?auto_98119 ?auto_98114 ) ( not ( = ?auto_98119 ?auto_98117 ) ) ( OBJ-AT ?auto_98115 ?auto_98114 ) ( OBJ-AT ?auto_98116 ?auto_98114 ) ( OBJ-AT ?auto_98118 ?auto_98114 ) ( not ( = ?auto_98115 ?auto_98116 ) ) ( not ( = ?auto_98115 ?auto_98117 ) ) ( not ( = ?auto_98115 ?auto_98118 ) ) ( not ( = ?auto_98115 ?auto_98119 ) ) ( not ( = ?auto_98116 ?auto_98117 ) ) ( not ( = ?auto_98116 ?auto_98118 ) ) ( not ( = ?auto_98116 ?auto_98119 ) ) ( not ( = ?auto_98117 ?auto_98118 ) ) ( not ( = ?auto_98118 ?auto_98119 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98119 ?auto_98117 ?auto_98114 )
      ( DELIVER-4PKG-VERIFY ?auto_98115 ?auto_98116 ?auto_98117 ?auto_98118 ?auto_98114 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98157 - OBJ
      ?auto_98158 - OBJ
      ?auto_98159 - OBJ
      ?auto_98160 - OBJ
      ?auto_98156 - LOCATION
    )
    :vars
    (
      ?auto_98163 - TRUCK
      ?auto_98162 - LOCATION
      ?auto_98161 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98158 ?auto_98163 ) ( TRUCK-AT ?auto_98163 ?auto_98162 ) ( IN-CITY ?auto_98162 ?auto_98161 ) ( IN-CITY ?auto_98156 ?auto_98161 ) ( not ( = ?auto_98156 ?auto_98162 ) ) ( OBJ-AT ?auto_98160 ?auto_98156 ) ( not ( = ?auto_98160 ?auto_98158 ) ) ( OBJ-AT ?auto_98157 ?auto_98156 ) ( OBJ-AT ?auto_98159 ?auto_98156 ) ( not ( = ?auto_98157 ?auto_98158 ) ) ( not ( = ?auto_98157 ?auto_98159 ) ) ( not ( = ?auto_98157 ?auto_98160 ) ) ( not ( = ?auto_98158 ?auto_98159 ) ) ( not ( = ?auto_98159 ?auto_98160 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98160 ?auto_98158 ?auto_98156 )
      ( DELIVER-4PKG-VERIFY ?auto_98157 ?auto_98158 ?auto_98159 ?auto_98160 ?auto_98156 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98165 - OBJ
      ?auto_98166 - OBJ
      ?auto_98167 - OBJ
      ?auto_98168 - OBJ
      ?auto_98164 - LOCATION
    )
    :vars
    (
      ?auto_98172 - TRUCK
      ?auto_98171 - LOCATION
      ?auto_98170 - CITY
      ?auto_98169 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98166 ?auto_98172 ) ( TRUCK-AT ?auto_98172 ?auto_98171 ) ( IN-CITY ?auto_98171 ?auto_98170 ) ( IN-CITY ?auto_98164 ?auto_98170 ) ( not ( = ?auto_98164 ?auto_98171 ) ) ( OBJ-AT ?auto_98169 ?auto_98164 ) ( not ( = ?auto_98169 ?auto_98166 ) ) ( OBJ-AT ?auto_98165 ?auto_98164 ) ( OBJ-AT ?auto_98167 ?auto_98164 ) ( OBJ-AT ?auto_98168 ?auto_98164 ) ( not ( = ?auto_98165 ?auto_98166 ) ) ( not ( = ?auto_98165 ?auto_98167 ) ) ( not ( = ?auto_98165 ?auto_98168 ) ) ( not ( = ?auto_98165 ?auto_98169 ) ) ( not ( = ?auto_98166 ?auto_98167 ) ) ( not ( = ?auto_98166 ?auto_98168 ) ) ( not ( = ?auto_98167 ?auto_98168 ) ) ( not ( = ?auto_98167 ?auto_98169 ) ) ( not ( = ?auto_98168 ?auto_98169 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98169 ?auto_98166 ?auto_98164 )
      ( DELIVER-4PKG-VERIFY ?auto_98165 ?auto_98166 ?auto_98167 ?auto_98168 ?auto_98164 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98209 - OBJ
      ?auto_98210 - OBJ
      ?auto_98211 - OBJ
      ?auto_98212 - OBJ
      ?auto_98208 - LOCATION
    )
    :vars
    (
      ?auto_98215 - TRUCK
      ?auto_98214 - LOCATION
      ?auto_98213 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98209 ?auto_98215 ) ( TRUCK-AT ?auto_98215 ?auto_98214 ) ( IN-CITY ?auto_98214 ?auto_98213 ) ( IN-CITY ?auto_98208 ?auto_98213 ) ( not ( = ?auto_98208 ?auto_98214 ) ) ( OBJ-AT ?auto_98212 ?auto_98208 ) ( not ( = ?auto_98212 ?auto_98209 ) ) ( OBJ-AT ?auto_98210 ?auto_98208 ) ( OBJ-AT ?auto_98211 ?auto_98208 ) ( not ( = ?auto_98209 ?auto_98210 ) ) ( not ( = ?auto_98209 ?auto_98211 ) ) ( not ( = ?auto_98210 ?auto_98211 ) ) ( not ( = ?auto_98210 ?auto_98212 ) ) ( not ( = ?auto_98211 ?auto_98212 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98212 ?auto_98209 ?auto_98208 )
      ( DELIVER-4PKG-VERIFY ?auto_98209 ?auto_98210 ?auto_98211 ?auto_98212 ?auto_98208 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98241 - OBJ
      ?auto_98242 - OBJ
      ?auto_98243 - OBJ
      ?auto_98244 - OBJ
      ?auto_98240 - LOCATION
    )
    :vars
    (
      ?auto_98247 - TRUCK
      ?auto_98246 - LOCATION
      ?auto_98245 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98241 ?auto_98247 ) ( TRUCK-AT ?auto_98247 ?auto_98246 ) ( IN-CITY ?auto_98246 ?auto_98245 ) ( IN-CITY ?auto_98240 ?auto_98245 ) ( not ( = ?auto_98240 ?auto_98246 ) ) ( OBJ-AT ?auto_98242 ?auto_98240 ) ( not ( = ?auto_98242 ?auto_98241 ) ) ( OBJ-AT ?auto_98243 ?auto_98240 ) ( OBJ-AT ?auto_98244 ?auto_98240 ) ( not ( = ?auto_98241 ?auto_98243 ) ) ( not ( = ?auto_98241 ?auto_98244 ) ) ( not ( = ?auto_98242 ?auto_98243 ) ) ( not ( = ?auto_98242 ?auto_98244 ) ) ( not ( = ?auto_98243 ?auto_98244 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98242 ?auto_98241 ?auto_98240 )
      ( DELIVER-4PKG-VERIFY ?auto_98241 ?auto_98242 ?auto_98243 ?auto_98244 ?auto_98240 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98313 - OBJ
      ?auto_98314 - OBJ
      ?auto_98315 - OBJ
      ?auto_98316 - OBJ
      ?auto_98312 - LOCATION
    )
    :vars
    (
      ?auto_98320 - TRUCK
      ?auto_98319 - LOCATION
      ?auto_98318 - CITY
      ?auto_98317 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98313 ?auto_98320 ) ( TRUCK-AT ?auto_98320 ?auto_98319 ) ( IN-CITY ?auto_98319 ?auto_98318 ) ( IN-CITY ?auto_98312 ?auto_98318 ) ( not ( = ?auto_98312 ?auto_98319 ) ) ( OBJ-AT ?auto_98317 ?auto_98312 ) ( not ( = ?auto_98317 ?auto_98313 ) ) ( OBJ-AT ?auto_98314 ?auto_98312 ) ( OBJ-AT ?auto_98315 ?auto_98312 ) ( OBJ-AT ?auto_98316 ?auto_98312 ) ( not ( = ?auto_98313 ?auto_98314 ) ) ( not ( = ?auto_98313 ?auto_98315 ) ) ( not ( = ?auto_98313 ?auto_98316 ) ) ( not ( = ?auto_98314 ?auto_98315 ) ) ( not ( = ?auto_98314 ?auto_98316 ) ) ( not ( = ?auto_98314 ?auto_98317 ) ) ( not ( = ?auto_98315 ?auto_98316 ) ) ( not ( = ?auto_98315 ?auto_98317 ) ) ( not ( = ?auto_98316 ?auto_98317 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98317 ?auto_98313 ?auto_98312 )
      ( DELIVER-4PKG-VERIFY ?auto_98313 ?auto_98314 ?auto_98315 ?auto_98316 ?auto_98312 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98497 - OBJ
      ?auto_98498 - OBJ
      ?auto_98499 - OBJ
      ?auto_98496 - LOCATION
    )
    :vars
    (
      ?auto_98500 - TRUCK
      ?auto_98502 - LOCATION
      ?auto_98503 - CITY
      ?auto_98501 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98500 ?auto_98502 ) ( IN-CITY ?auto_98502 ?auto_98503 ) ( IN-CITY ?auto_98496 ?auto_98503 ) ( not ( = ?auto_98496 ?auto_98502 ) ) ( OBJ-AT ?auto_98501 ?auto_98496 ) ( not ( = ?auto_98501 ?auto_98499 ) ) ( OBJ-AT ?auto_98499 ?auto_98502 ) ( OBJ-AT ?auto_98497 ?auto_98496 ) ( OBJ-AT ?auto_98498 ?auto_98496 ) ( not ( = ?auto_98497 ?auto_98498 ) ) ( not ( = ?auto_98497 ?auto_98499 ) ) ( not ( = ?auto_98497 ?auto_98501 ) ) ( not ( = ?auto_98498 ?auto_98499 ) ) ( not ( = ?auto_98498 ?auto_98501 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98501 ?auto_98499 ?auto_98496 )
      ( DELIVER-3PKG-VERIFY ?auto_98497 ?auto_98498 ?auto_98499 ?auto_98496 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98509 - OBJ
      ?auto_98510 - OBJ
      ?auto_98511 - OBJ
      ?auto_98508 - LOCATION
    )
    :vars
    (
      ?auto_98512 - TRUCK
      ?auto_98514 - LOCATION
      ?auto_98515 - CITY
      ?auto_98513 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98512 ?auto_98514 ) ( IN-CITY ?auto_98514 ?auto_98515 ) ( IN-CITY ?auto_98508 ?auto_98515 ) ( not ( = ?auto_98508 ?auto_98514 ) ) ( OBJ-AT ?auto_98513 ?auto_98508 ) ( not ( = ?auto_98513 ?auto_98510 ) ) ( OBJ-AT ?auto_98510 ?auto_98514 ) ( OBJ-AT ?auto_98509 ?auto_98508 ) ( OBJ-AT ?auto_98511 ?auto_98508 ) ( not ( = ?auto_98509 ?auto_98510 ) ) ( not ( = ?auto_98509 ?auto_98511 ) ) ( not ( = ?auto_98509 ?auto_98513 ) ) ( not ( = ?auto_98510 ?auto_98511 ) ) ( not ( = ?auto_98511 ?auto_98513 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98513 ?auto_98510 ?auto_98508 )
      ( DELIVER-3PKG-VERIFY ?auto_98509 ?auto_98510 ?auto_98511 ?auto_98508 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98525 - OBJ
      ?auto_98526 - OBJ
      ?auto_98527 - OBJ
      ?auto_98524 - LOCATION
    )
    :vars
    (
      ?auto_98528 - TRUCK
      ?auto_98529 - LOCATION
      ?auto_98530 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98528 ?auto_98529 ) ( IN-CITY ?auto_98529 ?auto_98530 ) ( IN-CITY ?auto_98524 ?auto_98530 ) ( not ( = ?auto_98524 ?auto_98529 ) ) ( OBJ-AT ?auto_98527 ?auto_98524 ) ( not ( = ?auto_98527 ?auto_98525 ) ) ( OBJ-AT ?auto_98525 ?auto_98529 ) ( OBJ-AT ?auto_98526 ?auto_98524 ) ( not ( = ?auto_98525 ?auto_98526 ) ) ( not ( = ?auto_98526 ?auto_98527 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98527 ?auto_98525 ?auto_98524 )
      ( DELIVER-3PKG-VERIFY ?auto_98525 ?auto_98526 ?auto_98527 ?auto_98524 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98547 - OBJ
      ?auto_98548 - OBJ
      ?auto_98549 - OBJ
      ?auto_98546 - LOCATION
    )
    :vars
    (
      ?auto_98550 - TRUCK
      ?auto_98552 - LOCATION
      ?auto_98553 - CITY
      ?auto_98551 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98550 ?auto_98552 ) ( IN-CITY ?auto_98552 ?auto_98553 ) ( IN-CITY ?auto_98546 ?auto_98553 ) ( not ( = ?auto_98546 ?auto_98552 ) ) ( OBJ-AT ?auto_98551 ?auto_98546 ) ( not ( = ?auto_98551 ?auto_98547 ) ) ( OBJ-AT ?auto_98547 ?auto_98552 ) ( OBJ-AT ?auto_98548 ?auto_98546 ) ( OBJ-AT ?auto_98549 ?auto_98546 ) ( not ( = ?auto_98547 ?auto_98548 ) ) ( not ( = ?auto_98547 ?auto_98549 ) ) ( not ( = ?auto_98548 ?auto_98549 ) ) ( not ( = ?auto_98548 ?auto_98551 ) ) ( not ( = ?auto_98549 ?auto_98551 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98551 ?auto_98547 ?auto_98546 )
      ( DELIVER-3PKG-VERIFY ?auto_98547 ?auto_98548 ?auto_98549 ?auto_98546 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98594 - OBJ
      ?auto_98595 - OBJ
      ?auto_98596 - OBJ
      ?auto_98597 - OBJ
      ?auto_98593 - LOCATION
    )
    :vars
    (
      ?auto_98598 - TRUCK
      ?auto_98599 - LOCATION
      ?auto_98600 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98598 ?auto_98599 ) ( IN-CITY ?auto_98599 ?auto_98600 ) ( IN-CITY ?auto_98593 ?auto_98600 ) ( not ( = ?auto_98593 ?auto_98599 ) ) ( OBJ-AT ?auto_98594 ?auto_98593 ) ( not ( = ?auto_98594 ?auto_98597 ) ) ( OBJ-AT ?auto_98597 ?auto_98599 ) ( OBJ-AT ?auto_98595 ?auto_98593 ) ( OBJ-AT ?auto_98596 ?auto_98593 ) ( not ( = ?auto_98594 ?auto_98595 ) ) ( not ( = ?auto_98594 ?auto_98596 ) ) ( not ( = ?auto_98595 ?auto_98596 ) ) ( not ( = ?auto_98595 ?auto_98597 ) ) ( not ( = ?auto_98596 ?auto_98597 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98594 ?auto_98597 ?auto_98593 )
      ( DELIVER-4PKG-VERIFY ?auto_98594 ?auto_98595 ?auto_98596 ?auto_98597 ?auto_98593 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98602 - OBJ
      ?auto_98603 - OBJ
      ?auto_98604 - OBJ
      ?auto_98605 - OBJ
      ?auto_98601 - LOCATION
    )
    :vars
    (
      ?auto_98606 - TRUCK
      ?auto_98607 - LOCATION
      ?auto_98608 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98606 ?auto_98607 ) ( IN-CITY ?auto_98607 ?auto_98608 ) ( IN-CITY ?auto_98601 ?auto_98608 ) ( not ( = ?auto_98601 ?auto_98607 ) ) ( OBJ-AT ?auto_98602 ?auto_98601 ) ( not ( = ?auto_98602 ?auto_98604 ) ) ( OBJ-AT ?auto_98604 ?auto_98607 ) ( OBJ-AT ?auto_98603 ?auto_98601 ) ( OBJ-AT ?auto_98605 ?auto_98601 ) ( not ( = ?auto_98602 ?auto_98603 ) ) ( not ( = ?auto_98602 ?auto_98605 ) ) ( not ( = ?auto_98603 ?auto_98604 ) ) ( not ( = ?auto_98603 ?auto_98605 ) ) ( not ( = ?auto_98604 ?auto_98605 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98602 ?auto_98604 ?auto_98601 )
      ( DELIVER-4PKG-VERIFY ?auto_98602 ?auto_98603 ?auto_98604 ?auto_98605 ?auto_98601 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98666 - OBJ
      ?auto_98667 - OBJ
      ?auto_98668 - OBJ
      ?auto_98669 - OBJ
      ?auto_98665 - LOCATION
    )
    :vars
    (
      ?auto_98670 - TRUCK
      ?auto_98671 - LOCATION
      ?auto_98672 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98670 ?auto_98671 ) ( IN-CITY ?auto_98671 ?auto_98672 ) ( IN-CITY ?auto_98665 ?auto_98672 ) ( not ( = ?auto_98665 ?auto_98671 ) ) ( OBJ-AT ?auto_98669 ?auto_98665 ) ( not ( = ?auto_98669 ?auto_98667 ) ) ( OBJ-AT ?auto_98667 ?auto_98671 ) ( OBJ-AT ?auto_98666 ?auto_98665 ) ( OBJ-AT ?auto_98668 ?auto_98665 ) ( not ( = ?auto_98666 ?auto_98667 ) ) ( not ( = ?auto_98666 ?auto_98668 ) ) ( not ( = ?auto_98666 ?auto_98669 ) ) ( not ( = ?auto_98667 ?auto_98668 ) ) ( not ( = ?auto_98668 ?auto_98669 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98669 ?auto_98667 ?auto_98665 )
      ( DELIVER-4PKG-VERIFY ?auto_98666 ?auto_98667 ?auto_98668 ?auto_98669 ?auto_98665 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98674 - OBJ
      ?auto_98675 - OBJ
      ?auto_98676 - OBJ
      ?auto_98677 - OBJ
      ?auto_98673 - LOCATION
    )
    :vars
    (
      ?auto_98678 - TRUCK
      ?auto_98679 - LOCATION
      ?auto_98680 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98678 ?auto_98679 ) ( IN-CITY ?auto_98679 ?auto_98680 ) ( IN-CITY ?auto_98673 ?auto_98680 ) ( not ( = ?auto_98673 ?auto_98679 ) ) ( OBJ-AT ?auto_98676 ?auto_98673 ) ( not ( = ?auto_98676 ?auto_98675 ) ) ( OBJ-AT ?auto_98675 ?auto_98679 ) ( OBJ-AT ?auto_98674 ?auto_98673 ) ( OBJ-AT ?auto_98677 ?auto_98673 ) ( not ( = ?auto_98674 ?auto_98675 ) ) ( not ( = ?auto_98674 ?auto_98676 ) ) ( not ( = ?auto_98674 ?auto_98677 ) ) ( not ( = ?auto_98675 ?auto_98677 ) ) ( not ( = ?auto_98676 ?auto_98677 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98676 ?auto_98675 ?auto_98673 )
      ( DELIVER-4PKG-VERIFY ?auto_98674 ?auto_98675 ?auto_98676 ?auto_98677 ?auto_98673 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98738 - OBJ
      ?auto_98739 - OBJ
      ?auto_98740 - OBJ
      ?auto_98741 - OBJ
      ?auto_98737 - LOCATION
    )
    :vars
    (
      ?auto_98742 - TRUCK
      ?auto_98743 - LOCATION
      ?auto_98744 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98742 ?auto_98743 ) ( IN-CITY ?auto_98743 ?auto_98744 ) ( IN-CITY ?auto_98737 ?auto_98744 ) ( not ( = ?auto_98737 ?auto_98743 ) ) ( OBJ-AT ?auto_98739 ?auto_98737 ) ( not ( = ?auto_98739 ?auto_98741 ) ) ( OBJ-AT ?auto_98741 ?auto_98743 ) ( OBJ-AT ?auto_98738 ?auto_98737 ) ( OBJ-AT ?auto_98740 ?auto_98737 ) ( not ( = ?auto_98738 ?auto_98739 ) ) ( not ( = ?auto_98738 ?auto_98740 ) ) ( not ( = ?auto_98738 ?auto_98741 ) ) ( not ( = ?auto_98739 ?auto_98740 ) ) ( not ( = ?auto_98740 ?auto_98741 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98739 ?auto_98741 ?auto_98737 )
      ( DELIVER-4PKG-VERIFY ?auto_98738 ?auto_98739 ?auto_98740 ?auto_98741 ?auto_98737 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98754 - OBJ
      ?auto_98755 - OBJ
      ?auto_98756 - OBJ
      ?auto_98757 - OBJ
      ?auto_98753 - LOCATION
    )
    :vars
    (
      ?auto_98758 - TRUCK
      ?auto_98759 - LOCATION
      ?auto_98760 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98758 ?auto_98759 ) ( IN-CITY ?auto_98759 ?auto_98760 ) ( IN-CITY ?auto_98753 ?auto_98760 ) ( not ( = ?auto_98753 ?auto_98759 ) ) ( OBJ-AT ?auto_98755 ?auto_98753 ) ( not ( = ?auto_98755 ?auto_98756 ) ) ( OBJ-AT ?auto_98756 ?auto_98759 ) ( OBJ-AT ?auto_98754 ?auto_98753 ) ( OBJ-AT ?auto_98757 ?auto_98753 ) ( not ( = ?auto_98754 ?auto_98755 ) ) ( not ( = ?auto_98754 ?auto_98756 ) ) ( not ( = ?auto_98754 ?auto_98757 ) ) ( not ( = ?auto_98755 ?auto_98757 ) ) ( not ( = ?auto_98756 ?auto_98757 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98755 ?auto_98756 ?auto_98753 )
      ( DELIVER-4PKG-VERIFY ?auto_98754 ?auto_98755 ?auto_98756 ?auto_98757 ?auto_98753 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98786 - OBJ
      ?auto_98787 - OBJ
      ?auto_98788 - OBJ
      ?auto_98789 - OBJ
      ?auto_98785 - LOCATION
    )
    :vars
    (
      ?auto_98790 - TRUCK
      ?auto_98792 - LOCATION
      ?auto_98793 - CITY
      ?auto_98791 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98790 ?auto_98792 ) ( IN-CITY ?auto_98792 ?auto_98793 ) ( IN-CITY ?auto_98785 ?auto_98793 ) ( not ( = ?auto_98785 ?auto_98792 ) ) ( OBJ-AT ?auto_98791 ?auto_98785 ) ( not ( = ?auto_98791 ?auto_98789 ) ) ( OBJ-AT ?auto_98789 ?auto_98792 ) ( OBJ-AT ?auto_98786 ?auto_98785 ) ( OBJ-AT ?auto_98787 ?auto_98785 ) ( OBJ-AT ?auto_98788 ?auto_98785 ) ( not ( = ?auto_98786 ?auto_98787 ) ) ( not ( = ?auto_98786 ?auto_98788 ) ) ( not ( = ?auto_98786 ?auto_98789 ) ) ( not ( = ?auto_98786 ?auto_98791 ) ) ( not ( = ?auto_98787 ?auto_98788 ) ) ( not ( = ?auto_98787 ?auto_98789 ) ) ( not ( = ?auto_98787 ?auto_98791 ) ) ( not ( = ?auto_98788 ?auto_98789 ) ) ( not ( = ?auto_98788 ?auto_98791 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98791 ?auto_98789 ?auto_98785 )
      ( DELIVER-4PKG-VERIFY ?auto_98786 ?auto_98787 ?auto_98788 ?auto_98789 ?auto_98785 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98803 - OBJ
      ?auto_98804 - OBJ
      ?auto_98805 - OBJ
      ?auto_98806 - OBJ
      ?auto_98802 - LOCATION
    )
    :vars
    (
      ?auto_98807 - TRUCK
      ?auto_98809 - LOCATION
      ?auto_98810 - CITY
      ?auto_98808 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98807 ?auto_98809 ) ( IN-CITY ?auto_98809 ?auto_98810 ) ( IN-CITY ?auto_98802 ?auto_98810 ) ( not ( = ?auto_98802 ?auto_98809 ) ) ( OBJ-AT ?auto_98808 ?auto_98802 ) ( not ( = ?auto_98808 ?auto_98805 ) ) ( OBJ-AT ?auto_98805 ?auto_98809 ) ( OBJ-AT ?auto_98803 ?auto_98802 ) ( OBJ-AT ?auto_98804 ?auto_98802 ) ( OBJ-AT ?auto_98806 ?auto_98802 ) ( not ( = ?auto_98803 ?auto_98804 ) ) ( not ( = ?auto_98803 ?auto_98805 ) ) ( not ( = ?auto_98803 ?auto_98806 ) ) ( not ( = ?auto_98803 ?auto_98808 ) ) ( not ( = ?auto_98804 ?auto_98805 ) ) ( not ( = ?auto_98804 ?auto_98806 ) ) ( not ( = ?auto_98804 ?auto_98808 ) ) ( not ( = ?auto_98805 ?auto_98806 ) ) ( not ( = ?auto_98806 ?auto_98808 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98808 ?auto_98805 ?auto_98802 )
      ( DELIVER-4PKG-VERIFY ?auto_98803 ?auto_98804 ?auto_98805 ?auto_98806 ?auto_98802 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98853 - OBJ
      ?auto_98854 - OBJ
      ?auto_98855 - OBJ
      ?auto_98856 - OBJ
      ?auto_98852 - LOCATION
    )
    :vars
    (
      ?auto_98857 - TRUCK
      ?auto_98859 - LOCATION
      ?auto_98860 - CITY
      ?auto_98858 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98857 ?auto_98859 ) ( IN-CITY ?auto_98859 ?auto_98860 ) ( IN-CITY ?auto_98852 ?auto_98860 ) ( not ( = ?auto_98852 ?auto_98859 ) ) ( OBJ-AT ?auto_98858 ?auto_98852 ) ( not ( = ?auto_98858 ?auto_98854 ) ) ( OBJ-AT ?auto_98854 ?auto_98859 ) ( OBJ-AT ?auto_98853 ?auto_98852 ) ( OBJ-AT ?auto_98855 ?auto_98852 ) ( OBJ-AT ?auto_98856 ?auto_98852 ) ( not ( = ?auto_98853 ?auto_98854 ) ) ( not ( = ?auto_98853 ?auto_98855 ) ) ( not ( = ?auto_98853 ?auto_98856 ) ) ( not ( = ?auto_98853 ?auto_98858 ) ) ( not ( = ?auto_98854 ?auto_98855 ) ) ( not ( = ?auto_98854 ?auto_98856 ) ) ( not ( = ?auto_98855 ?auto_98856 ) ) ( not ( = ?auto_98855 ?auto_98858 ) ) ( not ( = ?auto_98856 ?auto_98858 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98858 ?auto_98854 ?auto_98852 )
      ( DELIVER-4PKG-VERIFY ?auto_98853 ?auto_98854 ?auto_98855 ?auto_98856 ?auto_98852 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98897 - OBJ
      ?auto_98898 - OBJ
      ?auto_98899 - OBJ
      ?auto_98900 - OBJ
      ?auto_98896 - LOCATION
    )
    :vars
    (
      ?auto_98901 - TRUCK
      ?auto_98902 - LOCATION
      ?auto_98903 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98901 ?auto_98902 ) ( IN-CITY ?auto_98902 ?auto_98903 ) ( IN-CITY ?auto_98896 ?auto_98903 ) ( not ( = ?auto_98896 ?auto_98902 ) ) ( OBJ-AT ?auto_98900 ?auto_98896 ) ( not ( = ?auto_98900 ?auto_98897 ) ) ( OBJ-AT ?auto_98897 ?auto_98902 ) ( OBJ-AT ?auto_98898 ?auto_98896 ) ( OBJ-AT ?auto_98899 ?auto_98896 ) ( not ( = ?auto_98897 ?auto_98898 ) ) ( not ( = ?auto_98897 ?auto_98899 ) ) ( not ( = ?auto_98898 ?auto_98899 ) ) ( not ( = ?auto_98898 ?auto_98900 ) ) ( not ( = ?auto_98899 ?auto_98900 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98900 ?auto_98897 ?auto_98896 )
      ( DELIVER-4PKG-VERIFY ?auto_98897 ?auto_98898 ?auto_98899 ?auto_98900 ?auto_98896 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98929 - OBJ
      ?auto_98930 - OBJ
      ?auto_98931 - OBJ
      ?auto_98932 - OBJ
      ?auto_98928 - LOCATION
    )
    :vars
    (
      ?auto_98933 - TRUCK
      ?auto_98934 - LOCATION
      ?auto_98935 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98933 ?auto_98934 ) ( IN-CITY ?auto_98934 ?auto_98935 ) ( IN-CITY ?auto_98928 ?auto_98935 ) ( not ( = ?auto_98928 ?auto_98934 ) ) ( OBJ-AT ?auto_98930 ?auto_98928 ) ( not ( = ?auto_98930 ?auto_98929 ) ) ( OBJ-AT ?auto_98929 ?auto_98934 ) ( OBJ-AT ?auto_98931 ?auto_98928 ) ( OBJ-AT ?auto_98932 ?auto_98928 ) ( not ( = ?auto_98929 ?auto_98931 ) ) ( not ( = ?auto_98929 ?auto_98932 ) ) ( not ( = ?auto_98930 ?auto_98931 ) ) ( not ( = ?auto_98930 ?auto_98932 ) ) ( not ( = ?auto_98931 ?auto_98932 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98930 ?auto_98929 ?auto_98928 )
      ( DELIVER-4PKG-VERIFY ?auto_98929 ?auto_98930 ?auto_98931 ?auto_98932 ?auto_98928 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99001 - OBJ
      ?auto_99002 - OBJ
      ?auto_99003 - OBJ
      ?auto_99004 - OBJ
      ?auto_99000 - LOCATION
    )
    :vars
    (
      ?auto_99005 - TRUCK
      ?auto_99007 - LOCATION
      ?auto_99008 - CITY
      ?auto_99006 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99005 ?auto_99007 ) ( IN-CITY ?auto_99007 ?auto_99008 ) ( IN-CITY ?auto_99000 ?auto_99008 ) ( not ( = ?auto_99000 ?auto_99007 ) ) ( OBJ-AT ?auto_99006 ?auto_99000 ) ( not ( = ?auto_99006 ?auto_99001 ) ) ( OBJ-AT ?auto_99001 ?auto_99007 ) ( OBJ-AT ?auto_99002 ?auto_99000 ) ( OBJ-AT ?auto_99003 ?auto_99000 ) ( OBJ-AT ?auto_99004 ?auto_99000 ) ( not ( = ?auto_99001 ?auto_99002 ) ) ( not ( = ?auto_99001 ?auto_99003 ) ) ( not ( = ?auto_99001 ?auto_99004 ) ) ( not ( = ?auto_99002 ?auto_99003 ) ) ( not ( = ?auto_99002 ?auto_99004 ) ) ( not ( = ?auto_99002 ?auto_99006 ) ) ( not ( = ?auto_99003 ?auto_99004 ) ) ( not ( = ?auto_99003 ?auto_99006 ) ) ( not ( = ?auto_99004 ?auto_99006 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99006 ?auto_99001 ?auto_99000 )
      ( DELIVER-4PKG-VERIFY ?auto_99001 ?auto_99002 ?auto_99003 ?auto_99004 ?auto_99000 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99152 - OBJ
      ?auto_99153 - OBJ
      ?auto_99154 - OBJ
      ?auto_99151 - LOCATION
    )
    :vars
    (
      ?auto_99157 - LOCATION
      ?auto_99155 - CITY
      ?auto_99156 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99157 ?auto_99155 ) ( IN-CITY ?auto_99151 ?auto_99155 ) ( not ( = ?auto_99151 ?auto_99157 ) ) ( OBJ-AT ?auto_99153 ?auto_99151 ) ( not ( = ?auto_99153 ?auto_99154 ) ) ( OBJ-AT ?auto_99154 ?auto_99157 ) ( TRUCK-AT ?auto_99156 ?auto_99151 ) ( OBJ-AT ?auto_99152 ?auto_99151 ) ( not ( = ?auto_99152 ?auto_99153 ) ) ( not ( = ?auto_99152 ?auto_99154 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99153 ?auto_99154 ?auto_99151 )
      ( DELIVER-3PKG-VERIFY ?auto_99152 ?auto_99153 ?auto_99154 ?auto_99151 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99185 - OBJ
      ?auto_99186 - OBJ
      ?auto_99187 - OBJ
      ?auto_99184 - LOCATION
    )
    :vars
    (
      ?auto_99191 - LOCATION
      ?auto_99189 - CITY
      ?auto_99188 - OBJ
      ?auto_99190 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99191 ?auto_99189 ) ( IN-CITY ?auto_99184 ?auto_99189 ) ( not ( = ?auto_99184 ?auto_99191 ) ) ( OBJ-AT ?auto_99188 ?auto_99184 ) ( not ( = ?auto_99188 ?auto_99187 ) ) ( OBJ-AT ?auto_99187 ?auto_99191 ) ( TRUCK-AT ?auto_99190 ?auto_99184 ) ( OBJ-AT ?auto_99185 ?auto_99184 ) ( OBJ-AT ?auto_99186 ?auto_99184 ) ( not ( = ?auto_99185 ?auto_99186 ) ) ( not ( = ?auto_99185 ?auto_99187 ) ) ( not ( = ?auto_99185 ?auto_99188 ) ) ( not ( = ?auto_99186 ?auto_99187 ) ) ( not ( = ?auto_99186 ?auto_99188 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99188 ?auto_99187 ?auto_99184 )
      ( DELIVER-3PKG-VERIFY ?auto_99185 ?auto_99186 ?auto_99187 ?auto_99184 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99197 - OBJ
      ?auto_99198 - OBJ
      ?auto_99199 - OBJ
      ?auto_99196 - LOCATION
    )
    :vars
    (
      ?auto_99203 - LOCATION
      ?auto_99201 - CITY
      ?auto_99200 - OBJ
      ?auto_99202 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99203 ?auto_99201 ) ( IN-CITY ?auto_99196 ?auto_99201 ) ( not ( = ?auto_99196 ?auto_99203 ) ) ( OBJ-AT ?auto_99200 ?auto_99196 ) ( not ( = ?auto_99200 ?auto_99198 ) ) ( OBJ-AT ?auto_99198 ?auto_99203 ) ( TRUCK-AT ?auto_99202 ?auto_99196 ) ( OBJ-AT ?auto_99197 ?auto_99196 ) ( OBJ-AT ?auto_99199 ?auto_99196 ) ( not ( = ?auto_99197 ?auto_99198 ) ) ( not ( = ?auto_99197 ?auto_99199 ) ) ( not ( = ?auto_99197 ?auto_99200 ) ) ( not ( = ?auto_99198 ?auto_99199 ) ) ( not ( = ?auto_99199 ?auto_99200 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99200 ?auto_99198 ?auto_99196 )
      ( DELIVER-3PKG-VERIFY ?auto_99197 ?auto_99198 ?auto_99199 ?auto_99196 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99213 - OBJ
      ?auto_99214 - OBJ
      ?auto_99215 - OBJ
      ?auto_99212 - LOCATION
    )
    :vars
    (
      ?auto_99218 - LOCATION
      ?auto_99216 - CITY
      ?auto_99217 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99218 ?auto_99216 ) ( IN-CITY ?auto_99212 ?auto_99216 ) ( not ( = ?auto_99212 ?auto_99218 ) ) ( OBJ-AT ?auto_99214 ?auto_99212 ) ( not ( = ?auto_99214 ?auto_99213 ) ) ( OBJ-AT ?auto_99213 ?auto_99218 ) ( TRUCK-AT ?auto_99217 ?auto_99212 ) ( OBJ-AT ?auto_99215 ?auto_99212 ) ( not ( = ?auto_99213 ?auto_99215 ) ) ( not ( = ?auto_99214 ?auto_99215 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99214 ?auto_99213 ?auto_99212 )
      ( DELIVER-3PKG-VERIFY ?auto_99213 ?auto_99214 ?auto_99215 ?auto_99212 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99235 - OBJ
      ?auto_99236 - OBJ
      ?auto_99237 - OBJ
      ?auto_99234 - LOCATION
    )
    :vars
    (
      ?auto_99241 - LOCATION
      ?auto_99239 - CITY
      ?auto_99238 - OBJ
      ?auto_99240 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99241 ?auto_99239 ) ( IN-CITY ?auto_99234 ?auto_99239 ) ( not ( = ?auto_99234 ?auto_99241 ) ) ( OBJ-AT ?auto_99238 ?auto_99234 ) ( not ( = ?auto_99238 ?auto_99235 ) ) ( OBJ-AT ?auto_99235 ?auto_99241 ) ( TRUCK-AT ?auto_99240 ?auto_99234 ) ( OBJ-AT ?auto_99236 ?auto_99234 ) ( OBJ-AT ?auto_99237 ?auto_99234 ) ( not ( = ?auto_99235 ?auto_99236 ) ) ( not ( = ?auto_99235 ?auto_99237 ) ) ( not ( = ?auto_99236 ?auto_99237 ) ) ( not ( = ?auto_99236 ?auto_99238 ) ) ( not ( = ?auto_99237 ?auto_99238 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99238 ?auto_99235 ?auto_99234 )
      ( DELIVER-3PKG-VERIFY ?auto_99235 ?auto_99236 ?auto_99237 ?auto_99234 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99274 - OBJ
      ?auto_99275 - OBJ
      ?auto_99276 - OBJ
      ?auto_99277 - OBJ
      ?auto_99273 - LOCATION
    )
    :vars
    (
      ?auto_99280 - LOCATION
      ?auto_99278 - CITY
      ?auto_99279 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99280 ?auto_99278 ) ( IN-CITY ?auto_99273 ?auto_99278 ) ( not ( = ?auto_99273 ?auto_99280 ) ) ( OBJ-AT ?auto_99274 ?auto_99273 ) ( not ( = ?auto_99274 ?auto_99277 ) ) ( OBJ-AT ?auto_99277 ?auto_99280 ) ( TRUCK-AT ?auto_99279 ?auto_99273 ) ( OBJ-AT ?auto_99275 ?auto_99273 ) ( OBJ-AT ?auto_99276 ?auto_99273 ) ( not ( = ?auto_99274 ?auto_99275 ) ) ( not ( = ?auto_99274 ?auto_99276 ) ) ( not ( = ?auto_99275 ?auto_99276 ) ) ( not ( = ?auto_99275 ?auto_99277 ) ) ( not ( = ?auto_99276 ?auto_99277 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99274 ?auto_99277 ?auto_99273 )
      ( DELIVER-4PKG-VERIFY ?auto_99274 ?auto_99275 ?auto_99276 ?auto_99277 ?auto_99273 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99290 - OBJ
      ?auto_99291 - OBJ
      ?auto_99292 - OBJ
      ?auto_99293 - OBJ
      ?auto_99289 - LOCATION
    )
    :vars
    (
      ?auto_99296 - LOCATION
      ?auto_99294 - CITY
      ?auto_99295 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99296 ?auto_99294 ) ( IN-CITY ?auto_99289 ?auto_99294 ) ( not ( = ?auto_99289 ?auto_99296 ) ) ( OBJ-AT ?auto_99290 ?auto_99289 ) ( not ( = ?auto_99290 ?auto_99292 ) ) ( OBJ-AT ?auto_99292 ?auto_99296 ) ( TRUCK-AT ?auto_99295 ?auto_99289 ) ( OBJ-AT ?auto_99291 ?auto_99289 ) ( OBJ-AT ?auto_99293 ?auto_99289 ) ( not ( = ?auto_99290 ?auto_99291 ) ) ( not ( = ?auto_99290 ?auto_99293 ) ) ( not ( = ?auto_99291 ?auto_99292 ) ) ( not ( = ?auto_99291 ?auto_99293 ) ) ( not ( = ?auto_99292 ?auto_99293 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99290 ?auto_99292 ?auto_99289 )
      ( DELIVER-4PKG-VERIFY ?auto_99290 ?auto_99291 ?auto_99292 ?auto_99293 ?auto_99289 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99354 - OBJ
      ?auto_99355 - OBJ
      ?auto_99356 - OBJ
      ?auto_99357 - OBJ
      ?auto_99353 - LOCATION
    )
    :vars
    (
      ?auto_99360 - LOCATION
      ?auto_99358 - CITY
      ?auto_99359 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99360 ?auto_99358 ) ( IN-CITY ?auto_99353 ?auto_99358 ) ( not ( = ?auto_99353 ?auto_99360 ) ) ( OBJ-AT ?auto_99357 ?auto_99353 ) ( not ( = ?auto_99357 ?auto_99355 ) ) ( OBJ-AT ?auto_99355 ?auto_99360 ) ( TRUCK-AT ?auto_99359 ?auto_99353 ) ( OBJ-AT ?auto_99354 ?auto_99353 ) ( OBJ-AT ?auto_99356 ?auto_99353 ) ( not ( = ?auto_99354 ?auto_99355 ) ) ( not ( = ?auto_99354 ?auto_99356 ) ) ( not ( = ?auto_99354 ?auto_99357 ) ) ( not ( = ?auto_99355 ?auto_99356 ) ) ( not ( = ?auto_99356 ?auto_99357 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99357 ?auto_99355 ?auto_99353 )
      ( DELIVER-4PKG-VERIFY ?auto_99354 ?auto_99355 ?auto_99356 ?auto_99357 ?auto_99353 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99386 - OBJ
      ?auto_99387 - OBJ
      ?auto_99388 - OBJ
      ?auto_99389 - OBJ
      ?auto_99385 - LOCATION
    )
    :vars
    (
      ?auto_99392 - LOCATION
      ?auto_99390 - CITY
      ?auto_99391 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99392 ?auto_99390 ) ( IN-CITY ?auto_99385 ?auto_99390 ) ( not ( = ?auto_99385 ?auto_99392 ) ) ( OBJ-AT ?auto_99386 ?auto_99385 ) ( not ( = ?auto_99386 ?auto_99387 ) ) ( OBJ-AT ?auto_99387 ?auto_99392 ) ( TRUCK-AT ?auto_99391 ?auto_99385 ) ( OBJ-AT ?auto_99388 ?auto_99385 ) ( OBJ-AT ?auto_99389 ?auto_99385 ) ( not ( = ?auto_99386 ?auto_99388 ) ) ( not ( = ?auto_99386 ?auto_99389 ) ) ( not ( = ?auto_99387 ?auto_99388 ) ) ( not ( = ?auto_99387 ?auto_99389 ) ) ( not ( = ?auto_99388 ?auto_99389 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99386 ?auto_99387 ?auto_99385 )
      ( DELIVER-4PKG-VERIFY ?auto_99386 ?auto_99387 ?auto_99388 ?auto_99389 ?auto_99385 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99426 - OBJ
      ?auto_99427 - OBJ
      ?auto_99428 - OBJ
      ?auto_99429 - OBJ
      ?auto_99425 - LOCATION
    )
    :vars
    (
      ?auto_99432 - LOCATION
      ?auto_99430 - CITY
      ?auto_99431 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99432 ?auto_99430 ) ( IN-CITY ?auto_99425 ?auto_99430 ) ( not ( = ?auto_99425 ?auto_99432 ) ) ( OBJ-AT ?auto_99427 ?auto_99425 ) ( not ( = ?auto_99427 ?auto_99429 ) ) ( OBJ-AT ?auto_99429 ?auto_99432 ) ( TRUCK-AT ?auto_99431 ?auto_99425 ) ( OBJ-AT ?auto_99426 ?auto_99425 ) ( OBJ-AT ?auto_99428 ?auto_99425 ) ( not ( = ?auto_99426 ?auto_99427 ) ) ( not ( = ?auto_99426 ?auto_99428 ) ) ( not ( = ?auto_99426 ?auto_99429 ) ) ( not ( = ?auto_99427 ?auto_99428 ) ) ( not ( = ?auto_99428 ?auto_99429 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99427 ?auto_99429 ?auto_99425 )
      ( DELIVER-4PKG-VERIFY ?auto_99426 ?auto_99427 ?auto_99428 ?auto_99429 ?auto_99425 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99442 - OBJ
      ?auto_99443 - OBJ
      ?auto_99444 - OBJ
      ?auto_99445 - OBJ
      ?auto_99441 - LOCATION
    )
    :vars
    (
      ?auto_99448 - LOCATION
      ?auto_99446 - CITY
      ?auto_99447 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99448 ?auto_99446 ) ( IN-CITY ?auto_99441 ?auto_99446 ) ( not ( = ?auto_99441 ?auto_99448 ) ) ( OBJ-AT ?auto_99443 ?auto_99441 ) ( not ( = ?auto_99443 ?auto_99444 ) ) ( OBJ-AT ?auto_99444 ?auto_99448 ) ( TRUCK-AT ?auto_99447 ?auto_99441 ) ( OBJ-AT ?auto_99442 ?auto_99441 ) ( OBJ-AT ?auto_99445 ?auto_99441 ) ( not ( = ?auto_99442 ?auto_99443 ) ) ( not ( = ?auto_99442 ?auto_99444 ) ) ( not ( = ?auto_99442 ?auto_99445 ) ) ( not ( = ?auto_99443 ?auto_99445 ) ) ( not ( = ?auto_99444 ?auto_99445 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99443 ?auto_99444 ?auto_99441 )
      ( DELIVER-4PKG-VERIFY ?auto_99442 ?auto_99443 ?auto_99444 ?auto_99445 ?auto_99441 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99474 - OBJ
      ?auto_99475 - OBJ
      ?auto_99476 - OBJ
      ?auto_99477 - OBJ
      ?auto_99473 - LOCATION
    )
    :vars
    (
      ?auto_99481 - LOCATION
      ?auto_99479 - CITY
      ?auto_99478 - OBJ
      ?auto_99480 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99481 ?auto_99479 ) ( IN-CITY ?auto_99473 ?auto_99479 ) ( not ( = ?auto_99473 ?auto_99481 ) ) ( OBJ-AT ?auto_99478 ?auto_99473 ) ( not ( = ?auto_99478 ?auto_99477 ) ) ( OBJ-AT ?auto_99477 ?auto_99481 ) ( TRUCK-AT ?auto_99480 ?auto_99473 ) ( OBJ-AT ?auto_99474 ?auto_99473 ) ( OBJ-AT ?auto_99475 ?auto_99473 ) ( OBJ-AT ?auto_99476 ?auto_99473 ) ( not ( = ?auto_99474 ?auto_99475 ) ) ( not ( = ?auto_99474 ?auto_99476 ) ) ( not ( = ?auto_99474 ?auto_99477 ) ) ( not ( = ?auto_99474 ?auto_99478 ) ) ( not ( = ?auto_99475 ?auto_99476 ) ) ( not ( = ?auto_99475 ?auto_99477 ) ) ( not ( = ?auto_99475 ?auto_99478 ) ) ( not ( = ?auto_99476 ?auto_99477 ) ) ( not ( = ?auto_99476 ?auto_99478 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99478 ?auto_99477 ?auto_99473 )
      ( DELIVER-4PKG-VERIFY ?auto_99474 ?auto_99475 ?auto_99476 ?auto_99477 ?auto_99473 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99491 - OBJ
      ?auto_99492 - OBJ
      ?auto_99493 - OBJ
      ?auto_99494 - OBJ
      ?auto_99490 - LOCATION
    )
    :vars
    (
      ?auto_99498 - LOCATION
      ?auto_99496 - CITY
      ?auto_99495 - OBJ
      ?auto_99497 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99498 ?auto_99496 ) ( IN-CITY ?auto_99490 ?auto_99496 ) ( not ( = ?auto_99490 ?auto_99498 ) ) ( OBJ-AT ?auto_99495 ?auto_99490 ) ( not ( = ?auto_99495 ?auto_99493 ) ) ( OBJ-AT ?auto_99493 ?auto_99498 ) ( TRUCK-AT ?auto_99497 ?auto_99490 ) ( OBJ-AT ?auto_99491 ?auto_99490 ) ( OBJ-AT ?auto_99492 ?auto_99490 ) ( OBJ-AT ?auto_99494 ?auto_99490 ) ( not ( = ?auto_99491 ?auto_99492 ) ) ( not ( = ?auto_99491 ?auto_99493 ) ) ( not ( = ?auto_99491 ?auto_99494 ) ) ( not ( = ?auto_99491 ?auto_99495 ) ) ( not ( = ?auto_99492 ?auto_99493 ) ) ( not ( = ?auto_99492 ?auto_99494 ) ) ( not ( = ?auto_99492 ?auto_99495 ) ) ( not ( = ?auto_99493 ?auto_99494 ) ) ( not ( = ?auto_99494 ?auto_99495 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99495 ?auto_99493 ?auto_99490 )
      ( DELIVER-4PKG-VERIFY ?auto_99491 ?auto_99492 ?auto_99493 ?auto_99494 ?auto_99490 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99541 - OBJ
      ?auto_99542 - OBJ
      ?auto_99543 - OBJ
      ?auto_99544 - OBJ
      ?auto_99540 - LOCATION
    )
    :vars
    (
      ?auto_99548 - LOCATION
      ?auto_99546 - CITY
      ?auto_99545 - OBJ
      ?auto_99547 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99548 ?auto_99546 ) ( IN-CITY ?auto_99540 ?auto_99546 ) ( not ( = ?auto_99540 ?auto_99548 ) ) ( OBJ-AT ?auto_99545 ?auto_99540 ) ( not ( = ?auto_99545 ?auto_99542 ) ) ( OBJ-AT ?auto_99542 ?auto_99548 ) ( TRUCK-AT ?auto_99547 ?auto_99540 ) ( OBJ-AT ?auto_99541 ?auto_99540 ) ( OBJ-AT ?auto_99543 ?auto_99540 ) ( OBJ-AT ?auto_99544 ?auto_99540 ) ( not ( = ?auto_99541 ?auto_99542 ) ) ( not ( = ?auto_99541 ?auto_99543 ) ) ( not ( = ?auto_99541 ?auto_99544 ) ) ( not ( = ?auto_99541 ?auto_99545 ) ) ( not ( = ?auto_99542 ?auto_99543 ) ) ( not ( = ?auto_99542 ?auto_99544 ) ) ( not ( = ?auto_99543 ?auto_99544 ) ) ( not ( = ?auto_99543 ?auto_99545 ) ) ( not ( = ?auto_99544 ?auto_99545 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99545 ?auto_99542 ?auto_99540 )
      ( DELIVER-4PKG-VERIFY ?auto_99541 ?auto_99542 ?auto_99543 ?auto_99544 ?auto_99540 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99593 - OBJ
      ?auto_99594 - OBJ
      ?auto_99595 - OBJ
      ?auto_99596 - OBJ
      ?auto_99592 - LOCATION
    )
    :vars
    (
      ?auto_99599 - LOCATION
      ?auto_99597 - CITY
      ?auto_99598 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99599 ?auto_99597 ) ( IN-CITY ?auto_99592 ?auto_99597 ) ( not ( = ?auto_99592 ?auto_99599 ) ) ( OBJ-AT ?auto_99594 ?auto_99592 ) ( not ( = ?auto_99594 ?auto_99593 ) ) ( OBJ-AT ?auto_99593 ?auto_99599 ) ( TRUCK-AT ?auto_99598 ?auto_99592 ) ( OBJ-AT ?auto_99595 ?auto_99592 ) ( OBJ-AT ?auto_99596 ?auto_99592 ) ( not ( = ?auto_99593 ?auto_99595 ) ) ( not ( = ?auto_99593 ?auto_99596 ) ) ( not ( = ?auto_99594 ?auto_99595 ) ) ( not ( = ?auto_99594 ?auto_99596 ) ) ( not ( = ?auto_99595 ?auto_99596 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99594 ?auto_99593 ?auto_99592 )
      ( DELIVER-4PKG-VERIFY ?auto_99593 ?auto_99594 ?auto_99595 ?auto_99596 ?auto_99592 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99681 - OBJ
      ?auto_99682 - OBJ
      ?auto_99683 - OBJ
      ?auto_99684 - OBJ
      ?auto_99680 - LOCATION
    )
    :vars
    (
      ?auto_99687 - LOCATION
      ?auto_99685 - CITY
      ?auto_99686 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99687 ?auto_99685 ) ( IN-CITY ?auto_99680 ?auto_99685 ) ( not ( = ?auto_99680 ?auto_99687 ) ) ( OBJ-AT ?auto_99684 ?auto_99680 ) ( not ( = ?auto_99684 ?auto_99681 ) ) ( OBJ-AT ?auto_99681 ?auto_99687 ) ( TRUCK-AT ?auto_99686 ?auto_99680 ) ( OBJ-AT ?auto_99682 ?auto_99680 ) ( OBJ-AT ?auto_99683 ?auto_99680 ) ( not ( = ?auto_99681 ?auto_99682 ) ) ( not ( = ?auto_99681 ?auto_99683 ) ) ( not ( = ?auto_99682 ?auto_99683 ) ) ( not ( = ?auto_99682 ?auto_99684 ) ) ( not ( = ?auto_99683 ?auto_99684 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99684 ?auto_99681 ?auto_99680 )
      ( DELIVER-4PKG-VERIFY ?auto_99681 ?auto_99682 ?auto_99683 ?auto_99684 ?auto_99680 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99689 - OBJ
      ?auto_99690 - OBJ
      ?auto_99691 - OBJ
      ?auto_99692 - OBJ
      ?auto_99688 - LOCATION
    )
    :vars
    (
      ?auto_99696 - LOCATION
      ?auto_99694 - CITY
      ?auto_99693 - OBJ
      ?auto_99695 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99696 ?auto_99694 ) ( IN-CITY ?auto_99688 ?auto_99694 ) ( not ( = ?auto_99688 ?auto_99696 ) ) ( OBJ-AT ?auto_99693 ?auto_99688 ) ( not ( = ?auto_99693 ?auto_99689 ) ) ( OBJ-AT ?auto_99689 ?auto_99696 ) ( TRUCK-AT ?auto_99695 ?auto_99688 ) ( OBJ-AT ?auto_99690 ?auto_99688 ) ( OBJ-AT ?auto_99691 ?auto_99688 ) ( OBJ-AT ?auto_99692 ?auto_99688 ) ( not ( = ?auto_99689 ?auto_99690 ) ) ( not ( = ?auto_99689 ?auto_99691 ) ) ( not ( = ?auto_99689 ?auto_99692 ) ) ( not ( = ?auto_99690 ?auto_99691 ) ) ( not ( = ?auto_99690 ?auto_99692 ) ) ( not ( = ?auto_99690 ?auto_99693 ) ) ( not ( = ?auto_99691 ?auto_99692 ) ) ( not ( = ?auto_99691 ?auto_99693 ) ) ( not ( = ?auto_99692 ?auto_99693 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99693 ?auto_99689 ?auto_99688 )
      ( DELIVER-4PKG-VERIFY ?auto_99689 ?auto_99690 ?auto_99691 ?auto_99692 ?auto_99688 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99852 - OBJ
      ?auto_99853 - OBJ
      ?auto_99854 - OBJ
      ?auto_99851 - LOCATION
    )
    :vars
    (
      ?auto_99855 - LOCATION
      ?auto_99856 - CITY
      ?auto_99857 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99855 ?auto_99856 ) ( IN-CITY ?auto_99851 ?auto_99856 ) ( not ( = ?auto_99851 ?auto_99855 ) ) ( OBJ-AT ?auto_99852 ?auto_99851 ) ( not ( = ?auto_99852 ?auto_99853 ) ) ( OBJ-AT ?auto_99853 ?auto_99855 ) ( TRUCK-AT ?auto_99857 ?auto_99851 ) ( OBJ-AT ?auto_99854 ?auto_99851 ) ( not ( = ?auto_99852 ?auto_99854 ) ) ( not ( = ?auto_99853 ?auto_99854 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99852 ?auto_99853 ?auto_99851 )
      ( DELIVER-3PKG-VERIFY ?auto_99852 ?auto_99853 ?auto_99854 ?auto_99851 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_100542 - OBJ
      ?auto_100543 - OBJ
      ?auto_100544 - OBJ
      ?auto_100541 - LOCATION
    )
    :vars
    (
      ?auto_100546 - TRUCK
      ?auto_100545 - LOCATION
      ?auto_100547 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_100546 ?auto_100545 ) ( IN-CITY ?auto_100545 ?auto_100547 ) ( IN-CITY ?auto_100541 ?auto_100547 ) ( not ( = ?auto_100541 ?auto_100545 ) ) ( OBJ-AT ?auto_100542 ?auto_100541 ) ( not ( = ?auto_100542 ?auto_100544 ) ) ( OBJ-AT ?auto_100544 ?auto_100545 ) ( OBJ-AT ?auto_100543 ?auto_100541 ) ( not ( = ?auto_100542 ?auto_100543 ) ) ( not ( = ?auto_100543 ?auto_100544 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_100542 ?auto_100544 ?auto_100541 )
      ( DELIVER-3PKG-VERIFY ?auto_100542 ?auto_100543 ?auto_100544 ?auto_100541 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_109561 - OBJ
      ?auto_109562 - OBJ
      ?auto_109563 - OBJ
      ?auto_109560 - LOCATION
    )
    :vars
    (
      ?auto_109565 - TRUCK
      ?auto_109566 - LOCATION
      ?auto_109564 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_109565 ?auto_109566 ) ( IN-CITY ?auto_109566 ?auto_109564 ) ( IN-CITY ?auto_109560 ?auto_109564 ) ( not ( = ?auto_109560 ?auto_109566 ) ) ( OBJ-AT ?auto_109563 ?auto_109560 ) ( not ( = ?auto_109563 ?auto_109562 ) ) ( OBJ-AT ?auto_109562 ?auto_109566 ) ( OBJ-AT ?auto_109561 ?auto_109560 ) ( not ( = ?auto_109561 ?auto_109562 ) ) ( not ( = ?auto_109561 ?auto_109563 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_109563 ?auto_109562 ?auto_109560 )
      ( DELIVER-3PKG-VERIFY ?auto_109561 ?auto_109562 ?auto_109563 ?auto_109560 ) )
  )

)

