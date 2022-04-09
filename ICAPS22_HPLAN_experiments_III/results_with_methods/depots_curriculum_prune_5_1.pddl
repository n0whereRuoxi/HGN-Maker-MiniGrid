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
      ?auto_1100 - SURFACE
      ?auto_1101 - SURFACE
    )
    :vars
    (
      ?auto_1102 - HOIST
      ?auto_1103 - PLACE
      ?auto_1105 - PLACE
      ?auto_1106 - HOIST
      ?auto_1107 - SURFACE
      ?auto_1104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1102 ?auto_1103 ) ( SURFACE-AT ?auto_1100 ?auto_1103 ) ( CLEAR ?auto_1100 ) ( IS-CRATE ?auto_1101 ) ( AVAILABLE ?auto_1102 ) ( not ( = ?auto_1105 ?auto_1103 ) ) ( HOIST-AT ?auto_1106 ?auto_1105 ) ( AVAILABLE ?auto_1106 ) ( SURFACE-AT ?auto_1101 ?auto_1105 ) ( ON ?auto_1101 ?auto_1107 ) ( CLEAR ?auto_1101 ) ( TRUCK-AT ?auto_1104 ?auto_1103 ) ( not ( = ?auto_1100 ?auto_1101 ) ) ( not ( = ?auto_1100 ?auto_1107 ) ) ( not ( = ?auto_1101 ?auto_1107 ) ) ( not ( = ?auto_1102 ?auto_1106 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1104 ?auto_1103 ?auto_1105 )
      ( !LIFT ?auto_1106 ?auto_1101 ?auto_1107 ?auto_1105 )
      ( !LOAD ?auto_1106 ?auto_1101 ?auto_1104 ?auto_1105 )
      ( !DRIVE ?auto_1104 ?auto_1105 ?auto_1103 )
      ( !UNLOAD ?auto_1102 ?auto_1101 ?auto_1104 ?auto_1103 )
      ( !DROP ?auto_1102 ?auto_1101 ?auto_1100 ?auto_1103 )
      ( MAKE-1CRATE-VERIFY ?auto_1100 ?auto_1101 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1121 - SURFACE
      ?auto_1122 - SURFACE
      ?auto_1123 - SURFACE
    )
    :vars
    (
      ?auto_1124 - HOIST
      ?auto_1128 - PLACE
      ?auto_1126 - PLACE
      ?auto_1127 - HOIST
      ?auto_1129 - SURFACE
      ?auto_1131 - PLACE
      ?auto_1132 - HOIST
      ?auto_1130 - SURFACE
      ?auto_1125 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1124 ?auto_1128 ) ( IS-CRATE ?auto_1123 ) ( not ( = ?auto_1126 ?auto_1128 ) ) ( HOIST-AT ?auto_1127 ?auto_1126 ) ( AVAILABLE ?auto_1127 ) ( SURFACE-AT ?auto_1123 ?auto_1126 ) ( ON ?auto_1123 ?auto_1129 ) ( CLEAR ?auto_1123 ) ( not ( = ?auto_1122 ?auto_1123 ) ) ( not ( = ?auto_1122 ?auto_1129 ) ) ( not ( = ?auto_1123 ?auto_1129 ) ) ( not ( = ?auto_1124 ?auto_1127 ) ) ( SURFACE-AT ?auto_1121 ?auto_1128 ) ( CLEAR ?auto_1121 ) ( IS-CRATE ?auto_1122 ) ( AVAILABLE ?auto_1124 ) ( not ( = ?auto_1131 ?auto_1128 ) ) ( HOIST-AT ?auto_1132 ?auto_1131 ) ( AVAILABLE ?auto_1132 ) ( SURFACE-AT ?auto_1122 ?auto_1131 ) ( ON ?auto_1122 ?auto_1130 ) ( CLEAR ?auto_1122 ) ( TRUCK-AT ?auto_1125 ?auto_1128 ) ( not ( = ?auto_1121 ?auto_1122 ) ) ( not ( = ?auto_1121 ?auto_1130 ) ) ( not ( = ?auto_1122 ?auto_1130 ) ) ( not ( = ?auto_1124 ?auto_1132 ) ) ( not ( = ?auto_1121 ?auto_1123 ) ) ( not ( = ?auto_1121 ?auto_1129 ) ) ( not ( = ?auto_1123 ?auto_1130 ) ) ( not ( = ?auto_1126 ?auto_1131 ) ) ( not ( = ?auto_1127 ?auto_1132 ) ) ( not ( = ?auto_1129 ?auto_1130 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1121 ?auto_1122 )
      ( MAKE-1CRATE ?auto_1122 ?auto_1123 )
      ( MAKE-2CRATE-VERIFY ?auto_1121 ?auto_1122 ?auto_1123 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1147 - SURFACE
      ?auto_1148 - SURFACE
      ?auto_1149 - SURFACE
      ?auto_1150 - SURFACE
    )
    :vars
    (
      ?auto_1152 - HOIST
      ?auto_1154 - PLACE
      ?auto_1155 - PLACE
      ?auto_1153 - HOIST
      ?auto_1151 - SURFACE
      ?auto_1162 - PLACE
      ?auto_1160 - HOIST
      ?auto_1161 - SURFACE
      ?auto_1158 - PLACE
      ?auto_1159 - HOIST
      ?auto_1157 - SURFACE
      ?auto_1156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1152 ?auto_1154 ) ( IS-CRATE ?auto_1150 ) ( not ( = ?auto_1155 ?auto_1154 ) ) ( HOIST-AT ?auto_1153 ?auto_1155 ) ( AVAILABLE ?auto_1153 ) ( SURFACE-AT ?auto_1150 ?auto_1155 ) ( ON ?auto_1150 ?auto_1151 ) ( CLEAR ?auto_1150 ) ( not ( = ?auto_1149 ?auto_1150 ) ) ( not ( = ?auto_1149 ?auto_1151 ) ) ( not ( = ?auto_1150 ?auto_1151 ) ) ( not ( = ?auto_1152 ?auto_1153 ) ) ( IS-CRATE ?auto_1149 ) ( not ( = ?auto_1162 ?auto_1154 ) ) ( HOIST-AT ?auto_1160 ?auto_1162 ) ( AVAILABLE ?auto_1160 ) ( SURFACE-AT ?auto_1149 ?auto_1162 ) ( ON ?auto_1149 ?auto_1161 ) ( CLEAR ?auto_1149 ) ( not ( = ?auto_1148 ?auto_1149 ) ) ( not ( = ?auto_1148 ?auto_1161 ) ) ( not ( = ?auto_1149 ?auto_1161 ) ) ( not ( = ?auto_1152 ?auto_1160 ) ) ( SURFACE-AT ?auto_1147 ?auto_1154 ) ( CLEAR ?auto_1147 ) ( IS-CRATE ?auto_1148 ) ( AVAILABLE ?auto_1152 ) ( not ( = ?auto_1158 ?auto_1154 ) ) ( HOIST-AT ?auto_1159 ?auto_1158 ) ( AVAILABLE ?auto_1159 ) ( SURFACE-AT ?auto_1148 ?auto_1158 ) ( ON ?auto_1148 ?auto_1157 ) ( CLEAR ?auto_1148 ) ( TRUCK-AT ?auto_1156 ?auto_1154 ) ( not ( = ?auto_1147 ?auto_1148 ) ) ( not ( = ?auto_1147 ?auto_1157 ) ) ( not ( = ?auto_1148 ?auto_1157 ) ) ( not ( = ?auto_1152 ?auto_1159 ) ) ( not ( = ?auto_1147 ?auto_1149 ) ) ( not ( = ?auto_1147 ?auto_1161 ) ) ( not ( = ?auto_1149 ?auto_1157 ) ) ( not ( = ?auto_1162 ?auto_1158 ) ) ( not ( = ?auto_1160 ?auto_1159 ) ) ( not ( = ?auto_1161 ?auto_1157 ) ) ( not ( = ?auto_1147 ?auto_1150 ) ) ( not ( = ?auto_1147 ?auto_1151 ) ) ( not ( = ?auto_1148 ?auto_1150 ) ) ( not ( = ?auto_1148 ?auto_1151 ) ) ( not ( = ?auto_1150 ?auto_1161 ) ) ( not ( = ?auto_1150 ?auto_1157 ) ) ( not ( = ?auto_1155 ?auto_1162 ) ) ( not ( = ?auto_1155 ?auto_1158 ) ) ( not ( = ?auto_1153 ?auto_1160 ) ) ( not ( = ?auto_1153 ?auto_1159 ) ) ( not ( = ?auto_1151 ?auto_1161 ) ) ( not ( = ?auto_1151 ?auto_1157 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1147 ?auto_1148 ?auto_1149 )
      ( MAKE-1CRATE ?auto_1149 ?auto_1150 )
      ( MAKE-3CRATE-VERIFY ?auto_1147 ?auto_1148 ?auto_1149 ?auto_1150 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1178 - SURFACE
      ?auto_1179 - SURFACE
      ?auto_1180 - SURFACE
      ?auto_1181 - SURFACE
      ?auto_1182 - SURFACE
    )
    :vars
    (
      ?auto_1183 - HOIST
      ?auto_1184 - PLACE
      ?auto_1188 - PLACE
      ?auto_1186 - HOIST
      ?auto_1187 - SURFACE
      ?auto_1191 - PLACE
      ?auto_1190 - HOIST
      ?auto_1189 - SURFACE
      ?auto_1195 - SURFACE
      ?auto_1192 - PLACE
      ?auto_1193 - HOIST
      ?auto_1194 - SURFACE
      ?auto_1185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1183 ?auto_1184 ) ( IS-CRATE ?auto_1182 ) ( not ( = ?auto_1188 ?auto_1184 ) ) ( HOIST-AT ?auto_1186 ?auto_1188 ) ( SURFACE-AT ?auto_1182 ?auto_1188 ) ( ON ?auto_1182 ?auto_1187 ) ( CLEAR ?auto_1182 ) ( not ( = ?auto_1181 ?auto_1182 ) ) ( not ( = ?auto_1181 ?auto_1187 ) ) ( not ( = ?auto_1182 ?auto_1187 ) ) ( not ( = ?auto_1183 ?auto_1186 ) ) ( IS-CRATE ?auto_1181 ) ( not ( = ?auto_1191 ?auto_1184 ) ) ( HOIST-AT ?auto_1190 ?auto_1191 ) ( AVAILABLE ?auto_1190 ) ( SURFACE-AT ?auto_1181 ?auto_1191 ) ( ON ?auto_1181 ?auto_1189 ) ( CLEAR ?auto_1181 ) ( not ( = ?auto_1180 ?auto_1181 ) ) ( not ( = ?auto_1180 ?auto_1189 ) ) ( not ( = ?auto_1181 ?auto_1189 ) ) ( not ( = ?auto_1183 ?auto_1190 ) ) ( IS-CRATE ?auto_1180 ) ( AVAILABLE ?auto_1186 ) ( SURFACE-AT ?auto_1180 ?auto_1188 ) ( ON ?auto_1180 ?auto_1195 ) ( CLEAR ?auto_1180 ) ( not ( = ?auto_1179 ?auto_1180 ) ) ( not ( = ?auto_1179 ?auto_1195 ) ) ( not ( = ?auto_1180 ?auto_1195 ) ) ( SURFACE-AT ?auto_1178 ?auto_1184 ) ( CLEAR ?auto_1178 ) ( IS-CRATE ?auto_1179 ) ( AVAILABLE ?auto_1183 ) ( not ( = ?auto_1192 ?auto_1184 ) ) ( HOIST-AT ?auto_1193 ?auto_1192 ) ( AVAILABLE ?auto_1193 ) ( SURFACE-AT ?auto_1179 ?auto_1192 ) ( ON ?auto_1179 ?auto_1194 ) ( CLEAR ?auto_1179 ) ( TRUCK-AT ?auto_1185 ?auto_1184 ) ( not ( = ?auto_1178 ?auto_1179 ) ) ( not ( = ?auto_1178 ?auto_1194 ) ) ( not ( = ?auto_1179 ?auto_1194 ) ) ( not ( = ?auto_1183 ?auto_1193 ) ) ( not ( = ?auto_1178 ?auto_1180 ) ) ( not ( = ?auto_1178 ?auto_1195 ) ) ( not ( = ?auto_1180 ?auto_1194 ) ) ( not ( = ?auto_1188 ?auto_1192 ) ) ( not ( = ?auto_1186 ?auto_1193 ) ) ( not ( = ?auto_1195 ?auto_1194 ) ) ( not ( = ?auto_1178 ?auto_1181 ) ) ( not ( = ?auto_1178 ?auto_1189 ) ) ( not ( = ?auto_1179 ?auto_1181 ) ) ( not ( = ?auto_1179 ?auto_1189 ) ) ( not ( = ?auto_1181 ?auto_1195 ) ) ( not ( = ?auto_1181 ?auto_1194 ) ) ( not ( = ?auto_1191 ?auto_1188 ) ) ( not ( = ?auto_1191 ?auto_1192 ) ) ( not ( = ?auto_1190 ?auto_1186 ) ) ( not ( = ?auto_1190 ?auto_1193 ) ) ( not ( = ?auto_1189 ?auto_1195 ) ) ( not ( = ?auto_1189 ?auto_1194 ) ) ( not ( = ?auto_1178 ?auto_1182 ) ) ( not ( = ?auto_1178 ?auto_1187 ) ) ( not ( = ?auto_1179 ?auto_1182 ) ) ( not ( = ?auto_1179 ?auto_1187 ) ) ( not ( = ?auto_1180 ?auto_1182 ) ) ( not ( = ?auto_1180 ?auto_1187 ) ) ( not ( = ?auto_1182 ?auto_1189 ) ) ( not ( = ?auto_1182 ?auto_1195 ) ) ( not ( = ?auto_1182 ?auto_1194 ) ) ( not ( = ?auto_1187 ?auto_1189 ) ) ( not ( = ?auto_1187 ?auto_1195 ) ) ( not ( = ?auto_1187 ?auto_1194 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1178 ?auto_1179 ?auto_1180 ?auto_1181 )
      ( MAKE-1CRATE ?auto_1181 ?auto_1182 )
      ( MAKE-4CRATE-VERIFY ?auto_1178 ?auto_1179 ?auto_1180 ?auto_1181 ?auto_1182 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1212 - SURFACE
      ?auto_1213 - SURFACE
      ?auto_1214 - SURFACE
      ?auto_1215 - SURFACE
      ?auto_1216 - SURFACE
      ?auto_1217 - SURFACE
    )
    :vars
    (
      ?auto_1223 - HOIST
      ?auto_1220 - PLACE
      ?auto_1218 - PLACE
      ?auto_1221 - HOIST
      ?auto_1222 - SURFACE
      ?auto_1227 - PLACE
      ?auto_1226 - HOIST
      ?auto_1229 - SURFACE
      ?auto_1228 - PLACE
      ?auto_1224 - HOIST
      ?auto_1225 - SURFACE
      ?auto_1231 - SURFACE
      ?auto_1230 - SURFACE
      ?auto_1219 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1223 ?auto_1220 ) ( IS-CRATE ?auto_1217 ) ( not ( = ?auto_1218 ?auto_1220 ) ) ( HOIST-AT ?auto_1221 ?auto_1218 ) ( SURFACE-AT ?auto_1217 ?auto_1218 ) ( ON ?auto_1217 ?auto_1222 ) ( CLEAR ?auto_1217 ) ( not ( = ?auto_1216 ?auto_1217 ) ) ( not ( = ?auto_1216 ?auto_1222 ) ) ( not ( = ?auto_1217 ?auto_1222 ) ) ( not ( = ?auto_1223 ?auto_1221 ) ) ( IS-CRATE ?auto_1216 ) ( not ( = ?auto_1227 ?auto_1220 ) ) ( HOIST-AT ?auto_1226 ?auto_1227 ) ( SURFACE-AT ?auto_1216 ?auto_1227 ) ( ON ?auto_1216 ?auto_1229 ) ( CLEAR ?auto_1216 ) ( not ( = ?auto_1215 ?auto_1216 ) ) ( not ( = ?auto_1215 ?auto_1229 ) ) ( not ( = ?auto_1216 ?auto_1229 ) ) ( not ( = ?auto_1223 ?auto_1226 ) ) ( IS-CRATE ?auto_1215 ) ( not ( = ?auto_1228 ?auto_1220 ) ) ( HOIST-AT ?auto_1224 ?auto_1228 ) ( AVAILABLE ?auto_1224 ) ( SURFACE-AT ?auto_1215 ?auto_1228 ) ( ON ?auto_1215 ?auto_1225 ) ( CLEAR ?auto_1215 ) ( not ( = ?auto_1214 ?auto_1215 ) ) ( not ( = ?auto_1214 ?auto_1225 ) ) ( not ( = ?auto_1215 ?auto_1225 ) ) ( not ( = ?auto_1223 ?auto_1224 ) ) ( IS-CRATE ?auto_1214 ) ( AVAILABLE ?auto_1226 ) ( SURFACE-AT ?auto_1214 ?auto_1227 ) ( ON ?auto_1214 ?auto_1231 ) ( CLEAR ?auto_1214 ) ( not ( = ?auto_1213 ?auto_1214 ) ) ( not ( = ?auto_1213 ?auto_1231 ) ) ( not ( = ?auto_1214 ?auto_1231 ) ) ( SURFACE-AT ?auto_1212 ?auto_1220 ) ( CLEAR ?auto_1212 ) ( IS-CRATE ?auto_1213 ) ( AVAILABLE ?auto_1223 ) ( AVAILABLE ?auto_1221 ) ( SURFACE-AT ?auto_1213 ?auto_1218 ) ( ON ?auto_1213 ?auto_1230 ) ( CLEAR ?auto_1213 ) ( TRUCK-AT ?auto_1219 ?auto_1220 ) ( not ( = ?auto_1212 ?auto_1213 ) ) ( not ( = ?auto_1212 ?auto_1230 ) ) ( not ( = ?auto_1213 ?auto_1230 ) ) ( not ( = ?auto_1212 ?auto_1214 ) ) ( not ( = ?auto_1212 ?auto_1231 ) ) ( not ( = ?auto_1214 ?auto_1230 ) ) ( not ( = ?auto_1227 ?auto_1218 ) ) ( not ( = ?auto_1226 ?auto_1221 ) ) ( not ( = ?auto_1231 ?auto_1230 ) ) ( not ( = ?auto_1212 ?auto_1215 ) ) ( not ( = ?auto_1212 ?auto_1225 ) ) ( not ( = ?auto_1213 ?auto_1215 ) ) ( not ( = ?auto_1213 ?auto_1225 ) ) ( not ( = ?auto_1215 ?auto_1231 ) ) ( not ( = ?auto_1215 ?auto_1230 ) ) ( not ( = ?auto_1228 ?auto_1227 ) ) ( not ( = ?auto_1228 ?auto_1218 ) ) ( not ( = ?auto_1224 ?auto_1226 ) ) ( not ( = ?auto_1224 ?auto_1221 ) ) ( not ( = ?auto_1225 ?auto_1231 ) ) ( not ( = ?auto_1225 ?auto_1230 ) ) ( not ( = ?auto_1212 ?auto_1216 ) ) ( not ( = ?auto_1212 ?auto_1229 ) ) ( not ( = ?auto_1213 ?auto_1216 ) ) ( not ( = ?auto_1213 ?auto_1229 ) ) ( not ( = ?auto_1214 ?auto_1216 ) ) ( not ( = ?auto_1214 ?auto_1229 ) ) ( not ( = ?auto_1216 ?auto_1225 ) ) ( not ( = ?auto_1216 ?auto_1231 ) ) ( not ( = ?auto_1216 ?auto_1230 ) ) ( not ( = ?auto_1229 ?auto_1225 ) ) ( not ( = ?auto_1229 ?auto_1231 ) ) ( not ( = ?auto_1229 ?auto_1230 ) ) ( not ( = ?auto_1212 ?auto_1217 ) ) ( not ( = ?auto_1212 ?auto_1222 ) ) ( not ( = ?auto_1213 ?auto_1217 ) ) ( not ( = ?auto_1213 ?auto_1222 ) ) ( not ( = ?auto_1214 ?auto_1217 ) ) ( not ( = ?auto_1214 ?auto_1222 ) ) ( not ( = ?auto_1215 ?auto_1217 ) ) ( not ( = ?auto_1215 ?auto_1222 ) ) ( not ( = ?auto_1217 ?auto_1229 ) ) ( not ( = ?auto_1217 ?auto_1225 ) ) ( not ( = ?auto_1217 ?auto_1231 ) ) ( not ( = ?auto_1217 ?auto_1230 ) ) ( not ( = ?auto_1222 ?auto_1229 ) ) ( not ( = ?auto_1222 ?auto_1225 ) ) ( not ( = ?auto_1222 ?auto_1231 ) ) ( not ( = ?auto_1222 ?auto_1230 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1212 ?auto_1213 ?auto_1214 ?auto_1215 ?auto_1216 )
      ( MAKE-1CRATE ?auto_1216 ?auto_1217 )
      ( MAKE-5CRATE-VERIFY ?auto_1212 ?auto_1213 ?auto_1214 ?auto_1215 ?auto_1216 ?auto_1217 ) )
  )

)

