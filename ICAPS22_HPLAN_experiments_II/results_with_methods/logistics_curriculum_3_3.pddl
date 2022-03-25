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
      ?auto_1104 - OBJ
      ?auto_1103 - LOCATION
    )
    :vars
    (
      ?auto_1106 - LOCATION
      ?auto_1107 - CITY
      ?auto_1105 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1106 ?auto_1107 ) ( IN-CITY ?auto_1103 ?auto_1107 ) ( not ( = ?auto_1103 ?auto_1106 ) ) ( OBJ-AT ?auto_1104 ?auto_1106 ) ( TRUCK-AT ?auto_1105 ?auto_1103 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1105 ?auto_1103 ?auto_1106 ?auto_1107 )
      ( !LOAD-TRUCK ?auto_1104 ?auto_1105 ?auto_1106 )
      ( !DRIVE-TRUCK ?auto_1105 ?auto_1106 ?auto_1103 ?auto_1107 )
      ( !UNLOAD-TRUCK ?auto_1104 ?auto_1105 ?auto_1103 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1111 - OBJ
      ?auto_1110 - LOCATION
    )
    :vars
    (
      ?auto_1113 - LOCATION
      ?auto_1114 - CITY
      ?auto_1112 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1113 ?auto_1114 ) ( IN-CITY ?auto_1110 ?auto_1114 ) ( not ( = ?auto_1110 ?auto_1113 ) ) ( OBJ-AT ?auto_1111 ?auto_1113 ) ( TRUCK-AT ?auto_1112 ?auto_1110 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1112 ?auto_1110 ?auto_1113 ?auto_1114 )
      ( !LOAD-TRUCK ?auto_1111 ?auto_1112 ?auto_1113 )
      ( !DRIVE-TRUCK ?auto_1112 ?auto_1113 ?auto_1110 ?auto_1114 )
      ( !UNLOAD-TRUCK ?auto_1111 ?auto_1112 ?auto_1110 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1125 - OBJ
      ?auto_1126 - OBJ
      ?auto_1124 - LOCATION
    )
    :vars
    (
      ?auto_1128 - LOCATION
      ?auto_1127 - CITY
      ?auto_1130 - LOCATION
      ?auto_1129 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1128 ?auto_1127 ) ( IN-CITY ?auto_1124 ?auto_1127 ) ( not ( = ?auto_1124 ?auto_1128 ) ) ( OBJ-AT ?auto_1126 ?auto_1128 ) ( IN-CITY ?auto_1130 ?auto_1127 ) ( not ( = ?auto_1124 ?auto_1130 ) ) ( OBJ-AT ?auto_1125 ?auto_1130 ) ( TRUCK-AT ?auto_1129 ?auto_1124 ) ( not ( = ?auto_1125 ?auto_1126 ) ) ( not ( = ?auto_1128 ?auto_1130 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1125 ?auto_1124 )
      ( DELIVER-1PKG ?auto_1126 ?auto_1124 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1132 - OBJ
      ?auto_1133 - OBJ
      ?auto_1131 - LOCATION
    )
    :vars
    (
      ?auto_1136 - LOCATION
      ?auto_1135 - CITY
      ?auto_1137 - LOCATION
      ?auto_1134 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1136 ?auto_1135 ) ( IN-CITY ?auto_1131 ?auto_1135 ) ( not ( = ?auto_1131 ?auto_1136 ) ) ( OBJ-AT ?auto_1132 ?auto_1136 ) ( IN-CITY ?auto_1137 ?auto_1135 ) ( not ( = ?auto_1131 ?auto_1137 ) ) ( OBJ-AT ?auto_1133 ?auto_1137 ) ( TRUCK-AT ?auto_1134 ?auto_1131 ) ( not ( = ?auto_1133 ?auto_1132 ) ) ( not ( = ?auto_1136 ?auto_1137 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1133 ?auto_1132 ?auto_1131 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1149 - OBJ
      ?auto_1148 - LOCATION
    )
    :vars
    (
      ?auto_1151 - LOCATION
      ?auto_1152 - CITY
      ?auto_1150 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1151 ?auto_1152 ) ( IN-CITY ?auto_1148 ?auto_1152 ) ( not ( = ?auto_1148 ?auto_1151 ) ) ( OBJ-AT ?auto_1149 ?auto_1151 ) ( TRUCK-AT ?auto_1150 ?auto_1148 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1150 ?auto_1148 ?auto_1151 ?auto_1152 )
      ( !LOAD-TRUCK ?auto_1149 ?auto_1150 ?auto_1151 )
      ( !DRIVE-TRUCK ?auto_1150 ?auto_1151 ?auto_1148 ?auto_1152 )
      ( !UNLOAD-TRUCK ?auto_1149 ?auto_1150 ?auto_1148 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1239 - OBJ
      ?auto_1240 - OBJ
      ?auto_1241 - OBJ
      ?auto_1238 - LOCATION
    )
    :vars
    (
      ?auto_1242 - LOCATION
      ?auto_1244 - CITY
      ?auto_1245 - LOCATION
      ?auto_1243 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1242 ?auto_1244 ) ( IN-CITY ?auto_1238 ?auto_1244 ) ( not ( = ?auto_1238 ?auto_1242 ) ) ( OBJ-AT ?auto_1241 ?auto_1242 ) ( OBJ-AT ?auto_1240 ?auto_1242 ) ( IN-CITY ?auto_1245 ?auto_1244 ) ( not ( = ?auto_1238 ?auto_1245 ) ) ( OBJ-AT ?auto_1239 ?auto_1245 ) ( TRUCK-AT ?auto_1243 ?auto_1238 ) ( not ( = ?auto_1239 ?auto_1240 ) ) ( not ( = ?auto_1242 ?auto_1245 ) ) ( not ( = ?auto_1239 ?auto_1241 ) ) ( not ( = ?auto_1240 ?auto_1241 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1240 ?auto_1239 ?auto_1238 )
      ( DELIVER-1PKG ?auto_1241 ?auto_1238 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1256 - OBJ
      ?auto_1257 - OBJ
      ?auto_1258 - OBJ
      ?auto_1255 - LOCATION
    )
    :vars
    (
      ?auto_1261 - LOCATION
      ?auto_1262 - CITY
      ?auto_1260 - LOCATION
      ?auto_1259 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1261 ?auto_1262 ) ( IN-CITY ?auto_1255 ?auto_1262 ) ( not ( = ?auto_1255 ?auto_1261 ) ) ( OBJ-AT ?auto_1257 ?auto_1261 ) ( OBJ-AT ?auto_1258 ?auto_1261 ) ( IN-CITY ?auto_1260 ?auto_1262 ) ( not ( = ?auto_1255 ?auto_1260 ) ) ( OBJ-AT ?auto_1256 ?auto_1260 ) ( TRUCK-AT ?auto_1259 ?auto_1255 ) ( not ( = ?auto_1256 ?auto_1258 ) ) ( not ( = ?auto_1261 ?auto_1260 ) ) ( not ( = ?auto_1256 ?auto_1257 ) ) ( not ( = ?auto_1258 ?auto_1257 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1256 ?auto_1258 ?auto_1257 ?auto_1255 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1273 - OBJ
      ?auto_1274 - OBJ
      ?auto_1275 - OBJ
      ?auto_1272 - LOCATION
    )
    :vars
    (
      ?auto_1278 - LOCATION
      ?auto_1277 - CITY
      ?auto_1279 - LOCATION
      ?auto_1276 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1278 ?auto_1277 ) ( IN-CITY ?auto_1272 ?auto_1277 ) ( not ( = ?auto_1272 ?auto_1278 ) ) ( OBJ-AT ?auto_1275 ?auto_1278 ) ( OBJ-AT ?auto_1273 ?auto_1278 ) ( IN-CITY ?auto_1279 ?auto_1277 ) ( not ( = ?auto_1272 ?auto_1279 ) ) ( OBJ-AT ?auto_1274 ?auto_1279 ) ( TRUCK-AT ?auto_1276 ?auto_1272 ) ( not ( = ?auto_1274 ?auto_1273 ) ) ( not ( = ?auto_1278 ?auto_1279 ) ) ( not ( = ?auto_1274 ?auto_1275 ) ) ( not ( = ?auto_1273 ?auto_1275 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1274 ?auto_1275 ?auto_1273 ?auto_1272 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1290 - OBJ
      ?auto_1291 - OBJ
      ?auto_1292 - OBJ
      ?auto_1289 - LOCATION
    )
    :vars
    (
      ?auto_1295 - LOCATION
      ?auto_1294 - CITY
      ?auto_1296 - LOCATION
      ?auto_1293 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1295 ?auto_1294 ) ( IN-CITY ?auto_1289 ?auto_1294 ) ( not ( = ?auto_1289 ?auto_1295 ) ) ( OBJ-AT ?auto_1291 ?auto_1295 ) ( OBJ-AT ?auto_1290 ?auto_1295 ) ( IN-CITY ?auto_1296 ?auto_1294 ) ( not ( = ?auto_1289 ?auto_1296 ) ) ( OBJ-AT ?auto_1292 ?auto_1296 ) ( TRUCK-AT ?auto_1293 ?auto_1289 ) ( not ( = ?auto_1292 ?auto_1290 ) ) ( not ( = ?auto_1295 ?auto_1296 ) ) ( not ( = ?auto_1292 ?auto_1291 ) ) ( not ( = ?auto_1290 ?auto_1291 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1292 ?auto_1291 ?auto_1290 ?auto_1289 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1325 - OBJ
      ?auto_1326 - OBJ
      ?auto_1327 - OBJ
      ?auto_1324 - LOCATION
    )
    :vars
    (
      ?auto_1330 - LOCATION
      ?auto_1329 - CITY
      ?auto_1331 - LOCATION
      ?auto_1328 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1330 ?auto_1329 ) ( IN-CITY ?auto_1324 ?auto_1329 ) ( not ( = ?auto_1324 ?auto_1330 ) ) ( OBJ-AT ?auto_1325 ?auto_1330 ) ( OBJ-AT ?auto_1327 ?auto_1330 ) ( IN-CITY ?auto_1331 ?auto_1329 ) ( not ( = ?auto_1324 ?auto_1331 ) ) ( OBJ-AT ?auto_1326 ?auto_1331 ) ( TRUCK-AT ?auto_1328 ?auto_1324 ) ( not ( = ?auto_1326 ?auto_1327 ) ) ( not ( = ?auto_1330 ?auto_1331 ) ) ( not ( = ?auto_1326 ?auto_1325 ) ) ( not ( = ?auto_1327 ?auto_1325 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1326 ?auto_1325 ?auto_1327 ?auto_1324 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1342 - OBJ
      ?auto_1343 - OBJ
      ?auto_1344 - OBJ
      ?auto_1341 - LOCATION
    )
    :vars
    (
      ?auto_1347 - LOCATION
      ?auto_1346 - CITY
      ?auto_1348 - LOCATION
      ?auto_1345 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1347 ?auto_1346 ) ( IN-CITY ?auto_1341 ?auto_1346 ) ( not ( = ?auto_1341 ?auto_1347 ) ) ( OBJ-AT ?auto_1342 ?auto_1347 ) ( OBJ-AT ?auto_1343 ?auto_1347 ) ( IN-CITY ?auto_1348 ?auto_1346 ) ( not ( = ?auto_1341 ?auto_1348 ) ) ( OBJ-AT ?auto_1344 ?auto_1348 ) ( TRUCK-AT ?auto_1345 ?auto_1341 ) ( not ( = ?auto_1344 ?auto_1343 ) ) ( not ( = ?auto_1347 ?auto_1348 ) ) ( not ( = ?auto_1344 ?auto_1342 ) ) ( not ( = ?auto_1343 ?auto_1342 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1344 ?auto_1342 ?auto_1343 ?auto_1341 ) )
  )

)

