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

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1108 - SURFACE
      ?auto_1109 - SURFACE
    )
    :vars
    (
      ?auto_1110 - HOIST
      ?auto_1111 - PLACE
      ?auto_1113 - PLACE
      ?auto_1114 - HOIST
      ?auto_1115 - SURFACE
      ?auto_1112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1110 ?auto_1111 ) ( SURFACE-AT ?auto_1108 ?auto_1111 ) ( CLEAR ?auto_1108 ) ( IS-CRATE ?auto_1109 ) ( AVAILABLE ?auto_1110 ) ( not ( = ?auto_1113 ?auto_1111 ) ) ( HOIST-AT ?auto_1114 ?auto_1113 ) ( AVAILABLE ?auto_1114 ) ( SURFACE-AT ?auto_1109 ?auto_1113 ) ( ON ?auto_1109 ?auto_1115 ) ( CLEAR ?auto_1109 ) ( TRUCK-AT ?auto_1112 ?auto_1111 ) ( not ( = ?auto_1108 ?auto_1109 ) ) ( not ( = ?auto_1108 ?auto_1115 ) ) ( not ( = ?auto_1109 ?auto_1115 ) ) ( not ( = ?auto_1110 ?auto_1114 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1112 ?auto_1111 ?auto_1113 )
      ( !LIFT ?auto_1114 ?auto_1109 ?auto_1115 ?auto_1113 )
      ( !LOAD ?auto_1114 ?auto_1109 ?auto_1112 ?auto_1113 )
      ( !DRIVE ?auto_1112 ?auto_1113 ?auto_1111 )
      ( !UNLOAD ?auto_1110 ?auto_1109 ?auto_1112 ?auto_1111 )
      ( !DROP ?auto_1110 ?auto_1109 ?auto_1108 ?auto_1111 )
      ( MAKE-1CRATE-VERIFY ?auto_1108 ?auto_1109 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1118 - SURFACE
      ?auto_1119 - SURFACE
    )
    :vars
    (
      ?auto_1120 - HOIST
      ?auto_1121 - PLACE
      ?auto_1123 - PLACE
      ?auto_1124 - HOIST
      ?auto_1125 - SURFACE
      ?auto_1122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1120 ?auto_1121 ) ( SURFACE-AT ?auto_1118 ?auto_1121 ) ( CLEAR ?auto_1118 ) ( IS-CRATE ?auto_1119 ) ( AVAILABLE ?auto_1120 ) ( not ( = ?auto_1123 ?auto_1121 ) ) ( HOIST-AT ?auto_1124 ?auto_1123 ) ( AVAILABLE ?auto_1124 ) ( SURFACE-AT ?auto_1119 ?auto_1123 ) ( ON ?auto_1119 ?auto_1125 ) ( CLEAR ?auto_1119 ) ( TRUCK-AT ?auto_1122 ?auto_1121 ) ( not ( = ?auto_1118 ?auto_1119 ) ) ( not ( = ?auto_1118 ?auto_1125 ) ) ( not ( = ?auto_1119 ?auto_1125 ) ) ( not ( = ?auto_1120 ?auto_1124 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1122 ?auto_1121 ?auto_1123 )
      ( !LIFT ?auto_1124 ?auto_1119 ?auto_1125 ?auto_1123 )
      ( !LOAD ?auto_1124 ?auto_1119 ?auto_1122 ?auto_1123 )
      ( !DRIVE ?auto_1122 ?auto_1123 ?auto_1121 )
      ( !UNLOAD ?auto_1120 ?auto_1119 ?auto_1122 ?auto_1121 )
      ( !DROP ?auto_1120 ?auto_1119 ?auto_1118 ?auto_1121 )
      ( MAKE-1CRATE-VERIFY ?auto_1118 ?auto_1119 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1129 - SURFACE
      ?auto_1130 - SURFACE
      ?auto_1131 - SURFACE
    )
    :vars
    (
      ?auto_1134 - HOIST
      ?auto_1132 - PLACE
      ?auto_1133 - PLACE
      ?auto_1136 - HOIST
      ?auto_1135 - SURFACE
      ?auto_1138 - PLACE
      ?auto_1139 - HOIST
      ?auto_1140 - SURFACE
      ?auto_1137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1134 ?auto_1132 ) ( IS-CRATE ?auto_1131 ) ( not ( = ?auto_1133 ?auto_1132 ) ) ( HOIST-AT ?auto_1136 ?auto_1133 ) ( AVAILABLE ?auto_1136 ) ( SURFACE-AT ?auto_1131 ?auto_1133 ) ( ON ?auto_1131 ?auto_1135 ) ( CLEAR ?auto_1131 ) ( not ( = ?auto_1130 ?auto_1131 ) ) ( not ( = ?auto_1130 ?auto_1135 ) ) ( not ( = ?auto_1131 ?auto_1135 ) ) ( not ( = ?auto_1134 ?auto_1136 ) ) ( SURFACE-AT ?auto_1129 ?auto_1132 ) ( CLEAR ?auto_1129 ) ( IS-CRATE ?auto_1130 ) ( AVAILABLE ?auto_1134 ) ( not ( = ?auto_1138 ?auto_1132 ) ) ( HOIST-AT ?auto_1139 ?auto_1138 ) ( AVAILABLE ?auto_1139 ) ( SURFACE-AT ?auto_1130 ?auto_1138 ) ( ON ?auto_1130 ?auto_1140 ) ( CLEAR ?auto_1130 ) ( TRUCK-AT ?auto_1137 ?auto_1132 ) ( not ( = ?auto_1129 ?auto_1130 ) ) ( not ( = ?auto_1129 ?auto_1140 ) ) ( not ( = ?auto_1130 ?auto_1140 ) ) ( not ( = ?auto_1134 ?auto_1139 ) ) ( not ( = ?auto_1129 ?auto_1131 ) ) ( not ( = ?auto_1129 ?auto_1135 ) ) ( not ( = ?auto_1131 ?auto_1140 ) ) ( not ( = ?auto_1133 ?auto_1138 ) ) ( not ( = ?auto_1136 ?auto_1139 ) ) ( not ( = ?auto_1135 ?auto_1140 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1129 ?auto_1130 )
      ( MAKE-1CRATE ?auto_1130 ?auto_1131 )
      ( MAKE-2CRATE-VERIFY ?auto_1129 ?auto_1130 ?auto_1131 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1143 - SURFACE
      ?auto_1144 - SURFACE
    )
    :vars
    (
      ?auto_1145 - HOIST
      ?auto_1146 - PLACE
      ?auto_1148 - PLACE
      ?auto_1149 - HOIST
      ?auto_1150 - SURFACE
      ?auto_1147 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1145 ?auto_1146 ) ( SURFACE-AT ?auto_1143 ?auto_1146 ) ( CLEAR ?auto_1143 ) ( IS-CRATE ?auto_1144 ) ( AVAILABLE ?auto_1145 ) ( not ( = ?auto_1148 ?auto_1146 ) ) ( HOIST-AT ?auto_1149 ?auto_1148 ) ( AVAILABLE ?auto_1149 ) ( SURFACE-AT ?auto_1144 ?auto_1148 ) ( ON ?auto_1144 ?auto_1150 ) ( CLEAR ?auto_1144 ) ( TRUCK-AT ?auto_1147 ?auto_1146 ) ( not ( = ?auto_1143 ?auto_1144 ) ) ( not ( = ?auto_1143 ?auto_1150 ) ) ( not ( = ?auto_1144 ?auto_1150 ) ) ( not ( = ?auto_1145 ?auto_1149 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1147 ?auto_1146 ?auto_1148 )
      ( !LIFT ?auto_1149 ?auto_1144 ?auto_1150 ?auto_1148 )
      ( !LOAD ?auto_1149 ?auto_1144 ?auto_1147 ?auto_1148 )
      ( !DRIVE ?auto_1147 ?auto_1148 ?auto_1146 )
      ( !UNLOAD ?auto_1145 ?auto_1144 ?auto_1147 ?auto_1146 )
      ( !DROP ?auto_1145 ?auto_1144 ?auto_1143 ?auto_1146 )
      ( MAKE-1CRATE-VERIFY ?auto_1143 ?auto_1144 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1155 - SURFACE
      ?auto_1156 - SURFACE
      ?auto_1157 - SURFACE
      ?auto_1158 - SURFACE
    )
    :vars
    (
      ?auto_1160 - HOIST
      ?auto_1163 - PLACE
      ?auto_1162 - PLACE
      ?auto_1159 - HOIST
      ?auto_1161 - SURFACE
      ?auto_1167 - PLACE
      ?auto_1165 - HOIST
      ?auto_1166 - SURFACE
      ?auto_1168 - SURFACE
      ?auto_1164 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1160 ?auto_1163 ) ( IS-CRATE ?auto_1158 ) ( not ( = ?auto_1162 ?auto_1163 ) ) ( HOIST-AT ?auto_1159 ?auto_1162 ) ( SURFACE-AT ?auto_1158 ?auto_1162 ) ( ON ?auto_1158 ?auto_1161 ) ( CLEAR ?auto_1158 ) ( not ( = ?auto_1157 ?auto_1158 ) ) ( not ( = ?auto_1157 ?auto_1161 ) ) ( not ( = ?auto_1158 ?auto_1161 ) ) ( not ( = ?auto_1160 ?auto_1159 ) ) ( IS-CRATE ?auto_1157 ) ( not ( = ?auto_1167 ?auto_1163 ) ) ( HOIST-AT ?auto_1165 ?auto_1167 ) ( AVAILABLE ?auto_1165 ) ( SURFACE-AT ?auto_1157 ?auto_1167 ) ( ON ?auto_1157 ?auto_1166 ) ( CLEAR ?auto_1157 ) ( not ( = ?auto_1156 ?auto_1157 ) ) ( not ( = ?auto_1156 ?auto_1166 ) ) ( not ( = ?auto_1157 ?auto_1166 ) ) ( not ( = ?auto_1160 ?auto_1165 ) ) ( SURFACE-AT ?auto_1155 ?auto_1163 ) ( CLEAR ?auto_1155 ) ( IS-CRATE ?auto_1156 ) ( AVAILABLE ?auto_1160 ) ( AVAILABLE ?auto_1159 ) ( SURFACE-AT ?auto_1156 ?auto_1162 ) ( ON ?auto_1156 ?auto_1168 ) ( CLEAR ?auto_1156 ) ( TRUCK-AT ?auto_1164 ?auto_1163 ) ( not ( = ?auto_1155 ?auto_1156 ) ) ( not ( = ?auto_1155 ?auto_1168 ) ) ( not ( = ?auto_1156 ?auto_1168 ) ) ( not ( = ?auto_1155 ?auto_1157 ) ) ( not ( = ?auto_1155 ?auto_1166 ) ) ( not ( = ?auto_1157 ?auto_1168 ) ) ( not ( = ?auto_1167 ?auto_1162 ) ) ( not ( = ?auto_1165 ?auto_1159 ) ) ( not ( = ?auto_1166 ?auto_1168 ) ) ( not ( = ?auto_1155 ?auto_1158 ) ) ( not ( = ?auto_1155 ?auto_1161 ) ) ( not ( = ?auto_1156 ?auto_1158 ) ) ( not ( = ?auto_1156 ?auto_1161 ) ) ( not ( = ?auto_1158 ?auto_1166 ) ) ( not ( = ?auto_1158 ?auto_1168 ) ) ( not ( = ?auto_1161 ?auto_1166 ) ) ( not ( = ?auto_1161 ?auto_1168 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1155 ?auto_1156 ?auto_1157 )
      ( MAKE-1CRATE ?auto_1157 ?auto_1158 )
      ( MAKE-3CRATE-VERIFY ?auto_1155 ?auto_1156 ?auto_1157 ?auto_1158 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1171 - SURFACE
      ?auto_1172 - SURFACE
    )
    :vars
    (
      ?auto_1173 - HOIST
      ?auto_1174 - PLACE
      ?auto_1176 - PLACE
      ?auto_1177 - HOIST
      ?auto_1178 - SURFACE
      ?auto_1175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173 ?auto_1174 ) ( SURFACE-AT ?auto_1171 ?auto_1174 ) ( CLEAR ?auto_1171 ) ( IS-CRATE ?auto_1172 ) ( AVAILABLE ?auto_1173 ) ( not ( = ?auto_1176 ?auto_1174 ) ) ( HOIST-AT ?auto_1177 ?auto_1176 ) ( AVAILABLE ?auto_1177 ) ( SURFACE-AT ?auto_1172 ?auto_1176 ) ( ON ?auto_1172 ?auto_1178 ) ( CLEAR ?auto_1172 ) ( TRUCK-AT ?auto_1175 ?auto_1174 ) ( not ( = ?auto_1171 ?auto_1172 ) ) ( not ( = ?auto_1171 ?auto_1178 ) ) ( not ( = ?auto_1172 ?auto_1178 ) ) ( not ( = ?auto_1173 ?auto_1177 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1175 ?auto_1174 ?auto_1176 )
      ( !LIFT ?auto_1177 ?auto_1172 ?auto_1178 ?auto_1176 )
      ( !LOAD ?auto_1177 ?auto_1172 ?auto_1175 ?auto_1176 )
      ( !DRIVE ?auto_1175 ?auto_1176 ?auto_1174 )
      ( !UNLOAD ?auto_1173 ?auto_1172 ?auto_1175 ?auto_1174 )
      ( !DROP ?auto_1173 ?auto_1172 ?auto_1171 ?auto_1174 )
      ( MAKE-1CRATE-VERIFY ?auto_1171 ?auto_1172 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1184 - SURFACE
      ?auto_1185 - SURFACE
      ?auto_1186 - SURFACE
      ?auto_1187 - SURFACE
      ?auto_1188 - SURFACE
    )
    :vars
    (
      ?auto_1193 - HOIST
      ?auto_1190 - PLACE
      ?auto_1194 - PLACE
      ?auto_1192 - HOIST
      ?auto_1191 - SURFACE
      ?auto_1196 - PLACE
      ?auto_1197 - HOIST
      ?auto_1195 - SURFACE
      ?auto_1198 - PLACE
      ?auto_1199 - HOIST
      ?auto_1201 - SURFACE
      ?auto_1200 - SURFACE
      ?auto_1189 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1193 ?auto_1190 ) ( IS-CRATE ?auto_1188 ) ( not ( = ?auto_1194 ?auto_1190 ) ) ( HOIST-AT ?auto_1192 ?auto_1194 ) ( AVAILABLE ?auto_1192 ) ( SURFACE-AT ?auto_1188 ?auto_1194 ) ( ON ?auto_1188 ?auto_1191 ) ( CLEAR ?auto_1188 ) ( not ( = ?auto_1187 ?auto_1188 ) ) ( not ( = ?auto_1187 ?auto_1191 ) ) ( not ( = ?auto_1188 ?auto_1191 ) ) ( not ( = ?auto_1193 ?auto_1192 ) ) ( IS-CRATE ?auto_1187 ) ( not ( = ?auto_1196 ?auto_1190 ) ) ( HOIST-AT ?auto_1197 ?auto_1196 ) ( SURFACE-AT ?auto_1187 ?auto_1196 ) ( ON ?auto_1187 ?auto_1195 ) ( CLEAR ?auto_1187 ) ( not ( = ?auto_1186 ?auto_1187 ) ) ( not ( = ?auto_1186 ?auto_1195 ) ) ( not ( = ?auto_1187 ?auto_1195 ) ) ( not ( = ?auto_1193 ?auto_1197 ) ) ( IS-CRATE ?auto_1186 ) ( not ( = ?auto_1198 ?auto_1190 ) ) ( HOIST-AT ?auto_1199 ?auto_1198 ) ( AVAILABLE ?auto_1199 ) ( SURFACE-AT ?auto_1186 ?auto_1198 ) ( ON ?auto_1186 ?auto_1201 ) ( CLEAR ?auto_1186 ) ( not ( = ?auto_1185 ?auto_1186 ) ) ( not ( = ?auto_1185 ?auto_1201 ) ) ( not ( = ?auto_1186 ?auto_1201 ) ) ( not ( = ?auto_1193 ?auto_1199 ) ) ( SURFACE-AT ?auto_1184 ?auto_1190 ) ( CLEAR ?auto_1184 ) ( IS-CRATE ?auto_1185 ) ( AVAILABLE ?auto_1193 ) ( AVAILABLE ?auto_1197 ) ( SURFACE-AT ?auto_1185 ?auto_1196 ) ( ON ?auto_1185 ?auto_1200 ) ( CLEAR ?auto_1185 ) ( TRUCK-AT ?auto_1189 ?auto_1190 ) ( not ( = ?auto_1184 ?auto_1185 ) ) ( not ( = ?auto_1184 ?auto_1200 ) ) ( not ( = ?auto_1185 ?auto_1200 ) ) ( not ( = ?auto_1184 ?auto_1186 ) ) ( not ( = ?auto_1184 ?auto_1201 ) ) ( not ( = ?auto_1186 ?auto_1200 ) ) ( not ( = ?auto_1198 ?auto_1196 ) ) ( not ( = ?auto_1199 ?auto_1197 ) ) ( not ( = ?auto_1201 ?auto_1200 ) ) ( not ( = ?auto_1184 ?auto_1187 ) ) ( not ( = ?auto_1184 ?auto_1195 ) ) ( not ( = ?auto_1185 ?auto_1187 ) ) ( not ( = ?auto_1185 ?auto_1195 ) ) ( not ( = ?auto_1187 ?auto_1201 ) ) ( not ( = ?auto_1187 ?auto_1200 ) ) ( not ( = ?auto_1195 ?auto_1201 ) ) ( not ( = ?auto_1195 ?auto_1200 ) ) ( not ( = ?auto_1184 ?auto_1188 ) ) ( not ( = ?auto_1184 ?auto_1191 ) ) ( not ( = ?auto_1185 ?auto_1188 ) ) ( not ( = ?auto_1185 ?auto_1191 ) ) ( not ( = ?auto_1186 ?auto_1188 ) ) ( not ( = ?auto_1186 ?auto_1191 ) ) ( not ( = ?auto_1188 ?auto_1195 ) ) ( not ( = ?auto_1188 ?auto_1201 ) ) ( not ( = ?auto_1188 ?auto_1200 ) ) ( not ( = ?auto_1194 ?auto_1196 ) ) ( not ( = ?auto_1194 ?auto_1198 ) ) ( not ( = ?auto_1192 ?auto_1197 ) ) ( not ( = ?auto_1192 ?auto_1199 ) ) ( not ( = ?auto_1191 ?auto_1195 ) ) ( not ( = ?auto_1191 ?auto_1201 ) ) ( not ( = ?auto_1191 ?auto_1200 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1184 ?auto_1185 ?auto_1186 ?auto_1187 )
      ( MAKE-1CRATE ?auto_1187 ?auto_1188 )
      ( MAKE-4CRATE-VERIFY ?auto_1184 ?auto_1185 ?auto_1186 ?auto_1187 ?auto_1188 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1204 - SURFACE
      ?auto_1205 - SURFACE
    )
    :vars
    (
      ?auto_1206 - HOIST
      ?auto_1207 - PLACE
      ?auto_1209 - PLACE
      ?auto_1210 - HOIST
      ?auto_1211 - SURFACE
      ?auto_1208 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1206 ?auto_1207 ) ( SURFACE-AT ?auto_1204 ?auto_1207 ) ( CLEAR ?auto_1204 ) ( IS-CRATE ?auto_1205 ) ( AVAILABLE ?auto_1206 ) ( not ( = ?auto_1209 ?auto_1207 ) ) ( HOIST-AT ?auto_1210 ?auto_1209 ) ( AVAILABLE ?auto_1210 ) ( SURFACE-AT ?auto_1205 ?auto_1209 ) ( ON ?auto_1205 ?auto_1211 ) ( CLEAR ?auto_1205 ) ( TRUCK-AT ?auto_1208 ?auto_1207 ) ( not ( = ?auto_1204 ?auto_1205 ) ) ( not ( = ?auto_1204 ?auto_1211 ) ) ( not ( = ?auto_1205 ?auto_1211 ) ) ( not ( = ?auto_1206 ?auto_1210 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1208 ?auto_1207 ?auto_1209 )
      ( !LIFT ?auto_1210 ?auto_1205 ?auto_1211 ?auto_1209 )
      ( !LOAD ?auto_1210 ?auto_1205 ?auto_1208 ?auto_1209 )
      ( !DRIVE ?auto_1208 ?auto_1209 ?auto_1207 )
      ( !UNLOAD ?auto_1206 ?auto_1205 ?auto_1208 ?auto_1207 )
      ( !DROP ?auto_1206 ?auto_1205 ?auto_1204 ?auto_1207 )
      ( MAKE-1CRATE-VERIFY ?auto_1204 ?auto_1205 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1218 - SURFACE
      ?auto_1219 - SURFACE
      ?auto_1220 - SURFACE
      ?auto_1221 - SURFACE
      ?auto_1222 - SURFACE
      ?auto_1223 - SURFACE
    )
    :vars
    (
      ?auto_1224 - HOIST
      ?auto_1227 - PLACE
      ?auto_1228 - PLACE
      ?auto_1226 - HOIST
      ?auto_1229 - SURFACE
      ?auto_1237 - PLACE
      ?auto_1235 - HOIST
      ?auto_1236 - SURFACE
      ?auto_1230 - SURFACE
      ?auto_1234 - PLACE
      ?auto_1232 - HOIST
      ?auto_1231 - SURFACE
      ?auto_1233 - SURFACE
      ?auto_1225 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1224 ?auto_1227 ) ( IS-CRATE ?auto_1223 ) ( not ( = ?auto_1228 ?auto_1227 ) ) ( HOIST-AT ?auto_1226 ?auto_1228 ) ( SURFACE-AT ?auto_1223 ?auto_1228 ) ( ON ?auto_1223 ?auto_1229 ) ( CLEAR ?auto_1223 ) ( not ( = ?auto_1222 ?auto_1223 ) ) ( not ( = ?auto_1222 ?auto_1229 ) ) ( not ( = ?auto_1223 ?auto_1229 ) ) ( not ( = ?auto_1224 ?auto_1226 ) ) ( IS-CRATE ?auto_1222 ) ( not ( = ?auto_1237 ?auto_1227 ) ) ( HOIST-AT ?auto_1235 ?auto_1237 ) ( AVAILABLE ?auto_1235 ) ( SURFACE-AT ?auto_1222 ?auto_1237 ) ( ON ?auto_1222 ?auto_1236 ) ( CLEAR ?auto_1222 ) ( not ( = ?auto_1221 ?auto_1222 ) ) ( not ( = ?auto_1221 ?auto_1236 ) ) ( not ( = ?auto_1222 ?auto_1236 ) ) ( not ( = ?auto_1224 ?auto_1235 ) ) ( IS-CRATE ?auto_1221 ) ( SURFACE-AT ?auto_1221 ?auto_1228 ) ( ON ?auto_1221 ?auto_1230 ) ( CLEAR ?auto_1221 ) ( not ( = ?auto_1220 ?auto_1221 ) ) ( not ( = ?auto_1220 ?auto_1230 ) ) ( not ( = ?auto_1221 ?auto_1230 ) ) ( IS-CRATE ?auto_1220 ) ( not ( = ?auto_1234 ?auto_1227 ) ) ( HOIST-AT ?auto_1232 ?auto_1234 ) ( AVAILABLE ?auto_1232 ) ( SURFACE-AT ?auto_1220 ?auto_1234 ) ( ON ?auto_1220 ?auto_1231 ) ( CLEAR ?auto_1220 ) ( not ( = ?auto_1219 ?auto_1220 ) ) ( not ( = ?auto_1219 ?auto_1231 ) ) ( not ( = ?auto_1220 ?auto_1231 ) ) ( not ( = ?auto_1224 ?auto_1232 ) ) ( SURFACE-AT ?auto_1218 ?auto_1227 ) ( CLEAR ?auto_1218 ) ( IS-CRATE ?auto_1219 ) ( AVAILABLE ?auto_1224 ) ( AVAILABLE ?auto_1226 ) ( SURFACE-AT ?auto_1219 ?auto_1228 ) ( ON ?auto_1219 ?auto_1233 ) ( CLEAR ?auto_1219 ) ( TRUCK-AT ?auto_1225 ?auto_1227 ) ( not ( = ?auto_1218 ?auto_1219 ) ) ( not ( = ?auto_1218 ?auto_1233 ) ) ( not ( = ?auto_1219 ?auto_1233 ) ) ( not ( = ?auto_1218 ?auto_1220 ) ) ( not ( = ?auto_1218 ?auto_1231 ) ) ( not ( = ?auto_1220 ?auto_1233 ) ) ( not ( = ?auto_1234 ?auto_1228 ) ) ( not ( = ?auto_1232 ?auto_1226 ) ) ( not ( = ?auto_1231 ?auto_1233 ) ) ( not ( = ?auto_1218 ?auto_1221 ) ) ( not ( = ?auto_1218 ?auto_1230 ) ) ( not ( = ?auto_1219 ?auto_1221 ) ) ( not ( = ?auto_1219 ?auto_1230 ) ) ( not ( = ?auto_1221 ?auto_1231 ) ) ( not ( = ?auto_1221 ?auto_1233 ) ) ( not ( = ?auto_1230 ?auto_1231 ) ) ( not ( = ?auto_1230 ?auto_1233 ) ) ( not ( = ?auto_1218 ?auto_1222 ) ) ( not ( = ?auto_1218 ?auto_1236 ) ) ( not ( = ?auto_1219 ?auto_1222 ) ) ( not ( = ?auto_1219 ?auto_1236 ) ) ( not ( = ?auto_1220 ?auto_1222 ) ) ( not ( = ?auto_1220 ?auto_1236 ) ) ( not ( = ?auto_1222 ?auto_1230 ) ) ( not ( = ?auto_1222 ?auto_1231 ) ) ( not ( = ?auto_1222 ?auto_1233 ) ) ( not ( = ?auto_1237 ?auto_1228 ) ) ( not ( = ?auto_1237 ?auto_1234 ) ) ( not ( = ?auto_1235 ?auto_1226 ) ) ( not ( = ?auto_1235 ?auto_1232 ) ) ( not ( = ?auto_1236 ?auto_1230 ) ) ( not ( = ?auto_1236 ?auto_1231 ) ) ( not ( = ?auto_1236 ?auto_1233 ) ) ( not ( = ?auto_1218 ?auto_1223 ) ) ( not ( = ?auto_1218 ?auto_1229 ) ) ( not ( = ?auto_1219 ?auto_1223 ) ) ( not ( = ?auto_1219 ?auto_1229 ) ) ( not ( = ?auto_1220 ?auto_1223 ) ) ( not ( = ?auto_1220 ?auto_1229 ) ) ( not ( = ?auto_1221 ?auto_1223 ) ) ( not ( = ?auto_1221 ?auto_1229 ) ) ( not ( = ?auto_1223 ?auto_1236 ) ) ( not ( = ?auto_1223 ?auto_1230 ) ) ( not ( = ?auto_1223 ?auto_1231 ) ) ( not ( = ?auto_1223 ?auto_1233 ) ) ( not ( = ?auto_1229 ?auto_1236 ) ) ( not ( = ?auto_1229 ?auto_1230 ) ) ( not ( = ?auto_1229 ?auto_1231 ) ) ( not ( = ?auto_1229 ?auto_1233 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1218 ?auto_1219 ?auto_1220 ?auto_1221 ?auto_1222 )
      ( MAKE-1CRATE ?auto_1222 ?auto_1223 )
      ( MAKE-5CRATE-VERIFY ?auto_1218 ?auto_1219 ?auto_1220 ?auto_1221 ?auto_1222 ?auto_1223 ) )
  )

)

