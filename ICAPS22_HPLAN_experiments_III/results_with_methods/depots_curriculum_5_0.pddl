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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_982 - SURFACE
      ?auto_983 - SURFACE
    )
    :vars
    (
      ?auto_984 - HOIST
      ?auto_985 - PLACE
      ?auto_987 - PLACE
      ?auto_988 - HOIST
      ?auto_989 - SURFACE
      ?auto_986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_984 ?auto_985 ) ( SURFACE-AT ?auto_982 ?auto_985 ) ( CLEAR ?auto_982 ) ( IS-CRATE ?auto_983 ) ( AVAILABLE ?auto_984 ) ( not ( = ?auto_987 ?auto_985 ) ) ( HOIST-AT ?auto_988 ?auto_987 ) ( AVAILABLE ?auto_988 ) ( SURFACE-AT ?auto_983 ?auto_987 ) ( ON ?auto_983 ?auto_989 ) ( CLEAR ?auto_983 ) ( TRUCK-AT ?auto_986 ?auto_985 ) ( not ( = ?auto_982 ?auto_983 ) ) ( not ( = ?auto_982 ?auto_989 ) ) ( not ( = ?auto_983 ?auto_989 ) ) ( not ( = ?auto_984 ?auto_988 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_986 ?auto_985 ?auto_987 )
      ( !LIFT ?auto_988 ?auto_983 ?auto_989 ?auto_987 )
      ( !LOAD ?auto_988 ?auto_983 ?auto_986 ?auto_987 )
      ( !DRIVE ?auto_986 ?auto_987 ?auto_985 )
      ( !UNLOAD ?auto_984 ?auto_983 ?auto_986 ?auto_985 )
      ( !DROP ?auto_984 ?auto_983 ?auto_982 ?auto_985 )
      ( MAKE-1CRATE-VERIFY ?auto_982 ?auto_983 ) )
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
      ?auto_996 - HOIST
      ?auto_1001 - PLACE
      ?auto_1000 - PLACE
      ?auto_998 - HOIST
      ?auto_997 - SURFACE
      ?auto_1002 - PLACE
      ?auto_1003 - HOIST
      ?auto_1004 - SURFACE
      ?auto_999 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_996 ?auto_1001 ) ( IS-CRATE ?auto_995 ) ( not ( = ?auto_1000 ?auto_1001 ) ) ( HOIST-AT ?auto_998 ?auto_1000 ) ( AVAILABLE ?auto_998 ) ( SURFACE-AT ?auto_995 ?auto_1000 ) ( ON ?auto_995 ?auto_997 ) ( CLEAR ?auto_995 ) ( not ( = ?auto_994 ?auto_995 ) ) ( not ( = ?auto_994 ?auto_997 ) ) ( not ( = ?auto_995 ?auto_997 ) ) ( not ( = ?auto_996 ?auto_998 ) ) ( SURFACE-AT ?auto_993 ?auto_1001 ) ( CLEAR ?auto_993 ) ( IS-CRATE ?auto_994 ) ( AVAILABLE ?auto_996 ) ( not ( = ?auto_1002 ?auto_1001 ) ) ( HOIST-AT ?auto_1003 ?auto_1002 ) ( AVAILABLE ?auto_1003 ) ( SURFACE-AT ?auto_994 ?auto_1002 ) ( ON ?auto_994 ?auto_1004 ) ( CLEAR ?auto_994 ) ( TRUCK-AT ?auto_999 ?auto_1001 ) ( not ( = ?auto_993 ?auto_994 ) ) ( not ( = ?auto_993 ?auto_1004 ) ) ( not ( = ?auto_994 ?auto_1004 ) ) ( not ( = ?auto_996 ?auto_1003 ) ) ( not ( = ?auto_993 ?auto_995 ) ) ( not ( = ?auto_993 ?auto_997 ) ) ( not ( = ?auto_995 ?auto_1004 ) ) ( not ( = ?auto_1000 ?auto_1002 ) ) ( not ( = ?auto_998 ?auto_1003 ) ) ( not ( = ?auto_997 ?auto_1004 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_993 ?auto_994 )
      ( MAKE-1CRATE ?auto_994 ?auto_995 )
      ( MAKE-2CRATE-VERIFY ?auto_993 ?auto_994 ?auto_995 ) )
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
      ?auto_1025 - PLACE
      ?auto_1027 - PLACE
      ?auto_1024 - HOIST
      ?auto_1023 - SURFACE
      ?auto_1032 - PLACE
      ?auto_1033 - HOIST
      ?auto_1034 - SURFACE
      ?auto_1031 - PLACE
      ?auto_1029 - HOIST
      ?auto_1030 - SURFACE
      ?auto_1026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1028 ?auto_1025 ) ( IS-CRATE ?auto_1022 ) ( not ( = ?auto_1027 ?auto_1025 ) ) ( HOIST-AT ?auto_1024 ?auto_1027 ) ( AVAILABLE ?auto_1024 ) ( SURFACE-AT ?auto_1022 ?auto_1027 ) ( ON ?auto_1022 ?auto_1023 ) ( CLEAR ?auto_1022 ) ( not ( = ?auto_1021 ?auto_1022 ) ) ( not ( = ?auto_1021 ?auto_1023 ) ) ( not ( = ?auto_1022 ?auto_1023 ) ) ( not ( = ?auto_1028 ?auto_1024 ) ) ( IS-CRATE ?auto_1021 ) ( not ( = ?auto_1032 ?auto_1025 ) ) ( HOIST-AT ?auto_1033 ?auto_1032 ) ( AVAILABLE ?auto_1033 ) ( SURFACE-AT ?auto_1021 ?auto_1032 ) ( ON ?auto_1021 ?auto_1034 ) ( CLEAR ?auto_1021 ) ( not ( = ?auto_1020 ?auto_1021 ) ) ( not ( = ?auto_1020 ?auto_1034 ) ) ( not ( = ?auto_1021 ?auto_1034 ) ) ( not ( = ?auto_1028 ?auto_1033 ) ) ( SURFACE-AT ?auto_1019 ?auto_1025 ) ( CLEAR ?auto_1019 ) ( IS-CRATE ?auto_1020 ) ( AVAILABLE ?auto_1028 ) ( not ( = ?auto_1031 ?auto_1025 ) ) ( HOIST-AT ?auto_1029 ?auto_1031 ) ( AVAILABLE ?auto_1029 ) ( SURFACE-AT ?auto_1020 ?auto_1031 ) ( ON ?auto_1020 ?auto_1030 ) ( CLEAR ?auto_1020 ) ( TRUCK-AT ?auto_1026 ?auto_1025 ) ( not ( = ?auto_1019 ?auto_1020 ) ) ( not ( = ?auto_1019 ?auto_1030 ) ) ( not ( = ?auto_1020 ?auto_1030 ) ) ( not ( = ?auto_1028 ?auto_1029 ) ) ( not ( = ?auto_1019 ?auto_1021 ) ) ( not ( = ?auto_1019 ?auto_1034 ) ) ( not ( = ?auto_1021 ?auto_1030 ) ) ( not ( = ?auto_1032 ?auto_1031 ) ) ( not ( = ?auto_1033 ?auto_1029 ) ) ( not ( = ?auto_1034 ?auto_1030 ) ) ( not ( = ?auto_1019 ?auto_1022 ) ) ( not ( = ?auto_1019 ?auto_1023 ) ) ( not ( = ?auto_1020 ?auto_1022 ) ) ( not ( = ?auto_1020 ?auto_1023 ) ) ( not ( = ?auto_1022 ?auto_1034 ) ) ( not ( = ?auto_1022 ?auto_1030 ) ) ( not ( = ?auto_1027 ?auto_1032 ) ) ( not ( = ?auto_1027 ?auto_1031 ) ) ( not ( = ?auto_1024 ?auto_1033 ) ) ( not ( = ?auto_1024 ?auto_1029 ) ) ( not ( = ?auto_1023 ?auto_1034 ) ) ( not ( = ?auto_1023 ?auto_1030 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1019 ?auto_1020 ?auto_1021 )
      ( MAKE-1CRATE ?auto_1021 ?auto_1022 )
      ( MAKE-3CRATE-VERIFY ?auto_1019 ?auto_1020 ?auto_1021 ?auto_1022 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1037 - SURFACE
      ?auto_1038 - SURFACE
    )
    :vars
    (
      ?auto_1039 - HOIST
      ?auto_1040 - PLACE
      ?auto_1042 - PLACE
      ?auto_1043 - HOIST
      ?auto_1044 - SURFACE
      ?auto_1041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1039 ?auto_1040 ) ( SURFACE-AT ?auto_1037 ?auto_1040 ) ( CLEAR ?auto_1037 ) ( IS-CRATE ?auto_1038 ) ( AVAILABLE ?auto_1039 ) ( not ( = ?auto_1042 ?auto_1040 ) ) ( HOIST-AT ?auto_1043 ?auto_1042 ) ( AVAILABLE ?auto_1043 ) ( SURFACE-AT ?auto_1038 ?auto_1042 ) ( ON ?auto_1038 ?auto_1044 ) ( CLEAR ?auto_1038 ) ( TRUCK-AT ?auto_1041 ?auto_1040 ) ( not ( = ?auto_1037 ?auto_1038 ) ) ( not ( = ?auto_1037 ?auto_1044 ) ) ( not ( = ?auto_1038 ?auto_1044 ) ) ( not ( = ?auto_1039 ?auto_1043 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1041 ?auto_1040 ?auto_1042 )
      ( !LIFT ?auto_1043 ?auto_1038 ?auto_1044 ?auto_1042 )
      ( !LOAD ?auto_1043 ?auto_1038 ?auto_1041 ?auto_1042 )
      ( !DRIVE ?auto_1041 ?auto_1042 ?auto_1040 )
      ( !UNLOAD ?auto_1039 ?auto_1038 ?auto_1041 ?auto_1040 )
      ( !DROP ?auto_1039 ?auto_1038 ?auto_1037 ?auto_1040 )
      ( MAKE-1CRATE-VERIFY ?auto_1037 ?auto_1038 ) )
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
      ?auto_1059 - HOIST
      ?auto_1056 - PLACE
      ?auto_1055 - PLACE
      ?auto_1060 - HOIST
      ?auto_1058 - SURFACE
      ?auto_1063 - SURFACE
      ?auto_1065 - PLACE
      ?auto_1064 - HOIST
      ?auto_1061 - SURFACE
      ?auto_1062 - PLACE
      ?auto_1066 - HOIST
      ?auto_1067 - SURFACE
      ?auto_1057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1059 ?auto_1056 ) ( IS-CRATE ?auto_1054 ) ( not ( = ?auto_1055 ?auto_1056 ) ) ( HOIST-AT ?auto_1060 ?auto_1055 ) ( SURFACE-AT ?auto_1054 ?auto_1055 ) ( ON ?auto_1054 ?auto_1058 ) ( CLEAR ?auto_1054 ) ( not ( = ?auto_1053 ?auto_1054 ) ) ( not ( = ?auto_1053 ?auto_1058 ) ) ( not ( = ?auto_1054 ?auto_1058 ) ) ( not ( = ?auto_1059 ?auto_1060 ) ) ( IS-CRATE ?auto_1053 ) ( AVAILABLE ?auto_1060 ) ( SURFACE-AT ?auto_1053 ?auto_1055 ) ( ON ?auto_1053 ?auto_1063 ) ( CLEAR ?auto_1053 ) ( not ( = ?auto_1052 ?auto_1053 ) ) ( not ( = ?auto_1052 ?auto_1063 ) ) ( not ( = ?auto_1053 ?auto_1063 ) ) ( IS-CRATE ?auto_1052 ) ( not ( = ?auto_1065 ?auto_1056 ) ) ( HOIST-AT ?auto_1064 ?auto_1065 ) ( AVAILABLE ?auto_1064 ) ( SURFACE-AT ?auto_1052 ?auto_1065 ) ( ON ?auto_1052 ?auto_1061 ) ( CLEAR ?auto_1052 ) ( not ( = ?auto_1051 ?auto_1052 ) ) ( not ( = ?auto_1051 ?auto_1061 ) ) ( not ( = ?auto_1052 ?auto_1061 ) ) ( not ( = ?auto_1059 ?auto_1064 ) ) ( SURFACE-AT ?auto_1050 ?auto_1056 ) ( CLEAR ?auto_1050 ) ( IS-CRATE ?auto_1051 ) ( AVAILABLE ?auto_1059 ) ( not ( = ?auto_1062 ?auto_1056 ) ) ( HOIST-AT ?auto_1066 ?auto_1062 ) ( AVAILABLE ?auto_1066 ) ( SURFACE-AT ?auto_1051 ?auto_1062 ) ( ON ?auto_1051 ?auto_1067 ) ( CLEAR ?auto_1051 ) ( TRUCK-AT ?auto_1057 ?auto_1056 ) ( not ( = ?auto_1050 ?auto_1051 ) ) ( not ( = ?auto_1050 ?auto_1067 ) ) ( not ( = ?auto_1051 ?auto_1067 ) ) ( not ( = ?auto_1059 ?auto_1066 ) ) ( not ( = ?auto_1050 ?auto_1052 ) ) ( not ( = ?auto_1050 ?auto_1061 ) ) ( not ( = ?auto_1052 ?auto_1067 ) ) ( not ( = ?auto_1065 ?auto_1062 ) ) ( not ( = ?auto_1064 ?auto_1066 ) ) ( not ( = ?auto_1061 ?auto_1067 ) ) ( not ( = ?auto_1050 ?auto_1053 ) ) ( not ( = ?auto_1050 ?auto_1063 ) ) ( not ( = ?auto_1051 ?auto_1053 ) ) ( not ( = ?auto_1051 ?auto_1063 ) ) ( not ( = ?auto_1053 ?auto_1061 ) ) ( not ( = ?auto_1053 ?auto_1067 ) ) ( not ( = ?auto_1055 ?auto_1065 ) ) ( not ( = ?auto_1055 ?auto_1062 ) ) ( not ( = ?auto_1060 ?auto_1064 ) ) ( not ( = ?auto_1060 ?auto_1066 ) ) ( not ( = ?auto_1063 ?auto_1061 ) ) ( not ( = ?auto_1063 ?auto_1067 ) ) ( not ( = ?auto_1050 ?auto_1054 ) ) ( not ( = ?auto_1050 ?auto_1058 ) ) ( not ( = ?auto_1051 ?auto_1054 ) ) ( not ( = ?auto_1051 ?auto_1058 ) ) ( not ( = ?auto_1052 ?auto_1054 ) ) ( not ( = ?auto_1052 ?auto_1058 ) ) ( not ( = ?auto_1054 ?auto_1063 ) ) ( not ( = ?auto_1054 ?auto_1061 ) ) ( not ( = ?auto_1054 ?auto_1067 ) ) ( not ( = ?auto_1058 ?auto_1063 ) ) ( not ( = ?auto_1058 ?auto_1061 ) ) ( not ( = ?auto_1058 ?auto_1067 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1050 ?auto_1051 ?auto_1052 ?auto_1053 )
      ( MAKE-1CRATE ?auto_1053 ?auto_1054 )
      ( MAKE-4CRATE-VERIFY ?auto_1050 ?auto_1051 ?auto_1052 ?auto_1053 ?auto_1054 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1070 - SURFACE
      ?auto_1071 - SURFACE
    )
    :vars
    (
      ?auto_1072 - HOIST
      ?auto_1073 - PLACE
      ?auto_1075 - PLACE
      ?auto_1076 - HOIST
      ?auto_1077 - SURFACE
      ?auto_1074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1072 ?auto_1073 ) ( SURFACE-AT ?auto_1070 ?auto_1073 ) ( CLEAR ?auto_1070 ) ( IS-CRATE ?auto_1071 ) ( AVAILABLE ?auto_1072 ) ( not ( = ?auto_1075 ?auto_1073 ) ) ( HOIST-AT ?auto_1076 ?auto_1075 ) ( AVAILABLE ?auto_1076 ) ( SURFACE-AT ?auto_1071 ?auto_1075 ) ( ON ?auto_1071 ?auto_1077 ) ( CLEAR ?auto_1071 ) ( TRUCK-AT ?auto_1074 ?auto_1073 ) ( not ( = ?auto_1070 ?auto_1071 ) ) ( not ( = ?auto_1070 ?auto_1077 ) ) ( not ( = ?auto_1071 ?auto_1077 ) ) ( not ( = ?auto_1072 ?auto_1076 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1074 ?auto_1073 ?auto_1075 )
      ( !LIFT ?auto_1076 ?auto_1071 ?auto_1077 ?auto_1075 )
      ( !LOAD ?auto_1076 ?auto_1071 ?auto_1074 ?auto_1075 )
      ( !DRIVE ?auto_1074 ?auto_1075 ?auto_1073 )
      ( !UNLOAD ?auto_1072 ?auto_1071 ?auto_1074 ?auto_1073 )
      ( !DROP ?auto_1072 ?auto_1071 ?auto_1070 ?auto_1073 )
      ( MAKE-1CRATE-VERIFY ?auto_1070 ?auto_1071 ) )
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
      ?auto_1093 - PLACE
      ?auto_1094 - PLACE
      ?auto_1092 - HOIST
      ?auto_1091 - SURFACE
      ?auto_1096 - PLACE
      ?auto_1097 - HOIST
      ?auto_1099 - SURFACE
      ?auto_1102 - SURFACE
      ?auto_1098 - PLACE
      ?auto_1104 - HOIST
      ?auto_1101 - SURFACE
      ?auto_1103 - PLACE
      ?auto_1100 - HOIST
      ?auto_1105 - SURFACE
      ?auto_1095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1090 ?auto_1093 ) ( IS-CRATE ?auto_1089 ) ( not ( = ?auto_1094 ?auto_1093 ) ) ( HOIST-AT ?auto_1092 ?auto_1094 ) ( AVAILABLE ?auto_1092 ) ( SURFACE-AT ?auto_1089 ?auto_1094 ) ( ON ?auto_1089 ?auto_1091 ) ( CLEAR ?auto_1089 ) ( not ( = ?auto_1088 ?auto_1089 ) ) ( not ( = ?auto_1088 ?auto_1091 ) ) ( not ( = ?auto_1089 ?auto_1091 ) ) ( not ( = ?auto_1090 ?auto_1092 ) ) ( IS-CRATE ?auto_1088 ) ( not ( = ?auto_1096 ?auto_1093 ) ) ( HOIST-AT ?auto_1097 ?auto_1096 ) ( SURFACE-AT ?auto_1088 ?auto_1096 ) ( ON ?auto_1088 ?auto_1099 ) ( CLEAR ?auto_1088 ) ( not ( = ?auto_1087 ?auto_1088 ) ) ( not ( = ?auto_1087 ?auto_1099 ) ) ( not ( = ?auto_1088 ?auto_1099 ) ) ( not ( = ?auto_1090 ?auto_1097 ) ) ( IS-CRATE ?auto_1087 ) ( AVAILABLE ?auto_1097 ) ( SURFACE-AT ?auto_1087 ?auto_1096 ) ( ON ?auto_1087 ?auto_1102 ) ( CLEAR ?auto_1087 ) ( not ( = ?auto_1086 ?auto_1087 ) ) ( not ( = ?auto_1086 ?auto_1102 ) ) ( not ( = ?auto_1087 ?auto_1102 ) ) ( IS-CRATE ?auto_1086 ) ( not ( = ?auto_1098 ?auto_1093 ) ) ( HOIST-AT ?auto_1104 ?auto_1098 ) ( AVAILABLE ?auto_1104 ) ( SURFACE-AT ?auto_1086 ?auto_1098 ) ( ON ?auto_1086 ?auto_1101 ) ( CLEAR ?auto_1086 ) ( not ( = ?auto_1085 ?auto_1086 ) ) ( not ( = ?auto_1085 ?auto_1101 ) ) ( not ( = ?auto_1086 ?auto_1101 ) ) ( not ( = ?auto_1090 ?auto_1104 ) ) ( SURFACE-AT ?auto_1084 ?auto_1093 ) ( CLEAR ?auto_1084 ) ( IS-CRATE ?auto_1085 ) ( AVAILABLE ?auto_1090 ) ( not ( = ?auto_1103 ?auto_1093 ) ) ( HOIST-AT ?auto_1100 ?auto_1103 ) ( AVAILABLE ?auto_1100 ) ( SURFACE-AT ?auto_1085 ?auto_1103 ) ( ON ?auto_1085 ?auto_1105 ) ( CLEAR ?auto_1085 ) ( TRUCK-AT ?auto_1095 ?auto_1093 ) ( not ( = ?auto_1084 ?auto_1085 ) ) ( not ( = ?auto_1084 ?auto_1105 ) ) ( not ( = ?auto_1085 ?auto_1105 ) ) ( not ( = ?auto_1090 ?auto_1100 ) ) ( not ( = ?auto_1084 ?auto_1086 ) ) ( not ( = ?auto_1084 ?auto_1101 ) ) ( not ( = ?auto_1086 ?auto_1105 ) ) ( not ( = ?auto_1098 ?auto_1103 ) ) ( not ( = ?auto_1104 ?auto_1100 ) ) ( not ( = ?auto_1101 ?auto_1105 ) ) ( not ( = ?auto_1084 ?auto_1087 ) ) ( not ( = ?auto_1084 ?auto_1102 ) ) ( not ( = ?auto_1085 ?auto_1087 ) ) ( not ( = ?auto_1085 ?auto_1102 ) ) ( not ( = ?auto_1087 ?auto_1101 ) ) ( not ( = ?auto_1087 ?auto_1105 ) ) ( not ( = ?auto_1096 ?auto_1098 ) ) ( not ( = ?auto_1096 ?auto_1103 ) ) ( not ( = ?auto_1097 ?auto_1104 ) ) ( not ( = ?auto_1097 ?auto_1100 ) ) ( not ( = ?auto_1102 ?auto_1101 ) ) ( not ( = ?auto_1102 ?auto_1105 ) ) ( not ( = ?auto_1084 ?auto_1088 ) ) ( not ( = ?auto_1084 ?auto_1099 ) ) ( not ( = ?auto_1085 ?auto_1088 ) ) ( not ( = ?auto_1085 ?auto_1099 ) ) ( not ( = ?auto_1086 ?auto_1088 ) ) ( not ( = ?auto_1086 ?auto_1099 ) ) ( not ( = ?auto_1088 ?auto_1102 ) ) ( not ( = ?auto_1088 ?auto_1101 ) ) ( not ( = ?auto_1088 ?auto_1105 ) ) ( not ( = ?auto_1099 ?auto_1102 ) ) ( not ( = ?auto_1099 ?auto_1101 ) ) ( not ( = ?auto_1099 ?auto_1105 ) ) ( not ( = ?auto_1084 ?auto_1089 ) ) ( not ( = ?auto_1084 ?auto_1091 ) ) ( not ( = ?auto_1085 ?auto_1089 ) ) ( not ( = ?auto_1085 ?auto_1091 ) ) ( not ( = ?auto_1086 ?auto_1089 ) ) ( not ( = ?auto_1086 ?auto_1091 ) ) ( not ( = ?auto_1087 ?auto_1089 ) ) ( not ( = ?auto_1087 ?auto_1091 ) ) ( not ( = ?auto_1089 ?auto_1099 ) ) ( not ( = ?auto_1089 ?auto_1102 ) ) ( not ( = ?auto_1089 ?auto_1101 ) ) ( not ( = ?auto_1089 ?auto_1105 ) ) ( not ( = ?auto_1094 ?auto_1096 ) ) ( not ( = ?auto_1094 ?auto_1098 ) ) ( not ( = ?auto_1094 ?auto_1103 ) ) ( not ( = ?auto_1092 ?auto_1097 ) ) ( not ( = ?auto_1092 ?auto_1104 ) ) ( not ( = ?auto_1092 ?auto_1100 ) ) ( not ( = ?auto_1091 ?auto_1099 ) ) ( not ( = ?auto_1091 ?auto_1102 ) ) ( not ( = ?auto_1091 ?auto_1101 ) ) ( not ( = ?auto_1091 ?auto_1105 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1084 ?auto_1085 ?auto_1086 ?auto_1087 ?auto_1088 )
      ( MAKE-1CRATE ?auto_1088 ?auto_1089 )
      ( MAKE-5CRATE-VERIFY ?auto_1084 ?auto_1085 ?auto_1086 ?auto_1087 ?auto_1088 ?auto_1089 ) )
  )

)

