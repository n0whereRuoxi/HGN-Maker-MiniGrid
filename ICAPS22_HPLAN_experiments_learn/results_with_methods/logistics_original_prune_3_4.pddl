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
      ?auto_12246 - OBJ
      ?auto_12245 - LOCATION
    )
    :vars
    (
      ?auto_12247 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12247 ?auto_12245 ) ( IN-TRUCK ?auto_12246 ?auto_12247 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_12246 ?auto_12247 ?auto_12245 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12258 - OBJ
      ?auto_12257 - LOCATION
    )
    :vars
    (
      ?auto_12259 - TRUCK
      ?auto_12260 - LOCATION
      ?auto_12261 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12258 ?auto_12259 ) ( TRUCK-AT ?auto_12259 ?auto_12260 ) ( IN-CITY ?auto_12260 ?auto_12261 ) ( IN-CITY ?auto_12257 ?auto_12261 ) ( not ( = ?auto_12257 ?auto_12260 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12259 ?auto_12260 ?auto_12257 ?auto_12261 )
      ( DELIVER-1PKG ?auto_12258 ?auto_12257 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12276 - OBJ
      ?auto_12275 - LOCATION
    )
    :vars
    (
      ?auto_12278 - TRUCK
      ?auto_12279 - LOCATION
      ?auto_12277 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12278 ?auto_12279 ) ( IN-CITY ?auto_12279 ?auto_12277 ) ( IN-CITY ?auto_12275 ?auto_12277 ) ( not ( = ?auto_12275 ?auto_12279 ) ) ( OBJ-AT ?auto_12276 ?auto_12279 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12276 ?auto_12278 ?auto_12279 )
      ( DELIVER-1PKG ?auto_12276 ?auto_12275 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12294 - OBJ
      ?auto_12293 - LOCATION
    )
    :vars
    (
      ?auto_12295 - LOCATION
      ?auto_12297 - CITY
      ?auto_12296 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12295 ?auto_12297 ) ( IN-CITY ?auto_12293 ?auto_12297 ) ( not ( = ?auto_12293 ?auto_12295 ) ) ( OBJ-AT ?auto_12294 ?auto_12295 ) ( TRUCK-AT ?auto_12296 ?auto_12293 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12296 ?auto_12293 ?auto_12295 ?auto_12297 )
      ( DELIVER-1PKG ?auto_12294 ?auto_12293 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12354 - OBJ
      ?auto_12355 - OBJ
      ?auto_12353 - LOCATION
    )
    :vars
    (
      ?auto_12356 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12356 ?auto_12353 ) ( IN-TRUCK ?auto_12355 ?auto_12356 ) ( OBJ-AT ?auto_12354 ?auto_12353 ) ( not ( = ?auto_12354 ?auto_12355 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12355 ?auto_12353 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12358 - OBJ
      ?auto_12359 - OBJ
      ?auto_12357 - LOCATION
    )
    :vars
    (
      ?auto_12360 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12360 ?auto_12357 ) ( IN-TRUCK ?auto_12358 ?auto_12360 ) ( OBJ-AT ?auto_12359 ?auto_12357 ) ( not ( = ?auto_12358 ?auto_12359 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12358 ?auto_12357 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12366 - OBJ
      ?auto_12367 - OBJ
      ?auto_12368 - OBJ
      ?auto_12365 - LOCATION
    )
    :vars
    (
      ?auto_12369 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12369 ?auto_12365 ) ( IN-TRUCK ?auto_12368 ?auto_12369 ) ( OBJ-AT ?auto_12366 ?auto_12365 ) ( OBJ-AT ?auto_12367 ?auto_12365 ) ( not ( = ?auto_12366 ?auto_12367 ) ) ( not ( = ?auto_12366 ?auto_12368 ) ) ( not ( = ?auto_12367 ?auto_12368 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12368 ?auto_12365 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12371 - OBJ
      ?auto_12372 - OBJ
      ?auto_12373 - OBJ
      ?auto_12370 - LOCATION
    )
    :vars
    (
      ?auto_12374 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12374 ?auto_12370 ) ( IN-TRUCK ?auto_12372 ?auto_12374 ) ( OBJ-AT ?auto_12371 ?auto_12370 ) ( OBJ-AT ?auto_12373 ?auto_12370 ) ( not ( = ?auto_12371 ?auto_12372 ) ) ( not ( = ?auto_12371 ?auto_12373 ) ) ( not ( = ?auto_12372 ?auto_12373 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12372 ?auto_12370 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12381 - OBJ
      ?auto_12382 - OBJ
      ?auto_12383 - OBJ
      ?auto_12380 - LOCATION
    )
    :vars
    (
      ?auto_12384 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12384 ?auto_12380 ) ( IN-TRUCK ?auto_12381 ?auto_12384 ) ( OBJ-AT ?auto_12382 ?auto_12380 ) ( OBJ-AT ?auto_12383 ?auto_12380 ) ( not ( = ?auto_12381 ?auto_12382 ) ) ( not ( = ?auto_12381 ?auto_12383 ) ) ( not ( = ?auto_12382 ?auto_12383 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12381 ?auto_12380 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12406 - OBJ
      ?auto_12407 - OBJ
      ?auto_12405 - LOCATION
    )
    :vars
    (
      ?auto_12410 - TRUCK
      ?auto_12409 - LOCATION
      ?auto_12408 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12407 ?auto_12410 ) ( TRUCK-AT ?auto_12410 ?auto_12409 ) ( IN-CITY ?auto_12409 ?auto_12408 ) ( IN-CITY ?auto_12405 ?auto_12408 ) ( not ( = ?auto_12405 ?auto_12409 ) ) ( OBJ-AT ?auto_12406 ?auto_12405 ) ( not ( = ?auto_12406 ?auto_12407 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12407 ?auto_12405 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12412 - OBJ
      ?auto_12413 - OBJ
      ?auto_12411 - LOCATION
    )
    :vars
    (
      ?auto_12416 - TRUCK
      ?auto_12414 - LOCATION
      ?auto_12415 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12412 ?auto_12416 ) ( TRUCK-AT ?auto_12416 ?auto_12414 ) ( IN-CITY ?auto_12414 ?auto_12415 ) ( IN-CITY ?auto_12411 ?auto_12415 ) ( not ( = ?auto_12411 ?auto_12414 ) ) ( OBJ-AT ?auto_12413 ?auto_12411 ) ( not ( = ?auto_12413 ?auto_12412 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12413 ?auto_12412 ?auto_12411 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12425 - OBJ
      ?auto_12426 - OBJ
      ?auto_12427 - OBJ
      ?auto_12424 - LOCATION
    )
    :vars
    (
      ?auto_12430 - TRUCK
      ?auto_12428 - LOCATION
      ?auto_12429 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12427 ?auto_12430 ) ( TRUCK-AT ?auto_12430 ?auto_12428 ) ( IN-CITY ?auto_12428 ?auto_12429 ) ( IN-CITY ?auto_12424 ?auto_12429 ) ( not ( = ?auto_12424 ?auto_12428 ) ) ( OBJ-AT ?auto_12426 ?auto_12424 ) ( not ( = ?auto_12426 ?auto_12427 ) ) ( OBJ-AT ?auto_12425 ?auto_12424 ) ( not ( = ?auto_12425 ?auto_12426 ) ) ( not ( = ?auto_12425 ?auto_12427 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12426 ?auto_12427 ?auto_12424 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12432 - OBJ
      ?auto_12433 - OBJ
      ?auto_12434 - OBJ
      ?auto_12431 - LOCATION
    )
    :vars
    (
      ?auto_12437 - TRUCK
      ?auto_12435 - LOCATION
      ?auto_12436 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12433 ?auto_12437 ) ( TRUCK-AT ?auto_12437 ?auto_12435 ) ( IN-CITY ?auto_12435 ?auto_12436 ) ( IN-CITY ?auto_12431 ?auto_12436 ) ( not ( = ?auto_12431 ?auto_12435 ) ) ( OBJ-AT ?auto_12432 ?auto_12431 ) ( not ( = ?auto_12432 ?auto_12433 ) ) ( OBJ-AT ?auto_12434 ?auto_12431 ) ( not ( = ?auto_12432 ?auto_12434 ) ) ( not ( = ?auto_12433 ?auto_12434 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12432 ?auto_12433 ?auto_12431 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12446 - OBJ
      ?auto_12447 - OBJ
      ?auto_12448 - OBJ
      ?auto_12445 - LOCATION
    )
    :vars
    (
      ?auto_12451 - TRUCK
      ?auto_12449 - LOCATION
      ?auto_12450 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12446 ?auto_12451 ) ( TRUCK-AT ?auto_12451 ?auto_12449 ) ( IN-CITY ?auto_12449 ?auto_12450 ) ( IN-CITY ?auto_12445 ?auto_12450 ) ( not ( = ?auto_12445 ?auto_12449 ) ) ( OBJ-AT ?auto_12448 ?auto_12445 ) ( not ( = ?auto_12448 ?auto_12446 ) ) ( OBJ-AT ?auto_12447 ?auto_12445 ) ( not ( = ?auto_12446 ?auto_12447 ) ) ( not ( = ?auto_12447 ?auto_12448 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12448 ?auto_12446 ?auto_12445 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12475 - OBJ
      ?auto_12474 - LOCATION
    )
    :vars
    (
      ?auto_12479 - TRUCK
      ?auto_12476 - LOCATION
      ?auto_12478 - CITY
      ?auto_12477 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12479 ?auto_12476 ) ( IN-CITY ?auto_12476 ?auto_12478 ) ( IN-CITY ?auto_12474 ?auto_12478 ) ( not ( = ?auto_12474 ?auto_12476 ) ) ( OBJ-AT ?auto_12477 ?auto_12474 ) ( not ( = ?auto_12477 ?auto_12475 ) ) ( OBJ-AT ?auto_12475 ?auto_12476 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12475 ?auto_12479 ?auto_12476 )
      ( DELIVER-2PKG ?auto_12477 ?auto_12475 ?auto_12474 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12481 - OBJ
      ?auto_12482 - OBJ
      ?auto_12480 - LOCATION
    )
    :vars
    (
      ?auto_12485 - TRUCK
      ?auto_12484 - LOCATION
      ?auto_12483 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12485 ?auto_12484 ) ( IN-CITY ?auto_12484 ?auto_12483 ) ( IN-CITY ?auto_12480 ?auto_12483 ) ( not ( = ?auto_12480 ?auto_12484 ) ) ( OBJ-AT ?auto_12481 ?auto_12480 ) ( not ( = ?auto_12481 ?auto_12482 ) ) ( OBJ-AT ?auto_12482 ?auto_12484 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12482 ?auto_12480 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12487 - OBJ
      ?auto_12488 - OBJ
      ?auto_12486 - LOCATION
    )
    :vars
    (
      ?auto_12490 - TRUCK
      ?auto_12489 - LOCATION
      ?auto_12491 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12490 ?auto_12489 ) ( IN-CITY ?auto_12489 ?auto_12491 ) ( IN-CITY ?auto_12486 ?auto_12491 ) ( not ( = ?auto_12486 ?auto_12489 ) ) ( OBJ-AT ?auto_12488 ?auto_12486 ) ( not ( = ?auto_12488 ?auto_12487 ) ) ( OBJ-AT ?auto_12487 ?auto_12489 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12488 ?auto_12487 ?auto_12486 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12500 - OBJ
      ?auto_12501 - OBJ
      ?auto_12502 - OBJ
      ?auto_12499 - LOCATION
    )
    :vars
    (
      ?auto_12504 - TRUCK
      ?auto_12503 - LOCATION
      ?auto_12505 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12504 ?auto_12503 ) ( IN-CITY ?auto_12503 ?auto_12505 ) ( IN-CITY ?auto_12499 ?auto_12505 ) ( not ( = ?auto_12499 ?auto_12503 ) ) ( OBJ-AT ?auto_12501 ?auto_12499 ) ( not ( = ?auto_12501 ?auto_12502 ) ) ( OBJ-AT ?auto_12502 ?auto_12503 ) ( OBJ-AT ?auto_12500 ?auto_12499 ) ( not ( = ?auto_12500 ?auto_12501 ) ) ( not ( = ?auto_12500 ?auto_12502 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12501 ?auto_12502 ?auto_12499 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12507 - OBJ
      ?auto_12508 - OBJ
      ?auto_12509 - OBJ
      ?auto_12506 - LOCATION
    )
    :vars
    (
      ?auto_12511 - TRUCK
      ?auto_12510 - LOCATION
      ?auto_12512 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12511 ?auto_12510 ) ( IN-CITY ?auto_12510 ?auto_12512 ) ( IN-CITY ?auto_12506 ?auto_12512 ) ( not ( = ?auto_12506 ?auto_12510 ) ) ( OBJ-AT ?auto_12509 ?auto_12506 ) ( not ( = ?auto_12509 ?auto_12508 ) ) ( OBJ-AT ?auto_12508 ?auto_12510 ) ( OBJ-AT ?auto_12507 ?auto_12506 ) ( not ( = ?auto_12507 ?auto_12508 ) ) ( not ( = ?auto_12507 ?auto_12509 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12509 ?auto_12508 ?auto_12506 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12521 - OBJ
      ?auto_12522 - OBJ
      ?auto_12523 - OBJ
      ?auto_12520 - LOCATION
    )
    :vars
    (
      ?auto_12525 - TRUCK
      ?auto_12524 - LOCATION
      ?auto_12526 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12525 ?auto_12524 ) ( IN-CITY ?auto_12524 ?auto_12526 ) ( IN-CITY ?auto_12520 ?auto_12526 ) ( not ( = ?auto_12520 ?auto_12524 ) ) ( OBJ-AT ?auto_12522 ?auto_12520 ) ( not ( = ?auto_12522 ?auto_12521 ) ) ( OBJ-AT ?auto_12521 ?auto_12524 ) ( OBJ-AT ?auto_12523 ?auto_12520 ) ( not ( = ?auto_12521 ?auto_12523 ) ) ( not ( = ?auto_12522 ?auto_12523 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12522 ?auto_12521 ?auto_12520 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12550 - OBJ
      ?auto_12549 - LOCATION
    )
    :vars
    (
      ?auto_12552 - LOCATION
      ?auto_12554 - CITY
      ?auto_12551 - OBJ
      ?auto_12553 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12552 ?auto_12554 ) ( IN-CITY ?auto_12549 ?auto_12554 ) ( not ( = ?auto_12549 ?auto_12552 ) ) ( OBJ-AT ?auto_12551 ?auto_12549 ) ( not ( = ?auto_12551 ?auto_12550 ) ) ( OBJ-AT ?auto_12550 ?auto_12552 ) ( TRUCK-AT ?auto_12553 ?auto_12549 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12553 ?auto_12549 ?auto_12552 ?auto_12554 )
      ( DELIVER-2PKG ?auto_12551 ?auto_12550 ?auto_12549 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12556 - OBJ
      ?auto_12557 - OBJ
      ?auto_12555 - LOCATION
    )
    :vars
    (
      ?auto_12559 - LOCATION
      ?auto_12560 - CITY
      ?auto_12558 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12559 ?auto_12560 ) ( IN-CITY ?auto_12555 ?auto_12560 ) ( not ( = ?auto_12555 ?auto_12559 ) ) ( OBJ-AT ?auto_12556 ?auto_12555 ) ( not ( = ?auto_12556 ?auto_12557 ) ) ( OBJ-AT ?auto_12557 ?auto_12559 ) ( TRUCK-AT ?auto_12558 ?auto_12555 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12557 ?auto_12555 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12562 - OBJ
      ?auto_12563 - OBJ
      ?auto_12561 - LOCATION
    )
    :vars
    (
      ?auto_12566 - LOCATION
      ?auto_12565 - CITY
      ?auto_12564 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12566 ?auto_12565 ) ( IN-CITY ?auto_12561 ?auto_12565 ) ( not ( = ?auto_12561 ?auto_12566 ) ) ( OBJ-AT ?auto_12563 ?auto_12561 ) ( not ( = ?auto_12563 ?auto_12562 ) ) ( OBJ-AT ?auto_12562 ?auto_12566 ) ( TRUCK-AT ?auto_12564 ?auto_12561 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12563 ?auto_12562 ?auto_12561 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12575 - OBJ
      ?auto_12576 - OBJ
      ?auto_12577 - OBJ
      ?auto_12574 - LOCATION
    )
    :vars
    (
      ?auto_12580 - LOCATION
      ?auto_12579 - CITY
      ?auto_12578 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12580 ?auto_12579 ) ( IN-CITY ?auto_12574 ?auto_12579 ) ( not ( = ?auto_12574 ?auto_12580 ) ) ( OBJ-AT ?auto_12575 ?auto_12574 ) ( not ( = ?auto_12575 ?auto_12577 ) ) ( OBJ-AT ?auto_12577 ?auto_12580 ) ( TRUCK-AT ?auto_12578 ?auto_12574 ) ( OBJ-AT ?auto_12576 ?auto_12574 ) ( not ( = ?auto_12575 ?auto_12576 ) ) ( not ( = ?auto_12576 ?auto_12577 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12575 ?auto_12577 ?auto_12574 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12582 - OBJ
      ?auto_12583 - OBJ
      ?auto_12584 - OBJ
      ?auto_12581 - LOCATION
    )
    :vars
    (
      ?auto_12587 - LOCATION
      ?auto_12586 - CITY
      ?auto_12585 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12587 ?auto_12586 ) ( IN-CITY ?auto_12581 ?auto_12586 ) ( not ( = ?auto_12581 ?auto_12587 ) ) ( OBJ-AT ?auto_12582 ?auto_12581 ) ( not ( = ?auto_12582 ?auto_12583 ) ) ( OBJ-AT ?auto_12583 ?auto_12587 ) ( TRUCK-AT ?auto_12585 ?auto_12581 ) ( OBJ-AT ?auto_12584 ?auto_12581 ) ( not ( = ?auto_12582 ?auto_12584 ) ) ( not ( = ?auto_12583 ?auto_12584 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12582 ?auto_12583 ?auto_12581 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_12596 - OBJ
      ?auto_12597 - OBJ
      ?auto_12598 - OBJ
      ?auto_12595 - LOCATION
    )
    :vars
    (
      ?auto_12601 - LOCATION
      ?auto_12600 - CITY
      ?auto_12599 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12601 ?auto_12600 ) ( IN-CITY ?auto_12595 ?auto_12600 ) ( not ( = ?auto_12595 ?auto_12601 ) ) ( OBJ-AT ?auto_12598 ?auto_12595 ) ( not ( = ?auto_12598 ?auto_12596 ) ) ( OBJ-AT ?auto_12596 ?auto_12601 ) ( TRUCK-AT ?auto_12599 ?auto_12595 ) ( OBJ-AT ?auto_12597 ?auto_12595 ) ( not ( = ?auto_12596 ?auto_12597 ) ) ( not ( = ?auto_12597 ?auto_12598 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12598 ?auto_12596 ?auto_12595 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12625 - OBJ
      ?auto_12624 - LOCATION
    )
    :vars
    (
      ?auto_12629 - LOCATION
      ?auto_12628 - CITY
      ?auto_12626 - OBJ
      ?auto_12627 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12629 ?auto_12628 ) ( IN-CITY ?auto_12624 ?auto_12628 ) ( not ( = ?auto_12624 ?auto_12629 ) ) ( not ( = ?auto_12626 ?auto_12625 ) ) ( OBJ-AT ?auto_12625 ?auto_12629 ) ( TRUCK-AT ?auto_12627 ?auto_12624 ) ( IN-TRUCK ?auto_12626 ?auto_12627 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12626 ?auto_12624 )
      ( DELIVER-2PKG ?auto_12626 ?auto_12625 ?auto_12624 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12631 - OBJ
      ?auto_12632 - OBJ
      ?auto_12630 - LOCATION
    )
    :vars
    (
      ?auto_12634 - LOCATION
      ?auto_12633 - CITY
      ?auto_12635 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12634 ?auto_12633 ) ( IN-CITY ?auto_12630 ?auto_12633 ) ( not ( = ?auto_12630 ?auto_12634 ) ) ( not ( = ?auto_12631 ?auto_12632 ) ) ( OBJ-AT ?auto_12632 ?auto_12634 ) ( TRUCK-AT ?auto_12635 ?auto_12630 ) ( IN-TRUCK ?auto_12631 ?auto_12635 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12632 ?auto_12630 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12637 - OBJ
      ?auto_12638 - OBJ
      ?auto_12636 - LOCATION
    )
    :vars
    (
      ?auto_12641 - LOCATION
      ?auto_12639 - CITY
      ?auto_12640 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12641 ?auto_12639 ) ( IN-CITY ?auto_12636 ?auto_12639 ) ( not ( = ?auto_12636 ?auto_12641 ) ) ( not ( = ?auto_12638 ?auto_12637 ) ) ( OBJ-AT ?auto_12637 ?auto_12641 ) ( TRUCK-AT ?auto_12640 ?auto_12636 ) ( IN-TRUCK ?auto_12638 ?auto_12640 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12638 ?auto_12637 ?auto_12636 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12700 - OBJ
      ?auto_12699 - LOCATION
    )
    :vars
    (
      ?auto_12704 - LOCATION
      ?auto_12701 - CITY
      ?auto_12702 - OBJ
      ?auto_12703 - TRUCK
      ?auto_12705 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12704 ?auto_12701 ) ( IN-CITY ?auto_12699 ?auto_12701 ) ( not ( = ?auto_12699 ?auto_12704 ) ) ( not ( = ?auto_12702 ?auto_12700 ) ) ( OBJ-AT ?auto_12700 ?auto_12704 ) ( IN-TRUCK ?auto_12702 ?auto_12703 ) ( TRUCK-AT ?auto_12703 ?auto_12705 ) ( IN-CITY ?auto_12705 ?auto_12701 ) ( not ( = ?auto_12699 ?auto_12705 ) ) ( not ( = ?auto_12704 ?auto_12705 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12703 ?auto_12705 ?auto_12699 ?auto_12701 )
      ( DELIVER-2PKG ?auto_12702 ?auto_12700 ?auto_12699 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12707 - OBJ
      ?auto_12708 - OBJ
      ?auto_12706 - LOCATION
    )
    :vars
    (
      ?auto_12711 - LOCATION
      ?auto_12712 - CITY
      ?auto_12710 - TRUCK
      ?auto_12709 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12711 ?auto_12712 ) ( IN-CITY ?auto_12706 ?auto_12712 ) ( not ( = ?auto_12706 ?auto_12711 ) ) ( not ( = ?auto_12707 ?auto_12708 ) ) ( OBJ-AT ?auto_12708 ?auto_12711 ) ( IN-TRUCK ?auto_12707 ?auto_12710 ) ( TRUCK-AT ?auto_12710 ?auto_12709 ) ( IN-CITY ?auto_12709 ?auto_12712 ) ( not ( = ?auto_12706 ?auto_12709 ) ) ( not ( = ?auto_12711 ?auto_12709 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12708 ?auto_12706 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12714 - OBJ
      ?auto_12715 - OBJ
      ?auto_12713 - LOCATION
    )
    :vars
    (
      ?auto_12718 - LOCATION
      ?auto_12717 - CITY
      ?auto_12716 - TRUCK
      ?auto_12719 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12718 ?auto_12717 ) ( IN-CITY ?auto_12713 ?auto_12717 ) ( not ( = ?auto_12713 ?auto_12718 ) ) ( not ( = ?auto_12715 ?auto_12714 ) ) ( OBJ-AT ?auto_12714 ?auto_12718 ) ( IN-TRUCK ?auto_12715 ?auto_12716 ) ( TRUCK-AT ?auto_12716 ?auto_12719 ) ( IN-CITY ?auto_12719 ?auto_12717 ) ( not ( = ?auto_12713 ?auto_12719 ) ) ( not ( = ?auto_12718 ?auto_12719 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12715 ?auto_12714 ?auto_12713 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_12786 - OBJ
      ?auto_12785 - LOCATION
    )
    :vars
    (
      ?auto_12789 - LOCATION
      ?auto_12788 - CITY
      ?auto_12790 - OBJ
      ?auto_12787 - TRUCK
      ?auto_12791 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12789 ?auto_12788 ) ( IN-CITY ?auto_12785 ?auto_12788 ) ( not ( = ?auto_12785 ?auto_12789 ) ) ( not ( = ?auto_12790 ?auto_12786 ) ) ( OBJ-AT ?auto_12786 ?auto_12789 ) ( TRUCK-AT ?auto_12787 ?auto_12791 ) ( IN-CITY ?auto_12791 ?auto_12788 ) ( not ( = ?auto_12785 ?auto_12791 ) ) ( not ( = ?auto_12789 ?auto_12791 ) ) ( OBJ-AT ?auto_12790 ?auto_12791 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12790 ?auto_12787 ?auto_12791 )
      ( DELIVER-2PKG ?auto_12790 ?auto_12786 ?auto_12785 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12793 - OBJ
      ?auto_12794 - OBJ
      ?auto_12792 - LOCATION
    )
    :vars
    (
      ?auto_12796 - LOCATION
      ?auto_12798 - CITY
      ?auto_12797 - TRUCK
      ?auto_12795 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12796 ?auto_12798 ) ( IN-CITY ?auto_12792 ?auto_12798 ) ( not ( = ?auto_12792 ?auto_12796 ) ) ( not ( = ?auto_12793 ?auto_12794 ) ) ( OBJ-AT ?auto_12794 ?auto_12796 ) ( TRUCK-AT ?auto_12797 ?auto_12795 ) ( IN-CITY ?auto_12795 ?auto_12798 ) ( not ( = ?auto_12792 ?auto_12795 ) ) ( not ( = ?auto_12796 ?auto_12795 ) ) ( OBJ-AT ?auto_12793 ?auto_12795 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12794 ?auto_12792 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_12800 - OBJ
      ?auto_12801 - OBJ
      ?auto_12799 - LOCATION
    )
    :vars
    (
      ?auto_12802 - LOCATION
      ?auto_12804 - CITY
      ?auto_12805 - TRUCK
      ?auto_12803 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12802 ?auto_12804 ) ( IN-CITY ?auto_12799 ?auto_12804 ) ( not ( = ?auto_12799 ?auto_12802 ) ) ( not ( = ?auto_12801 ?auto_12800 ) ) ( OBJ-AT ?auto_12800 ?auto_12802 ) ( TRUCK-AT ?auto_12805 ?auto_12803 ) ( IN-CITY ?auto_12803 ?auto_12804 ) ( not ( = ?auto_12799 ?auto_12803 ) ) ( not ( = ?auto_12802 ?auto_12803 ) ) ( OBJ-AT ?auto_12801 ?auto_12803 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12801 ?auto_12800 ?auto_12799 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13174 - OBJ
      ?auto_13175 - OBJ
      ?auto_13176 - OBJ
      ?auto_13173 - LOCATION
    )
    :vars
    (
      ?auto_13179 - TRUCK
      ?auto_13178 - LOCATION
      ?auto_13177 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13176 ?auto_13179 ) ( TRUCK-AT ?auto_13179 ?auto_13178 ) ( IN-CITY ?auto_13178 ?auto_13177 ) ( IN-CITY ?auto_13173 ?auto_13177 ) ( not ( = ?auto_13173 ?auto_13178 ) ) ( OBJ-AT ?auto_13174 ?auto_13173 ) ( not ( = ?auto_13174 ?auto_13176 ) ) ( OBJ-AT ?auto_13175 ?auto_13173 ) ( not ( = ?auto_13174 ?auto_13175 ) ) ( not ( = ?auto_13175 ?auto_13176 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13174 ?auto_13176 ?auto_13173 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13207 - OBJ
      ?auto_13208 - OBJ
      ?auto_13209 - OBJ
      ?auto_13206 - LOCATION
    )
    :vars
    (
      ?auto_13212 - TRUCK
      ?auto_13211 - LOCATION
      ?auto_13210 - CITY
      ?auto_13213 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13209 ?auto_13212 ) ( TRUCK-AT ?auto_13212 ?auto_13211 ) ( IN-CITY ?auto_13211 ?auto_13210 ) ( IN-CITY ?auto_13206 ?auto_13210 ) ( not ( = ?auto_13206 ?auto_13211 ) ) ( OBJ-AT ?auto_13213 ?auto_13206 ) ( not ( = ?auto_13213 ?auto_13209 ) ) ( OBJ-AT ?auto_13207 ?auto_13206 ) ( OBJ-AT ?auto_13208 ?auto_13206 ) ( not ( = ?auto_13207 ?auto_13208 ) ) ( not ( = ?auto_13207 ?auto_13209 ) ) ( not ( = ?auto_13207 ?auto_13213 ) ) ( not ( = ?auto_13208 ?auto_13209 ) ) ( not ( = ?auto_13208 ?auto_13213 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13213 ?auto_13209 ?auto_13206 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13219 - OBJ
      ?auto_13220 - OBJ
      ?auto_13221 - OBJ
      ?auto_13218 - LOCATION
    )
    :vars
    (
      ?auto_13224 - TRUCK
      ?auto_13223 - LOCATION
      ?auto_13222 - CITY
      ?auto_13225 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13220 ?auto_13224 ) ( TRUCK-AT ?auto_13224 ?auto_13223 ) ( IN-CITY ?auto_13223 ?auto_13222 ) ( IN-CITY ?auto_13218 ?auto_13222 ) ( not ( = ?auto_13218 ?auto_13223 ) ) ( OBJ-AT ?auto_13225 ?auto_13218 ) ( not ( = ?auto_13225 ?auto_13220 ) ) ( OBJ-AT ?auto_13219 ?auto_13218 ) ( OBJ-AT ?auto_13221 ?auto_13218 ) ( not ( = ?auto_13219 ?auto_13220 ) ) ( not ( = ?auto_13219 ?auto_13221 ) ) ( not ( = ?auto_13219 ?auto_13225 ) ) ( not ( = ?auto_13220 ?auto_13221 ) ) ( not ( = ?auto_13221 ?auto_13225 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13225 ?auto_13220 ?auto_13218 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13257 - OBJ
      ?auto_13258 - OBJ
      ?auto_13259 - OBJ
      ?auto_13256 - LOCATION
    )
    :vars
    (
      ?auto_13262 - TRUCK
      ?auto_13261 - LOCATION
      ?auto_13260 - CITY
      ?auto_13263 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13257 ?auto_13262 ) ( TRUCK-AT ?auto_13262 ?auto_13261 ) ( IN-CITY ?auto_13261 ?auto_13260 ) ( IN-CITY ?auto_13256 ?auto_13260 ) ( not ( = ?auto_13256 ?auto_13261 ) ) ( OBJ-AT ?auto_13263 ?auto_13256 ) ( not ( = ?auto_13263 ?auto_13257 ) ) ( OBJ-AT ?auto_13258 ?auto_13256 ) ( OBJ-AT ?auto_13259 ?auto_13256 ) ( not ( = ?auto_13257 ?auto_13258 ) ) ( not ( = ?auto_13257 ?auto_13259 ) ) ( not ( = ?auto_13258 ?auto_13259 ) ) ( not ( = ?auto_13258 ?auto_13263 ) ) ( not ( = ?auto_13259 ?auto_13263 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13263 ?auto_13257 ?auto_13256 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13327 - OBJ
      ?auto_13328 - OBJ
      ?auto_13329 - OBJ
      ?auto_13326 - LOCATION
    )
    :vars
    (
      ?auto_13331 - TRUCK
      ?auto_13330 - LOCATION
      ?auto_13332 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13331 ?auto_13330 ) ( IN-CITY ?auto_13330 ?auto_13332 ) ( IN-CITY ?auto_13326 ?auto_13332 ) ( not ( = ?auto_13326 ?auto_13330 ) ) ( OBJ-AT ?auto_13327 ?auto_13326 ) ( not ( = ?auto_13327 ?auto_13329 ) ) ( OBJ-AT ?auto_13329 ?auto_13330 ) ( OBJ-AT ?auto_13328 ?auto_13326 ) ( not ( = ?auto_13327 ?auto_13328 ) ) ( not ( = ?auto_13328 ?auto_13329 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13327 ?auto_13329 ?auto_13326 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13360 - OBJ
      ?auto_13361 - OBJ
      ?auto_13362 - OBJ
      ?auto_13359 - LOCATION
    )
    :vars
    (
      ?auto_13364 - TRUCK
      ?auto_13363 - LOCATION
      ?auto_13366 - CITY
      ?auto_13365 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13364 ?auto_13363 ) ( IN-CITY ?auto_13363 ?auto_13366 ) ( IN-CITY ?auto_13359 ?auto_13366 ) ( not ( = ?auto_13359 ?auto_13363 ) ) ( OBJ-AT ?auto_13365 ?auto_13359 ) ( not ( = ?auto_13365 ?auto_13362 ) ) ( OBJ-AT ?auto_13362 ?auto_13363 ) ( OBJ-AT ?auto_13360 ?auto_13359 ) ( OBJ-AT ?auto_13361 ?auto_13359 ) ( not ( = ?auto_13360 ?auto_13361 ) ) ( not ( = ?auto_13360 ?auto_13362 ) ) ( not ( = ?auto_13360 ?auto_13365 ) ) ( not ( = ?auto_13361 ?auto_13362 ) ) ( not ( = ?auto_13361 ?auto_13365 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13365 ?auto_13362 ?auto_13359 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13372 - OBJ
      ?auto_13373 - OBJ
      ?auto_13374 - OBJ
      ?auto_13371 - LOCATION
    )
    :vars
    (
      ?auto_13376 - TRUCK
      ?auto_13375 - LOCATION
      ?auto_13378 - CITY
      ?auto_13377 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13376 ?auto_13375 ) ( IN-CITY ?auto_13375 ?auto_13378 ) ( IN-CITY ?auto_13371 ?auto_13378 ) ( not ( = ?auto_13371 ?auto_13375 ) ) ( OBJ-AT ?auto_13377 ?auto_13371 ) ( not ( = ?auto_13377 ?auto_13373 ) ) ( OBJ-AT ?auto_13373 ?auto_13375 ) ( OBJ-AT ?auto_13372 ?auto_13371 ) ( OBJ-AT ?auto_13374 ?auto_13371 ) ( not ( = ?auto_13372 ?auto_13373 ) ) ( not ( = ?auto_13372 ?auto_13374 ) ) ( not ( = ?auto_13372 ?auto_13377 ) ) ( not ( = ?auto_13373 ?auto_13374 ) ) ( not ( = ?auto_13374 ?auto_13377 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13377 ?auto_13373 ?auto_13371 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13388 - OBJ
      ?auto_13389 - OBJ
      ?auto_13390 - OBJ
      ?auto_13387 - LOCATION
    )
    :vars
    (
      ?auto_13392 - TRUCK
      ?auto_13391 - LOCATION
      ?auto_13393 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13392 ?auto_13391 ) ( IN-CITY ?auto_13391 ?auto_13393 ) ( IN-CITY ?auto_13387 ?auto_13393 ) ( not ( = ?auto_13387 ?auto_13391 ) ) ( OBJ-AT ?auto_13390 ?auto_13387 ) ( not ( = ?auto_13390 ?auto_13388 ) ) ( OBJ-AT ?auto_13388 ?auto_13391 ) ( OBJ-AT ?auto_13389 ?auto_13387 ) ( not ( = ?auto_13388 ?auto_13389 ) ) ( not ( = ?auto_13389 ?auto_13390 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13390 ?auto_13388 ?auto_13387 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13410 - OBJ
      ?auto_13411 - OBJ
      ?auto_13412 - OBJ
      ?auto_13409 - LOCATION
    )
    :vars
    (
      ?auto_13414 - TRUCK
      ?auto_13413 - LOCATION
      ?auto_13416 - CITY
      ?auto_13415 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13414 ?auto_13413 ) ( IN-CITY ?auto_13413 ?auto_13416 ) ( IN-CITY ?auto_13409 ?auto_13416 ) ( not ( = ?auto_13409 ?auto_13413 ) ) ( OBJ-AT ?auto_13415 ?auto_13409 ) ( not ( = ?auto_13415 ?auto_13410 ) ) ( OBJ-AT ?auto_13410 ?auto_13413 ) ( OBJ-AT ?auto_13411 ?auto_13409 ) ( OBJ-AT ?auto_13412 ?auto_13409 ) ( not ( = ?auto_13410 ?auto_13411 ) ) ( not ( = ?auto_13410 ?auto_13412 ) ) ( not ( = ?auto_13411 ?auto_13412 ) ) ( not ( = ?auto_13411 ?auto_13415 ) ) ( not ( = ?auto_13412 ?auto_13415 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13415 ?auto_13410 ?auto_13409 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13480 - OBJ
      ?auto_13481 - OBJ
      ?auto_13482 - OBJ
      ?auto_13479 - LOCATION
    )
    :vars
    (
      ?auto_13485 - LOCATION
      ?auto_13483 - CITY
      ?auto_13484 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13485 ?auto_13483 ) ( IN-CITY ?auto_13479 ?auto_13483 ) ( not ( = ?auto_13479 ?auto_13485 ) ) ( OBJ-AT ?auto_13481 ?auto_13479 ) ( not ( = ?auto_13481 ?auto_13482 ) ) ( OBJ-AT ?auto_13482 ?auto_13485 ) ( TRUCK-AT ?auto_13484 ?auto_13479 ) ( OBJ-AT ?auto_13480 ?auto_13479 ) ( not ( = ?auto_13480 ?auto_13481 ) ) ( not ( = ?auto_13480 ?auto_13482 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13481 ?auto_13482 ?auto_13479 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13513 - OBJ
      ?auto_13514 - OBJ
      ?auto_13515 - OBJ
      ?auto_13512 - LOCATION
    )
    :vars
    (
      ?auto_13518 - LOCATION
      ?auto_13516 - CITY
      ?auto_13519 - OBJ
      ?auto_13517 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13518 ?auto_13516 ) ( IN-CITY ?auto_13512 ?auto_13516 ) ( not ( = ?auto_13512 ?auto_13518 ) ) ( OBJ-AT ?auto_13519 ?auto_13512 ) ( not ( = ?auto_13519 ?auto_13515 ) ) ( OBJ-AT ?auto_13515 ?auto_13518 ) ( TRUCK-AT ?auto_13517 ?auto_13512 ) ( OBJ-AT ?auto_13513 ?auto_13512 ) ( OBJ-AT ?auto_13514 ?auto_13512 ) ( not ( = ?auto_13513 ?auto_13514 ) ) ( not ( = ?auto_13513 ?auto_13515 ) ) ( not ( = ?auto_13513 ?auto_13519 ) ) ( not ( = ?auto_13514 ?auto_13515 ) ) ( not ( = ?auto_13514 ?auto_13519 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13519 ?auto_13515 ?auto_13512 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13525 - OBJ
      ?auto_13526 - OBJ
      ?auto_13527 - OBJ
      ?auto_13524 - LOCATION
    )
    :vars
    (
      ?auto_13530 - LOCATION
      ?auto_13528 - CITY
      ?auto_13531 - OBJ
      ?auto_13529 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13530 ?auto_13528 ) ( IN-CITY ?auto_13524 ?auto_13528 ) ( not ( = ?auto_13524 ?auto_13530 ) ) ( OBJ-AT ?auto_13531 ?auto_13524 ) ( not ( = ?auto_13531 ?auto_13526 ) ) ( OBJ-AT ?auto_13526 ?auto_13530 ) ( TRUCK-AT ?auto_13529 ?auto_13524 ) ( OBJ-AT ?auto_13525 ?auto_13524 ) ( OBJ-AT ?auto_13527 ?auto_13524 ) ( not ( = ?auto_13525 ?auto_13526 ) ) ( not ( = ?auto_13525 ?auto_13527 ) ) ( not ( = ?auto_13525 ?auto_13531 ) ) ( not ( = ?auto_13526 ?auto_13527 ) ) ( not ( = ?auto_13527 ?auto_13531 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13531 ?auto_13526 ?auto_13524 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13541 - OBJ
      ?auto_13542 - OBJ
      ?auto_13543 - OBJ
      ?auto_13540 - LOCATION
    )
    :vars
    (
      ?auto_13546 - LOCATION
      ?auto_13544 - CITY
      ?auto_13545 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13546 ?auto_13544 ) ( IN-CITY ?auto_13540 ?auto_13544 ) ( not ( = ?auto_13540 ?auto_13546 ) ) ( OBJ-AT ?auto_13542 ?auto_13540 ) ( not ( = ?auto_13542 ?auto_13541 ) ) ( OBJ-AT ?auto_13541 ?auto_13546 ) ( TRUCK-AT ?auto_13545 ?auto_13540 ) ( OBJ-AT ?auto_13543 ?auto_13540 ) ( not ( = ?auto_13541 ?auto_13543 ) ) ( not ( = ?auto_13542 ?auto_13543 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13542 ?auto_13541 ?auto_13540 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13563 - OBJ
      ?auto_13564 - OBJ
      ?auto_13565 - OBJ
      ?auto_13562 - LOCATION
    )
    :vars
    (
      ?auto_13568 - LOCATION
      ?auto_13566 - CITY
      ?auto_13569 - OBJ
      ?auto_13567 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13568 ?auto_13566 ) ( IN-CITY ?auto_13562 ?auto_13566 ) ( not ( = ?auto_13562 ?auto_13568 ) ) ( OBJ-AT ?auto_13569 ?auto_13562 ) ( not ( = ?auto_13569 ?auto_13563 ) ) ( OBJ-AT ?auto_13563 ?auto_13568 ) ( TRUCK-AT ?auto_13567 ?auto_13562 ) ( OBJ-AT ?auto_13564 ?auto_13562 ) ( OBJ-AT ?auto_13565 ?auto_13562 ) ( not ( = ?auto_13563 ?auto_13564 ) ) ( not ( = ?auto_13563 ?auto_13565 ) ) ( not ( = ?auto_13564 ?auto_13565 ) ) ( not ( = ?auto_13564 ?auto_13569 ) ) ( not ( = ?auto_13565 ?auto_13569 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13569 ?auto_13563 ?auto_13562 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13645 - OBJ
      ?auto_13646 - OBJ
      ?auto_13647 - OBJ
      ?auto_13644 - LOCATION
    )
    :vars
    (
      ?auto_13650 - LOCATION
      ?auto_13649 - CITY
      ?auto_13648 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13650 ?auto_13649 ) ( IN-CITY ?auto_13644 ?auto_13649 ) ( not ( = ?auto_13644 ?auto_13650 ) ) ( OBJ-AT ?auto_13647 ?auto_13644 ) ( not ( = ?auto_13647 ?auto_13646 ) ) ( OBJ-AT ?auto_13646 ?auto_13650 ) ( TRUCK-AT ?auto_13648 ?auto_13644 ) ( OBJ-AT ?auto_13645 ?auto_13644 ) ( not ( = ?auto_13645 ?auto_13646 ) ) ( not ( = ?auto_13645 ?auto_13647 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13647 ?auto_13646 ?auto_13644 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13771 - OBJ
      ?auto_13770 - LOCATION
    )
    :vars
    (
      ?auto_13775 - LOCATION
      ?auto_13773 - CITY
      ?auto_13774 - OBJ
      ?auto_13772 - TRUCK
      ?auto_13776 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13775 ?auto_13773 ) ( IN-CITY ?auto_13770 ?auto_13773 ) ( not ( = ?auto_13770 ?auto_13775 ) ) ( OBJ-AT ?auto_13774 ?auto_13770 ) ( not ( = ?auto_13774 ?auto_13771 ) ) ( OBJ-AT ?auto_13771 ?auto_13775 ) ( TRUCK-AT ?auto_13772 ?auto_13776 ) ( IN-CITY ?auto_13776 ?auto_13773 ) ( not ( = ?auto_13770 ?auto_13776 ) ) ( not ( = ?auto_13775 ?auto_13776 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13772 ?auto_13776 ?auto_13770 ?auto_13773 )
      ( DELIVER-2PKG ?auto_13774 ?auto_13771 ?auto_13770 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13778 - OBJ
      ?auto_13779 - OBJ
      ?auto_13777 - LOCATION
    )
    :vars
    (
      ?auto_13782 - LOCATION
      ?auto_13781 - CITY
      ?auto_13780 - TRUCK
      ?auto_13783 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13782 ?auto_13781 ) ( IN-CITY ?auto_13777 ?auto_13781 ) ( not ( = ?auto_13777 ?auto_13782 ) ) ( OBJ-AT ?auto_13778 ?auto_13777 ) ( not ( = ?auto_13778 ?auto_13779 ) ) ( OBJ-AT ?auto_13779 ?auto_13782 ) ( TRUCK-AT ?auto_13780 ?auto_13783 ) ( IN-CITY ?auto_13783 ?auto_13781 ) ( not ( = ?auto_13777 ?auto_13783 ) ) ( not ( = ?auto_13782 ?auto_13783 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13779 ?auto_13777 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13793 - OBJ
      ?auto_13794 - OBJ
      ?auto_13792 - LOCATION
    )
    :vars
    (
      ?auto_13798 - LOCATION
      ?auto_13797 - CITY
      ?auto_13796 - TRUCK
      ?auto_13795 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13798 ?auto_13797 ) ( IN-CITY ?auto_13792 ?auto_13797 ) ( not ( = ?auto_13792 ?auto_13798 ) ) ( OBJ-AT ?auto_13794 ?auto_13792 ) ( not ( = ?auto_13794 ?auto_13793 ) ) ( OBJ-AT ?auto_13793 ?auto_13798 ) ( TRUCK-AT ?auto_13796 ?auto_13795 ) ( IN-CITY ?auto_13795 ?auto_13797 ) ( not ( = ?auto_13792 ?auto_13795 ) ) ( not ( = ?auto_13798 ?auto_13795 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13794 ?auto_13793 ?auto_13792 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13816 - OBJ
      ?auto_13817 - OBJ
      ?auto_13818 - OBJ
      ?auto_13815 - LOCATION
    )
    :vars
    (
      ?auto_13822 - LOCATION
      ?auto_13821 - CITY
      ?auto_13820 - TRUCK
      ?auto_13819 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13822 ?auto_13821 ) ( IN-CITY ?auto_13815 ?auto_13821 ) ( not ( = ?auto_13815 ?auto_13822 ) ) ( OBJ-AT ?auto_13816 ?auto_13815 ) ( not ( = ?auto_13816 ?auto_13818 ) ) ( OBJ-AT ?auto_13818 ?auto_13822 ) ( TRUCK-AT ?auto_13820 ?auto_13819 ) ( IN-CITY ?auto_13819 ?auto_13821 ) ( not ( = ?auto_13815 ?auto_13819 ) ) ( not ( = ?auto_13822 ?auto_13819 ) ) ( OBJ-AT ?auto_13817 ?auto_13815 ) ( not ( = ?auto_13816 ?auto_13817 ) ) ( not ( = ?auto_13817 ?auto_13818 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13816 ?auto_13818 ?auto_13815 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13832 - OBJ
      ?auto_13833 - OBJ
      ?auto_13834 - OBJ
      ?auto_13831 - LOCATION
    )
    :vars
    (
      ?auto_13838 - LOCATION
      ?auto_13837 - CITY
      ?auto_13836 - TRUCK
      ?auto_13835 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13838 ?auto_13837 ) ( IN-CITY ?auto_13831 ?auto_13837 ) ( not ( = ?auto_13831 ?auto_13838 ) ) ( OBJ-AT ?auto_13834 ?auto_13831 ) ( not ( = ?auto_13834 ?auto_13833 ) ) ( OBJ-AT ?auto_13833 ?auto_13838 ) ( TRUCK-AT ?auto_13836 ?auto_13835 ) ( IN-CITY ?auto_13835 ?auto_13837 ) ( not ( = ?auto_13831 ?auto_13835 ) ) ( not ( = ?auto_13838 ?auto_13835 ) ) ( OBJ-AT ?auto_13832 ?auto_13831 ) ( not ( = ?auto_13832 ?auto_13833 ) ) ( not ( = ?auto_13832 ?auto_13834 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13834 ?auto_13833 ?auto_13831 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13899 - OBJ
      ?auto_13900 - OBJ
      ?auto_13901 - OBJ
      ?auto_13898 - LOCATION
    )
    :vars
    (
      ?auto_13905 - LOCATION
      ?auto_13904 - CITY
      ?auto_13903 - TRUCK
      ?auto_13902 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13905 ?auto_13904 ) ( IN-CITY ?auto_13898 ?auto_13904 ) ( not ( = ?auto_13898 ?auto_13905 ) ) ( OBJ-AT ?auto_13900 ?auto_13898 ) ( not ( = ?auto_13900 ?auto_13899 ) ) ( OBJ-AT ?auto_13899 ?auto_13905 ) ( TRUCK-AT ?auto_13903 ?auto_13902 ) ( IN-CITY ?auto_13902 ?auto_13904 ) ( not ( = ?auto_13898 ?auto_13902 ) ) ( not ( = ?auto_13905 ?auto_13902 ) ) ( OBJ-AT ?auto_13901 ?auto_13898 ) ( not ( = ?auto_13899 ?auto_13901 ) ) ( not ( = ?auto_13900 ?auto_13901 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13900 ?auto_13899 ?auto_13898 ) )
  )

)

