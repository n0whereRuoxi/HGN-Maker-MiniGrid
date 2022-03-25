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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_13145 - OBJ
      ?auto_13144 - LOCATION
    )
    :vars
    (
      ?auto_13147 - LOCATION
      ?auto_13148 - CITY
      ?auto_13146 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13147 ?auto_13148 ) ( IN-CITY ?auto_13144 ?auto_13148 ) ( not ( = ?auto_13144 ?auto_13147 ) ) ( OBJ-AT ?auto_13145 ?auto_13147 ) ( TRUCK-AT ?auto_13146 ?auto_13144 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_13146 ?auto_13144 ?auto_13147 ?auto_13148 )
      ( !LOAD-TRUCK ?auto_13145 ?auto_13146 ?auto_13147 )
      ( !DRIVE-TRUCK ?auto_13146 ?auto_13147 ?auto_13144 ?auto_13148 )
      ( !UNLOAD-TRUCK ?auto_13145 ?auto_13146 ?auto_13144 )
      ( DELIVER-1PKG-VERIFY ?auto_13145 ?auto_13144 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_13166 - OBJ
      ?auto_13167 - OBJ
      ?auto_13165 - LOCATION
    )
    :vars
    (
      ?auto_13169 - LOCATION
      ?auto_13168 - CITY
      ?auto_13171 - LOCATION
      ?auto_13170 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13169 ?auto_13168 ) ( IN-CITY ?auto_13165 ?auto_13168 ) ( not ( = ?auto_13165 ?auto_13169 ) ) ( OBJ-AT ?auto_13167 ?auto_13169 ) ( IN-CITY ?auto_13171 ?auto_13168 ) ( not ( = ?auto_13165 ?auto_13171 ) ) ( OBJ-AT ?auto_13166 ?auto_13171 ) ( TRUCK-AT ?auto_13170 ?auto_13165 ) ( not ( = ?auto_13166 ?auto_13167 ) ) ( not ( = ?auto_13169 ?auto_13171 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_13166 ?auto_13165 )
      ( DELIVER-1PKG ?auto_13167 ?auto_13165 )
      ( DELIVER-2PKG-VERIFY ?auto_13166 ?auto_13167 ?auto_13165 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_13277 - OBJ
      ?auto_13278 - OBJ
      ?auto_13279 - OBJ
      ?auto_13276 - LOCATION
    )
    :vars
    (
      ?auto_13281 - LOCATION
      ?auto_13282 - CITY
      ?auto_13284 - LOCATION
      ?auto_13283 - LOCATION
      ?auto_13280 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_13281 ?auto_13282 ) ( IN-CITY ?auto_13276 ?auto_13282 ) ( not ( = ?auto_13276 ?auto_13281 ) ) ( OBJ-AT ?auto_13279 ?auto_13281 ) ( IN-CITY ?auto_13284 ?auto_13282 ) ( not ( = ?auto_13276 ?auto_13284 ) ) ( OBJ-AT ?auto_13278 ?auto_13284 ) ( IN-CITY ?auto_13283 ?auto_13282 ) ( not ( = ?auto_13276 ?auto_13283 ) ) ( OBJ-AT ?auto_13277 ?auto_13283 ) ( TRUCK-AT ?auto_13280 ?auto_13276 ) ( not ( = ?auto_13277 ?auto_13278 ) ) ( not ( = ?auto_13284 ?auto_13283 ) ) ( not ( = ?auto_13277 ?auto_13279 ) ) ( not ( = ?auto_13278 ?auto_13279 ) ) ( not ( = ?auto_13281 ?auto_13284 ) ) ( not ( = ?auto_13281 ?auto_13283 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_13277 ?auto_13278 ?auto_13276 )
      ( DELIVER-1PKG ?auto_13279 ?auto_13276 )
      ( DELIVER-3PKG-VERIFY ?auto_13277 ?auto_13278 ?auto_13279 ?auto_13276 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14411 - OBJ
      ?auto_14412 - OBJ
      ?auto_14413 - OBJ
      ?auto_14414 - OBJ
      ?auto_14410 - LOCATION
    )
    :vars
    (
      ?auto_14417 - LOCATION
      ?auto_14416 - CITY
      ?auto_14418 - LOCATION
      ?auto_14419 - LOCATION
      ?auto_14415 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14417 ?auto_14416 ) ( IN-CITY ?auto_14410 ?auto_14416 ) ( not ( = ?auto_14410 ?auto_14417 ) ) ( OBJ-AT ?auto_14414 ?auto_14417 ) ( IN-CITY ?auto_14418 ?auto_14416 ) ( not ( = ?auto_14410 ?auto_14418 ) ) ( OBJ-AT ?auto_14413 ?auto_14418 ) ( OBJ-AT ?auto_14412 ?auto_14417 ) ( IN-CITY ?auto_14419 ?auto_14416 ) ( not ( = ?auto_14410 ?auto_14419 ) ) ( OBJ-AT ?auto_14411 ?auto_14419 ) ( TRUCK-AT ?auto_14415 ?auto_14410 ) ( not ( = ?auto_14411 ?auto_14412 ) ) ( not ( = ?auto_14417 ?auto_14419 ) ) ( not ( = ?auto_14411 ?auto_14413 ) ) ( not ( = ?auto_14412 ?auto_14413 ) ) ( not ( = ?auto_14418 ?auto_14417 ) ) ( not ( = ?auto_14418 ?auto_14419 ) ) ( not ( = ?auto_14411 ?auto_14414 ) ) ( not ( = ?auto_14412 ?auto_14414 ) ) ( not ( = ?auto_14413 ?auto_14414 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_14411 ?auto_14412 ?auto_14413 ?auto_14410 )
      ( DELIVER-1PKG ?auto_14414 ?auto_14410 )
      ( DELIVER-4PKG-VERIFY ?auto_14411 ?auto_14412 ?auto_14413 ?auto_14414 ?auto_14410 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14443 - OBJ
      ?auto_14444 - OBJ
      ?auto_14445 - OBJ
      ?auto_14446 - OBJ
      ?auto_14442 - LOCATION
    )
    :vars
    (
      ?auto_14451 - LOCATION
      ?auto_14447 - CITY
      ?auto_14448 - LOCATION
      ?auto_14450 - LOCATION
      ?auto_14449 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14451 ?auto_14447 ) ( IN-CITY ?auto_14442 ?auto_14447 ) ( not ( = ?auto_14442 ?auto_14451 ) ) ( OBJ-AT ?auto_14445 ?auto_14451 ) ( IN-CITY ?auto_14448 ?auto_14447 ) ( not ( = ?auto_14442 ?auto_14448 ) ) ( OBJ-AT ?auto_14446 ?auto_14448 ) ( OBJ-AT ?auto_14444 ?auto_14451 ) ( IN-CITY ?auto_14450 ?auto_14447 ) ( not ( = ?auto_14442 ?auto_14450 ) ) ( OBJ-AT ?auto_14443 ?auto_14450 ) ( TRUCK-AT ?auto_14449 ?auto_14442 ) ( not ( = ?auto_14443 ?auto_14444 ) ) ( not ( = ?auto_14451 ?auto_14450 ) ) ( not ( = ?auto_14443 ?auto_14446 ) ) ( not ( = ?auto_14444 ?auto_14446 ) ) ( not ( = ?auto_14448 ?auto_14451 ) ) ( not ( = ?auto_14448 ?auto_14450 ) ) ( not ( = ?auto_14443 ?auto_14445 ) ) ( not ( = ?auto_14444 ?auto_14445 ) ) ( not ( = ?auto_14446 ?auto_14445 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_14443 ?auto_14444 ?auto_14446 ?auto_14445 ?auto_14442 )
      ( DELIVER-4PKG-VERIFY ?auto_14443 ?auto_14444 ?auto_14445 ?auto_14446 ?auto_14442 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14475 - OBJ
      ?auto_14476 - OBJ
      ?auto_14477 - OBJ
      ?auto_14478 - OBJ
      ?auto_14474 - LOCATION
    )
    :vars
    (
      ?auto_14483 - LOCATION
      ?auto_14480 - CITY
      ?auto_14481 - LOCATION
      ?auto_14482 - LOCATION
      ?auto_14479 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14483 ?auto_14480 ) ( IN-CITY ?auto_14474 ?auto_14480 ) ( not ( = ?auto_14474 ?auto_14483 ) ) ( OBJ-AT ?auto_14478 ?auto_14483 ) ( IN-CITY ?auto_14481 ?auto_14480 ) ( not ( = ?auto_14474 ?auto_14481 ) ) ( OBJ-AT ?auto_14476 ?auto_14481 ) ( OBJ-AT ?auto_14477 ?auto_14483 ) ( IN-CITY ?auto_14482 ?auto_14480 ) ( not ( = ?auto_14474 ?auto_14482 ) ) ( OBJ-AT ?auto_14475 ?auto_14482 ) ( TRUCK-AT ?auto_14479 ?auto_14474 ) ( not ( = ?auto_14475 ?auto_14477 ) ) ( not ( = ?auto_14483 ?auto_14482 ) ) ( not ( = ?auto_14475 ?auto_14476 ) ) ( not ( = ?auto_14477 ?auto_14476 ) ) ( not ( = ?auto_14481 ?auto_14483 ) ) ( not ( = ?auto_14481 ?auto_14482 ) ) ( not ( = ?auto_14475 ?auto_14478 ) ) ( not ( = ?auto_14477 ?auto_14478 ) ) ( not ( = ?auto_14476 ?auto_14478 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_14475 ?auto_14477 ?auto_14478 ?auto_14476 ?auto_14474 )
      ( DELIVER-4PKG-VERIFY ?auto_14475 ?auto_14476 ?auto_14477 ?auto_14478 ?auto_14474 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14724 - OBJ
      ?auto_14725 - OBJ
      ?auto_14726 - OBJ
      ?auto_14727 - OBJ
      ?auto_14723 - LOCATION
    )
    :vars
    (
      ?auto_14732 - LOCATION
      ?auto_14729 - CITY
      ?auto_14730 - LOCATION
      ?auto_14731 - LOCATION
      ?auto_14728 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14732 ?auto_14729 ) ( IN-CITY ?auto_14723 ?auto_14729 ) ( not ( = ?auto_14723 ?auto_14732 ) ) ( OBJ-AT ?auto_14727 ?auto_14732 ) ( IN-CITY ?auto_14730 ?auto_14729 ) ( not ( = ?auto_14723 ?auto_14730 ) ) ( OBJ-AT ?auto_14726 ?auto_14730 ) ( OBJ-AT ?auto_14724 ?auto_14732 ) ( IN-CITY ?auto_14731 ?auto_14729 ) ( not ( = ?auto_14723 ?auto_14731 ) ) ( OBJ-AT ?auto_14725 ?auto_14731 ) ( TRUCK-AT ?auto_14728 ?auto_14723 ) ( not ( = ?auto_14725 ?auto_14724 ) ) ( not ( = ?auto_14732 ?auto_14731 ) ) ( not ( = ?auto_14725 ?auto_14726 ) ) ( not ( = ?auto_14724 ?auto_14726 ) ) ( not ( = ?auto_14730 ?auto_14732 ) ) ( not ( = ?auto_14730 ?auto_14731 ) ) ( not ( = ?auto_14725 ?auto_14727 ) ) ( not ( = ?auto_14724 ?auto_14727 ) ) ( not ( = ?auto_14726 ?auto_14727 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_14725 ?auto_14724 ?auto_14727 ?auto_14726 ?auto_14723 )
      ( DELIVER-4PKG-VERIFY ?auto_14724 ?auto_14725 ?auto_14726 ?auto_14727 ?auto_14723 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14756 - OBJ
      ?auto_14757 - OBJ
      ?auto_14758 - OBJ
      ?auto_14759 - OBJ
      ?auto_14755 - LOCATION
    )
    :vars
    (
      ?auto_14764 - LOCATION
      ?auto_14761 - CITY
      ?auto_14762 - LOCATION
      ?auto_14763 - LOCATION
      ?auto_14760 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14764 ?auto_14761 ) ( IN-CITY ?auto_14755 ?auto_14761 ) ( not ( = ?auto_14755 ?auto_14764 ) ) ( OBJ-AT ?auto_14758 ?auto_14764 ) ( IN-CITY ?auto_14762 ?auto_14761 ) ( not ( = ?auto_14755 ?auto_14762 ) ) ( OBJ-AT ?auto_14759 ?auto_14762 ) ( OBJ-AT ?auto_14756 ?auto_14764 ) ( IN-CITY ?auto_14763 ?auto_14761 ) ( not ( = ?auto_14755 ?auto_14763 ) ) ( OBJ-AT ?auto_14757 ?auto_14763 ) ( TRUCK-AT ?auto_14760 ?auto_14755 ) ( not ( = ?auto_14757 ?auto_14756 ) ) ( not ( = ?auto_14764 ?auto_14763 ) ) ( not ( = ?auto_14757 ?auto_14759 ) ) ( not ( = ?auto_14756 ?auto_14759 ) ) ( not ( = ?auto_14762 ?auto_14764 ) ) ( not ( = ?auto_14762 ?auto_14763 ) ) ( not ( = ?auto_14757 ?auto_14758 ) ) ( not ( = ?auto_14756 ?auto_14758 ) ) ( not ( = ?auto_14759 ?auto_14758 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_14757 ?auto_14756 ?auto_14758 ?auto_14759 ?auto_14755 )
      ( DELIVER-4PKG-VERIFY ?auto_14756 ?auto_14757 ?auto_14758 ?auto_14759 ?auto_14755 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_14944 - OBJ
      ?auto_14945 - OBJ
      ?auto_14946 - OBJ
      ?auto_14947 - OBJ
      ?auto_14943 - LOCATION
    )
    :vars
    (
      ?auto_14952 - LOCATION
      ?auto_14949 - CITY
      ?auto_14950 - LOCATION
      ?auto_14951 - LOCATION
      ?auto_14948 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_14952 ?auto_14949 ) ( IN-CITY ?auto_14943 ?auto_14949 ) ( not ( = ?auto_14943 ?auto_14952 ) ) ( OBJ-AT ?auto_14945 ?auto_14952 ) ( IN-CITY ?auto_14950 ?auto_14949 ) ( not ( = ?auto_14943 ?auto_14950 ) ) ( OBJ-AT ?auto_14947 ?auto_14950 ) ( OBJ-AT ?auto_14944 ?auto_14952 ) ( IN-CITY ?auto_14951 ?auto_14949 ) ( not ( = ?auto_14943 ?auto_14951 ) ) ( OBJ-AT ?auto_14946 ?auto_14951 ) ( TRUCK-AT ?auto_14948 ?auto_14943 ) ( not ( = ?auto_14946 ?auto_14944 ) ) ( not ( = ?auto_14952 ?auto_14951 ) ) ( not ( = ?auto_14946 ?auto_14947 ) ) ( not ( = ?auto_14944 ?auto_14947 ) ) ( not ( = ?auto_14950 ?auto_14952 ) ) ( not ( = ?auto_14950 ?auto_14951 ) ) ( not ( = ?auto_14946 ?auto_14945 ) ) ( not ( = ?auto_14944 ?auto_14945 ) ) ( not ( = ?auto_14947 ?auto_14945 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_14946 ?auto_14944 ?auto_14945 ?auto_14947 ?auto_14943 )
      ( DELIVER-4PKG-VERIFY ?auto_14944 ?auto_14945 ?auto_14946 ?auto_14947 ?auto_14943 ) )
  )

)

