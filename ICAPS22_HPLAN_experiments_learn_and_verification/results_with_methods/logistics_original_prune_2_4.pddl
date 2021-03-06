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
      ?auto_972 - OBJ
      ?auto_971 - LOCATION
    )
    :vars
    (
      ?auto_973 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_973 ?auto_971 ) ( IN-TRUCK ?auto_972 ?auto_973 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_972 ?auto_973 ?auto_971 )
      ( DELIVER-1PKG-VERIFY ?auto_972 ?auto_971 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_979 - OBJ
      ?auto_978 - LOCATION
    )
    :vars
    (
      ?auto_980 - TRUCK
      ?auto_981 - LOCATION
      ?auto_982 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_979 ?auto_980 ) ( TRUCK-AT ?auto_980 ?auto_981 ) ( IN-CITY ?auto_981 ?auto_982 ) ( IN-CITY ?auto_978 ?auto_982 ) ( not ( = ?auto_978 ?auto_981 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_980 ?auto_981 ?auto_978 ?auto_982 )
      ( DELIVER-1PKG ?auto_979 ?auto_978 )
      ( DELIVER-1PKG-VERIFY ?auto_979 ?auto_978 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_990 - OBJ
      ?auto_989 - LOCATION
    )
    :vars
    (
      ?auto_992 - TRUCK
      ?auto_993 - LOCATION
      ?auto_991 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_992 ?auto_993 ) ( IN-CITY ?auto_993 ?auto_991 ) ( IN-CITY ?auto_989 ?auto_991 ) ( not ( = ?auto_989 ?auto_993 ) ) ( OBJ-AT ?auto_990 ?auto_993 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_990 ?auto_992 ?auto_993 )
      ( DELIVER-1PKG ?auto_990 ?auto_989 )
      ( DELIVER-1PKG-VERIFY ?auto_990 ?auto_989 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1001 - OBJ
      ?auto_1000 - LOCATION
    )
    :vars
    (
      ?auto_1004 - LOCATION
      ?auto_1003 - CITY
      ?auto_1002 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1004 ?auto_1003 ) ( IN-CITY ?auto_1000 ?auto_1003 ) ( not ( = ?auto_1000 ?auto_1004 ) ) ( OBJ-AT ?auto_1001 ?auto_1004 ) ( TRUCK-AT ?auto_1002 ?auto_1000 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1002 ?auto_1000 ?auto_1004 ?auto_1003 )
      ( DELIVER-1PKG ?auto_1001 ?auto_1000 )
      ( DELIVER-1PKG-VERIFY ?auto_1001 ?auto_1000 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1026 - OBJ
      ?auto_1027 - OBJ
      ?auto_1025 - LOCATION
    )
    :vars
    (
      ?auto_1028 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1028 ?auto_1025 ) ( IN-TRUCK ?auto_1027 ?auto_1028 ) ( OBJ-AT ?auto_1026 ?auto_1025 ) ( not ( = ?auto_1026 ?auto_1027 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1027 ?auto_1025 )
      ( DELIVER-2PKG-VERIFY ?auto_1026 ?auto_1027 ?auto_1025 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1030 - OBJ
      ?auto_1031 - OBJ
      ?auto_1029 - LOCATION
    )
    :vars
    (
      ?auto_1032 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1032 ?auto_1029 ) ( IN-TRUCK ?auto_1030 ?auto_1032 ) ( OBJ-AT ?auto_1031 ?auto_1029 ) ( not ( = ?auto_1030 ?auto_1031 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1030 ?auto_1029 )
      ( DELIVER-2PKG-VERIFY ?auto_1030 ?auto_1031 ?auto_1029 ) )
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
      ?auto_1046 - TRUCK
      ?auto_1047 - LOCATION
      ?auto_1045 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1044 ?auto_1046 ) ( TRUCK-AT ?auto_1046 ?auto_1047 ) ( IN-CITY ?auto_1047 ?auto_1045 ) ( IN-CITY ?auto_1042 ?auto_1045 ) ( not ( = ?auto_1042 ?auto_1047 ) ) ( OBJ-AT ?auto_1043 ?auto_1042 ) ( not ( = ?auto_1043 ?auto_1044 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1044 ?auto_1042 )
      ( DELIVER-2PKG-VERIFY ?auto_1043 ?auto_1044 ?auto_1042 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1049 - OBJ
      ?auto_1050 - OBJ
      ?auto_1048 - LOCATION
    )
    :vars
    (
      ?auto_1052 - TRUCK
      ?auto_1051 - LOCATION
      ?auto_1053 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1049 ?auto_1052 ) ( TRUCK-AT ?auto_1052 ?auto_1051 ) ( IN-CITY ?auto_1051 ?auto_1053 ) ( IN-CITY ?auto_1048 ?auto_1053 ) ( not ( = ?auto_1048 ?auto_1051 ) ) ( OBJ-AT ?auto_1050 ?auto_1048 ) ( not ( = ?auto_1050 ?auto_1049 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1050 ?auto_1049 ?auto_1048 )
      ( DELIVER-2PKG-VERIFY ?auto_1049 ?auto_1050 ?auto_1048 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1062 - OBJ
      ?auto_1061 - LOCATION
    )
    :vars
    (
      ?auto_1064 - TRUCK
      ?auto_1063 - LOCATION
      ?auto_1065 - CITY
      ?auto_1066 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1064 ?auto_1063 ) ( IN-CITY ?auto_1063 ?auto_1065 ) ( IN-CITY ?auto_1061 ?auto_1065 ) ( not ( = ?auto_1061 ?auto_1063 ) ) ( OBJ-AT ?auto_1066 ?auto_1061 ) ( not ( = ?auto_1066 ?auto_1062 ) ) ( OBJ-AT ?auto_1062 ?auto_1063 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1062 ?auto_1064 ?auto_1063 )
      ( DELIVER-2PKG ?auto_1066 ?auto_1062 ?auto_1061 )
      ( DELIVER-1PKG-VERIFY ?auto_1062 ?auto_1061 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1068 - OBJ
      ?auto_1069 - OBJ
      ?auto_1067 - LOCATION
    )
    :vars
    (
      ?auto_1071 - TRUCK
      ?auto_1072 - LOCATION
      ?auto_1070 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1071 ?auto_1072 ) ( IN-CITY ?auto_1072 ?auto_1070 ) ( IN-CITY ?auto_1067 ?auto_1070 ) ( not ( = ?auto_1067 ?auto_1072 ) ) ( OBJ-AT ?auto_1068 ?auto_1067 ) ( not ( = ?auto_1068 ?auto_1069 ) ) ( OBJ-AT ?auto_1069 ?auto_1072 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1069 ?auto_1067 )
      ( DELIVER-2PKG-VERIFY ?auto_1068 ?auto_1069 ?auto_1067 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1074 - OBJ
      ?auto_1075 - OBJ
      ?auto_1073 - LOCATION
    )
    :vars
    (
      ?auto_1078 - TRUCK
      ?auto_1077 - LOCATION
      ?auto_1076 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1078 ?auto_1077 ) ( IN-CITY ?auto_1077 ?auto_1076 ) ( IN-CITY ?auto_1073 ?auto_1076 ) ( not ( = ?auto_1073 ?auto_1077 ) ) ( OBJ-AT ?auto_1075 ?auto_1073 ) ( not ( = ?auto_1075 ?auto_1074 ) ) ( OBJ-AT ?auto_1074 ?auto_1077 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1075 ?auto_1074 ?auto_1073 )
      ( DELIVER-2PKG-VERIFY ?auto_1074 ?auto_1075 ?auto_1073 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1087 - OBJ
      ?auto_1086 - LOCATION
    )
    :vars
    (
      ?auto_1090 - LOCATION
      ?auto_1088 - CITY
      ?auto_1089 - OBJ
      ?auto_1091 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1090 ?auto_1088 ) ( IN-CITY ?auto_1086 ?auto_1088 ) ( not ( = ?auto_1086 ?auto_1090 ) ) ( OBJ-AT ?auto_1089 ?auto_1086 ) ( not ( = ?auto_1089 ?auto_1087 ) ) ( OBJ-AT ?auto_1087 ?auto_1090 ) ( TRUCK-AT ?auto_1091 ?auto_1086 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1091 ?auto_1086 ?auto_1090 ?auto_1088 )
      ( DELIVER-2PKG ?auto_1089 ?auto_1087 ?auto_1086 )
      ( DELIVER-1PKG-VERIFY ?auto_1087 ?auto_1086 ) )
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
      ?auto_1096 - LOCATION
      ?auto_1095 - CITY
      ?auto_1097 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1096 ?auto_1095 ) ( IN-CITY ?auto_1092 ?auto_1095 ) ( not ( = ?auto_1092 ?auto_1096 ) ) ( OBJ-AT ?auto_1093 ?auto_1092 ) ( not ( = ?auto_1093 ?auto_1094 ) ) ( OBJ-AT ?auto_1094 ?auto_1096 ) ( TRUCK-AT ?auto_1097 ?auto_1092 ) )
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
      ?auto_1101 - LOCATION
      ?auto_1103 - CITY
      ?auto_1102 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1101 ?auto_1103 ) ( IN-CITY ?auto_1098 ?auto_1103 ) ( not ( = ?auto_1098 ?auto_1101 ) ) ( OBJ-AT ?auto_1100 ?auto_1098 ) ( not ( = ?auto_1100 ?auto_1099 ) ) ( OBJ-AT ?auto_1099 ?auto_1101 ) ( TRUCK-AT ?auto_1102 ?auto_1098 ) )
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
      ?auto_1113 - LOCATION
      ?auto_1115 - CITY
      ?auto_1116 - OBJ
      ?auto_1114 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1113 ?auto_1115 ) ( IN-CITY ?auto_1111 ?auto_1115 ) ( not ( = ?auto_1111 ?auto_1113 ) ) ( not ( = ?auto_1116 ?auto_1112 ) ) ( OBJ-AT ?auto_1112 ?auto_1113 ) ( TRUCK-AT ?auto_1114 ?auto_1111 ) ( IN-TRUCK ?auto_1116 ?auto_1114 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1116 ?auto_1111 )
      ( DELIVER-2PKG ?auto_1116 ?auto_1112 ?auto_1111 )
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
      ?auto_1122 - LOCATION
      ?auto_1121 - CITY
      ?auto_1120 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1122 ?auto_1121 ) ( IN-CITY ?auto_1117 ?auto_1121 ) ( not ( = ?auto_1117 ?auto_1122 ) ) ( not ( = ?auto_1118 ?auto_1119 ) ) ( OBJ-AT ?auto_1119 ?auto_1122 ) ( TRUCK-AT ?auto_1120 ?auto_1117 ) ( IN-TRUCK ?auto_1118 ?auto_1120 ) )
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
      ?auto_1126 - LOCATION
      ?auto_1128 - CITY
      ?auto_1127 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1126 ?auto_1128 ) ( IN-CITY ?auto_1123 ?auto_1128 ) ( not ( = ?auto_1123 ?auto_1126 ) ) ( not ( = ?auto_1125 ?auto_1124 ) ) ( OBJ-AT ?auto_1124 ?auto_1126 ) ( TRUCK-AT ?auto_1127 ?auto_1123 ) ( IN-TRUCK ?auto_1125 ?auto_1127 ) )
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
      ?auto_1138 - LOCATION
      ?auto_1140 - CITY
      ?auto_1141 - OBJ
      ?auto_1139 - TRUCK
      ?auto_1142 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1138 ?auto_1140 ) ( IN-CITY ?auto_1136 ?auto_1140 ) ( not ( = ?auto_1136 ?auto_1138 ) ) ( not ( = ?auto_1141 ?auto_1137 ) ) ( OBJ-AT ?auto_1137 ?auto_1138 ) ( IN-TRUCK ?auto_1141 ?auto_1139 ) ( TRUCK-AT ?auto_1139 ?auto_1142 ) ( IN-CITY ?auto_1142 ?auto_1140 ) ( not ( = ?auto_1136 ?auto_1142 ) ) ( not ( = ?auto_1138 ?auto_1142 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1139 ?auto_1142 ?auto_1136 ?auto_1140 )
      ( DELIVER-2PKG ?auto_1141 ?auto_1137 ?auto_1136 )
      ( DELIVER-1PKG-VERIFY ?auto_1137 ?auto_1136 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1144 - OBJ
      ?auto_1145 - OBJ
      ?auto_1143 - LOCATION
    )
    :vars
    (
      ?auto_1147 - LOCATION
      ?auto_1146 - CITY
      ?auto_1148 - TRUCK
      ?auto_1149 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1147 ?auto_1146 ) ( IN-CITY ?auto_1143 ?auto_1146 ) ( not ( = ?auto_1143 ?auto_1147 ) ) ( not ( = ?auto_1144 ?auto_1145 ) ) ( OBJ-AT ?auto_1145 ?auto_1147 ) ( IN-TRUCK ?auto_1144 ?auto_1148 ) ( TRUCK-AT ?auto_1148 ?auto_1149 ) ( IN-CITY ?auto_1149 ?auto_1146 ) ( not ( = ?auto_1143 ?auto_1149 ) ) ( not ( = ?auto_1147 ?auto_1149 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1145 ?auto_1143 )
      ( DELIVER-2PKG-VERIFY ?auto_1144 ?auto_1145 ?auto_1143 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1151 - OBJ
      ?auto_1152 - OBJ
      ?auto_1150 - LOCATION
    )
    :vars
    (
      ?auto_1153 - LOCATION
      ?auto_1155 - CITY
      ?auto_1154 - TRUCK
      ?auto_1156 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1153 ?auto_1155 ) ( IN-CITY ?auto_1150 ?auto_1155 ) ( not ( = ?auto_1150 ?auto_1153 ) ) ( not ( = ?auto_1152 ?auto_1151 ) ) ( OBJ-AT ?auto_1151 ?auto_1153 ) ( IN-TRUCK ?auto_1152 ?auto_1154 ) ( TRUCK-AT ?auto_1154 ?auto_1156 ) ( IN-CITY ?auto_1156 ?auto_1155 ) ( not ( = ?auto_1150 ?auto_1156 ) ) ( not ( = ?auto_1153 ?auto_1156 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1152 ?auto_1151 ?auto_1150 )
      ( DELIVER-2PKG-VERIFY ?auto_1151 ?auto_1152 ?auto_1150 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1166 - OBJ
      ?auto_1165 - LOCATION
    )
    :vars
    (
      ?auto_1167 - LOCATION
      ?auto_1169 - CITY
      ?auto_1170 - OBJ
      ?auto_1168 - TRUCK
      ?auto_1171 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1167 ?auto_1169 ) ( IN-CITY ?auto_1165 ?auto_1169 ) ( not ( = ?auto_1165 ?auto_1167 ) ) ( not ( = ?auto_1170 ?auto_1166 ) ) ( OBJ-AT ?auto_1166 ?auto_1167 ) ( TRUCK-AT ?auto_1168 ?auto_1171 ) ( IN-CITY ?auto_1171 ?auto_1169 ) ( not ( = ?auto_1165 ?auto_1171 ) ) ( not ( = ?auto_1167 ?auto_1171 ) ) ( OBJ-AT ?auto_1170 ?auto_1171 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1170 ?auto_1168 ?auto_1171 )
      ( DELIVER-2PKG ?auto_1170 ?auto_1166 ?auto_1165 )
      ( DELIVER-1PKG-VERIFY ?auto_1166 ?auto_1165 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1173 - OBJ
      ?auto_1174 - OBJ
      ?auto_1172 - LOCATION
    )
    :vars
    (
      ?auto_1177 - LOCATION
      ?auto_1175 - CITY
      ?auto_1178 - TRUCK
      ?auto_1176 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1177 ?auto_1175 ) ( IN-CITY ?auto_1172 ?auto_1175 ) ( not ( = ?auto_1172 ?auto_1177 ) ) ( not ( = ?auto_1173 ?auto_1174 ) ) ( OBJ-AT ?auto_1174 ?auto_1177 ) ( TRUCK-AT ?auto_1178 ?auto_1176 ) ( IN-CITY ?auto_1176 ?auto_1175 ) ( not ( = ?auto_1172 ?auto_1176 ) ) ( not ( = ?auto_1177 ?auto_1176 ) ) ( OBJ-AT ?auto_1173 ?auto_1176 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1174 ?auto_1172 )
      ( DELIVER-2PKG-VERIFY ?auto_1173 ?auto_1174 ?auto_1172 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1180 - OBJ
      ?auto_1181 - OBJ
      ?auto_1179 - LOCATION
    )
    :vars
    (
      ?auto_1183 - LOCATION
      ?auto_1185 - CITY
      ?auto_1184 - TRUCK
      ?auto_1182 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1183 ?auto_1185 ) ( IN-CITY ?auto_1179 ?auto_1185 ) ( not ( = ?auto_1179 ?auto_1183 ) ) ( not ( = ?auto_1181 ?auto_1180 ) ) ( OBJ-AT ?auto_1180 ?auto_1183 ) ( TRUCK-AT ?auto_1184 ?auto_1182 ) ( IN-CITY ?auto_1182 ?auto_1185 ) ( not ( = ?auto_1179 ?auto_1182 ) ) ( not ( = ?auto_1183 ?auto_1182 ) ) ( OBJ-AT ?auto_1181 ?auto_1182 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1181 ?auto_1180 ?auto_1179 )
      ( DELIVER-2PKG-VERIFY ?auto_1180 ?auto_1181 ?auto_1179 ) )
  )

)

