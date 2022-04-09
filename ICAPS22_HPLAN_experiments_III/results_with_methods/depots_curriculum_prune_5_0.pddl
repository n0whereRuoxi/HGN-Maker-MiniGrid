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
      ?auto_972 - SURFACE
      ?auto_973 - SURFACE
    )
    :vars
    (
      ?auto_974 - HOIST
      ?auto_975 - PLACE
      ?auto_977 - PLACE
      ?auto_978 - HOIST
      ?auto_979 - SURFACE
      ?auto_976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_974 ?auto_975 ) ( SURFACE-AT ?auto_972 ?auto_975 ) ( CLEAR ?auto_972 ) ( IS-CRATE ?auto_973 ) ( AVAILABLE ?auto_974 ) ( not ( = ?auto_977 ?auto_975 ) ) ( HOIST-AT ?auto_978 ?auto_977 ) ( AVAILABLE ?auto_978 ) ( SURFACE-AT ?auto_973 ?auto_977 ) ( ON ?auto_973 ?auto_979 ) ( CLEAR ?auto_973 ) ( TRUCK-AT ?auto_976 ?auto_975 ) ( not ( = ?auto_972 ?auto_973 ) ) ( not ( = ?auto_972 ?auto_979 ) ) ( not ( = ?auto_973 ?auto_979 ) ) ( not ( = ?auto_974 ?auto_978 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_976 ?auto_975 ?auto_977 )
      ( !LIFT ?auto_978 ?auto_973 ?auto_979 ?auto_977 )
      ( !LOAD ?auto_978 ?auto_973 ?auto_976 ?auto_977 )
      ( !DRIVE ?auto_976 ?auto_977 ?auto_975 )
      ( !UNLOAD ?auto_974 ?auto_973 ?auto_976 ?auto_975 )
      ( !DROP ?auto_974 ?auto_973 ?auto_972 ?auto_975 )
      ( MAKE-1CRATE-VERIFY ?auto_972 ?auto_973 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_993 - SURFACE
      ?auto_994 - SURFACE
      ?auto_995 - SURFACE
    )
    :vars
    (
      ?auto_1001 - HOIST
      ?auto_1000 - PLACE
      ?auto_997 - PLACE
      ?auto_999 - HOIST
      ?auto_996 - SURFACE
      ?auto_1002 - PLACE
      ?auto_1004 - HOIST
      ?auto_1003 - SURFACE
      ?auto_998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1001 ?auto_1000 ) ( IS-CRATE ?auto_995 ) ( not ( = ?auto_997 ?auto_1000 ) ) ( HOIST-AT ?auto_999 ?auto_997 ) ( AVAILABLE ?auto_999 ) ( SURFACE-AT ?auto_995 ?auto_997 ) ( ON ?auto_995 ?auto_996 ) ( CLEAR ?auto_995 ) ( not ( = ?auto_994 ?auto_995 ) ) ( not ( = ?auto_994 ?auto_996 ) ) ( not ( = ?auto_995 ?auto_996 ) ) ( not ( = ?auto_1001 ?auto_999 ) ) ( SURFACE-AT ?auto_993 ?auto_1000 ) ( CLEAR ?auto_993 ) ( IS-CRATE ?auto_994 ) ( AVAILABLE ?auto_1001 ) ( not ( = ?auto_1002 ?auto_1000 ) ) ( HOIST-AT ?auto_1004 ?auto_1002 ) ( AVAILABLE ?auto_1004 ) ( SURFACE-AT ?auto_994 ?auto_1002 ) ( ON ?auto_994 ?auto_1003 ) ( CLEAR ?auto_994 ) ( TRUCK-AT ?auto_998 ?auto_1000 ) ( not ( = ?auto_993 ?auto_994 ) ) ( not ( = ?auto_993 ?auto_1003 ) ) ( not ( = ?auto_994 ?auto_1003 ) ) ( not ( = ?auto_1001 ?auto_1004 ) ) ( not ( = ?auto_993 ?auto_995 ) ) ( not ( = ?auto_993 ?auto_996 ) ) ( not ( = ?auto_995 ?auto_1003 ) ) ( not ( = ?auto_997 ?auto_1002 ) ) ( not ( = ?auto_999 ?auto_1004 ) ) ( not ( = ?auto_996 ?auto_1003 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_993 ?auto_994 )
      ( MAKE-1CRATE ?auto_994 ?auto_995 )
      ( MAKE-2CRATE-VERIFY ?auto_993 ?auto_994 ?auto_995 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1019 - SURFACE
      ?auto_1020 - SURFACE
      ?auto_1021 - SURFACE
      ?auto_1022 - SURFACE
    )
    :vars
    (
      ?auto_1025 - HOIST
      ?auto_1027 - PLACE
      ?auto_1026 - PLACE
      ?auto_1023 - HOIST
      ?auto_1024 - SURFACE
      ?auto_1031 - PLACE
      ?auto_1032 - HOIST
      ?auto_1029 - SURFACE
      ?auto_1030 - PLACE
      ?auto_1034 - HOIST
      ?auto_1033 - SURFACE
      ?auto_1028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1025 ?auto_1027 ) ( IS-CRATE ?auto_1022 ) ( not ( = ?auto_1026 ?auto_1027 ) ) ( HOIST-AT ?auto_1023 ?auto_1026 ) ( AVAILABLE ?auto_1023 ) ( SURFACE-AT ?auto_1022 ?auto_1026 ) ( ON ?auto_1022 ?auto_1024 ) ( CLEAR ?auto_1022 ) ( not ( = ?auto_1021 ?auto_1022 ) ) ( not ( = ?auto_1021 ?auto_1024 ) ) ( not ( = ?auto_1022 ?auto_1024 ) ) ( not ( = ?auto_1025 ?auto_1023 ) ) ( IS-CRATE ?auto_1021 ) ( not ( = ?auto_1031 ?auto_1027 ) ) ( HOIST-AT ?auto_1032 ?auto_1031 ) ( AVAILABLE ?auto_1032 ) ( SURFACE-AT ?auto_1021 ?auto_1031 ) ( ON ?auto_1021 ?auto_1029 ) ( CLEAR ?auto_1021 ) ( not ( = ?auto_1020 ?auto_1021 ) ) ( not ( = ?auto_1020 ?auto_1029 ) ) ( not ( = ?auto_1021 ?auto_1029 ) ) ( not ( = ?auto_1025 ?auto_1032 ) ) ( SURFACE-AT ?auto_1019 ?auto_1027 ) ( CLEAR ?auto_1019 ) ( IS-CRATE ?auto_1020 ) ( AVAILABLE ?auto_1025 ) ( not ( = ?auto_1030 ?auto_1027 ) ) ( HOIST-AT ?auto_1034 ?auto_1030 ) ( AVAILABLE ?auto_1034 ) ( SURFACE-AT ?auto_1020 ?auto_1030 ) ( ON ?auto_1020 ?auto_1033 ) ( CLEAR ?auto_1020 ) ( TRUCK-AT ?auto_1028 ?auto_1027 ) ( not ( = ?auto_1019 ?auto_1020 ) ) ( not ( = ?auto_1019 ?auto_1033 ) ) ( not ( = ?auto_1020 ?auto_1033 ) ) ( not ( = ?auto_1025 ?auto_1034 ) ) ( not ( = ?auto_1019 ?auto_1021 ) ) ( not ( = ?auto_1019 ?auto_1029 ) ) ( not ( = ?auto_1021 ?auto_1033 ) ) ( not ( = ?auto_1031 ?auto_1030 ) ) ( not ( = ?auto_1032 ?auto_1034 ) ) ( not ( = ?auto_1029 ?auto_1033 ) ) ( not ( = ?auto_1019 ?auto_1022 ) ) ( not ( = ?auto_1019 ?auto_1024 ) ) ( not ( = ?auto_1020 ?auto_1022 ) ) ( not ( = ?auto_1020 ?auto_1024 ) ) ( not ( = ?auto_1022 ?auto_1029 ) ) ( not ( = ?auto_1022 ?auto_1033 ) ) ( not ( = ?auto_1026 ?auto_1031 ) ) ( not ( = ?auto_1026 ?auto_1030 ) ) ( not ( = ?auto_1023 ?auto_1032 ) ) ( not ( = ?auto_1023 ?auto_1034 ) ) ( not ( = ?auto_1024 ?auto_1029 ) ) ( not ( = ?auto_1024 ?auto_1033 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1019 ?auto_1020 ?auto_1021 )
      ( MAKE-1CRATE ?auto_1021 ?auto_1022 )
      ( MAKE-3CRATE-VERIFY ?auto_1019 ?auto_1020 ?auto_1021 ?auto_1022 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1050 - SURFACE
      ?auto_1051 - SURFACE
      ?auto_1052 - SURFACE
      ?auto_1053 - SURFACE
      ?auto_1054 - SURFACE
    )
    :vars
    (
      ?auto_1056 - HOIST
      ?auto_1060 - PLACE
      ?auto_1059 - PLACE
      ?auto_1055 - HOIST
      ?auto_1058 - SURFACE
      ?auto_1063 - SURFACE
      ?auto_1061 - PLACE
      ?auto_1065 - HOIST
      ?auto_1066 - SURFACE
      ?auto_1067 - PLACE
      ?auto_1062 - HOIST
      ?auto_1064 - SURFACE
      ?auto_1057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1056 ?auto_1060 ) ( IS-CRATE ?auto_1054 ) ( not ( = ?auto_1059 ?auto_1060 ) ) ( HOIST-AT ?auto_1055 ?auto_1059 ) ( SURFACE-AT ?auto_1054 ?auto_1059 ) ( ON ?auto_1054 ?auto_1058 ) ( CLEAR ?auto_1054 ) ( not ( = ?auto_1053 ?auto_1054 ) ) ( not ( = ?auto_1053 ?auto_1058 ) ) ( not ( = ?auto_1054 ?auto_1058 ) ) ( not ( = ?auto_1056 ?auto_1055 ) ) ( IS-CRATE ?auto_1053 ) ( AVAILABLE ?auto_1055 ) ( SURFACE-AT ?auto_1053 ?auto_1059 ) ( ON ?auto_1053 ?auto_1063 ) ( CLEAR ?auto_1053 ) ( not ( = ?auto_1052 ?auto_1053 ) ) ( not ( = ?auto_1052 ?auto_1063 ) ) ( not ( = ?auto_1053 ?auto_1063 ) ) ( IS-CRATE ?auto_1052 ) ( not ( = ?auto_1061 ?auto_1060 ) ) ( HOIST-AT ?auto_1065 ?auto_1061 ) ( AVAILABLE ?auto_1065 ) ( SURFACE-AT ?auto_1052 ?auto_1061 ) ( ON ?auto_1052 ?auto_1066 ) ( CLEAR ?auto_1052 ) ( not ( = ?auto_1051 ?auto_1052 ) ) ( not ( = ?auto_1051 ?auto_1066 ) ) ( not ( = ?auto_1052 ?auto_1066 ) ) ( not ( = ?auto_1056 ?auto_1065 ) ) ( SURFACE-AT ?auto_1050 ?auto_1060 ) ( CLEAR ?auto_1050 ) ( IS-CRATE ?auto_1051 ) ( AVAILABLE ?auto_1056 ) ( not ( = ?auto_1067 ?auto_1060 ) ) ( HOIST-AT ?auto_1062 ?auto_1067 ) ( AVAILABLE ?auto_1062 ) ( SURFACE-AT ?auto_1051 ?auto_1067 ) ( ON ?auto_1051 ?auto_1064 ) ( CLEAR ?auto_1051 ) ( TRUCK-AT ?auto_1057 ?auto_1060 ) ( not ( = ?auto_1050 ?auto_1051 ) ) ( not ( = ?auto_1050 ?auto_1064 ) ) ( not ( = ?auto_1051 ?auto_1064 ) ) ( not ( = ?auto_1056 ?auto_1062 ) ) ( not ( = ?auto_1050 ?auto_1052 ) ) ( not ( = ?auto_1050 ?auto_1066 ) ) ( not ( = ?auto_1052 ?auto_1064 ) ) ( not ( = ?auto_1061 ?auto_1067 ) ) ( not ( = ?auto_1065 ?auto_1062 ) ) ( not ( = ?auto_1066 ?auto_1064 ) ) ( not ( = ?auto_1050 ?auto_1053 ) ) ( not ( = ?auto_1050 ?auto_1063 ) ) ( not ( = ?auto_1051 ?auto_1053 ) ) ( not ( = ?auto_1051 ?auto_1063 ) ) ( not ( = ?auto_1053 ?auto_1066 ) ) ( not ( = ?auto_1053 ?auto_1064 ) ) ( not ( = ?auto_1059 ?auto_1061 ) ) ( not ( = ?auto_1059 ?auto_1067 ) ) ( not ( = ?auto_1055 ?auto_1065 ) ) ( not ( = ?auto_1055 ?auto_1062 ) ) ( not ( = ?auto_1063 ?auto_1066 ) ) ( not ( = ?auto_1063 ?auto_1064 ) ) ( not ( = ?auto_1050 ?auto_1054 ) ) ( not ( = ?auto_1050 ?auto_1058 ) ) ( not ( = ?auto_1051 ?auto_1054 ) ) ( not ( = ?auto_1051 ?auto_1058 ) ) ( not ( = ?auto_1052 ?auto_1054 ) ) ( not ( = ?auto_1052 ?auto_1058 ) ) ( not ( = ?auto_1054 ?auto_1063 ) ) ( not ( = ?auto_1054 ?auto_1066 ) ) ( not ( = ?auto_1054 ?auto_1064 ) ) ( not ( = ?auto_1058 ?auto_1063 ) ) ( not ( = ?auto_1058 ?auto_1066 ) ) ( not ( = ?auto_1058 ?auto_1064 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1050 ?auto_1051 ?auto_1052 ?auto_1053 )
      ( MAKE-1CRATE ?auto_1053 ?auto_1054 )
      ( MAKE-4CRATE-VERIFY ?auto_1050 ?auto_1051 ?auto_1052 ?auto_1053 ?auto_1054 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1084 - SURFACE
      ?auto_1085 - SURFACE
      ?auto_1086 - SURFACE
      ?auto_1087 - SURFACE
      ?auto_1088 - SURFACE
      ?auto_1089 - SURFACE
    )
    :vars
    (
      ?auto_1090 - HOIST
      ?auto_1091 - PLACE
      ?auto_1092 - PLACE
      ?auto_1093 - HOIST
      ?auto_1095 - SURFACE
      ?auto_1099 - PLACE
      ?auto_1103 - HOIST
      ?auto_1098 - SURFACE
      ?auto_1101 - SURFACE
      ?auto_1096 - PLACE
      ?auto_1102 - HOIST
      ?auto_1105 - SURFACE
      ?auto_1104 - PLACE
      ?auto_1100 - HOIST
      ?auto_1097 - SURFACE
      ?auto_1094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1090 ?auto_1091 ) ( IS-CRATE ?auto_1089 ) ( not ( = ?auto_1092 ?auto_1091 ) ) ( HOIST-AT ?auto_1093 ?auto_1092 ) ( AVAILABLE ?auto_1093 ) ( SURFACE-AT ?auto_1089 ?auto_1092 ) ( ON ?auto_1089 ?auto_1095 ) ( CLEAR ?auto_1089 ) ( not ( = ?auto_1088 ?auto_1089 ) ) ( not ( = ?auto_1088 ?auto_1095 ) ) ( not ( = ?auto_1089 ?auto_1095 ) ) ( not ( = ?auto_1090 ?auto_1093 ) ) ( IS-CRATE ?auto_1088 ) ( not ( = ?auto_1099 ?auto_1091 ) ) ( HOIST-AT ?auto_1103 ?auto_1099 ) ( SURFACE-AT ?auto_1088 ?auto_1099 ) ( ON ?auto_1088 ?auto_1098 ) ( CLEAR ?auto_1088 ) ( not ( = ?auto_1087 ?auto_1088 ) ) ( not ( = ?auto_1087 ?auto_1098 ) ) ( not ( = ?auto_1088 ?auto_1098 ) ) ( not ( = ?auto_1090 ?auto_1103 ) ) ( IS-CRATE ?auto_1087 ) ( AVAILABLE ?auto_1103 ) ( SURFACE-AT ?auto_1087 ?auto_1099 ) ( ON ?auto_1087 ?auto_1101 ) ( CLEAR ?auto_1087 ) ( not ( = ?auto_1086 ?auto_1087 ) ) ( not ( = ?auto_1086 ?auto_1101 ) ) ( not ( = ?auto_1087 ?auto_1101 ) ) ( IS-CRATE ?auto_1086 ) ( not ( = ?auto_1096 ?auto_1091 ) ) ( HOIST-AT ?auto_1102 ?auto_1096 ) ( AVAILABLE ?auto_1102 ) ( SURFACE-AT ?auto_1086 ?auto_1096 ) ( ON ?auto_1086 ?auto_1105 ) ( CLEAR ?auto_1086 ) ( not ( = ?auto_1085 ?auto_1086 ) ) ( not ( = ?auto_1085 ?auto_1105 ) ) ( not ( = ?auto_1086 ?auto_1105 ) ) ( not ( = ?auto_1090 ?auto_1102 ) ) ( SURFACE-AT ?auto_1084 ?auto_1091 ) ( CLEAR ?auto_1084 ) ( IS-CRATE ?auto_1085 ) ( AVAILABLE ?auto_1090 ) ( not ( = ?auto_1104 ?auto_1091 ) ) ( HOIST-AT ?auto_1100 ?auto_1104 ) ( AVAILABLE ?auto_1100 ) ( SURFACE-AT ?auto_1085 ?auto_1104 ) ( ON ?auto_1085 ?auto_1097 ) ( CLEAR ?auto_1085 ) ( TRUCK-AT ?auto_1094 ?auto_1091 ) ( not ( = ?auto_1084 ?auto_1085 ) ) ( not ( = ?auto_1084 ?auto_1097 ) ) ( not ( = ?auto_1085 ?auto_1097 ) ) ( not ( = ?auto_1090 ?auto_1100 ) ) ( not ( = ?auto_1084 ?auto_1086 ) ) ( not ( = ?auto_1084 ?auto_1105 ) ) ( not ( = ?auto_1086 ?auto_1097 ) ) ( not ( = ?auto_1096 ?auto_1104 ) ) ( not ( = ?auto_1102 ?auto_1100 ) ) ( not ( = ?auto_1105 ?auto_1097 ) ) ( not ( = ?auto_1084 ?auto_1087 ) ) ( not ( = ?auto_1084 ?auto_1101 ) ) ( not ( = ?auto_1085 ?auto_1087 ) ) ( not ( = ?auto_1085 ?auto_1101 ) ) ( not ( = ?auto_1087 ?auto_1105 ) ) ( not ( = ?auto_1087 ?auto_1097 ) ) ( not ( = ?auto_1099 ?auto_1096 ) ) ( not ( = ?auto_1099 ?auto_1104 ) ) ( not ( = ?auto_1103 ?auto_1102 ) ) ( not ( = ?auto_1103 ?auto_1100 ) ) ( not ( = ?auto_1101 ?auto_1105 ) ) ( not ( = ?auto_1101 ?auto_1097 ) ) ( not ( = ?auto_1084 ?auto_1088 ) ) ( not ( = ?auto_1084 ?auto_1098 ) ) ( not ( = ?auto_1085 ?auto_1088 ) ) ( not ( = ?auto_1085 ?auto_1098 ) ) ( not ( = ?auto_1086 ?auto_1088 ) ) ( not ( = ?auto_1086 ?auto_1098 ) ) ( not ( = ?auto_1088 ?auto_1101 ) ) ( not ( = ?auto_1088 ?auto_1105 ) ) ( not ( = ?auto_1088 ?auto_1097 ) ) ( not ( = ?auto_1098 ?auto_1101 ) ) ( not ( = ?auto_1098 ?auto_1105 ) ) ( not ( = ?auto_1098 ?auto_1097 ) ) ( not ( = ?auto_1084 ?auto_1089 ) ) ( not ( = ?auto_1084 ?auto_1095 ) ) ( not ( = ?auto_1085 ?auto_1089 ) ) ( not ( = ?auto_1085 ?auto_1095 ) ) ( not ( = ?auto_1086 ?auto_1089 ) ) ( not ( = ?auto_1086 ?auto_1095 ) ) ( not ( = ?auto_1087 ?auto_1089 ) ) ( not ( = ?auto_1087 ?auto_1095 ) ) ( not ( = ?auto_1089 ?auto_1098 ) ) ( not ( = ?auto_1089 ?auto_1101 ) ) ( not ( = ?auto_1089 ?auto_1105 ) ) ( not ( = ?auto_1089 ?auto_1097 ) ) ( not ( = ?auto_1092 ?auto_1099 ) ) ( not ( = ?auto_1092 ?auto_1096 ) ) ( not ( = ?auto_1092 ?auto_1104 ) ) ( not ( = ?auto_1093 ?auto_1103 ) ) ( not ( = ?auto_1093 ?auto_1102 ) ) ( not ( = ?auto_1093 ?auto_1100 ) ) ( not ( = ?auto_1095 ?auto_1098 ) ) ( not ( = ?auto_1095 ?auto_1101 ) ) ( not ( = ?auto_1095 ?auto_1105 ) ) ( not ( = ?auto_1095 ?auto_1097 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1084 ?auto_1085 ?auto_1086 ?auto_1087 ?auto_1088 )
      ( MAKE-1CRATE ?auto_1088 ?auto_1089 )
      ( MAKE-5CRATE-VERIFY ?auto_1084 ?auto_1085 ?auto_1086 ?auto_1087 ?auto_1088 ?auto_1089 ) )
  )

)

