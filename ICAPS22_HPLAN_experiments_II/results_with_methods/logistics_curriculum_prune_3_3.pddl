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
      ?auto_1040 - OBJ
      ?auto_1039 - LOCATION
    )
    :vars
    (
      ?auto_1042 - LOCATION
      ?auto_1043 - CITY
      ?auto_1041 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1042 ?auto_1043 ) ( IN-CITY ?auto_1039 ?auto_1043 ) ( not ( = ?auto_1039 ?auto_1042 ) ) ( OBJ-AT ?auto_1040 ?auto_1042 ) ( TRUCK-AT ?auto_1041 ?auto_1039 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1041 ?auto_1039 ?auto_1042 ?auto_1043 )
      ( !LOAD-TRUCK ?auto_1040 ?auto_1041 ?auto_1042 )
      ( !DRIVE-TRUCK ?auto_1041 ?auto_1042 ?auto_1039 ?auto_1043 )
      ( !UNLOAD-TRUCK ?auto_1040 ?auto_1041 ?auto_1039 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1061 - OBJ
      ?auto_1062 - OBJ
      ?auto_1060 - LOCATION
    )
    :vars
    (
      ?auto_1065 - LOCATION
      ?auto_1064 - CITY
      ?auto_1066 - LOCATION
      ?auto_1063 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1065 ?auto_1064 ) ( IN-CITY ?auto_1060 ?auto_1064 ) ( not ( = ?auto_1060 ?auto_1065 ) ) ( OBJ-AT ?auto_1062 ?auto_1065 ) ( IN-CITY ?auto_1066 ?auto_1064 ) ( not ( = ?auto_1060 ?auto_1066 ) ) ( OBJ-AT ?auto_1061 ?auto_1066 ) ( TRUCK-AT ?auto_1063 ?auto_1060 ) ( not ( = ?auto_1061 ?auto_1062 ) ) ( not ( = ?auto_1065 ?auto_1066 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1061 ?auto_1060 )
      ( DELIVER-1PKG ?auto_1062 ?auto_1060 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1172 - OBJ
      ?auto_1173 - OBJ
      ?auto_1174 - OBJ
      ?auto_1171 - LOCATION
    )
    :vars
    (
      ?auto_1176 - LOCATION
      ?auto_1175 - CITY
      ?auto_1178 - LOCATION
      ?auto_1179 - LOCATION
      ?auto_1177 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1176 ?auto_1175 ) ( IN-CITY ?auto_1171 ?auto_1175 ) ( not ( = ?auto_1171 ?auto_1176 ) ) ( OBJ-AT ?auto_1174 ?auto_1176 ) ( IN-CITY ?auto_1178 ?auto_1175 ) ( not ( = ?auto_1171 ?auto_1178 ) ) ( OBJ-AT ?auto_1173 ?auto_1178 ) ( IN-CITY ?auto_1179 ?auto_1175 ) ( not ( = ?auto_1171 ?auto_1179 ) ) ( OBJ-AT ?auto_1172 ?auto_1179 ) ( TRUCK-AT ?auto_1177 ?auto_1171 ) ( not ( = ?auto_1172 ?auto_1173 ) ) ( not ( = ?auto_1178 ?auto_1179 ) ) ( not ( = ?auto_1172 ?auto_1174 ) ) ( not ( = ?auto_1173 ?auto_1174 ) ) ( not ( = ?auto_1176 ?auto_1178 ) ) ( not ( = ?auto_1176 ?auto_1179 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1172 ?auto_1173 ?auto_1171 )
      ( DELIVER-1PKG ?auto_1174 ?auto_1171 ) )
  )

)

