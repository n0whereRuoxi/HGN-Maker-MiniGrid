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
    ( ( !UNLOAD-TRUCK ?auto_95062 ?auto_95063 ?auto_95061 ) )
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
      ( DELIVER-1PKG ?auto_95080 ?auto_95079 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95106 - OBJ
      ?auto_95105 - LOCATION
    )
    :vars
    (
      ?auto_95107 - TRUCK
      ?auto_95109 - LOCATION
      ?auto_95108 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95107 ?auto_95109 ) ( IN-CITY ?auto_95109 ?auto_95108 ) ( IN-CITY ?auto_95105 ?auto_95108 ) ( not ( = ?auto_95105 ?auto_95109 ) ) ( OBJ-AT ?auto_95106 ?auto_95109 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_95106 ?auto_95107 ?auto_95109 )
      ( DELIVER-1PKG ?auto_95106 ?auto_95105 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95132 - OBJ
      ?auto_95131 - LOCATION
    )
    :vars
    (
      ?auto_95134 - LOCATION
      ?auto_95133 - CITY
      ?auto_95135 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95134 ?auto_95133 ) ( IN-CITY ?auto_95131 ?auto_95133 ) ( not ( = ?auto_95131 ?auto_95134 ) ) ( OBJ-AT ?auto_95132 ?auto_95134 ) ( TRUCK-AT ?auto_95135 ?auto_95131 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_95135 ?auto_95131 ?auto_95134 ?auto_95133 )
      ( DELIVER-1PKG ?auto_95132 ?auto_95131 ) )
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
    ( ( DELIVER-1PKG ?auto_95276 ?auto_95274 ) )
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
    ( ( DELIVER-1PKG ?auto_95279 ?auto_95278 ) )
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
    ( ( DELIVER-1PKG ?auto_95289 ?auto_95286 ) )
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
    ( ( DELIVER-1PKG ?auto_95293 ?auto_95291 ) )
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
    ( ( DELIVER-1PKG ?auto_95302 ?auto_95301 ) )
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
    ( ( DELIVER-1PKG ?auto_95325 ?auto_95321 ) )
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
    ( ( DELIVER-1PKG ?auto_95330 ?auto_95327 ) )
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
    ( ( DELIVER-1PKG ?auto_95341 ?auto_95339 ) )
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
    ( ( DELIVER-1PKG ?auto_95364 ?auto_95363 ) )
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
      ?auto_95420 - TRUCK
      ?auto_95419 - LOCATION
      ?auto_95421 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95418 ?auto_95420 ) ( TRUCK-AT ?auto_95420 ?auto_95419 ) ( IN-CITY ?auto_95419 ?auto_95421 ) ( IN-CITY ?auto_95416 ?auto_95421 ) ( not ( = ?auto_95416 ?auto_95419 ) ) ( OBJ-AT ?auto_95417 ?auto_95416 ) ( not ( = ?auto_95417 ?auto_95418 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95418 ?auto_95416 ) )
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
      ?auto_95427 - TRUCK
      ?auto_95425 - LOCATION
      ?auto_95426 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95423 ?auto_95427 ) ( TRUCK-AT ?auto_95427 ?auto_95425 ) ( IN-CITY ?auto_95425 ?auto_95426 ) ( IN-CITY ?auto_95422 ?auto_95426 ) ( not ( = ?auto_95422 ?auto_95425 ) ) ( OBJ-AT ?auto_95424 ?auto_95422 ) ( not ( = ?auto_95424 ?auto_95423 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95424 ?auto_95423 ?auto_95422 ) )
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
      ?auto_95441 - TRUCK
      ?auto_95439 - LOCATION
      ?auto_95440 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95438 ?auto_95441 ) ( TRUCK-AT ?auto_95441 ?auto_95439 ) ( IN-CITY ?auto_95439 ?auto_95440 ) ( IN-CITY ?auto_95435 ?auto_95440 ) ( not ( = ?auto_95435 ?auto_95439 ) ) ( OBJ-AT ?auto_95437 ?auto_95435 ) ( not ( = ?auto_95437 ?auto_95438 ) ) ( OBJ-AT ?auto_95436 ?auto_95435 ) ( not ( = ?auto_95436 ?auto_95437 ) ) ( not ( = ?auto_95436 ?auto_95438 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95437 ?auto_95438 ?auto_95435 ) )
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
      ?auto_95448 - TRUCK
      ?auto_95446 - LOCATION
      ?auto_95447 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95444 ?auto_95448 ) ( TRUCK-AT ?auto_95448 ?auto_95446 ) ( IN-CITY ?auto_95446 ?auto_95447 ) ( IN-CITY ?auto_95442 ?auto_95447 ) ( not ( = ?auto_95442 ?auto_95446 ) ) ( OBJ-AT ?auto_95445 ?auto_95442 ) ( not ( = ?auto_95445 ?auto_95444 ) ) ( OBJ-AT ?auto_95443 ?auto_95442 ) ( not ( = ?auto_95443 ?auto_95444 ) ) ( not ( = ?auto_95443 ?auto_95445 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95445 ?auto_95444 ?auto_95442 ) )
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
      ?auto_95462 - TRUCK
      ?auto_95460 - LOCATION
      ?auto_95461 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95457 ?auto_95462 ) ( TRUCK-AT ?auto_95462 ?auto_95460 ) ( IN-CITY ?auto_95460 ?auto_95461 ) ( IN-CITY ?auto_95456 ?auto_95461 ) ( not ( = ?auto_95456 ?auto_95460 ) ) ( OBJ-AT ?auto_95458 ?auto_95456 ) ( not ( = ?auto_95458 ?auto_95457 ) ) ( OBJ-AT ?auto_95459 ?auto_95456 ) ( not ( = ?auto_95457 ?auto_95459 ) ) ( not ( = ?auto_95458 ?auto_95459 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95458 ?auto_95457 ?auto_95456 ) )
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
      ?auto_95492 - TRUCK
      ?auto_95490 - LOCATION
      ?auto_95491 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95489 ?auto_95492 ) ( TRUCK-AT ?auto_95492 ?auto_95490 ) ( IN-CITY ?auto_95490 ?auto_95491 ) ( IN-CITY ?auto_95485 ?auto_95491 ) ( not ( = ?auto_95485 ?auto_95490 ) ) ( OBJ-AT ?auto_95488 ?auto_95485 ) ( not ( = ?auto_95488 ?auto_95489 ) ) ( OBJ-AT ?auto_95486 ?auto_95485 ) ( OBJ-AT ?auto_95487 ?auto_95485 ) ( not ( = ?auto_95486 ?auto_95487 ) ) ( not ( = ?auto_95486 ?auto_95488 ) ) ( not ( = ?auto_95486 ?auto_95489 ) ) ( not ( = ?auto_95487 ?auto_95488 ) ) ( not ( = ?auto_95487 ?auto_95489 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95488 ?auto_95489 ?auto_95485 ) )
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
      ?auto_95500 - TRUCK
      ?auto_95498 - LOCATION
      ?auto_95499 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95496 ?auto_95500 ) ( TRUCK-AT ?auto_95500 ?auto_95498 ) ( IN-CITY ?auto_95498 ?auto_95499 ) ( IN-CITY ?auto_95493 ?auto_95499 ) ( not ( = ?auto_95493 ?auto_95498 ) ) ( OBJ-AT ?auto_95494 ?auto_95493 ) ( not ( = ?auto_95494 ?auto_95496 ) ) ( OBJ-AT ?auto_95495 ?auto_95493 ) ( OBJ-AT ?auto_95497 ?auto_95493 ) ( not ( = ?auto_95494 ?auto_95495 ) ) ( not ( = ?auto_95494 ?auto_95497 ) ) ( not ( = ?auto_95495 ?auto_95496 ) ) ( not ( = ?auto_95495 ?auto_95497 ) ) ( not ( = ?auto_95496 ?auto_95497 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95494 ?auto_95496 ?auto_95493 ) )
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
      ?auto_95516 - TRUCK
      ?auto_95514 - LOCATION
      ?auto_95515 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95511 ?auto_95516 ) ( TRUCK-AT ?auto_95516 ?auto_95514 ) ( IN-CITY ?auto_95514 ?auto_95515 ) ( IN-CITY ?auto_95509 ?auto_95515 ) ( not ( = ?auto_95509 ?auto_95514 ) ) ( OBJ-AT ?auto_95510 ?auto_95509 ) ( not ( = ?auto_95510 ?auto_95511 ) ) ( OBJ-AT ?auto_95512 ?auto_95509 ) ( OBJ-AT ?auto_95513 ?auto_95509 ) ( not ( = ?auto_95510 ?auto_95512 ) ) ( not ( = ?auto_95510 ?auto_95513 ) ) ( not ( = ?auto_95511 ?auto_95512 ) ) ( not ( = ?auto_95511 ?auto_95513 ) ) ( not ( = ?auto_95512 ?auto_95513 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95510 ?auto_95511 ?auto_95509 ) )
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
      ?auto_95548 - TRUCK
      ?auto_95546 - LOCATION
      ?auto_95547 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_95542 ?auto_95548 ) ( TRUCK-AT ?auto_95548 ?auto_95546 ) ( IN-CITY ?auto_95546 ?auto_95547 ) ( IN-CITY ?auto_95541 ?auto_95547 ) ( not ( = ?auto_95541 ?auto_95546 ) ) ( OBJ-AT ?auto_95545 ?auto_95541 ) ( not ( = ?auto_95545 ?auto_95542 ) ) ( OBJ-AT ?auto_95543 ?auto_95541 ) ( OBJ-AT ?auto_95544 ?auto_95541 ) ( not ( = ?auto_95542 ?auto_95543 ) ) ( not ( = ?auto_95542 ?auto_95544 ) ) ( not ( = ?auto_95543 ?auto_95544 ) ) ( not ( = ?auto_95543 ?auto_95545 ) ) ( not ( = ?auto_95544 ?auto_95545 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95545 ?auto_95542 ?auto_95541 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95607 - OBJ
      ?auto_95606 - LOCATION
    )
    :vars
    (
      ?auto_95611 - TRUCK
      ?auto_95609 - LOCATION
      ?auto_95610 - CITY
      ?auto_95608 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95611 ?auto_95609 ) ( IN-CITY ?auto_95609 ?auto_95610 ) ( IN-CITY ?auto_95606 ?auto_95610 ) ( not ( = ?auto_95606 ?auto_95609 ) ) ( OBJ-AT ?auto_95608 ?auto_95606 ) ( not ( = ?auto_95608 ?auto_95607 ) ) ( OBJ-AT ?auto_95607 ?auto_95609 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_95607 ?auto_95611 ?auto_95609 )
      ( DELIVER-2PKG ?auto_95608 ?auto_95607 ?auto_95606 ) )
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
      ?auto_95615 - TRUCK
      ?auto_95616 - LOCATION
      ?auto_95617 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95615 ?auto_95616 ) ( IN-CITY ?auto_95616 ?auto_95617 ) ( IN-CITY ?auto_95612 ?auto_95617 ) ( not ( = ?auto_95612 ?auto_95616 ) ) ( OBJ-AT ?auto_95613 ?auto_95612 ) ( not ( = ?auto_95613 ?auto_95614 ) ) ( OBJ-AT ?auto_95614 ?auto_95616 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95614 ?auto_95612 ) )
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
      ?auto_95621 - TRUCK
      ?auto_95622 - LOCATION
      ?auto_95623 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95621 ?auto_95622 ) ( IN-CITY ?auto_95622 ?auto_95623 ) ( IN-CITY ?auto_95618 ?auto_95623 ) ( not ( = ?auto_95618 ?auto_95622 ) ) ( OBJ-AT ?auto_95620 ?auto_95618 ) ( not ( = ?auto_95620 ?auto_95619 ) ) ( OBJ-AT ?auto_95619 ?auto_95622 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95620 ?auto_95619 ?auto_95618 ) )
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
      ?auto_95635 - TRUCK
      ?auto_95636 - LOCATION
      ?auto_95637 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95635 ?auto_95636 ) ( IN-CITY ?auto_95636 ?auto_95637 ) ( IN-CITY ?auto_95631 ?auto_95637 ) ( not ( = ?auto_95631 ?auto_95636 ) ) ( OBJ-AT ?auto_95633 ?auto_95631 ) ( not ( = ?auto_95633 ?auto_95634 ) ) ( OBJ-AT ?auto_95634 ?auto_95636 ) ( OBJ-AT ?auto_95632 ?auto_95631 ) ( not ( = ?auto_95632 ?auto_95633 ) ) ( not ( = ?auto_95632 ?auto_95634 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95633 ?auto_95634 ?auto_95631 ) )
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
      ?auto_95642 - TRUCK
      ?auto_95643 - LOCATION
      ?auto_95644 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95642 ?auto_95643 ) ( IN-CITY ?auto_95643 ?auto_95644 ) ( IN-CITY ?auto_95638 ?auto_95644 ) ( not ( = ?auto_95638 ?auto_95643 ) ) ( OBJ-AT ?auto_95641 ?auto_95638 ) ( not ( = ?auto_95641 ?auto_95640 ) ) ( OBJ-AT ?auto_95640 ?auto_95643 ) ( OBJ-AT ?auto_95639 ?auto_95638 ) ( not ( = ?auto_95639 ?auto_95640 ) ) ( not ( = ?auto_95639 ?auto_95641 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95641 ?auto_95640 ?auto_95638 ) )
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
      ?auto_95656 - TRUCK
      ?auto_95657 - LOCATION
      ?auto_95658 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95656 ?auto_95657 ) ( IN-CITY ?auto_95657 ?auto_95658 ) ( IN-CITY ?auto_95652 ?auto_95658 ) ( not ( = ?auto_95652 ?auto_95657 ) ) ( OBJ-AT ?auto_95654 ?auto_95652 ) ( not ( = ?auto_95654 ?auto_95653 ) ) ( OBJ-AT ?auto_95653 ?auto_95657 ) ( OBJ-AT ?auto_95655 ?auto_95652 ) ( not ( = ?auto_95653 ?auto_95655 ) ) ( not ( = ?auto_95654 ?auto_95655 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95654 ?auto_95653 ?auto_95652 ) )
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
      ?auto_95686 - TRUCK
      ?auto_95687 - LOCATION
      ?auto_95688 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95686 ?auto_95687 ) ( IN-CITY ?auto_95687 ?auto_95688 ) ( IN-CITY ?auto_95681 ?auto_95688 ) ( not ( = ?auto_95681 ?auto_95687 ) ) ( OBJ-AT ?auto_95684 ?auto_95681 ) ( not ( = ?auto_95684 ?auto_95685 ) ) ( OBJ-AT ?auto_95685 ?auto_95687 ) ( OBJ-AT ?auto_95682 ?auto_95681 ) ( OBJ-AT ?auto_95683 ?auto_95681 ) ( not ( = ?auto_95682 ?auto_95683 ) ) ( not ( = ?auto_95682 ?auto_95684 ) ) ( not ( = ?auto_95682 ?auto_95685 ) ) ( not ( = ?auto_95683 ?auto_95684 ) ) ( not ( = ?auto_95683 ?auto_95685 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95684 ?auto_95685 ?auto_95681 ) )
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
      ?auto_95694 - TRUCK
      ?auto_95695 - LOCATION
      ?auto_95696 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95694 ?auto_95695 ) ( IN-CITY ?auto_95695 ?auto_95696 ) ( IN-CITY ?auto_95689 ?auto_95696 ) ( not ( = ?auto_95689 ?auto_95695 ) ) ( OBJ-AT ?auto_95690 ?auto_95689 ) ( not ( = ?auto_95690 ?auto_95692 ) ) ( OBJ-AT ?auto_95692 ?auto_95695 ) ( OBJ-AT ?auto_95691 ?auto_95689 ) ( OBJ-AT ?auto_95693 ?auto_95689 ) ( not ( = ?auto_95690 ?auto_95691 ) ) ( not ( = ?auto_95690 ?auto_95693 ) ) ( not ( = ?auto_95691 ?auto_95692 ) ) ( not ( = ?auto_95691 ?auto_95693 ) ) ( not ( = ?auto_95692 ?auto_95693 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95690 ?auto_95692 ?auto_95689 ) )
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
      ?auto_95710 - TRUCK
      ?auto_95711 - LOCATION
      ?auto_95712 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95710 ?auto_95711 ) ( IN-CITY ?auto_95711 ?auto_95712 ) ( IN-CITY ?auto_95705 ?auto_95712 ) ( not ( = ?auto_95705 ?auto_95711 ) ) ( OBJ-AT ?auto_95709 ?auto_95705 ) ( not ( = ?auto_95709 ?auto_95707 ) ) ( OBJ-AT ?auto_95707 ?auto_95711 ) ( OBJ-AT ?auto_95706 ?auto_95705 ) ( OBJ-AT ?auto_95708 ?auto_95705 ) ( not ( = ?auto_95706 ?auto_95707 ) ) ( not ( = ?auto_95706 ?auto_95708 ) ) ( not ( = ?auto_95706 ?auto_95709 ) ) ( not ( = ?auto_95707 ?auto_95708 ) ) ( not ( = ?auto_95708 ?auto_95709 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95709 ?auto_95707 ?auto_95705 ) )
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
      ?auto_95742 - TRUCK
      ?auto_95743 - LOCATION
      ?auto_95744 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_95742 ?auto_95743 ) ( IN-CITY ?auto_95743 ?auto_95744 ) ( IN-CITY ?auto_95737 ?auto_95744 ) ( not ( = ?auto_95737 ?auto_95743 ) ) ( OBJ-AT ?auto_95740 ?auto_95737 ) ( not ( = ?auto_95740 ?auto_95738 ) ) ( OBJ-AT ?auto_95738 ?auto_95743 ) ( OBJ-AT ?auto_95739 ?auto_95737 ) ( OBJ-AT ?auto_95741 ?auto_95737 ) ( not ( = ?auto_95738 ?auto_95739 ) ) ( not ( = ?auto_95738 ?auto_95741 ) ) ( not ( = ?auto_95739 ?auto_95740 ) ) ( not ( = ?auto_95739 ?auto_95741 ) ) ( not ( = ?auto_95740 ?auto_95741 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95740 ?auto_95738 ?auto_95737 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95803 - OBJ
      ?auto_95802 - LOCATION
    )
    :vars
    (
      ?auto_95806 - LOCATION
      ?auto_95807 - CITY
      ?auto_95805 - OBJ
      ?auto_95804 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95806 ?auto_95807 ) ( IN-CITY ?auto_95802 ?auto_95807 ) ( not ( = ?auto_95802 ?auto_95806 ) ) ( OBJ-AT ?auto_95805 ?auto_95802 ) ( not ( = ?auto_95805 ?auto_95803 ) ) ( OBJ-AT ?auto_95803 ?auto_95806 ) ( TRUCK-AT ?auto_95804 ?auto_95802 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_95804 ?auto_95802 ?auto_95806 ?auto_95807 )
      ( DELIVER-2PKG ?auto_95805 ?auto_95803 ?auto_95802 ) )
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
      ?auto_95812 - CITY
      ?auto_95813 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95811 ?auto_95812 ) ( IN-CITY ?auto_95808 ?auto_95812 ) ( not ( = ?auto_95808 ?auto_95811 ) ) ( OBJ-AT ?auto_95809 ?auto_95808 ) ( not ( = ?auto_95809 ?auto_95810 ) ) ( OBJ-AT ?auto_95810 ?auto_95811 ) ( TRUCK-AT ?auto_95813 ?auto_95808 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_95810 ?auto_95808 ) )
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
      ?auto_95819 - LOCATION
      ?auto_95817 - CITY
      ?auto_95818 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95819 ?auto_95817 ) ( IN-CITY ?auto_95814 ?auto_95817 ) ( not ( = ?auto_95814 ?auto_95819 ) ) ( OBJ-AT ?auto_95816 ?auto_95814 ) ( not ( = ?auto_95816 ?auto_95815 ) ) ( OBJ-AT ?auto_95815 ?auto_95819 ) ( TRUCK-AT ?auto_95818 ?auto_95814 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95816 ?auto_95815 ?auto_95814 ) )
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
      ?auto_95833 - LOCATION
      ?auto_95831 - CITY
      ?auto_95832 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95833 ?auto_95831 ) ( IN-CITY ?auto_95827 ?auto_95831 ) ( not ( = ?auto_95827 ?auto_95833 ) ) ( OBJ-AT ?auto_95828 ?auto_95827 ) ( not ( = ?auto_95828 ?auto_95830 ) ) ( OBJ-AT ?auto_95830 ?auto_95833 ) ( TRUCK-AT ?auto_95832 ?auto_95827 ) ( OBJ-AT ?auto_95829 ?auto_95827 ) ( not ( = ?auto_95828 ?auto_95829 ) ) ( not ( = ?auto_95829 ?auto_95830 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95828 ?auto_95830 ?auto_95827 ) )
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
      ?auto_95840 - LOCATION
      ?auto_95838 - CITY
      ?auto_95839 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95840 ?auto_95838 ) ( IN-CITY ?auto_95834 ?auto_95838 ) ( not ( = ?auto_95834 ?auto_95840 ) ) ( OBJ-AT ?auto_95835 ?auto_95834 ) ( not ( = ?auto_95835 ?auto_95836 ) ) ( OBJ-AT ?auto_95836 ?auto_95840 ) ( TRUCK-AT ?auto_95839 ?auto_95834 ) ( OBJ-AT ?auto_95837 ?auto_95834 ) ( not ( = ?auto_95835 ?auto_95837 ) ) ( not ( = ?auto_95836 ?auto_95837 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95835 ?auto_95836 ?auto_95834 ) )
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
      ?auto_95854 - LOCATION
      ?auto_95852 - CITY
      ?auto_95853 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95854 ?auto_95852 ) ( IN-CITY ?auto_95848 ?auto_95852 ) ( not ( = ?auto_95848 ?auto_95854 ) ) ( OBJ-AT ?auto_95850 ?auto_95848 ) ( not ( = ?auto_95850 ?auto_95849 ) ) ( OBJ-AT ?auto_95849 ?auto_95854 ) ( TRUCK-AT ?auto_95853 ?auto_95848 ) ( OBJ-AT ?auto_95851 ?auto_95848 ) ( not ( = ?auto_95849 ?auto_95851 ) ) ( not ( = ?auto_95850 ?auto_95851 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95850 ?auto_95849 ?auto_95848 ) )
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
      ?auto_95884 - LOCATION
      ?auto_95882 - CITY
      ?auto_95883 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95884 ?auto_95882 ) ( IN-CITY ?auto_95877 ?auto_95882 ) ( not ( = ?auto_95877 ?auto_95884 ) ) ( OBJ-AT ?auto_95879 ?auto_95877 ) ( not ( = ?auto_95879 ?auto_95881 ) ) ( OBJ-AT ?auto_95881 ?auto_95884 ) ( TRUCK-AT ?auto_95883 ?auto_95877 ) ( OBJ-AT ?auto_95878 ?auto_95877 ) ( OBJ-AT ?auto_95880 ?auto_95877 ) ( not ( = ?auto_95878 ?auto_95879 ) ) ( not ( = ?auto_95878 ?auto_95880 ) ) ( not ( = ?auto_95878 ?auto_95881 ) ) ( not ( = ?auto_95879 ?auto_95880 ) ) ( not ( = ?auto_95880 ?auto_95881 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95879 ?auto_95881 ?auto_95877 ) )
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
      ?auto_95892 - LOCATION
      ?auto_95890 - CITY
      ?auto_95891 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95892 ?auto_95890 ) ( IN-CITY ?auto_95885 ?auto_95890 ) ( not ( = ?auto_95885 ?auto_95892 ) ) ( OBJ-AT ?auto_95887 ?auto_95885 ) ( not ( = ?auto_95887 ?auto_95888 ) ) ( OBJ-AT ?auto_95888 ?auto_95892 ) ( TRUCK-AT ?auto_95891 ?auto_95885 ) ( OBJ-AT ?auto_95886 ?auto_95885 ) ( OBJ-AT ?auto_95889 ?auto_95885 ) ( not ( = ?auto_95886 ?auto_95887 ) ) ( not ( = ?auto_95886 ?auto_95888 ) ) ( not ( = ?auto_95886 ?auto_95889 ) ) ( not ( = ?auto_95887 ?auto_95889 ) ) ( not ( = ?auto_95888 ?auto_95889 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95887 ?auto_95888 ?auto_95885 ) )
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
      ?auto_95908 - LOCATION
      ?auto_95906 - CITY
      ?auto_95907 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95908 ?auto_95906 ) ( IN-CITY ?auto_95901 ?auto_95906 ) ( not ( = ?auto_95901 ?auto_95908 ) ) ( OBJ-AT ?auto_95904 ?auto_95901 ) ( not ( = ?auto_95904 ?auto_95903 ) ) ( OBJ-AT ?auto_95903 ?auto_95908 ) ( TRUCK-AT ?auto_95907 ?auto_95901 ) ( OBJ-AT ?auto_95902 ?auto_95901 ) ( OBJ-AT ?auto_95905 ?auto_95901 ) ( not ( = ?auto_95902 ?auto_95903 ) ) ( not ( = ?auto_95902 ?auto_95904 ) ) ( not ( = ?auto_95902 ?auto_95905 ) ) ( not ( = ?auto_95903 ?auto_95905 ) ) ( not ( = ?auto_95904 ?auto_95905 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95904 ?auto_95903 ?auto_95901 ) )
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
      ?auto_95940 - LOCATION
      ?auto_95938 - CITY
      ?auto_95939 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_95940 ?auto_95938 ) ( IN-CITY ?auto_95933 ?auto_95938 ) ( not ( = ?auto_95933 ?auto_95940 ) ) ( OBJ-AT ?auto_95937 ?auto_95933 ) ( not ( = ?auto_95937 ?auto_95934 ) ) ( OBJ-AT ?auto_95934 ?auto_95940 ) ( TRUCK-AT ?auto_95939 ?auto_95933 ) ( OBJ-AT ?auto_95935 ?auto_95933 ) ( OBJ-AT ?auto_95936 ?auto_95933 ) ( not ( = ?auto_95934 ?auto_95935 ) ) ( not ( = ?auto_95934 ?auto_95936 ) ) ( not ( = ?auto_95935 ?auto_95936 ) ) ( not ( = ?auto_95935 ?auto_95937 ) ) ( not ( = ?auto_95936 ?auto_95937 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_95937 ?auto_95934 ?auto_95933 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_95999 - OBJ
      ?auto_95998 - LOCATION
    )
    :vars
    (
      ?auto_96003 - LOCATION
      ?auto_96000 - CITY
      ?auto_96002 - OBJ
      ?auto_96001 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96003 ?auto_96000 ) ( IN-CITY ?auto_95998 ?auto_96000 ) ( not ( = ?auto_95998 ?auto_96003 ) ) ( not ( = ?auto_96002 ?auto_95999 ) ) ( OBJ-AT ?auto_95999 ?auto_96003 ) ( TRUCK-AT ?auto_96001 ?auto_95998 ) ( IN-TRUCK ?auto_96002 ?auto_96001 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96002 ?auto_95998 )
      ( DELIVER-2PKG ?auto_96002 ?auto_95999 ?auto_95998 ) )
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
    ( ( DELIVER-1PKG ?auto_96006 ?auto_96004 ) )
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
      ?auto_96013 - CITY
      ?auto_96015 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_96014 ?auto_96013 ) ( IN-CITY ?auto_96010 ?auto_96013 ) ( not ( = ?auto_96010 ?auto_96014 ) ) ( not ( = ?auto_96012 ?auto_96011 ) ) ( OBJ-AT ?auto_96011 ?auto_96014 ) ( TRUCK-AT ?auto_96015 ?auto_96010 ) ( IN-TRUCK ?auto_96012 ?auto_96015 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96012 ?auto_96011 ?auto_96010 ) )
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
      ?auto_96196 - CITY
      ?auto_96199 - OBJ
      ?auto_96198 - TRUCK
      ?auto_96200 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96197 ?auto_96196 ) ( IN-CITY ?auto_96194 ?auto_96196 ) ( not ( = ?auto_96194 ?auto_96197 ) ) ( not ( = ?auto_96199 ?auto_96195 ) ) ( OBJ-AT ?auto_96195 ?auto_96197 ) ( IN-TRUCK ?auto_96199 ?auto_96198 ) ( TRUCK-AT ?auto_96198 ?auto_96200 ) ( IN-CITY ?auto_96200 ?auto_96196 ) ( not ( = ?auto_96194 ?auto_96200 ) ) ( not ( = ?auto_96197 ?auto_96200 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_96198 ?auto_96200 ?auto_96194 ?auto_96196 )
      ( DELIVER-2PKG ?auto_96199 ?auto_96195 ?auto_96194 ) )
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
      ?auto_96205 - LOCATION
      ?auto_96206 - CITY
      ?auto_96207 - TRUCK
      ?auto_96204 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96205 ?auto_96206 ) ( IN-CITY ?auto_96201 ?auto_96206 ) ( not ( = ?auto_96201 ?auto_96205 ) ) ( not ( = ?auto_96202 ?auto_96203 ) ) ( OBJ-AT ?auto_96203 ?auto_96205 ) ( IN-TRUCK ?auto_96202 ?auto_96207 ) ( TRUCK-AT ?auto_96207 ?auto_96204 ) ( IN-CITY ?auto_96204 ?auto_96206 ) ( not ( = ?auto_96201 ?auto_96204 ) ) ( not ( = ?auto_96205 ?auto_96204 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96203 ?auto_96201 ) )
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
      ?auto_96212 - LOCATION
      ?auto_96211 - CITY
      ?auto_96214 - TRUCK
      ?auto_96213 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96212 ?auto_96211 ) ( IN-CITY ?auto_96208 ?auto_96211 ) ( not ( = ?auto_96208 ?auto_96212 ) ) ( not ( = ?auto_96210 ?auto_96209 ) ) ( OBJ-AT ?auto_96209 ?auto_96212 ) ( IN-TRUCK ?auto_96210 ?auto_96214 ) ( TRUCK-AT ?auto_96214 ?auto_96213 ) ( IN-CITY ?auto_96213 ?auto_96211 ) ( not ( = ?auto_96208 ?auto_96213 ) ) ( not ( = ?auto_96212 ?auto_96213 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96210 ?auto_96209 ?auto_96208 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_96417 - OBJ
      ?auto_96416 - LOCATION
    )
    :vars
    (
      ?auto_96420 - LOCATION
      ?auto_96418 - CITY
      ?auto_96419 - OBJ
      ?auto_96422 - TRUCK
      ?auto_96421 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96420 ?auto_96418 ) ( IN-CITY ?auto_96416 ?auto_96418 ) ( not ( = ?auto_96416 ?auto_96420 ) ) ( not ( = ?auto_96419 ?auto_96417 ) ) ( OBJ-AT ?auto_96417 ?auto_96420 ) ( TRUCK-AT ?auto_96422 ?auto_96421 ) ( IN-CITY ?auto_96421 ?auto_96418 ) ( not ( = ?auto_96416 ?auto_96421 ) ) ( not ( = ?auto_96420 ?auto_96421 ) ) ( OBJ-AT ?auto_96419 ?auto_96421 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_96419 ?auto_96422 ?auto_96421 )
      ( DELIVER-2PKG ?auto_96419 ?auto_96417 ?auto_96416 ) )
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
      ?auto_96427 - CITY
      ?auto_96428 - TRUCK
      ?auto_96429 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96426 ?auto_96427 ) ( IN-CITY ?auto_96423 ?auto_96427 ) ( not ( = ?auto_96423 ?auto_96426 ) ) ( not ( = ?auto_96424 ?auto_96425 ) ) ( OBJ-AT ?auto_96425 ?auto_96426 ) ( TRUCK-AT ?auto_96428 ?auto_96429 ) ( IN-CITY ?auto_96429 ?auto_96427 ) ( not ( = ?auto_96423 ?auto_96429 ) ) ( not ( = ?auto_96426 ?auto_96429 ) ) ( OBJ-AT ?auto_96424 ?auto_96429 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_96425 ?auto_96423 ) )
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
      ?auto_96433 - LOCATION
      ?auto_96434 - CITY
      ?auto_96435 - TRUCK
      ?auto_96436 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_96433 ?auto_96434 ) ( IN-CITY ?auto_96430 ?auto_96434 ) ( not ( = ?auto_96430 ?auto_96433 ) ) ( not ( = ?auto_96432 ?auto_96431 ) ) ( OBJ-AT ?auto_96431 ?auto_96433 ) ( TRUCK-AT ?auto_96435 ?auto_96436 ) ( IN-CITY ?auto_96436 ?auto_96434 ) ( not ( = ?auto_96430 ?auto_96436 ) ) ( not ( = ?auto_96433 ?auto_96436 ) ) ( OBJ-AT ?auto_96432 ?auto_96436 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_96432 ?auto_96431 ?auto_96430 ) )
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
      ?auto_97814 - TRUCK
      ?auto_97812 - LOCATION
      ?auto_97813 - CITY
      ?auto_97815 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97811 ?auto_97814 ) ( TRUCK-AT ?auto_97814 ?auto_97812 ) ( IN-CITY ?auto_97812 ?auto_97813 ) ( IN-CITY ?auto_97808 ?auto_97813 ) ( not ( = ?auto_97808 ?auto_97812 ) ) ( OBJ-AT ?auto_97815 ?auto_97808 ) ( not ( = ?auto_97815 ?auto_97811 ) ) ( OBJ-AT ?auto_97809 ?auto_97808 ) ( OBJ-AT ?auto_97810 ?auto_97808 ) ( not ( = ?auto_97809 ?auto_97810 ) ) ( not ( = ?auto_97809 ?auto_97811 ) ) ( not ( = ?auto_97809 ?auto_97815 ) ) ( not ( = ?auto_97810 ?auto_97811 ) ) ( not ( = ?auto_97810 ?auto_97815 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97815 ?auto_97811 ?auto_97808 ) )
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
      ?auto_97826 - TRUCK
      ?auto_97824 - LOCATION
      ?auto_97825 - CITY
      ?auto_97827 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97822 ?auto_97826 ) ( TRUCK-AT ?auto_97826 ?auto_97824 ) ( IN-CITY ?auto_97824 ?auto_97825 ) ( IN-CITY ?auto_97820 ?auto_97825 ) ( not ( = ?auto_97820 ?auto_97824 ) ) ( OBJ-AT ?auto_97827 ?auto_97820 ) ( not ( = ?auto_97827 ?auto_97822 ) ) ( OBJ-AT ?auto_97821 ?auto_97820 ) ( OBJ-AT ?auto_97823 ?auto_97820 ) ( not ( = ?auto_97821 ?auto_97822 ) ) ( not ( = ?auto_97821 ?auto_97823 ) ) ( not ( = ?auto_97821 ?auto_97827 ) ) ( not ( = ?auto_97822 ?auto_97823 ) ) ( not ( = ?auto_97823 ?auto_97827 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97827 ?auto_97822 ?auto_97820 ) )
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
      ?auto_97840 - LOCATION
      ?auto_97841 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97837 ?auto_97842 ) ( TRUCK-AT ?auto_97842 ?auto_97840 ) ( IN-CITY ?auto_97840 ?auto_97841 ) ( IN-CITY ?auto_97836 ?auto_97841 ) ( not ( = ?auto_97836 ?auto_97840 ) ) ( OBJ-AT ?auto_97839 ?auto_97836 ) ( not ( = ?auto_97839 ?auto_97837 ) ) ( OBJ-AT ?auto_97838 ?auto_97836 ) ( not ( = ?auto_97837 ?auto_97838 ) ) ( not ( = ?auto_97838 ?auto_97839 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97839 ?auto_97837 ?auto_97836 ) )
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
      ?auto_97864 - TRUCK
      ?auto_97862 - LOCATION
      ?auto_97863 - CITY
      ?auto_97865 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97859 ?auto_97864 ) ( TRUCK-AT ?auto_97864 ?auto_97862 ) ( IN-CITY ?auto_97862 ?auto_97863 ) ( IN-CITY ?auto_97858 ?auto_97863 ) ( not ( = ?auto_97858 ?auto_97862 ) ) ( OBJ-AT ?auto_97865 ?auto_97858 ) ( not ( = ?auto_97865 ?auto_97859 ) ) ( OBJ-AT ?auto_97860 ?auto_97858 ) ( OBJ-AT ?auto_97861 ?auto_97858 ) ( not ( = ?auto_97859 ?auto_97860 ) ) ( not ( = ?auto_97859 ?auto_97861 ) ) ( not ( = ?auto_97860 ?auto_97861 ) ) ( not ( = ?auto_97860 ?auto_97865 ) ) ( not ( = ?auto_97861 ?auto_97865 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97865 ?auto_97859 ?auto_97858 ) )
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
      ?auto_97910 - LOCATION
      ?auto_97911 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97909 ?auto_97912 ) ( TRUCK-AT ?auto_97912 ?auto_97910 ) ( IN-CITY ?auto_97910 ?auto_97911 ) ( IN-CITY ?auto_97905 ?auto_97911 ) ( not ( = ?auto_97905 ?auto_97910 ) ) ( OBJ-AT ?auto_97906 ?auto_97905 ) ( not ( = ?auto_97906 ?auto_97909 ) ) ( OBJ-AT ?auto_97907 ?auto_97905 ) ( OBJ-AT ?auto_97908 ?auto_97905 ) ( not ( = ?auto_97906 ?auto_97907 ) ) ( not ( = ?auto_97906 ?auto_97908 ) ) ( not ( = ?auto_97907 ?auto_97908 ) ) ( not ( = ?auto_97907 ?auto_97909 ) ) ( not ( = ?auto_97908 ?auto_97909 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97906 ?auto_97909 ?auto_97905 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_97922 - OBJ
      ?auto_97923 - OBJ
      ?auto_97924 - OBJ
      ?auto_97925 - OBJ
      ?auto_97921 - LOCATION
    )
    :vars
    (
      ?auto_97928 - TRUCK
      ?auto_97926 - LOCATION
      ?auto_97927 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97924 ?auto_97928 ) ( TRUCK-AT ?auto_97928 ?auto_97926 ) ( IN-CITY ?auto_97926 ?auto_97927 ) ( IN-CITY ?auto_97921 ?auto_97927 ) ( not ( = ?auto_97921 ?auto_97926 ) ) ( OBJ-AT ?auto_97923 ?auto_97921 ) ( not ( = ?auto_97923 ?auto_97924 ) ) ( OBJ-AT ?auto_97922 ?auto_97921 ) ( OBJ-AT ?auto_97925 ?auto_97921 ) ( not ( = ?auto_97922 ?auto_97923 ) ) ( not ( = ?auto_97922 ?auto_97924 ) ) ( not ( = ?auto_97922 ?auto_97925 ) ) ( not ( = ?auto_97923 ?auto_97925 ) ) ( not ( = ?auto_97924 ?auto_97925 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97923 ?auto_97924 ?auto_97921 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_97954 - OBJ
      ?auto_97955 - OBJ
      ?auto_97956 - OBJ
      ?auto_97957 - OBJ
      ?auto_97953 - LOCATION
    )
    :vars
    (
      ?auto_97960 - TRUCK
      ?auto_97958 - LOCATION
      ?auto_97959 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_97956 ?auto_97960 ) ( TRUCK-AT ?auto_97960 ?auto_97958 ) ( IN-CITY ?auto_97958 ?auto_97959 ) ( IN-CITY ?auto_97953 ?auto_97959 ) ( not ( = ?auto_97953 ?auto_97958 ) ) ( OBJ-AT ?auto_97957 ?auto_97953 ) ( not ( = ?auto_97957 ?auto_97956 ) ) ( OBJ-AT ?auto_97954 ?auto_97953 ) ( OBJ-AT ?auto_97955 ?auto_97953 ) ( not ( = ?auto_97954 ?auto_97955 ) ) ( not ( = ?auto_97954 ?auto_97956 ) ) ( not ( = ?auto_97954 ?auto_97957 ) ) ( not ( = ?auto_97955 ?auto_97956 ) ) ( not ( = ?auto_97955 ?auto_97957 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_97957 ?auto_97956 ?auto_97953 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98002 - OBJ
      ?auto_98003 - OBJ
      ?auto_98004 - OBJ
      ?auto_98005 - OBJ
      ?auto_98001 - LOCATION
    )
    :vars
    (
      ?auto_98008 - TRUCK
      ?auto_98006 - LOCATION
      ?auto_98007 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98003 ?auto_98008 ) ( TRUCK-AT ?auto_98008 ?auto_98006 ) ( IN-CITY ?auto_98006 ?auto_98007 ) ( IN-CITY ?auto_98001 ?auto_98007 ) ( not ( = ?auto_98001 ?auto_98006 ) ) ( OBJ-AT ?auto_98005 ?auto_98001 ) ( not ( = ?auto_98005 ?auto_98003 ) ) ( OBJ-AT ?auto_98002 ?auto_98001 ) ( OBJ-AT ?auto_98004 ?auto_98001 ) ( not ( = ?auto_98002 ?auto_98003 ) ) ( not ( = ?auto_98002 ?auto_98004 ) ) ( not ( = ?auto_98002 ?auto_98005 ) ) ( not ( = ?auto_98003 ?auto_98004 ) ) ( not ( = ?auto_98004 ?auto_98005 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98005 ?auto_98003 ?auto_98001 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98058 - OBJ
      ?auto_98059 - OBJ
      ?auto_98060 - OBJ
      ?auto_98061 - OBJ
      ?auto_98057 - LOCATION
    )
    :vars
    (
      ?auto_98064 - TRUCK
      ?auto_98062 - LOCATION
      ?auto_98063 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98061 ?auto_98064 ) ( TRUCK-AT ?auto_98064 ?auto_98062 ) ( IN-CITY ?auto_98062 ?auto_98063 ) ( IN-CITY ?auto_98057 ?auto_98063 ) ( not ( = ?auto_98057 ?auto_98062 ) ) ( OBJ-AT ?auto_98059 ?auto_98057 ) ( not ( = ?auto_98059 ?auto_98061 ) ) ( OBJ-AT ?auto_98058 ?auto_98057 ) ( OBJ-AT ?auto_98060 ?auto_98057 ) ( not ( = ?auto_98058 ?auto_98059 ) ) ( not ( = ?auto_98058 ?auto_98060 ) ) ( not ( = ?auto_98058 ?auto_98061 ) ) ( not ( = ?auto_98059 ?auto_98060 ) ) ( not ( = ?auto_98060 ?auto_98061 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98059 ?auto_98061 ?auto_98057 ) )
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
      ?auto_98104 - TRUCK
      ?auto_98102 - LOCATION
      ?auto_98103 - CITY
      ?auto_98105 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98101 ?auto_98104 ) ( TRUCK-AT ?auto_98104 ?auto_98102 ) ( IN-CITY ?auto_98102 ?auto_98103 ) ( IN-CITY ?auto_98097 ?auto_98103 ) ( not ( = ?auto_98097 ?auto_98102 ) ) ( OBJ-AT ?auto_98105 ?auto_98097 ) ( not ( = ?auto_98105 ?auto_98101 ) ) ( OBJ-AT ?auto_98098 ?auto_98097 ) ( OBJ-AT ?auto_98099 ?auto_98097 ) ( OBJ-AT ?auto_98100 ?auto_98097 ) ( not ( = ?auto_98098 ?auto_98099 ) ) ( not ( = ?auto_98098 ?auto_98100 ) ) ( not ( = ?auto_98098 ?auto_98101 ) ) ( not ( = ?auto_98098 ?auto_98105 ) ) ( not ( = ?auto_98099 ?auto_98100 ) ) ( not ( = ?auto_98099 ?auto_98101 ) ) ( not ( = ?auto_98099 ?auto_98105 ) ) ( not ( = ?auto_98100 ?auto_98101 ) ) ( not ( = ?auto_98100 ?auto_98105 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98105 ?auto_98101 ?auto_98097 ) )
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
      ?auto_98121 - TRUCK
      ?auto_98119 - LOCATION
      ?auto_98120 - CITY
      ?auto_98122 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98117 ?auto_98121 ) ( TRUCK-AT ?auto_98121 ?auto_98119 ) ( IN-CITY ?auto_98119 ?auto_98120 ) ( IN-CITY ?auto_98114 ?auto_98120 ) ( not ( = ?auto_98114 ?auto_98119 ) ) ( OBJ-AT ?auto_98122 ?auto_98114 ) ( not ( = ?auto_98122 ?auto_98117 ) ) ( OBJ-AT ?auto_98115 ?auto_98114 ) ( OBJ-AT ?auto_98116 ?auto_98114 ) ( OBJ-AT ?auto_98118 ?auto_98114 ) ( not ( = ?auto_98115 ?auto_98116 ) ) ( not ( = ?auto_98115 ?auto_98117 ) ) ( not ( = ?auto_98115 ?auto_98118 ) ) ( not ( = ?auto_98115 ?auto_98122 ) ) ( not ( = ?auto_98116 ?auto_98117 ) ) ( not ( = ?auto_98116 ?auto_98118 ) ) ( not ( = ?auto_98116 ?auto_98122 ) ) ( not ( = ?auto_98117 ?auto_98118 ) ) ( not ( = ?auto_98118 ?auto_98122 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98122 ?auto_98117 ?auto_98114 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98133 - OBJ
      ?auto_98134 - OBJ
      ?auto_98135 - OBJ
      ?auto_98136 - OBJ
      ?auto_98132 - LOCATION
    )
    :vars
    (
      ?auto_98139 - TRUCK
      ?auto_98137 - LOCATION
      ?auto_98138 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98134 ?auto_98139 ) ( TRUCK-AT ?auto_98139 ?auto_98137 ) ( IN-CITY ?auto_98137 ?auto_98138 ) ( IN-CITY ?auto_98132 ?auto_98138 ) ( not ( = ?auto_98132 ?auto_98137 ) ) ( OBJ-AT ?auto_98135 ?auto_98132 ) ( not ( = ?auto_98135 ?auto_98134 ) ) ( OBJ-AT ?auto_98133 ?auto_98132 ) ( OBJ-AT ?auto_98136 ?auto_98132 ) ( not ( = ?auto_98133 ?auto_98134 ) ) ( not ( = ?auto_98133 ?auto_98135 ) ) ( not ( = ?auto_98133 ?auto_98136 ) ) ( not ( = ?auto_98134 ?auto_98136 ) ) ( not ( = ?auto_98135 ?auto_98136 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98135 ?auto_98134 ?auto_98132 ) )
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
      ?auto_98171 - TRUCK
      ?auto_98169 - LOCATION
      ?auto_98170 - CITY
      ?auto_98172 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98166 ?auto_98171 ) ( TRUCK-AT ?auto_98171 ?auto_98169 ) ( IN-CITY ?auto_98169 ?auto_98170 ) ( IN-CITY ?auto_98164 ?auto_98170 ) ( not ( = ?auto_98164 ?auto_98169 ) ) ( OBJ-AT ?auto_98172 ?auto_98164 ) ( not ( = ?auto_98172 ?auto_98166 ) ) ( OBJ-AT ?auto_98165 ?auto_98164 ) ( OBJ-AT ?auto_98167 ?auto_98164 ) ( OBJ-AT ?auto_98168 ?auto_98164 ) ( not ( = ?auto_98165 ?auto_98166 ) ) ( not ( = ?auto_98165 ?auto_98167 ) ) ( not ( = ?auto_98165 ?auto_98168 ) ) ( not ( = ?auto_98165 ?auto_98172 ) ) ( not ( = ?auto_98166 ?auto_98167 ) ) ( not ( = ?auto_98166 ?auto_98168 ) ) ( not ( = ?auto_98167 ?auto_98168 ) ) ( not ( = ?auto_98167 ?auto_98172 ) ) ( not ( = ?auto_98168 ?auto_98172 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98172 ?auto_98166 ?auto_98164 ) )
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
      ?auto_98213 - LOCATION
      ?auto_98214 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98209 ?auto_98215 ) ( TRUCK-AT ?auto_98215 ?auto_98213 ) ( IN-CITY ?auto_98213 ?auto_98214 ) ( IN-CITY ?auto_98208 ?auto_98214 ) ( not ( = ?auto_98208 ?auto_98213 ) ) ( OBJ-AT ?auto_98211 ?auto_98208 ) ( not ( = ?auto_98211 ?auto_98209 ) ) ( OBJ-AT ?auto_98210 ?auto_98208 ) ( OBJ-AT ?auto_98212 ?auto_98208 ) ( not ( = ?auto_98209 ?auto_98210 ) ) ( not ( = ?auto_98209 ?auto_98212 ) ) ( not ( = ?auto_98210 ?auto_98211 ) ) ( not ( = ?auto_98210 ?auto_98212 ) ) ( not ( = ?auto_98211 ?auto_98212 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98211 ?auto_98209 ?auto_98208 ) )
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
      ?auto_98245 - LOCATION
      ?auto_98246 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98241 ?auto_98247 ) ( TRUCK-AT ?auto_98247 ?auto_98245 ) ( IN-CITY ?auto_98245 ?auto_98246 ) ( IN-CITY ?auto_98240 ?auto_98246 ) ( not ( = ?auto_98240 ?auto_98245 ) ) ( OBJ-AT ?auto_98242 ?auto_98240 ) ( not ( = ?auto_98242 ?auto_98241 ) ) ( OBJ-AT ?auto_98243 ?auto_98240 ) ( OBJ-AT ?auto_98244 ?auto_98240 ) ( not ( = ?auto_98241 ?auto_98243 ) ) ( not ( = ?auto_98241 ?auto_98244 ) ) ( not ( = ?auto_98242 ?auto_98243 ) ) ( not ( = ?auto_98242 ?auto_98244 ) ) ( not ( = ?auto_98243 ?auto_98244 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98242 ?auto_98241 ?auto_98240 ) )
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
      ?auto_98319 - TRUCK
      ?auto_98317 - LOCATION
      ?auto_98318 - CITY
      ?auto_98320 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_98313 ?auto_98319 ) ( TRUCK-AT ?auto_98319 ?auto_98317 ) ( IN-CITY ?auto_98317 ?auto_98318 ) ( IN-CITY ?auto_98312 ?auto_98318 ) ( not ( = ?auto_98312 ?auto_98317 ) ) ( OBJ-AT ?auto_98320 ?auto_98312 ) ( not ( = ?auto_98320 ?auto_98313 ) ) ( OBJ-AT ?auto_98314 ?auto_98312 ) ( OBJ-AT ?auto_98315 ?auto_98312 ) ( OBJ-AT ?auto_98316 ?auto_98312 ) ( not ( = ?auto_98313 ?auto_98314 ) ) ( not ( = ?auto_98313 ?auto_98315 ) ) ( not ( = ?auto_98313 ?auto_98316 ) ) ( not ( = ?auto_98314 ?auto_98315 ) ) ( not ( = ?auto_98314 ?auto_98316 ) ) ( not ( = ?auto_98314 ?auto_98320 ) ) ( not ( = ?auto_98315 ?auto_98316 ) ) ( not ( = ?auto_98315 ?auto_98320 ) ) ( not ( = ?auto_98316 ?auto_98320 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98320 ?auto_98313 ?auto_98312 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_98464 - OBJ
      ?auto_98465 - OBJ
      ?auto_98466 - OBJ
      ?auto_98463 - LOCATION
    )
    :vars
    (
      ?auto_98468 - TRUCK
      ?auto_98469 - LOCATION
      ?auto_98467 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98468 ?auto_98469 ) ( IN-CITY ?auto_98469 ?auto_98467 ) ( IN-CITY ?auto_98463 ?auto_98467 ) ( not ( = ?auto_98463 ?auto_98469 ) ) ( OBJ-AT ?auto_98464 ?auto_98463 ) ( not ( = ?auto_98464 ?auto_98466 ) ) ( OBJ-AT ?auto_98466 ?auto_98469 ) ( OBJ-AT ?auto_98465 ?auto_98463 ) ( not ( = ?auto_98464 ?auto_98465 ) ) ( not ( = ?auto_98465 ?auto_98466 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98464 ?auto_98466 ?auto_98463 ) )
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
      ?auto_98502 - TRUCK
      ?auto_98503 - LOCATION
      ?auto_98501 - CITY
      ?auto_98500 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98502 ?auto_98503 ) ( IN-CITY ?auto_98503 ?auto_98501 ) ( IN-CITY ?auto_98496 ?auto_98501 ) ( not ( = ?auto_98496 ?auto_98503 ) ) ( OBJ-AT ?auto_98500 ?auto_98496 ) ( not ( = ?auto_98500 ?auto_98499 ) ) ( OBJ-AT ?auto_98499 ?auto_98503 ) ( OBJ-AT ?auto_98497 ?auto_98496 ) ( OBJ-AT ?auto_98498 ?auto_98496 ) ( not ( = ?auto_98497 ?auto_98498 ) ) ( not ( = ?auto_98497 ?auto_98499 ) ) ( not ( = ?auto_98497 ?auto_98500 ) ) ( not ( = ?auto_98498 ?auto_98499 ) ) ( not ( = ?auto_98498 ?auto_98500 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98500 ?auto_98499 ?auto_98496 ) )
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
      ?auto_98514 - TRUCK
      ?auto_98515 - LOCATION
      ?auto_98513 - CITY
      ?auto_98512 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98514 ?auto_98515 ) ( IN-CITY ?auto_98515 ?auto_98513 ) ( IN-CITY ?auto_98508 ?auto_98513 ) ( not ( = ?auto_98508 ?auto_98515 ) ) ( OBJ-AT ?auto_98512 ?auto_98508 ) ( not ( = ?auto_98512 ?auto_98510 ) ) ( OBJ-AT ?auto_98510 ?auto_98515 ) ( OBJ-AT ?auto_98509 ?auto_98508 ) ( OBJ-AT ?auto_98511 ?auto_98508 ) ( not ( = ?auto_98509 ?auto_98510 ) ) ( not ( = ?auto_98509 ?auto_98511 ) ) ( not ( = ?auto_98509 ?auto_98512 ) ) ( not ( = ?auto_98510 ?auto_98511 ) ) ( not ( = ?auto_98511 ?auto_98512 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98512 ?auto_98510 ?auto_98508 ) )
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
      ?auto_98552 - TRUCK
      ?auto_98553 - LOCATION
      ?auto_98551 - CITY
      ?auto_98550 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98552 ?auto_98553 ) ( IN-CITY ?auto_98553 ?auto_98551 ) ( IN-CITY ?auto_98546 ?auto_98551 ) ( not ( = ?auto_98546 ?auto_98553 ) ) ( OBJ-AT ?auto_98550 ?auto_98546 ) ( not ( = ?auto_98550 ?auto_98547 ) ) ( OBJ-AT ?auto_98547 ?auto_98553 ) ( OBJ-AT ?auto_98548 ?auto_98546 ) ( OBJ-AT ?auto_98549 ?auto_98546 ) ( not ( = ?auto_98547 ?auto_98548 ) ) ( not ( = ?auto_98547 ?auto_98549 ) ) ( not ( = ?auto_98548 ?auto_98549 ) ) ( not ( = ?auto_98548 ?auto_98550 ) ) ( not ( = ?auto_98549 ?auto_98550 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98550 ?auto_98547 ?auto_98546 ) )
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
      ?auto_98599 - TRUCK
      ?auto_98600 - LOCATION
      ?auto_98598 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98599 ?auto_98600 ) ( IN-CITY ?auto_98600 ?auto_98598 ) ( IN-CITY ?auto_98593 ?auto_98598 ) ( not ( = ?auto_98593 ?auto_98600 ) ) ( OBJ-AT ?auto_98594 ?auto_98593 ) ( not ( = ?auto_98594 ?auto_98597 ) ) ( OBJ-AT ?auto_98597 ?auto_98600 ) ( OBJ-AT ?auto_98595 ?auto_98593 ) ( OBJ-AT ?auto_98596 ?auto_98593 ) ( not ( = ?auto_98594 ?auto_98595 ) ) ( not ( = ?auto_98594 ?auto_98596 ) ) ( not ( = ?auto_98595 ?auto_98596 ) ) ( not ( = ?auto_98595 ?auto_98597 ) ) ( not ( = ?auto_98596 ?auto_98597 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98594 ?auto_98597 ?auto_98593 ) )
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
      ?auto_98679 - TRUCK
      ?auto_98680 - LOCATION
      ?auto_98678 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98679 ?auto_98680 ) ( IN-CITY ?auto_98680 ?auto_98678 ) ( IN-CITY ?auto_98673 ?auto_98678 ) ( not ( = ?auto_98673 ?auto_98680 ) ) ( OBJ-AT ?auto_98674 ?auto_98673 ) ( not ( = ?auto_98674 ?auto_98675 ) ) ( OBJ-AT ?auto_98675 ?auto_98680 ) ( OBJ-AT ?auto_98676 ?auto_98673 ) ( OBJ-AT ?auto_98677 ?auto_98673 ) ( not ( = ?auto_98674 ?auto_98676 ) ) ( not ( = ?auto_98674 ?auto_98677 ) ) ( not ( = ?auto_98675 ?auto_98676 ) ) ( not ( = ?auto_98675 ?auto_98677 ) ) ( not ( = ?auto_98676 ?auto_98677 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98674 ?auto_98675 ?auto_98673 ) )
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
      ?auto_98743 - TRUCK
      ?auto_98744 - LOCATION
      ?auto_98742 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98743 ?auto_98744 ) ( IN-CITY ?auto_98744 ?auto_98742 ) ( IN-CITY ?auto_98737 ?auto_98742 ) ( not ( = ?auto_98737 ?auto_98744 ) ) ( OBJ-AT ?auto_98739 ?auto_98737 ) ( not ( = ?auto_98739 ?auto_98741 ) ) ( OBJ-AT ?auto_98741 ?auto_98744 ) ( OBJ-AT ?auto_98738 ?auto_98737 ) ( OBJ-AT ?auto_98740 ?auto_98737 ) ( not ( = ?auto_98738 ?auto_98739 ) ) ( not ( = ?auto_98738 ?auto_98740 ) ) ( not ( = ?auto_98738 ?auto_98741 ) ) ( not ( = ?auto_98739 ?auto_98740 ) ) ( not ( = ?auto_98740 ?auto_98741 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98739 ?auto_98741 ?auto_98737 ) )
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
      ?auto_98759 - TRUCK
      ?auto_98760 - LOCATION
      ?auto_98758 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98759 ?auto_98760 ) ( IN-CITY ?auto_98760 ?auto_98758 ) ( IN-CITY ?auto_98753 ?auto_98758 ) ( not ( = ?auto_98753 ?auto_98760 ) ) ( OBJ-AT ?auto_98755 ?auto_98753 ) ( not ( = ?auto_98755 ?auto_98756 ) ) ( OBJ-AT ?auto_98756 ?auto_98760 ) ( OBJ-AT ?auto_98754 ?auto_98753 ) ( OBJ-AT ?auto_98757 ?auto_98753 ) ( not ( = ?auto_98754 ?auto_98755 ) ) ( not ( = ?auto_98754 ?auto_98756 ) ) ( not ( = ?auto_98754 ?auto_98757 ) ) ( not ( = ?auto_98755 ?auto_98757 ) ) ( not ( = ?auto_98756 ?auto_98757 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98755 ?auto_98756 ?auto_98753 ) )
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
      ?auto_98792 - TRUCK
      ?auto_98793 - LOCATION
      ?auto_98791 - CITY
      ?auto_98790 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98792 ?auto_98793 ) ( IN-CITY ?auto_98793 ?auto_98791 ) ( IN-CITY ?auto_98785 ?auto_98791 ) ( not ( = ?auto_98785 ?auto_98793 ) ) ( OBJ-AT ?auto_98790 ?auto_98785 ) ( not ( = ?auto_98790 ?auto_98789 ) ) ( OBJ-AT ?auto_98789 ?auto_98793 ) ( OBJ-AT ?auto_98786 ?auto_98785 ) ( OBJ-AT ?auto_98787 ?auto_98785 ) ( OBJ-AT ?auto_98788 ?auto_98785 ) ( not ( = ?auto_98786 ?auto_98787 ) ) ( not ( = ?auto_98786 ?auto_98788 ) ) ( not ( = ?auto_98786 ?auto_98789 ) ) ( not ( = ?auto_98786 ?auto_98790 ) ) ( not ( = ?auto_98787 ?auto_98788 ) ) ( not ( = ?auto_98787 ?auto_98789 ) ) ( not ( = ?auto_98787 ?auto_98790 ) ) ( not ( = ?auto_98788 ?auto_98789 ) ) ( not ( = ?auto_98788 ?auto_98790 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98790 ?auto_98789 ?auto_98785 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98795 - OBJ
      ?auto_98796 - OBJ
      ?auto_98797 - OBJ
      ?auto_98798 - OBJ
      ?auto_98794 - LOCATION
    )
    :vars
    (
      ?auto_98800 - TRUCK
      ?auto_98801 - LOCATION
      ?auto_98799 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98800 ?auto_98801 ) ( IN-CITY ?auto_98801 ?auto_98799 ) ( IN-CITY ?auto_98794 ?auto_98799 ) ( not ( = ?auto_98794 ?auto_98801 ) ) ( OBJ-AT ?auto_98798 ?auto_98794 ) ( not ( = ?auto_98798 ?auto_98797 ) ) ( OBJ-AT ?auto_98797 ?auto_98801 ) ( OBJ-AT ?auto_98795 ?auto_98794 ) ( OBJ-AT ?auto_98796 ?auto_98794 ) ( not ( = ?auto_98795 ?auto_98796 ) ) ( not ( = ?auto_98795 ?auto_98797 ) ) ( not ( = ?auto_98795 ?auto_98798 ) ) ( not ( = ?auto_98796 ?auto_98797 ) ) ( not ( = ?auto_98796 ?auto_98798 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98798 ?auto_98797 ?auto_98794 ) )
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
      ?auto_98809 - TRUCK
      ?auto_98810 - LOCATION
      ?auto_98808 - CITY
      ?auto_98807 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98809 ?auto_98810 ) ( IN-CITY ?auto_98810 ?auto_98808 ) ( IN-CITY ?auto_98802 ?auto_98808 ) ( not ( = ?auto_98802 ?auto_98810 ) ) ( OBJ-AT ?auto_98807 ?auto_98802 ) ( not ( = ?auto_98807 ?auto_98805 ) ) ( OBJ-AT ?auto_98805 ?auto_98810 ) ( OBJ-AT ?auto_98803 ?auto_98802 ) ( OBJ-AT ?auto_98804 ?auto_98802 ) ( OBJ-AT ?auto_98806 ?auto_98802 ) ( not ( = ?auto_98803 ?auto_98804 ) ) ( not ( = ?auto_98803 ?auto_98805 ) ) ( not ( = ?auto_98803 ?auto_98806 ) ) ( not ( = ?auto_98803 ?auto_98807 ) ) ( not ( = ?auto_98804 ?auto_98805 ) ) ( not ( = ?auto_98804 ?auto_98806 ) ) ( not ( = ?auto_98804 ?auto_98807 ) ) ( not ( = ?auto_98805 ?auto_98806 ) ) ( not ( = ?auto_98806 ?auto_98807 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98807 ?auto_98805 ?auto_98802 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98821 - OBJ
      ?auto_98822 - OBJ
      ?auto_98823 - OBJ
      ?auto_98824 - OBJ
      ?auto_98820 - LOCATION
    )
    :vars
    (
      ?auto_98826 - TRUCK
      ?auto_98827 - LOCATION
      ?auto_98825 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98826 ?auto_98827 ) ( IN-CITY ?auto_98827 ?auto_98825 ) ( IN-CITY ?auto_98820 ?auto_98825 ) ( not ( = ?auto_98820 ?auto_98827 ) ) ( OBJ-AT ?auto_98823 ?auto_98820 ) ( not ( = ?auto_98823 ?auto_98822 ) ) ( OBJ-AT ?auto_98822 ?auto_98827 ) ( OBJ-AT ?auto_98821 ?auto_98820 ) ( OBJ-AT ?auto_98824 ?auto_98820 ) ( not ( = ?auto_98821 ?auto_98822 ) ) ( not ( = ?auto_98821 ?auto_98823 ) ) ( not ( = ?auto_98821 ?auto_98824 ) ) ( not ( = ?auto_98822 ?auto_98824 ) ) ( not ( = ?auto_98823 ?auto_98824 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98823 ?auto_98822 ?auto_98820 ) )
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
      ?auto_98859 - TRUCK
      ?auto_98860 - LOCATION
      ?auto_98858 - CITY
      ?auto_98857 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98859 ?auto_98860 ) ( IN-CITY ?auto_98860 ?auto_98858 ) ( IN-CITY ?auto_98852 ?auto_98858 ) ( not ( = ?auto_98852 ?auto_98860 ) ) ( OBJ-AT ?auto_98857 ?auto_98852 ) ( not ( = ?auto_98857 ?auto_98854 ) ) ( OBJ-AT ?auto_98854 ?auto_98860 ) ( OBJ-AT ?auto_98853 ?auto_98852 ) ( OBJ-AT ?auto_98855 ?auto_98852 ) ( OBJ-AT ?auto_98856 ?auto_98852 ) ( not ( = ?auto_98853 ?auto_98854 ) ) ( not ( = ?auto_98853 ?auto_98855 ) ) ( not ( = ?auto_98853 ?auto_98856 ) ) ( not ( = ?auto_98853 ?auto_98857 ) ) ( not ( = ?auto_98854 ?auto_98855 ) ) ( not ( = ?auto_98854 ?auto_98856 ) ) ( not ( = ?auto_98855 ?auto_98856 ) ) ( not ( = ?auto_98855 ?auto_98857 ) ) ( not ( = ?auto_98856 ?auto_98857 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98857 ?auto_98854 ?auto_98852 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98905 - OBJ
      ?auto_98906 - OBJ
      ?auto_98907 - OBJ
      ?auto_98908 - OBJ
      ?auto_98904 - LOCATION
    )
    :vars
    (
      ?auto_98910 - TRUCK
      ?auto_98911 - LOCATION
      ?auto_98909 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98910 ?auto_98911 ) ( IN-CITY ?auto_98911 ?auto_98909 ) ( IN-CITY ?auto_98904 ?auto_98909 ) ( not ( = ?auto_98904 ?auto_98911 ) ) ( OBJ-AT ?auto_98906 ?auto_98904 ) ( not ( = ?auto_98906 ?auto_98905 ) ) ( OBJ-AT ?auto_98905 ?auto_98911 ) ( OBJ-AT ?auto_98907 ?auto_98904 ) ( OBJ-AT ?auto_98908 ?auto_98904 ) ( not ( = ?auto_98905 ?auto_98907 ) ) ( not ( = ?auto_98905 ?auto_98908 ) ) ( not ( = ?auto_98906 ?auto_98907 ) ) ( not ( = ?auto_98906 ?auto_98908 ) ) ( not ( = ?auto_98907 ?auto_98908 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98906 ?auto_98905 ?auto_98904 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_98921 - OBJ
      ?auto_98922 - OBJ
      ?auto_98923 - OBJ
      ?auto_98924 - OBJ
      ?auto_98920 - LOCATION
    )
    :vars
    (
      ?auto_98926 - TRUCK
      ?auto_98927 - LOCATION
      ?auto_98925 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_98926 ?auto_98927 ) ( IN-CITY ?auto_98927 ?auto_98925 ) ( IN-CITY ?auto_98920 ?auto_98925 ) ( not ( = ?auto_98920 ?auto_98927 ) ) ( OBJ-AT ?auto_98924 ?auto_98920 ) ( not ( = ?auto_98924 ?auto_98921 ) ) ( OBJ-AT ?auto_98921 ?auto_98927 ) ( OBJ-AT ?auto_98922 ?auto_98920 ) ( OBJ-AT ?auto_98923 ?auto_98920 ) ( not ( = ?auto_98921 ?auto_98922 ) ) ( not ( = ?auto_98921 ?auto_98923 ) ) ( not ( = ?auto_98922 ?auto_98923 ) ) ( not ( = ?auto_98922 ?auto_98924 ) ) ( not ( = ?auto_98923 ?auto_98924 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_98924 ?auto_98921 ?auto_98920 ) )
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
      ?auto_99007 - TRUCK
      ?auto_99008 - LOCATION
      ?auto_99006 - CITY
      ?auto_99005 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_99007 ?auto_99008 ) ( IN-CITY ?auto_99008 ?auto_99006 ) ( IN-CITY ?auto_99000 ?auto_99006 ) ( not ( = ?auto_99000 ?auto_99008 ) ) ( OBJ-AT ?auto_99005 ?auto_99000 ) ( not ( = ?auto_99005 ?auto_99001 ) ) ( OBJ-AT ?auto_99001 ?auto_99008 ) ( OBJ-AT ?auto_99002 ?auto_99000 ) ( OBJ-AT ?auto_99003 ?auto_99000 ) ( OBJ-AT ?auto_99004 ?auto_99000 ) ( not ( = ?auto_99001 ?auto_99002 ) ) ( not ( = ?auto_99001 ?auto_99003 ) ) ( not ( = ?auto_99001 ?auto_99004 ) ) ( not ( = ?auto_99002 ?auto_99003 ) ) ( not ( = ?auto_99002 ?auto_99004 ) ) ( not ( = ?auto_99002 ?auto_99005 ) ) ( not ( = ?auto_99003 ?auto_99004 ) ) ( not ( = ?auto_99003 ?auto_99005 ) ) ( not ( = ?auto_99004 ?auto_99005 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99005 ?auto_99001 ?auto_99000 ) )
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
      ?auto_99156 - LOCATION
      ?auto_99157 - CITY
      ?auto_99155 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99156 ?auto_99157 ) ( IN-CITY ?auto_99151 ?auto_99157 ) ( not ( = ?auto_99151 ?auto_99156 ) ) ( OBJ-AT ?auto_99153 ?auto_99151 ) ( not ( = ?auto_99153 ?auto_99154 ) ) ( OBJ-AT ?auto_99154 ?auto_99156 ) ( TRUCK-AT ?auto_99155 ?auto_99151 ) ( OBJ-AT ?auto_99152 ?auto_99151 ) ( not ( = ?auto_99152 ?auto_99153 ) ) ( not ( = ?auto_99152 ?auto_99154 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99153 ?auto_99154 ?auto_99151 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_99163 - OBJ
      ?auto_99164 - OBJ
      ?auto_99165 - OBJ
      ?auto_99162 - LOCATION
    )
    :vars
    (
      ?auto_99167 - LOCATION
      ?auto_99168 - CITY
      ?auto_99166 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99167 ?auto_99168 ) ( IN-CITY ?auto_99162 ?auto_99168 ) ( not ( = ?auto_99162 ?auto_99167 ) ) ( OBJ-AT ?auto_99165 ?auto_99162 ) ( not ( = ?auto_99165 ?auto_99164 ) ) ( OBJ-AT ?auto_99164 ?auto_99167 ) ( TRUCK-AT ?auto_99166 ?auto_99162 ) ( OBJ-AT ?auto_99163 ?auto_99162 ) ( not ( = ?auto_99163 ?auto_99164 ) ) ( not ( = ?auto_99163 ?auto_99165 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99165 ?auto_99164 ?auto_99162 ) )
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
      ?auto_99190 - LOCATION
      ?auto_99191 - CITY
      ?auto_99188 - OBJ
      ?auto_99189 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99190 ?auto_99191 ) ( IN-CITY ?auto_99184 ?auto_99191 ) ( not ( = ?auto_99184 ?auto_99190 ) ) ( OBJ-AT ?auto_99188 ?auto_99184 ) ( not ( = ?auto_99188 ?auto_99187 ) ) ( OBJ-AT ?auto_99187 ?auto_99190 ) ( TRUCK-AT ?auto_99189 ?auto_99184 ) ( OBJ-AT ?auto_99185 ?auto_99184 ) ( OBJ-AT ?auto_99186 ?auto_99184 ) ( not ( = ?auto_99185 ?auto_99186 ) ) ( not ( = ?auto_99185 ?auto_99187 ) ) ( not ( = ?auto_99185 ?auto_99188 ) ) ( not ( = ?auto_99186 ?auto_99187 ) ) ( not ( = ?auto_99186 ?auto_99188 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99188 ?auto_99187 ?auto_99184 ) )
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
      ?auto_99202 - LOCATION
      ?auto_99203 - CITY
      ?auto_99200 - OBJ
      ?auto_99201 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99202 ?auto_99203 ) ( IN-CITY ?auto_99196 ?auto_99203 ) ( not ( = ?auto_99196 ?auto_99202 ) ) ( OBJ-AT ?auto_99200 ?auto_99196 ) ( not ( = ?auto_99200 ?auto_99198 ) ) ( OBJ-AT ?auto_99198 ?auto_99202 ) ( TRUCK-AT ?auto_99201 ?auto_99196 ) ( OBJ-AT ?auto_99197 ?auto_99196 ) ( OBJ-AT ?auto_99199 ?auto_99196 ) ( not ( = ?auto_99197 ?auto_99198 ) ) ( not ( = ?auto_99197 ?auto_99199 ) ) ( not ( = ?auto_99197 ?auto_99200 ) ) ( not ( = ?auto_99198 ?auto_99199 ) ) ( not ( = ?auto_99199 ?auto_99200 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99200 ?auto_99198 ?auto_99196 ) )
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
      ?auto_99217 - LOCATION
      ?auto_99218 - CITY
      ?auto_99216 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99217 ?auto_99218 ) ( IN-CITY ?auto_99212 ?auto_99218 ) ( not ( = ?auto_99212 ?auto_99217 ) ) ( OBJ-AT ?auto_99215 ?auto_99212 ) ( not ( = ?auto_99215 ?auto_99213 ) ) ( OBJ-AT ?auto_99213 ?auto_99217 ) ( TRUCK-AT ?auto_99216 ?auto_99212 ) ( OBJ-AT ?auto_99214 ?auto_99212 ) ( not ( = ?auto_99213 ?auto_99214 ) ) ( not ( = ?auto_99214 ?auto_99215 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99215 ?auto_99213 ?auto_99212 ) )
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
      ?auto_99240 - LOCATION
      ?auto_99241 - CITY
      ?auto_99238 - OBJ
      ?auto_99239 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99240 ?auto_99241 ) ( IN-CITY ?auto_99234 ?auto_99241 ) ( not ( = ?auto_99234 ?auto_99240 ) ) ( OBJ-AT ?auto_99238 ?auto_99234 ) ( not ( = ?auto_99238 ?auto_99235 ) ) ( OBJ-AT ?auto_99235 ?auto_99240 ) ( TRUCK-AT ?auto_99239 ?auto_99234 ) ( OBJ-AT ?auto_99236 ?auto_99234 ) ( OBJ-AT ?auto_99237 ?auto_99234 ) ( not ( = ?auto_99235 ?auto_99236 ) ) ( not ( = ?auto_99235 ?auto_99237 ) ) ( not ( = ?auto_99236 ?auto_99237 ) ) ( not ( = ?auto_99236 ?auto_99238 ) ) ( not ( = ?auto_99237 ?auto_99238 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99238 ?auto_99235 ?auto_99234 ) )
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
      ?auto_99279 - LOCATION
      ?auto_99280 - CITY
      ?auto_99278 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99279 ?auto_99280 ) ( IN-CITY ?auto_99273 ?auto_99280 ) ( not ( = ?auto_99273 ?auto_99279 ) ) ( OBJ-AT ?auto_99276 ?auto_99273 ) ( not ( = ?auto_99276 ?auto_99277 ) ) ( OBJ-AT ?auto_99277 ?auto_99279 ) ( TRUCK-AT ?auto_99278 ?auto_99273 ) ( OBJ-AT ?auto_99274 ?auto_99273 ) ( OBJ-AT ?auto_99275 ?auto_99273 ) ( not ( = ?auto_99274 ?auto_99275 ) ) ( not ( = ?auto_99274 ?auto_99276 ) ) ( not ( = ?auto_99274 ?auto_99277 ) ) ( not ( = ?auto_99275 ?auto_99276 ) ) ( not ( = ?auto_99275 ?auto_99277 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99276 ?auto_99277 ?auto_99273 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99282 - OBJ
      ?auto_99283 - OBJ
      ?auto_99284 - OBJ
      ?auto_99285 - OBJ
      ?auto_99281 - LOCATION
    )
    :vars
    (
      ?auto_99287 - LOCATION
      ?auto_99288 - CITY
      ?auto_99286 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99287 ?auto_99288 ) ( IN-CITY ?auto_99281 ?auto_99288 ) ( not ( = ?auto_99281 ?auto_99287 ) ) ( OBJ-AT ?auto_99282 ?auto_99281 ) ( not ( = ?auto_99282 ?auto_99285 ) ) ( OBJ-AT ?auto_99285 ?auto_99287 ) ( TRUCK-AT ?auto_99286 ?auto_99281 ) ( OBJ-AT ?auto_99283 ?auto_99281 ) ( OBJ-AT ?auto_99284 ?auto_99281 ) ( not ( = ?auto_99282 ?auto_99283 ) ) ( not ( = ?auto_99282 ?auto_99284 ) ) ( not ( = ?auto_99283 ?auto_99284 ) ) ( not ( = ?auto_99283 ?auto_99285 ) ) ( not ( = ?auto_99284 ?auto_99285 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99282 ?auto_99285 ?auto_99281 ) )
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
      ?auto_99295 - LOCATION
      ?auto_99296 - CITY
      ?auto_99294 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99295 ?auto_99296 ) ( IN-CITY ?auto_99289 ?auto_99296 ) ( not ( = ?auto_99289 ?auto_99295 ) ) ( OBJ-AT ?auto_99293 ?auto_99289 ) ( not ( = ?auto_99293 ?auto_99292 ) ) ( OBJ-AT ?auto_99292 ?auto_99295 ) ( TRUCK-AT ?auto_99294 ?auto_99289 ) ( OBJ-AT ?auto_99290 ?auto_99289 ) ( OBJ-AT ?auto_99291 ?auto_99289 ) ( not ( = ?auto_99290 ?auto_99291 ) ) ( not ( = ?auto_99290 ?auto_99292 ) ) ( not ( = ?auto_99290 ?auto_99293 ) ) ( not ( = ?auto_99291 ?auto_99292 ) ) ( not ( = ?auto_99291 ?auto_99293 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99293 ?auto_99292 ?auto_99289 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99298 - OBJ
      ?auto_99299 - OBJ
      ?auto_99300 - OBJ
      ?auto_99301 - OBJ
      ?auto_99297 - LOCATION
    )
    :vars
    (
      ?auto_99303 - LOCATION
      ?auto_99304 - CITY
      ?auto_99302 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99303 ?auto_99304 ) ( IN-CITY ?auto_99297 ?auto_99304 ) ( not ( = ?auto_99297 ?auto_99303 ) ) ( OBJ-AT ?auto_99298 ?auto_99297 ) ( not ( = ?auto_99298 ?auto_99300 ) ) ( OBJ-AT ?auto_99300 ?auto_99303 ) ( TRUCK-AT ?auto_99302 ?auto_99297 ) ( OBJ-AT ?auto_99299 ?auto_99297 ) ( OBJ-AT ?auto_99301 ?auto_99297 ) ( not ( = ?auto_99298 ?auto_99299 ) ) ( not ( = ?auto_99298 ?auto_99301 ) ) ( not ( = ?auto_99299 ?auto_99300 ) ) ( not ( = ?auto_99299 ?auto_99301 ) ) ( not ( = ?auto_99300 ?auto_99301 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99298 ?auto_99300 ?auto_99297 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99362 - OBJ
      ?auto_99363 - OBJ
      ?auto_99364 - OBJ
      ?auto_99365 - OBJ
      ?auto_99361 - LOCATION
    )
    :vars
    (
      ?auto_99367 - LOCATION
      ?auto_99368 - CITY
      ?auto_99366 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99367 ?auto_99368 ) ( IN-CITY ?auto_99361 ?auto_99368 ) ( not ( = ?auto_99361 ?auto_99367 ) ) ( OBJ-AT ?auto_99362 ?auto_99361 ) ( not ( = ?auto_99362 ?auto_99363 ) ) ( OBJ-AT ?auto_99363 ?auto_99367 ) ( TRUCK-AT ?auto_99366 ?auto_99361 ) ( OBJ-AT ?auto_99364 ?auto_99361 ) ( OBJ-AT ?auto_99365 ?auto_99361 ) ( not ( = ?auto_99362 ?auto_99364 ) ) ( not ( = ?auto_99362 ?auto_99365 ) ) ( not ( = ?auto_99363 ?auto_99364 ) ) ( not ( = ?auto_99363 ?auto_99365 ) ) ( not ( = ?auto_99364 ?auto_99365 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99362 ?auto_99363 ?auto_99361 ) )
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
      ?auto_99480 - LOCATION
      ?auto_99481 - CITY
      ?auto_99478 - OBJ
      ?auto_99479 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99480 ?auto_99481 ) ( IN-CITY ?auto_99473 ?auto_99481 ) ( not ( = ?auto_99473 ?auto_99480 ) ) ( OBJ-AT ?auto_99478 ?auto_99473 ) ( not ( = ?auto_99478 ?auto_99477 ) ) ( OBJ-AT ?auto_99477 ?auto_99480 ) ( TRUCK-AT ?auto_99479 ?auto_99473 ) ( OBJ-AT ?auto_99474 ?auto_99473 ) ( OBJ-AT ?auto_99475 ?auto_99473 ) ( OBJ-AT ?auto_99476 ?auto_99473 ) ( not ( = ?auto_99474 ?auto_99475 ) ) ( not ( = ?auto_99474 ?auto_99476 ) ) ( not ( = ?auto_99474 ?auto_99477 ) ) ( not ( = ?auto_99474 ?auto_99478 ) ) ( not ( = ?auto_99475 ?auto_99476 ) ) ( not ( = ?auto_99475 ?auto_99477 ) ) ( not ( = ?auto_99475 ?auto_99478 ) ) ( not ( = ?auto_99476 ?auto_99477 ) ) ( not ( = ?auto_99476 ?auto_99478 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99478 ?auto_99477 ?auto_99473 ) )
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
      ?auto_99497 - LOCATION
      ?auto_99498 - CITY
      ?auto_99495 - OBJ
      ?auto_99496 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99497 ?auto_99498 ) ( IN-CITY ?auto_99490 ?auto_99498 ) ( not ( = ?auto_99490 ?auto_99497 ) ) ( OBJ-AT ?auto_99495 ?auto_99490 ) ( not ( = ?auto_99495 ?auto_99493 ) ) ( OBJ-AT ?auto_99493 ?auto_99497 ) ( TRUCK-AT ?auto_99496 ?auto_99490 ) ( OBJ-AT ?auto_99491 ?auto_99490 ) ( OBJ-AT ?auto_99492 ?auto_99490 ) ( OBJ-AT ?auto_99494 ?auto_99490 ) ( not ( = ?auto_99491 ?auto_99492 ) ) ( not ( = ?auto_99491 ?auto_99493 ) ) ( not ( = ?auto_99491 ?auto_99494 ) ) ( not ( = ?auto_99491 ?auto_99495 ) ) ( not ( = ?auto_99492 ?auto_99493 ) ) ( not ( = ?auto_99492 ?auto_99494 ) ) ( not ( = ?auto_99492 ?auto_99495 ) ) ( not ( = ?auto_99493 ?auto_99494 ) ) ( not ( = ?auto_99494 ?auto_99495 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99495 ?auto_99493 ?auto_99490 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99509 - OBJ
      ?auto_99510 - OBJ
      ?auto_99511 - OBJ
      ?auto_99512 - OBJ
      ?auto_99508 - LOCATION
    )
    :vars
    (
      ?auto_99514 - LOCATION
      ?auto_99515 - CITY
      ?auto_99513 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99514 ?auto_99515 ) ( IN-CITY ?auto_99508 ?auto_99515 ) ( not ( = ?auto_99508 ?auto_99514 ) ) ( OBJ-AT ?auto_99512 ?auto_99508 ) ( not ( = ?auto_99512 ?auto_99510 ) ) ( OBJ-AT ?auto_99510 ?auto_99514 ) ( TRUCK-AT ?auto_99513 ?auto_99508 ) ( OBJ-AT ?auto_99509 ?auto_99508 ) ( OBJ-AT ?auto_99511 ?auto_99508 ) ( not ( = ?auto_99509 ?auto_99510 ) ) ( not ( = ?auto_99509 ?auto_99511 ) ) ( not ( = ?auto_99509 ?auto_99512 ) ) ( not ( = ?auto_99510 ?auto_99511 ) ) ( not ( = ?auto_99511 ?auto_99512 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99512 ?auto_99510 ?auto_99508 ) )
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
      ?auto_99547 - LOCATION
      ?auto_99548 - CITY
      ?auto_99545 - OBJ
      ?auto_99546 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99547 ?auto_99548 ) ( IN-CITY ?auto_99540 ?auto_99548 ) ( not ( = ?auto_99540 ?auto_99547 ) ) ( OBJ-AT ?auto_99545 ?auto_99540 ) ( not ( = ?auto_99545 ?auto_99542 ) ) ( OBJ-AT ?auto_99542 ?auto_99547 ) ( TRUCK-AT ?auto_99546 ?auto_99540 ) ( OBJ-AT ?auto_99541 ?auto_99540 ) ( OBJ-AT ?auto_99543 ?auto_99540 ) ( OBJ-AT ?auto_99544 ?auto_99540 ) ( not ( = ?auto_99541 ?auto_99542 ) ) ( not ( = ?auto_99541 ?auto_99543 ) ) ( not ( = ?auto_99541 ?auto_99544 ) ) ( not ( = ?auto_99541 ?auto_99545 ) ) ( not ( = ?auto_99542 ?auto_99543 ) ) ( not ( = ?auto_99542 ?auto_99544 ) ) ( not ( = ?auto_99543 ?auto_99544 ) ) ( not ( = ?auto_99543 ?auto_99545 ) ) ( not ( = ?auto_99544 ?auto_99545 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99545 ?auto_99542 ?auto_99540 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99585 - OBJ
      ?auto_99586 - OBJ
      ?auto_99587 - OBJ
      ?auto_99588 - OBJ
      ?auto_99584 - LOCATION
    )
    :vars
    (
      ?auto_99590 - LOCATION
      ?auto_99591 - CITY
      ?auto_99589 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99590 ?auto_99591 ) ( IN-CITY ?auto_99584 ?auto_99591 ) ( not ( = ?auto_99584 ?auto_99590 ) ) ( OBJ-AT ?auto_99586 ?auto_99584 ) ( not ( = ?auto_99586 ?auto_99585 ) ) ( OBJ-AT ?auto_99585 ?auto_99590 ) ( TRUCK-AT ?auto_99589 ?auto_99584 ) ( OBJ-AT ?auto_99587 ?auto_99584 ) ( OBJ-AT ?auto_99588 ?auto_99584 ) ( not ( = ?auto_99585 ?auto_99587 ) ) ( not ( = ?auto_99585 ?auto_99588 ) ) ( not ( = ?auto_99586 ?auto_99587 ) ) ( not ( = ?auto_99586 ?auto_99588 ) ) ( not ( = ?auto_99587 ?auto_99588 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99586 ?auto_99585 ?auto_99584 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_99657 - OBJ
      ?auto_99658 - OBJ
      ?auto_99659 - OBJ
      ?auto_99660 - OBJ
      ?auto_99656 - LOCATION
    )
    :vars
    (
      ?auto_99662 - LOCATION
      ?auto_99663 - CITY
      ?auto_99661 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99662 ?auto_99663 ) ( IN-CITY ?auto_99656 ?auto_99663 ) ( not ( = ?auto_99656 ?auto_99662 ) ) ( OBJ-AT ?auto_99659 ?auto_99656 ) ( not ( = ?auto_99659 ?auto_99657 ) ) ( OBJ-AT ?auto_99657 ?auto_99662 ) ( TRUCK-AT ?auto_99661 ?auto_99656 ) ( OBJ-AT ?auto_99658 ?auto_99656 ) ( OBJ-AT ?auto_99660 ?auto_99656 ) ( not ( = ?auto_99657 ?auto_99658 ) ) ( not ( = ?auto_99657 ?auto_99660 ) ) ( not ( = ?auto_99658 ?auto_99659 ) ) ( not ( = ?auto_99658 ?auto_99660 ) ) ( not ( = ?auto_99659 ?auto_99660 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99659 ?auto_99657 ?auto_99656 ) )
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
      ?auto_99695 - LOCATION
      ?auto_99696 - CITY
      ?auto_99693 - OBJ
      ?auto_99694 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_99695 ?auto_99696 ) ( IN-CITY ?auto_99688 ?auto_99696 ) ( not ( = ?auto_99688 ?auto_99695 ) ) ( OBJ-AT ?auto_99693 ?auto_99688 ) ( not ( = ?auto_99693 ?auto_99689 ) ) ( OBJ-AT ?auto_99689 ?auto_99695 ) ( TRUCK-AT ?auto_99694 ?auto_99688 ) ( OBJ-AT ?auto_99690 ?auto_99688 ) ( OBJ-AT ?auto_99691 ?auto_99688 ) ( OBJ-AT ?auto_99692 ?auto_99688 ) ( not ( = ?auto_99689 ?auto_99690 ) ) ( not ( = ?auto_99689 ?auto_99691 ) ) ( not ( = ?auto_99689 ?auto_99692 ) ) ( not ( = ?auto_99690 ?auto_99691 ) ) ( not ( = ?auto_99690 ?auto_99692 ) ) ( not ( = ?auto_99690 ?auto_99693 ) ) ( not ( = ?auto_99691 ?auto_99692 ) ) ( not ( = ?auto_99691 ?auto_99693 ) ) ( not ( = ?auto_99692 ?auto_99693 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_99693 ?auto_99689 ?auto_99688 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_101319 - OBJ
      ?auto_101320 - OBJ
      ?auto_101321 - OBJ
      ?auto_101318 - LOCATION
    )
    :vars
    (
      ?auto_101324 - TRUCK
      ?auto_101323 - LOCATION
      ?auto_101322 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_101324 ?auto_101323 ) ( IN-CITY ?auto_101323 ?auto_101322 ) ( IN-CITY ?auto_101318 ?auto_101322 ) ( not ( = ?auto_101318 ?auto_101323 ) ) ( OBJ-AT ?auto_101321 ?auto_101318 ) ( not ( = ?auto_101321 ?auto_101319 ) ) ( OBJ-AT ?auto_101319 ?auto_101323 ) ( OBJ-AT ?auto_101320 ?auto_101318 ) ( not ( = ?auto_101319 ?auto_101320 ) ) ( not ( = ?auto_101320 ?auto_101321 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_101321 ?auto_101319 ?auto_101318 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_107898 - OBJ
      ?auto_107899 - OBJ
      ?auto_107900 - OBJ
      ?auto_107897 - LOCATION
    )
    :vars
    (
      ?auto_107902 - TRUCK
      ?auto_107901 - LOCATION
      ?auto_107903 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_107900 ?auto_107902 ) ( TRUCK-AT ?auto_107902 ?auto_107901 ) ( IN-CITY ?auto_107901 ?auto_107903 ) ( IN-CITY ?auto_107897 ?auto_107903 ) ( not ( = ?auto_107897 ?auto_107901 ) ) ( OBJ-AT ?auto_107898 ?auto_107897 ) ( not ( = ?auto_107898 ?auto_107900 ) ) ( OBJ-AT ?auto_107899 ?auto_107897 ) ( not ( = ?auto_107898 ?auto_107899 ) ) ( not ( = ?auto_107899 ?auto_107900 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_107898 ?auto_107900 ?auto_107897 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_116378 - OBJ
      ?auto_116379 - OBJ
      ?auto_116380 - OBJ
      ?auto_116377 - LOCATION
    )
    :vars
    (
      ?auto_116382 - TRUCK
      ?auto_116383 - LOCATION
      ?auto_116381 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_116382 ?auto_116383 ) ( IN-CITY ?auto_116383 ?auto_116381 ) ( IN-CITY ?auto_116377 ?auto_116381 ) ( not ( = ?auto_116377 ?auto_116383 ) ) ( OBJ-AT ?auto_116378 ?auto_116377 ) ( not ( = ?auto_116378 ?auto_116379 ) ) ( OBJ-AT ?auto_116379 ?auto_116383 ) ( OBJ-AT ?auto_116380 ?auto_116377 ) ( not ( = ?auto_116378 ?auto_116380 ) ) ( not ( = ?auto_116379 ?auto_116380 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_116378 ?auto_116379 ?auto_116377 ) )
  )

)

