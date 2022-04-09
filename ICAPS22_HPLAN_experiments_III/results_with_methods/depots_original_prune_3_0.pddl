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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1141 - SURFACE
      ?auto_1142 - SURFACE
    )
    :vars
    (
      ?auto_1143 - HOIST
      ?auto_1144 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1143 ?auto_1144 ) ( SURFACE-AT ?auto_1141 ?auto_1144 ) ( CLEAR ?auto_1141 ) ( LIFTING ?auto_1143 ?auto_1142 ) ( IS-CRATE ?auto_1142 ) ( not ( = ?auto_1141 ?auto_1142 ) ) )
    :subtasks
    ( ( !DROP ?auto_1143 ?auto_1142 ?auto_1141 ?auto_1144 )
      ( MAKE-1CRATE-VERIFY ?auto_1141 ?auto_1142 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1145 - SURFACE
      ?auto_1146 - SURFACE
    )
    :vars
    (
      ?auto_1147 - HOIST
      ?auto_1148 - PLACE
      ?auto_1149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1147 ?auto_1148 ) ( SURFACE-AT ?auto_1145 ?auto_1148 ) ( CLEAR ?auto_1145 ) ( IS-CRATE ?auto_1146 ) ( not ( = ?auto_1145 ?auto_1146 ) ) ( TRUCK-AT ?auto_1149 ?auto_1148 ) ( AVAILABLE ?auto_1147 ) ( IN ?auto_1146 ?auto_1149 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1147 ?auto_1146 ?auto_1149 ?auto_1148 )
      ( MAKE-1CRATE ?auto_1145 ?auto_1146 )
      ( MAKE-1CRATE-VERIFY ?auto_1145 ?auto_1146 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1150 - SURFACE
      ?auto_1151 - SURFACE
    )
    :vars
    (
      ?auto_1153 - HOIST
      ?auto_1154 - PLACE
      ?auto_1152 - TRUCK
      ?auto_1155 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1153 ?auto_1154 ) ( SURFACE-AT ?auto_1150 ?auto_1154 ) ( CLEAR ?auto_1150 ) ( IS-CRATE ?auto_1151 ) ( not ( = ?auto_1150 ?auto_1151 ) ) ( AVAILABLE ?auto_1153 ) ( IN ?auto_1151 ?auto_1152 ) ( TRUCK-AT ?auto_1152 ?auto_1155 ) ( not ( = ?auto_1155 ?auto_1154 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1152 ?auto_1155 ?auto_1154 )
      ( MAKE-1CRATE ?auto_1150 ?auto_1151 )
      ( MAKE-1CRATE-VERIFY ?auto_1150 ?auto_1151 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1156 - SURFACE
      ?auto_1157 - SURFACE
    )
    :vars
    (
      ?auto_1160 - HOIST
      ?auto_1161 - PLACE
      ?auto_1158 - TRUCK
      ?auto_1159 - PLACE
      ?auto_1162 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1160 ?auto_1161 ) ( SURFACE-AT ?auto_1156 ?auto_1161 ) ( CLEAR ?auto_1156 ) ( IS-CRATE ?auto_1157 ) ( not ( = ?auto_1156 ?auto_1157 ) ) ( AVAILABLE ?auto_1160 ) ( TRUCK-AT ?auto_1158 ?auto_1159 ) ( not ( = ?auto_1159 ?auto_1161 ) ) ( HOIST-AT ?auto_1162 ?auto_1159 ) ( LIFTING ?auto_1162 ?auto_1157 ) ( not ( = ?auto_1160 ?auto_1162 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1162 ?auto_1157 ?auto_1158 ?auto_1159 )
      ( MAKE-1CRATE ?auto_1156 ?auto_1157 )
      ( MAKE-1CRATE-VERIFY ?auto_1156 ?auto_1157 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1163 - SURFACE
      ?auto_1164 - SURFACE
    )
    :vars
    (
      ?auto_1165 - HOIST
      ?auto_1169 - PLACE
      ?auto_1168 - TRUCK
      ?auto_1167 - PLACE
      ?auto_1166 - HOIST
      ?auto_1170 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1165 ?auto_1169 ) ( SURFACE-AT ?auto_1163 ?auto_1169 ) ( CLEAR ?auto_1163 ) ( IS-CRATE ?auto_1164 ) ( not ( = ?auto_1163 ?auto_1164 ) ) ( AVAILABLE ?auto_1165 ) ( TRUCK-AT ?auto_1168 ?auto_1167 ) ( not ( = ?auto_1167 ?auto_1169 ) ) ( HOIST-AT ?auto_1166 ?auto_1167 ) ( not ( = ?auto_1165 ?auto_1166 ) ) ( AVAILABLE ?auto_1166 ) ( SURFACE-AT ?auto_1164 ?auto_1167 ) ( ON ?auto_1164 ?auto_1170 ) ( CLEAR ?auto_1164 ) ( not ( = ?auto_1163 ?auto_1170 ) ) ( not ( = ?auto_1164 ?auto_1170 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1166 ?auto_1164 ?auto_1170 ?auto_1167 )
      ( MAKE-1CRATE ?auto_1163 ?auto_1164 )
      ( MAKE-1CRATE-VERIFY ?auto_1163 ?auto_1164 ) )
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
      ?auto_1175 - HOIST
      ?auto_1177 - SURFACE
      ?auto_1178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1173 ?auto_1174 ) ( SURFACE-AT ?auto_1171 ?auto_1174 ) ( CLEAR ?auto_1171 ) ( IS-CRATE ?auto_1172 ) ( not ( = ?auto_1171 ?auto_1172 ) ) ( AVAILABLE ?auto_1173 ) ( not ( = ?auto_1176 ?auto_1174 ) ) ( HOIST-AT ?auto_1175 ?auto_1176 ) ( not ( = ?auto_1173 ?auto_1175 ) ) ( AVAILABLE ?auto_1175 ) ( SURFACE-AT ?auto_1172 ?auto_1176 ) ( ON ?auto_1172 ?auto_1177 ) ( CLEAR ?auto_1172 ) ( not ( = ?auto_1171 ?auto_1177 ) ) ( not ( = ?auto_1172 ?auto_1177 ) ) ( TRUCK-AT ?auto_1178 ?auto_1174 ) )
    :subtasks
    ( ( !DRIVE ?auto_1178 ?auto_1174 ?auto_1176 )
      ( MAKE-1CRATE ?auto_1171 ?auto_1172 )
      ( MAKE-1CRATE-VERIFY ?auto_1171 ?auto_1172 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1188 - SURFACE
      ?auto_1189 - SURFACE
      ?auto_1190 - SURFACE
    )
    :vars
    (
      ?auto_1192 - HOIST
      ?auto_1191 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1192 ?auto_1191 ) ( SURFACE-AT ?auto_1189 ?auto_1191 ) ( CLEAR ?auto_1189 ) ( LIFTING ?auto_1192 ?auto_1190 ) ( IS-CRATE ?auto_1190 ) ( not ( = ?auto_1189 ?auto_1190 ) ) ( ON ?auto_1189 ?auto_1188 ) ( not ( = ?auto_1188 ?auto_1189 ) ) ( not ( = ?auto_1188 ?auto_1190 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1189 ?auto_1190 )
      ( MAKE-2CRATE-VERIFY ?auto_1188 ?auto_1189 ?auto_1190 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1198 - SURFACE
      ?auto_1199 - SURFACE
      ?auto_1200 - SURFACE
    )
    :vars
    (
      ?auto_1201 - HOIST
      ?auto_1202 - PLACE
      ?auto_1203 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1201 ?auto_1202 ) ( SURFACE-AT ?auto_1199 ?auto_1202 ) ( CLEAR ?auto_1199 ) ( IS-CRATE ?auto_1200 ) ( not ( = ?auto_1199 ?auto_1200 ) ) ( TRUCK-AT ?auto_1203 ?auto_1202 ) ( AVAILABLE ?auto_1201 ) ( IN ?auto_1200 ?auto_1203 ) ( ON ?auto_1199 ?auto_1198 ) ( not ( = ?auto_1198 ?auto_1199 ) ) ( not ( = ?auto_1198 ?auto_1200 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1199 ?auto_1200 )
      ( MAKE-2CRATE-VERIFY ?auto_1198 ?auto_1199 ?auto_1200 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1204 - SURFACE
      ?auto_1205 - SURFACE
    )
    :vars
    (
      ?auto_1207 - HOIST
      ?auto_1209 - PLACE
      ?auto_1208 - TRUCK
      ?auto_1206 - SURFACE
      ?auto_1210 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1207 ?auto_1209 ) ( SURFACE-AT ?auto_1204 ?auto_1209 ) ( CLEAR ?auto_1204 ) ( IS-CRATE ?auto_1205 ) ( not ( = ?auto_1204 ?auto_1205 ) ) ( AVAILABLE ?auto_1207 ) ( IN ?auto_1205 ?auto_1208 ) ( ON ?auto_1204 ?auto_1206 ) ( not ( = ?auto_1206 ?auto_1204 ) ) ( not ( = ?auto_1206 ?auto_1205 ) ) ( TRUCK-AT ?auto_1208 ?auto_1210 ) ( not ( = ?auto_1210 ?auto_1209 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1208 ?auto_1210 ?auto_1209 )
      ( MAKE-2CRATE ?auto_1206 ?auto_1204 ?auto_1205 )
      ( MAKE-1CRATE-VERIFY ?auto_1204 ?auto_1205 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1211 - SURFACE
      ?auto_1212 - SURFACE
      ?auto_1213 - SURFACE
    )
    :vars
    (
      ?auto_1215 - HOIST
      ?auto_1217 - PLACE
      ?auto_1214 - TRUCK
      ?auto_1216 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1215 ?auto_1217 ) ( SURFACE-AT ?auto_1212 ?auto_1217 ) ( CLEAR ?auto_1212 ) ( IS-CRATE ?auto_1213 ) ( not ( = ?auto_1212 ?auto_1213 ) ) ( AVAILABLE ?auto_1215 ) ( IN ?auto_1213 ?auto_1214 ) ( ON ?auto_1212 ?auto_1211 ) ( not ( = ?auto_1211 ?auto_1212 ) ) ( not ( = ?auto_1211 ?auto_1213 ) ) ( TRUCK-AT ?auto_1214 ?auto_1216 ) ( not ( = ?auto_1216 ?auto_1217 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1212 ?auto_1213 )
      ( MAKE-2CRATE-VERIFY ?auto_1211 ?auto_1212 ?auto_1213 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1218 - SURFACE
      ?auto_1219 - SURFACE
    )
    :vars
    (
      ?auto_1224 - HOIST
      ?auto_1221 - PLACE
      ?auto_1220 - SURFACE
      ?auto_1222 - TRUCK
      ?auto_1223 - PLACE
      ?auto_1225 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1224 ?auto_1221 ) ( SURFACE-AT ?auto_1218 ?auto_1221 ) ( CLEAR ?auto_1218 ) ( IS-CRATE ?auto_1219 ) ( not ( = ?auto_1218 ?auto_1219 ) ) ( AVAILABLE ?auto_1224 ) ( ON ?auto_1218 ?auto_1220 ) ( not ( = ?auto_1220 ?auto_1218 ) ) ( not ( = ?auto_1220 ?auto_1219 ) ) ( TRUCK-AT ?auto_1222 ?auto_1223 ) ( not ( = ?auto_1223 ?auto_1221 ) ) ( HOIST-AT ?auto_1225 ?auto_1223 ) ( LIFTING ?auto_1225 ?auto_1219 ) ( not ( = ?auto_1224 ?auto_1225 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1225 ?auto_1219 ?auto_1222 ?auto_1223 )
      ( MAKE-2CRATE ?auto_1220 ?auto_1218 ?auto_1219 )
      ( MAKE-1CRATE-VERIFY ?auto_1218 ?auto_1219 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1226 - SURFACE
      ?auto_1227 - SURFACE
      ?auto_1228 - SURFACE
    )
    :vars
    (
      ?auto_1233 - HOIST
      ?auto_1229 - PLACE
      ?auto_1231 - TRUCK
      ?auto_1230 - PLACE
      ?auto_1232 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1233 ?auto_1229 ) ( SURFACE-AT ?auto_1227 ?auto_1229 ) ( CLEAR ?auto_1227 ) ( IS-CRATE ?auto_1228 ) ( not ( = ?auto_1227 ?auto_1228 ) ) ( AVAILABLE ?auto_1233 ) ( ON ?auto_1227 ?auto_1226 ) ( not ( = ?auto_1226 ?auto_1227 ) ) ( not ( = ?auto_1226 ?auto_1228 ) ) ( TRUCK-AT ?auto_1231 ?auto_1230 ) ( not ( = ?auto_1230 ?auto_1229 ) ) ( HOIST-AT ?auto_1232 ?auto_1230 ) ( LIFTING ?auto_1232 ?auto_1228 ) ( not ( = ?auto_1233 ?auto_1232 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1227 ?auto_1228 )
      ( MAKE-2CRATE-VERIFY ?auto_1226 ?auto_1227 ?auto_1228 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1234 - SURFACE
      ?auto_1235 - SURFACE
    )
    :vars
    (
      ?auto_1241 - HOIST
      ?auto_1240 - PLACE
      ?auto_1238 - SURFACE
      ?auto_1236 - TRUCK
      ?auto_1239 - PLACE
      ?auto_1237 - HOIST
      ?auto_1242 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1241 ?auto_1240 ) ( SURFACE-AT ?auto_1234 ?auto_1240 ) ( CLEAR ?auto_1234 ) ( IS-CRATE ?auto_1235 ) ( not ( = ?auto_1234 ?auto_1235 ) ) ( AVAILABLE ?auto_1241 ) ( ON ?auto_1234 ?auto_1238 ) ( not ( = ?auto_1238 ?auto_1234 ) ) ( not ( = ?auto_1238 ?auto_1235 ) ) ( TRUCK-AT ?auto_1236 ?auto_1239 ) ( not ( = ?auto_1239 ?auto_1240 ) ) ( HOIST-AT ?auto_1237 ?auto_1239 ) ( not ( = ?auto_1241 ?auto_1237 ) ) ( AVAILABLE ?auto_1237 ) ( SURFACE-AT ?auto_1235 ?auto_1239 ) ( ON ?auto_1235 ?auto_1242 ) ( CLEAR ?auto_1235 ) ( not ( = ?auto_1234 ?auto_1242 ) ) ( not ( = ?auto_1235 ?auto_1242 ) ) ( not ( = ?auto_1238 ?auto_1242 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1237 ?auto_1235 ?auto_1242 ?auto_1239 )
      ( MAKE-2CRATE ?auto_1238 ?auto_1234 ?auto_1235 )
      ( MAKE-1CRATE-VERIFY ?auto_1234 ?auto_1235 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1243 - SURFACE
      ?auto_1244 - SURFACE
      ?auto_1245 - SURFACE
    )
    :vars
    (
      ?auto_1250 - HOIST
      ?auto_1246 - PLACE
      ?auto_1247 - TRUCK
      ?auto_1249 - PLACE
      ?auto_1248 - HOIST
      ?auto_1251 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1250 ?auto_1246 ) ( SURFACE-AT ?auto_1244 ?auto_1246 ) ( CLEAR ?auto_1244 ) ( IS-CRATE ?auto_1245 ) ( not ( = ?auto_1244 ?auto_1245 ) ) ( AVAILABLE ?auto_1250 ) ( ON ?auto_1244 ?auto_1243 ) ( not ( = ?auto_1243 ?auto_1244 ) ) ( not ( = ?auto_1243 ?auto_1245 ) ) ( TRUCK-AT ?auto_1247 ?auto_1249 ) ( not ( = ?auto_1249 ?auto_1246 ) ) ( HOIST-AT ?auto_1248 ?auto_1249 ) ( not ( = ?auto_1250 ?auto_1248 ) ) ( AVAILABLE ?auto_1248 ) ( SURFACE-AT ?auto_1245 ?auto_1249 ) ( ON ?auto_1245 ?auto_1251 ) ( CLEAR ?auto_1245 ) ( not ( = ?auto_1244 ?auto_1251 ) ) ( not ( = ?auto_1245 ?auto_1251 ) ) ( not ( = ?auto_1243 ?auto_1251 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1244 ?auto_1245 )
      ( MAKE-2CRATE-VERIFY ?auto_1243 ?auto_1244 ?auto_1245 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1252 - SURFACE
      ?auto_1253 - SURFACE
    )
    :vars
    (
      ?auto_1255 - HOIST
      ?auto_1259 - PLACE
      ?auto_1254 - SURFACE
      ?auto_1260 - PLACE
      ?auto_1258 - HOIST
      ?auto_1256 - SURFACE
      ?auto_1257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1255 ?auto_1259 ) ( SURFACE-AT ?auto_1252 ?auto_1259 ) ( CLEAR ?auto_1252 ) ( IS-CRATE ?auto_1253 ) ( not ( = ?auto_1252 ?auto_1253 ) ) ( AVAILABLE ?auto_1255 ) ( ON ?auto_1252 ?auto_1254 ) ( not ( = ?auto_1254 ?auto_1252 ) ) ( not ( = ?auto_1254 ?auto_1253 ) ) ( not ( = ?auto_1260 ?auto_1259 ) ) ( HOIST-AT ?auto_1258 ?auto_1260 ) ( not ( = ?auto_1255 ?auto_1258 ) ) ( AVAILABLE ?auto_1258 ) ( SURFACE-AT ?auto_1253 ?auto_1260 ) ( ON ?auto_1253 ?auto_1256 ) ( CLEAR ?auto_1253 ) ( not ( = ?auto_1252 ?auto_1256 ) ) ( not ( = ?auto_1253 ?auto_1256 ) ) ( not ( = ?auto_1254 ?auto_1256 ) ) ( TRUCK-AT ?auto_1257 ?auto_1259 ) )
    :subtasks
    ( ( !DRIVE ?auto_1257 ?auto_1259 ?auto_1260 )
      ( MAKE-2CRATE ?auto_1254 ?auto_1252 ?auto_1253 )
      ( MAKE-1CRATE-VERIFY ?auto_1252 ?auto_1253 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1261 - SURFACE
      ?auto_1262 - SURFACE
      ?auto_1263 - SURFACE
    )
    :vars
    (
      ?auto_1266 - HOIST
      ?auto_1268 - PLACE
      ?auto_1267 - PLACE
      ?auto_1264 - HOIST
      ?auto_1265 - SURFACE
      ?auto_1269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1266 ?auto_1268 ) ( SURFACE-AT ?auto_1262 ?auto_1268 ) ( CLEAR ?auto_1262 ) ( IS-CRATE ?auto_1263 ) ( not ( = ?auto_1262 ?auto_1263 ) ) ( AVAILABLE ?auto_1266 ) ( ON ?auto_1262 ?auto_1261 ) ( not ( = ?auto_1261 ?auto_1262 ) ) ( not ( = ?auto_1261 ?auto_1263 ) ) ( not ( = ?auto_1267 ?auto_1268 ) ) ( HOIST-AT ?auto_1264 ?auto_1267 ) ( not ( = ?auto_1266 ?auto_1264 ) ) ( AVAILABLE ?auto_1264 ) ( SURFACE-AT ?auto_1263 ?auto_1267 ) ( ON ?auto_1263 ?auto_1265 ) ( CLEAR ?auto_1263 ) ( not ( = ?auto_1262 ?auto_1265 ) ) ( not ( = ?auto_1263 ?auto_1265 ) ) ( not ( = ?auto_1261 ?auto_1265 ) ) ( TRUCK-AT ?auto_1269 ?auto_1268 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1262 ?auto_1263 )
      ( MAKE-2CRATE-VERIFY ?auto_1261 ?auto_1262 ?auto_1263 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1270 - SURFACE
      ?auto_1271 - SURFACE
    )
    :vars
    (
      ?auto_1273 - HOIST
      ?auto_1275 - PLACE
      ?auto_1278 - SURFACE
      ?auto_1272 - PLACE
      ?auto_1276 - HOIST
      ?auto_1274 - SURFACE
      ?auto_1277 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1273 ?auto_1275 ) ( IS-CRATE ?auto_1271 ) ( not ( = ?auto_1270 ?auto_1271 ) ) ( not ( = ?auto_1278 ?auto_1270 ) ) ( not ( = ?auto_1278 ?auto_1271 ) ) ( not ( = ?auto_1272 ?auto_1275 ) ) ( HOIST-AT ?auto_1276 ?auto_1272 ) ( not ( = ?auto_1273 ?auto_1276 ) ) ( AVAILABLE ?auto_1276 ) ( SURFACE-AT ?auto_1271 ?auto_1272 ) ( ON ?auto_1271 ?auto_1274 ) ( CLEAR ?auto_1271 ) ( not ( = ?auto_1270 ?auto_1274 ) ) ( not ( = ?auto_1271 ?auto_1274 ) ) ( not ( = ?auto_1278 ?auto_1274 ) ) ( TRUCK-AT ?auto_1277 ?auto_1275 ) ( SURFACE-AT ?auto_1278 ?auto_1275 ) ( CLEAR ?auto_1278 ) ( LIFTING ?auto_1273 ?auto_1270 ) ( IS-CRATE ?auto_1270 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1278 ?auto_1270 )
      ( MAKE-2CRATE ?auto_1278 ?auto_1270 ?auto_1271 )
      ( MAKE-1CRATE-VERIFY ?auto_1270 ?auto_1271 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1279 - SURFACE
      ?auto_1280 - SURFACE
      ?auto_1281 - SURFACE
    )
    :vars
    (
      ?auto_1285 - HOIST
      ?auto_1286 - PLACE
      ?auto_1287 - PLACE
      ?auto_1283 - HOIST
      ?auto_1284 - SURFACE
      ?auto_1282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1285 ?auto_1286 ) ( IS-CRATE ?auto_1281 ) ( not ( = ?auto_1280 ?auto_1281 ) ) ( not ( = ?auto_1279 ?auto_1280 ) ) ( not ( = ?auto_1279 ?auto_1281 ) ) ( not ( = ?auto_1287 ?auto_1286 ) ) ( HOIST-AT ?auto_1283 ?auto_1287 ) ( not ( = ?auto_1285 ?auto_1283 ) ) ( AVAILABLE ?auto_1283 ) ( SURFACE-AT ?auto_1281 ?auto_1287 ) ( ON ?auto_1281 ?auto_1284 ) ( CLEAR ?auto_1281 ) ( not ( = ?auto_1280 ?auto_1284 ) ) ( not ( = ?auto_1281 ?auto_1284 ) ) ( not ( = ?auto_1279 ?auto_1284 ) ) ( TRUCK-AT ?auto_1282 ?auto_1286 ) ( SURFACE-AT ?auto_1279 ?auto_1286 ) ( CLEAR ?auto_1279 ) ( LIFTING ?auto_1285 ?auto_1280 ) ( IS-CRATE ?auto_1280 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1280 ?auto_1281 )
      ( MAKE-2CRATE-VERIFY ?auto_1279 ?auto_1280 ?auto_1281 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1288 - SURFACE
      ?auto_1289 - SURFACE
    )
    :vars
    (
      ?auto_1294 - HOIST
      ?auto_1292 - PLACE
      ?auto_1295 - SURFACE
      ?auto_1291 - PLACE
      ?auto_1290 - HOIST
      ?auto_1293 - SURFACE
      ?auto_1296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1294 ?auto_1292 ) ( IS-CRATE ?auto_1289 ) ( not ( = ?auto_1288 ?auto_1289 ) ) ( not ( = ?auto_1295 ?auto_1288 ) ) ( not ( = ?auto_1295 ?auto_1289 ) ) ( not ( = ?auto_1291 ?auto_1292 ) ) ( HOIST-AT ?auto_1290 ?auto_1291 ) ( not ( = ?auto_1294 ?auto_1290 ) ) ( AVAILABLE ?auto_1290 ) ( SURFACE-AT ?auto_1289 ?auto_1291 ) ( ON ?auto_1289 ?auto_1293 ) ( CLEAR ?auto_1289 ) ( not ( = ?auto_1288 ?auto_1293 ) ) ( not ( = ?auto_1289 ?auto_1293 ) ) ( not ( = ?auto_1295 ?auto_1293 ) ) ( TRUCK-AT ?auto_1296 ?auto_1292 ) ( SURFACE-AT ?auto_1295 ?auto_1292 ) ( CLEAR ?auto_1295 ) ( IS-CRATE ?auto_1288 ) ( AVAILABLE ?auto_1294 ) ( IN ?auto_1288 ?auto_1296 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1294 ?auto_1288 ?auto_1296 ?auto_1292 )
      ( MAKE-2CRATE ?auto_1295 ?auto_1288 ?auto_1289 )
      ( MAKE-1CRATE-VERIFY ?auto_1288 ?auto_1289 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1297 - SURFACE
      ?auto_1298 - SURFACE
      ?auto_1299 - SURFACE
    )
    :vars
    (
      ?auto_1302 - HOIST
      ?auto_1304 - PLACE
      ?auto_1303 - PLACE
      ?auto_1300 - HOIST
      ?auto_1301 - SURFACE
      ?auto_1305 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1302 ?auto_1304 ) ( IS-CRATE ?auto_1299 ) ( not ( = ?auto_1298 ?auto_1299 ) ) ( not ( = ?auto_1297 ?auto_1298 ) ) ( not ( = ?auto_1297 ?auto_1299 ) ) ( not ( = ?auto_1303 ?auto_1304 ) ) ( HOIST-AT ?auto_1300 ?auto_1303 ) ( not ( = ?auto_1302 ?auto_1300 ) ) ( AVAILABLE ?auto_1300 ) ( SURFACE-AT ?auto_1299 ?auto_1303 ) ( ON ?auto_1299 ?auto_1301 ) ( CLEAR ?auto_1299 ) ( not ( = ?auto_1298 ?auto_1301 ) ) ( not ( = ?auto_1299 ?auto_1301 ) ) ( not ( = ?auto_1297 ?auto_1301 ) ) ( TRUCK-AT ?auto_1305 ?auto_1304 ) ( SURFACE-AT ?auto_1297 ?auto_1304 ) ( CLEAR ?auto_1297 ) ( IS-CRATE ?auto_1298 ) ( AVAILABLE ?auto_1302 ) ( IN ?auto_1298 ?auto_1305 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1298 ?auto_1299 )
      ( MAKE-2CRATE-VERIFY ?auto_1297 ?auto_1298 ?auto_1299 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1306 - SURFACE
      ?auto_1307 - SURFACE
    )
    :vars
    (
      ?auto_1313 - HOIST
      ?auto_1308 - PLACE
      ?auto_1314 - SURFACE
      ?auto_1310 - PLACE
      ?auto_1309 - HOIST
      ?auto_1312 - SURFACE
      ?auto_1311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1313 ?auto_1308 ) ( IS-CRATE ?auto_1307 ) ( not ( = ?auto_1306 ?auto_1307 ) ) ( not ( = ?auto_1314 ?auto_1306 ) ) ( not ( = ?auto_1314 ?auto_1307 ) ) ( not ( = ?auto_1310 ?auto_1308 ) ) ( HOIST-AT ?auto_1309 ?auto_1310 ) ( not ( = ?auto_1313 ?auto_1309 ) ) ( AVAILABLE ?auto_1309 ) ( SURFACE-AT ?auto_1307 ?auto_1310 ) ( ON ?auto_1307 ?auto_1312 ) ( CLEAR ?auto_1307 ) ( not ( = ?auto_1306 ?auto_1312 ) ) ( not ( = ?auto_1307 ?auto_1312 ) ) ( not ( = ?auto_1314 ?auto_1312 ) ) ( SURFACE-AT ?auto_1314 ?auto_1308 ) ( CLEAR ?auto_1314 ) ( IS-CRATE ?auto_1306 ) ( AVAILABLE ?auto_1313 ) ( IN ?auto_1306 ?auto_1311 ) ( TRUCK-AT ?auto_1311 ?auto_1310 ) )
    :subtasks
    ( ( !DRIVE ?auto_1311 ?auto_1310 ?auto_1308 )
      ( MAKE-2CRATE ?auto_1314 ?auto_1306 ?auto_1307 )
      ( MAKE-1CRATE-VERIFY ?auto_1306 ?auto_1307 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1315 - SURFACE
      ?auto_1316 - SURFACE
      ?auto_1317 - SURFACE
    )
    :vars
    (
      ?auto_1323 - HOIST
      ?auto_1319 - PLACE
      ?auto_1320 - PLACE
      ?auto_1318 - HOIST
      ?auto_1322 - SURFACE
      ?auto_1321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1323 ?auto_1319 ) ( IS-CRATE ?auto_1317 ) ( not ( = ?auto_1316 ?auto_1317 ) ) ( not ( = ?auto_1315 ?auto_1316 ) ) ( not ( = ?auto_1315 ?auto_1317 ) ) ( not ( = ?auto_1320 ?auto_1319 ) ) ( HOIST-AT ?auto_1318 ?auto_1320 ) ( not ( = ?auto_1323 ?auto_1318 ) ) ( AVAILABLE ?auto_1318 ) ( SURFACE-AT ?auto_1317 ?auto_1320 ) ( ON ?auto_1317 ?auto_1322 ) ( CLEAR ?auto_1317 ) ( not ( = ?auto_1316 ?auto_1322 ) ) ( not ( = ?auto_1317 ?auto_1322 ) ) ( not ( = ?auto_1315 ?auto_1322 ) ) ( SURFACE-AT ?auto_1315 ?auto_1319 ) ( CLEAR ?auto_1315 ) ( IS-CRATE ?auto_1316 ) ( AVAILABLE ?auto_1323 ) ( IN ?auto_1316 ?auto_1321 ) ( TRUCK-AT ?auto_1321 ?auto_1320 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1316 ?auto_1317 )
      ( MAKE-2CRATE-VERIFY ?auto_1315 ?auto_1316 ?auto_1317 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1324 - SURFACE
      ?auto_1325 - SURFACE
    )
    :vars
    (
      ?auto_1327 - HOIST
      ?auto_1328 - PLACE
      ?auto_1326 - SURFACE
      ?auto_1332 - PLACE
      ?auto_1329 - HOIST
      ?auto_1331 - SURFACE
      ?auto_1330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1327 ?auto_1328 ) ( IS-CRATE ?auto_1325 ) ( not ( = ?auto_1324 ?auto_1325 ) ) ( not ( = ?auto_1326 ?auto_1324 ) ) ( not ( = ?auto_1326 ?auto_1325 ) ) ( not ( = ?auto_1332 ?auto_1328 ) ) ( HOIST-AT ?auto_1329 ?auto_1332 ) ( not ( = ?auto_1327 ?auto_1329 ) ) ( SURFACE-AT ?auto_1325 ?auto_1332 ) ( ON ?auto_1325 ?auto_1331 ) ( CLEAR ?auto_1325 ) ( not ( = ?auto_1324 ?auto_1331 ) ) ( not ( = ?auto_1325 ?auto_1331 ) ) ( not ( = ?auto_1326 ?auto_1331 ) ) ( SURFACE-AT ?auto_1326 ?auto_1328 ) ( CLEAR ?auto_1326 ) ( IS-CRATE ?auto_1324 ) ( AVAILABLE ?auto_1327 ) ( TRUCK-AT ?auto_1330 ?auto_1332 ) ( LIFTING ?auto_1329 ?auto_1324 ) )
    :subtasks
    ( ( !LOAD ?auto_1329 ?auto_1324 ?auto_1330 ?auto_1332 )
      ( MAKE-2CRATE ?auto_1326 ?auto_1324 ?auto_1325 )
      ( MAKE-1CRATE-VERIFY ?auto_1324 ?auto_1325 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1333 - SURFACE
      ?auto_1334 - SURFACE
      ?auto_1335 - SURFACE
    )
    :vars
    (
      ?auto_1337 - HOIST
      ?auto_1336 - PLACE
      ?auto_1339 - PLACE
      ?auto_1341 - HOIST
      ?auto_1340 - SURFACE
      ?auto_1338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1337 ?auto_1336 ) ( IS-CRATE ?auto_1335 ) ( not ( = ?auto_1334 ?auto_1335 ) ) ( not ( = ?auto_1333 ?auto_1334 ) ) ( not ( = ?auto_1333 ?auto_1335 ) ) ( not ( = ?auto_1339 ?auto_1336 ) ) ( HOIST-AT ?auto_1341 ?auto_1339 ) ( not ( = ?auto_1337 ?auto_1341 ) ) ( SURFACE-AT ?auto_1335 ?auto_1339 ) ( ON ?auto_1335 ?auto_1340 ) ( CLEAR ?auto_1335 ) ( not ( = ?auto_1334 ?auto_1340 ) ) ( not ( = ?auto_1335 ?auto_1340 ) ) ( not ( = ?auto_1333 ?auto_1340 ) ) ( SURFACE-AT ?auto_1333 ?auto_1336 ) ( CLEAR ?auto_1333 ) ( IS-CRATE ?auto_1334 ) ( AVAILABLE ?auto_1337 ) ( TRUCK-AT ?auto_1338 ?auto_1339 ) ( LIFTING ?auto_1341 ?auto_1334 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1334 ?auto_1335 )
      ( MAKE-2CRATE-VERIFY ?auto_1333 ?auto_1334 ?auto_1335 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1342 - SURFACE
      ?auto_1343 - SURFACE
    )
    :vars
    (
      ?auto_1350 - HOIST
      ?auto_1347 - PLACE
      ?auto_1346 - SURFACE
      ?auto_1348 - PLACE
      ?auto_1344 - HOIST
      ?auto_1349 - SURFACE
      ?auto_1345 - TRUCK
      ?auto_1351 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1350 ?auto_1347 ) ( IS-CRATE ?auto_1343 ) ( not ( = ?auto_1342 ?auto_1343 ) ) ( not ( = ?auto_1346 ?auto_1342 ) ) ( not ( = ?auto_1346 ?auto_1343 ) ) ( not ( = ?auto_1348 ?auto_1347 ) ) ( HOIST-AT ?auto_1344 ?auto_1348 ) ( not ( = ?auto_1350 ?auto_1344 ) ) ( SURFACE-AT ?auto_1343 ?auto_1348 ) ( ON ?auto_1343 ?auto_1349 ) ( CLEAR ?auto_1343 ) ( not ( = ?auto_1342 ?auto_1349 ) ) ( not ( = ?auto_1343 ?auto_1349 ) ) ( not ( = ?auto_1346 ?auto_1349 ) ) ( SURFACE-AT ?auto_1346 ?auto_1347 ) ( CLEAR ?auto_1346 ) ( IS-CRATE ?auto_1342 ) ( AVAILABLE ?auto_1350 ) ( TRUCK-AT ?auto_1345 ?auto_1348 ) ( AVAILABLE ?auto_1344 ) ( SURFACE-AT ?auto_1342 ?auto_1348 ) ( ON ?auto_1342 ?auto_1351 ) ( CLEAR ?auto_1342 ) ( not ( = ?auto_1342 ?auto_1351 ) ) ( not ( = ?auto_1343 ?auto_1351 ) ) ( not ( = ?auto_1346 ?auto_1351 ) ) ( not ( = ?auto_1349 ?auto_1351 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1344 ?auto_1342 ?auto_1351 ?auto_1348 )
      ( MAKE-2CRATE ?auto_1346 ?auto_1342 ?auto_1343 )
      ( MAKE-1CRATE-VERIFY ?auto_1342 ?auto_1343 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1352 - SURFACE
      ?auto_1353 - SURFACE
      ?auto_1354 - SURFACE
    )
    :vars
    (
      ?auto_1355 - HOIST
      ?auto_1358 - PLACE
      ?auto_1360 - PLACE
      ?auto_1356 - HOIST
      ?auto_1357 - SURFACE
      ?auto_1359 - TRUCK
      ?auto_1361 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1355 ?auto_1358 ) ( IS-CRATE ?auto_1354 ) ( not ( = ?auto_1353 ?auto_1354 ) ) ( not ( = ?auto_1352 ?auto_1353 ) ) ( not ( = ?auto_1352 ?auto_1354 ) ) ( not ( = ?auto_1360 ?auto_1358 ) ) ( HOIST-AT ?auto_1356 ?auto_1360 ) ( not ( = ?auto_1355 ?auto_1356 ) ) ( SURFACE-AT ?auto_1354 ?auto_1360 ) ( ON ?auto_1354 ?auto_1357 ) ( CLEAR ?auto_1354 ) ( not ( = ?auto_1353 ?auto_1357 ) ) ( not ( = ?auto_1354 ?auto_1357 ) ) ( not ( = ?auto_1352 ?auto_1357 ) ) ( SURFACE-AT ?auto_1352 ?auto_1358 ) ( CLEAR ?auto_1352 ) ( IS-CRATE ?auto_1353 ) ( AVAILABLE ?auto_1355 ) ( TRUCK-AT ?auto_1359 ?auto_1360 ) ( AVAILABLE ?auto_1356 ) ( SURFACE-AT ?auto_1353 ?auto_1360 ) ( ON ?auto_1353 ?auto_1361 ) ( CLEAR ?auto_1353 ) ( not ( = ?auto_1353 ?auto_1361 ) ) ( not ( = ?auto_1354 ?auto_1361 ) ) ( not ( = ?auto_1352 ?auto_1361 ) ) ( not ( = ?auto_1357 ?auto_1361 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1353 ?auto_1354 )
      ( MAKE-2CRATE-VERIFY ?auto_1352 ?auto_1353 ?auto_1354 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1362 - SURFACE
      ?auto_1363 - SURFACE
    )
    :vars
    (
      ?auto_1367 - HOIST
      ?auto_1365 - PLACE
      ?auto_1369 - SURFACE
      ?auto_1368 - PLACE
      ?auto_1366 - HOIST
      ?auto_1364 - SURFACE
      ?auto_1370 - SURFACE
      ?auto_1371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1367 ?auto_1365 ) ( IS-CRATE ?auto_1363 ) ( not ( = ?auto_1362 ?auto_1363 ) ) ( not ( = ?auto_1369 ?auto_1362 ) ) ( not ( = ?auto_1369 ?auto_1363 ) ) ( not ( = ?auto_1368 ?auto_1365 ) ) ( HOIST-AT ?auto_1366 ?auto_1368 ) ( not ( = ?auto_1367 ?auto_1366 ) ) ( SURFACE-AT ?auto_1363 ?auto_1368 ) ( ON ?auto_1363 ?auto_1364 ) ( CLEAR ?auto_1363 ) ( not ( = ?auto_1362 ?auto_1364 ) ) ( not ( = ?auto_1363 ?auto_1364 ) ) ( not ( = ?auto_1369 ?auto_1364 ) ) ( SURFACE-AT ?auto_1369 ?auto_1365 ) ( CLEAR ?auto_1369 ) ( IS-CRATE ?auto_1362 ) ( AVAILABLE ?auto_1367 ) ( AVAILABLE ?auto_1366 ) ( SURFACE-AT ?auto_1362 ?auto_1368 ) ( ON ?auto_1362 ?auto_1370 ) ( CLEAR ?auto_1362 ) ( not ( = ?auto_1362 ?auto_1370 ) ) ( not ( = ?auto_1363 ?auto_1370 ) ) ( not ( = ?auto_1369 ?auto_1370 ) ) ( not ( = ?auto_1364 ?auto_1370 ) ) ( TRUCK-AT ?auto_1371 ?auto_1365 ) )
    :subtasks
    ( ( !DRIVE ?auto_1371 ?auto_1365 ?auto_1368 )
      ( MAKE-2CRATE ?auto_1369 ?auto_1362 ?auto_1363 )
      ( MAKE-1CRATE-VERIFY ?auto_1362 ?auto_1363 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1372 - SURFACE
      ?auto_1373 - SURFACE
      ?auto_1374 - SURFACE
    )
    :vars
    (
      ?auto_1375 - HOIST
      ?auto_1376 - PLACE
      ?auto_1381 - PLACE
      ?auto_1377 - HOIST
      ?auto_1379 - SURFACE
      ?auto_1378 - SURFACE
      ?auto_1380 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1375 ?auto_1376 ) ( IS-CRATE ?auto_1374 ) ( not ( = ?auto_1373 ?auto_1374 ) ) ( not ( = ?auto_1372 ?auto_1373 ) ) ( not ( = ?auto_1372 ?auto_1374 ) ) ( not ( = ?auto_1381 ?auto_1376 ) ) ( HOIST-AT ?auto_1377 ?auto_1381 ) ( not ( = ?auto_1375 ?auto_1377 ) ) ( SURFACE-AT ?auto_1374 ?auto_1381 ) ( ON ?auto_1374 ?auto_1379 ) ( CLEAR ?auto_1374 ) ( not ( = ?auto_1373 ?auto_1379 ) ) ( not ( = ?auto_1374 ?auto_1379 ) ) ( not ( = ?auto_1372 ?auto_1379 ) ) ( SURFACE-AT ?auto_1372 ?auto_1376 ) ( CLEAR ?auto_1372 ) ( IS-CRATE ?auto_1373 ) ( AVAILABLE ?auto_1375 ) ( AVAILABLE ?auto_1377 ) ( SURFACE-AT ?auto_1373 ?auto_1381 ) ( ON ?auto_1373 ?auto_1378 ) ( CLEAR ?auto_1373 ) ( not ( = ?auto_1373 ?auto_1378 ) ) ( not ( = ?auto_1374 ?auto_1378 ) ) ( not ( = ?auto_1372 ?auto_1378 ) ) ( not ( = ?auto_1379 ?auto_1378 ) ) ( TRUCK-AT ?auto_1380 ?auto_1376 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1373 ?auto_1374 )
      ( MAKE-2CRATE-VERIFY ?auto_1372 ?auto_1373 ?auto_1374 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1400 - SURFACE
      ?auto_1401 - SURFACE
      ?auto_1402 - SURFACE
      ?auto_1403 - SURFACE
    )
    :vars
    (
      ?auto_1405 - HOIST
      ?auto_1404 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1405 ?auto_1404 ) ( SURFACE-AT ?auto_1402 ?auto_1404 ) ( CLEAR ?auto_1402 ) ( LIFTING ?auto_1405 ?auto_1403 ) ( IS-CRATE ?auto_1403 ) ( not ( = ?auto_1402 ?auto_1403 ) ) ( ON ?auto_1401 ?auto_1400 ) ( ON ?auto_1402 ?auto_1401 ) ( not ( = ?auto_1400 ?auto_1401 ) ) ( not ( = ?auto_1400 ?auto_1402 ) ) ( not ( = ?auto_1400 ?auto_1403 ) ) ( not ( = ?auto_1401 ?auto_1402 ) ) ( not ( = ?auto_1401 ?auto_1403 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1402 ?auto_1403 )
      ( MAKE-3CRATE-VERIFY ?auto_1400 ?auto_1401 ?auto_1402 ?auto_1403 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1417 - SURFACE
      ?auto_1418 - SURFACE
      ?auto_1419 - SURFACE
      ?auto_1420 - SURFACE
    )
    :vars
    (
      ?auto_1423 - HOIST
      ?auto_1421 - PLACE
      ?auto_1422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1423 ?auto_1421 ) ( SURFACE-AT ?auto_1419 ?auto_1421 ) ( CLEAR ?auto_1419 ) ( IS-CRATE ?auto_1420 ) ( not ( = ?auto_1419 ?auto_1420 ) ) ( TRUCK-AT ?auto_1422 ?auto_1421 ) ( AVAILABLE ?auto_1423 ) ( IN ?auto_1420 ?auto_1422 ) ( ON ?auto_1419 ?auto_1418 ) ( not ( = ?auto_1418 ?auto_1419 ) ) ( not ( = ?auto_1418 ?auto_1420 ) ) ( ON ?auto_1418 ?auto_1417 ) ( not ( = ?auto_1417 ?auto_1418 ) ) ( not ( = ?auto_1417 ?auto_1419 ) ) ( not ( = ?auto_1417 ?auto_1420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1418 ?auto_1419 ?auto_1420 )
      ( MAKE-3CRATE-VERIFY ?auto_1417 ?auto_1418 ?auto_1419 ?auto_1420 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1438 - SURFACE
      ?auto_1439 - SURFACE
      ?auto_1440 - SURFACE
      ?auto_1441 - SURFACE
    )
    :vars
    (
      ?auto_1443 - HOIST
      ?auto_1442 - PLACE
      ?auto_1444 - TRUCK
      ?auto_1445 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1443 ?auto_1442 ) ( SURFACE-AT ?auto_1440 ?auto_1442 ) ( CLEAR ?auto_1440 ) ( IS-CRATE ?auto_1441 ) ( not ( = ?auto_1440 ?auto_1441 ) ) ( AVAILABLE ?auto_1443 ) ( IN ?auto_1441 ?auto_1444 ) ( ON ?auto_1440 ?auto_1439 ) ( not ( = ?auto_1439 ?auto_1440 ) ) ( not ( = ?auto_1439 ?auto_1441 ) ) ( TRUCK-AT ?auto_1444 ?auto_1445 ) ( not ( = ?auto_1445 ?auto_1442 ) ) ( ON ?auto_1439 ?auto_1438 ) ( not ( = ?auto_1438 ?auto_1439 ) ) ( not ( = ?auto_1438 ?auto_1440 ) ) ( not ( = ?auto_1438 ?auto_1441 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1439 ?auto_1440 ?auto_1441 )
      ( MAKE-3CRATE-VERIFY ?auto_1438 ?auto_1439 ?auto_1440 ?auto_1441 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1462 - SURFACE
      ?auto_1463 - SURFACE
      ?auto_1464 - SURFACE
      ?auto_1465 - SURFACE
    )
    :vars
    (
      ?auto_1470 - HOIST
      ?auto_1469 - PLACE
      ?auto_1467 - TRUCK
      ?auto_1468 - PLACE
      ?auto_1466 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1470 ?auto_1469 ) ( SURFACE-AT ?auto_1464 ?auto_1469 ) ( CLEAR ?auto_1464 ) ( IS-CRATE ?auto_1465 ) ( not ( = ?auto_1464 ?auto_1465 ) ) ( AVAILABLE ?auto_1470 ) ( ON ?auto_1464 ?auto_1463 ) ( not ( = ?auto_1463 ?auto_1464 ) ) ( not ( = ?auto_1463 ?auto_1465 ) ) ( TRUCK-AT ?auto_1467 ?auto_1468 ) ( not ( = ?auto_1468 ?auto_1469 ) ) ( HOIST-AT ?auto_1466 ?auto_1468 ) ( LIFTING ?auto_1466 ?auto_1465 ) ( not ( = ?auto_1470 ?auto_1466 ) ) ( ON ?auto_1463 ?auto_1462 ) ( not ( = ?auto_1462 ?auto_1463 ) ) ( not ( = ?auto_1462 ?auto_1464 ) ) ( not ( = ?auto_1462 ?auto_1465 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1463 ?auto_1464 ?auto_1465 )
      ( MAKE-3CRATE-VERIFY ?auto_1462 ?auto_1463 ?auto_1464 ?auto_1465 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1489 - SURFACE
      ?auto_1490 - SURFACE
      ?auto_1491 - SURFACE
      ?auto_1492 - SURFACE
    )
    :vars
    (
      ?auto_1496 - HOIST
      ?auto_1497 - PLACE
      ?auto_1494 - TRUCK
      ?auto_1495 - PLACE
      ?auto_1493 - HOIST
      ?auto_1498 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1496 ?auto_1497 ) ( SURFACE-AT ?auto_1491 ?auto_1497 ) ( CLEAR ?auto_1491 ) ( IS-CRATE ?auto_1492 ) ( not ( = ?auto_1491 ?auto_1492 ) ) ( AVAILABLE ?auto_1496 ) ( ON ?auto_1491 ?auto_1490 ) ( not ( = ?auto_1490 ?auto_1491 ) ) ( not ( = ?auto_1490 ?auto_1492 ) ) ( TRUCK-AT ?auto_1494 ?auto_1495 ) ( not ( = ?auto_1495 ?auto_1497 ) ) ( HOIST-AT ?auto_1493 ?auto_1495 ) ( not ( = ?auto_1496 ?auto_1493 ) ) ( AVAILABLE ?auto_1493 ) ( SURFACE-AT ?auto_1492 ?auto_1495 ) ( ON ?auto_1492 ?auto_1498 ) ( CLEAR ?auto_1492 ) ( not ( = ?auto_1491 ?auto_1498 ) ) ( not ( = ?auto_1492 ?auto_1498 ) ) ( not ( = ?auto_1490 ?auto_1498 ) ) ( ON ?auto_1490 ?auto_1489 ) ( not ( = ?auto_1489 ?auto_1490 ) ) ( not ( = ?auto_1489 ?auto_1491 ) ) ( not ( = ?auto_1489 ?auto_1492 ) ) ( not ( = ?auto_1489 ?auto_1498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1490 ?auto_1491 ?auto_1492 )
      ( MAKE-3CRATE-VERIFY ?auto_1489 ?auto_1490 ?auto_1491 ?auto_1492 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1517 - SURFACE
      ?auto_1518 - SURFACE
      ?auto_1519 - SURFACE
      ?auto_1520 - SURFACE
    )
    :vars
    (
      ?auto_1521 - HOIST
      ?auto_1523 - PLACE
      ?auto_1525 - PLACE
      ?auto_1522 - HOIST
      ?auto_1526 - SURFACE
      ?auto_1524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1521 ?auto_1523 ) ( SURFACE-AT ?auto_1519 ?auto_1523 ) ( CLEAR ?auto_1519 ) ( IS-CRATE ?auto_1520 ) ( not ( = ?auto_1519 ?auto_1520 ) ) ( AVAILABLE ?auto_1521 ) ( ON ?auto_1519 ?auto_1518 ) ( not ( = ?auto_1518 ?auto_1519 ) ) ( not ( = ?auto_1518 ?auto_1520 ) ) ( not ( = ?auto_1525 ?auto_1523 ) ) ( HOIST-AT ?auto_1522 ?auto_1525 ) ( not ( = ?auto_1521 ?auto_1522 ) ) ( AVAILABLE ?auto_1522 ) ( SURFACE-AT ?auto_1520 ?auto_1525 ) ( ON ?auto_1520 ?auto_1526 ) ( CLEAR ?auto_1520 ) ( not ( = ?auto_1519 ?auto_1526 ) ) ( not ( = ?auto_1520 ?auto_1526 ) ) ( not ( = ?auto_1518 ?auto_1526 ) ) ( TRUCK-AT ?auto_1524 ?auto_1523 ) ( ON ?auto_1518 ?auto_1517 ) ( not ( = ?auto_1517 ?auto_1518 ) ) ( not ( = ?auto_1517 ?auto_1519 ) ) ( not ( = ?auto_1517 ?auto_1520 ) ) ( not ( = ?auto_1517 ?auto_1526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1518 ?auto_1519 ?auto_1520 )
      ( MAKE-3CRATE-VERIFY ?auto_1517 ?auto_1518 ?auto_1519 ?auto_1520 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1545 - SURFACE
      ?auto_1546 - SURFACE
      ?auto_1547 - SURFACE
      ?auto_1548 - SURFACE
    )
    :vars
    (
      ?auto_1549 - HOIST
      ?auto_1552 - PLACE
      ?auto_1553 - PLACE
      ?auto_1551 - HOIST
      ?auto_1554 - SURFACE
      ?auto_1550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1549 ?auto_1552 ) ( IS-CRATE ?auto_1548 ) ( not ( = ?auto_1547 ?auto_1548 ) ) ( not ( = ?auto_1546 ?auto_1547 ) ) ( not ( = ?auto_1546 ?auto_1548 ) ) ( not ( = ?auto_1553 ?auto_1552 ) ) ( HOIST-AT ?auto_1551 ?auto_1553 ) ( not ( = ?auto_1549 ?auto_1551 ) ) ( AVAILABLE ?auto_1551 ) ( SURFACE-AT ?auto_1548 ?auto_1553 ) ( ON ?auto_1548 ?auto_1554 ) ( CLEAR ?auto_1548 ) ( not ( = ?auto_1547 ?auto_1554 ) ) ( not ( = ?auto_1548 ?auto_1554 ) ) ( not ( = ?auto_1546 ?auto_1554 ) ) ( TRUCK-AT ?auto_1550 ?auto_1552 ) ( SURFACE-AT ?auto_1546 ?auto_1552 ) ( CLEAR ?auto_1546 ) ( LIFTING ?auto_1549 ?auto_1547 ) ( IS-CRATE ?auto_1547 ) ( ON ?auto_1546 ?auto_1545 ) ( not ( = ?auto_1545 ?auto_1546 ) ) ( not ( = ?auto_1545 ?auto_1547 ) ) ( not ( = ?auto_1545 ?auto_1548 ) ) ( not ( = ?auto_1545 ?auto_1554 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1546 ?auto_1547 ?auto_1548 )
      ( MAKE-3CRATE-VERIFY ?auto_1545 ?auto_1546 ?auto_1547 ?auto_1548 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1573 - SURFACE
      ?auto_1574 - SURFACE
      ?auto_1575 - SURFACE
      ?auto_1576 - SURFACE
    )
    :vars
    (
      ?auto_1578 - HOIST
      ?auto_1577 - PLACE
      ?auto_1581 - PLACE
      ?auto_1579 - HOIST
      ?auto_1580 - SURFACE
      ?auto_1582 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1578 ?auto_1577 ) ( IS-CRATE ?auto_1576 ) ( not ( = ?auto_1575 ?auto_1576 ) ) ( not ( = ?auto_1574 ?auto_1575 ) ) ( not ( = ?auto_1574 ?auto_1576 ) ) ( not ( = ?auto_1581 ?auto_1577 ) ) ( HOIST-AT ?auto_1579 ?auto_1581 ) ( not ( = ?auto_1578 ?auto_1579 ) ) ( AVAILABLE ?auto_1579 ) ( SURFACE-AT ?auto_1576 ?auto_1581 ) ( ON ?auto_1576 ?auto_1580 ) ( CLEAR ?auto_1576 ) ( not ( = ?auto_1575 ?auto_1580 ) ) ( not ( = ?auto_1576 ?auto_1580 ) ) ( not ( = ?auto_1574 ?auto_1580 ) ) ( TRUCK-AT ?auto_1582 ?auto_1577 ) ( SURFACE-AT ?auto_1574 ?auto_1577 ) ( CLEAR ?auto_1574 ) ( IS-CRATE ?auto_1575 ) ( AVAILABLE ?auto_1578 ) ( IN ?auto_1575 ?auto_1582 ) ( ON ?auto_1574 ?auto_1573 ) ( not ( = ?auto_1573 ?auto_1574 ) ) ( not ( = ?auto_1573 ?auto_1575 ) ) ( not ( = ?auto_1573 ?auto_1576 ) ) ( not ( = ?auto_1573 ?auto_1580 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1574 ?auto_1575 ?auto_1576 )
      ( MAKE-3CRATE-VERIFY ?auto_1573 ?auto_1574 ?auto_1575 ?auto_1576 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1652 - SURFACE
      ?auto_1653 - SURFACE
    )
    :vars
    (
      ?auto_1655 - HOIST
      ?auto_1658 - PLACE
      ?auto_1656 - SURFACE
      ?auto_1654 - PLACE
      ?auto_1659 - HOIST
      ?auto_1657 - SURFACE
      ?auto_1660 - TRUCK
      ?auto_1661 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1655 ?auto_1658 ) ( SURFACE-AT ?auto_1652 ?auto_1658 ) ( CLEAR ?auto_1652 ) ( IS-CRATE ?auto_1653 ) ( not ( = ?auto_1652 ?auto_1653 ) ) ( AVAILABLE ?auto_1655 ) ( ON ?auto_1652 ?auto_1656 ) ( not ( = ?auto_1656 ?auto_1652 ) ) ( not ( = ?auto_1656 ?auto_1653 ) ) ( not ( = ?auto_1654 ?auto_1658 ) ) ( HOIST-AT ?auto_1659 ?auto_1654 ) ( not ( = ?auto_1655 ?auto_1659 ) ) ( AVAILABLE ?auto_1659 ) ( SURFACE-AT ?auto_1653 ?auto_1654 ) ( ON ?auto_1653 ?auto_1657 ) ( CLEAR ?auto_1653 ) ( not ( = ?auto_1652 ?auto_1657 ) ) ( not ( = ?auto_1653 ?auto_1657 ) ) ( not ( = ?auto_1656 ?auto_1657 ) ) ( TRUCK-AT ?auto_1660 ?auto_1661 ) ( not ( = ?auto_1661 ?auto_1658 ) ) ( not ( = ?auto_1654 ?auto_1661 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1660 ?auto_1661 ?auto_1658 )
      ( MAKE-1CRATE ?auto_1652 ?auto_1653 )
      ( MAKE-1CRATE-VERIFY ?auto_1652 ?auto_1653 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1758 - SURFACE
      ?auto_1759 - SURFACE
    )
    :vars
    (
      ?auto_1763 - HOIST
      ?auto_1764 - PLACE
      ?auto_1766 - SURFACE
      ?auto_1762 - PLACE
      ?auto_1761 - HOIST
      ?auto_1765 - SURFACE
      ?auto_1760 - TRUCK
      ?auto_1767 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1763 ?auto_1764 ) ( SURFACE-AT ?auto_1758 ?auto_1764 ) ( CLEAR ?auto_1758 ) ( IS-CRATE ?auto_1759 ) ( not ( = ?auto_1758 ?auto_1759 ) ) ( ON ?auto_1758 ?auto_1766 ) ( not ( = ?auto_1766 ?auto_1758 ) ) ( not ( = ?auto_1766 ?auto_1759 ) ) ( not ( = ?auto_1762 ?auto_1764 ) ) ( HOIST-AT ?auto_1761 ?auto_1762 ) ( not ( = ?auto_1763 ?auto_1761 ) ) ( AVAILABLE ?auto_1761 ) ( SURFACE-AT ?auto_1759 ?auto_1762 ) ( ON ?auto_1759 ?auto_1765 ) ( CLEAR ?auto_1759 ) ( not ( = ?auto_1758 ?auto_1765 ) ) ( not ( = ?auto_1759 ?auto_1765 ) ) ( not ( = ?auto_1766 ?auto_1765 ) ) ( TRUCK-AT ?auto_1760 ?auto_1764 ) ( LIFTING ?auto_1763 ?auto_1767 ) ( IS-CRATE ?auto_1767 ) ( not ( = ?auto_1758 ?auto_1767 ) ) ( not ( = ?auto_1759 ?auto_1767 ) ) ( not ( = ?auto_1766 ?auto_1767 ) ) ( not ( = ?auto_1765 ?auto_1767 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1763 ?auto_1767 ?auto_1760 ?auto_1764 )
      ( MAKE-1CRATE ?auto_1758 ?auto_1759 )
      ( MAKE-1CRATE-VERIFY ?auto_1758 ?auto_1759 ) )
  )

)

