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

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1022 - OBJ
      ?auto_1021 - LOCATION
    )
    :vars
    (
      ?auto_1023 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1023 ?auto_1021 ) ( IN-TRUCK ?auto_1022 ?auto_1023 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1022 ?auto_1023 ?auto_1021 )
      ( DELIVER-1PKG-VERIFY ?auto_1022 ?auto_1021 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1029 - OBJ
      ?auto_1028 - LOCATION
    )
    :vars
    (
      ?auto_1030 - TRUCK
      ?auto_1031 - LOCATION
      ?auto_1032 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1029 ?auto_1030 ) ( TRUCK-AT ?auto_1030 ?auto_1031 ) ( IN-CITY ?auto_1031 ?auto_1032 ) ( IN-CITY ?auto_1028 ?auto_1032 ) ( not ( = ?auto_1028 ?auto_1031 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1030 ?auto_1031 ?auto_1028 ?auto_1032 )
      ( DELIVER-1PKG ?auto_1029 ?auto_1028 )
      ( DELIVER-1PKG-VERIFY ?auto_1029 ?auto_1028 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1040 - OBJ
      ?auto_1039 - LOCATION
    )
    :vars
    (
      ?auto_1043 - TRUCK
      ?auto_1042 - LOCATION
      ?auto_1041 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1043 ?auto_1042 ) ( IN-CITY ?auto_1042 ?auto_1041 ) ( IN-CITY ?auto_1039 ?auto_1041 ) ( not ( = ?auto_1039 ?auto_1042 ) ) ( OBJ-AT ?auto_1040 ?auto_1042 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1040 ?auto_1043 ?auto_1042 )
      ( DELIVER-1PKG ?auto_1040 ?auto_1039 )
      ( DELIVER-1PKG-VERIFY ?auto_1040 ?auto_1039 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1051 - OBJ
      ?auto_1050 - LOCATION
    )
    :vars
    (
      ?auto_1054 - LOCATION
      ?auto_1053 - CITY
      ?auto_1052 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1054 ?auto_1053 ) ( IN-CITY ?auto_1050 ?auto_1053 ) ( not ( = ?auto_1050 ?auto_1054 ) ) ( OBJ-AT ?auto_1051 ?auto_1054 ) ( TRUCK-AT ?auto_1052 ?auto_1050 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1052 ?auto_1050 ?auto_1054 ?auto_1053 )
      ( DELIVER-1PKG ?auto_1051 ?auto_1050 )
      ( DELIVER-1PKG-VERIFY ?auto_1051 ?auto_1050 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1073 - OBJ
      ?auto_1072 - LOCATION
    )
    :vars
    (
      ?auto_1074 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1074 ?auto_1072 ) ( IN-TRUCK ?auto_1073 ?auto_1074 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1073 ?auto_1074 ?auto_1072 )
      ( DELIVER-1PKG-VERIFY ?auto_1073 ?auto_1072 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1076 - OBJ
      ?auto_1077 - OBJ
      ?auto_1075 - LOCATION
    )
    :vars
    (
      ?auto_1078 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1078 ?auto_1075 ) ( IN-TRUCK ?auto_1077 ?auto_1078 ) ( OBJ-AT ?auto_1076 ?auto_1075 ) ( not ( = ?auto_1076 ?auto_1077 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1077 ?auto_1075 )
      ( DELIVER-2PKG-VERIFY ?auto_1076 ?auto_1077 ?auto_1075 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1080 - OBJ
      ?auto_1081 - OBJ
      ?auto_1079 - LOCATION
    )
    :vars
    (
      ?auto_1082 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1082 ?auto_1079 ) ( IN-TRUCK ?auto_1080 ?auto_1082 ) ( OBJ-AT ?auto_1081 ?auto_1079 ) ( not ( = ?auto_1080 ?auto_1081 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1080 ?auto_1079 )
      ( DELIVER-2PKG-VERIFY ?auto_1080 ?auto_1081 ?auto_1079 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1088 - OBJ
      ?auto_1087 - LOCATION
    )
    :vars
    (
      ?auto_1089 - TRUCK
      ?auto_1090 - LOCATION
      ?auto_1091 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1088 ?auto_1089 ) ( TRUCK-AT ?auto_1089 ?auto_1090 ) ( IN-CITY ?auto_1090 ?auto_1091 ) ( IN-CITY ?auto_1087 ?auto_1091 ) ( not ( = ?auto_1087 ?auto_1090 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1089 ?auto_1090 ?auto_1087 ?auto_1091 )
      ( DELIVER-1PKG ?auto_1088 ?auto_1087 )
      ( DELIVER-1PKG-VERIFY ?auto_1088 ?auto_1087 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1093 - OBJ
      ?auto_1094 - OBJ
      ?auto_1092 - LOCATION
    )
    :vars
    (
      ?auto_1097 - TRUCK
      ?auto_1096 - LOCATION
      ?auto_1095 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1094 ?auto_1097 ) ( TRUCK-AT ?auto_1097 ?auto_1096 ) ( IN-CITY ?auto_1096 ?auto_1095 ) ( IN-CITY ?auto_1092 ?auto_1095 ) ( not ( = ?auto_1092 ?auto_1096 ) ) ( OBJ-AT ?auto_1093 ?auto_1092 ) ( not ( = ?auto_1093 ?auto_1094 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1094 ?auto_1092 )
      ( DELIVER-2PKG-VERIFY ?auto_1093 ?auto_1094 ?auto_1092 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1099 - OBJ
      ?auto_1100 - OBJ
      ?auto_1098 - LOCATION
    )
    :vars
    (
      ?auto_1102 - TRUCK
      ?auto_1103 - LOCATION
      ?auto_1101 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1099 ?auto_1102 ) ( TRUCK-AT ?auto_1102 ?auto_1103 ) ( IN-CITY ?auto_1103 ?auto_1101 ) ( IN-CITY ?auto_1098 ?auto_1101 ) ( not ( = ?auto_1098 ?auto_1103 ) ) ( OBJ-AT ?auto_1100 ?auto_1098 ) ( not ( = ?auto_1100 ?auto_1099 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1100 ?auto_1099 ?auto_1098 )
      ( DELIVER-2PKG-VERIFY ?auto_1099 ?auto_1100 ?auto_1098 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1112 - OBJ
      ?auto_1111 - LOCATION
    )
    :vars
    (
      ?auto_1115 - TRUCK
      ?auto_1116 - LOCATION
      ?auto_1113 - CITY
      ?auto_1114 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1115 ?auto_1116 ) ( IN-CITY ?auto_1116 ?auto_1113 ) ( IN-CITY ?auto_1111 ?auto_1113 ) ( not ( = ?auto_1111 ?auto_1116 ) ) ( OBJ-AT ?auto_1114 ?auto_1111 ) ( not ( = ?auto_1114 ?auto_1112 ) ) ( OBJ-AT ?auto_1112 ?auto_1116 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1112 ?auto_1115 ?auto_1116 )
      ( DELIVER-2PKG ?auto_1114 ?auto_1112 ?auto_1111 )
      ( DELIVER-1PKG-VERIFY ?auto_1112 ?auto_1111 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1118 - OBJ
      ?auto_1119 - OBJ
      ?auto_1117 - LOCATION
    )
    :vars
    (
      ?auto_1120 - TRUCK
      ?auto_1121 - LOCATION
      ?auto_1122 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1120 ?auto_1121 ) ( IN-CITY ?auto_1121 ?auto_1122 ) ( IN-CITY ?auto_1117 ?auto_1122 ) ( not ( = ?auto_1117 ?auto_1121 ) ) ( OBJ-AT ?auto_1118 ?auto_1117 ) ( not ( = ?auto_1118 ?auto_1119 ) ) ( OBJ-AT ?auto_1119 ?auto_1121 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1119 ?auto_1117 )
      ( DELIVER-2PKG-VERIFY ?auto_1118 ?auto_1119 ?auto_1117 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1124 - OBJ
      ?auto_1125 - OBJ
      ?auto_1123 - LOCATION
    )
    :vars
    (
      ?auto_1128 - TRUCK
      ?auto_1127 - LOCATION
      ?auto_1126 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1128 ?auto_1127 ) ( IN-CITY ?auto_1127 ?auto_1126 ) ( IN-CITY ?auto_1123 ?auto_1126 ) ( not ( = ?auto_1123 ?auto_1127 ) ) ( OBJ-AT ?auto_1125 ?auto_1123 ) ( not ( = ?auto_1125 ?auto_1124 ) ) ( OBJ-AT ?auto_1124 ?auto_1127 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1125 ?auto_1124 ?auto_1123 )
      ( DELIVER-2PKG-VERIFY ?auto_1124 ?auto_1125 ?auto_1123 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1137 - OBJ
      ?auto_1136 - LOCATION
    )
    :vars
    (
      ?auto_1139 - LOCATION
      ?auto_1138 - CITY
      ?auto_1140 - OBJ
      ?auto_1141 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1139 ?auto_1138 ) ( IN-CITY ?auto_1136 ?auto_1138 ) ( not ( = ?auto_1136 ?auto_1139 ) ) ( OBJ-AT ?auto_1140 ?auto_1136 ) ( not ( = ?auto_1140 ?auto_1137 ) ) ( OBJ-AT ?auto_1137 ?auto_1139 ) ( TRUCK-AT ?auto_1141 ?auto_1136 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1141 ?auto_1136 ?auto_1139 ?auto_1138 )
      ( DELIVER-2PKG ?auto_1140 ?auto_1137 ?auto_1136 )
      ( DELIVER-1PKG-VERIFY ?auto_1137 ?auto_1136 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1143 - OBJ
      ?auto_1144 - OBJ
      ?auto_1142 - LOCATION
    )
    :vars
    (
      ?auto_1147 - LOCATION
      ?auto_1146 - CITY
      ?auto_1145 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1147 ?auto_1146 ) ( IN-CITY ?auto_1142 ?auto_1146 ) ( not ( = ?auto_1142 ?auto_1147 ) ) ( OBJ-AT ?auto_1143 ?auto_1142 ) ( not ( = ?auto_1143 ?auto_1144 ) ) ( OBJ-AT ?auto_1144 ?auto_1147 ) ( TRUCK-AT ?auto_1145 ?auto_1142 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1144 ?auto_1142 )
      ( DELIVER-2PKG-VERIFY ?auto_1143 ?auto_1144 ?auto_1142 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1149 - OBJ
      ?auto_1150 - OBJ
      ?auto_1148 - LOCATION
    )
    :vars
    (
      ?auto_1152 - LOCATION
      ?auto_1151 - CITY
      ?auto_1153 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1152 ?auto_1151 ) ( IN-CITY ?auto_1148 ?auto_1151 ) ( not ( = ?auto_1148 ?auto_1152 ) ) ( OBJ-AT ?auto_1150 ?auto_1148 ) ( not ( = ?auto_1150 ?auto_1149 ) ) ( OBJ-AT ?auto_1149 ?auto_1152 ) ( TRUCK-AT ?auto_1153 ?auto_1148 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1150 ?auto_1149 ?auto_1148 )
      ( DELIVER-2PKG-VERIFY ?auto_1149 ?auto_1150 ?auto_1148 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1162 - OBJ
      ?auto_1161 - LOCATION
    )
    :vars
    (
      ?auto_1165 - LOCATION
      ?auto_1164 - CITY
      ?auto_1163 - OBJ
      ?auto_1166 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1165 ?auto_1164 ) ( IN-CITY ?auto_1161 ?auto_1164 ) ( not ( = ?auto_1161 ?auto_1165 ) ) ( not ( = ?auto_1163 ?auto_1162 ) ) ( OBJ-AT ?auto_1162 ?auto_1165 ) ( TRUCK-AT ?auto_1166 ?auto_1161 ) ( IN-TRUCK ?auto_1163 ?auto_1166 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1163 ?auto_1161 )
      ( DELIVER-2PKG ?auto_1163 ?auto_1162 ?auto_1161 )
      ( DELIVER-1PKG-VERIFY ?auto_1162 ?auto_1161 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1168 - OBJ
      ?auto_1169 - OBJ
      ?auto_1167 - LOCATION
    )
    :vars
    (
      ?auto_1171 - LOCATION
      ?auto_1170 - CITY
      ?auto_1172 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1171 ?auto_1170 ) ( IN-CITY ?auto_1167 ?auto_1170 ) ( not ( = ?auto_1167 ?auto_1171 ) ) ( not ( = ?auto_1168 ?auto_1169 ) ) ( OBJ-AT ?auto_1169 ?auto_1171 ) ( TRUCK-AT ?auto_1172 ?auto_1167 ) ( IN-TRUCK ?auto_1168 ?auto_1172 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1169 ?auto_1167 )
      ( DELIVER-2PKG-VERIFY ?auto_1168 ?auto_1169 ?auto_1167 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1174 - OBJ
      ?auto_1175 - OBJ
      ?auto_1173 - LOCATION
    )
    :vars
    (
      ?auto_1178 - LOCATION
      ?auto_1177 - CITY
      ?auto_1176 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1178 ?auto_1177 ) ( IN-CITY ?auto_1173 ?auto_1177 ) ( not ( = ?auto_1173 ?auto_1178 ) ) ( not ( = ?auto_1175 ?auto_1174 ) ) ( OBJ-AT ?auto_1174 ?auto_1178 ) ( TRUCK-AT ?auto_1176 ?auto_1173 ) ( IN-TRUCK ?auto_1175 ?auto_1176 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1175 ?auto_1174 ?auto_1173 )
      ( DELIVER-2PKG-VERIFY ?auto_1174 ?auto_1175 ?auto_1173 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1187 - OBJ
      ?auto_1186 - LOCATION
    )
    :vars
    (
      ?auto_1191 - LOCATION
      ?auto_1189 - CITY
      ?auto_1190 - OBJ
      ?auto_1188 - TRUCK
      ?auto_1192 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1191 ?auto_1189 ) ( IN-CITY ?auto_1186 ?auto_1189 ) ( not ( = ?auto_1186 ?auto_1191 ) ) ( not ( = ?auto_1190 ?auto_1187 ) ) ( OBJ-AT ?auto_1187 ?auto_1191 ) ( IN-TRUCK ?auto_1190 ?auto_1188 ) ( TRUCK-AT ?auto_1188 ?auto_1192 ) ( IN-CITY ?auto_1192 ?auto_1189 ) ( not ( = ?auto_1186 ?auto_1192 ) ) ( not ( = ?auto_1191 ?auto_1192 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1188 ?auto_1192 ?auto_1186 ?auto_1189 )
      ( DELIVER-2PKG ?auto_1190 ?auto_1187 ?auto_1186 )
      ( DELIVER-1PKG-VERIFY ?auto_1187 ?auto_1186 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1194 - OBJ
      ?auto_1195 - OBJ
      ?auto_1193 - LOCATION
    )
    :vars
    (
      ?auto_1198 - LOCATION
      ?auto_1197 - CITY
      ?auto_1196 - TRUCK
      ?auto_1199 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1198 ?auto_1197 ) ( IN-CITY ?auto_1193 ?auto_1197 ) ( not ( = ?auto_1193 ?auto_1198 ) ) ( not ( = ?auto_1194 ?auto_1195 ) ) ( OBJ-AT ?auto_1195 ?auto_1198 ) ( IN-TRUCK ?auto_1194 ?auto_1196 ) ( TRUCK-AT ?auto_1196 ?auto_1199 ) ( IN-CITY ?auto_1199 ?auto_1197 ) ( not ( = ?auto_1193 ?auto_1199 ) ) ( not ( = ?auto_1198 ?auto_1199 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1195 ?auto_1193 )
      ( DELIVER-2PKG-VERIFY ?auto_1194 ?auto_1195 ?auto_1193 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1201 - OBJ
      ?auto_1202 - OBJ
      ?auto_1200 - LOCATION
    )
    :vars
    (
      ?auto_1205 - LOCATION
      ?auto_1206 - CITY
      ?auto_1203 - TRUCK
      ?auto_1204 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1205 ?auto_1206 ) ( IN-CITY ?auto_1200 ?auto_1206 ) ( not ( = ?auto_1200 ?auto_1205 ) ) ( not ( = ?auto_1202 ?auto_1201 ) ) ( OBJ-AT ?auto_1201 ?auto_1205 ) ( IN-TRUCK ?auto_1202 ?auto_1203 ) ( TRUCK-AT ?auto_1203 ?auto_1204 ) ( IN-CITY ?auto_1204 ?auto_1206 ) ( not ( = ?auto_1200 ?auto_1204 ) ) ( not ( = ?auto_1205 ?auto_1204 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1202 ?auto_1201 ?auto_1200 )
      ( DELIVER-2PKG-VERIFY ?auto_1201 ?auto_1202 ?auto_1200 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1216 - OBJ
      ?auto_1215 - LOCATION
    )
    :vars
    (
      ?auto_1219 - LOCATION
      ?auto_1220 - CITY
      ?auto_1221 - OBJ
      ?auto_1217 - TRUCK
      ?auto_1218 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1219 ?auto_1220 ) ( IN-CITY ?auto_1215 ?auto_1220 ) ( not ( = ?auto_1215 ?auto_1219 ) ) ( not ( = ?auto_1221 ?auto_1216 ) ) ( OBJ-AT ?auto_1216 ?auto_1219 ) ( TRUCK-AT ?auto_1217 ?auto_1218 ) ( IN-CITY ?auto_1218 ?auto_1220 ) ( not ( = ?auto_1215 ?auto_1218 ) ) ( not ( = ?auto_1219 ?auto_1218 ) ) ( OBJ-AT ?auto_1221 ?auto_1218 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1221 ?auto_1217 ?auto_1218 )
      ( DELIVER-2PKG ?auto_1221 ?auto_1216 ?auto_1215 )
      ( DELIVER-1PKG-VERIFY ?auto_1216 ?auto_1215 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1223 - OBJ
      ?auto_1224 - OBJ
      ?auto_1222 - LOCATION
    )
    :vars
    (
      ?auto_1225 - LOCATION
      ?auto_1228 - CITY
      ?auto_1226 - TRUCK
      ?auto_1227 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1225 ?auto_1228 ) ( IN-CITY ?auto_1222 ?auto_1228 ) ( not ( = ?auto_1222 ?auto_1225 ) ) ( not ( = ?auto_1223 ?auto_1224 ) ) ( OBJ-AT ?auto_1224 ?auto_1225 ) ( TRUCK-AT ?auto_1226 ?auto_1227 ) ( IN-CITY ?auto_1227 ?auto_1228 ) ( not ( = ?auto_1222 ?auto_1227 ) ) ( not ( = ?auto_1225 ?auto_1227 ) ) ( OBJ-AT ?auto_1223 ?auto_1227 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1224 ?auto_1222 )
      ( DELIVER-2PKG-VERIFY ?auto_1223 ?auto_1224 ?auto_1222 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1230 - OBJ
      ?auto_1231 - OBJ
      ?auto_1229 - LOCATION
    )
    :vars
    (
      ?auto_1232 - LOCATION
      ?auto_1235 - CITY
      ?auto_1233 - TRUCK
      ?auto_1234 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1232 ?auto_1235 ) ( IN-CITY ?auto_1229 ?auto_1235 ) ( not ( = ?auto_1229 ?auto_1232 ) ) ( not ( = ?auto_1231 ?auto_1230 ) ) ( OBJ-AT ?auto_1230 ?auto_1232 ) ( TRUCK-AT ?auto_1233 ?auto_1234 ) ( IN-CITY ?auto_1234 ?auto_1235 ) ( not ( = ?auto_1229 ?auto_1234 ) ) ( not ( = ?auto_1232 ?auto_1234 ) ) ( OBJ-AT ?auto_1231 ?auto_1234 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1231 ?auto_1230 ?auto_1229 )
      ( DELIVER-2PKG-VERIFY ?auto_1230 ?auto_1231 ?auto_1229 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1245 - OBJ
      ?auto_1244 - LOCATION
    )
    :vars
    (
      ?auto_1246 - LOCATION
      ?auto_1249 - CITY
      ?auto_1250 - OBJ
      ?auto_1248 - LOCATION
      ?auto_1247 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1246 ?auto_1249 ) ( IN-CITY ?auto_1244 ?auto_1249 ) ( not ( = ?auto_1244 ?auto_1246 ) ) ( not ( = ?auto_1250 ?auto_1245 ) ) ( OBJ-AT ?auto_1245 ?auto_1246 ) ( IN-CITY ?auto_1248 ?auto_1249 ) ( not ( = ?auto_1244 ?auto_1248 ) ) ( not ( = ?auto_1246 ?auto_1248 ) ) ( OBJ-AT ?auto_1250 ?auto_1248 ) ( TRUCK-AT ?auto_1247 ?auto_1244 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1247 ?auto_1244 ?auto_1248 ?auto_1249 )
      ( DELIVER-2PKG ?auto_1250 ?auto_1245 ?auto_1244 )
      ( DELIVER-1PKG-VERIFY ?auto_1245 ?auto_1244 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1252 - OBJ
      ?auto_1253 - OBJ
      ?auto_1251 - LOCATION
    )
    :vars
    (
      ?auto_1254 - LOCATION
      ?auto_1256 - CITY
      ?auto_1255 - LOCATION
      ?auto_1257 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1254 ?auto_1256 ) ( IN-CITY ?auto_1251 ?auto_1256 ) ( not ( = ?auto_1251 ?auto_1254 ) ) ( not ( = ?auto_1252 ?auto_1253 ) ) ( OBJ-AT ?auto_1253 ?auto_1254 ) ( IN-CITY ?auto_1255 ?auto_1256 ) ( not ( = ?auto_1251 ?auto_1255 ) ) ( not ( = ?auto_1254 ?auto_1255 ) ) ( OBJ-AT ?auto_1252 ?auto_1255 ) ( TRUCK-AT ?auto_1257 ?auto_1251 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1253 ?auto_1251 )
      ( DELIVER-2PKG-VERIFY ?auto_1252 ?auto_1253 ?auto_1251 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1259 - OBJ
      ?auto_1260 - OBJ
      ?auto_1258 - LOCATION
    )
    :vars
    (
      ?auto_1261 - LOCATION
      ?auto_1264 - CITY
      ?auto_1263 - LOCATION
      ?auto_1262 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1261 ?auto_1264 ) ( IN-CITY ?auto_1258 ?auto_1264 ) ( not ( = ?auto_1258 ?auto_1261 ) ) ( not ( = ?auto_1260 ?auto_1259 ) ) ( OBJ-AT ?auto_1259 ?auto_1261 ) ( IN-CITY ?auto_1263 ?auto_1264 ) ( not ( = ?auto_1258 ?auto_1263 ) ) ( not ( = ?auto_1261 ?auto_1263 ) ) ( OBJ-AT ?auto_1260 ?auto_1263 ) ( TRUCK-AT ?auto_1262 ?auto_1258 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1260 ?auto_1259 ?auto_1258 )
      ( DELIVER-2PKG-VERIFY ?auto_1259 ?auto_1260 ?auto_1258 ) )
  )

)

