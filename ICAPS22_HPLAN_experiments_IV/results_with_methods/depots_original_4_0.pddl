( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1060 - SURFACE
      ?auto_1061 - SURFACE
    )
    :vars
    (
      ?auto_1062 - HOIST
      ?auto_1063 - PLACE
      ?auto_1064 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1062 ?auto_1063 ) ( AVAILABLE ?auto_1062 ) ( SURFACE-AT ?auto_1064 ?auto_1063 ) ( ON ?auto_1064 ?auto_1061 ) ( CLEAR ?auto_1064 ) ( IS-CRATE ?auto_1064 ) ( ON ?auto_1061 ?auto_1060 ) ( not ( = ?auto_1060 ?auto_1061 ) ) ( not ( = ?auto_1060 ?auto_1064 ) ) ( not ( = ?auto_1061 ?auto_1064 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1062 ?auto_1064 ?auto_1061 ?auto_1063 )
      ( MAKE-1CRATE-VERIFY ?auto_1060 ?auto_1061 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1082 - SURFACE
      ?auto_1083 - SURFACE
    )
    :vars
    (
      ?auto_1084 - HOIST
      ?auto_1085 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1084 ?auto_1085 ) ( SURFACE-AT ?auto_1082 ?auto_1085 ) ( CLEAR ?auto_1082 ) ( LIFTING ?auto_1084 ?auto_1083 ) ( IS-CRATE ?auto_1083 ) ( not ( = ?auto_1082 ?auto_1083 ) ) )
    :subtasks
    ( ( !DROP ?auto_1084 ?auto_1083 ?auto_1082 ?auto_1085 )
      ( MAKE-1CRATE-VERIFY ?auto_1082 ?auto_1083 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1086 - SURFACE
      ?auto_1087 - SURFACE
    )
    :vars
    (
      ?auto_1089 - HOIST
      ?auto_1088 - PLACE
      ?auto_1090 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1089 ?auto_1088 ) ( SURFACE-AT ?auto_1086 ?auto_1088 ) ( CLEAR ?auto_1086 ) ( IS-CRATE ?auto_1087 ) ( not ( = ?auto_1086 ?auto_1087 ) ) ( TRUCK-AT ?auto_1090 ?auto_1088 ) ( AVAILABLE ?auto_1089 ) ( IN ?auto_1087 ?auto_1090 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1089 ?auto_1087 ?auto_1090 ?auto_1088 )
      ( MAKE-1CRATE ?auto_1086 ?auto_1087 )
      ( MAKE-1CRATE-VERIFY ?auto_1086 ?auto_1087 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1091 - SURFACE
      ?auto_1092 - SURFACE
    )
    :vars
    (
      ?auto_1093 - HOIST
      ?auto_1094 - PLACE
      ?auto_1095 - TRUCK
      ?auto_1096 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1093 ?auto_1094 ) ( SURFACE-AT ?auto_1091 ?auto_1094 ) ( CLEAR ?auto_1091 ) ( IS-CRATE ?auto_1092 ) ( not ( = ?auto_1091 ?auto_1092 ) ) ( TRUCK-AT ?auto_1095 ?auto_1094 ) ( IN ?auto_1092 ?auto_1095 ) ( LIFTING ?auto_1093 ?auto_1096 ) ( IS-CRATE ?auto_1096 ) ( not ( = ?auto_1091 ?auto_1096 ) ) ( not ( = ?auto_1092 ?auto_1096 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1093 ?auto_1096 ?auto_1095 ?auto_1094 )
      ( MAKE-1CRATE ?auto_1091 ?auto_1092 )
      ( MAKE-1CRATE-VERIFY ?auto_1091 ?auto_1092 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1097 - SURFACE
      ?auto_1098 - SURFACE
    )
    :vars
    (
      ?auto_1100 - HOIST
      ?auto_1102 - PLACE
      ?auto_1101 - TRUCK
      ?auto_1099 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1100 ?auto_1102 ) ( SURFACE-AT ?auto_1097 ?auto_1102 ) ( IS-CRATE ?auto_1098 ) ( not ( = ?auto_1097 ?auto_1098 ) ) ( TRUCK-AT ?auto_1101 ?auto_1102 ) ( IN ?auto_1098 ?auto_1101 ) ( IS-CRATE ?auto_1099 ) ( not ( = ?auto_1097 ?auto_1099 ) ) ( not ( = ?auto_1098 ?auto_1099 ) ) ( AVAILABLE ?auto_1100 ) ( SURFACE-AT ?auto_1099 ?auto_1102 ) ( ON ?auto_1099 ?auto_1097 ) ( CLEAR ?auto_1099 ) )
    :subtasks
    ( ( !LIFT ?auto_1100 ?auto_1099 ?auto_1097 ?auto_1102 )
      ( MAKE-1CRATE ?auto_1097 ?auto_1098 )
      ( MAKE-1CRATE-VERIFY ?auto_1097 ?auto_1098 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1103 - SURFACE
      ?auto_1104 - SURFACE
    )
    :vars
    (
      ?auto_1107 - HOIST
      ?auto_1105 - PLACE
      ?auto_1108 - TRUCK
      ?auto_1106 - SURFACE
      ?auto_1109 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1107 ?auto_1105 ) ( SURFACE-AT ?auto_1103 ?auto_1105 ) ( IS-CRATE ?auto_1104 ) ( not ( = ?auto_1103 ?auto_1104 ) ) ( TRUCK-AT ?auto_1108 ?auto_1105 ) ( IN ?auto_1104 ?auto_1108 ) ( IS-CRATE ?auto_1106 ) ( not ( = ?auto_1103 ?auto_1106 ) ) ( not ( = ?auto_1104 ?auto_1106 ) ) ( SURFACE-AT ?auto_1106 ?auto_1105 ) ( ON ?auto_1106 ?auto_1103 ) ( CLEAR ?auto_1106 ) ( LIFTING ?auto_1107 ?auto_1109 ) ( IS-CRATE ?auto_1109 ) ( not ( = ?auto_1103 ?auto_1109 ) ) ( not ( = ?auto_1104 ?auto_1109 ) ) ( not ( = ?auto_1106 ?auto_1109 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1107 ?auto_1109 ?auto_1108 ?auto_1105 )
      ( MAKE-1CRATE ?auto_1103 ?auto_1104 )
      ( MAKE-1CRATE-VERIFY ?auto_1103 ?auto_1104 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1110 - SURFACE
      ?auto_1111 - SURFACE
    )
    :vars
    (
      ?auto_1115 - HOIST
      ?auto_1112 - PLACE
      ?auto_1116 - TRUCK
      ?auto_1114 - SURFACE
      ?auto_1113 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1115 ?auto_1112 ) ( SURFACE-AT ?auto_1110 ?auto_1112 ) ( IS-CRATE ?auto_1111 ) ( not ( = ?auto_1110 ?auto_1111 ) ) ( TRUCK-AT ?auto_1116 ?auto_1112 ) ( IN ?auto_1111 ?auto_1116 ) ( IS-CRATE ?auto_1114 ) ( not ( = ?auto_1110 ?auto_1114 ) ) ( not ( = ?auto_1111 ?auto_1114 ) ) ( SURFACE-AT ?auto_1114 ?auto_1112 ) ( ON ?auto_1114 ?auto_1110 ) ( IS-CRATE ?auto_1113 ) ( not ( = ?auto_1110 ?auto_1113 ) ) ( not ( = ?auto_1111 ?auto_1113 ) ) ( not ( = ?auto_1114 ?auto_1113 ) ) ( AVAILABLE ?auto_1115 ) ( SURFACE-AT ?auto_1113 ?auto_1112 ) ( ON ?auto_1113 ?auto_1114 ) ( CLEAR ?auto_1113 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1110 ?auto_1114 )
      ( MAKE-1CRATE ?auto_1110 ?auto_1111 )
      ( MAKE-1CRATE-VERIFY ?auto_1110 ?auto_1111 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1117 - SURFACE
      ?auto_1118 - SURFACE
    )
    :vars
    (
      ?auto_1122 - HOIST
      ?auto_1120 - PLACE
      ?auto_1119 - TRUCK
      ?auto_1121 - SURFACE
      ?auto_1123 - SURFACE
      ?auto_1124 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1122 ?auto_1120 ) ( SURFACE-AT ?auto_1117 ?auto_1120 ) ( IS-CRATE ?auto_1118 ) ( not ( = ?auto_1117 ?auto_1118 ) ) ( IN ?auto_1118 ?auto_1119 ) ( IS-CRATE ?auto_1121 ) ( not ( = ?auto_1117 ?auto_1121 ) ) ( not ( = ?auto_1118 ?auto_1121 ) ) ( SURFACE-AT ?auto_1121 ?auto_1120 ) ( ON ?auto_1121 ?auto_1117 ) ( IS-CRATE ?auto_1123 ) ( not ( = ?auto_1117 ?auto_1123 ) ) ( not ( = ?auto_1118 ?auto_1123 ) ) ( not ( = ?auto_1121 ?auto_1123 ) ) ( AVAILABLE ?auto_1122 ) ( SURFACE-AT ?auto_1123 ?auto_1120 ) ( ON ?auto_1123 ?auto_1121 ) ( CLEAR ?auto_1123 ) ( TRUCK-AT ?auto_1119 ?auto_1124 ) ( not ( = ?auto_1124 ?auto_1120 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1119 ?auto_1124 ?auto_1120 )
      ( MAKE-1CRATE ?auto_1117 ?auto_1118 )
      ( MAKE-1CRATE-VERIFY ?auto_1117 ?auto_1118 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1125 - SURFACE
      ?auto_1126 - SURFACE
    )
    :vars
    (
      ?auto_1132 - HOIST
      ?auto_1128 - PLACE
      ?auto_1130 - SURFACE
      ?auto_1129 - SURFACE
      ?auto_1131 - TRUCK
      ?auto_1127 - PLACE
      ?auto_1133 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1132 ?auto_1128 ) ( SURFACE-AT ?auto_1125 ?auto_1128 ) ( IS-CRATE ?auto_1126 ) ( not ( = ?auto_1125 ?auto_1126 ) ) ( IS-CRATE ?auto_1130 ) ( not ( = ?auto_1125 ?auto_1130 ) ) ( not ( = ?auto_1126 ?auto_1130 ) ) ( SURFACE-AT ?auto_1130 ?auto_1128 ) ( ON ?auto_1130 ?auto_1125 ) ( IS-CRATE ?auto_1129 ) ( not ( = ?auto_1125 ?auto_1129 ) ) ( not ( = ?auto_1126 ?auto_1129 ) ) ( not ( = ?auto_1130 ?auto_1129 ) ) ( AVAILABLE ?auto_1132 ) ( SURFACE-AT ?auto_1129 ?auto_1128 ) ( ON ?auto_1129 ?auto_1130 ) ( CLEAR ?auto_1129 ) ( TRUCK-AT ?auto_1131 ?auto_1127 ) ( not ( = ?auto_1127 ?auto_1128 ) ) ( HOIST-AT ?auto_1133 ?auto_1127 ) ( LIFTING ?auto_1133 ?auto_1126 ) ( not ( = ?auto_1132 ?auto_1133 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1133 ?auto_1126 ?auto_1131 ?auto_1127 )
      ( MAKE-1CRATE ?auto_1125 ?auto_1126 )
      ( MAKE-1CRATE-VERIFY ?auto_1125 ?auto_1126 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1134 - SURFACE
      ?auto_1135 - SURFACE
    )
    :vars
    (
      ?auto_1138 - HOIST
      ?auto_1139 - PLACE
      ?auto_1142 - SURFACE
      ?auto_1136 - SURFACE
      ?auto_1141 - TRUCK
      ?auto_1140 - PLACE
      ?auto_1137 - HOIST
      ?auto_1143 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1138 ?auto_1139 ) ( SURFACE-AT ?auto_1134 ?auto_1139 ) ( IS-CRATE ?auto_1135 ) ( not ( = ?auto_1134 ?auto_1135 ) ) ( IS-CRATE ?auto_1142 ) ( not ( = ?auto_1134 ?auto_1142 ) ) ( not ( = ?auto_1135 ?auto_1142 ) ) ( SURFACE-AT ?auto_1142 ?auto_1139 ) ( ON ?auto_1142 ?auto_1134 ) ( IS-CRATE ?auto_1136 ) ( not ( = ?auto_1134 ?auto_1136 ) ) ( not ( = ?auto_1135 ?auto_1136 ) ) ( not ( = ?auto_1142 ?auto_1136 ) ) ( AVAILABLE ?auto_1138 ) ( SURFACE-AT ?auto_1136 ?auto_1139 ) ( ON ?auto_1136 ?auto_1142 ) ( CLEAR ?auto_1136 ) ( TRUCK-AT ?auto_1141 ?auto_1140 ) ( not ( = ?auto_1140 ?auto_1139 ) ) ( HOIST-AT ?auto_1137 ?auto_1140 ) ( not ( = ?auto_1138 ?auto_1137 ) ) ( AVAILABLE ?auto_1137 ) ( SURFACE-AT ?auto_1135 ?auto_1140 ) ( ON ?auto_1135 ?auto_1143 ) ( CLEAR ?auto_1135 ) ( not ( = ?auto_1134 ?auto_1143 ) ) ( not ( = ?auto_1135 ?auto_1143 ) ) ( not ( = ?auto_1142 ?auto_1143 ) ) ( not ( = ?auto_1136 ?auto_1143 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1137 ?auto_1135 ?auto_1143 ?auto_1140 )
      ( MAKE-1CRATE ?auto_1134 ?auto_1135 )
      ( MAKE-1CRATE-VERIFY ?auto_1134 ?auto_1135 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1146 - SURFACE
      ?auto_1147 - SURFACE
    )
    :vars
    (
      ?auto_1148 - HOIST
      ?auto_1149 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1148 ?auto_1149 ) ( SURFACE-AT ?auto_1146 ?auto_1149 ) ( CLEAR ?auto_1146 ) ( LIFTING ?auto_1148 ?auto_1147 ) ( IS-CRATE ?auto_1147 ) ( not ( = ?auto_1146 ?auto_1147 ) ) )
    :subtasks
    ( ( !DROP ?auto_1148 ?auto_1147 ?auto_1146 ?auto_1149 )
      ( MAKE-1CRATE-VERIFY ?auto_1146 ?auto_1147 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1150 - SURFACE
      ?auto_1151 - SURFACE
    )
    :vars
    (
      ?auto_1152 - HOIST
      ?auto_1153 - PLACE
      ?auto_1154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1152 ?auto_1153 ) ( SURFACE-AT ?auto_1150 ?auto_1153 ) ( CLEAR ?auto_1150 ) ( IS-CRATE ?auto_1151 ) ( not ( = ?auto_1150 ?auto_1151 ) ) ( TRUCK-AT ?auto_1154 ?auto_1153 ) ( AVAILABLE ?auto_1152 ) ( IN ?auto_1151 ?auto_1154 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1152 ?auto_1151 ?auto_1154 ?auto_1153 )
      ( MAKE-1CRATE ?auto_1150 ?auto_1151 )
      ( MAKE-1CRATE-VERIFY ?auto_1150 ?auto_1151 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1155 - SURFACE
      ?auto_1156 - SURFACE
    )
    :vars
    (
      ?auto_1157 - HOIST
      ?auto_1158 - PLACE
      ?auto_1159 - TRUCK
      ?auto_1160 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1157 ?auto_1158 ) ( SURFACE-AT ?auto_1155 ?auto_1158 ) ( CLEAR ?auto_1155 ) ( IS-CRATE ?auto_1156 ) ( not ( = ?auto_1155 ?auto_1156 ) ) ( AVAILABLE ?auto_1157 ) ( IN ?auto_1156 ?auto_1159 ) ( TRUCK-AT ?auto_1159 ?auto_1160 ) ( not ( = ?auto_1160 ?auto_1158 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1159 ?auto_1160 ?auto_1158 )
      ( MAKE-1CRATE ?auto_1155 ?auto_1156 )
      ( MAKE-1CRATE-VERIFY ?auto_1155 ?auto_1156 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1185 - SURFACE
      ?auto_1186 - SURFACE
    )
    :vars
    (
      ?auto_1188 - HOIST
      ?auto_1189 - PLACE
      ?auto_1187 - TRUCK
      ?auto_1190 - PLACE
      ?auto_1191 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1188 ?auto_1189 ) ( SURFACE-AT ?auto_1185 ?auto_1189 ) ( CLEAR ?auto_1185 ) ( IS-CRATE ?auto_1186 ) ( not ( = ?auto_1185 ?auto_1186 ) ) ( AVAILABLE ?auto_1188 ) ( TRUCK-AT ?auto_1187 ?auto_1190 ) ( not ( = ?auto_1190 ?auto_1189 ) ) ( HOIST-AT ?auto_1191 ?auto_1190 ) ( LIFTING ?auto_1191 ?auto_1186 ) ( not ( = ?auto_1188 ?auto_1191 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1191 ?auto_1186 ?auto_1187 ?auto_1190 )
      ( MAKE-1CRATE ?auto_1185 ?auto_1186 )
      ( MAKE-1CRATE-VERIFY ?auto_1185 ?auto_1186 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1192 - SURFACE
      ?auto_1193 - SURFACE
    )
    :vars
    (
      ?auto_1197 - HOIST
      ?auto_1198 - PLACE
      ?auto_1194 - TRUCK
      ?auto_1195 - PLACE
      ?auto_1196 - HOIST
      ?auto_1199 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1197 ?auto_1198 ) ( SURFACE-AT ?auto_1192 ?auto_1198 ) ( CLEAR ?auto_1192 ) ( IS-CRATE ?auto_1193 ) ( not ( = ?auto_1192 ?auto_1193 ) ) ( AVAILABLE ?auto_1197 ) ( TRUCK-AT ?auto_1194 ?auto_1195 ) ( not ( = ?auto_1195 ?auto_1198 ) ) ( HOIST-AT ?auto_1196 ?auto_1195 ) ( not ( = ?auto_1197 ?auto_1196 ) ) ( AVAILABLE ?auto_1196 ) ( SURFACE-AT ?auto_1193 ?auto_1195 ) ( ON ?auto_1193 ?auto_1199 ) ( CLEAR ?auto_1193 ) ( not ( = ?auto_1192 ?auto_1199 ) ) ( not ( = ?auto_1193 ?auto_1199 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1196 ?auto_1193 ?auto_1199 ?auto_1195 )
      ( MAKE-1CRATE ?auto_1192 ?auto_1193 )
      ( MAKE-1CRATE-VERIFY ?auto_1192 ?auto_1193 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1200 - SURFACE
      ?auto_1201 - SURFACE
    )
    :vars
    (
      ?auto_1204 - HOIST
      ?auto_1203 - PLACE
      ?auto_1206 - PLACE
      ?auto_1205 - HOIST
      ?auto_1202 - SURFACE
      ?auto_1207 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1204 ?auto_1203 ) ( SURFACE-AT ?auto_1200 ?auto_1203 ) ( CLEAR ?auto_1200 ) ( IS-CRATE ?auto_1201 ) ( not ( = ?auto_1200 ?auto_1201 ) ) ( AVAILABLE ?auto_1204 ) ( not ( = ?auto_1206 ?auto_1203 ) ) ( HOIST-AT ?auto_1205 ?auto_1206 ) ( not ( = ?auto_1204 ?auto_1205 ) ) ( AVAILABLE ?auto_1205 ) ( SURFACE-AT ?auto_1201 ?auto_1206 ) ( ON ?auto_1201 ?auto_1202 ) ( CLEAR ?auto_1201 ) ( not ( = ?auto_1200 ?auto_1202 ) ) ( not ( = ?auto_1201 ?auto_1202 ) ) ( TRUCK-AT ?auto_1207 ?auto_1203 ) )
    :subtasks
    ( ( !DRIVE ?auto_1207 ?auto_1203 ?auto_1206 )
      ( MAKE-1CRATE ?auto_1200 ?auto_1201 )
      ( MAKE-1CRATE-VERIFY ?auto_1200 ?auto_1201 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1208 - SURFACE
      ?auto_1209 - SURFACE
    )
    :vars
    (
      ?auto_1210 - HOIST
      ?auto_1214 - PLACE
      ?auto_1212 - PLACE
      ?auto_1215 - HOIST
      ?auto_1213 - SURFACE
      ?auto_1211 - TRUCK
      ?auto_1216 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1210 ?auto_1214 ) ( SURFACE-AT ?auto_1208 ?auto_1214 ) ( CLEAR ?auto_1208 ) ( IS-CRATE ?auto_1209 ) ( not ( = ?auto_1208 ?auto_1209 ) ) ( not ( = ?auto_1212 ?auto_1214 ) ) ( HOIST-AT ?auto_1215 ?auto_1212 ) ( not ( = ?auto_1210 ?auto_1215 ) ) ( AVAILABLE ?auto_1215 ) ( SURFACE-AT ?auto_1209 ?auto_1212 ) ( ON ?auto_1209 ?auto_1213 ) ( CLEAR ?auto_1209 ) ( not ( = ?auto_1208 ?auto_1213 ) ) ( not ( = ?auto_1209 ?auto_1213 ) ) ( TRUCK-AT ?auto_1211 ?auto_1214 ) ( LIFTING ?auto_1210 ?auto_1216 ) ( IS-CRATE ?auto_1216 ) ( not ( = ?auto_1208 ?auto_1216 ) ) ( not ( = ?auto_1209 ?auto_1216 ) ) ( not ( = ?auto_1213 ?auto_1216 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1210 ?auto_1216 ?auto_1211 ?auto_1214 )
      ( MAKE-1CRATE ?auto_1208 ?auto_1209 )
      ( MAKE-1CRATE-VERIFY ?auto_1208 ?auto_1209 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1217 - SURFACE
      ?auto_1218 - SURFACE
    )
    :vars
    (
      ?auto_1223 - HOIST
      ?auto_1219 - PLACE
      ?auto_1224 - PLACE
      ?auto_1220 - HOIST
      ?auto_1225 - SURFACE
      ?auto_1222 - TRUCK
      ?auto_1221 - SURFACE
      ?auto_1226 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1223 ?auto_1219 ) ( SURFACE-AT ?auto_1217 ?auto_1219 ) ( CLEAR ?auto_1217 ) ( IS-CRATE ?auto_1218 ) ( not ( = ?auto_1217 ?auto_1218 ) ) ( not ( = ?auto_1224 ?auto_1219 ) ) ( HOIST-AT ?auto_1220 ?auto_1224 ) ( not ( = ?auto_1223 ?auto_1220 ) ) ( AVAILABLE ?auto_1220 ) ( SURFACE-AT ?auto_1218 ?auto_1224 ) ( ON ?auto_1218 ?auto_1225 ) ( CLEAR ?auto_1218 ) ( not ( = ?auto_1217 ?auto_1225 ) ) ( not ( = ?auto_1218 ?auto_1225 ) ) ( TRUCK-AT ?auto_1222 ?auto_1219 ) ( IS-CRATE ?auto_1221 ) ( not ( = ?auto_1217 ?auto_1221 ) ) ( not ( = ?auto_1218 ?auto_1221 ) ) ( not ( = ?auto_1225 ?auto_1221 ) ) ( AVAILABLE ?auto_1223 ) ( SURFACE-AT ?auto_1221 ?auto_1219 ) ( ON ?auto_1221 ?auto_1226 ) ( CLEAR ?auto_1221 ) ( not ( = ?auto_1217 ?auto_1226 ) ) ( not ( = ?auto_1218 ?auto_1226 ) ) ( not ( = ?auto_1225 ?auto_1226 ) ) ( not ( = ?auto_1221 ?auto_1226 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1223 ?auto_1221 ?auto_1226 ?auto_1219 )
      ( MAKE-1CRATE ?auto_1217 ?auto_1218 )
      ( MAKE-1CRATE-VERIFY ?auto_1217 ?auto_1218 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1229 - SURFACE
      ?auto_1230 - SURFACE
    )
    :vars
    (
      ?auto_1231 - HOIST
      ?auto_1232 - PLACE
      ?auto_1233 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1231 ?auto_1232 ) ( AVAILABLE ?auto_1231 ) ( SURFACE-AT ?auto_1233 ?auto_1232 ) ( ON ?auto_1233 ?auto_1230 ) ( CLEAR ?auto_1233 ) ( IS-CRATE ?auto_1233 ) ( ON ?auto_1230 ?auto_1229 ) ( not ( = ?auto_1229 ?auto_1230 ) ) ( not ( = ?auto_1229 ?auto_1233 ) ) ( not ( = ?auto_1230 ?auto_1233 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1231 ?auto_1233 ?auto_1230 ?auto_1232 )
      ( MAKE-1CRATE-VERIFY ?auto_1229 ?auto_1230 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1254 - SURFACE
      ?auto_1255 - SURFACE
    )
    :vars
    (
      ?auto_1256 - HOIST
      ?auto_1258 - PLACE
      ?auto_1257 - SURFACE
      ?auto_1260 - SURFACE
      ?auto_1259 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1256 ?auto_1258 ) ( SURFACE-AT ?auto_1257 ?auto_1258 ) ( ON ?auto_1257 ?auto_1255 ) ( CLEAR ?auto_1257 ) ( IS-CRATE ?auto_1257 ) ( ON ?auto_1255 ?auto_1254 ) ( not ( = ?auto_1254 ?auto_1255 ) ) ( not ( = ?auto_1254 ?auto_1257 ) ) ( not ( = ?auto_1255 ?auto_1257 ) ) ( SURFACE-AT ?auto_1260 ?auto_1258 ) ( CLEAR ?auto_1260 ) ( LIFTING ?auto_1256 ?auto_1259 ) ( IS-CRATE ?auto_1259 ) ( not ( = ?auto_1254 ?auto_1260 ) ) ( not ( = ?auto_1254 ?auto_1259 ) ) ( not ( = ?auto_1255 ?auto_1260 ) ) ( not ( = ?auto_1255 ?auto_1259 ) ) ( not ( = ?auto_1257 ?auto_1260 ) ) ( not ( = ?auto_1257 ?auto_1259 ) ) ( not ( = ?auto_1260 ?auto_1259 ) ) )
    :subtasks
    ( ( !DROP ?auto_1256 ?auto_1259 ?auto_1260 ?auto_1258 )
      ( MAKE-1CRATE ?auto_1254 ?auto_1255 )
      ( MAKE-1CRATE-VERIFY ?auto_1254 ?auto_1255 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1261 - SURFACE
      ?auto_1262 - SURFACE
    )
    :vars
    (
      ?auto_1267 - HOIST
      ?auto_1264 - PLACE
      ?auto_1263 - SURFACE
      ?auto_1265 - SURFACE
      ?auto_1266 - SURFACE
      ?auto_1268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1267 ?auto_1264 ) ( SURFACE-AT ?auto_1263 ?auto_1264 ) ( ON ?auto_1263 ?auto_1262 ) ( CLEAR ?auto_1263 ) ( IS-CRATE ?auto_1263 ) ( ON ?auto_1262 ?auto_1261 ) ( not ( = ?auto_1261 ?auto_1262 ) ) ( not ( = ?auto_1261 ?auto_1263 ) ) ( not ( = ?auto_1262 ?auto_1263 ) ) ( SURFACE-AT ?auto_1265 ?auto_1264 ) ( CLEAR ?auto_1265 ) ( IS-CRATE ?auto_1266 ) ( not ( = ?auto_1261 ?auto_1265 ) ) ( not ( = ?auto_1261 ?auto_1266 ) ) ( not ( = ?auto_1262 ?auto_1265 ) ) ( not ( = ?auto_1262 ?auto_1266 ) ) ( not ( = ?auto_1263 ?auto_1265 ) ) ( not ( = ?auto_1263 ?auto_1266 ) ) ( not ( = ?auto_1265 ?auto_1266 ) ) ( TRUCK-AT ?auto_1268 ?auto_1264 ) ( AVAILABLE ?auto_1267 ) ( IN ?auto_1266 ?auto_1268 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1267 ?auto_1266 ?auto_1268 ?auto_1264 )
      ( MAKE-1CRATE ?auto_1261 ?auto_1262 )
      ( MAKE-1CRATE-VERIFY ?auto_1261 ?auto_1262 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1269 - SURFACE
      ?auto_1270 - SURFACE
    )
    :vars
    (
      ?auto_1274 - HOIST
      ?auto_1275 - PLACE
      ?auto_1272 - SURFACE
      ?auto_1273 - SURFACE
      ?auto_1271 - SURFACE
      ?auto_1276 - TRUCK
      ?auto_1277 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1274 ?auto_1275 ) ( SURFACE-AT ?auto_1272 ?auto_1275 ) ( ON ?auto_1272 ?auto_1270 ) ( CLEAR ?auto_1272 ) ( IS-CRATE ?auto_1272 ) ( ON ?auto_1270 ?auto_1269 ) ( not ( = ?auto_1269 ?auto_1270 ) ) ( not ( = ?auto_1269 ?auto_1272 ) ) ( not ( = ?auto_1270 ?auto_1272 ) ) ( SURFACE-AT ?auto_1273 ?auto_1275 ) ( CLEAR ?auto_1273 ) ( IS-CRATE ?auto_1271 ) ( not ( = ?auto_1269 ?auto_1273 ) ) ( not ( = ?auto_1269 ?auto_1271 ) ) ( not ( = ?auto_1270 ?auto_1273 ) ) ( not ( = ?auto_1270 ?auto_1271 ) ) ( not ( = ?auto_1272 ?auto_1273 ) ) ( not ( = ?auto_1272 ?auto_1271 ) ) ( not ( = ?auto_1273 ?auto_1271 ) ) ( TRUCK-AT ?auto_1276 ?auto_1275 ) ( IN ?auto_1271 ?auto_1276 ) ( LIFTING ?auto_1274 ?auto_1277 ) ( IS-CRATE ?auto_1277 ) ( not ( = ?auto_1269 ?auto_1277 ) ) ( not ( = ?auto_1270 ?auto_1277 ) ) ( not ( = ?auto_1272 ?auto_1277 ) ) ( not ( = ?auto_1273 ?auto_1277 ) ) ( not ( = ?auto_1271 ?auto_1277 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1274 ?auto_1277 ?auto_1276 ?auto_1275 )
      ( MAKE-1CRATE ?auto_1269 ?auto_1270 )
      ( MAKE-1CRATE-VERIFY ?auto_1269 ?auto_1270 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1278 - SURFACE
      ?auto_1279 - SURFACE
    )
    :vars
    (
      ?auto_1285 - HOIST
      ?auto_1280 - PLACE
      ?auto_1286 - SURFACE
      ?auto_1284 - SURFACE
      ?auto_1283 - SURFACE
      ?auto_1281 - TRUCK
      ?auto_1282 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1285 ?auto_1280 ) ( SURFACE-AT ?auto_1286 ?auto_1280 ) ( ON ?auto_1286 ?auto_1279 ) ( CLEAR ?auto_1286 ) ( IS-CRATE ?auto_1286 ) ( ON ?auto_1279 ?auto_1278 ) ( not ( = ?auto_1278 ?auto_1279 ) ) ( not ( = ?auto_1278 ?auto_1286 ) ) ( not ( = ?auto_1279 ?auto_1286 ) ) ( SURFACE-AT ?auto_1284 ?auto_1280 ) ( IS-CRATE ?auto_1283 ) ( not ( = ?auto_1278 ?auto_1284 ) ) ( not ( = ?auto_1278 ?auto_1283 ) ) ( not ( = ?auto_1279 ?auto_1284 ) ) ( not ( = ?auto_1279 ?auto_1283 ) ) ( not ( = ?auto_1286 ?auto_1284 ) ) ( not ( = ?auto_1286 ?auto_1283 ) ) ( not ( = ?auto_1284 ?auto_1283 ) ) ( TRUCK-AT ?auto_1281 ?auto_1280 ) ( IN ?auto_1283 ?auto_1281 ) ( IS-CRATE ?auto_1282 ) ( not ( = ?auto_1278 ?auto_1282 ) ) ( not ( = ?auto_1279 ?auto_1282 ) ) ( not ( = ?auto_1286 ?auto_1282 ) ) ( not ( = ?auto_1284 ?auto_1282 ) ) ( not ( = ?auto_1283 ?auto_1282 ) ) ( AVAILABLE ?auto_1285 ) ( SURFACE-AT ?auto_1282 ?auto_1280 ) ( ON ?auto_1282 ?auto_1284 ) ( CLEAR ?auto_1282 ) )
    :subtasks
    ( ( !LIFT ?auto_1285 ?auto_1282 ?auto_1284 ?auto_1280 )
      ( MAKE-1CRATE ?auto_1278 ?auto_1279 )
      ( MAKE-1CRATE-VERIFY ?auto_1278 ?auto_1279 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1287 - SURFACE
      ?auto_1288 - SURFACE
    )
    :vars
    (
      ?auto_1294 - HOIST
      ?auto_1293 - PLACE
      ?auto_1295 - SURFACE
      ?auto_1291 - SURFACE
      ?auto_1292 - SURFACE
      ?auto_1290 - TRUCK
      ?auto_1289 - SURFACE
      ?auto_1296 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1294 ?auto_1293 ) ( SURFACE-AT ?auto_1295 ?auto_1293 ) ( ON ?auto_1295 ?auto_1288 ) ( CLEAR ?auto_1295 ) ( IS-CRATE ?auto_1295 ) ( ON ?auto_1288 ?auto_1287 ) ( not ( = ?auto_1287 ?auto_1288 ) ) ( not ( = ?auto_1287 ?auto_1295 ) ) ( not ( = ?auto_1288 ?auto_1295 ) ) ( SURFACE-AT ?auto_1291 ?auto_1293 ) ( IS-CRATE ?auto_1292 ) ( not ( = ?auto_1287 ?auto_1291 ) ) ( not ( = ?auto_1287 ?auto_1292 ) ) ( not ( = ?auto_1288 ?auto_1291 ) ) ( not ( = ?auto_1288 ?auto_1292 ) ) ( not ( = ?auto_1295 ?auto_1291 ) ) ( not ( = ?auto_1295 ?auto_1292 ) ) ( not ( = ?auto_1291 ?auto_1292 ) ) ( TRUCK-AT ?auto_1290 ?auto_1293 ) ( IN ?auto_1292 ?auto_1290 ) ( IS-CRATE ?auto_1289 ) ( not ( = ?auto_1287 ?auto_1289 ) ) ( not ( = ?auto_1288 ?auto_1289 ) ) ( not ( = ?auto_1295 ?auto_1289 ) ) ( not ( = ?auto_1291 ?auto_1289 ) ) ( not ( = ?auto_1292 ?auto_1289 ) ) ( SURFACE-AT ?auto_1289 ?auto_1293 ) ( ON ?auto_1289 ?auto_1291 ) ( CLEAR ?auto_1289 ) ( LIFTING ?auto_1294 ?auto_1296 ) ( IS-CRATE ?auto_1296 ) ( not ( = ?auto_1287 ?auto_1296 ) ) ( not ( = ?auto_1288 ?auto_1296 ) ) ( not ( = ?auto_1295 ?auto_1296 ) ) ( not ( = ?auto_1291 ?auto_1296 ) ) ( not ( = ?auto_1292 ?auto_1296 ) ) ( not ( = ?auto_1289 ?auto_1296 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1294 ?auto_1296 ?auto_1290 ?auto_1293 )
      ( MAKE-1CRATE ?auto_1287 ?auto_1288 )
      ( MAKE-1CRATE-VERIFY ?auto_1287 ?auto_1288 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1297 - SURFACE
      ?auto_1298 - SURFACE
    )
    :vars
    (
      ?auto_1304 - HOIST
      ?auto_1302 - PLACE
      ?auto_1300 - SURFACE
      ?auto_1305 - SURFACE
      ?auto_1301 - SURFACE
      ?auto_1306 - TRUCK
      ?auto_1303 - SURFACE
      ?auto_1299 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1304 ?auto_1302 ) ( SURFACE-AT ?auto_1300 ?auto_1302 ) ( ON ?auto_1300 ?auto_1298 ) ( CLEAR ?auto_1300 ) ( IS-CRATE ?auto_1300 ) ( ON ?auto_1298 ?auto_1297 ) ( not ( = ?auto_1297 ?auto_1298 ) ) ( not ( = ?auto_1297 ?auto_1300 ) ) ( not ( = ?auto_1298 ?auto_1300 ) ) ( SURFACE-AT ?auto_1305 ?auto_1302 ) ( IS-CRATE ?auto_1301 ) ( not ( = ?auto_1297 ?auto_1305 ) ) ( not ( = ?auto_1297 ?auto_1301 ) ) ( not ( = ?auto_1298 ?auto_1305 ) ) ( not ( = ?auto_1298 ?auto_1301 ) ) ( not ( = ?auto_1300 ?auto_1305 ) ) ( not ( = ?auto_1300 ?auto_1301 ) ) ( not ( = ?auto_1305 ?auto_1301 ) ) ( TRUCK-AT ?auto_1306 ?auto_1302 ) ( IN ?auto_1301 ?auto_1306 ) ( IS-CRATE ?auto_1303 ) ( not ( = ?auto_1297 ?auto_1303 ) ) ( not ( = ?auto_1298 ?auto_1303 ) ) ( not ( = ?auto_1300 ?auto_1303 ) ) ( not ( = ?auto_1305 ?auto_1303 ) ) ( not ( = ?auto_1301 ?auto_1303 ) ) ( SURFACE-AT ?auto_1303 ?auto_1302 ) ( ON ?auto_1303 ?auto_1305 ) ( IS-CRATE ?auto_1299 ) ( not ( = ?auto_1297 ?auto_1299 ) ) ( not ( = ?auto_1298 ?auto_1299 ) ) ( not ( = ?auto_1300 ?auto_1299 ) ) ( not ( = ?auto_1305 ?auto_1299 ) ) ( not ( = ?auto_1301 ?auto_1299 ) ) ( not ( = ?auto_1303 ?auto_1299 ) ) ( AVAILABLE ?auto_1304 ) ( SURFACE-AT ?auto_1299 ?auto_1302 ) ( ON ?auto_1299 ?auto_1303 ) ( CLEAR ?auto_1299 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1305 ?auto_1303 )
      ( MAKE-1CRATE ?auto_1297 ?auto_1298 )
      ( MAKE-1CRATE-VERIFY ?auto_1297 ?auto_1298 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1307 - SURFACE
      ?auto_1308 - SURFACE
    )
    :vars
    (
      ?auto_1309 - HOIST
      ?auto_1312 - PLACE
      ?auto_1313 - SURFACE
      ?auto_1315 - SURFACE
      ?auto_1310 - SURFACE
      ?auto_1311 - TRUCK
      ?auto_1316 - SURFACE
      ?auto_1314 - SURFACE
      ?auto_1317 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1309 ?auto_1312 ) ( SURFACE-AT ?auto_1313 ?auto_1312 ) ( ON ?auto_1313 ?auto_1308 ) ( CLEAR ?auto_1313 ) ( IS-CRATE ?auto_1313 ) ( ON ?auto_1308 ?auto_1307 ) ( not ( = ?auto_1307 ?auto_1308 ) ) ( not ( = ?auto_1307 ?auto_1313 ) ) ( not ( = ?auto_1308 ?auto_1313 ) ) ( SURFACE-AT ?auto_1315 ?auto_1312 ) ( IS-CRATE ?auto_1310 ) ( not ( = ?auto_1307 ?auto_1315 ) ) ( not ( = ?auto_1307 ?auto_1310 ) ) ( not ( = ?auto_1308 ?auto_1315 ) ) ( not ( = ?auto_1308 ?auto_1310 ) ) ( not ( = ?auto_1313 ?auto_1315 ) ) ( not ( = ?auto_1313 ?auto_1310 ) ) ( not ( = ?auto_1315 ?auto_1310 ) ) ( IN ?auto_1310 ?auto_1311 ) ( IS-CRATE ?auto_1316 ) ( not ( = ?auto_1307 ?auto_1316 ) ) ( not ( = ?auto_1308 ?auto_1316 ) ) ( not ( = ?auto_1313 ?auto_1316 ) ) ( not ( = ?auto_1315 ?auto_1316 ) ) ( not ( = ?auto_1310 ?auto_1316 ) ) ( SURFACE-AT ?auto_1316 ?auto_1312 ) ( ON ?auto_1316 ?auto_1315 ) ( IS-CRATE ?auto_1314 ) ( not ( = ?auto_1307 ?auto_1314 ) ) ( not ( = ?auto_1308 ?auto_1314 ) ) ( not ( = ?auto_1313 ?auto_1314 ) ) ( not ( = ?auto_1315 ?auto_1314 ) ) ( not ( = ?auto_1310 ?auto_1314 ) ) ( not ( = ?auto_1316 ?auto_1314 ) ) ( AVAILABLE ?auto_1309 ) ( SURFACE-AT ?auto_1314 ?auto_1312 ) ( ON ?auto_1314 ?auto_1316 ) ( CLEAR ?auto_1314 ) ( TRUCK-AT ?auto_1311 ?auto_1317 ) ( not ( = ?auto_1317 ?auto_1312 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1311 ?auto_1317 ?auto_1312 )
      ( MAKE-1CRATE ?auto_1307 ?auto_1308 )
      ( MAKE-1CRATE-VERIFY ?auto_1307 ?auto_1308 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1318 - SURFACE
      ?auto_1319 - SURFACE
    )
    :vars
    (
      ?auto_1327 - HOIST
      ?auto_1321 - PLACE
      ?auto_1326 - SURFACE
      ?auto_1320 - SURFACE
      ?auto_1322 - SURFACE
      ?auto_1325 - SURFACE
      ?auto_1328 - SURFACE
      ?auto_1324 - TRUCK
      ?auto_1323 - PLACE
      ?auto_1329 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1327 ?auto_1321 ) ( SURFACE-AT ?auto_1326 ?auto_1321 ) ( ON ?auto_1326 ?auto_1319 ) ( CLEAR ?auto_1326 ) ( IS-CRATE ?auto_1326 ) ( ON ?auto_1319 ?auto_1318 ) ( not ( = ?auto_1318 ?auto_1319 ) ) ( not ( = ?auto_1318 ?auto_1326 ) ) ( not ( = ?auto_1319 ?auto_1326 ) ) ( SURFACE-AT ?auto_1320 ?auto_1321 ) ( IS-CRATE ?auto_1322 ) ( not ( = ?auto_1318 ?auto_1320 ) ) ( not ( = ?auto_1318 ?auto_1322 ) ) ( not ( = ?auto_1319 ?auto_1320 ) ) ( not ( = ?auto_1319 ?auto_1322 ) ) ( not ( = ?auto_1326 ?auto_1320 ) ) ( not ( = ?auto_1326 ?auto_1322 ) ) ( not ( = ?auto_1320 ?auto_1322 ) ) ( IS-CRATE ?auto_1325 ) ( not ( = ?auto_1318 ?auto_1325 ) ) ( not ( = ?auto_1319 ?auto_1325 ) ) ( not ( = ?auto_1326 ?auto_1325 ) ) ( not ( = ?auto_1320 ?auto_1325 ) ) ( not ( = ?auto_1322 ?auto_1325 ) ) ( SURFACE-AT ?auto_1325 ?auto_1321 ) ( ON ?auto_1325 ?auto_1320 ) ( IS-CRATE ?auto_1328 ) ( not ( = ?auto_1318 ?auto_1328 ) ) ( not ( = ?auto_1319 ?auto_1328 ) ) ( not ( = ?auto_1326 ?auto_1328 ) ) ( not ( = ?auto_1320 ?auto_1328 ) ) ( not ( = ?auto_1322 ?auto_1328 ) ) ( not ( = ?auto_1325 ?auto_1328 ) ) ( AVAILABLE ?auto_1327 ) ( SURFACE-AT ?auto_1328 ?auto_1321 ) ( ON ?auto_1328 ?auto_1325 ) ( CLEAR ?auto_1328 ) ( TRUCK-AT ?auto_1324 ?auto_1323 ) ( not ( = ?auto_1323 ?auto_1321 ) ) ( HOIST-AT ?auto_1329 ?auto_1323 ) ( LIFTING ?auto_1329 ?auto_1322 ) ( not ( = ?auto_1327 ?auto_1329 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1329 ?auto_1322 ?auto_1324 ?auto_1323 )
      ( MAKE-1CRATE ?auto_1318 ?auto_1319 )
      ( MAKE-1CRATE-VERIFY ?auto_1318 ?auto_1319 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1330 - SURFACE
      ?auto_1331 - SURFACE
    )
    :vars
    (
      ?auto_1338 - HOIST
      ?auto_1341 - PLACE
      ?auto_1337 - SURFACE
      ?auto_1334 - SURFACE
      ?auto_1340 - SURFACE
      ?auto_1336 - SURFACE
      ?auto_1335 - SURFACE
      ?auto_1339 - TRUCK
      ?auto_1332 - PLACE
      ?auto_1333 - HOIST
      ?auto_1342 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1338 ?auto_1341 ) ( SURFACE-AT ?auto_1337 ?auto_1341 ) ( ON ?auto_1337 ?auto_1331 ) ( CLEAR ?auto_1337 ) ( IS-CRATE ?auto_1337 ) ( ON ?auto_1331 ?auto_1330 ) ( not ( = ?auto_1330 ?auto_1331 ) ) ( not ( = ?auto_1330 ?auto_1337 ) ) ( not ( = ?auto_1331 ?auto_1337 ) ) ( SURFACE-AT ?auto_1334 ?auto_1341 ) ( IS-CRATE ?auto_1340 ) ( not ( = ?auto_1330 ?auto_1334 ) ) ( not ( = ?auto_1330 ?auto_1340 ) ) ( not ( = ?auto_1331 ?auto_1334 ) ) ( not ( = ?auto_1331 ?auto_1340 ) ) ( not ( = ?auto_1337 ?auto_1334 ) ) ( not ( = ?auto_1337 ?auto_1340 ) ) ( not ( = ?auto_1334 ?auto_1340 ) ) ( IS-CRATE ?auto_1336 ) ( not ( = ?auto_1330 ?auto_1336 ) ) ( not ( = ?auto_1331 ?auto_1336 ) ) ( not ( = ?auto_1337 ?auto_1336 ) ) ( not ( = ?auto_1334 ?auto_1336 ) ) ( not ( = ?auto_1340 ?auto_1336 ) ) ( SURFACE-AT ?auto_1336 ?auto_1341 ) ( ON ?auto_1336 ?auto_1334 ) ( IS-CRATE ?auto_1335 ) ( not ( = ?auto_1330 ?auto_1335 ) ) ( not ( = ?auto_1331 ?auto_1335 ) ) ( not ( = ?auto_1337 ?auto_1335 ) ) ( not ( = ?auto_1334 ?auto_1335 ) ) ( not ( = ?auto_1340 ?auto_1335 ) ) ( not ( = ?auto_1336 ?auto_1335 ) ) ( AVAILABLE ?auto_1338 ) ( SURFACE-AT ?auto_1335 ?auto_1341 ) ( ON ?auto_1335 ?auto_1336 ) ( CLEAR ?auto_1335 ) ( TRUCK-AT ?auto_1339 ?auto_1332 ) ( not ( = ?auto_1332 ?auto_1341 ) ) ( HOIST-AT ?auto_1333 ?auto_1332 ) ( not ( = ?auto_1338 ?auto_1333 ) ) ( AVAILABLE ?auto_1333 ) ( SURFACE-AT ?auto_1340 ?auto_1332 ) ( ON ?auto_1340 ?auto_1342 ) ( CLEAR ?auto_1340 ) ( not ( = ?auto_1330 ?auto_1342 ) ) ( not ( = ?auto_1331 ?auto_1342 ) ) ( not ( = ?auto_1337 ?auto_1342 ) ) ( not ( = ?auto_1334 ?auto_1342 ) ) ( not ( = ?auto_1340 ?auto_1342 ) ) ( not ( = ?auto_1336 ?auto_1342 ) ) ( not ( = ?auto_1335 ?auto_1342 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1333 ?auto_1340 ?auto_1342 ?auto_1332 )
      ( MAKE-1CRATE ?auto_1330 ?auto_1331 )
      ( MAKE-1CRATE-VERIFY ?auto_1330 ?auto_1331 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1345 - SURFACE
      ?auto_1346 - SURFACE
    )
    :vars
    (
      ?auto_1347 - HOIST
      ?auto_1348 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1347 ?auto_1348 ) ( SURFACE-AT ?auto_1345 ?auto_1348 ) ( CLEAR ?auto_1345 ) ( LIFTING ?auto_1347 ?auto_1346 ) ( IS-CRATE ?auto_1346 ) ( not ( = ?auto_1345 ?auto_1346 ) ) )
    :subtasks
    ( ( !DROP ?auto_1347 ?auto_1346 ?auto_1345 ?auto_1348 )
      ( MAKE-1CRATE-VERIFY ?auto_1345 ?auto_1346 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1349 - SURFACE
      ?auto_1350 - SURFACE
    )
    :vars
    (
      ?auto_1351 - HOIST
      ?auto_1352 - PLACE
      ?auto_1353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1351 ?auto_1352 ) ( SURFACE-AT ?auto_1349 ?auto_1352 ) ( CLEAR ?auto_1349 ) ( IS-CRATE ?auto_1350 ) ( not ( = ?auto_1349 ?auto_1350 ) ) ( TRUCK-AT ?auto_1353 ?auto_1352 ) ( AVAILABLE ?auto_1351 ) ( IN ?auto_1350 ?auto_1353 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1351 ?auto_1350 ?auto_1353 ?auto_1352 )
      ( MAKE-1CRATE ?auto_1349 ?auto_1350 )
      ( MAKE-1CRATE-VERIFY ?auto_1349 ?auto_1350 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1354 - SURFACE
      ?auto_1355 - SURFACE
    )
    :vars
    (
      ?auto_1358 - HOIST
      ?auto_1356 - PLACE
      ?auto_1357 - TRUCK
      ?auto_1359 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1358 ?auto_1356 ) ( SURFACE-AT ?auto_1354 ?auto_1356 ) ( CLEAR ?auto_1354 ) ( IS-CRATE ?auto_1355 ) ( not ( = ?auto_1354 ?auto_1355 ) ) ( TRUCK-AT ?auto_1357 ?auto_1356 ) ( IN ?auto_1355 ?auto_1357 ) ( LIFTING ?auto_1358 ?auto_1359 ) ( IS-CRATE ?auto_1359 ) ( not ( = ?auto_1354 ?auto_1359 ) ) ( not ( = ?auto_1355 ?auto_1359 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1358 ?auto_1359 ?auto_1357 ?auto_1356 )
      ( MAKE-1CRATE ?auto_1354 ?auto_1355 )
      ( MAKE-1CRATE-VERIFY ?auto_1354 ?auto_1355 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1360 - SURFACE
      ?auto_1361 - SURFACE
    )
    :vars
    (
      ?auto_1363 - HOIST
      ?auto_1365 - PLACE
      ?auto_1362 - TRUCK
      ?auto_1364 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1363 ?auto_1365 ) ( SURFACE-AT ?auto_1360 ?auto_1365 ) ( IS-CRATE ?auto_1361 ) ( not ( = ?auto_1360 ?auto_1361 ) ) ( TRUCK-AT ?auto_1362 ?auto_1365 ) ( IN ?auto_1361 ?auto_1362 ) ( IS-CRATE ?auto_1364 ) ( not ( = ?auto_1360 ?auto_1364 ) ) ( not ( = ?auto_1361 ?auto_1364 ) ) ( AVAILABLE ?auto_1363 ) ( SURFACE-AT ?auto_1364 ?auto_1365 ) ( ON ?auto_1364 ?auto_1360 ) ( CLEAR ?auto_1364 ) )
    :subtasks
    ( ( !LIFT ?auto_1363 ?auto_1364 ?auto_1360 ?auto_1365 )
      ( MAKE-1CRATE ?auto_1360 ?auto_1361 )
      ( MAKE-1CRATE-VERIFY ?auto_1360 ?auto_1361 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1366 - SURFACE
      ?auto_1367 - SURFACE
    )
    :vars
    (
      ?auto_1368 - HOIST
      ?auto_1369 - PLACE
      ?auto_1371 - TRUCK
      ?auto_1370 - SURFACE
      ?auto_1372 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1368 ?auto_1369 ) ( SURFACE-AT ?auto_1366 ?auto_1369 ) ( IS-CRATE ?auto_1367 ) ( not ( = ?auto_1366 ?auto_1367 ) ) ( TRUCK-AT ?auto_1371 ?auto_1369 ) ( IN ?auto_1367 ?auto_1371 ) ( IS-CRATE ?auto_1370 ) ( not ( = ?auto_1366 ?auto_1370 ) ) ( not ( = ?auto_1367 ?auto_1370 ) ) ( SURFACE-AT ?auto_1370 ?auto_1369 ) ( ON ?auto_1370 ?auto_1366 ) ( CLEAR ?auto_1370 ) ( LIFTING ?auto_1368 ?auto_1372 ) ( IS-CRATE ?auto_1372 ) ( not ( = ?auto_1366 ?auto_1372 ) ) ( not ( = ?auto_1367 ?auto_1372 ) ) ( not ( = ?auto_1370 ?auto_1372 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1368 ?auto_1372 ?auto_1371 ?auto_1369 )
      ( MAKE-1CRATE ?auto_1366 ?auto_1367 )
      ( MAKE-1CRATE-VERIFY ?auto_1366 ?auto_1367 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1373 - SURFACE
      ?auto_1374 - SURFACE
    )
    :vars
    (
      ?auto_1376 - HOIST
      ?auto_1377 - PLACE
      ?auto_1378 - TRUCK
      ?auto_1379 - SURFACE
      ?auto_1375 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1376 ?auto_1377 ) ( SURFACE-AT ?auto_1373 ?auto_1377 ) ( IS-CRATE ?auto_1374 ) ( not ( = ?auto_1373 ?auto_1374 ) ) ( TRUCK-AT ?auto_1378 ?auto_1377 ) ( IN ?auto_1374 ?auto_1378 ) ( IS-CRATE ?auto_1379 ) ( not ( = ?auto_1373 ?auto_1379 ) ) ( not ( = ?auto_1374 ?auto_1379 ) ) ( SURFACE-AT ?auto_1379 ?auto_1377 ) ( ON ?auto_1379 ?auto_1373 ) ( IS-CRATE ?auto_1375 ) ( not ( = ?auto_1373 ?auto_1375 ) ) ( not ( = ?auto_1374 ?auto_1375 ) ) ( not ( = ?auto_1379 ?auto_1375 ) ) ( AVAILABLE ?auto_1376 ) ( SURFACE-AT ?auto_1375 ?auto_1377 ) ( ON ?auto_1375 ?auto_1379 ) ( CLEAR ?auto_1375 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1373 ?auto_1379 )
      ( MAKE-1CRATE ?auto_1373 ?auto_1374 )
      ( MAKE-1CRATE-VERIFY ?auto_1373 ?auto_1374 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1380 - SURFACE
      ?auto_1381 - SURFACE
    )
    :vars
    (
      ?auto_1383 - HOIST
      ?auto_1386 - PLACE
      ?auto_1382 - TRUCK
      ?auto_1385 - SURFACE
      ?auto_1384 - SURFACE
      ?auto_1387 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1383 ?auto_1386 ) ( SURFACE-AT ?auto_1380 ?auto_1386 ) ( IS-CRATE ?auto_1381 ) ( not ( = ?auto_1380 ?auto_1381 ) ) ( IN ?auto_1381 ?auto_1382 ) ( IS-CRATE ?auto_1385 ) ( not ( = ?auto_1380 ?auto_1385 ) ) ( not ( = ?auto_1381 ?auto_1385 ) ) ( SURFACE-AT ?auto_1385 ?auto_1386 ) ( ON ?auto_1385 ?auto_1380 ) ( IS-CRATE ?auto_1384 ) ( not ( = ?auto_1380 ?auto_1384 ) ) ( not ( = ?auto_1381 ?auto_1384 ) ) ( not ( = ?auto_1385 ?auto_1384 ) ) ( AVAILABLE ?auto_1383 ) ( SURFACE-AT ?auto_1384 ?auto_1386 ) ( ON ?auto_1384 ?auto_1385 ) ( CLEAR ?auto_1384 ) ( TRUCK-AT ?auto_1382 ?auto_1387 ) ( not ( = ?auto_1387 ?auto_1386 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1382 ?auto_1387 ?auto_1386 )
      ( MAKE-1CRATE ?auto_1380 ?auto_1381 )
      ( MAKE-1CRATE-VERIFY ?auto_1380 ?auto_1381 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1404 - SURFACE
      ?auto_1405 - SURFACE
    )
    :vars
    (
      ?auto_1406 - HOIST
      ?auto_1411 - PLACE
      ?auto_1409 - TRUCK
      ?auto_1408 - SURFACE
      ?auto_1410 - SURFACE
      ?auto_1407 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1406 ?auto_1411 ) ( SURFACE-AT ?auto_1404 ?auto_1411 ) ( IS-CRATE ?auto_1405 ) ( not ( = ?auto_1404 ?auto_1405 ) ) ( IN ?auto_1405 ?auto_1409 ) ( IS-CRATE ?auto_1408 ) ( not ( = ?auto_1404 ?auto_1408 ) ) ( not ( = ?auto_1405 ?auto_1408 ) ) ( SURFACE-AT ?auto_1408 ?auto_1411 ) ( ON ?auto_1408 ?auto_1404 ) ( IS-CRATE ?auto_1410 ) ( not ( = ?auto_1404 ?auto_1410 ) ) ( not ( = ?auto_1405 ?auto_1410 ) ) ( not ( = ?auto_1408 ?auto_1410 ) ) ( AVAILABLE ?auto_1406 ) ( SURFACE-AT ?auto_1410 ?auto_1411 ) ( ON ?auto_1410 ?auto_1408 ) ( CLEAR ?auto_1410 ) ( not ( = ?auto_1407 ?auto_1411 ) ) ( TRUCK-AT ?auto_1409 ?auto_1411 ) )
    :subtasks
    ( ( !DRIVE ?auto_1409 ?auto_1411 ?auto_1407 )
      ( MAKE-1CRATE ?auto_1404 ?auto_1405 )
      ( MAKE-1CRATE-VERIFY ?auto_1404 ?auto_1405 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1412 - SURFACE
      ?auto_1413 - SURFACE
    )
    :vars
    (
      ?auto_1416 - HOIST
      ?auto_1415 - PLACE
      ?auto_1419 - TRUCK
      ?auto_1414 - SURFACE
      ?auto_1418 - SURFACE
      ?auto_1417 - PLACE
      ?auto_1421 - SURFACE
      ?auto_1420 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1416 ?auto_1415 ) ( SURFACE-AT ?auto_1412 ?auto_1415 ) ( IS-CRATE ?auto_1413 ) ( not ( = ?auto_1412 ?auto_1413 ) ) ( IN ?auto_1413 ?auto_1419 ) ( IS-CRATE ?auto_1414 ) ( not ( = ?auto_1412 ?auto_1414 ) ) ( not ( = ?auto_1413 ?auto_1414 ) ) ( SURFACE-AT ?auto_1414 ?auto_1415 ) ( ON ?auto_1414 ?auto_1412 ) ( IS-CRATE ?auto_1418 ) ( not ( = ?auto_1412 ?auto_1418 ) ) ( not ( = ?auto_1413 ?auto_1418 ) ) ( not ( = ?auto_1414 ?auto_1418 ) ) ( SURFACE-AT ?auto_1418 ?auto_1415 ) ( ON ?auto_1418 ?auto_1414 ) ( CLEAR ?auto_1418 ) ( not ( = ?auto_1417 ?auto_1415 ) ) ( TRUCK-AT ?auto_1419 ?auto_1415 ) ( SURFACE-AT ?auto_1421 ?auto_1415 ) ( CLEAR ?auto_1421 ) ( LIFTING ?auto_1416 ?auto_1420 ) ( IS-CRATE ?auto_1420 ) ( not ( = ?auto_1412 ?auto_1421 ) ) ( not ( = ?auto_1412 ?auto_1420 ) ) ( not ( = ?auto_1413 ?auto_1421 ) ) ( not ( = ?auto_1413 ?auto_1420 ) ) ( not ( = ?auto_1414 ?auto_1421 ) ) ( not ( = ?auto_1414 ?auto_1420 ) ) ( not ( = ?auto_1418 ?auto_1421 ) ) ( not ( = ?auto_1418 ?auto_1420 ) ) ( not ( = ?auto_1421 ?auto_1420 ) ) )
    :subtasks
    ( ( !DROP ?auto_1416 ?auto_1420 ?auto_1421 ?auto_1415 )
      ( MAKE-1CRATE ?auto_1412 ?auto_1413 )
      ( MAKE-1CRATE-VERIFY ?auto_1412 ?auto_1413 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1422 - SURFACE
      ?auto_1423 - SURFACE
    )
    :vars
    (
      ?auto_1425 - HOIST
      ?auto_1428 - PLACE
      ?auto_1430 - TRUCK
      ?auto_1424 - SURFACE
      ?auto_1431 - SURFACE
      ?auto_1429 - PLACE
      ?auto_1426 - SURFACE
      ?auto_1427 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1425 ?auto_1428 ) ( SURFACE-AT ?auto_1422 ?auto_1428 ) ( IS-CRATE ?auto_1423 ) ( not ( = ?auto_1422 ?auto_1423 ) ) ( IN ?auto_1423 ?auto_1430 ) ( IS-CRATE ?auto_1424 ) ( not ( = ?auto_1422 ?auto_1424 ) ) ( not ( = ?auto_1423 ?auto_1424 ) ) ( SURFACE-AT ?auto_1424 ?auto_1428 ) ( ON ?auto_1424 ?auto_1422 ) ( IS-CRATE ?auto_1431 ) ( not ( = ?auto_1422 ?auto_1431 ) ) ( not ( = ?auto_1423 ?auto_1431 ) ) ( not ( = ?auto_1424 ?auto_1431 ) ) ( SURFACE-AT ?auto_1431 ?auto_1428 ) ( ON ?auto_1431 ?auto_1424 ) ( CLEAR ?auto_1431 ) ( not ( = ?auto_1429 ?auto_1428 ) ) ( TRUCK-AT ?auto_1430 ?auto_1428 ) ( SURFACE-AT ?auto_1426 ?auto_1428 ) ( CLEAR ?auto_1426 ) ( IS-CRATE ?auto_1427 ) ( not ( = ?auto_1422 ?auto_1426 ) ) ( not ( = ?auto_1422 ?auto_1427 ) ) ( not ( = ?auto_1423 ?auto_1426 ) ) ( not ( = ?auto_1423 ?auto_1427 ) ) ( not ( = ?auto_1424 ?auto_1426 ) ) ( not ( = ?auto_1424 ?auto_1427 ) ) ( not ( = ?auto_1431 ?auto_1426 ) ) ( not ( = ?auto_1431 ?auto_1427 ) ) ( not ( = ?auto_1426 ?auto_1427 ) ) ( AVAILABLE ?auto_1425 ) ( IN ?auto_1427 ?auto_1430 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1425 ?auto_1427 ?auto_1430 ?auto_1428 )
      ( MAKE-1CRATE ?auto_1422 ?auto_1423 )
      ( MAKE-1CRATE-VERIFY ?auto_1422 ?auto_1423 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1432 - SURFACE
      ?auto_1433 - SURFACE
    )
    :vars
    (
      ?auto_1439 - HOIST
      ?auto_1435 - PLACE
      ?auto_1440 - SURFACE
      ?auto_1434 - SURFACE
      ?auto_1441 - PLACE
      ?auto_1437 - TRUCK
      ?auto_1438 - SURFACE
      ?auto_1436 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1439 ?auto_1435 ) ( SURFACE-AT ?auto_1432 ?auto_1435 ) ( IS-CRATE ?auto_1433 ) ( not ( = ?auto_1432 ?auto_1433 ) ) ( IS-CRATE ?auto_1440 ) ( not ( = ?auto_1432 ?auto_1440 ) ) ( not ( = ?auto_1433 ?auto_1440 ) ) ( SURFACE-AT ?auto_1440 ?auto_1435 ) ( ON ?auto_1440 ?auto_1432 ) ( IS-CRATE ?auto_1434 ) ( not ( = ?auto_1432 ?auto_1434 ) ) ( not ( = ?auto_1433 ?auto_1434 ) ) ( not ( = ?auto_1440 ?auto_1434 ) ) ( SURFACE-AT ?auto_1434 ?auto_1435 ) ( ON ?auto_1434 ?auto_1440 ) ( CLEAR ?auto_1434 ) ( not ( = ?auto_1441 ?auto_1435 ) ) ( TRUCK-AT ?auto_1437 ?auto_1435 ) ( SURFACE-AT ?auto_1438 ?auto_1435 ) ( CLEAR ?auto_1438 ) ( IS-CRATE ?auto_1436 ) ( not ( = ?auto_1432 ?auto_1438 ) ) ( not ( = ?auto_1432 ?auto_1436 ) ) ( not ( = ?auto_1433 ?auto_1438 ) ) ( not ( = ?auto_1433 ?auto_1436 ) ) ( not ( = ?auto_1440 ?auto_1438 ) ) ( not ( = ?auto_1440 ?auto_1436 ) ) ( not ( = ?auto_1434 ?auto_1438 ) ) ( not ( = ?auto_1434 ?auto_1436 ) ) ( not ( = ?auto_1438 ?auto_1436 ) ) ( IN ?auto_1436 ?auto_1437 ) ( LIFTING ?auto_1439 ?auto_1433 ) )
    :subtasks
    ( ( !LOAD ?auto_1439 ?auto_1433 ?auto_1437 ?auto_1435 )
      ( MAKE-1CRATE ?auto_1432 ?auto_1433 )
      ( MAKE-1CRATE-VERIFY ?auto_1432 ?auto_1433 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1442 - SURFACE
      ?auto_1443 - SURFACE
    )
    :vars
    (
      ?auto_1449 - HOIST
      ?auto_1444 - PLACE
      ?auto_1448 - SURFACE
      ?auto_1451 - SURFACE
      ?auto_1446 - PLACE
      ?auto_1445 - TRUCK
      ?auto_1447 - SURFACE
      ?auto_1450 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1449 ?auto_1444 ) ( SURFACE-AT ?auto_1442 ?auto_1444 ) ( IS-CRATE ?auto_1443 ) ( not ( = ?auto_1442 ?auto_1443 ) ) ( IS-CRATE ?auto_1448 ) ( not ( = ?auto_1442 ?auto_1448 ) ) ( not ( = ?auto_1443 ?auto_1448 ) ) ( SURFACE-AT ?auto_1448 ?auto_1444 ) ( ON ?auto_1448 ?auto_1442 ) ( IS-CRATE ?auto_1451 ) ( not ( = ?auto_1442 ?auto_1451 ) ) ( not ( = ?auto_1443 ?auto_1451 ) ) ( not ( = ?auto_1448 ?auto_1451 ) ) ( SURFACE-AT ?auto_1451 ?auto_1444 ) ( ON ?auto_1451 ?auto_1448 ) ( CLEAR ?auto_1451 ) ( not ( = ?auto_1446 ?auto_1444 ) ) ( TRUCK-AT ?auto_1445 ?auto_1444 ) ( SURFACE-AT ?auto_1447 ?auto_1444 ) ( IS-CRATE ?auto_1450 ) ( not ( = ?auto_1442 ?auto_1447 ) ) ( not ( = ?auto_1442 ?auto_1450 ) ) ( not ( = ?auto_1443 ?auto_1447 ) ) ( not ( = ?auto_1443 ?auto_1450 ) ) ( not ( = ?auto_1448 ?auto_1447 ) ) ( not ( = ?auto_1448 ?auto_1450 ) ) ( not ( = ?auto_1451 ?auto_1447 ) ) ( not ( = ?auto_1451 ?auto_1450 ) ) ( not ( = ?auto_1447 ?auto_1450 ) ) ( IN ?auto_1450 ?auto_1445 ) ( AVAILABLE ?auto_1449 ) ( SURFACE-AT ?auto_1443 ?auto_1444 ) ( ON ?auto_1443 ?auto_1447 ) ( CLEAR ?auto_1443 ) )
    :subtasks
    ( ( !LIFT ?auto_1449 ?auto_1443 ?auto_1447 ?auto_1444 )
      ( MAKE-1CRATE ?auto_1442 ?auto_1443 )
      ( MAKE-1CRATE-VERIFY ?auto_1442 ?auto_1443 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1452 - SURFACE
      ?auto_1453 - SURFACE
    )
    :vars
    (
      ?auto_1457 - HOIST
      ?auto_1460 - PLACE
      ?auto_1454 - SURFACE
      ?auto_1456 - SURFACE
      ?auto_1459 - PLACE
      ?auto_1455 - TRUCK
      ?auto_1458 - SURFACE
      ?auto_1461 - SURFACE
      ?auto_1462 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1457 ?auto_1460 ) ( SURFACE-AT ?auto_1452 ?auto_1460 ) ( IS-CRATE ?auto_1453 ) ( not ( = ?auto_1452 ?auto_1453 ) ) ( IS-CRATE ?auto_1454 ) ( not ( = ?auto_1452 ?auto_1454 ) ) ( not ( = ?auto_1453 ?auto_1454 ) ) ( SURFACE-AT ?auto_1454 ?auto_1460 ) ( ON ?auto_1454 ?auto_1452 ) ( IS-CRATE ?auto_1456 ) ( not ( = ?auto_1452 ?auto_1456 ) ) ( not ( = ?auto_1453 ?auto_1456 ) ) ( not ( = ?auto_1454 ?auto_1456 ) ) ( SURFACE-AT ?auto_1456 ?auto_1460 ) ( ON ?auto_1456 ?auto_1454 ) ( CLEAR ?auto_1456 ) ( not ( = ?auto_1459 ?auto_1460 ) ) ( TRUCK-AT ?auto_1455 ?auto_1460 ) ( SURFACE-AT ?auto_1458 ?auto_1460 ) ( IS-CRATE ?auto_1461 ) ( not ( = ?auto_1452 ?auto_1458 ) ) ( not ( = ?auto_1452 ?auto_1461 ) ) ( not ( = ?auto_1453 ?auto_1458 ) ) ( not ( = ?auto_1453 ?auto_1461 ) ) ( not ( = ?auto_1454 ?auto_1458 ) ) ( not ( = ?auto_1454 ?auto_1461 ) ) ( not ( = ?auto_1456 ?auto_1458 ) ) ( not ( = ?auto_1456 ?auto_1461 ) ) ( not ( = ?auto_1458 ?auto_1461 ) ) ( IN ?auto_1461 ?auto_1455 ) ( SURFACE-AT ?auto_1453 ?auto_1460 ) ( ON ?auto_1453 ?auto_1458 ) ( CLEAR ?auto_1453 ) ( LIFTING ?auto_1457 ?auto_1462 ) ( IS-CRATE ?auto_1462 ) ( not ( = ?auto_1452 ?auto_1462 ) ) ( not ( = ?auto_1453 ?auto_1462 ) ) ( not ( = ?auto_1454 ?auto_1462 ) ) ( not ( = ?auto_1456 ?auto_1462 ) ) ( not ( = ?auto_1458 ?auto_1462 ) ) ( not ( = ?auto_1461 ?auto_1462 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1457 ?auto_1462 ?auto_1455 ?auto_1460 )
      ( MAKE-1CRATE ?auto_1452 ?auto_1453 )
      ( MAKE-1CRATE-VERIFY ?auto_1452 ?auto_1453 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1463 - SURFACE
      ?auto_1464 - SURFACE
    )
    :vars
    (
      ?auto_1466 - HOIST
      ?auto_1471 - PLACE
      ?auto_1467 - SURFACE
      ?auto_1468 - SURFACE
      ?auto_1472 - PLACE
      ?auto_1470 - TRUCK
      ?auto_1473 - SURFACE
      ?auto_1465 - SURFACE
      ?auto_1469 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1466 ?auto_1471 ) ( SURFACE-AT ?auto_1463 ?auto_1471 ) ( IS-CRATE ?auto_1464 ) ( not ( = ?auto_1463 ?auto_1464 ) ) ( IS-CRATE ?auto_1467 ) ( not ( = ?auto_1463 ?auto_1467 ) ) ( not ( = ?auto_1464 ?auto_1467 ) ) ( SURFACE-AT ?auto_1467 ?auto_1471 ) ( ON ?auto_1467 ?auto_1463 ) ( IS-CRATE ?auto_1468 ) ( not ( = ?auto_1463 ?auto_1468 ) ) ( not ( = ?auto_1464 ?auto_1468 ) ) ( not ( = ?auto_1467 ?auto_1468 ) ) ( SURFACE-AT ?auto_1468 ?auto_1471 ) ( ON ?auto_1468 ?auto_1467 ) ( CLEAR ?auto_1468 ) ( not ( = ?auto_1472 ?auto_1471 ) ) ( TRUCK-AT ?auto_1470 ?auto_1471 ) ( SURFACE-AT ?auto_1473 ?auto_1471 ) ( IS-CRATE ?auto_1465 ) ( not ( = ?auto_1463 ?auto_1473 ) ) ( not ( = ?auto_1463 ?auto_1465 ) ) ( not ( = ?auto_1464 ?auto_1473 ) ) ( not ( = ?auto_1464 ?auto_1465 ) ) ( not ( = ?auto_1467 ?auto_1473 ) ) ( not ( = ?auto_1467 ?auto_1465 ) ) ( not ( = ?auto_1468 ?auto_1473 ) ) ( not ( = ?auto_1468 ?auto_1465 ) ) ( not ( = ?auto_1473 ?auto_1465 ) ) ( IN ?auto_1465 ?auto_1470 ) ( SURFACE-AT ?auto_1464 ?auto_1471 ) ( ON ?auto_1464 ?auto_1473 ) ( IS-CRATE ?auto_1469 ) ( not ( = ?auto_1463 ?auto_1469 ) ) ( not ( = ?auto_1464 ?auto_1469 ) ) ( not ( = ?auto_1467 ?auto_1469 ) ) ( not ( = ?auto_1468 ?auto_1469 ) ) ( not ( = ?auto_1473 ?auto_1469 ) ) ( not ( = ?auto_1465 ?auto_1469 ) ) ( AVAILABLE ?auto_1466 ) ( SURFACE-AT ?auto_1469 ?auto_1471 ) ( ON ?auto_1469 ?auto_1464 ) ( CLEAR ?auto_1469 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1473 ?auto_1464 )
      ( MAKE-1CRATE ?auto_1463 ?auto_1464 )
      ( MAKE-1CRATE-VERIFY ?auto_1463 ?auto_1464 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1474 - SURFACE
      ?auto_1475 - SURFACE
    )
    :vars
    (
      ?auto_1481 - HOIST
      ?auto_1476 - PLACE
      ?auto_1482 - SURFACE
      ?auto_1484 - SURFACE
      ?auto_1483 - PLACE
      ?auto_1479 - SURFACE
      ?auto_1480 - SURFACE
      ?auto_1478 - TRUCK
      ?auto_1477 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1481 ?auto_1476 ) ( SURFACE-AT ?auto_1474 ?auto_1476 ) ( IS-CRATE ?auto_1475 ) ( not ( = ?auto_1474 ?auto_1475 ) ) ( IS-CRATE ?auto_1482 ) ( not ( = ?auto_1474 ?auto_1482 ) ) ( not ( = ?auto_1475 ?auto_1482 ) ) ( SURFACE-AT ?auto_1482 ?auto_1476 ) ( ON ?auto_1482 ?auto_1474 ) ( IS-CRATE ?auto_1484 ) ( not ( = ?auto_1474 ?auto_1484 ) ) ( not ( = ?auto_1475 ?auto_1484 ) ) ( not ( = ?auto_1482 ?auto_1484 ) ) ( SURFACE-AT ?auto_1484 ?auto_1476 ) ( ON ?auto_1484 ?auto_1482 ) ( CLEAR ?auto_1484 ) ( not ( = ?auto_1483 ?auto_1476 ) ) ( SURFACE-AT ?auto_1479 ?auto_1476 ) ( IS-CRATE ?auto_1480 ) ( not ( = ?auto_1474 ?auto_1479 ) ) ( not ( = ?auto_1474 ?auto_1480 ) ) ( not ( = ?auto_1475 ?auto_1479 ) ) ( not ( = ?auto_1475 ?auto_1480 ) ) ( not ( = ?auto_1482 ?auto_1479 ) ) ( not ( = ?auto_1482 ?auto_1480 ) ) ( not ( = ?auto_1484 ?auto_1479 ) ) ( not ( = ?auto_1484 ?auto_1480 ) ) ( not ( = ?auto_1479 ?auto_1480 ) ) ( IN ?auto_1480 ?auto_1478 ) ( SURFACE-AT ?auto_1475 ?auto_1476 ) ( ON ?auto_1475 ?auto_1479 ) ( IS-CRATE ?auto_1477 ) ( not ( = ?auto_1474 ?auto_1477 ) ) ( not ( = ?auto_1475 ?auto_1477 ) ) ( not ( = ?auto_1482 ?auto_1477 ) ) ( not ( = ?auto_1484 ?auto_1477 ) ) ( not ( = ?auto_1479 ?auto_1477 ) ) ( not ( = ?auto_1480 ?auto_1477 ) ) ( AVAILABLE ?auto_1481 ) ( SURFACE-AT ?auto_1477 ?auto_1476 ) ( ON ?auto_1477 ?auto_1475 ) ( CLEAR ?auto_1477 ) ( TRUCK-AT ?auto_1478 ?auto_1483 ) )
    :subtasks
    ( ( !DRIVE ?auto_1478 ?auto_1483 ?auto_1476 )
      ( MAKE-1CRATE ?auto_1474 ?auto_1475 )
      ( MAKE-1CRATE-VERIFY ?auto_1474 ?auto_1475 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1485 - SURFACE
      ?auto_1486 - SURFACE
    )
    :vars
    (
      ?auto_1495 - HOIST
      ?auto_1492 - PLACE
      ?auto_1494 - SURFACE
      ?auto_1491 - SURFACE
      ?auto_1493 - PLACE
      ?auto_1488 - SURFACE
      ?auto_1487 - SURFACE
      ?auto_1490 - SURFACE
      ?auto_1489 - TRUCK
      ?auto_1496 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1495 ?auto_1492 ) ( SURFACE-AT ?auto_1485 ?auto_1492 ) ( IS-CRATE ?auto_1486 ) ( not ( = ?auto_1485 ?auto_1486 ) ) ( IS-CRATE ?auto_1494 ) ( not ( = ?auto_1485 ?auto_1494 ) ) ( not ( = ?auto_1486 ?auto_1494 ) ) ( SURFACE-AT ?auto_1494 ?auto_1492 ) ( ON ?auto_1494 ?auto_1485 ) ( IS-CRATE ?auto_1491 ) ( not ( = ?auto_1485 ?auto_1491 ) ) ( not ( = ?auto_1486 ?auto_1491 ) ) ( not ( = ?auto_1494 ?auto_1491 ) ) ( SURFACE-AT ?auto_1491 ?auto_1492 ) ( ON ?auto_1491 ?auto_1494 ) ( CLEAR ?auto_1491 ) ( not ( = ?auto_1493 ?auto_1492 ) ) ( SURFACE-AT ?auto_1488 ?auto_1492 ) ( IS-CRATE ?auto_1487 ) ( not ( = ?auto_1485 ?auto_1488 ) ) ( not ( = ?auto_1485 ?auto_1487 ) ) ( not ( = ?auto_1486 ?auto_1488 ) ) ( not ( = ?auto_1486 ?auto_1487 ) ) ( not ( = ?auto_1494 ?auto_1488 ) ) ( not ( = ?auto_1494 ?auto_1487 ) ) ( not ( = ?auto_1491 ?auto_1488 ) ) ( not ( = ?auto_1491 ?auto_1487 ) ) ( not ( = ?auto_1488 ?auto_1487 ) ) ( SURFACE-AT ?auto_1486 ?auto_1492 ) ( ON ?auto_1486 ?auto_1488 ) ( IS-CRATE ?auto_1490 ) ( not ( = ?auto_1485 ?auto_1490 ) ) ( not ( = ?auto_1486 ?auto_1490 ) ) ( not ( = ?auto_1494 ?auto_1490 ) ) ( not ( = ?auto_1491 ?auto_1490 ) ) ( not ( = ?auto_1488 ?auto_1490 ) ) ( not ( = ?auto_1487 ?auto_1490 ) ) ( AVAILABLE ?auto_1495 ) ( SURFACE-AT ?auto_1490 ?auto_1492 ) ( ON ?auto_1490 ?auto_1486 ) ( CLEAR ?auto_1490 ) ( TRUCK-AT ?auto_1489 ?auto_1493 ) ( HOIST-AT ?auto_1496 ?auto_1493 ) ( LIFTING ?auto_1496 ?auto_1487 ) ( not ( = ?auto_1495 ?auto_1496 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1496 ?auto_1487 ?auto_1489 ?auto_1493 )
      ( MAKE-1CRATE ?auto_1485 ?auto_1486 )
      ( MAKE-1CRATE-VERIFY ?auto_1485 ?auto_1486 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1497 - SURFACE
      ?auto_1498 - SURFACE
    )
    :vars
    (
      ?auto_1501 - HOIST
      ?auto_1508 - PLACE
      ?auto_1504 - SURFACE
      ?auto_1506 - SURFACE
      ?auto_1503 - PLACE
      ?auto_1505 - SURFACE
      ?auto_1507 - SURFACE
      ?auto_1502 - SURFACE
      ?auto_1500 - TRUCK
      ?auto_1499 - HOIST
      ?auto_1509 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1501 ?auto_1508 ) ( SURFACE-AT ?auto_1497 ?auto_1508 ) ( IS-CRATE ?auto_1498 ) ( not ( = ?auto_1497 ?auto_1498 ) ) ( IS-CRATE ?auto_1504 ) ( not ( = ?auto_1497 ?auto_1504 ) ) ( not ( = ?auto_1498 ?auto_1504 ) ) ( SURFACE-AT ?auto_1504 ?auto_1508 ) ( ON ?auto_1504 ?auto_1497 ) ( IS-CRATE ?auto_1506 ) ( not ( = ?auto_1497 ?auto_1506 ) ) ( not ( = ?auto_1498 ?auto_1506 ) ) ( not ( = ?auto_1504 ?auto_1506 ) ) ( SURFACE-AT ?auto_1506 ?auto_1508 ) ( ON ?auto_1506 ?auto_1504 ) ( CLEAR ?auto_1506 ) ( not ( = ?auto_1503 ?auto_1508 ) ) ( SURFACE-AT ?auto_1505 ?auto_1508 ) ( IS-CRATE ?auto_1507 ) ( not ( = ?auto_1497 ?auto_1505 ) ) ( not ( = ?auto_1497 ?auto_1507 ) ) ( not ( = ?auto_1498 ?auto_1505 ) ) ( not ( = ?auto_1498 ?auto_1507 ) ) ( not ( = ?auto_1504 ?auto_1505 ) ) ( not ( = ?auto_1504 ?auto_1507 ) ) ( not ( = ?auto_1506 ?auto_1505 ) ) ( not ( = ?auto_1506 ?auto_1507 ) ) ( not ( = ?auto_1505 ?auto_1507 ) ) ( SURFACE-AT ?auto_1498 ?auto_1508 ) ( ON ?auto_1498 ?auto_1505 ) ( IS-CRATE ?auto_1502 ) ( not ( = ?auto_1497 ?auto_1502 ) ) ( not ( = ?auto_1498 ?auto_1502 ) ) ( not ( = ?auto_1504 ?auto_1502 ) ) ( not ( = ?auto_1506 ?auto_1502 ) ) ( not ( = ?auto_1505 ?auto_1502 ) ) ( not ( = ?auto_1507 ?auto_1502 ) ) ( AVAILABLE ?auto_1501 ) ( SURFACE-AT ?auto_1502 ?auto_1508 ) ( ON ?auto_1502 ?auto_1498 ) ( CLEAR ?auto_1502 ) ( TRUCK-AT ?auto_1500 ?auto_1503 ) ( HOIST-AT ?auto_1499 ?auto_1503 ) ( not ( = ?auto_1501 ?auto_1499 ) ) ( AVAILABLE ?auto_1499 ) ( SURFACE-AT ?auto_1507 ?auto_1503 ) ( ON ?auto_1507 ?auto_1509 ) ( CLEAR ?auto_1507 ) ( not ( = ?auto_1497 ?auto_1509 ) ) ( not ( = ?auto_1498 ?auto_1509 ) ) ( not ( = ?auto_1504 ?auto_1509 ) ) ( not ( = ?auto_1506 ?auto_1509 ) ) ( not ( = ?auto_1505 ?auto_1509 ) ) ( not ( = ?auto_1507 ?auto_1509 ) ) ( not ( = ?auto_1502 ?auto_1509 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1499 ?auto_1507 ?auto_1509 ?auto_1503 )
      ( MAKE-1CRATE ?auto_1497 ?auto_1498 )
      ( MAKE-1CRATE-VERIFY ?auto_1497 ?auto_1498 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1515 - SURFACE
      ?auto_1516 - SURFACE
    )
    :vars
    (
      ?auto_1517 - HOIST
      ?auto_1518 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1517 ?auto_1518 ) ( SURFACE-AT ?auto_1515 ?auto_1518 ) ( CLEAR ?auto_1515 ) ( LIFTING ?auto_1517 ?auto_1516 ) ( IS-CRATE ?auto_1516 ) ( not ( = ?auto_1515 ?auto_1516 ) ) )
    :subtasks
    ( ( !DROP ?auto_1517 ?auto_1516 ?auto_1515 ?auto_1518 )
      ( MAKE-1CRATE-VERIFY ?auto_1515 ?auto_1516 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1519 - SURFACE
      ?auto_1520 - SURFACE
      ?auto_1521 - SURFACE
    )
    :vars
    (
      ?auto_1522 - HOIST
      ?auto_1523 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1522 ?auto_1523 ) ( SURFACE-AT ?auto_1520 ?auto_1523 ) ( CLEAR ?auto_1520 ) ( LIFTING ?auto_1522 ?auto_1521 ) ( IS-CRATE ?auto_1521 ) ( not ( = ?auto_1520 ?auto_1521 ) ) ( ON ?auto_1520 ?auto_1519 ) ( not ( = ?auto_1519 ?auto_1520 ) ) ( not ( = ?auto_1519 ?auto_1521 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1520 ?auto_1521 )
      ( MAKE-2CRATE-VERIFY ?auto_1519 ?auto_1520 ?auto_1521 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1524 - SURFACE
      ?auto_1525 - SURFACE
    )
    :vars
    (
      ?auto_1526 - HOIST
      ?auto_1527 - PLACE
      ?auto_1528 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1526 ?auto_1527 ) ( SURFACE-AT ?auto_1524 ?auto_1527 ) ( CLEAR ?auto_1524 ) ( IS-CRATE ?auto_1525 ) ( not ( = ?auto_1524 ?auto_1525 ) ) ( TRUCK-AT ?auto_1528 ?auto_1527 ) ( AVAILABLE ?auto_1526 ) ( IN ?auto_1525 ?auto_1528 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1526 ?auto_1525 ?auto_1528 ?auto_1527 )
      ( MAKE-1CRATE ?auto_1524 ?auto_1525 )
      ( MAKE-1CRATE-VERIFY ?auto_1524 ?auto_1525 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1529 - SURFACE
      ?auto_1530 - SURFACE
      ?auto_1531 - SURFACE
    )
    :vars
    (
      ?auto_1534 - HOIST
      ?auto_1532 - PLACE
      ?auto_1533 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1534 ?auto_1532 ) ( SURFACE-AT ?auto_1530 ?auto_1532 ) ( CLEAR ?auto_1530 ) ( IS-CRATE ?auto_1531 ) ( not ( = ?auto_1530 ?auto_1531 ) ) ( TRUCK-AT ?auto_1533 ?auto_1532 ) ( AVAILABLE ?auto_1534 ) ( IN ?auto_1531 ?auto_1533 ) ( ON ?auto_1530 ?auto_1529 ) ( not ( = ?auto_1529 ?auto_1530 ) ) ( not ( = ?auto_1529 ?auto_1531 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1530 ?auto_1531 )
      ( MAKE-2CRATE-VERIFY ?auto_1529 ?auto_1530 ?auto_1531 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1535 - SURFACE
      ?auto_1536 - SURFACE
    )
    :vars
    (
      ?auto_1539 - HOIST
      ?auto_1537 - PLACE
      ?auto_1540 - TRUCK
      ?auto_1538 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1539 ?auto_1537 ) ( IS-CRATE ?auto_1536 ) ( not ( = ?auto_1535 ?auto_1536 ) ) ( TRUCK-AT ?auto_1540 ?auto_1537 ) ( IN ?auto_1536 ?auto_1540 ) ( not ( = ?auto_1538 ?auto_1535 ) ) ( not ( = ?auto_1538 ?auto_1536 ) ) ( SURFACE-AT ?auto_1538 ?auto_1537 ) ( CLEAR ?auto_1538 ) ( LIFTING ?auto_1539 ?auto_1535 ) ( IS-CRATE ?auto_1535 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1538 ?auto_1535 )
      ( MAKE-2CRATE ?auto_1538 ?auto_1535 ?auto_1536 )
      ( MAKE-1CRATE-VERIFY ?auto_1535 ?auto_1536 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1541 - SURFACE
      ?auto_1542 - SURFACE
      ?auto_1543 - SURFACE
    )
    :vars
    (
      ?auto_1544 - HOIST
      ?auto_1545 - PLACE
      ?auto_1546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1544 ?auto_1545 ) ( IS-CRATE ?auto_1543 ) ( not ( = ?auto_1542 ?auto_1543 ) ) ( TRUCK-AT ?auto_1546 ?auto_1545 ) ( IN ?auto_1543 ?auto_1546 ) ( not ( = ?auto_1541 ?auto_1542 ) ) ( not ( = ?auto_1541 ?auto_1543 ) ) ( SURFACE-AT ?auto_1541 ?auto_1545 ) ( CLEAR ?auto_1541 ) ( LIFTING ?auto_1544 ?auto_1542 ) ( IS-CRATE ?auto_1542 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1542 ?auto_1543 )
      ( MAKE-2CRATE-VERIFY ?auto_1541 ?auto_1542 ?auto_1543 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1547 - SURFACE
      ?auto_1548 - SURFACE
    )
    :vars
    (
      ?auto_1551 - HOIST
      ?auto_1549 - PLACE
      ?auto_1550 - TRUCK
      ?auto_1552 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1551 ?auto_1549 ) ( IS-CRATE ?auto_1548 ) ( not ( = ?auto_1547 ?auto_1548 ) ) ( TRUCK-AT ?auto_1550 ?auto_1549 ) ( IN ?auto_1548 ?auto_1550 ) ( not ( = ?auto_1552 ?auto_1547 ) ) ( not ( = ?auto_1552 ?auto_1548 ) ) ( SURFACE-AT ?auto_1552 ?auto_1549 ) ( CLEAR ?auto_1552 ) ( IS-CRATE ?auto_1547 ) ( AVAILABLE ?auto_1551 ) ( IN ?auto_1547 ?auto_1550 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1551 ?auto_1547 ?auto_1550 ?auto_1549 )
      ( MAKE-2CRATE ?auto_1552 ?auto_1547 ?auto_1548 )
      ( MAKE-1CRATE-VERIFY ?auto_1547 ?auto_1548 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1553 - SURFACE
      ?auto_1554 - SURFACE
      ?auto_1555 - SURFACE
    )
    :vars
    (
      ?auto_1556 - HOIST
      ?auto_1557 - PLACE
      ?auto_1558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1556 ?auto_1557 ) ( IS-CRATE ?auto_1555 ) ( not ( = ?auto_1554 ?auto_1555 ) ) ( TRUCK-AT ?auto_1558 ?auto_1557 ) ( IN ?auto_1555 ?auto_1558 ) ( not ( = ?auto_1553 ?auto_1554 ) ) ( not ( = ?auto_1553 ?auto_1555 ) ) ( SURFACE-AT ?auto_1553 ?auto_1557 ) ( CLEAR ?auto_1553 ) ( IS-CRATE ?auto_1554 ) ( AVAILABLE ?auto_1556 ) ( IN ?auto_1554 ?auto_1558 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1554 ?auto_1555 )
      ( MAKE-2CRATE-VERIFY ?auto_1553 ?auto_1554 ?auto_1555 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1559 - SURFACE
      ?auto_1560 - SURFACE
    )
    :vars
    (
      ?auto_1561 - HOIST
      ?auto_1563 - PLACE
      ?auto_1564 - TRUCK
      ?auto_1562 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1561 ?auto_1563 ) ( IS-CRATE ?auto_1560 ) ( not ( = ?auto_1559 ?auto_1560 ) ) ( TRUCK-AT ?auto_1564 ?auto_1563 ) ( not ( = ?auto_1562 ?auto_1559 ) ) ( not ( = ?auto_1562 ?auto_1560 ) ) ( SURFACE-AT ?auto_1562 ?auto_1563 ) ( CLEAR ?auto_1562 ) ( IS-CRATE ?auto_1559 ) ( IN ?auto_1559 ?auto_1564 ) ( LIFTING ?auto_1561 ?auto_1560 ) )
    :subtasks
    ( ( !LOAD ?auto_1561 ?auto_1560 ?auto_1564 ?auto_1563 )
      ( MAKE-2CRATE ?auto_1562 ?auto_1559 ?auto_1560 )
      ( MAKE-1CRATE-VERIFY ?auto_1559 ?auto_1560 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1565 - SURFACE
      ?auto_1566 - SURFACE
      ?auto_1567 - SURFACE
    )
    :vars
    (
      ?auto_1570 - HOIST
      ?auto_1568 - PLACE
      ?auto_1569 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1570 ?auto_1568 ) ( IS-CRATE ?auto_1567 ) ( not ( = ?auto_1566 ?auto_1567 ) ) ( TRUCK-AT ?auto_1569 ?auto_1568 ) ( not ( = ?auto_1565 ?auto_1566 ) ) ( not ( = ?auto_1565 ?auto_1567 ) ) ( SURFACE-AT ?auto_1565 ?auto_1568 ) ( CLEAR ?auto_1565 ) ( IS-CRATE ?auto_1566 ) ( IN ?auto_1566 ?auto_1569 ) ( LIFTING ?auto_1570 ?auto_1567 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1566 ?auto_1567 )
      ( MAKE-2CRATE-VERIFY ?auto_1565 ?auto_1566 ?auto_1567 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1571 - SURFACE
      ?auto_1572 - SURFACE
    )
    :vars
    (
      ?auto_1576 - HOIST
      ?auto_1573 - PLACE
      ?auto_1575 - TRUCK
      ?auto_1574 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1576 ?auto_1573 ) ( IS-CRATE ?auto_1572 ) ( not ( = ?auto_1571 ?auto_1572 ) ) ( TRUCK-AT ?auto_1575 ?auto_1573 ) ( not ( = ?auto_1574 ?auto_1571 ) ) ( not ( = ?auto_1574 ?auto_1572 ) ) ( SURFACE-AT ?auto_1574 ?auto_1573 ) ( IS-CRATE ?auto_1571 ) ( IN ?auto_1571 ?auto_1575 ) ( AVAILABLE ?auto_1576 ) ( SURFACE-AT ?auto_1572 ?auto_1573 ) ( ON ?auto_1572 ?auto_1574 ) ( CLEAR ?auto_1572 ) )
    :subtasks
    ( ( !LIFT ?auto_1576 ?auto_1572 ?auto_1574 ?auto_1573 )
      ( MAKE-2CRATE ?auto_1574 ?auto_1571 ?auto_1572 )
      ( MAKE-1CRATE-VERIFY ?auto_1571 ?auto_1572 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1577 - SURFACE
      ?auto_1578 - SURFACE
      ?auto_1579 - SURFACE
    )
    :vars
    (
      ?auto_1581 - HOIST
      ?auto_1580 - PLACE
      ?auto_1582 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1581 ?auto_1580 ) ( IS-CRATE ?auto_1579 ) ( not ( = ?auto_1578 ?auto_1579 ) ) ( TRUCK-AT ?auto_1582 ?auto_1580 ) ( not ( = ?auto_1577 ?auto_1578 ) ) ( not ( = ?auto_1577 ?auto_1579 ) ) ( SURFACE-AT ?auto_1577 ?auto_1580 ) ( IS-CRATE ?auto_1578 ) ( IN ?auto_1578 ?auto_1582 ) ( AVAILABLE ?auto_1581 ) ( SURFACE-AT ?auto_1579 ?auto_1580 ) ( ON ?auto_1579 ?auto_1577 ) ( CLEAR ?auto_1579 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1578 ?auto_1579 )
      ( MAKE-2CRATE-VERIFY ?auto_1577 ?auto_1578 ?auto_1579 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1583 - SURFACE
      ?auto_1584 - SURFACE
    )
    :vars
    (
      ?auto_1585 - HOIST
      ?auto_1586 - PLACE
      ?auto_1587 - TRUCK
      ?auto_1588 - SURFACE
      ?auto_1589 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1585 ?auto_1586 ) ( IS-CRATE ?auto_1584 ) ( not ( = ?auto_1583 ?auto_1584 ) ) ( TRUCK-AT ?auto_1587 ?auto_1586 ) ( not ( = ?auto_1588 ?auto_1583 ) ) ( not ( = ?auto_1588 ?auto_1584 ) ) ( SURFACE-AT ?auto_1588 ?auto_1586 ) ( IS-CRATE ?auto_1583 ) ( IN ?auto_1583 ?auto_1587 ) ( SURFACE-AT ?auto_1584 ?auto_1586 ) ( ON ?auto_1584 ?auto_1588 ) ( CLEAR ?auto_1584 ) ( LIFTING ?auto_1585 ?auto_1589 ) ( IS-CRATE ?auto_1589 ) ( not ( = ?auto_1583 ?auto_1589 ) ) ( not ( = ?auto_1584 ?auto_1589 ) ) ( not ( = ?auto_1588 ?auto_1589 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1585 ?auto_1589 ?auto_1587 ?auto_1586 )
      ( MAKE-2CRATE ?auto_1588 ?auto_1583 ?auto_1584 )
      ( MAKE-1CRATE-VERIFY ?auto_1583 ?auto_1584 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1590 - SURFACE
      ?auto_1591 - SURFACE
      ?auto_1592 - SURFACE
    )
    :vars
    (
      ?auto_1593 - HOIST
      ?auto_1596 - PLACE
      ?auto_1594 - TRUCK
      ?auto_1595 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1593 ?auto_1596 ) ( IS-CRATE ?auto_1592 ) ( not ( = ?auto_1591 ?auto_1592 ) ) ( TRUCK-AT ?auto_1594 ?auto_1596 ) ( not ( = ?auto_1590 ?auto_1591 ) ) ( not ( = ?auto_1590 ?auto_1592 ) ) ( SURFACE-AT ?auto_1590 ?auto_1596 ) ( IS-CRATE ?auto_1591 ) ( IN ?auto_1591 ?auto_1594 ) ( SURFACE-AT ?auto_1592 ?auto_1596 ) ( ON ?auto_1592 ?auto_1590 ) ( CLEAR ?auto_1592 ) ( LIFTING ?auto_1593 ?auto_1595 ) ( IS-CRATE ?auto_1595 ) ( not ( = ?auto_1591 ?auto_1595 ) ) ( not ( = ?auto_1592 ?auto_1595 ) ) ( not ( = ?auto_1590 ?auto_1595 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1591 ?auto_1592 )
      ( MAKE-2CRATE-VERIFY ?auto_1590 ?auto_1591 ?auto_1592 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1597 - SURFACE
      ?auto_1598 - SURFACE
    )
    :vars
    (
      ?auto_1599 - HOIST
      ?auto_1601 - PLACE
      ?auto_1600 - TRUCK
      ?auto_1602 - SURFACE
      ?auto_1603 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1599 ?auto_1601 ) ( IS-CRATE ?auto_1598 ) ( not ( = ?auto_1597 ?auto_1598 ) ) ( TRUCK-AT ?auto_1600 ?auto_1601 ) ( not ( = ?auto_1602 ?auto_1597 ) ) ( not ( = ?auto_1602 ?auto_1598 ) ) ( SURFACE-AT ?auto_1602 ?auto_1601 ) ( IS-CRATE ?auto_1597 ) ( IN ?auto_1597 ?auto_1600 ) ( SURFACE-AT ?auto_1598 ?auto_1601 ) ( ON ?auto_1598 ?auto_1602 ) ( IS-CRATE ?auto_1603 ) ( not ( = ?auto_1597 ?auto_1603 ) ) ( not ( = ?auto_1598 ?auto_1603 ) ) ( not ( = ?auto_1602 ?auto_1603 ) ) ( AVAILABLE ?auto_1599 ) ( SURFACE-AT ?auto_1603 ?auto_1601 ) ( ON ?auto_1603 ?auto_1598 ) ( CLEAR ?auto_1603 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1602 ?auto_1598 )
      ( MAKE-2CRATE ?auto_1602 ?auto_1597 ?auto_1598 )
      ( MAKE-1CRATE-VERIFY ?auto_1597 ?auto_1598 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1604 - SURFACE
      ?auto_1605 - SURFACE
      ?auto_1606 - SURFACE
    )
    :vars
    (
      ?auto_1609 - HOIST
      ?auto_1607 - PLACE
      ?auto_1608 - TRUCK
      ?auto_1610 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1609 ?auto_1607 ) ( IS-CRATE ?auto_1606 ) ( not ( = ?auto_1605 ?auto_1606 ) ) ( TRUCK-AT ?auto_1608 ?auto_1607 ) ( not ( = ?auto_1604 ?auto_1605 ) ) ( not ( = ?auto_1604 ?auto_1606 ) ) ( SURFACE-AT ?auto_1604 ?auto_1607 ) ( IS-CRATE ?auto_1605 ) ( IN ?auto_1605 ?auto_1608 ) ( SURFACE-AT ?auto_1606 ?auto_1607 ) ( ON ?auto_1606 ?auto_1604 ) ( IS-CRATE ?auto_1610 ) ( not ( = ?auto_1605 ?auto_1610 ) ) ( not ( = ?auto_1606 ?auto_1610 ) ) ( not ( = ?auto_1604 ?auto_1610 ) ) ( AVAILABLE ?auto_1609 ) ( SURFACE-AT ?auto_1610 ?auto_1607 ) ( ON ?auto_1610 ?auto_1606 ) ( CLEAR ?auto_1610 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1605 ?auto_1606 )
      ( MAKE-2CRATE-VERIFY ?auto_1604 ?auto_1605 ?auto_1606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1611 - SURFACE
      ?auto_1612 - SURFACE
    )
    :vars
    (
      ?auto_1615 - HOIST
      ?auto_1617 - PLACE
      ?auto_1616 - SURFACE
      ?auto_1613 - TRUCK
      ?auto_1614 - SURFACE
      ?auto_1618 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1615 ?auto_1617 ) ( IS-CRATE ?auto_1612 ) ( not ( = ?auto_1611 ?auto_1612 ) ) ( not ( = ?auto_1616 ?auto_1611 ) ) ( not ( = ?auto_1616 ?auto_1612 ) ) ( SURFACE-AT ?auto_1616 ?auto_1617 ) ( IS-CRATE ?auto_1611 ) ( IN ?auto_1611 ?auto_1613 ) ( SURFACE-AT ?auto_1612 ?auto_1617 ) ( ON ?auto_1612 ?auto_1616 ) ( IS-CRATE ?auto_1614 ) ( not ( = ?auto_1611 ?auto_1614 ) ) ( not ( = ?auto_1612 ?auto_1614 ) ) ( not ( = ?auto_1616 ?auto_1614 ) ) ( AVAILABLE ?auto_1615 ) ( SURFACE-AT ?auto_1614 ?auto_1617 ) ( ON ?auto_1614 ?auto_1612 ) ( CLEAR ?auto_1614 ) ( TRUCK-AT ?auto_1613 ?auto_1618 ) ( not ( = ?auto_1618 ?auto_1617 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1613 ?auto_1618 ?auto_1617 )
      ( MAKE-2CRATE ?auto_1616 ?auto_1611 ?auto_1612 )
      ( MAKE-1CRATE-VERIFY ?auto_1611 ?auto_1612 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1619 - SURFACE
      ?auto_1620 - SURFACE
      ?auto_1621 - SURFACE
    )
    :vars
    (
      ?auto_1624 - HOIST
      ?auto_1623 - PLACE
      ?auto_1622 - TRUCK
      ?auto_1626 - SURFACE
      ?auto_1625 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1624 ?auto_1623 ) ( IS-CRATE ?auto_1621 ) ( not ( = ?auto_1620 ?auto_1621 ) ) ( not ( = ?auto_1619 ?auto_1620 ) ) ( not ( = ?auto_1619 ?auto_1621 ) ) ( SURFACE-AT ?auto_1619 ?auto_1623 ) ( IS-CRATE ?auto_1620 ) ( IN ?auto_1620 ?auto_1622 ) ( SURFACE-AT ?auto_1621 ?auto_1623 ) ( ON ?auto_1621 ?auto_1619 ) ( IS-CRATE ?auto_1626 ) ( not ( = ?auto_1620 ?auto_1626 ) ) ( not ( = ?auto_1621 ?auto_1626 ) ) ( not ( = ?auto_1619 ?auto_1626 ) ) ( AVAILABLE ?auto_1624 ) ( SURFACE-AT ?auto_1626 ?auto_1623 ) ( ON ?auto_1626 ?auto_1621 ) ( CLEAR ?auto_1626 ) ( TRUCK-AT ?auto_1622 ?auto_1625 ) ( not ( = ?auto_1625 ?auto_1623 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1620 ?auto_1621 )
      ( MAKE-2CRATE-VERIFY ?auto_1619 ?auto_1620 ?auto_1621 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1659 - SURFACE
      ?auto_1660 - SURFACE
    )
    :vars
    (
      ?auto_1663 - HOIST
      ?auto_1661 - PLACE
      ?auto_1666 - SURFACE
      ?auto_1662 - TRUCK
      ?auto_1665 - SURFACE
      ?auto_1664 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1663 ?auto_1661 ) ( IS-CRATE ?auto_1660 ) ( not ( = ?auto_1659 ?auto_1660 ) ) ( not ( = ?auto_1666 ?auto_1659 ) ) ( not ( = ?auto_1666 ?auto_1660 ) ) ( SURFACE-AT ?auto_1666 ?auto_1661 ) ( IS-CRATE ?auto_1659 ) ( IN ?auto_1659 ?auto_1662 ) ( SURFACE-AT ?auto_1660 ?auto_1661 ) ( ON ?auto_1660 ?auto_1666 ) ( IS-CRATE ?auto_1665 ) ( not ( = ?auto_1659 ?auto_1665 ) ) ( not ( = ?auto_1660 ?auto_1665 ) ) ( not ( = ?auto_1666 ?auto_1665 ) ) ( AVAILABLE ?auto_1663 ) ( SURFACE-AT ?auto_1665 ?auto_1661 ) ( ON ?auto_1665 ?auto_1660 ) ( CLEAR ?auto_1665 ) ( not ( = ?auto_1664 ?auto_1661 ) ) ( TRUCK-AT ?auto_1662 ?auto_1661 ) )
    :subtasks
    ( ( !DRIVE ?auto_1662 ?auto_1661 ?auto_1664 )
      ( MAKE-2CRATE ?auto_1666 ?auto_1659 ?auto_1660 )
      ( MAKE-1CRATE-VERIFY ?auto_1659 ?auto_1660 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1667 - SURFACE
      ?auto_1668 - SURFACE
      ?auto_1669 - SURFACE
    )
    :vars
    (
      ?auto_1671 - HOIST
      ?auto_1672 - PLACE
      ?auto_1674 - TRUCK
      ?auto_1673 - SURFACE
      ?auto_1670 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1671 ?auto_1672 ) ( IS-CRATE ?auto_1669 ) ( not ( = ?auto_1668 ?auto_1669 ) ) ( not ( = ?auto_1667 ?auto_1668 ) ) ( not ( = ?auto_1667 ?auto_1669 ) ) ( SURFACE-AT ?auto_1667 ?auto_1672 ) ( IS-CRATE ?auto_1668 ) ( IN ?auto_1668 ?auto_1674 ) ( SURFACE-AT ?auto_1669 ?auto_1672 ) ( ON ?auto_1669 ?auto_1667 ) ( IS-CRATE ?auto_1673 ) ( not ( = ?auto_1668 ?auto_1673 ) ) ( not ( = ?auto_1669 ?auto_1673 ) ) ( not ( = ?auto_1667 ?auto_1673 ) ) ( AVAILABLE ?auto_1671 ) ( SURFACE-AT ?auto_1673 ?auto_1672 ) ( ON ?auto_1673 ?auto_1669 ) ( CLEAR ?auto_1673 ) ( not ( = ?auto_1670 ?auto_1672 ) ) ( TRUCK-AT ?auto_1674 ?auto_1672 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1668 ?auto_1669 )
      ( MAKE-2CRATE-VERIFY ?auto_1667 ?auto_1668 ?auto_1669 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1675 - SURFACE
      ?auto_1676 - SURFACE
    )
    :vars
    (
      ?auto_1679 - HOIST
      ?auto_1682 - PLACE
      ?auto_1677 - SURFACE
      ?auto_1680 - TRUCK
      ?auto_1681 - SURFACE
      ?auto_1678 - PLACE
      ?auto_1684 - SURFACE
      ?auto_1683 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1679 ?auto_1682 ) ( IS-CRATE ?auto_1676 ) ( not ( = ?auto_1675 ?auto_1676 ) ) ( not ( = ?auto_1677 ?auto_1675 ) ) ( not ( = ?auto_1677 ?auto_1676 ) ) ( SURFACE-AT ?auto_1677 ?auto_1682 ) ( IS-CRATE ?auto_1675 ) ( IN ?auto_1675 ?auto_1680 ) ( SURFACE-AT ?auto_1676 ?auto_1682 ) ( ON ?auto_1676 ?auto_1677 ) ( IS-CRATE ?auto_1681 ) ( not ( = ?auto_1675 ?auto_1681 ) ) ( not ( = ?auto_1676 ?auto_1681 ) ) ( not ( = ?auto_1677 ?auto_1681 ) ) ( SURFACE-AT ?auto_1681 ?auto_1682 ) ( ON ?auto_1681 ?auto_1676 ) ( CLEAR ?auto_1681 ) ( not ( = ?auto_1678 ?auto_1682 ) ) ( TRUCK-AT ?auto_1680 ?auto_1682 ) ( SURFACE-AT ?auto_1684 ?auto_1682 ) ( CLEAR ?auto_1684 ) ( LIFTING ?auto_1679 ?auto_1683 ) ( IS-CRATE ?auto_1683 ) ( not ( = ?auto_1675 ?auto_1684 ) ) ( not ( = ?auto_1675 ?auto_1683 ) ) ( not ( = ?auto_1676 ?auto_1684 ) ) ( not ( = ?auto_1676 ?auto_1683 ) ) ( not ( = ?auto_1677 ?auto_1684 ) ) ( not ( = ?auto_1677 ?auto_1683 ) ) ( not ( = ?auto_1681 ?auto_1684 ) ) ( not ( = ?auto_1681 ?auto_1683 ) ) ( not ( = ?auto_1684 ?auto_1683 ) ) )
    :subtasks
    ( ( !DROP ?auto_1679 ?auto_1683 ?auto_1684 ?auto_1682 )
      ( MAKE-2CRATE ?auto_1677 ?auto_1675 ?auto_1676 )
      ( MAKE-1CRATE-VERIFY ?auto_1675 ?auto_1676 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1685 - SURFACE
      ?auto_1686 - SURFACE
      ?auto_1687 - SURFACE
    )
    :vars
    (
      ?auto_1691 - HOIST
      ?auto_1692 - PLACE
      ?auto_1694 - TRUCK
      ?auto_1688 - SURFACE
      ?auto_1693 - PLACE
      ?auto_1690 - SURFACE
      ?auto_1689 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1691 ?auto_1692 ) ( IS-CRATE ?auto_1687 ) ( not ( = ?auto_1686 ?auto_1687 ) ) ( not ( = ?auto_1685 ?auto_1686 ) ) ( not ( = ?auto_1685 ?auto_1687 ) ) ( SURFACE-AT ?auto_1685 ?auto_1692 ) ( IS-CRATE ?auto_1686 ) ( IN ?auto_1686 ?auto_1694 ) ( SURFACE-AT ?auto_1687 ?auto_1692 ) ( ON ?auto_1687 ?auto_1685 ) ( IS-CRATE ?auto_1688 ) ( not ( = ?auto_1686 ?auto_1688 ) ) ( not ( = ?auto_1687 ?auto_1688 ) ) ( not ( = ?auto_1685 ?auto_1688 ) ) ( SURFACE-AT ?auto_1688 ?auto_1692 ) ( ON ?auto_1688 ?auto_1687 ) ( CLEAR ?auto_1688 ) ( not ( = ?auto_1693 ?auto_1692 ) ) ( TRUCK-AT ?auto_1694 ?auto_1692 ) ( SURFACE-AT ?auto_1690 ?auto_1692 ) ( CLEAR ?auto_1690 ) ( LIFTING ?auto_1691 ?auto_1689 ) ( IS-CRATE ?auto_1689 ) ( not ( = ?auto_1686 ?auto_1690 ) ) ( not ( = ?auto_1686 ?auto_1689 ) ) ( not ( = ?auto_1687 ?auto_1690 ) ) ( not ( = ?auto_1687 ?auto_1689 ) ) ( not ( = ?auto_1685 ?auto_1690 ) ) ( not ( = ?auto_1685 ?auto_1689 ) ) ( not ( = ?auto_1688 ?auto_1690 ) ) ( not ( = ?auto_1688 ?auto_1689 ) ) ( not ( = ?auto_1690 ?auto_1689 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1686 ?auto_1687 )
      ( MAKE-2CRATE-VERIFY ?auto_1685 ?auto_1686 ?auto_1687 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1695 - SURFACE
      ?auto_1696 - SURFACE
    )
    :vars
    (
      ?auto_1697 - HOIST
      ?auto_1702 - PLACE
      ?auto_1704 - SURFACE
      ?auto_1703 - TRUCK
      ?auto_1701 - SURFACE
      ?auto_1698 - PLACE
      ?auto_1699 - SURFACE
      ?auto_1700 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1697 ?auto_1702 ) ( IS-CRATE ?auto_1696 ) ( not ( = ?auto_1695 ?auto_1696 ) ) ( not ( = ?auto_1704 ?auto_1695 ) ) ( not ( = ?auto_1704 ?auto_1696 ) ) ( SURFACE-AT ?auto_1704 ?auto_1702 ) ( IS-CRATE ?auto_1695 ) ( IN ?auto_1695 ?auto_1703 ) ( SURFACE-AT ?auto_1696 ?auto_1702 ) ( ON ?auto_1696 ?auto_1704 ) ( IS-CRATE ?auto_1701 ) ( not ( = ?auto_1695 ?auto_1701 ) ) ( not ( = ?auto_1696 ?auto_1701 ) ) ( not ( = ?auto_1704 ?auto_1701 ) ) ( SURFACE-AT ?auto_1701 ?auto_1702 ) ( ON ?auto_1701 ?auto_1696 ) ( CLEAR ?auto_1701 ) ( not ( = ?auto_1698 ?auto_1702 ) ) ( TRUCK-AT ?auto_1703 ?auto_1702 ) ( SURFACE-AT ?auto_1699 ?auto_1702 ) ( CLEAR ?auto_1699 ) ( IS-CRATE ?auto_1700 ) ( not ( = ?auto_1695 ?auto_1699 ) ) ( not ( = ?auto_1695 ?auto_1700 ) ) ( not ( = ?auto_1696 ?auto_1699 ) ) ( not ( = ?auto_1696 ?auto_1700 ) ) ( not ( = ?auto_1704 ?auto_1699 ) ) ( not ( = ?auto_1704 ?auto_1700 ) ) ( not ( = ?auto_1701 ?auto_1699 ) ) ( not ( = ?auto_1701 ?auto_1700 ) ) ( not ( = ?auto_1699 ?auto_1700 ) ) ( AVAILABLE ?auto_1697 ) ( IN ?auto_1700 ?auto_1703 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1697 ?auto_1700 ?auto_1703 ?auto_1702 )
      ( MAKE-2CRATE ?auto_1704 ?auto_1695 ?auto_1696 )
      ( MAKE-1CRATE-VERIFY ?auto_1695 ?auto_1696 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1705 - SURFACE
      ?auto_1706 - SURFACE
      ?auto_1707 - SURFACE
    )
    :vars
    (
      ?auto_1712 - HOIST
      ?auto_1711 - PLACE
      ?auto_1710 - TRUCK
      ?auto_1714 - SURFACE
      ?auto_1709 - PLACE
      ?auto_1708 - SURFACE
      ?auto_1713 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1712 ?auto_1711 ) ( IS-CRATE ?auto_1707 ) ( not ( = ?auto_1706 ?auto_1707 ) ) ( not ( = ?auto_1705 ?auto_1706 ) ) ( not ( = ?auto_1705 ?auto_1707 ) ) ( SURFACE-AT ?auto_1705 ?auto_1711 ) ( IS-CRATE ?auto_1706 ) ( IN ?auto_1706 ?auto_1710 ) ( SURFACE-AT ?auto_1707 ?auto_1711 ) ( ON ?auto_1707 ?auto_1705 ) ( IS-CRATE ?auto_1714 ) ( not ( = ?auto_1706 ?auto_1714 ) ) ( not ( = ?auto_1707 ?auto_1714 ) ) ( not ( = ?auto_1705 ?auto_1714 ) ) ( SURFACE-AT ?auto_1714 ?auto_1711 ) ( ON ?auto_1714 ?auto_1707 ) ( CLEAR ?auto_1714 ) ( not ( = ?auto_1709 ?auto_1711 ) ) ( TRUCK-AT ?auto_1710 ?auto_1711 ) ( SURFACE-AT ?auto_1708 ?auto_1711 ) ( CLEAR ?auto_1708 ) ( IS-CRATE ?auto_1713 ) ( not ( = ?auto_1706 ?auto_1708 ) ) ( not ( = ?auto_1706 ?auto_1713 ) ) ( not ( = ?auto_1707 ?auto_1708 ) ) ( not ( = ?auto_1707 ?auto_1713 ) ) ( not ( = ?auto_1705 ?auto_1708 ) ) ( not ( = ?auto_1705 ?auto_1713 ) ) ( not ( = ?auto_1714 ?auto_1708 ) ) ( not ( = ?auto_1714 ?auto_1713 ) ) ( not ( = ?auto_1708 ?auto_1713 ) ) ( AVAILABLE ?auto_1712 ) ( IN ?auto_1713 ?auto_1710 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1706 ?auto_1707 )
      ( MAKE-2CRATE-VERIFY ?auto_1705 ?auto_1706 ?auto_1707 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1715 - SURFACE
      ?auto_1716 - SURFACE
    )
    :vars
    (
      ?auto_1719 - HOIST
      ?auto_1718 - PLACE
      ?auto_1722 - SURFACE
      ?auto_1721 - SURFACE
      ?auto_1723 - PLACE
      ?auto_1724 - TRUCK
      ?auto_1717 - SURFACE
      ?auto_1720 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1719 ?auto_1718 ) ( IS-CRATE ?auto_1716 ) ( not ( = ?auto_1715 ?auto_1716 ) ) ( not ( = ?auto_1722 ?auto_1715 ) ) ( not ( = ?auto_1722 ?auto_1716 ) ) ( SURFACE-AT ?auto_1722 ?auto_1718 ) ( IS-CRATE ?auto_1715 ) ( SURFACE-AT ?auto_1716 ?auto_1718 ) ( ON ?auto_1716 ?auto_1722 ) ( IS-CRATE ?auto_1721 ) ( not ( = ?auto_1715 ?auto_1721 ) ) ( not ( = ?auto_1716 ?auto_1721 ) ) ( not ( = ?auto_1722 ?auto_1721 ) ) ( SURFACE-AT ?auto_1721 ?auto_1718 ) ( ON ?auto_1721 ?auto_1716 ) ( CLEAR ?auto_1721 ) ( not ( = ?auto_1723 ?auto_1718 ) ) ( TRUCK-AT ?auto_1724 ?auto_1718 ) ( SURFACE-AT ?auto_1717 ?auto_1718 ) ( CLEAR ?auto_1717 ) ( IS-CRATE ?auto_1720 ) ( not ( = ?auto_1715 ?auto_1717 ) ) ( not ( = ?auto_1715 ?auto_1720 ) ) ( not ( = ?auto_1716 ?auto_1717 ) ) ( not ( = ?auto_1716 ?auto_1720 ) ) ( not ( = ?auto_1722 ?auto_1717 ) ) ( not ( = ?auto_1722 ?auto_1720 ) ) ( not ( = ?auto_1721 ?auto_1717 ) ) ( not ( = ?auto_1721 ?auto_1720 ) ) ( not ( = ?auto_1717 ?auto_1720 ) ) ( IN ?auto_1720 ?auto_1724 ) ( LIFTING ?auto_1719 ?auto_1715 ) )
    :subtasks
    ( ( !LOAD ?auto_1719 ?auto_1715 ?auto_1724 ?auto_1718 )
      ( MAKE-2CRATE ?auto_1722 ?auto_1715 ?auto_1716 )
      ( MAKE-1CRATE-VERIFY ?auto_1715 ?auto_1716 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1725 - SURFACE
      ?auto_1726 - SURFACE
      ?auto_1727 - SURFACE
    )
    :vars
    (
      ?auto_1732 - HOIST
      ?auto_1728 - PLACE
      ?auto_1731 - SURFACE
      ?auto_1733 - PLACE
      ?auto_1734 - TRUCK
      ?auto_1729 - SURFACE
      ?auto_1730 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1732 ?auto_1728 ) ( IS-CRATE ?auto_1727 ) ( not ( = ?auto_1726 ?auto_1727 ) ) ( not ( = ?auto_1725 ?auto_1726 ) ) ( not ( = ?auto_1725 ?auto_1727 ) ) ( SURFACE-AT ?auto_1725 ?auto_1728 ) ( IS-CRATE ?auto_1726 ) ( SURFACE-AT ?auto_1727 ?auto_1728 ) ( ON ?auto_1727 ?auto_1725 ) ( IS-CRATE ?auto_1731 ) ( not ( = ?auto_1726 ?auto_1731 ) ) ( not ( = ?auto_1727 ?auto_1731 ) ) ( not ( = ?auto_1725 ?auto_1731 ) ) ( SURFACE-AT ?auto_1731 ?auto_1728 ) ( ON ?auto_1731 ?auto_1727 ) ( CLEAR ?auto_1731 ) ( not ( = ?auto_1733 ?auto_1728 ) ) ( TRUCK-AT ?auto_1734 ?auto_1728 ) ( SURFACE-AT ?auto_1729 ?auto_1728 ) ( CLEAR ?auto_1729 ) ( IS-CRATE ?auto_1730 ) ( not ( = ?auto_1726 ?auto_1729 ) ) ( not ( = ?auto_1726 ?auto_1730 ) ) ( not ( = ?auto_1727 ?auto_1729 ) ) ( not ( = ?auto_1727 ?auto_1730 ) ) ( not ( = ?auto_1725 ?auto_1729 ) ) ( not ( = ?auto_1725 ?auto_1730 ) ) ( not ( = ?auto_1731 ?auto_1729 ) ) ( not ( = ?auto_1731 ?auto_1730 ) ) ( not ( = ?auto_1729 ?auto_1730 ) ) ( IN ?auto_1730 ?auto_1734 ) ( LIFTING ?auto_1732 ?auto_1726 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1726 ?auto_1727 )
      ( MAKE-2CRATE-VERIFY ?auto_1725 ?auto_1726 ?auto_1727 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1735 - SURFACE
      ?auto_1736 - SURFACE
    )
    :vars
    (
      ?auto_1738 - HOIST
      ?auto_1740 - PLACE
      ?auto_1739 - SURFACE
      ?auto_1744 - SURFACE
      ?auto_1741 - PLACE
      ?auto_1743 - TRUCK
      ?auto_1737 - SURFACE
      ?auto_1742 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1738 ?auto_1740 ) ( IS-CRATE ?auto_1736 ) ( not ( = ?auto_1735 ?auto_1736 ) ) ( not ( = ?auto_1739 ?auto_1735 ) ) ( not ( = ?auto_1739 ?auto_1736 ) ) ( SURFACE-AT ?auto_1739 ?auto_1740 ) ( IS-CRATE ?auto_1735 ) ( SURFACE-AT ?auto_1736 ?auto_1740 ) ( ON ?auto_1736 ?auto_1739 ) ( IS-CRATE ?auto_1744 ) ( not ( = ?auto_1735 ?auto_1744 ) ) ( not ( = ?auto_1736 ?auto_1744 ) ) ( not ( = ?auto_1739 ?auto_1744 ) ) ( SURFACE-AT ?auto_1744 ?auto_1740 ) ( ON ?auto_1744 ?auto_1736 ) ( CLEAR ?auto_1744 ) ( not ( = ?auto_1741 ?auto_1740 ) ) ( TRUCK-AT ?auto_1743 ?auto_1740 ) ( SURFACE-AT ?auto_1737 ?auto_1740 ) ( IS-CRATE ?auto_1742 ) ( not ( = ?auto_1735 ?auto_1737 ) ) ( not ( = ?auto_1735 ?auto_1742 ) ) ( not ( = ?auto_1736 ?auto_1737 ) ) ( not ( = ?auto_1736 ?auto_1742 ) ) ( not ( = ?auto_1739 ?auto_1737 ) ) ( not ( = ?auto_1739 ?auto_1742 ) ) ( not ( = ?auto_1744 ?auto_1737 ) ) ( not ( = ?auto_1744 ?auto_1742 ) ) ( not ( = ?auto_1737 ?auto_1742 ) ) ( IN ?auto_1742 ?auto_1743 ) ( AVAILABLE ?auto_1738 ) ( SURFACE-AT ?auto_1735 ?auto_1740 ) ( ON ?auto_1735 ?auto_1737 ) ( CLEAR ?auto_1735 ) )
    :subtasks
    ( ( !LIFT ?auto_1738 ?auto_1735 ?auto_1737 ?auto_1740 )
      ( MAKE-2CRATE ?auto_1739 ?auto_1735 ?auto_1736 )
      ( MAKE-1CRATE-VERIFY ?auto_1735 ?auto_1736 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1745 - SURFACE
      ?auto_1746 - SURFACE
      ?auto_1747 - SURFACE
    )
    :vars
    (
      ?auto_1748 - HOIST
      ?auto_1752 - PLACE
      ?auto_1753 - SURFACE
      ?auto_1749 - PLACE
      ?auto_1750 - TRUCK
      ?auto_1754 - SURFACE
      ?auto_1751 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1748 ?auto_1752 ) ( IS-CRATE ?auto_1747 ) ( not ( = ?auto_1746 ?auto_1747 ) ) ( not ( = ?auto_1745 ?auto_1746 ) ) ( not ( = ?auto_1745 ?auto_1747 ) ) ( SURFACE-AT ?auto_1745 ?auto_1752 ) ( IS-CRATE ?auto_1746 ) ( SURFACE-AT ?auto_1747 ?auto_1752 ) ( ON ?auto_1747 ?auto_1745 ) ( IS-CRATE ?auto_1753 ) ( not ( = ?auto_1746 ?auto_1753 ) ) ( not ( = ?auto_1747 ?auto_1753 ) ) ( not ( = ?auto_1745 ?auto_1753 ) ) ( SURFACE-AT ?auto_1753 ?auto_1752 ) ( ON ?auto_1753 ?auto_1747 ) ( CLEAR ?auto_1753 ) ( not ( = ?auto_1749 ?auto_1752 ) ) ( TRUCK-AT ?auto_1750 ?auto_1752 ) ( SURFACE-AT ?auto_1754 ?auto_1752 ) ( IS-CRATE ?auto_1751 ) ( not ( = ?auto_1746 ?auto_1754 ) ) ( not ( = ?auto_1746 ?auto_1751 ) ) ( not ( = ?auto_1747 ?auto_1754 ) ) ( not ( = ?auto_1747 ?auto_1751 ) ) ( not ( = ?auto_1745 ?auto_1754 ) ) ( not ( = ?auto_1745 ?auto_1751 ) ) ( not ( = ?auto_1753 ?auto_1754 ) ) ( not ( = ?auto_1753 ?auto_1751 ) ) ( not ( = ?auto_1754 ?auto_1751 ) ) ( IN ?auto_1751 ?auto_1750 ) ( AVAILABLE ?auto_1748 ) ( SURFACE-AT ?auto_1746 ?auto_1752 ) ( ON ?auto_1746 ?auto_1754 ) ( CLEAR ?auto_1746 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1746 ?auto_1747 )
      ( MAKE-2CRATE-VERIFY ?auto_1745 ?auto_1746 ?auto_1747 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1755 - SURFACE
      ?auto_1756 - SURFACE
    )
    :vars
    (
      ?auto_1763 - HOIST
      ?auto_1758 - PLACE
      ?auto_1761 - SURFACE
      ?auto_1757 - SURFACE
      ?auto_1760 - PLACE
      ?auto_1762 - TRUCK
      ?auto_1764 - SURFACE
      ?auto_1759 - SURFACE
      ?auto_1765 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1763 ?auto_1758 ) ( IS-CRATE ?auto_1756 ) ( not ( = ?auto_1755 ?auto_1756 ) ) ( not ( = ?auto_1761 ?auto_1755 ) ) ( not ( = ?auto_1761 ?auto_1756 ) ) ( SURFACE-AT ?auto_1761 ?auto_1758 ) ( IS-CRATE ?auto_1755 ) ( SURFACE-AT ?auto_1756 ?auto_1758 ) ( ON ?auto_1756 ?auto_1761 ) ( IS-CRATE ?auto_1757 ) ( not ( = ?auto_1755 ?auto_1757 ) ) ( not ( = ?auto_1756 ?auto_1757 ) ) ( not ( = ?auto_1761 ?auto_1757 ) ) ( SURFACE-AT ?auto_1757 ?auto_1758 ) ( ON ?auto_1757 ?auto_1756 ) ( CLEAR ?auto_1757 ) ( not ( = ?auto_1760 ?auto_1758 ) ) ( TRUCK-AT ?auto_1762 ?auto_1758 ) ( SURFACE-AT ?auto_1764 ?auto_1758 ) ( IS-CRATE ?auto_1759 ) ( not ( = ?auto_1755 ?auto_1764 ) ) ( not ( = ?auto_1755 ?auto_1759 ) ) ( not ( = ?auto_1756 ?auto_1764 ) ) ( not ( = ?auto_1756 ?auto_1759 ) ) ( not ( = ?auto_1761 ?auto_1764 ) ) ( not ( = ?auto_1761 ?auto_1759 ) ) ( not ( = ?auto_1757 ?auto_1764 ) ) ( not ( = ?auto_1757 ?auto_1759 ) ) ( not ( = ?auto_1764 ?auto_1759 ) ) ( IN ?auto_1759 ?auto_1762 ) ( SURFACE-AT ?auto_1755 ?auto_1758 ) ( ON ?auto_1755 ?auto_1764 ) ( CLEAR ?auto_1755 ) ( LIFTING ?auto_1763 ?auto_1765 ) ( IS-CRATE ?auto_1765 ) ( not ( = ?auto_1755 ?auto_1765 ) ) ( not ( = ?auto_1756 ?auto_1765 ) ) ( not ( = ?auto_1761 ?auto_1765 ) ) ( not ( = ?auto_1757 ?auto_1765 ) ) ( not ( = ?auto_1764 ?auto_1765 ) ) ( not ( = ?auto_1759 ?auto_1765 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1763 ?auto_1765 ?auto_1762 ?auto_1758 )
      ( MAKE-2CRATE ?auto_1761 ?auto_1755 ?auto_1756 )
      ( MAKE-1CRATE-VERIFY ?auto_1755 ?auto_1756 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1766 - SURFACE
      ?auto_1767 - SURFACE
      ?auto_1768 - SURFACE
    )
    :vars
    (
      ?auto_1772 - HOIST
      ?auto_1773 - PLACE
      ?auto_1771 - SURFACE
      ?auto_1770 - PLACE
      ?auto_1769 - TRUCK
      ?auto_1775 - SURFACE
      ?auto_1774 - SURFACE
      ?auto_1776 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1772 ?auto_1773 ) ( IS-CRATE ?auto_1768 ) ( not ( = ?auto_1767 ?auto_1768 ) ) ( not ( = ?auto_1766 ?auto_1767 ) ) ( not ( = ?auto_1766 ?auto_1768 ) ) ( SURFACE-AT ?auto_1766 ?auto_1773 ) ( IS-CRATE ?auto_1767 ) ( SURFACE-AT ?auto_1768 ?auto_1773 ) ( ON ?auto_1768 ?auto_1766 ) ( IS-CRATE ?auto_1771 ) ( not ( = ?auto_1767 ?auto_1771 ) ) ( not ( = ?auto_1768 ?auto_1771 ) ) ( not ( = ?auto_1766 ?auto_1771 ) ) ( SURFACE-AT ?auto_1771 ?auto_1773 ) ( ON ?auto_1771 ?auto_1768 ) ( CLEAR ?auto_1771 ) ( not ( = ?auto_1770 ?auto_1773 ) ) ( TRUCK-AT ?auto_1769 ?auto_1773 ) ( SURFACE-AT ?auto_1775 ?auto_1773 ) ( IS-CRATE ?auto_1774 ) ( not ( = ?auto_1767 ?auto_1775 ) ) ( not ( = ?auto_1767 ?auto_1774 ) ) ( not ( = ?auto_1768 ?auto_1775 ) ) ( not ( = ?auto_1768 ?auto_1774 ) ) ( not ( = ?auto_1766 ?auto_1775 ) ) ( not ( = ?auto_1766 ?auto_1774 ) ) ( not ( = ?auto_1771 ?auto_1775 ) ) ( not ( = ?auto_1771 ?auto_1774 ) ) ( not ( = ?auto_1775 ?auto_1774 ) ) ( IN ?auto_1774 ?auto_1769 ) ( SURFACE-AT ?auto_1767 ?auto_1773 ) ( ON ?auto_1767 ?auto_1775 ) ( CLEAR ?auto_1767 ) ( LIFTING ?auto_1772 ?auto_1776 ) ( IS-CRATE ?auto_1776 ) ( not ( = ?auto_1767 ?auto_1776 ) ) ( not ( = ?auto_1768 ?auto_1776 ) ) ( not ( = ?auto_1766 ?auto_1776 ) ) ( not ( = ?auto_1771 ?auto_1776 ) ) ( not ( = ?auto_1775 ?auto_1776 ) ) ( not ( = ?auto_1774 ?auto_1776 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1767 ?auto_1768 )
      ( MAKE-2CRATE-VERIFY ?auto_1766 ?auto_1767 ?auto_1768 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1777 - SURFACE
      ?auto_1778 - SURFACE
    )
    :vars
    (
      ?auto_1786 - HOIST
      ?auto_1782 - PLACE
      ?auto_1787 - SURFACE
      ?auto_1784 - SURFACE
      ?auto_1780 - PLACE
      ?auto_1783 - TRUCK
      ?auto_1785 - SURFACE
      ?auto_1779 - SURFACE
      ?auto_1781 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1786 ?auto_1782 ) ( IS-CRATE ?auto_1778 ) ( not ( = ?auto_1777 ?auto_1778 ) ) ( not ( = ?auto_1787 ?auto_1777 ) ) ( not ( = ?auto_1787 ?auto_1778 ) ) ( SURFACE-AT ?auto_1787 ?auto_1782 ) ( IS-CRATE ?auto_1777 ) ( SURFACE-AT ?auto_1778 ?auto_1782 ) ( ON ?auto_1778 ?auto_1787 ) ( IS-CRATE ?auto_1784 ) ( not ( = ?auto_1777 ?auto_1784 ) ) ( not ( = ?auto_1778 ?auto_1784 ) ) ( not ( = ?auto_1787 ?auto_1784 ) ) ( SURFACE-AT ?auto_1784 ?auto_1782 ) ( ON ?auto_1784 ?auto_1778 ) ( CLEAR ?auto_1784 ) ( not ( = ?auto_1780 ?auto_1782 ) ) ( TRUCK-AT ?auto_1783 ?auto_1782 ) ( SURFACE-AT ?auto_1785 ?auto_1782 ) ( IS-CRATE ?auto_1779 ) ( not ( = ?auto_1777 ?auto_1785 ) ) ( not ( = ?auto_1777 ?auto_1779 ) ) ( not ( = ?auto_1778 ?auto_1785 ) ) ( not ( = ?auto_1778 ?auto_1779 ) ) ( not ( = ?auto_1787 ?auto_1785 ) ) ( not ( = ?auto_1787 ?auto_1779 ) ) ( not ( = ?auto_1784 ?auto_1785 ) ) ( not ( = ?auto_1784 ?auto_1779 ) ) ( not ( = ?auto_1785 ?auto_1779 ) ) ( IN ?auto_1779 ?auto_1783 ) ( SURFACE-AT ?auto_1777 ?auto_1782 ) ( ON ?auto_1777 ?auto_1785 ) ( IS-CRATE ?auto_1781 ) ( not ( = ?auto_1777 ?auto_1781 ) ) ( not ( = ?auto_1778 ?auto_1781 ) ) ( not ( = ?auto_1787 ?auto_1781 ) ) ( not ( = ?auto_1784 ?auto_1781 ) ) ( not ( = ?auto_1785 ?auto_1781 ) ) ( not ( = ?auto_1779 ?auto_1781 ) ) ( AVAILABLE ?auto_1786 ) ( SURFACE-AT ?auto_1781 ?auto_1782 ) ( ON ?auto_1781 ?auto_1777 ) ( CLEAR ?auto_1781 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1785 ?auto_1777 )
      ( MAKE-2CRATE ?auto_1787 ?auto_1777 ?auto_1778 )
      ( MAKE-1CRATE-VERIFY ?auto_1777 ?auto_1778 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1788 - SURFACE
      ?auto_1789 - SURFACE
      ?auto_1790 - SURFACE
    )
    :vars
    (
      ?auto_1797 - HOIST
      ?auto_1792 - PLACE
      ?auto_1793 - SURFACE
      ?auto_1798 - PLACE
      ?auto_1796 - TRUCK
      ?auto_1794 - SURFACE
      ?auto_1795 - SURFACE
      ?auto_1791 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1797 ?auto_1792 ) ( IS-CRATE ?auto_1790 ) ( not ( = ?auto_1789 ?auto_1790 ) ) ( not ( = ?auto_1788 ?auto_1789 ) ) ( not ( = ?auto_1788 ?auto_1790 ) ) ( SURFACE-AT ?auto_1788 ?auto_1792 ) ( IS-CRATE ?auto_1789 ) ( SURFACE-AT ?auto_1790 ?auto_1792 ) ( ON ?auto_1790 ?auto_1788 ) ( IS-CRATE ?auto_1793 ) ( not ( = ?auto_1789 ?auto_1793 ) ) ( not ( = ?auto_1790 ?auto_1793 ) ) ( not ( = ?auto_1788 ?auto_1793 ) ) ( SURFACE-AT ?auto_1793 ?auto_1792 ) ( ON ?auto_1793 ?auto_1790 ) ( CLEAR ?auto_1793 ) ( not ( = ?auto_1798 ?auto_1792 ) ) ( TRUCK-AT ?auto_1796 ?auto_1792 ) ( SURFACE-AT ?auto_1794 ?auto_1792 ) ( IS-CRATE ?auto_1795 ) ( not ( = ?auto_1789 ?auto_1794 ) ) ( not ( = ?auto_1789 ?auto_1795 ) ) ( not ( = ?auto_1790 ?auto_1794 ) ) ( not ( = ?auto_1790 ?auto_1795 ) ) ( not ( = ?auto_1788 ?auto_1794 ) ) ( not ( = ?auto_1788 ?auto_1795 ) ) ( not ( = ?auto_1793 ?auto_1794 ) ) ( not ( = ?auto_1793 ?auto_1795 ) ) ( not ( = ?auto_1794 ?auto_1795 ) ) ( IN ?auto_1795 ?auto_1796 ) ( SURFACE-AT ?auto_1789 ?auto_1792 ) ( ON ?auto_1789 ?auto_1794 ) ( IS-CRATE ?auto_1791 ) ( not ( = ?auto_1789 ?auto_1791 ) ) ( not ( = ?auto_1790 ?auto_1791 ) ) ( not ( = ?auto_1788 ?auto_1791 ) ) ( not ( = ?auto_1793 ?auto_1791 ) ) ( not ( = ?auto_1794 ?auto_1791 ) ) ( not ( = ?auto_1795 ?auto_1791 ) ) ( AVAILABLE ?auto_1797 ) ( SURFACE-AT ?auto_1791 ?auto_1792 ) ( ON ?auto_1791 ?auto_1789 ) ( CLEAR ?auto_1791 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1789 ?auto_1790 )
      ( MAKE-2CRATE-VERIFY ?auto_1788 ?auto_1789 ?auto_1790 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1799 - SURFACE
      ?auto_1800 - SURFACE
    )
    :vars
    (
      ?auto_1801 - HOIST
      ?auto_1802 - PLACE
      ?auto_1809 - SURFACE
      ?auto_1805 - SURFACE
      ?auto_1804 - PLACE
      ?auto_1806 - SURFACE
      ?auto_1803 - SURFACE
      ?auto_1807 - TRUCK
      ?auto_1808 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1801 ?auto_1802 ) ( IS-CRATE ?auto_1800 ) ( not ( = ?auto_1799 ?auto_1800 ) ) ( not ( = ?auto_1809 ?auto_1799 ) ) ( not ( = ?auto_1809 ?auto_1800 ) ) ( SURFACE-AT ?auto_1809 ?auto_1802 ) ( IS-CRATE ?auto_1799 ) ( SURFACE-AT ?auto_1800 ?auto_1802 ) ( ON ?auto_1800 ?auto_1809 ) ( IS-CRATE ?auto_1805 ) ( not ( = ?auto_1799 ?auto_1805 ) ) ( not ( = ?auto_1800 ?auto_1805 ) ) ( not ( = ?auto_1809 ?auto_1805 ) ) ( SURFACE-AT ?auto_1805 ?auto_1802 ) ( ON ?auto_1805 ?auto_1800 ) ( CLEAR ?auto_1805 ) ( not ( = ?auto_1804 ?auto_1802 ) ) ( SURFACE-AT ?auto_1806 ?auto_1802 ) ( IS-CRATE ?auto_1803 ) ( not ( = ?auto_1799 ?auto_1806 ) ) ( not ( = ?auto_1799 ?auto_1803 ) ) ( not ( = ?auto_1800 ?auto_1806 ) ) ( not ( = ?auto_1800 ?auto_1803 ) ) ( not ( = ?auto_1809 ?auto_1806 ) ) ( not ( = ?auto_1809 ?auto_1803 ) ) ( not ( = ?auto_1805 ?auto_1806 ) ) ( not ( = ?auto_1805 ?auto_1803 ) ) ( not ( = ?auto_1806 ?auto_1803 ) ) ( IN ?auto_1803 ?auto_1807 ) ( SURFACE-AT ?auto_1799 ?auto_1802 ) ( ON ?auto_1799 ?auto_1806 ) ( IS-CRATE ?auto_1808 ) ( not ( = ?auto_1799 ?auto_1808 ) ) ( not ( = ?auto_1800 ?auto_1808 ) ) ( not ( = ?auto_1809 ?auto_1808 ) ) ( not ( = ?auto_1805 ?auto_1808 ) ) ( not ( = ?auto_1806 ?auto_1808 ) ) ( not ( = ?auto_1803 ?auto_1808 ) ) ( AVAILABLE ?auto_1801 ) ( SURFACE-AT ?auto_1808 ?auto_1802 ) ( ON ?auto_1808 ?auto_1799 ) ( CLEAR ?auto_1808 ) ( TRUCK-AT ?auto_1807 ?auto_1804 ) )
    :subtasks
    ( ( !DRIVE ?auto_1807 ?auto_1804 ?auto_1802 )
      ( MAKE-2CRATE ?auto_1809 ?auto_1799 ?auto_1800 )
      ( MAKE-1CRATE-VERIFY ?auto_1799 ?auto_1800 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1810 - SURFACE
      ?auto_1811 - SURFACE
      ?auto_1812 - SURFACE
    )
    :vars
    (
      ?auto_1820 - HOIST
      ?auto_1816 - PLACE
      ?auto_1817 - SURFACE
      ?auto_1819 - PLACE
      ?auto_1813 - SURFACE
      ?auto_1815 - SURFACE
      ?auto_1814 - TRUCK
      ?auto_1818 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1820 ?auto_1816 ) ( IS-CRATE ?auto_1812 ) ( not ( = ?auto_1811 ?auto_1812 ) ) ( not ( = ?auto_1810 ?auto_1811 ) ) ( not ( = ?auto_1810 ?auto_1812 ) ) ( SURFACE-AT ?auto_1810 ?auto_1816 ) ( IS-CRATE ?auto_1811 ) ( SURFACE-AT ?auto_1812 ?auto_1816 ) ( ON ?auto_1812 ?auto_1810 ) ( IS-CRATE ?auto_1817 ) ( not ( = ?auto_1811 ?auto_1817 ) ) ( not ( = ?auto_1812 ?auto_1817 ) ) ( not ( = ?auto_1810 ?auto_1817 ) ) ( SURFACE-AT ?auto_1817 ?auto_1816 ) ( ON ?auto_1817 ?auto_1812 ) ( CLEAR ?auto_1817 ) ( not ( = ?auto_1819 ?auto_1816 ) ) ( SURFACE-AT ?auto_1813 ?auto_1816 ) ( IS-CRATE ?auto_1815 ) ( not ( = ?auto_1811 ?auto_1813 ) ) ( not ( = ?auto_1811 ?auto_1815 ) ) ( not ( = ?auto_1812 ?auto_1813 ) ) ( not ( = ?auto_1812 ?auto_1815 ) ) ( not ( = ?auto_1810 ?auto_1813 ) ) ( not ( = ?auto_1810 ?auto_1815 ) ) ( not ( = ?auto_1817 ?auto_1813 ) ) ( not ( = ?auto_1817 ?auto_1815 ) ) ( not ( = ?auto_1813 ?auto_1815 ) ) ( IN ?auto_1815 ?auto_1814 ) ( SURFACE-AT ?auto_1811 ?auto_1816 ) ( ON ?auto_1811 ?auto_1813 ) ( IS-CRATE ?auto_1818 ) ( not ( = ?auto_1811 ?auto_1818 ) ) ( not ( = ?auto_1812 ?auto_1818 ) ) ( not ( = ?auto_1810 ?auto_1818 ) ) ( not ( = ?auto_1817 ?auto_1818 ) ) ( not ( = ?auto_1813 ?auto_1818 ) ) ( not ( = ?auto_1815 ?auto_1818 ) ) ( AVAILABLE ?auto_1820 ) ( SURFACE-AT ?auto_1818 ?auto_1816 ) ( ON ?auto_1818 ?auto_1811 ) ( CLEAR ?auto_1818 ) ( TRUCK-AT ?auto_1814 ?auto_1819 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1811 ?auto_1812 )
      ( MAKE-2CRATE-VERIFY ?auto_1810 ?auto_1811 ?auto_1812 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1821 - SURFACE
      ?auto_1822 - SURFACE
    )
    :vars
    (
      ?auto_1825 - HOIST
      ?auto_1823 - PLACE
      ?auto_1831 - SURFACE
      ?auto_1827 - SURFACE
      ?auto_1830 - PLACE
      ?auto_1824 - SURFACE
      ?auto_1829 - SURFACE
      ?auto_1828 - SURFACE
      ?auto_1826 - TRUCK
      ?auto_1832 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1825 ?auto_1823 ) ( IS-CRATE ?auto_1822 ) ( not ( = ?auto_1821 ?auto_1822 ) ) ( not ( = ?auto_1831 ?auto_1821 ) ) ( not ( = ?auto_1831 ?auto_1822 ) ) ( SURFACE-AT ?auto_1831 ?auto_1823 ) ( IS-CRATE ?auto_1821 ) ( SURFACE-AT ?auto_1822 ?auto_1823 ) ( ON ?auto_1822 ?auto_1831 ) ( IS-CRATE ?auto_1827 ) ( not ( = ?auto_1821 ?auto_1827 ) ) ( not ( = ?auto_1822 ?auto_1827 ) ) ( not ( = ?auto_1831 ?auto_1827 ) ) ( SURFACE-AT ?auto_1827 ?auto_1823 ) ( ON ?auto_1827 ?auto_1822 ) ( CLEAR ?auto_1827 ) ( not ( = ?auto_1830 ?auto_1823 ) ) ( SURFACE-AT ?auto_1824 ?auto_1823 ) ( IS-CRATE ?auto_1829 ) ( not ( = ?auto_1821 ?auto_1824 ) ) ( not ( = ?auto_1821 ?auto_1829 ) ) ( not ( = ?auto_1822 ?auto_1824 ) ) ( not ( = ?auto_1822 ?auto_1829 ) ) ( not ( = ?auto_1831 ?auto_1824 ) ) ( not ( = ?auto_1831 ?auto_1829 ) ) ( not ( = ?auto_1827 ?auto_1824 ) ) ( not ( = ?auto_1827 ?auto_1829 ) ) ( not ( = ?auto_1824 ?auto_1829 ) ) ( SURFACE-AT ?auto_1821 ?auto_1823 ) ( ON ?auto_1821 ?auto_1824 ) ( IS-CRATE ?auto_1828 ) ( not ( = ?auto_1821 ?auto_1828 ) ) ( not ( = ?auto_1822 ?auto_1828 ) ) ( not ( = ?auto_1831 ?auto_1828 ) ) ( not ( = ?auto_1827 ?auto_1828 ) ) ( not ( = ?auto_1824 ?auto_1828 ) ) ( not ( = ?auto_1829 ?auto_1828 ) ) ( AVAILABLE ?auto_1825 ) ( SURFACE-AT ?auto_1828 ?auto_1823 ) ( ON ?auto_1828 ?auto_1821 ) ( CLEAR ?auto_1828 ) ( TRUCK-AT ?auto_1826 ?auto_1830 ) ( HOIST-AT ?auto_1832 ?auto_1830 ) ( LIFTING ?auto_1832 ?auto_1829 ) ( not ( = ?auto_1825 ?auto_1832 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1832 ?auto_1829 ?auto_1826 ?auto_1830 )
      ( MAKE-2CRATE ?auto_1831 ?auto_1821 ?auto_1822 )
      ( MAKE-1CRATE-VERIFY ?auto_1821 ?auto_1822 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1833 - SURFACE
      ?auto_1834 - SURFACE
      ?auto_1835 - SURFACE
    )
    :vars
    (
      ?auto_1836 - HOIST
      ?auto_1837 - PLACE
      ?auto_1839 - SURFACE
      ?auto_1841 - PLACE
      ?auto_1840 - SURFACE
      ?auto_1842 - SURFACE
      ?auto_1843 - SURFACE
      ?auto_1838 - TRUCK
      ?auto_1844 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1836 ?auto_1837 ) ( IS-CRATE ?auto_1835 ) ( not ( = ?auto_1834 ?auto_1835 ) ) ( not ( = ?auto_1833 ?auto_1834 ) ) ( not ( = ?auto_1833 ?auto_1835 ) ) ( SURFACE-AT ?auto_1833 ?auto_1837 ) ( IS-CRATE ?auto_1834 ) ( SURFACE-AT ?auto_1835 ?auto_1837 ) ( ON ?auto_1835 ?auto_1833 ) ( IS-CRATE ?auto_1839 ) ( not ( = ?auto_1834 ?auto_1839 ) ) ( not ( = ?auto_1835 ?auto_1839 ) ) ( not ( = ?auto_1833 ?auto_1839 ) ) ( SURFACE-AT ?auto_1839 ?auto_1837 ) ( ON ?auto_1839 ?auto_1835 ) ( CLEAR ?auto_1839 ) ( not ( = ?auto_1841 ?auto_1837 ) ) ( SURFACE-AT ?auto_1840 ?auto_1837 ) ( IS-CRATE ?auto_1842 ) ( not ( = ?auto_1834 ?auto_1840 ) ) ( not ( = ?auto_1834 ?auto_1842 ) ) ( not ( = ?auto_1835 ?auto_1840 ) ) ( not ( = ?auto_1835 ?auto_1842 ) ) ( not ( = ?auto_1833 ?auto_1840 ) ) ( not ( = ?auto_1833 ?auto_1842 ) ) ( not ( = ?auto_1839 ?auto_1840 ) ) ( not ( = ?auto_1839 ?auto_1842 ) ) ( not ( = ?auto_1840 ?auto_1842 ) ) ( SURFACE-AT ?auto_1834 ?auto_1837 ) ( ON ?auto_1834 ?auto_1840 ) ( IS-CRATE ?auto_1843 ) ( not ( = ?auto_1834 ?auto_1843 ) ) ( not ( = ?auto_1835 ?auto_1843 ) ) ( not ( = ?auto_1833 ?auto_1843 ) ) ( not ( = ?auto_1839 ?auto_1843 ) ) ( not ( = ?auto_1840 ?auto_1843 ) ) ( not ( = ?auto_1842 ?auto_1843 ) ) ( AVAILABLE ?auto_1836 ) ( SURFACE-AT ?auto_1843 ?auto_1837 ) ( ON ?auto_1843 ?auto_1834 ) ( CLEAR ?auto_1843 ) ( TRUCK-AT ?auto_1838 ?auto_1841 ) ( HOIST-AT ?auto_1844 ?auto_1841 ) ( LIFTING ?auto_1844 ?auto_1842 ) ( not ( = ?auto_1836 ?auto_1844 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1834 ?auto_1835 )
      ( MAKE-2CRATE-VERIFY ?auto_1833 ?auto_1834 ?auto_1835 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1845 - SURFACE
      ?auto_1846 - SURFACE
    )
    :vars
    (
      ?auto_1850 - HOIST
      ?auto_1848 - PLACE
      ?auto_1856 - SURFACE
      ?auto_1855 - SURFACE
      ?auto_1854 - PLACE
      ?auto_1847 - SURFACE
      ?auto_1852 - SURFACE
      ?auto_1851 - SURFACE
      ?auto_1849 - TRUCK
      ?auto_1853 - HOIST
      ?auto_1857 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1850 ?auto_1848 ) ( IS-CRATE ?auto_1846 ) ( not ( = ?auto_1845 ?auto_1846 ) ) ( not ( = ?auto_1856 ?auto_1845 ) ) ( not ( = ?auto_1856 ?auto_1846 ) ) ( SURFACE-AT ?auto_1856 ?auto_1848 ) ( IS-CRATE ?auto_1845 ) ( SURFACE-AT ?auto_1846 ?auto_1848 ) ( ON ?auto_1846 ?auto_1856 ) ( IS-CRATE ?auto_1855 ) ( not ( = ?auto_1845 ?auto_1855 ) ) ( not ( = ?auto_1846 ?auto_1855 ) ) ( not ( = ?auto_1856 ?auto_1855 ) ) ( SURFACE-AT ?auto_1855 ?auto_1848 ) ( ON ?auto_1855 ?auto_1846 ) ( CLEAR ?auto_1855 ) ( not ( = ?auto_1854 ?auto_1848 ) ) ( SURFACE-AT ?auto_1847 ?auto_1848 ) ( IS-CRATE ?auto_1852 ) ( not ( = ?auto_1845 ?auto_1847 ) ) ( not ( = ?auto_1845 ?auto_1852 ) ) ( not ( = ?auto_1846 ?auto_1847 ) ) ( not ( = ?auto_1846 ?auto_1852 ) ) ( not ( = ?auto_1856 ?auto_1847 ) ) ( not ( = ?auto_1856 ?auto_1852 ) ) ( not ( = ?auto_1855 ?auto_1847 ) ) ( not ( = ?auto_1855 ?auto_1852 ) ) ( not ( = ?auto_1847 ?auto_1852 ) ) ( SURFACE-AT ?auto_1845 ?auto_1848 ) ( ON ?auto_1845 ?auto_1847 ) ( IS-CRATE ?auto_1851 ) ( not ( = ?auto_1845 ?auto_1851 ) ) ( not ( = ?auto_1846 ?auto_1851 ) ) ( not ( = ?auto_1856 ?auto_1851 ) ) ( not ( = ?auto_1855 ?auto_1851 ) ) ( not ( = ?auto_1847 ?auto_1851 ) ) ( not ( = ?auto_1852 ?auto_1851 ) ) ( AVAILABLE ?auto_1850 ) ( SURFACE-AT ?auto_1851 ?auto_1848 ) ( ON ?auto_1851 ?auto_1845 ) ( CLEAR ?auto_1851 ) ( TRUCK-AT ?auto_1849 ?auto_1854 ) ( HOIST-AT ?auto_1853 ?auto_1854 ) ( not ( = ?auto_1850 ?auto_1853 ) ) ( AVAILABLE ?auto_1853 ) ( SURFACE-AT ?auto_1852 ?auto_1854 ) ( ON ?auto_1852 ?auto_1857 ) ( CLEAR ?auto_1852 ) ( not ( = ?auto_1845 ?auto_1857 ) ) ( not ( = ?auto_1846 ?auto_1857 ) ) ( not ( = ?auto_1856 ?auto_1857 ) ) ( not ( = ?auto_1855 ?auto_1857 ) ) ( not ( = ?auto_1847 ?auto_1857 ) ) ( not ( = ?auto_1852 ?auto_1857 ) ) ( not ( = ?auto_1851 ?auto_1857 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1853 ?auto_1852 ?auto_1857 ?auto_1854 )
      ( MAKE-2CRATE ?auto_1856 ?auto_1845 ?auto_1846 )
      ( MAKE-1CRATE-VERIFY ?auto_1845 ?auto_1846 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1858 - SURFACE
      ?auto_1859 - SURFACE
      ?auto_1860 - SURFACE
    )
    :vars
    (
      ?auto_1865 - HOIST
      ?auto_1868 - PLACE
      ?auto_1864 - SURFACE
      ?auto_1863 - PLACE
      ?auto_1869 - SURFACE
      ?auto_1861 - SURFACE
      ?auto_1866 - SURFACE
      ?auto_1862 - TRUCK
      ?auto_1867 - HOIST
      ?auto_1870 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1865 ?auto_1868 ) ( IS-CRATE ?auto_1860 ) ( not ( = ?auto_1859 ?auto_1860 ) ) ( not ( = ?auto_1858 ?auto_1859 ) ) ( not ( = ?auto_1858 ?auto_1860 ) ) ( SURFACE-AT ?auto_1858 ?auto_1868 ) ( IS-CRATE ?auto_1859 ) ( SURFACE-AT ?auto_1860 ?auto_1868 ) ( ON ?auto_1860 ?auto_1858 ) ( IS-CRATE ?auto_1864 ) ( not ( = ?auto_1859 ?auto_1864 ) ) ( not ( = ?auto_1860 ?auto_1864 ) ) ( not ( = ?auto_1858 ?auto_1864 ) ) ( SURFACE-AT ?auto_1864 ?auto_1868 ) ( ON ?auto_1864 ?auto_1860 ) ( CLEAR ?auto_1864 ) ( not ( = ?auto_1863 ?auto_1868 ) ) ( SURFACE-AT ?auto_1869 ?auto_1868 ) ( IS-CRATE ?auto_1861 ) ( not ( = ?auto_1859 ?auto_1869 ) ) ( not ( = ?auto_1859 ?auto_1861 ) ) ( not ( = ?auto_1860 ?auto_1869 ) ) ( not ( = ?auto_1860 ?auto_1861 ) ) ( not ( = ?auto_1858 ?auto_1869 ) ) ( not ( = ?auto_1858 ?auto_1861 ) ) ( not ( = ?auto_1864 ?auto_1869 ) ) ( not ( = ?auto_1864 ?auto_1861 ) ) ( not ( = ?auto_1869 ?auto_1861 ) ) ( SURFACE-AT ?auto_1859 ?auto_1868 ) ( ON ?auto_1859 ?auto_1869 ) ( IS-CRATE ?auto_1866 ) ( not ( = ?auto_1859 ?auto_1866 ) ) ( not ( = ?auto_1860 ?auto_1866 ) ) ( not ( = ?auto_1858 ?auto_1866 ) ) ( not ( = ?auto_1864 ?auto_1866 ) ) ( not ( = ?auto_1869 ?auto_1866 ) ) ( not ( = ?auto_1861 ?auto_1866 ) ) ( AVAILABLE ?auto_1865 ) ( SURFACE-AT ?auto_1866 ?auto_1868 ) ( ON ?auto_1866 ?auto_1859 ) ( CLEAR ?auto_1866 ) ( TRUCK-AT ?auto_1862 ?auto_1863 ) ( HOIST-AT ?auto_1867 ?auto_1863 ) ( not ( = ?auto_1865 ?auto_1867 ) ) ( AVAILABLE ?auto_1867 ) ( SURFACE-AT ?auto_1861 ?auto_1863 ) ( ON ?auto_1861 ?auto_1870 ) ( CLEAR ?auto_1861 ) ( not ( = ?auto_1859 ?auto_1870 ) ) ( not ( = ?auto_1860 ?auto_1870 ) ) ( not ( = ?auto_1858 ?auto_1870 ) ) ( not ( = ?auto_1864 ?auto_1870 ) ) ( not ( = ?auto_1869 ?auto_1870 ) ) ( not ( = ?auto_1861 ?auto_1870 ) ) ( not ( = ?auto_1866 ?auto_1870 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1859 ?auto_1860 )
      ( MAKE-2CRATE-VERIFY ?auto_1858 ?auto_1859 ?auto_1860 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1880 - SURFACE
      ?auto_1881 - SURFACE
    )
    :vars
    (
      ?auto_1882 - HOIST
      ?auto_1883 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1882 ?auto_1883 ) ( SURFACE-AT ?auto_1880 ?auto_1883 ) ( CLEAR ?auto_1880 ) ( LIFTING ?auto_1882 ?auto_1881 ) ( IS-CRATE ?auto_1881 ) ( not ( = ?auto_1880 ?auto_1881 ) ) )
    :subtasks
    ( ( !DROP ?auto_1882 ?auto_1881 ?auto_1880 ?auto_1883 )
      ( MAKE-1CRATE-VERIFY ?auto_1880 ?auto_1881 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1884 - SURFACE
      ?auto_1885 - SURFACE
      ?auto_1886 - SURFACE
    )
    :vars
    (
      ?auto_1888 - HOIST
      ?auto_1887 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1888 ?auto_1887 ) ( SURFACE-AT ?auto_1885 ?auto_1887 ) ( CLEAR ?auto_1885 ) ( LIFTING ?auto_1888 ?auto_1886 ) ( IS-CRATE ?auto_1886 ) ( not ( = ?auto_1885 ?auto_1886 ) ) ( ON ?auto_1885 ?auto_1884 ) ( not ( = ?auto_1884 ?auto_1885 ) ) ( not ( = ?auto_1884 ?auto_1886 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1885 ?auto_1886 )
      ( MAKE-2CRATE-VERIFY ?auto_1884 ?auto_1885 ?auto_1886 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1889 - SURFACE
      ?auto_1890 - SURFACE
      ?auto_1891 - SURFACE
      ?auto_1892 - SURFACE
    )
    :vars
    (
      ?auto_1894 - HOIST
      ?auto_1893 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1894 ?auto_1893 ) ( SURFACE-AT ?auto_1891 ?auto_1893 ) ( CLEAR ?auto_1891 ) ( LIFTING ?auto_1894 ?auto_1892 ) ( IS-CRATE ?auto_1892 ) ( not ( = ?auto_1891 ?auto_1892 ) ) ( ON ?auto_1890 ?auto_1889 ) ( ON ?auto_1891 ?auto_1890 ) ( not ( = ?auto_1889 ?auto_1890 ) ) ( not ( = ?auto_1889 ?auto_1891 ) ) ( not ( = ?auto_1889 ?auto_1892 ) ) ( not ( = ?auto_1890 ?auto_1891 ) ) ( not ( = ?auto_1890 ?auto_1892 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1891 ?auto_1892 )
      ( MAKE-3CRATE-VERIFY ?auto_1889 ?auto_1890 ?auto_1891 ?auto_1892 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1895 - SURFACE
      ?auto_1896 - SURFACE
    )
    :vars
    (
      ?auto_1898 - HOIST
      ?auto_1897 - PLACE
      ?auto_1899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1898 ?auto_1897 ) ( SURFACE-AT ?auto_1895 ?auto_1897 ) ( CLEAR ?auto_1895 ) ( IS-CRATE ?auto_1896 ) ( not ( = ?auto_1895 ?auto_1896 ) ) ( TRUCK-AT ?auto_1899 ?auto_1897 ) ( AVAILABLE ?auto_1898 ) ( IN ?auto_1896 ?auto_1899 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1898 ?auto_1896 ?auto_1899 ?auto_1897 )
      ( MAKE-1CRATE ?auto_1895 ?auto_1896 )
      ( MAKE-1CRATE-VERIFY ?auto_1895 ?auto_1896 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1900 - SURFACE
      ?auto_1901 - SURFACE
      ?auto_1902 - SURFACE
    )
    :vars
    (
      ?auto_1905 - HOIST
      ?auto_1903 - PLACE
      ?auto_1904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1905 ?auto_1903 ) ( SURFACE-AT ?auto_1901 ?auto_1903 ) ( CLEAR ?auto_1901 ) ( IS-CRATE ?auto_1902 ) ( not ( = ?auto_1901 ?auto_1902 ) ) ( TRUCK-AT ?auto_1904 ?auto_1903 ) ( AVAILABLE ?auto_1905 ) ( IN ?auto_1902 ?auto_1904 ) ( ON ?auto_1901 ?auto_1900 ) ( not ( = ?auto_1900 ?auto_1901 ) ) ( not ( = ?auto_1900 ?auto_1902 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1901 ?auto_1902 )
      ( MAKE-2CRATE-VERIFY ?auto_1900 ?auto_1901 ?auto_1902 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1906 - SURFACE
      ?auto_1907 - SURFACE
      ?auto_1908 - SURFACE
      ?auto_1909 - SURFACE
    )
    :vars
    (
      ?auto_1912 - HOIST
      ?auto_1911 - PLACE
      ?auto_1910 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1912 ?auto_1911 ) ( SURFACE-AT ?auto_1908 ?auto_1911 ) ( CLEAR ?auto_1908 ) ( IS-CRATE ?auto_1909 ) ( not ( = ?auto_1908 ?auto_1909 ) ) ( TRUCK-AT ?auto_1910 ?auto_1911 ) ( AVAILABLE ?auto_1912 ) ( IN ?auto_1909 ?auto_1910 ) ( ON ?auto_1908 ?auto_1907 ) ( not ( = ?auto_1907 ?auto_1908 ) ) ( not ( = ?auto_1907 ?auto_1909 ) ) ( ON ?auto_1907 ?auto_1906 ) ( not ( = ?auto_1906 ?auto_1907 ) ) ( not ( = ?auto_1906 ?auto_1908 ) ) ( not ( = ?auto_1906 ?auto_1909 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1907 ?auto_1908 ?auto_1909 )
      ( MAKE-3CRATE-VERIFY ?auto_1906 ?auto_1907 ?auto_1908 ?auto_1909 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1913 - SURFACE
      ?auto_1914 - SURFACE
    )
    :vars
    (
      ?auto_1917 - HOIST
      ?auto_1916 - PLACE
      ?auto_1915 - TRUCK
      ?auto_1918 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1917 ?auto_1916 ) ( IS-CRATE ?auto_1914 ) ( not ( = ?auto_1913 ?auto_1914 ) ) ( TRUCK-AT ?auto_1915 ?auto_1916 ) ( IN ?auto_1914 ?auto_1915 ) ( not ( = ?auto_1918 ?auto_1913 ) ) ( not ( = ?auto_1918 ?auto_1914 ) ) ( SURFACE-AT ?auto_1918 ?auto_1916 ) ( CLEAR ?auto_1918 ) ( LIFTING ?auto_1917 ?auto_1913 ) ( IS-CRATE ?auto_1913 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1918 ?auto_1913 )
      ( MAKE-2CRATE ?auto_1918 ?auto_1913 ?auto_1914 )
      ( MAKE-1CRATE-VERIFY ?auto_1913 ?auto_1914 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1919 - SURFACE
      ?auto_1920 - SURFACE
      ?auto_1921 - SURFACE
    )
    :vars
    (
      ?auto_1923 - HOIST
      ?auto_1924 - PLACE
      ?auto_1922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1923 ?auto_1924 ) ( IS-CRATE ?auto_1921 ) ( not ( = ?auto_1920 ?auto_1921 ) ) ( TRUCK-AT ?auto_1922 ?auto_1924 ) ( IN ?auto_1921 ?auto_1922 ) ( not ( = ?auto_1919 ?auto_1920 ) ) ( not ( = ?auto_1919 ?auto_1921 ) ) ( SURFACE-AT ?auto_1919 ?auto_1924 ) ( CLEAR ?auto_1919 ) ( LIFTING ?auto_1923 ?auto_1920 ) ( IS-CRATE ?auto_1920 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1920 ?auto_1921 )
      ( MAKE-2CRATE-VERIFY ?auto_1919 ?auto_1920 ?auto_1921 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1925 - SURFACE
      ?auto_1926 - SURFACE
      ?auto_1927 - SURFACE
      ?auto_1928 - SURFACE
    )
    :vars
    (
      ?auto_1930 - HOIST
      ?auto_1931 - PLACE
      ?auto_1929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1930 ?auto_1931 ) ( IS-CRATE ?auto_1928 ) ( not ( = ?auto_1927 ?auto_1928 ) ) ( TRUCK-AT ?auto_1929 ?auto_1931 ) ( IN ?auto_1928 ?auto_1929 ) ( not ( = ?auto_1926 ?auto_1927 ) ) ( not ( = ?auto_1926 ?auto_1928 ) ) ( SURFACE-AT ?auto_1926 ?auto_1931 ) ( CLEAR ?auto_1926 ) ( LIFTING ?auto_1930 ?auto_1927 ) ( IS-CRATE ?auto_1927 ) ( ON ?auto_1926 ?auto_1925 ) ( not ( = ?auto_1925 ?auto_1926 ) ) ( not ( = ?auto_1925 ?auto_1927 ) ) ( not ( = ?auto_1925 ?auto_1928 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1926 ?auto_1927 ?auto_1928 )
      ( MAKE-3CRATE-VERIFY ?auto_1925 ?auto_1926 ?auto_1927 ?auto_1928 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1932 - SURFACE
      ?auto_1933 - SURFACE
    )
    :vars
    (
      ?auto_1936 - HOIST
      ?auto_1937 - PLACE
      ?auto_1934 - TRUCK
      ?auto_1935 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1936 ?auto_1937 ) ( IS-CRATE ?auto_1933 ) ( not ( = ?auto_1932 ?auto_1933 ) ) ( TRUCK-AT ?auto_1934 ?auto_1937 ) ( IN ?auto_1933 ?auto_1934 ) ( not ( = ?auto_1935 ?auto_1932 ) ) ( not ( = ?auto_1935 ?auto_1933 ) ) ( SURFACE-AT ?auto_1935 ?auto_1937 ) ( CLEAR ?auto_1935 ) ( IS-CRATE ?auto_1932 ) ( AVAILABLE ?auto_1936 ) ( IN ?auto_1932 ?auto_1934 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1936 ?auto_1932 ?auto_1934 ?auto_1937 )
      ( MAKE-2CRATE ?auto_1935 ?auto_1932 ?auto_1933 )
      ( MAKE-1CRATE-VERIFY ?auto_1932 ?auto_1933 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1938 - SURFACE
      ?auto_1939 - SURFACE
      ?auto_1940 - SURFACE
    )
    :vars
    (
      ?auto_1943 - HOIST
      ?auto_1941 - PLACE
      ?auto_1942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1943 ?auto_1941 ) ( IS-CRATE ?auto_1940 ) ( not ( = ?auto_1939 ?auto_1940 ) ) ( TRUCK-AT ?auto_1942 ?auto_1941 ) ( IN ?auto_1940 ?auto_1942 ) ( not ( = ?auto_1938 ?auto_1939 ) ) ( not ( = ?auto_1938 ?auto_1940 ) ) ( SURFACE-AT ?auto_1938 ?auto_1941 ) ( CLEAR ?auto_1938 ) ( IS-CRATE ?auto_1939 ) ( AVAILABLE ?auto_1943 ) ( IN ?auto_1939 ?auto_1942 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1939 ?auto_1940 )
      ( MAKE-2CRATE-VERIFY ?auto_1938 ?auto_1939 ?auto_1940 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1944 - SURFACE
      ?auto_1945 - SURFACE
      ?auto_1946 - SURFACE
      ?auto_1947 - SURFACE
    )
    :vars
    (
      ?auto_1949 - HOIST
      ?auto_1948 - PLACE
      ?auto_1950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1949 ?auto_1948 ) ( IS-CRATE ?auto_1947 ) ( not ( = ?auto_1946 ?auto_1947 ) ) ( TRUCK-AT ?auto_1950 ?auto_1948 ) ( IN ?auto_1947 ?auto_1950 ) ( not ( = ?auto_1945 ?auto_1946 ) ) ( not ( = ?auto_1945 ?auto_1947 ) ) ( SURFACE-AT ?auto_1945 ?auto_1948 ) ( CLEAR ?auto_1945 ) ( IS-CRATE ?auto_1946 ) ( AVAILABLE ?auto_1949 ) ( IN ?auto_1946 ?auto_1950 ) ( ON ?auto_1945 ?auto_1944 ) ( not ( = ?auto_1944 ?auto_1945 ) ) ( not ( = ?auto_1944 ?auto_1946 ) ) ( not ( = ?auto_1944 ?auto_1947 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1945 ?auto_1946 ?auto_1947 )
      ( MAKE-3CRATE-VERIFY ?auto_1944 ?auto_1945 ?auto_1946 ?auto_1947 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1951 - SURFACE
      ?auto_1952 - SURFACE
    )
    :vars
    (
      ?auto_1954 - HOIST
      ?auto_1953 - PLACE
      ?auto_1955 - TRUCK
      ?auto_1956 - SURFACE
      ?auto_1957 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1954 ?auto_1953 ) ( IS-CRATE ?auto_1952 ) ( not ( = ?auto_1951 ?auto_1952 ) ) ( TRUCK-AT ?auto_1955 ?auto_1953 ) ( IN ?auto_1952 ?auto_1955 ) ( not ( = ?auto_1956 ?auto_1951 ) ) ( not ( = ?auto_1956 ?auto_1952 ) ) ( IS-CRATE ?auto_1951 ) ( IN ?auto_1951 ?auto_1955 ) ( SURFACE-AT ?auto_1957 ?auto_1953 ) ( CLEAR ?auto_1957 ) ( LIFTING ?auto_1954 ?auto_1956 ) ( IS-CRATE ?auto_1956 ) ( not ( = ?auto_1957 ?auto_1956 ) ) ( not ( = ?auto_1951 ?auto_1957 ) ) ( not ( = ?auto_1952 ?auto_1957 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1957 ?auto_1956 )
      ( MAKE-2CRATE ?auto_1956 ?auto_1951 ?auto_1952 )
      ( MAKE-1CRATE-VERIFY ?auto_1951 ?auto_1952 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1958 - SURFACE
      ?auto_1959 - SURFACE
      ?auto_1960 - SURFACE
    )
    :vars
    (
      ?auto_1964 - HOIST
      ?auto_1963 - PLACE
      ?auto_1962 - TRUCK
      ?auto_1961 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1964 ?auto_1963 ) ( IS-CRATE ?auto_1960 ) ( not ( = ?auto_1959 ?auto_1960 ) ) ( TRUCK-AT ?auto_1962 ?auto_1963 ) ( IN ?auto_1960 ?auto_1962 ) ( not ( = ?auto_1958 ?auto_1959 ) ) ( not ( = ?auto_1958 ?auto_1960 ) ) ( IS-CRATE ?auto_1959 ) ( IN ?auto_1959 ?auto_1962 ) ( SURFACE-AT ?auto_1961 ?auto_1963 ) ( CLEAR ?auto_1961 ) ( LIFTING ?auto_1964 ?auto_1958 ) ( IS-CRATE ?auto_1958 ) ( not ( = ?auto_1961 ?auto_1958 ) ) ( not ( = ?auto_1959 ?auto_1961 ) ) ( not ( = ?auto_1960 ?auto_1961 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1959 ?auto_1960 )
      ( MAKE-2CRATE-VERIFY ?auto_1958 ?auto_1959 ?auto_1960 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1965 - SURFACE
      ?auto_1966 - SURFACE
      ?auto_1967 - SURFACE
      ?auto_1968 - SURFACE
    )
    :vars
    (
      ?auto_1971 - HOIST
      ?auto_1970 - PLACE
      ?auto_1969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1971 ?auto_1970 ) ( IS-CRATE ?auto_1968 ) ( not ( = ?auto_1967 ?auto_1968 ) ) ( TRUCK-AT ?auto_1969 ?auto_1970 ) ( IN ?auto_1968 ?auto_1969 ) ( not ( = ?auto_1966 ?auto_1967 ) ) ( not ( = ?auto_1966 ?auto_1968 ) ) ( IS-CRATE ?auto_1967 ) ( IN ?auto_1967 ?auto_1969 ) ( SURFACE-AT ?auto_1965 ?auto_1970 ) ( CLEAR ?auto_1965 ) ( LIFTING ?auto_1971 ?auto_1966 ) ( IS-CRATE ?auto_1966 ) ( not ( = ?auto_1965 ?auto_1966 ) ) ( not ( = ?auto_1967 ?auto_1965 ) ) ( not ( = ?auto_1968 ?auto_1965 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1966 ?auto_1967 ?auto_1968 )
      ( MAKE-3CRATE-VERIFY ?auto_1965 ?auto_1966 ?auto_1967 ?auto_1968 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1972 - SURFACE
      ?auto_1973 - SURFACE
    )
    :vars
    (
      ?auto_1977 - HOIST
      ?auto_1976 - PLACE
      ?auto_1974 - TRUCK
      ?auto_1978 - SURFACE
      ?auto_1975 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1977 ?auto_1976 ) ( IS-CRATE ?auto_1973 ) ( not ( = ?auto_1972 ?auto_1973 ) ) ( TRUCK-AT ?auto_1974 ?auto_1976 ) ( IN ?auto_1973 ?auto_1974 ) ( not ( = ?auto_1978 ?auto_1972 ) ) ( not ( = ?auto_1978 ?auto_1973 ) ) ( IS-CRATE ?auto_1972 ) ( IN ?auto_1972 ?auto_1974 ) ( SURFACE-AT ?auto_1975 ?auto_1976 ) ( CLEAR ?auto_1975 ) ( IS-CRATE ?auto_1978 ) ( not ( = ?auto_1975 ?auto_1978 ) ) ( not ( = ?auto_1972 ?auto_1975 ) ) ( not ( = ?auto_1973 ?auto_1975 ) ) ( AVAILABLE ?auto_1977 ) ( IN ?auto_1978 ?auto_1974 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1977 ?auto_1978 ?auto_1974 ?auto_1976 )
      ( MAKE-2CRATE ?auto_1978 ?auto_1972 ?auto_1973 )
      ( MAKE-1CRATE-VERIFY ?auto_1972 ?auto_1973 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1979 - SURFACE
      ?auto_1980 - SURFACE
      ?auto_1981 - SURFACE
    )
    :vars
    (
      ?auto_1982 - HOIST
      ?auto_1984 - PLACE
      ?auto_1985 - TRUCK
      ?auto_1983 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1982 ?auto_1984 ) ( IS-CRATE ?auto_1981 ) ( not ( = ?auto_1980 ?auto_1981 ) ) ( TRUCK-AT ?auto_1985 ?auto_1984 ) ( IN ?auto_1981 ?auto_1985 ) ( not ( = ?auto_1979 ?auto_1980 ) ) ( not ( = ?auto_1979 ?auto_1981 ) ) ( IS-CRATE ?auto_1980 ) ( IN ?auto_1980 ?auto_1985 ) ( SURFACE-AT ?auto_1983 ?auto_1984 ) ( CLEAR ?auto_1983 ) ( IS-CRATE ?auto_1979 ) ( not ( = ?auto_1983 ?auto_1979 ) ) ( not ( = ?auto_1980 ?auto_1983 ) ) ( not ( = ?auto_1981 ?auto_1983 ) ) ( AVAILABLE ?auto_1982 ) ( IN ?auto_1979 ?auto_1985 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1980 ?auto_1981 )
      ( MAKE-2CRATE-VERIFY ?auto_1979 ?auto_1980 ?auto_1981 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1986 - SURFACE
      ?auto_1987 - SURFACE
      ?auto_1988 - SURFACE
      ?auto_1989 - SURFACE
    )
    :vars
    (
      ?auto_1990 - HOIST
      ?auto_1992 - PLACE
      ?auto_1991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1990 ?auto_1992 ) ( IS-CRATE ?auto_1989 ) ( not ( = ?auto_1988 ?auto_1989 ) ) ( TRUCK-AT ?auto_1991 ?auto_1992 ) ( IN ?auto_1989 ?auto_1991 ) ( not ( = ?auto_1987 ?auto_1988 ) ) ( not ( = ?auto_1987 ?auto_1989 ) ) ( IS-CRATE ?auto_1988 ) ( IN ?auto_1988 ?auto_1991 ) ( SURFACE-AT ?auto_1986 ?auto_1992 ) ( CLEAR ?auto_1986 ) ( IS-CRATE ?auto_1987 ) ( not ( = ?auto_1986 ?auto_1987 ) ) ( not ( = ?auto_1988 ?auto_1986 ) ) ( not ( = ?auto_1989 ?auto_1986 ) ) ( AVAILABLE ?auto_1990 ) ( IN ?auto_1987 ?auto_1991 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1987 ?auto_1988 ?auto_1989 )
      ( MAKE-3CRATE-VERIFY ?auto_1986 ?auto_1987 ?auto_1988 ?auto_1989 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1993 - SURFACE
      ?auto_1994 - SURFACE
    )
    :vars
    (
      ?auto_1995 - HOIST
      ?auto_1998 - PLACE
      ?auto_1997 - TRUCK
      ?auto_1999 - SURFACE
      ?auto_1996 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1995 ?auto_1998 ) ( IS-CRATE ?auto_1994 ) ( not ( = ?auto_1993 ?auto_1994 ) ) ( TRUCK-AT ?auto_1997 ?auto_1998 ) ( IN ?auto_1994 ?auto_1997 ) ( not ( = ?auto_1999 ?auto_1993 ) ) ( not ( = ?auto_1999 ?auto_1994 ) ) ( IS-CRATE ?auto_1993 ) ( SURFACE-AT ?auto_1996 ?auto_1998 ) ( CLEAR ?auto_1996 ) ( IS-CRATE ?auto_1999 ) ( not ( = ?auto_1996 ?auto_1999 ) ) ( not ( = ?auto_1993 ?auto_1996 ) ) ( not ( = ?auto_1994 ?auto_1996 ) ) ( IN ?auto_1999 ?auto_1997 ) ( LIFTING ?auto_1995 ?auto_1993 ) )
    :subtasks
    ( ( !LOAD ?auto_1995 ?auto_1993 ?auto_1997 ?auto_1998 )
      ( MAKE-2CRATE ?auto_1999 ?auto_1993 ?auto_1994 )
      ( MAKE-1CRATE-VERIFY ?auto_1993 ?auto_1994 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2000 - SURFACE
      ?auto_2001 - SURFACE
      ?auto_2002 - SURFACE
    )
    :vars
    (
      ?auto_2005 - HOIST
      ?auto_2004 - PLACE
      ?auto_2006 - TRUCK
      ?auto_2003 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2005 ?auto_2004 ) ( IS-CRATE ?auto_2002 ) ( not ( = ?auto_2001 ?auto_2002 ) ) ( TRUCK-AT ?auto_2006 ?auto_2004 ) ( IN ?auto_2002 ?auto_2006 ) ( not ( = ?auto_2000 ?auto_2001 ) ) ( not ( = ?auto_2000 ?auto_2002 ) ) ( IS-CRATE ?auto_2001 ) ( SURFACE-AT ?auto_2003 ?auto_2004 ) ( CLEAR ?auto_2003 ) ( IS-CRATE ?auto_2000 ) ( not ( = ?auto_2003 ?auto_2000 ) ) ( not ( = ?auto_2001 ?auto_2003 ) ) ( not ( = ?auto_2002 ?auto_2003 ) ) ( IN ?auto_2000 ?auto_2006 ) ( LIFTING ?auto_2005 ?auto_2001 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2001 ?auto_2002 )
      ( MAKE-2CRATE-VERIFY ?auto_2000 ?auto_2001 ?auto_2002 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2007 - SURFACE
      ?auto_2008 - SURFACE
      ?auto_2009 - SURFACE
      ?auto_2010 - SURFACE
    )
    :vars
    (
      ?auto_2013 - HOIST
      ?auto_2012 - PLACE
      ?auto_2011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2013 ?auto_2012 ) ( IS-CRATE ?auto_2010 ) ( not ( = ?auto_2009 ?auto_2010 ) ) ( TRUCK-AT ?auto_2011 ?auto_2012 ) ( IN ?auto_2010 ?auto_2011 ) ( not ( = ?auto_2008 ?auto_2009 ) ) ( not ( = ?auto_2008 ?auto_2010 ) ) ( IS-CRATE ?auto_2009 ) ( SURFACE-AT ?auto_2007 ?auto_2012 ) ( CLEAR ?auto_2007 ) ( IS-CRATE ?auto_2008 ) ( not ( = ?auto_2007 ?auto_2008 ) ) ( not ( = ?auto_2009 ?auto_2007 ) ) ( not ( = ?auto_2010 ?auto_2007 ) ) ( IN ?auto_2008 ?auto_2011 ) ( LIFTING ?auto_2013 ?auto_2009 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2008 ?auto_2009 ?auto_2010 )
      ( MAKE-3CRATE-VERIFY ?auto_2007 ?auto_2008 ?auto_2009 ?auto_2010 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2014 - SURFACE
      ?auto_2015 - SURFACE
    )
    :vars
    (
      ?auto_2019 - HOIST
      ?auto_2018 - PLACE
      ?auto_2017 - TRUCK
      ?auto_2020 - SURFACE
      ?auto_2016 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2019 ?auto_2018 ) ( IS-CRATE ?auto_2015 ) ( not ( = ?auto_2014 ?auto_2015 ) ) ( TRUCK-AT ?auto_2017 ?auto_2018 ) ( IN ?auto_2015 ?auto_2017 ) ( not ( = ?auto_2020 ?auto_2014 ) ) ( not ( = ?auto_2020 ?auto_2015 ) ) ( IS-CRATE ?auto_2014 ) ( SURFACE-AT ?auto_2016 ?auto_2018 ) ( IS-CRATE ?auto_2020 ) ( not ( = ?auto_2016 ?auto_2020 ) ) ( not ( = ?auto_2014 ?auto_2016 ) ) ( not ( = ?auto_2015 ?auto_2016 ) ) ( IN ?auto_2020 ?auto_2017 ) ( AVAILABLE ?auto_2019 ) ( SURFACE-AT ?auto_2014 ?auto_2018 ) ( ON ?auto_2014 ?auto_2016 ) ( CLEAR ?auto_2014 ) )
    :subtasks
    ( ( !LIFT ?auto_2019 ?auto_2014 ?auto_2016 ?auto_2018 )
      ( MAKE-2CRATE ?auto_2020 ?auto_2014 ?auto_2015 )
      ( MAKE-1CRATE-VERIFY ?auto_2014 ?auto_2015 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2021 - SURFACE
      ?auto_2022 - SURFACE
      ?auto_2023 - SURFACE
    )
    :vars
    (
      ?auto_2024 - HOIST
      ?auto_2027 - PLACE
      ?auto_2025 - TRUCK
      ?auto_2026 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2024 ?auto_2027 ) ( IS-CRATE ?auto_2023 ) ( not ( = ?auto_2022 ?auto_2023 ) ) ( TRUCK-AT ?auto_2025 ?auto_2027 ) ( IN ?auto_2023 ?auto_2025 ) ( not ( = ?auto_2021 ?auto_2022 ) ) ( not ( = ?auto_2021 ?auto_2023 ) ) ( IS-CRATE ?auto_2022 ) ( SURFACE-AT ?auto_2026 ?auto_2027 ) ( IS-CRATE ?auto_2021 ) ( not ( = ?auto_2026 ?auto_2021 ) ) ( not ( = ?auto_2022 ?auto_2026 ) ) ( not ( = ?auto_2023 ?auto_2026 ) ) ( IN ?auto_2021 ?auto_2025 ) ( AVAILABLE ?auto_2024 ) ( SURFACE-AT ?auto_2022 ?auto_2027 ) ( ON ?auto_2022 ?auto_2026 ) ( CLEAR ?auto_2022 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2022 ?auto_2023 )
      ( MAKE-2CRATE-VERIFY ?auto_2021 ?auto_2022 ?auto_2023 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2028 - SURFACE
      ?auto_2029 - SURFACE
      ?auto_2030 - SURFACE
      ?auto_2031 - SURFACE
    )
    :vars
    (
      ?auto_2032 - HOIST
      ?auto_2033 - PLACE
      ?auto_2034 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2032 ?auto_2033 ) ( IS-CRATE ?auto_2031 ) ( not ( = ?auto_2030 ?auto_2031 ) ) ( TRUCK-AT ?auto_2034 ?auto_2033 ) ( IN ?auto_2031 ?auto_2034 ) ( not ( = ?auto_2029 ?auto_2030 ) ) ( not ( = ?auto_2029 ?auto_2031 ) ) ( IS-CRATE ?auto_2030 ) ( SURFACE-AT ?auto_2028 ?auto_2033 ) ( IS-CRATE ?auto_2029 ) ( not ( = ?auto_2028 ?auto_2029 ) ) ( not ( = ?auto_2030 ?auto_2028 ) ) ( not ( = ?auto_2031 ?auto_2028 ) ) ( IN ?auto_2029 ?auto_2034 ) ( AVAILABLE ?auto_2032 ) ( SURFACE-AT ?auto_2030 ?auto_2033 ) ( ON ?auto_2030 ?auto_2028 ) ( CLEAR ?auto_2030 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2029 ?auto_2030 ?auto_2031 )
      ( MAKE-3CRATE-VERIFY ?auto_2028 ?auto_2029 ?auto_2030 ?auto_2031 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2035 - SURFACE
      ?auto_2036 - SURFACE
    )
    :vars
    (
      ?auto_2037 - HOIST
      ?auto_2038 - PLACE
      ?auto_2039 - TRUCK
      ?auto_2041 - SURFACE
      ?auto_2040 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2037 ?auto_2038 ) ( IS-CRATE ?auto_2036 ) ( not ( = ?auto_2035 ?auto_2036 ) ) ( TRUCK-AT ?auto_2039 ?auto_2038 ) ( not ( = ?auto_2041 ?auto_2035 ) ) ( not ( = ?auto_2041 ?auto_2036 ) ) ( IS-CRATE ?auto_2035 ) ( SURFACE-AT ?auto_2040 ?auto_2038 ) ( IS-CRATE ?auto_2041 ) ( not ( = ?auto_2040 ?auto_2041 ) ) ( not ( = ?auto_2035 ?auto_2040 ) ) ( not ( = ?auto_2036 ?auto_2040 ) ) ( IN ?auto_2041 ?auto_2039 ) ( SURFACE-AT ?auto_2035 ?auto_2038 ) ( ON ?auto_2035 ?auto_2040 ) ( CLEAR ?auto_2035 ) ( LIFTING ?auto_2037 ?auto_2036 ) )
    :subtasks
    ( ( !LOAD ?auto_2037 ?auto_2036 ?auto_2039 ?auto_2038 )
      ( MAKE-2CRATE ?auto_2041 ?auto_2035 ?auto_2036 )
      ( MAKE-1CRATE-VERIFY ?auto_2035 ?auto_2036 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2042 - SURFACE
      ?auto_2043 - SURFACE
      ?auto_2044 - SURFACE
    )
    :vars
    (
      ?auto_2046 - HOIST
      ?auto_2048 - PLACE
      ?auto_2045 - TRUCK
      ?auto_2047 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2046 ?auto_2048 ) ( IS-CRATE ?auto_2044 ) ( not ( = ?auto_2043 ?auto_2044 ) ) ( TRUCK-AT ?auto_2045 ?auto_2048 ) ( not ( = ?auto_2042 ?auto_2043 ) ) ( not ( = ?auto_2042 ?auto_2044 ) ) ( IS-CRATE ?auto_2043 ) ( SURFACE-AT ?auto_2047 ?auto_2048 ) ( IS-CRATE ?auto_2042 ) ( not ( = ?auto_2047 ?auto_2042 ) ) ( not ( = ?auto_2043 ?auto_2047 ) ) ( not ( = ?auto_2044 ?auto_2047 ) ) ( IN ?auto_2042 ?auto_2045 ) ( SURFACE-AT ?auto_2043 ?auto_2048 ) ( ON ?auto_2043 ?auto_2047 ) ( CLEAR ?auto_2043 ) ( LIFTING ?auto_2046 ?auto_2044 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2043 ?auto_2044 )
      ( MAKE-2CRATE-VERIFY ?auto_2042 ?auto_2043 ?auto_2044 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2049 - SURFACE
      ?auto_2050 - SURFACE
      ?auto_2051 - SURFACE
      ?auto_2052 - SURFACE
    )
    :vars
    (
      ?auto_2054 - HOIST
      ?auto_2055 - PLACE
      ?auto_2053 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2054 ?auto_2055 ) ( IS-CRATE ?auto_2052 ) ( not ( = ?auto_2051 ?auto_2052 ) ) ( TRUCK-AT ?auto_2053 ?auto_2055 ) ( not ( = ?auto_2050 ?auto_2051 ) ) ( not ( = ?auto_2050 ?auto_2052 ) ) ( IS-CRATE ?auto_2051 ) ( SURFACE-AT ?auto_2049 ?auto_2055 ) ( IS-CRATE ?auto_2050 ) ( not ( = ?auto_2049 ?auto_2050 ) ) ( not ( = ?auto_2051 ?auto_2049 ) ) ( not ( = ?auto_2052 ?auto_2049 ) ) ( IN ?auto_2050 ?auto_2053 ) ( SURFACE-AT ?auto_2051 ?auto_2055 ) ( ON ?auto_2051 ?auto_2049 ) ( CLEAR ?auto_2051 ) ( LIFTING ?auto_2054 ?auto_2052 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2050 ?auto_2051 ?auto_2052 )
      ( MAKE-3CRATE-VERIFY ?auto_2049 ?auto_2050 ?auto_2051 ?auto_2052 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2063 - SURFACE
      ?auto_2064 - SURFACE
      ?auto_2065 - SURFACE
    )
    :vars
    (
      ?auto_2067 - HOIST
      ?auto_2068 - PLACE
      ?auto_2066 - TRUCK
      ?auto_2069 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2067 ?auto_2068 ) ( IS-CRATE ?auto_2065 ) ( not ( = ?auto_2064 ?auto_2065 ) ) ( TRUCK-AT ?auto_2066 ?auto_2068 ) ( not ( = ?auto_2063 ?auto_2064 ) ) ( not ( = ?auto_2063 ?auto_2065 ) ) ( IS-CRATE ?auto_2064 ) ( SURFACE-AT ?auto_2069 ?auto_2068 ) ( IS-CRATE ?auto_2063 ) ( not ( = ?auto_2069 ?auto_2063 ) ) ( not ( = ?auto_2064 ?auto_2069 ) ) ( not ( = ?auto_2065 ?auto_2069 ) ) ( IN ?auto_2063 ?auto_2066 ) ( SURFACE-AT ?auto_2064 ?auto_2068 ) ( ON ?auto_2064 ?auto_2069 ) ( AVAILABLE ?auto_2067 ) ( SURFACE-AT ?auto_2065 ?auto_2068 ) ( ON ?auto_2065 ?auto_2064 ) ( CLEAR ?auto_2065 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2069 ?auto_2064 )
      ( MAKE-2CRATE ?auto_2063 ?auto_2064 ?auto_2065 )
      ( MAKE-2CRATE-VERIFY ?auto_2063 ?auto_2064 ?auto_2065 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2070 - SURFACE
      ?auto_2071 - SURFACE
      ?auto_2072 - SURFACE
      ?auto_2073 - SURFACE
    )
    :vars
    (
      ?auto_2076 - HOIST
      ?auto_2075 - PLACE
      ?auto_2074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2076 ?auto_2075 ) ( IS-CRATE ?auto_2073 ) ( not ( = ?auto_2072 ?auto_2073 ) ) ( TRUCK-AT ?auto_2074 ?auto_2075 ) ( not ( = ?auto_2071 ?auto_2072 ) ) ( not ( = ?auto_2071 ?auto_2073 ) ) ( IS-CRATE ?auto_2072 ) ( SURFACE-AT ?auto_2070 ?auto_2075 ) ( IS-CRATE ?auto_2071 ) ( not ( = ?auto_2070 ?auto_2071 ) ) ( not ( = ?auto_2072 ?auto_2070 ) ) ( not ( = ?auto_2073 ?auto_2070 ) ) ( IN ?auto_2071 ?auto_2074 ) ( SURFACE-AT ?auto_2072 ?auto_2075 ) ( ON ?auto_2072 ?auto_2070 ) ( AVAILABLE ?auto_2076 ) ( SURFACE-AT ?auto_2073 ?auto_2075 ) ( ON ?auto_2073 ?auto_2072 ) ( CLEAR ?auto_2073 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2071 ?auto_2072 ?auto_2073 )
      ( MAKE-3CRATE-VERIFY ?auto_2070 ?auto_2071 ?auto_2072 ?auto_2073 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2085 - SURFACE
      ?auto_2086 - SURFACE
      ?auto_2087 - SURFACE
    )
    :vars
    (
      ?auto_2088 - HOIST
      ?auto_2089 - PLACE
      ?auto_2091 - SURFACE
      ?auto_2090 - TRUCK
      ?auto_2092 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2088 ?auto_2089 ) ( IS-CRATE ?auto_2087 ) ( not ( = ?auto_2086 ?auto_2087 ) ) ( not ( = ?auto_2085 ?auto_2086 ) ) ( not ( = ?auto_2085 ?auto_2087 ) ) ( IS-CRATE ?auto_2086 ) ( SURFACE-AT ?auto_2091 ?auto_2089 ) ( IS-CRATE ?auto_2085 ) ( not ( = ?auto_2091 ?auto_2085 ) ) ( not ( = ?auto_2086 ?auto_2091 ) ) ( not ( = ?auto_2087 ?auto_2091 ) ) ( IN ?auto_2085 ?auto_2090 ) ( SURFACE-AT ?auto_2086 ?auto_2089 ) ( ON ?auto_2086 ?auto_2091 ) ( AVAILABLE ?auto_2088 ) ( SURFACE-AT ?auto_2087 ?auto_2089 ) ( ON ?auto_2087 ?auto_2086 ) ( CLEAR ?auto_2087 ) ( TRUCK-AT ?auto_2090 ?auto_2092 ) ( not ( = ?auto_2092 ?auto_2089 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2090 ?auto_2092 ?auto_2089 )
      ( MAKE-3CRATE ?auto_2091 ?auto_2085 ?auto_2086 ?auto_2087 )
      ( MAKE-2CRATE-VERIFY ?auto_2085 ?auto_2086 ?auto_2087 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2093 - SURFACE
      ?auto_2094 - SURFACE
      ?auto_2095 - SURFACE
      ?auto_2096 - SURFACE
    )
    :vars
    (
      ?auto_2098 - HOIST
      ?auto_2097 - PLACE
      ?auto_2099 - TRUCK
      ?auto_2100 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2098 ?auto_2097 ) ( IS-CRATE ?auto_2096 ) ( not ( = ?auto_2095 ?auto_2096 ) ) ( not ( = ?auto_2094 ?auto_2095 ) ) ( not ( = ?auto_2094 ?auto_2096 ) ) ( IS-CRATE ?auto_2095 ) ( SURFACE-AT ?auto_2093 ?auto_2097 ) ( IS-CRATE ?auto_2094 ) ( not ( = ?auto_2093 ?auto_2094 ) ) ( not ( = ?auto_2095 ?auto_2093 ) ) ( not ( = ?auto_2096 ?auto_2093 ) ) ( IN ?auto_2094 ?auto_2099 ) ( SURFACE-AT ?auto_2095 ?auto_2097 ) ( ON ?auto_2095 ?auto_2093 ) ( AVAILABLE ?auto_2098 ) ( SURFACE-AT ?auto_2096 ?auto_2097 ) ( ON ?auto_2096 ?auto_2095 ) ( CLEAR ?auto_2096 ) ( TRUCK-AT ?auto_2099 ?auto_2100 ) ( not ( = ?auto_2100 ?auto_2097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2094 ?auto_2095 ?auto_2096 )
      ( MAKE-3CRATE-VERIFY ?auto_2093 ?auto_2094 ?auto_2095 ?auto_2096 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2157 - SURFACE
      ?auto_2158 - SURFACE
      ?auto_2159 - SURFACE
    )
    :vars
    (
      ?auto_2161 - HOIST
      ?auto_2163 - PLACE
      ?auto_2164 - SURFACE
      ?auto_2162 - TRUCK
      ?auto_2160 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2161 ?auto_2163 ) ( IS-CRATE ?auto_2159 ) ( not ( = ?auto_2158 ?auto_2159 ) ) ( not ( = ?auto_2157 ?auto_2158 ) ) ( not ( = ?auto_2157 ?auto_2159 ) ) ( IS-CRATE ?auto_2158 ) ( SURFACE-AT ?auto_2164 ?auto_2163 ) ( IS-CRATE ?auto_2157 ) ( not ( = ?auto_2164 ?auto_2157 ) ) ( not ( = ?auto_2158 ?auto_2164 ) ) ( not ( = ?auto_2159 ?auto_2164 ) ) ( IN ?auto_2157 ?auto_2162 ) ( SURFACE-AT ?auto_2158 ?auto_2163 ) ( ON ?auto_2158 ?auto_2164 ) ( AVAILABLE ?auto_2161 ) ( SURFACE-AT ?auto_2159 ?auto_2163 ) ( ON ?auto_2159 ?auto_2158 ) ( CLEAR ?auto_2159 ) ( not ( = ?auto_2160 ?auto_2163 ) ) ( TRUCK-AT ?auto_2162 ?auto_2163 ) )
    :subtasks
    ( ( !DRIVE ?auto_2162 ?auto_2163 ?auto_2160 )
      ( MAKE-3CRATE ?auto_2164 ?auto_2157 ?auto_2158 ?auto_2159 )
      ( MAKE-2CRATE-VERIFY ?auto_2157 ?auto_2158 ?auto_2159 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2165 - SURFACE
      ?auto_2166 - SURFACE
      ?auto_2167 - SURFACE
      ?auto_2168 - SURFACE
    )
    :vars
    (
      ?auto_2172 - HOIST
      ?auto_2170 - PLACE
      ?auto_2169 - TRUCK
      ?auto_2171 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2172 ?auto_2170 ) ( IS-CRATE ?auto_2168 ) ( not ( = ?auto_2167 ?auto_2168 ) ) ( not ( = ?auto_2166 ?auto_2167 ) ) ( not ( = ?auto_2166 ?auto_2168 ) ) ( IS-CRATE ?auto_2167 ) ( SURFACE-AT ?auto_2165 ?auto_2170 ) ( IS-CRATE ?auto_2166 ) ( not ( = ?auto_2165 ?auto_2166 ) ) ( not ( = ?auto_2167 ?auto_2165 ) ) ( not ( = ?auto_2168 ?auto_2165 ) ) ( IN ?auto_2166 ?auto_2169 ) ( SURFACE-AT ?auto_2167 ?auto_2170 ) ( ON ?auto_2167 ?auto_2165 ) ( AVAILABLE ?auto_2172 ) ( SURFACE-AT ?auto_2168 ?auto_2170 ) ( ON ?auto_2168 ?auto_2167 ) ( CLEAR ?auto_2168 ) ( not ( = ?auto_2171 ?auto_2170 ) ) ( TRUCK-AT ?auto_2169 ?auto_2170 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2166 ?auto_2167 ?auto_2168 )
      ( MAKE-3CRATE-VERIFY ?auto_2165 ?auto_2166 ?auto_2167 ?auto_2168 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2183 - SURFACE
      ?auto_2184 - SURFACE
      ?auto_2185 - SURFACE
    )
    :vars
    (
      ?auto_2188 - HOIST
      ?auto_2189 - PLACE
      ?auto_2190 - SURFACE
      ?auto_2186 - TRUCK
      ?auto_2187 - PLACE
      ?auto_2192 - SURFACE
      ?auto_2191 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2188 ?auto_2189 ) ( IS-CRATE ?auto_2185 ) ( not ( = ?auto_2184 ?auto_2185 ) ) ( not ( = ?auto_2183 ?auto_2184 ) ) ( not ( = ?auto_2183 ?auto_2185 ) ) ( IS-CRATE ?auto_2184 ) ( SURFACE-AT ?auto_2190 ?auto_2189 ) ( IS-CRATE ?auto_2183 ) ( not ( = ?auto_2190 ?auto_2183 ) ) ( not ( = ?auto_2184 ?auto_2190 ) ) ( not ( = ?auto_2185 ?auto_2190 ) ) ( IN ?auto_2183 ?auto_2186 ) ( SURFACE-AT ?auto_2184 ?auto_2189 ) ( ON ?auto_2184 ?auto_2190 ) ( SURFACE-AT ?auto_2185 ?auto_2189 ) ( ON ?auto_2185 ?auto_2184 ) ( CLEAR ?auto_2185 ) ( not ( = ?auto_2187 ?auto_2189 ) ) ( TRUCK-AT ?auto_2186 ?auto_2189 ) ( SURFACE-AT ?auto_2192 ?auto_2189 ) ( CLEAR ?auto_2192 ) ( LIFTING ?auto_2188 ?auto_2191 ) ( IS-CRATE ?auto_2191 ) ( not ( = ?auto_2183 ?auto_2192 ) ) ( not ( = ?auto_2183 ?auto_2191 ) ) ( not ( = ?auto_2184 ?auto_2192 ) ) ( not ( = ?auto_2184 ?auto_2191 ) ) ( not ( = ?auto_2185 ?auto_2192 ) ) ( not ( = ?auto_2185 ?auto_2191 ) ) ( not ( = ?auto_2190 ?auto_2192 ) ) ( not ( = ?auto_2190 ?auto_2191 ) ) ( not ( = ?auto_2192 ?auto_2191 ) ) )
    :subtasks
    ( ( !DROP ?auto_2188 ?auto_2191 ?auto_2192 ?auto_2189 )
      ( MAKE-3CRATE ?auto_2190 ?auto_2183 ?auto_2184 ?auto_2185 )
      ( MAKE-2CRATE-VERIFY ?auto_2183 ?auto_2184 ?auto_2185 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2193 - SURFACE
      ?auto_2194 - SURFACE
      ?auto_2195 - SURFACE
      ?auto_2196 - SURFACE
    )
    :vars
    (
      ?auto_2200 - HOIST
      ?auto_2199 - PLACE
      ?auto_2198 - TRUCK
      ?auto_2197 - PLACE
      ?auto_2202 - SURFACE
      ?auto_2201 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2200 ?auto_2199 ) ( IS-CRATE ?auto_2196 ) ( not ( = ?auto_2195 ?auto_2196 ) ) ( not ( = ?auto_2194 ?auto_2195 ) ) ( not ( = ?auto_2194 ?auto_2196 ) ) ( IS-CRATE ?auto_2195 ) ( SURFACE-AT ?auto_2193 ?auto_2199 ) ( IS-CRATE ?auto_2194 ) ( not ( = ?auto_2193 ?auto_2194 ) ) ( not ( = ?auto_2195 ?auto_2193 ) ) ( not ( = ?auto_2196 ?auto_2193 ) ) ( IN ?auto_2194 ?auto_2198 ) ( SURFACE-AT ?auto_2195 ?auto_2199 ) ( ON ?auto_2195 ?auto_2193 ) ( SURFACE-AT ?auto_2196 ?auto_2199 ) ( ON ?auto_2196 ?auto_2195 ) ( CLEAR ?auto_2196 ) ( not ( = ?auto_2197 ?auto_2199 ) ) ( TRUCK-AT ?auto_2198 ?auto_2199 ) ( SURFACE-AT ?auto_2202 ?auto_2199 ) ( CLEAR ?auto_2202 ) ( LIFTING ?auto_2200 ?auto_2201 ) ( IS-CRATE ?auto_2201 ) ( not ( = ?auto_2194 ?auto_2202 ) ) ( not ( = ?auto_2194 ?auto_2201 ) ) ( not ( = ?auto_2195 ?auto_2202 ) ) ( not ( = ?auto_2195 ?auto_2201 ) ) ( not ( = ?auto_2196 ?auto_2202 ) ) ( not ( = ?auto_2196 ?auto_2201 ) ) ( not ( = ?auto_2193 ?auto_2202 ) ) ( not ( = ?auto_2193 ?auto_2201 ) ) ( not ( = ?auto_2202 ?auto_2201 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194 ?auto_2195 ?auto_2196 )
      ( MAKE-3CRATE-VERIFY ?auto_2193 ?auto_2194 ?auto_2195 ?auto_2196 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2213 - SURFACE
      ?auto_2214 - SURFACE
      ?auto_2215 - SURFACE
    )
    :vars
    (
      ?auto_2216 - HOIST
      ?auto_2220 - PLACE
      ?auto_2222 - SURFACE
      ?auto_2221 - TRUCK
      ?auto_2217 - PLACE
      ?auto_2219 - SURFACE
      ?auto_2218 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2216 ?auto_2220 ) ( IS-CRATE ?auto_2215 ) ( not ( = ?auto_2214 ?auto_2215 ) ) ( not ( = ?auto_2213 ?auto_2214 ) ) ( not ( = ?auto_2213 ?auto_2215 ) ) ( IS-CRATE ?auto_2214 ) ( SURFACE-AT ?auto_2222 ?auto_2220 ) ( IS-CRATE ?auto_2213 ) ( not ( = ?auto_2222 ?auto_2213 ) ) ( not ( = ?auto_2214 ?auto_2222 ) ) ( not ( = ?auto_2215 ?auto_2222 ) ) ( IN ?auto_2213 ?auto_2221 ) ( SURFACE-AT ?auto_2214 ?auto_2220 ) ( ON ?auto_2214 ?auto_2222 ) ( SURFACE-AT ?auto_2215 ?auto_2220 ) ( ON ?auto_2215 ?auto_2214 ) ( CLEAR ?auto_2215 ) ( not ( = ?auto_2217 ?auto_2220 ) ) ( TRUCK-AT ?auto_2221 ?auto_2220 ) ( SURFACE-AT ?auto_2219 ?auto_2220 ) ( CLEAR ?auto_2219 ) ( IS-CRATE ?auto_2218 ) ( not ( = ?auto_2213 ?auto_2219 ) ) ( not ( = ?auto_2213 ?auto_2218 ) ) ( not ( = ?auto_2214 ?auto_2219 ) ) ( not ( = ?auto_2214 ?auto_2218 ) ) ( not ( = ?auto_2215 ?auto_2219 ) ) ( not ( = ?auto_2215 ?auto_2218 ) ) ( not ( = ?auto_2222 ?auto_2219 ) ) ( not ( = ?auto_2222 ?auto_2218 ) ) ( not ( = ?auto_2219 ?auto_2218 ) ) ( AVAILABLE ?auto_2216 ) ( IN ?auto_2218 ?auto_2221 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2216 ?auto_2218 ?auto_2221 ?auto_2220 )
      ( MAKE-3CRATE ?auto_2222 ?auto_2213 ?auto_2214 ?auto_2215 )
      ( MAKE-2CRATE-VERIFY ?auto_2213 ?auto_2214 ?auto_2215 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2223 - SURFACE
      ?auto_2224 - SURFACE
      ?auto_2225 - SURFACE
      ?auto_2226 - SURFACE
    )
    :vars
    (
      ?auto_2228 - HOIST
      ?auto_2232 - PLACE
      ?auto_2229 - TRUCK
      ?auto_2231 - PLACE
      ?auto_2227 - SURFACE
      ?auto_2230 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2228 ?auto_2232 ) ( IS-CRATE ?auto_2226 ) ( not ( = ?auto_2225 ?auto_2226 ) ) ( not ( = ?auto_2224 ?auto_2225 ) ) ( not ( = ?auto_2224 ?auto_2226 ) ) ( IS-CRATE ?auto_2225 ) ( SURFACE-AT ?auto_2223 ?auto_2232 ) ( IS-CRATE ?auto_2224 ) ( not ( = ?auto_2223 ?auto_2224 ) ) ( not ( = ?auto_2225 ?auto_2223 ) ) ( not ( = ?auto_2226 ?auto_2223 ) ) ( IN ?auto_2224 ?auto_2229 ) ( SURFACE-AT ?auto_2225 ?auto_2232 ) ( ON ?auto_2225 ?auto_2223 ) ( SURFACE-AT ?auto_2226 ?auto_2232 ) ( ON ?auto_2226 ?auto_2225 ) ( CLEAR ?auto_2226 ) ( not ( = ?auto_2231 ?auto_2232 ) ) ( TRUCK-AT ?auto_2229 ?auto_2232 ) ( SURFACE-AT ?auto_2227 ?auto_2232 ) ( CLEAR ?auto_2227 ) ( IS-CRATE ?auto_2230 ) ( not ( = ?auto_2224 ?auto_2227 ) ) ( not ( = ?auto_2224 ?auto_2230 ) ) ( not ( = ?auto_2225 ?auto_2227 ) ) ( not ( = ?auto_2225 ?auto_2230 ) ) ( not ( = ?auto_2226 ?auto_2227 ) ) ( not ( = ?auto_2226 ?auto_2230 ) ) ( not ( = ?auto_2223 ?auto_2227 ) ) ( not ( = ?auto_2223 ?auto_2230 ) ) ( not ( = ?auto_2227 ?auto_2230 ) ) ( AVAILABLE ?auto_2228 ) ( IN ?auto_2230 ?auto_2229 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2224 ?auto_2225 ?auto_2226 )
      ( MAKE-3CRATE-VERIFY ?auto_2223 ?auto_2224 ?auto_2225 ?auto_2226 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2243 - SURFACE
      ?auto_2244 - SURFACE
      ?auto_2245 - SURFACE
    )
    :vars
    (
      ?auto_2247 - HOIST
      ?auto_2246 - PLACE
      ?auto_2252 - SURFACE
      ?auto_2248 - PLACE
      ?auto_2251 - TRUCK
      ?auto_2250 - SURFACE
      ?auto_2249 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2247 ?auto_2246 ) ( IS-CRATE ?auto_2245 ) ( not ( = ?auto_2244 ?auto_2245 ) ) ( not ( = ?auto_2243 ?auto_2244 ) ) ( not ( = ?auto_2243 ?auto_2245 ) ) ( IS-CRATE ?auto_2244 ) ( SURFACE-AT ?auto_2252 ?auto_2246 ) ( IS-CRATE ?auto_2243 ) ( not ( = ?auto_2252 ?auto_2243 ) ) ( not ( = ?auto_2244 ?auto_2252 ) ) ( not ( = ?auto_2245 ?auto_2252 ) ) ( SURFACE-AT ?auto_2244 ?auto_2246 ) ( ON ?auto_2244 ?auto_2252 ) ( SURFACE-AT ?auto_2245 ?auto_2246 ) ( ON ?auto_2245 ?auto_2244 ) ( CLEAR ?auto_2245 ) ( not ( = ?auto_2248 ?auto_2246 ) ) ( TRUCK-AT ?auto_2251 ?auto_2246 ) ( SURFACE-AT ?auto_2250 ?auto_2246 ) ( CLEAR ?auto_2250 ) ( IS-CRATE ?auto_2249 ) ( not ( = ?auto_2243 ?auto_2250 ) ) ( not ( = ?auto_2243 ?auto_2249 ) ) ( not ( = ?auto_2244 ?auto_2250 ) ) ( not ( = ?auto_2244 ?auto_2249 ) ) ( not ( = ?auto_2245 ?auto_2250 ) ) ( not ( = ?auto_2245 ?auto_2249 ) ) ( not ( = ?auto_2252 ?auto_2250 ) ) ( not ( = ?auto_2252 ?auto_2249 ) ) ( not ( = ?auto_2250 ?auto_2249 ) ) ( IN ?auto_2249 ?auto_2251 ) ( LIFTING ?auto_2247 ?auto_2243 ) )
    :subtasks
    ( ( !LOAD ?auto_2247 ?auto_2243 ?auto_2251 ?auto_2246 )
      ( MAKE-3CRATE ?auto_2252 ?auto_2243 ?auto_2244 ?auto_2245 )
      ( MAKE-2CRATE-VERIFY ?auto_2243 ?auto_2244 ?auto_2245 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2253 - SURFACE
      ?auto_2254 - SURFACE
      ?auto_2255 - SURFACE
      ?auto_2256 - SURFACE
    )
    :vars
    (
      ?auto_2262 - HOIST
      ?auto_2261 - PLACE
      ?auto_2260 - PLACE
      ?auto_2257 - TRUCK
      ?auto_2258 - SURFACE
      ?auto_2259 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2262 ?auto_2261 ) ( IS-CRATE ?auto_2256 ) ( not ( = ?auto_2255 ?auto_2256 ) ) ( not ( = ?auto_2254 ?auto_2255 ) ) ( not ( = ?auto_2254 ?auto_2256 ) ) ( IS-CRATE ?auto_2255 ) ( SURFACE-AT ?auto_2253 ?auto_2261 ) ( IS-CRATE ?auto_2254 ) ( not ( = ?auto_2253 ?auto_2254 ) ) ( not ( = ?auto_2255 ?auto_2253 ) ) ( not ( = ?auto_2256 ?auto_2253 ) ) ( SURFACE-AT ?auto_2255 ?auto_2261 ) ( ON ?auto_2255 ?auto_2253 ) ( SURFACE-AT ?auto_2256 ?auto_2261 ) ( ON ?auto_2256 ?auto_2255 ) ( CLEAR ?auto_2256 ) ( not ( = ?auto_2260 ?auto_2261 ) ) ( TRUCK-AT ?auto_2257 ?auto_2261 ) ( SURFACE-AT ?auto_2258 ?auto_2261 ) ( CLEAR ?auto_2258 ) ( IS-CRATE ?auto_2259 ) ( not ( = ?auto_2254 ?auto_2258 ) ) ( not ( = ?auto_2254 ?auto_2259 ) ) ( not ( = ?auto_2255 ?auto_2258 ) ) ( not ( = ?auto_2255 ?auto_2259 ) ) ( not ( = ?auto_2256 ?auto_2258 ) ) ( not ( = ?auto_2256 ?auto_2259 ) ) ( not ( = ?auto_2253 ?auto_2258 ) ) ( not ( = ?auto_2253 ?auto_2259 ) ) ( not ( = ?auto_2258 ?auto_2259 ) ) ( IN ?auto_2259 ?auto_2257 ) ( LIFTING ?auto_2262 ?auto_2254 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2254 ?auto_2255 ?auto_2256 )
      ( MAKE-3CRATE-VERIFY ?auto_2253 ?auto_2254 ?auto_2255 ?auto_2256 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2273 - SURFACE
      ?auto_2274 - SURFACE
      ?auto_2275 - SURFACE
    )
    :vars
    (
      ?auto_2277 - HOIST
      ?auto_2279 - PLACE
      ?auto_2282 - SURFACE
      ?auto_2280 - PLACE
      ?auto_2281 - TRUCK
      ?auto_2278 - SURFACE
      ?auto_2276 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2277 ?auto_2279 ) ( IS-CRATE ?auto_2275 ) ( not ( = ?auto_2274 ?auto_2275 ) ) ( not ( = ?auto_2273 ?auto_2274 ) ) ( not ( = ?auto_2273 ?auto_2275 ) ) ( IS-CRATE ?auto_2274 ) ( SURFACE-AT ?auto_2282 ?auto_2279 ) ( IS-CRATE ?auto_2273 ) ( not ( = ?auto_2282 ?auto_2273 ) ) ( not ( = ?auto_2274 ?auto_2282 ) ) ( not ( = ?auto_2275 ?auto_2282 ) ) ( SURFACE-AT ?auto_2274 ?auto_2279 ) ( ON ?auto_2274 ?auto_2282 ) ( SURFACE-AT ?auto_2275 ?auto_2279 ) ( ON ?auto_2275 ?auto_2274 ) ( CLEAR ?auto_2275 ) ( not ( = ?auto_2280 ?auto_2279 ) ) ( TRUCK-AT ?auto_2281 ?auto_2279 ) ( SURFACE-AT ?auto_2278 ?auto_2279 ) ( IS-CRATE ?auto_2276 ) ( not ( = ?auto_2273 ?auto_2278 ) ) ( not ( = ?auto_2273 ?auto_2276 ) ) ( not ( = ?auto_2274 ?auto_2278 ) ) ( not ( = ?auto_2274 ?auto_2276 ) ) ( not ( = ?auto_2275 ?auto_2278 ) ) ( not ( = ?auto_2275 ?auto_2276 ) ) ( not ( = ?auto_2282 ?auto_2278 ) ) ( not ( = ?auto_2282 ?auto_2276 ) ) ( not ( = ?auto_2278 ?auto_2276 ) ) ( IN ?auto_2276 ?auto_2281 ) ( AVAILABLE ?auto_2277 ) ( SURFACE-AT ?auto_2273 ?auto_2279 ) ( ON ?auto_2273 ?auto_2278 ) ( CLEAR ?auto_2273 ) )
    :subtasks
    ( ( !LIFT ?auto_2277 ?auto_2273 ?auto_2278 ?auto_2279 )
      ( MAKE-3CRATE ?auto_2282 ?auto_2273 ?auto_2274 ?auto_2275 )
      ( MAKE-2CRATE-VERIFY ?auto_2273 ?auto_2274 ?auto_2275 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2283 - SURFACE
      ?auto_2284 - SURFACE
      ?auto_2285 - SURFACE
      ?auto_2286 - SURFACE
    )
    :vars
    (
      ?auto_2288 - HOIST
      ?auto_2287 - PLACE
      ?auto_2290 - PLACE
      ?auto_2291 - TRUCK
      ?auto_2289 - SURFACE
      ?auto_2292 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2288 ?auto_2287 ) ( IS-CRATE ?auto_2286 ) ( not ( = ?auto_2285 ?auto_2286 ) ) ( not ( = ?auto_2284 ?auto_2285 ) ) ( not ( = ?auto_2284 ?auto_2286 ) ) ( IS-CRATE ?auto_2285 ) ( SURFACE-AT ?auto_2283 ?auto_2287 ) ( IS-CRATE ?auto_2284 ) ( not ( = ?auto_2283 ?auto_2284 ) ) ( not ( = ?auto_2285 ?auto_2283 ) ) ( not ( = ?auto_2286 ?auto_2283 ) ) ( SURFACE-AT ?auto_2285 ?auto_2287 ) ( ON ?auto_2285 ?auto_2283 ) ( SURFACE-AT ?auto_2286 ?auto_2287 ) ( ON ?auto_2286 ?auto_2285 ) ( CLEAR ?auto_2286 ) ( not ( = ?auto_2290 ?auto_2287 ) ) ( TRUCK-AT ?auto_2291 ?auto_2287 ) ( SURFACE-AT ?auto_2289 ?auto_2287 ) ( IS-CRATE ?auto_2292 ) ( not ( = ?auto_2284 ?auto_2289 ) ) ( not ( = ?auto_2284 ?auto_2292 ) ) ( not ( = ?auto_2285 ?auto_2289 ) ) ( not ( = ?auto_2285 ?auto_2292 ) ) ( not ( = ?auto_2286 ?auto_2289 ) ) ( not ( = ?auto_2286 ?auto_2292 ) ) ( not ( = ?auto_2283 ?auto_2289 ) ) ( not ( = ?auto_2283 ?auto_2292 ) ) ( not ( = ?auto_2289 ?auto_2292 ) ) ( IN ?auto_2292 ?auto_2291 ) ( AVAILABLE ?auto_2288 ) ( SURFACE-AT ?auto_2284 ?auto_2287 ) ( ON ?auto_2284 ?auto_2289 ) ( CLEAR ?auto_2284 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2284 ?auto_2285 ?auto_2286 )
      ( MAKE-3CRATE-VERIFY ?auto_2283 ?auto_2284 ?auto_2285 ?auto_2286 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2304 - SURFACE
      ?auto_2305 - SURFACE
      ?auto_2306 - SURFACE
    )
    :vars
    (
      ?auto_2307 - HOIST
      ?auto_2308 - PLACE
      ?auto_2313 - SURFACE
      ?auto_2310 - PLACE
      ?auto_2309 - TRUCK
      ?auto_2311 - SURFACE
      ?auto_2312 - SURFACE
      ?auto_2314 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2307 ?auto_2308 ) ( IS-CRATE ?auto_2306 ) ( not ( = ?auto_2305 ?auto_2306 ) ) ( not ( = ?auto_2304 ?auto_2305 ) ) ( not ( = ?auto_2304 ?auto_2306 ) ) ( IS-CRATE ?auto_2305 ) ( SURFACE-AT ?auto_2313 ?auto_2308 ) ( IS-CRATE ?auto_2304 ) ( not ( = ?auto_2313 ?auto_2304 ) ) ( not ( = ?auto_2305 ?auto_2313 ) ) ( not ( = ?auto_2306 ?auto_2313 ) ) ( SURFACE-AT ?auto_2305 ?auto_2308 ) ( ON ?auto_2305 ?auto_2313 ) ( SURFACE-AT ?auto_2306 ?auto_2308 ) ( ON ?auto_2306 ?auto_2305 ) ( CLEAR ?auto_2306 ) ( not ( = ?auto_2310 ?auto_2308 ) ) ( TRUCK-AT ?auto_2309 ?auto_2308 ) ( SURFACE-AT ?auto_2311 ?auto_2308 ) ( IS-CRATE ?auto_2312 ) ( not ( = ?auto_2304 ?auto_2311 ) ) ( not ( = ?auto_2304 ?auto_2312 ) ) ( not ( = ?auto_2305 ?auto_2311 ) ) ( not ( = ?auto_2305 ?auto_2312 ) ) ( not ( = ?auto_2306 ?auto_2311 ) ) ( not ( = ?auto_2306 ?auto_2312 ) ) ( not ( = ?auto_2313 ?auto_2311 ) ) ( not ( = ?auto_2313 ?auto_2312 ) ) ( not ( = ?auto_2311 ?auto_2312 ) ) ( IN ?auto_2312 ?auto_2309 ) ( SURFACE-AT ?auto_2304 ?auto_2308 ) ( ON ?auto_2304 ?auto_2311 ) ( CLEAR ?auto_2304 ) ( LIFTING ?auto_2307 ?auto_2314 ) ( IS-CRATE ?auto_2314 ) ( not ( = ?auto_2304 ?auto_2314 ) ) ( not ( = ?auto_2305 ?auto_2314 ) ) ( not ( = ?auto_2306 ?auto_2314 ) ) ( not ( = ?auto_2313 ?auto_2314 ) ) ( not ( = ?auto_2311 ?auto_2314 ) ) ( not ( = ?auto_2312 ?auto_2314 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2307 ?auto_2314 ?auto_2309 ?auto_2308 )
      ( MAKE-3CRATE ?auto_2313 ?auto_2304 ?auto_2305 ?auto_2306 )
      ( MAKE-2CRATE-VERIFY ?auto_2304 ?auto_2305 ?auto_2306 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2315 - SURFACE
      ?auto_2316 - SURFACE
      ?auto_2317 - SURFACE
      ?auto_2318 - SURFACE
    )
    :vars
    (
      ?auto_2324 - HOIST
      ?auto_2323 - PLACE
      ?auto_2319 - PLACE
      ?auto_2320 - TRUCK
      ?auto_2321 - SURFACE
      ?auto_2322 - SURFACE
      ?auto_2325 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2324 ?auto_2323 ) ( IS-CRATE ?auto_2318 ) ( not ( = ?auto_2317 ?auto_2318 ) ) ( not ( = ?auto_2316 ?auto_2317 ) ) ( not ( = ?auto_2316 ?auto_2318 ) ) ( IS-CRATE ?auto_2317 ) ( SURFACE-AT ?auto_2315 ?auto_2323 ) ( IS-CRATE ?auto_2316 ) ( not ( = ?auto_2315 ?auto_2316 ) ) ( not ( = ?auto_2317 ?auto_2315 ) ) ( not ( = ?auto_2318 ?auto_2315 ) ) ( SURFACE-AT ?auto_2317 ?auto_2323 ) ( ON ?auto_2317 ?auto_2315 ) ( SURFACE-AT ?auto_2318 ?auto_2323 ) ( ON ?auto_2318 ?auto_2317 ) ( CLEAR ?auto_2318 ) ( not ( = ?auto_2319 ?auto_2323 ) ) ( TRUCK-AT ?auto_2320 ?auto_2323 ) ( SURFACE-AT ?auto_2321 ?auto_2323 ) ( IS-CRATE ?auto_2322 ) ( not ( = ?auto_2316 ?auto_2321 ) ) ( not ( = ?auto_2316 ?auto_2322 ) ) ( not ( = ?auto_2317 ?auto_2321 ) ) ( not ( = ?auto_2317 ?auto_2322 ) ) ( not ( = ?auto_2318 ?auto_2321 ) ) ( not ( = ?auto_2318 ?auto_2322 ) ) ( not ( = ?auto_2315 ?auto_2321 ) ) ( not ( = ?auto_2315 ?auto_2322 ) ) ( not ( = ?auto_2321 ?auto_2322 ) ) ( IN ?auto_2322 ?auto_2320 ) ( SURFACE-AT ?auto_2316 ?auto_2323 ) ( ON ?auto_2316 ?auto_2321 ) ( CLEAR ?auto_2316 ) ( LIFTING ?auto_2324 ?auto_2325 ) ( IS-CRATE ?auto_2325 ) ( not ( = ?auto_2316 ?auto_2325 ) ) ( not ( = ?auto_2317 ?auto_2325 ) ) ( not ( = ?auto_2318 ?auto_2325 ) ) ( not ( = ?auto_2315 ?auto_2325 ) ) ( not ( = ?auto_2321 ?auto_2325 ) ) ( not ( = ?auto_2322 ?auto_2325 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2316 ?auto_2317 ?auto_2318 )
      ( MAKE-3CRATE-VERIFY ?auto_2315 ?auto_2316 ?auto_2317 ?auto_2318 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2337 - SURFACE
      ?auto_2338 - SURFACE
      ?auto_2339 - SURFACE
    )
    :vars
    (
      ?auto_2341 - HOIST
      ?auto_2344 - PLACE
      ?auto_2347 - SURFACE
      ?auto_2346 - PLACE
      ?auto_2343 - TRUCK
      ?auto_2340 - SURFACE
      ?auto_2342 - SURFACE
      ?auto_2345 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2341 ?auto_2344 ) ( IS-CRATE ?auto_2339 ) ( not ( = ?auto_2338 ?auto_2339 ) ) ( not ( = ?auto_2337 ?auto_2338 ) ) ( not ( = ?auto_2337 ?auto_2339 ) ) ( IS-CRATE ?auto_2338 ) ( SURFACE-AT ?auto_2347 ?auto_2344 ) ( IS-CRATE ?auto_2337 ) ( not ( = ?auto_2347 ?auto_2337 ) ) ( not ( = ?auto_2338 ?auto_2347 ) ) ( not ( = ?auto_2339 ?auto_2347 ) ) ( SURFACE-AT ?auto_2338 ?auto_2344 ) ( ON ?auto_2338 ?auto_2347 ) ( SURFACE-AT ?auto_2339 ?auto_2344 ) ( ON ?auto_2339 ?auto_2338 ) ( CLEAR ?auto_2339 ) ( not ( = ?auto_2346 ?auto_2344 ) ) ( TRUCK-AT ?auto_2343 ?auto_2344 ) ( SURFACE-AT ?auto_2340 ?auto_2344 ) ( IS-CRATE ?auto_2342 ) ( not ( = ?auto_2337 ?auto_2340 ) ) ( not ( = ?auto_2337 ?auto_2342 ) ) ( not ( = ?auto_2338 ?auto_2340 ) ) ( not ( = ?auto_2338 ?auto_2342 ) ) ( not ( = ?auto_2339 ?auto_2340 ) ) ( not ( = ?auto_2339 ?auto_2342 ) ) ( not ( = ?auto_2347 ?auto_2340 ) ) ( not ( = ?auto_2347 ?auto_2342 ) ) ( not ( = ?auto_2340 ?auto_2342 ) ) ( IN ?auto_2342 ?auto_2343 ) ( SURFACE-AT ?auto_2337 ?auto_2344 ) ( ON ?auto_2337 ?auto_2340 ) ( IS-CRATE ?auto_2345 ) ( not ( = ?auto_2337 ?auto_2345 ) ) ( not ( = ?auto_2338 ?auto_2345 ) ) ( not ( = ?auto_2339 ?auto_2345 ) ) ( not ( = ?auto_2347 ?auto_2345 ) ) ( not ( = ?auto_2340 ?auto_2345 ) ) ( not ( = ?auto_2342 ?auto_2345 ) ) ( AVAILABLE ?auto_2341 ) ( SURFACE-AT ?auto_2345 ?auto_2344 ) ( ON ?auto_2345 ?auto_2337 ) ( CLEAR ?auto_2345 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2340 ?auto_2337 )
      ( MAKE-3CRATE ?auto_2347 ?auto_2337 ?auto_2338 ?auto_2339 )
      ( MAKE-2CRATE-VERIFY ?auto_2337 ?auto_2338 ?auto_2339 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2348 - SURFACE
      ?auto_2349 - SURFACE
      ?auto_2350 - SURFACE
      ?auto_2351 - SURFACE
    )
    :vars
    (
      ?auto_2354 - HOIST
      ?auto_2358 - PLACE
      ?auto_2352 - PLACE
      ?auto_2355 - TRUCK
      ?auto_2356 - SURFACE
      ?auto_2357 - SURFACE
      ?auto_2353 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2354 ?auto_2358 ) ( IS-CRATE ?auto_2351 ) ( not ( = ?auto_2350 ?auto_2351 ) ) ( not ( = ?auto_2349 ?auto_2350 ) ) ( not ( = ?auto_2349 ?auto_2351 ) ) ( IS-CRATE ?auto_2350 ) ( SURFACE-AT ?auto_2348 ?auto_2358 ) ( IS-CRATE ?auto_2349 ) ( not ( = ?auto_2348 ?auto_2349 ) ) ( not ( = ?auto_2350 ?auto_2348 ) ) ( not ( = ?auto_2351 ?auto_2348 ) ) ( SURFACE-AT ?auto_2350 ?auto_2358 ) ( ON ?auto_2350 ?auto_2348 ) ( SURFACE-AT ?auto_2351 ?auto_2358 ) ( ON ?auto_2351 ?auto_2350 ) ( CLEAR ?auto_2351 ) ( not ( = ?auto_2352 ?auto_2358 ) ) ( TRUCK-AT ?auto_2355 ?auto_2358 ) ( SURFACE-AT ?auto_2356 ?auto_2358 ) ( IS-CRATE ?auto_2357 ) ( not ( = ?auto_2349 ?auto_2356 ) ) ( not ( = ?auto_2349 ?auto_2357 ) ) ( not ( = ?auto_2350 ?auto_2356 ) ) ( not ( = ?auto_2350 ?auto_2357 ) ) ( not ( = ?auto_2351 ?auto_2356 ) ) ( not ( = ?auto_2351 ?auto_2357 ) ) ( not ( = ?auto_2348 ?auto_2356 ) ) ( not ( = ?auto_2348 ?auto_2357 ) ) ( not ( = ?auto_2356 ?auto_2357 ) ) ( IN ?auto_2357 ?auto_2355 ) ( SURFACE-AT ?auto_2349 ?auto_2358 ) ( ON ?auto_2349 ?auto_2356 ) ( IS-CRATE ?auto_2353 ) ( not ( = ?auto_2349 ?auto_2353 ) ) ( not ( = ?auto_2350 ?auto_2353 ) ) ( not ( = ?auto_2351 ?auto_2353 ) ) ( not ( = ?auto_2348 ?auto_2353 ) ) ( not ( = ?auto_2356 ?auto_2353 ) ) ( not ( = ?auto_2357 ?auto_2353 ) ) ( AVAILABLE ?auto_2354 ) ( SURFACE-AT ?auto_2353 ?auto_2358 ) ( ON ?auto_2353 ?auto_2349 ) ( CLEAR ?auto_2353 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2349 ?auto_2350 ?auto_2351 )
      ( MAKE-3CRATE-VERIFY ?auto_2348 ?auto_2349 ?auto_2350 ?auto_2351 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2370 - SURFACE
      ?auto_2371 - SURFACE
      ?auto_2372 - SURFACE
    )
    :vars
    (
      ?auto_2376 - HOIST
      ?auto_2373 - PLACE
      ?auto_2380 - SURFACE
      ?auto_2375 - PLACE
      ?auto_2374 - SURFACE
      ?auto_2379 - SURFACE
      ?auto_2377 - TRUCK
      ?auto_2378 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2376 ?auto_2373 ) ( IS-CRATE ?auto_2372 ) ( not ( = ?auto_2371 ?auto_2372 ) ) ( not ( = ?auto_2370 ?auto_2371 ) ) ( not ( = ?auto_2370 ?auto_2372 ) ) ( IS-CRATE ?auto_2371 ) ( SURFACE-AT ?auto_2380 ?auto_2373 ) ( IS-CRATE ?auto_2370 ) ( not ( = ?auto_2380 ?auto_2370 ) ) ( not ( = ?auto_2371 ?auto_2380 ) ) ( not ( = ?auto_2372 ?auto_2380 ) ) ( SURFACE-AT ?auto_2371 ?auto_2373 ) ( ON ?auto_2371 ?auto_2380 ) ( SURFACE-AT ?auto_2372 ?auto_2373 ) ( ON ?auto_2372 ?auto_2371 ) ( CLEAR ?auto_2372 ) ( not ( = ?auto_2375 ?auto_2373 ) ) ( SURFACE-AT ?auto_2374 ?auto_2373 ) ( IS-CRATE ?auto_2379 ) ( not ( = ?auto_2370 ?auto_2374 ) ) ( not ( = ?auto_2370 ?auto_2379 ) ) ( not ( = ?auto_2371 ?auto_2374 ) ) ( not ( = ?auto_2371 ?auto_2379 ) ) ( not ( = ?auto_2372 ?auto_2374 ) ) ( not ( = ?auto_2372 ?auto_2379 ) ) ( not ( = ?auto_2380 ?auto_2374 ) ) ( not ( = ?auto_2380 ?auto_2379 ) ) ( not ( = ?auto_2374 ?auto_2379 ) ) ( IN ?auto_2379 ?auto_2377 ) ( SURFACE-AT ?auto_2370 ?auto_2373 ) ( ON ?auto_2370 ?auto_2374 ) ( IS-CRATE ?auto_2378 ) ( not ( = ?auto_2370 ?auto_2378 ) ) ( not ( = ?auto_2371 ?auto_2378 ) ) ( not ( = ?auto_2372 ?auto_2378 ) ) ( not ( = ?auto_2380 ?auto_2378 ) ) ( not ( = ?auto_2374 ?auto_2378 ) ) ( not ( = ?auto_2379 ?auto_2378 ) ) ( AVAILABLE ?auto_2376 ) ( SURFACE-AT ?auto_2378 ?auto_2373 ) ( ON ?auto_2378 ?auto_2370 ) ( CLEAR ?auto_2378 ) ( TRUCK-AT ?auto_2377 ?auto_2375 ) )
    :subtasks
    ( ( !DRIVE ?auto_2377 ?auto_2375 ?auto_2373 )
      ( MAKE-3CRATE ?auto_2380 ?auto_2370 ?auto_2371 ?auto_2372 )
      ( MAKE-2CRATE-VERIFY ?auto_2370 ?auto_2371 ?auto_2372 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2381 - SURFACE
      ?auto_2382 - SURFACE
      ?auto_2383 - SURFACE
      ?auto_2384 - SURFACE
    )
    :vars
    (
      ?auto_2388 - HOIST
      ?auto_2387 - PLACE
      ?auto_2386 - PLACE
      ?auto_2390 - SURFACE
      ?auto_2389 - SURFACE
      ?auto_2391 - TRUCK
      ?auto_2385 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2388 ?auto_2387 ) ( IS-CRATE ?auto_2384 ) ( not ( = ?auto_2383 ?auto_2384 ) ) ( not ( = ?auto_2382 ?auto_2383 ) ) ( not ( = ?auto_2382 ?auto_2384 ) ) ( IS-CRATE ?auto_2383 ) ( SURFACE-AT ?auto_2381 ?auto_2387 ) ( IS-CRATE ?auto_2382 ) ( not ( = ?auto_2381 ?auto_2382 ) ) ( not ( = ?auto_2383 ?auto_2381 ) ) ( not ( = ?auto_2384 ?auto_2381 ) ) ( SURFACE-AT ?auto_2383 ?auto_2387 ) ( ON ?auto_2383 ?auto_2381 ) ( SURFACE-AT ?auto_2384 ?auto_2387 ) ( ON ?auto_2384 ?auto_2383 ) ( CLEAR ?auto_2384 ) ( not ( = ?auto_2386 ?auto_2387 ) ) ( SURFACE-AT ?auto_2390 ?auto_2387 ) ( IS-CRATE ?auto_2389 ) ( not ( = ?auto_2382 ?auto_2390 ) ) ( not ( = ?auto_2382 ?auto_2389 ) ) ( not ( = ?auto_2383 ?auto_2390 ) ) ( not ( = ?auto_2383 ?auto_2389 ) ) ( not ( = ?auto_2384 ?auto_2390 ) ) ( not ( = ?auto_2384 ?auto_2389 ) ) ( not ( = ?auto_2381 ?auto_2390 ) ) ( not ( = ?auto_2381 ?auto_2389 ) ) ( not ( = ?auto_2390 ?auto_2389 ) ) ( IN ?auto_2389 ?auto_2391 ) ( SURFACE-AT ?auto_2382 ?auto_2387 ) ( ON ?auto_2382 ?auto_2390 ) ( IS-CRATE ?auto_2385 ) ( not ( = ?auto_2382 ?auto_2385 ) ) ( not ( = ?auto_2383 ?auto_2385 ) ) ( not ( = ?auto_2384 ?auto_2385 ) ) ( not ( = ?auto_2381 ?auto_2385 ) ) ( not ( = ?auto_2390 ?auto_2385 ) ) ( not ( = ?auto_2389 ?auto_2385 ) ) ( AVAILABLE ?auto_2388 ) ( SURFACE-AT ?auto_2385 ?auto_2387 ) ( ON ?auto_2385 ?auto_2382 ) ( CLEAR ?auto_2385 ) ( TRUCK-AT ?auto_2391 ?auto_2386 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2382 ?auto_2383 ?auto_2384 )
      ( MAKE-3CRATE-VERIFY ?auto_2381 ?auto_2382 ?auto_2383 ?auto_2384 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2404 - SURFACE
      ?auto_2405 - SURFACE
      ?auto_2406 - SURFACE
    )
    :vars
    (
      ?auto_2409 - HOIST
      ?auto_2407 - PLACE
      ?auto_2414 - SURFACE
      ?auto_2410 - PLACE
      ?auto_2411 - SURFACE
      ?auto_2412 - SURFACE
      ?auto_2408 - SURFACE
      ?auto_2413 - TRUCK
      ?auto_2415 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2409 ?auto_2407 ) ( IS-CRATE ?auto_2406 ) ( not ( = ?auto_2405 ?auto_2406 ) ) ( not ( = ?auto_2404 ?auto_2405 ) ) ( not ( = ?auto_2404 ?auto_2406 ) ) ( IS-CRATE ?auto_2405 ) ( SURFACE-AT ?auto_2414 ?auto_2407 ) ( IS-CRATE ?auto_2404 ) ( not ( = ?auto_2414 ?auto_2404 ) ) ( not ( = ?auto_2405 ?auto_2414 ) ) ( not ( = ?auto_2406 ?auto_2414 ) ) ( SURFACE-AT ?auto_2405 ?auto_2407 ) ( ON ?auto_2405 ?auto_2414 ) ( SURFACE-AT ?auto_2406 ?auto_2407 ) ( ON ?auto_2406 ?auto_2405 ) ( CLEAR ?auto_2406 ) ( not ( = ?auto_2410 ?auto_2407 ) ) ( SURFACE-AT ?auto_2411 ?auto_2407 ) ( IS-CRATE ?auto_2412 ) ( not ( = ?auto_2404 ?auto_2411 ) ) ( not ( = ?auto_2404 ?auto_2412 ) ) ( not ( = ?auto_2405 ?auto_2411 ) ) ( not ( = ?auto_2405 ?auto_2412 ) ) ( not ( = ?auto_2406 ?auto_2411 ) ) ( not ( = ?auto_2406 ?auto_2412 ) ) ( not ( = ?auto_2414 ?auto_2411 ) ) ( not ( = ?auto_2414 ?auto_2412 ) ) ( not ( = ?auto_2411 ?auto_2412 ) ) ( SURFACE-AT ?auto_2404 ?auto_2407 ) ( ON ?auto_2404 ?auto_2411 ) ( IS-CRATE ?auto_2408 ) ( not ( = ?auto_2404 ?auto_2408 ) ) ( not ( = ?auto_2405 ?auto_2408 ) ) ( not ( = ?auto_2406 ?auto_2408 ) ) ( not ( = ?auto_2414 ?auto_2408 ) ) ( not ( = ?auto_2411 ?auto_2408 ) ) ( not ( = ?auto_2412 ?auto_2408 ) ) ( AVAILABLE ?auto_2409 ) ( SURFACE-AT ?auto_2408 ?auto_2407 ) ( ON ?auto_2408 ?auto_2404 ) ( CLEAR ?auto_2408 ) ( TRUCK-AT ?auto_2413 ?auto_2410 ) ( HOIST-AT ?auto_2415 ?auto_2410 ) ( LIFTING ?auto_2415 ?auto_2412 ) ( not ( = ?auto_2409 ?auto_2415 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2415 ?auto_2412 ?auto_2413 ?auto_2410 )
      ( MAKE-3CRATE ?auto_2414 ?auto_2404 ?auto_2405 ?auto_2406 )
      ( MAKE-2CRATE-VERIFY ?auto_2404 ?auto_2405 ?auto_2406 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2416 - SURFACE
      ?auto_2417 - SURFACE
      ?auto_2418 - SURFACE
      ?auto_2419 - SURFACE
    )
    :vars
    (
      ?auto_2425 - HOIST
      ?auto_2426 - PLACE
      ?auto_2421 - PLACE
      ?auto_2422 - SURFACE
      ?auto_2420 - SURFACE
      ?auto_2423 - SURFACE
      ?auto_2424 - TRUCK
      ?auto_2427 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2425 ?auto_2426 ) ( IS-CRATE ?auto_2419 ) ( not ( = ?auto_2418 ?auto_2419 ) ) ( not ( = ?auto_2417 ?auto_2418 ) ) ( not ( = ?auto_2417 ?auto_2419 ) ) ( IS-CRATE ?auto_2418 ) ( SURFACE-AT ?auto_2416 ?auto_2426 ) ( IS-CRATE ?auto_2417 ) ( not ( = ?auto_2416 ?auto_2417 ) ) ( not ( = ?auto_2418 ?auto_2416 ) ) ( not ( = ?auto_2419 ?auto_2416 ) ) ( SURFACE-AT ?auto_2418 ?auto_2426 ) ( ON ?auto_2418 ?auto_2416 ) ( SURFACE-AT ?auto_2419 ?auto_2426 ) ( ON ?auto_2419 ?auto_2418 ) ( CLEAR ?auto_2419 ) ( not ( = ?auto_2421 ?auto_2426 ) ) ( SURFACE-AT ?auto_2422 ?auto_2426 ) ( IS-CRATE ?auto_2420 ) ( not ( = ?auto_2417 ?auto_2422 ) ) ( not ( = ?auto_2417 ?auto_2420 ) ) ( not ( = ?auto_2418 ?auto_2422 ) ) ( not ( = ?auto_2418 ?auto_2420 ) ) ( not ( = ?auto_2419 ?auto_2422 ) ) ( not ( = ?auto_2419 ?auto_2420 ) ) ( not ( = ?auto_2416 ?auto_2422 ) ) ( not ( = ?auto_2416 ?auto_2420 ) ) ( not ( = ?auto_2422 ?auto_2420 ) ) ( SURFACE-AT ?auto_2417 ?auto_2426 ) ( ON ?auto_2417 ?auto_2422 ) ( IS-CRATE ?auto_2423 ) ( not ( = ?auto_2417 ?auto_2423 ) ) ( not ( = ?auto_2418 ?auto_2423 ) ) ( not ( = ?auto_2419 ?auto_2423 ) ) ( not ( = ?auto_2416 ?auto_2423 ) ) ( not ( = ?auto_2422 ?auto_2423 ) ) ( not ( = ?auto_2420 ?auto_2423 ) ) ( AVAILABLE ?auto_2425 ) ( SURFACE-AT ?auto_2423 ?auto_2426 ) ( ON ?auto_2423 ?auto_2417 ) ( CLEAR ?auto_2423 ) ( TRUCK-AT ?auto_2424 ?auto_2421 ) ( HOIST-AT ?auto_2427 ?auto_2421 ) ( LIFTING ?auto_2427 ?auto_2420 ) ( not ( = ?auto_2425 ?auto_2427 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2417 ?auto_2418 ?auto_2419 )
      ( MAKE-3CRATE-VERIFY ?auto_2416 ?auto_2417 ?auto_2418 ?auto_2419 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2441 - SURFACE
      ?auto_2442 - SURFACE
      ?auto_2443 - SURFACE
    )
    :vars
    (
      ?auto_2444 - HOIST
      ?auto_2451 - PLACE
      ?auto_2452 - SURFACE
      ?auto_2449 - PLACE
      ?auto_2450 - SURFACE
      ?auto_2448 - SURFACE
      ?auto_2446 - SURFACE
      ?auto_2447 - TRUCK
      ?auto_2445 - HOIST
      ?auto_2453 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2444 ?auto_2451 ) ( IS-CRATE ?auto_2443 ) ( not ( = ?auto_2442 ?auto_2443 ) ) ( not ( = ?auto_2441 ?auto_2442 ) ) ( not ( = ?auto_2441 ?auto_2443 ) ) ( IS-CRATE ?auto_2442 ) ( SURFACE-AT ?auto_2452 ?auto_2451 ) ( IS-CRATE ?auto_2441 ) ( not ( = ?auto_2452 ?auto_2441 ) ) ( not ( = ?auto_2442 ?auto_2452 ) ) ( not ( = ?auto_2443 ?auto_2452 ) ) ( SURFACE-AT ?auto_2442 ?auto_2451 ) ( ON ?auto_2442 ?auto_2452 ) ( SURFACE-AT ?auto_2443 ?auto_2451 ) ( ON ?auto_2443 ?auto_2442 ) ( CLEAR ?auto_2443 ) ( not ( = ?auto_2449 ?auto_2451 ) ) ( SURFACE-AT ?auto_2450 ?auto_2451 ) ( IS-CRATE ?auto_2448 ) ( not ( = ?auto_2441 ?auto_2450 ) ) ( not ( = ?auto_2441 ?auto_2448 ) ) ( not ( = ?auto_2442 ?auto_2450 ) ) ( not ( = ?auto_2442 ?auto_2448 ) ) ( not ( = ?auto_2443 ?auto_2450 ) ) ( not ( = ?auto_2443 ?auto_2448 ) ) ( not ( = ?auto_2452 ?auto_2450 ) ) ( not ( = ?auto_2452 ?auto_2448 ) ) ( not ( = ?auto_2450 ?auto_2448 ) ) ( SURFACE-AT ?auto_2441 ?auto_2451 ) ( ON ?auto_2441 ?auto_2450 ) ( IS-CRATE ?auto_2446 ) ( not ( = ?auto_2441 ?auto_2446 ) ) ( not ( = ?auto_2442 ?auto_2446 ) ) ( not ( = ?auto_2443 ?auto_2446 ) ) ( not ( = ?auto_2452 ?auto_2446 ) ) ( not ( = ?auto_2450 ?auto_2446 ) ) ( not ( = ?auto_2448 ?auto_2446 ) ) ( AVAILABLE ?auto_2444 ) ( SURFACE-AT ?auto_2446 ?auto_2451 ) ( ON ?auto_2446 ?auto_2441 ) ( CLEAR ?auto_2446 ) ( TRUCK-AT ?auto_2447 ?auto_2449 ) ( HOIST-AT ?auto_2445 ?auto_2449 ) ( not ( = ?auto_2444 ?auto_2445 ) ) ( AVAILABLE ?auto_2445 ) ( SURFACE-AT ?auto_2448 ?auto_2449 ) ( ON ?auto_2448 ?auto_2453 ) ( CLEAR ?auto_2448 ) ( not ( = ?auto_2441 ?auto_2453 ) ) ( not ( = ?auto_2442 ?auto_2453 ) ) ( not ( = ?auto_2443 ?auto_2453 ) ) ( not ( = ?auto_2452 ?auto_2453 ) ) ( not ( = ?auto_2450 ?auto_2453 ) ) ( not ( = ?auto_2448 ?auto_2453 ) ) ( not ( = ?auto_2446 ?auto_2453 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2445 ?auto_2448 ?auto_2453 ?auto_2449 )
      ( MAKE-3CRATE ?auto_2452 ?auto_2441 ?auto_2442 ?auto_2443 )
      ( MAKE-2CRATE-VERIFY ?auto_2441 ?auto_2442 ?auto_2443 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2454 - SURFACE
      ?auto_2455 - SURFACE
      ?auto_2456 - SURFACE
      ?auto_2457 - SURFACE
    )
    :vars
    (
      ?auto_2462 - HOIST
      ?auto_2461 - PLACE
      ?auto_2458 - PLACE
      ?auto_2460 - SURFACE
      ?auto_2463 - SURFACE
      ?auto_2465 - SURFACE
      ?auto_2464 - TRUCK
      ?auto_2459 - HOIST
      ?auto_2466 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2462 ?auto_2461 ) ( IS-CRATE ?auto_2457 ) ( not ( = ?auto_2456 ?auto_2457 ) ) ( not ( = ?auto_2455 ?auto_2456 ) ) ( not ( = ?auto_2455 ?auto_2457 ) ) ( IS-CRATE ?auto_2456 ) ( SURFACE-AT ?auto_2454 ?auto_2461 ) ( IS-CRATE ?auto_2455 ) ( not ( = ?auto_2454 ?auto_2455 ) ) ( not ( = ?auto_2456 ?auto_2454 ) ) ( not ( = ?auto_2457 ?auto_2454 ) ) ( SURFACE-AT ?auto_2456 ?auto_2461 ) ( ON ?auto_2456 ?auto_2454 ) ( SURFACE-AT ?auto_2457 ?auto_2461 ) ( ON ?auto_2457 ?auto_2456 ) ( CLEAR ?auto_2457 ) ( not ( = ?auto_2458 ?auto_2461 ) ) ( SURFACE-AT ?auto_2460 ?auto_2461 ) ( IS-CRATE ?auto_2463 ) ( not ( = ?auto_2455 ?auto_2460 ) ) ( not ( = ?auto_2455 ?auto_2463 ) ) ( not ( = ?auto_2456 ?auto_2460 ) ) ( not ( = ?auto_2456 ?auto_2463 ) ) ( not ( = ?auto_2457 ?auto_2460 ) ) ( not ( = ?auto_2457 ?auto_2463 ) ) ( not ( = ?auto_2454 ?auto_2460 ) ) ( not ( = ?auto_2454 ?auto_2463 ) ) ( not ( = ?auto_2460 ?auto_2463 ) ) ( SURFACE-AT ?auto_2455 ?auto_2461 ) ( ON ?auto_2455 ?auto_2460 ) ( IS-CRATE ?auto_2465 ) ( not ( = ?auto_2455 ?auto_2465 ) ) ( not ( = ?auto_2456 ?auto_2465 ) ) ( not ( = ?auto_2457 ?auto_2465 ) ) ( not ( = ?auto_2454 ?auto_2465 ) ) ( not ( = ?auto_2460 ?auto_2465 ) ) ( not ( = ?auto_2463 ?auto_2465 ) ) ( AVAILABLE ?auto_2462 ) ( SURFACE-AT ?auto_2465 ?auto_2461 ) ( ON ?auto_2465 ?auto_2455 ) ( CLEAR ?auto_2465 ) ( TRUCK-AT ?auto_2464 ?auto_2458 ) ( HOIST-AT ?auto_2459 ?auto_2458 ) ( not ( = ?auto_2462 ?auto_2459 ) ) ( AVAILABLE ?auto_2459 ) ( SURFACE-AT ?auto_2463 ?auto_2458 ) ( ON ?auto_2463 ?auto_2466 ) ( CLEAR ?auto_2463 ) ( not ( = ?auto_2455 ?auto_2466 ) ) ( not ( = ?auto_2456 ?auto_2466 ) ) ( not ( = ?auto_2457 ?auto_2466 ) ) ( not ( = ?auto_2454 ?auto_2466 ) ) ( not ( = ?auto_2460 ?auto_2466 ) ) ( not ( = ?auto_2463 ?auto_2466 ) ) ( not ( = ?auto_2465 ?auto_2466 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2455 ?auto_2456 ?auto_2457 )
      ( MAKE-3CRATE-VERIFY ?auto_2454 ?auto_2455 ?auto_2456 ?auto_2457 ) )
  )

)

