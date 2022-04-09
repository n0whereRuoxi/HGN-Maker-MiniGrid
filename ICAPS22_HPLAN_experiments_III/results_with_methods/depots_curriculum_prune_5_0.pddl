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
      ?auto_974 - SURFACE
      ?auto_975 - SURFACE
    )
    :vars
    (
      ?auto_976 - HOIST
      ?auto_977 - PLACE
      ?auto_979 - PLACE
      ?auto_980 - HOIST
      ?auto_981 - SURFACE
      ?auto_978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_976 ?auto_977 ) ( SURFACE-AT ?auto_974 ?auto_977 ) ( CLEAR ?auto_974 ) ( IS-CRATE ?auto_975 ) ( AVAILABLE ?auto_976 ) ( not ( = ?auto_979 ?auto_977 ) ) ( HOIST-AT ?auto_980 ?auto_979 ) ( AVAILABLE ?auto_980 ) ( SURFACE-AT ?auto_975 ?auto_979 ) ( ON ?auto_975 ?auto_981 ) ( CLEAR ?auto_975 ) ( TRUCK-AT ?auto_978 ?auto_977 ) ( not ( = ?auto_974 ?auto_975 ) ) ( not ( = ?auto_974 ?auto_981 ) ) ( not ( = ?auto_975 ?auto_981 ) ) ( not ( = ?auto_976 ?auto_980 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_978 ?auto_977 ?auto_979 )
      ( !LIFT ?auto_980 ?auto_975 ?auto_981 ?auto_979 )
      ( !LOAD ?auto_980 ?auto_975 ?auto_978 ?auto_979 )
      ( !DRIVE ?auto_978 ?auto_979 ?auto_977 )
      ( !UNLOAD ?auto_976 ?auto_975 ?auto_978 ?auto_977 )
      ( !DROP ?auto_976 ?auto_975 ?auto_974 ?auto_977 )
      ( MAKE-1CRATE-VERIFY ?auto_974 ?auto_975 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_995 - SURFACE
      ?auto_996 - SURFACE
      ?auto_997 - SURFACE
    )
    :vars
    (
      ?auto_999 - HOIST
      ?auto_1002 - PLACE
      ?auto_1000 - PLACE
      ?auto_1003 - HOIST
      ?auto_1001 - SURFACE
      ?auto_1004 - SURFACE
      ?auto_998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_999 ?auto_1002 ) ( IS-CRATE ?auto_997 ) ( not ( = ?auto_1000 ?auto_1002 ) ) ( HOIST-AT ?auto_1003 ?auto_1000 ) ( SURFACE-AT ?auto_997 ?auto_1000 ) ( ON ?auto_997 ?auto_1001 ) ( CLEAR ?auto_997 ) ( not ( = ?auto_996 ?auto_997 ) ) ( not ( = ?auto_996 ?auto_1001 ) ) ( not ( = ?auto_997 ?auto_1001 ) ) ( not ( = ?auto_999 ?auto_1003 ) ) ( SURFACE-AT ?auto_995 ?auto_1002 ) ( CLEAR ?auto_995 ) ( IS-CRATE ?auto_996 ) ( AVAILABLE ?auto_999 ) ( AVAILABLE ?auto_1003 ) ( SURFACE-AT ?auto_996 ?auto_1000 ) ( ON ?auto_996 ?auto_1004 ) ( CLEAR ?auto_996 ) ( TRUCK-AT ?auto_998 ?auto_1002 ) ( not ( = ?auto_995 ?auto_996 ) ) ( not ( = ?auto_995 ?auto_1004 ) ) ( not ( = ?auto_996 ?auto_1004 ) ) ( not ( = ?auto_995 ?auto_997 ) ) ( not ( = ?auto_995 ?auto_1001 ) ) ( not ( = ?auto_997 ?auto_1004 ) ) ( not ( = ?auto_1001 ?auto_1004 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_995 ?auto_996 )
      ( MAKE-1CRATE ?auto_996 ?auto_997 )
      ( MAKE-2CRATE-VERIFY ?auto_995 ?auto_996 ?auto_997 ) )
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
      ?auto_1023 - HOIST
      ?auto_1024 - PLACE
      ?auto_1027 - PLACE
      ?auto_1028 - HOIST
      ?auto_1026 - SURFACE
      ?auto_1031 - PLACE
      ?auto_1032 - HOIST
      ?auto_1029 - SURFACE
      ?auto_1030 - SURFACE
      ?auto_1025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1023 ?auto_1024 ) ( IS-CRATE ?auto_1022 ) ( not ( = ?auto_1027 ?auto_1024 ) ) ( HOIST-AT ?auto_1028 ?auto_1027 ) ( AVAILABLE ?auto_1028 ) ( SURFACE-AT ?auto_1022 ?auto_1027 ) ( ON ?auto_1022 ?auto_1026 ) ( CLEAR ?auto_1022 ) ( not ( = ?auto_1021 ?auto_1022 ) ) ( not ( = ?auto_1021 ?auto_1026 ) ) ( not ( = ?auto_1022 ?auto_1026 ) ) ( not ( = ?auto_1023 ?auto_1028 ) ) ( IS-CRATE ?auto_1021 ) ( not ( = ?auto_1031 ?auto_1024 ) ) ( HOIST-AT ?auto_1032 ?auto_1031 ) ( SURFACE-AT ?auto_1021 ?auto_1031 ) ( ON ?auto_1021 ?auto_1029 ) ( CLEAR ?auto_1021 ) ( not ( = ?auto_1020 ?auto_1021 ) ) ( not ( = ?auto_1020 ?auto_1029 ) ) ( not ( = ?auto_1021 ?auto_1029 ) ) ( not ( = ?auto_1023 ?auto_1032 ) ) ( SURFACE-AT ?auto_1019 ?auto_1024 ) ( CLEAR ?auto_1019 ) ( IS-CRATE ?auto_1020 ) ( AVAILABLE ?auto_1023 ) ( AVAILABLE ?auto_1032 ) ( SURFACE-AT ?auto_1020 ?auto_1031 ) ( ON ?auto_1020 ?auto_1030 ) ( CLEAR ?auto_1020 ) ( TRUCK-AT ?auto_1025 ?auto_1024 ) ( not ( = ?auto_1019 ?auto_1020 ) ) ( not ( = ?auto_1019 ?auto_1030 ) ) ( not ( = ?auto_1020 ?auto_1030 ) ) ( not ( = ?auto_1019 ?auto_1021 ) ) ( not ( = ?auto_1019 ?auto_1029 ) ) ( not ( = ?auto_1021 ?auto_1030 ) ) ( not ( = ?auto_1029 ?auto_1030 ) ) ( not ( = ?auto_1019 ?auto_1022 ) ) ( not ( = ?auto_1019 ?auto_1026 ) ) ( not ( = ?auto_1020 ?auto_1022 ) ) ( not ( = ?auto_1020 ?auto_1026 ) ) ( not ( = ?auto_1022 ?auto_1029 ) ) ( not ( = ?auto_1022 ?auto_1030 ) ) ( not ( = ?auto_1027 ?auto_1031 ) ) ( not ( = ?auto_1028 ?auto_1032 ) ) ( not ( = ?auto_1026 ?auto_1029 ) ) ( not ( = ?auto_1026 ?auto_1030 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1019 ?auto_1020 ?auto_1021 )
      ( MAKE-1CRATE ?auto_1021 ?auto_1022 )
      ( MAKE-3CRATE-VERIFY ?auto_1019 ?auto_1020 ?auto_1021 ?auto_1022 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1048 - SURFACE
      ?auto_1049 - SURFACE
      ?auto_1050 - SURFACE
      ?auto_1051 - SURFACE
      ?auto_1052 - SURFACE
    )
    :vars
    (
      ?auto_1058 - HOIST
      ?auto_1056 - PLACE
      ?auto_1055 - PLACE
      ?auto_1054 - HOIST
      ?auto_1053 - SURFACE
      ?auto_1059 - PLACE
      ?auto_1061 - HOIST
      ?auto_1060 - SURFACE
      ?auto_1062 - SURFACE
      ?auto_1063 - SURFACE
      ?auto_1057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1058 ?auto_1056 ) ( IS-CRATE ?auto_1052 ) ( not ( = ?auto_1055 ?auto_1056 ) ) ( HOIST-AT ?auto_1054 ?auto_1055 ) ( SURFACE-AT ?auto_1052 ?auto_1055 ) ( ON ?auto_1052 ?auto_1053 ) ( CLEAR ?auto_1052 ) ( not ( = ?auto_1051 ?auto_1052 ) ) ( not ( = ?auto_1051 ?auto_1053 ) ) ( not ( = ?auto_1052 ?auto_1053 ) ) ( not ( = ?auto_1058 ?auto_1054 ) ) ( IS-CRATE ?auto_1051 ) ( not ( = ?auto_1059 ?auto_1056 ) ) ( HOIST-AT ?auto_1061 ?auto_1059 ) ( AVAILABLE ?auto_1061 ) ( SURFACE-AT ?auto_1051 ?auto_1059 ) ( ON ?auto_1051 ?auto_1060 ) ( CLEAR ?auto_1051 ) ( not ( = ?auto_1050 ?auto_1051 ) ) ( not ( = ?auto_1050 ?auto_1060 ) ) ( not ( = ?auto_1051 ?auto_1060 ) ) ( not ( = ?auto_1058 ?auto_1061 ) ) ( IS-CRATE ?auto_1050 ) ( SURFACE-AT ?auto_1050 ?auto_1055 ) ( ON ?auto_1050 ?auto_1062 ) ( CLEAR ?auto_1050 ) ( not ( = ?auto_1049 ?auto_1050 ) ) ( not ( = ?auto_1049 ?auto_1062 ) ) ( not ( = ?auto_1050 ?auto_1062 ) ) ( SURFACE-AT ?auto_1048 ?auto_1056 ) ( CLEAR ?auto_1048 ) ( IS-CRATE ?auto_1049 ) ( AVAILABLE ?auto_1058 ) ( AVAILABLE ?auto_1054 ) ( SURFACE-AT ?auto_1049 ?auto_1055 ) ( ON ?auto_1049 ?auto_1063 ) ( CLEAR ?auto_1049 ) ( TRUCK-AT ?auto_1057 ?auto_1056 ) ( not ( = ?auto_1048 ?auto_1049 ) ) ( not ( = ?auto_1048 ?auto_1063 ) ) ( not ( = ?auto_1049 ?auto_1063 ) ) ( not ( = ?auto_1048 ?auto_1050 ) ) ( not ( = ?auto_1048 ?auto_1062 ) ) ( not ( = ?auto_1050 ?auto_1063 ) ) ( not ( = ?auto_1062 ?auto_1063 ) ) ( not ( = ?auto_1048 ?auto_1051 ) ) ( not ( = ?auto_1048 ?auto_1060 ) ) ( not ( = ?auto_1049 ?auto_1051 ) ) ( not ( = ?auto_1049 ?auto_1060 ) ) ( not ( = ?auto_1051 ?auto_1062 ) ) ( not ( = ?auto_1051 ?auto_1063 ) ) ( not ( = ?auto_1059 ?auto_1055 ) ) ( not ( = ?auto_1061 ?auto_1054 ) ) ( not ( = ?auto_1060 ?auto_1062 ) ) ( not ( = ?auto_1060 ?auto_1063 ) ) ( not ( = ?auto_1048 ?auto_1052 ) ) ( not ( = ?auto_1048 ?auto_1053 ) ) ( not ( = ?auto_1049 ?auto_1052 ) ) ( not ( = ?auto_1049 ?auto_1053 ) ) ( not ( = ?auto_1050 ?auto_1052 ) ) ( not ( = ?auto_1050 ?auto_1053 ) ) ( not ( = ?auto_1052 ?auto_1060 ) ) ( not ( = ?auto_1052 ?auto_1062 ) ) ( not ( = ?auto_1052 ?auto_1063 ) ) ( not ( = ?auto_1053 ?auto_1060 ) ) ( not ( = ?auto_1053 ?auto_1062 ) ) ( not ( = ?auto_1053 ?auto_1063 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1048 ?auto_1049 ?auto_1050 ?auto_1051 )
      ( MAKE-1CRATE ?auto_1051 ?auto_1052 )
      ( MAKE-4CRATE-VERIFY ?auto_1048 ?auto_1049 ?auto_1050 ?auto_1051 ?auto_1052 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1080 - SURFACE
      ?auto_1081 - SURFACE
      ?auto_1082 - SURFACE
      ?auto_1083 - SURFACE
      ?auto_1084 - SURFACE
      ?auto_1085 - SURFACE
    )
    :vars
    (
      ?auto_1090 - HOIST
      ?auto_1087 - PLACE
      ?auto_1086 - PLACE
      ?auto_1089 - HOIST
      ?auto_1091 - SURFACE
      ?auto_1092 - SURFACE
      ?auto_1096 - PLACE
      ?auto_1097 - HOIST
      ?auto_1094 - SURFACE
      ?auto_1095 - SURFACE
      ?auto_1093 - SURFACE
      ?auto_1088 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1090 ?auto_1087 ) ( IS-CRATE ?auto_1085 ) ( not ( = ?auto_1086 ?auto_1087 ) ) ( HOIST-AT ?auto_1089 ?auto_1086 ) ( SURFACE-AT ?auto_1085 ?auto_1086 ) ( ON ?auto_1085 ?auto_1091 ) ( CLEAR ?auto_1085 ) ( not ( = ?auto_1084 ?auto_1085 ) ) ( not ( = ?auto_1084 ?auto_1091 ) ) ( not ( = ?auto_1085 ?auto_1091 ) ) ( not ( = ?auto_1090 ?auto_1089 ) ) ( IS-CRATE ?auto_1084 ) ( SURFACE-AT ?auto_1084 ?auto_1086 ) ( ON ?auto_1084 ?auto_1092 ) ( CLEAR ?auto_1084 ) ( not ( = ?auto_1083 ?auto_1084 ) ) ( not ( = ?auto_1083 ?auto_1092 ) ) ( not ( = ?auto_1084 ?auto_1092 ) ) ( IS-CRATE ?auto_1083 ) ( not ( = ?auto_1096 ?auto_1087 ) ) ( HOIST-AT ?auto_1097 ?auto_1096 ) ( AVAILABLE ?auto_1097 ) ( SURFACE-AT ?auto_1083 ?auto_1096 ) ( ON ?auto_1083 ?auto_1094 ) ( CLEAR ?auto_1083 ) ( not ( = ?auto_1082 ?auto_1083 ) ) ( not ( = ?auto_1082 ?auto_1094 ) ) ( not ( = ?auto_1083 ?auto_1094 ) ) ( not ( = ?auto_1090 ?auto_1097 ) ) ( IS-CRATE ?auto_1082 ) ( SURFACE-AT ?auto_1082 ?auto_1086 ) ( ON ?auto_1082 ?auto_1095 ) ( CLEAR ?auto_1082 ) ( not ( = ?auto_1081 ?auto_1082 ) ) ( not ( = ?auto_1081 ?auto_1095 ) ) ( not ( = ?auto_1082 ?auto_1095 ) ) ( SURFACE-AT ?auto_1080 ?auto_1087 ) ( CLEAR ?auto_1080 ) ( IS-CRATE ?auto_1081 ) ( AVAILABLE ?auto_1090 ) ( AVAILABLE ?auto_1089 ) ( SURFACE-AT ?auto_1081 ?auto_1086 ) ( ON ?auto_1081 ?auto_1093 ) ( CLEAR ?auto_1081 ) ( TRUCK-AT ?auto_1088 ?auto_1087 ) ( not ( = ?auto_1080 ?auto_1081 ) ) ( not ( = ?auto_1080 ?auto_1093 ) ) ( not ( = ?auto_1081 ?auto_1093 ) ) ( not ( = ?auto_1080 ?auto_1082 ) ) ( not ( = ?auto_1080 ?auto_1095 ) ) ( not ( = ?auto_1082 ?auto_1093 ) ) ( not ( = ?auto_1095 ?auto_1093 ) ) ( not ( = ?auto_1080 ?auto_1083 ) ) ( not ( = ?auto_1080 ?auto_1094 ) ) ( not ( = ?auto_1081 ?auto_1083 ) ) ( not ( = ?auto_1081 ?auto_1094 ) ) ( not ( = ?auto_1083 ?auto_1095 ) ) ( not ( = ?auto_1083 ?auto_1093 ) ) ( not ( = ?auto_1096 ?auto_1086 ) ) ( not ( = ?auto_1097 ?auto_1089 ) ) ( not ( = ?auto_1094 ?auto_1095 ) ) ( not ( = ?auto_1094 ?auto_1093 ) ) ( not ( = ?auto_1080 ?auto_1084 ) ) ( not ( = ?auto_1080 ?auto_1092 ) ) ( not ( = ?auto_1081 ?auto_1084 ) ) ( not ( = ?auto_1081 ?auto_1092 ) ) ( not ( = ?auto_1082 ?auto_1084 ) ) ( not ( = ?auto_1082 ?auto_1092 ) ) ( not ( = ?auto_1084 ?auto_1094 ) ) ( not ( = ?auto_1084 ?auto_1095 ) ) ( not ( = ?auto_1084 ?auto_1093 ) ) ( not ( = ?auto_1092 ?auto_1094 ) ) ( not ( = ?auto_1092 ?auto_1095 ) ) ( not ( = ?auto_1092 ?auto_1093 ) ) ( not ( = ?auto_1080 ?auto_1085 ) ) ( not ( = ?auto_1080 ?auto_1091 ) ) ( not ( = ?auto_1081 ?auto_1085 ) ) ( not ( = ?auto_1081 ?auto_1091 ) ) ( not ( = ?auto_1082 ?auto_1085 ) ) ( not ( = ?auto_1082 ?auto_1091 ) ) ( not ( = ?auto_1083 ?auto_1085 ) ) ( not ( = ?auto_1083 ?auto_1091 ) ) ( not ( = ?auto_1085 ?auto_1092 ) ) ( not ( = ?auto_1085 ?auto_1094 ) ) ( not ( = ?auto_1085 ?auto_1095 ) ) ( not ( = ?auto_1085 ?auto_1093 ) ) ( not ( = ?auto_1091 ?auto_1092 ) ) ( not ( = ?auto_1091 ?auto_1094 ) ) ( not ( = ?auto_1091 ?auto_1095 ) ) ( not ( = ?auto_1091 ?auto_1093 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1080 ?auto_1081 ?auto_1082 ?auto_1083 ?auto_1084 )
      ( MAKE-1CRATE ?auto_1084 ?auto_1085 )
      ( MAKE-5CRATE-VERIFY ?auto_1080 ?auto_1081 ?auto_1082 ?auto_1083 ?auto_1084 ?auto_1085 ) )
  )

)

