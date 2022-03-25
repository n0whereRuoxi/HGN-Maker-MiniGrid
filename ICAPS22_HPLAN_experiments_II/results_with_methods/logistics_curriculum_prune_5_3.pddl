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
      ?auto_144188 - OBJ
      ?auto_144187 - LOCATION
    )
    :vars
    (
      ?auto_144190 - LOCATION
      ?auto_144191 - CITY
      ?auto_144189 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144190 ?auto_144191 ) ( IN-CITY ?auto_144187 ?auto_144191 ) ( not ( = ?auto_144187 ?auto_144190 ) ) ( OBJ-AT ?auto_144188 ?auto_144190 ) ( TRUCK-AT ?auto_144189 ?auto_144187 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_144189 ?auto_144187 ?auto_144190 ?auto_144191 )
      ( !LOAD-TRUCK ?auto_144188 ?auto_144189 ?auto_144190 )
      ( !DRIVE-TRUCK ?auto_144189 ?auto_144190 ?auto_144187 ?auto_144191 )
      ( !UNLOAD-TRUCK ?auto_144188 ?auto_144189 ?auto_144187 )
      ( DELIVER-1PKG-VERIFY ?auto_144188 ?auto_144187 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_144209 - OBJ
      ?auto_144210 - OBJ
      ?auto_144208 - LOCATION
    )
    :vars
    (
      ?auto_144211 - LOCATION
      ?auto_144213 - CITY
      ?auto_144212 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144211 ?auto_144213 ) ( IN-CITY ?auto_144208 ?auto_144213 ) ( not ( = ?auto_144208 ?auto_144211 ) ) ( OBJ-AT ?auto_144210 ?auto_144211 ) ( OBJ-AT ?auto_144209 ?auto_144211 ) ( TRUCK-AT ?auto_144212 ?auto_144208 ) ( not ( = ?auto_144209 ?auto_144210 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_144209 ?auto_144208 )
      ( DELIVER-1PKG ?auto_144210 ?auto_144208 )
      ( DELIVER-2PKG-VERIFY ?auto_144209 ?auto_144210 ?auto_144208 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_144317 - OBJ
      ?auto_144318 - OBJ
      ?auto_144319 - OBJ
      ?auto_144316 - LOCATION
    )
    :vars
    (
      ?auto_144321 - LOCATION
      ?auto_144320 - CITY
      ?auto_144323 - LOCATION
      ?auto_144322 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144321 ?auto_144320 ) ( IN-CITY ?auto_144316 ?auto_144320 ) ( not ( = ?auto_144316 ?auto_144321 ) ) ( OBJ-AT ?auto_144319 ?auto_144321 ) ( IN-CITY ?auto_144323 ?auto_144320 ) ( not ( = ?auto_144316 ?auto_144323 ) ) ( OBJ-AT ?auto_144318 ?auto_144323 ) ( OBJ-AT ?auto_144317 ?auto_144323 ) ( TRUCK-AT ?auto_144322 ?auto_144316 ) ( not ( = ?auto_144317 ?auto_144318 ) ) ( not ( = ?auto_144317 ?auto_144319 ) ) ( not ( = ?auto_144318 ?auto_144319 ) ) ( not ( = ?auto_144321 ?auto_144323 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_144317 ?auto_144318 ?auto_144316 )
      ( DELIVER-1PKG ?auto_144319 ?auto_144316 )
      ( DELIVER-3PKG-VERIFY ?auto_144317 ?auto_144318 ?auto_144319 ?auto_144316 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_144334 - OBJ
      ?auto_144335 - OBJ
      ?auto_144336 - OBJ
      ?auto_144333 - LOCATION
    )
    :vars
    (
      ?auto_144338 - LOCATION
      ?auto_144340 - CITY
      ?auto_144337 - LOCATION
      ?auto_144339 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144338 ?auto_144340 ) ( IN-CITY ?auto_144333 ?auto_144340 ) ( not ( = ?auto_144333 ?auto_144338 ) ) ( OBJ-AT ?auto_144335 ?auto_144338 ) ( IN-CITY ?auto_144337 ?auto_144340 ) ( not ( = ?auto_144333 ?auto_144337 ) ) ( OBJ-AT ?auto_144336 ?auto_144337 ) ( OBJ-AT ?auto_144334 ?auto_144337 ) ( TRUCK-AT ?auto_144339 ?auto_144333 ) ( not ( = ?auto_144334 ?auto_144336 ) ) ( not ( = ?auto_144334 ?auto_144335 ) ) ( not ( = ?auto_144336 ?auto_144335 ) ) ( not ( = ?auto_144338 ?auto_144337 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_144334 ?auto_144336 ?auto_144335 ?auto_144333 )
      ( DELIVER-3PKG-VERIFY ?auto_144334 ?auto_144335 ?auto_144336 ?auto_144333 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_144395 - OBJ
      ?auto_144396 - OBJ
      ?auto_144397 - OBJ
      ?auto_144394 - LOCATION
    )
    :vars
    (
      ?auto_144401 - LOCATION
      ?auto_144398 - CITY
      ?auto_144400 - LOCATION
      ?auto_144399 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_144401 ?auto_144398 ) ( IN-CITY ?auto_144394 ?auto_144398 ) ( not ( = ?auto_144394 ?auto_144401 ) ) ( OBJ-AT ?auto_144395 ?auto_144401 ) ( IN-CITY ?auto_144400 ?auto_144398 ) ( not ( = ?auto_144394 ?auto_144400 ) ) ( OBJ-AT ?auto_144397 ?auto_144400 ) ( OBJ-AT ?auto_144396 ?auto_144400 ) ( TRUCK-AT ?auto_144399 ?auto_144394 ) ( not ( = ?auto_144396 ?auto_144397 ) ) ( not ( = ?auto_144396 ?auto_144395 ) ) ( not ( = ?auto_144397 ?auto_144395 ) ) ( not ( = ?auto_144401 ?auto_144400 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_144396 ?auto_144395 ?auto_144397 ?auto_144394 )
      ( DELIVER-3PKG-VERIFY ?auto_144395 ?auto_144396 ?auto_144397 ?auto_144394 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_145446 - OBJ
      ?auto_145447 - OBJ
      ?auto_145448 - OBJ
      ?auto_145449 - OBJ
      ?auto_145445 - LOCATION
    )
    :vars
    (
      ?auto_145450 - LOCATION
      ?auto_145452 - CITY
      ?auto_145454 - LOCATION
      ?auto_145453 - LOCATION
      ?auto_145451 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_145450 ?auto_145452 ) ( IN-CITY ?auto_145445 ?auto_145452 ) ( not ( = ?auto_145445 ?auto_145450 ) ) ( OBJ-AT ?auto_145449 ?auto_145450 ) ( IN-CITY ?auto_145454 ?auto_145452 ) ( not ( = ?auto_145445 ?auto_145454 ) ) ( OBJ-AT ?auto_145448 ?auto_145454 ) ( IN-CITY ?auto_145453 ?auto_145452 ) ( not ( = ?auto_145445 ?auto_145453 ) ) ( OBJ-AT ?auto_145447 ?auto_145453 ) ( OBJ-AT ?auto_145446 ?auto_145453 ) ( TRUCK-AT ?auto_145451 ?auto_145445 ) ( not ( = ?auto_145446 ?auto_145447 ) ) ( not ( = ?auto_145446 ?auto_145448 ) ) ( not ( = ?auto_145447 ?auto_145448 ) ) ( not ( = ?auto_145454 ?auto_145453 ) ) ( not ( = ?auto_145446 ?auto_145449 ) ) ( not ( = ?auto_145447 ?auto_145449 ) ) ( not ( = ?auto_145448 ?auto_145449 ) ) ( not ( = ?auto_145450 ?auto_145454 ) ) ( not ( = ?auto_145450 ?auto_145453 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_145446 ?auto_145448 ?auto_145447 ?auto_145445 )
      ( DELIVER-1PKG ?auto_145449 ?auto_145445 )
      ( DELIVER-4PKG-VERIFY ?auto_145446 ?auto_145447 ?auto_145448 ?auto_145449 ?auto_145445 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_145505 - OBJ
      ?auto_145506 - OBJ
      ?auto_145507 - OBJ
      ?auto_145508 - OBJ
      ?auto_145504 - LOCATION
    )
    :vars
    (
      ?auto_145510 - LOCATION
      ?auto_145513 - CITY
      ?auto_145509 - LOCATION
      ?auto_145512 - LOCATION
      ?auto_145511 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_145510 ?auto_145513 ) ( IN-CITY ?auto_145504 ?auto_145513 ) ( not ( = ?auto_145504 ?auto_145510 ) ) ( OBJ-AT ?auto_145508 ?auto_145510 ) ( IN-CITY ?auto_145509 ?auto_145513 ) ( not ( = ?auto_145504 ?auto_145509 ) ) ( OBJ-AT ?auto_145506 ?auto_145509 ) ( IN-CITY ?auto_145512 ?auto_145513 ) ( not ( = ?auto_145504 ?auto_145512 ) ) ( OBJ-AT ?auto_145507 ?auto_145512 ) ( OBJ-AT ?auto_145505 ?auto_145512 ) ( TRUCK-AT ?auto_145511 ?auto_145504 ) ( not ( = ?auto_145505 ?auto_145507 ) ) ( not ( = ?auto_145505 ?auto_145506 ) ) ( not ( = ?auto_145507 ?auto_145506 ) ) ( not ( = ?auto_145509 ?auto_145512 ) ) ( not ( = ?auto_145505 ?auto_145508 ) ) ( not ( = ?auto_145507 ?auto_145508 ) ) ( not ( = ?auto_145506 ?auto_145508 ) ) ( not ( = ?auto_145510 ?auto_145509 ) ) ( not ( = ?auto_145510 ?auto_145512 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_145505 ?auto_145507 ?auto_145506 ?auto_145508 ?auto_145504 )
      ( DELIVER-4PKG-VERIFY ?auto_145505 ?auto_145506 ?auto_145507 ?auto_145508 ?auto_145504 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_145537 - OBJ
      ?auto_145538 - OBJ
      ?auto_145539 - OBJ
      ?auto_145540 - OBJ
      ?auto_145536 - LOCATION
    )
    :vars
    (
      ?auto_145545 - LOCATION
      ?auto_145544 - CITY
      ?auto_145543 - LOCATION
      ?auto_145541 - LOCATION
      ?auto_145542 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_145545 ?auto_145544 ) ( IN-CITY ?auto_145536 ?auto_145544 ) ( not ( = ?auto_145536 ?auto_145545 ) ) ( OBJ-AT ?auto_145539 ?auto_145545 ) ( IN-CITY ?auto_145543 ?auto_145544 ) ( not ( = ?auto_145536 ?auto_145543 ) ) ( OBJ-AT ?auto_145538 ?auto_145543 ) ( IN-CITY ?auto_145541 ?auto_145544 ) ( not ( = ?auto_145536 ?auto_145541 ) ) ( OBJ-AT ?auto_145540 ?auto_145541 ) ( OBJ-AT ?auto_145537 ?auto_145541 ) ( TRUCK-AT ?auto_145542 ?auto_145536 ) ( not ( = ?auto_145537 ?auto_145540 ) ) ( not ( = ?auto_145537 ?auto_145538 ) ) ( not ( = ?auto_145540 ?auto_145538 ) ) ( not ( = ?auto_145543 ?auto_145541 ) ) ( not ( = ?auto_145537 ?auto_145539 ) ) ( not ( = ?auto_145540 ?auto_145539 ) ) ( not ( = ?auto_145538 ?auto_145539 ) ) ( not ( = ?auto_145545 ?auto_145543 ) ) ( not ( = ?auto_145545 ?auto_145541 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_145537 ?auto_145538 ?auto_145540 ?auto_145539 ?auto_145536 )
      ( DELIVER-4PKG-VERIFY ?auto_145537 ?auto_145538 ?auto_145539 ?auto_145540 ?auto_145536 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_146126 - OBJ
      ?auto_146127 - OBJ
      ?auto_146128 - OBJ
      ?auto_146129 - OBJ
      ?auto_146125 - LOCATION
    )
    :vars
    (
      ?auto_146134 - LOCATION
      ?auto_146133 - CITY
      ?auto_146132 - LOCATION
      ?auto_146130 - LOCATION
      ?auto_146131 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_146134 ?auto_146133 ) ( IN-CITY ?auto_146125 ?auto_146133 ) ( not ( = ?auto_146125 ?auto_146134 ) ) ( OBJ-AT ?auto_146129 ?auto_146134 ) ( IN-CITY ?auto_146132 ?auto_146133 ) ( not ( = ?auto_146125 ?auto_146132 ) ) ( OBJ-AT ?auto_146126 ?auto_146132 ) ( IN-CITY ?auto_146130 ?auto_146133 ) ( not ( = ?auto_146125 ?auto_146130 ) ) ( OBJ-AT ?auto_146128 ?auto_146130 ) ( OBJ-AT ?auto_146127 ?auto_146130 ) ( TRUCK-AT ?auto_146131 ?auto_146125 ) ( not ( = ?auto_146127 ?auto_146128 ) ) ( not ( = ?auto_146127 ?auto_146126 ) ) ( not ( = ?auto_146128 ?auto_146126 ) ) ( not ( = ?auto_146132 ?auto_146130 ) ) ( not ( = ?auto_146127 ?auto_146129 ) ) ( not ( = ?auto_146128 ?auto_146129 ) ) ( not ( = ?auto_146126 ?auto_146129 ) ) ( not ( = ?auto_146134 ?auto_146132 ) ) ( not ( = ?auto_146134 ?auto_146130 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_146127 ?auto_146126 ?auto_146128 ?auto_146129 ?auto_146125 )
      ( DELIVER-4PKG-VERIFY ?auto_146126 ?auto_146127 ?auto_146128 ?auto_146129 ?auto_146125 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_146158 - OBJ
      ?auto_146159 - OBJ
      ?auto_146160 - OBJ
      ?auto_146161 - OBJ
      ?auto_146157 - LOCATION
    )
    :vars
    (
      ?auto_146166 - LOCATION
      ?auto_146165 - CITY
      ?auto_146164 - LOCATION
      ?auto_146162 - LOCATION
      ?auto_146163 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_146166 ?auto_146165 ) ( IN-CITY ?auto_146157 ?auto_146165 ) ( not ( = ?auto_146157 ?auto_146166 ) ) ( OBJ-AT ?auto_146160 ?auto_146166 ) ( IN-CITY ?auto_146164 ?auto_146165 ) ( not ( = ?auto_146157 ?auto_146164 ) ) ( OBJ-AT ?auto_146158 ?auto_146164 ) ( IN-CITY ?auto_146162 ?auto_146165 ) ( not ( = ?auto_146157 ?auto_146162 ) ) ( OBJ-AT ?auto_146161 ?auto_146162 ) ( OBJ-AT ?auto_146159 ?auto_146162 ) ( TRUCK-AT ?auto_146163 ?auto_146157 ) ( not ( = ?auto_146159 ?auto_146161 ) ) ( not ( = ?auto_146159 ?auto_146158 ) ) ( not ( = ?auto_146161 ?auto_146158 ) ) ( not ( = ?auto_146164 ?auto_146162 ) ) ( not ( = ?auto_146159 ?auto_146160 ) ) ( not ( = ?auto_146161 ?auto_146160 ) ) ( not ( = ?auto_146158 ?auto_146160 ) ) ( not ( = ?auto_146166 ?auto_146164 ) ) ( not ( = ?auto_146166 ?auto_146162 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_146159 ?auto_146158 ?auto_146161 ?auto_146160 ?auto_146157 )
      ( DELIVER-4PKG-VERIFY ?auto_146158 ?auto_146159 ?auto_146160 ?auto_146161 ?auto_146157 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_146346 - OBJ
      ?auto_146347 - OBJ
      ?auto_146348 - OBJ
      ?auto_146349 - OBJ
      ?auto_146345 - LOCATION
    )
    :vars
    (
      ?auto_146354 - LOCATION
      ?auto_146353 - CITY
      ?auto_146352 - LOCATION
      ?auto_146350 - LOCATION
      ?auto_146351 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_146354 ?auto_146353 ) ( IN-CITY ?auto_146345 ?auto_146353 ) ( not ( = ?auto_146345 ?auto_146354 ) ) ( OBJ-AT ?auto_146347 ?auto_146354 ) ( IN-CITY ?auto_146352 ?auto_146353 ) ( not ( = ?auto_146345 ?auto_146352 ) ) ( OBJ-AT ?auto_146346 ?auto_146352 ) ( IN-CITY ?auto_146350 ?auto_146353 ) ( not ( = ?auto_146345 ?auto_146350 ) ) ( OBJ-AT ?auto_146349 ?auto_146350 ) ( OBJ-AT ?auto_146348 ?auto_146350 ) ( TRUCK-AT ?auto_146351 ?auto_146345 ) ( not ( = ?auto_146348 ?auto_146349 ) ) ( not ( = ?auto_146348 ?auto_146346 ) ) ( not ( = ?auto_146349 ?auto_146346 ) ) ( not ( = ?auto_146352 ?auto_146350 ) ) ( not ( = ?auto_146348 ?auto_146347 ) ) ( not ( = ?auto_146349 ?auto_146347 ) ) ( not ( = ?auto_146346 ?auto_146347 ) ) ( not ( = ?auto_146354 ?auto_146352 ) ) ( not ( = ?auto_146354 ?auto_146350 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_146348 ?auto_146346 ?auto_146349 ?auto_146347 ?auto_146345 )
      ( DELIVER-4PKG-VERIFY ?auto_146346 ?auto_146347 ?auto_146348 ?auto_146349 ?auto_146345 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_160938 - OBJ
      ?auto_160939 - OBJ
      ?auto_160940 - OBJ
      ?auto_160941 - OBJ
      ?auto_160942 - OBJ
      ?auto_160937 - LOCATION
    )
    :vars
    (
      ?auto_160943 - LOCATION
      ?auto_160945 - CITY
      ?auto_160948 - LOCATION
      ?auto_160947 - LOCATION
      ?auto_160946 - LOCATION
      ?auto_160944 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_160943 ?auto_160945 ) ( IN-CITY ?auto_160937 ?auto_160945 ) ( not ( = ?auto_160937 ?auto_160943 ) ) ( OBJ-AT ?auto_160942 ?auto_160943 ) ( IN-CITY ?auto_160948 ?auto_160945 ) ( not ( = ?auto_160937 ?auto_160948 ) ) ( OBJ-AT ?auto_160941 ?auto_160948 ) ( IN-CITY ?auto_160947 ?auto_160945 ) ( not ( = ?auto_160937 ?auto_160947 ) ) ( OBJ-AT ?auto_160940 ?auto_160947 ) ( IN-CITY ?auto_160946 ?auto_160945 ) ( not ( = ?auto_160937 ?auto_160946 ) ) ( OBJ-AT ?auto_160939 ?auto_160946 ) ( OBJ-AT ?auto_160938 ?auto_160946 ) ( TRUCK-AT ?auto_160944 ?auto_160937 ) ( not ( = ?auto_160938 ?auto_160939 ) ) ( not ( = ?auto_160938 ?auto_160940 ) ) ( not ( = ?auto_160939 ?auto_160940 ) ) ( not ( = ?auto_160947 ?auto_160946 ) ) ( not ( = ?auto_160938 ?auto_160941 ) ) ( not ( = ?auto_160939 ?auto_160941 ) ) ( not ( = ?auto_160940 ?auto_160941 ) ) ( not ( = ?auto_160948 ?auto_160947 ) ) ( not ( = ?auto_160948 ?auto_160946 ) ) ( not ( = ?auto_160938 ?auto_160942 ) ) ( not ( = ?auto_160939 ?auto_160942 ) ) ( not ( = ?auto_160940 ?auto_160942 ) ) ( not ( = ?auto_160941 ?auto_160942 ) ) ( not ( = ?auto_160943 ?auto_160948 ) ) ( not ( = ?auto_160943 ?auto_160947 ) ) ( not ( = ?auto_160943 ?auto_160946 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_160938 ?auto_160940 ?auto_160939 ?auto_160941 ?auto_160937 )
      ( DELIVER-1PKG ?auto_160942 ?auto_160937 )
      ( DELIVER-5PKG-VERIFY ?auto_160938 ?auto_160939 ?auto_160940 ?auto_160941 ?auto_160942 ?auto_160937 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_161592 - OBJ
      ?auto_161593 - OBJ
      ?auto_161594 - OBJ
      ?auto_161595 - OBJ
      ?auto_161596 - OBJ
      ?auto_161591 - LOCATION
    )
    :vars
    (
      ?auto_161601 - LOCATION
      ?auto_161597 - CITY
      ?auto_161602 - LOCATION
      ?auto_161600 - LOCATION
      ?auto_161599 - LOCATION
      ?auto_161598 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_161601 ?auto_161597 ) ( IN-CITY ?auto_161591 ?auto_161597 ) ( not ( = ?auto_161591 ?auto_161601 ) ) ( OBJ-AT ?auto_161596 ?auto_161601 ) ( IN-CITY ?auto_161602 ?auto_161597 ) ( not ( = ?auto_161591 ?auto_161602 ) ) ( OBJ-AT ?auto_161595 ?auto_161602 ) ( IN-CITY ?auto_161600 ?auto_161597 ) ( not ( = ?auto_161591 ?auto_161600 ) ) ( OBJ-AT ?auto_161593 ?auto_161600 ) ( IN-CITY ?auto_161599 ?auto_161597 ) ( not ( = ?auto_161591 ?auto_161599 ) ) ( OBJ-AT ?auto_161594 ?auto_161599 ) ( OBJ-AT ?auto_161592 ?auto_161599 ) ( TRUCK-AT ?auto_161598 ?auto_161591 ) ( not ( = ?auto_161592 ?auto_161594 ) ) ( not ( = ?auto_161592 ?auto_161593 ) ) ( not ( = ?auto_161594 ?auto_161593 ) ) ( not ( = ?auto_161600 ?auto_161599 ) ) ( not ( = ?auto_161592 ?auto_161595 ) ) ( not ( = ?auto_161594 ?auto_161595 ) ) ( not ( = ?auto_161593 ?auto_161595 ) ) ( not ( = ?auto_161602 ?auto_161600 ) ) ( not ( = ?auto_161602 ?auto_161599 ) ) ( not ( = ?auto_161592 ?auto_161596 ) ) ( not ( = ?auto_161594 ?auto_161596 ) ) ( not ( = ?auto_161593 ?auto_161596 ) ) ( not ( = ?auto_161595 ?auto_161596 ) ) ( not ( = ?auto_161601 ?auto_161602 ) ) ( not ( = ?auto_161601 ?auto_161600 ) ) ( not ( = ?auto_161601 ?auto_161599 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_161592 ?auto_161594 ?auto_161593 ?auto_161595 ?auto_161596 ?auto_161591 )
      ( DELIVER-5PKG-VERIFY ?auto_161592 ?auto_161593 ?auto_161594 ?auto_161595 ?auto_161596 ?auto_161591 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_161797 - OBJ
      ?auto_161798 - OBJ
      ?auto_161799 - OBJ
      ?auto_161800 - OBJ
      ?auto_161801 - OBJ
      ?auto_161796 - LOCATION
    )
    :vars
    (
      ?auto_161805 - LOCATION
      ?auto_161803 - CITY
      ?auto_161802 - LOCATION
      ?auto_161804 - LOCATION
      ?auto_161807 - LOCATION
      ?auto_161806 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_161805 ?auto_161803 ) ( IN-CITY ?auto_161796 ?auto_161803 ) ( not ( = ?auto_161796 ?auto_161805 ) ) ( OBJ-AT ?auto_161801 ?auto_161805 ) ( IN-CITY ?auto_161802 ?auto_161803 ) ( not ( = ?auto_161796 ?auto_161802 ) ) ( OBJ-AT ?auto_161799 ?auto_161802 ) ( IN-CITY ?auto_161804 ?auto_161803 ) ( not ( = ?auto_161796 ?auto_161804 ) ) ( OBJ-AT ?auto_161798 ?auto_161804 ) ( IN-CITY ?auto_161807 ?auto_161803 ) ( not ( = ?auto_161796 ?auto_161807 ) ) ( OBJ-AT ?auto_161800 ?auto_161807 ) ( OBJ-AT ?auto_161797 ?auto_161807 ) ( TRUCK-AT ?auto_161806 ?auto_161796 ) ( not ( = ?auto_161797 ?auto_161800 ) ) ( not ( = ?auto_161797 ?auto_161798 ) ) ( not ( = ?auto_161800 ?auto_161798 ) ) ( not ( = ?auto_161804 ?auto_161807 ) ) ( not ( = ?auto_161797 ?auto_161799 ) ) ( not ( = ?auto_161800 ?auto_161799 ) ) ( not ( = ?auto_161798 ?auto_161799 ) ) ( not ( = ?auto_161802 ?auto_161804 ) ) ( not ( = ?auto_161802 ?auto_161807 ) ) ( not ( = ?auto_161797 ?auto_161801 ) ) ( not ( = ?auto_161800 ?auto_161801 ) ) ( not ( = ?auto_161798 ?auto_161801 ) ) ( not ( = ?auto_161799 ?auto_161801 ) ) ( not ( = ?auto_161805 ?auto_161802 ) ) ( not ( = ?auto_161805 ?auto_161804 ) ) ( not ( = ?auto_161805 ?auto_161807 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_161797 ?auto_161798 ?auto_161800 ?auto_161799 ?auto_161801 ?auto_161796 )
      ( DELIVER-5PKG-VERIFY ?auto_161797 ?auto_161798 ?auto_161799 ?auto_161800 ?auto_161801 ?auto_161796 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_161848 - OBJ
      ?auto_161849 - OBJ
      ?auto_161850 - OBJ
      ?auto_161851 - OBJ
      ?auto_161852 - OBJ
      ?auto_161847 - LOCATION
    )
    :vars
    (
      ?auto_161856 - LOCATION
      ?auto_161854 - CITY
      ?auto_161853 - LOCATION
      ?auto_161855 - LOCATION
      ?auto_161858 - LOCATION
      ?auto_161857 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_161856 ?auto_161854 ) ( IN-CITY ?auto_161847 ?auto_161854 ) ( not ( = ?auto_161847 ?auto_161856 ) ) ( OBJ-AT ?auto_161851 ?auto_161856 ) ( IN-CITY ?auto_161853 ?auto_161854 ) ( not ( = ?auto_161847 ?auto_161853 ) ) ( OBJ-AT ?auto_161850 ?auto_161853 ) ( IN-CITY ?auto_161855 ?auto_161854 ) ( not ( = ?auto_161847 ?auto_161855 ) ) ( OBJ-AT ?auto_161849 ?auto_161855 ) ( IN-CITY ?auto_161858 ?auto_161854 ) ( not ( = ?auto_161847 ?auto_161858 ) ) ( OBJ-AT ?auto_161852 ?auto_161858 ) ( OBJ-AT ?auto_161848 ?auto_161858 ) ( TRUCK-AT ?auto_161857 ?auto_161847 ) ( not ( = ?auto_161848 ?auto_161852 ) ) ( not ( = ?auto_161848 ?auto_161849 ) ) ( not ( = ?auto_161852 ?auto_161849 ) ) ( not ( = ?auto_161855 ?auto_161858 ) ) ( not ( = ?auto_161848 ?auto_161850 ) ) ( not ( = ?auto_161852 ?auto_161850 ) ) ( not ( = ?auto_161849 ?auto_161850 ) ) ( not ( = ?auto_161853 ?auto_161855 ) ) ( not ( = ?auto_161853 ?auto_161858 ) ) ( not ( = ?auto_161848 ?auto_161851 ) ) ( not ( = ?auto_161852 ?auto_161851 ) ) ( not ( = ?auto_161849 ?auto_161851 ) ) ( not ( = ?auto_161850 ?auto_161851 ) ) ( not ( = ?auto_161856 ?auto_161853 ) ) ( not ( = ?auto_161856 ?auto_161855 ) ) ( not ( = ?auto_161856 ?auto_161858 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_161848 ?auto_161849 ?auto_161852 ?auto_161850 ?auto_161851 ?auto_161847 )
      ( DELIVER-5PKG-VERIFY ?auto_161848 ?auto_161849 ?auto_161850 ?auto_161851 ?auto_161852 ?auto_161847 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_169615 - OBJ
      ?auto_169616 - OBJ
      ?auto_169617 - OBJ
      ?auto_169618 - OBJ
      ?auto_169619 - OBJ
      ?auto_169614 - LOCATION
    )
    :vars
    (
      ?auto_169623 - LOCATION
      ?auto_169621 - CITY
      ?auto_169620 - LOCATION
      ?auto_169622 - LOCATION
      ?auto_169625 - LOCATION
      ?auto_169624 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_169623 ?auto_169621 ) ( IN-CITY ?auto_169614 ?auto_169621 ) ( not ( = ?auto_169614 ?auto_169623 ) ) ( OBJ-AT ?auto_169619 ?auto_169623 ) ( IN-CITY ?auto_169620 ?auto_169621 ) ( not ( = ?auto_169614 ?auto_169620 ) ) ( OBJ-AT ?auto_169618 ?auto_169620 ) ( IN-CITY ?auto_169622 ?auto_169621 ) ( not ( = ?auto_169614 ?auto_169622 ) ) ( OBJ-AT ?auto_169615 ?auto_169622 ) ( IN-CITY ?auto_169625 ?auto_169621 ) ( not ( = ?auto_169614 ?auto_169625 ) ) ( OBJ-AT ?auto_169617 ?auto_169625 ) ( OBJ-AT ?auto_169616 ?auto_169625 ) ( TRUCK-AT ?auto_169624 ?auto_169614 ) ( not ( = ?auto_169616 ?auto_169617 ) ) ( not ( = ?auto_169616 ?auto_169615 ) ) ( not ( = ?auto_169617 ?auto_169615 ) ) ( not ( = ?auto_169622 ?auto_169625 ) ) ( not ( = ?auto_169616 ?auto_169618 ) ) ( not ( = ?auto_169617 ?auto_169618 ) ) ( not ( = ?auto_169615 ?auto_169618 ) ) ( not ( = ?auto_169620 ?auto_169622 ) ) ( not ( = ?auto_169620 ?auto_169625 ) ) ( not ( = ?auto_169616 ?auto_169619 ) ) ( not ( = ?auto_169617 ?auto_169619 ) ) ( not ( = ?auto_169615 ?auto_169619 ) ) ( not ( = ?auto_169618 ?auto_169619 ) ) ( not ( = ?auto_169623 ?auto_169620 ) ) ( not ( = ?auto_169623 ?auto_169622 ) ) ( not ( = ?auto_169623 ?auto_169625 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_169616 ?auto_169615 ?auto_169617 ?auto_169618 ?auto_169619 ?auto_169614 )
      ( DELIVER-5PKG-VERIFY ?auto_169615 ?auto_169616 ?auto_169617 ?auto_169618 ?auto_169619 ?auto_169614 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_169820 - OBJ
      ?auto_169821 - OBJ
      ?auto_169822 - OBJ
      ?auto_169823 - OBJ
      ?auto_169824 - OBJ
      ?auto_169819 - LOCATION
    )
    :vars
    (
      ?auto_169828 - LOCATION
      ?auto_169826 - CITY
      ?auto_169825 - LOCATION
      ?auto_169827 - LOCATION
      ?auto_169830 - LOCATION
      ?auto_169829 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_169828 ?auto_169826 ) ( IN-CITY ?auto_169819 ?auto_169826 ) ( not ( = ?auto_169819 ?auto_169828 ) ) ( OBJ-AT ?auto_169824 ?auto_169828 ) ( IN-CITY ?auto_169825 ?auto_169826 ) ( not ( = ?auto_169819 ?auto_169825 ) ) ( OBJ-AT ?auto_169822 ?auto_169825 ) ( IN-CITY ?auto_169827 ?auto_169826 ) ( not ( = ?auto_169819 ?auto_169827 ) ) ( OBJ-AT ?auto_169820 ?auto_169827 ) ( IN-CITY ?auto_169830 ?auto_169826 ) ( not ( = ?auto_169819 ?auto_169830 ) ) ( OBJ-AT ?auto_169823 ?auto_169830 ) ( OBJ-AT ?auto_169821 ?auto_169830 ) ( TRUCK-AT ?auto_169829 ?auto_169819 ) ( not ( = ?auto_169821 ?auto_169823 ) ) ( not ( = ?auto_169821 ?auto_169820 ) ) ( not ( = ?auto_169823 ?auto_169820 ) ) ( not ( = ?auto_169827 ?auto_169830 ) ) ( not ( = ?auto_169821 ?auto_169822 ) ) ( not ( = ?auto_169823 ?auto_169822 ) ) ( not ( = ?auto_169820 ?auto_169822 ) ) ( not ( = ?auto_169825 ?auto_169827 ) ) ( not ( = ?auto_169825 ?auto_169830 ) ) ( not ( = ?auto_169821 ?auto_169824 ) ) ( not ( = ?auto_169823 ?auto_169824 ) ) ( not ( = ?auto_169820 ?auto_169824 ) ) ( not ( = ?auto_169822 ?auto_169824 ) ) ( not ( = ?auto_169828 ?auto_169825 ) ) ( not ( = ?auto_169828 ?auto_169827 ) ) ( not ( = ?auto_169828 ?auto_169830 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_169821 ?auto_169820 ?auto_169823 ?auto_169822 ?auto_169824 ?auto_169819 )
      ( DELIVER-5PKG-VERIFY ?auto_169820 ?auto_169821 ?auto_169822 ?auto_169823 ?auto_169824 ?auto_169819 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_169871 - OBJ
      ?auto_169872 - OBJ
      ?auto_169873 - OBJ
      ?auto_169874 - OBJ
      ?auto_169875 - OBJ
      ?auto_169870 - LOCATION
    )
    :vars
    (
      ?auto_169879 - LOCATION
      ?auto_169877 - CITY
      ?auto_169876 - LOCATION
      ?auto_169878 - LOCATION
      ?auto_169881 - LOCATION
      ?auto_169880 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_169879 ?auto_169877 ) ( IN-CITY ?auto_169870 ?auto_169877 ) ( not ( = ?auto_169870 ?auto_169879 ) ) ( OBJ-AT ?auto_169874 ?auto_169879 ) ( IN-CITY ?auto_169876 ?auto_169877 ) ( not ( = ?auto_169870 ?auto_169876 ) ) ( OBJ-AT ?auto_169873 ?auto_169876 ) ( IN-CITY ?auto_169878 ?auto_169877 ) ( not ( = ?auto_169870 ?auto_169878 ) ) ( OBJ-AT ?auto_169871 ?auto_169878 ) ( IN-CITY ?auto_169881 ?auto_169877 ) ( not ( = ?auto_169870 ?auto_169881 ) ) ( OBJ-AT ?auto_169875 ?auto_169881 ) ( OBJ-AT ?auto_169872 ?auto_169881 ) ( TRUCK-AT ?auto_169880 ?auto_169870 ) ( not ( = ?auto_169872 ?auto_169875 ) ) ( not ( = ?auto_169872 ?auto_169871 ) ) ( not ( = ?auto_169875 ?auto_169871 ) ) ( not ( = ?auto_169878 ?auto_169881 ) ) ( not ( = ?auto_169872 ?auto_169873 ) ) ( not ( = ?auto_169875 ?auto_169873 ) ) ( not ( = ?auto_169871 ?auto_169873 ) ) ( not ( = ?auto_169876 ?auto_169878 ) ) ( not ( = ?auto_169876 ?auto_169881 ) ) ( not ( = ?auto_169872 ?auto_169874 ) ) ( not ( = ?auto_169875 ?auto_169874 ) ) ( not ( = ?auto_169871 ?auto_169874 ) ) ( not ( = ?auto_169873 ?auto_169874 ) ) ( not ( = ?auto_169879 ?auto_169876 ) ) ( not ( = ?auto_169879 ?auto_169878 ) ) ( not ( = ?auto_169879 ?auto_169881 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_169872 ?auto_169871 ?auto_169875 ?auto_169873 ?auto_169874 ?auto_169870 )
      ( DELIVER-5PKG-VERIFY ?auto_169871 ?auto_169872 ?auto_169873 ?auto_169874 ?auto_169875 ?auto_169870 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_171868 - OBJ
      ?auto_171869 - OBJ
      ?auto_171870 - OBJ
      ?auto_171871 - OBJ
      ?auto_171872 - OBJ
      ?auto_171867 - LOCATION
    )
    :vars
    (
      ?auto_171876 - LOCATION
      ?auto_171874 - CITY
      ?auto_171873 - LOCATION
      ?auto_171875 - LOCATION
      ?auto_171878 - LOCATION
      ?auto_171877 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_171876 ?auto_171874 ) ( IN-CITY ?auto_171867 ?auto_171874 ) ( not ( = ?auto_171867 ?auto_171876 ) ) ( OBJ-AT ?auto_171872 ?auto_171876 ) ( IN-CITY ?auto_171873 ?auto_171874 ) ( not ( = ?auto_171867 ?auto_171873 ) ) ( OBJ-AT ?auto_171869 ?auto_171873 ) ( IN-CITY ?auto_171875 ?auto_171874 ) ( not ( = ?auto_171867 ?auto_171875 ) ) ( OBJ-AT ?auto_171868 ?auto_171875 ) ( IN-CITY ?auto_171878 ?auto_171874 ) ( not ( = ?auto_171867 ?auto_171878 ) ) ( OBJ-AT ?auto_171871 ?auto_171878 ) ( OBJ-AT ?auto_171870 ?auto_171878 ) ( TRUCK-AT ?auto_171877 ?auto_171867 ) ( not ( = ?auto_171870 ?auto_171871 ) ) ( not ( = ?auto_171870 ?auto_171868 ) ) ( not ( = ?auto_171871 ?auto_171868 ) ) ( not ( = ?auto_171875 ?auto_171878 ) ) ( not ( = ?auto_171870 ?auto_171869 ) ) ( not ( = ?auto_171871 ?auto_171869 ) ) ( not ( = ?auto_171868 ?auto_171869 ) ) ( not ( = ?auto_171873 ?auto_171875 ) ) ( not ( = ?auto_171873 ?auto_171878 ) ) ( not ( = ?auto_171870 ?auto_171872 ) ) ( not ( = ?auto_171871 ?auto_171872 ) ) ( not ( = ?auto_171868 ?auto_171872 ) ) ( not ( = ?auto_171869 ?auto_171872 ) ) ( not ( = ?auto_171876 ?auto_171873 ) ) ( not ( = ?auto_171876 ?auto_171875 ) ) ( not ( = ?auto_171876 ?auto_171878 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_171870 ?auto_171868 ?auto_171871 ?auto_171869 ?auto_171872 ?auto_171867 )
      ( DELIVER-5PKG-VERIFY ?auto_171868 ?auto_171869 ?auto_171870 ?auto_171871 ?auto_171872 ?auto_171867 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_171919 - OBJ
      ?auto_171920 - OBJ
      ?auto_171921 - OBJ
      ?auto_171922 - OBJ
      ?auto_171923 - OBJ
      ?auto_171918 - LOCATION
    )
    :vars
    (
      ?auto_171927 - LOCATION
      ?auto_171925 - CITY
      ?auto_171924 - LOCATION
      ?auto_171926 - LOCATION
      ?auto_171929 - LOCATION
      ?auto_171928 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_171927 ?auto_171925 ) ( IN-CITY ?auto_171918 ?auto_171925 ) ( not ( = ?auto_171918 ?auto_171927 ) ) ( OBJ-AT ?auto_171922 ?auto_171927 ) ( IN-CITY ?auto_171924 ?auto_171925 ) ( not ( = ?auto_171918 ?auto_171924 ) ) ( OBJ-AT ?auto_171920 ?auto_171924 ) ( IN-CITY ?auto_171926 ?auto_171925 ) ( not ( = ?auto_171918 ?auto_171926 ) ) ( OBJ-AT ?auto_171919 ?auto_171926 ) ( IN-CITY ?auto_171929 ?auto_171925 ) ( not ( = ?auto_171918 ?auto_171929 ) ) ( OBJ-AT ?auto_171923 ?auto_171929 ) ( OBJ-AT ?auto_171921 ?auto_171929 ) ( TRUCK-AT ?auto_171928 ?auto_171918 ) ( not ( = ?auto_171921 ?auto_171923 ) ) ( not ( = ?auto_171921 ?auto_171919 ) ) ( not ( = ?auto_171923 ?auto_171919 ) ) ( not ( = ?auto_171926 ?auto_171929 ) ) ( not ( = ?auto_171921 ?auto_171920 ) ) ( not ( = ?auto_171923 ?auto_171920 ) ) ( not ( = ?auto_171919 ?auto_171920 ) ) ( not ( = ?auto_171924 ?auto_171926 ) ) ( not ( = ?auto_171924 ?auto_171929 ) ) ( not ( = ?auto_171921 ?auto_171922 ) ) ( not ( = ?auto_171923 ?auto_171922 ) ) ( not ( = ?auto_171919 ?auto_171922 ) ) ( not ( = ?auto_171920 ?auto_171922 ) ) ( not ( = ?auto_171927 ?auto_171924 ) ) ( not ( = ?auto_171927 ?auto_171926 ) ) ( not ( = ?auto_171927 ?auto_171929 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_171921 ?auto_171919 ?auto_171923 ?auto_171920 ?auto_171922 ?auto_171918 )
      ( DELIVER-5PKG-VERIFY ?auto_171919 ?auto_171920 ?auto_171921 ?auto_171922 ?auto_171923 ?auto_171918 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_172330 - OBJ
      ?auto_172331 - OBJ
      ?auto_172332 - OBJ
      ?auto_172333 - OBJ
      ?auto_172334 - OBJ
      ?auto_172329 - LOCATION
    )
    :vars
    (
      ?auto_172338 - LOCATION
      ?auto_172336 - CITY
      ?auto_172335 - LOCATION
      ?auto_172337 - LOCATION
      ?auto_172340 - LOCATION
      ?auto_172339 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_172338 ?auto_172336 ) ( IN-CITY ?auto_172329 ?auto_172336 ) ( not ( = ?auto_172329 ?auto_172338 ) ) ( OBJ-AT ?auto_172332 ?auto_172338 ) ( IN-CITY ?auto_172335 ?auto_172336 ) ( not ( = ?auto_172329 ?auto_172335 ) ) ( OBJ-AT ?auto_172331 ?auto_172335 ) ( IN-CITY ?auto_172337 ?auto_172336 ) ( not ( = ?auto_172329 ?auto_172337 ) ) ( OBJ-AT ?auto_172330 ?auto_172337 ) ( IN-CITY ?auto_172340 ?auto_172336 ) ( not ( = ?auto_172329 ?auto_172340 ) ) ( OBJ-AT ?auto_172334 ?auto_172340 ) ( OBJ-AT ?auto_172333 ?auto_172340 ) ( TRUCK-AT ?auto_172339 ?auto_172329 ) ( not ( = ?auto_172333 ?auto_172334 ) ) ( not ( = ?auto_172333 ?auto_172330 ) ) ( not ( = ?auto_172334 ?auto_172330 ) ) ( not ( = ?auto_172337 ?auto_172340 ) ) ( not ( = ?auto_172333 ?auto_172331 ) ) ( not ( = ?auto_172334 ?auto_172331 ) ) ( not ( = ?auto_172330 ?auto_172331 ) ) ( not ( = ?auto_172335 ?auto_172337 ) ) ( not ( = ?auto_172335 ?auto_172340 ) ) ( not ( = ?auto_172333 ?auto_172332 ) ) ( not ( = ?auto_172334 ?auto_172332 ) ) ( not ( = ?auto_172330 ?auto_172332 ) ) ( not ( = ?auto_172331 ?auto_172332 ) ) ( not ( = ?auto_172338 ?auto_172335 ) ) ( not ( = ?auto_172338 ?auto_172337 ) ) ( not ( = ?auto_172338 ?auto_172340 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_172333 ?auto_172330 ?auto_172334 ?auto_172331 ?auto_172332 ?auto_172329 )
      ( DELIVER-5PKG-VERIFY ?auto_172330 ?auto_172331 ?auto_172332 ?auto_172333 ?auto_172334 ?auto_172329 ) )
  )

)

