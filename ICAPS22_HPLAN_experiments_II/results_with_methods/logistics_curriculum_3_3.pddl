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
      ?auto_1107 - OBJ
      ?auto_1106 - LOCATION
    )
    :vars
    (
      ?auto_1109 - LOCATION
      ?auto_1110 - CITY
      ?auto_1108 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1109 ?auto_1110 ) ( IN-CITY ?auto_1106 ?auto_1110 ) ( not ( = ?auto_1106 ?auto_1109 ) ) ( OBJ-AT ?auto_1107 ?auto_1109 ) ( TRUCK-AT ?auto_1108 ?auto_1106 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1108 ?auto_1106 ?auto_1109 ?auto_1110 )
      ( !LOAD-TRUCK ?auto_1107 ?auto_1108 ?auto_1109 )
      ( !DRIVE-TRUCK ?auto_1108 ?auto_1109 ?auto_1106 ?auto_1110 )
      ( !UNLOAD-TRUCK ?auto_1107 ?auto_1108 ?auto_1106 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1114 - OBJ
      ?auto_1113 - LOCATION
    )
    :vars
    (
      ?auto_1116 - LOCATION
      ?auto_1117 - CITY
      ?auto_1115 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1116 ?auto_1117 ) ( IN-CITY ?auto_1113 ?auto_1117 ) ( not ( = ?auto_1113 ?auto_1116 ) ) ( OBJ-AT ?auto_1114 ?auto_1116 ) ( TRUCK-AT ?auto_1115 ?auto_1113 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1115 ?auto_1113 ?auto_1116 ?auto_1117 )
      ( !LOAD-TRUCK ?auto_1114 ?auto_1115 ?auto_1116 )
      ( !DRIVE-TRUCK ?auto_1115 ?auto_1116 ?auto_1113 ?auto_1117 )
      ( !UNLOAD-TRUCK ?auto_1114 ?auto_1115 ?auto_1113 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1128 - OBJ
      ?auto_1129 - OBJ
      ?auto_1127 - LOCATION
    )
    :vars
    (
      ?auto_1132 - LOCATION
      ?auto_1131 - CITY
      ?auto_1133 - LOCATION
      ?auto_1130 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1132 ?auto_1131 ) ( IN-CITY ?auto_1127 ?auto_1131 ) ( not ( = ?auto_1127 ?auto_1132 ) ) ( OBJ-AT ?auto_1129 ?auto_1132 ) ( IN-CITY ?auto_1133 ?auto_1131 ) ( not ( = ?auto_1127 ?auto_1133 ) ) ( OBJ-AT ?auto_1128 ?auto_1133 ) ( TRUCK-AT ?auto_1130 ?auto_1127 ) ( not ( = ?auto_1128 ?auto_1129 ) ) ( not ( = ?auto_1132 ?auto_1133 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1128 ?auto_1127 )
      ( DELIVER-1PKG ?auto_1129 ?auto_1127 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1135 - OBJ
      ?auto_1136 - OBJ
      ?auto_1134 - LOCATION
    )
    :vars
    (
      ?auto_1139 - LOCATION
      ?auto_1138 - CITY
      ?auto_1140 - LOCATION
      ?auto_1137 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1139 ?auto_1138 ) ( IN-CITY ?auto_1134 ?auto_1138 ) ( not ( = ?auto_1134 ?auto_1139 ) ) ( OBJ-AT ?auto_1135 ?auto_1139 ) ( IN-CITY ?auto_1140 ?auto_1138 ) ( not ( = ?auto_1134 ?auto_1140 ) ) ( OBJ-AT ?auto_1136 ?auto_1140 ) ( TRUCK-AT ?auto_1137 ?auto_1134 ) ( not ( = ?auto_1136 ?auto_1135 ) ) ( not ( = ?auto_1139 ?auto_1140 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1136 ?auto_1135 ?auto_1134 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1152 - OBJ
      ?auto_1151 - LOCATION
    )
    :vars
    (
      ?auto_1154 - LOCATION
      ?auto_1155 - CITY
      ?auto_1153 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1154 ?auto_1155 ) ( IN-CITY ?auto_1151 ?auto_1155 ) ( not ( = ?auto_1151 ?auto_1154 ) ) ( OBJ-AT ?auto_1152 ?auto_1154 ) ( TRUCK-AT ?auto_1153 ?auto_1151 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1153 ?auto_1151 ?auto_1154 ?auto_1155 )
      ( !LOAD-TRUCK ?auto_1152 ?auto_1153 ?auto_1154 )
      ( !DRIVE-TRUCK ?auto_1153 ?auto_1154 ?auto_1151 ?auto_1155 )
      ( !UNLOAD-TRUCK ?auto_1152 ?auto_1153 ?auto_1151 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1243 - OBJ
      ?auto_1244 - OBJ
      ?auto_1245 - OBJ
      ?auto_1242 - LOCATION
    )
    :vars
    (
      ?auto_1246 - LOCATION
      ?auto_1247 - CITY
      ?auto_1249 - LOCATION
      ?auto_1250 - LOCATION
      ?auto_1248 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1246 ?auto_1247 ) ( IN-CITY ?auto_1242 ?auto_1247 ) ( not ( = ?auto_1242 ?auto_1246 ) ) ( OBJ-AT ?auto_1245 ?auto_1246 ) ( IN-CITY ?auto_1249 ?auto_1247 ) ( not ( = ?auto_1242 ?auto_1249 ) ) ( OBJ-AT ?auto_1244 ?auto_1249 ) ( IN-CITY ?auto_1250 ?auto_1247 ) ( not ( = ?auto_1242 ?auto_1250 ) ) ( OBJ-AT ?auto_1243 ?auto_1250 ) ( TRUCK-AT ?auto_1248 ?auto_1242 ) ( not ( = ?auto_1243 ?auto_1244 ) ) ( not ( = ?auto_1249 ?auto_1250 ) ) ( not ( = ?auto_1243 ?auto_1245 ) ) ( not ( = ?auto_1244 ?auto_1245 ) ) ( not ( = ?auto_1246 ?auto_1249 ) ) ( not ( = ?auto_1246 ?auto_1250 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1244 ?auto_1243 ?auto_1242 )
      ( DELIVER-1PKG ?auto_1245 ?auto_1242 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1262 - OBJ
      ?auto_1263 - OBJ
      ?auto_1264 - OBJ
      ?auto_1261 - LOCATION
    )
    :vars
    (
      ?auto_1267 - LOCATION
      ?auto_1269 - CITY
      ?auto_1265 - LOCATION
      ?auto_1266 - LOCATION
      ?auto_1268 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1267 ?auto_1269 ) ( IN-CITY ?auto_1261 ?auto_1269 ) ( not ( = ?auto_1261 ?auto_1267 ) ) ( OBJ-AT ?auto_1263 ?auto_1267 ) ( IN-CITY ?auto_1265 ?auto_1269 ) ( not ( = ?auto_1261 ?auto_1265 ) ) ( OBJ-AT ?auto_1264 ?auto_1265 ) ( IN-CITY ?auto_1266 ?auto_1269 ) ( not ( = ?auto_1261 ?auto_1266 ) ) ( OBJ-AT ?auto_1262 ?auto_1266 ) ( TRUCK-AT ?auto_1268 ?auto_1261 ) ( not ( = ?auto_1262 ?auto_1264 ) ) ( not ( = ?auto_1265 ?auto_1266 ) ) ( not ( = ?auto_1262 ?auto_1263 ) ) ( not ( = ?auto_1264 ?auto_1263 ) ) ( not ( = ?auto_1267 ?auto_1265 ) ) ( not ( = ?auto_1267 ?auto_1266 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1262 ?auto_1264 ?auto_1263 ?auto_1261 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1281 - OBJ
      ?auto_1282 - OBJ
      ?auto_1283 - OBJ
      ?auto_1280 - LOCATION
    )
    :vars
    (
      ?auto_1286 - LOCATION
      ?auto_1285 - CITY
      ?auto_1287 - LOCATION
      ?auto_1288 - LOCATION
      ?auto_1284 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1286 ?auto_1285 ) ( IN-CITY ?auto_1280 ?auto_1285 ) ( not ( = ?auto_1280 ?auto_1286 ) ) ( OBJ-AT ?auto_1283 ?auto_1286 ) ( IN-CITY ?auto_1287 ?auto_1285 ) ( not ( = ?auto_1280 ?auto_1287 ) ) ( OBJ-AT ?auto_1281 ?auto_1287 ) ( IN-CITY ?auto_1288 ?auto_1285 ) ( not ( = ?auto_1280 ?auto_1288 ) ) ( OBJ-AT ?auto_1282 ?auto_1288 ) ( TRUCK-AT ?auto_1284 ?auto_1280 ) ( not ( = ?auto_1282 ?auto_1281 ) ) ( not ( = ?auto_1287 ?auto_1288 ) ) ( not ( = ?auto_1282 ?auto_1283 ) ) ( not ( = ?auto_1281 ?auto_1283 ) ) ( not ( = ?auto_1286 ?auto_1287 ) ) ( not ( = ?auto_1286 ?auto_1288 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1282 ?auto_1283 ?auto_1281 ?auto_1280 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1300 - OBJ
      ?auto_1301 - OBJ
      ?auto_1302 - OBJ
      ?auto_1299 - LOCATION
    )
    :vars
    (
      ?auto_1305 - LOCATION
      ?auto_1304 - CITY
      ?auto_1306 - LOCATION
      ?auto_1307 - LOCATION
      ?auto_1303 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1305 ?auto_1304 ) ( IN-CITY ?auto_1299 ?auto_1304 ) ( not ( = ?auto_1299 ?auto_1305 ) ) ( OBJ-AT ?auto_1301 ?auto_1305 ) ( IN-CITY ?auto_1306 ?auto_1304 ) ( not ( = ?auto_1299 ?auto_1306 ) ) ( OBJ-AT ?auto_1300 ?auto_1306 ) ( IN-CITY ?auto_1307 ?auto_1304 ) ( not ( = ?auto_1299 ?auto_1307 ) ) ( OBJ-AT ?auto_1302 ?auto_1307 ) ( TRUCK-AT ?auto_1303 ?auto_1299 ) ( not ( = ?auto_1302 ?auto_1300 ) ) ( not ( = ?auto_1306 ?auto_1307 ) ) ( not ( = ?auto_1302 ?auto_1301 ) ) ( not ( = ?auto_1300 ?auto_1301 ) ) ( not ( = ?auto_1305 ?auto_1306 ) ) ( not ( = ?auto_1305 ?auto_1307 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1302 ?auto_1301 ?auto_1300 ?auto_1299 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1339 - OBJ
      ?auto_1340 - OBJ
      ?auto_1341 - OBJ
      ?auto_1338 - LOCATION
    )
    :vars
    (
      ?auto_1344 - LOCATION
      ?auto_1343 - CITY
      ?auto_1345 - LOCATION
      ?auto_1346 - LOCATION
      ?auto_1342 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1344 ?auto_1343 ) ( IN-CITY ?auto_1338 ?auto_1343 ) ( not ( = ?auto_1338 ?auto_1344 ) ) ( OBJ-AT ?auto_1339 ?auto_1344 ) ( IN-CITY ?auto_1345 ?auto_1343 ) ( not ( = ?auto_1338 ?auto_1345 ) ) ( OBJ-AT ?auto_1341 ?auto_1345 ) ( IN-CITY ?auto_1346 ?auto_1343 ) ( not ( = ?auto_1338 ?auto_1346 ) ) ( OBJ-AT ?auto_1340 ?auto_1346 ) ( TRUCK-AT ?auto_1342 ?auto_1338 ) ( not ( = ?auto_1340 ?auto_1341 ) ) ( not ( = ?auto_1345 ?auto_1346 ) ) ( not ( = ?auto_1340 ?auto_1339 ) ) ( not ( = ?auto_1341 ?auto_1339 ) ) ( not ( = ?auto_1344 ?auto_1345 ) ) ( not ( = ?auto_1344 ?auto_1346 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1340 ?auto_1339 ?auto_1341 ?auto_1338 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1358 - OBJ
      ?auto_1359 - OBJ
      ?auto_1360 - OBJ
      ?auto_1357 - LOCATION
    )
    :vars
    (
      ?auto_1363 - LOCATION
      ?auto_1362 - CITY
      ?auto_1364 - LOCATION
      ?auto_1365 - LOCATION
      ?auto_1361 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1363 ?auto_1362 ) ( IN-CITY ?auto_1357 ?auto_1362 ) ( not ( = ?auto_1357 ?auto_1363 ) ) ( OBJ-AT ?auto_1358 ?auto_1363 ) ( IN-CITY ?auto_1364 ?auto_1362 ) ( not ( = ?auto_1357 ?auto_1364 ) ) ( OBJ-AT ?auto_1359 ?auto_1364 ) ( IN-CITY ?auto_1365 ?auto_1362 ) ( not ( = ?auto_1357 ?auto_1365 ) ) ( OBJ-AT ?auto_1360 ?auto_1365 ) ( TRUCK-AT ?auto_1361 ?auto_1357 ) ( not ( = ?auto_1360 ?auto_1359 ) ) ( not ( = ?auto_1364 ?auto_1365 ) ) ( not ( = ?auto_1360 ?auto_1358 ) ) ( not ( = ?auto_1359 ?auto_1358 ) ) ( not ( = ?auto_1363 ?auto_1364 ) ) ( not ( = ?auto_1363 ?auto_1365 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1360 ?auto_1358 ?auto_1359 ?auto_1357 ) )
  )

)

