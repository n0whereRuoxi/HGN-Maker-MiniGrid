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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_984 - SURFACE
      ?auto_985 - SURFACE
    )
    :vars
    (
      ?auto_986 - HOIST
      ?auto_987 - PLACE
      ?auto_989 - PLACE
      ?auto_990 - HOIST
      ?auto_991 - SURFACE
      ?auto_988 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_986 ?auto_987 ) ( SURFACE-AT ?auto_984 ?auto_987 ) ( CLEAR ?auto_984 ) ( IS-CRATE ?auto_985 ) ( AVAILABLE ?auto_986 ) ( not ( = ?auto_989 ?auto_987 ) ) ( HOIST-AT ?auto_990 ?auto_989 ) ( AVAILABLE ?auto_990 ) ( SURFACE-AT ?auto_985 ?auto_989 ) ( ON ?auto_985 ?auto_991 ) ( CLEAR ?auto_985 ) ( TRUCK-AT ?auto_988 ?auto_987 ) ( not ( = ?auto_984 ?auto_985 ) ) ( not ( = ?auto_984 ?auto_991 ) ) ( not ( = ?auto_985 ?auto_991 ) ) ( not ( = ?auto_986 ?auto_990 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_988 ?auto_987 ?auto_989 )
      ( !LIFT ?auto_990 ?auto_985 ?auto_991 ?auto_989 )
      ( !LOAD ?auto_990 ?auto_985 ?auto_988 ?auto_989 )
      ( !DRIVE ?auto_988 ?auto_989 ?auto_987 )
      ( !UNLOAD ?auto_986 ?auto_985 ?auto_988 ?auto_987 )
      ( !DROP ?auto_986 ?auto_985 ?auto_984 ?auto_987 )
      ( MAKE-1CRATE-VERIFY ?auto_984 ?auto_985 ) )
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
      ?auto_1000 - HOIST
      ?auto_999 - PLACE
      ?auto_1001 - PLACE
      ?auto_998 - HOIST
      ?auto_1003 - SURFACE
      ?auto_1004 - SURFACE
      ?auto_1002 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1000 ?auto_999 ) ( IS-CRATE ?auto_997 ) ( not ( = ?auto_1001 ?auto_999 ) ) ( HOIST-AT ?auto_998 ?auto_1001 ) ( SURFACE-AT ?auto_997 ?auto_1001 ) ( ON ?auto_997 ?auto_1003 ) ( CLEAR ?auto_997 ) ( not ( = ?auto_996 ?auto_997 ) ) ( not ( = ?auto_996 ?auto_1003 ) ) ( not ( = ?auto_997 ?auto_1003 ) ) ( not ( = ?auto_1000 ?auto_998 ) ) ( SURFACE-AT ?auto_995 ?auto_999 ) ( CLEAR ?auto_995 ) ( IS-CRATE ?auto_996 ) ( AVAILABLE ?auto_1000 ) ( AVAILABLE ?auto_998 ) ( SURFACE-AT ?auto_996 ?auto_1001 ) ( ON ?auto_996 ?auto_1004 ) ( CLEAR ?auto_996 ) ( TRUCK-AT ?auto_1002 ?auto_999 ) ( not ( = ?auto_995 ?auto_996 ) ) ( not ( = ?auto_995 ?auto_1004 ) ) ( not ( = ?auto_996 ?auto_1004 ) ) ( not ( = ?auto_995 ?auto_997 ) ) ( not ( = ?auto_995 ?auto_1003 ) ) ( not ( = ?auto_997 ?auto_1004 ) ) ( not ( = ?auto_1003 ?auto_1004 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_995 ?auto_996 )
      ( MAKE-1CRATE ?auto_996 ?auto_997 )
      ( MAKE-2CRATE-VERIFY ?auto_995 ?auto_996 ?auto_997 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1007 - SURFACE
      ?auto_1008 - SURFACE
    )
    :vars
    (
      ?auto_1009 - HOIST
      ?auto_1010 - PLACE
      ?auto_1012 - PLACE
      ?auto_1013 - HOIST
      ?auto_1014 - SURFACE
      ?auto_1011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1009 ?auto_1010 ) ( SURFACE-AT ?auto_1007 ?auto_1010 ) ( CLEAR ?auto_1007 ) ( IS-CRATE ?auto_1008 ) ( AVAILABLE ?auto_1009 ) ( not ( = ?auto_1012 ?auto_1010 ) ) ( HOIST-AT ?auto_1013 ?auto_1012 ) ( AVAILABLE ?auto_1013 ) ( SURFACE-AT ?auto_1008 ?auto_1012 ) ( ON ?auto_1008 ?auto_1014 ) ( CLEAR ?auto_1008 ) ( TRUCK-AT ?auto_1011 ?auto_1010 ) ( not ( = ?auto_1007 ?auto_1008 ) ) ( not ( = ?auto_1007 ?auto_1014 ) ) ( not ( = ?auto_1008 ?auto_1014 ) ) ( not ( = ?auto_1009 ?auto_1013 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1011 ?auto_1010 ?auto_1012 )
      ( !LIFT ?auto_1013 ?auto_1008 ?auto_1014 ?auto_1012 )
      ( !LOAD ?auto_1013 ?auto_1008 ?auto_1011 ?auto_1012 )
      ( !DRIVE ?auto_1011 ?auto_1012 ?auto_1010 )
      ( !UNLOAD ?auto_1009 ?auto_1008 ?auto_1011 ?auto_1010 )
      ( !DROP ?auto_1009 ?auto_1008 ?auto_1007 ?auto_1010 )
      ( MAKE-1CRATE-VERIFY ?auto_1007 ?auto_1008 ) )
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
      ?auto_1028 - HOIST
      ?auto_1027 - PLACE
      ?auto_1026 - PLACE
      ?auto_1023 - HOIST
      ?auto_1024 - SURFACE
      ?auto_1030 - PLACE
      ?auto_1031 - HOIST
      ?auto_1029 - SURFACE
      ?auto_1032 - SURFACE
      ?auto_1025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1028 ?auto_1027 ) ( IS-CRATE ?auto_1022 ) ( not ( = ?auto_1026 ?auto_1027 ) ) ( HOIST-AT ?auto_1023 ?auto_1026 ) ( AVAILABLE ?auto_1023 ) ( SURFACE-AT ?auto_1022 ?auto_1026 ) ( ON ?auto_1022 ?auto_1024 ) ( CLEAR ?auto_1022 ) ( not ( = ?auto_1021 ?auto_1022 ) ) ( not ( = ?auto_1021 ?auto_1024 ) ) ( not ( = ?auto_1022 ?auto_1024 ) ) ( not ( = ?auto_1028 ?auto_1023 ) ) ( IS-CRATE ?auto_1021 ) ( not ( = ?auto_1030 ?auto_1027 ) ) ( HOIST-AT ?auto_1031 ?auto_1030 ) ( SURFACE-AT ?auto_1021 ?auto_1030 ) ( ON ?auto_1021 ?auto_1029 ) ( CLEAR ?auto_1021 ) ( not ( = ?auto_1020 ?auto_1021 ) ) ( not ( = ?auto_1020 ?auto_1029 ) ) ( not ( = ?auto_1021 ?auto_1029 ) ) ( not ( = ?auto_1028 ?auto_1031 ) ) ( SURFACE-AT ?auto_1019 ?auto_1027 ) ( CLEAR ?auto_1019 ) ( IS-CRATE ?auto_1020 ) ( AVAILABLE ?auto_1028 ) ( AVAILABLE ?auto_1031 ) ( SURFACE-AT ?auto_1020 ?auto_1030 ) ( ON ?auto_1020 ?auto_1032 ) ( CLEAR ?auto_1020 ) ( TRUCK-AT ?auto_1025 ?auto_1027 ) ( not ( = ?auto_1019 ?auto_1020 ) ) ( not ( = ?auto_1019 ?auto_1032 ) ) ( not ( = ?auto_1020 ?auto_1032 ) ) ( not ( = ?auto_1019 ?auto_1021 ) ) ( not ( = ?auto_1019 ?auto_1029 ) ) ( not ( = ?auto_1021 ?auto_1032 ) ) ( not ( = ?auto_1029 ?auto_1032 ) ) ( not ( = ?auto_1019 ?auto_1022 ) ) ( not ( = ?auto_1019 ?auto_1024 ) ) ( not ( = ?auto_1020 ?auto_1022 ) ) ( not ( = ?auto_1020 ?auto_1024 ) ) ( not ( = ?auto_1022 ?auto_1029 ) ) ( not ( = ?auto_1022 ?auto_1032 ) ) ( not ( = ?auto_1026 ?auto_1030 ) ) ( not ( = ?auto_1023 ?auto_1031 ) ) ( not ( = ?auto_1024 ?auto_1029 ) ) ( not ( = ?auto_1024 ?auto_1032 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1019 ?auto_1020 ?auto_1021 )
      ( MAKE-1CRATE ?auto_1021 ?auto_1022 )
      ( MAKE-3CRATE-VERIFY ?auto_1019 ?auto_1020 ?auto_1021 ?auto_1022 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1035 - SURFACE
      ?auto_1036 - SURFACE
    )
    :vars
    (
      ?auto_1037 - HOIST
      ?auto_1038 - PLACE
      ?auto_1040 - PLACE
      ?auto_1041 - HOIST
      ?auto_1042 - SURFACE
      ?auto_1039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1037 ?auto_1038 ) ( SURFACE-AT ?auto_1035 ?auto_1038 ) ( CLEAR ?auto_1035 ) ( IS-CRATE ?auto_1036 ) ( AVAILABLE ?auto_1037 ) ( not ( = ?auto_1040 ?auto_1038 ) ) ( HOIST-AT ?auto_1041 ?auto_1040 ) ( AVAILABLE ?auto_1041 ) ( SURFACE-AT ?auto_1036 ?auto_1040 ) ( ON ?auto_1036 ?auto_1042 ) ( CLEAR ?auto_1036 ) ( TRUCK-AT ?auto_1039 ?auto_1038 ) ( not ( = ?auto_1035 ?auto_1036 ) ) ( not ( = ?auto_1035 ?auto_1042 ) ) ( not ( = ?auto_1036 ?auto_1042 ) ) ( not ( = ?auto_1037 ?auto_1041 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1039 ?auto_1038 ?auto_1040 )
      ( !LIFT ?auto_1041 ?auto_1036 ?auto_1042 ?auto_1040 )
      ( !LOAD ?auto_1041 ?auto_1036 ?auto_1039 ?auto_1040 )
      ( !DRIVE ?auto_1039 ?auto_1040 ?auto_1038 )
      ( !UNLOAD ?auto_1037 ?auto_1036 ?auto_1039 ?auto_1038 )
      ( !DROP ?auto_1037 ?auto_1036 ?auto_1035 ?auto_1038 )
      ( MAKE-1CRATE-VERIFY ?auto_1035 ?auto_1036 ) )
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
      ?auto_1055 - HOIST
      ?auto_1053 - PLACE
      ?auto_1056 - PLACE
      ?auto_1057 - HOIST
      ?auto_1058 - SURFACE
      ?auto_1060 - PLACE
      ?auto_1061 - HOIST
      ?auto_1059 - SURFACE
      ?auto_1063 - SURFACE
      ?auto_1062 - SURFACE
      ?auto_1054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1055 ?auto_1053 ) ( IS-CRATE ?auto_1052 ) ( not ( = ?auto_1056 ?auto_1053 ) ) ( HOIST-AT ?auto_1057 ?auto_1056 ) ( SURFACE-AT ?auto_1052 ?auto_1056 ) ( ON ?auto_1052 ?auto_1058 ) ( CLEAR ?auto_1052 ) ( not ( = ?auto_1051 ?auto_1052 ) ) ( not ( = ?auto_1051 ?auto_1058 ) ) ( not ( = ?auto_1052 ?auto_1058 ) ) ( not ( = ?auto_1055 ?auto_1057 ) ) ( IS-CRATE ?auto_1051 ) ( not ( = ?auto_1060 ?auto_1053 ) ) ( HOIST-AT ?auto_1061 ?auto_1060 ) ( AVAILABLE ?auto_1061 ) ( SURFACE-AT ?auto_1051 ?auto_1060 ) ( ON ?auto_1051 ?auto_1059 ) ( CLEAR ?auto_1051 ) ( not ( = ?auto_1050 ?auto_1051 ) ) ( not ( = ?auto_1050 ?auto_1059 ) ) ( not ( = ?auto_1051 ?auto_1059 ) ) ( not ( = ?auto_1055 ?auto_1061 ) ) ( IS-CRATE ?auto_1050 ) ( SURFACE-AT ?auto_1050 ?auto_1056 ) ( ON ?auto_1050 ?auto_1063 ) ( CLEAR ?auto_1050 ) ( not ( = ?auto_1049 ?auto_1050 ) ) ( not ( = ?auto_1049 ?auto_1063 ) ) ( not ( = ?auto_1050 ?auto_1063 ) ) ( SURFACE-AT ?auto_1048 ?auto_1053 ) ( CLEAR ?auto_1048 ) ( IS-CRATE ?auto_1049 ) ( AVAILABLE ?auto_1055 ) ( AVAILABLE ?auto_1057 ) ( SURFACE-AT ?auto_1049 ?auto_1056 ) ( ON ?auto_1049 ?auto_1062 ) ( CLEAR ?auto_1049 ) ( TRUCK-AT ?auto_1054 ?auto_1053 ) ( not ( = ?auto_1048 ?auto_1049 ) ) ( not ( = ?auto_1048 ?auto_1062 ) ) ( not ( = ?auto_1049 ?auto_1062 ) ) ( not ( = ?auto_1048 ?auto_1050 ) ) ( not ( = ?auto_1048 ?auto_1063 ) ) ( not ( = ?auto_1050 ?auto_1062 ) ) ( not ( = ?auto_1063 ?auto_1062 ) ) ( not ( = ?auto_1048 ?auto_1051 ) ) ( not ( = ?auto_1048 ?auto_1059 ) ) ( not ( = ?auto_1049 ?auto_1051 ) ) ( not ( = ?auto_1049 ?auto_1059 ) ) ( not ( = ?auto_1051 ?auto_1063 ) ) ( not ( = ?auto_1051 ?auto_1062 ) ) ( not ( = ?auto_1060 ?auto_1056 ) ) ( not ( = ?auto_1061 ?auto_1057 ) ) ( not ( = ?auto_1059 ?auto_1063 ) ) ( not ( = ?auto_1059 ?auto_1062 ) ) ( not ( = ?auto_1048 ?auto_1052 ) ) ( not ( = ?auto_1048 ?auto_1058 ) ) ( not ( = ?auto_1049 ?auto_1052 ) ) ( not ( = ?auto_1049 ?auto_1058 ) ) ( not ( = ?auto_1050 ?auto_1052 ) ) ( not ( = ?auto_1050 ?auto_1058 ) ) ( not ( = ?auto_1052 ?auto_1059 ) ) ( not ( = ?auto_1052 ?auto_1063 ) ) ( not ( = ?auto_1052 ?auto_1062 ) ) ( not ( = ?auto_1058 ?auto_1059 ) ) ( not ( = ?auto_1058 ?auto_1063 ) ) ( not ( = ?auto_1058 ?auto_1062 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1048 ?auto_1049 ?auto_1050 ?auto_1051 )
      ( MAKE-1CRATE ?auto_1051 ?auto_1052 )
      ( MAKE-4CRATE-VERIFY ?auto_1048 ?auto_1049 ?auto_1050 ?auto_1051 ?auto_1052 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1066 - SURFACE
      ?auto_1067 - SURFACE
    )
    :vars
    (
      ?auto_1068 - HOIST
      ?auto_1069 - PLACE
      ?auto_1071 - PLACE
      ?auto_1072 - HOIST
      ?auto_1073 - SURFACE
      ?auto_1070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1068 ?auto_1069 ) ( SURFACE-AT ?auto_1066 ?auto_1069 ) ( CLEAR ?auto_1066 ) ( IS-CRATE ?auto_1067 ) ( AVAILABLE ?auto_1068 ) ( not ( = ?auto_1071 ?auto_1069 ) ) ( HOIST-AT ?auto_1072 ?auto_1071 ) ( AVAILABLE ?auto_1072 ) ( SURFACE-AT ?auto_1067 ?auto_1071 ) ( ON ?auto_1067 ?auto_1073 ) ( CLEAR ?auto_1067 ) ( TRUCK-AT ?auto_1070 ?auto_1069 ) ( not ( = ?auto_1066 ?auto_1067 ) ) ( not ( = ?auto_1066 ?auto_1073 ) ) ( not ( = ?auto_1067 ?auto_1073 ) ) ( not ( = ?auto_1068 ?auto_1072 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1070 ?auto_1069 ?auto_1071 )
      ( !LIFT ?auto_1072 ?auto_1067 ?auto_1073 ?auto_1071 )
      ( !LOAD ?auto_1072 ?auto_1067 ?auto_1070 ?auto_1071 )
      ( !DRIVE ?auto_1070 ?auto_1071 ?auto_1069 )
      ( !UNLOAD ?auto_1068 ?auto_1067 ?auto_1070 ?auto_1069 )
      ( !DROP ?auto_1068 ?auto_1067 ?auto_1066 ?auto_1069 )
      ( MAKE-1CRATE-VERIFY ?auto_1066 ?auto_1067 ) )
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
      ?auto_1091 - HOIST
      ?auto_1086 - PLACE
      ?auto_1087 - PLACE
      ?auto_1089 - HOIST
      ?auto_1088 - SURFACE
      ?auto_1093 - SURFACE
      ?auto_1094 - PLACE
      ?auto_1097 - HOIST
      ?auto_1096 - SURFACE
      ?auto_1092 - SURFACE
      ?auto_1095 - SURFACE
      ?auto_1090 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1091 ?auto_1086 ) ( IS-CRATE ?auto_1085 ) ( not ( = ?auto_1087 ?auto_1086 ) ) ( HOIST-AT ?auto_1089 ?auto_1087 ) ( SURFACE-AT ?auto_1085 ?auto_1087 ) ( ON ?auto_1085 ?auto_1088 ) ( CLEAR ?auto_1085 ) ( not ( = ?auto_1084 ?auto_1085 ) ) ( not ( = ?auto_1084 ?auto_1088 ) ) ( not ( = ?auto_1085 ?auto_1088 ) ) ( not ( = ?auto_1091 ?auto_1089 ) ) ( IS-CRATE ?auto_1084 ) ( SURFACE-AT ?auto_1084 ?auto_1087 ) ( ON ?auto_1084 ?auto_1093 ) ( CLEAR ?auto_1084 ) ( not ( = ?auto_1083 ?auto_1084 ) ) ( not ( = ?auto_1083 ?auto_1093 ) ) ( not ( = ?auto_1084 ?auto_1093 ) ) ( IS-CRATE ?auto_1083 ) ( not ( = ?auto_1094 ?auto_1086 ) ) ( HOIST-AT ?auto_1097 ?auto_1094 ) ( AVAILABLE ?auto_1097 ) ( SURFACE-AT ?auto_1083 ?auto_1094 ) ( ON ?auto_1083 ?auto_1096 ) ( CLEAR ?auto_1083 ) ( not ( = ?auto_1082 ?auto_1083 ) ) ( not ( = ?auto_1082 ?auto_1096 ) ) ( not ( = ?auto_1083 ?auto_1096 ) ) ( not ( = ?auto_1091 ?auto_1097 ) ) ( IS-CRATE ?auto_1082 ) ( SURFACE-AT ?auto_1082 ?auto_1087 ) ( ON ?auto_1082 ?auto_1092 ) ( CLEAR ?auto_1082 ) ( not ( = ?auto_1081 ?auto_1082 ) ) ( not ( = ?auto_1081 ?auto_1092 ) ) ( not ( = ?auto_1082 ?auto_1092 ) ) ( SURFACE-AT ?auto_1080 ?auto_1086 ) ( CLEAR ?auto_1080 ) ( IS-CRATE ?auto_1081 ) ( AVAILABLE ?auto_1091 ) ( AVAILABLE ?auto_1089 ) ( SURFACE-AT ?auto_1081 ?auto_1087 ) ( ON ?auto_1081 ?auto_1095 ) ( CLEAR ?auto_1081 ) ( TRUCK-AT ?auto_1090 ?auto_1086 ) ( not ( = ?auto_1080 ?auto_1081 ) ) ( not ( = ?auto_1080 ?auto_1095 ) ) ( not ( = ?auto_1081 ?auto_1095 ) ) ( not ( = ?auto_1080 ?auto_1082 ) ) ( not ( = ?auto_1080 ?auto_1092 ) ) ( not ( = ?auto_1082 ?auto_1095 ) ) ( not ( = ?auto_1092 ?auto_1095 ) ) ( not ( = ?auto_1080 ?auto_1083 ) ) ( not ( = ?auto_1080 ?auto_1096 ) ) ( not ( = ?auto_1081 ?auto_1083 ) ) ( not ( = ?auto_1081 ?auto_1096 ) ) ( not ( = ?auto_1083 ?auto_1092 ) ) ( not ( = ?auto_1083 ?auto_1095 ) ) ( not ( = ?auto_1094 ?auto_1087 ) ) ( not ( = ?auto_1097 ?auto_1089 ) ) ( not ( = ?auto_1096 ?auto_1092 ) ) ( not ( = ?auto_1096 ?auto_1095 ) ) ( not ( = ?auto_1080 ?auto_1084 ) ) ( not ( = ?auto_1080 ?auto_1093 ) ) ( not ( = ?auto_1081 ?auto_1084 ) ) ( not ( = ?auto_1081 ?auto_1093 ) ) ( not ( = ?auto_1082 ?auto_1084 ) ) ( not ( = ?auto_1082 ?auto_1093 ) ) ( not ( = ?auto_1084 ?auto_1096 ) ) ( not ( = ?auto_1084 ?auto_1092 ) ) ( not ( = ?auto_1084 ?auto_1095 ) ) ( not ( = ?auto_1093 ?auto_1096 ) ) ( not ( = ?auto_1093 ?auto_1092 ) ) ( not ( = ?auto_1093 ?auto_1095 ) ) ( not ( = ?auto_1080 ?auto_1085 ) ) ( not ( = ?auto_1080 ?auto_1088 ) ) ( not ( = ?auto_1081 ?auto_1085 ) ) ( not ( = ?auto_1081 ?auto_1088 ) ) ( not ( = ?auto_1082 ?auto_1085 ) ) ( not ( = ?auto_1082 ?auto_1088 ) ) ( not ( = ?auto_1083 ?auto_1085 ) ) ( not ( = ?auto_1083 ?auto_1088 ) ) ( not ( = ?auto_1085 ?auto_1093 ) ) ( not ( = ?auto_1085 ?auto_1096 ) ) ( not ( = ?auto_1085 ?auto_1092 ) ) ( not ( = ?auto_1085 ?auto_1095 ) ) ( not ( = ?auto_1088 ?auto_1093 ) ) ( not ( = ?auto_1088 ?auto_1096 ) ) ( not ( = ?auto_1088 ?auto_1092 ) ) ( not ( = ?auto_1088 ?auto_1095 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1080 ?auto_1081 ?auto_1082 ?auto_1083 ?auto_1084 )
      ( MAKE-1CRATE ?auto_1084 ?auto_1085 )
      ( MAKE-5CRATE-VERIFY ?auto_1080 ?auto_1081 ?auto_1082 ?auto_1083 ?auto_1084 ?auto_1085 ) )
  )

)

