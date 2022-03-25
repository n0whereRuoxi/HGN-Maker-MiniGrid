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
      ?auto_12279 - TRUCK
      ?auto_12278 - LOCATION
      ?auto_12277 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12279 ?auto_12278 ) ( IN-CITY ?auto_12278 ?auto_12277 ) ( IN-CITY ?auto_12275 ?auto_12277 ) ( not ( = ?auto_12275 ?auto_12278 ) ) ( OBJ-AT ?auto_12276 ?auto_12278 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12276 ?auto_12279 ?auto_12278 )
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
      ?auto_12296 - CITY
      ?auto_12297 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12295 ?auto_12296 ) ( IN-CITY ?auto_12293 ?auto_12296 ) ( not ( = ?auto_12293 ?auto_12295 ) ) ( OBJ-AT ?auto_12294 ?auto_12295 ) ( TRUCK-AT ?auto_12297 ?auto_12293 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12297 ?auto_12293 ?auto_12295 ?auto_12296 )
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
      ?auto_12408 - TRUCK
      ?auto_12410 - LOCATION
      ?auto_12409 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12407 ?auto_12408 ) ( TRUCK-AT ?auto_12408 ?auto_12410 ) ( IN-CITY ?auto_12410 ?auto_12409 ) ( IN-CITY ?auto_12405 ?auto_12409 ) ( not ( = ?auto_12405 ?auto_12410 ) ) ( OBJ-AT ?auto_12406 ?auto_12405 ) ( not ( = ?auto_12406 ?auto_12407 ) ) )
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
      ?auto_12414 - TRUCK
      ?auto_12416 - LOCATION
      ?auto_12415 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12412 ?auto_12414 ) ( TRUCK-AT ?auto_12414 ?auto_12416 ) ( IN-CITY ?auto_12416 ?auto_12415 ) ( IN-CITY ?auto_12411 ?auto_12415 ) ( not ( = ?auto_12411 ?auto_12416 ) ) ( OBJ-AT ?auto_12413 ?auto_12411 ) ( not ( = ?auto_12413 ?auto_12412 ) ) )
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
      ?auto_12428 - TRUCK
      ?auto_12430 - LOCATION
      ?auto_12429 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12427 ?auto_12428 ) ( TRUCK-AT ?auto_12428 ?auto_12430 ) ( IN-CITY ?auto_12430 ?auto_12429 ) ( IN-CITY ?auto_12424 ?auto_12429 ) ( not ( = ?auto_12424 ?auto_12430 ) ) ( OBJ-AT ?auto_12425 ?auto_12424 ) ( not ( = ?auto_12425 ?auto_12427 ) ) ( OBJ-AT ?auto_12426 ?auto_12424 ) ( not ( = ?auto_12425 ?auto_12426 ) ) ( not ( = ?auto_12426 ?auto_12427 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12425 ?auto_12427 ?auto_12424 ) )
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
      ?auto_12435 - TRUCK
      ?auto_12437 - LOCATION
      ?auto_12436 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12433 ?auto_12435 ) ( TRUCK-AT ?auto_12435 ?auto_12437 ) ( IN-CITY ?auto_12437 ?auto_12436 ) ( IN-CITY ?auto_12431 ?auto_12436 ) ( not ( = ?auto_12431 ?auto_12437 ) ) ( OBJ-AT ?auto_12432 ?auto_12431 ) ( not ( = ?auto_12432 ?auto_12433 ) ) ( OBJ-AT ?auto_12434 ?auto_12431 ) ( not ( = ?auto_12432 ?auto_12434 ) ) ( not ( = ?auto_12433 ?auto_12434 ) ) )
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
      ?auto_12449 - TRUCK
      ?auto_12451 - LOCATION
      ?auto_12450 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_12446 ?auto_12449 ) ( TRUCK-AT ?auto_12449 ?auto_12451 ) ( IN-CITY ?auto_12451 ?auto_12450 ) ( IN-CITY ?auto_12445 ?auto_12450 ) ( not ( = ?auto_12445 ?auto_12451 ) ) ( OBJ-AT ?auto_12448 ?auto_12445 ) ( not ( = ?auto_12448 ?auto_12446 ) ) ( OBJ-AT ?auto_12447 ?auto_12445 ) ( not ( = ?auto_12446 ?auto_12447 ) ) ( not ( = ?auto_12447 ?auto_12448 ) ) )
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
      ?auto_12476 - TRUCK
      ?auto_12478 - LOCATION
      ?auto_12477 - CITY
      ?auto_12479 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12476 ?auto_12478 ) ( IN-CITY ?auto_12478 ?auto_12477 ) ( IN-CITY ?auto_12474 ?auto_12477 ) ( not ( = ?auto_12474 ?auto_12478 ) ) ( OBJ-AT ?auto_12479 ?auto_12474 ) ( not ( = ?auto_12479 ?auto_12475 ) ) ( OBJ-AT ?auto_12475 ?auto_12478 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12475 ?auto_12476 ?auto_12478 )
      ( DELIVER-2PKG ?auto_12479 ?auto_12475 ?auto_12474 ) )
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
      ?auto_12484 - TRUCK
      ?auto_12483 - LOCATION
      ?auto_12485 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12484 ?auto_12483 ) ( IN-CITY ?auto_12483 ?auto_12485 ) ( IN-CITY ?auto_12480 ?auto_12485 ) ( not ( = ?auto_12480 ?auto_12483 ) ) ( OBJ-AT ?auto_12481 ?auto_12480 ) ( not ( = ?auto_12481 ?auto_12482 ) ) ( OBJ-AT ?auto_12482 ?auto_12483 ) )
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
      ?auto_12491 - LOCATION
      ?auto_12489 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12490 ?auto_12491 ) ( IN-CITY ?auto_12491 ?auto_12489 ) ( IN-CITY ?auto_12486 ?auto_12489 ) ( not ( = ?auto_12486 ?auto_12491 ) ) ( OBJ-AT ?auto_12488 ?auto_12486 ) ( not ( = ?auto_12488 ?auto_12487 ) ) ( OBJ-AT ?auto_12487 ?auto_12491 ) )
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
      ?auto_12505 - LOCATION
      ?auto_12503 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12504 ?auto_12505 ) ( IN-CITY ?auto_12505 ?auto_12503 ) ( IN-CITY ?auto_12499 ?auto_12503 ) ( not ( = ?auto_12499 ?auto_12505 ) ) ( OBJ-AT ?auto_12501 ?auto_12499 ) ( not ( = ?auto_12501 ?auto_12502 ) ) ( OBJ-AT ?auto_12502 ?auto_12505 ) ( OBJ-AT ?auto_12500 ?auto_12499 ) ( not ( = ?auto_12500 ?auto_12501 ) ) ( not ( = ?auto_12500 ?auto_12502 ) ) )
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
      ?auto_12512 - LOCATION
      ?auto_12510 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12511 ?auto_12512 ) ( IN-CITY ?auto_12512 ?auto_12510 ) ( IN-CITY ?auto_12506 ?auto_12510 ) ( not ( = ?auto_12506 ?auto_12512 ) ) ( OBJ-AT ?auto_12507 ?auto_12506 ) ( not ( = ?auto_12507 ?auto_12508 ) ) ( OBJ-AT ?auto_12508 ?auto_12512 ) ( OBJ-AT ?auto_12509 ?auto_12506 ) ( not ( = ?auto_12507 ?auto_12509 ) ) ( not ( = ?auto_12508 ?auto_12509 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12507 ?auto_12508 ?auto_12506 ) )
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
      ?auto_12526 - LOCATION
      ?auto_12524 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_12525 ?auto_12526 ) ( IN-CITY ?auto_12526 ?auto_12524 ) ( IN-CITY ?auto_12520 ?auto_12524 ) ( not ( = ?auto_12520 ?auto_12526 ) ) ( OBJ-AT ?auto_12522 ?auto_12520 ) ( not ( = ?auto_12522 ?auto_12521 ) ) ( OBJ-AT ?auto_12521 ?auto_12526 ) ( OBJ-AT ?auto_12523 ?auto_12520 ) ( not ( = ?auto_12521 ?auto_12523 ) ) ( not ( = ?auto_12522 ?auto_12523 ) ) )
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
      ?auto_12554 - LOCATION
      ?auto_12551 - CITY
      ?auto_12552 - OBJ
      ?auto_12553 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12554 ?auto_12551 ) ( IN-CITY ?auto_12549 ?auto_12551 ) ( not ( = ?auto_12549 ?auto_12554 ) ) ( OBJ-AT ?auto_12552 ?auto_12549 ) ( not ( = ?auto_12552 ?auto_12550 ) ) ( OBJ-AT ?auto_12550 ?auto_12554 ) ( TRUCK-AT ?auto_12553 ?auto_12549 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12553 ?auto_12549 ?auto_12554 ?auto_12551 )
      ( DELIVER-2PKG ?auto_12552 ?auto_12550 ?auto_12549 ) )
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
      ?auto_12558 - CITY
      ?auto_12560 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12559 ?auto_12558 ) ( IN-CITY ?auto_12555 ?auto_12558 ) ( not ( = ?auto_12555 ?auto_12559 ) ) ( OBJ-AT ?auto_12556 ?auto_12555 ) ( not ( = ?auto_12556 ?auto_12557 ) ) ( OBJ-AT ?auto_12557 ?auto_12559 ) ( TRUCK-AT ?auto_12560 ?auto_12555 ) )
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
      ?auto_12564 - LOCATION
      ?auto_12565 - CITY
      ?auto_12566 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12564 ?auto_12565 ) ( IN-CITY ?auto_12561 ?auto_12565 ) ( not ( = ?auto_12561 ?auto_12564 ) ) ( OBJ-AT ?auto_12563 ?auto_12561 ) ( not ( = ?auto_12563 ?auto_12562 ) ) ( OBJ-AT ?auto_12562 ?auto_12564 ) ( TRUCK-AT ?auto_12566 ?auto_12561 ) )
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
      ?auto_12578 - LOCATION
      ?auto_12579 - CITY
      ?auto_12580 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12578 ?auto_12579 ) ( IN-CITY ?auto_12574 ?auto_12579 ) ( not ( = ?auto_12574 ?auto_12578 ) ) ( OBJ-AT ?auto_12576 ?auto_12574 ) ( not ( = ?auto_12576 ?auto_12577 ) ) ( OBJ-AT ?auto_12577 ?auto_12578 ) ( TRUCK-AT ?auto_12580 ?auto_12574 ) ( OBJ-AT ?auto_12575 ?auto_12574 ) ( not ( = ?auto_12575 ?auto_12576 ) ) ( not ( = ?auto_12575 ?auto_12577 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12576 ?auto_12577 ?auto_12574 ) )
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
      ?auto_12585 - LOCATION
      ?auto_12586 - CITY
      ?auto_12587 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12585 ?auto_12586 ) ( IN-CITY ?auto_12581 ?auto_12586 ) ( not ( = ?auto_12581 ?auto_12585 ) ) ( OBJ-AT ?auto_12584 ?auto_12581 ) ( not ( = ?auto_12584 ?auto_12583 ) ) ( OBJ-AT ?auto_12583 ?auto_12585 ) ( TRUCK-AT ?auto_12587 ?auto_12581 ) ( OBJ-AT ?auto_12582 ?auto_12581 ) ( not ( = ?auto_12582 ?auto_12583 ) ) ( not ( = ?auto_12582 ?auto_12584 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12584 ?auto_12583 ?auto_12581 ) )
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
      ?auto_12599 - LOCATION
      ?auto_12600 - CITY
      ?auto_12601 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12599 ?auto_12600 ) ( IN-CITY ?auto_12595 ?auto_12600 ) ( not ( = ?auto_12595 ?auto_12599 ) ) ( OBJ-AT ?auto_12598 ?auto_12595 ) ( not ( = ?auto_12598 ?auto_12596 ) ) ( OBJ-AT ?auto_12596 ?auto_12599 ) ( TRUCK-AT ?auto_12601 ?auto_12595 ) ( OBJ-AT ?auto_12597 ?auto_12595 ) ( not ( = ?auto_12596 ?auto_12597 ) ) ( not ( = ?auto_12597 ?auto_12598 ) ) )
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
      ?auto_12626 - LOCATION
      ?auto_12628 - CITY
      ?auto_12627 - OBJ
      ?auto_12629 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12626 ?auto_12628 ) ( IN-CITY ?auto_12624 ?auto_12628 ) ( not ( = ?auto_12624 ?auto_12626 ) ) ( not ( = ?auto_12627 ?auto_12625 ) ) ( OBJ-AT ?auto_12625 ?auto_12626 ) ( TRUCK-AT ?auto_12629 ?auto_12624 ) ( IN-TRUCK ?auto_12627 ?auto_12629 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_12627 ?auto_12624 )
      ( DELIVER-2PKG ?auto_12627 ?auto_12625 ?auto_12624 ) )
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
      ?auto_12633 - LOCATION
      ?auto_12634 - CITY
      ?auto_12635 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12633 ?auto_12634 ) ( IN-CITY ?auto_12630 ?auto_12634 ) ( not ( = ?auto_12630 ?auto_12633 ) ) ( not ( = ?auto_12631 ?auto_12632 ) ) ( OBJ-AT ?auto_12632 ?auto_12633 ) ( TRUCK-AT ?auto_12635 ?auto_12630 ) ( IN-TRUCK ?auto_12631 ?auto_12635 ) )
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
      ?auto_12639 - LOCATION
      ?auto_12641 - CITY
      ?auto_12640 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12639 ?auto_12641 ) ( IN-CITY ?auto_12636 ?auto_12641 ) ( not ( = ?auto_12636 ?auto_12639 ) ) ( not ( = ?auto_12638 ?auto_12637 ) ) ( OBJ-AT ?auto_12637 ?auto_12639 ) ( TRUCK-AT ?auto_12640 ?auto_12636 ) ( IN-TRUCK ?auto_12638 ?auto_12640 ) )
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
      ?auto_12702 - LOCATION
      ?auto_12704 - CITY
      ?auto_12701 - OBJ
      ?auto_12703 - TRUCK
      ?auto_12705 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12702 ?auto_12704 ) ( IN-CITY ?auto_12699 ?auto_12704 ) ( not ( = ?auto_12699 ?auto_12702 ) ) ( not ( = ?auto_12701 ?auto_12700 ) ) ( OBJ-AT ?auto_12700 ?auto_12702 ) ( IN-TRUCK ?auto_12701 ?auto_12703 ) ( TRUCK-AT ?auto_12703 ?auto_12705 ) ( IN-CITY ?auto_12705 ?auto_12704 ) ( not ( = ?auto_12699 ?auto_12705 ) ) ( not ( = ?auto_12702 ?auto_12705 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_12703 ?auto_12705 ?auto_12699 ?auto_12704 )
      ( DELIVER-2PKG ?auto_12701 ?auto_12700 ?auto_12699 ) )
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
      ?auto_12712 - LOCATION
      ?auto_12710 - CITY
      ?auto_12711 - TRUCK
      ?auto_12709 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12712 ?auto_12710 ) ( IN-CITY ?auto_12706 ?auto_12710 ) ( not ( = ?auto_12706 ?auto_12712 ) ) ( not ( = ?auto_12707 ?auto_12708 ) ) ( OBJ-AT ?auto_12708 ?auto_12712 ) ( IN-TRUCK ?auto_12707 ?auto_12711 ) ( TRUCK-AT ?auto_12711 ?auto_12709 ) ( IN-CITY ?auto_12709 ?auto_12710 ) ( not ( = ?auto_12706 ?auto_12709 ) ) ( not ( = ?auto_12712 ?auto_12709 ) ) )
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
      ?auto_12716 - LOCATION
      ?auto_12717 - CITY
      ?auto_12718 - TRUCK
      ?auto_12719 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12716 ?auto_12717 ) ( IN-CITY ?auto_12713 ?auto_12717 ) ( not ( = ?auto_12713 ?auto_12716 ) ) ( not ( = ?auto_12715 ?auto_12714 ) ) ( OBJ-AT ?auto_12714 ?auto_12716 ) ( IN-TRUCK ?auto_12715 ?auto_12718 ) ( TRUCK-AT ?auto_12718 ?auto_12719 ) ( IN-CITY ?auto_12719 ?auto_12717 ) ( not ( = ?auto_12713 ?auto_12719 ) ) ( not ( = ?auto_12716 ?auto_12719 ) ) )
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
      ?auto_12787 - LOCATION
      ?auto_12788 - CITY
      ?auto_12789 - OBJ
      ?auto_12790 - TRUCK
      ?auto_12791 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12787 ?auto_12788 ) ( IN-CITY ?auto_12785 ?auto_12788 ) ( not ( = ?auto_12785 ?auto_12787 ) ) ( not ( = ?auto_12789 ?auto_12786 ) ) ( OBJ-AT ?auto_12786 ?auto_12787 ) ( TRUCK-AT ?auto_12790 ?auto_12791 ) ( IN-CITY ?auto_12791 ?auto_12788 ) ( not ( = ?auto_12785 ?auto_12791 ) ) ( not ( = ?auto_12787 ?auto_12791 ) ) ( OBJ-AT ?auto_12789 ?auto_12791 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_12789 ?auto_12790 ?auto_12791 )
      ( DELIVER-2PKG ?auto_12789 ?auto_12786 ?auto_12785 ) )
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
      ?auto_12798 - LOCATION
      ?auto_12795 - CITY
      ?auto_12797 - TRUCK
      ?auto_12796 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12798 ?auto_12795 ) ( IN-CITY ?auto_12792 ?auto_12795 ) ( not ( = ?auto_12792 ?auto_12798 ) ) ( not ( = ?auto_12793 ?auto_12794 ) ) ( OBJ-AT ?auto_12794 ?auto_12798 ) ( TRUCK-AT ?auto_12797 ?auto_12796 ) ( IN-CITY ?auto_12796 ?auto_12795 ) ( not ( = ?auto_12792 ?auto_12796 ) ) ( not ( = ?auto_12798 ?auto_12796 ) ) ( OBJ-AT ?auto_12793 ?auto_12796 ) )
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
      ?auto_12805 - LOCATION
      ?auto_12804 - CITY
      ?auto_12803 - TRUCK
      ?auto_12802 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_12805 ?auto_12804 ) ( IN-CITY ?auto_12799 ?auto_12804 ) ( not ( = ?auto_12799 ?auto_12805 ) ) ( not ( = ?auto_12801 ?auto_12800 ) ) ( OBJ-AT ?auto_12800 ?auto_12805 ) ( TRUCK-AT ?auto_12803 ?auto_12802 ) ( IN-CITY ?auto_12802 ?auto_12804 ) ( not ( = ?auto_12799 ?auto_12802 ) ) ( not ( = ?auto_12805 ?auto_12802 ) ) ( OBJ-AT ?auto_12801 ?auto_12802 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_12801 ?auto_12800 ?auto_12799 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13185 - OBJ
      ?auto_13186 - OBJ
      ?auto_13187 - OBJ
      ?auto_13184 - LOCATION
    )
    :vars
    (
      ?auto_13190 - TRUCK
      ?auto_13189 - LOCATION
      ?auto_13188 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_13186 ?auto_13190 ) ( TRUCK-AT ?auto_13190 ?auto_13189 ) ( IN-CITY ?auto_13189 ?auto_13188 ) ( IN-CITY ?auto_13184 ?auto_13188 ) ( not ( = ?auto_13184 ?auto_13189 ) ) ( OBJ-AT ?auto_13187 ?auto_13184 ) ( not ( = ?auto_13187 ?auto_13186 ) ) ( OBJ-AT ?auto_13185 ?auto_13184 ) ( not ( = ?auto_13185 ?auto_13186 ) ) ( not ( = ?auto_13185 ?auto_13187 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13187 ?auto_13186 ?auto_13184 ) )
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
      ?auto_13338 - OBJ
      ?auto_13339 - OBJ
      ?auto_13340 - OBJ
      ?auto_13337 - LOCATION
    )
    :vars
    (
      ?auto_13342 - TRUCK
      ?auto_13341 - LOCATION
      ?auto_13343 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_13342 ?auto_13341 ) ( IN-CITY ?auto_13341 ?auto_13343 ) ( IN-CITY ?auto_13337 ?auto_13343 ) ( not ( = ?auto_13337 ?auto_13341 ) ) ( OBJ-AT ?auto_13340 ?auto_13337 ) ( not ( = ?auto_13340 ?auto_13339 ) ) ( OBJ-AT ?auto_13339 ?auto_13341 ) ( OBJ-AT ?auto_13338 ?auto_13337 ) ( not ( = ?auto_13338 ?auto_13339 ) ) ( not ( = ?auto_13338 ?auto_13340 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13340 ?auto_13339 ?auto_13337 ) )
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
      ?auto_13513 - OBJ
      ?auto_13514 - OBJ
      ?auto_13515 - OBJ
      ?auto_13512 - LOCATION
    )
    :vars
    (
      ?auto_13517 - LOCATION
      ?auto_13518 - CITY
      ?auto_13519 - OBJ
      ?auto_13516 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13517 ?auto_13518 ) ( IN-CITY ?auto_13512 ?auto_13518 ) ( not ( = ?auto_13512 ?auto_13517 ) ) ( OBJ-AT ?auto_13519 ?auto_13512 ) ( not ( = ?auto_13519 ?auto_13515 ) ) ( OBJ-AT ?auto_13515 ?auto_13517 ) ( TRUCK-AT ?auto_13516 ?auto_13512 ) ( OBJ-AT ?auto_13513 ?auto_13512 ) ( OBJ-AT ?auto_13514 ?auto_13512 ) ( not ( = ?auto_13513 ?auto_13514 ) ) ( not ( = ?auto_13513 ?auto_13515 ) ) ( not ( = ?auto_13513 ?auto_13519 ) ) ( not ( = ?auto_13514 ?auto_13515 ) ) ( not ( = ?auto_13514 ?auto_13519 ) ) )
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
      ?auto_13529 - LOCATION
      ?auto_13530 - CITY
      ?auto_13531 - OBJ
      ?auto_13528 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13529 ?auto_13530 ) ( IN-CITY ?auto_13524 ?auto_13530 ) ( not ( = ?auto_13524 ?auto_13529 ) ) ( OBJ-AT ?auto_13531 ?auto_13524 ) ( not ( = ?auto_13531 ?auto_13526 ) ) ( OBJ-AT ?auto_13526 ?auto_13529 ) ( TRUCK-AT ?auto_13528 ?auto_13524 ) ( OBJ-AT ?auto_13525 ?auto_13524 ) ( OBJ-AT ?auto_13527 ?auto_13524 ) ( not ( = ?auto_13525 ?auto_13526 ) ) ( not ( = ?auto_13525 ?auto_13527 ) ) ( not ( = ?auto_13525 ?auto_13531 ) ) ( not ( = ?auto_13526 ?auto_13527 ) ) ( not ( = ?auto_13527 ?auto_13531 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13531 ?auto_13526 ?auto_13524 ) )
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
      ?auto_13567 - LOCATION
      ?auto_13568 - CITY
      ?auto_13569 - OBJ
      ?auto_13566 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13567 ?auto_13568 ) ( IN-CITY ?auto_13562 ?auto_13568 ) ( not ( = ?auto_13562 ?auto_13567 ) ) ( OBJ-AT ?auto_13569 ?auto_13562 ) ( not ( = ?auto_13569 ?auto_13563 ) ) ( OBJ-AT ?auto_13563 ?auto_13567 ) ( TRUCK-AT ?auto_13566 ?auto_13562 ) ( OBJ-AT ?auto_13564 ?auto_13562 ) ( OBJ-AT ?auto_13565 ?auto_13562 ) ( not ( = ?auto_13563 ?auto_13564 ) ) ( not ( = ?auto_13563 ?auto_13565 ) ) ( not ( = ?auto_13564 ?auto_13565 ) ) ( not ( = ?auto_13564 ?auto_13569 ) ) ( not ( = ?auto_13565 ?auto_13569 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13569 ?auto_13563 ?auto_13562 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13631 - OBJ
      ?auto_13632 - OBJ
      ?auto_13633 - OBJ
      ?auto_13630 - LOCATION
    )
    :vars
    (
      ?auto_13634 - LOCATION
      ?auto_13636 - CITY
      ?auto_13635 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13634 ?auto_13636 ) ( IN-CITY ?auto_13630 ?auto_13636 ) ( not ( = ?auto_13630 ?auto_13634 ) ) ( OBJ-AT ?auto_13631 ?auto_13630 ) ( not ( = ?auto_13631 ?auto_13633 ) ) ( OBJ-AT ?auto_13633 ?auto_13634 ) ( TRUCK-AT ?auto_13635 ?auto_13630 ) ( OBJ-AT ?auto_13632 ?auto_13630 ) ( not ( = ?auto_13631 ?auto_13632 ) ) ( not ( = ?auto_13632 ?auto_13633 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13631 ?auto_13633 ?auto_13630 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13704 - OBJ
      ?auto_13705 - OBJ
      ?auto_13706 - OBJ
      ?auto_13703 - LOCATION
    )
    :vars
    (
      ?auto_13707 - LOCATION
      ?auto_13709 - CITY
      ?auto_13708 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13707 ?auto_13709 ) ( IN-CITY ?auto_13703 ?auto_13709 ) ( not ( = ?auto_13703 ?auto_13707 ) ) ( OBJ-AT ?auto_13705 ?auto_13703 ) ( not ( = ?auto_13705 ?auto_13704 ) ) ( OBJ-AT ?auto_13704 ?auto_13707 ) ( TRUCK-AT ?auto_13708 ?auto_13703 ) ( OBJ-AT ?auto_13706 ?auto_13703 ) ( not ( = ?auto_13704 ?auto_13706 ) ) ( not ( = ?auto_13705 ?auto_13706 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13705 ?auto_13704 ?auto_13703 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13771 - OBJ
      ?auto_13770 - LOCATION
    )
    :vars
    (
      ?auto_13773 - LOCATION
      ?auto_13775 - CITY
      ?auto_13772 - OBJ
      ?auto_13774 - TRUCK
      ?auto_13776 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13773 ?auto_13775 ) ( IN-CITY ?auto_13770 ?auto_13775 ) ( not ( = ?auto_13770 ?auto_13773 ) ) ( OBJ-AT ?auto_13772 ?auto_13770 ) ( not ( = ?auto_13772 ?auto_13771 ) ) ( OBJ-AT ?auto_13771 ?auto_13773 ) ( TRUCK-AT ?auto_13774 ?auto_13776 ) ( IN-CITY ?auto_13776 ?auto_13775 ) ( not ( = ?auto_13770 ?auto_13776 ) ) ( not ( = ?auto_13773 ?auto_13776 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13774 ?auto_13776 ?auto_13770 ?auto_13775 )
      ( DELIVER-2PKG ?auto_13772 ?auto_13771 ?auto_13770 ) )
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
      ?auto_13781 - LOCATION
      ?auto_13782 - CITY
      ?auto_13780 - TRUCK
      ?auto_13783 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13781 ?auto_13782 ) ( IN-CITY ?auto_13777 ?auto_13782 ) ( not ( = ?auto_13777 ?auto_13781 ) ) ( OBJ-AT ?auto_13778 ?auto_13777 ) ( not ( = ?auto_13778 ?auto_13779 ) ) ( OBJ-AT ?auto_13779 ?auto_13781 ) ( TRUCK-AT ?auto_13780 ?auto_13783 ) ( IN-CITY ?auto_13783 ?auto_13782 ) ( not ( = ?auto_13777 ?auto_13783 ) ) ( not ( = ?auto_13781 ?auto_13783 ) ) )
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
      ?auto_13795 - LOCATION
      ?auto_13797 - CITY
      ?auto_13796 - TRUCK
      ?auto_13798 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13795 ?auto_13797 ) ( IN-CITY ?auto_13792 ?auto_13797 ) ( not ( = ?auto_13792 ?auto_13795 ) ) ( OBJ-AT ?auto_13794 ?auto_13792 ) ( not ( = ?auto_13794 ?auto_13793 ) ) ( OBJ-AT ?auto_13793 ?auto_13795 ) ( TRUCK-AT ?auto_13796 ?auto_13798 ) ( IN-CITY ?auto_13798 ?auto_13797 ) ( not ( = ?auto_13792 ?auto_13798 ) ) ( not ( = ?auto_13795 ?auto_13798 ) ) )
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
      ?auto_13819 - LOCATION
      ?auto_13821 - CITY
      ?auto_13820 - TRUCK
      ?auto_13822 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13819 ?auto_13821 ) ( IN-CITY ?auto_13815 ?auto_13821 ) ( not ( = ?auto_13815 ?auto_13819 ) ) ( OBJ-AT ?auto_13816 ?auto_13815 ) ( not ( = ?auto_13816 ?auto_13818 ) ) ( OBJ-AT ?auto_13818 ?auto_13819 ) ( TRUCK-AT ?auto_13820 ?auto_13822 ) ( IN-CITY ?auto_13822 ?auto_13821 ) ( not ( = ?auto_13815 ?auto_13822 ) ) ( not ( = ?auto_13819 ?auto_13822 ) ) ( OBJ-AT ?auto_13817 ?auto_13815 ) ( not ( = ?auto_13816 ?auto_13817 ) ) ( not ( = ?auto_13817 ?auto_13818 ) ) )
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
      ?auto_13835 - LOCATION
      ?auto_13837 - CITY
      ?auto_13836 - TRUCK
      ?auto_13838 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13835 ?auto_13837 ) ( IN-CITY ?auto_13831 ?auto_13837 ) ( not ( = ?auto_13831 ?auto_13835 ) ) ( OBJ-AT ?auto_13834 ?auto_13831 ) ( not ( = ?auto_13834 ?auto_13833 ) ) ( OBJ-AT ?auto_13833 ?auto_13835 ) ( TRUCK-AT ?auto_13836 ?auto_13838 ) ( IN-CITY ?auto_13838 ?auto_13837 ) ( not ( = ?auto_13831 ?auto_13838 ) ) ( not ( = ?auto_13835 ?auto_13838 ) ) ( OBJ-AT ?auto_13832 ?auto_13831 ) ( not ( = ?auto_13832 ?auto_13833 ) ) ( not ( = ?auto_13832 ?auto_13834 ) ) )
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
      ?auto_13902 - LOCATION
      ?auto_13904 - CITY
      ?auto_13903 - TRUCK
      ?auto_13905 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_13902 ?auto_13904 ) ( IN-CITY ?auto_13898 ?auto_13904 ) ( not ( = ?auto_13898 ?auto_13902 ) ) ( OBJ-AT ?auto_13900 ?auto_13898 ) ( not ( = ?auto_13900 ?auto_13899 ) ) ( OBJ-AT ?auto_13899 ?auto_13902 ) ( TRUCK-AT ?auto_13903 ?auto_13905 ) ( IN-CITY ?auto_13905 ?auto_13904 ) ( not ( = ?auto_13898 ?auto_13905 ) ) ( not ( = ?auto_13902 ?auto_13905 ) ) ( OBJ-AT ?auto_13901 ?auto_13898 ) ( not ( = ?auto_13899 ?auto_13901 ) ) ( not ( = ?auto_13900 ?auto_13901 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13900 ?auto_13899 ?auto_13898 ) )
  )

)

