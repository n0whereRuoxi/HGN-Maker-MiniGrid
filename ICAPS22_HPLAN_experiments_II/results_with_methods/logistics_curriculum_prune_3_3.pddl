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
      ?auto_1022 - OBJ
      ?auto_1021 - LOCATION
    )
    :vars
    (
      ?auto_1024 - LOCATION
      ?auto_1025 - CITY
      ?auto_1023 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1024 ?auto_1025 ) ( IN-CITY ?auto_1021 ?auto_1025 ) ( not ( = ?auto_1021 ?auto_1024 ) ) ( OBJ-AT ?auto_1022 ?auto_1024 ) ( TRUCK-AT ?auto_1023 ?auto_1021 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1023 ?auto_1021 ?auto_1024 ?auto_1025 )
      ( !LOAD-TRUCK ?auto_1022 ?auto_1023 ?auto_1024 )
      ( !DRIVE-TRUCK ?auto_1023 ?auto_1024 ?auto_1021 ?auto_1025 )
      ( !UNLOAD-TRUCK ?auto_1022 ?auto_1023 ?auto_1021 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1043 - OBJ
      ?auto_1044 - OBJ
      ?auto_1042 - LOCATION
    )
    :vars
    (
      ?auto_1045 - LOCATION
      ?auto_1047 - CITY
      ?auto_1048 - LOCATION
      ?auto_1046 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1045 ?auto_1047 ) ( IN-CITY ?auto_1042 ?auto_1047 ) ( not ( = ?auto_1042 ?auto_1045 ) ) ( OBJ-AT ?auto_1044 ?auto_1045 ) ( IN-CITY ?auto_1048 ?auto_1047 ) ( not ( = ?auto_1042 ?auto_1048 ) ) ( OBJ-AT ?auto_1043 ?auto_1048 ) ( TRUCK-AT ?auto_1046 ?auto_1042 ) ( not ( = ?auto_1043 ?auto_1044 ) ) ( not ( = ?auto_1045 ?auto_1048 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1043 ?auto_1042 )
      ( DELIVER-1PKG ?auto_1044 ?auto_1042 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1153 - OBJ
      ?auto_1154 - OBJ
      ?auto_1155 - OBJ
      ?auto_1152 - LOCATION
    )
    :vars
    (
      ?auto_1158 - LOCATION
      ?auto_1156 - CITY
      ?auto_1159 - LOCATION
      ?auto_1157 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1158 ?auto_1156 ) ( IN-CITY ?auto_1152 ?auto_1156 ) ( not ( = ?auto_1152 ?auto_1158 ) ) ( OBJ-AT ?auto_1155 ?auto_1158 ) ( OBJ-AT ?auto_1154 ?auto_1158 ) ( IN-CITY ?auto_1159 ?auto_1156 ) ( not ( = ?auto_1152 ?auto_1159 ) ) ( OBJ-AT ?auto_1153 ?auto_1159 ) ( TRUCK-AT ?auto_1157 ?auto_1152 ) ( not ( = ?auto_1153 ?auto_1154 ) ) ( not ( = ?auto_1158 ?auto_1159 ) ) ( not ( = ?auto_1153 ?auto_1155 ) ) ( not ( = ?auto_1154 ?auto_1155 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1153 ?auto_1154 ?auto_1152 )
      ( DELIVER-1PKG ?auto_1155 ?auto_1152 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1183 - OBJ
      ?auto_1184 - OBJ
      ?auto_1185 - OBJ
      ?auto_1182 - LOCATION
    )
    :vars
    (
      ?auto_1186 - LOCATION
      ?auto_1189 - CITY
      ?auto_1188 - LOCATION
      ?auto_1187 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1186 ?auto_1189 ) ( IN-CITY ?auto_1182 ?auto_1189 ) ( not ( = ?auto_1182 ?auto_1186 ) ) ( OBJ-AT ?auto_1185 ?auto_1186 ) ( OBJ-AT ?auto_1183 ?auto_1186 ) ( IN-CITY ?auto_1188 ?auto_1189 ) ( not ( = ?auto_1182 ?auto_1188 ) ) ( OBJ-AT ?auto_1184 ?auto_1188 ) ( TRUCK-AT ?auto_1187 ?auto_1182 ) ( not ( = ?auto_1184 ?auto_1183 ) ) ( not ( = ?auto_1186 ?auto_1188 ) ) ( not ( = ?auto_1184 ?auto_1185 ) ) ( not ( = ?auto_1183 ?auto_1185 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1184 ?auto_1183 ?auto_1185 ?auto_1182 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1200 - OBJ
      ?auto_1201 - OBJ
      ?auto_1202 - OBJ
      ?auto_1199 - LOCATION
    )
    :vars
    (
      ?auto_1206 - LOCATION
      ?auto_1204 - CITY
      ?auto_1205 - LOCATION
      ?auto_1203 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1206 ?auto_1204 ) ( IN-CITY ?auto_1199 ?auto_1204 ) ( not ( = ?auto_1199 ?auto_1206 ) ) ( OBJ-AT ?auto_1201 ?auto_1206 ) ( OBJ-AT ?auto_1200 ?auto_1206 ) ( IN-CITY ?auto_1205 ?auto_1204 ) ( not ( = ?auto_1199 ?auto_1205 ) ) ( OBJ-AT ?auto_1202 ?auto_1205 ) ( TRUCK-AT ?auto_1203 ?auto_1199 ) ( not ( = ?auto_1202 ?auto_1200 ) ) ( not ( = ?auto_1206 ?auto_1205 ) ) ( not ( = ?auto_1202 ?auto_1201 ) ) ( not ( = ?auto_1200 ?auto_1201 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1200 ?auto_1202 ?auto_1201 ?auto_1199 ) )
  )

)

