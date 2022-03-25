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
      ?auto_85 - OBJ
      ?auto_84 - LOCATION
    )
    :vars
    (
      ?auto_87 - LOCATION
      ?auto_88 - CITY
      ?auto_86 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_87 ?auto_88 ) ( IN-CITY ?auto_84 ?auto_88 ) ( not ( = ?auto_84 ?auto_87 ) ) ( OBJ-AT ?auto_85 ?auto_87 ) ( TRUCK-AT ?auto_86 ?auto_84 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_86 ?auto_84 ?auto_87 ?auto_88 )
      ( !LOAD-TRUCK ?auto_85 ?auto_86 ?auto_87 )
      ( !DRIVE-TRUCK ?auto_86 ?auto_87 ?auto_84 ?auto_88 )
      ( !UNLOAD-TRUCK ?auto_85 ?auto_86 ?auto_84 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_106 - OBJ
      ?auto_107 - OBJ
      ?auto_105 - LOCATION
    )
    :vars
    (
      ?auto_108 - LOCATION
      ?auto_109 - CITY
      ?auto_111 - LOCATION
      ?auto_110 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_108 ?auto_109 ) ( IN-CITY ?auto_105 ?auto_109 ) ( not ( = ?auto_105 ?auto_108 ) ) ( OBJ-AT ?auto_107 ?auto_108 ) ( IN-CITY ?auto_111 ?auto_109 ) ( not ( = ?auto_105 ?auto_111 ) ) ( OBJ-AT ?auto_106 ?auto_111 ) ( TRUCK-AT ?auto_110 ?auto_105 ) ( not ( = ?auto_106 ?auto_107 ) ) ( not ( = ?auto_108 ?auto_111 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_106 ?auto_105 )
      ( DELIVER-1PKG ?auto_107 ?auto_105 ) )
  )

)

