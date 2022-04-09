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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1110 - SURFACE
      ?auto_1111 - SURFACE
    )
    :vars
    (
      ?auto_1112 - HOIST
      ?auto_1113 - PLACE
      ?auto_1115 - PLACE
      ?auto_1116 - HOIST
      ?auto_1117 - SURFACE
      ?auto_1114 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1112 ?auto_1113 ) ( SURFACE-AT ?auto_1110 ?auto_1113 ) ( CLEAR ?auto_1110 ) ( IS-CRATE ?auto_1111 ) ( AVAILABLE ?auto_1112 ) ( not ( = ?auto_1115 ?auto_1113 ) ) ( HOIST-AT ?auto_1116 ?auto_1115 ) ( AVAILABLE ?auto_1116 ) ( SURFACE-AT ?auto_1111 ?auto_1115 ) ( ON ?auto_1111 ?auto_1117 ) ( CLEAR ?auto_1111 ) ( TRUCK-AT ?auto_1114 ?auto_1113 ) ( not ( = ?auto_1110 ?auto_1111 ) ) ( not ( = ?auto_1110 ?auto_1117 ) ) ( not ( = ?auto_1111 ?auto_1117 ) ) ( not ( = ?auto_1112 ?auto_1116 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1114 ?auto_1113 ?auto_1115 )
      ( !LIFT ?auto_1116 ?auto_1111 ?auto_1117 ?auto_1115 )
      ( !LOAD ?auto_1116 ?auto_1111 ?auto_1114 ?auto_1115 )
      ( !DRIVE ?auto_1114 ?auto_1115 ?auto_1113 )
      ( !UNLOAD ?auto_1112 ?auto_1111 ?auto_1114 ?auto_1113 )
      ( !DROP ?auto_1112 ?auto_1111 ?auto_1110 ?auto_1113 )
      ( MAKE-1CRATE-VERIFY ?auto_1110 ?auto_1111 ) )
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
      ?auto_1129 - HOIST
      ?auto_1125 - PLACE
      ?auto_1124 - PLACE
      ?auto_1127 - HOIST
      ?auto_1128 - SURFACE
      ?auto_1131 - PLACE
      ?auto_1132 - HOIST
      ?auto_1130 - SURFACE
      ?auto_1126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1129 ?auto_1125 ) ( IS-CRATE ?auto_1123 ) ( not ( = ?auto_1124 ?auto_1125 ) ) ( HOIST-AT ?auto_1127 ?auto_1124 ) ( AVAILABLE ?auto_1127 ) ( SURFACE-AT ?auto_1123 ?auto_1124 ) ( ON ?auto_1123 ?auto_1128 ) ( CLEAR ?auto_1123 ) ( not ( = ?auto_1122 ?auto_1123 ) ) ( not ( = ?auto_1122 ?auto_1128 ) ) ( not ( = ?auto_1123 ?auto_1128 ) ) ( not ( = ?auto_1129 ?auto_1127 ) ) ( SURFACE-AT ?auto_1121 ?auto_1125 ) ( CLEAR ?auto_1121 ) ( IS-CRATE ?auto_1122 ) ( AVAILABLE ?auto_1129 ) ( not ( = ?auto_1131 ?auto_1125 ) ) ( HOIST-AT ?auto_1132 ?auto_1131 ) ( AVAILABLE ?auto_1132 ) ( SURFACE-AT ?auto_1122 ?auto_1131 ) ( ON ?auto_1122 ?auto_1130 ) ( CLEAR ?auto_1122 ) ( TRUCK-AT ?auto_1126 ?auto_1125 ) ( not ( = ?auto_1121 ?auto_1122 ) ) ( not ( = ?auto_1121 ?auto_1130 ) ) ( not ( = ?auto_1122 ?auto_1130 ) ) ( not ( = ?auto_1129 ?auto_1132 ) ) ( not ( = ?auto_1121 ?auto_1123 ) ) ( not ( = ?auto_1121 ?auto_1128 ) ) ( not ( = ?auto_1123 ?auto_1130 ) ) ( not ( = ?auto_1124 ?auto_1131 ) ) ( not ( = ?auto_1127 ?auto_1132 ) ) ( not ( = ?auto_1128 ?auto_1130 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1121 ?auto_1122 )
      ( MAKE-1CRATE ?auto_1122 ?auto_1123 )
      ( MAKE-2CRATE-VERIFY ?auto_1121 ?auto_1122 ?auto_1123 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1135 - SURFACE
      ?auto_1136 - SURFACE
    )
    :vars
    (
      ?auto_1137 - HOIST
      ?auto_1138 - PLACE
      ?auto_1140 - PLACE
      ?auto_1141 - HOIST
      ?auto_1142 - SURFACE
      ?auto_1139 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1137 ?auto_1138 ) ( SURFACE-AT ?auto_1135 ?auto_1138 ) ( CLEAR ?auto_1135 ) ( IS-CRATE ?auto_1136 ) ( AVAILABLE ?auto_1137 ) ( not ( = ?auto_1140 ?auto_1138 ) ) ( HOIST-AT ?auto_1141 ?auto_1140 ) ( AVAILABLE ?auto_1141 ) ( SURFACE-AT ?auto_1136 ?auto_1140 ) ( ON ?auto_1136 ?auto_1142 ) ( CLEAR ?auto_1136 ) ( TRUCK-AT ?auto_1139 ?auto_1138 ) ( not ( = ?auto_1135 ?auto_1136 ) ) ( not ( = ?auto_1135 ?auto_1142 ) ) ( not ( = ?auto_1136 ?auto_1142 ) ) ( not ( = ?auto_1137 ?auto_1141 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1139 ?auto_1138 ?auto_1140 )
      ( !LIFT ?auto_1141 ?auto_1136 ?auto_1142 ?auto_1140 )
      ( !LOAD ?auto_1141 ?auto_1136 ?auto_1139 ?auto_1140 )
      ( !DRIVE ?auto_1139 ?auto_1140 ?auto_1138 )
      ( !UNLOAD ?auto_1137 ?auto_1136 ?auto_1139 ?auto_1138 )
      ( !DROP ?auto_1137 ?auto_1136 ?auto_1135 ?auto_1138 )
      ( MAKE-1CRATE-VERIFY ?auto_1135 ?auto_1136 ) )
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
      ?auto_1155 - PLACE
      ?auto_1154 - PLACE
      ?auto_1151 - HOIST
      ?auto_1153 - SURFACE
      ?auto_1159 - PLACE
      ?auto_1157 - HOIST
      ?auto_1158 - SURFACE
      ?auto_1162 - PLACE
      ?auto_1161 - HOIST
      ?auto_1160 - SURFACE
      ?auto_1156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1152 ?auto_1155 ) ( IS-CRATE ?auto_1150 ) ( not ( = ?auto_1154 ?auto_1155 ) ) ( HOIST-AT ?auto_1151 ?auto_1154 ) ( AVAILABLE ?auto_1151 ) ( SURFACE-AT ?auto_1150 ?auto_1154 ) ( ON ?auto_1150 ?auto_1153 ) ( CLEAR ?auto_1150 ) ( not ( = ?auto_1149 ?auto_1150 ) ) ( not ( = ?auto_1149 ?auto_1153 ) ) ( not ( = ?auto_1150 ?auto_1153 ) ) ( not ( = ?auto_1152 ?auto_1151 ) ) ( IS-CRATE ?auto_1149 ) ( not ( = ?auto_1159 ?auto_1155 ) ) ( HOIST-AT ?auto_1157 ?auto_1159 ) ( AVAILABLE ?auto_1157 ) ( SURFACE-AT ?auto_1149 ?auto_1159 ) ( ON ?auto_1149 ?auto_1158 ) ( CLEAR ?auto_1149 ) ( not ( = ?auto_1148 ?auto_1149 ) ) ( not ( = ?auto_1148 ?auto_1158 ) ) ( not ( = ?auto_1149 ?auto_1158 ) ) ( not ( = ?auto_1152 ?auto_1157 ) ) ( SURFACE-AT ?auto_1147 ?auto_1155 ) ( CLEAR ?auto_1147 ) ( IS-CRATE ?auto_1148 ) ( AVAILABLE ?auto_1152 ) ( not ( = ?auto_1162 ?auto_1155 ) ) ( HOIST-AT ?auto_1161 ?auto_1162 ) ( AVAILABLE ?auto_1161 ) ( SURFACE-AT ?auto_1148 ?auto_1162 ) ( ON ?auto_1148 ?auto_1160 ) ( CLEAR ?auto_1148 ) ( TRUCK-AT ?auto_1156 ?auto_1155 ) ( not ( = ?auto_1147 ?auto_1148 ) ) ( not ( = ?auto_1147 ?auto_1160 ) ) ( not ( = ?auto_1148 ?auto_1160 ) ) ( not ( = ?auto_1152 ?auto_1161 ) ) ( not ( = ?auto_1147 ?auto_1149 ) ) ( not ( = ?auto_1147 ?auto_1158 ) ) ( not ( = ?auto_1149 ?auto_1160 ) ) ( not ( = ?auto_1159 ?auto_1162 ) ) ( not ( = ?auto_1157 ?auto_1161 ) ) ( not ( = ?auto_1158 ?auto_1160 ) ) ( not ( = ?auto_1147 ?auto_1150 ) ) ( not ( = ?auto_1147 ?auto_1153 ) ) ( not ( = ?auto_1148 ?auto_1150 ) ) ( not ( = ?auto_1148 ?auto_1153 ) ) ( not ( = ?auto_1150 ?auto_1158 ) ) ( not ( = ?auto_1150 ?auto_1160 ) ) ( not ( = ?auto_1154 ?auto_1159 ) ) ( not ( = ?auto_1154 ?auto_1162 ) ) ( not ( = ?auto_1151 ?auto_1157 ) ) ( not ( = ?auto_1151 ?auto_1161 ) ) ( not ( = ?auto_1153 ?auto_1158 ) ) ( not ( = ?auto_1153 ?auto_1160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1147 ?auto_1148 ?auto_1149 )
      ( MAKE-1CRATE ?auto_1149 ?auto_1150 )
      ( MAKE-3CRATE-VERIFY ?auto_1147 ?auto_1148 ?auto_1149 ?auto_1150 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1165 - SURFACE
      ?auto_1166 - SURFACE
    )
    :vars
    (
      ?auto_1167 - HOIST
      ?auto_1168 - PLACE
      ?auto_1170 - PLACE
      ?auto_1171 - HOIST
      ?auto_1172 - SURFACE
      ?auto_1169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1167 ?auto_1168 ) ( SURFACE-AT ?auto_1165 ?auto_1168 ) ( CLEAR ?auto_1165 ) ( IS-CRATE ?auto_1166 ) ( AVAILABLE ?auto_1167 ) ( not ( = ?auto_1170 ?auto_1168 ) ) ( HOIST-AT ?auto_1171 ?auto_1170 ) ( AVAILABLE ?auto_1171 ) ( SURFACE-AT ?auto_1166 ?auto_1170 ) ( ON ?auto_1166 ?auto_1172 ) ( CLEAR ?auto_1166 ) ( TRUCK-AT ?auto_1169 ?auto_1168 ) ( not ( = ?auto_1165 ?auto_1166 ) ) ( not ( = ?auto_1165 ?auto_1172 ) ) ( not ( = ?auto_1166 ?auto_1172 ) ) ( not ( = ?auto_1167 ?auto_1171 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1169 ?auto_1168 ?auto_1170 )
      ( !LIFT ?auto_1171 ?auto_1166 ?auto_1172 ?auto_1170 )
      ( !LOAD ?auto_1171 ?auto_1166 ?auto_1169 ?auto_1170 )
      ( !DRIVE ?auto_1169 ?auto_1170 ?auto_1168 )
      ( !UNLOAD ?auto_1167 ?auto_1166 ?auto_1169 ?auto_1168 )
      ( !DROP ?auto_1167 ?auto_1166 ?auto_1165 ?auto_1168 )
      ( MAKE-1CRATE-VERIFY ?auto_1165 ?auto_1166 ) )
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
      ?auto_1187 - HOIST
      ?auto_1188 - PLACE
      ?auto_1186 - PLACE
      ?auto_1185 - HOIST
      ?auto_1184 - SURFACE
      ?auto_1194 - PLACE
      ?auto_1192 - HOIST
      ?auto_1193 - SURFACE
      ?auto_1190 - SURFACE
      ?auto_1195 - PLACE
      ?auto_1189 - HOIST
      ?auto_1191 - SURFACE
      ?auto_1183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1187 ?auto_1188 ) ( IS-CRATE ?auto_1182 ) ( not ( = ?auto_1186 ?auto_1188 ) ) ( HOIST-AT ?auto_1185 ?auto_1186 ) ( SURFACE-AT ?auto_1182 ?auto_1186 ) ( ON ?auto_1182 ?auto_1184 ) ( CLEAR ?auto_1182 ) ( not ( = ?auto_1181 ?auto_1182 ) ) ( not ( = ?auto_1181 ?auto_1184 ) ) ( not ( = ?auto_1182 ?auto_1184 ) ) ( not ( = ?auto_1187 ?auto_1185 ) ) ( IS-CRATE ?auto_1181 ) ( not ( = ?auto_1194 ?auto_1188 ) ) ( HOIST-AT ?auto_1192 ?auto_1194 ) ( AVAILABLE ?auto_1192 ) ( SURFACE-AT ?auto_1181 ?auto_1194 ) ( ON ?auto_1181 ?auto_1193 ) ( CLEAR ?auto_1181 ) ( not ( = ?auto_1180 ?auto_1181 ) ) ( not ( = ?auto_1180 ?auto_1193 ) ) ( not ( = ?auto_1181 ?auto_1193 ) ) ( not ( = ?auto_1187 ?auto_1192 ) ) ( IS-CRATE ?auto_1180 ) ( AVAILABLE ?auto_1185 ) ( SURFACE-AT ?auto_1180 ?auto_1186 ) ( ON ?auto_1180 ?auto_1190 ) ( CLEAR ?auto_1180 ) ( not ( = ?auto_1179 ?auto_1180 ) ) ( not ( = ?auto_1179 ?auto_1190 ) ) ( not ( = ?auto_1180 ?auto_1190 ) ) ( SURFACE-AT ?auto_1178 ?auto_1188 ) ( CLEAR ?auto_1178 ) ( IS-CRATE ?auto_1179 ) ( AVAILABLE ?auto_1187 ) ( not ( = ?auto_1195 ?auto_1188 ) ) ( HOIST-AT ?auto_1189 ?auto_1195 ) ( AVAILABLE ?auto_1189 ) ( SURFACE-AT ?auto_1179 ?auto_1195 ) ( ON ?auto_1179 ?auto_1191 ) ( CLEAR ?auto_1179 ) ( TRUCK-AT ?auto_1183 ?auto_1188 ) ( not ( = ?auto_1178 ?auto_1179 ) ) ( not ( = ?auto_1178 ?auto_1191 ) ) ( not ( = ?auto_1179 ?auto_1191 ) ) ( not ( = ?auto_1187 ?auto_1189 ) ) ( not ( = ?auto_1178 ?auto_1180 ) ) ( not ( = ?auto_1178 ?auto_1190 ) ) ( not ( = ?auto_1180 ?auto_1191 ) ) ( not ( = ?auto_1186 ?auto_1195 ) ) ( not ( = ?auto_1185 ?auto_1189 ) ) ( not ( = ?auto_1190 ?auto_1191 ) ) ( not ( = ?auto_1178 ?auto_1181 ) ) ( not ( = ?auto_1178 ?auto_1193 ) ) ( not ( = ?auto_1179 ?auto_1181 ) ) ( not ( = ?auto_1179 ?auto_1193 ) ) ( not ( = ?auto_1181 ?auto_1190 ) ) ( not ( = ?auto_1181 ?auto_1191 ) ) ( not ( = ?auto_1194 ?auto_1186 ) ) ( not ( = ?auto_1194 ?auto_1195 ) ) ( not ( = ?auto_1192 ?auto_1185 ) ) ( not ( = ?auto_1192 ?auto_1189 ) ) ( not ( = ?auto_1193 ?auto_1190 ) ) ( not ( = ?auto_1193 ?auto_1191 ) ) ( not ( = ?auto_1178 ?auto_1182 ) ) ( not ( = ?auto_1178 ?auto_1184 ) ) ( not ( = ?auto_1179 ?auto_1182 ) ) ( not ( = ?auto_1179 ?auto_1184 ) ) ( not ( = ?auto_1180 ?auto_1182 ) ) ( not ( = ?auto_1180 ?auto_1184 ) ) ( not ( = ?auto_1182 ?auto_1193 ) ) ( not ( = ?auto_1182 ?auto_1190 ) ) ( not ( = ?auto_1182 ?auto_1191 ) ) ( not ( = ?auto_1184 ?auto_1193 ) ) ( not ( = ?auto_1184 ?auto_1190 ) ) ( not ( = ?auto_1184 ?auto_1191 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1178 ?auto_1179 ?auto_1180 ?auto_1181 )
      ( MAKE-1CRATE ?auto_1181 ?auto_1182 )
      ( MAKE-4CRATE-VERIFY ?auto_1178 ?auto_1179 ?auto_1180 ?auto_1181 ?auto_1182 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1198 - SURFACE
      ?auto_1199 - SURFACE
    )
    :vars
    (
      ?auto_1200 - HOIST
      ?auto_1201 - PLACE
      ?auto_1203 - PLACE
      ?auto_1204 - HOIST
      ?auto_1205 - SURFACE
      ?auto_1202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1200 ?auto_1201 ) ( SURFACE-AT ?auto_1198 ?auto_1201 ) ( CLEAR ?auto_1198 ) ( IS-CRATE ?auto_1199 ) ( AVAILABLE ?auto_1200 ) ( not ( = ?auto_1203 ?auto_1201 ) ) ( HOIST-AT ?auto_1204 ?auto_1203 ) ( AVAILABLE ?auto_1204 ) ( SURFACE-AT ?auto_1199 ?auto_1203 ) ( ON ?auto_1199 ?auto_1205 ) ( CLEAR ?auto_1199 ) ( TRUCK-AT ?auto_1202 ?auto_1201 ) ( not ( = ?auto_1198 ?auto_1199 ) ) ( not ( = ?auto_1198 ?auto_1205 ) ) ( not ( = ?auto_1199 ?auto_1205 ) ) ( not ( = ?auto_1200 ?auto_1204 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1202 ?auto_1201 ?auto_1203 )
      ( !LIFT ?auto_1204 ?auto_1199 ?auto_1205 ?auto_1203 )
      ( !LOAD ?auto_1204 ?auto_1199 ?auto_1202 ?auto_1203 )
      ( !DRIVE ?auto_1202 ?auto_1203 ?auto_1201 )
      ( !UNLOAD ?auto_1200 ?auto_1199 ?auto_1202 ?auto_1201 )
      ( !DROP ?auto_1200 ?auto_1199 ?auto_1198 ?auto_1201 )
      ( MAKE-1CRATE-VERIFY ?auto_1198 ?auto_1199 ) )
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
      ?auto_1220 - HOIST
      ?auto_1222 - PLACE
      ?auto_1223 - PLACE
      ?auto_1221 - HOIST
      ?auto_1219 - SURFACE
      ?auto_1229 - PLACE
      ?auto_1231 - HOIST
      ?auto_1228 - SURFACE
      ?auto_1224 - PLACE
      ?auto_1227 - HOIST
      ?auto_1226 - SURFACE
      ?auto_1225 - SURFACE
      ?auto_1230 - SURFACE
      ?auto_1218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1220 ?auto_1222 ) ( IS-CRATE ?auto_1217 ) ( not ( = ?auto_1223 ?auto_1222 ) ) ( HOIST-AT ?auto_1221 ?auto_1223 ) ( SURFACE-AT ?auto_1217 ?auto_1223 ) ( ON ?auto_1217 ?auto_1219 ) ( CLEAR ?auto_1217 ) ( not ( = ?auto_1216 ?auto_1217 ) ) ( not ( = ?auto_1216 ?auto_1219 ) ) ( not ( = ?auto_1217 ?auto_1219 ) ) ( not ( = ?auto_1220 ?auto_1221 ) ) ( IS-CRATE ?auto_1216 ) ( not ( = ?auto_1229 ?auto_1222 ) ) ( HOIST-AT ?auto_1231 ?auto_1229 ) ( SURFACE-AT ?auto_1216 ?auto_1229 ) ( ON ?auto_1216 ?auto_1228 ) ( CLEAR ?auto_1216 ) ( not ( = ?auto_1215 ?auto_1216 ) ) ( not ( = ?auto_1215 ?auto_1228 ) ) ( not ( = ?auto_1216 ?auto_1228 ) ) ( not ( = ?auto_1220 ?auto_1231 ) ) ( IS-CRATE ?auto_1215 ) ( not ( = ?auto_1224 ?auto_1222 ) ) ( HOIST-AT ?auto_1227 ?auto_1224 ) ( AVAILABLE ?auto_1227 ) ( SURFACE-AT ?auto_1215 ?auto_1224 ) ( ON ?auto_1215 ?auto_1226 ) ( CLEAR ?auto_1215 ) ( not ( = ?auto_1214 ?auto_1215 ) ) ( not ( = ?auto_1214 ?auto_1226 ) ) ( not ( = ?auto_1215 ?auto_1226 ) ) ( not ( = ?auto_1220 ?auto_1227 ) ) ( IS-CRATE ?auto_1214 ) ( AVAILABLE ?auto_1231 ) ( SURFACE-AT ?auto_1214 ?auto_1229 ) ( ON ?auto_1214 ?auto_1225 ) ( CLEAR ?auto_1214 ) ( not ( = ?auto_1213 ?auto_1214 ) ) ( not ( = ?auto_1213 ?auto_1225 ) ) ( not ( = ?auto_1214 ?auto_1225 ) ) ( SURFACE-AT ?auto_1212 ?auto_1222 ) ( CLEAR ?auto_1212 ) ( IS-CRATE ?auto_1213 ) ( AVAILABLE ?auto_1220 ) ( AVAILABLE ?auto_1221 ) ( SURFACE-AT ?auto_1213 ?auto_1223 ) ( ON ?auto_1213 ?auto_1230 ) ( CLEAR ?auto_1213 ) ( TRUCK-AT ?auto_1218 ?auto_1222 ) ( not ( = ?auto_1212 ?auto_1213 ) ) ( not ( = ?auto_1212 ?auto_1230 ) ) ( not ( = ?auto_1213 ?auto_1230 ) ) ( not ( = ?auto_1212 ?auto_1214 ) ) ( not ( = ?auto_1212 ?auto_1225 ) ) ( not ( = ?auto_1214 ?auto_1230 ) ) ( not ( = ?auto_1229 ?auto_1223 ) ) ( not ( = ?auto_1231 ?auto_1221 ) ) ( not ( = ?auto_1225 ?auto_1230 ) ) ( not ( = ?auto_1212 ?auto_1215 ) ) ( not ( = ?auto_1212 ?auto_1226 ) ) ( not ( = ?auto_1213 ?auto_1215 ) ) ( not ( = ?auto_1213 ?auto_1226 ) ) ( not ( = ?auto_1215 ?auto_1225 ) ) ( not ( = ?auto_1215 ?auto_1230 ) ) ( not ( = ?auto_1224 ?auto_1229 ) ) ( not ( = ?auto_1224 ?auto_1223 ) ) ( not ( = ?auto_1227 ?auto_1231 ) ) ( not ( = ?auto_1227 ?auto_1221 ) ) ( not ( = ?auto_1226 ?auto_1225 ) ) ( not ( = ?auto_1226 ?auto_1230 ) ) ( not ( = ?auto_1212 ?auto_1216 ) ) ( not ( = ?auto_1212 ?auto_1228 ) ) ( not ( = ?auto_1213 ?auto_1216 ) ) ( not ( = ?auto_1213 ?auto_1228 ) ) ( not ( = ?auto_1214 ?auto_1216 ) ) ( not ( = ?auto_1214 ?auto_1228 ) ) ( not ( = ?auto_1216 ?auto_1226 ) ) ( not ( = ?auto_1216 ?auto_1225 ) ) ( not ( = ?auto_1216 ?auto_1230 ) ) ( not ( = ?auto_1228 ?auto_1226 ) ) ( not ( = ?auto_1228 ?auto_1225 ) ) ( not ( = ?auto_1228 ?auto_1230 ) ) ( not ( = ?auto_1212 ?auto_1217 ) ) ( not ( = ?auto_1212 ?auto_1219 ) ) ( not ( = ?auto_1213 ?auto_1217 ) ) ( not ( = ?auto_1213 ?auto_1219 ) ) ( not ( = ?auto_1214 ?auto_1217 ) ) ( not ( = ?auto_1214 ?auto_1219 ) ) ( not ( = ?auto_1215 ?auto_1217 ) ) ( not ( = ?auto_1215 ?auto_1219 ) ) ( not ( = ?auto_1217 ?auto_1228 ) ) ( not ( = ?auto_1217 ?auto_1226 ) ) ( not ( = ?auto_1217 ?auto_1225 ) ) ( not ( = ?auto_1217 ?auto_1230 ) ) ( not ( = ?auto_1219 ?auto_1228 ) ) ( not ( = ?auto_1219 ?auto_1226 ) ) ( not ( = ?auto_1219 ?auto_1225 ) ) ( not ( = ?auto_1219 ?auto_1230 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1212 ?auto_1213 ?auto_1214 ?auto_1215 ?auto_1216 )
      ( MAKE-1CRATE ?auto_1216 ?auto_1217 )
      ( MAKE-5CRATE-VERIFY ?auto_1212 ?auto_1213 ?auto_1214 ?auto_1215 ?auto_1216 ?auto_1217 ) )
  )

)

