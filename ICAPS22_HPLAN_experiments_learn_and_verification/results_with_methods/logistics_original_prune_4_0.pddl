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
      ?auto_15109 - OBJ
      ?auto_15108 - LOCATION
    )
    :vars
    (
      ?auto_15110 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15110 ?auto_15108 ) ( IN-TRUCK ?auto_15109 ?auto_15110 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_15109 ?auto_15110 ?auto_15108 )
      ( DELIVER-1PKG-VERIFY ?auto_15109 ?auto_15108 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15127 - OBJ
      ?auto_15126 - LOCATION
    )
    :vars
    (
      ?auto_15128 - TRUCK
      ?auto_15129 - LOCATION
      ?auto_15130 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15127 ?auto_15128 ) ( TRUCK-AT ?auto_15128 ?auto_15129 ) ( IN-CITY ?auto_15129 ?auto_15130 ) ( IN-CITY ?auto_15126 ?auto_15130 ) ( not ( = ?auto_15126 ?auto_15129 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15128 ?auto_15129 ?auto_15126 ?auto_15130 )
      ( DELIVER-1PKG ?auto_15127 ?auto_15126 )
      ( DELIVER-1PKG-VERIFY ?auto_15127 ?auto_15126 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15153 - OBJ
      ?auto_15152 - LOCATION
    )
    :vars
    (
      ?auto_15156 - TRUCK
      ?auto_15154 - LOCATION
      ?auto_15155 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15156 ?auto_15154 ) ( IN-CITY ?auto_15154 ?auto_15155 ) ( IN-CITY ?auto_15152 ?auto_15155 ) ( not ( = ?auto_15152 ?auto_15154 ) ) ( OBJ-AT ?auto_15153 ?auto_15154 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15153 ?auto_15156 ?auto_15154 )
      ( DELIVER-1PKG ?auto_15153 ?auto_15152 )
      ( DELIVER-1PKG-VERIFY ?auto_15153 ?auto_15152 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15179 - OBJ
      ?auto_15178 - LOCATION
    )
    :vars
    (
      ?auto_15181 - LOCATION
      ?auto_15182 - CITY
      ?auto_15180 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15181 ?auto_15182 ) ( IN-CITY ?auto_15178 ?auto_15182 ) ( not ( = ?auto_15178 ?auto_15181 ) ) ( OBJ-AT ?auto_15179 ?auto_15181 ) ( TRUCK-AT ?auto_15180 ?auto_15178 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15180 ?auto_15178 ?auto_15181 ?auto_15182 )
      ( DELIVER-1PKG ?auto_15179 ?auto_15178 )
      ( DELIVER-1PKG-VERIFY ?auto_15179 ?auto_15178 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15322 - OBJ
      ?auto_15323 - OBJ
      ?auto_15321 - LOCATION
    )
    :vars
    (
      ?auto_15324 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15324 ?auto_15321 ) ( IN-TRUCK ?auto_15323 ?auto_15324 ) ( OBJ-AT ?auto_15322 ?auto_15321 ) ( not ( = ?auto_15322 ?auto_15323 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15323 ?auto_15321 )
      ( DELIVER-2PKG-VERIFY ?auto_15322 ?auto_15323 ?auto_15321 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15326 - OBJ
      ?auto_15327 - OBJ
      ?auto_15325 - LOCATION
    )
    :vars
    (
      ?auto_15328 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15328 ?auto_15325 ) ( IN-TRUCK ?auto_15326 ?auto_15328 ) ( OBJ-AT ?auto_15327 ?auto_15325 ) ( not ( = ?auto_15326 ?auto_15327 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15326 ?auto_15325 )
      ( DELIVER-2PKG-VERIFY ?auto_15326 ?auto_15327 ?auto_15325 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15334 - OBJ
      ?auto_15335 - OBJ
      ?auto_15336 - OBJ
      ?auto_15333 - LOCATION
    )
    :vars
    (
      ?auto_15337 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15337 ?auto_15333 ) ( IN-TRUCK ?auto_15336 ?auto_15337 ) ( OBJ-AT ?auto_15334 ?auto_15333 ) ( OBJ-AT ?auto_15335 ?auto_15333 ) ( not ( = ?auto_15334 ?auto_15335 ) ) ( not ( = ?auto_15334 ?auto_15336 ) ) ( not ( = ?auto_15335 ?auto_15336 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15336 ?auto_15333 )
      ( DELIVER-3PKG-VERIFY ?auto_15334 ?auto_15335 ?auto_15336 ?auto_15333 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15339 - OBJ
      ?auto_15340 - OBJ
      ?auto_15341 - OBJ
      ?auto_15338 - LOCATION
    )
    :vars
    (
      ?auto_15342 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15342 ?auto_15338 ) ( IN-TRUCK ?auto_15340 ?auto_15342 ) ( OBJ-AT ?auto_15339 ?auto_15338 ) ( OBJ-AT ?auto_15341 ?auto_15338 ) ( not ( = ?auto_15339 ?auto_15340 ) ) ( not ( = ?auto_15339 ?auto_15341 ) ) ( not ( = ?auto_15340 ?auto_15341 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15340 ?auto_15338 )
      ( DELIVER-3PKG-VERIFY ?auto_15339 ?auto_15340 ?auto_15341 ?auto_15338 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15349 - OBJ
      ?auto_15350 - OBJ
      ?auto_15351 - OBJ
      ?auto_15348 - LOCATION
    )
    :vars
    (
      ?auto_15352 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15352 ?auto_15348 ) ( IN-TRUCK ?auto_15349 ?auto_15352 ) ( OBJ-AT ?auto_15350 ?auto_15348 ) ( OBJ-AT ?auto_15351 ?auto_15348 ) ( not ( = ?auto_15349 ?auto_15350 ) ) ( not ( = ?auto_15349 ?auto_15351 ) ) ( not ( = ?auto_15350 ?auto_15351 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15349 ?auto_15348 )
      ( DELIVER-3PKG-VERIFY ?auto_15349 ?auto_15350 ?auto_15351 ?auto_15348 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15369 - OBJ
      ?auto_15370 - OBJ
      ?auto_15371 - OBJ
      ?auto_15372 - OBJ
      ?auto_15368 - LOCATION
    )
    :vars
    (
      ?auto_15373 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15373 ?auto_15368 ) ( IN-TRUCK ?auto_15372 ?auto_15373 ) ( OBJ-AT ?auto_15369 ?auto_15368 ) ( OBJ-AT ?auto_15370 ?auto_15368 ) ( OBJ-AT ?auto_15371 ?auto_15368 ) ( not ( = ?auto_15369 ?auto_15370 ) ) ( not ( = ?auto_15369 ?auto_15371 ) ) ( not ( = ?auto_15369 ?auto_15372 ) ) ( not ( = ?auto_15370 ?auto_15371 ) ) ( not ( = ?auto_15370 ?auto_15372 ) ) ( not ( = ?auto_15371 ?auto_15372 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15372 ?auto_15368 )
      ( DELIVER-4PKG-VERIFY ?auto_15369 ?auto_15370 ?auto_15371 ?auto_15372 ?auto_15368 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15375 - OBJ
      ?auto_15376 - OBJ
      ?auto_15377 - OBJ
      ?auto_15378 - OBJ
      ?auto_15374 - LOCATION
    )
    :vars
    (
      ?auto_15379 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15379 ?auto_15374 ) ( IN-TRUCK ?auto_15377 ?auto_15379 ) ( OBJ-AT ?auto_15375 ?auto_15374 ) ( OBJ-AT ?auto_15376 ?auto_15374 ) ( OBJ-AT ?auto_15378 ?auto_15374 ) ( not ( = ?auto_15375 ?auto_15376 ) ) ( not ( = ?auto_15375 ?auto_15377 ) ) ( not ( = ?auto_15375 ?auto_15378 ) ) ( not ( = ?auto_15376 ?auto_15377 ) ) ( not ( = ?auto_15376 ?auto_15378 ) ) ( not ( = ?auto_15377 ?auto_15378 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15377 ?auto_15374 )
      ( DELIVER-4PKG-VERIFY ?auto_15375 ?auto_15376 ?auto_15377 ?auto_15378 ?auto_15374 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15387 - OBJ
      ?auto_15388 - OBJ
      ?auto_15389 - OBJ
      ?auto_15390 - OBJ
      ?auto_15386 - LOCATION
    )
    :vars
    (
      ?auto_15391 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15391 ?auto_15386 ) ( IN-TRUCK ?auto_15388 ?auto_15391 ) ( OBJ-AT ?auto_15387 ?auto_15386 ) ( OBJ-AT ?auto_15389 ?auto_15386 ) ( OBJ-AT ?auto_15390 ?auto_15386 ) ( not ( = ?auto_15387 ?auto_15388 ) ) ( not ( = ?auto_15387 ?auto_15389 ) ) ( not ( = ?auto_15387 ?auto_15390 ) ) ( not ( = ?auto_15388 ?auto_15389 ) ) ( not ( = ?auto_15388 ?auto_15390 ) ) ( not ( = ?auto_15389 ?auto_15390 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15388 ?auto_15386 )
      ( DELIVER-4PKG-VERIFY ?auto_15387 ?auto_15388 ?auto_15389 ?auto_15390 ?auto_15386 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15411 - OBJ
      ?auto_15412 - OBJ
      ?auto_15413 - OBJ
      ?auto_15414 - OBJ
      ?auto_15410 - LOCATION
    )
    :vars
    (
      ?auto_15415 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15415 ?auto_15410 ) ( IN-TRUCK ?auto_15411 ?auto_15415 ) ( OBJ-AT ?auto_15412 ?auto_15410 ) ( OBJ-AT ?auto_15413 ?auto_15410 ) ( OBJ-AT ?auto_15414 ?auto_15410 ) ( not ( = ?auto_15411 ?auto_15412 ) ) ( not ( = ?auto_15411 ?auto_15413 ) ) ( not ( = ?auto_15411 ?auto_15414 ) ) ( not ( = ?auto_15412 ?auto_15413 ) ) ( not ( = ?auto_15412 ?auto_15414 ) ) ( not ( = ?auto_15413 ?auto_15414 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15411 ?auto_15410 )
      ( DELIVER-4PKG-VERIFY ?auto_15411 ?auto_15412 ?auto_15413 ?auto_15414 ?auto_15410 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15464 - OBJ
      ?auto_15465 - OBJ
      ?auto_15463 - LOCATION
    )
    :vars
    (
      ?auto_15468 - TRUCK
      ?auto_15467 - LOCATION
      ?auto_15466 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15465 ?auto_15468 ) ( TRUCK-AT ?auto_15468 ?auto_15467 ) ( IN-CITY ?auto_15467 ?auto_15466 ) ( IN-CITY ?auto_15463 ?auto_15466 ) ( not ( = ?auto_15463 ?auto_15467 ) ) ( OBJ-AT ?auto_15464 ?auto_15463 ) ( not ( = ?auto_15464 ?auto_15465 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15465 ?auto_15463 )
      ( DELIVER-2PKG-VERIFY ?auto_15464 ?auto_15465 ?auto_15463 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15470 - OBJ
      ?auto_15471 - OBJ
      ?auto_15469 - LOCATION
    )
    :vars
    (
      ?auto_15472 - TRUCK
      ?auto_15473 - LOCATION
      ?auto_15474 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15470 ?auto_15472 ) ( TRUCK-AT ?auto_15472 ?auto_15473 ) ( IN-CITY ?auto_15473 ?auto_15474 ) ( IN-CITY ?auto_15469 ?auto_15474 ) ( not ( = ?auto_15469 ?auto_15473 ) ) ( OBJ-AT ?auto_15471 ?auto_15469 ) ( not ( = ?auto_15471 ?auto_15470 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15471 ?auto_15470 ?auto_15469 )
      ( DELIVER-2PKG-VERIFY ?auto_15470 ?auto_15471 ?auto_15469 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15483 - OBJ
      ?auto_15484 - OBJ
      ?auto_15485 - OBJ
      ?auto_15482 - LOCATION
    )
    :vars
    (
      ?auto_15486 - TRUCK
      ?auto_15487 - LOCATION
      ?auto_15488 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15485 ?auto_15486 ) ( TRUCK-AT ?auto_15486 ?auto_15487 ) ( IN-CITY ?auto_15487 ?auto_15488 ) ( IN-CITY ?auto_15482 ?auto_15488 ) ( not ( = ?auto_15482 ?auto_15487 ) ) ( OBJ-AT ?auto_15484 ?auto_15482 ) ( not ( = ?auto_15484 ?auto_15485 ) ) ( OBJ-AT ?auto_15483 ?auto_15482 ) ( not ( = ?auto_15483 ?auto_15484 ) ) ( not ( = ?auto_15483 ?auto_15485 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15484 ?auto_15485 ?auto_15482 )
      ( DELIVER-3PKG-VERIFY ?auto_15483 ?auto_15484 ?auto_15485 ?auto_15482 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15490 - OBJ
      ?auto_15491 - OBJ
      ?auto_15492 - OBJ
      ?auto_15489 - LOCATION
    )
    :vars
    (
      ?auto_15493 - TRUCK
      ?auto_15494 - LOCATION
      ?auto_15495 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15491 ?auto_15493 ) ( TRUCK-AT ?auto_15493 ?auto_15494 ) ( IN-CITY ?auto_15494 ?auto_15495 ) ( IN-CITY ?auto_15489 ?auto_15495 ) ( not ( = ?auto_15489 ?auto_15494 ) ) ( OBJ-AT ?auto_15490 ?auto_15489 ) ( not ( = ?auto_15490 ?auto_15491 ) ) ( OBJ-AT ?auto_15492 ?auto_15489 ) ( not ( = ?auto_15490 ?auto_15492 ) ) ( not ( = ?auto_15491 ?auto_15492 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15490 ?auto_15491 ?auto_15489 )
      ( DELIVER-3PKG-VERIFY ?auto_15490 ?auto_15491 ?auto_15492 ?auto_15489 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15504 - OBJ
      ?auto_15505 - OBJ
      ?auto_15506 - OBJ
      ?auto_15503 - LOCATION
    )
    :vars
    (
      ?auto_15507 - TRUCK
      ?auto_15508 - LOCATION
      ?auto_15509 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15504 ?auto_15507 ) ( TRUCK-AT ?auto_15507 ?auto_15508 ) ( IN-CITY ?auto_15508 ?auto_15509 ) ( IN-CITY ?auto_15503 ?auto_15509 ) ( not ( = ?auto_15503 ?auto_15508 ) ) ( OBJ-AT ?auto_15505 ?auto_15503 ) ( not ( = ?auto_15505 ?auto_15504 ) ) ( OBJ-AT ?auto_15506 ?auto_15503 ) ( not ( = ?auto_15504 ?auto_15506 ) ) ( not ( = ?auto_15505 ?auto_15506 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15505 ?auto_15504 ?auto_15503 )
      ( DELIVER-3PKG-VERIFY ?auto_15504 ?auto_15505 ?auto_15506 ?auto_15503 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15533 - OBJ
      ?auto_15534 - OBJ
      ?auto_15535 - OBJ
      ?auto_15536 - OBJ
      ?auto_15532 - LOCATION
    )
    :vars
    (
      ?auto_15537 - TRUCK
      ?auto_15538 - LOCATION
      ?auto_15539 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15536 ?auto_15537 ) ( TRUCK-AT ?auto_15537 ?auto_15538 ) ( IN-CITY ?auto_15538 ?auto_15539 ) ( IN-CITY ?auto_15532 ?auto_15539 ) ( not ( = ?auto_15532 ?auto_15538 ) ) ( OBJ-AT ?auto_15534 ?auto_15532 ) ( not ( = ?auto_15534 ?auto_15536 ) ) ( OBJ-AT ?auto_15533 ?auto_15532 ) ( OBJ-AT ?auto_15535 ?auto_15532 ) ( not ( = ?auto_15533 ?auto_15534 ) ) ( not ( = ?auto_15533 ?auto_15535 ) ) ( not ( = ?auto_15533 ?auto_15536 ) ) ( not ( = ?auto_15534 ?auto_15535 ) ) ( not ( = ?auto_15535 ?auto_15536 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15534 ?auto_15536 ?auto_15532 )
      ( DELIVER-4PKG-VERIFY ?auto_15533 ?auto_15534 ?auto_15535 ?auto_15536 ?auto_15532 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15541 - OBJ
      ?auto_15542 - OBJ
      ?auto_15543 - OBJ
      ?auto_15544 - OBJ
      ?auto_15540 - LOCATION
    )
    :vars
    (
      ?auto_15545 - TRUCK
      ?auto_15546 - LOCATION
      ?auto_15547 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15543 ?auto_15545 ) ( TRUCK-AT ?auto_15545 ?auto_15546 ) ( IN-CITY ?auto_15546 ?auto_15547 ) ( IN-CITY ?auto_15540 ?auto_15547 ) ( not ( = ?auto_15540 ?auto_15546 ) ) ( OBJ-AT ?auto_15542 ?auto_15540 ) ( not ( = ?auto_15542 ?auto_15543 ) ) ( OBJ-AT ?auto_15541 ?auto_15540 ) ( OBJ-AT ?auto_15544 ?auto_15540 ) ( not ( = ?auto_15541 ?auto_15542 ) ) ( not ( = ?auto_15541 ?auto_15543 ) ) ( not ( = ?auto_15541 ?auto_15544 ) ) ( not ( = ?auto_15542 ?auto_15544 ) ) ( not ( = ?auto_15543 ?auto_15544 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15542 ?auto_15543 ?auto_15540 )
      ( DELIVER-4PKG-VERIFY ?auto_15541 ?auto_15542 ?auto_15543 ?auto_15544 ?auto_15540 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15557 - OBJ
      ?auto_15558 - OBJ
      ?auto_15559 - OBJ
      ?auto_15560 - OBJ
      ?auto_15556 - LOCATION
    )
    :vars
    (
      ?auto_15561 - TRUCK
      ?auto_15562 - LOCATION
      ?auto_15563 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15558 ?auto_15561 ) ( TRUCK-AT ?auto_15561 ?auto_15562 ) ( IN-CITY ?auto_15562 ?auto_15563 ) ( IN-CITY ?auto_15556 ?auto_15563 ) ( not ( = ?auto_15556 ?auto_15562 ) ) ( OBJ-AT ?auto_15559 ?auto_15556 ) ( not ( = ?auto_15559 ?auto_15558 ) ) ( OBJ-AT ?auto_15557 ?auto_15556 ) ( OBJ-AT ?auto_15560 ?auto_15556 ) ( not ( = ?auto_15557 ?auto_15558 ) ) ( not ( = ?auto_15557 ?auto_15559 ) ) ( not ( = ?auto_15557 ?auto_15560 ) ) ( not ( = ?auto_15558 ?auto_15560 ) ) ( not ( = ?auto_15559 ?auto_15560 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15559 ?auto_15558 ?auto_15556 )
      ( DELIVER-4PKG-VERIFY ?auto_15557 ?auto_15558 ?auto_15559 ?auto_15560 ?auto_15556 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15589 - OBJ
      ?auto_15590 - OBJ
      ?auto_15591 - OBJ
      ?auto_15592 - OBJ
      ?auto_15588 - LOCATION
    )
    :vars
    (
      ?auto_15593 - TRUCK
      ?auto_15594 - LOCATION
      ?auto_15595 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15589 ?auto_15593 ) ( TRUCK-AT ?auto_15593 ?auto_15594 ) ( IN-CITY ?auto_15594 ?auto_15595 ) ( IN-CITY ?auto_15588 ?auto_15595 ) ( not ( = ?auto_15588 ?auto_15594 ) ) ( OBJ-AT ?auto_15592 ?auto_15588 ) ( not ( = ?auto_15592 ?auto_15589 ) ) ( OBJ-AT ?auto_15590 ?auto_15588 ) ( OBJ-AT ?auto_15591 ?auto_15588 ) ( not ( = ?auto_15589 ?auto_15590 ) ) ( not ( = ?auto_15589 ?auto_15591 ) ) ( not ( = ?auto_15590 ?auto_15591 ) ) ( not ( = ?auto_15590 ?auto_15592 ) ) ( not ( = ?auto_15591 ?auto_15592 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15592 ?auto_15589 ?auto_15588 )
      ( DELIVER-4PKG-VERIFY ?auto_15589 ?auto_15590 ?auto_15591 ?auto_15592 ?auto_15588 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15654 - OBJ
      ?auto_15653 - LOCATION
    )
    :vars
    (
      ?auto_15656 - TRUCK
      ?auto_15657 - LOCATION
      ?auto_15658 - CITY
      ?auto_15655 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15656 ?auto_15657 ) ( IN-CITY ?auto_15657 ?auto_15658 ) ( IN-CITY ?auto_15653 ?auto_15658 ) ( not ( = ?auto_15653 ?auto_15657 ) ) ( OBJ-AT ?auto_15655 ?auto_15653 ) ( not ( = ?auto_15655 ?auto_15654 ) ) ( OBJ-AT ?auto_15654 ?auto_15657 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15654 ?auto_15656 ?auto_15657 )
      ( DELIVER-2PKG ?auto_15655 ?auto_15654 ?auto_15653 )
      ( DELIVER-1PKG-VERIFY ?auto_15654 ?auto_15653 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15660 - OBJ
      ?auto_15661 - OBJ
      ?auto_15659 - LOCATION
    )
    :vars
    (
      ?auto_15664 - TRUCK
      ?auto_15662 - LOCATION
      ?auto_15663 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15664 ?auto_15662 ) ( IN-CITY ?auto_15662 ?auto_15663 ) ( IN-CITY ?auto_15659 ?auto_15663 ) ( not ( = ?auto_15659 ?auto_15662 ) ) ( OBJ-AT ?auto_15660 ?auto_15659 ) ( not ( = ?auto_15660 ?auto_15661 ) ) ( OBJ-AT ?auto_15661 ?auto_15662 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15661 ?auto_15659 )
      ( DELIVER-2PKG-VERIFY ?auto_15660 ?auto_15661 ?auto_15659 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15666 - OBJ
      ?auto_15667 - OBJ
      ?auto_15665 - LOCATION
    )
    :vars
    (
      ?auto_15668 - TRUCK
      ?auto_15669 - LOCATION
      ?auto_15670 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15668 ?auto_15669 ) ( IN-CITY ?auto_15669 ?auto_15670 ) ( IN-CITY ?auto_15665 ?auto_15670 ) ( not ( = ?auto_15665 ?auto_15669 ) ) ( OBJ-AT ?auto_15667 ?auto_15665 ) ( not ( = ?auto_15667 ?auto_15666 ) ) ( OBJ-AT ?auto_15666 ?auto_15669 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15667 ?auto_15666 ?auto_15665 )
      ( DELIVER-2PKG-VERIFY ?auto_15666 ?auto_15667 ?auto_15665 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15679 - OBJ
      ?auto_15680 - OBJ
      ?auto_15681 - OBJ
      ?auto_15678 - LOCATION
    )
    :vars
    (
      ?auto_15682 - TRUCK
      ?auto_15683 - LOCATION
      ?auto_15684 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15682 ?auto_15683 ) ( IN-CITY ?auto_15683 ?auto_15684 ) ( IN-CITY ?auto_15678 ?auto_15684 ) ( not ( = ?auto_15678 ?auto_15683 ) ) ( OBJ-AT ?auto_15680 ?auto_15678 ) ( not ( = ?auto_15680 ?auto_15681 ) ) ( OBJ-AT ?auto_15681 ?auto_15683 ) ( OBJ-AT ?auto_15679 ?auto_15678 ) ( not ( = ?auto_15679 ?auto_15680 ) ) ( not ( = ?auto_15679 ?auto_15681 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15680 ?auto_15681 ?auto_15678 )
      ( DELIVER-3PKG-VERIFY ?auto_15679 ?auto_15680 ?auto_15681 ?auto_15678 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15686 - OBJ
      ?auto_15687 - OBJ
      ?auto_15688 - OBJ
      ?auto_15685 - LOCATION
    )
    :vars
    (
      ?auto_15689 - TRUCK
      ?auto_15690 - LOCATION
      ?auto_15691 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15689 ?auto_15690 ) ( IN-CITY ?auto_15690 ?auto_15691 ) ( IN-CITY ?auto_15685 ?auto_15691 ) ( not ( = ?auto_15685 ?auto_15690 ) ) ( OBJ-AT ?auto_15688 ?auto_15685 ) ( not ( = ?auto_15688 ?auto_15687 ) ) ( OBJ-AT ?auto_15687 ?auto_15690 ) ( OBJ-AT ?auto_15686 ?auto_15685 ) ( not ( = ?auto_15686 ?auto_15687 ) ) ( not ( = ?auto_15686 ?auto_15688 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15688 ?auto_15687 ?auto_15685 )
      ( DELIVER-3PKG-VERIFY ?auto_15686 ?auto_15687 ?auto_15688 ?auto_15685 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15700 - OBJ
      ?auto_15701 - OBJ
      ?auto_15702 - OBJ
      ?auto_15699 - LOCATION
    )
    :vars
    (
      ?auto_15703 - TRUCK
      ?auto_15704 - LOCATION
      ?auto_15705 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15703 ?auto_15704 ) ( IN-CITY ?auto_15704 ?auto_15705 ) ( IN-CITY ?auto_15699 ?auto_15705 ) ( not ( = ?auto_15699 ?auto_15704 ) ) ( OBJ-AT ?auto_15702 ?auto_15699 ) ( not ( = ?auto_15702 ?auto_15700 ) ) ( OBJ-AT ?auto_15700 ?auto_15704 ) ( OBJ-AT ?auto_15701 ?auto_15699 ) ( not ( = ?auto_15700 ?auto_15701 ) ) ( not ( = ?auto_15701 ?auto_15702 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15702 ?auto_15700 ?auto_15699 )
      ( DELIVER-3PKG-VERIFY ?auto_15700 ?auto_15701 ?auto_15702 ?auto_15699 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15729 - OBJ
      ?auto_15730 - OBJ
      ?auto_15731 - OBJ
      ?auto_15732 - OBJ
      ?auto_15728 - LOCATION
    )
    :vars
    (
      ?auto_15733 - TRUCK
      ?auto_15734 - LOCATION
      ?auto_15735 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15733 ?auto_15734 ) ( IN-CITY ?auto_15734 ?auto_15735 ) ( IN-CITY ?auto_15728 ?auto_15735 ) ( not ( = ?auto_15728 ?auto_15734 ) ) ( OBJ-AT ?auto_15730 ?auto_15728 ) ( not ( = ?auto_15730 ?auto_15732 ) ) ( OBJ-AT ?auto_15732 ?auto_15734 ) ( OBJ-AT ?auto_15729 ?auto_15728 ) ( OBJ-AT ?auto_15731 ?auto_15728 ) ( not ( = ?auto_15729 ?auto_15730 ) ) ( not ( = ?auto_15729 ?auto_15731 ) ) ( not ( = ?auto_15729 ?auto_15732 ) ) ( not ( = ?auto_15730 ?auto_15731 ) ) ( not ( = ?auto_15731 ?auto_15732 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15730 ?auto_15732 ?auto_15728 )
      ( DELIVER-4PKG-VERIFY ?auto_15729 ?auto_15730 ?auto_15731 ?auto_15732 ?auto_15728 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15737 - OBJ
      ?auto_15738 - OBJ
      ?auto_15739 - OBJ
      ?auto_15740 - OBJ
      ?auto_15736 - LOCATION
    )
    :vars
    (
      ?auto_15741 - TRUCK
      ?auto_15742 - LOCATION
      ?auto_15743 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15741 ?auto_15742 ) ( IN-CITY ?auto_15742 ?auto_15743 ) ( IN-CITY ?auto_15736 ?auto_15743 ) ( not ( = ?auto_15736 ?auto_15742 ) ) ( OBJ-AT ?auto_15737 ?auto_15736 ) ( not ( = ?auto_15737 ?auto_15739 ) ) ( OBJ-AT ?auto_15739 ?auto_15742 ) ( OBJ-AT ?auto_15738 ?auto_15736 ) ( OBJ-AT ?auto_15740 ?auto_15736 ) ( not ( = ?auto_15737 ?auto_15738 ) ) ( not ( = ?auto_15737 ?auto_15740 ) ) ( not ( = ?auto_15738 ?auto_15739 ) ) ( not ( = ?auto_15738 ?auto_15740 ) ) ( not ( = ?auto_15739 ?auto_15740 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15737 ?auto_15739 ?auto_15736 )
      ( DELIVER-4PKG-VERIFY ?auto_15737 ?auto_15738 ?auto_15739 ?auto_15740 ?auto_15736 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15753 - OBJ
      ?auto_15754 - OBJ
      ?auto_15755 - OBJ
      ?auto_15756 - OBJ
      ?auto_15752 - LOCATION
    )
    :vars
    (
      ?auto_15757 - TRUCK
      ?auto_15758 - LOCATION
      ?auto_15759 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15757 ?auto_15758 ) ( IN-CITY ?auto_15758 ?auto_15759 ) ( IN-CITY ?auto_15752 ?auto_15759 ) ( not ( = ?auto_15752 ?auto_15758 ) ) ( OBJ-AT ?auto_15753 ?auto_15752 ) ( not ( = ?auto_15753 ?auto_15754 ) ) ( OBJ-AT ?auto_15754 ?auto_15758 ) ( OBJ-AT ?auto_15755 ?auto_15752 ) ( OBJ-AT ?auto_15756 ?auto_15752 ) ( not ( = ?auto_15753 ?auto_15755 ) ) ( not ( = ?auto_15753 ?auto_15756 ) ) ( not ( = ?auto_15754 ?auto_15755 ) ) ( not ( = ?auto_15754 ?auto_15756 ) ) ( not ( = ?auto_15755 ?auto_15756 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15753 ?auto_15754 ?auto_15752 )
      ( DELIVER-4PKG-VERIFY ?auto_15753 ?auto_15754 ?auto_15755 ?auto_15756 ?auto_15752 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15785 - OBJ
      ?auto_15786 - OBJ
      ?auto_15787 - OBJ
      ?auto_15788 - OBJ
      ?auto_15784 - LOCATION
    )
    :vars
    (
      ?auto_15789 - TRUCK
      ?auto_15790 - LOCATION
      ?auto_15791 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15789 ?auto_15790 ) ( IN-CITY ?auto_15790 ?auto_15791 ) ( IN-CITY ?auto_15784 ?auto_15791 ) ( not ( = ?auto_15784 ?auto_15790 ) ) ( OBJ-AT ?auto_15788 ?auto_15784 ) ( not ( = ?auto_15788 ?auto_15785 ) ) ( OBJ-AT ?auto_15785 ?auto_15790 ) ( OBJ-AT ?auto_15786 ?auto_15784 ) ( OBJ-AT ?auto_15787 ?auto_15784 ) ( not ( = ?auto_15785 ?auto_15786 ) ) ( not ( = ?auto_15785 ?auto_15787 ) ) ( not ( = ?auto_15786 ?auto_15787 ) ) ( not ( = ?auto_15786 ?auto_15788 ) ) ( not ( = ?auto_15787 ?auto_15788 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15788 ?auto_15785 ?auto_15784 )
      ( DELIVER-4PKG-VERIFY ?auto_15785 ?auto_15786 ?auto_15787 ?auto_15788 ?auto_15784 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15850 - OBJ
      ?auto_15849 - LOCATION
    )
    :vars
    (
      ?auto_15853 - LOCATION
      ?auto_15854 - CITY
      ?auto_15851 - OBJ
      ?auto_15852 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15853 ?auto_15854 ) ( IN-CITY ?auto_15849 ?auto_15854 ) ( not ( = ?auto_15849 ?auto_15853 ) ) ( OBJ-AT ?auto_15851 ?auto_15849 ) ( not ( = ?auto_15851 ?auto_15850 ) ) ( OBJ-AT ?auto_15850 ?auto_15853 ) ( TRUCK-AT ?auto_15852 ?auto_15849 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15852 ?auto_15849 ?auto_15853 ?auto_15854 )
      ( DELIVER-2PKG ?auto_15851 ?auto_15850 ?auto_15849 )
      ( DELIVER-1PKG-VERIFY ?auto_15850 ?auto_15849 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15856 - OBJ
      ?auto_15857 - OBJ
      ?auto_15855 - LOCATION
    )
    :vars
    (
      ?auto_15860 - LOCATION
      ?auto_15858 - CITY
      ?auto_15859 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15860 ?auto_15858 ) ( IN-CITY ?auto_15855 ?auto_15858 ) ( not ( = ?auto_15855 ?auto_15860 ) ) ( OBJ-AT ?auto_15856 ?auto_15855 ) ( not ( = ?auto_15856 ?auto_15857 ) ) ( OBJ-AT ?auto_15857 ?auto_15860 ) ( TRUCK-AT ?auto_15859 ?auto_15855 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15857 ?auto_15855 )
      ( DELIVER-2PKG-VERIFY ?auto_15856 ?auto_15857 ?auto_15855 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15862 - OBJ
      ?auto_15863 - OBJ
      ?auto_15861 - LOCATION
    )
    :vars
    (
      ?auto_15866 - LOCATION
      ?auto_15864 - CITY
      ?auto_15865 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15866 ?auto_15864 ) ( IN-CITY ?auto_15861 ?auto_15864 ) ( not ( = ?auto_15861 ?auto_15866 ) ) ( OBJ-AT ?auto_15863 ?auto_15861 ) ( not ( = ?auto_15863 ?auto_15862 ) ) ( OBJ-AT ?auto_15862 ?auto_15866 ) ( TRUCK-AT ?auto_15865 ?auto_15861 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15863 ?auto_15862 ?auto_15861 )
      ( DELIVER-2PKG-VERIFY ?auto_15862 ?auto_15863 ?auto_15861 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15875 - OBJ
      ?auto_15876 - OBJ
      ?auto_15877 - OBJ
      ?auto_15874 - LOCATION
    )
    :vars
    (
      ?auto_15880 - LOCATION
      ?auto_15878 - CITY
      ?auto_15879 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15880 ?auto_15878 ) ( IN-CITY ?auto_15874 ?auto_15878 ) ( not ( = ?auto_15874 ?auto_15880 ) ) ( OBJ-AT ?auto_15875 ?auto_15874 ) ( not ( = ?auto_15875 ?auto_15877 ) ) ( OBJ-AT ?auto_15877 ?auto_15880 ) ( TRUCK-AT ?auto_15879 ?auto_15874 ) ( OBJ-AT ?auto_15876 ?auto_15874 ) ( not ( = ?auto_15875 ?auto_15876 ) ) ( not ( = ?auto_15876 ?auto_15877 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15875 ?auto_15877 ?auto_15874 )
      ( DELIVER-3PKG-VERIFY ?auto_15875 ?auto_15876 ?auto_15877 ?auto_15874 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15882 - OBJ
      ?auto_15883 - OBJ
      ?auto_15884 - OBJ
      ?auto_15881 - LOCATION
    )
    :vars
    (
      ?auto_15887 - LOCATION
      ?auto_15885 - CITY
      ?auto_15886 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15887 ?auto_15885 ) ( IN-CITY ?auto_15881 ?auto_15885 ) ( not ( = ?auto_15881 ?auto_15887 ) ) ( OBJ-AT ?auto_15882 ?auto_15881 ) ( not ( = ?auto_15882 ?auto_15883 ) ) ( OBJ-AT ?auto_15883 ?auto_15887 ) ( TRUCK-AT ?auto_15886 ?auto_15881 ) ( OBJ-AT ?auto_15884 ?auto_15881 ) ( not ( = ?auto_15882 ?auto_15884 ) ) ( not ( = ?auto_15883 ?auto_15884 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15882 ?auto_15883 ?auto_15881 )
      ( DELIVER-3PKG-VERIFY ?auto_15882 ?auto_15883 ?auto_15884 ?auto_15881 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15896 - OBJ
      ?auto_15897 - OBJ
      ?auto_15898 - OBJ
      ?auto_15895 - LOCATION
    )
    :vars
    (
      ?auto_15901 - LOCATION
      ?auto_15899 - CITY
      ?auto_15900 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15901 ?auto_15899 ) ( IN-CITY ?auto_15895 ?auto_15899 ) ( not ( = ?auto_15895 ?auto_15901 ) ) ( OBJ-AT ?auto_15897 ?auto_15895 ) ( not ( = ?auto_15897 ?auto_15896 ) ) ( OBJ-AT ?auto_15896 ?auto_15901 ) ( TRUCK-AT ?auto_15900 ?auto_15895 ) ( OBJ-AT ?auto_15898 ?auto_15895 ) ( not ( = ?auto_15896 ?auto_15898 ) ) ( not ( = ?auto_15897 ?auto_15898 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15897 ?auto_15896 ?auto_15895 )
      ( DELIVER-3PKG-VERIFY ?auto_15896 ?auto_15897 ?auto_15898 ?auto_15895 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15925 - OBJ
      ?auto_15926 - OBJ
      ?auto_15927 - OBJ
      ?auto_15928 - OBJ
      ?auto_15924 - LOCATION
    )
    :vars
    (
      ?auto_15931 - LOCATION
      ?auto_15929 - CITY
      ?auto_15930 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15931 ?auto_15929 ) ( IN-CITY ?auto_15924 ?auto_15929 ) ( not ( = ?auto_15924 ?auto_15931 ) ) ( OBJ-AT ?auto_15925 ?auto_15924 ) ( not ( = ?auto_15925 ?auto_15928 ) ) ( OBJ-AT ?auto_15928 ?auto_15931 ) ( TRUCK-AT ?auto_15930 ?auto_15924 ) ( OBJ-AT ?auto_15926 ?auto_15924 ) ( OBJ-AT ?auto_15927 ?auto_15924 ) ( not ( = ?auto_15925 ?auto_15926 ) ) ( not ( = ?auto_15925 ?auto_15927 ) ) ( not ( = ?auto_15926 ?auto_15927 ) ) ( not ( = ?auto_15926 ?auto_15928 ) ) ( not ( = ?auto_15927 ?auto_15928 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15925 ?auto_15928 ?auto_15924 )
      ( DELIVER-4PKG-VERIFY ?auto_15925 ?auto_15926 ?auto_15927 ?auto_15928 ?auto_15924 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15933 - OBJ
      ?auto_15934 - OBJ
      ?auto_15935 - OBJ
      ?auto_15936 - OBJ
      ?auto_15932 - LOCATION
    )
    :vars
    (
      ?auto_15939 - LOCATION
      ?auto_15937 - CITY
      ?auto_15938 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15939 ?auto_15937 ) ( IN-CITY ?auto_15932 ?auto_15937 ) ( not ( = ?auto_15932 ?auto_15939 ) ) ( OBJ-AT ?auto_15936 ?auto_15932 ) ( not ( = ?auto_15936 ?auto_15935 ) ) ( OBJ-AT ?auto_15935 ?auto_15939 ) ( TRUCK-AT ?auto_15938 ?auto_15932 ) ( OBJ-AT ?auto_15933 ?auto_15932 ) ( OBJ-AT ?auto_15934 ?auto_15932 ) ( not ( = ?auto_15933 ?auto_15934 ) ) ( not ( = ?auto_15933 ?auto_15935 ) ) ( not ( = ?auto_15933 ?auto_15936 ) ) ( not ( = ?auto_15934 ?auto_15935 ) ) ( not ( = ?auto_15934 ?auto_15936 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15936 ?auto_15935 ?auto_15932 )
      ( DELIVER-4PKG-VERIFY ?auto_15933 ?auto_15934 ?auto_15935 ?auto_15936 ?auto_15932 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15949 - OBJ
      ?auto_15950 - OBJ
      ?auto_15951 - OBJ
      ?auto_15952 - OBJ
      ?auto_15948 - LOCATION
    )
    :vars
    (
      ?auto_15955 - LOCATION
      ?auto_15953 - CITY
      ?auto_15954 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15955 ?auto_15953 ) ( IN-CITY ?auto_15948 ?auto_15953 ) ( not ( = ?auto_15948 ?auto_15955 ) ) ( OBJ-AT ?auto_15952 ?auto_15948 ) ( not ( = ?auto_15952 ?auto_15950 ) ) ( OBJ-AT ?auto_15950 ?auto_15955 ) ( TRUCK-AT ?auto_15954 ?auto_15948 ) ( OBJ-AT ?auto_15949 ?auto_15948 ) ( OBJ-AT ?auto_15951 ?auto_15948 ) ( not ( = ?auto_15949 ?auto_15950 ) ) ( not ( = ?auto_15949 ?auto_15951 ) ) ( not ( = ?auto_15949 ?auto_15952 ) ) ( not ( = ?auto_15950 ?auto_15951 ) ) ( not ( = ?auto_15951 ?auto_15952 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15952 ?auto_15950 ?auto_15948 )
      ( DELIVER-4PKG-VERIFY ?auto_15949 ?auto_15950 ?auto_15951 ?auto_15952 ?auto_15948 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15981 - OBJ
      ?auto_15982 - OBJ
      ?auto_15983 - OBJ
      ?auto_15984 - OBJ
      ?auto_15980 - LOCATION
    )
    :vars
    (
      ?auto_15987 - LOCATION
      ?auto_15985 - CITY
      ?auto_15986 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15987 ?auto_15985 ) ( IN-CITY ?auto_15980 ?auto_15985 ) ( not ( = ?auto_15980 ?auto_15987 ) ) ( OBJ-AT ?auto_15983 ?auto_15980 ) ( not ( = ?auto_15983 ?auto_15981 ) ) ( OBJ-AT ?auto_15981 ?auto_15987 ) ( TRUCK-AT ?auto_15986 ?auto_15980 ) ( OBJ-AT ?auto_15982 ?auto_15980 ) ( OBJ-AT ?auto_15984 ?auto_15980 ) ( not ( = ?auto_15981 ?auto_15982 ) ) ( not ( = ?auto_15981 ?auto_15984 ) ) ( not ( = ?auto_15982 ?auto_15983 ) ) ( not ( = ?auto_15982 ?auto_15984 ) ) ( not ( = ?auto_15983 ?auto_15984 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15983 ?auto_15981 ?auto_15980 )
      ( DELIVER-4PKG-VERIFY ?auto_15981 ?auto_15982 ?auto_15983 ?auto_15984 ?auto_15980 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16046 - OBJ
      ?auto_16045 - LOCATION
    )
    :vars
    (
      ?auto_16050 - LOCATION
      ?auto_16048 - CITY
      ?auto_16047 - OBJ
      ?auto_16049 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16050 ?auto_16048 ) ( IN-CITY ?auto_16045 ?auto_16048 ) ( not ( = ?auto_16045 ?auto_16050 ) ) ( not ( = ?auto_16047 ?auto_16046 ) ) ( OBJ-AT ?auto_16046 ?auto_16050 ) ( TRUCK-AT ?auto_16049 ?auto_16045 ) ( IN-TRUCK ?auto_16047 ?auto_16049 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16047 ?auto_16045 )
      ( DELIVER-2PKG ?auto_16047 ?auto_16046 ?auto_16045 )
      ( DELIVER-1PKG-VERIFY ?auto_16046 ?auto_16045 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16052 - OBJ
      ?auto_16053 - OBJ
      ?auto_16051 - LOCATION
    )
    :vars
    (
      ?auto_16056 - LOCATION
      ?auto_16055 - CITY
      ?auto_16054 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16056 ?auto_16055 ) ( IN-CITY ?auto_16051 ?auto_16055 ) ( not ( = ?auto_16051 ?auto_16056 ) ) ( not ( = ?auto_16052 ?auto_16053 ) ) ( OBJ-AT ?auto_16053 ?auto_16056 ) ( TRUCK-AT ?auto_16054 ?auto_16051 ) ( IN-TRUCK ?auto_16052 ?auto_16054 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16053 ?auto_16051 )
      ( DELIVER-2PKG-VERIFY ?auto_16052 ?auto_16053 ?auto_16051 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16058 - OBJ
      ?auto_16059 - OBJ
      ?auto_16057 - LOCATION
    )
    :vars
    (
      ?auto_16061 - LOCATION
      ?auto_16062 - CITY
      ?auto_16060 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16061 ?auto_16062 ) ( IN-CITY ?auto_16057 ?auto_16062 ) ( not ( = ?auto_16057 ?auto_16061 ) ) ( not ( = ?auto_16059 ?auto_16058 ) ) ( OBJ-AT ?auto_16058 ?auto_16061 ) ( TRUCK-AT ?auto_16060 ?auto_16057 ) ( IN-TRUCK ?auto_16059 ?auto_16060 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16059 ?auto_16058 ?auto_16057 )
      ( DELIVER-2PKG-VERIFY ?auto_16058 ?auto_16059 ?auto_16057 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16242 - OBJ
      ?auto_16241 - LOCATION
    )
    :vars
    (
      ?auto_16244 - LOCATION
      ?auto_16245 - CITY
      ?auto_16246 - OBJ
      ?auto_16243 - TRUCK
      ?auto_16247 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16244 ?auto_16245 ) ( IN-CITY ?auto_16241 ?auto_16245 ) ( not ( = ?auto_16241 ?auto_16244 ) ) ( not ( = ?auto_16246 ?auto_16242 ) ) ( OBJ-AT ?auto_16242 ?auto_16244 ) ( IN-TRUCK ?auto_16246 ?auto_16243 ) ( TRUCK-AT ?auto_16243 ?auto_16247 ) ( IN-CITY ?auto_16247 ?auto_16245 ) ( not ( = ?auto_16241 ?auto_16247 ) ) ( not ( = ?auto_16244 ?auto_16247 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16243 ?auto_16247 ?auto_16241 ?auto_16245 )
      ( DELIVER-2PKG ?auto_16246 ?auto_16242 ?auto_16241 )
      ( DELIVER-1PKG-VERIFY ?auto_16242 ?auto_16241 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16249 - OBJ
      ?auto_16250 - OBJ
      ?auto_16248 - LOCATION
    )
    :vars
    (
      ?auto_16251 - LOCATION
      ?auto_16252 - CITY
      ?auto_16253 - TRUCK
      ?auto_16254 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16251 ?auto_16252 ) ( IN-CITY ?auto_16248 ?auto_16252 ) ( not ( = ?auto_16248 ?auto_16251 ) ) ( not ( = ?auto_16249 ?auto_16250 ) ) ( OBJ-AT ?auto_16250 ?auto_16251 ) ( IN-TRUCK ?auto_16249 ?auto_16253 ) ( TRUCK-AT ?auto_16253 ?auto_16254 ) ( IN-CITY ?auto_16254 ?auto_16252 ) ( not ( = ?auto_16248 ?auto_16254 ) ) ( not ( = ?auto_16251 ?auto_16254 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16250 ?auto_16248 )
      ( DELIVER-2PKG-VERIFY ?auto_16249 ?auto_16250 ?auto_16248 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16256 - OBJ
      ?auto_16257 - OBJ
      ?auto_16255 - LOCATION
    )
    :vars
    (
      ?auto_16259 - LOCATION
      ?auto_16260 - CITY
      ?auto_16261 - TRUCK
      ?auto_16258 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16259 ?auto_16260 ) ( IN-CITY ?auto_16255 ?auto_16260 ) ( not ( = ?auto_16255 ?auto_16259 ) ) ( not ( = ?auto_16257 ?auto_16256 ) ) ( OBJ-AT ?auto_16256 ?auto_16259 ) ( IN-TRUCK ?auto_16257 ?auto_16261 ) ( TRUCK-AT ?auto_16261 ?auto_16258 ) ( IN-CITY ?auto_16258 ?auto_16260 ) ( not ( = ?auto_16255 ?auto_16258 ) ) ( not ( = ?auto_16259 ?auto_16258 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16257 ?auto_16256 ?auto_16255 )
      ( DELIVER-2PKG-VERIFY ?auto_16256 ?auto_16257 ?auto_16255 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16464 - OBJ
      ?auto_16463 - LOCATION
    )
    :vars
    (
      ?auto_16466 - LOCATION
      ?auto_16467 - CITY
      ?auto_16469 - OBJ
      ?auto_16468 - TRUCK
      ?auto_16465 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16466 ?auto_16467 ) ( IN-CITY ?auto_16463 ?auto_16467 ) ( not ( = ?auto_16463 ?auto_16466 ) ) ( not ( = ?auto_16469 ?auto_16464 ) ) ( OBJ-AT ?auto_16464 ?auto_16466 ) ( TRUCK-AT ?auto_16468 ?auto_16465 ) ( IN-CITY ?auto_16465 ?auto_16467 ) ( not ( = ?auto_16463 ?auto_16465 ) ) ( not ( = ?auto_16466 ?auto_16465 ) ) ( OBJ-AT ?auto_16469 ?auto_16465 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_16469 ?auto_16468 ?auto_16465 )
      ( DELIVER-2PKG ?auto_16469 ?auto_16464 ?auto_16463 )
      ( DELIVER-1PKG-VERIFY ?auto_16464 ?auto_16463 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16471 - OBJ
      ?auto_16472 - OBJ
      ?auto_16470 - LOCATION
    )
    :vars
    (
      ?auto_16475 - LOCATION
      ?auto_16474 - CITY
      ?auto_16473 - TRUCK
      ?auto_16476 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16475 ?auto_16474 ) ( IN-CITY ?auto_16470 ?auto_16474 ) ( not ( = ?auto_16470 ?auto_16475 ) ) ( not ( = ?auto_16471 ?auto_16472 ) ) ( OBJ-AT ?auto_16472 ?auto_16475 ) ( TRUCK-AT ?auto_16473 ?auto_16476 ) ( IN-CITY ?auto_16476 ?auto_16474 ) ( not ( = ?auto_16470 ?auto_16476 ) ) ( not ( = ?auto_16475 ?auto_16476 ) ) ( OBJ-AT ?auto_16471 ?auto_16476 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16472 ?auto_16470 )
      ( DELIVER-2PKG-VERIFY ?auto_16471 ?auto_16472 ?auto_16470 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16478 - OBJ
      ?auto_16479 - OBJ
      ?auto_16477 - LOCATION
    )
    :vars
    (
      ?auto_16480 - LOCATION
      ?auto_16483 - CITY
      ?auto_16482 - TRUCK
      ?auto_16481 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16480 ?auto_16483 ) ( IN-CITY ?auto_16477 ?auto_16483 ) ( not ( = ?auto_16477 ?auto_16480 ) ) ( not ( = ?auto_16479 ?auto_16478 ) ) ( OBJ-AT ?auto_16478 ?auto_16480 ) ( TRUCK-AT ?auto_16482 ?auto_16481 ) ( IN-CITY ?auto_16481 ?auto_16483 ) ( not ( = ?auto_16477 ?auto_16481 ) ) ( not ( = ?auto_16480 ?auto_16481 ) ) ( OBJ-AT ?auto_16479 ?auto_16481 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16479 ?auto_16478 ?auto_16477 )
      ( DELIVER-2PKG-VERIFY ?auto_16478 ?auto_16479 ?auto_16477 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17856 - OBJ
      ?auto_17857 - OBJ
      ?auto_17858 - OBJ
      ?auto_17855 - LOCATION
    )
    :vars
    (
      ?auto_17860 - TRUCK
      ?auto_17861 - LOCATION
      ?auto_17862 - CITY
      ?auto_17859 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17858 ?auto_17860 ) ( TRUCK-AT ?auto_17860 ?auto_17861 ) ( IN-CITY ?auto_17861 ?auto_17862 ) ( IN-CITY ?auto_17855 ?auto_17862 ) ( not ( = ?auto_17855 ?auto_17861 ) ) ( OBJ-AT ?auto_17859 ?auto_17855 ) ( not ( = ?auto_17859 ?auto_17858 ) ) ( OBJ-AT ?auto_17856 ?auto_17855 ) ( OBJ-AT ?auto_17857 ?auto_17855 ) ( not ( = ?auto_17856 ?auto_17857 ) ) ( not ( = ?auto_17856 ?auto_17858 ) ) ( not ( = ?auto_17856 ?auto_17859 ) ) ( not ( = ?auto_17857 ?auto_17858 ) ) ( not ( = ?auto_17857 ?auto_17859 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17859 ?auto_17858 ?auto_17855 )
      ( DELIVER-3PKG-VERIFY ?auto_17856 ?auto_17857 ?auto_17858 ?auto_17855 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17868 - OBJ
      ?auto_17869 - OBJ
      ?auto_17870 - OBJ
      ?auto_17867 - LOCATION
    )
    :vars
    (
      ?auto_17872 - TRUCK
      ?auto_17873 - LOCATION
      ?auto_17874 - CITY
      ?auto_17871 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17869 ?auto_17872 ) ( TRUCK-AT ?auto_17872 ?auto_17873 ) ( IN-CITY ?auto_17873 ?auto_17874 ) ( IN-CITY ?auto_17867 ?auto_17874 ) ( not ( = ?auto_17867 ?auto_17873 ) ) ( OBJ-AT ?auto_17871 ?auto_17867 ) ( not ( = ?auto_17871 ?auto_17869 ) ) ( OBJ-AT ?auto_17868 ?auto_17867 ) ( OBJ-AT ?auto_17870 ?auto_17867 ) ( not ( = ?auto_17868 ?auto_17869 ) ) ( not ( = ?auto_17868 ?auto_17870 ) ) ( not ( = ?auto_17868 ?auto_17871 ) ) ( not ( = ?auto_17869 ?auto_17870 ) ) ( not ( = ?auto_17870 ?auto_17871 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17871 ?auto_17869 ?auto_17867 )
      ( DELIVER-3PKG-VERIFY ?auto_17868 ?auto_17869 ?auto_17870 ?auto_17867 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17906 - OBJ
      ?auto_17907 - OBJ
      ?auto_17908 - OBJ
      ?auto_17905 - LOCATION
    )
    :vars
    (
      ?auto_17910 - TRUCK
      ?auto_17911 - LOCATION
      ?auto_17912 - CITY
      ?auto_17909 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17906 ?auto_17910 ) ( TRUCK-AT ?auto_17910 ?auto_17911 ) ( IN-CITY ?auto_17911 ?auto_17912 ) ( IN-CITY ?auto_17905 ?auto_17912 ) ( not ( = ?auto_17905 ?auto_17911 ) ) ( OBJ-AT ?auto_17909 ?auto_17905 ) ( not ( = ?auto_17909 ?auto_17906 ) ) ( OBJ-AT ?auto_17907 ?auto_17905 ) ( OBJ-AT ?auto_17908 ?auto_17905 ) ( not ( = ?auto_17906 ?auto_17907 ) ) ( not ( = ?auto_17906 ?auto_17908 ) ) ( not ( = ?auto_17907 ?auto_17908 ) ) ( not ( = ?auto_17907 ?auto_17909 ) ) ( not ( = ?auto_17908 ?auto_17909 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17909 ?auto_17906 ?auto_17905 )
      ( DELIVER-3PKG-VERIFY ?auto_17906 ?auto_17907 ?auto_17908 ?auto_17905 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17945 - OBJ
      ?auto_17946 - OBJ
      ?auto_17947 - OBJ
      ?auto_17948 - OBJ
      ?auto_17944 - LOCATION
    )
    :vars
    (
      ?auto_17949 - TRUCK
      ?auto_17950 - LOCATION
      ?auto_17951 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17948 ?auto_17949 ) ( TRUCK-AT ?auto_17949 ?auto_17950 ) ( IN-CITY ?auto_17950 ?auto_17951 ) ( IN-CITY ?auto_17944 ?auto_17951 ) ( not ( = ?auto_17944 ?auto_17950 ) ) ( OBJ-AT ?auto_17947 ?auto_17944 ) ( not ( = ?auto_17947 ?auto_17948 ) ) ( OBJ-AT ?auto_17945 ?auto_17944 ) ( OBJ-AT ?auto_17946 ?auto_17944 ) ( not ( = ?auto_17945 ?auto_17946 ) ) ( not ( = ?auto_17945 ?auto_17947 ) ) ( not ( = ?auto_17945 ?auto_17948 ) ) ( not ( = ?auto_17946 ?auto_17947 ) ) ( not ( = ?auto_17946 ?auto_17948 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17947 ?auto_17948 ?auto_17944 )
      ( DELIVER-4PKG-VERIFY ?auto_17945 ?auto_17946 ?auto_17947 ?auto_17948 ?auto_17944 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17993 - OBJ
      ?auto_17994 - OBJ
      ?auto_17995 - OBJ
      ?auto_17996 - OBJ
      ?auto_17992 - LOCATION
    )
    :vars
    (
      ?auto_17997 - TRUCK
      ?auto_17998 - LOCATION
      ?auto_17999 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17996 ?auto_17997 ) ( TRUCK-AT ?auto_17997 ?auto_17998 ) ( IN-CITY ?auto_17998 ?auto_17999 ) ( IN-CITY ?auto_17992 ?auto_17999 ) ( not ( = ?auto_17992 ?auto_17998 ) ) ( OBJ-AT ?auto_17993 ?auto_17992 ) ( not ( = ?auto_17993 ?auto_17996 ) ) ( OBJ-AT ?auto_17994 ?auto_17992 ) ( OBJ-AT ?auto_17995 ?auto_17992 ) ( not ( = ?auto_17993 ?auto_17994 ) ) ( not ( = ?auto_17993 ?auto_17995 ) ) ( not ( = ?auto_17994 ?auto_17995 ) ) ( not ( = ?auto_17994 ?auto_17996 ) ) ( not ( = ?auto_17995 ?auto_17996 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17993 ?auto_17996 ?auto_17992 )
      ( DELIVER-4PKG-VERIFY ?auto_17993 ?auto_17994 ?auto_17995 ?auto_17996 ?auto_17992 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18001 - OBJ
      ?auto_18002 - OBJ
      ?auto_18003 - OBJ
      ?auto_18004 - OBJ
      ?auto_18000 - LOCATION
    )
    :vars
    (
      ?auto_18005 - TRUCK
      ?auto_18006 - LOCATION
      ?auto_18007 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18003 ?auto_18005 ) ( TRUCK-AT ?auto_18005 ?auto_18006 ) ( IN-CITY ?auto_18006 ?auto_18007 ) ( IN-CITY ?auto_18000 ?auto_18007 ) ( not ( = ?auto_18000 ?auto_18006 ) ) ( OBJ-AT ?auto_18001 ?auto_18000 ) ( not ( = ?auto_18001 ?auto_18003 ) ) ( OBJ-AT ?auto_18002 ?auto_18000 ) ( OBJ-AT ?auto_18004 ?auto_18000 ) ( not ( = ?auto_18001 ?auto_18002 ) ) ( not ( = ?auto_18001 ?auto_18004 ) ) ( not ( = ?auto_18002 ?auto_18003 ) ) ( not ( = ?auto_18002 ?auto_18004 ) ) ( not ( = ?auto_18003 ?auto_18004 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18001 ?auto_18003 ?auto_18000 )
      ( DELIVER-4PKG-VERIFY ?auto_18001 ?auto_18002 ?auto_18003 ?auto_18004 ?auto_18000 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18025 - OBJ
      ?auto_18026 - OBJ
      ?auto_18027 - OBJ
      ?auto_18028 - OBJ
      ?auto_18024 - LOCATION
    )
    :vars
    (
      ?auto_18029 - TRUCK
      ?auto_18030 - LOCATION
      ?auto_18031 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18026 ?auto_18029 ) ( TRUCK-AT ?auto_18029 ?auto_18030 ) ( IN-CITY ?auto_18030 ?auto_18031 ) ( IN-CITY ?auto_18024 ?auto_18031 ) ( not ( = ?auto_18024 ?auto_18030 ) ) ( OBJ-AT ?auto_18028 ?auto_18024 ) ( not ( = ?auto_18028 ?auto_18026 ) ) ( OBJ-AT ?auto_18025 ?auto_18024 ) ( OBJ-AT ?auto_18027 ?auto_18024 ) ( not ( = ?auto_18025 ?auto_18026 ) ) ( not ( = ?auto_18025 ?auto_18027 ) ) ( not ( = ?auto_18025 ?auto_18028 ) ) ( not ( = ?auto_18026 ?auto_18027 ) ) ( not ( = ?auto_18027 ?auto_18028 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18028 ?auto_18026 ?auto_18024 )
      ( DELIVER-4PKG-VERIFY ?auto_18025 ?auto_18026 ?auto_18027 ?auto_18028 ?auto_18024 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18033 - OBJ
      ?auto_18034 - OBJ
      ?auto_18035 - OBJ
      ?auto_18036 - OBJ
      ?auto_18032 - LOCATION
    )
    :vars
    (
      ?auto_18037 - TRUCK
      ?auto_18038 - LOCATION
      ?auto_18039 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18034 ?auto_18037 ) ( TRUCK-AT ?auto_18037 ?auto_18038 ) ( IN-CITY ?auto_18038 ?auto_18039 ) ( IN-CITY ?auto_18032 ?auto_18039 ) ( not ( = ?auto_18032 ?auto_18038 ) ) ( OBJ-AT ?auto_18033 ?auto_18032 ) ( not ( = ?auto_18033 ?auto_18034 ) ) ( OBJ-AT ?auto_18035 ?auto_18032 ) ( OBJ-AT ?auto_18036 ?auto_18032 ) ( not ( = ?auto_18033 ?auto_18035 ) ) ( not ( = ?auto_18033 ?auto_18036 ) ) ( not ( = ?auto_18034 ?auto_18035 ) ) ( not ( = ?auto_18034 ?auto_18036 ) ) ( not ( = ?auto_18035 ?auto_18036 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18033 ?auto_18034 ?auto_18032 )
      ( DELIVER-4PKG-VERIFY ?auto_18033 ?auto_18034 ?auto_18035 ?auto_18036 ?auto_18032 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18145 - OBJ
      ?auto_18146 - OBJ
      ?auto_18147 - OBJ
      ?auto_18148 - OBJ
      ?auto_18144 - LOCATION
    )
    :vars
    (
      ?auto_18150 - TRUCK
      ?auto_18151 - LOCATION
      ?auto_18152 - CITY
      ?auto_18149 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18148 ?auto_18150 ) ( TRUCK-AT ?auto_18150 ?auto_18151 ) ( IN-CITY ?auto_18151 ?auto_18152 ) ( IN-CITY ?auto_18144 ?auto_18152 ) ( not ( = ?auto_18144 ?auto_18151 ) ) ( OBJ-AT ?auto_18149 ?auto_18144 ) ( not ( = ?auto_18149 ?auto_18148 ) ) ( OBJ-AT ?auto_18145 ?auto_18144 ) ( OBJ-AT ?auto_18146 ?auto_18144 ) ( OBJ-AT ?auto_18147 ?auto_18144 ) ( not ( = ?auto_18145 ?auto_18146 ) ) ( not ( = ?auto_18145 ?auto_18147 ) ) ( not ( = ?auto_18145 ?auto_18148 ) ) ( not ( = ?auto_18145 ?auto_18149 ) ) ( not ( = ?auto_18146 ?auto_18147 ) ) ( not ( = ?auto_18146 ?auto_18148 ) ) ( not ( = ?auto_18146 ?auto_18149 ) ) ( not ( = ?auto_18147 ?auto_18148 ) ) ( not ( = ?auto_18147 ?auto_18149 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18149 ?auto_18148 ?auto_18144 )
      ( DELIVER-4PKG-VERIFY ?auto_18145 ?auto_18146 ?auto_18147 ?auto_18148 ?auto_18144 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18154 - OBJ
      ?auto_18155 - OBJ
      ?auto_18156 - OBJ
      ?auto_18157 - OBJ
      ?auto_18153 - LOCATION
    )
    :vars
    (
      ?auto_18158 - TRUCK
      ?auto_18159 - LOCATION
      ?auto_18160 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18156 ?auto_18158 ) ( TRUCK-AT ?auto_18158 ?auto_18159 ) ( IN-CITY ?auto_18159 ?auto_18160 ) ( IN-CITY ?auto_18153 ?auto_18160 ) ( not ( = ?auto_18153 ?auto_18159 ) ) ( OBJ-AT ?auto_18157 ?auto_18153 ) ( not ( = ?auto_18157 ?auto_18156 ) ) ( OBJ-AT ?auto_18154 ?auto_18153 ) ( OBJ-AT ?auto_18155 ?auto_18153 ) ( not ( = ?auto_18154 ?auto_18155 ) ) ( not ( = ?auto_18154 ?auto_18156 ) ) ( not ( = ?auto_18154 ?auto_18157 ) ) ( not ( = ?auto_18155 ?auto_18156 ) ) ( not ( = ?auto_18155 ?auto_18157 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18157 ?auto_18156 ?auto_18153 )
      ( DELIVER-4PKG-VERIFY ?auto_18154 ?auto_18155 ?auto_18156 ?auto_18157 ?auto_18153 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18162 - OBJ
      ?auto_18163 - OBJ
      ?auto_18164 - OBJ
      ?auto_18165 - OBJ
      ?auto_18161 - LOCATION
    )
    :vars
    (
      ?auto_18167 - TRUCK
      ?auto_18168 - LOCATION
      ?auto_18169 - CITY
      ?auto_18166 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18164 ?auto_18167 ) ( TRUCK-AT ?auto_18167 ?auto_18168 ) ( IN-CITY ?auto_18168 ?auto_18169 ) ( IN-CITY ?auto_18161 ?auto_18169 ) ( not ( = ?auto_18161 ?auto_18168 ) ) ( OBJ-AT ?auto_18166 ?auto_18161 ) ( not ( = ?auto_18166 ?auto_18164 ) ) ( OBJ-AT ?auto_18162 ?auto_18161 ) ( OBJ-AT ?auto_18163 ?auto_18161 ) ( OBJ-AT ?auto_18165 ?auto_18161 ) ( not ( = ?auto_18162 ?auto_18163 ) ) ( not ( = ?auto_18162 ?auto_18164 ) ) ( not ( = ?auto_18162 ?auto_18165 ) ) ( not ( = ?auto_18162 ?auto_18166 ) ) ( not ( = ?auto_18163 ?auto_18164 ) ) ( not ( = ?auto_18163 ?auto_18165 ) ) ( not ( = ?auto_18163 ?auto_18166 ) ) ( not ( = ?auto_18164 ?auto_18165 ) ) ( not ( = ?auto_18165 ?auto_18166 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18166 ?auto_18164 ?auto_18161 )
      ( DELIVER-4PKG-VERIFY ?auto_18162 ?auto_18163 ?auto_18164 ?auto_18165 ?auto_18161 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18212 - OBJ
      ?auto_18213 - OBJ
      ?auto_18214 - OBJ
      ?auto_18215 - OBJ
      ?auto_18211 - LOCATION
    )
    :vars
    (
      ?auto_18217 - TRUCK
      ?auto_18218 - LOCATION
      ?auto_18219 - CITY
      ?auto_18216 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18213 ?auto_18217 ) ( TRUCK-AT ?auto_18217 ?auto_18218 ) ( IN-CITY ?auto_18218 ?auto_18219 ) ( IN-CITY ?auto_18211 ?auto_18219 ) ( not ( = ?auto_18211 ?auto_18218 ) ) ( OBJ-AT ?auto_18216 ?auto_18211 ) ( not ( = ?auto_18216 ?auto_18213 ) ) ( OBJ-AT ?auto_18212 ?auto_18211 ) ( OBJ-AT ?auto_18214 ?auto_18211 ) ( OBJ-AT ?auto_18215 ?auto_18211 ) ( not ( = ?auto_18212 ?auto_18213 ) ) ( not ( = ?auto_18212 ?auto_18214 ) ) ( not ( = ?auto_18212 ?auto_18215 ) ) ( not ( = ?auto_18212 ?auto_18216 ) ) ( not ( = ?auto_18213 ?auto_18214 ) ) ( not ( = ?auto_18213 ?auto_18215 ) ) ( not ( = ?auto_18214 ?auto_18215 ) ) ( not ( = ?auto_18214 ?auto_18216 ) ) ( not ( = ?auto_18215 ?auto_18216 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18216 ?auto_18213 ?auto_18211 )
      ( DELIVER-4PKG-VERIFY ?auto_18212 ?auto_18213 ?auto_18214 ?auto_18215 ?auto_18211 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18256 - OBJ
      ?auto_18257 - OBJ
      ?auto_18258 - OBJ
      ?auto_18259 - OBJ
      ?auto_18255 - LOCATION
    )
    :vars
    (
      ?auto_18260 - TRUCK
      ?auto_18261 - LOCATION
      ?auto_18262 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18256 ?auto_18260 ) ( TRUCK-AT ?auto_18260 ?auto_18261 ) ( IN-CITY ?auto_18261 ?auto_18262 ) ( IN-CITY ?auto_18255 ?auto_18262 ) ( not ( = ?auto_18255 ?auto_18261 ) ) ( OBJ-AT ?auto_18257 ?auto_18255 ) ( not ( = ?auto_18257 ?auto_18256 ) ) ( OBJ-AT ?auto_18258 ?auto_18255 ) ( OBJ-AT ?auto_18259 ?auto_18255 ) ( not ( = ?auto_18256 ?auto_18258 ) ) ( not ( = ?auto_18256 ?auto_18259 ) ) ( not ( = ?auto_18257 ?auto_18258 ) ) ( not ( = ?auto_18257 ?auto_18259 ) ) ( not ( = ?auto_18258 ?auto_18259 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18257 ?auto_18256 ?auto_18255 )
      ( DELIVER-4PKG-VERIFY ?auto_18256 ?auto_18257 ?auto_18258 ?auto_18259 ?auto_18255 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18328 - OBJ
      ?auto_18329 - OBJ
      ?auto_18330 - OBJ
      ?auto_18331 - OBJ
      ?auto_18327 - LOCATION
    )
    :vars
    (
      ?auto_18332 - TRUCK
      ?auto_18333 - LOCATION
      ?auto_18334 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18328 ?auto_18332 ) ( TRUCK-AT ?auto_18332 ?auto_18333 ) ( IN-CITY ?auto_18333 ?auto_18334 ) ( IN-CITY ?auto_18327 ?auto_18334 ) ( not ( = ?auto_18327 ?auto_18333 ) ) ( OBJ-AT ?auto_18330 ?auto_18327 ) ( not ( = ?auto_18330 ?auto_18328 ) ) ( OBJ-AT ?auto_18329 ?auto_18327 ) ( OBJ-AT ?auto_18331 ?auto_18327 ) ( not ( = ?auto_18328 ?auto_18329 ) ) ( not ( = ?auto_18328 ?auto_18331 ) ) ( not ( = ?auto_18329 ?auto_18330 ) ) ( not ( = ?auto_18329 ?auto_18331 ) ) ( not ( = ?auto_18330 ?auto_18331 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18330 ?auto_18328 ?auto_18327 )
      ( DELIVER-4PKG-VERIFY ?auto_18328 ?auto_18329 ?auto_18330 ?auto_18331 ?auto_18327 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18360 - OBJ
      ?auto_18361 - OBJ
      ?auto_18362 - OBJ
      ?auto_18363 - OBJ
      ?auto_18359 - LOCATION
    )
    :vars
    (
      ?auto_18365 - TRUCK
      ?auto_18366 - LOCATION
      ?auto_18367 - CITY
      ?auto_18364 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18360 ?auto_18365 ) ( TRUCK-AT ?auto_18365 ?auto_18366 ) ( IN-CITY ?auto_18366 ?auto_18367 ) ( IN-CITY ?auto_18359 ?auto_18367 ) ( not ( = ?auto_18359 ?auto_18366 ) ) ( OBJ-AT ?auto_18364 ?auto_18359 ) ( not ( = ?auto_18364 ?auto_18360 ) ) ( OBJ-AT ?auto_18361 ?auto_18359 ) ( OBJ-AT ?auto_18362 ?auto_18359 ) ( OBJ-AT ?auto_18363 ?auto_18359 ) ( not ( = ?auto_18360 ?auto_18361 ) ) ( not ( = ?auto_18360 ?auto_18362 ) ) ( not ( = ?auto_18360 ?auto_18363 ) ) ( not ( = ?auto_18361 ?auto_18362 ) ) ( not ( = ?auto_18361 ?auto_18363 ) ) ( not ( = ?auto_18361 ?auto_18364 ) ) ( not ( = ?auto_18362 ?auto_18363 ) ) ( not ( = ?auto_18362 ?auto_18364 ) ) ( not ( = ?auto_18363 ?auto_18364 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18364 ?auto_18360 ?auto_18359 )
      ( DELIVER-4PKG-VERIFY ?auto_18360 ?auto_18361 ?auto_18362 ?auto_18363 ?auto_18359 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18511 - OBJ
      ?auto_18512 - OBJ
      ?auto_18513 - OBJ
      ?auto_18510 - LOCATION
    )
    :vars
    (
      ?auto_18514 - TRUCK
      ?auto_18516 - LOCATION
      ?auto_18515 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18514 ?auto_18516 ) ( IN-CITY ?auto_18516 ?auto_18515 ) ( IN-CITY ?auto_18510 ?auto_18515 ) ( not ( = ?auto_18510 ?auto_18516 ) ) ( OBJ-AT ?auto_18511 ?auto_18510 ) ( not ( = ?auto_18511 ?auto_18513 ) ) ( OBJ-AT ?auto_18513 ?auto_18516 ) ( OBJ-AT ?auto_18512 ?auto_18510 ) ( not ( = ?auto_18511 ?auto_18512 ) ) ( not ( = ?auto_18512 ?auto_18513 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18511 ?auto_18513 ?auto_18510 )
      ( DELIVER-3PKG-VERIFY ?auto_18511 ?auto_18512 ?auto_18513 ?auto_18510 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18544 - OBJ
      ?auto_18545 - OBJ
      ?auto_18546 - OBJ
      ?auto_18543 - LOCATION
    )
    :vars
    (
      ?auto_18547 - TRUCK
      ?auto_18549 - LOCATION
      ?auto_18548 - CITY
      ?auto_18550 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18547 ?auto_18549 ) ( IN-CITY ?auto_18549 ?auto_18548 ) ( IN-CITY ?auto_18543 ?auto_18548 ) ( not ( = ?auto_18543 ?auto_18549 ) ) ( OBJ-AT ?auto_18550 ?auto_18543 ) ( not ( = ?auto_18550 ?auto_18546 ) ) ( OBJ-AT ?auto_18546 ?auto_18549 ) ( OBJ-AT ?auto_18544 ?auto_18543 ) ( OBJ-AT ?auto_18545 ?auto_18543 ) ( not ( = ?auto_18544 ?auto_18545 ) ) ( not ( = ?auto_18544 ?auto_18546 ) ) ( not ( = ?auto_18544 ?auto_18550 ) ) ( not ( = ?auto_18545 ?auto_18546 ) ) ( not ( = ?auto_18545 ?auto_18550 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18550 ?auto_18546 ?auto_18543 )
      ( DELIVER-3PKG-VERIFY ?auto_18544 ?auto_18545 ?auto_18546 ?auto_18543 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18556 - OBJ
      ?auto_18557 - OBJ
      ?auto_18558 - OBJ
      ?auto_18555 - LOCATION
    )
    :vars
    (
      ?auto_18559 - TRUCK
      ?auto_18561 - LOCATION
      ?auto_18560 - CITY
      ?auto_18562 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18559 ?auto_18561 ) ( IN-CITY ?auto_18561 ?auto_18560 ) ( IN-CITY ?auto_18555 ?auto_18560 ) ( not ( = ?auto_18555 ?auto_18561 ) ) ( OBJ-AT ?auto_18562 ?auto_18555 ) ( not ( = ?auto_18562 ?auto_18557 ) ) ( OBJ-AT ?auto_18557 ?auto_18561 ) ( OBJ-AT ?auto_18556 ?auto_18555 ) ( OBJ-AT ?auto_18558 ?auto_18555 ) ( not ( = ?auto_18556 ?auto_18557 ) ) ( not ( = ?auto_18556 ?auto_18558 ) ) ( not ( = ?auto_18556 ?auto_18562 ) ) ( not ( = ?auto_18557 ?auto_18558 ) ) ( not ( = ?auto_18558 ?auto_18562 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18562 ?auto_18557 ?auto_18555 )
      ( DELIVER-3PKG-VERIFY ?auto_18556 ?auto_18557 ?auto_18558 ?auto_18555 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18572 - OBJ
      ?auto_18573 - OBJ
      ?auto_18574 - OBJ
      ?auto_18571 - LOCATION
    )
    :vars
    (
      ?auto_18575 - TRUCK
      ?auto_18577 - LOCATION
      ?auto_18576 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18575 ?auto_18577 ) ( IN-CITY ?auto_18577 ?auto_18576 ) ( IN-CITY ?auto_18571 ?auto_18576 ) ( not ( = ?auto_18571 ?auto_18577 ) ) ( OBJ-AT ?auto_18573 ?auto_18571 ) ( not ( = ?auto_18573 ?auto_18572 ) ) ( OBJ-AT ?auto_18572 ?auto_18577 ) ( OBJ-AT ?auto_18574 ?auto_18571 ) ( not ( = ?auto_18572 ?auto_18574 ) ) ( not ( = ?auto_18573 ?auto_18574 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18573 ?auto_18572 ?auto_18571 )
      ( DELIVER-3PKG-VERIFY ?auto_18572 ?auto_18573 ?auto_18574 ?auto_18571 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18594 - OBJ
      ?auto_18595 - OBJ
      ?auto_18596 - OBJ
      ?auto_18593 - LOCATION
    )
    :vars
    (
      ?auto_18597 - TRUCK
      ?auto_18599 - LOCATION
      ?auto_18598 - CITY
      ?auto_18600 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18597 ?auto_18599 ) ( IN-CITY ?auto_18599 ?auto_18598 ) ( IN-CITY ?auto_18593 ?auto_18598 ) ( not ( = ?auto_18593 ?auto_18599 ) ) ( OBJ-AT ?auto_18600 ?auto_18593 ) ( not ( = ?auto_18600 ?auto_18594 ) ) ( OBJ-AT ?auto_18594 ?auto_18599 ) ( OBJ-AT ?auto_18595 ?auto_18593 ) ( OBJ-AT ?auto_18596 ?auto_18593 ) ( not ( = ?auto_18594 ?auto_18595 ) ) ( not ( = ?auto_18594 ?auto_18596 ) ) ( not ( = ?auto_18595 ?auto_18596 ) ) ( not ( = ?auto_18595 ?auto_18600 ) ) ( not ( = ?auto_18596 ?auto_18600 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18600 ?auto_18594 ?auto_18593 )
      ( DELIVER-3PKG-VERIFY ?auto_18594 ?auto_18595 ?auto_18596 ?auto_18593 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18641 - OBJ
      ?auto_18642 - OBJ
      ?auto_18643 - OBJ
      ?auto_18644 - OBJ
      ?auto_18640 - LOCATION
    )
    :vars
    (
      ?auto_18645 - TRUCK
      ?auto_18647 - LOCATION
      ?auto_18646 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18645 ?auto_18647 ) ( IN-CITY ?auto_18647 ?auto_18646 ) ( IN-CITY ?auto_18640 ?auto_18646 ) ( not ( = ?auto_18640 ?auto_18647 ) ) ( OBJ-AT ?auto_18641 ?auto_18640 ) ( not ( = ?auto_18641 ?auto_18644 ) ) ( OBJ-AT ?auto_18644 ?auto_18647 ) ( OBJ-AT ?auto_18642 ?auto_18640 ) ( OBJ-AT ?auto_18643 ?auto_18640 ) ( not ( = ?auto_18641 ?auto_18642 ) ) ( not ( = ?auto_18641 ?auto_18643 ) ) ( not ( = ?auto_18642 ?auto_18643 ) ) ( not ( = ?auto_18642 ?auto_18644 ) ) ( not ( = ?auto_18643 ?auto_18644 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18641 ?auto_18644 ?auto_18640 )
      ( DELIVER-4PKG-VERIFY ?auto_18641 ?auto_18642 ?auto_18643 ?auto_18644 ?auto_18640 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18785 - OBJ
      ?auto_18786 - OBJ
      ?auto_18787 - OBJ
      ?auto_18788 - OBJ
      ?auto_18784 - LOCATION
    )
    :vars
    (
      ?auto_18789 - TRUCK
      ?auto_18791 - LOCATION
      ?auto_18790 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18789 ?auto_18791 ) ( IN-CITY ?auto_18791 ?auto_18790 ) ( IN-CITY ?auto_18784 ?auto_18790 ) ( not ( = ?auto_18784 ?auto_18791 ) ) ( OBJ-AT ?auto_18787 ?auto_18784 ) ( not ( = ?auto_18787 ?auto_18788 ) ) ( OBJ-AT ?auto_18788 ?auto_18791 ) ( OBJ-AT ?auto_18785 ?auto_18784 ) ( OBJ-AT ?auto_18786 ?auto_18784 ) ( not ( = ?auto_18785 ?auto_18786 ) ) ( not ( = ?auto_18785 ?auto_18787 ) ) ( not ( = ?auto_18785 ?auto_18788 ) ) ( not ( = ?auto_18786 ?auto_18787 ) ) ( not ( = ?auto_18786 ?auto_18788 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18787 ?auto_18788 ?auto_18784 )
      ( DELIVER-4PKG-VERIFY ?auto_18785 ?auto_18786 ?auto_18787 ?auto_18788 ?auto_18784 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18801 - OBJ
      ?auto_18802 - OBJ
      ?auto_18803 - OBJ
      ?auto_18804 - OBJ
      ?auto_18800 - LOCATION
    )
    :vars
    (
      ?auto_18805 - TRUCK
      ?auto_18807 - LOCATION
      ?auto_18806 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18805 ?auto_18807 ) ( IN-CITY ?auto_18807 ?auto_18806 ) ( IN-CITY ?auto_18800 ?auto_18806 ) ( not ( = ?auto_18800 ?auto_18807 ) ) ( OBJ-AT ?auto_18802 ?auto_18800 ) ( not ( = ?auto_18802 ?auto_18803 ) ) ( OBJ-AT ?auto_18803 ?auto_18807 ) ( OBJ-AT ?auto_18801 ?auto_18800 ) ( OBJ-AT ?auto_18804 ?auto_18800 ) ( not ( = ?auto_18801 ?auto_18802 ) ) ( not ( = ?auto_18801 ?auto_18803 ) ) ( not ( = ?auto_18801 ?auto_18804 ) ) ( not ( = ?auto_18802 ?auto_18804 ) ) ( not ( = ?auto_18803 ?auto_18804 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18802 ?auto_18803 ?auto_18800 )
      ( DELIVER-4PKG-VERIFY ?auto_18801 ?auto_18802 ?auto_18803 ?auto_18804 ?auto_18800 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18833 - OBJ
      ?auto_18834 - OBJ
      ?auto_18835 - OBJ
      ?auto_18836 - OBJ
      ?auto_18832 - LOCATION
    )
    :vars
    (
      ?auto_18837 - TRUCK
      ?auto_18839 - LOCATION
      ?auto_18838 - CITY
      ?auto_18840 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18837 ?auto_18839 ) ( IN-CITY ?auto_18839 ?auto_18838 ) ( IN-CITY ?auto_18832 ?auto_18838 ) ( not ( = ?auto_18832 ?auto_18839 ) ) ( OBJ-AT ?auto_18840 ?auto_18832 ) ( not ( = ?auto_18840 ?auto_18836 ) ) ( OBJ-AT ?auto_18836 ?auto_18839 ) ( OBJ-AT ?auto_18833 ?auto_18832 ) ( OBJ-AT ?auto_18834 ?auto_18832 ) ( OBJ-AT ?auto_18835 ?auto_18832 ) ( not ( = ?auto_18833 ?auto_18834 ) ) ( not ( = ?auto_18833 ?auto_18835 ) ) ( not ( = ?auto_18833 ?auto_18836 ) ) ( not ( = ?auto_18833 ?auto_18840 ) ) ( not ( = ?auto_18834 ?auto_18835 ) ) ( not ( = ?auto_18834 ?auto_18836 ) ) ( not ( = ?auto_18834 ?auto_18840 ) ) ( not ( = ?auto_18835 ?auto_18836 ) ) ( not ( = ?auto_18835 ?auto_18840 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18840 ?auto_18836 ?auto_18832 )
      ( DELIVER-4PKG-VERIFY ?auto_18833 ?auto_18834 ?auto_18835 ?auto_18836 ?auto_18832 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18842 - OBJ
      ?auto_18843 - OBJ
      ?auto_18844 - OBJ
      ?auto_18845 - OBJ
      ?auto_18841 - LOCATION
    )
    :vars
    (
      ?auto_18846 - TRUCK
      ?auto_18848 - LOCATION
      ?auto_18847 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18846 ?auto_18848 ) ( IN-CITY ?auto_18848 ?auto_18847 ) ( IN-CITY ?auto_18841 ?auto_18847 ) ( not ( = ?auto_18841 ?auto_18848 ) ) ( OBJ-AT ?auto_18845 ?auto_18841 ) ( not ( = ?auto_18845 ?auto_18844 ) ) ( OBJ-AT ?auto_18844 ?auto_18848 ) ( OBJ-AT ?auto_18842 ?auto_18841 ) ( OBJ-AT ?auto_18843 ?auto_18841 ) ( not ( = ?auto_18842 ?auto_18843 ) ) ( not ( = ?auto_18842 ?auto_18844 ) ) ( not ( = ?auto_18842 ?auto_18845 ) ) ( not ( = ?auto_18843 ?auto_18844 ) ) ( not ( = ?auto_18843 ?auto_18845 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18845 ?auto_18844 ?auto_18841 )
      ( DELIVER-4PKG-VERIFY ?auto_18842 ?auto_18843 ?auto_18844 ?auto_18845 ?auto_18841 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18850 - OBJ
      ?auto_18851 - OBJ
      ?auto_18852 - OBJ
      ?auto_18853 - OBJ
      ?auto_18849 - LOCATION
    )
    :vars
    (
      ?auto_18854 - TRUCK
      ?auto_18856 - LOCATION
      ?auto_18855 - CITY
      ?auto_18857 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18854 ?auto_18856 ) ( IN-CITY ?auto_18856 ?auto_18855 ) ( IN-CITY ?auto_18849 ?auto_18855 ) ( not ( = ?auto_18849 ?auto_18856 ) ) ( OBJ-AT ?auto_18857 ?auto_18849 ) ( not ( = ?auto_18857 ?auto_18852 ) ) ( OBJ-AT ?auto_18852 ?auto_18856 ) ( OBJ-AT ?auto_18850 ?auto_18849 ) ( OBJ-AT ?auto_18851 ?auto_18849 ) ( OBJ-AT ?auto_18853 ?auto_18849 ) ( not ( = ?auto_18850 ?auto_18851 ) ) ( not ( = ?auto_18850 ?auto_18852 ) ) ( not ( = ?auto_18850 ?auto_18853 ) ) ( not ( = ?auto_18850 ?auto_18857 ) ) ( not ( = ?auto_18851 ?auto_18852 ) ) ( not ( = ?auto_18851 ?auto_18853 ) ) ( not ( = ?auto_18851 ?auto_18857 ) ) ( not ( = ?auto_18852 ?auto_18853 ) ) ( not ( = ?auto_18853 ?auto_18857 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18857 ?auto_18852 ?auto_18849 )
      ( DELIVER-4PKG-VERIFY ?auto_18850 ?auto_18851 ?auto_18852 ?auto_18853 ?auto_18849 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18868 - OBJ
      ?auto_18869 - OBJ
      ?auto_18870 - OBJ
      ?auto_18871 - OBJ
      ?auto_18867 - LOCATION
    )
    :vars
    (
      ?auto_18872 - TRUCK
      ?auto_18874 - LOCATION
      ?auto_18873 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18872 ?auto_18874 ) ( IN-CITY ?auto_18874 ?auto_18873 ) ( IN-CITY ?auto_18867 ?auto_18873 ) ( not ( = ?auto_18867 ?auto_18874 ) ) ( OBJ-AT ?auto_18871 ?auto_18867 ) ( not ( = ?auto_18871 ?auto_18869 ) ) ( OBJ-AT ?auto_18869 ?auto_18874 ) ( OBJ-AT ?auto_18868 ?auto_18867 ) ( OBJ-AT ?auto_18870 ?auto_18867 ) ( not ( = ?auto_18868 ?auto_18869 ) ) ( not ( = ?auto_18868 ?auto_18870 ) ) ( not ( = ?auto_18868 ?auto_18871 ) ) ( not ( = ?auto_18869 ?auto_18870 ) ) ( not ( = ?auto_18870 ?auto_18871 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18871 ?auto_18869 ?auto_18867 )
      ( DELIVER-4PKG-VERIFY ?auto_18868 ?auto_18869 ?auto_18870 ?auto_18871 ?auto_18867 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18876 - OBJ
      ?auto_18877 - OBJ
      ?auto_18878 - OBJ
      ?auto_18879 - OBJ
      ?auto_18875 - LOCATION
    )
    :vars
    (
      ?auto_18880 - TRUCK
      ?auto_18882 - LOCATION
      ?auto_18881 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18880 ?auto_18882 ) ( IN-CITY ?auto_18882 ?auto_18881 ) ( IN-CITY ?auto_18875 ?auto_18881 ) ( not ( = ?auto_18875 ?auto_18882 ) ) ( OBJ-AT ?auto_18878 ?auto_18875 ) ( not ( = ?auto_18878 ?auto_18877 ) ) ( OBJ-AT ?auto_18877 ?auto_18882 ) ( OBJ-AT ?auto_18876 ?auto_18875 ) ( OBJ-AT ?auto_18879 ?auto_18875 ) ( not ( = ?auto_18876 ?auto_18877 ) ) ( not ( = ?auto_18876 ?auto_18878 ) ) ( not ( = ?auto_18876 ?auto_18879 ) ) ( not ( = ?auto_18877 ?auto_18879 ) ) ( not ( = ?auto_18878 ?auto_18879 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18878 ?auto_18877 ?auto_18875 )
      ( DELIVER-4PKG-VERIFY ?auto_18876 ?auto_18877 ?auto_18878 ?auto_18879 ?auto_18875 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18900 - OBJ
      ?auto_18901 - OBJ
      ?auto_18902 - OBJ
      ?auto_18903 - OBJ
      ?auto_18899 - LOCATION
    )
    :vars
    (
      ?auto_18904 - TRUCK
      ?auto_18906 - LOCATION
      ?auto_18905 - CITY
      ?auto_18907 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18904 ?auto_18906 ) ( IN-CITY ?auto_18906 ?auto_18905 ) ( IN-CITY ?auto_18899 ?auto_18905 ) ( not ( = ?auto_18899 ?auto_18906 ) ) ( OBJ-AT ?auto_18907 ?auto_18899 ) ( not ( = ?auto_18907 ?auto_18901 ) ) ( OBJ-AT ?auto_18901 ?auto_18906 ) ( OBJ-AT ?auto_18900 ?auto_18899 ) ( OBJ-AT ?auto_18902 ?auto_18899 ) ( OBJ-AT ?auto_18903 ?auto_18899 ) ( not ( = ?auto_18900 ?auto_18901 ) ) ( not ( = ?auto_18900 ?auto_18902 ) ) ( not ( = ?auto_18900 ?auto_18903 ) ) ( not ( = ?auto_18900 ?auto_18907 ) ) ( not ( = ?auto_18901 ?auto_18902 ) ) ( not ( = ?auto_18901 ?auto_18903 ) ) ( not ( = ?auto_18902 ?auto_18903 ) ) ( not ( = ?auto_18902 ?auto_18907 ) ) ( not ( = ?auto_18903 ?auto_18907 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18907 ?auto_18901 ?auto_18899 )
      ( DELIVER-4PKG-VERIFY ?auto_18900 ?auto_18901 ?auto_18902 ?auto_18903 ?auto_18899 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18952 - OBJ
      ?auto_18953 - OBJ
      ?auto_18954 - OBJ
      ?auto_18955 - OBJ
      ?auto_18951 - LOCATION
    )
    :vars
    (
      ?auto_18956 - TRUCK
      ?auto_18958 - LOCATION
      ?auto_18957 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18956 ?auto_18958 ) ( IN-CITY ?auto_18958 ?auto_18957 ) ( IN-CITY ?auto_18951 ?auto_18957 ) ( not ( = ?auto_18951 ?auto_18958 ) ) ( OBJ-AT ?auto_18953 ?auto_18951 ) ( not ( = ?auto_18953 ?auto_18952 ) ) ( OBJ-AT ?auto_18952 ?auto_18958 ) ( OBJ-AT ?auto_18954 ?auto_18951 ) ( OBJ-AT ?auto_18955 ?auto_18951 ) ( not ( = ?auto_18952 ?auto_18954 ) ) ( not ( = ?auto_18952 ?auto_18955 ) ) ( not ( = ?auto_18953 ?auto_18954 ) ) ( not ( = ?auto_18953 ?auto_18955 ) ) ( not ( = ?auto_18954 ?auto_18955 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18953 ?auto_18952 ?auto_18951 )
      ( DELIVER-4PKG-VERIFY ?auto_18952 ?auto_18953 ?auto_18954 ?auto_18955 ?auto_18951 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19016 - OBJ
      ?auto_19017 - OBJ
      ?auto_19018 - OBJ
      ?auto_19019 - OBJ
      ?auto_19015 - LOCATION
    )
    :vars
    (
      ?auto_19020 - TRUCK
      ?auto_19022 - LOCATION
      ?auto_19021 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_19020 ?auto_19022 ) ( IN-CITY ?auto_19022 ?auto_19021 ) ( IN-CITY ?auto_19015 ?auto_19021 ) ( not ( = ?auto_19015 ?auto_19022 ) ) ( OBJ-AT ?auto_19018 ?auto_19015 ) ( not ( = ?auto_19018 ?auto_19016 ) ) ( OBJ-AT ?auto_19016 ?auto_19022 ) ( OBJ-AT ?auto_19017 ?auto_19015 ) ( OBJ-AT ?auto_19019 ?auto_19015 ) ( not ( = ?auto_19016 ?auto_19017 ) ) ( not ( = ?auto_19016 ?auto_19019 ) ) ( not ( = ?auto_19017 ?auto_19018 ) ) ( not ( = ?auto_19017 ?auto_19019 ) ) ( not ( = ?auto_19018 ?auto_19019 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19018 ?auto_19016 ?auto_19015 )
      ( DELIVER-4PKG-VERIFY ?auto_19016 ?auto_19017 ?auto_19018 ?auto_19019 ?auto_19015 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19048 - OBJ
      ?auto_19049 - OBJ
      ?auto_19050 - OBJ
      ?auto_19051 - OBJ
      ?auto_19047 - LOCATION
    )
    :vars
    (
      ?auto_19052 - TRUCK
      ?auto_19054 - LOCATION
      ?auto_19053 - CITY
      ?auto_19055 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_19052 ?auto_19054 ) ( IN-CITY ?auto_19054 ?auto_19053 ) ( IN-CITY ?auto_19047 ?auto_19053 ) ( not ( = ?auto_19047 ?auto_19054 ) ) ( OBJ-AT ?auto_19055 ?auto_19047 ) ( not ( = ?auto_19055 ?auto_19048 ) ) ( OBJ-AT ?auto_19048 ?auto_19054 ) ( OBJ-AT ?auto_19049 ?auto_19047 ) ( OBJ-AT ?auto_19050 ?auto_19047 ) ( OBJ-AT ?auto_19051 ?auto_19047 ) ( not ( = ?auto_19048 ?auto_19049 ) ) ( not ( = ?auto_19048 ?auto_19050 ) ) ( not ( = ?auto_19048 ?auto_19051 ) ) ( not ( = ?auto_19049 ?auto_19050 ) ) ( not ( = ?auto_19049 ?auto_19051 ) ) ( not ( = ?auto_19049 ?auto_19055 ) ) ( not ( = ?auto_19050 ?auto_19051 ) ) ( not ( = ?auto_19050 ?auto_19055 ) ) ( not ( = ?auto_19051 ?auto_19055 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19055 ?auto_19048 ?auto_19047 )
      ( DELIVER-4PKG-VERIFY ?auto_19048 ?auto_19049 ?auto_19050 ?auto_19051 ?auto_19047 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19232 - OBJ
      ?auto_19233 - OBJ
      ?auto_19234 - OBJ
      ?auto_19231 - LOCATION
    )
    :vars
    (
      ?auto_19237 - LOCATION
      ?auto_19236 - CITY
      ?auto_19238 - OBJ
      ?auto_19235 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19237 ?auto_19236 ) ( IN-CITY ?auto_19231 ?auto_19236 ) ( not ( = ?auto_19231 ?auto_19237 ) ) ( OBJ-AT ?auto_19238 ?auto_19231 ) ( not ( = ?auto_19238 ?auto_19234 ) ) ( OBJ-AT ?auto_19234 ?auto_19237 ) ( TRUCK-AT ?auto_19235 ?auto_19231 ) ( OBJ-AT ?auto_19232 ?auto_19231 ) ( OBJ-AT ?auto_19233 ?auto_19231 ) ( not ( = ?auto_19232 ?auto_19233 ) ) ( not ( = ?auto_19232 ?auto_19234 ) ) ( not ( = ?auto_19232 ?auto_19238 ) ) ( not ( = ?auto_19233 ?auto_19234 ) ) ( not ( = ?auto_19233 ?auto_19238 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19238 ?auto_19234 ?auto_19231 )
      ( DELIVER-3PKG-VERIFY ?auto_19232 ?auto_19233 ?auto_19234 ?auto_19231 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19244 - OBJ
      ?auto_19245 - OBJ
      ?auto_19246 - OBJ
      ?auto_19243 - LOCATION
    )
    :vars
    (
      ?auto_19249 - LOCATION
      ?auto_19248 - CITY
      ?auto_19250 - OBJ
      ?auto_19247 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19249 ?auto_19248 ) ( IN-CITY ?auto_19243 ?auto_19248 ) ( not ( = ?auto_19243 ?auto_19249 ) ) ( OBJ-AT ?auto_19250 ?auto_19243 ) ( not ( = ?auto_19250 ?auto_19245 ) ) ( OBJ-AT ?auto_19245 ?auto_19249 ) ( TRUCK-AT ?auto_19247 ?auto_19243 ) ( OBJ-AT ?auto_19244 ?auto_19243 ) ( OBJ-AT ?auto_19246 ?auto_19243 ) ( not ( = ?auto_19244 ?auto_19245 ) ) ( not ( = ?auto_19244 ?auto_19246 ) ) ( not ( = ?auto_19244 ?auto_19250 ) ) ( not ( = ?auto_19245 ?auto_19246 ) ) ( not ( = ?auto_19246 ?auto_19250 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19250 ?auto_19245 ?auto_19243 )
      ( DELIVER-3PKG-VERIFY ?auto_19244 ?auto_19245 ?auto_19246 ?auto_19243 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19260 - OBJ
      ?auto_19261 - OBJ
      ?auto_19262 - OBJ
      ?auto_19259 - LOCATION
    )
    :vars
    (
      ?auto_19265 - LOCATION
      ?auto_19264 - CITY
      ?auto_19263 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19265 ?auto_19264 ) ( IN-CITY ?auto_19259 ?auto_19264 ) ( not ( = ?auto_19259 ?auto_19265 ) ) ( OBJ-AT ?auto_19262 ?auto_19259 ) ( not ( = ?auto_19262 ?auto_19260 ) ) ( OBJ-AT ?auto_19260 ?auto_19265 ) ( TRUCK-AT ?auto_19263 ?auto_19259 ) ( OBJ-AT ?auto_19261 ?auto_19259 ) ( not ( = ?auto_19260 ?auto_19261 ) ) ( not ( = ?auto_19261 ?auto_19262 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19262 ?auto_19260 ?auto_19259 )
      ( DELIVER-3PKG-VERIFY ?auto_19260 ?auto_19261 ?auto_19262 ?auto_19259 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19282 - OBJ
      ?auto_19283 - OBJ
      ?auto_19284 - OBJ
      ?auto_19281 - LOCATION
    )
    :vars
    (
      ?auto_19287 - LOCATION
      ?auto_19286 - CITY
      ?auto_19288 - OBJ
      ?auto_19285 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19287 ?auto_19286 ) ( IN-CITY ?auto_19281 ?auto_19286 ) ( not ( = ?auto_19281 ?auto_19287 ) ) ( OBJ-AT ?auto_19288 ?auto_19281 ) ( not ( = ?auto_19288 ?auto_19282 ) ) ( OBJ-AT ?auto_19282 ?auto_19287 ) ( TRUCK-AT ?auto_19285 ?auto_19281 ) ( OBJ-AT ?auto_19283 ?auto_19281 ) ( OBJ-AT ?auto_19284 ?auto_19281 ) ( not ( = ?auto_19282 ?auto_19283 ) ) ( not ( = ?auto_19282 ?auto_19284 ) ) ( not ( = ?auto_19283 ?auto_19284 ) ) ( not ( = ?auto_19283 ?auto_19288 ) ) ( not ( = ?auto_19284 ?auto_19288 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19288 ?auto_19282 ?auto_19281 )
      ( DELIVER-3PKG-VERIFY ?auto_19282 ?auto_19283 ?auto_19284 ?auto_19281 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19337 - OBJ
      ?auto_19338 - OBJ
      ?auto_19339 - OBJ
      ?auto_19340 - OBJ
      ?auto_19336 - LOCATION
    )
    :vars
    (
      ?auto_19343 - LOCATION
      ?auto_19342 - CITY
      ?auto_19341 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19343 ?auto_19342 ) ( IN-CITY ?auto_19336 ?auto_19342 ) ( not ( = ?auto_19336 ?auto_19343 ) ) ( OBJ-AT ?auto_19337 ?auto_19336 ) ( not ( = ?auto_19337 ?auto_19339 ) ) ( OBJ-AT ?auto_19339 ?auto_19343 ) ( TRUCK-AT ?auto_19341 ?auto_19336 ) ( OBJ-AT ?auto_19338 ?auto_19336 ) ( OBJ-AT ?auto_19340 ?auto_19336 ) ( not ( = ?auto_19337 ?auto_19338 ) ) ( not ( = ?auto_19337 ?auto_19340 ) ) ( not ( = ?auto_19338 ?auto_19339 ) ) ( not ( = ?auto_19338 ?auto_19340 ) ) ( not ( = ?auto_19339 ?auto_19340 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19337 ?auto_19339 ?auto_19336 )
      ( DELIVER-4PKG-VERIFY ?auto_19337 ?auto_19338 ?auto_19339 ?auto_19340 ?auto_19336 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19361 - OBJ
      ?auto_19362 - OBJ
      ?auto_19363 - OBJ
      ?auto_19364 - OBJ
      ?auto_19360 - LOCATION
    )
    :vars
    (
      ?auto_19367 - LOCATION
      ?auto_19366 - CITY
      ?auto_19365 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19367 ?auto_19366 ) ( IN-CITY ?auto_19360 ?auto_19366 ) ( not ( = ?auto_19360 ?auto_19367 ) ) ( OBJ-AT ?auto_19363 ?auto_19360 ) ( not ( = ?auto_19363 ?auto_19364 ) ) ( OBJ-AT ?auto_19364 ?auto_19367 ) ( TRUCK-AT ?auto_19365 ?auto_19360 ) ( OBJ-AT ?auto_19361 ?auto_19360 ) ( OBJ-AT ?auto_19362 ?auto_19360 ) ( not ( = ?auto_19361 ?auto_19362 ) ) ( not ( = ?auto_19361 ?auto_19363 ) ) ( not ( = ?auto_19361 ?auto_19364 ) ) ( not ( = ?auto_19362 ?auto_19363 ) ) ( not ( = ?auto_19362 ?auto_19364 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19363 ?auto_19364 ?auto_19360 )
      ( DELIVER-4PKG-VERIFY ?auto_19361 ?auto_19362 ?auto_19363 ?auto_19364 ?auto_19360 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19401 - OBJ
      ?auto_19402 - OBJ
      ?auto_19403 - OBJ
      ?auto_19404 - OBJ
      ?auto_19400 - LOCATION
    )
    :vars
    (
      ?auto_19407 - LOCATION
      ?auto_19406 - CITY
      ?auto_19405 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19407 ?auto_19406 ) ( IN-CITY ?auto_19400 ?auto_19406 ) ( not ( = ?auto_19400 ?auto_19407 ) ) ( OBJ-AT ?auto_19403 ?auto_19400 ) ( not ( = ?auto_19403 ?auto_19402 ) ) ( OBJ-AT ?auto_19402 ?auto_19407 ) ( TRUCK-AT ?auto_19405 ?auto_19400 ) ( OBJ-AT ?auto_19401 ?auto_19400 ) ( OBJ-AT ?auto_19404 ?auto_19400 ) ( not ( = ?auto_19401 ?auto_19402 ) ) ( not ( = ?auto_19401 ?auto_19403 ) ) ( not ( = ?auto_19401 ?auto_19404 ) ) ( not ( = ?auto_19402 ?auto_19404 ) ) ( not ( = ?auto_19403 ?auto_19404 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19403 ?auto_19402 ?auto_19400 )
      ( DELIVER-4PKG-VERIFY ?auto_19401 ?auto_19402 ?auto_19403 ?auto_19404 ?auto_19400 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19433 - OBJ
      ?auto_19434 - OBJ
      ?auto_19435 - OBJ
      ?auto_19436 - OBJ
      ?auto_19432 - LOCATION
    )
    :vars
    (
      ?auto_19439 - LOCATION
      ?auto_19438 - CITY
      ?auto_19437 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19439 ?auto_19438 ) ( IN-CITY ?auto_19432 ?auto_19438 ) ( not ( = ?auto_19432 ?auto_19439 ) ) ( OBJ-AT ?auto_19433 ?auto_19432 ) ( not ( = ?auto_19433 ?auto_19434 ) ) ( OBJ-AT ?auto_19434 ?auto_19439 ) ( TRUCK-AT ?auto_19437 ?auto_19432 ) ( OBJ-AT ?auto_19435 ?auto_19432 ) ( OBJ-AT ?auto_19436 ?auto_19432 ) ( not ( = ?auto_19433 ?auto_19435 ) ) ( not ( = ?auto_19433 ?auto_19436 ) ) ( not ( = ?auto_19434 ?auto_19435 ) ) ( not ( = ?auto_19434 ?auto_19436 ) ) ( not ( = ?auto_19435 ?auto_19436 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19433 ?auto_19434 ?auto_19432 )
      ( DELIVER-4PKG-VERIFY ?auto_19433 ?auto_19434 ?auto_19435 ?auto_19436 ?auto_19432 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19481 - OBJ
      ?auto_19482 - OBJ
      ?auto_19483 - OBJ
      ?auto_19484 - OBJ
      ?auto_19480 - LOCATION
    )
    :vars
    (
      ?auto_19487 - LOCATION
      ?auto_19486 - CITY
      ?auto_19485 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19487 ?auto_19486 ) ( IN-CITY ?auto_19480 ?auto_19486 ) ( not ( = ?auto_19480 ?auto_19487 ) ) ( OBJ-AT ?auto_19482 ?auto_19480 ) ( not ( = ?auto_19482 ?auto_19484 ) ) ( OBJ-AT ?auto_19484 ?auto_19487 ) ( TRUCK-AT ?auto_19485 ?auto_19480 ) ( OBJ-AT ?auto_19481 ?auto_19480 ) ( OBJ-AT ?auto_19483 ?auto_19480 ) ( not ( = ?auto_19481 ?auto_19482 ) ) ( not ( = ?auto_19481 ?auto_19483 ) ) ( not ( = ?auto_19481 ?auto_19484 ) ) ( not ( = ?auto_19482 ?auto_19483 ) ) ( not ( = ?auto_19483 ?auto_19484 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19482 ?auto_19484 ?auto_19480 )
      ( DELIVER-4PKG-VERIFY ?auto_19481 ?auto_19482 ?auto_19483 ?auto_19484 ?auto_19480 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19489 - OBJ
      ?auto_19490 - OBJ
      ?auto_19491 - OBJ
      ?auto_19492 - OBJ
      ?auto_19488 - LOCATION
    )
    :vars
    (
      ?auto_19495 - LOCATION
      ?auto_19494 - CITY
      ?auto_19493 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19495 ?auto_19494 ) ( IN-CITY ?auto_19488 ?auto_19494 ) ( not ( = ?auto_19488 ?auto_19495 ) ) ( OBJ-AT ?auto_19490 ?auto_19488 ) ( not ( = ?auto_19490 ?auto_19491 ) ) ( OBJ-AT ?auto_19491 ?auto_19495 ) ( TRUCK-AT ?auto_19493 ?auto_19488 ) ( OBJ-AT ?auto_19489 ?auto_19488 ) ( OBJ-AT ?auto_19492 ?auto_19488 ) ( not ( = ?auto_19489 ?auto_19490 ) ) ( not ( = ?auto_19489 ?auto_19491 ) ) ( not ( = ?auto_19489 ?auto_19492 ) ) ( not ( = ?auto_19490 ?auto_19492 ) ) ( not ( = ?auto_19491 ?auto_19492 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19490 ?auto_19491 ?auto_19488 )
      ( DELIVER-4PKG-VERIFY ?auto_19489 ?auto_19490 ?auto_19491 ?auto_19492 ?auto_19488 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19521 - OBJ
      ?auto_19522 - OBJ
      ?auto_19523 - OBJ
      ?auto_19524 - OBJ
      ?auto_19520 - LOCATION
    )
    :vars
    (
      ?auto_19527 - LOCATION
      ?auto_19526 - CITY
      ?auto_19528 - OBJ
      ?auto_19525 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19527 ?auto_19526 ) ( IN-CITY ?auto_19520 ?auto_19526 ) ( not ( = ?auto_19520 ?auto_19527 ) ) ( OBJ-AT ?auto_19528 ?auto_19520 ) ( not ( = ?auto_19528 ?auto_19524 ) ) ( OBJ-AT ?auto_19524 ?auto_19527 ) ( TRUCK-AT ?auto_19525 ?auto_19520 ) ( OBJ-AT ?auto_19521 ?auto_19520 ) ( OBJ-AT ?auto_19522 ?auto_19520 ) ( OBJ-AT ?auto_19523 ?auto_19520 ) ( not ( = ?auto_19521 ?auto_19522 ) ) ( not ( = ?auto_19521 ?auto_19523 ) ) ( not ( = ?auto_19521 ?auto_19524 ) ) ( not ( = ?auto_19521 ?auto_19528 ) ) ( not ( = ?auto_19522 ?auto_19523 ) ) ( not ( = ?auto_19522 ?auto_19524 ) ) ( not ( = ?auto_19522 ?auto_19528 ) ) ( not ( = ?auto_19523 ?auto_19524 ) ) ( not ( = ?auto_19523 ?auto_19528 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19528 ?auto_19524 ?auto_19520 )
      ( DELIVER-4PKG-VERIFY ?auto_19521 ?auto_19522 ?auto_19523 ?auto_19524 ?auto_19520 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19538 - OBJ
      ?auto_19539 - OBJ
      ?auto_19540 - OBJ
      ?auto_19541 - OBJ
      ?auto_19537 - LOCATION
    )
    :vars
    (
      ?auto_19544 - LOCATION
      ?auto_19543 - CITY
      ?auto_19545 - OBJ
      ?auto_19542 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19544 ?auto_19543 ) ( IN-CITY ?auto_19537 ?auto_19543 ) ( not ( = ?auto_19537 ?auto_19544 ) ) ( OBJ-AT ?auto_19545 ?auto_19537 ) ( not ( = ?auto_19545 ?auto_19540 ) ) ( OBJ-AT ?auto_19540 ?auto_19544 ) ( TRUCK-AT ?auto_19542 ?auto_19537 ) ( OBJ-AT ?auto_19538 ?auto_19537 ) ( OBJ-AT ?auto_19539 ?auto_19537 ) ( OBJ-AT ?auto_19541 ?auto_19537 ) ( not ( = ?auto_19538 ?auto_19539 ) ) ( not ( = ?auto_19538 ?auto_19540 ) ) ( not ( = ?auto_19538 ?auto_19541 ) ) ( not ( = ?auto_19538 ?auto_19545 ) ) ( not ( = ?auto_19539 ?auto_19540 ) ) ( not ( = ?auto_19539 ?auto_19541 ) ) ( not ( = ?auto_19539 ?auto_19545 ) ) ( not ( = ?auto_19540 ?auto_19541 ) ) ( not ( = ?auto_19541 ?auto_19545 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19545 ?auto_19540 ?auto_19537 )
      ( DELIVER-4PKG-VERIFY ?auto_19538 ?auto_19539 ?auto_19540 ?auto_19541 ?auto_19537 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19588 - OBJ
      ?auto_19589 - OBJ
      ?auto_19590 - OBJ
      ?auto_19591 - OBJ
      ?auto_19587 - LOCATION
    )
    :vars
    (
      ?auto_19594 - LOCATION
      ?auto_19593 - CITY
      ?auto_19595 - OBJ
      ?auto_19592 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19594 ?auto_19593 ) ( IN-CITY ?auto_19587 ?auto_19593 ) ( not ( = ?auto_19587 ?auto_19594 ) ) ( OBJ-AT ?auto_19595 ?auto_19587 ) ( not ( = ?auto_19595 ?auto_19589 ) ) ( OBJ-AT ?auto_19589 ?auto_19594 ) ( TRUCK-AT ?auto_19592 ?auto_19587 ) ( OBJ-AT ?auto_19588 ?auto_19587 ) ( OBJ-AT ?auto_19590 ?auto_19587 ) ( OBJ-AT ?auto_19591 ?auto_19587 ) ( not ( = ?auto_19588 ?auto_19589 ) ) ( not ( = ?auto_19588 ?auto_19590 ) ) ( not ( = ?auto_19588 ?auto_19591 ) ) ( not ( = ?auto_19588 ?auto_19595 ) ) ( not ( = ?auto_19589 ?auto_19590 ) ) ( not ( = ?auto_19589 ?auto_19591 ) ) ( not ( = ?auto_19590 ?auto_19591 ) ) ( not ( = ?auto_19590 ?auto_19595 ) ) ( not ( = ?auto_19591 ?auto_19595 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19595 ?auto_19589 ?auto_19587 )
      ( DELIVER-4PKG-VERIFY ?auto_19588 ?auto_19589 ?auto_19590 ?auto_19591 ?auto_19587 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19640 - OBJ
      ?auto_19641 - OBJ
      ?auto_19642 - OBJ
      ?auto_19643 - OBJ
      ?auto_19639 - LOCATION
    )
    :vars
    (
      ?auto_19646 - LOCATION
      ?auto_19645 - CITY
      ?auto_19644 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19646 ?auto_19645 ) ( IN-CITY ?auto_19639 ?auto_19645 ) ( not ( = ?auto_19639 ?auto_19646 ) ) ( OBJ-AT ?auto_19641 ?auto_19639 ) ( not ( = ?auto_19641 ?auto_19640 ) ) ( OBJ-AT ?auto_19640 ?auto_19646 ) ( TRUCK-AT ?auto_19644 ?auto_19639 ) ( OBJ-AT ?auto_19642 ?auto_19639 ) ( OBJ-AT ?auto_19643 ?auto_19639 ) ( not ( = ?auto_19640 ?auto_19642 ) ) ( not ( = ?auto_19640 ?auto_19643 ) ) ( not ( = ?auto_19641 ?auto_19642 ) ) ( not ( = ?auto_19641 ?auto_19643 ) ) ( not ( = ?auto_19642 ?auto_19643 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19641 ?auto_19640 ?auto_19639 )
      ( DELIVER-4PKG-VERIFY ?auto_19640 ?auto_19641 ?auto_19642 ?auto_19643 ?auto_19639 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19704 - OBJ
      ?auto_19705 - OBJ
      ?auto_19706 - OBJ
      ?auto_19707 - OBJ
      ?auto_19703 - LOCATION
    )
    :vars
    (
      ?auto_19710 - LOCATION
      ?auto_19709 - CITY
      ?auto_19708 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19710 ?auto_19709 ) ( IN-CITY ?auto_19703 ?auto_19709 ) ( not ( = ?auto_19703 ?auto_19710 ) ) ( OBJ-AT ?auto_19707 ?auto_19703 ) ( not ( = ?auto_19707 ?auto_19704 ) ) ( OBJ-AT ?auto_19704 ?auto_19710 ) ( TRUCK-AT ?auto_19708 ?auto_19703 ) ( OBJ-AT ?auto_19705 ?auto_19703 ) ( OBJ-AT ?auto_19706 ?auto_19703 ) ( not ( = ?auto_19704 ?auto_19705 ) ) ( not ( = ?auto_19704 ?auto_19706 ) ) ( not ( = ?auto_19705 ?auto_19706 ) ) ( not ( = ?auto_19705 ?auto_19707 ) ) ( not ( = ?auto_19706 ?auto_19707 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19707 ?auto_19704 ?auto_19703 )
      ( DELIVER-4PKG-VERIFY ?auto_19704 ?auto_19705 ?auto_19706 ?auto_19707 ?auto_19703 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19736 - OBJ
      ?auto_19737 - OBJ
      ?auto_19738 - OBJ
      ?auto_19739 - OBJ
      ?auto_19735 - LOCATION
    )
    :vars
    (
      ?auto_19742 - LOCATION
      ?auto_19741 - CITY
      ?auto_19743 - OBJ
      ?auto_19740 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19742 ?auto_19741 ) ( IN-CITY ?auto_19735 ?auto_19741 ) ( not ( = ?auto_19735 ?auto_19742 ) ) ( OBJ-AT ?auto_19743 ?auto_19735 ) ( not ( = ?auto_19743 ?auto_19736 ) ) ( OBJ-AT ?auto_19736 ?auto_19742 ) ( TRUCK-AT ?auto_19740 ?auto_19735 ) ( OBJ-AT ?auto_19737 ?auto_19735 ) ( OBJ-AT ?auto_19738 ?auto_19735 ) ( OBJ-AT ?auto_19739 ?auto_19735 ) ( not ( = ?auto_19736 ?auto_19737 ) ) ( not ( = ?auto_19736 ?auto_19738 ) ) ( not ( = ?auto_19736 ?auto_19739 ) ) ( not ( = ?auto_19737 ?auto_19738 ) ) ( not ( = ?auto_19737 ?auto_19739 ) ) ( not ( = ?auto_19737 ?auto_19743 ) ) ( not ( = ?auto_19738 ?auto_19739 ) ) ( not ( = ?auto_19738 ?auto_19743 ) ) ( not ( = ?auto_19739 ?auto_19743 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19743 ?auto_19736 ?auto_19735 )
      ( DELIVER-4PKG-VERIFY ?auto_19736 ?auto_19737 ?auto_19738 ?auto_19739 ?auto_19735 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19899 - OBJ
      ?auto_19900 - OBJ
      ?auto_19901 - OBJ
      ?auto_19898 - LOCATION
    )
    :vars
    (
      ?auto_19902 - LOCATION
      ?auto_19904 - CITY
      ?auto_19903 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19902 ?auto_19904 ) ( IN-CITY ?auto_19898 ?auto_19904 ) ( not ( = ?auto_19898 ?auto_19902 ) ) ( OBJ-AT ?auto_19901 ?auto_19898 ) ( not ( = ?auto_19901 ?auto_19900 ) ) ( OBJ-AT ?auto_19900 ?auto_19902 ) ( TRUCK-AT ?auto_19903 ?auto_19898 ) ( OBJ-AT ?auto_19899 ?auto_19898 ) ( not ( = ?auto_19899 ?auto_19900 ) ) ( not ( = ?auto_19899 ?auto_19901 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19901 ?auto_19900 ?auto_19898 )
      ( DELIVER-3PKG-VERIFY ?auto_19899 ?auto_19900 ?auto_19901 ?auto_19898 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_20560 - OBJ
      ?auto_20559 - LOCATION
    )
    :vars
    (
      ?auto_20561 - LOCATION
      ?auto_20564 - CITY
      ?auto_20562 - OBJ
      ?auto_20563 - TRUCK
      ?auto_20565 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20561 ?auto_20564 ) ( IN-CITY ?auto_20559 ?auto_20564 ) ( not ( = ?auto_20559 ?auto_20561 ) ) ( OBJ-AT ?auto_20562 ?auto_20559 ) ( not ( = ?auto_20562 ?auto_20560 ) ) ( OBJ-AT ?auto_20560 ?auto_20561 ) ( TRUCK-AT ?auto_20563 ?auto_20565 ) ( IN-CITY ?auto_20565 ?auto_20564 ) ( not ( = ?auto_20559 ?auto_20565 ) ) ( not ( = ?auto_20561 ?auto_20565 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_20563 ?auto_20565 ?auto_20559 ?auto_20564 )
      ( DELIVER-2PKG ?auto_20562 ?auto_20560 ?auto_20559 )
      ( DELIVER-1PKG-VERIFY ?auto_20560 ?auto_20559 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_20567 - OBJ
      ?auto_20568 - OBJ
      ?auto_20566 - LOCATION
    )
    :vars
    (
      ?auto_20572 - LOCATION
      ?auto_20570 - CITY
      ?auto_20569 - TRUCK
      ?auto_20571 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20572 ?auto_20570 ) ( IN-CITY ?auto_20566 ?auto_20570 ) ( not ( = ?auto_20566 ?auto_20572 ) ) ( OBJ-AT ?auto_20567 ?auto_20566 ) ( not ( = ?auto_20567 ?auto_20568 ) ) ( OBJ-AT ?auto_20568 ?auto_20572 ) ( TRUCK-AT ?auto_20569 ?auto_20571 ) ( IN-CITY ?auto_20571 ?auto_20570 ) ( not ( = ?auto_20566 ?auto_20571 ) ) ( not ( = ?auto_20572 ?auto_20571 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_20568 ?auto_20566 )
      ( DELIVER-2PKG-VERIFY ?auto_20567 ?auto_20568 ?auto_20566 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_20582 - OBJ
      ?auto_20583 - OBJ
      ?auto_20581 - LOCATION
    )
    :vars
    (
      ?auto_20586 - LOCATION
      ?auto_20587 - CITY
      ?auto_20585 - TRUCK
      ?auto_20584 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20586 ?auto_20587 ) ( IN-CITY ?auto_20581 ?auto_20587 ) ( not ( = ?auto_20581 ?auto_20586 ) ) ( OBJ-AT ?auto_20583 ?auto_20581 ) ( not ( = ?auto_20583 ?auto_20582 ) ) ( OBJ-AT ?auto_20582 ?auto_20586 ) ( TRUCK-AT ?auto_20585 ?auto_20584 ) ( IN-CITY ?auto_20584 ?auto_20587 ) ( not ( = ?auto_20581 ?auto_20584 ) ) ( not ( = ?auto_20586 ?auto_20584 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20583 ?auto_20582 ?auto_20581 )
      ( DELIVER-2PKG-VERIFY ?auto_20582 ?auto_20583 ?auto_20581 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_20605 - OBJ
      ?auto_20606 - OBJ
      ?auto_20607 - OBJ
      ?auto_20604 - LOCATION
    )
    :vars
    (
      ?auto_20610 - LOCATION
      ?auto_20611 - CITY
      ?auto_20609 - TRUCK
      ?auto_20608 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20610 ?auto_20611 ) ( IN-CITY ?auto_20604 ?auto_20611 ) ( not ( = ?auto_20604 ?auto_20610 ) ) ( OBJ-AT ?auto_20606 ?auto_20604 ) ( not ( = ?auto_20606 ?auto_20607 ) ) ( OBJ-AT ?auto_20607 ?auto_20610 ) ( TRUCK-AT ?auto_20609 ?auto_20608 ) ( IN-CITY ?auto_20608 ?auto_20611 ) ( not ( = ?auto_20604 ?auto_20608 ) ) ( not ( = ?auto_20610 ?auto_20608 ) ) ( OBJ-AT ?auto_20605 ?auto_20604 ) ( not ( = ?auto_20605 ?auto_20606 ) ) ( not ( = ?auto_20605 ?auto_20607 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20606 ?auto_20607 ?auto_20604 )
      ( DELIVER-3PKG-VERIFY ?auto_20605 ?auto_20606 ?auto_20607 ?auto_20604 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_20621 - OBJ
      ?auto_20622 - OBJ
      ?auto_20623 - OBJ
      ?auto_20620 - LOCATION
    )
    :vars
    (
      ?auto_20626 - LOCATION
      ?auto_20627 - CITY
      ?auto_20625 - TRUCK
      ?auto_20624 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20626 ?auto_20627 ) ( IN-CITY ?auto_20620 ?auto_20627 ) ( not ( = ?auto_20620 ?auto_20626 ) ) ( OBJ-AT ?auto_20623 ?auto_20620 ) ( not ( = ?auto_20623 ?auto_20622 ) ) ( OBJ-AT ?auto_20622 ?auto_20626 ) ( TRUCK-AT ?auto_20625 ?auto_20624 ) ( IN-CITY ?auto_20624 ?auto_20627 ) ( not ( = ?auto_20620 ?auto_20624 ) ) ( not ( = ?auto_20626 ?auto_20624 ) ) ( OBJ-AT ?auto_20621 ?auto_20620 ) ( not ( = ?auto_20621 ?auto_20622 ) ) ( not ( = ?auto_20621 ?auto_20623 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20623 ?auto_20622 ?auto_20620 )
      ( DELIVER-3PKG-VERIFY ?auto_20621 ?auto_20622 ?auto_20623 ?auto_20620 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_20688 - OBJ
      ?auto_20689 - OBJ
      ?auto_20690 - OBJ
      ?auto_20687 - LOCATION
    )
    :vars
    (
      ?auto_20693 - LOCATION
      ?auto_20694 - CITY
      ?auto_20692 - TRUCK
      ?auto_20691 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20693 ?auto_20694 ) ( IN-CITY ?auto_20687 ?auto_20694 ) ( not ( = ?auto_20687 ?auto_20693 ) ) ( OBJ-AT ?auto_20690 ?auto_20687 ) ( not ( = ?auto_20690 ?auto_20688 ) ) ( OBJ-AT ?auto_20688 ?auto_20693 ) ( TRUCK-AT ?auto_20692 ?auto_20691 ) ( IN-CITY ?auto_20691 ?auto_20694 ) ( not ( = ?auto_20687 ?auto_20691 ) ) ( not ( = ?auto_20693 ?auto_20691 ) ) ( OBJ-AT ?auto_20689 ?auto_20687 ) ( not ( = ?auto_20688 ?auto_20689 ) ) ( not ( = ?auto_20689 ?auto_20690 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20690 ?auto_20688 ?auto_20687 )
      ( DELIVER-3PKG-VERIFY ?auto_20688 ?auto_20689 ?auto_20690 ?auto_20687 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_20764 - OBJ
      ?auto_20765 - OBJ
      ?auto_20766 - OBJ
      ?auto_20767 - OBJ
      ?auto_20763 - LOCATION
    )
    :vars
    (
      ?auto_20770 - LOCATION
      ?auto_20771 - CITY
      ?auto_20769 - TRUCK
      ?auto_20768 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20770 ?auto_20771 ) ( IN-CITY ?auto_20763 ?auto_20771 ) ( not ( = ?auto_20763 ?auto_20770 ) ) ( OBJ-AT ?auto_20765 ?auto_20763 ) ( not ( = ?auto_20765 ?auto_20767 ) ) ( OBJ-AT ?auto_20767 ?auto_20770 ) ( TRUCK-AT ?auto_20769 ?auto_20768 ) ( IN-CITY ?auto_20768 ?auto_20771 ) ( not ( = ?auto_20763 ?auto_20768 ) ) ( not ( = ?auto_20770 ?auto_20768 ) ) ( OBJ-AT ?auto_20764 ?auto_20763 ) ( OBJ-AT ?auto_20766 ?auto_20763 ) ( not ( = ?auto_20764 ?auto_20765 ) ) ( not ( = ?auto_20764 ?auto_20766 ) ) ( not ( = ?auto_20764 ?auto_20767 ) ) ( not ( = ?auto_20765 ?auto_20766 ) ) ( not ( = ?auto_20766 ?auto_20767 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20765 ?auto_20767 ?auto_20763 )
      ( DELIVER-4PKG-VERIFY ?auto_20764 ?auto_20765 ?auto_20766 ?auto_20767 ?auto_20763 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_20782 - OBJ
      ?auto_20783 - OBJ
      ?auto_20784 - OBJ
      ?auto_20785 - OBJ
      ?auto_20781 - LOCATION
    )
    :vars
    (
      ?auto_20788 - LOCATION
      ?auto_20789 - CITY
      ?auto_20787 - TRUCK
      ?auto_20786 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20788 ?auto_20789 ) ( IN-CITY ?auto_20781 ?auto_20789 ) ( not ( = ?auto_20781 ?auto_20788 ) ) ( OBJ-AT ?auto_20782 ?auto_20781 ) ( not ( = ?auto_20782 ?auto_20784 ) ) ( OBJ-AT ?auto_20784 ?auto_20788 ) ( TRUCK-AT ?auto_20787 ?auto_20786 ) ( IN-CITY ?auto_20786 ?auto_20789 ) ( not ( = ?auto_20781 ?auto_20786 ) ) ( not ( = ?auto_20788 ?auto_20786 ) ) ( OBJ-AT ?auto_20783 ?auto_20781 ) ( OBJ-AT ?auto_20785 ?auto_20781 ) ( not ( = ?auto_20782 ?auto_20783 ) ) ( not ( = ?auto_20782 ?auto_20785 ) ) ( not ( = ?auto_20783 ?auto_20784 ) ) ( not ( = ?auto_20783 ?auto_20785 ) ) ( not ( = ?auto_20784 ?auto_20785 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20782 ?auto_20784 ?auto_20781 )
      ( DELIVER-4PKG-VERIFY ?auto_20782 ?auto_20783 ?auto_20784 ?auto_20785 ?auto_20781 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_20854 - OBJ
      ?auto_20855 - OBJ
      ?auto_20856 - OBJ
      ?auto_20857 - OBJ
      ?auto_20853 - LOCATION
    )
    :vars
    (
      ?auto_20860 - LOCATION
      ?auto_20861 - CITY
      ?auto_20859 - TRUCK
      ?auto_20858 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_20860 ?auto_20861 ) ( IN-CITY ?auto_20853 ?auto_20861 ) ( not ( = ?auto_20853 ?auto_20860 ) ) ( OBJ-AT ?auto_20854 ?auto_20853 ) ( not ( = ?auto_20854 ?auto_20855 ) ) ( OBJ-AT ?auto_20855 ?auto_20860 ) ( TRUCK-AT ?auto_20859 ?auto_20858 ) ( IN-CITY ?auto_20858 ?auto_20861 ) ( not ( = ?auto_20853 ?auto_20858 ) ) ( not ( = ?auto_20860 ?auto_20858 ) ) ( OBJ-AT ?auto_20856 ?auto_20853 ) ( OBJ-AT ?auto_20857 ?auto_20853 ) ( not ( = ?auto_20854 ?auto_20856 ) ) ( not ( = ?auto_20854 ?auto_20857 ) ) ( not ( = ?auto_20855 ?auto_20856 ) ) ( not ( = ?auto_20855 ?auto_20857 ) ) ( not ( = ?auto_20856 ?auto_20857 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20854 ?auto_20855 ?auto_20853 )
      ( DELIVER-4PKG-VERIFY ?auto_20854 ?auto_20855 ?auto_20856 ?auto_20857 ?auto_20853 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_21113 - OBJ
      ?auto_21114 - OBJ
      ?auto_21115 - OBJ
      ?auto_21116 - OBJ
      ?auto_21112 - LOCATION
    )
    :vars
    (
      ?auto_21119 - LOCATION
      ?auto_21120 - CITY
      ?auto_21118 - TRUCK
      ?auto_21117 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_21119 ?auto_21120 ) ( IN-CITY ?auto_21112 ?auto_21120 ) ( not ( = ?auto_21112 ?auto_21119 ) ) ( OBJ-AT ?auto_21115 ?auto_21112 ) ( not ( = ?auto_21115 ?auto_21113 ) ) ( OBJ-AT ?auto_21113 ?auto_21119 ) ( TRUCK-AT ?auto_21118 ?auto_21117 ) ( IN-CITY ?auto_21117 ?auto_21120 ) ( not ( = ?auto_21112 ?auto_21117 ) ) ( not ( = ?auto_21119 ?auto_21117 ) ) ( OBJ-AT ?auto_21114 ?auto_21112 ) ( OBJ-AT ?auto_21116 ?auto_21112 ) ( not ( = ?auto_21113 ?auto_21114 ) ) ( not ( = ?auto_21113 ?auto_21116 ) ) ( not ( = ?auto_21114 ?auto_21115 ) ) ( not ( = ?auto_21114 ?auto_21116 ) ) ( not ( = ?auto_21115 ?auto_21116 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21115 ?auto_21113 ?auto_21112 )
      ( DELIVER-4PKG-VERIFY ?auto_21113 ?auto_21114 ?auto_21115 ?auto_21116 ?auto_21112 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_21396 - OBJ
      ?auto_21397 - OBJ
      ?auto_21398 - OBJ
      ?auto_21395 - LOCATION
    )
    :vars
    (
      ?auto_21402 - LOCATION
      ?auto_21401 - CITY
      ?auto_21399 - TRUCK
      ?auto_21400 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_21402 ?auto_21401 ) ( IN-CITY ?auto_21395 ?auto_21401 ) ( not ( = ?auto_21395 ?auto_21402 ) ) ( OBJ-AT ?auto_21396 ?auto_21395 ) ( not ( = ?auto_21396 ?auto_21398 ) ) ( OBJ-AT ?auto_21398 ?auto_21402 ) ( TRUCK-AT ?auto_21399 ?auto_21400 ) ( IN-CITY ?auto_21400 ?auto_21401 ) ( not ( = ?auto_21395 ?auto_21400 ) ) ( not ( = ?auto_21402 ?auto_21400 ) ) ( OBJ-AT ?auto_21397 ?auto_21395 ) ( not ( = ?auto_21396 ?auto_21397 ) ) ( not ( = ?auto_21397 ?auto_21398 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21396 ?auto_21398 ?auto_21395 )
      ( DELIVER-3PKG-VERIFY ?auto_21396 ?auto_21397 ?auto_21398 ?auto_21395 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_21479 - OBJ
      ?auto_21480 - OBJ
      ?auto_21481 - OBJ
      ?auto_21478 - LOCATION
    )
    :vars
    (
      ?auto_21485 - LOCATION
      ?auto_21484 - CITY
      ?auto_21482 - TRUCK
      ?auto_21483 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_21485 ?auto_21484 ) ( IN-CITY ?auto_21478 ?auto_21484 ) ( not ( = ?auto_21478 ?auto_21485 ) ) ( OBJ-AT ?auto_21480 ?auto_21478 ) ( not ( = ?auto_21480 ?auto_21479 ) ) ( OBJ-AT ?auto_21479 ?auto_21485 ) ( TRUCK-AT ?auto_21482 ?auto_21483 ) ( IN-CITY ?auto_21483 ?auto_21484 ) ( not ( = ?auto_21478 ?auto_21483 ) ) ( not ( = ?auto_21485 ?auto_21483 ) ) ( OBJ-AT ?auto_21481 ?auto_21478 ) ( not ( = ?auto_21479 ?auto_21481 ) ) ( not ( = ?auto_21480 ?auto_21481 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21480 ?auto_21479 ?auto_21478 )
      ( DELIVER-3PKG-VERIFY ?auto_21479 ?auto_21480 ?auto_21481 ?auto_21478 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_21555 - OBJ
      ?auto_21556 - OBJ
      ?auto_21557 - OBJ
      ?auto_21558 - OBJ
      ?auto_21554 - LOCATION
    )
    :vars
    (
      ?auto_21562 - LOCATION
      ?auto_21561 - CITY
      ?auto_21559 - TRUCK
      ?auto_21560 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_21562 ?auto_21561 ) ( IN-CITY ?auto_21554 ?auto_21561 ) ( not ( = ?auto_21554 ?auto_21562 ) ) ( OBJ-AT ?auto_21555 ?auto_21554 ) ( not ( = ?auto_21555 ?auto_21558 ) ) ( OBJ-AT ?auto_21558 ?auto_21562 ) ( TRUCK-AT ?auto_21559 ?auto_21560 ) ( IN-CITY ?auto_21560 ?auto_21561 ) ( not ( = ?auto_21554 ?auto_21560 ) ) ( not ( = ?auto_21562 ?auto_21560 ) ) ( OBJ-AT ?auto_21556 ?auto_21554 ) ( OBJ-AT ?auto_21557 ?auto_21554 ) ( not ( = ?auto_21555 ?auto_21556 ) ) ( not ( = ?auto_21555 ?auto_21557 ) ) ( not ( = ?auto_21556 ?auto_21557 ) ) ( not ( = ?auto_21556 ?auto_21558 ) ) ( not ( = ?auto_21557 ?auto_21558 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21555 ?auto_21558 ?auto_21554 )
      ( DELIVER-4PKG-VERIFY ?auto_21555 ?auto_21556 ?auto_21557 ?auto_21558 ?auto_21554 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_21904 - OBJ
      ?auto_21905 - OBJ
      ?auto_21906 - OBJ
      ?auto_21907 - OBJ
      ?auto_21903 - LOCATION
    )
    :vars
    (
      ?auto_21911 - LOCATION
      ?auto_21910 - CITY
      ?auto_21908 - TRUCK
      ?auto_21909 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_21911 ?auto_21910 ) ( IN-CITY ?auto_21903 ?auto_21910 ) ( not ( = ?auto_21903 ?auto_21911 ) ) ( OBJ-AT ?auto_21905 ?auto_21903 ) ( not ( = ?auto_21905 ?auto_21904 ) ) ( OBJ-AT ?auto_21904 ?auto_21911 ) ( TRUCK-AT ?auto_21908 ?auto_21909 ) ( IN-CITY ?auto_21909 ?auto_21910 ) ( not ( = ?auto_21903 ?auto_21909 ) ) ( not ( = ?auto_21911 ?auto_21909 ) ) ( OBJ-AT ?auto_21906 ?auto_21903 ) ( OBJ-AT ?auto_21907 ?auto_21903 ) ( not ( = ?auto_21904 ?auto_21906 ) ) ( not ( = ?auto_21904 ?auto_21907 ) ) ( not ( = ?auto_21905 ?auto_21906 ) ) ( not ( = ?auto_21905 ?auto_21907 ) ) ( not ( = ?auto_21906 ?auto_21907 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_21905 ?auto_21904 ?auto_21903 )
      ( DELIVER-4PKG-VERIFY ?auto_21904 ?auto_21905 ?auto_21906 ?auto_21907 ?auto_21903 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_23563 - OBJ
      ?auto_23562 - LOCATION
    )
    :vars
    (
      ?auto_23565 - LOCATION
      ?auto_23566 - CITY
      ?auto_23564 - OBJ
      ?auto_23567 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_23565 ?auto_23566 ) ( IN-CITY ?auto_23562 ?auto_23566 ) ( not ( = ?auto_23562 ?auto_23565 ) ) ( not ( = ?auto_23564 ?auto_23563 ) ) ( OBJ-AT ?auto_23563 ?auto_23565 ) ( IN-TRUCK ?auto_23564 ?auto_23567 ) ( TRUCK-AT ?auto_23567 ?auto_23565 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_23567 ?auto_23565 ?auto_23562 ?auto_23566 )
      ( DELIVER-2PKG ?auto_23564 ?auto_23563 ?auto_23562 )
      ( DELIVER-1PKG-VERIFY ?auto_23563 ?auto_23562 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_23569 - OBJ
      ?auto_23570 - OBJ
      ?auto_23568 - LOCATION
    )
    :vars
    (
      ?auto_23573 - LOCATION
      ?auto_23572 - CITY
      ?auto_23571 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_23573 ?auto_23572 ) ( IN-CITY ?auto_23568 ?auto_23572 ) ( not ( = ?auto_23568 ?auto_23573 ) ) ( not ( = ?auto_23569 ?auto_23570 ) ) ( OBJ-AT ?auto_23570 ?auto_23573 ) ( IN-TRUCK ?auto_23569 ?auto_23571 ) ( TRUCK-AT ?auto_23571 ?auto_23573 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_23570 ?auto_23568 )
      ( DELIVER-2PKG-VERIFY ?auto_23569 ?auto_23570 ?auto_23568 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_23582 - OBJ
      ?auto_23583 - OBJ
      ?auto_23581 - LOCATION
    )
    :vars
    (
      ?auto_23584 - LOCATION
      ?auto_23585 - CITY
      ?auto_23586 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_23584 ?auto_23585 ) ( IN-CITY ?auto_23581 ?auto_23585 ) ( not ( = ?auto_23581 ?auto_23584 ) ) ( not ( = ?auto_23583 ?auto_23582 ) ) ( OBJ-AT ?auto_23582 ?auto_23584 ) ( IN-TRUCK ?auto_23583 ?auto_23586 ) ( TRUCK-AT ?auto_23586 ?auto_23584 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_23583 ?auto_23582 ?auto_23581 )
      ( DELIVER-2PKG-VERIFY ?auto_23582 ?auto_23583 ?auto_23581 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36533 - OBJ
      ?auto_36534 - OBJ
      ?auto_36535 - OBJ
      ?auto_36532 - LOCATION
    )
    :vars
    (
      ?auto_36536 - TRUCK
      ?auto_36537 - LOCATION
      ?auto_36538 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_36536 ?auto_36537 ) ( IN-CITY ?auto_36537 ?auto_36538 ) ( IN-CITY ?auto_36532 ?auto_36538 ) ( not ( = ?auto_36532 ?auto_36537 ) ) ( OBJ-AT ?auto_36533 ?auto_36532 ) ( not ( = ?auto_36533 ?auto_36534 ) ) ( OBJ-AT ?auto_36534 ?auto_36537 ) ( OBJ-AT ?auto_36535 ?auto_36532 ) ( not ( = ?auto_36533 ?auto_36535 ) ) ( not ( = ?auto_36534 ?auto_36535 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36533 ?auto_36534 ?auto_36532 )
      ( DELIVER-3PKG-VERIFY ?auto_36533 ?auto_36534 ?auto_36535 ?auto_36532 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_42176 - OBJ
      ?auto_42177 - OBJ
      ?auto_42178 - OBJ
      ?auto_42179 - OBJ
      ?auto_42175 - LOCATION
    )
    :vars
    (
      ?auto_42183 - LOCATION
      ?auto_42182 - CITY
      ?auto_42180 - TRUCK
      ?auto_42181 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_42183 ?auto_42182 ) ( IN-CITY ?auto_42175 ?auto_42182 ) ( not ( = ?auto_42175 ?auto_42183 ) ) ( OBJ-AT ?auto_42179 ?auto_42175 ) ( not ( = ?auto_42179 ?auto_42178 ) ) ( OBJ-AT ?auto_42178 ?auto_42183 ) ( TRUCK-AT ?auto_42180 ?auto_42181 ) ( IN-CITY ?auto_42181 ?auto_42182 ) ( not ( = ?auto_42175 ?auto_42181 ) ) ( not ( = ?auto_42183 ?auto_42181 ) ) ( OBJ-AT ?auto_42176 ?auto_42175 ) ( OBJ-AT ?auto_42177 ?auto_42175 ) ( not ( = ?auto_42176 ?auto_42177 ) ) ( not ( = ?auto_42176 ?auto_42178 ) ) ( not ( = ?auto_42176 ?auto_42179 ) ) ( not ( = ?auto_42177 ?auto_42178 ) ) ( not ( = ?auto_42177 ?auto_42179 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42179 ?auto_42178 ?auto_42175 )
      ( DELIVER-4PKG-VERIFY ?auto_42176 ?auto_42177 ?auto_42178 ?auto_42179 ?auto_42175 ) )
  )

)

