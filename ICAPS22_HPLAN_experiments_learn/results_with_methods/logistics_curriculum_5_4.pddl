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
      ?auto_190202 - OBJ
      ?auto_190201 - LOCATION
    )
    :vars
    (
      ?auto_190204 - LOCATION
      ?auto_190205 - CITY
      ?auto_190203 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_190204 ?auto_190205 ) ( IN-CITY ?auto_190201 ?auto_190205 ) ( not ( = ?auto_190201 ?auto_190204 ) ) ( OBJ-AT ?auto_190202 ?auto_190204 ) ( TRUCK-AT ?auto_190203 ?auto_190201 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_190203 ?auto_190201 ?auto_190204 ?auto_190205 )
      ( !LOAD-TRUCK ?auto_190202 ?auto_190203 ?auto_190204 )
      ( !DRIVE-TRUCK ?auto_190203 ?auto_190204 ?auto_190201 ?auto_190205 )
      ( !UNLOAD-TRUCK ?auto_190202 ?auto_190203 ?auto_190201 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_190209 - OBJ
      ?auto_190208 - LOCATION
    )
    :vars
    (
      ?auto_190211 - LOCATION
      ?auto_190212 - CITY
      ?auto_190210 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_190211 ?auto_190212 ) ( IN-CITY ?auto_190208 ?auto_190212 ) ( not ( = ?auto_190208 ?auto_190211 ) ) ( OBJ-AT ?auto_190209 ?auto_190211 ) ( TRUCK-AT ?auto_190210 ?auto_190208 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_190210 ?auto_190208 ?auto_190211 ?auto_190212 )
      ( !LOAD-TRUCK ?auto_190209 ?auto_190210 ?auto_190211 )
      ( !DRIVE-TRUCK ?auto_190210 ?auto_190211 ?auto_190208 ?auto_190212 )
      ( !UNLOAD-TRUCK ?auto_190209 ?auto_190210 ?auto_190208 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_190223 - OBJ
      ?auto_190224 - OBJ
      ?auto_190222 - LOCATION
    )
    :vars
    (
      ?auto_190226 - LOCATION
      ?auto_190227 - CITY
      ?auto_190228 - LOCATION
      ?auto_190225 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_190226 ?auto_190227 ) ( IN-CITY ?auto_190222 ?auto_190227 ) ( not ( = ?auto_190222 ?auto_190226 ) ) ( OBJ-AT ?auto_190224 ?auto_190226 ) ( IN-CITY ?auto_190228 ?auto_190227 ) ( not ( = ?auto_190222 ?auto_190228 ) ) ( OBJ-AT ?auto_190223 ?auto_190228 ) ( TRUCK-AT ?auto_190225 ?auto_190222 ) ( not ( = ?auto_190223 ?auto_190224 ) ) ( not ( = ?auto_190226 ?auto_190228 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_190223 ?auto_190222 )
      ( DELIVER-1PKG ?auto_190224 ?auto_190222 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_190230 - OBJ
      ?auto_190231 - OBJ
      ?auto_190229 - LOCATION
    )
    :vars
    (
      ?auto_190233 - LOCATION
      ?auto_190232 - CITY
      ?auto_190234 - LOCATION
      ?auto_190235 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_190233 ?auto_190232 ) ( IN-CITY ?auto_190229 ?auto_190232 ) ( not ( = ?auto_190229 ?auto_190233 ) ) ( OBJ-AT ?auto_190230 ?auto_190233 ) ( IN-CITY ?auto_190234 ?auto_190232 ) ( not ( = ?auto_190229 ?auto_190234 ) ) ( OBJ-AT ?auto_190231 ?auto_190234 ) ( TRUCK-AT ?auto_190235 ?auto_190229 ) ( not ( = ?auto_190231 ?auto_190230 ) ) ( not ( = ?auto_190233 ?auto_190234 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190231 ?auto_190230 ?auto_190229 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_190247 - OBJ
      ?auto_190246 - LOCATION
    )
    :vars
    (
      ?auto_190249 - LOCATION
      ?auto_190250 - CITY
      ?auto_190248 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_190249 ?auto_190250 ) ( IN-CITY ?auto_190246 ?auto_190250 ) ( not ( = ?auto_190246 ?auto_190249 ) ) ( OBJ-AT ?auto_190247 ?auto_190249 ) ( TRUCK-AT ?auto_190248 ?auto_190246 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_190248 ?auto_190246 ?auto_190249 ?auto_190250 )
      ( !LOAD-TRUCK ?auto_190247 ?auto_190248 ?auto_190249 )
      ( !DRIVE-TRUCK ?auto_190248 ?auto_190249 ?auto_190246 ?auto_190250 )
      ( !UNLOAD-TRUCK ?auto_190247 ?auto_190248 ?auto_190246 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190337 - OBJ
      ?auto_190338 - OBJ
      ?auto_190339 - OBJ
      ?auto_190336 - LOCATION
    )
    :vars
    (
      ?auto_190341 - LOCATION
      ?auto_190342 - CITY
      ?auto_190343 - LOCATION
      ?auto_190340 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_190341 ?auto_190342 ) ( IN-CITY ?auto_190336 ?auto_190342 ) ( not ( = ?auto_190336 ?auto_190341 ) ) ( OBJ-AT ?auto_190339 ?auto_190341 ) ( IN-CITY ?auto_190343 ?auto_190342 ) ( not ( = ?auto_190336 ?auto_190343 ) ) ( OBJ-AT ?auto_190338 ?auto_190343 ) ( OBJ-AT ?auto_190337 ?auto_190341 ) ( TRUCK-AT ?auto_190340 ?auto_190336 ) ( not ( = ?auto_190337 ?auto_190338 ) ) ( not ( = ?auto_190343 ?auto_190341 ) ) ( not ( = ?auto_190337 ?auto_190339 ) ) ( not ( = ?auto_190338 ?auto_190339 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_190338 ?auto_190337 ?auto_190336 )
      ( DELIVER-1PKG ?auto_190339 ?auto_190336 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190354 - OBJ
      ?auto_190355 - OBJ
      ?auto_190356 - OBJ
      ?auto_190353 - LOCATION
    )
    :vars
    (
      ?auto_190360 - LOCATION
      ?auto_190358 - CITY
      ?auto_190359 - LOCATION
      ?auto_190357 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_190360 ?auto_190358 ) ( IN-CITY ?auto_190353 ?auto_190358 ) ( not ( = ?auto_190353 ?auto_190360 ) ) ( OBJ-AT ?auto_190355 ?auto_190360 ) ( IN-CITY ?auto_190359 ?auto_190358 ) ( not ( = ?auto_190353 ?auto_190359 ) ) ( OBJ-AT ?auto_190356 ?auto_190359 ) ( OBJ-AT ?auto_190354 ?auto_190360 ) ( TRUCK-AT ?auto_190357 ?auto_190353 ) ( not ( = ?auto_190354 ?auto_190356 ) ) ( not ( = ?auto_190359 ?auto_190360 ) ) ( not ( = ?auto_190354 ?auto_190355 ) ) ( not ( = ?auto_190356 ?auto_190355 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_190354 ?auto_190356 ?auto_190355 ?auto_190353 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190371 - OBJ
      ?auto_190372 - OBJ
      ?auto_190373 - OBJ
      ?auto_190370 - LOCATION
    )
    :vars
    (
      ?auto_190374 - LOCATION
      ?auto_190376 - CITY
      ?auto_190375 - LOCATION
      ?auto_190377 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_190374 ?auto_190376 ) ( IN-CITY ?auto_190370 ?auto_190376 ) ( not ( = ?auto_190370 ?auto_190374 ) ) ( OBJ-AT ?auto_190373 ?auto_190374 ) ( IN-CITY ?auto_190375 ?auto_190376 ) ( not ( = ?auto_190370 ?auto_190375 ) ) ( OBJ-AT ?auto_190371 ?auto_190375 ) ( OBJ-AT ?auto_190372 ?auto_190374 ) ( TRUCK-AT ?auto_190377 ?auto_190370 ) ( not ( = ?auto_190372 ?auto_190371 ) ) ( not ( = ?auto_190375 ?auto_190374 ) ) ( not ( = ?auto_190372 ?auto_190373 ) ) ( not ( = ?auto_190371 ?auto_190373 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_190372 ?auto_190373 ?auto_190371 ?auto_190370 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190388 - OBJ
      ?auto_190389 - OBJ
      ?auto_190390 - OBJ
      ?auto_190387 - LOCATION
    )
    :vars
    (
      ?auto_190391 - LOCATION
      ?auto_190393 - CITY
      ?auto_190392 - LOCATION
      ?auto_190394 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_190391 ?auto_190393 ) ( IN-CITY ?auto_190387 ?auto_190393 ) ( not ( = ?auto_190387 ?auto_190391 ) ) ( OBJ-AT ?auto_190389 ?auto_190391 ) ( IN-CITY ?auto_190392 ?auto_190393 ) ( not ( = ?auto_190387 ?auto_190392 ) ) ( OBJ-AT ?auto_190388 ?auto_190392 ) ( OBJ-AT ?auto_190390 ?auto_190391 ) ( TRUCK-AT ?auto_190394 ?auto_190387 ) ( not ( = ?auto_190390 ?auto_190388 ) ) ( not ( = ?auto_190392 ?auto_190391 ) ) ( not ( = ?auto_190390 ?auto_190389 ) ) ( not ( = ?auto_190388 ?auto_190389 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_190390 ?auto_190389 ?auto_190388 ?auto_190387 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190423 - OBJ
      ?auto_190424 - OBJ
      ?auto_190425 - OBJ
      ?auto_190422 - LOCATION
    )
    :vars
    (
      ?auto_190426 - LOCATION
      ?auto_190428 - CITY
      ?auto_190427 - LOCATION
      ?auto_190429 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_190426 ?auto_190428 ) ( IN-CITY ?auto_190422 ?auto_190428 ) ( not ( = ?auto_190422 ?auto_190426 ) ) ( OBJ-AT ?auto_190423 ?auto_190426 ) ( IN-CITY ?auto_190427 ?auto_190428 ) ( not ( = ?auto_190422 ?auto_190427 ) ) ( OBJ-AT ?auto_190425 ?auto_190427 ) ( OBJ-AT ?auto_190424 ?auto_190426 ) ( TRUCK-AT ?auto_190429 ?auto_190422 ) ( not ( = ?auto_190424 ?auto_190425 ) ) ( not ( = ?auto_190427 ?auto_190426 ) ) ( not ( = ?auto_190424 ?auto_190423 ) ) ( not ( = ?auto_190425 ?auto_190423 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_190424 ?auto_190423 ?auto_190425 ?auto_190422 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_190440 - OBJ
      ?auto_190441 - OBJ
      ?auto_190442 - OBJ
      ?auto_190439 - LOCATION
    )
    :vars
    (
      ?auto_190443 - LOCATION
      ?auto_190445 - CITY
      ?auto_190444 - LOCATION
      ?auto_190446 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_190443 ?auto_190445 ) ( IN-CITY ?auto_190439 ?auto_190445 ) ( not ( = ?auto_190439 ?auto_190443 ) ) ( OBJ-AT ?auto_190440 ?auto_190443 ) ( IN-CITY ?auto_190444 ?auto_190445 ) ( not ( = ?auto_190439 ?auto_190444 ) ) ( OBJ-AT ?auto_190441 ?auto_190444 ) ( OBJ-AT ?auto_190442 ?auto_190443 ) ( TRUCK-AT ?auto_190446 ?auto_190439 ) ( not ( = ?auto_190442 ?auto_190441 ) ) ( not ( = ?auto_190444 ?auto_190443 ) ) ( not ( = ?auto_190442 ?auto_190440 ) ) ( not ( = ?auto_190441 ?auto_190440 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_190442 ?auto_190440 ?auto_190441 ?auto_190439 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_190496 - OBJ
      ?auto_190495 - LOCATION
    )
    :vars
    (
      ?auto_190498 - LOCATION
      ?auto_190499 - CITY
      ?auto_190497 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_190498 ?auto_190499 ) ( IN-CITY ?auto_190495 ?auto_190499 ) ( not ( = ?auto_190495 ?auto_190498 ) ) ( OBJ-AT ?auto_190496 ?auto_190498 ) ( TRUCK-AT ?auto_190497 ?auto_190495 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_190497 ?auto_190495 ?auto_190498 ?auto_190499 )
      ( !LOAD-TRUCK ?auto_190496 ?auto_190497 ?auto_190498 )
      ( !DRIVE-TRUCK ?auto_190497 ?auto_190498 ?auto_190495 ?auto_190499 )
      ( !UNLOAD-TRUCK ?auto_190496 ?auto_190497 ?auto_190495 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191469 - OBJ
      ?auto_191470 - OBJ
      ?auto_191471 - OBJ
      ?auto_191472 - OBJ
      ?auto_191468 - LOCATION
    )
    :vars
    (
      ?auto_191473 - LOCATION
      ?auto_191475 - CITY
      ?auto_191476 - LOCATION
      ?auto_191474 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191473 ?auto_191475 ) ( IN-CITY ?auto_191468 ?auto_191475 ) ( not ( = ?auto_191468 ?auto_191473 ) ) ( OBJ-AT ?auto_191472 ?auto_191473 ) ( IN-CITY ?auto_191476 ?auto_191475 ) ( not ( = ?auto_191468 ?auto_191476 ) ) ( OBJ-AT ?auto_191471 ?auto_191476 ) ( OBJ-AT ?auto_191470 ?auto_191473 ) ( OBJ-AT ?auto_191469 ?auto_191476 ) ( TRUCK-AT ?auto_191474 ?auto_191468 ) ( not ( = ?auto_191469 ?auto_191470 ) ) ( not ( = ?auto_191473 ?auto_191476 ) ) ( not ( = ?auto_191469 ?auto_191471 ) ) ( not ( = ?auto_191470 ?auto_191471 ) ) ( not ( = ?auto_191469 ?auto_191472 ) ) ( not ( = ?auto_191470 ?auto_191472 ) ) ( not ( = ?auto_191471 ?auto_191472 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_191469 ?auto_191471 ?auto_191470 ?auto_191468 )
      ( DELIVER-1PKG ?auto_191472 ?auto_191468 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191498 - OBJ
      ?auto_191499 - OBJ
      ?auto_191500 - OBJ
      ?auto_191501 - OBJ
      ?auto_191497 - LOCATION
    )
    :vars
    (
      ?auto_191502 - LOCATION
      ?auto_191505 - CITY
      ?auto_191504 - LOCATION
      ?auto_191503 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191502 ?auto_191505 ) ( IN-CITY ?auto_191497 ?auto_191505 ) ( not ( = ?auto_191497 ?auto_191502 ) ) ( OBJ-AT ?auto_191500 ?auto_191502 ) ( IN-CITY ?auto_191504 ?auto_191505 ) ( not ( = ?auto_191497 ?auto_191504 ) ) ( OBJ-AT ?auto_191501 ?auto_191504 ) ( OBJ-AT ?auto_191499 ?auto_191502 ) ( OBJ-AT ?auto_191498 ?auto_191504 ) ( TRUCK-AT ?auto_191503 ?auto_191497 ) ( not ( = ?auto_191498 ?auto_191499 ) ) ( not ( = ?auto_191502 ?auto_191504 ) ) ( not ( = ?auto_191498 ?auto_191501 ) ) ( not ( = ?auto_191499 ?auto_191501 ) ) ( not ( = ?auto_191498 ?auto_191500 ) ) ( not ( = ?auto_191499 ?auto_191500 ) ) ( not ( = ?auto_191501 ?auto_191500 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_191498 ?auto_191499 ?auto_191501 ?auto_191500 ?auto_191497 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191527 - OBJ
      ?auto_191528 - OBJ
      ?auto_191529 - OBJ
      ?auto_191530 - OBJ
      ?auto_191526 - LOCATION
    )
    :vars
    (
      ?auto_191534 - LOCATION
      ?auto_191532 - CITY
      ?auto_191533 - LOCATION
      ?auto_191531 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191534 ?auto_191532 ) ( IN-CITY ?auto_191526 ?auto_191532 ) ( not ( = ?auto_191526 ?auto_191534 ) ) ( OBJ-AT ?auto_191530 ?auto_191534 ) ( IN-CITY ?auto_191533 ?auto_191532 ) ( not ( = ?auto_191526 ?auto_191533 ) ) ( OBJ-AT ?auto_191528 ?auto_191533 ) ( OBJ-AT ?auto_191529 ?auto_191534 ) ( OBJ-AT ?auto_191527 ?auto_191533 ) ( TRUCK-AT ?auto_191531 ?auto_191526 ) ( not ( = ?auto_191527 ?auto_191529 ) ) ( not ( = ?auto_191534 ?auto_191533 ) ) ( not ( = ?auto_191527 ?auto_191528 ) ) ( not ( = ?auto_191529 ?auto_191528 ) ) ( not ( = ?auto_191527 ?auto_191530 ) ) ( not ( = ?auto_191529 ?auto_191530 ) ) ( not ( = ?auto_191528 ?auto_191530 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_191527 ?auto_191529 ?auto_191530 ?auto_191528 ?auto_191526 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191556 - OBJ
      ?auto_191557 - OBJ
      ?auto_191558 - OBJ
      ?auto_191559 - OBJ
      ?auto_191555 - LOCATION
    )
    :vars
    (
      ?auto_191563 - LOCATION
      ?auto_191561 - CITY
      ?auto_191562 - LOCATION
      ?auto_191560 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191563 ?auto_191561 ) ( IN-CITY ?auto_191555 ?auto_191561 ) ( not ( = ?auto_191555 ?auto_191563 ) ) ( OBJ-AT ?auto_191558 ?auto_191563 ) ( IN-CITY ?auto_191562 ?auto_191561 ) ( not ( = ?auto_191555 ?auto_191562 ) ) ( OBJ-AT ?auto_191557 ?auto_191562 ) ( OBJ-AT ?auto_191559 ?auto_191563 ) ( OBJ-AT ?auto_191556 ?auto_191562 ) ( TRUCK-AT ?auto_191560 ?auto_191555 ) ( not ( = ?auto_191556 ?auto_191559 ) ) ( not ( = ?auto_191563 ?auto_191562 ) ) ( not ( = ?auto_191556 ?auto_191557 ) ) ( not ( = ?auto_191559 ?auto_191557 ) ) ( not ( = ?auto_191556 ?auto_191558 ) ) ( not ( = ?auto_191559 ?auto_191558 ) ) ( not ( = ?auto_191557 ?auto_191558 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_191556 ?auto_191559 ?auto_191558 ?auto_191557 ?auto_191555 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191647 - OBJ
      ?auto_191648 - OBJ
      ?auto_191649 - OBJ
      ?auto_191650 - OBJ
      ?auto_191646 - LOCATION
    )
    :vars
    (
      ?auto_191654 - LOCATION
      ?auto_191652 - CITY
      ?auto_191653 - LOCATION
      ?auto_191651 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191654 ?auto_191652 ) ( IN-CITY ?auto_191646 ?auto_191652 ) ( not ( = ?auto_191646 ?auto_191654 ) ) ( OBJ-AT ?auto_191648 ?auto_191654 ) ( IN-CITY ?auto_191653 ?auto_191652 ) ( not ( = ?auto_191646 ?auto_191653 ) ) ( OBJ-AT ?auto_191650 ?auto_191653 ) ( OBJ-AT ?auto_191649 ?auto_191654 ) ( OBJ-AT ?auto_191647 ?auto_191653 ) ( TRUCK-AT ?auto_191651 ?auto_191646 ) ( not ( = ?auto_191647 ?auto_191649 ) ) ( not ( = ?auto_191654 ?auto_191653 ) ) ( not ( = ?auto_191647 ?auto_191650 ) ) ( not ( = ?auto_191649 ?auto_191650 ) ) ( not ( = ?auto_191647 ?auto_191648 ) ) ( not ( = ?auto_191649 ?auto_191648 ) ) ( not ( = ?auto_191650 ?auto_191648 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_191647 ?auto_191649 ?auto_191648 ?auto_191650 ?auto_191646 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191676 - OBJ
      ?auto_191677 - OBJ
      ?auto_191678 - OBJ
      ?auto_191679 - OBJ
      ?auto_191675 - LOCATION
    )
    :vars
    (
      ?auto_191683 - LOCATION
      ?auto_191681 - CITY
      ?auto_191682 - LOCATION
      ?auto_191680 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191683 ?auto_191681 ) ( IN-CITY ?auto_191675 ?auto_191681 ) ( not ( = ?auto_191675 ?auto_191683 ) ) ( OBJ-AT ?auto_191677 ?auto_191683 ) ( IN-CITY ?auto_191682 ?auto_191681 ) ( not ( = ?auto_191675 ?auto_191682 ) ) ( OBJ-AT ?auto_191678 ?auto_191682 ) ( OBJ-AT ?auto_191679 ?auto_191683 ) ( OBJ-AT ?auto_191676 ?auto_191682 ) ( TRUCK-AT ?auto_191680 ?auto_191675 ) ( not ( = ?auto_191676 ?auto_191679 ) ) ( not ( = ?auto_191683 ?auto_191682 ) ) ( not ( = ?auto_191676 ?auto_191678 ) ) ( not ( = ?auto_191679 ?auto_191678 ) ) ( not ( = ?auto_191676 ?auto_191677 ) ) ( not ( = ?auto_191679 ?auto_191677 ) ) ( not ( = ?auto_191678 ?auto_191677 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_191676 ?auto_191679 ?auto_191677 ?auto_191678 ?auto_191675 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191767 - OBJ
      ?auto_191768 - OBJ
      ?auto_191769 - OBJ
      ?auto_191770 - OBJ
      ?auto_191766 - LOCATION
    )
    :vars
    (
      ?auto_191774 - LOCATION
      ?auto_191772 - CITY
      ?auto_191773 - LOCATION
      ?auto_191771 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191774 ?auto_191772 ) ( IN-CITY ?auto_191766 ?auto_191772 ) ( not ( = ?auto_191766 ?auto_191774 ) ) ( OBJ-AT ?auto_191770 ?auto_191774 ) ( IN-CITY ?auto_191773 ?auto_191772 ) ( not ( = ?auto_191766 ?auto_191773 ) ) ( OBJ-AT ?auto_191769 ?auto_191773 ) ( OBJ-AT ?auto_191767 ?auto_191774 ) ( OBJ-AT ?auto_191768 ?auto_191773 ) ( TRUCK-AT ?auto_191771 ?auto_191766 ) ( not ( = ?auto_191768 ?auto_191767 ) ) ( not ( = ?auto_191774 ?auto_191773 ) ) ( not ( = ?auto_191768 ?auto_191769 ) ) ( not ( = ?auto_191767 ?auto_191769 ) ) ( not ( = ?auto_191768 ?auto_191770 ) ) ( not ( = ?auto_191767 ?auto_191770 ) ) ( not ( = ?auto_191769 ?auto_191770 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_191768 ?auto_191767 ?auto_191770 ?auto_191769 ?auto_191766 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191796 - OBJ
      ?auto_191797 - OBJ
      ?auto_191798 - OBJ
      ?auto_191799 - OBJ
      ?auto_191795 - LOCATION
    )
    :vars
    (
      ?auto_191803 - LOCATION
      ?auto_191801 - CITY
      ?auto_191802 - LOCATION
      ?auto_191800 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191803 ?auto_191801 ) ( IN-CITY ?auto_191795 ?auto_191801 ) ( not ( = ?auto_191795 ?auto_191803 ) ) ( OBJ-AT ?auto_191798 ?auto_191803 ) ( IN-CITY ?auto_191802 ?auto_191801 ) ( not ( = ?auto_191795 ?auto_191802 ) ) ( OBJ-AT ?auto_191799 ?auto_191802 ) ( OBJ-AT ?auto_191796 ?auto_191803 ) ( OBJ-AT ?auto_191797 ?auto_191802 ) ( TRUCK-AT ?auto_191800 ?auto_191795 ) ( not ( = ?auto_191797 ?auto_191796 ) ) ( not ( = ?auto_191803 ?auto_191802 ) ) ( not ( = ?auto_191797 ?auto_191799 ) ) ( not ( = ?auto_191796 ?auto_191799 ) ) ( not ( = ?auto_191797 ?auto_191798 ) ) ( not ( = ?auto_191796 ?auto_191798 ) ) ( not ( = ?auto_191799 ?auto_191798 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_191797 ?auto_191796 ?auto_191798 ?auto_191799 ?auto_191795 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191888 - OBJ
      ?auto_191889 - OBJ
      ?auto_191890 - OBJ
      ?auto_191891 - OBJ
      ?auto_191887 - LOCATION
    )
    :vars
    (
      ?auto_191895 - LOCATION
      ?auto_191893 - CITY
      ?auto_191894 - LOCATION
      ?auto_191892 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191895 ?auto_191893 ) ( IN-CITY ?auto_191887 ?auto_191893 ) ( not ( = ?auto_191887 ?auto_191895 ) ) ( OBJ-AT ?auto_191891 ?auto_191895 ) ( IN-CITY ?auto_191894 ?auto_191893 ) ( not ( = ?auto_191887 ?auto_191894 ) ) ( OBJ-AT ?auto_191889 ?auto_191894 ) ( OBJ-AT ?auto_191888 ?auto_191895 ) ( OBJ-AT ?auto_191890 ?auto_191894 ) ( TRUCK-AT ?auto_191892 ?auto_191887 ) ( not ( = ?auto_191890 ?auto_191888 ) ) ( not ( = ?auto_191895 ?auto_191894 ) ) ( not ( = ?auto_191890 ?auto_191889 ) ) ( not ( = ?auto_191888 ?auto_191889 ) ) ( not ( = ?auto_191890 ?auto_191891 ) ) ( not ( = ?auto_191888 ?auto_191891 ) ) ( not ( = ?auto_191889 ?auto_191891 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_191890 ?auto_191888 ?auto_191891 ?auto_191889 ?auto_191887 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191917 - OBJ
      ?auto_191918 - OBJ
      ?auto_191919 - OBJ
      ?auto_191920 - OBJ
      ?auto_191916 - LOCATION
    )
    :vars
    (
      ?auto_191924 - LOCATION
      ?auto_191922 - CITY
      ?auto_191923 - LOCATION
      ?auto_191921 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191924 ?auto_191922 ) ( IN-CITY ?auto_191916 ?auto_191922 ) ( not ( = ?auto_191916 ?auto_191924 ) ) ( OBJ-AT ?auto_191919 ?auto_191924 ) ( IN-CITY ?auto_191923 ?auto_191922 ) ( not ( = ?auto_191916 ?auto_191923 ) ) ( OBJ-AT ?auto_191918 ?auto_191923 ) ( OBJ-AT ?auto_191917 ?auto_191924 ) ( OBJ-AT ?auto_191920 ?auto_191923 ) ( TRUCK-AT ?auto_191921 ?auto_191916 ) ( not ( = ?auto_191920 ?auto_191917 ) ) ( not ( = ?auto_191924 ?auto_191923 ) ) ( not ( = ?auto_191920 ?auto_191918 ) ) ( not ( = ?auto_191917 ?auto_191918 ) ) ( not ( = ?auto_191920 ?auto_191919 ) ) ( not ( = ?auto_191917 ?auto_191919 ) ) ( not ( = ?auto_191918 ?auto_191919 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_191920 ?auto_191917 ?auto_191919 ?auto_191918 ?auto_191916 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_191976 - OBJ
      ?auto_191977 - OBJ
      ?auto_191978 - OBJ
      ?auto_191979 - OBJ
      ?auto_191975 - LOCATION
    )
    :vars
    (
      ?auto_191983 - LOCATION
      ?auto_191981 - CITY
      ?auto_191982 - LOCATION
      ?auto_191980 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191983 ?auto_191981 ) ( IN-CITY ?auto_191975 ?auto_191981 ) ( not ( = ?auto_191975 ?auto_191983 ) ) ( OBJ-AT ?auto_191977 ?auto_191983 ) ( IN-CITY ?auto_191982 ?auto_191981 ) ( not ( = ?auto_191975 ?auto_191982 ) ) ( OBJ-AT ?auto_191979 ?auto_191982 ) ( OBJ-AT ?auto_191976 ?auto_191983 ) ( OBJ-AT ?auto_191978 ?auto_191982 ) ( TRUCK-AT ?auto_191980 ?auto_191975 ) ( not ( = ?auto_191978 ?auto_191976 ) ) ( not ( = ?auto_191983 ?auto_191982 ) ) ( not ( = ?auto_191978 ?auto_191979 ) ) ( not ( = ?auto_191976 ?auto_191979 ) ) ( not ( = ?auto_191978 ?auto_191977 ) ) ( not ( = ?auto_191976 ?auto_191977 ) ) ( not ( = ?auto_191979 ?auto_191977 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_191978 ?auto_191976 ?auto_191977 ?auto_191979 ?auto_191975 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192037 - OBJ
      ?auto_192038 - OBJ
      ?auto_192039 - OBJ
      ?auto_192040 - OBJ
      ?auto_192036 - LOCATION
    )
    :vars
    (
      ?auto_192044 - LOCATION
      ?auto_192042 - CITY
      ?auto_192043 - LOCATION
      ?auto_192041 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192044 ?auto_192042 ) ( IN-CITY ?auto_192036 ?auto_192042 ) ( not ( = ?auto_192036 ?auto_192044 ) ) ( OBJ-AT ?auto_192038 ?auto_192044 ) ( IN-CITY ?auto_192043 ?auto_192042 ) ( not ( = ?auto_192036 ?auto_192043 ) ) ( OBJ-AT ?auto_192039 ?auto_192043 ) ( OBJ-AT ?auto_192037 ?auto_192044 ) ( OBJ-AT ?auto_192040 ?auto_192043 ) ( TRUCK-AT ?auto_192041 ?auto_192036 ) ( not ( = ?auto_192040 ?auto_192037 ) ) ( not ( = ?auto_192044 ?auto_192043 ) ) ( not ( = ?auto_192040 ?auto_192039 ) ) ( not ( = ?auto_192037 ?auto_192039 ) ) ( not ( = ?auto_192040 ?auto_192038 ) ) ( not ( = ?auto_192037 ?auto_192038 ) ) ( not ( = ?auto_192039 ?auto_192038 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192040 ?auto_192037 ?auto_192038 ?auto_192039 ?auto_192036 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192128 - OBJ
      ?auto_192129 - OBJ
      ?auto_192130 - OBJ
      ?auto_192131 - OBJ
      ?auto_192127 - LOCATION
    )
    :vars
    (
      ?auto_192135 - LOCATION
      ?auto_192133 - CITY
      ?auto_192134 - LOCATION
      ?auto_192132 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192135 ?auto_192133 ) ( IN-CITY ?auto_192127 ?auto_192133 ) ( not ( = ?auto_192127 ?auto_192135 ) ) ( OBJ-AT ?auto_192131 ?auto_192135 ) ( IN-CITY ?auto_192134 ?auto_192133 ) ( not ( = ?auto_192127 ?auto_192134 ) ) ( OBJ-AT ?auto_192128 ?auto_192134 ) ( OBJ-AT ?auto_192130 ?auto_192135 ) ( OBJ-AT ?auto_192129 ?auto_192134 ) ( TRUCK-AT ?auto_192132 ?auto_192127 ) ( not ( = ?auto_192129 ?auto_192130 ) ) ( not ( = ?auto_192135 ?auto_192134 ) ) ( not ( = ?auto_192129 ?auto_192128 ) ) ( not ( = ?auto_192130 ?auto_192128 ) ) ( not ( = ?auto_192129 ?auto_192131 ) ) ( not ( = ?auto_192130 ?auto_192131 ) ) ( not ( = ?auto_192128 ?auto_192131 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192129 ?auto_192130 ?auto_192131 ?auto_192128 ?auto_192127 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192157 - OBJ
      ?auto_192158 - OBJ
      ?auto_192159 - OBJ
      ?auto_192160 - OBJ
      ?auto_192156 - LOCATION
    )
    :vars
    (
      ?auto_192164 - LOCATION
      ?auto_192162 - CITY
      ?auto_192163 - LOCATION
      ?auto_192161 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192164 ?auto_192162 ) ( IN-CITY ?auto_192156 ?auto_192162 ) ( not ( = ?auto_192156 ?auto_192164 ) ) ( OBJ-AT ?auto_192159 ?auto_192164 ) ( IN-CITY ?auto_192163 ?auto_192162 ) ( not ( = ?auto_192156 ?auto_192163 ) ) ( OBJ-AT ?auto_192157 ?auto_192163 ) ( OBJ-AT ?auto_192160 ?auto_192164 ) ( OBJ-AT ?auto_192158 ?auto_192163 ) ( TRUCK-AT ?auto_192161 ?auto_192156 ) ( not ( = ?auto_192158 ?auto_192160 ) ) ( not ( = ?auto_192164 ?auto_192163 ) ) ( not ( = ?auto_192158 ?auto_192157 ) ) ( not ( = ?auto_192160 ?auto_192157 ) ) ( not ( = ?auto_192158 ?auto_192159 ) ) ( not ( = ?auto_192160 ?auto_192159 ) ) ( not ( = ?auto_192157 ?auto_192159 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192158 ?auto_192160 ?auto_192159 ?auto_192157 ?auto_192156 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192186 - OBJ
      ?auto_192187 - OBJ
      ?auto_192188 - OBJ
      ?auto_192189 - OBJ
      ?auto_192185 - LOCATION
    )
    :vars
    (
      ?auto_192193 - LOCATION
      ?auto_192191 - CITY
      ?auto_192192 - LOCATION
      ?auto_192190 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192193 ?auto_192191 ) ( IN-CITY ?auto_192185 ?auto_192191 ) ( not ( = ?auto_192185 ?auto_192193 ) ) ( OBJ-AT ?auto_192189 ?auto_192193 ) ( IN-CITY ?auto_192192 ?auto_192191 ) ( not ( = ?auto_192185 ?auto_192192 ) ) ( OBJ-AT ?auto_192186 ?auto_192192 ) ( OBJ-AT ?auto_192187 ?auto_192193 ) ( OBJ-AT ?auto_192188 ?auto_192192 ) ( TRUCK-AT ?auto_192190 ?auto_192185 ) ( not ( = ?auto_192188 ?auto_192187 ) ) ( not ( = ?auto_192193 ?auto_192192 ) ) ( not ( = ?auto_192188 ?auto_192186 ) ) ( not ( = ?auto_192187 ?auto_192186 ) ) ( not ( = ?auto_192188 ?auto_192189 ) ) ( not ( = ?auto_192187 ?auto_192189 ) ) ( not ( = ?auto_192186 ?auto_192189 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192188 ?auto_192187 ?auto_192189 ?auto_192186 ?auto_192185 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192215 - OBJ
      ?auto_192216 - OBJ
      ?auto_192217 - OBJ
      ?auto_192218 - OBJ
      ?auto_192214 - LOCATION
    )
    :vars
    (
      ?auto_192222 - LOCATION
      ?auto_192220 - CITY
      ?auto_192221 - LOCATION
      ?auto_192219 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192222 ?auto_192220 ) ( IN-CITY ?auto_192214 ?auto_192220 ) ( not ( = ?auto_192214 ?auto_192222 ) ) ( OBJ-AT ?auto_192217 ?auto_192222 ) ( IN-CITY ?auto_192221 ?auto_192220 ) ( not ( = ?auto_192214 ?auto_192221 ) ) ( OBJ-AT ?auto_192215 ?auto_192221 ) ( OBJ-AT ?auto_192216 ?auto_192222 ) ( OBJ-AT ?auto_192218 ?auto_192221 ) ( TRUCK-AT ?auto_192219 ?auto_192214 ) ( not ( = ?auto_192218 ?auto_192216 ) ) ( not ( = ?auto_192222 ?auto_192221 ) ) ( not ( = ?auto_192218 ?auto_192215 ) ) ( not ( = ?auto_192216 ?auto_192215 ) ) ( not ( = ?auto_192218 ?auto_192217 ) ) ( not ( = ?auto_192216 ?auto_192217 ) ) ( not ( = ?auto_192215 ?auto_192217 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192218 ?auto_192216 ?auto_192217 ?auto_192215 ?auto_192214 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192337 - OBJ
      ?auto_192338 - OBJ
      ?auto_192339 - OBJ
      ?auto_192340 - OBJ
      ?auto_192336 - LOCATION
    )
    :vars
    (
      ?auto_192344 - LOCATION
      ?auto_192342 - CITY
      ?auto_192343 - LOCATION
      ?auto_192341 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192344 ?auto_192342 ) ( IN-CITY ?auto_192336 ?auto_192342 ) ( not ( = ?auto_192336 ?auto_192344 ) ) ( OBJ-AT ?auto_192338 ?auto_192344 ) ( IN-CITY ?auto_192343 ?auto_192342 ) ( not ( = ?auto_192336 ?auto_192343 ) ) ( OBJ-AT ?auto_192337 ?auto_192343 ) ( OBJ-AT ?auto_192340 ?auto_192344 ) ( OBJ-AT ?auto_192339 ?auto_192343 ) ( TRUCK-AT ?auto_192341 ?auto_192336 ) ( not ( = ?auto_192339 ?auto_192340 ) ) ( not ( = ?auto_192344 ?auto_192343 ) ) ( not ( = ?auto_192339 ?auto_192337 ) ) ( not ( = ?auto_192340 ?auto_192337 ) ) ( not ( = ?auto_192339 ?auto_192338 ) ) ( not ( = ?auto_192340 ?auto_192338 ) ) ( not ( = ?auto_192337 ?auto_192338 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192339 ?auto_192340 ?auto_192338 ?auto_192337 ?auto_192336 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192366 - OBJ
      ?auto_192367 - OBJ
      ?auto_192368 - OBJ
      ?auto_192369 - OBJ
      ?auto_192365 - LOCATION
    )
    :vars
    (
      ?auto_192373 - LOCATION
      ?auto_192371 - CITY
      ?auto_192372 - LOCATION
      ?auto_192370 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192373 ?auto_192371 ) ( IN-CITY ?auto_192365 ?auto_192371 ) ( not ( = ?auto_192365 ?auto_192373 ) ) ( OBJ-AT ?auto_192367 ?auto_192373 ) ( IN-CITY ?auto_192372 ?auto_192371 ) ( not ( = ?auto_192365 ?auto_192372 ) ) ( OBJ-AT ?auto_192366 ?auto_192372 ) ( OBJ-AT ?auto_192368 ?auto_192373 ) ( OBJ-AT ?auto_192369 ?auto_192372 ) ( TRUCK-AT ?auto_192370 ?auto_192365 ) ( not ( = ?auto_192369 ?auto_192368 ) ) ( not ( = ?auto_192373 ?auto_192372 ) ) ( not ( = ?auto_192369 ?auto_192366 ) ) ( not ( = ?auto_192368 ?auto_192366 ) ) ( not ( = ?auto_192369 ?auto_192367 ) ) ( not ( = ?auto_192368 ?auto_192367 ) ) ( not ( = ?auto_192366 ?auto_192367 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192369 ?auto_192368 ?auto_192367 ?auto_192366 ?auto_192365 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192551 - OBJ
      ?auto_192552 - OBJ
      ?auto_192553 - OBJ
      ?auto_192554 - OBJ
      ?auto_192550 - LOCATION
    )
    :vars
    (
      ?auto_192558 - LOCATION
      ?auto_192556 - CITY
      ?auto_192557 - LOCATION
      ?auto_192555 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192558 ?auto_192556 ) ( IN-CITY ?auto_192550 ?auto_192556 ) ( not ( = ?auto_192550 ?auto_192558 ) ) ( OBJ-AT ?auto_192551 ?auto_192558 ) ( IN-CITY ?auto_192557 ?auto_192556 ) ( not ( = ?auto_192550 ?auto_192557 ) ) ( OBJ-AT ?auto_192554 ?auto_192557 ) ( OBJ-AT ?auto_192553 ?auto_192558 ) ( OBJ-AT ?auto_192552 ?auto_192557 ) ( TRUCK-AT ?auto_192555 ?auto_192550 ) ( not ( = ?auto_192552 ?auto_192553 ) ) ( not ( = ?auto_192558 ?auto_192557 ) ) ( not ( = ?auto_192552 ?auto_192554 ) ) ( not ( = ?auto_192553 ?auto_192554 ) ) ( not ( = ?auto_192552 ?auto_192551 ) ) ( not ( = ?auto_192553 ?auto_192551 ) ) ( not ( = ?auto_192554 ?auto_192551 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192552 ?auto_192553 ?auto_192551 ?auto_192554 ?auto_192550 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192580 - OBJ
      ?auto_192581 - OBJ
      ?auto_192582 - OBJ
      ?auto_192583 - OBJ
      ?auto_192579 - LOCATION
    )
    :vars
    (
      ?auto_192587 - LOCATION
      ?auto_192585 - CITY
      ?auto_192586 - LOCATION
      ?auto_192584 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192587 ?auto_192585 ) ( IN-CITY ?auto_192579 ?auto_192585 ) ( not ( = ?auto_192579 ?auto_192587 ) ) ( OBJ-AT ?auto_192580 ?auto_192587 ) ( IN-CITY ?auto_192586 ?auto_192585 ) ( not ( = ?auto_192579 ?auto_192586 ) ) ( OBJ-AT ?auto_192582 ?auto_192586 ) ( OBJ-AT ?auto_192583 ?auto_192587 ) ( OBJ-AT ?auto_192581 ?auto_192586 ) ( TRUCK-AT ?auto_192584 ?auto_192579 ) ( not ( = ?auto_192581 ?auto_192583 ) ) ( not ( = ?auto_192587 ?auto_192586 ) ) ( not ( = ?auto_192581 ?auto_192582 ) ) ( not ( = ?auto_192583 ?auto_192582 ) ) ( not ( = ?auto_192581 ?auto_192580 ) ) ( not ( = ?auto_192583 ?auto_192580 ) ) ( not ( = ?auto_192582 ?auto_192580 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192581 ?auto_192583 ?auto_192580 ?auto_192582 ?auto_192579 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192671 - OBJ
      ?auto_192672 - OBJ
      ?auto_192673 - OBJ
      ?auto_192674 - OBJ
      ?auto_192670 - LOCATION
    )
    :vars
    (
      ?auto_192678 - LOCATION
      ?auto_192676 - CITY
      ?auto_192677 - LOCATION
      ?auto_192675 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192678 ?auto_192676 ) ( IN-CITY ?auto_192670 ?auto_192676 ) ( not ( = ?auto_192670 ?auto_192678 ) ) ( OBJ-AT ?auto_192671 ?auto_192678 ) ( IN-CITY ?auto_192677 ?auto_192676 ) ( not ( = ?auto_192670 ?auto_192677 ) ) ( OBJ-AT ?auto_192674 ?auto_192677 ) ( OBJ-AT ?auto_192672 ?auto_192678 ) ( OBJ-AT ?auto_192673 ?auto_192677 ) ( TRUCK-AT ?auto_192675 ?auto_192670 ) ( not ( = ?auto_192673 ?auto_192672 ) ) ( not ( = ?auto_192678 ?auto_192677 ) ) ( not ( = ?auto_192673 ?auto_192674 ) ) ( not ( = ?auto_192672 ?auto_192674 ) ) ( not ( = ?auto_192673 ?auto_192671 ) ) ( not ( = ?auto_192672 ?auto_192671 ) ) ( not ( = ?auto_192674 ?auto_192671 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192673 ?auto_192672 ?auto_192671 ?auto_192674 ?auto_192670 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192732 - OBJ
      ?auto_192733 - OBJ
      ?auto_192734 - OBJ
      ?auto_192735 - OBJ
      ?auto_192731 - LOCATION
    )
    :vars
    (
      ?auto_192739 - LOCATION
      ?auto_192737 - CITY
      ?auto_192738 - LOCATION
      ?auto_192736 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192739 ?auto_192737 ) ( IN-CITY ?auto_192731 ?auto_192737 ) ( not ( = ?auto_192731 ?auto_192739 ) ) ( OBJ-AT ?auto_192732 ?auto_192739 ) ( IN-CITY ?auto_192738 ?auto_192737 ) ( not ( = ?auto_192731 ?auto_192738 ) ) ( OBJ-AT ?auto_192734 ?auto_192738 ) ( OBJ-AT ?auto_192733 ?auto_192739 ) ( OBJ-AT ?auto_192735 ?auto_192738 ) ( TRUCK-AT ?auto_192736 ?auto_192731 ) ( not ( = ?auto_192735 ?auto_192733 ) ) ( not ( = ?auto_192739 ?auto_192738 ) ) ( not ( = ?auto_192735 ?auto_192734 ) ) ( not ( = ?auto_192733 ?auto_192734 ) ) ( not ( = ?auto_192735 ?auto_192732 ) ) ( not ( = ?auto_192733 ?auto_192732 ) ) ( not ( = ?auto_192734 ?auto_192732 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192735 ?auto_192733 ?auto_192732 ?auto_192734 ?auto_192731 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192823 - OBJ
      ?auto_192824 - OBJ
      ?auto_192825 - OBJ
      ?auto_192826 - OBJ
      ?auto_192822 - LOCATION
    )
    :vars
    (
      ?auto_192830 - LOCATION
      ?auto_192828 - CITY
      ?auto_192829 - LOCATION
      ?auto_192827 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192830 ?auto_192828 ) ( IN-CITY ?auto_192822 ?auto_192828 ) ( not ( = ?auto_192822 ?auto_192830 ) ) ( OBJ-AT ?auto_192823 ?auto_192830 ) ( IN-CITY ?auto_192829 ?auto_192828 ) ( not ( = ?auto_192822 ?auto_192829 ) ) ( OBJ-AT ?auto_192824 ?auto_192829 ) ( OBJ-AT ?auto_192826 ?auto_192830 ) ( OBJ-AT ?auto_192825 ?auto_192829 ) ( TRUCK-AT ?auto_192827 ?auto_192822 ) ( not ( = ?auto_192825 ?auto_192826 ) ) ( not ( = ?auto_192830 ?auto_192829 ) ) ( not ( = ?auto_192825 ?auto_192824 ) ) ( not ( = ?auto_192826 ?auto_192824 ) ) ( not ( = ?auto_192825 ?auto_192823 ) ) ( not ( = ?auto_192826 ?auto_192823 ) ) ( not ( = ?auto_192824 ?auto_192823 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192825 ?auto_192826 ?auto_192823 ?auto_192824 ?auto_192822 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192852 - OBJ
      ?auto_192853 - OBJ
      ?auto_192854 - OBJ
      ?auto_192855 - OBJ
      ?auto_192851 - LOCATION
    )
    :vars
    (
      ?auto_192859 - LOCATION
      ?auto_192857 - CITY
      ?auto_192858 - LOCATION
      ?auto_192856 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192859 ?auto_192857 ) ( IN-CITY ?auto_192851 ?auto_192857 ) ( not ( = ?auto_192851 ?auto_192859 ) ) ( OBJ-AT ?auto_192852 ?auto_192859 ) ( IN-CITY ?auto_192858 ?auto_192857 ) ( not ( = ?auto_192851 ?auto_192858 ) ) ( OBJ-AT ?auto_192853 ?auto_192858 ) ( OBJ-AT ?auto_192854 ?auto_192859 ) ( OBJ-AT ?auto_192855 ?auto_192858 ) ( TRUCK-AT ?auto_192856 ?auto_192851 ) ( not ( = ?auto_192855 ?auto_192854 ) ) ( not ( = ?auto_192859 ?auto_192858 ) ) ( not ( = ?auto_192855 ?auto_192853 ) ) ( not ( = ?auto_192854 ?auto_192853 ) ) ( not ( = ?auto_192855 ?auto_192852 ) ) ( not ( = ?auto_192854 ?auto_192852 ) ) ( not ( = ?auto_192853 ?auto_192852 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192855 ?auto_192854 ?auto_192852 ?auto_192853 ?auto_192851 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_193148 - OBJ
      ?auto_193147 - LOCATION
    )
    :vars
    (
      ?auto_193150 - LOCATION
      ?auto_193151 - CITY
      ?auto_193149 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193150 ?auto_193151 ) ( IN-CITY ?auto_193147 ?auto_193151 ) ( not ( = ?auto_193147 ?auto_193150 ) ) ( OBJ-AT ?auto_193148 ?auto_193150 ) ( TRUCK-AT ?auto_193149 ?auto_193147 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_193149 ?auto_193147 ?auto_193150 ?auto_193151 )
      ( !LOAD-TRUCK ?auto_193148 ?auto_193149 ?auto_193150 )
      ( !DRIVE-TRUCK ?auto_193149 ?auto_193150 ?auto_193147 ?auto_193151 )
      ( !UNLOAD-TRUCK ?auto_193148 ?auto_193149 ?auto_193147 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_206721 - OBJ
      ?auto_206722 - OBJ
      ?auto_206723 - OBJ
      ?auto_206724 - OBJ
      ?auto_206725 - OBJ
      ?auto_206720 - LOCATION
    )
    :vars
    (
      ?auto_206728 - LOCATION
      ?auto_206727 - CITY
      ?auto_206729 - LOCATION
      ?auto_206726 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_206728 ?auto_206727 ) ( IN-CITY ?auto_206720 ?auto_206727 ) ( not ( = ?auto_206720 ?auto_206728 ) ) ( OBJ-AT ?auto_206725 ?auto_206728 ) ( IN-CITY ?auto_206729 ?auto_206727 ) ( not ( = ?auto_206720 ?auto_206729 ) ) ( OBJ-AT ?auto_206724 ?auto_206729 ) ( OBJ-AT ?auto_206723 ?auto_206728 ) ( OBJ-AT ?auto_206722 ?auto_206729 ) ( OBJ-AT ?auto_206721 ?auto_206728 ) ( TRUCK-AT ?auto_206726 ?auto_206720 ) ( not ( = ?auto_206721 ?auto_206722 ) ) ( not ( = ?auto_206729 ?auto_206728 ) ) ( not ( = ?auto_206721 ?auto_206723 ) ) ( not ( = ?auto_206722 ?auto_206723 ) ) ( not ( = ?auto_206721 ?auto_206724 ) ) ( not ( = ?auto_206722 ?auto_206724 ) ) ( not ( = ?auto_206723 ?auto_206724 ) ) ( not ( = ?auto_206721 ?auto_206725 ) ) ( not ( = ?auto_206722 ?auto_206725 ) ) ( not ( = ?auto_206723 ?auto_206725 ) ) ( not ( = ?auto_206724 ?auto_206725 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_206721 ?auto_206722 ?auto_206724 ?auto_206723 ?auto_206720 )
      ( DELIVER-1PKG ?auto_206725 ?auto_206720 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_206764 - OBJ
      ?auto_206765 - OBJ
      ?auto_206766 - OBJ
      ?auto_206767 - OBJ
      ?auto_206768 - OBJ
      ?auto_206763 - LOCATION
    )
    :vars
    (
      ?auto_206772 - LOCATION
      ?auto_206769 - CITY
      ?auto_206770 - LOCATION
      ?auto_206771 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_206772 ?auto_206769 ) ( IN-CITY ?auto_206763 ?auto_206769 ) ( not ( = ?auto_206763 ?auto_206772 ) ) ( OBJ-AT ?auto_206767 ?auto_206772 ) ( IN-CITY ?auto_206770 ?auto_206769 ) ( not ( = ?auto_206763 ?auto_206770 ) ) ( OBJ-AT ?auto_206768 ?auto_206770 ) ( OBJ-AT ?auto_206766 ?auto_206772 ) ( OBJ-AT ?auto_206765 ?auto_206770 ) ( OBJ-AT ?auto_206764 ?auto_206772 ) ( TRUCK-AT ?auto_206771 ?auto_206763 ) ( not ( = ?auto_206764 ?auto_206765 ) ) ( not ( = ?auto_206770 ?auto_206772 ) ) ( not ( = ?auto_206764 ?auto_206766 ) ) ( not ( = ?auto_206765 ?auto_206766 ) ) ( not ( = ?auto_206764 ?auto_206768 ) ) ( not ( = ?auto_206765 ?auto_206768 ) ) ( not ( = ?auto_206766 ?auto_206768 ) ) ( not ( = ?auto_206764 ?auto_206767 ) ) ( not ( = ?auto_206765 ?auto_206767 ) ) ( not ( = ?auto_206766 ?auto_206767 ) ) ( not ( = ?auto_206768 ?auto_206767 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_206764 ?auto_206765 ?auto_206766 ?auto_206768 ?auto_206767 ?auto_206763 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_206807 - OBJ
      ?auto_206808 - OBJ
      ?auto_206809 - OBJ
      ?auto_206810 - OBJ
      ?auto_206811 - OBJ
      ?auto_206806 - LOCATION
    )
    :vars
    (
      ?auto_206813 - LOCATION
      ?auto_206812 - CITY
      ?auto_206814 - LOCATION
      ?auto_206815 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_206813 ?auto_206812 ) ( IN-CITY ?auto_206806 ?auto_206812 ) ( not ( = ?auto_206806 ?auto_206813 ) ) ( OBJ-AT ?auto_206811 ?auto_206813 ) ( IN-CITY ?auto_206814 ?auto_206812 ) ( not ( = ?auto_206806 ?auto_206814 ) ) ( OBJ-AT ?auto_206809 ?auto_206814 ) ( OBJ-AT ?auto_206810 ?auto_206813 ) ( OBJ-AT ?auto_206808 ?auto_206814 ) ( OBJ-AT ?auto_206807 ?auto_206813 ) ( TRUCK-AT ?auto_206815 ?auto_206806 ) ( not ( = ?auto_206807 ?auto_206808 ) ) ( not ( = ?auto_206814 ?auto_206813 ) ) ( not ( = ?auto_206807 ?auto_206810 ) ) ( not ( = ?auto_206808 ?auto_206810 ) ) ( not ( = ?auto_206807 ?auto_206809 ) ) ( not ( = ?auto_206808 ?auto_206809 ) ) ( not ( = ?auto_206810 ?auto_206809 ) ) ( not ( = ?auto_206807 ?auto_206811 ) ) ( not ( = ?auto_206808 ?auto_206811 ) ) ( not ( = ?auto_206810 ?auto_206811 ) ) ( not ( = ?auto_206809 ?auto_206811 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_206807 ?auto_206808 ?auto_206810 ?auto_206811 ?auto_206809 ?auto_206806 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_206850 - OBJ
      ?auto_206851 - OBJ
      ?auto_206852 - OBJ
      ?auto_206853 - OBJ
      ?auto_206854 - OBJ
      ?auto_206849 - LOCATION
    )
    :vars
    (
      ?auto_206856 - LOCATION
      ?auto_206855 - CITY
      ?auto_206857 - LOCATION
      ?auto_206858 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_206856 ?auto_206855 ) ( IN-CITY ?auto_206849 ?auto_206855 ) ( not ( = ?auto_206849 ?auto_206856 ) ) ( OBJ-AT ?auto_206853 ?auto_206856 ) ( IN-CITY ?auto_206857 ?auto_206855 ) ( not ( = ?auto_206849 ?auto_206857 ) ) ( OBJ-AT ?auto_206852 ?auto_206857 ) ( OBJ-AT ?auto_206854 ?auto_206856 ) ( OBJ-AT ?auto_206851 ?auto_206857 ) ( OBJ-AT ?auto_206850 ?auto_206856 ) ( TRUCK-AT ?auto_206858 ?auto_206849 ) ( not ( = ?auto_206850 ?auto_206851 ) ) ( not ( = ?auto_206857 ?auto_206856 ) ) ( not ( = ?auto_206850 ?auto_206854 ) ) ( not ( = ?auto_206851 ?auto_206854 ) ) ( not ( = ?auto_206850 ?auto_206852 ) ) ( not ( = ?auto_206851 ?auto_206852 ) ) ( not ( = ?auto_206854 ?auto_206852 ) ) ( not ( = ?auto_206850 ?auto_206853 ) ) ( not ( = ?auto_206851 ?auto_206853 ) ) ( not ( = ?auto_206854 ?auto_206853 ) ) ( not ( = ?auto_206852 ?auto_206853 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_206850 ?auto_206851 ?auto_206854 ?auto_206853 ?auto_206852 ?auto_206849 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_207031 - OBJ
      ?auto_207032 - OBJ
      ?auto_207033 - OBJ
      ?auto_207034 - OBJ
      ?auto_207035 - OBJ
      ?auto_207030 - LOCATION
    )
    :vars
    (
      ?auto_207037 - LOCATION
      ?auto_207036 - CITY
      ?auto_207038 - LOCATION
      ?auto_207039 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_207037 ?auto_207036 ) ( IN-CITY ?auto_207030 ?auto_207036 ) ( not ( = ?auto_207030 ?auto_207037 ) ) ( OBJ-AT ?auto_207033 ?auto_207037 ) ( IN-CITY ?auto_207038 ?auto_207036 ) ( not ( = ?auto_207030 ?auto_207038 ) ) ( OBJ-AT ?auto_207035 ?auto_207038 ) ( OBJ-AT ?auto_207034 ?auto_207037 ) ( OBJ-AT ?auto_207032 ?auto_207038 ) ( OBJ-AT ?auto_207031 ?auto_207037 ) ( TRUCK-AT ?auto_207039 ?auto_207030 ) ( not ( = ?auto_207031 ?auto_207032 ) ) ( not ( = ?auto_207038 ?auto_207037 ) ) ( not ( = ?auto_207031 ?auto_207034 ) ) ( not ( = ?auto_207032 ?auto_207034 ) ) ( not ( = ?auto_207031 ?auto_207035 ) ) ( not ( = ?auto_207032 ?auto_207035 ) ) ( not ( = ?auto_207034 ?auto_207035 ) ) ( not ( = ?auto_207031 ?auto_207033 ) ) ( not ( = ?auto_207032 ?auto_207033 ) ) ( not ( = ?auto_207034 ?auto_207033 ) ) ( not ( = ?auto_207035 ?auto_207033 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_207031 ?auto_207032 ?auto_207034 ?auto_207033 ?auto_207035 ?auto_207030 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_207074 - OBJ
      ?auto_207075 - OBJ
      ?auto_207076 - OBJ
      ?auto_207077 - OBJ
      ?auto_207078 - OBJ
      ?auto_207073 - LOCATION
    )
    :vars
    (
      ?auto_207080 - LOCATION
      ?auto_207079 - CITY
      ?auto_207081 - LOCATION
      ?auto_207082 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_207080 ?auto_207079 ) ( IN-CITY ?auto_207073 ?auto_207079 ) ( not ( = ?auto_207073 ?auto_207080 ) ) ( OBJ-AT ?auto_207076 ?auto_207080 ) ( IN-CITY ?auto_207081 ?auto_207079 ) ( not ( = ?auto_207073 ?auto_207081 ) ) ( OBJ-AT ?auto_207077 ?auto_207081 ) ( OBJ-AT ?auto_207078 ?auto_207080 ) ( OBJ-AT ?auto_207075 ?auto_207081 ) ( OBJ-AT ?auto_207074 ?auto_207080 ) ( TRUCK-AT ?auto_207082 ?auto_207073 ) ( not ( = ?auto_207074 ?auto_207075 ) ) ( not ( = ?auto_207081 ?auto_207080 ) ) ( not ( = ?auto_207074 ?auto_207078 ) ) ( not ( = ?auto_207075 ?auto_207078 ) ) ( not ( = ?auto_207074 ?auto_207077 ) ) ( not ( = ?auto_207075 ?auto_207077 ) ) ( not ( = ?auto_207078 ?auto_207077 ) ) ( not ( = ?auto_207074 ?auto_207076 ) ) ( not ( = ?auto_207075 ?auto_207076 ) ) ( not ( = ?auto_207078 ?auto_207076 ) ) ( not ( = ?auto_207077 ?auto_207076 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_207074 ?auto_207075 ?auto_207078 ?auto_207076 ?auto_207077 ?auto_207073 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_207301 - OBJ
      ?auto_207302 - OBJ
      ?auto_207303 - OBJ
      ?auto_207304 - OBJ
      ?auto_207305 - OBJ
      ?auto_207300 - LOCATION
    )
    :vars
    (
      ?auto_207307 - LOCATION
      ?auto_207306 - CITY
      ?auto_207308 - LOCATION
      ?auto_207309 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_207307 ?auto_207306 ) ( IN-CITY ?auto_207300 ?auto_207306 ) ( not ( = ?auto_207300 ?auto_207307 ) ) ( OBJ-AT ?auto_207305 ?auto_207307 ) ( IN-CITY ?auto_207308 ?auto_207306 ) ( not ( = ?auto_207300 ?auto_207308 ) ) ( OBJ-AT ?auto_207304 ?auto_207308 ) ( OBJ-AT ?auto_207302 ?auto_207307 ) ( OBJ-AT ?auto_207303 ?auto_207308 ) ( OBJ-AT ?auto_207301 ?auto_207307 ) ( TRUCK-AT ?auto_207309 ?auto_207300 ) ( not ( = ?auto_207301 ?auto_207303 ) ) ( not ( = ?auto_207308 ?auto_207307 ) ) ( not ( = ?auto_207301 ?auto_207302 ) ) ( not ( = ?auto_207303 ?auto_207302 ) ) ( not ( = ?auto_207301 ?auto_207304 ) ) ( not ( = ?auto_207303 ?auto_207304 ) ) ( not ( = ?auto_207302 ?auto_207304 ) ) ( not ( = ?auto_207301 ?auto_207305 ) ) ( not ( = ?auto_207303 ?auto_207305 ) ) ( not ( = ?auto_207302 ?auto_207305 ) ) ( not ( = ?auto_207304 ?auto_207305 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_207301 ?auto_207303 ?auto_207302 ?auto_207305 ?auto_207304 ?auto_207300 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_207344 - OBJ
      ?auto_207345 - OBJ
      ?auto_207346 - OBJ
      ?auto_207347 - OBJ
      ?auto_207348 - OBJ
      ?auto_207343 - LOCATION
    )
    :vars
    (
      ?auto_207350 - LOCATION
      ?auto_207349 - CITY
      ?auto_207351 - LOCATION
      ?auto_207352 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_207350 ?auto_207349 ) ( IN-CITY ?auto_207343 ?auto_207349 ) ( not ( = ?auto_207343 ?auto_207350 ) ) ( OBJ-AT ?auto_207347 ?auto_207350 ) ( IN-CITY ?auto_207351 ?auto_207349 ) ( not ( = ?auto_207343 ?auto_207351 ) ) ( OBJ-AT ?auto_207348 ?auto_207351 ) ( OBJ-AT ?auto_207345 ?auto_207350 ) ( OBJ-AT ?auto_207346 ?auto_207351 ) ( OBJ-AT ?auto_207344 ?auto_207350 ) ( TRUCK-AT ?auto_207352 ?auto_207343 ) ( not ( = ?auto_207344 ?auto_207346 ) ) ( not ( = ?auto_207351 ?auto_207350 ) ) ( not ( = ?auto_207344 ?auto_207345 ) ) ( not ( = ?auto_207346 ?auto_207345 ) ) ( not ( = ?auto_207344 ?auto_207348 ) ) ( not ( = ?auto_207346 ?auto_207348 ) ) ( not ( = ?auto_207345 ?auto_207348 ) ) ( not ( = ?auto_207344 ?auto_207347 ) ) ( not ( = ?auto_207346 ?auto_207347 ) ) ( not ( = ?auto_207345 ?auto_207347 ) ) ( not ( = ?auto_207348 ?auto_207347 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_207344 ?auto_207346 ?auto_207345 ?auto_207347 ?auto_207348 ?auto_207343 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_207480 - OBJ
      ?auto_207481 - OBJ
      ?auto_207482 - OBJ
      ?auto_207483 - OBJ
      ?auto_207484 - OBJ
      ?auto_207479 - LOCATION
    )
    :vars
    (
      ?auto_207486 - LOCATION
      ?auto_207485 - CITY
      ?auto_207487 - LOCATION
      ?auto_207488 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_207486 ?auto_207485 ) ( IN-CITY ?auto_207479 ?auto_207485 ) ( not ( = ?auto_207479 ?auto_207486 ) ) ( OBJ-AT ?auto_207484 ?auto_207486 ) ( IN-CITY ?auto_207487 ?auto_207485 ) ( not ( = ?auto_207479 ?auto_207487 ) ) ( OBJ-AT ?auto_207482 ?auto_207487 ) ( OBJ-AT ?auto_207481 ?auto_207486 ) ( OBJ-AT ?auto_207483 ?auto_207487 ) ( OBJ-AT ?auto_207480 ?auto_207486 ) ( TRUCK-AT ?auto_207488 ?auto_207479 ) ( not ( = ?auto_207480 ?auto_207483 ) ) ( not ( = ?auto_207487 ?auto_207486 ) ) ( not ( = ?auto_207480 ?auto_207481 ) ) ( not ( = ?auto_207483 ?auto_207481 ) ) ( not ( = ?auto_207480 ?auto_207482 ) ) ( not ( = ?auto_207483 ?auto_207482 ) ) ( not ( = ?auto_207481 ?auto_207482 ) ) ( not ( = ?auto_207480 ?auto_207484 ) ) ( not ( = ?auto_207483 ?auto_207484 ) ) ( not ( = ?auto_207481 ?auto_207484 ) ) ( not ( = ?auto_207482 ?auto_207484 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_207480 ?auto_207483 ?auto_207481 ?auto_207484 ?auto_207482 ?auto_207479 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_207523 - OBJ
      ?auto_207524 - OBJ
      ?auto_207525 - OBJ
      ?auto_207526 - OBJ
      ?auto_207527 - OBJ
      ?auto_207522 - LOCATION
    )
    :vars
    (
      ?auto_207529 - LOCATION
      ?auto_207528 - CITY
      ?auto_207530 - LOCATION
      ?auto_207531 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_207529 ?auto_207528 ) ( IN-CITY ?auto_207522 ?auto_207528 ) ( not ( = ?auto_207522 ?auto_207529 ) ) ( OBJ-AT ?auto_207526 ?auto_207529 ) ( IN-CITY ?auto_207530 ?auto_207528 ) ( not ( = ?auto_207522 ?auto_207530 ) ) ( OBJ-AT ?auto_207525 ?auto_207530 ) ( OBJ-AT ?auto_207524 ?auto_207529 ) ( OBJ-AT ?auto_207527 ?auto_207530 ) ( OBJ-AT ?auto_207523 ?auto_207529 ) ( TRUCK-AT ?auto_207531 ?auto_207522 ) ( not ( = ?auto_207523 ?auto_207527 ) ) ( not ( = ?auto_207530 ?auto_207529 ) ) ( not ( = ?auto_207523 ?auto_207524 ) ) ( not ( = ?auto_207527 ?auto_207524 ) ) ( not ( = ?auto_207523 ?auto_207525 ) ) ( not ( = ?auto_207527 ?auto_207525 ) ) ( not ( = ?auto_207524 ?auto_207525 ) ) ( not ( = ?auto_207523 ?auto_207526 ) ) ( not ( = ?auto_207527 ?auto_207526 ) ) ( not ( = ?auto_207524 ?auto_207526 ) ) ( not ( = ?auto_207525 ?auto_207526 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_207523 ?auto_207527 ?auto_207524 ?auto_207526 ?auto_207525 ?auto_207522 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_207657 - OBJ
      ?auto_207658 - OBJ
      ?auto_207659 - OBJ
      ?auto_207660 - OBJ
      ?auto_207661 - OBJ
      ?auto_207656 - LOCATION
    )
    :vars
    (
      ?auto_207663 - LOCATION
      ?auto_207662 - CITY
      ?auto_207664 - LOCATION
      ?auto_207665 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_207663 ?auto_207662 ) ( IN-CITY ?auto_207656 ?auto_207662 ) ( not ( = ?auto_207656 ?auto_207663 ) ) ( OBJ-AT ?auto_207659 ?auto_207663 ) ( IN-CITY ?auto_207664 ?auto_207662 ) ( not ( = ?auto_207656 ?auto_207664 ) ) ( OBJ-AT ?auto_207661 ?auto_207664 ) ( OBJ-AT ?auto_207658 ?auto_207663 ) ( OBJ-AT ?auto_207660 ?auto_207664 ) ( OBJ-AT ?auto_207657 ?auto_207663 ) ( TRUCK-AT ?auto_207665 ?auto_207656 ) ( not ( = ?auto_207657 ?auto_207660 ) ) ( not ( = ?auto_207664 ?auto_207663 ) ) ( not ( = ?auto_207657 ?auto_207658 ) ) ( not ( = ?auto_207660 ?auto_207658 ) ) ( not ( = ?auto_207657 ?auto_207661 ) ) ( not ( = ?auto_207660 ?auto_207661 ) ) ( not ( = ?auto_207658 ?auto_207661 ) ) ( not ( = ?auto_207657 ?auto_207659 ) ) ( not ( = ?auto_207660 ?auto_207659 ) ) ( not ( = ?auto_207658 ?auto_207659 ) ) ( not ( = ?auto_207661 ?auto_207659 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_207657 ?auto_207660 ?auto_207658 ?auto_207659 ?auto_207661 ?auto_207656 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_207747 - OBJ
      ?auto_207748 - OBJ
      ?auto_207749 - OBJ
      ?auto_207750 - OBJ
      ?auto_207751 - OBJ
      ?auto_207746 - LOCATION
    )
    :vars
    (
      ?auto_207753 - LOCATION
      ?auto_207752 - CITY
      ?auto_207754 - LOCATION
      ?auto_207755 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_207753 ?auto_207752 ) ( IN-CITY ?auto_207746 ?auto_207752 ) ( not ( = ?auto_207746 ?auto_207753 ) ) ( OBJ-AT ?auto_207749 ?auto_207753 ) ( IN-CITY ?auto_207754 ?auto_207752 ) ( not ( = ?auto_207746 ?auto_207754 ) ) ( OBJ-AT ?auto_207750 ?auto_207754 ) ( OBJ-AT ?auto_207748 ?auto_207753 ) ( OBJ-AT ?auto_207751 ?auto_207754 ) ( OBJ-AT ?auto_207747 ?auto_207753 ) ( TRUCK-AT ?auto_207755 ?auto_207746 ) ( not ( = ?auto_207747 ?auto_207751 ) ) ( not ( = ?auto_207754 ?auto_207753 ) ) ( not ( = ?auto_207747 ?auto_207748 ) ) ( not ( = ?auto_207751 ?auto_207748 ) ) ( not ( = ?auto_207747 ?auto_207750 ) ) ( not ( = ?auto_207751 ?auto_207750 ) ) ( not ( = ?auto_207748 ?auto_207750 ) ) ( not ( = ?auto_207747 ?auto_207749 ) ) ( not ( = ?auto_207751 ?auto_207749 ) ) ( not ( = ?auto_207748 ?auto_207749 ) ) ( not ( = ?auto_207750 ?auto_207749 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_207747 ?auto_207751 ?auto_207748 ?auto_207749 ?auto_207750 ?auto_207746 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_207974 - OBJ
      ?auto_207975 - OBJ
      ?auto_207976 - OBJ
      ?auto_207977 - OBJ
      ?auto_207978 - OBJ
      ?auto_207973 - LOCATION
    )
    :vars
    (
      ?auto_207980 - LOCATION
      ?auto_207979 - CITY
      ?auto_207981 - LOCATION
      ?auto_207982 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_207980 ?auto_207979 ) ( IN-CITY ?auto_207973 ?auto_207979 ) ( not ( = ?auto_207973 ?auto_207980 ) ) ( OBJ-AT ?auto_207978 ?auto_207980 ) ( IN-CITY ?auto_207981 ?auto_207979 ) ( not ( = ?auto_207973 ?auto_207981 ) ) ( OBJ-AT ?auto_207975 ?auto_207981 ) ( OBJ-AT ?auto_207977 ?auto_207980 ) ( OBJ-AT ?auto_207976 ?auto_207981 ) ( OBJ-AT ?auto_207974 ?auto_207980 ) ( TRUCK-AT ?auto_207982 ?auto_207973 ) ( not ( = ?auto_207974 ?auto_207976 ) ) ( not ( = ?auto_207981 ?auto_207980 ) ) ( not ( = ?auto_207974 ?auto_207977 ) ) ( not ( = ?auto_207976 ?auto_207977 ) ) ( not ( = ?auto_207974 ?auto_207975 ) ) ( not ( = ?auto_207976 ?auto_207975 ) ) ( not ( = ?auto_207977 ?auto_207975 ) ) ( not ( = ?auto_207974 ?auto_207978 ) ) ( not ( = ?auto_207976 ?auto_207978 ) ) ( not ( = ?auto_207977 ?auto_207978 ) ) ( not ( = ?auto_207975 ?auto_207978 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_207974 ?auto_207976 ?auto_207977 ?auto_207978 ?auto_207975 ?auto_207973 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_208017 - OBJ
      ?auto_208018 - OBJ
      ?auto_208019 - OBJ
      ?auto_208020 - OBJ
      ?auto_208021 - OBJ
      ?auto_208016 - LOCATION
    )
    :vars
    (
      ?auto_208023 - LOCATION
      ?auto_208022 - CITY
      ?auto_208024 - LOCATION
      ?auto_208025 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_208023 ?auto_208022 ) ( IN-CITY ?auto_208016 ?auto_208022 ) ( not ( = ?auto_208016 ?auto_208023 ) ) ( OBJ-AT ?auto_208020 ?auto_208023 ) ( IN-CITY ?auto_208024 ?auto_208022 ) ( not ( = ?auto_208016 ?auto_208024 ) ) ( OBJ-AT ?auto_208018 ?auto_208024 ) ( OBJ-AT ?auto_208021 ?auto_208023 ) ( OBJ-AT ?auto_208019 ?auto_208024 ) ( OBJ-AT ?auto_208017 ?auto_208023 ) ( TRUCK-AT ?auto_208025 ?auto_208016 ) ( not ( = ?auto_208017 ?auto_208019 ) ) ( not ( = ?auto_208024 ?auto_208023 ) ) ( not ( = ?auto_208017 ?auto_208021 ) ) ( not ( = ?auto_208019 ?auto_208021 ) ) ( not ( = ?auto_208017 ?auto_208018 ) ) ( not ( = ?auto_208019 ?auto_208018 ) ) ( not ( = ?auto_208021 ?auto_208018 ) ) ( not ( = ?auto_208017 ?auto_208020 ) ) ( not ( = ?auto_208019 ?auto_208020 ) ) ( not ( = ?auto_208021 ?auto_208020 ) ) ( not ( = ?auto_208018 ?auto_208020 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_208017 ?auto_208019 ?auto_208021 ?auto_208020 ?auto_208018 ?auto_208016 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_208060 - OBJ
      ?auto_208061 - OBJ
      ?auto_208062 - OBJ
      ?auto_208063 - OBJ
      ?auto_208064 - OBJ
      ?auto_208059 - LOCATION
    )
    :vars
    (
      ?auto_208066 - LOCATION
      ?auto_208065 - CITY
      ?auto_208067 - LOCATION
      ?auto_208068 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_208066 ?auto_208065 ) ( IN-CITY ?auto_208059 ?auto_208065 ) ( not ( = ?auto_208059 ?auto_208066 ) ) ( OBJ-AT ?auto_208064 ?auto_208066 ) ( IN-CITY ?auto_208067 ?auto_208065 ) ( not ( = ?auto_208059 ?auto_208067 ) ) ( OBJ-AT ?auto_208061 ?auto_208067 ) ( OBJ-AT ?auto_208062 ?auto_208066 ) ( OBJ-AT ?auto_208063 ?auto_208067 ) ( OBJ-AT ?auto_208060 ?auto_208066 ) ( TRUCK-AT ?auto_208068 ?auto_208059 ) ( not ( = ?auto_208060 ?auto_208063 ) ) ( not ( = ?auto_208067 ?auto_208066 ) ) ( not ( = ?auto_208060 ?auto_208062 ) ) ( not ( = ?auto_208063 ?auto_208062 ) ) ( not ( = ?auto_208060 ?auto_208061 ) ) ( not ( = ?auto_208063 ?auto_208061 ) ) ( not ( = ?auto_208062 ?auto_208061 ) ) ( not ( = ?auto_208060 ?auto_208064 ) ) ( not ( = ?auto_208063 ?auto_208064 ) ) ( not ( = ?auto_208062 ?auto_208064 ) ) ( not ( = ?auto_208061 ?auto_208064 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_208060 ?auto_208063 ?auto_208062 ?auto_208064 ?auto_208061 ?auto_208059 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_208103 - OBJ
      ?auto_208104 - OBJ
      ?auto_208105 - OBJ
      ?auto_208106 - OBJ
      ?auto_208107 - OBJ
      ?auto_208102 - LOCATION
    )
    :vars
    (
      ?auto_208109 - LOCATION
      ?auto_208108 - CITY
      ?auto_208110 - LOCATION
      ?auto_208111 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_208109 ?auto_208108 ) ( IN-CITY ?auto_208102 ?auto_208108 ) ( not ( = ?auto_208102 ?auto_208109 ) ) ( OBJ-AT ?auto_208106 ?auto_208109 ) ( IN-CITY ?auto_208110 ?auto_208108 ) ( not ( = ?auto_208102 ?auto_208110 ) ) ( OBJ-AT ?auto_208104 ?auto_208110 ) ( OBJ-AT ?auto_208105 ?auto_208109 ) ( OBJ-AT ?auto_208107 ?auto_208110 ) ( OBJ-AT ?auto_208103 ?auto_208109 ) ( TRUCK-AT ?auto_208111 ?auto_208102 ) ( not ( = ?auto_208103 ?auto_208107 ) ) ( not ( = ?auto_208110 ?auto_208109 ) ) ( not ( = ?auto_208103 ?auto_208105 ) ) ( not ( = ?auto_208107 ?auto_208105 ) ) ( not ( = ?auto_208103 ?auto_208104 ) ) ( not ( = ?auto_208107 ?auto_208104 ) ) ( not ( = ?auto_208105 ?auto_208104 ) ) ( not ( = ?auto_208103 ?auto_208106 ) ) ( not ( = ?auto_208107 ?auto_208106 ) ) ( not ( = ?auto_208105 ?auto_208106 ) ) ( not ( = ?auto_208104 ?auto_208106 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_208103 ?auto_208107 ?auto_208105 ?auto_208106 ?auto_208104 ?auto_208102 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_208330 - OBJ
      ?auto_208331 - OBJ
      ?auto_208332 - OBJ
      ?auto_208333 - OBJ
      ?auto_208334 - OBJ
      ?auto_208329 - LOCATION
    )
    :vars
    (
      ?auto_208336 - LOCATION
      ?auto_208335 - CITY
      ?auto_208337 - LOCATION
      ?auto_208338 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_208336 ?auto_208335 ) ( IN-CITY ?auto_208329 ?auto_208335 ) ( not ( = ?auto_208329 ?auto_208336 ) ) ( OBJ-AT ?auto_208332 ?auto_208336 ) ( IN-CITY ?auto_208337 ?auto_208335 ) ( not ( = ?auto_208329 ?auto_208337 ) ) ( OBJ-AT ?auto_208331 ?auto_208337 ) ( OBJ-AT ?auto_208334 ?auto_208336 ) ( OBJ-AT ?auto_208333 ?auto_208337 ) ( OBJ-AT ?auto_208330 ?auto_208336 ) ( TRUCK-AT ?auto_208338 ?auto_208329 ) ( not ( = ?auto_208330 ?auto_208333 ) ) ( not ( = ?auto_208337 ?auto_208336 ) ) ( not ( = ?auto_208330 ?auto_208334 ) ) ( not ( = ?auto_208333 ?auto_208334 ) ) ( not ( = ?auto_208330 ?auto_208331 ) ) ( not ( = ?auto_208333 ?auto_208331 ) ) ( not ( = ?auto_208334 ?auto_208331 ) ) ( not ( = ?auto_208330 ?auto_208332 ) ) ( not ( = ?auto_208333 ?auto_208332 ) ) ( not ( = ?auto_208334 ?auto_208332 ) ) ( not ( = ?auto_208331 ?auto_208332 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_208330 ?auto_208333 ?auto_208334 ?auto_208332 ?auto_208331 ?auto_208329 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_208373 - OBJ
      ?auto_208374 - OBJ
      ?auto_208375 - OBJ
      ?auto_208376 - OBJ
      ?auto_208377 - OBJ
      ?auto_208372 - LOCATION
    )
    :vars
    (
      ?auto_208379 - LOCATION
      ?auto_208378 - CITY
      ?auto_208380 - LOCATION
      ?auto_208381 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_208379 ?auto_208378 ) ( IN-CITY ?auto_208372 ?auto_208378 ) ( not ( = ?auto_208372 ?auto_208379 ) ) ( OBJ-AT ?auto_208375 ?auto_208379 ) ( IN-CITY ?auto_208380 ?auto_208378 ) ( not ( = ?auto_208372 ?auto_208380 ) ) ( OBJ-AT ?auto_208374 ?auto_208380 ) ( OBJ-AT ?auto_208376 ?auto_208379 ) ( OBJ-AT ?auto_208377 ?auto_208380 ) ( OBJ-AT ?auto_208373 ?auto_208379 ) ( TRUCK-AT ?auto_208381 ?auto_208372 ) ( not ( = ?auto_208373 ?auto_208377 ) ) ( not ( = ?auto_208380 ?auto_208379 ) ) ( not ( = ?auto_208373 ?auto_208376 ) ) ( not ( = ?auto_208377 ?auto_208376 ) ) ( not ( = ?auto_208373 ?auto_208374 ) ) ( not ( = ?auto_208377 ?auto_208374 ) ) ( not ( = ?auto_208376 ?auto_208374 ) ) ( not ( = ?auto_208373 ?auto_208375 ) ) ( not ( = ?auto_208377 ?auto_208375 ) ) ( not ( = ?auto_208376 ?auto_208375 ) ) ( not ( = ?auto_208374 ?auto_208375 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_208373 ?auto_208377 ?auto_208376 ?auto_208375 ?auto_208374 ?auto_208372 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_208979 - OBJ
      ?auto_208980 - OBJ
      ?auto_208981 - OBJ
      ?auto_208982 - OBJ
      ?auto_208983 - OBJ
      ?auto_208978 - LOCATION
    )
    :vars
    (
      ?auto_208985 - LOCATION
      ?auto_208984 - CITY
      ?auto_208986 - LOCATION
      ?auto_208987 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_208985 ?auto_208984 ) ( IN-CITY ?auto_208978 ?auto_208984 ) ( not ( = ?auto_208978 ?auto_208985 ) ) ( OBJ-AT ?auto_208980 ?auto_208985 ) ( IN-CITY ?auto_208986 ?auto_208984 ) ( not ( = ?auto_208978 ?auto_208986 ) ) ( OBJ-AT ?auto_208983 ?auto_208986 ) ( OBJ-AT ?auto_208982 ?auto_208985 ) ( OBJ-AT ?auto_208981 ?auto_208986 ) ( OBJ-AT ?auto_208979 ?auto_208985 ) ( TRUCK-AT ?auto_208987 ?auto_208978 ) ( not ( = ?auto_208979 ?auto_208981 ) ) ( not ( = ?auto_208986 ?auto_208985 ) ) ( not ( = ?auto_208979 ?auto_208982 ) ) ( not ( = ?auto_208981 ?auto_208982 ) ) ( not ( = ?auto_208979 ?auto_208983 ) ) ( not ( = ?auto_208981 ?auto_208983 ) ) ( not ( = ?auto_208982 ?auto_208983 ) ) ( not ( = ?auto_208979 ?auto_208980 ) ) ( not ( = ?auto_208981 ?auto_208980 ) ) ( not ( = ?auto_208982 ?auto_208980 ) ) ( not ( = ?auto_208983 ?auto_208980 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_208979 ?auto_208981 ?auto_208982 ?auto_208980 ?auto_208983 ?auto_208978 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209022 - OBJ
      ?auto_209023 - OBJ
      ?auto_209024 - OBJ
      ?auto_209025 - OBJ
      ?auto_209026 - OBJ
      ?auto_209021 - LOCATION
    )
    :vars
    (
      ?auto_209028 - LOCATION
      ?auto_209027 - CITY
      ?auto_209029 - LOCATION
      ?auto_209030 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209028 ?auto_209027 ) ( IN-CITY ?auto_209021 ?auto_209027 ) ( not ( = ?auto_209021 ?auto_209028 ) ) ( OBJ-AT ?auto_209023 ?auto_209028 ) ( IN-CITY ?auto_209029 ?auto_209027 ) ( not ( = ?auto_209021 ?auto_209029 ) ) ( OBJ-AT ?auto_209025 ?auto_209029 ) ( OBJ-AT ?auto_209026 ?auto_209028 ) ( OBJ-AT ?auto_209024 ?auto_209029 ) ( OBJ-AT ?auto_209022 ?auto_209028 ) ( TRUCK-AT ?auto_209030 ?auto_209021 ) ( not ( = ?auto_209022 ?auto_209024 ) ) ( not ( = ?auto_209029 ?auto_209028 ) ) ( not ( = ?auto_209022 ?auto_209026 ) ) ( not ( = ?auto_209024 ?auto_209026 ) ) ( not ( = ?auto_209022 ?auto_209025 ) ) ( not ( = ?auto_209024 ?auto_209025 ) ) ( not ( = ?auto_209026 ?auto_209025 ) ) ( not ( = ?auto_209022 ?auto_209023 ) ) ( not ( = ?auto_209024 ?auto_209023 ) ) ( not ( = ?auto_209026 ?auto_209023 ) ) ( not ( = ?auto_209025 ?auto_209023 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209022 ?auto_209024 ?auto_209026 ?auto_209023 ?auto_209025 ?auto_209021 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209203 - OBJ
      ?auto_209204 - OBJ
      ?auto_209205 - OBJ
      ?auto_209206 - OBJ
      ?auto_209207 - OBJ
      ?auto_209202 - LOCATION
    )
    :vars
    (
      ?auto_209209 - LOCATION
      ?auto_209208 - CITY
      ?auto_209210 - LOCATION
      ?auto_209211 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209209 ?auto_209208 ) ( IN-CITY ?auto_209202 ?auto_209208 ) ( not ( = ?auto_209202 ?auto_209209 ) ) ( OBJ-AT ?auto_209204 ?auto_209209 ) ( IN-CITY ?auto_209210 ?auto_209208 ) ( not ( = ?auto_209202 ?auto_209210 ) ) ( OBJ-AT ?auto_209207 ?auto_209210 ) ( OBJ-AT ?auto_209205 ?auto_209209 ) ( OBJ-AT ?auto_209206 ?auto_209210 ) ( OBJ-AT ?auto_209203 ?auto_209209 ) ( TRUCK-AT ?auto_209211 ?auto_209202 ) ( not ( = ?auto_209203 ?auto_209206 ) ) ( not ( = ?auto_209210 ?auto_209209 ) ) ( not ( = ?auto_209203 ?auto_209205 ) ) ( not ( = ?auto_209206 ?auto_209205 ) ) ( not ( = ?auto_209203 ?auto_209207 ) ) ( not ( = ?auto_209206 ?auto_209207 ) ) ( not ( = ?auto_209205 ?auto_209207 ) ) ( not ( = ?auto_209203 ?auto_209204 ) ) ( not ( = ?auto_209206 ?auto_209204 ) ) ( not ( = ?auto_209205 ?auto_209204 ) ) ( not ( = ?auto_209207 ?auto_209204 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209203 ?auto_209206 ?auto_209205 ?auto_209204 ?auto_209207 ?auto_209202 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209293 - OBJ
      ?auto_209294 - OBJ
      ?auto_209295 - OBJ
      ?auto_209296 - OBJ
      ?auto_209297 - OBJ
      ?auto_209292 - LOCATION
    )
    :vars
    (
      ?auto_209299 - LOCATION
      ?auto_209298 - CITY
      ?auto_209300 - LOCATION
      ?auto_209301 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209299 ?auto_209298 ) ( IN-CITY ?auto_209292 ?auto_209298 ) ( not ( = ?auto_209292 ?auto_209299 ) ) ( OBJ-AT ?auto_209294 ?auto_209299 ) ( IN-CITY ?auto_209300 ?auto_209298 ) ( not ( = ?auto_209292 ?auto_209300 ) ) ( OBJ-AT ?auto_209296 ?auto_209300 ) ( OBJ-AT ?auto_209295 ?auto_209299 ) ( OBJ-AT ?auto_209297 ?auto_209300 ) ( OBJ-AT ?auto_209293 ?auto_209299 ) ( TRUCK-AT ?auto_209301 ?auto_209292 ) ( not ( = ?auto_209293 ?auto_209297 ) ) ( not ( = ?auto_209300 ?auto_209299 ) ) ( not ( = ?auto_209293 ?auto_209295 ) ) ( not ( = ?auto_209297 ?auto_209295 ) ) ( not ( = ?auto_209293 ?auto_209296 ) ) ( not ( = ?auto_209297 ?auto_209296 ) ) ( not ( = ?auto_209295 ?auto_209296 ) ) ( not ( = ?auto_209293 ?auto_209294 ) ) ( not ( = ?auto_209297 ?auto_209294 ) ) ( not ( = ?auto_209295 ?auto_209294 ) ) ( not ( = ?auto_209296 ?auto_209294 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209293 ?auto_209297 ?auto_209295 ?auto_209294 ?auto_209296 ?auto_209292 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209474 - OBJ
      ?auto_209475 - OBJ
      ?auto_209476 - OBJ
      ?auto_209477 - OBJ
      ?auto_209478 - OBJ
      ?auto_209473 - LOCATION
    )
    :vars
    (
      ?auto_209480 - LOCATION
      ?auto_209479 - CITY
      ?auto_209481 - LOCATION
      ?auto_209482 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209480 ?auto_209479 ) ( IN-CITY ?auto_209473 ?auto_209479 ) ( not ( = ?auto_209473 ?auto_209480 ) ) ( OBJ-AT ?auto_209475 ?auto_209480 ) ( IN-CITY ?auto_209481 ?auto_209479 ) ( not ( = ?auto_209473 ?auto_209481 ) ) ( OBJ-AT ?auto_209476 ?auto_209481 ) ( OBJ-AT ?auto_209478 ?auto_209480 ) ( OBJ-AT ?auto_209477 ?auto_209481 ) ( OBJ-AT ?auto_209474 ?auto_209480 ) ( TRUCK-AT ?auto_209482 ?auto_209473 ) ( not ( = ?auto_209474 ?auto_209477 ) ) ( not ( = ?auto_209481 ?auto_209480 ) ) ( not ( = ?auto_209474 ?auto_209478 ) ) ( not ( = ?auto_209477 ?auto_209478 ) ) ( not ( = ?auto_209474 ?auto_209476 ) ) ( not ( = ?auto_209477 ?auto_209476 ) ) ( not ( = ?auto_209478 ?auto_209476 ) ) ( not ( = ?auto_209474 ?auto_209475 ) ) ( not ( = ?auto_209477 ?auto_209475 ) ) ( not ( = ?auto_209478 ?auto_209475 ) ) ( not ( = ?auto_209476 ?auto_209475 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209474 ?auto_209477 ?auto_209478 ?auto_209475 ?auto_209476 ?auto_209473 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209517 - OBJ
      ?auto_209518 - OBJ
      ?auto_209519 - OBJ
      ?auto_209520 - OBJ
      ?auto_209521 - OBJ
      ?auto_209516 - LOCATION
    )
    :vars
    (
      ?auto_209523 - LOCATION
      ?auto_209522 - CITY
      ?auto_209524 - LOCATION
      ?auto_209525 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209523 ?auto_209522 ) ( IN-CITY ?auto_209516 ?auto_209522 ) ( not ( = ?auto_209516 ?auto_209523 ) ) ( OBJ-AT ?auto_209518 ?auto_209523 ) ( IN-CITY ?auto_209524 ?auto_209522 ) ( not ( = ?auto_209516 ?auto_209524 ) ) ( OBJ-AT ?auto_209519 ?auto_209524 ) ( OBJ-AT ?auto_209520 ?auto_209523 ) ( OBJ-AT ?auto_209521 ?auto_209524 ) ( OBJ-AT ?auto_209517 ?auto_209523 ) ( TRUCK-AT ?auto_209525 ?auto_209516 ) ( not ( = ?auto_209517 ?auto_209521 ) ) ( not ( = ?auto_209524 ?auto_209523 ) ) ( not ( = ?auto_209517 ?auto_209520 ) ) ( not ( = ?auto_209521 ?auto_209520 ) ) ( not ( = ?auto_209517 ?auto_209519 ) ) ( not ( = ?auto_209521 ?auto_209519 ) ) ( not ( = ?auto_209520 ?auto_209519 ) ) ( not ( = ?auto_209517 ?auto_209518 ) ) ( not ( = ?auto_209521 ?auto_209518 ) ) ( not ( = ?auto_209520 ?auto_209518 ) ) ( not ( = ?auto_209519 ?auto_209518 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209517 ?auto_209521 ?auto_209520 ?auto_209518 ?auto_209519 ?auto_209516 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_210215 - OBJ
      ?auto_210216 - OBJ
      ?auto_210217 - OBJ
      ?auto_210218 - OBJ
      ?auto_210219 - OBJ
      ?auto_210214 - LOCATION
    )
    :vars
    (
      ?auto_210221 - LOCATION
      ?auto_210220 - CITY
      ?auto_210222 - LOCATION
      ?auto_210223 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210221 ?auto_210220 ) ( IN-CITY ?auto_210214 ?auto_210220 ) ( not ( = ?auto_210214 ?auto_210221 ) ) ( OBJ-AT ?auto_210219 ?auto_210221 ) ( IN-CITY ?auto_210222 ?auto_210220 ) ( not ( = ?auto_210214 ?auto_210222 ) ) ( OBJ-AT ?auto_210218 ?auto_210222 ) ( OBJ-AT ?auto_210217 ?auto_210221 ) ( OBJ-AT ?auto_210215 ?auto_210222 ) ( OBJ-AT ?auto_210216 ?auto_210221 ) ( TRUCK-AT ?auto_210223 ?auto_210214 ) ( not ( = ?auto_210216 ?auto_210215 ) ) ( not ( = ?auto_210222 ?auto_210221 ) ) ( not ( = ?auto_210216 ?auto_210217 ) ) ( not ( = ?auto_210215 ?auto_210217 ) ) ( not ( = ?auto_210216 ?auto_210218 ) ) ( not ( = ?auto_210215 ?auto_210218 ) ) ( not ( = ?auto_210217 ?auto_210218 ) ) ( not ( = ?auto_210216 ?auto_210219 ) ) ( not ( = ?auto_210215 ?auto_210219 ) ) ( not ( = ?auto_210217 ?auto_210219 ) ) ( not ( = ?auto_210218 ?auto_210219 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_210216 ?auto_210215 ?auto_210217 ?auto_210219 ?auto_210218 ?auto_210214 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_210258 - OBJ
      ?auto_210259 - OBJ
      ?auto_210260 - OBJ
      ?auto_210261 - OBJ
      ?auto_210262 - OBJ
      ?auto_210257 - LOCATION
    )
    :vars
    (
      ?auto_210264 - LOCATION
      ?auto_210263 - CITY
      ?auto_210265 - LOCATION
      ?auto_210266 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210264 ?auto_210263 ) ( IN-CITY ?auto_210257 ?auto_210263 ) ( not ( = ?auto_210257 ?auto_210264 ) ) ( OBJ-AT ?auto_210261 ?auto_210264 ) ( IN-CITY ?auto_210265 ?auto_210263 ) ( not ( = ?auto_210257 ?auto_210265 ) ) ( OBJ-AT ?auto_210262 ?auto_210265 ) ( OBJ-AT ?auto_210260 ?auto_210264 ) ( OBJ-AT ?auto_210258 ?auto_210265 ) ( OBJ-AT ?auto_210259 ?auto_210264 ) ( TRUCK-AT ?auto_210266 ?auto_210257 ) ( not ( = ?auto_210259 ?auto_210258 ) ) ( not ( = ?auto_210265 ?auto_210264 ) ) ( not ( = ?auto_210259 ?auto_210260 ) ) ( not ( = ?auto_210258 ?auto_210260 ) ) ( not ( = ?auto_210259 ?auto_210262 ) ) ( not ( = ?auto_210258 ?auto_210262 ) ) ( not ( = ?auto_210260 ?auto_210262 ) ) ( not ( = ?auto_210259 ?auto_210261 ) ) ( not ( = ?auto_210258 ?auto_210261 ) ) ( not ( = ?auto_210260 ?auto_210261 ) ) ( not ( = ?auto_210262 ?auto_210261 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_210259 ?auto_210258 ?auto_210260 ?auto_210261 ?auto_210262 ?auto_210257 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_210301 - OBJ
      ?auto_210302 - OBJ
      ?auto_210303 - OBJ
      ?auto_210304 - OBJ
      ?auto_210305 - OBJ
      ?auto_210300 - LOCATION
    )
    :vars
    (
      ?auto_210307 - LOCATION
      ?auto_210306 - CITY
      ?auto_210308 - LOCATION
      ?auto_210309 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210307 ?auto_210306 ) ( IN-CITY ?auto_210300 ?auto_210306 ) ( not ( = ?auto_210300 ?auto_210307 ) ) ( OBJ-AT ?auto_210305 ?auto_210307 ) ( IN-CITY ?auto_210308 ?auto_210306 ) ( not ( = ?auto_210300 ?auto_210308 ) ) ( OBJ-AT ?auto_210303 ?auto_210308 ) ( OBJ-AT ?auto_210304 ?auto_210307 ) ( OBJ-AT ?auto_210301 ?auto_210308 ) ( OBJ-AT ?auto_210302 ?auto_210307 ) ( TRUCK-AT ?auto_210309 ?auto_210300 ) ( not ( = ?auto_210302 ?auto_210301 ) ) ( not ( = ?auto_210308 ?auto_210307 ) ) ( not ( = ?auto_210302 ?auto_210304 ) ) ( not ( = ?auto_210301 ?auto_210304 ) ) ( not ( = ?auto_210302 ?auto_210303 ) ) ( not ( = ?auto_210301 ?auto_210303 ) ) ( not ( = ?auto_210304 ?auto_210303 ) ) ( not ( = ?auto_210302 ?auto_210305 ) ) ( not ( = ?auto_210301 ?auto_210305 ) ) ( not ( = ?auto_210304 ?auto_210305 ) ) ( not ( = ?auto_210303 ?auto_210305 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_210302 ?auto_210301 ?auto_210304 ?auto_210305 ?auto_210303 ?auto_210300 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_210344 - OBJ
      ?auto_210345 - OBJ
      ?auto_210346 - OBJ
      ?auto_210347 - OBJ
      ?auto_210348 - OBJ
      ?auto_210343 - LOCATION
    )
    :vars
    (
      ?auto_210350 - LOCATION
      ?auto_210349 - CITY
      ?auto_210351 - LOCATION
      ?auto_210352 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210350 ?auto_210349 ) ( IN-CITY ?auto_210343 ?auto_210349 ) ( not ( = ?auto_210343 ?auto_210350 ) ) ( OBJ-AT ?auto_210347 ?auto_210350 ) ( IN-CITY ?auto_210351 ?auto_210349 ) ( not ( = ?auto_210343 ?auto_210351 ) ) ( OBJ-AT ?auto_210346 ?auto_210351 ) ( OBJ-AT ?auto_210348 ?auto_210350 ) ( OBJ-AT ?auto_210344 ?auto_210351 ) ( OBJ-AT ?auto_210345 ?auto_210350 ) ( TRUCK-AT ?auto_210352 ?auto_210343 ) ( not ( = ?auto_210345 ?auto_210344 ) ) ( not ( = ?auto_210351 ?auto_210350 ) ) ( not ( = ?auto_210345 ?auto_210348 ) ) ( not ( = ?auto_210344 ?auto_210348 ) ) ( not ( = ?auto_210345 ?auto_210346 ) ) ( not ( = ?auto_210344 ?auto_210346 ) ) ( not ( = ?auto_210348 ?auto_210346 ) ) ( not ( = ?auto_210345 ?auto_210347 ) ) ( not ( = ?auto_210344 ?auto_210347 ) ) ( not ( = ?auto_210348 ?auto_210347 ) ) ( not ( = ?auto_210346 ?auto_210347 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_210345 ?auto_210344 ?auto_210348 ?auto_210347 ?auto_210346 ?auto_210343 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_210525 - OBJ
      ?auto_210526 - OBJ
      ?auto_210527 - OBJ
      ?auto_210528 - OBJ
      ?auto_210529 - OBJ
      ?auto_210524 - LOCATION
    )
    :vars
    (
      ?auto_210531 - LOCATION
      ?auto_210530 - CITY
      ?auto_210532 - LOCATION
      ?auto_210533 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210531 ?auto_210530 ) ( IN-CITY ?auto_210524 ?auto_210530 ) ( not ( = ?auto_210524 ?auto_210531 ) ) ( OBJ-AT ?auto_210527 ?auto_210531 ) ( IN-CITY ?auto_210532 ?auto_210530 ) ( not ( = ?auto_210524 ?auto_210532 ) ) ( OBJ-AT ?auto_210529 ?auto_210532 ) ( OBJ-AT ?auto_210528 ?auto_210531 ) ( OBJ-AT ?auto_210525 ?auto_210532 ) ( OBJ-AT ?auto_210526 ?auto_210531 ) ( TRUCK-AT ?auto_210533 ?auto_210524 ) ( not ( = ?auto_210526 ?auto_210525 ) ) ( not ( = ?auto_210532 ?auto_210531 ) ) ( not ( = ?auto_210526 ?auto_210528 ) ) ( not ( = ?auto_210525 ?auto_210528 ) ) ( not ( = ?auto_210526 ?auto_210529 ) ) ( not ( = ?auto_210525 ?auto_210529 ) ) ( not ( = ?auto_210528 ?auto_210529 ) ) ( not ( = ?auto_210526 ?auto_210527 ) ) ( not ( = ?auto_210525 ?auto_210527 ) ) ( not ( = ?auto_210528 ?auto_210527 ) ) ( not ( = ?auto_210529 ?auto_210527 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_210526 ?auto_210525 ?auto_210528 ?auto_210527 ?auto_210529 ?auto_210524 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_210568 - OBJ
      ?auto_210569 - OBJ
      ?auto_210570 - OBJ
      ?auto_210571 - OBJ
      ?auto_210572 - OBJ
      ?auto_210567 - LOCATION
    )
    :vars
    (
      ?auto_210574 - LOCATION
      ?auto_210573 - CITY
      ?auto_210575 - LOCATION
      ?auto_210576 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210574 ?auto_210573 ) ( IN-CITY ?auto_210567 ?auto_210573 ) ( not ( = ?auto_210567 ?auto_210574 ) ) ( OBJ-AT ?auto_210570 ?auto_210574 ) ( IN-CITY ?auto_210575 ?auto_210573 ) ( not ( = ?auto_210567 ?auto_210575 ) ) ( OBJ-AT ?auto_210571 ?auto_210575 ) ( OBJ-AT ?auto_210572 ?auto_210574 ) ( OBJ-AT ?auto_210568 ?auto_210575 ) ( OBJ-AT ?auto_210569 ?auto_210574 ) ( TRUCK-AT ?auto_210576 ?auto_210567 ) ( not ( = ?auto_210569 ?auto_210568 ) ) ( not ( = ?auto_210575 ?auto_210574 ) ) ( not ( = ?auto_210569 ?auto_210572 ) ) ( not ( = ?auto_210568 ?auto_210572 ) ) ( not ( = ?auto_210569 ?auto_210571 ) ) ( not ( = ?auto_210568 ?auto_210571 ) ) ( not ( = ?auto_210572 ?auto_210571 ) ) ( not ( = ?auto_210569 ?auto_210570 ) ) ( not ( = ?auto_210568 ?auto_210570 ) ) ( not ( = ?auto_210572 ?auto_210570 ) ) ( not ( = ?auto_210571 ?auto_210570 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_210569 ?auto_210568 ?auto_210572 ?auto_210570 ?auto_210571 ?auto_210567 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_211412 - OBJ
      ?auto_211413 - OBJ
      ?auto_211414 - OBJ
      ?auto_211415 - OBJ
      ?auto_211416 - OBJ
      ?auto_211411 - LOCATION
    )
    :vars
    (
      ?auto_211418 - LOCATION
      ?auto_211417 - CITY
      ?auto_211419 - LOCATION
      ?auto_211420 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_211418 ?auto_211417 ) ( IN-CITY ?auto_211411 ?auto_211417 ) ( not ( = ?auto_211411 ?auto_211418 ) ) ( OBJ-AT ?auto_211416 ?auto_211418 ) ( IN-CITY ?auto_211419 ?auto_211417 ) ( not ( = ?auto_211411 ?auto_211419 ) ) ( OBJ-AT ?auto_211415 ?auto_211419 ) ( OBJ-AT ?auto_211413 ?auto_211418 ) ( OBJ-AT ?auto_211412 ?auto_211419 ) ( OBJ-AT ?auto_211414 ?auto_211418 ) ( TRUCK-AT ?auto_211420 ?auto_211411 ) ( not ( = ?auto_211414 ?auto_211412 ) ) ( not ( = ?auto_211419 ?auto_211418 ) ) ( not ( = ?auto_211414 ?auto_211413 ) ) ( not ( = ?auto_211412 ?auto_211413 ) ) ( not ( = ?auto_211414 ?auto_211415 ) ) ( not ( = ?auto_211412 ?auto_211415 ) ) ( not ( = ?auto_211413 ?auto_211415 ) ) ( not ( = ?auto_211414 ?auto_211416 ) ) ( not ( = ?auto_211412 ?auto_211416 ) ) ( not ( = ?auto_211413 ?auto_211416 ) ) ( not ( = ?auto_211415 ?auto_211416 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_211414 ?auto_211412 ?auto_211413 ?auto_211416 ?auto_211415 ?auto_211411 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_211455 - OBJ
      ?auto_211456 - OBJ
      ?auto_211457 - OBJ
      ?auto_211458 - OBJ
      ?auto_211459 - OBJ
      ?auto_211454 - LOCATION
    )
    :vars
    (
      ?auto_211461 - LOCATION
      ?auto_211460 - CITY
      ?auto_211462 - LOCATION
      ?auto_211463 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_211461 ?auto_211460 ) ( IN-CITY ?auto_211454 ?auto_211460 ) ( not ( = ?auto_211454 ?auto_211461 ) ) ( OBJ-AT ?auto_211458 ?auto_211461 ) ( IN-CITY ?auto_211462 ?auto_211460 ) ( not ( = ?auto_211454 ?auto_211462 ) ) ( OBJ-AT ?auto_211459 ?auto_211462 ) ( OBJ-AT ?auto_211456 ?auto_211461 ) ( OBJ-AT ?auto_211455 ?auto_211462 ) ( OBJ-AT ?auto_211457 ?auto_211461 ) ( TRUCK-AT ?auto_211463 ?auto_211454 ) ( not ( = ?auto_211457 ?auto_211455 ) ) ( not ( = ?auto_211462 ?auto_211461 ) ) ( not ( = ?auto_211457 ?auto_211456 ) ) ( not ( = ?auto_211455 ?auto_211456 ) ) ( not ( = ?auto_211457 ?auto_211459 ) ) ( not ( = ?auto_211455 ?auto_211459 ) ) ( not ( = ?auto_211456 ?auto_211459 ) ) ( not ( = ?auto_211457 ?auto_211458 ) ) ( not ( = ?auto_211455 ?auto_211458 ) ) ( not ( = ?auto_211456 ?auto_211458 ) ) ( not ( = ?auto_211459 ?auto_211458 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_211457 ?auto_211455 ?auto_211456 ?auto_211458 ?auto_211459 ?auto_211454 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_211684 - OBJ
      ?auto_211685 - OBJ
      ?auto_211686 - OBJ
      ?auto_211687 - OBJ
      ?auto_211688 - OBJ
      ?auto_211683 - LOCATION
    )
    :vars
    (
      ?auto_211690 - LOCATION
      ?auto_211689 - CITY
      ?auto_211691 - LOCATION
      ?auto_211692 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_211690 ?auto_211689 ) ( IN-CITY ?auto_211683 ?auto_211689 ) ( not ( = ?auto_211683 ?auto_211690 ) ) ( OBJ-AT ?auto_211688 ?auto_211690 ) ( IN-CITY ?auto_211691 ?auto_211689 ) ( not ( = ?auto_211683 ?auto_211691 ) ) ( OBJ-AT ?auto_211686 ?auto_211691 ) ( OBJ-AT ?auto_211685 ?auto_211690 ) ( OBJ-AT ?auto_211684 ?auto_211691 ) ( OBJ-AT ?auto_211687 ?auto_211690 ) ( TRUCK-AT ?auto_211692 ?auto_211683 ) ( not ( = ?auto_211687 ?auto_211684 ) ) ( not ( = ?auto_211691 ?auto_211690 ) ) ( not ( = ?auto_211687 ?auto_211685 ) ) ( not ( = ?auto_211684 ?auto_211685 ) ) ( not ( = ?auto_211687 ?auto_211686 ) ) ( not ( = ?auto_211684 ?auto_211686 ) ) ( not ( = ?auto_211685 ?auto_211686 ) ) ( not ( = ?auto_211687 ?auto_211688 ) ) ( not ( = ?auto_211684 ?auto_211688 ) ) ( not ( = ?auto_211685 ?auto_211688 ) ) ( not ( = ?auto_211686 ?auto_211688 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_211687 ?auto_211684 ?auto_211685 ?auto_211688 ?auto_211686 ?auto_211683 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_211727 - OBJ
      ?auto_211728 - OBJ
      ?auto_211729 - OBJ
      ?auto_211730 - OBJ
      ?auto_211731 - OBJ
      ?auto_211726 - LOCATION
    )
    :vars
    (
      ?auto_211733 - LOCATION
      ?auto_211732 - CITY
      ?auto_211734 - LOCATION
      ?auto_211735 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_211733 ?auto_211732 ) ( IN-CITY ?auto_211726 ?auto_211732 ) ( not ( = ?auto_211726 ?auto_211733 ) ) ( OBJ-AT ?auto_211730 ?auto_211733 ) ( IN-CITY ?auto_211734 ?auto_211732 ) ( not ( = ?auto_211726 ?auto_211734 ) ) ( OBJ-AT ?auto_211729 ?auto_211734 ) ( OBJ-AT ?auto_211728 ?auto_211733 ) ( OBJ-AT ?auto_211727 ?auto_211734 ) ( OBJ-AT ?auto_211731 ?auto_211733 ) ( TRUCK-AT ?auto_211735 ?auto_211726 ) ( not ( = ?auto_211731 ?auto_211727 ) ) ( not ( = ?auto_211734 ?auto_211733 ) ) ( not ( = ?auto_211731 ?auto_211728 ) ) ( not ( = ?auto_211727 ?auto_211728 ) ) ( not ( = ?auto_211731 ?auto_211729 ) ) ( not ( = ?auto_211727 ?auto_211729 ) ) ( not ( = ?auto_211728 ?auto_211729 ) ) ( not ( = ?auto_211731 ?auto_211730 ) ) ( not ( = ?auto_211727 ?auto_211730 ) ) ( not ( = ?auto_211728 ?auto_211730 ) ) ( not ( = ?auto_211729 ?auto_211730 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_211731 ?auto_211727 ?auto_211728 ?auto_211730 ?auto_211729 ?auto_211726 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_211814 - OBJ
      ?auto_211815 - OBJ
      ?auto_211816 - OBJ
      ?auto_211817 - OBJ
      ?auto_211818 - OBJ
      ?auto_211813 - LOCATION
    )
    :vars
    (
      ?auto_211820 - LOCATION
      ?auto_211819 - CITY
      ?auto_211821 - LOCATION
      ?auto_211822 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_211820 ?auto_211819 ) ( IN-CITY ?auto_211813 ?auto_211819 ) ( not ( = ?auto_211813 ?auto_211820 ) ) ( OBJ-AT ?auto_211816 ?auto_211820 ) ( IN-CITY ?auto_211821 ?auto_211819 ) ( not ( = ?auto_211813 ?auto_211821 ) ) ( OBJ-AT ?auto_211818 ?auto_211821 ) ( OBJ-AT ?auto_211815 ?auto_211820 ) ( OBJ-AT ?auto_211814 ?auto_211821 ) ( OBJ-AT ?auto_211817 ?auto_211820 ) ( TRUCK-AT ?auto_211822 ?auto_211813 ) ( not ( = ?auto_211817 ?auto_211814 ) ) ( not ( = ?auto_211821 ?auto_211820 ) ) ( not ( = ?auto_211817 ?auto_211815 ) ) ( not ( = ?auto_211814 ?auto_211815 ) ) ( not ( = ?auto_211817 ?auto_211818 ) ) ( not ( = ?auto_211814 ?auto_211818 ) ) ( not ( = ?auto_211815 ?auto_211818 ) ) ( not ( = ?auto_211817 ?auto_211816 ) ) ( not ( = ?auto_211814 ?auto_211816 ) ) ( not ( = ?auto_211815 ?auto_211816 ) ) ( not ( = ?auto_211818 ?auto_211816 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_211817 ?auto_211814 ?auto_211815 ?auto_211816 ?auto_211818 ?auto_211813 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_211951 - OBJ
      ?auto_211952 - OBJ
      ?auto_211953 - OBJ
      ?auto_211954 - OBJ
      ?auto_211955 - OBJ
      ?auto_211950 - LOCATION
    )
    :vars
    (
      ?auto_211957 - LOCATION
      ?auto_211956 - CITY
      ?auto_211958 - LOCATION
      ?auto_211959 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_211957 ?auto_211956 ) ( IN-CITY ?auto_211950 ?auto_211956 ) ( not ( = ?auto_211950 ?auto_211957 ) ) ( OBJ-AT ?auto_211953 ?auto_211957 ) ( IN-CITY ?auto_211958 ?auto_211956 ) ( not ( = ?auto_211950 ?auto_211958 ) ) ( OBJ-AT ?auto_211954 ?auto_211958 ) ( OBJ-AT ?auto_211952 ?auto_211957 ) ( OBJ-AT ?auto_211951 ?auto_211958 ) ( OBJ-AT ?auto_211955 ?auto_211957 ) ( TRUCK-AT ?auto_211959 ?auto_211950 ) ( not ( = ?auto_211955 ?auto_211951 ) ) ( not ( = ?auto_211958 ?auto_211957 ) ) ( not ( = ?auto_211955 ?auto_211952 ) ) ( not ( = ?auto_211951 ?auto_211952 ) ) ( not ( = ?auto_211955 ?auto_211954 ) ) ( not ( = ?auto_211951 ?auto_211954 ) ) ( not ( = ?auto_211952 ?auto_211954 ) ) ( not ( = ?auto_211955 ?auto_211953 ) ) ( not ( = ?auto_211951 ?auto_211953 ) ) ( not ( = ?auto_211952 ?auto_211953 ) ) ( not ( = ?auto_211954 ?auto_211953 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_211955 ?auto_211951 ?auto_211952 ?auto_211953 ?auto_211954 ?auto_211950 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_212085 - OBJ
      ?auto_212086 - OBJ
      ?auto_212087 - OBJ
      ?auto_212088 - OBJ
      ?auto_212089 - OBJ
      ?auto_212084 - LOCATION
    )
    :vars
    (
      ?auto_212091 - LOCATION
      ?auto_212090 - CITY
      ?auto_212092 - LOCATION
      ?auto_212093 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_212091 ?auto_212090 ) ( IN-CITY ?auto_212084 ?auto_212090 ) ( not ( = ?auto_212084 ?auto_212091 ) ) ( OBJ-AT ?auto_212089 ?auto_212091 ) ( IN-CITY ?auto_212092 ?auto_212090 ) ( not ( = ?auto_212084 ?auto_212092 ) ) ( OBJ-AT ?auto_212086 ?auto_212092 ) ( OBJ-AT ?auto_212088 ?auto_212091 ) ( OBJ-AT ?auto_212085 ?auto_212092 ) ( OBJ-AT ?auto_212087 ?auto_212091 ) ( TRUCK-AT ?auto_212093 ?auto_212084 ) ( not ( = ?auto_212087 ?auto_212085 ) ) ( not ( = ?auto_212092 ?auto_212091 ) ) ( not ( = ?auto_212087 ?auto_212088 ) ) ( not ( = ?auto_212085 ?auto_212088 ) ) ( not ( = ?auto_212087 ?auto_212086 ) ) ( not ( = ?auto_212085 ?auto_212086 ) ) ( not ( = ?auto_212088 ?auto_212086 ) ) ( not ( = ?auto_212087 ?auto_212089 ) ) ( not ( = ?auto_212085 ?auto_212089 ) ) ( not ( = ?auto_212088 ?auto_212089 ) ) ( not ( = ?auto_212086 ?auto_212089 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_212087 ?auto_212085 ?auto_212088 ?auto_212089 ?auto_212086 ?auto_212084 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_212128 - OBJ
      ?auto_212129 - OBJ
      ?auto_212130 - OBJ
      ?auto_212131 - OBJ
      ?auto_212132 - OBJ
      ?auto_212127 - LOCATION
    )
    :vars
    (
      ?auto_212134 - LOCATION
      ?auto_212133 - CITY
      ?auto_212135 - LOCATION
      ?auto_212136 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_212134 ?auto_212133 ) ( IN-CITY ?auto_212127 ?auto_212133 ) ( not ( = ?auto_212127 ?auto_212134 ) ) ( OBJ-AT ?auto_212131 ?auto_212134 ) ( IN-CITY ?auto_212135 ?auto_212133 ) ( not ( = ?auto_212127 ?auto_212135 ) ) ( OBJ-AT ?auto_212129 ?auto_212135 ) ( OBJ-AT ?auto_212132 ?auto_212134 ) ( OBJ-AT ?auto_212128 ?auto_212135 ) ( OBJ-AT ?auto_212130 ?auto_212134 ) ( TRUCK-AT ?auto_212136 ?auto_212127 ) ( not ( = ?auto_212130 ?auto_212128 ) ) ( not ( = ?auto_212135 ?auto_212134 ) ) ( not ( = ?auto_212130 ?auto_212132 ) ) ( not ( = ?auto_212128 ?auto_212132 ) ) ( not ( = ?auto_212130 ?auto_212129 ) ) ( not ( = ?auto_212128 ?auto_212129 ) ) ( not ( = ?auto_212132 ?auto_212129 ) ) ( not ( = ?auto_212130 ?auto_212131 ) ) ( not ( = ?auto_212128 ?auto_212131 ) ) ( not ( = ?auto_212132 ?auto_212131 ) ) ( not ( = ?auto_212129 ?auto_212131 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_212130 ?auto_212128 ?auto_212132 ?auto_212131 ?auto_212129 ?auto_212127 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_212264 - OBJ
      ?auto_212265 - OBJ
      ?auto_212266 - OBJ
      ?auto_212267 - OBJ
      ?auto_212268 - OBJ
      ?auto_212263 - LOCATION
    )
    :vars
    (
      ?auto_212270 - LOCATION
      ?auto_212269 - CITY
      ?auto_212271 - LOCATION
      ?auto_212272 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_212270 ?auto_212269 ) ( IN-CITY ?auto_212263 ?auto_212269 ) ( not ( = ?auto_212263 ?auto_212270 ) ) ( OBJ-AT ?auto_212268 ?auto_212270 ) ( IN-CITY ?auto_212271 ?auto_212269 ) ( not ( = ?auto_212263 ?auto_212271 ) ) ( OBJ-AT ?auto_212265 ?auto_212271 ) ( OBJ-AT ?auto_212266 ?auto_212270 ) ( OBJ-AT ?auto_212264 ?auto_212271 ) ( OBJ-AT ?auto_212267 ?auto_212270 ) ( TRUCK-AT ?auto_212272 ?auto_212263 ) ( not ( = ?auto_212267 ?auto_212264 ) ) ( not ( = ?auto_212271 ?auto_212270 ) ) ( not ( = ?auto_212267 ?auto_212266 ) ) ( not ( = ?auto_212264 ?auto_212266 ) ) ( not ( = ?auto_212267 ?auto_212265 ) ) ( not ( = ?auto_212264 ?auto_212265 ) ) ( not ( = ?auto_212266 ?auto_212265 ) ) ( not ( = ?auto_212267 ?auto_212268 ) ) ( not ( = ?auto_212264 ?auto_212268 ) ) ( not ( = ?auto_212266 ?auto_212268 ) ) ( not ( = ?auto_212265 ?auto_212268 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_212267 ?auto_212264 ?auto_212266 ?auto_212268 ?auto_212265 ?auto_212263 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_212307 - OBJ
      ?auto_212308 - OBJ
      ?auto_212309 - OBJ
      ?auto_212310 - OBJ
      ?auto_212311 - OBJ
      ?auto_212306 - LOCATION
    )
    :vars
    (
      ?auto_212313 - LOCATION
      ?auto_212312 - CITY
      ?auto_212314 - LOCATION
      ?auto_212315 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_212313 ?auto_212312 ) ( IN-CITY ?auto_212306 ?auto_212312 ) ( not ( = ?auto_212306 ?auto_212313 ) ) ( OBJ-AT ?auto_212310 ?auto_212313 ) ( IN-CITY ?auto_212314 ?auto_212312 ) ( not ( = ?auto_212306 ?auto_212314 ) ) ( OBJ-AT ?auto_212308 ?auto_212314 ) ( OBJ-AT ?auto_212309 ?auto_212313 ) ( OBJ-AT ?auto_212307 ?auto_212314 ) ( OBJ-AT ?auto_212311 ?auto_212313 ) ( TRUCK-AT ?auto_212315 ?auto_212306 ) ( not ( = ?auto_212311 ?auto_212307 ) ) ( not ( = ?auto_212314 ?auto_212313 ) ) ( not ( = ?auto_212311 ?auto_212309 ) ) ( not ( = ?auto_212307 ?auto_212309 ) ) ( not ( = ?auto_212311 ?auto_212308 ) ) ( not ( = ?auto_212307 ?auto_212308 ) ) ( not ( = ?auto_212309 ?auto_212308 ) ) ( not ( = ?auto_212311 ?auto_212310 ) ) ( not ( = ?auto_212307 ?auto_212310 ) ) ( not ( = ?auto_212309 ?auto_212310 ) ) ( not ( = ?auto_212308 ?auto_212310 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_212311 ?auto_212307 ?auto_212309 ?auto_212310 ?auto_212308 ?auto_212306 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_212487 - OBJ
      ?auto_212488 - OBJ
      ?auto_212489 - OBJ
      ?auto_212490 - OBJ
      ?auto_212491 - OBJ
      ?auto_212486 - LOCATION
    )
    :vars
    (
      ?auto_212493 - LOCATION
      ?auto_212492 - CITY
      ?auto_212494 - LOCATION
      ?auto_212495 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_212493 ?auto_212492 ) ( IN-CITY ?auto_212486 ?auto_212492 ) ( not ( = ?auto_212486 ?auto_212493 ) ) ( OBJ-AT ?auto_212489 ?auto_212493 ) ( IN-CITY ?auto_212494 ?auto_212492 ) ( not ( = ?auto_212486 ?auto_212494 ) ) ( OBJ-AT ?auto_212488 ?auto_212494 ) ( OBJ-AT ?auto_212491 ?auto_212493 ) ( OBJ-AT ?auto_212487 ?auto_212494 ) ( OBJ-AT ?auto_212490 ?auto_212493 ) ( TRUCK-AT ?auto_212495 ?auto_212486 ) ( not ( = ?auto_212490 ?auto_212487 ) ) ( not ( = ?auto_212494 ?auto_212493 ) ) ( not ( = ?auto_212490 ?auto_212491 ) ) ( not ( = ?auto_212487 ?auto_212491 ) ) ( not ( = ?auto_212490 ?auto_212488 ) ) ( not ( = ?auto_212487 ?auto_212488 ) ) ( not ( = ?auto_212491 ?auto_212488 ) ) ( not ( = ?auto_212490 ?auto_212489 ) ) ( not ( = ?auto_212487 ?auto_212489 ) ) ( not ( = ?auto_212491 ?auto_212489 ) ) ( not ( = ?auto_212488 ?auto_212489 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_212490 ?auto_212487 ?auto_212491 ?auto_212489 ?auto_212488 ?auto_212486 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_212577 - OBJ
      ?auto_212578 - OBJ
      ?auto_212579 - OBJ
      ?auto_212580 - OBJ
      ?auto_212581 - OBJ
      ?auto_212576 - LOCATION
    )
    :vars
    (
      ?auto_212583 - LOCATION
      ?auto_212582 - CITY
      ?auto_212584 - LOCATION
      ?auto_212585 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_212583 ?auto_212582 ) ( IN-CITY ?auto_212576 ?auto_212582 ) ( not ( = ?auto_212576 ?auto_212583 ) ) ( OBJ-AT ?auto_212579 ?auto_212583 ) ( IN-CITY ?auto_212584 ?auto_212582 ) ( not ( = ?auto_212576 ?auto_212584 ) ) ( OBJ-AT ?auto_212578 ?auto_212584 ) ( OBJ-AT ?auto_212580 ?auto_212583 ) ( OBJ-AT ?auto_212577 ?auto_212584 ) ( OBJ-AT ?auto_212581 ?auto_212583 ) ( TRUCK-AT ?auto_212585 ?auto_212576 ) ( not ( = ?auto_212581 ?auto_212577 ) ) ( not ( = ?auto_212584 ?auto_212583 ) ) ( not ( = ?auto_212581 ?auto_212580 ) ) ( not ( = ?auto_212577 ?auto_212580 ) ) ( not ( = ?auto_212581 ?auto_212578 ) ) ( not ( = ?auto_212577 ?auto_212578 ) ) ( not ( = ?auto_212580 ?auto_212578 ) ) ( not ( = ?auto_212581 ?auto_212579 ) ) ( not ( = ?auto_212577 ?auto_212579 ) ) ( not ( = ?auto_212580 ?auto_212579 ) ) ( not ( = ?auto_212578 ?auto_212579 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_212581 ?auto_212577 ?auto_212580 ?auto_212579 ?auto_212578 ?auto_212576 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_212896 - OBJ
      ?auto_212897 - OBJ
      ?auto_212898 - OBJ
      ?auto_212899 - OBJ
      ?auto_212900 - OBJ
      ?auto_212895 - LOCATION
    )
    :vars
    (
      ?auto_212902 - LOCATION
      ?auto_212901 - CITY
      ?auto_212903 - LOCATION
      ?auto_212904 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_212902 ?auto_212901 ) ( IN-CITY ?auto_212895 ?auto_212901 ) ( not ( = ?auto_212895 ?auto_212902 ) ) ( OBJ-AT ?auto_212897 ?auto_212902 ) ( IN-CITY ?auto_212903 ?auto_212901 ) ( not ( = ?auto_212895 ?auto_212903 ) ) ( OBJ-AT ?auto_212900 ?auto_212903 ) ( OBJ-AT ?auto_212899 ?auto_212902 ) ( OBJ-AT ?auto_212896 ?auto_212903 ) ( OBJ-AT ?auto_212898 ?auto_212902 ) ( TRUCK-AT ?auto_212904 ?auto_212895 ) ( not ( = ?auto_212898 ?auto_212896 ) ) ( not ( = ?auto_212903 ?auto_212902 ) ) ( not ( = ?auto_212898 ?auto_212899 ) ) ( not ( = ?auto_212896 ?auto_212899 ) ) ( not ( = ?auto_212898 ?auto_212900 ) ) ( not ( = ?auto_212896 ?auto_212900 ) ) ( not ( = ?auto_212899 ?auto_212900 ) ) ( not ( = ?auto_212898 ?auto_212897 ) ) ( not ( = ?auto_212896 ?auto_212897 ) ) ( not ( = ?auto_212899 ?auto_212897 ) ) ( not ( = ?auto_212900 ?auto_212897 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_212898 ?auto_212896 ?auto_212899 ?auto_212897 ?auto_212900 ?auto_212895 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_212939 - OBJ
      ?auto_212940 - OBJ
      ?auto_212941 - OBJ
      ?auto_212942 - OBJ
      ?auto_212943 - OBJ
      ?auto_212938 - LOCATION
    )
    :vars
    (
      ?auto_212945 - LOCATION
      ?auto_212944 - CITY
      ?auto_212946 - LOCATION
      ?auto_212947 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_212945 ?auto_212944 ) ( IN-CITY ?auto_212938 ?auto_212944 ) ( not ( = ?auto_212938 ?auto_212945 ) ) ( OBJ-AT ?auto_212940 ?auto_212945 ) ( IN-CITY ?auto_212946 ?auto_212944 ) ( not ( = ?auto_212938 ?auto_212946 ) ) ( OBJ-AT ?auto_212942 ?auto_212946 ) ( OBJ-AT ?auto_212943 ?auto_212945 ) ( OBJ-AT ?auto_212939 ?auto_212946 ) ( OBJ-AT ?auto_212941 ?auto_212945 ) ( TRUCK-AT ?auto_212947 ?auto_212938 ) ( not ( = ?auto_212941 ?auto_212939 ) ) ( not ( = ?auto_212946 ?auto_212945 ) ) ( not ( = ?auto_212941 ?auto_212943 ) ) ( not ( = ?auto_212939 ?auto_212943 ) ) ( not ( = ?auto_212941 ?auto_212942 ) ) ( not ( = ?auto_212939 ?auto_212942 ) ) ( not ( = ?auto_212943 ?auto_212942 ) ) ( not ( = ?auto_212941 ?auto_212940 ) ) ( not ( = ?auto_212939 ?auto_212940 ) ) ( not ( = ?auto_212943 ?auto_212940 ) ) ( not ( = ?auto_212942 ?auto_212940 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_212941 ?auto_212939 ?auto_212943 ?auto_212940 ?auto_212942 ?auto_212938 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_213360 - OBJ
      ?auto_213361 - OBJ
      ?auto_213362 - OBJ
      ?auto_213363 - OBJ
      ?auto_213364 - OBJ
      ?auto_213359 - LOCATION
    )
    :vars
    (
      ?auto_213366 - LOCATION
      ?auto_213365 - CITY
      ?auto_213367 - LOCATION
      ?auto_213368 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_213366 ?auto_213365 ) ( IN-CITY ?auto_213359 ?auto_213365 ) ( not ( = ?auto_213359 ?auto_213366 ) ) ( OBJ-AT ?auto_213361 ?auto_213366 ) ( IN-CITY ?auto_213367 ?auto_213365 ) ( not ( = ?auto_213359 ?auto_213367 ) ) ( OBJ-AT ?auto_213364 ?auto_213367 ) ( OBJ-AT ?auto_213362 ?auto_213366 ) ( OBJ-AT ?auto_213360 ?auto_213367 ) ( OBJ-AT ?auto_213363 ?auto_213366 ) ( TRUCK-AT ?auto_213368 ?auto_213359 ) ( not ( = ?auto_213363 ?auto_213360 ) ) ( not ( = ?auto_213367 ?auto_213366 ) ) ( not ( = ?auto_213363 ?auto_213362 ) ) ( not ( = ?auto_213360 ?auto_213362 ) ) ( not ( = ?auto_213363 ?auto_213364 ) ) ( not ( = ?auto_213360 ?auto_213364 ) ) ( not ( = ?auto_213362 ?auto_213364 ) ) ( not ( = ?auto_213363 ?auto_213361 ) ) ( not ( = ?auto_213360 ?auto_213361 ) ) ( not ( = ?auto_213362 ?auto_213361 ) ) ( not ( = ?auto_213364 ?auto_213361 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_213363 ?auto_213360 ?auto_213362 ?auto_213361 ?auto_213364 ?auto_213359 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_213497 - OBJ
      ?auto_213498 - OBJ
      ?auto_213499 - OBJ
      ?auto_213500 - OBJ
      ?auto_213501 - OBJ
      ?auto_213496 - LOCATION
    )
    :vars
    (
      ?auto_213503 - LOCATION
      ?auto_213502 - CITY
      ?auto_213504 - LOCATION
      ?auto_213505 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_213503 ?auto_213502 ) ( IN-CITY ?auto_213496 ?auto_213502 ) ( not ( = ?auto_213496 ?auto_213503 ) ) ( OBJ-AT ?auto_213498 ?auto_213503 ) ( IN-CITY ?auto_213504 ?auto_213502 ) ( not ( = ?auto_213496 ?auto_213504 ) ) ( OBJ-AT ?auto_213500 ?auto_213504 ) ( OBJ-AT ?auto_213499 ?auto_213503 ) ( OBJ-AT ?auto_213497 ?auto_213504 ) ( OBJ-AT ?auto_213501 ?auto_213503 ) ( TRUCK-AT ?auto_213505 ?auto_213496 ) ( not ( = ?auto_213501 ?auto_213497 ) ) ( not ( = ?auto_213504 ?auto_213503 ) ) ( not ( = ?auto_213501 ?auto_213499 ) ) ( not ( = ?auto_213497 ?auto_213499 ) ) ( not ( = ?auto_213501 ?auto_213500 ) ) ( not ( = ?auto_213497 ?auto_213500 ) ) ( not ( = ?auto_213499 ?auto_213500 ) ) ( not ( = ?auto_213501 ?auto_213498 ) ) ( not ( = ?auto_213497 ?auto_213498 ) ) ( not ( = ?auto_213499 ?auto_213498 ) ) ( not ( = ?auto_213500 ?auto_213498 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_213501 ?auto_213497 ?auto_213499 ?auto_213498 ?auto_213500 ?auto_213496 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_213631 - OBJ
      ?auto_213632 - OBJ
      ?auto_213633 - OBJ
      ?auto_213634 - OBJ
      ?auto_213635 - OBJ
      ?auto_213630 - LOCATION
    )
    :vars
    (
      ?auto_213637 - LOCATION
      ?auto_213636 - CITY
      ?auto_213638 - LOCATION
      ?auto_213639 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_213637 ?auto_213636 ) ( IN-CITY ?auto_213630 ?auto_213636 ) ( not ( = ?auto_213630 ?auto_213637 ) ) ( OBJ-AT ?auto_213632 ?auto_213637 ) ( IN-CITY ?auto_213638 ?auto_213636 ) ( not ( = ?auto_213630 ?auto_213638 ) ) ( OBJ-AT ?auto_213633 ?auto_213638 ) ( OBJ-AT ?auto_213635 ?auto_213637 ) ( OBJ-AT ?auto_213631 ?auto_213638 ) ( OBJ-AT ?auto_213634 ?auto_213637 ) ( TRUCK-AT ?auto_213639 ?auto_213630 ) ( not ( = ?auto_213634 ?auto_213631 ) ) ( not ( = ?auto_213638 ?auto_213637 ) ) ( not ( = ?auto_213634 ?auto_213635 ) ) ( not ( = ?auto_213631 ?auto_213635 ) ) ( not ( = ?auto_213634 ?auto_213633 ) ) ( not ( = ?auto_213631 ?auto_213633 ) ) ( not ( = ?auto_213635 ?auto_213633 ) ) ( not ( = ?auto_213634 ?auto_213632 ) ) ( not ( = ?auto_213631 ?auto_213632 ) ) ( not ( = ?auto_213635 ?auto_213632 ) ) ( not ( = ?auto_213633 ?auto_213632 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_213634 ?auto_213631 ?auto_213635 ?auto_213632 ?auto_213633 ?auto_213630 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_213721 - OBJ
      ?auto_213722 - OBJ
      ?auto_213723 - OBJ
      ?auto_213724 - OBJ
      ?auto_213725 - OBJ
      ?auto_213720 - LOCATION
    )
    :vars
    (
      ?auto_213727 - LOCATION
      ?auto_213726 - CITY
      ?auto_213728 - LOCATION
      ?auto_213729 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_213727 ?auto_213726 ) ( IN-CITY ?auto_213720 ?auto_213726 ) ( not ( = ?auto_213720 ?auto_213727 ) ) ( OBJ-AT ?auto_213722 ?auto_213727 ) ( IN-CITY ?auto_213728 ?auto_213726 ) ( not ( = ?auto_213720 ?auto_213728 ) ) ( OBJ-AT ?auto_213723 ?auto_213728 ) ( OBJ-AT ?auto_213724 ?auto_213727 ) ( OBJ-AT ?auto_213721 ?auto_213728 ) ( OBJ-AT ?auto_213725 ?auto_213727 ) ( TRUCK-AT ?auto_213729 ?auto_213720 ) ( not ( = ?auto_213725 ?auto_213721 ) ) ( not ( = ?auto_213728 ?auto_213727 ) ) ( not ( = ?auto_213725 ?auto_213724 ) ) ( not ( = ?auto_213721 ?auto_213724 ) ) ( not ( = ?auto_213725 ?auto_213723 ) ) ( not ( = ?auto_213721 ?auto_213723 ) ) ( not ( = ?auto_213724 ?auto_213723 ) ) ( not ( = ?auto_213725 ?auto_213722 ) ) ( not ( = ?auto_213721 ?auto_213722 ) ) ( not ( = ?auto_213724 ?auto_213722 ) ) ( not ( = ?auto_213723 ?auto_213722 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_213725 ?auto_213721 ?auto_213724 ?auto_213722 ?auto_213723 ?auto_213720 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_214326 - OBJ
      ?auto_214327 - OBJ
      ?auto_214328 - OBJ
      ?auto_214329 - OBJ
      ?auto_214330 - OBJ
      ?auto_214325 - LOCATION
    )
    :vars
    (
      ?auto_214332 - LOCATION
      ?auto_214331 - CITY
      ?auto_214333 - LOCATION
      ?auto_214334 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_214332 ?auto_214331 ) ( IN-CITY ?auto_214325 ?auto_214331 ) ( not ( = ?auto_214325 ?auto_214332 ) ) ( OBJ-AT ?auto_214330 ?auto_214332 ) ( IN-CITY ?auto_214333 ?auto_214331 ) ( not ( = ?auto_214325 ?auto_214333 ) ) ( OBJ-AT ?auto_214329 ?auto_214333 ) ( OBJ-AT ?auto_214326 ?auto_214332 ) ( OBJ-AT ?auto_214328 ?auto_214333 ) ( OBJ-AT ?auto_214327 ?auto_214332 ) ( TRUCK-AT ?auto_214334 ?auto_214325 ) ( not ( = ?auto_214327 ?auto_214328 ) ) ( not ( = ?auto_214333 ?auto_214332 ) ) ( not ( = ?auto_214327 ?auto_214326 ) ) ( not ( = ?auto_214328 ?auto_214326 ) ) ( not ( = ?auto_214327 ?auto_214329 ) ) ( not ( = ?auto_214328 ?auto_214329 ) ) ( not ( = ?auto_214326 ?auto_214329 ) ) ( not ( = ?auto_214327 ?auto_214330 ) ) ( not ( = ?auto_214328 ?auto_214330 ) ) ( not ( = ?auto_214326 ?auto_214330 ) ) ( not ( = ?auto_214329 ?auto_214330 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_214327 ?auto_214328 ?auto_214326 ?auto_214330 ?auto_214329 ?auto_214325 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_214369 - OBJ
      ?auto_214370 - OBJ
      ?auto_214371 - OBJ
      ?auto_214372 - OBJ
      ?auto_214373 - OBJ
      ?auto_214368 - LOCATION
    )
    :vars
    (
      ?auto_214375 - LOCATION
      ?auto_214374 - CITY
      ?auto_214376 - LOCATION
      ?auto_214377 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_214375 ?auto_214374 ) ( IN-CITY ?auto_214368 ?auto_214374 ) ( not ( = ?auto_214368 ?auto_214375 ) ) ( OBJ-AT ?auto_214372 ?auto_214375 ) ( IN-CITY ?auto_214376 ?auto_214374 ) ( not ( = ?auto_214368 ?auto_214376 ) ) ( OBJ-AT ?auto_214373 ?auto_214376 ) ( OBJ-AT ?auto_214369 ?auto_214375 ) ( OBJ-AT ?auto_214371 ?auto_214376 ) ( OBJ-AT ?auto_214370 ?auto_214375 ) ( TRUCK-AT ?auto_214377 ?auto_214368 ) ( not ( = ?auto_214370 ?auto_214371 ) ) ( not ( = ?auto_214376 ?auto_214375 ) ) ( not ( = ?auto_214370 ?auto_214369 ) ) ( not ( = ?auto_214371 ?auto_214369 ) ) ( not ( = ?auto_214370 ?auto_214373 ) ) ( not ( = ?auto_214371 ?auto_214373 ) ) ( not ( = ?auto_214369 ?auto_214373 ) ) ( not ( = ?auto_214370 ?auto_214372 ) ) ( not ( = ?auto_214371 ?auto_214372 ) ) ( not ( = ?auto_214369 ?auto_214372 ) ) ( not ( = ?auto_214373 ?auto_214372 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_214370 ?auto_214371 ?auto_214369 ?auto_214372 ?auto_214373 ?auto_214368 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_214505 - OBJ
      ?auto_214506 - OBJ
      ?auto_214507 - OBJ
      ?auto_214508 - OBJ
      ?auto_214509 - OBJ
      ?auto_214504 - LOCATION
    )
    :vars
    (
      ?auto_214511 - LOCATION
      ?auto_214510 - CITY
      ?auto_214512 - LOCATION
      ?auto_214513 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_214511 ?auto_214510 ) ( IN-CITY ?auto_214504 ?auto_214510 ) ( not ( = ?auto_214504 ?auto_214511 ) ) ( OBJ-AT ?auto_214509 ?auto_214511 ) ( IN-CITY ?auto_214512 ?auto_214510 ) ( not ( = ?auto_214504 ?auto_214512 ) ) ( OBJ-AT ?auto_214507 ?auto_214512 ) ( OBJ-AT ?auto_214505 ?auto_214511 ) ( OBJ-AT ?auto_214508 ?auto_214512 ) ( OBJ-AT ?auto_214506 ?auto_214511 ) ( TRUCK-AT ?auto_214513 ?auto_214504 ) ( not ( = ?auto_214506 ?auto_214508 ) ) ( not ( = ?auto_214512 ?auto_214511 ) ) ( not ( = ?auto_214506 ?auto_214505 ) ) ( not ( = ?auto_214508 ?auto_214505 ) ) ( not ( = ?auto_214506 ?auto_214507 ) ) ( not ( = ?auto_214508 ?auto_214507 ) ) ( not ( = ?auto_214505 ?auto_214507 ) ) ( not ( = ?auto_214506 ?auto_214509 ) ) ( not ( = ?auto_214508 ?auto_214509 ) ) ( not ( = ?auto_214505 ?auto_214509 ) ) ( not ( = ?auto_214507 ?auto_214509 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_214506 ?auto_214508 ?auto_214505 ?auto_214509 ?auto_214507 ?auto_214504 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_214548 - OBJ
      ?auto_214549 - OBJ
      ?auto_214550 - OBJ
      ?auto_214551 - OBJ
      ?auto_214552 - OBJ
      ?auto_214547 - LOCATION
    )
    :vars
    (
      ?auto_214554 - LOCATION
      ?auto_214553 - CITY
      ?auto_214555 - LOCATION
      ?auto_214556 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_214554 ?auto_214553 ) ( IN-CITY ?auto_214547 ?auto_214553 ) ( not ( = ?auto_214547 ?auto_214554 ) ) ( OBJ-AT ?auto_214551 ?auto_214554 ) ( IN-CITY ?auto_214555 ?auto_214553 ) ( not ( = ?auto_214547 ?auto_214555 ) ) ( OBJ-AT ?auto_214550 ?auto_214555 ) ( OBJ-AT ?auto_214548 ?auto_214554 ) ( OBJ-AT ?auto_214552 ?auto_214555 ) ( OBJ-AT ?auto_214549 ?auto_214554 ) ( TRUCK-AT ?auto_214556 ?auto_214547 ) ( not ( = ?auto_214549 ?auto_214552 ) ) ( not ( = ?auto_214555 ?auto_214554 ) ) ( not ( = ?auto_214549 ?auto_214548 ) ) ( not ( = ?auto_214552 ?auto_214548 ) ) ( not ( = ?auto_214549 ?auto_214550 ) ) ( not ( = ?auto_214552 ?auto_214550 ) ) ( not ( = ?auto_214548 ?auto_214550 ) ) ( not ( = ?auto_214549 ?auto_214551 ) ) ( not ( = ?auto_214552 ?auto_214551 ) ) ( not ( = ?auto_214548 ?auto_214551 ) ) ( not ( = ?auto_214550 ?auto_214551 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_214549 ?auto_214552 ?auto_214548 ?auto_214551 ?auto_214550 ?auto_214547 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_214682 - OBJ
      ?auto_214683 - OBJ
      ?auto_214684 - OBJ
      ?auto_214685 - OBJ
      ?auto_214686 - OBJ
      ?auto_214681 - LOCATION
    )
    :vars
    (
      ?auto_214688 - LOCATION
      ?auto_214687 - CITY
      ?auto_214689 - LOCATION
      ?auto_214690 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_214688 ?auto_214687 ) ( IN-CITY ?auto_214681 ?auto_214687 ) ( not ( = ?auto_214681 ?auto_214688 ) ) ( OBJ-AT ?auto_214684 ?auto_214688 ) ( IN-CITY ?auto_214689 ?auto_214687 ) ( not ( = ?auto_214681 ?auto_214689 ) ) ( OBJ-AT ?auto_214686 ?auto_214689 ) ( OBJ-AT ?auto_214682 ?auto_214688 ) ( OBJ-AT ?auto_214685 ?auto_214689 ) ( OBJ-AT ?auto_214683 ?auto_214688 ) ( TRUCK-AT ?auto_214690 ?auto_214681 ) ( not ( = ?auto_214683 ?auto_214685 ) ) ( not ( = ?auto_214689 ?auto_214688 ) ) ( not ( = ?auto_214683 ?auto_214682 ) ) ( not ( = ?auto_214685 ?auto_214682 ) ) ( not ( = ?auto_214683 ?auto_214686 ) ) ( not ( = ?auto_214685 ?auto_214686 ) ) ( not ( = ?auto_214682 ?auto_214686 ) ) ( not ( = ?auto_214683 ?auto_214684 ) ) ( not ( = ?auto_214685 ?auto_214684 ) ) ( not ( = ?auto_214682 ?auto_214684 ) ) ( not ( = ?auto_214686 ?auto_214684 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_214683 ?auto_214685 ?auto_214682 ?auto_214684 ?auto_214686 ?auto_214681 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_214772 - OBJ
      ?auto_214773 - OBJ
      ?auto_214774 - OBJ
      ?auto_214775 - OBJ
      ?auto_214776 - OBJ
      ?auto_214771 - LOCATION
    )
    :vars
    (
      ?auto_214778 - LOCATION
      ?auto_214777 - CITY
      ?auto_214779 - LOCATION
      ?auto_214780 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_214778 ?auto_214777 ) ( IN-CITY ?auto_214771 ?auto_214777 ) ( not ( = ?auto_214771 ?auto_214778 ) ) ( OBJ-AT ?auto_214774 ?auto_214778 ) ( IN-CITY ?auto_214779 ?auto_214777 ) ( not ( = ?auto_214771 ?auto_214779 ) ) ( OBJ-AT ?auto_214775 ?auto_214779 ) ( OBJ-AT ?auto_214772 ?auto_214778 ) ( OBJ-AT ?auto_214776 ?auto_214779 ) ( OBJ-AT ?auto_214773 ?auto_214778 ) ( TRUCK-AT ?auto_214780 ?auto_214771 ) ( not ( = ?auto_214773 ?auto_214776 ) ) ( not ( = ?auto_214779 ?auto_214778 ) ) ( not ( = ?auto_214773 ?auto_214772 ) ) ( not ( = ?auto_214776 ?auto_214772 ) ) ( not ( = ?auto_214773 ?auto_214775 ) ) ( not ( = ?auto_214776 ?auto_214775 ) ) ( not ( = ?auto_214772 ?auto_214775 ) ) ( not ( = ?auto_214773 ?auto_214774 ) ) ( not ( = ?auto_214776 ?auto_214774 ) ) ( not ( = ?auto_214772 ?auto_214774 ) ) ( not ( = ?auto_214775 ?auto_214774 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_214773 ?auto_214776 ?auto_214772 ?auto_214774 ?auto_214775 ?auto_214771 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_214906 - OBJ
      ?auto_214907 - OBJ
      ?auto_214908 - OBJ
      ?auto_214909 - OBJ
      ?auto_214910 - OBJ
      ?auto_214905 - LOCATION
    )
    :vars
    (
      ?auto_214912 - LOCATION
      ?auto_214911 - CITY
      ?auto_214913 - LOCATION
      ?auto_214914 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_214912 ?auto_214911 ) ( IN-CITY ?auto_214905 ?auto_214911 ) ( not ( = ?auto_214905 ?auto_214912 ) ) ( OBJ-AT ?auto_214910 ?auto_214912 ) ( IN-CITY ?auto_214913 ?auto_214911 ) ( not ( = ?auto_214905 ?auto_214913 ) ) ( OBJ-AT ?auto_214909 ?auto_214913 ) ( OBJ-AT ?auto_214906 ?auto_214912 ) ( OBJ-AT ?auto_214907 ?auto_214913 ) ( OBJ-AT ?auto_214908 ?auto_214912 ) ( TRUCK-AT ?auto_214914 ?auto_214905 ) ( not ( = ?auto_214908 ?auto_214907 ) ) ( not ( = ?auto_214913 ?auto_214912 ) ) ( not ( = ?auto_214908 ?auto_214906 ) ) ( not ( = ?auto_214907 ?auto_214906 ) ) ( not ( = ?auto_214908 ?auto_214909 ) ) ( not ( = ?auto_214907 ?auto_214909 ) ) ( not ( = ?auto_214906 ?auto_214909 ) ) ( not ( = ?auto_214908 ?auto_214910 ) ) ( not ( = ?auto_214907 ?auto_214910 ) ) ( not ( = ?auto_214906 ?auto_214910 ) ) ( not ( = ?auto_214909 ?auto_214910 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_214908 ?auto_214907 ?auto_214906 ?auto_214910 ?auto_214909 ?auto_214905 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_214949 - OBJ
      ?auto_214950 - OBJ
      ?auto_214951 - OBJ
      ?auto_214952 - OBJ
      ?auto_214953 - OBJ
      ?auto_214948 - LOCATION
    )
    :vars
    (
      ?auto_214955 - LOCATION
      ?auto_214954 - CITY
      ?auto_214956 - LOCATION
      ?auto_214957 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_214955 ?auto_214954 ) ( IN-CITY ?auto_214948 ?auto_214954 ) ( not ( = ?auto_214948 ?auto_214955 ) ) ( OBJ-AT ?auto_214952 ?auto_214955 ) ( IN-CITY ?auto_214956 ?auto_214954 ) ( not ( = ?auto_214948 ?auto_214956 ) ) ( OBJ-AT ?auto_214953 ?auto_214956 ) ( OBJ-AT ?auto_214949 ?auto_214955 ) ( OBJ-AT ?auto_214950 ?auto_214956 ) ( OBJ-AT ?auto_214951 ?auto_214955 ) ( TRUCK-AT ?auto_214957 ?auto_214948 ) ( not ( = ?auto_214951 ?auto_214950 ) ) ( not ( = ?auto_214956 ?auto_214955 ) ) ( not ( = ?auto_214951 ?auto_214949 ) ) ( not ( = ?auto_214950 ?auto_214949 ) ) ( not ( = ?auto_214951 ?auto_214953 ) ) ( not ( = ?auto_214950 ?auto_214953 ) ) ( not ( = ?auto_214949 ?auto_214953 ) ) ( not ( = ?auto_214951 ?auto_214952 ) ) ( not ( = ?auto_214950 ?auto_214952 ) ) ( not ( = ?auto_214949 ?auto_214952 ) ) ( not ( = ?auto_214953 ?auto_214952 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_214951 ?auto_214950 ?auto_214949 ?auto_214952 ?auto_214953 ?auto_214948 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_215178 - OBJ
      ?auto_215179 - OBJ
      ?auto_215180 - OBJ
      ?auto_215181 - OBJ
      ?auto_215182 - OBJ
      ?auto_215177 - LOCATION
    )
    :vars
    (
      ?auto_215184 - LOCATION
      ?auto_215183 - CITY
      ?auto_215185 - LOCATION
      ?auto_215186 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_215184 ?auto_215183 ) ( IN-CITY ?auto_215177 ?auto_215183 ) ( not ( = ?auto_215177 ?auto_215184 ) ) ( OBJ-AT ?auto_215182 ?auto_215184 ) ( IN-CITY ?auto_215185 ?auto_215183 ) ( not ( = ?auto_215177 ?auto_215185 ) ) ( OBJ-AT ?auto_215180 ?auto_215185 ) ( OBJ-AT ?auto_215178 ?auto_215184 ) ( OBJ-AT ?auto_215179 ?auto_215185 ) ( OBJ-AT ?auto_215181 ?auto_215184 ) ( TRUCK-AT ?auto_215186 ?auto_215177 ) ( not ( = ?auto_215181 ?auto_215179 ) ) ( not ( = ?auto_215185 ?auto_215184 ) ) ( not ( = ?auto_215181 ?auto_215178 ) ) ( not ( = ?auto_215179 ?auto_215178 ) ) ( not ( = ?auto_215181 ?auto_215180 ) ) ( not ( = ?auto_215179 ?auto_215180 ) ) ( not ( = ?auto_215178 ?auto_215180 ) ) ( not ( = ?auto_215181 ?auto_215182 ) ) ( not ( = ?auto_215179 ?auto_215182 ) ) ( not ( = ?auto_215178 ?auto_215182 ) ) ( not ( = ?auto_215180 ?auto_215182 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_215181 ?auto_215179 ?auto_215178 ?auto_215182 ?auto_215180 ?auto_215177 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_215221 - OBJ
      ?auto_215222 - OBJ
      ?auto_215223 - OBJ
      ?auto_215224 - OBJ
      ?auto_215225 - OBJ
      ?auto_215220 - LOCATION
    )
    :vars
    (
      ?auto_215227 - LOCATION
      ?auto_215226 - CITY
      ?auto_215228 - LOCATION
      ?auto_215229 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_215227 ?auto_215226 ) ( IN-CITY ?auto_215220 ?auto_215226 ) ( not ( = ?auto_215220 ?auto_215227 ) ) ( OBJ-AT ?auto_215224 ?auto_215227 ) ( IN-CITY ?auto_215228 ?auto_215226 ) ( not ( = ?auto_215220 ?auto_215228 ) ) ( OBJ-AT ?auto_215223 ?auto_215228 ) ( OBJ-AT ?auto_215221 ?auto_215227 ) ( OBJ-AT ?auto_215222 ?auto_215228 ) ( OBJ-AT ?auto_215225 ?auto_215227 ) ( TRUCK-AT ?auto_215229 ?auto_215220 ) ( not ( = ?auto_215225 ?auto_215222 ) ) ( not ( = ?auto_215228 ?auto_215227 ) ) ( not ( = ?auto_215225 ?auto_215221 ) ) ( not ( = ?auto_215222 ?auto_215221 ) ) ( not ( = ?auto_215225 ?auto_215223 ) ) ( not ( = ?auto_215222 ?auto_215223 ) ) ( not ( = ?auto_215221 ?auto_215223 ) ) ( not ( = ?auto_215225 ?auto_215224 ) ) ( not ( = ?auto_215222 ?auto_215224 ) ) ( not ( = ?auto_215221 ?auto_215224 ) ) ( not ( = ?auto_215223 ?auto_215224 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_215225 ?auto_215222 ?auto_215221 ?auto_215224 ?auto_215223 ?auto_215220 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_215308 - OBJ
      ?auto_215309 - OBJ
      ?auto_215310 - OBJ
      ?auto_215311 - OBJ
      ?auto_215312 - OBJ
      ?auto_215307 - LOCATION
    )
    :vars
    (
      ?auto_215314 - LOCATION
      ?auto_215313 - CITY
      ?auto_215315 - LOCATION
      ?auto_215316 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_215314 ?auto_215313 ) ( IN-CITY ?auto_215307 ?auto_215313 ) ( not ( = ?auto_215307 ?auto_215314 ) ) ( OBJ-AT ?auto_215310 ?auto_215314 ) ( IN-CITY ?auto_215315 ?auto_215313 ) ( not ( = ?auto_215307 ?auto_215315 ) ) ( OBJ-AT ?auto_215312 ?auto_215315 ) ( OBJ-AT ?auto_215308 ?auto_215314 ) ( OBJ-AT ?auto_215309 ?auto_215315 ) ( OBJ-AT ?auto_215311 ?auto_215314 ) ( TRUCK-AT ?auto_215316 ?auto_215307 ) ( not ( = ?auto_215311 ?auto_215309 ) ) ( not ( = ?auto_215315 ?auto_215314 ) ) ( not ( = ?auto_215311 ?auto_215308 ) ) ( not ( = ?auto_215309 ?auto_215308 ) ) ( not ( = ?auto_215311 ?auto_215312 ) ) ( not ( = ?auto_215309 ?auto_215312 ) ) ( not ( = ?auto_215308 ?auto_215312 ) ) ( not ( = ?auto_215311 ?auto_215310 ) ) ( not ( = ?auto_215309 ?auto_215310 ) ) ( not ( = ?auto_215308 ?auto_215310 ) ) ( not ( = ?auto_215312 ?auto_215310 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_215311 ?auto_215309 ?auto_215308 ?auto_215310 ?auto_215312 ?auto_215307 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_215445 - OBJ
      ?auto_215446 - OBJ
      ?auto_215447 - OBJ
      ?auto_215448 - OBJ
      ?auto_215449 - OBJ
      ?auto_215444 - LOCATION
    )
    :vars
    (
      ?auto_215451 - LOCATION
      ?auto_215450 - CITY
      ?auto_215452 - LOCATION
      ?auto_215453 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_215451 ?auto_215450 ) ( IN-CITY ?auto_215444 ?auto_215450 ) ( not ( = ?auto_215444 ?auto_215451 ) ) ( OBJ-AT ?auto_215447 ?auto_215451 ) ( IN-CITY ?auto_215452 ?auto_215450 ) ( not ( = ?auto_215444 ?auto_215452 ) ) ( OBJ-AT ?auto_215448 ?auto_215452 ) ( OBJ-AT ?auto_215445 ?auto_215451 ) ( OBJ-AT ?auto_215446 ?auto_215452 ) ( OBJ-AT ?auto_215449 ?auto_215451 ) ( TRUCK-AT ?auto_215453 ?auto_215444 ) ( not ( = ?auto_215449 ?auto_215446 ) ) ( not ( = ?auto_215452 ?auto_215451 ) ) ( not ( = ?auto_215449 ?auto_215445 ) ) ( not ( = ?auto_215446 ?auto_215445 ) ) ( not ( = ?auto_215449 ?auto_215448 ) ) ( not ( = ?auto_215446 ?auto_215448 ) ) ( not ( = ?auto_215445 ?auto_215448 ) ) ( not ( = ?auto_215449 ?auto_215447 ) ) ( not ( = ?auto_215446 ?auto_215447 ) ) ( not ( = ?auto_215445 ?auto_215447 ) ) ( not ( = ?auto_215448 ?auto_215447 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_215449 ?auto_215446 ?auto_215445 ?auto_215447 ?auto_215448 ?auto_215444 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216289 - OBJ
      ?auto_216290 - OBJ
      ?auto_216291 - OBJ
      ?auto_216292 - OBJ
      ?auto_216293 - OBJ
      ?auto_216288 - LOCATION
    )
    :vars
    (
      ?auto_216295 - LOCATION
      ?auto_216294 - CITY
      ?auto_216296 - LOCATION
      ?auto_216297 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_216295 ?auto_216294 ) ( IN-CITY ?auto_216288 ?auto_216294 ) ( not ( = ?auto_216288 ?auto_216295 ) ) ( OBJ-AT ?auto_216293 ?auto_216295 ) ( IN-CITY ?auto_216296 ?auto_216294 ) ( not ( = ?auto_216288 ?auto_216296 ) ) ( OBJ-AT ?auto_216290 ?auto_216296 ) ( OBJ-AT ?auto_216289 ?auto_216295 ) ( OBJ-AT ?auto_216292 ?auto_216296 ) ( OBJ-AT ?auto_216291 ?auto_216295 ) ( TRUCK-AT ?auto_216297 ?auto_216288 ) ( not ( = ?auto_216291 ?auto_216292 ) ) ( not ( = ?auto_216296 ?auto_216295 ) ) ( not ( = ?auto_216291 ?auto_216289 ) ) ( not ( = ?auto_216292 ?auto_216289 ) ) ( not ( = ?auto_216291 ?auto_216290 ) ) ( not ( = ?auto_216292 ?auto_216290 ) ) ( not ( = ?auto_216289 ?auto_216290 ) ) ( not ( = ?auto_216291 ?auto_216293 ) ) ( not ( = ?auto_216292 ?auto_216293 ) ) ( not ( = ?auto_216289 ?auto_216293 ) ) ( not ( = ?auto_216290 ?auto_216293 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_216291 ?auto_216292 ?auto_216289 ?auto_216293 ?auto_216290 ?auto_216288 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216332 - OBJ
      ?auto_216333 - OBJ
      ?auto_216334 - OBJ
      ?auto_216335 - OBJ
      ?auto_216336 - OBJ
      ?auto_216331 - LOCATION
    )
    :vars
    (
      ?auto_216338 - LOCATION
      ?auto_216337 - CITY
      ?auto_216339 - LOCATION
      ?auto_216340 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_216338 ?auto_216337 ) ( IN-CITY ?auto_216331 ?auto_216337 ) ( not ( = ?auto_216331 ?auto_216338 ) ) ( OBJ-AT ?auto_216335 ?auto_216338 ) ( IN-CITY ?auto_216339 ?auto_216337 ) ( not ( = ?auto_216331 ?auto_216339 ) ) ( OBJ-AT ?auto_216333 ?auto_216339 ) ( OBJ-AT ?auto_216332 ?auto_216338 ) ( OBJ-AT ?auto_216336 ?auto_216339 ) ( OBJ-AT ?auto_216334 ?auto_216338 ) ( TRUCK-AT ?auto_216340 ?auto_216331 ) ( not ( = ?auto_216334 ?auto_216336 ) ) ( not ( = ?auto_216339 ?auto_216338 ) ) ( not ( = ?auto_216334 ?auto_216332 ) ) ( not ( = ?auto_216336 ?auto_216332 ) ) ( not ( = ?auto_216334 ?auto_216333 ) ) ( not ( = ?auto_216336 ?auto_216333 ) ) ( not ( = ?auto_216332 ?auto_216333 ) ) ( not ( = ?auto_216334 ?auto_216335 ) ) ( not ( = ?auto_216336 ?auto_216335 ) ) ( not ( = ?auto_216332 ?auto_216335 ) ) ( not ( = ?auto_216333 ?auto_216335 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_216334 ?auto_216336 ?auto_216332 ?auto_216335 ?auto_216333 ?auto_216331 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216375 - OBJ
      ?auto_216376 - OBJ
      ?auto_216377 - OBJ
      ?auto_216378 - OBJ
      ?auto_216379 - OBJ
      ?auto_216374 - LOCATION
    )
    :vars
    (
      ?auto_216381 - LOCATION
      ?auto_216380 - CITY
      ?auto_216382 - LOCATION
      ?auto_216383 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_216381 ?auto_216380 ) ( IN-CITY ?auto_216374 ?auto_216380 ) ( not ( = ?auto_216374 ?auto_216381 ) ) ( OBJ-AT ?auto_216379 ?auto_216381 ) ( IN-CITY ?auto_216382 ?auto_216380 ) ( not ( = ?auto_216374 ?auto_216382 ) ) ( OBJ-AT ?auto_216376 ?auto_216382 ) ( OBJ-AT ?auto_216375 ?auto_216381 ) ( OBJ-AT ?auto_216377 ?auto_216382 ) ( OBJ-AT ?auto_216378 ?auto_216381 ) ( TRUCK-AT ?auto_216383 ?auto_216374 ) ( not ( = ?auto_216378 ?auto_216377 ) ) ( not ( = ?auto_216382 ?auto_216381 ) ) ( not ( = ?auto_216378 ?auto_216375 ) ) ( not ( = ?auto_216377 ?auto_216375 ) ) ( not ( = ?auto_216378 ?auto_216376 ) ) ( not ( = ?auto_216377 ?auto_216376 ) ) ( not ( = ?auto_216375 ?auto_216376 ) ) ( not ( = ?auto_216378 ?auto_216379 ) ) ( not ( = ?auto_216377 ?auto_216379 ) ) ( not ( = ?auto_216375 ?auto_216379 ) ) ( not ( = ?auto_216376 ?auto_216379 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_216378 ?auto_216377 ?auto_216375 ?auto_216379 ?auto_216376 ?auto_216374 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216418 - OBJ
      ?auto_216419 - OBJ
      ?auto_216420 - OBJ
      ?auto_216421 - OBJ
      ?auto_216422 - OBJ
      ?auto_216417 - LOCATION
    )
    :vars
    (
      ?auto_216424 - LOCATION
      ?auto_216423 - CITY
      ?auto_216425 - LOCATION
      ?auto_216426 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_216424 ?auto_216423 ) ( IN-CITY ?auto_216417 ?auto_216423 ) ( not ( = ?auto_216417 ?auto_216424 ) ) ( OBJ-AT ?auto_216421 ?auto_216424 ) ( IN-CITY ?auto_216425 ?auto_216423 ) ( not ( = ?auto_216417 ?auto_216425 ) ) ( OBJ-AT ?auto_216419 ?auto_216425 ) ( OBJ-AT ?auto_216418 ?auto_216424 ) ( OBJ-AT ?auto_216420 ?auto_216425 ) ( OBJ-AT ?auto_216422 ?auto_216424 ) ( TRUCK-AT ?auto_216426 ?auto_216417 ) ( not ( = ?auto_216422 ?auto_216420 ) ) ( not ( = ?auto_216425 ?auto_216424 ) ) ( not ( = ?auto_216422 ?auto_216418 ) ) ( not ( = ?auto_216420 ?auto_216418 ) ) ( not ( = ?auto_216422 ?auto_216419 ) ) ( not ( = ?auto_216420 ?auto_216419 ) ) ( not ( = ?auto_216418 ?auto_216419 ) ) ( not ( = ?auto_216422 ?auto_216421 ) ) ( not ( = ?auto_216420 ?auto_216421 ) ) ( not ( = ?auto_216418 ?auto_216421 ) ) ( not ( = ?auto_216419 ?auto_216421 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_216422 ?auto_216420 ?auto_216418 ?auto_216421 ?auto_216419 ?auto_216417 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216691 - OBJ
      ?auto_216692 - OBJ
      ?auto_216693 - OBJ
      ?auto_216694 - OBJ
      ?auto_216695 - OBJ
      ?auto_216690 - LOCATION
    )
    :vars
    (
      ?auto_216697 - LOCATION
      ?auto_216696 - CITY
      ?auto_216698 - LOCATION
      ?auto_216699 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_216697 ?auto_216696 ) ( IN-CITY ?auto_216690 ?auto_216696 ) ( not ( = ?auto_216690 ?auto_216697 ) ) ( OBJ-AT ?auto_216693 ?auto_216697 ) ( IN-CITY ?auto_216698 ?auto_216696 ) ( not ( = ?auto_216690 ?auto_216698 ) ) ( OBJ-AT ?auto_216692 ?auto_216698 ) ( OBJ-AT ?auto_216691 ?auto_216697 ) ( OBJ-AT ?auto_216695 ?auto_216698 ) ( OBJ-AT ?auto_216694 ?auto_216697 ) ( TRUCK-AT ?auto_216699 ?auto_216690 ) ( not ( = ?auto_216694 ?auto_216695 ) ) ( not ( = ?auto_216698 ?auto_216697 ) ) ( not ( = ?auto_216694 ?auto_216691 ) ) ( not ( = ?auto_216695 ?auto_216691 ) ) ( not ( = ?auto_216694 ?auto_216692 ) ) ( not ( = ?auto_216695 ?auto_216692 ) ) ( not ( = ?auto_216691 ?auto_216692 ) ) ( not ( = ?auto_216694 ?auto_216693 ) ) ( not ( = ?auto_216695 ?auto_216693 ) ) ( not ( = ?auto_216691 ?auto_216693 ) ) ( not ( = ?auto_216692 ?auto_216693 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_216694 ?auto_216695 ?auto_216691 ?auto_216693 ?auto_216692 ?auto_216690 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216734 - OBJ
      ?auto_216735 - OBJ
      ?auto_216736 - OBJ
      ?auto_216737 - OBJ
      ?auto_216738 - OBJ
      ?auto_216733 - LOCATION
    )
    :vars
    (
      ?auto_216740 - LOCATION
      ?auto_216739 - CITY
      ?auto_216741 - LOCATION
      ?auto_216742 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_216740 ?auto_216739 ) ( IN-CITY ?auto_216733 ?auto_216739 ) ( not ( = ?auto_216733 ?auto_216740 ) ) ( OBJ-AT ?auto_216736 ?auto_216740 ) ( IN-CITY ?auto_216741 ?auto_216739 ) ( not ( = ?auto_216733 ?auto_216741 ) ) ( OBJ-AT ?auto_216735 ?auto_216741 ) ( OBJ-AT ?auto_216734 ?auto_216740 ) ( OBJ-AT ?auto_216737 ?auto_216741 ) ( OBJ-AT ?auto_216738 ?auto_216740 ) ( TRUCK-AT ?auto_216742 ?auto_216733 ) ( not ( = ?auto_216738 ?auto_216737 ) ) ( not ( = ?auto_216741 ?auto_216740 ) ) ( not ( = ?auto_216738 ?auto_216734 ) ) ( not ( = ?auto_216737 ?auto_216734 ) ) ( not ( = ?auto_216738 ?auto_216735 ) ) ( not ( = ?auto_216737 ?auto_216735 ) ) ( not ( = ?auto_216734 ?auto_216735 ) ) ( not ( = ?auto_216738 ?auto_216736 ) ) ( not ( = ?auto_216737 ?auto_216736 ) ) ( not ( = ?auto_216734 ?auto_216736 ) ) ( not ( = ?auto_216735 ?auto_216736 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_216738 ?auto_216737 ?auto_216734 ?auto_216736 ?auto_216735 ?auto_216733 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217053 - OBJ
      ?auto_217054 - OBJ
      ?auto_217055 - OBJ
      ?auto_217056 - OBJ
      ?auto_217057 - OBJ
      ?auto_217052 - LOCATION
    )
    :vars
    (
      ?auto_217059 - LOCATION
      ?auto_217058 - CITY
      ?auto_217060 - LOCATION
      ?auto_217061 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217059 ?auto_217058 ) ( IN-CITY ?auto_217052 ?auto_217058 ) ( not ( = ?auto_217052 ?auto_217059 ) ) ( OBJ-AT ?auto_217054 ?auto_217059 ) ( IN-CITY ?auto_217060 ?auto_217058 ) ( not ( = ?auto_217052 ?auto_217060 ) ) ( OBJ-AT ?auto_217057 ?auto_217060 ) ( OBJ-AT ?auto_217053 ?auto_217059 ) ( OBJ-AT ?auto_217056 ?auto_217060 ) ( OBJ-AT ?auto_217055 ?auto_217059 ) ( TRUCK-AT ?auto_217061 ?auto_217052 ) ( not ( = ?auto_217055 ?auto_217056 ) ) ( not ( = ?auto_217060 ?auto_217059 ) ) ( not ( = ?auto_217055 ?auto_217053 ) ) ( not ( = ?auto_217056 ?auto_217053 ) ) ( not ( = ?auto_217055 ?auto_217057 ) ) ( not ( = ?auto_217056 ?auto_217057 ) ) ( not ( = ?auto_217053 ?auto_217057 ) ) ( not ( = ?auto_217055 ?auto_217054 ) ) ( not ( = ?auto_217056 ?auto_217054 ) ) ( not ( = ?auto_217053 ?auto_217054 ) ) ( not ( = ?auto_217057 ?auto_217054 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_217055 ?auto_217056 ?auto_217053 ?auto_217054 ?auto_217057 ?auto_217052 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217143 - OBJ
      ?auto_217144 - OBJ
      ?auto_217145 - OBJ
      ?auto_217146 - OBJ
      ?auto_217147 - OBJ
      ?auto_217142 - LOCATION
    )
    :vars
    (
      ?auto_217149 - LOCATION
      ?auto_217148 - CITY
      ?auto_217150 - LOCATION
      ?auto_217151 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217149 ?auto_217148 ) ( IN-CITY ?auto_217142 ?auto_217148 ) ( not ( = ?auto_217142 ?auto_217149 ) ) ( OBJ-AT ?auto_217144 ?auto_217149 ) ( IN-CITY ?auto_217150 ?auto_217148 ) ( not ( = ?auto_217142 ?auto_217150 ) ) ( OBJ-AT ?auto_217146 ?auto_217150 ) ( OBJ-AT ?auto_217143 ?auto_217149 ) ( OBJ-AT ?auto_217147 ?auto_217150 ) ( OBJ-AT ?auto_217145 ?auto_217149 ) ( TRUCK-AT ?auto_217151 ?auto_217142 ) ( not ( = ?auto_217145 ?auto_217147 ) ) ( not ( = ?auto_217150 ?auto_217149 ) ) ( not ( = ?auto_217145 ?auto_217143 ) ) ( not ( = ?auto_217147 ?auto_217143 ) ) ( not ( = ?auto_217145 ?auto_217146 ) ) ( not ( = ?auto_217147 ?auto_217146 ) ) ( not ( = ?auto_217143 ?auto_217146 ) ) ( not ( = ?auto_217145 ?auto_217144 ) ) ( not ( = ?auto_217147 ?auto_217144 ) ) ( not ( = ?auto_217143 ?auto_217144 ) ) ( not ( = ?auto_217146 ?auto_217144 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_217145 ?auto_217147 ?auto_217143 ?auto_217144 ?auto_217146 ?auto_217142 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217277 - OBJ
      ?auto_217278 - OBJ
      ?auto_217279 - OBJ
      ?auto_217280 - OBJ
      ?auto_217281 - OBJ
      ?auto_217276 - LOCATION
    )
    :vars
    (
      ?auto_217283 - LOCATION
      ?auto_217282 - CITY
      ?auto_217284 - LOCATION
      ?auto_217285 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217283 ?auto_217282 ) ( IN-CITY ?auto_217276 ?auto_217282 ) ( not ( = ?auto_217276 ?auto_217283 ) ) ( OBJ-AT ?auto_217278 ?auto_217283 ) ( IN-CITY ?auto_217284 ?auto_217282 ) ( not ( = ?auto_217276 ?auto_217284 ) ) ( OBJ-AT ?auto_217281 ?auto_217284 ) ( OBJ-AT ?auto_217277 ?auto_217283 ) ( OBJ-AT ?auto_217279 ?auto_217284 ) ( OBJ-AT ?auto_217280 ?auto_217283 ) ( TRUCK-AT ?auto_217285 ?auto_217276 ) ( not ( = ?auto_217280 ?auto_217279 ) ) ( not ( = ?auto_217284 ?auto_217283 ) ) ( not ( = ?auto_217280 ?auto_217277 ) ) ( not ( = ?auto_217279 ?auto_217277 ) ) ( not ( = ?auto_217280 ?auto_217281 ) ) ( not ( = ?auto_217279 ?auto_217281 ) ) ( not ( = ?auto_217277 ?auto_217281 ) ) ( not ( = ?auto_217280 ?auto_217278 ) ) ( not ( = ?auto_217279 ?auto_217278 ) ) ( not ( = ?auto_217277 ?auto_217278 ) ) ( not ( = ?auto_217281 ?auto_217278 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_217280 ?auto_217279 ?auto_217277 ?auto_217278 ?auto_217281 ?auto_217276 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217414 - OBJ
      ?auto_217415 - OBJ
      ?auto_217416 - OBJ
      ?auto_217417 - OBJ
      ?auto_217418 - OBJ
      ?auto_217413 - LOCATION
    )
    :vars
    (
      ?auto_217420 - LOCATION
      ?auto_217419 - CITY
      ?auto_217421 - LOCATION
      ?auto_217422 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217420 ?auto_217419 ) ( IN-CITY ?auto_217413 ?auto_217419 ) ( not ( = ?auto_217413 ?auto_217420 ) ) ( OBJ-AT ?auto_217415 ?auto_217420 ) ( IN-CITY ?auto_217421 ?auto_217419 ) ( not ( = ?auto_217413 ?auto_217421 ) ) ( OBJ-AT ?auto_217417 ?auto_217421 ) ( OBJ-AT ?auto_217414 ?auto_217420 ) ( OBJ-AT ?auto_217416 ?auto_217421 ) ( OBJ-AT ?auto_217418 ?auto_217420 ) ( TRUCK-AT ?auto_217422 ?auto_217413 ) ( not ( = ?auto_217418 ?auto_217416 ) ) ( not ( = ?auto_217421 ?auto_217420 ) ) ( not ( = ?auto_217418 ?auto_217414 ) ) ( not ( = ?auto_217416 ?auto_217414 ) ) ( not ( = ?auto_217418 ?auto_217417 ) ) ( not ( = ?auto_217416 ?auto_217417 ) ) ( not ( = ?auto_217414 ?auto_217417 ) ) ( not ( = ?auto_217418 ?auto_217415 ) ) ( not ( = ?auto_217416 ?auto_217415 ) ) ( not ( = ?auto_217414 ?auto_217415 ) ) ( not ( = ?auto_217417 ?auto_217415 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_217418 ?auto_217416 ?auto_217414 ?auto_217415 ?auto_217417 ?auto_217413 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217835 - OBJ
      ?auto_217836 - OBJ
      ?auto_217837 - OBJ
      ?auto_217838 - OBJ
      ?auto_217839 - OBJ
      ?auto_217834 - LOCATION
    )
    :vars
    (
      ?auto_217841 - LOCATION
      ?auto_217840 - CITY
      ?auto_217842 - LOCATION
      ?auto_217843 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217841 ?auto_217840 ) ( IN-CITY ?auto_217834 ?auto_217840 ) ( not ( = ?auto_217834 ?auto_217841 ) ) ( OBJ-AT ?auto_217836 ?auto_217841 ) ( IN-CITY ?auto_217842 ?auto_217840 ) ( not ( = ?auto_217834 ?auto_217842 ) ) ( OBJ-AT ?auto_217837 ?auto_217842 ) ( OBJ-AT ?auto_217835 ?auto_217841 ) ( OBJ-AT ?auto_217839 ?auto_217842 ) ( OBJ-AT ?auto_217838 ?auto_217841 ) ( TRUCK-AT ?auto_217843 ?auto_217834 ) ( not ( = ?auto_217838 ?auto_217839 ) ) ( not ( = ?auto_217842 ?auto_217841 ) ) ( not ( = ?auto_217838 ?auto_217835 ) ) ( not ( = ?auto_217839 ?auto_217835 ) ) ( not ( = ?auto_217838 ?auto_217837 ) ) ( not ( = ?auto_217839 ?auto_217837 ) ) ( not ( = ?auto_217835 ?auto_217837 ) ) ( not ( = ?auto_217838 ?auto_217836 ) ) ( not ( = ?auto_217839 ?auto_217836 ) ) ( not ( = ?auto_217835 ?auto_217836 ) ) ( not ( = ?auto_217837 ?auto_217836 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_217838 ?auto_217839 ?auto_217835 ?auto_217836 ?auto_217837 ?auto_217834 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217878 - OBJ
      ?auto_217879 - OBJ
      ?auto_217880 - OBJ
      ?auto_217881 - OBJ
      ?auto_217882 - OBJ
      ?auto_217877 - LOCATION
    )
    :vars
    (
      ?auto_217884 - LOCATION
      ?auto_217883 - CITY
      ?auto_217885 - LOCATION
      ?auto_217886 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217884 ?auto_217883 ) ( IN-CITY ?auto_217877 ?auto_217883 ) ( not ( = ?auto_217877 ?auto_217884 ) ) ( OBJ-AT ?auto_217879 ?auto_217884 ) ( IN-CITY ?auto_217885 ?auto_217883 ) ( not ( = ?auto_217877 ?auto_217885 ) ) ( OBJ-AT ?auto_217880 ?auto_217885 ) ( OBJ-AT ?auto_217878 ?auto_217884 ) ( OBJ-AT ?auto_217881 ?auto_217885 ) ( OBJ-AT ?auto_217882 ?auto_217884 ) ( TRUCK-AT ?auto_217886 ?auto_217877 ) ( not ( = ?auto_217882 ?auto_217881 ) ) ( not ( = ?auto_217885 ?auto_217884 ) ) ( not ( = ?auto_217882 ?auto_217878 ) ) ( not ( = ?auto_217881 ?auto_217878 ) ) ( not ( = ?auto_217882 ?auto_217880 ) ) ( not ( = ?auto_217881 ?auto_217880 ) ) ( not ( = ?auto_217878 ?auto_217880 ) ) ( not ( = ?auto_217882 ?auto_217879 ) ) ( not ( = ?auto_217881 ?auto_217879 ) ) ( not ( = ?auto_217878 ?auto_217879 ) ) ( not ( = ?auto_217880 ?auto_217879 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_217882 ?auto_217881 ?auto_217878 ?auto_217879 ?auto_217880 ?auto_217877 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_218530 - OBJ
      ?auto_218531 - OBJ
      ?auto_218532 - OBJ
      ?auto_218533 - OBJ
      ?auto_218534 - OBJ
      ?auto_218529 - LOCATION
    )
    :vars
    (
      ?auto_218536 - LOCATION
      ?auto_218535 - CITY
      ?auto_218537 - LOCATION
      ?auto_218538 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218536 ?auto_218535 ) ( IN-CITY ?auto_218529 ?auto_218535 ) ( not ( = ?auto_218529 ?auto_218536 ) ) ( OBJ-AT ?auto_218534 ?auto_218536 ) ( IN-CITY ?auto_218537 ?auto_218535 ) ( not ( = ?auto_218529 ?auto_218537 ) ) ( OBJ-AT ?auto_218530 ?auto_218537 ) ( OBJ-AT ?auto_218533 ?auto_218536 ) ( OBJ-AT ?auto_218532 ?auto_218537 ) ( OBJ-AT ?auto_218531 ?auto_218536 ) ( TRUCK-AT ?auto_218538 ?auto_218529 ) ( not ( = ?auto_218531 ?auto_218532 ) ) ( not ( = ?auto_218537 ?auto_218536 ) ) ( not ( = ?auto_218531 ?auto_218533 ) ) ( not ( = ?auto_218532 ?auto_218533 ) ) ( not ( = ?auto_218531 ?auto_218530 ) ) ( not ( = ?auto_218532 ?auto_218530 ) ) ( not ( = ?auto_218533 ?auto_218530 ) ) ( not ( = ?auto_218531 ?auto_218534 ) ) ( not ( = ?auto_218532 ?auto_218534 ) ) ( not ( = ?auto_218533 ?auto_218534 ) ) ( not ( = ?auto_218530 ?auto_218534 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_218531 ?auto_218532 ?auto_218533 ?auto_218534 ?auto_218530 ?auto_218529 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_218573 - OBJ
      ?auto_218574 - OBJ
      ?auto_218575 - OBJ
      ?auto_218576 - OBJ
      ?auto_218577 - OBJ
      ?auto_218572 - LOCATION
    )
    :vars
    (
      ?auto_218579 - LOCATION
      ?auto_218578 - CITY
      ?auto_218580 - LOCATION
      ?auto_218581 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218579 ?auto_218578 ) ( IN-CITY ?auto_218572 ?auto_218578 ) ( not ( = ?auto_218572 ?auto_218579 ) ) ( OBJ-AT ?auto_218576 ?auto_218579 ) ( IN-CITY ?auto_218580 ?auto_218578 ) ( not ( = ?auto_218572 ?auto_218580 ) ) ( OBJ-AT ?auto_218573 ?auto_218580 ) ( OBJ-AT ?auto_218577 ?auto_218579 ) ( OBJ-AT ?auto_218575 ?auto_218580 ) ( OBJ-AT ?auto_218574 ?auto_218579 ) ( TRUCK-AT ?auto_218581 ?auto_218572 ) ( not ( = ?auto_218574 ?auto_218575 ) ) ( not ( = ?auto_218580 ?auto_218579 ) ) ( not ( = ?auto_218574 ?auto_218577 ) ) ( not ( = ?auto_218575 ?auto_218577 ) ) ( not ( = ?auto_218574 ?auto_218573 ) ) ( not ( = ?auto_218575 ?auto_218573 ) ) ( not ( = ?auto_218577 ?auto_218573 ) ) ( not ( = ?auto_218574 ?auto_218576 ) ) ( not ( = ?auto_218575 ?auto_218576 ) ) ( not ( = ?auto_218577 ?auto_218576 ) ) ( not ( = ?auto_218573 ?auto_218576 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_218574 ?auto_218575 ?auto_218577 ?auto_218576 ?auto_218573 ?auto_218572 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_218616 - OBJ
      ?auto_218617 - OBJ
      ?auto_218618 - OBJ
      ?auto_218619 - OBJ
      ?auto_218620 - OBJ
      ?auto_218615 - LOCATION
    )
    :vars
    (
      ?auto_218622 - LOCATION
      ?auto_218621 - CITY
      ?auto_218623 - LOCATION
      ?auto_218624 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218622 ?auto_218621 ) ( IN-CITY ?auto_218615 ?auto_218621 ) ( not ( = ?auto_218615 ?auto_218622 ) ) ( OBJ-AT ?auto_218620 ?auto_218622 ) ( IN-CITY ?auto_218623 ?auto_218621 ) ( not ( = ?auto_218615 ?auto_218623 ) ) ( OBJ-AT ?auto_218616 ?auto_218623 ) ( OBJ-AT ?auto_218618 ?auto_218622 ) ( OBJ-AT ?auto_218619 ?auto_218623 ) ( OBJ-AT ?auto_218617 ?auto_218622 ) ( TRUCK-AT ?auto_218624 ?auto_218615 ) ( not ( = ?auto_218617 ?auto_218619 ) ) ( not ( = ?auto_218623 ?auto_218622 ) ) ( not ( = ?auto_218617 ?auto_218618 ) ) ( not ( = ?auto_218619 ?auto_218618 ) ) ( not ( = ?auto_218617 ?auto_218616 ) ) ( not ( = ?auto_218619 ?auto_218616 ) ) ( not ( = ?auto_218618 ?auto_218616 ) ) ( not ( = ?auto_218617 ?auto_218620 ) ) ( not ( = ?auto_218619 ?auto_218620 ) ) ( not ( = ?auto_218618 ?auto_218620 ) ) ( not ( = ?auto_218616 ?auto_218620 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_218617 ?auto_218619 ?auto_218618 ?auto_218620 ?auto_218616 ?auto_218615 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_218659 - OBJ
      ?auto_218660 - OBJ
      ?auto_218661 - OBJ
      ?auto_218662 - OBJ
      ?auto_218663 - OBJ
      ?auto_218658 - LOCATION
    )
    :vars
    (
      ?auto_218665 - LOCATION
      ?auto_218664 - CITY
      ?auto_218666 - LOCATION
      ?auto_218667 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218665 ?auto_218664 ) ( IN-CITY ?auto_218658 ?auto_218664 ) ( not ( = ?auto_218658 ?auto_218665 ) ) ( OBJ-AT ?auto_218662 ?auto_218665 ) ( IN-CITY ?auto_218666 ?auto_218664 ) ( not ( = ?auto_218658 ?auto_218666 ) ) ( OBJ-AT ?auto_218659 ?auto_218666 ) ( OBJ-AT ?auto_218661 ?auto_218665 ) ( OBJ-AT ?auto_218663 ?auto_218666 ) ( OBJ-AT ?auto_218660 ?auto_218665 ) ( TRUCK-AT ?auto_218667 ?auto_218658 ) ( not ( = ?auto_218660 ?auto_218663 ) ) ( not ( = ?auto_218666 ?auto_218665 ) ) ( not ( = ?auto_218660 ?auto_218661 ) ) ( not ( = ?auto_218663 ?auto_218661 ) ) ( not ( = ?auto_218660 ?auto_218659 ) ) ( not ( = ?auto_218663 ?auto_218659 ) ) ( not ( = ?auto_218661 ?auto_218659 ) ) ( not ( = ?auto_218660 ?auto_218662 ) ) ( not ( = ?auto_218663 ?auto_218662 ) ) ( not ( = ?auto_218661 ?auto_218662 ) ) ( not ( = ?auto_218659 ?auto_218662 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_218660 ?auto_218663 ?auto_218661 ?auto_218662 ?auto_218659 ?auto_218658 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_218886 - OBJ
      ?auto_218887 - OBJ
      ?auto_218888 - OBJ
      ?auto_218889 - OBJ
      ?auto_218890 - OBJ
      ?auto_218885 - LOCATION
    )
    :vars
    (
      ?auto_218892 - LOCATION
      ?auto_218891 - CITY
      ?auto_218893 - LOCATION
      ?auto_218894 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218892 ?auto_218891 ) ( IN-CITY ?auto_218885 ?auto_218891 ) ( not ( = ?auto_218885 ?auto_218892 ) ) ( OBJ-AT ?auto_218888 ?auto_218892 ) ( IN-CITY ?auto_218893 ?auto_218891 ) ( not ( = ?auto_218885 ?auto_218893 ) ) ( OBJ-AT ?auto_218886 ?auto_218893 ) ( OBJ-AT ?auto_218890 ?auto_218892 ) ( OBJ-AT ?auto_218889 ?auto_218893 ) ( OBJ-AT ?auto_218887 ?auto_218892 ) ( TRUCK-AT ?auto_218894 ?auto_218885 ) ( not ( = ?auto_218887 ?auto_218889 ) ) ( not ( = ?auto_218893 ?auto_218892 ) ) ( not ( = ?auto_218887 ?auto_218890 ) ) ( not ( = ?auto_218889 ?auto_218890 ) ) ( not ( = ?auto_218887 ?auto_218886 ) ) ( not ( = ?auto_218889 ?auto_218886 ) ) ( not ( = ?auto_218890 ?auto_218886 ) ) ( not ( = ?auto_218887 ?auto_218888 ) ) ( not ( = ?auto_218889 ?auto_218888 ) ) ( not ( = ?auto_218890 ?auto_218888 ) ) ( not ( = ?auto_218886 ?auto_218888 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_218887 ?auto_218889 ?auto_218890 ?auto_218888 ?auto_218886 ?auto_218885 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_218929 - OBJ
      ?auto_218930 - OBJ
      ?auto_218931 - OBJ
      ?auto_218932 - OBJ
      ?auto_218933 - OBJ
      ?auto_218928 - LOCATION
    )
    :vars
    (
      ?auto_218935 - LOCATION
      ?auto_218934 - CITY
      ?auto_218936 - LOCATION
      ?auto_218937 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218935 ?auto_218934 ) ( IN-CITY ?auto_218928 ?auto_218934 ) ( not ( = ?auto_218928 ?auto_218935 ) ) ( OBJ-AT ?auto_218931 ?auto_218935 ) ( IN-CITY ?auto_218936 ?auto_218934 ) ( not ( = ?auto_218928 ?auto_218936 ) ) ( OBJ-AT ?auto_218929 ?auto_218936 ) ( OBJ-AT ?auto_218932 ?auto_218935 ) ( OBJ-AT ?auto_218933 ?auto_218936 ) ( OBJ-AT ?auto_218930 ?auto_218935 ) ( TRUCK-AT ?auto_218937 ?auto_218928 ) ( not ( = ?auto_218930 ?auto_218933 ) ) ( not ( = ?auto_218936 ?auto_218935 ) ) ( not ( = ?auto_218930 ?auto_218932 ) ) ( not ( = ?auto_218933 ?auto_218932 ) ) ( not ( = ?auto_218930 ?auto_218929 ) ) ( not ( = ?auto_218933 ?auto_218929 ) ) ( not ( = ?auto_218932 ?auto_218929 ) ) ( not ( = ?auto_218930 ?auto_218931 ) ) ( not ( = ?auto_218933 ?auto_218931 ) ) ( not ( = ?auto_218932 ?auto_218931 ) ) ( not ( = ?auto_218929 ?auto_218931 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_218930 ?auto_218933 ?auto_218932 ?auto_218931 ?auto_218929 ?auto_218928 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219110 - OBJ
      ?auto_219111 - OBJ
      ?auto_219112 - OBJ
      ?auto_219113 - OBJ
      ?auto_219114 - OBJ
      ?auto_219109 - LOCATION
    )
    :vars
    (
      ?auto_219116 - LOCATION
      ?auto_219115 - CITY
      ?auto_219117 - LOCATION
      ?auto_219118 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219116 ?auto_219115 ) ( IN-CITY ?auto_219109 ?auto_219115 ) ( not ( = ?auto_219109 ?auto_219116 ) ) ( OBJ-AT ?auto_219114 ?auto_219116 ) ( IN-CITY ?auto_219117 ?auto_219115 ) ( not ( = ?auto_219109 ?auto_219117 ) ) ( OBJ-AT ?auto_219110 ?auto_219117 ) ( OBJ-AT ?auto_219113 ?auto_219116 ) ( OBJ-AT ?auto_219111 ?auto_219117 ) ( OBJ-AT ?auto_219112 ?auto_219116 ) ( TRUCK-AT ?auto_219118 ?auto_219109 ) ( not ( = ?auto_219112 ?auto_219111 ) ) ( not ( = ?auto_219117 ?auto_219116 ) ) ( not ( = ?auto_219112 ?auto_219113 ) ) ( not ( = ?auto_219111 ?auto_219113 ) ) ( not ( = ?auto_219112 ?auto_219110 ) ) ( not ( = ?auto_219111 ?auto_219110 ) ) ( not ( = ?auto_219113 ?auto_219110 ) ) ( not ( = ?auto_219112 ?auto_219114 ) ) ( not ( = ?auto_219111 ?auto_219114 ) ) ( not ( = ?auto_219113 ?auto_219114 ) ) ( not ( = ?auto_219110 ?auto_219114 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219112 ?auto_219111 ?auto_219113 ?auto_219114 ?auto_219110 ?auto_219109 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219153 - OBJ
      ?auto_219154 - OBJ
      ?auto_219155 - OBJ
      ?auto_219156 - OBJ
      ?auto_219157 - OBJ
      ?auto_219152 - LOCATION
    )
    :vars
    (
      ?auto_219159 - LOCATION
      ?auto_219158 - CITY
      ?auto_219160 - LOCATION
      ?auto_219161 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219159 ?auto_219158 ) ( IN-CITY ?auto_219152 ?auto_219158 ) ( not ( = ?auto_219152 ?auto_219159 ) ) ( OBJ-AT ?auto_219156 ?auto_219159 ) ( IN-CITY ?auto_219160 ?auto_219158 ) ( not ( = ?auto_219152 ?auto_219160 ) ) ( OBJ-AT ?auto_219153 ?auto_219160 ) ( OBJ-AT ?auto_219157 ?auto_219159 ) ( OBJ-AT ?auto_219154 ?auto_219160 ) ( OBJ-AT ?auto_219155 ?auto_219159 ) ( TRUCK-AT ?auto_219161 ?auto_219152 ) ( not ( = ?auto_219155 ?auto_219154 ) ) ( not ( = ?auto_219160 ?auto_219159 ) ) ( not ( = ?auto_219155 ?auto_219157 ) ) ( not ( = ?auto_219154 ?auto_219157 ) ) ( not ( = ?auto_219155 ?auto_219153 ) ) ( not ( = ?auto_219154 ?auto_219153 ) ) ( not ( = ?auto_219157 ?auto_219153 ) ) ( not ( = ?auto_219155 ?auto_219156 ) ) ( not ( = ?auto_219154 ?auto_219156 ) ) ( not ( = ?auto_219157 ?auto_219156 ) ) ( not ( = ?auto_219153 ?auto_219156 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219155 ?auto_219154 ?auto_219157 ?auto_219156 ?auto_219153 ?auto_219152 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219289 - OBJ
      ?auto_219290 - OBJ
      ?auto_219291 - OBJ
      ?auto_219292 - OBJ
      ?auto_219293 - OBJ
      ?auto_219288 - LOCATION
    )
    :vars
    (
      ?auto_219295 - LOCATION
      ?auto_219294 - CITY
      ?auto_219296 - LOCATION
      ?auto_219297 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219295 ?auto_219294 ) ( IN-CITY ?auto_219288 ?auto_219294 ) ( not ( = ?auto_219288 ?auto_219295 ) ) ( OBJ-AT ?auto_219293 ?auto_219295 ) ( IN-CITY ?auto_219296 ?auto_219294 ) ( not ( = ?auto_219288 ?auto_219296 ) ) ( OBJ-AT ?auto_219289 ?auto_219296 ) ( OBJ-AT ?auto_219291 ?auto_219295 ) ( OBJ-AT ?auto_219290 ?auto_219296 ) ( OBJ-AT ?auto_219292 ?auto_219295 ) ( TRUCK-AT ?auto_219297 ?auto_219288 ) ( not ( = ?auto_219292 ?auto_219290 ) ) ( not ( = ?auto_219296 ?auto_219295 ) ) ( not ( = ?auto_219292 ?auto_219291 ) ) ( not ( = ?auto_219290 ?auto_219291 ) ) ( not ( = ?auto_219292 ?auto_219289 ) ) ( not ( = ?auto_219290 ?auto_219289 ) ) ( not ( = ?auto_219291 ?auto_219289 ) ) ( not ( = ?auto_219292 ?auto_219293 ) ) ( not ( = ?auto_219290 ?auto_219293 ) ) ( not ( = ?auto_219291 ?auto_219293 ) ) ( not ( = ?auto_219289 ?auto_219293 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219292 ?auto_219290 ?auto_219291 ?auto_219293 ?auto_219289 ?auto_219288 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219332 - OBJ
      ?auto_219333 - OBJ
      ?auto_219334 - OBJ
      ?auto_219335 - OBJ
      ?auto_219336 - OBJ
      ?auto_219331 - LOCATION
    )
    :vars
    (
      ?auto_219338 - LOCATION
      ?auto_219337 - CITY
      ?auto_219339 - LOCATION
      ?auto_219340 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219338 ?auto_219337 ) ( IN-CITY ?auto_219331 ?auto_219337 ) ( not ( = ?auto_219331 ?auto_219338 ) ) ( OBJ-AT ?auto_219335 ?auto_219338 ) ( IN-CITY ?auto_219339 ?auto_219337 ) ( not ( = ?auto_219331 ?auto_219339 ) ) ( OBJ-AT ?auto_219332 ?auto_219339 ) ( OBJ-AT ?auto_219334 ?auto_219338 ) ( OBJ-AT ?auto_219333 ?auto_219339 ) ( OBJ-AT ?auto_219336 ?auto_219338 ) ( TRUCK-AT ?auto_219340 ?auto_219331 ) ( not ( = ?auto_219336 ?auto_219333 ) ) ( not ( = ?auto_219339 ?auto_219338 ) ) ( not ( = ?auto_219336 ?auto_219334 ) ) ( not ( = ?auto_219333 ?auto_219334 ) ) ( not ( = ?auto_219336 ?auto_219332 ) ) ( not ( = ?auto_219333 ?auto_219332 ) ) ( not ( = ?auto_219334 ?auto_219332 ) ) ( not ( = ?auto_219336 ?auto_219335 ) ) ( not ( = ?auto_219333 ?auto_219335 ) ) ( not ( = ?auto_219334 ?auto_219335 ) ) ( not ( = ?auto_219332 ?auto_219335 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219336 ?auto_219333 ?auto_219334 ?auto_219335 ?auto_219332 ?auto_219331 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219512 - OBJ
      ?auto_219513 - OBJ
      ?auto_219514 - OBJ
      ?auto_219515 - OBJ
      ?auto_219516 - OBJ
      ?auto_219511 - LOCATION
    )
    :vars
    (
      ?auto_219518 - LOCATION
      ?auto_219517 - CITY
      ?auto_219519 - LOCATION
      ?auto_219520 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219518 ?auto_219517 ) ( IN-CITY ?auto_219511 ?auto_219517 ) ( not ( = ?auto_219511 ?auto_219518 ) ) ( OBJ-AT ?auto_219514 ?auto_219518 ) ( IN-CITY ?auto_219519 ?auto_219517 ) ( not ( = ?auto_219511 ?auto_219519 ) ) ( OBJ-AT ?auto_219512 ?auto_219519 ) ( OBJ-AT ?auto_219516 ?auto_219518 ) ( OBJ-AT ?auto_219513 ?auto_219519 ) ( OBJ-AT ?auto_219515 ?auto_219518 ) ( TRUCK-AT ?auto_219520 ?auto_219511 ) ( not ( = ?auto_219515 ?auto_219513 ) ) ( not ( = ?auto_219519 ?auto_219518 ) ) ( not ( = ?auto_219515 ?auto_219516 ) ) ( not ( = ?auto_219513 ?auto_219516 ) ) ( not ( = ?auto_219515 ?auto_219512 ) ) ( not ( = ?auto_219513 ?auto_219512 ) ) ( not ( = ?auto_219516 ?auto_219512 ) ) ( not ( = ?auto_219515 ?auto_219514 ) ) ( not ( = ?auto_219513 ?auto_219514 ) ) ( not ( = ?auto_219516 ?auto_219514 ) ) ( not ( = ?auto_219512 ?auto_219514 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219515 ?auto_219513 ?auto_219516 ?auto_219514 ?auto_219512 ?auto_219511 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219602 - OBJ
      ?auto_219603 - OBJ
      ?auto_219604 - OBJ
      ?auto_219605 - OBJ
      ?auto_219606 - OBJ
      ?auto_219601 - LOCATION
    )
    :vars
    (
      ?auto_219608 - LOCATION
      ?auto_219607 - CITY
      ?auto_219609 - LOCATION
      ?auto_219610 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219608 ?auto_219607 ) ( IN-CITY ?auto_219601 ?auto_219607 ) ( not ( = ?auto_219601 ?auto_219608 ) ) ( OBJ-AT ?auto_219604 ?auto_219608 ) ( IN-CITY ?auto_219609 ?auto_219607 ) ( not ( = ?auto_219601 ?auto_219609 ) ) ( OBJ-AT ?auto_219602 ?auto_219609 ) ( OBJ-AT ?auto_219605 ?auto_219608 ) ( OBJ-AT ?auto_219603 ?auto_219609 ) ( OBJ-AT ?auto_219606 ?auto_219608 ) ( TRUCK-AT ?auto_219610 ?auto_219601 ) ( not ( = ?auto_219606 ?auto_219603 ) ) ( not ( = ?auto_219609 ?auto_219608 ) ) ( not ( = ?auto_219606 ?auto_219605 ) ) ( not ( = ?auto_219603 ?auto_219605 ) ) ( not ( = ?auto_219606 ?auto_219602 ) ) ( not ( = ?auto_219603 ?auto_219602 ) ) ( not ( = ?auto_219605 ?auto_219602 ) ) ( not ( = ?auto_219606 ?auto_219604 ) ) ( not ( = ?auto_219603 ?auto_219604 ) ) ( not ( = ?auto_219605 ?auto_219604 ) ) ( not ( = ?auto_219602 ?auto_219604 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219606 ?auto_219603 ?auto_219605 ?auto_219604 ?auto_219602 ?auto_219601 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219783 - OBJ
      ?auto_219784 - OBJ
      ?auto_219785 - OBJ
      ?auto_219786 - OBJ
      ?auto_219787 - OBJ
      ?auto_219782 - LOCATION
    )
    :vars
    (
      ?auto_219789 - LOCATION
      ?auto_219788 - CITY
      ?auto_219790 - LOCATION
      ?auto_219791 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219789 ?auto_219788 ) ( IN-CITY ?auto_219782 ?auto_219788 ) ( not ( = ?auto_219782 ?auto_219789 ) ) ( OBJ-AT ?auto_219787 ?auto_219789 ) ( IN-CITY ?auto_219790 ?auto_219788 ) ( not ( = ?auto_219782 ?auto_219790 ) ) ( OBJ-AT ?auto_219783 ?auto_219790 ) ( OBJ-AT ?auto_219784 ?auto_219789 ) ( OBJ-AT ?auto_219786 ?auto_219790 ) ( OBJ-AT ?auto_219785 ?auto_219789 ) ( TRUCK-AT ?auto_219791 ?auto_219782 ) ( not ( = ?auto_219785 ?auto_219786 ) ) ( not ( = ?auto_219790 ?auto_219789 ) ) ( not ( = ?auto_219785 ?auto_219784 ) ) ( not ( = ?auto_219786 ?auto_219784 ) ) ( not ( = ?auto_219785 ?auto_219783 ) ) ( not ( = ?auto_219786 ?auto_219783 ) ) ( not ( = ?auto_219784 ?auto_219783 ) ) ( not ( = ?auto_219785 ?auto_219787 ) ) ( not ( = ?auto_219786 ?auto_219787 ) ) ( not ( = ?auto_219784 ?auto_219787 ) ) ( not ( = ?auto_219783 ?auto_219787 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219785 ?auto_219786 ?auto_219784 ?auto_219787 ?auto_219783 ?auto_219782 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219826 - OBJ
      ?auto_219827 - OBJ
      ?auto_219828 - OBJ
      ?auto_219829 - OBJ
      ?auto_219830 - OBJ
      ?auto_219825 - LOCATION
    )
    :vars
    (
      ?auto_219832 - LOCATION
      ?auto_219831 - CITY
      ?auto_219833 - LOCATION
      ?auto_219834 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219832 ?auto_219831 ) ( IN-CITY ?auto_219825 ?auto_219831 ) ( not ( = ?auto_219825 ?auto_219832 ) ) ( OBJ-AT ?auto_219829 ?auto_219832 ) ( IN-CITY ?auto_219833 ?auto_219831 ) ( not ( = ?auto_219825 ?auto_219833 ) ) ( OBJ-AT ?auto_219826 ?auto_219833 ) ( OBJ-AT ?auto_219827 ?auto_219832 ) ( OBJ-AT ?auto_219830 ?auto_219833 ) ( OBJ-AT ?auto_219828 ?auto_219832 ) ( TRUCK-AT ?auto_219834 ?auto_219825 ) ( not ( = ?auto_219828 ?auto_219830 ) ) ( not ( = ?auto_219833 ?auto_219832 ) ) ( not ( = ?auto_219828 ?auto_219827 ) ) ( not ( = ?auto_219830 ?auto_219827 ) ) ( not ( = ?auto_219828 ?auto_219826 ) ) ( not ( = ?auto_219830 ?auto_219826 ) ) ( not ( = ?auto_219827 ?auto_219826 ) ) ( not ( = ?auto_219828 ?auto_219829 ) ) ( not ( = ?auto_219830 ?auto_219829 ) ) ( not ( = ?auto_219827 ?auto_219829 ) ) ( not ( = ?auto_219826 ?auto_219829 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219828 ?auto_219830 ?auto_219827 ?auto_219829 ?auto_219826 ?auto_219825 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219869 - OBJ
      ?auto_219870 - OBJ
      ?auto_219871 - OBJ
      ?auto_219872 - OBJ
      ?auto_219873 - OBJ
      ?auto_219868 - LOCATION
    )
    :vars
    (
      ?auto_219875 - LOCATION
      ?auto_219874 - CITY
      ?auto_219876 - LOCATION
      ?auto_219877 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219875 ?auto_219874 ) ( IN-CITY ?auto_219868 ?auto_219874 ) ( not ( = ?auto_219868 ?auto_219875 ) ) ( OBJ-AT ?auto_219873 ?auto_219875 ) ( IN-CITY ?auto_219876 ?auto_219874 ) ( not ( = ?auto_219868 ?auto_219876 ) ) ( OBJ-AT ?auto_219869 ?auto_219876 ) ( OBJ-AT ?auto_219870 ?auto_219875 ) ( OBJ-AT ?auto_219871 ?auto_219876 ) ( OBJ-AT ?auto_219872 ?auto_219875 ) ( TRUCK-AT ?auto_219877 ?auto_219868 ) ( not ( = ?auto_219872 ?auto_219871 ) ) ( not ( = ?auto_219876 ?auto_219875 ) ) ( not ( = ?auto_219872 ?auto_219870 ) ) ( not ( = ?auto_219871 ?auto_219870 ) ) ( not ( = ?auto_219872 ?auto_219869 ) ) ( not ( = ?auto_219871 ?auto_219869 ) ) ( not ( = ?auto_219870 ?auto_219869 ) ) ( not ( = ?auto_219872 ?auto_219873 ) ) ( not ( = ?auto_219871 ?auto_219873 ) ) ( not ( = ?auto_219870 ?auto_219873 ) ) ( not ( = ?auto_219869 ?auto_219873 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219872 ?auto_219871 ?auto_219870 ?auto_219873 ?auto_219869 ?auto_219868 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219912 - OBJ
      ?auto_219913 - OBJ
      ?auto_219914 - OBJ
      ?auto_219915 - OBJ
      ?auto_219916 - OBJ
      ?auto_219911 - LOCATION
    )
    :vars
    (
      ?auto_219918 - LOCATION
      ?auto_219917 - CITY
      ?auto_219919 - LOCATION
      ?auto_219920 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219918 ?auto_219917 ) ( IN-CITY ?auto_219911 ?auto_219917 ) ( not ( = ?auto_219911 ?auto_219918 ) ) ( OBJ-AT ?auto_219915 ?auto_219918 ) ( IN-CITY ?auto_219919 ?auto_219917 ) ( not ( = ?auto_219911 ?auto_219919 ) ) ( OBJ-AT ?auto_219912 ?auto_219919 ) ( OBJ-AT ?auto_219913 ?auto_219918 ) ( OBJ-AT ?auto_219914 ?auto_219919 ) ( OBJ-AT ?auto_219916 ?auto_219918 ) ( TRUCK-AT ?auto_219920 ?auto_219911 ) ( not ( = ?auto_219916 ?auto_219914 ) ) ( not ( = ?auto_219919 ?auto_219918 ) ) ( not ( = ?auto_219916 ?auto_219913 ) ) ( not ( = ?auto_219914 ?auto_219913 ) ) ( not ( = ?auto_219916 ?auto_219912 ) ) ( not ( = ?auto_219914 ?auto_219912 ) ) ( not ( = ?auto_219913 ?auto_219912 ) ) ( not ( = ?auto_219916 ?auto_219915 ) ) ( not ( = ?auto_219914 ?auto_219915 ) ) ( not ( = ?auto_219913 ?auto_219915 ) ) ( not ( = ?auto_219912 ?auto_219915 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219916 ?auto_219914 ?auto_219913 ?auto_219915 ?auto_219912 ?auto_219911 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_220185 - OBJ
      ?auto_220186 - OBJ
      ?auto_220187 - OBJ
      ?auto_220188 - OBJ
      ?auto_220189 - OBJ
      ?auto_220184 - LOCATION
    )
    :vars
    (
      ?auto_220191 - LOCATION
      ?auto_220190 - CITY
      ?auto_220192 - LOCATION
      ?auto_220193 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_220191 ?auto_220190 ) ( IN-CITY ?auto_220184 ?auto_220190 ) ( not ( = ?auto_220184 ?auto_220191 ) ) ( OBJ-AT ?auto_220187 ?auto_220191 ) ( IN-CITY ?auto_220192 ?auto_220190 ) ( not ( = ?auto_220184 ?auto_220192 ) ) ( OBJ-AT ?auto_220185 ?auto_220192 ) ( OBJ-AT ?auto_220186 ?auto_220191 ) ( OBJ-AT ?auto_220189 ?auto_220192 ) ( OBJ-AT ?auto_220188 ?auto_220191 ) ( TRUCK-AT ?auto_220193 ?auto_220184 ) ( not ( = ?auto_220188 ?auto_220189 ) ) ( not ( = ?auto_220192 ?auto_220191 ) ) ( not ( = ?auto_220188 ?auto_220186 ) ) ( not ( = ?auto_220189 ?auto_220186 ) ) ( not ( = ?auto_220188 ?auto_220185 ) ) ( not ( = ?auto_220189 ?auto_220185 ) ) ( not ( = ?auto_220186 ?auto_220185 ) ) ( not ( = ?auto_220188 ?auto_220187 ) ) ( not ( = ?auto_220189 ?auto_220187 ) ) ( not ( = ?auto_220186 ?auto_220187 ) ) ( not ( = ?auto_220185 ?auto_220187 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_220188 ?auto_220189 ?auto_220186 ?auto_220187 ?auto_220185 ?auto_220184 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_220228 - OBJ
      ?auto_220229 - OBJ
      ?auto_220230 - OBJ
      ?auto_220231 - OBJ
      ?auto_220232 - OBJ
      ?auto_220227 - LOCATION
    )
    :vars
    (
      ?auto_220234 - LOCATION
      ?auto_220233 - CITY
      ?auto_220235 - LOCATION
      ?auto_220236 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_220234 ?auto_220233 ) ( IN-CITY ?auto_220227 ?auto_220233 ) ( not ( = ?auto_220227 ?auto_220234 ) ) ( OBJ-AT ?auto_220230 ?auto_220234 ) ( IN-CITY ?auto_220235 ?auto_220233 ) ( not ( = ?auto_220227 ?auto_220235 ) ) ( OBJ-AT ?auto_220228 ?auto_220235 ) ( OBJ-AT ?auto_220229 ?auto_220234 ) ( OBJ-AT ?auto_220231 ?auto_220235 ) ( OBJ-AT ?auto_220232 ?auto_220234 ) ( TRUCK-AT ?auto_220236 ?auto_220227 ) ( not ( = ?auto_220232 ?auto_220231 ) ) ( not ( = ?auto_220235 ?auto_220234 ) ) ( not ( = ?auto_220232 ?auto_220229 ) ) ( not ( = ?auto_220231 ?auto_220229 ) ) ( not ( = ?auto_220232 ?auto_220228 ) ) ( not ( = ?auto_220231 ?auto_220228 ) ) ( not ( = ?auto_220229 ?auto_220228 ) ) ( not ( = ?auto_220232 ?auto_220230 ) ) ( not ( = ?auto_220231 ?auto_220230 ) ) ( not ( = ?auto_220229 ?auto_220230 ) ) ( not ( = ?auto_220228 ?auto_220230 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_220232 ?auto_220231 ?auto_220229 ?auto_220230 ?auto_220228 ?auto_220227 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_221257 - OBJ
      ?auto_221258 - OBJ
      ?auto_221259 - OBJ
      ?auto_221260 - OBJ
      ?auto_221261 - OBJ
      ?auto_221256 - LOCATION
    )
    :vars
    (
      ?auto_221263 - LOCATION
      ?auto_221262 - CITY
      ?auto_221264 - LOCATION
      ?auto_221265 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_221263 ?auto_221262 ) ( IN-CITY ?auto_221256 ?auto_221262 ) ( not ( = ?auto_221256 ?auto_221263 ) ) ( OBJ-AT ?auto_221258 ?auto_221263 ) ( IN-CITY ?auto_221264 ?auto_221262 ) ( not ( = ?auto_221256 ?auto_221264 ) ) ( OBJ-AT ?auto_221257 ?auto_221264 ) ( OBJ-AT ?auto_221261 ?auto_221263 ) ( OBJ-AT ?auto_221260 ?auto_221264 ) ( OBJ-AT ?auto_221259 ?auto_221263 ) ( TRUCK-AT ?auto_221265 ?auto_221256 ) ( not ( = ?auto_221259 ?auto_221260 ) ) ( not ( = ?auto_221264 ?auto_221263 ) ) ( not ( = ?auto_221259 ?auto_221261 ) ) ( not ( = ?auto_221260 ?auto_221261 ) ) ( not ( = ?auto_221259 ?auto_221257 ) ) ( not ( = ?auto_221260 ?auto_221257 ) ) ( not ( = ?auto_221261 ?auto_221257 ) ) ( not ( = ?auto_221259 ?auto_221258 ) ) ( not ( = ?auto_221260 ?auto_221258 ) ) ( not ( = ?auto_221261 ?auto_221258 ) ) ( not ( = ?auto_221257 ?auto_221258 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_221259 ?auto_221260 ?auto_221261 ?auto_221258 ?auto_221257 ?auto_221256 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_221300 - OBJ
      ?auto_221301 - OBJ
      ?auto_221302 - OBJ
      ?auto_221303 - OBJ
      ?auto_221304 - OBJ
      ?auto_221299 - LOCATION
    )
    :vars
    (
      ?auto_221306 - LOCATION
      ?auto_221305 - CITY
      ?auto_221307 - LOCATION
      ?auto_221308 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_221306 ?auto_221305 ) ( IN-CITY ?auto_221299 ?auto_221305 ) ( not ( = ?auto_221299 ?auto_221306 ) ) ( OBJ-AT ?auto_221301 ?auto_221306 ) ( IN-CITY ?auto_221307 ?auto_221305 ) ( not ( = ?auto_221299 ?auto_221307 ) ) ( OBJ-AT ?auto_221300 ?auto_221307 ) ( OBJ-AT ?auto_221303 ?auto_221306 ) ( OBJ-AT ?auto_221304 ?auto_221307 ) ( OBJ-AT ?auto_221302 ?auto_221306 ) ( TRUCK-AT ?auto_221308 ?auto_221299 ) ( not ( = ?auto_221302 ?auto_221304 ) ) ( not ( = ?auto_221307 ?auto_221306 ) ) ( not ( = ?auto_221302 ?auto_221303 ) ) ( not ( = ?auto_221304 ?auto_221303 ) ) ( not ( = ?auto_221302 ?auto_221300 ) ) ( not ( = ?auto_221304 ?auto_221300 ) ) ( not ( = ?auto_221303 ?auto_221300 ) ) ( not ( = ?auto_221302 ?auto_221301 ) ) ( not ( = ?auto_221304 ?auto_221301 ) ) ( not ( = ?auto_221303 ?auto_221301 ) ) ( not ( = ?auto_221300 ?auto_221301 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_221302 ?auto_221304 ?auto_221303 ?auto_221301 ?auto_221300 ?auto_221299 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_221481 - OBJ
      ?auto_221482 - OBJ
      ?auto_221483 - OBJ
      ?auto_221484 - OBJ
      ?auto_221485 - OBJ
      ?auto_221480 - LOCATION
    )
    :vars
    (
      ?auto_221487 - LOCATION
      ?auto_221486 - CITY
      ?auto_221488 - LOCATION
      ?auto_221489 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_221487 ?auto_221486 ) ( IN-CITY ?auto_221480 ?auto_221486 ) ( not ( = ?auto_221480 ?auto_221487 ) ) ( OBJ-AT ?auto_221482 ?auto_221487 ) ( IN-CITY ?auto_221488 ?auto_221486 ) ( not ( = ?auto_221480 ?auto_221488 ) ) ( OBJ-AT ?auto_221481 ?auto_221488 ) ( OBJ-AT ?auto_221485 ?auto_221487 ) ( OBJ-AT ?auto_221483 ?auto_221488 ) ( OBJ-AT ?auto_221484 ?auto_221487 ) ( TRUCK-AT ?auto_221489 ?auto_221480 ) ( not ( = ?auto_221484 ?auto_221483 ) ) ( not ( = ?auto_221488 ?auto_221487 ) ) ( not ( = ?auto_221484 ?auto_221485 ) ) ( not ( = ?auto_221483 ?auto_221485 ) ) ( not ( = ?auto_221484 ?auto_221481 ) ) ( not ( = ?auto_221483 ?auto_221481 ) ) ( not ( = ?auto_221485 ?auto_221481 ) ) ( not ( = ?auto_221484 ?auto_221482 ) ) ( not ( = ?auto_221483 ?auto_221482 ) ) ( not ( = ?auto_221485 ?auto_221482 ) ) ( not ( = ?auto_221481 ?auto_221482 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_221484 ?auto_221483 ?auto_221485 ?auto_221482 ?auto_221481 ?auto_221480 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_221571 - OBJ
      ?auto_221572 - OBJ
      ?auto_221573 - OBJ
      ?auto_221574 - OBJ
      ?auto_221575 - OBJ
      ?auto_221570 - LOCATION
    )
    :vars
    (
      ?auto_221577 - LOCATION
      ?auto_221576 - CITY
      ?auto_221578 - LOCATION
      ?auto_221579 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_221577 ?auto_221576 ) ( IN-CITY ?auto_221570 ?auto_221576 ) ( not ( = ?auto_221570 ?auto_221577 ) ) ( OBJ-AT ?auto_221572 ?auto_221577 ) ( IN-CITY ?auto_221578 ?auto_221576 ) ( not ( = ?auto_221570 ?auto_221578 ) ) ( OBJ-AT ?auto_221571 ?auto_221578 ) ( OBJ-AT ?auto_221574 ?auto_221577 ) ( OBJ-AT ?auto_221573 ?auto_221578 ) ( OBJ-AT ?auto_221575 ?auto_221577 ) ( TRUCK-AT ?auto_221579 ?auto_221570 ) ( not ( = ?auto_221575 ?auto_221573 ) ) ( not ( = ?auto_221578 ?auto_221577 ) ) ( not ( = ?auto_221575 ?auto_221574 ) ) ( not ( = ?auto_221573 ?auto_221574 ) ) ( not ( = ?auto_221575 ?auto_221571 ) ) ( not ( = ?auto_221573 ?auto_221571 ) ) ( not ( = ?auto_221574 ?auto_221571 ) ) ( not ( = ?auto_221575 ?auto_221572 ) ) ( not ( = ?auto_221573 ?auto_221572 ) ) ( not ( = ?auto_221574 ?auto_221572 ) ) ( not ( = ?auto_221571 ?auto_221572 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_221575 ?auto_221573 ?auto_221574 ?auto_221572 ?auto_221571 ?auto_221570 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_221752 - OBJ
      ?auto_221753 - OBJ
      ?auto_221754 - OBJ
      ?auto_221755 - OBJ
      ?auto_221756 - OBJ
      ?auto_221751 - LOCATION
    )
    :vars
    (
      ?auto_221758 - LOCATION
      ?auto_221757 - CITY
      ?auto_221759 - LOCATION
      ?auto_221760 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_221758 ?auto_221757 ) ( IN-CITY ?auto_221751 ?auto_221757 ) ( not ( = ?auto_221751 ?auto_221758 ) ) ( OBJ-AT ?auto_221753 ?auto_221758 ) ( IN-CITY ?auto_221759 ?auto_221757 ) ( not ( = ?auto_221751 ?auto_221759 ) ) ( OBJ-AT ?auto_221752 ?auto_221759 ) ( OBJ-AT ?auto_221754 ?auto_221758 ) ( OBJ-AT ?auto_221756 ?auto_221759 ) ( OBJ-AT ?auto_221755 ?auto_221758 ) ( TRUCK-AT ?auto_221760 ?auto_221751 ) ( not ( = ?auto_221755 ?auto_221756 ) ) ( not ( = ?auto_221759 ?auto_221758 ) ) ( not ( = ?auto_221755 ?auto_221754 ) ) ( not ( = ?auto_221756 ?auto_221754 ) ) ( not ( = ?auto_221755 ?auto_221752 ) ) ( not ( = ?auto_221756 ?auto_221752 ) ) ( not ( = ?auto_221754 ?auto_221752 ) ) ( not ( = ?auto_221755 ?auto_221753 ) ) ( not ( = ?auto_221756 ?auto_221753 ) ) ( not ( = ?auto_221754 ?auto_221753 ) ) ( not ( = ?auto_221752 ?auto_221753 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_221755 ?auto_221756 ?auto_221754 ?auto_221753 ?auto_221752 ?auto_221751 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_221795 - OBJ
      ?auto_221796 - OBJ
      ?auto_221797 - OBJ
      ?auto_221798 - OBJ
      ?auto_221799 - OBJ
      ?auto_221794 - LOCATION
    )
    :vars
    (
      ?auto_221801 - LOCATION
      ?auto_221800 - CITY
      ?auto_221802 - LOCATION
      ?auto_221803 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_221801 ?auto_221800 ) ( IN-CITY ?auto_221794 ?auto_221800 ) ( not ( = ?auto_221794 ?auto_221801 ) ) ( OBJ-AT ?auto_221796 ?auto_221801 ) ( IN-CITY ?auto_221802 ?auto_221800 ) ( not ( = ?auto_221794 ?auto_221802 ) ) ( OBJ-AT ?auto_221795 ?auto_221802 ) ( OBJ-AT ?auto_221797 ?auto_221801 ) ( OBJ-AT ?auto_221798 ?auto_221802 ) ( OBJ-AT ?auto_221799 ?auto_221801 ) ( TRUCK-AT ?auto_221803 ?auto_221794 ) ( not ( = ?auto_221799 ?auto_221798 ) ) ( not ( = ?auto_221802 ?auto_221801 ) ) ( not ( = ?auto_221799 ?auto_221797 ) ) ( not ( = ?auto_221798 ?auto_221797 ) ) ( not ( = ?auto_221799 ?auto_221795 ) ) ( not ( = ?auto_221798 ?auto_221795 ) ) ( not ( = ?auto_221797 ?auto_221795 ) ) ( not ( = ?auto_221799 ?auto_221796 ) ) ( not ( = ?auto_221798 ?auto_221796 ) ) ( not ( = ?auto_221797 ?auto_221796 ) ) ( not ( = ?auto_221795 ?auto_221796 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_221799 ?auto_221798 ?auto_221797 ?auto_221796 ?auto_221795 ?auto_221794 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_223066 - OBJ
      ?auto_223067 - OBJ
      ?auto_223068 - OBJ
      ?auto_223069 - OBJ
      ?auto_223070 - OBJ
      ?auto_223065 - LOCATION
    )
    :vars
    (
      ?auto_223072 - LOCATION
      ?auto_223071 - CITY
      ?auto_223073 - LOCATION
      ?auto_223074 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_223072 ?auto_223071 ) ( IN-CITY ?auto_223065 ?auto_223071 ) ( not ( = ?auto_223065 ?auto_223072 ) ) ( OBJ-AT ?auto_223066 ?auto_223072 ) ( IN-CITY ?auto_223073 ?auto_223071 ) ( not ( = ?auto_223065 ?auto_223073 ) ) ( OBJ-AT ?auto_223070 ?auto_223073 ) ( OBJ-AT ?auto_223069 ?auto_223072 ) ( OBJ-AT ?auto_223068 ?auto_223073 ) ( OBJ-AT ?auto_223067 ?auto_223072 ) ( TRUCK-AT ?auto_223074 ?auto_223065 ) ( not ( = ?auto_223067 ?auto_223068 ) ) ( not ( = ?auto_223073 ?auto_223072 ) ) ( not ( = ?auto_223067 ?auto_223069 ) ) ( not ( = ?auto_223068 ?auto_223069 ) ) ( not ( = ?auto_223067 ?auto_223070 ) ) ( not ( = ?auto_223068 ?auto_223070 ) ) ( not ( = ?auto_223069 ?auto_223070 ) ) ( not ( = ?auto_223067 ?auto_223066 ) ) ( not ( = ?auto_223068 ?auto_223066 ) ) ( not ( = ?auto_223069 ?auto_223066 ) ) ( not ( = ?auto_223070 ?auto_223066 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_223067 ?auto_223068 ?auto_223069 ?auto_223066 ?auto_223070 ?auto_223065 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_223109 - OBJ
      ?auto_223110 - OBJ
      ?auto_223111 - OBJ
      ?auto_223112 - OBJ
      ?auto_223113 - OBJ
      ?auto_223108 - LOCATION
    )
    :vars
    (
      ?auto_223115 - LOCATION
      ?auto_223114 - CITY
      ?auto_223116 - LOCATION
      ?auto_223117 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_223115 ?auto_223114 ) ( IN-CITY ?auto_223108 ?auto_223114 ) ( not ( = ?auto_223108 ?auto_223115 ) ) ( OBJ-AT ?auto_223109 ?auto_223115 ) ( IN-CITY ?auto_223116 ?auto_223114 ) ( not ( = ?auto_223108 ?auto_223116 ) ) ( OBJ-AT ?auto_223112 ?auto_223116 ) ( OBJ-AT ?auto_223113 ?auto_223115 ) ( OBJ-AT ?auto_223111 ?auto_223116 ) ( OBJ-AT ?auto_223110 ?auto_223115 ) ( TRUCK-AT ?auto_223117 ?auto_223108 ) ( not ( = ?auto_223110 ?auto_223111 ) ) ( not ( = ?auto_223116 ?auto_223115 ) ) ( not ( = ?auto_223110 ?auto_223113 ) ) ( not ( = ?auto_223111 ?auto_223113 ) ) ( not ( = ?auto_223110 ?auto_223112 ) ) ( not ( = ?auto_223111 ?auto_223112 ) ) ( not ( = ?auto_223113 ?auto_223112 ) ) ( not ( = ?auto_223110 ?auto_223109 ) ) ( not ( = ?auto_223111 ?auto_223109 ) ) ( not ( = ?auto_223113 ?auto_223109 ) ) ( not ( = ?auto_223112 ?auto_223109 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_223110 ?auto_223111 ?auto_223113 ?auto_223109 ?auto_223112 ?auto_223108 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_223290 - OBJ
      ?auto_223291 - OBJ
      ?auto_223292 - OBJ
      ?auto_223293 - OBJ
      ?auto_223294 - OBJ
      ?auto_223289 - LOCATION
    )
    :vars
    (
      ?auto_223296 - LOCATION
      ?auto_223295 - CITY
      ?auto_223297 - LOCATION
      ?auto_223298 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_223296 ?auto_223295 ) ( IN-CITY ?auto_223289 ?auto_223295 ) ( not ( = ?auto_223289 ?auto_223296 ) ) ( OBJ-AT ?auto_223290 ?auto_223296 ) ( IN-CITY ?auto_223297 ?auto_223295 ) ( not ( = ?auto_223289 ?auto_223297 ) ) ( OBJ-AT ?auto_223294 ?auto_223297 ) ( OBJ-AT ?auto_223292 ?auto_223296 ) ( OBJ-AT ?auto_223293 ?auto_223297 ) ( OBJ-AT ?auto_223291 ?auto_223296 ) ( TRUCK-AT ?auto_223298 ?auto_223289 ) ( not ( = ?auto_223291 ?auto_223293 ) ) ( not ( = ?auto_223297 ?auto_223296 ) ) ( not ( = ?auto_223291 ?auto_223292 ) ) ( not ( = ?auto_223293 ?auto_223292 ) ) ( not ( = ?auto_223291 ?auto_223294 ) ) ( not ( = ?auto_223293 ?auto_223294 ) ) ( not ( = ?auto_223292 ?auto_223294 ) ) ( not ( = ?auto_223291 ?auto_223290 ) ) ( not ( = ?auto_223293 ?auto_223290 ) ) ( not ( = ?auto_223292 ?auto_223290 ) ) ( not ( = ?auto_223294 ?auto_223290 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_223291 ?auto_223293 ?auto_223292 ?auto_223290 ?auto_223294 ?auto_223289 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_223380 - OBJ
      ?auto_223381 - OBJ
      ?auto_223382 - OBJ
      ?auto_223383 - OBJ
      ?auto_223384 - OBJ
      ?auto_223379 - LOCATION
    )
    :vars
    (
      ?auto_223386 - LOCATION
      ?auto_223385 - CITY
      ?auto_223387 - LOCATION
      ?auto_223388 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_223386 ?auto_223385 ) ( IN-CITY ?auto_223379 ?auto_223385 ) ( not ( = ?auto_223379 ?auto_223386 ) ) ( OBJ-AT ?auto_223380 ?auto_223386 ) ( IN-CITY ?auto_223387 ?auto_223385 ) ( not ( = ?auto_223379 ?auto_223387 ) ) ( OBJ-AT ?auto_223383 ?auto_223387 ) ( OBJ-AT ?auto_223382 ?auto_223386 ) ( OBJ-AT ?auto_223384 ?auto_223387 ) ( OBJ-AT ?auto_223381 ?auto_223386 ) ( TRUCK-AT ?auto_223388 ?auto_223379 ) ( not ( = ?auto_223381 ?auto_223384 ) ) ( not ( = ?auto_223387 ?auto_223386 ) ) ( not ( = ?auto_223381 ?auto_223382 ) ) ( not ( = ?auto_223384 ?auto_223382 ) ) ( not ( = ?auto_223381 ?auto_223383 ) ) ( not ( = ?auto_223384 ?auto_223383 ) ) ( not ( = ?auto_223382 ?auto_223383 ) ) ( not ( = ?auto_223381 ?auto_223380 ) ) ( not ( = ?auto_223384 ?auto_223380 ) ) ( not ( = ?auto_223382 ?auto_223380 ) ) ( not ( = ?auto_223383 ?auto_223380 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_223381 ?auto_223384 ?auto_223382 ?auto_223380 ?auto_223383 ?auto_223379 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_223561 - OBJ
      ?auto_223562 - OBJ
      ?auto_223563 - OBJ
      ?auto_223564 - OBJ
      ?auto_223565 - OBJ
      ?auto_223560 - LOCATION
    )
    :vars
    (
      ?auto_223567 - LOCATION
      ?auto_223566 - CITY
      ?auto_223568 - LOCATION
      ?auto_223569 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_223567 ?auto_223566 ) ( IN-CITY ?auto_223560 ?auto_223566 ) ( not ( = ?auto_223560 ?auto_223567 ) ) ( OBJ-AT ?auto_223561 ?auto_223567 ) ( IN-CITY ?auto_223568 ?auto_223566 ) ( not ( = ?auto_223560 ?auto_223568 ) ) ( OBJ-AT ?auto_223563 ?auto_223568 ) ( OBJ-AT ?auto_223565 ?auto_223567 ) ( OBJ-AT ?auto_223564 ?auto_223568 ) ( OBJ-AT ?auto_223562 ?auto_223567 ) ( TRUCK-AT ?auto_223569 ?auto_223560 ) ( not ( = ?auto_223562 ?auto_223564 ) ) ( not ( = ?auto_223568 ?auto_223567 ) ) ( not ( = ?auto_223562 ?auto_223565 ) ) ( not ( = ?auto_223564 ?auto_223565 ) ) ( not ( = ?auto_223562 ?auto_223563 ) ) ( not ( = ?auto_223564 ?auto_223563 ) ) ( not ( = ?auto_223565 ?auto_223563 ) ) ( not ( = ?auto_223562 ?auto_223561 ) ) ( not ( = ?auto_223564 ?auto_223561 ) ) ( not ( = ?auto_223565 ?auto_223561 ) ) ( not ( = ?auto_223563 ?auto_223561 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_223562 ?auto_223564 ?auto_223565 ?auto_223561 ?auto_223563 ?auto_223560 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_223604 - OBJ
      ?auto_223605 - OBJ
      ?auto_223606 - OBJ
      ?auto_223607 - OBJ
      ?auto_223608 - OBJ
      ?auto_223603 - LOCATION
    )
    :vars
    (
      ?auto_223610 - LOCATION
      ?auto_223609 - CITY
      ?auto_223611 - LOCATION
      ?auto_223612 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_223610 ?auto_223609 ) ( IN-CITY ?auto_223603 ?auto_223609 ) ( not ( = ?auto_223603 ?auto_223610 ) ) ( OBJ-AT ?auto_223604 ?auto_223610 ) ( IN-CITY ?auto_223611 ?auto_223609 ) ( not ( = ?auto_223603 ?auto_223611 ) ) ( OBJ-AT ?auto_223606 ?auto_223611 ) ( OBJ-AT ?auto_223607 ?auto_223610 ) ( OBJ-AT ?auto_223608 ?auto_223611 ) ( OBJ-AT ?auto_223605 ?auto_223610 ) ( TRUCK-AT ?auto_223612 ?auto_223603 ) ( not ( = ?auto_223605 ?auto_223608 ) ) ( not ( = ?auto_223611 ?auto_223610 ) ) ( not ( = ?auto_223605 ?auto_223607 ) ) ( not ( = ?auto_223608 ?auto_223607 ) ) ( not ( = ?auto_223605 ?auto_223606 ) ) ( not ( = ?auto_223608 ?auto_223606 ) ) ( not ( = ?auto_223607 ?auto_223606 ) ) ( not ( = ?auto_223605 ?auto_223604 ) ) ( not ( = ?auto_223608 ?auto_223604 ) ) ( not ( = ?auto_223607 ?auto_223604 ) ) ( not ( = ?auto_223606 ?auto_223604 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_223605 ?auto_223608 ?auto_223607 ?auto_223604 ?auto_223606 ?auto_223603 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224210 - OBJ
      ?auto_224211 - OBJ
      ?auto_224212 - OBJ
      ?auto_224213 - OBJ
      ?auto_224214 - OBJ
      ?auto_224209 - LOCATION
    )
    :vars
    (
      ?auto_224216 - LOCATION
      ?auto_224215 - CITY
      ?auto_224217 - LOCATION
      ?auto_224218 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224216 ?auto_224215 ) ( IN-CITY ?auto_224209 ?auto_224215 ) ( not ( = ?auto_224209 ?auto_224216 ) ) ( OBJ-AT ?auto_224210 ?auto_224216 ) ( IN-CITY ?auto_224217 ?auto_224215 ) ( not ( = ?auto_224209 ?auto_224217 ) ) ( OBJ-AT ?auto_224214 ?auto_224217 ) ( OBJ-AT ?auto_224213 ?auto_224216 ) ( OBJ-AT ?auto_224211 ?auto_224217 ) ( OBJ-AT ?auto_224212 ?auto_224216 ) ( TRUCK-AT ?auto_224218 ?auto_224209 ) ( not ( = ?auto_224212 ?auto_224211 ) ) ( not ( = ?auto_224217 ?auto_224216 ) ) ( not ( = ?auto_224212 ?auto_224213 ) ) ( not ( = ?auto_224211 ?auto_224213 ) ) ( not ( = ?auto_224212 ?auto_224214 ) ) ( not ( = ?auto_224211 ?auto_224214 ) ) ( not ( = ?auto_224213 ?auto_224214 ) ) ( not ( = ?auto_224212 ?auto_224210 ) ) ( not ( = ?auto_224211 ?auto_224210 ) ) ( not ( = ?auto_224213 ?auto_224210 ) ) ( not ( = ?auto_224214 ?auto_224210 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224212 ?auto_224211 ?auto_224213 ?auto_224210 ?auto_224214 ?auto_224209 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224253 - OBJ
      ?auto_224254 - OBJ
      ?auto_224255 - OBJ
      ?auto_224256 - OBJ
      ?auto_224257 - OBJ
      ?auto_224252 - LOCATION
    )
    :vars
    (
      ?auto_224259 - LOCATION
      ?auto_224258 - CITY
      ?auto_224260 - LOCATION
      ?auto_224261 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224259 ?auto_224258 ) ( IN-CITY ?auto_224252 ?auto_224258 ) ( not ( = ?auto_224252 ?auto_224259 ) ) ( OBJ-AT ?auto_224253 ?auto_224259 ) ( IN-CITY ?auto_224260 ?auto_224258 ) ( not ( = ?auto_224252 ?auto_224260 ) ) ( OBJ-AT ?auto_224256 ?auto_224260 ) ( OBJ-AT ?auto_224257 ?auto_224259 ) ( OBJ-AT ?auto_224254 ?auto_224260 ) ( OBJ-AT ?auto_224255 ?auto_224259 ) ( TRUCK-AT ?auto_224261 ?auto_224252 ) ( not ( = ?auto_224255 ?auto_224254 ) ) ( not ( = ?auto_224260 ?auto_224259 ) ) ( not ( = ?auto_224255 ?auto_224257 ) ) ( not ( = ?auto_224254 ?auto_224257 ) ) ( not ( = ?auto_224255 ?auto_224256 ) ) ( not ( = ?auto_224254 ?auto_224256 ) ) ( not ( = ?auto_224257 ?auto_224256 ) ) ( not ( = ?auto_224255 ?auto_224253 ) ) ( not ( = ?auto_224254 ?auto_224253 ) ) ( not ( = ?auto_224257 ?auto_224253 ) ) ( not ( = ?auto_224256 ?auto_224253 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224255 ?auto_224254 ?auto_224257 ?auto_224253 ?auto_224256 ?auto_224252 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224674 - OBJ
      ?auto_224675 - OBJ
      ?auto_224676 - OBJ
      ?auto_224677 - OBJ
      ?auto_224678 - OBJ
      ?auto_224673 - LOCATION
    )
    :vars
    (
      ?auto_224680 - LOCATION
      ?auto_224679 - CITY
      ?auto_224681 - LOCATION
      ?auto_224682 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224680 ?auto_224679 ) ( IN-CITY ?auto_224673 ?auto_224679 ) ( not ( = ?auto_224673 ?auto_224680 ) ) ( OBJ-AT ?auto_224674 ?auto_224680 ) ( IN-CITY ?auto_224681 ?auto_224679 ) ( not ( = ?auto_224673 ?auto_224681 ) ) ( OBJ-AT ?auto_224678 ?auto_224681 ) ( OBJ-AT ?auto_224676 ?auto_224680 ) ( OBJ-AT ?auto_224675 ?auto_224681 ) ( OBJ-AT ?auto_224677 ?auto_224680 ) ( TRUCK-AT ?auto_224682 ?auto_224673 ) ( not ( = ?auto_224677 ?auto_224675 ) ) ( not ( = ?auto_224681 ?auto_224680 ) ) ( not ( = ?auto_224677 ?auto_224676 ) ) ( not ( = ?auto_224675 ?auto_224676 ) ) ( not ( = ?auto_224677 ?auto_224678 ) ) ( not ( = ?auto_224675 ?auto_224678 ) ) ( not ( = ?auto_224676 ?auto_224678 ) ) ( not ( = ?auto_224677 ?auto_224674 ) ) ( not ( = ?auto_224675 ?auto_224674 ) ) ( not ( = ?auto_224676 ?auto_224674 ) ) ( not ( = ?auto_224678 ?auto_224674 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224677 ?auto_224675 ?auto_224676 ?auto_224674 ?auto_224678 ?auto_224673 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224811 - OBJ
      ?auto_224812 - OBJ
      ?auto_224813 - OBJ
      ?auto_224814 - OBJ
      ?auto_224815 - OBJ
      ?auto_224810 - LOCATION
    )
    :vars
    (
      ?auto_224817 - LOCATION
      ?auto_224816 - CITY
      ?auto_224818 - LOCATION
      ?auto_224819 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224817 ?auto_224816 ) ( IN-CITY ?auto_224810 ?auto_224816 ) ( not ( = ?auto_224810 ?auto_224817 ) ) ( OBJ-AT ?auto_224811 ?auto_224817 ) ( IN-CITY ?auto_224818 ?auto_224816 ) ( not ( = ?auto_224810 ?auto_224818 ) ) ( OBJ-AT ?auto_224814 ?auto_224818 ) ( OBJ-AT ?auto_224813 ?auto_224817 ) ( OBJ-AT ?auto_224812 ?auto_224818 ) ( OBJ-AT ?auto_224815 ?auto_224817 ) ( TRUCK-AT ?auto_224819 ?auto_224810 ) ( not ( = ?auto_224815 ?auto_224812 ) ) ( not ( = ?auto_224818 ?auto_224817 ) ) ( not ( = ?auto_224815 ?auto_224813 ) ) ( not ( = ?auto_224812 ?auto_224813 ) ) ( not ( = ?auto_224815 ?auto_224814 ) ) ( not ( = ?auto_224812 ?auto_224814 ) ) ( not ( = ?auto_224813 ?auto_224814 ) ) ( not ( = ?auto_224815 ?auto_224811 ) ) ( not ( = ?auto_224812 ?auto_224811 ) ) ( not ( = ?auto_224813 ?auto_224811 ) ) ( not ( = ?auto_224814 ?auto_224811 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224815 ?auto_224812 ?auto_224813 ?auto_224811 ?auto_224814 ?auto_224810 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224945 - OBJ
      ?auto_224946 - OBJ
      ?auto_224947 - OBJ
      ?auto_224948 - OBJ
      ?auto_224949 - OBJ
      ?auto_224944 - LOCATION
    )
    :vars
    (
      ?auto_224951 - LOCATION
      ?auto_224950 - CITY
      ?auto_224952 - LOCATION
      ?auto_224953 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224951 ?auto_224950 ) ( IN-CITY ?auto_224944 ?auto_224950 ) ( not ( = ?auto_224944 ?auto_224951 ) ) ( OBJ-AT ?auto_224945 ?auto_224951 ) ( IN-CITY ?auto_224952 ?auto_224950 ) ( not ( = ?auto_224944 ?auto_224952 ) ) ( OBJ-AT ?auto_224947 ?auto_224952 ) ( OBJ-AT ?auto_224949 ?auto_224951 ) ( OBJ-AT ?auto_224946 ?auto_224952 ) ( OBJ-AT ?auto_224948 ?auto_224951 ) ( TRUCK-AT ?auto_224953 ?auto_224944 ) ( not ( = ?auto_224948 ?auto_224946 ) ) ( not ( = ?auto_224952 ?auto_224951 ) ) ( not ( = ?auto_224948 ?auto_224949 ) ) ( not ( = ?auto_224946 ?auto_224949 ) ) ( not ( = ?auto_224948 ?auto_224947 ) ) ( not ( = ?auto_224946 ?auto_224947 ) ) ( not ( = ?auto_224949 ?auto_224947 ) ) ( not ( = ?auto_224948 ?auto_224945 ) ) ( not ( = ?auto_224946 ?auto_224945 ) ) ( not ( = ?auto_224949 ?auto_224945 ) ) ( not ( = ?auto_224947 ?auto_224945 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224948 ?auto_224946 ?auto_224949 ?auto_224945 ?auto_224947 ?auto_224944 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225035 - OBJ
      ?auto_225036 - OBJ
      ?auto_225037 - OBJ
      ?auto_225038 - OBJ
      ?auto_225039 - OBJ
      ?auto_225034 - LOCATION
    )
    :vars
    (
      ?auto_225041 - LOCATION
      ?auto_225040 - CITY
      ?auto_225042 - LOCATION
      ?auto_225043 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_225041 ?auto_225040 ) ( IN-CITY ?auto_225034 ?auto_225040 ) ( not ( = ?auto_225034 ?auto_225041 ) ) ( OBJ-AT ?auto_225035 ?auto_225041 ) ( IN-CITY ?auto_225042 ?auto_225040 ) ( not ( = ?auto_225034 ?auto_225042 ) ) ( OBJ-AT ?auto_225037 ?auto_225042 ) ( OBJ-AT ?auto_225038 ?auto_225041 ) ( OBJ-AT ?auto_225036 ?auto_225042 ) ( OBJ-AT ?auto_225039 ?auto_225041 ) ( TRUCK-AT ?auto_225043 ?auto_225034 ) ( not ( = ?auto_225039 ?auto_225036 ) ) ( not ( = ?auto_225042 ?auto_225041 ) ) ( not ( = ?auto_225039 ?auto_225038 ) ) ( not ( = ?auto_225036 ?auto_225038 ) ) ( not ( = ?auto_225039 ?auto_225037 ) ) ( not ( = ?auto_225036 ?auto_225037 ) ) ( not ( = ?auto_225038 ?auto_225037 ) ) ( not ( = ?auto_225039 ?auto_225035 ) ) ( not ( = ?auto_225036 ?auto_225035 ) ) ( not ( = ?auto_225038 ?auto_225035 ) ) ( not ( = ?auto_225037 ?auto_225035 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_225039 ?auto_225036 ?auto_225038 ?auto_225035 ?auto_225037 ?auto_225034 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225594 - OBJ
      ?auto_225595 - OBJ
      ?auto_225596 - OBJ
      ?auto_225597 - OBJ
      ?auto_225598 - OBJ
      ?auto_225593 - LOCATION
    )
    :vars
    (
      ?auto_225600 - LOCATION
      ?auto_225599 - CITY
      ?auto_225601 - LOCATION
      ?auto_225602 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_225600 ?auto_225599 ) ( IN-CITY ?auto_225593 ?auto_225599 ) ( not ( = ?auto_225593 ?auto_225600 ) ) ( OBJ-AT ?auto_225594 ?auto_225600 ) ( IN-CITY ?auto_225601 ?auto_225599 ) ( not ( = ?auto_225593 ?auto_225601 ) ) ( OBJ-AT ?auto_225598 ?auto_225601 ) ( OBJ-AT ?auto_225595 ?auto_225600 ) ( OBJ-AT ?auto_225597 ?auto_225601 ) ( OBJ-AT ?auto_225596 ?auto_225600 ) ( TRUCK-AT ?auto_225602 ?auto_225593 ) ( not ( = ?auto_225596 ?auto_225597 ) ) ( not ( = ?auto_225601 ?auto_225600 ) ) ( not ( = ?auto_225596 ?auto_225595 ) ) ( not ( = ?auto_225597 ?auto_225595 ) ) ( not ( = ?auto_225596 ?auto_225598 ) ) ( not ( = ?auto_225597 ?auto_225598 ) ) ( not ( = ?auto_225595 ?auto_225598 ) ) ( not ( = ?auto_225596 ?auto_225594 ) ) ( not ( = ?auto_225597 ?auto_225594 ) ) ( not ( = ?auto_225595 ?auto_225594 ) ) ( not ( = ?auto_225598 ?auto_225594 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_225596 ?auto_225597 ?auto_225595 ?auto_225594 ?auto_225598 ?auto_225593 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225684 - OBJ
      ?auto_225685 - OBJ
      ?auto_225686 - OBJ
      ?auto_225687 - OBJ
      ?auto_225688 - OBJ
      ?auto_225683 - LOCATION
    )
    :vars
    (
      ?auto_225690 - LOCATION
      ?auto_225689 - CITY
      ?auto_225691 - LOCATION
      ?auto_225692 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_225690 ?auto_225689 ) ( IN-CITY ?auto_225683 ?auto_225689 ) ( not ( = ?auto_225683 ?auto_225690 ) ) ( OBJ-AT ?auto_225684 ?auto_225690 ) ( IN-CITY ?auto_225691 ?auto_225689 ) ( not ( = ?auto_225683 ?auto_225691 ) ) ( OBJ-AT ?auto_225687 ?auto_225691 ) ( OBJ-AT ?auto_225685 ?auto_225690 ) ( OBJ-AT ?auto_225688 ?auto_225691 ) ( OBJ-AT ?auto_225686 ?auto_225690 ) ( TRUCK-AT ?auto_225692 ?auto_225683 ) ( not ( = ?auto_225686 ?auto_225688 ) ) ( not ( = ?auto_225691 ?auto_225690 ) ) ( not ( = ?auto_225686 ?auto_225685 ) ) ( not ( = ?auto_225688 ?auto_225685 ) ) ( not ( = ?auto_225686 ?auto_225687 ) ) ( not ( = ?auto_225688 ?auto_225687 ) ) ( not ( = ?auto_225685 ?auto_225687 ) ) ( not ( = ?auto_225686 ?auto_225684 ) ) ( not ( = ?auto_225688 ?auto_225684 ) ) ( not ( = ?auto_225685 ?auto_225684 ) ) ( not ( = ?auto_225687 ?auto_225684 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_225686 ?auto_225688 ?auto_225685 ?auto_225684 ?auto_225687 ?auto_225683 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225818 - OBJ
      ?auto_225819 - OBJ
      ?auto_225820 - OBJ
      ?auto_225821 - OBJ
      ?auto_225822 - OBJ
      ?auto_225817 - LOCATION
    )
    :vars
    (
      ?auto_225824 - LOCATION
      ?auto_225823 - CITY
      ?auto_225825 - LOCATION
      ?auto_225826 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_225824 ?auto_225823 ) ( IN-CITY ?auto_225817 ?auto_225823 ) ( not ( = ?auto_225817 ?auto_225824 ) ) ( OBJ-AT ?auto_225818 ?auto_225824 ) ( IN-CITY ?auto_225825 ?auto_225823 ) ( not ( = ?auto_225817 ?auto_225825 ) ) ( OBJ-AT ?auto_225822 ?auto_225825 ) ( OBJ-AT ?auto_225819 ?auto_225824 ) ( OBJ-AT ?auto_225820 ?auto_225825 ) ( OBJ-AT ?auto_225821 ?auto_225824 ) ( TRUCK-AT ?auto_225826 ?auto_225817 ) ( not ( = ?auto_225821 ?auto_225820 ) ) ( not ( = ?auto_225825 ?auto_225824 ) ) ( not ( = ?auto_225821 ?auto_225819 ) ) ( not ( = ?auto_225820 ?auto_225819 ) ) ( not ( = ?auto_225821 ?auto_225822 ) ) ( not ( = ?auto_225820 ?auto_225822 ) ) ( not ( = ?auto_225819 ?auto_225822 ) ) ( not ( = ?auto_225821 ?auto_225818 ) ) ( not ( = ?auto_225820 ?auto_225818 ) ) ( not ( = ?auto_225819 ?auto_225818 ) ) ( not ( = ?auto_225822 ?auto_225818 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_225821 ?auto_225820 ?auto_225819 ?auto_225818 ?auto_225822 ?auto_225817 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225955 - OBJ
      ?auto_225956 - OBJ
      ?auto_225957 - OBJ
      ?auto_225958 - OBJ
      ?auto_225959 - OBJ
      ?auto_225954 - LOCATION
    )
    :vars
    (
      ?auto_225961 - LOCATION
      ?auto_225960 - CITY
      ?auto_225962 - LOCATION
      ?auto_225963 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_225961 ?auto_225960 ) ( IN-CITY ?auto_225954 ?auto_225960 ) ( not ( = ?auto_225954 ?auto_225961 ) ) ( OBJ-AT ?auto_225955 ?auto_225961 ) ( IN-CITY ?auto_225962 ?auto_225960 ) ( not ( = ?auto_225954 ?auto_225962 ) ) ( OBJ-AT ?auto_225958 ?auto_225962 ) ( OBJ-AT ?auto_225956 ?auto_225961 ) ( OBJ-AT ?auto_225957 ?auto_225962 ) ( OBJ-AT ?auto_225959 ?auto_225961 ) ( TRUCK-AT ?auto_225963 ?auto_225954 ) ( not ( = ?auto_225959 ?auto_225957 ) ) ( not ( = ?auto_225962 ?auto_225961 ) ) ( not ( = ?auto_225959 ?auto_225956 ) ) ( not ( = ?auto_225957 ?auto_225956 ) ) ( not ( = ?auto_225959 ?auto_225958 ) ) ( not ( = ?auto_225957 ?auto_225958 ) ) ( not ( = ?auto_225956 ?auto_225958 ) ) ( not ( = ?auto_225959 ?auto_225955 ) ) ( not ( = ?auto_225957 ?auto_225955 ) ) ( not ( = ?auto_225956 ?auto_225955 ) ) ( not ( = ?auto_225958 ?auto_225955 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_225959 ?auto_225957 ?auto_225956 ?auto_225955 ?auto_225958 ?auto_225954 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_226376 - OBJ
      ?auto_226377 - OBJ
      ?auto_226378 - OBJ
      ?auto_226379 - OBJ
      ?auto_226380 - OBJ
      ?auto_226375 - LOCATION
    )
    :vars
    (
      ?auto_226382 - LOCATION
      ?auto_226381 - CITY
      ?auto_226383 - LOCATION
      ?auto_226384 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_226382 ?auto_226381 ) ( IN-CITY ?auto_226375 ?auto_226381 ) ( not ( = ?auto_226375 ?auto_226382 ) ) ( OBJ-AT ?auto_226376 ?auto_226382 ) ( IN-CITY ?auto_226383 ?auto_226381 ) ( not ( = ?auto_226375 ?auto_226383 ) ) ( OBJ-AT ?auto_226378 ?auto_226383 ) ( OBJ-AT ?auto_226377 ?auto_226382 ) ( OBJ-AT ?auto_226380 ?auto_226383 ) ( OBJ-AT ?auto_226379 ?auto_226382 ) ( TRUCK-AT ?auto_226384 ?auto_226375 ) ( not ( = ?auto_226379 ?auto_226380 ) ) ( not ( = ?auto_226383 ?auto_226382 ) ) ( not ( = ?auto_226379 ?auto_226377 ) ) ( not ( = ?auto_226380 ?auto_226377 ) ) ( not ( = ?auto_226379 ?auto_226378 ) ) ( not ( = ?auto_226380 ?auto_226378 ) ) ( not ( = ?auto_226377 ?auto_226378 ) ) ( not ( = ?auto_226379 ?auto_226376 ) ) ( not ( = ?auto_226380 ?auto_226376 ) ) ( not ( = ?auto_226377 ?auto_226376 ) ) ( not ( = ?auto_226378 ?auto_226376 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_226379 ?auto_226380 ?auto_226377 ?auto_226376 ?auto_226378 ?auto_226375 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_226419 - OBJ
      ?auto_226420 - OBJ
      ?auto_226421 - OBJ
      ?auto_226422 - OBJ
      ?auto_226423 - OBJ
      ?auto_226418 - LOCATION
    )
    :vars
    (
      ?auto_226425 - LOCATION
      ?auto_226424 - CITY
      ?auto_226426 - LOCATION
      ?auto_226427 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_226425 ?auto_226424 ) ( IN-CITY ?auto_226418 ?auto_226424 ) ( not ( = ?auto_226418 ?auto_226425 ) ) ( OBJ-AT ?auto_226419 ?auto_226425 ) ( IN-CITY ?auto_226426 ?auto_226424 ) ( not ( = ?auto_226418 ?auto_226426 ) ) ( OBJ-AT ?auto_226421 ?auto_226426 ) ( OBJ-AT ?auto_226420 ?auto_226425 ) ( OBJ-AT ?auto_226422 ?auto_226426 ) ( OBJ-AT ?auto_226423 ?auto_226425 ) ( TRUCK-AT ?auto_226427 ?auto_226418 ) ( not ( = ?auto_226423 ?auto_226422 ) ) ( not ( = ?auto_226426 ?auto_226425 ) ) ( not ( = ?auto_226423 ?auto_226420 ) ) ( not ( = ?auto_226422 ?auto_226420 ) ) ( not ( = ?auto_226423 ?auto_226421 ) ) ( not ( = ?auto_226422 ?auto_226421 ) ) ( not ( = ?auto_226420 ?auto_226421 ) ) ( not ( = ?auto_226423 ?auto_226419 ) ) ( not ( = ?auto_226422 ?auto_226419 ) ) ( not ( = ?auto_226420 ?auto_226419 ) ) ( not ( = ?auto_226421 ?auto_226419 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_226423 ?auto_226422 ?auto_226420 ?auto_226419 ?auto_226421 ?auto_226418 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227025 - OBJ
      ?auto_227026 - OBJ
      ?auto_227027 - OBJ
      ?auto_227028 - OBJ
      ?auto_227029 - OBJ
      ?auto_227024 - LOCATION
    )
    :vars
    (
      ?auto_227031 - LOCATION
      ?auto_227030 - CITY
      ?auto_227032 - LOCATION
      ?auto_227033 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_227031 ?auto_227030 ) ( IN-CITY ?auto_227024 ?auto_227030 ) ( not ( = ?auto_227024 ?auto_227031 ) ) ( OBJ-AT ?auto_227025 ?auto_227031 ) ( IN-CITY ?auto_227032 ?auto_227030 ) ( not ( = ?auto_227024 ?auto_227032 ) ) ( OBJ-AT ?auto_227026 ?auto_227032 ) ( OBJ-AT ?auto_227029 ?auto_227031 ) ( OBJ-AT ?auto_227028 ?auto_227032 ) ( OBJ-AT ?auto_227027 ?auto_227031 ) ( TRUCK-AT ?auto_227033 ?auto_227024 ) ( not ( = ?auto_227027 ?auto_227028 ) ) ( not ( = ?auto_227032 ?auto_227031 ) ) ( not ( = ?auto_227027 ?auto_227029 ) ) ( not ( = ?auto_227028 ?auto_227029 ) ) ( not ( = ?auto_227027 ?auto_227026 ) ) ( not ( = ?auto_227028 ?auto_227026 ) ) ( not ( = ?auto_227029 ?auto_227026 ) ) ( not ( = ?auto_227027 ?auto_227025 ) ) ( not ( = ?auto_227028 ?auto_227025 ) ) ( not ( = ?auto_227029 ?auto_227025 ) ) ( not ( = ?auto_227026 ?auto_227025 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_227027 ?auto_227028 ?auto_227029 ?auto_227025 ?auto_227026 ?auto_227024 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227068 - OBJ
      ?auto_227069 - OBJ
      ?auto_227070 - OBJ
      ?auto_227071 - OBJ
      ?auto_227072 - OBJ
      ?auto_227067 - LOCATION
    )
    :vars
    (
      ?auto_227074 - LOCATION
      ?auto_227073 - CITY
      ?auto_227075 - LOCATION
      ?auto_227076 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_227074 ?auto_227073 ) ( IN-CITY ?auto_227067 ?auto_227073 ) ( not ( = ?auto_227067 ?auto_227074 ) ) ( OBJ-AT ?auto_227068 ?auto_227074 ) ( IN-CITY ?auto_227075 ?auto_227073 ) ( not ( = ?auto_227067 ?auto_227075 ) ) ( OBJ-AT ?auto_227069 ?auto_227075 ) ( OBJ-AT ?auto_227071 ?auto_227074 ) ( OBJ-AT ?auto_227072 ?auto_227075 ) ( OBJ-AT ?auto_227070 ?auto_227074 ) ( TRUCK-AT ?auto_227076 ?auto_227067 ) ( not ( = ?auto_227070 ?auto_227072 ) ) ( not ( = ?auto_227075 ?auto_227074 ) ) ( not ( = ?auto_227070 ?auto_227071 ) ) ( not ( = ?auto_227072 ?auto_227071 ) ) ( not ( = ?auto_227070 ?auto_227069 ) ) ( not ( = ?auto_227072 ?auto_227069 ) ) ( not ( = ?auto_227071 ?auto_227069 ) ) ( not ( = ?auto_227070 ?auto_227068 ) ) ( not ( = ?auto_227072 ?auto_227068 ) ) ( not ( = ?auto_227071 ?auto_227068 ) ) ( not ( = ?auto_227069 ?auto_227068 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_227070 ?auto_227072 ?auto_227071 ?auto_227068 ?auto_227069 ?auto_227067 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227249 - OBJ
      ?auto_227250 - OBJ
      ?auto_227251 - OBJ
      ?auto_227252 - OBJ
      ?auto_227253 - OBJ
      ?auto_227248 - LOCATION
    )
    :vars
    (
      ?auto_227255 - LOCATION
      ?auto_227254 - CITY
      ?auto_227256 - LOCATION
      ?auto_227257 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_227255 ?auto_227254 ) ( IN-CITY ?auto_227248 ?auto_227254 ) ( not ( = ?auto_227248 ?auto_227255 ) ) ( OBJ-AT ?auto_227249 ?auto_227255 ) ( IN-CITY ?auto_227256 ?auto_227254 ) ( not ( = ?auto_227248 ?auto_227256 ) ) ( OBJ-AT ?auto_227250 ?auto_227256 ) ( OBJ-AT ?auto_227253 ?auto_227255 ) ( OBJ-AT ?auto_227251 ?auto_227256 ) ( OBJ-AT ?auto_227252 ?auto_227255 ) ( TRUCK-AT ?auto_227257 ?auto_227248 ) ( not ( = ?auto_227252 ?auto_227251 ) ) ( not ( = ?auto_227256 ?auto_227255 ) ) ( not ( = ?auto_227252 ?auto_227253 ) ) ( not ( = ?auto_227251 ?auto_227253 ) ) ( not ( = ?auto_227252 ?auto_227250 ) ) ( not ( = ?auto_227251 ?auto_227250 ) ) ( not ( = ?auto_227253 ?auto_227250 ) ) ( not ( = ?auto_227252 ?auto_227249 ) ) ( not ( = ?auto_227251 ?auto_227249 ) ) ( not ( = ?auto_227253 ?auto_227249 ) ) ( not ( = ?auto_227250 ?auto_227249 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_227252 ?auto_227251 ?auto_227253 ?auto_227249 ?auto_227250 ?auto_227248 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227339 - OBJ
      ?auto_227340 - OBJ
      ?auto_227341 - OBJ
      ?auto_227342 - OBJ
      ?auto_227343 - OBJ
      ?auto_227338 - LOCATION
    )
    :vars
    (
      ?auto_227345 - LOCATION
      ?auto_227344 - CITY
      ?auto_227346 - LOCATION
      ?auto_227347 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_227345 ?auto_227344 ) ( IN-CITY ?auto_227338 ?auto_227344 ) ( not ( = ?auto_227338 ?auto_227345 ) ) ( OBJ-AT ?auto_227339 ?auto_227345 ) ( IN-CITY ?auto_227346 ?auto_227344 ) ( not ( = ?auto_227338 ?auto_227346 ) ) ( OBJ-AT ?auto_227340 ?auto_227346 ) ( OBJ-AT ?auto_227342 ?auto_227345 ) ( OBJ-AT ?auto_227341 ?auto_227346 ) ( OBJ-AT ?auto_227343 ?auto_227345 ) ( TRUCK-AT ?auto_227347 ?auto_227338 ) ( not ( = ?auto_227343 ?auto_227341 ) ) ( not ( = ?auto_227346 ?auto_227345 ) ) ( not ( = ?auto_227343 ?auto_227342 ) ) ( not ( = ?auto_227341 ?auto_227342 ) ) ( not ( = ?auto_227343 ?auto_227340 ) ) ( not ( = ?auto_227341 ?auto_227340 ) ) ( not ( = ?auto_227342 ?auto_227340 ) ) ( not ( = ?auto_227343 ?auto_227339 ) ) ( not ( = ?auto_227341 ?auto_227339 ) ) ( not ( = ?auto_227342 ?auto_227339 ) ) ( not ( = ?auto_227340 ?auto_227339 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_227343 ?auto_227341 ?auto_227342 ?auto_227339 ?auto_227340 ?auto_227338 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227520 - OBJ
      ?auto_227521 - OBJ
      ?auto_227522 - OBJ
      ?auto_227523 - OBJ
      ?auto_227524 - OBJ
      ?auto_227519 - LOCATION
    )
    :vars
    (
      ?auto_227526 - LOCATION
      ?auto_227525 - CITY
      ?auto_227527 - LOCATION
      ?auto_227528 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_227526 ?auto_227525 ) ( IN-CITY ?auto_227519 ?auto_227525 ) ( not ( = ?auto_227519 ?auto_227526 ) ) ( OBJ-AT ?auto_227520 ?auto_227526 ) ( IN-CITY ?auto_227527 ?auto_227525 ) ( not ( = ?auto_227519 ?auto_227527 ) ) ( OBJ-AT ?auto_227521 ?auto_227527 ) ( OBJ-AT ?auto_227522 ?auto_227526 ) ( OBJ-AT ?auto_227524 ?auto_227527 ) ( OBJ-AT ?auto_227523 ?auto_227526 ) ( TRUCK-AT ?auto_227528 ?auto_227519 ) ( not ( = ?auto_227523 ?auto_227524 ) ) ( not ( = ?auto_227527 ?auto_227526 ) ) ( not ( = ?auto_227523 ?auto_227522 ) ) ( not ( = ?auto_227524 ?auto_227522 ) ) ( not ( = ?auto_227523 ?auto_227521 ) ) ( not ( = ?auto_227524 ?auto_227521 ) ) ( not ( = ?auto_227522 ?auto_227521 ) ) ( not ( = ?auto_227523 ?auto_227520 ) ) ( not ( = ?auto_227524 ?auto_227520 ) ) ( not ( = ?auto_227522 ?auto_227520 ) ) ( not ( = ?auto_227521 ?auto_227520 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_227523 ?auto_227524 ?auto_227522 ?auto_227520 ?auto_227521 ?auto_227519 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227563 - OBJ
      ?auto_227564 - OBJ
      ?auto_227565 - OBJ
      ?auto_227566 - OBJ
      ?auto_227567 - OBJ
      ?auto_227562 - LOCATION
    )
    :vars
    (
      ?auto_227569 - LOCATION
      ?auto_227568 - CITY
      ?auto_227570 - LOCATION
      ?auto_227571 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_227569 ?auto_227568 ) ( IN-CITY ?auto_227562 ?auto_227568 ) ( not ( = ?auto_227562 ?auto_227569 ) ) ( OBJ-AT ?auto_227563 ?auto_227569 ) ( IN-CITY ?auto_227570 ?auto_227568 ) ( not ( = ?auto_227562 ?auto_227570 ) ) ( OBJ-AT ?auto_227564 ?auto_227570 ) ( OBJ-AT ?auto_227565 ?auto_227569 ) ( OBJ-AT ?auto_227566 ?auto_227570 ) ( OBJ-AT ?auto_227567 ?auto_227569 ) ( TRUCK-AT ?auto_227571 ?auto_227562 ) ( not ( = ?auto_227567 ?auto_227566 ) ) ( not ( = ?auto_227570 ?auto_227569 ) ) ( not ( = ?auto_227567 ?auto_227565 ) ) ( not ( = ?auto_227566 ?auto_227565 ) ) ( not ( = ?auto_227567 ?auto_227564 ) ) ( not ( = ?auto_227566 ?auto_227564 ) ) ( not ( = ?auto_227565 ?auto_227564 ) ) ( not ( = ?auto_227567 ?auto_227563 ) ) ( not ( = ?auto_227566 ?auto_227563 ) ) ( not ( = ?auto_227565 ?auto_227563 ) ) ( not ( = ?auto_227564 ?auto_227563 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_227567 ?auto_227566 ?auto_227565 ?auto_227563 ?auto_227564 ?auto_227562 ) )
  )

)

