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
      ?auto_3 - OBJ
      ?auto_2 - LOCATION
    )
    :vars
    (
      ?auto_5 - LOCATION
      ?auto_6 - CITY
      ?auto_4 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_5 ?auto_6 ) ( IN-CITY ?auto_2 ?auto_6 ) ( not ( = ?auto_2 ?auto_5 ) ) ( OBJ-AT ?auto_3 ?auto_5 ) ( TRUCK-AT ?auto_4 ?auto_2 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4 ?auto_2 ?auto_5 ?auto_6 )
      ( !LOAD-TRUCK ?auto_3 ?auto_4 ?auto_5 )
      ( !DRIVE-TRUCK ?auto_4 ?auto_5 ?auto_2 ?auto_6 )
      ( !UNLOAD-TRUCK ?auto_3 ?auto_4 ?auto_2 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_10 - OBJ
      ?auto_9 - LOCATION
    )
    :vars
    (
      ?auto_12 - LOCATION
      ?auto_13 - CITY
      ?auto_11 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_12 ?auto_13 ) ( IN-CITY ?auto_9 ?auto_13 ) ( not ( = ?auto_9 ?auto_12 ) ) ( OBJ-AT ?auto_10 ?auto_12 ) ( TRUCK-AT ?auto_11 ?auto_9 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_11 ?auto_9 ?auto_12 ?auto_13 )
      ( !LOAD-TRUCK ?auto_10 ?auto_11 ?auto_12 )
      ( !DRIVE-TRUCK ?auto_11 ?auto_12 ?auto_9 ?auto_13 )
      ( !UNLOAD-TRUCK ?auto_10 ?auto_11 ?auto_9 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_24 - OBJ
      ?auto_25 - OBJ
      ?auto_23 - LOCATION
    )
    :vars
    (
      ?auto_26 - LOCATION
      ?auto_27 - CITY
      ?auto_29 - LOCATION
      ?auto_28 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_26 ?auto_27 ) ( IN-CITY ?auto_23 ?auto_27 ) ( not ( = ?auto_23 ?auto_26 ) ) ( OBJ-AT ?auto_25 ?auto_26 ) ( IN-CITY ?auto_29 ?auto_27 ) ( not ( = ?auto_23 ?auto_29 ) ) ( OBJ-AT ?auto_24 ?auto_29 ) ( TRUCK-AT ?auto_28 ?auto_23 ) ( not ( = ?auto_24 ?auto_25 ) ) ( not ( = ?auto_26 ?auto_29 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_24 ?auto_23 )
      ( DELIVER-1PKG ?auto_25 ?auto_23 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_31 - OBJ
      ?auto_32 - OBJ
      ?auto_30 - LOCATION
    )
    :vars
    (
      ?auto_34 - LOCATION
      ?auto_35 - CITY
      ?auto_36 - LOCATION
      ?auto_33 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_34 ?auto_35 ) ( IN-CITY ?auto_30 ?auto_35 ) ( not ( = ?auto_30 ?auto_34 ) ) ( OBJ-AT ?auto_31 ?auto_34 ) ( IN-CITY ?auto_36 ?auto_35 ) ( not ( = ?auto_30 ?auto_36 ) ) ( OBJ-AT ?auto_32 ?auto_36 ) ( TRUCK-AT ?auto_33 ?auto_30 ) ( not ( = ?auto_32 ?auto_31 ) ) ( not ( = ?auto_34 ?auto_36 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_32 ?auto_31 ?auto_30 ) )
  )

)
