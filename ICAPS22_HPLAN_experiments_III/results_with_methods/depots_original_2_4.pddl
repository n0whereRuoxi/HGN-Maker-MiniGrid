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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1016 - SURFACE
      ?auto_1017 - SURFACE
    )
    :vars
    (
      ?auto_1018 - HOIST
      ?auto_1019 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1018 ?auto_1019 ) ( SURFACE-AT ?auto_1016 ?auto_1019 ) ( CLEAR ?auto_1016 ) ( LIFTING ?auto_1018 ?auto_1017 ) ( IS-CRATE ?auto_1017 ) ( not ( = ?auto_1016 ?auto_1017 ) ) )
    :subtasks
    ( ( !DROP ?auto_1018 ?auto_1017 ?auto_1016 ?auto_1019 )
      ( MAKE-1CRATE-VERIFY ?auto_1016 ?auto_1017 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1020 - SURFACE
      ?auto_1021 - SURFACE
    )
    :vars
    (
      ?auto_1023 - HOIST
      ?auto_1022 - PLACE
      ?auto_1024 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1023 ?auto_1022 ) ( SURFACE-AT ?auto_1020 ?auto_1022 ) ( CLEAR ?auto_1020 ) ( IS-CRATE ?auto_1021 ) ( not ( = ?auto_1020 ?auto_1021 ) ) ( TRUCK-AT ?auto_1024 ?auto_1022 ) ( AVAILABLE ?auto_1023 ) ( IN ?auto_1021 ?auto_1024 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1023 ?auto_1021 ?auto_1024 ?auto_1022 )
      ( MAKE-1CRATE ?auto_1020 ?auto_1021 )
      ( MAKE-1CRATE-VERIFY ?auto_1020 ?auto_1021 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1025 - SURFACE
      ?auto_1026 - SURFACE
    )
    :vars
    (
      ?auto_1028 - HOIST
      ?auto_1029 - PLACE
      ?auto_1027 - TRUCK
      ?auto_1030 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1028 ?auto_1029 ) ( SURFACE-AT ?auto_1025 ?auto_1029 ) ( CLEAR ?auto_1025 ) ( IS-CRATE ?auto_1026 ) ( not ( = ?auto_1025 ?auto_1026 ) ) ( AVAILABLE ?auto_1028 ) ( IN ?auto_1026 ?auto_1027 ) ( TRUCK-AT ?auto_1027 ?auto_1030 ) ( not ( = ?auto_1030 ?auto_1029 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1027 ?auto_1030 ?auto_1029 )
      ( MAKE-1CRATE ?auto_1025 ?auto_1026 )
      ( MAKE-1CRATE-VERIFY ?auto_1025 ?auto_1026 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1031 - SURFACE
      ?auto_1032 - SURFACE
    )
    :vars
    (
      ?auto_1033 - HOIST
      ?auto_1035 - PLACE
      ?auto_1034 - TRUCK
      ?auto_1036 - PLACE
      ?auto_1037 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1033 ?auto_1035 ) ( SURFACE-AT ?auto_1031 ?auto_1035 ) ( CLEAR ?auto_1031 ) ( IS-CRATE ?auto_1032 ) ( not ( = ?auto_1031 ?auto_1032 ) ) ( AVAILABLE ?auto_1033 ) ( TRUCK-AT ?auto_1034 ?auto_1036 ) ( not ( = ?auto_1036 ?auto_1035 ) ) ( HOIST-AT ?auto_1037 ?auto_1036 ) ( LIFTING ?auto_1037 ?auto_1032 ) ( not ( = ?auto_1033 ?auto_1037 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1037 ?auto_1032 ?auto_1034 ?auto_1036 )
      ( MAKE-1CRATE ?auto_1031 ?auto_1032 )
      ( MAKE-1CRATE-VERIFY ?auto_1031 ?auto_1032 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1038 - SURFACE
      ?auto_1039 - SURFACE
    )
    :vars
    (
      ?auto_1042 - HOIST
      ?auto_1041 - PLACE
      ?auto_1040 - TRUCK
      ?auto_1043 - PLACE
      ?auto_1044 - HOIST
      ?auto_1045 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042 ?auto_1041 ) ( SURFACE-AT ?auto_1038 ?auto_1041 ) ( CLEAR ?auto_1038 ) ( IS-CRATE ?auto_1039 ) ( not ( = ?auto_1038 ?auto_1039 ) ) ( AVAILABLE ?auto_1042 ) ( TRUCK-AT ?auto_1040 ?auto_1043 ) ( not ( = ?auto_1043 ?auto_1041 ) ) ( HOIST-AT ?auto_1044 ?auto_1043 ) ( not ( = ?auto_1042 ?auto_1044 ) ) ( AVAILABLE ?auto_1044 ) ( SURFACE-AT ?auto_1039 ?auto_1043 ) ( ON ?auto_1039 ?auto_1045 ) ( CLEAR ?auto_1039 ) ( not ( = ?auto_1038 ?auto_1045 ) ) ( not ( = ?auto_1039 ?auto_1045 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1044 ?auto_1039 ?auto_1045 ?auto_1043 )
      ( MAKE-1CRATE ?auto_1038 ?auto_1039 )
      ( MAKE-1CRATE-VERIFY ?auto_1038 ?auto_1039 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1046 - SURFACE
      ?auto_1047 - SURFACE
    )
    :vars
    (
      ?auto_1048 - HOIST
      ?auto_1053 - PLACE
      ?auto_1052 - PLACE
      ?auto_1049 - HOIST
      ?auto_1050 - SURFACE
      ?auto_1051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1048 ?auto_1053 ) ( SURFACE-AT ?auto_1046 ?auto_1053 ) ( CLEAR ?auto_1046 ) ( IS-CRATE ?auto_1047 ) ( not ( = ?auto_1046 ?auto_1047 ) ) ( AVAILABLE ?auto_1048 ) ( not ( = ?auto_1052 ?auto_1053 ) ) ( HOIST-AT ?auto_1049 ?auto_1052 ) ( not ( = ?auto_1048 ?auto_1049 ) ) ( AVAILABLE ?auto_1049 ) ( SURFACE-AT ?auto_1047 ?auto_1052 ) ( ON ?auto_1047 ?auto_1050 ) ( CLEAR ?auto_1047 ) ( not ( = ?auto_1046 ?auto_1050 ) ) ( not ( = ?auto_1047 ?auto_1050 ) ) ( TRUCK-AT ?auto_1051 ?auto_1053 ) )
    :subtasks
    ( ( !DRIVE ?auto_1051 ?auto_1053 ?auto_1052 )
      ( MAKE-1CRATE ?auto_1046 ?auto_1047 )
      ( MAKE-1CRATE-VERIFY ?auto_1046 ?auto_1047 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1059 - SURFACE
      ?auto_1060 - SURFACE
    )
    :vars
    (
      ?auto_1061 - HOIST
      ?auto_1062 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1061 ?auto_1062 ) ( SURFACE-AT ?auto_1059 ?auto_1062 ) ( CLEAR ?auto_1059 ) ( LIFTING ?auto_1061 ?auto_1060 ) ( IS-CRATE ?auto_1060 ) ( not ( = ?auto_1059 ?auto_1060 ) ) )
    :subtasks
    ( ( !DROP ?auto_1061 ?auto_1060 ?auto_1059 ?auto_1062 )
      ( MAKE-1CRATE-VERIFY ?auto_1059 ?auto_1060 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1063 - SURFACE
      ?auto_1064 - SURFACE
      ?auto_1065 - SURFACE
    )
    :vars
    (
      ?auto_1066 - HOIST
      ?auto_1067 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1066 ?auto_1067 ) ( SURFACE-AT ?auto_1064 ?auto_1067 ) ( CLEAR ?auto_1064 ) ( LIFTING ?auto_1066 ?auto_1065 ) ( IS-CRATE ?auto_1065 ) ( not ( = ?auto_1064 ?auto_1065 ) ) ( ON ?auto_1064 ?auto_1063 ) ( not ( = ?auto_1063 ?auto_1064 ) ) ( not ( = ?auto_1063 ?auto_1065 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1064 ?auto_1065 )
      ( MAKE-2CRATE-VERIFY ?auto_1063 ?auto_1064 ?auto_1065 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1068 - SURFACE
      ?auto_1069 - SURFACE
    )
    :vars
    (
      ?auto_1070 - HOIST
      ?auto_1071 - PLACE
      ?auto_1072 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1070 ?auto_1071 ) ( SURFACE-AT ?auto_1068 ?auto_1071 ) ( CLEAR ?auto_1068 ) ( IS-CRATE ?auto_1069 ) ( not ( = ?auto_1068 ?auto_1069 ) ) ( TRUCK-AT ?auto_1072 ?auto_1071 ) ( AVAILABLE ?auto_1070 ) ( IN ?auto_1069 ?auto_1072 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1070 ?auto_1069 ?auto_1072 ?auto_1071 )
      ( MAKE-1CRATE ?auto_1068 ?auto_1069 )
      ( MAKE-1CRATE-VERIFY ?auto_1068 ?auto_1069 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1073 - SURFACE
      ?auto_1074 - SURFACE
      ?auto_1075 - SURFACE
    )
    :vars
    (
      ?auto_1077 - HOIST
      ?auto_1078 - PLACE
      ?auto_1076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1077 ?auto_1078 ) ( SURFACE-AT ?auto_1074 ?auto_1078 ) ( CLEAR ?auto_1074 ) ( IS-CRATE ?auto_1075 ) ( not ( = ?auto_1074 ?auto_1075 ) ) ( TRUCK-AT ?auto_1076 ?auto_1078 ) ( AVAILABLE ?auto_1077 ) ( IN ?auto_1075 ?auto_1076 ) ( ON ?auto_1074 ?auto_1073 ) ( not ( = ?auto_1073 ?auto_1074 ) ) ( not ( = ?auto_1073 ?auto_1075 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1074 ?auto_1075 )
      ( MAKE-2CRATE-VERIFY ?auto_1073 ?auto_1074 ?auto_1075 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1079 - SURFACE
      ?auto_1080 - SURFACE
    )
    :vars
    (
      ?auto_1084 - HOIST
      ?auto_1083 - PLACE
      ?auto_1082 - TRUCK
      ?auto_1081 - SURFACE
      ?auto_1085 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1084 ?auto_1083 ) ( SURFACE-AT ?auto_1079 ?auto_1083 ) ( CLEAR ?auto_1079 ) ( IS-CRATE ?auto_1080 ) ( not ( = ?auto_1079 ?auto_1080 ) ) ( AVAILABLE ?auto_1084 ) ( IN ?auto_1080 ?auto_1082 ) ( ON ?auto_1079 ?auto_1081 ) ( not ( = ?auto_1081 ?auto_1079 ) ) ( not ( = ?auto_1081 ?auto_1080 ) ) ( TRUCK-AT ?auto_1082 ?auto_1085 ) ( not ( = ?auto_1085 ?auto_1083 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1082 ?auto_1085 ?auto_1083 )
      ( MAKE-2CRATE ?auto_1081 ?auto_1079 ?auto_1080 )
      ( MAKE-1CRATE-VERIFY ?auto_1079 ?auto_1080 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1086 - SURFACE
      ?auto_1087 - SURFACE
      ?auto_1088 - SURFACE
    )
    :vars
    (
      ?auto_1089 - HOIST
      ?auto_1091 - PLACE
      ?auto_1090 - TRUCK
      ?auto_1092 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1089 ?auto_1091 ) ( SURFACE-AT ?auto_1087 ?auto_1091 ) ( CLEAR ?auto_1087 ) ( IS-CRATE ?auto_1088 ) ( not ( = ?auto_1087 ?auto_1088 ) ) ( AVAILABLE ?auto_1089 ) ( IN ?auto_1088 ?auto_1090 ) ( ON ?auto_1087 ?auto_1086 ) ( not ( = ?auto_1086 ?auto_1087 ) ) ( not ( = ?auto_1086 ?auto_1088 ) ) ( TRUCK-AT ?auto_1090 ?auto_1092 ) ( not ( = ?auto_1092 ?auto_1091 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1087 ?auto_1088 )
      ( MAKE-2CRATE-VERIFY ?auto_1086 ?auto_1087 ?auto_1088 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1093 - SURFACE
      ?auto_1094 - SURFACE
    )
    :vars
    (
      ?auto_1098 - HOIST
      ?auto_1095 - PLACE
      ?auto_1096 - SURFACE
      ?auto_1097 - TRUCK
      ?auto_1099 - PLACE
      ?auto_1100 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1098 ?auto_1095 ) ( SURFACE-AT ?auto_1093 ?auto_1095 ) ( CLEAR ?auto_1093 ) ( IS-CRATE ?auto_1094 ) ( not ( = ?auto_1093 ?auto_1094 ) ) ( AVAILABLE ?auto_1098 ) ( ON ?auto_1093 ?auto_1096 ) ( not ( = ?auto_1096 ?auto_1093 ) ) ( not ( = ?auto_1096 ?auto_1094 ) ) ( TRUCK-AT ?auto_1097 ?auto_1099 ) ( not ( = ?auto_1099 ?auto_1095 ) ) ( HOIST-AT ?auto_1100 ?auto_1099 ) ( LIFTING ?auto_1100 ?auto_1094 ) ( not ( = ?auto_1098 ?auto_1100 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1100 ?auto_1094 ?auto_1097 ?auto_1099 )
      ( MAKE-2CRATE ?auto_1096 ?auto_1093 ?auto_1094 )
      ( MAKE-1CRATE-VERIFY ?auto_1093 ?auto_1094 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1101 - SURFACE
      ?auto_1102 - SURFACE
      ?auto_1103 - SURFACE
    )
    :vars
    (
      ?auto_1105 - HOIST
      ?auto_1108 - PLACE
      ?auto_1104 - TRUCK
      ?auto_1107 - PLACE
      ?auto_1106 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1105 ?auto_1108 ) ( SURFACE-AT ?auto_1102 ?auto_1108 ) ( CLEAR ?auto_1102 ) ( IS-CRATE ?auto_1103 ) ( not ( = ?auto_1102 ?auto_1103 ) ) ( AVAILABLE ?auto_1105 ) ( ON ?auto_1102 ?auto_1101 ) ( not ( = ?auto_1101 ?auto_1102 ) ) ( not ( = ?auto_1101 ?auto_1103 ) ) ( TRUCK-AT ?auto_1104 ?auto_1107 ) ( not ( = ?auto_1107 ?auto_1108 ) ) ( HOIST-AT ?auto_1106 ?auto_1107 ) ( LIFTING ?auto_1106 ?auto_1103 ) ( not ( = ?auto_1105 ?auto_1106 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1102 ?auto_1103 )
      ( MAKE-2CRATE-VERIFY ?auto_1101 ?auto_1102 ?auto_1103 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1109 - SURFACE
      ?auto_1110 - SURFACE
    )
    :vars
    (
      ?auto_1114 - HOIST
      ?auto_1112 - PLACE
      ?auto_1113 - SURFACE
      ?auto_1116 - TRUCK
      ?auto_1111 - PLACE
      ?auto_1115 - HOIST
      ?auto_1117 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1114 ?auto_1112 ) ( SURFACE-AT ?auto_1109 ?auto_1112 ) ( CLEAR ?auto_1109 ) ( IS-CRATE ?auto_1110 ) ( not ( = ?auto_1109 ?auto_1110 ) ) ( AVAILABLE ?auto_1114 ) ( ON ?auto_1109 ?auto_1113 ) ( not ( = ?auto_1113 ?auto_1109 ) ) ( not ( = ?auto_1113 ?auto_1110 ) ) ( TRUCK-AT ?auto_1116 ?auto_1111 ) ( not ( = ?auto_1111 ?auto_1112 ) ) ( HOIST-AT ?auto_1115 ?auto_1111 ) ( not ( = ?auto_1114 ?auto_1115 ) ) ( AVAILABLE ?auto_1115 ) ( SURFACE-AT ?auto_1110 ?auto_1111 ) ( ON ?auto_1110 ?auto_1117 ) ( CLEAR ?auto_1110 ) ( not ( = ?auto_1109 ?auto_1117 ) ) ( not ( = ?auto_1110 ?auto_1117 ) ) ( not ( = ?auto_1113 ?auto_1117 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1115 ?auto_1110 ?auto_1117 ?auto_1111 )
      ( MAKE-2CRATE ?auto_1113 ?auto_1109 ?auto_1110 )
      ( MAKE-1CRATE-VERIFY ?auto_1109 ?auto_1110 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1118 - SURFACE
      ?auto_1119 - SURFACE
      ?auto_1120 - SURFACE
    )
    :vars
    (
      ?auto_1124 - HOIST
      ?auto_1125 - PLACE
      ?auto_1126 - TRUCK
      ?auto_1122 - PLACE
      ?auto_1121 - HOIST
      ?auto_1123 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1124 ?auto_1125 ) ( SURFACE-AT ?auto_1119 ?auto_1125 ) ( CLEAR ?auto_1119 ) ( IS-CRATE ?auto_1120 ) ( not ( = ?auto_1119 ?auto_1120 ) ) ( AVAILABLE ?auto_1124 ) ( ON ?auto_1119 ?auto_1118 ) ( not ( = ?auto_1118 ?auto_1119 ) ) ( not ( = ?auto_1118 ?auto_1120 ) ) ( TRUCK-AT ?auto_1126 ?auto_1122 ) ( not ( = ?auto_1122 ?auto_1125 ) ) ( HOIST-AT ?auto_1121 ?auto_1122 ) ( not ( = ?auto_1124 ?auto_1121 ) ) ( AVAILABLE ?auto_1121 ) ( SURFACE-AT ?auto_1120 ?auto_1122 ) ( ON ?auto_1120 ?auto_1123 ) ( CLEAR ?auto_1120 ) ( not ( = ?auto_1119 ?auto_1123 ) ) ( not ( = ?auto_1120 ?auto_1123 ) ) ( not ( = ?auto_1118 ?auto_1123 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1119 ?auto_1120 )
      ( MAKE-2CRATE-VERIFY ?auto_1118 ?auto_1119 ?auto_1120 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1127 - SURFACE
      ?auto_1128 - SURFACE
    )
    :vars
    (
      ?auto_1133 - HOIST
      ?auto_1131 - PLACE
      ?auto_1132 - SURFACE
      ?auto_1129 - PLACE
      ?auto_1135 - HOIST
      ?auto_1130 - SURFACE
      ?auto_1134 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1133 ?auto_1131 ) ( SURFACE-AT ?auto_1127 ?auto_1131 ) ( CLEAR ?auto_1127 ) ( IS-CRATE ?auto_1128 ) ( not ( = ?auto_1127 ?auto_1128 ) ) ( AVAILABLE ?auto_1133 ) ( ON ?auto_1127 ?auto_1132 ) ( not ( = ?auto_1132 ?auto_1127 ) ) ( not ( = ?auto_1132 ?auto_1128 ) ) ( not ( = ?auto_1129 ?auto_1131 ) ) ( HOIST-AT ?auto_1135 ?auto_1129 ) ( not ( = ?auto_1133 ?auto_1135 ) ) ( AVAILABLE ?auto_1135 ) ( SURFACE-AT ?auto_1128 ?auto_1129 ) ( ON ?auto_1128 ?auto_1130 ) ( CLEAR ?auto_1128 ) ( not ( = ?auto_1127 ?auto_1130 ) ) ( not ( = ?auto_1128 ?auto_1130 ) ) ( not ( = ?auto_1132 ?auto_1130 ) ) ( TRUCK-AT ?auto_1134 ?auto_1131 ) )
    :subtasks
    ( ( !DRIVE ?auto_1134 ?auto_1131 ?auto_1129 )
      ( MAKE-2CRATE ?auto_1132 ?auto_1127 ?auto_1128 )
      ( MAKE-1CRATE-VERIFY ?auto_1127 ?auto_1128 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1136 - SURFACE
      ?auto_1137 - SURFACE
      ?auto_1138 - SURFACE
    )
    :vars
    (
      ?auto_1140 - HOIST
      ?auto_1142 - PLACE
      ?auto_1139 - PLACE
      ?auto_1141 - HOIST
      ?auto_1143 - SURFACE
      ?auto_1144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1140 ?auto_1142 ) ( SURFACE-AT ?auto_1137 ?auto_1142 ) ( CLEAR ?auto_1137 ) ( IS-CRATE ?auto_1138 ) ( not ( = ?auto_1137 ?auto_1138 ) ) ( AVAILABLE ?auto_1140 ) ( ON ?auto_1137 ?auto_1136 ) ( not ( = ?auto_1136 ?auto_1137 ) ) ( not ( = ?auto_1136 ?auto_1138 ) ) ( not ( = ?auto_1139 ?auto_1142 ) ) ( HOIST-AT ?auto_1141 ?auto_1139 ) ( not ( = ?auto_1140 ?auto_1141 ) ) ( AVAILABLE ?auto_1141 ) ( SURFACE-AT ?auto_1138 ?auto_1139 ) ( ON ?auto_1138 ?auto_1143 ) ( CLEAR ?auto_1138 ) ( not ( = ?auto_1137 ?auto_1143 ) ) ( not ( = ?auto_1138 ?auto_1143 ) ) ( not ( = ?auto_1136 ?auto_1143 ) ) ( TRUCK-AT ?auto_1144 ?auto_1142 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1137 ?auto_1138 )
      ( MAKE-2CRATE-VERIFY ?auto_1136 ?auto_1137 ?auto_1138 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1145 - SURFACE
      ?auto_1146 - SURFACE
    )
    :vars
    (
      ?auto_1151 - HOIST
      ?auto_1153 - PLACE
      ?auto_1147 - SURFACE
      ?auto_1148 - PLACE
      ?auto_1150 - HOIST
      ?auto_1152 - SURFACE
      ?auto_1149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1151 ?auto_1153 ) ( IS-CRATE ?auto_1146 ) ( not ( = ?auto_1145 ?auto_1146 ) ) ( not ( = ?auto_1147 ?auto_1145 ) ) ( not ( = ?auto_1147 ?auto_1146 ) ) ( not ( = ?auto_1148 ?auto_1153 ) ) ( HOIST-AT ?auto_1150 ?auto_1148 ) ( not ( = ?auto_1151 ?auto_1150 ) ) ( AVAILABLE ?auto_1150 ) ( SURFACE-AT ?auto_1146 ?auto_1148 ) ( ON ?auto_1146 ?auto_1152 ) ( CLEAR ?auto_1146 ) ( not ( = ?auto_1145 ?auto_1152 ) ) ( not ( = ?auto_1146 ?auto_1152 ) ) ( not ( = ?auto_1147 ?auto_1152 ) ) ( TRUCK-AT ?auto_1149 ?auto_1153 ) ( SURFACE-AT ?auto_1147 ?auto_1153 ) ( CLEAR ?auto_1147 ) ( LIFTING ?auto_1151 ?auto_1145 ) ( IS-CRATE ?auto_1145 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1147 ?auto_1145 )
      ( MAKE-2CRATE ?auto_1147 ?auto_1145 ?auto_1146 )
      ( MAKE-1CRATE-VERIFY ?auto_1145 ?auto_1146 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1154 - SURFACE
      ?auto_1155 - SURFACE
      ?auto_1156 - SURFACE
    )
    :vars
    (
      ?auto_1157 - HOIST
      ?auto_1158 - PLACE
      ?auto_1160 - PLACE
      ?auto_1161 - HOIST
      ?auto_1162 - SURFACE
      ?auto_1159 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1157 ?auto_1158 ) ( IS-CRATE ?auto_1156 ) ( not ( = ?auto_1155 ?auto_1156 ) ) ( not ( = ?auto_1154 ?auto_1155 ) ) ( not ( = ?auto_1154 ?auto_1156 ) ) ( not ( = ?auto_1160 ?auto_1158 ) ) ( HOIST-AT ?auto_1161 ?auto_1160 ) ( not ( = ?auto_1157 ?auto_1161 ) ) ( AVAILABLE ?auto_1161 ) ( SURFACE-AT ?auto_1156 ?auto_1160 ) ( ON ?auto_1156 ?auto_1162 ) ( CLEAR ?auto_1156 ) ( not ( = ?auto_1155 ?auto_1162 ) ) ( not ( = ?auto_1156 ?auto_1162 ) ) ( not ( = ?auto_1154 ?auto_1162 ) ) ( TRUCK-AT ?auto_1159 ?auto_1158 ) ( SURFACE-AT ?auto_1154 ?auto_1158 ) ( CLEAR ?auto_1154 ) ( LIFTING ?auto_1157 ?auto_1155 ) ( IS-CRATE ?auto_1155 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1155 ?auto_1156 )
      ( MAKE-2CRATE-VERIFY ?auto_1154 ?auto_1155 ?auto_1156 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1163 - SURFACE
      ?auto_1164 - SURFACE
    )
    :vars
    (
      ?auto_1167 - HOIST
      ?auto_1171 - PLACE
      ?auto_1169 - SURFACE
      ?auto_1165 - PLACE
      ?auto_1170 - HOIST
      ?auto_1168 - SURFACE
      ?auto_1166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1167 ?auto_1171 ) ( IS-CRATE ?auto_1164 ) ( not ( = ?auto_1163 ?auto_1164 ) ) ( not ( = ?auto_1169 ?auto_1163 ) ) ( not ( = ?auto_1169 ?auto_1164 ) ) ( not ( = ?auto_1165 ?auto_1171 ) ) ( HOIST-AT ?auto_1170 ?auto_1165 ) ( not ( = ?auto_1167 ?auto_1170 ) ) ( AVAILABLE ?auto_1170 ) ( SURFACE-AT ?auto_1164 ?auto_1165 ) ( ON ?auto_1164 ?auto_1168 ) ( CLEAR ?auto_1164 ) ( not ( = ?auto_1163 ?auto_1168 ) ) ( not ( = ?auto_1164 ?auto_1168 ) ) ( not ( = ?auto_1169 ?auto_1168 ) ) ( TRUCK-AT ?auto_1166 ?auto_1171 ) ( SURFACE-AT ?auto_1169 ?auto_1171 ) ( CLEAR ?auto_1169 ) ( IS-CRATE ?auto_1163 ) ( AVAILABLE ?auto_1167 ) ( IN ?auto_1163 ?auto_1166 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1167 ?auto_1163 ?auto_1166 ?auto_1171 )
      ( MAKE-2CRATE ?auto_1169 ?auto_1163 ?auto_1164 )
      ( MAKE-1CRATE-VERIFY ?auto_1163 ?auto_1164 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1172 - SURFACE
      ?auto_1173 - SURFACE
      ?auto_1174 - SURFACE
    )
    :vars
    (
      ?auto_1179 - HOIST
      ?auto_1177 - PLACE
      ?auto_1178 - PLACE
      ?auto_1176 - HOIST
      ?auto_1175 - SURFACE
      ?auto_1180 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1179 ?auto_1177 ) ( IS-CRATE ?auto_1174 ) ( not ( = ?auto_1173 ?auto_1174 ) ) ( not ( = ?auto_1172 ?auto_1173 ) ) ( not ( = ?auto_1172 ?auto_1174 ) ) ( not ( = ?auto_1178 ?auto_1177 ) ) ( HOIST-AT ?auto_1176 ?auto_1178 ) ( not ( = ?auto_1179 ?auto_1176 ) ) ( AVAILABLE ?auto_1176 ) ( SURFACE-AT ?auto_1174 ?auto_1178 ) ( ON ?auto_1174 ?auto_1175 ) ( CLEAR ?auto_1174 ) ( not ( = ?auto_1173 ?auto_1175 ) ) ( not ( = ?auto_1174 ?auto_1175 ) ) ( not ( = ?auto_1172 ?auto_1175 ) ) ( TRUCK-AT ?auto_1180 ?auto_1177 ) ( SURFACE-AT ?auto_1172 ?auto_1177 ) ( CLEAR ?auto_1172 ) ( IS-CRATE ?auto_1173 ) ( AVAILABLE ?auto_1179 ) ( IN ?auto_1173 ?auto_1180 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1173 ?auto_1174 )
      ( MAKE-2CRATE-VERIFY ?auto_1172 ?auto_1173 ?auto_1174 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1181 - SURFACE
      ?auto_1182 - SURFACE
    )
    :vars
    (
      ?auto_1189 - HOIST
      ?auto_1187 - PLACE
      ?auto_1188 - SURFACE
      ?auto_1184 - PLACE
      ?auto_1183 - HOIST
      ?auto_1185 - SURFACE
      ?auto_1186 - TRUCK
      ?auto_1190 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1189 ?auto_1187 ) ( IS-CRATE ?auto_1182 ) ( not ( = ?auto_1181 ?auto_1182 ) ) ( not ( = ?auto_1188 ?auto_1181 ) ) ( not ( = ?auto_1188 ?auto_1182 ) ) ( not ( = ?auto_1184 ?auto_1187 ) ) ( HOIST-AT ?auto_1183 ?auto_1184 ) ( not ( = ?auto_1189 ?auto_1183 ) ) ( AVAILABLE ?auto_1183 ) ( SURFACE-AT ?auto_1182 ?auto_1184 ) ( ON ?auto_1182 ?auto_1185 ) ( CLEAR ?auto_1182 ) ( not ( = ?auto_1181 ?auto_1185 ) ) ( not ( = ?auto_1182 ?auto_1185 ) ) ( not ( = ?auto_1188 ?auto_1185 ) ) ( SURFACE-AT ?auto_1188 ?auto_1187 ) ( CLEAR ?auto_1188 ) ( IS-CRATE ?auto_1181 ) ( AVAILABLE ?auto_1189 ) ( IN ?auto_1181 ?auto_1186 ) ( TRUCK-AT ?auto_1186 ?auto_1190 ) ( not ( = ?auto_1190 ?auto_1187 ) ) ( not ( = ?auto_1184 ?auto_1190 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1186 ?auto_1190 ?auto_1187 )
      ( MAKE-2CRATE ?auto_1188 ?auto_1181 ?auto_1182 )
      ( MAKE-1CRATE-VERIFY ?auto_1181 ?auto_1182 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1191 - SURFACE
      ?auto_1192 - SURFACE
      ?auto_1193 - SURFACE
    )
    :vars
    (
      ?auto_1194 - HOIST
      ?auto_1195 - PLACE
      ?auto_1199 - PLACE
      ?auto_1200 - HOIST
      ?auto_1196 - SURFACE
      ?auto_1197 - TRUCK
      ?auto_1198 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1194 ?auto_1195 ) ( IS-CRATE ?auto_1193 ) ( not ( = ?auto_1192 ?auto_1193 ) ) ( not ( = ?auto_1191 ?auto_1192 ) ) ( not ( = ?auto_1191 ?auto_1193 ) ) ( not ( = ?auto_1199 ?auto_1195 ) ) ( HOIST-AT ?auto_1200 ?auto_1199 ) ( not ( = ?auto_1194 ?auto_1200 ) ) ( AVAILABLE ?auto_1200 ) ( SURFACE-AT ?auto_1193 ?auto_1199 ) ( ON ?auto_1193 ?auto_1196 ) ( CLEAR ?auto_1193 ) ( not ( = ?auto_1192 ?auto_1196 ) ) ( not ( = ?auto_1193 ?auto_1196 ) ) ( not ( = ?auto_1191 ?auto_1196 ) ) ( SURFACE-AT ?auto_1191 ?auto_1195 ) ( CLEAR ?auto_1191 ) ( IS-CRATE ?auto_1192 ) ( AVAILABLE ?auto_1194 ) ( IN ?auto_1192 ?auto_1197 ) ( TRUCK-AT ?auto_1197 ?auto_1198 ) ( not ( = ?auto_1198 ?auto_1195 ) ) ( not ( = ?auto_1199 ?auto_1198 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1192 ?auto_1193 )
      ( MAKE-2CRATE-VERIFY ?auto_1191 ?auto_1192 ?auto_1193 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1201 - SURFACE
      ?auto_1202 - SURFACE
    )
    :vars
    (
      ?auto_1209 - HOIST
      ?auto_1210 - PLACE
      ?auto_1207 - SURFACE
      ?auto_1203 - PLACE
      ?auto_1206 - HOIST
      ?auto_1205 - SURFACE
      ?auto_1204 - TRUCK
      ?auto_1208 - PLACE
      ?auto_1211 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1209 ?auto_1210 ) ( IS-CRATE ?auto_1202 ) ( not ( = ?auto_1201 ?auto_1202 ) ) ( not ( = ?auto_1207 ?auto_1201 ) ) ( not ( = ?auto_1207 ?auto_1202 ) ) ( not ( = ?auto_1203 ?auto_1210 ) ) ( HOIST-AT ?auto_1206 ?auto_1203 ) ( not ( = ?auto_1209 ?auto_1206 ) ) ( AVAILABLE ?auto_1206 ) ( SURFACE-AT ?auto_1202 ?auto_1203 ) ( ON ?auto_1202 ?auto_1205 ) ( CLEAR ?auto_1202 ) ( not ( = ?auto_1201 ?auto_1205 ) ) ( not ( = ?auto_1202 ?auto_1205 ) ) ( not ( = ?auto_1207 ?auto_1205 ) ) ( SURFACE-AT ?auto_1207 ?auto_1210 ) ( CLEAR ?auto_1207 ) ( IS-CRATE ?auto_1201 ) ( AVAILABLE ?auto_1209 ) ( TRUCK-AT ?auto_1204 ?auto_1208 ) ( not ( = ?auto_1208 ?auto_1210 ) ) ( not ( = ?auto_1203 ?auto_1208 ) ) ( HOIST-AT ?auto_1211 ?auto_1208 ) ( LIFTING ?auto_1211 ?auto_1201 ) ( not ( = ?auto_1209 ?auto_1211 ) ) ( not ( = ?auto_1206 ?auto_1211 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1211 ?auto_1201 ?auto_1204 ?auto_1208 )
      ( MAKE-2CRATE ?auto_1207 ?auto_1201 ?auto_1202 )
      ( MAKE-1CRATE-VERIFY ?auto_1201 ?auto_1202 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1212 - SURFACE
      ?auto_1213 - SURFACE
      ?auto_1214 - SURFACE
    )
    :vars
    (
      ?auto_1216 - HOIST
      ?auto_1215 - PLACE
      ?auto_1222 - PLACE
      ?auto_1218 - HOIST
      ?auto_1217 - SURFACE
      ?auto_1221 - TRUCK
      ?auto_1219 - PLACE
      ?auto_1220 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1216 ?auto_1215 ) ( IS-CRATE ?auto_1214 ) ( not ( = ?auto_1213 ?auto_1214 ) ) ( not ( = ?auto_1212 ?auto_1213 ) ) ( not ( = ?auto_1212 ?auto_1214 ) ) ( not ( = ?auto_1222 ?auto_1215 ) ) ( HOIST-AT ?auto_1218 ?auto_1222 ) ( not ( = ?auto_1216 ?auto_1218 ) ) ( AVAILABLE ?auto_1218 ) ( SURFACE-AT ?auto_1214 ?auto_1222 ) ( ON ?auto_1214 ?auto_1217 ) ( CLEAR ?auto_1214 ) ( not ( = ?auto_1213 ?auto_1217 ) ) ( not ( = ?auto_1214 ?auto_1217 ) ) ( not ( = ?auto_1212 ?auto_1217 ) ) ( SURFACE-AT ?auto_1212 ?auto_1215 ) ( CLEAR ?auto_1212 ) ( IS-CRATE ?auto_1213 ) ( AVAILABLE ?auto_1216 ) ( TRUCK-AT ?auto_1221 ?auto_1219 ) ( not ( = ?auto_1219 ?auto_1215 ) ) ( not ( = ?auto_1222 ?auto_1219 ) ) ( HOIST-AT ?auto_1220 ?auto_1219 ) ( LIFTING ?auto_1220 ?auto_1213 ) ( not ( = ?auto_1216 ?auto_1220 ) ) ( not ( = ?auto_1218 ?auto_1220 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1213 ?auto_1214 )
      ( MAKE-2CRATE-VERIFY ?auto_1212 ?auto_1213 ?auto_1214 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1223 - SURFACE
      ?auto_1224 - SURFACE
    )
    :vars
    (
      ?auto_1225 - HOIST
      ?auto_1228 - PLACE
      ?auto_1233 - SURFACE
      ?auto_1231 - PLACE
      ?auto_1232 - HOIST
      ?auto_1226 - SURFACE
      ?auto_1229 - TRUCK
      ?auto_1227 - PLACE
      ?auto_1230 - HOIST
      ?auto_1234 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1225 ?auto_1228 ) ( IS-CRATE ?auto_1224 ) ( not ( = ?auto_1223 ?auto_1224 ) ) ( not ( = ?auto_1233 ?auto_1223 ) ) ( not ( = ?auto_1233 ?auto_1224 ) ) ( not ( = ?auto_1231 ?auto_1228 ) ) ( HOIST-AT ?auto_1232 ?auto_1231 ) ( not ( = ?auto_1225 ?auto_1232 ) ) ( AVAILABLE ?auto_1232 ) ( SURFACE-AT ?auto_1224 ?auto_1231 ) ( ON ?auto_1224 ?auto_1226 ) ( CLEAR ?auto_1224 ) ( not ( = ?auto_1223 ?auto_1226 ) ) ( not ( = ?auto_1224 ?auto_1226 ) ) ( not ( = ?auto_1233 ?auto_1226 ) ) ( SURFACE-AT ?auto_1233 ?auto_1228 ) ( CLEAR ?auto_1233 ) ( IS-CRATE ?auto_1223 ) ( AVAILABLE ?auto_1225 ) ( TRUCK-AT ?auto_1229 ?auto_1227 ) ( not ( = ?auto_1227 ?auto_1228 ) ) ( not ( = ?auto_1231 ?auto_1227 ) ) ( HOIST-AT ?auto_1230 ?auto_1227 ) ( not ( = ?auto_1225 ?auto_1230 ) ) ( not ( = ?auto_1232 ?auto_1230 ) ) ( AVAILABLE ?auto_1230 ) ( SURFACE-AT ?auto_1223 ?auto_1227 ) ( ON ?auto_1223 ?auto_1234 ) ( CLEAR ?auto_1223 ) ( not ( = ?auto_1223 ?auto_1234 ) ) ( not ( = ?auto_1224 ?auto_1234 ) ) ( not ( = ?auto_1233 ?auto_1234 ) ) ( not ( = ?auto_1226 ?auto_1234 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1230 ?auto_1223 ?auto_1234 ?auto_1227 )
      ( MAKE-2CRATE ?auto_1233 ?auto_1223 ?auto_1224 )
      ( MAKE-1CRATE-VERIFY ?auto_1223 ?auto_1224 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1235 - SURFACE
      ?auto_1236 - SURFACE
      ?auto_1237 - SURFACE
    )
    :vars
    (
      ?auto_1243 - HOIST
      ?auto_1238 - PLACE
      ?auto_1239 - PLACE
      ?auto_1245 - HOIST
      ?auto_1241 - SURFACE
      ?auto_1246 - TRUCK
      ?auto_1242 - PLACE
      ?auto_1244 - HOIST
      ?auto_1240 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1243 ?auto_1238 ) ( IS-CRATE ?auto_1237 ) ( not ( = ?auto_1236 ?auto_1237 ) ) ( not ( = ?auto_1235 ?auto_1236 ) ) ( not ( = ?auto_1235 ?auto_1237 ) ) ( not ( = ?auto_1239 ?auto_1238 ) ) ( HOIST-AT ?auto_1245 ?auto_1239 ) ( not ( = ?auto_1243 ?auto_1245 ) ) ( AVAILABLE ?auto_1245 ) ( SURFACE-AT ?auto_1237 ?auto_1239 ) ( ON ?auto_1237 ?auto_1241 ) ( CLEAR ?auto_1237 ) ( not ( = ?auto_1236 ?auto_1241 ) ) ( not ( = ?auto_1237 ?auto_1241 ) ) ( not ( = ?auto_1235 ?auto_1241 ) ) ( SURFACE-AT ?auto_1235 ?auto_1238 ) ( CLEAR ?auto_1235 ) ( IS-CRATE ?auto_1236 ) ( AVAILABLE ?auto_1243 ) ( TRUCK-AT ?auto_1246 ?auto_1242 ) ( not ( = ?auto_1242 ?auto_1238 ) ) ( not ( = ?auto_1239 ?auto_1242 ) ) ( HOIST-AT ?auto_1244 ?auto_1242 ) ( not ( = ?auto_1243 ?auto_1244 ) ) ( not ( = ?auto_1245 ?auto_1244 ) ) ( AVAILABLE ?auto_1244 ) ( SURFACE-AT ?auto_1236 ?auto_1242 ) ( ON ?auto_1236 ?auto_1240 ) ( CLEAR ?auto_1236 ) ( not ( = ?auto_1236 ?auto_1240 ) ) ( not ( = ?auto_1237 ?auto_1240 ) ) ( not ( = ?auto_1235 ?auto_1240 ) ) ( not ( = ?auto_1241 ?auto_1240 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1236 ?auto_1237 )
      ( MAKE-2CRATE-VERIFY ?auto_1235 ?auto_1236 ?auto_1237 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1247 - SURFACE
      ?auto_1248 - SURFACE
    )
    :vars
    (
      ?auto_1250 - HOIST
      ?auto_1254 - PLACE
      ?auto_1258 - SURFACE
      ?auto_1257 - PLACE
      ?auto_1255 - HOIST
      ?auto_1253 - SURFACE
      ?auto_1252 - PLACE
      ?auto_1249 - HOIST
      ?auto_1256 - SURFACE
      ?auto_1251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1250 ?auto_1254 ) ( IS-CRATE ?auto_1248 ) ( not ( = ?auto_1247 ?auto_1248 ) ) ( not ( = ?auto_1258 ?auto_1247 ) ) ( not ( = ?auto_1258 ?auto_1248 ) ) ( not ( = ?auto_1257 ?auto_1254 ) ) ( HOIST-AT ?auto_1255 ?auto_1257 ) ( not ( = ?auto_1250 ?auto_1255 ) ) ( AVAILABLE ?auto_1255 ) ( SURFACE-AT ?auto_1248 ?auto_1257 ) ( ON ?auto_1248 ?auto_1253 ) ( CLEAR ?auto_1248 ) ( not ( = ?auto_1247 ?auto_1253 ) ) ( not ( = ?auto_1248 ?auto_1253 ) ) ( not ( = ?auto_1258 ?auto_1253 ) ) ( SURFACE-AT ?auto_1258 ?auto_1254 ) ( CLEAR ?auto_1258 ) ( IS-CRATE ?auto_1247 ) ( AVAILABLE ?auto_1250 ) ( not ( = ?auto_1252 ?auto_1254 ) ) ( not ( = ?auto_1257 ?auto_1252 ) ) ( HOIST-AT ?auto_1249 ?auto_1252 ) ( not ( = ?auto_1250 ?auto_1249 ) ) ( not ( = ?auto_1255 ?auto_1249 ) ) ( AVAILABLE ?auto_1249 ) ( SURFACE-AT ?auto_1247 ?auto_1252 ) ( ON ?auto_1247 ?auto_1256 ) ( CLEAR ?auto_1247 ) ( not ( = ?auto_1247 ?auto_1256 ) ) ( not ( = ?auto_1248 ?auto_1256 ) ) ( not ( = ?auto_1258 ?auto_1256 ) ) ( not ( = ?auto_1253 ?auto_1256 ) ) ( TRUCK-AT ?auto_1251 ?auto_1254 ) )
    :subtasks
    ( ( !DRIVE ?auto_1251 ?auto_1254 ?auto_1252 )
      ( MAKE-2CRATE ?auto_1258 ?auto_1247 ?auto_1248 )
      ( MAKE-1CRATE-VERIFY ?auto_1247 ?auto_1248 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1259 - SURFACE
      ?auto_1260 - SURFACE
      ?auto_1261 - SURFACE
    )
    :vars
    (
      ?auto_1263 - HOIST
      ?auto_1270 - PLACE
      ?auto_1267 - PLACE
      ?auto_1266 - HOIST
      ?auto_1268 - SURFACE
      ?auto_1264 - PLACE
      ?auto_1262 - HOIST
      ?auto_1265 - SURFACE
      ?auto_1269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1263 ?auto_1270 ) ( IS-CRATE ?auto_1261 ) ( not ( = ?auto_1260 ?auto_1261 ) ) ( not ( = ?auto_1259 ?auto_1260 ) ) ( not ( = ?auto_1259 ?auto_1261 ) ) ( not ( = ?auto_1267 ?auto_1270 ) ) ( HOIST-AT ?auto_1266 ?auto_1267 ) ( not ( = ?auto_1263 ?auto_1266 ) ) ( AVAILABLE ?auto_1266 ) ( SURFACE-AT ?auto_1261 ?auto_1267 ) ( ON ?auto_1261 ?auto_1268 ) ( CLEAR ?auto_1261 ) ( not ( = ?auto_1260 ?auto_1268 ) ) ( not ( = ?auto_1261 ?auto_1268 ) ) ( not ( = ?auto_1259 ?auto_1268 ) ) ( SURFACE-AT ?auto_1259 ?auto_1270 ) ( CLEAR ?auto_1259 ) ( IS-CRATE ?auto_1260 ) ( AVAILABLE ?auto_1263 ) ( not ( = ?auto_1264 ?auto_1270 ) ) ( not ( = ?auto_1267 ?auto_1264 ) ) ( HOIST-AT ?auto_1262 ?auto_1264 ) ( not ( = ?auto_1263 ?auto_1262 ) ) ( not ( = ?auto_1266 ?auto_1262 ) ) ( AVAILABLE ?auto_1262 ) ( SURFACE-AT ?auto_1260 ?auto_1264 ) ( ON ?auto_1260 ?auto_1265 ) ( CLEAR ?auto_1260 ) ( not ( = ?auto_1260 ?auto_1265 ) ) ( not ( = ?auto_1261 ?auto_1265 ) ) ( not ( = ?auto_1259 ?auto_1265 ) ) ( not ( = ?auto_1268 ?auto_1265 ) ) ( TRUCK-AT ?auto_1269 ?auto_1270 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1260 ?auto_1261 )
      ( MAKE-2CRATE-VERIFY ?auto_1259 ?auto_1260 ?auto_1261 ) )
  )

)

