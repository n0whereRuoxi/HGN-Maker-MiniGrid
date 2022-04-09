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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1129 - SURFACE
      ?auto_1130 - SURFACE
      ?auto_1131 - SURFACE
    )
    :vars
    (
      ?auto_1135 - HOIST
      ?auto_1132 - PLACE
      ?auto_1133 - PLACE
      ?auto_1137 - HOIST
      ?auto_1136 - SURFACE
      ?auto_1139 - PLACE
      ?auto_1138 - HOIST
      ?auto_1140 - SURFACE
      ?auto_1134 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1135 ?auto_1132 ) ( IS-CRATE ?auto_1131 ) ( not ( = ?auto_1133 ?auto_1132 ) ) ( HOIST-AT ?auto_1137 ?auto_1133 ) ( AVAILABLE ?auto_1137 ) ( SURFACE-AT ?auto_1131 ?auto_1133 ) ( ON ?auto_1131 ?auto_1136 ) ( CLEAR ?auto_1131 ) ( not ( = ?auto_1130 ?auto_1131 ) ) ( not ( = ?auto_1130 ?auto_1136 ) ) ( not ( = ?auto_1131 ?auto_1136 ) ) ( not ( = ?auto_1135 ?auto_1137 ) ) ( SURFACE-AT ?auto_1129 ?auto_1132 ) ( CLEAR ?auto_1129 ) ( IS-CRATE ?auto_1130 ) ( AVAILABLE ?auto_1135 ) ( not ( = ?auto_1139 ?auto_1132 ) ) ( HOIST-AT ?auto_1138 ?auto_1139 ) ( AVAILABLE ?auto_1138 ) ( SURFACE-AT ?auto_1130 ?auto_1139 ) ( ON ?auto_1130 ?auto_1140 ) ( CLEAR ?auto_1130 ) ( TRUCK-AT ?auto_1134 ?auto_1132 ) ( not ( = ?auto_1129 ?auto_1130 ) ) ( not ( = ?auto_1129 ?auto_1140 ) ) ( not ( = ?auto_1130 ?auto_1140 ) ) ( not ( = ?auto_1135 ?auto_1138 ) ) ( not ( = ?auto_1129 ?auto_1131 ) ) ( not ( = ?auto_1129 ?auto_1136 ) ) ( not ( = ?auto_1131 ?auto_1140 ) ) ( not ( = ?auto_1133 ?auto_1139 ) ) ( not ( = ?auto_1137 ?auto_1138 ) ) ( not ( = ?auto_1136 ?auto_1140 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1129 ?auto_1130 )
      ( MAKE-1CRATE ?auto_1130 ?auto_1131 )
      ( MAKE-2CRATE-VERIFY ?auto_1129 ?auto_1130 ?auto_1131 ) )
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
      ?auto_1163 - HOIST
      ?auto_1162 - PLACE
      ?auto_1159 - PLACE
      ?auto_1160 - HOIST
      ?auto_1164 - SURFACE
      ?auto_1165 - PLACE
      ?auto_1168 - HOIST
      ?auto_1166 - SURFACE
      ?auto_1167 - SURFACE
      ?auto_1161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1163 ?auto_1162 ) ( IS-CRATE ?auto_1158 ) ( not ( = ?auto_1159 ?auto_1162 ) ) ( HOIST-AT ?auto_1160 ?auto_1159 ) ( SURFACE-AT ?auto_1158 ?auto_1159 ) ( ON ?auto_1158 ?auto_1164 ) ( CLEAR ?auto_1158 ) ( not ( = ?auto_1157 ?auto_1158 ) ) ( not ( = ?auto_1157 ?auto_1164 ) ) ( not ( = ?auto_1158 ?auto_1164 ) ) ( not ( = ?auto_1163 ?auto_1160 ) ) ( IS-CRATE ?auto_1157 ) ( not ( = ?auto_1165 ?auto_1162 ) ) ( HOIST-AT ?auto_1168 ?auto_1165 ) ( AVAILABLE ?auto_1168 ) ( SURFACE-AT ?auto_1157 ?auto_1165 ) ( ON ?auto_1157 ?auto_1166 ) ( CLEAR ?auto_1157 ) ( not ( = ?auto_1156 ?auto_1157 ) ) ( not ( = ?auto_1156 ?auto_1166 ) ) ( not ( = ?auto_1157 ?auto_1166 ) ) ( not ( = ?auto_1163 ?auto_1168 ) ) ( SURFACE-AT ?auto_1155 ?auto_1162 ) ( CLEAR ?auto_1155 ) ( IS-CRATE ?auto_1156 ) ( AVAILABLE ?auto_1163 ) ( AVAILABLE ?auto_1160 ) ( SURFACE-AT ?auto_1156 ?auto_1159 ) ( ON ?auto_1156 ?auto_1167 ) ( CLEAR ?auto_1156 ) ( TRUCK-AT ?auto_1161 ?auto_1162 ) ( not ( = ?auto_1155 ?auto_1156 ) ) ( not ( = ?auto_1155 ?auto_1167 ) ) ( not ( = ?auto_1156 ?auto_1167 ) ) ( not ( = ?auto_1155 ?auto_1157 ) ) ( not ( = ?auto_1155 ?auto_1166 ) ) ( not ( = ?auto_1157 ?auto_1167 ) ) ( not ( = ?auto_1165 ?auto_1159 ) ) ( not ( = ?auto_1168 ?auto_1160 ) ) ( not ( = ?auto_1166 ?auto_1167 ) ) ( not ( = ?auto_1155 ?auto_1158 ) ) ( not ( = ?auto_1155 ?auto_1164 ) ) ( not ( = ?auto_1156 ?auto_1158 ) ) ( not ( = ?auto_1156 ?auto_1164 ) ) ( not ( = ?auto_1158 ?auto_1166 ) ) ( not ( = ?auto_1158 ?auto_1167 ) ) ( not ( = ?auto_1164 ?auto_1166 ) ) ( not ( = ?auto_1164 ?auto_1167 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1155 ?auto_1156 ?auto_1157 )
      ( MAKE-1CRATE ?auto_1157 ?auto_1158 )
      ( MAKE-3CRATE-VERIFY ?auto_1155 ?auto_1156 ?auto_1157 ?auto_1158 ) )
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
      ?auto_1191 - HOIST
      ?auto_1192 - PLACE
      ?auto_1193 - PLACE
      ?auto_1194 - HOIST
      ?auto_1189 - SURFACE
      ?auto_1196 - PLACE
      ?auto_1201 - HOIST
      ?auto_1195 - SURFACE
      ?auto_1199 - PLACE
      ?auto_1200 - HOIST
      ?auto_1198 - SURFACE
      ?auto_1197 - SURFACE
      ?auto_1190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1191 ?auto_1192 ) ( IS-CRATE ?auto_1188 ) ( not ( = ?auto_1193 ?auto_1192 ) ) ( HOIST-AT ?auto_1194 ?auto_1193 ) ( AVAILABLE ?auto_1194 ) ( SURFACE-AT ?auto_1188 ?auto_1193 ) ( ON ?auto_1188 ?auto_1189 ) ( CLEAR ?auto_1188 ) ( not ( = ?auto_1187 ?auto_1188 ) ) ( not ( = ?auto_1187 ?auto_1189 ) ) ( not ( = ?auto_1188 ?auto_1189 ) ) ( not ( = ?auto_1191 ?auto_1194 ) ) ( IS-CRATE ?auto_1187 ) ( not ( = ?auto_1196 ?auto_1192 ) ) ( HOIST-AT ?auto_1201 ?auto_1196 ) ( SURFACE-AT ?auto_1187 ?auto_1196 ) ( ON ?auto_1187 ?auto_1195 ) ( CLEAR ?auto_1187 ) ( not ( = ?auto_1186 ?auto_1187 ) ) ( not ( = ?auto_1186 ?auto_1195 ) ) ( not ( = ?auto_1187 ?auto_1195 ) ) ( not ( = ?auto_1191 ?auto_1201 ) ) ( IS-CRATE ?auto_1186 ) ( not ( = ?auto_1199 ?auto_1192 ) ) ( HOIST-AT ?auto_1200 ?auto_1199 ) ( AVAILABLE ?auto_1200 ) ( SURFACE-AT ?auto_1186 ?auto_1199 ) ( ON ?auto_1186 ?auto_1198 ) ( CLEAR ?auto_1186 ) ( not ( = ?auto_1185 ?auto_1186 ) ) ( not ( = ?auto_1185 ?auto_1198 ) ) ( not ( = ?auto_1186 ?auto_1198 ) ) ( not ( = ?auto_1191 ?auto_1200 ) ) ( SURFACE-AT ?auto_1184 ?auto_1192 ) ( CLEAR ?auto_1184 ) ( IS-CRATE ?auto_1185 ) ( AVAILABLE ?auto_1191 ) ( AVAILABLE ?auto_1201 ) ( SURFACE-AT ?auto_1185 ?auto_1196 ) ( ON ?auto_1185 ?auto_1197 ) ( CLEAR ?auto_1185 ) ( TRUCK-AT ?auto_1190 ?auto_1192 ) ( not ( = ?auto_1184 ?auto_1185 ) ) ( not ( = ?auto_1184 ?auto_1197 ) ) ( not ( = ?auto_1185 ?auto_1197 ) ) ( not ( = ?auto_1184 ?auto_1186 ) ) ( not ( = ?auto_1184 ?auto_1198 ) ) ( not ( = ?auto_1186 ?auto_1197 ) ) ( not ( = ?auto_1199 ?auto_1196 ) ) ( not ( = ?auto_1200 ?auto_1201 ) ) ( not ( = ?auto_1198 ?auto_1197 ) ) ( not ( = ?auto_1184 ?auto_1187 ) ) ( not ( = ?auto_1184 ?auto_1195 ) ) ( not ( = ?auto_1185 ?auto_1187 ) ) ( not ( = ?auto_1185 ?auto_1195 ) ) ( not ( = ?auto_1187 ?auto_1198 ) ) ( not ( = ?auto_1187 ?auto_1197 ) ) ( not ( = ?auto_1195 ?auto_1198 ) ) ( not ( = ?auto_1195 ?auto_1197 ) ) ( not ( = ?auto_1184 ?auto_1188 ) ) ( not ( = ?auto_1184 ?auto_1189 ) ) ( not ( = ?auto_1185 ?auto_1188 ) ) ( not ( = ?auto_1185 ?auto_1189 ) ) ( not ( = ?auto_1186 ?auto_1188 ) ) ( not ( = ?auto_1186 ?auto_1189 ) ) ( not ( = ?auto_1188 ?auto_1195 ) ) ( not ( = ?auto_1188 ?auto_1198 ) ) ( not ( = ?auto_1188 ?auto_1197 ) ) ( not ( = ?auto_1193 ?auto_1196 ) ) ( not ( = ?auto_1193 ?auto_1199 ) ) ( not ( = ?auto_1194 ?auto_1201 ) ) ( not ( = ?auto_1194 ?auto_1200 ) ) ( not ( = ?auto_1189 ?auto_1195 ) ) ( not ( = ?auto_1189 ?auto_1198 ) ) ( not ( = ?auto_1189 ?auto_1197 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1184 ?auto_1185 ?auto_1186 ?auto_1187 )
      ( MAKE-1CRATE ?auto_1187 ?auto_1188 )
      ( MAKE-4CRATE-VERIFY ?auto_1184 ?auto_1185 ?auto_1186 ?auto_1187 ?auto_1188 ) )
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
      ?auto_1226 - HOIST
      ?auto_1225 - PLACE
      ?auto_1224 - PLACE
      ?auto_1228 - HOIST
      ?auto_1227 - SURFACE
      ?auto_1236 - PLACE
      ?auto_1237 - HOIST
      ?auto_1232 - SURFACE
      ?auto_1231 - SURFACE
      ?auto_1234 - PLACE
      ?auto_1235 - HOIST
      ?auto_1233 - SURFACE
      ?auto_1230 - SURFACE
      ?auto_1229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1226 ?auto_1225 ) ( IS-CRATE ?auto_1223 ) ( not ( = ?auto_1224 ?auto_1225 ) ) ( HOIST-AT ?auto_1228 ?auto_1224 ) ( SURFACE-AT ?auto_1223 ?auto_1224 ) ( ON ?auto_1223 ?auto_1227 ) ( CLEAR ?auto_1223 ) ( not ( = ?auto_1222 ?auto_1223 ) ) ( not ( = ?auto_1222 ?auto_1227 ) ) ( not ( = ?auto_1223 ?auto_1227 ) ) ( not ( = ?auto_1226 ?auto_1228 ) ) ( IS-CRATE ?auto_1222 ) ( not ( = ?auto_1236 ?auto_1225 ) ) ( HOIST-AT ?auto_1237 ?auto_1236 ) ( AVAILABLE ?auto_1237 ) ( SURFACE-AT ?auto_1222 ?auto_1236 ) ( ON ?auto_1222 ?auto_1232 ) ( CLEAR ?auto_1222 ) ( not ( = ?auto_1221 ?auto_1222 ) ) ( not ( = ?auto_1221 ?auto_1232 ) ) ( not ( = ?auto_1222 ?auto_1232 ) ) ( not ( = ?auto_1226 ?auto_1237 ) ) ( IS-CRATE ?auto_1221 ) ( SURFACE-AT ?auto_1221 ?auto_1224 ) ( ON ?auto_1221 ?auto_1231 ) ( CLEAR ?auto_1221 ) ( not ( = ?auto_1220 ?auto_1221 ) ) ( not ( = ?auto_1220 ?auto_1231 ) ) ( not ( = ?auto_1221 ?auto_1231 ) ) ( IS-CRATE ?auto_1220 ) ( not ( = ?auto_1234 ?auto_1225 ) ) ( HOIST-AT ?auto_1235 ?auto_1234 ) ( AVAILABLE ?auto_1235 ) ( SURFACE-AT ?auto_1220 ?auto_1234 ) ( ON ?auto_1220 ?auto_1233 ) ( CLEAR ?auto_1220 ) ( not ( = ?auto_1219 ?auto_1220 ) ) ( not ( = ?auto_1219 ?auto_1233 ) ) ( not ( = ?auto_1220 ?auto_1233 ) ) ( not ( = ?auto_1226 ?auto_1235 ) ) ( SURFACE-AT ?auto_1218 ?auto_1225 ) ( CLEAR ?auto_1218 ) ( IS-CRATE ?auto_1219 ) ( AVAILABLE ?auto_1226 ) ( AVAILABLE ?auto_1228 ) ( SURFACE-AT ?auto_1219 ?auto_1224 ) ( ON ?auto_1219 ?auto_1230 ) ( CLEAR ?auto_1219 ) ( TRUCK-AT ?auto_1229 ?auto_1225 ) ( not ( = ?auto_1218 ?auto_1219 ) ) ( not ( = ?auto_1218 ?auto_1230 ) ) ( not ( = ?auto_1219 ?auto_1230 ) ) ( not ( = ?auto_1218 ?auto_1220 ) ) ( not ( = ?auto_1218 ?auto_1233 ) ) ( not ( = ?auto_1220 ?auto_1230 ) ) ( not ( = ?auto_1234 ?auto_1224 ) ) ( not ( = ?auto_1235 ?auto_1228 ) ) ( not ( = ?auto_1233 ?auto_1230 ) ) ( not ( = ?auto_1218 ?auto_1221 ) ) ( not ( = ?auto_1218 ?auto_1231 ) ) ( not ( = ?auto_1219 ?auto_1221 ) ) ( not ( = ?auto_1219 ?auto_1231 ) ) ( not ( = ?auto_1221 ?auto_1233 ) ) ( not ( = ?auto_1221 ?auto_1230 ) ) ( not ( = ?auto_1231 ?auto_1233 ) ) ( not ( = ?auto_1231 ?auto_1230 ) ) ( not ( = ?auto_1218 ?auto_1222 ) ) ( not ( = ?auto_1218 ?auto_1232 ) ) ( not ( = ?auto_1219 ?auto_1222 ) ) ( not ( = ?auto_1219 ?auto_1232 ) ) ( not ( = ?auto_1220 ?auto_1222 ) ) ( not ( = ?auto_1220 ?auto_1232 ) ) ( not ( = ?auto_1222 ?auto_1231 ) ) ( not ( = ?auto_1222 ?auto_1233 ) ) ( not ( = ?auto_1222 ?auto_1230 ) ) ( not ( = ?auto_1236 ?auto_1224 ) ) ( not ( = ?auto_1236 ?auto_1234 ) ) ( not ( = ?auto_1237 ?auto_1228 ) ) ( not ( = ?auto_1237 ?auto_1235 ) ) ( not ( = ?auto_1232 ?auto_1231 ) ) ( not ( = ?auto_1232 ?auto_1233 ) ) ( not ( = ?auto_1232 ?auto_1230 ) ) ( not ( = ?auto_1218 ?auto_1223 ) ) ( not ( = ?auto_1218 ?auto_1227 ) ) ( not ( = ?auto_1219 ?auto_1223 ) ) ( not ( = ?auto_1219 ?auto_1227 ) ) ( not ( = ?auto_1220 ?auto_1223 ) ) ( not ( = ?auto_1220 ?auto_1227 ) ) ( not ( = ?auto_1221 ?auto_1223 ) ) ( not ( = ?auto_1221 ?auto_1227 ) ) ( not ( = ?auto_1223 ?auto_1232 ) ) ( not ( = ?auto_1223 ?auto_1231 ) ) ( not ( = ?auto_1223 ?auto_1233 ) ) ( not ( = ?auto_1223 ?auto_1230 ) ) ( not ( = ?auto_1227 ?auto_1232 ) ) ( not ( = ?auto_1227 ?auto_1231 ) ) ( not ( = ?auto_1227 ?auto_1233 ) ) ( not ( = ?auto_1227 ?auto_1230 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1218 ?auto_1219 ?auto_1220 ?auto_1221 ?auto_1222 )
      ( MAKE-1CRATE ?auto_1222 ?auto_1223 )
      ( MAKE-5CRATE-VERIFY ?auto_1218 ?auto_1219 ?auto_1220 ?auto_1221 ?auto_1222 ?auto_1223 ) )
  )

)

