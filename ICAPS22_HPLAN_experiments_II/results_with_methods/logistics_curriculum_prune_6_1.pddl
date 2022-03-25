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

  ( :method DELIVER-6PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?obj6 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) ( OBJ-AT ?obj6 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_950364 - OBJ
      ?auto_950363 - LOCATION
    )
    :vars
    (
      ?auto_950366 - LOCATION
      ?auto_950367 - CITY
      ?auto_950365 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_950366 ?auto_950367 ) ( IN-CITY ?auto_950363 ?auto_950367 ) ( not ( = ?auto_950363 ?auto_950366 ) ) ( OBJ-AT ?auto_950364 ?auto_950366 ) ( TRUCK-AT ?auto_950365 ?auto_950363 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_950365 ?auto_950363 ?auto_950366 ?auto_950367 )
      ( !LOAD-TRUCK ?auto_950364 ?auto_950365 ?auto_950366 )
      ( !DRIVE-TRUCK ?auto_950365 ?auto_950366 ?auto_950363 ?auto_950367 )
      ( !UNLOAD-TRUCK ?auto_950364 ?auto_950365 ?auto_950363 )
      ( DELIVER-1PKG-VERIFY ?auto_950364 ?auto_950363 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_950385 - OBJ
      ?auto_950386 - OBJ
      ?auto_950384 - LOCATION
    )
    :vars
    (
      ?auto_950389 - LOCATION
      ?auto_950387 - CITY
      ?auto_950390 - LOCATION
      ?auto_950388 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_950389 ?auto_950387 ) ( IN-CITY ?auto_950384 ?auto_950387 ) ( not ( = ?auto_950384 ?auto_950389 ) ) ( OBJ-AT ?auto_950386 ?auto_950389 ) ( IN-CITY ?auto_950390 ?auto_950387 ) ( not ( = ?auto_950384 ?auto_950390 ) ) ( OBJ-AT ?auto_950385 ?auto_950390 ) ( TRUCK-AT ?auto_950388 ?auto_950384 ) ( not ( = ?auto_950385 ?auto_950386 ) ) ( not ( = ?auto_950389 ?auto_950390 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_950385 ?auto_950384 )
      ( DELIVER-1PKG ?auto_950386 ?auto_950384 )
      ( DELIVER-2PKG-VERIFY ?auto_950385 ?auto_950386 ?auto_950384 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_950496 - OBJ
      ?auto_950497 - OBJ
      ?auto_950498 - OBJ
      ?auto_950495 - LOCATION
    )
    :vars
    (
      ?auto_950499 - LOCATION
      ?auto_950501 - CITY
      ?auto_950502 - LOCATION
      ?auto_950503 - LOCATION
      ?auto_950500 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_950499 ?auto_950501 ) ( IN-CITY ?auto_950495 ?auto_950501 ) ( not ( = ?auto_950495 ?auto_950499 ) ) ( OBJ-AT ?auto_950498 ?auto_950499 ) ( IN-CITY ?auto_950502 ?auto_950501 ) ( not ( = ?auto_950495 ?auto_950502 ) ) ( OBJ-AT ?auto_950497 ?auto_950502 ) ( IN-CITY ?auto_950503 ?auto_950501 ) ( not ( = ?auto_950495 ?auto_950503 ) ) ( OBJ-AT ?auto_950496 ?auto_950503 ) ( TRUCK-AT ?auto_950500 ?auto_950495 ) ( not ( = ?auto_950496 ?auto_950497 ) ) ( not ( = ?auto_950502 ?auto_950503 ) ) ( not ( = ?auto_950496 ?auto_950498 ) ) ( not ( = ?auto_950497 ?auto_950498 ) ) ( not ( = ?auto_950499 ?auto_950502 ) ) ( not ( = ?auto_950499 ?auto_950503 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_950496 ?auto_950497 ?auto_950495 )
      ( DELIVER-1PKG ?auto_950498 ?auto_950495 )
      ( DELIVER-3PKG-VERIFY ?auto_950496 ?auto_950497 ?auto_950498 ?auto_950495 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_951639 - OBJ
      ?auto_951640 - OBJ
      ?auto_951641 - OBJ
      ?auto_951642 - OBJ
      ?auto_951638 - LOCATION
    )
    :vars
    (
      ?auto_951645 - LOCATION
      ?auto_951643 - CITY
      ?auto_951648 - LOCATION
      ?auto_951646 - LOCATION
      ?auto_951647 - LOCATION
      ?auto_951644 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_951645 ?auto_951643 ) ( IN-CITY ?auto_951638 ?auto_951643 ) ( not ( = ?auto_951638 ?auto_951645 ) ) ( OBJ-AT ?auto_951642 ?auto_951645 ) ( IN-CITY ?auto_951648 ?auto_951643 ) ( not ( = ?auto_951638 ?auto_951648 ) ) ( OBJ-AT ?auto_951641 ?auto_951648 ) ( IN-CITY ?auto_951646 ?auto_951643 ) ( not ( = ?auto_951638 ?auto_951646 ) ) ( OBJ-AT ?auto_951640 ?auto_951646 ) ( IN-CITY ?auto_951647 ?auto_951643 ) ( not ( = ?auto_951638 ?auto_951647 ) ) ( OBJ-AT ?auto_951639 ?auto_951647 ) ( TRUCK-AT ?auto_951644 ?auto_951638 ) ( not ( = ?auto_951639 ?auto_951640 ) ) ( not ( = ?auto_951646 ?auto_951647 ) ) ( not ( = ?auto_951639 ?auto_951641 ) ) ( not ( = ?auto_951640 ?auto_951641 ) ) ( not ( = ?auto_951648 ?auto_951646 ) ) ( not ( = ?auto_951648 ?auto_951647 ) ) ( not ( = ?auto_951639 ?auto_951642 ) ) ( not ( = ?auto_951640 ?auto_951642 ) ) ( not ( = ?auto_951641 ?auto_951642 ) ) ( not ( = ?auto_951645 ?auto_951648 ) ) ( not ( = ?auto_951645 ?auto_951646 ) ) ( not ( = ?auto_951645 ?auto_951647 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_951639 ?auto_951640 ?auto_951641 ?auto_951638 )
      ( DELIVER-1PKG ?auto_951642 ?auto_951638 )
      ( DELIVER-4PKG-VERIFY ?auto_951639 ?auto_951640 ?auto_951641 ?auto_951642 ?auto_951638 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_967331 - OBJ
      ?auto_967332 - OBJ
      ?auto_967333 - OBJ
      ?auto_967334 - OBJ
      ?auto_967335 - OBJ
      ?auto_967330 - LOCATION
    )
    :vars
    (
      ?auto_967337 - LOCATION
      ?auto_967336 - CITY
      ?auto_967340 - LOCATION
      ?auto_967339 - LOCATION
      ?auto_967341 - LOCATION
      ?auto_967342 - LOCATION
      ?auto_967338 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_967337 ?auto_967336 ) ( IN-CITY ?auto_967330 ?auto_967336 ) ( not ( = ?auto_967330 ?auto_967337 ) ) ( OBJ-AT ?auto_967335 ?auto_967337 ) ( IN-CITY ?auto_967340 ?auto_967336 ) ( not ( = ?auto_967330 ?auto_967340 ) ) ( OBJ-AT ?auto_967334 ?auto_967340 ) ( IN-CITY ?auto_967339 ?auto_967336 ) ( not ( = ?auto_967330 ?auto_967339 ) ) ( OBJ-AT ?auto_967333 ?auto_967339 ) ( IN-CITY ?auto_967341 ?auto_967336 ) ( not ( = ?auto_967330 ?auto_967341 ) ) ( OBJ-AT ?auto_967332 ?auto_967341 ) ( IN-CITY ?auto_967342 ?auto_967336 ) ( not ( = ?auto_967330 ?auto_967342 ) ) ( OBJ-AT ?auto_967331 ?auto_967342 ) ( TRUCK-AT ?auto_967338 ?auto_967330 ) ( not ( = ?auto_967331 ?auto_967332 ) ) ( not ( = ?auto_967341 ?auto_967342 ) ) ( not ( = ?auto_967331 ?auto_967333 ) ) ( not ( = ?auto_967332 ?auto_967333 ) ) ( not ( = ?auto_967339 ?auto_967341 ) ) ( not ( = ?auto_967339 ?auto_967342 ) ) ( not ( = ?auto_967331 ?auto_967334 ) ) ( not ( = ?auto_967332 ?auto_967334 ) ) ( not ( = ?auto_967333 ?auto_967334 ) ) ( not ( = ?auto_967340 ?auto_967339 ) ) ( not ( = ?auto_967340 ?auto_967341 ) ) ( not ( = ?auto_967340 ?auto_967342 ) ) ( not ( = ?auto_967331 ?auto_967335 ) ) ( not ( = ?auto_967332 ?auto_967335 ) ) ( not ( = ?auto_967333 ?auto_967335 ) ) ( not ( = ?auto_967334 ?auto_967335 ) ) ( not ( = ?auto_967337 ?auto_967340 ) ) ( not ( = ?auto_967337 ?auto_967339 ) ) ( not ( = ?auto_967337 ?auto_967341 ) ) ( not ( = ?auto_967337 ?auto_967342 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_967331 ?auto_967332 ?auto_967333 ?auto_967334 ?auto_967330 )
      ( DELIVER-1PKG ?auto_967335 ?auto_967330 )
      ( DELIVER-5PKG-VERIFY ?auto_967331 ?auto_967332 ?auto_967333 ?auto_967334 ?auto_967335 ?auto_967330 ) )
  )

  ( :method DELIVER-6PKG
    :parameters
    (
      ?auto_1228201 - OBJ
      ?auto_1228202 - OBJ
      ?auto_1228203 - OBJ
      ?auto_1228204 - OBJ
      ?auto_1228205 - OBJ
      ?auto_1228206 - OBJ
      ?auto_1228200 - LOCATION
    )
    :vars
    (
      ?auto_1228209 - LOCATION
      ?auto_1228208 - CITY
      ?auto_1228214 - LOCATION
      ?auto_1228213 - LOCATION
      ?auto_1228210 - LOCATION
      ?auto_1228211 - LOCATION
      ?auto_1228212 - LOCATION
      ?auto_1228207 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1228209 ?auto_1228208 ) ( IN-CITY ?auto_1228200 ?auto_1228208 ) ( not ( = ?auto_1228200 ?auto_1228209 ) ) ( OBJ-AT ?auto_1228206 ?auto_1228209 ) ( IN-CITY ?auto_1228214 ?auto_1228208 ) ( not ( = ?auto_1228200 ?auto_1228214 ) ) ( OBJ-AT ?auto_1228205 ?auto_1228214 ) ( IN-CITY ?auto_1228213 ?auto_1228208 ) ( not ( = ?auto_1228200 ?auto_1228213 ) ) ( OBJ-AT ?auto_1228204 ?auto_1228213 ) ( IN-CITY ?auto_1228210 ?auto_1228208 ) ( not ( = ?auto_1228200 ?auto_1228210 ) ) ( OBJ-AT ?auto_1228203 ?auto_1228210 ) ( IN-CITY ?auto_1228211 ?auto_1228208 ) ( not ( = ?auto_1228200 ?auto_1228211 ) ) ( OBJ-AT ?auto_1228202 ?auto_1228211 ) ( IN-CITY ?auto_1228212 ?auto_1228208 ) ( not ( = ?auto_1228200 ?auto_1228212 ) ) ( OBJ-AT ?auto_1228201 ?auto_1228212 ) ( TRUCK-AT ?auto_1228207 ?auto_1228200 ) ( not ( = ?auto_1228201 ?auto_1228202 ) ) ( not ( = ?auto_1228211 ?auto_1228212 ) ) ( not ( = ?auto_1228201 ?auto_1228203 ) ) ( not ( = ?auto_1228202 ?auto_1228203 ) ) ( not ( = ?auto_1228210 ?auto_1228211 ) ) ( not ( = ?auto_1228210 ?auto_1228212 ) ) ( not ( = ?auto_1228201 ?auto_1228204 ) ) ( not ( = ?auto_1228202 ?auto_1228204 ) ) ( not ( = ?auto_1228203 ?auto_1228204 ) ) ( not ( = ?auto_1228213 ?auto_1228210 ) ) ( not ( = ?auto_1228213 ?auto_1228211 ) ) ( not ( = ?auto_1228213 ?auto_1228212 ) ) ( not ( = ?auto_1228201 ?auto_1228205 ) ) ( not ( = ?auto_1228202 ?auto_1228205 ) ) ( not ( = ?auto_1228203 ?auto_1228205 ) ) ( not ( = ?auto_1228204 ?auto_1228205 ) ) ( not ( = ?auto_1228214 ?auto_1228213 ) ) ( not ( = ?auto_1228214 ?auto_1228210 ) ) ( not ( = ?auto_1228214 ?auto_1228211 ) ) ( not ( = ?auto_1228214 ?auto_1228212 ) ) ( not ( = ?auto_1228201 ?auto_1228206 ) ) ( not ( = ?auto_1228202 ?auto_1228206 ) ) ( not ( = ?auto_1228203 ?auto_1228206 ) ) ( not ( = ?auto_1228204 ?auto_1228206 ) ) ( not ( = ?auto_1228205 ?auto_1228206 ) ) ( not ( = ?auto_1228209 ?auto_1228214 ) ) ( not ( = ?auto_1228209 ?auto_1228213 ) ) ( not ( = ?auto_1228209 ?auto_1228210 ) ) ( not ( = ?auto_1228209 ?auto_1228211 ) ) ( not ( = ?auto_1228209 ?auto_1228212 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_1228201 ?auto_1228202 ?auto_1228203 ?auto_1228204 ?auto_1228205 ?auto_1228200 )
      ( DELIVER-1PKG ?auto_1228206 ?auto_1228200 )
      ( DELIVER-6PKG-VERIFY ?auto_1228201 ?auto_1228202 ?auto_1228203 ?auto_1228204 ?auto_1228205 ?auto_1228206 ?auto_1228200 ) )
  )

)

