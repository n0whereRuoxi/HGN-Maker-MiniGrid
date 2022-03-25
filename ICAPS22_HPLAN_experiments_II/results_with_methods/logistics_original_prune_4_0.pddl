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
      ?auto_15065 - OBJ
      ?auto_15064 - LOCATION
    )
    :vars
    (
      ?auto_15066 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15066 ?auto_15064 ) ( IN-TRUCK ?auto_15065 ?auto_15066 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_15065 ?auto_15066 ?auto_15064 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15083 - OBJ
      ?auto_15082 - LOCATION
    )
    :vars
    (
      ?auto_15084 - TRUCK
      ?auto_15085 - LOCATION
      ?auto_15086 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15083 ?auto_15084 ) ( TRUCK-AT ?auto_15084 ?auto_15085 ) ( IN-CITY ?auto_15085 ?auto_15086 ) ( IN-CITY ?auto_15082 ?auto_15086 ) ( not ( = ?auto_15082 ?auto_15085 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15084 ?auto_15085 ?auto_15082 ?auto_15086 )
      ( DELIVER-1PKG ?auto_15083 ?auto_15082 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15109 - OBJ
      ?auto_15108 - LOCATION
    )
    :vars
    (
      ?auto_15112 - TRUCK
      ?auto_15110 - LOCATION
      ?auto_15111 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15112 ?auto_15110 ) ( IN-CITY ?auto_15110 ?auto_15111 ) ( IN-CITY ?auto_15108 ?auto_15111 ) ( not ( = ?auto_15108 ?auto_15110 ) ) ( OBJ-AT ?auto_15109 ?auto_15110 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15109 ?auto_15112 ?auto_15110 )
      ( DELIVER-1PKG ?auto_15109 ?auto_15108 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15135 - OBJ
      ?auto_15134 - LOCATION
    )
    :vars
    (
      ?auto_15136 - LOCATION
      ?auto_15137 - CITY
      ?auto_15138 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15136 ?auto_15137 ) ( IN-CITY ?auto_15134 ?auto_15137 ) ( not ( = ?auto_15134 ?auto_15136 ) ) ( OBJ-AT ?auto_15135 ?auto_15136 ) ( TRUCK-AT ?auto_15138 ?auto_15134 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15138 ?auto_15134 ?auto_15136 ?auto_15137 )
      ( DELIVER-1PKG ?auto_15135 ?auto_15134 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15278 - OBJ
      ?auto_15279 - OBJ
      ?auto_15277 - LOCATION
    )
    :vars
    (
      ?auto_15280 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15280 ?auto_15277 ) ( IN-TRUCK ?auto_15279 ?auto_15280 ) ( OBJ-AT ?auto_15278 ?auto_15277 ) ( not ( = ?auto_15278 ?auto_15279 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15279 ?auto_15277 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15282 - OBJ
      ?auto_15283 - OBJ
      ?auto_15281 - LOCATION
    )
    :vars
    (
      ?auto_15284 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15284 ?auto_15281 ) ( IN-TRUCK ?auto_15282 ?auto_15284 ) ( OBJ-AT ?auto_15283 ?auto_15281 ) ( not ( = ?auto_15282 ?auto_15283 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15282 ?auto_15281 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15290 - OBJ
      ?auto_15291 - OBJ
      ?auto_15292 - OBJ
      ?auto_15289 - LOCATION
    )
    :vars
    (
      ?auto_15293 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15293 ?auto_15289 ) ( IN-TRUCK ?auto_15292 ?auto_15293 ) ( OBJ-AT ?auto_15290 ?auto_15289 ) ( OBJ-AT ?auto_15291 ?auto_15289 ) ( not ( = ?auto_15290 ?auto_15291 ) ) ( not ( = ?auto_15290 ?auto_15292 ) ) ( not ( = ?auto_15291 ?auto_15292 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15292 ?auto_15289 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15295 - OBJ
      ?auto_15296 - OBJ
      ?auto_15297 - OBJ
      ?auto_15294 - LOCATION
    )
    :vars
    (
      ?auto_15298 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15298 ?auto_15294 ) ( IN-TRUCK ?auto_15296 ?auto_15298 ) ( OBJ-AT ?auto_15295 ?auto_15294 ) ( OBJ-AT ?auto_15297 ?auto_15294 ) ( not ( = ?auto_15295 ?auto_15296 ) ) ( not ( = ?auto_15295 ?auto_15297 ) ) ( not ( = ?auto_15296 ?auto_15297 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15296 ?auto_15294 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15305 - OBJ
      ?auto_15306 - OBJ
      ?auto_15307 - OBJ
      ?auto_15304 - LOCATION
    )
    :vars
    (
      ?auto_15308 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15308 ?auto_15304 ) ( IN-TRUCK ?auto_15305 ?auto_15308 ) ( OBJ-AT ?auto_15306 ?auto_15304 ) ( OBJ-AT ?auto_15307 ?auto_15304 ) ( not ( = ?auto_15305 ?auto_15306 ) ) ( not ( = ?auto_15305 ?auto_15307 ) ) ( not ( = ?auto_15306 ?auto_15307 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15305 ?auto_15304 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15325 - OBJ
      ?auto_15326 - OBJ
      ?auto_15327 - OBJ
      ?auto_15328 - OBJ
      ?auto_15324 - LOCATION
    )
    :vars
    (
      ?auto_15329 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15329 ?auto_15324 ) ( IN-TRUCK ?auto_15328 ?auto_15329 ) ( OBJ-AT ?auto_15325 ?auto_15324 ) ( OBJ-AT ?auto_15326 ?auto_15324 ) ( OBJ-AT ?auto_15327 ?auto_15324 ) ( not ( = ?auto_15325 ?auto_15326 ) ) ( not ( = ?auto_15325 ?auto_15327 ) ) ( not ( = ?auto_15325 ?auto_15328 ) ) ( not ( = ?auto_15326 ?auto_15327 ) ) ( not ( = ?auto_15326 ?auto_15328 ) ) ( not ( = ?auto_15327 ?auto_15328 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15328 ?auto_15324 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15331 - OBJ
      ?auto_15332 - OBJ
      ?auto_15333 - OBJ
      ?auto_15334 - OBJ
      ?auto_15330 - LOCATION
    )
    :vars
    (
      ?auto_15335 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15335 ?auto_15330 ) ( IN-TRUCK ?auto_15333 ?auto_15335 ) ( OBJ-AT ?auto_15331 ?auto_15330 ) ( OBJ-AT ?auto_15332 ?auto_15330 ) ( OBJ-AT ?auto_15334 ?auto_15330 ) ( not ( = ?auto_15331 ?auto_15332 ) ) ( not ( = ?auto_15331 ?auto_15333 ) ) ( not ( = ?auto_15331 ?auto_15334 ) ) ( not ( = ?auto_15332 ?auto_15333 ) ) ( not ( = ?auto_15332 ?auto_15334 ) ) ( not ( = ?auto_15333 ?auto_15334 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15333 ?auto_15330 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15343 - OBJ
      ?auto_15344 - OBJ
      ?auto_15345 - OBJ
      ?auto_15346 - OBJ
      ?auto_15342 - LOCATION
    )
    :vars
    (
      ?auto_15347 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15347 ?auto_15342 ) ( IN-TRUCK ?auto_15344 ?auto_15347 ) ( OBJ-AT ?auto_15343 ?auto_15342 ) ( OBJ-AT ?auto_15345 ?auto_15342 ) ( OBJ-AT ?auto_15346 ?auto_15342 ) ( not ( = ?auto_15343 ?auto_15344 ) ) ( not ( = ?auto_15343 ?auto_15345 ) ) ( not ( = ?auto_15343 ?auto_15346 ) ) ( not ( = ?auto_15344 ?auto_15345 ) ) ( not ( = ?auto_15344 ?auto_15346 ) ) ( not ( = ?auto_15345 ?auto_15346 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15344 ?auto_15342 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15367 - OBJ
      ?auto_15368 - OBJ
      ?auto_15369 - OBJ
      ?auto_15370 - OBJ
      ?auto_15366 - LOCATION
    )
    :vars
    (
      ?auto_15371 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15371 ?auto_15366 ) ( IN-TRUCK ?auto_15367 ?auto_15371 ) ( OBJ-AT ?auto_15368 ?auto_15366 ) ( OBJ-AT ?auto_15369 ?auto_15366 ) ( OBJ-AT ?auto_15370 ?auto_15366 ) ( not ( = ?auto_15367 ?auto_15368 ) ) ( not ( = ?auto_15367 ?auto_15369 ) ) ( not ( = ?auto_15367 ?auto_15370 ) ) ( not ( = ?auto_15368 ?auto_15369 ) ) ( not ( = ?auto_15368 ?auto_15370 ) ) ( not ( = ?auto_15369 ?auto_15370 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15367 ?auto_15366 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15420 - OBJ
      ?auto_15421 - OBJ
      ?auto_15419 - LOCATION
    )
    :vars
    (
      ?auto_15424 - TRUCK
      ?auto_15422 - LOCATION
      ?auto_15423 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15421 ?auto_15424 ) ( TRUCK-AT ?auto_15424 ?auto_15422 ) ( IN-CITY ?auto_15422 ?auto_15423 ) ( IN-CITY ?auto_15419 ?auto_15423 ) ( not ( = ?auto_15419 ?auto_15422 ) ) ( OBJ-AT ?auto_15420 ?auto_15419 ) ( not ( = ?auto_15420 ?auto_15421 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15421 ?auto_15419 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15426 - OBJ
      ?auto_15427 - OBJ
      ?auto_15425 - LOCATION
    )
    :vars
    (
      ?auto_15429 - TRUCK
      ?auto_15428 - LOCATION
      ?auto_15430 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15426 ?auto_15429 ) ( TRUCK-AT ?auto_15429 ?auto_15428 ) ( IN-CITY ?auto_15428 ?auto_15430 ) ( IN-CITY ?auto_15425 ?auto_15430 ) ( not ( = ?auto_15425 ?auto_15428 ) ) ( OBJ-AT ?auto_15427 ?auto_15425 ) ( not ( = ?auto_15427 ?auto_15426 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15427 ?auto_15426 ?auto_15425 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15439 - OBJ
      ?auto_15440 - OBJ
      ?auto_15441 - OBJ
      ?auto_15438 - LOCATION
    )
    :vars
    (
      ?auto_15443 - TRUCK
      ?auto_15442 - LOCATION
      ?auto_15444 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15441 ?auto_15443 ) ( TRUCK-AT ?auto_15443 ?auto_15442 ) ( IN-CITY ?auto_15442 ?auto_15444 ) ( IN-CITY ?auto_15438 ?auto_15444 ) ( not ( = ?auto_15438 ?auto_15442 ) ) ( OBJ-AT ?auto_15440 ?auto_15438 ) ( not ( = ?auto_15440 ?auto_15441 ) ) ( OBJ-AT ?auto_15439 ?auto_15438 ) ( not ( = ?auto_15439 ?auto_15440 ) ) ( not ( = ?auto_15439 ?auto_15441 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15440 ?auto_15441 ?auto_15438 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15446 - OBJ
      ?auto_15447 - OBJ
      ?auto_15448 - OBJ
      ?auto_15445 - LOCATION
    )
    :vars
    (
      ?auto_15450 - TRUCK
      ?auto_15449 - LOCATION
      ?auto_15451 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15447 ?auto_15450 ) ( TRUCK-AT ?auto_15450 ?auto_15449 ) ( IN-CITY ?auto_15449 ?auto_15451 ) ( IN-CITY ?auto_15445 ?auto_15451 ) ( not ( = ?auto_15445 ?auto_15449 ) ) ( OBJ-AT ?auto_15446 ?auto_15445 ) ( not ( = ?auto_15446 ?auto_15447 ) ) ( OBJ-AT ?auto_15448 ?auto_15445 ) ( not ( = ?auto_15446 ?auto_15448 ) ) ( not ( = ?auto_15447 ?auto_15448 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15446 ?auto_15447 ?auto_15445 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15460 - OBJ
      ?auto_15461 - OBJ
      ?auto_15462 - OBJ
      ?auto_15459 - LOCATION
    )
    :vars
    (
      ?auto_15464 - TRUCK
      ?auto_15463 - LOCATION
      ?auto_15465 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15460 ?auto_15464 ) ( TRUCK-AT ?auto_15464 ?auto_15463 ) ( IN-CITY ?auto_15463 ?auto_15465 ) ( IN-CITY ?auto_15459 ?auto_15465 ) ( not ( = ?auto_15459 ?auto_15463 ) ) ( OBJ-AT ?auto_15462 ?auto_15459 ) ( not ( = ?auto_15462 ?auto_15460 ) ) ( OBJ-AT ?auto_15461 ?auto_15459 ) ( not ( = ?auto_15460 ?auto_15461 ) ) ( not ( = ?auto_15461 ?auto_15462 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15462 ?auto_15460 ?auto_15459 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15489 - OBJ
      ?auto_15490 - OBJ
      ?auto_15491 - OBJ
      ?auto_15492 - OBJ
      ?auto_15488 - LOCATION
    )
    :vars
    (
      ?auto_15494 - TRUCK
      ?auto_15493 - LOCATION
      ?auto_15495 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15492 ?auto_15494 ) ( TRUCK-AT ?auto_15494 ?auto_15493 ) ( IN-CITY ?auto_15493 ?auto_15495 ) ( IN-CITY ?auto_15488 ?auto_15495 ) ( not ( = ?auto_15488 ?auto_15493 ) ) ( OBJ-AT ?auto_15489 ?auto_15488 ) ( not ( = ?auto_15489 ?auto_15492 ) ) ( OBJ-AT ?auto_15490 ?auto_15488 ) ( OBJ-AT ?auto_15491 ?auto_15488 ) ( not ( = ?auto_15489 ?auto_15490 ) ) ( not ( = ?auto_15489 ?auto_15491 ) ) ( not ( = ?auto_15490 ?auto_15491 ) ) ( not ( = ?auto_15490 ?auto_15492 ) ) ( not ( = ?auto_15491 ?auto_15492 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15489 ?auto_15492 ?auto_15488 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15497 - OBJ
      ?auto_15498 - OBJ
      ?auto_15499 - OBJ
      ?auto_15500 - OBJ
      ?auto_15496 - LOCATION
    )
    :vars
    (
      ?auto_15502 - TRUCK
      ?auto_15501 - LOCATION
      ?auto_15503 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15499 ?auto_15502 ) ( TRUCK-AT ?auto_15502 ?auto_15501 ) ( IN-CITY ?auto_15501 ?auto_15503 ) ( IN-CITY ?auto_15496 ?auto_15503 ) ( not ( = ?auto_15496 ?auto_15501 ) ) ( OBJ-AT ?auto_15497 ?auto_15496 ) ( not ( = ?auto_15497 ?auto_15499 ) ) ( OBJ-AT ?auto_15498 ?auto_15496 ) ( OBJ-AT ?auto_15500 ?auto_15496 ) ( not ( = ?auto_15497 ?auto_15498 ) ) ( not ( = ?auto_15497 ?auto_15500 ) ) ( not ( = ?auto_15498 ?auto_15499 ) ) ( not ( = ?auto_15498 ?auto_15500 ) ) ( not ( = ?auto_15499 ?auto_15500 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15497 ?auto_15499 ?auto_15496 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15513 - OBJ
      ?auto_15514 - OBJ
      ?auto_15515 - OBJ
      ?auto_15516 - OBJ
      ?auto_15512 - LOCATION
    )
    :vars
    (
      ?auto_15518 - TRUCK
      ?auto_15517 - LOCATION
      ?auto_15519 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15514 ?auto_15518 ) ( TRUCK-AT ?auto_15518 ?auto_15517 ) ( IN-CITY ?auto_15517 ?auto_15519 ) ( IN-CITY ?auto_15512 ?auto_15519 ) ( not ( = ?auto_15512 ?auto_15517 ) ) ( OBJ-AT ?auto_15513 ?auto_15512 ) ( not ( = ?auto_15513 ?auto_15514 ) ) ( OBJ-AT ?auto_15515 ?auto_15512 ) ( OBJ-AT ?auto_15516 ?auto_15512 ) ( not ( = ?auto_15513 ?auto_15515 ) ) ( not ( = ?auto_15513 ?auto_15516 ) ) ( not ( = ?auto_15514 ?auto_15515 ) ) ( not ( = ?auto_15514 ?auto_15516 ) ) ( not ( = ?auto_15515 ?auto_15516 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15513 ?auto_15514 ?auto_15512 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15545 - OBJ
      ?auto_15546 - OBJ
      ?auto_15547 - OBJ
      ?auto_15548 - OBJ
      ?auto_15544 - LOCATION
    )
    :vars
    (
      ?auto_15550 - TRUCK
      ?auto_15549 - LOCATION
      ?auto_15551 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_15545 ?auto_15550 ) ( TRUCK-AT ?auto_15550 ?auto_15549 ) ( IN-CITY ?auto_15549 ?auto_15551 ) ( IN-CITY ?auto_15544 ?auto_15551 ) ( not ( = ?auto_15544 ?auto_15549 ) ) ( OBJ-AT ?auto_15546 ?auto_15544 ) ( not ( = ?auto_15546 ?auto_15545 ) ) ( OBJ-AT ?auto_15547 ?auto_15544 ) ( OBJ-AT ?auto_15548 ?auto_15544 ) ( not ( = ?auto_15545 ?auto_15547 ) ) ( not ( = ?auto_15545 ?auto_15548 ) ) ( not ( = ?auto_15546 ?auto_15547 ) ) ( not ( = ?auto_15546 ?auto_15548 ) ) ( not ( = ?auto_15547 ?auto_15548 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15546 ?auto_15545 ?auto_15544 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15610 - OBJ
      ?auto_15609 - LOCATION
    )
    :vars
    (
      ?auto_15613 - TRUCK
      ?auto_15611 - LOCATION
      ?auto_15614 - CITY
      ?auto_15612 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15613 ?auto_15611 ) ( IN-CITY ?auto_15611 ?auto_15614 ) ( IN-CITY ?auto_15609 ?auto_15614 ) ( not ( = ?auto_15609 ?auto_15611 ) ) ( OBJ-AT ?auto_15612 ?auto_15609 ) ( not ( = ?auto_15612 ?auto_15610 ) ) ( OBJ-AT ?auto_15610 ?auto_15611 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_15610 ?auto_15613 ?auto_15611 )
      ( DELIVER-2PKG ?auto_15612 ?auto_15610 ?auto_15609 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15616 - OBJ
      ?auto_15617 - OBJ
      ?auto_15615 - LOCATION
    )
    :vars
    (
      ?auto_15620 - TRUCK
      ?auto_15618 - LOCATION
      ?auto_15619 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15620 ?auto_15618 ) ( IN-CITY ?auto_15618 ?auto_15619 ) ( IN-CITY ?auto_15615 ?auto_15619 ) ( not ( = ?auto_15615 ?auto_15618 ) ) ( OBJ-AT ?auto_15616 ?auto_15615 ) ( not ( = ?auto_15616 ?auto_15617 ) ) ( OBJ-AT ?auto_15617 ?auto_15618 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15617 ?auto_15615 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15622 - OBJ
      ?auto_15623 - OBJ
      ?auto_15621 - LOCATION
    )
    :vars
    (
      ?auto_15624 - TRUCK
      ?auto_15626 - LOCATION
      ?auto_15625 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15624 ?auto_15626 ) ( IN-CITY ?auto_15626 ?auto_15625 ) ( IN-CITY ?auto_15621 ?auto_15625 ) ( not ( = ?auto_15621 ?auto_15626 ) ) ( OBJ-AT ?auto_15623 ?auto_15621 ) ( not ( = ?auto_15623 ?auto_15622 ) ) ( OBJ-AT ?auto_15622 ?auto_15626 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15623 ?auto_15622 ?auto_15621 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15635 - OBJ
      ?auto_15636 - OBJ
      ?auto_15637 - OBJ
      ?auto_15634 - LOCATION
    )
    :vars
    (
      ?auto_15638 - TRUCK
      ?auto_15640 - LOCATION
      ?auto_15639 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15638 ?auto_15640 ) ( IN-CITY ?auto_15640 ?auto_15639 ) ( IN-CITY ?auto_15634 ?auto_15639 ) ( not ( = ?auto_15634 ?auto_15640 ) ) ( OBJ-AT ?auto_15635 ?auto_15634 ) ( not ( = ?auto_15635 ?auto_15637 ) ) ( OBJ-AT ?auto_15637 ?auto_15640 ) ( OBJ-AT ?auto_15636 ?auto_15634 ) ( not ( = ?auto_15635 ?auto_15636 ) ) ( not ( = ?auto_15636 ?auto_15637 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15635 ?auto_15637 ?auto_15634 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15642 - OBJ
      ?auto_15643 - OBJ
      ?auto_15644 - OBJ
      ?auto_15641 - LOCATION
    )
    :vars
    (
      ?auto_15645 - TRUCK
      ?auto_15647 - LOCATION
      ?auto_15646 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15645 ?auto_15647 ) ( IN-CITY ?auto_15647 ?auto_15646 ) ( IN-CITY ?auto_15641 ?auto_15646 ) ( not ( = ?auto_15641 ?auto_15647 ) ) ( OBJ-AT ?auto_15644 ?auto_15641 ) ( not ( = ?auto_15644 ?auto_15643 ) ) ( OBJ-AT ?auto_15643 ?auto_15647 ) ( OBJ-AT ?auto_15642 ?auto_15641 ) ( not ( = ?auto_15642 ?auto_15643 ) ) ( not ( = ?auto_15642 ?auto_15644 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15644 ?auto_15643 ?auto_15641 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15656 - OBJ
      ?auto_15657 - OBJ
      ?auto_15658 - OBJ
      ?auto_15655 - LOCATION
    )
    :vars
    (
      ?auto_15659 - TRUCK
      ?auto_15661 - LOCATION
      ?auto_15660 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15659 ?auto_15661 ) ( IN-CITY ?auto_15661 ?auto_15660 ) ( IN-CITY ?auto_15655 ?auto_15660 ) ( not ( = ?auto_15655 ?auto_15661 ) ) ( OBJ-AT ?auto_15657 ?auto_15655 ) ( not ( = ?auto_15657 ?auto_15656 ) ) ( OBJ-AT ?auto_15656 ?auto_15661 ) ( OBJ-AT ?auto_15658 ?auto_15655 ) ( not ( = ?auto_15656 ?auto_15658 ) ) ( not ( = ?auto_15657 ?auto_15658 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15657 ?auto_15656 ?auto_15655 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15685 - OBJ
      ?auto_15686 - OBJ
      ?auto_15687 - OBJ
      ?auto_15688 - OBJ
      ?auto_15684 - LOCATION
    )
    :vars
    (
      ?auto_15689 - TRUCK
      ?auto_15691 - LOCATION
      ?auto_15690 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15689 ?auto_15691 ) ( IN-CITY ?auto_15691 ?auto_15690 ) ( IN-CITY ?auto_15684 ?auto_15690 ) ( not ( = ?auto_15684 ?auto_15691 ) ) ( OBJ-AT ?auto_15685 ?auto_15684 ) ( not ( = ?auto_15685 ?auto_15688 ) ) ( OBJ-AT ?auto_15688 ?auto_15691 ) ( OBJ-AT ?auto_15686 ?auto_15684 ) ( OBJ-AT ?auto_15687 ?auto_15684 ) ( not ( = ?auto_15685 ?auto_15686 ) ) ( not ( = ?auto_15685 ?auto_15687 ) ) ( not ( = ?auto_15686 ?auto_15687 ) ) ( not ( = ?auto_15686 ?auto_15688 ) ) ( not ( = ?auto_15687 ?auto_15688 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15685 ?auto_15688 ?auto_15684 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15693 - OBJ
      ?auto_15694 - OBJ
      ?auto_15695 - OBJ
      ?auto_15696 - OBJ
      ?auto_15692 - LOCATION
    )
    :vars
    (
      ?auto_15697 - TRUCK
      ?auto_15699 - LOCATION
      ?auto_15698 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15697 ?auto_15699 ) ( IN-CITY ?auto_15699 ?auto_15698 ) ( IN-CITY ?auto_15692 ?auto_15698 ) ( not ( = ?auto_15692 ?auto_15699 ) ) ( OBJ-AT ?auto_15693 ?auto_15692 ) ( not ( = ?auto_15693 ?auto_15695 ) ) ( OBJ-AT ?auto_15695 ?auto_15699 ) ( OBJ-AT ?auto_15694 ?auto_15692 ) ( OBJ-AT ?auto_15696 ?auto_15692 ) ( not ( = ?auto_15693 ?auto_15694 ) ) ( not ( = ?auto_15693 ?auto_15696 ) ) ( not ( = ?auto_15694 ?auto_15695 ) ) ( not ( = ?auto_15694 ?auto_15696 ) ) ( not ( = ?auto_15695 ?auto_15696 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15693 ?auto_15695 ?auto_15692 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15709 - OBJ
      ?auto_15710 - OBJ
      ?auto_15711 - OBJ
      ?auto_15712 - OBJ
      ?auto_15708 - LOCATION
    )
    :vars
    (
      ?auto_15713 - TRUCK
      ?auto_15715 - LOCATION
      ?auto_15714 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15713 ?auto_15715 ) ( IN-CITY ?auto_15715 ?auto_15714 ) ( IN-CITY ?auto_15708 ?auto_15714 ) ( not ( = ?auto_15708 ?auto_15715 ) ) ( OBJ-AT ?auto_15709 ?auto_15708 ) ( not ( = ?auto_15709 ?auto_15710 ) ) ( OBJ-AT ?auto_15710 ?auto_15715 ) ( OBJ-AT ?auto_15711 ?auto_15708 ) ( OBJ-AT ?auto_15712 ?auto_15708 ) ( not ( = ?auto_15709 ?auto_15711 ) ) ( not ( = ?auto_15709 ?auto_15712 ) ) ( not ( = ?auto_15710 ?auto_15711 ) ) ( not ( = ?auto_15710 ?auto_15712 ) ) ( not ( = ?auto_15711 ?auto_15712 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15709 ?auto_15710 ?auto_15708 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15741 - OBJ
      ?auto_15742 - OBJ
      ?auto_15743 - OBJ
      ?auto_15744 - OBJ
      ?auto_15740 - LOCATION
    )
    :vars
    (
      ?auto_15745 - TRUCK
      ?auto_15747 - LOCATION
      ?auto_15746 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_15745 ?auto_15747 ) ( IN-CITY ?auto_15747 ?auto_15746 ) ( IN-CITY ?auto_15740 ?auto_15746 ) ( not ( = ?auto_15740 ?auto_15747 ) ) ( OBJ-AT ?auto_15742 ?auto_15740 ) ( not ( = ?auto_15742 ?auto_15741 ) ) ( OBJ-AT ?auto_15741 ?auto_15747 ) ( OBJ-AT ?auto_15743 ?auto_15740 ) ( OBJ-AT ?auto_15744 ?auto_15740 ) ( not ( = ?auto_15741 ?auto_15743 ) ) ( not ( = ?auto_15741 ?auto_15744 ) ) ( not ( = ?auto_15742 ?auto_15743 ) ) ( not ( = ?auto_15742 ?auto_15744 ) ) ( not ( = ?auto_15743 ?auto_15744 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15742 ?auto_15741 ?auto_15740 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_15806 - OBJ
      ?auto_15805 - LOCATION
    )
    :vars
    (
      ?auto_15810 - LOCATION
      ?auto_15809 - CITY
      ?auto_15808 - OBJ
      ?auto_15807 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15810 ?auto_15809 ) ( IN-CITY ?auto_15805 ?auto_15809 ) ( not ( = ?auto_15805 ?auto_15810 ) ) ( OBJ-AT ?auto_15808 ?auto_15805 ) ( not ( = ?auto_15808 ?auto_15806 ) ) ( OBJ-AT ?auto_15806 ?auto_15810 ) ( TRUCK-AT ?auto_15807 ?auto_15805 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_15807 ?auto_15805 ?auto_15810 ?auto_15809 )
      ( DELIVER-2PKG ?auto_15808 ?auto_15806 ?auto_15805 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15812 - OBJ
      ?auto_15813 - OBJ
      ?auto_15811 - LOCATION
    )
    :vars
    (
      ?auto_15816 - LOCATION
      ?auto_15814 - CITY
      ?auto_15815 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15816 ?auto_15814 ) ( IN-CITY ?auto_15811 ?auto_15814 ) ( not ( = ?auto_15811 ?auto_15816 ) ) ( OBJ-AT ?auto_15812 ?auto_15811 ) ( not ( = ?auto_15812 ?auto_15813 ) ) ( OBJ-AT ?auto_15813 ?auto_15816 ) ( TRUCK-AT ?auto_15815 ?auto_15811 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_15813 ?auto_15811 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_15818 - OBJ
      ?auto_15819 - OBJ
      ?auto_15817 - LOCATION
    )
    :vars
    (
      ?auto_15820 - LOCATION
      ?auto_15821 - CITY
      ?auto_15822 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15820 ?auto_15821 ) ( IN-CITY ?auto_15817 ?auto_15821 ) ( not ( = ?auto_15817 ?auto_15820 ) ) ( OBJ-AT ?auto_15819 ?auto_15817 ) ( not ( = ?auto_15819 ?auto_15818 ) ) ( OBJ-AT ?auto_15818 ?auto_15820 ) ( TRUCK-AT ?auto_15822 ?auto_15817 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15819 ?auto_15818 ?auto_15817 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15831 - OBJ
      ?auto_15832 - OBJ
      ?auto_15833 - OBJ
      ?auto_15830 - LOCATION
    )
    :vars
    (
      ?auto_15834 - LOCATION
      ?auto_15835 - CITY
      ?auto_15836 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15834 ?auto_15835 ) ( IN-CITY ?auto_15830 ?auto_15835 ) ( not ( = ?auto_15830 ?auto_15834 ) ) ( OBJ-AT ?auto_15831 ?auto_15830 ) ( not ( = ?auto_15831 ?auto_15833 ) ) ( OBJ-AT ?auto_15833 ?auto_15834 ) ( TRUCK-AT ?auto_15836 ?auto_15830 ) ( OBJ-AT ?auto_15832 ?auto_15830 ) ( not ( = ?auto_15831 ?auto_15832 ) ) ( not ( = ?auto_15832 ?auto_15833 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15831 ?auto_15833 ?auto_15830 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15838 - OBJ
      ?auto_15839 - OBJ
      ?auto_15840 - OBJ
      ?auto_15837 - LOCATION
    )
    :vars
    (
      ?auto_15841 - LOCATION
      ?auto_15842 - CITY
      ?auto_15843 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15841 ?auto_15842 ) ( IN-CITY ?auto_15837 ?auto_15842 ) ( not ( = ?auto_15837 ?auto_15841 ) ) ( OBJ-AT ?auto_15840 ?auto_15837 ) ( not ( = ?auto_15840 ?auto_15839 ) ) ( OBJ-AT ?auto_15839 ?auto_15841 ) ( TRUCK-AT ?auto_15843 ?auto_15837 ) ( OBJ-AT ?auto_15838 ?auto_15837 ) ( not ( = ?auto_15838 ?auto_15839 ) ) ( not ( = ?auto_15838 ?auto_15840 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15840 ?auto_15839 ?auto_15837 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_15852 - OBJ
      ?auto_15853 - OBJ
      ?auto_15854 - OBJ
      ?auto_15851 - LOCATION
    )
    :vars
    (
      ?auto_15855 - LOCATION
      ?auto_15856 - CITY
      ?auto_15857 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15855 ?auto_15856 ) ( IN-CITY ?auto_15851 ?auto_15856 ) ( not ( = ?auto_15851 ?auto_15855 ) ) ( OBJ-AT ?auto_15853 ?auto_15851 ) ( not ( = ?auto_15853 ?auto_15852 ) ) ( OBJ-AT ?auto_15852 ?auto_15855 ) ( TRUCK-AT ?auto_15857 ?auto_15851 ) ( OBJ-AT ?auto_15854 ?auto_15851 ) ( not ( = ?auto_15852 ?auto_15854 ) ) ( not ( = ?auto_15853 ?auto_15854 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15853 ?auto_15852 ?auto_15851 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15881 - OBJ
      ?auto_15882 - OBJ
      ?auto_15883 - OBJ
      ?auto_15884 - OBJ
      ?auto_15880 - LOCATION
    )
    :vars
    (
      ?auto_15885 - LOCATION
      ?auto_15886 - CITY
      ?auto_15887 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15885 ?auto_15886 ) ( IN-CITY ?auto_15880 ?auto_15886 ) ( not ( = ?auto_15880 ?auto_15885 ) ) ( OBJ-AT ?auto_15881 ?auto_15880 ) ( not ( = ?auto_15881 ?auto_15884 ) ) ( OBJ-AT ?auto_15884 ?auto_15885 ) ( TRUCK-AT ?auto_15887 ?auto_15880 ) ( OBJ-AT ?auto_15882 ?auto_15880 ) ( OBJ-AT ?auto_15883 ?auto_15880 ) ( not ( = ?auto_15881 ?auto_15882 ) ) ( not ( = ?auto_15881 ?auto_15883 ) ) ( not ( = ?auto_15882 ?auto_15883 ) ) ( not ( = ?auto_15882 ?auto_15884 ) ) ( not ( = ?auto_15883 ?auto_15884 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15881 ?auto_15884 ?auto_15880 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15889 - OBJ
      ?auto_15890 - OBJ
      ?auto_15891 - OBJ
      ?auto_15892 - OBJ
      ?auto_15888 - LOCATION
    )
    :vars
    (
      ?auto_15893 - LOCATION
      ?auto_15894 - CITY
      ?auto_15895 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15893 ?auto_15894 ) ( IN-CITY ?auto_15888 ?auto_15894 ) ( not ( = ?auto_15888 ?auto_15893 ) ) ( OBJ-AT ?auto_15892 ?auto_15888 ) ( not ( = ?auto_15892 ?auto_15891 ) ) ( OBJ-AT ?auto_15891 ?auto_15893 ) ( TRUCK-AT ?auto_15895 ?auto_15888 ) ( OBJ-AT ?auto_15889 ?auto_15888 ) ( OBJ-AT ?auto_15890 ?auto_15888 ) ( not ( = ?auto_15889 ?auto_15890 ) ) ( not ( = ?auto_15889 ?auto_15891 ) ) ( not ( = ?auto_15889 ?auto_15892 ) ) ( not ( = ?auto_15890 ?auto_15891 ) ) ( not ( = ?auto_15890 ?auto_15892 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15892 ?auto_15891 ?auto_15888 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15905 - OBJ
      ?auto_15906 - OBJ
      ?auto_15907 - OBJ
      ?auto_15908 - OBJ
      ?auto_15904 - LOCATION
    )
    :vars
    (
      ?auto_15909 - LOCATION
      ?auto_15910 - CITY
      ?auto_15911 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15909 ?auto_15910 ) ( IN-CITY ?auto_15904 ?auto_15910 ) ( not ( = ?auto_15904 ?auto_15909 ) ) ( OBJ-AT ?auto_15905 ?auto_15904 ) ( not ( = ?auto_15905 ?auto_15906 ) ) ( OBJ-AT ?auto_15906 ?auto_15909 ) ( TRUCK-AT ?auto_15911 ?auto_15904 ) ( OBJ-AT ?auto_15907 ?auto_15904 ) ( OBJ-AT ?auto_15908 ?auto_15904 ) ( not ( = ?auto_15905 ?auto_15907 ) ) ( not ( = ?auto_15905 ?auto_15908 ) ) ( not ( = ?auto_15906 ?auto_15907 ) ) ( not ( = ?auto_15906 ?auto_15908 ) ) ( not ( = ?auto_15907 ?auto_15908 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15905 ?auto_15906 ?auto_15904 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_15937 - OBJ
      ?auto_15938 - OBJ
      ?auto_15939 - OBJ
      ?auto_15940 - OBJ
      ?auto_15936 - LOCATION
    )
    :vars
    (
      ?auto_15941 - LOCATION
      ?auto_15942 - CITY
      ?auto_15943 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_15941 ?auto_15942 ) ( IN-CITY ?auto_15936 ?auto_15942 ) ( not ( = ?auto_15936 ?auto_15941 ) ) ( OBJ-AT ?auto_15940 ?auto_15936 ) ( not ( = ?auto_15940 ?auto_15937 ) ) ( OBJ-AT ?auto_15937 ?auto_15941 ) ( TRUCK-AT ?auto_15943 ?auto_15936 ) ( OBJ-AT ?auto_15938 ?auto_15936 ) ( OBJ-AT ?auto_15939 ?auto_15936 ) ( not ( = ?auto_15937 ?auto_15938 ) ) ( not ( = ?auto_15937 ?auto_15939 ) ) ( not ( = ?auto_15938 ?auto_15939 ) ) ( not ( = ?auto_15938 ?auto_15940 ) ) ( not ( = ?auto_15939 ?auto_15940 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_15940 ?auto_15937 ?auto_15936 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16002 - OBJ
      ?auto_16001 - LOCATION
    )
    :vars
    (
      ?auto_16004 - LOCATION
      ?auto_16005 - CITY
      ?auto_16003 - OBJ
      ?auto_16006 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16004 ?auto_16005 ) ( IN-CITY ?auto_16001 ?auto_16005 ) ( not ( = ?auto_16001 ?auto_16004 ) ) ( not ( = ?auto_16003 ?auto_16002 ) ) ( OBJ-AT ?auto_16002 ?auto_16004 ) ( TRUCK-AT ?auto_16006 ?auto_16001 ) ( IN-TRUCK ?auto_16003 ?auto_16006 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16003 ?auto_16001 )
      ( DELIVER-2PKG ?auto_16003 ?auto_16002 ?auto_16001 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16008 - OBJ
      ?auto_16009 - OBJ
      ?auto_16007 - LOCATION
    )
    :vars
    (
      ?auto_16012 - LOCATION
      ?auto_16010 - CITY
      ?auto_16011 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16012 ?auto_16010 ) ( IN-CITY ?auto_16007 ?auto_16010 ) ( not ( = ?auto_16007 ?auto_16012 ) ) ( not ( = ?auto_16008 ?auto_16009 ) ) ( OBJ-AT ?auto_16009 ?auto_16012 ) ( TRUCK-AT ?auto_16011 ?auto_16007 ) ( IN-TRUCK ?auto_16008 ?auto_16011 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16009 ?auto_16007 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16014 - OBJ
      ?auto_16015 - OBJ
      ?auto_16013 - LOCATION
    )
    :vars
    (
      ?auto_16016 - LOCATION
      ?auto_16018 - CITY
      ?auto_16017 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_16016 ?auto_16018 ) ( IN-CITY ?auto_16013 ?auto_16018 ) ( not ( = ?auto_16013 ?auto_16016 ) ) ( not ( = ?auto_16015 ?auto_16014 ) ) ( OBJ-AT ?auto_16014 ?auto_16016 ) ( TRUCK-AT ?auto_16017 ?auto_16013 ) ( IN-TRUCK ?auto_16015 ?auto_16017 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16015 ?auto_16014 ?auto_16013 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16198 - OBJ
      ?auto_16197 - LOCATION
    )
    :vars
    (
      ?auto_16199 - LOCATION
      ?auto_16201 - CITY
      ?auto_16202 - OBJ
      ?auto_16200 - TRUCK
      ?auto_16203 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16199 ?auto_16201 ) ( IN-CITY ?auto_16197 ?auto_16201 ) ( not ( = ?auto_16197 ?auto_16199 ) ) ( not ( = ?auto_16202 ?auto_16198 ) ) ( OBJ-AT ?auto_16198 ?auto_16199 ) ( IN-TRUCK ?auto_16202 ?auto_16200 ) ( TRUCK-AT ?auto_16200 ?auto_16203 ) ( IN-CITY ?auto_16203 ?auto_16201 ) ( not ( = ?auto_16197 ?auto_16203 ) ) ( not ( = ?auto_16199 ?auto_16203 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_16200 ?auto_16203 ?auto_16197 ?auto_16201 )
      ( DELIVER-2PKG ?auto_16202 ?auto_16198 ?auto_16197 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16205 - OBJ
      ?auto_16206 - OBJ
      ?auto_16204 - LOCATION
    )
    :vars
    (
      ?auto_16208 - LOCATION
      ?auto_16209 - CITY
      ?auto_16207 - TRUCK
      ?auto_16210 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16208 ?auto_16209 ) ( IN-CITY ?auto_16204 ?auto_16209 ) ( not ( = ?auto_16204 ?auto_16208 ) ) ( not ( = ?auto_16205 ?auto_16206 ) ) ( OBJ-AT ?auto_16206 ?auto_16208 ) ( IN-TRUCK ?auto_16205 ?auto_16207 ) ( TRUCK-AT ?auto_16207 ?auto_16210 ) ( IN-CITY ?auto_16210 ?auto_16209 ) ( not ( = ?auto_16204 ?auto_16210 ) ) ( not ( = ?auto_16208 ?auto_16210 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16206 ?auto_16204 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16212 - OBJ
      ?auto_16213 - OBJ
      ?auto_16211 - LOCATION
    )
    :vars
    (
      ?auto_16216 - LOCATION
      ?auto_16217 - CITY
      ?auto_16215 - TRUCK
      ?auto_16214 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16216 ?auto_16217 ) ( IN-CITY ?auto_16211 ?auto_16217 ) ( not ( = ?auto_16211 ?auto_16216 ) ) ( not ( = ?auto_16213 ?auto_16212 ) ) ( OBJ-AT ?auto_16212 ?auto_16216 ) ( IN-TRUCK ?auto_16213 ?auto_16215 ) ( TRUCK-AT ?auto_16215 ?auto_16214 ) ( IN-CITY ?auto_16214 ?auto_16217 ) ( not ( = ?auto_16211 ?auto_16214 ) ) ( not ( = ?auto_16216 ?auto_16214 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16213 ?auto_16212 ?auto_16211 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_16420 - OBJ
      ?auto_16419 - LOCATION
    )
    :vars
    (
      ?auto_16423 - LOCATION
      ?auto_16424 - CITY
      ?auto_16425 - OBJ
      ?auto_16422 - TRUCK
      ?auto_16421 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16423 ?auto_16424 ) ( IN-CITY ?auto_16419 ?auto_16424 ) ( not ( = ?auto_16419 ?auto_16423 ) ) ( not ( = ?auto_16425 ?auto_16420 ) ) ( OBJ-AT ?auto_16420 ?auto_16423 ) ( TRUCK-AT ?auto_16422 ?auto_16421 ) ( IN-CITY ?auto_16421 ?auto_16424 ) ( not ( = ?auto_16419 ?auto_16421 ) ) ( not ( = ?auto_16423 ?auto_16421 ) ) ( OBJ-AT ?auto_16425 ?auto_16421 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_16425 ?auto_16422 ?auto_16421 )
      ( DELIVER-2PKG ?auto_16425 ?auto_16420 ?auto_16419 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16427 - OBJ
      ?auto_16428 - OBJ
      ?auto_16426 - LOCATION
    )
    :vars
    (
      ?auto_16431 - LOCATION
      ?auto_16429 - CITY
      ?auto_16430 - TRUCK
      ?auto_16432 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16431 ?auto_16429 ) ( IN-CITY ?auto_16426 ?auto_16429 ) ( not ( = ?auto_16426 ?auto_16431 ) ) ( not ( = ?auto_16427 ?auto_16428 ) ) ( OBJ-AT ?auto_16428 ?auto_16431 ) ( TRUCK-AT ?auto_16430 ?auto_16432 ) ( IN-CITY ?auto_16432 ?auto_16429 ) ( not ( = ?auto_16426 ?auto_16432 ) ) ( not ( = ?auto_16431 ?auto_16432 ) ) ( OBJ-AT ?auto_16427 ?auto_16432 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_16428 ?auto_16426 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_16434 - OBJ
      ?auto_16435 - OBJ
      ?auto_16433 - LOCATION
    )
    :vars
    (
      ?auto_16436 - LOCATION
      ?auto_16438 - CITY
      ?auto_16439 - TRUCK
      ?auto_16437 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_16436 ?auto_16438 ) ( IN-CITY ?auto_16433 ?auto_16438 ) ( not ( = ?auto_16433 ?auto_16436 ) ) ( not ( = ?auto_16435 ?auto_16434 ) ) ( OBJ-AT ?auto_16434 ?auto_16436 ) ( TRUCK-AT ?auto_16439 ?auto_16437 ) ( IN-CITY ?auto_16437 ?auto_16438 ) ( not ( = ?auto_16433 ?auto_16437 ) ) ( not ( = ?auto_16436 ?auto_16437 ) ) ( OBJ-AT ?auto_16435 ?auto_16437 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_16435 ?auto_16434 ?auto_16433 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17779 - OBJ
      ?auto_17780 - OBJ
      ?auto_17781 - OBJ
      ?auto_17778 - LOCATION
    )
    :vars
    (
      ?auto_17784 - TRUCK
      ?auto_17782 - LOCATION
      ?auto_17783 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17781 ?auto_17784 ) ( TRUCK-AT ?auto_17784 ?auto_17782 ) ( IN-CITY ?auto_17782 ?auto_17783 ) ( IN-CITY ?auto_17778 ?auto_17783 ) ( not ( = ?auto_17778 ?auto_17782 ) ) ( OBJ-AT ?auto_17779 ?auto_17778 ) ( not ( = ?auto_17779 ?auto_17781 ) ) ( OBJ-AT ?auto_17780 ?auto_17778 ) ( not ( = ?auto_17779 ?auto_17780 ) ) ( not ( = ?auto_17780 ?auto_17781 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17779 ?auto_17781 ?auto_17778 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17812 - OBJ
      ?auto_17813 - OBJ
      ?auto_17814 - OBJ
      ?auto_17811 - LOCATION
    )
    :vars
    (
      ?auto_17817 - TRUCK
      ?auto_17815 - LOCATION
      ?auto_17816 - CITY
      ?auto_17818 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17814 ?auto_17817 ) ( TRUCK-AT ?auto_17817 ?auto_17815 ) ( IN-CITY ?auto_17815 ?auto_17816 ) ( IN-CITY ?auto_17811 ?auto_17816 ) ( not ( = ?auto_17811 ?auto_17815 ) ) ( OBJ-AT ?auto_17818 ?auto_17811 ) ( not ( = ?auto_17818 ?auto_17814 ) ) ( OBJ-AT ?auto_17812 ?auto_17811 ) ( OBJ-AT ?auto_17813 ?auto_17811 ) ( not ( = ?auto_17812 ?auto_17813 ) ) ( not ( = ?auto_17812 ?auto_17814 ) ) ( not ( = ?auto_17812 ?auto_17818 ) ) ( not ( = ?auto_17813 ?auto_17814 ) ) ( not ( = ?auto_17813 ?auto_17818 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17818 ?auto_17814 ?auto_17811 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17824 - OBJ
      ?auto_17825 - OBJ
      ?auto_17826 - OBJ
      ?auto_17823 - LOCATION
    )
    :vars
    (
      ?auto_17829 - TRUCK
      ?auto_17827 - LOCATION
      ?auto_17828 - CITY
      ?auto_17830 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17825 ?auto_17829 ) ( TRUCK-AT ?auto_17829 ?auto_17827 ) ( IN-CITY ?auto_17827 ?auto_17828 ) ( IN-CITY ?auto_17823 ?auto_17828 ) ( not ( = ?auto_17823 ?auto_17827 ) ) ( OBJ-AT ?auto_17830 ?auto_17823 ) ( not ( = ?auto_17830 ?auto_17825 ) ) ( OBJ-AT ?auto_17824 ?auto_17823 ) ( OBJ-AT ?auto_17826 ?auto_17823 ) ( not ( = ?auto_17824 ?auto_17825 ) ) ( not ( = ?auto_17824 ?auto_17826 ) ) ( not ( = ?auto_17824 ?auto_17830 ) ) ( not ( = ?auto_17825 ?auto_17826 ) ) ( not ( = ?auto_17826 ?auto_17830 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17830 ?auto_17825 ?auto_17823 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17840 - OBJ
      ?auto_17841 - OBJ
      ?auto_17842 - OBJ
      ?auto_17839 - LOCATION
    )
    :vars
    (
      ?auto_17845 - TRUCK
      ?auto_17843 - LOCATION
      ?auto_17844 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17840 ?auto_17845 ) ( TRUCK-AT ?auto_17845 ?auto_17843 ) ( IN-CITY ?auto_17843 ?auto_17844 ) ( IN-CITY ?auto_17839 ?auto_17844 ) ( not ( = ?auto_17839 ?auto_17843 ) ) ( OBJ-AT ?auto_17841 ?auto_17839 ) ( not ( = ?auto_17841 ?auto_17840 ) ) ( OBJ-AT ?auto_17842 ?auto_17839 ) ( not ( = ?auto_17840 ?auto_17842 ) ) ( not ( = ?auto_17841 ?auto_17842 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17841 ?auto_17840 ?auto_17839 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_17862 - OBJ
      ?auto_17863 - OBJ
      ?auto_17864 - OBJ
      ?auto_17861 - LOCATION
    )
    :vars
    (
      ?auto_17867 - TRUCK
      ?auto_17865 - LOCATION
      ?auto_17866 - CITY
      ?auto_17868 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17862 ?auto_17867 ) ( TRUCK-AT ?auto_17867 ?auto_17865 ) ( IN-CITY ?auto_17865 ?auto_17866 ) ( IN-CITY ?auto_17861 ?auto_17866 ) ( not ( = ?auto_17861 ?auto_17865 ) ) ( OBJ-AT ?auto_17868 ?auto_17861 ) ( not ( = ?auto_17868 ?auto_17862 ) ) ( OBJ-AT ?auto_17863 ?auto_17861 ) ( OBJ-AT ?auto_17864 ?auto_17861 ) ( not ( = ?auto_17862 ?auto_17863 ) ) ( not ( = ?auto_17862 ?auto_17864 ) ) ( not ( = ?auto_17863 ?auto_17864 ) ) ( not ( = ?auto_17863 ?auto_17868 ) ) ( not ( = ?auto_17864 ?auto_17868 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17868 ?auto_17862 ?auto_17861 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17901 - OBJ
      ?auto_17902 - OBJ
      ?auto_17903 - OBJ
      ?auto_17904 - OBJ
      ?auto_17900 - LOCATION
    )
    :vars
    (
      ?auto_17907 - TRUCK
      ?auto_17905 - LOCATION
      ?auto_17906 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17904 ?auto_17907 ) ( TRUCK-AT ?auto_17907 ?auto_17905 ) ( IN-CITY ?auto_17905 ?auto_17906 ) ( IN-CITY ?auto_17900 ?auto_17906 ) ( not ( = ?auto_17900 ?auto_17905 ) ) ( OBJ-AT ?auto_17903 ?auto_17900 ) ( not ( = ?auto_17903 ?auto_17904 ) ) ( OBJ-AT ?auto_17901 ?auto_17900 ) ( OBJ-AT ?auto_17902 ?auto_17900 ) ( not ( = ?auto_17901 ?auto_17902 ) ) ( not ( = ?auto_17901 ?auto_17903 ) ) ( not ( = ?auto_17901 ?auto_17904 ) ) ( not ( = ?auto_17902 ?auto_17903 ) ) ( not ( = ?auto_17902 ?auto_17904 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17903 ?auto_17904 ?auto_17900 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17917 - OBJ
      ?auto_17918 - OBJ
      ?auto_17919 - OBJ
      ?auto_17920 - OBJ
      ?auto_17916 - LOCATION
    )
    :vars
    (
      ?auto_17923 - TRUCK
      ?auto_17921 - LOCATION
      ?auto_17922 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17919 ?auto_17923 ) ( TRUCK-AT ?auto_17923 ?auto_17921 ) ( IN-CITY ?auto_17921 ?auto_17922 ) ( IN-CITY ?auto_17916 ?auto_17922 ) ( not ( = ?auto_17916 ?auto_17921 ) ) ( OBJ-AT ?auto_17918 ?auto_17916 ) ( not ( = ?auto_17918 ?auto_17919 ) ) ( OBJ-AT ?auto_17917 ?auto_17916 ) ( OBJ-AT ?auto_17920 ?auto_17916 ) ( not ( = ?auto_17917 ?auto_17918 ) ) ( not ( = ?auto_17917 ?auto_17919 ) ) ( not ( = ?auto_17917 ?auto_17920 ) ) ( not ( = ?auto_17918 ?auto_17920 ) ) ( not ( = ?auto_17919 ?auto_17920 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17918 ?auto_17919 ?auto_17916 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_17981 - OBJ
      ?auto_17982 - OBJ
      ?auto_17983 - OBJ
      ?auto_17984 - OBJ
      ?auto_17980 - LOCATION
    )
    :vars
    (
      ?auto_17987 - TRUCK
      ?auto_17985 - LOCATION
      ?auto_17986 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_17982 ?auto_17987 ) ( TRUCK-AT ?auto_17987 ?auto_17985 ) ( IN-CITY ?auto_17985 ?auto_17986 ) ( IN-CITY ?auto_17980 ?auto_17986 ) ( not ( = ?auto_17980 ?auto_17985 ) ) ( OBJ-AT ?auto_17983 ?auto_17980 ) ( not ( = ?auto_17983 ?auto_17982 ) ) ( OBJ-AT ?auto_17981 ?auto_17980 ) ( OBJ-AT ?auto_17984 ?auto_17980 ) ( not ( = ?auto_17981 ?auto_17982 ) ) ( not ( = ?auto_17981 ?auto_17983 ) ) ( not ( = ?auto_17981 ?auto_17984 ) ) ( not ( = ?auto_17982 ?auto_17984 ) ) ( not ( = ?auto_17983 ?auto_17984 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_17983 ?auto_17982 ?auto_17980 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18061 - OBJ
      ?auto_18062 - OBJ
      ?auto_18063 - OBJ
      ?auto_18064 - OBJ
      ?auto_18060 - LOCATION
    )
    :vars
    (
      ?auto_18067 - TRUCK
      ?auto_18065 - LOCATION
      ?auto_18066 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18064 ?auto_18067 ) ( TRUCK-AT ?auto_18067 ?auto_18065 ) ( IN-CITY ?auto_18065 ?auto_18066 ) ( IN-CITY ?auto_18060 ?auto_18066 ) ( not ( = ?auto_18060 ?auto_18065 ) ) ( OBJ-AT ?auto_18062 ?auto_18060 ) ( not ( = ?auto_18062 ?auto_18064 ) ) ( OBJ-AT ?auto_18061 ?auto_18060 ) ( OBJ-AT ?auto_18063 ?auto_18060 ) ( not ( = ?auto_18061 ?auto_18062 ) ) ( not ( = ?auto_18061 ?auto_18063 ) ) ( not ( = ?auto_18061 ?auto_18064 ) ) ( not ( = ?auto_18062 ?auto_18063 ) ) ( not ( = ?auto_18063 ?auto_18064 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18062 ?auto_18064 ?auto_18060 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18069 - OBJ
      ?auto_18070 - OBJ
      ?auto_18071 - OBJ
      ?auto_18072 - OBJ
      ?auto_18068 - LOCATION
    )
    :vars
    (
      ?auto_18075 - TRUCK
      ?auto_18073 - LOCATION
      ?auto_18074 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18071 ?auto_18075 ) ( TRUCK-AT ?auto_18075 ?auto_18073 ) ( IN-CITY ?auto_18073 ?auto_18074 ) ( IN-CITY ?auto_18068 ?auto_18074 ) ( not ( = ?auto_18068 ?auto_18073 ) ) ( OBJ-AT ?auto_18072 ?auto_18068 ) ( not ( = ?auto_18072 ?auto_18071 ) ) ( OBJ-AT ?auto_18069 ?auto_18068 ) ( OBJ-AT ?auto_18070 ?auto_18068 ) ( not ( = ?auto_18069 ?auto_18070 ) ) ( not ( = ?auto_18069 ?auto_18071 ) ) ( not ( = ?auto_18069 ?auto_18072 ) ) ( not ( = ?auto_18070 ?auto_18071 ) ) ( not ( = ?auto_18070 ?auto_18072 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18072 ?auto_18071 ?auto_18068 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18101 - OBJ
      ?auto_18102 - OBJ
      ?auto_18103 - OBJ
      ?auto_18104 - OBJ
      ?auto_18100 - LOCATION
    )
    :vars
    (
      ?auto_18107 - TRUCK
      ?auto_18105 - LOCATION
      ?auto_18106 - CITY
      ?auto_18108 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18104 ?auto_18107 ) ( TRUCK-AT ?auto_18107 ?auto_18105 ) ( IN-CITY ?auto_18105 ?auto_18106 ) ( IN-CITY ?auto_18100 ?auto_18106 ) ( not ( = ?auto_18100 ?auto_18105 ) ) ( OBJ-AT ?auto_18108 ?auto_18100 ) ( not ( = ?auto_18108 ?auto_18104 ) ) ( OBJ-AT ?auto_18101 ?auto_18100 ) ( OBJ-AT ?auto_18102 ?auto_18100 ) ( OBJ-AT ?auto_18103 ?auto_18100 ) ( not ( = ?auto_18101 ?auto_18102 ) ) ( not ( = ?auto_18101 ?auto_18103 ) ) ( not ( = ?auto_18101 ?auto_18104 ) ) ( not ( = ?auto_18101 ?auto_18108 ) ) ( not ( = ?auto_18102 ?auto_18103 ) ) ( not ( = ?auto_18102 ?auto_18104 ) ) ( not ( = ?auto_18102 ?auto_18108 ) ) ( not ( = ?auto_18103 ?auto_18104 ) ) ( not ( = ?auto_18103 ?auto_18108 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18108 ?auto_18104 ?auto_18100 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18118 - OBJ
      ?auto_18119 - OBJ
      ?auto_18120 - OBJ
      ?auto_18121 - OBJ
      ?auto_18117 - LOCATION
    )
    :vars
    (
      ?auto_18124 - TRUCK
      ?auto_18122 - LOCATION
      ?auto_18123 - CITY
      ?auto_18125 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18120 ?auto_18124 ) ( TRUCK-AT ?auto_18124 ?auto_18122 ) ( IN-CITY ?auto_18122 ?auto_18123 ) ( IN-CITY ?auto_18117 ?auto_18123 ) ( not ( = ?auto_18117 ?auto_18122 ) ) ( OBJ-AT ?auto_18125 ?auto_18117 ) ( not ( = ?auto_18125 ?auto_18120 ) ) ( OBJ-AT ?auto_18118 ?auto_18117 ) ( OBJ-AT ?auto_18119 ?auto_18117 ) ( OBJ-AT ?auto_18121 ?auto_18117 ) ( not ( = ?auto_18118 ?auto_18119 ) ) ( not ( = ?auto_18118 ?auto_18120 ) ) ( not ( = ?auto_18118 ?auto_18121 ) ) ( not ( = ?auto_18118 ?auto_18125 ) ) ( not ( = ?auto_18119 ?auto_18120 ) ) ( not ( = ?auto_18119 ?auto_18121 ) ) ( not ( = ?auto_18119 ?auto_18125 ) ) ( not ( = ?auto_18120 ?auto_18121 ) ) ( not ( = ?auto_18121 ?auto_18125 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18125 ?auto_18120 ?auto_18117 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18160 - OBJ
      ?auto_18161 - OBJ
      ?auto_18162 - OBJ
      ?auto_18163 - OBJ
      ?auto_18159 - LOCATION
    )
    :vars
    (
      ?auto_18166 - TRUCK
      ?auto_18164 - LOCATION
      ?auto_18165 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18161 ?auto_18166 ) ( TRUCK-AT ?auto_18166 ?auto_18164 ) ( IN-CITY ?auto_18164 ?auto_18165 ) ( IN-CITY ?auto_18159 ?auto_18165 ) ( not ( = ?auto_18159 ?auto_18164 ) ) ( OBJ-AT ?auto_18163 ?auto_18159 ) ( not ( = ?auto_18163 ?auto_18161 ) ) ( OBJ-AT ?auto_18160 ?auto_18159 ) ( OBJ-AT ?auto_18162 ?auto_18159 ) ( not ( = ?auto_18160 ?auto_18161 ) ) ( not ( = ?auto_18160 ?auto_18162 ) ) ( not ( = ?auto_18160 ?auto_18163 ) ) ( not ( = ?auto_18161 ?auto_18162 ) ) ( not ( = ?auto_18162 ?auto_18163 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18163 ?auto_18161 ?auto_18159 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18168 - OBJ
      ?auto_18169 - OBJ
      ?auto_18170 - OBJ
      ?auto_18171 - OBJ
      ?auto_18167 - LOCATION
    )
    :vars
    (
      ?auto_18174 - TRUCK
      ?auto_18172 - LOCATION
      ?auto_18173 - CITY
      ?auto_18175 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18169 ?auto_18174 ) ( TRUCK-AT ?auto_18174 ?auto_18172 ) ( IN-CITY ?auto_18172 ?auto_18173 ) ( IN-CITY ?auto_18167 ?auto_18173 ) ( not ( = ?auto_18167 ?auto_18172 ) ) ( OBJ-AT ?auto_18175 ?auto_18167 ) ( not ( = ?auto_18175 ?auto_18169 ) ) ( OBJ-AT ?auto_18168 ?auto_18167 ) ( OBJ-AT ?auto_18170 ?auto_18167 ) ( OBJ-AT ?auto_18171 ?auto_18167 ) ( not ( = ?auto_18168 ?auto_18169 ) ) ( not ( = ?auto_18168 ?auto_18170 ) ) ( not ( = ?auto_18168 ?auto_18171 ) ) ( not ( = ?auto_18168 ?auto_18175 ) ) ( not ( = ?auto_18169 ?auto_18170 ) ) ( not ( = ?auto_18169 ?auto_18171 ) ) ( not ( = ?auto_18170 ?auto_18171 ) ) ( not ( = ?auto_18170 ?auto_18175 ) ) ( not ( = ?auto_18171 ?auto_18175 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18175 ?auto_18169 ?auto_18167 ) )
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
      ?auto_18218 - TRUCK
      ?auto_18216 - LOCATION
      ?auto_18217 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18212 ?auto_18218 ) ( TRUCK-AT ?auto_18218 ?auto_18216 ) ( IN-CITY ?auto_18216 ?auto_18217 ) ( IN-CITY ?auto_18211 ?auto_18217 ) ( not ( = ?auto_18211 ?auto_18216 ) ) ( OBJ-AT ?auto_18215 ?auto_18211 ) ( not ( = ?auto_18215 ?auto_18212 ) ) ( OBJ-AT ?auto_18213 ?auto_18211 ) ( OBJ-AT ?auto_18214 ?auto_18211 ) ( not ( = ?auto_18212 ?auto_18213 ) ) ( not ( = ?auto_18212 ?auto_18214 ) ) ( not ( = ?auto_18213 ?auto_18214 ) ) ( not ( = ?auto_18213 ?auto_18215 ) ) ( not ( = ?auto_18214 ?auto_18215 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18215 ?auto_18212 ?auto_18211 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18292 - OBJ
      ?auto_18293 - OBJ
      ?auto_18294 - OBJ
      ?auto_18295 - OBJ
      ?auto_18291 - LOCATION
    )
    :vars
    (
      ?auto_18298 - TRUCK
      ?auto_18296 - LOCATION
      ?auto_18297 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18292 ?auto_18298 ) ( TRUCK-AT ?auto_18298 ?auto_18296 ) ( IN-CITY ?auto_18296 ?auto_18297 ) ( IN-CITY ?auto_18291 ?auto_18297 ) ( not ( = ?auto_18291 ?auto_18296 ) ) ( OBJ-AT ?auto_18294 ?auto_18291 ) ( not ( = ?auto_18294 ?auto_18292 ) ) ( OBJ-AT ?auto_18293 ?auto_18291 ) ( OBJ-AT ?auto_18295 ?auto_18291 ) ( not ( = ?auto_18292 ?auto_18293 ) ) ( not ( = ?auto_18292 ?auto_18295 ) ) ( not ( = ?auto_18293 ?auto_18294 ) ) ( not ( = ?auto_18293 ?auto_18295 ) ) ( not ( = ?auto_18294 ?auto_18295 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18294 ?auto_18292 ?auto_18291 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18316 - OBJ
      ?auto_18317 - OBJ
      ?auto_18318 - OBJ
      ?auto_18319 - OBJ
      ?auto_18315 - LOCATION
    )
    :vars
    (
      ?auto_18322 - TRUCK
      ?auto_18320 - LOCATION
      ?auto_18321 - CITY
      ?auto_18323 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_18316 ?auto_18322 ) ( TRUCK-AT ?auto_18322 ?auto_18320 ) ( IN-CITY ?auto_18320 ?auto_18321 ) ( IN-CITY ?auto_18315 ?auto_18321 ) ( not ( = ?auto_18315 ?auto_18320 ) ) ( OBJ-AT ?auto_18323 ?auto_18315 ) ( not ( = ?auto_18323 ?auto_18316 ) ) ( OBJ-AT ?auto_18317 ?auto_18315 ) ( OBJ-AT ?auto_18318 ?auto_18315 ) ( OBJ-AT ?auto_18319 ?auto_18315 ) ( not ( = ?auto_18316 ?auto_18317 ) ) ( not ( = ?auto_18316 ?auto_18318 ) ) ( not ( = ?auto_18316 ?auto_18319 ) ) ( not ( = ?auto_18317 ?auto_18318 ) ) ( not ( = ?auto_18317 ?auto_18319 ) ) ( not ( = ?auto_18317 ?auto_18323 ) ) ( not ( = ?auto_18318 ?auto_18319 ) ) ( not ( = ?auto_18318 ?auto_18323 ) ) ( not ( = ?auto_18319 ?auto_18323 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18323 ?auto_18316 ?auto_18315 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18500 - OBJ
      ?auto_18501 - OBJ
      ?auto_18502 - OBJ
      ?auto_18499 - LOCATION
    )
    :vars
    (
      ?auto_18504 - TRUCK
      ?auto_18506 - LOCATION
      ?auto_18503 - CITY
      ?auto_18505 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18504 ?auto_18506 ) ( IN-CITY ?auto_18506 ?auto_18503 ) ( IN-CITY ?auto_18499 ?auto_18503 ) ( not ( = ?auto_18499 ?auto_18506 ) ) ( OBJ-AT ?auto_18505 ?auto_18499 ) ( not ( = ?auto_18505 ?auto_18502 ) ) ( OBJ-AT ?auto_18502 ?auto_18506 ) ( OBJ-AT ?auto_18500 ?auto_18499 ) ( OBJ-AT ?auto_18501 ?auto_18499 ) ( not ( = ?auto_18500 ?auto_18501 ) ) ( not ( = ?auto_18500 ?auto_18502 ) ) ( not ( = ?auto_18500 ?auto_18505 ) ) ( not ( = ?auto_18501 ?auto_18502 ) ) ( not ( = ?auto_18501 ?auto_18505 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18505 ?auto_18502 ?auto_18499 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18512 - OBJ
      ?auto_18513 - OBJ
      ?auto_18514 - OBJ
      ?auto_18511 - LOCATION
    )
    :vars
    (
      ?auto_18516 - TRUCK
      ?auto_18518 - LOCATION
      ?auto_18515 - CITY
      ?auto_18517 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18516 ?auto_18518 ) ( IN-CITY ?auto_18518 ?auto_18515 ) ( IN-CITY ?auto_18511 ?auto_18515 ) ( not ( = ?auto_18511 ?auto_18518 ) ) ( OBJ-AT ?auto_18517 ?auto_18511 ) ( not ( = ?auto_18517 ?auto_18513 ) ) ( OBJ-AT ?auto_18513 ?auto_18518 ) ( OBJ-AT ?auto_18512 ?auto_18511 ) ( OBJ-AT ?auto_18514 ?auto_18511 ) ( not ( = ?auto_18512 ?auto_18513 ) ) ( not ( = ?auto_18512 ?auto_18514 ) ) ( not ( = ?auto_18512 ?auto_18517 ) ) ( not ( = ?auto_18513 ?auto_18514 ) ) ( not ( = ?auto_18514 ?auto_18517 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18517 ?auto_18513 ?auto_18511 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_18550 - OBJ
      ?auto_18551 - OBJ
      ?auto_18552 - OBJ
      ?auto_18549 - LOCATION
    )
    :vars
    (
      ?auto_18554 - TRUCK
      ?auto_18556 - LOCATION
      ?auto_18553 - CITY
      ?auto_18555 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18554 ?auto_18556 ) ( IN-CITY ?auto_18556 ?auto_18553 ) ( IN-CITY ?auto_18549 ?auto_18553 ) ( not ( = ?auto_18549 ?auto_18556 ) ) ( OBJ-AT ?auto_18555 ?auto_18549 ) ( not ( = ?auto_18555 ?auto_18550 ) ) ( OBJ-AT ?auto_18550 ?auto_18556 ) ( OBJ-AT ?auto_18551 ?auto_18549 ) ( OBJ-AT ?auto_18552 ?auto_18549 ) ( not ( = ?auto_18550 ?auto_18551 ) ) ( not ( = ?auto_18550 ?auto_18552 ) ) ( not ( = ?auto_18551 ?auto_18552 ) ) ( not ( = ?auto_18551 ?auto_18555 ) ) ( not ( = ?auto_18552 ?auto_18555 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18555 ?auto_18550 ?auto_18549 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18589 - OBJ
      ?auto_18590 - OBJ
      ?auto_18591 - OBJ
      ?auto_18592 - OBJ
      ?auto_18588 - LOCATION
    )
    :vars
    (
      ?auto_18594 - TRUCK
      ?auto_18595 - LOCATION
      ?auto_18593 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18594 ?auto_18595 ) ( IN-CITY ?auto_18595 ?auto_18593 ) ( IN-CITY ?auto_18588 ?auto_18593 ) ( not ( = ?auto_18588 ?auto_18595 ) ) ( OBJ-AT ?auto_18590 ?auto_18588 ) ( not ( = ?auto_18590 ?auto_18592 ) ) ( OBJ-AT ?auto_18592 ?auto_18595 ) ( OBJ-AT ?auto_18589 ?auto_18588 ) ( OBJ-AT ?auto_18591 ?auto_18588 ) ( not ( = ?auto_18589 ?auto_18590 ) ) ( not ( = ?auto_18589 ?auto_18591 ) ) ( not ( = ?auto_18589 ?auto_18592 ) ) ( not ( = ?auto_18590 ?auto_18591 ) ) ( not ( = ?auto_18591 ?auto_18592 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18590 ?auto_18592 ?auto_18588 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18629 - OBJ
      ?auto_18630 - OBJ
      ?auto_18631 - OBJ
      ?auto_18632 - OBJ
      ?auto_18628 - LOCATION
    )
    :vars
    (
      ?auto_18634 - TRUCK
      ?auto_18635 - LOCATION
      ?auto_18633 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18634 ?auto_18635 ) ( IN-CITY ?auto_18635 ?auto_18633 ) ( IN-CITY ?auto_18628 ?auto_18633 ) ( not ( = ?auto_18628 ?auto_18635 ) ) ( OBJ-AT ?auto_18631 ?auto_18628 ) ( not ( = ?auto_18631 ?auto_18632 ) ) ( OBJ-AT ?auto_18632 ?auto_18635 ) ( OBJ-AT ?auto_18629 ?auto_18628 ) ( OBJ-AT ?auto_18630 ?auto_18628 ) ( not ( = ?auto_18629 ?auto_18630 ) ) ( not ( = ?auto_18629 ?auto_18631 ) ) ( not ( = ?auto_18629 ?auto_18632 ) ) ( not ( = ?auto_18630 ?auto_18631 ) ) ( not ( = ?auto_18630 ?auto_18632 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18631 ?auto_18632 ?auto_18628 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18669 - OBJ
      ?auto_18670 - OBJ
      ?auto_18671 - OBJ
      ?auto_18672 - OBJ
      ?auto_18668 - LOCATION
    )
    :vars
    (
      ?auto_18674 - TRUCK
      ?auto_18675 - LOCATION
      ?auto_18673 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18674 ?auto_18675 ) ( IN-CITY ?auto_18675 ?auto_18673 ) ( IN-CITY ?auto_18668 ?auto_18673 ) ( not ( = ?auto_18668 ?auto_18675 ) ) ( OBJ-AT ?auto_18671 ?auto_18668 ) ( not ( = ?auto_18671 ?auto_18670 ) ) ( OBJ-AT ?auto_18670 ?auto_18675 ) ( OBJ-AT ?auto_18669 ?auto_18668 ) ( OBJ-AT ?auto_18672 ?auto_18668 ) ( not ( = ?auto_18669 ?auto_18670 ) ) ( not ( = ?auto_18669 ?auto_18671 ) ) ( not ( = ?auto_18669 ?auto_18672 ) ) ( not ( = ?auto_18670 ?auto_18672 ) ) ( not ( = ?auto_18671 ?auto_18672 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18671 ?auto_18670 ?auto_18668 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18757 - OBJ
      ?auto_18758 - OBJ
      ?auto_18759 - OBJ
      ?auto_18760 - OBJ
      ?auto_18756 - LOCATION
    )
    :vars
    (
      ?auto_18762 - TRUCK
      ?auto_18763 - LOCATION
      ?auto_18761 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18762 ?auto_18763 ) ( IN-CITY ?auto_18763 ?auto_18761 ) ( IN-CITY ?auto_18756 ?auto_18761 ) ( not ( = ?auto_18756 ?auto_18763 ) ) ( OBJ-AT ?auto_18758 ?auto_18756 ) ( not ( = ?auto_18758 ?auto_18759 ) ) ( OBJ-AT ?auto_18759 ?auto_18763 ) ( OBJ-AT ?auto_18757 ?auto_18756 ) ( OBJ-AT ?auto_18760 ?auto_18756 ) ( not ( = ?auto_18757 ?auto_18758 ) ) ( not ( = ?auto_18757 ?auto_18759 ) ) ( not ( = ?auto_18757 ?auto_18760 ) ) ( not ( = ?auto_18758 ?auto_18760 ) ) ( not ( = ?auto_18759 ?auto_18760 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18758 ?auto_18759 ?auto_18756 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18789 - OBJ
      ?auto_18790 - OBJ
      ?auto_18791 - OBJ
      ?auto_18792 - OBJ
      ?auto_18788 - LOCATION
    )
    :vars
    (
      ?auto_18794 - TRUCK
      ?auto_18796 - LOCATION
      ?auto_18793 - CITY
      ?auto_18795 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18794 ?auto_18796 ) ( IN-CITY ?auto_18796 ?auto_18793 ) ( IN-CITY ?auto_18788 ?auto_18793 ) ( not ( = ?auto_18788 ?auto_18796 ) ) ( OBJ-AT ?auto_18795 ?auto_18788 ) ( not ( = ?auto_18795 ?auto_18792 ) ) ( OBJ-AT ?auto_18792 ?auto_18796 ) ( OBJ-AT ?auto_18789 ?auto_18788 ) ( OBJ-AT ?auto_18790 ?auto_18788 ) ( OBJ-AT ?auto_18791 ?auto_18788 ) ( not ( = ?auto_18789 ?auto_18790 ) ) ( not ( = ?auto_18789 ?auto_18791 ) ) ( not ( = ?auto_18789 ?auto_18792 ) ) ( not ( = ?auto_18789 ?auto_18795 ) ) ( not ( = ?auto_18790 ?auto_18791 ) ) ( not ( = ?auto_18790 ?auto_18792 ) ) ( not ( = ?auto_18790 ?auto_18795 ) ) ( not ( = ?auto_18791 ?auto_18792 ) ) ( not ( = ?auto_18791 ?auto_18795 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18795 ?auto_18792 ?auto_18788 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18798 - OBJ
      ?auto_18799 - OBJ
      ?auto_18800 - OBJ
      ?auto_18801 - OBJ
      ?auto_18797 - LOCATION
    )
    :vars
    (
      ?auto_18803 - TRUCK
      ?auto_18804 - LOCATION
      ?auto_18802 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18803 ?auto_18804 ) ( IN-CITY ?auto_18804 ?auto_18802 ) ( IN-CITY ?auto_18797 ?auto_18802 ) ( not ( = ?auto_18797 ?auto_18804 ) ) ( OBJ-AT ?auto_18801 ?auto_18797 ) ( not ( = ?auto_18801 ?auto_18800 ) ) ( OBJ-AT ?auto_18800 ?auto_18804 ) ( OBJ-AT ?auto_18798 ?auto_18797 ) ( OBJ-AT ?auto_18799 ?auto_18797 ) ( not ( = ?auto_18798 ?auto_18799 ) ) ( not ( = ?auto_18798 ?auto_18800 ) ) ( not ( = ?auto_18798 ?auto_18801 ) ) ( not ( = ?auto_18799 ?auto_18800 ) ) ( not ( = ?auto_18799 ?auto_18801 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18801 ?auto_18800 ?auto_18797 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18806 - OBJ
      ?auto_18807 - OBJ
      ?auto_18808 - OBJ
      ?auto_18809 - OBJ
      ?auto_18805 - LOCATION
    )
    :vars
    (
      ?auto_18811 - TRUCK
      ?auto_18813 - LOCATION
      ?auto_18810 - CITY
      ?auto_18812 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18811 ?auto_18813 ) ( IN-CITY ?auto_18813 ?auto_18810 ) ( IN-CITY ?auto_18805 ?auto_18810 ) ( not ( = ?auto_18805 ?auto_18813 ) ) ( OBJ-AT ?auto_18812 ?auto_18805 ) ( not ( = ?auto_18812 ?auto_18808 ) ) ( OBJ-AT ?auto_18808 ?auto_18813 ) ( OBJ-AT ?auto_18806 ?auto_18805 ) ( OBJ-AT ?auto_18807 ?auto_18805 ) ( OBJ-AT ?auto_18809 ?auto_18805 ) ( not ( = ?auto_18806 ?auto_18807 ) ) ( not ( = ?auto_18806 ?auto_18808 ) ) ( not ( = ?auto_18806 ?auto_18809 ) ) ( not ( = ?auto_18806 ?auto_18812 ) ) ( not ( = ?auto_18807 ?auto_18808 ) ) ( not ( = ?auto_18807 ?auto_18809 ) ) ( not ( = ?auto_18807 ?auto_18812 ) ) ( not ( = ?auto_18808 ?auto_18809 ) ) ( not ( = ?auto_18809 ?auto_18812 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18812 ?auto_18808 ?auto_18805 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18824 - OBJ
      ?auto_18825 - OBJ
      ?auto_18826 - OBJ
      ?auto_18827 - OBJ
      ?auto_18823 - LOCATION
    )
    :vars
    (
      ?auto_18829 - TRUCK
      ?auto_18830 - LOCATION
      ?auto_18828 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18829 ?auto_18830 ) ( IN-CITY ?auto_18830 ?auto_18828 ) ( IN-CITY ?auto_18823 ?auto_18828 ) ( not ( = ?auto_18823 ?auto_18830 ) ) ( OBJ-AT ?auto_18827 ?auto_18823 ) ( not ( = ?auto_18827 ?auto_18825 ) ) ( OBJ-AT ?auto_18825 ?auto_18830 ) ( OBJ-AT ?auto_18824 ?auto_18823 ) ( OBJ-AT ?auto_18826 ?auto_18823 ) ( not ( = ?auto_18824 ?auto_18825 ) ) ( not ( = ?auto_18824 ?auto_18826 ) ) ( not ( = ?auto_18824 ?auto_18827 ) ) ( not ( = ?auto_18825 ?auto_18826 ) ) ( not ( = ?auto_18826 ?auto_18827 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18827 ?auto_18825 ?auto_18823 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18856 - OBJ
      ?auto_18857 - OBJ
      ?auto_18858 - OBJ
      ?auto_18859 - OBJ
      ?auto_18855 - LOCATION
    )
    :vars
    (
      ?auto_18861 - TRUCK
      ?auto_18863 - LOCATION
      ?auto_18860 - CITY
      ?auto_18862 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18861 ?auto_18863 ) ( IN-CITY ?auto_18863 ?auto_18860 ) ( IN-CITY ?auto_18855 ?auto_18860 ) ( not ( = ?auto_18855 ?auto_18863 ) ) ( OBJ-AT ?auto_18862 ?auto_18855 ) ( not ( = ?auto_18862 ?auto_18857 ) ) ( OBJ-AT ?auto_18857 ?auto_18863 ) ( OBJ-AT ?auto_18856 ?auto_18855 ) ( OBJ-AT ?auto_18858 ?auto_18855 ) ( OBJ-AT ?auto_18859 ?auto_18855 ) ( not ( = ?auto_18856 ?auto_18857 ) ) ( not ( = ?auto_18856 ?auto_18858 ) ) ( not ( = ?auto_18856 ?auto_18859 ) ) ( not ( = ?auto_18856 ?auto_18862 ) ) ( not ( = ?auto_18857 ?auto_18858 ) ) ( not ( = ?auto_18857 ?auto_18859 ) ) ( not ( = ?auto_18858 ?auto_18859 ) ) ( not ( = ?auto_18858 ?auto_18862 ) ) ( not ( = ?auto_18859 ?auto_18862 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18862 ?auto_18857 ?auto_18855 ) )
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
      ?auto_18905 - TRUCK
      ?auto_18906 - LOCATION
      ?auto_18904 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18905 ?auto_18906 ) ( IN-CITY ?auto_18906 ?auto_18904 ) ( IN-CITY ?auto_18899 ?auto_18904 ) ( not ( = ?auto_18899 ?auto_18906 ) ) ( OBJ-AT ?auto_18903 ?auto_18899 ) ( not ( = ?auto_18903 ?auto_18900 ) ) ( OBJ-AT ?auto_18900 ?auto_18906 ) ( OBJ-AT ?auto_18901 ?auto_18899 ) ( OBJ-AT ?auto_18902 ?auto_18899 ) ( not ( = ?auto_18900 ?auto_18901 ) ) ( not ( = ?auto_18900 ?auto_18902 ) ) ( not ( = ?auto_18901 ?auto_18902 ) ) ( not ( = ?auto_18901 ?auto_18903 ) ) ( not ( = ?auto_18902 ?auto_18903 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18903 ?auto_18900 ?auto_18899 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_18908 - OBJ
      ?auto_18909 - OBJ
      ?auto_18910 - OBJ
      ?auto_18911 - OBJ
      ?auto_18907 - LOCATION
    )
    :vars
    (
      ?auto_18913 - TRUCK
      ?auto_18914 - LOCATION
      ?auto_18912 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_18913 ?auto_18914 ) ( IN-CITY ?auto_18914 ?auto_18912 ) ( IN-CITY ?auto_18907 ?auto_18912 ) ( not ( = ?auto_18907 ?auto_18914 ) ) ( OBJ-AT ?auto_18910 ?auto_18907 ) ( not ( = ?auto_18910 ?auto_18908 ) ) ( OBJ-AT ?auto_18908 ?auto_18914 ) ( OBJ-AT ?auto_18909 ?auto_18907 ) ( OBJ-AT ?auto_18911 ?auto_18907 ) ( not ( = ?auto_18908 ?auto_18909 ) ) ( not ( = ?auto_18908 ?auto_18911 ) ) ( not ( = ?auto_18909 ?auto_18910 ) ) ( not ( = ?auto_18909 ?auto_18911 ) ) ( not ( = ?auto_18910 ?auto_18911 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_18910 ?auto_18908 ?auto_18907 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19004 - OBJ
      ?auto_19005 - OBJ
      ?auto_19006 - OBJ
      ?auto_19007 - OBJ
      ?auto_19003 - LOCATION
    )
    :vars
    (
      ?auto_19009 - TRUCK
      ?auto_19011 - LOCATION
      ?auto_19008 - CITY
      ?auto_19010 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_19009 ?auto_19011 ) ( IN-CITY ?auto_19011 ?auto_19008 ) ( IN-CITY ?auto_19003 ?auto_19008 ) ( not ( = ?auto_19003 ?auto_19011 ) ) ( OBJ-AT ?auto_19010 ?auto_19003 ) ( not ( = ?auto_19010 ?auto_19004 ) ) ( OBJ-AT ?auto_19004 ?auto_19011 ) ( OBJ-AT ?auto_19005 ?auto_19003 ) ( OBJ-AT ?auto_19006 ?auto_19003 ) ( OBJ-AT ?auto_19007 ?auto_19003 ) ( not ( = ?auto_19004 ?auto_19005 ) ) ( not ( = ?auto_19004 ?auto_19006 ) ) ( not ( = ?auto_19004 ?auto_19007 ) ) ( not ( = ?auto_19005 ?auto_19006 ) ) ( not ( = ?auto_19005 ?auto_19007 ) ) ( not ( = ?auto_19005 ?auto_19010 ) ) ( not ( = ?auto_19006 ?auto_19007 ) ) ( not ( = ?auto_19006 ?auto_19010 ) ) ( not ( = ?auto_19007 ?auto_19010 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19010 ?auto_19004 ?auto_19003 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19155 - OBJ
      ?auto_19156 - OBJ
      ?auto_19157 - OBJ
      ?auto_19154 - LOCATION
    )
    :vars
    (
      ?auto_19158 - LOCATION
      ?auto_19160 - CITY
      ?auto_19159 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19158 ?auto_19160 ) ( IN-CITY ?auto_19154 ?auto_19160 ) ( not ( = ?auto_19154 ?auto_19158 ) ) ( OBJ-AT ?auto_19156 ?auto_19154 ) ( not ( = ?auto_19156 ?auto_19157 ) ) ( OBJ-AT ?auto_19157 ?auto_19158 ) ( TRUCK-AT ?auto_19159 ?auto_19154 ) ( OBJ-AT ?auto_19155 ?auto_19154 ) ( not ( = ?auto_19155 ?auto_19156 ) ) ( not ( = ?auto_19155 ?auto_19157 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19156 ?auto_19157 ?auto_19154 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19188 - OBJ
      ?auto_19189 - OBJ
      ?auto_19190 - OBJ
      ?auto_19187 - LOCATION
    )
    :vars
    (
      ?auto_19191 - LOCATION
      ?auto_19193 - CITY
      ?auto_19194 - OBJ
      ?auto_19192 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19191 ?auto_19193 ) ( IN-CITY ?auto_19187 ?auto_19193 ) ( not ( = ?auto_19187 ?auto_19191 ) ) ( OBJ-AT ?auto_19194 ?auto_19187 ) ( not ( = ?auto_19194 ?auto_19190 ) ) ( OBJ-AT ?auto_19190 ?auto_19191 ) ( TRUCK-AT ?auto_19192 ?auto_19187 ) ( OBJ-AT ?auto_19188 ?auto_19187 ) ( OBJ-AT ?auto_19189 ?auto_19187 ) ( not ( = ?auto_19188 ?auto_19189 ) ) ( not ( = ?auto_19188 ?auto_19190 ) ) ( not ( = ?auto_19188 ?auto_19194 ) ) ( not ( = ?auto_19189 ?auto_19190 ) ) ( not ( = ?auto_19189 ?auto_19194 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19194 ?auto_19190 ?auto_19187 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19200 - OBJ
      ?auto_19201 - OBJ
      ?auto_19202 - OBJ
      ?auto_19199 - LOCATION
    )
    :vars
    (
      ?auto_19203 - LOCATION
      ?auto_19205 - CITY
      ?auto_19206 - OBJ
      ?auto_19204 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19203 ?auto_19205 ) ( IN-CITY ?auto_19199 ?auto_19205 ) ( not ( = ?auto_19199 ?auto_19203 ) ) ( OBJ-AT ?auto_19206 ?auto_19199 ) ( not ( = ?auto_19206 ?auto_19201 ) ) ( OBJ-AT ?auto_19201 ?auto_19203 ) ( TRUCK-AT ?auto_19204 ?auto_19199 ) ( OBJ-AT ?auto_19200 ?auto_19199 ) ( OBJ-AT ?auto_19202 ?auto_19199 ) ( not ( = ?auto_19200 ?auto_19201 ) ) ( not ( = ?auto_19200 ?auto_19202 ) ) ( not ( = ?auto_19200 ?auto_19206 ) ) ( not ( = ?auto_19201 ?auto_19202 ) ) ( not ( = ?auto_19202 ?auto_19206 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19206 ?auto_19201 ?auto_19199 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19216 - OBJ
      ?auto_19217 - OBJ
      ?auto_19218 - OBJ
      ?auto_19215 - LOCATION
    )
    :vars
    (
      ?auto_19219 - LOCATION
      ?auto_19221 - CITY
      ?auto_19220 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19219 ?auto_19221 ) ( IN-CITY ?auto_19215 ?auto_19221 ) ( not ( = ?auto_19215 ?auto_19219 ) ) ( OBJ-AT ?auto_19218 ?auto_19215 ) ( not ( = ?auto_19218 ?auto_19216 ) ) ( OBJ-AT ?auto_19216 ?auto_19219 ) ( TRUCK-AT ?auto_19220 ?auto_19215 ) ( OBJ-AT ?auto_19217 ?auto_19215 ) ( not ( = ?auto_19216 ?auto_19217 ) ) ( not ( = ?auto_19217 ?auto_19218 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19218 ?auto_19216 ?auto_19215 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_19238 - OBJ
      ?auto_19239 - OBJ
      ?auto_19240 - OBJ
      ?auto_19237 - LOCATION
    )
    :vars
    (
      ?auto_19241 - LOCATION
      ?auto_19243 - CITY
      ?auto_19244 - OBJ
      ?auto_19242 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19241 ?auto_19243 ) ( IN-CITY ?auto_19237 ?auto_19243 ) ( not ( = ?auto_19237 ?auto_19241 ) ) ( OBJ-AT ?auto_19244 ?auto_19237 ) ( not ( = ?auto_19244 ?auto_19238 ) ) ( OBJ-AT ?auto_19238 ?auto_19241 ) ( TRUCK-AT ?auto_19242 ?auto_19237 ) ( OBJ-AT ?auto_19239 ?auto_19237 ) ( OBJ-AT ?auto_19240 ?auto_19237 ) ( not ( = ?auto_19238 ?auto_19239 ) ) ( not ( = ?auto_19238 ?auto_19240 ) ) ( not ( = ?auto_19239 ?auto_19240 ) ) ( not ( = ?auto_19239 ?auto_19244 ) ) ( not ( = ?auto_19240 ?auto_19244 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19244 ?auto_19238 ?auto_19237 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19277 - OBJ
      ?auto_19278 - OBJ
      ?auto_19279 - OBJ
      ?auto_19280 - OBJ
      ?auto_19276 - LOCATION
    )
    :vars
    (
      ?auto_19281 - LOCATION
      ?auto_19283 - CITY
      ?auto_19282 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19281 ?auto_19283 ) ( IN-CITY ?auto_19276 ?auto_19283 ) ( not ( = ?auto_19276 ?auto_19281 ) ) ( OBJ-AT ?auto_19279 ?auto_19276 ) ( not ( = ?auto_19279 ?auto_19280 ) ) ( OBJ-AT ?auto_19280 ?auto_19281 ) ( TRUCK-AT ?auto_19282 ?auto_19276 ) ( OBJ-AT ?auto_19277 ?auto_19276 ) ( OBJ-AT ?auto_19278 ?auto_19276 ) ( not ( = ?auto_19277 ?auto_19278 ) ) ( not ( = ?auto_19277 ?auto_19279 ) ) ( not ( = ?auto_19277 ?auto_19280 ) ) ( not ( = ?auto_19278 ?auto_19279 ) ) ( not ( = ?auto_19278 ?auto_19280 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19279 ?auto_19280 ?auto_19276 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19285 - OBJ
      ?auto_19286 - OBJ
      ?auto_19287 - OBJ
      ?auto_19288 - OBJ
      ?auto_19284 - LOCATION
    )
    :vars
    (
      ?auto_19289 - LOCATION
      ?auto_19291 - CITY
      ?auto_19290 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19289 ?auto_19291 ) ( IN-CITY ?auto_19284 ?auto_19291 ) ( not ( = ?auto_19284 ?auto_19289 ) ) ( OBJ-AT ?auto_19286 ?auto_19284 ) ( not ( = ?auto_19286 ?auto_19288 ) ) ( OBJ-AT ?auto_19288 ?auto_19289 ) ( TRUCK-AT ?auto_19290 ?auto_19284 ) ( OBJ-AT ?auto_19285 ?auto_19284 ) ( OBJ-AT ?auto_19287 ?auto_19284 ) ( not ( = ?auto_19285 ?auto_19286 ) ) ( not ( = ?auto_19285 ?auto_19287 ) ) ( not ( = ?auto_19285 ?auto_19288 ) ) ( not ( = ?auto_19286 ?auto_19287 ) ) ( not ( = ?auto_19287 ?auto_19288 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19286 ?auto_19288 ?auto_19284 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19301 - OBJ
      ?auto_19302 - OBJ
      ?auto_19303 - OBJ
      ?auto_19304 - OBJ
      ?auto_19300 - LOCATION
    )
    :vars
    (
      ?auto_19305 - LOCATION
      ?auto_19307 - CITY
      ?auto_19306 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19305 ?auto_19307 ) ( IN-CITY ?auto_19300 ?auto_19307 ) ( not ( = ?auto_19300 ?auto_19305 ) ) ( OBJ-AT ?auto_19301 ?auto_19300 ) ( not ( = ?auto_19301 ?auto_19303 ) ) ( OBJ-AT ?auto_19303 ?auto_19305 ) ( TRUCK-AT ?auto_19306 ?auto_19300 ) ( OBJ-AT ?auto_19302 ?auto_19300 ) ( OBJ-AT ?auto_19304 ?auto_19300 ) ( not ( = ?auto_19301 ?auto_19302 ) ) ( not ( = ?auto_19301 ?auto_19304 ) ) ( not ( = ?auto_19302 ?auto_19303 ) ) ( not ( = ?auto_19302 ?auto_19304 ) ) ( not ( = ?auto_19303 ?auto_19304 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19301 ?auto_19303 ?auto_19300 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19357 - OBJ
      ?auto_19358 - OBJ
      ?auto_19359 - OBJ
      ?auto_19360 - OBJ
      ?auto_19356 - LOCATION
    )
    :vars
    (
      ?auto_19361 - LOCATION
      ?auto_19363 - CITY
      ?auto_19362 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19361 ?auto_19363 ) ( IN-CITY ?auto_19356 ?auto_19363 ) ( not ( = ?auto_19356 ?auto_19361 ) ) ( OBJ-AT ?auto_19360 ?auto_19356 ) ( not ( = ?auto_19360 ?auto_19358 ) ) ( OBJ-AT ?auto_19358 ?auto_19361 ) ( TRUCK-AT ?auto_19362 ?auto_19356 ) ( OBJ-AT ?auto_19357 ?auto_19356 ) ( OBJ-AT ?auto_19359 ?auto_19356 ) ( not ( = ?auto_19357 ?auto_19358 ) ) ( not ( = ?auto_19357 ?auto_19359 ) ) ( not ( = ?auto_19357 ?auto_19360 ) ) ( not ( = ?auto_19358 ?auto_19359 ) ) ( not ( = ?auto_19359 ?auto_19360 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19360 ?auto_19358 ?auto_19356 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19445 - OBJ
      ?auto_19446 - OBJ
      ?auto_19447 - OBJ
      ?auto_19448 - OBJ
      ?auto_19444 - LOCATION
    )
    :vars
    (
      ?auto_19449 - LOCATION
      ?auto_19451 - CITY
      ?auto_19450 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19449 ?auto_19451 ) ( IN-CITY ?auto_19444 ?auto_19451 ) ( not ( = ?auto_19444 ?auto_19449 ) ) ( OBJ-AT ?auto_19446 ?auto_19444 ) ( not ( = ?auto_19446 ?auto_19447 ) ) ( OBJ-AT ?auto_19447 ?auto_19449 ) ( TRUCK-AT ?auto_19450 ?auto_19444 ) ( OBJ-AT ?auto_19445 ?auto_19444 ) ( OBJ-AT ?auto_19448 ?auto_19444 ) ( not ( = ?auto_19445 ?auto_19446 ) ) ( not ( = ?auto_19445 ?auto_19447 ) ) ( not ( = ?auto_19445 ?auto_19448 ) ) ( not ( = ?auto_19446 ?auto_19448 ) ) ( not ( = ?auto_19447 ?auto_19448 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19446 ?auto_19447 ?auto_19444 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19477 - OBJ
      ?auto_19478 - OBJ
      ?auto_19479 - OBJ
      ?auto_19480 - OBJ
      ?auto_19476 - LOCATION
    )
    :vars
    (
      ?auto_19481 - LOCATION
      ?auto_19483 - CITY
      ?auto_19484 - OBJ
      ?auto_19482 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19481 ?auto_19483 ) ( IN-CITY ?auto_19476 ?auto_19483 ) ( not ( = ?auto_19476 ?auto_19481 ) ) ( OBJ-AT ?auto_19484 ?auto_19476 ) ( not ( = ?auto_19484 ?auto_19480 ) ) ( OBJ-AT ?auto_19480 ?auto_19481 ) ( TRUCK-AT ?auto_19482 ?auto_19476 ) ( OBJ-AT ?auto_19477 ?auto_19476 ) ( OBJ-AT ?auto_19478 ?auto_19476 ) ( OBJ-AT ?auto_19479 ?auto_19476 ) ( not ( = ?auto_19477 ?auto_19478 ) ) ( not ( = ?auto_19477 ?auto_19479 ) ) ( not ( = ?auto_19477 ?auto_19480 ) ) ( not ( = ?auto_19477 ?auto_19484 ) ) ( not ( = ?auto_19478 ?auto_19479 ) ) ( not ( = ?auto_19478 ?auto_19480 ) ) ( not ( = ?auto_19478 ?auto_19484 ) ) ( not ( = ?auto_19479 ?auto_19480 ) ) ( not ( = ?auto_19479 ?auto_19484 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19484 ?auto_19480 ?auto_19476 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19494 - OBJ
      ?auto_19495 - OBJ
      ?auto_19496 - OBJ
      ?auto_19497 - OBJ
      ?auto_19493 - LOCATION
    )
    :vars
    (
      ?auto_19498 - LOCATION
      ?auto_19500 - CITY
      ?auto_19501 - OBJ
      ?auto_19499 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19498 ?auto_19500 ) ( IN-CITY ?auto_19493 ?auto_19500 ) ( not ( = ?auto_19493 ?auto_19498 ) ) ( OBJ-AT ?auto_19501 ?auto_19493 ) ( not ( = ?auto_19501 ?auto_19496 ) ) ( OBJ-AT ?auto_19496 ?auto_19498 ) ( TRUCK-AT ?auto_19499 ?auto_19493 ) ( OBJ-AT ?auto_19494 ?auto_19493 ) ( OBJ-AT ?auto_19495 ?auto_19493 ) ( OBJ-AT ?auto_19497 ?auto_19493 ) ( not ( = ?auto_19494 ?auto_19495 ) ) ( not ( = ?auto_19494 ?auto_19496 ) ) ( not ( = ?auto_19494 ?auto_19497 ) ) ( not ( = ?auto_19494 ?auto_19501 ) ) ( not ( = ?auto_19495 ?auto_19496 ) ) ( not ( = ?auto_19495 ?auto_19497 ) ) ( not ( = ?auto_19495 ?auto_19501 ) ) ( not ( = ?auto_19496 ?auto_19497 ) ) ( not ( = ?auto_19497 ?auto_19501 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19501 ?auto_19496 ?auto_19493 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19520 - OBJ
      ?auto_19521 - OBJ
      ?auto_19522 - OBJ
      ?auto_19523 - OBJ
      ?auto_19519 - LOCATION
    )
    :vars
    (
      ?auto_19524 - LOCATION
      ?auto_19526 - CITY
      ?auto_19525 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19524 ?auto_19526 ) ( IN-CITY ?auto_19519 ?auto_19526 ) ( not ( = ?auto_19519 ?auto_19524 ) ) ( OBJ-AT ?auto_19522 ?auto_19519 ) ( not ( = ?auto_19522 ?auto_19521 ) ) ( OBJ-AT ?auto_19521 ?auto_19524 ) ( TRUCK-AT ?auto_19525 ?auto_19519 ) ( OBJ-AT ?auto_19520 ?auto_19519 ) ( OBJ-AT ?auto_19523 ?auto_19519 ) ( not ( = ?auto_19520 ?auto_19521 ) ) ( not ( = ?auto_19520 ?auto_19522 ) ) ( not ( = ?auto_19520 ?auto_19523 ) ) ( not ( = ?auto_19521 ?auto_19523 ) ) ( not ( = ?auto_19522 ?auto_19523 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19522 ?auto_19521 ?auto_19519 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19544 - OBJ
      ?auto_19545 - OBJ
      ?auto_19546 - OBJ
      ?auto_19547 - OBJ
      ?auto_19543 - LOCATION
    )
    :vars
    (
      ?auto_19548 - LOCATION
      ?auto_19550 - CITY
      ?auto_19551 - OBJ
      ?auto_19549 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19548 ?auto_19550 ) ( IN-CITY ?auto_19543 ?auto_19550 ) ( not ( = ?auto_19543 ?auto_19548 ) ) ( OBJ-AT ?auto_19551 ?auto_19543 ) ( not ( = ?auto_19551 ?auto_19545 ) ) ( OBJ-AT ?auto_19545 ?auto_19548 ) ( TRUCK-AT ?auto_19549 ?auto_19543 ) ( OBJ-AT ?auto_19544 ?auto_19543 ) ( OBJ-AT ?auto_19546 ?auto_19543 ) ( OBJ-AT ?auto_19547 ?auto_19543 ) ( not ( = ?auto_19544 ?auto_19545 ) ) ( not ( = ?auto_19544 ?auto_19546 ) ) ( not ( = ?auto_19544 ?auto_19547 ) ) ( not ( = ?auto_19544 ?auto_19551 ) ) ( not ( = ?auto_19545 ?auto_19546 ) ) ( not ( = ?auto_19545 ?auto_19547 ) ) ( not ( = ?auto_19546 ?auto_19547 ) ) ( not ( = ?auto_19546 ?auto_19551 ) ) ( not ( = ?auto_19547 ?auto_19551 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19551 ?auto_19545 ?auto_19543 ) )
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
      ?auto_19592 - LOCATION
      ?auto_19594 - CITY
      ?auto_19593 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19592 ?auto_19594 ) ( IN-CITY ?auto_19587 ?auto_19594 ) ( not ( = ?auto_19587 ?auto_19592 ) ) ( OBJ-AT ?auto_19590 ?auto_19587 ) ( not ( = ?auto_19590 ?auto_19588 ) ) ( OBJ-AT ?auto_19588 ?auto_19592 ) ( TRUCK-AT ?auto_19593 ?auto_19587 ) ( OBJ-AT ?auto_19589 ?auto_19587 ) ( OBJ-AT ?auto_19591 ?auto_19587 ) ( not ( = ?auto_19588 ?auto_19589 ) ) ( not ( = ?auto_19588 ?auto_19591 ) ) ( not ( = ?auto_19589 ?auto_19590 ) ) ( not ( = ?auto_19589 ?auto_19591 ) ) ( not ( = ?auto_19590 ?auto_19591 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19590 ?auto_19588 ?auto_19587 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19596 - OBJ
      ?auto_19597 - OBJ
      ?auto_19598 - OBJ
      ?auto_19599 - OBJ
      ?auto_19595 - LOCATION
    )
    :vars
    (
      ?auto_19600 - LOCATION
      ?auto_19602 - CITY
      ?auto_19601 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19600 ?auto_19602 ) ( IN-CITY ?auto_19595 ?auto_19602 ) ( not ( = ?auto_19595 ?auto_19600 ) ) ( OBJ-AT ?auto_19597 ?auto_19595 ) ( not ( = ?auto_19597 ?auto_19596 ) ) ( OBJ-AT ?auto_19596 ?auto_19600 ) ( TRUCK-AT ?auto_19601 ?auto_19595 ) ( OBJ-AT ?auto_19598 ?auto_19595 ) ( OBJ-AT ?auto_19599 ?auto_19595 ) ( not ( = ?auto_19596 ?auto_19598 ) ) ( not ( = ?auto_19596 ?auto_19599 ) ) ( not ( = ?auto_19597 ?auto_19598 ) ) ( not ( = ?auto_19597 ?auto_19599 ) ) ( not ( = ?auto_19598 ?auto_19599 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19597 ?auto_19596 ?auto_19595 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_19692 - OBJ
      ?auto_19693 - OBJ
      ?auto_19694 - OBJ
      ?auto_19695 - OBJ
      ?auto_19691 - LOCATION
    )
    :vars
    (
      ?auto_19696 - LOCATION
      ?auto_19698 - CITY
      ?auto_19699 - OBJ
      ?auto_19697 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_19696 ?auto_19698 ) ( IN-CITY ?auto_19691 ?auto_19698 ) ( not ( = ?auto_19691 ?auto_19696 ) ) ( OBJ-AT ?auto_19699 ?auto_19691 ) ( not ( = ?auto_19699 ?auto_19692 ) ) ( OBJ-AT ?auto_19692 ?auto_19696 ) ( TRUCK-AT ?auto_19697 ?auto_19691 ) ( OBJ-AT ?auto_19693 ?auto_19691 ) ( OBJ-AT ?auto_19694 ?auto_19691 ) ( OBJ-AT ?auto_19695 ?auto_19691 ) ( not ( = ?auto_19692 ?auto_19693 ) ) ( not ( = ?auto_19692 ?auto_19694 ) ) ( not ( = ?auto_19692 ?auto_19695 ) ) ( not ( = ?auto_19693 ?auto_19694 ) ) ( not ( = ?auto_19693 ?auto_19695 ) ) ( not ( = ?auto_19693 ?auto_19699 ) ) ( not ( = ?auto_19694 ?auto_19695 ) ) ( not ( = ?auto_19694 ?auto_19699 ) ) ( not ( = ?auto_19695 ?auto_19699 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_19699 ?auto_19692 ?auto_19691 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_20618 - OBJ
      ?auto_20619 - OBJ
      ?auto_20620 - OBJ
      ?auto_20617 - LOCATION
    )
    :vars
    (
      ?auto_20622 - TRUCK
      ?auto_20621 - LOCATION
      ?auto_20623 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_20622 ?auto_20621 ) ( IN-CITY ?auto_20621 ?auto_20623 ) ( IN-CITY ?auto_20617 ?auto_20623 ) ( not ( = ?auto_20617 ?auto_20621 ) ) ( OBJ-AT ?auto_20620 ?auto_20617 ) ( not ( = ?auto_20620 ?auto_20618 ) ) ( OBJ-AT ?auto_20618 ?auto_20621 ) ( OBJ-AT ?auto_20619 ?auto_20617 ) ( not ( = ?auto_20618 ?auto_20619 ) ) ( not ( = ?auto_20619 ?auto_20620 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_20620 ?auto_20618 ?auto_20617 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_29549 - OBJ
      ?auto_29550 - OBJ
      ?auto_29551 - OBJ
      ?auto_29548 - LOCATION
    )
    :vars
    (
      ?auto_29553 - TRUCK
      ?auto_29552 - LOCATION
      ?auto_29554 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_29553 ?auto_29552 ) ( IN-CITY ?auto_29552 ?auto_29554 ) ( IN-CITY ?auto_29548 ?auto_29554 ) ( not ( = ?auto_29548 ?auto_29552 ) ) ( OBJ-AT ?auto_29550 ?auto_29548 ) ( not ( = ?auto_29550 ?auto_29551 ) ) ( OBJ-AT ?auto_29551 ?auto_29552 ) ( OBJ-AT ?auto_29549 ?auto_29548 ) ( not ( = ?auto_29549 ?auto_29550 ) ) ( not ( = ?auto_29549 ?auto_29551 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_29550 ?auto_29551 ?auto_29548 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_32861 - OBJ
      ?auto_32862 - OBJ
      ?auto_32863 - OBJ
      ?auto_32860 - LOCATION
    )
    :vars
    (
      ?auto_32865 - LOCATION
      ?auto_32864 - CITY
      ?auto_32866 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_32865 ?auto_32864 ) ( IN-CITY ?auto_32860 ?auto_32864 ) ( not ( = ?auto_32860 ?auto_32865 ) ) ( OBJ-AT ?auto_32861 ?auto_32860 ) ( not ( = ?auto_32861 ?auto_32862 ) ) ( OBJ-AT ?auto_32862 ?auto_32865 ) ( TRUCK-AT ?auto_32866 ?auto_32860 ) ( OBJ-AT ?auto_32863 ?auto_32860 ) ( not ( = ?auto_32861 ?auto_32863 ) ) ( not ( = ?auto_32862 ?auto_32863 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32861 ?auto_32862 ?auto_32860 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_34568 - OBJ
      ?auto_34567 - LOCATION
    )
    :vars
    (
      ?auto_34570 - LOCATION
      ?auto_34569 - CITY
      ?auto_34571 - OBJ
      ?auto_34572 - TRUCK
      ?auto_34573 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_34570 ?auto_34569 ) ( IN-CITY ?auto_34567 ?auto_34569 ) ( not ( = ?auto_34567 ?auto_34570 ) ) ( OBJ-AT ?auto_34571 ?auto_34567 ) ( not ( = ?auto_34571 ?auto_34568 ) ) ( OBJ-AT ?auto_34568 ?auto_34570 ) ( TRUCK-AT ?auto_34572 ?auto_34573 ) ( IN-CITY ?auto_34573 ?auto_34569 ) ( not ( = ?auto_34567 ?auto_34573 ) ) ( not ( = ?auto_34570 ?auto_34573 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_34572 ?auto_34573 ?auto_34567 ?auto_34569 )
      ( DELIVER-2PKG ?auto_34571 ?auto_34568 ?auto_34567 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_34575 - OBJ
      ?auto_34576 - OBJ
      ?auto_34574 - LOCATION
    )
    :vars
    (
      ?auto_34577 - LOCATION
      ?auto_34578 - CITY
      ?auto_34579 - TRUCK
      ?auto_34580 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_34577 ?auto_34578 ) ( IN-CITY ?auto_34574 ?auto_34578 ) ( not ( = ?auto_34574 ?auto_34577 ) ) ( OBJ-AT ?auto_34575 ?auto_34574 ) ( not ( = ?auto_34575 ?auto_34576 ) ) ( OBJ-AT ?auto_34576 ?auto_34577 ) ( TRUCK-AT ?auto_34579 ?auto_34580 ) ( IN-CITY ?auto_34580 ?auto_34578 ) ( not ( = ?auto_34574 ?auto_34580 ) ) ( not ( = ?auto_34577 ?auto_34580 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_34576 ?auto_34574 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_34593 - OBJ
      ?auto_34594 - OBJ
      ?auto_34592 - LOCATION
    )
    :vars
    (
      ?auto_34597 - LOCATION
      ?auto_34596 - CITY
      ?auto_34598 - TRUCK
      ?auto_34595 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_34597 ?auto_34596 ) ( IN-CITY ?auto_34592 ?auto_34596 ) ( not ( = ?auto_34592 ?auto_34597 ) ) ( OBJ-AT ?auto_34594 ?auto_34592 ) ( not ( = ?auto_34594 ?auto_34593 ) ) ( OBJ-AT ?auto_34593 ?auto_34597 ) ( TRUCK-AT ?auto_34598 ?auto_34595 ) ( IN-CITY ?auto_34595 ?auto_34596 ) ( not ( = ?auto_34592 ?auto_34595 ) ) ( not ( = ?auto_34597 ?auto_34595 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34594 ?auto_34593 ?auto_34592 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34619 - OBJ
      ?auto_34620 - OBJ
      ?auto_34621 - OBJ
      ?auto_34618 - LOCATION
    )
    :vars
    (
      ?auto_34624 - LOCATION
      ?auto_34623 - CITY
      ?auto_34625 - TRUCK
      ?auto_34622 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_34624 ?auto_34623 ) ( IN-CITY ?auto_34618 ?auto_34623 ) ( not ( = ?auto_34618 ?auto_34624 ) ) ( OBJ-AT ?auto_34619 ?auto_34618 ) ( not ( = ?auto_34619 ?auto_34621 ) ) ( OBJ-AT ?auto_34621 ?auto_34624 ) ( TRUCK-AT ?auto_34625 ?auto_34622 ) ( IN-CITY ?auto_34622 ?auto_34623 ) ( not ( = ?auto_34618 ?auto_34622 ) ) ( not ( = ?auto_34624 ?auto_34622 ) ) ( OBJ-AT ?auto_34620 ?auto_34618 ) ( not ( = ?auto_34619 ?auto_34620 ) ) ( not ( = ?auto_34620 ?auto_34621 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34619 ?auto_34621 ?auto_34618 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34639 - OBJ
      ?auto_34640 - OBJ
      ?auto_34641 - OBJ
      ?auto_34638 - LOCATION
    )
    :vars
    (
      ?auto_34644 - LOCATION
      ?auto_34643 - CITY
      ?auto_34645 - TRUCK
      ?auto_34642 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_34644 ?auto_34643 ) ( IN-CITY ?auto_34638 ?auto_34643 ) ( not ( = ?auto_34638 ?auto_34644 ) ) ( OBJ-AT ?auto_34639 ?auto_34638 ) ( not ( = ?auto_34639 ?auto_34640 ) ) ( OBJ-AT ?auto_34640 ?auto_34644 ) ( TRUCK-AT ?auto_34645 ?auto_34642 ) ( IN-CITY ?auto_34642 ?auto_34643 ) ( not ( = ?auto_34638 ?auto_34642 ) ) ( not ( = ?auto_34644 ?auto_34642 ) ) ( OBJ-AT ?auto_34641 ?auto_34638 ) ( not ( = ?auto_34639 ?auto_34641 ) ) ( not ( = ?auto_34640 ?auto_34641 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34639 ?auto_34640 ?auto_34638 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34671 - OBJ
      ?auto_34672 - OBJ
      ?auto_34673 - OBJ
      ?auto_34670 - LOCATION
    )
    :vars
    (
      ?auto_34676 - LOCATION
      ?auto_34675 - CITY
      ?auto_34677 - OBJ
      ?auto_34678 - TRUCK
      ?auto_34674 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_34676 ?auto_34675 ) ( IN-CITY ?auto_34670 ?auto_34675 ) ( not ( = ?auto_34670 ?auto_34676 ) ) ( OBJ-AT ?auto_34677 ?auto_34670 ) ( not ( = ?auto_34677 ?auto_34673 ) ) ( OBJ-AT ?auto_34673 ?auto_34676 ) ( TRUCK-AT ?auto_34678 ?auto_34674 ) ( IN-CITY ?auto_34674 ?auto_34675 ) ( not ( = ?auto_34670 ?auto_34674 ) ) ( not ( = ?auto_34676 ?auto_34674 ) ) ( OBJ-AT ?auto_34671 ?auto_34670 ) ( OBJ-AT ?auto_34672 ?auto_34670 ) ( not ( = ?auto_34671 ?auto_34672 ) ) ( not ( = ?auto_34671 ?auto_34673 ) ) ( not ( = ?auto_34671 ?auto_34677 ) ) ( not ( = ?auto_34672 ?auto_34673 ) ) ( not ( = ?auto_34672 ?auto_34677 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34677 ?auto_34673 ?auto_34670 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34693 - OBJ
      ?auto_34694 - OBJ
      ?auto_34695 - OBJ
      ?auto_34692 - LOCATION
    )
    :vars
    (
      ?auto_34698 - LOCATION
      ?auto_34697 - CITY
      ?auto_34699 - OBJ
      ?auto_34700 - TRUCK
      ?auto_34696 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_34698 ?auto_34697 ) ( IN-CITY ?auto_34692 ?auto_34697 ) ( not ( = ?auto_34692 ?auto_34698 ) ) ( OBJ-AT ?auto_34699 ?auto_34692 ) ( not ( = ?auto_34699 ?auto_34694 ) ) ( OBJ-AT ?auto_34694 ?auto_34698 ) ( TRUCK-AT ?auto_34700 ?auto_34696 ) ( IN-CITY ?auto_34696 ?auto_34697 ) ( not ( = ?auto_34692 ?auto_34696 ) ) ( not ( = ?auto_34698 ?auto_34696 ) ) ( OBJ-AT ?auto_34693 ?auto_34692 ) ( OBJ-AT ?auto_34695 ?auto_34692 ) ( not ( = ?auto_34693 ?auto_34694 ) ) ( not ( = ?auto_34693 ?auto_34695 ) ) ( not ( = ?auto_34693 ?auto_34699 ) ) ( not ( = ?auto_34694 ?auto_34695 ) ) ( not ( = ?auto_34695 ?auto_34699 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34699 ?auto_34694 ?auto_34692 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34781 - OBJ
      ?auto_34782 - OBJ
      ?auto_34783 - OBJ
      ?auto_34780 - LOCATION
    )
    :vars
    (
      ?auto_34786 - LOCATION
      ?auto_34785 - CITY
      ?auto_34787 - TRUCK
      ?auto_34784 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_34786 ?auto_34785 ) ( IN-CITY ?auto_34780 ?auto_34785 ) ( not ( = ?auto_34780 ?auto_34786 ) ) ( OBJ-AT ?auto_34782 ?auto_34780 ) ( not ( = ?auto_34782 ?auto_34781 ) ) ( OBJ-AT ?auto_34781 ?auto_34786 ) ( TRUCK-AT ?auto_34787 ?auto_34784 ) ( IN-CITY ?auto_34784 ?auto_34785 ) ( not ( = ?auto_34780 ?auto_34784 ) ) ( not ( = ?auto_34786 ?auto_34784 ) ) ( OBJ-AT ?auto_34783 ?auto_34780 ) ( not ( = ?auto_34781 ?auto_34783 ) ) ( not ( = ?auto_34782 ?auto_34783 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34782 ?auto_34781 ?auto_34780 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_34813 - OBJ
      ?auto_34814 - OBJ
      ?auto_34815 - OBJ
      ?auto_34812 - LOCATION
    )
    :vars
    (
      ?auto_34818 - LOCATION
      ?auto_34817 - CITY
      ?auto_34819 - OBJ
      ?auto_34820 - TRUCK
      ?auto_34816 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_34818 ?auto_34817 ) ( IN-CITY ?auto_34812 ?auto_34817 ) ( not ( = ?auto_34812 ?auto_34818 ) ) ( OBJ-AT ?auto_34819 ?auto_34812 ) ( not ( = ?auto_34819 ?auto_34813 ) ) ( OBJ-AT ?auto_34813 ?auto_34818 ) ( TRUCK-AT ?auto_34820 ?auto_34816 ) ( IN-CITY ?auto_34816 ?auto_34817 ) ( not ( = ?auto_34812 ?auto_34816 ) ) ( not ( = ?auto_34818 ?auto_34816 ) ) ( OBJ-AT ?auto_34814 ?auto_34812 ) ( OBJ-AT ?auto_34815 ?auto_34812 ) ( not ( = ?auto_34813 ?auto_34814 ) ) ( not ( = ?auto_34813 ?auto_34815 ) ) ( not ( = ?auto_34814 ?auto_34815 ) ) ( not ( = ?auto_34814 ?auto_34819 ) ) ( not ( = ?auto_34815 ?auto_34819 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34819 ?auto_34813 ?auto_34812 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_34910 - OBJ
      ?auto_34911 - OBJ
      ?auto_34912 - OBJ
      ?auto_34913 - OBJ
      ?auto_34909 - LOCATION
    )
    :vars
    (
      ?auto_34916 - LOCATION
      ?auto_34915 - CITY
      ?auto_34917 - TRUCK
      ?auto_34914 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_34916 ?auto_34915 ) ( IN-CITY ?auto_34909 ?auto_34915 ) ( not ( = ?auto_34909 ?auto_34916 ) ) ( OBJ-AT ?auto_34912 ?auto_34909 ) ( not ( = ?auto_34912 ?auto_34913 ) ) ( OBJ-AT ?auto_34913 ?auto_34916 ) ( TRUCK-AT ?auto_34917 ?auto_34914 ) ( IN-CITY ?auto_34914 ?auto_34915 ) ( not ( = ?auto_34909 ?auto_34914 ) ) ( not ( = ?auto_34916 ?auto_34914 ) ) ( OBJ-AT ?auto_34910 ?auto_34909 ) ( OBJ-AT ?auto_34911 ?auto_34909 ) ( not ( = ?auto_34910 ?auto_34911 ) ) ( not ( = ?auto_34910 ?auto_34912 ) ) ( not ( = ?auto_34910 ?auto_34913 ) ) ( not ( = ?auto_34911 ?auto_34912 ) ) ( not ( = ?auto_34911 ?auto_34913 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34912 ?auto_34913 ?auto_34909 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_34919 - OBJ
      ?auto_34920 - OBJ
      ?auto_34921 - OBJ
      ?auto_34922 - OBJ
      ?auto_34918 - LOCATION
    )
    :vars
    (
      ?auto_34925 - LOCATION
      ?auto_34924 - CITY
      ?auto_34926 - TRUCK
      ?auto_34923 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_34925 ?auto_34924 ) ( IN-CITY ?auto_34918 ?auto_34924 ) ( not ( = ?auto_34918 ?auto_34925 ) ) ( OBJ-AT ?auto_34919 ?auto_34918 ) ( not ( = ?auto_34919 ?auto_34922 ) ) ( OBJ-AT ?auto_34922 ?auto_34925 ) ( TRUCK-AT ?auto_34926 ?auto_34923 ) ( IN-CITY ?auto_34923 ?auto_34924 ) ( not ( = ?auto_34918 ?auto_34923 ) ) ( not ( = ?auto_34925 ?auto_34923 ) ) ( OBJ-AT ?auto_34920 ?auto_34918 ) ( OBJ-AT ?auto_34921 ?auto_34918 ) ( not ( = ?auto_34919 ?auto_34920 ) ) ( not ( = ?auto_34919 ?auto_34921 ) ) ( not ( = ?auto_34920 ?auto_34921 ) ) ( not ( = ?auto_34920 ?auto_34922 ) ) ( not ( = ?auto_34921 ?auto_34922 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34919 ?auto_34922 ?auto_34918 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_34937 - OBJ
      ?auto_34938 - OBJ
      ?auto_34939 - OBJ
      ?auto_34940 - OBJ
      ?auto_34936 - LOCATION
    )
    :vars
    (
      ?auto_34943 - LOCATION
      ?auto_34942 - CITY
      ?auto_34944 - TRUCK
      ?auto_34941 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_34943 ?auto_34942 ) ( IN-CITY ?auto_34936 ?auto_34942 ) ( not ( = ?auto_34936 ?auto_34943 ) ) ( OBJ-AT ?auto_34940 ?auto_34936 ) ( not ( = ?auto_34940 ?auto_34939 ) ) ( OBJ-AT ?auto_34939 ?auto_34943 ) ( TRUCK-AT ?auto_34944 ?auto_34941 ) ( IN-CITY ?auto_34941 ?auto_34942 ) ( not ( = ?auto_34936 ?auto_34941 ) ) ( not ( = ?auto_34943 ?auto_34941 ) ) ( OBJ-AT ?auto_34937 ?auto_34936 ) ( OBJ-AT ?auto_34938 ?auto_34936 ) ( not ( = ?auto_34937 ?auto_34938 ) ) ( not ( = ?auto_34937 ?auto_34939 ) ) ( not ( = ?auto_34937 ?auto_34940 ) ) ( not ( = ?auto_34938 ?auto_34939 ) ) ( not ( = ?auto_34938 ?auto_34940 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34940 ?auto_34939 ?auto_34936 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_34946 - OBJ
      ?auto_34947 - OBJ
      ?auto_34948 - OBJ
      ?auto_34949 - OBJ
      ?auto_34945 - LOCATION
    )
    :vars
    (
      ?auto_34952 - LOCATION
      ?auto_34951 - CITY
      ?auto_34953 - TRUCK
      ?auto_34950 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_34952 ?auto_34951 ) ( IN-CITY ?auto_34945 ?auto_34951 ) ( not ( = ?auto_34945 ?auto_34952 ) ) ( OBJ-AT ?auto_34946 ?auto_34945 ) ( not ( = ?auto_34946 ?auto_34948 ) ) ( OBJ-AT ?auto_34948 ?auto_34952 ) ( TRUCK-AT ?auto_34953 ?auto_34950 ) ( IN-CITY ?auto_34950 ?auto_34951 ) ( not ( = ?auto_34945 ?auto_34950 ) ) ( not ( = ?auto_34952 ?auto_34950 ) ) ( OBJ-AT ?auto_34947 ?auto_34945 ) ( OBJ-AT ?auto_34949 ?auto_34945 ) ( not ( = ?auto_34946 ?auto_34947 ) ) ( not ( = ?auto_34946 ?auto_34949 ) ) ( not ( = ?auto_34947 ?auto_34948 ) ) ( not ( = ?auto_34947 ?auto_34949 ) ) ( not ( = ?auto_34948 ?auto_34949 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_34946 ?auto_34948 ?auto_34945 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35099 - OBJ
      ?auto_35100 - OBJ
      ?auto_35101 - OBJ
      ?auto_35102 - OBJ
      ?auto_35098 - LOCATION
    )
    :vars
    (
      ?auto_35105 - LOCATION
      ?auto_35104 - CITY
      ?auto_35106 - TRUCK
      ?auto_35103 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_35105 ?auto_35104 ) ( IN-CITY ?auto_35098 ?auto_35104 ) ( not ( = ?auto_35098 ?auto_35105 ) ) ( OBJ-AT ?auto_35099 ?auto_35098 ) ( not ( = ?auto_35099 ?auto_35100 ) ) ( OBJ-AT ?auto_35100 ?auto_35105 ) ( TRUCK-AT ?auto_35106 ?auto_35103 ) ( IN-CITY ?auto_35103 ?auto_35104 ) ( not ( = ?auto_35098 ?auto_35103 ) ) ( not ( = ?auto_35105 ?auto_35103 ) ) ( OBJ-AT ?auto_35101 ?auto_35098 ) ( OBJ-AT ?auto_35102 ?auto_35098 ) ( not ( = ?auto_35099 ?auto_35101 ) ) ( not ( = ?auto_35099 ?auto_35102 ) ) ( not ( = ?auto_35100 ?auto_35101 ) ) ( not ( = ?auto_35100 ?auto_35102 ) ) ( not ( = ?auto_35101 ?auto_35102 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35099 ?auto_35100 ?auto_35098 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35108 - OBJ
      ?auto_35109 - OBJ
      ?auto_35110 - OBJ
      ?auto_35111 - OBJ
      ?auto_35107 - LOCATION
    )
    :vars
    (
      ?auto_35114 - LOCATION
      ?auto_35113 - CITY
      ?auto_35115 - TRUCK
      ?auto_35112 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_35114 ?auto_35113 ) ( IN-CITY ?auto_35107 ?auto_35113 ) ( not ( = ?auto_35107 ?auto_35114 ) ) ( OBJ-AT ?auto_35110 ?auto_35107 ) ( not ( = ?auto_35110 ?auto_35109 ) ) ( OBJ-AT ?auto_35109 ?auto_35114 ) ( TRUCK-AT ?auto_35115 ?auto_35112 ) ( IN-CITY ?auto_35112 ?auto_35113 ) ( not ( = ?auto_35107 ?auto_35112 ) ) ( not ( = ?auto_35114 ?auto_35112 ) ) ( OBJ-AT ?auto_35108 ?auto_35107 ) ( OBJ-AT ?auto_35111 ?auto_35107 ) ( not ( = ?auto_35108 ?auto_35109 ) ) ( not ( = ?auto_35108 ?auto_35110 ) ) ( not ( = ?auto_35108 ?auto_35111 ) ) ( not ( = ?auto_35109 ?auto_35111 ) ) ( not ( = ?auto_35110 ?auto_35111 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35110 ?auto_35109 ?auto_35107 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35135 - OBJ
      ?auto_35136 - OBJ
      ?auto_35137 - OBJ
      ?auto_35138 - OBJ
      ?auto_35134 - LOCATION
    )
    :vars
    (
      ?auto_35141 - LOCATION
      ?auto_35140 - CITY
      ?auto_35142 - TRUCK
      ?auto_35139 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_35141 ?auto_35140 ) ( IN-CITY ?auto_35134 ?auto_35140 ) ( not ( = ?auto_35134 ?auto_35141 ) ) ( OBJ-AT ?auto_35138 ?auto_35134 ) ( not ( = ?auto_35138 ?auto_35136 ) ) ( OBJ-AT ?auto_35136 ?auto_35141 ) ( TRUCK-AT ?auto_35142 ?auto_35139 ) ( IN-CITY ?auto_35139 ?auto_35140 ) ( not ( = ?auto_35134 ?auto_35139 ) ) ( not ( = ?auto_35141 ?auto_35139 ) ) ( OBJ-AT ?auto_35135 ?auto_35134 ) ( OBJ-AT ?auto_35137 ?auto_35134 ) ( not ( = ?auto_35135 ?auto_35136 ) ) ( not ( = ?auto_35135 ?auto_35137 ) ) ( not ( = ?auto_35135 ?auto_35138 ) ) ( not ( = ?auto_35136 ?auto_35137 ) ) ( not ( = ?auto_35137 ?auto_35138 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35138 ?auto_35136 ?auto_35134 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35252 - OBJ
      ?auto_35253 - OBJ
      ?auto_35254 - OBJ
      ?auto_35255 - OBJ
      ?auto_35251 - LOCATION
    )
    :vars
    (
      ?auto_35258 - LOCATION
      ?auto_35257 - CITY
      ?auto_35259 - TRUCK
      ?auto_35256 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_35258 ?auto_35257 ) ( IN-CITY ?auto_35251 ?auto_35257 ) ( not ( = ?auto_35251 ?auto_35258 ) ) ( OBJ-AT ?auto_35253 ?auto_35251 ) ( not ( = ?auto_35253 ?auto_35255 ) ) ( OBJ-AT ?auto_35255 ?auto_35258 ) ( TRUCK-AT ?auto_35259 ?auto_35256 ) ( IN-CITY ?auto_35256 ?auto_35257 ) ( not ( = ?auto_35251 ?auto_35256 ) ) ( not ( = ?auto_35258 ?auto_35256 ) ) ( OBJ-AT ?auto_35252 ?auto_35251 ) ( OBJ-AT ?auto_35254 ?auto_35251 ) ( not ( = ?auto_35252 ?auto_35253 ) ) ( not ( = ?auto_35252 ?auto_35254 ) ) ( not ( = ?auto_35252 ?auto_35255 ) ) ( not ( = ?auto_35253 ?auto_35254 ) ) ( not ( = ?auto_35254 ?auto_35255 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35253 ?auto_35255 ?auto_35251 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35279 - OBJ
      ?auto_35280 - OBJ
      ?auto_35281 - OBJ
      ?auto_35282 - OBJ
      ?auto_35278 - LOCATION
    )
    :vars
    (
      ?auto_35285 - LOCATION
      ?auto_35284 - CITY
      ?auto_35286 - TRUCK
      ?auto_35283 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_35285 ?auto_35284 ) ( IN-CITY ?auto_35278 ?auto_35284 ) ( not ( = ?auto_35278 ?auto_35285 ) ) ( OBJ-AT ?auto_35280 ?auto_35278 ) ( not ( = ?auto_35280 ?auto_35281 ) ) ( OBJ-AT ?auto_35281 ?auto_35285 ) ( TRUCK-AT ?auto_35286 ?auto_35283 ) ( IN-CITY ?auto_35283 ?auto_35284 ) ( not ( = ?auto_35278 ?auto_35283 ) ) ( not ( = ?auto_35285 ?auto_35283 ) ) ( OBJ-AT ?auto_35279 ?auto_35278 ) ( OBJ-AT ?auto_35282 ?auto_35278 ) ( not ( = ?auto_35279 ?auto_35280 ) ) ( not ( = ?auto_35279 ?auto_35281 ) ) ( not ( = ?auto_35279 ?auto_35282 ) ) ( not ( = ?auto_35280 ?auto_35282 ) ) ( not ( = ?auto_35281 ?auto_35282 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35280 ?auto_35281 ?auto_35278 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35315 - OBJ
      ?auto_35316 - OBJ
      ?auto_35317 - OBJ
      ?auto_35318 - OBJ
      ?auto_35314 - LOCATION
    )
    :vars
    (
      ?auto_35321 - LOCATION
      ?auto_35320 - CITY
      ?auto_35322 - OBJ
      ?auto_35323 - TRUCK
      ?auto_35319 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_35321 ?auto_35320 ) ( IN-CITY ?auto_35314 ?auto_35320 ) ( not ( = ?auto_35314 ?auto_35321 ) ) ( OBJ-AT ?auto_35322 ?auto_35314 ) ( not ( = ?auto_35322 ?auto_35318 ) ) ( OBJ-AT ?auto_35318 ?auto_35321 ) ( TRUCK-AT ?auto_35323 ?auto_35319 ) ( IN-CITY ?auto_35319 ?auto_35320 ) ( not ( = ?auto_35314 ?auto_35319 ) ) ( not ( = ?auto_35321 ?auto_35319 ) ) ( OBJ-AT ?auto_35315 ?auto_35314 ) ( OBJ-AT ?auto_35316 ?auto_35314 ) ( OBJ-AT ?auto_35317 ?auto_35314 ) ( not ( = ?auto_35315 ?auto_35316 ) ) ( not ( = ?auto_35315 ?auto_35317 ) ) ( not ( = ?auto_35315 ?auto_35318 ) ) ( not ( = ?auto_35315 ?auto_35322 ) ) ( not ( = ?auto_35316 ?auto_35317 ) ) ( not ( = ?auto_35316 ?auto_35318 ) ) ( not ( = ?auto_35316 ?auto_35322 ) ) ( not ( = ?auto_35317 ?auto_35318 ) ) ( not ( = ?auto_35317 ?auto_35322 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35322 ?auto_35318 ?auto_35314 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35344 - OBJ
      ?auto_35345 - OBJ
      ?auto_35346 - OBJ
      ?auto_35347 - OBJ
      ?auto_35343 - LOCATION
    )
    :vars
    (
      ?auto_35350 - LOCATION
      ?auto_35349 - CITY
      ?auto_35351 - OBJ
      ?auto_35352 - TRUCK
      ?auto_35348 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_35350 ?auto_35349 ) ( IN-CITY ?auto_35343 ?auto_35349 ) ( not ( = ?auto_35343 ?auto_35350 ) ) ( OBJ-AT ?auto_35351 ?auto_35343 ) ( not ( = ?auto_35351 ?auto_35346 ) ) ( OBJ-AT ?auto_35346 ?auto_35350 ) ( TRUCK-AT ?auto_35352 ?auto_35348 ) ( IN-CITY ?auto_35348 ?auto_35349 ) ( not ( = ?auto_35343 ?auto_35348 ) ) ( not ( = ?auto_35350 ?auto_35348 ) ) ( OBJ-AT ?auto_35344 ?auto_35343 ) ( OBJ-AT ?auto_35345 ?auto_35343 ) ( OBJ-AT ?auto_35347 ?auto_35343 ) ( not ( = ?auto_35344 ?auto_35345 ) ) ( not ( = ?auto_35344 ?auto_35346 ) ) ( not ( = ?auto_35344 ?auto_35347 ) ) ( not ( = ?auto_35344 ?auto_35351 ) ) ( not ( = ?auto_35345 ?auto_35346 ) ) ( not ( = ?auto_35345 ?auto_35347 ) ) ( not ( = ?auto_35345 ?auto_35351 ) ) ( not ( = ?auto_35346 ?auto_35347 ) ) ( not ( = ?auto_35347 ?auto_35351 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35351 ?auto_35346 ?auto_35343 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35487 - OBJ
      ?auto_35488 - OBJ
      ?auto_35489 - OBJ
      ?auto_35490 - OBJ
      ?auto_35486 - LOCATION
    )
    :vars
    (
      ?auto_35493 - LOCATION
      ?auto_35492 - CITY
      ?auto_35494 - OBJ
      ?auto_35495 - TRUCK
      ?auto_35491 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_35493 ?auto_35492 ) ( IN-CITY ?auto_35486 ?auto_35492 ) ( not ( = ?auto_35486 ?auto_35493 ) ) ( OBJ-AT ?auto_35494 ?auto_35486 ) ( not ( = ?auto_35494 ?auto_35488 ) ) ( OBJ-AT ?auto_35488 ?auto_35493 ) ( TRUCK-AT ?auto_35495 ?auto_35491 ) ( IN-CITY ?auto_35491 ?auto_35492 ) ( not ( = ?auto_35486 ?auto_35491 ) ) ( not ( = ?auto_35493 ?auto_35491 ) ) ( OBJ-AT ?auto_35487 ?auto_35486 ) ( OBJ-AT ?auto_35489 ?auto_35486 ) ( OBJ-AT ?auto_35490 ?auto_35486 ) ( not ( = ?auto_35487 ?auto_35488 ) ) ( not ( = ?auto_35487 ?auto_35489 ) ) ( not ( = ?auto_35487 ?auto_35490 ) ) ( not ( = ?auto_35487 ?auto_35494 ) ) ( not ( = ?auto_35488 ?auto_35489 ) ) ( not ( = ?auto_35488 ?auto_35490 ) ) ( not ( = ?auto_35489 ?auto_35490 ) ) ( not ( = ?auto_35489 ?auto_35494 ) ) ( not ( = ?auto_35490 ?auto_35494 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35494 ?auto_35488 ?auto_35486 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35947 - OBJ
      ?auto_35948 - OBJ
      ?auto_35949 - OBJ
      ?auto_35950 - OBJ
      ?auto_35946 - LOCATION
    )
    :vars
    (
      ?auto_35953 - LOCATION
      ?auto_35952 - CITY
      ?auto_35954 - TRUCK
      ?auto_35951 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_35953 ?auto_35952 ) ( IN-CITY ?auto_35946 ?auto_35952 ) ( not ( = ?auto_35946 ?auto_35953 ) ) ( OBJ-AT ?auto_35949 ?auto_35946 ) ( not ( = ?auto_35949 ?auto_35947 ) ) ( OBJ-AT ?auto_35947 ?auto_35953 ) ( TRUCK-AT ?auto_35954 ?auto_35951 ) ( IN-CITY ?auto_35951 ?auto_35952 ) ( not ( = ?auto_35946 ?auto_35951 ) ) ( not ( = ?auto_35953 ?auto_35951 ) ) ( OBJ-AT ?auto_35948 ?auto_35946 ) ( OBJ-AT ?auto_35950 ?auto_35946 ) ( not ( = ?auto_35947 ?auto_35948 ) ) ( not ( = ?auto_35947 ?auto_35950 ) ) ( not ( = ?auto_35948 ?auto_35949 ) ) ( not ( = ?auto_35948 ?auto_35950 ) ) ( not ( = ?auto_35949 ?auto_35950 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35949 ?auto_35947 ?auto_35946 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_35983 - OBJ
      ?auto_35984 - OBJ
      ?auto_35985 - OBJ
      ?auto_35986 - OBJ
      ?auto_35982 - LOCATION
    )
    :vars
    (
      ?auto_35989 - LOCATION
      ?auto_35988 - CITY
      ?auto_35990 - TRUCK
      ?auto_35987 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_35989 ?auto_35988 ) ( IN-CITY ?auto_35982 ?auto_35988 ) ( not ( = ?auto_35982 ?auto_35989 ) ) ( OBJ-AT ?auto_35984 ?auto_35982 ) ( not ( = ?auto_35984 ?auto_35983 ) ) ( OBJ-AT ?auto_35983 ?auto_35989 ) ( TRUCK-AT ?auto_35990 ?auto_35987 ) ( IN-CITY ?auto_35987 ?auto_35988 ) ( not ( = ?auto_35982 ?auto_35987 ) ) ( not ( = ?auto_35989 ?auto_35987 ) ) ( OBJ-AT ?auto_35985 ?auto_35982 ) ( OBJ-AT ?auto_35986 ?auto_35982 ) ( not ( = ?auto_35983 ?auto_35985 ) ) ( not ( = ?auto_35983 ?auto_35986 ) ) ( not ( = ?auto_35984 ?auto_35985 ) ) ( not ( = ?auto_35984 ?auto_35986 ) ) ( not ( = ?auto_35985 ?auto_35986 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_35984 ?auto_35983 ?auto_35982 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_36091 - OBJ
      ?auto_36092 - OBJ
      ?auto_36093 - OBJ
      ?auto_36094 - OBJ
      ?auto_36090 - LOCATION
    )
    :vars
    (
      ?auto_36097 - LOCATION
      ?auto_36096 - CITY
      ?auto_36098 - TRUCK
      ?auto_36095 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_36097 ?auto_36096 ) ( IN-CITY ?auto_36090 ?auto_36096 ) ( not ( = ?auto_36090 ?auto_36097 ) ) ( OBJ-AT ?auto_36094 ?auto_36090 ) ( not ( = ?auto_36094 ?auto_36091 ) ) ( OBJ-AT ?auto_36091 ?auto_36097 ) ( TRUCK-AT ?auto_36098 ?auto_36095 ) ( IN-CITY ?auto_36095 ?auto_36096 ) ( not ( = ?auto_36090 ?auto_36095 ) ) ( not ( = ?auto_36097 ?auto_36095 ) ) ( OBJ-AT ?auto_36092 ?auto_36090 ) ( OBJ-AT ?auto_36093 ?auto_36090 ) ( not ( = ?auto_36091 ?auto_36092 ) ) ( not ( = ?auto_36091 ?auto_36093 ) ) ( not ( = ?auto_36092 ?auto_36093 ) ) ( not ( = ?auto_36092 ?auto_36094 ) ) ( not ( = ?auto_36093 ?auto_36094 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36094 ?auto_36091 ?auto_36090 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_36136 - OBJ
      ?auto_36137 - OBJ
      ?auto_36138 - OBJ
      ?auto_36139 - OBJ
      ?auto_36135 - LOCATION
    )
    :vars
    (
      ?auto_36142 - LOCATION
      ?auto_36141 - CITY
      ?auto_36143 - OBJ
      ?auto_36144 - TRUCK
      ?auto_36140 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_36142 ?auto_36141 ) ( IN-CITY ?auto_36135 ?auto_36141 ) ( not ( = ?auto_36135 ?auto_36142 ) ) ( OBJ-AT ?auto_36143 ?auto_36135 ) ( not ( = ?auto_36143 ?auto_36136 ) ) ( OBJ-AT ?auto_36136 ?auto_36142 ) ( TRUCK-AT ?auto_36144 ?auto_36140 ) ( IN-CITY ?auto_36140 ?auto_36141 ) ( not ( = ?auto_36135 ?auto_36140 ) ) ( not ( = ?auto_36142 ?auto_36140 ) ) ( OBJ-AT ?auto_36137 ?auto_36135 ) ( OBJ-AT ?auto_36138 ?auto_36135 ) ( OBJ-AT ?auto_36139 ?auto_36135 ) ( not ( = ?auto_36136 ?auto_36137 ) ) ( not ( = ?auto_36136 ?auto_36138 ) ) ( not ( = ?auto_36136 ?auto_36139 ) ) ( not ( = ?auto_36137 ?auto_36138 ) ) ( not ( = ?auto_36137 ?auto_36139 ) ) ( not ( = ?auto_36137 ?auto_36143 ) ) ( not ( = ?auto_36138 ?auto_36139 ) ) ( not ( = ?auto_36138 ?auto_36143 ) ) ( not ( = ?auto_36139 ?auto_36143 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36143 ?auto_36136 ?auto_36135 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_36608 - OBJ
      ?auto_36609 - OBJ
      ?auto_36610 - OBJ
      ?auto_36607 - LOCATION
    )
    :vars
    (
      ?auto_36612 - LOCATION
      ?auto_36614 - CITY
      ?auto_36613 - TRUCK
      ?auto_36611 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_36612 ?auto_36614 ) ( IN-CITY ?auto_36607 ?auto_36614 ) ( not ( = ?auto_36607 ?auto_36612 ) ) ( OBJ-AT ?auto_36610 ?auto_36607 ) ( not ( = ?auto_36610 ?auto_36609 ) ) ( OBJ-AT ?auto_36609 ?auto_36612 ) ( TRUCK-AT ?auto_36613 ?auto_36611 ) ( IN-CITY ?auto_36611 ?auto_36614 ) ( not ( = ?auto_36607 ?auto_36611 ) ) ( not ( = ?auto_36612 ?auto_36611 ) ) ( OBJ-AT ?auto_36608 ?auto_36607 ) ( not ( = ?auto_36608 ?auto_36609 ) ) ( not ( = ?auto_36608 ?auto_36610 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_36610 ?auto_36609 ?auto_36607 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_42291 - OBJ
      ?auto_42292 - OBJ
      ?auto_42293 - OBJ
      ?auto_42290 - LOCATION
    )
    :vars
    (
      ?auto_42297 - LOCATION
      ?auto_42296 - CITY
      ?auto_42295 - TRUCK
      ?auto_42294 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_42297 ?auto_42296 ) ( IN-CITY ?auto_42290 ?auto_42296 ) ( not ( = ?auto_42290 ?auto_42297 ) ) ( OBJ-AT ?auto_42293 ?auto_42290 ) ( not ( = ?auto_42293 ?auto_42291 ) ) ( OBJ-AT ?auto_42291 ?auto_42297 ) ( TRUCK-AT ?auto_42295 ?auto_42294 ) ( IN-CITY ?auto_42294 ?auto_42296 ) ( not ( = ?auto_42290 ?auto_42294 ) ) ( not ( = ?auto_42297 ?auto_42294 ) ) ( OBJ-AT ?auto_42292 ?auto_42290 ) ( not ( = ?auto_42291 ?auto_42292 ) ) ( not ( = ?auto_42292 ?auto_42293 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_42293 ?auto_42291 ?auto_42290 ) )
  )

)

