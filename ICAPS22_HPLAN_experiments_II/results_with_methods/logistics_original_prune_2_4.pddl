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
      ?auto_985 - OBJ
      ?auto_984 - LOCATION
    )
    :vars
    (
      ?auto_986 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_986 ?auto_984 ) ( IN-TRUCK ?auto_985 ?auto_986 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_985 ?auto_986 ?auto_984 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_992 - OBJ
      ?auto_991 - LOCATION
    )
    :vars
    (
      ?auto_993 - TRUCK
      ?auto_994 - LOCATION
      ?auto_995 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_992 ?auto_993 ) ( TRUCK-AT ?auto_993 ?auto_994 ) ( IN-CITY ?auto_994 ?auto_995 ) ( IN-CITY ?auto_991 ?auto_995 ) ( not ( = ?auto_991 ?auto_994 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_993 ?auto_994 ?auto_991 ?auto_995 )
      ( DELIVER-1PKG ?auto_992 ?auto_991 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1003 - OBJ
      ?auto_1002 - LOCATION
    )
    :vars
    (
      ?auto_1006 - TRUCK
      ?auto_1004 - LOCATION
      ?auto_1005 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1006 ?auto_1004 ) ( IN-CITY ?auto_1004 ?auto_1005 ) ( IN-CITY ?auto_1002 ?auto_1005 ) ( not ( = ?auto_1002 ?auto_1004 ) ) ( OBJ-AT ?auto_1003 ?auto_1004 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1003 ?auto_1006 ?auto_1004 )
      ( DELIVER-1PKG ?auto_1003 ?auto_1002 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1014 - OBJ
      ?auto_1013 - LOCATION
    )
    :vars
    (
      ?auto_1017 - LOCATION
      ?auto_1016 - CITY
      ?auto_1015 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1017 ?auto_1016 ) ( IN-CITY ?auto_1013 ?auto_1016 ) ( not ( = ?auto_1013 ?auto_1017 ) ) ( OBJ-AT ?auto_1014 ?auto_1017 ) ( TRUCK-AT ?auto_1015 ?auto_1013 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1015 ?auto_1013 ?auto_1017 ?auto_1016 )
      ( DELIVER-1PKG ?auto_1014 ?auto_1013 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1039 - OBJ
      ?auto_1040 - OBJ
      ?auto_1038 - LOCATION
    )
    :vars
    (
      ?auto_1041 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1041 ?auto_1038 ) ( IN-TRUCK ?auto_1040 ?auto_1041 ) ( OBJ-AT ?auto_1039 ?auto_1038 ) ( not ( = ?auto_1039 ?auto_1040 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1040 ?auto_1038 ) )
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
      ?auto_1045 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1045 ?auto_1042 ) ( IN-TRUCK ?auto_1043 ?auto_1045 ) ( OBJ-AT ?auto_1044 ?auto_1042 ) ( not ( = ?auto_1043 ?auto_1044 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1043 ?auto_1042 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1056 - OBJ
      ?auto_1057 - OBJ
      ?auto_1055 - LOCATION
    )
    :vars
    (
      ?auto_1058 - TRUCK
      ?auto_1059 - LOCATION
      ?auto_1060 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1057 ?auto_1058 ) ( TRUCK-AT ?auto_1058 ?auto_1059 ) ( IN-CITY ?auto_1059 ?auto_1060 ) ( IN-CITY ?auto_1055 ?auto_1060 ) ( not ( = ?auto_1055 ?auto_1059 ) ) ( OBJ-AT ?auto_1056 ?auto_1055 ) ( not ( = ?auto_1056 ?auto_1057 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1057 ?auto_1055 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1062 - OBJ
      ?auto_1063 - OBJ
      ?auto_1061 - LOCATION
    )
    :vars
    (
      ?auto_1066 - TRUCK
      ?auto_1064 - LOCATION
      ?auto_1065 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1062 ?auto_1066 ) ( TRUCK-AT ?auto_1066 ?auto_1064 ) ( IN-CITY ?auto_1064 ?auto_1065 ) ( IN-CITY ?auto_1061 ?auto_1065 ) ( not ( = ?auto_1061 ?auto_1064 ) ) ( OBJ-AT ?auto_1063 ?auto_1061 ) ( not ( = ?auto_1063 ?auto_1062 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1063 ?auto_1062 ?auto_1061 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1075 - OBJ
      ?auto_1074 - LOCATION
    )
    :vars
    (
      ?auto_1079 - TRUCK
      ?auto_1077 - LOCATION
      ?auto_1078 - CITY
      ?auto_1076 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1079 ?auto_1077 ) ( IN-CITY ?auto_1077 ?auto_1078 ) ( IN-CITY ?auto_1074 ?auto_1078 ) ( not ( = ?auto_1074 ?auto_1077 ) ) ( OBJ-AT ?auto_1076 ?auto_1074 ) ( not ( = ?auto_1076 ?auto_1075 ) ) ( OBJ-AT ?auto_1075 ?auto_1077 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1075 ?auto_1079 ?auto_1077 )
      ( DELIVER-2PKG ?auto_1076 ?auto_1075 ?auto_1074 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1081 - OBJ
      ?auto_1082 - OBJ
      ?auto_1080 - LOCATION
    )
    :vars
    (
      ?auto_1083 - TRUCK
      ?auto_1085 - LOCATION
      ?auto_1084 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1083 ?auto_1085 ) ( IN-CITY ?auto_1085 ?auto_1084 ) ( IN-CITY ?auto_1080 ?auto_1084 ) ( not ( = ?auto_1080 ?auto_1085 ) ) ( OBJ-AT ?auto_1081 ?auto_1080 ) ( not ( = ?auto_1081 ?auto_1082 ) ) ( OBJ-AT ?auto_1082 ?auto_1085 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1082 ?auto_1080 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1087 - OBJ
      ?auto_1088 - OBJ
      ?auto_1086 - LOCATION
    )
    :vars
    (
      ?auto_1091 - TRUCK
      ?auto_1090 - LOCATION
      ?auto_1089 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1091 ?auto_1090 ) ( IN-CITY ?auto_1090 ?auto_1089 ) ( IN-CITY ?auto_1086 ?auto_1089 ) ( not ( = ?auto_1086 ?auto_1090 ) ) ( OBJ-AT ?auto_1088 ?auto_1086 ) ( not ( = ?auto_1088 ?auto_1087 ) ) ( OBJ-AT ?auto_1087 ?auto_1090 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1088 ?auto_1087 ?auto_1086 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1100 - OBJ
      ?auto_1099 - LOCATION
    )
    :vars
    (
      ?auto_1102 - LOCATION
      ?auto_1101 - CITY
      ?auto_1104 - OBJ
      ?auto_1103 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1102 ?auto_1101 ) ( IN-CITY ?auto_1099 ?auto_1101 ) ( not ( = ?auto_1099 ?auto_1102 ) ) ( OBJ-AT ?auto_1104 ?auto_1099 ) ( not ( = ?auto_1104 ?auto_1100 ) ) ( OBJ-AT ?auto_1100 ?auto_1102 ) ( TRUCK-AT ?auto_1103 ?auto_1099 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1103 ?auto_1099 ?auto_1102 ?auto_1101 )
      ( DELIVER-2PKG ?auto_1104 ?auto_1100 ?auto_1099 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1106 - OBJ
      ?auto_1107 - OBJ
      ?auto_1105 - LOCATION
    )
    :vars
    (
      ?auto_1108 - LOCATION
      ?auto_1110 - CITY
      ?auto_1109 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1108 ?auto_1110 ) ( IN-CITY ?auto_1105 ?auto_1110 ) ( not ( = ?auto_1105 ?auto_1108 ) ) ( OBJ-AT ?auto_1106 ?auto_1105 ) ( not ( = ?auto_1106 ?auto_1107 ) ) ( OBJ-AT ?auto_1107 ?auto_1108 ) ( TRUCK-AT ?auto_1109 ?auto_1105 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1107 ?auto_1105 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1112 - OBJ
      ?auto_1113 - OBJ
      ?auto_1111 - LOCATION
    )
    :vars
    (
      ?auto_1116 - LOCATION
      ?auto_1115 - CITY
      ?auto_1114 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1116 ?auto_1115 ) ( IN-CITY ?auto_1111 ?auto_1115 ) ( not ( = ?auto_1111 ?auto_1116 ) ) ( OBJ-AT ?auto_1113 ?auto_1111 ) ( not ( = ?auto_1113 ?auto_1112 ) ) ( OBJ-AT ?auto_1112 ?auto_1116 ) ( TRUCK-AT ?auto_1114 ?auto_1111 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1113 ?auto_1112 ?auto_1111 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1125 - OBJ
      ?auto_1124 - LOCATION
    )
    :vars
    (
      ?auto_1128 - LOCATION
      ?auto_1127 - CITY
      ?auto_1129 - OBJ
      ?auto_1126 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1128 ?auto_1127 ) ( IN-CITY ?auto_1124 ?auto_1127 ) ( not ( = ?auto_1124 ?auto_1128 ) ) ( not ( = ?auto_1129 ?auto_1125 ) ) ( OBJ-AT ?auto_1125 ?auto_1128 ) ( TRUCK-AT ?auto_1126 ?auto_1124 ) ( IN-TRUCK ?auto_1129 ?auto_1126 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1129 ?auto_1124 )
      ( DELIVER-2PKG ?auto_1129 ?auto_1125 ?auto_1124 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1131 - OBJ
      ?auto_1132 - OBJ
      ?auto_1130 - LOCATION
    )
    :vars
    (
      ?auto_1135 - LOCATION
      ?auto_1134 - CITY
      ?auto_1133 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1135 ?auto_1134 ) ( IN-CITY ?auto_1130 ?auto_1134 ) ( not ( = ?auto_1130 ?auto_1135 ) ) ( not ( = ?auto_1131 ?auto_1132 ) ) ( OBJ-AT ?auto_1132 ?auto_1135 ) ( TRUCK-AT ?auto_1133 ?auto_1130 ) ( IN-TRUCK ?auto_1131 ?auto_1133 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1132 ?auto_1130 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1137 - OBJ
      ?auto_1138 - OBJ
      ?auto_1136 - LOCATION
    )
    :vars
    (
      ?auto_1139 - LOCATION
      ?auto_1141 - CITY
      ?auto_1140 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1139 ?auto_1141 ) ( IN-CITY ?auto_1136 ?auto_1141 ) ( not ( = ?auto_1136 ?auto_1139 ) ) ( not ( = ?auto_1138 ?auto_1137 ) ) ( OBJ-AT ?auto_1137 ?auto_1139 ) ( TRUCK-AT ?auto_1140 ?auto_1136 ) ( IN-TRUCK ?auto_1138 ?auto_1140 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1138 ?auto_1137 ?auto_1136 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1150 - OBJ
      ?auto_1149 - LOCATION
    )
    :vars
    (
      ?auto_1151 - LOCATION
      ?auto_1153 - CITY
      ?auto_1154 - OBJ
      ?auto_1152 - TRUCK
      ?auto_1155 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1151 ?auto_1153 ) ( IN-CITY ?auto_1149 ?auto_1153 ) ( not ( = ?auto_1149 ?auto_1151 ) ) ( not ( = ?auto_1154 ?auto_1150 ) ) ( OBJ-AT ?auto_1150 ?auto_1151 ) ( IN-TRUCK ?auto_1154 ?auto_1152 ) ( TRUCK-AT ?auto_1152 ?auto_1155 ) ( IN-CITY ?auto_1155 ?auto_1153 ) ( not ( = ?auto_1149 ?auto_1155 ) ) ( not ( = ?auto_1151 ?auto_1155 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1152 ?auto_1155 ?auto_1149 ?auto_1153 )
      ( DELIVER-2PKG ?auto_1154 ?auto_1150 ?auto_1149 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1157 - OBJ
      ?auto_1158 - OBJ
      ?auto_1156 - LOCATION
    )
    :vars
    (
      ?auto_1159 - LOCATION
      ?auto_1162 - CITY
      ?auto_1161 - TRUCK
      ?auto_1160 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1159 ?auto_1162 ) ( IN-CITY ?auto_1156 ?auto_1162 ) ( not ( = ?auto_1156 ?auto_1159 ) ) ( not ( = ?auto_1157 ?auto_1158 ) ) ( OBJ-AT ?auto_1158 ?auto_1159 ) ( IN-TRUCK ?auto_1157 ?auto_1161 ) ( TRUCK-AT ?auto_1161 ?auto_1160 ) ( IN-CITY ?auto_1160 ?auto_1162 ) ( not ( = ?auto_1156 ?auto_1160 ) ) ( not ( = ?auto_1159 ?auto_1160 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1158 ?auto_1156 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1164 - OBJ
      ?auto_1165 - OBJ
      ?auto_1163 - LOCATION
    )
    :vars
    (
      ?auto_1168 - LOCATION
      ?auto_1169 - CITY
      ?auto_1167 - TRUCK
      ?auto_1166 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1168 ?auto_1169 ) ( IN-CITY ?auto_1163 ?auto_1169 ) ( not ( = ?auto_1163 ?auto_1168 ) ) ( not ( = ?auto_1165 ?auto_1164 ) ) ( OBJ-AT ?auto_1164 ?auto_1168 ) ( IN-TRUCK ?auto_1165 ?auto_1167 ) ( TRUCK-AT ?auto_1167 ?auto_1166 ) ( IN-CITY ?auto_1166 ?auto_1169 ) ( not ( = ?auto_1163 ?auto_1166 ) ) ( not ( = ?auto_1168 ?auto_1166 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1165 ?auto_1164 ?auto_1163 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1179 - OBJ
      ?auto_1178 - LOCATION
    )
    :vars
    (
      ?auto_1182 - LOCATION
      ?auto_1184 - CITY
      ?auto_1183 - OBJ
      ?auto_1181 - TRUCK
      ?auto_1180 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1182 ?auto_1184 ) ( IN-CITY ?auto_1178 ?auto_1184 ) ( not ( = ?auto_1178 ?auto_1182 ) ) ( not ( = ?auto_1183 ?auto_1179 ) ) ( OBJ-AT ?auto_1179 ?auto_1182 ) ( TRUCK-AT ?auto_1181 ?auto_1180 ) ( IN-CITY ?auto_1180 ?auto_1184 ) ( not ( = ?auto_1178 ?auto_1180 ) ) ( not ( = ?auto_1182 ?auto_1180 ) ) ( OBJ-AT ?auto_1183 ?auto_1180 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1183 ?auto_1181 ?auto_1180 )
      ( DELIVER-2PKG ?auto_1183 ?auto_1179 ?auto_1178 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1186 - OBJ
      ?auto_1187 - OBJ
      ?auto_1185 - LOCATION
    )
    :vars
    (
      ?auto_1190 - LOCATION
      ?auto_1191 - CITY
      ?auto_1189 - TRUCK
      ?auto_1188 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1190 ?auto_1191 ) ( IN-CITY ?auto_1185 ?auto_1191 ) ( not ( = ?auto_1185 ?auto_1190 ) ) ( not ( = ?auto_1186 ?auto_1187 ) ) ( OBJ-AT ?auto_1187 ?auto_1190 ) ( TRUCK-AT ?auto_1189 ?auto_1188 ) ( IN-CITY ?auto_1188 ?auto_1191 ) ( not ( = ?auto_1185 ?auto_1188 ) ) ( not ( = ?auto_1190 ?auto_1188 ) ) ( OBJ-AT ?auto_1186 ?auto_1188 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1187 ?auto_1185 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1193 - OBJ
      ?auto_1194 - OBJ
      ?auto_1192 - LOCATION
    )
    :vars
    (
      ?auto_1196 - LOCATION
      ?auto_1198 - CITY
      ?auto_1195 - TRUCK
      ?auto_1197 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1196 ?auto_1198 ) ( IN-CITY ?auto_1192 ?auto_1198 ) ( not ( = ?auto_1192 ?auto_1196 ) ) ( not ( = ?auto_1194 ?auto_1193 ) ) ( OBJ-AT ?auto_1193 ?auto_1196 ) ( TRUCK-AT ?auto_1195 ?auto_1197 ) ( IN-CITY ?auto_1197 ?auto_1198 ) ( not ( = ?auto_1192 ?auto_1197 ) ) ( not ( = ?auto_1196 ?auto_1197 ) ) ( OBJ-AT ?auto_1194 ?auto_1197 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1194 ?auto_1193 ?auto_1192 ) )
  )

)

