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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_206 - OBJ
      ?auto_205 - LOCATION
    )
    :vars
    (
      ?auto_208 - LOCATION
      ?auto_209 - CITY
      ?auto_207 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_208 ?auto_209 ) ( IN-CITY ?auto_205 ?auto_209 ) ( not ( = ?auto_205 ?auto_208 ) ) ( OBJ-AT ?auto_206 ?auto_208 ) ( TRUCK-AT ?auto_207 ?auto_205 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_207 ?auto_205 ?auto_208 ?auto_209 )
      ( !LOAD-TRUCK ?auto_206 ?auto_207 ?auto_208 )
      ( !DRIVE-TRUCK ?auto_207 ?auto_208 ?auto_205 ?auto_209 )
      ( !UNLOAD-TRUCK ?auto_206 ?auto_207 ?auto_205 )
      ( DELIVER-1PKG-VERIFY ?auto_206 ?auto_205 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_227 - OBJ
      ?auto_228 - OBJ
      ?auto_226 - LOCATION
    )
    :vars
    (
      ?auto_229 - LOCATION
      ?auto_230 - CITY
      ?auto_232 - LOCATION
      ?auto_231 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_229 ?auto_230 ) ( IN-CITY ?auto_226 ?auto_230 ) ( not ( = ?auto_226 ?auto_229 ) ) ( OBJ-AT ?auto_228 ?auto_229 ) ( IN-CITY ?auto_232 ?auto_230 ) ( not ( = ?auto_226 ?auto_232 ) ) ( OBJ-AT ?auto_227 ?auto_232 ) ( TRUCK-AT ?auto_231 ?auto_226 ) ( not ( = ?auto_227 ?auto_228 ) ) ( not ( = ?auto_229 ?auto_232 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_227 ?auto_226 )
      ( DELIVER-1PKG ?auto_228 ?auto_226 )
      ( DELIVER-2PKG-VERIFY ?auto_227 ?auto_228 ?auto_226 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_337 - OBJ
      ?auto_338 - OBJ
      ?auto_339 - OBJ
      ?auto_336 - LOCATION
    )
    :vars
    (
      ?auto_342 - LOCATION
      ?auto_341 - CITY
      ?auto_343 - LOCATION
      ?auto_340 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_342 ?auto_341 ) ( IN-CITY ?auto_336 ?auto_341 ) ( not ( = ?auto_336 ?auto_342 ) ) ( OBJ-AT ?auto_339 ?auto_342 ) ( IN-CITY ?auto_343 ?auto_341 ) ( not ( = ?auto_336 ?auto_343 ) ) ( OBJ-AT ?auto_338 ?auto_343 ) ( OBJ-AT ?auto_337 ?auto_342 ) ( TRUCK-AT ?auto_340 ?auto_336 ) ( not ( = ?auto_337 ?auto_338 ) ) ( not ( = ?auto_343 ?auto_342 ) ) ( not ( = ?auto_337 ?auto_339 ) ) ( not ( = ?auto_338 ?auto_339 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_337 ?auto_338 ?auto_336 )
      ( DELIVER-1PKG ?auto_339 ?auto_336 )
      ( DELIVER-3PKG-VERIFY ?auto_337 ?auto_338 ?auto_339 ?auto_336 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_354 - OBJ
      ?auto_355 - OBJ
      ?auto_356 - OBJ
      ?auto_353 - LOCATION
    )
    :vars
    (
      ?auto_358 - LOCATION
      ?auto_357 - CITY
      ?auto_359 - LOCATION
      ?auto_360 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_358 ?auto_357 ) ( IN-CITY ?auto_353 ?auto_357 ) ( not ( = ?auto_353 ?auto_358 ) ) ( OBJ-AT ?auto_355 ?auto_358 ) ( IN-CITY ?auto_359 ?auto_357 ) ( not ( = ?auto_353 ?auto_359 ) ) ( OBJ-AT ?auto_356 ?auto_359 ) ( OBJ-AT ?auto_354 ?auto_358 ) ( TRUCK-AT ?auto_360 ?auto_353 ) ( not ( = ?auto_354 ?auto_356 ) ) ( not ( = ?auto_359 ?auto_358 ) ) ( not ( = ?auto_354 ?auto_355 ) ) ( not ( = ?auto_356 ?auto_355 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_354 ?auto_356 ?auto_355 ?auto_353 )
      ( DELIVER-3PKG-VERIFY ?auto_354 ?auto_355 ?auto_356 ?auto_353 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_371 - OBJ
      ?auto_372 - OBJ
      ?auto_373 - OBJ
      ?auto_370 - LOCATION
    )
    :vars
    (
      ?auto_374 - LOCATION
      ?auto_375 - CITY
      ?auto_376 - LOCATION
      ?auto_377 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_374 ?auto_375 ) ( IN-CITY ?auto_370 ?auto_375 ) ( not ( = ?auto_370 ?auto_374 ) ) ( OBJ-AT ?auto_373 ?auto_374 ) ( IN-CITY ?auto_376 ?auto_375 ) ( not ( = ?auto_370 ?auto_376 ) ) ( OBJ-AT ?auto_371 ?auto_376 ) ( OBJ-AT ?auto_372 ?auto_374 ) ( TRUCK-AT ?auto_377 ?auto_370 ) ( not ( = ?auto_372 ?auto_371 ) ) ( not ( = ?auto_376 ?auto_374 ) ) ( not ( = ?auto_372 ?auto_373 ) ) ( not ( = ?auto_371 ?auto_373 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_372 ?auto_373 ?auto_371 ?auto_370 )
      ( DELIVER-3PKG-VERIFY ?auto_371 ?auto_372 ?auto_373 ?auto_370 ) )
  )

)

