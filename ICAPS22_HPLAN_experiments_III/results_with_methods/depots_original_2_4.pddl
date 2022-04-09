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
      ?auto_988 - SURFACE
      ?auto_989 - SURFACE
    )
    :vars
    (
      ?auto_990 - HOIST
      ?auto_991 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_990 ?auto_991 ) ( SURFACE-AT ?auto_988 ?auto_991 ) ( CLEAR ?auto_988 ) ( LIFTING ?auto_990 ?auto_989 ) ( IS-CRATE ?auto_989 ) ( not ( = ?auto_988 ?auto_989 ) ) )
    :subtasks
    ( ( !DROP ?auto_990 ?auto_989 ?auto_988 ?auto_991 )
      ( MAKE-1CRATE-VERIFY ?auto_988 ?auto_989 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_992 - SURFACE
      ?auto_993 - SURFACE
    )
    :vars
    (
      ?auto_994 - HOIST
      ?auto_995 - PLACE
      ?auto_996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_994 ?auto_995 ) ( SURFACE-AT ?auto_992 ?auto_995 ) ( CLEAR ?auto_992 ) ( IS-CRATE ?auto_993 ) ( not ( = ?auto_992 ?auto_993 ) ) ( TRUCK-AT ?auto_996 ?auto_995 ) ( AVAILABLE ?auto_994 ) ( IN ?auto_993 ?auto_996 ) )
    :subtasks
    ( ( !UNLOAD ?auto_994 ?auto_993 ?auto_996 ?auto_995 )
      ( MAKE-1CRATE ?auto_992 ?auto_993 )
      ( MAKE-1CRATE-VERIFY ?auto_992 ?auto_993 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_997 - SURFACE
      ?auto_998 - SURFACE
    )
    :vars
    (
      ?auto_999 - HOIST
      ?auto_1000 - PLACE
      ?auto_1001 - TRUCK
      ?auto_1002 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_999 ?auto_1000 ) ( SURFACE-AT ?auto_997 ?auto_1000 ) ( CLEAR ?auto_997 ) ( IS-CRATE ?auto_998 ) ( not ( = ?auto_997 ?auto_998 ) ) ( AVAILABLE ?auto_999 ) ( IN ?auto_998 ?auto_1001 ) ( TRUCK-AT ?auto_1001 ?auto_1002 ) ( not ( = ?auto_1002 ?auto_1000 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1001 ?auto_1002 ?auto_1000 )
      ( MAKE-1CRATE ?auto_997 ?auto_998 )
      ( MAKE-1CRATE-VERIFY ?auto_997 ?auto_998 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1003 - SURFACE
      ?auto_1004 - SURFACE
    )
    :vars
    (
      ?auto_1006 - HOIST
      ?auto_1007 - PLACE
      ?auto_1005 - TRUCK
      ?auto_1008 - PLACE
      ?auto_1009 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006 ?auto_1007 ) ( SURFACE-AT ?auto_1003 ?auto_1007 ) ( CLEAR ?auto_1003 ) ( IS-CRATE ?auto_1004 ) ( not ( = ?auto_1003 ?auto_1004 ) ) ( AVAILABLE ?auto_1006 ) ( TRUCK-AT ?auto_1005 ?auto_1008 ) ( not ( = ?auto_1008 ?auto_1007 ) ) ( HOIST-AT ?auto_1009 ?auto_1008 ) ( LIFTING ?auto_1009 ?auto_1004 ) ( not ( = ?auto_1006 ?auto_1009 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1009 ?auto_1004 ?auto_1005 ?auto_1008 )
      ( MAKE-1CRATE ?auto_1003 ?auto_1004 )
      ( MAKE-1CRATE-VERIFY ?auto_1003 ?auto_1004 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1010 - SURFACE
      ?auto_1011 - SURFACE
    )
    :vars
    (
      ?auto_1015 - HOIST
      ?auto_1013 - PLACE
      ?auto_1014 - TRUCK
      ?auto_1012 - PLACE
      ?auto_1016 - HOIST
      ?auto_1017 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1015 ?auto_1013 ) ( SURFACE-AT ?auto_1010 ?auto_1013 ) ( CLEAR ?auto_1010 ) ( IS-CRATE ?auto_1011 ) ( not ( = ?auto_1010 ?auto_1011 ) ) ( AVAILABLE ?auto_1015 ) ( TRUCK-AT ?auto_1014 ?auto_1012 ) ( not ( = ?auto_1012 ?auto_1013 ) ) ( HOIST-AT ?auto_1016 ?auto_1012 ) ( not ( = ?auto_1015 ?auto_1016 ) ) ( AVAILABLE ?auto_1016 ) ( SURFACE-AT ?auto_1011 ?auto_1012 ) ( ON ?auto_1011 ?auto_1017 ) ( CLEAR ?auto_1011 ) ( not ( = ?auto_1010 ?auto_1017 ) ) ( not ( = ?auto_1011 ?auto_1017 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1016 ?auto_1011 ?auto_1017 ?auto_1012 )
      ( MAKE-1CRATE ?auto_1010 ?auto_1011 )
      ( MAKE-1CRATE-VERIFY ?auto_1010 ?auto_1011 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1018 - SURFACE
      ?auto_1019 - SURFACE
    )
    :vars
    (
      ?auto_1025 - HOIST
      ?auto_1022 - PLACE
      ?auto_1021 - PLACE
      ?auto_1020 - HOIST
      ?auto_1024 - SURFACE
      ?auto_1023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1025 ?auto_1022 ) ( SURFACE-AT ?auto_1018 ?auto_1022 ) ( CLEAR ?auto_1018 ) ( IS-CRATE ?auto_1019 ) ( not ( = ?auto_1018 ?auto_1019 ) ) ( AVAILABLE ?auto_1025 ) ( not ( = ?auto_1021 ?auto_1022 ) ) ( HOIST-AT ?auto_1020 ?auto_1021 ) ( not ( = ?auto_1025 ?auto_1020 ) ) ( AVAILABLE ?auto_1020 ) ( SURFACE-AT ?auto_1019 ?auto_1021 ) ( ON ?auto_1019 ?auto_1024 ) ( CLEAR ?auto_1019 ) ( not ( = ?auto_1018 ?auto_1024 ) ) ( not ( = ?auto_1019 ?auto_1024 ) ) ( TRUCK-AT ?auto_1023 ?auto_1022 ) )
    :subtasks
    ( ( !DRIVE ?auto_1023 ?auto_1022 ?auto_1021 )
      ( MAKE-1CRATE ?auto_1018 ?auto_1019 )
      ( MAKE-1CRATE-VERIFY ?auto_1018 ?auto_1019 ) )
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
      ?auto_1034 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1033 ?auto_1034 ) ( SURFACE-AT ?auto_1031 ?auto_1034 ) ( CLEAR ?auto_1031 ) ( LIFTING ?auto_1033 ?auto_1032 ) ( IS-CRATE ?auto_1032 ) ( not ( = ?auto_1031 ?auto_1032 ) ) )
    :subtasks
    ( ( !DROP ?auto_1033 ?auto_1032 ?auto_1031 ?auto_1034 )
      ( MAKE-1CRATE-VERIFY ?auto_1031 ?auto_1032 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1035 - SURFACE
      ?auto_1036 - SURFACE
      ?auto_1037 - SURFACE
    )
    :vars
    (
      ?auto_1038 - HOIST
      ?auto_1039 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1038 ?auto_1039 ) ( SURFACE-AT ?auto_1036 ?auto_1039 ) ( CLEAR ?auto_1036 ) ( LIFTING ?auto_1038 ?auto_1037 ) ( IS-CRATE ?auto_1037 ) ( not ( = ?auto_1036 ?auto_1037 ) ) ( ON ?auto_1036 ?auto_1035 ) ( not ( = ?auto_1035 ?auto_1036 ) ) ( not ( = ?auto_1035 ?auto_1037 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1036 ?auto_1037 )
      ( MAKE-2CRATE-VERIFY ?auto_1035 ?auto_1036 ?auto_1037 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1040 - SURFACE
      ?auto_1041 - SURFACE
    )
    :vars
    (
      ?auto_1042 - HOIST
      ?auto_1043 - PLACE
      ?auto_1044 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042 ?auto_1043 ) ( SURFACE-AT ?auto_1040 ?auto_1043 ) ( CLEAR ?auto_1040 ) ( IS-CRATE ?auto_1041 ) ( not ( = ?auto_1040 ?auto_1041 ) ) ( TRUCK-AT ?auto_1044 ?auto_1043 ) ( AVAILABLE ?auto_1042 ) ( IN ?auto_1041 ?auto_1044 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1042 ?auto_1041 ?auto_1044 ?auto_1043 )
      ( MAKE-1CRATE ?auto_1040 ?auto_1041 )
      ( MAKE-1CRATE-VERIFY ?auto_1040 ?auto_1041 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1045 - SURFACE
      ?auto_1046 - SURFACE
      ?auto_1047 - SURFACE
    )
    :vars
    (
      ?auto_1049 - HOIST
      ?auto_1048 - PLACE
      ?auto_1050 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1049 ?auto_1048 ) ( SURFACE-AT ?auto_1046 ?auto_1048 ) ( CLEAR ?auto_1046 ) ( IS-CRATE ?auto_1047 ) ( not ( = ?auto_1046 ?auto_1047 ) ) ( TRUCK-AT ?auto_1050 ?auto_1048 ) ( AVAILABLE ?auto_1049 ) ( IN ?auto_1047 ?auto_1050 ) ( ON ?auto_1046 ?auto_1045 ) ( not ( = ?auto_1045 ?auto_1046 ) ) ( not ( = ?auto_1045 ?auto_1047 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1046 ?auto_1047 )
      ( MAKE-2CRATE-VERIFY ?auto_1045 ?auto_1046 ?auto_1047 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1051 - SURFACE
      ?auto_1052 - SURFACE
    )
    :vars
    (
      ?auto_1054 - HOIST
      ?auto_1056 - PLACE
      ?auto_1055 - TRUCK
      ?auto_1053 - SURFACE
      ?auto_1057 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1054 ?auto_1056 ) ( SURFACE-AT ?auto_1051 ?auto_1056 ) ( CLEAR ?auto_1051 ) ( IS-CRATE ?auto_1052 ) ( not ( = ?auto_1051 ?auto_1052 ) ) ( AVAILABLE ?auto_1054 ) ( IN ?auto_1052 ?auto_1055 ) ( ON ?auto_1051 ?auto_1053 ) ( not ( = ?auto_1053 ?auto_1051 ) ) ( not ( = ?auto_1053 ?auto_1052 ) ) ( TRUCK-AT ?auto_1055 ?auto_1057 ) ( not ( = ?auto_1057 ?auto_1056 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1055 ?auto_1057 ?auto_1056 )
      ( MAKE-2CRATE ?auto_1053 ?auto_1051 ?auto_1052 )
      ( MAKE-1CRATE-VERIFY ?auto_1051 ?auto_1052 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1058 - SURFACE
      ?auto_1059 - SURFACE
      ?auto_1060 - SURFACE
    )
    :vars
    (
      ?auto_1063 - HOIST
      ?auto_1061 - PLACE
      ?auto_1062 - TRUCK
      ?auto_1064 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1063 ?auto_1061 ) ( SURFACE-AT ?auto_1059 ?auto_1061 ) ( CLEAR ?auto_1059 ) ( IS-CRATE ?auto_1060 ) ( not ( = ?auto_1059 ?auto_1060 ) ) ( AVAILABLE ?auto_1063 ) ( IN ?auto_1060 ?auto_1062 ) ( ON ?auto_1059 ?auto_1058 ) ( not ( = ?auto_1058 ?auto_1059 ) ) ( not ( = ?auto_1058 ?auto_1060 ) ) ( TRUCK-AT ?auto_1062 ?auto_1064 ) ( not ( = ?auto_1064 ?auto_1061 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1059 ?auto_1060 )
      ( MAKE-2CRATE-VERIFY ?auto_1058 ?auto_1059 ?auto_1060 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1065 - SURFACE
      ?auto_1066 - SURFACE
    )
    :vars
    (
      ?auto_1069 - HOIST
      ?auto_1071 - PLACE
      ?auto_1070 - SURFACE
      ?auto_1067 - TRUCK
      ?auto_1068 - PLACE
      ?auto_1072 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1069 ?auto_1071 ) ( SURFACE-AT ?auto_1065 ?auto_1071 ) ( CLEAR ?auto_1065 ) ( IS-CRATE ?auto_1066 ) ( not ( = ?auto_1065 ?auto_1066 ) ) ( AVAILABLE ?auto_1069 ) ( ON ?auto_1065 ?auto_1070 ) ( not ( = ?auto_1070 ?auto_1065 ) ) ( not ( = ?auto_1070 ?auto_1066 ) ) ( TRUCK-AT ?auto_1067 ?auto_1068 ) ( not ( = ?auto_1068 ?auto_1071 ) ) ( HOIST-AT ?auto_1072 ?auto_1068 ) ( LIFTING ?auto_1072 ?auto_1066 ) ( not ( = ?auto_1069 ?auto_1072 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1072 ?auto_1066 ?auto_1067 ?auto_1068 )
      ( MAKE-2CRATE ?auto_1070 ?auto_1065 ?auto_1066 )
      ( MAKE-1CRATE-VERIFY ?auto_1065 ?auto_1066 ) )
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
      ?auto_1079 - PLACE
      ?auto_1078 - TRUCK
      ?auto_1080 - PLACE
      ?auto_1076 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1077 ?auto_1079 ) ( SURFACE-AT ?auto_1074 ?auto_1079 ) ( CLEAR ?auto_1074 ) ( IS-CRATE ?auto_1075 ) ( not ( = ?auto_1074 ?auto_1075 ) ) ( AVAILABLE ?auto_1077 ) ( ON ?auto_1074 ?auto_1073 ) ( not ( = ?auto_1073 ?auto_1074 ) ) ( not ( = ?auto_1073 ?auto_1075 ) ) ( TRUCK-AT ?auto_1078 ?auto_1080 ) ( not ( = ?auto_1080 ?auto_1079 ) ) ( HOIST-AT ?auto_1076 ?auto_1080 ) ( LIFTING ?auto_1076 ?auto_1075 ) ( not ( = ?auto_1077 ?auto_1076 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1074 ?auto_1075 )
      ( MAKE-2CRATE-VERIFY ?auto_1073 ?auto_1074 ?auto_1075 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1081 - SURFACE
      ?auto_1082 - SURFACE
    )
    :vars
    (
      ?auto_1083 - HOIST
      ?auto_1088 - PLACE
      ?auto_1087 - SURFACE
      ?auto_1085 - TRUCK
      ?auto_1086 - PLACE
      ?auto_1084 - HOIST
      ?auto_1089 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1083 ?auto_1088 ) ( SURFACE-AT ?auto_1081 ?auto_1088 ) ( CLEAR ?auto_1081 ) ( IS-CRATE ?auto_1082 ) ( not ( = ?auto_1081 ?auto_1082 ) ) ( AVAILABLE ?auto_1083 ) ( ON ?auto_1081 ?auto_1087 ) ( not ( = ?auto_1087 ?auto_1081 ) ) ( not ( = ?auto_1087 ?auto_1082 ) ) ( TRUCK-AT ?auto_1085 ?auto_1086 ) ( not ( = ?auto_1086 ?auto_1088 ) ) ( HOIST-AT ?auto_1084 ?auto_1086 ) ( not ( = ?auto_1083 ?auto_1084 ) ) ( AVAILABLE ?auto_1084 ) ( SURFACE-AT ?auto_1082 ?auto_1086 ) ( ON ?auto_1082 ?auto_1089 ) ( CLEAR ?auto_1082 ) ( not ( = ?auto_1081 ?auto_1089 ) ) ( not ( = ?auto_1082 ?auto_1089 ) ) ( not ( = ?auto_1087 ?auto_1089 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1084 ?auto_1082 ?auto_1089 ?auto_1086 )
      ( MAKE-2CRATE ?auto_1087 ?auto_1081 ?auto_1082 )
      ( MAKE-1CRATE-VERIFY ?auto_1081 ?auto_1082 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1090 - SURFACE
      ?auto_1091 - SURFACE
      ?auto_1092 - SURFACE
    )
    :vars
    (
      ?auto_1097 - HOIST
      ?auto_1095 - PLACE
      ?auto_1094 - TRUCK
      ?auto_1098 - PLACE
      ?auto_1096 - HOIST
      ?auto_1093 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1097 ?auto_1095 ) ( SURFACE-AT ?auto_1091 ?auto_1095 ) ( CLEAR ?auto_1091 ) ( IS-CRATE ?auto_1092 ) ( not ( = ?auto_1091 ?auto_1092 ) ) ( AVAILABLE ?auto_1097 ) ( ON ?auto_1091 ?auto_1090 ) ( not ( = ?auto_1090 ?auto_1091 ) ) ( not ( = ?auto_1090 ?auto_1092 ) ) ( TRUCK-AT ?auto_1094 ?auto_1098 ) ( not ( = ?auto_1098 ?auto_1095 ) ) ( HOIST-AT ?auto_1096 ?auto_1098 ) ( not ( = ?auto_1097 ?auto_1096 ) ) ( AVAILABLE ?auto_1096 ) ( SURFACE-AT ?auto_1092 ?auto_1098 ) ( ON ?auto_1092 ?auto_1093 ) ( CLEAR ?auto_1092 ) ( not ( = ?auto_1091 ?auto_1093 ) ) ( not ( = ?auto_1092 ?auto_1093 ) ) ( not ( = ?auto_1090 ?auto_1093 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1091 ?auto_1092 )
      ( MAKE-2CRATE-VERIFY ?auto_1090 ?auto_1091 ?auto_1092 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1099 - SURFACE
      ?auto_1100 - SURFACE
    )
    :vars
    (
      ?auto_1105 - HOIST
      ?auto_1104 - PLACE
      ?auto_1101 - SURFACE
      ?auto_1102 - PLACE
      ?auto_1107 - HOIST
      ?auto_1106 - SURFACE
      ?auto_1103 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1105 ?auto_1104 ) ( SURFACE-AT ?auto_1099 ?auto_1104 ) ( CLEAR ?auto_1099 ) ( IS-CRATE ?auto_1100 ) ( not ( = ?auto_1099 ?auto_1100 ) ) ( AVAILABLE ?auto_1105 ) ( ON ?auto_1099 ?auto_1101 ) ( not ( = ?auto_1101 ?auto_1099 ) ) ( not ( = ?auto_1101 ?auto_1100 ) ) ( not ( = ?auto_1102 ?auto_1104 ) ) ( HOIST-AT ?auto_1107 ?auto_1102 ) ( not ( = ?auto_1105 ?auto_1107 ) ) ( AVAILABLE ?auto_1107 ) ( SURFACE-AT ?auto_1100 ?auto_1102 ) ( ON ?auto_1100 ?auto_1106 ) ( CLEAR ?auto_1100 ) ( not ( = ?auto_1099 ?auto_1106 ) ) ( not ( = ?auto_1100 ?auto_1106 ) ) ( not ( = ?auto_1101 ?auto_1106 ) ) ( TRUCK-AT ?auto_1103 ?auto_1104 ) )
    :subtasks
    ( ( !DRIVE ?auto_1103 ?auto_1104 ?auto_1102 )
      ( MAKE-2CRATE ?auto_1101 ?auto_1099 ?auto_1100 )
      ( MAKE-1CRATE-VERIFY ?auto_1099 ?auto_1100 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1108 - SURFACE
      ?auto_1109 - SURFACE
      ?auto_1110 - SURFACE
    )
    :vars
    (
      ?auto_1112 - HOIST
      ?auto_1114 - PLACE
      ?auto_1111 - PLACE
      ?auto_1116 - HOIST
      ?auto_1113 - SURFACE
      ?auto_1115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1112 ?auto_1114 ) ( SURFACE-AT ?auto_1109 ?auto_1114 ) ( CLEAR ?auto_1109 ) ( IS-CRATE ?auto_1110 ) ( not ( = ?auto_1109 ?auto_1110 ) ) ( AVAILABLE ?auto_1112 ) ( ON ?auto_1109 ?auto_1108 ) ( not ( = ?auto_1108 ?auto_1109 ) ) ( not ( = ?auto_1108 ?auto_1110 ) ) ( not ( = ?auto_1111 ?auto_1114 ) ) ( HOIST-AT ?auto_1116 ?auto_1111 ) ( not ( = ?auto_1112 ?auto_1116 ) ) ( AVAILABLE ?auto_1116 ) ( SURFACE-AT ?auto_1110 ?auto_1111 ) ( ON ?auto_1110 ?auto_1113 ) ( CLEAR ?auto_1110 ) ( not ( = ?auto_1109 ?auto_1113 ) ) ( not ( = ?auto_1110 ?auto_1113 ) ) ( not ( = ?auto_1108 ?auto_1113 ) ) ( TRUCK-AT ?auto_1115 ?auto_1114 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1109 ?auto_1110 )
      ( MAKE-2CRATE-VERIFY ?auto_1108 ?auto_1109 ?auto_1110 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1117 - SURFACE
      ?auto_1118 - SURFACE
    )
    :vars
    (
      ?auto_1124 - HOIST
      ?auto_1119 - PLACE
      ?auto_1122 - SURFACE
      ?auto_1121 - PLACE
      ?auto_1125 - HOIST
      ?auto_1123 - SURFACE
      ?auto_1120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1124 ?auto_1119 ) ( IS-CRATE ?auto_1118 ) ( not ( = ?auto_1117 ?auto_1118 ) ) ( not ( = ?auto_1122 ?auto_1117 ) ) ( not ( = ?auto_1122 ?auto_1118 ) ) ( not ( = ?auto_1121 ?auto_1119 ) ) ( HOIST-AT ?auto_1125 ?auto_1121 ) ( not ( = ?auto_1124 ?auto_1125 ) ) ( AVAILABLE ?auto_1125 ) ( SURFACE-AT ?auto_1118 ?auto_1121 ) ( ON ?auto_1118 ?auto_1123 ) ( CLEAR ?auto_1118 ) ( not ( = ?auto_1117 ?auto_1123 ) ) ( not ( = ?auto_1118 ?auto_1123 ) ) ( not ( = ?auto_1122 ?auto_1123 ) ) ( TRUCK-AT ?auto_1120 ?auto_1119 ) ( SURFACE-AT ?auto_1122 ?auto_1119 ) ( CLEAR ?auto_1122 ) ( LIFTING ?auto_1124 ?auto_1117 ) ( IS-CRATE ?auto_1117 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1122 ?auto_1117 )
      ( MAKE-2CRATE ?auto_1122 ?auto_1117 ?auto_1118 )
      ( MAKE-1CRATE-VERIFY ?auto_1117 ?auto_1118 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1126 - SURFACE
      ?auto_1127 - SURFACE
      ?auto_1128 - SURFACE
    )
    :vars
    (
      ?auto_1130 - HOIST
      ?auto_1134 - PLACE
      ?auto_1132 - PLACE
      ?auto_1129 - HOIST
      ?auto_1133 - SURFACE
      ?auto_1131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1130 ?auto_1134 ) ( IS-CRATE ?auto_1128 ) ( not ( = ?auto_1127 ?auto_1128 ) ) ( not ( = ?auto_1126 ?auto_1127 ) ) ( not ( = ?auto_1126 ?auto_1128 ) ) ( not ( = ?auto_1132 ?auto_1134 ) ) ( HOIST-AT ?auto_1129 ?auto_1132 ) ( not ( = ?auto_1130 ?auto_1129 ) ) ( AVAILABLE ?auto_1129 ) ( SURFACE-AT ?auto_1128 ?auto_1132 ) ( ON ?auto_1128 ?auto_1133 ) ( CLEAR ?auto_1128 ) ( not ( = ?auto_1127 ?auto_1133 ) ) ( not ( = ?auto_1128 ?auto_1133 ) ) ( not ( = ?auto_1126 ?auto_1133 ) ) ( TRUCK-AT ?auto_1131 ?auto_1134 ) ( SURFACE-AT ?auto_1126 ?auto_1134 ) ( CLEAR ?auto_1126 ) ( LIFTING ?auto_1130 ?auto_1127 ) ( IS-CRATE ?auto_1127 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1127 ?auto_1128 )
      ( MAKE-2CRATE-VERIFY ?auto_1126 ?auto_1127 ?auto_1128 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1135 - SURFACE
      ?auto_1136 - SURFACE
    )
    :vars
    (
      ?auto_1143 - HOIST
      ?auto_1139 - PLACE
      ?auto_1142 - SURFACE
      ?auto_1137 - PLACE
      ?auto_1138 - HOIST
      ?auto_1140 - SURFACE
      ?auto_1141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1143 ?auto_1139 ) ( IS-CRATE ?auto_1136 ) ( not ( = ?auto_1135 ?auto_1136 ) ) ( not ( = ?auto_1142 ?auto_1135 ) ) ( not ( = ?auto_1142 ?auto_1136 ) ) ( not ( = ?auto_1137 ?auto_1139 ) ) ( HOIST-AT ?auto_1138 ?auto_1137 ) ( not ( = ?auto_1143 ?auto_1138 ) ) ( AVAILABLE ?auto_1138 ) ( SURFACE-AT ?auto_1136 ?auto_1137 ) ( ON ?auto_1136 ?auto_1140 ) ( CLEAR ?auto_1136 ) ( not ( = ?auto_1135 ?auto_1140 ) ) ( not ( = ?auto_1136 ?auto_1140 ) ) ( not ( = ?auto_1142 ?auto_1140 ) ) ( TRUCK-AT ?auto_1141 ?auto_1139 ) ( SURFACE-AT ?auto_1142 ?auto_1139 ) ( CLEAR ?auto_1142 ) ( IS-CRATE ?auto_1135 ) ( AVAILABLE ?auto_1143 ) ( IN ?auto_1135 ?auto_1141 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1143 ?auto_1135 ?auto_1141 ?auto_1139 )
      ( MAKE-2CRATE ?auto_1142 ?auto_1135 ?auto_1136 )
      ( MAKE-1CRATE-VERIFY ?auto_1135 ?auto_1136 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1144 - SURFACE
      ?auto_1145 - SURFACE
      ?auto_1146 - SURFACE
    )
    :vars
    (
      ?auto_1149 - HOIST
      ?auto_1151 - PLACE
      ?auto_1152 - PLACE
      ?auto_1150 - HOIST
      ?auto_1147 - SURFACE
      ?auto_1148 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1149 ?auto_1151 ) ( IS-CRATE ?auto_1146 ) ( not ( = ?auto_1145 ?auto_1146 ) ) ( not ( = ?auto_1144 ?auto_1145 ) ) ( not ( = ?auto_1144 ?auto_1146 ) ) ( not ( = ?auto_1152 ?auto_1151 ) ) ( HOIST-AT ?auto_1150 ?auto_1152 ) ( not ( = ?auto_1149 ?auto_1150 ) ) ( AVAILABLE ?auto_1150 ) ( SURFACE-AT ?auto_1146 ?auto_1152 ) ( ON ?auto_1146 ?auto_1147 ) ( CLEAR ?auto_1146 ) ( not ( = ?auto_1145 ?auto_1147 ) ) ( not ( = ?auto_1146 ?auto_1147 ) ) ( not ( = ?auto_1144 ?auto_1147 ) ) ( TRUCK-AT ?auto_1148 ?auto_1151 ) ( SURFACE-AT ?auto_1144 ?auto_1151 ) ( CLEAR ?auto_1144 ) ( IS-CRATE ?auto_1145 ) ( AVAILABLE ?auto_1149 ) ( IN ?auto_1145 ?auto_1148 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1145 ?auto_1146 )
      ( MAKE-2CRATE-VERIFY ?auto_1144 ?auto_1145 ?auto_1146 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1153 - SURFACE
      ?auto_1154 - SURFACE
    )
    :vars
    (
      ?auto_1159 - HOIST
      ?auto_1160 - PLACE
      ?auto_1155 - SURFACE
      ?auto_1158 - PLACE
      ?auto_1157 - HOIST
      ?auto_1161 - SURFACE
      ?auto_1156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1159 ?auto_1160 ) ( IS-CRATE ?auto_1154 ) ( not ( = ?auto_1153 ?auto_1154 ) ) ( not ( = ?auto_1155 ?auto_1153 ) ) ( not ( = ?auto_1155 ?auto_1154 ) ) ( not ( = ?auto_1158 ?auto_1160 ) ) ( HOIST-AT ?auto_1157 ?auto_1158 ) ( not ( = ?auto_1159 ?auto_1157 ) ) ( AVAILABLE ?auto_1157 ) ( SURFACE-AT ?auto_1154 ?auto_1158 ) ( ON ?auto_1154 ?auto_1161 ) ( CLEAR ?auto_1154 ) ( not ( = ?auto_1153 ?auto_1161 ) ) ( not ( = ?auto_1154 ?auto_1161 ) ) ( not ( = ?auto_1155 ?auto_1161 ) ) ( SURFACE-AT ?auto_1155 ?auto_1160 ) ( CLEAR ?auto_1155 ) ( IS-CRATE ?auto_1153 ) ( AVAILABLE ?auto_1159 ) ( IN ?auto_1153 ?auto_1156 ) ( TRUCK-AT ?auto_1156 ?auto_1158 ) )
    :subtasks
    ( ( !DRIVE ?auto_1156 ?auto_1158 ?auto_1160 )
      ( MAKE-2CRATE ?auto_1155 ?auto_1153 ?auto_1154 )
      ( MAKE-1CRATE-VERIFY ?auto_1153 ?auto_1154 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1162 - SURFACE
      ?auto_1163 - SURFACE
      ?auto_1164 - SURFACE
    )
    :vars
    (
      ?auto_1168 - HOIST
      ?auto_1165 - PLACE
      ?auto_1169 - PLACE
      ?auto_1166 - HOIST
      ?auto_1170 - SURFACE
      ?auto_1167 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1168 ?auto_1165 ) ( IS-CRATE ?auto_1164 ) ( not ( = ?auto_1163 ?auto_1164 ) ) ( not ( = ?auto_1162 ?auto_1163 ) ) ( not ( = ?auto_1162 ?auto_1164 ) ) ( not ( = ?auto_1169 ?auto_1165 ) ) ( HOIST-AT ?auto_1166 ?auto_1169 ) ( not ( = ?auto_1168 ?auto_1166 ) ) ( AVAILABLE ?auto_1166 ) ( SURFACE-AT ?auto_1164 ?auto_1169 ) ( ON ?auto_1164 ?auto_1170 ) ( CLEAR ?auto_1164 ) ( not ( = ?auto_1163 ?auto_1170 ) ) ( not ( = ?auto_1164 ?auto_1170 ) ) ( not ( = ?auto_1162 ?auto_1170 ) ) ( SURFACE-AT ?auto_1162 ?auto_1165 ) ( CLEAR ?auto_1162 ) ( IS-CRATE ?auto_1163 ) ( AVAILABLE ?auto_1168 ) ( IN ?auto_1163 ?auto_1167 ) ( TRUCK-AT ?auto_1167 ?auto_1169 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1163 ?auto_1164 )
      ( MAKE-2CRATE-VERIFY ?auto_1162 ?auto_1163 ?auto_1164 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1171 - SURFACE
      ?auto_1172 - SURFACE
    )
    :vars
    (
      ?auto_1179 - HOIST
      ?auto_1173 - PLACE
      ?auto_1178 - SURFACE
      ?auto_1174 - PLACE
      ?auto_1175 - HOIST
      ?auto_1177 - SURFACE
      ?auto_1176 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1179 ?auto_1173 ) ( IS-CRATE ?auto_1172 ) ( not ( = ?auto_1171 ?auto_1172 ) ) ( not ( = ?auto_1178 ?auto_1171 ) ) ( not ( = ?auto_1178 ?auto_1172 ) ) ( not ( = ?auto_1174 ?auto_1173 ) ) ( HOIST-AT ?auto_1175 ?auto_1174 ) ( not ( = ?auto_1179 ?auto_1175 ) ) ( SURFACE-AT ?auto_1172 ?auto_1174 ) ( ON ?auto_1172 ?auto_1177 ) ( CLEAR ?auto_1172 ) ( not ( = ?auto_1171 ?auto_1177 ) ) ( not ( = ?auto_1172 ?auto_1177 ) ) ( not ( = ?auto_1178 ?auto_1177 ) ) ( SURFACE-AT ?auto_1178 ?auto_1173 ) ( CLEAR ?auto_1178 ) ( IS-CRATE ?auto_1171 ) ( AVAILABLE ?auto_1179 ) ( TRUCK-AT ?auto_1176 ?auto_1174 ) ( LIFTING ?auto_1175 ?auto_1171 ) )
    :subtasks
    ( ( !LOAD ?auto_1175 ?auto_1171 ?auto_1176 ?auto_1174 )
      ( MAKE-2CRATE ?auto_1178 ?auto_1171 ?auto_1172 )
      ( MAKE-1CRATE-VERIFY ?auto_1171 ?auto_1172 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1180 - SURFACE
      ?auto_1181 - SURFACE
      ?auto_1182 - SURFACE
    )
    :vars
    (
      ?auto_1186 - HOIST
      ?auto_1188 - PLACE
      ?auto_1187 - PLACE
      ?auto_1185 - HOIST
      ?auto_1183 - SURFACE
      ?auto_1184 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1186 ?auto_1188 ) ( IS-CRATE ?auto_1182 ) ( not ( = ?auto_1181 ?auto_1182 ) ) ( not ( = ?auto_1180 ?auto_1181 ) ) ( not ( = ?auto_1180 ?auto_1182 ) ) ( not ( = ?auto_1187 ?auto_1188 ) ) ( HOIST-AT ?auto_1185 ?auto_1187 ) ( not ( = ?auto_1186 ?auto_1185 ) ) ( SURFACE-AT ?auto_1182 ?auto_1187 ) ( ON ?auto_1182 ?auto_1183 ) ( CLEAR ?auto_1182 ) ( not ( = ?auto_1181 ?auto_1183 ) ) ( not ( = ?auto_1182 ?auto_1183 ) ) ( not ( = ?auto_1180 ?auto_1183 ) ) ( SURFACE-AT ?auto_1180 ?auto_1188 ) ( CLEAR ?auto_1180 ) ( IS-CRATE ?auto_1181 ) ( AVAILABLE ?auto_1186 ) ( TRUCK-AT ?auto_1184 ?auto_1187 ) ( LIFTING ?auto_1185 ?auto_1181 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1181 ?auto_1182 )
      ( MAKE-2CRATE-VERIFY ?auto_1180 ?auto_1181 ?auto_1182 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1189 - SURFACE
      ?auto_1190 - SURFACE
    )
    :vars
    (
      ?auto_1191 - HOIST
      ?auto_1192 - PLACE
      ?auto_1197 - SURFACE
      ?auto_1194 - PLACE
      ?auto_1195 - HOIST
      ?auto_1193 - SURFACE
      ?auto_1196 - TRUCK
      ?auto_1198 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1191 ?auto_1192 ) ( IS-CRATE ?auto_1190 ) ( not ( = ?auto_1189 ?auto_1190 ) ) ( not ( = ?auto_1197 ?auto_1189 ) ) ( not ( = ?auto_1197 ?auto_1190 ) ) ( not ( = ?auto_1194 ?auto_1192 ) ) ( HOIST-AT ?auto_1195 ?auto_1194 ) ( not ( = ?auto_1191 ?auto_1195 ) ) ( SURFACE-AT ?auto_1190 ?auto_1194 ) ( ON ?auto_1190 ?auto_1193 ) ( CLEAR ?auto_1190 ) ( not ( = ?auto_1189 ?auto_1193 ) ) ( not ( = ?auto_1190 ?auto_1193 ) ) ( not ( = ?auto_1197 ?auto_1193 ) ) ( SURFACE-AT ?auto_1197 ?auto_1192 ) ( CLEAR ?auto_1197 ) ( IS-CRATE ?auto_1189 ) ( AVAILABLE ?auto_1191 ) ( TRUCK-AT ?auto_1196 ?auto_1194 ) ( AVAILABLE ?auto_1195 ) ( SURFACE-AT ?auto_1189 ?auto_1194 ) ( ON ?auto_1189 ?auto_1198 ) ( CLEAR ?auto_1189 ) ( not ( = ?auto_1189 ?auto_1198 ) ) ( not ( = ?auto_1190 ?auto_1198 ) ) ( not ( = ?auto_1197 ?auto_1198 ) ) ( not ( = ?auto_1193 ?auto_1198 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1195 ?auto_1189 ?auto_1198 ?auto_1194 )
      ( MAKE-2CRATE ?auto_1197 ?auto_1189 ?auto_1190 )
      ( MAKE-1CRATE-VERIFY ?auto_1189 ?auto_1190 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1199 - SURFACE
      ?auto_1200 - SURFACE
      ?auto_1201 - SURFACE
    )
    :vars
    (
      ?auto_1203 - HOIST
      ?auto_1206 - PLACE
      ?auto_1207 - PLACE
      ?auto_1202 - HOIST
      ?auto_1205 - SURFACE
      ?auto_1204 - TRUCK
      ?auto_1208 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1203 ?auto_1206 ) ( IS-CRATE ?auto_1201 ) ( not ( = ?auto_1200 ?auto_1201 ) ) ( not ( = ?auto_1199 ?auto_1200 ) ) ( not ( = ?auto_1199 ?auto_1201 ) ) ( not ( = ?auto_1207 ?auto_1206 ) ) ( HOIST-AT ?auto_1202 ?auto_1207 ) ( not ( = ?auto_1203 ?auto_1202 ) ) ( SURFACE-AT ?auto_1201 ?auto_1207 ) ( ON ?auto_1201 ?auto_1205 ) ( CLEAR ?auto_1201 ) ( not ( = ?auto_1200 ?auto_1205 ) ) ( not ( = ?auto_1201 ?auto_1205 ) ) ( not ( = ?auto_1199 ?auto_1205 ) ) ( SURFACE-AT ?auto_1199 ?auto_1206 ) ( CLEAR ?auto_1199 ) ( IS-CRATE ?auto_1200 ) ( AVAILABLE ?auto_1203 ) ( TRUCK-AT ?auto_1204 ?auto_1207 ) ( AVAILABLE ?auto_1202 ) ( SURFACE-AT ?auto_1200 ?auto_1207 ) ( ON ?auto_1200 ?auto_1208 ) ( CLEAR ?auto_1200 ) ( not ( = ?auto_1200 ?auto_1208 ) ) ( not ( = ?auto_1201 ?auto_1208 ) ) ( not ( = ?auto_1199 ?auto_1208 ) ) ( not ( = ?auto_1205 ?auto_1208 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1200 ?auto_1201 )
      ( MAKE-2CRATE-VERIFY ?auto_1199 ?auto_1200 ?auto_1201 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1209 - SURFACE
      ?auto_1210 - SURFACE
    )
    :vars
    (
      ?auto_1214 - HOIST
      ?auto_1217 - PLACE
      ?auto_1218 - SURFACE
      ?auto_1216 - PLACE
      ?auto_1212 - HOIST
      ?auto_1211 - SURFACE
      ?auto_1215 - SURFACE
      ?auto_1213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1214 ?auto_1217 ) ( IS-CRATE ?auto_1210 ) ( not ( = ?auto_1209 ?auto_1210 ) ) ( not ( = ?auto_1218 ?auto_1209 ) ) ( not ( = ?auto_1218 ?auto_1210 ) ) ( not ( = ?auto_1216 ?auto_1217 ) ) ( HOIST-AT ?auto_1212 ?auto_1216 ) ( not ( = ?auto_1214 ?auto_1212 ) ) ( SURFACE-AT ?auto_1210 ?auto_1216 ) ( ON ?auto_1210 ?auto_1211 ) ( CLEAR ?auto_1210 ) ( not ( = ?auto_1209 ?auto_1211 ) ) ( not ( = ?auto_1210 ?auto_1211 ) ) ( not ( = ?auto_1218 ?auto_1211 ) ) ( SURFACE-AT ?auto_1218 ?auto_1217 ) ( CLEAR ?auto_1218 ) ( IS-CRATE ?auto_1209 ) ( AVAILABLE ?auto_1214 ) ( AVAILABLE ?auto_1212 ) ( SURFACE-AT ?auto_1209 ?auto_1216 ) ( ON ?auto_1209 ?auto_1215 ) ( CLEAR ?auto_1209 ) ( not ( = ?auto_1209 ?auto_1215 ) ) ( not ( = ?auto_1210 ?auto_1215 ) ) ( not ( = ?auto_1218 ?auto_1215 ) ) ( not ( = ?auto_1211 ?auto_1215 ) ) ( TRUCK-AT ?auto_1213 ?auto_1217 ) )
    :subtasks
    ( ( !DRIVE ?auto_1213 ?auto_1217 ?auto_1216 )
      ( MAKE-2CRATE ?auto_1218 ?auto_1209 ?auto_1210 )
      ( MAKE-1CRATE-VERIFY ?auto_1209 ?auto_1210 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1219 - SURFACE
      ?auto_1220 - SURFACE
      ?auto_1221 - SURFACE
    )
    :vars
    (
      ?auto_1223 - HOIST
      ?auto_1222 - PLACE
      ?auto_1228 - PLACE
      ?auto_1227 - HOIST
      ?auto_1224 - SURFACE
      ?auto_1225 - SURFACE
      ?auto_1226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1223 ?auto_1222 ) ( IS-CRATE ?auto_1221 ) ( not ( = ?auto_1220 ?auto_1221 ) ) ( not ( = ?auto_1219 ?auto_1220 ) ) ( not ( = ?auto_1219 ?auto_1221 ) ) ( not ( = ?auto_1228 ?auto_1222 ) ) ( HOIST-AT ?auto_1227 ?auto_1228 ) ( not ( = ?auto_1223 ?auto_1227 ) ) ( SURFACE-AT ?auto_1221 ?auto_1228 ) ( ON ?auto_1221 ?auto_1224 ) ( CLEAR ?auto_1221 ) ( not ( = ?auto_1220 ?auto_1224 ) ) ( not ( = ?auto_1221 ?auto_1224 ) ) ( not ( = ?auto_1219 ?auto_1224 ) ) ( SURFACE-AT ?auto_1219 ?auto_1222 ) ( CLEAR ?auto_1219 ) ( IS-CRATE ?auto_1220 ) ( AVAILABLE ?auto_1223 ) ( AVAILABLE ?auto_1227 ) ( SURFACE-AT ?auto_1220 ?auto_1228 ) ( ON ?auto_1220 ?auto_1225 ) ( CLEAR ?auto_1220 ) ( not ( = ?auto_1220 ?auto_1225 ) ) ( not ( = ?auto_1221 ?auto_1225 ) ) ( not ( = ?auto_1219 ?auto_1225 ) ) ( not ( = ?auto_1224 ?auto_1225 ) ) ( TRUCK-AT ?auto_1226 ?auto_1222 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1220 ?auto_1221 )
      ( MAKE-2CRATE-VERIFY ?auto_1219 ?auto_1220 ?auto_1221 ) )
  )

)

