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

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_105157 - OBJ
      ?auto_105156 - LOCATION
    )
    :vars
    (
      ?auto_105159 - LOCATION
      ?auto_105160 - CITY
      ?auto_105158 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105159 ?auto_105160 ) ( IN-CITY ?auto_105156 ?auto_105160 ) ( not ( = ?auto_105156 ?auto_105159 ) ) ( OBJ-AT ?auto_105157 ?auto_105159 ) ( TRUCK-AT ?auto_105158 ?auto_105156 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_105158 ?auto_105156 ?auto_105159 ?auto_105160 )
      ( !LOAD-TRUCK ?auto_105157 ?auto_105158 ?auto_105159 )
      ( !DRIVE-TRUCK ?auto_105158 ?auto_105159 ?auto_105156 ?auto_105160 )
      ( !UNLOAD-TRUCK ?auto_105157 ?auto_105158 ?auto_105156 )
      ( DELIVER-1PKG-VERIFY ?auto_105157 ?auto_105156 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_105164 - OBJ
      ?auto_105163 - LOCATION
    )
    :vars
    (
      ?auto_105166 - LOCATION
      ?auto_105167 - CITY
      ?auto_105165 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105166 ?auto_105167 ) ( IN-CITY ?auto_105163 ?auto_105167 ) ( not ( = ?auto_105163 ?auto_105166 ) ) ( OBJ-AT ?auto_105164 ?auto_105166 ) ( TRUCK-AT ?auto_105165 ?auto_105163 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_105165 ?auto_105163 ?auto_105166 ?auto_105167 )
      ( !LOAD-TRUCK ?auto_105164 ?auto_105165 ?auto_105166 )
      ( !DRIVE-TRUCK ?auto_105165 ?auto_105166 ?auto_105163 ?auto_105167 )
      ( !UNLOAD-TRUCK ?auto_105164 ?auto_105165 ?auto_105163 )
      ( DELIVER-1PKG-VERIFY ?auto_105164 ?auto_105163 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_105178 - OBJ
      ?auto_105179 - OBJ
      ?auto_105177 - LOCATION
    )
    :vars
    (
      ?auto_105180 - LOCATION
      ?auto_105181 - CITY
      ?auto_105183 - LOCATION
      ?auto_105182 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105180 ?auto_105181 ) ( IN-CITY ?auto_105177 ?auto_105181 ) ( not ( = ?auto_105177 ?auto_105180 ) ) ( OBJ-AT ?auto_105179 ?auto_105180 ) ( IN-CITY ?auto_105183 ?auto_105181 ) ( not ( = ?auto_105177 ?auto_105183 ) ) ( OBJ-AT ?auto_105178 ?auto_105183 ) ( TRUCK-AT ?auto_105182 ?auto_105177 ) ( not ( = ?auto_105178 ?auto_105179 ) ) ( not ( = ?auto_105180 ?auto_105183 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_105178 ?auto_105177 )
      ( DELIVER-1PKG ?auto_105179 ?auto_105177 )
      ( DELIVER-2PKG-VERIFY ?auto_105178 ?auto_105179 ?auto_105177 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_105185 - OBJ
      ?auto_105186 - OBJ
      ?auto_105184 - LOCATION
    )
    :vars
    (
      ?auto_105190 - LOCATION
      ?auto_105189 - CITY
      ?auto_105187 - LOCATION
      ?auto_105188 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105190 ?auto_105189 ) ( IN-CITY ?auto_105184 ?auto_105189 ) ( not ( = ?auto_105184 ?auto_105190 ) ) ( OBJ-AT ?auto_105185 ?auto_105190 ) ( IN-CITY ?auto_105187 ?auto_105189 ) ( not ( = ?auto_105184 ?auto_105187 ) ) ( OBJ-AT ?auto_105186 ?auto_105187 ) ( TRUCK-AT ?auto_105188 ?auto_105184 ) ( not ( = ?auto_105186 ?auto_105185 ) ) ( not ( = ?auto_105190 ?auto_105187 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105186 ?auto_105185 ?auto_105184 )
      ( DELIVER-2PKG-VERIFY ?auto_105185 ?auto_105186 ?auto_105184 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_105202 - OBJ
      ?auto_105201 - LOCATION
    )
    :vars
    (
      ?auto_105204 - LOCATION
      ?auto_105205 - CITY
      ?auto_105203 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105204 ?auto_105205 ) ( IN-CITY ?auto_105201 ?auto_105205 ) ( not ( = ?auto_105201 ?auto_105204 ) ) ( OBJ-AT ?auto_105202 ?auto_105204 ) ( TRUCK-AT ?auto_105203 ?auto_105201 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_105203 ?auto_105201 ?auto_105204 ?auto_105205 )
      ( !LOAD-TRUCK ?auto_105202 ?auto_105203 ?auto_105204 )
      ( !DRIVE-TRUCK ?auto_105203 ?auto_105204 ?auto_105201 ?auto_105205 )
      ( !UNLOAD-TRUCK ?auto_105202 ?auto_105203 ?auto_105201 )
      ( DELIVER-1PKG-VERIFY ?auto_105202 ?auto_105201 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_105292 - OBJ
      ?auto_105293 - OBJ
      ?auto_105294 - OBJ
      ?auto_105291 - LOCATION
    )
    :vars
    (
      ?auto_105296 - LOCATION
      ?auto_105297 - CITY
      ?auto_105298 - LOCATION
      ?auto_105295 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105296 ?auto_105297 ) ( IN-CITY ?auto_105291 ?auto_105297 ) ( not ( = ?auto_105291 ?auto_105296 ) ) ( OBJ-AT ?auto_105294 ?auto_105296 ) ( OBJ-AT ?auto_105293 ?auto_105296 ) ( IN-CITY ?auto_105298 ?auto_105297 ) ( not ( = ?auto_105291 ?auto_105298 ) ) ( OBJ-AT ?auto_105292 ?auto_105298 ) ( TRUCK-AT ?auto_105295 ?auto_105291 ) ( not ( = ?auto_105292 ?auto_105293 ) ) ( not ( = ?auto_105296 ?auto_105298 ) ) ( not ( = ?auto_105292 ?auto_105294 ) ) ( not ( = ?auto_105293 ?auto_105294 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_105293 ?auto_105292 ?auto_105291 )
      ( DELIVER-1PKG ?auto_105294 ?auto_105291 )
      ( DELIVER-3PKG-VERIFY ?auto_105292 ?auto_105293 ?auto_105294 ?auto_105291 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_105309 - OBJ
      ?auto_105310 - OBJ
      ?auto_105311 - OBJ
      ?auto_105308 - LOCATION
    )
    :vars
    (
      ?auto_105312 - LOCATION
      ?auto_105315 - CITY
      ?auto_105313 - LOCATION
      ?auto_105314 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105312 ?auto_105315 ) ( IN-CITY ?auto_105308 ?auto_105315 ) ( not ( = ?auto_105308 ?auto_105312 ) ) ( OBJ-AT ?auto_105310 ?auto_105312 ) ( OBJ-AT ?auto_105311 ?auto_105312 ) ( IN-CITY ?auto_105313 ?auto_105315 ) ( not ( = ?auto_105308 ?auto_105313 ) ) ( OBJ-AT ?auto_105309 ?auto_105313 ) ( TRUCK-AT ?auto_105314 ?auto_105308 ) ( not ( = ?auto_105309 ?auto_105311 ) ) ( not ( = ?auto_105312 ?auto_105313 ) ) ( not ( = ?auto_105309 ?auto_105310 ) ) ( not ( = ?auto_105311 ?auto_105310 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_105309 ?auto_105311 ?auto_105310 ?auto_105308 )
      ( DELIVER-3PKG-VERIFY ?auto_105309 ?auto_105310 ?auto_105311 ?auto_105308 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_105326 - OBJ
      ?auto_105327 - OBJ
      ?auto_105328 - OBJ
      ?auto_105325 - LOCATION
    )
    :vars
    (
      ?auto_105330 - LOCATION
      ?auto_105331 - CITY
      ?auto_105332 - LOCATION
      ?auto_105329 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105330 ?auto_105331 ) ( IN-CITY ?auto_105325 ?auto_105331 ) ( not ( = ?auto_105325 ?auto_105330 ) ) ( OBJ-AT ?auto_105328 ?auto_105330 ) ( OBJ-AT ?auto_105326 ?auto_105330 ) ( IN-CITY ?auto_105332 ?auto_105331 ) ( not ( = ?auto_105325 ?auto_105332 ) ) ( OBJ-AT ?auto_105327 ?auto_105332 ) ( TRUCK-AT ?auto_105329 ?auto_105325 ) ( not ( = ?auto_105327 ?auto_105326 ) ) ( not ( = ?auto_105330 ?auto_105332 ) ) ( not ( = ?auto_105327 ?auto_105328 ) ) ( not ( = ?auto_105326 ?auto_105328 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_105327 ?auto_105328 ?auto_105326 ?auto_105325 )
      ( DELIVER-3PKG-VERIFY ?auto_105326 ?auto_105327 ?auto_105328 ?auto_105325 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_105343 - OBJ
      ?auto_105344 - OBJ
      ?auto_105345 - OBJ
      ?auto_105342 - LOCATION
    )
    :vars
    (
      ?auto_105347 - LOCATION
      ?auto_105348 - CITY
      ?auto_105349 - LOCATION
      ?auto_105346 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105347 ?auto_105348 ) ( IN-CITY ?auto_105342 ?auto_105348 ) ( not ( = ?auto_105342 ?auto_105347 ) ) ( OBJ-AT ?auto_105344 ?auto_105347 ) ( OBJ-AT ?auto_105343 ?auto_105347 ) ( IN-CITY ?auto_105349 ?auto_105348 ) ( not ( = ?auto_105342 ?auto_105349 ) ) ( OBJ-AT ?auto_105345 ?auto_105349 ) ( TRUCK-AT ?auto_105346 ?auto_105342 ) ( not ( = ?auto_105345 ?auto_105343 ) ) ( not ( = ?auto_105347 ?auto_105349 ) ) ( not ( = ?auto_105345 ?auto_105344 ) ) ( not ( = ?auto_105343 ?auto_105344 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_105345 ?auto_105344 ?auto_105343 ?auto_105342 )
      ( DELIVER-3PKG-VERIFY ?auto_105343 ?auto_105344 ?auto_105345 ?auto_105342 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_105378 - OBJ
      ?auto_105379 - OBJ
      ?auto_105380 - OBJ
      ?auto_105377 - LOCATION
    )
    :vars
    (
      ?auto_105382 - LOCATION
      ?auto_105383 - CITY
      ?auto_105384 - LOCATION
      ?auto_105381 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105382 ?auto_105383 ) ( IN-CITY ?auto_105377 ?auto_105383 ) ( not ( = ?auto_105377 ?auto_105382 ) ) ( OBJ-AT ?auto_105378 ?auto_105382 ) ( OBJ-AT ?auto_105380 ?auto_105382 ) ( IN-CITY ?auto_105384 ?auto_105383 ) ( not ( = ?auto_105377 ?auto_105384 ) ) ( OBJ-AT ?auto_105379 ?auto_105384 ) ( TRUCK-AT ?auto_105381 ?auto_105377 ) ( not ( = ?auto_105379 ?auto_105380 ) ) ( not ( = ?auto_105382 ?auto_105384 ) ) ( not ( = ?auto_105379 ?auto_105378 ) ) ( not ( = ?auto_105380 ?auto_105378 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_105379 ?auto_105378 ?auto_105380 ?auto_105377 )
      ( DELIVER-3PKG-VERIFY ?auto_105378 ?auto_105379 ?auto_105380 ?auto_105377 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_105395 - OBJ
      ?auto_105396 - OBJ
      ?auto_105397 - OBJ
      ?auto_105394 - LOCATION
    )
    :vars
    (
      ?auto_105399 - LOCATION
      ?auto_105400 - CITY
      ?auto_105401 - LOCATION
      ?auto_105398 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105399 ?auto_105400 ) ( IN-CITY ?auto_105394 ?auto_105400 ) ( not ( = ?auto_105394 ?auto_105399 ) ) ( OBJ-AT ?auto_105395 ?auto_105399 ) ( OBJ-AT ?auto_105396 ?auto_105399 ) ( IN-CITY ?auto_105401 ?auto_105400 ) ( not ( = ?auto_105394 ?auto_105401 ) ) ( OBJ-AT ?auto_105397 ?auto_105401 ) ( TRUCK-AT ?auto_105398 ?auto_105394 ) ( not ( = ?auto_105397 ?auto_105396 ) ) ( not ( = ?auto_105399 ?auto_105401 ) ) ( not ( = ?auto_105397 ?auto_105395 ) ) ( not ( = ?auto_105396 ?auto_105395 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_105397 ?auto_105395 ?auto_105396 ?auto_105394 )
      ( DELIVER-3PKG-VERIFY ?auto_105395 ?auto_105396 ?auto_105397 ?auto_105394 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_105451 - OBJ
      ?auto_105450 - LOCATION
    )
    :vars
    (
      ?auto_105453 - LOCATION
      ?auto_105454 - CITY
      ?auto_105452 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_105453 ?auto_105454 ) ( IN-CITY ?auto_105450 ?auto_105454 ) ( not ( = ?auto_105450 ?auto_105453 ) ) ( OBJ-AT ?auto_105451 ?auto_105453 ) ( TRUCK-AT ?auto_105452 ?auto_105450 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_105452 ?auto_105450 ?auto_105453 ?auto_105454 )
      ( !LOAD-TRUCK ?auto_105451 ?auto_105452 ?auto_105453 )
      ( !DRIVE-TRUCK ?auto_105452 ?auto_105453 ?auto_105450 ?auto_105454 )
      ( !UNLOAD-TRUCK ?auto_105451 ?auto_105452 ?auto_105450 )
      ( DELIVER-1PKG-VERIFY ?auto_105451 ?auto_105450 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106433 - OBJ
      ?auto_106434 - OBJ
      ?auto_106435 - OBJ
      ?auto_106436 - OBJ
      ?auto_106432 - LOCATION
    )
    :vars
    (
      ?auto_106439 - LOCATION
      ?auto_106438 - CITY
      ?auto_106440 - LOCATION
      ?auto_106441 - LOCATION
      ?auto_106437 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106439 ?auto_106438 ) ( IN-CITY ?auto_106432 ?auto_106438 ) ( not ( = ?auto_106432 ?auto_106439 ) ) ( OBJ-AT ?auto_106436 ?auto_106439 ) ( IN-CITY ?auto_106440 ?auto_106438 ) ( not ( = ?auto_106432 ?auto_106440 ) ) ( OBJ-AT ?auto_106435 ?auto_106440 ) ( OBJ-AT ?auto_106434 ?auto_106440 ) ( IN-CITY ?auto_106441 ?auto_106438 ) ( not ( = ?auto_106432 ?auto_106441 ) ) ( OBJ-AT ?auto_106433 ?auto_106441 ) ( TRUCK-AT ?auto_106437 ?auto_106432 ) ( not ( = ?auto_106433 ?auto_106434 ) ) ( not ( = ?auto_106440 ?auto_106441 ) ) ( not ( = ?auto_106433 ?auto_106435 ) ) ( not ( = ?auto_106434 ?auto_106435 ) ) ( not ( = ?auto_106433 ?auto_106436 ) ) ( not ( = ?auto_106434 ?auto_106436 ) ) ( not ( = ?auto_106435 ?auto_106436 ) ) ( not ( = ?auto_106439 ?auto_106440 ) ) ( not ( = ?auto_106439 ?auto_106441 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_106433 ?auto_106435 ?auto_106434 ?auto_106432 )
      ( DELIVER-1PKG ?auto_106436 ?auto_106432 )
      ( DELIVER-4PKG-VERIFY ?auto_106433 ?auto_106434 ?auto_106435 ?auto_106436 ?auto_106432 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106465 - OBJ
      ?auto_106466 - OBJ
      ?auto_106467 - OBJ
      ?auto_106468 - OBJ
      ?auto_106464 - LOCATION
    )
    :vars
    (
      ?auto_106471 - LOCATION
      ?auto_106473 - CITY
      ?auto_106469 - LOCATION
      ?auto_106472 - LOCATION
      ?auto_106470 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106471 ?auto_106473 ) ( IN-CITY ?auto_106464 ?auto_106473 ) ( not ( = ?auto_106464 ?auto_106471 ) ) ( OBJ-AT ?auto_106467 ?auto_106471 ) ( IN-CITY ?auto_106469 ?auto_106473 ) ( not ( = ?auto_106464 ?auto_106469 ) ) ( OBJ-AT ?auto_106468 ?auto_106469 ) ( OBJ-AT ?auto_106466 ?auto_106469 ) ( IN-CITY ?auto_106472 ?auto_106473 ) ( not ( = ?auto_106464 ?auto_106472 ) ) ( OBJ-AT ?auto_106465 ?auto_106472 ) ( TRUCK-AT ?auto_106470 ?auto_106464 ) ( not ( = ?auto_106465 ?auto_106466 ) ) ( not ( = ?auto_106469 ?auto_106472 ) ) ( not ( = ?auto_106465 ?auto_106468 ) ) ( not ( = ?auto_106466 ?auto_106468 ) ) ( not ( = ?auto_106465 ?auto_106467 ) ) ( not ( = ?auto_106466 ?auto_106467 ) ) ( not ( = ?auto_106468 ?auto_106467 ) ) ( not ( = ?auto_106471 ?auto_106469 ) ) ( not ( = ?auto_106471 ?auto_106472 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106465 ?auto_106466 ?auto_106468 ?auto_106467 ?auto_106464 )
      ( DELIVER-4PKG-VERIFY ?auto_106465 ?auto_106466 ?auto_106467 ?auto_106468 ?auto_106464 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106497 - OBJ
      ?auto_106498 - OBJ
      ?auto_106499 - OBJ
      ?auto_106500 - OBJ
      ?auto_106496 - LOCATION
    )
    :vars
    (
      ?auto_106505 - LOCATION
      ?auto_106503 - CITY
      ?auto_106504 - LOCATION
      ?auto_106502 - LOCATION
      ?auto_106501 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106505 ?auto_106503 ) ( IN-CITY ?auto_106496 ?auto_106503 ) ( not ( = ?auto_106496 ?auto_106505 ) ) ( OBJ-AT ?auto_106500 ?auto_106505 ) ( IN-CITY ?auto_106504 ?auto_106503 ) ( not ( = ?auto_106496 ?auto_106504 ) ) ( OBJ-AT ?auto_106498 ?auto_106504 ) ( OBJ-AT ?auto_106499 ?auto_106504 ) ( IN-CITY ?auto_106502 ?auto_106503 ) ( not ( = ?auto_106496 ?auto_106502 ) ) ( OBJ-AT ?auto_106497 ?auto_106502 ) ( TRUCK-AT ?auto_106501 ?auto_106496 ) ( not ( = ?auto_106497 ?auto_106499 ) ) ( not ( = ?auto_106504 ?auto_106502 ) ) ( not ( = ?auto_106497 ?auto_106498 ) ) ( not ( = ?auto_106499 ?auto_106498 ) ) ( not ( = ?auto_106497 ?auto_106500 ) ) ( not ( = ?auto_106499 ?auto_106500 ) ) ( not ( = ?auto_106498 ?auto_106500 ) ) ( not ( = ?auto_106505 ?auto_106504 ) ) ( not ( = ?auto_106505 ?auto_106502 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106497 ?auto_106499 ?auto_106500 ?auto_106498 ?auto_106496 )
      ( DELIVER-4PKG-VERIFY ?auto_106497 ?auto_106498 ?auto_106499 ?auto_106500 ?auto_106496 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106529 - OBJ
      ?auto_106530 - OBJ
      ?auto_106531 - OBJ
      ?auto_106532 - OBJ
      ?auto_106528 - LOCATION
    )
    :vars
    (
      ?auto_106537 - LOCATION
      ?auto_106535 - CITY
      ?auto_106536 - LOCATION
      ?auto_106534 - LOCATION
      ?auto_106533 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106537 ?auto_106535 ) ( IN-CITY ?auto_106528 ?auto_106535 ) ( not ( = ?auto_106528 ?auto_106537 ) ) ( OBJ-AT ?auto_106531 ?auto_106537 ) ( IN-CITY ?auto_106536 ?auto_106535 ) ( not ( = ?auto_106528 ?auto_106536 ) ) ( OBJ-AT ?auto_106530 ?auto_106536 ) ( OBJ-AT ?auto_106532 ?auto_106536 ) ( IN-CITY ?auto_106534 ?auto_106535 ) ( not ( = ?auto_106528 ?auto_106534 ) ) ( OBJ-AT ?auto_106529 ?auto_106534 ) ( TRUCK-AT ?auto_106533 ?auto_106528 ) ( not ( = ?auto_106529 ?auto_106532 ) ) ( not ( = ?auto_106536 ?auto_106534 ) ) ( not ( = ?auto_106529 ?auto_106530 ) ) ( not ( = ?auto_106532 ?auto_106530 ) ) ( not ( = ?auto_106529 ?auto_106531 ) ) ( not ( = ?auto_106532 ?auto_106531 ) ) ( not ( = ?auto_106530 ?auto_106531 ) ) ( not ( = ?auto_106537 ?auto_106536 ) ) ( not ( = ?auto_106537 ?auto_106534 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106529 ?auto_106532 ?auto_106531 ?auto_106530 ?auto_106528 )
      ( DELIVER-4PKG-VERIFY ?auto_106529 ?auto_106530 ?auto_106531 ?auto_106532 ?auto_106528 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106629 - OBJ
      ?auto_106630 - OBJ
      ?auto_106631 - OBJ
      ?auto_106632 - OBJ
      ?auto_106628 - LOCATION
    )
    :vars
    (
      ?auto_106637 - LOCATION
      ?auto_106635 - CITY
      ?auto_106636 - LOCATION
      ?auto_106634 - LOCATION
      ?auto_106633 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106637 ?auto_106635 ) ( IN-CITY ?auto_106628 ?auto_106635 ) ( not ( = ?auto_106628 ?auto_106637 ) ) ( OBJ-AT ?auto_106630 ?auto_106637 ) ( IN-CITY ?auto_106636 ?auto_106635 ) ( not ( = ?auto_106628 ?auto_106636 ) ) ( OBJ-AT ?auto_106632 ?auto_106636 ) ( OBJ-AT ?auto_106631 ?auto_106636 ) ( IN-CITY ?auto_106634 ?auto_106635 ) ( not ( = ?auto_106628 ?auto_106634 ) ) ( OBJ-AT ?auto_106629 ?auto_106634 ) ( TRUCK-AT ?auto_106633 ?auto_106628 ) ( not ( = ?auto_106629 ?auto_106631 ) ) ( not ( = ?auto_106636 ?auto_106634 ) ) ( not ( = ?auto_106629 ?auto_106632 ) ) ( not ( = ?auto_106631 ?auto_106632 ) ) ( not ( = ?auto_106629 ?auto_106630 ) ) ( not ( = ?auto_106631 ?auto_106630 ) ) ( not ( = ?auto_106632 ?auto_106630 ) ) ( not ( = ?auto_106637 ?auto_106636 ) ) ( not ( = ?auto_106637 ?auto_106634 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106629 ?auto_106631 ?auto_106630 ?auto_106632 ?auto_106628 )
      ( DELIVER-4PKG-VERIFY ?auto_106629 ?auto_106630 ?auto_106631 ?auto_106632 ?auto_106628 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106661 - OBJ
      ?auto_106662 - OBJ
      ?auto_106663 - OBJ
      ?auto_106664 - OBJ
      ?auto_106660 - LOCATION
    )
    :vars
    (
      ?auto_106669 - LOCATION
      ?auto_106667 - CITY
      ?auto_106668 - LOCATION
      ?auto_106666 - LOCATION
      ?auto_106665 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106669 ?auto_106667 ) ( IN-CITY ?auto_106660 ?auto_106667 ) ( not ( = ?auto_106660 ?auto_106669 ) ) ( OBJ-AT ?auto_106662 ?auto_106669 ) ( IN-CITY ?auto_106668 ?auto_106667 ) ( not ( = ?auto_106660 ?auto_106668 ) ) ( OBJ-AT ?auto_106663 ?auto_106668 ) ( OBJ-AT ?auto_106664 ?auto_106668 ) ( IN-CITY ?auto_106666 ?auto_106667 ) ( not ( = ?auto_106660 ?auto_106666 ) ) ( OBJ-AT ?auto_106661 ?auto_106666 ) ( TRUCK-AT ?auto_106665 ?auto_106660 ) ( not ( = ?auto_106661 ?auto_106664 ) ) ( not ( = ?auto_106668 ?auto_106666 ) ) ( not ( = ?auto_106661 ?auto_106663 ) ) ( not ( = ?auto_106664 ?auto_106663 ) ) ( not ( = ?auto_106661 ?auto_106662 ) ) ( not ( = ?auto_106664 ?auto_106662 ) ) ( not ( = ?auto_106663 ?auto_106662 ) ) ( not ( = ?auto_106669 ?auto_106668 ) ) ( not ( = ?auto_106669 ?auto_106666 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106661 ?auto_106664 ?auto_106662 ?auto_106663 ?auto_106660 )
      ( DELIVER-4PKG-VERIFY ?auto_106661 ?auto_106662 ?auto_106663 ?auto_106664 ?auto_106660 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106761 - OBJ
      ?auto_106762 - OBJ
      ?auto_106763 - OBJ
      ?auto_106764 - OBJ
      ?auto_106760 - LOCATION
    )
    :vars
    (
      ?auto_106769 - LOCATION
      ?auto_106767 - CITY
      ?auto_106768 - LOCATION
      ?auto_106766 - LOCATION
      ?auto_106765 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106769 ?auto_106767 ) ( IN-CITY ?auto_106760 ?auto_106767 ) ( not ( = ?auto_106760 ?auto_106769 ) ) ( OBJ-AT ?auto_106764 ?auto_106769 ) ( IN-CITY ?auto_106768 ?auto_106767 ) ( not ( = ?auto_106760 ?auto_106768 ) ) ( OBJ-AT ?auto_106763 ?auto_106768 ) ( OBJ-AT ?auto_106761 ?auto_106768 ) ( IN-CITY ?auto_106766 ?auto_106767 ) ( not ( = ?auto_106760 ?auto_106766 ) ) ( OBJ-AT ?auto_106762 ?auto_106766 ) ( TRUCK-AT ?auto_106765 ?auto_106760 ) ( not ( = ?auto_106762 ?auto_106761 ) ) ( not ( = ?auto_106768 ?auto_106766 ) ) ( not ( = ?auto_106762 ?auto_106763 ) ) ( not ( = ?auto_106761 ?auto_106763 ) ) ( not ( = ?auto_106762 ?auto_106764 ) ) ( not ( = ?auto_106761 ?auto_106764 ) ) ( not ( = ?auto_106763 ?auto_106764 ) ) ( not ( = ?auto_106769 ?auto_106768 ) ) ( not ( = ?auto_106769 ?auto_106766 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106762 ?auto_106761 ?auto_106764 ?auto_106763 ?auto_106760 )
      ( DELIVER-4PKG-VERIFY ?auto_106761 ?auto_106762 ?auto_106763 ?auto_106764 ?auto_106760 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106793 - OBJ
      ?auto_106794 - OBJ
      ?auto_106795 - OBJ
      ?auto_106796 - OBJ
      ?auto_106792 - LOCATION
    )
    :vars
    (
      ?auto_106801 - LOCATION
      ?auto_106799 - CITY
      ?auto_106800 - LOCATION
      ?auto_106798 - LOCATION
      ?auto_106797 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106801 ?auto_106799 ) ( IN-CITY ?auto_106792 ?auto_106799 ) ( not ( = ?auto_106792 ?auto_106801 ) ) ( OBJ-AT ?auto_106795 ?auto_106801 ) ( IN-CITY ?auto_106800 ?auto_106799 ) ( not ( = ?auto_106792 ?auto_106800 ) ) ( OBJ-AT ?auto_106796 ?auto_106800 ) ( OBJ-AT ?auto_106793 ?auto_106800 ) ( IN-CITY ?auto_106798 ?auto_106799 ) ( not ( = ?auto_106792 ?auto_106798 ) ) ( OBJ-AT ?auto_106794 ?auto_106798 ) ( TRUCK-AT ?auto_106797 ?auto_106792 ) ( not ( = ?auto_106794 ?auto_106793 ) ) ( not ( = ?auto_106800 ?auto_106798 ) ) ( not ( = ?auto_106794 ?auto_106796 ) ) ( not ( = ?auto_106793 ?auto_106796 ) ) ( not ( = ?auto_106794 ?auto_106795 ) ) ( not ( = ?auto_106793 ?auto_106795 ) ) ( not ( = ?auto_106796 ?auto_106795 ) ) ( not ( = ?auto_106801 ?auto_106800 ) ) ( not ( = ?auto_106801 ?auto_106798 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106794 ?auto_106793 ?auto_106795 ?auto_106796 ?auto_106792 )
      ( DELIVER-4PKG-VERIFY ?auto_106793 ?auto_106794 ?auto_106795 ?auto_106796 ?auto_106792 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106894 - OBJ
      ?auto_106895 - OBJ
      ?auto_106896 - OBJ
      ?auto_106897 - OBJ
      ?auto_106893 - LOCATION
    )
    :vars
    (
      ?auto_106902 - LOCATION
      ?auto_106900 - CITY
      ?auto_106901 - LOCATION
      ?auto_106899 - LOCATION
      ?auto_106898 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106902 ?auto_106900 ) ( IN-CITY ?auto_106893 ?auto_106900 ) ( not ( = ?auto_106893 ?auto_106902 ) ) ( OBJ-AT ?auto_106897 ?auto_106902 ) ( IN-CITY ?auto_106901 ?auto_106900 ) ( not ( = ?auto_106893 ?auto_106901 ) ) ( OBJ-AT ?auto_106895 ?auto_106901 ) ( OBJ-AT ?auto_106894 ?auto_106901 ) ( IN-CITY ?auto_106899 ?auto_106900 ) ( not ( = ?auto_106893 ?auto_106899 ) ) ( OBJ-AT ?auto_106896 ?auto_106899 ) ( TRUCK-AT ?auto_106898 ?auto_106893 ) ( not ( = ?auto_106896 ?auto_106894 ) ) ( not ( = ?auto_106901 ?auto_106899 ) ) ( not ( = ?auto_106896 ?auto_106895 ) ) ( not ( = ?auto_106894 ?auto_106895 ) ) ( not ( = ?auto_106896 ?auto_106897 ) ) ( not ( = ?auto_106894 ?auto_106897 ) ) ( not ( = ?auto_106895 ?auto_106897 ) ) ( not ( = ?auto_106902 ?auto_106901 ) ) ( not ( = ?auto_106902 ?auto_106899 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106896 ?auto_106894 ?auto_106897 ?auto_106895 ?auto_106893 )
      ( DELIVER-4PKG-VERIFY ?auto_106894 ?auto_106895 ?auto_106896 ?auto_106897 ?auto_106893 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106926 - OBJ
      ?auto_106927 - OBJ
      ?auto_106928 - OBJ
      ?auto_106929 - OBJ
      ?auto_106925 - LOCATION
    )
    :vars
    (
      ?auto_106934 - LOCATION
      ?auto_106932 - CITY
      ?auto_106933 - LOCATION
      ?auto_106931 - LOCATION
      ?auto_106930 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106934 ?auto_106932 ) ( IN-CITY ?auto_106925 ?auto_106932 ) ( not ( = ?auto_106925 ?auto_106934 ) ) ( OBJ-AT ?auto_106928 ?auto_106934 ) ( IN-CITY ?auto_106933 ?auto_106932 ) ( not ( = ?auto_106925 ?auto_106933 ) ) ( OBJ-AT ?auto_106927 ?auto_106933 ) ( OBJ-AT ?auto_106926 ?auto_106933 ) ( IN-CITY ?auto_106931 ?auto_106932 ) ( not ( = ?auto_106925 ?auto_106931 ) ) ( OBJ-AT ?auto_106929 ?auto_106931 ) ( TRUCK-AT ?auto_106930 ?auto_106925 ) ( not ( = ?auto_106929 ?auto_106926 ) ) ( not ( = ?auto_106933 ?auto_106931 ) ) ( not ( = ?auto_106929 ?auto_106927 ) ) ( not ( = ?auto_106926 ?auto_106927 ) ) ( not ( = ?auto_106929 ?auto_106928 ) ) ( not ( = ?auto_106926 ?auto_106928 ) ) ( not ( = ?auto_106927 ?auto_106928 ) ) ( not ( = ?auto_106934 ?auto_106933 ) ) ( not ( = ?auto_106934 ?auto_106931 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106929 ?auto_106926 ?auto_106928 ?auto_106927 ?auto_106925 )
      ( DELIVER-4PKG-VERIFY ?auto_106926 ?auto_106927 ?auto_106928 ?auto_106929 ?auto_106925 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_106991 - OBJ
      ?auto_106992 - OBJ
      ?auto_106993 - OBJ
      ?auto_106994 - OBJ
      ?auto_106990 - LOCATION
    )
    :vars
    (
      ?auto_106999 - LOCATION
      ?auto_106997 - CITY
      ?auto_106998 - LOCATION
      ?auto_106996 - LOCATION
      ?auto_106995 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_106999 ?auto_106997 ) ( IN-CITY ?auto_106990 ?auto_106997 ) ( not ( = ?auto_106990 ?auto_106999 ) ) ( OBJ-AT ?auto_106992 ?auto_106999 ) ( IN-CITY ?auto_106998 ?auto_106997 ) ( not ( = ?auto_106990 ?auto_106998 ) ) ( OBJ-AT ?auto_106994 ?auto_106998 ) ( OBJ-AT ?auto_106991 ?auto_106998 ) ( IN-CITY ?auto_106996 ?auto_106997 ) ( not ( = ?auto_106990 ?auto_106996 ) ) ( OBJ-AT ?auto_106993 ?auto_106996 ) ( TRUCK-AT ?auto_106995 ?auto_106990 ) ( not ( = ?auto_106993 ?auto_106991 ) ) ( not ( = ?auto_106998 ?auto_106996 ) ) ( not ( = ?auto_106993 ?auto_106994 ) ) ( not ( = ?auto_106991 ?auto_106994 ) ) ( not ( = ?auto_106993 ?auto_106992 ) ) ( not ( = ?auto_106991 ?auto_106992 ) ) ( not ( = ?auto_106994 ?auto_106992 ) ) ( not ( = ?auto_106999 ?auto_106998 ) ) ( not ( = ?auto_106999 ?auto_106996 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_106993 ?auto_106991 ?auto_106992 ?auto_106994 ?auto_106990 )
      ( DELIVER-4PKG-VERIFY ?auto_106991 ?auto_106992 ?auto_106993 ?auto_106994 ?auto_106990 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_107058 - OBJ
      ?auto_107059 - OBJ
      ?auto_107060 - OBJ
      ?auto_107061 - OBJ
      ?auto_107057 - LOCATION
    )
    :vars
    (
      ?auto_107066 - LOCATION
      ?auto_107064 - CITY
      ?auto_107065 - LOCATION
      ?auto_107063 - LOCATION
      ?auto_107062 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_107066 ?auto_107064 ) ( IN-CITY ?auto_107057 ?auto_107064 ) ( not ( = ?auto_107057 ?auto_107066 ) ) ( OBJ-AT ?auto_107059 ?auto_107066 ) ( IN-CITY ?auto_107065 ?auto_107064 ) ( not ( = ?auto_107057 ?auto_107065 ) ) ( OBJ-AT ?auto_107060 ?auto_107065 ) ( OBJ-AT ?auto_107058 ?auto_107065 ) ( IN-CITY ?auto_107063 ?auto_107064 ) ( not ( = ?auto_107057 ?auto_107063 ) ) ( OBJ-AT ?auto_107061 ?auto_107063 ) ( TRUCK-AT ?auto_107062 ?auto_107057 ) ( not ( = ?auto_107061 ?auto_107058 ) ) ( not ( = ?auto_107065 ?auto_107063 ) ) ( not ( = ?auto_107061 ?auto_107060 ) ) ( not ( = ?auto_107058 ?auto_107060 ) ) ( not ( = ?auto_107061 ?auto_107059 ) ) ( not ( = ?auto_107058 ?auto_107059 ) ) ( not ( = ?auto_107060 ?auto_107059 ) ) ( not ( = ?auto_107066 ?auto_107065 ) ) ( not ( = ?auto_107066 ?auto_107063 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_107061 ?auto_107058 ?auto_107059 ?auto_107060 ?auto_107057 )
      ( DELIVER-4PKG-VERIFY ?auto_107058 ?auto_107059 ?auto_107060 ?auto_107061 ?auto_107057 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_107158 - OBJ
      ?auto_107159 - OBJ
      ?auto_107160 - OBJ
      ?auto_107161 - OBJ
      ?auto_107157 - LOCATION
    )
    :vars
    (
      ?auto_107166 - LOCATION
      ?auto_107164 - CITY
      ?auto_107165 - LOCATION
      ?auto_107163 - LOCATION
      ?auto_107162 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_107166 ?auto_107164 ) ( IN-CITY ?auto_107157 ?auto_107164 ) ( not ( = ?auto_107157 ?auto_107166 ) ) ( OBJ-AT ?auto_107161 ?auto_107166 ) ( IN-CITY ?auto_107165 ?auto_107164 ) ( not ( = ?auto_107157 ?auto_107165 ) ) ( OBJ-AT ?auto_107158 ?auto_107165 ) ( OBJ-AT ?auto_107160 ?auto_107165 ) ( IN-CITY ?auto_107163 ?auto_107164 ) ( not ( = ?auto_107157 ?auto_107163 ) ) ( OBJ-AT ?auto_107159 ?auto_107163 ) ( TRUCK-AT ?auto_107162 ?auto_107157 ) ( not ( = ?auto_107159 ?auto_107160 ) ) ( not ( = ?auto_107165 ?auto_107163 ) ) ( not ( = ?auto_107159 ?auto_107158 ) ) ( not ( = ?auto_107160 ?auto_107158 ) ) ( not ( = ?auto_107159 ?auto_107161 ) ) ( not ( = ?auto_107160 ?auto_107161 ) ) ( not ( = ?auto_107158 ?auto_107161 ) ) ( not ( = ?auto_107166 ?auto_107165 ) ) ( not ( = ?auto_107166 ?auto_107163 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_107159 ?auto_107160 ?auto_107161 ?auto_107158 ?auto_107157 )
      ( DELIVER-4PKG-VERIFY ?auto_107158 ?auto_107159 ?auto_107160 ?auto_107161 ?auto_107157 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_107190 - OBJ
      ?auto_107191 - OBJ
      ?auto_107192 - OBJ
      ?auto_107193 - OBJ
      ?auto_107189 - LOCATION
    )
    :vars
    (
      ?auto_107198 - LOCATION
      ?auto_107196 - CITY
      ?auto_107197 - LOCATION
      ?auto_107195 - LOCATION
      ?auto_107194 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_107198 ?auto_107196 ) ( IN-CITY ?auto_107189 ?auto_107196 ) ( not ( = ?auto_107189 ?auto_107198 ) ) ( OBJ-AT ?auto_107192 ?auto_107198 ) ( IN-CITY ?auto_107197 ?auto_107196 ) ( not ( = ?auto_107189 ?auto_107197 ) ) ( OBJ-AT ?auto_107190 ?auto_107197 ) ( OBJ-AT ?auto_107193 ?auto_107197 ) ( IN-CITY ?auto_107195 ?auto_107196 ) ( not ( = ?auto_107189 ?auto_107195 ) ) ( OBJ-AT ?auto_107191 ?auto_107195 ) ( TRUCK-AT ?auto_107194 ?auto_107189 ) ( not ( = ?auto_107191 ?auto_107193 ) ) ( not ( = ?auto_107197 ?auto_107195 ) ) ( not ( = ?auto_107191 ?auto_107190 ) ) ( not ( = ?auto_107193 ?auto_107190 ) ) ( not ( = ?auto_107191 ?auto_107192 ) ) ( not ( = ?auto_107193 ?auto_107192 ) ) ( not ( = ?auto_107190 ?auto_107192 ) ) ( not ( = ?auto_107198 ?auto_107197 ) ) ( not ( = ?auto_107198 ?auto_107195 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_107191 ?auto_107193 ?auto_107192 ?auto_107190 ?auto_107189 )
      ( DELIVER-4PKG-VERIFY ?auto_107190 ?auto_107191 ?auto_107192 ?auto_107193 ?auto_107189 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_107222 - OBJ
      ?auto_107223 - OBJ
      ?auto_107224 - OBJ
      ?auto_107225 - OBJ
      ?auto_107221 - LOCATION
    )
    :vars
    (
      ?auto_107230 - LOCATION
      ?auto_107228 - CITY
      ?auto_107229 - LOCATION
      ?auto_107227 - LOCATION
      ?auto_107226 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_107230 ?auto_107228 ) ( IN-CITY ?auto_107221 ?auto_107228 ) ( not ( = ?auto_107221 ?auto_107230 ) ) ( OBJ-AT ?auto_107225 ?auto_107230 ) ( IN-CITY ?auto_107229 ?auto_107228 ) ( not ( = ?auto_107221 ?auto_107229 ) ) ( OBJ-AT ?auto_107222 ?auto_107229 ) ( OBJ-AT ?auto_107223 ?auto_107229 ) ( IN-CITY ?auto_107227 ?auto_107228 ) ( not ( = ?auto_107221 ?auto_107227 ) ) ( OBJ-AT ?auto_107224 ?auto_107227 ) ( TRUCK-AT ?auto_107226 ?auto_107221 ) ( not ( = ?auto_107224 ?auto_107223 ) ) ( not ( = ?auto_107229 ?auto_107227 ) ) ( not ( = ?auto_107224 ?auto_107222 ) ) ( not ( = ?auto_107223 ?auto_107222 ) ) ( not ( = ?auto_107224 ?auto_107225 ) ) ( not ( = ?auto_107223 ?auto_107225 ) ) ( not ( = ?auto_107222 ?auto_107225 ) ) ( not ( = ?auto_107230 ?auto_107229 ) ) ( not ( = ?auto_107230 ?auto_107227 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_107224 ?auto_107223 ?auto_107225 ?auto_107222 ?auto_107221 )
      ( DELIVER-4PKG-VERIFY ?auto_107222 ?auto_107223 ?auto_107224 ?auto_107225 ?auto_107221 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_107254 - OBJ
      ?auto_107255 - OBJ
      ?auto_107256 - OBJ
      ?auto_107257 - OBJ
      ?auto_107253 - LOCATION
    )
    :vars
    (
      ?auto_107262 - LOCATION
      ?auto_107260 - CITY
      ?auto_107261 - LOCATION
      ?auto_107259 - LOCATION
      ?auto_107258 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_107262 ?auto_107260 ) ( IN-CITY ?auto_107253 ?auto_107260 ) ( not ( = ?auto_107253 ?auto_107262 ) ) ( OBJ-AT ?auto_107256 ?auto_107262 ) ( IN-CITY ?auto_107261 ?auto_107260 ) ( not ( = ?auto_107253 ?auto_107261 ) ) ( OBJ-AT ?auto_107254 ?auto_107261 ) ( OBJ-AT ?auto_107255 ?auto_107261 ) ( IN-CITY ?auto_107259 ?auto_107260 ) ( not ( = ?auto_107253 ?auto_107259 ) ) ( OBJ-AT ?auto_107257 ?auto_107259 ) ( TRUCK-AT ?auto_107258 ?auto_107253 ) ( not ( = ?auto_107257 ?auto_107255 ) ) ( not ( = ?auto_107261 ?auto_107259 ) ) ( not ( = ?auto_107257 ?auto_107254 ) ) ( not ( = ?auto_107255 ?auto_107254 ) ) ( not ( = ?auto_107257 ?auto_107256 ) ) ( not ( = ?auto_107255 ?auto_107256 ) ) ( not ( = ?auto_107254 ?auto_107256 ) ) ( not ( = ?auto_107262 ?auto_107261 ) ) ( not ( = ?auto_107262 ?auto_107259 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_107257 ?auto_107255 ?auto_107256 ?auto_107254 ?auto_107253 )
      ( DELIVER-4PKG-VERIFY ?auto_107254 ?auto_107255 ?auto_107256 ?auto_107257 ?auto_107253 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_107388 - OBJ
      ?auto_107389 - OBJ
      ?auto_107390 - OBJ
      ?auto_107391 - OBJ
      ?auto_107387 - LOCATION
    )
    :vars
    (
      ?auto_107396 - LOCATION
      ?auto_107394 - CITY
      ?auto_107395 - LOCATION
      ?auto_107393 - LOCATION
      ?auto_107392 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_107396 ?auto_107394 ) ( IN-CITY ?auto_107387 ?auto_107394 ) ( not ( = ?auto_107387 ?auto_107396 ) ) ( OBJ-AT ?auto_107389 ?auto_107396 ) ( IN-CITY ?auto_107395 ?auto_107394 ) ( not ( = ?auto_107387 ?auto_107395 ) ) ( OBJ-AT ?auto_107388 ?auto_107395 ) ( OBJ-AT ?auto_107391 ?auto_107395 ) ( IN-CITY ?auto_107393 ?auto_107394 ) ( not ( = ?auto_107387 ?auto_107393 ) ) ( OBJ-AT ?auto_107390 ?auto_107393 ) ( TRUCK-AT ?auto_107392 ?auto_107387 ) ( not ( = ?auto_107390 ?auto_107391 ) ) ( not ( = ?auto_107395 ?auto_107393 ) ) ( not ( = ?auto_107390 ?auto_107388 ) ) ( not ( = ?auto_107391 ?auto_107388 ) ) ( not ( = ?auto_107390 ?auto_107389 ) ) ( not ( = ?auto_107391 ?auto_107389 ) ) ( not ( = ?auto_107388 ?auto_107389 ) ) ( not ( = ?auto_107396 ?auto_107395 ) ) ( not ( = ?auto_107396 ?auto_107393 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_107390 ?auto_107391 ?auto_107389 ?auto_107388 ?auto_107387 )
      ( DELIVER-4PKG-VERIFY ?auto_107388 ?auto_107389 ?auto_107390 ?auto_107391 ?auto_107387 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_107420 - OBJ
      ?auto_107421 - OBJ
      ?auto_107422 - OBJ
      ?auto_107423 - OBJ
      ?auto_107419 - LOCATION
    )
    :vars
    (
      ?auto_107428 - LOCATION
      ?auto_107426 - CITY
      ?auto_107427 - LOCATION
      ?auto_107425 - LOCATION
      ?auto_107424 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_107428 ?auto_107426 ) ( IN-CITY ?auto_107419 ?auto_107426 ) ( not ( = ?auto_107419 ?auto_107428 ) ) ( OBJ-AT ?auto_107421 ?auto_107428 ) ( IN-CITY ?auto_107427 ?auto_107426 ) ( not ( = ?auto_107419 ?auto_107427 ) ) ( OBJ-AT ?auto_107420 ?auto_107427 ) ( OBJ-AT ?auto_107422 ?auto_107427 ) ( IN-CITY ?auto_107425 ?auto_107426 ) ( not ( = ?auto_107419 ?auto_107425 ) ) ( OBJ-AT ?auto_107423 ?auto_107425 ) ( TRUCK-AT ?auto_107424 ?auto_107419 ) ( not ( = ?auto_107423 ?auto_107422 ) ) ( not ( = ?auto_107427 ?auto_107425 ) ) ( not ( = ?auto_107423 ?auto_107420 ) ) ( not ( = ?auto_107422 ?auto_107420 ) ) ( not ( = ?auto_107423 ?auto_107421 ) ) ( not ( = ?auto_107422 ?auto_107421 ) ) ( not ( = ?auto_107420 ?auto_107421 ) ) ( not ( = ?auto_107428 ?auto_107427 ) ) ( not ( = ?auto_107428 ?auto_107425 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_107423 ?auto_107422 ?auto_107421 ?auto_107420 ?auto_107419 )
      ( DELIVER-4PKG-VERIFY ?auto_107420 ?auto_107421 ?auto_107422 ?auto_107423 ?auto_107419 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_107623 - OBJ
      ?auto_107624 - OBJ
      ?auto_107625 - OBJ
      ?auto_107626 - OBJ
      ?auto_107622 - LOCATION
    )
    :vars
    (
      ?auto_107631 - LOCATION
      ?auto_107629 - CITY
      ?auto_107630 - LOCATION
      ?auto_107628 - LOCATION
      ?auto_107627 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_107631 ?auto_107629 ) ( IN-CITY ?auto_107622 ?auto_107629 ) ( not ( = ?auto_107622 ?auto_107631 ) ) ( OBJ-AT ?auto_107623 ?auto_107631 ) ( IN-CITY ?auto_107630 ?auto_107629 ) ( not ( = ?auto_107622 ?auto_107630 ) ) ( OBJ-AT ?auto_107626 ?auto_107630 ) ( OBJ-AT ?auto_107625 ?auto_107630 ) ( IN-CITY ?auto_107628 ?auto_107629 ) ( not ( = ?auto_107622 ?auto_107628 ) ) ( OBJ-AT ?auto_107624 ?auto_107628 ) ( TRUCK-AT ?auto_107627 ?auto_107622 ) ( not ( = ?auto_107624 ?auto_107625 ) ) ( not ( = ?auto_107630 ?auto_107628 ) ) ( not ( = ?auto_107624 ?auto_107626 ) ) ( not ( = ?auto_107625 ?auto_107626 ) ) ( not ( = ?auto_107624 ?auto_107623 ) ) ( not ( = ?auto_107625 ?auto_107623 ) ) ( not ( = ?auto_107626 ?auto_107623 ) ) ( not ( = ?auto_107631 ?auto_107630 ) ) ( not ( = ?auto_107631 ?auto_107628 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_107624 ?auto_107625 ?auto_107623 ?auto_107626 ?auto_107622 )
      ( DELIVER-4PKG-VERIFY ?auto_107623 ?auto_107624 ?auto_107625 ?auto_107626 ?auto_107622 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_107655 - OBJ
      ?auto_107656 - OBJ
      ?auto_107657 - OBJ
      ?auto_107658 - OBJ
      ?auto_107654 - LOCATION
    )
    :vars
    (
      ?auto_107663 - LOCATION
      ?auto_107661 - CITY
      ?auto_107662 - LOCATION
      ?auto_107660 - LOCATION
      ?auto_107659 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_107663 ?auto_107661 ) ( IN-CITY ?auto_107654 ?auto_107661 ) ( not ( = ?auto_107654 ?auto_107663 ) ) ( OBJ-AT ?auto_107655 ?auto_107663 ) ( IN-CITY ?auto_107662 ?auto_107661 ) ( not ( = ?auto_107654 ?auto_107662 ) ) ( OBJ-AT ?auto_107657 ?auto_107662 ) ( OBJ-AT ?auto_107658 ?auto_107662 ) ( IN-CITY ?auto_107660 ?auto_107661 ) ( not ( = ?auto_107654 ?auto_107660 ) ) ( OBJ-AT ?auto_107656 ?auto_107660 ) ( TRUCK-AT ?auto_107659 ?auto_107654 ) ( not ( = ?auto_107656 ?auto_107658 ) ) ( not ( = ?auto_107662 ?auto_107660 ) ) ( not ( = ?auto_107656 ?auto_107657 ) ) ( not ( = ?auto_107658 ?auto_107657 ) ) ( not ( = ?auto_107656 ?auto_107655 ) ) ( not ( = ?auto_107658 ?auto_107655 ) ) ( not ( = ?auto_107657 ?auto_107655 ) ) ( not ( = ?auto_107663 ?auto_107662 ) ) ( not ( = ?auto_107663 ?auto_107660 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_107656 ?auto_107658 ?auto_107655 ?auto_107657 ?auto_107654 )
      ( DELIVER-4PKG-VERIFY ?auto_107655 ?auto_107656 ?auto_107657 ?auto_107658 ?auto_107654 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_107755 - OBJ
      ?auto_107756 - OBJ
      ?auto_107757 - OBJ
      ?auto_107758 - OBJ
      ?auto_107754 - LOCATION
    )
    :vars
    (
      ?auto_107763 - LOCATION
      ?auto_107761 - CITY
      ?auto_107762 - LOCATION
      ?auto_107760 - LOCATION
      ?auto_107759 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_107763 ?auto_107761 ) ( IN-CITY ?auto_107754 ?auto_107761 ) ( not ( = ?auto_107754 ?auto_107763 ) ) ( OBJ-AT ?auto_107755 ?auto_107763 ) ( IN-CITY ?auto_107762 ?auto_107761 ) ( not ( = ?auto_107754 ?auto_107762 ) ) ( OBJ-AT ?auto_107758 ?auto_107762 ) ( OBJ-AT ?auto_107756 ?auto_107762 ) ( IN-CITY ?auto_107760 ?auto_107761 ) ( not ( = ?auto_107754 ?auto_107760 ) ) ( OBJ-AT ?auto_107757 ?auto_107760 ) ( TRUCK-AT ?auto_107759 ?auto_107754 ) ( not ( = ?auto_107757 ?auto_107756 ) ) ( not ( = ?auto_107762 ?auto_107760 ) ) ( not ( = ?auto_107757 ?auto_107758 ) ) ( not ( = ?auto_107756 ?auto_107758 ) ) ( not ( = ?auto_107757 ?auto_107755 ) ) ( not ( = ?auto_107756 ?auto_107755 ) ) ( not ( = ?auto_107758 ?auto_107755 ) ) ( not ( = ?auto_107763 ?auto_107762 ) ) ( not ( = ?auto_107763 ?auto_107760 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_107757 ?auto_107756 ?auto_107755 ?auto_107758 ?auto_107754 )
      ( DELIVER-4PKG-VERIFY ?auto_107755 ?auto_107756 ?auto_107757 ?auto_107758 ?auto_107754 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_107822 - OBJ
      ?auto_107823 - OBJ
      ?auto_107824 - OBJ
      ?auto_107825 - OBJ
      ?auto_107821 - LOCATION
    )
    :vars
    (
      ?auto_107830 - LOCATION
      ?auto_107828 - CITY
      ?auto_107829 - LOCATION
      ?auto_107827 - LOCATION
      ?auto_107826 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_107830 ?auto_107828 ) ( IN-CITY ?auto_107821 ?auto_107828 ) ( not ( = ?auto_107821 ?auto_107830 ) ) ( OBJ-AT ?auto_107822 ?auto_107830 ) ( IN-CITY ?auto_107829 ?auto_107828 ) ( not ( = ?auto_107821 ?auto_107829 ) ) ( OBJ-AT ?auto_107824 ?auto_107829 ) ( OBJ-AT ?auto_107823 ?auto_107829 ) ( IN-CITY ?auto_107827 ?auto_107828 ) ( not ( = ?auto_107821 ?auto_107827 ) ) ( OBJ-AT ?auto_107825 ?auto_107827 ) ( TRUCK-AT ?auto_107826 ?auto_107821 ) ( not ( = ?auto_107825 ?auto_107823 ) ) ( not ( = ?auto_107829 ?auto_107827 ) ) ( not ( = ?auto_107825 ?auto_107824 ) ) ( not ( = ?auto_107823 ?auto_107824 ) ) ( not ( = ?auto_107825 ?auto_107822 ) ) ( not ( = ?auto_107823 ?auto_107822 ) ) ( not ( = ?auto_107824 ?auto_107822 ) ) ( not ( = ?auto_107830 ?auto_107829 ) ) ( not ( = ?auto_107830 ?auto_107827 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_107825 ?auto_107823 ?auto_107822 ?auto_107824 ?auto_107821 )
      ( DELIVER-4PKG-VERIFY ?auto_107822 ?auto_107823 ?auto_107824 ?auto_107825 ?auto_107821 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_107922 - OBJ
      ?auto_107923 - OBJ
      ?auto_107924 - OBJ
      ?auto_107925 - OBJ
      ?auto_107921 - LOCATION
    )
    :vars
    (
      ?auto_107930 - LOCATION
      ?auto_107928 - CITY
      ?auto_107929 - LOCATION
      ?auto_107927 - LOCATION
      ?auto_107926 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_107930 ?auto_107928 ) ( IN-CITY ?auto_107921 ?auto_107928 ) ( not ( = ?auto_107921 ?auto_107930 ) ) ( OBJ-AT ?auto_107922 ?auto_107930 ) ( IN-CITY ?auto_107929 ?auto_107928 ) ( not ( = ?auto_107921 ?auto_107929 ) ) ( OBJ-AT ?auto_107923 ?auto_107929 ) ( OBJ-AT ?auto_107925 ?auto_107929 ) ( IN-CITY ?auto_107927 ?auto_107928 ) ( not ( = ?auto_107921 ?auto_107927 ) ) ( OBJ-AT ?auto_107924 ?auto_107927 ) ( TRUCK-AT ?auto_107926 ?auto_107921 ) ( not ( = ?auto_107924 ?auto_107925 ) ) ( not ( = ?auto_107929 ?auto_107927 ) ) ( not ( = ?auto_107924 ?auto_107923 ) ) ( not ( = ?auto_107925 ?auto_107923 ) ) ( not ( = ?auto_107924 ?auto_107922 ) ) ( not ( = ?auto_107925 ?auto_107922 ) ) ( not ( = ?auto_107923 ?auto_107922 ) ) ( not ( = ?auto_107930 ?auto_107929 ) ) ( not ( = ?auto_107930 ?auto_107927 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_107924 ?auto_107925 ?auto_107922 ?auto_107923 ?auto_107921 )
      ( DELIVER-4PKG-VERIFY ?auto_107922 ?auto_107923 ?auto_107924 ?auto_107925 ?auto_107921 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_107954 - OBJ
      ?auto_107955 - OBJ
      ?auto_107956 - OBJ
      ?auto_107957 - OBJ
      ?auto_107953 - LOCATION
    )
    :vars
    (
      ?auto_107962 - LOCATION
      ?auto_107960 - CITY
      ?auto_107961 - LOCATION
      ?auto_107959 - LOCATION
      ?auto_107958 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_107962 ?auto_107960 ) ( IN-CITY ?auto_107953 ?auto_107960 ) ( not ( = ?auto_107953 ?auto_107962 ) ) ( OBJ-AT ?auto_107954 ?auto_107962 ) ( IN-CITY ?auto_107961 ?auto_107960 ) ( not ( = ?auto_107953 ?auto_107961 ) ) ( OBJ-AT ?auto_107955 ?auto_107961 ) ( OBJ-AT ?auto_107956 ?auto_107961 ) ( IN-CITY ?auto_107959 ?auto_107960 ) ( not ( = ?auto_107953 ?auto_107959 ) ) ( OBJ-AT ?auto_107957 ?auto_107959 ) ( TRUCK-AT ?auto_107958 ?auto_107953 ) ( not ( = ?auto_107957 ?auto_107956 ) ) ( not ( = ?auto_107961 ?auto_107959 ) ) ( not ( = ?auto_107957 ?auto_107955 ) ) ( not ( = ?auto_107956 ?auto_107955 ) ) ( not ( = ?auto_107957 ?auto_107954 ) ) ( not ( = ?auto_107956 ?auto_107954 ) ) ( not ( = ?auto_107955 ?auto_107954 ) ) ( not ( = ?auto_107962 ?auto_107961 ) ) ( not ( = ?auto_107962 ?auto_107959 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_107957 ?auto_107956 ?auto_107954 ?auto_107955 ?auto_107953 )
      ( DELIVER-4PKG-VERIFY ?auto_107954 ?auto_107955 ?auto_107956 ?auto_107957 ?auto_107953 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_108278 - OBJ
      ?auto_108277 - LOCATION
    )
    :vars
    (
      ?auto_108280 - LOCATION
      ?auto_108281 - CITY
      ?auto_108279 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_108280 ?auto_108281 ) ( IN-CITY ?auto_108277 ?auto_108281 ) ( not ( = ?auto_108277 ?auto_108280 ) ) ( OBJ-AT ?auto_108278 ?auto_108280 ) ( TRUCK-AT ?auto_108279 ?auto_108277 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_108279 ?auto_108277 ?auto_108280 ?auto_108281 )
      ( !LOAD-TRUCK ?auto_108278 ?auto_108279 ?auto_108280 )
      ( !DRIVE-TRUCK ?auto_108279 ?auto_108280 ?auto_108277 ?auto_108281 )
      ( !UNLOAD-TRUCK ?auto_108278 ?auto_108279 ?auto_108277 )
      ( DELIVER-1PKG-VERIFY ?auto_108278 ?auto_108277 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_121933 - OBJ
      ?auto_121934 - OBJ
      ?auto_121935 - OBJ
      ?auto_121936 - OBJ
      ?auto_121937 - OBJ
      ?auto_121932 - LOCATION
    )
    :vars
    (
      ?auto_121938 - LOCATION
      ?auto_121939 - CITY
      ?auto_121942 - LOCATION
      ?auto_121941 - LOCATION
      ?auto_121940 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_121938 ?auto_121939 ) ( IN-CITY ?auto_121932 ?auto_121939 ) ( not ( = ?auto_121932 ?auto_121938 ) ) ( OBJ-AT ?auto_121937 ?auto_121938 ) ( OBJ-AT ?auto_121936 ?auto_121938 ) ( IN-CITY ?auto_121942 ?auto_121939 ) ( not ( = ?auto_121932 ?auto_121942 ) ) ( OBJ-AT ?auto_121935 ?auto_121942 ) ( OBJ-AT ?auto_121934 ?auto_121942 ) ( IN-CITY ?auto_121941 ?auto_121939 ) ( not ( = ?auto_121932 ?auto_121941 ) ) ( OBJ-AT ?auto_121933 ?auto_121941 ) ( TRUCK-AT ?auto_121940 ?auto_121932 ) ( not ( = ?auto_121933 ?auto_121934 ) ) ( not ( = ?auto_121942 ?auto_121941 ) ) ( not ( = ?auto_121933 ?auto_121935 ) ) ( not ( = ?auto_121934 ?auto_121935 ) ) ( not ( = ?auto_121933 ?auto_121936 ) ) ( not ( = ?auto_121934 ?auto_121936 ) ) ( not ( = ?auto_121935 ?auto_121936 ) ) ( not ( = ?auto_121938 ?auto_121942 ) ) ( not ( = ?auto_121938 ?auto_121941 ) ) ( not ( = ?auto_121933 ?auto_121937 ) ) ( not ( = ?auto_121934 ?auto_121937 ) ) ( not ( = ?auto_121935 ?auto_121937 ) ) ( not ( = ?auto_121936 ?auto_121937 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_121933 ?auto_121934 ?auto_121936 ?auto_121935 ?auto_121932 )
      ( DELIVER-1PKG ?auto_121937 ?auto_121932 )
      ( DELIVER-5PKG-VERIFY ?auto_121933 ?auto_121934 ?auto_121935 ?auto_121936 ?auto_121937 ?auto_121932 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_121980 - OBJ
      ?auto_121981 - OBJ
      ?auto_121982 - OBJ
      ?auto_121983 - OBJ
      ?auto_121984 - OBJ
      ?auto_121979 - LOCATION
    )
    :vars
    (
      ?auto_121986 - LOCATION
      ?auto_121989 - CITY
      ?auto_121988 - LOCATION
      ?auto_121985 - LOCATION
      ?auto_121987 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_121986 ?auto_121989 ) ( IN-CITY ?auto_121979 ?auto_121989 ) ( not ( = ?auto_121979 ?auto_121986 ) ) ( OBJ-AT ?auto_121983 ?auto_121986 ) ( OBJ-AT ?auto_121984 ?auto_121986 ) ( IN-CITY ?auto_121988 ?auto_121989 ) ( not ( = ?auto_121979 ?auto_121988 ) ) ( OBJ-AT ?auto_121982 ?auto_121988 ) ( OBJ-AT ?auto_121981 ?auto_121988 ) ( IN-CITY ?auto_121985 ?auto_121989 ) ( not ( = ?auto_121979 ?auto_121985 ) ) ( OBJ-AT ?auto_121980 ?auto_121985 ) ( TRUCK-AT ?auto_121987 ?auto_121979 ) ( not ( = ?auto_121980 ?auto_121981 ) ) ( not ( = ?auto_121988 ?auto_121985 ) ) ( not ( = ?auto_121980 ?auto_121982 ) ) ( not ( = ?auto_121981 ?auto_121982 ) ) ( not ( = ?auto_121980 ?auto_121984 ) ) ( not ( = ?auto_121981 ?auto_121984 ) ) ( not ( = ?auto_121982 ?auto_121984 ) ) ( not ( = ?auto_121986 ?auto_121988 ) ) ( not ( = ?auto_121986 ?auto_121985 ) ) ( not ( = ?auto_121980 ?auto_121983 ) ) ( not ( = ?auto_121981 ?auto_121983 ) ) ( not ( = ?auto_121982 ?auto_121983 ) ) ( not ( = ?auto_121984 ?auto_121983 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_121980 ?auto_121981 ?auto_121982 ?auto_121984 ?auto_121983 ?auto_121979 )
      ( DELIVER-5PKG-VERIFY ?auto_121980 ?auto_121981 ?auto_121982 ?auto_121983 ?auto_121984 ?auto_121979 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122027 - OBJ
      ?auto_122028 - OBJ
      ?auto_122029 - OBJ
      ?auto_122030 - OBJ
      ?auto_122031 - OBJ
      ?auto_122026 - LOCATION
    )
    :vars
    (
      ?auto_122035 - LOCATION
      ?auto_122036 - CITY
      ?auto_122032 - LOCATION
      ?auto_122033 - LOCATION
      ?auto_122034 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122035 ?auto_122036 ) ( IN-CITY ?auto_122026 ?auto_122036 ) ( not ( = ?auto_122026 ?auto_122035 ) ) ( OBJ-AT ?auto_122031 ?auto_122035 ) ( OBJ-AT ?auto_122029 ?auto_122035 ) ( IN-CITY ?auto_122032 ?auto_122036 ) ( not ( = ?auto_122026 ?auto_122032 ) ) ( OBJ-AT ?auto_122030 ?auto_122032 ) ( OBJ-AT ?auto_122028 ?auto_122032 ) ( IN-CITY ?auto_122033 ?auto_122036 ) ( not ( = ?auto_122026 ?auto_122033 ) ) ( OBJ-AT ?auto_122027 ?auto_122033 ) ( TRUCK-AT ?auto_122034 ?auto_122026 ) ( not ( = ?auto_122027 ?auto_122028 ) ) ( not ( = ?auto_122032 ?auto_122033 ) ) ( not ( = ?auto_122027 ?auto_122030 ) ) ( not ( = ?auto_122028 ?auto_122030 ) ) ( not ( = ?auto_122027 ?auto_122029 ) ) ( not ( = ?auto_122028 ?auto_122029 ) ) ( not ( = ?auto_122030 ?auto_122029 ) ) ( not ( = ?auto_122035 ?auto_122032 ) ) ( not ( = ?auto_122035 ?auto_122033 ) ) ( not ( = ?auto_122027 ?auto_122031 ) ) ( not ( = ?auto_122028 ?auto_122031 ) ) ( not ( = ?auto_122030 ?auto_122031 ) ) ( not ( = ?auto_122029 ?auto_122031 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122027 ?auto_122028 ?auto_122030 ?auto_122031 ?auto_122029 ?auto_122026 )
      ( DELIVER-5PKG-VERIFY ?auto_122027 ?auto_122028 ?auto_122029 ?auto_122030 ?auto_122031 ?auto_122026 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122074 - OBJ
      ?auto_122075 - OBJ
      ?auto_122076 - OBJ
      ?auto_122077 - OBJ
      ?auto_122078 - OBJ
      ?auto_122073 - LOCATION
    )
    :vars
    (
      ?auto_122082 - LOCATION
      ?auto_122083 - CITY
      ?auto_122079 - LOCATION
      ?auto_122080 - LOCATION
      ?auto_122081 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122082 ?auto_122083 ) ( IN-CITY ?auto_122073 ?auto_122083 ) ( not ( = ?auto_122073 ?auto_122082 ) ) ( OBJ-AT ?auto_122077 ?auto_122082 ) ( OBJ-AT ?auto_122076 ?auto_122082 ) ( IN-CITY ?auto_122079 ?auto_122083 ) ( not ( = ?auto_122073 ?auto_122079 ) ) ( OBJ-AT ?auto_122078 ?auto_122079 ) ( OBJ-AT ?auto_122075 ?auto_122079 ) ( IN-CITY ?auto_122080 ?auto_122083 ) ( not ( = ?auto_122073 ?auto_122080 ) ) ( OBJ-AT ?auto_122074 ?auto_122080 ) ( TRUCK-AT ?auto_122081 ?auto_122073 ) ( not ( = ?auto_122074 ?auto_122075 ) ) ( not ( = ?auto_122079 ?auto_122080 ) ) ( not ( = ?auto_122074 ?auto_122078 ) ) ( not ( = ?auto_122075 ?auto_122078 ) ) ( not ( = ?auto_122074 ?auto_122076 ) ) ( not ( = ?auto_122075 ?auto_122076 ) ) ( not ( = ?auto_122078 ?auto_122076 ) ) ( not ( = ?auto_122082 ?auto_122079 ) ) ( not ( = ?auto_122082 ?auto_122080 ) ) ( not ( = ?auto_122074 ?auto_122077 ) ) ( not ( = ?auto_122075 ?auto_122077 ) ) ( not ( = ?auto_122078 ?auto_122077 ) ) ( not ( = ?auto_122076 ?auto_122077 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122074 ?auto_122075 ?auto_122078 ?auto_122077 ?auto_122076 ?auto_122073 )
      ( DELIVER-5PKG-VERIFY ?auto_122074 ?auto_122075 ?auto_122076 ?auto_122077 ?auto_122078 ?auto_122073 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122271 - OBJ
      ?auto_122272 - OBJ
      ?auto_122273 - OBJ
      ?auto_122274 - OBJ
      ?auto_122275 - OBJ
      ?auto_122270 - LOCATION
    )
    :vars
    (
      ?auto_122279 - LOCATION
      ?auto_122280 - CITY
      ?auto_122276 - LOCATION
      ?auto_122277 - LOCATION
      ?auto_122278 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122279 ?auto_122280 ) ( IN-CITY ?auto_122270 ?auto_122280 ) ( not ( = ?auto_122270 ?auto_122279 ) ) ( OBJ-AT ?auto_122273 ?auto_122279 ) ( OBJ-AT ?auto_122275 ?auto_122279 ) ( IN-CITY ?auto_122276 ?auto_122280 ) ( not ( = ?auto_122270 ?auto_122276 ) ) ( OBJ-AT ?auto_122274 ?auto_122276 ) ( OBJ-AT ?auto_122272 ?auto_122276 ) ( IN-CITY ?auto_122277 ?auto_122280 ) ( not ( = ?auto_122270 ?auto_122277 ) ) ( OBJ-AT ?auto_122271 ?auto_122277 ) ( TRUCK-AT ?auto_122278 ?auto_122270 ) ( not ( = ?auto_122271 ?auto_122272 ) ) ( not ( = ?auto_122276 ?auto_122277 ) ) ( not ( = ?auto_122271 ?auto_122274 ) ) ( not ( = ?auto_122272 ?auto_122274 ) ) ( not ( = ?auto_122271 ?auto_122275 ) ) ( not ( = ?auto_122272 ?auto_122275 ) ) ( not ( = ?auto_122274 ?auto_122275 ) ) ( not ( = ?auto_122279 ?auto_122276 ) ) ( not ( = ?auto_122279 ?auto_122277 ) ) ( not ( = ?auto_122271 ?auto_122273 ) ) ( not ( = ?auto_122272 ?auto_122273 ) ) ( not ( = ?auto_122274 ?auto_122273 ) ) ( not ( = ?auto_122275 ?auto_122273 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122271 ?auto_122272 ?auto_122274 ?auto_122273 ?auto_122275 ?auto_122270 )
      ( DELIVER-5PKG-VERIFY ?auto_122271 ?auto_122272 ?auto_122273 ?auto_122274 ?auto_122275 ?auto_122270 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122318 - OBJ
      ?auto_122319 - OBJ
      ?auto_122320 - OBJ
      ?auto_122321 - OBJ
      ?auto_122322 - OBJ
      ?auto_122317 - LOCATION
    )
    :vars
    (
      ?auto_122326 - LOCATION
      ?auto_122327 - CITY
      ?auto_122323 - LOCATION
      ?auto_122324 - LOCATION
      ?auto_122325 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122326 ?auto_122327 ) ( IN-CITY ?auto_122317 ?auto_122327 ) ( not ( = ?auto_122317 ?auto_122326 ) ) ( OBJ-AT ?auto_122320 ?auto_122326 ) ( OBJ-AT ?auto_122321 ?auto_122326 ) ( IN-CITY ?auto_122323 ?auto_122327 ) ( not ( = ?auto_122317 ?auto_122323 ) ) ( OBJ-AT ?auto_122322 ?auto_122323 ) ( OBJ-AT ?auto_122319 ?auto_122323 ) ( IN-CITY ?auto_122324 ?auto_122327 ) ( not ( = ?auto_122317 ?auto_122324 ) ) ( OBJ-AT ?auto_122318 ?auto_122324 ) ( TRUCK-AT ?auto_122325 ?auto_122317 ) ( not ( = ?auto_122318 ?auto_122319 ) ) ( not ( = ?auto_122323 ?auto_122324 ) ) ( not ( = ?auto_122318 ?auto_122322 ) ) ( not ( = ?auto_122319 ?auto_122322 ) ) ( not ( = ?auto_122318 ?auto_122321 ) ) ( not ( = ?auto_122319 ?auto_122321 ) ) ( not ( = ?auto_122322 ?auto_122321 ) ) ( not ( = ?auto_122326 ?auto_122323 ) ) ( not ( = ?auto_122326 ?auto_122324 ) ) ( not ( = ?auto_122318 ?auto_122320 ) ) ( not ( = ?auto_122319 ?auto_122320 ) ) ( not ( = ?auto_122322 ?auto_122320 ) ) ( not ( = ?auto_122321 ?auto_122320 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122318 ?auto_122319 ?auto_122322 ?auto_122320 ?auto_122321 ?auto_122317 )
      ( DELIVER-5PKG-VERIFY ?auto_122318 ?auto_122319 ?auto_122320 ?auto_122321 ?auto_122322 ?auto_122317 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122565 - OBJ
      ?auto_122566 - OBJ
      ?auto_122567 - OBJ
      ?auto_122568 - OBJ
      ?auto_122569 - OBJ
      ?auto_122564 - LOCATION
    )
    :vars
    (
      ?auto_122573 - LOCATION
      ?auto_122574 - CITY
      ?auto_122570 - LOCATION
      ?auto_122571 - LOCATION
      ?auto_122572 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122573 ?auto_122574 ) ( IN-CITY ?auto_122564 ?auto_122574 ) ( not ( = ?auto_122564 ?auto_122573 ) ) ( OBJ-AT ?auto_122569 ?auto_122573 ) ( OBJ-AT ?auto_122568 ?auto_122573 ) ( IN-CITY ?auto_122570 ?auto_122574 ) ( not ( = ?auto_122564 ?auto_122570 ) ) ( OBJ-AT ?auto_122566 ?auto_122570 ) ( OBJ-AT ?auto_122567 ?auto_122570 ) ( IN-CITY ?auto_122571 ?auto_122574 ) ( not ( = ?auto_122564 ?auto_122571 ) ) ( OBJ-AT ?auto_122565 ?auto_122571 ) ( TRUCK-AT ?auto_122572 ?auto_122564 ) ( not ( = ?auto_122565 ?auto_122567 ) ) ( not ( = ?auto_122570 ?auto_122571 ) ) ( not ( = ?auto_122565 ?auto_122566 ) ) ( not ( = ?auto_122567 ?auto_122566 ) ) ( not ( = ?auto_122565 ?auto_122568 ) ) ( not ( = ?auto_122567 ?auto_122568 ) ) ( not ( = ?auto_122566 ?auto_122568 ) ) ( not ( = ?auto_122573 ?auto_122570 ) ) ( not ( = ?auto_122573 ?auto_122571 ) ) ( not ( = ?auto_122565 ?auto_122569 ) ) ( not ( = ?auto_122567 ?auto_122569 ) ) ( not ( = ?auto_122566 ?auto_122569 ) ) ( not ( = ?auto_122568 ?auto_122569 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122565 ?auto_122567 ?auto_122566 ?auto_122569 ?auto_122568 ?auto_122564 )
      ( DELIVER-5PKG-VERIFY ?auto_122565 ?auto_122566 ?auto_122567 ?auto_122568 ?auto_122569 ?auto_122564 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122612 - OBJ
      ?auto_122613 - OBJ
      ?auto_122614 - OBJ
      ?auto_122615 - OBJ
      ?auto_122616 - OBJ
      ?auto_122611 - LOCATION
    )
    :vars
    (
      ?auto_122620 - LOCATION
      ?auto_122621 - CITY
      ?auto_122617 - LOCATION
      ?auto_122618 - LOCATION
      ?auto_122619 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122620 ?auto_122621 ) ( IN-CITY ?auto_122611 ?auto_122621 ) ( not ( = ?auto_122611 ?auto_122620 ) ) ( OBJ-AT ?auto_122615 ?auto_122620 ) ( OBJ-AT ?auto_122616 ?auto_122620 ) ( IN-CITY ?auto_122617 ?auto_122621 ) ( not ( = ?auto_122611 ?auto_122617 ) ) ( OBJ-AT ?auto_122613 ?auto_122617 ) ( OBJ-AT ?auto_122614 ?auto_122617 ) ( IN-CITY ?auto_122618 ?auto_122621 ) ( not ( = ?auto_122611 ?auto_122618 ) ) ( OBJ-AT ?auto_122612 ?auto_122618 ) ( TRUCK-AT ?auto_122619 ?auto_122611 ) ( not ( = ?auto_122612 ?auto_122614 ) ) ( not ( = ?auto_122617 ?auto_122618 ) ) ( not ( = ?auto_122612 ?auto_122613 ) ) ( not ( = ?auto_122614 ?auto_122613 ) ) ( not ( = ?auto_122612 ?auto_122616 ) ) ( not ( = ?auto_122614 ?auto_122616 ) ) ( not ( = ?auto_122613 ?auto_122616 ) ) ( not ( = ?auto_122620 ?auto_122617 ) ) ( not ( = ?auto_122620 ?auto_122618 ) ) ( not ( = ?auto_122612 ?auto_122615 ) ) ( not ( = ?auto_122614 ?auto_122615 ) ) ( not ( = ?auto_122613 ?auto_122615 ) ) ( not ( = ?auto_122616 ?auto_122615 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122612 ?auto_122614 ?auto_122613 ?auto_122615 ?auto_122616 ?auto_122611 )
      ( DELIVER-5PKG-VERIFY ?auto_122612 ?auto_122613 ?auto_122614 ?auto_122615 ?auto_122616 ?auto_122611 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122760 - OBJ
      ?auto_122761 - OBJ
      ?auto_122762 - OBJ
      ?auto_122763 - OBJ
      ?auto_122764 - OBJ
      ?auto_122759 - LOCATION
    )
    :vars
    (
      ?auto_122768 - LOCATION
      ?auto_122769 - CITY
      ?auto_122765 - LOCATION
      ?auto_122766 - LOCATION
      ?auto_122767 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122768 ?auto_122769 ) ( IN-CITY ?auto_122759 ?auto_122769 ) ( not ( = ?auto_122759 ?auto_122768 ) ) ( OBJ-AT ?auto_122764 ?auto_122768 ) ( OBJ-AT ?auto_122762 ?auto_122768 ) ( IN-CITY ?auto_122765 ?auto_122769 ) ( not ( = ?auto_122759 ?auto_122765 ) ) ( OBJ-AT ?auto_122761 ?auto_122765 ) ( OBJ-AT ?auto_122763 ?auto_122765 ) ( IN-CITY ?auto_122766 ?auto_122769 ) ( not ( = ?auto_122759 ?auto_122766 ) ) ( OBJ-AT ?auto_122760 ?auto_122766 ) ( TRUCK-AT ?auto_122767 ?auto_122759 ) ( not ( = ?auto_122760 ?auto_122763 ) ) ( not ( = ?auto_122765 ?auto_122766 ) ) ( not ( = ?auto_122760 ?auto_122761 ) ) ( not ( = ?auto_122763 ?auto_122761 ) ) ( not ( = ?auto_122760 ?auto_122762 ) ) ( not ( = ?auto_122763 ?auto_122762 ) ) ( not ( = ?auto_122761 ?auto_122762 ) ) ( not ( = ?auto_122768 ?auto_122765 ) ) ( not ( = ?auto_122768 ?auto_122766 ) ) ( not ( = ?auto_122760 ?auto_122764 ) ) ( not ( = ?auto_122763 ?auto_122764 ) ) ( not ( = ?auto_122761 ?auto_122764 ) ) ( not ( = ?auto_122762 ?auto_122764 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122760 ?auto_122763 ?auto_122761 ?auto_122764 ?auto_122762 ?auto_122759 )
      ( DELIVER-5PKG-VERIFY ?auto_122760 ?auto_122761 ?auto_122762 ?auto_122763 ?auto_122764 ?auto_122759 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122807 - OBJ
      ?auto_122808 - OBJ
      ?auto_122809 - OBJ
      ?auto_122810 - OBJ
      ?auto_122811 - OBJ
      ?auto_122806 - LOCATION
    )
    :vars
    (
      ?auto_122815 - LOCATION
      ?auto_122816 - CITY
      ?auto_122812 - LOCATION
      ?auto_122813 - LOCATION
      ?auto_122814 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122815 ?auto_122816 ) ( IN-CITY ?auto_122806 ?auto_122816 ) ( not ( = ?auto_122806 ?auto_122815 ) ) ( OBJ-AT ?auto_122810 ?auto_122815 ) ( OBJ-AT ?auto_122809 ?auto_122815 ) ( IN-CITY ?auto_122812 ?auto_122816 ) ( not ( = ?auto_122806 ?auto_122812 ) ) ( OBJ-AT ?auto_122808 ?auto_122812 ) ( OBJ-AT ?auto_122811 ?auto_122812 ) ( IN-CITY ?auto_122813 ?auto_122816 ) ( not ( = ?auto_122806 ?auto_122813 ) ) ( OBJ-AT ?auto_122807 ?auto_122813 ) ( TRUCK-AT ?auto_122814 ?auto_122806 ) ( not ( = ?auto_122807 ?auto_122811 ) ) ( not ( = ?auto_122812 ?auto_122813 ) ) ( not ( = ?auto_122807 ?auto_122808 ) ) ( not ( = ?auto_122811 ?auto_122808 ) ) ( not ( = ?auto_122807 ?auto_122809 ) ) ( not ( = ?auto_122811 ?auto_122809 ) ) ( not ( = ?auto_122808 ?auto_122809 ) ) ( not ( = ?auto_122815 ?auto_122812 ) ) ( not ( = ?auto_122815 ?auto_122813 ) ) ( not ( = ?auto_122807 ?auto_122810 ) ) ( not ( = ?auto_122811 ?auto_122810 ) ) ( not ( = ?auto_122808 ?auto_122810 ) ) ( not ( = ?auto_122809 ?auto_122810 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122807 ?auto_122811 ?auto_122808 ?auto_122810 ?auto_122809 ?auto_122806 )
      ( DELIVER-5PKG-VERIFY ?auto_122807 ?auto_122808 ?auto_122809 ?auto_122810 ?auto_122811 ?auto_122806 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_122953 - OBJ
      ?auto_122954 - OBJ
      ?auto_122955 - OBJ
      ?auto_122956 - OBJ
      ?auto_122957 - OBJ
      ?auto_122952 - LOCATION
    )
    :vars
    (
      ?auto_122961 - LOCATION
      ?auto_122962 - CITY
      ?auto_122958 - LOCATION
      ?auto_122959 - LOCATION
      ?auto_122960 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_122961 ?auto_122962 ) ( IN-CITY ?auto_122952 ?auto_122962 ) ( not ( = ?auto_122952 ?auto_122961 ) ) ( OBJ-AT ?auto_122955 ?auto_122961 ) ( OBJ-AT ?auto_122957 ?auto_122961 ) ( IN-CITY ?auto_122958 ?auto_122962 ) ( not ( = ?auto_122952 ?auto_122958 ) ) ( OBJ-AT ?auto_122954 ?auto_122958 ) ( OBJ-AT ?auto_122956 ?auto_122958 ) ( IN-CITY ?auto_122959 ?auto_122962 ) ( not ( = ?auto_122952 ?auto_122959 ) ) ( OBJ-AT ?auto_122953 ?auto_122959 ) ( TRUCK-AT ?auto_122960 ?auto_122952 ) ( not ( = ?auto_122953 ?auto_122956 ) ) ( not ( = ?auto_122958 ?auto_122959 ) ) ( not ( = ?auto_122953 ?auto_122954 ) ) ( not ( = ?auto_122956 ?auto_122954 ) ) ( not ( = ?auto_122953 ?auto_122957 ) ) ( not ( = ?auto_122956 ?auto_122957 ) ) ( not ( = ?auto_122954 ?auto_122957 ) ) ( not ( = ?auto_122961 ?auto_122958 ) ) ( not ( = ?auto_122961 ?auto_122959 ) ) ( not ( = ?auto_122953 ?auto_122955 ) ) ( not ( = ?auto_122956 ?auto_122955 ) ) ( not ( = ?auto_122954 ?auto_122955 ) ) ( not ( = ?auto_122957 ?auto_122955 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_122953 ?auto_122956 ?auto_122954 ?auto_122955 ?auto_122957 ?auto_122952 )
      ( DELIVER-5PKG-VERIFY ?auto_122953 ?auto_122954 ?auto_122955 ?auto_122956 ?auto_122957 ?auto_122952 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_123051 - OBJ
      ?auto_123052 - OBJ
      ?auto_123053 - OBJ
      ?auto_123054 - OBJ
      ?auto_123055 - OBJ
      ?auto_123050 - LOCATION
    )
    :vars
    (
      ?auto_123059 - LOCATION
      ?auto_123060 - CITY
      ?auto_123056 - LOCATION
      ?auto_123057 - LOCATION
      ?auto_123058 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123059 ?auto_123060 ) ( IN-CITY ?auto_123050 ?auto_123060 ) ( not ( = ?auto_123050 ?auto_123059 ) ) ( OBJ-AT ?auto_123053 ?auto_123059 ) ( OBJ-AT ?auto_123054 ?auto_123059 ) ( IN-CITY ?auto_123056 ?auto_123060 ) ( not ( = ?auto_123050 ?auto_123056 ) ) ( OBJ-AT ?auto_123052 ?auto_123056 ) ( OBJ-AT ?auto_123055 ?auto_123056 ) ( IN-CITY ?auto_123057 ?auto_123060 ) ( not ( = ?auto_123050 ?auto_123057 ) ) ( OBJ-AT ?auto_123051 ?auto_123057 ) ( TRUCK-AT ?auto_123058 ?auto_123050 ) ( not ( = ?auto_123051 ?auto_123055 ) ) ( not ( = ?auto_123056 ?auto_123057 ) ) ( not ( = ?auto_123051 ?auto_123052 ) ) ( not ( = ?auto_123055 ?auto_123052 ) ) ( not ( = ?auto_123051 ?auto_123054 ) ) ( not ( = ?auto_123055 ?auto_123054 ) ) ( not ( = ?auto_123052 ?auto_123054 ) ) ( not ( = ?auto_123059 ?auto_123056 ) ) ( not ( = ?auto_123059 ?auto_123057 ) ) ( not ( = ?auto_123051 ?auto_123053 ) ) ( not ( = ?auto_123055 ?auto_123053 ) ) ( not ( = ?auto_123052 ?auto_123053 ) ) ( not ( = ?auto_123054 ?auto_123053 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_123051 ?auto_123055 ?auto_123052 ?auto_123053 ?auto_123054 ?auto_123050 )
      ( DELIVER-5PKG-VERIFY ?auto_123051 ?auto_123052 ?auto_123053 ?auto_123054 ?auto_123055 ?auto_123050 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_123298 - OBJ
      ?auto_123299 - OBJ
      ?auto_123300 - OBJ
      ?auto_123301 - OBJ
      ?auto_123302 - OBJ
      ?auto_123297 - LOCATION
    )
    :vars
    (
      ?auto_123306 - LOCATION
      ?auto_123307 - CITY
      ?auto_123303 - LOCATION
      ?auto_123304 - LOCATION
      ?auto_123305 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123306 ?auto_123307 ) ( IN-CITY ?auto_123297 ?auto_123307 ) ( not ( = ?auto_123297 ?auto_123306 ) ) ( OBJ-AT ?auto_123302 ?auto_123306 ) ( OBJ-AT ?auto_123299 ?auto_123306 ) ( IN-CITY ?auto_123303 ?auto_123307 ) ( not ( = ?auto_123297 ?auto_123303 ) ) ( OBJ-AT ?auto_123301 ?auto_123303 ) ( OBJ-AT ?auto_123300 ?auto_123303 ) ( IN-CITY ?auto_123304 ?auto_123307 ) ( not ( = ?auto_123297 ?auto_123304 ) ) ( OBJ-AT ?auto_123298 ?auto_123304 ) ( TRUCK-AT ?auto_123305 ?auto_123297 ) ( not ( = ?auto_123298 ?auto_123300 ) ) ( not ( = ?auto_123303 ?auto_123304 ) ) ( not ( = ?auto_123298 ?auto_123301 ) ) ( not ( = ?auto_123300 ?auto_123301 ) ) ( not ( = ?auto_123298 ?auto_123299 ) ) ( not ( = ?auto_123300 ?auto_123299 ) ) ( not ( = ?auto_123301 ?auto_123299 ) ) ( not ( = ?auto_123306 ?auto_123303 ) ) ( not ( = ?auto_123306 ?auto_123304 ) ) ( not ( = ?auto_123298 ?auto_123302 ) ) ( not ( = ?auto_123300 ?auto_123302 ) ) ( not ( = ?auto_123301 ?auto_123302 ) ) ( not ( = ?auto_123299 ?auto_123302 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_123298 ?auto_123300 ?auto_123301 ?auto_123302 ?auto_123299 ?auto_123297 )
      ( DELIVER-5PKG-VERIFY ?auto_123298 ?auto_123299 ?auto_123300 ?auto_123301 ?auto_123302 ?auto_123297 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_123345 - OBJ
      ?auto_123346 - OBJ
      ?auto_123347 - OBJ
      ?auto_123348 - OBJ
      ?auto_123349 - OBJ
      ?auto_123344 - LOCATION
    )
    :vars
    (
      ?auto_123353 - LOCATION
      ?auto_123354 - CITY
      ?auto_123350 - LOCATION
      ?auto_123351 - LOCATION
      ?auto_123352 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123353 ?auto_123354 ) ( IN-CITY ?auto_123344 ?auto_123354 ) ( not ( = ?auto_123344 ?auto_123353 ) ) ( OBJ-AT ?auto_123348 ?auto_123353 ) ( OBJ-AT ?auto_123346 ?auto_123353 ) ( IN-CITY ?auto_123350 ?auto_123354 ) ( not ( = ?auto_123344 ?auto_123350 ) ) ( OBJ-AT ?auto_123349 ?auto_123350 ) ( OBJ-AT ?auto_123347 ?auto_123350 ) ( IN-CITY ?auto_123351 ?auto_123354 ) ( not ( = ?auto_123344 ?auto_123351 ) ) ( OBJ-AT ?auto_123345 ?auto_123351 ) ( TRUCK-AT ?auto_123352 ?auto_123344 ) ( not ( = ?auto_123345 ?auto_123347 ) ) ( not ( = ?auto_123350 ?auto_123351 ) ) ( not ( = ?auto_123345 ?auto_123349 ) ) ( not ( = ?auto_123347 ?auto_123349 ) ) ( not ( = ?auto_123345 ?auto_123346 ) ) ( not ( = ?auto_123347 ?auto_123346 ) ) ( not ( = ?auto_123349 ?auto_123346 ) ) ( not ( = ?auto_123353 ?auto_123350 ) ) ( not ( = ?auto_123353 ?auto_123351 ) ) ( not ( = ?auto_123345 ?auto_123348 ) ) ( not ( = ?auto_123347 ?auto_123348 ) ) ( not ( = ?auto_123349 ?auto_123348 ) ) ( not ( = ?auto_123346 ?auto_123348 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_123345 ?auto_123347 ?auto_123349 ?auto_123348 ?auto_123346 ?auto_123344 )
      ( DELIVER-5PKG-VERIFY ?auto_123345 ?auto_123346 ?auto_123347 ?auto_123348 ?auto_123349 ?auto_123344 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_123392 - OBJ
      ?auto_123393 - OBJ
      ?auto_123394 - OBJ
      ?auto_123395 - OBJ
      ?auto_123396 - OBJ
      ?auto_123391 - LOCATION
    )
    :vars
    (
      ?auto_123400 - LOCATION
      ?auto_123401 - CITY
      ?auto_123397 - LOCATION
      ?auto_123398 - LOCATION
      ?auto_123399 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123400 ?auto_123401 ) ( IN-CITY ?auto_123391 ?auto_123401 ) ( not ( = ?auto_123391 ?auto_123400 ) ) ( OBJ-AT ?auto_123396 ?auto_123400 ) ( OBJ-AT ?auto_123393 ?auto_123400 ) ( IN-CITY ?auto_123397 ?auto_123401 ) ( not ( = ?auto_123391 ?auto_123397 ) ) ( OBJ-AT ?auto_123394 ?auto_123397 ) ( OBJ-AT ?auto_123395 ?auto_123397 ) ( IN-CITY ?auto_123398 ?auto_123401 ) ( not ( = ?auto_123391 ?auto_123398 ) ) ( OBJ-AT ?auto_123392 ?auto_123398 ) ( TRUCK-AT ?auto_123399 ?auto_123391 ) ( not ( = ?auto_123392 ?auto_123395 ) ) ( not ( = ?auto_123397 ?auto_123398 ) ) ( not ( = ?auto_123392 ?auto_123394 ) ) ( not ( = ?auto_123395 ?auto_123394 ) ) ( not ( = ?auto_123392 ?auto_123393 ) ) ( not ( = ?auto_123395 ?auto_123393 ) ) ( not ( = ?auto_123394 ?auto_123393 ) ) ( not ( = ?auto_123400 ?auto_123397 ) ) ( not ( = ?auto_123400 ?auto_123398 ) ) ( not ( = ?auto_123392 ?auto_123396 ) ) ( not ( = ?auto_123395 ?auto_123396 ) ) ( not ( = ?auto_123394 ?auto_123396 ) ) ( not ( = ?auto_123393 ?auto_123396 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_123392 ?auto_123395 ?auto_123394 ?auto_123396 ?auto_123393 ?auto_123391 )
      ( DELIVER-5PKG-VERIFY ?auto_123392 ?auto_123393 ?auto_123394 ?auto_123395 ?auto_123396 ?auto_123391 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_123439 - OBJ
      ?auto_123440 - OBJ
      ?auto_123441 - OBJ
      ?auto_123442 - OBJ
      ?auto_123443 - OBJ
      ?auto_123438 - LOCATION
    )
    :vars
    (
      ?auto_123447 - LOCATION
      ?auto_123448 - CITY
      ?auto_123444 - LOCATION
      ?auto_123445 - LOCATION
      ?auto_123446 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123447 ?auto_123448 ) ( IN-CITY ?auto_123438 ?auto_123448 ) ( not ( = ?auto_123438 ?auto_123447 ) ) ( OBJ-AT ?auto_123442 ?auto_123447 ) ( OBJ-AT ?auto_123440 ?auto_123447 ) ( IN-CITY ?auto_123444 ?auto_123448 ) ( not ( = ?auto_123438 ?auto_123444 ) ) ( OBJ-AT ?auto_123441 ?auto_123444 ) ( OBJ-AT ?auto_123443 ?auto_123444 ) ( IN-CITY ?auto_123445 ?auto_123448 ) ( not ( = ?auto_123438 ?auto_123445 ) ) ( OBJ-AT ?auto_123439 ?auto_123445 ) ( TRUCK-AT ?auto_123446 ?auto_123438 ) ( not ( = ?auto_123439 ?auto_123443 ) ) ( not ( = ?auto_123444 ?auto_123445 ) ) ( not ( = ?auto_123439 ?auto_123441 ) ) ( not ( = ?auto_123443 ?auto_123441 ) ) ( not ( = ?auto_123439 ?auto_123440 ) ) ( not ( = ?auto_123443 ?auto_123440 ) ) ( not ( = ?auto_123441 ?auto_123440 ) ) ( not ( = ?auto_123447 ?auto_123444 ) ) ( not ( = ?auto_123447 ?auto_123445 ) ) ( not ( = ?auto_123439 ?auto_123442 ) ) ( not ( = ?auto_123443 ?auto_123442 ) ) ( not ( = ?auto_123441 ?auto_123442 ) ) ( not ( = ?auto_123440 ?auto_123442 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_123439 ?auto_123443 ?auto_123441 ?auto_123442 ?auto_123440 ?auto_123438 )
      ( DELIVER-5PKG-VERIFY ?auto_123439 ?auto_123440 ?auto_123441 ?auto_123442 ?auto_123443 ?auto_123438 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_123686 - OBJ
      ?auto_123687 - OBJ
      ?auto_123688 - OBJ
      ?auto_123689 - OBJ
      ?auto_123690 - OBJ
      ?auto_123685 - LOCATION
    )
    :vars
    (
      ?auto_123694 - LOCATION
      ?auto_123695 - CITY
      ?auto_123691 - LOCATION
      ?auto_123692 - LOCATION
      ?auto_123693 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123694 ?auto_123695 ) ( IN-CITY ?auto_123685 ?auto_123695 ) ( not ( = ?auto_123685 ?auto_123694 ) ) ( OBJ-AT ?auto_123688 ?auto_123694 ) ( OBJ-AT ?auto_123687 ?auto_123694 ) ( IN-CITY ?auto_123691 ?auto_123695 ) ( not ( = ?auto_123685 ?auto_123691 ) ) ( OBJ-AT ?auto_123690 ?auto_123691 ) ( OBJ-AT ?auto_123689 ?auto_123691 ) ( IN-CITY ?auto_123692 ?auto_123695 ) ( not ( = ?auto_123685 ?auto_123692 ) ) ( OBJ-AT ?auto_123686 ?auto_123692 ) ( TRUCK-AT ?auto_123693 ?auto_123685 ) ( not ( = ?auto_123686 ?auto_123689 ) ) ( not ( = ?auto_123691 ?auto_123692 ) ) ( not ( = ?auto_123686 ?auto_123690 ) ) ( not ( = ?auto_123689 ?auto_123690 ) ) ( not ( = ?auto_123686 ?auto_123687 ) ) ( not ( = ?auto_123689 ?auto_123687 ) ) ( not ( = ?auto_123690 ?auto_123687 ) ) ( not ( = ?auto_123694 ?auto_123691 ) ) ( not ( = ?auto_123694 ?auto_123692 ) ) ( not ( = ?auto_123686 ?auto_123688 ) ) ( not ( = ?auto_123689 ?auto_123688 ) ) ( not ( = ?auto_123690 ?auto_123688 ) ) ( not ( = ?auto_123687 ?auto_123688 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_123686 ?auto_123689 ?auto_123690 ?auto_123688 ?auto_123687 ?auto_123685 )
      ( DELIVER-5PKG-VERIFY ?auto_123686 ?auto_123687 ?auto_123688 ?auto_123689 ?auto_123690 ?auto_123685 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_123733 - OBJ
      ?auto_123734 - OBJ
      ?auto_123735 - OBJ
      ?auto_123736 - OBJ
      ?auto_123737 - OBJ
      ?auto_123732 - LOCATION
    )
    :vars
    (
      ?auto_123741 - LOCATION
      ?auto_123742 - CITY
      ?auto_123738 - LOCATION
      ?auto_123739 - LOCATION
      ?auto_123740 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_123741 ?auto_123742 ) ( IN-CITY ?auto_123732 ?auto_123742 ) ( not ( = ?auto_123732 ?auto_123741 ) ) ( OBJ-AT ?auto_123735 ?auto_123741 ) ( OBJ-AT ?auto_123734 ?auto_123741 ) ( IN-CITY ?auto_123738 ?auto_123742 ) ( not ( = ?auto_123732 ?auto_123738 ) ) ( OBJ-AT ?auto_123736 ?auto_123738 ) ( OBJ-AT ?auto_123737 ?auto_123738 ) ( IN-CITY ?auto_123739 ?auto_123742 ) ( not ( = ?auto_123732 ?auto_123739 ) ) ( OBJ-AT ?auto_123733 ?auto_123739 ) ( TRUCK-AT ?auto_123740 ?auto_123732 ) ( not ( = ?auto_123733 ?auto_123737 ) ) ( not ( = ?auto_123738 ?auto_123739 ) ) ( not ( = ?auto_123733 ?auto_123736 ) ) ( not ( = ?auto_123737 ?auto_123736 ) ) ( not ( = ?auto_123733 ?auto_123734 ) ) ( not ( = ?auto_123737 ?auto_123734 ) ) ( not ( = ?auto_123736 ?auto_123734 ) ) ( not ( = ?auto_123741 ?auto_123738 ) ) ( not ( = ?auto_123741 ?auto_123739 ) ) ( not ( = ?auto_123733 ?auto_123735 ) ) ( not ( = ?auto_123737 ?auto_123735 ) ) ( not ( = ?auto_123736 ?auto_123735 ) ) ( not ( = ?auto_123734 ?auto_123735 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_123733 ?auto_123737 ?auto_123736 ?auto_123735 ?auto_123734 ?auto_123732 )
      ( DELIVER-5PKG-VERIFY ?auto_123733 ?auto_123734 ?auto_123735 ?auto_123736 ?auto_123737 ?auto_123732 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124391 - OBJ
      ?auto_124392 - OBJ
      ?auto_124393 - OBJ
      ?auto_124394 - OBJ
      ?auto_124395 - OBJ
      ?auto_124390 - LOCATION
    )
    :vars
    (
      ?auto_124399 - LOCATION
      ?auto_124400 - CITY
      ?auto_124396 - LOCATION
      ?auto_124397 - LOCATION
      ?auto_124398 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124399 ?auto_124400 ) ( IN-CITY ?auto_124390 ?auto_124400 ) ( not ( = ?auto_124390 ?auto_124399 ) ) ( OBJ-AT ?auto_124392 ?auto_124399 ) ( OBJ-AT ?auto_124395 ?auto_124399 ) ( IN-CITY ?auto_124396 ?auto_124400 ) ( not ( = ?auto_124390 ?auto_124396 ) ) ( OBJ-AT ?auto_124394 ?auto_124396 ) ( OBJ-AT ?auto_124393 ?auto_124396 ) ( IN-CITY ?auto_124397 ?auto_124400 ) ( not ( = ?auto_124390 ?auto_124397 ) ) ( OBJ-AT ?auto_124391 ?auto_124397 ) ( TRUCK-AT ?auto_124398 ?auto_124390 ) ( not ( = ?auto_124391 ?auto_124393 ) ) ( not ( = ?auto_124396 ?auto_124397 ) ) ( not ( = ?auto_124391 ?auto_124394 ) ) ( not ( = ?auto_124393 ?auto_124394 ) ) ( not ( = ?auto_124391 ?auto_124395 ) ) ( not ( = ?auto_124393 ?auto_124395 ) ) ( not ( = ?auto_124394 ?auto_124395 ) ) ( not ( = ?auto_124399 ?auto_124396 ) ) ( not ( = ?auto_124399 ?auto_124397 ) ) ( not ( = ?auto_124391 ?auto_124392 ) ) ( not ( = ?auto_124393 ?auto_124392 ) ) ( not ( = ?auto_124394 ?auto_124392 ) ) ( not ( = ?auto_124395 ?auto_124392 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124391 ?auto_124393 ?auto_124394 ?auto_124392 ?auto_124395 ?auto_124390 )
      ( DELIVER-5PKG-VERIFY ?auto_124391 ?auto_124392 ?auto_124393 ?auto_124394 ?auto_124395 ?auto_124390 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124438 - OBJ
      ?auto_124439 - OBJ
      ?auto_124440 - OBJ
      ?auto_124441 - OBJ
      ?auto_124442 - OBJ
      ?auto_124437 - LOCATION
    )
    :vars
    (
      ?auto_124446 - LOCATION
      ?auto_124447 - CITY
      ?auto_124443 - LOCATION
      ?auto_124444 - LOCATION
      ?auto_124445 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124446 ?auto_124447 ) ( IN-CITY ?auto_124437 ?auto_124447 ) ( not ( = ?auto_124437 ?auto_124446 ) ) ( OBJ-AT ?auto_124439 ?auto_124446 ) ( OBJ-AT ?auto_124441 ?auto_124446 ) ( IN-CITY ?auto_124443 ?auto_124447 ) ( not ( = ?auto_124437 ?auto_124443 ) ) ( OBJ-AT ?auto_124442 ?auto_124443 ) ( OBJ-AT ?auto_124440 ?auto_124443 ) ( IN-CITY ?auto_124444 ?auto_124447 ) ( not ( = ?auto_124437 ?auto_124444 ) ) ( OBJ-AT ?auto_124438 ?auto_124444 ) ( TRUCK-AT ?auto_124445 ?auto_124437 ) ( not ( = ?auto_124438 ?auto_124440 ) ) ( not ( = ?auto_124443 ?auto_124444 ) ) ( not ( = ?auto_124438 ?auto_124442 ) ) ( not ( = ?auto_124440 ?auto_124442 ) ) ( not ( = ?auto_124438 ?auto_124441 ) ) ( not ( = ?auto_124440 ?auto_124441 ) ) ( not ( = ?auto_124442 ?auto_124441 ) ) ( not ( = ?auto_124446 ?auto_124443 ) ) ( not ( = ?auto_124446 ?auto_124444 ) ) ( not ( = ?auto_124438 ?auto_124439 ) ) ( not ( = ?auto_124440 ?auto_124439 ) ) ( not ( = ?auto_124442 ?auto_124439 ) ) ( not ( = ?auto_124441 ?auto_124439 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124438 ?auto_124440 ?auto_124442 ?auto_124439 ?auto_124441 ?auto_124437 )
      ( DELIVER-5PKG-VERIFY ?auto_124438 ?auto_124439 ?auto_124440 ?auto_124441 ?auto_124442 ?auto_124437 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124635 - OBJ
      ?auto_124636 - OBJ
      ?auto_124637 - OBJ
      ?auto_124638 - OBJ
      ?auto_124639 - OBJ
      ?auto_124634 - LOCATION
    )
    :vars
    (
      ?auto_124643 - LOCATION
      ?auto_124644 - CITY
      ?auto_124640 - LOCATION
      ?auto_124641 - LOCATION
      ?auto_124642 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124643 ?auto_124644 ) ( IN-CITY ?auto_124634 ?auto_124644 ) ( not ( = ?auto_124634 ?auto_124643 ) ) ( OBJ-AT ?auto_124636 ?auto_124643 ) ( OBJ-AT ?auto_124639 ?auto_124643 ) ( IN-CITY ?auto_124640 ?auto_124644 ) ( not ( = ?auto_124634 ?auto_124640 ) ) ( OBJ-AT ?auto_124637 ?auto_124640 ) ( OBJ-AT ?auto_124638 ?auto_124640 ) ( IN-CITY ?auto_124641 ?auto_124644 ) ( not ( = ?auto_124634 ?auto_124641 ) ) ( OBJ-AT ?auto_124635 ?auto_124641 ) ( TRUCK-AT ?auto_124642 ?auto_124634 ) ( not ( = ?auto_124635 ?auto_124638 ) ) ( not ( = ?auto_124640 ?auto_124641 ) ) ( not ( = ?auto_124635 ?auto_124637 ) ) ( not ( = ?auto_124638 ?auto_124637 ) ) ( not ( = ?auto_124635 ?auto_124639 ) ) ( not ( = ?auto_124638 ?auto_124639 ) ) ( not ( = ?auto_124637 ?auto_124639 ) ) ( not ( = ?auto_124643 ?auto_124640 ) ) ( not ( = ?auto_124643 ?auto_124641 ) ) ( not ( = ?auto_124635 ?auto_124636 ) ) ( not ( = ?auto_124638 ?auto_124636 ) ) ( not ( = ?auto_124637 ?auto_124636 ) ) ( not ( = ?auto_124639 ?auto_124636 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124635 ?auto_124638 ?auto_124637 ?auto_124636 ?auto_124639 ?auto_124634 )
      ( DELIVER-5PKG-VERIFY ?auto_124635 ?auto_124636 ?auto_124637 ?auto_124638 ?auto_124639 ?auto_124634 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124733 - OBJ
      ?auto_124734 - OBJ
      ?auto_124735 - OBJ
      ?auto_124736 - OBJ
      ?auto_124737 - OBJ
      ?auto_124732 - LOCATION
    )
    :vars
    (
      ?auto_124741 - LOCATION
      ?auto_124742 - CITY
      ?auto_124738 - LOCATION
      ?auto_124739 - LOCATION
      ?auto_124740 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124741 ?auto_124742 ) ( IN-CITY ?auto_124732 ?auto_124742 ) ( not ( = ?auto_124732 ?auto_124741 ) ) ( OBJ-AT ?auto_124734 ?auto_124741 ) ( OBJ-AT ?auto_124736 ?auto_124741 ) ( IN-CITY ?auto_124738 ?auto_124742 ) ( not ( = ?auto_124732 ?auto_124738 ) ) ( OBJ-AT ?auto_124735 ?auto_124738 ) ( OBJ-AT ?auto_124737 ?auto_124738 ) ( IN-CITY ?auto_124739 ?auto_124742 ) ( not ( = ?auto_124732 ?auto_124739 ) ) ( OBJ-AT ?auto_124733 ?auto_124739 ) ( TRUCK-AT ?auto_124740 ?auto_124732 ) ( not ( = ?auto_124733 ?auto_124737 ) ) ( not ( = ?auto_124738 ?auto_124739 ) ) ( not ( = ?auto_124733 ?auto_124735 ) ) ( not ( = ?auto_124737 ?auto_124735 ) ) ( not ( = ?auto_124733 ?auto_124736 ) ) ( not ( = ?auto_124737 ?auto_124736 ) ) ( not ( = ?auto_124735 ?auto_124736 ) ) ( not ( = ?auto_124741 ?auto_124738 ) ) ( not ( = ?auto_124741 ?auto_124739 ) ) ( not ( = ?auto_124733 ?auto_124734 ) ) ( not ( = ?auto_124737 ?auto_124734 ) ) ( not ( = ?auto_124735 ?auto_124734 ) ) ( not ( = ?auto_124736 ?auto_124734 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124733 ?auto_124737 ?auto_124735 ?auto_124734 ?auto_124736 ?auto_124732 )
      ( DELIVER-5PKG-VERIFY ?auto_124733 ?auto_124734 ?auto_124735 ?auto_124736 ?auto_124737 ?auto_124732 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124930 - OBJ
      ?auto_124931 - OBJ
      ?auto_124932 - OBJ
      ?auto_124933 - OBJ
      ?auto_124934 - OBJ
      ?auto_124929 - LOCATION
    )
    :vars
    (
      ?auto_124938 - LOCATION
      ?auto_124939 - CITY
      ?auto_124935 - LOCATION
      ?auto_124936 - LOCATION
      ?auto_124937 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124938 ?auto_124939 ) ( IN-CITY ?auto_124929 ?auto_124939 ) ( not ( = ?auto_124929 ?auto_124938 ) ) ( OBJ-AT ?auto_124931 ?auto_124938 ) ( OBJ-AT ?auto_124932 ?auto_124938 ) ( IN-CITY ?auto_124935 ?auto_124939 ) ( not ( = ?auto_124929 ?auto_124935 ) ) ( OBJ-AT ?auto_124934 ?auto_124935 ) ( OBJ-AT ?auto_124933 ?auto_124935 ) ( IN-CITY ?auto_124936 ?auto_124939 ) ( not ( = ?auto_124929 ?auto_124936 ) ) ( OBJ-AT ?auto_124930 ?auto_124936 ) ( TRUCK-AT ?auto_124937 ?auto_124929 ) ( not ( = ?auto_124930 ?auto_124933 ) ) ( not ( = ?auto_124935 ?auto_124936 ) ) ( not ( = ?auto_124930 ?auto_124934 ) ) ( not ( = ?auto_124933 ?auto_124934 ) ) ( not ( = ?auto_124930 ?auto_124932 ) ) ( not ( = ?auto_124933 ?auto_124932 ) ) ( not ( = ?auto_124934 ?auto_124932 ) ) ( not ( = ?auto_124938 ?auto_124935 ) ) ( not ( = ?auto_124938 ?auto_124936 ) ) ( not ( = ?auto_124930 ?auto_124931 ) ) ( not ( = ?auto_124933 ?auto_124931 ) ) ( not ( = ?auto_124934 ?auto_124931 ) ) ( not ( = ?auto_124932 ?auto_124931 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124930 ?auto_124933 ?auto_124934 ?auto_124931 ?auto_124932 ?auto_124929 )
      ( DELIVER-5PKG-VERIFY ?auto_124930 ?auto_124931 ?auto_124932 ?auto_124933 ?auto_124934 ?auto_124929 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_124977 - OBJ
      ?auto_124978 - OBJ
      ?auto_124979 - OBJ
      ?auto_124980 - OBJ
      ?auto_124981 - OBJ
      ?auto_124976 - LOCATION
    )
    :vars
    (
      ?auto_124985 - LOCATION
      ?auto_124986 - CITY
      ?auto_124982 - LOCATION
      ?auto_124983 - LOCATION
      ?auto_124984 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_124985 ?auto_124986 ) ( IN-CITY ?auto_124976 ?auto_124986 ) ( not ( = ?auto_124976 ?auto_124985 ) ) ( OBJ-AT ?auto_124978 ?auto_124985 ) ( OBJ-AT ?auto_124979 ?auto_124985 ) ( IN-CITY ?auto_124982 ?auto_124986 ) ( not ( = ?auto_124976 ?auto_124982 ) ) ( OBJ-AT ?auto_124980 ?auto_124982 ) ( OBJ-AT ?auto_124981 ?auto_124982 ) ( IN-CITY ?auto_124983 ?auto_124986 ) ( not ( = ?auto_124976 ?auto_124983 ) ) ( OBJ-AT ?auto_124977 ?auto_124983 ) ( TRUCK-AT ?auto_124984 ?auto_124976 ) ( not ( = ?auto_124977 ?auto_124981 ) ) ( not ( = ?auto_124982 ?auto_124983 ) ) ( not ( = ?auto_124977 ?auto_124980 ) ) ( not ( = ?auto_124981 ?auto_124980 ) ) ( not ( = ?auto_124977 ?auto_124979 ) ) ( not ( = ?auto_124981 ?auto_124979 ) ) ( not ( = ?auto_124980 ?auto_124979 ) ) ( not ( = ?auto_124985 ?auto_124982 ) ) ( not ( = ?auto_124985 ?auto_124983 ) ) ( not ( = ?auto_124977 ?auto_124978 ) ) ( not ( = ?auto_124981 ?auto_124978 ) ) ( not ( = ?auto_124980 ?auto_124978 ) ) ( not ( = ?auto_124979 ?auto_124978 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_124977 ?auto_124981 ?auto_124980 ?auto_124978 ?auto_124979 ?auto_124976 )
      ( DELIVER-5PKG-VERIFY ?auto_124977 ?auto_124978 ?auto_124979 ?auto_124980 ?auto_124981 ?auto_124976 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_125735 - OBJ
      ?auto_125736 - OBJ
      ?auto_125737 - OBJ
      ?auto_125738 - OBJ
      ?auto_125739 - OBJ
      ?auto_125734 - LOCATION
    )
    :vars
    (
      ?auto_125743 - LOCATION
      ?auto_125744 - CITY
      ?auto_125740 - LOCATION
      ?auto_125741 - LOCATION
      ?auto_125742 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_125743 ?auto_125744 ) ( IN-CITY ?auto_125734 ?auto_125744 ) ( not ( = ?auto_125734 ?auto_125743 ) ) ( OBJ-AT ?auto_125739 ?auto_125743 ) ( OBJ-AT ?auto_125738 ?auto_125743 ) ( IN-CITY ?auto_125740 ?auto_125744 ) ( not ( = ?auto_125734 ?auto_125740 ) ) ( OBJ-AT ?auto_125737 ?auto_125740 ) ( OBJ-AT ?auto_125735 ?auto_125740 ) ( IN-CITY ?auto_125741 ?auto_125744 ) ( not ( = ?auto_125734 ?auto_125741 ) ) ( OBJ-AT ?auto_125736 ?auto_125741 ) ( TRUCK-AT ?auto_125742 ?auto_125734 ) ( not ( = ?auto_125736 ?auto_125735 ) ) ( not ( = ?auto_125740 ?auto_125741 ) ) ( not ( = ?auto_125736 ?auto_125737 ) ) ( not ( = ?auto_125735 ?auto_125737 ) ) ( not ( = ?auto_125736 ?auto_125738 ) ) ( not ( = ?auto_125735 ?auto_125738 ) ) ( not ( = ?auto_125737 ?auto_125738 ) ) ( not ( = ?auto_125743 ?auto_125740 ) ) ( not ( = ?auto_125743 ?auto_125741 ) ) ( not ( = ?auto_125736 ?auto_125739 ) ) ( not ( = ?auto_125735 ?auto_125739 ) ) ( not ( = ?auto_125737 ?auto_125739 ) ) ( not ( = ?auto_125738 ?auto_125739 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_125736 ?auto_125735 ?auto_125737 ?auto_125739 ?auto_125738 ?auto_125734 )
      ( DELIVER-5PKG-VERIFY ?auto_125735 ?auto_125736 ?auto_125737 ?auto_125738 ?auto_125739 ?auto_125734 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_125782 - OBJ
      ?auto_125783 - OBJ
      ?auto_125784 - OBJ
      ?auto_125785 - OBJ
      ?auto_125786 - OBJ
      ?auto_125781 - LOCATION
    )
    :vars
    (
      ?auto_125790 - LOCATION
      ?auto_125791 - CITY
      ?auto_125787 - LOCATION
      ?auto_125788 - LOCATION
      ?auto_125789 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_125790 ?auto_125791 ) ( IN-CITY ?auto_125781 ?auto_125791 ) ( not ( = ?auto_125781 ?auto_125790 ) ) ( OBJ-AT ?auto_125785 ?auto_125790 ) ( OBJ-AT ?auto_125786 ?auto_125790 ) ( IN-CITY ?auto_125787 ?auto_125791 ) ( not ( = ?auto_125781 ?auto_125787 ) ) ( OBJ-AT ?auto_125784 ?auto_125787 ) ( OBJ-AT ?auto_125782 ?auto_125787 ) ( IN-CITY ?auto_125788 ?auto_125791 ) ( not ( = ?auto_125781 ?auto_125788 ) ) ( OBJ-AT ?auto_125783 ?auto_125788 ) ( TRUCK-AT ?auto_125789 ?auto_125781 ) ( not ( = ?auto_125783 ?auto_125782 ) ) ( not ( = ?auto_125787 ?auto_125788 ) ) ( not ( = ?auto_125783 ?auto_125784 ) ) ( not ( = ?auto_125782 ?auto_125784 ) ) ( not ( = ?auto_125783 ?auto_125786 ) ) ( not ( = ?auto_125782 ?auto_125786 ) ) ( not ( = ?auto_125784 ?auto_125786 ) ) ( not ( = ?auto_125790 ?auto_125787 ) ) ( not ( = ?auto_125790 ?auto_125788 ) ) ( not ( = ?auto_125783 ?auto_125785 ) ) ( not ( = ?auto_125782 ?auto_125785 ) ) ( not ( = ?auto_125784 ?auto_125785 ) ) ( not ( = ?auto_125786 ?auto_125785 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_125783 ?auto_125782 ?auto_125784 ?auto_125785 ?auto_125786 ?auto_125781 )
      ( DELIVER-5PKG-VERIFY ?auto_125782 ?auto_125783 ?auto_125784 ?auto_125785 ?auto_125786 ?auto_125781 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_125829 - OBJ
      ?auto_125830 - OBJ
      ?auto_125831 - OBJ
      ?auto_125832 - OBJ
      ?auto_125833 - OBJ
      ?auto_125828 - LOCATION
    )
    :vars
    (
      ?auto_125837 - LOCATION
      ?auto_125838 - CITY
      ?auto_125834 - LOCATION
      ?auto_125835 - LOCATION
      ?auto_125836 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_125837 ?auto_125838 ) ( IN-CITY ?auto_125828 ?auto_125838 ) ( not ( = ?auto_125828 ?auto_125837 ) ) ( OBJ-AT ?auto_125833 ?auto_125837 ) ( OBJ-AT ?auto_125831 ?auto_125837 ) ( IN-CITY ?auto_125834 ?auto_125838 ) ( not ( = ?auto_125828 ?auto_125834 ) ) ( OBJ-AT ?auto_125832 ?auto_125834 ) ( OBJ-AT ?auto_125829 ?auto_125834 ) ( IN-CITY ?auto_125835 ?auto_125838 ) ( not ( = ?auto_125828 ?auto_125835 ) ) ( OBJ-AT ?auto_125830 ?auto_125835 ) ( TRUCK-AT ?auto_125836 ?auto_125828 ) ( not ( = ?auto_125830 ?auto_125829 ) ) ( not ( = ?auto_125834 ?auto_125835 ) ) ( not ( = ?auto_125830 ?auto_125832 ) ) ( not ( = ?auto_125829 ?auto_125832 ) ) ( not ( = ?auto_125830 ?auto_125831 ) ) ( not ( = ?auto_125829 ?auto_125831 ) ) ( not ( = ?auto_125832 ?auto_125831 ) ) ( not ( = ?auto_125837 ?auto_125834 ) ) ( not ( = ?auto_125837 ?auto_125835 ) ) ( not ( = ?auto_125830 ?auto_125833 ) ) ( not ( = ?auto_125829 ?auto_125833 ) ) ( not ( = ?auto_125832 ?auto_125833 ) ) ( not ( = ?auto_125831 ?auto_125833 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_125830 ?auto_125829 ?auto_125832 ?auto_125833 ?auto_125831 ?auto_125828 )
      ( DELIVER-5PKG-VERIFY ?auto_125829 ?auto_125830 ?auto_125831 ?auto_125832 ?auto_125833 ?auto_125828 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_125876 - OBJ
      ?auto_125877 - OBJ
      ?auto_125878 - OBJ
      ?auto_125879 - OBJ
      ?auto_125880 - OBJ
      ?auto_125875 - LOCATION
    )
    :vars
    (
      ?auto_125884 - LOCATION
      ?auto_125885 - CITY
      ?auto_125881 - LOCATION
      ?auto_125882 - LOCATION
      ?auto_125883 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_125884 ?auto_125885 ) ( IN-CITY ?auto_125875 ?auto_125885 ) ( not ( = ?auto_125875 ?auto_125884 ) ) ( OBJ-AT ?auto_125879 ?auto_125884 ) ( OBJ-AT ?auto_125878 ?auto_125884 ) ( IN-CITY ?auto_125881 ?auto_125885 ) ( not ( = ?auto_125875 ?auto_125881 ) ) ( OBJ-AT ?auto_125880 ?auto_125881 ) ( OBJ-AT ?auto_125876 ?auto_125881 ) ( IN-CITY ?auto_125882 ?auto_125885 ) ( not ( = ?auto_125875 ?auto_125882 ) ) ( OBJ-AT ?auto_125877 ?auto_125882 ) ( TRUCK-AT ?auto_125883 ?auto_125875 ) ( not ( = ?auto_125877 ?auto_125876 ) ) ( not ( = ?auto_125881 ?auto_125882 ) ) ( not ( = ?auto_125877 ?auto_125880 ) ) ( not ( = ?auto_125876 ?auto_125880 ) ) ( not ( = ?auto_125877 ?auto_125878 ) ) ( not ( = ?auto_125876 ?auto_125878 ) ) ( not ( = ?auto_125880 ?auto_125878 ) ) ( not ( = ?auto_125884 ?auto_125881 ) ) ( not ( = ?auto_125884 ?auto_125882 ) ) ( not ( = ?auto_125877 ?auto_125879 ) ) ( not ( = ?auto_125876 ?auto_125879 ) ) ( not ( = ?auto_125880 ?auto_125879 ) ) ( not ( = ?auto_125878 ?auto_125879 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_125877 ?auto_125876 ?auto_125880 ?auto_125879 ?auto_125878 ?auto_125875 )
      ( DELIVER-5PKG-VERIFY ?auto_125876 ?auto_125877 ?auto_125878 ?auto_125879 ?auto_125880 ?auto_125875 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_126073 - OBJ
      ?auto_126074 - OBJ
      ?auto_126075 - OBJ
      ?auto_126076 - OBJ
      ?auto_126077 - OBJ
      ?auto_126072 - LOCATION
    )
    :vars
    (
      ?auto_126081 - LOCATION
      ?auto_126082 - CITY
      ?auto_126078 - LOCATION
      ?auto_126079 - LOCATION
      ?auto_126080 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_126081 ?auto_126082 ) ( IN-CITY ?auto_126072 ?auto_126082 ) ( not ( = ?auto_126072 ?auto_126081 ) ) ( OBJ-AT ?auto_126075 ?auto_126081 ) ( OBJ-AT ?auto_126077 ?auto_126081 ) ( IN-CITY ?auto_126078 ?auto_126082 ) ( not ( = ?auto_126072 ?auto_126078 ) ) ( OBJ-AT ?auto_126076 ?auto_126078 ) ( OBJ-AT ?auto_126073 ?auto_126078 ) ( IN-CITY ?auto_126079 ?auto_126082 ) ( not ( = ?auto_126072 ?auto_126079 ) ) ( OBJ-AT ?auto_126074 ?auto_126079 ) ( TRUCK-AT ?auto_126080 ?auto_126072 ) ( not ( = ?auto_126074 ?auto_126073 ) ) ( not ( = ?auto_126078 ?auto_126079 ) ) ( not ( = ?auto_126074 ?auto_126076 ) ) ( not ( = ?auto_126073 ?auto_126076 ) ) ( not ( = ?auto_126074 ?auto_126077 ) ) ( not ( = ?auto_126073 ?auto_126077 ) ) ( not ( = ?auto_126076 ?auto_126077 ) ) ( not ( = ?auto_126081 ?auto_126078 ) ) ( not ( = ?auto_126081 ?auto_126079 ) ) ( not ( = ?auto_126074 ?auto_126075 ) ) ( not ( = ?auto_126073 ?auto_126075 ) ) ( not ( = ?auto_126076 ?auto_126075 ) ) ( not ( = ?auto_126077 ?auto_126075 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_126074 ?auto_126073 ?auto_126076 ?auto_126075 ?auto_126077 ?auto_126072 )
      ( DELIVER-5PKG-VERIFY ?auto_126073 ?auto_126074 ?auto_126075 ?auto_126076 ?auto_126077 ?auto_126072 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_126120 - OBJ
      ?auto_126121 - OBJ
      ?auto_126122 - OBJ
      ?auto_126123 - OBJ
      ?auto_126124 - OBJ
      ?auto_126119 - LOCATION
    )
    :vars
    (
      ?auto_126128 - LOCATION
      ?auto_126129 - CITY
      ?auto_126125 - LOCATION
      ?auto_126126 - LOCATION
      ?auto_126127 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_126128 ?auto_126129 ) ( IN-CITY ?auto_126119 ?auto_126129 ) ( not ( = ?auto_126119 ?auto_126128 ) ) ( OBJ-AT ?auto_126122 ?auto_126128 ) ( OBJ-AT ?auto_126123 ?auto_126128 ) ( IN-CITY ?auto_126125 ?auto_126129 ) ( not ( = ?auto_126119 ?auto_126125 ) ) ( OBJ-AT ?auto_126124 ?auto_126125 ) ( OBJ-AT ?auto_126120 ?auto_126125 ) ( IN-CITY ?auto_126126 ?auto_126129 ) ( not ( = ?auto_126119 ?auto_126126 ) ) ( OBJ-AT ?auto_126121 ?auto_126126 ) ( TRUCK-AT ?auto_126127 ?auto_126119 ) ( not ( = ?auto_126121 ?auto_126120 ) ) ( not ( = ?auto_126125 ?auto_126126 ) ) ( not ( = ?auto_126121 ?auto_126124 ) ) ( not ( = ?auto_126120 ?auto_126124 ) ) ( not ( = ?auto_126121 ?auto_126123 ) ) ( not ( = ?auto_126120 ?auto_126123 ) ) ( not ( = ?auto_126124 ?auto_126123 ) ) ( not ( = ?auto_126128 ?auto_126125 ) ) ( not ( = ?auto_126128 ?auto_126126 ) ) ( not ( = ?auto_126121 ?auto_126122 ) ) ( not ( = ?auto_126120 ?auto_126122 ) ) ( not ( = ?auto_126124 ?auto_126122 ) ) ( not ( = ?auto_126123 ?auto_126122 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_126121 ?auto_126120 ?auto_126124 ?auto_126122 ?auto_126123 ?auto_126119 )
      ( DELIVER-5PKG-VERIFY ?auto_126120 ?auto_126121 ?auto_126122 ?auto_126123 ?auto_126124 ?auto_126119 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_127036 - OBJ
      ?auto_127037 - OBJ
      ?auto_127038 - OBJ
      ?auto_127039 - OBJ
      ?auto_127040 - OBJ
      ?auto_127035 - LOCATION
    )
    :vars
    (
      ?auto_127044 - LOCATION
      ?auto_127045 - CITY
      ?auto_127041 - LOCATION
      ?auto_127042 - LOCATION
      ?auto_127043 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_127044 ?auto_127045 ) ( IN-CITY ?auto_127035 ?auto_127045 ) ( not ( = ?auto_127035 ?auto_127044 ) ) ( OBJ-AT ?auto_127040 ?auto_127044 ) ( OBJ-AT ?auto_127039 ?auto_127044 ) ( IN-CITY ?auto_127041 ?auto_127045 ) ( not ( = ?auto_127035 ?auto_127041 ) ) ( OBJ-AT ?auto_127037 ?auto_127041 ) ( OBJ-AT ?auto_127036 ?auto_127041 ) ( IN-CITY ?auto_127042 ?auto_127045 ) ( not ( = ?auto_127035 ?auto_127042 ) ) ( OBJ-AT ?auto_127038 ?auto_127042 ) ( TRUCK-AT ?auto_127043 ?auto_127035 ) ( not ( = ?auto_127038 ?auto_127036 ) ) ( not ( = ?auto_127041 ?auto_127042 ) ) ( not ( = ?auto_127038 ?auto_127037 ) ) ( not ( = ?auto_127036 ?auto_127037 ) ) ( not ( = ?auto_127038 ?auto_127039 ) ) ( not ( = ?auto_127036 ?auto_127039 ) ) ( not ( = ?auto_127037 ?auto_127039 ) ) ( not ( = ?auto_127044 ?auto_127041 ) ) ( not ( = ?auto_127044 ?auto_127042 ) ) ( not ( = ?auto_127038 ?auto_127040 ) ) ( not ( = ?auto_127036 ?auto_127040 ) ) ( not ( = ?auto_127037 ?auto_127040 ) ) ( not ( = ?auto_127039 ?auto_127040 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_127038 ?auto_127036 ?auto_127037 ?auto_127040 ?auto_127039 ?auto_127035 )
      ( DELIVER-5PKG-VERIFY ?auto_127036 ?auto_127037 ?auto_127038 ?auto_127039 ?auto_127040 ?auto_127035 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_127083 - OBJ
      ?auto_127084 - OBJ
      ?auto_127085 - OBJ
      ?auto_127086 - OBJ
      ?auto_127087 - OBJ
      ?auto_127082 - LOCATION
    )
    :vars
    (
      ?auto_127091 - LOCATION
      ?auto_127092 - CITY
      ?auto_127088 - LOCATION
      ?auto_127089 - LOCATION
      ?auto_127090 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_127091 ?auto_127092 ) ( IN-CITY ?auto_127082 ?auto_127092 ) ( not ( = ?auto_127082 ?auto_127091 ) ) ( OBJ-AT ?auto_127086 ?auto_127091 ) ( OBJ-AT ?auto_127087 ?auto_127091 ) ( IN-CITY ?auto_127088 ?auto_127092 ) ( not ( = ?auto_127082 ?auto_127088 ) ) ( OBJ-AT ?auto_127084 ?auto_127088 ) ( OBJ-AT ?auto_127083 ?auto_127088 ) ( IN-CITY ?auto_127089 ?auto_127092 ) ( not ( = ?auto_127082 ?auto_127089 ) ) ( OBJ-AT ?auto_127085 ?auto_127089 ) ( TRUCK-AT ?auto_127090 ?auto_127082 ) ( not ( = ?auto_127085 ?auto_127083 ) ) ( not ( = ?auto_127088 ?auto_127089 ) ) ( not ( = ?auto_127085 ?auto_127084 ) ) ( not ( = ?auto_127083 ?auto_127084 ) ) ( not ( = ?auto_127085 ?auto_127087 ) ) ( not ( = ?auto_127083 ?auto_127087 ) ) ( not ( = ?auto_127084 ?auto_127087 ) ) ( not ( = ?auto_127091 ?auto_127088 ) ) ( not ( = ?auto_127091 ?auto_127089 ) ) ( not ( = ?auto_127085 ?auto_127086 ) ) ( not ( = ?auto_127083 ?auto_127086 ) ) ( not ( = ?auto_127084 ?auto_127086 ) ) ( not ( = ?auto_127087 ?auto_127086 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_127085 ?auto_127083 ?auto_127084 ?auto_127086 ?auto_127087 ?auto_127082 )
      ( DELIVER-5PKG-VERIFY ?auto_127083 ?auto_127084 ?auto_127085 ?auto_127086 ?auto_127087 ?auto_127082 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_127332 - OBJ
      ?auto_127333 - OBJ
      ?auto_127334 - OBJ
      ?auto_127335 - OBJ
      ?auto_127336 - OBJ
      ?auto_127331 - LOCATION
    )
    :vars
    (
      ?auto_127340 - LOCATION
      ?auto_127341 - CITY
      ?auto_127337 - LOCATION
      ?auto_127338 - LOCATION
      ?auto_127339 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_127340 ?auto_127341 ) ( IN-CITY ?auto_127331 ?auto_127341 ) ( not ( = ?auto_127331 ?auto_127340 ) ) ( OBJ-AT ?auto_127336 ?auto_127340 ) ( OBJ-AT ?auto_127334 ?auto_127340 ) ( IN-CITY ?auto_127337 ?auto_127341 ) ( not ( = ?auto_127331 ?auto_127337 ) ) ( OBJ-AT ?auto_127333 ?auto_127337 ) ( OBJ-AT ?auto_127332 ?auto_127337 ) ( IN-CITY ?auto_127338 ?auto_127341 ) ( not ( = ?auto_127331 ?auto_127338 ) ) ( OBJ-AT ?auto_127335 ?auto_127338 ) ( TRUCK-AT ?auto_127339 ?auto_127331 ) ( not ( = ?auto_127335 ?auto_127332 ) ) ( not ( = ?auto_127337 ?auto_127338 ) ) ( not ( = ?auto_127335 ?auto_127333 ) ) ( not ( = ?auto_127332 ?auto_127333 ) ) ( not ( = ?auto_127335 ?auto_127334 ) ) ( not ( = ?auto_127332 ?auto_127334 ) ) ( not ( = ?auto_127333 ?auto_127334 ) ) ( not ( = ?auto_127340 ?auto_127337 ) ) ( not ( = ?auto_127340 ?auto_127338 ) ) ( not ( = ?auto_127335 ?auto_127336 ) ) ( not ( = ?auto_127332 ?auto_127336 ) ) ( not ( = ?auto_127333 ?auto_127336 ) ) ( not ( = ?auto_127334 ?auto_127336 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_127335 ?auto_127332 ?auto_127333 ?auto_127336 ?auto_127334 ?auto_127331 )
      ( DELIVER-5PKG-VERIFY ?auto_127332 ?auto_127333 ?auto_127334 ?auto_127335 ?auto_127336 ?auto_127331 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_127379 - OBJ
      ?auto_127380 - OBJ
      ?auto_127381 - OBJ
      ?auto_127382 - OBJ
      ?auto_127383 - OBJ
      ?auto_127378 - LOCATION
    )
    :vars
    (
      ?auto_127387 - LOCATION
      ?auto_127388 - CITY
      ?auto_127384 - LOCATION
      ?auto_127385 - LOCATION
      ?auto_127386 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_127387 ?auto_127388 ) ( IN-CITY ?auto_127378 ?auto_127388 ) ( not ( = ?auto_127378 ?auto_127387 ) ) ( OBJ-AT ?auto_127382 ?auto_127387 ) ( OBJ-AT ?auto_127381 ?auto_127387 ) ( IN-CITY ?auto_127384 ?auto_127388 ) ( not ( = ?auto_127378 ?auto_127384 ) ) ( OBJ-AT ?auto_127380 ?auto_127384 ) ( OBJ-AT ?auto_127379 ?auto_127384 ) ( IN-CITY ?auto_127385 ?auto_127388 ) ( not ( = ?auto_127378 ?auto_127385 ) ) ( OBJ-AT ?auto_127383 ?auto_127385 ) ( TRUCK-AT ?auto_127386 ?auto_127378 ) ( not ( = ?auto_127383 ?auto_127379 ) ) ( not ( = ?auto_127384 ?auto_127385 ) ) ( not ( = ?auto_127383 ?auto_127380 ) ) ( not ( = ?auto_127379 ?auto_127380 ) ) ( not ( = ?auto_127383 ?auto_127381 ) ) ( not ( = ?auto_127379 ?auto_127381 ) ) ( not ( = ?auto_127380 ?auto_127381 ) ) ( not ( = ?auto_127387 ?auto_127384 ) ) ( not ( = ?auto_127387 ?auto_127385 ) ) ( not ( = ?auto_127383 ?auto_127382 ) ) ( not ( = ?auto_127379 ?auto_127382 ) ) ( not ( = ?auto_127380 ?auto_127382 ) ) ( not ( = ?auto_127381 ?auto_127382 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_127383 ?auto_127379 ?auto_127380 ?auto_127382 ?auto_127381 ?auto_127378 )
      ( DELIVER-5PKG-VERIFY ?auto_127379 ?auto_127380 ?auto_127381 ?auto_127382 ?auto_127383 ?auto_127378 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_127474 - OBJ
      ?auto_127475 - OBJ
      ?auto_127476 - OBJ
      ?auto_127477 - OBJ
      ?auto_127478 - OBJ
      ?auto_127473 - LOCATION
    )
    :vars
    (
      ?auto_127482 - LOCATION
      ?auto_127483 - CITY
      ?auto_127479 - LOCATION
      ?auto_127480 - LOCATION
      ?auto_127481 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_127482 ?auto_127483 ) ( IN-CITY ?auto_127473 ?auto_127483 ) ( not ( = ?auto_127473 ?auto_127482 ) ) ( OBJ-AT ?auto_127476 ?auto_127482 ) ( OBJ-AT ?auto_127478 ?auto_127482 ) ( IN-CITY ?auto_127479 ?auto_127483 ) ( not ( = ?auto_127473 ?auto_127479 ) ) ( OBJ-AT ?auto_127475 ?auto_127479 ) ( OBJ-AT ?auto_127474 ?auto_127479 ) ( IN-CITY ?auto_127480 ?auto_127483 ) ( not ( = ?auto_127473 ?auto_127480 ) ) ( OBJ-AT ?auto_127477 ?auto_127480 ) ( TRUCK-AT ?auto_127481 ?auto_127473 ) ( not ( = ?auto_127477 ?auto_127474 ) ) ( not ( = ?auto_127479 ?auto_127480 ) ) ( not ( = ?auto_127477 ?auto_127475 ) ) ( not ( = ?auto_127474 ?auto_127475 ) ) ( not ( = ?auto_127477 ?auto_127478 ) ) ( not ( = ?auto_127474 ?auto_127478 ) ) ( not ( = ?auto_127475 ?auto_127478 ) ) ( not ( = ?auto_127482 ?auto_127479 ) ) ( not ( = ?auto_127482 ?auto_127480 ) ) ( not ( = ?auto_127477 ?auto_127476 ) ) ( not ( = ?auto_127474 ?auto_127476 ) ) ( not ( = ?auto_127475 ?auto_127476 ) ) ( not ( = ?auto_127478 ?auto_127476 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_127477 ?auto_127474 ?auto_127475 ?auto_127476 ?auto_127478 ?auto_127473 )
      ( DELIVER-5PKG-VERIFY ?auto_127474 ?auto_127475 ?auto_127476 ?auto_127477 ?auto_127478 ?auto_127473 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_127623 - OBJ
      ?auto_127624 - OBJ
      ?auto_127625 - OBJ
      ?auto_127626 - OBJ
      ?auto_127627 - OBJ
      ?auto_127622 - LOCATION
    )
    :vars
    (
      ?auto_127631 - LOCATION
      ?auto_127632 - CITY
      ?auto_127628 - LOCATION
      ?auto_127629 - LOCATION
      ?auto_127630 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_127631 ?auto_127632 ) ( IN-CITY ?auto_127622 ?auto_127632 ) ( not ( = ?auto_127622 ?auto_127631 ) ) ( OBJ-AT ?auto_127625 ?auto_127631 ) ( OBJ-AT ?auto_127626 ?auto_127631 ) ( IN-CITY ?auto_127628 ?auto_127632 ) ( not ( = ?auto_127622 ?auto_127628 ) ) ( OBJ-AT ?auto_127624 ?auto_127628 ) ( OBJ-AT ?auto_127623 ?auto_127628 ) ( IN-CITY ?auto_127629 ?auto_127632 ) ( not ( = ?auto_127622 ?auto_127629 ) ) ( OBJ-AT ?auto_127627 ?auto_127629 ) ( TRUCK-AT ?auto_127630 ?auto_127622 ) ( not ( = ?auto_127627 ?auto_127623 ) ) ( not ( = ?auto_127628 ?auto_127629 ) ) ( not ( = ?auto_127627 ?auto_127624 ) ) ( not ( = ?auto_127623 ?auto_127624 ) ) ( not ( = ?auto_127627 ?auto_127626 ) ) ( not ( = ?auto_127623 ?auto_127626 ) ) ( not ( = ?auto_127624 ?auto_127626 ) ) ( not ( = ?auto_127631 ?auto_127628 ) ) ( not ( = ?auto_127631 ?auto_127629 ) ) ( not ( = ?auto_127627 ?auto_127625 ) ) ( not ( = ?auto_127623 ?auto_127625 ) ) ( not ( = ?auto_127624 ?auto_127625 ) ) ( not ( = ?auto_127626 ?auto_127625 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_127627 ?auto_127623 ?auto_127624 ?auto_127625 ?auto_127626 ?auto_127622 )
      ( DELIVER-5PKG-VERIFY ?auto_127623 ?auto_127624 ?auto_127625 ?auto_127626 ?auto_127627 ?auto_127622 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_127769 - OBJ
      ?auto_127770 - OBJ
      ?auto_127771 - OBJ
      ?auto_127772 - OBJ
      ?auto_127773 - OBJ
      ?auto_127768 - LOCATION
    )
    :vars
    (
      ?auto_127777 - LOCATION
      ?auto_127778 - CITY
      ?auto_127774 - LOCATION
      ?auto_127775 - LOCATION
      ?auto_127776 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_127777 ?auto_127778 ) ( IN-CITY ?auto_127768 ?auto_127778 ) ( not ( = ?auto_127768 ?auto_127777 ) ) ( OBJ-AT ?auto_127773 ?auto_127777 ) ( OBJ-AT ?auto_127770 ?auto_127777 ) ( IN-CITY ?auto_127774 ?auto_127778 ) ( not ( = ?auto_127768 ?auto_127774 ) ) ( OBJ-AT ?auto_127772 ?auto_127774 ) ( OBJ-AT ?auto_127769 ?auto_127774 ) ( IN-CITY ?auto_127775 ?auto_127778 ) ( not ( = ?auto_127768 ?auto_127775 ) ) ( OBJ-AT ?auto_127771 ?auto_127775 ) ( TRUCK-AT ?auto_127776 ?auto_127768 ) ( not ( = ?auto_127771 ?auto_127769 ) ) ( not ( = ?auto_127774 ?auto_127775 ) ) ( not ( = ?auto_127771 ?auto_127772 ) ) ( not ( = ?auto_127769 ?auto_127772 ) ) ( not ( = ?auto_127771 ?auto_127770 ) ) ( not ( = ?auto_127769 ?auto_127770 ) ) ( not ( = ?auto_127772 ?auto_127770 ) ) ( not ( = ?auto_127777 ?auto_127774 ) ) ( not ( = ?auto_127777 ?auto_127775 ) ) ( not ( = ?auto_127771 ?auto_127773 ) ) ( not ( = ?auto_127769 ?auto_127773 ) ) ( not ( = ?auto_127772 ?auto_127773 ) ) ( not ( = ?auto_127770 ?auto_127773 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_127771 ?auto_127769 ?auto_127772 ?auto_127773 ?auto_127770 ?auto_127768 )
      ( DELIVER-5PKG-VERIFY ?auto_127769 ?auto_127770 ?auto_127771 ?auto_127772 ?auto_127773 ?auto_127768 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_127816 - OBJ
      ?auto_127817 - OBJ
      ?auto_127818 - OBJ
      ?auto_127819 - OBJ
      ?auto_127820 - OBJ
      ?auto_127815 - LOCATION
    )
    :vars
    (
      ?auto_127824 - LOCATION
      ?auto_127825 - CITY
      ?auto_127821 - LOCATION
      ?auto_127822 - LOCATION
      ?auto_127823 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_127824 ?auto_127825 ) ( IN-CITY ?auto_127815 ?auto_127825 ) ( not ( = ?auto_127815 ?auto_127824 ) ) ( OBJ-AT ?auto_127819 ?auto_127824 ) ( OBJ-AT ?auto_127817 ?auto_127824 ) ( IN-CITY ?auto_127821 ?auto_127825 ) ( not ( = ?auto_127815 ?auto_127821 ) ) ( OBJ-AT ?auto_127820 ?auto_127821 ) ( OBJ-AT ?auto_127816 ?auto_127821 ) ( IN-CITY ?auto_127822 ?auto_127825 ) ( not ( = ?auto_127815 ?auto_127822 ) ) ( OBJ-AT ?auto_127818 ?auto_127822 ) ( TRUCK-AT ?auto_127823 ?auto_127815 ) ( not ( = ?auto_127818 ?auto_127816 ) ) ( not ( = ?auto_127821 ?auto_127822 ) ) ( not ( = ?auto_127818 ?auto_127820 ) ) ( not ( = ?auto_127816 ?auto_127820 ) ) ( not ( = ?auto_127818 ?auto_127817 ) ) ( not ( = ?auto_127816 ?auto_127817 ) ) ( not ( = ?auto_127820 ?auto_127817 ) ) ( not ( = ?auto_127824 ?auto_127821 ) ) ( not ( = ?auto_127824 ?auto_127822 ) ) ( not ( = ?auto_127818 ?auto_127819 ) ) ( not ( = ?auto_127816 ?auto_127819 ) ) ( not ( = ?auto_127820 ?auto_127819 ) ) ( not ( = ?auto_127817 ?auto_127819 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_127818 ?auto_127816 ?auto_127820 ?auto_127819 ?auto_127817 ?auto_127815 )
      ( DELIVER-5PKG-VERIFY ?auto_127816 ?auto_127817 ?auto_127818 ?auto_127819 ?auto_127820 ?auto_127815 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_127964 - OBJ
      ?auto_127965 - OBJ
      ?auto_127966 - OBJ
      ?auto_127967 - OBJ
      ?auto_127968 - OBJ
      ?auto_127963 - LOCATION
    )
    :vars
    (
      ?auto_127972 - LOCATION
      ?auto_127973 - CITY
      ?auto_127969 - LOCATION
      ?auto_127970 - LOCATION
      ?auto_127971 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_127972 ?auto_127973 ) ( IN-CITY ?auto_127963 ?auto_127973 ) ( not ( = ?auto_127963 ?auto_127972 ) ) ( OBJ-AT ?auto_127968 ?auto_127972 ) ( OBJ-AT ?auto_127965 ?auto_127972 ) ( IN-CITY ?auto_127969 ?auto_127973 ) ( not ( = ?auto_127963 ?auto_127969 ) ) ( OBJ-AT ?auto_127966 ?auto_127969 ) ( OBJ-AT ?auto_127964 ?auto_127969 ) ( IN-CITY ?auto_127970 ?auto_127973 ) ( not ( = ?auto_127963 ?auto_127970 ) ) ( OBJ-AT ?auto_127967 ?auto_127970 ) ( TRUCK-AT ?auto_127971 ?auto_127963 ) ( not ( = ?auto_127967 ?auto_127964 ) ) ( not ( = ?auto_127969 ?auto_127970 ) ) ( not ( = ?auto_127967 ?auto_127966 ) ) ( not ( = ?auto_127964 ?auto_127966 ) ) ( not ( = ?auto_127967 ?auto_127965 ) ) ( not ( = ?auto_127964 ?auto_127965 ) ) ( not ( = ?auto_127966 ?auto_127965 ) ) ( not ( = ?auto_127972 ?auto_127969 ) ) ( not ( = ?auto_127972 ?auto_127970 ) ) ( not ( = ?auto_127967 ?auto_127968 ) ) ( not ( = ?auto_127964 ?auto_127968 ) ) ( not ( = ?auto_127966 ?auto_127968 ) ) ( not ( = ?auto_127965 ?auto_127968 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_127967 ?auto_127964 ?auto_127966 ?auto_127968 ?auto_127965 ?auto_127963 )
      ( DELIVER-5PKG-VERIFY ?auto_127964 ?auto_127965 ?auto_127966 ?auto_127967 ?auto_127968 ?auto_127963 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_128011 - OBJ
      ?auto_128012 - OBJ
      ?auto_128013 - OBJ
      ?auto_128014 - OBJ
      ?auto_128015 - OBJ
      ?auto_128010 - LOCATION
    )
    :vars
    (
      ?auto_128019 - LOCATION
      ?auto_128020 - CITY
      ?auto_128016 - LOCATION
      ?auto_128017 - LOCATION
      ?auto_128018 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_128019 ?auto_128020 ) ( IN-CITY ?auto_128010 ?auto_128020 ) ( not ( = ?auto_128010 ?auto_128019 ) ) ( OBJ-AT ?auto_128014 ?auto_128019 ) ( OBJ-AT ?auto_128012 ?auto_128019 ) ( IN-CITY ?auto_128016 ?auto_128020 ) ( not ( = ?auto_128010 ?auto_128016 ) ) ( OBJ-AT ?auto_128013 ?auto_128016 ) ( OBJ-AT ?auto_128011 ?auto_128016 ) ( IN-CITY ?auto_128017 ?auto_128020 ) ( not ( = ?auto_128010 ?auto_128017 ) ) ( OBJ-AT ?auto_128015 ?auto_128017 ) ( TRUCK-AT ?auto_128018 ?auto_128010 ) ( not ( = ?auto_128015 ?auto_128011 ) ) ( not ( = ?auto_128016 ?auto_128017 ) ) ( not ( = ?auto_128015 ?auto_128013 ) ) ( not ( = ?auto_128011 ?auto_128013 ) ) ( not ( = ?auto_128015 ?auto_128012 ) ) ( not ( = ?auto_128011 ?auto_128012 ) ) ( not ( = ?auto_128013 ?auto_128012 ) ) ( not ( = ?auto_128019 ?auto_128016 ) ) ( not ( = ?auto_128019 ?auto_128017 ) ) ( not ( = ?auto_128015 ?auto_128014 ) ) ( not ( = ?auto_128011 ?auto_128014 ) ) ( not ( = ?auto_128013 ?auto_128014 ) ) ( not ( = ?auto_128012 ?auto_128014 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_128015 ?auto_128011 ?auto_128013 ?auto_128014 ?auto_128012 ?auto_128010 )
      ( DELIVER-5PKG-VERIFY ?auto_128011 ?auto_128012 ?auto_128013 ?auto_128014 ?auto_128015 ?auto_128010 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_128207 - OBJ
      ?auto_128208 - OBJ
      ?auto_128209 - OBJ
      ?auto_128210 - OBJ
      ?auto_128211 - OBJ
      ?auto_128206 - LOCATION
    )
    :vars
    (
      ?auto_128215 - LOCATION
      ?auto_128216 - CITY
      ?auto_128212 - LOCATION
      ?auto_128213 - LOCATION
      ?auto_128214 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_128215 ?auto_128216 ) ( IN-CITY ?auto_128206 ?auto_128216 ) ( not ( = ?auto_128206 ?auto_128215 ) ) ( OBJ-AT ?auto_128209 ?auto_128215 ) ( OBJ-AT ?auto_128208 ?auto_128215 ) ( IN-CITY ?auto_128212 ?auto_128216 ) ( not ( = ?auto_128206 ?auto_128212 ) ) ( OBJ-AT ?auto_128211 ?auto_128212 ) ( OBJ-AT ?auto_128207 ?auto_128212 ) ( IN-CITY ?auto_128213 ?auto_128216 ) ( not ( = ?auto_128206 ?auto_128213 ) ) ( OBJ-AT ?auto_128210 ?auto_128213 ) ( TRUCK-AT ?auto_128214 ?auto_128206 ) ( not ( = ?auto_128210 ?auto_128207 ) ) ( not ( = ?auto_128212 ?auto_128213 ) ) ( not ( = ?auto_128210 ?auto_128211 ) ) ( not ( = ?auto_128207 ?auto_128211 ) ) ( not ( = ?auto_128210 ?auto_128208 ) ) ( not ( = ?auto_128207 ?auto_128208 ) ) ( not ( = ?auto_128211 ?auto_128208 ) ) ( not ( = ?auto_128215 ?auto_128212 ) ) ( not ( = ?auto_128215 ?auto_128213 ) ) ( not ( = ?auto_128210 ?auto_128209 ) ) ( not ( = ?auto_128207 ?auto_128209 ) ) ( not ( = ?auto_128211 ?auto_128209 ) ) ( not ( = ?auto_128208 ?auto_128209 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_128210 ?auto_128207 ?auto_128211 ?auto_128209 ?auto_128208 ?auto_128206 )
      ( DELIVER-5PKG-VERIFY ?auto_128207 ?auto_128208 ?auto_128209 ?auto_128210 ?auto_128211 ?auto_128206 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_128305 - OBJ
      ?auto_128306 - OBJ
      ?auto_128307 - OBJ
      ?auto_128308 - OBJ
      ?auto_128309 - OBJ
      ?auto_128304 - LOCATION
    )
    :vars
    (
      ?auto_128313 - LOCATION
      ?auto_128314 - CITY
      ?auto_128310 - LOCATION
      ?auto_128311 - LOCATION
      ?auto_128312 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_128313 ?auto_128314 ) ( IN-CITY ?auto_128304 ?auto_128314 ) ( not ( = ?auto_128304 ?auto_128313 ) ) ( OBJ-AT ?auto_128307 ?auto_128313 ) ( OBJ-AT ?auto_128306 ?auto_128313 ) ( IN-CITY ?auto_128310 ?auto_128314 ) ( not ( = ?auto_128304 ?auto_128310 ) ) ( OBJ-AT ?auto_128308 ?auto_128310 ) ( OBJ-AT ?auto_128305 ?auto_128310 ) ( IN-CITY ?auto_128311 ?auto_128314 ) ( not ( = ?auto_128304 ?auto_128311 ) ) ( OBJ-AT ?auto_128309 ?auto_128311 ) ( TRUCK-AT ?auto_128312 ?auto_128304 ) ( not ( = ?auto_128309 ?auto_128305 ) ) ( not ( = ?auto_128310 ?auto_128311 ) ) ( not ( = ?auto_128309 ?auto_128308 ) ) ( not ( = ?auto_128305 ?auto_128308 ) ) ( not ( = ?auto_128309 ?auto_128306 ) ) ( not ( = ?auto_128305 ?auto_128306 ) ) ( not ( = ?auto_128308 ?auto_128306 ) ) ( not ( = ?auto_128313 ?auto_128310 ) ) ( not ( = ?auto_128313 ?auto_128311 ) ) ( not ( = ?auto_128309 ?auto_128307 ) ) ( not ( = ?auto_128305 ?auto_128307 ) ) ( not ( = ?auto_128308 ?auto_128307 ) ) ( not ( = ?auto_128306 ?auto_128307 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_128309 ?auto_128305 ?auto_128308 ?auto_128307 ?auto_128306 ?auto_128304 )
      ( DELIVER-5PKG-VERIFY ?auto_128305 ?auto_128306 ?auto_128307 ?auto_128308 ?auto_128309 ?auto_128304 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_128652 - OBJ
      ?auto_128653 - OBJ
      ?auto_128654 - OBJ
      ?auto_128655 - OBJ
      ?auto_128656 - OBJ
      ?auto_128651 - LOCATION
    )
    :vars
    (
      ?auto_128660 - LOCATION
      ?auto_128661 - CITY
      ?auto_128657 - LOCATION
      ?auto_128658 - LOCATION
      ?auto_128659 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_128660 ?auto_128661 ) ( IN-CITY ?auto_128651 ?auto_128661 ) ( not ( = ?auto_128651 ?auto_128660 ) ) ( OBJ-AT ?auto_128653 ?auto_128660 ) ( OBJ-AT ?auto_128656 ?auto_128660 ) ( IN-CITY ?auto_128657 ?auto_128661 ) ( not ( = ?auto_128651 ?auto_128657 ) ) ( OBJ-AT ?auto_128655 ?auto_128657 ) ( OBJ-AT ?auto_128652 ?auto_128657 ) ( IN-CITY ?auto_128658 ?auto_128661 ) ( not ( = ?auto_128651 ?auto_128658 ) ) ( OBJ-AT ?auto_128654 ?auto_128658 ) ( TRUCK-AT ?auto_128659 ?auto_128651 ) ( not ( = ?auto_128654 ?auto_128652 ) ) ( not ( = ?auto_128657 ?auto_128658 ) ) ( not ( = ?auto_128654 ?auto_128655 ) ) ( not ( = ?auto_128652 ?auto_128655 ) ) ( not ( = ?auto_128654 ?auto_128656 ) ) ( not ( = ?auto_128652 ?auto_128656 ) ) ( not ( = ?auto_128655 ?auto_128656 ) ) ( not ( = ?auto_128660 ?auto_128657 ) ) ( not ( = ?auto_128660 ?auto_128658 ) ) ( not ( = ?auto_128654 ?auto_128653 ) ) ( not ( = ?auto_128652 ?auto_128653 ) ) ( not ( = ?auto_128655 ?auto_128653 ) ) ( not ( = ?auto_128656 ?auto_128653 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_128654 ?auto_128652 ?auto_128655 ?auto_128653 ?auto_128656 ?auto_128651 )
      ( DELIVER-5PKG-VERIFY ?auto_128652 ?auto_128653 ?auto_128654 ?auto_128655 ?auto_128656 ?auto_128651 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_128699 - OBJ
      ?auto_128700 - OBJ
      ?auto_128701 - OBJ
      ?auto_128702 - OBJ
      ?auto_128703 - OBJ
      ?auto_128698 - LOCATION
    )
    :vars
    (
      ?auto_128707 - LOCATION
      ?auto_128708 - CITY
      ?auto_128704 - LOCATION
      ?auto_128705 - LOCATION
      ?auto_128706 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_128707 ?auto_128708 ) ( IN-CITY ?auto_128698 ?auto_128708 ) ( not ( = ?auto_128698 ?auto_128707 ) ) ( OBJ-AT ?auto_128700 ?auto_128707 ) ( OBJ-AT ?auto_128702 ?auto_128707 ) ( IN-CITY ?auto_128704 ?auto_128708 ) ( not ( = ?auto_128698 ?auto_128704 ) ) ( OBJ-AT ?auto_128703 ?auto_128704 ) ( OBJ-AT ?auto_128699 ?auto_128704 ) ( IN-CITY ?auto_128705 ?auto_128708 ) ( not ( = ?auto_128698 ?auto_128705 ) ) ( OBJ-AT ?auto_128701 ?auto_128705 ) ( TRUCK-AT ?auto_128706 ?auto_128698 ) ( not ( = ?auto_128701 ?auto_128699 ) ) ( not ( = ?auto_128704 ?auto_128705 ) ) ( not ( = ?auto_128701 ?auto_128703 ) ) ( not ( = ?auto_128699 ?auto_128703 ) ) ( not ( = ?auto_128701 ?auto_128702 ) ) ( not ( = ?auto_128699 ?auto_128702 ) ) ( not ( = ?auto_128703 ?auto_128702 ) ) ( not ( = ?auto_128707 ?auto_128704 ) ) ( not ( = ?auto_128707 ?auto_128705 ) ) ( not ( = ?auto_128701 ?auto_128700 ) ) ( not ( = ?auto_128699 ?auto_128700 ) ) ( not ( = ?auto_128703 ?auto_128700 ) ) ( not ( = ?auto_128702 ?auto_128700 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_128701 ?auto_128699 ?auto_128703 ?auto_128700 ?auto_128702 ?auto_128698 )
      ( DELIVER-5PKG-VERIFY ?auto_128699 ?auto_128700 ?auto_128701 ?auto_128702 ?auto_128703 ?auto_128698 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_129156 - OBJ
      ?auto_129157 - OBJ
      ?auto_129158 - OBJ
      ?auto_129159 - OBJ
      ?auto_129160 - OBJ
      ?auto_129155 - LOCATION
    )
    :vars
    (
      ?auto_129164 - LOCATION
      ?auto_129165 - CITY
      ?auto_129161 - LOCATION
      ?auto_129162 - LOCATION
      ?auto_129163 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_129164 ?auto_129165 ) ( IN-CITY ?auto_129155 ?auto_129165 ) ( not ( = ?auto_129155 ?auto_129164 ) ) ( OBJ-AT ?auto_129157 ?auto_129164 ) ( OBJ-AT ?auto_129160 ?auto_129164 ) ( IN-CITY ?auto_129161 ?auto_129165 ) ( not ( = ?auto_129155 ?auto_129161 ) ) ( OBJ-AT ?auto_129158 ?auto_129161 ) ( OBJ-AT ?auto_129156 ?auto_129161 ) ( IN-CITY ?auto_129162 ?auto_129165 ) ( not ( = ?auto_129155 ?auto_129162 ) ) ( OBJ-AT ?auto_129159 ?auto_129162 ) ( TRUCK-AT ?auto_129163 ?auto_129155 ) ( not ( = ?auto_129159 ?auto_129156 ) ) ( not ( = ?auto_129161 ?auto_129162 ) ) ( not ( = ?auto_129159 ?auto_129158 ) ) ( not ( = ?auto_129156 ?auto_129158 ) ) ( not ( = ?auto_129159 ?auto_129160 ) ) ( not ( = ?auto_129156 ?auto_129160 ) ) ( not ( = ?auto_129158 ?auto_129160 ) ) ( not ( = ?auto_129164 ?auto_129161 ) ) ( not ( = ?auto_129164 ?auto_129162 ) ) ( not ( = ?auto_129159 ?auto_129157 ) ) ( not ( = ?auto_129156 ?auto_129157 ) ) ( not ( = ?auto_129158 ?auto_129157 ) ) ( not ( = ?auto_129160 ?auto_129157 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_129159 ?auto_129156 ?auto_129158 ?auto_129157 ?auto_129160 ?auto_129155 )
      ( DELIVER-5PKG-VERIFY ?auto_129156 ?auto_129157 ?auto_129158 ?auto_129159 ?auto_129160 ?auto_129155 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_129305 - OBJ
      ?auto_129306 - OBJ
      ?auto_129307 - OBJ
      ?auto_129308 - OBJ
      ?auto_129309 - OBJ
      ?auto_129304 - LOCATION
    )
    :vars
    (
      ?auto_129313 - LOCATION
      ?auto_129314 - CITY
      ?auto_129310 - LOCATION
      ?auto_129311 - LOCATION
      ?auto_129312 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_129313 ?auto_129314 ) ( IN-CITY ?auto_129304 ?auto_129314 ) ( not ( = ?auto_129304 ?auto_129313 ) ) ( OBJ-AT ?auto_129306 ?auto_129313 ) ( OBJ-AT ?auto_129308 ?auto_129313 ) ( IN-CITY ?auto_129310 ?auto_129314 ) ( not ( = ?auto_129304 ?auto_129310 ) ) ( OBJ-AT ?auto_129307 ?auto_129310 ) ( OBJ-AT ?auto_129305 ?auto_129310 ) ( IN-CITY ?auto_129311 ?auto_129314 ) ( not ( = ?auto_129304 ?auto_129311 ) ) ( OBJ-AT ?auto_129309 ?auto_129311 ) ( TRUCK-AT ?auto_129312 ?auto_129304 ) ( not ( = ?auto_129309 ?auto_129305 ) ) ( not ( = ?auto_129310 ?auto_129311 ) ) ( not ( = ?auto_129309 ?auto_129307 ) ) ( not ( = ?auto_129305 ?auto_129307 ) ) ( not ( = ?auto_129309 ?auto_129308 ) ) ( not ( = ?auto_129305 ?auto_129308 ) ) ( not ( = ?auto_129307 ?auto_129308 ) ) ( not ( = ?auto_129313 ?auto_129310 ) ) ( not ( = ?auto_129313 ?auto_129311 ) ) ( not ( = ?auto_129309 ?auto_129306 ) ) ( not ( = ?auto_129305 ?auto_129306 ) ) ( not ( = ?auto_129307 ?auto_129306 ) ) ( not ( = ?auto_129308 ?auto_129306 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_129309 ?auto_129305 ?auto_129307 ?auto_129306 ?auto_129308 ?auto_129304 )
      ( DELIVER-5PKG-VERIFY ?auto_129305 ?auto_129306 ?auto_129307 ?auto_129308 ?auto_129309 ?auto_129304 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_129451 - OBJ
      ?auto_129452 - OBJ
      ?auto_129453 - OBJ
      ?auto_129454 - OBJ
      ?auto_129455 - OBJ
      ?auto_129450 - LOCATION
    )
    :vars
    (
      ?auto_129459 - LOCATION
      ?auto_129460 - CITY
      ?auto_129456 - LOCATION
      ?auto_129457 - LOCATION
      ?auto_129458 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_129459 ?auto_129460 ) ( IN-CITY ?auto_129450 ?auto_129460 ) ( not ( = ?auto_129450 ?auto_129459 ) ) ( OBJ-AT ?auto_129452 ?auto_129459 ) ( OBJ-AT ?auto_129453 ?auto_129459 ) ( IN-CITY ?auto_129456 ?auto_129460 ) ( not ( = ?auto_129450 ?auto_129456 ) ) ( OBJ-AT ?auto_129455 ?auto_129456 ) ( OBJ-AT ?auto_129451 ?auto_129456 ) ( IN-CITY ?auto_129457 ?auto_129460 ) ( not ( = ?auto_129450 ?auto_129457 ) ) ( OBJ-AT ?auto_129454 ?auto_129457 ) ( TRUCK-AT ?auto_129458 ?auto_129450 ) ( not ( = ?auto_129454 ?auto_129451 ) ) ( not ( = ?auto_129456 ?auto_129457 ) ) ( not ( = ?auto_129454 ?auto_129455 ) ) ( not ( = ?auto_129451 ?auto_129455 ) ) ( not ( = ?auto_129454 ?auto_129453 ) ) ( not ( = ?auto_129451 ?auto_129453 ) ) ( not ( = ?auto_129455 ?auto_129453 ) ) ( not ( = ?auto_129459 ?auto_129456 ) ) ( not ( = ?auto_129459 ?auto_129457 ) ) ( not ( = ?auto_129454 ?auto_129452 ) ) ( not ( = ?auto_129451 ?auto_129452 ) ) ( not ( = ?auto_129455 ?auto_129452 ) ) ( not ( = ?auto_129453 ?auto_129452 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_129454 ?auto_129451 ?auto_129455 ?auto_129452 ?auto_129453 ?auto_129450 )
      ( DELIVER-5PKG-VERIFY ?auto_129451 ?auto_129452 ?auto_129453 ?auto_129454 ?auto_129455 ?auto_129450 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_129549 - OBJ
      ?auto_129550 - OBJ
      ?auto_129551 - OBJ
      ?auto_129552 - OBJ
      ?auto_129553 - OBJ
      ?auto_129548 - LOCATION
    )
    :vars
    (
      ?auto_129557 - LOCATION
      ?auto_129558 - CITY
      ?auto_129554 - LOCATION
      ?auto_129555 - LOCATION
      ?auto_129556 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_129557 ?auto_129558 ) ( IN-CITY ?auto_129548 ?auto_129558 ) ( not ( = ?auto_129548 ?auto_129557 ) ) ( OBJ-AT ?auto_129550 ?auto_129557 ) ( OBJ-AT ?auto_129551 ?auto_129557 ) ( IN-CITY ?auto_129554 ?auto_129558 ) ( not ( = ?auto_129548 ?auto_129554 ) ) ( OBJ-AT ?auto_129552 ?auto_129554 ) ( OBJ-AT ?auto_129549 ?auto_129554 ) ( IN-CITY ?auto_129555 ?auto_129558 ) ( not ( = ?auto_129548 ?auto_129555 ) ) ( OBJ-AT ?auto_129553 ?auto_129555 ) ( TRUCK-AT ?auto_129556 ?auto_129548 ) ( not ( = ?auto_129553 ?auto_129549 ) ) ( not ( = ?auto_129554 ?auto_129555 ) ) ( not ( = ?auto_129553 ?auto_129552 ) ) ( not ( = ?auto_129549 ?auto_129552 ) ) ( not ( = ?auto_129553 ?auto_129551 ) ) ( not ( = ?auto_129549 ?auto_129551 ) ) ( not ( = ?auto_129552 ?auto_129551 ) ) ( not ( = ?auto_129557 ?auto_129554 ) ) ( not ( = ?auto_129557 ?auto_129555 ) ) ( not ( = ?auto_129553 ?auto_129550 ) ) ( not ( = ?auto_129549 ?auto_129550 ) ) ( not ( = ?auto_129552 ?auto_129550 ) ) ( not ( = ?auto_129551 ?auto_129550 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_129553 ?auto_129549 ?auto_129552 ?auto_129550 ?auto_129551 ?auto_129548 )
      ( DELIVER-5PKG-VERIFY ?auto_129549 ?auto_129550 ?auto_129551 ?auto_129552 ?auto_129553 ?auto_129548 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_130206 - OBJ
      ?auto_130207 - OBJ
      ?auto_130208 - OBJ
      ?auto_130209 - OBJ
      ?auto_130210 - OBJ
      ?auto_130205 - LOCATION
    )
    :vars
    (
      ?auto_130214 - LOCATION
      ?auto_130215 - CITY
      ?auto_130211 - LOCATION
      ?auto_130212 - LOCATION
      ?auto_130213 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_130214 ?auto_130215 ) ( IN-CITY ?auto_130205 ?auto_130215 ) ( not ( = ?auto_130205 ?auto_130214 ) ) ( OBJ-AT ?auto_130210 ?auto_130214 ) ( OBJ-AT ?auto_130209 ?auto_130214 ) ( IN-CITY ?auto_130211 ?auto_130215 ) ( not ( = ?auto_130205 ?auto_130211 ) ) ( OBJ-AT ?auto_130206 ?auto_130211 ) ( OBJ-AT ?auto_130208 ?auto_130211 ) ( IN-CITY ?auto_130212 ?auto_130215 ) ( not ( = ?auto_130205 ?auto_130212 ) ) ( OBJ-AT ?auto_130207 ?auto_130212 ) ( TRUCK-AT ?auto_130213 ?auto_130205 ) ( not ( = ?auto_130207 ?auto_130208 ) ) ( not ( = ?auto_130211 ?auto_130212 ) ) ( not ( = ?auto_130207 ?auto_130206 ) ) ( not ( = ?auto_130208 ?auto_130206 ) ) ( not ( = ?auto_130207 ?auto_130209 ) ) ( not ( = ?auto_130208 ?auto_130209 ) ) ( not ( = ?auto_130206 ?auto_130209 ) ) ( not ( = ?auto_130214 ?auto_130211 ) ) ( not ( = ?auto_130214 ?auto_130212 ) ) ( not ( = ?auto_130207 ?auto_130210 ) ) ( not ( = ?auto_130208 ?auto_130210 ) ) ( not ( = ?auto_130206 ?auto_130210 ) ) ( not ( = ?auto_130209 ?auto_130210 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_130207 ?auto_130208 ?auto_130206 ?auto_130210 ?auto_130209 ?auto_130205 )
      ( DELIVER-5PKG-VERIFY ?auto_130206 ?auto_130207 ?auto_130208 ?auto_130209 ?auto_130210 ?auto_130205 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_130253 - OBJ
      ?auto_130254 - OBJ
      ?auto_130255 - OBJ
      ?auto_130256 - OBJ
      ?auto_130257 - OBJ
      ?auto_130252 - LOCATION
    )
    :vars
    (
      ?auto_130261 - LOCATION
      ?auto_130262 - CITY
      ?auto_130258 - LOCATION
      ?auto_130259 - LOCATION
      ?auto_130260 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_130261 ?auto_130262 ) ( IN-CITY ?auto_130252 ?auto_130262 ) ( not ( = ?auto_130252 ?auto_130261 ) ) ( OBJ-AT ?auto_130256 ?auto_130261 ) ( OBJ-AT ?auto_130257 ?auto_130261 ) ( IN-CITY ?auto_130258 ?auto_130262 ) ( not ( = ?auto_130252 ?auto_130258 ) ) ( OBJ-AT ?auto_130253 ?auto_130258 ) ( OBJ-AT ?auto_130255 ?auto_130258 ) ( IN-CITY ?auto_130259 ?auto_130262 ) ( not ( = ?auto_130252 ?auto_130259 ) ) ( OBJ-AT ?auto_130254 ?auto_130259 ) ( TRUCK-AT ?auto_130260 ?auto_130252 ) ( not ( = ?auto_130254 ?auto_130255 ) ) ( not ( = ?auto_130258 ?auto_130259 ) ) ( not ( = ?auto_130254 ?auto_130253 ) ) ( not ( = ?auto_130255 ?auto_130253 ) ) ( not ( = ?auto_130254 ?auto_130257 ) ) ( not ( = ?auto_130255 ?auto_130257 ) ) ( not ( = ?auto_130253 ?auto_130257 ) ) ( not ( = ?auto_130261 ?auto_130258 ) ) ( not ( = ?auto_130261 ?auto_130259 ) ) ( not ( = ?auto_130254 ?auto_130256 ) ) ( not ( = ?auto_130255 ?auto_130256 ) ) ( not ( = ?auto_130253 ?auto_130256 ) ) ( not ( = ?auto_130257 ?auto_130256 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_130254 ?auto_130255 ?auto_130253 ?auto_130256 ?auto_130257 ?auto_130252 )
      ( DELIVER-5PKG-VERIFY ?auto_130253 ?auto_130254 ?auto_130255 ?auto_130256 ?auto_130257 ?auto_130252 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_130401 - OBJ
      ?auto_130402 - OBJ
      ?auto_130403 - OBJ
      ?auto_130404 - OBJ
      ?auto_130405 - OBJ
      ?auto_130400 - LOCATION
    )
    :vars
    (
      ?auto_130409 - LOCATION
      ?auto_130410 - CITY
      ?auto_130406 - LOCATION
      ?auto_130407 - LOCATION
      ?auto_130408 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_130409 ?auto_130410 ) ( IN-CITY ?auto_130400 ?auto_130410 ) ( not ( = ?auto_130400 ?auto_130409 ) ) ( OBJ-AT ?auto_130405 ?auto_130409 ) ( OBJ-AT ?auto_130403 ?auto_130409 ) ( IN-CITY ?auto_130406 ?auto_130410 ) ( not ( = ?auto_130400 ?auto_130406 ) ) ( OBJ-AT ?auto_130401 ?auto_130406 ) ( OBJ-AT ?auto_130404 ?auto_130406 ) ( IN-CITY ?auto_130407 ?auto_130410 ) ( not ( = ?auto_130400 ?auto_130407 ) ) ( OBJ-AT ?auto_130402 ?auto_130407 ) ( TRUCK-AT ?auto_130408 ?auto_130400 ) ( not ( = ?auto_130402 ?auto_130404 ) ) ( not ( = ?auto_130406 ?auto_130407 ) ) ( not ( = ?auto_130402 ?auto_130401 ) ) ( not ( = ?auto_130404 ?auto_130401 ) ) ( not ( = ?auto_130402 ?auto_130403 ) ) ( not ( = ?auto_130404 ?auto_130403 ) ) ( not ( = ?auto_130401 ?auto_130403 ) ) ( not ( = ?auto_130409 ?auto_130406 ) ) ( not ( = ?auto_130409 ?auto_130407 ) ) ( not ( = ?auto_130402 ?auto_130405 ) ) ( not ( = ?auto_130404 ?auto_130405 ) ) ( not ( = ?auto_130401 ?auto_130405 ) ) ( not ( = ?auto_130403 ?auto_130405 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_130402 ?auto_130404 ?auto_130401 ?auto_130405 ?auto_130403 ?auto_130400 )
      ( DELIVER-5PKG-VERIFY ?auto_130401 ?auto_130402 ?auto_130403 ?auto_130404 ?auto_130405 ?auto_130400 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_130448 - OBJ
      ?auto_130449 - OBJ
      ?auto_130450 - OBJ
      ?auto_130451 - OBJ
      ?auto_130452 - OBJ
      ?auto_130447 - LOCATION
    )
    :vars
    (
      ?auto_130456 - LOCATION
      ?auto_130457 - CITY
      ?auto_130453 - LOCATION
      ?auto_130454 - LOCATION
      ?auto_130455 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_130456 ?auto_130457 ) ( IN-CITY ?auto_130447 ?auto_130457 ) ( not ( = ?auto_130447 ?auto_130456 ) ) ( OBJ-AT ?auto_130451 ?auto_130456 ) ( OBJ-AT ?auto_130450 ?auto_130456 ) ( IN-CITY ?auto_130453 ?auto_130457 ) ( not ( = ?auto_130447 ?auto_130453 ) ) ( OBJ-AT ?auto_130448 ?auto_130453 ) ( OBJ-AT ?auto_130452 ?auto_130453 ) ( IN-CITY ?auto_130454 ?auto_130457 ) ( not ( = ?auto_130447 ?auto_130454 ) ) ( OBJ-AT ?auto_130449 ?auto_130454 ) ( TRUCK-AT ?auto_130455 ?auto_130447 ) ( not ( = ?auto_130449 ?auto_130452 ) ) ( not ( = ?auto_130453 ?auto_130454 ) ) ( not ( = ?auto_130449 ?auto_130448 ) ) ( not ( = ?auto_130452 ?auto_130448 ) ) ( not ( = ?auto_130449 ?auto_130450 ) ) ( not ( = ?auto_130452 ?auto_130450 ) ) ( not ( = ?auto_130448 ?auto_130450 ) ) ( not ( = ?auto_130456 ?auto_130453 ) ) ( not ( = ?auto_130456 ?auto_130454 ) ) ( not ( = ?auto_130449 ?auto_130451 ) ) ( not ( = ?auto_130452 ?auto_130451 ) ) ( not ( = ?auto_130448 ?auto_130451 ) ) ( not ( = ?auto_130450 ?auto_130451 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_130449 ?auto_130452 ?auto_130448 ?auto_130451 ?auto_130450 ?auto_130447 )
      ( DELIVER-5PKG-VERIFY ?auto_130448 ?auto_130449 ?auto_130450 ?auto_130451 ?auto_130452 ?auto_130447 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_130594 - OBJ
      ?auto_130595 - OBJ
      ?auto_130596 - OBJ
      ?auto_130597 - OBJ
      ?auto_130598 - OBJ
      ?auto_130593 - LOCATION
    )
    :vars
    (
      ?auto_130602 - LOCATION
      ?auto_130603 - CITY
      ?auto_130599 - LOCATION
      ?auto_130600 - LOCATION
      ?auto_130601 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_130602 ?auto_130603 ) ( IN-CITY ?auto_130593 ?auto_130603 ) ( not ( = ?auto_130593 ?auto_130602 ) ) ( OBJ-AT ?auto_130596 ?auto_130602 ) ( OBJ-AT ?auto_130598 ?auto_130602 ) ( IN-CITY ?auto_130599 ?auto_130603 ) ( not ( = ?auto_130593 ?auto_130599 ) ) ( OBJ-AT ?auto_130594 ?auto_130599 ) ( OBJ-AT ?auto_130597 ?auto_130599 ) ( IN-CITY ?auto_130600 ?auto_130603 ) ( not ( = ?auto_130593 ?auto_130600 ) ) ( OBJ-AT ?auto_130595 ?auto_130600 ) ( TRUCK-AT ?auto_130601 ?auto_130593 ) ( not ( = ?auto_130595 ?auto_130597 ) ) ( not ( = ?auto_130599 ?auto_130600 ) ) ( not ( = ?auto_130595 ?auto_130594 ) ) ( not ( = ?auto_130597 ?auto_130594 ) ) ( not ( = ?auto_130595 ?auto_130598 ) ) ( not ( = ?auto_130597 ?auto_130598 ) ) ( not ( = ?auto_130594 ?auto_130598 ) ) ( not ( = ?auto_130602 ?auto_130599 ) ) ( not ( = ?auto_130602 ?auto_130600 ) ) ( not ( = ?auto_130595 ?auto_130596 ) ) ( not ( = ?auto_130597 ?auto_130596 ) ) ( not ( = ?auto_130594 ?auto_130596 ) ) ( not ( = ?auto_130598 ?auto_130596 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_130595 ?auto_130597 ?auto_130594 ?auto_130596 ?auto_130598 ?auto_130593 )
      ( DELIVER-5PKG-VERIFY ?auto_130594 ?auto_130595 ?auto_130596 ?auto_130597 ?auto_130598 ?auto_130593 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_130692 - OBJ
      ?auto_130693 - OBJ
      ?auto_130694 - OBJ
      ?auto_130695 - OBJ
      ?auto_130696 - OBJ
      ?auto_130691 - LOCATION
    )
    :vars
    (
      ?auto_130700 - LOCATION
      ?auto_130701 - CITY
      ?auto_130697 - LOCATION
      ?auto_130698 - LOCATION
      ?auto_130699 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_130700 ?auto_130701 ) ( IN-CITY ?auto_130691 ?auto_130701 ) ( not ( = ?auto_130691 ?auto_130700 ) ) ( OBJ-AT ?auto_130694 ?auto_130700 ) ( OBJ-AT ?auto_130695 ?auto_130700 ) ( IN-CITY ?auto_130697 ?auto_130701 ) ( not ( = ?auto_130691 ?auto_130697 ) ) ( OBJ-AT ?auto_130692 ?auto_130697 ) ( OBJ-AT ?auto_130696 ?auto_130697 ) ( IN-CITY ?auto_130698 ?auto_130701 ) ( not ( = ?auto_130691 ?auto_130698 ) ) ( OBJ-AT ?auto_130693 ?auto_130698 ) ( TRUCK-AT ?auto_130699 ?auto_130691 ) ( not ( = ?auto_130693 ?auto_130696 ) ) ( not ( = ?auto_130697 ?auto_130698 ) ) ( not ( = ?auto_130693 ?auto_130692 ) ) ( not ( = ?auto_130696 ?auto_130692 ) ) ( not ( = ?auto_130693 ?auto_130695 ) ) ( not ( = ?auto_130696 ?auto_130695 ) ) ( not ( = ?auto_130692 ?auto_130695 ) ) ( not ( = ?auto_130700 ?auto_130697 ) ) ( not ( = ?auto_130700 ?auto_130698 ) ) ( not ( = ?auto_130693 ?auto_130694 ) ) ( not ( = ?auto_130696 ?auto_130694 ) ) ( not ( = ?auto_130692 ?auto_130694 ) ) ( not ( = ?auto_130695 ?auto_130694 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_130693 ?auto_130696 ?auto_130692 ?auto_130694 ?auto_130695 ?auto_130691 )
      ( DELIVER-5PKG-VERIFY ?auto_130692 ?auto_130693 ?auto_130694 ?auto_130695 ?auto_130696 ?auto_130691 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_130838 - OBJ
      ?auto_130839 - OBJ
      ?auto_130840 - OBJ
      ?auto_130841 - OBJ
      ?auto_130842 - OBJ
      ?auto_130837 - LOCATION
    )
    :vars
    (
      ?auto_130846 - LOCATION
      ?auto_130847 - CITY
      ?auto_130843 - LOCATION
      ?auto_130844 - LOCATION
      ?auto_130845 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_130846 ?auto_130847 ) ( IN-CITY ?auto_130837 ?auto_130847 ) ( not ( = ?auto_130837 ?auto_130846 ) ) ( OBJ-AT ?auto_130842 ?auto_130846 ) ( OBJ-AT ?auto_130841 ?auto_130846 ) ( IN-CITY ?auto_130843 ?auto_130847 ) ( not ( = ?auto_130837 ?auto_130843 ) ) ( OBJ-AT ?auto_130838 ?auto_130843 ) ( OBJ-AT ?auto_130839 ?auto_130843 ) ( IN-CITY ?auto_130844 ?auto_130847 ) ( not ( = ?auto_130837 ?auto_130844 ) ) ( OBJ-AT ?auto_130840 ?auto_130844 ) ( TRUCK-AT ?auto_130845 ?auto_130837 ) ( not ( = ?auto_130840 ?auto_130839 ) ) ( not ( = ?auto_130843 ?auto_130844 ) ) ( not ( = ?auto_130840 ?auto_130838 ) ) ( not ( = ?auto_130839 ?auto_130838 ) ) ( not ( = ?auto_130840 ?auto_130841 ) ) ( not ( = ?auto_130839 ?auto_130841 ) ) ( not ( = ?auto_130838 ?auto_130841 ) ) ( not ( = ?auto_130846 ?auto_130843 ) ) ( not ( = ?auto_130846 ?auto_130844 ) ) ( not ( = ?auto_130840 ?auto_130842 ) ) ( not ( = ?auto_130839 ?auto_130842 ) ) ( not ( = ?auto_130838 ?auto_130842 ) ) ( not ( = ?auto_130841 ?auto_130842 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_130840 ?auto_130839 ?auto_130838 ?auto_130842 ?auto_130841 ?auto_130837 )
      ( DELIVER-5PKG-VERIFY ?auto_130838 ?auto_130839 ?auto_130840 ?auto_130841 ?auto_130842 ?auto_130837 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_130885 - OBJ
      ?auto_130886 - OBJ
      ?auto_130887 - OBJ
      ?auto_130888 - OBJ
      ?auto_130889 - OBJ
      ?auto_130884 - LOCATION
    )
    :vars
    (
      ?auto_130893 - LOCATION
      ?auto_130894 - CITY
      ?auto_130890 - LOCATION
      ?auto_130891 - LOCATION
      ?auto_130892 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_130893 ?auto_130894 ) ( IN-CITY ?auto_130884 ?auto_130894 ) ( not ( = ?auto_130884 ?auto_130893 ) ) ( OBJ-AT ?auto_130888 ?auto_130893 ) ( OBJ-AT ?auto_130889 ?auto_130893 ) ( IN-CITY ?auto_130890 ?auto_130894 ) ( not ( = ?auto_130884 ?auto_130890 ) ) ( OBJ-AT ?auto_130885 ?auto_130890 ) ( OBJ-AT ?auto_130886 ?auto_130890 ) ( IN-CITY ?auto_130891 ?auto_130894 ) ( not ( = ?auto_130884 ?auto_130891 ) ) ( OBJ-AT ?auto_130887 ?auto_130891 ) ( TRUCK-AT ?auto_130892 ?auto_130884 ) ( not ( = ?auto_130887 ?auto_130886 ) ) ( not ( = ?auto_130890 ?auto_130891 ) ) ( not ( = ?auto_130887 ?auto_130885 ) ) ( not ( = ?auto_130886 ?auto_130885 ) ) ( not ( = ?auto_130887 ?auto_130889 ) ) ( not ( = ?auto_130886 ?auto_130889 ) ) ( not ( = ?auto_130885 ?auto_130889 ) ) ( not ( = ?auto_130893 ?auto_130890 ) ) ( not ( = ?auto_130893 ?auto_130891 ) ) ( not ( = ?auto_130887 ?auto_130888 ) ) ( not ( = ?auto_130886 ?auto_130888 ) ) ( not ( = ?auto_130885 ?auto_130888 ) ) ( not ( = ?auto_130889 ?auto_130888 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_130887 ?auto_130886 ?auto_130885 ?auto_130888 ?auto_130889 ?auto_130884 )
      ( DELIVER-5PKG-VERIFY ?auto_130885 ?auto_130886 ?auto_130887 ?auto_130888 ?auto_130889 ?auto_130884 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_131134 - OBJ
      ?auto_131135 - OBJ
      ?auto_131136 - OBJ
      ?auto_131137 - OBJ
      ?auto_131138 - OBJ
      ?auto_131133 - LOCATION
    )
    :vars
    (
      ?auto_131142 - LOCATION
      ?auto_131143 - CITY
      ?auto_131139 - LOCATION
      ?auto_131140 - LOCATION
      ?auto_131141 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_131142 ?auto_131143 ) ( IN-CITY ?auto_131133 ?auto_131143 ) ( not ( = ?auto_131133 ?auto_131142 ) ) ( OBJ-AT ?auto_131138 ?auto_131142 ) ( OBJ-AT ?auto_131136 ?auto_131142 ) ( IN-CITY ?auto_131139 ?auto_131143 ) ( not ( = ?auto_131133 ?auto_131139 ) ) ( OBJ-AT ?auto_131134 ?auto_131139 ) ( OBJ-AT ?auto_131135 ?auto_131139 ) ( IN-CITY ?auto_131140 ?auto_131143 ) ( not ( = ?auto_131133 ?auto_131140 ) ) ( OBJ-AT ?auto_131137 ?auto_131140 ) ( TRUCK-AT ?auto_131141 ?auto_131133 ) ( not ( = ?auto_131137 ?auto_131135 ) ) ( not ( = ?auto_131139 ?auto_131140 ) ) ( not ( = ?auto_131137 ?auto_131134 ) ) ( not ( = ?auto_131135 ?auto_131134 ) ) ( not ( = ?auto_131137 ?auto_131136 ) ) ( not ( = ?auto_131135 ?auto_131136 ) ) ( not ( = ?auto_131134 ?auto_131136 ) ) ( not ( = ?auto_131142 ?auto_131139 ) ) ( not ( = ?auto_131142 ?auto_131140 ) ) ( not ( = ?auto_131137 ?auto_131138 ) ) ( not ( = ?auto_131135 ?auto_131138 ) ) ( not ( = ?auto_131134 ?auto_131138 ) ) ( not ( = ?auto_131136 ?auto_131138 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_131137 ?auto_131135 ?auto_131134 ?auto_131138 ?auto_131136 ?auto_131133 )
      ( DELIVER-5PKG-VERIFY ?auto_131134 ?auto_131135 ?auto_131136 ?auto_131137 ?auto_131138 ?auto_131133 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_131181 - OBJ
      ?auto_131182 - OBJ
      ?auto_131183 - OBJ
      ?auto_131184 - OBJ
      ?auto_131185 - OBJ
      ?auto_131180 - LOCATION
    )
    :vars
    (
      ?auto_131189 - LOCATION
      ?auto_131190 - CITY
      ?auto_131186 - LOCATION
      ?auto_131187 - LOCATION
      ?auto_131188 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_131189 ?auto_131190 ) ( IN-CITY ?auto_131180 ?auto_131190 ) ( not ( = ?auto_131180 ?auto_131189 ) ) ( OBJ-AT ?auto_131184 ?auto_131189 ) ( OBJ-AT ?auto_131183 ?auto_131189 ) ( IN-CITY ?auto_131186 ?auto_131190 ) ( not ( = ?auto_131180 ?auto_131186 ) ) ( OBJ-AT ?auto_131181 ?auto_131186 ) ( OBJ-AT ?auto_131182 ?auto_131186 ) ( IN-CITY ?auto_131187 ?auto_131190 ) ( not ( = ?auto_131180 ?auto_131187 ) ) ( OBJ-AT ?auto_131185 ?auto_131187 ) ( TRUCK-AT ?auto_131188 ?auto_131180 ) ( not ( = ?auto_131185 ?auto_131182 ) ) ( not ( = ?auto_131186 ?auto_131187 ) ) ( not ( = ?auto_131185 ?auto_131181 ) ) ( not ( = ?auto_131182 ?auto_131181 ) ) ( not ( = ?auto_131185 ?auto_131183 ) ) ( not ( = ?auto_131182 ?auto_131183 ) ) ( not ( = ?auto_131181 ?auto_131183 ) ) ( not ( = ?auto_131189 ?auto_131186 ) ) ( not ( = ?auto_131189 ?auto_131187 ) ) ( not ( = ?auto_131185 ?auto_131184 ) ) ( not ( = ?auto_131182 ?auto_131184 ) ) ( not ( = ?auto_131181 ?auto_131184 ) ) ( not ( = ?auto_131183 ?auto_131184 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_131185 ?auto_131182 ?auto_131181 ?auto_131184 ?auto_131183 ?auto_131180 )
      ( DELIVER-5PKG-VERIFY ?auto_131181 ?auto_131182 ?auto_131183 ?auto_131184 ?auto_131185 ?auto_131180 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_131276 - OBJ
      ?auto_131277 - OBJ
      ?auto_131278 - OBJ
      ?auto_131279 - OBJ
      ?auto_131280 - OBJ
      ?auto_131275 - LOCATION
    )
    :vars
    (
      ?auto_131284 - LOCATION
      ?auto_131285 - CITY
      ?auto_131281 - LOCATION
      ?auto_131282 - LOCATION
      ?auto_131283 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_131284 ?auto_131285 ) ( IN-CITY ?auto_131275 ?auto_131285 ) ( not ( = ?auto_131275 ?auto_131284 ) ) ( OBJ-AT ?auto_131278 ?auto_131284 ) ( OBJ-AT ?auto_131280 ?auto_131284 ) ( IN-CITY ?auto_131281 ?auto_131285 ) ( not ( = ?auto_131275 ?auto_131281 ) ) ( OBJ-AT ?auto_131276 ?auto_131281 ) ( OBJ-AT ?auto_131277 ?auto_131281 ) ( IN-CITY ?auto_131282 ?auto_131285 ) ( not ( = ?auto_131275 ?auto_131282 ) ) ( OBJ-AT ?auto_131279 ?auto_131282 ) ( TRUCK-AT ?auto_131283 ?auto_131275 ) ( not ( = ?auto_131279 ?auto_131277 ) ) ( not ( = ?auto_131281 ?auto_131282 ) ) ( not ( = ?auto_131279 ?auto_131276 ) ) ( not ( = ?auto_131277 ?auto_131276 ) ) ( not ( = ?auto_131279 ?auto_131280 ) ) ( not ( = ?auto_131277 ?auto_131280 ) ) ( not ( = ?auto_131276 ?auto_131280 ) ) ( not ( = ?auto_131284 ?auto_131281 ) ) ( not ( = ?auto_131284 ?auto_131282 ) ) ( not ( = ?auto_131279 ?auto_131278 ) ) ( not ( = ?auto_131277 ?auto_131278 ) ) ( not ( = ?auto_131276 ?auto_131278 ) ) ( not ( = ?auto_131280 ?auto_131278 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_131279 ?auto_131277 ?auto_131276 ?auto_131278 ?auto_131280 ?auto_131275 )
      ( DELIVER-5PKG-VERIFY ?auto_131276 ?auto_131277 ?auto_131278 ?auto_131279 ?auto_131280 ?auto_131275 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_131425 - OBJ
      ?auto_131426 - OBJ
      ?auto_131427 - OBJ
      ?auto_131428 - OBJ
      ?auto_131429 - OBJ
      ?auto_131424 - LOCATION
    )
    :vars
    (
      ?auto_131433 - LOCATION
      ?auto_131434 - CITY
      ?auto_131430 - LOCATION
      ?auto_131431 - LOCATION
      ?auto_131432 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_131433 ?auto_131434 ) ( IN-CITY ?auto_131424 ?auto_131434 ) ( not ( = ?auto_131424 ?auto_131433 ) ) ( OBJ-AT ?auto_131427 ?auto_131433 ) ( OBJ-AT ?auto_131428 ?auto_131433 ) ( IN-CITY ?auto_131430 ?auto_131434 ) ( not ( = ?auto_131424 ?auto_131430 ) ) ( OBJ-AT ?auto_131425 ?auto_131430 ) ( OBJ-AT ?auto_131426 ?auto_131430 ) ( IN-CITY ?auto_131431 ?auto_131434 ) ( not ( = ?auto_131424 ?auto_131431 ) ) ( OBJ-AT ?auto_131429 ?auto_131431 ) ( TRUCK-AT ?auto_131432 ?auto_131424 ) ( not ( = ?auto_131429 ?auto_131426 ) ) ( not ( = ?auto_131430 ?auto_131431 ) ) ( not ( = ?auto_131429 ?auto_131425 ) ) ( not ( = ?auto_131426 ?auto_131425 ) ) ( not ( = ?auto_131429 ?auto_131428 ) ) ( not ( = ?auto_131426 ?auto_131428 ) ) ( not ( = ?auto_131425 ?auto_131428 ) ) ( not ( = ?auto_131433 ?auto_131430 ) ) ( not ( = ?auto_131433 ?auto_131431 ) ) ( not ( = ?auto_131429 ?auto_131427 ) ) ( not ( = ?auto_131426 ?auto_131427 ) ) ( not ( = ?auto_131425 ?auto_131427 ) ) ( not ( = ?auto_131428 ?auto_131427 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_131429 ?auto_131426 ?auto_131425 ?auto_131427 ?auto_131428 ?auto_131424 )
      ( DELIVER-5PKG-VERIFY ?auto_131425 ?auto_131426 ?auto_131427 ?auto_131428 ?auto_131429 ?auto_131424 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_132341 - OBJ
      ?auto_132342 - OBJ
      ?auto_132343 - OBJ
      ?auto_132344 - OBJ
      ?auto_132345 - OBJ
      ?auto_132340 - LOCATION
    )
    :vars
    (
      ?auto_132349 - LOCATION
      ?auto_132350 - CITY
      ?auto_132346 - LOCATION
      ?auto_132347 - LOCATION
      ?auto_132348 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_132349 ?auto_132350 ) ( IN-CITY ?auto_132340 ?auto_132350 ) ( not ( = ?auto_132340 ?auto_132349 ) ) ( OBJ-AT ?auto_132345 ?auto_132349 ) ( OBJ-AT ?auto_132342 ?auto_132349 ) ( IN-CITY ?auto_132346 ?auto_132350 ) ( not ( = ?auto_132340 ?auto_132346 ) ) ( OBJ-AT ?auto_132341 ?auto_132346 ) ( OBJ-AT ?auto_132344 ?auto_132346 ) ( IN-CITY ?auto_132347 ?auto_132350 ) ( not ( = ?auto_132340 ?auto_132347 ) ) ( OBJ-AT ?auto_132343 ?auto_132347 ) ( TRUCK-AT ?auto_132348 ?auto_132340 ) ( not ( = ?auto_132343 ?auto_132344 ) ) ( not ( = ?auto_132346 ?auto_132347 ) ) ( not ( = ?auto_132343 ?auto_132341 ) ) ( not ( = ?auto_132344 ?auto_132341 ) ) ( not ( = ?auto_132343 ?auto_132342 ) ) ( not ( = ?auto_132344 ?auto_132342 ) ) ( not ( = ?auto_132341 ?auto_132342 ) ) ( not ( = ?auto_132349 ?auto_132346 ) ) ( not ( = ?auto_132349 ?auto_132347 ) ) ( not ( = ?auto_132343 ?auto_132345 ) ) ( not ( = ?auto_132344 ?auto_132345 ) ) ( not ( = ?auto_132341 ?auto_132345 ) ) ( not ( = ?auto_132342 ?auto_132345 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_132343 ?auto_132344 ?auto_132341 ?auto_132345 ?auto_132342 ?auto_132340 )
      ( DELIVER-5PKG-VERIFY ?auto_132341 ?auto_132342 ?auto_132343 ?auto_132344 ?auto_132345 ?auto_132340 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_132388 - OBJ
      ?auto_132389 - OBJ
      ?auto_132390 - OBJ
      ?auto_132391 - OBJ
      ?auto_132392 - OBJ
      ?auto_132387 - LOCATION
    )
    :vars
    (
      ?auto_132396 - LOCATION
      ?auto_132397 - CITY
      ?auto_132393 - LOCATION
      ?auto_132394 - LOCATION
      ?auto_132395 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_132396 ?auto_132397 ) ( IN-CITY ?auto_132387 ?auto_132397 ) ( not ( = ?auto_132387 ?auto_132396 ) ) ( OBJ-AT ?auto_132391 ?auto_132396 ) ( OBJ-AT ?auto_132389 ?auto_132396 ) ( IN-CITY ?auto_132393 ?auto_132397 ) ( not ( = ?auto_132387 ?auto_132393 ) ) ( OBJ-AT ?auto_132388 ?auto_132393 ) ( OBJ-AT ?auto_132392 ?auto_132393 ) ( IN-CITY ?auto_132394 ?auto_132397 ) ( not ( = ?auto_132387 ?auto_132394 ) ) ( OBJ-AT ?auto_132390 ?auto_132394 ) ( TRUCK-AT ?auto_132395 ?auto_132387 ) ( not ( = ?auto_132390 ?auto_132392 ) ) ( not ( = ?auto_132393 ?auto_132394 ) ) ( not ( = ?auto_132390 ?auto_132388 ) ) ( not ( = ?auto_132392 ?auto_132388 ) ) ( not ( = ?auto_132390 ?auto_132389 ) ) ( not ( = ?auto_132392 ?auto_132389 ) ) ( not ( = ?auto_132388 ?auto_132389 ) ) ( not ( = ?auto_132396 ?auto_132393 ) ) ( not ( = ?auto_132396 ?auto_132394 ) ) ( not ( = ?auto_132390 ?auto_132391 ) ) ( not ( = ?auto_132392 ?auto_132391 ) ) ( not ( = ?auto_132388 ?auto_132391 ) ) ( not ( = ?auto_132389 ?auto_132391 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_132390 ?auto_132392 ?auto_132388 ?auto_132391 ?auto_132389 ?auto_132387 )
      ( DELIVER-5PKG-VERIFY ?auto_132388 ?auto_132389 ?auto_132390 ?auto_132391 ?auto_132392 ?auto_132387 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_132435 - OBJ
      ?auto_132436 - OBJ
      ?auto_132437 - OBJ
      ?auto_132438 - OBJ
      ?auto_132439 - OBJ
      ?auto_132434 - LOCATION
    )
    :vars
    (
      ?auto_132443 - LOCATION
      ?auto_132444 - CITY
      ?auto_132440 - LOCATION
      ?auto_132441 - LOCATION
      ?auto_132442 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_132443 ?auto_132444 ) ( IN-CITY ?auto_132434 ?auto_132444 ) ( not ( = ?auto_132434 ?auto_132443 ) ) ( OBJ-AT ?auto_132439 ?auto_132443 ) ( OBJ-AT ?auto_132436 ?auto_132443 ) ( IN-CITY ?auto_132440 ?auto_132444 ) ( not ( = ?auto_132434 ?auto_132440 ) ) ( OBJ-AT ?auto_132435 ?auto_132440 ) ( OBJ-AT ?auto_132437 ?auto_132440 ) ( IN-CITY ?auto_132441 ?auto_132444 ) ( not ( = ?auto_132434 ?auto_132441 ) ) ( OBJ-AT ?auto_132438 ?auto_132441 ) ( TRUCK-AT ?auto_132442 ?auto_132434 ) ( not ( = ?auto_132438 ?auto_132437 ) ) ( not ( = ?auto_132440 ?auto_132441 ) ) ( not ( = ?auto_132438 ?auto_132435 ) ) ( not ( = ?auto_132437 ?auto_132435 ) ) ( not ( = ?auto_132438 ?auto_132436 ) ) ( not ( = ?auto_132437 ?auto_132436 ) ) ( not ( = ?auto_132435 ?auto_132436 ) ) ( not ( = ?auto_132443 ?auto_132440 ) ) ( not ( = ?auto_132443 ?auto_132441 ) ) ( not ( = ?auto_132438 ?auto_132439 ) ) ( not ( = ?auto_132437 ?auto_132439 ) ) ( not ( = ?auto_132435 ?auto_132439 ) ) ( not ( = ?auto_132436 ?auto_132439 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_132438 ?auto_132437 ?auto_132435 ?auto_132439 ?auto_132436 ?auto_132434 )
      ( DELIVER-5PKG-VERIFY ?auto_132435 ?auto_132436 ?auto_132437 ?auto_132438 ?auto_132439 ?auto_132434 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_132482 - OBJ
      ?auto_132483 - OBJ
      ?auto_132484 - OBJ
      ?auto_132485 - OBJ
      ?auto_132486 - OBJ
      ?auto_132481 - LOCATION
    )
    :vars
    (
      ?auto_132490 - LOCATION
      ?auto_132491 - CITY
      ?auto_132487 - LOCATION
      ?auto_132488 - LOCATION
      ?auto_132489 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_132490 ?auto_132491 ) ( IN-CITY ?auto_132481 ?auto_132491 ) ( not ( = ?auto_132481 ?auto_132490 ) ) ( OBJ-AT ?auto_132485 ?auto_132490 ) ( OBJ-AT ?auto_132483 ?auto_132490 ) ( IN-CITY ?auto_132487 ?auto_132491 ) ( not ( = ?auto_132481 ?auto_132487 ) ) ( OBJ-AT ?auto_132482 ?auto_132487 ) ( OBJ-AT ?auto_132484 ?auto_132487 ) ( IN-CITY ?auto_132488 ?auto_132491 ) ( not ( = ?auto_132481 ?auto_132488 ) ) ( OBJ-AT ?auto_132486 ?auto_132488 ) ( TRUCK-AT ?auto_132489 ?auto_132481 ) ( not ( = ?auto_132486 ?auto_132484 ) ) ( not ( = ?auto_132487 ?auto_132488 ) ) ( not ( = ?auto_132486 ?auto_132482 ) ) ( not ( = ?auto_132484 ?auto_132482 ) ) ( not ( = ?auto_132486 ?auto_132483 ) ) ( not ( = ?auto_132484 ?auto_132483 ) ) ( not ( = ?auto_132482 ?auto_132483 ) ) ( not ( = ?auto_132490 ?auto_132487 ) ) ( not ( = ?auto_132490 ?auto_132488 ) ) ( not ( = ?auto_132486 ?auto_132485 ) ) ( not ( = ?auto_132484 ?auto_132485 ) ) ( not ( = ?auto_132482 ?auto_132485 ) ) ( not ( = ?auto_132483 ?auto_132485 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_132486 ?auto_132484 ?auto_132482 ?auto_132485 ?auto_132483 ?auto_132481 )
      ( DELIVER-5PKG-VERIFY ?auto_132482 ?auto_132483 ?auto_132484 ?auto_132485 ?auto_132486 ?auto_132481 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_132779 - OBJ
      ?auto_132780 - OBJ
      ?auto_132781 - OBJ
      ?auto_132782 - OBJ
      ?auto_132783 - OBJ
      ?auto_132778 - LOCATION
    )
    :vars
    (
      ?auto_132787 - LOCATION
      ?auto_132788 - CITY
      ?auto_132784 - LOCATION
      ?auto_132785 - LOCATION
      ?auto_132786 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_132787 ?auto_132788 ) ( IN-CITY ?auto_132778 ?auto_132788 ) ( not ( = ?auto_132778 ?auto_132787 ) ) ( OBJ-AT ?auto_132781 ?auto_132787 ) ( OBJ-AT ?auto_132780 ?auto_132787 ) ( IN-CITY ?auto_132784 ?auto_132788 ) ( not ( = ?auto_132778 ?auto_132784 ) ) ( OBJ-AT ?auto_132779 ?auto_132784 ) ( OBJ-AT ?auto_132783 ?auto_132784 ) ( IN-CITY ?auto_132785 ?auto_132788 ) ( not ( = ?auto_132778 ?auto_132785 ) ) ( OBJ-AT ?auto_132782 ?auto_132785 ) ( TRUCK-AT ?auto_132786 ?auto_132778 ) ( not ( = ?auto_132782 ?auto_132783 ) ) ( not ( = ?auto_132784 ?auto_132785 ) ) ( not ( = ?auto_132782 ?auto_132779 ) ) ( not ( = ?auto_132783 ?auto_132779 ) ) ( not ( = ?auto_132782 ?auto_132780 ) ) ( not ( = ?auto_132783 ?auto_132780 ) ) ( not ( = ?auto_132779 ?auto_132780 ) ) ( not ( = ?auto_132787 ?auto_132784 ) ) ( not ( = ?auto_132787 ?auto_132785 ) ) ( not ( = ?auto_132782 ?auto_132781 ) ) ( not ( = ?auto_132783 ?auto_132781 ) ) ( not ( = ?auto_132779 ?auto_132781 ) ) ( not ( = ?auto_132780 ?auto_132781 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_132782 ?auto_132783 ?auto_132779 ?auto_132781 ?auto_132780 ?auto_132778 )
      ( DELIVER-5PKG-VERIFY ?auto_132779 ?auto_132780 ?auto_132781 ?auto_132782 ?auto_132783 ?auto_132778 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_132826 - OBJ
      ?auto_132827 - OBJ
      ?auto_132828 - OBJ
      ?auto_132829 - OBJ
      ?auto_132830 - OBJ
      ?auto_132825 - LOCATION
    )
    :vars
    (
      ?auto_132834 - LOCATION
      ?auto_132835 - CITY
      ?auto_132831 - LOCATION
      ?auto_132832 - LOCATION
      ?auto_132833 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_132834 ?auto_132835 ) ( IN-CITY ?auto_132825 ?auto_132835 ) ( not ( = ?auto_132825 ?auto_132834 ) ) ( OBJ-AT ?auto_132828 ?auto_132834 ) ( OBJ-AT ?auto_132827 ?auto_132834 ) ( IN-CITY ?auto_132831 ?auto_132835 ) ( not ( = ?auto_132825 ?auto_132831 ) ) ( OBJ-AT ?auto_132826 ?auto_132831 ) ( OBJ-AT ?auto_132829 ?auto_132831 ) ( IN-CITY ?auto_132832 ?auto_132835 ) ( not ( = ?auto_132825 ?auto_132832 ) ) ( OBJ-AT ?auto_132830 ?auto_132832 ) ( TRUCK-AT ?auto_132833 ?auto_132825 ) ( not ( = ?auto_132830 ?auto_132829 ) ) ( not ( = ?auto_132831 ?auto_132832 ) ) ( not ( = ?auto_132830 ?auto_132826 ) ) ( not ( = ?auto_132829 ?auto_132826 ) ) ( not ( = ?auto_132830 ?auto_132827 ) ) ( not ( = ?auto_132829 ?auto_132827 ) ) ( not ( = ?auto_132826 ?auto_132827 ) ) ( not ( = ?auto_132834 ?auto_132831 ) ) ( not ( = ?auto_132834 ?auto_132832 ) ) ( not ( = ?auto_132830 ?auto_132828 ) ) ( not ( = ?auto_132829 ?auto_132828 ) ) ( not ( = ?auto_132826 ?auto_132828 ) ) ( not ( = ?auto_132827 ?auto_132828 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_132830 ?auto_132829 ?auto_132826 ?auto_132828 ?auto_132827 ?auto_132825 )
      ( DELIVER-5PKG-VERIFY ?auto_132826 ?auto_132827 ?auto_132828 ?auto_132829 ?auto_132830 ?auto_132825 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_133173 - OBJ
      ?auto_133174 - OBJ
      ?auto_133175 - OBJ
      ?auto_133176 - OBJ
      ?auto_133177 - OBJ
      ?auto_133172 - LOCATION
    )
    :vars
    (
      ?auto_133181 - LOCATION
      ?auto_133182 - CITY
      ?auto_133178 - LOCATION
      ?auto_133179 - LOCATION
      ?auto_133180 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_133181 ?auto_133182 ) ( IN-CITY ?auto_133172 ?auto_133182 ) ( not ( = ?auto_133172 ?auto_133181 ) ) ( OBJ-AT ?auto_133174 ?auto_133181 ) ( OBJ-AT ?auto_133177 ?auto_133181 ) ( IN-CITY ?auto_133178 ?auto_133182 ) ( not ( = ?auto_133172 ?auto_133178 ) ) ( OBJ-AT ?auto_133173 ?auto_133178 ) ( OBJ-AT ?auto_133176 ?auto_133178 ) ( IN-CITY ?auto_133179 ?auto_133182 ) ( not ( = ?auto_133172 ?auto_133179 ) ) ( OBJ-AT ?auto_133175 ?auto_133179 ) ( TRUCK-AT ?auto_133180 ?auto_133172 ) ( not ( = ?auto_133175 ?auto_133176 ) ) ( not ( = ?auto_133178 ?auto_133179 ) ) ( not ( = ?auto_133175 ?auto_133173 ) ) ( not ( = ?auto_133176 ?auto_133173 ) ) ( not ( = ?auto_133175 ?auto_133177 ) ) ( not ( = ?auto_133176 ?auto_133177 ) ) ( not ( = ?auto_133173 ?auto_133177 ) ) ( not ( = ?auto_133181 ?auto_133178 ) ) ( not ( = ?auto_133181 ?auto_133179 ) ) ( not ( = ?auto_133175 ?auto_133174 ) ) ( not ( = ?auto_133176 ?auto_133174 ) ) ( not ( = ?auto_133173 ?auto_133174 ) ) ( not ( = ?auto_133177 ?auto_133174 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_133175 ?auto_133176 ?auto_133173 ?auto_133174 ?auto_133177 ?auto_133172 )
      ( DELIVER-5PKG-VERIFY ?auto_133173 ?auto_133174 ?auto_133175 ?auto_133176 ?auto_133177 ?auto_133172 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_133271 - OBJ
      ?auto_133272 - OBJ
      ?auto_133273 - OBJ
      ?auto_133274 - OBJ
      ?auto_133275 - OBJ
      ?auto_133270 - LOCATION
    )
    :vars
    (
      ?auto_133279 - LOCATION
      ?auto_133280 - CITY
      ?auto_133276 - LOCATION
      ?auto_133277 - LOCATION
      ?auto_133278 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_133279 ?auto_133280 ) ( IN-CITY ?auto_133270 ?auto_133280 ) ( not ( = ?auto_133270 ?auto_133279 ) ) ( OBJ-AT ?auto_133272 ?auto_133279 ) ( OBJ-AT ?auto_133274 ?auto_133279 ) ( IN-CITY ?auto_133276 ?auto_133280 ) ( not ( = ?auto_133270 ?auto_133276 ) ) ( OBJ-AT ?auto_133271 ?auto_133276 ) ( OBJ-AT ?auto_133275 ?auto_133276 ) ( IN-CITY ?auto_133277 ?auto_133280 ) ( not ( = ?auto_133270 ?auto_133277 ) ) ( OBJ-AT ?auto_133273 ?auto_133277 ) ( TRUCK-AT ?auto_133278 ?auto_133270 ) ( not ( = ?auto_133273 ?auto_133275 ) ) ( not ( = ?auto_133276 ?auto_133277 ) ) ( not ( = ?auto_133273 ?auto_133271 ) ) ( not ( = ?auto_133275 ?auto_133271 ) ) ( not ( = ?auto_133273 ?auto_133274 ) ) ( not ( = ?auto_133275 ?auto_133274 ) ) ( not ( = ?auto_133271 ?auto_133274 ) ) ( not ( = ?auto_133279 ?auto_133276 ) ) ( not ( = ?auto_133279 ?auto_133277 ) ) ( not ( = ?auto_133273 ?auto_133272 ) ) ( not ( = ?auto_133275 ?auto_133272 ) ) ( not ( = ?auto_133271 ?auto_133272 ) ) ( not ( = ?auto_133274 ?auto_133272 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_133273 ?auto_133275 ?auto_133271 ?auto_133272 ?auto_133274 ?auto_133270 )
      ( DELIVER-5PKG-VERIFY ?auto_133271 ?auto_133272 ?auto_133273 ?auto_133274 ?auto_133275 ?auto_133270 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_133417 - OBJ
      ?auto_133418 - OBJ
      ?auto_133419 - OBJ
      ?auto_133420 - OBJ
      ?auto_133421 - OBJ
      ?auto_133416 - LOCATION
    )
    :vars
    (
      ?auto_133425 - LOCATION
      ?auto_133426 - CITY
      ?auto_133422 - LOCATION
      ?auto_133423 - LOCATION
      ?auto_133424 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_133425 ?auto_133426 ) ( IN-CITY ?auto_133416 ?auto_133426 ) ( not ( = ?auto_133416 ?auto_133425 ) ) ( OBJ-AT ?auto_133418 ?auto_133425 ) ( OBJ-AT ?auto_133421 ?auto_133425 ) ( IN-CITY ?auto_133422 ?auto_133426 ) ( not ( = ?auto_133416 ?auto_133422 ) ) ( OBJ-AT ?auto_133417 ?auto_133422 ) ( OBJ-AT ?auto_133419 ?auto_133422 ) ( IN-CITY ?auto_133423 ?auto_133426 ) ( not ( = ?auto_133416 ?auto_133423 ) ) ( OBJ-AT ?auto_133420 ?auto_133423 ) ( TRUCK-AT ?auto_133424 ?auto_133416 ) ( not ( = ?auto_133420 ?auto_133419 ) ) ( not ( = ?auto_133422 ?auto_133423 ) ) ( not ( = ?auto_133420 ?auto_133417 ) ) ( not ( = ?auto_133419 ?auto_133417 ) ) ( not ( = ?auto_133420 ?auto_133421 ) ) ( not ( = ?auto_133419 ?auto_133421 ) ) ( not ( = ?auto_133417 ?auto_133421 ) ) ( not ( = ?auto_133425 ?auto_133422 ) ) ( not ( = ?auto_133425 ?auto_133423 ) ) ( not ( = ?auto_133420 ?auto_133418 ) ) ( not ( = ?auto_133419 ?auto_133418 ) ) ( not ( = ?auto_133417 ?auto_133418 ) ) ( not ( = ?auto_133421 ?auto_133418 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_133420 ?auto_133419 ?auto_133417 ?auto_133418 ?auto_133421 ?auto_133416 )
      ( DELIVER-5PKG-VERIFY ?auto_133417 ?auto_133418 ?auto_133419 ?auto_133420 ?auto_133421 ?auto_133416 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_133566 - OBJ
      ?auto_133567 - OBJ
      ?auto_133568 - OBJ
      ?auto_133569 - OBJ
      ?auto_133570 - OBJ
      ?auto_133565 - LOCATION
    )
    :vars
    (
      ?auto_133574 - LOCATION
      ?auto_133575 - CITY
      ?auto_133571 - LOCATION
      ?auto_133572 - LOCATION
      ?auto_133573 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_133574 ?auto_133575 ) ( IN-CITY ?auto_133565 ?auto_133575 ) ( not ( = ?auto_133565 ?auto_133574 ) ) ( OBJ-AT ?auto_133567 ?auto_133574 ) ( OBJ-AT ?auto_133569 ?auto_133574 ) ( IN-CITY ?auto_133571 ?auto_133575 ) ( not ( = ?auto_133565 ?auto_133571 ) ) ( OBJ-AT ?auto_133566 ?auto_133571 ) ( OBJ-AT ?auto_133568 ?auto_133571 ) ( IN-CITY ?auto_133572 ?auto_133575 ) ( not ( = ?auto_133565 ?auto_133572 ) ) ( OBJ-AT ?auto_133570 ?auto_133572 ) ( TRUCK-AT ?auto_133573 ?auto_133565 ) ( not ( = ?auto_133570 ?auto_133568 ) ) ( not ( = ?auto_133571 ?auto_133572 ) ) ( not ( = ?auto_133570 ?auto_133566 ) ) ( not ( = ?auto_133568 ?auto_133566 ) ) ( not ( = ?auto_133570 ?auto_133569 ) ) ( not ( = ?auto_133568 ?auto_133569 ) ) ( not ( = ?auto_133566 ?auto_133569 ) ) ( not ( = ?auto_133574 ?auto_133571 ) ) ( not ( = ?auto_133574 ?auto_133572 ) ) ( not ( = ?auto_133570 ?auto_133567 ) ) ( not ( = ?auto_133568 ?auto_133567 ) ) ( not ( = ?auto_133566 ?auto_133567 ) ) ( not ( = ?auto_133569 ?auto_133567 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_133570 ?auto_133568 ?auto_133566 ?auto_133567 ?auto_133569 ?auto_133565 )
      ( DELIVER-5PKG-VERIFY ?auto_133566 ?auto_133567 ?auto_133568 ?auto_133569 ?auto_133570 ?auto_133565 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_134023 - OBJ
      ?auto_134024 - OBJ
      ?auto_134025 - OBJ
      ?auto_134026 - OBJ
      ?auto_134027 - OBJ
      ?auto_134022 - LOCATION
    )
    :vars
    (
      ?auto_134031 - LOCATION
      ?auto_134032 - CITY
      ?auto_134028 - LOCATION
      ?auto_134029 - LOCATION
      ?auto_134030 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134031 ?auto_134032 ) ( IN-CITY ?auto_134022 ?auto_134032 ) ( not ( = ?auto_134022 ?auto_134031 ) ) ( OBJ-AT ?auto_134024 ?auto_134031 ) ( OBJ-AT ?auto_134025 ?auto_134031 ) ( IN-CITY ?auto_134028 ?auto_134032 ) ( not ( = ?auto_134022 ?auto_134028 ) ) ( OBJ-AT ?auto_134023 ?auto_134028 ) ( OBJ-AT ?auto_134027 ?auto_134028 ) ( IN-CITY ?auto_134029 ?auto_134032 ) ( not ( = ?auto_134022 ?auto_134029 ) ) ( OBJ-AT ?auto_134026 ?auto_134029 ) ( TRUCK-AT ?auto_134030 ?auto_134022 ) ( not ( = ?auto_134026 ?auto_134027 ) ) ( not ( = ?auto_134028 ?auto_134029 ) ) ( not ( = ?auto_134026 ?auto_134023 ) ) ( not ( = ?auto_134027 ?auto_134023 ) ) ( not ( = ?auto_134026 ?auto_134025 ) ) ( not ( = ?auto_134027 ?auto_134025 ) ) ( not ( = ?auto_134023 ?auto_134025 ) ) ( not ( = ?auto_134031 ?auto_134028 ) ) ( not ( = ?auto_134031 ?auto_134029 ) ) ( not ( = ?auto_134026 ?auto_134024 ) ) ( not ( = ?auto_134027 ?auto_134024 ) ) ( not ( = ?auto_134023 ?auto_134024 ) ) ( not ( = ?auto_134025 ?auto_134024 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_134026 ?auto_134027 ?auto_134023 ?auto_134024 ?auto_134025 ?auto_134022 )
      ( DELIVER-5PKG-VERIFY ?auto_134023 ?auto_134024 ?auto_134025 ?auto_134026 ?auto_134027 ?auto_134022 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_134070 - OBJ
      ?auto_134071 - OBJ
      ?auto_134072 - OBJ
      ?auto_134073 - OBJ
      ?auto_134074 - OBJ
      ?auto_134069 - LOCATION
    )
    :vars
    (
      ?auto_134078 - LOCATION
      ?auto_134079 - CITY
      ?auto_134075 - LOCATION
      ?auto_134076 - LOCATION
      ?auto_134077 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134078 ?auto_134079 ) ( IN-CITY ?auto_134069 ?auto_134079 ) ( not ( = ?auto_134069 ?auto_134078 ) ) ( OBJ-AT ?auto_134071 ?auto_134078 ) ( OBJ-AT ?auto_134072 ?auto_134078 ) ( IN-CITY ?auto_134075 ?auto_134079 ) ( not ( = ?auto_134069 ?auto_134075 ) ) ( OBJ-AT ?auto_134070 ?auto_134075 ) ( OBJ-AT ?auto_134073 ?auto_134075 ) ( IN-CITY ?auto_134076 ?auto_134079 ) ( not ( = ?auto_134069 ?auto_134076 ) ) ( OBJ-AT ?auto_134074 ?auto_134076 ) ( TRUCK-AT ?auto_134077 ?auto_134069 ) ( not ( = ?auto_134074 ?auto_134073 ) ) ( not ( = ?auto_134075 ?auto_134076 ) ) ( not ( = ?auto_134074 ?auto_134070 ) ) ( not ( = ?auto_134073 ?auto_134070 ) ) ( not ( = ?auto_134074 ?auto_134072 ) ) ( not ( = ?auto_134073 ?auto_134072 ) ) ( not ( = ?auto_134070 ?auto_134072 ) ) ( not ( = ?auto_134078 ?auto_134075 ) ) ( not ( = ?auto_134078 ?auto_134076 ) ) ( not ( = ?auto_134074 ?auto_134071 ) ) ( not ( = ?auto_134073 ?auto_134071 ) ) ( not ( = ?auto_134070 ?auto_134071 ) ) ( not ( = ?auto_134072 ?auto_134071 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_134074 ?auto_134073 ?auto_134070 ?auto_134071 ?auto_134072 ?auto_134069 )
      ( DELIVER-5PKG-VERIFY ?auto_134070 ?auto_134071 ?auto_134072 ?auto_134073 ?auto_134074 ?auto_134069 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_134778 - OBJ
      ?auto_134779 - OBJ
      ?auto_134780 - OBJ
      ?auto_134781 - OBJ
      ?auto_134782 - OBJ
      ?auto_134777 - LOCATION
    )
    :vars
    (
      ?auto_134786 - LOCATION
      ?auto_134787 - CITY
      ?auto_134783 - LOCATION
      ?auto_134784 - LOCATION
      ?auto_134785 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134786 ?auto_134787 ) ( IN-CITY ?auto_134777 ?auto_134787 ) ( not ( = ?auto_134777 ?auto_134786 ) ) ( OBJ-AT ?auto_134782 ?auto_134786 ) ( OBJ-AT ?auto_134778 ?auto_134786 ) ( IN-CITY ?auto_134783 ?auto_134787 ) ( not ( = ?auto_134777 ?auto_134783 ) ) ( OBJ-AT ?auto_134781 ?auto_134783 ) ( OBJ-AT ?auto_134780 ?auto_134783 ) ( IN-CITY ?auto_134784 ?auto_134787 ) ( not ( = ?auto_134777 ?auto_134784 ) ) ( OBJ-AT ?auto_134779 ?auto_134784 ) ( TRUCK-AT ?auto_134785 ?auto_134777 ) ( not ( = ?auto_134779 ?auto_134780 ) ) ( not ( = ?auto_134783 ?auto_134784 ) ) ( not ( = ?auto_134779 ?auto_134781 ) ) ( not ( = ?auto_134780 ?auto_134781 ) ) ( not ( = ?auto_134779 ?auto_134778 ) ) ( not ( = ?auto_134780 ?auto_134778 ) ) ( not ( = ?auto_134781 ?auto_134778 ) ) ( not ( = ?auto_134786 ?auto_134783 ) ) ( not ( = ?auto_134786 ?auto_134784 ) ) ( not ( = ?auto_134779 ?auto_134782 ) ) ( not ( = ?auto_134780 ?auto_134782 ) ) ( not ( = ?auto_134781 ?auto_134782 ) ) ( not ( = ?auto_134778 ?auto_134782 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_134779 ?auto_134780 ?auto_134781 ?auto_134782 ?auto_134778 ?auto_134777 )
      ( DELIVER-5PKG-VERIFY ?auto_134778 ?auto_134779 ?auto_134780 ?auto_134781 ?auto_134782 ?auto_134777 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_134825 - OBJ
      ?auto_134826 - OBJ
      ?auto_134827 - OBJ
      ?auto_134828 - OBJ
      ?auto_134829 - OBJ
      ?auto_134824 - LOCATION
    )
    :vars
    (
      ?auto_134833 - LOCATION
      ?auto_134834 - CITY
      ?auto_134830 - LOCATION
      ?auto_134831 - LOCATION
      ?auto_134832 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134833 ?auto_134834 ) ( IN-CITY ?auto_134824 ?auto_134834 ) ( not ( = ?auto_134824 ?auto_134833 ) ) ( OBJ-AT ?auto_134828 ?auto_134833 ) ( OBJ-AT ?auto_134825 ?auto_134833 ) ( IN-CITY ?auto_134830 ?auto_134834 ) ( not ( = ?auto_134824 ?auto_134830 ) ) ( OBJ-AT ?auto_134829 ?auto_134830 ) ( OBJ-AT ?auto_134827 ?auto_134830 ) ( IN-CITY ?auto_134831 ?auto_134834 ) ( not ( = ?auto_134824 ?auto_134831 ) ) ( OBJ-AT ?auto_134826 ?auto_134831 ) ( TRUCK-AT ?auto_134832 ?auto_134824 ) ( not ( = ?auto_134826 ?auto_134827 ) ) ( not ( = ?auto_134830 ?auto_134831 ) ) ( not ( = ?auto_134826 ?auto_134829 ) ) ( not ( = ?auto_134827 ?auto_134829 ) ) ( not ( = ?auto_134826 ?auto_134825 ) ) ( not ( = ?auto_134827 ?auto_134825 ) ) ( not ( = ?auto_134829 ?auto_134825 ) ) ( not ( = ?auto_134833 ?auto_134830 ) ) ( not ( = ?auto_134833 ?auto_134831 ) ) ( not ( = ?auto_134826 ?auto_134828 ) ) ( not ( = ?auto_134827 ?auto_134828 ) ) ( not ( = ?auto_134829 ?auto_134828 ) ) ( not ( = ?auto_134825 ?auto_134828 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_134826 ?auto_134827 ?auto_134829 ?auto_134828 ?auto_134825 ?auto_134824 )
      ( DELIVER-5PKG-VERIFY ?auto_134825 ?auto_134826 ?auto_134827 ?auto_134828 ?auto_134829 ?auto_134824 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_134872 - OBJ
      ?auto_134873 - OBJ
      ?auto_134874 - OBJ
      ?auto_134875 - OBJ
      ?auto_134876 - OBJ
      ?auto_134871 - LOCATION
    )
    :vars
    (
      ?auto_134880 - LOCATION
      ?auto_134881 - CITY
      ?auto_134877 - LOCATION
      ?auto_134878 - LOCATION
      ?auto_134879 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134880 ?auto_134881 ) ( IN-CITY ?auto_134871 ?auto_134881 ) ( not ( = ?auto_134871 ?auto_134880 ) ) ( OBJ-AT ?auto_134876 ?auto_134880 ) ( OBJ-AT ?auto_134872 ?auto_134880 ) ( IN-CITY ?auto_134877 ?auto_134881 ) ( not ( = ?auto_134871 ?auto_134877 ) ) ( OBJ-AT ?auto_134874 ?auto_134877 ) ( OBJ-AT ?auto_134875 ?auto_134877 ) ( IN-CITY ?auto_134878 ?auto_134881 ) ( not ( = ?auto_134871 ?auto_134878 ) ) ( OBJ-AT ?auto_134873 ?auto_134878 ) ( TRUCK-AT ?auto_134879 ?auto_134871 ) ( not ( = ?auto_134873 ?auto_134875 ) ) ( not ( = ?auto_134877 ?auto_134878 ) ) ( not ( = ?auto_134873 ?auto_134874 ) ) ( not ( = ?auto_134875 ?auto_134874 ) ) ( not ( = ?auto_134873 ?auto_134872 ) ) ( not ( = ?auto_134875 ?auto_134872 ) ) ( not ( = ?auto_134874 ?auto_134872 ) ) ( not ( = ?auto_134880 ?auto_134877 ) ) ( not ( = ?auto_134880 ?auto_134878 ) ) ( not ( = ?auto_134873 ?auto_134876 ) ) ( not ( = ?auto_134875 ?auto_134876 ) ) ( not ( = ?auto_134874 ?auto_134876 ) ) ( not ( = ?auto_134872 ?auto_134876 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_134873 ?auto_134875 ?auto_134874 ?auto_134876 ?auto_134872 ?auto_134871 )
      ( DELIVER-5PKG-VERIFY ?auto_134872 ?auto_134873 ?auto_134874 ?auto_134875 ?auto_134876 ?auto_134871 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_134919 - OBJ
      ?auto_134920 - OBJ
      ?auto_134921 - OBJ
      ?auto_134922 - OBJ
      ?auto_134923 - OBJ
      ?auto_134918 - LOCATION
    )
    :vars
    (
      ?auto_134927 - LOCATION
      ?auto_134928 - CITY
      ?auto_134924 - LOCATION
      ?auto_134925 - LOCATION
      ?auto_134926 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_134927 ?auto_134928 ) ( IN-CITY ?auto_134918 ?auto_134928 ) ( not ( = ?auto_134918 ?auto_134927 ) ) ( OBJ-AT ?auto_134922 ?auto_134927 ) ( OBJ-AT ?auto_134919 ?auto_134927 ) ( IN-CITY ?auto_134924 ?auto_134928 ) ( not ( = ?auto_134918 ?auto_134924 ) ) ( OBJ-AT ?auto_134921 ?auto_134924 ) ( OBJ-AT ?auto_134923 ?auto_134924 ) ( IN-CITY ?auto_134925 ?auto_134928 ) ( not ( = ?auto_134918 ?auto_134925 ) ) ( OBJ-AT ?auto_134920 ?auto_134925 ) ( TRUCK-AT ?auto_134926 ?auto_134918 ) ( not ( = ?auto_134920 ?auto_134923 ) ) ( not ( = ?auto_134924 ?auto_134925 ) ) ( not ( = ?auto_134920 ?auto_134921 ) ) ( not ( = ?auto_134923 ?auto_134921 ) ) ( not ( = ?auto_134920 ?auto_134919 ) ) ( not ( = ?auto_134923 ?auto_134919 ) ) ( not ( = ?auto_134921 ?auto_134919 ) ) ( not ( = ?auto_134927 ?auto_134924 ) ) ( not ( = ?auto_134927 ?auto_134925 ) ) ( not ( = ?auto_134920 ?auto_134922 ) ) ( not ( = ?auto_134923 ?auto_134922 ) ) ( not ( = ?auto_134921 ?auto_134922 ) ) ( not ( = ?auto_134919 ?auto_134922 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_134920 ?auto_134923 ?auto_134921 ?auto_134922 ?auto_134919 ?auto_134918 )
      ( DELIVER-5PKG-VERIFY ?auto_134919 ?auto_134920 ?auto_134921 ?auto_134922 ?auto_134923 ?auto_134918 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_135166 - OBJ
      ?auto_135167 - OBJ
      ?auto_135168 - OBJ
      ?auto_135169 - OBJ
      ?auto_135170 - OBJ
      ?auto_135165 - LOCATION
    )
    :vars
    (
      ?auto_135174 - LOCATION
      ?auto_135175 - CITY
      ?auto_135171 - LOCATION
      ?auto_135172 - LOCATION
      ?auto_135173 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135174 ?auto_135175 ) ( IN-CITY ?auto_135165 ?auto_135175 ) ( not ( = ?auto_135165 ?auto_135174 ) ) ( OBJ-AT ?auto_135168 ?auto_135174 ) ( OBJ-AT ?auto_135166 ?auto_135174 ) ( IN-CITY ?auto_135171 ?auto_135175 ) ( not ( = ?auto_135165 ?auto_135171 ) ) ( OBJ-AT ?auto_135170 ?auto_135171 ) ( OBJ-AT ?auto_135169 ?auto_135171 ) ( IN-CITY ?auto_135172 ?auto_135175 ) ( not ( = ?auto_135165 ?auto_135172 ) ) ( OBJ-AT ?auto_135167 ?auto_135172 ) ( TRUCK-AT ?auto_135173 ?auto_135165 ) ( not ( = ?auto_135167 ?auto_135169 ) ) ( not ( = ?auto_135171 ?auto_135172 ) ) ( not ( = ?auto_135167 ?auto_135170 ) ) ( not ( = ?auto_135169 ?auto_135170 ) ) ( not ( = ?auto_135167 ?auto_135166 ) ) ( not ( = ?auto_135169 ?auto_135166 ) ) ( not ( = ?auto_135170 ?auto_135166 ) ) ( not ( = ?auto_135174 ?auto_135171 ) ) ( not ( = ?auto_135174 ?auto_135172 ) ) ( not ( = ?auto_135167 ?auto_135168 ) ) ( not ( = ?auto_135169 ?auto_135168 ) ) ( not ( = ?auto_135170 ?auto_135168 ) ) ( not ( = ?auto_135166 ?auto_135168 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_135167 ?auto_135169 ?auto_135170 ?auto_135168 ?auto_135166 ?auto_135165 )
      ( DELIVER-5PKG-VERIFY ?auto_135166 ?auto_135167 ?auto_135168 ?auto_135169 ?auto_135170 ?auto_135165 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_135213 - OBJ
      ?auto_135214 - OBJ
      ?auto_135215 - OBJ
      ?auto_135216 - OBJ
      ?auto_135217 - OBJ
      ?auto_135212 - LOCATION
    )
    :vars
    (
      ?auto_135221 - LOCATION
      ?auto_135222 - CITY
      ?auto_135218 - LOCATION
      ?auto_135219 - LOCATION
      ?auto_135220 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135221 ?auto_135222 ) ( IN-CITY ?auto_135212 ?auto_135222 ) ( not ( = ?auto_135212 ?auto_135221 ) ) ( OBJ-AT ?auto_135215 ?auto_135221 ) ( OBJ-AT ?auto_135213 ?auto_135221 ) ( IN-CITY ?auto_135218 ?auto_135222 ) ( not ( = ?auto_135212 ?auto_135218 ) ) ( OBJ-AT ?auto_135216 ?auto_135218 ) ( OBJ-AT ?auto_135217 ?auto_135218 ) ( IN-CITY ?auto_135219 ?auto_135222 ) ( not ( = ?auto_135212 ?auto_135219 ) ) ( OBJ-AT ?auto_135214 ?auto_135219 ) ( TRUCK-AT ?auto_135220 ?auto_135212 ) ( not ( = ?auto_135214 ?auto_135217 ) ) ( not ( = ?auto_135218 ?auto_135219 ) ) ( not ( = ?auto_135214 ?auto_135216 ) ) ( not ( = ?auto_135217 ?auto_135216 ) ) ( not ( = ?auto_135214 ?auto_135213 ) ) ( not ( = ?auto_135217 ?auto_135213 ) ) ( not ( = ?auto_135216 ?auto_135213 ) ) ( not ( = ?auto_135221 ?auto_135218 ) ) ( not ( = ?auto_135221 ?auto_135219 ) ) ( not ( = ?auto_135214 ?auto_135215 ) ) ( not ( = ?auto_135217 ?auto_135215 ) ) ( not ( = ?auto_135216 ?auto_135215 ) ) ( not ( = ?auto_135213 ?auto_135215 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_135214 ?auto_135217 ?auto_135216 ?auto_135215 ?auto_135213 ?auto_135212 )
      ( DELIVER-5PKG-VERIFY ?auto_135213 ?auto_135214 ?auto_135215 ?auto_135216 ?auto_135217 ?auto_135212 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_135410 - OBJ
      ?auto_135411 - OBJ
      ?auto_135412 - OBJ
      ?auto_135413 - OBJ
      ?auto_135414 - OBJ
      ?auto_135409 - LOCATION
    )
    :vars
    (
      ?auto_135418 - LOCATION
      ?auto_135419 - CITY
      ?auto_135415 - LOCATION
      ?auto_135416 - LOCATION
      ?auto_135417 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135418 ?auto_135419 ) ( IN-CITY ?auto_135409 ?auto_135419 ) ( not ( = ?auto_135409 ?auto_135418 ) ) ( OBJ-AT ?auto_135414 ?auto_135418 ) ( OBJ-AT ?auto_135410 ?auto_135418 ) ( IN-CITY ?auto_135415 ?auto_135419 ) ( not ( = ?auto_135409 ?auto_135415 ) ) ( OBJ-AT ?auto_135413 ?auto_135415 ) ( OBJ-AT ?auto_135411 ?auto_135415 ) ( IN-CITY ?auto_135416 ?auto_135419 ) ( not ( = ?auto_135409 ?auto_135416 ) ) ( OBJ-AT ?auto_135412 ?auto_135416 ) ( TRUCK-AT ?auto_135417 ?auto_135409 ) ( not ( = ?auto_135412 ?auto_135411 ) ) ( not ( = ?auto_135415 ?auto_135416 ) ) ( not ( = ?auto_135412 ?auto_135413 ) ) ( not ( = ?auto_135411 ?auto_135413 ) ) ( not ( = ?auto_135412 ?auto_135410 ) ) ( not ( = ?auto_135411 ?auto_135410 ) ) ( not ( = ?auto_135413 ?auto_135410 ) ) ( not ( = ?auto_135418 ?auto_135415 ) ) ( not ( = ?auto_135418 ?auto_135416 ) ) ( not ( = ?auto_135412 ?auto_135414 ) ) ( not ( = ?auto_135411 ?auto_135414 ) ) ( not ( = ?auto_135413 ?auto_135414 ) ) ( not ( = ?auto_135410 ?auto_135414 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_135412 ?auto_135411 ?auto_135413 ?auto_135414 ?auto_135410 ?auto_135409 )
      ( DELIVER-5PKG-VERIFY ?auto_135410 ?auto_135411 ?auto_135412 ?auto_135413 ?auto_135414 ?auto_135409 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_135457 - OBJ
      ?auto_135458 - OBJ
      ?auto_135459 - OBJ
      ?auto_135460 - OBJ
      ?auto_135461 - OBJ
      ?auto_135456 - LOCATION
    )
    :vars
    (
      ?auto_135465 - LOCATION
      ?auto_135466 - CITY
      ?auto_135462 - LOCATION
      ?auto_135463 - LOCATION
      ?auto_135464 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135465 ?auto_135466 ) ( IN-CITY ?auto_135456 ?auto_135466 ) ( not ( = ?auto_135456 ?auto_135465 ) ) ( OBJ-AT ?auto_135460 ?auto_135465 ) ( OBJ-AT ?auto_135457 ?auto_135465 ) ( IN-CITY ?auto_135462 ?auto_135466 ) ( not ( = ?auto_135456 ?auto_135462 ) ) ( OBJ-AT ?auto_135461 ?auto_135462 ) ( OBJ-AT ?auto_135458 ?auto_135462 ) ( IN-CITY ?auto_135463 ?auto_135466 ) ( not ( = ?auto_135456 ?auto_135463 ) ) ( OBJ-AT ?auto_135459 ?auto_135463 ) ( TRUCK-AT ?auto_135464 ?auto_135456 ) ( not ( = ?auto_135459 ?auto_135458 ) ) ( not ( = ?auto_135462 ?auto_135463 ) ) ( not ( = ?auto_135459 ?auto_135461 ) ) ( not ( = ?auto_135458 ?auto_135461 ) ) ( not ( = ?auto_135459 ?auto_135457 ) ) ( not ( = ?auto_135458 ?auto_135457 ) ) ( not ( = ?auto_135461 ?auto_135457 ) ) ( not ( = ?auto_135465 ?auto_135462 ) ) ( not ( = ?auto_135465 ?auto_135463 ) ) ( not ( = ?auto_135459 ?auto_135460 ) ) ( not ( = ?auto_135458 ?auto_135460 ) ) ( not ( = ?auto_135461 ?auto_135460 ) ) ( not ( = ?auto_135457 ?auto_135460 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_135459 ?auto_135458 ?auto_135461 ?auto_135460 ?auto_135457 ?auto_135456 )
      ( DELIVER-5PKG-VERIFY ?auto_135457 ?auto_135458 ?auto_135459 ?auto_135460 ?auto_135461 ?auto_135456 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_135605 - OBJ
      ?auto_135606 - OBJ
      ?auto_135607 - OBJ
      ?auto_135608 - OBJ
      ?auto_135609 - OBJ
      ?auto_135604 - LOCATION
    )
    :vars
    (
      ?auto_135613 - LOCATION
      ?auto_135614 - CITY
      ?auto_135610 - LOCATION
      ?auto_135611 - LOCATION
      ?auto_135612 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135613 ?auto_135614 ) ( IN-CITY ?auto_135604 ?auto_135614 ) ( not ( = ?auto_135604 ?auto_135613 ) ) ( OBJ-AT ?auto_135609 ?auto_135613 ) ( OBJ-AT ?auto_135605 ?auto_135613 ) ( IN-CITY ?auto_135610 ?auto_135614 ) ( not ( = ?auto_135604 ?auto_135610 ) ) ( OBJ-AT ?auto_135607 ?auto_135610 ) ( OBJ-AT ?auto_135606 ?auto_135610 ) ( IN-CITY ?auto_135611 ?auto_135614 ) ( not ( = ?auto_135604 ?auto_135611 ) ) ( OBJ-AT ?auto_135608 ?auto_135611 ) ( TRUCK-AT ?auto_135612 ?auto_135604 ) ( not ( = ?auto_135608 ?auto_135606 ) ) ( not ( = ?auto_135610 ?auto_135611 ) ) ( not ( = ?auto_135608 ?auto_135607 ) ) ( not ( = ?auto_135606 ?auto_135607 ) ) ( not ( = ?auto_135608 ?auto_135605 ) ) ( not ( = ?auto_135606 ?auto_135605 ) ) ( not ( = ?auto_135607 ?auto_135605 ) ) ( not ( = ?auto_135613 ?auto_135610 ) ) ( not ( = ?auto_135613 ?auto_135611 ) ) ( not ( = ?auto_135608 ?auto_135609 ) ) ( not ( = ?auto_135606 ?auto_135609 ) ) ( not ( = ?auto_135607 ?auto_135609 ) ) ( not ( = ?auto_135605 ?auto_135609 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_135608 ?auto_135606 ?auto_135607 ?auto_135609 ?auto_135605 ?auto_135604 )
      ( DELIVER-5PKG-VERIFY ?auto_135605 ?auto_135606 ?auto_135607 ?auto_135608 ?auto_135609 ?auto_135604 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_135652 - OBJ
      ?auto_135653 - OBJ
      ?auto_135654 - OBJ
      ?auto_135655 - OBJ
      ?auto_135656 - OBJ
      ?auto_135651 - LOCATION
    )
    :vars
    (
      ?auto_135660 - LOCATION
      ?auto_135661 - CITY
      ?auto_135657 - LOCATION
      ?auto_135658 - LOCATION
      ?auto_135659 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135660 ?auto_135661 ) ( IN-CITY ?auto_135651 ?auto_135661 ) ( not ( = ?auto_135651 ?auto_135660 ) ) ( OBJ-AT ?auto_135655 ?auto_135660 ) ( OBJ-AT ?auto_135652 ?auto_135660 ) ( IN-CITY ?auto_135657 ?auto_135661 ) ( not ( = ?auto_135651 ?auto_135657 ) ) ( OBJ-AT ?auto_135654 ?auto_135657 ) ( OBJ-AT ?auto_135653 ?auto_135657 ) ( IN-CITY ?auto_135658 ?auto_135661 ) ( not ( = ?auto_135651 ?auto_135658 ) ) ( OBJ-AT ?auto_135656 ?auto_135658 ) ( TRUCK-AT ?auto_135659 ?auto_135651 ) ( not ( = ?auto_135656 ?auto_135653 ) ) ( not ( = ?auto_135657 ?auto_135658 ) ) ( not ( = ?auto_135656 ?auto_135654 ) ) ( not ( = ?auto_135653 ?auto_135654 ) ) ( not ( = ?auto_135656 ?auto_135652 ) ) ( not ( = ?auto_135653 ?auto_135652 ) ) ( not ( = ?auto_135654 ?auto_135652 ) ) ( not ( = ?auto_135660 ?auto_135657 ) ) ( not ( = ?auto_135660 ?auto_135658 ) ) ( not ( = ?auto_135656 ?auto_135655 ) ) ( not ( = ?auto_135653 ?auto_135655 ) ) ( not ( = ?auto_135654 ?auto_135655 ) ) ( not ( = ?auto_135652 ?auto_135655 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_135656 ?auto_135653 ?auto_135654 ?auto_135655 ?auto_135652 ?auto_135651 )
      ( DELIVER-5PKG-VERIFY ?auto_135652 ?auto_135653 ?auto_135654 ?auto_135655 ?auto_135656 ?auto_135651 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_135848 - OBJ
      ?auto_135849 - OBJ
      ?auto_135850 - OBJ
      ?auto_135851 - OBJ
      ?auto_135852 - OBJ
      ?auto_135847 - LOCATION
    )
    :vars
    (
      ?auto_135856 - LOCATION
      ?auto_135857 - CITY
      ?auto_135853 - LOCATION
      ?auto_135854 - LOCATION
      ?auto_135855 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135856 ?auto_135857 ) ( IN-CITY ?auto_135847 ?auto_135857 ) ( not ( = ?auto_135847 ?auto_135856 ) ) ( OBJ-AT ?auto_135850 ?auto_135856 ) ( OBJ-AT ?auto_135848 ?auto_135856 ) ( IN-CITY ?auto_135853 ?auto_135857 ) ( not ( = ?auto_135847 ?auto_135853 ) ) ( OBJ-AT ?auto_135852 ?auto_135853 ) ( OBJ-AT ?auto_135849 ?auto_135853 ) ( IN-CITY ?auto_135854 ?auto_135857 ) ( not ( = ?auto_135847 ?auto_135854 ) ) ( OBJ-AT ?auto_135851 ?auto_135854 ) ( TRUCK-AT ?auto_135855 ?auto_135847 ) ( not ( = ?auto_135851 ?auto_135849 ) ) ( not ( = ?auto_135853 ?auto_135854 ) ) ( not ( = ?auto_135851 ?auto_135852 ) ) ( not ( = ?auto_135849 ?auto_135852 ) ) ( not ( = ?auto_135851 ?auto_135848 ) ) ( not ( = ?auto_135849 ?auto_135848 ) ) ( not ( = ?auto_135852 ?auto_135848 ) ) ( not ( = ?auto_135856 ?auto_135853 ) ) ( not ( = ?auto_135856 ?auto_135854 ) ) ( not ( = ?auto_135851 ?auto_135850 ) ) ( not ( = ?auto_135849 ?auto_135850 ) ) ( not ( = ?auto_135852 ?auto_135850 ) ) ( not ( = ?auto_135848 ?auto_135850 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_135851 ?auto_135849 ?auto_135852 ?auto_135850 ?auto_135848 ?auto_135847 )
      ( DELIVER-5PKG-VERIFY ?auto_135848 ?auto_135849 ?auto_135850 ?auto_135851 ?auto_135852 ?auto_135847 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_135946 - OBJ
      ?auto_135947 - OBJ
      ?auto_135948 - OBJ
      ?auto_135949 - OBJ
      ?auto_135950 - OBJ
      ?auto_135945 - LOCATION
    )
    :vars
    (
      ?auto_135954 - LOCATION
      ?auto_135955 - CITY
      ?auto_135951 - LOCATION
      ?auto_135952 - LOCATION
      ?auto_135953 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_135954 ?auto_135955 ) ( IN-CITY ?auto_135945 ?auto_135955 ) ( not ( = ?auto_135945 ?auto_135954 ) ) ( OBJ-AT ?auto_135948 ?auto_135954 ) ( OBJ-AT ?auto_135946 ?auto_135954 ) ( IN-CITY ?auto_135951 ?auto_135955 ) ( not ( = ?auto_135945 ?auto_135951 ) ) ( OBJ-AT ?auto_135949 ?auto_135951 ) ( OBJ-AT ?auto_135947 ?auto_135951 ) ( IN-CITY ?auto_135952 ?auto_135955 ) ( not ( = ?auto_135945 ?auto_135952 ) ) ( OBJ-AT ?auto_135950 ?auto_135952 ) ( TRUCK-AT ?auto_135953 ?auto_135945 ) ( not ( = ?auto_135950 ?auto_135947 ) ) ( not ( = ?auto_135951 ?auto_135952 ) ) ( not ( = ?auto_135950 ?auto_135949 ) ) ( not ( = ?auto_135947 ?auto_135949 ) ) ( not ( = ?auto_135950 ?auto_135946 ) ) ( not ( = ?auto_135947 ?auto_135946 ) ) ( not ( = ?auto_135949 ?auto_135946 ) ) ( not ( = ?auto_135954 ?auto_135951 ) ) ( not ( = ?auto_135954 ?auto_135952 ) ) ( not ( = ?auto_135950 ?auto_135948 ) ) ( not ( = ?auto_135947 ?auto_135948 ) ) ( not ( = ?auto_135949 ?auto_135948 ) ) ( not ( = ?auto_135946 ?auto_135948 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_135950 ?auto_135947 ?auto_135949 ?auto_135948 ?auto_135946 ?auto_135945 )
      ( DELIVER-5PKG-VERIFY ?auto_135946 ?auto_135947 ?auto_135948 ?auto_135949 ?auto_135950 ?auto_135945 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_136143 - OBJ
      ?auto_136144 - OBJ
      ?auto_136145 - OBJ
      ?auto_136146 - OBJ
      ?auto_136147 - OBJ
      ?auto_136142 - LOCATION
    )
    :vars
    (
      ?auto_136151 - LOCATION
      ?auto_136152 - CITY
      ?auto_136148 - LOCATION
      ?auto_136149 - LOCATION
      ?auto_136150 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136151 ?auto_136152 ) ( IN-CITY ?auto_136142 ?auto_136152 ) ( not ( = ?auto_136142 ?auto_136151 ) ) ( OBJ-AT ?auto_136147 ?auto_136151 ) ( OBJ-AT ?auto_136143 ?auto_136151 ) ( IN-CITY ?auto_136148 ?auto_136152 ) ( not ( = ?auto_136142 ?auto_136148 ) ) ( OBJ-AT ?auto_136144 ?auto_136148 ) ( OBJ-AT ?auto_136146 ?auto_136148 ) ( IN-CITY ?auto_136149 ?auto_136152 ) ( not ( = ?auto_136142 ?auto_136149 ) ) ( OBJ-AT ?auto_136145 ?auto_136149 ) ( TRUCK-AT ?auto_136150 ?auto_136142 ) ( not ( = ?auto_136145 ?auto_136146 ) ) ( not ( = ?auto_136148 ?auto_136149 ) ) ( not ( = ?auto_136145 ?auto_136144 ) ) ( not ( = ?auto_136146 ?auto_136144 ) ) ( not ( = ?auto_136145 ?auto_136143 ) ) ( not ( = ?auto_136146 ?auto_136143 ) ) ( not ( = ?auto_136144 ?auto_136143 ) ) ( not ( = ?auto_136151 ?auto_136148 ) ) ( not ( = ?auto_136151 ?auto_136149 ) ) ( not ( = ?auto_136145 ?auto_136147 ) ) ( not ( = ?auto_136146 ?auto_136147 ) ) ( not ( = ?auto_136144 ?auto_136147 ) ) ( not ( = ?auto_136143 ?auto_136147 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_136145 ?auto_136146 ?auto_136144 ?auto_136147 ?auto_136143 ?auto_136142 )
      ( DELIVER-5PKG-VERIFY ?auto_136143 ?auto_136144 ?auto_136145 ?auto_136146 ?auto_136147 ?auto_136142 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_136190 - OBJ
      ?auto_136191 - OBJ
      ?auto_136192 - OBJ
      ?auto_136193 - OBJ
      ?auto_136194 - OBJ
      ?auto_136189 - LOCATION
    )
    :vars
    (
      ?auto_136198 - LOCATION
      ?auto_136199 - CITY
      ?auto_136195 - LOCATION
      ?auto_136196 - LOCATION
      ?auto_136197 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136198 ?auto_136199 ) ( IN-CITY ?auto_136189 ?auto_136199 ) ( not ( = ?auto_136189 ?auto_136198 ) ) ( OBJ-AT ?auto_136193 ?auto_136198 ) ( OBJ-AT ?auto_136190 ?auto_136198 ) ( IN-CITY ?auto_136195 ?auto_136199 ) ( not ( = ?auto_136189 ?auto_136195 ) ) ( OBJ-AT ?auto_136191 ?auto_136195 ) ( OBJ-AT ?auto_136194 ?auto_136195 ) ( IN-CITY ?auto_136196 ?auto_136199 ) ( not ( = ?auto_136189 ?auto_136196 ) ) ( OBJ-AT ?auto_136192 ?auto_136196 ) ( TRUCK-AT ?auto_136197 ?auto_136189 ) ( not ( = ?auto_136192 ?auto_136194 ) ) ( not ( = ?auto_136195 ?auto_136196 ) ) ( not ( = ?auto_136192 ?auto_136191 ) ) ( not ( = ?auto_136194 ?auto_136191 ) ) ( not ( = ?auto_136192 ?auto_136190 ) ) ( not ( = ?auto_136194 ?auto_136190 ) ) ( not ( = ?auto_136191 ?auto_136190 ) ) ( not ( = ?auto_136198 ?auto_136195 ) ) ( not ( = ?auto_136198 ?auto_136196 ) ) ( not ( = ?auto_136192 ?auto_136193 ) ) ( not ( = ?auto_136194 ?auto_136193 ) ) ( not ( = ?auto_136191 ?auto_136193 ) ) ( not ( = ?auto_136190 ?auto_136193 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_136192 ?auto_136194 ?auto_136191 ?auto_136193 ?auto_136190 ?auto_136189 )
      ( DELIVER-5PKG-VERIFY ?auto_136190 ?auto_136191 ?auto_136192 ?auto_136193 ?auto_136194 ?auto_136189 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_136237 - OBJ
      ?auto_136238 - OBJ
      ?auto_136239 - OBJ
      ?auto_136240 - OBJ
      ?auto_136241 - OBJ
      ?auto_136236 - LOCATION
    )
    :vars
    (
      ?auto_136245 - LOCATION
      ?auto_136246 - CITY
      ?auto_136242 - LOCATION
      ?auto_136243 - LOCATION
      ?auto_136244 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136245 ?auto_136246 ) ( IN-CITY ?auto_136236 ?auto_136246 ) ( not ( = ?auto_136236 ?auto_136245 ) ) ( OBJ-AT ?auto_136241 ?auto_136245 ) ( OBJ-AT ?auto_136237 ?auto_136245 ) ( IN-CITY ?auto_136242 ?auto_136246 ) ( not ( = ?auto_136236 ?auto_136242 ) ) ( OBJ-AT ?auto_136238 ?auto_136242 ) ( OBJ-AT ?auto_136239 ?auto_136242 ) ( IN-CITY ?auto_136243 ?auto_136246 ) ( not ( = ?auto_136236 ?auto_136243 ) ) ( OBJ-AT ?auto_136240 ?auto_136243 ) ( TRUCK-AT ?auto_136244 ?auto_136236 ) ( not ( = ?auto_136240 ?auto_136239 ) ) ( not ( = ?auto_136242 ?auto_136243 ) ) ( not ( = ?auto_136240 ?auto_136238 ) ) ( not ( = ?auto_136239 ?auto_136238 ) ) ( not ( = ?auto_136240 ?auto_136237 ) ) ( not ( = ?auto_136239 ?auto_136237 ) ) ( not ( = ?auto_136238 ?auto_136237 ) ) ( not ( = ?auto_136245 ?auto_136242 ) ) ( not ( = ?auto_136245 ?auto_136243 ) ) ( not ( = ?auto_136240 ?auto_136241 ) ) ( not ( = ?auto_136239 ?auto_136241 ) ) ( not ( = ?auto_136238 ?auto_136241 ) ) ( not ( = ?auto_136237 ?auto_136241 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_136240 ?auto_136239 ?auto_136238 ?auto_136241 ?auto_136237 ?auto_136236 )
      ( DELIVER-5PKG-VERIFY ?auto_136237 ?auto_136238 ?auto_136239 ?auto_136240 ?auto_136241 ?auto_136236 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_136284 - OBJ
      ?auto_136285 - OBJ
      ?auto_136286 - OBJ
      ?auto_136287 - OBJ
      ?auto_136288 - OBJ
      ?auto_136283 - LOCATION
    )
    :vars
    (
      ?auto_136292 - LOCATION
      ?auto_136293 - CITY
      ?auto_136289 - LOCATION
      ?auto_136290 - LOCATION
      ?auto_136291 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136292 ?auto_136293 ) ( IN-CITY ?auto_136283 ?auto_136293 ) ( not ( = ?auto_136283 ?auto_136292 ) ) ( OBJ-AT ?auto_136287 ?auto_136292 ) ( OBJ-AT ?auto_136284 ?auto_136292 ) ( IN-CITY ?auto_136289 ?auto_136293 ) ( not ( = ?auto_136283 ?auto_136289 ) ) ( OBJ-AT ?auto_136285 ?auto_136289 ) ( OBJ-AT ?auto_136286 ?auto_136289 ) ( IN-CITY ?auto_136290 ?auto_136293 ) ( not ( = ?auto_136283 ?auto_136290 ) ) ( OBJ-AT ?auto_136288 ?auto_136290 ) ( TRUCK-AT ?auto_136291 ?auto_136283 ) ( not ( = ?auto_136288 ?auto_136286 ) ) ( not ( = ?auto_136289 ?auto_136290 ) ) ( not ( = ?auto_136288 ?auto_136285 ) ) ( not ( = ?auto_136286 ?auto_136285 ) ) ( not ( = ?auto_136288 ?auto_136284 ) ) ( not ( = ?auto_136286 ?auto_136284 ) ) ( not ( = ?auto_136285 ?auto_136284 ) ) ( not ( = ?auto_136292 ?auto_136289 ) ) ( not ( = ?auto_136292 ?auto_136290 ) ) ( not ( = ?auto_136288 ?auto_136287 ) ) ( not ( = ?auto_136286 ?auto_136287 ) ) ( not ( = ?auto_136285 ?auto_136287 ) ) ( not ( = ?auto_136284 ?auto_136287 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_136288 ?auto_136286 ?auto_136285 ?auto_136287 ?auto_136284 ?auto_136283 )
      ( DELIVER-5PKG-VERIFY ?auto_136284 ?auto_136285 ?auto_136286 ?auto_136287 ?auto_136288 ?auto_136283 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_136581 - OBJ
      ?auto_136582 - OBJ
      ?auto_136583 - OBJ
      ?auto_136584 - OBJ
      ?auto_136585 - OBJ
      ?auto_136580 - LOCATION
    )
    :vars
    (
      ?auto_136589 - LOCATION
      ?auto_136590 - CITY
      ?auto_136586 - LOCATION
      ?auto_136587 - LOCATION
      ?auto_136588 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136589 ?auto_136590 ) ( IN-CITY ?auto_136580 ?auto_136590 ) ( not ( = ?auto_136580 ?auto_136589 ) ) ( OBJ-AT ?auto_136583 ?auto_136589 ) ( OBJ-AT ?auto_136581 ?auto_136589 ) ( IN-CITY ?auto_136586 ?auto_136590 ) ( not ( = ?auto_136580 ?auto_136586 ) ) ( OBJ-AT ?auto_136582 ?auto_136586 ) ( OBJ-AT ?auto_136585 ?auto_136586 ) ( IN-CITY ?auto_136587 ?auto_136590 ) ( not ( = ?auto_136580 ?auto_136587 ) ) ( OBJ-AT ?auto_136584 ?auto_136587 ) ( TRUCK-AT ?auto_136588 ?auto_136580 ) ( not ( = ?auto_136584 ?auto_136585 ) ) ( not ( = ?auto_136586 ?auto_136587 ) ) ( not ( = ?auto_136584 ?auto_136582 ) ) ( not ( = ?auto_136585 ?auto_136582 ) ) ( not ( = ?auto_136584 ?auto_136581 ) ) ( not ( = ?auto_136585 ?auto_136581 ) ) ( not ( = ?auto_136582 ?auto_136581 ) ) ( not ( = ?auto_136589 ?auto_136586 ) ) ( not ( = ?auto_136589 ?auto_136587 ) ) ( not ( = ?auto_136584 ?auto_136583 ) ) ( not ( = ?auto_136585 ?auto_136583 ) ) ( not ( = ?auto_136582 ?auto_136583 ) ) ( not ( = ?auto_136581 ?auto_136583 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_136584 ?auto_136585 ?auto_136582 ?auto_136583 ?auto_136581 ?auto_136580 )
      ( DELIVER-5PKG-VERIFY ?auto_136581 ?auto_136582 ?auto_136583 ?auto_136584 ?auto_136585 ?auto_136580 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_136628 - OBJ
      ?auto_136629 - OBJ
      ?auto_136630 - OBJ
      ?auto_136631 - OBJ
      ?auto_136632 - OBJ
      ?auto_136627 - LOCATION
    )
    :vars
    (
      ?auto_136636 - LOCATION
      ?auto_136637 - CITY
      ?auto_136633 - LOCATION
      ?auto_136634 - LOCATION
      ?auto_136635 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136636 ?auto_136637 ) ( IN-CITY ?auto_136627 ?auto_136637 ) ( not ( = ?auto_136627 ?auto_136636 ) ) ( OBJ-AT ?auto_136630 ?auto_136636 ) ( OBJ-AT ?auto_136628 ?auto_136636 ) ( IN-CITY ?auto_136633 ?auto_136637 ) ( not ( = ?auto_136627 ?auto_136633 ) ) ( OBJ-AT ?auto_136629 ?auto_136633 ) ( OBJ-AT ?auto_136631 ?auto_136633 ) ( IN-CITY ?auto_136634 ?auto_136637 ) ( not ( = ?auto_136627 ?auto_136634 ) ) ( OBJ-AT ?auto_136632 ?auto_136634 ) ( TRUCK-AT ?auto_136635 ?auto_136627 ) ( not ( = ?auto_136632 ?auto_136631 ) ) ( not ( = ?auto_136633 ?auto_136634 ) ) ( not ( = ?auto_136632 ?auto_136629 ) ) ( not ( = ?auto_136631 ?auto_136629 ) ) ( not ( = ?auto_136632 ?auto_136628 ) ) ( not ( = ?auto_136631 ?auto_136628 ) ) ( not ( = ?auto_136629 ?auto_136628 ) ) ( not ( = ?auto_136636 ?auto_136633 ) ) ( not ( = ?auto_136636 ?auto_136634 ) ) ( not ( = ?auto_136632 ?auto_136630 ) ) ( not ( = ?auto_136631 ?auto_136630 ) ) ( not ( = ?auto_136629 ?auto_136630 ) ) ( not ( = ?auto_136628 ?auto_136630 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_136632 ?auto_136631 ?auto_136629 ?auto_136630 ?auto_136628 ?auto_136627 )
      ( DELIVER-5PKG-VERIFY ?auto_136628 ?auto_136629 ?auto_136630 ?auto_136631 ?auto_136632 ?auto_136627 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_137745 - OBJ
      ?auto_137746 - OBJ
      ?auto_137747 - OBJ
      ?auto_137748 - OBJ
      ?auto_137749 - OBJ
      ?auto_137744 - LOCATION
    )
    :vars
    (
      ?auto_137753 - LOCATION
      ?auto_137754 - CITY
      ?auto_137750 - LOCATION
      ?auto_137751 - LOCATION
      ?auto_137752 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137753 ?auto_137754 ) ( IN-CITY ?auto_137744 ?auto_137754 ) ( not ( = ?auto_137744 ?auto_137753 ) ) ( OBJ-AT ?auto_137746 ?auto_137753 ) ( OBJ-AT ?auto_137745 ?auto_137753 ) ( IN-CITY ?auto_137750 ?auto_137754 ) ( not ( = ?auto_137744 ?auto_137750 ) ) ( OBJ-AT ?auto_137749 ?auto_137750 ) ( OBJ-AT ?auto_137748 ?auto_137750 ) ( IN-CITY ?auto_137751 ?auto_137754 ) ( not ( = ?auto_137744 ?auto_137751 ) ) ( OBJ-AT ?auto_137747 ?auto_137751 ) ( TRUCK-AT ?auto_137752 ?auto_137744 ) ( not ( = ?auto_137747 ?auto_137748 ) ) ( not ( = ?auto_137750 ?auto_137751 ) ) ( not ( = ?auto_137747 ?auto_137749 ) ) ( not ( = ?auto_137748 ?auto_137749 ) ) ( not ( = ?auto_137747 ?auto_137745 ) ) ( not ( = ?auto_137748 ?auto_137745 ) ) ( not ( = ?auto_137749 ?auto_137745 ) ) ( not ( = ?auto_137753 ?auto_137750 ) ) ( not ( = ?auto_137753 ?auto_137751 ) ) ( not ( = ?auto_137747 ?auto_137746 ) ) ( not ( = ?auto_137748 ?auto_137746 ) ) ( not ( = ?auto_137749 ?auto_137746 ) ) ( not ( = ?auto_137745 ?auto_137746 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_137747 ?auto_137748 ?auto_137749 ?auto_137746 ?auto_137745 ?auto_137744 )
      ( DELIVER-5PKG-VERIFY ?auto_137745 ?auto_137746 ?auto_137747 ?auto_137748 ?auto_137749 ?auto_137744 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_137792 - OBJ
      ?auto_137793 - OBJ
      ?auto_137794 - OBJ
      ?auto_137795 - OBJ
      ?auto_137796 - OBJ
      ?auto_137791 - LOCATION
    )
    :vars
    (
      ?auto_137800 - LOCATION
      ?auto_137801 - CITY
      ?auto_137797 - LOCATION
      ?auto_137798 - LOCATION
      ?auto_137799 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137800 ?auto_137801 ) ( IN-CITY ?auto_137791 ?auto_137801 ) ( not ( = ?auto_137791 ?auto_137800 ) ) ( OBJ-AT ?auto_137793 ?auto_137800 ) ( OBJ-AT ?auto_137792 ?auto_137800 ) ( IN-CITY ?auto_137797 ?auto_137801 ) ( not ( = ?auto_137791 ?auto_137797 ) ) ( OBJ-AT ?auto_137795 ?auto_137797 ) ( OBJ-AT ?auto_137796 ?auto_137797 ) ( IN-CITY ?auto_137798 ?auto_137801 ) ( not ( = ?auto_137791 ?auto_137798 ) ) ( OBJ-AT ?auto_137794 ?auto_137798 ) ( TRUCK-AT ?auto_137799 ?auto_137791 ) ( not ( = ?auto_137794 ?auto_137796 ) ) ( not ( = ?auto_137797 ?auto_137798 ) ) ( not ( = ?auto_137794 ?auto_137795 ) ) ( not ( = ?auto_137796 ?auto_137795 ) ) ( not ( = ?auto_137794 ?auto_137792 ) ) ( not ( = ?auto_137796 ?auto_137792 ) ) ( not ( = ?auto_137795 ?auto_137792 ) ) ( not ( = ?auto_137800 ?auto_137797 ) ) ( not ( = ?auto_137800 ?auto_137798 ) ) ( not ( = ?auto_137794 ?auto_137793 ) ) ( not ( = ?auto_137796 ?auto_137793 ) ) ( not ( = ?auto_137795 ?auto_137793 ) ) ( not ( = ?auto_137792 ?auto_137793 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_137794 ?auto_137796 ?auto_137795 ?auto_137793 ?auto_137792 ?auto_137791 )
      ( DELIVER-5PKG-VERIFY ?auto_137792 ?auto_137793 ?auto_137794 ?auto_137795 ?auto_137796 ?auto_137791 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_137989 - OBJ
      ?auto_137990 - OBJ
      ?auto_137991 - OBJ
      ?auto_137992 - OBJ
      ?auto_137993 - OBJ
      ?auto_137988 - LOCATION
    )
    :vars
    (
      ?auto_137997 - LOCATION
      ?auto_137998 - CITY
      ?auto_137994 - LOCATION
      ?auto_137995 - LOCATION
      ?auto_137996 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137997 ?auto_137998 ) ( IN-CITY ?auto_137988 ?auto_137998 ) ( not ( = ?auto_137988 ?auto_137997 ) ) ( OBJ-AT ?auto_137990 ?auto_137997 ) ( OBJ-AT ?auto_137989 ?auto_137997 ) ( IN-CITY ?auto_137994 ?auto_137998 ) ( not ( = ?auto_137988 ?auto_137994 ) ) ( OBJ-AT ?auto_137993 ?auto_137994 ) ( OBJ-AT ?auto_137991 ?auto_137994 ) ( IN-CITY ?auto_137995 ?auto_137998 ) ( not ( = ?auto_137988 ?auto_137995 ) ) ( OBJ-AT ?auto_137992 ?auto_137995 ) ( TRUCK-AT ?auto_137996 ?auto_137988 ) ( not ( = ?auto_137992 ?auto_137991 ) ) ( not ( = ?auto_137994 ?auto_137995 ) ) ( not ( = ?auto_137992 ?auto_137993 ) ) ( not ( = ?auto_137991 ?auto_137993 ) ) ( not ( = ?auto_137992 ?auto_137989 ) ) ( not ( = ?auto_137991 ?auto_137989 ) ) ( not ( = ?auto_137993 ?auto_137989 ) ) ( not ( = ?auto_137997 ?auto_137994 ) ) ( not ( = ?auto_137997 ?auto_137995 ) ) ( not ( = ?auto_137992 ?auto_137990 ) ) ( not ( = ?auto_137991 ?auto_137990 ) ) ( not ( = ?auto_137993 ?auto_137990 ) ) ( not ( = ?auto_137989 ?auto_137990 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_137992 ?auto_137991 ?auto_137993 ?auto_137990 ?auto_137989 ?auto_137988 )
      ( DELIVER-5PKG-VERIFY ?auto_137989 ?auto_137990 ?auto_137991 ?auto_137992 ?auto_137993 ?auto_137988 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_138087 - OBJ
      ?auto_138088 - OBJ
      ?auto_138089 - OBJ
      ?auto_138090 - OBJ
      ?auto_138091 - OBJ
      ?auto_138086 - LOCATION
    )
    :vars
    (
      ?auto_138095 - LOCATION
      ?auto_138096 - CITY
      ?auto_138092 - LOCATION
      ?auto_138093 - LOCATION
      ?auto_138094 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138095 ?auto_138096 ) ( IN-CITY ?auto_138086 ?auto_138096 ) ( not ( = ?auto_138086 ?auto_138095 ) ) ( OBJ-AT ?auto_138088 ?auto_138095 ) ( OBJ-AT ?auto_138087 ?auto_138095 ) ( IN-CITY ?auto_138092 ?auto_138096 ) ( not ( = ?auto_138086 ?auto_138092 ) ) ( OBJ-AT ?auto_138090 ?auto_138092 ) ( OBJ-AT ?auto_138089 ?auto_138092 ) ( IN-CITY ?auto_138093 ?auto_138096 ) ( not ( = ?auto_138086 ?auto_138093 ) ) ( OBJ-AT ?auto_138091 ?auto_138093 ) ( TRUCK-AT ?auto_138094 ?auto_138086 ) ( not ( = ?auto_138091 ?auto_138089 ) ) ( not ( = ?auto_138092 ?auto_138093 ) ) ( not ( = ?auto_138091 ?auto_138090 ) ) ( not ( = ?auto_138089 ?auto_138090 ) ) ( not ( = ?auto_138091 ?auto_138087 ) ) ( not ( = ?auto_138089 ?auto_138087 ) ) ( not ( = ?auto_138090 ?auto_138087 ) ) ( not ( = ?auto_138095 ?auto_138092 ) ) ( not ( = ?auto_138095 ?auto_138093 ) ) ( not ( = ?auto_138091 ?auto_138088 ) ) ( not ( = ?auto_138089 ?auto_138088 ) ) ( not ( = ?auto_138090 ?auto_138088 ) ) ( not ( = ?auto_138087 ?auto_138088 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_138091 ?auto_138089 ?auto_138090 ?auto_138088 ?auto_138087 ?auto_138086 )
      ( DELIVER-5PKG-VERIFY ?auto_138087 ?auto_138088 ?auto_138089 ?auto_138090 ?auto_138091 ?auto_138086 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_138284 - OBJ
      ?auto_138285 - OBJ
      ?auto_138286 - OBJ
      ?auto_138287 - OBJ
      ?auto_138288 - OBJ
      ?auto_138283 - LOCATION
    )
    :vars
    (
      ?auto_138292 - LOCATION
      ?auto_138293 - CITY
      ?auto_138289 - LOCATION
      ?auto_138290 - LOCATION
      ?auto_138291 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138292 ?auto_138293 ) ( IN-CITY ?auto_138283 ?auto_138293 ) ( not ( = ?auto_138283 ?auto_138292 ) ) ( OBJ-AT ?auto_138285 ?auto_138292 ) ( OBJ-AT ?auto_138284 ?auto_138292 ) ( IN-CITY ?auto_138289 ?auto_138293 ) ( not ( = ?auto_138283 ?auto_138289 ) ) ( OBJ-AT ?auto_138286 ?auto_138289 ) ( OBJ-AT ?auto_138288 ?auto_138289 ) ( IN-CITY ?auto_138290 ?auto_138293 ) ( not ( = ?auto_138283 ?auto_138290 ) ) ( OBJ-AT ?auto_138287 ?auto_138290 ) ( TRUCK-AT ?auto_138291 ?auto_138283 ) ( not ( = ?auto_138287 ?auto_138288 ) ) ( not ( = ?auto_138289 ?auto_138290 ) ) ( not ( = ?auto_138287 ?auto_138286 ) ) ( not ( = ?auto_138288 ?auto_138286 ) ) ( not ( = ?auto_138287 ?auto_138284 ) ) ( not ( = ?auto_138288 ?auto_138284 ) ) ( not ( = ?auto_138286 ?auto_138284 ) ) ( not ( = ?auto_138292 ?auto_138289 ) ) ( not ( = ?auto_138292 ?auto_138290 ) ) ( not ( = ?auto_138287 ?auto_138285 ) ) ( not ( = ?auto_138288 ?auto_138285 ) ) ( not ( = ?auto_138286 ?auto_138285 ) ) ( not ( = ?auto_138284 ?auto_138285 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_138287 ?auto_138288 ?auto_138286 ?auto_138285 ?auto_138284 ?auto_138283 )
      ( DELIVER-5PKG-VERIFY ?auto_138284 ?auto_138285 ?auto_138286 ?auto_138287 ?auto_138288 ?auto_138283 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_138331 - OBJ
      ?auto_138332 - OBJ
      ?auto_138333 - OBJ
      ?auto_138334 - OBJ
      ?auto_138335 - OBJ
      ?auto_138330 - LOCATION
    )
    :vars
    (
      ?auto_138339 - LOCATION
      ?auto_138340 - CITY
      ?auto_138336 - LOCATION
      ?auto_138337 - LOCATION
      ?auto_138338 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_138339 ?auto_138340 ) ( IN-CITY ?auto_138330 ?auto_138340 ) ( not ( = ?auto_138330 ?auto_138339 ) ) ( OBJ-AT ?auto_138332 ?auto_138339 ) ( OBJ-AT ?auto_138331 ?auto_138339 ) ( IN-CITY ?auto_138336 ?auto_138340 ) ( not ( = ?auto_138330 ?auto_138336 ) ) ( OBJ-AT ?auto_138333 ?auto_138336 ) ( OBJ-AT ?auto_138334 ?auto_138336 ) ( IN-CITY ?auto_138337 ?auto_138340 ) ( not ( = ?auto_138330 ?auto_138337 ) ) ( OBJ-AT ?auto_138335 ?auto_138337 ) ( TRUCK-AT ?auto_138338 ?auto_138330 ) ( not ( = ?auto_138335 ?auto_138334 ) ) ( not ( = ?auto_138336 ?auto_138337 ) ) ( not ( = ?auto_138335 ?auto_138333 ) ) ( not ( = ?auto_138334 ?auto_138333 ) ) ( not ( = ?auto_138335 ?auto_138331 ) ) ( not ( = ?auto_138334 ?auto_138331 ) ) ( not ( = ?auto_138333 ?auto_138331 ) ) ( not ( = ?auto_138339 ?auto_138336 ) ) ( not ( = ?auto_138339 ?auto_138337 ) ) ( not ( = ?auto_138335 ?auto_138332 ) ) ( not ( = ?auto_138334 ?auto_138332 ) ) ( not ( = ?auto_138333 ?auto_138332 ) ) ( not ( = ?auto_138331 ?auto_138332 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_138335 ?auto_138334 ?auto_138333 ?auto_138332 ?auto_138331 ?auto_138330 )
      ( DELIVER-5PKG-VERIFY ?auto_138331 ?auto_138332 ?auto_138333 ?auto_138334 ?auto_138335 ?auto_138330 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_139710 - OBJ
      ?auto_139711 - OBJ
      ?auto_139712 - OBJ
      ?auto_139713 - OBJ
      ?auto_139714 - OBJ
      ?auto_139709 - LOCATION
    )
    :vars
    (
      ?auto_139718 - LOCATION
      ?auto_139719 - CITY
      ?auto_139715 - LOCATION
      ?auto_139716 - LOCATION
      ?auto_139717 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139718 ?auto_139719 ) ( IN-CITY ?auto_139709 ?auto_139719 ) ( not ( = ?auto_139709 ?auto_139718 ) ) ( OBJ-AT ?auto_139710 ?auto_139718 ) ( OBJ-AT ?auto_139714 ?auto_139718 ) ( IN-CITY ?auto_139715 ?auto_139719 ) ( not ( = ?auto_139709 ?auto_139715 ) ) ( OBJ-AT ?auto_139713 ?auto_139715 ) ( OBJ-AT ?auto_139712 ?auto_139715 ) ( IN-CITY ?auto_139716 ?auto_139719 ) ( not ( = ?auto_139709 ?auto_139716 ) ) ( OBJ-AT ?auto_139711 ?auto_139716 ) ( TRUCK-AT ?auto_139717 ?auto_139709 ) ( not ( = ?auto_139711 ?auto_139712 ) ) ( not ( = ?auto_139715 ?auto_139716 ) ) ( not ( = ?auto_139711 ?auto_139713 ) ) ( not ( = ?auto_139712 ?auto_139713 ) ) ( not ( = ?auto_139711 ?auto_139714 ) ) ( not ( = ?auto_139712 ?auto_139714 ) ) ( not ( = ?auto_139713 ?auto_139714 ) ) ( not ( = ?auto_139718 ?auto_139715 ) ) ( not ( = ?auto_139718 ?auto_139716 ) ) ( not ( = ?auto_139711 ?auto_139710 ) ) ( not ( = ?auto_139712 ?auto_139710 ) ) ( not ( = ?auto_139713 ?auto_139710 ) ) ( not ( = ?auto_139714 ?auto_139710 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_139711 ?auto_139712 ?auto_139713 ?auto_139710 ?auto_139714 ?auto_139709 )
      ( DELIVER-5PKG-VERIFY ?auto_139710 ?auto_139711 ?auto_139712 ?auto_139713 ?auto_139714 ?auto_139709 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_139757 - OBJ
      ?auto_139758 - OBJ
      ?auto_139759 - OBJ
      ?auto_139760 - OBJ
      ?auto_139761 - OBJ
      ?auto_139756 - LOCATION
    )
    :vars
    (
      ?auto_139765 - LOCATION
      ?auto_139766 - CITY
      ?auto_139762 - LOCATION
      ?auto_139763 - LOCATION
      ?auto_139764 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139765 ?auto_139766 ) ( IN-CITY ?auto_139756 ?auto_139766 ) ( not ( = ?auto_139756 ?auto_139765 ) ) ( OBJ-AT ?auto_139757 ?auto_139765 ) ( OBJ-AT ?auto_139760 ?auto_139765 ) ( IN-CITY ?auto_139762 ?auto_139766 ) ( not ( = ?auto_139756 ?auto_139762 ) ) ( OBJ-AT ?auto_139761 ?auto_139762 ) ( OBJ-AT ?auto_139759 ?auto_139762 ) ( IN-CITY ?auto_139763 ?auto_139766 ) ( not ( = ?auto_139756 ?auto_139763 ) ) ( OBJ-AT ?auto_139758 ?auto_139763 ) ( TRUCK-AT ?auto_139764 ?auto_139756 ) ( not ( = ?auto_139758 ?auto_139759 ) ) ( not ( = ?auto_139762 ?auto_139763 ) ) ( not ( = ?auto_139758 ?auto_139761 ) ) ( not ( = ?auto_139759 ?auto_139761 ) ) ( not ( = ?auto_139758 ?auto_139760 ) ) ( not ( = ?auto_139759 ?auto_139760 ) ) ( not ( = ?auto_139761 ?auto_139760 ) ) ( not ( = ?auto_139765 ?auto_139762 ) ) ( not ( = ?auto_139765 ?auto_139763 ) ) ( not ( = ?auto_139758 ?auto_139757 ) ) ( not ( = ?auto_139759 ?auto_139757 ) ) ( not ( = ?auto_139761 ?auto_139757 ) ) ( not ( = ?auto_139760 ?auto_139757 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_139758 ?auto_139759 ?auto_139761 ?auto_139757 ?auto_139760 ?auto_139756 )
      ( DELIVER-5PKG-VERIFY ?auto_139757 ?auto_139758 ?auto_139759 ?auto_139760 ?auto_139761 ?auto_139756 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_139954 - OBJ
      ?auto_139955 - OBJ
      ?auto_139956 - OBJ
      ?auto_139957 - OBJ
      ?auto_139958 - OBJ
      ?auto_139953 - LOCATION
    )
    :vars
    (
      ?auto_139962 - LOCATION
      ?auto_139963 - CITY
      ?auto_139959 - LOCATION
      ?auto_139960 - LOCATION
      ?auto_139961 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_139962 ?auto_139963 ) ( IN-CITY ?auto_139953 ?auto_139963 ) ( not ( = ?auto_139953 ?auto_139962 ) ) ( OBJ-AT ?auto_139954 ?auto_139962 ) ( OBJ-AT ?auto_139958 ?auto_139962 ) ( IN-CITY ?auto_139959 ?auto_139963 ) ( not ( = ?auto_139953 ?auto_139959 ) ) ( OBJ-AT ?auto_139956 ?auto_139959 ) ( OBJ-AT ?auto_139957 ?auto_139959 ) ( IN-CITY ?auto_139960 ?auto_139963 ) ( not ( = ?auto_139953 ?auto_139960 ) ) ( OBJ-AT ?auto_139955 ?auto_139960 ) ( TRUCK-AT ?auto_139961 ?auto_139953 ) ( not ( = ?auto_139955 ?auto_139957 ) ) ( not ( = ?auto_139959 ?auto_139960 ) ) ( not ( = ?auto_139955 ?auto_139956 ) ) ( not ( = ?auto_139957 ?auto_139956 ) ) ( not ( = ?auto_139955 ?auto_139958 ) ) ( not ( = ?auto_139957 ?auto_139958 ) ) ( not ( = ?auto_139956 ?auto_139958 ) ) ( not ( = ?auto_139962 ?auto_139959 ) ) ( not ( = ?auto_139962 ?auto_139960 ) ) ( not ( = ?auto_139955 ?auto_139954 ) ) ( not ( = ?auto_139957 ?auto_139954 ) ) ( not ( = ?auto_139956 ?auto_139954 ) ) ( not ( = ?auto_139958 ?auto_139954 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_139955 ?auto_139957 ?auto_139956 ?auto_139954 ?auto_139958 ?auto_139953 )
      ( DELIVER-5PKG-VERIFY ?auto_139954 ?auto_139955 ?auto_139956 ?auto_139957 ?auto_139958 ?auto_139953 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_140052 - OBJ
      ?auto_140053 - OBJ
      ?auto_140054 - OBJ
      ?auto_140055 - OBJ
      ?auto_140056 - OBJ
      ?auto_140051 - LOCATION
    )
    :vars
    (
      ?auto_140060 - LOCATION
      ?auto_140061 - CITY
      ?auto_140057 - LOCATION
      ?auto_140058 - LOCATION
      ?auto_140059 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140060 ?auto_140061 ) ( IN-CITY ?auto_140051 ?auto_140061 ) ( not ( = ?auto_140051 ?auto_140060 ) ) ( OBJ-AT ?auto_140052 ?auto_140060 ) ( OBJ-AT ?auto_140055 ?auto_140060 ) ( IN-CITY ?auto_140057 ?auto_140061 ) ( not ( = ?auto_140051 ?auto_140057 ) ) ( OBJ-AT ?auto_140054 ?auto_140057 ) ( OBJ-AT ?auto_140056 ?auto_140057 ) ( IN-CITY ?auto_140058 ?auto_140061 ) ( not ( = ?auto_140051 ?auto_140058 ) ) ( OBJ-AT ?auto_140053 ?auto_140058 ) ( TRUCK-AT ?auto_140059 ?auto_140051 ) ( not ( = ?auto_140053 ?auto_140056 ) ) ( not ( = ?auto_140057 ?auto_140058 ) ) ( not ( = ?auto_140053 ?auto_140054 ) ) ( not ( = ?auto_140056 ?auto_140054 ) ) ( not ( = ?auto_140053 ?auto_140055 ) ) ( not ( = ?auto_140056 ?auto_140055 ) ) ( not ( = ?auto_140054 ?auto_140055 ) ) ( not ( = ?auto_140060 ?auto_140057 ) ) ( not ( = ?auto_140060 ?auto_140058 ) ) ( not ( = ?auto_140053 ?auto_140052 ) ) ( not ( = ?auto_140056 ?auto_140052 ) ) ( not ( = ?auto_140054 ?auto_140052 ) ) ( not ( = ?auto_140055 ?auto_140052 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_140053 ?auto_140056 ?auto_140054 ?auto_140052 ?auto_140055 ?auto_140051 )
      ( DELIVER-5PKG-VERIFY ?auto_140052 ?auto_140053 ?auto_140054 ?auto_140055 ?auto_140056 ?auto_140051 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_140249 - OBJ
      ?auto_140250 - OBJ
      ?auto_140251 - OBJ
      ?auto_140252 - OBJ
      ?auto_140253 - OBJ
      ?auto_140248 - LOCATION
    )
    :vars
    (
      ?auto_140257 - LOCATION
      ?auto_140258 - CITY
      ?auto_140254 - LOCATION
      ?auto_140255 - LOCATION
      ?auto_140256 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140257 ?auto_140258 ) ( IN-CITY ?auto_140248 ?auto_140258 ) ( not ( = ?auto_140248 ?auto_140257 ) ) ( OBJ-AT ?auto_140249 ?auto_140257 ) ( OBJ-AT ?auto_140251 ?auto_140257 ) ( IN-CITY ?auto_140254 ?auto_140258 ) ( not ( = ?auto_140248 ?auto_140254 ) ) ( OBJ-AT ?auto_140253 ?auto_140254 ) ( OBJ-AT ?auto_140252 ?auto_140254 ) ( IN-CITY ?auto_140255 ?auto_140258 ) ( not ( = ?auto_140248 ?auto_140255 ) ) ( OBJ-AT ?auto_140250 ?auto_140255 ) ( TRUCK-AT ?auto_140256 ?auto_140248 ) ( not ( = ?auto_140250 ?auto_140252 ) ) ( not ( = ?auto_140254 ?auto_140255 ) ) ( not ( = ?auto_140250 ?auto_140253 ) ) ( not ( = ?auto_140252 ?auto_140253 ) ) ( not ( = ?auto_140250 ?auto_140251 ) ) ( not ( = ?auto_140252 ?auto_140251 ) ) ( not ( = ?auto_140253 ?auto_140251 ) ) ( not ( = ?auto_140257 ?auto_140254 ) ) ( not ( = ?auto_140257 ?auto_140255 ) ) ( not ( = ?auto_140250 ?auto_140249 ) ) ( not ( = ?auto_140252 ?auto_140249 ) ) ( not ( = ?auto_140253 ?auto_140249 ) ) ( not ( = ?auto_140251 ?auto_140249 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_140250 ?auto_140252 ?auto_140253 ?auto_140249 ?auto_140251 ?auto_140248 )
      ( DELIVER-5PKG-VERIFY ?auto_140249 ?auto_140250 ?auto_140251 ?auto_140252 ?auto_140253 ?auto_140248 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_140296 - OBJ
      ?auto_140297 - OBJ
      ?auto_140298 - OBJ
      ?auto_140299 - OBJ
      ?auto_140300 - OBJ
      ?auto_140295 - LOCATION
    )
    :vars
    (
      ?auto_140304 - LOCATION
      ?auto_140305 - CITY
      ?auto_140301 - LOCATION
      ?auto_140302 - LOCATION
      ?auto_140303 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140304 ?auto_140305 ) ( IN-CITY ?auto_140295 ?auto_140305 ) ( not ( = ?auto_140295 ?auto_140304 ) ) ( OBJ-AT ?auto_140296 ?auto_140304 ) ( OBJ-AT ?auto_140298 ?auto_140304 ) ( IN-CITY ?auto_140301 ?auto_140305 ) ( not ( = ?auto_140295 ?auto_140301 ) ) ( OBJ-AT ?auto_140299 ?auto_140301 ) ( OBJ-AT ?auto_140300 ?auto_140301 ) ( IN-CITY ?auto_140302 ?auto_140305 ) ( not ( = ?auto_140295 ?auto_140302 ) ) ( OBJ-AT ?auto_140297 ?auto_140302 ) ( TRUCK-AT ?auto_140303 ?auto_140295 ) ( not ( = ?auto_140297 ?auto_140300 ) ) ( not ( = ?auto_140301 ?auto_140302 ) ) ( not ( = ?auto_140297 ?auto_140299 ) ) ( not ( = ?auto_140300 ?auto_140299 ) ) ( not ( = ?auto_140297 ?auto_140298 ) ) ( not ( = ?auto_140300 ?auto_140298 ) ) ( not ( = ?auto_140299 ?auto_140298 ) ) ( not ( = ?auto_140304 ?auto_140301 ) ) ( not ( = ?auto_140304 ?auto_140302 ) ) ( not ( = ?auto_140297 ?auto_140296 ) ) ( not ( = ?auto_140300 ?auto_140296 ) ) ( not ( = ?auto_140299 ?auto_140296 ) ) ( not ( = ?auto_140298 ?auto_140296 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_140297 ?auto_140300 ?auto_140299 ?auto_140296 ?auto_140298 ?auto_140295 )
      ( DELIVER-5PKG-VERIFY ?auto_140296 ?auto_140297 ?auto_140298 ?auto_140299 ?auto_140300 ?auto_140295 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_140954 - OBJ
      ?auto_140955 - OBJ
      ?auto_140956 - OBJ
      ?auto_140957 - OBJ
      ?auto_140958 - OBJ
      ?auto_140953 - LOCATION
    )
    :vars
    (
      ?auto_140962 - LOCATION
      ?auto_140963 - CITY
      ?auto_140959 - LOCATION
      ?auto_140960 - LOCATION
      ?auto_140961 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140962 ?auto_140963 ) ( IN-CITY ?auto_140953 ?auto_140963 ) ( not ( = ?auto_140953 ?auto_140962 ) ) ( OBJ-AT ?auto_140954 ?auto_140962 ) ( OBJ-AT ?auto_140958 ?auto_140962 ) ( IN-CITY ?auto_140959 ?auto_140963 ) ( not ( = ?auto_140953 ?auto_140959 ) ) ( OBJ-AT ?auto_140957 ?auto_140959 ) ( OBJ-AT ?auto_140955 ?auto_140959 ) ( IN-CITY ?auto_140960 ?auto_140963 ) ( not ( = ?auto_140953 ?auto_140960 ) ) ( OBJ-AT ?auto_140956 ?auto_140960 ) ( TRUCK-AT ?auto_140961 ?auto_140953 ) ( not ( = ?auto_140956 ?auto_140955 ) ) ( not ( = ?auto_140959 ?auto_140960 ) ) ( not ( = ?auto_140956 ?auto_140957 ) ) ( not ( = ?auto_140955 ?auto_140957 ) ) ( not ( = ?auto_140956 ?auto_140958 ) ) ( not ( = ?auto_140955 ?auto_140958 ) ) ( not ( = ?auto_140957 ?auto_140958 ) ) ( not ( = ?auto_140962 ?auto_140959 ) ) ( not ( = ?auto_140962 ?auto_140960 ) ) ( not ( = ?auto_140956 ?auto_140954 ) ) ( not ( = ?auto_140955 ?auto_140954 ) ) ( not ( = ?auto_140957 ?auto_140954 ) ) ( not ( = ?auto_140958 ?auto_140954 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_140956 ?auto_140955 ?auto_140957 ?auto_140954 ?auto_140958 ?auto_140953 )
      ( DELIVER-5PKG-VERIFY ?auto_140954 ?auto_140955 ?auto_140956 ?auto_140957 ?auto_140958 ?auto_140953 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_141001 - OBJ
      ?auto_141002 - OBJ
      ?auto_141003 - OBJ
      ?auto_141004 - OBJ
      ?auto_141005 - OBJ
      ?auto_141000 - LOCATION
    )
    :vars
    (
      ?auto_141009 - LOCATION
      ?auto_141010 - CITY
      ?auto_141006 - LOCATION
      ?auto_141007 - LOCATION
      ?auto_141008 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_141009 ?auto_141010 ) ( IN-CITY ?auto_141000 ?auto_141010 ) ( not ( = ?auto_141000 ?auto_141009 ) ) ( OBJ-AT ?auto_141001 ?auto_141009 ) ( OBJ-AT ?auto_141004 ?auto_141009 ) ( IN-CITY ?auto_141006 ?auto_141010 ) ( not ( = ?auto_141000 ?auto_141006 ) ) ( OBJ-AT ?auto_141005 ?auto_141006 ) ( OBJ-AT ?auto_141002 ?auto_141006 ) ( IN-CITY ?auto_141007 ?auto_141010 ) ( not ( = ?auto_141000 ?auto_141007 ) ) ( OBJ-AT ?auto_141003 ?auto_141007 ) ( TRUCK-AT ?auto_141008 ?auto_141000 ) ( not ( = ?auto_141003 ?auto_141002 ) ) ( not ( = ?auto_141006 ?auto_141007 ) ) ( not ( = ?auto_141003 ?auto_141005 ) ) ( not ( = ?auto_141002 ?auto_141005 ) ) ( not ( = ?auto_141003 ?auto_141004 ) ) ( not ( = ?auto_141002 ?auto_141004 ) ) ( not ( = ?auto_141005 ?auto_141004 ) ) ( not ( = ?auto_141009 ?auto_141006 ) ) ( not ( = ?auto_141009 ?auto_141007 ) ) ( not ( = ?auto_141003 ?auto_141001 ) ) ( not ( = ?auto_141002 ?auto_141001 ) ) ( not ( = ?auto_141005 ?auto_141001 ) ) ( not ( = ?auto_141004 ?auto_141001 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_141003 ?auto_141002 ?auto_141005 ?auto_141001 ?auto_141004 ?auto_141000 )
      ( DELIVER-5PKG-VERIFY ?auto_141001 ?auto_141002 ?auto_141003 ?auto_141004 ?auto_141005 ?auto_141000 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_141458 - OBJ
      ?auto_141459 - OBJ
      ?auto_141460 - OBJ
      ?auto_141461 - OBJ
      ?auto_141462 - OBJ
      ?auto_141457 - LOCATION
    )
    :vars
    (
      ?auto_141466 - LOCATION
      ?auto_141467 - CITY
      ?auto_141463 - LOCATION
      ?auto_141464 - LOCATION
      ?auto_141465 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_141466 ?auto_141467 ) ( IN-CITY ?auto_141457 ?auto_141467 ) ( not ( = ?auto_141457 ?auto_141466 ) ) ( OBJ-AT ?auto_141458 ?auto_141466 ) ( OBJ-AT ?auto_141462 ?auto_141466 ) ( IN-CITY ?auto_141463 ?auto_141467 ) ( not ( = ?auto_141457 ?auto_141463 ) ) ( OBJ-AT ?auto_141460 ?auto_141463 ) ( OBJ-AT ?auto_141459 ?auto_141463 ) ( IN-CITY ?auto_141464 ?auto_141467 ) ( not ( = ?auto_141457 ?auto_141464 ) ) ( OBJ-AT ?auto_141461 ?auto_141464 ) ( TRUCK-AT ?auto_141465 ?auto_141457 ) ( not ( = ?auto_141461 ?auto_141459 ) ) ( not ( = ?auto_141463 ?auto_141464 ) ) ( not ( = ?auto_141461 ?auto_141460 ) ) ( not ( = ?auto_141459 ?auto_141460 ) ) ( not ( = ?auto_141461 ?auto_141462 ) ) ( not ( = ?auto_141459 ?auto_141462 ) ) ( not ( = ?auto_141460 ?auto_141462 ) ) ( not ( = ?auto_141466 ?auto_141463 ) ) ( not ( = ?auto_141466 ?auto_141464 ) ) ( not ( = ?auto_141461 ?auto_141458 ) ) ( not ( = ?auto_141459 ?auto_141458 ) ) ( not ( = ?auto_141460 ?auto_141458 ) ) ( not ( = ?auto_141462 ?auto_141458 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_141461 ?auto_141459 ?auto_141460 ?auto_141458 ?auto_141462 ?auto_141457 )
      ( DELIVER-5PKG-VERIFY ?auto_141458 ?auto_141459 ?auto_141460 ?auto_141461 ?auto_141462 ?auto_141457 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_141607 - OBJ
      ?auto_141608 - OBJ
      ?auto_141609 - OBJ
      ?auto_141610 - OBJ
      ?auto_141611 - OBJ
      ?auto_141606 - LOCATION
    )
    :vars
    (
      ?auto_141615 - LOCATION
      ?auto_141616 - CITY
      ?auto_141612 - LOCATION
      ?auto_141613 - LOCATION
      ?auto_141614 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_141615 ?auto_141616 ) ( IN-CITY ?auto_141606 ?auto_141616 ) ( not ( = ?auto_141606 ?auto_141615 ) ) ( OBJ-AT ?auto_141607 ?auto_141615 ) ( OBJ-AT ?auto_141610 ?auto_141615 ) ( IN-CITY ?auto_141612 ?auto_141616 ) ( not ( = ?auto_141606 ?auto_141612 ) ) ( OBJ-AT ?auto_141609 ?auto_141612 ) ( OBJ-AT ?auto_141608 ?auto_141612 ) ( IN-CITY ?auto_141613 ?auto_141616 ) ( not ( = ?auto_141606 ?auto_141613 ) ) ( OBJ-AT ?auto_141611 ?auto_141613 ) ( TRUCK-AT ?auto_141614 ?auto_141606 ) ( not ( = ?auto_141611 ?auto_141608 ) ) ( not ( = ?auto_141612 ?auto_141613 ) ) ( not ( = ?auto_141611 ?auto_141609 ) ) ( not ( = ?auto_141608 ?auto_141609 ) ) ( not ( = ?auto_141611 ?auto_141610 ) ) ( not ( = ?auto_141608 ?auto_141610 ) ) ( not ( = ?auto_141609 ?auto_141610 ) ) ( not ( = ?auto_141615 ?auto_141612 ) ) ( not ( = ?auto_141615 ?auto_141613 ) ) ( not ( = ?auto_141611 ?auto_141607 ) ) ( not ( = ?auto_141608 ?auto_141607 ) ) ( not ( = ?auto_141609 ?auto_141607 ) ) ( not ( = ?auto_141610 ?auto_141607 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_141611 ?auto_141608 ?auto_141609 ?auto_141607 ?auto_141610 ?auto_141606 )
      ( DELIVER-5PKG-VERIFY ?auto_141607 ?auto_141608 ?auto_141609 ?auto_141610 ?auto_141611 ?auto_141606 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_141753 - OBJ
      ?auto_141754 - OBJ
      ?auto_141755 - OBJ
      ?auto_141756 - OBJ
      ?auto_141757 - OBJ
      ?auto_141752 - LOCATION
    )
    :vars
    (
      ?auto_141761 - LOCATION
      ?auto_141762 - CITY
      ?auto_141758 - LOCATION
      ?auto_141759 - LOCATION
      ?auto_141760 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_141761 ?auto_141762 ) ( IN-CITY ?auto_141752 ?auto_141762 ) ( not ( = ?auto_141752 ?auto_141761 ) ) ( OBJ-AT ?auto_141753 ?auto_141761 ) ( OBJ-AT ?auto_141755 ?auto_141761 ) ( IN-CITY ?auto_141758 ?auto_141762 ) ( not ( = ?auto_141752 ?auto_141758 ) ) ( OBJ-AT ?auto_141757 ?auto_141758 ) ( OBJ-AT ?auto_141754 ?auto_141758 ) ( IN-CITY ?auto_141759 ?auto_141762 ) ( not ( = ?auto_141752 ?auto_141759 ) ) ( OBJ-AT ?auto_141756 ?auto_141759 ) ( TRUCK-AT ?auto_141760 ?auto_141752 ) ( not ( = ?auto_141756 ?auto_141754 ) ) ( not ( = ?auto_141758 ?auto_141759 ) ) ( not ( = ?auto_141756 ?auto_141757 ) ) ( not ( = ?auto_141754 ?auto_141757 ) ) ( not ( = ?auto_141756 ?auto_141755 ) ) ( not ( = ?auto_141754 ?auto_141755 ) ) ( not ( = ?auto_141757 ?auto_141755 ) ) ( not ( = ?auto_141761 ?auto_141758 ) ) ( not ( = ?auto_141761 ?auto_141759 ) ) ( not ( = ?auto_141756 ?auto_141753 ) ) ( not ( = ?auto_141754 ?auto_141753 ) ) ( not ( = ?auto_141757 ?auto_141753 ) ) ( not ( = ?auto_141755 ?auto_141753 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_141756 ?auto_141754 ?auto_141757 ?auto_141753 ?auto_141755 ?auto_141752 )
      ( DELIVER-5PKG-VERIFY ?auto_141753 ?auto_141754 ?auto_141755 ?auto_141756 ?auto_141757 ?auto_141752 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_141851 - OBJ
      ?auto_141852 - OBJ
      ?auto_141853 - OBJ
      ?auto_141854 - OBJ
      ?auto_141855 - OBJ
      ?auto_141850 - LOCATION
    )
    :vars
    (
      ?auto_141859 - LOCATION
      ?auto_141860 - CITY
      ?auto_141856 - LOCATION
      ?auto_141857 - LOCATION
      ?auto_141858 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_141859 ?auto_141860 ) ( IN-CITY ?auto_141850 ?auto_141860 ) ( not ( = ?auto_141850 ?auto_141859 ) ) ( OBJ-AT ?auto_141851 ?auto_141859 ) ( OBJ-AT ?auto_141853 ?auto_141859 ) ( IN-CITY ?auto_141856 ?auto_141860 ) ( not ( = ?auto_141850 ?auto_141856 ) ) ( OBJ-AT ?auto_141854 ?auto_141856 ) ( OBJ-AT ?auto_141852 ?auto_141856 ) ( IN-CITY ?auto_141857 ?auto_141860 ) ( not ( = ?auto_141850 ?auto_141857 ) ) ( OBJ-AT ?auto_141855 ?auto_141857 ) ( TRUCK-AT ?auto_141858 ?auto_141850 ) ( not ( = ?auto_141855 ?auto_141852 ) ) ( not ( = ?auto_141856 ?auto_141857 ) ) ( not ( = ?auto_141855 ?auto_141854 ) ) ( not ( = ?auto_141852 ?auto_141854 ) ) ( not ( = ?auto_141855 ?auto_141853 ) ) ( not ( = ?auto_141852 ?auto_141853 ) ) ( not ( = ?auto_141854 ?auto_141853 ) ) ( not ( = ?auto_141859 ?auto_141856 ) ) ( not ( = ?auto_141859 ?auto_141857 ) ) ( not ( = ?auto_141855 ?auto_141851 ) ) ( not ( = ?auto_141852 ?auto_141851 ) ) ( not ( = ?auto_141854 ?auto_141851 ) ) ( not ( = ?auto_141853 ?auto_141851 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_141855 ?auto_141852 ?auto_141854 ?auto_141851 ?auto_141853 ?auto_141850 )
      ( DELIVER-5PKG-VERIFY ?auto_141851 ?auto_141852 ?auto_141853 ?auto_141854 ?auto_141855 ?auto_141850 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_142458 - OBJ
      ?auto_142459 - OBJ
      ?auto_142460 - OBJ
      ?auto_142461 - OBJ
      ?auto_142462 - OBJ
      ?auto_142457 - LOCATION
    )
    :vars
    (
      ?auto_142466 - LOCATION
      ?auto_142467 - CITY
      ?auto_142463 - LOCATION
      ?auto_142464 - LOCATION
      ?auto_142465 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_142466 ?auto_142467 ) ( IN-CITY ?auto_142457 ?auto_142467 ) ( not ( = ?auto_142457 ?auto_142466 ) ) ( OBJ-AT ?auto_142458 ?auto_142466 ) ( OBJ-AT ?auto_142462 ?auto_142466 ) ( IN-CITY ?auto_142463 ?auto_142467 ) ( not ( = ?auto_142457 ?auto_142463 ) ) ( OBJ-AT ?auto_142459 ?auto_142463 ) ( OBJ-AT ?auto_142461 ?auto_142463 ) ( IN-CITY ?auto_142464 ?auto_142467 ) ( not ( = ?auto_142457 ?auto_142464 ) ) ( OBJ-AT ?auto_142460 ?auto_142464 ) ( TRUCK-AT ?auto_142465 ?auto_142457 ) ( not ( = ?auto_142460 ?auto_142461 ) ) ( not ( = ?auto_142463 ?auto_142464 ) ) ( not ( = ?auto_142460 ?auto_142459 ) ) ( not ( = ?auto_142461 ?auto_142459 ) ) ( not ( = ?auto_142460 ?auto_142462 ) ) ( not ( = ?auto_142461 ?auto_142462 ) ) ( not ( = ?auto_142459 ?auto_142462 ) ) ( not ( = ?auto_142466 ?auto_142463 ) ) ( not ( = ?auto_142466 ?auto_142464 ) ) ( not ( = ?auto_142460 ?auto_142458 ) ) ( not ( = ?auto_142461 ?auto_142458 ) ) ( not ( = ?auto_142459 ?auto_142458 ) ) ( not ( = ?auto_142462 ?auto_142458 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_142460 ?auto_142461 ?auto_142459 ?auto_142458 ?auto_142462 ?auto_142457 )
      ( DELIVER-5PKG-VERIFY ?auto_142458 ?auto_142459 ?auto_142460 ?auto_142461 ?auto_142462 ?auto_142457 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_142556 - OBJ
      ?auto_142557 - OBJ
      ?auto_142558 - OBJ
      ?auto_142559 - OBJ
      ?auto_142560 - OBJ
      ?auto_142555 - LOCATION
    )
    :vars
    (
      ?auto_142564 - LOCATION
      ?auto_142565 - CITY
      ?auto_142561 - LOCATION
      ?auto_142562 - LOCATION
      ?auto_142563 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_142564 ?auto_142565 ) ( IN-CITY ?auto_142555 ?auto_142565 ) ( not ( = ?auto_142555 ?auto_142564 ) ) ( OBJ-AT ?auto_142556 ?auto_142564 ) ( OBJ-AT ?auto_142559 ?auto_142564 ) ( IN-CITY ?auto_142561 ?auto_142565 ) ( not ( = ?auto_142555 ?auto_142561 ) ) ( OBJ-AT ?auto_142557 ?auto_142561 ) ( OBJ-AT ?auto_142560 ?auto_142561 ) ( IN-CITY ?auto_142562 ?auto_142565 ) ( not ( = ?auto_142555 ?auto_142562 ) ) ( OBJ-AT ?auto_142558 ?auto_142562 ) ( TRUCK-AT ?auto_142563 ?auto_142555 ) ( not ( = ?auto_142558 ?auto_142560 ) ) ( not ( = ?auto_142561 ?auto_142562 ) ) ( not ( = ?auto_142558 ?auto_142557 ) ) ( not ( = ?auto_142560 ?auto_142557 ) ) ( not ( = ?auto_142558 ?auto_142559 ) ) ( not ( = ?auto_142560 ?auto_142559 ) ) ( not ( = ?auto_142557 ?auto_142559 ) ) ( not ( = ?auto_142564 ?auto_142561 ) ) ( not ( = ?auto_142564 ?auto_142562 ) ) ( not ( = ?auto_142558 ?auto_142556 ) ) ( not ( = ?auto_142560 ?auto_142556 ) ) ( not ( = ?auto_142557 ?auto_142556 ) ) ( not ( = ?auto_142559 ?auto_142556 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_142558 ?auto_142560 ?auto_142557 ?auto_142556 ?auto_142559 ?auto_142555 )
      ( DELIVER-5PKG-VERIFY ?auto_142556 ?auto_142557 ?auto_142558 ?auto_142559 ?auto_142560 ?auto_142555 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_142702 - OBJ
      ?auto_142703 - OBJ
      ?auto_142704 - OBJ
      ?auto_142705 - OBJ
      ?auto_142706 - OBJ
      ?auto_142701 - LOCATION
    )
    :vars
    (
      ?auto_142710 - LOCATION
      ?auto_142711 - CITY
      ?auto_142707 - LOCATION
      ?auto_142708 - LOCATION
      ?auto_142709 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_142710 ?auto_142711 ) ( IN-CITY ?auto_142701 ?auto_142711 ) ( not ( = ?auto_142701 ?auto_142710 ) ) ( OBJ-AT ?auto_142702 ?auto_142710 ) ( OBJ-AT ?auto_142706 ?auto_142710 ) ( IN-CITY ?auto_142707 ?auto_142711 ) ( not ( = ?auto_142701 ?auto_142707 ) ) ( OBJ-AT ?auto_142703 ?auto_142707 ) ( OBJ-AT ?auto_142704 ?auto_142707 ) ( IN-CITY ?auto_142708 ?auto_142711 ) ( not ( = ?auto_142701 ?auto_142708 ) ) ( OBJ-AT ?auto_142705 ?auto_142708 ) ( TRUCK-AT ?auto_142709 ?auto_142701 ) ( not ( = ?auto_142705 ?auto_142704 ) ) ( not ( = ?auto_142707 ?auto_142708 ) ) ( not ( = ?auto_142705 ?auto_142703 ) ) ( not ( = ?auto_142704 ?auto_142703 ) ) ( not ( = ?auto_142705 ?auto_142706 ) ) ( not ( = ?auto_142704 ?auto_142706 ) ) ( not ( = ?auto_142703 ?auto_142706 ) ) ( not ( = ?auto_142710 ?auto_142707 ) ) ( not ( = ?auto_142710 ?auto_142708 ) ) ( not ( = ?auto_142705 ?auto_142702 ) ) ( not ( = ?auto_142704 ?auto_142702 ) ) ( not ( = ?auto_142703 ?auto_142702 ) ) ( not ( = ?auto_142706 ?auto_142702 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_142705 ?auto_142704 ?auto_142703 ?auto_142702 ?auto_142706 ?auto_142701 )
      ( DELIVER-5PKG-VERIFY ?auto_142702 ?auto_142703 ?auto_142704 ?auto_142705 ?auto_142706 ?auto_142701 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_142851 - OBJ
      ?auto_142852 - OBJ
      ?auto_142853 - OBJ
      ?auto_142854 - OBJ
      ?auto_142855 - OBJ
      ?auto_142850 - LOCATION
    )
    :vars
    (
      ?auto_142859 - LOCATION
      ?auto_142860 - CITY
      ?auto_142856 - LOCATION
      ?auto_142857 - LOCATION
      ?auto_142858 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_142859 ?auto_142860 ) ( IN-CITY ?auto_142850 ?auto_142860 ) ( not ( = ?auto_142850 ?auto_142859 ) ) ( OBJ-AT ?auto_142851 ?auto_142859 ) ( OBJ-AT ?auto_142854 ?auto_142859 ) ( IN-CITY ?auto_142856 ?auto_142860 ) ( not ( = ?auto_142850 ?auto_142856 ) ) ( OBJ-AT ?auto_142852 ?auto_142856 ) ( OBJ-AT ?auto_142853 ?auto_142856 ) ( IN-CITY ?auto_142857 ?auto_142860 ) ( not ( = ?auto_142850 ?auto_142857 ) ) ( OBJ-AT ?auto_142855 ?auto_142857 ) ( TRUCK-AT ?auto_142858 ?auto_142850 ) ( not ( = ?auto_142855 ?auto_142853 ) ) ( not ( = ?auto_142856 ?auto_142857 ) ) ( not ( = ?auto_142855 ?auto_142852 ) ) ( not ( = ?auto_142853 ?auto_142852 ) ) ( not ( = ?auto_142855 ?auto_142854 ) ) ( not ( = ?auto_142853 ?auto_142854 ) ) ( not ( = ?auto_142852 ?auto_142854 ) ) ( not ( = ?auto_142859 ?auto_142856 ) ) ( not ( = ?auto_142859 ?auto_142857 ) ) ( not ( = ?auto_142855 ?auto_142851 ) ) ( not ( = ?auto_142853 ?auto_142851 ) ) ( not ( = ?auto_142852 ?auto_142851 ) ) ( not ( = ?auto_142854 ?auto_142851 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_142855 ?auto_142853 ?auto_142852 ?auto_142851 ?auto_142854 ?auto_142850 )
      ( DELIVER-5PKG-VERIFY ?auto_142851 ?auto_142852 ?auto_142853 ?auto_142854 ?auto_142855 ?auto_142850 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_143308 - OBJ
      ?auto_143309 - OBJ
      ?auto_143310 - OBJ
      ?auto_143311 - OBJ
      ?auto_143312 - OBJ
      ?auto_143307 - LOCATION
    )
    :vars
    (
      ?auto_143316 - LOCATION
      ?auto_143317 - CITY
      ?auto_143313 - LOCATION
      ?auto_143314 - LOCATION
      ?auto_143315 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_143316 ?auto_143317 ) ( IN-CITY ?auto_143307 ?auto_143317 ) ( not ( = ?auto_143307 ?auto_143316 ) ) ( OBJ-AT ?auto_143308 ?auto_143316 ) ( OBJ-AT ?auto_143310 ?auto_143316 ) ( IN-CITY ?auto_143313 ?auto_143317 ) ( not ( = ?auto_143307 ?auto_143313 ) ) ( OBJ-AT ?auto_143309 ?auto_143313 ) ( OBJ-AT ?auto_143312 ?auto_143313 ) ( IN-CITY ?auto_143314 ?auto_143317 ) ( not ( = ?auto_143307 ?auto_143314 ) ) ( OBJ-AT ?auto_143311 ?auto_143314 ) ( TRUCK-AT ?auto_143315 ?auto_143307 ) ( not ( = ?auto_143311 ?auto_143312 ) ) ( not ( = ?auto_143313 ?auto_143314 ) ) ( not ( = ?auto_143311 ?auto_143309 ) ) ( not ( = ?auto_143312 ?auto_143309 ) ) ( not ( = ?auto_143311 ?auto_143310 ) ) ( not ( = ?auto_143312 ?auto_143310 ) ) ( not ( = ?auto_143309 ?auto_143310 ) ) ( not ( = ?auto_143316 ?auto_143313 ) ) ( not ( = ?auto_143316 ?auto_143314 ) ) ( not ( = ?auto_143311 ?auto_143308 ) ) ( not ( = ?auto_143312 ?auto_143308 ) ) ( not ( = ?auto_143309 ?auto_143308 ) ) ( not ( = ?auto_143310 ?auto_143308 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_143311 ?auto_143312 ?auto_143309 ?auto_143308 ?auto_143310 ?auto_143307 )
      ( DELIVER-5PKG-VERIFY ?auto_143308 ?auto_143309 ?auto_143310 ?auto_143311 ?auto_143312 ?auto_143307 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_143355 - OBJ
      ?auto_143356 - OBJ
      ?auto_143357 - OBJ
      ?auto_143358 - OBJ
      ?auto_143359 - OBJ
      ?auto_143354 - LOCATION
    )
    :vars
    (
      ?auto_143363 - LOCATION
      ?auto_143364 - CITY
      ?auto_143360 - LOCATION
      ?auto_143361 - LOCATION
      ?auto_143362 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_143363 ?auto_143364 ) ( IN-CITY ?auto_143354 ?auto_143364 ) ( not ( = ?auto_143354 ?auto_143363 ) ) ( OBJ-AT ?auto_143355 ?auto_143363 ) ( OBJ-AT ?auto_143357 ?auto_143363 ) ( IN-CITY ?auto_143360 ?auto_143364 ) ( not ( = ?auto_143354 ?auto_143360 ) ) ( OBJ-AT ?auto_143356 ?auto_143360 ) ( OBJ-AT ?auto_143358 ?auto_143360 ) ( IN-CITY ?auto_143361 ?auto_143364 ) ( not ( = ?auto_143354 ?auto_143361 ) ) ( OBJ-AT ?auto_143359 ?auto_143361 ) ( TRUCK-AT ?auto_143362 ?auto_143354 ) ( not ( = ?auto_143359 ?auto_143358 ) ) ( not ( = ?auto_143360 ?auto_143361 ) ) ( not ( = ?auto_143359 ?auto_143356 ) ) ( not ( = ?auto_143358 ?auto_143356 ) ) ( not ( = ?auto_143359 ?auto_143357 ) ) ( not ( = ?auto_143358 ?auto_143357 ) ) ( not ( = ?auto_143356 ?auto_143357 ) ) ( not ( = ?auto_143363 ?auto_143360 ) ) ( not ( = ?auto_143363 ?auto_143361 ) ) ( not ( = ?auto_143359 ?auto_143355 ) ) ( not ( = ?auto_143358 ?auto_143355 ) ) ( not ( = ?auto_143356 ?auto_143355 ) ) ( not ( = ?auto_143357 ?auto_143355 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_143359 ?auto_143358 ?auto_143356 ?auto_143355 ?auto_143357 ?auto_143354 )
      ( DELIVER-5PKG-VERIFY ?auto_143355 ?auto_143356 ?auto_143357 ?auto_143358 ?auto_143359 ?auto_143354 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_144013 - OBJ
      ?auto_144014 - OBJ
      ?auto_144015 - OBJ
      ?auto_144016 - OBJ
      ?auto_144017 - OBJ
      ?auto_144012 - LOCATION
    )
    :vars
    (
      ?auto_144021 - LOCATION
      ?auto_144022 - CITY
      ?auto_144018 - LOCATION
      ?auto_144019 - LOCATION
      ?auto_144020 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144021 ?auto_144022 ) ( IN-CITY ?auto_144012 ?auto_144022 ) ( not ( = ?auto_144012 ?auto_144021 ) ) ( OBJ-AT ?auto_144013 ?auto_144021 ) ( OBJ-AT ?auto_144014 ?auto_144021 ) ( IN-CITY ?auto_144018 ?auto_144022 ) ( not ( = ?auto_144012 ?auto_144018 ) ) ( OBJ-AT ?auto_144017 ?auto_144018 ) ( OBJ-AT ?auto_144016 ?auto_144018 ) ( IN-CITY ?auto_144019 ?auto_144022 ) ( not ( = ?auto_144012 ?auto_144019 ) ) ( OBJ-AT ?auto_144015 ?auto_144019 ) ( TRUCK-AT ?auto_144020 ?auto_144012 ) ( not ( = ?auto_144015 ?auto_144016 ) ) ( not ( = ?auto_144018 ?auto_144019 ) ) ( not ( = ?auto_144015 ?auto_144017 ) ) ( not ( = ?auto_144016 ?auto_144017 ) ) ( not ( = ?auto_144015 ?auto_144014 ) ) ( not ( = ?auto_144016 ?auto_144014 ) ) ( not ( = ?auto_144017 ?auto_144014 ) ) ( not ( = ?auto_144021 ?auto_144018 ) ) ( not ( = ?auto_144021 ?auto_144019 ) ) ( not ( = ?auto_144015 ?auto_144013 ) ) ( not ( = ?auto_144016 ?auto_144013 ) ) ( not ( = ?auto_144017 ?auto_144013 ) ) ( not ( = ?auto_144014 ?auto_144013 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_144015 ?auto_144016 ?auto_144017 ?auto_144013 ?auto_144014 ?auto_144012 )
      ( DELIVER-5PKG-VERIFY ?auto_144013 ?auto_144014 ?auto_144015 ?auto_144016 ?auto_144017 ?auto_144012 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_144060 - OBJ
      ?auto_144061 - OBJ
      ?auto_144062 - OBJ
      ?auto_144063 - OBJ
      ?auto_144064 - OBJ
      ?auto_144059 - LOCATION
    )
    :vars
    (
      ?auto_144068 - LOCATION
      ?auto_144069 - CITY
      ?auto_144065 - LOCATION
      ?auto_144066 - LOCATION
      ?auto_144067 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144068 ?auto_144069 ) ( IN-CITY ?auto_144059 ?auto_144069 ) ( not ( = ?auto_144059 ?auto_144068 ) ) ( OBJ-AT ?auto_144060 ?auto_144068 ) ( OBJ-AT ?auto_144061 ?auto_144068 ) ( IN-CITY ?auto_144065 ?auto_144069 ) ( not ( = ?auto_144059 ?auto_144065 ) ) ( OBJ-AT ?auto_144063 ?auto_144065 ) ( OBJ-AT ?auto_144064 ?auto_144065 ) ( IN-CITY ?auto_144066 ?auto_144069 ) ( not ( = ?auto_144059 ?auto_144066 ) ) ( OBJ-AT ?auto_144062 ?auto_144066 ) ( TRUCK-AT ?auto_144067 ?auto_144059 ) ( not ( = ?auto_144062 ?auto_144064 ) ) ( not ( = ?auto_144065 ?auto_144066 ) ) ( not ( = ?auto_144062 ?auto_144063 ) ) ( not ( = ?auto_144064 ?auto_144063 ) ) ( not ( = ?auto_144062 ?auto_144061 ) ) ( not ( = ?auto_144064 ?auto_144061 ) ) ( not ( = ?auto_144063 ?auto_144061 ) ) ( not ( = ?auto_144068 ?auto_144065 ) ) ( not ( = ?auto_144068 ?auto_144066 ) ) ( not ( = ?auto_144062 ?auto_144060 ) ) ( not ( = ?auto_144064 ?auto_144060 ) ) ( not ( = ?auto_144063 ?auto_144060 ) ) ( not ( = ?auto_144061 ?auto_144060 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_144062 ?auto_144064 ?auto_144063 ?auto_144060 ?auto_144061 ?auto_144059 )
      ( DELIVER-5PKG-VERIFY ?auto_144060 ?auto_144061 ?auto_144062 ?auto_144063 ?auto_144064 ?auto_144059 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_144257 - OBJ
      ?auto_144258 - OBJ
      ?auto_144259 - OBJ
      ?auto_144260 - OBJ
      ?auto_144261 - OBJ
      ?auto_144256 - LOCATION
    )
    :vars
    (
      ?auto_144265 - LOCATION
      ?auto_144266 - CITY
      ?auto_144262 - LOCATION
      ?auto_144263 - LOCATION
      ?auto_144264 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144265 ?auto_144266 ) ( IN-CITY ?auto_144256 ?auto_144266 ) ( not ( = ?auto_144256 ?auto_144265 ) ) ( OBJ-AT ?auto_144257 ?auto_144265 ) ( OBJ-AT ?auto_144258 ?auto_144265 ) ( IN-CITY ?auto_144262 ?auto_144266 ) ( not ( = ?auto_144256 ?auto_144262 ) ) ( OBJ-AT ?auto_144261 ?auto_144262 ) ( OBJ-AT ?auto_144259 ?auto_144262 ) ( IN-CITY ?auto_144263 ?auto_144266 ) ( not ( = ?auto_144256 ?auto_144263 ) ) ( OBJ-AT ?auto_144260 ?auto_144263 ) ( TRUCK-AT ?auto_144264 ?auto_144256 ) ( not ( = ?auto_144260 ?auto_144259 ) ) ( not ( = ?auto_144262 ?auto_144263 ) ) ( not ( = ?auto_144260 ?auto_144261 ) ) ( not ( = ?auto_144259 ?auto_144261 ) ) ( not ( = ?auto_144260 ?auto_144258 ) ) ( not ( = ?auto_144259 ?auto_144258 ) ) ( not ( = ?auto_144261 ?auto_144258 ) ) ( not ( = ?auto_144265 ?auto_144262 ) ) ( not ( = ?auto_144265 ?auto_144263 ) ) ( not ( = ?auto_144260 ?auto_144257 ) ) ( not ( = ?auto_144259 ?auto_144257 ) ) ( not ( = ?auto_144261 ?auto_144257 ) ) ( not ( = ?auto_144258 ?auto_144257 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_144260 ?auto_144259 ?auto_144261 ?auto_144257 ?auto_144258 ?auto_144256 )
      ( DELIVER-5PKG-VERIFY ?auto_144257 ?auto_144258 ?auto_144259 ?auto_144260 ?auto_144261 ?auto_144256 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_144355 - OBJ
      ?auto_144356 - OBJ
      ?auto_144357 - OBJ
      ?auto_144358 - OBJ
      ?auto_144359 - OBJ
      ?auto_144354 - LOCATION
    )
    :vars
    (
      ?auto_144363 - LOCATION
      ?auto_144364 - CITY
      ?auto_144360 - LOCATION
      ?auto_144361 - LOCATION
      ?auto_144362 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144363 ?auto_144364 ) ( IN-CITY ?auto_144354 ?auto_144364 ) ( not ( = ?auto_144354 ?auto_144363 ) ) ( OBJ-AT ?auto_144355 ?auto_144363 ) ( OBJ-AT ?auto_144356 ?auto_144363 ) ( IN-CITY ?auto_144360 ?auto_144364 ) ( not ( = ?auto_144354 ?auto_144360 ) ) ( OBJ-AT ?auto_144358 ?auto_144360 ) ( OBJ-AT ?auto_144357 ?auto_144360 ) ( IN-CITY ?auto_144361 ?auto_144364 ) ( not ( = ?auto_144354 ?auto_144361 ) ) ( OBJ-AT ?auto_144359 ?auto_144361 ) ( TRUCK-AT ?auto_144362 ?auto_144354 ) ( not ( = ?auto_144359 ?auto_144357 ) ) ( not ( = ?auto_144360 ?auto_144361 ) ) ( not ( = ?auto_144359 ?auto_144358 ) ) ( not ( = ?auto_144357 ?auto_144358 ) ) ( not ( = ?auto_144359 ?auto_144356 ) ) ( not ( = ?auto_144357 ?auto_144356 ) ) ( not ( = ?auto_144358 ?auto_144356 ) ) ( not ( = ?auto_144363 ?auto_144360 ) ) ( not ( = ?auto_144363 ?auto_144361 ) ) ( not ( = ?auto_144359 ?auto_144355 ) ) ( not ( = ?auto_144357 ?auto_144355 ) ) ( not ( = ?auto_144358 ?auto_144355 ) ) ( not ( = ?auto_144356 ?auto_144355 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_144359 ?auto_144357 ?auto_144358 ?auto_144355 ?auto_144356 ?auto_144354 )
      ( DELIVER-5PKG-VERIFY ?auto_144355 ?auto_144356 ?auto_144357 ?auto_144358 ?auto_144359 ?auto_144354 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_144552 - OBJ
      ?auto_144553 - OBJ
      ?auto_144554 - OBJ
      ?auto_144555 - OBJ
      ?auto_144556 - OBJ
      ?auto_144551 - LOCATION
    )
    :vars
    (
      ?auto_144560 - LOCATION
      ?auto_144561 - CITY
      ?auto_144557 - LOCATION
      ?auto_144558 - LOCATION
      ?auto_144559 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144560 ?auto_144561 ) ( IN-CITY ?auto_144551 ?auto_144561 ) ( not ( = ?auto_144551 ?auto_144560 ) ) ( OBJ-AT ?auto_144552 ?auto_144560 ) ( OBJ-AT ?auto_144553 ?auto_144560 ) ( IN-CITY ?auto_144557 ?auto_144561 ) ( not ( = ?auto_144551 ?auto_144557 ) ) ( OBJ-AT ?auto_144554 ?auto_144557 ) ( OBJ-AT ?auto_144556 ?auto_144557 ) ( IN-CITY ?auto_144558 ?auto_144561 ) ( not ( = ?auto_144551 ?auto_144558 ) ) ( OBJ-AT ?auto_144555 ?auto_144558 ) ( TRUCK-AT ?auto_144559 ?auto_144551 ) ( not ( = ?auto_144555 ?auto_144556 ) ) ( not ( = ?auto_144557 ?auto_144558 ) ) ( not ( = ?auto_144555 ?auto_144554 ) ) ( not ( = ?auto_144556 ?auto_144554 ) ) ( not ( = ?auto_144555 ?auto_144553 ) ) ( not ( = ?auto_144556 ?auto_144553 ) ) ( not ( = ?auto_144554 ?auto_144553 ) ) ( not ( = ?auto_144560 ?auto_144557 ) ) ( not ( = ?auto_144560 ?auto_144558 ) ) ( not ( = ?auto_144555 ?auto_144552 ) ) ( not ( = ?auto_144556 ?auto_144552 ) ) ( not ( = ?auto_144554 ?auto_144552 ) ) ( not ( = ?auto_144553 ?auto_144552 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_144555 ?auto_144556 ?auto_144554 ?auto_144552 ?auto_144553 ?auto_144551 )
      ( DELIVER-5PKG-VERIFY ?auto_144552 ?auto_144553 ?auto_144554 ?auto_144555 ?auto_144556 ?auto_144551 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_144599 - OBJ
      ?auto_144600 - OBJ
      ?auto_144601 - OBJ
      ?auto_144602 - OBJ
      ?auto_144603 - OBJ
      ?auto_144598 - LOCATION
    )
    :vars
    (
      ?auto_144607 - LOCATION
      ?auto_144608 - CITY
      ?auto_144604 - LOCATION
      ?auto_144605 - LOCATION
      ?auto_144606 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144607 ?auto_144608 ) ( IN-CITY ?auto_144598 ?auto_144608 ) ( not ( = ?auto_144598 ?auto_144607 ) ) ( OBJ-AT ?auto_144599 ?auto_144607 ) ( OBJ-AT ?auto_144600 ?auto_144607 ) ( IN-CITY ?auto_144604 ?auto_144608 ) ( not ( = ?auto_144598 ?auto_144604 ) ) ( OBJ-AT ?auto_144601 ?auto_144604 ) ( OBJ-AT ?auto_144602 ?auto_144604 ) ( IN-CITY ?auto_144605 ?auto_144608 ) ( not ( = ?auto_144598 ?auto_144605 ) ) ( OBJ-AT ?auto_144603 ?auto_144605 ) ( TRUCK-AT ?auto_144606 ?auto_144598 ) ( not ( = ?auto_144603 ?auto_144602 ) ) ( not ( = ?auto_144604 ?auto_144605 ) ) ( not ( = ?auto_144603 ?auto_144601 ) ) ( not ( = ?auto_144602 ?auto_144601 ) ) ( not ( = ?auto_144603 ?auto_144600 ) ) ( not ( = ?auto_144602 ?auto_144600 ) ) ( not ( = ?auto_144601 ?auto_144600 ) ) ( not ( = ?auto_144607 ?auto_144604 ) ) ( not ( = ?auto_144607 ?auto_144605 ) ) ( not ( = ?auto_144603 ?auto_144599 ) ) ( not ( = ?auto_144602 ?auto_144599 ) ) ( not ( = ?auto_144601 ?auto_144599 ) ) ( not ( = ?auto_144600 ?auto_144599 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_144603 ?auto_144602 ?auto_144601 ?auto_144599 ?auto_144600 ?auto_144598 )
      ( DELIVER-5PKG-VERIFY ?auto_144599 ?auto_144600 ?auto_144601 ?auto_144602 ?auto_144603 ?auto_144598 ) )
  )

)

