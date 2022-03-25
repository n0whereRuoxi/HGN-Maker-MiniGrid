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
      ?auto_191193 - OBJ
      ?auto_191192 - LOCATION
    )
    :vars
    (
      ?auto_191195 - LOCATION
      ?auto_191196 - CITY
      ?auto_191194 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191195 ?auto_191196 ) ( IN-CITY ?auto_191192 ?auto_191196 ) ( not ( = ?auto_191192 ?auto_191195 ) ) ( OBJ-AT ?auto_191193 ?auto_191195 ) ( TRUCK-AT ?auto_191194 ?auto_191192 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_191194 ?auto_191192 ?auto_191195 ?auto_191196 )
      ( !LOAD-TRUCK ?auto_191193 ?auto_191194 ?auto_191195 )
      ( !DRIVE-TRUCK ?auto_191194 ?auto_191195 ?auto_191192 ?auto_191196 )
      ( !UNLOAD-TRUCK ?auto_191193 ?auto_191194 ?auto_191192 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_191200 - OBJ
      ?auto_191199 - LOCATION
    )
    :vars
    (
      ?auto_191202 - LOCATION
      ?auto_191203 - CITY
      ?auto_191201 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191202 ?auto_191203 ) ( IN-CITY ?auto_191199 ?auto_191203 ) ( not ( = ?auto_191199 ?auto_191202 ) ) ( OBJ-AT ?auto_191200 ?auto_191202 ) ( TRUCK-AT ?auto_191201 ?auto_191199 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_191201 ?auto_191199 ?auto_191202 ?auto_191203 )
      ( !LOAD-TRUCK ?auto_191200 ?auto_191201 ?auto_191202 )
      ( !DRIVE-TRUCK ?auto_191201 ?auto_191202 ?auto_191199 ?auto_191203 )
      ( !UNLOAD-TRUCK ?auto_191200 ?auto_191201 ?auto_191199 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_191214 - OBJ
      ?auto_191215 - OBJ
      ?auto_191213 - LOCATION
    )
    :vars
    (
      ?auto_191216 - LOCATION
      ?auto_191217 - CITY
      ?auto_191219 - LOCATION
      ?auto_191218 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191216 ?auto_191217 ) ( IN-CITY ?auto_191213 ?auto_191217 ) ( not ( = ?auto_191213 ?auto_191216 ) ) ( OBJ-AT ?auto_191215 ?auto_191216 ) ( IN-CITY ?auto_191219 ?auto_191217 ) ( not ( = ?auto_191213 ?auto_191219 ) ) ( OBJ-AT ?auto_191214 ?auto_191219 ) ( TRUCK-AT ?auto_191218 ?auto_191213 ) ( not ( = ?auto_191214 ?auto_191215 ) ) ( not ( = ?auto_191216 ?auto_191219 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_191214 ?auto_191213 )
      ( DELIVER-1PKG ?auto_191215 ?auto_191213 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_191221 - OBJ
      ?auto_191222 - OBJ
      ?auto_191220 - LOCATION
    )
    :vars
    (
      ?auto_191226 - LOCATION
      ?auto_191224 - CITY
      ?auto_191225 - LOCATION
      ?auto_191223 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191226 ?auto_191224 ) ( IN-CITY ?auto_191220 ?auto_191224 ) ( not ( = ?auto_191220 ?auto_191226 ) ) ( OBJ-AT ?auto_191221 ?auto_191226 ) ( IN-CITY ?auto_191225 ?auto_191224 ) ( not ( = ?auto_191220 ?auto_191225 ) ) ( OBJ-AT ?auto_191222 ?auto_191225 ) ( TRUCK-AT ?auto_191223 ?auto_191220 ) ( not ( = ?auto_191222 ?auto_191221 ) ) ( not ( = ?auto_191226 ?auto_191225 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191222 ?auto_191221 ?auto_191220 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_191238 - OBJ
      ?auto_191237 - LOCATION
    )
    :vars
    (
      ?auto_191240 - LOCATION
      ?auto_191241 - CITY
      ?auto_191239 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191240 ?auto_191241 ) ( IN-CITY ?auto_191237 ?auto_191241 ) ( not ( = ?auto_191237 ?auto_191240 ) ) ( OBJ-AT ?auto_191238 ?auto_191240 ) ( TRUCK-AT ?auto_191239 ?auto_191237 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_191239 ?auto_191237 ?auto_191240 ?auto_191241 )
      ( !LOAD-TRUCK ?auto_191238 ?auto_191239 ?auto_191240 )
      ( !DRIVE-TRUCK ?auto_191239 ?auto_191240 ?auto_191237 ?auto_191241 )
      ( !UNLOAD-TRUCK ?auto_191238 ?auto_191239 ?auto_191237 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_191329 - OBJ
      ?auto_191330 - OBJ
      ?auto_191331 - OBJ
      ?auto_191328 - LOCATION
    )
    :vars
    (
      ?auto_191333 - LOCATION
      ?auto_191332 - CITY
      ?auto_191336 - LOCATION
      ?auto_191335 - LOCATION
      ?auto_191334 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191333 ?auto_191332 ) ( IN-CITY ?auto_191328 ?auto_191332 ) ( not ( = ?auto_191328 ?auto_191333 ) ) ( OBJ-AT ?auto_191331 ?auto_191333 ) ( IN-CITY ?auto_191336 ?auto_191332 ) ( not ( = ?auto_191328 ?auto_191336 ) ) ( OBJ-AT ?auto_191330 ?auto_191336 ) ( IN-CITY ?auto_191335 ?auto_191332 ) ( not ( = ?auto_191328 ?auto_191335 ) ) ( OBJ-AT ?auto_191329 ?auto_191335 ) ( TRUCK-AT ?auto_191334 ?auto_191328 ) ( not ( = ?auto_191329 ?auto_191330 ) ) ( not ( = ?auto_191336 ?auto_191335 ) ) ( not ( = ?auto_191329 ?auto_191331 ) ) ( not ( = ?auto_191330 ?auto_191331 ) ) ( not ( = ?auto_191333 ?auto_191336 ) ) ( not ( = ?auto_191333 ?auto_191335 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_191330 ?auto_191329 ?auto_191328 )
      ( DELIVER-1PKG ?auto_191331 ?auto_191328 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_191348 - OBJ
      ?auto_191349 - OBJ
      ?auto_191350 - OBJ
      ?auto_191347 - LOCATION
    )
    :vars
    (
      ?auto_191353 - LOCATION
      ?auto_191351 - CITY
      ?auto_191352 - LOCATION
      ?auto_191354 - LOCATION
      ?auto_191355 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191353 ?auto_191351 ) ( IN-CITY ?auto_191347 ?auto_191351 ) ( not ( = ?auto_191347 ?auto_191353 ) ) ( OBJ-AT ?auto_191349 ?auto_191353 ) ( IN-CITY ?auto_191352 ?auto_191351 ) ( not ( = ?auto_191347 ?auto_191352 ) ) ( OBJ-AT ?auto_191350 ?auto_191352 ) ( IN-CITY ?auto_191354 ?auto_191351 ) ( not ( = ?auto_191347 ?auto_191354 ) ) ( OBJ-AT ?auto_191348 ?auto_191354 ) ( TRUCK-AT ?auto_191355 ?auto_191347 ) ( not ( = ?auto_191348 ?auto_191350 ) ) ( not ( = ?auto_191352 ?auto_191354 ) ) ( not ( = ?auto_191348 ?auto_191349 ) ) ( not ( = ?auto_191350 ?auto_191349 ) ) ( not ( = ?auto_191353 ?auto_191352 ) ) ( not ( = ?auto_191353 ?auto_191354 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_191348 ?auto_191350 ?auto_191349 ?auto_191347 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_191367 - OBJ
      ?auto_191368 - OBJ
      ?auto_191369 - OBJ
      ?auto_191366 - LOCATION
    )
    :vars
    (
      ?auto_191370 - LOCATION
      ?auto_191373 - CITY
      ?auto_191374 - LOCATION
      ?auto_191372 - LOCATION
      ?auto_191371 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191370 ?auto_191373 ) ( IN-CITY ?auto_191366 ?auto_191373 ) ( not ( = ?auto_191366 ?auto_191370 ) ) ( OBJ-AT ?auto_191369 ?auto_191370 ) ( IN-CITY ?auto_191374 ?auto_191373 ) ( not ( = ?auto_191366 ?auto_191374 ) ) ( OBJ-AT ?auto_191367 ?auto_191374 ) ( IN-CITY ?auto_191372 ?auto_191373 ) ( not ( = ?auto_191366 ?auto_191372 ) ) ( OBJ-AT ?auto_191368 ?auto_191372 ) ( TRUCK-AT ?auto_191371 ?auto_191366 ) ( not ( = ?auto_191368 ?auto_191367 ) ) ( not ( = ?auto_191374 ?auto_191372 ) ) ( not ( = ?auto_191368 ?auto_191369 ) ) ( not ( = ?auto_191367 ?auto_191369 ) ) ( not ( = ?auto_191370 ?auto_191374 ) ) ( not ( = ?auto_191370 ?auto_191372 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_191368 ?auto_191369 ?auto_191367 ?auto_191366 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_191386 - OBJ
      ?auto_191387 - OBJ
      ?auto_191388 - OBJ
      ?auto_191385 - LOCATION
    )
    :vars
    (
      ?auto_191389 - LOCATION
      ?auto_191392 - CITY
      ?auto_191393 - LOCATION
      ?auto_191391 - LOCATION
      ?auto_191390 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191389 ?auto_191392 ) ( IN-CITY ?auto_191385 ?auto_191392 ) ( not ( = ?auto_191385 ?auto_191389 ) ) ( OBJ-AT ?auto_191387 ?auto_191389 ) ( IN-CITY ?auto_191393 ?auto_191392 ) ( not ( = ?auto_191385 ?auto_191393 ) ) ( OBJ-AT ?auto_191386 ?auto_191393 ) ( IN-CITY ?auto_191391 ?auto_191392 ) ( not ( = ?auto_191385 ?auto_191391 ) ) ( OBJ-AT ?auto_191388 ?auto_191391 ) ( TRUCK-AT ?auto_191390 ?auto_191385 ) ( not ( = ?auto_191388 ?auto_191386 ) ) ( not ( = ?auto_191393 ?auto_191391 ) ) ( not ( = ?auto_191388 ?auto_191387 ) ) ( not ( = ?auto_191386 ?auto_191387 ) ) ( not ( = ?auto_191389 ?auto_191393 ) ) ( not ( = ?auto_191389 ?auto_191391 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_191388 ?auto_191387 ?auto_191386 ?auto_191385 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_191425 - OBJ
      ?auto_191426 - OBJ
      ?auto_191427 - OBJ
      ?auto_191424 - LOCATION
    )
    :vars
    (
      ?auto_191428 - LOCATION
      ?auto_191431 - CITY
      ?auto_191432 - LOCATION
      ?auto_191430 - LOCATION
      ?auto_191429 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191428 ?auto_191431 ) ( IN-CITY ?auto_191424 ?auto_191431 ) ( not ( = ?auto_191424 ?auto_191428 ) ) ( OBJ-AT ?auto_191425 ?auto_191428 ) ( IN-CITY ?auto_191432 ?auto_191431 ) ( not ( = ?auto_191424 ?auto_191432 ) ) ( OBJ-AT ?auto_191427 ?auto_191432 ) ( IN-CITY ?auto_191430 ?auto_191431 ) ( not ( = ?auto_191424 ?auto_191430 ) ) ( OBJ-AT ?auto_191426 ?auto_191430 ) ( TRUCK-AT ?auto_191429 ?auto_191424 ) ( not ( = ?auto_191426 ?auto_191427 ) ) ( not ( = ?auto_191432 ?auto_191430 ) ) ( not ( = ?auto_191426 ?auto_191425 ) ) ( not ( = ?auto_191427 ?auto_191425 ) ) ( not ( = ?auto_191428 ?auto_191432 ) ) ( not ( = ?auto_191428 ?auto_191430 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_191426 ?auto_191425 ?auto_191427 ?auto_191424 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_191444 - OBJ
      ?auto_191445 - OBJ
      ?auto_191446 - OBJ
      ?auto_191443 - LOCATION
    )
    :vars
    (
      ?auto_191447 - LOCATION
      ?auto_191450 - CITY
      ?auto_191451 - LOCATION
      ?auto_191449 - LOCATION
      ?auto_191448 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191447 ?auto_191450 ) ( IN-CITY ?auto_191443 ?auto_191450 ) ( not ( = ?auto_191443 ?auto_191447 ) ) ( OBJ-AT ?auto_191444 ?auto_191447 ) ( IN-CITY ?auto_191451 ?auto_191450 ) ( not ( = ?auto_191443 ?auto_191451 ) ) ( OBJ-AT ?auto_191445 ?auto_191451 ) ( IN-CITY ?auto_191449 ?auto_191450 ) ( not ( = ?auto_191443 ?auto_191449 ) ) ( OBJ-AT ?auto_191446 ?auto_191449 ) ( TRUCK-AT ?auto_191448 ?auto_191443 ) ( not ( = ?auto_191446 ?auto_191445 ) ) ( not ( = ?auto_191451 ?auto_191449 ) ) ( not ( = ?auto_191446 ?auto_191444 ) ) ( not ( = ?auto_191445 ?auto_191444 ) ) ( not ( = ?auto_191447 ?auto_191451 ) ) ( not ( = ?auto_191447 ?auto_191449 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_191446 ?auto_191444 ?auto_191445 ?auto_191443 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_191506 - OBJ
      ?auto_191505 - LOCATION
    )
    :vars
    (
      ?auto_191508 - LOCATION
      ?auto_191509 - CITY
      ?auto_191507 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_191508 ?auto_191509 ) ( IN-CITY ?auto_191505 ?auto_191509 ) ( not ( = ?auto_191505 ?auto_191508 ) ) ( OBJ-AT ?auto_191506 ?auto_191508 ) ( TRUCK-AT ?auto_191507 ?auto_191505 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_191507 ?auto_191505 ?auto_191508 ?auto_191509 )
      ( !LOAD-TRUCK ?auto_191506 ?auto_191507 ?auto_191508 )
      ( !DRIVE-TRUCK ?auto_191507 ?auto_191508 ?auto_191505 ?auto_191509 )
      ( !UNLOAD-TRUCK ?auto_191506 ?auto_191507 ?auto_191505 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192497 - OBJ
      ?auto_192498 - OBJ
      ?auto_192499 - OBJ
      ?auto_192500 - OBJ
      ?auto_192496 - LOCATION
    )
    :vars
    (
      ?auto_192501 - LOCATION
      ?auto_192503 - CITY
      ?auto_192504 - LOCATION
      ?auto_192506 - LOCATION
      ?auto_192505 - LOCATION
      ?auto_192502 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192501 ?auto_192503 ) ( IN-CITY ?auto_192496 ?auto_192503 ) ( not ( = ?auto_192496 ?auto_192501 ) ) ( OBJ-AT ?auto_192500 ?auto_192501 ) ( IN-CITY ?auto_192504 ?auto_192503 ) ( not ( = ?auto_192496 ?auto_192504 ) ) ( OBJ-AT ?auto_192499 ?auto_192504 ) ( IN-CITY ?auto_192506 ?auto_192503 ) ( not ( = ?auto_192496 ?auto_192506 ) ) ( OBJ-AT ?auto_192498 ?auto_192506 ) ( IN-CITY ?auto_192505 ?auto_192503 ) ( not ( = ?auto_192496 ?auto_192505 ) ) ( OBJ-AT ?auto_192497 ?auto_192505 ) ( TRUCK-AT ?auto_192502 ?auto_192496 ) ( not ( = ?auto_192497 ?auto_192498 ) ) ( not ( = ?auto_192506 ?auto_192505 ) ) ( not ( = ?auto_192497 ?auto_192499 ) ) ( not ( = ?auto_192498 ?auto_192499 ) ) ( not ( = ?auto_192504 ?auto_192506 ) ) ( not ( = ?auto_192504 ?auto_192505 ) ) ( not ( = ?auto_192497 ?auto_192500 ) ) ( not ( = ?auto_192498 ?auto_192500 ) ) ( not ( = ?auto_192499 ?auto_192500 ) ) ( not ( = ?auto_192501 ?auto_192504 ) ) ( not ( = ?auto_192501 ?auto_192506 ) ) ( not ( = ?auto_192501 ?auto_192505 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_192497 ?auto_192499 ?auto_192498 ?auto_192496 )
      ( DELIVER-1PKG ?auto_192500 ?auto_192496 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192532 - OBJ
      ?auto_192533 - OBJ
      ?auto_192534 - OBJ
      ?auto_192535 - OBJ
      ?auto_192531 - LOCATION
    )
    :vars
    (
      ?auto_192541 - LOCATION
      ?auto_192536 - CITY
      ?auto_192537 - LOCATION
      ?auto_192540 - LOCATION
      ?auto_192538 - LOCATION
      ?auto_192539 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192541 ?auto_192536 ) ( IN-CITY ?auto_192531 ?auto_192536 ) ( not ( = ?auto_192531 ?auto_192541 ) ) ( OBJ-AT ?auto_192534 ?auto_192541 ) ( IN-CITY ?auto_192537 ?auto_192536 ) ( not ( = ?auto_192531 ?auto_192537 ) ) ( OBJ-AT ?auto_192535 ?auto_192537 ) ( IN-CITY ?auto_192540 ?auto_192536 ) ( not ( = ?auto_192531 ?auto_192540 ) ) ( OBJ-AT ?auto_192533 ?auto_192540 ) ( IN-CITY ?auto_192538 ?auto_192536 ) ( not ( = ?auto_192531 ?auto_192538 ) ) ( OBJ-AT ?auto_192532 ?auto_192538 ) ( TRUCK-AT ?auto_192539 ?auto_192531 ) ( not ( = ?auto_192532 ?auto_192533 ) ) ( not ( = ?auto_192540 ?auto_192538 ) ) ( not ( = ?auto_192532 ?auto_192535 ) ) ( not ( = ?auto_192533 ?auto_192535 ) ) ( not ( = ?auto_192537 ?auto_192540 ) ) ( not ( = ?auto_192537 ?auto_192538 ) ) ( not ( = ?auto_192532 ?auto_192534 ) ) ( not ( = ?auto_192533 ?auto_192534 ) ) ( not ( = ?auto_192535 ?auto_192534 ) ) ( not ( = ?auto_192541 ?auto_192537 ) ) ( not ( = ?auto_192541 ?auto_192540 ) ) ( not ( = ?auto_192541 ?auto_192538 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192532 ?auto_192533 ?auto_192535 ?auto_192534 ?auto_192531 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192567 - OBJ
      ?auto_192568 - OBJ
      ?auto_192569 - OBJ
      ?auto_192570 - OBJ
      ?auto_192566 - LOCATION
    )
    :vars
    (
      ?auto_192572 - LOCATION
      ?auto_192575 - CITY
      ?auto_192576 - LOCATION
      ?auto_192574 - LOCATION
      ?auto_192573 - LOCATION
      ?auto_192571 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192572 ?auto_192575 ) ( IN-CITY ?auto_192566 ?auto_192575 ) ( not ( = ?auto_192566 ?auto_192572 ) ) ( OBJ-AT ?auto_192570 ?auto_192572 ) ( IN-CITY ?auto_192576 ?auto_192575 ) ( not ( = ?auto_192566 ?auto_192576 ) ) ( OBJ-AT ?auto_192568 ?auto_192576 ) ( IN-CITY ?auto_192574 ?auto_192575 ) ( not ( = ?auto_192566 ?auto_192574 ) ) ( OBJ-AT ?auto_192569 ?auto_192574 ) ( IN-CITY ?auto_192573 ?auto_192575 ) ( not ( = ?auto_192566 ?auto_192573 ) ) ( OBJ-AT ?auto_192567 ?auto_192573 ) ( TRUCK-AT ?auto_192571 ?auto_192566 ) ( not ( = ?auto_192567 ?auto_192569 ) ) ( not ( = ?auto_192574 ?auto_192573 ) ) ( not ( = ?auto_192567 ?auto_192568 ) ) ( not ( = ?auto_192569 ?auto_192568 ) ) ( not ( = ?auto_192576 ?auto_192574 ) ) ( not ( = ?auto_192576 ?auto_192573 ) ) ( not ( = ?auto_192567 ?auto_192570 ) ) ( not ( = ?auto_192569 ?auto_192570 ) ) ( not ( = ?auto_192568 ?auto_192570 ) ) ( not ( = ?auto_192572 ?auto_192576 ) ) ( not ( = ?auto_192572 ?auto_192574 ) ) ( not ( = ?auto_192572 ?auto_192573 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192567 ?auto_192569 ?auto_192570 ?auto_192568 ?auto_192566 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192602 - OBJ
      ?auto_192603 - OBJ
      ?auto_192604 - OBJ
      ?auto_192605 - OBJ
      ?auto_192601 - LOCATION
    )
    :vars
    (
      ?auto_192607 - LOCATION
      ?auto_192610 - CITY
      ?auto_192611 - LOCATION
      ?auto_192609 - LOCATION
      ?auto_192608 - LOCATION
      ?auto_192606 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192607 ?auto_192610 ) ( IN-CITY ?auto_192601 ?auto_192610 ) ( not ( = ?auto_192601 ?auto_192607 ) ) ( OBJ-AT ?auto_192604 ?auto_192607 ) ( IN-CITY ?auto_192611 ?auto_192610 ) ( not ( = ?auto_192601 ?auto_192611 ) ) ( OBJ-AT ?auto_192603 ?auto_192611 ) ( IN-CITY ?auto_192609 ?auto_192610 ) ( not ( = ?auto_192601 ?auto_192609 ) ) ( OBJ-AT ?auto_192605 ?auto_192609 ) ( IN-CITY ?auto_192608 ?auto_192610 ) ( not ( = ?auto_192601 ?auto_192608 ) ) ( OBJ-AT ?auto_192602 ?auto_192608 ) ( TRUCK-AT ?auto_192606 ?auto_192601 ) ( not ( = ?auto_192602 ?auto_192605 ) ) ( not ( = ?auto_192609 ?auto_192608 ) ) ( not ( = ?auto_192602 ?auto_192603 ) ) ( not ( = ?auto_192605 ?auto_192603 ) ) ( not ( = ?auto_192611 ?auto_192609 ) ) ( not ( = ?auto_192611 ?auto_192608 ) ) ( not ( = ?auto_192602 ?auto_192604 ) ) ( not ( = ?auto_192605 ?auto_192604 ) ) ( not ( = ?auto_192603 ?auto_192604 ) ) ( not ( = ?auto_192607 ?auto_192611 ) ) ( not ( = ?auto_192607 ?auto_192609 ) ) ( not ( = ?auto_192607 ?auto_192608 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192602 ?auto_192605 ?auto_192604 ?auto_192603 ?auto_192601 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192711 - OBJ
      ?auto_192712 - OBJ
      ?auto_192713 - OBJ
      ?auto_192714 - OBJ
      ?auto_192710 - LOCATION
    )
    :vars
    (
      ?auto_192716 - LOCATION
      ?auto_192719 - CITY
      ?auto_192720 - LOCATION
      ?auto_192718 - LOCATION
      ?auto_192717 - LOCATION
      ?auto_192715 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192716 ?auto_192719 ) ( IN-CITY ?auto_192710 ?auto_192719 ) ( not ( = ?auto_192710 ?auto_192716 ) ) ( OBJ-AT ?auto_192712 ?auto_192716 ) ( IN-CITY ?auto_192720 ?auto_192719 ) ( not ( = ?auto_192710 ?auto_192720 ) ) ( OBJ-AT ?auto_192714 ?auto_192720 ) ( IN-CITY ?auto_192718 ?auto_192719 ) ( not ( = ?auto_192710 ?auto_192718 ) ) ( OBJ-AT ?auto_192713 ?auto_192718 ) ( IN-CITY ?auto_192717 ?auto_192719 ) ( not ( = ?auto_192710 ?auto_192717 ) ) ( OBJ-AT ?auto_192711 ?auto_192717 ) ( TRUCK-AT ?auto_192715 ?auto_192710 ) ( not ( = ?auto_192711 ?auto_192713 ) ) ( not ( = ?auto_192718 ?auto_192717 ) ) ( not ( = ?auto_192711 ?auto_192714 ) ) ( not ( = ?auto_192713 ?auto_192714 ) ) ( not ( = ?auto_192720 ?auto_192718 ) ) ( not ( = ?auto_192720 ?auto_192717 ) ) ( not ( = ?auto_192711 ?auto_192712 ) ) ( not ( = ?auto_192713 ?auto_192712 ) ) ( not ( = ?auto_192714 ?auto_192712 ) ) ( not ( = ?auto_192716 ?auto_192720 ) ) ( not ( = ?auto_192716 ?auto_192718 ) ) ( not ( = ?auto_192716 ?auto_192717 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192711 ?auto_192713 ?auto_192712 ?auto_192714 ?auto_192710 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192746 - OBJ
      ?auto_192747 - OBJ
      ?auto_192748 - OBJ
      ?auto_192749 - OBJ
      ?auto_192745 - LOCATION
    )
    :vars
    (
      ?auto_192751 - LOCATION
      ?auto_192754 - CITY
      ?auto_192755 - LOCATION
      ?auto_192753 - LOCATION
      ?auto_192752 - LOCATION
      ?auto_192750 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192751 ?auto_192754 ) ( IN-CITY ?auto_192745 ?auto_192754 ) ( not ( = ?auto_192745 ?auto_192751 ) ) ( OBJ-AT ?auto_192747 ?auto_192751 ) ( IN-CITY ?auto_192755 ?auto_192754 ) ( not ( = ?auto_192745 ?auto_192755 ) ) ( OBJ-AT ?auto_192748 ?auto_192755 ) ( IN-CITY ?auto_192753 ?auto_192754 ) ( not ( = ?auto_192745 ?auto_192753 ) ) ( OBJ-AT ?auto_192749 ?auto_192753 ) ( IN-CITY ?auto_192752 ?auto_192754 ) ( not ( = ?auto_192745 ?auto_192752 ) ) ( OBJ-AT ?auto_192746 ?auto_192752 ) ( TRUCK-AT ?auto_192750 ?auto_192745 ) ( not ( = ?auto_192746 ?auto_192749 ) ) ( not ( = ?auto_192753 ?auto_192752 ) ) ( not ( = ?auto_192746 ?auto_192748 ) ) ( not ( = ?auto_192749 ?auto_192748 ) ) ( not ( = ?auto_192755 ?auto_192753 ) ) ( not ( = ?auto_192755 ?auto_192752 ) ) ( not ( = ?auto_192746 ?auto_192747 ) ) ( not ( = ?auto_192749 ?auto_192747 ) ) ( not ( = ?auto_192748 ?auto_192747 ) ) ( not ( = ?auto_192751 ?auto_192755 ) ) ( not ( = ?auto_192751 ?auto_192753 ) ) ( not ( = ?auto_192751 ?auto_192752 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192746 ?auto_192749 ?auto_192747 ?auto_192748 ?auto_192745 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192855 - OBJ
      ?auto_192856 - OBJ
      ?auto_192857 - OBJ
      ?auto_192858 - OBJ
      ?auto_192854 - LOCATION
    )
    :vars
    (
      ?auto_192860 - LOCATION
      ?auto_192863 - CITY
      ?auto_192864 - LOCATION
      ?auto_192862 - LOCATION
      ?auto_192861 - LOCATION
      ?auto_192859 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192860 ?auto_192863 ) ( IN-CITY ?auto_192854 ?auto_192863 ) ( not ( = ?auto_192854 ?auto_192860 ) ) ( OBJ-AT ?auto_192858 ?auto_192860 ) ( IN-CITY ?auto_192864 ?auto_192863 ) ( not ( = ?auto_192854 ?auto_192864 ) ) ( OBJ-AT ?auto_192857 ?auto_192864 ) ( IN-CITY ?auto_192862 ?auto_192863 ) ( not ( = ?auto_192854 ?auto_192862 ) ) ( OBJ-AT ?auto_192855 ?auto_192862 ) ( IN-CITY ?auto_192861 ?auto_192863 ) ( not ( = ?auto_192854 ?auto_192861 ) ) ( OBJ-AT ?auto_192856 ?auto_192861 ) ( TRUCK-AT ?auto_192859 ?auto_192854 ) ( not ( = ?auto_192856 ?auto_192855 ) ) ( not ( = ?auto_192862 ?auto_192861 ) ) ( not ( = ?auto_192856 ?auto_192857 ) ) ( not ( = ?auto_192855 ?auto_192857 ) ) ( not ( = ?auto_192864 ?auto_192862 ) ) ( not ( = ?auto_192864 ?auto_192861 ) ) ( not ( = ?auto_192856 ?auto_192858 ) ) ( not ( = ?auto_192855 ?auto_192858 ) ) ( not ( = ?auto_192857 ?auto_192858 ) ) ( not ( = ?auto_192860 ?auto_192864 ) ) ( not ( = ?auto_192860 ?auto_192862 ) ) ( not ( = ?auto_192860 ?auto_192861 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192856 ?auto_192855 ?auto_192858 ?auto_192857 ?auto_192854 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_192890 - OBJ
      ?auto_192891 - OBJ
      ?auto_192892 - OBJ
      ?auto_192893 - OBJ
      ?auto_192889 - LOCATION
    )
    :vars
    (
      ?auto_192895 - LOCATION
      ?auto_192898 - CITY
      ?auto_192899 - LOCATION
      ?auto_192897 - LOCATION
      ?auto_192896 - LOCATION
      ?auto_192894 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_192895 ?auto_192898 ) ( IN-CITY ?auto_192889 ?auto_192898 ) ( not ( = ?auto_192889 ?auto_192895 ) ) ( OBJ-AT ?auto_192892 ?auto_192895 ) ( IN-CITY ?auto_192899 ?auto_192898 ) ( not ( = ?auto_192889 ?auto_192899 ) ) ( OBJ-AT ?auto_192893 ?auto_192899 ) ( IN-CITY ?auto_192897 ?auto_192898 ) ( not ( = ?auto_192889 ?auto_192897 ) ) ( OBJ-AT ?auto_192890 ?auto_192897 ) ( IN-CITY ?auto_192896 ?auto_192898 ) ( not ( = ?auto_192889 ?auto_192896 ) ) ( OBJ-AT ?auto_192891 ?auto_192896 ) ( TRUCK-AT ?auto_192894 ?auto_192889 ) ( not ( = ?auto_192891 ?auto_192890 ) ) ( not ( = ?auto_192897 ?auto_192896 ) ) ( not ( = ?auto_192891 ?auto_192893 ) ) ( not ( = ?auto_192890 ?auto_192893 ) ) ( not ( = ?auto_192899 ?auto_192897 ) ) ( not ( = ?auto_192899 ?auto_192896 ) ) ( not ( = ?auto_192891 ?auto_192892 ) ) ( not ( = ?auto_192890 ?auto_192892 ) ) ( not ( = ?auto_192893 ?auto_192892 ) ) ( not ( = ?auto_192895 ?auto_192899 ) ) ( not ( = ?auto_192895 ?auto_192897 ) ) ( not ( = ?auto_192895 ?auto_192896 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_192891 ?auto_192890 ?auto_192892 ?auto_192893 ?auto_192889 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193000 - OBJ
      ?auto_193001 - OBJ
      ?auto_193002 - OBJ
      ?auto_193003 - OBJ
      ?auto_192999 - LOCATION
    )
    :vars
    (
      ?auto_193005 - LOCATION
      ?auto_193008 - CITY
      ?auto_193009 - LOCATION
      ?auto_193007 - LOCATION
      ?auto_193006 - LOCATION
      ?auto_193004 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193005 ?auto_193008 ) ( IN-CITY ?auto_192999 ?auto_193008 ) ( not ( = ?auto_192999 ?auto_193005 ) ) ( OBJ-AT ?auto_193003 ?auto_193005 ) ( IN-CITY ?auto_193009 ?auto_193008 ) ( not ( = ?auto_192999 ?auto_193009 ) ) ( OBJ-AT ?auto_193001 ?auto_193009 ) ( IN-CITY ?auto_193007 ?auto_193008 ) ( not ( = ?auto_192999 ?auto_193007 ) ) ( OBJ-AT ?auto_193000 ?auto_193007 ) ( IN-CITY ?auto_193006 ?auto_193008 ) ( not ( = ?auto_192999 ?auto_193006 ) ) ( OBJ-AT ?auto_193002 ?auto_193006 ) ( TRUCK-AT ?auto_193004 ?auto_192999 ) ( not ( = ?auto_193002 ?auto_193000 ) ) ( not ( = ?auto_193007 ?auto_193006 ) ) ( not ( = ?auto_193002 ?auto_193001 ) ) ( not ( = ?auto_193000 ?auto_193001 ) ) ( not ( = ?auto_193009 ?auto_193007 ) ) ( not ( = ?auto_193009 ?auto_193006 ) ) ( not ( = ?auto_193002 ?auto_193003 ) ) ( not ( = ?auto_193000 ?auto_193003 ) ) ( not ( = ?auto_193001 ?auto_193003 ) ) ( not ( = ?auto_193005 ?auto_193009 ) ) ( not ( = ?auto_193005 ?auto_193007 ) ) ( not ( = ?auto_193005 ?auto_193006 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193002 ?auto_193000 ?auto_193003 ?auto_193001 ?auto_192999 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193035 - OBJ
      ?auto_193036 - OBJ
      ?auto_193037 - OBJ
      ?auto_193038 - OBJ
      ?auto_193034 - LOCATION
    )
    :vars
    (
      ?auto_193040 - LOCATION
      ?auto_193043 - CITY
      ?auto_193044 - LOCATION
      ?auto_193042 - LOCATION
      ?auto_193041 - LOCATION
      ?auto_193039 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193040 ?auto_193043 ) ( IN-CITY ?auto_193034 ?auto_193043 ) ( not ( = ?auto_193034 ?auto_193040 ) ) ( OBJ-AT ?auto_193037 ?auto_193040 ) ( IN-CITY ?auto_193044 ?auto_193043 ) ( not ( = ?auto_193034 ?auto_193044 ) ) ( OBJ-AT ?auto_193036 ?auto_193044 ) ( IN-CITY ?auto_193042 ?auto_193043 ) ( not ( = ?auto_193034 ?auto_193042 ) ) ( OBJ-AT ?auto_193035 ?auto_193042 ) ( IN-CITY ?auto_193041 ?auto_193043 ) ( not ( = ?auto_193034 ?auto_193041 ) ) ( OBJ-AT ?auto_193038 ?auto_193041 ) ( TRUCK-AT ?auto_193039 ?auto_193034 ) ( not ( = ?auto_193038 ?auto_193035 ) ) ( not ( = ?auto_193042 ?auto_193041 ) ) ( not ( = ?auto_193038 ?auto_193036 ) ) ( not ( = ?auto_193035 ?auto_193036 ) ) ( not ( = ?auto_193044 ?auto_193042 ) ) ( not ( = ?auto_193044 ?auto_193041 ) ) ( not ( = ?auto_193038 ?auto_193037 ) ) ( not ( = ?auto_193035 ?auto_193037 ) ) ( not ( = ?auto_193036 ?auto_193037 ) ) ( not ( = ?auto_193040 ?auto_193044 ) ) ( not ( = ?auto_193040 ?auto_193042 ) ) ( not ( = ?auto_193040 ?auto_193041 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193038 ?auto_193035 ?auto_193037 ?auto_193036 ?auto_193034 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193106 - OBJ
      ?auto_193107 - OBJ
      ?auto_193108 - OBJ
      ?auto_193109 - OBJ
      ?auto_193105 - LOCATION
    )
    :vars
    (
      ?auto_193111 - LOCATION
      ?auto_193114 - CITY
      ?auto_193115 - LOCATION
      ?auto_193113 - LOCATION
      ?auto_193112 - LOCATION
      ?auto_193110 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193111 ?auto_193114 ) ( IN-CITY ?auto_193105 ?auto_193114 ) ( not ( = ?auto_193105 ?auto_193111 ) ) ( OBJ-AT ?auto_193107 ?auto_193111 ) ( IN-CITY ?auto_193115 ?auto_193114 ) ( not ( = ?auto_193105 ?auto_193115 ) ) ( OBJ-AT ?auto_193109 ?auto_193115 ) ( IN-CITY ?auto_193113 ?auto_193114 ) ( not ( = ?auto_193105 ?auto_193113 ) ) ( OBJ-AT ?auto_193106 ?auto_193113 ) ( IN-CITY ?auto_193112 ?auto_193114 ) ( not ( = ?auto_193105 ?auto_193112 ) ) ( OBJ-AT ?auto_193108 ?auto_193112 ) ( TRUCK-AT ?auto_193110 ?auto_193105 ) ( not ( = ?auto_193108 ?auto_193106 ) ) ( not ( = ?auto_193113 ?auto_193112 ) ) ( not ( = ?auto_193108 ?auto_193109 ) ) ( not ( = ?auto_193106 ?auto_193109 ) ) ( not ( = ?auto_193115 ?auto_193113 ) ) ( not ( = ?auto_193115 ?auto_193112 ) ) ( not ( = ?auto_193108 ?auto_193107 ) ) ( not ( = ?auto_193106 ?auto_193107 ) ) ( not ( = ?auto_193109 ?auto_193107 ) ) ( not ( = ?auto_193111 ?auto_193115 ) ) ( not ( = ?auto_193111 ?auto_193113 ) ) ( not ( = ?auto_193111 ?auto_193112 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193108 ?auto_193106 ?auto_193107 ?auto_193109 ?auto_193105 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193179 - OBJ
      ?auto_193180 - OBJ
      ?auto_193181 - OBJ
      ?auto_193182 - OBJ
      ?auto_193178 - LOCATION
    )
    :vars
    (
      ?auto_193184 - LOCATION
      ?auto_193187 - CITY
      ?auto_193188 - LOCATION
      ?auto_193186 - LOCATION
      ?auto_193185 - LOCATION
      ?auto_193183 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193184 ?auto_193187 ) ( IN-CITY ?auto_193178 ?auto_193187 ) ( not ( = ?auto_193178 ?auto_193184 ) ) ( OBJ-AT ?auto_193180 ?auto_193184 ) ( IN-CITY ?auto_193188 ?auto_193187 ) ( not ( = ?auto_193178 ?auto_193188 ) ) ( OBJ-AT ?auto_193181 ?auto_193188 ) ( IN-CITY ?auto_193186 ?auto_193187 ) ( not ( = ?auto_193178 ?auto_193186 ) ) ( OBJ-AT ?auto_193179 ?auto_193186 ) ( IN-CITY ?auto_193185 ?auto_193187 ) ( not ( = ?auto_193178 ?auto_193185 ) ) ( OBJ-AT ?auto_193182 ?auto_193185 ) ( TRUCK-AT ?auto_193183 ?auto_193178 ) ( not ( = ?auto_193182 ?auto_193179 ) ) ( not ( = ?auto_193186 ?auto_193185 ) ) ( not ( = ?auto_193182 ?auto_193181 ) ) ( not ( = ?auto_193179 ?auto_193181 ) ) ( not ( = ?auto_193188 ?auto_193186 ) ) ( not ( = ?auto_193188 ?auto_193185 ) ) ( not ( = ?auto_193182 ?auto_193180 ) ) ( not ( = ?auto_193179 ?auto_193180 ) ) ( not ( = ?auto_193181 ?auto_193180 ) ) ( not ( = ?auto_193184 ?auto_193188 ) ) ( not ( = ?auto_193184 ?auto_193186 ) ) ( not ( = ?auto_193184 ?auto_193185 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193182 ?auto_193179 ?auto_193180 ?auto_193181 ?auto_193178 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193288 - OBJ
      ?auto_193289 - OBJ
      ?auto_193290 - OBJ
      ?auto_193291 - OBJ
      ?auto_193287 - LOCATION
    )
    :vars
    (
      ?auto_193293 - LOCATION
      ?auto_193296 - CITY
      ?auto_193297 - LOCATION
      ?auto_193295 - LOCATION
      ?auto_193294 - LOCATION
      ?auto_193292 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193293 ?auto_193296 ) ( IN-CITY ?auto_193287 ?auto_193296 ) ( not ( = ?auto_193287 ?auto_193293 ) ) ( OBJ-AT ?auto_193291 ?auto_193293 ) ( IN-CITY ?auto_193297 ?auto_193296 ) ( not ( = ?auto_193287 ?auto_193297 ) ) ( OBJ-AT ?auto_193288 ?auto_193297 ) ( IN-CITY ?auto_193295 ?auto_193296 ) ( not ( = ?auto_193287 ?auto_193295 ) ) ( OBJ-AT ?auto_193290 ?auto_193295 ) ( IN-CITY ?auto_193294 ?auto_193296 ) ( not ( = ?auto_193287 ?auto_193294 ) ) ( OBJ-AT ?auto_193289 ?auto_193294 ) ( TRUCK-AT ?auto_193292 ?auto_193287 ) ( not ( = ?auto_193289 ?auto_193290 ) ) ( not ( = ?auto_193295 ?auto_193294 ) ) ( not ( = ?auto_193289 ?auto_193288 ) ) ( not ( = ?auto_193290 ?auto_193288 ) ) ( not ( = ?auto_193297 ?auto_193295 ) ) ( not ( = ?auto_193297 ?auto_193294 ) ) ( not ( = ?auto_193289 ?auto_193291 ) ) ( not ( = ?auto_193290 ?auto_193291 ) ) ( not ( = ?auto_193288 ?auto_193291 ) ) ( not ( = ?auto_193293 ?auto_193297 ) ) ( not ( = ?auto_193293 ?auto_193295 ) ) ( not ( = ?auto_193293 ?auto_193294 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193289 ?auto_193290 ?auto_193291 ?auto_193288 ?auto_193287 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193323 - OBJ
      ?auto_193324 - OBJ
      ?auto_193325 - OBJ
      ?auto_193326 - OBJ
      ?auto_193322 - LOCATION
    )
    :vars
    (
      ?auto_193328 - LOCATION
      ?auto_193331 - CITY
      ?auto_193332 - LOCATION
      ?auto_193330 - LOCATION
      ?auto_193329 - LOCATION
      ?auto_193327 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193328 ?auto_193331 ) ( IN-CITY ?auto_193322 ?auto_193331 ) ( not ( = ?auto_193322 ?auto_193328 ) ) ( OBJ-AT ?auto_193325 ?auto_193328 ) ( IN-CITY ?auto_193332 ?auto_193331 ) ( not ( = ?auto_193322 ?auto_193332 ) ) ( OBJ-AT ?auto_193323 ?auto_193332 ) ( IN-CITY ?auto_193330 ?auto_193331 ) ( not ( = ?auto_193322 ?auto_193330 ) ) ( OBJ-AT ?auto_193326 ?auto_193330 ) ( IN-CITY ?auto_193329 ?auto_193331 ) ( not ( = ?auto_193322 ?auto_193329 ) ) ( OBJ-AT ?auto_193324 ?auto_193329 ) ( TRUCK-AT ?auto_193327 ?auto_193322 ) ( not ( = ?auto_193324 ?auto_193326 ) ) ( not ( = ?auto_193330 ?auto_193329 ) ) ( not ( = ?auto_193324 ?auto_193323 ) ) ( not ( = ?auto_193326 ?auto_193323 ) ) ( not ( = ?auto_193332 ?auto_193330 ) ) ( not ( = ?auto_193332 ?auto_193329 ) ) ( not ( = ?auto_193324 ?auto_193325 ) ) ( not ( = ?auto_193326 ?auto_193325 ) ) ( not ( = ?auto_193323 ?auto_193325 ) ) ( not ( = ?auto_193328 ?auto_193332 ) ) ( not ( = ?auto_193328 ?auto_193330 ) ) ( not ( = ?auto_193328 ?auto_193329 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193324 ?auto_193326 ?auto_193325 ?auto_193323 ?auto_193322 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193358 - OBJ
      ?auto_193359 - OBJ
      ?auto_193360 - OBJ
      ?auto_193361 - OBJ
      ?auto_193357 - LOCATION
    )
    :vars
    (
      ?auto_193363 - LOCATION
      ?auto_193366 - CITY
      ?auto_193367 - LOCATION
      ?auto_193365 - LOCATION
      ?auto_193364 - LOCATION
      ?auto_193362 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193363 ?auto_193366 ) ( IN-CITY ?auto_193357 ?auto_193366 ) ( not ( = ?auto_193357 ?auto_193363 ) ) ( OBJ-AT ?auto_193361 ?auto_193363 ) ( IN-CITY ?auto_193367 ?auto_193366 ) ( not ( = ?auto_193357 ?auto_193367 ) ) ( OBJ-AT ?auto_193358 ?auto_193367 ) ( IN-CITY ?auto_193365 ?auto_193366 ) ( not ( = ?auto_193357 ?auto_193365 ) ) ( OBJ-AT ?auto_193359 ?auto_193365 ) ( IN-CITY ?auto_193364 ?auto_193366 ) ( not ( = ?auto_193357 ?auto_193364 ) ) ( OBJ-AT ?auto_193360 ?auto_193364 ) ( TRUCK-AT ?auto_193362 ?auto_193357 ) ( not ( = ?auto_193360 ?auto_193359 ) ) ( not ( = ?auto_193365 ?auto_193364 ) ) ( not ( = ?auto_193360 ?auto_193358 ) ) ( not ( = ?auto_193359 ?auto_193358 ) ) ( not ( = ?auto_193367 ?auto_193365 ) ) ( not ( = ?auto_193367 ?auto_193364 ) ) ( not ( = ?auto_193360 ?auto_193361 ) ) ( not ( = ?auto_193359 ?auto_193361 ) ) ( not ( = ?auto_193358 ?auto_193361 ) ) ( not ( = ?auto_193363 ?auto_193367 ) ) ( not ( = ?auto_193363 ?auto_193365 ) ) ( not ( = ?auto_193363 ?auto_193364 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193360 ?auto_193359 ?auto_193361 ?auto_193358 ?auto_193357 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193393 - OBJ
      ?auto_193394 - OBJ
      ?auto_193395 - OBJ
      ?auto_193396 - OBJ
      ?auto_193392 - LOCATION
    )
    :vars
    (
      ?auto_193398 - LOCATION
      ?auto_193401 - CITY
      ?auto_193402 - LOCATION
      ?auto_193400 - LOCATION
      ?auto_193399 - LOCATION
      ?auto_193397 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193398 ?auto_193401 ) ( IN-CITY ?auto_193392 ?auto_193401 ) ( not ( = ?auto_193392 ?auto_193398 ) ) ( OBJ-AT ?auto_193395 ?auto_193398 ) ( IN-CITY ?auto_193402 ?auto_193401 ) ( not ( = ?auto_193392 ?auto_193402 ) ) ( OBJ-AT ?auto_193393 ?auto_193402 ) ( IN-CITY ?auto_193400 ?auto_193401 ) ( not ( = ?auto_193392 ?auto_193400 ) ) ( OBJ-AT ?auto_193394 ?auto_193400 ) ( IN-CITY ?auto_193399 ?auto_193401 ) ( not ( = ?auto_193392 ?auto_193399 ) ) ( OBJ-AT ?auto_193396 ?auto_193399 ) ( TRUCK-AT ?auto_193397 ?auto_193392 ) ( not ( = ?auto_193396 ?auto_193394 ) ) ( not ( = ?auto_193400 ?auto_193399 ) ) ( not ( = ?auto_193396 ?auto_193393 ) ) ( not ( = ?auto_193394 ?auto_193393 ) ) ( not ( = ?auto_193402 ?auto_193400 ) ) ( not ( = ?auto_193402 ?auto_193399 ) ) ( not ( = ?auto_193396 ?auto_193395 ) ) ( not ( = ?auto_193394 ?auto_193395 ) ) ( not ( = ?auto_193393 ?auto_193395 ) ) ( not ( = ?auto_193398 ?auto_193402 ) ) ( not ( = ?auto_193398 ?auto_193400 ) ) ( not ( = ?auto_193398 ?auto_193399 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193396 ?auto_193394 ?auto_193395 ?auto_193393 ?auto_193392 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193539 - OBJ
      ?auto_193540 - OBJ
      ?auto_193541 - OBJ
      ?auto_193542 - OBJ
      ?auto_193538 - LOCATION
    )
    :vars
    (
      ?auto_193544 - LOCATION
      ?auto_193547 - CITY
      ?auto_193548 - LOCATION
      ?auto_193546 - LOCATION
      ?auto_193545 - LOCATION
      ?auto_193543 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193544 ?auto_193547 ) ( IN-CITY ?auto_193538 ?auto_193547 ) ( not ( = ?auto_193538 ?auto_193544 ) ) ( OBJ-AT ?auto_193540 ?auto_193544 ) ( IN-CITY ?auto_193548 ?auto_193547 ) ( not ( = ?auto_193538 ?auto_193548 ) ) ( OBJ-AT ?auto_193539 ?auto_193548 ) ( IN-CITY ?auto_193546 ?auto_193547 ) ( not ( = ?auto_193538 ?auto_193546 ) ) ( OBJ-AT ?auto_193542 ?auto_193546 ) ( IN-CITY ?auto_193545 ?auto_193547 ) ( not ( = ?auto_193538 ?auto_193545 ) ) ( OBJ-AT ?auto_193541 ?auto_193545 ) ( TRUCK-AT ?auto_193543 ?auto_193538 ) ( not ( = ?auto_193541 ?auto_193542 ) ) ( not ( = ?auto_193546 ?auto_193545 ) ) ( not ( = ?auto_193541 ?auto_193539 ) ) ( not ( = ?auto_193542 ?auto_193539 ) ) ( not ( = ?auto_193548 ?auto_193546 ) ) ( not ( = ?auto_193548 ?auto_193545 ) ) ( not ( = ?auto_193541 ?auto_193540 ) ) ( not ( = ?auto_193542 ?auto_193540 ) ) ( not ( = ?auto_193539 ?auto_193540 ) ) ( not ( = ?auto_193544 ?auto_193548 ) ) ( not ( = ?auto_193544 ?auto_193546 ) ) ( not ( = ?auto_193544 ?auto_193545 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193541 ?auto_193542 ?auto_193540 ?auto_193539 ?auto_193538 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193574 - OBJ
      ?auto_193575 - OBJ
      ?auto_193576 - OBJ
      ?auto_193577 - OBJ
      ?auto_193573 - LOCATION
    )
    :vars
    (
      ?auto_193579 - LOCATION
      ?auto_193582 - CITY
      ?auto_193583 - LOCATION
      ?auto_193581 - LOCATION
      ?auto_193580 - LOCATION
      ?auto_193578 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193579 ?auto_193582 ) ( IN-CITY ?auto_193573 ?auto_193582 ) ( not ( = ?auto_193573 ?auto_193579 ) ) ( OBJ-AT ?auto_193575 ?auto_193579 ) ( IN-CITY ?auto_193583 ?auto_193582 ) ( not ( = ?auto_193573 ?auto_193583 ) ) ( OBJ-AT ?auto_193574 ?auto_193583 ) ( IN-CITY ?auto_193581 ?auto_193582 ) ( not ( = ?auto_193573 ?auto_193581 ) ) ( OBJ-AT ?auto_193576 ?auto_193581 ) ( IN-CITY ?auto_193580 ?auto_193582 ) ( not ( = ?auto_193573 ?auto_193580 ) ) ( OBJ-AT ?auto_193577 ?auto_193580 ) ( TRUCK-AT ?auto_193578 ?auto_193573 ) ( not ( = ?auto_193577 ?auto_193576 ) ) ( not ( = ?auto_193581 ?auto_193580 ) ) ( not ( = ?auto_193577 ?auto_193574 ) ) ( not ( = ?auto_193576 ?auto_193574 ) ) ( not ( = ?auto_193583 ?auto_193581 ) ) ( not ( = ?auto_193583 ?auto_193580 ) ) ( not ( = ?auto_193577 ?auto_193575 ) ) ( not ( = ?auto_193576 ?auto_193575 ) ) ( not ( = ?auto_193574 ?auto_193575 ) ) ( not ( = ?auto_193579 ?auto_193583 ) ) ( not ( = ?auto_193579 ?auto_193581 ) ) ( not ( = ?auto_193579 ?auto_193580 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193577 ?auto_193576 ?auto_193575 ?auto_193574 ?auto_193573 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193795 - OBJ
      ?auto_193796 - OBJ
      ?auto_193797 - OBJ
      ?auto_193798 - OBJ
      ?auto_193794 - LOCATION
    )
    :vars
    (
      ?auto_193800 - LOCATION
      ?auto_193803 - CITY
      ?auto_193804 - LOCATION
      ?auto_193802 - LOCATION
      ?auto_193801 - LOCATION
      ?auto_193799 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193800 ?auto_193803 ) ( IN-CITY ?auto_193794 ?auto_193803 ) ( not ( = ?auto_193794 ?auto_193800 ) ) ( OBJ-AT ?auto_193795 ?auto_193800 ) ( IN-CITY ?auto_193804 ?auto_193803 ) ( not ( = ?auto_193794 ?auto_193804 ) ) ( OBJ-AT ?auto_193798 ?auto_193804 ) ( IN-CITY ?auto_193802 ?auto_193803 ) ( not ( = ?auto_193794 ?auto_193802 ) ) ( OBJ-AT ?auto_193797 ?auto_193802 ) ( IN-CITY ?auto_193801 ?auto_193803 ) ( not ( = ?auto_193794 ?auto_193801 ) ) ( OBJ-AT ?auto_193796 ?auto_193801 ) ( TRUCK-AT ?auto_193799 ?auto_193794 ) ( not ( = ?auto_193796 ?auto_193797 ) ) ( not ( = ?auto_193802 ?auto_193801 ) ) ( not ( = ?auto_193796 ?auto_193798 ) ) ( not ( = ?auto_193797 ?auto_193798 ) ) ( not ( = ?auto_193804 ?auto_193802 ) ) ( not ( = ?auto_193804 ?auto_193801 ) ) ( not ( = ?auto_193796 ?auto_193795 ) ) ( not ( = ?auto_193797 ?auto_193795 ) ) ( not ( = ?auto_193798 ?auto_193795 ) ) ( not ( = ?auto_193800 ?auto_193804 ) ) ( not ( = ?auto_193800 ?auto_193802 ) ) ( not ( = ?auto_193800 ?auto_193801 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193796 ?auto_193797 ?auto_193795 ?auto_193798 ?auto_193794 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193830 - OBJ
      ?auto_193831 - OBJ
      ?auto_193832 - OBJ
      ?auto_193833 - OBJ
      ?auto_193829 - LOCATION
    )
    :vars
    (
      ?auto_193835 - LOCATION
      ?auto_193838 - CITY
      ?auto_193839 - LOCATION
      ?auto_193837 - LOCATION
      ?auto_193836 - LOCATION
      ?auto_193834 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193835 ?auto_193838 ) ( IN-CITY ?auto_193829 ?auto_193838 ) ( not ( = ?auto_193829 ?auto_193835 ) ) ( OBJ-AT ?auto_193830 ?auto_193835 ) ( IN-CITY ?auto_193839 ?auto_193838 ) ( not ( = ?auto_193829 ?auto_193839 ) ) ( OBJ-AT ?auto_193832 ?auto_193839 ) ( IN-CITY ?auto_193837 ?auto_193838 ) ( not ( = ?auto_193829 ?auto_193837 ) ) ( OBJ-AT ?auto_193833 ?auto_193837 ) ( IN-CITY ?auto_193836 ?auto_193838 ) ( not ( = ?auto_193829 ?auto_193836 ) ) ( OBJ-AT ?auto_193831 ?auto_193836 ) ( TRUCK-AT ?auto_193834 ?auto_193829 ) ( not ( = ?auto_193831 ?auto_193833 ) ) ( not ( = ?auto_193837 ?auto_193836 ) ) ( not ( = ?auto_193831 ?auto_193832 ) ) ( not ( = ?auto_193833 ?auto_193832 ) ) ( not ( = ?auto_193839 ?auto_193837 ) ) ( not ( = ?auto_193839 ?auto_193836 ) ) ( not ( = ?auto_193831 ?auto_193830 ) ) ( not ( = ?auto_193833 ?auto_193830 ) ) ( not ( = ?auto_193832 ?auto_193830 ) ) ( not ( = ?auto_193835 ?auto_193839 ) ) ( not ( = ?auto_193835 ?auto_193837 ) ) ( not ( = ?auto_193835 ?auto_193836 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193831 ?auto_193833 ?auto_193830 ?auto_193832 ?auto_193829 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_193939 - OBJ
      ?auto_193940 - OBJ
      ?auto_193941 - OBJ
      ?auto_193942 - OBJ
      ?auto_193938 - LOCATION
    )
    :vars
    (
      ?auto_193944 - LOCATION
      ?auto_193947 - CITY
      ?auto_193948 - LOCATION
      ?auto_193946 - LOCATION
      ?auto_193945 - LOCATION
      ?auto_193943 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_193944 ?auto_193947 ) ( IN-CITY ?auto_193938 ?auto_193947 ) ( not ( = ?auto_193938 ?auto_193944 ) ) ( OBJ-AT ?auto_193939 ?auto_193944 ) ( IN-CITY ?auto_193948 ?auto_193947 ) ( not ( = ?auto_193938 ?auto_193948 ) ) ( OBJ-AT ?auto_193942 ?auto_193948 ) ( IN-CITY ?auto_193946 ?auto_193947 ) ( not ( = ?auto_193938 ?auto_193946 ) ) ( OBJ-AT ?auto_193940 ?auto_193946 ) ( IN-CITY ?auto_193945 ?auto_193947 ) ( not ( = ?auto_193938 ?auto_193945 ) ) ( OBJ-AT ?auto_193941 ?auto_193945 ) ( TRUCK-AT ?auto_193943 ?auto_193938 ) ( not ( = ?auto_193941 ?auto_193940 ) ) ( not ( = ?auto_193946 ?auto_193945 ) ) ( not ( = ?auto_193941 ?auto_193942 ) ) ( not ( = ?auto_193940 ?auto_193942 ) ) ( not ( = ?auto_193948 ?auto_193946 ) ) ( not ( = ?auto_193948 ?auto_193945 ) ) ( not ( = ?auto_193941 ?auto_193939 ) ) ( not ( = ?auto_193940 ?auto_193939 ) ) ( not ( = ?auto_193942 ?auto_193939 ) ) ( not ( = ?auto_193944 ?auto_193948 ) ) ( not ( = ?auto_193944 ?auto_193946 ) ) ( not ( = ?auto_193944 ?auto_193945 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_193941 ?auto_193940 ?auto_193939 ?auto_193942 ?auto_193938 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194012 - OBJ
      ?auto_194013 - OBJ
      ?auto_194014 - OBJ
      ?auto_194015 - OBJ
      ?auto_194011 - LOCATION
    )
    :vars
    (
      ?auto_194017 - LOCATION
      ?auto_194020 - CITY
      ?auto_194021 - LOCATION
      ?auto_194019 - LOCATION
      ?auto_194018 - LOCATION
      ?auto_194016 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_194017 ?auto_194020 ) ( IN-CITY ?auto_194011 ?auto_194020 ) ( not ( = ?auto_194011 ?auto_194017 ) ) ( OBJ-AT ?auto_194012 ?auto_194017 ) ( IN-CITY ?auto_194021 ?auto_194020 ) ( not ( = ?auto_194011 ?auto_194021 ) ) ( OBJ-AT ?auto_194014 ?auto_194021 ) ( IN-CITY ?auto_194019 ?auto_194020 ) ( not ( = ?auto_194011 ?auto_194019 ) ) ( OBJ-AT ?auto_194013 ?auto_194019 ) ( IN-CITY ?auto_194018 ?auto_194020 ) ( not ( = ?auto_194011 ?auto_194018 ) ) ( OBJ-AT ?auto_194015 ?auto_194018 ) ( TRUCK-AT ?auto_194016 ?auto_194011 ) ( not ( = ?auto_194015 ?auto_194013 ) ) ( not ( = ?auto_194019 ?auto_194018 ) ) ( not ( = ?auto_194015 ?auto_194014 ) ) ( not ( = ?auto_194013 ?auto_194014 ) ) ( not ( = ?auto_194021 ?auto_194019 ) ) ( not ( = ?auto_194021 ?auto_194018 ) ) ( not ( = ?auto_194015 ?auto_194012 ) ) ( not ( = ?auto_194013 ?auto_194012 ) ) ( not ( = ?auto_194014 ?auto_194012 ) ) ( not ( = ?auto_194017 ?auto_194021 ) ) ( not ( = ?auto_194017 ?auto_194019 ) ) ( not ( = ?auto_194017 ?auto_194018 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_194015 ?auto_194013 ?auto_194012 ?auto_194014 ?auto_194011 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194121 - OBJ
      ?auto_194122 - OBJ
      ?auto_194123 - OBJ
      ?auto_194124 - OBJ
      ?auto_194120 - LOCATION
    )
    :vars
    (
      ?auto_194126 - LOCATION
      ?auto_194129 - CITY
      ?auto_194130 - LOCATION
      ?auto_194128 - LOCATION
      ?auto_194127 - LOCATION
      ?auto_194125 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_194126 ?auto_194129 ) ( IN-CITY ?auto_194120 ?auto_194129 ) ( not ( = ?auto_194120 ?auto_194126 ) ) ( OBJ-AT ?auto_194121 ?auto_194126 ) ( IN-CITY ?auto_194130 ?auto_194129 ) ( not ( = ?auto_194120 ?auto_194130 ) ) ( OBJ-AT ?auto_194122 ?auto_194130 ) ( IN-CITY ?auto_194128 ?auto_194129 ) ( not ( = ?auto_194120 ?auto_194128 ) ) ( OBJ-AT ?auto_194124 ?auto_194128 ) ( IN-CITY ?auto_194127 ?auto_194129 ) ( not ( = ?auto_194120 ?auto_194127 ) ) ( OBJ-AT ?auto_194123 ?auto_194127 ) ( TRUCK-AT ?auto_194125 ?auto_194120 ) ( not ( = ?auto_194123 ?auto_194124 ) ) ( not ( = ?auto_194128 ?auto_194127 ) ) ( not ( = ?auto_194123 ?auto_194122 ) ) ( not ( = ?auto_194124 ?auto_194122 ) ) ( not ( = ?auto_194130 ?auto_194128 ) ) ( not ( = ?auto_194130 ?auto_194127 ) ) ( not ( = ?auto_194123 ?auto_194121 ) ) ( not ( = ?auto_194124 ?auto_194121 ) ) ( not ( = ?auto_194122 ?auto_194121 ) ) ( not ( = ?auto_194126 ?auto_194130 ) ) ( not ( = ?auto_194126 ?auto_194128 ) ) ( not ( = ?auto_194126 ?auto_194127 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_194123 ?auto_194124 ?auto_194121 ?auto_194122 ?auto_194120 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_194156 - OBJ
      ?auto_194157 - OBJ
      ?auto_194158 - OBJ
      ?auto_194159 - OBJ
      ?auto_194155 - LOCATION
    )
    :vars
    (
      ?auto_194161 - LOCATION
      ?auto_194164 - CITY
      ?auto_194165 - LOCATION
      ?auto_194163 - LOCATION
      ?auto_194162 - LOCATION
      ?auto_194160 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_194161 ?auto_194164 ) ( IN-CITY ?auto_194155 ?auto_194164 ) ( not ( = ?auto_194155 ?auto_194161 ) ) ( OBJ-AT ?auto_194156 ?auto_194161 ) ( IN-CITY ?auto_194165 ?auto_194164 ) ( not ( = ?auto_194155 ?auto_194165 ) ) ( OBJ-AT ?auto_194157 ?auto_194165 ) ( IN-CITY ?auto_194163 ?auto_194164 ) ( not ( = ?auto_194155 ?auto_194163 ) ) ( OBJ-AT ?auto_194158 ?auto_194163 ) ( IN-CITY ?auto_194162 ?auto_194164 ) ( not ( = ?auto_194155 ?auto_194162 ) ) ( OBJ-AT ?auto_194159 ?auto_194162 ) ( TRUCK-AT ?auto_194160 ?auto_194155 ) ( not ( = ?auto_194159 ?auto_194158 ) ) ( not ( = ?auto_194163 ?auto_194162 ) ) ( not ( = ?auto_194159 ?auto_194157 ) ) ( not ( = ?auto_194158 ?auto_194157 ) ) ( not ( = ?auto_194165 ?auto_194163 ) ) ( not ( = ?auto_194165 ?auto_194162 ) ) ( not ( = ?auto_194159 ?auto_194156 ) ) ( not ( = ?auto_194158 ?auto_194156 ) ) ( not ( = ?auto_194157 ?auto_194156 ) ) ( not ( = ?auto_194161 ?auto_194165 ) ) ( not ( = ?auto_194161 ?auto_194163 ) ) ( not ( = ?auto_194161 ?auto_194162 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_194159 ?auto_194158 ?auto_194156 ?auto_194157 ?auto_194155 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_194508 - OBJ
      ?auto_194507 - LOCATION
    )
    :vars
    (
      ?auto_194510 - LOCATION
      ?auto_194511 - CITY
      ?auto_194509 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_194510 ?auto_194511 ) ( IN-CITY ?auto_194507 ?auto_194511 ) ( not ( = ?auto_194507 ?auto_194510 ) ) ( OBJ-AT ?auto_194508 ?auto_194510 ) ( TRUCK-AT ?auto_194509 ?auto_194507 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_194509 ?auto_194507 ?auto_194510 ?auto_194511 )
      ( !LOAD-TRUCK ?auto_194508 ?auto_194509 ?auto_194510 )
      ( !DRIVE-TRUCK ?auto_194509 ?auto_194510 ?auto_194507 ?auto_194511 )
      ( !UNLOAD-TRUCK ?auto_194508 ?auto_194509 ?auto_194507 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_208327 - OBJ
      ?auto_208328 - OBJ
      ?auto_208329 - OBJ
      ?auto_208330 - OBJ
      ?auto_208331 - OBJ
      ?auto_208326 - LOCATION
    )
    :vars
    (
      ?auto_208334 - LOCATION
      ?auto_208333 - CITY
      ?auto_208335 - LOCATION
      ?auto_208338 - LOCATION
      ?auto_208337 - LOCATION
      ?auto_208336 - LOCATION
      ?auto_208332 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_208334 ?auto_208333 ) ( IN-CITY ?auto_208326 ?auto_208333 ) ( not ( = ?auto_208326 ?auto_208334 ) ) ( OBJ-AT ?auto_208331 ?auto_208334 ) ( IN-CITY ?auto_208335 ?auto_208333 ) ( not ( = ?auto_208326 ?auto_208335 ) ) ( OBJ-AT ?auto_208330 ?auto_208335 ) ( IN-CITY ?auto_208338 ?auto_208333 ) ( not ( = ?auto_208326 ?auto_208338 ) ) ( OBJ-AT ?auto_208329 ?auto_208338 ) ( IN-CITY ?auto_208337 ?auto_208333 ) ( not ( = ?auto_208326 ?auto_208337 ) ) ( OBJ-AT ?auto_208328 ?auto_208337 ) ( IN-CITY ?auto_208336 ?auto_208333 ) ( not ( = ?auto_208326 ?auto_208336 ) ) ( OBJ-AT ?auto_208327 ?auto_208336 ) ( TRUCK-AT ?auto_208332 ?auto_208326 ) ( not ( = ?auto_208327 ?auto_208328 ) ) ( not ( = ?auto_208337 ?auto_208336 ) ) ( not ( = ?auto_208327 ?auto_208329 ) ) ( not ( = ?auto_208328 ?auto_208329 ) ) ( not ( = ?auto_208338 ?auto_208337 ) ) ( not ( = ?auto_208338 ?auto_208336 ) ) ( not ( = ?auto_208327 ?auto_208330 ) ) ( not ( = ?auto_208328 ?auto_208330 ) ) ( not ( = ?auto_208329 ?auto_208330 ) ) ( not ( = ?auto_208335 ?auto_208338 ) ) ( not ( = ?auto_208335 ?auto_208337 ) ) ( not ( = ?auto_208335 ?auto_208336 ) ) ( not ( = ?auto_208327 ?auto_208331 ) ) ( not ( = ?auto_208328 ?auto_208331 ) ) ( not ( = ?auto_208329 ?auto_208331 ) ) ( not ( = ?auto_208330 ?auto_208331 ) ) ( not ( = ?auto_208334 ?auto_208335 ) ) ( not ( = ?auto_208334 ?auto_208338 ) ) ( not ( = ?auto_208334 ?auto_208337 ) ) ( not ( = ?auto_208334 ?auto_208336 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_208327 ?auto_208328 ?auto_208330 ?auto_208329 ?auto_208326 )
      ( DELIVER-1PKG ?auto_208331 ?auto_208326 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_208382 - OBJ
      ?auto_208383 - OBJ
      ?auto_208384 - OBJ
      ?auto_208385 - OBJ
      ?auto_208386 - OBJ
      ?auto_208381 - LOCATION
    )
    :vars
    (
      ?auto_208387 - LOCATION
      ?auto_208392 - CITY
      ?auto_208388 - LOCATION
      ?auto_208389 - LOCATION
      ?auto_208391 - LOCATION
      ?auto_208390 - LOCATION
      ?auto_208393 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_208387 ?auto_208392 ) ( IN-CITY ?auto_208381 ?auto_208392 ) ( not ( = ?auto_208381 ?auto_208387 ) ) ( OBJ-AT ?auto_208385 ?auto_208387 ) ( IN-CITY ?auto_208388 ?auto_208392 ) ( not ( = ?auto_208381 ?auto_208388 ) ) ( OBJ-AT ?auto_208386 ?auto_208388 ) ( IN-CITY ?auto_208389 ?auto_208392 ) ( not ( = ?auto_208381 ?auto_208389 ) ) ( OBJ-AT ?auto_208384 ?auto_208389 ) ( IN-CITY ?auto_208391 ?auto_208392 ) ( not ( = ?auto_208381 ?auto_208391 ) ) ( OBJ-AT ?auto_208383 ?auto_208391 ) ( IN-CITY ?auto_208390 ?auto_208392 ) ( not ( = ?auto_208381 ?auto_208390 ) ) ( OBJ-AT ?auto_208382 ?auto_208390 ) ( TRUCK-AT ?auto_208393 ?auto_208381 ) ( not ( = ?auto_208382 ?auto_208383 ) ) ( not ( = ?auto_208391 ?auto_208390 ) ) ( not ( = ?auto_208382 ?auto_208384 ) ) ( not ( = ?auto_208383 ?auto_208384 ) ) ( not ( = ?auto_208389 ?auto_208391 ) ) ( not ( = ?auto_208389 ?auto_208390 ) ) ( not ( = ?auto_208382 ?auto_208386 ) ) ( not ( = ?auto_208383 ?auto_208386 ) ) ( not ( = ?auto_208384 ?auto_208386 ) ) ( not ( = ?auto_208388 ?auto_208389 ) ) ( not ( = ?auto_208388 ?auto_208391 ) ) ( not ( = ?auto_208388 ?auto_208390 ) ) ( not ( = ?auto_208382 ?auto_208385 ) ) ( not ( = ?auto_208383 ?auto_208385 ) ) ( not ( = ?auto_208384 ?auto_208385 ) ) ( not ( = ?auto_208386 ?auto_208385 ) ) ( not ( = ?auto_208387 ?auto_208388 ) ) ( not ( = ?auto_208387 ?auto_208389 ) ) ( not ( = ?auto_208387 ?auto_208391 ) ) ( not ( = ?auto_208387 ?auto_208390 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_208382 ?auto_208383 ?auto_208384 ?auto_208386 ?auto_208385 ?auto_208381 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_208437 - OBJ
      ?auto_208438 - OBJ
      ?auto_208439 - OBJ
      ?auto_208440 - OBJ
      ?auto_208441 - OBJ
      ?auto_208436 - LOCATION
    )
    :vars
    (
      ?auto_208448 - LOCATION
      ?auto_208444 - CITY
      ?auto_208447 - LOCATION
      ?auto_208443 - LOCATION
      ?auto_208446 - LOCATION
      ?auto_208442 - LOCATION
      ?auto_208445 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_208448 ?auto_208444 ) ( IN-CITY ?auto_208436 ?auto_208444 ) ( not ( = ?auto_208436 ?auto_208448 ) ) ( OBJ-AT ?auto_208441 ?auto_208448 ) ( IN-CITY ?auto_208447 ?auto_208444 ) ( not ( = ?auto_208436 ?auto_208447 ) ) ( OBJ-AT ?auto_208439 ?auto_208447 ) ( IN-CITY ?auto_208443 ?auto_208444 ) ( not ( = ?auto_208436 ?auto_208443 ) ) ( OBJ-AT ?auto_208440 ?auto_208443 ) ( IN-CITY ?auto_208446 ?auto_208444 ) ( not ( = ?auto_208436 ?auto_208446 ) ) ( OBJ-AT ?auto_208438 ?auto_208446 ) ( IN-CITY ?auto_208442 ?auto_208444 ) ( not ( = ?auto_208436 ?auto_208442 ) ) ( OBJ-AT ?auto_208437 ?auto_208442 ) ( TRUCK-AT ?auto_208445 ?auto_208436 ) ( not ( = ?auto_208437 ?auto_208438 ) ) ( not ( = ?auto_208446 ?auto_208442 ) ) ( not ( = ?auto_208437 ?auto_208440 ) ) ( not ( = ?auto_208438 ?auto_208440 ) ) ( not ( = ?auto_208443 ?auto_208446 ) ) ( not ( = ?auto_208443 ?auto_208442 ) ) ( not ( = ?auto_208437 ?auto_208439 ) ) ( not ( = ?auto_208438 ?auto_208439 ) ) ( not ( = ?auto_208440 ?auto_208439 ) ) ( not ( = ?auto_208447 ?auto_208443 ) ) ( not ( = ?auto_208447 ?auto_208446 ) ) ( not ( = ?auto_208447 ?auto_208442 ) ) ( not ( = ?auto_208437 ?auto_208441 ) ) ( not ( = ?auto_208438 ?auto_208441 ) ) ( not ( = ?auto_208440 ?auto_208441 ) ) ( not ( = ?auto_208439 ?auto_208441 ) ) ( not ( = ?auto_208448 ?auto_208447 ) ) ( not ( = ?auto_208448 ?auto_208443 ) ) ( not ( = ?auto_208448 ?auto_208446 ) ) ( not ( = ?auto_208448 ?auto_208442 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_208437 ?auto_208438 ?auto_208440 ?auto_208441 ?auto_208439 ?auto_208436 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_208492 - OBJ
      ?auto_208493 - OBJ
      ?auto_208494 - OBJ
      ?auto_208495 - OBJ
      ?auto_208496 - OBJ
      ?auto_208491 - LOCATION
    )
    :vars
    (
      ?auto_208503 - LOCATION
      ?auto_208499 - CITY
      ?auto_208502 - LOCATION
      ?auto_208498 - LOCATION
      ?auto_208501 - LOCATION
      ?auto_208497 - LOCATION
      ?auto_208500 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_208503 ?auto_208499 ) ( IN-CITY ?auto_208491 ?auto_208499 ) ( not ( = ?auto_208491 ?auto_208503 ) ) ( OBJ-AT ?auto_208495 ?auto_208503 ) ( IN-CITY ?auto_208502 ?auto_208499 ) ( not ( = ?auto_208491 ?auto_208502 ) ) ( OBJ-AT ?auto_208494 ?auto_208502 ) ( IN-CITY ?auto_208498 ?auto_208499 ) ( not ( = ?auto_208491 ?auto_208498 ) ) ( OBJ-AT ?auto_208496 ?auto_208498 ) ( IN-CITY ?auto_208501 ?auto_208499 ) ( not ( = ?auto_208491 ?auto_208501 ) ) ( OBJ-AT ?auto_208493 ?auto_208501 ) ( IN-CITY ?auto_208497 ?auto_208499 ) ( not ( = ?auto_208491 ?auto_208497 ) ) ( OBJ-AT ?auto_208492 ?auto_208497 ) ( TRUCK-AT ?auto_208500 ?auto_208491 ) ( not ( = ?auto_208492 ?auto_208493 ) ) ( not ( = ?auto_208501 ?auto_208497 ) ) ( not ( = ?auto_208492 ?auto_208496 ) ) ( not ( = ?auto_208493 ?auto_208496 ) ) ( not ( = ?auto_208498 ?auto_208501 ) ) ( not ( = ?auto_208498 ?auto_208497 ) ) ( not ( = ?auto_208492 ?auto_208494 ) ) ( not ( = ?auto_208493 ?auto_208494 ) ) ( not ( = ?auto_208496 ?auto_208494 ) ) ( not ( = ?auto_208502 ?auto_208498 ) ) ( not ( = ?auto_208502 ?auto_208501 ) ) ( not ( = ?auto_208502 ?auto_208497 ) ) ( not ( = ?auto_208492 ?auto_208495 ) ) ( not ( = ?auto_208493 ?auto_208495 ) ) ( not ( = ?auto_208496 ?auto_208495 ) ) ( not ( = ?auto_208494 ?auto_208495 ) ) ( not ( = ?auto_208503 ?auto_208502 ) ) ( not ( = ?auto_208503 ?auto_208498 ) ) ( not ( = ?auto_208503 ?auto_208501 ) ) ( not ( = ?auto_208503 ?auto_208497 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_208492 ?auto_208493 ?auto_208496 ?auto_208495 ?auto_208494 ?auto_208491 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_208721 - OBJ
      ?auto_208722 - OBJ
      ?auto_208723 - OBJ
      ?auto_208724 - OBJ
      ?auto_208725 - OBJ
      ?auto_208720 - LOCATION
    )
    :vars
    (
      ?auto_208732 - LOCATION
      ?auto_208728 - CITY
      ?auto_208731 - LOCATION
      ?auto_208727 - LOCATION
      ?auto_208730 - LOCATION
      ?auto_208726 - LOCATION
      ?auto_208729 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_208732 ?auto_208728 ) ( IN-CITY ?auto_208720 ?auto_208728 ) ( not ( = ?auto_208720 ?auto_208732 ) ) ( OBJ-AT ?auto_208723 ?auto_208732 ) ( IN-CITY ?auto_208731 ?auto_208728 ) ( not ( = ?auto_208720 ?auto_208731 ) ) ( OBJ-AT ?auto_208725 ?auto_208731 ) ( IN-CITY ?auto_208727 ?auto_208728 ) ( not ( = ?auto_208720 ?auto_208727 ) ) ( OBJ-AT ?auto_208724 ?auto_208727 ) ( IN-CITY ?auto_208730 ?auto_208728 ) ( not ( = ?auto_208720 ?auto_208730 ) ) ( OBJ-AT ?auto_208722 ?auto_208730 ) ( IN-CITY ?auto_208726 ?auto_208728 ) ( not ( = ?auto_208720 ?auto_208726 ) ) ( OBJ-AT ?auto_208721 ?auto_208726 ) ( TRUCK-AT ?auto_208729 ?auto_208720 ) ( not ( = ?auto_208721 ?auto_208722 ) ) ( not ( = ?auto_208730 ?auto_208726 ) ) ( not ( = ?auto_208721 ?auto_208724 ) ) ( not ( = ?auto_208722 ?auto_208724 ) ) ( not ( = ?auto_208727 ?auto_208730 ) ) ( not ( = ?auto_208727 ?auto_208726 ) ) ( not ( = ?auto_208721 ?auto_208725 ) ) ( not ( = ?auto_208722 ?auto_208725 ) ) ( not ( = ?auto_208724 ?auto_208725 ) ) ( not ( = ?auto_208731 ?auto_208727 ) ) ( not ( = ?auto_208731 ?auto_208730 ) ) ( not ( = ?auto_208731 ?auto_208726 ) ) ( not ( = ?auto_208721 ?auto_208723 ) ) ( not ( = ?auto_208722 ?auto_208723 ) ) ( not ( = ?auto_208724 ?auto_208723 ) ) ( not ( = ?auto_208725 ?auto_208723 ) ) ( not ( = ?auto_208732 ?auto_208731 ) ) ( not ( = ?auto_208732 ?auto_208727 ) ) ( not ( = ?auto_208732 ?auto_208730 ) ) ( not ( = ?auto_208732 ?auto_208726 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_208721 ?auto_208722 ?auto_208724 ?auto_208723 ?auto_208725 ?auto_208720 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_208776 - OBJ
      ?auto_208777 - OBJ
      ?auto_208778 - OBJ
      ?auto_208779 - OBJ
      ?auto_208780 - OBJ
      ?auto_208775 - LOCATION
    )
    :vars
    (
      ?auto_208787 - LOCATION
      ?auto_208783 - CITY
      ?auto_208786 - LOCATION
      ?auto_208782 - LOCATION
      ?auto_208785 - LOCATION
      ?auto_208781 - LOCATION
      ?auto_208784 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_208787 ?auto_208783 ) ( IN-CITY ?auto_208775 ?auto_208783 ) ( not ( = ?auto_208775 ?auto_208787 ) ) ( OBJ-AT ?auto_208778 ?auto_208787 ) ( IN-CITY ?auto_208786 ?auto_208783 ) ( not ( = ?auto_208775 ?auto_208786 ) ) ( OBJ-AT ?auto_208779 ?auto_208786 ) ( IN-CITY ?auto_208782 ?auto_208783 ) ( not ( = ?auto_208775 ?auto_208782 ) ) ( OBJ-AT ?auto_208780 ?auto_208782 ) ( IN-CITY ?auto_208785 ?auto_208783 ) ( not ( = ?auto_208775 ?auto_208785 ) ) ( OBJ-AT ?auto_208777 ?auto_208785 ) ( IN-CITY ?auto_208781 ?auto_208783 ) ( not ( = ?auto_208775 ?auto_208781 ) ) ( OBJ-AT ?auto_208776 ?auto_208781 ) ( TRUCK-AT ?auto_208784 ?auto_208775 ) ( not ( = ?auto_208776 ?auto_208777 ) ) ( not ( = ?auto_208785 ?auto_208781 ) ) ( not ( = ?auto_208776 ?auto_208780 ) ) ( not ( = ?auto_208777 ?auto_208780 ) ) ( not ( = ?auto_208782 ?auto_208785 ) ) ( not ( = ?auto_208782 ?auto_208781 ) ) ( not ( = ?auto_208776 ?auto_208779 ) ) ( not ( = ?auto_208777 ?auto_208779 ) ) ( not ( = ?auto_208780 ?auto_208779 ) ) ( not ( = ?auto_208786 ?auto_208782 ) ) ( not ( = ?auto_208786 ?auto_208785 ) ) ( not ( = ?auto_208786 ?auto_208781 ) ) ( not ( = ?auto_208776 ?auto_208778 ) ) ( not ( = ?auto_208777 ?auto_208778 ) ) ( not ( = ?auto_208780 ?auto_208778 ) ) ( not ( = ?auto_208779 ?auto_208778 ) ) ( not ( = ?auto_208787 ?auto_208786 ) ) ( not ( = ?auto_208787 ?auto_208782 ) ) ( not ( = ?auto_208787 ?auto_208785 ) ) ( not ( = ?auto_208787 ?auto_208781 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_208776 ?auto_208777 ?auto_208780 ?auto_208778 ?auto_208779 ?auto_208775 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209063 - OBJ
      ?auto_209064 - OBJ
      ?auto_209065 - OBJ
      ?auto_209066 - OBJ
      ?auto_209067 - OBJ
      ?auto_209062 - LOCATION
    )
    :vars
    (
      ?auto_209074 - LOCATION
      ?auto_209070 - CITY
      ?auto_209073 - LOCATION
      ?auto_209069 - LOCATION
      ?auto_209072 - LOCATION
      ?auto_209068 - LOCATION
      ?auto_209071 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209074 ?auto_209070 ) ( IN-CITY ?auto_209062 ?auto_209070 ) ( not ( = ?auto_209062 ?auto_209074 ) ) ( OBJ-AT ?auto_209067 ?auto_209074 ) ( IN-CITY ?auto_209073 ?auto_209070 ) ( not ( = ?auto_209062 ?auto_209073 ) ) ( OBJ-AT ?auto_209066 ?auto_209073 ) ( IN-CITY ?auto_209069 ?auto_209070 ) ( not ( = ?auto_209062 ?auto_209069 ) ) ( OBJ-AT ?auto_209064 ?auto_209069 ) ( IN-CITY ?auto_209072 ?auto_209070 ) ( not ( = ?auto_209062 ?auto_209072 ) ) ( OBJ-AT ?auto_209065 ?auto_209072 ) ( IN-CITY ?auto_209068 ?auto_209070 ) ( not ( = ?auto_209062 ?auto_209068 ) ) ( OBJ-AT ?auto_209063 ?auto_209068 ) ( TRUCK-AT ?auto_209071 ?auto_209062 ) ( not ( = ?auto_209063 ?auto_209065 ) ) ( not ( = ?auto_209072 ?auto_209068 ) ) ( not ( = ?auto_209063 ?auto_209064 ) ) ( not ( = ?auto_209065 ?auto_209064 ) ) ( not ( = ?auto_209069 ?auto_209072 ) ) ( not ( = ?auto_209069 ?auto_209068 ) ) ( not ( = ?auto_209063 ?auto_209066 ) ) ( not ( = ?auto_209065 ?auto_209066 ) ) ( not ( = ?auto_209064 ?auto_209066 ) ) ( not ( = ?auto_209073 ?auto_209069 ) ) ( not ( = ?auto_209073 ?auto_209072 ) ) ( not ( = ?auto_209073 ?auto_209068 ) ) ( not ( = ?auto_209063 ?auto_209067 ) ) ( not ( = ?auto_209065 ?auto_209067 ) ) ( not ( = ?auto_209064 ?auto_209067 ) ) ( not ( = ?auto_209066 ?auto_209067 ) ) ( not ( = ?auto_209074 ?auto_209073 ) ) ( not ( = ?auto_209074 ?auto_209069 ) ) ( not ( = ?auto_209074 ?auto_209072 ) ) ( not ( = ?auto_209074 ?auto_209068 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209063 ?auto_209065 ?auto_209064 ?auto_209067 ?auto_209066 ?auto_209062 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209118 - OBJ
      ?auto_209119 - OBJ
      ?auto_209120 - OBJ
      ?auto_209121 - OBJ
      ?auto_209122 - OBJ
      ?auto_209117 - LOCATION
    )
    :vars
    (
      ?auto_209129 - LOCATION
      ?auto_209125 - CITY
      ?auto_209128 - LOCATION
      ?auto_209124 - LOCATION
      ?auto_209127 - LOCATION
      ?auto_209123 - LOCATION
      ?auto_209126 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209129 ?auto_209125 ) ( IN-CITY ?auto_209117 ?auto_209125 ) ( not ( = ?auto_209117 ?auto_209129 ) ) ( OBJ-AT ?auto_209121 ?auto_209129 ) ( IN-CITY ?auto_209128 ?auto_209125 ) ( not ( = ?auto_209117 ?auto_209128 ) ) ( OBJ-AT ?auto_209122 ?auto_209128 ) ( IN-CITY ?auto_209124 ?auto_209125 ) ( not ( = ?auto_209117 ?auto_209124 ) ) ( OBJ-AT ?auto_209119 ?auto_209124 ) ( IN-CITY ?auto_209127 ?auto_209125 ) ( not ( = ?auto_209117 ?auto_209127 ) ) ( OBJ-AT ?auto_209120 ?auto_209127 ) ( IN-CITY ?auto_209123 ?auto_209125 ) ( not ( = ?auto_209117 ?auto_209123 ) ) ( OBJ-AT ?auto_209118 ?auto_209123 ) ( TRUCK-AT ?auto_209126 ?auto_209117 ) ( not ( = ?auto_209118 ?auto_209120 ) ) ( not ( = ?auto_209127 ?auto_209123 ) ) ( not ( = ?auto_209118 ?auto_209119 ) ) ( not ( = ?auto_209120 ?auto_209119 ) ) ( not ( = ?auto_209124 ?auto_209127 ) ) ( not ( = ?auto_209124 ?auto_209123 ) ) ( not ( = ?auto_209118 ?auto_209122 ) ) ( not ( = ?auto_209120 ?auto_209122 ) ) ( not ( = ?auto_209119 ?auto_209122 ) ) ( not ( = ?auto_209128 ?auto_209124 ) ) ( not ( = ?auto_209128 ?auto_209127 ) ) ( not ( = ?auto_209128 ?auto_209123 ) ) ( not ( = ?auto_209118 ?auto_209121 ) ) ( not ( = ?auto_209120 ?auto_209121 ) ) ( not ( = ?auto_209119 ?auto_209121 ) ) ( not ( = ?auto_209122 ?auto_209121 ) ) ( not ( = ?auto_209129 ?auto_209128 ) ) ( not ( = ?auto_209129 ?auto_209124 ) ) ( not ( = ?auto_209129 ?auto_209127 ) ) ( not ( = ?auto_209129 ?auto_209123 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209118 ?auto_209120 ?auto_209119 ?auto_209121 ?auto_209122 ?auto_209117 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209290 - OBJ
      ?auto_209291 - OBJ
      ?auto_209292 - OBJ
      ?auto_209293 - OBJ
      ?auto_209294 - OBJ
      ?auto_209289 - LOCATION
    )
    :vars
    (
      ?auto_209301 - LOCATION
      ?auto_209297 - CITY
      ?auto_209300 - LOCATION
      ?auto_209296 - LOCATION
      ?auto_209299 - LOCATION
      ?auto_209295 - LOCATION
      ?auto_209298 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209301 ?auto_209297 ) ( IN-CITY ?auto_209289 ?auto_209297 ) ( not ( = ?auto_209289 ?auto_209301 ) ) ( OBJ-AT ?auto_209294 ?auto_209301 ) ( IN-CITY ?auto_209300 ?auto_209297 ) ( not ( = ?auto_209289 ?auto_209300 ) ) ( OBJ-AT ?auto_209292 ?auto_209300 ) ( IN-CITY ?auto_209296 ?auto_209297 ) ( not ( = ?auto_209289 ?auto_209296 ) ) ( OBJ-AT ?auto_209291 ?auto_209296 ) ( IN-CITY ?auto_209299 ?auto_209297 ) ( not ( = ?auto_209289 ?auto_209299 ) ) ( OBJ-AT ?auto_209293 ?auto_209299 ) ( IN-CITY ?auto_209295 ?auto_209297 ) ( not ( = ?auto_209289 ?auto_209295 ) ) ( OBJ-AT ?auto_209290 ?auto_209295 ) ( TRUCK-AT ?auto_209298 ?auto_209289 ) ( not ( = ?auto_209290 ?auto_209293 ) ) ( not ( = ?auto_209299 ?auto_209295 ) ) ( not ( = ?auto_209290 ?auto_209291 ) ) ( not ( = ?auto_209293 ?auto_209291 ) ) ( not ( = ?auto_209296 ?auto_209299 ) ) ( not ( = ?auto_209296 ?auto_209295 ) ) ( not ( = ?auto_209290 ?auto_209292 ) ) ( not ( = ?auto_209293 ?auto_209292 ) ) ( not ( = ?auto_209291 ?auto_209292 ) ) ( not ( = ?auto_209300 ?auto_209296 ) ) ( not ( = ?auto_209300 ?auto_209299 ) ) ( not ( = ?auto_209300 ?auto_209295 ) ) ( not ( = ?auto_209290 ?auto_209294 ) ) ( not ( = ?auto_209293 ?auto_209294 ) ) ( not ( = ?auto_209291 ?auto_209294 ) ) ( not ( = ?auto_209292 ?auto_209294 ) ) ( not ( = ?auto_209301 ?auto_209300 ) ) ( not ( = ?auto_209301 ?auto_209296 ) ) ( not ( = ?auto_209301 ?auto_209299 ) ) ( not ( = ?auto_209301 ?auto_209295 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209290 ?auto_209293 ?auto_209291 ?auto_209294 ?auto_209292 ?auto_209289 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209345 - OBJ
      ?auto_209346 - OBJ
      ?auto_209347 - OBJ
      ?auto_209348 - OBJ
      ?auto_209349 - OBJ
      ?auto_209344 - LOCATION
    )
    :vars
    (
      ?auto_209356 - LOCATION
      ?auto_209352 - CITY
      ?auto_209355 - LOCATION
      ?auto_209351 - LOCATION
      ?auto_209354 - LOCATION
      ?auto_209350 - LOCATION
      ?auto_209353 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209356 ?auto_209352 ) ( IN-CITY ?auto_209344 ?auto_209352 ) ( not ( = ?auto_209344 ?auto_209356 ) ) ( OBJ-AT ?auto_209348 ?auto_209356 ) ( IN-CITY ?auto_209355 ?auto_209352 ) ( not ( = ?auto_209344 ?auto_209355 ) ) ( OBJ-AT ?auto_209347 ?auto_209355 ) ( IN-CITY ?auto_209351 ?auto_209352 ) ( not ( = ?auto_209344 ?auto_209351 ) ) ( OBJ-AT ?auto_209346 ?auto_209351 ) ( IN-CITY ?auto_209354 ?auto_209352 ) ( not ( = ?auto_209344 ?auto_209354 ) ) ( OBJ-AT ?auto_209349 ?auto_209354 ) ( IN-CITY ?auto_209350 ?auto_209352 ) ( not ( = ?auto_209344 ?auto_209350 ) ) ( OBJ-AT ?auto_209345 ?auto_209350 ) ( TRUCK-AT ?auto_209353 ?auto_209344 ) ( not ( = ?auto_209345 ?auto_209349 ) ) ( not ( = ?auto_209354 ?auto_209350 ) ) ( not ( = ?auto_209345 ?auto_209346 ) ) ( not ( = ?auto_209349 ?auto_209346 ) ) ( not ( = ?auto_209351 ?auto_209354 ) ) ( not ( = ?auto_209351 ?auto_209350 ) ) ( not ( = ?auto_209345 ?auto_209347 ) ) ( not ( = ?auto_209349 ?auto_209347 ) ) ( not ( = ?auto_209346 ?auto_209347 ) ) ( not ( = ?auto_209355 ?auto_209351 ) ) ( not ( = ?auto_209355 ?auto_209354 ) ) ( not ( = ?auto_209355 ?auto_209350 ) ) ( not ( = ?auto_209345 ?auto_209348 ) ) ( not ( = ?auto_209349 ?auto_209348 ) ) ( not ( = ?auto_209346 ?auto_209348 ) ) ( not ( = ?auto_209347 ?auto_209348 ) ) ( not ( = ?auto_209356 ?auto_209355 ) ) ( not ( = ?auto_209356 ?auto_209351 ) ) ( not ( = ?auto_209356 ?auto_209354 ) ) ( not ( = ?auto_209356 ?auto_209350 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209345 ?auto_209349 ?auto_209346 ?auto_209348 ?auto_209347 ?auto_209344 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209515 - OBJ
      ?auto_209516 - OBJ
      ?auto_209517 - OBJ
      ?auto_209518 - OBJ
      ?auto_209519 - OBJ
      ?auto_209514 - LOCATION
    )
    :vars
    (
      ?auto_209526 - LOCATION
      ?auto_209522 - CITY
      ?auto_209525 - LOCATION
      ?auto_209521 - LOCATION
      ?auto_209524 - LOCATION
      ?auto_209520 - LOCATION
      ?auto_209523 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209526 ?auto_209522 ) ( IN-CITY ?auto_209514 ?auto_209522 ) ( not ( = ?auto_209514 ?auto_209526 ) ) ( OBJ-AT ?auto_209517 ?auto_209526 ) ( IN-CITY ?auto_209525 ?auto_209522 ) ( not ( = ?auto_209514 ?auto_209525 ) ) ( OBJ-AT ?auto_209519 ?auto_209525 ) ( IN-CITY ?auto_209521 ?auto_209522 ) ( not ( = ?auto_209514 ?auto_209521 ) ) ( OBJ-AT ?auto_209516 ?auto_209521 ) ( IN-CITY ?auto_209524 ?auto_209522 ) ( not ( = ?auto_209514 ?auto_209524 ) ) ( OBJ-AT ?auto_209518 ?auto_209524 ) ( IN-CITY ?auto_209520 ?auto_209522 ) ( not ( = ?auto_209514 ?auto_209520 ) ) ( OBJ-AT ?auto_209515 ?auto_209520 ) ( TRUCK-AT ?auto_209523 ?auto_209514 ) ( not ( = ?auto_209515 ?auto_209518 ) ) ( not ( = ?auto_209524 ?auto_209520 ) ) ( not ( = ?auto_209515 ?auto_209516 ) ) ( not ( = ?auto_209518 ?auto_209516 ) ) ( not ( = ?auto_209521 ?auto_209524 ) ) ( not ( = ?auto_209521 ?auto_209520 ) ) ( not ( = ?auto_209515 ?auto_209519 ) ) ( not ( = ?auto_209518 ?auto_209519 ) ) ( not ( = ?auto_209516 ?auto_209519 ) ) ( not ( = ?auto_209525 ?auto_209521 ) ) ( not ( = ?auto_209525 ?auto_209524 ) ) ( not ( = ?auto_209525 ?auto_209520 ) ) ( not ( = ?auto_209515 ?auto_209517 ) ) ( not ( = ?auto_209518 ?auto_209517 ) ) ( not ( = ?auto_209516 ?auto_209517 ) ) ( not ( = ?auto_209519 ?auto_209517 ) ) ( not ( = ?auto_209526 ?auto_209525 ) ) ( not ( = ?auto_209526 ?auto_209521 ) ) ( not ( = ?auto_209526 ?auto_209524 ) ) ( not ( = ?auto_209526 ?auto_209520 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209515 ?auto_209518 ?auto_209516 ?auto_209517 ?auto_209519 ?auto_209514 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209629 - OBJ
      ?auto_209630 - OBJ
      ?auto_209631 - OBJ
      ?auto_209632 - OBJ
      ?auto_209633 - OBJ
      ?auto_209628 - LOCATION
    )
    :vars
    (
      ?auto_209640 - LOCATION
      ?auto_209636 - CITY
      ?auto_209639 - LOCATION
      ?auto_209635 - LOCATION
      ?auto_209638 - LOCATION
      ?auto_209634 - LOCATION
      ?auto_209637 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209640 ?auto_209636 ) ( IN-CITY ?auto_209628 ?auto_209636 ) ( not ( = ?auto_209628 ?auto_209640 ) ) ( OBJ-AT ?auto_209631 ?auto_209640 ) ( IN-CITY ?auto_209639 ?auto_209636 ) ( not ( = ?auto_209628 ?auto_209639 ) ) ( OBJ-AT ?auto_209632 ?auto_209639 ) ( IN-CITY ?auto_209635 ?auto_209636 ) ( not ( = ?auto_209628 ?auto_209635 ) ) ( OBJ-AT ?auto_209630 ?auto_209635 ) ( IN-CITY ?auto_209638 ?auto_209636 ) ( not ( = ?auto_209628 ?auto_209638 ) ) ( OBJ-AT ?auto_209633 ?auto_209638 ) ( IN-CITY ?auto_209634 ?auto_209636 ) ( not ( = ?auto_209628 ?auto_209634 ) ) ( OBJ-AT ?auto_209629 ?auto_209634 ) ( TRUCK-AT ?auto_209637 ?auto_209628 ) ( not ( = ?auto_209629 ?auto_209633 ) ) ( not ( = ?auto_209638 ?auto_209634 ) ) ( not ( = ?auto_209629 ?auto_209630 ) ) ( not ( = ?auto_209633 ?auto_209630 ) ) ( not ( = ?auto_209635 ?auto_209638 ) ) ( not ( = ?auto_209635 ?auto_209634 ) ) ( not ( = ?auto_209629 ?auto_209632 ) ) ( not ( = ?auto_209633 ?auto_209632 ) ) ( not ( = ?auto_209630 ?auto_209632 ) ) ( not ( = ?auto_209639 ?auto_209635 ) ) ( not ( = ?auto_209639 ?auto_209638 ) ) ( not ( = ?auto_209639 ?auto_209634 ) ) ( not ( = ?auto_209629 ?auto_209631 ) ) ( not ( = ?auto_209633 ?auto_209631 ) ) ( not ( = ?auto_209630 ?auto_209631 ) ) ( not ( = ?auto_209632 ?auto_209631 ) ) ( not ( = ?auto_209640 ?auto_209639 ) ) ( not ( = ?auto_209640 ?auto_209635 ) ) ( not ( = ?auto_209640 ?auto_209638 ) ) ( not ( = ?auto_209640 ?auto_209634 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209629 ?auto_209633 ?auto_209630 ?auto_209631 ?auto_209632 ?auto_209628 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209916 - OBJ
      ?auto_209917 - OBJ
      ?auto_209918 - OBJ
      ?auto_209919 - OBJ
      ?auto_209920 - OBJ
      ?auto_209915 - LOCATION
    )
    :vars
    (
      ?auto_209927 - LOCATION
      ?auto_209923 - CITY
      ?auto_209926 - LOCATION
      ?auto_209922 - LOCATION
      ?auto_209925 - LOCATION
      ?auto_209921 - LOCATION
      ?auto_209924 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209927 ?auto_209923 ) ( IN-CITY ?auto_209915 ?auto_209923 ) ( not ( = ?auto_209915 ?auto_209927 ) ) ( OBJ-AT ?auto_209920 ?auto_209927 ) ( IN-CITY ?auto_209926 ?auto_209923 ) ( not ( = ?auto_209915 ?auto_209926 ) ) ( OBJ-AT ?auto_209917 ?auto_209926 ) ( IN-CITY ?auto_209922 ?auto_209923 ) ( not ( = ?auto_209915 ?auto_209922 ) ) ( OBJ-AT ?auto_209919 ?auto_209922 ) ( IN-CITY ?auto_209925 ?auto_209923 ) ( not ( = ?auto_209915 ?auto_209925 ) ) ( OBJ-AT ?auto_209918 ?auto_209925 ) ( IN-CITY ?auto_209921 ?auto_209923 ) ( not ( = ?auto_209915 ?auto_209921 ) ) ( OBJ-AT ?auto_209916 ?auto_209921 ) ( TRUCK-AT ?auto_209924 ?auto_209915 ) ( not ( = ?auto_209916 ?auto_209918 ) ) ( not ( = ?auto_209925 ?auto_209921 ) ) ( not ( = ?auto_209916 ?auto_209919 ) ) ( not ( = ?auto_209918 ?auto_209919 ) ) ( not ( = ?auto_209922 ?auto_209925 ) ) ( not ( = ?auto_209922 ?auto_209921 ) ) ( not ( = ?auto_209916 ?auto_209917 ) ) ( not ( = ?auto_209918 ?auto_209917 ) ) ( not ( = ?auto_209919 ?auto_209917 ) ) ( not ( = ?auto_209926 ?auto_209922 ) ) ( not ( = ?auto_209926 ?auto_209925 ) ) ( not ( = ?auto_209926 ?auto_209921 ) ) ( not ( = ?auto_209916 ?auto_209920 ) ) ( not ( = ?auto_209918 ?auto_209920 ) ) ( not ( = ?auto_209919 ?auto_209920 ) ) ( not ( = ?auto_209917 ?auto_209920 ) ) ( not ( = ?auto_209927 ?auto_209926 ) ) ( not ( = ?auto_209927 ?auto_209922 ) ) ( not ( = ?auto_209927 ?auto_209925 ) ) ( not ( = ?auto_209927 ?auto_209921 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209916 ?auto_209918 ?auto_209919 ?auto_209920 ?auto_209917 ?auto_209915 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_209971 - OBJ
      ?auto_209972 - OBJ
      ?auto_209973 - OBJ
      ?auto_209974 - OBJ
      ?auto_209975 - OBJ
      ?auto_209970 - LOCATION
    )
    :vars
    (
      ?auto_209982 - LOCATION
      ?auto_209978 - CITY
      ?auto_209981 - LOCATION
      ?auto_209977 - LOCATION
      ?auto_209980 - LOCATION
      ?auto_209976 - LOCATION
      ?auto_209979 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_209982 ?auto_209978 ) ( IN-CITY ?auto_209970 ?auto_209978 ) ( not ( = ?auto_209970 ?auto_209982 ) ) ( OBJ-AT ?auto_209974 ?auto_209982 ) ( IN-CITY ?auto_209981 ?auto_209978 ) ( not ( = ?auto_209970 ?auto_209981 ) ) ( OBJ-AT ?auto_209972 ?auto_209981 ) ( IN-CITY ?auto_209977 ?auto_209978 ) ( not ( = ?auto_209970 ?auto_209977 ) ) ( OBJ-AT ?auto_209975 ?auto_209977 ) ( IN-CITY ?auto_209980 ?auto_209978 ) ( not ( = ?auto_209970 ?auto_209980 ) ) ( OBJ-AT ?auto_209973 ?auto_209980 ) ( IN-CITY ?auto_209976 ?auto_209978 ) ( not ( = ?auto_209970 ?auto_209976 ) ) ( OBJ-AT ?auto_209971 ?auto_209976 ) ( TRUCK-AT ?auto_209979 ?auto_209970 ) ( not ( = ?auto_209971 ?auto_209973 ) ) ( not ( = ?auto_209980 ?auto_209976 ) ) ( not ( = ?auto_209971 ?auto_209975 ) ) ( not ( = ?auto_209973 ?auto_209975 ) ) ( not ( = ?auto_209977 ?auto_209980 ) ) ( not ( = ?auto_209977 ?auto_209976 ) ) ( not ( = ?auto_209971 ?auto_209972 ) ) ( not ( = ?auto_209973 ?auto_209972 ) ) ( not ( = ?auto_209975 ?auto_209972 ) ) ( not ( = ?auto_209981 ?auto_209977 ) ) ( not ( = ?auto_209981 ?auto_209980 ) ) ( not ( = ?auto_209981 ?auto_209976 ) ) ( not ( = ?auto_209971 ?auto_209974 ) ) ( not ( = ?auto_209973 ?auto_209974 ) ) ( not ( = ?auto_209975 ?auto_209974 ) ) ( not ( = ?auto_209972 ?auto_209974 ) ) ( not ( = ?auto_209982 ?auto_209981 ) ) ( not ( = ?auto_209982 ?auto_209977 ) ) ( not ( = ?auto_209982 ?auto_209980 ) ) ( not ( = ?auto_209982 ?auto_209976 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_209971 ?auto_209973 ?auto_209975 ?auto_209974 ?auto_209972 ?auto_209970 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_210026 - OBJ
      ?auto_210027 - OBJ
      ?auto_210028 - OBJ
      ?auto_210029 - OBJ
      ?auto_210030 - OBJ
      ?auto_210025 - LOCATION
    )
    :vars
    (
      ?auto_210037 - LOCATION
      ?auto_210033 - CITY
      ?auto_210036 - LOCATION
      ?auto_210032 - LOCATION
      ?auto_210035 - LOCATION
      ?auto_210031 - LOCATION
      ?auto_210034 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210037 ?auto_210033 ) ( IN-CITY ?auto_210025 ?auto_210033 ) ( not ( = ?auto_210025 ?auto_210037 ) ) ( OBJ-AT ?auto_210030 ?auto_210037 ) ( IN-CITY ?auto_210036 ?auto_210033 ) ( not ( = ?auto_210025 ?auto_210036 ) ) ( OBJ-AT ?auto_210027 ?auto_210036 ) ( IN-CITY ?auto_210032 ?auto_210033 ) ( not ( = ?auto_210025 ?auto_210032 ) ) ( OBJ-AT ?auto_210028 ?auto_210032 ) ( IN-CITY ?auto_210035 ?auto_210033 ) ( not ( = ?auto_210025 ?auto_210035 ) ) ( OBJ-AT ?auto_210029 ?auto_210035 ) ( IN-CITY ?auto_210031 ?auto_210033 ) ( not ( = ?auto_210025 ?auto_210031 ) ) ( OBJ-AT ?auto_210026 ?auto_210031 ) ( TRUCK-AT ?auto_210034 ?auto_210025 ) ( not ( = ?auto_210026 ?auto_210029 ) ) ( not ( = ?auto_210035 ?auto_210031 ) ) ( not ( = ?auto_210026 ?auto_210028 ) ) ( not ( = ?auto_210029 ?auto_210028 ) ) ( not ( = ?auto_210032 ?auto_210035 ) ) ( not ( = ?auto_210032 ?auto_210031 ) ) ( not ( = ?auto_210026 ?auto_210027 ) ) ( not ( = ?auto_210029 ?auto_210027 ) ) ( not ( = ?auto_210028 ?auto_210027 ) ) ( not ( = ?auto_210036 ?auto_210032 ) ) ( not ( = ?auto_210036 ?auto_210035 ) ) ( not ( = ?auto_210036 ?auto_210031 ) ) ( not ( = ?auto_210026 ?auto_210030 ) ) ( not ( = ?auto_210029 ?auto_210030 ) ) ( not ( = ?auto_210028 ?auto_210030 ) ) ( not ( = ?auto_210027 ?auto_210030 ) ) ( not ( = ?auto_210037 ?auto_210036 ) ) ( not ( = ?auto_210037 ?auto_210032 ) ) ( not ( = ?auto_210037 ?auto_210035 ) ) ( not ( = ?auto_210037 ?auto_210031 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_210026 ?auto_210029 ?auto_210028 ?auto_210030 ?auto_210027 ?auto_210025 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_210081 - OBJ
      ?auto_210082 - OBJ
      ?auto_210083 - OBJ
      ?auto_210084 - OBJ
      ?auto_210085 - OBJ
      ?auto_210080 - LOCATION
    )
    :vars
    (
      ?auto_210092 - LOCATION
      ?auto_210088 - CITY
      ?auto_210091 - LOCATION
      ?auto_210087 - LOCATION
      ?auto_210090 - LOCATION
      ?auto_210086 - LOCATION
      ?auto_210089 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210092 ?auto_210088 ) ( IN-CITY ?auto_210080 ?auto_210088 ) ( not ( = ?auto_210080 ?auto_210092 ) ) ( OBJ-AT ?auto_210084 ?auto_210092 ) ( IN-CITY ?auto_210091 ?auto_210088 ) ( not ( = ?auto_210080 ?auto_210091 ) ) ( OBJ-AT ?auto_210082 ?auto_210091 ) ( IN-CITY ?auto_210087 ?auto_210088 ) ( not ( = ?auto_210080 ?auto_210087 ) ) ( OBJ-AT ?auto_210083 ?auto_210087 ) ( IN-CITY ?auto_210090 ?auto_210088 ) ( not ( = ?auto_210080 ?auto_210090 ) ) ( OBJ-AT ?auto_210085 ?auto_210090 ) ( IN-CITY ?auto_210086 ?auto_210088 ) ( not ( = ?auto_210080 ?auto_210086 ) ) ( OBJ-AT ?auto_210081 ?auto_210086 ) ( TRUCK-AT ?auto_210089 ?auto_210080 ) ( not ( = ?auto_210081 ?auto_210085 ) ) ( not ( = ?auto_210090 ?auto_210086 ) ) ( not ( = ?auto_210081 ?auto_210083 ) ) ( not ( = ?auto_210085 ?auto_210083 ) ) ( not ( = ?auto_210087 ?auto_210090 ) ) ( not ( = ?auto_210087 ?auto_210086 ) ) ( not ( = ?auto_210081 ?auto_210082 ) ) ( not ( = ?auto_210085 ?auto_210082 ) ) ( not ( = ?auto_210083 ?auto_210082 ) ) ( not ( = ?auto_210091 ?auto_210087 ) ) ( not ( = ?auto_210091 ?auto_210090 ) ) ( not ( = ?auto_210091 ?auto_210086 ) ) ( not ( = ?auto_210081 ?auto_210084 ) ) ( not ( = ?auto_210085 ?auto_210084 ) ) ( not ( = ?auto_210083 ?auto_210084 ) ) ( not ( = ?auto_210082 ?auto_210084 ) ) ( not ( = ?auto_210092 ?auto_210091 ) ) ( not ( = ?auto_210092 ?auto_210087 ) ) ( not ( = ?auto_210092 ?auto_210090 ) ) ( not ( = ?auto_210092 ?auto_210086 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_210081 ?auto_210085 ?auto_210083 ?auto_210084 ?auto_210082 ?auto_210080 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_210368 - OBJ
      ?auto_210369 - OBJ
      ?auto_210370 - OBJ
      ?auto_210371 - OBJ
      ?auto_210372 - OBJ
      ?auto_210367 - LOCATION
    )
    :vars
    (
      ?auto_210379 - LOCATION
      ?auto_210375 - CITY
      ?auto_210378 - LOCATION
      ?auto_210374 - LOCATION
      ?auto_210377 - LOCATION
      ?auto_210373 - LOCATION
      ?auto_210376 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210379 ?auto_210375 ) ( IN-CITY ?auto_210367 ?auto_210375 ) ( not ( = ?auto_210367 ?auto_210379 ) ) ( OBJ-AT ?auto_210370 ?auto_210379 ) ( IN-CITY ?auto_210378 ?auto_210375 ) ( not ( = ?auto_210367 ?auto_210378 ) ) ( OBJ-AT ?auto_210369 ?auto_210378 ) ( IN-CITY ?auto_210374 ?auto_210375 ) ( not ( = ?auto_210367 ?auto_210374 ) ) ( OBJ-AT ?auto_210372 ?auto_210374 ) ( IN-CITY ?auto_210377 ?auto_210375 ) ( not ( = ?auto_210367 ?auto_210377 ) ) ( OBJ-AT ?auto_210371 ?auto_210377 ) ( IN-CITY ?auto_210373 ?auto_210375 ) ( not ( = ?auto_210367 ?auto_210373 ) ) ( OBJ-AT ?auto_210368 ?auto_210373 ) ( TRUCK-AT ?auto_210376 ?auto_210367 ) ( not ( = ?auto_210368 ?auto_210371 ) ) ( not ( = ?auto_210377 ?auto_210373 ) ) ( not ( = ?auto_210368 ?auto_210372 ) ) ( not ( = ?auto_210371 ?auto_210372 ) ) ( not ( = ?auto_210374 ?auto_210377 ) ) ( not ( = ?auto_210374 ?auto_210373 ) ) ( not ( = ?auto_210368 ?auto_210369 ) ) ( not ( = ?auto_210371 ?auto_210369 ) ) ( not ( = ?auto_210372 ?auto_210369 ) ) ( not ( = ?auto_210378 ?auto_210374 ) ) ( not ( = ?auto_210378 ?auto_210377 ) ) ( not ( = ?auto_210378 ?auto_210373 ) ) ( not ( = ?auto_210368 ?auto_210370 ) ) ( not ( = ?auto_210371 ?auto_210370 ) ) ( not ( = ?auto_210372 ?auto_210370 ) ) ( not ( = ?auto_210369 ?auto_210370 ) ) ( not ( = ?auto_210379 ?auto_210378 ) ) ( not ( = ?auto_210379 ?auto_210374 ) ) ( not ( = ?auto_210379 ?auto_210377 ) ) ( not ( = ?auto_210379 ?auto_210373 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_210368 ?auto_210371 ?auto_210372 ?auto_210370 ?auto_210369 ?auto_210367 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_210423 - OBJ
      ?auto_210424 - OBJ
      ?auto_210425 - OBJ
      ?auto_210426 - OBJ
      ?auto_210427 - OBJ
      ?auto_210422 - LOCATION
    )
    :vars
    (
      ?auto_210434 - LOCATION
      ?auto_210430 - CITY
      ?auto_210433 - LOCATION
      ?auto_210429 - LOCATION
      ?auto_210432 - LOCATION
      ?auto_210428 - LOCATION
      ?auto_210431 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_210434 ?auto_210430 ) ( IN-CITY ?auto_210422 ?auto_210430 ) ( not ( = ?auto_210422 ?auto_210434 ) ) ( OBJ-AT ?auto_210425 ?auto_210434 ) ( IN-CITY ?auto_210433 ?auto_210430 ) ( not ( = ?auto_210422 ?auto_210433 ) ) ( OBJ-AT ?auto_210424 ?auto_210433 ) ( IN-CITY ?auto_210429 ?auto_210430 ) ( not ( = ?auto_210422 ?auto_210429 ) ) ( OBJ-AT ?auto_210426 ?auto_210429 ) ( IN-CITY ?auto_210432 ?auto_210430 ) ( not ( = ?auto_210422 ?auto_210432 ) ) ( OBJ-AT ?auto_210427 ?auto_210432 ) ( IN-CITY ?auto_210428 ?auto_210430 ) ( not ( = ?auto_210422 ?auto_210428 ) ) ( OBJ-AT ?auto_210423 ?auto_210428 ) ( TRUCK-AT ?auto_210431 ?auto_210422 ) ( not ( = ?auto_210423 ?auto_210427 ) ) ( not ( = ?auto_210432 ?auto_210428 ) ) ( not ( = ?auto_210423 ?auto_210426 ) ) ( not ( = ?auto_210427 ?auto_210426 ) ) ( not ( = ?auto_210429 ?auto_210432 ) ) ( not ( = ?auto_210429 ?auto_210428 ) ) ( not ( = ?auto_210423 ?auto_210424 ) ) ( not ( = ?auto_210427 ?auto_210424 ) ) ( not ( = ?auto_210426 ?auto_210424 ) ) ( not ( = ?auto_210433 ?auto_210429 ) ) ( not ( = ?auto_210433 ?auto_210432 ) ) ( not ( = ?auto_210433 ?auto_210428 ) ) ( not ( = ?auto_210423 ?auto_210425 ) ) ( not ( = ?auto_210427 ?auto_210425 ) ) ( not ( = ?auto_210426 ?auto_210425 ) ) ( not ( = ?auto_210424 ?auto_210425 ) ) ( not ( = ?auto_210434 ?auto_210433 ) ) ( not ( = ?auto_210434 ?auto_210429 ) ) ( not ( = ?auto_210434 ?auto_210432 ) ) ( not ( = ?auto_210434 ?auto_210428 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_210423 ?auto_210427 ?auto_210426 ?auto_210425 ?auto_210424 ?auto_210422 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_211185 - OBJ
      ?auto_211186 - OBJ
      ?auto_211187 - OBJ
      ?auto_211188 - OBJ
      ?auto_211189 - OBJ
      ?auto_211184 - LOCATION
    )
    :vars
    (
      ?auto_211196 - LOCATION
      ?auto_211192 - CITY
      ?auto_211195 - LOCATION
      ?auto_211191 - LOCATION
      ?auto_211194 - LOCATION
      ?auto_211190 - LOCATION
      ?auto_211193 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_211196 ?auto_211192 ) ( IN-CITY ?auto_211184 ?auto_211192 ) ( not ( = ?auto_211184 ?auto_211196 ) ) ( OBJ-AT ?auto_211186 ?auto_211196 ) ( IN-CITY ?auto_211195 ?auto_211192 ) ( not ( = ?auto_211184 ?auto_211195 ) ) ( OBJ-AT ?auto_211189 ?auto_211195 ) ( IN-CITY ?auto_211191 ?auto_211192 ) ( not ( = ?auto_211184 ?auto_211191 ) ) ( OBJ-AT ?auto_211188 ?auto_211191 ) ( IN-CITY ?auto_211194 ?auto_211192 ) ( not ( = ?auto_211184 ?auto_211194 ) ) ( OBJ-AT ?auto_211187 ?auto_211194 ) ( IN-CITY ?auto_211190 ?auto_211192 ) ( not ( = ?auto_211184 ?auto_211190 ) ) ( OBJ-AT ?auto_211185 ?auto_211190 ) ( TRUCK-AT ?auto_211193 ?auto_211184 ) ( not ( = ?auto_211185 ?auto_211187 ) ) ( not ( = ?auto_211194 ?auto_211190 ) ) ( not ( = ?auto_211185 ?auto_211188 ) ) ( not ( = ?auto_211187 ?auto_211188 ) ) ( not ( = ?auto_211191 ?auto_211194 ) ) ( not ( = ?auto_211191 ?auto_211190 ) ) ( not ( = ?auto_211185 ?auto_211189 ) ) ( not ( = ?auto_211187 ?auto_211189 ) ) ( not ( = ?auto_211188 ?auto_211189 ) ) ( not ( = ?auto_211195 ?auto_211191 ) ) ( not ( = ?auto_211195 ?auto_211194 ) ) ( not ( = ?auto_211195 ?auto_211190 ) ) ( not ( = ?auto_211185 ?auto_211186 ) ) ( not ( = ?auto_211187 ?auto_211186 ) ) ( not ( = ?auto_211188 ?auto_211186 ) ) ( not ( = ?auto_211189 ?auto_211186 ) ) ( not ( = ?auto_211196 ?auto_211195 ) ) ( not ( = ?auto_211196 ?auto_211191 ) ) ( not ( = ?auto_211196 ?auto_211194 ) ) ( not ( = ?auto_211196 ?auto_211190 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_211185 ?auto_211187 ?auto_211188 ?auto_211186 ?auto_211189 ?auto_211184 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_211240 - OBJ
      ?auto_211241 - OBJ
      ?auto_211242 - OBJ
      ?auto_211243 - OBJ
      ?auto_211244 - OBJ
      ?auto_211239 - LOCATION
    )
    :vars
    (
      ?auto_211251 - LOCATION
      ?auto_211247 - CITY
      ?auto_211250 - LOCATION
      ?auto_211246 - LOCATION
      ?auto_211249 - LOCATION
      ?auto_211245 - LOCATION
      ?auto_211248 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_211251 ?auto_211247 ) ( IN-CITY ?auto_211239 ?auto_211247 ) ( not ( = ?auto_211239 ?auto_211251 ) ) ( OBJ-AT ?auto_211241 ?auto_211251 ) ( IN-CITY ?auto_211250 ?auto_211247 ) ( not ( = ?auto_211239 ?auto_211250 ) ) ( OBJ-AT ?auto_211243 ?auto_211250 ) ( IN-CITY ?auto_211246 ?auto_211247 ) ( not ( = ?auto_211239 ?auto_211246 ) ) ( OBJ-AT ?auto_211244 ?auto_211246 ) ( IN-CITY ?auto_211249 ?auto_211247 ) ( not ( = ?auto_211239 ?auto_211249 ) ) ( OBJ-AT ?auto_211242 ?auto_211249 ) ( IN-CITY ?auto_211245 ?auto_211247 ) ( not ( = ?auto_211239 ?auto_211245 ) ) ( OBJ-AT ?auto_211240 ?auto_211245 ) ( TRUCK-AT ?auto_211248 ?auto_211239 ) ( not ( = ?auto_211240 ?auto_211242 ) ) ( not ( = ?auto_211249 ?auto_211245 ) ) ( not ( = ?auto_211240 ?auto_211244 ) ) ( not ( = ?auto_211242 ?auto_211244 ) ) ( not ( = ?auto_211246 ?auto_211249 ) ) ( not ( = ?auto_211246 ?auto_211245 ) ) ( not ( = ?auto_211240 ?auto_211243 ) ) ( not ( = ?auto_211242 ?auto_211243 ) ) ( not ( = ?auto_211244 ?auto_211243 ) ) ( not ( = ?auto_211250 ?auto_211246 ) ) ( not ( = ?auto_211250 ?auto_211249 ) ) ( not ( = ?auto_211250 ?auto_211245 ) ) ( not ( = ?auto_211240 ?auto_211241 ) ) ( not ( = ?auto_211242 ?auto_211241 ) ) ( not ( = ?auto_211244 ?auto_211241 ) ) ( not ( = ?auto_211243 ?auto_211241 ) ) ( not ( = ?auto_211251 ?auto_211250 ) ) ( not ( = ?auto_211251 ?auto_211246 ) ) ( not ( = ?auto_211251 ?auto_211249 ) ) ( not ( = ?auto_211251 ?auto_211245 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_211240 ?auto_211242 ?auto_211244 ?auto_211241 ?auto_211243 ?auto_211239 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_211469 - OBJ
      ?auto_211470 - OBJ
      ?auto_211471 - OBJ
      ?auto_211472 - OBJ
      ?auto_211473 - OBJ
      ?auto_211468 - LOCATION
    )
    :vars
    (
      ?auto_211480 - LOCATION
      ?auto_211476 - CITY
      ?auto_211479 - LOCATION
      ?auto_211475 - LOCATION
      ?auto_211478 - LOCATION
      ?auto_211474 - LOCATION
      ?auto_211477 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_211480 ?auto_211476 ) ( IN-CITY ?auto_211468 ?auto_211476 ) ( not ( = ?auto_211468 ?auto_211480 ) ) ( OBJ-AT ?auto_211470 ?auto_211480 ) ( IN-CITY ?auto_211479 ?auto_211476 ) ( not ( = ?auto_211468 ?auto_211479 ) ) ( OBJ-AT ?auto_211473 ?auto_211479 ) ( IN-CITY ?auto_211475 ?auto_211476 ) ( not ( = ?auto_211468 ?auto_211475 ) ) ( OBJ-AT ?auto_211471 ?auto_211475 ) ( IN-CITY ?auto_211478 ?auto_211476 ) ( not ( = ?auto_211468 ?auto_211478 ) ) ( OBJ-AT ?auto_211472 ?auto_211478 ) ( IN-CITY ?auto_211474 ?auto_211476 ) ( not ( = ?auto_211468 ?auto_211474 ) ) ( OBJ-AT ?auto_211469 ?auto_211474 ) ( TRUCK-AT ?auto_211477 ?auto_211468 ) ( not ( = ?auto_211469 ?auto_211472 ) ) ( not ( = ?auto_211478 ?auto_211474 ) ) ( not ( = ?auto_211469 ?auto_211471 ) ) ( not ( = ?auto_211472 ?auto_211471 ) ) ( not ( = ?auto_211475 ?auto_211478 ) ) ( not ( = ?auto_211475 ?auto_211474 ) ) ( not ( = ?auto_211469 ?auto_211473 ) ) ( not ( = ?auto_211472 ?auto_211473 ) ) ( not ( = ?auto_211471 ?auto_211473 ) ) ( not ( = ?auto_211479 ?auto_211475 ) ) ( not ( = ?auto_211479 ?auto_211478 ) ) ( not ( = ?auto_211479 ?auto_211474 ) ) ( not ( = ?auto_211469 ?auto_211470 ) ) ( not ( = ?auto_211472 ?auto_211470 ) ) ( not ( = ?auto_211471 ?auto_211470 ) ) ( not ( = ?auto_211473 ?auto_211470 ) ) ( not ( = ?auto_211480 ?auto_211479 ) ) ( not ( = ?auto_211480 ?auto_211475 ) ) ( not ( = ?auto_211480 ?auto_211478 ) ) ( not ( = ?auto_211480 ?auto_211474 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_211469 ?auto_211472 ?auto_211471 ?auto_211470 ?auto_211473 ?auto_211468 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_211583 - OBJ
      ?auto_211584 - OBJ
      ?auto_211585 - OBJ
      ?auto_211586 - OBJ
      ?auto_211587 - OBJ
      ?auto_211582 - LOCATION
    )
    :vars
    (
      ?auto_211594 - LOCATION
      ?auto_211590 - CITY
      ?auto_211593 - LOCATION
      ?auto_211589 - LOCATION
      ?auto_211592 - LOCATION
      ?auto_211588 - LOCATION
      ?auto_211591 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_211594 ?auto_211590 ) ( IN-CITY ?auto_211582 ?auto_211590 ) ( not ( = ?auto_211582 ?auto_211594 ) ) ( OBJ-AT ?auto_211584 ?auto_211594 ) ( IN-CITY ?auto_211593 ?auto_211590 ) ( not ( = ?auto_211582 ?auto_211593 ) ) ( OBJ-AT ?auto_211586 ?auto_211593 ) ( IN-CITY ?auto_211589 ?auto_211590 ) ( not ( = ?auto_211582 ?auto_211589 ) ) ( OBJ-AT ?auto_211585 ?auto_211589 ) ( IN-CITY ?auto_211592 ?auto_211590 ) ( not ( = ?auto_211582 ?auto_211592 ) ) ( OBJ-AT ?auto_211587 ?auto_211592 ) ( IN-CITY ?auto_211588 ?auto_211590 ) ( not ( = ?auto_211582 ?auto_211588 ) ) ( OBJ-AT ?auto_211583 ?auto_211588 ) ( TRUCK-AT ?auto_211591 ?auto_211582 ) ( not ( = ?auto_211583 ?auto_211587 ) ) ( not ( = ?auto_211592 ?auto_211588 ) ) ( not ( = ?auto_211583 ?auto_211585 ) ) ( not ( = ?auto_211587 ?auto_211585 ) ) ( not ( = ?auto_211589 ?auto_211592 ) ) ( not ( = ?auto_211589 ?auto_211588 ) ) ( not ( = ?auto_211583 ?auto_211586 ) ) ( not ( = ?auto_211587 ?auto_211586 ) ) ( not ( = ?auto_211585 ?auto_211586 ) ) ( not ( = ?auto_211593 ?auto_211589 ) ) ( not ( = ?auto_211593 ?auto_211592 ) ) ( not ( = ?auto_211593 ?auto_211588 ) ) ( not ( = ?auto_211583 ?auto_211584 ) ) ( not ( = ?auto_211587 ?auto_211584 ) ) ( not ( = ?auto_211585 ?auto_211584 ) ) ( not ( = ?auto_211586 ?auto_211584 ) ) ( not ( = ?auto_211594 ?auto_211593 ) ) ( not ( = ?auto_211594 ?auto_211589 ) ) ( not ( = ?auto_211594 ?auto_211592 ) ) ( not ( = ?auto_211594 ?auto_211588 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_211583 ?auto_211587 ?auto_211585 ?auto_211584 ?auto_211586 ?auto_211582 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_211812 - OBJ
      ?auto_211813 - OBJ
      ?auto_211814 - OBJ
      ?auto_211815 - OBJ
      ?auto_211816 - OBJ
      ?auto_211811 - LOCATION
    )
    :vars
    (
      ?auto_211823 - LOCATION
      ?auto_211819 - CITY
      ?auto_211822 - LOCATION
      ?auto_211818 - LOCATION
      ?auto_211821 - LOCATION
      ?auto_211817 - LOCATION
      ?auto_211820 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_211823 ?auto_211819 ) ( IN-CITY ?auto_211811 ?auto_211819 ) ( not ( = ?auto_211811 ?auto_211823 ) ) ( OBJ-AT ?auto_211813 ?auto_211823 ) ( IN-CITY ?auto_211822 ?auto_211819 ) ( not ( = ?auto_211811 ?auto_211822 ) ) ( OBJ-AT ?auto_211814 ?auto_211822 ) ( IN-CITY ?auto_211818 ?auto_211819 ) ( not ( = ?auto_211811 ?auto_211818 ) ) ( OBJ-AT ?auto_211816 ?auto_211818 ) ( IN-CITY ?auto_211821 ?auto_211819 ) ( not ( = ?auto_211811 ?auto_211821 ) ) ( OBJ-AT ?auto_211815 ?auto_211821 ) ( IN-CITY ?auto_211817 ?auto_211819 ) ( not ( = ?auto_211811 ?auto_211817 ) ) ( OBJ-AT ?auto_211812 ?auto_211817 ) ( TRUCK-AT ?auto_211820 ?auto_211811 ) ( not ( = ?auto_211812 ?auto_211815 ) ) ( not ( = ?auto_211821 ?auto_211817 ) ) ( not ( = ?auto_211812 ?auto_211816 ) ) ( not ( = ?auto_211815 ?auto_211816 ) ) ( not ( = ?auto_211818 ?auto_211821 ) ) ( not ( = ?auto_211818 ?auto_211817 ) ) ( not ( = ?auto_211812 ?auto_211814 ) ) ( not ( = ?auto_211815 ?auto_211814 ) ) ( not ( = ?auto_211816 ?auto_211814 ) ) ( not ( = ?auto_211822 ?auto_211818 ) ) ( not ( = ?auto_211822 ?auto_211821 ) ) ( not ( = ?auto_211822 ?auto_211817 ) ) ( not ( = ?auto_211812 ?auto_211813 ) ) ( not ( = ?auto_211815 ?auto_211813 ) ) ( not ( = ?auto_211816 ?auto_211813 ) ) ( not ( = ?auto_211814 ?auto_211813 ) ) ( not ( = ?auto_211823 ?auto_211822 ) ) ( not ( = ?auto_211823 ?auto_211818 ) ) ( not ( = ?auto_211823 ?auto_211821 ) ) ( not ( = ?auto_211823 ?auto_211817 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_211812 ?auto_211815 ?auto_211816 ?auto_211813 ?auto_211814 ?auto_211811 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_211867 - OBJ
      ?auto_211868 - OBJ
      ?auto_211869 - OBJ
      ?auto_211870 - OBJ
      ?auto_211871 - OBJ
      ?auto_211866 - LOCATION
    )
    :vars
    (
      ?auto_211878 - LOCATION
      ?auto_211874 - CITY
      ?auto_211877 - LOCATION
      ?auto_211873 - LOCATION
      ?auto_211876 - LOCATION
      ?auto_211872 - LOCATION
      ?auto_211875 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_211878 ?auto_211874 ) ( IN-CITY ?auto_211866 ?auto_211874 ) ( not ( = ?auto_211866 ?auto_211878 ) ) ( OBJ-AT ?auto_211868 ?auto_211878 ) ( IN-CITY ?auto_211877 ?auto_211874 ) ( not ( = ?auto_211866 ?auto_211877 ) ) ( OBJ-AT ?auto_211869 ?auto_211877 ) ( IN-CITY ?auto_211873 ?auto_211874 ) ( not ( = ?auto_211866 ?auto_211873 ) ) ( OBJ-AT ?auto_211870 ?auto_211873 ) ( IN-CITY ?auto_211876 ?auto_211874 ) ( not ( = ?auto_211866 ?auto_211876 ) ) ( OBJ-AT ?auto_211871 ?auto_211876 ) ( IN-CITY ?auto_211872 ?auto_211874 ) ( not ( = ?auto_211866 ?auto_211872 ) ) ( OBJ-AT ?auto_211867 ?auto_211872 ) ( TRUCK-AT ?auto_211875 ?auto_211866 ) ( not ( = ?auto_211867 ?auto_211871 ) ) ( not ( = ?auto_211876 ?auto_211872 ) ) ( not ( = ?auto_211867 ?auto_211870 ) ) ( not ( = ?auto_211871 ?auto_211870 ) ) ( not ( = ?auto_211873 ?auto_211876 ) ) ( not ( = ?auto_211873 ?auto_211872 ) ) ( not ( = ?auto_211867 ?auto_211869 ) ) ( not ( = ?auto_211871 ?auto_211869 ) ) ( not ( = ?auto_211870 ?auto_211869 ) ) ( not ( = ?auto_211877 ?auto_211873 ) ) ( not ( = ?auto_211877 ?auto_211876 ) ) ( not ( = ?auto_211877 ?auto_211872 ) ) ( not ( = ?auto_211867 ?auto_211868 ) ) ( not ( = ?auto_211871 ?auto_211868 ) ) ( not ( = ?auto_211870 ?auto_211868 ) ) ( not ( = ?auto_211869 ?auto_211868 ) ) ( not ( = ?auto_211878 ?auto_211877 ) ) ( not ( = ?auto_211878 ?auto_211873 ) ) ( not ( = ?auto_211878 ?auto_211876 ) ) ( not ( = ?auto_211878 ?auto_211872 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_211867 ?auto_211871 ?auto_211870 ?auto_211868 ?auto_211869 ?auto_211866 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_212745 - OBJ
      ?auto_212746 - OBJ
      ?auto_212747 - OBJ
      ?auto_212748 - OBJ
      ?auto_212749 - OBJ
      ?auto_212744 - LOCATION
    )
    :vars
    (
      ?auto_212756 - LOCATION
      ?auto_212752 - CITY
      ?auto_212755 - LOCATION
      ?auto_212751 - LOCATION
      ?auto_212754 - LOCATION
      ?auto_212750 - LOCATION
      ?auto_212753 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_212756 ?auto_212752 ) ( IN-CITY ?auto_212744 ?auto_212752 ) ( not ( = ?auto_212744 ?auto_212756 ) ) ( OBJ-AT ?auto_212749 ?auto_212756 ) ( IN-CITY ?auto_212755 ?auto_212752 ) ( not ( = ?auto_212744 ?auto_212755 ) ) ( OBJ-AT ?auto_212748 ?auto_212755 ) ( IN-CITY ?auto_212751 ?auto_212752 ) ( not ( = ?auto_212744 ?auto_212751 ) ) ( OBJ-AT ?auto_212747 ?auto_212751 ) ( IN-CITY ?auto_212754 ?auto_212752 ) ( not ( = ?auto_212744 ?auto_212754 ) ) ( OBJ-AT ?auto_212745 ?auto_212754 ) ( IN-CITY ?auto_212750 ?auto_212752 ) ( not ( = ?auto_212744 ?auto_212750 ) ) ( OBJ-AT ?auto_212746 ?auto_212750 ) ( TRUCK-AT ?auto_212753 ?auto_212744 ) ( not ( = ?auto_212746 ?auto_212745 ) ) ( not ( = ?auto_212754 ?auto_212750 ) ) ( not ( = ?auto_212746 ?auto_212747 ) ) ( not ( = ?auto_212745 ?auto_212747 ) ) ( not ( = ?auto_212751 ?auto_212754 ) ) ( not ( = ?auto_212751 ?auto_212750 ) ) ( not ( = ?auto_212746 ?auto_212748 ) ) ( not ( = ?auto_212745 ?auto_212748 ) ) ( not ( = ?auto_212747 ?auto_212748 ) ) ( not ( = ?auto_212755 ?auto_212751 ) ) ( not ( = ?auto_212755 ?auto_212754 ) ) ( not ( = ?auto_212755 ?auto_212750 ) ) ( not ( = ?auto_212746 ?auto_212749 ) ) ( not ( = ?auto_212745 ?auto_212749 ) ) ( not ( = ?auto_212747 ?auto_212749 ) ) ( not ( = ?auto_212748 ?auto_212749 ) ) ( not ( = ?auto_212756 ?auto_212755 ) ) ( not ( = ?auto_212756 ?auto_212751 ) ) ( not ( = ?auto_212756 ?auto_212754 ) ) ( not ( = ?auto_212756 ?auto_212750 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_212746 ?auto_212745 ?auto_212747 ?auto_212749 ?auto_212748 ?auto_212744 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_212800 - OBJ
      ?auto_212801 - OBJ
      ?auto_212802 - OBJ
      ?auto_212803 - OBJ
      ?auto_212804 - OBJ
      ?auto_212799 - LOCATION
    )
    :vars
    (
      ?auto_212811 - LOCATION
      ?auto_212807 - CITY
      ?auto_212810 - LOCATION
      ?auto_212806 - LOCATION
      ?auto_212809 - LOCATION
      ?auto_212805 - LOCATION
      ?auto_212808 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_212811 ?auto_212807 ) ( IN-CITY ?auto_212799 ?auto_212807 ) ( not ( = ?auto_212799 ?auto_212811 ) ) ( OBJ-AT ?auto_212803 ?auto_212811 ) ( IN-CITY ?auto_212810 ?auto_212807 ) ( not ( = ?auto_212799 ?auto_212810 ) ) ( OBJ-AT ?auto_212804 ?auto_212810 ) ( IN-CITY ?auto_212806 ?auto_212807 ) ( not ( = ?auto_212799 ?auto_212806 ) ) ( OBJ-AT ?auto_212802 ?auto_212806 ) ( IN-CITY ?auto_212809 ?auto_212807 ) ( not ( = ?auto_212799 ?auto_212809 ) ) ( OBJ-AT ?auto_212800 ?auto_212809 ) ( IN-CITY ?auto_212805 ?auto_212807 ) ( not ( = ?auto_212799 ?auto_212805 ) ) ( OBJ-AT ?auto_212801 ?auto_212805 ) ( TRUCK-AT ?auto_212808 ?auto_212799 ) ( not ( = ?auto_212801 ?auto_212800 ) ) ( not ( = ?auto_212809 ?auto_212805 ) ) ( not ( = ?auto_212801 ?auto_212802 ) ) ( not ( = ?auto_212800 ?auto_212802 ) ) ( not ( = ?auto_212806 ?auto_212809 ) ) ( not ( = ?auto_212806 ?auto_212805 ) ) ( not ( = ?auto_212801 ?auto_212804 ) ) ( not ( = ?auto_212800 ?auto_212804 ) ) ( not ( = ?auto_212802 ?auto_212804 ) ) ( not ( = ?auto_212810 ?auto_212806 ) ) ( not ( = ?auto_212810 ?auto_212809 ) ) ( not ( = ?auto_212810 ?auto_212805 ) ) ( not ( = ?auto_212801 ?auto_212803 ) ) ( not ( = ?auto_212800 ?auto_212803 ) ) ( not ( = ?auto_212802 ?auto_212803 ) ) ( not ( = ?auto_212804 ?auto_212803 ) ) ( not ( = ?auto_212811 ?auto_212810 ) ) ( not ( = ?auto_212811 ?auto_212806 ) ) ( not ( = ?auto_212811 ?auto_212809 ) ) ( not ( = ?auto_212811 ?auto_212805 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_212801 ?auto_212800 ?auto_212802 ?auto_212803 ?auto_212804 ?auto_212799 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_212855 - OBJ
      ?auto_212856 - OBJ
      ?auto_212857 - OBJ
      ?auto_212858 - OBJ
      ?auto_212859 - OBJ
      ?auto_212854 - LOCATION
    )
    :vars
    (
      ?auto_212866 - LOCATION
      ?auto_212862 - CITY
      ?auto_212865 - LOCATION
      ?auto_212861 - LOCATION
      ?auto_212864 - LOCATION
      ?auto_212860 - LOCATION
      ?auto_212863 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_212866 ?auto_212862 ) ( IN-CITY ?auto_212854 ?auto_212862 ) ( not ( = ?auto_212854 ?auto_212866 ) ) ( OBJ-AT ?auto_212859 ?auto_212866 ) ( IN-CITY ?auto_212865 ?auto_212862 ) ( not ( = ?auto_212854 ?auto_212865 ) ) ( OBJ-AT ?auto_212857 ?auto_212865 ) ( IN-CITY ?auto_212861 ?auto_212862 ) ( not ( = ?auto_212854 ?auto_212861 ) ) ( OBJ-AT ?auto_212858 ?auto_212861 ) ( IN-CITY ?auto_212864 ?auto_212862 ) ( not ( = ?auto_212854 ?auto_212864 ) ) ( OBJ-AT ?auto_212855 ?auto_212864 ) ( IN-CITY ?auto_212860 ?auto_212862 ) ( not ( = ?auto_212854 ?auto_212860 ) ) ( OBJ-AT ?auto_212856 ?auto_212860 ) ( TRUCK-AT ?auto_212863 ?auto_212854 ) ( not ( = ?auto_212856 ?auto_212855 ) ) ( not ( = ?auto_212864 ?auto_212860 ) ) ( not ( = ?auto_212856 ?auto_212858 ) ) ( not ( = ?auto_212855 ?auto_212858 ) ) ( not ( = ?auto_212861 ?auto_212864 ) ) ( not ( = ?auto_212861 ?auto_212860 ) ) ( not ( = ?auto_212856 ?auto_212857 ) ) ( not ( = ?auto_212855 ?auto_212857 ) ) ( not ( = ?auto_212858 ?auto_212857 ) ) ( not ( = ?auto_212865 ?auto_212861 ) ) ( not ( = ?auto_212865 ?auto_212864 ) ) ( not ( = ?auto_212865 ?auto_212860 ) ) ( not ( = ?auto_212856 ?auto_212859 ) ) ( not ( = ?auto_212855 ?auto_212859 ) ) ( not ( = ?auto_212858 ?auto_212859 ) ) ( not ( = ?auto_212857 ?auto_212859 ) ) ( not ( = ?auto_212866 ?auto_212865 ) ) ( not ( = ?auto_212866 ?auto_212861 ) ) ( not ( = ?auto_212866 ?auto_212864 ) ) ( not ( = ?auto_212866 ?auto_212860 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_212856 ?auto_212855 ?auto_212858 ?auto_212859 ?auto_212857 ?auto_212854 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_212910 - OBJ
      ?auto_212911 - OBJ
      ?auto_212912 - OBJ
      ?auto_212913 - OBJ
      ?auto_212914 - OBJ
      ?auto_212909 - LOCATION
    )
    :vars
    (
      ?auto_212921 - LOCATION
      ?auto_212917 - CITY
      ?auto_212920 - LOCATION
      ?auto_212916 - LOCATION
      ?auto_212919 - LOCATION
      ?auto_212915 - LOCATION
      ?auto_212918 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_212921 ?auto_212917 ) ( IN-CITY ?auto_212909 ?auto_212917 ) ( not ( = ?auto_212909 ?auto_212921 ) ) ( OBJ-AT ?auto_212913 ?auto_212921 ) ( IN-CITY ?auto_212920 ?auto_212917 ) ( not ( = ?auto_212909 ?auto_212920 ) ) ( OBJ-AT ?auto_212912 ?auto_212920 ) ( IN-CITY ?auto_212916 ?auto_212917 ) ( not ( = ?auto_212909 ?auto_212916 ) ) ( OBJ-AT ?auto_212914 ?auto_212916 ) ( IN-CITY ?auto_212919 ?auto_212917 ) ( not ( = ?auto_212909 ?auto_212919 ) ) ( OBJ-AT ?auto_212910 ?auto_212919 ) ( IN-CITY ?auto_212915 ?auto_212917 ) ( not ( = ?auto_212909 ?auto_212915 ) ) ( OBJ-AT ?auto_212911 ?auto_212915 ) ( TRUCK-AT ?auto_212918 ?auto_212909 ) ( not ( = ?auto_212911 ?auto_212910 ) ) ( not ( = ?auto_212919 ?auto_212915 ) ) ( not ( = ?auto_212911 ?auto_212914 ) ) ( not ( = ?auto_212910 ?auto_212914 ) ) ( not ( = ?auto_212916 ?auto_212919 ) ) ( not ( = ?auto_212916 ?auto_212915 ) ) ( not ( = ?auto_212911 ?auto_212912 ) ) ( not ( = ?auto_212910 ?auto_212912 ) ) ( not ( = ?auto_212914 ?auto_212912 ) ) ( not ( = ?auto_212920 ?auto_212916 ) ) ( not ( = ?auto_212920 ?auto_212919 ) ) ( not ( = ?auto_212920 ?auto_212915 ) ) ( not ( = ?auto_212911 ?auto_212913 ) ) ( not ( = ?auto_212910 ?auto_212913 ) ) ( not ( = ?auto_212914 ?auto_212913 ) ) ( not ( = ?auto_212912 ?auto_212913 ) ) ( not ( = ?auto_212921 ?auto_212920 ) ) ( not ( = ?auto_212921 ?auto_212916 ) ) ( not ( = ?auto_212921 ?auto_212919 ) ) ( not ( = ?auto_212921 ?auto_212915 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_212911 ?auto_212910 ?auto_212914 ?auto_212913 ?auto_212912 ?auto_212909 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_213139 - OBJ
      ?auto_213140 - OBJ
      ?auto_213141 - OBJ
      ?auto_213142 - OBJ
      ?auto_213143 - OBJ
      ?auto_213138 - LOCATION
    )
    :vars
    (
      ?auto_213150 - LOCATION
      ?auto_213146 - CITY
      ?auto_213149 - LOCATION
      ?auto_213145 - LOCATION
      ?auto_213148 - LOCATION
      ?auto_213144 - LOCATION
      ?auto_213147 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_213150 ?auto_213146 ) ( IN-CITY ?auto_213138 ?auto_213146 ) ( not ( = ?auto_213138 ?auto_213150 ) ) ( OBJ-AT ?auto_213141 ?auto_213150 ) ( IN-CITY ?auto_213149 ?auto_213146 ) ( not ( = ?auto_213138 ?auto_213149 ) ) ( OBJ-AT ?auto_213143 ?auto_213149 ) ( IN-CITY ?auto_213145 ?auto_213146 ) ( not ( = ?auto_213138 ?auto_213145 ) ) ( OBJ-AT ?auto_213142 ?auto_213145 ) ( IN-CITY ?auto_213148 ?auto_213146 ) ( not ( = ?auto_213138 ?auto_213148 ) ) ( OBJ-AT ?auto_213139 ?auto_213148 ) ( IN-CITY ?auto_213144 ?auto_213146 ) ( not ( = ?auto_213138 ?auto_213144 ) ) ( OBJ-AT ?auto_213140 ?auto_213144 ) ( TRUCK-AT ?auto_213147 ?auto_213138 ) ( not ( = ?auto_213140 ?auto_213139 ) ) ( not ( = ?auto_213148 ?auto_213144 ) ) ( not ( = ?auto_213140 ?auto_213142 ) ) ( not ( = ?auto_213139 ?auto_213142 ) ) ( not ( = ?auto_213145 ?auto_213148 ) ) ( not ( = ?auto_213145 ?auto_213144 ) ) ( not ( = ?auto_213140 ?auto_213143 ) ) ( not ( = ?auto_213139 ?auto_213143 ) ) ( not ( = ?auto_213142 ?auto_213143 ) ) ( not ( = ?auto_213149 ?auto_213145 ) ) ( not ( = ?auto_213149 ?auto_213148 ) ) ( not ( = ?auto_213149 ?auto_213144 ) ) ( not ( = ?auto_213140 ?auto_213141 ) ) ( not ( = ?auto_213139 ?auto_213141 ) ) ( not ( = ?auto_213142 ?auto_213141 ) ) ( not ( = ?auto_213143 ?auto_213141 ) ) ( not ( = ?auto_213150 ?auto_213149 ) ) ( not ( = ?auto_213150 ?auto_213145 ) ) ( not ( = ?auto_213150 ?auto_213148 ) ) ( not ( = ?auto_213150 ?auto_213144 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_213140 ?auto_213139 ?auto_213142 ?auto_213141 ?auto_213143 ?auto_213138 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_213194 - OBJ
      ?auto_213195 - OBJ
      ?auto_213196 - OBJ
      ?auto_213197 - OBJ
      ?auto_213198 - OBJ
      ?auto_213193 - LOCATION
    )
    :vars
    (
      ?auto_213205 - LOCATION
      ?auto_213201 - CITY
      ?auto_213204 - LOCATION
      ?auto_213200 - LOCATION
      ?auto_213203 - LOCATION
      ?auto_213199 - LOCATION
      ?auto_213202 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_213205 ?auto_213201 ) ( IN-CITY ?auto_213193 ?auto_213201 ) ( not ( = ?auto_213193 ?auto_213205 ) ) ( OBJ-AT ?auto_213196 ?auto_213205 ) ( IN-CITY ?auto_213204 ?auto_213201 ) ( not ( = ?auto_213193 ?auto_213204 ) ) ( OBJ-AT ?auto_213197 ?auto_213204 ) ( IN-CITY ?auto_213200 ?auto_213201 ) ( not ( = ?auto_213193 ?auto_213200 ) ) ( OBJ-AT ?auto_213198 ?auto_213200 ) ( IN-CITY ?auto_213203 ?auto_213201 ) ( not ( = ?auto_213193 ?auto_213203 ) ) ( OBJ-AT ?auto_213194 ?auto_213203 ) ( IN-CITY ?auto_213199 ?auto_213201 ) ( not ( = ?auto_213193 ?auto_213199 ) ) ( OBJ-AT ?auto_213195 ?auto_213199 ) ( TRUCK-AT ?auto_213202 ?auto_213193 ) ( not ( = ?auto_213195 ?auto_213194 ) ) ( not ( = ?auto_213203 ?auto_213199 ) ) ( not ( = ?auto_213195 ?auto_213198 ) ) ( not ( = ?auto_213194 ?auto_213198 ) ) ( not ( = ?auto_213200 ?auto_213203 ) ) ( not ( = ?auto_213200 ?auto_213199 ) ) ( not ( = ?auto_213195 ?auto_213197 ) ) ( not ( = ?auto_213194 ?auto_213197 ) ) ( not ( = ?auto_213198 ?auto_213197 ) ) ( not ( = ?auto_213204 ?auto_213200 ) ) ( not ( = ?auto_213204 ?auto_213203 ) ) ( not ( = ?auto_213204 ?auto_213199 ) ) ( not ( = ?auto_213195 ?auto_213196 ) ) ( not ( = ?auto_213194 ?auto_213196 ) ) ( not ( = ?auto_213198 ?auto_213196 ) ) ( not ( = ?auto_213197 ?auto_213196 ) ) ( not ( = ?auto_213205 ?auto_213204 ) ) ( not ( = ?auto_213205 ?auto_213200 ) ) ( not ( = ?auto_213205 ?auto_213203 ) ) ( not ( = ?auto_213205 ?auto_213199 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_213195 ?auto_213194 ?auto_213198 ?auto_213196 ?auto_213197 ?auto_213193 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_214254 - OBJ
      ?auto_214255 - OBJ
      ?auto_214256 - OBJ
      ?auto_214257 - OBJ
      ?auto_214258 - OBJ
      ?auto_214253 - LOCATION
    )
    :vars
    (
      ?auto_214265 - LOCATION
      ?auto_214261 - CITY
      ?auto_214264 - LOCATION
      ?auto_214260 - LOCATION
      ?auto_214263 - LOCATION
      ?auto_214259 - LOCATION
      ?auto_214262 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_214265 ?auto_214261 ) ( IN-CITY ?auto_214253 ?auto_214261 ) ( not ( = ?auto_214253 ?auto_214265 ) ) ( OBJ-AT ?auto_214258 ?auto_214265 ) ( IN-CITY ?auto_214264 ?auto_214261 ) ( not ( = ?auto_214253 ?auto_214264 ) ) ( OBJ-AT ?auto_214257 ?auto_214264 ) ( IN-CITY ?auto_214260 ?auto_214261 ) ( not ( = ?auto_214253 ?auto_214260 ) ) ( OBJ-AT ?auto_214255 ?auto_214260 ) ( IN-CITY ?auto_214263 ?auto_214261 ) ( not ( = ?auto_214253 ?auto_214263 ) ) ( OBJ-AT ?auto_214254 ?auto_214263 ) ( IN-CITY ?auto_214259 ?auto_214261 ) ( not ( = ?auto_214253 ?auto_214259 ) ) ( OBJ-AT ?auto_214256 ?auto_214259 ) ( TRUCK-AT ?auto_214262 ?auto_214253 ) ( not ( = ?auto_214256 ?auto_214254 ) ) ( not ( = ?auto_214263 ?auto_214259 ) ) ( not ( = ?auto_214256 ?auto_214255 ) ) ( not ( = ?auto_214254 ?auto_214255 ) ) ( not ( = ?auto_214260 ?auto_214263 ) ) ( not ( = ?auto_214260 ?auto_214259 ) ) ( not ( = ?auto_214256 ?auto_214257 ) ) ( not ( = ?auto_214254 ?auto_214257 ) ) ( not ( = ?auto_214255 ?auto_214257 ) ) ( not ( = ?auto_214264 ?auto_214260 ) ) ( not ( = ?auto_214264 ?auto_214263 ) ) ( not ( = ?auto_214264 ?auto_214259 ) ) ( not ( = ?auto_214256 ?auto_214258 ) ) ( not ( = ?auto_214254 ?auto_214258 ) ) ( not ( = ?auto_214255 ?auto_214258 ) ) ( not ( = ?auto_214257 ?auto_214258 ) ) ( not ( = ?auto_214265 ?auto_214264 ) ) ( not ( = ?auto_214265 ?auto_214260 ) ) ( not ( = ?auto_214265 ?auto_214263 ) ) ( not ( = ?auto_214265 ?auto_214259 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_214256 ?auto_214254 ?auto_214255 ?auto_214258 ?auto_214257 ?auto_214253 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_214309 - OBJ
      ?auto_214310 - OBJ
      ?auto_214311 - OBJ
      ?auto_214312 - OBJ
      ?auto_214313 - OBJ
      ?auto_214308 - LOCATION
    )
    :vars
    (
      ?auto_214320 - LOCATION
      ?auto_214316 - CITY
      ?auto_214319 - LOCATION
      ?auto_214315 - LOCATION
      ?auto_214318 - LOCATION
      ?auto_214314 - LOCATION
      ?auto_214317 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_214320 ?auto_214316 ) ( IN-CITY ?auto_214308 ?auto_214316 ) ( not ( = ?auto_214308 ?auto_214320 ) ) ( OBJ-AT ?auto_214312 ?auto_214320 ) ( IN-CITY ?auto_214319 ?auto_214316 ) ( not ( = ?auto_214308 ?auto_214319 ) ) ( OBJ-AT ?auto_214313 ?auto_214319 ) ( IN-CITY ?auto_214315 ?auto_214316 ) ( not ( = ?auto_214308 ?auto_214315 ) ) ( OBJ-AT ?auto_214310 ?auto_214315 ) ( IN-CITY ?auto_214318 ?auto_214316 ) ( not ( = ?auto_214308 ?auto_214318 ) ) ( OBJ-AT ?auto_214309 ?auto_214318 ) ( IN-CITY ?auto_214314 ?auto_214316 ) ( not ( = ?auto_214308 ?auto_214314 ) ) ( OBJ-AT ?auto_214311 ?auto_214314 ) ( TRUCK-AT ?auto_214317 ?auto_214308 ) ( not ( = ?auto_214311 ?auto_214309 ) ) ( not ( = ?auto_214318 ?auto_214314 ) ) ( not ( = ?auto_214311 ?auto_214310 ) ) ( not ( = ?auto_214309 ?auto_214310 ) ) ( not ( = ?auto_214315 ?auto_214318 ) ) ( not ( = ?auto_214315 ?auto_214314 ) ) ( not ( = ?auto_214311 ?auto_214313 ) ) ( not ( = ?auto_214309 ?auto_214313 ) ) ( not ( = ?auto_214310 ?auto_214313 ) ) ( not ( = ?auto_214319 ?auto_214315 ) ) ( not ( = ?auto_214319 ?auto_214318 ) ) ( not ( = ?auto_214319 ?auto_214314 ) ) ( not ( = ?auto_214311 ?auto_214312 ) ) ( not ( = ?auto_214309 ?auto_214312 ) ) ( not ( = ?auto_214310 ?auto_214312 ) ) ( not ( = ?auto_214313 ?auto_214312 ) ) ( not ( = ?auto_214320 ?auto_214319 ) ) ( not ( = ?auto_214320 ?auto_214315 ) ) ( not ( = ?auto_214320 ?auto_214318 ) ) ( not ( = ?auto_214320 ?auto_214314 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_214311 ?auto_214309 ?auto_214310 ?auto_214312 ?auto_214313 ?auto_214308 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_214598 - OBJ
      ?auto_214599 - OBJ
      ?auto_214600 - OBJ
      ?auto_214601 - OBJ
      ?auto_214602 - OBJ
      ?auto_214597 - LOCATION
    )
    :vars
    (
      ?auto_214609 - LOCATION
      ?auto_214605 - CITY
      ?auto_214608 - LOCATION
      ?auto_214604 - LOCATION
      ?auto_214607 - LOCATION
      ?auto_214603 - LOCATION
      ?auto_214606 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_214609 ?auto_214605 ) ( IN-CITY ?auto_214597 ?auto_214605 ) ( not ( = ?auto_214597 ?auto_214609 ) ) ( OBJ-AT ?auto_214602 ?auto_214609 ) ( IN-CITY ?auto_214608 ?auto_214605 ) ( not ( = ?auto_214597 ?auto_214608 ) ) ( OBJ-AT ?auto_214600 ?auto_214608 ) ( IN-CITY ?auto_214604 ?auto_214605 ) ( not ( = ?auto_214597 ?auto_214604 ) ) ( OBJ-AT ?auto_214599 ?auto_214604 ) ( IN-CITY ?auto_214607 ?auto_214605 ) ( not ( = ?auto_214597 ?auto_214607 ) ) ( OBJ-AT ?auto_214598 ?auto_214607 ) ( IN-CITY ?auto_214603 ?auto_214605 ) ( not ( = ?auto_214597 ?auto_214603 ) ) ( OBJ-AT ?auto_214601 ?auto_214603 ) ( TRUCK-AT ?auto_214606 ?auto_214597 ) ( not ( = ?auto_214601 ?auto_214598 ) ) ( not ( = ?auto_214607 ?auto_214603 ) ) ( not ( = ?auto_214601 ?auto_214599 ) ) ( not ( = ?auto_214598 ?auto_214599 ) ) ( not ( = ?auto_214604 ?auto_214607 ) ) ( not ( = ?auto_214604 ?auto_214603 ) ) ( not ( = ?auto_214601 ?auto_214600 ) ) ( not ( = ?auto_214598 ?auto_214600 ) ) ( not ( = ?auto_214599 ?auto_214600 ) ) ( not ( = ?auto_214608 ?auto_214604 ) ) ( not ( = ?auto_214608 ?auto_214607 ) ) ( not ( = ?auto_214608 ?auto_214603 ) ) ( not ( = ?auto_214601 ?auto_214602 ) ) ( not ( = ?auto_214598 ?auto_214602 ) ) ( not ( = ?auto_214599 ?auto_214602 ) ) ( not ( = ?auto_214600 ?auto_214602 ) ) ( not ( = ?auto_214609 ?auto_214608 ) ) ( not ( = ?auto_214609 ?auto_214604 ) ) ( not ( = ?auto_214609 ?auto_214607 ) ) ( not ( = ?auto_214609 ?auto_214603 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_214601 ?auto_214598 ?auto_214599 ?auto_214602 ?auto_214600 ?auto_214597 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_214653 - OBJ
      ?auto_214654 - OBJ
      ?auto_214655 - OBJ
      ?auto_214656 - OBJ
      ?auto_214657 - OBJ
      ?auto_214652 - LOCATION
    )
    :vars
    (
      ?auto_214664 - LOCATION
      ?auto_214660 - CITY
      ?auto_214663 - LOCATION
      ?auto_214659 - LOCATION
      ?auto_214662 - LOCATION
      ?auto_214658 - LOCATION
      ?auto_214661 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_214664 ?auto_214660 ) ( IN-CITY ?auto_214652 ?auto_214660 ) ( not ( = ?auto_214652 ?auto_214664 ) ) ( OBJ-AT ?auto_214656 ?auto_214664 ) ( IN-CITY ?auto_214663 ?auto_214660 ) ( not ( = ?auto_214652 ?auto_214663 ) ) ( OBJ-AT ?auto_214655 ?auto_214663 ) ( IN-CITY ?auto_214659 ?auto_214660 ) ( not ( = ?auto_214652 ?auto_214659 ) ) ( OBJ-AT ?auto_214654 ?auto_214659 ) ( IN-CITY ?auto_214662 ?auto_214660 ) ( not ( = ?auto_214652 ?auto_214662 ) ) ( OBJ-AT ?auto_214653 ?auto_214662 ) ( IN-CITY ?auto_214658 ?auto_214660 ) ( not ( = ?auto_214652 ?auto_214658 ) ) ( OBJ-AT ?auto_214657 ?auto_214658 ) ( TRUCK-AT ?auto_214661 ?auto_214652 ) ( not ( = ?auto_214657 ?auto_214653 ) ) ( not ( = ?auto_214662 ?auto_214658 ) ) ( not ( = ?auto_214657 ?auto_214654 ) ) ( not ( = ?auto_214653 ?auto_214654 ) ) ( not ( = ?auto_214659 ?auto_214662 ) ) ( not ( = ?auto_214659 ?auto_214658 ) ) ( not ( = ?auto_214657 ?auto_214655 ) ) ( not ( = ?auto_214653 ?auto_214655 ) ) ( not ( = ?auto_214654 ?auto_214655 ) ) ( not ( = ?auto_214663 ?auto_214659 ) ) ( not ( = ?auto_214663 ?auto_214662 ) ) ( not ( = ?auto_214663 ?auto_214658 ) ) ( not ( = ?auto_214657 ?auto_214656 ) ) ( not ( = ?auto_214653 ?auto_214656 ) ) ( not ( = ?auto_214654 ?auto_214656 ) ) ( not ( = ?auto_214655 ?auto_214656 ) ) ( not ( = ?auto_214664 ?auto_214663 ) ) ( not ( = ?auto_214664 ?auto_214659 ) ) ( not ( = ?auto_214664 ?auto_214662 ) ) ( not ( = ?auto_214664 ?auto_214658 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_214657 ?auto_214653 ?auto_214654 ?auto_214656 ?auto_214655 ?auto_214652 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_214764 - OBJ
      ?auto_214765 - OBJ
      ?auto_214766 - OBJ
      ?auto_214767 - OBJ
      ?auto_214768 - OBJ
      ?auto_214763 - LOCATION
    )
    :vars
    (
      ?auto_214775 - LOCATION
      ?auto_214771 - CITY
      ?auto_214774 - LOCATION
      ?auto_214770 - LOCATION
      ?auto_214773 - LOCATION
      ?auto_214769 - LOCATION
      ?auto_214772 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_214775 ?auto_214771 ) ( IN-CITY ?auto_214763 ?auto_214771 ) ( not ( = ?auto_214763 ?auto_214775 ) ) ( OBJ-AT ?auto_214766 ?auto_214775 ) ( IN-CITY ?auto_214774 ?auto_214771 ) ( not ( = ?auto_214763 ?auto_214774 ) ) ( OBJ-AT ?auto_214768 ?auto_214774 ) ( IN-CITY ?auto_214770 ?auto_214771 ) ( not ( = ?auto_214763 ?auto_214770 ) ) ( OBJ-AT ?auto_214765 ?auto_214770 ) ( IN-CITY ?auto_214773 ?auto_214771 ) ( not ( = ?auto_214763 ?auto_214773 ) ) ( OBJ-AT ?auto_214764 ?auto_214773 ) ( IN-CITY ?auto_214769 ?auto_214771 ) ( not ( = ?auto_214763 ?auto_214769 ) ) ( OBJ-AT ?auto_214767 ?auto_214769 ) ( TRUCK-AT ?auto_214772 ?auto_214763 ) ( not ( = ?auto_214767 ?auto_214764 ) ) ( not ( = ?auto_214773 ?auto_214769 ) ) ( not ( = ?auto_214767 ?auto_214765 ) ) ( not ( = ?auto_214764 ?auto_214765 ) ) ( not ( = ?auto_214770 ?auto_214773 ) ) ( not ( = ?auto_214770 ?auto_214769 ) ) ( not ( = ?auto_214767 ?auto_214768 ) ) ( not ( = ?auto_214764 ?auto_214768 ) ) ( not ( = ?auto_214765 ?auto_214768 ) ) ( not ( = ?auto_214774 ?auto_214770 ) ) ( not ( = ?auto_214774 ?auto_214773 ) ) ( not ( = ?auto_214774 ?auto_214769 ) ) ( not ( = ?auto_214767 ?auto_214766 ) ) ( not ( = ?auto_214764 ?auto_214766 ) ) ( not ( = ?auto_214765 ?auto_214766 ) ) ( not ( = ?auto_214768 ?auto_214766 ) ) ( not ( = ?auto_214775 ?auto_214774 ) ) ( not ( = ?auto_214775 ?auto_214770 ) ) ( not ( = ?auto_214775 ?auto_214773 ) ) ( not ( = ?auto_214775 ?auto_214769 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_214767 ?auto_214764 ?auto_214765 ?auto_214766 ?auto_214768 ?auto_214763 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_214937 - OBJ
      ?auto_214938 - OBJ
      ?auto_214939 - OBJ
      ?auto_214940 - OBJ
      ?auto_214941 - OBJ
      ?auto_214936 - LOCATION
    )
    :vars
    (
      ?auto_214948 - LOCATION
      ?auto_214944 - CITY
      ?auto_214947 - LOCATION
      ?auto_214943 - LOCATION
      ?auto_214946 - LOCATION
      ?auto_214942 - LOCATION
      ?auto_214945 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_214948 ?auto_214944 ) ( IN-CITY ?auto_214936 ?auto_214944 ) ( not ( = ?auto_214936 ?auto_214948 ) ) ( OBJ-AT ?auto_214939 ?auto_214948 ) ( IN-CITY ?auto_214947 ?auto_214944 ) ( not ( = ?auto_214936 ?auto_214947 ) ) ( OBJ-AT ?auto_214940 ?auto_214947 ) ( IN-CITY ?auto_214943 ?auto_214944 ) ( not ( = ?auto_214936 ?auto_214943 ) ) ( OBJ-AT ?auto_214938 ?auto_214943 ) ( IN-CITY ?auto_214946 ?auto_214944 ) ( not ( = ?auto_214936 ?auto_214946 ) ) ( OBJ-AT ?auto_214937 ?auto_214946 ) ( IN-CITY ?auto_214942 ?auto_214944 ) ( not ( = ?auto_214936 ?auto_214942 ) ) ( OBJ-AT ?auto_214941 ?auto_214942 ) ( TRUCK-AT ?auto_214945 ?auto_214936 ) ( not ( = ?auto_214941 ?auto_214937 ) ) ( not ( = ?auto_214946 ?auto_214942 ) ) ( not ( = ?auto_214941 ?auto_214938 ) ) ( not ( = ?auto_214937 ?auto_214938 ) ) ( not ( = ?auto_214943 ?auto_214946 ) ) ( not ( = ?auto_214943 ?auto_214942 ) ) ( not ( = ?auto_214941 ?auto_214940 ) ) ( not ( = ?auto_214937 ?auto_214940 ) ) ( not ( = ?auto_214938 ?auto_214940 ) ) ( not ( = ?auto_214947 ?auto_214943 ) ) ( not ( = ?auto_214947 ?auto_214946 ) ) ( not ( = ?auto_214947 ?auto_214942 ) ) ( not ( = ?auto_214941 ?auto_214939 ) ) ( not ( = ?auto_214937 ?auto_214939 ) ) ( not ( = ?auto_214938 ?auto_214939 ) ) ( not ( = ?auto_214940 ?auto_214939 ) ) ( not ( = ?auto_214948 ?auto_214947 ) ) ( not ( = ?auto_214948 ?auto_214943 ) ) ( not ( = ?auto_214948 ?auto_214946 ) ) ( not ( = ?auto_214948 ?auto_214942 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_214941 ?auto_214937 ?auto_214938 ?auto_214939 ?auto_214940 ?auto_214936 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_215107 - OBJ
      ?auto_215108 - OBJ
      ?auto_215109 - OBJ
      ?auto_215110 - OBJ
      ?auto_215111 - OBJ
      ?auto_215106 - LOCATION
    )
    :vars
    (
      ?auto_215118 - LOCATION
      ?auto_215114 - CITY
      ?auto_215117 - LOCATION
      ?auto_215113 - LOCATION
      ?auto_215116 - LOCATION
      ?auto_215112 - LOCATION
      ?auto_215115 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_215118 ?auto_215114 ) ( IN-CITY ?auto_215106 ?auto_215114 ) ( not ( = ?auto_215106 ?auto_215118 ) ) ( OBJ-AT ?auto_215111 ?auto_215118 ) ( IN-CITY ?auto_215117 ?auto_215114 ) ( not ( = ?auto_215106 ?auto_215117 ) ) ( OBJ-AT ?auto_215108 ?auto_215117 ) ( IN-CITY ?auto_215113 ?auto_215114 ) ( not ( = ?auto_215106 ?auto_215113 ) ) ( OBJ-AT ?auto_215110 ?auto_215113 ) ( IN-CITY ?auto_215116 ?auto_215114 ) ( not ( = ?auto_215106 ?auto_215116 ) ) ( OBJ-AT ?auto_215107 ?auto_215116 ) ( IN-CITY ?auto_215112 ?auto_215114 ) ( not ( = ?auto_215106 ?auto_215112 ) ) ( OBJ-AT ?auto_215109 ?auto_215112 ) ( TRUCK-AT ?auto_215115 ?auto_215106 ) ( not ( = ?auto_215109 ?auto_215107 ) ) ( not ( = ?auto_215116 ?auto_215112 ) ) ( not ( = ?auto_215109 ?auto_215110 ) ) ( not ( = ?auto_215107 ?auto_215110 ) ) ( not ( = ?auto_215113 ?auto_215116 ) ) ( not ( = ?auto_215113 ?auto_215112 ) ) ( not ( = ?auto_215109 ?auto_215108 ) ) ( not ( = ?auto_215107 ?auto_215108 ) ) ( not ( = ?auto_215110 ?auto_215108 ) ) ( not ( = ?auto_215117 ?auto_215113 ) ) ( not ( = ?auto_215117 ?auto_215116 ) ) ( not ( = ?auto_215117 ?auto_215112 ) ) ( not ( = ?auto_215109 ?auto_215111 ) ) ( not ( = ?auto_215107 ?auto_215111 ) ) ( not ( = ?auto_215110 ?auto_215111 ) ) ( not ( = ?auto_215108 ?auto_215111 ) ) ( not ( = ?auto_215118 ?auto_215117 ) ) ( not ( = ?auto_215118 ?auto_215113 ) ) ( not ( = ?auto_215118 ?auto_215116 ) ) ( not ( = ?auto_215118 ?auto_215112 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_215109 ?auto_215107 ?auto_215110 ?auto_215111 ?auto_215108 ?auto_215106 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_215162 - OBJ
      ?auto_215163 - OBJ
      ?auto_215164 - OBJ
      ?auto_215165 - OBJ
      ?auto_215166 - OBJ
      ?auto_215161 - LOCATION
    )
    :vars
    (
      ?auto_215173 - LOCATION
      ?auto_215169 - CITY
      ?auto_215172 - LOCATION
      ?auto_215168 - LOCATION
      ?auto_215171 - LOCATION
      ?auto_215167 - LOCATION
      ?auto_215170 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_215173 ?auto_215169 ) ( IN-CITY ?auto_215161 ?auto_215169 ) ( not ( = ?auto_215161 ?auto_215173 ) ) ( OBJ-AT ?auto_215165 ?auto_215173 ) ( IN-CITY ?auto_215172 ?auto_215169 ) ( not ( = ?auto_215161 ?auto_215172 ) ) ( OBJ-AT ?auto_215163 ?auto_215172 ) ( IN-CITY ?auto_215168 ?auto_215169 ) ( not ( = ?auto_215161 ?auto_215168 ) ) ( OBJ-AT ?auto_215166 ?auto_215168 ) ( IN-CITY ?auto_215171 ?auto_215169 ) ( not ( = ?auto_215161 ?auto_215171 ) ) ( OBJ-AT ?auto_215162 ?auto_215171 ) ( IN-CITY ?auto_215167 ?auto_215169 ) ( not ( = ?auto_215161 ?auto_215167 ) ) ( OBJ-AT ?auto_215164 ?auto_215167 ) ( TRUCK-AT ?auto_215170 ?auto_215161 ) ( not ( = ?auto_215164 ?auto_215162 ) ) ( not ( = ?auto_215171 ?auto_215167 ) ) ( not ( = ?auto_215164 ?auto_215166 ) ) ( not ( = ?auto_215162 ?auto_215166 ) ) ( not ( = ?auto_215168 ?auto_215171 ) ) ( not ( = ?auto_215168 ?auto_215167 ) ) ( not ( = ?auto_215164 ?auto_215163 ) ) ( not ( = ?auto_215162 ?auto_215163 ) ) ( not ( = ?auto_215166 ?auto_215163 ) ) ( not ( = ?auto_215172 ?auto_215168 ) ) ( not ( = ?auto_215172 ?auto_215171 ) ) ( not ( = ?auto_215172 ?auto_215167 ) ) ( not ( = ?auto_215164 ?auto_215165 ) ) ( not ( = ?auto_215162 ?auto_215165 ) ) ( not ( = ?auto_215166 ?auto_215165 ) ) ( not ( = ?auto_215163 ?auto_215165 ) ) ( not ( = ?auto_215173 ?auto_215172 ) ) ( not ( = ?auto_215173 ?auto_215168 ) ) ( not ( = ?auto_215173 ?auto_215171 ) ) ( not ( = ?auto_215173 ?auto_215167 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_215164 ?auto_215162 ?auto_215166 ?auto_215165 ?auto_215163 ?auto_215161 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_215334 - OBJ
      ?auto_215335 - OBJ
      ?auto_215336 - OBJ
      ?auto_215337 - OBJ
      ?auto_215338 - OBJ
      ?auto_215333 - LOCATION
    )
    :vars
    (
      ?auto_215345 - LOCATION
      ?auto_215341 - CITY
      ?auto_215344 - LOCATION
      ?auto_215340 - LOCATION
      ?auto_215343 - LOCATION
      ?auto_215339 - LOCATION
      ?auto_215342 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_215345 ?auto_215341 ) ( IN-CITY ?auto_215333 ?auto_215341 ) ( not ( = ?auto_215333 ?auto_215345 ) ) ( OBJ-AT ?auto_215338 ?auto_215345 ) ( IN-CITY ?auto_215344 ?auto_215341 ) ( not ( = ?auto_215333 ?auto_215344 ) ) ( OBJ-AT ?auto_215335 ?auto_215344 ) ( IN-CITY ?auto_215340 ?auto_215341 ) ( not ( = ?auto_215333 ?auto_215340 ) ) ( OBJ-AT ?auto_215336 ?auto_215340 ) ( IN-CITY ?auto_215343 ?auto_215341 ) ( not ( = ?auto_215333 ?auto_215343 ) ) ( OBJ-AT ?auto_215334 ?auto_215343 ) ( IN-CITY ?auto_215339 ?auto_215341 ) ( not ( = ?auto_215333 ?auto_215339 ) ) ( OBJ-AT ?auto_215337 ?auto_215339 ) ( TRUCK-AT ?auto_215342 ?auto_215333 ) ( not ( = ?auto_215337 ?auto_215334 ) ) ( not ( = ?auto_215343 ?auto_215339 ) ) ( not ( = ?auto_215337 ?auto_215336 ) ) ( not ( = ?auto_215334 ?auto_215336 ) ) ( not ( = ?auto_215340 ?auto_215343 ) ) ( not ( = ?auto_215340 ?auto_215339 ) ) ( not ( = ?auto_215337 ?auto_215335 ) ) ( not ( = ?auto_215334 ?auto_215335 ) ) ( not ( = ?auto_215336 ?auto_215335 ) ) ( not ( = ?auto_215344 ?auto_215340 ) ) ( not ( = ?auto_215344 ?auto_215343 ) ) ( not ( = ?auto_215344 ?auto_215339 ) ) ( not ( = ?auto_215337 ?auto_215338 ) ) ( not ( = ?auto_215334 ?auto_215338 ) ) ( not ( = ?auto_215336 ?auto_215338 ) ) ( not ( = ?auto_215335 ?auto_215338 ) ) ( not ( = ?auto_215345 ?auto_215344 ) ) ( not ( = ?auto_215345 ?auto_215340 ) ) ( not ( = ?auto_215345 ?auto_215343 ) ) ( not ( = ?auto_215345 ?auto_215339 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_215337 ?auto_215334 ?auto_215336 ?auto_215338 ?auto_215335 ?auto_215333 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_215389 - OBJ
      ?auto_215390 - OBJ
      ?auto_215391 - OBJ
      ?auto_215392 - OBJ
      ?auto_215393 - OBJ
      ?auto_215388 - LOCATION
    )
    :vars
    (
      ?auto_215400 - LOCATION
      ?auto_215396 - CITY
      ?auto_215399 - LOCATION
      ?auto_215395 - LOCATION
      ?auto_215398 - LOCATION
      ?auto_215394 - LOCATION
      ?auto_215397 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_215400 ?auto_215396 ) ( IN-CITY ?auto_215388 ?auto_215396 ) ( not ( = ?auto_215388 ?auto_215400 ) ) ( OBJ-AT ?auto_215392 ?auto_215400 ) ( IN-CITY ?auto_215399 ?auto_215396 ) ( not ( = ?auto_215388 ?auto_215399 ) ) ( OBJ-AT ?auto_215390 ?auto_215399 ) ( IN-CITY ?auto_215395 ?auto_215396 ) ( not ( = ?auto_215388 ?auto_215395 ) ) ( OBJ-AT ?auto_215391 ?auto_215395 ) ( IN-CITY ?auto_215398 ?auto_215396 ) ( not ( = ?auto_215388 ?auto_215398 ) ) ( OBJ-AT ?auto_215389 ?auto_215398 ) ( IN-CITY ?auto_215394 ?auto_215396 ) ( not ( = ?auto_215388 ?auto_215394 ) ) ( OBJ-AT ?auto_215393 ?auto_215394 ) ( TRUCK-AT ?auto_215397 ?auto_215388 ) ( not ( = ?auto_215393 ?auto_215389 ) ) ( not ( = ?auto_215398 ?auto_215394 ) ) ( not ( = ?auto_215393 ?auto_215391 ) ) ( not ( = ?auto_215389 ?auto_215391 ) ) ( not ( = ?auto_215395 ?auto_215398 ) ) ( not ( = ?auto_215395 ?auto_215394 ) ) ( not ( = ?auto_215393 ?auto_215390 ) ) ( not ( = ?auto_215389 ?auto_215390 ) ) ( not ( = ?auto_215391 ?auto_215390 ) ) ( not ( = ?auto_215399 ?auto_215395 ) ) ( not ( = ?auto_215399 ?auto_215398 ) ) ( not ( = ?auto_215399 ?auto_215394 ) ) ( not ( = ?auto_215393 ?auto_215392 ) ) ( not ( = ?auto_215389 ?auto_215392 ) ) ( not ( = ?auto_215391 ?auto_215392 ) ) ( not ( = ?auto_215390 ?auto_215392 ) ) ( not ( = ?auto_215400 ?auto_215399 ) ) ( not ( = ?auto_215400 ?auto_215395 ) ) ( not ( = ?auto_215400 ?auto_215398 ) ) ( not ( = ?auto_215400 ?auto_215394 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_215393 ?auto_215389 ?auto_215391 ?auto_215392 ?auto_215390 ?auto_215388 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_215617 - OBJ
      ?auto_215618 - OBJ
      ?auto_215619 - OBJ
      ?auto_215620 - OBJ
      ?auto_215621 - OBJ
      ?auto_215616 - LOCATION
    )
    :vars
    (
      ?auto_215628 - LOCATION
      ?auto_215624 - CITY
      ?auto_215627 - LOCATION
      ?auto_215623 - LOCATION
      ?auto_215626 - LOCATION
      ?auto_215622 - LOCATION
      ?auto_215625 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_215628 ?auto_215624 ) ( IN-CITY ?auto_215616 ?auto_215624 ) ( not ( = ?auto_215616 ?auto_215628 ) ) ( OBJ-AT ?auto_215619 ?auto_215628 ) ( IN-CITY ?auto_215627 ?auto_215624 ) ( not ( = ?auto_215616 ?auto_215627 ) ) ( OBJ-AT ?auto_215618 ?auto_215627 ) ( IN-CITY ?auto_215623 ?auto_215624 ) ( not ( = ?auto_215616 ?auto_215623 ) ) ( OBJ-AT ?auto_215621 ?auto_215623 ) ( IN-CITY ?auto_215626 ?auto_215624 ) ( not ( = ?auto_215616 ?auto_215626 ) ) ( OBJ-AT ?auto_215617 ?auto_215626 ) ( IN-CITY ?auto_215622 ?auto_215624 ) ( not ( = ?auto_215616 ?auto_215622 ) ) ( OBJ-AT ?auto_215620 ?auto_215622 ) ( TRUCK-AT ?auto_215625 ?auto_215616 ) ( not ( = ?auto_215620 ?auto_215617 ) ) ( not ( = ?auto_215626 ?auto_215622 ) ) ( not ( = ?auto_215620 ?auto_215621 ) ) ( not ( = ?auto_215617 ?auto_215621 ) ) ( not ( = ?auto_215623 ?auto_215626 ) ) ( not ( = ?auto_215623 ?auto_215622 ) ) ( not ( = ?auto_215620 ?auto_215618 ) ) ( not ( = ?auto_215617 ?auto_215618 ) ) ( not ( = ?auto_215621 ?auto_215618 ) ) ( not ( = ?auto_215627 ?auto_215623 ) ) ( not ( = ?auto_215627 ?auto_215626 ) ) ( not ( = ?auto_215627 ?auto_215622 ) ) ( not ( = ?auto_215620 ?auto_215619 ) ) ( not ( = ?auto_215617 ?auto_215619 ) ) ( not ( = ?auto_215621 ?auto_215619 ) ) ( not ( = ?auto_215618 ?auto_215619 ) ) ( not ( = ?auto_215628 ?auto_215627 ) ) ( not ( = ?auto_215628 ?auto_215623 ) ) ( not ( = ?auto_215628 ?auto_215626 ) ) ( not ( = ?auto_215628 ?auto_215622 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_215620 ?auto_215617 ?auto_215621 ?auto_215619 ?auto_215618 ?auto_215616 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_215731 - OBJ
      ?auto_215732 - OBJ
      ?auto_215733 - OBJ
      ?auto_215734 - OBJ
      ?auto_215735 - OBJ
      ?auto_215730 - LOCATION
    )
    :vars
    (
      ?auto_215742 - LOCATION
      ?auto_215738 - CITY
      ?auto_215741 - LOCATION
      ?auto_215737 - LOCATION
      ?auto_215740 - LOCATION
      ?auto_215736 - LOCATION
      ?auto_215739 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_215742 ?auto_215738 ) ( IN-CITY ?auto_215730 ?auto_215738 ) ( not ( = ?auto_215730 ?auto_215742 ) ) ( OBJ-AT ?auto_215733 ?auto_215742 ) ( IN-CITY ?auto_215741 ?auto_215738 ) ( not ( = ?auto_215730 ?auto_215741 ) ) ( OBJ-AT ?auto_215732 ?auto_215741 ) ( IN-CITY ?auto_215737 ?auto_215738 ) ( not ( = ?auto_215730 ?auto_215737 ) ) ( OBJ-AT ?auto_215734 ?auto_215737 ) ( IN-CITY ?auto_215740 ?auto_215738 ) ( not ( = ?auto_215730 ?auto_215740 ) ) ( OBJ-AT ?auto_215731 ?auto_215740 ) ( IN-CITY ?auto_215736 ?auto_215738 ) ( not ( = ?auto_215730 ?auto_215736 ) ) ( OBJ-AT ?auto_215735 ?auto_215736 ) ( TRUCK-AT ?auto_215739 ?auto_215730 ) ( not ( = ?auto_215735 ?auto_215731 ) ) ( not ( = ?auto_215740 ?auto_215736 ) ) ( not ( = ?auto_215735 ?auto_215734 ) ) ( not ( = ?auto_215731 ?auto_215734 ) ) ( not ( = ?auto_215737 ?auto_215740 ) ) ( not ( = ?auto_215737 ?auto_215736 ) ) ( not ( = ?auto_215735 ?auto_215732 ) ) ( not ( = ?auto_215731 ?auto_215732 ) ) ( not ( = ?auto_215734 ?auto_215732 ) ) ( not ( = ?auto_215741 ?auto_215737 ) ) ( not ( = ?auto_215741 ?auto_215740 ) ) ( not ( = ?auto_215741 ?auto_215736 ) ) ( not ( = ?auto_215735 ?auto_215733 ) ) ( not ( = ?auto_215731 ?auto_215733 ) ) ( not ( = ?auto_215734 ?auto_215733 ) ) ( not ( = ?auto_215732 ?auto_215733 ) ) ( not ( = ?auto_215742 ?auto_215741 ) ) ( not ( = ?auto_215742 ?auto_215737 ) ) ( not ( = ?auto_215742 ?auto_215740 ) ) ( not ( = ?auto_215742 ?auto_215736 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_215735 ?auto_215731 ?auto_215734 ?auto_215733 ?auto_215732 ?auto_215730 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216134 - OBJ
      ?auto_216135 - OBJ
      ?auto_216136 - OBJ
      ?auto_216137 - OBJ
      ?auto_216138 - OBJ
      ?auto_216133 - LOCATION
    )
    :vars
    (
      ?auto_216145 - LOCATION
      ?auto_216141 - CITY
      ?auto_216144 - LOCATION
      ?auto_216140 - LOCATION
      ?auto_216143 - LOCATION
      ?auto_216139 - LOCATION
      ?auto_216142 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_216145 ?auto_216141 ) ( IN-CITY ?auto_216133 ?auto_216141 ) ( not ( = ?auto_216133 ?auto_216145 ) ) ( OBJ-AT ?auto_216135 ?auto_216145 ) ( IN-CITY ?auto_216144 ?auto_216141 ) ( not ( = ?auto_216133 ?auto_216144 ) ) ( OBJ-AT ?auto_216138 ?auto_216144 ) ( IN-CITY ?auto_216140 ?auto_216141 ) ( not ( = ?auto_216133 ?auto_216140 ) ) ( OBJ-AT ?auto_216137 ?auto_216140 ) ( IN-CITY ?auto_216143 ?auto_216141 ) ( not ( = ?auto_216133 ?auto_216143 ) ) ( OBJ-AT ?auto_216134 ?auto_216143 ) ( IN-CITY ?auto_216139 ?auto_216141 ) ( not ( = ?auto_216133 ?auto_216139 ) ) ( OBJ-AT ?auto_216136 ?auto_216139 ) ( TRUCK-AT ?auto_216142 ?auto_216133 ) ( not ( = ?auto_216136 ?auto_216134 ) ) ( not ( = ?auto_216143 ?auto_216139 ) ) ( not ( = ?auto_216136 ?auto_216137 ) ) ( not ( = ?auto_216134 ?auto_216137 ) ) ( not ( = ?auto_216140 ?auto_216143 ) ) ( not ( = ?auto_216140 ?auto_216139 ) ) ( not ( = ?auto_216136 ?auto_216138 ) ) ( not ( = ?auto_216134 ?auto_216138 ) ) ( not ( = ?auto_216137 ?auto_216138 ) ) ( not ( = ?auto_216144 ?auto_216140 ) ) ( not ( = ?auto_216144 ?auto_216143 ) ) ( not ( = ?auto_216144 ?auto_216139 ) ) ( not ( = ?auto_216136 ?auto_216135 ) ) ( not ( = ?auto_216134 ?auto_216135 ) ) ( not ( = ?auto_216137 ?auto_216135 ) ) ( not ( = ?auto_216138 ?auto_216135 ) ) ( not ( = ?auto_216145 ?auto_216144 ) ) ( not ( = ?auto_216145 ?auto_216140 ) ) ( not ( = ?auto_216145 ?auto_216143 ) ) ( not ( = ?auto_216145 ?auto_216139 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_216136 ?auto_216134 ?auto_216137 ?auto_216135 ?auto_216138 ?auto_216133 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216189 - OBJ
      ?auto_216190 - OBJ
      ?auto_216191 - OBJ
      ?auto_216192 - OBJ
      ?auto_216193 - OBJ
      ?auto_216188 - LOCATION
    )
    :vars
    (
      ?auto_216200 - LOCATION
      ?auto_216196 - CITY
      ?auto_216199 - LOCATION
      ?auto_216195 - LOCATION
      ?auto_216198 - LOCATION
      ?auto_216194 - LOCATION
      ?auto_216197 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_216200 ?auto_216196 ) ( IN-CITY ?auto_216188 ?auto_216196 ) ( not ( = ?auto_216188 ?auto_216200 ) ) ( OBJ-AT ?auto_216190 ?auto_216200 ) ( IN-CITY ?auto_216199 ?auto_216196 ) ( not ( = ?auto_216188 ?auto_216199 ) ) ( OBJ-AT ?auto_216192 ?auto_216199 ) ( IN-CITY ?auto_216195 ?auto_216196 ) ( not ( = ?auto_216188 ?auto_216195 ) ) ( OBJ-AT ?auto_216193 ?auto_216195 ) ( IN-CITY ?auto_216198 ?auto_216196 ) ( not ( = ?auto_216188 ?auto_216198 ) ) ( OBJ-AT ?auto_216189 ?auto_216198 ) ( IN-CITY ?auto_216194 ?auto_216196 ) ( not ( = ?auto_216188 ?auto_216194 ) ) ( OBJ-AT ?auto_216191 ?auto_216194 ) ( TRUCK-AT ?auto_216197 ?auto_216188 ) ( not ( = ?auto_216191 ?auto_216189 ) ) ( not ( = ?auto_216198 ?auto_216194 ) ) ( not ( = ?auto_216191 ?auto_216193 ) ) ( not ( = ?auto_216189 ?auto_216193 ) ) ( not ( = ?auto_216195 ?auto_216198 ) ) ( not ( = ?auto_216195 ?auto_216194 ) ) ( not ( = ?auto_216191 ?auto_216192 ) ) ( not ( = ?auto_216189 ?auto_216192 ) ) ( not ( = ?auto_216193 ?auto_216192 ) ) ( not ( = ?auto_216199 ?auto_216195 ) ) ( not ( = ?auto_216199 ?auto_216198 ) ) ( not ( = ?auto_216199 ?auto_216194 ) ) ( not ( = ?auto_216191 ?auto_216190 ) ) ( not ( = ?auto_216189 ?auto_216190 ) ) ( not ( = ?auto_216193 ?auto_216190 ) ) ( not ( = ?auto_216192 ?auto_216190 ) ) ( not ( = ?auto_216200 ?auto_216199 ) ) ( not ( = ?auto_216200 ?auto_216195 ) ) ( not ( = ?auto_216200 ?auto_216198 ) ) ( not ( = ?auto_216200 ?auto_216194 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_216191 ?auto_216189 ?auto_216193 ?auto_216190 ?auto_216192 ?auto_216188 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216718 - OBJ
      ?auto_216719 - OBJ
      ?auto_216720 - OBJ
      ?auto_216721 - OBJ
      ?auto_216722 - OBJ
      ?auto_216717 - LOCATION
    )
    :vars
    (
      ?auto_216729 - LOCATION
      ?auto_216725 - CITY
      ?auto_216728 - LOCATION
      ?auto_216724 - LOCATION
      ?auto_216727 - LOCATION
      ?auto_216723 - LOCATION
      ?auto_216726 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_216729 ?auto_216725 ) ( IN-CITY ?auto_216717 ?auto_216725 ) ( not ( = ?auto_216717 ?auto_216729 ) ) ( OBJ-AT ?auto_216719 ?auto_216729 ) ( IN-CITY ?auto_216728 ?auto_216725 ) ( not ( = ?auto_216717 ?auto_216728 ) ) ( OBJ-AT ?auto_216722 ?auto_216728 ) ( IN-CITY ?auto_216724 ?auto_216725 ) ( not ( = ?auto_216717 ?auto_216724 ) ) ( OBJ-AT ?auto_216720 ?auto_216724 ) ( IN-CITY ?auto_216727 ?auto_216725 ) ( not ( = ?auto_216717 ?auto_216727 ) ) ( OBJ-AT ?auto_216718 ?auto_216727 ) ( IN-CITY ?auto_216723 ?auto_216725 ) ( not ( = ?auto_216717 ?auto_216723 ) ) ( OBJ-AT ?auto_216721 ?auto_216723 ) ( TRUCK-AT ?auto_216726 ?auto_216717 ) ( not ( = ?auto_216721 ?auto_216718 ) ) ( not ( = ?auto_216727 ?auto_216723 ) ) ( not ( = ?auto_216721 ?auto_216720 ) ) ( not ( = ?auto_216718 ?auto_216720 ) ) ( not ( = ?auto_216724 ?auto_216727 ) ) ( not ( = ?auto_216724 ?auto_216723 ) ) ( not ( = ?auto_216721 ?auto_216722 ) ) ( not ( = ?auto_216718 ?auto_216722 ) ) ( not ( = ?auto_216720 ?auto_216722 ) ) ( not ( = ?auto_216728 ?auto_216724 ) ) ( not ( = ?auto_216728 ?auto_216727 ) ) ( not ( = ?auto_216728 ?auto_216723 ) ) ( not ( = ?auto_216721 ?auto_216719 ) ) ( not ( = ?auto_216718 ?auto_216719 ) ) ( not ( = ?auto_216720 ?auto_216719 ) ) ( not ( = ?auto_216722 ?auto_216719 ) ) ( not ( = ?auto_216729 ?auto_216728 ) ) ( not ( = ?auto_216729 ?auto_216724 ) ) ( not ( = ?auto_216729 ?auto_216727 ) ) ( not ( = ?auto_216729 ?auto_216723 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_216721 ?auto_216718 ?auto_216720 ?auto_216719 ?auto_216722 ?auto_216717 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_216891 - OBJ
      ?auto_216892 - OBJ
      ?auto_216893 - OBJ
      ?auto_216894 - OBJ
      ?auto_216895 - OBJ
      ?auto_216890 - LOCATION
    )
    :vars
    (
      ?auto_216902 - LOCATION
      ?auto_216898 - CITY
      ?auto_216901 - LOCATION
      ?auto_216897 - LOCATION
      ?auto_216900 - LOCATION
      ?auto_216896 - LOCATION
      ?auto_216899 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_216902 ?auto_216898 ) ( IN-CITY ?auto_216890 ?auto_216898 ) ( not ( = ?auto_216890 ?auto_216902 ) ) ( OBJ-AT ?auto_216892 ?auto_216902 ) ( IN-CITY ?auto_216901 ?auto_216898 ) ( not ( = ?auto_216890 ?auto_216901 ) ) ( OBJ-AT ?auto_216894 ?auto_216901 ) ( IN-CITY ?auto_216897 ?auto_216898 ) ( not ( = ?auto_216890 ?auto_216897 ) ) ( OBJ-AT ?auto_216893 ?auto_216897 ) ( IN-CITY ?auto_216900 ?auto_216898 ) ( not ( = ?auto_216890 ?auto_216900 ) ) ( OBJ-AT ?auto_216891 ?auto_216900 ) ( IN-CITY ?auto_216896 ?auto_216898 ) ( not ( = ?auto_216890 ?auto_216896 ) ) ( OBJ-AT ?auto_216895 ?auto_216896 ) ( TRUCK-AT ?auto_216899 ?auto_216890 ) ( not ( = ?auto_216895 ?auto_216891 ) ) ( not ( = ?auto_216900 ?auto_216896 ) ) ( not ( = ?auto_216895 ?auto_216893 ) ) ( not ( = ?auto_216891 ?auto_216893 ) ) ( not ( = ?auto_216897 ?auto_216900 ) ) ( not ( = ?auto_216897 ?auto_216896 ) ) ( not ( = ?auto_216895 ?auto_216894 ) ) ( not ( = ?auto_216891 ?auto_216894 ) ) ( not ( = ?auto_216893 ?auto_216894 ) ) ( not ( = ?auto_216901 ?auto_216897 ) ) ( not ( = ?auto_216901 ?auto_216900 ) ) ( not ( = ?auto_216901 ?auto_216896 ) ) ( not ( = ?auto_216895 ?auto_216892 ) ) ( not ( = ?auto_216891 ?auto_216892 ) ) ( not ( = ?auto_216893 ?auto_216892 ) ) ( not ( = ?auto_216894 ?auto_216892 ) ) ( not ( = ?auto_216902 ?auto_216901 ) ) ( not ( = ?auto_216902 ?auto_216897 ) ) ( not ( = ?auto_216902 ?auto_216900 ) ) ( not ( = ?auto_216902 ?auto_216896 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_216895 ?auto_216891 ?auto_216893 ?auto_216892 ?auto_216894 ?auto_216890 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217061 - OBJ
      ?auto_217062 - OBJ
      ?auto_217063 - OBJ
      ?auto_217064 - OBJ
      ?auto_217065 - OBJ
      ?auto_217060 - LOCATION
    )
    :vars
    (
      ?auto_217072 - LOCATION
      ?auto_217068 - CITY
      ?auto_217071 - LOCATION
      ?auto_217067 - LOCATION
      ?auto_217070 - LOCATION
      ?auto_217066 - LOCATION
      ?auto_217069 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217072 ?auto_217068 ) ( IN-CITY ?auto_217060 ?auto_217068 ) ( not ( = ?auto_217060 ?auto_217072 ) ) ( OBJ-AT ?auto_217062 ?auto_217072 ) ( IN-CITY ?auto_217071 ?auto_217068 ) ( not ( = ?auto_217060 ?auto_217071 ) ) ( OBJ-AT ?auto_217063 ?auto_217071 ) ( IN-CITY ?auto_217067 ?auto_217068 ) ( not ( = ?auto_217060 ?auto_217067 ) ) ( OBJ-AT ?auto_217065 ?auto_217067 ) ( IN-CITY ?auto_217070 ?auto_217068 ) ( not ( = ?auto_217060 ?auto_217070 ) ) ( OBJ-AT ?auto_217061 ?auto_217070 ) ( IN-CITY ?auto_217066 ?auto_217068 ) ( not ( = ?auto_217060 ?auto_217066 ) ) ( OBJ-AT ?auto_217064 ?auto_217066 ) ( TRUCK-AT ?auto_217069 ?auto_217060 ) ( not ( = ?auto_217064 ?auto_217061 ) ) ( not ( = ?auto_217070 ?auto_217066 ) ) ( not ( = ?auto_217064 ?auto_217065 ) ) ( not ( = ?auto_217061 ?auto_217065 ) ) ( not ( = ?auto_217067 ?auto_217070 ) ) ( not ( = ?auto_217067 ?auto_217066 ) ) ( not ( = ?auto_217064 ?auto_217063 ) ) ( not ( = ?auto_217061 ?auto_217063 ) ) ( not ( = ?auto_217065 ?auto_217063 ) ) ( not ( = ?auto_217071 ?auto_217067 ) ) ( not ( = ?auto_217071 ?auto_217070 ) ) ( not ( = ?auto_217071 ?auto_217066 ) ) ( not ( = ?auto_217064 ?auto_217062 ) ) ( not ( = ?auto_217061 ?auto_217062 ) ) ( not ( = ?auto_217065 ?auto_217062 ) ) ( not ( = ?auto_217063 ?auto_217062 ) ) ( not ( = ?auto_217072 ?auto_217071 ) ) ( not ( = ?auto_217072 ?auto_217067 ) ) ( not ( = ?auto_217072 ?auto_217070 ) ) ( not ( = ?auto_217072 ?auto_217066 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_217064 ?auto_217061 ?auto_217065 ?auto_217062 ?auto_217063 ?auto_217060 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217175 - OBJ
      ?auto_217176 - OBJ
      ?auto_217177 - OBJ
      ?auto_217178 - OBJ
      ?auto_217179 - OBJ
      ?auto_217174 - LOCATION
    )
    :vars
    (
      ?auto_217186 - LOCATION
      ?auto_217182 - CITY
      ?auto_217185 - LOCATION
      ?auto_217181 - LOCATION
      ?auto_217184 - LOCATION
      ?auto_217180 - LOCATION
      ?auto_217183 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217186 ?auto_217182 ) ( IN-CITY ?auto_217174 ?auto_217182 ) ( not ( = ?auto_217174 ?auto_217186 ) ) ( OBJ-AT ?auto_217176 ?auto_217186 ) ( IN-CITY ?auto_217185 ?auto_217182 ) ( not ( = ?auto_217174 ?auto_217185 ) ) ( OBJ-AT ?auto_217177 ?auto_217185 ) ( IN-CITY ?auto_217181 ?auto_217182 ) ( not ( = ?auto_217174 ?auto_217181 ) ) ( OBJ-AT ?auto_217178 ?auto_217181 ) ( IN-CITY ?auto_217184 ?auto_217182 ) ( not ( = ?auto_217174 ?auto_217184 ) ) ( OBJ-AT ?auto_217175 ?auto_217184 ) ( IN-CITY ?auto_217180 ?auto_217182 ) ( not ( = ?auto_217174 ?auto_217180 ) ) ( OBJ-AT ?auto_217179 ?auto_217180 ) ( TRUCK-AT ?auto_217183 ?auto_217174 ) ( not ( = ?auto_217179 ?auto_217175 ) ) ( not ( = ?auto_217184 ?auto_217180 ) ) ( not ( = ?auto_217179 ?auto_217178 ) ) ( not ( = ?auto_217175 ?auto_217178 ) ) ( not ( = ?auto_217181 ?auto_217184 ) ) ( not ( = ?auto_217181 ?auto_217180 ) ) ( not ( = ?auto_217179 ?auto_217177 ) ) ( not ( = ?auto_217175 ?auto_217177 ) ) ( not ( = ?auto_217178 ?auto_217177 ) ) ( not ( = ?auto_217185 ?auto_217181 ) ) ( not ( = ?auto_217185 ?auto_217184 ) ) ( not ( = ?auto_217185 ?auto_217180 ) ) ( not ( = ?auto_217179 ?auto_217176 ) ) ( not ( = ?auto_217175 ?auto_217176 ) ) ( not ( = ?auto_217178 ?auto_217176 ) ) ( not ( = ?auto_217177 ?auto_217176 ) ) ( not ( = ?auto_217186 ?auto_217185 ) ) ( not ( = ?auto_217186 ?auto_217181 ) ) ( not ( = ?auto_217186 ?auto_217184 ) ) ( not ( = ?auto_217186 ?auto_217180 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_217179 ?auto_217175 ?auto_217178 ?auto_217176 ?auto_217177 ?auto_217174 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217936 - OBJ
      ?auto_217937 - OBJ
      ?auto_217938 - OBJ
      ?auto_217939 - OBJ
      ?auto_217940 - OBJ
      ?auto_217935 - LOCATION
    )
    :vars
    (
      ?auto_217947 - LOCATION
      ?auto_217943 - CITY
      ?auto_217946 - LOCATION
      ?auto_217942 - LOCATION
      ?auto_217945 - LOCATION
      ?auto_217941 - LOCATION
      ?auto_217944 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_217947 ?auto_217943 ) ( IN-CITY ?auto_217935 ?auto_217943 ) ( not ( = ?auto_217935 ?auto_217947 ) ) ( OBJ-AT ?auto_217940 ?auto_217947 ) ( IN-CITY ?auto_217946 ?auto_217943 ) ( not ( = ?auto_217935 ?auto_217946 ) ) ( OBJ-AT ?auto_217939 ?auto_217946 ) ( IN-CITY ?auto_217942 ?auto_217943 ) ( not ( = ?auto_217935 ?auto_217942 ) ) ( OBJ-AT ?auto_217936 ?auto_217942 ) ( IN-CITY ?auto_217945 ?auto_217943 ) ( not ( = ?auto_217935 ?auto_217945 ) ) ( OBJ-AT ?auto_217938 ?auto_217945 ) ( IN-CITY ?auto_217941 ?auto_217943 ) ( not ( = ?auto_217935 ?auto_217941 ) ) ( OBJ-AT ?auto_217937 ?auto_217941 ) ( TRUCK-AT ?auto_217944 ?auto_217935 ) ( not ( = ?auto_217937 ?auto_217938 ) ) ( not ( = ?auto_217945 ?auto_217941 ) ) ( not ( = ?auto_217937 ?auto_217936 ) ) ( not ( = ?auto_217938 ?auto_217936 ) ) ( not ( = ?auto_217942 ?auto_217945 ) ) ( not ( = ?auto_217942 ?auto_217941 ) ) ( not ( = ?auto_217937 ?auto_217939 ) ) ( not ( = ?auto_217938 ?auto_217939 ) ) ( not ( = ?auto_217936 ?auto_217939 ) ) ( not ( = ?auto_217946 ?auto_217942 ) ) ( not ( = ?auto_217946 ?auto_217945 ) ) ( not ( = ?auto_217946 ?auto_217941 ) ) ( not ( = ?auto_217937 ?auto_217940 ) ) ( not ( = ?auto_217938 ?auto_217940 ) ) ( not ( = ?auto_217936 ?auto_217940 ) ) ( not ( = ?auto_217939 ?auto_217940 ) ) ( not ( = ?auto_217947 ?auto_217946 ) ) ( not ( = ?auto_217947 ?auto_217942 ) ) ( not ( = ?auto_217947 ?auto_217945 ) ) ( not ( = ?auto_217947 ?auto_217941 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_217937 ?auto_217938 ?auto_217936 ?auto_217940 ?auto_217939 ?auto_217935 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_217991 - OBJ
      ?auto_217992 - OBJ
      ?auto_217993 - OBJ
      ?auto_217994 - OBJ
      ?auto_217995 - OBJ
      ?auto_217990 - LOCATION
    )
    :vars
    (
      ?auto_218002 - LOCATION
      ?auto_217998 - CITY
      ?auto_218001 - LOCATION
      ?auto_217997 - LOCATION
      ?auto_218000 - LOCATION
      ?auto_217996 - LOCATION
      ?auto_217999 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218002 ?auto_217998 ) ( IN-CITY ?auto_217990 ?auto_217998 ) ( not ( = ?auto_217990 ?auto_218002 ) ) ( OBJ-AT ?auto_217994 ?auto_218002 ) ( IN-CITY ?auto_218001 ?auto_217998 ) ( not ( = ?auto_217990 ?auto_218001 ) ) ( OBJ-AT ?auto_217995 ?auto_218001 ) ( IN-CITY ?auto_217997 ?auto_217998 ) ( not ( = ?auto_217990 ?auto_217997 ) ) ( OBJ-AT ?auto_217991 ?auto_217997 ) ( IN-CITY ?auto_218000 ?auto_217998 ) ( not ( = ?auto_217990 ?auto_218000 ) ) ( OBJ-AT ?auto_217993 ?auto_218000 ) ( IN-CITY ?auto_217996 ?auto_217998 ) ( not ( = ?auto_217990 ?auto_217996 ) ) ( OBJ-AT ?auto_217992 ?auto_217996 ) ( TRUCK-AT ?auto_217999 ?auto_217990 ) ( not ( = ?auto_217992 ?auto_217993 ) ) ( not ( = ?auto_218000 ?auto_217996 ) ) ( not ( = ?auto_217992 ?auto_217991 ) ) ( not ( = ?auto_217993 ?auto_217991 ) ) ( not ( = ?auto_217997 ?auto_218000 ) ) ( not ( = ?auto_217997 ?auto_217996 ) ) ( not ( = ?auto_217992 ?auto_217995 ) ) ( not ( = ?auto_217993 ?auto_217995 ) ) ( not ( = ?auto_217991 ?auto_217995 ) ) ( not ( = ?auto_218001 ?auto_217997 ) ) ( not ( = ?auto_218001 ?auto_218000 ) ) ( not ( = ?auto_218001 ?auto_217996 ) ) ( not ( = ?auto_217992 ?auto_217994 ) ) ( not ( = ?auto_217993 ?auto_217994 ) ) ( not ( = ?auto_217991 ?auto_217994 ) ) ( not ( = ?auto_217995 ?auto_217994 ) ) ( not ( = ?auto_218002 ?auto_218001 ) ) ( not ( = ?auto_218002 ?auto_217997 ) ) ( not ( = ?auto_218002 ?auto_218000 ) ) ( not ( = ?auto_218002 ?auto_217996 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_217992 ?auto_217993 ?auto_217991 ?auto_217994 ?auto_217995 ?auto_217990 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_218163 - OBJ
      ?auto_218164 - OBJ
      ?auto_218165 - OBJ
      ?auto_218166 - OBJ
      ?auto_218167 - OBJ
      ?auto_218162 - LOCATION
    )
    :vars
    (
      ?auto_218174 - LOCATION
      ?auto_218170 - CITY
      ?auto_218173 - LOCATION
      ?auto_218169 - LOCATION
      ?auto_218172 - LOCATION
      ?auto_218168 - LOCATION
      ?auto_218171 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218174 ?auto_218170 ) ( IN-CITY ?auto_218162 ?auto_218170 ) ( not ( = ?auto_218162 ?auto_218174 ) ) ( OBJ-AT ?auto_218167 ?auto_218174 ) ( IN-CITY ?auto_218173 ?auto_218170 ) ( not ( = ?auto_218162 ?auto_218173 ) ) ( OBJ-AT ?auto_218165 ?auto_218173 ) ( IN-CITY ?auto_218169 ?auto_218170 ) ( not ( = ?auto_218162 ?auto_218169 ) ) ( OBJ-AT ?auto_218163 ?auto_218169 ) ( IN-CITY ?auto_218172 ?auto_218170 ) ( not ( = ?auto_218162 ?auto_218172 ) ) ( OBJ-AT ?auto_218166 ?auto_218172 ) ( IN-CITY ?auto_218168 ?auto_218170 ) ( not ( = ?auto_218162 ?auto_218168 ) ) ( OBJ-AT ?auto_218164 ?auto_218168 ) ( TRUCK-AT ?auto_218171 ?auto_218162 ) ( not ( = ?auto_218164 ?auto_218166 ) ) ( not ( = ?auto_218172 ?auto_218168 ) ) ( not ( = ?auto_218164 ?auto_218163 ) ) ( not ( = ?auto_218166 ?auto_218163 ) ) ( not ( = ?auto_218169 ?auto_218172 ) ) ( not ( = ?auto_218169 ?auto_218168 ) ) ( not ( = ?auto_218164 ?auto_218165 ) ) ( not ( = ?auto_218166 ?auto_218165 ) ) ( not ( = ?auto_218163 ?auto_218165 ) ) ( not ( = ?auto_218173 ?auto_218169 ) ) ( not ( = ?auto_218173 ?auto_218172 ) ) ( not ( = ?auto_218173 ?auto_218168 ) ) ( not ( = ?auto_218164 ?auto_218167 ) ) ( not ( = ?auto_218166 ?auto_218167 ) ) ( not ( = ?auto_218163 ?auto_218167 ) ) ( not ( = ?auto_218165 ?auto_218167 ) ) ( not ( = ?auto_218174 ?auto_218173 ) ) ( not ( = ?auto_218174 ?auto_218169 ) ) ( not ( = ?auto_218174 ?auto_218172 ) ) ( not ( = ?auto_218174 ?auto_218168 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_218164 ?auto_218166 ?auto_218163 ?auto_218167 ?auto_218165 ?auto_218162 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_218218 - OBJ
      ?auto_218219 - OBJ
      ?auto_218220 - OBJ
      ?auto_218221 - OBJ
      ?auto_218222 - OBJ
      ?auto_218217 - LOCATION
    )
    :vars
    (
      ?auto_218229 - LOCATION
      ?auto_218225 - CITY
      ?auto_218228 - LOCATION
      ?auto_218224 - LOCATION
      ?auto_218227 - LOCATION
      ?auto_218223 - LOCATION
      ?auto_218226 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218229 ?auto_218225 ) ( IN-CITY ?auto_218217 ?auto_218225 ) ( not ( = ?auto_218217 ?auto_218229 ) ) ( OBJ-AT ?auto_218221 ?auto_218229 ) ( IN-CITY ?auto_218228 ?auto_218225 ) ( not ( = ?auto_218217 ?auto_218228 ) ) ( OBJ-AT ?auto_218220 ?auto_218228 ) ( IN-CITY ?auto_218224 ?auto_218225 ) ( not ( = ?auto_218217 ?auto_218224 ) ) ( OBJ-AT ?auto_218218 ?auto_218224 ) ( IN-CITY ?auto_218227 ?auto_218225 ) ( not ( = ?auto_218217 ?auto_218227 ) ) ( OBJ-AT ?auto_218222 ?auto_218227 ) ( IN-CITY ?auto_218223 ?auto_218225 ) ( not ( = ?auto_218217 ?auto_218223 ) ) ( OBJ-AT ?auto_218219 ?auto_218223 ) ( TRUCK-AT ?auto_218226 ?auto_218217 ) ( not ( = ?auto_218219 ?auto_218222 ) ) ( not ( = ?auto_218227 ?auto_218223 ) ) ( not ( = ?auto_218219 ?auto_218218 ) ) ( not ( = ?auto_218222 ?auto_218218 ) ) ( not ( = ?auto_218224 ?auto_218227 ) ) ( not ( = ?auto_218224 ?auto_218223 ) ) ( not ( = ?auto_218219 ?auto_218220 ) ) ( not ( = ?auto_218222 ?auto_218220 ) ) ( not ( = ?auto_218218 ?auto_218220 ) ) ( not ( = ?auto_218228 ?auto_218224 ) ) ( not ( = ?auto_218228 ?auto_218227 ) ) ( not ( = ?auto_218228 ?auto_218223 ) ) ( not ( = ?auto_218219 ?auto_218221 ) ) ( not ( = ?auto_218222 ?auto_218221 ) ) ( not ( = ?auto_218218 ?auto_218221 ) ) ( not ( = ?auto_218220 ?auto_218221 ) ) ( not ( = ?auto_218229 ?auto_218228 ) ) ( not ( = ?auto_218229 ?auto_218224 ) ) ( not ( = ?auto_218229 ?auto_218227 ) ) ( not ( = ?auto_218229 ?auto_218223 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_218219 ?auto_218222 ?auto_218218 ?auto_218221 ?auto_218220 ?auto_218217 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_218388 - OBJ
      ?auto_218389 - OBJ
      ?auto_218390 - OBJ
      ?auto_218391 - OBJ
      ?auto_218392 - OBJ
      ?auto_218387 - LOCATION
    )
    :vars
    (
      ?auto_218399 - LOCATION
      ?auto_218395 - CITY
      ?auto_218398 - LOCATION
      ?auto_218394 - LOCATION
      ?auto_218397 - LOCATION
      ?auto_218393 - LOCATION
      ?auto_218396 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218399 ?auto_218395 ) ( IN-CITY ?auto_218387 ?auto_218395 ) ( not ( = ?auto_218387 ?auto_218399 ) ) ( OBJ-AT ?auto_218390 ?auto_218399 ) ( IN-CITY ?auto_218398 ?auto_218395 ) ( not ( = ?auto_218387 ?auto_218398 ) ) ( OBJ-AT ?auto_218392 ?auto_218398 ) ( IN-CITY ?auto_218394 ?auto_218395 ) ( not ( = ?auto_218387 ?auto_218394 ) ) ( OBJ-AT ?auto_218388 ?auto_218394 ) ( IN-CITY ?auto_218397 ?auto_218395 ) ( not ( = ?auto_218387 ?auto_218397 ) ) ( OBJ-AT ?auto_218391 ?auto_218397 ) ( IN-CITY ?auto_218393 ?auto_218395 ) ( not ( = ?auto_218387 ?auto_218393 ) ) ( OBJ-AT ?auto_218389 ?auto_218393 ) ( TRUCK-AT ?auto_218396 ?auto_218387 ) ( not ( = ?auto_218389 ?auto_218391 ) ) ( not ( = ?auto_218397 ?auto_218393 ) ) ( not ( = ?auto_218389 ?auto_218388 ) ) ( not ( = ?auto_218391 ?auto_218388 ) ) ( not ( = ?auto_218394 ?auto_218397 ) ) ( not ( = ?auto_218394 ?auto_218393 ) ) ( not ( = ?auto_218389 ?auto_218392 ) ) ( not ( = ?auto_218391 ?auto_218392 ) ) ( not ( = ?auto_218388 ?auto_218392 ) ) ( not ( = ?auto_218398 ?auto_218394 ) ) ( not ( = ?auto_218398 ?auto_218397 ) ) ( not ( = ?auto_218398 ?auto_218393 ) ) ( not ( = ?auto_218389 ?auto_218390 ) ) ( not ( = ?auto_218391 ?auto_218390 ) ) ( not ( = ?auto_218388 ?auto_218390 ) ) ( not ( = ?auto_218392 ?auto_218390 ) ) ( not ( = ?auto_218399 ?auto_218398 ) ) ( not ( = ?auto_218399 ?auto_218394 ) ) ( not ( = ?auto_218399 ?auto_218397 ) ) ( not ( = ?auto_218399 ?auto_218393 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_218389 ?auto_218391 ?auto_218388 ?auto_218390 ?auto_218392 ?auto_218387 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_218502 - OBJ
      ?auto_218503 - OBJ
      ?auto_218504 - OBJ
      ?auto_218505 - OBJ
      ?auto_218506 - OBJ
      ?auto_218501 - LOCATION
    )
    :vars
    (
      ?auto_218513 - LOCATION
      ?auto_218509 - CITY
      ?auto_218512 - LOCATION
      ?auto_218508 - LOCATION
      ?auto_218511 - LOCATION
      ?auto_218507 - LOCATION
      ?auto_218510 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218513 ?auto_218509 ) ( IN-CITY ?auto_218501 ?auto_218509 ) ( not ( = ?auto_218501 ?auto_218513 ) ) ( OBJ-AT ?auto_218504 ?auto_218513 ) ( IN-CITY ?auto_218512 ?auto_218509 ) ( not ( = ?auto_218501 ?auto_218512 ) ) ( OBJ-AT ?auto_218505 ?auto_218512 ) ( IN-CITY ?auto_218508 ?auto_218509 ) ( not ( = ?auto_218501 ?auto_218508 ) ) ( OBJ-AT ?auto_218502 ?auto_218508 ) ( IN-CITY ?auto_218511 ?auto_218509 ) ( not ( = ?auto_218501 ?auto_218511 ) ) ( OBJ-AT ?auto_218506 ?auto_218511 ) ( IN-CITY ?auto_218507 ?auto_218509 ) ( not ( = ?auto_218501 ?auto_218507 ) ) ( OBJ-AT ?auto_218503 ?auto_218507 ) ( TRUCK-AT ?auto_218510 ?auto_218501 ) ( not ( = ?auto_218503 ?auto_218506 ) ) ( not ( = ?auto_218511 ?auto_218507 ) ) ( not ( = ?auto_218503 ?auto_218502 ) ) ( not ( = ?auto_218506 ?auto_218502 ) ) ( not ( = ?auto_218508 ?auto_218511 ) ) ( not ( = ?auto_218508 ?auto_218507 ) ) ( not ( = ?auto_218503 ?auto_218505 ) ) ( not ( = ?auto_218506 ?auto_218505 ) ) ( not ( = ?auto_218502 ?auto_218505 ) ) ( not ( = ?auto_218512 ?auto_218508 ) ) ( not ( = ?auto_218512 ?auto_218511 ) ) ( not ( = ?auto_218512 ?auto_218507 ) ) ( not ( = ?auto_218503 ?auto_218504 ) ) ( not ( = ?auto_218506 ?auto_218504 ) ) ( not ( = ?auto_218502 ?auto_218504 ) ) ( not ( = ?auto_218505 ?auto_218504 ) ) ( not ( = ?auto_218513 ?auto_218512 ) ) ( not ( = ?auto_218513 ?auto_218508 ) ) ( not ( = ?auto_218513 ?auto_218511 ) ) ( not ( = ?auto_218513 ?auto_218507 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_218503 ?auto_218506 ?auto_218502 ?auto_218504 ?auto_218505 ?auto_218501 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_218672 - OBJ
      ?auto_218673 - OBJ
      ?auto_218674 - OBJ
      ?auto_218675 - OBJ
      ?auto_218676 - OBJ
      ?auto_218671 - LOCATION
    )
    :vars
    (
      ?auto_218683 - LOCATION
      ?auto_218679 - CITY
      ?auto_218682 - LOCATION
      ?auto_218678 - LOCATION
      ?auto_218681 - LOCATION
      ?auto_218677 - LOCATION
      ?auto_218680 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218683 ?auto_218679 ) ( IN-CITY ?auto_218671 ?auto_218679 ) ( not ( = ?auto_218671 ?auto_218683 ) ) ( OBJ-AT ?auto_218676 ?auto_218683 ) ( IN-CITY ?auto_218682 ?auto_218679 ) ( not ( = ?auto_218671 ?auto_218682 ) ) ( OBJ-AT ?auto_218675 ?auto_218682 ) ( IN-CITY ?auto_218678 ?auto_218679 ) ( not ( = ?auto_218671 ?auto_218678 ) ) ( OBJ-AT ?auto_218672 ?auto_218678 ) ( IN-CITY ?auto_218681 ?auto_218679 ) ( not ( = ?auto_218671 ?auto_218681 ) ) ( OBJ-AT ?auto_218673 ?auto_218681 ) ( IN-CITY ?auto_218677 ?auto_218679 ) ( not ( = ?auto_218671 ?auto_218677 ) ) ( OBJ-AT ?auto_218674 ?auto_218677 ) ( TRUCK-AT ?auto_218680 ?auto_218671 ) ( not ( = ?auto_218674 ?auto_218673 ) ) ( not ( = ?auto_218681 ?auto_218677 ) ) ( not ( = ?auto_218674 ?auto_218672 ) ) ( not ( = ?auto_218673 ?auto_218672 ) ) ( not ( = ?auto_218678 ?auto_218681 ) ) ( not ( = ?auto_218678 ?auto_218677 ) ) ( not ( = ?auto_218674 ?auto_218675 ) ) ( not ( = ?auto_218673 ?auto_218675 ) ) ( not ( = ?auto_218672 ?auto_218675 ) ) ( not ( = ?auto_218682 ?auto_218678 ) ) ( not ( = ?auto_218682 ?auto_218681 ) ) ( not ( = ?auto_218682 ?auto_218677 ) ) ( not ( = ?auto_218674 ?auto_218676 ) ) ( not ( = ?auto_218673 ?auto_218676 ) ) ( not ( = ?auto_218672 ?auto_218676 ) ) ( not ( = ?auto_218675 ?auto_218676 ) ) ( not ( = ?auto_218683 ?auto_218682 ) ) ( not ( = ?auto_218683 ?auto_218678 ) ) ( not ( = ?auto_218683 ?auto_218681 ) ) ( not ( = ?auto_218683 ?auto_218677 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_218674 ?auto_218673 ?auto_218672 ?auto_218676 ?auto_218675 ?auto_218671 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_218727 - OBJ
      ?auto_218728 - OBJ
      ?auto_218729 - OBJ
      ?auto_218730 - OBJ
      ?auto_218731 - OBJ
      ?auto_218726 - LOCATION
    )
    :vars
    (
      ?auto_218738 - LOCATION
      ?auto_218734 - CITY
      ?auto_218737 - LOCATION
      ?auto_218733 - LOCATION
      ?auto_218736 - LOCATION
      ?auto_218732 - LOCATION
      ?auto_218735 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_218738 ?auto_218734 ) ( IN-CITY ?auto_218726 ?auto_218734 ) ( not ( = ?auto_218726 ?auto_218738 ) ) ( OBJ-AT ?auto_218730 ?auto_218738 ) ( IN-CITY ?auto_218737 ?auto_218734 ) ( not ( = ?auto_218726 ?auto_218737 ) ) ( OBJ-AT ?auto_218731 ?auto_218737 ) ( IN-CITY ?auto_218733 ?auto_218734 ) ( not ( = ?auto_218726 ?auto_218733 ) ) ( OBJ-AT ?auto_218727 ?auto_218733 ) ( IN-CITY ?auto_218736 ?auto_218734 ) ( not ( = ?auto_218726 ?auto_218736 ) ) ( OBJ-AT ?auto_218728 ?auto_218736 ) ( IN-CITY ?auto_218732 ?auto_218734 ) ( not ( = ?auto_218726 ?auto_218732 ) ) ( OBJ-AT ?auto_218729 ?auto_218732 ) ( TRUCK-AT ?auto_218735 ?auto_218726 ) ( not ( = ?auto_218729 ?auto_218728 ) ) ( not ( = ?auto_218736 ?auto_218732 ) ) ( not ( = ?auto_218729 ?auto_218727 ) ) ( not ( = ?auto_218728 ?auto_218727 ) ) ( not ( = ?auto_218733 ?auto_218736 ) ) ( not ( = ?auto_218733 ?auto_218732 ) ) ( not ( = ?auto_218729 ?auto_218731 ) ) ( not ( = ?auto_218728 ?auto_218731 ) ) ( not ( = ?auto_218727 ?auto_218731 ) ) ( not ( = ?auto_218737 ?auto_218733 ) ) ( not ( = ?auto_218737 ?auto_218736 ) ) ( not ( = ?auto_218737 ?auto_218732 ) ) ( not ( = ?auto_218729 ?auto_218730 ) ) ( not ( = ?auto_218728 ?auto_218730 ) ) ( not ( = ?auto_218727 ?auto_218730 ) ) ( not ( = ?auto_218731 ?auto_218730 ) ) ( not ( = ?auto_218738 ?auto_218737 ) ) ( not ( = ?auto_218738 ?auto_218733 ) ) ( not ( = ?auto_218738 ?auto_218736 ) ) ( not ( = ?auto_218738 ?auto_218732 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_218729 ?auto_218728 ?auto_218727 ?auto_218730 ?auto_218731 ?auto_218726 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219016 - OBJ
      ?auto_219017 - OBJ
      ?auto_219018 - OBJ
      ?auto_219019 - OBJ
      ?auto_219020 - OBJ
      ?auto_219015 - LOCATION
    )
    :vars
    (
      ?auto_219027 - LOCATION
      ?auto_219023 - CITY
      ?auto_219026 - LOCATION
      ?auto_219022 - LOCATION
      ?auto_219025 - LOCATION
      ?auto_219021 - LOCATION
      ?auto_219024 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219027 ?auto_219023 ) ( IN-CITY ?auto_219015 ?auto_219023 ) ( not ( = ?auto_219015 ?auto_219027 ) ) ( OBJ-AT ?auto_219020 ?auto_219027 ) ( IN-CITY ?auto_219026 ?auto_219023 ) ( not ( = ?auto_219015 ?auto_219026 ) ) ( OBJ-AT ?auto_219018 ?auto_219026 ) ( IN-CITY ?auto_219022 ?auto_219023 ) ( not ( = ?auto_219015 ?auto_219022 ) ) ( OBJ-AT ?auto_219016 ?auto_219022 ) ( IN-CITY ?auto_219025 ?auto_219023 ) ( not ( = ?auto_219015 ?auto_219025 ) ) ( OBJ-AT ?auto_219017 ?auto_219025 ) ( IN-CITY ?auto_219021 ?auto_219023 ) ( not ( = ?auto_219015 ?auto_219021 ) ) ( OBJ-AT ?auto_219019 ?auto_219021 ) ( TRUCK-AT ?auto_219024 ?auto_219015 ) ( not ( = ?auto_219019 ?auto_219017 ) ) ( not ( = ?auto_219025 ?auto_219021 ) ) ( not ( = ?auto_219019 ?auto_219016 ) ) ( not ( = ?auto_219017 ?auto_219016 ) ) ( not ( = ?auto_219022 ?auto_219025 ) ) ( not ( = ?auto_219022 ?auto_219021 ) ) ( not ( = ?auto_219019 ?auto_219018 ) ) ( not ( = ?auto_219017 ?auto_219018 ) ) ( not ( = ?auto_219016 ?auto_219018 ) ) ( not ( = ?auto_219026 ?auto_219022 ) ) ( not ( = ?auto_219026 ?auto_219025 ) ) ( not ( = ?auto_219026 ?auto_219021 ) ) ( not ( = ?auto_219019 ?auto_219020 ) ) ( not ( = ?auto_219017 ?auto_219020 ) ) ( not ( = ?auto_219016 ?auto_219020 ) ) ( not ( = ?auto_219018 ?auto_219020 ) ) ( not ( = ?auto_219027 ?auto_219026 ) ) ( not ( = ?auto_219027 ?auto_219022 ) ) ( not ( = ?auto_219027 ?auto_219025 ) ) ( not ( = ?auto_219027 ?auto_219021 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219019 ?auto_219017 ?auto_219016 ?auto_219020 ?auto_219018 ?auto_219015 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219071 - OBJ
      ?auto_219072 - OBJ
      ?auto_219073 - OBJ
      ?auto_219074 - OBJ
      ?auto_219075 - OBJ
      ?auto_219070 - LOCATION
    )
    :vars
    (
      ?auto_219082 - LOCATION
      ?auto_219078 - CITY
      ?auto_219081 - LOCATION
      ?auto_219077 - LOCATION
      ?auto_219080 - LOCATION
      ?auto_219076 - LOCATION
      ?auto_219079 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219082 ?auto_219078 ) ( IN-CITY ?auto_219070 ?auto_219078 ) ( not ( = ?auto_219070 ?auto_219082 ) ) ( OBJ-AT ?auto_219074 ?auto_219082 ) ( IN-CITY ?auto_219081 ?auto_219078 ) ( not ( = ?auto_219070 ?auto_219081 ) ) ( OBJ-AT ?auto_219073 ?auto_219081 ) ( IN-CITY ?auto_219077 ?auto_219078 ) ( not ( = ?auto_219070 ?auto_219077 ) ) ( OBJ-AT ?auto_219071 ?auto_219077 ) ( IN-CITY ?auto_219080 ?auto_219078 ) ( not ( = ?auto_219070 ?auto_219080 ) ) ( OBJ-AT ?auto_219072 ?auto_219080 ) ( IN-CITY ?auto_219076 ?auto_219078 ) ( not ( = ?auto_219070 ?auto_219076 ) ) ( OBJ-AT ?auto_219075 ?auto_219076 ) ( TRUCK-AT ?auto_219079 ?auto_219070 ) ( not ( = ?auto_219075 ?auto_219072 ) ) ( not ( = ?auto_219080 ?auto_219076 ) ) ( not ( = ?auto_219075 ?auto_219071 ) ) ( not ( = ?auto_219072 ?auto_219071 ) ) ( not ( = ?auto_219077 ?auto_219080 ) ) ( not ( = ?auto_219077 ?auto_219076 ) ) ( not ( = ?auto_219075 ?auto_219073 ) ) ( not ( = ?auto_219072 ?auto_219073 ) ) ( not ( = ?auto_219071 ?auto_219073 ) ) ( not ( = ?auto_219081 ?auto_219077 ) ) ( not ( = ?auto_219081 ?auto_219080 ) ) ( not ( = ?auto_219081 ?auto_219076 ) ) ( not ( = ?auto_219075 ?auto_219074 ) ) ( not ( = ?auto_219072 ?auto_219074 ) ) ( not ( = ?auto_219071 ?auto_219074 ) ) ( not ( = ?auto_219073 ?auto_219074 ) ) ( not ( = ?auto_219082 ?auto_219081 ) ) ( not ( = ?auto_219082 ?auto_219077 ) ) ( not ( = ?auto_219082 ?auto_219080 ) ) ( not ( = ?auto_219082 ?auto_219076 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219075 ?auto_219072 ?auto_219071 ?auto_219074 ?auto_219073 ?auto_219070 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219182 - OBJ
      ?auto_219183 - OBJ
      ?auto_219184 - OBJ
      ?auto_219185 - OBJ
      ?auto_219186 - OBJ
      ?auto_219181 - LOCATION
    )
    :vars
    (
      ?auto_219193 - LOCATION
      ?auto_219189 - CITY
      ?auto_219192 - LOCATION
      ?auto_219188 - LOCATION
      ?auto_219191 - LOCATION
      ?auto_219187 - LOCATION
      ?auto_219190 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219193 ?auto_219189 ) ( IN-CITY ?auto_219181 ?auto_219189 ) ( not ( = ?auto_219181 ?auto_219193 ) ) ( OBJ-AT ?auto_219184 ?auto_219193 ) ( IN-CITY ?auto_219192 ?auto_219189 ) ( not ( = ?auto_219181 ?auto_219192 ) ) ( OBJ-AT ?auto_219186 ?auto_219192 ) ( IN-CITY ?auto_219188 ?auto_219189 ) ( not ( = ?auto_219181 ?auto_219188 ) ) ( OBJ-AT ?auto_219182 ?auto_219188 ) ( IN-CITY ?auto_219191 ?auto_219189 ) ( not ( = ?auto_219181 ?auto_219191 ) ) ( OBJ-AT ?auto_219183 ?auto_219191 ) ( IN-CITY ?auto_219187 ?auto_219189 ) ( not ( = ?auto_219181 ?auto_219187 ) ) ( OBJ-AT ?auto_219185 ?auto_219187 ) ( TRUCK-AT ?auto_219190 ?auto_219181 ) ( not ( = ?auto_219185 ?auto_219183 ) ) ( not ( = ?auto_219191 ?auto_219187 ) ) ( not ( = ?auto_219185 ?auto_219182 ) ) ( not ( = ?auto_219183 ?auto_219182 ) ) ( not ( = ?auto_219188 ?auto_219191 ) ) ( not ( = ?auto_219188 ?auto_219187 ) ) ( not ( = ?auto_219185 ?auto_219186 ) ) ( not ( = ?auto_219183 ?auto_219186 ) ) ( not ( = ?auto_219182 ?auto_219186 ) ) ( not ( = ?auto_219192 ?auto_219188 ) ) ( not ( = ?auto_219192 ?auto_219191 ) ) ( not ( = ?auto_219192 ?auto_219187 ) ) ( not ( = ?auto_219185 ?auto_219184 ) ) ( not ( = ?auto_219183 ?auto_219184 ) ) ( not ( = ?auto_219182 ?auto_219184 ) ) ( not ( = ?auto_219186 ?auto_219184 ) ) ( not ( = ?auto_219193 ?auto_219192 ) ) ( not ( = ?auto_219193 ?auto_219188 ) ) ( not ( = ?auto_219193 ?auto_219191 ) ) ( not ( = ?auto_219193 ?auto_219187 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219185 ?auto_219183 ?auto_219182 ?auto_219184 ?auto_219186 ?auto_219181 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_219355 - OBJ
      ?auto_219356 - OBJ
      ?auto_219357 - OBJ
      ?auto_219358 - OBJ
      ?auto_219359 - OBJ
      ?auto_219354 - LOCATION
    )
    :vars
    (
      ?auto_219366 - LOCATION
      ?auto_219362 - CITY
      ?auto_219365 - LOCATION
      ?auto_219361 - LOCATION
      ?auto_219364 - LOCATION
      ?auto_219360 - LOCATION
      ?auto_219363 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_219366 ?auto_219362 ) ( IN-CITY ?auto_219354 ?auto_219362 ) ( not ( = ?auto_219354 ?auto_219366 ) ) ( OBJ-AT ?auto_219357 ?auto_219366 ) ( IN-CITY ?auto_219365 ?auto_219362 ) ( not ( = ?auto_219354 ?auto_219365 ) ) ( OBJ-AT ?auto_219358 ?auto_219365 ) ( IN-CITY ?auto_219361 ?auto_219362 ) ( not ( = ?auto_219354 ?auto_219361 ) ) ( OBJ-AT ?auto_219355 ?auto_219361 ) ( IN-CITY ?auto_219364 ?auto_219362 ) ( not ( = ?auto_219354 ?auto_219364 ) ) ( OBJ-AT ?auto_219356 ?auto_219364 ) ( IN-CITY ?auto_219360 ?auto_219362 ) ( not ( = ?auto_219354 ?auto_219360 ) ) ( OBJ-AT ?auto_219359 ?auto_219360 ) ( TRUCK-AT ?auto_219363 ?auto_219354 ) ( not ( = ?auto_219359 ?auto_219356 ) ) ( not ( = ?auto_219364 ?auto_219360 ) ) ( not ( = ?auto_219359 ?auto_219355 ) ) ( not ( = ?auto_219356 ?auto_219355 ) ) ( not ( = ?auto_219361 ?auto_219364 ) ) ( not ( = ?auto_219361 ?auto_219360 ) ) ( not ( = ?auto_219359 ?auto_219358 ) ) ( not ( = ?auto_219356 ?auto_219358 ) ) ( not ( = ?auto_219355 ?auto_219358 ) ) ( not ( = ?auto_219365 ?auto_219361 ) ) ( not ( = ?auto_219365 ?auto_219364 ) ) ( not ( = ?auto_219365 ?auto_219360 ) ) ( not ( = ?auto_219359 ?auto_219357 ) ) ( not ( = ?auto_219356 ?auto_219357 ) ) ( not ( = ?auto_219355 ?auto_219357 ) ) ( not ( = ?auto_219358 ?auto_219357 ) ) ( not ( = ?auto_219366 ?auto_219365 ) ) ( not ( = ?auto_219366 ?auto_219361 ) ) ( not ( = ?auto_219366 ?auto_219364 ) ) ( not ( = ?auto_219366 ?auto_219360 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_219359 ?auto_219356 ?auto_219355 ?auto_219357 ?auto_219358 ?auto_219354 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_220415 - OBJ
      ?auto_220416 - OBJ
      ?auto_220417 - OBJ
      ?auto_220418 - OBJ
      ?auto_220419 - OBJ
      ?auto_220414 - LOCATION
    )
    :vars
    (
      ?auto_220426 - LOCATION
      ?auto_220422 - CITY
      ?auto_220425 - LOCATION
      ?auto_220421 - LOCATION
      ?auto_220424 - LOCATION
      ?auto_220420 - LOCATION
      ?auto_220423 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_220426 ?auto_220422 ) ( IN-CITY ?auto_220414 ?auto_220422 ) ( not ( = ?auto_220414 ?auto_220426 ) ) ( OBJ-AT ?auto_220419 ?auto_220426 ) ( IN-CITY ?auto_220425 ?auto_220422 ) ( not ( = ?auto_220414 ?auto_220425 ) ) ( OBJ-AT ?auto_220416 ?auto_220425 ) ( IN-CITY ?auto_220421 ?auto_220422 ) ( not ( = ?auto_220414 ?auto_220421 ) ) ( OBJ-AT ?auto_220415 ?auto_220421 ) ( IN-CITY ?auto_220424 ?auto_220422 ) ( not ( = ?auto_220414 ?auto_220424 ) ) ( OBJ-AT ?auto_220418 ?auto_220424 ) ( IN-CITY ?auto_220420 ?auto_220422 ) ( not ( = ?auto_220414 ?auto_220420 ) ) ( OBJ-AT ?auto_220417 ?auto_220420 ) ( TRUCK-AT ?auto_220423 ?auto_220414 ) ( not ( = ?auto_220417 ?auto_220418 ) ) ( not ( = ?auto_220424 ?auto_220420 ) ) ( not ( = ?auto_220417 ?auto_220415 ) ) ( not ( = ?auto_220418 ?auto_220415 ) ) ( not ( = ?auto_220421 ?auto_220424 ) ) ( not ( = ?auto_220421 ?auto_220420 ) ) ( not ( = ?auto_220417 ?auto_220416 ) ) ( not ( = ?auto_220418 ?auto_220416 ) ) ( not ( = ?auto_220415 ?auto_220416 ) ) ( not ( = ?auto_220425 ?auto_220421 ) ) ( not ( = ?auto_220425 ?auto_220424 ) ) ( not ( = ?auto_220425 ?auto_220420 ) ) ( not ( = ?auto_220417 ?auto_220419 ) ) ( not ( = ?auto_220418 ?auto_220419 ) ) ( not ( = ?auto_220415 ?auto_220419 ) ) ( not ( = ?auto_220416 ?auto_220419 ) ) ( not ( = ?auto_220426 ?auto_220425 ) ) ( not ( = ?auto_220426 ?auto_220421 ) ) ( not ( = ?auto_220426 ?auto_220424 ) ) ( not ( = ?auto_220426 ?auto_220420 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_220417 ?auto_220418 ?auto_220415 ?auto_220419 ?auto_220416 ?auto_220414 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_220470 - OBJ
      ?auto_220471 - OBJ
      ?auto_220472 - OBJ
      ?auto_220473 - OBJ
      ?auto_220474 - OBJ
      ?auto_220469 - LOCATION
    )
    :vars
    (
      ?auto_220481 - LOCATION
      ?auto_220477 - CITY
      ?auto_220480 - LOCATION
      ?auto_220476 - LOCATION
      ?auto_220479 - LOCATION
      ?auto_220475 - LOCATION
      ?auto_220478 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_220481 ?auto_220477 ) ( IN-CITY ?auto_220469 ?auto_220477 ) ( not ( = ?auto_220469 ?auto_220481 ) ) ( OBJ-AT ?auto_220473 ?auto_220481 ) ( IN-CITY ?auto_220480 ?auto_220477 ) ( not ( = ?auto_220469 ?auto_220480 ) ) ( OBJ-AT ?auto_220471 ?auto_220480 ) ( IN-CITY ?auto_220476 ?auto_220477 ) ( not ( = ?auto_220469 ?auto_220476 ) ) ( OBJ-AT ?auto_220470 ?auto_220476 ) ( IN-CITY ?auto_220479 ?auto_220477 ) ( not ( = ?auto_220469 ?auto_220479 ) ) ( OBJ-AT ?auto_220474 ?auto_220479 ) ( IN-CITY ?auto_220475 ?auto_220477 ) ( not ( = ?auto_220469 ?auto_220475 ) ) ( OBJ-AT ?auto_220472 ?auto_220475 ) ( TRUCK-AT ?auto_220478 ?auto_220469 ) ( not ( = ?auto_220472 ?auto_220474 ) ) ( not ( = ?auto_220479 ?auto_220475 ) ) ( not ( = ?auto_220472 ?auto_220470 ) ) ( not ( = ?auto_220474 ?auto_220470 ) ) ( not ( = ?auto_220476 ?auto_220479 ) ) ( not ( = ?auto_220476 ?auto_220475 ) ) ( not ( = ?auto_220472 ?auto_220471 ) ) ( not ( = ?auto_220474 ?auto_220471 ) ) ( not ( = ?auto_220470 ?auto_220471 ) ) ( not ( = ?auto_220480 ?auto_220476 ) ) ( not ( = ?auto_220480 ?auto_220479 ) ) ( not ( = ?auto_220480 ?auto_220475 ) ) ( not ( = ?auto_220472 ?auto_220473 ) ) ( not ( = ?auto_220474 ?auto_220473 ) ) ( not ( = ?auto_220470 ?auto_220473 ) ) ( not ( = ?auto_220471 ?auto_220473 ) ) ( not ( = ?auto_220481 ?auto_220480 ) ) ( not ( = ?auto_220481 ?auto_220476 ) ) ( not ( = ?auto_220481 ?auto_220479 ) ) ( not ( = ?auto_220481 ?auto_220475 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_220472 ?auto_220474 ?auto_220470 ?auto_220473 ?auto_220471 ?auto_220469 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_220525 - OBJ
      ?auto_220526 - OBJ
      ?auto_220527 - OBJ
      ?auto_220528 - OBJ
      ?auto_220529 - OBJ
      ?auto_220524 - LOCATION
    )
    :vars
    (
      ?auto_220536 - LOCATION
      ?auto_220532 - CITY
      ?auto_220535 - LOCATION
      ?auto_220531 - LOCATION
      ?auto_220534 - LOCATION
      ?auto_220530 - LOCATION
      ?auto_220533 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_220536 ?auto_220532 ) ( IN-CITY ?auto_220524 ?auto_220532 ) ( not ( = ?auto_220524 ?auto_220536 ) ) ( OBJ-AT ?auto_220529 ?auto_220536 ) ( IN-CITY ?auto_220535 ?auto_220532 ) ( not ( = ?auto_220524 ?auto_220535 ) ) ( OBJ-AT ?auto_220526 ?auto_220535 ) ( IN-CITY ?auto_220531 ?auto_220532 ) ( not ( = ?auto_220524 ?auto_220531 ) ) ( OBJ-AT ?auto_220525 ?auto_220531 ) ( IN-CITY ?auto_220534 ?auto_220532 ) ( not ( = ?auto_220524 ?auto_220534 ) ) ( OBJ-AT ?auto_220527 ?auto_220534 ) ( IN-CITY ?auto_220530 ?auto_220532 ) ( not ( = ?auto_220524 ?auto_220530 ) ) ( OBJ-AT ?auto_220528 ?auto_220530 ) ( TRUCK-AT ?auto_220533 ?auto_220524 ) ( not ( = ?auto_220528 ?auto_220527 ) ) ( not ( = ?auto_220534 ?auto_220530 ) ) ( not ( = ?auto_220528 ?auto_220525 ) ) ( not ( = ?auto_220527 ?auto_220525 ) ) ( not ( = ?auto_220531 ?auto_220534 ) ) ( not ( = ?auto_220531 ?auto_220530 ) ) ( not ( = ?auto_220528 ?auto_220526 ) ) ( not ( = ?auto_220527 ?auto_220526 ) ) ( not ( = ?auto_220525 ?auto_220526 ) ) ( not ( = ?auto_220535 ?auto_220531 ) ) ( not ( = ?auto_220535 ?auto_220534 ) ) ( not ( = ?auto_220535 ?auto_220530 ) ) ( not ( = ?auto_220528 ?auto_220529 ) ) ( not ( = ?auto_220527 ?auto_220529 ) ) ( not ( = ?auto_220525 ?auto_220529 ) ) ( not ( = ?auto_220526 ?auto_220529 ) ) ( not ( = ?auto_220536 ?auto_220535 ) ) ( not ( = ?auto_220536 ?auto_220531 ) ) ( not ( = ?auto_220536 ?auto_220534 ) ) ( not ( = ?auto_220536 ?auto_220530 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_220528 ?auto_220527 ?auto_220525 ?auto_220529 ?auto_220526 ?auto_220524 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_220580 - OBJ
      ?auto_220581 - OBJ
      ?auto_220582 - OBJ
      ?auto_220583 - OBJ
      ?auto_220584 - OBJ
      ?auto_220579 - LOCATION
    )
    :vars
    (
      ?auto_220591 - LOCATION
      ?auto_220587 - CITY
      ?auto_220590 - LOCATION
      ?auto_220586 - LOCATION
      ?auto_220589 - LOCATION
      ?auto_220585 - LOCATION
      ?auto_220588 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_220591 ?auto_220587 ) ( IN-CITY ?auto_220579 ?auto_220587 ) ( not ( = ?auto_220579 ?auto_220591 ) ) ( OBJ-AT ?auto_220583 ?auto_220591 ) ( IN-CITY ?auto_220590 ?auto_220587 ) ( not ( = ?auto_220579 ?auto_220590 ) ) ( OBJ-AT ?auto_220581 ?auto_220590 ) ( IN-CITY ?auto_220586 ?auto_220587 ) ( not ( = ?auto_220579 ?auto_220586 ) ) ( OBJ-AT ?auto_220580 ?auto_220586 ) ( IN-CITY ?auto_220589 ?auto_220587 ) ( not ( = ?auto_220579 ?auto_220589 ) ) ( OBJ-AT ?auto_220582 ?auto_220589 ) ( IN-CITY ?auto_220585 ?auto_220587 ) ( not ( = ?auto_220579 ?auto_220585 ) ) ( OBJ-AT ?auto_220584 ?auto_220585 ) ( TRUCK-AT ?auto_220588 ?auto_220579 ) ( not ( = ?auto_220584 ?auto_220582 ) ) ( not ( = ?auto_220589 ?auto_220585 ) ) ( not ( = ?auto_220584 ?auto_220580 ) ) ( not ( = ?auto_220582 ?auto_220580 ) ) ( not ( = ?auto_220586 ?auto_220589 ) ) ( not ( = ?auto_220586 ?auto_220585 ) ) ( not ( = ?auto_220584 ?auto_220581 ) ) ( not ( = ?auto_220582 ?auto_220581 ) ) ( not ( = ?auto_220580 ?auto_220581 ) ) ( not ( = ?auto_220590 ?auto_220586 ) ) ( not ( = ?auto_220590 ?auto_220589 ) ) ( not ( = ?auto_220590 ?auto_220585 ) ) ( not ( = ?auto_220584 ?auto_220583 ) ) ( not ( = ?auto_220582 ?auto_220583 ) ) ( not ( = ?auto_220580 ?auto_220583 ) ) ( not ( = ?auto_220581 ?auto_220583 ) ) ( not ( = ?auto_220591 ?auto_220590 ) ) ( not ( = ?auto_220591 ?auto_220586 ) ) ( not ( = ?auto_220591 ?auto_220589 ) ) ( not ( = ?auto_220591 ?auto_220585 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_220584 ?auto_220582 ?auto_220580 ?auto_220583 ?auto_220581 ?auto_220579 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_220925 - OBJ
      ?auto_220926 - OBJ
      ?auto_220927 - OBJ
      ?auto_220928 - OBJ
      ?auto_220929 - OBJ
      ?auto_220924 - LOCATION
    )
    :vars
    (
      ?auto_220936 - LOCATION
      ?auto_220932 - CITY
      ?auto_220935 - LOCATION
      ?auto_220931 - LOCATION
      ?auto_220934 - LOCATION
      ?auto_220930 - LOCATION
      ?auto_220933 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_220936 ?auto_220932 ) ( IN-CITY ?auto_220924 ?auto_220932 ) ( not ( = ?auto_220924 ?auto_220936 ) ) ( OBJ-AT ?auto_220927 ?auto_220936 ) ( IN-CITY ?auto_220935 ?auto_220932 ) ( not ( = ?auto_220924 ?auto_220935 ) ) ( OBJ-AT ?auto_220926 ?auto_220935 ) ( IN-CITY ?auto_220931 ?auto_220932 ) ( not ( = ?auto_220924 ?auto_220931 ) ) ( OBJ-AT ?auto_220925 ?auto_220931 ) ( IN-CITY ?auto_220934 ?auto_220932 ) ( not ( = ?auto_220924 ?auto_220934 ) ) ( OBJ-AT ?auto_220929 ?auto_220934 ) ( IN-CITY ?auto_220930 ?auto_220932 ) ( not ( = ?auto_220924 ?auto_220930 ) ) ( OBJ-AT ?auto_220928 ?auto_220930 ) ( TRUCK-AT ?auto_220933 ?auto_220924 ) ( not ( = ?auto_220928 ?auto_220929 ) ) ( not ( = ?auto_220934 ?auto_220930 ) ) ( not ( = ?auto_220928 ?auto_220925 ) ) ( not ( = ?auto_220929 ?auto_220925 ) ) ( not ( = ?auto_220931 ?auto_220934 ) ) ( not ( = ?auto_220931 ?auto_220930 ) ) ( not ( = ?auto_220928 ?auto_220926 ) ) ( not ( = ?auto_220929 ?auto_220926 ) ) ( not ( = ?auto_220925 ?auto_220926 ) ) ( not ( = ?auto_220935 ?auto_220931 ) ) ( not ( = ?auto_220935 ?auto_220934 ) ) ( not ( = ?auto_220935 ?auto_220930 ) ) ( not ( = ?auto_220928 ?auto_220927 ) ) ( not ( = ?auto_220929 ?auto_220927 ) ) ( not ( = ?auto_220925 ?auto_220927 ) ) ( not ( = ?auto_220926 ?auto_220927 ) ) ( not ( = ?auto_220936 ?auto_220935 ) ) ( not ( = ?auto_220936 ?auto_220931 ) ) ( not ( = ?auto_220936 ?auto_220934 ) ) ( not ( = ?auto_220936 ?auto_220930 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_220928 ?auto_220929 ?auto_220925 ?auto_220927 ?auto_220926 ?auto_220924 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_220980 - OBJ
      ?auto_220981 - OBJ
      ?auto_220982 - OBJ
      ?auto_220983 - OBJ
      ?auto_220984 - OBJ
      ?auto_220979 - LOCATION
    )
    :vars
    (
      ?auto_220991 - LOCATION
      ?auto_220987 - CITY
      ?auto_220990 - LOCATION
      ?auto_220986 - LOCATION
      ?auto_220989 - LOCATION
      ?auto_220985 - LOCATION
      ?auto_220988 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_220991 ?auto_220987 ) ( IN-CITY ?auto_220979 ?auto_220987 ) ( not ( = ?auto_220979 ?auto_220991 ) ) ( OBJ-AT ?auto_220982 ?auto_220991 ) ( IN-CITY ?auto_220990 ?auto_220987 ) ( not ( = ?auto_220979 ?auto_220990 ) ) ( OBJ-AT ?auto_220981 ?auto_220990 ) ( IN-CITY ?auto_220986 ?auto_220987 ) ( not ( = ?auto_220979 ?auto_220986 ) ) ( OBJ-AT ?auto_220980 ?auto_220986 ) ( IN-CITY ?auto_220989 ?auto_220987 ) ( not ( = ?auto_220979 ?auto_220989 ) ) ( OBJ-AT ?auto_220983 ?auto_220989 ) ( IN-CITY ?auto_220985 ?auto_220987 ) ( not ( = ?auto_220979 ?auto_220985 ) ) ( OBJ-AT ?auto_220984 ?auto_220985 ) ( TRUCK-AT ?auto_220988 ?auto_220979 ) ( not ( = ?auto_220984 ?auto_220983 ) ) ( not ( = ?auto_220989 ?auto_220985 ) ) ( not ( = ?auto_220984 ?auto_220980 ) ) ( not ( = ?auto_220983 ?auto_220980 ) ) ( not ( = ?auto_220986 ?auto_220989 ) ) ( not ( = ?auto_220986 ?auto_220985 ) ) ( not ( = ?auto_220984 ?auto_220981 ) ) ( not ( = ?auto_220983 ?auto_220981 ) ) ( not ( = ?auto_220980 ?auto_220981 ) ) ( not ( = ?auto_220990 ?auto_220986 ) ) ( not ( = ?auto_220990 ?auto_220989 ) ) ( not ( = ?auto_220990 ?auto_220985 ) ) ( not ( = ?auto_220984 ?auto_220982 ) ) ( not ( = ?auto_220983 ?auto_220982 ) ) ( not ( = ?auto_220980 ?auto_220982 ) ) ( not ( = ?auto_220981 ?auto_220982 ) ) ( not ( = ?auto_220991 ?auto_220990 ) ) ( not ( = ?auto_220991 ?auto_220986 ) ) ( not ( = ?auto_220991 ?auto_220989 ) ) ( not ( = ?auto_220991 ?auto_220985 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_220984 ?auto_220983 ?auto_220980 ?auto_220982 ?auto_220981 ?auto_220979 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_221383 - OBJ
      ?auto_221384 - OBJ
      ?auto_221385 - OBJ
      ?auto_221386 - OBJ
      ?auto_221387 - OBJ
      ?auto_221382 - LOCATION
    )
    :vars
    (
      ?auto_221394 - LOCATION
      ?auto_221390 - CITY
      ?auto_221393 - LOCATION
      ?auto_221389 - LOCATION
      ?auto_221392 - LOCATION
      ?auto_221388 - LOCATION
      ?auto_221391 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_221394 ?auto_221390 ) ( IN-CITY ?auto_221382 ?auto_221390 ) ( not ( = ?auto_221382 ?auto_221394 ) ) ( OBJ-AT ?auto_221384 ?auto_221394 ) ( IN-CITY ?auto_221393 ?auto_221390 ) ( not ( = ?auto_221382 ?auto_221393 ) ) ( OBJ-AT ?auto_221387 ?auto_221393 ) ( IN-CITY ?auto_221389 ?auto_221390 ) ( not ( = ?auto_221382 ?auto_221389 ) ) ( OBJ-AT ?auto_221383 ?auto_221389 ) ( IN-CITY ?auto_221392 ?auto_221390 ) ( not ( = ?auto_221382 ?auto_221392 ) ) ( OBJ-AT ?auto_221386 ?auto_221392 ) ( IN-CITY ?auto_221388 ?auto_221390 ) ( not ( = ?auto_221382 ?auto_221388 ) ) ( OBJ-AT ?auto_221385 ?auto_221388 ) ( TRUCK-AT ?auto_221391 ?auto_221382 ) ( not ( = ?auto_221385 ?auto_221386 ) ) ( not ( = ?auto_221392 ?auto_221388 ) ) ( not ( = ?auto_221385 ?auto_221383 ) ) ( not ( = ?auto_221386 ?auto_221383 ) ) ( not ( = ?auto_221389 ?auto_221392 ) ) ( not ( = ?auto_221389 ?auto_221388 ) ) ( not ( = ?auto_221385 ?auto_221387 ) ) ( not ( = ?auto_221386 ?auto_221387 ) ) ( not ( = ?auto_221383 ?auto_221387 ) ) ( not ( = ?auto_221393 ?auto_221389 ) ) ( not ( = ?auto_221393 ?auto_221392 ) ) ( not ( = ?auto_221393 ?auto_221388 ) ) ( not ( = ?auto_221385 ?auto_221384 ) ) ( not ( = ?auto_221386 ?auto_221384 ) ) ( not ( = ?auto_221383 ?auto_221384 ) ) ( not ( = ?auto_221387 ?auto_221384 ) ) ( not ( = ?auto_221394 ?auto_221393 ) ) ( not ( = ?auto_221394 ?auto_221389 ) ) ( not ( = ?auto_221394 ?auto_221392 ) ) ( not ( = ?auto_221394 ?auto_221388 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_221385 ?auto_221386 ?auto_221383 ?auto_221384 ?auto_221387 ?auto_221382 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_221497 - OBJ
      ?auto_221498 - OBJ
      ?auto_221499 - OBJ
      ?auto_221500 - OBJ
      ?auto_221501 - OBJ
      ?auto_221496 - LOCATION
    )
    :vars
    (
      ?auto_221508 - LOCATION
      ?auto_221504 - CITY
      ?auto_221507 - LOCATION
      ?auto_221503 - LOCATION
      ?auto_221506 - LOCATION
      ?auto_221502 - LOCATION
      ?auto_221505 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_221508 ?auto_221504 ) ( IN-CITY ?auto_221496 ?auto_221504 ) ( not ( = ?auto_221496 ?auto_221508 ) ) ( OBJ-AT ?auto_221498 ?auto_221508 ) ( IN-CITY ?auto_221507 ?auto_221504 ) ( not ( = ?auto_221496 ?auto_221507 ) ) ( OBJ-AT ?auto_221500 ?auto_221507 ) ( IN-CITY ?auto_221503 ?auto_221504 ) ( not ( = ?auto_221496 ?auto_221503 ) ) ( OBJ-AT ?auto_221497 ?auto_221503 ) ( IN-CITY ?auto_221506 ?auto_221504 ) ( not ( = ?auto_221496 ?auto_221506 ) ) ( OBJ-AT ?auto_221501 ?auto_221506 ) ( IN-CITY ?auto_221502 ?auto_221504 ) ( not ( = ?auto_221496 ?auto_221502 ) ) ( OBJ-AT ?auto_221499 ?auto_221502 ) ( TRUCK-AT ?auto_221505 ?auto_221496 ) ( not ( = ?auto_221499 ?auto_221501 ) ) ( not ( = ?auto_221506 ?auto_221502 ) ) ( not ( = ?auto_221499 ?auto_221497 ) ) ( not ( = ?auto_221501 ?auto_221497 ) ) ( not ( = ?auto_221503 ?auto_221506 ) ) ( not ( = ?auto_221503 ?auto_221502 ) ) ( not ( = ?auto_221499 ?auto_221500 ) ) ( not ( = ?auto_221501 ?auto_221500 ) ) ( not ( = ?auto_221497 ?auto_221500 ) ) ( not ( = ?auto_221507 ?auto_221503 ) ) ( not ( = ?auto_221507 ?auto_221506 ) ) ( not ( = ?auto_221507 ?auto_221502 ) ) ( not ( = ?auto_221499 ?auto_221498 ) ) ( not ( = ?auto_221501 ?auto_221498 ) ) ( not ( = ?auto_221497 ?auto_221498 ) ) ( not ( = ?auto_221500 ?auto_221498 ) ) ( not ( = ?auto_221508 ?auto_221507 ) ) ( not ( = ?auto_221508 ?auto_221503 ) ) ( not ( = ?auto_221508 ?auto_221506 ) ) ( not ( = ?auto_221508 ?auto_221502 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_221499 ?auto_221501 ?auto_221497 ?auto_221498 ?auto_221500 ?auto_221496 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_221667 - OBJ
      ?auto_221668 - OBJ
      ?auto_221669 - OBJ
      ?auto_221670 - OBJ
      ?auto_221671 - OBJ
      ?auto_221666 - LOCATION
    )
    :vars
    (
      ?auto_221678 - LOCATION
      ?auto_221674 - CITY
      ?auto_221677 - LOCATION
      ?auto_221673 - LOCATION
      ?auto_221676 - LOCATION
      ?auto_221672 - LOCATION
      ?auto_221675 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_221678 ?auto_221674 ) ( IN-CITY ?auto_221666 ?auto_221674 ) ( not ( = ?auto_221666 ?auto_221678 ) ) ( OBJ-AT ?auto_221668 ?auto_221678 ) ( IN-CITY ?auto_221677 ?auto_221674 ) ( not ( = ?auto_221666 ?auto_221677 ) ) ( OBJ-AT ?auto_221671 ?auto_221677 ) ( IN-CITY ?auto_221673 ?auto_221674 ) ( not ( = ?auto_221666 ?auto_221673 ) ) ( OBJ-AT ?auto_221667 ?auto_221673 ) ( IN-CITY ?auto_221676 ?auto_221674 ) ( not ( = ?auto_221666 ?auto_221676 ) ) ( OBJ-AT ?auto_221669 ?auto_221676 ) ( IN-CITY ?auto_221672 ?auto_221674 ) ( not ( = ?auto_221666 ?auto_221672 ) ) ( OBJ-AT ?auto_221670 ?auto_221672 ) ( TRUCK-AT ?auto_221675 ?auto_221666 ) ( not ( = ?auto_221670 ?auto_221669 ) ) ( not ( = ?auto_221676 ?auto_221672 ) ) ( not ( = ?auto_221670 ?auto_221667 ) ) ( not ( = ?auto_221669 ?auto_221667 ) ) ( not ( = ?auto_221673 ?auto_221676 ) ) ( not ( = ?auto_221673 ?auto_221672 ) ) ( not ( = ?auto_221670 ?auto_221671 ) ) ( not ( = ?auto_221669 ?auto_221671 ) ) ( not ( = ?auto_221667 ?auto_221671 ) ) ( not ( = ?auto_221677 ?auto_221673 ) ) ( not ( = ?auto_221677 ?auto_221676 ) ) ( not ( = ?auto_221677 ?auto_221672 ) ) ( not ( = ?auto_221670 ?auto_221668 ) ) ( not ( = ?auto_221669 ?auto_221668 ) ) ( not ( = ?auto_221667 ?auto_221668 ) ) ( not ( = ?auto_221671 ?auto_221668 ) ) ( not ( = ?auto_221678 ?auto_221677 ) ) ( not ( = ?auto_221678 ?auto_221673 ) ) ( not ( = ?auto_221678 ?auto_221676 ) ) ( not ( = ?auto_221678 ?auto_221672 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_221670 ?auto_221669 ?auto_221667 ?auto_221668 ?auto_221671 ?auto_221666 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_221840 - OBJ
      ?auto_221841 - OBJ
      ?auto_221842 - OBJ
      ?auto_221843 - OBJ
      ?auto_221844 - OBJ
      ?auto_221839 - LOCATION
    )
    :vars
    (
      ?auto_221851 - LOCATION
      ?auto_221847 - CITY
      ?auto_221850 - LOCATION
      ?auto_221846 - LOCATION
      ?auto_221849 - LOCATION
      ?auto_221845 - LOCATION
      ?auto_221848 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_221851 ?auto_221847 ) ( IN-CITY ?auto_221839 ?auto_221847 ) ( not ( = ?auto_221839 ?auto_221851 ) ) ( OBJ-AT ?auto_221841 ?auto_221851 ) ( IN-CITY ?auto_221850 ?auto_221847 ) ( not ( = ?auto_221839 ?auto_221850 ) ) ( OBJ-AT ?auto_221843 ?auto_221850 ) ( IN-CITY ?auto_221846 ?auto_221847 ) ( not ( = ?auto_221839 ?auto_221846 ) ) ( OBJ-AT ?auto_221840 ?auto_221846 ) ( IN-CITY ?auto_221849 ?auto_221847 ) ( not ( = ?auto_221839 ?auto_221849 ) ) ( OBJ-AT ?auto_221842 ?auto_221849 ) ( IN-CITY ?auto_221845 ?auto_221847 ) ( not ( = ?auto_221839 ?auto_221845 ) ) ( OBJ-AT ?auto_221844 ?auto_221845 ) ( TRUCK-AT ?auto_221848 ?auto_221839 ) ( not ( = ?auto_221844 ?auto_221842 ) ) ( not ( = ?auto_221849 ?auto_221845 ) ) ( not ( = ?auto_221844 ?auto_221840 ) ) ( not ( = ?auto_221842 ?auto_221840 ) ) ( not ( = ?auto_221846 ?auto_221849 ) ) ( not ( = ?auto_221846 ?auto_221845 ) ) ( not ( = ?auto_221844 ?auto_221843 ) ) ( not ( = ?auto_221842 ?auto_221843 ) ) ( not ( = ?auto_221840 ?auto_221843 ) ) ( not ( = ?auto_221850 ?auto_221846 ) ) ( not ( = ?auto_221850 ?auto_221849 ) ) ( not ( = ?auto_221850 ?auto_221845 ) ) ( not ( = ?auto_221844 ?auto_221841 ) ) ( not ( = ?auto_221842 ?auto_221841 ) ) ( not ( = ?auto_221840 ?auto_221841 ) ) ( not ( = ?auto_221843 ?auto_221841 ) ) ( not ( = ?auto_221851 ?auto_221850 ) ) ( not ( = ?auto_221851 ?auto_221846 ) ) ( not ( = ?auto_221851 ?auto_221849 ) ) ( not ( = ?auto_221851 ?auto_221845 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_221844 ?auto_221842 ?auto_221840 ?auto_221841 ?auto_221843 ?auto_221839 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_222369 - OBJ
      ?auto_222370 - OBJ
      ?auto_222371 - OBJ
      ?auto_222372 - OBJ
      ?auto_222373 - OBJ
      ?auto_222368 - LOCATION
    )
    :vars
    (
      ?auto_222380 - LOCATION
      ?auto_222376 - CITY
      ?auto_222379 - LOCATION
      ?auto_222375 - LOCATION
      ?auto_222378 - LOCATION
      ?auto_222374 - LOCATION
      ?auto_222377 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_222380 ?auto_222376 ) ( IN-CITY ?auto_222368 ?auto_222376 ) ( not ( = ?auto_222368 ?auto_222380 ) ) ( OBJ-AT ?auto_222370 ?auto_222380 ) ( IN-CITY ?auto_222379 ?auto_222376 ) ( not ( = ?auto_222368 ?auto_222379 ) ) ( OBJ-AT ?auto_222371 ?auto_222379 ) ( IN-CITY ?auto_222375 ?auto_222376 ) ( not ( = ?auto_222368 ?auto_222375 ) ) ( OBJ-AT ?auto_222369 ?auto_222375 ) ( IN-CITY ?auto_222378 ?auto_222376 ) ( not ( = ?auto_222368 ?auto_222378 ) ) ( OBJ-AT ?auto_222373 ?auto_222378 ) ( IN-CITY ?auto_222374 ?auto_222376 ) ( not ( = ?auto_222368 ?auto_222374 ) ) ( OBJ-AT ?auto_222372 ?auto_222374 ) ( TRUCK-AT ?auto_222377 ?auto_222368 ) ( not ( = ?auto_222372 ?auto_222373 ) ) ( not ( = ?auto_222378 ?auto_222374 ) ) ( not ( = ?auto_222372 ?auto_222369 ) ) ( not ( = ?auto_222373 ?auto_222369 ) ) ( not ( = ?auto_222375 ?auto_222378 ) ) ( not ( = ?auto_222375 ?auto_222374 ) ) ( not ( = ?auto_222372 ?auto_222371 ) ) ( not ( = ?auto_222373 ?auto_222371 ) ) ( not ( = ?auto_222369 ?auto_222371 ) ) ( not ( = ?auto_222379 ?auto_222375 ) ) ( not ( = ?auto_222379 ?auto_222378 ) ) ( not ( = ?auto_222379 ?auto_222374 ) ) ( not ( = ?auto_222372 ?auto_222370 ) ) ( not ( = ?auto_222373 ?auto_222370 ) ) ( not ( = ?auto_222369 ?auto_222370 ) ) ( not ( = ?auto_222371 ?auto_222370 ) ) ( not ( = ?auto_222380 ?auto_222379 ) ) ( not ( = ?auto_222380 ?auto_222375 ) ) ( not ( = ?auto_222380 ?auto_222378 ) ) ( not ( = ?auto_222380 ?auto_222374 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_222372 ?auto_222373 ?auto_222369 ?auto_222370 ?auto_222371 ?auto_222368 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_222424 - OBJ
      ?auto_222425 - OBJ
      ?auto_222426 - OBJ
      ?auto_222427 - OBJ
      ?auto_222428 - OBJ
      ?auto_222423 - LOCATION
    )
    :vars
    (
      ?auto_222435 - LOCATION
      ?auto_222431 - CITY
      ?auto_222434 - LOCATION
      ?auto_222430 - LOCATION
      ?auto_222433 - LOCATION
      ?auto_222429 - LOCATION
      ?auto_222432 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_222435 ?auto_222431 ) ( IN-CITY ?auto_222423 ?auto_222431 ) ( not ( = ?auto_222423 ?auto_222435 ) ) ( OBJ-AT ?auto_222425 ?auto_222435 ) ( IN-CITY ?auto_222434 ?auto_222431 ) ( not ( = ?auto_222423 ?auto_222434 ) ) ( OBJ-AT ?auto_222426 ?auto_222434 ) ( IN-CITY ?auto_222430 ?auto_222431 ) ( not ( = ?auto_222423 ?auto_222430 ) ) ( OBJ-AT ?auto_222424 ?auto_222430 ) ( IN-CITY ?auto_222433 ?auto_222431 ) ( not ( = ?auto_222423 ?auto_222433 ) ) ( OBJ-AT ?auto_222427 ?auto_222433 ) ( IN-CITY ?auto_222429 ?auto_222431 ) ( not ( = ?auto_222423 ?auto_222429 ) ) ( OBJ-AT ?auto_222428 ?auto_222429 ) ( TRUCK-AT ?auto_222432 ?auto_222423 ) ( not ( = ?auto_222428 ?auto_222427 ) ) ( not ( = ?auto_222433 ?auto_222429 ) ) ( not ( = ?auto_222428 ?auto_222424 ) ) ( not ( = ?auto_222427 ?auto_222424 ) ) ( not ( = ?auto_222430 ?auto_222433 ) ) ( not ( = ?auto_222430 ?auto_222429 ) ) ( not ( = ?auto_222428 ?auto_222426 ) ) ( not ( = ?auto_222427 ?auto_222426 ) ) ( not ( = ?auto_222424 ?auto_222426 ) ) ( not ( = ?auto_222434 ?auto_222430 ) ) ( not ( = ?auto_222434 ?auto_222433 ) ) ( not ( = ?auto_222434 ?auto_222429 ) ) ( not ( = ?auto_222428 ?auto_222425 ) ) ( not ( = ?auto_222427 ?auto_222425 ) ) ( not ( = ?auto_222424 ?auto_222425 ) ) ( not ( = ?auto_222426 ?auto_222425 ) ) ( not ( = ?auto_222435 ?auto_222434 ) ) ( not ( = ?auto_222435 ?auto_222430 ) ) ( not ( = ?auto_222435 ?auto_222433 ) ) ( not ( = ?auto_222435 ?auto_222429 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_222428 ?auto_222427 ?auto_222424 ?auto_222425 ?auto_222426 ?auto_222423 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_223244 - OBJ
      ?auto_223245 - OBJ
      ?auto_223246 - OBJ
      ?auto_223247 - OBJ
      ?auto_223248 - OBJ
      ?auto_223243 - LOCATION
    )
    :vars
    (
      ?auto_223255 - LOCATION
      ?auto_223251 - CITY
      ?auto_223254 - LOCATION
      ?auto_223250 - LOCATION
      ?auto_223253 - LOCATION
      ?auto_223249 - LOCATION
      ?auto_223252 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_223255 ?auto_223251 ) ( IN-CITY ?auto_223243 ?auto_223251 ) ( not ( = ?auto_223243 ?auto_223255 ) ) ( OBJ-AT ?auto_223248 ?auto_223255 ) ( IN-CITY ?auto_223254 ?auto_223251 ) ( not ( = ?auto_223243 ?auto_223254 ) ) ( OBJ-AT ?auto_223244 ?auto_223254 ) ( IN-CITY ?auto_223250 ?auto_223251 ) ( not ( = ?auto_223243 ?auto_223250 ) ) ( OBJ-AT ?auto_223247 ?auto_223250 ) ( IN-CITY ?auto_223253 ?auto_223251 ) ( not ( = ?auto_223243 ?auto_223253 ) ) ( OBJ-AT ?auto_223246 ?auto_223253 ) ( IN-CITY ?auto_223249 ?auto_223251 ) ( not ( = ?auto_223243 ?auto_223249 ) ) ( OBJ-AT ?auto_223245 ?auto_223249 ) ( TRUCK-AT ?auto_223252 ?auto_223243 ) ( not ( = ?auto_223245 ?auto_223246 ) ) ( not ( = ?auto_223253 ?auto_223249 ) ) ( not ( = ?auto_223245 ?auto_223247 ) ) ( not ( = ?auto_223246 ?auto_223247 ) ) ( not ( = ?auto_223250 ?auto_223253 ) ) ( not ( = ?auto_223250 ?auto_223249 ) ) ( not ( = ?auto_223245 ?auto_223244 ) ) ( not ( = ?auto_223246 ?auto_223244 ) ) ( not ( = ?auto_223247 ?auto_223244 ) ) ( not ( = ?auto_223254 ?auto_223250 ) ) ( not ( = ?auto_223254 ?auto_223253 ) ) ( not ( = ?auto_223254 ?auto_223249 ) ) ( not ( = ?auto_223245 ?auto_223248 ) ) ( not ( = ?auto_223246 ?auto_223248 ) ) ( not ( = ?auto_223247 ?auto_223248 ) ) ( not ( = ?auto_223244 ?auto_223248 ) ) ( not ( = ?auto_223255 ?auto_223254 ) ) ( not ( = ?auto_223255 ?auto_223250 ) ) ( not ( = ?auto_223255 ?auto_223253 ) ) ( not ( = ?auto_223255 ?auto_223249 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_223245 ?auto_223246 ?auto_223247 ?auto_223248 ?auto_223244 ?auto_223243 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_223299 - OBJ
      ?auto_223300 - OBJ
      ?auto_223301 - OBJ
      ?auto_223302 - OBJ
      ?auto_223303 - OBJ
      ?auto_223298 - LOCATION
    )
    :vars
    (
      ?auto_223310 - LOCATION
      ?auto_223306 - CITY
      ?auto_223309 - LOCATION
      ?auto_223305 - LOCATION
      ?auto_223308 - LOCATION
      ?auto_223304 - LOCATION
      ?auto_223307 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_223310 ?auto_223306 ) ( IN-CITY ?auto_223298 ?auto_223306 ) ( not ( = ?auto_223298 ?auto_223310 ) ) ( OBJ-AT ?auto_223302 ?auto_223310 ) ( IN-CITY ?auto_223309 ?auto_223306 ) ( not ( = ?auto_223298 ?auto_223309 ) ) ( OBJ-AT ?auto_223299 ?auto_223309 ) ( IN-CITY ?auto_223305 ?auto_223306 ) ( not ( = ?auto_223298 ?auto_223305 ) ) ( OBJ-AT ?auto_223303 ?auto_223305 ) ( IN-CITY ?auto_223308 ?auto_223306 ) ( not ( = ?auto_223298 ?auto_223308 ) ) ( OBJ-AT ?auto_223301 ?auto_223308 ) ( IN-CITY ?auto_223304 ?auto_223306 ) ( not ( = ?auto_223298 ?auto_223304 ) ) ( OBJ-AT ?auto_223300 ?auto_223304 ) ( TRUCK-AT ?auto_223307 ?auto_223298 ) ( not ( = ?auto_223300 ?auto_223301 ) ) ( not ( = ?auto_223308 ?auto_223304 ) ) ( not ( = ?auto_223300 ?auto_223303 ) ) ( not ( = ?auto_223301 ?auto_223303 ) ) ( not ( = ?auto_223305 ?auto_223308 ) ) ( not ( = ?auto_223305 ?auto_223304 ) ) ( not ( = ?auto_223300 ?auto_223299 ) ) ( not ( = ?auto_223301 ?auto_223299 ) ) ( not ( = ?auto_223303 ?auto_223299 ) ) ( not ( = ?auto_223309 ?auto_223305 ) ) ( not ( = ?auto_223309 ?auto_223308 ) ) ( not ( = ?auto_223309 ?auto_223304 ) ) ( not ( = ?auto_223300 ?auto_223302 ) ) ( not ( = ?auto_223301 ?auto_223302 ) ) ( not ( = ?auto_223303 ?auto_223302 ) ) ( not ( = ?auto_223299 ?auto_223302 ) ) ( not ( = ?auto_223310 ?auto_223309 ) ) ( not ( = ?auto_223310 ?auto_223305 ) ) ( not ( = ?auto_223310 ?auto_223308 ) ) ( not ( = ?auto_223310 ?auto_223304 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_223300 ?auto_223301 ?auto_223303 ?auto_223302 ?auto_223299 ?auto_223298 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_223354 - OBJ
      ?auto_223355 - OBJ
      ?auto_223356 - OBJ
      ?auto_223357 - OBJ
      ?auto_223358 - OBJ
      ?auto_223353 - LOCATION
    )
    :vars
    (
      ?auto_223365 - LOCATION
      ?auto_223361 - CITY
      ?auto_223364 - LOCATION
      ?auto_223360 - LOCATION
      ?auto_223363 - LOCATION
      ?auto_223359 - LOCATION
      ?auto_223362 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_223365 ?auto_223361 ) ( IN-CITY ?auto_223353 ?auto_223361 ) ( not ( = ?auto_223353 ?auto_223365 ) ) ( OBJ-AT ?auto_223358 ?auto_223365 ) ( IN-CITY ?auto_223364 ?auto_223361 ) ( not ( = ?auto_223353 ?auto_223364 ) ) ( OBJ-AT ?auto_223354 ?auto_223364 ) ( IN-CITY ?auto_223360 ?auto_223361 ) ( not ( = ?auto_223353 ?auto_223360 ) ) ( OBJ-AT ?auto_223356 ?auto_223360 ) ( IN-CITY ?auto_223363 ?auto_223361 ) ( not ( = ?auto_223353 ?auto_223363 ) ) ( OBJ-AT ?auto_223357 ?auto_223363 ) ( IN-CITY ?auto_223359 ?auto_223361 ) ( not ( = ?auto_223353 ?auto_223359 ) ) ( OBJ-AT ?auto_223355 ?auto_223359 ) ( TRUCK-AT ?auto_223362 ?auto_223353 ) ( not ( = ?auto_223355 ?auto_223357 ) ) ( not ( = ?auto_223363 ?auto_223359 ) ) ( not ( = ?auto_223355 ?auto_223356 ) ) ( not ( = ?auto_223357 ?auto_223356 ) ) ( not ( = ?auto_223360 ?auto_223363 ) ) ( not ( = ?auto_223360 ?auto_223359 ) ) ( not ( = ?auto_223355 ?auto_223354 ) ) ( not ( = ?auto_223357 ?auto_223354 ) ) ( not ( = ?auto_223356 ?auto_223354 ) ) ( not ( = ?auto_223364 ?auto_223360 ) ) ( not ( = ?auto_223364 ?auto_223363 ) ) ( not ( = ?auto_223364 ?auto_223359 ) ) ( not ( = ?auto_223355 ?auto_223358 ) ) ( not ( = ?auto_223357 ?auto_223358 ) ) ( not ( = ?auto_223356 ?auto_223358 ) ) ( not ( = ?auto_223354 ?auto_223358 ) ) ( not ( = ?auto_223365 ?auto_223364 ) ) ( not ( = ?auto_223365 ?auto_223360 ) ) ( not ( = ?auto_223365 ?auto_223363 ) ) ( not ( = ?auto_223365 ?auto_223359 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_223355 ?auto_223357 ?auto_223356 ?auto_223358 ?auto_223354 ?auto_223353 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_223409 - OBJ
      ?auto_223410 - OBJ
      ?auto_223411 - OBJ
      ?auto_223412 - OBJ
      ?auto_223413 - OBJ
      ?auto_223408 - LOCATION
    )
    :vars
    (
      ?auto_223420 - LOCATION
      ?auto_223416 - CITY
      ?auto_223419 - LOCATION
      ?auto_223415 - LOCATION
      ?auto_223418 - LOCATION
      ?auto_223414 - LOCATION
      ?auto_223417 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_223420 ?auto_223416 ) ( IN-CITY ?auto_223408 ?auto_223416 ) ( not ( = ?auto_223408 ?auto_223420 ) ) ( OBJ-AT ?auto_223412 ?auto_223420 ) ( IN-CITY ?auto_223419 ?auto_223416 ) ( not ( = ?auto_223408 ?auto_223419 ) ) ( OBJ-AT ?auto_223409 ?auto_223419 ) ( IN-CITY ?auto_223415 ?auto_223416 ) ( not ( = ?auto_223408 ?auto_223415 ) ) ( OBJ-AT ?auto_223411 ?auto_223415 ) ( IN-CITY ?auto_223418 ?auto_223416 ) ( not ( = ?auto_223408 ?auto_223418 ) ) ( OBJ-AT ?auto_223413 ?auto_223418 ) ( IN-CITY ?auto_223414 ?auto_223416 ) ( not ( = ?auto_223408 ?auto_223414 ) ) ( OBJ-AT ?auto_223410 ?auto_223414 ) ( TRUCK-AT ?auto_223417 ?auto_223408 ) ( not ( = ?auto_223410 ?auto_223413 ) ) ( not ( = ?auto_223418 ?auto_223414 ) ) ( not ( = ?auto_223410 ?auto_223411 ) ) ( not ( = ?auto_223413 ?auto_223411 ) ) ( not ( = ?auto_223415 ?auto_223418 ) ) ( not ( = ?auto_223415 ?auto_223414 ) ) ( not ( = ?auto_223410 ?auto_223409 ) ) ( not ( = ?auto_223413 ?auto_223409 ) ) ( not ( = ?auto_223411 ?auto_223409 ) ) ( not ( = ?auto_223419 ?auto_223415 ) ) ( not ( = ?auto_223419 ?auto_223418 ) ) ( not ( = ?auto_223419 ?auto_223414 ) ) ( not ( = ?auto_223410 ?auto_223412 ) ) ( not ( = ?auto_223413 ?auto_223412 ) ) ( not ( = ?auto_223411 ?auto_223412 ) ) ( not ( = ?auto_223409 ?auto_223412 ) ) ( not ( = ?auto_223420 ?auto_223419 ) ) ( not ( = ?auto_223420 ?auto_223415 ) ) ( not ( = ?auto_223420 ?auto_223418 ) ) ( not ( = ?auto_223420 ?auto_223414 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_223410 ?auto_223413 ?auto_223411 ?auto_223412 ?auto_223409 ?auto_223408 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_223696 - OBJ
      ?auto_223697 - OBJ
      ?auto_223698 - OBJ
      ?auto_223699 - OBJ
      ?auto_223700 - OBJ
      ?auto_223695 - LOCATION
    )
    :vars
    (
      ?auto_223707 - LOCATION
      ?auto_223703 - CITY
      ?auto_223706 - LOCATION
      ?auto_223702 - LOCATION
      ?auto_223705 - LOCATION
      ?auto_223701 - LOCATION
      ?auto_223704 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_223707 ?auto_223703 ) ( IN-CITY ?auto_223695 ?auto_223703 ) ( not ( = ?auto_223695 ?auto_223707 ) ) ( OBJ-AT ?auto_223698 ?auto_223707 ) ( IN-CITY ?auto_223706 ?auto_223703 ) ( not ( = ?auto_223695 ?auto_223706 ) ) ( OBJ-AT ?auto_223696 ?auto_223706 ) ( IN-CITY ?auto_223702 ?auto_223703 ) ( not ( = ?auto_223695 ?auto_223702 ) ) ( OBJ-AT ?auto_223700 ?auto_223702 ) ( IN-CITY ?auto_223705 ?auto_223703 ) ( not ( = ?auto_223695 ?auto_223705 ) ) ( OBJ-AT ?auto_223699 ?auto_223705 ) ( IN-CITY ?auto_223701 ?auto_223703 ) ( not ( = ?auto_223695 ?auto_223701 ) ) ( OBJ-AT ?auto_223697 ?auto_223701 ) ( TRUCK-AT ?auto_223704 ?auto_223695 ) ( not ( = ?auto_223697 ?auto_223699 ) ) ( not ( = ?auto_223705 ?auto_223701 ) ) ( not ( = ?auto_223697 ?auto_223700 ) ) ( not ( = ?auto_223699 ?auto_223700 ) ) ( not ( = ?auto_223702 ?auto_223705 ) ) ( not ( = ?auto_223702 ?auto_223701 ) ) ( not ( = ?auto_223697 ?auto_223696 ) ) ( not ( = ?auto_223699 ?auto_223696 ) ) ( not ( = ?auto_223700 ?auto_223696 ) ) ( not ( = ?auto_223706 ?auto_223702 ) ) ( not ( = ?auto_223706 ?auto_223705 ) ) ( not ( = ?auto_223706 ?auto_223701 ) ) ( not ( = ?auto_223697 ?auto_223698 ) ) ( not ( = ?auto_223699 ?auto_223698 ) ) ( not ( = ?auto_223700 ?auto_223698 ) ) ( not ( = ?auto_223696 ?auto_223698 ) ) ( not ( = ?auto_223707 ?auto_223706 ) ) ( not ( = ?auto_223707 ?auto_223702 ) ) ( not ( = ?auto_223707 ?auto_223705 ) ) ( not ( = ?auto_223707 ?auto_223701 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_223697 ?auto_223699 ?auto_223700 ?auto_223698 ?auto_223696 ?auto_223695 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_223751 - OBJ
      ?auto_223752 - OBJ
      ?auto_223753 - OBJ
      ?auto_223754 - OBJ
      ?auto_223755 - OBJ
      ?auto_223750 - LOCATION
    )
    :vars
    (
      ?auto_223762 - LOCATION
      ?auto_223758 - CITY
      ?auto_223761 - LOCATION
      ?auto_223757 - LOCATION
      ?auto_223760 - LOCATION
      ?auto_223756 - LOCATION
      ?auto_223759 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_223762 ?auto_223758 ) ( IN-CITY ?auto_223750 ?auto_223758 ) ( not ( = ?auto_223750 ?auto_223762 ) ) ( OBJ-AT ?auto_223753 ?auto_223762 ) ( IN-CITY ?auto_223761 ?auto_223758 ) ( not ( = ?auto_223750 ?auto_223761 ) ) ( OBJ-AT ?auto_223751 ?auto_223761 ) ( IN-CITY ?auto_223757 ?auto_223758 ) ( not ( = ?auto_223750 ?auto_223757 ) ) ( OBJ-AT ?auto_223754 ?auto_223757 ) ( IN-CITY ?auto_223760 ?auto_223758 ) ( not ( = ?auto_223750 ?auto_223760 ) ) ( OBJ-AT ?auto_223755 ?auto_223760 ) ( IN-CITY ?auto_223756 ?auto_223758 ) ( not ( = ?auto_223750 ?auto_223756 ) ) ( OBJ-AT ?auto_223752 ?auto_223756 ) ( TRUCK-AT ?auto_223759 ?auto_223750 ) ( not ( = ?auto_223752 ?auto_223755 ) ) ( not ( = ?auto_223760 ?auto_223756 ) ) ( not ( = ?auto_223752 ?auto_223754 ) ) ( not ( = ?auto_223755 ?auto_223754 ) ) ( not ( = ?auto_223757 ?auto_223760 ) ) ( not ( = ?auto_223757 ?auto_223756 ) ) ( not ( = ?auto_223752 ?auto_223751 ) ) ( not ( = ?auto_223755 ?auto_223751 ) ) ( not ( = ?auto_223754 ?auto_223751 ) ) ( not ( = ?auto_223761 ?auto_223757 ) ) ( not ( = ?auto_223761 ?auto_223760 ) ) ( not ( = ?auto_223761 ?auto_223756 ) ) ( not ( = ?auto_223752 ?auto_223753 ) ) ( not ( = ?auto_223755 ?auto_223753 ) ) ( not ( = ?auto_223754 ?auto_223753 ) ) ( not ( = ?auto_223751 ?auto_223753 ) ) ( not ( = ?auto_223762 ?auto_223761 ) ) ( not ( = ?auto_223762 ?auto_223757 ) ) ( not ( = ?auto_223762 ?auto_223760 ) ) ( not ( = ?auto_223762 ?auto_223756 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_223752 ?auto_223755 ?auto_223754 ?auto_223753 ?auto_223751 ?auto_223750 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_223980 - OBJ
      ?auto_223981 - OBJ
      ?auto_223982 - OBJ
      ?auto_223983 - OBJ
      ?auto_223984 - OBJ
      ?auto_223979 - LOCATION
    )
    :vars
    (
      ?auto_223991 - LOCATION
      ?auto_223987 - CITY
      ?auto_223990 - LOCATION
      ?auto_223986 - LOCATION
      ?auto_223989 - LOCATION
      ?auto_223985 - LOCATION
      ?auto_223988 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_223991 ?auto_223987 ) ( IN-CITY ?auto_223979 ?auto_223987 ) ( not ( = ?auto_223979 ?auto_223991 ) ) ( OBJ-AT ?auto_223984 ?auto_223991 ) ( IN-CITY ?auto_223990 ?auto_223987 ) ( not ( = ?auto_223979 ?auto_223990 ) ) ( OBJ-AT ?auto_223980 ?auto_223990 ) ( IN-CITY ?auto_223986 ?auto_223987 ) ( not ( = ?auto_223979 ?auto_223986 ) ) ( OBJ-AT ?auto_223983 ?auto_223986 ) ( IN-CITY ?auto_223989 ?auto_223987 ) ( not ( = ?auto_223979 ?auto_223989 ) ) ( OBJ-AT ?auto_223981 ?auto_223989 ) ( IN-CITY ?auto_223985 ?auto_223987 ) ( not ( = ?auto_223979 ?auto_223985 ) ) ( OBJ-AT ?auto_223982 ?auto_223985 ) ( TRUCK-AT ?auto_223988 ?auto_223979 ) ( not ( = ?auto_223982 ?auto_223981 ) ) ( not ( = ?auto_223989 ?auto_223985 ) ) ( not ( = ?auto_223982 ?auto_223983 ) ) ( not ( = ?auto_223981 ?auto_223983 ) ) ( not ( = ?auto_223986 ?auto_223989 ) ) ( not ( = ?auto_223986 ?auto_223985 ) ) ( not ( = ?auto_223982 ?auto_223980 ) ) ( not ( = ?auto_223981 ?auto_223980 ) ) ( not ( = ?auto_223983 ?auto_223980 ) ) ( not ( = ?auto_223990 ?auto_223986 ) ) ( not ( = ?auto_223990 ?auto_223989 ) ) ( not ( = ?auto_223990 ?auto_223985 ) ) ( not ( = ?auto_223982 ?auto_223984 ) ) ( not ( = ?auto_223981 ?auto_223984 ) ) ( not ( = ?auto_223983 ?auto_223984 ) ) ( not ( = ?auto_223980 ?auto_223984 ) ) ( not ( = ?auto_223991 ?auto_223990 ) ) ( not ( = ?auto_223991 ?auto_223986 ) ) ( not ( = ?auto_223991 ?auto_223989 ) ) ( not ( = ?auto_223991 ?auto_223985 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_223982 ?auto_223981 ?auto_223983 ?auto_223984 ?auto_223980 ?auto_223979 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224035 - OBJ
      ?auto_224036 - OBJ
      ?auto_224037 - OBJ
      ?auto_224038 - OBJ
      ?auto_224039 - OBJ
      ?auto_224034 - LOCATION
    )
    :vars
    (
      ?auto_224046 - LOCATION
      ?auto_224042 - CITY
      ?auto_224045 - LOCATION
      ?auto_224041 - LOCATION
      ?auto_224044 - LOCATION
      ?auto_224040 - LOCATION
      ?auto_224043 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224046 ?auto_224042 ) ( IN-CITY ?auto_224034 ?auto_224042 ) ( not ( = ?auto_224034 ?auto_224046 ) ) ( OBJ-AT ?auto_224038 ?auto_224046 ) ( IN-CITY ?auto_224045 ?auto_224042 ) ( not ( = ?auto_224034 ?auto_224045 ) ) ( OBJ-AT ?auto_224035 ?auto_224045 ) ( IN-CITY ?auto_224041 ?auto_224042 ) ( not ( = ?auto_224034 ?auto_224041 ) ) ( OBJ-AT ?auto_224039 ?auto_224041 ) ( IN-CITY ?auto_224044 ?auto_224042 ) ( not ( = ?auto_224034 ?auto_224044 ) ) ( OBJ-AT ?auto_224036 ?auto_224044 ) ( IN-CITY ?auto_224040 ?auto_224042 ) ( not ( = ?auto_224034 ?auto_224040 ) ) ( OBJ-AT ?auto_224037 ?auto_224040 ) ( TRUCK-AT ?auto_224043 ?auto_224034 ) ( not ( = ?auto_224037 ?auto_224036 ) ) ( not ( = ?auto_224044 ?auto_224040 ) ) ( not ( = ?auto_224037 ?auto_224039 ) ) ( not ( = ?auto_224036 ?auto_224039 ) ) ( not ( = ?auto_224041 ?auto_224044 ) ) ( not ( = ?auto_224041 ?auto_224040 ) ) ( not ( = ?auto_224037 ?auto_224035 ) ) ( not ( = ?auto_224036 ?auto_224035 ) ) ( not ( = ?auto_224039 ?auto_224035 ) ) ( not ( = ?auto_224045 ?auto_224041 ) ) ( not ( = ?auto_224045 ?auto_224044 ) ) ( not ( = ?auto_224045 ?auto_224040 ) ) ( not ( = ?auto_224037 ?auto_224038 ) ) ( not ( = ?auto_224036 ?auto_224038 ) ) ( not ( = ?auto_224039 ?auto_224038 ) ) ( not ( = ?auto_224035 ?auto_224038 ) ) ( not ( = ?auto_224046 ?auto_224045 ) ) ( not ( = ?auto_224046 ?auto_224041 ) ) ( not ( = ?auto_224046 ?auto_224044 ) ) ( not ( = ?auto_224046 ?auto_224040 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224037 ?auto_224036 ?auto_224039 ?auto_224038 ?auto_224035 ?auto_224034 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224207 - OBJ
      ?auto_224208 - OBJ
      ?auto_224209 - OBJ
      ?auto_224210 - OBJ
      ?auto_224211 - OBJ
      ?auto_224206 - LOCATION
    )
    :vars
    (
      ?auto_224218 - LOCATION
      ?auto_224214 - CITY
      ?auto_224217 - LOCATION
      ?auto_224213 - LOCATION
      ?auto_224216 - LOCATION
      ?auto_224212 - LOCATION
      ?auto_224215 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224218 ?auto_224214 ) ( IN-CITY ?auto_224206 ?auto_224214 ) ( not ( = ?auto_224206 ?auto_224218 ) ) ( OBJ-AT ?auto_224211 ?auto_224218 ) ( IN-CITY ?auto_224217 ?auto_224214 ) ( not ( = ?auto_224206 ?auto_224217 ) ) ( OBJ-AT ?auto_224207 ?auto_224217 ) ( IN-CITY ?auto_224213 ?auto_224214 ) ( not ( = ?auto_224206 ?auto_224213 ) ) ( OBJ-AT ?auto_224209 ?auto_224213 ) ( IN-CITY ?auto_224216 ?auto_224214 ) ( not ( = ?auto_224206 ?auto_224216 ) ) ( OBJ-AT ?auto_224208 ?auto_224216 ) ( IN-CITY ?auto_224212 ?auto_224214 ) ( not ( = ?auto_224206 ?auto_224212 ) ) ( OBJ-AT ?auto_224210 ?auto_224212 ) ( TRUCK-AT ?auto_224215 ?auto_224206 ) ( not ( = ?auto_224210 ?auto_224208 ) ) ( not ( = ?auto_224216 ?auto_224212 ) ) ( not ( = ?auto_224210 ?auto_224209 ) ) ( not ( = ?auto_224208 ?auto_224209 ) ) ( not ( = ?auto_224213 ?auto_224216 ) ) ( not ( = ?auto_224213 ?auto_224212 ) ) ( not ( = ?auto_224210 ?auto_224207 ) ) ( not ( = ?auto_224208 ?auto_224207 ) ) ( not ( = ?auto_224209 ?auto_224207 ) ) ( not ( = ?auto_224217 ?auto_224213 ) ) ( not ( = ?auto_224217 ?auto_224216 ) ) ( not ( = ?auto_224217 ?auto_224212 ) ) ( not ( = ?auto_224210 ?auto_224211 ) ) ( not ( = ?auto_224208 ?auto_224211 ) ) ( not ( = ?auto_224209 ?auto_224211 ) ) ( not ( = ?auto_224207 ?auto_224211 ) ) ( not ( = ?auto_224218 ?auto_224217 ) ) ( not ( = ?auto_224218 ?auto_224213 ) ) ( not ( = ?auto_224218 ?auto_224216 ) ) ( not ( = ?auto_224218 ?auto_224212 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224210 ?auto_224208 ?auto_224209 ?auto_224211 ?auto_224207 ?auto_224206 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224262 - OBJ
      ?auto_224263 - OBJ
      ?auto_224264 - OBJ
      ?auto_224265 - OBJ
      ?auto_224266 - OBJ
      ?auto_224261 - LOCATION
    )
    :vars
    (
      ?auto_224273 - LOCATION
      ?auto_224269 - CITY
      ?auto_224272 - LOCATION
      ?auto_224268 - LOCATION
      ?auto_224271 - LOCATION
      ?auto_224267 - LOCATION
      ?auto_224270 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224273 ?auto_224269 ) ( IN-CITY ?auto_224261 ?auto_224269 ) ( not ( = ?auto_224261 ?auto_224273 ) ) ( OBJ-AT ?auto_224265 ?auto_224273 ) ( IN-CITY ?auto_224272 ?auto_224269 ) ( not ( = ?auto_224261 ?auto_224272 ) ) ( OBJ-AT ?auto_224262 ?auto_224272 ) ( IN-CITY ?auto_224268 ?auto_224269 ) ( not ( = ?auto_224261 ?auto_224268 ) ) ( OBJ-AT ?auto_224264 ?auto_224268 ) ( IN-CITY ?auto_224271 ?auto_224269 ) ( not ( = ?auto_224261 ?auto_224271 ) ) ( OBJ-AT ?auto_224263 ?auto_224271 ) ( IN-CITY ?auto_224267 ?auto_224269 ) ( not ( = ?auto_224261 ?auto_224267 ) ) ( OBJ-AT ?auto_224266 ?auto_224267 ) ( TRUCK-AT ?auto_224270 ?auto_224261 ) ( not ( = ?auto_224266 ?auto_224263 ) ) ( not ( = ?auto_224271 ?auto_224267 ) ) ( not ( = ?auto_224266 ?auto_224264 ) ) ( not ( = ?auto_224263 ?auto_224264 ) ) ( not ( = ?auto_224268 ?auto_224271 ) ) ( not ( = ?auto_224268 ?auto_224267 ) ) ( not ( = ?auto_224266 ?auto_224262 ) ) ( not ( = ?auto_224263 ?auto_224262 ) ) ( not ( = ?auto_224264 ?auto_224262 ) ) ( not ( = ?auto_224272 ?auto_224268 ) ) ( not ( = ?auto_224272 ?auto_224271 ) ) ( not ( = ?auto_224272 ?auto_224267 ) ) ( not ( = ?auto_224266 ?auto_224265 ) ) ( not ( = ?auto_224263 ?auto_224265 ) ) ( not ( = ?auto_224264 ?auto_224265 ) ) ( not ( = ?auto_224262 ?auto_224265 ) ) ( not ( = ?auto_224273 ?auto_224272 ) ) ( not ( = ?auto_224273 ?auto_224268 ) ) ( not ( = ?auto_224273 ?auto_224271 ) ) ( not ( = ?auto_224273 ?auto_224267 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224266 ?auto_224263 ?auto_224264 ?auto_224265 ?auto_224262 ?auto_224261 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224490 - OBJ
      ?auto_224491 - OBJ
      ?auto_224492 - OBJ
      ?auto_224493 - OBJ
      ?auto_224494 - OBJ
      ?auto_224489 - LOCATION
    )
    :vars
    (
      ?auto_224501 - LOCATION
      ?auto_224497 - CITY
      ?auto_224500 - LOCATION
      ?auto_224496 - LOCATION
      ?auto_224499 - LOCATION
      ?auto_224495 - LOCATION
      ?auto_224498 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224501 ?auto_224497 ) ( IN-CITY ?auto_224489 ?auto_224497 ) ( not ( = ?auto_224489 ?auto_224501 ) ) ( OBJ-AT ?auto_224492 ?auto_224501 ) ( IN-CITY ?auto_224500 ?auto_224497 ) ( not ( = ?auto_224489 ?auto_224500 ) ) ( OBJ-AT ?auto_224490 ?auto_224500 ) ( IN-CITY ?auto_224496 ?auto_224497 ) ( not ( = ?auto_224489 ?auto_224496 ) ) ( OBJ-AT ?auto_224494 ?auto_224496 ) ( IN-CITY ?auto_224499 ?auto_224497 ) ( not ( = ?auto_224489 ?auto_224499 ) ) ( OBJ-AT ?auto_224491 ?auto_224499 ) ( IN-CITY ?auto_224495 ?auto_224497 ) ( not ( = ?auto_224489 ?auto_224495 ) ) ( OBJ-AT ?auto_224493 ?auto_224495 ) ( TRUCK-AT ?auto_224498 ?auto_224489 ) ( not ( = ?auto_224493 ?auto_224491 ) ) ( not ( = ?auto_224499 ?auto_224495 ) ) ( not ( = ?auto_224493 ?auto_224494 ) ) ( not ( = ?auto_224491 ?auto_224494 ) ) ( not ( = ?auto_224496 ?auto_224499 ) ) ( not ( = ?auto_224496 ?auto_224495 ) ) ( not ( = ?auto_224493 ?auto_224490 ) ) ( not ( = ?auto_224491 ?auto_224490 ) ) ( not ( = ?auto_224494 ?auto_224490 ) ) ( not ( = ?auto_224500 ?auto_224496 ) ) ( not ( = ?auto_224500 ?auto_224499 ) ) ( not ( = ?auto_224500 ?auto_224495 ) ) ( not ( = ?auto_224493 ?auto_224492 ) ) ( not ( = ?auto_224491 ?auto_224492 ) ) ( not ( = ?auto_224494 ?auto_224492 ) ) ( not ( = ?auto_224490 ?auto_224492 ) ) ( not ( = ?auto_224501 ?auto_224500 ) ) ( not ( = ?auto_224501 ?auto_224496 ) ) ( not ( = ?auto_224501 ?auto_224499 ) ) ( not ( = ?auto_224501 ?auto_224495 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224493 ?auto_224491 ?auto_224494 ?auto_224492 ?auto_224490 ?auto_224489 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224604 - OBJ
      ?auto_224605 - OBJ
      ?auto_224606 - OBJ
      ?auto_224607 - OBJ
      ?auto_224608 - OBJ
      ?auto_224603 - LOCATION
    )
    :vars
    (
      ?auto_224615 - LOCATION
      ?auto_224611 - CITY
      ?auto_224614 - LOCATION
      ?auto_224610 - LOCATION
      ?auto_224613 - LOCATION
      ?auto_224609 - LOCATION
      ?auto_224612 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224615 ?auto_224611 ) ( IN-CITY ?auto_224603 ?auto_224611 ) ( not ( = ?auto_224603 ?auto_224615 ) ) ( OBJ-AT ?auto_224606 ?auto_224615 ) ( IN-CITY ?auto_224614 ?auto_224611 ) ( not ( = ?auto_224603 ?auto_224614 ) ) ( OBJ-AT ?auto_224604 ?auto_224614 ) ( IN-CITY ?auto_224610 ?auto_224611 ) ( not ( = ?auto_224603 ?auto_224610 ) ) ( OBJ-AT ?auto_224607 ?auto_224610 ) ( IN-CITY ?auto_224613 ?auto_224611 ) ( not ( = ?auto_224603 ?auto_224613 ) ) ( OBJ-AT ?auto_224605 ?auto_224613 ) ( IN-CITY ?auto_224609 ?auto_224611 ) ( not ( = ?auto_224603 ?auto_224609 ) ) ( OBJ-AT ?auto_224608 ?auto_224609 ) ( TRUCK-AT ?auto_224612 ?auto_224603 ) ( not ( = ?auto_224608 ?auto_224605 ) ) ( not ( = ?auto_224613 ?auto_224609 ) ) ( not ( = ?auto_224608 ?auto_224607 ) ) ( not ( = ?auto_224605 ?auto_224607 ) ) ( not ( = ?auto_224610 ?auto_224613 ) ) ( not ( = ?auto_224610 ?auto_224609 ) ) ( not ( = ?auto_224608 ?auto_224604 ) ) ( not ( = ?auto_224605 ?auto_224604 ) ) ( not ( = ?auto_224607 ?auto_224604 ) ) ( not ( = ?auto_224614 ?auto_224610 ) ) ( not ( = ?auto_224614 ?auto_224613 ) ) ( not ( = ?auto_224614 ?auto_224609 ) ) ( not ( = ?auto_224608 ?auto_224606 ) ) ( not ( = ?auto_224605 ?auto_224606 ) ) ( not ( = ?auto_224607 ?auto_224606 ) ) ( not ( = ?auto_224604 ?auto_224606 ) ) ( not ( = ?auto_224615 ?auto_224614 ) ) ( not ( = ?auto_224615 ?auto_224610 ) ) ( not ( = ?auto_224615 ?auto_224613 ) ) ( not ( = ?auto_224615 ?auto_224609 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224608 ?auto_224605 ?auto_224607 ?auto_224606 ?auto_224604 ?auto_224603 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224833 - OBJ
      ?auto_224834 - OBJ
      ?auto_224835 - OBJ
      ?auto_224836 - OBJ
      ?auto_224837 - OBJ
      ?auto_224832 - LOCATION
    )
    :vars
    (
      ?auto_224844 - LOCATION
      ?auto_224840 - CITY
      ?auto_224843 - LOCATION
      ?auto_224839 - LOCATION
      ?auto_224842 - LOCATION
      ?auto_224838 - LOCATION
      ?auto_224841 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224844 ?auto_224840 ) ( IN-CITY ?auto_224832 ?auto_224840 ) ( not ( = ?auto_224832 ?auto_224844 ) ) ( OBJ-AT ?auto_224837 ?auto_224844 ) ( IN-CITY ?auto_224843 ?auto_224840 ) ( not ( = ?auto_224832 ?auto_224843 ) ) ( OBJ-AT ?auto_224833 ?auto_224843 ) ( IN-CITY ?auto_224839 ?auto_224840 ) ( not ( = ?auto_224832 ?auto_224839 ) ) ( OBJ-AT ?auto_224834 ?auto_224839 ) ( IN-CITY ?auto_224842 ?auto_224840 ) ( not ( = ?auto_224832 ?auto_224842 ) ) ( OBJ-AT ?auto_224836 ?auto_224842 ) ( IN-CITY ?auto_224838 ?auto_224840 ) ( not ( = ?auto_224832 ?auto_224838 ) ) ( OBJ-AT ?auto_224835 ?auto_224838 ) ( TRUCK-AT ?auto_224841 ?auto_224832 ) ( not ( = ?auto_224835 ?auto_224836 ) ) ( not ( = ?auto_224842 ?auto_224838 ) ) ( not ( = ?auto_224835 ?auto_224834 ) ) ( not ( = ?auto_224836 ?auto_224834 ) ) ( not ( = ?auto_224839 ?auto_224842 ) ) ( not ( = ?auto_224839 ?auto_224838 ) ) ( not ( = ?auto_224835 ?auto_224833 ) ) ( not ( = ?auto_224836 ?auto_224833 ) ) ( not ( = ?auto_224834 ?auto_224833 ) ) ( not ( = ?auto_224843 ?auto_224839 ) ) ( not ( = ?auto_224843 ?auto_224842 ) ) ( not ( = ?auto_224843 ?auto_224838 ) ) ( not ( = ?auto_224835 ?auto_224837 ) ) ( not ( = ?auto_224836 ?auto_224837 ) ) ( not ( = ?auto_224834 ?auto_224837 ) ) ( not ( = ?auto_224833 ?auto_224837 ) ) ( not ( = ?auto_224844 ?auto_224843 ) ) ( not ( = ?auto_224844 ?auto_224839 ) ) ( not ( = ?auto_224844 ?auto_224842 ) ) ( not ( = ?auto_224844 ?auto_224838 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224835 ?auto_224836 ?auto_224834 ?auto_224837 ?auto_224833 ?auto_224832 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224888 - OBJ
      ?auto_224889 - OBJ
      ?auto_224890 - OBJ
      ?auto_224891 - OBJ
      ?auto_224892 - OBJ
      ?auto_224887 - LOCATION
    )
    :vars
    (
      ?auto_224899 - LOCATION
      ?auto_224895 - CITY
      ?auto_224898 - LOCATION
      ?auto_224894 - LOCATION
      ?auto_224897 - LOCATION
      ?auto_224893 - LOCATION
      ?auto_224896 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224899 ?auto_224895 ) ( IN-CITY ?auto_224887 ?auto_224895 ) ( not ( = ?auto_224887 ?auto_224899 ) ) ( OBJ-AT ?auto_224891 ?auto_224899 ) ( IN-CITY ?auto_224898 ?auto_224895 ) ( not ( = ?auto_224887 ?auto_224898 ) ) ( OBJ-AT ?auto_224888 ?auto_224898 ) ( IN-CITY ?auto_224894 ?auto_224895 ) ( not ( = ?auto_224887 ?auto_224894 ) ) ( OBJ-AT ?auto_224889 ?auto_224894 ) ( IN-CITY ?auto_224897 ?auto_224895 ) ( not ( = ?auto_224887 ?auto_224897 ) ) ( OBJ-AT ?auto_224892 ?auto_224897 ) ( IN-CITY ?auto_224893 ?auto_224895 ) ( not ( = ?auto_224887 ?auto_224893 ) ) ( OBJ-AT ?auto_224890 ?auto_224893 ) ( TRUCK-AT ?auto_224896 ?auto_224887 ) ( not ( = ?auto_224890 ?auto_224892 ) ) ( not ( = ?auto_224897 ?auto_224893 ) ) ( not ( = ?auto_224890 ?auto_224889 ) ) ( not ( = ?auto_224892 ?auto_224889 ) ) ( not ( = ?auto_224894 ?auto_224897 ) ) ( not ( = ?auto_224894 ?auto_224893 ) ) ( not ( = ?auto_224890 ?auto_224888 ) ) ( not ( = ?auto_224892 ?auto_224888 ) ) ( not ( = ?auto_224889 ?auto_224888 ) ) ( not ( = ?auto_224898 ?auto_224894 ) ) ( not ( = ?auto_224898 ?auto_224897 ) ) ( not ( = ?auto_224898 ?auto_224893 ) ) ( not ( = ?auto_224890 ?auto_224891 ) ) ( not ( = ?auto_224892 ?auto_224891 ) ) ( not ( = ?auto_224889 ?auto_224891 ) ) ( not ( = ?auto_224888 ?auto_224891 ) ) ( not ( = ?auto_224899 ?auto_224898 ) ) ( not ( = ?auto_224899 ?auto_224894 ) ) ( not ( = ?auto_224899 ?auto_224897 ) ) ( not ( = ?auto_224899 ?auto_224893 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224890 ?auto_224892 ?auto_224889 ?auto_224891 ?auto_224888 ?auto_224887 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224943 - OBJ
      ?auto_224944 - OBJ
      ?auto_224945 - OBJ
      ?auto_224946 - OBJ
      ?auto_224947 - OBJ
      ?auto_224942 - LOCATION
    )
    :vars
    (
      ?auto_224954 - LOCATION
      ?auto_224950 - CITY
      ?auto_224953 - LOCATION
      ?auto_224949 - LOCATION
      ?auto_224952 - LOCATION
      ?auto_224948 - LOCATION
      ?auto_224951 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_224954 ?auto_224950 ) ( IN-CITY ?auto_224942 ?auto_224950 ) ( not ( = ?auto_224942 ?auto_224954 ) ) ( OBJ-AT ?auto_224947 ?auto_224954 ) ( IN-CITY ?auto_224953 ?auto_224950 ) ( not ( = ?auto_224942 ?auto_224953 ) ) ( OBJ-AT ?auto_224943 ?auto_224953 ) ( IN-CITY ?auto_224949 ?auto_224950 ) ( not ( = ?auto_224942 ?auto_224949 ) ) ( OBJ-AT ?auto_224944 ?auto_224949 ) ( IN-CITY ?auto_224952 ?auto_224950 ) ( not ( = ?auto_224942 ?auto_224952 ) ) ( OBJ-AT ?auto_224945 ?auto_224952 ) ( IN-CITY ?auto_224948 ?auto_224950 ) ( not ( = ?auto_224942 ?auto_224948 ) ) ( OBJ-AT ?auto_224946 ?auto_224948 ) ( TRUCK-AT ?auto_224951 ?auto_224942 ) ( not ( = ?auto_224946 ?auto_224945 ) ) ( not ( = ?auto_224952 ?auto_224948 ) ) ( not ( = ?auto_224946 ?auto_224944 ) ) ( not ( = ?auto_224945 ?auto_224944 ) ) ( not ( = ?auto_224949 ?auto_224952 ) ) ( not ( = ?auto_224949 ?auto_224948 ) ) ( not ( = ?auto_224946 ?auto_224943 ) ) ( not ( = ?auto_224945 ?auto_224943 ) ) ( not ( = ?auto_224944 ?auto_224943 ) ) ( not ( = ?auto_224953 ?auto_224949 ) ) ( not ( = ?auto_224953 ?auto_224952 ) ) ( not ( = ?auto_224953 ?auto_224948 ) ) ( not ( = ?auto_224946 ?auto_224947 ) ) ( not ( = ?auto_224945 ?auto_224947 ) ) ( not ( = ?auto_224944 ?auto_224947 ) ) ( not ( = ?auto_224943 ?auto_224947 ) ) ( not ( = ?auto_224954 ?auto_224953 ) ) ( not ( = ?auto_224954 ?auto_224949 ) ) ( not ( = ?auto_224954 ?auto_224952 ) ) ( not ( = ?auto_224954 ?auto_224948 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_224946 ?auto_224945 ?auto_224944 ?auto_224947 ?auto_224943 ?auto_224942 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_224998 - OBJ
      ?auto_224999 - OBJ
      ?auto_225000 - OBJ
      ?auto_225001 - OBJ
      ?auto_225002 - OBJ
      ?auto_224997 - LOCATION
    )
    :vars
    (
      ?auto_225009 - LOCATION
      ?auto_225005 - CITY
      ?auto_225008 - LOCATION
      ?auto_225004 - LOCATION
      ?auto_225007 - LOCATION
      ?auto_225003 - LOCATION
      ?auto_225006 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_225009 ?auto_225005 ) ( IN-CITY ?auto_224997 ?auto_225005 ) ( not ( = ?auto_224997 ?auto_225009 ) ) ( OBJ-AT ?auto_225001 ?auto_225009 ) ( IN-CITY ?auto_225008 ?auto_225005 ) ( not ( = ?auto_224997 ?auto_225008 ) ) ( OBJ-AT ?auto_224998 ?auto_225008 ) ( IN-CITY ?auto_225004 ?auto_225005 ) ( not ( = ?auto_224997 ?auto_225004 ) ) ( OBJ-AT ?auto_224999 ?auto_225004 ) ( IN-CITY ?auto_225007 ?auto_225005 ) ( not ( = ?auto_224997 ?auto_225007 ) ) ( OBJ-AT ?auto_225000 ?auto_225007 ) ( IN-CITY ?auto_225003 ?auto_225005 ) ( not ( = ?auto_224997 ?auto_225003 ) ) ( OBJ-AT ?auto_225002 ?auto_225003 ) ( TRUCK-AT ?auto_225006 ?auto_224997 ) ( not ( = ?auto_225002 ?auto_225000 ) ) ( not ( = ?auto_225007 ?auto_225003 ) ) ( not ( = ?auto_225002 ?auto_224999 ) ) ( not ( = ?auto_225000 ?auto_224999 ) ) ( not ( = ?auto_225004 ?auto_225007 ) ) ( not ( = ?auto_225004 ?auto_225003 ) ) ( not ( = ?auto_225002 ?auto_224998 ) ) ( not ( = ?auto_225000 ?auto_224998 ) ) ( not ( = ?auto_224999 ?auto_224998 ) ) ( not ( = ?auto_225008 ?auto_225004 ) ) ( not ( = ?auto_225008 ?auto_225007 ) ) ( not ( = ?auto_225008 ?auto_225003 ) ) ( not ( = ?auto_225002 ?auto_225001 ) ) ( not ( = ?auto_225000 ?auto_225001 ) ) ( not ( = ?auto_224999 ?auto_225001 ) ) ( not ( = ?auto_224998 ?auto_225001 ) ) ( not ( = ?auto_225009 ?auto_225008 ) ) ( not ( = ?auto_225009 ?auto_225004 ) ) ( not ( = ?auto_225009 ?auto_225007 ) ) ( not ( = ?auto_225009 ?auto_225003 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_225002 ?auto_225000 ?auto_224999 ?auto_225001 ?auto_224998 ?auto_224997 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225343 - OBJ
      ?auto_225344 - OBJ
      ?auto_225345 - OBJ
      ?auto_225346 - OBJ
      ?auto_225347 - OBJ
      ?auto_225342 - LOCATION
    )
    :vars
    (
      ?auto_225354 - LOCATION
      ?auto_225350 - CITY
      ?auto_225353 - LOCATION
      ?auto_225349 - LOCATION
      ?auto_225352 - LOCATION
      ?auto_225348 - LOCATION
      ?auto_225351 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_225354 ?auto_225350 ) ( IN-CITY ?auto_225342 ?auto_225350 ) ( not ( = ?auto_225342 ?auto_225354 ) ) ( OBJ-AT ?auto_225345 ?auto_225354 ) ( IN-CITY ?auto_225353 ?auto_225350 ) ( not ( = ?auto_225342 ?auto_225353 ) ) ( OBJ-AT ?auto_225343 ?auto_225353 ) ( IN-CITY ?auto_225349 ?auto_225350 ) ( not ( = ?auto_225342 ?auto_225349 ) ) ( OBJ-AT ?auto_225344 ?auto_225349 ) ( IN-CITY ?auto_225352 ?auto_225350 ) ( not ( = ?auto_225342 ?auto_225352 ) ) ( OBJ-AT ?auto_225347 ?auto_225352 ) ( IN-CITY ?auto_225348 ?auto_225350 ) ( not ( = ?auto_225342 ?auto_225348 ) ) ( OBJ-AT ?auto_225346 ?auto_225348 ) ( TRUCK-AT ?auto_225351 ?auto_225342 ) ( not ( = ?auto_225346 ?auto_225347 ) ) ( not ( = ?auto_225352 ?auto_225348 ) ) ( not ( = ?auto_225346 ?auto_225344 ) ) ( not ( = ?auto_225347 ?auto_225344 ) ) ( not ( = ?auto_225349 ?auto_225352 ) ) ( not ( = ?auto_225349 ?auto_225348 ) ) ( not ( = ?auto_225346 ?auto_225343 ) ) ( not ( = ?auto_225347 ?auto_225343 ) ) ( not ( = ?auto_225344 ?auto_225343 ) ) ( not ( = ?auto_225353 ?auto_225349 ) ) ( not ( = ?auto_225353 ?auto_225352 ) ) ( not ( = ?auto_225353 ?auto_225348 ) ) ( not ( = ?auto_225346 ?auto_225345 ) ) ( not ( = ?auto_225347 ?auto_225345 ) ) ( not ( = ?auto_225344 ?auto_225345 ) ) ( not ( = ?auto_225343 ?auto_225345 ) ) ( not ( = ?auto_225354 ?auto_225353 ) ) ( not ( = ?auto_225354 ?auto_225349 ) ) ( not ( = ?auto_225354 ?auto_225352 ) ) ( not ( = ?auto_225354 ?auto_225348 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_225346 ?auto_225347 ?auto_225344 ?auto_225345 ?auto_225343 ?auto_225342 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_225398 - OBJ
      ?auto_225399 - OBJ
      ?auto_225400 - OBJ
      ?auto_225401 - OBJ
      ?auto_225402 - OBJ
      ?auto_225397 - LOCATION
    )
    :vars
    (
      ?auto_225409 - LOCATION
      ?auto_225405 - CITY
      ?auto_225408 - LOCATION
      ?auto_225404 - LOCATION
      ?auto_225407 - LOCATION
      ?auto_225403 - LOCATION
      ?auto_225406 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_225409 ?auto_225405 ) ( IN-CITY ?auto_225397 ?auto_225405 ) ( not ( = ?auto_225397 ?auto_225409 ) ) ( OBJ-AT ?auto_225400 ?auto_225409 ) ( IN-CITY ?auto_225408 ?auto_225405 ) ( not ( = ?auto_225397 ?auto_225408 ) ) ( OBJ-AT ?auto_225398 ?auto_225408 ) ( IN-CITY ?auto_225404 ?auto_225405 ) ( not ( = ?auto_225397 ?auto_225404 ) ) ( OBJ-AT ?auto_225399 ?auto_225404 ) ( IN-CITY ?auto_225407 ?auto_225405 ) ( not ( = ?auto_225397 ?auto_225407 ) ) ( OBJ-AT ?auto_225401 ?auto_225407 ) ( IN-CITY ?auto_225403 ?auto_225405 ) ( not ( = ?auto_225397 ?auto_225403 ) ) ( OBJ-AT ?auto_225402 ?auto_225403 ) ( TRUCK-AT ?auto_225406 ?auto_225397 ) ( not ( = ?auto_225402 ?auto_225401 ) ) ( not ( = ?auto_225407 ?auto_225403 ) ) ( not ( = ?auto_225402 ?auto_225399 ) ) ( not ( = ?auto_225401 ?auto_225399 ) ) ( not ( = ?auto_225404 ?auto_225407 ) ) ( not ( = ?auto_225404 ?auto_225403 ) ) ( not ( = ?auto_225402 ?auto_225398 ) ) ( not ( = ?auto_225401 ?auto_225398 ) ) ( not ( = ?auto_225399 ?auto_225398 ) ) ( not ( = ?auto_225408 ?auto_225404 ) ) ( not ( = ?auto_225408 ?auto_225407 ) ) ( not ( = ?auto_225408 ?auto_225403 ) ) ( not ( = ?auto_225402 ?auto_225400 ) ) ( not ( = ?auto_225401 ?auto_225400 ) ) ( not ( = ?auto_225399 ?auto_225400 ) ) ( not ( = ?auto_225398 ?auto_225400 ) ) ( not ( = ?auto_225409 ?auto_225408 ) ) ( not ( = ?auto_225409 ?auto_225404 ) ) ( not ( = ?auto_225409 ?auto_225407 ) ) ( not ( = ?auto_225409 ?auto_225403 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_225402 ?auto_225401 ?auto_225399 ?auto_225400 ?auto_225398 ?auto_225397 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_226691 - OBJ
      ?auto_226692 - OBJ
      ?auto_226693 - OBJ
      ?auto_226694 - OBJ
      ?auto_226695 - OBJ
      ?auto_226690 - LOCATION
    )
    :vars
    (
      ?auto_226702 - LOCATION
      ?auto_226698 - CITY
      ?auto_226701 - LOCATION
      ?auto_226697 - LOCATION
      ?auto_226700 - LOCATION
      ?auto_226696 - LOCATION
      ?auto_226699 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_226702 ?auto_226698 ) ( IN-CITY ?auto_226690 ?auto_226698 ) ( not ( = ?auto_226690 ?auto_226702 ) ) ( OBJ-AT ?auto_226692 ?auto_226702 ) ( IN-CITY ?auto_226701 ?auto_226698 ) ( not ( = ?auto_226690 ?auto_226701 ) ) ( OBJ-AT ?auto_226691 ?auto_226701 ) ( IN-CITY ?auto_226697 ?auto_226698 ) ( not ( = ?auto_226690 ?auto_226697 ) ) ( OBJ-AT ?auto_226695 ?auto_226697 ) ( IN-CITY ?auto_226700 ?auto_226698 ) ( not ( = ?auto_226690 ?auto_226700 ) ) ( OBJ-AT ?auto_226694 ?auto_226700 ) ( IN-CITY ?auto_226696 ?auto_226698 ) ( not ( = ?auto_226690 ?auto_226696 ) ) ( OBJ-AT ?auto_226693 ?auto_226696 ) ( TRUCK-AT ?auto_226699 ?auto_226690 ) ( not ( = ?auto_226693 ?auto_226694 ) ) ( not ( = ?auto_226700 ?auto_226696 ) ) ( not ( = ?auto_226693 ?auto_226695 ) ) ( not ( = ?auto_226694 ?auto_226695 ) ) ( not ( = ?auto_226697 ?auto_226700 ) ) ( not ( = ?auto_226697 ?auto_226696 ) ) ( not ( = ?auto_226693 ?auto_226691 ) ) ( not ( = ?auto_226694 ?auto_226691 ) ) ( not ( = ?auto_226695 ?auto_226691 ) ) ( not ( = ?auto_226701 ?auto_226697 ) ) ( not ( = ?auto_226701 ?auto_226700 ) ) ( not ( = ?auto_226701 ?auto_226696 ) ) ( not ( = ?auto_226693 ?auto_226692 ) ) ( not ( = ?auto_226694 ?auto_226692 ) ) ( not ( = ?auto_226695 ?auto_226692 ) ) ( not ( = ?auto_226691 ?auto_226692 ) ) ( not ( = ?auto_226702 ?auto_226701 ) ) ( not ( = ?auto_226702 ?auto_226697 ) ) ( not ( = ?auto_226702 ?auto_226700 ) ) ( not ( = ?auto_226702 ?auto_226696 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_226693 ?auto_226694 ?auto_226695 ?auto_226692 ?auto_226691 ?auto_226690 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_226746 - OBJ
      ?auto_226747 - OBJ
      ?auto_226748 - OBJ
      ?auto_226749 - OBJ
      ?auto_226750 - OBJ
      ?auto_226745 - LOCATION
    )
    :vars
    (
      ?auto_226757 - LOCATION
      ?auto_226753 - CITY
      ?auto_226756 - LOCATION
      ?auto_226752 - LOCATION
      ?auto_226755 - LOCATION
      ?auto_226751 - LOCATION
      ?auto_226754 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_226757 ?auto_226753 ) ( IN-CITY ?auto_226745 ?auto_226753 ) ( not ( = ?auto_226745 ?auto_226757 ) ) ( OBJ-AT ?auto_226747 ?auto_226757 ) ( IN-CITY ?auto_226756 ?auto_226753 ) ( not ( = ?auto_226745 ?auto_226756 ) ) ( OBJ-AT ?auto_226746 ?auto_226756 ) ( IN-CITY ?auto_226752 ?auto_226753 ) ( not ( = ?auto_226745 ?auto_226752 ) ) ( OBJ-AT ?auto_226749 ?auto_226752 ) ( IN-CITY ?auto_226755 ?auto_226753 ) ( not ( = ?auto_226745 ?auto_226755 ) ) ( OBJ-AT ?auto_226750 ?auto_226755 ) ( IN-CITY ?auto_226751 ?auto_226753 ) ( not ( = ?auto_226745 ?auto_226751 ) ) ( OBJ-AT ?auto_226748 ?auto_226751 ) ( TRUCK-AT ?auto_226754 ?auto_226745 ) ( not ( = ?auto_226748 ?auto_226750 ) ) ( not ( = ?auto_226755 ?auto_226751 ) ) ( not ( = ?auto_226748 ?auto_226749 ) ) ( not ( = ?auto_226750 ?auto_226749 ) ) ( not ( = ?auto_226752 ?auto_226755 ) ) ( not ( = ?auto_226752 ?auto_226751 ) ) ( not ( = ?auto_226748 ?auto_226746 ) ) ( not ( = ?auto_226750 ?auto_226746 ) ) ( not ( = ?auto_226749 ?auto_226746 ) ) ( not ( = ?auto_226756 ?auto_226752 ) ) ( not ( = ?auto_226756 ?auto_226755 ) ) ( not ( = ?auto_226756 ?auto_226751 ) ) ( not ( = ?auto_226748 ?auto_226747 ) ) ( not ( = ?auto_226750 ?auto_226747 ) ) ( not ( = ?auto_226749 ?auto_226747 ) ) ( not ( = ?auto_226746 ?auto_226747 ) ) ( not ( = ?auto_226757 ?auto_226756 ) ) ( not ( = ?auto_226757 ?auto_226752 ) ) ( not ( = ?auto_226757 ?auto_226755 ) ) ( not ( = ?auto_226757 ?auto_226751 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_226748 ?auto_226750 ?auto_226749 ?auto_226747 ?auto_226746 ?auto_226745 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_226975 - OBJ
      ?auto_226976 - OBJ
      ?auto_226977 - OBJ
      ?auto_226978 - OBJ
      ?auto_226979 - OBJ
      ?auto_226974 - LOCATION
    )
    :vars
    (
      ?auto_226986 - LOCATION
      ?auto_226982 - CITY
      ?auto_226985 - LOCATION
      ?auto_226981 - LOCATION
      ?auto_226984 - LOCATION
      ?auto_226980 - LOCATION
      ?auto_226983 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_226986 ?auto_226982 ) ( IN-CITY ?auto_226974 ?auto_226982 ) ( not ( = ?auto_226974 ?auto_226986 ) ) ( OBJ-AT ?auto_226976 ?auto_226986 ) ( IN-CITY ?auto_226985 ?auto_226982 ) ( not ( = ?auto_226974 ?auto_226985 ) ) ( OBJ-AT ?auto_226975 ?auto_226985 ) ( IN-CITY ?auto_226981 ?auto_226982 ) ( not ( = ?auto_226974 ?auto_226981 ) ) ( OBJ-AT ?auto_226979 ?auto_226981 ) ( IN-CITY ?auto_226984 ?auto_226982 ) ( not ( = ?auto_226974 ?auto_226984 ) ) ( OBJ-AT ?auto_226977 ?auto_226984 ) ( IN-CITY ?auto_226980 ?auto_226982 ) ( not ( = ?auto_226974 ?auto_226980 ) ) ( OBJ-AT ?auto_226978 ?auto_226980 ) ( TRUCK-AT ?auto_226983 ?auto_226974 ) ( not ( = ?auto_226978 ?auto_226977 ) ) ( not ( = ?auto_226984 ?auto_226980 ) ) ( not ( = ?auto_226978 ?auto_226979 ) ) ( not ( = ?auto_226977 ?auto_226979 ) ) ( not ( = ?auto_226981 ?auto_226984 ) ) ( not ( = ?auto_226981 ?auto_226980 ) ) ( not ( = ?auto_226978 ?auto_226975 ) ) ( not ( = ?auto_226977 ?auto_226975 ) ) ( not ( = ?auto_226979 ?auto_226975 ) ) ( not ( = ?auto_226985 ?auto_226981 ) ) ( not ( = ?auto_226985 ?auto_226984 ) ) ( not ( = ?auto_226985 ?auto_226980 ) ) ( not ( = ?auto_226978 ?auto_226976 ) ) ( not ( = ?auto_226977 ?auto_226976 ) ) ( not ( = ?auto_226979 ?auto_226976 ) ) ( not ( = ?auto_226975 ?auto_226976 ) ) ( not ( = ?auto_226986 ?auto_226985 ) ) ( not ( = ?auto_226986 ?auto_226981 ) ) ( not ( = ?auto_226986 ?auto_226984 ) ) ( not ( = ?auto_226986 ?auto_226980 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_226978 ?auto_226977 ?auto_226979 ?auto_226976 ?auto_226975 ?auto_226974 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227089 - OBJ
      ?auto_227090 - OBJ
      ?auto_227091 - OBJ
      ?auto_227092 - OBJ
      ?auto_227093 - OBJ
      ?auto_227088 - LOCATION
    )
    :vars
    (
      ?auto_227100 - LOCATION
      ?auto_227096 - CITY
      ?auto_227099 - LOCATION
      ?auto_227095 - LOCATION
      ?auto_227098 - LOCATION
      ?auto_227094 - LOCATION
      ?auto_227097 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_227100 ?auto_227096 ) ( IN-CITY ?auto_227088 ?auto_227096 ) ( not ( = ?auto_227088 ?auto_227100 ) ) ( OBJ-AT ?auto_227090 ?auto_227100 ) ( IN-CITY ?auto_227099 ?auto_227096 ) ( not ( = ?auto_227088 ?auto_227099 ) ) ( OBJ-AT ?auto_227089 ?auto_227099 ) ( IN-CITY ?auto_227095 ?auto_227096 ) ( not ( = ?auto_227088 ?auto_227095 ) ) ( OBJ-AT ?auto_227092 ?auto_227095 ) ( IN-CITY ?auto_227098 ?auto_227096 ) ( not ( = ?auto_227088 ?auto_227098 ) ) ( OBJ-AT ?auto_227091 ?auto_227098 ) ( IN-CITY ?auto_227094 ?auto_227096 ) ( not ( = ?auto_227088 ?auto_227094 ) ) ( OBJ-AT ?auto_227093 ?auto_227094 ) ( TRUCK-AT ?auto_227097 ?auto_227088 ) ( not ( = ?auto_227093 ?auto_227091 ) ) ( not ( = ?auto_227098 ?auto_227094 ) ) ( not ( = ?auto_227093 ?auto_227092 ) ) ( not ( = ?auto_227091 ?auto_227092 ) ) ( not ( = ?auto_227095 ?auto_227098 ) ) ( not ( = ?auto_227095 ?auto_227094 ) ) ( not ( = ?auto_227093 ?auto_227089 ) ) ( not ( = ?auto_227091 ?auto_227089 ) ) ( not ( = ?auto_227092 ?auto_227089 ) ) ( not ( = ?auto_227099 ?auto_227095 ) ) ( not ( = ?auto_227099 ?auto_227098 ) ) ( not ( = ?auto_227099 ?auto_227094 ) ) ( not ( = ?auto_227093 ?auto_227090 ) ) ( not ( = ?auto_227091 ?auto_227090 ) ) ( not ( = ?auto_227092 ?auto_227090 ) ) ( not ( = ?auto_227089 ?auto_227090 ) ) ( not ( = ?auto_227100 ?auto_227099 ) ) ( not ( = ?auto_227100 ?auto_227095 ) ) ( not ( = ?auto_227100 ?auto_227098 ) ) ( not ( = ?auto_227100 ?auto_227094 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_227093 ?auto_227091 ?auto_227092 ?auto_227090 ?auto_227089 ?auto_227088 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227318 - OBJ
      ?auto_227319 - OBJ
      ?auto_227320 - OBJ
      ?auto_227321 - OBJ
      ?auto_227322 - OBJ
      ?auto_227317 - LOCATION
    )
    :vars
    (
      ?auto_227329 - LOCATION
      ?auto_227325 - CITY
      ?auto_227328 - LOCATION
      ?auto_227324 - LOCATION
      ?auto_227327 - LOCATION
      ?auto_227323 - LOCATION
      ?auto_227326 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_227329 ?auto_227325 ) ( IN-CITY ?auto_227317 ?auto_227325 ) ( not ( = ?auto_227317 ?auto_227329 ) ) ( OBJ-AT ?auto_227319 ?auto_227329 ) ( IN-CITY ?auto_227328 ?auto_227325 ) ( not ( = ?auto_227317 ?auto_227328 ) ) ( OBJ-AT ?auto_227318 ?auto_227328 ) ( IN-CITY ?auto_227324 ?auto_227325 ) ( not ( = ?auto_227317 ?auto_227324 ) ) ( OBJ-AT ?auto_227320 ?auto_227324 ) ( IN-CITY ?auto_227327 ?auto_227325 ) ( not ( = ?auto_227317 ?auto_227327 ) ) ( OBJ-AT ?auto_227322 ?auto_227327 ) ( IN-CITY ?auto_227323 ?auto_227325 ) ( not ( = ?auto_227317 ?auto_227323 ) ) ( OBJ-AT ?auto_227321 ?auto_227323 ) ( TRUCK-AT ?auto_227326 ?auto_227317 ) ( not ( = ?auto_227321 ?auto_227322 ) ) ( not ( = ?auto_227327 ?auto_227323 ) ) ( not ( = ?auto_227321 ?auto_227320 ) ) ( not ( = ?auto_227322 ?auto_227320 ) ) ( not ( = ?auto_227324 ?auto_227327 ) ) ( not ( = ?auto_227324 ?auto_227323 ) ) ( not ( = ?auto_227321 ?auto_227318 ) ) ( not ( = ?auto_227322 ?auto_227318 ) ) ( not ( = ?auto_227320 ?auto_227318 ) ) ( not ( = ?auto_227328 ?auto_227324 ) ) ( not ( = ?auto_227328 ?auto_227327 ) ) ( not ( = ?auto_227328 ?auto_227323 ) ) ( not ( = ?auto_227321 ?auto_227319 ) ) ( not ( = ?auto_227322 ?auto_227319 ) ) ( not ( = ?auto_227320 ?auto_227319 ) ) ( not ( = ?auto_227318 ?auto_227319 ) ) ( not ( = ?auto_227329 ?auto_227328 ) ) ( not ( = ?auto_227329 ?auto_227324 ) ) ( not ( = ?auto_227329 ?auto_227327 ) ) ( not ( = ?auto_227329 ?auto_227323 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_227321 ?auto_227322 ?auto_227320 ?auto_227319 ?auto_227318 ?auto_227317 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_227373 - OBJ
      ?auto_227374 - OBJ
      ?auto_227375 - OBJ
      ?auto_227376 - OBJ
      ?auto_227377 - OBJ
      ?auto_227372 - LOCATION
    )
    :vars
    (
      ?auto_227384 - LOCATION
      ?auto_227380 - CITY
      ?auto_227383 - LOCATION
      ?auto_227379 - LOCATION
      ?auto_227382 - LOCATION
      ?auto_227378 - LOCATION
      ?auto_227381 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_227384 ?auto_227380 ) ( IN-CITY ?auto_227372 ?auto_227380 ) ( not ( = ?auto_227372 ?auto_227384 ) ) ( OBJ-AT ?auto_227374 ?auto_227384 ) ( IN-CITY ?auto_227383 ?auto_227380 ) ( not ( = ?auto_227372 ?auto_227383 ) ) ( OBJ-AT ?auto_227373 ?auto_227383 ) ( IN-CITY ?auto_227379 ?auto_227380 ) ( not ( = ?auto_227372 ?auto_227379 ) ) ( OBJ-AT ?auto_227375 ?auto_227379 ) ( IN-CITY ?auto_227382 ?auto_227380 ) ( not ( = ?auto_227372 ?auto_227382 ) ) ( OBJ-AT ?auto_227376 ?auto_227382 ) ( IN-CITY ?auto_227378 ?auto_227380 ) ( not ( = ?auto_227372 ?auto_227378 ) ) ( OBJ-AT ?auto_227377 ?auto_227378 ) ( TRUCK-AT ?auto_227381 ?auto_227372 ) ( not ( = ?auto_227377 ?auto_227376 ) ) ( not ( = ?auto_227382 ?auto_227378 ) ) ( not ( = ?auto_227377 ?auto_227375 ) ) ( not ( = ?auto_227376 ?auto_227375 ) ) ( not ( = ?auto_227379 ?auto_227382 ) ) ( not ( = ?auto_227379 ?auto_227378 ) ) ( not ( = ?auto_227377 ?auto_227373 ) ) ( not ( = ?auto_227376 ?auto_227373 ) ) ( not ( = ?auto_227375 ?auto_227373 ) ) ( not ( = ?auto_227383 ?auto_227379 ) ) ( not ( = ?auto_227383 ?auto_227382 ) ) ( not ( = ?auto_227383 ?auto_227378 ) ) ( not ( = ?auto_227377 ?auto_227374 ) ) ( not ( = ?auto_227376 ?auto_227374 ) ) ( not ( = ?auto_227375 ?auto_227374 ) ) ( not ( = ?auto_227373 ?auto_227374 ) ) ( not ( = ?auto_227384 ?auto_227383 ) ) ( not ( = ?auto_227384 ?auto_227379 ) ) ( not ( = ?auto_227384 ?auto_227382 ) ) ( not ( = ?auto_227384 ?auto_227378 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_227377 ?auto_227376 ?auto_227375 ?auto_227374 ?auto_227373 ?auto_227372 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_228968 - OBJ
      ?auto_228969 - OBJ
      ?auto_228970 - OBJ
      ?auto_228971 - OBJ
      ?auto_228972 - OBJ
      ?auto_228967 - LOCATION
    )
    :vars
    (
      ?auto_228979 - LOCATION
      ?auto_228975 - CITY
      ?auto_228978 - LOCATION
      ?auto_228974 - LOCATION
      ?auto_228977 - LOCATION
      ?auto_228973 - LOCATION
      ?auto_228976 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_228979 ?auto_228975 ) ( IN-CITY ?auto_228967 ?auto_228975 ) ( not ( = ?auto_228967 ?auto_228979 ) ) ( OBJ-AT ?auto_228968 ?auto_228979 ) ( IN-CITY ?auto_228978 ?auto_228975 ) ( not ( = ?auto_228967 ?auto_228978 ) ) ( OBJ-AT ?auto_228972 ?auto_228978 ) ( IN-CITY ?auto_228974 ?auto_228975 ) ( not ( = ?auto_228967 ?auto_228974 ) ) ( OBJ-AT ?auto_228971 ?auto_228974 ) ( IN-CITY ?auto_228977 ?auto_228975 ) ( not ( = ?auto_228967 ?auto_228977 ) ) ( OBJ-AT ?auto_228970 ?auto_228977 ) ( IN-CITY ?auto_228973 ?auto_228975 ) ( not ( = ?auto_228967 ?auto_228973 ) ) ( OBJ-AT ?auto_228969 ?auto_228973 ) ( TRUCK-AT ?auto_228976 ?auto_228967 ) ( not ( = ?auto_228969 ?auto_228970 ) ) ( not ( = ?auto_228977 ?auto_228973 ) ) ( not ( = ?auto_228969 ?auto_228971 ) ) ( not ( = ?auto_228970 ?auto_228971 ) ) ( not ( = ?auto_228974 ?auto_228977 ) ) ( not ( = ?auto_228974 ?auto_228973 ) ) ( not ( = ?auto_228969 ?auto_228972 ) ) ( not ( = ?auto_228970 ?auto_228972 ) ) ( not ( = ?auto_228971 ?auto_228972 ) ) ( not ( = ?auto_228978 ?auto_228974 ) ) ( not ( = ?auto_228978 ?auto_228977 ) ) ( not ( = ?auto_228978 ?auto_228973 ) ) ( not ( = ?auto_228969 ?auto_228968 ) ) ( not ( = ?auto_228970 ?auto_228968 ) ) ( not ( = ?auto_228971 ?auto_228968 ) ) ( not ( = ?auto_228972 ?auto_228968 ) ) ( not ( = ?auto_228979 ?auto_228978 ) ) ( not ( = ?auto_228979 ?auto_228974 ) ) ( not ( = ?auto_228979 ?auto_228977 ) ) ( not ( = ?auto_228979 ?auto_228973 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_228969 ?auto_228970 ?auto_228971 ?auto_228968 ?auto_228972 ?auto_228967 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229023 - OBJ
      ?auto_229024 - OBJ
      ?auto_229025 - OBJ
      ?auto_229026 - OBJ
      ?auto_229027 - OBJ
      ?auto_229022 - LOCATION
    )
    :vars
    (
      ?auto_229034 - LOCATION
      ?auto_229030 - CITY
      ?auto_229033 - LOCATION
      ?auto_229029 - LOCATION
      ?auto_229032 - LOCATION
      ?auto_229028 - LOCATION
      ?auto_229031 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229034 ?auto_229030 ) ( IN-CITY ?auto_229022 ?auto_229030 ) ( not ( = ?auto_229022 ?auto_229034 ) ) ( OBJ-AT ?auto_229023 ?auto_229034 ) ( IN-CITY ?auto_229033 ?auto_229030 ) ( not ( = ?auto_229022 ?auto_229033 ) ) ( OBJ-AT ?auto_229026 ?auto_229033 ) ( IN-CITY ?auto_229029 ?auto_229030 ) ( not ( = ?auto_229022 ?auto_229029 ) ) ( OBJ-AT ?auto_229027 ?auto_229029 ) ( IN-CITY ?auto_229032 ?auto_229030 ) ( not ( = ?auto_229022 ?auto_229032 ) ) ( OBJ-AT ?auto_229025 ?auto_229032 ) ( IN-CITY ?auto_229028 ?auto_229030 ) ( not ( = ?auto_229022 ?auto_229028 ) ) ( OBJ-AT ?auto_229024 ?auto_229028 ) ( TRUCK-AT ?auto_229031 ?auto_229022 ) ( not ( = ?auto_229024 ?auto_229025 ) ) ( not ( = ?auto_229032 ?auto_229028 ) ) ( not ( = ?auto_229024 ?auto_229027 ) ) ( not ( = ?auto_229025 ?auto_229027 ) ) ( not ( = ?auto_229029 ?auto_229032 ) ) ( not ( = ?auto_229029 ?auto_229028 ) ) ( not ( = ?auto_229024 ?auto_229026 ) ) ( not ( = ?auto_229025 ?auto_229026 ) ) ( not ( = ?auto_229027 ?auto_229026 ) ) ( not ( = ?auto_229033 ?auto_229029 ) ) ( not ( = ?auto_229033 ?auto_229032 ) ) ( not ( = ?auto_229033 ?auto_229028 ) ) ( not ( = ?auto_229024 ?auto_229023 ) ) ( not ( = ?auto_229025 ?auto_229023 ) ) ( not ( = ?auto_229027 ?auto_229023 ) ) ( not ( = ?auto_229026 ?auto_229023 ) ) ( not ( = ?auto_229034 ?auto_229033 ) ) ( not ( = ?auto_229034 ?auto_229029 ) ) ( not ( = ?auto_229034 ?auto_229032 ) ) ( not ( = ?auto_229034 ?auto_229028 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_229024 ?auto_229025 ?auto_229027 ?auto_229023 ?auto_229026 ?auto_229022 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229252 - OBJ
      ?auto_229253 - OBJ
      ?auto_229254 - OBJ
      ?auto_229255 - OBJ
      ?auto_229256 - OBJ
      ?auto_229251 - LOCATION
    )
    :vars
    (
      ?auto_229263 - LOCATION
      ?auto_229259 - CITY
      ?auto_229262 - LOCATION
      ?auto_229258 - LOCATION
      ?auto_229261 - LOCATION
      ?auto_229257 - LOCATION
      ?auto_229260 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229263 ?auto_229259 ) ( IN-CITY ?auto_229251 ?auto_229259 ) ( not ( = ?auto_229251 ?auto_229263 ) ) ( OBJ-AT ?auto_229252 ?auto_229263 ) ( IN-CITY ?auto_229262 ?auto_229259 ) ( not ( = ?auto_229251 ?auto_229262 ) ) ( OBJ-AT ?auto_229256 ?auto_229262 ) ( IN-CITY ?auto_229258 ?auto_229259 ) ( not ( = ?auto_229251 ?auto_229258 ) ) ( OBJ-AT ?auto_229254 ?auto_229258 ) ( IN-CITY ?auto_229261 ?auto_229259 ) ( not ( = ?auto_229251 ?auto_229261 ) ) ( OBJ-AT ?auto_229255 ?auto_229261 ) ( IN-CITY ?auto_229257 ?auto_229259 ) ( not ( = ?auto_229251 ?auto_229257 ) ) ( OBJ-AT ?auto_229253 ?auto_229257 ) ( TRUCK-AT ?auto_229260 ?auto_229251 ) ( not ( = ?auto_229253 ?auto_229255 ) ) ( not ( = ?auto_229261 ?auto_229257 ) ) ( not ( = ?auto_229253 ?auto_229254 ) ) ( not ( = ?auto_229255 ?auto_229254 ) ) ( not ( = ?auto_229258 ?auto_229261 ) ) ( not ( = ?auto_229258 ?auto_229257 ) ) ( not ( = ?auto_229253 ?auto_229256 ) ) ( not ( = ?auto_229255 ?auto_229256 ) ) ( not ( = ?auto_229254 ?auto_229256 ) ) ( not ( = ?auto_229262 ?auto_229258 ) ) ( not ( = ?auto_229262 ?auto_229261 ) ) ( not ( = ?auto_229262 ?auto_229257 ) ) ( not ( = ?auto_229253 ?auto_229252 ) ) ( not ( = ?auto_229255 ?auto_229252 ) ) ( not ( = ?auto_229254 ?auto_229252 ) ) ( not ( = ?auto_229256 ?auto_229252 ) ) ( not ( = ?auto_229263 ?auto_229262 ) ) ( not ( = ?auto_229263 ?auto_229258 ) ) ( not ( = ?auto_229263 ?auto_229261 ) ) ( not ( = ?auto_229263 ?auto_229257 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_229253 ?auto_229255 ?auto_229254 ?auto_229252 ?auto_229256 ?auto_229251 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229366 - OBJ
      ?auto_229367 - OBJ
      ?auto_229368 - OBJ
      ?auto_229369 - OBJ
      ?auto_229370 - OBJ
      ?auto_229365 - LOCATION
    )
    :vars
    (
      ?auto_229377 - LOCATION
      ?auto_229373 - CITY
      ?auto_229376 - LOCATION
      ?auto_229372 - LOCATION
      ?auto_229375 - LOCATION
      ?auto_229371 - LOCATION
      ?auto_229374 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229377 ?auto_229373 ) ( IN-CITY ?auto_229365 ?auto_229373 ) ( not ( = ?auto_229365 ?auto_229377 ) ) ( OBJ-AT ?auto_229366 ?auto_229377 ) ( IN-CITY ?auto_229376 ?auto_229373 ) ( not ( = ?auto_229365 ?auto_229376 ) ) ( OBJ-AT ?auto_229369 ?auto_229376 ) ( IN-CITY ?auto_229372 ?auto_229373 ) ( not ( = ?auto_229365 ?auto_229372 ) ) ( OBJ-AT ?auto_229368 ?auto_229372 ) ( IN-CITY ?auto_229375 ?auto_229373 ) ( not ( = ?auto_229365 ?auto_229375 ) ) ( OBJ-AT ?auto_229370 ?auto_229375 ) ( IN-CITY ?auto_229371 ?auto_229373 ) ( not ( = ?auto_229365 ?auto_229371 ) ) ( OBJ-AT ?auto_229367 ?auto_229371 ) ( TRUCK-AT ?auto_229374 ?auto_229365 ) ( not ( = ?auto_229367 ?auto_229370 ) ) ( not ( = ?auto_229375 ?auto_229371 ) ) ( not ( = ?auto_229367 ?auto_229368 ) ) ( not ( = ?auto_229370 ?auto_229368 ) ) ( not ( = ?auto_229372 ?auto_229375 ) ) ( not ( = ?auto_229372 ?auto_229371 ) ) ( not ( = ?auto_229367 ?auto_229369 ) ) ( not ( = ?auto_229370 ?auto_229369 ) ) ( not ( = ?auto_229368 ?auto_229369 ) ) ( not ( = ?auto_229376 ?auto_229372 ) ) ( not ( = ?auto_229376 ?auto_229375 ) ) ( not ( = ?auto_229376 ?auto_229371 ) ) ( not ( = ?auto_229367 ?auto_229366 ) ) ( not ( = ?auto_229370 ?auto_229366 ) ) ( not ( = ?auto_229368 ?auto_229366 ) ) ( not ( = ?auto_229369 ?auto_229366 ) ) ( not ( = ?auto_229377 ?auto_229376 ) ) ( not ( = ?auto_229377 ?auto_229372 ) ) ( not ( = ?auto_229377 ?auto_229375 ) ) ( not ( = ?auto_229377 ?auto_229371 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_229367 ?auto_229370 ?auto_229368 ?auto_229366 ?auto_229369 ?auto_229365 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229595 - OBJ
      ?auto_229596 - OBJ
      ?auto_229597 - OBJ
      ?auto_229598 - OBJ
      ?auto_229599 - OBJ
      ?auto_229594 - LOCATION
    )
    :vars
    (
      ?auto_229606 - LOCATION
      ?auto_229602 - CITY
      ?auto_229605 - LOCATION
      ?auto_229601 - LOCATION
      ?auto_229604 - LOCATION
      ?auto_229600 - LOCATION
      ?auto_229603 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229606 ?auto_229602 ) ( IN-CITY ?auto_229594 ?auto_229602 ) ( not ( = ?auto_229594 ?auto_229606 ) ) ( OBJ-AT ?auto_229595 ?auto_229606 ) ( IN-CITY ?auto_229605 ?auto_229602 ) ( not ( = ?auto_229594 ?auto_229605 ) ) ( OBJ-AT ?auto_229597 ?auto_229605 ) ( IN-CITY ?auto_229601 ?auto_229602 ) ( not ( = ?auto_229594 ?auto_229601 ) ) ( OBJ-AT ?auto_229599 ?auto_229601 ) ( IN-CITY ?auto_229604 ?auto_229602 ) ( not ( = ?auto_229594 ?auto_229604 ) ) ( OBJ-AT ?auto_229598 ?auto_229604 ) ( IN-CITY ?auto_229600 ?auto_229602 ) ( not ( = ?auto_229594 ?auto_229600 ) ) ( OBJ-AT ?auto_229596 ?auto_229600 ) ( TRUCK-AT ?auto_229603 ?auto_229594 ) ( not ( = ?auto_229596 ?auto_229598 ) ) ( not ( = ?auto_229604 ?auto_229600 ) ) ( not ( = ?auto_229596 ?auto_229599 ) ) ( not ( = ?auto_229598 ?auto_229599 ) ) ( not ( = ?auto_229601 ?auto_229604 ) ) ( not ( = ?auto_229601 ?auto_229600 ) ) ( not ( = ?auto_229596 ?auto_229597 ) ) ( not ( = ?auto_229598 ?auto_229597 ) ) ( not ( = ?auto_229599 ?auto_229597 ) ) ( not ( = ?auto_229605 ?auto_229601 ) ) ( not ( = ?auto_229605 ?auto_229604 ) ) ( not ( = ?auto_229605 ?auto_229600 ) ) ( not ( = ?auto_229596 ?auto_229595 ) ) ( not ( = ?auto_229598 ?auto_229595 ) ) ( not ( = ?auto_229599 ?auto_229595 ) ) ( not ( = ?auto_229597 ?auto_229595 ) ) ( not ( = ?auto_229606 ?auto_229605 ) ) ( not ( = ?auto_229606 ?auto_229601 ) ) ( not ( = ?auto_229606 ?auto_229604 ) ) ( not ( = ?auto_229606 ?auto_229600 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_229596 ?auto_229598 ?auto_229599 ?auto_229595 ?auto_229597 ?auto_229594 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_229650 - OBJ
      ?auto_229651 - OBJ
      ?auto_229652 - OBJ
      ?auto_229653 - OBJ
      ?auto_229654 - OBJ
      ?auto_229649 - LOCATION
    )
    :vars
    (
      ?auto_229661 - LOCATION
      ?auto_229657 - CITY
      ?auto_229660 - LOCATION
      ?auto_229656 - LOCATION
      ?auto_229659 - LOCATION
      ?auto_229655 - LOCATION
      ?auto_229658 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229661 ?auto_229657 ) ( IN-CITY ?auto_229649 ?auto_229657 ) ( not ( = ?auto_229649 ?auto_229661 ) ) ( OBJ-AT ?auto_229650 ?auto_229661 ) ( IN-CITY ?auto_229660 ?auto_229657 ) ( not ( = ?auto_229649 ?auto_229660 ) ) ( OBJ-AT ?auto_229652 ?auto_229660 ) ( IN-CITY ?auto_229656 ?auto_229657 ) ( not ( = ?auto_229649 ?auto_229656 ) ) ( OBJ-AT ?auto_229653 ?auto_229656 ) ( IN-CITY ?auto_229659 ?auto_229657 ) ( not ( = ?auto_229649 ?auto_229659 ) ) ( OBJ-AT ?auto_229654 ?auto_229659 ) ( IN-CITY ?auto_229655 ?auto_229657 ) ( not ( = ?auto_229649 ?auto_229655 ) ) ( OBJ-AT ?auto_229651 ?auto_229655 ) ( TRUCK-AT ?auto_229658 ?auto_229649 ) ( not ( = ?auto_229651 ?auto_229654 ) ) ( not ( = ?auto_229659 ?auto_229655 ) ) ( not ( = ?auto_229651 ?auto_229653 ) ) ( not ( = ?auto_229654 ?auto_229653 ) ) ( not ( = ?auto_229656 ?auto_229659 ) ) ( not ( = ?auto_229656 ?auto_229655 ) ) ( not ( = ?auto_229651 ?auto_229652 ) ) ( not ( = ?auto_229654 ?auto_229652 ) ) ( not ( = ?auto_229653 ?auto_229652 ) ) ( not ( = ?auto_229660 ?auto_229656 ) ) ( not ( = ?auto_229660 ?auto_229659 ) ) ( not ( = ?auto_229660 ?auto_229655 ) ) ( not ( = ?auto_229651 ?auto_229650 ) ) ( not ( = ?auto_229654 ?auto_229650 ) ) ( not ( = ?auto_229653 ?auto_229650 ) ) ( not ( = ?auto_229652 ?auto_229650 ) ) ( not ( = ?auto_229661 ?auto_229660 ) ) ( not ( = ?auto_229661 ?auto_229656 ) ) ( not ( = ?auto_229661 ?auto_229659 ) ) ( not ( = ?auto_229661 ?auto_229655 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_229651 ?auto_229654 ?auto_229653 ?auto_229650 ?auto_229652 ?auto_229649 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230412 - OBJ
      ?auto_230413 - OBJ
      ?auto_230414 - OBJ
      ?auto_230415 - OBJ
      ?auto_230416 - OBJ
      ?auto_230411 - LOCATION
    )
    :vars
    (
      ?auto_230423 - LOCATION
      ?auto_230419 - CITY
      ?auto_230422 - LOCATION
      ?auto_230418 - LOCATION
      ?auto_230421 - LOCATION
      ?auto_230417 - LOCATION
      ?auto_230420 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230423 ?auto_230419 ) ( IN-CITY ?auto_230411 ?auto_230419 ) ( not ( = ?auto_230411 ?auto_230423 ) ) ( OBJ-AT ?auto_230412 ?auto_230423 ) ( IN-CITY ?auto_230422 ?auto_230419 ) ( not ( = ?auto_230411 ?auto_230422 ) ) ( OBJ-AT ?auto_230416 ?auto_230422 ) ( IN-CITY ?auto_230418 ?auto_230419 ) ( not ( = ?auto_230411 ?auto_230418 ) ) ( OBJ-AT ?auto_230415 ?auto_230418 ) ( IN-CITY ?auto_230421 ?auto_230419 ) ( not ( = ?auto_230411 ?auto_230421 ) ) ( OBJ-AT ?auto_230413 ?auto_230421 ) ( IN-CITY ?auto_230417 ?auto_230419 ) ( not ( = ?auto_230411 ?auto_230417 ) ) ( OBJ-AT ?auto_230414 ?auto_230417 ) ( TRUCK-AT ?auto_230420 ?auto_230411 ) ( not ( = ?auto_230414 ?auto_230413 ) ) ( not ( = ?auto_230421 ?auto_230417 ) ) ( not ( = ?auto_230414 ?auto_230415 ) ) ( not ( = ?auto_230413 ?auto_230415 ) ) ( not ( = ?auto_230418 ?auto_230421 ) ) ( not ( = ?auto_230418 ?auto_230417 ) ) ( not ( = ?auto_230414 ?auto_230416 ) ) ( not ( = ?auto_230413 ?auto_230416 ) ) ( not ( = ?auto_230415 ?auto_230416 ) ) ( not ( = ?auto_230422 ?auto_230418 ) ) ( not ( = ?auto_230422 ?auto_230421 ) ) ( not ( = ?auto_230422 ?auto_230417 ) ) ( not ( = ?auto_230414 ?auto_230412 ) ) ( not ( = ?auto_230413 ?auto_230412 ) ) ( not ( = ?auto_230415 ?auto_230412 ) ) ( not ( = ?auto_230416 ?auto_230412 ) ) ( not ( = ?auto_230423 ?auto_230422 ) ) ( not ( = ?auto_230423 ?auto_230418 ) ) ( not ( = ?auto_230423 ?auto_230421 ) ) ( not ( = ?auto_230423 ?auto_230417 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_230414 ?auto_230413 ?auto_230415 ?auto_230412 ?auto_230416 ?auto_230411 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230467 - OBJ
      ?auto_230468 - OBJ
      ?auto_230469 - OBJ
      ?auto_230470 - OBJ
      ?auto_230471 - OBJ
      ?auto_230466 - LOCATION
    )
    :vars
    (
      ?auto_230478 - LOCATION
      ?auto_230474 - CITY
      ?auto_230477 - LOCATION
      ?auto_230473 - LOCATION
      ?auto_230476 - LOCATION
      ?auto_230472 - LOCATION
      ?auto_230475 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_230478 ?auto_230474 ) ( IN-CITY ?auto_230466 ?auto_230474 ) ( not ( = ?auto_230466 ?auto_230478 ) ) ( OBJ-AT ?auto_230467 ?auto_230478 ) ( IN-CITY ?auto_230477 ?auto_230474 ) ( not ( = ?auto_230466 ?auto_230477 ) ) ( OBJ-AT ?auto_230470 ?auto_230477 ) ( IN-CITY ?auto_230473 ?auto_230474 ) ( not ( = ?auto_230466 ?auto_230473 ) ) ( OBJ-AT ?auto_230471 ?auto_230473 ) ( IN-CITY ?auto_230476 ?auto_230474 ) ( not ( = ?auto_230466 ?auto_230476 ) ) ( OBJ-AT ?auto_230468 ?auto_230476 ) ( IN-CITY ?auto_230472 ?auto_230474 ) ( not ( = ?auto_230466 ?auto_230472 ) ) ( OBJ-AT ?auto_230469 ?auto_230472 ) ( TRUCK-AT ?auto_230475 ?auto_230466 ) ( not ( = ?auto_230469 ?auto_230468 ) ) ( not ( = ?auto_230476 ?auto_230472 ) ) ( not ( = ?auto_230469 ?auto_230471 ) ) ( not ( = ?auto_230468 ?auto_230471 ) ) ( not ( = ?auto_230473 ?auto_230476 ) ) ( not ( = ?auto_230473 ?auto_230472 ) ) ( not ( = ?auto_230469 ?auto_230470 ) ) ( not ( = ?auto_230468 ?auto_230470 ) ) ( not ( = ?auto_230471 ?auto_230470 ) ) ( not ( = ?auto_230477 ?auto_230473 ) ) ( not ( = ?auto_230477 ?auto_230476 ) ) ( not ( = ?auto_230477 ?auto_230472 ) ) ( not ( = ?auto_230469 ?auto_230467 ) ) ( not ( = ?auto_230468 ?auto_230467 ) ) ( not ( = ?auto_230471 ?auto_230467 ) ) ( not ( = ?auto_230470 ?auto_230467 ) ) ( not ( = ?auto_230478 ?auto_230477 ) ) ( not ( = ?auto_230478 ?auto_230473 ) ) ( not ( = ?auto_230478 ?auto_230476 ) ) ( not ( = ?auto_230478 ?auto_230472 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_230469 ?auto_230468 ?auto_230471 ?auto_230467 ?auto_230470 ?auto_230466 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_230996 - OBJ
      ?auto_230997 - OBJ
      ?auto_230998 - OBJ
      ?auto_230999 - OBJ
      ?auto_231000 - OBJ
      ?auto_230995 - LOCATION
    )
    :vars
    (
      ?auto_231007 - LOCATION
      ?auto_231003 - CITY
      ?auto_231006 - LOCATION
      ?auto_231002 - LOCATION
      ?auto_231005 - LOCATION
      ?auto_231001 - LOCATION
      ?auto_231004 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_231007 ?auto_231003 ) ( IN-CITY ?auto_230995 ?auto_231003 ) ( not ( = ?auto_230995 ?auto_231007 ) ) ( OBJ-AT ?auto_230996 ?auto_231007 ) ( IN-CITY ?auto_231006 ?auto_231003 ) ( not ( = ?auto_230995 ?auto_231006 ) ) ( OBJ-AT ?auto_231000 ?auto_231006 ) ( IN-CITY ?auto_231002 ?auto_231003 ) ( not ( = ?auto_230995 ?auto_231002 ) ) ( OBJ-AT ?auto_230998 ?auto_231002 ) ( IN-CITY ?auto_231005 ?auto_231003 ) ( not ( = ?auto_230995 ?auto_231005 ) ) ( OBJ-AT ?auto_230997 ?auto_231005 ) ( IN-CITY ?auto_231001 ?auto_231003 ) ( not ( = ?auto_230995 ?auto_231001 ) ) ( OBJ-AT ?auto_230999 ?auto_231001 ) ( TRUCK-AT ?auto_231004 ?auto_230995 ) ( not ( = ?auto_230999 ?auto_230997 ) ) ( not ( = ?auto_231005 ?auto_231001 ) ) ( not ( = ?auto_230999 ?auto_230998 ) ) ( not ( = ?auto_230997 ?auto_230998 ) ) ( not ( = ?auto_231002 ?auto_231005 ) ) ( not ( = ?auto_231002 ?auto_231001 ) ) ( not ( = ?auto_230999 ?auto_231000 ) ) ( not ( = ?auto_230997 ?auto_231000 ) ) ( not ( = ?auto_230998 ?auto_231000 ) ) ( not ( = ?auto_231006 ?auto_231002 ) ) ( not ( = ?auto_231006 ?auto_231005 ) ) ( not ( = ?auto_231006 ?auto_231001 ) ) ( not ( = ?auto_230999 ?auto_230996 ) ) ( not ( = ?auto_230997 ?auto_230996 ) ) ( not ( = ?auto_230998 ?auto_230996 ) ) ( not ( = ?auto_231000 ?auto_230996 ) ) ( not ( = ?auto_231007 ?auto_231006 ) ) ( not ( = ?auto_231007 ?auto_231002 ) ) ( not ( = ?auto_231007 ?auto_231005 ) ) ( not ( = ?auto_231007 ?auto_231001 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_230999 ?auto_230997 ?auto_230998 ?auto_230996 ?auto_231000 ?auto_230995 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_231169 - OBJ
      ?auto_231170 - OBJ
      ?auto_231171 - OBJ
      ?auto_231172 - OBJ
      ?auto_231173 - OBJ
      ?auto_231168 - LOCATION
    )
    :vars
    (
      ?auto_231180 - LOCATION
      ?auto_231176 - CITY
      ?auto_231179 - LOCATION
      ?auto_231175 - LOCATION
      ?auto_231178 - LOCATION
      ?auto_231174 - LOCATION
      ?auto_231177 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_231180 ?auto_231176 ) ( IN-CITY ?auto_231168 ?auto_231176 ) ( not ( = ?auto_231168 ?auto_231180 ) ) ( OBJ-AT ?auto_231169 ?auto_231180 ) ( IN-CITY ?auto_231179 ?auto_231176 ) ( not ( = ?auto_231168 ?auto_231179 ) ) ( OBJ-AT ?auto_231172 ?auto_231179 ) ( IN-CITY ?auto_231175 ?auto_231176 ) ( not ( = ?auto_231168 ?auto_231175 ) ) ( OBJ-AT ?auto_231171 ?auto_231175 ) ( IN-CITY ?auto_231178 ?auto_231176 ) ( not ( = ?auto_231168 ?auto_231178 ) ) ( OBJ-AT ?auto_231170 ?auto_231178 ) ( IN-CITY ?auto_231174 ?auto_231176 ) ( not ( = ?auto_231168 ?auto_231174 ) ) ( OBJ-AT ?auto_231173 ?auto_231174 ) ( TRUCK-AT ?auto_231177 ?auto_231168 ) ( not ( = ?auto_231173 ?auto_231170 ) ) ( not ( = ?auto_231178 ?auto_231174 ) ) ( not ( = ?auto_231173 ?auto_231171 ) ) ( not ( = ?auto_231170 ?auto_231171 ) ) ( not ( = ?auto_231175 ?auto_231178 ) ) ( not ( = ?auto_231175 ?auto_231174 ) ) ( not ( = ?auto_231173 ?auto_231172 ) ) ( not ( = ?auto_231170 ?auto_231172 ) ) ( not ( = ?auto_231171 ?auto_231172 ) ) ( not ( = ?auto_231179 ?auto_231175 ) ) ( not ( = ?auto_231179 ?auto_231178 ) ) ( not ( = ?auto_231179 ?auto_231174 ) ) ( not ( = ?auto_231173 ?auto_231169 ) ) ( not ( = ?auto_231170 ?auto_231169 ) ) ( not ( = ?auto_231171 ?auto_231169 ) ) ( not ( = ?auto_231172 ?auto_231169 ) ) ( not ( = ?auto_231180 ?auto_231179 ) ) ( not ( = ?auto_231180 ?auto_231175 ) ) ( not ( = ?auto_231180 ?auto_231178 ) ) ( not ( = ?auto_231180 ?auto_231174 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_231173 ?auto_231170 ?auto_231171 ?auto_231169 ?auto_231172 ?auto_231168 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_231339 - OBJ
      ?auto_231340 - OBJ
      ?auto_231341 - OBJ
      ?auto_231342 - OBJ
      ?auto_231343 - OBJ
      ?auto_231338 - LOCATION
    )
    :vars
    (
      ?auto_231350 - LOCATION
      ?auto_231346 - CITY
      ?auto_231349 - LOCATION
      ?auto_231345 - LOCATION
      ?auto_231348 - LOCATION
      ?auto_231344 - LOCATION
      ?auto_231347 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_231350 ?auto_231346 ) ( IN-CITY ?auto_231338 ?auto_231346 ) ( not ( = ?auto_231338 ?auto_231350 ) ) ( OBJ-AT ?auto_231339 ?auto_231350 ) ( IN-CITY ?auto_231349 ?auto_231346 ) ( not ( = ?auto_231338 ?auto_231349 ) ) ( OBJ-AT ?auto_231341 ?auto_231349 ) ( IN-CITY ?auto_231345 ?auto_231346 ) ( not ( = ?auto_231338 ?auto_231345 ) ) ( OBJ-AT ?auto_231343 ?auto_231345 ) ( IN-CITY ?auto_231348 ?auto_231346 ) ( not ( = ?auto_231338 ?auto_231348 ) ) ( OBJ-AT ?auto_231340 ?auto_231348 ) ( IN-CITY ?auto_231344 ?auto_231346 ) ( not ( = ?auto_231338 ?auto_231344 ) ) ( OBJ-AT ?auto_231342 ?auto_231344 ) ( TRUCK-AT ?auto_231347 ?auto_231338 ) ( not ( = ?auto_231342 ?auto_231340 ) ) ( not ( = ?auto_231348 ?auto_231344 ) ) ( not ( = ?auto_231342 ?auto_231343 ) ) ( not ( = ?auto_231340 ?auto_231343 ) ) ( not ( = ?auto_231345 ?auto_231348 ) ) ( not ( = ?auto_231345 ?auto_231344 ) ) ( not ( = ?auto_231342 ?auto_231341 ) ) ( not ( = ?auto_231340 ?auto_231341 ) ) ( not ( = ?auto_231343 ?auto_231341 ) ) ( not ( = ?auto_231349 ?auto_231345 ) ) ( not ( = ?auto_231349 ?auto_231348 ) ) ( not ( = ?auto_231349 ?auto_231344 ) ) ( not ( = ?auto_231342 ?auto_231339 ) ) ( not ( = ?auto_231340 ?auto_231339 ) ) ( not ( = ?auto_231343 ?auto_231339 ) ) ( not ( = ?auto_231341 ?auto_231339 ) ) ( not ( = ?auto_231350 ?auto_231349 ) ) ( not ( = ?auto_231350 ?auto_231345 ) ) ( not ( = ?auto_231350 ?auto_231348 ) ) ( not ( = ?auto_231350 ?auto_231344 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_231342 ?auto_231340 ?auto_231343 ?auto_231339 ?auto_231341 ?auto_231338 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_231453 - OBJ
      ?auto_231454 - OBJ
      ?auto_231455 - OBJ
      ?auto_231456 - OBJ
      ?auto_231457 - OBJ
      ?auto_231452 - LOCATION
    )
    :vars
    (
      ?auto_231464 - LOCATION
      ?auto_231460 - CITY
      ?auto_231463 - LOCATION
      ?auto_231459 - LOCATION
      ?auto_231462 - LOCATION
      ?auto_231458 - LOCATION
      ?auto_231461 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_231464 ?auto_231460 ) ( IN-CITY ?auto_231452 ?auto_231460 ) ( not ( = ?auto_231452 ?auto_231464 ) ) ( OBJ-AT ?auto_231453 ?auto_231464 ) ( IN-CITY ?auto_231463 ?auto_231460 ) ( not ( = ?auto_231452 ?auto_231463 ) ) ( OBJ-AT ?auto_231455 ?auto_231463 ) ( IN-CITY ?auto_231459 ?auto_231460 ) ( not ( = ?auto_231452 ?auto_231459 ) ) ( OBJ-AT ?auto_231456 ?auto_231459 ) ( IN-CITY ?auto_231462 ?auto_231460 ) ( not ( = ?auto_231452 ?auto_231462 ) ) ( OBJ-AT ?auto_231454 ?auto_231462 ) ( IN-CITY ?auto_231458 ?auto_231460 ) ( not ( = ?auto_231452 ?auto_231458 ) ) ( OBJ-AT ?auto_231457 ?auto_231458 ) ( TRUCK-AT ?auto_231461 ?auto_231452 ) ( not ( = ?auto_231457 ?auto_231454 ) ) ( not ( = ?auto_231462 ?auto_231458 ) ) ( not ( = ?auto_231457 ?auto_231456 ) ) ( not ( = ?auto_231454 ?auto_231456 ) ) ( not ( = ?auto_231459 ?auto_231462 ) ) ( not ( = ?auto_231459 ?auto_231458 ) ) ( not ( = ?auto_231457 ?auto_231455 ) ) ( not ( = ?auto_231454 ?auto_231455 ) ) ( not ( = ?auto_231456 ?auto_231455 ) ) ( not ( = ?auto_231463 ?auto_231459 ) ) ( not ( = ?auto_231463 ?auto_231462 ) ) ( not ( = ?auto_231463 ?auto_231458 ) ) ( not ( = ?auto_231457 ?auto_231453 ) ) ( not ( = ?auto_231454 ?auto_231453 ) ) ( not ( = ?auto_231456 ?auto_231453 ) ) ( not ( = ?auto_231455 ?auto_231453 ) ) ( not ( = ?auto_231464 ?auto_231463 ) ) ( not ( = ?auto_231464 ?auto_231459 ) ) ( not ( = ?auto_231464 ?auto_231462 ) ) ( not ( = ?auto_231464 ?auto_231458 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_231457 ?auto_231454 ?auto_231456 ?auto_231453 ?auto_231455 ?auto_231452 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_232156 - OBJ
      ?auto_232157 - OBJ
      ?auto_232158 - OBJ
      ?auto_232159 - OBJ
      ?auto_232160 - OBJ
      ?auto_232155 - LOCATION
    )
    :vars
    (
      ?auto_232167 - LOCATION
      ?auto_232163 - CITY
      ?auto_232166 - LOCATION
      ?auto_232162 - LOCATION
      ?auto_232165 - LOCATION
      ?auto_232161 - LOCATION
      ?auto_232164 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_232167 ?auto_232163 ) ( IN-CITY ?auto_232155 ?auto_232163 ) ( not ( = ?auto_232155 ?auto_232167 ) ) ( OBJ-AT ?auto_232156 ?auto_232167 ) ( IN-CITY ?auto_232166 ?auto_232163 ) ( not ( = ?auto_232155 ?auto_232166 ) ) ( OBJ-AT ?auto_232160 ?auto_232166 ) ( IN-CITY ?auto_232162 ?auto_232163 ) ( not ( = ?auto_232155 ?auto_232162 ) ) ( OBJ-AT ?auto_232157 ?auto_232162 ) ( IN-CITY ?auto_232165 ?auto_232163 ) ( not ( = ?auto_232155 ?auto_232165 ) ) ( OBJ-AT ?auto_232159 ?auto_232165 ) ( IN-CITY ?auto_232161 ?auto_232163 ) ( not ( = ?auto_232155 ?auto_232161 ) ) ( OBJ-AT ?auto_232158 ?auto_232161 ) ( TRUCK-AT ?auto_232164 ?auto_232155 ) ( not ( = ?auto_232158 ?auto_232159 ) ) ( not ( = ?auto_232165 ?auto_232161 ) ) ( not ( = ?auto_232158 ?auto_232157 ) ) ( not ( = ?auto_232159 ?auto_232157 ) ) ( not ( = ?auto_232162 ?auto_232165 ) ) ( not ( = ?auto_232162 ?auto_232161 ) ) ( not ( = ?auto_232158 ?auto_232160 ) ) ( not ( = ?auto_232159 ?auto_232160 ) ) ( not ( = ?auto_232157 ?auto_232160 ) ) ( not ( = ?auto_232166 ?auto_232162 ) ) ( not ( = ?auto_232166 ?auto_232165 ) ) ( not ( = ?auto_232166 ?auto_232161 ) ) ( not ( = ?auto_232158 ?auto_232156 ) ) ( not ( = ?auto_232159 ?auto_232156 ) ) ( not ( = ?auto_232157 ?auto_232156 ) ) ( not ( = ?auto_232160 ?auto_232156 ) ) ( not ( = ?auto_232167 ?auto_232166 ) ) ( not ( = ?auto_232167 ?auto_232162 ) ) ( not ( = ?auto_232167 ?auto_232165 ) ) ( not ( = ?auto_232167 ?auto_232161 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_232158 ?auto_232159 ?auto_232157 ?auto_232156 ?auto_232160 ?auto_232155 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_232270 - OBJ
      ?auto_232271 - OBJ
      ?auto_232272 - OBJ
      ?auto_232273 - OBJ
      ?auto_232274 - OBJ
      ?auto_232269 - LOCATION
    )
    :vars
    (
      ?auto_232281 - LOCATION
      ?auto_232277 - CITY
      ?auto_232280 - LOCATION
      ?auto_232276 - LOCATION
      ?auto_232279 - LOCATION
      ?auto_232275 - LOCATION
      ?auto_232278 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_232281 ?auto_232277 ) ( IN-CITY ?auto_232269 ?auto_232277 ) ( not ( = ?auto_232269 ?auto_232281 ) ) ( OBJ-AT ?auto_232270 ?auto_232281 ) ( IN-CITY ?auto_232280 ?auto_232277 ) ( not ( = ?auto_232269 ?auto_232280 ) ) ( OBJ-AT ?auto_232273 ?auto_232280 ) ( IN-CITY ?auto_232276 ?auto_232277 ) ( not ( = ?auto_232269 ?auto_232276 ) ) ( OBJ-AT ?auto_232271 ?auto_232276 ) ( IN-CITY ?auto_232279 ?auto_232277 ) ( not ( = ?auto_232269 ?auto_232279 ) ) ( OBJ-AT ?auto_232274 ?auto_232279 ) ( IN-CITY ?auto_232275 ?auto_232277 ) ( not ( = ?auto_232269 ?auto_232275 ) ) ( OBJ-AT ?auto_232272 ?auto_232275 ) ( TRUCK-AT ?auto_232278 ?auto_232269 ) ( not ( = ?auto_232272 ?auto_232274 ) ) ( not ( = ?auto_232279 ?auto_232275 ) ) ( not ( = ?auto_232272 ?auto_232271 ) ) ( not ( = ?auto_232274 ?auto_232271 ) ) ( not ( = ?auto_232276 ?auto_232279 ) ) ( not ( = ?auto_232276 ?auto_232275 ) ) ( not ( = ?auto_232272 ?auto_232273 ) ) ( not ( = ?auto_232274 ?auto_232273 ) ) ( not ( = ?auto_232271 ?auto_232273 ) ) ( not ( = ?auto_232280 ?auto_232276 ) ) ( not ( = ?auto_232280 ?auto_232279 ) ) ( not ( = ?auto_232280 ?auto_232275 ) ) ( not ( = ?auto_232272 ?auto_232270 ) ) ( not ( = ?auto_232274 ?auto_232270 ) ) ( not ( = ?auto_232271 ?auto_232270 ) ) ( not ( = ?auto_232273 ?auto_232270 ) ) ( not ( = ?auto_232281 ?auto_232280 ) ) ( not ( = ?auto_232281 ?auto_232276 ) ) ( not ( = ?auto_232281 ?auto_232279 ) ) ( not ( = ?auto_232281 ?auto_232275 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_232272 ?auto_232274 ?auto_232271 ?auto_232270 ?auto_232273 ?auto_232269 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_232440 - OBJ
      ?auto_232441 - OBJ
      ?auto_232442 - OBJ
      ?auto_232443 - OBJ
      ?auto_232444 - OBJ
      ?auto_232439 - LOCATION
    )
    :vars
    (
      ?auto_232451 - LOCATION
      ?auto_232447 - CITY
      ?auto_232450 - LOCATION
      ?auto_232446 - LOCATION
      ?auto_232449 - LOCATION
      ?auto_232445 - LOCATION
      ?auto_232448 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_232451 ?auto_232447 ) ( IN-CITY ?auto_232439 ?auto_232447 ) ( not ( = ?auto_232439 ?auto_232451 ) ) ( OBJ-AT ?auto_232440 ?auto_232451 ) ( IN-CITY ?auto_232450 ?auto_232447 ) ( not ( = ?auto_232439 ?auto_232450 ) ) ( OBJ-AT ?auto_232444 ?auto_232450 ) ( IN-CITY ?auto_232446 ?auto_232447 ) ( not ( = ?auto_232439 ?auto_232446 ) ) ( OBJ-AT ?auto_232441 ?auto_232446 ) ( IN-CITY ?auto_232449 ?auto_232447 ) ( not ( = ?auto_232439 ?auto_232449 ) ) ( OBJ-AT ?auto_232442 ?auto_232449 ) ( IN-CITY ?auto_232445 ?auto_232447 ) ( not ( = ?auto_232439 ?auto_232445 ) ) ( OBJ-AT ?auto_232443 ?auto_232445 ) ( TRUCK-AT ?auto_232448 ?auto_232439 ) ( not ( = ?auto_232443 ?auto_232442 ) ) ( not ( = ?auto_232449 ?auto_232445 ) ) ( not ( = ?auto_232443 ?auto_232441 ) ) ( not ( = ?auto_232442 ?auto_232441 ) ) ( not ( = ?auto_232446 ?auto_232449 ) ) ( not ( = ?auto_232446 ?auto_232445 ) ) ( not ( = ?auto_232443 ?auto_232444 ) ) ( not ( = ?auto_232442 ?auto_232444 ) ) ( not ( = ?auto_232441 ?auto_232444 ) ) ( not ( = ?auto_232450 ?auto_232446 ) ) ( not ( = ?auto_232450 ?auto_232449 ) ) ( not ( = ?auto_232450 ?auto_232445 ) ) ( not ( = ?auto_232443 ?auto_232440 ) ) ( not ( = ?auto_232442 ?auto_232440 ) ) ( not ( = ?auto_232441 ?auto_232440 ) ) ( not ( = ?auto_232444 ?auto_232440 ) ) ( not ( = ?auto_232451 ?auto_232450 ) ) ( not ( = ?auto_232451 ?auto_232446 ) ) ( not ( = ?auto_232451 ?auto_232449 ) ) ( not ( = ?auto_232451 ?auto_232445 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_232443 ?auto_232442 ?auto_232441 ?auto_232440 ?auto_232444 ?auto_232439 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_232613 - OBJ
      ?auto_232614 - OBJ
      ?auto_232615 - OBJ
      ?auto_232616 - OBJ
      ?auto_232617 - OBJ
      ?auto_232612 - LOCATION
    )
    :vars
    (
      ?auto_232624 - LOCATION
      ?auto_232620 - CITY
      ?auto_232623 - LOCATION
      ?auto_232619 - LOCATION
      ?auto_232622 - LOCATION
      ?auto_232618 - LOCATION
      ?auto_232621 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_232624 ?auto_232620 ) ( IN-CITY ?auto_232612 ?auto_232620 ) ( not ( = ?auto_232612 ?auto_232624 ) ) ( OBJ-AT ?auto_232613 ?auto_232624 ) ( IN-CITY ?auto_232623 ?auto_232620 ) ( not ( = ?auto_232612 ?auto_232623 ) ) ( OBJ-AT ?auto_232616 ?auto_232623 ) ( IN-CITY ?auto_232619 ?auto_232620 ) ( not ( = ?auto_232612 ?auto_232619 ) ) ( OBJ-AT ?auto_232614 ?auto_232619 ) ( IN-CITY ?auto_232622 ?auto_232620 ) ( not ( = ?auto_232612 ?auto_232622 ) ) ( OBJ-AT ?auto_232615 ?auto_232622 ) ( IN-CITY ?auto_232618 ?auto_232620 ) ( not ( = ?auto_232612 ?auto_232618 ) ) ( OBJ-AT ?auto_232617 ?auto_232618 ) ( TRUCK-AT ?auto_232621 ?auto_232612 ) ( not ( = ?auto_232617 ?auto_232615 ) ) ( not ( = ?auto_232622 ?auto_232618 ) ) ( not ( = ?auto_232617 ?auto_232614 ) ) ( not ( = ?auto_232615 ?auto_232614 ) ) ( not ( = ?auto_232619 ?auto_232622 ) ) ( not ( = ?auto_232619 ?auto_232618 ) ) ( not ( = ?auto_232617 ?auto_232616 ) ) ( not ( = ?auto_232615 ?auto_232616 ) ) ( not ( = ?auto_232614 ?auto_232616 ) ) ( not ( = ?auto_232623 ?auto_232619 ) ) ( not ( = ?auto_232623 ?auto_232622 ) ) ( not ( = ?auto_232623 ?auto_232618 ) ) ( not ( = ?auto_232617 ?auto_232613 ) ) ( not ( = ?auto_232615 ?auto_232613 ) ) ( not ( = ?auto_232614 ?auto_232613 ) ) ( not ( = ?auto_232616 ?auto_232613 ) ) ( not ( = ?auto_232624 ?auto_232623 ) ) ( not ( = ?auto_232624 ?auto_232619 ) ) ( not ( = ?auto_232624 ?auto_232622 ) ) ( not ( = ?auto_232624 ?auto_232618 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_232617 ?auto_232615 ?auto_232614 ?auto_232613 ?auto_232616 ?auto_232612 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_233142 - OBJ
      ?auto_233143 - OBJ
      ?auto_233144 - OBJ
      ?auto_233145 - OBJ
      ?auto_233146 - OBJ
      ?auto_233141 - LOCATION
    )
    :vars
    (
      ?auto_233153 - LOCATION
      ?auto_233149 - CITY
      ?auto_233152 - LOCATION
      ?auto_233148 - LOCATION
      ?auto_233151 - LOCATION
      ?auto_233147 - LOCATION
      ?auto_233150 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_233153 ?auto_233149 ) ( IN-CITY ?auto_233141 ?auto_233149 ) ( not ( = ?auto_233141 ?auto_233153 ) ) ( OBJ-AT ?auto_233142 ?auto_233153 ) ( IN-CITY ?auto_233152 ?auto_233149 ) ( not ( = ?auto_233141 ?auto_233152 ) ) ( OBJ-AT ?auto_233144 ?auto_233152 ) ( IN-CITY ?auto_233148 ?auto_233149 ) ( not ( = ?auto_233141 ?auto_233148 ) ) ( OBJ-AT ?auto_233143 ?auto_233148 ) ( IN-CITY ?auto_233151 ?auto_233149 ) ( not ( = ?auto_233141 ?auto_233151 ) ) ( OBJ-AT ?auto_233146 ?auto_233151 ) ( IN-CITY ?auto_233147 ?auto_233149 ) ( not ( = ?auto_233141 ?auto_233147 ) ) ( OBJ-AT ?auto_233145 ?auto_233147 ) ( TRUCK-AT ?auto_233150 ?auto_233141 ) ( not ( = ?auto_233145 ?auto_233146 ) ) ( not ( = ?auto_233151 ?auto_233147 ) ) ( not ( = ?auto_233145 ?auto_233143 ) ) ( not ( = ?auto_233146 ?auto_233143 ) ) ( not ( = ?auto_233148 ?auto_233151 ) ) ( not ( = ?auto_233148 ?auto_233147 ) ) ( not ( = ?auto_233145 ?auto_233144 ) ) ( not ( = ?auto_233146 ?auto_233144 ) ) ( not ( = ?auto_233143 ?auto_233144 ) ) ( not ( = ?auto_233152 ?auto_233148 ) ) ( not ( = ?auto_233152 ?auto_233151 ) ) ( not ( = ?auto_233152 ?auto_233147 ) ) ( not ( = ?auto_233145 ?auto_233142 ) ) ( not ( = ?auto_233146 ?auto_233142 ) ) ( not ( = ?auto_233143 ?auto_233142 ) ) ( not ( = ?auto_233144 ?auto_233142 ) ) ( not ( = ?auto_233153 ?auto_233152 ) ) ( not ( = ?auto_233153 ?auto_233148 ) ) ( not ( = ?auto_233153 ?auto_233151 ) ) ( not ( = ?auto_233153 ?auto_233147 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_233145 ?auto_233146 ?auto_233143 ?auto_233142 ?auto_233144 ?auto_233141 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_233197 - OBJ
      ?auto_233198 - OBJ
      ?auto_233199 - OBJ
      ?auto_233200 - OBJ
      ?auto_233201 - OBJ
      ?auto_233196 - LOCATION
    )
    :vars
    (
      ?auto_233208 - LOCATION
      ?auto_233204 - CITY
      ?auto_233207 - LOCATION
      ?auto_233203 - LOCATION
      ?auto_233206 - LOCATION
      ?auto_233202 - LOCATION
      ?auto_233205 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_233208 ?auto_233204 ) ( IN-CITY ?auto_233196 ?auto_233204 ) ( not ( = ?auto_233196 ?auto_233208 ) ) ( OBJ-AT ?auto_233197 ?auto_233208 ) ( IN-CITY ?auto_233207 ?auto_233204 ) ( not ( = ?auto_233196 ?auto_233207 ) ) ( OBJ-AT ?auto_233199 ?auto_233207 ) ( IN-CITY ?auto_233203 ?auto_233204 ) ( not ( = ?auto_233196 ?auto_233203 ) ) ( OBJ-AT ?auto_233198 ?auto_233203 ) ( IN-CITY ?auto_233206 ?auto_233204 ) ( not ( = ?auto_233196 ?auto_233206 ) ) ( OBJ-AT ?auto_233200 ?auto_233206 ) ( IN-CITY ?auto_233202 ?auto_233204 ) ( not ( = ?auto_233196 ?auto_233202 ) ) ( OBJ-AT ?auto_233201 ?auto_233202 ) ( TRUCK-AT ?auto_233205 ?auto_233196 ) ( not ( = ?auto_233201 ?auto_233200 ) ) ( not ( = ?auto_233206 ?auto_233202 ) ) ( not ( = ?auto_233201 ?auto_233198 ) ) ( not ( = ?auto_233200 ?auto_233198 ) ) ( not ( = ?auto_233203 ?auto_233206 ) ) ( not ( = ?auto_233203 ?auto_233202 ) ) ( not ( = ?auto_233201 ?auto_233199 ) ) ( not ( = ?auto_233200 ?auto_233199 ) ) ( not ( = ?auto_233198 ?auto_233199 ) ) ( not ( = ?auto_233207 ?auto_233203 ) ) ( not ( = ?auto_233207 ?auto_233206 ) ) ( not ( = ?auto_233207 ?auto_233202 ) ) ( not ( = ?auto_233201 ?auto_233197 ) ) ( not ( = ?auto_233200 ?auto_233197 ) ) ( not ( = ?auto_233198 ?auto_233197 ) ) ( not ( = ?auto_233199 ?auto_233197 ) ) ( not ( = ?auto_233208 ?auto_233207 ) ) ( not ( = ?auto_233208 ?auto_233203 ) ) ( not ( = ?auto_233208 ?auto_233206 ) ) ( not ( = ?auto_233208 ?auto_233202 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_233201 ?auto_233200 ?auto_233198 ?auto_233197 ?auto_233199 ?auto_233196 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_233959 - OBJ
      ?auto_233960 - OBJ
      ?auto_233961 - OBJ
      ?auto_233962 - OBJ
      ?auto_233963 - OBJ
      ?auto_233958 - LOCATION
    )
    :vars
    (
      ?auto_233970 - LOCATION
      ?auto_233966 - CITY
      ?auto_233969 - LOCATION
      ?auto_233965 - LOCATION
      ?auto_233968 - LOCATION
      ?auto_233964 - LOCATION
      ?auto_233967 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_233970 ?auto_233966 ) ( IN-CITY ?auto_233958 ?auto_233966 ) ( not ( = ?auto_233958 ?auto_233970 ) ) ( OBJ-AT ?auto_233959 ?auto_233970 ) ( IN-CITY ?auto_233969 ?auto_233966 ) ( not ( = ?auto_233958 ?auto_233969 ) ) ( OBJ-AT ?auto_233960 ?auto_233969 ) ( IN-CITY ?auto_233965 ?auto_233966 ) ( not ( = ?auto_233958 ?auto_233965 ) ) ( OBJ-AT ?auto_233963 ?auto_233965 ) ( IN-CITY ?auto_233968 ?auto_233966 ) ( not ( = ?auto_233958 ?auto_233968 ) ) ( OBJ-AT ?auto_233962 ?auto_233968 ) ( IN-CITY ?auto_233964 ?auto_233966 ) ( not ( = ?auto_233958 ?auto_233964 ) ) ( OBJ-AT ?auto_233961 ?auto_233964 ) ( TRUCK-AT ?auto_233967 ?auto_233958 ) ( not ( = ?auto_233961 ?auto_233962 ) ) ( not ( = ?auto_233968 ?auto_233964 ) ) ( not ( = ?auto_233961 ?auto_233963 ) ) ( not ( = ?auto_233962 ?auto_233963 ) ) ( not ( = ?auto_233965 ?auto_233968 ) ) ( not ( = ?auto_233965 ?auto_233964 ) ) ( not ( = ?auto_233961 ?auto_233960 ) ) ( not ( = ?auto_233962 ?auto_233960 ) ) ( not ( = ?auto_233963 ?auto_233960 ) ) ( not ( = ?auto_233969 ?auto_233965 ) ) ( not ( = ?auto_233969 ?auto_233968 ) ) ( not ( = ?auto_233969 ?auto_233964 ) ) ( not ( = ?auto_233961 ?auto_233959 ) ) ( not ( = ?auto_233962 ?auto_233959 ) ) ( not ( = ?auto_233963 ?auto_233959 ) ) ( not ( = ?auto_233960 ?auto_233959 ) ) ( not ( = ?auto_233970 ?auto_233969 ) ) ( not ( = ?auto_233970 ?auto_233965 ) ) ( not ( = ?auto_233970 ?auto_233968 ) ) ( not ( = ?auto_233970 ?auto_233964 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_233961 ?auto_233962 ?auto_233963 ?auto_233959 ?auto_233960 ?auto_233958 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_234014 - OBJ
      ?auto_234015 - OBJ
      ?auto_234016 - OBJ
      ?auto_234017 - OBJ
      ?auto_234018 - OBJ
      ?auto_234013 - LOCATION
    )
    :vars
    (
      ?auto_234025 - LOCATION
      ?auto_234021 - CITY
      ?auto_234024 - LOCATION
      ?auto_234020 - LOCATION
      ?auto_234023 - LOCATION
      ?auto_234019 - LOCATION
      ?auto_234022 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234025 ?auto_234021 ) ( IN-CITY ?auto_234013 ?auto_234021 ) ( not ( = ?auto_234013 ?auto_234025 ) ) ( OBJ-AT ?auto_234014 ?auto_234025 ) ( IN-CITY ?auto_234024 ?auto_234021 ) ( not ( = ?auto_234013 ?auto_234024 ) ) ( OBJ-AT ?auto_234015 ?auto_234024 ) ( IN-CITY ?auto_234020 ?auto_234021 ) ( not ( = ?auto_234013 ?auto_234020 ) ) ( OBJ-AT ?auto_234017 ?auto_234020 ) ( IN-CITY ?auto_234023 ?auto_234021 ) ( not ( = ?auto_234013 ?auto_234023 ) ) ( OBJ-AT ?auto_234018 ?auto_234023 ) ( IN-CITY ?auto_234019 ?auto_234021 ) ( not ( = ?auto_234013 ?auto_234019 ) ) ( OBJ-AT ?auto_234016 ?auto_234019 ) ( TRUCK-AT ?auto_234022 ?auto_234013 ) ( not ( = ?auto_234016 ?auto_234018 ) ) ( not ( = ?auto_234023 ?auto_234019 ) ) ( not ( = ?auto_234016 ?auto_234017 ) ) ( not ( = ?auto_234018 ?auto_234017 ) ) ( not ( = ?auto_234020 ?auto_234023 ) ) ( not ( = ?auto_234020 ?auto_234019 ) ) ( not ( = ?auto_234016 ?auto_234015 ) ) ( not ( = ?auto_234018 ?auto_234015 ) ) ( not ( = ?auto_234017 ?auto_234015 ) ) ( not ( = ?auto_234024 ?auto_234020 ) ) ( not ( = ?auto_234024 ?auto_234023 ) ) ( not ( = ?auto_234024 ?auto_234019 ) ) ( not ( = ?auto_234016 ?auto_234014 ) ) ( not ( = ?auto_234018 ?auto_234014 ) ) ( not ( = ?auto_234017 ?auto_234014 ) ) ( not ( = ?auto_234015 ?auto_234014 ) ) ( not ( = ?auto_234025 ?auto_234024 ) ) ( not ( = ?auto_234025 ?auto_234020 ) ) ( not ( = ?auto_234025 ?auto_234023 ) ) ( not ( = ?auto_234025 ?auto_234019 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_234016 ?auto_234018 ?auto_234017 ?auto_234014 ?auto_234015 ?auto_234013 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_234243 - OBJ
      ?auto_234244 - OBJ
      ?auto_234245 - OBJ
      ?auto_234246 - OBJ
      ?auto_234247 - OBJ
      ?auto_234242 - LOCATION
    )
    :vars
    (
      ?auto_234254 - LOCATION
      ?auto_234250 - CITY
      ?auto_234253 - LOCATION
      ?auto_234249 - LOCATION
      ?auto_234252 - LOCATION
      ?auto_234248 - LOCATION
      ?auto_234251 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234254 ?auto_234250 ) ( IN-CITY ?auto_234242 ?auto_234250 ) ( not ( = ?auto_234242 ?auto_234254 ) ) ( OBJ-AT ?auto_234243 ?auto_234254 ) ( IN-CITY ?auto_234253 ?auto_234250 ) ( not ( = ?auto_234242 ?auto_234253 ) ) ( OBJ-AT ?auto_234244 ?auto_234253 ) ( IN-CITY ?auto_234249 ?auto_234250 ) ( not ( = ?auto_234242 ?auto_234249 ) ) ( OBJ-AT ?auto_234247 ?auto_234249 ) ( IN-CITY ?auto_234252 ?auto_234250 ) ( not ( = ?auto_234242 ?auto_234252 ) ) ( OBJ-AT ?auto_234245 ?auto_234252 ) ( IN-CITY ?auto_234248 ?auto_234250 ) ( not ( = ?auto_234242 ?auto_234248 ) ) ( OBJ-AT ?auto_234246 ?auto_234248 ) ( TRUCK-AT ?auto_234251 ?auto_234242 ) ( not ( = ?auto_234246 ?auto_234245 ) ) ( not ( = ?auto_234252 ?auto_234248 ) ) ( not ( = ?auto_234246 ?auto_234247 ) ) ( not ( = ?auto_234245 ?auto_234247 ) ) ( not ( = ?auto_234249 ?auto_234252 ) ) ( not ( = ?auto_234249 ?auto_234248 ) ) ( not ( = ?auto_234246 ?auto_234244 ) ) ( not ( = ?auto_234245 ?auto_234244 ) ) ( not ( = ?auto_234247 ?auto_234244 ) ) ( not ( = ?auto_234253 ?auto_234249 ) ) ( not ( = ?auto_234253 ?auto_234252 ) ) ( not ( = ?auto_234253 ?auto_234248 ) ) ( not ( = ?auto_234246 ?auto_234243 ) ) ( not ( = ?auto_234245 ?auto_234243 ) ) ( not ( = ?auto_234247 ?auto_234243 ) ) ( not ( = ?auto_234244 ?auto_234243 ) ) ( not ( = ?auto_234254 ?auto_234253 ) ) ( not ( = ?auto_234254 ?auto_234249 ) ) ( not ( = ?auto_234254 ?auto_234252 ) ) ( not ( = ?auto_234254 ?auto_234248 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_234246 ?auto_234245 ?auto_234247 ?auto_234243 ?auto_234244 ?auto_234242 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_234357 - OBJ
      ?auto_234358 - OBJ
      ?auto_234359 - OBJ
      ?auto_234360 - OBJ
      ?auto_234361 - OBJ
      ?auto_234356 - LOCATION
    )
    :vars
    (
      ?auto_234368 - LOCATION
      ?auto_234364 - CITY
      ?auto_234367 - LOCATION
      ?auto_234363 - LOCATION
      ?auto_234366 - LOCATION
      ?auto_234362 - LOCATION
      ?auto_234365 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234368 ?auto_234364 ) ( IN-CITY ?auto_234356 ?auto_234364 ) ( not ( = ?auto_234356 ?auto_234368 ) ) ( OBJ-AT ?auto_234357 ?auto_234368 ) ( IN-CITY ?auto_234367 ?auto_234364 ) ( not ( = ?auto_234356 ?auto_234367 ) ) ( OBJ-AT ?auto_234358 ?auto_234367 ) ( IN-CITY ?auto_234363 ?auto_234364 ) ( not ( = ?auto_234356 ?auto_234363 ) ) ( OBJ-AT ?auto_234360 ?auto_234363 ) ( IN-CITY ?auto_234366 ?auto_234364 ) ( not ( = ?auto_234356 ?auto_234366 ) ) ( OBJ-AT ?auto_234359 ?auto_234366 ) ( IN-CITY ?auto_234362 ?auto_234364 ) ( not ( = ?auto_234356 ?auto_234362 ) ) ( OBJ-AT ?auto_234361 ?auto_234362 ) ( TRUCK-AT ?auto_234365 ?auto_234356 ) ( not ( = ?auto_234361 ?auto_234359 ) ) ( not ( = ?auto_234366 ?auto_234362 ) ) ( not ( = ?auto_234361 ?auto_234360 ) ) ( not ( = ?auto_234359 ?auto_234360 ) ) ( not ( = ?auto_234363 ?auto_234366 ) ) ( not ( = ?auto_234363 ?auto_234362 ) ) ( not ( = ?auto_234361 ?auto_234358 ) ) ( not ( = ?auto_234359 ?auto_234358 ) ) ( not ( = ?auto_234360 ?auto_234358 ) ) ( not ( = ?auto_234367 ?auto_234363 ) ) ( not ( = ?auto_234367 ?auto_234366 ) ) ( not ( = ?auto_234367 ?auto_234362 ) ) ( not ( = ?auto_234361 ?auto_234357 ) ) ( not ( = ?auto_234359 ?auto_234357 ) ) ( not ( = ?auto_234360 ?auto_234357 ) ) ( not ( = ?auto_234358 ?auto_234357 ) ) ( not ( = ?auto_234368 ?auto_234367 ) ) ( not ( = ?auto_234368 ?auto_234363 ) ) ( not ( = ?auto_234368 ?auto_234366 ) ) ( not ( = ?auto_234368 ?auto_234362 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_234361 ?auto_234359 ?auto_234360 ?auto_234357 ?auto_234358 ?auto_234356 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_234586 - OBJ
      ?auto_234587 - OBJ
      ?auto_234588 - OBJ
      ?auto_234589 - OBJ
      ?auto_234590 - OBJ
      ?auto_234585 - LOCATION
    )
    :vars
    (
      ?auto_234597 - LOCATION
      ?auto_234593 - CITY
      ?auto_234596 - LOCATION
      ?auto_234592 - LOCATION
      ?auto_234595 - LOCATION
      ?auto_234591 - LOCATION
      ?auto_234594 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234597 ?auto_234593 ) ( IN-CITY ?auto_234585 ?auto_234593 ) ( not ( = ?auto_234585 ?auto_234597 ) ) ( OBJ-AT ?auto_234586 ?auto_234597 ) ( IN-CITY ?auto_234596 ?auto_234593 ) ( not ( = ?auto_234585 ?auto_234596 ) ) ( OBJ-AT ?auto_234587 ?auto_234596 ) ( IN-CITY ?auto_234592 ?auto_234593 ) ( not ( = ?auto_234585 ?auto_234592 ) ) ( OBJ-AT ?auto_234588 ?auto_234592 ) ( IN-CITY ?auto_234595 ?auto_234593 ) ( not ( = ?auto_234585 ?auto_234595 ) ) ( OBJ-AT ?auto_234590 ?auto_234595 ) ( IN-CITY ?auto_234591 ?auto_234593 ) ( not ( = ?auto_234585 ?auto_234591 ) ) ( OBJ-AT ?auto_234589 ?auto_234591 ) ( TRUCK-AT ?auto_234594 ?auto_234585 ) ( not ( = ?auto_234589 ?auto_234590 ) ) ( not ( = ?auto_234595 ?auto_234591 ) ) ( not ( = ?auto_234589 ?auto_234588 ) ) ( not ( = ?auto_234590 ?auto_234588 ) ) ( not ( = ?auto_234592 ?auto_234595 ) ) ( not ( = ?auto_234592 ?auto_234591 ) ) ( not ( = ?auto_234589 ?auto_234587 ) ) ( not ( = ?auto_234590 ?auto_234587 ) ) ( not ( = ?auto_234588 ?auto_234587 ) ) ( not ( = ?auto_234596 ?auto_234592 ) ) ( not ( = ?auto_234596 ?auto_234595 ) ) ( not ( = ?auto_234596 ?auto_234591 ) ) ( not ( = ?auto_234589 ?auto_234586 ) ) ( not ( = ?auto_234590 ?auto_234586 ) ) ( not ( = ?auto_234588 ?auto_234586 ) ) ( not ( = ?auto_234587 ?auto_234586 ) ) ( not ( = ?auto_234597 ?auto_234596 ) ) ( not ( = ?auto_234597 ?auto_234592 ) ) ( not ( = ?auto_234597 ?auto_234595 ) ) ( not ( = ?auto_234597 ?auto_234591 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_234589 ?auto_234590 ?auto_234588 ?auto_234586 ?auto_234587 ?auto_234585 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_234641 - OBJ
      ?auto_234642 - OBJ
      ?auto_234643 - OBJ
      ?auto_234644 - OBJ
      ?auto_234645 - OBJ
      ?auto_234640 - LOCATION
    )
    :vars
    (
      ?auto_234652 - LOCATION
      ?auto_234648 - CITY
      ?auto_234651 - LOCATION
      ?auto_234647 - LOCATION
      ?auto_234650 - LOCATION
      ?auto_234646 - LOCATION
      ?auto_234649 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_234652 ?auto_234648 ) ( IN-CITY ?auto_234640 ?auto_234648 ) ( not ( = ?auto_234640 ?auto_234652 ) ) ( OBJ-AT ?auto_234641 ?auto_234652 ) ( IN-CITY ?auto_234651 ?auto_234648 ) ( not ( = ?auto_234640 ?auto_234651 ) ) ( OBJ-AT ?auto_234642 ?auto_234651 ) ( IN-CITY ?auto_234647 ?auto_234648 ) ( not ( = ?auto_234640 ?auto_234647 ) ) ( OBJ-AT ?auto_234643 ?auto_234647 ) ( IN-CITY ?auto_234650 ?auto_234648 ) ( not ( = ?auto_234640 ?auto_234650 ) ) ( OBJ-AT ?auto_234644 ?auto_234650 ) ( IN-CITY ?auto_234646 ?auto_234648 ) ( not ( = ?auto_234640 ?auto_234646 ) ) ( OBJ-AT ?auto_234645 ?auto_234646 ) ( TRUCK-AT ?auto_234649 ?auto_234640 ) ( not ( = ?auto_234645 ?auto_234644 ) ) ( not ( = ?auto_234650 ?auto_234646 ) ) ( not ( = ?auto_234645 ?auto_234643 ) ) ( not ( = ?auto_234644 ?auto_234643 ) ) ( not ( = ?auto_234647 ?auto_234650 ) ) ( not ( = ?auto_234647 ?auto_234646 ) ) ( not ( = ?auto_234645 ?auto_234642 ) ) ( not ( = ?auto_234644 ?auto_234642 ) ) ( not ( = ?auto_234643 ?auto_234642 ) ) ( not ( = ?auto_234651 ?auto_234647 ) ) ( not ( = ?auto_234651 ?auto_234650 ) ) ( not ( = ?auto_234651 ?auto_234646 ) ) ( not ( = ?auto_234645 ?auto_234641 ) ) ( not ( = ?auto_234644 ?auto_234641 ) ) ( not ( = ?auto_234643 ?auto_234641 ) ) ( not ( = ?auto_234642 ?auto_234641 ) ) ( not ( = ?auto_234652 ?auto_234651 ) ) ( not ( = ?auto_234652 ?auto_234647 ) ) ( not ( = ?auto_234652 ?auto_234650 ) ) ( not ( = ?auto_234652 ?auto_234646 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_234645 ?auto_234644 ?auto_234643 ?auto_234641 ?auto_234642 ?auto_234640 ) )
  )

)

