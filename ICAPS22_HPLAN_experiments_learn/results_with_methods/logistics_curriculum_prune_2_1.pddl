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
      ?auto_44 - OBJ
      ?auto_43 - LOCATION
    )
    :vars
    (
      ?auto_46 - LOCATION
      ?auto_47 - CITY
      ?auto_45 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_46 ?auto_47 ) ( IN-CITY ?auto_43 ?auto_47 ) ( not ( = ?auto_43 ?auto_46 ) ) ( OBJ-AT ?auto_44 ?auto_46 ) ( TRUCK-AT ?auto_45 ?auto_43 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_45 ?auto_43 ?auto_46 ?auto_47 )
      ( !LOAD-TRUCK ?auto_44 ?auto_45 ?auto_46 )
      ( !DRIVE-TRUCK ?auto_45 ?auto_46 ?auto_43 ?auto_47 )
      ( !UNLOAD-TRUCK ?auto_44 ?auto_45 ?auto_43 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_65 - OBJ
      ?auto_66 - OBJ
      ?auto_64 - LOCATION
    )
    :vars
    (
      ?auto_69 - LOCATION
      ?auto_67 - CITY
      ?auto_70 - LOCATION
      ?auto_68 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_69 ?auto_67 ) ( IN-CITY ?auto_64 ?auto_67 ) ( not ( = ?auto_64 ?auto_69 ) ) ( OBJ-AT ?auto_66 ?auto_69 ) ( IN-CITY ?auto_70 ?auto_67 ) ( not ( = ?auto_64 ?auto_70 ) ) ( OBJ-AT ?auto_65 ?auto_70 ) ( TRUCK-AT ?auto_68 ?auto_64 ) ( not ( = ?auto_65 ?auto_66 ) ) ( not ( = ?auto_69 ?auto_70 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_65 ?auto_64 )
      ( DELIVER-1PKG ?auto_66 ?auto_64 ) )
  )

)

