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
      ?auto_104147 - OBJ
      ?auto_104146 - LOCATION
    )
    :vars
    (
      ?auto_104149 - LOCATION
      ?auto_104150 - CITY
      ?auto_104148 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104149 ?auto_104150 ) ( IN-CITY ?auto_104146 ?auto_104150 ) ( not ( = ?auto_104146 ?auto_104149 ) ) ( OBJ-AT ?auto_104147 ?auto_104149 ) ( TRUCK-AT ?auto_104148 ?auto_104146 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_104148 ?auto_104146 ?auto_104149 ?auto_104150 )
      ( !LOAD-TRUCK ?auto_104147 ?auto_104148 ?auto_104149 )
      ( !DRIVE-TRUCK ?auto_104148 ?auto_104149 ?auto_104146 ?auto_104150 )
      ( !UNLOAD-TRUCK ?auto_104147 ?auto_104148 ?auto_104146 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_104154 - OBJ
      ?auto_104153 - LOCATION
    )
    :vars
    (
      ?auto_104156 - LOCATION
      ?auto_104157 - CITY
      ?auto_104155 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104156 ?auto_104157 ) ( IN-CITY ?auto_104153 ?auto_104157 ) ( not ( = ?auto_104153 ?auto_104156 ) ) ( OBJ-AT ?auto_104154 ?auto_104156 ) ( TRUCK-AT ?auto_104155 ?auto_104153 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_104155 ?auto_104153 ?auto_104156 ?auto_104157 )
      ( !LOAD-TRUCK ?auto_104154 ?auto_104155 ?auto_104156 )
      ( !DRIVE-TRUCK ?auto_104155 ?auto_104156 ?auto_104153 ?auto_104157 )
      ( !UNLOAD-TRUCK ?auto_104154 ?auto_104155 ?auto_104153 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_104168 - OBJ
      ?auto_104169 - OBJ
      ?auto_104167 - LOCATION
    )
    :vars
    (
      ?auto_104171 - LOCATION
      ?auto_104172 - CITY
      ?auto_104173 - LOCATION
      ?auto_104170 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104171 ?auto_104172 ) ( IN-CITY ?auto_104167 ?auto_104172 ) ( not ( = ?auto_104167 ?auto_104171 ) ) ( OBJ-AT ?auto_104169 ?auto_104171 ) ( IN-CITY ?auto_104173 ?auto_104172 ) ( not ( = ?auto_104167 ?auto_104173 ) ) ( OBJ-AT ?auto_104168 ?auto_104173 ) ( TRUCK-AT ?auto_104170 ?auto_104167 ) ( not ( = ?auto_104168 ?auto_104169 ) ) ( not ( = ?auto_104171 ?auto_104173 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_104168 ?auto_104167 )
      ( DELIVER-1PKG ?auto_104169 ?auto_104167 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_104175 - OBJ
      ?auto_104176 - OBJ
      ?auto_104174 - LOCATION
    )
    :vars
    (
      ?auto_104180 - LOCATION
      ?auto_104179 - CITY
      ?auto_104178 - LOCATION
      ?auto_104177 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104180 ?auto_104179 ) ( IN-CITY ?auto_104174 ?auto_104179 ) ( not ( = ?auto_104174 ?auto_104180 ) ) ( OBJ-AT ?auto_104175 ?auto_104180 ) ( IN-CITY ?auto_104178 ?auto_104179 ) ( not ( = ?auto_104174 ?auto_104178 ) ) ( OBJ-AT ?auto_104176 ?auto_104178 ) ( TRUCK-AT ?auto_104177 ?auto_104174 ) ( not ( = ?auto_104176 ?auto_104175 ) ) ( not ( = ?auto_104180 ?auto_104178 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104176 ?auto_104175 ?auto_104174 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_104192 - OBJ
      ?auto_104191 - LOCATION
    )
    :vars
    (
      ?auto_104194 - LOCATION
      ?auto_104195 - CITY
      ?auto_104193 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104194 ?auto_104195 ) ( IN-CITY ?auto_104191 ?auto_104195 ) ( not ( = ?auto_104191 ?auto_104194 ) ) ( OBJ-AT ?auto_104192 ?auto_104194 ) ( TRUCK-AT ?auto_104193 ?auto_104191 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_104193 ?auto_104191 ?auto_104194 ?auto_104195 )
      ( !LOAD-TRUCK ?auto_104192 ?auto_104193 ?auto_104194 )
      ( !DRIVE-TRUCK ?auto_104193 ?auto_104194 ?auto_104191 ?auto_104195 )
      ( !UNLOAD-TRUCK ?auto_104192 ?auto_104193 ?auto_104191 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104283 - OBJ
      ?auto_104284 - OBJ
      ?auto_104285 - OBJ
      ?auto_104282 - LOCATION
    )
    :vars
    (
      ?auto_104288 - LOCATION
      ?auto_104286 - CITY
      ?auto_104289 - LOCATION
      ?auto_104290 - LOCATION
      ?auto_104287 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104288 ?auto_104286 ) ( IN-CITY ?auto_104282 ?auto_104286 ) ( not ( = ?auto_104282 ?auto_104288 ) ) ( OBJ-AT ?auto_104285 ?auto_104288 ) ( IN-CITY ?auto_104289 ?auto_104286 ) ( not ( = ?auto_104282 ?auto_104289 ) ) ( OBJ-AT ?auto_104284 ?auto_104289 ) ( IN-CITY ?auto_104290 ?auto_104286 ) ( not ( = ?auto_104282 ?auto_104290 ) ) ( OBJ-AT ?auto_104283 ?auto_104290 ) ( TRUCK-AT ?auto_104287 ?auto_104282 ) ( not ( = ?auto_104283 ?auto_104284 ) ) ( not ( = ?auto_104289 ?auto_104290 ) ) ( not ( = ?auto_104283 ?auto_104285 ) ) ( not ( = ?auto_104284 ?auto_104285 ) ) ( not ( = ?auto_104288 ?auto_104289 ) ) ( not ( = ?auto_104288 ?auto_104290 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_104284 ?auto_104283 ?auto_104282 )
      ( DELIVER-1PKG ?auto_104285 ?auto_104282 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104302 - OBJ
      ?auto_104303 - OBJ
      ?auto_104304 - OBJ
      ?auto_104301 - LOCATION
    )
    :vars
    (
      ?auto_104309 - LOCATION
      ?auto_104305 - CITY
      ?auto_104308 - LOCATION
      ?auto_104306 - LOCATION
      ?auto_104307 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104309 ?auto_104305 ) ( IN-CITY ?auto_104301 ?auto_104305 ) ( not ( = ?auto_104301 ?auto_104309 ) ) ( OBJ-AT ?auto_104303 ?auto_104309 ) ( IN-CITY ?auto_104308 ?auto_104305 ) ( not ( = ?auto_104301 ?auto_104308 ) ) ( OBJ-AT ?auto_104304 ?auto_104308 ) ( IN-CITY ?auto_104306 ?auto_104305 ) ( not ( = ?auto_104301 ?auto_104306 ) ) ( OBJ-AT ?auto_104302 ?auto_104306 ) ( TRUCK-AT ?auto_104307 ?auto_104301 ) ( not ( = ?auto_104302 ?auto_104304 ) ) ( not ( = ?auto_104308 ?auto_104306 ) ) ( not ( = ?auto_104302 ?auto_104303 ) ) ( not ( = ?auto_104304 ?auto_104303 ) ) ( not ( = ?auto_104309 ?auto_104308 ) ) ( not ( = ?auto_104309 ?auto_104306 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_104302 ?auto_104304 ?auto_104303 ?auto_104301 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104321 - OBJ
      ?auto_104322 - OBJ
      ?auto_104323 - OBJ
      ?auto_104320 - LOCATION
    )
    :vars
    (
      ?auto_104327 - LOCATION
      ?auto_104325 - CITY
      ?auto_104328 - LOCATION
      ?auto_104324 - LOCATION
      ?auto_104326 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104327 ?auto_104325 ) ( IN-CITY ?auto_104320 ?auto_104325 ) ( not ( = ?auto_104320 ?auto_104327 ) ) ( OBJ-AT ?auto_104323 ?auto_104327 ) ( IN-CITY ?auto_104328 ?auto_104325 ) ( not ( = ?auto_104320 ?auto_104328 ) ) ( OBJ-AT ?auto_104321 ?auto_104328 ) ( IN-CITY ?auto_104324 ?auto_104325 ) ( not ( = ?auto_104320 ?auto_104324 ) ) ( OBJ-AT ?auto_104322 ?auto_104324 ) ( TRUCK-AT ?auto_104326 ?auto_104320 ) ( not ( = ?auto_104322 ?auto_104321 ) ) ( not ( = ?auto_104328 ?auto_104324 ) ) ( not ( = ?auto_104322 ?auto_104323 ) ) ( not ( = ?auto_104321 ?auto_104323 ) ) ( not ( = ?auto_104327 ?auto_104328 ) ) ( not ( = ?auto_104327 ?auto_104324 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_104322 ?auto_104323 ?auto_104321 ?auto_104320 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104340 - OBJ
      ?auto_104341 - OBJ
      ?auto_104342 - OBJ
      ?auto_104339 - LOCATION
    )
    :vars
    (
      ?auto_104346 - LOCATION
      ?auto_104344 - CITY
      ?auto_104347 - LOCATION
      ?auto_104343 - LOCATION
      ?auto_104345 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104346 ?auto_104344 ) ( IN-CITY ?auto_104339 ?auto_104344 ) ( not ( = ?auto_104339 ?auto_104346 ) ) ( OBJ-AT ?auto_104341 ?auto_104346 ) ( IN-CITY ?auto_104347 ?auto_104344 ) ( not ( = ?auto_104339 ?auto_104347 ) ) ( OBJ-AT ?auto_104340 ?auto_104347 ) ( IN-CITY ?auto_104343 ?auto_104344 ) ( not ( = ?auto_104339 ?auto_104343 ) ) ( OBJ-AT ?auto_104342 ?auto_104343 ) ( TRUCK-AT ?auto_104345 ?auto_104339 ) ( not ( = ?auto_104342 ?auto_104340 ) ) ( not ( = ?auto_104347 ?auto_104343 ) ) ( not ( = ?auto_104342 ?auto_104341 ) ) ( not ( = ?auto_104340 ?auto_104341 ) ) ( not ( = ?auto_104346 ?auto_104347 ) ) ( not ( = ?auto_104346 ?auto_104343 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_104342 ?auto_104341 ?auto_104340 ?auto_104339 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104379 - OBJ
      ?auto_104380 - OBJ
      ?auto_104381 - OBJ
      ?auto_104378 - LOCATION
    )
    :vars
    (
      ?auto_104385 - LOCATION
      ?auto_104383 - CITY
      ?auto_104386 - LOCATION
      ?auto_104382 - LOCATION
      ?auto_104384 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104385 ?auto_104383 ) ( IN-CITY ?auto_104378 ?auto_104383 ) ( not ( = ?auto_104378 ?auto_104385 ) ) ( OBJ-AT ?auto_104379 ?auto_104385 ) ( IN-CITY ?auto_104386 ?auto_104383 ) ( not ( = ?auto_104378 ?auto_104386 ) ) ( OBJ-AT ?auto_104381 ?auto_104386 ) ( IN-CITY ?auto_104382 ?auto_104383 ) ( not ( = ?auto_104378 ?auto_104382 ) ) ( OBJ-AT ?auto_104380 ?auto_104382 ) ( TRUCK-AT ?auto_104384 ?auto_104378 ) ( not ( = ?auto_104380 ?auto_104381 ) ) ( not ( = ?auto_104386 ?auto_104382 ) ) ( not ( = ?auto_104380 ?auto_104379 ) ) ( not ( = ?auto_104381 ?auto_104379 ) ) ( not ( = ?auto_104385 ?auto_104386 ) ) ( not ( = ?auto_104385 ?auto_104382 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_104380 ?auto_104379 ?auto_104381 ?auto_104378 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_104398 - OBJ
      ?auto_104399 - OBJ
      ?auto_104400 - OBJ
      ?auto_104397 - LOCATION
    )
    :vars
    (
      ?auto_104404 - LOCATION
      ?auto_104402 - CITY
      ?auto_104405 - LOCATION
      ?auto_104401 - LOCATION
      ?auto_104403 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104404 ?auto_104402 ) ( IN-CITY ?auto_104397 ?auto_104402 ) ( not ( = ?auto_104397 ?auto_104404 ) ) ( OBJ-AT ?auto_104398 ?auto_104404 ) ( IN-CITY ?auto_104405 ?auto_104402 ) ( not ( = ?auto_104397 ?auto_104405 ) ) ( OBJ-AT ?auto_104399 ?auto_104405 ) ( IN-CITY ?auto_104401 ?auto_104402 ) ( not ( = ?auto_104397 ?auto_104401 ) ) ( OBJ-AT ?auto_104400 ?auto_104401 ) ( TRUCK-AT ?auto_104403 ?auto_104397 ) ( not ( = ?auto_104400 ?auto_104399 ) ) ( not ( = ?auto_104405 ?auto_104401 ) ) ( not ( = ?auto_104400 ?auto_104398 ) ) ( not ( = ?auto_104399 ?auto_104398 ) ) ( not ( = ?auto_104404 ?auto_104405 ) ) ( not ( = ?auto_104404 ?auto_104401 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_104400 ?auto_104398 ?auto_104399 ?auto_104397 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_104460 - OBJ
      ?auto_104459 - LOCATION
    )
    :vars
    (
      ?auto_104462 - LOCATION
      ?auto_104463 - CITY
      ?auto_104461 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_104462 ?auto_104463 ) ( IN-CITY ?auto_104459 ?auto_104463 ) ( not ( = ?auto_104459 ?auto_104462 ) ) ( OBJ-AT ?auto_104460 ?auto_104462 ) ( TRUCK-AT ?auto_104461 ?auto_104459 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_104461 ?auto_104459 ?auto_104462 ?auto_104463 )
      ( !LOAD-TRUCK ?auto_104460 ?auto_104461 ?auto_104462 )
      ( !DRIVE-TRUCK ?auto_104461 ?auto_104462 ?auto_104459 ?auto_104463 )
      ( !UNLOAD-TRUCK ?auto_104460 ?auto_104461 ?auto_104459 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105451 - OBJ
      ?auto_105452 - OBJ
      ?auto_105453 - OBJ
      ?auto_105454 - OBJ
      ?auto_105450 - LOCATION
    )
    :vars
    (
      ?auto_105455 - LOCATION
      ?auto_105457 - CITY
      ?auto_105459 - LOCATION
      ?auto_105460 - LOCATION
      ?auto_105458 - LOCATION
      ?auto_105456 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105455 ?auto_105457 ) ( IN-CITY ?auto_105450 ?auto_105457 ) ( not ( = ?auto_105450 ?auto_105455 ) ) ( OBJ-AT ?auto_105454 ?auto_105455 ) ( IN-CITY ?auto_105459 ?auto_105457 ) ( not ( = ?auto_105450 ?auto_105459 ) ) ( OBJ-AT ?auto_105453 ?auto_105459 ) ( IN-CITY ?auto_105460 ?auto_105457 ) ( not ( = ?auto_105450 ?auto_105460 ) ) ( OBJ-AT ?auto_105452 ?auto_105460 ) ( IN-CITY ?auto_105458 ?auto_105457 ) ( not ( = ?auto_105450 ?auto_105458 ) ) ( OBJ-AT ?auto_105451 ?auto_105458 ) ( TRUCK-AT ?auto_105456 ?auto_105450 ) ( not ( = ?auto_105451 ?auto_105452 ) ) ( not ( = ?auto_105460 ?auto_105458 ) ) ( not ( = ?auto_105451 ?auto_105453 ) ) ( not ( = ?auto_105452 ?auto_105453 ) ) ( not ( = ?auto_105459 ?auto_105460 ) ) ( not ( = ?auto_105459 ?auto_105458 ) ) ( not ( = ?auto_105451 ?auto_105454 ) ) ( not ( = ?auto_105452 ?auto_105454 ) ) ( not ( = ?auto_105453 ?auto_105454 ) ) ( not ( = ?auto_105455 ?auto_105459 ) ) ( not ( = ?auto_105455 ?auto_105460 ) ) ( not ( = ?auto_105455 ?auto_105458 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_105451 ?auto_105453 ?auto_105452 ?auto_105450 )
      ( DELIVER-1PKG ?auto_105454 ?auto_105450 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105486 - OBJ
      ?auto_105487 - OBJ
      ?auto_105488 - OBJ
      ?auto_105489 - OBJ
      ?auto_105485 - LOCATION
    )
    :vars
    (
      ?auto_105491 - LOCATION
      ?auto_105495 - CITY
      ?auto_105494 - LOCATION
      ?auto_105492 - LOCATION
      ?auto_105493 - LOCATION
      ?auto_105490 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105491 ?auto_105495 ) ( IN-CITY ?auto_105485 ?auto_105495 ) ( not ( = ?auto_105485 ?auto_105491 ) ) ( OBJ-AT ?auto_105488 ?auto_105491 ) ( IN-CITY ?auto_105494 ?auto_105495 ) ( not ( = ?auto_105485 ?auto_105494 ) ) ( OBJ-AT ?auto_105489 ?auto_105494 ) ( IN-CITY ?auto_105492 ?auto_105495 ) ( not ( = ?auto_105485 ?auto_105492 ) ) ( OBJ-AT ?auto_105487 ?auto_105492 ) ( IN-CITY ?auto_105493 ?auto_105495 ) ( not ( = ?auto_105485 ?auto_105493 ) ) ( OBJ-AT ?auto_105486 ?auto_105493 ) ( TRUCK-AT ?auto_105490 ?auto_105485 ) ( not ( = ?auto_105486 ?auto_105487 ) ) ( not ( = ?auto_105492 ?auto_105493 ) ) ( not ( = ?auto_105486 ?auto_105489 ) ) ( not ( = ?auto_105487 ?auto_105489 ) ) ( not ( = ?auto_105494 ?auto_105492 ) ) ( not ( = ?auto_105494 ?auto_105493 ) ) ( not ( = ?auto_105486 ?auto_105488 ) ) ( not ( = ?auto_105487 ?auto_105488 ) ) ( not ( = ?auto_105489 ?auto_105488 ) ) ( not ( = ?auto_105491 ?auto_105494 ) ) ( not ( = ?auto_105491 ?auto_105492 ) ) ( not ( = ?auto_105491 ?auto_105493 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105486 ?auto_105487 ?auto_105489 ?auto_105488 ?auto_105485 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105521 - OBJ
      ?auto_105522 - OBJ
      ?auto_105523 - OBJ
      ?auto_105524 - OBJ
      ?auto_105520 - LOCATION
    )
    :vars
    (
      ?auto_105525 - LOCATION
      ?auto_105529 - CITY
      ?auto_105528 - LOCATION
      ?auto_105526 - LOCATION
      ?auto_105530 - LOCATION
      ?auto_105527 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105525 ?auto_105529 ) ( IN-CITY ?auto_105520 ?auto_105529 ) ( not ( = ?auto_105520 ?auto_105525 ) ) ( OBJ-AT ?auto_105524 ?auto_105525 ) ( IN-CITY ?auto_105528 ?auto_105529 ) ( not ( = ?auto_105520 ?auto_105528 ) ) ( OBJ-AT ?auto_105522 ?auto_105528 ) ( IN-CITY ?auto_105526 ?auto_105529 ) ( not ( = ?auto_105520 ?auto_105526 ) ) ( OBJ-AT ?auto_105523 ?auto_105526 ) ( IN-CITY ?auto_105530 ?auto_105529 ) ( not ( = ?auto_105520 ?auto_105530 ) ) ( OBJ-AT ?auto_105521 ?auto_105530 ) ( TRUCK-AT ?auto_105527 ?auto_105520 ) ( not ( = ?auto_105521 ?auto_105523 ) ) ( not ( = ?auto_105526 ?auto_105530 ) ) ( not ( = ?auto_105521 ?auto_105522 ) ) ( not ( = ?auto_105523 ?auto_105522 ) ) ( not ( = ?auto_105528 ?auto_105526 ) ) ( not ( = ?auto_105528 ?auto_105530 ) ) ( not ( = ?auto_105521 ?auto_105524 ) ) ( not ( = ?auto_105523 ?auto_105524 ) ) ( not ( = ?auto_105522 ?auto_105524 ) ) ( not ( = ?auto_105525 ?auto_105528 ) ) ( not ( = ?auto_105525 ?auto_105526 ) ) ( not ( = ?auto_105525 ?auto_105530 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105521 ?auto_105523 ?auto_105524 ?auto_105522 ?auto_105520 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105556 - OBJ
      ?auto_105557 - OBJ
      ?auto_105558 - OBJ
      ?auto_105559 - OBJ
      ?auto_105555 - LOCATION
    )
    :vars
    (
      ?auto_105560 - LOCATION
      ?auto_105564 - CITY
      ?auto_105563 - LOCATION
      ?auto_105561 - LOCATION
      ?auto_105565 - LOCATION
      ?auto_105562 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105560 ?auto_105564 ) ( IN-CITY ?auto_105555 ?auto_105564 ) ( not ( = ?auto_105555 ?auto_105560 ) ) ( OBJ-AT ?auto_105558 ?auto_105560 ) ( IN-CITY ?auto_105563 ?auto_105564 ) ( not ( = ?auto_105555 ?auto_105563 ) ) ( OBJ-AT ?auto_105557 ?auto_105563 ) ( IN-CITY ?auto_105561 ?auto_105564 ) ( not ( = ?auto_105555 ?auto_105561 ) ) ( OBJ-AT ?auto_105559 ?auto_105561 ) ( IN-CITY ?auto_105565 ?auto_105564 ) ( not ( = ?auto_105555 ?auto_105565 ) ) ( OBJ-AT ?auto_105556 ?auto_105565 ) ( TRUCK-AT ?auto_105562 ?auto_105555 ) ( not ( = ?auto_105556 ?auto_105559 ) ) ( not ( = ?auto_105561 ?auto_105565 ) ) ( not ( = ?auto_105556 ?auto_105557 ) ) ( not ( = ?auto_105559 ?auto_105557 ) ) ( not ( = ?auto_105563 ?auto_105561 ) ) ( not ( = ?auto_105563 ?auto_105565 ) ) ( not ( = ?auto_105556 ?auto_105558 ) ) ( not ( = ?auto_105559 ?auto_105558 ) ) ( not ( = ?auto_105557 ?auto_105558 ) ) ( not ( = ?auto_105560 ?auto_105563 ) ) ( not ( = ?auto_105560 ?auto_105561 ) ) ( not ( = ?auto_105560 ?auto_105565 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105556 ?auto_105559 ?auto_105558 ?auto_105557 ?auto_105555 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105665 - OBJ
      ?auto_105666 - OBJ
      ?auto_105667 - OBJ
      ?auto_105668 - OBJ
      ?auto_105664 - LOCATION
    )
    :vars
    (
      ?auto_105669 - LOCATION
      ?auto_105673 - CITY
      ?auto_105672 - LOCATION
      ?auto_105670 - LOCATION
      ?auto_105674 - LOCATION
      ?auto_105671 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105669 ?auto_105673 ) ( IN-CITY ?auto_105664 ?auto_105673 ) ( not ( = ?auto_105664 ?auto_105669 ) ) ( OBJ-AT ?auto_105666 ?auto_105669 ) ( IN-CITY ?auto_105672 ?auto_105673 ) ( not ( = ?auto_105664 ?auto_105672 ) ) ( OBJ-AT ?auto_105668 ?auto_105672 ) ( IN-CITY ?auto_105670 ?auto_105673 ) ( not ( = ?auto_105664 ?auto_105670 ) ) ( OBJ-AT ?auto_105667 ?auto_105670 ) ( IN-CITY ?auto_105674 ?auto_105673 ) ( not ( = ?auto_105664 ?auto_105674 ) ) ( OBJ-AT ?auto_105665 ?auto_105674 ) ( TRUCK-AT ?auto_105671 ?auto_105664 ) ( not ( = ?auto_105665 ?auto_105667 ) ) ( not ( = ?auto_105670 ?auto_105674 ) ) ( not ( = ?auto_105665 ?auto_105668 ) ) ( not ( = ?auto_105667 ?auto_105668 ) ) ( not ( = ?auto_105672 ?auto_105670 ) ) ( not ( = ?auto_105672 ?auto_105674 ) ) ( not ( = ?auto_105665 ?auto_105666 ) ) ( not ( = ?auto_105667 ?auto_105666 ) ) ( not ( = ?auto_105668 ?auto_105666 ) ) ( not ( = ?auto_105669 ?auto_105672 ) ) ( not ( = ?auto_105669 ?auto_105670 ) ) ( not ( = ?auto_105669 ?auto_105674 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105665 ?auto_105667 ?auto_105666 ?auto_105668 ?auto_105664 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105700 - OBJ
      ?auto_105701 - OBJ
      ?auto_105702 - OBJ
      ?auto_105703 - OBJ
      ?auto_105699 - LOCATION
    )
    :vars
    (
      ?auto_105704 - LOCATION
      ?auto_105708 - CITY
      ?auto_105707 - LOCATION
      ?auto_105705 - LOCATION
      ?auto_105709 - LOCATION
      ?auto_105706 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105704 ?auto_105708 ) ( IN-CITY ?auto_105699 ?auto_105708 ) ( not ( = ?auto_105699 ?auto_105704 ) ) ( OBJ-AT ?auto_105701 ?auto_105704 ) ( IN-CITY ?auto_105707 ?auto_105708 ) ( not ( = ?auto_105699 ?auto_105707 ) ) ( OBJ-AT ?auto_105702 ?auto_105707 ) ( IN-CITY ?auto_105705 ?auto_105708 ) ( not ( = ?auto_105699 ?auto_105705 ) ) ( OBJ-AT ?auto_105703 ?auto_105705 ) ( IN-CITY ?auto_105709 ?auto_105708 ) ( not ( = ?auto_105699 ?auto_105709 ) ) ( OBJ-AT ?auto_105700 ?auto_105709 ) ( TRUCK-AT ?auto_105706 ?auto_105699 ) ( not ( = ?auto_105700 ?auto_105703 ) ) ( not ( = ?auto_105705 ?auto_105709 ) ) ( not ( = ?auto_105700 ?auto_105702 ) ) ( not ( = ?auto_105703 ?auto_105702 ) ) ( not ( = ?auto_105707 ?auto_105705 ) ) ( not ( = ?auto_105707 ?auto_105709 ) ) ( not ( = ?auto_105700 ?auto_105701 ) ) ( not ( = ?auto_105703 ?auto_105701 ) ) ( not ( = ?auto_105702 ?auto_105701 ) ) ( not ( = ?auto_105704 ?auto_105707 ) ) ( not ( = ?auto_105704 ?auto_105705 ) ) ( not ( = ?auto_105704 ?auto_105709 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105700 ?auto_105703 ?auto_105701 ?auto_105702 ?auto_105699 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105809 - OBJ
      ?auto_105810 - OBJ
      ?auto_105811 - OBJ
      ?auto_105812 - OBJ
      ?auto_105808 - LOCATION
    )
    :vars
    (
      ?auto_105813 - LOCATION
      ?auto_105817 - CITY
      ?auto_105816 - LOCATION
      ?auto_105814 - LOCATION
      ?auto_105818 - LOCATION
      ?auto_105815 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105813 ?auto_105817 ) ( IN-CITY ?auto_105808 ?auto_105817 ) ( not ( = ?auto_105808 ?auto_105813 ) ) ( OBJ-AT ?auto_105812 ?auto_105813 ) ( IN-CITY ?auto_105816 ?auto_105817 ) ( not ( = ?auto_105808 ?auto_105816 ) ) ( OBJ-AT ?auto_105811 ?auto_105816 ) ( IN-CITY ?auto_105814 ?auto_105817 ) ( not ( = ?auto_105808 ?auto_105814 ) ) ( OBJ-AT ?auto_105809 ?auto_105814 ) ( IN-CITY ?auto_105818 ?auto_105817 ) ( not ( = ?auto_105808 ?auto_105818 ) ) ( OBJ-AT ?auto_105810 ?auto_105818 ) ( TRUCK-AT ?auto_105815 ?auto_105808 ) ( not ( = ?auto_105810 ?auto_105809 ) ) ( not ( = ?auto_105814 ?auto_105818 ) ) ( not ( = ?auto_105810 ?auto_105811 ) ) ( not ( = ?auto_105809 ?auto_105811 ) ) ( not ( = ?auto_105816 ?auto_105814 ) ) ( not ( = ?auto_105816 ?auto_105818 ) ) ( not ( = ?auto_105810 ?auto_105812 ) ) ( not ( = ?auto_105809 ?auto_105812 ) ) ( not ( = ?auto_105811 ?auto_105812 ) ) ( not ( = ?auto_105813 ?auto_105816 ) ) ( not ( = ?auto_105813 ?auto_105814 ) ) ( not ( = ?auto_105813 ?auto_105818 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105810 ?auto_105809 ?auto_105812 ?auto_105811 ?auto_105808 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105844 - OBJ
      ?auto_105845 - OBJ
      ?auto_105846 - OBJ
      ?auto_105847 - OBJ
      ?auto_105843 - LOCATION
    )
    :vars
    (
      ?auto_105848 - LOCATION
      ?auto_105852 - CITY
      ?auto_105851 - LOCATION
      ?auto_105849 - LOCATION
      ?auto_105853 - LOCATION
      ?auto_105850 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105848 ?auto_105852 ) ( IN-CITY ?auto_105843 ?auto_105852 ) ( not ( = ?auto_105843 ?auto_105848 ) ) ( OBJ-AT ?auto_105846 ?auto_105848 ) ( IN-CITY ?auto_105851 ?auto_105852 ) ( not ( = ?auto_105843 ?auto_105851 ) ) ( OBJ-AT ?auto_105847 ?auto_105851 ) ( IN-CITY ?auto_105849 ?auto_105852 ) ( not ( = ?auto_105843 ?auto_105849 ) ) ( OBJ-AT ?auto_105844 ?auto_105849 ) ( IN-CITY ?auto_105853 ?auto_105852 ) ( not ( = ?auto_105843 ?auto_105853 ) ) ( OBJ-AT ?auto_105845 ?auto_105853 ) ( TRUCK-AT ?auto_105850 ?auto_105843 ) ( not ( = ?auto_105845 ?auto_105844 ) ) ( not ( = ?auto_105849 ?auto_105853 ) ) ( not ( = ?auto_105845 ?auto_105847 ) ) ( not ( = ?auto_105844 ?auto_105847 ) ) ( not ( = ?auto_105851 ?auto_105849 ) ) ( not ( = ?auto_105851 ?auto_105853 ) ) ( not ( = ?auto_105845 ?auto_105846 ) ) ( not ( = ?auto_105844 ?auto_105846 ) ) ( not ( = ?auto_105847 ?auto_105846 ) ) ( not ( = ?auto_105848 ?auto_105851 ) ) ( not ( = ?auto_105848 ?auto_105849 ) ) ( not ( = ?auto_105848 ?auto_105853 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105845 ?auto_105844 ?auto_105846 ?auto_105847 ?auto_105843 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105954 - OBJ
      ?auto_105955 - OBJ
      ?auto_105956 - OBJ
      ?auto_105957 - OBJ
      ?auto_105953 - LOCATION
    )
    :vars
    (
      ?auto_105958 - LOCATION
      ?auto_105962 - CITY
      ?auto_105961 - LOCATION
      ?auto_105959 - LOCATION
      ?auto_105963 - LOCATION
      ?auto_105960 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105958 ?auto_105962 ) ( IN-CITY ?auto_105953 ?auto_105962 ) ( not ( = ?auto_105953 ?auto_105958 ) ) ( OBJ-AT ?auto_105957 ?auto_105958 ) ( IN-CITY ?auto_105961 ?auto_105962 ) ( not ( = ?auto_105953 ?auto_105961 ) ) ( OBJ-AT ?auto_105955 ?auto_105961 ) ( IN-CITY ?auto_105959 ?auto_105962 ) ( not ( = ?auto_105953 ?auto_105959 ) ) ( OBJ-AT ?auto_105954 ?auto_105959 ) ( IN-CITY ?auto_105963 ?auto_105962 ) ( not ( = ?auto_105953 ?auto_105963 ) ) ( OBJ-AT ?auto_105956 ?auto_105963 ) ( TRUCK-AT ?auto_105960 ?auto_105953 ) ( not ( = ?auto_105956 ?auto_105954 ) ) ( not ( = ?auto_105959 ?auto_105963 ) ) ( not ( = ?auto_105956 ?auto_105955 ) ) ( not ( = ?auto_105954 ?auto_105955 ) ) ( not ( = ?auto_105961 ?auto_105959 ) ) ( not ( = ?auto_105961 ?auto_105963 ) ) ( not ( = ?auto_105956 ?auto_105957 ) ) ( not ( = ?auto_105954 ?auto_105957 ) ) ( not ( = ?auto_105955 ?auto_105957 ) ) ( not ( = ?auto_105958 ?auto_105961 ) ) ( not ( = ?auto_105958 ?auto_105959 ) ) ( not ( = ?auto_105958 ?auto_105963 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105956 ?auto_105954 ?auto_105957 ?auto_105955 ?auto_105953 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_105989 - OBJ
      ?auto_105990 - OBJ
      ?auto_105991 - OBJ
      ?auto_105992 - OBJ
      ?auto_105988 - LOCATION
    )
    :vars
    (
      ?auto_105993 - LOCATION
      ?auto_105997 - CITY
      ?auto_105996 - LOCATION
      ?auto_105994 - LOCATION
      ?auto_105998 - LOCATION
      ?auto_105995 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105993 ?auto_105997 ) ( IN-CITY ?auto_105988 ?auto_105997 ) ( not ( = ?auto_105988 ?auto_105993 ) ) ( OBJ-AT ?auto_105991 ?auto_105993 ) ( IN-CITY ?auto_105996 ?auto_105997 ) ( not ( = ?auto_105988 ?auto_105996 ) ) ( OBJ-AT ?auto_105990 ?auto_105996 ) ( IN-CITY ?auto_105994 ?auto_105997 ) ( not ( = ?auto_105988 ?auto_105994 ) ) ( OBJ-AT ?auto_105989 ?auto_105994 ) ( IN-CITY ?auto_105998 ?auto_105997 ) ( not ( = ?auto_105988 ?auto_105998 ) ) ( OBJ-AT ?auto_105992 ?auto_105998 ) ( TRUCK-AT ?auto_105995 ?auto_105988 ) ( not ( = ?auto_105992 ?auto_105989 ) ) ( not ( = ?auto_105994 ?auto_105998 ) ) ( not ( = ?auto_105992 ?auto_105990 ) ) ( not ( = ?auto_105989 ?auto_105990 ) ) ( not ( = ?auto_105996 ?auto_105994 ) ) ( not ( = ?auto_105996 ?auto_105998 ) ) ( not ( = ?auto_105992 ?auto_105991 ) ) ( not ( = ?auto_105989 ?auto_105991 ) ) ( not ( = ?auto_105990 ?auto_105991 ) ) ( not ( = ?auto_105993 ?auto_105996 ) ) ( not ( = ?auto_105993 ?auto_105994 ) ) ( not ( = ?auto_105993 ?auto_105998 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_105992 ?auto_105989 ?auto_105991 ?auto_105990 ?auto_105988 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106060 - OBJ
      ?auto_106061 - OBJ
      ?auto_106062 - OBJ
      ?auto_106063 - OBJ
      ?auto_106059 - LOCATION
    )
    :vars
    (
      ?auto_106064 - LOCATION
      ?auto_106068 - CITY
      ?auto_106067 - LOCATION
      ?auto_106065 - LOCATION
      ?auto_106069 - LOCATION
      ?auto_106066 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106064 ?auto_106068 ) ( IN-CITY ?auto_106059 ?auto_106068 ) ( not ( = ?auto_106059 ?auto_106064 ) ) ( OBJ-AT ?auto_106061 ?auto_106064 ) ( IN-CITY ?auto_106067 ?auto_106068 ) ( not ( = ?auto_106059 ?auto_106067 ) ) ( OBJ-AT ?auto_106063 ?auto_106067 ) ( IN-CITY ?auto_106065 ?auto_106068 ) ( not ( = ?auto_106059 ?auto_106065 ) ) ( OBJ-AT ?auto_106060 ?auto_106065 ) ( IN-CITY ?auto_106069 ?auto_106068 ) ( not ( = ?auto_106059 ?auto_106069 ) ) ( OBJ-AT ?auto_106062 ?auto_106069 ) ( TRUCK-AT ?auto_106066 ?auto_106059 ) ( not ( = ?auto_106062 ?auto_106060 ) ) ( not ( = ?auto_106065 ?auto_106069 ) ) ( not ( = ?auto_106062 ?auto_106063 ) ) ( not ( = ?auto_106060 ?auto_106063 ) ) ( not ( = ?auto_106067 ?auto_106065 ) ) ( not ( = ?auto_106067 ?auto_106069 ) ) ( not ( = ?auto_106062 ?auto_106061 ) ) ( not ( = ?auto_106060 ?auto_106061 ) ) ( not ( = ?auto_106063 ?auto_106061 ) ) ( not ( = ?auto_106064 ?auto_106067 ) ) ( not ( = ?auto_106064 ?auto_106065 ) ) ( not ( = ?auto_106064 ?auto_106069 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106062 ?auto_106060 ?auto_106061 ?auto_106063 ?auto_106059 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106133 - OBJ
      ?auto_106134 - OBJ
      ?auto_106135 - OBJ
      ?auto_106136 - OBJ
      ?auto_106132 - LOCATION
    )
    :vars
    (
      ?auto_106137 - LOCATION
      ?auto_106141 - CITY
      ?auto_106140 - LOCATION
      ?auto_106138 - LOCATION
      ?auto_106142 - LOCATION
      ?auto_106139 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106137 ?auto_106141 ) ( IN-CITY ?auto_106132 ?auto_106141 ) ( not ( = ?auto_106132 ?auto_106137 ) ) ( OBJ-AT ?auto_106134 ?auto_106137 ) ( IN-CITY ?auto_106140 ?auto_106141 ) ( not ( = ?auto_106132 ?auto_106140 ) ) ( OBJ-AT ?auto_106135 ?auto_106140 ) ( IN-CITY ?auto_106138 ?auto_106141 ) ( not ( = ?auto_106132 ?auto_106138 ) ) ( OBJ-AT ?auto_106133 ?auto_106138 ) ( IN-CITY ?auto_106142 ?auto_106141 ) ( not ( = ?auto_106132 ?auto_106142 ) ) ( OBJ-AT ?auto_106136 ?auto_106142 ) ( TRUCK-AT ?auto_106139 ?auto_106132 ) ( not ( = ?auto_106136 ?auto_106133 ) ) ( not ( = ?auto_106138 ?auto_106142 ) ) ( not ( = ?auto_106136 ?auto_106135 ) ) ( not ( = ?auto_106133 ?auto_106135 ) ) ( not ( = ?auto_106140 ?auto_106138 ) ) ( not ( = ?auto_106140 ?auto_106142 ) ) ( not ( = ?auto_106136 ?auto_106134 ) ) ( not ( = ?auto_106133 ?auto_106134 ) ) ( not ( = ?auto_106135 ?auto_106134 ) ) ( not ( = ?auto_106137 ?auto_106140 ) ) ( not ( = ?auto_106137 ?auto_106138 ) ) ( not ( = ?auto_106137 ?auto_106142 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106136 ?auto_106133 ?auto_106134 ?auto_106135 ?auto_106132 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106242 - OBJ
      ?auto_106243 - OBJ
      ?auto_106244 - OBJ
      ?auto_106245 - OBJ
      ?auto_106241 - LOCATION
    )
    :vars
    (
      ?auto_106246 - LOCATION
      ?auto_106250 - CITY
      ?auto_106249 - LOCATION
      ?auto_106247 - LOCATION
      ?auto_106251 - LOCATION
      ?auto_106248 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106246 ?auto_106250 ) ( IN-CITY ?auto_106241 ?auto_106250 ) ( not ( = ?auto_106241 ?auto_106246 ) ) ( OBJ-AT ?auto_106245 ?auto_106246 ) ( IN-CITY ?auto_106249 ?auto_106250 ) ( not ( = ?auto_106241 ?auto_106249 ) ) ( OBJ-AT ?auto_106242 ?auto_106249 ) ( IN-CITY ?auto_106247 ?auto_106250 ) ( not ( = ?auto_106241 ?auto_106247 ) ) ( OBJ-AT ?auto_106244 ?auto_106247 ) ( IN-CITY ?auto_106251 ?auto_106250 ) ( not ( = ?auto_106241 ?auto_106251 ) ) ( OBJ-AT ?auto_106243 ?auto_106251 ) ( TRUCK-AT ?auto_106248 ?auto_106241 ) ( not ( = ?auto_106243 ?auto_106244 ) ) ( not ( = ?auto_106247 ?auto_106251 ) ) ( not ( = ?auto_106243 ?auto_106242 ) ) ( not ( = ?auto_106244 ?auto_106242 ) ) ( not ( = ?auto_106249 ?auto_106247 ) ) ( not ( = ?auto_106249 ?auto_106251 ) ) ( not ( = ?auto_106243 ?auto_106245 ) ) ( not ( = ?auto_106244 ?auto_106245 ) ) ( not ( = ?auto_106242 ?auto_106245 ) ) ( not ( = ?auto_106246 ?auto_106249 ) ) ( not ( = ?auto_106246 ?auto_106247 ) ) ( not ( = ?auto_106246 ?auto_106251 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106243 ?auto_106244 ?auto_106245 ?auto_106242 ?auto_106241 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106277 - OBJ
      ?auto_106278 - OBJ
      ?auto_106279 - OBJ
      ?auto_106280 - OBJ
      ?auto_106276 - LOCATION
    )
    :vars
    (
      ?auto_106281 - LOCATION
      ?auto_106285 - CITY
      ?auto_106284 - LOCATION
      ?auto_106282 - LOCATION
      ?auto_106286 - LOCATION
      ?auto_106283 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106281 ?auto_106285 ) ( IN-CITY ?auto_106276 ?auto_106285 ) ( not ( = ?auto_106276 ?auto_106281 ) ) ( OBJ-AT ?auto_106279 ?auto_106281 ) ( IN-CITY ?auto_106284 ?auto_106285 ) ( not ( = ?auto_106276 ?auto_106284 ) ) ( OBJ-AT ?auto_106277 ?auto_106284 ) ( IN-CITY ?auto_106282 ?auto_106285 ) ( not ( = ?auto_106276 ?auto_106282 ) ) ( OBJ-AT ?auto_106280 ?auto_106282 ) ( IN-CITY ?auto_106286 ?auto_106285 ) ( not ( = ?auto_106276 ?auto_106286 ) ) ( OBJ-AT ?auto_106278 ?auto_106286 ) ( TRUCK-AT ?auto_106283 ?auto_106276 ) ( not ( = ?auto_106278 ?auto_106280 ) ) ( not ( = ?auto_106282 ?auto_106286 ) ) ( not ( = ?auto_106278 ?auto_106277 ) ) ( not ( = ?auto_106280 ?auto_106277 ) ) ( not ( = ?auto_106284 ?auto_106282 ) ) ( not ( = ?auto_106284 ?auto_106286 ) ) ( not ( = ?auto_106278 ?auto_106279 ) ) ( not ( = ?auto_106280 ?auto_106279 ) ) ( not ( = ?auto_106277 ?auto_106279 ) ) ( not ( = ?auto_106281 ?auto_106284 ) ) ( not ( = ?auto_106281 ?auto_106282 ) ) ( not ( = ?auto_106281 ?auto_106286 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106278 ?auto_106280 ?auto_106279 ?auto_106277 ?auto_106276 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106312 - OBJ
      ?auto_106313 - OBJ
      ?auto_106314 - OBJ
      ?auto_106315 - OBJ
      ?auto_106311 - LOCATION
    )
    :vars
    (
      ?auto_106316 - LOCATION
      ?auto_106320 - CITY
      ?auto_106319 - LOCATION
      ?auto_106317 - LOCATION
      ?auto_106321 - LOCATION
      ?auto_106318 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106316 ?auto_106320 ) ( IN-CITY ?auto_106311 ?auto_106320 ) ( not ( = ?auto_106311 ?auto_106316 ) ) ( OBJ-AT ?auto_106315 ?auto_106316 ) ( IN-CITY ?auto_106319 ?auto_106320 ) ( not ( = ?auto_106311 ?auto_106319 ) ) ( OBJ-AT ?auto_106312 ?auto_106319 ) ( IN-CITY ?auto_106317 ?auto_106320 ) ( not ( = ?auto_106311 ?auto_106317 ) ) ( OBJ-AT ?auto_106313 ?auto_106317 ) ( IN-CITY ?auto_106321 ?auto_106320 ) ( not ( = ?auto_106311 ?auto_106321 ) ) ( OBJ-AT ?auto_106314 ?auto_106321 ) ( TRUCK-AT ?auto_106318 ?auto_106311 ) ( not ( = ?auto_106314 ?auto_106313 ) ) ( not ( = ?auto_106317 ?auto_106321 ) ) ( not ( = ?auto_106314 ?auto_106312 ) ) ( not ( = ?auto_106313 ?auto_106312 ) ) ( not ( = ?auto_106319 ?auto_106317 ) ) ( not ( = ?auto_106319 ?auto_106321 ) ) ( not ( = ?auto_106314 ?auto_106315 ) ) ( not ( = ?auto_106313 ?auto_106315 ) ) ( not ( = ?auto_106312 ?auto_106315 ) ) ( not ( = ?auto_106316 ?auto_106319 ) ) ( not ( = ?auto_106316 ?auto_106317 ) ) ( not ( = ?auto_106316 ?auto_106321 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106314 ?auto_106313 ?auto_106315 ?auto_106312 ?auto_106311 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106347 - OBJ
      ?auto_106348 - OBJ
      ?auto_106349 - OBJ
      ?auto_106350 - OBJ
      ?auto_106346 - LOCATION
    )
    :vars
    (
      ?auto_106351 - LOCATION
      ?auto_106355 - CITY
      ?auto_106354 - LOCATION
      ?auto_106352 - LOCATION
      ?auto_106356 - LOCATION
      ?auto_106353 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106351 ?auto_106355 ) ( IN-CITY ?auto_106346 ?auto_106355 ) ( not ( = ?auto_106346 ?auto_106351 ) ) ( OBJ-AT ?auto_106349 ?auto_106351 ) ( IN-CITY ?auto_106354 ?auto_106355 ) ( not ( = ?auto_106346 ?auto_106354 ) ) ( OBJ-AT ?auto_106347 ?auto_106354 ) ( IN-CITY ?auto_106352 ?auto_106355 ) ( not ( = ?auto_106346 ?auto_106352 ) ) ( OBJ-AT ?auto_106348 ?auto_106352 ) ( IN-CITY ?auto_106356 ?auto_106355 ) ( not ( = ?auto_106346 ?auto_106356 ) ) ( OBJ-AT ?auto_106350 ?auto_106356 ) ( TRUCK-AT ?auto_106353 ?auto_106346 ) ( not ( = ?auto_106350 ?auto_106348 ) ) ( not ( = ?auto_106352 ?auto_106356 ) ) ( not ( = ?auto_106350 ?auto_106347 ) ) ( not ( = ?auto_106348 ?auto_106347 ) ) ( not ( = ?auto_106354 ?auto_106352 ) ) ( not ( = ?auto_106354 ?auto_106356 ) ) ( not ( = ?auto_106350 ?auto_106349 ) ) ( not ( = ?auto_106348 ?auto_106349 ) ) ( not ( = ?auto_106347 ?auto_106349 ) ) ( not ( = ?auto_106351 ?auto_106354 ) ) ( not ( = ?auto_106351 ?auto_106352 ) ) ( not ( = ?auto_106351 ?auto_106356 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106350 ?auto_106348 ?auto_106349 ?auto_106347 ?auto_106346 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106493 - OBJ
      ?auto_106494 - OBJ
      ?auto_106495 - OBJ
      ?auto_106496 - OBJ
      ?auto_106492 - LOCATION
    )
    :vars
    (
      ?auto_106497 - LOCATION
      ?auto_106501 - CITY
      ?auto_106500 - LOCATION
      ?auto_106498 - LOCATION
      ?auto_106502 - LOCATION
      ?auto_106499 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106497 ?auto_106501 ) ( IN-CITY ?auto_106492 ?auto_106501 ) ( not ( = ?auto_106492 ?auto_106497 ) ) ( OBJ-AT ?auto_106494 ?auto_106497 ) ( IN-CITY ?auto_106500 ?auto_106501 ) ( not ( = ?auto_106492 ?auto_106500 ) ) ( OBJ-AT ?auto_106493 ?auto_106500 ) ( IN-CITY ?auto_106498 ?auto_106501 ) ( not ( = ?auto_106492 ?auto_106498 ) ) ( OBJ-AT ?auto_106496 ?auto_106498 ) ( IN-CITY ?auto_106502 ?auto_106501 ) ( not ( = ?auto_106492 ?auto_106502 ) ) ( OBJ-AT ?auto_106495 ?auto_106502 ) ( TRUCK-AT ?auto_106499 ?auto_106492 ) ( not ( = ?auto_106495 ?auto_106496 ) ) ( not ( = ?auto_106498 ?auto_106502 ) ) ( not ( = ?auto_106495 ?auto_106493 ) ) ( not ( = ?auto_106496 ?auto_106493 ) ) ( not ( = ?auto_106500 ?auto_106498 ) ) ( not ( = ?auto_106500 ?auto_106502 ) ) ( not ( = ?auto_106495 ?auto_106494 ) ) ( not ( = ?auto_106496 ?auto_106494 ) ) ( not ( = ?auto_106493 ?auto_106494 ) ) ( not ( = ?auto_106497 ?auto_106500 ) ) ( not ( = ?auto_106497 ?auto_106498 ) ) ( not ( = ?auto_106497 ?auto_106502 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106495 ?auto_106496 ?auto_106494 ?auto_106493 ?auto_106492 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106528 - OBJ
      ?auto_106529 - OBJ
      ?auto_106530 - OBJ
      ?auto_106531 - OBJ
      ?auto_106527 - LOCATION
    )
    :vars
    (
      ?auto_106532 - LOCATION
      ?auto_106536 - CITY
      ?auto_106535 - LOCATION
      ?auto_106533 - LOCATION
      ?auto_106537 - LOCATION
      ?auto_106534 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106532 ?auto_106536 ) ( IN-CITY ?auto_106527 ?auto_106536 ) ( not ( = ?auto_106527 ?auto_106532 ) ) ( OBJ-AT ?auto_106529 ?auto_106532 ) ( IN-CITY ?auto_106535 ?auto_106536 ) ( not ( = ?auto_106527 ?auto_106535 ) ) ( OBJ-AT ?auto_106528 ?auto_106535 ) ( IN-CITY ?auto_106533 ?auto_106536 ) ( not ( = ?auto_106527 ?auto_106533 ) ) ( OBJ-AT ?auto_106530 ?auto_106533 ) ( IN-CITY ?auto_106537 ?auto_106536 ) ( not ( = ?auto_106527 ?auto_106537 ) ) ( OBJ-AT ?auto_106531 ?auto_106537 ) ( TRUCK-AT ?auto_106534 ?auto_106527 ) ( not ( = ?auto_106531 ?auto_106530 ) ) ( not ( = ?auto_106533 ?auto_106537 ) ) ( not ( = ?auto_106531 ?auto_106528 ) ) ( not ( = ?auto_106530 ?auto_106528 ) ) ( not ( = ?auto_106535 ?auto_106533 ) ) ( not ( = ?auto_106535 ?auto_106537 ) ) ( not ( = ?auto_106531 ?auto_106529 ) ) ( not ( = ?auto_106530 ?auto_106529 ) ) ( not ( = ?auto_106528 ?auto_106529 ) ) ( not ( = ?auto_106532 ?auto_106535 ) ) ( not ( = ?auto_106532 ?auto_106533 ) ) ( not ( = ?auto_106532 ?auto_106537 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106531 ?auto_106530 ?auto_106529 ?auto_106528 ?auto_106527 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106749 - OBJ
      ?auto_106750 - OBJ
      ?auto_106751 - OBJ
      ?auto_106752 - OBJ
      ?auto_106748 - LOCATION
    )
    :vars
    (
      ?auto_106753 - LOCATION
      ?auto_106757 - CITY
      ?auto_106756 - LOCATION
      ?auto_106754 - LOCATION
      ?auto_106758 - LOCATION
      ?auto_106755 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106753 ?auto_106757 ) ( IN-CITY ?auto_106748 ?auto_106757 ) ( not ( = ?auto_106748 ?auto_106753 ) ) ( OBJ-AT ?auto_106749 ?auto_106753 ) ( IN-CITY ?auto_106756 ?auto_106757 ) ( not ( = ?auto_106748 ?auto_106756 ) ) ( OBJ-AT ?auto_106752 ?auto_106756 ) ( IN-CITY ?auto_106754 ?auto_106757 ) ( not ( = ?auto_106748 ?auto_106754 ) ) ( OBJ-AT ?auto_106751 ?auto_106754 ) ( IN-CITY ?auto_106758 ?auto_106757 ) ( not ( = ?auto_106748 ?auto_106758 ) ) ( OBJ-AT ?auto_106750 ?auto_106758 ) ( TRUCK-AT ?auto_106755 ?auto_106748 ) ( not ( = ?auto_106750 ?auto_106751 ) ) ( not ( = ?auto_106754 ?auto_106758 ) ) ( not ( = ?auto_106750 ?auto_106752 ) ) ( not ( = ?auto_106751 ?auto_106752 ) ) ( not ( = ?auto_106756 ?auto_106754 ) ) ( not ( = ?auto_106756 ?auto_106758 ) ) ( not ( = ?auto_106750 ?auto_106749 ) ) ( not ( = ?auto_106751 ?auto_106749 ) ) ( not ( = ?auto_106752 ?auto_106749 ) ) ( not ( = ?auto_106753 ?auto_106756 ) ) ( not ( = ?auto_106753 ?auto_106754 ) ) ( not ( = ?auto_106753 ?auto_106758 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106750 ?auto_106751 ?auto_106749 ?auto_106752 ?auto_106748 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106784 - OBJ
      ?auto_106785 - OBJ
      ?auto_106786 - OBJ
      ?auto_106787 - OBJ
      ?auto_106783 - LOCATION
    )
    :vars
    (
      ?auto_106788 - LOCATION
      ?auto_106792 - CITY
      ?auto_106791 - LOCATION
      ?auto_106789 - LOCATION
      ?auto_106793 - LOCATION
      ?auto_106790 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106788 ?auto_106792 ) ( IN-CITY ?auto_106783 ?auto_106792 ) ( not ( = ?auto_106783 ?auto_106788 ) ) ( OBJ-AT ?auto_106784 ?auto_106788 ) ( IN-CITY ?auto_106791 ?auto_106792 ) ( not ( = ?auto_106783 ?auto_106791 ) ) ( OBJ-AT ?auto_106786 ?auto_106791 ) ( IN-CITY ?auto_106789 ?auto_106792 ) ( not ( = ?auto_106783 ?auto_106789 ) ) ( OBJ-AT ?auto_106787 ?auto_106789 ) ( IN-CITY ?auto_106793 ?auto_106792 ) ( not ( = ?auto_106783 ?auto_106793 ) ) ( OBJ-AT ?auto_106785 ?auto_106793 ) ( TRUCK-AT ?auto_106790 ?auto_106783 ) ( not ( = ?auto_106785 ?auto_106787 ) ) ( not ( = ?auto_106789 ?auto_106793 ) ) ( not ( = ?auto_106785 ?auto_106786 ) ) ( not ( = ?auto_106787 ?auto_106786 ) ) ( not ( = ?auto_106791 ?auto_106789 ) ) ( not ( = ?auto_106791 ?auto_106793 ) ) ( not ( = ?auto_106785 ?auto_106784 ) ) ( not ( = ?auto_106787 ?auto_106784 ) ) ( not ( = ?auto_106786 ?auto_106784 ) ) ( not ( = ?auto_106788 ?auto_106791 ) ) ( not ( = ?auto_106788 ?auto_106789 ) ) ( not ( = ?auto_106788 ?auto_106793 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106785 ?auto_106787 ?auto_106784 ?auto_106786 ?auto_106783 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106893 - OBJ
      ?auto_106894 - OBJ
      ?auto_106895 - OBJ
      ?auto_106896 - OBJ
      ?auto_106892 - LOCATION
    )
    :vars
    (
      ?auto_106897 - LOCATION
      ?auto_106901 - CITY
      ?auto_106900 - LOCATION
      ?auto_106898 - LOCATION
      ?auto_106902 - LOCATION
      ?auto_106899 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106897 ?auto_106901 ) ( IN-CITY ?auto_106892 ?auto_106901 ) ( not ( = ?auto_106892 ?auto_106897 ) ) ( OBJ-AT ?auto_106893 ?auto_106897 ) ( IN-CITY ?auto_106900 ?auto_106901 ) ( not ( = ?auto_106892 ?auto_106900 ) ) ( OBJ-AT ?auto_106896 ?auto_106900 ) ( IN-CITY ?auto_106898 ?auto_106901 ) ( not ( = ?auto_106892 ?auto_106898 ) ) ( OBJ-AT ?auto_106894 ?auto_106898 ) ( IN-CITY ?auto_106902 ?auto_106901 ) ( not ( = ?auto_106892 ?auto_106902 ) ) ( OBJ-AT ?auto_106895 ?auto_106902 ) ( TRUCK-AT ?auto_106899 ?auto_106892 ) ( not ( = ?auto_106895 ?auto_106894 ) ) ( not ( = ?auto_106898 ?auto_106902 ) ) ( not ( = ?auto_106895 ?auto_106896 ) ) ( not ( = ?auto_106894 ?auto_106896 ) ) ( not ( = ?auto_106900 ?auto_106898 ) ) ( not ( = ?auto_106900 ?auto_106902 ) ) ( not ( = ?auto_106895 ?auto_106893 ) ) ( not ( = ?auto_106894 ?auto_106893 ) ) ( not ( = ?auto_106896 ?auto_106893 ) ) ( not ( = ?auto_106897 ?auto_106900 ) ) ( not ( = ?auto_106897 ?auto_106898 ) ) ( not ( = ?auto_106897 ?auto_106902 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106895 ?auto_106894 ?auto_106893 ?auto_106896 ?auto_106892 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106966 - OBJ
      ?auto_106967 - OBJ
      ?auto_106968 - OBJ
      ?auto_106969 - OBJ
      ?auto_106965 - LOCATION
    )
    :vars
    (
      ?auto_106970 - LOCATION
      ?auto_106974 - CITY
      ?auto_106973 - LOCATION
      ?auto_106971 - LOCATION
      ?auto_106975 - LOCATION
      ?auto_106972 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106970 ?auto_106974 ) ( IN-CITY ?auto_106965 ?auto_106974 ) ( not ( = ?auto_106965 ?auto_106970 ) ) ( OBJ-AT ?auto_106966 ?auto_106970 ) ( IN-CITY ?auto_106973 ?auto_106974 ) ( not ( = ?auto_106965 ?auto_106973 ) ) ( OBJ-AT ?auto_106968 ?auto_106973 ) ( IN-CITY ?auto_106971 ?auto_106974 ) ( not ( = ?auto_106965 ?auto_106971 ) ) ( OBJ-AT ?auto_106967 ?auto_106971 ) ( IN-CITY ?auto_106975 ?auto_106974 ) ( not ( = ?auto_106965 ?auto_106975 ) ) ( OBJ-AT ?auto_106969 ?auto_106975 ) ( TRUCK-AT ?auto_106972 ?auto_106965 ) ( not ( = ?auto_106969 ?auto_106967 ) ) ( not ( = ?auto_106971 ?auto_106975 ) ) ( not ( = ?auto_106969 ?auto_106968 ) ) ( not ( = ?auto_106967 ?auto_106968 ) ) ( not ( = ?auto_106973 ?auto_106971 ) ) ( not ( = ?auto_106973 ?auto_106975 ) ) ( not ( = ?auto_106969 ?auto_106966 ) ) ( not ( = ?auto_106967 ?auto_106966 ) ) ( not ( = ?auto_106968 ?auto_106966 ) ) ( not ( = ?auto_106970 ?auto_106973 ) ) ( not ( = ?auto_106970 ?auto_106971 ) ) ( not ( = ?auto_106970 ?auto_106975 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106969 ?auto_106967 ?auto_106966 ?auto_106968 ?auto_106965 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_107075 - OBJ
      ?auto_107076 - OBJ
      ?auto_107077 - OBJ
      ?auto_107078 - OBJ
      ?auto_107074 - LOCATION
    )
    :vars
    (
      ?auto_107079 - LOCATION
      ?auto_107083 - CITY
      ?auto_107082 - LOCATION
      ?auto_107080 - LOCATION
      ?auto_107084 - LOCATION
      ?auto_107081 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_107079 ?auto_107083 ) ( IN-CITY ?auto_107074 ?auto_107083 ) ( not ( = ?auto_107074 ?auto_107079 ) ) ( OBJ-AT ?auto_107075 ?auto_107079 ) ( IN-CITY ?auto_107082 ?auto_107083 ) ( not ( = ?auto_107074 ?auto_107082 ) ) ( OBJ-AT ?auto_107076 ?auto_107082 ) ( IN-CITY ?auto_107080 ?auto_107083 ) ( not ( = ?auto_107074 ?auto_107080 ) ) ( OBJ-AT ?auto_107078 ?auto_107080 ) ( IN-CITY ?auto_107084 ?auto_107083 ) ( not ( = ?auto_107074 ?auto_107084 ) ) ( OBJ-AT ?auto_107077 ?auto_107084 ) ( TRUCK-AT ?auto_107081 ?auto_107074 ) ( not ( = ?auto_107077 ?auto_107078 ) ) ( not ( = ?auto_107080 ?auto_107084 ) ) ( not ( = ?auto_107077 ?auto_107076 ) ) ( not ( = ?auto_107078 ?auto_107076 ) ) ( not ( = ?auto_107082 ?auto_107080 ) ) ( not ( = ?auto_107082 ?auto_107084 ) ) ( not ( = ?auto_107077 ?auto_107075 ) ) ( not ( = ?auto_107078 ?auto_107075 ) ) ( not ( = ?auto_107076 ?auto_107075 ) ) ( not ( = ?auto_107079 ?auto_107082 ) ) ( not ( = ?auto_107079 ?auto_107080 ) ) ( not ( = ?auto_107079 ?auto_107084 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_107077 ?auto_107078 ?auto_107075 ?auto_107076 ?auto_107074 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_107110 - OBJ
      ?auto_107111 - OBJ
      ?auto_107112 - OBJ
      ?auto_107113 - OBJ
      ?auto_107109 - LOCATION
    )
    :vars
    (
      ?auto_107114 - LOCATION
      ?auto_107118 - CITY
      ?auto_107117 - LOCATION
      ?auto_107115 - LOCATION
      ?auto_107119 - LOCATION
      ?auto_107116 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_107114 ?auto_107118 ) ( IN-CITY ?auto_107109 ?auto_107118 ) ( not ( = ?auto_107109 ?auto_107114 ) ) ( OBJ-AT ?auto_107110 ?auto_107114 ) ( IN-CITY ?auto_107117 ?auto_107118 ) ( not ( = ?auto_107109 ?auto_107117 ) ) ( OBJ-AT ?auto_107111 ?auto_107117 ) ( IN-CITY ?auto_107115 ?auto_107118 ) ( not ( = ?auto_107109 ?auto_107115 ) ) ( OBJ-AT ?auto_107112 ?auto_107115 ) ( IN-CITY ?auto_107119 ?auto_107118 ) ( not ( = ?auto_107109 ?auto_107119 ) ) ( OBJ-AT ?auto_107113 ?auto_107119 ) ( TRUCK-AT ?auto_107116 ?auto_107109 ) ( not ( = ?auto_107113 ?auto_107112 ) ) ( not ( = ?auto_107115 ?auto_107119 ) ) ( not ( = ?auto_107113 ?auto_107111 ) ) ( not ( = ?auto_107112 ?auto_107111 ) ) ( not ( = ?auto_107117 ?auto_107115 ) ) ( not ( = ?auto_107117 ?auto_107119 ) ) ( not ( = ?auto_107113 ?auto_107110 ) ) ( not ( = ?auto_107112 ?auto_107110 ) ) ( not ( = ?auto_107111 ?auto_107110 ) ) ( not ( = ?auto_107114 ?auto_107117 ) ) ( not ( = ?auto_107114 ?auto_107115 ) ) ( not ( = ?auto_107114 ?auto_107119 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_107113 ?auto_107112 ?auto_107110 ?auto_107111 ?auto_107109 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_107462 - OBJ
      ?auto_107461 - LOCATION
    )
    :vars
    (
      ?auto_107464 - LOCATION
      ?auto_107465 - CITY
      ?auto_107463 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_107464 ?auto_107465 ) ( IN-CITY ?auto_107461 ?auto_107465 ) ( not ( = ?auto_107461 ?auto_107464 ) ) ( OBJ-AT ?auto_107462 ?auto_107464 ) ( TRUCK-AT ?auto_107463 ?auto_107461 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_107463 ?auto_107461 ?auto_107464 ?auto_107465 )
      ( !LOAD-TRUCK ?auto_107462 ?auto_107463 ?auto_107464 )
      ( !DRIVE-TRUCK ?auto_107463 ?auto_107464 ?auto_107461 ?auto_107465 )
      ( !UNLOAD-TRUCK ?auto_107462 ?auto_107463 ?auto_107461 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_121281 - OBJ
      ?auto_121282 - OBJ
      ?auto_121283 - OBJ
      ?auto_121284 - OBJ
      ?auto_121285 - OBJ
      ?auto_121280 - LOCATION
    )
    :vars
    (
      ?auto_121286 - LOCATION
      ?auto_121287 - CITY
      ?auto_121289 - LOCATION
      ?auto_121291 - LOCATION
      ?auto_121290 - LOCATION
      ?auto_121292 - LOCATION
      ?auto_121288 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_121286 ?auto_121287 ) ( IN-CITY ?auto_121280 ?auto_121287 ) ( not ( = ?auto_121280 ?auto_121286 ) ) ( OBJ-AT ?auto_121285 ?auto_121286 ) ( IN-CITY ?auto_121289 ?auto_121287 ) ( not ( = ?auto_121280 ?auto_121289 ) ) ( OBJ-AT ?auto_121284 ?auto_121289 ) ( IN-CITY ?auto_121291 ?auto_121287 ) ( not ( = ?auto_121280 ?auto_121291 ) ) ( OBJ-AT ?auto_121283 ?auto_121291 ) ( IN-CITY ?auto_121290 ?auto_121287 ) ( not ( = ?auto_121280 ?auto_121290 ) ) ( OBJ-AT ?auto_121282 ?auto_121290 ) ( IN-CITY ?auto_121292 ?auto_121287 ) ( not ( = ?auto_121280 ?auto_121292 ) ) ( OBJ-AT ?auto_121281 ?auto_121292 ) ( TRUCK-AT ?auto_121288 ?auto_121280 ) ( not ( = ?auto_121281 ?auto_121282 ) ) ( not ( = ?auto_121290 ?auto_121292 ) ) ( not ( = ?auto_121281 ?auto_121283 ) ) ( not ( = ?auto_121282 ?auto_121283 ) ) ( not ( = ?auto_121291 ?auto_121290 ) ) ( not ( = ?auto_121291 ?auto_121292 ) ) ( not ( = ?auto_121281 ?auto_121284 ) ) ( not ( = ?auto_121282 ?auto_121284 ) ) ( not ( = ?auto_121283 ?auto_121284 ) ) ( not ( = ?auto_121289 ?auto_121291 ) ) ( not ( = ?auto_121289 ?auto_121290 ) ) ( not ( = ?auto_121289 ?auto_121292 ) ) ( not ( = ?auto_121281 ?auto_121285 ) ) ( not ( = ?auto_121282 ?auto_121285 ) ) ( not ( = ?auto_121283 ?auto_121285 ) ) ( not ( = ?auto_121284 ?auto_121285 ) ) ( not ( = ?auto_121286 ?auto_121289 ) ) ( not ( = ?auto_121286 ?auto_121291 ) ) ( not ( = ?auto_121286 ?auto_121290 ) ) ( not ( = ?auto_121286 ?auto_121292 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_121281 ?auto_121282 ?auto_121284 ?auto_121283 ?auto_121280 )
      ( DELIVER-1PKG ?auto_121285 ?auto_121280 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_121336 - OBJ
      ?auto_121337 - OBJ
      ?auto_121338 - OBJ
      ?auto_121339 - OBJ
      ?auto_121340 - OBJ
      ?auto_121335 - LOCATION
    )
    :vars
    (
      ?auto_121347 - LOCATION
      ?auto_121346 - CITY
      ?auto_121342 - LOCATION
      ?auto_121345 - LOCATION
      ?auto_121344 - LOCATION
      ?auto_121343 - LOCATION
      ?auto_121341 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_121347 ?auto_121346 ) ( IN-CITY ?auto_121335 ?auto_121346 ) ( not ( = ?auto_121335 ?auto_121347 ) ) ( OBJ-AT ?auto_121339 ?auto_121347 ) ( IN-CITY ?auto_121342 ?auto_121346 ) ( not ( = ?auto_121335 ?auto_121342 ) ) ( OBJ-AT ?auto_121340 ?auto_121342 ) ( IN-CITY ?auto_121345 ?auto_121346 ) ( not ( = ?auto_121335 ?auto_121345 ) ) ( OBJ-AT ?auto_121338 ?auto_121345 ) ( IN-CITY ?auto_121344 ?auto_121346 ) ( not ( = ?auto_121335 ?auto_121344 ) ) ( OBJ-AT ?auto_121337 ?auto_121344 ) ( IN-CITY ?auto_121343 ?auto_121346 ) ( not ( = ?auto_121335 ?auto_121343 ) ) ( OBJ-AT ?auto_121336 ?auto_121343 ) ( TRUCK-AT ?auto_121341 ?auto_121335 ) ( not ( = ?auto_121336 ?auto_121337 ) ) ( not ( = ?auto_121344 ?auto_121343 ) ) ( not ( = ?auto_121336 ?auto_121338 ) ) ( not ( = ?auto_121337 ?auto_121338 ) ) ( not ( = ?auto_121345 ?auto_121344 ) ) ( not ( = ?auto_121345 ?auto_121343 ) ) ( not ( = ?auto_121336 ?auto_121340 ) ) ( not ( = ?auto_121337 ?auto_121340 ) ) ( not ( = ?auto_121338 ?auto_121340 ) ) ( not ( = ?auto_121342 ?auto_121345 ) ) ( not ( = ?auto_121342 ?auto_121344 ) ) ( not ( = ?auto_121342 ?auto_121343 ) ) ( not ( = ?auto_121336 ?auto_121339 ) ) ( not ( = ?auto_121337 ?auto_121339 ) ) ( not ( = ?auto_121338 ?auto_121339 ) ) ( not ( = ?auto_121340 ?auto_121339 ) ) ( not ( = ?auto_121347 ?auto_121342 ) ) ( not ( = ?auto_121347 ?auto_121345 ) ) ( not ( = ?auto_121347 ?auto_121344 ) ) ( not ( = ?auto_121347 ?auto_121343 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_121336 ?auto_121337 ?auto_121338 ?auto_121340 ?auto_121339 ?auto_121335 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_121391 - OBJ
      ?auto_121392 - OBJ
      ?auto_121393 - OBJ
      ?auto_121394 - OBJ
      ?auto_121395 - OBJ
      ?auto_121390 - LOCATION
    )
    :vars
    (
      ?auto_121399 - LOCATION
      ?auto_121398 - CITY
      ?auto_121401 - LOCATION
      ?auto_121400 - LOCATION
      ?auto_121396 - LOCATION
      ?auto_121397 - LOCATION
      ?auto_121402 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_121399 ?auto_121398 ) ( IN-CITY ?auto_121390 ?auto_121398 ) ( not ( = ?auto_121390 ?auto_121399 ) ) ( OBJ-AT ?auto_121395 ?auto_121399 ) ( IN-CITY ?auto_121401 ?auto_121398 ) ( not ( = ?auto_121390 ?auto_121401 ) ) ( OBJ-AT ?auto_121393 ?auto_121401 ) ( IN-CITY ?auto_121400 ?auto_121398 ) ( not ( = ?auto_121390 ?auto_121400 ) ) ( OBJ-AT ?auto_121394 ?auto_121400 ) ( IN-CITY ?auto_121396 ?auto_121398 ) ( not ( = ?auto_121390 ?auto_121396 ) ) ( OBJ-AT ?auto_121392 ?auto_121396 ) ( IN-CITY ?auto_121397 ?auto_121398 ) ( not ( = ?auto_121390 ?auto_121397 ) ) ( OBJ-AT ?auto_121391 ?auto_121397 ) ( TRUCK-AT ?auto_121402 ?auto_121390 ) ( not ( = ?auto_121391 ?auto_121392 ) ) ( not ( = ?auto_121396 ?auto_121397 ) ) ( not ( = ?auto_121391 ?auto_121394 ) ) ( not ( = ?auto_121392 ?auto_121394 ) ) ( not ( = ?auto_121400 ?auto_121396 ) ) ( not ( = ?auto_121400 ?auto_121397 ) ) ( not ( = ?auto_121391 ?auto_121393 ) ) ( not ( = ?auto_121392 ?auto_121393 ) ) ( not ( = ?auto_121394 ?auto_121393 ) ) ( not ( = ?auto_121401 ?auto_121400 ) ) ( not ( = ?auto_121401 ?auto_121396 ) ) ( not ( = ?auto_121401 ?auto_121397 ) ) ( not ( = ?auto_121391 ?auto_121395 ) ) ( not ( = ?auto_121392 ?auto_121395 ) ) ( not ( = ?auto_121394 ?auto_121395 ) ) ( not ( = ?auto_121393 ?auto_121395 ) ) ( not ( = ?auto_121399 ?auto_121401 ) ) ( not ( = ?auto_121399 ?auto_121400 ) ) ( not ( = ?auto_121399 ?auto_121396 ) ) ( not ( = ?auto_121399 ?auto_121397 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_121391 ?auto_121392 ?auto_121394 ?auto_121395 ?auto_121393 ?auto_121390 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_121446 - OBJ
      ?auto_121447 - OBJ
      ?auto_121448 - OBJ
      ?auto_121449 - OBJ
      ?auto_121450 - OBJ
      ?auto_121445 - LOCATION
    )
    :vars
    (
      ?auto_121454 - LOCATION
      ?auto_121453 - CITY
      ?auto_121456 - LOCATION
      ?auto_121455 - LOCATION
      ?auto_121451 - LOCATION
      ?auto_121452 - LOCATION
      ?auto_121457 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_121454 ?auto_121453 ) ( IN-CITY ?auto_121445 ?auto_121453 ) ( not ( = ?auto_121445 ?auto_121454 ) ) ( OBJ-AT ?auto_121449 ?auto_121454 ) ( IN-CITY ?auto_121456 ?auto_121453 ) ( not ( = ?auto_121445 ?auto_121456 ) ) ( OBJ-AT ?auto_121448 ?auto_121456 ) ( IN-CITY ?auto_121455 ?auto_121453 ) ( not ( = ?auto_121445 ?auto_121455 ) ) ( OBJ-AT ?auto_121450 ?auto_121455 ) ( IN-CITY ?auto_121451 ?auto_121453 ) ( not ( = ?auto_121445 ?auto_121451 ) ) ( OBJ-AT ?auto_121447 ?auto_121451 ) ( IN-CITY ?auto_121452 ?auto_121453 ) ( not ( = ?auto_121445 ?auto_121452 ) ) ( OBJ-AT ?auto_121446 ?auto_121452 ) ( TRUCK-AT ?auto_121457 ?auto_121445 ) ( not ( = ?auto_121446 ?auto_121447 ) ) ( not ( = ?auto_121451 ?auto_121452 ) ) ( not ( = ?auto_121446 ?auto_121450 ) ) ( not ( = ?auto_121447 ?auto_121450 ) ) ( not ( = ?auto_121455 ?auto_121451 ) ) ( not ( = ?auto_121455 ?auto_121452 ) ) ( not ( = ?auto_121446 ?auto_121448 ) ) ( not ( = ?auto_121447 ?auto_121448 ) ) ( not ( = ?auto_121450 ?auto_121448 ) ) ( not ( = ?auto_121456 ?auto_121455 ) ) ( not ( = ?auto_121456 ?auto_121451 ) ) ( not ( = ?auto_121456 ?auto_121452 ) ) ( not ( = ?auto_121446 ?auto_121449 ) ) ( not ( = ?auto_121447 ?auto_121449 ) ) ( not ( = ?auto_121450 ?auto_121449 ) ) ( not ( = ?auto_121448 ?auto_121449 ) ) ( not ( = ?auto_121454 ?auto_121456 ) ) ( not ( = ?auto_121454 ?auto_121455 ) ) ( not ( = ?auto_121454 ?auto_121451 ) ) ( not ( = ?auto_121454 ?auto_121452 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_121446 ?auto_121447 ?auto_121450 ?auto_121449 ?auto_121448 ?auto_121445 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_121675 - OBJ
      ?auto_121676 - OBJ
      ?auto_121677 - OBJ
      ?auto_121678 - OBJ
      ?auto_121679 - OBJ
      ?auto_121674 - LOCATION
    )
    :vars
    (
      ?auto_121683 - LOCATION
      ?auto_121682 - CITY
      ?auto_121685 - LOCATION
      ?auto_121684 - LOCATION
      ?auto_121680 - LOCATION
      ?auto_121681 - LOCATION
      ?auto_121686 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_121683 ?auto_121682 ) ( IN-CITY ?auto_121674 ?auto_121682 ) ( not ( = ?auto_121674 ?auto_121683 ) ) ( OBJ-AT ?auto_121677 ?auto_121683 ) ( IN-CITY ?auto_121685 ?auto_121682 ) ( not ( = ?auto_121674 ?auto_121685 ) ) ( OBJ-AT ?auto_121679 ?auto_121685 ) ( IN-CITY ?auto_121684 ?auto_121682 ) ( not ( = ?auto_121674 ?auto_121684 ) ) ( OBJ-AT ?auto_121678 ?auto_121684 ) ( IN-CITY ?auto_121680 ?auto_121682 ) ( not ( = ?auto_121674 ?auto_121680 ) ) ( OBJ-AT ?auto_121676 ?auto_121680 ) ( IN-CITY ?auto_121681 ?auto_121682 ) ( not ( = ?auto_121674 ?auto_121681 ) ) ( OBJ-AT ?auto_121675 ?auto_121681 ) ( TRUCK-AT ?auto_121686 ?auto_121674 ) ( not ( = ?auto_121675 ?auto_121676 ) ) ( not ( = ?auto_121680 ?auto_121681 ) ) ( not ( = ?auto_121675 ?auto_121678 ) ) ( not ( = ?auto_121676 ?auto_121678 ) ) ( not ( = ?auto_121684 ?auto_121680 ) ) ( not ( = ?auto_121684 ?auto_121681 ) ) ( not ( = ?auto_121675 ?auto_121679 ) ) ( not ( = ?auto_121676 ?auto_121679 ) ) ( not ( = ?auto_121678 ?auto_121679 ) ) ( not ( = ?auto_121685 ?auto_121684 ) ) ( not ( = ?auto_121685 ?auto_121680 ) ) ( not ( = ?auto_121685 ?auto_121681 ) ) ( not ( = ?auto_121675 ?auto_121677 ) ) ( not ( = ?auto_121676 ?auto_121677 ) ) ( not ( = ?auto_121678 ?auto_121677 ) ) ( not ( = ?auto_121679 ?auto_121677 ) ) ( not ( = ?auto_121683 ?auto_121685 ) ) ( not ( = ?auto_121683 ?auto_121684 ) ) ( not ( = ?auto_121683 ?auto_121680 ) ) ( not ( = ?auto_121683 ?auto_121681 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_121675 ?auto_121676 ?auto_121678 ?auto_121677 ?auto_121679 ?auto_121674 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_121730 - OBJ
      ?auto_121731 - OBJ
      ?auto_121732 - OBJ
      ?auto_121733 - OBJ
      ?auto_121734 - OBJ
      ?auto_121729 - LOCATION
    )
    :vars
    (
      ?auto_121738 - LOCATION
      ?auto_121737 - CITY
      ?auto_121740 - LOCATION
      ?auto_121739 - LOCATION
      ?auto_121735 - LOCATION
      ?auto_121736 - LOCATION
      ?auto_121741 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_121738 ?auto_121737 ) ( IN-CITY ?auto_121729 ?auto_121737 ) ( not ( = ?auto_121729 ?auto_121738 ) ) ( OBJ-AT ?auto_121732 ?auto_121738 ) ( IN-CITY ?auto_121740 ?auto_121737 ) ( not ( = ?auto_121729 ?auto_121740 ) ) ( OBJ-AT ?auto_121733 ?auto_121740 ) ( IN-CITY ?auto_121739 ?auto_121737 ) ( not ( = ?auto_121729 ?auto_121739 ) ) ( OBJ-AT ?auto_121734 ?auto_121739 ) ( IN-CITY ?auto_121735 ?auto_121737 ) ( not ( = ?auto_121729 ?auto_121735 ) ) ( OBJ-AT ?auto_121731 ?auto_121735 ) ( IN-CITY ?auto_121736 ?auto_121737 ) ( not ( = ?auto_121729 ?auto_121736 ) ) ( OBJ-AT ?auto_121730 ?auto_121736 ) ( TRUCK-AT ?auto_121741 ?auto_121729 ) ( not ( = ?auto_121730 ?auto_121731 ) ) ( not ( = ?auto_121735 ?auto_121736 ) ) ( not ( = ?auto_121730 ?auto_121734 ) ) ( not ( = ?auto_121731 ?auto_121734 ) ) ( not ( = ?auto_121739 ?auto_121735 ) ) ( not ( = ?auto_121739 ?auto_121736 ) ) ( not ( = ?auto_121730 ?auto_121733 ) ) ( not ( = ?auto_121731 ?auto_121733 ) ) ( not ( = ?auto_121734 ?auto_121733 ) ) ( not ( = ?auto_121740 ?auto_121739 ) ) ( not ( = ?auto_121740 ?auto_121735 ) ) ( not ( = ?auto_121740 ?auto_121736 ) ) ( not ( = ?auto_121730 ?auto_121732 ) ) ( not ( = ?auto_121731 ?auto_121732 ) ) ( not ( = ?auto_121734 ?auto_121732 ) ) ( not ( = ?auto_121733 ?auto_121732 ) ) ( not ( = ?auto_121738 ?auto_121740 ) ) ( not ( = ?auto_121738 ?auto_121739 ) ) ( not ( = ?auto_121738 ?auto_121735 ) ) ( not ( = ?auto_121738 ?auto_121736 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_121730 ?auto_121731 ?auto_121734 ?auto_121732 ?auto_121733 ?auto_121729 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122017 - OBJ
      ?auto_122018 - OBJ
      ?auto_122019 - OBJ
      ?auto_122020 - OBJ
      ?auto_122021 - OBJ
      ?auto_122016 - LOCATION
    )
    :vars
    (
      ?auto_122025 - LOCATION
      ?auto_122024 - CITY
      ?auto_122027 - LOCATION
      ?auto_122026 - LOCATION
      ?auto_122022 - LOCATION
      ?auto_122023 - LOCATION
      ?auto_122028 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122025 ?auto_122024 ) ( IN-CITY ?auto_122016 ?auto_122024 ) ( not ( = ?auto_122016 ?auto_122025 ) ) ( OBJ-AT ?auto_122021 ?auto_122025 ) ( IN-CITY ?auto_122027 ?auto_122024 ) ( not ( = ?auto_122016 ?auto_122027 ) ) ( OBJ-AT ?auto_122020 ?auto_122027 ) ( IN-CITY ?auto_122026 ?auto_122024 ) ( not ( = ?auto_122016 ?auto_122026 ) ) ( OBJ-AT ?auto_122018 ?auto_122026 ) ( IN-CITY ?auto_122022 ?auto_122024 ) ( not ( = ?auto_122016 ?auto_122022 ) ) ( OBJ-AT ?auto_122019 ?auto_122022 ) ( IN-CITY ?auto_122023 ?auto_122024 ) ( not ( = ?auto_122016 ?auto_122023 ) ) ( OBJ-AT ?auto_122017 ?auto_122023 ) ( TRUCK-AT ?auto_122028 ?auto_122016 ) ( not ( = ?auto_122017 ?auto_122019 ) ) ( not ( = ?auto_122022 ?auto_122023 ) ) ( not ( = ?auto_122017 ?auto_122018 ) ) ( not ( = ?auto_122019 ?auto_122018 ) ) ( not ( = ?auto_122026 ?auto_122022 ) ) ( not ( = ?auto_122026 ?auto_122023 ) ) ( not ( = ?auto_122017 ?auto_122020 ) ) ( not ( = ?auto_122019 ?auto_122020 ) ) ( not ( = ?auto_122018 ?auto_122020 ) ) ( not ( = ?auto_122027 ?auto_122026 ) ) ( not ( = ?auto_122027 ?auto_122022 ) ) ( not ( = ?auto_122027 ?auto_122023 ) ) ( not ( = ?auto_122017 ?auto_122021 ) ) ( not ( = ?auto_122019 ?auto_122021 ) ) ( not ( = ?auto_122018 ?auto_122021 ) ) ( not ( = ?auto_122020 ?auto_122021 ) ) ( not ( = ?auto_122025 ?auto_122027 ) ) ( not ( = ?auto_122025 ?auto_122026 ) ) ( not ( = ?auto_122025 ?auto_122022 ) ) ( not ( = ?auto_122025 ?auto_122023 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122017 ?auto_122019 ?auto_122018 ?auto_122021 ?auto_122020 ?auto_122016 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122072 - OBJ
      ?auto_122073 - OBJ
      ?auto_122074 - OBJ
      ?auto_122075 - OBJ
      ?auto_122076 - OBJ
      ?auto_122071 - LOCATION
    )
    :vars
    (
      ?auto_122080 - LOCATION
      ?auto_122079 - CITY
      ?auto_122082 - LOCATION
      ?auto_122081 - LOCATION
      ?auto_122077 - LOCATION
      ?auto_122078 - LOCATION
      ?auto_122083 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122080 ?auto_122079 ) ( IN-CITY ?auto_122071 ?auto_122079 ) ( not ( = ?auto_122071 ?auto_122080 ) ) ( OBJ-AT ?auto_122075 ?auto_122080 ) ( IN-CITY ?auto_122082 ?auto_122079 ) ( not ( = ?auto_122071 ?auto_122082 ) ) ( OBJ-AT ?auto_122076 ?auto_122082 ) ( IN-CITY ?auto_122081 ?auto_122079 ) ( not ( = ?auto_122071 ?auto_122081 ) ) ( OBJ-AT ?auto_122073 ?auto_122081 ) ( IN-CITY ?auto_122077 ?auto_122079 ) ( not ( = ?auto_122071 ?auto_122077 ) ) ( OBJ-AT ?auto_122074 ?auto_122077 ) ( IN-CITY ?auto_122078 ?auto_122079 ) ( not ( = ?auto_122071 ?auto_122078 ) ) ( OBJ-AT ?auto_122072 ?auto_122078 ) ( TRUCK-AT ?auto_122083 ?auto_122071 ) ( not ( = ?auto_122072 ?auto_122074 ) ) ( not ( = ?auto_122077 ?auto_122078 ) ) ( not ( = ?auto_122072 ?auto_122073 ) ) ( not ( = ?auto_122074 ?auto_122073 ) ) ( not ( = ?auto_122081 ?auto_122077 ) ) ( not ( = ?auto_122081 ?auto_122078 ) ) ( not ( = ?auto_122072 ?auto_122076 ) ) ( not ( = ?auto_122074 ?auto_122076 ) ) ( not ( = ?auto_122073 ?auto_122076 ) ) ( not ( = ?auto_122082 ?auto_122081 ) ) ( not ( = ?auto_122082 ?auto_122077 ) ) ( not ( = ?auto_122082 ?auto_122078 ) ) ( not ( = ?auto_122072 ?auto_122075 ) ) ( not ( = ?auto_122074 ?auto_122075 ) ) ( not ( = ?auto_122073 ?auto_122075 ) ) ( not ( = ?auto_122076 ?auto_122075 ) ) ( not ( = ?auto_122080 ?auto_122082 ) ) ( not ( = ?auto_122080 ?auto_122081 ) ) ( not ( = ?auto_122080 ?auto_122077 ) ) ( not ( = ?auto_122080 ?auto_122078 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122072 ?auto_122074 ?auto_122073 ?auto_122075 ?auto_122076 ?auto_122071 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122244 - OBJ
      ?auto_122245 - OBJ
      ?auto_122246 - OBJ
      ?auto_122247 - OBJ
      ?auto_122248 - OBJ
      ?auto_122243 - LOCATION
    )
    :vars
    (
      ?auto_122252 - LOCATION
      ?auto_122251 - CITY
      ?auto_122254 - LOCATION
      ?auto_122253 - LOCATION
      ?auto_122249 - LOCATION
      ?auto_122250 - LOCATION
      ?auto_122255 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122252 ?auto_122251 ) ( IN-CITY ?auto_122243 ?auto_122251 ) ( not ( = ?auto_122243 ?auto_122252 ) ) ( OBJ-AT ?auto_122248 ?auto_122252 ) ( IN-CITY ?auto_122254 ?auto_122251 ) ( not ( = ?auto_122243 ?auto_122254 ) ) ( OBJ-AT ?auto_122246 ?auto_122254 ) ( IN-CITY ?auto_122253 ?auto_122251 ) ( not ( = ?auto_122243 ?auto_122253 ) ) ( OBJ-AT ?auto_122245 ?auto_122253 ) ( IN-CITY ?auto_122249 ?auto_122251 ) ( not ( = ?auto_122243 ?auto_122249 ) ) ( OBJ-AT ?auto_122247 ?auto_122249 ) ( IN-CITY ?auto_122250 ?auto_122251 ) ( not ( = ?auto_122243 ?auto_122250 ) ) ( OBJ-AT ?auto_122244 ?auto_122250 ) ( TRUCK-AT ?auto_122255 ?auto_122243 ) ( not ( = ?auto_122244 ?auto_122247 ) ) ( not ( = ?auto_122249 ?auto_122250 ) ) ( not ( = ?auto_122244 ?auto_122245 ) ) ( not ( = ?auto_122247 ?auto_122245 ) ) ( not ( = ?auto_122253 ?auto_122249 ) ) ( not ( = ?auto_122253 ?auto_122250 ) ) ( not ( = ?auto_122244 ?auto_122246 ) ) ( not ( = ?auto_122247 ?auto_122246 ) ) ( not ( = ?auto_122245 ?auto_122246 ) ) ( not ( = ?auto_122254 ?auto_122253 ) ) ( not ( = ?auto_122254 ?auto_122249 ) ) ( not ( = ?auto_122254 ?auto_122250 ) ) ( not ( = ?auto_122244 ?auto_122248 ) ) ( not ( = ?auto_122247 ?auto_122248 ) ) ( not ( = ?auto_122245 ?auto_122248 ) ) ( not ( = ?auto_122246 ?auto_122248 ) ) ( not ( = ?auto_122252 ?auto_122254 ) ) ( not ( = ?auto_122252 ?auto_122253 ) ) ( not ( = ?auto_122252 ?auto_122249 ) ) ( not ( = ?auto_122252 ?auto_122250 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122244 ?auto_122247 ?auto_122245 ?auto_122248 ?auto_122246 ?auto_122243 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122299 - OBJ
      ?auto_122300 - OBJ
      ?auto_122301 - OBJ
      ?auto_122302 - OBJ
      ?auto_122303 - OBJ
      ?auto_122298 - LOCATION
    )
    :vars
    (
      ?auto_122307 - LOCATION
      ?auto_122306 - CITY
      ?auto_122309 - LOCATION
      ?auto_122308 - LOCATION
      ?auto_122304 - LOCATION
      ?auto_122305 - LOCATION
      ?auto_122310 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122307 ?auto_122306 ) ( IN-CITY ?auto_122298 ?auto_122306 ) ( not ( = ?auto_122298 ?auto_122307 ) ) ( OBJ-AT ?auto_122302 ?auto_122307 ) ( IN-CITY ?auto_122309 ?auto_122306 ) ( not ( = ?auto_122298 ?auto_122309 ) ) ( OBJ-AT ?auto_122301 ?auto_122309 ) ( IN-CITY ?auto_122308 ?auto_122306 ) ( not ( = ?auto_122298 ?auto_122308 ) ) ( OBJ-AT ?auto_122300 ?auto_122308 ) ( IN-CITY ?auto_122304 ?auto_122306 ) ( not ( = ?auto_122298 ?auto_122304 ) ) ( OBJ-AT ?auto_122303 ?auto_122304 ) ( IN-CITY ?auto_122305 ?auto_122306 ) ( not ( = ?auto_122298 ?auto_122305 ) ) ( OBJ-AT ?auto_122299 ?auto_122305 ) ( TRUCK-AT ?auto_122310 ?auto_122298 ) ( not ( = ?auto_122299 ?auto_122303 ) ) ( not ( = ?auto_122304 ?auto_122305 ) ) ( not ( = ?auto_122299 ?auto_122300 ) ) ( not ( = ?auto_122303 ?auto_122300 ) ) ( not ( = ?auto_122308 ?auto_122304 ) ) ( not ( = ?auto_122308 ?auto_122305 ) ) ( not ( = ?auto_122299 ?auto_122301 ) ) ( not ( = ?auto_122303 ?auto_122301 ) ) ( not ( = ?auto_122300 ?auto_122301 ) ) ( not ( = ?auto_122309 ?auto_122308 ) ) ( not ( = ?auto_122309 ?auto_122304 ) ) ( not ( = ?auto_122309 ?auto_122305 ) ) ( not ( = ?auto_122299 ?auto_122302 ) ) ( not ( = ?auto_122303 ?auto_122302 ) ) ( not ( = ?auto_122300 ?auto_122302 ) ) ( not ( = ?auto_122301 ?auto_122302 ) ) ( not ( = ?auto_122307 ?auto_122309 ) ) ( not ( = ?auto_122307 ?auto_122308 ) ) ( not ( = ?auto_122307 ?auto_122304 ) ) ( not ( = ?auto_122307 ?auto_122305 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122299 ?auto_122303 ?auto_122300 ?auto_122302 ?auto_122301 ?auto_122298 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122469 - OBJ
      ?auto_122470 - OBJ
      ?auto_122471 - OBJ
      ?auto_122472 - OBJ
      ?auto_122473 - OBJ
      ?auto_122468 - LOCATION
    )
    :vars
    (
      ?auto_122477 - LOCATION
      ?auto_122476 - CITY
      ?auto_122479 - LOCATION
      ?auto_122478 - LOCATION
      ?auto_122474 - LOCATION
      ?auto_122475 - LOCATION
      ?auto_122480 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122477 ?auto_122476 ) ( IN-CITY ?auto_122468 ?auto_122476 ) ( not ( = ?auto_122468 ?auto_122477 ) ) ( OBJ-AT ?auto_122471 ?auto_122477 ) ( IN-CITY ?auto_122479 ?auto_122476 ) ( not ( = ?auto_122468 ?auto_122479 ) ) ( OBJ-AT ?auto_122473 ?auto_122479 ) ( IN-CITY ?auto_122478 ?auto_122476 ) ( not ( = ?auto_122468 ?auto_122478 ) ) ( OBJ-AT ?auto_122470 ?auto_122478 ) ( IN-CITY ?auto_122474 ?auto_122476 ) ( not ( = ?auto_122468 ?auto_122474 ) ) ( OBJ-AT ?auto_122472 ?auto_122474 ) ( IN-CITY ?auto_122475 ?auto_122476 ) ( not ( = ?auto_122468 ?auto_122475 ) ) ( OBJ-AT ?auto_122469 ?auto_122475 ) ( TRUCK-AT ?auto_122480 ?auto_122468 ) ( not ( = ?auto_122469 ?auto_122472 ) ) ( not ( = ?auto_122474 ?auto_122475 ) ) ( not ( = ?auto_122469 ?auto_122470 ) ) ( not ( = ?auto_122472 ?auto_122470 ) ) ( not ( = ?auto_122478 ?auto_122474 ) ) ( not ( = ?auto_122478 ?auto_122475 ) ) ( not ( = ?auto_122469 ?auto_122473 ) ) ( not ( = ?auto_122472 ?auto_122473 ) ) ( not ( = ?auto_122470 ?auto_122473 ) ) ( not ( = ?auto_122479 ?auto_122478 ) ) ( not ( = ?auto_122479 ?auto_122474 ) ) ( not ( = ?auto_122479 ?auto_122475 ) ) ( not ( = ?auto_122469 ?auto_122471 ) ) ( not ( = ?auto_122472 ?auto_122471 ) ) ( not ( = ?auto_122470 ?auto_122471 ) ) ( not ( = ?auto_122473 ?auto_122471 ) ) ( not ( = ?auto_122477 ?auto_122479 ) ) ( not ( = ?auto_122477 ?auto_122478 ) ) ( not ( = ?auto_122477 ?auto_122474 ) ) ( not ( = ?auto_122477 ?auto_122475 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122469 ?auto_122472 ?auto_122470 ?auto_122471 ?auto_122473 ?auto_122468 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122583 - OBJ
      ?auto_122584 - OBJ
      ?auto_122585 - OBJ
      ?auto_122586 - OBJ
      ?auto_122587 - OBJ
      ?auto_122582 - LOCATION
    )
    :vars
    (
      ?auto_122591 - LOCATION
      ?auto_122590 - CITY
      ?auto_122593 - LOCATION
      ?auto_122592 - LOCATION
      ?auto_122588 - LOCATION
      ?auto_122589 - LOCATION
      ?auto_122594 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122591 ?auto_122590 ) ( IN-CITY ?auto_122582 ?auto_122590 ) ( not ( = ?auto_122582 ?auto_122591 ) ) ( OBJ-AT ?auto_122585 ?auto_122591 ) ( IN-CITY ?auto_122593 ?auto_122590 ) ( not ( = ?auto_122582 ?auto_122593 ) ) ( OBJ-AT ?auto_122586 ?auto_122593 ) ( IN-CITY ?auto_122592 ?auto_122590 ) ( not ( = ?auto_122582 ?auto_122592 ) ) ( OBJ-AT ?auto_122584 ?auto_122592 ) ( IN-CITY ?auto_122588 ?auto_122590 ) ( not ( = ?auto_122582 ?auto_122588 ) ) ( OBJ-AT ?auto_122587 ?auto_122588 ) ( IN-CITY ?auto_122589 ?auto_122590 ) ( not ( = ?auto_122582 ?auto_122589 ) ) ( OBJ-AT ?auto_122583 ?auto_122589 ) ( TRUCK-AT ?auto_122594 ?auto_122582 ) ( not ( = ?auto_122583 ?auto_122587 ) ) ( not ( = ?auto_122588 ?auto_122589 ) ) ( not ( = ?auto_122583 ?auto_122584 ) ) ( not ( = ?auto_122587 ?auto_122584 ) ) ( not ( = ?auto_122592 ?auto_122588 ) ) ( not ( = ?auto_122592 ?auto_122589 ) ) ( not ( = ?auto_122583 ?auto_122586 ) ) ( not ( = ?auto_122587 ?auto_122586 ) ) ( not ( = ?auto_122584 ?auto_122586 ) ) ( not ( = ?auto_122593 ?auto_122592 ) ) ( not ( = ?auto_122593 ?auto_122588 ) ) ( not ( = ?auto_122593 ?auto_122589 ) ) ( not ( = ?auto_122583 ?auto_122585 ) ) ( not ( = ?auto_122587 ?auto_122585 ) ) ( not ( = ?auto_122584 ?auto_122585 ) ) ( not ( = ?auto_122586 ?auto_122585 ) ) ( not ( = ?auto_122591 ?auto_122593 ) ) ( not ( = ?auto_122591 ?auto_122592 ) ) ( not ( = ?auto_122591 ?auto_122588 ) ) ( not ( = ?auto_122591 ?auto_122589 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122583 ?auto_122587 ?auto_122584 ?auto_122585 ?auto_122586 ?auto_122582 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122870 - OBJ
      ?auto_122871 - OBJ
      ?auto_122872 - OBJ
      ?auto_122873 - OBJ
      ?auto_122874 - OBJ
      ?auto_122869 - LOCATION
    )
    :vars
    (
      ?auto_122878 - LOCATION
      ?auto_122877 - CITY
      ?auto_122880 - LOCATION
      ?auto_122879 - LOCATION
      ?auto_122875 - LOCATION
      ?auto_122876 - LOCATION
      ?auto_122881 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122878 ?auto_122877 ) ( IN-CITY ?auto_122869 ?auto_122877 ) ( not ( = ?auto_122869 ?auto_122878 ) ) ( OBJ-AT ?auto_122874 ?auto_122878 ) ( IN-CITY ?auto_122880 ?auto_122877 ) ( not ( = ?auto_122869 ?auto_122880 ) ) ( OBJ-AT ?auto_122871 ?auto_122880 ) ( IN-CITY ?auto_122879 ?auto_122877 ) ( not ( = ?auto_122869 ?auto_122879 ) ) ( OBJ-AT ?auto_122873 ?auto_122879 ) ( IN-CITY ?auto_122875 ?auto_122877 ) ( not ( = ?auto_122869 ?auto_122875 ) ) ( OBJ-AT ?auto_122872 ?auto_122875 ) ( IN-CITY ?auto_122876 ?auto_122877 ) ( not ( = ?auto_122869 ?auto_122876 ) ) ( OBJ-AT ?auto_122870 ?auto_122876 ) ( TRUCK-AT ?auto_122881 ?auto_122869 ) ( not ( = ?auto_122870 ?auto_122872 ) ) ( not ( = ?auto_122875 ?auto_122876 ) ) ( not ( = ?auto_122870 ?auto_122873 ) ) ( not ( = ?auto_122872 ?auto_122873 ) ) ( not ( = ?auto_122879 ?auto_122875 ) ) ( not ( = ?auto_122879 ?auto_122876 ) ) ( not ( = ?auto_122870 ?auto_122871 ) ) ( not ( = ?auto_122872 ?auto_122871 ) ) ( not ( = ?auto_122873 ?auto_122871 ) ) ( not ( = ?auto_122880 ?auto_122879 ) ) ( not ( = ?auto_122880 ?auto_122875 ) ) ( not ( = ?auto_122880 ?auto_122876 ) ) ( not ( = ?auto_122870 ?auto_122874 ) ) ( not ( = ?auto_122872 ?auto_122874 ) ) ( not ( = ?auto_122873 ?auto_122874 ) ) ( not ( = ?auto_122871 ?auto_122874 ) ) ( not ( = ?auto_122878 ?auto_122880 ) ) ( not ( = ?auto_122878 ?auto_122879 ) ) ( not ( = ?auto_122878 ?auto_122875 ) ) ( not ( = ?auto_122878 ?auto_122876 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122870 ?auto_122872 ?auto_122873 ?auto_122874 ?auto_122871 ?auto_122869 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122925 - OBJ
      ?auto_122926 - OBJ
      ?auto_122927 - OBJ
      ?auto_122928 - OBJ
      ?auto_122929 - OBJ
      ?auto_122924 - LOCATION
    )
    :vars
    (
      ?auto_122933 - LOCATION
      ?auto_122932 - CITY
      ?auto_122935 - LOCATION
      ?auto_122934 - LOCATION
      ?auto_122930 - LOCATION
      ?auto_122931 - LOCATION
      ?auto_122936 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122933 ?auto_122932 ) ( IN-CITY ?auto_122924 ?auto_122932 ) ( not ( = ?auto_122924 ?auto_122933 ) ) ( OBJ-AT ?auto_122928 ?auto_122933 ) ( IN-CITY ?auto_122935 ?auto_122932 ) ( not ( = ?auto_122924 ?auto_122935 ) ) ( OBJ-AT ?auto_122926 ?auto_122935 ) ( IN-CITY ?auto_122934 ?auto_122932 ) ( not ( = ?auto_122924 ?auto_122934 ) ) ( OBJ-AT ?auto_122929 ?auto_122934 ) ( IN-CITY ?auto_122930 ?auto_122932 ) ( not ( = ?auto_122924 ?auto_122930 ) ) ( OBJ-AT ?auto_122927 ?auto_122930 ) ( IN-CITY ?auto_122931 ?auto_122932 ) ( not ( = ?auto_122924 ?auto_122931 ) ) ( OBJ-AT ?auto_122925 ?auto_122931 ) ( TRUCK-AT ?auto_122936 ?auto_122924 ) ( not ( = ?auto_122925 ?auto_122927 ) ) ( not ( = ?auto_122930 ?auto_122931 ) ) ( not ( = ?auto_122925 ?auto_122929 ) ) ( not ( = ?auto_122927 ?auto_122929 ) ) ( not ( = ?auto_122934 ?auto_122930 ) ) ( not ( = ?auto_122934 ?auto_122931 ) ) ( not ( = ?auto_122925 ?auto_122926 ) ) ( not ( = ?auto_122927 ?auto_122926 ) ) ( not ( = ?auto_122929 ?auto_122926 ) ) ( not ( = ?auto_122935 ?auto_122934 ) ) ( not ( = ?auto_122935 ?auto_122930 ) ) ( not ( = ?auto_122935 ?auto_122931 ) ) ( not ( = ?auto_122925 ?auto_122928 ) ) ( not ( = ?auto_122927 ?auto_122928 ) ) ( not ( = ?auto_122929 ?auto_122928 ) ) ( not ( = ?auto_122926 ?auto_122928 ) ) ( not ( = ?auto_122933 ?auto_122935 ) ) ( not ( = ?auto_122933 ?auto_122934 ) ) ( not ( = ?auto_122933 ?auto_122930 ) ) ( not ( = ?auto_122933 ?auto_122931 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122925 ?auto_122927 ?auto_122929 ?auto_122928 ?auto_122926 ?auto_122924 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122980 - OBJ
      ?auto_122981 - OBJ
      ?auto_122982 - OBJ
      ?auto_122983 - OBJ
      ?auto_122984 - OBJ
      ?auto_122979 - LOCATION
    )
    :vars
    (
      ?auto_122988 - LOCATION
      ?auto_122987 - CITY
      ?auto_122990 - LOCATION
      ?auto_122989 - LOCATION
      ?auto_122985 - LOCATION
      ?auto_122986 - LOCATION
      ?auto_122991 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122988 ?auto_122987 ) ( IN-CITY ?auto_122979 ?auto_122987 ) ( not ( = ?auto_122979 ?auto_122988 ) ) ( OBJ-AT ?auto_122984 ?auto_122988 ) ( IN-CITY ?auto_122990 ?auto_122987 ) ( not ( = ?auto_122979 ?auto_122990 ) ) ( OBJ-AT ?auto_122981 ?auto_122990 ) ( IN-CITY ?auto_122989 ?auto_122987 ) ( not ( = ?auto_122979 ?auto_122989 ) ) ( OBJ-AT ?auto_122982 ?auto_122989 ) ( IN-CITY ?auto_122985 ?auto_122987 ) ( not ( = ?auto_122979 ?auto_122985 ) ) ( OBJ-AT ?auto_122983 ?auto_122985 ) ( IN-CITY ?auto_122986 ?auto_122987 ) ( not ( = ?auto_122979 ?auto_122986 ) ) ( OBJ-AT ?auto_122980 ?auto_122986 ) ( TRUCK-AT ?auto_122991 ?auto_122979 ) ( not ( = ?auto_122980 ?auto_122983 ) ) ( not ( = ?auto_122985 ?auto_122986 ) ) ( not ( = ?auto_122980 ?auto_122982 ) ) ( not ( = ?auto_122983 ?auto_122982 ) ) ( not ( = ?auto_122989 ?auto_122985 ) ) ( not ( = ?auto_122989 ?auto_122986 ) ) ( not ( = ?auto_122980 ?auto_122981 ) ) ( not ( = ?auto_122983 ?auto_122981 ) ) ( not ( = ?auto_122982 ?auto_122981 ) ) ( not ( = ?auto_122990 ?auto_122989 ) ) ( not ( = ?auto_122990 ?auto_122985 ) ) ( not ( = ?auto_122990 ?auto_122986 ) ) ( not ( = ?auto_122980 ?auto_122984 ) ) ( not ( = ?auto_122983 ?auto_122984 ) ) ( not ( = ?auto_122982 ?auto_122984 ) ) ( not ( = ?auto_122981 ?auto_122984 ) ) ( not ( = ?auto_122988 ?auto_122990 ) ) ( not ( = ?auto_122988 ?auto_122989 ) ) ( not ( = ?auto_122988 ?auto_122985 ) ) ( not ( = ?auto_122988 ?auto_122986 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122980 ?auto_122983 ?auto_122982 ?auto_122984 ?auto_122981 ?auto_122979 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_123035 - OBJ
      ?auto_123036 - OBJ
      ?auto_123037 - OBJ
      ?auto_123038 - OBJ
      ?auto_123039 - OBJ
      ?auto_123034 - LOCATION
    )
    :vars
    (
      ?auto_123043 - LOCATION
      ?auto_123042 - CITY
      ?auto_123045 - LOCATION
      ?auto_123044 - LOCATION
      ?auto_123040 - LOCATION
      ?auto_123041 - LOCATION
      ?auto_123046 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123043 ?auto_123042 ) ( IN-CITY ?auto_123034 ?auto_123042 ) ( not ( = ?auto_123034 ?auto_123043 ) ) ( OBJ-AT ?auto_123038 ?auto_123043 ) ( IN-CITY ?auto_123045 ?auto_123042 ) ( not ( = ?auto_123034 ?auto_123045 ) ) ( OBJ-AT ?auto_123036 ?auto_123045 ) ( IN-CITY ?auto_123044 ?auto_123042 ) ( not ( = ?auto_123034 ?auto_123044 ) ) ( OBJ-AT ?auto_123037 ?auto_123044 ) ( IN-CITY ?auto_123040 ?auto_123042 ) ( not ( = ?auto_123034 ?auto_123040 ) ) ( OBJ-AT ?auto_123039 ?auto_123040 ) ( IN-CITY ?auto_123041 ?auto_123042 ) ( not ( = ?auto_123034 ?auto_123041 ) ) ( OBJ-AT ?auto_123035 ?auto_123041 ) ( TRUCK-AT ?auto_123046 ?auto_123034 ) ( not ( = ?auto_123035 ?auto_123039 ) ) ( not ( = ?auto_123040 ?auto_123041 ) ) ( not ( = ?auto_123035 ?auto_123037 ) ) ( not ( = ?auto_123039 ?auto_123037 ) ) ( not ( = ?auto_123044 ?auto_123040 ) ) ( not ( = ?auto_123044 ?auto_123041 ) ) ( not ( = ?auto_123035 ?auto_123036 ) ) ( not ( = ?auto_123039 ?auto_123036 ) ) ( not ( = ?auto_123037 ?auto_123036 ) ) ( not ( = ?auto_123045 ?auto_123044 ) ) ( not ( = ?auto_123045 ?auto_123040 ) ) ( not ( = ?auto_123045 ?auto_123041 ) ) ( not ( = ?auto_123035 ?auto_123038 ) ) ( not ( = ?auto_123039 ?auto_123038 ) ) ( not ( = ?auto_123037 ?auto_123038 ) ) ( not ( = ?auto_123036 ?auto_123038 ) ) ( not ( = ?auto_123043 ?auto_123045 ) ) ( not ( = ?auto_123043 ?auto_123044 ) ) ( not ( = ?auto_123043 ?auto_123040 ) ) ( not ( = ?auto_123043 ?auto_123041 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_123035 ?auto_123039 ?auto_123037 ?auto_123038 ?auto_123036 ?auto_123034 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_123322 - OBJ
      ?auto_123323 - OBJ
      ?auto_123324 - OBJ
      ?auto_123325 - OBJ
      ?auto_123326 - OBJ
      ?auto_123321 - LOCATION
    )
    :vars
    (
      ?auto_123330 - LOCATION
      ?auto_123329 - CITY
      ?auto_123332 - LOCATION
      ?auto_123331 - LOCATION
      ?auto_123327 - LOCATION
      ?auto_123328 - LOCATION
      ?auto_123333 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123330 ?auto_123329 ) ( IN-CITY ?auto_123321 ?auto_123329 ) ( not ( = ?auto_123321 ?auto_123330 ) ) ( OBJ-AT ?auto_123324 ?auto_123330 ) ( IN-CITY ?auto_123332 ?auto_123329 ) ( not ( = ?auto_123321 ?auto_123332 ) ) ( OBJ-AT ?auto_123323 ?auto_123332 ) ( IN-CITY ?auto_123331 ?auto_123329 ) ( not ( = ?auto_123321 ?auto_123331 ) ) ( OBJ-AT ?auto_123326 ?auto_123331 ) ( IN-CITY ?auto_123327 ?auto_123329 ) ( not ( = ?auto_123321 ?auto_123327 ) ) ( OBJ-AT ?auto_123325 ?auto_123327 ) ( IN-CITY ?auto_123328 ?auto_123329 ) ( not ( = ?auto_123321 ?auto_123328 ) ) ( OBJ-AT ?auto_123322 ?auto_123328 ) ( TRUCK-AT ?auto_123333 ?auto_123321 ) ( not ( = ?auto_123322 ?auto_123325 ) ) ( not ( = ?auto_123327 ?auto_123328 ) ) ( not ( = ?auto_123322 ?auto_123326 ) ) ( not ( = ?auto_123325 ?auto_123326 ) ) ( not ( = ?auto_123331 ?auto_123327 ) ) ( not ( = ?auto_123331 ?auto_123328 ) ) ( not ( = ?auto_123322 ?auto_123323 ) ) ( not ( = ?auto_123325 ?auto_123323 ) ) ( not ( = ?auto_123326 ?auto_123323 ) ) ( not ( = ?auto_123332 ?auto_123331 ) ) ( not ( = ?auto_123332 ?auto_123327 ) ) ( not ( = ?auto_123332 ?auto_123328 ) ) ( not ( = ?auto_123322 ?auto_123324 ) ) ( not ( = ?auto_123325 ?auto_123324 ) ) ( not ( = ?auto_123326 ?auto_123324 ) ) ( not ( = ?auto_123323 ?auto_123324 ) ) ( not ( = ?auto_123330 ?auto_123332 ) ) ( not ( = ?auto_123330 ?auto_123331 ) ) ( not ( = ?auto_123330 ?auto_123327 ) ) ( not ( = ?auto_123330 ?auto_123328 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_123322 ?auto_123325 ?auto_123326 ?auto_123324 ?auto_123323 ?auto_123321 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_123377 - OBJ
      ?auto_123378 - OBJ
      ?auto_123379 - OBJ
      ?auto_123380 - OBJ
      ?auto_123381 - OBJ
      ?auto_123376 - LOCATION
    )
    :vars
    (
      ?auto_123385 - LOCATION
      ?auto_123384 - CITY
      ?auto_123387 - LOCATION
      ?auto_123386 - LOCATION
      ?auto_123382 - LOCATION
      ?auto_123383 - LOCATION
      ?auto_123388 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123385 ?auto_123384 ) ( IN-CITY ?auto_123376 ?auto_123384 ) ( not ( = ?auto_123376 ?auto_123385 ) ) ( OBJ-AT ?auto_123379 ?auto_123385 ) ( IN-CITY ?auto_123387 ?auto_123384 ) ( not ( = ?auto_123376 ?auto_123387 ) ) ( OBJ-AT ?auto_123378 ?auto_123387 ) ( IN-CITY ?auto_123386 ?auto_123384 ) ( not ( = ?auto_123376 ?auto_123386 ) ) ( OBJ-AT ?auto_123380 ?auto_123386 ) ( IN-CITY ?auto_123382 ?auto_123384 ) ( not ( = ?auto_123376 ?auto_123382 ) ) ( OBJ-AT ?auto_123381 ?auto_123382 ) ( IN-CITY ?auto_123383 ?auto_123384 ) ( not ( = ?auto_123376 ?auto_123383 ) ) ( OBJ-AT ?auto_123377 ?auto_123383 ) ( TRUCK-AT ?auto_123388 ?auto_123376 ) ( not ( = ?auto_123377 ?auto_123381 ) ) ( not ( = ?auto_123382 ?auto_123383 ) ) ( not ( = ?auto_123377 ?auto_123380 ) ) ( not ( = ?auto_123381 ?auto_123380 ) ) ( not ( = ?auto_123386 ?auto_123382 ) ) ( not ( = ?auto_123386 ?auto_123383 ) ) ( not ( = ?auto_123377 ?auto_123378 ) ) ( not ( = ?auto_123381 ?auto_123378 ) ) ( not ( = ?auto_123380 ?auto_123378 ) ) ( not ( = ?auto_123387 ?auto_123386 ) ) ( not ( = ?auto_123387 ?auto_123382 ) ) ( not ( = ?auto_123387 ?auto_123383 ) ) ( not ( = ?auto_123377 ?auto_123379 ) ) ( not ( = ?auto_123381 ?auto_123379 ) ) ( not ( = ?auto_123380 ?auto_123379 ) ) ( not ( = ?auto_123378 ?auto_123379 ) ) ( not ( = ?auto_123385 ?auto_123387 ) ) ( not ( = ?auto_123385 ?auto_123386 ) ) ( not ( = ?auto_123385 ?auto_123382 ) ) ( not ( = ?auto_123385 ?auto_123383 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_123377 ?auto_123381 ?auto_123380 ?auto_123379 ?auto_123378 ?auto_123376 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124139 - OBJ
      ?auto_124140 - OBJ
      ?auto_124141 - OBJ
      ?auto_124142 - OBJ
      ?auto_124143 - OBJ
      ?auto_124138 - LOCATION
    )
    :vars
    (
      ?auto_124147 - LOCATION
      ?auto_124146 - CITY
      ?auto_124149 - LOCATION
      ?auto_124148 - LOCATION
      ?auto_124144 - LOCATION
      ?auto_124145 - LOCATION
      ?auto_124150 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124147 ?auto_124146 ) ( IN-CITY ?auto_124138 ?auto_124146 ) ( not ( = ?auto_124138 ?auto_124147 ) ) ( OBJ-AT ?auto_124140 ?auto_124147 ) ( IN-CITY ?auto_124149 ?auto_124146 ) ( not ( = ?auto_124138 ?auto_124149 ) ) ( OBJ-AT ?auto_124143 ?auto_124149 ) ( IN-CITY ?auto_124148 ?auto_124146 ) ( not ( = ?auto_124138 ?auto_124148 ) ) ( OBJ-AT ?auto_124142 ?auto_124148 ) ( IN-CITY ?auto_124144 ?auto_124146 ) ( not ( = ?auto_124138 ?auto_124144 ) ) ( OBJ-AT ?auto_124141 ?auto_124144 ) ( IN-CITY ?auto_124145 ?auto_124146 ) ( not ( = ?auto_124138 ?auto_124145 ) ) ( OBJ-AT ?auto_124139 ?auto_124145 ) ( TRUCK-AT ?auto_124150 ?auto_124138 ) ( not ( = ?auto_124139 ?auto_124141 ) ) ( not ( = ?auto_124144 ?auto_124145 ) ) ( not ( = ?auto_124139 ?auto_124142 ) ) ( not ( = ?auto_124141 ?auto_124142 ) ) ( not ( = ?auto_124148 ?auto_124144 ) ) ( not ( = ?auto_124148 ?auto_124145 ) ) ( not ( = ?auto_124139 ?auto_124143 ) ) ( not ( = ?auto_124141 ?auto_124143 ) ) ( not ( = ?auto_124142 ?auto_124143 ) ) ( not ( = ?auto_124149 ?auto_124148 ) ) ( not ( = ?auto_124149 ?auto_124144 ) ) ( not ( = ?auto_124149 ?auto_124145 ) ) ( not ( = ?auto_124139 ?auto_124140 ) ) ( not ( = ?auto_124141 ?auto_124140 ) ) ( not ( = ?auto_124142 ?auto_124140 ) ) ( not ( = ?auto_124143 ?auto_124140 ) ) ( not ( = ?auto_124147 ?auto_124149 ) ) ( not ( = ?auto_124147 ?auto_124148 ) ) ( not ( = ?auto_124147 ?auto_124144 ) ) ( not ( = ?auto_124147 ?auto_124145 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124139 ?auto_124141 ?auto_124142 ?auto_124140 ?auto_124143 ?auto_124138 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124194 - OBJ
      ?auto_124195 - OBJ
      ?auto_124196 - OBJ
      ?auto_124197 - OBJ
      ?auto_124198 - OBJ
      ?auto_124193 - LOCATION
    )
    :vars
    (
      ?auto_124202 - LOCATION
      ?auto_124201 - CITY
      ?auto_124204 - LOCATION
      ?auto_124203 - LOCATION
      ?auto_124199 - LOCATION
      ?auto_124200 - LOCATION
      ?auto_124205 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124202 ?auto_124201 ) ( IN-CITY ?auto_124193 ?auto_124201 ) ( not ( = ?auto_124193 ?auto_124202 ) ) ( OBJ-AT ?auto_124195 ?auto_124202 ) ( IN-CITY ?auto_124204 ?auto_124201 ) ( not ( = ?auto_124193 ?auto_124204 ) ) ( OBJ-AT ?auto_124197 ?auto_124204 ) ( IN-CITY ?auto_124203 ?auto_124201 ) ( not ( = ?auto_124193 ?auto_124203 ) ) ( OBJ-AT ?auto_124198 ?auto_124203 ) ( IN-CITY ?auto_124199 ?auto_124201 ) ( not ( = ?auto_124193 ?auto_124199 ) ) ( OBJ-AT ?auto_124196 ?auto_124199 ) ( IN-CITY ?auto_124200 ?auto_124201 ) ( not ( = ?auto_124193 ?auto_124200 ) ) ( OBJ-AT ?auto_124194 ?auto_124200 ) ( TRUCK-AT ?auto_124205 ?auto_124193 ) ( not ( = ?auto_124194 ?auto_124196 ) ) ( not ( = ?auto_124199 ?auto_124200 ) ) ( not ( = ?auto_124194 ?auto_124198 ) ) ( not ( = ?auto_124196 ?auto_124198 ) ) ( not ( = ?auto_124203 ?auto_124199 ) ) ( not ( = ?auto_124203 ?auto_124200 ) ) ( not ( = ?auto_124194 ?auto_124197 ) ) ( not ( = ?auto_124196 ?auto_124197 ) ) ( not ( = ?auto_124198 ?auto_124197 ) ) ( not ( = ?auto_124204 ?auto_124203 ) ) ( not ( = ?auto_124204 ?auto_124199 ) ) ( not ( = ?auto_124204 ?auto_124200 ) ) ( not ( = ?auto_124194 ?auto_124195 ) ) ( not ( = ?auto_124196 ?auto_124195 ) ) ( not ( = ?auto_124198 ?auto_124195 ) ) ( not ( = ?auto_124197 ?auto_124195 ) ) ( not ( = ?auto_124202 ?auto_124204 ) ) ( not ( = ?auto_124202 ?auto_124203 ) ) ( not ( = ?auto_124202 ?auto_124199 ) ) ( not ( = ?auto_124202 ?auto_124200 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124194 ?auto_124196 ?auto_124198 ?auto_124195 ?auto_124197 ?auto_124193 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124423 - OBJ
      ?auto_124424 - OBJ
      ?auto_124425 - OBJ
      ?auto_124426 - OBJ
      ?auto_124427 - OBJ
      ?auto_124422 - LOCATION
    )
    :vars
    (
      ?auto_124431 - LOCATION
      ?auto_124430 - CITY
      ?auto_124433 - LOCATION
      ?auto_124432 - LOCATION
      ?auto_124428 - LOCATION
      ?auto_124429 - LOCATION
      ?auto_124434 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124431 ?auto_124430 ) ( IN-CITY ?auto_124422 ?auto_124430 ) ( not ( = ?auto_124422 ?auto_124431 ) ) ( OBJ-AT ?auto_124424 ?auto_124431 ) ( IN-CITY ?auto_124433 ?auto_124430 ) ( not ( = ?auto_124422 ?auto_124433 ) ) ( OBJ-AT ?auto_124427 ?auto_124433 ) ( IN-CITY ?auto_124432 ?auto_124430 ) ( not ( = ?auto_124422 ?auto_124432 ) ) ( OBJ-AT ?auto_124425 ?auto_124432 ) ( IN-CITY ?auto_124428 ?auto_124430 ) ( not ( = ?auto_124422 ?auto_124428 ) ) ( OBJ-AT ?auto_124426 ?auto_124428 ) ( IN-CITY ?auto_124429 ?auto_124430 ) ( not ( = ?auto_124422 ?auto_124429 ) ) ( OBJ-AT ?auto_124423 ?auto_124429 ) ( TRUCK-AT ?auto_124434 ?auto_124422 ) ( not ( = ?auto_124423 ?auto_124426 ) ) ( not ( = ?auto_124428 ?auto_124429 ) ) ( not ( = ?auto_124423 ?auto_124425 ) ) ( not ( = ?auto_124426 ?auto_124425 ) ) ( not ( = ?auto_124432 ?auto_124428 ) ) ( not ( = ?auto_124432 ?auto_124429 ) ) ( not ( = ?auto_124423 ?auto_124427 ) ) ( not ( = ?auto_124426 ?auto_124427 ) ) ( not ( = ?auto_124425 ?auto_124427 ) ) ( not ( = ?auto_124433 ?auto_124432 ) ) ( not ( = ?auto_124433 ?auto_124428 ) ) ( not ( = ?auto_124433 ?auto_124429 ) ) ( not ( = ?auto_124423 ?auto_124424 ) ) ( not ( = ?auto_124426 ?auto_124424 ) ) ( not ( = ?auto_124425 ?auto_124424 ) ) ( not ( = ?auto_124427 ?auto_124424 ) ) ( not ( = ?auto_124431 ?auto_124433 ) ) ( not ( = ?auto_124431 ?auto_124432 ) ) ( not ( = ?auto_124431 ?auto_124428 ) ) ( not ( = ?auto_124431 ?auto_124429 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124423 ?auto_124426 ?auto_124425 ?auto_124424 ?auto_124427 ?auto_124422 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124537 - OBJ
      ?auto_124538 - OBJ
      ?auto_124539 - OBJ
      ?auto_124540 - OBJ
      ?auto_124541 - OBJ
      ?auto_124536 - LOCATION
    )
    :vars
    (
      ?auto_124545 - LOCATION
      ?auto_124544 - CITY
      ?auto_124547 - LOCATION
      ?auto_124546 - LOCATION
      ?auto_124542 - LOCATION
      ?auto_124543 - LOCATION
      ?auto_124548 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124545 ?auto_124544 ) ( IN-CITY ?auto_124536 ?auto_124544 ) ( not ( = ?auto_124536 ?auto_124545 ) ) ( OBJ-AT ?auto_124538 ?auto_124545 ) ( IN-CITY ?auto_124547 ?auto_124544 ) ( not ( = ?auto_124536 ?auto_124547 ) ) ( OBJ-AT ?auto_124540 ?auto_124547 ) ( IN-CITY ?auto_124546 ?auto_124544 ) ( not ( = ?auto_124536 ?auto_124546 ) ) ( OBJ-AT ?auto_124539 ?auto_124546 ) ( IN-CITY ?auto_124542 ?auto_124544 ) ( not ( = ?auto_124536 ?auto_124542 ) ) ( OBJ-AT ?auto_124541 ?auto_124542 ) ( IN-CITY ?auto_124543 ?auto_124544 ) ( not ( = ?auto_124536 ?auto_124543 ) ) ( OBJ-AT ?auto_124537 ?auto_124543 ) ( TRUCK-AT ?auto_124548 ?auto_124536 ) ( not ( = ?auto_124537 ?auto_124541 ) ) ( not ( = ?auto_124542 ?auto_124543 ) ) ( not ( = ?auto_124537 ?auto_124539 ) ) ( not ( = ?auto_124541 ?auto_124539 ) ) ( not ( = ?auto_124546 ?auto_124542 ) ) ( not ( = ?auto_124546 ?auto_124543 ) ) ( not ( = ?auto_124537 ?auto_124540 ) ) ( not ( = ?auto_124541 ?auto_124540 ) ) ( not ( = ?auto_124539 ?auto_124540 ) ) ( not ( = ?auto_124547 ?auto_124546 ) ) ( not ( = ?auto_124547 ?auto_124542 ) ) ( not ( = ?auto_124547 ?auto_124543 ) ) ( not ( = ?auto_124537 ?auto_124538 ) ) ( not ( = ?auto_124541 ?auto_124538 ) ) ( not ( = ?auto_124539 ?auto_124538 ) ) ( not ( = ?auto_124540 ?auto_124538 ) ) ( not ( = ?auto_124545 ?auto_124547 ) ) ( not ( = ?auto_124545 ?auto_124546 ) ) ( not ( = ?auto_124545 ?auto_124542 ) ) ( not ( = ?auto_124545 ?auto_124543 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124537 ?auto_124541 ?auto_124539 ?auto_124538 ?auto_124540 ?auto_124536 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124766 - OBJ
      ?auto_124767 - OBJ
      ?auto_124768 - OBJ
      ?auto_124769 - OBJ
      ?auto_124770 - OBJ
      ?auto_124765 - LOCATION
    )
    :vars
    (
      ?auto_124774 - LOCATION
      ?auto_124773 - CITY
      ?auto_124776 - LOCATION
      ?auto_124775 - LOCATION
      ?auto_124771 - LOCATION
      ?auto_124772 - LOCATION
      ?auto_124777 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124774 ?auto_124773 ) ( IN-CITY ?auto_124765 ?auto_124773 ) ( not ( = ?auto_124765 ?auto_124774 ) ) ( OBJ-AT ?auto_124767 ?auto_124774 ) ( IN-CITY ?auto_124776 ?auto_124773 ) ( not ( = ?auto_124765 ?auto_124776 ) ) ( OBJ-AT ?auto_124768 ?auto_124776 ) ( IN-CITY ?auto_124775 ?auto_124773 ) ( not ( = ?auto_124765 ?auto_124775 ) ) ( OBJ-AT ?auto_124770 ?auto_124775 ) ( IN-CITY ?auto_124771 ?auto_124773 ) ( not ( = ?auto_124765 ?auto_124771 ) ) ( OBJ-AT ?auto_124769 ?auto_124771 ) ( IN-CITY ?auto_124772 ?auto_124773 ) ( not ( = ?auto_124765 ?auto_124772 ) ) ( OBJ-AT ?auto_124766 ?auto_124772 ) ( TRUCK-AT ?auto_124777 ?auto_124765 ) ( not ( = ?auto_124766 ?auto_124769 ) ) ( not ( = ?auto_124771 ?auto_124772 ) ) ( not ( = ?auto_124766 ?auto_124770 ) ) ( not ( = ?auto_124769 ?auto_124770 ) ) ( not ( = ?auto_124775 ?auto_124771 ) ) ( not ( = ?auto_124775 ?auto_124772 ) ) ( not ( = ?auto_124766 ?auto_124768 ) ) ( not ( = ?auto_124769 ?auto_124768 ) ) ( not ( = ?auto_124770 ?auto_124768 ) ) ( not ( = ?auto_124776 ?auto_124775 ) ) ( not ( = ?auto_124776 ?auto_124771 ) ) ( not ( = ?auto_124776 ?auto_124772 ) ) ( not ( = ?auto_124766 ?auto_124767 ) ) ( not ( = ?auto_124769 ?auto_124767 ) ) ( not ( = ?auto_124770 ?auto_124767 ) ) ( not ( = ?auto_124768 ?auto_124767 ) ) ( not ( = ?auto_124774 ?auto_124776 ) ) ( not ( = ?auto_124774 ?auto_124775 ) ) ( not ( = ?auto_124774 ?auto_124771 ) ) ( not ( = ?auto_124774 ?auto_124772 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124766 ?auto_124769 ?auto_124770 ?auto_124767 ?auto_124768 ?auto_124765 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124821 - OBJ
      ?auto_124822 - OBJ
      ?auto_124823 - OBJ
      ?auto_124824 - OBJ
      ?auto_124825 - OBJ
      ?auto_124820 - LOCATION
    )
    :vars
    (
      ?auto_124829 - LOCATION
      ?auto_124828 - CITY
      ?auto_124831 - LOCATION
      ?auto_124830 - LOCATION
      ?auto_124826 - LOCATION
      ?auto_124827 - LOCATION
      ?auto_124832 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124829 ?auto_124828 ) ( IN-CITY ?auto_124820 ?auto_124828 ) ( not ( = ?auto_124820 ?auto_124829 ) ) ( OBJ-AT ?auto_124822 ?auto_124829 ) ( IN-CITY ?auto_124831 ?auto_124828 ) ( not ( = ?auto_124820 ?auto_124831 ) ) ( OBJ-AT ?auto_124823 ?auto_124831 ) ( IN-CITY ?auto_124830 ?auto_124828 ) ( not ( = ?auto_124820 ?auto_124830 ) ) ( OBJ-AT ?auto_124824 ?auto_124830 ) ( IN-CITY ?auto_124826 ?auto_124828 ) ( not ( = ?auto_124820 ?auto_124826 ) ) ( OBJ-AT ?auto_124825 ?auto_124826 ) ( IN-CITY ?auto_124827 ?auto_124828 ) ( not ( = ?auto_124820 ?auto_124827 ) ) ( OBJ-AT ?auto_124821 ?auto_124827 ) ( TRUCK-AT ?auto_124832 ?auto_124820 ) ( not ( = ?auto_124821 ?auto_124825 ) ) ( not ( = ?auto_124826 ?auto_124827 ) ) ( not ( = ?auto_124821 ?auto_124824 ) ) ( not ( = ?auto_124825 ?auto_124824 ) ) ( not ( = ?auto_124830 ?auto_124826 ) ) ( not ( = ?auto_124830 ?auto_124827 ) ) ( not ( = ?auto_124821 ?auto_124823 ) ) ( not ( = ?auto_124825 ?auto_124823 ) ) ( not ( = ?auto_124824 ?auto_124823 ) ) ( not ( = ?auto_124831 ?auto_124830 ) ) ( not ( = ?auto_124831 ?auto_124826 ) ) ( not ( = ?auto_124831 ?auto_124827 ) ) ( not ( = ?auto_124821 ?auto_124822 ) ) ( not ( = ?auto_124825 ?auto_124822 ) ) ( not ( = ?auto_124824 ?auto_124822 ) ) ( not ( = ?auto_124823 ?auto_124822 ) ) ( not ( = ?auto_124829 ?auto_124831 ) ) ( not ( = ?auto_124829 ?auto_124830 ) ) ( not ( = ?auto_124829 ?auto_124826 ) ) ( not ( = ?auto_124829 ?auto_124827 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124821 ?auto_124825 ?auto_124824 ?auto_124822 ?auto_124823 ?auto_124820 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_125699 - OBJ
      ?auto_125700 - OBJ
      ?auto_125701 - OBJ
      ?auto_125702 - OBJ
      ?auto_125703 - OBJ
      ?auto_125698 - LOCATION
    )
    :vars
    (
      ?auto_125707 - LOCATION
      ?auto_125706 - CITY
      ?auto_125709 - LOCATION
      ?auto_125708 - LOCATION
      ?auto_125704 - LOCATION
      ?auto_125705 - LOCATION
      ?auto_125710 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_125707 ?auto_125706 ) ( IN-CITY ?auto_125698 ?auto_125706 ) ( not ( = ?auto_125698 ?auto_125707 ) ) ( OBJ-AT ?auto_125703 ?auto_125707 ) ( IN-CITY ?auto_125709 ?auto_125706 ) ( not ( = ?auto_125698 ?auto_125709 ) ) ( OBJ-AT ?auto_125702 ?auto_125709 ) ( IN-CITY ?auto_125708 ?auto_125706 ) ( not ( = ?auto_125698 ?auto_125708 ) ) ( OBJ-AT ?auto_125701 ?auto_125708 ) ( IN-CITY ?auto_125704 ?auto_125706 ) ( not ( = ?auto_125698 ?auto_125704 ) ) ( OBJ-AT ?auto_125699 ?auto_125704 ) ( IN-CITY ?auto_125705 ?auto_125706 ) ( not ( = ?auto_125698 ?auto_125705 ) ) ( OBJ-AT ?auto_125700 ?auto_125705 ) ( TRUCK-AT ?auto_125710 ?auto_125698 ) ( not ( = ?auto_125700 ?auto_125699 ) ) ( not ( = ?auto_125704 ?auto_125705 ) ) ( not ( = ?auto_125700 ?auto_125701 ) ) ( not ( = ?auto_125699 ?auto_125701 ) ) ( not ( = ?auto_125708 ?auto_125704 ) ) ( not ( = ?auto_125708 ?auto_125705 ) ) ( not ( = ?auto_125700 ?auto_125702 ) ) ( not ( = ?auto_125699 ?auto_125702 ) ) ( not ( = ?auto_125701 ?auto_125702 ) ) ( not ( = ?auto_125709 ?auto_125708 ) ) ( not ( = ?auto_125709 ?auto_125704 ) ) ( not ( = ?auto_125709 ?auto_125705 ) ) ( not ( = ?auto_125700 ?auto_125703 ) ) ( not ( = ?auto_125699 ?auto_125703 ) ) ( not ( = ?auto_125701 ?auto_125703 ) ) ( not ( = ?auto_125702 ?auto_125703 ) ) ( not ( = ?auto_125707 ?auto_125709 ) ) ( not ( = ?auto_125707 ?auto_125708 ) ) ( not ( = ?auto_125707 ?auto_125704 ) ) ( not ( = ?auto_125707 ?auto_125705 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_125700 ?auto_125699 ?auto_125701 ?auto_125703 ?auto_125702 ?auto_125698 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_125754 - OBJ
      ?auto_125755 - OBJ
      ?auto_125756 - OBJ
      ?auto_125757 - OBJ
      ?auto_125758 - OBJ
      ?auto_125753 - LOCATION
    )
    :vars
    (
      ?auto_125762 - LOCATION
      ?auto_125761 - CITY
      ?auto_125764 - LOCATION
      ?auto_125763 - LOCATION
      ?auto_125759 - LOCATION
      ?auto_125760 - LOCATION
      ?auto_125765 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_125762 ?auto_125761 ) ( IN-CITY ?auto_125753 ?auto_125761 ) ( not ( = ?auto_125753 ?auto_125762 ) ) ( OBJ-AT ?auto_125757 ?auto_125762 ) ( IN-CITY ?auto_125764 ?auto_125761 ) ( not ( = ?auto_125753 ?auto_125764 ) ) ( OBJ-AT ?auto_125758 ?auto_125764 ) ( IN-CITY ?auto_125763 ?auto_125761 ) ( not ( = ?auto_125753 ?auto_125763 ) ) ( OBJ-AT ?auto_125756 ?auto_125763 ) ( IN-CITY ?auto_125759 ?auto_125761 ) ( not ( = ?auto_125753 ?auto_125759 ) ) ( OBJ-AT ?auto_125754 ?auto_125759 ) ( IN-CITY ?auto_125760 ?auto_125761 ) ( not ( = ?auto_125753 ?auto_125760 ) ) ( OBJ-AT ?auto_125755 ?auto_125760 ) ( TRUCK-AT ?auto_125765 ?auto_125753 ) ( not ( = ?auto_125755 ?auto_125754 ) ) ( not ( = ?auto_125759 ?auto_125760 ) ) ( not ( = ?auto_125755 ?auto_125756 ) ) ( not ( = ?auto_125754 ?auto_125756 ) ) ( not ( = ?auto_125763 ?auto_125759 ) ) ( not ( = ?auto_125763 ?auto_125760 ) ) ( not ( = ?auto_125755 ?auto_125758 ) ) ( not ( = ?auto_125754 ?auto_125758 ) ) ( not ( = ?auto_125756 ?auto_125758 ) ) ( not ( = ?auto_125764 ?auto_125763 ) ) ( not ( = ?auto_125764 ?auto_125759 ) ) ( not ( = ?auto_125764 ?auto_125760 ) ) ( not ( = ?auto_125755 ?auto_125757 ) ) ( not ( = ?auto_125754 ?auto_125757 ) ) ( not ( = ?auto_125756 ?auto_125757 ) ) ( not ( = ?auto_125758 ?auto_125757 ) ) ( not ( = ?auto_125762 ?auto_125764 ) ) ( not ( = ?auto_125762 ?auto_125763 ) ) ( not ( = ?auto_125762 ?auto_125759 ) ) ( not ( = ?auto_125762 ?auto_125760 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_125755 ?auto_125754 ?auto_125756 ?auto_125757 ?auto_125758 ?auto_125753 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_125809 - OBJ
      ?auto_125810 - OBJ
      ?auto_125811 - OBJ
      ?auto_125812 - OBJ
      ?auto_125813 - OBJ
      ?auto_125808 - LOCATION
    )
    :vars
    (
      ?auto_125817 - LOCATION
      ?auto_125816 - CITY
      ?auto_125819 - LOCATION
      ?auto_125818 - LOCATION
      ?auto_125814 - LOCATION
      ?auto_125815 - LOCATION
      ?auto_125820 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_125817 ?auto_125816 ) ( IN-CITY ?auto_125808 ?auto_125816 ) ( not ( = ?auto_125808 ?auto_125817 ) ) ( OBJ-AT ?auto_125813 ?auto_125817 ) ( IN-CITY ?auto_125819 ?auto_125816 ) ( not ( = ?auto_125808 ?auto_125819 ) ) ( OBJ-AT ?auto_125811 ?auto_125819 ) ( IN-CITY ?auto_125818 ?auto_125816 ) ( not ( = ?auto_125808 ?auto_125818 ) ) ( OBJ-AT ?auto_125812 ?auto_125818 ) ( IN-CITY ?auto_125814 ?auto_125816 ) ( not ( = ?auto_125808 ?auto_125814 ) ) ( OBJ-AT ?auto_125809 ?auto_125814 ) ( IN-CITY ?auto_125815 ?auto_125816 ) ( not ( = ?auto_125808 ?auto_125815 ) ) ( OBJ-AT ?auto_125810 ?auto_125815 ) ( TRUCK-AT ?auto_125820 ?auto_125808 ) ( not ( = ?auto_125810 ?auto_125809 ) ) ( not ( = ?auto_125814 ?auto_125815 ) ) ( not ( = ?auto_125810 ?auto_125812 ) ) ( not ( = ?auto_125809 ?auto_125812 ) ) ( not ( = ?auto_125818 ?auto_125814 ) ) ( not ( = ?auto_125818 ?auto_125815 ) ) ( not ( = ?auto_125810 ?auto_125811 ) ) ( not ( = ?auto_125809 ?auto_125811 ) ) ( not ( = ?auto_125812 ?auto_125811 ) ) ( not ( = ?auto_125819 ?auto_125818 ) ) ( not ( = ?auto_125819 ?auto_125814 ) ) ( not ( = ?auto_125819 ?auto_125815 ) ) ( not ( = ?auto_125810 ?auto_125813 ) ) ( not ( = ?auto_125809 ?auto_125813 ) ) ( not ( = ?auto_125812 ?auto_125813 ) ) ( not ( = ?auto_125811 ?auto_125813 ) ) ( not ( = ?auto_125817 ?auto_125819 ) ) ( not ( = ?auto_125817 ?auto_125818 ) ) ( not ( = ?auto_125817 ?auto_125814 ) ) ( not ( = ?auto_125817 ?auto_125815 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_125810 ?auto_125809 ?auto_125812 ?auto_125813 ?auto_125811 ?auto_125808 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_125864 - OBJ
      ?auto_125865 - OBJ
      ?auto_125866 - OBJ
      ?auto_125867 - OBJ
      ?auto_125868 - OBJ
      ?auto_125863 - LOCATION
    )
    :vars
    (
      ?auto_125872 - LOCATION
      ?auto_125871 - CITY
      ?auto_125874 - LOCATION
      ?auto_125873 - LOCATION
      ?auto_125869 - LOCATION
      ?auto_125870 - LOCATION
      ?auto_125875 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_125872 ?auto_125871 ) ( IN-CITY ?auto_125863 ?auto_125871 ) ( not ( = ?auto_125863 ?auto_125872 ) ) ( OBJ-AT ?auto_125867 ?auto_125872 ) ( IN-CITY ?auto_125874 ?auto_125871 ) ( not ( = ?auto_125863 ?auto_125874 ) ) ( OBJ-AT ?auto_125866 ?auto_125874 ) ( IN-CITY ?auto_125873 ?auto_125871 ) ( not ( = ?auto_125863 ?auto_125873 ) ) ( OBJ-AT ?auto_125868 ?auto_125873 ) ( IN-CITY ?auto_125869 ?auto_125871 ) ( not ( = ?auto_125863 ?auto_125869 ) ) ( OBJ-AT ?auto_125864 ?auto_125869 ) ( IN-CITY ?auto_125870 ?auto_125871 ) ( not ( = ?auto_125863 ?auto_125870 ) ) ( OBJ-AT ?auto_125865 ?auto_125870 ) ( TRUCK-AT ?auto_125875 ?auto_125863 ) ( not ( = ?auto_125865 ?auto_125864 ) ) ( not ( = ?auto_125869 ?auto_125870 ) ) ( not ( = ?auto_125865 ?auto_125868 ) ) ( not ( = ?auto_125864 ?auto_125868 ) ) ( not ( = ?auto_125873 ?auto_125869 ) ) ( not ( = ?auto_125873 ?auto_125870 ) ) ( not ( = ?auto_125865 ?auto_125866 ) ) ( not ( = ?auto_125864 ?auto_125866 ) ) ( not ( = ?auto_125868 ?auto_125866 ) ) ( not ( = ?auto_125874 ?auto_125873 ) ) ( not ( = ?auto_125874 ?auto_125869 ) ) ( not ( = ?auto_125874 ?auto_125870 ) ) ( not ( = ?auto_125865 ?auto_125867 ) ) ( not ( = ?auto_125864 ?auto_125867 ) ) ( not ( = ?auto_125868 ?auto_125867 ) ) ( not ( = ?auto_125866 ?auto_125867 ) ) ( not ( = ?auto_125872 ?auto_125874 ) ) ( not ( = ?auto_125872 ?auto_125873 ) ) ( not ( = ?auto_125872 ?auto_125869 ) ) ( not ( = ?auto_125872 ?auto_125870 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_125865 ?auto_125864 ?auto_125868 ?auto_125867 ?auto_125866 ?auto_125863 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_126093 - OBJ
      ?auto_126094 - OBJ
      ?auto_126095 - OBJ
      ?auto_126096 - OBJ
      ?auto_126097 - OBJ
      ?auto_126092 - LOCATION
    )
    :vars
    (
      ?auto_126101 - LOCATION
      ?auto_126100 - CITY
      ?auto_126103 - LOCATION
      ?auto_126102 - LOCATION
      ?auto_126098 - LOCATION
      ?auto_126099 - LOCATION
      ?auto_126104 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_126101 ?auto_126100 ) ( IN-CITY ?auto_126092 ?auto_126100 ) ( not ( = ?auto_126092 ?auto_126101 ) ) ( OBJ-AT ?auto_126095 ?auto_126101 ) ( IN-CITY ?auto_126103 ?auto_126100 ) ( not ( = ?auto_126092 ?auto_126103 ) ) ( OBJ-AT ?auto_126097 ?auto_126103 ) ( IN-CITY ?auto_126102 ?auto_126100 ) ( not ( = ?auto_126092 ?auto_126102 ) ) ( OBJ-AT ?auto_126096 ?auto_126102 ) ( IN-CITY ?auto_126098 ?auto_126100 ) ( not ( = ?auto_126092 ?auto_126098 ) ) ( OBJ-AT ?auto_126093 ?auto_126098 ) ( IN-CITY ?auto_126099 ?auto_126100 ) ( not ( = ?auto_126092 ?auto_126099 ) ) ( OBJ-AT ?auto_126094 ?auto_126099 ) ( TRUCK-AT ?auto_126104 ?auto_126092 ) ( not ( = ?auto_126094 ?auto_126093 ) ) ( not ( = ?auto_126098 ?auto_126099 ) ) ( not ( = ?auto_126094 ?auto_126096 ) ) ( not ( = ?auto_126093 ?auto_126096 ) ) ( not ( = ?auto_126102 ?auto_126098 ) ) ( not ( = ?auto_126102 ?auto_126099 ) ) ( not ( = ?auto_126094 ?auto_126097 ) ) ( not ( = ?auto_126093 ?auto_126097 ) ) ( not ( = ?auto_126096 ?auto_126097 ) ) ( not ( = ?auto_126103 ?auto_126102 ) ) ( not ( = ?auto_126103 ?auto_126098 ) ) ( not ( = ?auto_126103 ?auto_126099 ) ) ( not ( = ?auto_126094 ?auto_126095 ) ) ( not ( = ?auto_126093 ?auto_126095 ) ) ( not ( = ?auto_126096 ?auto_126095 ) ) ( not ( = ?auto_126097 ?auto_126095 ) ) ( not ( = ?auto_126101 ?auto_126103 ) ) ( not ( = ?auto_126101 ?auto_126102 ) ) ( not ( = ?auto_126101 ?auto_126098 ) ) ( not ( = ?auto_126101 ?auto_126099 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_126094 ?auto_126093 ?auto_126096 ?auto_126095 ?auto_126097 ?auto_126092 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_126148 - OBJ
      ?auto_126149 - OBJ
      ?auto_126150 - OBJ
      ?auto_126151 - OBJ
      ?auto_126152 - OBJ
      ?auto_126147 - LOCATION
    )
    :vars
    (
      ?auto_126156 - LOCATION
      ?auto_126155 - CITY
      ?auto_126158 - LOCATION
      ?auto_126157 - LOCATION
      ?auto_126153 - LOCATION
      ?auto_126154 - LOCATION
      ?auto_126159 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_126156 ?auto_126155 ) ( IN-CITY ?auto_126147 ?auto_126155 ) ( not ( = ?auto_126147 ?auto_126156 ) ) ( OBJ-AT ?auto_126150 ?auto_126156 ) ( IN-CITY ?auto_126158 ?auto_126155 ) ( not ( = ?auto_126147 ?auto_126158 ) ) ( OBJ-AT ?auto_126151 ?auto_126158 ) ( IN-CITY ?auto_126157 ?auto_126155 ) ( not ( = ?auto_126147 ?auto_126157 ) ) ( OBJ-AT ?auto_126152 ?auto_126157 ) ( IN-CITY ?auto_126153 ?auto_126155 ) ( not ( = ?auto_126147 ?auto_126153 ) ) ( OBJ-AT ?auto_126148 ?auto_126153 ) ( IN-CITY ?auto_126154 ?auto_126155 ) ( not ( = ?auto_126147 ?auto_126154 ) ) ( OBJ-AT ?auto_126149 ?auto_126154 ) ( TRUCK-AT ?auto_126159 ?auto_126147 ) ( not ( = ?auto_126149 ?auto_126148 ) ) ( not ( = ?auto_126153 ?auto_126154 ) ) ( not ( = ?auto_126149 ?auto_126152 ) ) ( not ( = ?auto_126148 ?auto_126152 ) ) ( not ( = ?auto_126157 ?auto_126153 ) ) ( not ( = ?auto_126157 ?auto_126154 ) ) ( not ( = ?auto_126149 ?auto_126151 ) ) ( not ( = ?auto_126148 ?auto_126151 ) ) ( not ( = ?auto_126152 ?auto_126151 ) ) ( not ( = ?auto_126158 ?auto_126157 ) ) ( not ( = ?auto_126158 ?auto_126153 ) ) ( not ( = ?auto_126158 ?auto_126154 ) ) ( not ( = ?auto_126149 ?auto_126150 ) ) ( not ( = ?auto_126148 ?auto_126150 ) ) ( not ( = ?auto_126152 ?auto_126150 ) ) ( not ( = ?auto_126151 ?auto_126150 ) ) ( not ( = ?auto_126156 ?auto_126158 ) ) ( not ( = ?auto_126156 ?auto_126157 ) ) ( not ( = ?auto_126156 ?auto_126153 ) ) ( not ( = ?auto_126156 ?auto_126154 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_126149 ?auto_126148 ?auto_126152 ?auto_126150 ?auto_126151 ?auto_126147 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_127208 - OBJ
      ?auto_127209 - OBJ
      ?auto_127210 - OBJ
      ?auto_127211 - OBJ
      ?auto_127212 - OBJ
      ?auto_127207 - LOCATION
    )
    :vars
    (
      ?auto_127216 - LOCATION
      ?auto_127215 - CITY
      ?auto_127218 - LOCATION
      ?auto_127217 - LOCATION
      ?auto_127213 - LOCATION
      ?auto_127214 - LOCATION
      ?auto_127219 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_127216 ?auto_127215 ) ( IN-CITY ?auto_127207 ?auto_127215 ) ( not ( = ?auto_127207 ?auto_127216 ) ) ( OBJ-AT ?auto_127212 ?auto_127216 ) ( IN-CITY ?auto_127218 ?auto_127215 ) ( not ( = ?auto_127207 ?auto_127218 ) ) ( OBJ-AT ?auto_127211 ?auto_127218 ) ( IN-CITY ?auto_127217 ?auto_127215 ) ( not ( = ?auto_127207 ?auto_127217 ) ) ( OBJ-AT ?auto_127209 ?auto_127217 ) ( IN-CITY ?auto_127213 ?auto_127215 ) ( not ( = ?auto_127207 ?auto_127213 ) ) ( OBJ-AT ?auto_127208 ?auto_127213 ) ( IN-CITY ?auto_127214 ?auto_127215 ) ( not ( = ?auto_127207 ?auto_127214 ) ) ( OBJ-AT ?auto_127210 ?auto_127214 ) ( TRUCK-AT ?auto_127219 ?auto_127207 ) ( not ( = ?auto_127210 ?auto_127208 ) ) ( not ( = ?auto_127213 ?auto_127214 ) ) ( not ( = ?auto_127210 ?auto_127209 ) ) ( not ( = ?auto_127208 ?auto_127209 ) ) ( not ( = ?auto_127217 ?auto_127213 ) ) ( not ( = ?auto_127217 ?auto_127214 ) ) ( not ( = ?auto_127210 ?auto_127211 ) ) ( not ( = ?auto_127208 ?auto_127211 ) ) ( not ( = ?auto_127209 ?auto_127211 ) ) ( not ( = ?auto_127218 ?auto_127217 ) ) ( not ( = ?auto_127218 ?auto_127213 ) ) ( not ( = ?auto_127218 ?auto_127214 ) ) ( not ( = ?auto_127210 ?auto_127212 ) ) ( not ( = ?auto_127208 ?auto_127212 ) ) ( not ( = ?auto_127209 ?auto_127212 ) ) ( not ( = ?auto_127211 ?auto_127212 ) ) ( not ( = ?auto_127216 ?auto_127218 ) ) ( not ( = ?auto_127216 ?auto_127217 ) ) ( not ( = ?auto_127216 ?auto_127213 ) ) ( not ( = ?auto_127216 ?auto_127214 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_127210 ?auto_127208 ?auto_127209 ?auto_127212 ?auto_127211 ?auto_127207 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_127263 - OBJ
      ?auto_127264 - OBJ
      ?auto_127265 - OBJ
      ?auto_127266 - OBJ
      ?auto_127267 - OBJ
      ?auto_127262 - LOCATION
    )
    :vars
    (
      ?auto_127271 - LOCATION
      ?auto_127270 - CITY
      ?auto_127273 - LOCATION
      ?auto_127272 - LOCATION
      ?auto_127268 - LOCATION
      ?auto_127269 - LOCATION
      ?auto_127274 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_127271 ?auto_127270 ) ( IN-CITY ?auto_127262 ?auto_127270 ) ( not ( = ?auto_127262 ?auto_127271 ) ) ( OBJ-AT ?auto_127266 ?auto_127271 ) ( IN-CITY ?auto_127273 ?auto_127270 ) ( not ( = ?auto_127262 ?auto_127273 ) ) ( OBJ-AT ?auto_127267 ?auto_127273 ) ( IN-CITY ?auto_127272 ?auto_127270 ) ( not ( = ?auto_127262 ?auto_127272 ) ) ( OBJ-AT ?auto_127264 ?auto_127272 ) ( IN-CITY ?auto_127268 ?auto_127270 ) ( not ( = ?auto_127262 ?auto_127268 ) ) ( OBJ-AT ?auto_127263 ?auto_127268 ) ( IN-CITY ?auto_127269 ?auto_127270 ) ( not ( = ?auto_127262 ?auto_127269 ) ) ( OBJ-AT ?auto_127265 ?auto_127269 ) ( TRUCK-AT ?auto_127274 ?auto_127262 ) ( not ( = ?auto_127265 ?auto_127263 ) ) ( not ( = ?auto_127268 ?auto_127269 ) ) ( not ( = ?auto_127265 ?auto_127264 ) ) ( not ( = ?auto_127263 ?auto_127264 ) ) ( not ( = ?auto_127272 ?auto_127268 ) ) ( not ( = ?auto_127272 ?auto_127269 ) ) ( not ( = ?auto_127265 ?auto_127267 ) ) ( not ( = ?auto_127263 ?auto_127267 ) ) ( not ( = ?auto_127264 ?auto_127267 ) ) ( not ( = ?auto_127273 ?auto_127272 ) ) ( not ( = ?auto_127273 ?auto_127268 ) ) ( not ( = ?auto_127273 ?auto_127269 ) ) ( not ( = ?auto_127265 ?auto_127266 ) ) ( not ( = ?auto_127263 ?auto_127266 ) ) ( not ( = ?auto_127264 ?auto_127266 ) ) ( not ( = ?auto_127267 ?auto_127266 ) ) ( not ( = ?auto_127271 ?auto_127273 ) ) ( not ( = ?auto_127271 ?auto_127272 ) ) ( not ( = ?auto_127271 ?auto_127268 ) ) ( not ( = ?auto_127271 ?auto_127269 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_127265 ?auto_127263 ?auto_127264 ?auto_127266 ?auto_127267 ?auto_127262 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_127552 - OBJ
      ?auto_127553 - OBJ
      ?auto_127554 - OBJ
      ?auto_127555 - OBJ
      ?auto_127556 - OBJ
      ?auto_127551 - LOCATION
    )
    :vars
    (
      ?auto_127560 - LOCATION
      ?auto_127559 - CITY
      ?auto_127562 - LOCATION
      ?auto_127561 - LOCATION
      ?auto_127557 - LOCATION
      ?auto_127558 - LOCATION
      ?auto_127563 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_127560 ?auto_127559 ) ( IN-CITY ?auto_127551 ?auto_127559 ) ( not ( = ?auto_127551 ?auto_127560 ) ) ( OBJ-AT ?auto_127556 ?auto_127560 ) ( IN-CITY ?auto_127562 ?auto_127559 ) ( not ( = ?auto_127551 ?auto_127562 ) ) ( OBJ-AT ?auto_127554 ?auto_127562 ) ( IN-CITY ?auto_127561 ?auto_127559 ) ( not ( = ?auto_127551 ?auto_127561 ) ) ( OBJ-AT ?auto_127553 ?auto_127561 ) ( IN-CITY ?auto_127557 ?auto_127559 ) ( not ( = ?auto_127551 ?auto_127557 ) ) ( OBJ-AT ?auto_127552 ?auto_127557 ) ( IN-CITY ?auto_127558 ?auto_127559 ) ( not ( = ?auto_127551 ?auto_127558 ) ) ( OBJ-AT ?auto_127555 ?auto_127558 ) ( TRUCK-AT ?auto_127563 ?auto_127551 ) ( not ( = ?auto_127555 ?auto_127552 ) ) ( not ( = ?auto_127557 ?auto_127558 ) ) ( not ( = ?auto_127555 ?auto_127553 ) ) ( not ( = ?auto_127552 ?auto_127553 ) ) ( not ( = ?auto_127561 ?auto_127557 ) ) ( not ( = ?auto_127561 ?auto_127558 ) ) ( not ( = ?auto_127555 ?auto_127554 ) ) ( not ( = ?auto_127552 ?auto_127554 ) ) ( not ( = ?auto_127553 ?auto_127554 ) ) ( not ( = ?auto_127562 ?auto_127561 ) ) ( not ( = ?auto_127562 ?auto_127557 ) ) ( not ( = ?auto_127562 ?auto_127558 ) ) ( not ( = ?auto_127555 ?auto_127556 ) ) ( not ( = ?auto_127552 ?auto_127556 ) ) ( not ( = ?auto_127553 ?auto_127556 ) ) ( not ( = ?auto_127554 ?auto_127556 ) ) ( not ( = ?auto_127560 ?auto_127562 ) ) ( not ( = ?auto_127560 ?auto_127561 ) ) ( not ( = ?auto_127560 ?auto_127557 ) ) ( not ( = ?auto_127560 ?auto_127558 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_127555 ?auto_127552 ?auto_127553 ?auto_127556 ?auto_127554 ?auto_127551 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_127607 - OBJ
      ?auto_127608 - OBJ
      ?auto_127609 - OBJ
      ?auto_127610 - OBJ
      ?auto_127611 - OBJ
      ?auto_127606 - LOCATION
    )
    :vars
    (
      ?auto_127615 - LOCATION
      ?auto_127614 - CITY
      ?auto_127617 - LOCATION
      ?auto_127616 - LOCATION
      ?auto_127612 - LOCATION
      ?auto_127613 - LOCATION
      ?auto_127618 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_127615 ?auto_127614 ) ( IN-CITY ?auto_127606 ?auto_127614 ) ( not ( = ?auto_127606 ?auto_127615 ) ) ( OBJ-AT ?auto_127610 ?auto_127615 ) ( IN-CITY ?auto_127617 ?auto_127614 ) ( not ( = ?auto_127606 ?auto_127617 ) ) ( OBJ-AT ?auto_127609 ?auto_127617 ) ( IN-CITY ?auto_127616 ?auto_127614 ) ( not ( = ?auto_127606 ?auto_127616 ) ) ( OBJ-AT ?auto_127608 ?auto_127616 ) ( IN-CITY ?auto_127612 ?auto_127614 ) ( not ( = ?auto_127606 ?auto_127612 ) ) ( OBJ-AT ?auto_127607 ?auto_127612 ) ( IN-CITY ?auto_127613 ?auto_127614 ) ( not ( = ?auto_127606 ?auto_127613 ) ) ( OBJ-AT ?auto_127611 ?auto_127613 ) ( TRUCK-AT ?auto_127618 ?auto_127606 ) ( not ( = ?auto_127611 ?auto_127607 ) ) ( not ( = ?auto_127612 ?auto_127613 ) ) ( not ( = ?auto_127611 ?auto_127608 ) ) ( not ( = ?auto_127607 ?auto_127608 ) ) ( not ( = ?auto_127616 ?auto_127612 ) ) ( not ( = ?auto_127616 ?auto_127613 ) ) ( not ( = ?auto_127611 ?auto_127609 ) ) ( not ( = ?auto_127607 ?auto_127609 ) ) ( not ( = ?auto_127608 ?auto_127609 ) ) ( not ( = ?auto_127617 ?auto_127616 ) ) ( not ( = ?auto_127617 ?auto_127612 ) ) ( not ( = ?auto_127617 ?auto_127613 ) ) ( not ( = ?auto_127611 ?auto_127610 ) ) ( not ( = ?auto_127607 ?auto_127610 ) ) ( not ( = ?auto_127608 ?auto_127610 ) ) ( not ( = ?auto_127609 ?auto_127610 ) ) ( not ( = ?auto_127615 ?auto_127617 ) ) ( not ( = ?auto_127615 ?auto_127616 ) ) ( not ( = ?auto_127615 ?auto_127612 ) ) ( not ( = ?auto_127615 ?auto_127613 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_127611 ?auto_127607 ?auto_127608 ?auto_127610 ?auto_127609 ?auto_127606 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_127718 - OBJ
      ?auto_127719 - OBJ
      ?auto_127720 - OBJ
      ?auto_127721 - OBJ
      ?auto_127722 - OBJ
      ?auto_127717 - LOCATION
    )
    :vars
    (
      ?auto_127726 - LOCATION
      ?auto_127725 - CITY
      ?auto_127728 - LOCATION
      ?auto_127727 - LOCATION
      ?auto_127723 - LOCATION
      ?auto_127724 - LOCATION
      ?auto_127729 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_127726 ?auto_127725 ) ( IN-CITY ?auto_127717 ?auto_127725 ) ( not ( = ?auto_127717 ?auto_127726 ) ) ( OBJ-AT ?auto_127720 ?auto_127726 ) ( IN-CITY ?auto_127728 ?auto_127725 ) ( not ( = ?auto_127717 ?auto_127728 ) ) ( OBJ-AT ?auto_127722 ?auto_127728 ) ( IN-CITY ?auto_127727 ?auto_127725 ) ( not ( = ?auto_127717 ?auto_127727 ) ) ( OBJ-AT ?auto_127719 ?auto_127727 ) ( IN-CITY ?auto_127723 ?auto_127725 ) ( not ( = ?auto_127717 ?auto_127723 ) ) ( OBJ-AT ?auto_127718 ?auto_127723 ) ( IN-CITY ?auto_127724 ?auto_127725 ) ( not ( = ?auto_127717 ?auto_127724 ) ) ( OBJ-AT ?auto_127721 ?auto_127724 ) ( TRUCK-AT ?auto_127729 ?auto_127717 ) ( not ( = ?auto_127721 ?auto_127718 ) ) ( not ( = ?auto_127723 ?auto_127724 ) ) ( not ( = ?auto_127721 ?auto_127719 ) ) ( not ( = ?auto_127718 ?auto_127719 ) ) ( not ( = ?auto_127727 ?auto_127723 ) ) ( not ( = ?auto_127727 ?auto_127724 ) ) ( not ( = ?auto_127721 ?auto_127722 ) ) ( not ( = ?auto_127718 ?auto_127722 ) ) ( not ( = ?auto_127719 ?auto_127722 ) ) ( not ( = ?auto_127728 ?auto_127727 ) ) ( not ( = ?auto_127728 ?auto_127723 ) ) ( not ( = ?auto_127728 ?auto_127724 ) ) ( not ( = ?auto_127721 ?auto_127720 ) ) ( not ( = ?auto_127718 ?auto_127720 ) ) ( not ( = ?auto_127719 ?auto_127720 ) ) ( not ( = ?auto_127722 ?auto_127720 ) ) ( not ( = ?auto_127726 ?auto_127728 ) ) ( not ( = ?auto_127726 ?auto_127727 ) ) ( not ( = ?auto_127726 ?auto_127723 ) ) ( not ( = ?auto_127726 ?auto_127724 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_127721 ?auto_127718 ?auto_127719 ?auto_127720 ?auto_127722 ?auto_127717 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_127891 - OBJ
      ?auto_127892 - OBJ
      ?auto_127893 - OBJ
      ?auto_127894 - OBJ
      ?auto_127895 - OBJ
      ?auto_127890 - LOCATION
    )
    :vars
    (
      ?auto_127899 - LOCATION
      ?auto_127898 - CITY
      ?auto_127901 - LOCATION
      ?auto_127900 - LOCATION
      ?auto_127896 - LOCATION
      ?auto_127897 - LOCATION
      ?auto_127902 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_127899 ?auto_127898 ) ( IN-CITY ?auto_127890 ?auto_127898 ) ( not ( = ?auto_127890 ?auto_127899 ) ) ( OBJ-AT ?auto_127893 ?auto_127899 ) ( IN-CITY ?auto_127901 ?auto_127898 ) ( not ( = ?auto_127890 ?auto_127901 ) ) ( OBJ-AT ?auto_127894 ?auto_127901 ) ( IN-CITY ?auto_127900 ?auto_127898 ) ( not ( = ?auto_127890 ?auto_127900 ) ) ( OBJ-AT ?auto_127892 ?auto_127900 ) ( IN-CITY ?auto_127896 ?auto_127898 ) ( not ( = ?auto_127890 ?auto_127896 ) ) ( OBJ-AT ?auto_127891 ?auto_127896 ) ( IN-CITY ?auto_127897 ?auto_127898 ) ( not ( = ?auto_127890 ?auto_127897 ) ) ( OBJ-AT ?auto_127895 ?auto_127897 ) ( TRUCK-AT ?auto_127902 ?auto_127890 ) ( not ( = ?auto_127895 ?auto_127891 ) ) ( not ( = ?auto_127896 ?auto_127897 ) ) ( not ( = ?auto_127895 ?auto_127892 ) ) ( not ( = ?auto_127891 ?auto_127892 ) ) ( not ( = ?auto_127900 ?auto_127896 ) ) ( not ( = ?auto_127900 ?auto_127897 ) ) ( not ( = ?auto_127895 ?auto_127894 ) ) ( not ( = ?auto_127891 ?auto_127894 ) ) ( not ( = ?auto_127892 ?auto_127894 ) ) ( not ( = ?auto_127901 ?auto_127900 ) ) ( not ( = ?auto_127901 ?auto_127896 ) ) ( not ( = ?auto_127901 ?auto_127897 ) ) ( not ( = ?auto_127895 ?auto_127893 ) ) ( not ( = ?auto_127891 ?auto_127893 ) ) ( not ( = ?auto_127892 ?auto_127893 ) ) ( not ( = ?auto_127894 ?auto_127893 ) ) ( not ( = ?auto_127899 ?auto_127901 ) ) ( not ( = ?auto_127899 ?auto_127900 ) ) ( not ( = ?auto_127899 ?auto_127896 ) ) ( not ( = ?auto_127899 ?auto_127897 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_127895 ?auto_127891 ?auto_127892 ?auto_127893 ?auto_127894 ?auto_127890 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_128061 - OBJ
      ?auto_128062 - OBJ
      ?auto_128063 - OBJ
      ?auto_128064 - OBJ
      ?auto_128065 - OBJ
      ?auto_128060 - LOCATION
    )
    :vars
    (
      ?auto_128069 - LOCATION
      ?auto_128068 - CITY
      ?auto_128071 - LOCATION
      ?auto_128070 - LOCATION
      ?auto_128066 - LOCATION
      ?auto_128067 - LOCATION
      ?auto_128072 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_128069 ?auto_128068 ) ( IN-CITY ?auto_128060 ?auto_128068 ) ( not ( = ?auto_128060 ?auto_128069 ) ) ( OBJ-AT ?auto_128065 ?auto_128069 ) ( IN-CITY ?auto_128071 ?auto_128068 ) ( not ( = ?auto_128060 ?auto_128071 ) ) ( OBJ-AT ?auto_128062 ?auto_128071 ) ( IN-CITY ?auto_128070 ?auto_128068 ) ( not ( = ?auto_128060 ?auto_128070 ) ) ( OBJ-AT ?auto_128064 ?auto_128070 ) ( IN-CITY ?auto_128066 ?auto_128068 ) ( not ( = ?auto_128060 ?auto_128066 ) ) ( OBJ-AT ?auto_128061 ?auto_128066 ) ( IN-CITY ?auto_128067 ?auto_128068 ) ( not ( = ?auto_128060 ?auto_128067 ) ) ( OBJ-AT ?auto_128063 ?auto_128067 ) ( TRUCK-AT ?auto_128072 ?auto_128060 ) ( not ( = ?auto_128063 ?auto_128061 ) ) ( not ( = ?auto_128066 ?auto_128067 ) ) ( not ( = ?auto_128063 ?auto_128064 ) ) ( not ( = ?auto_128061 ?auto_128064 ) ) ( not ( = ?auto_128070 ?auto_128066 ) ) ( not ( = ?auto_128070 ?auto_128067 ) ) ( not ( = ?auto_128063 ?auto_128062 ) ) ( not ( = ?auto_128061 ?auto_128062 ) ) ( not ( = ?auto_128064 ?auto_128062 ) ) ( not ( = ?auto_128071 ?auto_128070 ) ) ( not ( = ?auto_128071 ?auto_128066 ) ) ( not ( = ?auto_128071 ?auto_128067 ) ) ( not ( = ?auto_128063 ?auto_128065 ) ) ( not ( = ?auto_128061 ?auto_128065 ) ) ( not ( = ?auto_128064 ?auto_128065 ) ) ( not ( = ?auto_128062 ?auto_128065 ) ) ( not ( = ?auto_128069 ?auto_128071 ) ) ( not ( = ?auto_128069 ?auto_128070 ) ) ( not ( = ?auto_128069 ?auto_128066 ) ) ( not ( = ?auto_128069 ?auto_128067 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_128063 ?auto_128061 ?auto_128064 ?auto_128065 ?auto_128062 ?auto_128060 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_128116 - OBJ
      ?auto_128117 - OBJ
      ?auto_128118 - OBJ
      ?auto_128119 - OBJ
      ?auto_128120 - OBJ
      ?auto_128115 - LOCATION
    )
    :vars
    (
      ?auto_128124 - LOCATION
      ?auto_128123 - CITY
      ?auto_128126 - LOCATION
      ?auto_128125 - LOCATION
      ?auto_128121 - LOCATION
      ?auto_128122 - LOCATION
      ?auto_128127 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_128124 ?auto_128123 ) ( IN-CITY ?auto_128115 ?auto_128123 ) ( not ( = ?auto_128115 ?auto_128124 ) ) ( OBJ-AT ?auto_128119 ?auto_128124 ) ( IN-CITY ?auto_128126 ?auto_128123 ) ( not ( = ?auto_128115 ?auto_128126 ) ) ( OBJ-AT ?auto_128117 ?auto_128126 ) ( IN-CITY ?auto_128125 ?auto_128123 ) ( not ( = ?auto_128115 ?auto_128125 ) ) ( OBJ-AT ?auto_128120 ?auto_128125 ) ( IN-CITY ?auto_128121 ?auto_128123 ) ( not ( = ?auto_128115 ?auto_128121 ) ) ( OBJ-AT ?auto_128116 ?auto_128121 ) ( IN-CITY ?auto_128122 ?auto_128123 ) ( not ( = ?auto_128115 ?auto_128122 ) ) ( OBJ-AT ?auto_128118 ?auto_128122 ) ( TRUCK-AT ?auto_128127 ?auto_128115 ) ( not ( = ?auto_128118 ?auto_128116 ) ) ( not ( = ?auto_128121 ?auto_128122 ) ) ( not ( = ?auto_128118 ?auto_128120 ) ) ( not ( = ?auto_128116 ?auto_128120 ) ) ( not ( = ?auto_128125 ?auto_128121 ) ) ( not ( = ?auto_128125 ?auto_128122 ) ) ( not ( = ?auto_128118 ?auto_128117 ) ) ( not ( = ?auto_128116 ?auto_128117 ) ) ( not ( = ?auto_128120 ?auto_128117 ) ) ( not ( = ?auto_128126 ?auto_128125 ) ) ( not ( = ?auto_128126 ?auto_128121 ) ) ( not ( = ?auto_128126 ?auto_128122 ) ) ( not ( = ?auto_128118 ?auto_128119 ) ) ( not ( = ?auto_128116 ?auto_128119 ) ) ( not ( = ?auto_128120 ?auto_128119 ) ) ( not ( = ?auto_128117 ?auto_128119 ) ) ( not ( = ?auto_128124 ?auto_128126 ) ) ( not ( = ?auto_128124 ?auto_128125 ) ) ( not ( = ?auto_128124 ?auto_128121 ) ) ( not ( = ?auto_128124 ?auto_128122 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_128118 ?auto_128116 ?auto_128120 ?auto_128119 ?auto_128117 ?auto_128115 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_128288 - OBJ
      ?auto_128289 - OBJ
      ?auto_128290 - OBJ
      ?auto_128291 - OBJ
      ?auto_128292 - OBJ
      ?auto_128287 - LOCATION
    )
    :vars
    (
      ?auto_128296 - LOCATION
      ?auto_128295 - CITY
      ?auto_128298 - LOCATION
      ?auto_128297 - LOCATION
      ?auto_128293 - LOCATION
      ?auto_128294 - LOCATION
      ?auto_128299 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_128296 ?auto_128295 ) ( IN-CITY ?auto_128287 ?auto_128295 ) ( not ( = ?auto_128287 ?auto_128296 ) ) ( OBJ-AT ?auto_128292 ?auto_128296 ) ( IN-CITY ?auto_128298 ?auto_128295 ) ( not ( = ?auto_128287 ?auto_128298 ) ) ( OBJ-AT ?auto_128289 ?auto_128298 ) ( IN-CITY ?auto_128297 ?auto_128295 ) ( not ( = ?auto_128287 ?auto_128297 ) ) ( OBJ-AT ?auto_128290 ?auto_128297 ) ( IN-CITY ?auto_128293 ?auto_128295 ) ( not ( = ?auto_128287 ?auto_128293 ) ) ( OBJ-AT ?auto_128288 ?auto_128293 ) ( IN-CITY ?auto_128294 ?auto_128295 ) ( not ( = ?auto_128287 ?auto_128294 ) ) ( OBJ-AT ?auto_128291 ?auto_128294 ) ( TRUCK-AT ?auto_128299 ?auto_128287 ) ( not ( = ?auto_128291 ?auto_128288 ) ) ( not ( = ?auto_128293 ?auto_128294 ) ) ( not ( = ?auto_128291 ?auto_128290 ) ) ( not ( = ?auto_128288 ?auto_128290 ) ) ( not ( = ?auto_128297 ?auto_128293 ) ) ( not ( = ?auto_128297 ?auto_128294 ) ) ( not ( = ?auto_128291 ?auto_128289 ) ) ( not ( = ?auto_128288 ?auto_128289 ) ) ( not ( = ?auto_128290 ?auto_128289 ) ) ( not ( = ?auto_128298 ?auto_128297 ) ) ( not ( = ?auto_128298 ?auto_128293 ) ) ( not ( = ?auto_128298 ?auto_128294 ) ) ( not ( = ?auto_128291 ?auto_128292 ) ) ( not ( = ?auto_128288 ?auto_128292 ) ) ( not ( = ?auto_128290 ?auto_128292 ) ) ( not ( = ?auto_128289 ?auto_128292 ) ) ( not ( = ?auto_128296 ?auto_128298 ) ) ( not ( = ?auto_128296 ?auto_128297 ) ) ( not ( = ?auto_128296 ?auto_128293 ) ) ( not ( = ?auto_128296 ?auto_128294 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_128291 ?auto_128288 ?auto_128290 ?auto_128292 ?auto_128289 ?auto_128287 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_128343 - OBJ
      ?auto_128344 - OBJ
      ?auto_128345 - OBJ
      ?auto_128346 - OBJ
      ?auto_128347 - OBJ
      ?auto_128342 - LOCATION
    )
    :vars
    (
      ?auto_128351 - LOCATION
      ?auto_128350 - CITY
      ?auto_128353 - LOCATION
      ?auto_128352 - LOCATION
      ?auto_128348 - LOCATION
      ?auto_128349 - LOCATION
      ?auto_128354 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_128351 ?auto_128350 ) ( IN-CITY ?auto_128342 ?auto_128350 ) ( not ( = ?auto_128342 ?auto_128351 ) ) ( OBJ-AT ?auto_128346 ?auto_128351 ) ( IN-CITY ?auto_128353 ?auto_128350 ) ( not ( = ?auto_128342 ?auto_128353 ) ) ( OBJ-AT ?auto_128344 ?auto_128353 ) ( IN-CITY ?auto_128352 ?auto_128350 ) ( not ( = ?auto_128342 ?auto_128352 ) ) ( OBJ-AT ?auto_128345 ?auto_128352 ) ( IN-CITY ?auto_128348 ?auto_128350 ) ( not ( = ?auto_128342 ?auto_128348 ) ) ( OBJ-AT ?auto_128343 ?auto_128348 ) ( IN-CITY ?auto_128349 ?auto_128350 ) ( not ( = ?auto_128342 ?auto_128349 ) ) ( OBJ-AT ?auto_128347 ?auto_128349 ) ( TRUCK-AT ?auto_128354 ?auto_128342 ) ( not ( = ?auto_128347 ?auto_128343 ) ) ( not ( = ?auto_128348 ?auto_128349 ) ) ( not ( = ?auto_128347 ?auto_128345 ) ) ( not ( = ?auto_128343 ?auto_128345 ) ) ( not ( = ?auto_128352 ?auto_128348 ) ) ( not ( = ?auto_128352 ?auto_128349 ) ) ( not ( = ?auto_128347 ?auto_128344 ) ) ( not ( = ?auto_128343 ?auto_128344 ) ) ( not ( = ?auto_128345 ?auto_128344 ) ) ( not ( = ?auto_128353 ?auto_128352 ) ) ( not ( = ?auto_128353 ?auto_128348 ) ) ( not ( = ?auto_128353 ?auto_128349 ) ) ( not ( = ?auto_128347 ?auto_128346 ) ) ( not ( = ?auto_128343 ?auto_128346 ) ) ( not ( = ?auto_128345 ?auto_128346 ) ) ( not ( = ?auto_128344 ?auto_128346 ) ) ( not ( = ?auto_128351 ?auto_128353 ) ) ( not ( = ?auto_128351 ?auto_128352 ) ) ( not ( = ?auto_128351 ?auto_128348 ) ) ( not ( = ?auto_128351 ?auto_128349 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_128347 ?auto_128343 ?auto_128345 ?auto_128346 ?auto_128344 ?auto_128342 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_128571 - OBJ
      ?auto_128572 - OBJ
      ?auto_128573 - OBJ
      ?auto_128574 - OBJ
      ?auto_128575 - OBJ
      ?auto_128570 - LOCATION
    )
    :vars
    (
      ?auto_128579 - LOCATION
      ?auto_128578 - CITY
      ?auto_128581 - LOCATION
      ?auto_128580 - LOCATION
      ?auto_128576 - LOCATION
      ?auto_128577 - LOCATION
      ?auto_128582 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_128579 ?auto_128578 ) ( IN-CITY ?auto_128570 ?auto_128578 ) ( not ( = ?auto_128570 ?auto_128579 ) ) ( OBJ-AT ?auto_128573 ?auto_128579 ) ( IN-CITY ?auto_128581 ?auto_128578 ) ( not ( = ?auto_128570 ?auto_128581 ) ) ( OBJ-AT ?auto_128572 ?auto_128581 ) ( IN-CITY ?auto_128580 ?auto_128578 ) ( not ( = ?auto_128570 ?auto_128580 ) ) ( OBJ-AT ?auto_128575 ?auto_128580 ) ( IN-CITY ?auto_128576 ?auto_128578 ) ( not ( = ?auto_128570 ?auto_128576 ) ) ( OBJ-AT ?auto_128571 ?auto_128576 ) ( IN-CITY ?auto_128577 ?auto_128578 ) ( not ( = ?auto_128570 ?auto_128577 ) ) ( OBJ-AT ?auto_128574 ?auto_128577 ) ( TRUCK-AT ?auto_128582 ?auto_128570 ) ( not ( = ?auto_128574 ?auto_128571 ) ) ( not ( = ?auto_128576 ?auto_128577 ) ) ( not ( = ?auto_128574 ?auto_128575 ) ) ( not ( = ?auto_128571 ?auto_128575 ) ) ( not ( = ?auto_128580 ?auto_128576 ) ) ( not ( = ?auto_128580 ?auto_128577 ) ) ( not ( = ?auto_128574 ?auto_128572 ) ) ( not ( = ?auto_128571 ?auto_128572 ) ) ( not ( = ?auto_128575 ?auto_128572 ) ) ( not ( = ?auto_128581 ?auto_128580 ) ) ( not ( = ?auto_128581 ?auto_128576 ) ) ( not ( = ?auto_128581 ?auto_128577 ) ) ( not ( = ?auto_128574 ?auto_128573 ) ) ( not ( = ?auto_128571 ?auto_128573 ) ) ( not ( = ?auto_128575 ?auto_128573 ) ) ( not ( = ?auto_128572 ?auto_128573 ) ) ( not ( = ?auto_128579 ?auto_128581 ) ) ( not ( = ?auto_128579 ?auto_128580 ) ) ( not ( = ?auto_128579 ?auto_128576 ) ) ( not ( = ?auto_128579 ?auto_128577 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_128574 ?auto_128571 ?auto_128575 ?auto_128573 ?auto_128572 ?auto_128570 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_128685 - OBJ
      ?auto_128686 - OBJ
      ?auto_128687 - OBJ
      ?auto_128688 - OBJ
      ?auto_128689 - OBJ
      ?auto_128684 - LOCATION
    )
    :vars
    (
      ?auto_128693 - LOCATION
      ?auto_128692 - CITY
      ?auto_128695 - LOCATION
      ?auto_128694 - LOCATION
      ?auto_128690 - LOCATION
      ?auto_128691 - LOCATION
      ?auto_128696 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_128693 ?auto_128692 ) ( IN-CITY ?auto_128684 ?auto_128692 ) ( not ( = ?auto_128684 ?auto_128693 ) ) ( OBJ-AT ?auto_128687 ?auto_128693 ) ( IN-CITY ?auto_128695 ?auto_128692 ) ( not ( = ?auto_128684 ?auto_128695 ) ) ( OBJ-AT ?auto_128686 ?auto_128695 ) ( IN-CITY ?auto_128694 ?auto_128692 ) ( not ( = ?auto_128684 ?auto_128694 ) ) ( OBJ-AT ?auto_128688 ?auto_128694 ) ( IN-CITY ?auto_128690 ?auto_128692 ) ( not ( = ?auto_128684 ?auto_128690 ) ) ( OBJ-AT ?auto_128685 ?auto_128690 ) ( IN-CITY ?auto_128691 ?auto_128692 ) ( not ( = ?auto_128684 ?auto_128691 ) ) ( OBJ-AT ?auto_128689 ?auto_128691 ) ( TRUCK-AT ?auto_128696 ?auto_128684 ) ( not ( = ?auto_128689 ?auto_128685 ) ) ( not ( = ?auto_128690 ?auto_128691 ) ) ( not ( = ?auto_128689 ?auto_128688 ) ) ( not ( = ?auto_128685 ?auto_128688 ) ) ( not ( = ?auto_128694 ?auto_128690 ) ) ( not ( = ?auto_128694 ?auto_128691 ) ) ( not ( = ?auto_128689 ?auto_128686 ) ) ( not ( = ?auto_128685 ?auto_128686 ) ) ( not ( = ?auto_128688 ?auto_128686 ) ) ( not ( = ?auto_128695 ?auto_128694 ) ) ( not ( = ?auto_128695 ?auto_128690 ) ) ( not ( = ?auto_128695 ?auto_128691 ) ) ( not ( = ?auto_128689 ?auto_128687 ) ) ( not ( = ?auto_128685 ?auto_128687 ) ) ( not ( = ?auto_128688 ?auto_128687 ) ) ( not ( = ?auto_128686 ?auto_128687 ) ) ( not ( = ?auto_128693 ?auto_128695 ) ) ( not ( = ?auto_128693 ?auto_128694 ) ) ( not ( = ?auto_128693 ?auto_128690 ) ) ( not ( = ?auto_128693 ?auto_128691 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_128689 ?auto_128685 ?auto_128688 ?auto_128687 ?auto_128686 ?auto_128684 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_129088 - OBJ
      ?auto_129089 - OBJ
      ?auto_129090 - OBJ
      ?auto_129091 - OBJ
      ?auto_129092 - OBJ
      ?auto_129087 - LOCATION
    )
    :vars
    (
      ?auto_129096 - LOCATION
      ?auto_129095 - CITY
      ?auto_129098 - LOCATION
      ?auto_129097 - LOCATION
      ?auto_129093 - LOCATION
      ?auto_129094 - LOCATION
      ?auto_129099 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_129096 ?auto_129095 ) ( IN-CITY ?auto_129087 ?auto_129095 ) ( not ( = ?auto_129087 ?auto_129096 ) ) ( OBJ-AT ?auto_129089 ?auto_129096 ) ( IN-CITY ?auto_129098 ?auto_129095 ) ( not ( = ?auto_129087 ?auto_129098 ) ) ( OBJ-AT ?auto_129092 ?auto_129098 ) ( IN-CITY ?auto_129097 ?auto_129095 ) ( not ( = ?auto_129087 ?auto_129097 ) ) ( OBJ-AT ?auto_129091 ?auto_129097 ) ( IN-CITY ?auto_129093 ?auto_129095 ) ( not ( = ?auto_129087 ?auto_129093 ) ) ( OBJ-AT ?auto_129088 ?auto_129093 ) ( IN-CITY ?auto_129094 ?auto_129095 ) ( not ( = ?auto_129087 ?auto_129094 ) ) ( OBJ-AT ?auto_129090 ?auto_129094 ) ( TRUCK-AT ?auto_129099 ?auto_129087 ) ( not ( = ?auto_129090 ?auto_129088 ) ) ( not ( = ?auto_129093 ?auto_129094 ) ) ( not ( = ?auto_129090 ?auto_129091 ) ) ( not ( = ?auto_129088 ?auto_129091 ) ) ( not ( = ?auto_129097 ?auto_129093 ) ) ( not ( = ?auto_129097 ?auto_129094 ) ) ( not ( = ?auto_129090 ?auto_129092 ) ) ( not ( = ?auto_129088 ?auto_129092 ) ) ( not ( = ?auto_129091 ?auto_129092 ) ) ( not ( = ?auto_129098 ?auto_129097 ) ) ( not ( = ?auto_129098 ?auto_129093 ) ) ( not ( = ?auto_129098 ?auto_129094 ) ) ( not ( = ?auto_129090 ?auto_129089 ) ) ( not ( = ?auto_129088 ?auto_129089 ) ) ( not ( = ?auto_129091 ?auto_129089 ) ) ( not ( = ?auto_129092 ?auto_129089 ) ) ( not ( = ?auto_129096 ?auto_129098 ) ) ( not ( = ?auto_129096 ?auto_129097 ) ) ( not ( = ?auto_129096 ?auto_129093 ) ) ( not ( = ?auto_129096 ?auto_129094 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_129090 ?auto_129088 ?auto_129091 ?auto_129089 ?auto_129092 ?auto_129087 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_129143 - OBJ
      ?auto_129144 - OBJ
      ?auto_129145 - OBJ
      ?auto_129146 - OBJ
      ?auto_129147 - OBJ
      ?auto_129142 - LOCATION
    )
    :vars
    (
      ?auto_129151 - LOCATION
      ?auto_129150 - CITY
      ?auto_129153 - LOCATION
      ?auto_129152 - LOCATION
      ?auto_129148 - LOCATION
      ?auto_129149 - LOCATION
      ?auto_129154 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_129151 ?auto_129150 ) ( IN-CITY ?auto_129142 ?auto_129150 ) ( not ( = ?auto_129142 ?auto_129151 ) ) ( OBJ-AT ?auto_129144 ?auto_129151 ) ( IN-CITY ?auto_129153 ?auto_129150 ) ( not ( = ?auto_129142 ?auto_129153 ) ) ( OBJ-AT ?auto_129146 ?auto_129153 ) ( IN-CITY ?auto_129152 ?auto_129150 ) ( not ( = ?auto_129142 ?auto_129152 ) ) ( OBJ-AT ?auto_129147 ?auto_129152 ) ( IN-CITY ?auto_129148 ?auto_129150 ) ( not ( = ?auto_129142 ?auto_129148 ) ) ( OBJ-AT ?auto_129143 ?auto_129148 ) ( IN-CITY ?auto_129149 ?auto_129150 ) ( not ( = ?auto_129142 ?auto_129149 ) ) ( OBJ-AT ?auto_129145 ?auto_129149 ) ( TRUCK-AT ?auto_129154 ?auto_129142 ) ( not ( = ?auto_129145 ?auto_129143 ) ) ( not ( = ?auto_129148 ?auto_129149 ) ) ( not ( = ?auto_129145 ?auto_129147 ) ) ( not ( = ?auto_129143 ?auto_129147 ) ) ( not ( = ?auto_129152 ?auto_129148 ) ) ( not ( = ?auto_129152 ?auto_129149 ) ) ( not ( = ?auto_129145 ?auto_129146 ) ) ( not ( = ?auto_129143 ?auto_129146 ) ) ( not ( = ?auto_129147 ?auto_129146 ) ) ( not ( = ?auto_129153 ?auto_129152 ) ) ( not ( = ?auto_129153 ?auto_129148 ) ) ( not ( = ?auto_129153 ?auto_129149 ) ) ( not ( = ?auto_129145 ?auto_129144 ) ) ( not ( = ?auto_129143 ?auto_129144 ) ) ( not ( = ?auto_129147 ?auto_129144 ) ) ( not ( = ?auto_129146 ?auto_129144 ) ) ( not ( = ?auto_129151 ?auto_129153 ) ) ( not ( = ?auto_129151 ?auto_129152 ) ) ( not ( = ?auto_129151 ?auto_129148 ) ) ( not ( = ?auto_129151 ?auto_129149 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_129145 ?auto_129143 ?auto_129147 ?auto_129144 ?auto_129146 ?auto_129142 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_129672 - OBJ
      ?auto_129673 - OBJ
      ?auto_129674 - OBJ
      ?auto_129675 - OBJ
      ?auto_129676 - OBJ
      ?auto_129671 - LOCATION
    )
    :vars
    (
      ?auto_129680 - LOCATION
      ?auto_129679 - CITY
      ?auto_129682 - LOCATION
      ?auto_129681 - LOCATION
      ?auto_129677 - LOCATION
      ?auto_129678 - LOCATION
      ?auto_129683 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_129680 ?auto_129679 ) ( IN-CITY ?auto_129671 ?auto_129679 ) ( not ( = ?auto_129671 ?auto_129680 ) ) ( OBJ-AT ?auto_129673 ?auto_129680 ) ( IN-CITY ?auto_129682 ?auto_129679 ) ( not ( = ?auto_129671 ?auto_129682 ) ) ( OBJ-AT ?auto_129676 ?auto_129682 ) ( IN-CITY ?auto_129681 ?auto_129679 ) ( not ( = ?auto_129671 ?auto_129681 ) ) ( OBJ-AT ?auto_129674 ?auto_129681 ) ( IN-CITY ?auto_129677 ?auto_129679 ) ( not ( = ?auto_129671 ?auto_129677 ) ) ( OBJ-AT ?auto_129672 ?auto_129677 ) ( IN-CITY ?auto_129678 ?auto_129679 ) ( not ( = ?auto_129671 ?auto_129678 ) ) ( OBJ-AT ?auto_129675 ?auto_129678 ) ( TRUCK-AT ?auto_129683 ?auto_129671 ) ( not ( = ?auto_129675 ?auto_129672 ) ) ( not ( = ?auto_129677 ?auto_129678 ) ) ( not ( = ?auto_129675 ?auto_129674 ) ) ( not ( = ?auto_129672 ?auto_129674 ) ) ( not ( = ?auto_129681 ?auto_129677 ) ) ( not ( = ?auto_129681 ?auto_129678 ) ) ( not ( = ?auto_129675 ?auto_129676 ) ) ( not ( = ?auto_129672 ?auto_129676 ) ) ( not ( = ?auto_129674 ?auto_129676 ) ) ( not ( = ?auto_129682 ?auto_129681 ) ) ( not ( = ?auto_129682 ?auto_129677 ) ) ( not ( = ?auto_129682 ?auto_129678 ) ) ( not ( = ?auto_129675 ?auto_129673 ) ) ( not ( = ?auto_129672 ?auto_129673 ) ) ( not ( = ?auto_129674 ?auto_129673 ) ) ( not ( = ?auto_129676 ?auto_129673 ) ) ( not ( = ?auto_129680 ?auto_129682 ) ) ( not ( = ?auto_129680 ?auto_129681 ) ) ( not ( = ?auto_129680 ?auto_129677 ) ) ( not ( = ?auto_129680 ?auto_129678 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_129675 ?auto_129672 ?auto_129674 ?auto_129673 ?auto_129676 ?auto_129671 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_129845 - OBJ
      ?auto_129846 - OBJ
      ?auto_129847 - OBJ
      ?auto_129848 - OBJ
      ?auto_129849 - OBJ
      ?auto_129844 - LOCATION
    )
    :vars
    (
      ?auto_129853 - LOCATION
      ?auto_129852 - CITY
      ?auto_129855 - LOCATION
      ?auto_129854 - LOCATION
      ?auto_129850 - LOCATION
      ?auto_129851 - LOCATION
      ?auto_129856 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_129853 ?auto_129852 ) ( IN-CITY ?auto_129844 ?auto_129852 ) ( not ( = ?auto_129844 ?auto_129853 ) ) ( OBJ-AT ?auto_129846 ?auto_129853 ) ( IN-CITY ?auto_129855 ?auto_129852 ) ( not ( = ?auto_129844 ?auto_129855 ) ) ( OBJ-AT ?auto_129848 ?auto_129855 ) ( IN-CITY ?auto_129854 ?auto_129852 ) ( not ( = ?auto_129844 ?auto_129854 ) ) ( OBJ-AT ?auto_129847 ?auto_129854 ) ( IN-CITY ?auto_129850 ?auto_129852 ) ( not ( = ?auto_129844 ?auto_129850 ) ) ( OBJ-AT ?auto_129845 ?auto_129850 ) ( IN-CITY ?auto_129851 ?auto_129852 ) ( not ( = ?auto_129844 ?auto_129851 ) ) ( OBJ-AT ?auto_129849 ?auto_129851 ) ( TRUCK-AT ?auto_129856 ?auto_129844 ) ( not ( = ?auto_129849 ?auto_129845 ) ) ( not ( = ?auto_129850 ?auto_129851 ) ) ( not ( = ?auto_129849 ?auto_129847 ) ) ( not ( = ?auto_129845 ?auto_129847 ) ) ( not ( = ?auto_129854 ?auto_129850 ) ) ( not ( = ?auto_129854 ?auto_129851 ) ) ( not ( = ?auto_129849 ?auto_129848 ) ) ( not ( = ?auto_129845 ?auto_129848 ) ) ( not ( = ?auto_129847 ?auto_129848 ) ) ( not ( = ?auto_129855 ?auto_129854 ) ) ( not ( = ?auto_129855 ?auto_129850 ) ) ( not ( = ?auto_129855 ?auto_129851 ) ) ( not ( = ?auto_129849 ?auto_129846 ) ) ( not ( = ?auto_129845 ?auto_129846 ) ) ( not ( = ?auto_129847 ?auto_129846 ) ) ( not ( = ?auto_129848 ?auto_129846 ) ) ( not ( = ?auto_129853 ?auto_129855 ) ) ( not ( = ?auto_129853 ?auto_129854 ) ) ( not ( = ?auto_129853 ?auto_129850 ) ) ( not ( = ?auto_129853 ?auto_129851 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_129849 ?auto_129845 ?auto_129847 ?auto_129846 ?auto_129848 ?auto_129844 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_130015 - OBJ
      ?auto_130016 - OBJ
      ?auto_130017 - OBJ
      ?auto_130018 - OBJ
      ?auto_130019 - OBJ
      ?auto_130014 - LOCATION
    )
    :vars
    (
      ?auto_130023 - LOCATION
      ?auto_130022 - CITY
      ?auto_130025 - LOCATION
      ?auto_130024 - LOCATION
      ?auto_130020 - LOCATION
      ?auto_130021 - LOCATION
      ?auto_130026 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_130023 ?auto_130022 ) ( IN-CITY ?auto_130014 ?auto_130022 ) ( not ( = ?auto_130014 ?auto_130023 ) ) ( OBJ-AT ?auto_130016 ?auto_130023 ) ( IN-CITY ?auto_130025 ?auto_130022 ) ( not ( = ?auto_130014 ?auto_130025 ) ) ( OBJ-AT ?auto_130017 ?auto_130025 ) ( IN-CITY ?auto_130024 ?auto_130022 ) ( not ( = ?auto_130014 ?auto_130024 ) ) ( OBJ-AT ?auto_130019 ?auto_130024 ) ( IN-CITY ?auto_130020 ?auto_130022 ) ( not ( = ?auto_130014 ?auto_130020 ) ) ( OBJ-AT ?auto_130015 ?auto_130020 ) ( IN-CITY ?auto_130021 ?auto_130022 ) ( not ( = ?auto_130014 ?auto_130021 ) ) ( OBJ-AT ?auto_130018 ?auto_130021 ) ( TRUCK-AT ?auto_130026 ?auto_130014 ) ( not ( = ?auto_130018 ?auto_130015 ) ) ( not ( = ?auto_130020 ?auto_130021 ) ) ( not ( = ?auto_130018 ?auto_130019 ) ) ( not ( = ?auto_130015 ?auto_130019 ) ) ( not ( = ?auto_130024 ?auto_130020 ) ) ( not ( = ?auto_130024 ?auto_130021 ) ) ( not ( = ?auto_130018 ?auto_130017 ) ) ( not ( = ?auto_130015 ?auto_130017 ) ) ( not ( = ?auto_130019 ?auto_130017 ) ) ( not ( = ?auto_130025 ?auto_130024 ) ) ( not ( = ?auto_130025 ?auto_130020 ) ) ( not ( = ?auto_130025 ?auto_130021 ) ) ( not ( = ?auto_130018 ?auto_130016 ) ) ( not ( = ?auto_130015 ?auto_130016 ) ) ( not ( = ?auto_130019 ?auto_130016 ) ) ( not ( = ?auto_130017 ?auto_130016 ) ) ( not ( = ?auto_130023 ?auto_130025 ) ) ( not ( = ?auto_130023 ?auto_130024 ) ) ( not ( = ?auto_130023 ?auto_130020 ) ) ( not ( = ?auto_130023 ?auto_130021 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_130018 ?auto_130015 ?auto_130019 ?auto_130016 ?auto_130017 ?auto_130014 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_130129 - OBJ
      ?auto_130130 - OBJ
      ?auto_130131 - OBJ
      ?auto_130132 - OBJ
      ?auto_130133 - OBJ
      ?auto_130128 - LOCATION
    )
    :vars
    (
      ?auto_130137 - LOCATION
      ?auto_130136 - CITY
      ?auto_130139 - LOCATION
      ?auto_130138 - LOCATION
      ?auto_130134 - LOCATION
      ?auto_130135 - LOCATION
      ?auto_130140 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_130137 ?auto_130136 ) ( IN-CITY ?auto_130128 ?auto_130136 ) ( not ( = ?auto_130128 ?auto_130137 ) ) ( OBJ-AT ?auto_130130 ?auto_130137 ) ( IN-CITY ?auto_130139 ?auto_130136 ) ( not ( = ?auto_130128 ?auto_130139 ) ) ( OBJ-AT ?auto_130131 ?auto_130139 ) ( IN-CITY ?auto_130138 ?auto_130136 ) ( not ( = ?auto_130128 ?auto_130138 ) ) ( OBJ-AT ?auto_130132 ?auto_130138 ) ( IN-CITY ?auto_130134 ?auto_130136 ) ( not ( = ?auto_130128 ?auto_130134 ) ) ( OBJ-AT ?auto_130129 ?auto_130134 ) ( IN-CITY ?auto_130135 ?auto_130136 ) ( not ( = ?auto_130128 ?auto_130135 ) ) ( OBJ-AT ?auto_130133 ?auto_130135 ) ( TRUCK-AT ?auto_130140 ?auto_130128 ) ( not ( = ?auto_130133 ?auto_130129 ) ) ( not ( = ?auto_130134 ?auto_130135 ) ) ( not ( = ?auto_130133 ?auto_130132 ) ) ( not ( = ?auto_130129 ?auto_130132 ) ) ( not ( = ?auto_130138 ?auto_130134 ) ) ( not ( = ?auto_130138 ?auto_130135 ) ) ( not ( = ?auto_130133 ?auto_130131 ) ) ( not ( = ?auto_130129 ?auto_130131 ) ) ( not ( = ?auto_130132 ?auto_130131 ) ) ( not ( = ?auto_130139 ?auto_130138 ) ) ( not ( = ?auto_130139 ?auto_130134 ) ) ( not ( = ?auto_130139 ?auto_130135 ) ) ( not ( = ?auto_130133 ?auto_130130 ) ) ( not ( = ?auto_130129 ?auto_130130 ) ) ( not ( = ?auto_130132 ?auto_130130 ) ) ( not ( = ?auto_130131 ?auto_130130 ) ) ( not ( = ?auto_130137 ?auto_130139 ) ) ( not ( = ?auto_130137 ?auto_130138 ) ) ( not ( = ?auto_130137 ?auto_130134 ) ) ( not ( = ?auto_130137 ?auto_130135 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_130133 ?auto_130129 ?auto_130132 ?auto_130130 ?auto_130131 ?auto_130128 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_130890 - OBJ
      ?auto_130891 - OBJ
      ?auto_130892 - OBJ
      ?auto_130893 - OBJ
      ?auto_130894 - OBJ
      ?auto_130889 - LOCATION
    )
    :vars
    (
      ?auto_130898 - LOCATION
      ?auto_130897 - CITY
      ?auto_130900 - LOCATION
      ?auto_130899 - LOCATION
      ?auto_130895 - LOCATION
      ?auto_130896 - LOCATION
      ?auto_130901 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_130898 ?auto_130897 ) ( IN-CITY ?auto_130889 ?auto_130897 ) ( not ( = ?auto_130889 ?auto_130898 ) ) ( OBJ-AT ?auto_130894 ?auto_130898 ) ( IN-CITY ?auto_130900 ?auto_130897 ) ( not ( = ?auto_130889 ?auto_130900 ) ) ( OBJ-AT ?auto_130893 ?auto_130900 ) ( IN-CITY ?auto_130899 ?auto_130897 ) ( not ( = ?auto_130889 ?auto_130899 ) ) ( OBJ-AT ?auto_130890 ?auto_130899 ) ( IN-CITY ?auto_130895 ?auto_130897 ) ( not ( = ?auto_130889 ?auto_130895 ) ) ( OBJ-AT ?auto_130892 ?auto_130895 ) ( IN-CITY ?auto_130896 ?auto_130897 ) ( not ( = ?auto_130889 ?auto_130896 ) ) ( OBJ-AT ?auto_130891 ?auto_130896 ) ( TRUCK-AT ?auto_130901 ?auto_130889 ) ( not ( = ?auto_130891 ?auto_130892 ) ) ( not ( = ?auto_130895 ?auto_130896 ) ) ( not ( = ?auto_130891 ?auto_130890 ) ) ( not ( = ?auto_130892 ?auto_130890 ) ) ( not ( = ?auto_130899 ?auto_130895 ) ) ( not ( = ?auto_130899 ?auto_130896 ) ) ( not ( = ?auto_130891 ?auto_130893 ) ) ( not ( = ?auto_130892 ?auto_130893 ) ) ( not ( = ?auto_130890 ?auto_130893 ) ) ( not ( = ?auto_130900 ?auto_130899 ) ) ( not ( = ?auto_130900 ?auto_130895 ) ) ( not ( = ?auto_130900 ?auto_130896 ) ) ( not ( = ?auto_130891 ?auto_130894 ) ) ( not ( = ?auto_130892 ?auto_130894 ) ) ( not ( = ?auto_130890 ?auto_130894 ) ) ( not ( = ?auto_130893 ?auto_130894 ) ) ( not ( = ?auto_130898 ?auto_130900 ) ) ( not ( = ?auto_130898 ?auto_130899 ) ) ( not ( = ?auto_130898 ?auto_130895 ) ) ( not ( = ?auto_130898 ?auto_130896 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_130891 ?auto_130892 ?auto_130890 ?auto_130894 ?auto_130893 ?auto_130889 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_130945 - OBJ
      ?auto_130946 - OBJ
      ?auto_130947 - OBJ
      ?auto_130948 - OBJ
      ?auto_130949 - OBJ
      ?auto_130944 - LOCATION
    )
    :vars
    (
      ?auto_130953 - LOCATION
      ?auto_130952 - CITY
      ?auto_130955 - LOCATION
      ?auto_130954 - LOCATION
      ?auto_130950 - LOCATION
      ?auto_130951 - LOCATION
      ?auto_130956 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_130953 ?auto_130952 ) ( IN-CITY ?auto_130944 ?auto_130952 ) ( not ( = ?auto_130944 ?auto_130953 ) ) ( OBJ-AT ?auto_130948 ?auto_130953 ) ( IN-CITY ?auto_130955 ?auto_130952 ) ( not ( = ?auto_130944 ?auto_130955 ) ) ( OBJ-AT ?auto_130949 ?auto_130955 ) ( IN-CITY ?auto_130954 ?auto_130952 ) ( not ( = ?auto_130944 ?auto_130954 ) ) ( OBJ-AT ?auto_130945 ?auto_130954 ) ( IN-CITY ?auto_130950 ?auto_130952 ) ( not ( = ?auto_130944 ?auto_130950 ) ) ( OBJ-AT ?auto_130947 ?auto_130950 ) ( IN-CITY ?auto_130951 ?auto_130952 ) ( not ( = ?auto_130944 ?auto_130951 ) ) ( OBJ-AT ?auto_130946 ?auto_130951 ) ( TRUCK-AT ?auto_130956 ?auto_130944 ) ( not ( = ?auto_130946 ?auto_130947 ) ) ( not ( = ?auto_130950 ?auto_130951 ) ) ( not ( = ?auto_130946 ?auto_130945 ) ) ( not ( = ?auto_130947 ?auto_130945 ) ) ( not ( = ?auto_130954 ?auto_130950 ) ) ( not ( = ?auto_130954 ?auto_130951 ) ) ( not ( = ?auto_130946 ?auto_130949 ) ) ( not ( = ?auto_130947 ?auto_130949 ) ) ( not ( = ?auto_130945 ?auto_130949 ) ) ( not ( = ?auto_130955 ?auto_130954 ) ) ( not ( = ?auto_130955 ?auto_130950 ) ) ( not ( = ?auto_130955 ?auto_130951 ) ) ( not ( = ?auto_130946 ?auto_130948 ) ) ( not ( = ?auto_130947 ?auto_130948 ) ) ( not ( = ?auto_130945 ?auto_130948 ) ) ( not ( = ?auto_130949 ?auto_130948 ) ) ( not ( = ?auto_130953 ?auto_130955 ) ) ( not ( = ?auto_130953 ?auto_130954 ) ) ( not ( = ?auto_130953 ?auto_130950 ) ) ( not ( = ?auto_130953 ?auto_130951 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_130946 ?auto_130947 ?auto_130945 ?auto_130948 ?auto_130949 ?auto_130944 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_131117 - OBJ
      ?auto_131118 - OBJ
      ?auto_131119 - OBJ
      ?auto_131120 - OBJ
      ?auto_131121 - OBJ
      ?auto_131116 - LOCATION
    )
    :vars
    (
      ?auto_131125 - LOCATION
      ?auto_131124 - CITY
      ?auto_131127 - LOCATION
      ?auto_131126 - LOCATION
      ?auto_131122 - LOCATION
      ?auto_131123 - LOCATION
      ?auto_131128 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_131125 ?auto_131124 ) ( IN-CITY ?auto_131116 ?auto_131124 ) ( not ( = ?auto_131116 ?auto_131125 ) ) ( OBJ-AT ?auto_131121 ?auto_131125 ) ( IN-CITY ?auto_131127 ?auto_131124 ) ( not ( = ?auto_131116 ?auto_131127 ) ) ( OBJ-AT ?auto_131119 ?auto_131127 ) ( IN-CITY ?auto_131126 ?auto_131124 ) ( not ( = ?auto_131116 ?auto_131126 ) ) ( OBJ-AT ?auto_131117 ?auto_131126 ) ( IN-CITY ?auto_131122 ?auto_131124 ) ( not ( = ?auto_131116 ?auto_131122 ) ) ( OBJ-AT ?auto_131120 ?auto_131122 ) ( IN-CITY ?auto_131123 ?auto_131124 ) ( not ( = ?auto_131116 ?auto_131123 ) ) ( OBJ-AT ?auto_131118 ?auto_131123 ) ( TRUCK-AT ?auto_131128 ?auto_131116 ) ( not ( = ?auto_131118 ?auto_131120 ) ) ( not ( = ?auto_131122 ?auto_131123 ) ) ( not ( = ?auto_131118 ?auto_131117 ) ) ( not ( = ?auto_131120 ?auto_131117 ) ) ( not ( = ?auto_131126 ?auto_131122 ) ) ( not ( = ?auto_131126 ?auto_131123 ) ) ( not ( = ?auto_131118 ?auto_131119 ) ) ( not ( = ?auto_131120 ?auto_131119 ) ) ( not ( = ?auto_131117 ?auto_131119 ) ) ( not ( = ?auto_131127 ?auto_131126 ) ) ( not ( = ?auto_131127 ?auto_131122 ) ) ( not ( = ?auto_131127 ?auto_131123 ) ) ( not ( = ?auto_131118 ?auto_131121 ) ) ( not ( = ?auto_131120 ?auto_131121 ) ) ( not ( = ?auto_131117 ?auto_131121 ) ) ( not ( = ?auto_131119 ?auto_131121 ) ) ( not ( = ?auto_131125 ?auto_131127 ) ) ( not ( = ?auto_131125 ?auto_131126 ) ) ( not ( = ?auto_131125 ?auto_131122 ) ) ( not ( = ?auto_131125 ?auto_131123 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_131118 ?auto_131120 ?auto_131117 ?auto_131121 ?auto_131119 ?auto_131116 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_131172 - OBJ
      ?auto_131173 - OBJ
      ?auto_131174 - OBJ
      ?auto_131175 - OBJ
      ?auto_131176 - OBJ
      ?auto_131171 - LOCATION
    )
    :vars
    (
      ?auto_131180 - LOCATION
      ?auto_131179 - CITY
      ?auto_131182 - LOCATION
      ?auto_131181 - LOCATION
      ?auto_131177 - LOCATION
      ?auto_131178 - LOCATION
      ?auto_131183 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_131180 ?auto_131179 ) ( IN-CITY ?auto_131171 ?auto_131179 ) ( not ( = ?auto_131171 ?auto_131180 ) ) ( OBJ-AT ?auto_131175 ?auto_131180 ) ( IN-CITY ?auto_131182 ?auto_131179 ) ( not ( = ?auto_131171 ?auto_131182 ) ) ( OBJ-AT ?auto_131174 ?auto_131182 ) ( IN-CITY ?auto_131181 ?auto_131179 ) ( not ( = ?auto_131171 ?auto_131181 ) ) ( OBJ-AT ?auto_131172 ?auto_131181 ) ( IN-CITY ?auto_131177 ?auto_131179 ) ( not ( = ?auto_131171 ?auto_131177 ) ) ( OBJ-AT ?auto_131176 ?auto_131177 ) ( IN-CITY ?auto_131178 ?auto_131179 ) ( not ( = ?auto_131171 ?auto_131178 ) ) ( OBJ-AT ?auto_131173 ?auto_131178 ) ( TRUCK-AT ?auto_131183 ?auto_131171 ) ( not ( = ?auto_131173 ?auto_131176 ) ) ( not ( = ?auto_131177 ?auto_131178 ) ) ( not ( = ?auto_131173 ?auto_131172 ) ) ( not ( = ?auto_131176 ?auto_131172 ) ) ( not ( = ?auto_131181 ?auto_131177 ) ) ( not ( = ?auto_131181 ?auto_131178 ) ) ( not ( = ?auto_131173 ?auto_131174 ) ) ( not ( = ?auto_131176 ?auto_131174 ) ) ( not ( = ?auto_131172 ?auto_131174 ) ) ( not ( = ?auto_131182 ?auto_131181 ) ) ( not ( = ?auto_131182 ?auto_131177 ) ) ( not ( = ?auto_131182 ?auto_131178 ) ) ( not ( = ?auto_131173 ?auto_131175 ) ) ( not ( = ?auto_131176 ?auto_131175 ) ) ( not ( = ?auto_131172 ?auto_131175 ) ) ( not ( = ?auto_131174 ?auto_131175 ) ) ( not ( = ?auto_131180 ?auto_131182 ) ) ( not ( = ?auto_131180 ?auto_131181 ) ) ( not ( = ?auto_131180 ?auto_131177 ) ) ( not ( = ?auto_131180 ?auto_131178 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_131173 ?auto_131176 ?auto_131172 ?auto_131175 ?auto_131174 ?auto_131171 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_131342 - OBJ
      ?auto_131343 - OBJ
      ?auto_131344 - OBJ
      ?auto_131345 - OBJ
      ?auto_131346 - OBJ
      ?auto_131341 - LOCATION
    )
    :vars
    (
      ?auto_131350 - LOCATION
      ?auto_131349 - CITY
      ?auto_131352 - LOCATION
      ?auto_131351 - LOCATION
      ?auto_131347 - LOCATION
      ?auto_131348 - LOCATION
      ?auto_131353 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_131350 ?auto_131349 ) ( IN-CITY ?auto_131341 ?auto_131349 ) ( not ( = ?auto_131341 ?auto_131350 ) ) ( OBJ-AT ?auto_131344 ?auto_131350 ) ( IN-CITY ?auto_131352 ?auto_131349 ) ( not ( = ?auto_131341 ?auto_131352 ) ) ( OBJ-AT ?auto_131346 ?auto_131352 ) ( IN-CITY ?auto_131351 ?auto_131349 ) ( not ( = ?auto_131341 ?auto_131351 ) ) ( OBJ-AT ?auto_131342 ?auto_131351 ) ( IN-CITY ?auto_131347 ?auto_131349 ) ( not ( = ?auto_131341 ?auto_131347 ) ) ( OBJ-AT ?auto_131345 ?auto_131347 ) ( IN-CITY ?auto_131348 ?auto_131349 ) ( not ( = ?auto_131341 ?auto_131348 ) ) ( OBJ-AT ?auto_131343 ?auto_131348 ) ( TRUCK-AT ?auto_131353 ?auto_131341 ) ( not ( = ?auto_131343 ?auto_131345 ) ) ( not ( = ?auto_131347 ?auto_131348 ) ) ( not ( = ?auto_131343 ?auto_131342 ) ) ( not ( = ?auto_131345 ?auto_131342 ) ) ( not ( = ?auto_131351 ?auto_131347 ) ) ( not ( = ?auto_131351 ?auto_131348 ) ) ( not ( = ?auto_131343 ?auto_131346 ) ) ( not ( = ?auto_131345 ?auto_131346 ) ) ( not ( = ?auto_131342 ?auto_131346 ) ) ( not ( = ?auto_131352 ?auto_131351 ) ) ( not ( = ?auto_131352 ?auto_131347 ) ) ( not ( = ?auto_131352 ?auto_131348 ) ) ( not ( = ?auto_131343 ?auto_131344 ) ) ( not ( = ?auto_131345 ?auto_131344 ) ) ( not ( = ?auto_131342 ?auto_131344 ) ) ( not ( = ?auto_131346 ?auto_131344 ) ) ( not ( = ?auto_131350 ?auto_131352 ) ) ( not ( = ?auto_131350 ?auto_131351 ) ) ( not ( = ?auto_131350 ?auto_131347 ) ) ( not ( = ?auto_131350 ?auto_131348 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_131343 ?auto_131345 ?auto_131342 ?auto_131344 ?auto_131346 ?auto_131341 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_131456 - OBJ
      ?auto_131457 - OBJ
      ?auto_131458 - OBJ
      ?auto_131459 - OBJ
      ?auto_131460 - OBJ
      ?auto_131455 - LOCATION
    )
    :vars
    (
      ?auto_131464 - LOCATION
      ?auto_131463 - CITY
      ?auto_131466 - LOCATION
      ?auto_131465 - LOCATION
      ?auto_131461 - LOCATION
      ?auto_131462 - LOCATION
      ?auto_131467 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_131464 ?auto_131463 ) ( IN-CITY ?auto_131455 ?auto_131463 ) ( not ( = ?auto_131455 ?auto_131464 ) ) ( OBJ-AT ?auto_131458 ?auto_131464 ) ( IN-CITY ?auto_131466 ?auto_131463 ) ( not ( = ?auto_131455 ?auto_131466 ) ) ( OBJ-AT ?auto_131459 ?auto_131466 ) ( IN-CITY ?auto_131465 ?auto_131463 ) ( not ( = ?auto_131455 ?auto_131465 ) ) ( OBJ-AT ?auto_131456 ?auto_131465 ) ( IN-CITY ?auto_131461 ?auto_131463 ) ( not ( = ?auto_131455 ?auto_131461 ) ) ( OBJ-AT ?auto_131460 ?auto_131461 ) ( IN-CITY ?auto_131462 ?auto_131463 ) ( not ( = ?auto_131455 ?auto_131462 ) ) ( OBJ-AT ?auto_131457 ?auto_131462 ) ( TRUCK-AT ?auto_131467 ?auto_131455 ) ( not ( = ?auto_131457 ?auto_131460 ) ) ( not ( = ?auto_131461 ?auto_131462 ) ) ( not ( = ?auto_131457 ?auto_131456 ) ) ( not ( = ?auto_131460 ?auto_131456 ) ) ( not ( = ?auto_131465 ?auto_131461 ) ) ( not ( = ?auto_131465 ?auto_131462 ) ) ( not ( = ?auto_131457 ?auto_131459 ) ) ( not ( = ?auto_131460 ?auto_131459 ) ) ( not ( = ?auto_131456 ?auto_131459 ) ) ( not ( = ?auto_131466 ?auto_131465 ) ) ( not ( = ?auto_131466 ?auto_131461 ) ) ( not ( = ?auto_131466 ?auto_131462 ) ) ( not ( = ?auto_131457 ?auto_131458 ) ) ( not ( = ?auto_131460 ?auto_131458 ) ) ( not ( = ?auto_131456 ?auto_131458 ) ) ( not ( = ?auto_131459 ?auto_131458 ) ) ( not ( = ?auto_131464 ?auto_131466 ) ) ( not ( = ?auto_131464 ?auto_131465 ) ) ( not ( = ?auto_131464 ?auto_131461 ) ) ( not ( = ?auto_131464 ?auto_131462 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_131457 ?auto_131460 ?auto_131456 ?auto_131458 ?auto_131459 ?auto_131455 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_131626 - OBJ
      ?auto_131627 - OBJ
      ?auto_131628 - OBJ
      ?auto_131629 - OBJ
      ?auto_131630 - OBJ
      ?auto_131625 - LOCATION
    )
    :vars
    (
      ?auto_131634 - LOCATION
      ?auto_131633 - CITY
      ?auto_131636 - LOCATION
      ?auto_131635 - LOCATION
      ?auto_131631 - LOCATION
      ?auto_131632 - LOCATION
      ?auto_131637 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_131634 ?auto_131633 ) ( IN-CITY ?auto_131625 ?auto_131633 ) ( not ( = ?auto_131625 ?auto_131634 ) ) ( OBJ-AT ?auto_131630 ?auto_131634 ) ( IN-CITY ?auto_131636 ?auto_131633 ) ( not ( = ?auto_131625 ?auto_131636 ) ) ( OBJ-AT ?auto_131629 ?auto_131636 ) ( IN-CITY ?auto_131635 ?auto_131633 ) ( not ( = ?auto_131625 ?auto_131635 ) ) ( OBJ-AT ?auto_131626 ?auto_131635 ) ( IN-CITY ?auto_131631 ?auto_131633 ) ( not ( = ?auto_131625 ?auto_131631 ) ) ( OBJ-AT ?auto_131627 ?auto_131631 ) ( IN-CITY ?auto_131632 ?auto_131633 ) ( not ( = ?auto_131625 ?auto_131632 ) ) ( OBJ-AT ?auto_131628 ?auto_131632 ) ( TRUCK-AT ?auto_131637 ?auto_131625 ) ( not ( = ?auto_131628 ?auto_131627 ) ) ( not ( = ?auto_131631 ?auto_131632 ) ) ( not ( = ?auto_131628 ?auto_131626 ) ) ( not ( = ?auto_131627 ?auto_131626 ) ) ( not ( = ?auto_131635 ?auto_131631 ) ) ( not ( = ?auto_131635 ?auto_131632 ) ) ( not ( = ?auto_131628 ?auto_131629 ) ) ( not ( = ?auto_131627 ?auto_131629 ) ) ( not ( = ?auto_131626 ?auto_131629 ) ) ( not ( = ?auto_131636 ?auto_131635 ) ) ( not ( = ?auto_131636 ?auto_131631 ) ) ( not ( = ?auto_131636 ?auto_131632 ) ) ( not ( = ?auto_131628 ?auto_131630 ) ) ( not ( = ?auto_131627 ?auto_131630 ) ) ( not ( = ?auto_131626 ?auto_131630 ) ) ( not ( = ?auto_131629 ?auto_131630 ) ) ( not ( = ?auto_131634 ?auto_131636 ) ) ( not ( = ?auto_131634 ?auto_131635 ) ) ( not ( = ?auto_131634 ?auto_131631 ) ) ( not ( = ?auto_131634 ?auto_131632 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_131628 ?auto_131627 ?auto_131626 ?auto_131630 ?auto_131629 ?auto_131625 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_131681 - OBJ
      ?auto_131682 - OBJ
      ?auto_131683 - OBJ
      ?auto_131684 - OBJ
      ?auto_131685 - OBJ
      ?auto_131680 - LOCATION
    )
    :vars
    (
      ?auto_131689 - LOCATION
      ?auto_131688 - CITY
      ?auto_131691 - LOCATION
      ?auto_131690 - LOCATION
      ?auto_131686 - LOCATION
      ?auto_131687 - LOCATION
      ?auto_131692 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_131689 ?auto_131688 ) ( IN-CITY ?auto_131680 ?auto_131688 ) ( not ( = ?auto_131680 ?auto_131689 ) ) ( OBJ-AT ?auto_131684 ?auto_131689 ) ( IN-CITY ?auto_131691 ?auto_131688 ) ( not ( = ?auto_131680 ?auto_131691 ) ) ( OBJ-AT ?auto_131685 ?auto_131691 ) ( IN-CITY ?auto_131690 ?auto_131688 ) ( not ( = ?auto_131680 ?auto_131690 ) ) ( OBJ-AT ?auto_131681 ?auto_131690 ) ( IN-CITY ?auto_131686 ?auto_131688 ) ( not ( = ?auto_131680 ?auto_131686 ) ) ( OBJ-AT ?auto_131682 ?auto_131686 ) ( IN-CITY ?auto_131687 ?auto_131688 ) ( not ( = ?auto_131680 ?auto_131687 ) ) ( OBJ-AT ?auto_131683 ?auto_131687 ) ( TRUCK-AT ?auto_131692 ?auto_131680 ) ( not ( = ?auto_131683 ?auto_131682 ) ) ( not ( = ?auto_131686 ?auto_131687 ) ) ( not ( = ?auto_131683 ?auto_131681 ) ) ( not ( = ?auto_131682 ?auto_131681 ) ) ( not ( = ?auto_131690 ?auto_131686 ) ) ( not ( = ?auto_131690 ?auto_131687 ) ) ( not ( = ?auto_131683 ?auto_131685 ) ) ( not ( = ?auto_131682 ?auto_131685 ) ) ( not ( = ?auto_131681 ?auto_131685 ) ) ( not ( = ?auto_131691 ?auto_131690 ) ) ( not ( = ?auto_131691 ?auto_131686 ) ) ( not ( = ?auto_131691 ?auto_131687 ) ) ( not ( = ?auto_131683 ?auto_131684 ) ) ( not ( = ?auto_131682 ?auto_131684 ) ) ( not ( = ?auto_131681 ?auto_131684 ) ) ( not ( = ?auto_131685 ?auto_131684 ) ) ( not ( = ?auto_131689 ?auto_131691 ) ) ( not ( = ?auto_131689 ?auto_131690 ) ) ( not ( = ?auto_131689 ?auto_131686 ) ) ( not ( = ?auto_131689 ?auto_131687 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_131683 ?auto_131682 ?auto_131681 ?auto_131684 ?auto_131685 ?auto_131680 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_131970 - OBJ
      ?auto_131971 - OBJ
      ?auto_131972 - OBJ
      ?auto_131973 - OBJ
      ?auto_131974 - OBJ
      ?auto_131969 - LOCATION
    )
    :vars
    (
      ?auto_131978 - LOCATION
      ?auto_131977 - CITY
      ?auto_131980 - LOCATION
      ?auto_131979 - LOCATION
      ?auto_131975 - LOCATION
      ?auto_131976 - LOCATION
      ?auto_131981 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_131978 ?auto_131977 ) ( IN-CITY ?auto_131969 ?auto_131977 ) ( not ( = ?auto_131969 ?auto_131978 ) ) ( OBJ-AT ?auto_131974 ?auto_131978 ) ( IN-CITY ?auto_131980 ?auto_131977 ) ( not ( = ?auto_131969 ?auto_131980 ) ) ( OBJ-AT ?auto_131972 ?auto_131980 ) ( IN-CITY ?auto_131979 ?auto_131977 ) ( not ( = ?auto_131969 ?auto_131979 ) ) ( OBJ-AT ?auto_131970 ?auto_131979 ) ( IN-CITY ?auto_131975 ?auto_131977 ) ( not ( = ?auto_131969 ?auto_131975 ) ) ( OBJ-AT ?auto_131971 ?auto_131975 ) ( IN-CITY ?auto_131976 ?auto_131977 ) ( not ( = ?auto_131969 ?auto_131976 ) ) ( OBJ-AT ?auto_131973 ?auto_131976 ) ( TRUCK-AT ?auto_131981 ?auto_131969 ) ( not ( = ?auto_131973 ?auto_131971 ) ) ( not ( = ?auto_131975 ?auto_131976 ) ) ( not ( = ?auto_131973 ?auto_131970 ) ) ( not ( = ?auto_131971 ?auto_131970 ) ) ( not ( = ?auto_131979 ?auto_131975 ) ) ( not ( = ?auto_131979 ?auto_131976 ) ) ( not ( = ?auto_131973 ?auto_131972 ) ) ( not ( = ?auto_131971 ?auto_131972 ) ) ( not ( = ?auto_131970 ?auto_131972 ) ) ( not ( = ?auto_131980 ?auto_131979 ) ) ( not ( = ?auto_131980 ?auto_131975 ) ) ( not ( = ?auto_131980 ?auto_131976 ) ) ( not ( = ?auto_131973 ?auto_131974 ) ) ( not ( = ?auto_131971 ?auto_131974 ) ) ( not ( = ?auto_131970 ?auto_131974 ) ) ( not ( = ?auto_131972 ?auto_131974 ) ) ( not ( = ?auto_131978 ?auto_131980 ) ) ( not ( = ?auto_131978 ?auto_131979 ) ) ( not ( = ?auto_131978 ?auto_131975 ) ) ( not ( = ?auto_131978 ?auto_131976 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_131973 ?auto_131971 ?auto_131970 ?auto_131974 ?auto_131972 ?auto_131969 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_132025 - OBJ
      ?auto_132026 - OBJ
      ?auto_132027 - OBJ
      ?auto_132028 - OBJ
      ?auto_132029 - OBJ
      ?auto_132024 - LOCATION
    )
    :vars
    (
      ?auto_132033 - LOCATION
      ?auto_132032 - CITY
      ?auto_132035 - LOCATION
      ?auto_132034 - LOCATION
      ?auto_132030 - LOCATION
      ?auto_132031 - LOCATION
      ?auto_132036 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_132033 ?auto_132032 ) ( IN-CITY ?auto_132024 ?auto_132032 ) ( not ( = ?auto_132024 ?auto_132033 ) ) ( OBJ-AT ?auto_132028 ?auto_132033 ) ( IN-CITY ?auto_132035 ?auto_132032 ) ( not ( = ?auto_132024 ?auto_132035 ) ) ( OBJ-AT ?auto_132027 ?auto_132035 ) ( IN-CITY ?auto_132034 ?auto_132032 ) ( not ( = ?auto_132024 ?auto_132034 ) ) ( OBJ-AT ?auto_132025 ?auto_132034 ) ( IN-CITY ?auto_132030 ?auto_132032 ) ( not ( = ?auto_132024 ?auto_132030 ) ) ( OBJ-AT ?auto_132026 ?auto_132030 ) ( IN-CITY ?auto_132031 ?auto_132032 ) ( not ( = ?auto_132024 ?auto_132031 ) ) ( OBJ-AT ?auto_132029 ?auto_132031 ) ( TRUCK-AT ?auto_132036 ?auto_132024 ) ( not ( = ?auto_132029 ?auto_132026 ) ) ( not ( = ?auto_132030 ?auto_132031 ) ) ( not ( = ?auto_132029 ?auto_132025 ) ) ( not ( = ?auto_132026 ?auto_132025 ) ) ( not ( = ?auto_132034 ?auto_132030 ) ) ( not ( = ?auto_132034 ?auto_132031 ) ) ( not ( = ?auto_132029 ?auto_132027 ) ) ( not ( = ?auto_132026 ?auto_132027 ) ) ( not ( = ?auto_132025 ?auto_132027 ) ) ( not ( = ?auto_132035 ?auto_132034 ) ) ( not ( = ?auto_132035 ?auto_132030 ) ) ( not ( = ?auto_132035 ?auto_132031 ) ) ( not ( = ?auto_132029 ?auto_132028 ) ) ( not ( = ?auto_132026 ?auto_132028 ) ) ( not ( = ?auto_132025 ?auto_132028 ) ) ( not ( = ?auto_132027 ?auto_132028 ) ) ( not ( = ?auto_132033 ?auto_132035 ) ) ( not ( = ?auto_132033 ?auto_132034 ) ) ( not ( = ?auto_132033 ?auto_132030 ) ) ( not ( = ?auto_132033 ?auto_132031 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_132029 ?auto_132026 ?auto_132025 ?auto_132028 ?auto_132027 ?auto_132024 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_132136 - OBJ
      ?auto_132137 - OBJ
      ?auto_132138 - OBJ
      ?auto_132139 - OBJ
      ?auto_132140 - OBJ
      ?auto_132135 - LOCATION
    )
    :vars
    (
      ?auto_132144 - LOCATION
      ?auto_132143 - CITY
      ?auto_132146 - LOCATION
      ?auto_132145 - LOCATION
      ?auto_132141 - LOCATION
      ?auto_132142 - LOCATION
      ?auto_132147 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_132144 ?auto_132143 ) ( IN-CITY ?auto_132135 ?auto_132143 ) ( not ( = ?auto_132135 ?auto_132144 ) ) ( OBJ-AT ?auto_132138 ?auto_132144 ) ( IN-CITY ?auto_132146 ?auto_132143 ) ( not ( = ?auto_132135 ?auto_132146 ) ) ( OBJ-AT ?auto_132140 ?auto_132146 ) ( IN-CITY ?auto_132145 ?auto_132143 ) ( not ( = ?auto_132135 ?auto_132145 ) ) ( OBJ-AT ?auto_132136 ?auto_132145 ) ( IN-CITY ?auto_132141 ?auto_132143 ) ( not ( = ?auto_132135 ?auto_132141 ) ) ( OBJ-AT ?auto_132137 ?auto_132141 ) ( IN-CITY ?auto_132142 ?auto_132143 ) ( not ( = ?auto_132135 ?auto_132142 ) ) ( OBJ-AT ?auto_132139 ?auto_132142 ) ( TRUCK-AT ?auto_132147 ?auto_132135 ) ( not ( = ?auto_132139 ?auto_132137 ) ) ( not ( = ?auto_132141 ?auto_132142 ) ) ( not ( = ?auto_132139 ?auto_132136 ) ) ( not ( = ?auto_132137 ?auto_132136 ) ) ( not ( = ?auto_132145 ?auto_132141 ) ) ( not ( = ?auto_132145 ?auto_132142 ) ) ( not ( = ?auto_132139 ?auto_132140 ) ) ( not ( = ?auto_132137 ?auto_132140 ) ) ( not ( = ?auto_132136 ?auto_132140 ) ) ( not ( = ?auto_132146 ?auto_132145 ) ) ( not ( = ?auto_132146 ?auto_132141 ) ) ( not ( = ?auto_132146 ?auto_132142 ) ) ( not ( = ?auto_132139 ?auto_132138 ) ) ( not ( = ?auto_132137 ?auto_132138 ) ) ( not ( = ?auto_132136 ?auto_132138 ) ) ( not ( = ?auto_132140 ?auto_132138 ) ) ( not ( = ?auto_132144 ?auto_132146 ) ) ( not ( = ?auto_132144 ?auto_132145 ) ) ( not ( = ?auto_132144 ?auto_132141 ) ) ( not ( = ?auto_132144 ?auto_132142 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_132139 ?auto_132137 ?auto_132136 ?auto_132138 ?auto_132140 ?auto_132135 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_132309 - OBJ
      ?auto_132310 - OBJ
      ?auto_132311 - OBJ
      ?auto_132312 - OBJ
      ?auto_132313 - OBJ
      ?auto_132308 - LOCATION
    )
    :vars
    (
      ?auto_132317 - LOCATION
      ?auto_132316 - CITY
      ?auto_132319 - LOCATION
      ?auto_132318 - LOCATION
      ?auto_132314 - LOCATION
      ?auto_132315 - LOCATION
      ?auto_132320 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_132317 ?auto_132316 ) ( IN-CITY ?auto_132308 ?auto_132316 ) ( not ( = ?auto_132308 ?auto_132317 ) ) ( OBJ-AT ?auto_132311 ?auto_132317 ) ( IN-CITY ?auto_132319 ?auto_132316 ) ( not ( = ?auto_132308 ?auto_132319 ) ) ( OBJ-AT ?auto_132312 ?auto_132319 ) ( IN-CITY ?auto_132318 ?auto_132316 ) ( not ( = ?auto_132308 ?auto_132318 ) ) ( OBJ-AT ?auto_132309 ?auto_132318 ) ( IN-CITY ?auto_132314 ?auto_132316 ) ( not ( = ?auto_132308 ?auto_132314 ) ) ( OBJ-AT ?auto_132310 ?auto_132314 ) ( IN-CITY ?auto_132315 ?auto_132316 ) ( not ( = ?auto_132308 ?auto_132315 ) ) ( OBJ-AT ?auto_132313 ?auto_132315 ) ( TRUCK-AT ?auto_132320 ?auto_132308 ) ( not ( = ?auto_132313 ?auto_132310 ) ) ( not ( = ?auto_132314 ?auto_132315 ) ) ( not ( = ?auto_132313 ?auto_132309 ) ) ( not ( = ?auto_132310 ?auto_132309 ) ) ( not ( = ?auto_132318 ?auto_132314 ) ) ( not ( = ?auto_132318 ?auto_132315 ) ) ( not ( = ?auto_132313 ?auto_132312 ) ) ( not ( = ?auto_132310 ?auto_132312 ) ) ( not ( = ?auto_132309 ?auto_132312 ) ) ( not ( = ?auto_132319 ?auto_132318 ) ) ( not ( = ?auto_132319 ?auto_132314 ) ) ( not ( = ?auto_132319 ?auto_132315 ) ) ( not ( = ?auto_132313 ?auto_132311 ) ) ( not ( = ?auto_132310 ?auto_132311 ) ) ( not ( = ?auto_132309 ?auto_132311 ) ) ( not ( = ?auto_132312 ?auto_132311 ) ) ( not ( = ?auto_132317 ?auto_132319 ) ) ( not ( = ?auto_132317 ?auto_132318 ) ) ( not ( = ?auto_132317 ?auto_132314 ) ) ( not ( = ?auto_132317 ?auto_132315 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_132313 ?auto_132310 ?auto_132309 ?auto_132311 ?auto_132312 ?auto_132308 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_133369 - OBJ
      ?auto_133370 - OBJ
      ?auto_133371 - OBJ
      ?auto_133372 - OBJ
      ?auto_133373 - OBJ
      ?auto_133368 - LOCATION
    )
    :vars
    (
      ?auto_133377 - LOCATION
      ?auto_133376 - CITY
      ?auto_133379 - LOCATION
      ?auto_133378 - LOCATION
      ?auto_133374 - LOCATION
      ?auto_133375 - LOCATION
      ?auto_133380 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_133377 ?auto_133376 ) ( IN-CITY ?auto_133368 ?auto_133376 ) ( not ( = ?auto_133368 ?auto_133377 ) ) ( OBJ-AT ?auto_133373 ?auto_133377 ) ( IN-CITY ?auto_133379 ?auto_133376 ) ( not ( = ?auto_133368 ?auto_133379 ) ) ( OBJ-AT ?auto_133370 ?auto_133379 ) ( IN-CITY ?auto_133378 ?auto_133376 ) ( not ( = ?auto_133368 ?auto_133378 ) ) ( OBJ-AT ?auto_133369 ?auto_133378 ) ( IN-CITY ?auto_133374 ?auto_133376 ) ( not ( = ?auto_133368 ?auto_133374 ) ) ( OBJ-AT ?auto_133372 ?auto_133374 ) ( IN-CITY ?auto_133375 ?auto_133376 ) ( not ( = ?auto_133368 ?auto_133375 ) ) ( OBJ-AT ?auto_133371 ?auto_133375 ) ( TRUCK-AT ?auto_133380 ?auto_133368 ) ( not ( = ?auto_133371 ?auto_133372 ) ) ( not ( = ?auto_133374 ?auto_133375 ) ) ( not ( = ?auto_133371 ?auto_133369 ) ) ( not ( = ?auto_133372 ?auto_133369 ) ) ( not ( = ?auto_133378 ?auto_133374 ) ) ( not ( = ?auto_133378 ?auto_133375 ) ) ( not ( = ?auto_133371 ?auto_133370 ) ) ( not ( = ?auto_133372 ?auto_133370 ) ) ( not ( = ?auto_133369 ?auto_133370 ) ) ( not ( = ?auto_133379 ?auto_133378 ) ) ( not ( = ?auto_133379 ?auto_133374 ) ) ( not ( = ?auto_133379 ?auto_133375 ) ) ( not ( = ?auto_133371 ?auto_133373 ) ) ( not ( = ?auto_133372 ?auto_133373 ) ) ( not ( = ?auto_133369 ?auto_133373 ) ) ( not ( = ?auto_133370 ?auto_133373 ) ) ( not ( = ?auto_133377 ?auto_133379 ) ) ( not ( = ?auto_133377 ?auto_133378 ) ) ( not ( = ?auto_133377 ?auto_133374 ) ) ( not ( = ?auto_133377 ?auto_133375 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_133371 ?auto_133372 ?auto_133369 ?auto_133373 ?auto_133370 ?auto_133368 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_133424 - OBJ
      ?auto_133425 - OBJ
      ?auto_133426 - OBJ
      ?auto_133427 - OBJ
      ?auto_133428 - OBJ
      ?auto_133423 - LOCATION
    )
    :vars
    (
      ?auto_133432 - LOCATION
      ?auto_133431 - CITY
      ?auto_133434 - LOCATION
      ?auto_133433 - LOCATION
      ?auto_133429 - LOCATION
      ?auto_133430 - LOCATION
      ?auto_133435 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_133432 ?auto_133431 ) ( IN-CITY ?auto_133423 ?auto_133431 ) ( not ( = ?auto_133423 ?auto_133432 ) ) ( OBJ-AT ?auto_133427 ?auto_133432 ) ( IN-CITY ?auto_133434 ?auto_133431 ) ( not ( = ?auto_133423 ?auto_133434 ) ) ( OBJ-AT ?auto_133425 ?auto_133434 ) ( IN-CITY ?auto_133433 ?auto_133431 ) ( not ( = ?auto_133423 ?auto_133433 ) ) ( OBJ-AT ?auto_133424 ?auto_133433 ) ( IN-CITY ?auto_133429 ?auto_133431 ) ( not ( = ?auto_133423 ?auto_133429 ) ) ( OBJ-AT ?auto_133428 ?auto_133429 ) ( IN-CITY ?auto_133430 ?auto_133431 ) ( not ( = ?auto_133423 ?auto_133430 ) ) ( OBJ-AT ?auto_133426 ?auto_133430 ) ( TRUCK-AT ?auto_133435 ?auto_133423 ) ( not ( = ?auto_133426 ?auto_133428 ) ) ( not ( = ?auto_133429 ?auto_133430 ) ) ( not ( = ?auto_133426 ?auto_133424 ) ) ( not ( = ?auto_133428 ?auto_133424 ) ) ( not ( = ?auto_133433 ?auto_133429 ) ) ( not ( = ?auto_133433 ?auto_133430 ) ) ( not ( = ?auto_133426 ?auto_133425 ) ) ( not ( = ?auto_133428 ?auto_133425 ) ) ( not ( = ?auto_133424 ?auto_133425 ) ) ( not ( = ?auto_133434 ?auto_133433 ) ) ( not ( = ?auto_133434 ?auto_133429 ) ) ( not ( = ?auto_133434 ?auto_133430 ) ) ( not ( = ?auto_133426 ?auto_133427 ) ) ( not ( = ?auto_133428 ?auto_133427 ) ) ( not ( = ?auto_133424 ?auto_133427 ) ) ( not ( = ?auto_133425 ?auto_133427 ) ) ( not ( = ?auto_133432 ?auto_133434 ) ) ( not ( = ?auto_133432 ?auto_133433 ) ) ( not ( = ?auto_133432 ?auto_133429 ) ) ( not ( = ?auto_133432 ?auto_133430 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_133426 ?auto_133428 ?auto_133424 ?auto_133427 ?auto_133425 ?auto_133423 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_133479 - OBJ
      ?auto_133480 - OBJ
      ?auto_133481 - OBJ
      ?auto_133482 - OBJ
      ?auto_133483 - OBJ
      ?auto_133478 - LOCATION
    )
    :vars
    (
      ?auto_133487 - LOCATION
      ?auto_133486 - CITY
      ?auto_133489 - LOCATION
      ?auto_133488 - LOCATION
      ?auto_133484 - LOCATION
      ?auto_133485 - LOCATION
      ?auto_133490 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_133487 ?auto_133486 ) ( IN-CITY ?auto_133478 ?auto_133486 ) ( not ( = ?auto_133478 ?auto_133487 ) ) ( OBJ-AT ?auto_133483 ?auto_133487 ) ( IN-CITY ?auto_133489 ?auto_133486 ) ( not ( = ?auto_133478 ?auto_133489 ) ) ( OBJ-AT ?auto_133480 ?auto_133489 ) ( IN-CITY ?auto_133488 ?auto_133486 ) ( not ( = ?auto_133478 ?auto_133488 ) ) ( OBJ-AT ?auto_133479 ?auto_133488 ) ( IN-CITY ?auto_133484 ?auto_133486 ) ( not ( = ?auto_133478 ?auto_133484 ) ) ( OBJ-AT ?auto_133481 ?auto_133484 ) ( IN-CITY ?auto_133485 ?auto_133486 ) ( not ( = ?auto_133478 ?auto_133485 ) ) ( OBJ-AT ?auto_133482 ?auto_133485 ) ( TRUCK-AT ?auto_133490 ?auto_133478 ) ( not ( = ?auto_133482 ?auto_133481 ) ) ( not ( = ?auto_133484 ?auto_133485 ) ) ( not ( = ?auto_133482 ?auto_133479 ) ) ( not ( = ?auto_133481 ?auto_133479 ) ) ( not ( = ?auto_133488 ?auto_133484 ) ) ( not ( = ?auto_133488 ?auto_133485 ) ) ( not ( = ?auto_133482 ?auto_133480 ) ) ( not ( = ?auto_133481 ?auto_133480 ) ) ( not ( = ?auto_133479 ?auto_133480 ) ) ( not ( = ?auto_133489 ?auto_133488 ) ) ( not ( = ?auto_133489 ?auto_133484 ) ) ( not ( = ?auto_133489 ?auto_133485 ) ) ( not ( = ?auto_133482 ?auto_133483 ) ) ( not ( = ?auto_133481 ?auto_133483 ) ) ( not ( = ?auto_133479 ?auto_133483 ) ) ( not ( = ?auto_133480 ?auto_133483 ) ) ( not ( = ?auto_133487 ?auto_133489 ) ) ( not ( = ?auto_133487 ?auto_133488 ) ) ( not ( = ?auto_133487 ?auto_133484 ) ) ( not ( = ?auto_133487 ?auto_133485 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_133482 ?auto_133481 ?auto_133479 ?auto_133483 ?auto_133480 ?auto_133478 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_133534 - OBJ
      ?auto_133535 - OBJ
      ?auto_133536 - OBJ
      ?auto_133537 - OBJ
      ?auto_133538 - OBJ
      ?auto_133533 - LOCATION
    )
    :vars
    (
      ?auto_133542 - LOCATION
      ?auto_133541 - CITY
      ?auto_133544 - LOCATION
      ?auto_133543 - LOCATION
      ?auto_133539 - LOCATION
      ?auto_133540 - LOCATION
      ?auto_133545 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_133542 ?auto_133541 ) ( IN-CITY ?auto_133533 ?auto_133541 ) ( not ( = ?auto_133533 ?auto_133542 ) ) ( OBJ-AT ?auto_133537 ?auto_133542 ) ( IN-CITY ?auto_133544 ?auto_133541 ) ( not ( = ?auto_133533 ?auto_133544 ) ) ( OBJ-AT ?auto_133535 ?auto_133544 ) ( IN-CITY ?auto_133543 ?auto_133541 ) ( not ( = ?auto_133533 ?auto_133543 ) ) ( OBJ-AT ?auto_133534 ?auto_133543 ) ( IN-CITY ?auto_133539 ?auto_133541 ) ( not ( = ?auto_133533 ?auto_133539 ) ) ( OBJ-AT ?auto_133536 ?auto_133539 ) ( IN-CITY ?auto_133540 ?auto_133541 ) ( not ( = ?auto_133533 ?auto_133540 ) ) ( OBJ-AT ?auto_133538 ?auto_133540 ) ( TRUCK-AT ?auto_133545 ?auto_133533 ) ( not ( = ?auto_133538 ?auto_133536 ) ) ( not ( = ?auto_133539 ?auto_133540 ) ) ( not ( = ?auto_133538 ?auto_133534 ) ) ( not ( = ?auto_133536 ?auto_133534 ) ) ( not ( = ?auto_133543 ?auto_133539 ) ) ( not ( = ?auto_133543 ?auto_133540 ) ) ( not ( = ?auto_133538 ?auto_133535 ) ) ( not ( = ?auto_133536 ?auto_133535 ) ) ( not ( = ?auto_133534 ?auto_133535 ) ) ( not ( = ?auto_133544 ?auto_133543 ) ) ( not ( = ?auto_133544 ?auto_133539 ) ) ( not ( = ?auto_133544 ?auto_133540 ) ) ( not ( = ?auto_133538 ?auto_133537 ) ) ( not ( = ?auto_133536 ?auto_133537 ) ) ( not ( = ?auto_133534 ?auto_133537 ) ) ( not ( = ?auto_133535 ?auto_133537 ) ) ( not ( = ?auto_133542 ?auto_133544 ) ) ( not ( = ?auto_133542 ?auto_133543 ) ) ( not ( = ?auto_133542 ?auto_133539 ) ) ( not ( = ?auto_133542 ?auto_133540 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_133538 ?auto_133536 ?auto_133534 ?auto_133537 ?auto_133535 ?auto_133533 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_133879 - OBJ
      ?auto_133880 - OBJ
      ?auto_133881 - OBJ
      ?auto_133882 - OBJ
      ?auto_133883 - OBJ
      ?auto_133878 - LOCATION
    )
    :vars
    (
      ?auto_133887 - LOCATION
      ?auto_133886 - CITY
      ?auto_133889 - LOCATION
      ?auto_133888 - LOCATION
      ?auto_133884 - LOCATION
      ?auto_133885 - LOCATION
      ?auto_133890 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_133887 ?auto_133886 ) ( IN-CITY ?auto_133878 ?auto_133886 ) ( not ( = ?auto_133878 ?auto_133887 ) ) ( OBJ-AT ?auto_133881 ?auto_133887 ) ( IN-CITY ?auto_133889 ?auto_133886 ) ( not ( = ?auto_133878 ?auto_133889 ) ) ( OBJ-AT ?auto_133880 ?auto_133889 ) ( IN-CITY ?auto_133888 ?auto_133886 ) ( not ( = ?auto_133878 ?auto_133888 ) ) ( OBJ-AT ?auto_133879 ?auto_133888 ) ( IN-CITY ?auto_133884 ?auto_133886 ) ( not ( = ?auto_133878 ?auto_133884 ) ) ( OBJ-AT ?auto_133883 ?auto_133884 ) ( IN-CITY ?auto_133885 ?auto_133886 ) ( not ( = ?auto_133878 ?auto_133885 ) ) ( OBJ-AT ?auto_133882 ?auto_133885 ) ( TRUCK-AT ?auto_133890 ?auto_133878 ) ( not ( = ?auto_133882 ?auto_133883 ) ) ( not ( = ?auto_133884 ?auto_133885 ) ) ( not ( = ?auto_133882 ?auto_133879 ) ) ( not ( = ?auto_133883 ?auto_133879 ) ) ( not ( = ?auto_133888 ?auto_133884 ) ) ( not ( = ?auto_133888 ?auto_133885 ) ) ( not ( = ?auto_133882 ?auto_133880 ) ) ( not ( = ?auto_133883 ?auto_133880 ) ) ( not ( = ?auto_133879 ?auto_133880 ) ) ( not ( = ?auto_133889 ?auto_133888 ) ) ( not ( = ?auto_133889 ?auto_133884 ) ) ( not ( = ?auto_133889 ?auto_133885 ) ) ( not ( = ?auto_133882 ?auto_133881 ) ) ( not ( = ?auto_133883 ?auto_133881 ) ) ( not ( = ?auto_133879 ?auto_133881 ) ) ( not ( = ?auto_133880 ?auto_133881 ) ) ( not ( = ?auto_133887 ?auto_133889 ) ) ( not ( = ?auto_133887 ?auto_133888 ) ) ( not ( = ?auto_133887 ?auto_133884 ) ) ( not ( = ?auto_133887 ?auto_133885 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_133882 ?auto_133883 ?auto_133879 ?auto_133881 ?auto_133880 ?auto_133878 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_133934 - OBJ
      ?auto_133935 - OBJ
      ?auto_133936 - OBJ
      ?auto_133937 - OBJ
      ?auto_133938 - OBJ
      ?auto_133933 - LOCATION
    )
    :vars
    (
      ?auto_133942 - LOCATION
      ?auto_133941 - CITY
      ?auto_133944 - LOCATION
      ?auto_133943 - LOCATION
      ?auto_133939 - LOCATION
      ?auto_133940 - LOCATION
      ?auto_133945 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_133942 ?auto_133941 ) ( IN-CITY ?auto_133933 ?auto_133941 ) ( not ( = ?auto_133933 ?auto_133942 ) ) ( OBJ-AT ?auto_133936 ?auto_133942 ) ( IN-CITY ?auto_133944 ?auto_133941 ) ( not ( = ?auto_133933 ?auto_133944 ) ) ( OBJ-AT ?auto_133935 ?auto_133944 ) ( IN-CITY ?auto_133943 ?auto_133941 ) ( not ( = ?auto_133933 ?auto_133943 ) ) ( OBJ-AT ?auto_133934 ?auto_133943 ) ( IN-CITY ?auto_133939 ?auto_133941 ) ( not ( = ?auto_133933 ?auto_133939 ) ) ( OBJ-AT ?auto_133937 ?auto_133939 ) ( IN-CITY ?auto_133940 ?auto_133941 ) ( not ( = ?auto_133933 ?auto_133940 ) ) ( OBJ-AT ?auto_133938 ?auto_133940 ) ( TRUCK-AT ?auto_133945 ?auto_133933 ) ( not ( = ?auto_133938 ?auto_133937 ) ) ( not ( = ?auto_133939 ?auto_133940 ) ) ( not ( = ?auto_133938 ?auto_133934 ) ) ( not ( = ?auto_133937 ?auto_133934 ) ) ( not ( = ?auto_133943 ?auto_133939 ) ) ( not ( = ?auto_133943 ?auto_133940 ) ) ( not ( = ?auto_133938 ?auto_133935 ) ) ( not ( = ?auto_133937 ?auto_133935 ) ) ( not ( = ?auto_133934 ?auto_133935 ) ) ( not ( = ?auto_133944 ?auto_133943 ) ) ( not ( = ?auto_133944 ?auto_133939 ) ) ( not ( = ?auto_133944 ?auto_133940 ) ) ( not ( = ?auto_133938 ?auto_133936 ) ) ( not ( = ?auto_133937 ?auto_133936 ) ) ( not ( = ?auto_133934 ?auto_133936 ) ) ( not ( = ?auto_133935 ?auto_133936 ) ) ( not ( = ?auto_133942 ?auto_133944 ) ) ( not ( = ?auto_133942 ?auto_133943 ) ) ( not ( = ?auto_133942 ?auto_133939 ) ) ( not ( = ?auto_133942 ?auto_133940 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_133938 ?auto_133937 ?auto_133934 ?auto_133936 ?auto_133935 ?auto_133933 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_134337 - OBJ
      ?auto_134338 - OBJ
      ?auto_134339 - OBJ
      ?auto_134340 - OBJ
      ?auto_134341 - OBJ
      ?auto_134336 - LOCATION
    )
    :vars
    (
      ?auto_134345 - LOCATION
      ?auto_134344 - CITY
      ?auto_134347 - LOCATION
      ?auto_134346 - LOCATION
      ?auto_134342 - LOCATION
      ?auto_134343 - LOCATION
      ?auto_134348 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134345 ?auto_134344 ) ( IN-CITY ?auto_134336 ?auto_134344 ) ( not ( = ?auto_134336 ?auto_134345 ) ) ( OBJ-AT ?auto_134338 ?auto_134345 ) ( IN-CITY ?auto_134347 ?auto_134344 ) ( not ( = ?auto_134336 ?auto_134347 ) ) ( OBJ-AT ?auto_134341 ?auto_134347 ) ( IN-CITY ?auto_134346 ?auto_134344 ) ( not ( = ?auto_134336 ?auto_134346 ) ) ( OBJ-AT ?auto_134337 ?auto_134346 ) ( IN-CITY ?auto_134342 ?auto_134344 ) ( not ( = ?auto_134336 ?auto_134342 ) ) ( OBJ-AT ?auto_134340 ?auto_134342 ) ( IN-CITY ?auto_134343 ?auto_134344 ) ( not ( = ?auto_134336 ?auto_134343 ) ) ( OBJ-AT ?auto_134339 ?auto_134343 ) ( TRUCK-AT ?auto_134348 ?auto_134336 ) ( not ( = ?auto_134339 ?auto_134340 ) ) ( not ( = ?auto_134342 ?auto_134343 ) ) ( not ( = ?auto_134339 ?auto_134337 ) ) ( not ( = ?auto_134340 ?auto_134337 ) ) ( not ( = ?auto_134346 ?auto_134342 ) ) ( not ( = ?auto_134346 ?auto_134343 ) ) ( not ( = ?auto_134339 ?auto_134341 ) ) ( not ( = ?auto_134340 ?auto_134341 ) ) ( not ( = ?auto_134337 ?auto_134341 ) ) ( not ( = ?auto_134347 ?auto_134346 ) ) ( not ( = ?auto_134347 ?auto_134342 ) ) ( not ( = ?auto_134347 ?auto_134343 ) ) ( not ( = ?auto_134339 ?auto_134338 ) ) ( not ( = ?auto_134340 ?auto_134338 ) ) ( not ( = ?auto_134337 ?auto_134338 ) ) ( not ( = ?auto_134341 ?auto_134338 ) ) ( not ( = ?auto_134345 ?auto_134347 ) ) ( not ( = ?auto_134345 ?auto_134346 ) ) ( not ( = ?auto_134345 ?auto_134342 ) ) ( not ( = ?auto_134345 ?auto_134343 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_134339 ?auto_134340 ?auto_134337 ?auto_134338 ?auto_134341 ?auto_134336 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_134451 - OBJ
      ?auto_134452 - OBJ
      ?auto_134453 - OBJ
      ?auto_134454 - OBJ
      ?auto_134455 - OBJ
      ?auto_134450 - LOCATION
    )
    :vars
    (
      ?auto_134459 - LOCATION
      ?auto_134458 - CITY
      ?auto_134461 - LOCATION
      ?auto_134460 - LOCATION
      ?auto_134456 - LOCATION
      ?auto_134457 - LOCATION
      ?auto_134462 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134459 ?auto_134458 ) ( IN-CITY ?auto_134450 ?auto_134458 ) ( not ( = ?auto_134450 ?auto_134459 ) ) ( OBJ-AT ?auto_134452 ?auto_134459 ) ( IN-CITY ?auto_134461 ?auto_134458 ) ( not ( = ?auto_134450 ?auto_134461 ) ) ( OBJ-AT ?auto_134454 ?auto_134461 ) ( IN-CITY ?auto_134460 ?auto_134458 ) ( not ( = ?auto_134450 ?auto_134460 ) ) ( OBJ-AT ?auto_134451 ?auto_134460 ) ( IN-CITY ?auto_134456 ?auto_134458 ) ( not ( = ?auto_134450 ?auto_134456 ) ) ( OBJ-AT ?auto_134455 ?auto_134456 ) ( IN-CITY ?auto_134457 ?auto_134458 ) ( not ( = ?auto_134450 ?auto_134457 ) ) ( OBJ-AT ?auto_134453 ?auto_134457 ) ( TRUCK-AT ?auto_134462 ?auto_134450 ) ( not ( = ?auto_134453 ?auto_134455 ) ) ( not ( = ?auto_134456 ?auto_134457 ) ) ( not ( = ?auto_134453 ?auto_134451 ) ) ( not ( = ?auto_134455 ?auto_134451 ) ) ( not ( = ?auto_134460 ?auto_134456 ) ) ( not ( = ?auto_134460 ?auto_134457 ) ) ( not ( = ?auto_134453 ?auto_134454 ) ) ( not ( = ?auto_134455 ?auto_134454 ) ) ( not ( = ?auto_134451 ?auto_134454 ) ) ( not ( = ?auto_134461 ?auto_134460 ) ) ( not ( = ?auto_134461 ?auto_134456 ) ) ( not ( = ?auto_134461 ?auto_134457 ) ) ( not ( = ?auto_134453 ?auto_134452 ) ) ( not ( = ?auto_134455 ?auto_134452 ) ) ( not ( = ?auto_134451 ?auto_134452 ) ) ( not ( = ?auto_134454 ?auto_134452 ) ) ( not ( = ?auto_134459 ?auto_134461 ) ) ( not ( = ?auto_134459 ?auto_134460 ) ) ( not ( = ?auto_134459 ?auto_134456 ) ) ( not ( = ?auto_134459 ?auto_134457 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_134453 ?auto_134455 ?auto_134451 ?auto_134452 ?auto_134454 ?auto_134450 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_134621 - OBJ
      ?auto_134622 - OBJ
      ?auto_134623 - OBJ
      ?auto_134624 - OBJ
      ?auto_134625 - OBJ
      ?auto_134620 - LOCATION
    )
    :vars
    (
      ?auto_134629 - LOCATION
      ?auto_134628 - CITY
      ?auto_134631 - LOCATION
      ?auto_134630 - LOCATION
      ?auto_134626 - LOCATION
      ?auto_134627 - LOCATION
      ?auto_134632 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134629 ?auto_134628 ) ( IN-CITY ?auto_134620 ?auto_134628 ) ( not ( = ?auto_134620 ?auto_134629 ) ) ( OBJ-AT ?auto_134622 ?auto_134629 ) ( IN-CITY ?auto_134631 ?auto_134628 ) ( not ( = ?auto_134620 ?auto_134631 ) ) ( OBJ-AT ?auto_134625 ?auto_134631 ) ( IN-CITY ?auto_134630 ?auto_134628 ) ( not ( = ?auto_134620 ?auto_134630 ) ) ( OBJ-AT ?auto_134621 ?auto_134630 ) ( IN-CITY ?auto_134626 ?auto_134628 ) ( not ( = ?auto_134620 ?auto_134626 ) ) ( OBJ-AT ?auto_134623 ?auto_134626 ) ( IN-CITY ?auto_134627 ?auto_134628 ) ( not ( = ?auto_134620 ?auto_134627 ) ) ( OBJ-AT ?auto_134624 ?auto_134627 ) ( TRUCK-AT ?auto_134632 ?auto_134620 ) ( not ( = ?auto_134624 ?auto_134623 ) ) ( not ( = ?auto_134626 ?auto_134627 ) ) ( not ( = ?auto_134624 ?auto_134621 ) ) ( not ( = ?auto_134623 ?auto_134621 ) ) ( not ( = ?auto_134630 ?auto_134626 ) ) ( not ( = ?auto_134630 ?auto_134627 ) ) ( not ( = ?auto_134624 ?auto_134625 ) ) ( not ( = ?auto_134623 ?auto_134625 ) ) ( not ( = ?auto_134621 ?auto_134625 ) ) ( not ( = ?auto_134631 ?auto_134630 ) ) ( not ( = ?auto_134631 ?auto_134626 ) ) ( not ( = ?auto_134631 ?auto_134627 ) ) ( not ( = ?auto_134624 ?auto_134622 ) ) ( not ( = ?auto_134623 ?auto_134622 ) ) ( not ( = ?auto_134621 ?auto_134622 ) ) ( not ( = ?auto_134625 ?auto_134622 ) ) ( not ( = ?auto_134629 ?auto_134631 ) ) ( not ( = ?auto_134629 ?auto_134630 ) ) ( not ( = ?auto_134629 ?auto_134626 ) ) ( not ( = ?auto_134629 ?auto_134627 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_134624 ?auto_134623 ?auto_134621 ?auto_134622 ?auto_134625 ?auto_134620 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_134794 - OBJ
      ?auto_134795 - OBJ
      ?auto_134796 - OBJ
      ?auto_134797 - OBJ
      ?auto_134798 - OBJ
      ?auto_134793 - LOCATION
    )
    :vars
    (
      ?auto_134802 - LOCATION
      ?auto_134801 - CITY
      ?auto_134804 - LOCATION
      ?auto_134803 - LOCATION
      ?auto_134799 - LOCATION
      ?auto_134800 - LOCATION
      ?auto_134805 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134802 ?auto_134801 ) ( IN-CITY ?auto_134793 ?auto_134801 ) ( not ( = ?auto_134793 ?auto_134802 ) ) ( OBJ-AT ?auto_134795 ?auto_134802 ) ( IN-CITY ?auto_134804 ?auto_134801 ) ( not ( = ?auto_134793 ?auto_134804 ) ) ( OBJ-AT ?auto_134797 ?auto_134804 ) ( IN-CITY ?auto_134803 ?auto_134801 ) ( not ( = ?auto_134793 ?auto_134803 ) ) ( OBJ-AT ?auto_134794 ?auto_134803 ) ( IN-CITY ?auto_134799 ?auto_134801 ) ( not ( = ?auto_134793 ?auto_134799 ) ) ( OBJ-AT ?auto_134796 ?auto_134799 ) ( IN-CITY ?auto_134800 ?auto_134801 ) ( not ( = ?auto_134793 ?auto_134800 ) ) ( OBJ-AT ?auto_134798 ?auto_134800 ) ( TRUCK-AT ?auto_134805 ?auto_134793 ) ( not ( = ?auto_134798 ?auto_134796 ) ) ( not ( = ?auto_134799 ?auto_134800 ) ) ( not ( = ?auto_134798 ?auto_134794 ) ) ( not ( = ?auto_134796 ?auto_134794 ) ) ( not ( = ?auto_134803 ?auto_134799 ) ) ( not ( = ?auto_134803 ?auto_134800 ) ) ( not ( = ?auto_134798 ?auto_134797 ) ) ( not ( = ?auto_134796 ?auto_134797 ) ) ( not ( = ?auto_134794 ?auto_134797 ) ) ( not ( = ?auto_134804 ?auto_134803 ) ) ( not ( = ?auto_134804 ?auto_134799 ) ) ( not ( = ?auto_134804 ?auto_134800 ) ) ( not ( = ?auto_134798 ?auto_134795 ) ) ( not ( = ?auto_134796 ?auto_134795 ) ) ( not ( = ?auto_134794 ?auto_134795 ) ) ( not ( = ?auto_134797 ?auto_134795 ) ) ( not ( = ?auto_134802 ?auto_134804 ) ) ( not ( = ?auto_134802 ?auto_134803 ) ) ( not ( = ?auto_134802 ?auto_134799 ) ) ( not ( = ?auto_134802 ?auto_134800 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_134798 ?auto_134796 ?auto_134794 ?auto_134795 ?auto_134797 ?auto_134793 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_135323 - OBJ
      ?auto_135324 - OBJ
      ?auto_135325 - OBJ
      ?auto_135326 - OBJ
      ?auto_135327 - OBJ
      ?auto_135322 - LOCATION
    )
    :vars
    (
      ?auto_135331 - LOCATION
      ?auto_135330 - CITY
      ?auto_135333 - LOCATION
      ?auto_135332 - LOCATION
      ?auto_135328 - LOCATION
      ?auto_135329 - LOCATION
      ?auto_135334 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135331 ?auto_135330 ) ( IN-CITY ?auto_135322 ?auto_135330 ) ( not ( = ?auto_135322 ?auto_135331 ) ) ( OBJ-AT ?auto_135324 ?auto_135331 ) ( IN-CITY ?auto_135333 ?auto_135330 ) ( not ( = ?auto_135322 ?auto_135333 ) ) ( OBJ-AT ?auto_135325 ?auto_135333 ) ( IN-CITY ?auto_135332 ?auto_135330 ) ( not ( = ?auto_135322 ?auto_135332 ) ) ( OBJ-AT ?auto_135323 ?auto_135332 ) ( IN-CITY ?auto_135328 ?auto_135330 ) ( not ( = ?auto_135322 ?auto_135328 ) ) ( OBJ-AT ?auto_135327 ?auto_135328 ) ( IN-CITY ?auto_135329 ?auto_135330 ) ( not ( = ?auto_135322 ?auto_135329 ) ) ( OBJ-AT ?auto_135326 ?auto_135329 ) ( TRUCK-AT ?auto_135334 ?auto_135322 ) ( not ( = ?auto_135326 ?auto_135327 ) ) ( not ( = ?auto_135328 ?auto_135329 ) ) ( not ( = ?auto_135326 ?auto_135323 ) ) ( not ( = ?auto_135327 ?auto_135323 ) ) ( not ( = ?auto_135332 ?auto_135328 ) ) ( not ( = ?auto_135332 ?auto_135329 ) ) ( not ( = ?auto_135326 ?auto_135325 ) ) ( not ( = ?auto_135327 ?auto_135325 ) ) ( not ( = ?auto_135323 ?auto_135325 ) ) ( not ( = ?auto_135333 ?auto_135332 ) ) ( not ( = ?auto_135333 ?auto_135328 ) ) ( not ( = ?auto_135333 ?auto_135329 ) ) ( not ( = ?auto_135326 ?auto_135324 ) ) ( not ( = ?auto_135327 ?auto_135324 ) ) ( not ( = ?auto_135323 ?auto_135324 ) ) ( not ( = ?auto_135325 ?auto_135324 ) ) ( not ( = ?auto_135331 ?auto_135333 ) ) ( not ( = ?auto_135331 ?auto_135332 ) ) ( not ( = ?auto_135331 ?auto_135328 ) ) ( not ( = ?auto_135331 ?auto_135329 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_135326 ?auto_135327 ?auto_135323 ?auto_135324 ?auto_135325 ?auto_135322 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_135378 - OBJ
      ?auto_135379 - OBJ
      ?auto_135380 - OBJ
      ?auto_135381 - OBJ
      ?auto_135382 - OBJ
      ?auto_135377 - LOCATION
    )
    :vars
    (
      ?auto_135386 - LOCATION
      ?auto_135385 - CITY
      ?auto_135388 - LOCATION
      ?auto_135387 - LOCATION
      ?auto_135383 - LOCATION
      ?auto_135384 - LOCATION
      ?auto_135389 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135386 ?auto_135385 ) ( IN-CITY ?auto_135377 ?auto_135385 ) ( not ( = ?auto_135377 ?auto_135386 ) ) ( OBJ-AT ?auto_135379 ?auto_135386 ) ( IN-CITY ?auto_135388 ?auto_135385 ) ( not ( = ?auto_135377 ?auto_135388 ) ) ( OBJ-AT ?auto_135380 ?auto_135388 ) ( IN-CITY ?auto_135387 ?auto_135385 ) ( not ( = ?auto_135377 ?auto_135387 ) ) ( OBJ-AT ?auto_135378 ?auto_135387 ) ( IN-CITY ?auto_135383 ?auto_135385 ) ( not ( = ?auto_135377 ?auto_135383 ) ) ( OBJ-AT ?auto_135381 ?auto_135383 ) ( IN-CITY ?auto_135384 ?auto_135385 ) ( not ( = ?auto_135377 ?auto_135384 ) ) ( OBJ-AT ?auto_135382 ?auto_135384 ) ( TRUCK-AT ?auto_135389 ?auto_135377 ) ( not ( = ?auto_135382 ?auto_135381 ) ) ( not ( = ?auto_135383 ?auto_135384 ) ) ( not ( = ?auto_135382 ?auto_135378 ) ) ( not ( = ?auto_135381 ?auto_135378 ) ) ( not ( = ?auto_135387 ?auto_135383 ) ) ( not ( = ?auto_135387 ?auto_135384 ) ) ( not ( = ?auto_135382 ?auto_135380 ) ) ( not ( = ?auto_135381 ?auto_135380 ) ) ( not ( = ?auto_135378 ?auto_135380 ) ) ( not ( = ?auto_135388 ?auto_135387 ) ) ( not ( = ?auto_135388 ?auto_135383 ) ) ( not ( = ?auto_135388 ?auto_135384 ) ) ( not ( = ?auto_135382 ?auto_135379 ) ) ( not ( = ?auto_135381 ?auto_135379 ) ) ( not ( = ?auto_135378 ?auto_135379 ) ) ( not ( = ?auto_135380 ?auto_135379 ) ) ( not ( = ?auto_135386 ?auto_135388 ) ) ( not ( = ?auto_135386 ?auto_135387 ) ) ( not ( = ?auto_135386 ?auto_135383 ) ) ( not ( = ?auto_135386 ?auto_135384 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_135382 ?auto_135381 ?auto_135378 ?auto_135379 ?auto_135380 ?auto_135377 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_136198 - OBJ
      ?auto_136199 - OBJ
      ?auto_136200 - OBJ
      ?auto_136201 - OBJ
      ?auto_136202 - OBJ
      ?auto_136197 - LOCATION
    )
    :vars
    (
      ?auto_136206 - LOCATION
      ?auto_136205 - CITY
      ?auto_136208 - LOCATION
      ?auto_136207 - LOCATION
      ?auto_136203 - LOCATION
      ?auto_136204 - LOCATION
      ?auto_136209 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136206 ?auto_136205 ) ( IN-CITY ?auto_136197 ?auto_136205 ) ( not ( = ?auto_136197 ?auto_136206 ) ) ( OBJ-AT ?auto_136202 ?auto_136206 ) ( IN-CITY ?auto_136208 ?auto_136205 ) ( not ( = ?auto_136197 ?auto_136208 ) ) ( OBJ-AT ?auto_136198 ?auto_136208 ) ( IN-CITY ?auto_136207 ?auto_136205 ) ( not ( = ?auto_136197 ?auto_136207 ) ) ( OBJ-AT ?auto_136201 ?auto_136207 ) ( IN-CITY ?auto_136203 ?auto_136205 ) ( not ( = ?auto_136197 ?auto_136203 ) ) ( OBJ-AT ?auto_136200 ?auto_136203 ) ( IN-CITY ?auto_136204 ?auto_136205 ) ( not ( = ?auto_136197 ?auto_136204 ) ) ( OBJ-AT ?auto_136199 ?auto_136204 ) ( TRUCK-AT ?auto_136209 ?auto_136197 ) ( not ( = ?auto_136199 ?auto_136200 ) ) ( not ( = ?auto_136203 ?auto_136204 ) ) ( not ( = ?auto_136199 ?auto_136201 ) ) ( not ( = ?auto_136200 ?auto_136201 ) ) ( not ( = ?auto_136207 ?auto_136203 ) ) ( not ( = ?auto_136207 ?auto_136204 ) ) ( not ( = ?auto_136199 ?auto_136198 ) ) ( not ( = ?auto_136200 ?auto_136198 ) ) ( not ( = ?auto_136201 ?auto_136198 ) ) ( not ( = ?auto_136208 ?auto_136207 ) ) ( not ( = ?auto_136208 ?auto_136203 ) ) ( not ( = ?auto_136208 ?auto_136204 ) ) ( not ( = ?auto_136199 ?auto_136202 ) ) ( not ( = ?auto_136200 ?auto_136202 ) ) ( not ( = ?auto_136201 ?auto_136202 ) ) ( not ( = ?auto_136198 ?auto_136202 ) ) ( not ( = ?auto_136206 ?auto_136208 ) ) ( not ( = ?auto_136206 ?auto_136207 ) ) ( not ( = ?auto_136206 ?auto_136203 ) ) ( not ( = ?auto_136206 ?auto_136204 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_136199 ?auto_136200 ?auto_136201 ?auto_136202 ?auto_136198 ?auto_136197 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_136253 - OBJ
      ?auto_136254 - OBJ
      ?auto_136255 - OBJ
      ?auto_136256 - OBJ
      ?auto_136257 - OBJ
      ?auto_136252 - LOCATION
    )
    :vars
    (
      ?auto_136261 - LOCATION
      ?auto_136260 - CITY
      ?auto_136263 - LOCATION
      ?auto_136262 - LOCATION
      ?auto_136258 - LOCATION
      ?auto_136259 - LOCATION
      ?auto_136264 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136261 ?auto_136260 ) ( IN-CITY ?auto_136252 ?auto_136260 ) ( not ( = ?auto_136252 ?auto_136261 ) ) ( OBJ-AT ?auto_136256 ?auto_136261 ) ( IN-CITY ?auto_136263 ?auto_136260 ) ( not ( = ?auto_136252 ?auto_136263 ) ) ( OBJ-AT ?auto_136253 ?auto_136263 ) ( IN-CITY ?auto_136262 ?auto_136260 ) ( not ( = ?auto_136252 ?auto_136262 ) ) ( OBJ-AT ?auto_136257 ?auto_136262 ) ( IN-CITY ?auto_136258 ?auto_136260 ) ( not ( = ?auto_136252 ?auto_136258 ) ) ( OBJ-AT ?auto_136255 ?auto_136258 ) ( IN-CITY ?auto_136259 ?auto_136260 ) ( not ( = ?auto_136252 ?auto_136259 ) ) ( OBJ-AT ?auto_136254 ?auto_136259 ) ( TRUCK-AT ?auto_136264 ?auto_136252 ) ( not ( = ?auto_136254 ?auto_136255 ) ) ( not ( = ?auto_136258 ?auto_136259 ) ) ( not ( = ?auto_136254 ?auto_136257 ) ) ( not ( = ?auto_136255 ?auto_136257 ) ) ( not ( = ?auto_136262 ?auto_136258 ) ) ( not ( = ?auto_136262 ?auto_136259 ) ) ( not ( = ?auto_136254 ?auto_136253 ) ) ( not ( = ?auto_136255 ?auto_136253 ) ) ( not ( = ?auto_136257 ?auto_136253 ) ) ( not ( = ?auto_136263 ?auto_136262 ) ) ( not ( = ?auto_136263 ?auto_136258 ) ) ( not ( = ?auto_136263 ?auto_136259 ) ) ( not ( = ?auto_136254 ?auto_136256 ) ) ( not ( = ?auto_136255 ?auto_136256 ) ) ( not ( = ?auto_136257 ?auto_136256 ) ) ( not ( = ?auto_136253 ?auto_136256 ) ) ( not ( = ?auto_136261 ?auto_136263 ) ) ( not ( = ?auto_136261 ?auto_136262 ) ) ( not ( = ?auto_136261 ?auto_136258 ) ) ( not ( = ?auto_136261 ?auto_136259 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_136254 ?auto_136255 ?auto_136257 ?auto_136256 ?auto_136253 ?auto_136252 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_136308 - OBJ
      ?auto_136309 - OBJ
      ?auto_136310 - OBJ
      ?auto_136311 - OBJ
      ?auto_136312 - OBJ
      ?auto_136307 - LOCATION
    )
    :vars
    (
      ?auto_136316 - LOCATION
      ?auto_136315 - CITY
      ?auto_136318 - LOCATION
      ?auto_136317 - LOCATION
      ?auto_136313 - LOCATION
      ?auto_136314 - LOCATION
      ?auto_136319 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136316 ?auto_136315 ) ( IN-CITY ?auto_136307 ?auto_136315 ) ( not ( = ?auto_136307 ?auto_136316 ) ) ( OBJ-AT ?auto_136312 ?auto_136316 ) ( IN-CITY ?auto_136318 ?auto_136315 ) ( not ( = ?auto_136307 ?auto_136318 ) ) ( OBJ-AT ?auto_136308 ?auto_136318 ) ( IN-CITY ?auto_136317 ?auto_136315 ) ( not ( = ?auto_136307 ?auto_136317 ) ) ( OBJ-AT ?auto_136310 ?auto_136317 ) ( IN-CITY ?auto_136313 ?auto_136315 ) ( not ( = ?auto_136307 ?auto_136313 ) ) ( OBJ-AT ?auto_136311 ?auto_136313 ) ( IN-CITY ?auto_136314 ?auto_136315 ) ( not ( = ?auto_136307 ?auto_136314 ) ) ( OBJ-AT ?auto_136309 ?auto_136314 ) ( TRUCK-AT ?auto_136319 ?auto_136307 ) ( not ( = ?auto_136309 ?auto_136311 ) ) ( not ( = ?auto_136313 ?auto_136314 ) ) ( not ( = ?auto_136309 ?auto_136310 ) ) ( not ( = ?auto_136311 ?auto_136310 ) ) ( not ( = ?auto_136317 ?auto_136313 ) ) ( not ( = ?auto_136317 ?auto_136314 ) ) ( not ( = ?auto_136309 ?auto_136308 ) ) ( not ( = ?auto_136311 ?auto_136308 ) ) ( not ( = ?auto_136310 ?auto_136308 ) ) ( not ( = ?auto_136318 ?auto_136317 ) ) ( not ( = ?auto_136318 ?auto_136313 ) ) ( not ( = ?auto_136318 ?auto_136314 ) ) ( not ( = ?auto_136309 ?auto_136312 ) ) ( not ( = ?auto_136311 ?auto_136312 ) ) ( not ( = ?auto_136310 ?auto_136312 ) ) ( not ( = ?auto_136308 ?auto_136312 ) ) ( not ( = ?auto_136316 ?auto_136318 ) ) ( not ( = ?auto_136316 ?auto_136317 ) ) ( not ( = ?auto_136316 ?auto_136313 ) ) ( not ( = ?auto_136316 ?auto_136314 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_136309 ?auto_136311 ?auto_136310 ?auto_136312 ?auto_136308 ?auto_136307 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_136363 - OBJ
      ?auto_136364 - OBJ
      ?auto_136365 - OBJ
      ?auto_136366 - OBJ
      ?auto_136367 - OBJ
      ?auto_136362 - LOCATION
    )
    :vars
    (
      ?auto_136371 - LOCATION
      ?auto_136370 - CITY
      ?auto_136373 - LOCATION
      ?auto_136372 - LOCATION
      ?auto_136368 - LOCATION
      ?auto_136369 - LOCATION
      ?auto_136374 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136371 ?auto_136370 ) ( IN-CITY ?auto_136362 ?auto_136370 ) ( not ( = ?auto_136362 ?auto_136371 ) ) ( OBJ-AT ?auto_136366 ?auto_136371 ) ( IN-CITY ?auto_136373 ?auto_136370 ) ( not ( = ?auto_136362 ?auto_136373 ) ) ( OBJ-AT ?auto_136363 ?auto_136373 ) ( IN-CITY ?auto_136372 ?auto_136370 ) ( not ( = ?auto_136362 ?auto_136372 ) ) ( OBJ-AT ?auto_136365 ?auto_136372 ) ( IN-CITY ?auto_136368 ?auto_136370 ) ( not ( = ?auto_136362 ?auto_136368 ) ) ( OBJ-AT ?auto_136367 ?auto_136368 ) ( IN-CITY ?auto_136369 ?auto_136370 ) ( not ( = ?auto_136362 ?auto_136369 ) ) ( OBJ-AT ?auto_136364 ?auto_136369 ) ( TRUCK-AT ?auto_136374 ?auto_136362 ) ( not ( = ?auto_136364 ?auto_136367 ) ) ( not ( = ?auto_136368 ?auto_136369 ) ) ( not ( = ?auto_136364 ?auto_136365 ) ) ( not ( = ?auto_136367 ?auto_136365 ) ) ( not ( = ?auto_136372 ?auto_136368 ) ) ( not ( = ?auto_136372 ?auto_136369 ) ) ( not ( = ?auto_136364 ?auto_136363 ) ) ( not ( = ?auto_136367 ?auto_136363 ) ) ( not ( = ?auto_136365 ?auto_136363 ) ) ( not ( = ?auto_136373 ?auto_136372 ) ) ( not ( = ?auto_136373 ?auto_136368 ) ) ( not ( = ?auto_136373 ?auto_136369 ) ) ( not ( = ?auto_136364 ?auto_136366 ) ) ( not ( = ?auto_136367 ?auto_136366 ) ) ( not ( = ?auto_136365 ?auto_136366 ) ) ( not ( = ?auto_136363 ?auto_136366 ) ) ( not ( = ?auto_136371 ?auto_136373 ) ) ( not ( = ?auto_136371 ?auto_136372 ) ) ( not ( = ?auto_136371 ?auto_136368 ) ) ( not ( = ?auto_136371 ?auto_136369 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_136364 ?auto_136367 ?auto_136365 ?auto_136366 ?auto_136363 ?auto_136362 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_136650 - OBJ
      ?auto_136651 - OBJ
      ?auto_136652 - OBJ
      ?auto_136653 - OBJ
      ?auto_136654 - OBJ
      ?auto_136649 - LOCATION
    )
    :vars
    (
      ?auto_136658 - LOCATION
      ?auto_136657 - CITY
      ?auto_136660 - LOCATION
      ?auto_136659 - LOCATION
      ?auto_136655 - LOCATION
      ?auto_136656 - LOCATION
      ?auto_136661 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136658 ?auto_136657 ) ( IN-CITY ?auto_136649 ?auto_136657 ) ( not ( = ?auto_136649 ?auto_136658 ) ) ( OBJ-AT ?auto_136652 ?auto_136658 ) ( IN-CITY ?auto_136660 ?auto_136657 ) ( not ( = ?auto_136649 ?auto_136660 ) ) ( OBJ-AT ?auto_136650 ?auto_136660 ) ( IN-CITY ?auto_136659 ?auto_136657 ) ( not ( = ?auto_136649 ?auto_136659 ) ) ( OBJ-AT ?auto_136654 ?auto_136659 ) ( IN-CITY ?auto_136655 ?auto_136657 ) ( not ( = ?auto_136649 ?auto_136655 ) ) ( OBJ-AT ?auto_136653 ?auto_136655 ) ( IN-CITY ?auto_136656 ?auto_136657 ) ( not ( = ?auto_136649 ?auto_136656 ) ) ( OBJ-AT ?auto_136651 ?auto_136656 ) ( TRUCK-AT ?auto_136661 ?auto_136649 ) ( not ( = ?auto_136651 ?auto_136653 ) ) ( not ( = ?auto_136655 ?auto_136656 ) ) ( not ( = ?auto_136651 ?auto_136654 ) ) ( not ( = ?auto_136653 ?auto_136654 ) ) ( not ( = ?auto_136659 ?auto_136655 ) ) ( not ( = ?auto_136659 ?auto_136656 ) ) ( not ( = ?auto_136651 ?auto_136650 ) ) ( not ( = ?auto_136653 ?auto_136650 ) ) ( not ( = ?auto_136654 ?auto_136650 ) ) ( not ( = ?auto_136660 ?auto_136659 ) ) ( not ( = ?auto_136660 ?auto_136655 ) ) ( not ( = ?auto_136660 ?auto_136656 ) ) ( not ( = ?auto_136651 ?auto_136652 ) ) ( not ( = ?auto_136653 ?auto_136652 ) ) ( not ( = ?auto_136654 ?auto_136652 ) ) ( not ( = ?auto_136650 ?auto_136652 ) ) ( not ( = ?auto_136658 ?auto_136660 ) ) ( not ( = ?auto_136658 ?auto_136659 ) ) ( not ( = ?auto_136658 ?auto_136655 ) ) ( not ( = ?auto_136658 ?auto_136656 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_136651 ?auto_136653 ?auto_136654 ?auto_136652 ?auto_136650 ?auto_136649 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_136705 - OBJ
      ?auto_136706 - OBJ
      ?auto_136707 - OBJ
      ?auto_136708 - OBJ
      ?auto_136709 - OBJ
      ?auto_136704 - LOCATION
    )
    :vars
    (
      ?auto_136713 - LOCATION
      ?auto_136712 - CITY
      ?auto_136715 - LOCATION
      ?auto_136714 - LOCATION
      ?auto_136710 - LOCATION
      ?auto_136711 - LOCATION
      ?auto_136716 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136713 ?auto_136712 ) ( IN-CITY ?auto_136704 ?auto_136712 ) ( not ( = ?auto_136704 ?auto_136713 ) ) ( OBJ-AT ?auto_136707 ?auto_136713 ) ( IN-CITY ?auto_136715 ?auto_136712 ) ( not ( = ?auto_136704 ?auto_136715 ) ) ( OBJ-AT ?auto_136705 ?auto_136715 ) ( IN-CITY ?auto_136714 ?auto_136712 ) ( not ( = ?auto_136704 ?auto_136714 ) ) ( OBJ-AT ?auto_136708 ?auto_136714 ) ( IN-CITY ?auto_136710 ?auto_136712 ) ( not ( = ?auto_136704 ?auto_136710 ) ) ( OBJ-AT ?auto_136709 ?auto_136710 ) ( IN-CITY ?auto_136711 ?auto_136712 ) ( not ( = ?auto_136704 ?auto_136711 ) ) ( OBJ-AT ?auto_136706 ?auto_136711 ) ( TRUCK-AT ?auto_136716 ?auto_136704 ) ( not ( = ?auto_136706 ?auto_136709 ) ) ( not ( = ?auto_136710 ?auto_136711 ) ) ( not ( = ?auto_136706 ?auto_136708 ) ) ( not ( = ?auto_136709 ?auto_136708 ) ) ( not ( = ?auto_136714 ?auto_136710 ) ) ( not ( = ?auto_136714 ?auto_136711 ) ) ( not ( = ?auto_136706 ?auto_136705 ) ) ( not ( = ?auto_136709 ?auto_136705 ) ) ( not ( = ?auto_136708 ?auto_136705 ) ) ( not ( = ?auto_136715 ?auto_136714 ) ) ( not ( = ?auto_136715 ?auto_136710 ) ) ( not ( = ?auto_136715 ?auto_136711 ) ) ( not ( = ?auto_136706 ?auto_136707 ) ) ( not ( = ?auto_136709 ?auto_136707 ) ) ( not ( = ?auto_136708 ?auto_136707 ) ) ( not ( = ?auto_136705 ?auto_136707 ) ) ( not ( = ?auto_136713 ?auto_136715 ) ) ( not ( = ?auto_136713 ?auto_136714 ) ) ( not ( = ?auto_136713 ?auto_136710 ) ) ( not ( = ?auto_136713 ?auto_136711 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_136706 ?auto_136709 ?auto_136708 ?auto_136707 ?auto_136705 ?auto_136704 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_136934 - OBJ
      ?auto_136935 - OBJ
      ?auto_136936 - OBJ
      ?auto_136937 - OBJ
      ?auto_136938 - OBJ
      ?auto_136933 - LOCATION
    )
    :vars
    (
      ?auto_136942 - LOCATION
      ?auto_136941 - CITY
      ?auto_136944 - LOCATION
      ?auto_136943 - LOCATION
      ?auto_136939 - LOCATION
      ?auto_136940 - LOCATION
      ?auto_136945 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136942 ?auto_136941 ) ( IN-CITY ?auto_136933 ?auto_136941 ) ( not ( = ?auto_136933 ?auto_136942 ) ) ( OBJ-AT ?auto_136938 ?auto_136942 ) ( IN-CITY ?auto_136944 ?auto_136941 ) ( not ( = ?auto_136933 ?auto_136944 ) ) ( OBJ-AT ?auto_136934 ?auto_136944 ) ( IN-CITY ?auto_136943 ?auto_136941 ) ( not ( = ?auto_136933 ?auto_136943 ) ) ( OBJ-AT ?auto_136937 ?auto_136943 ) ( IN-CITY ?auto_136939 ?auto_136941 ) ( not ( = ?auto_136933 ?auto_136939 ) ) ( OBJ-AT ?auto_136935 ?auto_136939 ) ( IN-CITY ?auto_136940 ?auto_136941 ) ( not ( = ?auto_136933 ?auto_136940 ) ) ( OBJ-AT ?auto_136936 ?auto_136940 ) ( TRUCK-AT ?auto_136945 ?auto_136933 ) ( not ( = ?auto_136936 ?auto_136935 ) ) ( not ( = ?auto_136939 ?auto_136940 ) ) ( not ( = ?auto_136936 ?auto_136937 ) ) ( not ( = ?auto_136935 ?auto_136937 ) ) ( not ( = ?auto_136943 ?auto_136939 ) ) ( not ( = ?auto_136943 ?auto_136940 ) ) ( not ( = ?auto_136936 ?auto_136934 ) ) ( not ( = ?auto_136935 ?auto_136934 ) ) ( not ( = ?auto_136937 ?auto_136934 ) ) ( not ( = ?auto_136944 ?auto_136943 ) ) ( not ( = ?auto_136944 ?auto_136939 ) ) ( not ( = ?auto_136944 ?auto_136940 ) ) ( not ( = ?auto_136936 ?auto_136938 ) ) ( not ( = ?auto_136935 ?auto_136938 ) ) ( not ( = ?auto_136937 ?auto_136938 ) ) ( not ( = ?auto_136934 ?auto_136938 ) ) ( not ( = ?auto_136942 ?auto_136944 ) ) ( not ( = ?auto_136942 ?auto_136943 ) ) ( not ( = ?auto_136942 ?auto_136939 ) ) ( not ( = ?auto_136942 ?auto_136940 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_136936 ?auto_136935 ?auto_136937 ?auto_136938 ?auto_136934 ?auto_136933 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_136989 - OBJ
      ?auto_136990 - OBJ
      ?auto_136991 - OBJ
      ?auto_136992 - OBJ
      ?auto_136993 - OBJ
      ?auto_136988 - LOCATION
    )
    :vars
    (
      ?auto_136997 - LOCATION
      ?auto_136996 - CITY
      ?auto_136999 - LOCATION
      ?auto_136998 - LOCATION
      ?auto_136994 - LOCATION
      ?auto_136995 - LOCATION
      ?auto_137000 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136997 ?auto_136996 ) ( IN-CITY ?auto_136988 ?auto_136996 ) ( not ( = ?auto_136988 ?auto_136997 ) ) ( OBJ-AT ?auto_136992 ?auto_136997 ) ( IN-CITY ?auto_136999 ?auto_136996 ) ( not ( = ?auto_136988 ?auto_136999 ) ) ( OBJ-AT ?auto_136989 ?auto_136999 ) ( IN-CITY ?auto_136998 ?auto_136996 ) ( not ( = ?auto_136988 ?auto_136998 ) ) ( OBJ-AT ?auto_136993 ?auto_136998 ) ( IN-CITY ?auto_136994 ?auto_136996 ) ( not ( = ?auto_136988 ?auto_136994 ) ) ( OBJ-AT ?auto_136990 ?auto_136994 ) ( IN-CITY ?auto_136995 ?auto_136996 ) ( not ( = ?auto_136988 ?auto_136995 ) ) ( OBJ-AT ?auto_136991 ?auto_136995 ) ( TRUCK-AT ?auto_137000 ?auto_136988 ) ( not ( = ?auto_136991 ?auto_136990 ) ) ( not ( = ?auto_136994 ?auto_136995 ) ) ( not ( = ?auto_136991 ?auto_136993 ) ) ( not ( = ?auto_136990 ?auto_136993 ) ) ( not ( = ?auto_136998 ?auto_136994 ) ) ( not ( = ?auto_136998 ?auto_136995 ) ) ( not ( = ?auto_136991 ?auto_136989 ) ) ( not ( = ?auto_136990 ?auto_136989 ) ) ( not ( = ?auto_136993 ?auto_136989 ) ) ( not ( = ?auto_136999 ?auto_136998 ) ) ( not ( = ?auto_136999 ?auto_136994 ) ) ( not ( = ?auto_136999 ?auto_136995 ) ) ( not ( = ?auto_136991 ?auto_136992 ) ) ( not ( = ?auto_136990 ?auto_136992 ) ) ( not ( = ?auto_136993 ?auto_136992 ) ) ( not ( = ?auto_136989 ?auto_136992 ) ) ( not ( = ?auto_136997 ?auto_136999 ) ) ( not ( = ?auto_136997 ?auto_136998 ) ) ( not ( = ?auto_136997 ?auto_136994 ) ) ( not ( = ?auto_136997 ?auto_136995 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_136991 ?auto_136990 ?auto_136993 ?auto_136992 ?auto_136989 ?auto_136988 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_137161 - OBJ
      ?auto_137162 - OBJ
      ?auto_137163 - OBJ
      ?auto_137164 - OBJ
      ?auto_137165 - OBJ
      ?auto_137160 - LOCATION
    )
    :vars
    (
      ?auto_137169 - LOCATION
      ?auto_137168 - CITY
      ?auto_137171 - LOCATION
      ?auto_137170 - LOCATION
      ?auto_137166 - LOCATION
      ?auto_137167 - LOCATION
      ?auto_137172 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137169 ?auto_137168 ) ( IN-CITY ?auto_137160 ?auto_137168 ) ( not ( = ?auto_137160 ?auto_137169 ) ) ( OBJ-AT ?auto_137165 ?auto_137169 ) ( IN-CITY ?auto_137171 ?auto_137168 ) ( not ( = ?auto_137160 ?auto_137171 ) ) ( OBJ-AT ?auto_137161 ?auto_137171 ) ( IN-CITY ?auto_137170 ?auto_137168 ) ( not ( = ?auto_137160 ?auto_137170 ) ) ( OBJ-AT ?auto_137163 ?auto_137170 ) ( IN-CITY ?auto_137166 ?auto_137168 ) ( not ( = ?auto_137160 ?auto_137166 ) ) ( OBJ-AT ?auto_137162 ?auto_137166 ) ( IN-CITY ?auto_137167 ?auto_137168 ) ( not ( = ?auto_137160 ?auto_137167 ) ) ( OBJ-AT ?auto_137164 ?auto_137167 ) ( TRUCK-AT ?auto_137172 ?auto_137160 ) ( not ( = ?auto_137164 ?auto_137162 ) ) ( not ( = ?auto_137166 ?auto_137167 ) ) ( not ( = ?auto_137164 ?auto_137163 ) ) ( not ( = ?auto_137162 ?auto_137163 ) ) ( not ( = ?auto_137170 ?auto_137166 ) ) ( not ( = ?auto_137170 ?auto_137167 ) ) ( not ( = ?auto_137164 ?auto_137161 ) ) ( not ( = ?auto_137162 ?auto_137161 ) ) ( not ( = ?auto_137163 ?auto_137161 ) ) ( not ( = ?auto_137171 ?auto_137170 ) ) ( not ( = ?auto_137171 ?auto_137166 ) ) ( not ( = ?auto_137171 ?auto_137167 ) ) ( not ( = ?auto_137164 ?auto_137165 ) ) ( not ( = ?auto_137162 ?auto_137165 ) ) ( not ( = ?auto_137163 ?auto_137165 ) ) ( not ( = ?auto_137161 ?auto_137165 ) ) ( not ( = ?auto_137169 ?auto_137171 ) ) ( not ( = ?auto_137169 ?auto_137170 ) ) ( not ( = ?auto_137169 ?auto_137166 ) ) ( not ( = ?auto_137169 ?auto_137167 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_137164 ?auto_137162 ?auto_137163 ?auto_137165 ?auto_137161 ?auto_137160 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_137216 - OBJ
      ?auto_137217 - OBJ
      ?auto_137218 - OBJ
      ?auto_137219 - OBJ
      ?auto_137220 - OBJ
      ?auto_137215 - LOCATION
    )
    :vars
    (
      ?auto_137224 - LOCATION
      ?auto_137223 - CITY
      ?auto_137226 - LOCATION
      ?auto_137225 - LOCATION
      ?auto_137221 - LOCATION
      ?auto_137222 - LOCATION
      ?auto_137227 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137224 ?auto_137223 ) ( IN-CITY ?auto_137215 ?auto_137223 ) ( not ( = ?auto_137215 ?auto_137224 ) ) ( OBJ-AT ?auto_137219 ?auto_137224 ) ( IN-CITY ?auto_137226 ?auto_137223 ) ( not ( = ?auto_137215 ?auto_137226 ) ) ( OBJ-AT ?auto_137216 ?auto_137226 ) ( IN-CITY ?auto_137225 ?auto_137223 ) ( not ( = ?auto_137215 ?auto_137225 ) ) ( OBJ-AT ?auto_137218 ?auto_137225 ) ( IN-CITY ?auto_137221 ?auto_137223 ) ( not ( = ?auto_137215 ?auto_137221 ) ) ( OBJ-AT ?auto_137217 ?auto_137221 ) ( IN-CITY ?auto_137222 ?auto_137223 ) ( not ( = ?auto_137215 ?auto_137222 ) ) ( OBJ-AT ?auto_137220 ?auto_137222 ) ( TRUCK-AT ?auto_137227 ?auto_137215 ) ( not ( = ?auto_137220 ?auto_137217 ) ) ( not ( = ?auto_137221 ?auto_137222 ) ) ( not ( = ?auto_137220 ?auto_137218 ) ) ( not ( = ?auto_137217 ?auto_137218 ) ) ( not ( = ?auto_137225 ?auto_137221 ) ) ( not ( = ?auto_137225 ?auto_137222 ) ) ( not ( = ?auto_137220 ?auto_137216 ) ) ( not ( = ?auto_137217 ?auto_137216 ) ) ( not ( = ?auto_137218 ?auto_137216 ) ) ( not ( = ?auto_137226 ?auto_137225 ) ) ( not ( = ?auto_137226 ?auto_137221 ) ) ( not ( = ?auto_137226 ?auto_137222 ) ) ( not ( = ?auto_137220 ?auto_137219 ) ) ( not ( = ?auto_137217 ?auto_137219 ) ) ( not ( = ?auto_137218 ?auto_137219 ) ) ( not ( = ?auto_137216 ?auto_137219 ) ) ( not ( = ?auto_137224 ?auto_137226 ) ) ( not ( = ?auto_137224 ?auto_137225 ) ) ( not ( = ?auto_137224 ?auto_137221 ) ) ( not ( = ?auto_137224 ?auto_137222 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_137220 ?auto_137217 ?auto_137218 ?auto_137219 ?auto_137216 ?auto_137215 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_137444 - OBJ
      ?auto_137445 - OBJ
      ?auto_137446 - OBJ
      ?auto_137447 - OBJ
      ?auto_137448 - OBJ
      ?auto_137443 - LOCATION
    )
    :vars
    (
      ?auto_137452 - LOCATION
      ?auto_137451 - CITY
      ?auto_137454 - LOCATION
      ?auto_137453 - LOCATION
      ?auto_137449 - LOCATION
      ?auto_137450 - LOCATION
      ?auto_137455 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137452 ?auto_137451 ) ( IN-CITY ?auto_137443 ?auto_137451 ) ( not ( = ?auto_137443 ?auto_137452 ) ) ( OBJ-AT ?auto_137446 ?auto_137452 ) ( IN-CITY ?auto_137454 ?auto_137451 ) ( not ( = ?auto_137443 ?auto_137454 ) ) ( OBJ-AT ?auto_137444 ?auto_137454 ) ( IN-CITY ?auto_137453 ?auto_137451 ) ( not ( = ?auto_137443 ?auto_137453 ) ) ( OBJ-AT ?auto_137448 ?auto_137453 ) ( IN-CITY ?auto_137449 ?auto_137451 ) ( not ( = ?auto_137443 ?auto_137449 ) ) ( OBJ-AT ?auto_137445 ?auto_137449 ) ( IN-CITY ?auto_137450 ?auto_137451 ) ( not ( = ?auto_137443 ?auto_137450 ) ) ( OBJ-AT ?auto_137447 ?auto_137450 ) ( TRUCK-AT ?auto_137455 ?auto_137443 ) ( not ( = ?auto_137447 ?auto_137445 ) ) ( not ( = ?auto_137449 ?auto_137450 ) ) ( not ( = ?auto_137447 ?auto_137448 ) ) ( not ( = ?auto_137445 ?auto_137448 ) ) ( not ( = ?auto_137453 ?auto_137449 ) ) ( not ( = ?auto_137453 ?auto_137450 ) ) ( not ( = ?auto_137447 ?auto_137444 ) ) ( not ( = ?auto_137445 ?auto_137444 ) ) ( not ( = ?auto_137448 ?auto_137444 ) ) ( not ( = ?auto_137454 ?auto_137453 ) ) ( not ( = ?auto_137454 ?auto_137449 ) ) ( not ( = ?auto_137454 ?auto_137450 ) ) ( not ( = ?auto_137447 ?auto_137446 ) ) ( not ( = ?auto_137445 ?auto_137446 ) ) ( not ( = ?auto_137448 ?auto_137446 ) ) ( not ( = ?auto_137444 ?auto_137446 ) ) ( not ( = ?auto_137452 ?auto_137454 ) ) ( not ( = ?auto_137452 ?auto_137453 ) ) ( not ( = ?auto_137452 ?auto_137449 ) ) ( not ( = ?auto_137452 ?auto_137450 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_137447 ?auto_137445 ?auto_137448 ?auto_137446 ?auto_137444 ?auto_137443 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_137558 - OBJ
      ?auto_137559 - OBJ
      ?auto_137560 - OBJ
      ?auto_137561 - OBJ
      ?auto_137562 - OBJ
      ?auto_137557 - LOCATION
    )
    :vars
    (
      ?auto_137566 - LOCATION
      ?auto_137565 - CITY
      ?auto_137568 - LOCATION
      ?auto_137567 - LOCATION
      ?auto_137563 - LOCATION
      ?auto_137564 - LOCATION
      ?auto_137569 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137566 ?auto_137565 ) ( IN-CITY ?auto_137557 ?auto_137565 ) ( not ( = ?auto_137557 ?auto_137566 ) ) ( OBJ-AT ?auto_137560 ?auto_137566 ) ( IN-CITY ?auto_137568 ?auto_137565 ) ( not ( = ?auto_137557 ?auto_137568 ) ) ( OBJ-AT ?auto_137558 ?auto_137568 ) ( IN-CITY ?auto_137567 ?auto_137565 ) ( not ( = ?auto_137557 ?auto_137567 ) ) ( OBJ-AT ?auto_137561 ?auto_137567 ) ( IN-CITY ?auto_137563 ?auto_137565 ) ( not ( = ?auto_137557 ?auto_137563 ) ) ( OBJ-AT ?auto_137559 ?auto_137563 ) ( IN-CITY ?auto_137564 ?auto_137565 ) ( not ( = ?auto_137557 ?auto_137564 ) ) ( OBJ-AT ?auto_137562 ?auto_137564 ) ( TRUCK-AT ?auto_137569 ?auto_137557 ) ( not ( = ?auto_137562 ?auto_137559 ) ) ( not ( = ?auto_137563 ?auto_137564 ) ) ( not ( = ?auto_137562 ?auto_137561 ) ) ( not ( = ?auto_137559 ?auto_137561 ) ) ( not ( = ?auto_137567 ?auto_137563 ) ) ( not ( = ?auto_137567 ?auto_137564 ) ) ( not ( = ?auto_137562 ?auto_137558 ) ) ( not ( = ?auto_137559 ?auto_137558 ) ) ( not ( = ?auto_137561 ?auto_137558 ) ) ( not ( = ?auto_137568 ?auto_137567 ) ) ( not ( = ?auto_137568 ?auto_137563 ) ) ( not ( = ?auto_137568 ?auto_137564 ) ) ( not ( = ?auto_137562 ?auto_137560 ) ) ( not ( = ?auto_137559 ?auto_137560 ) ) ( not ( = ?auto_137561 ?auto_137560 ) ) ( not ( = ?auto_137558 ?auto_137560 ) ) ( not ( = ?auto_137566 ?auto_137568 ) ) ( not ( = ?auto_137566 ?auto_137567 ) ) ( not ( = ?auto_137566 ?auto_137563 ) ) ( not ( = ?auto_137566 ?auto_137564 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_137562 ?auto_137559 ?auto_137561 ?auto_137560 ?auto_137558 ?auto_137557 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_137787 - OBJ
      ?auto_137788 - OBJ
      ?auto_137789 - OBJ
      ?auto_137790 - OBJ
      ?auto_137791 - OBJ
      ?auto_137786 - LOCATION
    )
    :vars
    (
      ?auto_137795 - LOCATION
      ?auto_137794 - CITY
      ?auto_137797 - LOCATION
      ?auto_137796 - LOCATION
      ?auto_137792 - LOCATION
      ?auto_137793 - LOCATION
      ?auto_137798 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137795 ?auto_137794 ) ( IN-CITY ?auto_137786 ?auto_137794 ) ( not ( = ?auto_137786 ?auto_137795 ) ) ( OBJ-AT ?auto_137791 ?auto_137795 ) ( IN-CITY ?auto_137797 ?auto_137794 ) ( not ( = ?auto_137786 ?auto_137797 ) ) ( OBJ-AT ?auto_137787 ?auto_137797 ) ( IN-CITY ?auto_137796 ?auto_137794 ) ( not ( = ?auto_137786 ?auto_137796 ) ) ( OBJ-AT ?auto_137788 ?auto_137796 ) ( IN-CITY ?auto_137792 ?auto_137794 ) ( not ( = ?auto_137786 ?auto_137792 ) ) ( OBJ-AT ?auto_137790 ?auto_137792 ) ( IN-CITY ?auto_137793 ?auto_137794 ) ( not ( = ?auto_137786 ?auto_137793 ) ) ( OBJ-AT ?auto_137789 ?auto_137793 ) ( TRUCK-AT ?auto_137798 ?auto_137786 ) ( not ( = ?auto_137789 ?auto_137790 ) ) ( not ( = ?auto_137792 ?auto_137793 ) ) ( not ( = ?auto_137789 ?auto_137788 ) ) ( not ( = ?auto_137790 ?auto_137788 ) ) ( not ( = ?auto_137796 ?auto_137792 ) ) ( not ( = ?auto_137796 ?auto_137793 ) ) ( not ( = ?auto_137789 ?auto_137787 ) ) ( not ( = ?auto_137790 ?auto_137787 ) ) ( not ( = ?auto_137788 ?auto_137787 ) ) ( not ( = ?auto_137797 ?auto_137796 ) ) ( not ( = ?auto_137797 ?auto_137792 ) ) ( not ( = ?auto_137797 ?auto_137793 ) ) ( not ( = ?auto_137789 ?auto_137791 ) ) ( not ( = ?auto_137790 ?auto_137791 ) ) ( not ( = ?auto_137788 ?auto_137791 ) ) ( not ( = ?auto_137787 ?auto_137791 ) ) ( not ( = ?auto_137795 ?auto_137797 ) ) ( not ( = ?auto_137795 ?auto_137796 ) ) ( not ( = ?auto_137795 ?auto_137792 ) ) ( not ( = ?auto_137795 ?auto_137793 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_137789 ?auto_137790 ?auto_137788 ?auto_137791 ?auto_137787 ?auto_137786 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_137842 - OBJ
      ?auto_137843 - OBJ
      ?auto_137844 - OBJ
      ?auto_137845 - OBJ
      ?auto_137846 - OBJ
      ?auto_137841 - LOCATION
    )
    :vars
    (
      ?auto_137850 - LOCATION
      ?auto_137849 - CITY
      ?auto_137852 - LOCATION
      ?auto_137851 - LOCATION
      ?auto_137847 - LOCATION
      ?auto_137848 - LOCATION
      ?auto_137853 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137850 ?auto_137849 ) ( IN-CITY ?auto_137841 ?auto_137849 ) ( not ( = ?auto_137841 ?auto_137850 ) ) ( OBJ-AT ?auto_137845 ?auto_137850 ) ( IN-CITY ?auto_137852 ?auto_137849 ) ( not ( = ?auto_137841 ?auto_137852 ) ) ( OBJ-AT ?auto_137842 ?auto_137852 ) ( IN-CITY ?auto_137851 ?auto_137849 ) ( not ( = ?auto_137841 ?auto_137851 ) ) ( OBJ-AT ?auto_137843 ?auto_137851 ) ( IN-CITY ?auto_137847 ?auto_137849 ) ( not ( = ?auto_137841 ?auto_137847 ) ) ( OBJ-AT ?auto_137846 ?auto_137847 ) ( IN-CITY ?auto_137848 ?auto_137849 ) ( not ( = ?auto_137841 ?auto_137848 ) ) ( OBJ-AT ?auto_137844 ?auto_137848 ) ( TRUCK-AT ?auto_137853 ?auto_137841 ) ( not ( = ?auto_137844 ?auto_137846 ) ) ( not ( = ?auto_137847 ?auto_137848 ) ) ( not ( = ?auto_137844 ?auto_137843 ) ) ( not ( = ?auto_137846 ?auto_137843 ) ) ( not ( = ?auto_137851 ?auto_137847 ) ) ( not ( = ?auto_137851 ?auto_137848 ) ) ( not ( = ?auto_137844 ?auto_137842 ) ) ( not ( = ?auto_137846 ?auto_137842 ) ) ( not ( = ?auto_137843 ?auto_137842 ) ) ( not ( = ?auto_137852 ?auto_137851 ) ) ( not ( = ?auto_137852 ?auto_137847 ) ) ( not ( = ?auto_137852 ?auto_137848 ) ) ( not ( = ?auto_137844 ?auto_137845 ) ) ( not ( = ?auto_137846 ?auto_137845 ) ) ( not ( = ?auto_137843 ?auto_137845 ) ) ( not ( = ?auto_137842 ?auto_137845 ) ) ( not ( = ?auto_137850 ?auto_137852 ) ) ( not ( = ?auto_137850 ?auto_137851 ) ) ( not ( = ?auto_137850 ?auto_137847 ) ) ( not ( = ?auto_137850 ?auto_137848 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_137844 ?auto_137846 ?auto_137843 ?auto_137845 ?auto_137842 ?auto_137841 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_137897 - OBJ
      ?auto_137898 - OBJ
      ?auto_137899 - OBJ
      ?auto_137900 - OBJ
      ?auto_137901 - OBJ
      ?auto_137896 - LOCATION
    )
    :vars
    (
      ?auto_137905 - LOCATION
      ?auto_137904 - CITY
      ?auto_137907 - LOCATION
      ?auto_137906 - LOCATION
      ?auto_137902 - LOCATION
      ?auto_137903 - LOCATION
      ?auto_137908 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137905 ?auto_137904 ) ( IN-CITY ?auto_137896 ?auto_137904 ) ( not ( = ?auto_137896 ?auto_137905 ) ) ( OBJ-AT ?auto_137901 ?auto_137905 ) ( IN-CITY ?auto_137907 ?auto_137904 ) ( not ( = ?auto_137896 ?auto_137907 ) ) ( OBJ-AT ?auto_137897 ?auto_137907 ) ( IN-CITY ?auto_137906 ?auto_137904 ) ( not ( = ?auto_137896 ?auto_137906 ) ) ( OBJ-AT ?auto_137898 ?auto_137906 ) ( IN-CITY ?auto_137902 ?auto_137904 ) ( not ( = ?auto_137896 ?auto_137902 ) ) ( OBJ-AT ?auto_137899 ?auto_137902 ) ( IN-CITY ?auto_137903 ?auto_137904 ) ( not ( = ?auto_137896 ?auto_137903 ) ) ( OBJ-AT ?auto_137900 ?auto_137903 ) ( TRUCK-AT ?auto_137908 ?auto_137896 ) ( not ( = ?auto_137900 ?auto_137899 ) ) ( not ( = ?auto_137902 ?auto_137903 ) ) ( not ( = ?auto_137900 ?auto_137898 ) ) ( not ( = ?auto_137899 ?auto_137898 ) ) ( not ( = ?auto_137906 ?auto_137902 ) ) ( not ( = ?auto_137906 ?auto_137903 ) ) ( not ( = ?auto_137900 ?auto_137897 ) ) ( not ( = ?auto_137899 ?auto_137897 ) ) ( not ( = ?auto_137898 ?auto_137897 ) ) ( not ( = ?auto_137907 ?auto_137906 ) ) ( not ( = ?auto_137907 ?auto_137902 ) ) ( not ( = ?auto_137907 ?auto_137903 ) ) ( not ( = ?auto_137900 ?auto_137901 ) ) ( not ( = ?auto_137899 ?auto_137901 ) ) ( not ( = ?auto_137898 ?auto_137901 ) ) ( not ( = ?auto_137897 ?auto_137901 ) ) ( not ( = ?auto_137905 ?auto_137907 ) ) ( not ( = ?auto_137905 ?auto_137906 ) ) ( not ( = ?auto_137905 ?auto_137902 ) ) ( not ( = ?auto_137905 ?auto_137903 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_137900 ?auto_137899 ?auto_137898 ?auto_137901 ?auto_137897 ?auto_137896 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_137952 - OBJ
      ?auto_137953 - OBJ
      ?auto_137954 - OBJ
      ?auto_137955 - OBJ
      ?auto_137956 - OBJ
      ?auto_137951 - LOCATION
    )
    :vars
    (
      ?auto_137960 - LOCATION
      ?auto_137959 - CITY
      ?auto_137962 - LOCATION
      ?auto_137961 - LOCATION
      ?auto_137957 - LOCATION
      ?auto_137958 - LOCATION
      ?auto_137963 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137960 ?auto_137959 ) ( IN-CITY ?auto_137951 ?auto_137959 ) ( not ( = ?auto_137951 ?auto_137960 ) ) ( OBJ-AT ?auto_137955 ?auto_137960 ) ( IN-CITY ?auto_137962 ?auto_137959 ) ( not ( = ?auto_137951 ?auto_137962 ) ) ( OBJ-AT ?auto_137952 ?auto_137962 ) ( IN-CITY ?auto_137961 ?auto_137959 ) ( not ( = ?auto_137951 ?auto_137961 ) ) ( OBJ-AT ?auto_137953 ?auto_137961 ) ( IN-CITY ?auto_137957 ?auto_137959 ) ( not ( = ?auto_137951 ?auto_137957 ) ) ( OBJ-AT ?auto_137954 ?auto_137957 ) ( IN-CITY ?auto_137958 ?auto_137959 ) ( not ( = ?auto_137951 ?auto_137958 ) ) ( OBJ-AT ?auto_137956 ?auto_137958 ) ( TRUCK-AT ?auto_137963 ?auto_137951 ) ( not ( = ?auto_137956 ?auto_137954 ) ) ( not ( = ?auto_137957 ?auto_137958 ) ) ( not ( = ?auto_137956 ?auto_137953 ) ) ( not ( = ?auto_137954 ?auto_137953 ) ) ( not ( = ?auto_137961 ?auto_137957 ) ) ( not ( = ?auto_137961 ?auto_137958 ) ) ( not ( = ?auto_137956 ?auto_137952 ) ) ( not ( = ?auto_137954 ?auto_137952 ) ) ( not ( = ?auto_137953 ?auto_137952 ) ) ( not ( = ?auto_137962 ?auto_137961 ) ) ( not ( = ?auto_137962 ?auto_137957 ) ) ( not ( = ?auto_137962 ?auto_137958 ) ) ( not ( = ?auto_137956 ?auto_137955 ) ) ( not ( = ?auto_137954 ?auto_137955 ) ) ( not ( = ?auto_137953 ?auto_137955 ) ) ( not ( = ?auto_137952 ?auto_137955 ) ) ( not ( = ?auto_137960 ?auto_137962 ) ) ( not ( = ?auto_137960 ?auto_137961 ) ) ( not ( = ?auto_137960 ?auto_137957 ) ) ( not ( = ?auto_137960 ?auto_137958 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_137956 ?auto_137954 ?auto_137953 ?auto_137955 ?auto_137952 ?auto_137951 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_138297 - OBJ
      ?auto_138298 - OBJ
      ?auto_138299 - OBJ
      ?auto_138300 - OBJ
      ?auto_138301 - OBJ
      ?auto_138296 - LOCATION
    )
    :vars
    (
      ?auto_138305 - LOCATION
      ?auto_138304 - CITY
      ?auto_138307 - LOCATION
      ?auto_138306 - LOCATION
      ?auto_138302 - LOCATION
      ?auto_138303 - LOCATION
      ?auto_138308 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138305 ?auto_138304 ) ( IN-CITY ?auto_138296 ?auto_138304 ) ( not ( = ?auto_138296 ?auto_138305 ) ) ( OBJ-AT ?auto_138299 ?auto_138305 ) ( IN-CITY ?auto_138307 ?auto_138304 ) ( not ( = ?auto_138296 ?auto_138307 ) ) ( OBJ-AT ?auto_138297 ?auto_138307 ) ( IN-CITY ?auto_138306 ?auto_138304 ) ( not ( = ?auto_138296 ?auto_138306 ) ) ( OBJ-AT ?auto_138298 ?auto_138306 ) ( IN-CITY ?auto_138302 ?auto_138304 ) ( not ( = ?auto_138296 ?auto_138302 ) ) ( OBJ-AT ?auto_138301 ?auto_138302 ) ( IN-CITY ?auto_138303 ?auto_138304 ) ( not ( = ?auto_138296 ?auto_138303 ) ) ( OBJ-AT ?auto_138300 ?auto_138303 ) ( TRUCK-AT ?auto_138308 ?auto_138296 ) ( not ( = ?auto_138300 ?auto_138301 ) ) ( not ( = ?auto_138302 ?auto_138303 ) ) ( not ( = ?auto_138300 ?auto_138298 ) ) ( not ( = ?auto_138301 ?auto_138298 ) ) ( not ( = ?auto_138306 ?auto_138302 ) ) ( not ( = ?auto_138306 ?auto_138303 ) ) ( not ( = ?auto_138300 ?auto_138297 ) ) ( not ( = ?auto_138301 ?auto_138297 ) ) ( not ( = ?auto_138298 ?auto_138297 ) ) ( not ( = ?auto_138307 ?auto_138306 ) ) ( not ( = ?auto_138307 ?auto_138302 ) ) ( not ( = ?auto_138307 ?auto_138303 ) ) ( not ( = ?auto_138300 ?auto_138299 ) ) ( not ( = ?auto_138301 ?auto_138299 ) ) ( not ( = ?auto_138298 ?auto_138299 ) ) ( not ( = ?auto_138297 ?auto_138299 ) ) ( not ( = ?auto_138305 ?auto_138307 ) ) ( not ( = ?auto_138305 ?auto_138306 ) ) ( not ( = ?auto_138305 ?auto_138302 ) ) ( not ( = ?auto_138305 ?auto_138303 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_138300 ?auto_138301 ?auto_138298 ?auto_138299 ?auto_138297 ?auto_138296 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_138352 - OBJ
      ?auto_138353 - OBJ
      ?auto_138354 - OBJ
      ?auto_138355 - OBJ
      ?auto_138356 - OBJ
      ?auto_138351 - LOCATION
    )
    :vars
    (
      ?auto_138360 - LOCATION
      ?auto_138359 - CITY
      ?auto_138362 - LOCATION
      ?auto_138361 - LOCATION
      ?auto_138357 - LOCATION
      ?auto_138358 - LOCATION
      ?auto_138363 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138360 ?auto_138359 ) ( IN-CITY ?auto_138351 ?auto_138359 ) ( not ( = ?auto_138351 ?auto_138360 ) ) ( OBJ-AT ?auto_138354 ?auto_138360 ) ( IN-CITY ?auto_138362 ?auto_138359 ) ( not ( = ?auto_138351 ?auto_138362 ) ) ( OBJ-AT ?auto_138352 ?auto_138362 ) ( IN-CITY ?auto_138361 ?auto_138359 ) ( not ( = ?auto_138351 ?auto_138361 ) ) ( OBJ-AT ?auto_138353 ?auto_138361 ) ( IN-CITY ?auto_138357 ?auto_138359 ) ( not ( = ?auto_138351 ?auto_138357 ) ) ( OBJ-AT ?auto_138355 ?auto_138357 ) ( IN-CITY ?auto_138358 ?auto_138359 ) ( not ( = ?auto_138351 ?auto_138358 ) ) ( OBJ-AT ?auto_138356 ?auto_138358 ) ( TRUCK-AT ?auto_138363 ?auto_138351 ) ( not ( = ?auto_138356 ?auto_138355 ) ) ( not ( = ?auto_138357 ?auto_138358 ) ) ( not ( = ?auto_138356 ?auto_138353 ) ) ( not ( = ?auto_138355 ?auto_138353 ) ) ( not ( = ?auto_138361 ?auto_138357 ) ) ( not ( = ?auto_138361 ?auto_138358 ) ) ( not ( = ?auto_138356 ?auto_138352 ) ) ( not ( = ?auto_138355 ?auto_138352 ) ) ( not ( = ?auto_138353 ?auto_138352 ) ) ( not ( = ?auto_138362 ?auto_138361 ) ) ( not ( = ?auto_138362 ?auto_138357 ) ) ( not ( = ?auto_138362 ?auto_138358 ) ) ( not ( = ?auto_138356 ?auto_138354 ) ) ( not ( = ?auto_138355 ?auto_138354 ) ) ( not ( = ?auto_138353 ?auto_138354 ) ) ( not ( = ?auto_138352 ?auto_138354 ) ) ( not ( = ?auto_138360 ?auto_138362 ) ) ( not ( = ?auto_138360 ?auto_138361 ) ) ( not ( = ?auto_138360 ?auto_138357 ) ) ( not ( = ?auto_138360 ?auto_138358 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_138356 ?auto_138355 ?auto_138353 ?auto_138354 ?auto_138352 ?auto_138351 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_139645 - OBJ
      ?auto_139646 - OBJ
      ?auto_139647 - OBJ
      ?auto_139648 - OBJ
      ?auto_139649 - OBJ
      ?auto_139644 - LOCATION
    )
    :vars
    (
      ?auto_139653 - LOCATION
      ?auto_139652 - CITY
      ?auto_139655 - LOCATION
      ?auto_139654 - LOCATION
      ?auto_139650 - LOCATION
      ?auto_139651 - LOCATION
      ?auto_139656 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139653 ?auto_139652 ) ( IN-CITY ?auto_139644 ?auto_139652 ) ( not ( = ?auto_139644 ?auto_139653 ) ) ( OBJ-AT ?auto_139646 ?auto_139653 ) ( IN-CITY ?auto_139655 ?auto_139652 ) ( not ( = ?auto_139644 ?auto_139655 ) ) ( OBJ-AT ?auto_139645 ?auto_139655 ) ( IN-CITY ?auto_139654 ?auto_139652 ) ( not ( = ?auto_139644 ?auto_139654 ) ) ( OBJ-AT ?auto_139649 ?auto_139654 ) ( IN-CITY ?auto_139650 ?auto_139652 ) ( not ( = ?auto_139644 ?auto_139650 ) ) ( OBJ-AT ?auto_139648 ?auto_139650 ) ( IN-CITY ?auto_139651 ?auto_139652 ) ( not ( = ?auto_139644 ?auto_139651 ) ) ( OBJ-AT ?auto_139647 ?auto_139651 ) ( TRUCK-AT ?auto_139656 ?auto_139644 ) ( not ( = ?auto_139647 ?auto_139648 ) ) ( not ( = ?auto_139650 ?auto_139651 ) ) ( not ( = ?auto_139647 ?auto_139649 ) ) ( not ( = ?auto_139648 ?auto_139649 ) ) ( not ( = ?auto_139654 ?auto_139650 ) ) ( not ( = ?auto_139654 ?auto_139651 ) ) ( not ( = ?auto_139647 ?auto_139645 ) ) ( not ( = ?auto_139648 ?auto_139645 ) ) ( not ( = ?auto_139649 ?auto_139645 ) ) ( not ( = ?auto_139655 ?auto_139654 ) ) ( not ( = ?auto_139655 ?auto_139650 ) ) ( not ( = ?auto_139655 ?auto_139651 ) ) ( not ( = ?auto_139647 ?auto_139646 ) ) ( not ( = ?auto_139648 ?auto_139646 ) ) ( not ( = ?auto_139649 ?auto_139646 ) ) ( not ( = ?auto_139645 ?auto_139646 ) ) ( not ( = ?auto_139653 ?auto_139655 ) ) ( not ( = ?auto_139653 ?auto_139654 ) ) ( not ( = ?auto_139653 ?auto_139650 ) ) ( not ( = ?auto_139653 ?auto_139651 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_139647 ?auto_139648 ?auto_139649 ?auto_139646 ?auto_139645 ?auto_139644 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_139700 - OBJ
      ?auto_139701 - OBJ
      ?auto_139702 - OBJ
      ?auto_139703 - OBJ
      ?auto_139704 - OBJ
      ?auto_139699 - LOCATION
    )
    :vars
    (
      ?auto_139708 - LOCATION
      ?auto_139707 - CITY
      ?auto_139710 - LOCATION
      ?auto_139709 - LOCATION
      ?auto_139705 - LOCATION
      ?auto_139706 - LOCATION
      ?auto_139711 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139708 ?auto_139707 ) ( IN-CITY ?auto_139699 ?auto_139707 ) ( not ( = ?auto_139699 ?auto_139708 ) ) ( OBJ-AT ?auto_139701 ?auto_139708 ) ( IN-CITY ?auto_139710 ?auto_139707 ) ( not ( = ?auto_139699 ?auto_139710 ) ) ( OBJ-AT ?auto_139700 ?auto_139710 ) ( IN-CITY ?auto_139709 ?auto_139707 ) ( not ( = ?auto_139699 ?auto_139709 ) ) ( OBJ-AT ?auto_139703 ?auto_139709 ) ( IN-CITY ?auto_139705 ?auto_139707 ) ( not ( = ?auto_139699 ?auto_139705 ) ) ( OBJ-AT ?auto_139704 ?auto_139705 ) ( IN-CITY ?auto_139706 ?auto_139707 ) ( not ( = ?auto_139699 ?auto_139706 ) ) ( OBJ-AT ?auto_139702 ?auto_139706 ) ( TRUCK-AT ?auto_139711 ?auto_139699 ) ( not ( = ?auto_139702 ?auto_139704 ) ) ( not ( = ?auto_139705 ?auto_139706 ) ) ( not ( = ?auto_139702 ?auto_139703 ) ) ( not ( = ?auto_139704 ?auto_139703 ) ) ( not ( = ?auto_139709 ?auto_139705 ) ) ( not ( = ?auto_139709 ?auto_139706 ) ) ( not ( = ?auto_139702 ?auto_139700 ) ) ( not ( = ?auto_139704 ?auto_139700 ) ) ( not ( = ?auto_139703 ?auto_139700 ) ) ( not ( = ?auto_139710 ?auto_139709 ) ) ( not ( = ?auto_139710 ?auto_139705 ) ) ( not ( = ?auto_139710 ?auto_139706 ) ) ( not ( = ?auto_139702 ?auto_139701 ) ) ( not ( = ?auto_139704 ?auto_139701 ) ) ( not ( = ?auto_139703 ?auto_139701 ) ) ( not ( = ?auto_139700 ?auto_139701 ) ) ( not ( = ?auto_139708 ?auto_139710 ) ) ( not ( = ?auto_139708 ?auto_139709 ) ) ( not ( = ?auto_139708 ?auto_139705 ) ) ( not ( = ?auto_139708 ?auto_139706 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_139702 ?auto_139704 ?auto_139703 ?auto_139701 ?auto_139700 ?auto_139699 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_139929 - OBJ
      ?auto_139930 - OBJ
      ?auto_139931 - OBJ
      ?auto_139932 - OBJ
      ?auto_139933 - OBJ
      ?auto_139928 - LOCATION
    )
    :vars
    (
      ?auto_139937 - LOCATION
      ?auto_139936 - CITY
      ?auto_139939 - LOCATION
      ?auto_139938 - LOCATION
      ?auto_139934 - LOCATION
      ?auto_139935 - LOCATION
      ?auto_139940 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139937 ?auto_139936 ) ( IN-CITY ?auto_139928 ?auto_139936 ) ( not ( = ?auto_139928 ?auto_139937 ) ) ( OBJ-AT ?auto_139930 ?auto_139937 ) ( IN-CITY ?auto_139939 ?auto_139936 ) ( not ( = ?auto_139928 ?auto_139939 ) ) ( OBJ-AT ?auto_139929 ?auto_139939 ) ( IN-CITY ?auto_139938 ?auto_139936 ) ( not ( = ?auto_139928 ?auto_139938 ) ) ( OBJ-AT ?auto_139933 ?auto_139938 ) ( IN-CITY ?auto_139934 ?auto_139936 ) ( not ( = ?auto_139928 ?auto_139934 ) ) ( OBJ-AT ?auto_139931 ?auto_139934 ) ( IN-CITY ?auto_139935 ?auto_139936 ) ( not ( = ?auto_139928 ?auto_139935 ) ) ( OBJ-AT ?auto_139932 ?auto_139935 ) ( TRUCK-AT ?auto_139940 ?auto_139928 ) ( not ( = ?auto_139932 ?auto_139931 ) ) ( not ( = ?auto_139934 ?auto_139935 ) ) ( not ( = ?auto_139932 ?auto_139933 ) ) ( not ( = ?auto_139931 ?auto_139933 ) ) ( not ( = ?auto_139938 ?auto_139934 ) ) ( not ( = ?auto_139938 ?auto_139935 ) ) ( not ( = ?auto_139932 ?auto_139929 ) ) ( not ( = ?auto_139931 ?auto_139929 ) ) ( not ( = ?auto_139933 ?auto_139929 ) ) ( not ( = ?auto_139939 ?auto_139938 ) ) ( not ( = ?auto_139939 ?auto_139934 ) ) ( not ( = ?auto_139939 ?auto_139935 ) ) ( not ( = ?auto_139932 ?auto_139930 ) ) ( not ( = ?auto_139931 ?auto_139930 ) ) ( not ( = ?auto_139933 ?auto_139930 ) ) ( not ( = ?auto_139929 ?auto_139930 ) ) ( not ( = ?auto_139937 ?auto_139939 ) ) ( not ( = ?auto_139937 ?auto_139938 ) ) ( not ( = ?auto_139937 ?auto_139934 ) ) ( not ( = ?auto_139937 ?auto_139935 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_139932 ?auto_139931 ?auto_139933 ?auto_139930 ?auto_139929 ?auto_139928 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_140043 - OBJ
      ?auto_140044 - OBJ
      ?auto_140045 - OBJ
      ?auto_140046 - OBJ
      ?auto_140047 - OBJ
      ?auto_140042 - LOCATION
    )
    :vars
    (
      ?auto_140051 - LOCATION
      ?auto_140050 - CITY
      ?auto_140053 - LOCATION
      ?auto_140052 - LOCATION
      ?auto_140048 - LOCATION
      ?auto_140049 - LOCATION
      ?auto_140054 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140051 ?auto_140050 ) ( IN-CITY ?auto_140042 ?auto_140050 ) ( not ( = ?auto_140042 ?auto_140051 ) ) ( OBJ-AT ?auto_140044 ?auto_140051 ) ( IN-CITY ?auto_140053 ?auto_140050 ) ( not ( = ?auto_140042 ?auto_140053 ) ) ( OBJ-AT ?auto_140043 ?auto_140053 ) ( IN-CITY ?auto_140052 ?auto_140050 ) ( not ( = ?auto_140042 ?auto_140052 ) ) ( OBJ-AT ?auto_140046 ?auto_140052 ) ( IN-CITY ?auto_140048 ?auto_140050 ) ( not ( = ?auto_140042 ?auto_140048 ) ) ( OBJ-AT ?auto_140045 ?auto_140048 ) ( IN-CITY ?auto_140049 ?auto_140050 ) ( not ( = ?auto_140042 ?auto_140049 ) ) ( OBJ-AT ?auto_140047 ?auto_140049 ) ( TRUCK-AT ?auto_140054 ?auto_140042 ) ( not ( = ?auto_140047 ?auto_140045 ) ) ( not ( = ?auto_140048 ?auto_140049 ) ) ( not ( = ?auto_140047 ?auto_140046 ) ) ( not ( = ?auto_140045 ?auto_140046 ) ) ( not ( = ?auto_140052 ?auto_140048 ) ) ( not ( = ?auto_140052 ?auto_140049 ) ) ( not ( = ?auto_140047 ?auto_140043 ) ) ( not ( = ?auto_140045 ?auto_140043 ) ) ( not ( = ?auto_140046 ?auto_140043 ) ) ( not ( = ?auto_140053 ?auto_140052 ) ) ( not ( = ?auto_140053 ?auto_140048 ) ) ( not ( = ?auto_140053 ?auto_140049 ) ) ( not ( = ?auto_140047 ?auto_140044 ) ) ( not ( = ?auto_140045 ?auto_140044 ) ) ( not ( = ?auto_140046 ?auto_140044 ) ) ( not ( = ?auto_140043 ?auto_140044 ) ) ( not ( = ?auto_140051 ?auto_140053 ) ) ( not ( = ?auto_140051 ?auto_140052 ) ) ( not ( = ?auto_140051 ?auto_140048 ) ) ( not ( = ?auto_140051 ?auto_140049 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_140047 ?auto_140045 ?auto_140046 ?auto_140044 ?auto_140043 ?auto_140042 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_140272 - OBJ
      ?auto_140273 - OBJ
      ?auto_140274 - OBJ
      ?auto_140275 - OBJ
      ?auto_140276 - OBJ
      ?auto_140271 - LOCATION
    )
    :vars
    (
      ?auto_140280 - LOCATION
      ?auto_140279 - CITY
      ?auto_140282 - LOCATION
      ?auto_140281 - LOCATION
      ?auto_140277 - LOCATION
      ?auto_140278 - LOCATION
      ?auto_140283 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140280 ?auto_140279 ) ( IN-CITY ?auto_140271 ?auto_140279 ) ( not ( = ?auto_140271 ?auto_140280 ) ) ( OBJ-AT ?auto_140273 ?auto_140280 ) ( IN-CITY ?auto_140282 ?auto_140279 ) ( not ( = ?auto_140271 ?auto_140282 ) ) ( OBJ-AT ?auto_140272 ?auto_140282 ) ( IN-CITY ?auto_140281 ?auto_140279 ) ( not ( = ?auto_140271 ?auto_140281 ) ) ( OBJ-AT ?auto_140274 ?auto_140281 ) ( IN-CITY ?auto_140277 ?auto_140279 ) ( not ( = ?auto_140271 ?auto_140277 ) ) ( OBJ-AT ?auto_140276 ?auto_140277 ) ( IN-CITY ?auto_140278 ?auto_140279 ) ( not ( = ?auto_140271 ?auto_140278 ) ) ( OBJ-AT ?auto_140275 ?auto_140278 ) ( TRUCK-AT ?auto_140283 ?auto_140271 ) ( not ( = ?auto_140275 ?auto_140276 ) ) ( not ( = ?auto_140277 ?auto_140278 ) ) ( not ( = ?auto_140275 ?auto_140274 ) ) ( not ( = ?auto_140276 ?auto_140274 ) ) ( not ( = ?auto_140281 ?auto_140277 ) ) ( not ( = ?auto_140281 ?auto_140278 ) ) ( not ( = ?auto_140275 ?auto_140272 ) ) ( not ( = ?auto_140276 ?auto_140272 ) ) ( not ( = ?auto_140274 ?auto_140272 ) ) ( not ( = ?auto_140282 ?auto_140281 ) ) ( not ( = ?auto_140282 ?auto_140277 ) ) ( not ( = ?auto_140282 ?auto_140278 ) ) ( not ( = ?auto_140275 ?auto_140273 ) ) ( not ( = ?auto_140276 ?auto_140273 ) ) ( not ( = ?auto_140274 ?auto_140273 ) ) ( not ( = ?auto_140272 ?auto_140273 ) ) ( not ( = ?auto_140280 ?auto_140282 ) ) ( not ( = ?auto_140280 ?auto_140281 ) ) ( not ( = ?auto_140280 ?auto_140277 ) ) ( not ( = ?auto_140280 ?auto_140278 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_140275 ?auto_140276 ?auto_140274 ?auto_140273 ?auto_140272 ?auto_140271 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_140327 - OBJ
      ?auto_140328 - OBJ
      ?auto_140329 - OBJ
      ?auto_140330 - OBJ
      ?auto_140331 - OBJ
      ?auto_140326 - LOCATION
    )
    :vars
    (
      ?auto_140335 - LOCATION
      ?auto_140334 - CITY
      ?auto_140337 - LOCATION
      ?auto_140336 - LOCATION
      ?auto_140332 - LOCATION
      ?auto_140333 - LOCATION
      ?auto_140338 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140335 ?auto_140334 ) ( IN-CITY ?auto_140326 ?auto_140334 ) ( not ( = ?auto_140326 ?auto_140335 ) ) ( OBJ-AT ?auto_140328 ?auto_140335 ) ( IN-CITY ?auto_140337 ?auto_140334 ) ( not ( = ?auto_140326 ?auto_140337 ) ) ( OBJ-AT ?auto_140327 ?auto_140337 ) ( IN-CITY ?auto_140336 ?auto_140334 ) ( not ( = ?auto_140326 ?auto_140336 ) ) ( OBJ-AT ?auto_140329 ?auto_140336 ) ( IN-CITY ?auto_140332 ?auto_140334 ) ( not ( = ?auto_140326 ?auto_140332 ) ) ( OBJ-AT ?auto_140330 ?auto_140332 ) ( IN-CITY ?auto_140333 ?auto_140334 ) ( not ( = ?auto_140326 ?auto_140333 ) ) ( OBJ-AT ?auto_140331 ?auto_140333 ) ( TRUCK-AT ?auto_140338 ?auto_140326 ) ( not ( = ?auto_140331 ?auto_140330 ) ) ( not ( = ?auto_140332 ?auto_140333 ) ) ( not ( = ?auto_140331 ?auto_140329 ) ) ( not ( = ?auto_140330 ?auto_140329 ) ) ( not ( = ?auto_140336 ?auto_140332 ) ) ( not ( = ?auto_140336 ?auto_140333 ) ) ( not ( = ?auto_140331 ?auto_140327 ) ) ( not ( = ?auto_140330 ?auto_140327 ) ) ( not ( = ?auto_140329 ?auto_140327 ) ) ( not ( = ?auto_140337 ?auto_140336 ) ) ( not ( = ?auto_140337 ?auto_140332 ) ) ( not ( = ?auto_140337 ?auto_140333 ) ) ( not ( = ?auto_140331 ?auto_140328 ) ) ( not ( = ?auto_140330 ?auto_140328 ) ) ( not ( = ?auto_140329 ?auto_140328 ) ) ( not ( = ?auto_140327 ?auto_140328 ) ) ( not ( = ?auto_140335 ?auto_140337 ) ) ( not ( = ?auto_140335 ?auto_140336 ) ) ( not ( = ?auto_140335 ?auto_140332 ) ) ( not ( = ?auto_140335 ?auto_140333 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_140331 ?auto_140330 ?auto_140329 ?auto_140328 ?auto_140327 ?auto_140326 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_141922 - OBJ
      ?auto_141923 - OBJ
      ?auto_141924 - OBJ
      ?auto_141925 - OBJ
      ?auto_141926 - OBJ
      ?auto_141921 - LOCATION
    )
    :vars
    (
      ?auto_141930 - LOCATION
      ?auto_141929 - CITY
      ?auto_141932 - LOCATION
      ?auto_141931 - LOCATION
      ?auto_141927 - LOCATION
      ?auto_141928 - LOCATION
      ?auto_141933 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_141930 ?auto_141929 ) ( IN-CITY ?auto_141921 ?auto_141929 ) ( not ( = ?auto_141921 ?auto_141930 ) ) ( OBJ-AT ?auto_141922 ?auto_141930 ) ( IN-CITY ?auto_141932 ?auto_141929 ) ( not ( = ?auto_141921 ?auto_141932 ) ) ( OBJ-AT ?auto_141926 ?auto_141932 ) ( IN-CITY ?auto_141931 ?auto_141929 ) ( not ( = ?auto_141921 ?auto_141931 ) ) ( OBJ-AT ?auto_141925 ?auto_141931 ) ( IN-CITY ?auto_141927 ?auto_141929 ) ( not ( = ?auto_141921 ?auto_141927 ) ) ( OBJ-AT ?auto_141924 ?auto_141927 ) ( IN-CITY ?auto_141928 ?auto_141929 ) ( not ( = ?auto_141921 ?auto_141928 ) ) ( OBJ-AT ?auto_141923 ?auto_141928 ) ( TRUCK-AT ?auto_141933 ?auto_141921 ) ( not ( = ?auto_141923 ?auto_141924 ) ) ( not ( = ?auto_141927 ?auto_141928 ) ) ( not ( = ?auto_141923 ?auto_141925 ) ) ( not ( = ?auto_141924 ?auto_141925 ) ) ( not ( = ?auto_141931 ?auto_141927 ) ) ( not ( = ?auto_141931 ?auto_141928 ) ) ( not ( = ?auto_141923 ?auto_141926 ) ) ( not ( = ?auto_141924 ?auto_141926 ) ) ( not ( = ?auto_141925 ?auto_141926 ) ) ( not ( = ?auto_141932 ?auto_141931 ) ) ( not ( = ?auto_141932 ?auto_141927 ) ) ( not ( = ?auto_141932 ?auto_141928 ) ) ( not ( = ?auto_141923 ?auto_141922 ) ) ( not ( = ?auto_141924 ?auto_141922 ) ) ( not ( = ?auto_141925 ?auto_141922 ) ) ( not ( = ?auto_141926 ?auto_141922 ) ) ( not ( = ?auto_141930 ?auto_141932 ) ) ( not ( = ?auto_141930 ?auto_141931 ) ) ( not ( = ?auto_141930 ?auto_141927 ) ) ( not ( = ?auto_141930 ?auto_141928 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_141923 ?auto_141924 ?auto_141925 ?auto_141922 ?auto_141926 ?auto_141921 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_141977 - OBJ
      ?auto_141978 - OBJ
      ?auto_141979 - OBJ
      ?auto_141980 - OBJ
      ?auto_141981 - OBJ
      ?auto_141976 - LOCATION
    )
    :vars
    (
      ?auto_141985 - LOCATION
      ?auto_141984 - CITY
      ?auto_141987 - LOCATION
      ?auto_141986 - LOCATION
      ?auto_141982 - LOCATION
      ?auto_141983 - LOCATION
      ?auto_141988 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_141985 ?auto_141984 ) ( IN-CITY ?auto_141976 ?auto_141984 ) ( not ( = ?auto_141976 ?auto_141985 ) ) ( OBJ-AT ?auto_141977 ?auto_141985 ) ( IN-CITY ?auto_141987 ?auto_141984 ) ( not ( = ?auto_141976 ?auto_141987 ) ) ( OBJ-AT ?auto_141980 ?auto_141987 ) ( IN-CITY ?auto_141986 ?auto_141984 ) ( not ( = ?auto_141976 ?auto_141986 ) ) ( OBJ-AT ?auto_141981 ?auto_141986 ) ( IN-CITY ?auto_141982 ?auto_141984 ) ( not ( = ?auto_141976 ?auto_141982 ) ) ( OBJ-AT ?auto_141979 ?auto_141982 ) ( IN-CITY ?auto_141983 ?auto_141984 ) ( not ( = ?auto_141976 ?auto_141983 ) ) ( OBJ-AT ?auto_141978 ?auto_141983 ) ( TRUCK-AT ?auto_141988 ?auto_141976 ) ( not ( = ?auto_141978 ?auto_141979 ) ) ( not ( = ?auto_141982 ?auto_141983 ) ) ( not ( = ?auto_141978 ?auto_141981 ) ) ( not ( = ?auto_141979 ?auto_141981 ) ) ( not ( = ?auto_141986 ?auto_141982 ) ) ( not ( = ?auto_141986 ?auto_141983 ) ) ( not ( = ?auto_141978 ?auto_141980 ) ) ( not ( = ?auto_141979 ?auto_141980 ) ) ( not ( = ?auto_141981 ?auto_141980 ) ) ( not ( = ?auto_141987 ?auto_141986 ) ) ( not ( = ?auto_141987 ?auto_141982 ) ) ( not ( = ?auto_141987 ?auto_141983 ) ) ( not ( = ?auto_141978 ?auto_141977 ) ) ( not ( = ?auto_141979 ?auto_141977 ) ) ( not ( = ?auto_141981 ?auto_141977 ) ) ( not ( = ?auto_141980 ?auto_141977 ) ) ( not ( = ?auto_141985 ?auto_141987 ) ) ( not ( = ?auto_141985 ?auto_141986 ) ) ( not ( = ?auto_141985 ?auto_141982 ) ) ( not ( = ?auto_141985 ?auto_141983 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_141978 ?auto_141979 ?auto_141981 ?auto_141977 ?auto_141980 ?auto_141976 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_142206 - OBJ
      ?auto_142207 - OBJ
      ?auto_142208 - OBJ
      ?auto_142209 - OBJ
      ?auto_142210 - OBJ
      ?auto_142205 - LOCATION
    )
    :vars
    (
      ?auto_142214 - LOCATION
      ?auto_142213 - CITY
      ?auto_142216 - LOCATION
      ?auto_142215 - LOCATION
      ?auto_142211 - LOCATION
      ?auto_142212 - LOCATION
      ?auto_142217 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_142214 ?auto_142213 ) ( IN-CITY ?auto_142205 ?auto_142213 ) ( not ( = ?auto_142205 ?auto_142214 ) ) ( OBJ-AT ?auto_142206 ?auto_142214 ) ( IN-CITY ?auto_142216 ?auto_142213 ) ( not ( = ?auto_142205 ?auto_142216 ) ) ( OBJ-AT ?auto_142210 ?auto_142216 ) ( IN-CITY ?auto_142215 ?auto_142213 ) ( not ( = ?auto_142205 ?auto_142215 ) ) ( OBJ-AT ?auto_142208 ?auto_142215 ) ( IN-CITY ?auto_142211 ?auto_142213 ) ( not ( = ?auto_142205 ?auto_142211 ) ) ( OBJ-AT ?auto_142209 ?auto_142211 ) ( IN-CITY ?auto_142212 ?auto_142213 ) ( not ( = ?auto_142205 ?auto_142212 ) ) ( OBJ-AT ?auto_142207 ?auto_142212 ) ( TRUCK-AT ?auto_142217 ?auto_142205 ) ( not ( = ?auto_142207 ?auto_142209 ) ) ( not ( = ?auto_142211 ?auto_142212 ) ) ( not ( = ?auto_142207 ?auto_142208 ) ) ( not ( = ?auto_142209 ?auto_142208 ) ) ( not ( = ?auto_142215 ?auto_142211 ) ) ( not ( = ?auto_142215 ?auto_142212 ) ) ( not ( = ?auto_142207 ?auto_142210 ) ) ( not ( = ?auto_142209 ?auto_142210 ) ) ( not ( = ?auto_142208 ?auto_142210 ) ) ( not ( = ?auto_142216 ?auto_142215 ) ) ( not ( = ?auto_142216 ?auto_142211 ) ) ( not ( = ?auto_142216 ?auto_142212 ) ) ( not ( = ?auto_142207 ?auto_142206 ) ) ( not ( = ?auto_142209 ?auto_142206 ) ) ( not ( = ?auto_142208 ?auto_142206 ) ) ( not ( = ?auto_142210 ?auto_142206 ) ) ( not ( = ?auto_142214 ?auto_142216 ) ) ( not ( = ?auto_142214 ?auto_142215 ) ) ( not ( = ?auto_142214 ?auto_142211 ) ) ( not ( = ?auto_142214 ?auto_142212 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_142207 ?auto_142209 ?auto_142208 ?auto_142206 ?auto_142210 ?auto_142205 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_142320 - OBJ
      ?auto_142321 - OBJ
      ?auto_142322 - OBJ
      ?auto_142323 - OBJ
      ?auto_142324 - OBJ
      ?auto_142319 - LOCATION
    )
    :vars
    (
      ?auto_142328 - LOCATION
      ?auto_142327 - CITY
      ?auto_142330 - LOCATION
      ?auto_142329 - LOCATION
      ?auto_142325 - LOCATION
      ?auto_142326 - LOCATION
      ?auto_142331 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_142328 ?auto_142327 ) ( IN-CITY ?auto_142319 ?auto_142327 ) ( not ( = ?auto_142319 ?auto_142328 ) ) ( OBJ-AT ?auto_142320 ?auto_142328 ) ( IN-CITY ?auto_142330 ?auto_142327 ) ( not ( = ?auto_142319 ?auto_142330 ) ) ( OBJ-AT ?auto_142323 ?auto_142330 ) ( IN-CITY ?auto_142329 ?auto_142327 ) ( not ( = ?auto_142319 ?auto_142329 ) ) ( OBJ-AT ?auto_142322 ?auto_142329 ) ( IN-CITY ?auto_142325 ?auto_142327 ) ( not ( = ?auto_142319 ?auto_142325 ) ) ( OBJ-AT ?auto_142324 ?auto_142325 ) ( IN-CITY ?auto_142326 ?auto_142327 ) ( not ( = ?auto_142319 ?auto_142326 ) ) ( OBJ-AT ?auto_142321 ?auto_142326 ) ( TRUCK-AT ?auto_142331 ?auto_142319 ) ( not ( = ?auto_142321 ?auto_142324 ) ) ( not ( = ?auto_142325 ?auto_142326 ) ) ( not ( = ?auto_142321 ?auto_142322 ) ) ( not ( = ?auto_142324 ?auto_142322 ) ) ( not ( = ?auto_142329 ?auto_142325 ) ) ( not ( = ?auto_142329 ?auto_142326 ) ) ( not ( = ?auto_142321 ?auto_142323 ) ) ( not ( = ?auto_142324 ?auto_142323 ) ) ( not ( = ?auto_142322 ?auto_142323 ) ) ( not ( = ?auto_142330 ?auto_142329 ) ) ( not ( = ?auto_142330 ?auto_142325 ) ) ( not ( = ?auto_142330 ?auto_142326 ) ) ( not ( = ?auto_142321 ?auto_142320 ) ) ( not ( = ?auto_142324 ?auto_142320 ) ) ( not ( = ?auto_142322 ?auto_142320 ) ) ( not ( = ?auto_142323 ?auto_142320 ) ) ( not ( = ?auto_142328 ?auto_142330 ) ) ( not ( = ?auto_142328 ?auto_142329 ) ) ( not ( = ?auto_142328 ?auto_142325 ) ) ( not ( = ?auto_142328 ?auto_142326 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_142321 ?auto_142324 ?auto_142322 ?auto_142320 ?auto_142323 ?auto_142319 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_142549 - OBJ
      ?auto_142550 - OBJ
      ?auto_142551 - OBJ
      ?auto_142552 - OBJ
      ?auto_142553 - OBJ
      ?auto_142548 - LOCATION
    )
    :vars
    (
      ?auto_142557 - LOCATION
      ?auto_142556 - CITY
      ?auto_142559 - LOCATION
      ?auto_142558 - LOCATION
      ?auto_142554 - LOCATION
      ?auto_142555 - LOCATION
      ?auto_142560 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_142557 ?auto_142556 ) ( IN-CITY ?auto_142548 ?auto_142556 ) ( not ( = ?auto_142548 ?auto_142557 ) ) ( OBJ-AT ?auto_142549 ?auto_142557 ) ( IN-CITY ?auto_142559 ?auto_142556 ) ( not ( = ?auto_142548 ?auto_142559 ) ) ( OBJ-AT ?auto_142551 ?auto_142559 ) ( IN-CITY ?auto_142558 ?auto_142556 ) ( not ( = ?auto_142548 ?auto_142558 ) ) ( OBJ-AT ?auto_142553 ?auto_142558 ) ( IN-CITY ?auto_142554 ?auto_142556 ) ( not ( = ?auto_142548 ?auto_142554 ) ) ( OBJ-AT ?auto_142552 ?auto_142554 ) ( IN-CITY ?auto_142555 ?auto_142556 ) ( not ( = ?auto_142548 ?auto_142555 ) ) ( OBJ-AT ?auto_142550 ?auto_142555 ) ( TRUCK-AT ?auto_142560 ?auto_142548 ) ( not ( = ?auto_142550 ?auto_142552 ) ) ( not ( = ?auto_142554 ?auto_142555 ) ) ( not ( = ?auto_142550 ?auto_142553 ) ) ( not ( = ?auto_142552 ?auto_142553 ) ) ( not ( = ?auto_142558 ?auto_142554 ) ) ( not ( = ?auto_142558 ?auto_142555 ) ) ( not ( = ?auto_142550 ?auto_142551 ) ) ( not ( = ?auto_142552 ?auto_142551 ) ) ( not ( = ?auto_142553 ?auto_142551 ) ) ( not ( = ?auto_142559 ?auto_142558 ) ) ( not ( = ?auto_142559 ?auto_142554 ) ) ( not ( = ?auto_142559 ?auto_142555 ) ) ( not ( = ?auto_142550 ?auto_142549 ) ) ( not ( = ?auto_142552 ?auto_142549 ) ) ( not ( = ?auto_142553 ?auto_142549 ) ) ( not ( = ?auto_142551 ?auto_142549 ) ) ( not ( = ?auto_142557 ?auto_142559 ) ) ( not ( = ?auto_142557 ?auto_142558 ) ) ( not ( = ?auto_142557 ?auto_142554 ) ) ( not ( = ?auto_142557 ?auto_142555 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_142550 ?auto_142552 ?auto_142553 ?auto_142549 ?auto_142551 ?auto_142548 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_142604 - OBJ
      ?auto_142605 - OBJ
      ?auto_142606 - OBJ
      ?auto_142607 - OBJ
      ?auto_142608 - OBJ
      ?auto_142603 - LOCATION
    )
    :vars
    (
      ?auto_142612 - LOCATION
      ?auto_142611 - CITY
      ?auto_142614 - LOCATION
      ?auto_142613 - LOCATION
      ?auto_142609 - LOCATION
      ?auto_142610 - LOCATION
      ?auto_142615 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_142612 ?auto_142611 ) ( IN-CITY ?auto_142603 ?auto_142611 ) ( not ( = ?auto_142603 ?auto_142612 ) ) ( OBJ-AT ?auto_142604 ?auto_142612 ) ( IN-CITY ?auto_142614 ?auto_142611 ) ( not ( = ?auto_142603 ?auto_142614 ) ) ( OBJ-AT ?auto_142606 ?auto_142614 ) ( IN-CITY ?auto_142613 ?auto_142611 ) ( not ( = ?auto_142603 ?auto_142613 ) ) ( OBJ-AT ?auto_142607 ?auto_142613 ) ( IN-CITY ?auto_142609 ?auto_142611 ) ( not ( = ?auto_142603 ?auto_142609 ) ) ( OBJ-AT ?auto_142608 ?auto_142609 ) ( IN-CITY ?auto_142610 ?auto_142611 ) ( not ( = ?auto_142603 ?auto_142610 ) ) ( OBJ-AT ?auto_142605 ?auto_142610 ) ( TRUCK-AT ?auto_142615 ?auto_142603 ) ( not ( = ?auto_142605 ?auto_142608 ) ) ( not ( = ?auto_142609 ?auto_142610 ) ) ( not ( = ?auto_142605 ?auto_142607 ) ) ( not ( = ?auto_142608 ?auto_142607 ) ) ( not ( = ?auto_142613 ?auto_142609 ) ) ( not ( = ?auto_142613 ?auto_142610 ) ) ( not ( = ?auto_142605 ?auto_142606 ) ) ( not ( = ?auto_142608 ?auto_142606 ) ) ( not ( = ?auto_142607 ?auto_142606 ) ) ( not ( = ?auto_142614 ?auto_142613 ) ) ( not ( = ?auto_142614 ?auto_142609 ) ) ( not ( = ?auto_142614 ?auto_142610 ) ) ( not ( = ?auto_142605 ?auto_142604 ) ) ( not ( = ?auto_142608 ?auto_142604 ) ) ( not ( = ?auto_142607 ?auto_142604 ) ) ( not ( = ?auto_142606 ?auto_142604 ) ) ( not ( = ?auto_142612 ?auto_142614 ) ) ( not ( = ?auto_142612 ?auto_142613 ) ) ( not ( = ?auto_142612 ?auto_142609 ) ) ( not ( = ?auto_142612 ?auto_142610 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_142605 ?auto_142608 ?auto_142607 ?auto_142604 ?auto_142606 ?auto_142603 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_143366 - OBJ
      ?auto_143367 - OBJ
      ?auto_143368 - OBJ
      ?auto_143369 - OBJ
      ?auto_143370 - OBJ
      ?auto_143365 - LOCATION
    )
    :vars
    (
      ?auto_143374 - LOCATION
      ?auto_143373 - CITY
      ?auto_143376 - LOCATION
      ?auto_143375 - LOCATION
      ?auto_143371 - LOCATION
      ?auto_143372 - LOCATION
      ?auto_143377 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_143374 ?auto_143373 ) ( IN-CITY ?auto_143365 ?auto_143373 ) ( not ( = ?auto_143365 ?auto_143374 ) ) ( OBJ-AT ?auto_143366 ?auto_143374 ) ( IN-CITY ?auto_143376 ?auto_143373 ) ( not ( = ?auto_143365 ?auto_143376 ) ) ( OBJ-AT ?auto_143370 ?auto_143376 ) ( IN-CITY ?auto_143375 ?auto_143373 ) ( not ( = ?auto_143365 ?auto_143375 ) ) ( OBJ-AT ?auto_143369 ?auto_143375 ) ( IN-CITY ?auto_143371 ?auto_143373 ) ( not ( = ?auto_143365 ?auto_143371 ) ) ( OBJ-AT ?auto_143367 ?auto_143371 ) ( IN-CITY ?auto_143372 ?auto_143373 ) ( not ( = ?auto_143365 ?auto_143372 ) ) ( OBJ-AT ?auto_143368 ?auto_143372 ) ( TRUCK-AT ?auto_143377 ?auto_143365 ) ( not ( = ?auto_143368 ?auto_143367 ) ) ( not ( = ?auto_143371 ?auto_143372 ) ) ( not ( = ?auto_143368 ?auto_143369 ) ) ( not ( = ?auto_143367 ?auto_143369 ) ) ( not ( = ?auto_143375 ?auto_143371 ) ) ( not ( = ?auto_143375 ?auto_143372 ) ) ( not ( = ?auto_143368 ?auto_143370 ) ) ( not ( = ?auto_143367 ?auto_143370 ) ) ( not ( = ?auto_143369 ?auto_143370 ) ) ( not ( = ?auto_143376 ?auto_143375 ) ) ( not ( = ?auto_143376 ?auto_143371 ) ) ( not ( = ?auto_143376 ?auto_143372 ) ) ( not ( = ?auto_143368 ?auto_143366 ) ) ( not ( = ?auto_143367 ?auto_143366 ) ) ( not ( = ?auto_143369 ?auto_143366 ) ) ( not ( = ?auto_143370 ?auto_143366 ) ) ( not ( = ?auto_143374 ?auto_143376 ) ) ( not ( = ?auto_143374 ?auto_143375 ) ) ( not ( = ?auto_143374 ?auto_143371 ) ) ( not ( = ?auto_143374 ?auto_143372 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_143368 ?auto_143367 ?auto_143369 ?auto_143366 ?auto_143370 ?auto_143365 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_143421 - OBJ
      ?auto_143422 - OBJ
      ?auto_143423 - OBJ
      ?auto_143424 - OBJ
      ?auto_143425 - OBJ
      ?auto_143420 - LOCATION
    )
    :vars
    (
      ?auto_143429 - LOCATION
      ?auto_143428 - CITY
      ?auto_143431 - LOCATION
      ?auto_143430 - LOCATION
      ?auto_143426 - LOCATION
      ?auto_143427 - LOCATION
      ?auto_143432 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_143429 ?auto_143428 ) ( IN-CITY ?auto_143420 ?auto_143428 ) ( not ( = ?auto_143420 ?auto_143429 ) ) ( OBJ-AT ?auto_143421 ?auto_143429 ) ( IN-CITY ?auto_143431 ?auto_143428 ) ( not ( = ?auto_143420 ?auto_143431 ) ) ( OBJ-AT ?auto_143424 ?auto_143431 ) ( IN-CITY ?auto_143430 ?auto_143428 ) ( not ( = ?auto_143420 ?auto_143430 ) ) ( OBJ-AT ?auto_143425 ?auto_143430 ) ( IN-CITY ?auto_143426 ?auto_143428 ) ( not ( = ?auto_143420 ?auto_143426 ) ) ( OBJ-AT ?auto_143422 ?auto_143426 ) ( IN-CITY ?auto_143427 ?auto_143428 ) ( not ( = ?auto_143420 ?auto_143427 ) ) ( OBJ-AT ?auto_143423 ?auto_143427 ) ( TRUCK-AT ?auto_143432 ?auto_143420 ) ( not ( = ?auto_143423 ?auto_143422 ) ) ( not ( = ?auto_143426 ?auto_143427 ) ) ( not ( = ?auto_143423 ?auto_143425 ) ) ( not ( = ?auto_143422 ?auto_143425 ) ) ( not ( = ?auto_143430 ?auto_143426 ) ) ( not ( = ?auto_143430 ?auto_143427 ) ) ( not ( = ?auto_143423 ?auto_143424 ) ) ( not ( = ?auto_143422 ?auto_143424 ) ) ( not ( = ?auto_143425 ?auto_143424 ) ) ( not ( = ?auto_143431 ?auto_143430 ) ) ( not ( = ?auto_143431 ?auto_143426 ) ) ( not ( = ?auto_143431 ?auto_143427 ) ) ( not ( = ?auto_143423 ?auto_143421 ) ) ( not ( = ?auto_143422 ?auto_143421 ) ) ( not ( = ?auto_143425 ?auto_143421 ) ) ( not ( = ?auto_143424 ?auto_143421 ) ) ( not ( = ?auto_143429 ?auto_143431 ) ) ( not ( = ?auto_143429 ?auto_143430 ) ) ( not ( = ?auto_143429 ?auto_143426 ) ) ( not ( = ?auto_143429 ?auto_143427 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_143423 ?auto_143422 ?auto_143425 ?auto_143421 ?auto_143424 ?auto_143420 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_143950 - OBJ
      ?auto_143951 - OBJ
      ?auto_143952 - OBJ
      ?auto_143953 - OBJ
      ?auto_143954 - OBJ
      ?auto_143949 - LOCATION
    )
    :vars
    (
      ?auto_143958 - LOCATION
      ?auto_143957 - CITY
      ?auto_143960 - LOCATION
      ?auto_143959 - LOCATION
      ?auto_143955 - LOCATION
      ?auto_143956 - LOCATION
      ?auto_143961 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_143958 ?auto_143957 ) ( IN-CITY ?auto_143949 ?auto_143957 ) ( not ( = ?auto_143949 ?auto_143958 ) ) ( OBJ-AT ?auto_143950 ?auto_143958 ) ( IN-CITY ?auto_143960 ?auto_143957 ) ( not ( = ?auto_143949 ?auto_143960 ) ) ( OBJ-AT ?auto_143954 ?auto_143960 ) ( IN-CITY ?auto_143959 ?auto_143957 ) ( not ( = ?auto_143949 ?auto_143959 ) ) ( OBJ-AT ?auto_143952 ?auto_143959 ) ( IN-CITY ?auto_143955 ?auto_143957 ) ( not ( = ?auto_143949 ?auto_143955 ) ) ( OBJ-AT ?auto_143951 ?auto_143955 ) ( IN-CITY ?auto_143956 ?auto_143957 ) ( not ( = ?auto_143949 ?auto_143956 ) ) ( OBJ-AT ?auto_143953 ?auto_143956 ) ( TRUCK-AT ?auto_143961 ?auto_143949 ) ( not ( = ?auto_143953 ?auto_143951 ) ) ( not ( = ?auto_143955 ?auto_143956 ) ) ( not ( = ?auto_143953 ?auto_143952 ) ) ( not ( = ?auto_143951 ?auto_143952 ) ) ( not ( = ?auto_143959 ?auto_143955 ) ) ( not ( = ?auto_143959 ?auto_143956 ) ) ( not ( = ?auto_143953 ?auto_143954 ) ) ( not ( = ?auto_143951 ?auto_143954 ) ) ( not ( = ?auto_143952 ?auto_143954 ) ) ( not ( = ?auto_143960 ?auto_143959 ) ) ( not ( = ?auto_143960 ?auto_143955 ) ) ( not ( = ?auto_143960 ?auto_143956 ) ) ( not ( = ?auto_143953 ?auto_143950 ) ) ( not ( = ?auto_143951 ?auto_143950 ) ) ( not ( = ?auto_143952 ?auto_143950 ) ) ( not ( = ?auto_143954 ?auto_143950 ) ) ( not ( = ?auto_143958 ?auto_143960 ) ) ( not ( = ?auto_143958 ?auto_143959 ) ) ( not ( = ?auto_143958 ?auto_143955 ) ) ( not ( = ?auto_143958 ?auto_143956 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_143953 ?auto_143951 ?auto_143952 ?auto_143950 ?auto_143954 ?auto_143949 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_144123 - OBJ
      ?auto_144124 - OBJ
      ?auto_144125 - OBJ
      ?auto_144126 - OBJ
      ?auto_144127 - OBJ
      ?auto_144122 - LOCATION
    )
    :vars
    (
      ?auto_144131 - LOCATION
      ?auto_144130 - CITY
      ?auto_144133 - LOCATION
      ?auto_144132 - LOCATION
      ?auto_144128 - LOCATION
      ?auto_144129 - LOCATION
      ?auto_144134 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144131 ?auto_144130 ) ( IN-CITY ?auto_144122 ?auto_144130 ) ( not ( = ?auto_144122 ?auto_144131 ) ) ( OBJ-AT ?auto_144123 ?auto_144131 ) ( IN-CITY ?auto_144133 ?auto_144130 ) ( not ( = ?auto_144122 ?auto_144133 ) ) ( OBJ-AT ?auto_144126 ?auto_144133 ) ( IN-CITY ?auto_144132 ?auto_144130 ) ( not ( = ?auto_144122 ?auto_144132 ) ) ( OBJ-AT ?auto_144125 ?auto_144132 ) ( IN-CITY ?auto_144128 ?auto_144130 ) ( not ( = ?auto_144122 ?auto_144128 ) ) ( OBJ-AT ?auto_144124 ?auto_144128 ) ( IN-CITY ?auto_144129 ?auto_144130 ) ( not ( = ?auto_144122 ?auto_144129 ) ) ( OBJ-AT ?auto_144127 ?auto_144129 ) ( TRUCK-AT ?auto_144134 ?auto_144122 ) ( not ( = ?auto_144127 ?auto_144124 ) ) ( not ( = ?auto_144128 ?auto_144129 ) ) ( not ( = ?auto_144127 ?auto_144125 ) ) ( not ( = ?auto_144124 ?auto_144125 ) ) ( not ( = ?auto_144132 ?auto_144128 ) ) ( not ( = ?auto_144132 ?auto_144129 ) ) ( not ( = ?auto_144127 ?auto_144126 ) ) ( not ( = ?auto_144124 ?auto_144126 ) ) ( not ( = ?auto_144125 ?auto_144126 ) ) ( not ( = ?auto_144133 ?auto_144132 ) ) ( not ( = ?auto_144133 ?auto_144128 ) ) ( not ( = ?auto_144133 ?auto_144129 ) ) ( not ( = ?auto_144127 ?auto_144123 ) ) ( not ( = ?auto_144124 ?auto_144123 ) ) ( not ( = ?auto_144125 ?auto_144123 ) ) ( not ( = ?auto_144126 ?auto_144123 ) ) ( not ( = ?auto_144131 ?auto_144133 ) ) ( not ( = ?auto_144131 ?auto_144132 ) ) ( not ( = ?auto_144131 ?auto_144128 ) ) ( not ( = ?auto_144131 ?auto_144129 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_144127 ?auto_144124 ?auto_144125 ?auto_144123 ?auto_144126 ?auto_144122 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_144293 - OBJ
      ?auto_144294 - OBJ
      ?auto_144295 - OBJ
      ?auto_144296 - OBJ
      ?auto_144297 - OBJ
      ?auto_144292 - LOCATION
    )
    :vars
    (
      ?auto_144301 - LOCATION
      ?auto_144300 - CITY
      ?auto_144303 - LOCATION
      ?auto_144302 - LOCATION
      ?auto_144298 - LOCATION
      ?auto_144299 - LOCATION
      ?auto_144304 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144301 ?auto_144300 ) ( IN-CITY ?auto_144292 ?auto_144300 ) ( not ( = ?auto_144292 ?auto_144301 ) ) ( OBJ-AT ?auto_144293 ?auto_144301 ) ( IN-CITY ?auto_144303 ?auto_144300 ) ( not ( = ?auto_144292 ?auto_144303 ) ) ( OBJ-AT ?auto_144295 ?auto_144303 ) ( IN-CITY ?auto_144302 ?auto_144300 ) ( not ( = ?auto_144292 ?auto_144302 ) ) ( OBJ-AT ?auto_144297 ?auto_144302 ) ( IN-CITY ?auto_144298 ?auto_144300 ) ( not ( = ?auto_144292 ?auto_144298 ) ) ( OBJ-AT ?auto_144294 ?auto_144298 ) ( IN-CITY ?auto_144299 ?auto_144300 ) ( not ( = ?auto_144292 ?auto_144299 ) ) ( OBJ-AT ?auto_144296 ?auto_144299 ) ( TRUCK-AT ?auto_144304 ?auto_144292 ) ( not ( = ?auto_144296 ?auto_144294 ) ) ( not ( = ?auto_144298 ?auto_144299 ) ) ( not ( = ?auto_144296 ?auto_144297 ) ) ( not ( = ?auto_144294 ?auto_144297 ) ) ( not ( = ?auto_144302 ?auto_144298 ) ) ( not ( = ?auto_144302 ?auto_144299 ) ) ( not ( = ?auto_144296 ?auto_144295 ) ) ( not ( = ?auto_144294 ?auto_144295 ) ) ( not ( = ?auto_144297 ?auto_144295 ) ) ( not ( = ?auto_144303 ?auto_144302 ) ) ( not ( = ?auto_144303 ?auto_144298 ) ) ( not ( = ?auto_144303 ?auto_144299 ) ) ( not ( = ?auto_144296 ?auto_144293 ) ) ( not ( = ?auto_144294 ?auto_144293 ) ) ( not ( = ?auto_144297 ?auto_144293 ) ) ( not ( = ?auto_144295 ?auto_144293 ) ) ( not ( = ?auto_144301 ?auto_144303 ) ) ( not ( = ?auto_144301 ?auto_144302 ) ) ( not ( = ?auto_144301 ?auto_144298 ) ) ( not ( = ?auto_144301 ?auto_144299 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_144296 ?auto_144294 ?auto_144297 ?auto_144293 ?auto_144295 ?auto_144292 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_144407 - OBJ
      ?auto_144408 - OBJ
      ?auto_144409 - OBJ
      ?auto_144410 - OBJ
      ?auto_144411 - OBJ
      ?auto_144406 - LOCATION
    )
    :vars
    (
      ?auto_144415 - LOCATION
      ?auto_144414 - CITY
      ?auto_144417 - LOCATION
      ?auto_144416 - LOCATION
      ?auto_144412 - LOCATION
      ?auto_144413 - LOCATION
      ?auto_144418 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144415 ?auto_144414 ) ( IN-CITY ?auto_144406 ?auto_144414 ) ( not ( = ?auto_144406 ?auto_144415 ) ) ( OBJ-AT ?auto_144407 ?auto_144415 ) ( IN-CITY ?auto_144417 ?auto_144414 ) ( not ( = ?auto_144406 ?auto_144417 ) ) ( OBJ-AT ?auto_144409 ?auto_144417 ) ( IN-CITY ?auto_144416 ?auto_144414 ) ( not ( = ?auto_144406 ?auto_144416 ) ) ( OBJ-AT ?auto_144410 ?auto_144416 ) ( IN-CITY ?auto_144412 ?auto_144414 ) ( not ( = ?auto_144406 ?auto_144412 ) ) ( OBJ-AT ?auto_144408 ?auto_144412 ) ( IN-CITY ?auto_144413 ?auto_144414 ) ( not ( = ?auto_144406 ?auto_144413 ) ) ( OBJ-AT ?auto_144411 ?auto_144413 ) ( TRUCK-AT ?auto_144418 ?auto_144406 ) ( not ( = ?auto_144411 ?auto_144408 ) ) ( not ( = ?auto_144412 ?auto_144413 ) ) ( not ( = ?auto_144411 ?auto_144410 ) ) ( not ( = ?auto_144408 ?auto_144410 ) ) ( not ( = ?auto_144416 ?auto_144412 ) ) ( not ( = ?auto_144416 ?auto_144413 ) ) ( not ( = ?auto_144411 ?auto_144409 ) ) ( not ( = ?auto_144408 ?auto_144409 ) ) ( not ( = ?auto_144410 ?auto_144409 ) ) ( not ( = ?auto_144417 ?auto_144416 ) ) ( not ( = ?auto_144417 ?auto_144412 ) ) ( not ( = ?auto_144417 ?auto_144413 ) ) ( not ( = ?auto_144411 ?auto_144407 ) ) ( not ( = ?auto_144408 ?auto_144407 ) ) ( not ( = ?auto_144410 ?auto_144407 ) ) ( not ( = ?auto_144409 ?auto_144407 ) ) ( not ( = ?auto_144415 ?auto_144417 ) ) ( not ( = ?auto_144415 ?auto_144416 ) ) ( not ( = ?auto_144415 ?auto_144412 ) ) ( not ( = ?auto_144415 ?auto_144413 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_144411 ?auto_144408 ?auto_144410 ?auto_144407 ?auto_144409 ?auto_144406 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_145110 - OBJ
      ?auto_145111 - OBJ
      ?auto_145112 - OBJ
      ?auto_145113 - OBJ
      ?auto_145114 - OBJ
      ?auto_145109 - LOCATION
    )
    :vars
    (
      ?auto_145118 - LOCATION
      ?auto_145117 - CITY
      ?auto_145120 - LOCATION
      ?auto_145119 - LOCATION
      ?auto_145115 - LOCATION
      ?auto_145116 - LOCATION
      ?auto_145121 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_145118 ?auto_145117 ) ( IN-CITY ?auto_145109 ?auto_145117 ) ( not ( = ?auto_145109 ?auto_145118 ) ) ( OBJ-AT ?auto_145110 ?auto_145118 ) ( IN-CITY ?auto_145120 ?auto_145117 ) ( not ( = ?auto_145109 ?auto_145120 ) ) ( OBJ-AT ?auto_145114 ?auto_145120 ) ( IN-CITY ?auto_145119 ?auto_145117 ) ( not ( = ?auto_145109 ?auto_145119 ) ) ( OBJ-AT ?auto_145111 ?auto_145119 ) ( IN-CITY ?auto_145115 ?auto_145117 ) ( not ( = ?auto_145109 ?auto_145115 ) ) ( OBJ-AT ?auto_145113 ?auto_145115 ) ( IN-CITY ?auto_145116 ?auto_145117 ) ( not ( = ?auto_145109 ?auto_145116 ) ) ( OBJ-AT ?auto_145112 ?auto_145116 ) ( TRUCK-AT ?auto_145121 ?auto_145109 ) ( not ( = ?auto_145112 ?auto_145113 ) ) ( not ( = ?auto_145115 ?auto_145116 ) ) ( not ( = ?auto_145112 ?auto_145111 ) ) ( not ( = ?auto_145113 ?auto_145111 ) ) ( not ( = ?auto_145119 ?auto_145115 ) ) ( not ( = ?auto_145119 ?auto_145116 ) ) ( not ( = ?auto_145112 ?auto_145114 ) ) ( not ( = ?auto_145113 ?auto_145114 ) ) ( not ( = ?auto_145111 ?auto_145114 ) ) ( not ( = ?auto_145120 ?auto_145119 ) ) ( not ( = ?auto_145120 ?auto_145115 ) ) ( not ( = ?auto_145120 ?auto_145116 ) ) ( not ( = ?auto_145112 ?auto_145110 ) ) ( not ( = ?auto_145113 ?auto_145110 ) ) ( not ( = ?auto_145111 ?auto_145110 ) ) ( not ( = ?auto_145114 ?auto_145110 ) ) ( not ( = ?auto_145118 ?auto_145120 ) ) ( not ( = ?auto_145118 ?auto_145119 ) ) ( not ( = ?auto_145118 ?auto_145115 ) ) ( not ( = ?auto_145118 ?auto_145116 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_145112 ?auto_145113 ?auto_145111 ?auto_145110 ?auto_145114 ?auto_145109 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_145224 - OBJ
      ?auto_145225 - OBJ
      ?auto_145226 - OBJ
      ?auto_145227 - OBJ
      ?auto_145228 - OBJ
      ?auto_145223 - LOCATION
    )
    :vars
    (
      ?auto_145232 - LOCATION
      ?auto_145231 - CITY
      ?auto_145234 - LOCATION
      ?auto_145233 - LOCATION
      ?auto_145229 - LOCATION
      ?auto_145230 - LOCATION
      ?auto_145235 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_145232 ?auto_145231 ) ( IN-CITY ?auto_145223 ?auto_145231 ) ( not ( = ?auto_145223 ?auto_145232 ) ) ( OBJ-AT ?auto_145224 ?auto_145232 ) ( IN-CITY ?auto_145234 ?auto_145231 ) ( not ( = ?auto_145223 ?auto_145234 ) ) ( OBJ-AT ?auto_145227 ?auto_145234 ) ( IN-CITY ?auto_145233 ?auto_145231 ) ( not ( = ?auto_145223 ?auto_145233 ) ) ( OBJ-AT ?auto_145225 ?auto_145233 ) ( IN-CITY ?auto_145229 ?auto_145231 ) ( not ( = ?auto_145223 ?auto_145229 ) ) ( OBJ-AT ?auto_145228 ?auto_145229 ) ( IN-CITY ?auto_145230 ?auto_145231 ) ( not ( = ?auto_145223 ?auto_145230 ) ) ( OBJ-AT ?auto_145226 ?auto_145230 ) ( TRUCK-AT ?auto_145235 ?auto_145223 ) ( not ( = ?auto_145226 ?auto_145228 ) ) ( not ( = ?auto_145229 ?auto_145230 ) ) ( not ( = ?auto_145226 ?auto_145225 ) ) ( not ( = ?auto_145228 ?auto_145225 ) ) ( not ( = ?auto_145233 ?auto_145229 ) ) ( not ( = ?auto_145233 ?auto_145230 ) ) ( not ( = ?auto_145226 ?auto_145227 ) ) ( not ( = ?auto_145228 ?auto_145227 ) ) ( not ( = ?auto_145225 ?auto_145227 ) ) ( not ( = ?auto_145234 ?auto_145233 ) ) ( not ( = ?auto_145234 ?auto_145229 ) ) ( not ( = ?auto_145234 ?auto_145230 ) ) ( not ( = ?auto_145226 ?auto_145224 ) ) ( not ( = ?auto_145228 ?auto_145224 ) ) ( not ( = ?auto_145225 ?auto_145224 ) ) ( not ( = ?auto_145227 ?auto_145224 ) ) ( not ( = ?auto_145232 ?auto_145234 ) ) ( not ( = ?auto_145232 ?auto_145233 ) ) ( not ( = ?auto_145232 ?auto_145229 ) ) ( not ( = ?auto_145232 ?auto_145230 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_145226 ?auto_145228 ?auto_145225 ?auto_145224 ?auto_145227 ?auto_145223 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_145394 - OBJ
      ?auto_145395 - OBJ
      ?auto_145396 - OBJ
      ?auto_145397 - OBJ
      ?auto_145398 - OBJ
      ?auto_145393 - LOCATION
    )
    :vars
    (
      ?auto_145402 - LOCATION
      ?auto_145401 - CITY
      ?auto_145404 - LOCATION
      ?auto_145403 - LOCATION
      ?auto_145399 - LOCATION
      ?auto_145400 - LOCATION
      ?auto_145405 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_145402 ?auto_145401 ) ( IN-CITY ?auto_145393 ?auto_145401 ) ( not ( = ?auto_145393 ?auto_145402 ) ) ( OBJ-AT ?auto_145394 ?auto_145402 ) ( IN-CITY ?auto_145404 ?auto_145401 ) ( not ( = ?auto_145393 ?auto_145404 ) ) ( OBJ-AT ?auto_145398 ?auto_145404 ) ( IN-CITY ?auto_145403 ?auto_145401 ) ( not ( = ?auto_145393 ?auto_145403 ) ) ( OBJ-AT ?auto_145395 ?auto_145403 ) ( IN-CITY ?auto_145399 ?auto_145401 ) ( not ( = ?auto_145393 ?auto_145399 ) ) ( OBJ-AT ?auto_145396 ?auto_145399 ) ( IN-CITY ?auto_145400 ?auto_145401 ) ( not ( = ?auto_145393 ?auto_145400 ) ) ( OBJ-AT ?auto_145397 ?auto_145400 ) ( TRUCK-AT ?auto_145405 ?auto_145393 ) ( not ( = ?auto_145397 ?auto_145396 ) ) ( not ( = ?auto_145399 ?auto_145400 ) ) ( not ( = ?auto_145397 ?auto_145395 ) ) ( not ( = ?auto_145396 ?auto_145395 ) ) ( not ( = ?auto_145403 ?auto_145399 ) ) ( not ( = ?auto_145403 ?auto_145400 ) ) ( not ( = ?auto_145397 ?auto_145398 ) ) ( not ( = ?auto_145396 ?auto_145398 ) ) ( not ( = ?auto_145395 ?auto_145398 ) ) ( not ( = ?auto_145404 ?auto_145403 ) ) ( not ( = ?auto_145404 ?auto_145399 ) ) ( not ( = ?auto_145404 ?auto_145400 ) ) ( not ( = ?auto_145397 ?auto_145394 ) ) ( not ( = ?auto_145396 ?auto_145394 ) ) ( not ( = ?auto_145395 ?auto_145394 ) ) ( not ( = ?auto_145398 ?auto_145394 ) ) ( not ( = ?auto_145402 ?auto_145404 ) ) ( not ( = ?auto_145402 ?auto_145403 ) ) ( not ( = ?auto_145402 ?auto_145399 ) ) ( not ( = ?auto_145402 ?auto_145400 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_145397 ?auto_145396 ?auto_145395 ?auto_145394 ?auto_145398 ?auto_145393 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_145567 - OBJ
      ?auto_145568 - OBJ
      ?auto_145569 - OBJ
      ?auto_145570 - OBJ
      ?auto_145571 - OBJ
      ?auto_145566 - LOCATION
    )
    :vars
    (
      ?auto_145575 - LOCATION
      ?auto_145574 - CITY
      ?auto_145577 - LOCATION
      ?auto_145576 - LOCATION
      ?auto_145572 - LOCATION
      ?auto_145573 - LOCATION
      ?auto_145578 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_145575 ?auto_145574 ) ( IN-CITY ?auto_145566 ?auto_145574 ) ( not ( = ?auto_145566 ?auto_145575 ) ) ( OBJ-AT ?auto_145567 ?auto_145575 ) ( IN-CITY ?auto_145577 ?auto_145574 ) ( not ( = ?auto_145566 ?auto_145577 ) ) ( OBJ-AT ?auto_145570 ?auto_145577 ) ( IN-CITY ?auto_145576 ?auto_145574 ) ( not ( = ?auto_145566 ?auto_145576 ) ) ( OBJ-AT ?auto_145568 ?auto_145576 ) ( IN-CITY ?auto_145572 ?auto_145574 ) ( not ( = ?auto_145566 ?auto_145572 ) ) ( OBJ-AT ?auto_145569 ?auto_145572 ) ( IN-CITY ?auto_145573 ?auto_145574 ) ( not ( = ?auto_145566 ?auto_145573 ) ) ( OBJ-AT ?auto_145571 ?auto_145573 ) ( TRUCK-AT ?auto_145578 ?auto_145566 ) ( not ( = ?auto_145571 ?auto_145569 ) ) ( not ( = ?auto_145572 ?auto_145573 ) ) ( not ( = ?auto_145571 ?auto_145568 ) ) ( not ( = ?auto_145569 ?auto_145568 ) ) ( not ( = ?auto_145576 ?auto_145572 ) ) ( not ( = ?auto_145576 ?auto_145573 ) ) ( not ( = ?auto_145571 ?auto_145570 ) ) ( not ( = ?auto_145569 ?auto_145570 ) ) ( not ( = ?auto_145568 ?auto_145570 ) ) ( not ( = ?auto_145577 ?auto_145576 ) ) ( not ( = ?auto_145577 ?auto_145572 ) ) ( not ( = ?auto_145577 ?auto_145573 ) ) ( not ( = ?auto_145571 ?auto_145567 ) ) ( not ( = ?auto_145569 ?auto_145567 ) ) ( not ( = ?auto_145568 ?auto_145567 ) ) ( not ( = ?auto_145570 ?auto_145567 ) ) ( not ( = ?auto_145575 ?auto_145577 ) ) ( not ( = ?auto_145575 ?auto_145576 ) ) ( not ( = ?auto_145575 ?auto_145572 ) ) ( not ( = ?auto_145575 ?auto_145573 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_145571 ?auto_145569 ?auto_145568 ?auto_145567 ?auto_145570 ?auto_145566 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_146096 - OBJ
      ?auto_146097 - OBJ
      ?auto_146098 - OBJ
      ?auto_146099 - OBJ
      ?auto_146100 - OBJ
      ?auto_146095 - LOCATION
    )
    :vars
    (
      ?auto_146104 - LOCATION
      ?auto_146103 - CITY
      ?auto_146106 - LOCATION
      ?auto_146105 - LOCATION
      ?auto_146101 - LOCATION
      ?auto_146102 - LOCATION
      ?auto_146107 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_146104 ?auto_146103 ) ( IN-CITY ?auto_146095 ?auto_146103 ) ( not ( = ?auto_146095 ?auto_146104 ) ) ( OBJ-AT ?auto_146096 ?auto_146104 ) ( IN-CITY ?auto_146106 ?auto_146103 ) ( not ( = ?auto_146095 ?auto_146106 ) ) ( OBJ-AT ?auto_146098 ?auto_146106 ) ( IN-CITY ?auto_146105 ?auto_146103 ) ( not ( = ?auto_146095 ?auto_146105 ) ) ( OBJ-AT ?auto_146097 ?auto_146105 ) ( IN-CITY ?auto_146101 ?auto_146103 ) ( not ( = ?auto_146095 ?auto_146101 ) ) ( OBJ-AT ?auto_146100 ?auto_146101 ) ( IN-CITY ?auto_146102 ?auto_146103 ) ( not ( = ?auto_146095 ?auto_146102 ) ) ( OBJ-AT ?auto_146099 ?auto_146102 ) ( TRUCK-AT ?auto_146107 ?auto_146095 ) ( not ( = ?auto_146099 ?auto_146100 ) ) ( not ( = ?auto_146101 ?auto_146102 ) ) ( not ( = ?auto_146099 ?auto_146097 ) ) ( not ( = ?auto_146100 ?auto_146097 ) ) ( not ( = ?auto_146105 ?auto_146101 ) ) ( not ( = ?auto_146105 ?auto_146102 ) ) ( not ( = ?auto_146099 ?auto_146098 ) ) ( not ( = ?auto_146100 ?auto_146098 ) ) ( not ( = ?auto_146097 ?auto_146098 ) ) ( not ( = ?auto_146106 ?auto_146105 ) ) ( not ( = ?auto_146106 ?auto_146101 ) ) ( not ( = ?auto_146106 ?auto_146102 ) ) ( not ( = ?auto_146099 ?auto_146096 ) ) ( not ( = ?auto_146100 ?auto_146096 ) ) ( not ( = ?auto_146097 ?auto_146096 ) ) ( not ( = ?auto_146098 ?auto_146096 ) ) ( not ( = ?auto_146104 ?auto_146106 ) ) ( not ( = ?auto_146104 ?auto_146105 ) ) ( not ( = ?auto_146104 ?auto_146101 ) ) ( not ( = ?auto_146104 ?auto_146102 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_146099 ?auto_146100 ?auto_146097 ?auto_146096 ?auto_146098 ?auto_146095 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_146151 - OBJ
      ?auto_146152 - OBJ
      ?auto_146153 - OBJ
      ?auto_146154 - OBJ
      ?auto_146155 - OBJ
      ?auto_146150 - LOCATION
    )
    :vars
    (
      ?auto_146159 - LOCATION
      ?auto_146158 - CITY
      ?auto_146161 - LOCATION
      ?auto_146160 - LOCATION
      ?auto_146156 - LOCATION
      ?auto_146157 - LOCATION
      ?auto_146162 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_146159 ?auto_146158 ) ( IN-CITY ?auto_146150 ?auto_146158 ) ( not ( = ?auto_146150 ?auto_146159 ) ) ( OBJ-AT ?auto_146151 ?auto_146159 ) ( IN-CITY ?auto_146161 ?auto_146158 ) ( not ( = ?auto_146150 ?auto_146161 ) ) ( OBJ-AT ?auto_146153 ?auto_146161 ) ( IN-CITY ?auto_146160 ?auto_146158 ) ( not ( = ?auto_146150 ?auto_146160 ) ) ( OBJ-AT ?auto_146152 ?auto_146160 ) ( IN-CITY ?auto_146156 ?auto_146158 ) ( not ( = ?auto_146150 ?auto_146156 ) ) ( OBJ-AT ?auto_146154 ?auto_146156 ) ( IN-CITY ?auto_146157 ?auto_146158 ) ( not ( = ?auto_146150 ?auto_146157 ) ) ( OBJ-AT ?auto_146155 ?auto_146157 ) ( TRUCK-AT ?auto_146162 ?auto_146150 ) ( not ( = ?auto_146155 ?auto_146154 ) ) ( not ( = ?auto_146156 ?auto_146157 ) ) ( not ( = ?auto_146155 ?auto_146152 ) ) ( not ( = ?auto_146154 ?auto_146152 ) ) ( not ( = ?auto_146160 ?auto_146156 ) ) ( not ( = ?auto_146160 ?auto_146157 ) ) ( not ( = ?auto_146155 ?auto_146153 ) ) ( not ( = ?auto_146154 ?auto_146153 ) ) ( not ( = ?auto_146152 ?auto_146153 ) ) ( not ( = ?auto_146161 ?auto_146160 ) ) ( not ( = ?auto_146161 ?auto_146156 ) ) ( not ( = ?auto_146161 ?auto_146157 ) ) ( not ( = ?auto_146155 ?auto_146151 ) ) ( not ( = ?auto_146154 ?auto_146151 ) ) ( not ( = ?auto_146152 ?auto_146151 ) ) ( not ( = ?auto_146153 ?auto_146151 ) ) ( not ( = ?auto_146159 ?auto_146161 ) ) ( not ( = ?auto_146159 ?auto_146160 ) ) ( not ( = ?auto_146159 ?auto_146156 ) ) ( not ( = ?auto_146159 ?auto_146157 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_146155 ?auto_146154 ?auto_146152 ?auto_146151 ?auto_146153 ?auto_146150 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_146913 - OBJ
      ?auto_146914 - OBJ
      ?auto_146915 - OBJ
      ?auto_146916 - OBJ
      ?auto_146917 - OBJ
      ?auto_146912 - LOCATION
    )
    :vars
    (
      ?auto_146921 - LOCATION
      ?auto_146920 - CITY
      ?auto_146923 - LOCATION
      ?auto_146922 - LOCATION
      ?auto_146918 - LOCATION
      ?auto_146919 - LOCATION
      ?auto_146924 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_146921 ?auto_146920 ) ( IN-CITY ?auto_146912 ?auto_146920 ) ( not ( = ?auto_146912 ?auto_146921 ) ) ( OBJ-AT ?auto_146913 ?auto_146921 ) ( IN-CITY ?auto_146923 ?auto_146920 ) ( not ( = ?auto_146912 ?auto_146923 ) ) ( OBJ-AT ?auto_146914 ?auto_146923 ) ( IN-CITY ?auto_146922 ?auto_146920 ) ( not ( = ?auto_146912 ?auto_146922 ) ) ( OBJ-AT ?auto_146917 ?auto_146922 ) ( IN-CITY ?auto_146918 ?auto_146920 ) ( not ( = ?auto_146912 ?auto_146918 ) ) ( OBJ-AT ?auto_146916 ?auto_146918 ) ( IN-CITY ?auto_146919 ?auto_146920 ) ( not ( = ?auto_146912 ?auto_146919 ) ) ( OBJ-AT ?auto_146915 ?auto_146919 ) ( TRUCK-AT ?auto_146924 ?auto_146912 ) ( not ( = ?auto_146915 ?auto_146916 ) ) ( not ( = ?auto_146918 ?auto_146919 ) ) ( not ( = ?auto_146915 ?auto_146917 ) ) ( not ( = ?auto_146916 ?auto_146917 ) ) ( not ( = ?auto_146922 ?auto_146918 ) ) ( not ( = ?auto_146922 ?auto_146919 ) ) ( not ( = ?auto_146915 ?auto_146914 ) ) ( not ( = ?auto_146916 ?auto_146914 ) ) ( not ( = ?auto_146917 ?auto_146914 ) ) ( not ( = ?auto_146923 ?auto_146922 ) ) ( not ( = ?auto_146923 ?auto_146918 ) ) ( not ( = ?auto_146923 ?auto_146919 ) ) ( not ( = ?auto_146915 ?auto_146913 ) ) ( not ( = ?auto_146916 ?auto_146913 ) ) ( not ( = ?auto_146917 ?auto_146913 ) ) ( not ( = ?auto_146914 ?auto_146913 ) ) ( not ( = ?auto_146921 ?auto_146923 ) ) ( not ( = ?auto_146921 ?auto_146922 ) ) ( not ( = ?auto_146921 ?auto_146918 ) ) ( not ( = ?auto_146921 ?auto_146919 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_146915 ?auto_146916 ?auto_146917 ?auto_146913 ?auto_146914 ?auto_146912 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_146968 - OBJ
      ?auto_146969 - OBJ
      ?auto_146970 - OBJ
      ?auto_146971 - OBJ
      ?auto_146972 - OBJ
      ?auto_146967 - LOCATION
    )
    :vars
    (
      ?auto_146976 - LOCATION
      ?auto_146975 - CITY
      ?auto_146978 - LOCATION
      ?auto_146977 - LOCATION
      ?auto_146973 - LOCATION
      ?auto_146974 - LOCATION
      ?auto_146979 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_146976 ?auto_146975 ) ( IN-CITY ?auto_146967 ?auto_146975 ) ( not ( = ?auto_146967 ?auto_146976 ) ) ( OBJ-AT ?auto_146968 ?auto_146976 ) ( IN-CITY ?auto_146978 ?auto_146975 ) ( not ( = ?auto_146967 ?auto_146978 ) ) ( OBJ-AT ?auto_146969 ?auto_146978 ) ( IN-CITY ?auto_146977 ?auto_146975 ) ( not ( = ?auto_146967 ?auto_146977 ) ) ( OBJ-AT ?auto_146971 ?auto_146977 ) ( IN-CITY ?auto_146973 ?auto_146975 ) ( not ( = ?auto_146967 ?auto_146973 ) ) ( OBJ-AT ?auto_146972 ?auto_146973 ) ( IN-CITY ?auto_146974 ?auto_146975 ) ( not ( = ?auto_146967 ?auto_146974 ) ) ( OBJ-AT ?auto_146970 ?auto_146974 ) ( TRUCK-AT ?auto_146979 ?auto_146967 ) ( not ( = ?auto_146970 ?auto_146972 ) ) ( not ( = ?auto_146973 ?auto_146974 ) ) ( not ( = ?auto_146970 ?auto_146971 ) ) ( not ( = ?auto_146972 ?auto_146971 ) ) ( not ( = ?auto_146977 ?auto_146973 ) ) ( not ( = ?auto_146977 ?auto_146974 ) ) ( not ( = ?auto_146970 ?auto_146969 ) ) ( not ( = ?auto_146972 ?auto_146969 ) ) ( not ( = ?auto_146971 ?auto_146969 ) ) ( not ( = ?auto_146978 ?auto_146977 ) ) ( not ( = ?auto_146978 ?auto_146973 ) ) ( not ( = ?auto_146978 ?auto_146974 ) ) ( not ( = ?auto_146970 ?auto_146968 ) ) ( not ( = ?auto_146972 ?auto_146968 ) ) ( not ( = ?auto_146971 ?auto_146968 ) ) ( not ( = ?auto_146969 ?auto_146968 ) ) ( not ( = ?auto_146976 ?auto_146978 ) ) ( not ( = ?auto_146976 ?auto_146977 ) ) ( not ( = ?auto_146976 ?auto_146973 ) ) ( not ( = ?auto_146976 ?auto_146974 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_146970 ?auto_146972 ?auto_146971 ?auto_146968 ?auto_146969 ?auto_146967 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_147197 - OBJ
      ?auto_147198 - OBJ
      ?auto_147199 - OBJ
      ?auto_147200 - OBJ
      ?auto_147201 - OBJ
      ?auto_147196 - LOCATION
    )
    :vars
    (
      ?auto_147205 - LOCATION
      ?auto_147204 - CITY
      ?auto_147207 - LOCATION
      ?auto_147206 - LOCATION
      ?auto_147202 - LOCATION
      ?auto_147203 - LOCATION
      ?auto_147208 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147205 ?auto_147204 ) ( IN-CITY ?auto_147196 ?auto_147204 ) ( not ( = ?auto_147196 ?auto_147205 ) ) ( OBJ-AT ?auto_147197 ?auto_147205 ) ( IN-CITY ?auto_147207 ?auto_147204 ) ( not ( = ?auto_147196 ?auto_147207 ) ) ( OBJ-AT ?auto_147198 ?auto_147207 ) ( IN-CITY ?auto_147206 ?auto_147204 ) ( not ( = ?auto_147196 ?auto_147206 ) ) ( OBJ-AT ?auto_147201 ?auto_147206 ) ( IN-CITY ?auto_147202 ?auto_147204 ) ( not ( = ?auto_147196 ?auto_147202 ) ) ( OBJ-AT ?auto_147199 ?auto_147202 ) ( IN-CITY ?auto_147203 ?auto_147204 ) ( not ( = ?auto_147196 ?auto_147203 ) ) ( OBJ-AT ?auto_147200 ?auto_147203 ) ( TRUCK-AT ?auto_147208 ?auto_147196 ) ( not ( = ?auto_147200 ?auto_147199 ) ) ( not ( = ?auto_147202 ?auto_147203 ) ) ( not ( = ?auto_147200 ?auto_147201 ) ) ( not ( = ?auto_147199 ?auto_147201 ) ) ( not ( = ?auto_147206 ?auto_147202 ) ) ( not ( = ?auto_147206 ?auto_147203 ) ) ( not ( = ?auto_147200 ?auto_147198 ) ) ( not ( = ?auto_147199 ?auto_147198 ) ) ( not ( = ?auto_147201 ?auto_147198 ) ) ( not ( = ?auto_147207 ?auto_147206 ) ) ( not ( = ?auto_147207 ?auto_147202 ) ) ( not ( = ?auto_147207 ?auto_147203 ) ) ( not ( = ?auto_147200 ?auto_147197 ) ) ( not ( = ?auto_147199 ?auto_147197 ) ) ( not ( = ?auto_147201 ?auto_147197 ) ) ( not ( = ?auto_147198 ?auto_147197 ) ) ( not ( = ?auto_147205 ?auto_147207 ) ) ( not ( = ?auto_147205 ?auto_147206 ) ) ( not ( = ?auto_147205 ?auto_147202 ) ) ( not ( = ?auto_147205 ?auto_147203 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_147200 ?auto_147199 ?auto_147201 ?auto_147197 ?auto_147198 ?auto_147196 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_147311 - OBJ
      ?auto_147312 - OBJ
      ?auto_147313 - OBJ
      ?auto_147314 - OBJ
      ?auto_147315 - OBJ
      ?auto_147310 - LOCATION
    )
    :vars
    (
      ?auto_147319 - LOCATION
      ?auto_147318 - CITY
      ?auto_147321 - LOCATION
      ?auto_147320 - LOCATION
      ?auto_147316 - LOCATION
      ?auto_147317 - LOCATION
      ?auto_147322 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147319 ?auto_147318 ) ( IN-CITY ?auto_147310 ?auto_147318 ) ( not ( = ?auto_147310 ?auto_147319 ) ) ( OBJ-AT ?auto_147311 ?auto_147319 ) ( IN-CITY ?auto_147321 ?auto_147318 ) ( not ( = ?auto_147310 ?auto_147321 ) ) ( OBJ-AT ?auto_147312 ?auto_147321 ) ( IN-CITY ?auto_147320 ?auto_147318 ) ( not ( = ?auto_147310 ?auto_147320 ) ) ( OBJ-AT ?auto_147314 ?auto_147320 ) ( IN-CITY ?auto_147316 ?auto_147318 ) ( not ( = ?auto_147310 ?auto_147316 ) ) ( OBJ-AT ?auto_147313 ?auto_147316 ) ( IN-CITY ?auto_147317 ?auto_147318 ) ( not ( = ?auto_147310 ?auto_147317 ) ) ( OBJ-AT ?auto_147315 ?auto_147317 ) ( TRUCK-AT ?auto_147322 ?auto_147310 ) ( not ( = ?auto_147315 ?auto_147313 ) ) ( not ( = ?auto_147316 ?auto_147317 ) ) ( not ( = ?auto_147315 ?auto_147314 ) ) ( not ( = ?auto_147313 ?auto_147314 ) ) ( not ( = ?auto_147320 ?auto_147316 ) ) ( not ( = ?auto_147320 ?auto_147317 ) ) ( not ( = ?auto_147315 ?auto_147312 ) ) ( not ( = ?auto_147313 ?auto_147312 ) ) ( not ( = ?auto_147314 ?auto_147312 ) ) ( not ( = ?auto_147321 ?auto_147320 ) ) ( not ( = ?auto_147321 ?auto_147316 ) ) ( not ( = ?auto_147321 ?auto_147317 ) ) ( not ( = ?auto_147315 ?auto_147311 ) ) ( not ( = ?auto_147313 ?auto_147311 ) ) ( not ( = ?auto_147314 ?auto_147311 ) ) ( not ( = ?auto_147312 ?auto_147311 ) ) ( not ( = ?auto_147319 ?auto_147321 ) ) ( not ( = ?auto_147319 ?auto_147320 ) ) ( not ( = ?auto_147319 ?auto_147316 ) ) ( not ( = ?auto_147319 ?auto_147317 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_147315 ?auto_147313 ?auto_147314 ?auto_147311 ?auto_147312 ?auto_147310 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_147540 - OBJ
      ?auto_147541 - OBJ
      ?auto_147542 - OBJ
      ?auto_147543 - OBJ
      ?auto_147544 - OBJ
      ?auto_147539 - LOCATION
    )
    :vars
    (
      ?auto_147548 - LOCATION
      ?auto_147547 - CITY
      ?auto_147550 - LOCATION
      ?auto_147549 - LOCATION
      ?auto_147545 - LOCATION
      ?auto_147546 - LOCATION
      ?auto_147551 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147548 ?auto_147547 ) ( IN-CITY ?auto_147539 ?auto_147547 ) ( not ( = ?auto_147539 ?auto_147548 ) ) ( OBJ-AT ?auto_147540 ?auto_147548 ) ( IN-CITY ?auto_147550 ?auto_147547 ) ( not ( = ?auto_147539 ?auto_147550 ) ) ( OBJ-AT ?auto_147541 ?auto_147550 ) ( IN-CITY ?auto_147549 ?auto_147547 ) ( not ( = ?auto_147539 ?auto_147549 ) ) ( OBJ-AT ?auto_147542 ?auto_147549 ) ( IN-CITY ?auto_147545 ?auto_147547 ) ( not ( = ?auto_147539 ?auto_147545 ) ) ( OBJ-AT ?auto_147544 ?auto_147545 ) ( IN-CITY ?auto_147546 ?auto_147547 ) ( not ( = ?auto_147539 ?auto_147546 ) ) ( OBJ-AT ?auto_147543 ?auto_147546 ) ( TRUCK-AT ?auto_147551 ?auto_147539 ) ( not ( = ?auto_147543 ?auto_147544 ) ) ( not ( = ?auto_147545 ?auto_147546 ) ) ( not ( = ?auto_147543 ?auto_147542 ) ) ( not ( = ?auto_147544 ?auto_147542 ) ) ( not ( = ?auto_147549 ?auto_147545 ) ) ( not ( = ?auto_147549 ?auto_147546 ) ) ( not ( = ?auto_147543 ?auto_147541 ) ) ( not ( = ?auto_147544 ?auto_147541 ) ) ( not ( = ?auto_147542 ?auto_147541 ) ) ( not ( = ?auto_147550 ?auto_147549 ) ) ( not ( = ?auto_147550 ?auto_147545 ) ) ( not ( = ?auto_147550 ?auto_147546 ) ) ( not ( = ?auto_147543 ?auto_147540 ) ) ( not ( = ?auto_147544 ?auto_147540 ) ) ( not ( = ?auto_147542 ?auto_147540 ) ) ( not ( = ?auto_147541 ?auto_147540 ) ) ( not ( = ?auto_147548 ?auto_147550 ) ) ( not ( = ?auto_147548 ?auto_147549 ) ) ( not ( = ?auto_147548 ?auto_147545 ) ) ( not ( = ?auto_147548 ?auto_147546 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_147543 ?auto_147544 ?auto_147542 ?auto_147540 ?auto_147541 ?auto_147539 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_147595 - OBJ
      ?auto_147596 - OBJ
      ?auto_147597 - OBJ
      ?auto_147598 - OBJ
      ?auto_147599 - OBJ
      ?auto_147594 - LOCATION
    )
    :vars
    (
      ?auto_147603 - LOCATION
      ?auto_147602 - CITY
      ?auto_147605 - LOCATION
      ?auto_147604 - LOCATION
      ?auto_147600 - LOCATION
      ?auto_147601 - LOCATION
      ?auto_147606 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_147603 ?auto_147602 ) ( IN-CITY ?auto_147594 ?auto_147602 ) ( not ( = ?auto_147594 ?auto_147603 ) ) ( OBJ-AT ?auto_147595 ?auto_147603 ) ( IN-CITY ?auto_147605 ?auto_147602 ) ( not ( = ?auto_147594 ?auto_147605 ) ) ( OBJ-AT ?auto_147596 ?auto_147605 ) ( IN-CITY ?auto_147604 ?auto_147602 ) ( not ( = ?auto_147594 ?auto_147604 ) ) ( OBJ-AT ?auto_147597 ?auto_147604 ) ( IN-CITY ?auto_147600 ?auto_147602 ) ( not ( = ?auto_147594 ?auto_147600 ) ) ( OBJ-AT ?auto_147598 ?auto_147600 ) ( IN-CITY ?auto_147601 ?auto_147602 ) ( not ( = ?auto_147594 ?auto_147601 ) ) ( OBJ-AT ?auto_147599 ?auto_147601 ) ( TRUCK-AT ?auto_147606 ?auto_147594 ) ( not ( = ?auto_147599 ?auto_147598 ) ) ( not ( = ?auto_147600 ?auto_147601 ) ) ( not ( = ?auto_147599 ?auto_147597 ) ) ( not ( = ?auto_147598 ?auto_147597 ) ) ( not ( = ?auto_147604 ?auto_147600 ) ) ( not ( = ?auto_147604 ?auto_147601 ) ) ( not ( = ?auto_147599 ?auto_147596 ) ) ( not ( = ?auto_147598 ?auto_147596 ) ) ( not ( = ?auto_147597 ?auto_147596 ) ) ( not ( = ?auto_147605 ?auto_147604 ) ) ( not ( = ?auto_147605 ?auto_147600 ) ) ( not ( = ?auto_147605 ?auto_147601 ) ) ( not ( = ?auto_147599 ?auto_147595 ) ) ( not ( = ?auto_147598 ?auto_147595 ) ) ( not ( = ?auto_147597 ?auto_147595 ) ) ( not ( = ?auto_147596 ?auto_147595 ) ) ( not ( = ?auto_147603 ?auto_147605 ) ) ( not ( = ?auto_147603 ?auto_147604 ) ) ( not ( = ?auto_147603 ?auto_147600 ) ) ( not ( = ?auto_147603 ?auto_147601 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_147599 ?auto_147598 ?auto_147597 ?auto_147595 ?auto_147596 ?auto_147594 ) )
  )

)

