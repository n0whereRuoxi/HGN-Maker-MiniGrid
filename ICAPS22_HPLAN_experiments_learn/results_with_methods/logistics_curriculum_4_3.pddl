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
      ?auto_11265 - OBJ
      ?auto_11264 - LOCATION
    )
    :vars
    (
      ?auto_11267 - LOCATION
      ?auto_11268 - CITY
      ?auto_11266 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11267 ?auto_11268 ) ( IN-CITY ?auto_11264 ?auto_11268 ) ( not ( = ?auto_11264 ?auto_11267 ) ) ( OBJ-AT ?auto_11265 ?auto_11267 ) ( TRUCK-AT ?auto_11266 ?auto_11264 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11266 ?auto_11264 ?auto_11267 ?auto_11268 )
      ( !LOAD-TRUCK ?auto_11265 ?auto_11266 ?auto_11267 )
      ( !DRIVE-TRUCK ?auto_11266 ?auto_11267 ?auto_11264 ?auto_11268 )
      ( !UNLOAD-TRUCK ?auto_11265 ?auto_11266 ?auto_11264 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11272 - OBJ
      ?auto_11271 - LOCATION
    )
    :vars
    (
      ?auto_11274 - LOCATION
      ?auto_11275 - CITY
      ?auto_11273 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11274 ?auto_11275 ) ( IN-CITY ?auto_11271 ?auto_11275 ) ( not ( = ?auto_11271 ?auto_11274 ) ) ( OBJ-AT ?auto_11272 ?auto_11274 ) ( TRUCK-AT ?auto_11273 ?auto_11271 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11273 ?auto_11271 ?auto_11274 ?auto_11275 )
      ( !LOAD-TRUCK ?auto_11272 ?auto_11273 ?auto_11274 )
      ( !DRIVE-TRUCK ?auto_11273 ?auto_11274 ?auto_11271 ?auto_11275 )
      ( !UNLOAD-TRUCK ?auto_11272 ?auto_11273 ?auto_11271 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11286 - OBJ
      ?auto_11287 - OBJ
      ?auto_11285 - LOCATION
    )
    :vars
    (
      ?auto_11289 - LOCATION
      ?auto_11288 - CITY
      ?auto_11291 - LOCATION
      ?auto_11290 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11289 ?auto_11288 ) ( IN-CITY ?auto_11285 ?auto_11288 ) ( not ( = ?auto_11285 ?auto_11289 ) ) ( OBJ-AT ?auto_11287 ?auto_11289 ) ( IN-CITY ?auto_11291 ?auto_11288 ) ( not ( = ?auto_11285 ?auto_11291 ) ) ( OBJ-AT ?auto_11286 ?auto_11291 ) ( TRUCK-AT ?auto_11290 ?auto_11285 ) ( not ( = ?auto_11286 ?auto_11287 ) ) ( not ( = ?auto_11289 ?auto_11291 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_11286 ?auto_11285 )
      ( DELIVER-1PKG ?auto_11287 ?auto_11285 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_11293 - OBJ
      ?auto_11294 - OBJ
      ?auto_11292 - LOCATION
    )
    :vars
    (
      ?auto_11296 - LOCATION
      ?auto_11295 - CITY
      ?auto_11298 - LOCATION
      ?auto_11297 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11296 ?auto_11295 ) ( IN-CITY ?auto_11292 ?auto_11295 ) ( not ( = ?auto_11292 ?auto_11296 ) ) ( OBJ-AT ?auto_11293 ?auto_11296 ) ( IN-CITY ?auto_11298 ?auto_11295 ) ( not ( = ?auto_11292 ?auto_11298 ) ) ( OBJ-AT ?auto_11294 ?auto_11298 ) ( TRUCK-AT ?auto_11297 ?auto_11292 ) ( not ( = ?auto_11294 ?auto_11293 ) ) ( not ( = ?auto_11296 ?auto_11298 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11294 ?auto_11293 ?auto_11292 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11310 - OBJ
      ?auto_11309 - LOCATION
    )
    :vars
    (
      ?auto_11312 - LOCATION
      ?auto_11313 - CITY
      ?auto_11311 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11312 ?auto_11313 ) ( IN-CITY ?auto_11309 ?auto_11313 ) ( not ( = ?auto_11309 ?auto_11312 ) ) ( OBJ-AT ?auto_11310 ?auto_11312 ) ( TRUCK-AT ?auto_11311 ?auto_11309 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11311 ?auto_11309 ?auto_11312 ?auto_11313 )
      ( !LOAD-TRUCK ?auto_11310 ?auto_11311 ?auto_11312 )
      ( !DRIVE-TRUCK ?auto_11311 ?auto_11312 ?auto_11309 ?auto_11313 )
      ( !UNLOAD-TRUCK ?auto_11310 ?auto_11311 ?auto_11309 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11401 - OBJ
      ?auto_11402 - OBJ
      ?auto_11403 - OBJ
      ?auto_11400 - LOCATION
    )
    :vars
    (
      ?auto_11404 - LOCATION
      ?auto_11406 - CITY
      ?auto_11408 - LOCATION
      ?auto_11407 - LOCATION
      ?auto_11405 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11404 ?auto_11406 ) ( IN-CITY ?auto_11400 ?auto_11406 ) ( not ( = ?auto_11400 ?auto_11404 ) ) ( OBJ-AT ?auto_11403 ?auto_11404 ) ( IN-CITY ?auto_11408 ?auto_11406 ) ( not ( = ?auto_11400 ?auto_11408 ) ) ( OBJ-AT ?auto_11402 ?auto_11408 ) ( IN-CITY ?auto_11407 ?auto_11406 ) ( not ( = ?auto_11400 ?auto_11407 ) ) ( OBJ-AT ?auto_11401 ?auto_11407 ) ( TRUCK-AT ?auto_11405 ?auto_11400 ) ( not ( = ?auto_11401 ?auto_11402 ) ) ( not ( = ?auto_11408 ?auto_11407 ) ) ( not ( = ?auto_11401 ?auto_11403 ) ) ( not ( = ?auto_11402 ?auto_11403 ) ) ( not ( = ?auto_11404 ?auto_11408 ) ) ( not ( = ?auto_11404 ?auto_11407 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_11402 ?auto_11401 ?auto_11400 )
      ( DELIVER-1PKG ?auto_11403 ?auto_11400 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11420 - OBJ
      ?auto_11421 - OBJ
      ?auto_11422 - OBJ
      ?auto_11419 - LOCATION
    )
    :vars
    (
      ?auto_11427 - LOCATION
      ?auto_11424 - CITY
      ?auto_11425 - LOCATION
      ?auto_11423 - LOCATION
      ?auto_11426 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11427 ?auto_11424 ) ( IN-CITY ?auto_11419 ?auto_11424 ) ( not ( = ?auto_11419 ?auto_11427 ) ) ( OBJ-AT ?auto_11421 ?auto_11427 ) ( IN-CITY ?auto_11425 ?auto_11424 ) ( not ( = ?auto_11419 ?auto_11425 ) ) ( OBJ-AT ?auto_11422 ?auto_11425 ) ( IN-CITY ?auto_11423 ?auto_11424 ) ( not ( = ?auto_11419 ?auto_11423 ) ) ( OBJ-AT ?auto_11420 ?auto_11423 ) ( TRUCK-AT ?auto_11426 ?auto_11419 ) ( not ( = ?auto_11420 ?auto_11422 ) ) ( not ( = ?auto_11425 ?auto_11423 ) ) ( not ( = ?auto_11420 ?auto_11421 ) ) ( not ( = ?auto_11422 ?auto_11421 ) ) ( not ( = ?auto_11427 ?auto_11425 ) ) ( not ( = ?auto_11427 ?auto_11423 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_11420 ?auto_11422 ?auto_11421 ?auto_11419 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11439 - OBJ
      ?auto_11440 - OBJ
      ?auto_11441 - OBJ
      ?auto_11438 - LOCATION
    )
    :vars
    (
      ?auto_11446 - LOCATION
      ?auto_11442 - CITY
      ?auto_11444 - LOCATION
      ?auto_11445 - LOCATION
      ?auto_11443 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11446 ?auto_11442 ) ( IN-CITY ?auto_11438 ?auto_11442 ) ( not ( = ?auto_11438 ?auto_11446 ) ) ( OBJ-AT ?auto_11441 ?auto_11446 ) ( IN-CITY ?auto_11444 ?auto_11442 ) ( not ( = ?auto_11438 ?auto_11444 ) ) ( OBJ-AT ?auto_11439 ?auto_11444 ) ( IN-CITY ?auto_11445 ?auto_11442 ) ( not ( = ?auto_11438 ?auto_11445 ) ) ( OBJ-AT ?auto_11440 ?auto_11445 ) ( TRUCK-AT ?auto_11443 ?auto_11438 ) ( not ( = ?auto_11440 ?auto_11439 ) ) ( not ( = ?auto_11444 ?auto_11445 ) ) ( not ( = ?auto_11440 ?auto_11441 ) ) ( not ( = ?auto_11439 ?auto_11441 ) ) ( not ( = ?auto_11446 ?auto_11444 ) ) ( not ( = ?auto_11446 ?auto_11445 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_11440 ?auto_11441 ?auto_11439 ?auto_11438 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11458 - OBJ
      ?auto_11459 - OBJ
      ?auto_11460 - OBJ
      ?auto_11457 - LOCATION
    )
    :vars
    (
      ?auto_11465 - LOCATION
      ?auto_11461 - CITY
      ?auto_11463 - LOCATION
      ?auto_11464 - LOCATION
      ?auto_11462 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11465 ?auto_11461 ) ( IN-CITY ?auto_11457 ?auto_11461 ) ( not ( = ?auto_11457 ?auto_11465 ) ) ( OBJ-AT ?auto_11459 ?auto_11465 ) ( IN-CITY ?auto_11463 ?auto_11461 ) ( not ( = ?auto_11457 ?auto_11463 ) ) ( OBJ-AT ?auto_11458 ?auto_11463 ) ( IN-CITY ?auto_11464 ?auto_11461 ) ( not ( = ?auto_11457 ?auto_11464 ) ) ( OBJ-AT ?auto_11460 ?auto_11464 ) ( TRUCK-AT ?auto_11462 ?auto_11457 ) ( not ( = ?auto_11460 ?auto_11458 ) ) ( not ( = ?auto_11463 ?auto_11464 ) ) ( not ( = ?auto_11460 ?auto_11459 ) ) ( not ( = ?auto_11458 ?auto_11459 ) ) ( not ( = ?auto_11465 ?auto_11463 ) ) ( not ( = ?auto_11465 ?auto_11464 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_11460 ?auto_11459 ?auto_11458 ?auto_11457 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11497 - OBJ
      ?auto_11498 - OBJ
      ?auto_11499 - OBJ
      ?auto_11496 - LOCATION
    )
    :vars
    (
      ?auto_11504 - LOCATION
      ?auto_11500 - CITY
      ?auto_11502 - LOCATION
      ?auto_11503 - LOCATION
      ?auto_11501 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11504 ?auto_11500 ) ( IN-CITY ?auto_11496 ?auto_11500 ) ( not ( = ?auto_11496 ?auto_11504 ) ) ( OBJ-AT ?auto_11497 ?auto_11504 ) ( IN-CITY ?auto_11502 ?auto_11500 ) ( not ( = ?auto_11496 ?auto_11502 ) ) ( OBJ-AT ?auto_11499 ?auto_11502 ) ( IN-CITY ?auto_11503 ?auto_11500 ) ( not ( = ?auto_11496 ?auto_11503 ) ) ( OBJ-AT ?auto_11498 ?auto_11503 ) ( TRUCK-AT ?auto_11501 ?auto_11496 ) ( not ( = ?auto_11498 ?auto_11499 ) ) ( not ( = ?auto_11502 ?auto_11503 ) ) ( not ( = ?auto_11498 ?auto_11497 ) ) ( not ( = ?auto_11499 ?auto_11497 ) ) ( not ( = ?auto_11504 ?auto_11502 ) ) ( not ( = ?auto_11504 ?auto_11503 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_11498 ?auto_11497 ?auto_11499 ?auto_11496 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_11516 - OBJ
      ?auto_11517 - OBJ
      ?auto_11518 - OBJ
      ?auto_11515 - LOCATION
    )
    :vars
    (
      ?auto_11523 - LOCATION
      ?auto_11519 - CITY
      ?auto_11521 - LOCATION
      ?auto_11522 - LOCATION
      ?auto_11520 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11523 ?auto_11519 ) ( IN-CITY ?auto_11515 ?auto_11519 ) ( not ( = ?auto_11515 ?auto_11523 ) ) ( OBJ-AT ?auto_11516 ?auto_11523 ) ( IN-CITY ?auto_11521 ?auto_11519 ) ( not ( = ?auto_11515 ?auto_11521 ) ) ( OBJ-AT ?auto_11517 ?auto_11521 ) ( IN-CITY ?auto_11522 ?auto_11519 ) ( not ( = ?auto_11515 ?auto_11522 ) ) ( OBJ-AT ?auto_11518 ?auto_11522 ) ( TRUCK-AT ?auto_11520 ?auto_11515 ) ( not ( = ?auto_11518 ?auto_11517 ) ) ( not ( = ?auto_11521 ?auto_11522 ) ) ( not ( = ?auto_11518 ?auto_11516 ) ) ( not ( = ?auto_11517 ?auto_11516 ) ) ( not ( = ?auto_11523 ?auto_11521 ) ) ( not ( = ?auto_11523 ?auto_11522 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_11518 ?auto_11516 ?auto_11517 ?auto_11515 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_11578 - OBJ
      ?auto_11577 - LOCATION
    )
    :vars
    (
      ?auto_11580 - LOCATION
      ?auto_11581 - CITY
      ?auto_11579 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_11580 ?auto_11581 ) ( IN-CITY ?auto_11577 ?auto_11581 ) ( not ( = ?auto_11577 ?auto_11580 ) ) ( OBJ-AT ?auto_11578 ?auto_11580 ) ( TRUCK-AT ?auto_11579 ?auto_11577 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11579 ?auto_11577 ?auto_11580 ?auto_11581 )
      ( !LOAD-TRUCK ?auto_11578 ?auto_11579 ?auto_11580 )
      ( !DRIVE-TRUCK ?auto_11579 ?auto_11580 ?auto_11577 ?auto_11581 )
      ( !UNLOAD-TRUCK ?auto_11578 ?auto_11579 ?auto_11577 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12569 - OBJ
      ?auto_12570 - OBJ
      ?auto_12571 - OBJ
      ?auto_12572 - OBJ
      ?auto_12568 - LOCATION
    )
    :vars
    (
      ?auto_12573 - LOCATION
      ?auto_12575 - CITY
      ?auto_12578 - LOCATION
      ?auto_12576 - LOCATION
      ?auto_12577 - LOCATION
      ?auto_12574 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12573 ?auto_12575 ) ( IN-CITY ?auto_12568 ?auto_12575 ) ( not ( = ?auto_12568 ?auto_12573 ) ) ( OBJ-AT ?auto_12572 ?auto_12573 ) ( IN-CITY ?auto_12578 ?auto_12575 ) ( not ( = ?auto_12568 ?auto_12578 ) ) ( OBJ-AT ?auto_12571 ?auto_12578 ) ( IN-CITY ?auto_12576 ?auto_12575 ) ( not ( = ?auto_12568 ?auto_12576 ) ) ( OBJ-AT ?auto_12570 ?auto_12576 ) ( IN-CITY ?auto_12577 ?auto_12575 ) ( not ( = ?auto_12568 ?auto_12577 ) ) ( OBJ-AT ?auto_12569 ?auto_12577 ) ( TRUCK-AT ?auto_12574 ?auto_12568 ) ( not ( = ?auto_12569 ?auto_12570 ) ) ( not ( = ?auto_12576 ?auto_12577 ) ) ( not ( = ?auto_12569 ?auto_12571 ) ) ( not ( = ?auto_12570 ?auto_12571 ) ) ( not ( = ?auto_12578 ?auto_12576 ) ) ( not ( = ?auto_12578 ?auto_12577 ) ) ( not ( = ?auto_12569 ?auto_12572 ) ) ( not ( = ?auto_12570 ?auto_12572 ) ) ( not ( = ?auto_12571 ?auto_12572 ) ) ( not ( = ?auto_12573 ?auto_12578 ) ) ( not ( = ?auto_12573 ?auto_12576 ) ) ( not ( = ?auto_12573 ?auto_12577 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_12569 ?auto_12571 ?auto_12570 ?auto_12568 )
      ( DELIVER-1PKG ?auto_12572 ?auto_12568 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12604 - OBJ
      ?auto_12605 - OBJ
      ?auto_12606 - OBJ
      ?auto_12607 - OBJ
      ?auto_12603 - LOCATION
    )
    :vars
    (
      ?auto_12611 - LOCATION
      ?auto_12609 - CITY
      ?auto_12613 - LOCATION
      ?auto_12612 - LOCATION
      ?auto_12608 - LOCATION
      ?auto_12610 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12611 ?auto_12609 ) ( IN-CITY ?auto_12603 ?auto_12609 ) ( not ( = ?auto_12603 ?auto_12611 ) ) ( OBJ-AT ?auto_12606 ?auto_12611 ) ( IN-CITY ?auto_12613 ?auto_12609 ) ( not ( = ?auto_12603 ?auto_12613 ) ) ( OBJ-AT ?auto_12607 ?auto_12613 ) ( IN-CITY ?auto_12612 ?auto_12609 ) ( not ( = ?auto_12603 ?auto_12612 ) ) ( OBJ-AT ?auto_12605 ?auto_12612 ) ( IN-CITY ?auto_12608 ?auto_12609 ) ( not ( = ?auto_12603 ?auto_12608 ) ) ( OBJ-AT ?auto_12604 ?auto_12608 ) ( TRUCK-AT ?auto_12610 ?auto_12603 ) ( not ( = ?auto_12604 ?auto_12605 ) ) ( not ( = ?auto_12612 ?auto_12608 ) ) ( not ( = ?auto_12604 ?auto_12607 ) ) ( not ( = ?auto_12605 ?auto_12607 ) ) ( not ( = ?auto_12613 ?auto_12612 ) ) ( not ( = ?auto_12613 ?auto_12608 ) ) ( not ( = ?auto_12604 ?auto_12606 ) ) ( not ( = ?auto_12605 ?auto_12606 ) ) ( not ( = ?auto_12607 ?auto_12606 ) ) ( not ( = ?auto_12611 ?auto_12613 ) ) ( not ( = ?auto_12611 ?auto_12612 ) ) ( not ( = ?auto_12611 ?auto_12608 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12604 ?auto_12605 ?auto_12607 ?auto_12606 ?auto_12603 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12639 - OBJ
      ?auto_12640 - OBJ
      ?auto_12641 - OBJ
      ?auto_12642 - OBJ
      ?auto_12638 - LOCATION
    )
    :vars
    (
      ?auto_12647 - LOCATION
      ?auto_12646 - CITY
      ?auto_12643 - LOCATION
      ?auto_12644 - LOCATION
      ?auto_12648 - LOCATION
      ?auto_12645 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12647 ?auto_12646 ) ( IN-CITY ?auto_12638 ?auto_12646 ) ( not ( = ?auto_12638 ?auto_12647 ) ) ( OBJ-AT ?auto_12642 ?auto_12647 ) ( IN-CITY ?auto_12643 ?auto_12646 ) ( not ( = ?auto_12638 ?auto_12643 ) ) ( OBJ-AT ?auto_12640 ?auto_12643 ) ( IN-CITY ?auto_12644 ?auto_12646 ) ( not ( = ?auto_12638 ?auto_12644 ) ) ( OBJ-AT ?auto_12641 ?auto_12644 ) ( IN-CITY ?auto_12648 ?auto_12646 ) ( not ( = ?auto_12638 ?auto_12648 ) ) ( OBJ-AT ?auto_12639 ?auto_12648 ) ( TRUCK-AT ?auto_12645 ?auto_12638 ) ( not ( = ?auto_12639 ?auto_12641 ) ) ( not ( = ?auto_12644 ?auto_12648 ) ) ( not ( = ?auto_12639 ?auto_12640 ) ) ( not ( = ?auto_12641 ?auto_12640 ) ) ( not ( = ?auto_12643 ?auto_12644 ) ) ( not ( = ?auto_12643 ?auto_12648 ) ) ( not ( = ?auto_12639 ?auto_12642 ) ) ( not ( = ?auto_12641 ?auto_12642 ) ) ( not ( = ?auto_12640 ?auto_12642 ) ) ( not ( = ?auto_12647 ?auto_12643 ) ) ( not ( = ?auto_12647 ?auto_12644 ) ) ( not ( = ?auto_12647 ?auto_12648 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12639 ?auto_12641 ?auto_12642 ?auto_12640 ?auto_12638 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12674 - OBJ
      ?auto_12675 - OBJ
      ?auto_12676 - OBJ
      ?auto_12677 - OBJ
      ?auto_12673 - LOCATION
    )
    :vars
    (
      ?auto_12682 - LOCATION
      ?auto_12681 - CITY
      ?auto_12678 - LOCATION
      ?auto_12679 - LOCATION
      ?auto_12683 - LOCATION
      ?auto_12680 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12682 ?auto_12681 ) ( IN-CITY ?auto_12673 ?auto_12681 ) ( not ( = ?auto_12673 ?auto_12682 ) ) ( OBJ-AT ?auto_12676 ?auto_12682 ) ( IN-CITY ?auto_12678 ?auto_12681 ) ( not ( = ?auto_12673 ?auto_12678 ) ) ( OBJ-AT ?auto_12675 ?auto_12678 ) ( IN-CITY ?auto_12679 ?auto_12681 ) ( not ( = ?auto_12673 ?auto_12679 ) ) ( OBJ-AT ?auto_12677 ?auto_12679 ) ( IN-CITY ?auto_12683 ?auto_12681 ) ( not ( = ?auto_12673 ?auto_12683 ) ) ( OBJ-AT ?auto_12674 ?auto_12683 ) ( TRUCK-AT ?auto_12680 ?auto_12673 ) ( not ( = ?auto_12674 ?auto_12677 ) ) ( not ( = ?auto_12679 ?auto_12683 ) ) ( not ( = ?auto_12674 ?auto_12675 ) ) ( not ( = ?auto_12677 ?auto_12675 ) ) ( not ( = ?auto_12678 ?auto_12679 ) ) ( not ( = ?auto_12678 ?auto_12683 ) ) ( not ( = ?auto_12674 ?auto_12676 ) ) ( not ( = ?auto_12677 ?auto_12676 ) ) ( not ( = ?auto_12675 ?auto_12676 ) ) ( not ( = ?auto_12682 ?auto_12678 ) ) ( not ( = ?auto_12682 ?auto_12679 ) ) ( not ( = ?auto_12682 ?auto_12683 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12674 ?auto_12677 ?auto_12676 ?auto_12675 ?auto_12673 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12783 - OBJ
      ?auto_12784 - OBJ
      ?auto_12785 - OBJ
      ?auto_12786 - OBJ
      ?auto_12782 - LOCATION
    )
    :vars
    (
      ?auto_12791 - LOCATION
      ?auto_12790 - CITY
      ?auto_12787 - LOCATION
      ?auto_12788 - LOCATION
      ?auto_12792 - LOCATION
      ?auto_12789 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12791 ?auto_12790 ) ( IN-CITY ?auto_12782 ?auto_12790 ) ( not ( = ?auto_12782 ?auto_12791 ) ) ( OBJ-AT ?auto_12784 ?auto_12791 ) ( IN-CITY ?auto_12787 ?auto_12790 ) ( not ( = ?auto_12782 ?auto_12787 ) ) ( OBJ-AT ?auto_12786 ?auto_12787 ) ( IN-CITY ?auto_12788 ?auto_12790 ) ( not ( = ?auto_12782 ?auto_12788 ) ) ( OBJ-AT ?auto_12785 ?auto_12788 ) ( IN-CITY ?auto_12792 ?auto_12790 ) ( not ( = ?auto_12782 ?auto_12792 ) ) ( OBJ-AT ?auto_12783 ?auto_12792 ) ( TRUCK-AT ?auto_12789 ?auto_12782 ) ( not ( = ?auto_12783 ?auto_12785 ) ) ( not ( = ?auto_12788 ?auto_12792 ) ) ( not ( = ?auto_12783 ?auto_12786 ) ) ( not ( = ?auto_12785 ?auto_12786 ) ) ( not ( = ?auto_12787 ?auto_12788 ) ) ( not ( = ?auto_12787 ?auto_12792 ) ) ( not ( = ?auto_12783 ?auto_12784 ) ) ( not ( = ?auto_12785 ?auto_12784 ) ) ( not ( = ?auto_12786 ?auto_12784 ) ) ( not ( = ?auto_12791 ?auto_12787 ) ) ( not ( = ?auto_12791 ?auto_12788 ) ) ( not ( = ?auto_12791 ?auto_12792 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12783 ?auto_12785 ?auto_12784 ?auto_12786 ?auto_12782 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12818 - OBJ
      ?auto_12819 - OBJ
      ?auto_12820 - OBJ
      ?auto_12821 - OBJ
      ?auto_12817 - LOCATION
    )
    :vars
    (
      ?auto_12826 - LOCATION
      ?auto_12825 - CITY
      ?auto_12822 - LOCATION
      ?auto_12823 - LOCATION
      ?auto_12827 - LOCATION
      ?auto_12824 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12826 ?auto_12825 ) ( IN-CITY ?auto_12817 ?auto_12825 ) ( not ( = ?auto_12817 ?auto_12826 ) ) ( OBJ-AT ?auto_12819 ?auto_12826 ) ( IN-CITY ?auto_12822 ?auto_12825 ) ( not ( = ?auto_12817 ?auto_12822 ) ) ( OBJ-AT ?auto_12820 ?auto_12822 ) ( IN-CITY ?auto_12823 ?auto_12825 ) ( not ( = ?auto_12817 ?auto_12823 ) ) ( OBJ-AT ?auto_12821 ?auto_12823 ) ( IN-CITY ?auto_12827 ?auto_12825 ) ( not ( = ?auto_12817 ?auto_12827 ) ) ( OBJ-AT ?auto_12818 ?auto_12827 ) ( TRUCK-AT ?auto_12824 ?auto_12817 ) ( not ( = ?auto_12818 ?auto_12821 ) ) ( not ( = ?auto_12823 ?auto_12827 ) ) ( not ( = ?auto_12818 ?auto_12820 ) ) ( not ( = ?auto_12821 ?auto_12820 ) ) ( not ( = ?auto_12822 ?auto_12823 ) ) ( not ( = ?auto_12822 ?auto_12827 ) ) ( not ( = ?auto_12818 ?auto_12819 ) ) ( not ( = ?auto_12821 ?auto_12819 ) ) ( not ( = ?auto_12820 ?auto_12819 ) ) ( not ( = ?auto_12826 ?auto_12822 ) ) ( not ( = ?auto_12826 ?auto_12823 ) ) ( not ( = ?auto_12826 ?auto_12827 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12818 ?auto_12821 ?auto_12819 ?auto_12820 ?auto_12817 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12927 - OBJ
      ?auto_12928 - OBJ
      ?auto_12929 - OBJ
      ?auto_12930 - OBJ
      ?auto_12926 - LOCATION
    )
    :vars
    (
      ?auto_12935 - LOCATION
      ?auto_12934 - CITY
      ?auto_12931 - LOCATION
      ?auto_12932 - LOCATION
      ?auto_12936 - LOCATION
      ?auto_12933 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12935 ?auto_12934 ) ( IN-CITY ?auto_12926 ?auto_12934 ) ( not ( = ?auto_12926 ?auto_12935 ) ) ( OBJ-AT ?auto_12930 ?auto_12935 ) ( IN-CITY ?auto_12931 ?auto_12934 ) ( not ( = ?auto_12926 ?auto_12931 ) ) ( OBJ-AT ?auto_12929 ?auto_12931 ) ( IN-CITY ?auto_12932 ?auto_12934 ) ( not ( = ?auto_12926 ?auto_12932 ) ) ( OBJ-AT ?auto_12927 ?auto_12932 ) ( IN-CITY ?auto_12936 ?auto_12934 ) ( not ( = ?auto_12926 ?auto_12936 ) ) ( OBJ-AT ?auto_12928 ?auto_12936 ) ( TRUCK-AT ?auto_12933 ?auto_12926 ) ( not ( = ?auto_12928 ?auto_12927 ) ) ( not ( = ?auto_12932 ?auto_12936 ) ) ( not ( = ?auto_12928 ?auto_12929 ) ) ( not ( = ?auto_12927 ?auto_12929 ) ) ( not ( = ?auto_12931 ?auto_12932 ) ) ( not ( = ?auto_12931 ?auto_12936 ) ) ( not ( = ?auto_12928 ?auto_12930 ) ) ( not ( = ?auto_12927 ?auto_12930 ) ) ( not ( = ?auto_12929 ?auto_12930 ) ) ( not ( = ?auto_12935 ?auto_12931 ) ) ( not ( = ?auto_12935 ?auto_12932 ) ) ( not ( = ?auto_12935 ?auto_12936 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12928 ?auto_12927 ?auto_12930 ?auto_12929 ?auto_12926 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_12962 - OBJ
      ?auto_12963 - OBJ
      ?auto_12964 - OBJ
      ?auto_12965 - OBJ
      ?auto_12961 - LOCATION
    )
    :vars
    (
      ?auto_12970 - LOCATION
      ?auto_12969 - CITY
      ?auto_12966 - LOCATION
      ?auto_12967 - LOCATION
      ?auto_12971 - LOCATION
      ?auto_12968 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12970 ?auto_12969 ) ( IN-CITY ?auto_12961 ?auto_12969 ) ( not ( = ?auto_12961 ?auto_12970 ) ) ( OBJ-AT ?auto_12964 ?auto_12970 ) ( IN-CITY ?auto_12966 ?auto_12969 ) ( not ( = ?auto_12961 ?auto_12966 ) ) ( OBJ-AT ?auto_12965 ?auto_12966 ) ( IN-CITY ?auto_12967 ?auto_12969 ) ( not ( = ?auto_12961 ?auto_12967 ) ) ( OBJ-AT ?auto_12962 ?auto_12967 ) ( IN-CITY ?auto_12971 ?auto_12969 ) ( not ( = ?auto_12961 ?auto_12971 ) ) ( OBJ-AT ?auto_12963 ?auto_12971 ) ( TRUCK-AT ?auto_12968 ?auto_12961 ) ( not ( = ?auto_12963 ?auto_12962 ) ) ( not ( = ?auto_12967 ?auto_12971 ) ) ( not ( = ?auto_12963 ?auto_12965 ) ) ( not ( = ?auto_12962 ?auto_12965 ) ) ( not ( = ?auto_12966 ?auto_12967 ) ) ( not ( = ?auto_12966 ?auto_12971 ) ) ( not ( = ?auto_12963 ?auto_12964 ) ) ( not ( = ?auto_12962 ?auto_12964 ) ) ( not ( = ?auto_12965 ?auto_12964 ) ) ( not ( = ?auto_12970 ?auto_12966 ) ) ( not ( = ?auto_12970 ?auto_12967 ) ) ( not ( = ?auto_12970 ?auto_12971 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_12963 ?auto_12962 ?auto_12964 ?auto_12965 ?auto_12961 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13072 - OBJ
      ?auto_13073 - OBJ
      ?auto_13074 - OBJ
      ?auto_13075 - OBJ
      ?auto_13071 - LOCATION
    )
    :vars
    (
      ?auto_13080 - LOCATION
      ?auto_13079 - CITY
      ?auto_13076 - LOCATION
      ?auto_13077 - LOCATION
      ?auto_13081 - LOCATION
      ?auto_13078 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13080 ?auto_13079 ) ( IN-CITY ?auto_13071 ?auto_13079 ) ( not ( = ?auto_13071 ?auto_13080 ) ) ( OBJ-AT ?auto_13075 ?auto_13080 ) ( IN-CITY ?auto_13076 ?auto_13079 ) ( not ( = ?auto_13071 ?auto_13076 ) ) ( OBJ-AT ?auto_13073 ?auto_13076 ) ( IN-CITY ?auto_13077 ?auto_13079 ) ( not ( = ?auto_13071 ?auto_13077 ) ) ( OBJ-AT ?auto_13072 ?auto_13077 ) ( IN-CITY ?auto_13081 ?auto_13079 ) ( not ( = ?auto_13071 ?auto_13081 ) ) ( OBJ-AT ?auto_13074 ?auto_13081 ) ( TRUCK-AT ?auto_13078 ?auto_13071 ) ( not ( = ?auto_13074 ?auto_13072 ) ) ( not ( = ?auto_13077 ?auto_13081 ) ) ( not ( = ?auto_13074 ?auto_13073 ) ) ( not ( = ?auto_13072 ?auto_13073 ) ) ( not ( = ?auto_13076 ?auto_13077 ) ) ( not ( = ?auto_13076 ?auto_13081 ) ) ( not ( = ?auto_13074 ?auto_13075 ) ) ( not ( = ?auto_13072 ?auto_13075 ) ) ( not ( = ?auto_13073 ?auto_13075 ) ) ( not ( = ?auto_13080 ?auto_13076 ) ) ( not ( = ?auto_13080 ?auto_13077 ) ) ( not ( = ?auto_13080 ?auto_13081 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13074 ?auto_13072 ?auto_13075 ?auto_13073 ?auto_13071 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13107 - OBJ
      ?auto_13108 - OBJ
      ?auto_13109 - OBJ
      ?auto_13110 - OBJ
      ?auto_13106 - LOCATION
    )
    :vars
    (
      ?auto_13115 - LOCATION
      ?auto_13114 - CITY
      ?auto_13111 - LOCATION
      ?auto_13112 - LOCATION
      ?auto_13116 - LOCATION
      ?auto_13113 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13115 ?auto_13114 ) ( IN-CITY ?auto_13106 ?auto_13114 ) ( not ( = ?auto_13106 ?auto_13115 ) ) ( OBJ-AT ?auto_13109 ?auto_13115 ) ( IN-CITY ?auto_13111 ?auto_13114 ) ( not ( = ?auto_13106 ?auto_13111 ) ) ( OBJ-AT ?auto_13108 ?auto_13111 ) ( IN-CITY ?auto_13112 ?auto_13114 ) ( not ( = ?auto_13106 ?auto_13112 ) ) ( OBJ-AT ?auto_13107 ?auto_13112 ) ( IN-CITY ?auto_13116 ?auto_13114 ) ( not ( = ?auto_13106 ?auto_13116 ) ) ( OBJ-AT ?auto_13110 ?auto_13116 ) ( TRUCK-AT ?auto_13113 ?auto_13106 ) ( not ( = ?auto_13110 ?auto_13107 ) ) ( not ( = ?auto_13112 ?auto_13116 ) ) ( not ( = ?auto_13110 ?auto_13108 ) ) ( not ( = ?auto_13107 ?auto_13108 ) ) ( not ( = ?auto_13111 ?auto_13112 ) ) ( not ( = ?auto_13111 ?auto_13116 ) ) ( not ( = ?auto_13110 ?auto_13109 ) ) ( not ( = ?auto_13107 ?auto_13109 ) ) ( not ( = ?auto_13108 ?auto_13109 ) ) ( not ( = ?auto_13115 ?auto_13111 ) ) ( not ( = ?auto_13115 ?auto_13112 ) ) ( not ( = ?auto_13115 ?auto_13116 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13110 ?auto_13107 ?auto_13109 ?auto_13108 ?auto_13106 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13178 - OBJ
      ?auto_13179 - OBJ
      ?auto_13180 - OBJ
      ?auto_13181 - OBJ
      ?auto_13177 - LOCATION
    )
    :vars
    (
      ?auto_13186 - LOCATION
      ?auto_13185 - CITY
      ?auto_13182 - LOCATION
      ?auto_13183 - LOCATION
      ?auto_13187 - LOCATION
      ?auto_13184 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13186 ?auto_13185 ) ( IN-CITY ?auto_13177 ?auto_13185 ) ( not ( = ?auto_13177 ?auto_13186 ) ) ( OBJ-AT ?auto_13179 ?auto_13186 ) ( IN-CITY ?auto_13182 ?auto_13185 ) ( not ( = ?auto_13177 ?auto_13182 ) ) ( OBJ-AT ?auto_13181 ?auto_13182 ) ( IN-CITY ?auto_13183 ?auto_13185 ) ( not ( = ?auto_13177 ?auto_13183 ) ) ( OBJ-AT ?auto_13178 ?auto_13183 ) ( IN-CITY ?auto_13187 ?auto_13185 ) ( not ( = ?auto_13177 ?auto_13187 ) ) ( OBJ-AT ?auto_13180 ?auto_13187 ) ( TRUCK-AT ?auto_13184 ?auto_13177 ) ( not ( = ?auto_13180 ?auto_13178 ) ) ( not ( = ?auto_13183 ?auto_13187 ) ) ( not ( = ?auto_13180 ?auto_13181 ) ) ( not ( = ?auto_13178 ?auto_13181 ) ) ( not ( = ?auto_13182 ?auto_13183 ) ) ( not ( = ?auto_13182 ?auto_13187 ) ) ( not ( = ?auto_13180 ?auto_13179 ) ) ( not ( = ?auto_13178 ?auto_13179 ) ) ( not ( = ?auto_13181 ?auto_13179 ) ) ( not ( = ?auto_13186 ?auto_13182 ) ) ( not ( = ?auto_13186 ?auto_13183 ) ) ( not ( = ?auto_13186 ?auto_13187 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13180 ?auto_13178 ?auto_13179 ?auto_13181 ?auto_13177 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13251 - OBJ
      ?auto_13252 - OBJ
      ?auto_13253 - OBJ
      ?auto_13254 - OBJ
      ?auto_13250 - LOCATION
    )
    :vars
    (
      ?auto_13259 - LOCATION
      ?auto_13258 - CITY
      ?auto_13255 - LOCATION
      ?auto_13256 - LOCATION
      ?auto_13260 - LOCATION
      ?auto_13257 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13259 ?auto_13258 ) ( IN-CITY ?auto_13250 ?auto_13258 ) ( not ( = ?auto_13250 ?auto_13259 ) ) ( OBJ-AT ?auto_13252 ?auto_13259 ) ( IN-CITY ?auto_13255 ?auto_13258 ) ( not ( = ?auto_13250 ?auto_13255 ) ) ( OBJ-AT ?auto_13253 ?auto_13255 ) ( IN-CITY ?auto_13256 ?auto_13258 ) ( not ( = ?auto_13250 ?auto_13256 ) ) ( OBJ-AT ?auto_13251 ?auto_13256 ) ( IN-CITY ?auto_13260 ?auto_13258 ) ( not ( = ?auto_13250 ?auto_13260 ) ) ( OBJ-AT ?auto_13254 ?auto_13260 ) ( TRUCK-AT ?auto_13257 ?auto_13250 ) ( not ( = ?auto_13254 ?auto_13251 ) ) ( not ( = ?auto_13256 ?auto_13260 ) ) ( not ( = ?auto_13254 ?auto_13253 ) ) ( not ( = ?auto_13251 ?auto_13253 ) ) ( not ( = ?auto_13255 ?auto_13256 ) ) ( not ( = ?auto_13255 ?auto_13260 ) ) ( not ( = ?auto_13254 ?auto_13252 ) ) ( not ( = ?auto_13251 ?auto_13252 ) ) ( not ( = ?auto_13253 ?auto_13252 ) ) ( not ( = ?auto_13259 ?auto_13255 ) ) ( not ( = ?auto_13259 ?auto_13256 ) ) ( not ( = ?auto_13259 ?auto_13260 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13254 ?auto_13251 ?auto_13252 ?auto_13253 ?auto_13250 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13360 - OBJ
      ?auto_13361 - OBJ
      ?auto_13362 - OBJ
      ?auto_13363 - OBJ
      ?auto_13359 - LOCATION
    )
    :vars
    (
      ?auto_13368 - LOCATION
      ?auto_13367 - CITY
      ?auto_13364 - LOCATION
      ?auto_13365 - LOCATION
      ?auto_13369 - LOCATION
      ?auto_13366 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13368 ?auto_13367 ) ( IN-CITY ?auto_13359 ?auto_13367 ) ( not ( = ?auto_13359 ?auto_13368 ) ) ( OBJ-AT ?auto_13363 ?auto_13368 ) ( IN-CITY ?auto_13364 ?auto_13367 ) ( not ( = ?auto_13359 ?auto_13364 ) ) ( OBJ-AT ?auto_13360 ?auto_13364 ) ( IN-CITY ?auto_13365 ?auto_13367 ) ( not ( = ?auto_13359 ?auto_13365 ) ) ( OBJ-AT ?auto_13362 ?auto_13365 ) ( IN-CITY ?auto_13369 ?auto_13367 ) ( not ( = ?auto_13359 ?auto_13369 ) ) ( OBJ-AT ?auto_13361 ?auto_13369 ) ( TRUCK-AT ?auto_13366 ?auto_13359 ) ( not ( = ?auto_13361 ?auto_13362 ) ) ( not ( = ?auto_13365 ?auto_13369 ) ) ( not ( = ?auto_13361 ?auto_13360 ) ) ( not ( = ?auto_13362 ?auto_13360 ) ) ( not ( = ?auto_13364 ?auto_13365 ) ) ( not ( = ?auto_13364 ?auto_13369 ) ) ( not ( = ?auto_13361 ?auto_13363 ) ) ( not ( = ?auto_13362 ?auto_13363 ) ) ( not ( = ?auto_13360 ?auto_13363 ) ) ( not ( = ?auto_13368 ?auto_13364 ) ) ( not ( = ?auto_13368 ?auto_13365 ) ) ( not ( = ?auto_13368 ?auto_13369 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13361 ?auto_13362 ?auto_13363 ?auto_13360 ?auto_13359 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13395 - OBJ
      ?auto_13396 - OBJ
      ?auto_13397 - OBJ
      ?auto_13398 - OBJ
      ?auto_13394 - LOCATION
    )
    :vars
    (
      ?auto_13403 - LOCATION
      ?auto_13402 - CITY
      ?auto_13399 - LOCATION
      ?auto_13400 - LOCATION
      ?auto_13404 - LOCATION
      ?auto_13401 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13403 ?auto_13402 ) ( IN-CITY ?auto_13394 ?auto_13402 ) ( not ( = ?auto_13394 ?auto_13403 ) ) ( OBJ-AT ?auto_13397 ?auto_13403 ) ( IN-CITY ?auto_13399 ?auto_13402 ) ( not ( = ?auto_13394 ?auto_13399 ) ) ( OBJ-AT ?auto_13395 ?auto_13399 ) ( IN-CITY ?auto_13400 ?auto_13402 ) ( not ( = ?auto_13394 ?auto_13400 ) ) ( OBJ-AT ?auto_13398 ?auto_13400 ) ( IN-CITY ?auto_13404 ?auto_13402 ) ( not ( = ?auto_13394 ?auto_13404 ) ) ( OBJ-AT ?auto_13396 ?auto_13404 ) ( TRUCK-AT ?auto_13401 ?auto_13394 ) ( not ( = ?auto_13396 ?auto_13398 ) ) ( not ( = ?auto_13400 ?auto_13404 ) ) ( not ( = ?auto_13396 ?auto_13395 ) ) ( not ( = ?auto_13398 ?auto_13395 ) ) ( not ( = ?auto_13399 ?auto_13400 ) ) ( not ( = ?auto_13399 ?auto_13404 ) ) ( not ( = ?auto_13396 ?auto_13397 ) ) ( not ( = ?auto_13398 ?auto_13397 ) ) ( not ( = ?auto_13395 ?auto_13397 ) ) ( not ( = ?auto_13403 ?auto_13399 ) ) ( not ( = ?auto_13403 ?auto_13400 ) ) ( not ( = ?auto_13403 ?auto_13404 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13396 ?auto_13398 ?auto_13397 ?auto_13395 ?auto_13394 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13430 - OBJ
      ?auto_13431 - OBJ
      ?auto_13432 - OBJ
      ?auto_13433 - OBJ
      ?auto_13429 - LOCATION
    )
    :vars
    (
      ?auto_13438 - LOCATION
      ?auto_13437 - CITY
      ?auto_13434 - LOCATION
      ?auto_13435 - LOCATION
      ?auto_13439 - LOCATION
      ?auto_13436 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13438 ?auto_13437 ) ( IN-CITY ?auto_13429 ?auto_13437 ) ( not ( = ?auto_13429 ?auto_13438 ) ) ( OBJ-AT ?auto_13433 ?auto_13438 ) ( IN-CITY ?auto_13434 ?auto_13437 ) ( not ( = ?auto_13429 ?auto_13434 ) ) ( OBJ-AT ?auto_13430 ?auto_13434 ) ( IN-CITY ?auto_13435 ?auto_13437 ) ( not ( = ?auto_13429 ?auto_13435 ) ) ( OBJ-AT ?auto_13431 ?auto_13435 ) ( IN-CITY ?auto_13439 ?auto_13437 ) ( not ( = ?auto_13429 ?auto_13439 ) ) ( OBJ-AT ?auto_13432 ?auto_13439 ) ( TRUCK-AT ?auto_13436 ?auto_13429 ) ( not ( = ?auto_13432 ?auto_13431 ) ) ( not ( = ?auto_13435 ?auto_13439 ) ) ( not ( = ?auto_13432 ?auto_13430 ) ) ( not ( = ?auto_13431 ?auto_13430 ) ) ( not ( = ?auto_13434 ?auto_13435 ) ) ( not ( = ?auto_13434 ?auto_13439 ) ) ( not ( = ?auto_13432 ?auto_13433 ) ) ( not ( = ?auto_13431 ?auto_13433 ) ) ( not ( = ?auto_13430 ?auto_13433 ) ) ( not ( = ?auto_13438 ?auto_13434 ) ) ( not ( = ?auto_13438 ?auto_13435 ) ) ( not ( = ?auto_13438 ?auto_13439 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13432 ?auto_13431 ?auto_13433 ?auto_13430 ?auto_13429 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13465 - OBJ
      ?auto_13466 - OBJ
      ?auto_13467 - OBJ
      ?auto_13468 - OBJ
      ?auto_13464 - LOCATION
    )
    :vars
    (
      ?auto_13473 - LOCATION
      ?auto_13472 - CITY
      ?auto_13469 - LOCATION
      ?auto_13470 - LOCATION
      ?auto_13474 - LOCATION
      ?auto_13471 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13473 ?auto_13472 ) ( IN-CITY ?auto_13464 ?auto_13472 ) ( not ( = ?auto_13464 ?auto_13473 ) ) ( OBJ-AT ?auto_13467 ?auto_13473 ) ( IN-CITY ?auto_13469 ?auto_13472 ) ( not ( = ?auto_13464 ?auto_13469 ) ) ( OBJ-AT ?auto_13465 ?auto_13469 ) ( IN-CITY ?auto_13470 ?auto_13472 ) ( not ( = ?auto_13464 ?auto_13470 ) ) ( OBJ-AT ?auto_13466 ?auto_13470 ) ( IN-CITY ?auto_13474 ?auto_13472 ) ( not ( = ?auto_13464 ?auto_13474 ) ) ( OBJ-AT ?auto_13468 ?auto_13474 ) ( TRUCK-AT ?auto_13471 ?auto_13464 ) ( not ( = ?auto_13468 ?auto_13466 ) ) ( not ( = ?auto_13470 ?auto_13474 ) ) ( not ( = ?auto_13468 ?auto_13465 ) ) ( not ( = ?auto_13466 ?auto_13465 ) ) ( not ( = ?auto_13469 ?auto_13470 ) ) ( not ( = ?auto_13469 ?auto_13474 ) ) ( not ( = ?auto_13468 ?auto_13467 ) ) ( not ( = ?auto_13466 ?auto_13467 ) ) ( not ( = ?auto_13465 ?auto_13467 ) ) ( not ( = ?auto_13473 ?auto_13469 ) ) ( not ( = ?auto_13473 ?auto_13470 ) ) ( not ( = ?auto_13473 ?auto_13474 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13468 ?auto_13466 ?auto_13467 ?auto_13465 ?auto_13464 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13611 - OBJ
      ?auto_13612 - OBJ
      ?auto_13613 - OBJ
      ?auto_13614 - OBJ
      ?auto_13610 - LOCATION
    )
    :vars
    (
      ?auto_13619 - LOCATION
      ?auto_13618 - CITY
      ?auto_13615 - LOCATION
      ?auto_13616 - LOCATION
      ?auto_13620 - LOCATION
      ?auto_13617 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13619 ?auto_13618 ) ( IN-CITY ?auto_13610 ?auto_13618 ) ( not ( = ?auto_13610 ?auto_13619 ) ) ( OBJ-AT ?auto_13612 ?auto_13619 ) ( IN-CITY ?auto_13615 ?auto_13618 ) ( not ( = ?auto_13610 ?auto_13615 ) ) ( OBJ-AT ?auto_13611 ?auto_13615 ) ( IN-CITY ?auto_13616 ?auto_13618 ) ( not ( = ?auto_13610 ?auto_13616 ) ) ( OBJ-AT ?auto_13614 ?auto_13616 ) ( IN-CITY ?auto_13620 ?auto_13618 ) ( not ( = ?auto_13610 ?auto_13620 ) ) ( OBJ-AT ?auto_13613 ?auto_13620 ) ( TRUCK-AT ?auto_13617 ?auto_13610 ) ( not ( = ?auto_13613 ?auto_13614 ) ) ( not ( = ?auto_13616 ?auto_13620 ) ) ( not ( = ?auto_13613 ?auto_13611 ) ) ( not ( = ?auto_13614 ?auto_13611 ) ) ( not ( = ?auto_13615 ?auto_13616 ) ) ( not ( = ?auto_13615 ?auto_13620 ) ) ( not ( = ?auto_13613 ?auto_13612 ) ) ( not ( = ?auto_13614 ?auto_13612 ) ) ( not ( = ?auto_13611 ?auto_13612 ) ) ( not ( = ?auto_13619 ?auto_13615 ) ) ( not ( = ?auto_13619 ?auto_13616 ) ) ( not ( = ?auto_13619 ?auto_13620 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13613 ?auto_13614 ?auto_13612 ?auto_13611 ?auto_13610 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13646 - OBJ
      ?auto_13647 - OBJ
      ?auto_13648 - OBJ
      ?auto_13649 - OBJ
      ?auto_13645 - LOCATION
    )
    :vars
    (
      ?auto_13654 - LOCATION
      ?auto_13653 - CITY
      ?auto_13650 - LOCATION
      ?auto_13651 - LOCATION
      ?auto_13655 - LOCATION
      ?auto_13652 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13654 ?auto_13653 ) ( IN-CITY ?auto_13645 ?auto_13653 ) ( not ( = ?auto_13645 ?auto_13654 ) ) ( OBJ-AT ?auto_13647 ?auto_13654 ) ( IN-CITY ?auto_13650 ?auto_13653 ) ( not ( = ?auto_13645 ?auto_13650 ) ) ( OBJ-AT ?auto_13646 ?auto_13650 ) ( IN-CITY ?auto_13651 ?auto_13653 ) ( not ( = ?auto_13645 ?auto_13651 ) ) ( OBJ-AT ?auto_13648 ?auto_13651 ) ( IN-CITY ?auto_13655 ?auto_13653 ) ( not ( = ?auto_13645 ?auto_13655 ) ) ( OBJ-AT ?auto_13649 ?auto_13655 ) ( TRUCK-AT ?auto_13652 ?auto_13645 ) ( not ( = ?auto_13649 ?auto_13648 ) ) ( not ( = ?auto_13651 ?auto_13655 ) ) ( not ( = ?auto_13649 ?auto_13646 ) ) ( not ( = ?auto_13648 ?auto_13646 ) ) ( not ( = ?auto_13650 ?auto_13651 ) ) ( not ( = ?auto_13650 ?auto_13655 ) ) ( not ( = ?auto_13649 ?auto_13647 ) ) ( not ( = ?auto_13648 ?auto_13647 ) ) ( not ( = ?auto_13646 ?auto_13647 ) ) ( not ( = ?auto_13654 ?auto_13650 ) ) ( not ( = ?auto_13654 ?auto_13651 ) ) ( not ( = ?auto_13654 ?auto_13655 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13649 ?auto_13648 ?auto_13647 ?auto_13646 ?auto_13645 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13867 - OBJ
      ?auto_13868 - OBJ
      ?auto_13869 - OBJ
      ?auto_13870 - OBJ
      ?auto_13866 - LOCATION
    )
    :vars
    (
      ?auto_13875 - LOCATION
      ?auto_13874 - CITY
      ?auto_13871 - LOCATION
      ?auto_13872 - LOCATION
      ?auto_13876 - LOCATION
      ?auto_13873 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13875 ?auto_13874 ) ( IN-CITY ?auto_13866 ?auto_13874 ) ( not ( = ?auto_13866 ?auto_13875 ) ) ( OBJ-AT ?auto_13867 ?auto_13875 ) ( IN-CITY ?auto_13871 ?auto_13874 ) ( not ( = ?auto_13866 ?auto_13871 ) ) ( OBJ-AT ?auto_13870 ?auto_13871 ) ( IN-CITY ?auto_13872 ?auto_13874 ) ( not ( = ?auto_13866 ?auto_13872 ) ) ( OBJ-AT ?auto_13869 ?auto_13872 ) ( IN-CITY ?auto_13876 ?auto_13874 ) ( not ( = ?auto_13866 ?auto_13876 ) ) ( OBJ-AT ?auto_13868 ?auto_13876 ) ( TRUCK-AT ?auto_13873 ?auto_13866 ) ( not ( = ?auto_13868 ?auto_13869 ) ) ( not ( = ?auto_13872 ?auto_13876 ) ) ( not ( = ?auto_13868 ?auto_13870 ) ) ( not ( = ?auto_13869 ?auto_13870 ) ) ( not ( = ?auto_13871 ?auto_13872 ) ) ( not ( = ?auto_13871 ?auto_13876 ) ) ( not ( = ?auto_13868 ?auto_13867 ) ) ( not ( = ?auto_13869 ?auto_13867 ) ) ( not ( = ?auto_13870 ?auto_13867 ) ) ( not ( = ?auto_13875 ?auto_13871 ) ) ( not ( = ?auto_13875 ?auto_13872 ) ) ( not ( = ?auto_13875 ?auto_13876 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13868 ?auto_13869 ?auto_13867 ?auto_13870 ?auto_13866 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_13902 - OBJ
      ?auto_13903 - OBJ
      ?auto_13904 - OBJ
      ?auto_13905 - OBJ
      ?auto_13901 - LOCATION
    )
    :vars
    (
      ?auto_13910 - LOCATION
      ?auto_13909 - CITY
      ?auto_13906 - LOCATION
      ?auto_13907 - LOCATION
      ?auto_13911 - LOCATION
      ?auto_13908 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13910 ?auto_13909 ) ( IN-CITY ?auto_13901 ?auto_13909 ) ( not ( = ?auto_13901 ?auto_13910 ) ) ( OBJ-AT ?auto_13902 ?auto_13910 ) ( IN-CITY ?auto_13906 ?auto_13909 ) ( not ( = ?auto_13901 ?auto_13906 ) ) ( OBJ-AT ?auto_13904 ?auto_13906 ) ( IN-CITY ?auto_13907 ?auto_13909 ) ( not ( = ?auto_13901 ?auto_13907 ) ) ( OBJ-AT ?auto_13905 ?auto_13907 ) ( IN-CITY ?auto_13911 ?auto_13909 ) ( not ( = ?auto_13901 ?auto_13911 ) ) ( OBJ-AT ?auto_13903 ?auto_13911 ) ( TRUCK-AT ?auto_13908 ?auto_13901 ) ( not ( = ?auto_13903 ?auto_13905 ) ) ( not ( = ?auto_13907 ?auto_13911 ) ) ( not ( = ?auto_13903 ?auto_13904 ) ) ( not ( = ?auto_13905 ?auto_13904 ) ) ( not ( = ?auto_13906 ?auto_13907 ) ) ( not ( = ?auto_13906 ?auto_13911 ) ) ( not ( = ?auto_13903 ?auto_13902 ) ) ( not ( = ?auto_13905 ?auto_13902 ) ) ( not ( = ?auto_13904 ?auto_13902 ) ) ( not ( = ?auto_13910 ?auto_13906 ) ) ( not ( = ?auto_13910 ?auto_13907 ) ) ( not ( = ?auto_13910 ?auto_13911 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_13903 ?auto_13905 ?auto_13902 ?auto_13904 ?auto_13901 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14011 - OBJ
      ?auto_14012 - OBJ
      ?auto_14013 - OBJ
      ?auto_14014 - OBJ
      ?auto_14010 - LOCATION
    )
    :vars
    (
      ?auto_14019 - LOCATION
      ?auto_14018 - CITY
      ?auto_14015 - LOCATION
      ?auto_14016 - LOCATION
      ?auto_14020 - LOCATION
      ?auto_14017 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14019 ?auto_14018 ) ( IN-CITY ?auto_14010 ?auto_14018 ) ( not ( = ?auto_14010 ?auto_14019 ) ) ( OBJ-AT ?auto_14011 ?auto_14019 ) ( IN-CITY ?auto_14015 ?auto_14018 ) ( not ( = ?auto_14010 ?auto_14015 ) ) ( OBJ-AT ?auto_14014 ?auto_14015 ) ( IN-CITY ?auto_14016 ?auto_14018 ) ( not ( = ?auto_14010 ?auto_14016 ) ) ( OBJ-AT ?auto_14012 ?auto_14016 ) ( IN-CITY ?auto_14020 ?auto_14018 ) ( not ( = ?auto_14010 ?auto_14020 ) ) ( OBJ-AT ?auto_14013 ?auto_14020 ) ( TRUCK-AT ?auto_14017 ?auto_14010 ) ( not ( = ?auto_14013 ?auto_14012 ) ) ( not ( = ?auto_14016 ?auto_14020 ) ) ( not ( = ?auto_14013 ?auto_14014 ) ) ( not ( = ?auto_14012 ?auto_14014 ) ) ( not ( = ?auto_14015 ?auto_14016 ) ) ( not ( = ?auto_14015 ?auto_14020 ) ) ( not ( = ?auto_14013 ?auto_14011 ) ) ( not ( = ?auto_14012 ?auto_14011 ) ) ( not ( = ?auto_14014 ?auto_14011 ) ) ( not ( = ?auto_14019 ?auto_14015 ) ) ( not ( = ?auto_14019 ?auto_14016 ) ) ( not ( = ?auto_14019 ?auto_14020 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_14013 ?auto_14012 ?auto_14011 ?auto_14014 ?auto_14010 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14084 - OBJ
      ?auto_14085 - OBJ
      ?auto_14086 - OBJ
      ?auto_14087 - OBJ
      ?auto_14083 - LOCATION
    )
    :vars
    (
      ?auto_14092 - LOCATION
      ?auto_14091 - CITY
      ?auto_14088 - LOCATION
      ?auto_14089 - LOCATION
      ?auto_14093 - LOCATION
      ?auto_14090 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14092 ?auto_14091 ) ( IN-CITY ?auto_14083 ?auto_14091 ) ( not ( = ?auto_14083 ?auto_14092 ) ) ( OBJ-AT ?auto_14084 ?auto_14092 ) ( IN-CITY ?auto_14088 ?auto_14091 ) ( not ( = ?auto_14083 ?auto_14088 ) ) ( OBJ-AT ?auto_14086 ?auto_14088 ) ( IN-CITY ?auto_14089 ?auto_14091 ) ( not ( = ?auto_14083 ?auto_14089 ) ) ( OBJ-AT ?auto_14085 ?auto_14089 ) ( IN-CITY ?auto_14093 ?auto_14091 ) ( not ( = ?auto_14083 ?auto_14093 ) ) ( OBJ-AT ?auto_14087 ?auto_14093 ) ( TRUCK-AT ?auto_14090 ?auto_14083 ) ( not ( = ?auto_14087 ?auto_14085 ) ) ( not ( = ?auto_14089 ?auto_14093 ) ) ( not ( = ?auto_14087 ?auto_14086 ) ) ( not ( = ?auto_14085 ?auto_14086 ) ) ( not ( = ?auto_14088 ?auto_14089 ) ) ( not ( = ?auto_14088 ?auto_14093 ) ) ( not ( = ?auto_14087 ?auto_14084 ) ) ( not ( = ?auto_14085 ?auto_14084 ) ) ( not ( = ?auto_14086 ?auto_14084 ) ) ( not ( = ?auto_14092 ?auto_14088 ) ) ( not ( = ?auto_14092 ?auto_14089 ) ) ( not ( = ?auto_14092 ?auto_14093 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_14087 ?auto_14085 ?auto_14084 ?auto_14086 ?auto_14083 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14193 - OBJ
      ?auto_14194 - OBJ
      ?auto_14195 - OBJ
      ?auto_14196 - OBJ
      ?auto_14192 - LOCATION
    )
    :vars
    (
      ?auto_14201 - LOCATION
      ?auto_14200 - CITY
      ?auto_14197 - LOCATION
      ?auto_14198 - LOCATION
      ?auto_14202 - LOCATION
      ?auto_14199 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14201 ?auto_14200 ) ( IN-CITY ?auto_14192 ?auto_14200 ) ( not ( = ?auto_14192 ?auto_14201 ) ) ( OBJ-AT ?auto_14193 ?auto_14201 ) ( IN-CITY ?auto_14197 ?auto_14200 ) ( not ( = ?auto_14192 ?auto_14197 ) ) ( OBJ-AT ?auto_14194 ?auto_14197 ) ( IN-CITY ?auto_14198 ?auto_14200 ) ( not ( = ?auto_14192 ?auto_14198 ) ) ( OBJ-AT ?auto_14196 ?auto_14198 ) ( IN-CITY ?auto_14202 ?auto_14200 ) ( not ( = ?auto_14192 ?auto_14202 ) ) ( OBJ-AT ?auto_14195 ?auto_14202 ) ( TRUCK-AT ?auto_14199 ?auto_14192 ) ( not ( = ?auto_14195 ?auto_14196 ) ) ( not ( = ?auto_14198 ?auto_14202 ) ) ( not ( = ?auto_14195 ?auto_14194 ) ) ( not ( = ?auto_14196 ?auto_14194 ) ) ( not ( = ?auto_14197 ?auto_14198 ) ) ( not ( = ?auto_14197 ?auto_14202 ) ) ( not ( = ?auto_14195 ?auto_14193 ) ) ( not ( = ?auto_14196 ?auto_14193 ) ) ( not ( = ?auto_14194 ?auto_14193 ) ) ( not ( = ?auto_14201 ?auto_14197 ) ) ( not ( = ?auto_14201 ?auto_14198 ) ) ( not ( = ?auto_14201 ?auto_14202 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_14195 ?auto_14196 ?auto_14193 ?auto_14194 ?auto_14192 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14228 - OBJ
      ?auto_14229 - OBJ
      ?auto_14230 - OBJ
      ?auto_14231 - OBJ
      ?auto_14227 - LOCATION
    )
    :vars
    (
      ?auto_14236 - LOCATION
      ?auto_14235 - CITY
      ?auto_14232 - LOCATION
      ?auto_14233 - LOCATION
      ?auto_14237 - LOCATION
      ?auto_14234 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14236 ?auto_14235 ) ( IN-CITY ?auto_14227 ?auto_14235 ) ( not ( = ?auto_14227 ?auto_14236 ) ) ( OBJ-AT ?auto_14228 ?auto_14236 ) ( IN-CITY ?auto_14232 ?auto_14235 ) ( not ( = ?auto_14227 ?auto_14232 ) ) ( OBJ-AT ?auto_14229 ?auto_14232 ) ( IN-CITY ?auto_14233 ?auto_14235 ) ( not ( = ?auto_14227 ?auto_14233 ) ) ( OBJ-AT ?auto_14230 ?auto_14233 ) ( IN-CITY ?auto_14237 ?auto_14235 ) ( not ( = ?auto_14227 ?auto_14237 ) ) ( OBJ-AT ?auto_14231 ?auto_14237 ) ( TRUCK-AT ?auto_14234 ?auto_14227 ) ( not ( = ?auto_14231 ?auto_14230 ) ) ( not ( = ?auto_14233 ?auto_14237 ) ) ( not ( = ?auto_14231 ?auto_14229 ) ) ( not ( = ?auto_14230 ?auto_14229 ) ) ( not ( = ?auto_14232 ?auto_14233 ) ) ( not ( = ?auto_14232 ?auto_14237 ) ) ( not ( = ?auto_14231 ?auto_14228 ) ) ( not ( = ?auto_14230 ?auto_14228 ) ) ( not ( = ?auto_14229 ?auto_14228 ) ) ( not ( = ?auto_14236 ?auto_14232 ) ) ( not ( = ?auto_14236 ?auto_14233 ) ) ( not ( = ?auto_14236 ?auto_14237 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_14231 ?auto_14230 ?auto_14228 ?auto_14229 ?auto_14227 ) )
  )

)

