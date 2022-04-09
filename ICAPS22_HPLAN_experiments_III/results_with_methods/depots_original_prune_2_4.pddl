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
      ?auto_955 - SURFACE
      ?auto_956 - SURFACE
    )
    :vars
    (
      ?auto_957 - HOIST
      ?auto_958 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_957 ?auto_958 ) ( SURFACE-AT ?auto_955 ?auto_958 ) ( CLEAR ?auto_955 ) ( LIFTING ?auto_957 ?auto_956 ) ( IS-CRATE ?auto_956 ) ( not ( = ?auto_955 ?auto_956 ) ) )
    :subtasks
    ( ( !DROP ?auto_957 ?auto_956 ?auto_955 ?auto_958 )
      ( MAKE-1CRATE-VERIFY ?auto_955 ?auto_956 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_959 - SURFACE
      ?auto_960 - SURFACE
    )
    :vars
    (
      ?auto_962 - HOIST
      ?auto_961 - PLACE
      ?auto_963 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_962 ?auto_961 ) ( SURFACE-AT ?auto_959 ?auto_961 ) ( CLEAR ?auto_959 ) ( IS-CRATE ?auto_960 ) ( not ( = ?auto_959 ?auto_960 ) ) ( TRUCK-AT ?auto_963 ?auto_961 ) ( AVAILABLE ?auto_962 ) ( IN ?auto_960 ?auto_963 ) )
    :subtasks
    ( ( !UNLOAD ?auto_962 ?auto_960 ?auto_963 ?auto_961 )
      ( MAKE-1CRATE ?auto_959 ?auto_960 )
      ( MAKE-1CRATE-VERIFY ?auto_959 ?auto_960 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_964 - SURFACE
      ?auto_965 - SURFACE
    )
    :vars
    (
      ?auto_968 - HOIST
      ?auto_966 - PLACE
      ?auto_967 - TRUCK
      ?auto_969 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_968 ?auto_966 ) ( SURFACE-AT ?auto_964 ?auto_966 ) ( CLEAR ?auto_964 ) ( IS-CRATE ?auto_965 ) ( not ( = ?auto_964 ?auto_965 ) ) ( AVAILABLE ?auto_968 ) ( IN ?auto_965 ?auto_967 ) ( TRUCK-AT ?auto_967 ?auto_969 ) ( not ( = ?auto_969 ?auto_966 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_967 ?auto_969 ?auto_966 )
      ( MAKE-1CRATE ?auto_964 ?auto_965 )
      ( MAKE-1CRATE-VERIFY ?auto_964 ?auto_965 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_970 - SURFACE
      ?auto_971 - SURFACE
    )
    :vars
    (
      ?auto_973 - HOIST
      ?auto_972 - PLACE
      ?auto_975 - TRUCK
      ?auto_974 - PLACE
      ?auto_976 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_973 ?auto_972 ) ( SURFACE-AT ?auto_970 ?auto_972 ) ( CLEAR ?auto_970 ) ( IS-CRATE ?auto_971 ) ( not ( = ?auto_970 ?auto_971 ) ) ( AVAILABLE ?auto_973 ) ( TRUCK-AT ?auto_975 ?auto_974 ) ( not ( = ?auto_974 ?auto_972 ) ) ( HOIST-AT ?auto_976 ?auto_974 ) ( LIFTING ?auto_976 ?auto_971 ) ( not ( = ?auto_973 ?auto_976 ) ) )
    :subtasks
    ( ( !LOAD ?auto_976 ?auto_971 ?auto_975 ?auto_974 )
      ( MAKE-1CRATE ?auto_970 ?auto_971 )
      ( MAKE-1CRATE-VERIFY ?auto_970 ?auto_971 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_977 - SURFACE
      ?auto_978 - SURFACE
    )
    :vars
    (
      ?auto_981 - HOIST
      ?auto_982 - PLACE
      ?auto_979 - TRUCK
      ?auto_980 - PLACE
      ?auto_983 - HOIST
      ?auto_984 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_981 ?auto_982 ) ( SURFACE-AT ?auto_977 ?auto_982 ) ( CLEAR ?auto_977 ) ( IS-CRATE ?auto_978 ) ( not ( = ?auto_977 ?auto_978 ) ) ( AVAILABLE ?auto_981 ) ( TRUCK-AT ?auto_979 ?auto_980 ) ( not ( = ?auto_980 ?auto_982 ) ) ( HOIST-AT ?auto_983 ?auto_980 ) ( not ( = ?auto_981 ?auto_983 ) ) ( AVAILABLE ?auto_983 ) ( SURFACE-AT ?auto_978 ?auto_980 ) ( ON ?auto_978 ?auto_984 ) ( CLEAR ?auto_978 ) ( not ( = ?auto_977 ?auto_984 ) ) ( not ( = ?auto_978 ?auto_984 ) ) )
    :subtasks
    ( ( !LIFT ?auto_983 ?auto_978 ?auto_984 ?auto_980 )
      ( MAKE-1CRATE ?auto_977 ?auto_978 )
      ( MAKE-1CRATE-VERIFY ?auto_977 ?auto_978 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_985 - SURFACE
      ?auto_986 - SURFACE
    )
    :vars
    (
      ?auto_988 - HOIST
      ?auto_989 - PLACE
      ?auto_991 - PLACE
      ?auto_990 - HOIST
      ?auto_992 - SURFACE
      ?auto_987 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_988 ?auto_989 ) ( SURFACE-AT ?auto_985 ?auto_989 ) ( CLEAR ?auto_985 ) ( IS-CRATE ?auto_986 ) ( not ( = ?auto_985 ?auto_986 ) ) ( AVAILABLE ?auto_988 ) ( not ( = ?auto_991 ?auto_989 ) ) ( HOIST-AT ?auto_990 ?auto_991 ) ( not ( = ?auto_988 ?auto_990 ) ) ( AVAILABLE ?auto_990 ) ( SURFACE-AT ?auto_986 ?auto_991 ) ( ON ?auto_986 ?auto_992 ) ( CLEAR ?auto_986 ) ( not ( = ?auto_985 ?auto_992 ) ) ( not ( = ?auto_986 ?auto_992 ) ) ( TRUCK-AT ?auto_987 ?auto_989 ) )
    :subtasks
    ( ( !DRIVE ?auto_987 ?auto_989 ?auto_991 )
      ( MAKE-1CRATE ?auto_985 ?auto_986 )
      ( MAKE-1CRATE-VERIFY ?auto_985 ?auto_986 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1002 - SURFACE
      ?auto_1003 - SURFACE
      ?auto_1004 - SURFACE
    )
    :vars
    (
      ?auto_1006 - HOIST
      ?auto_1005 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006 ?auto_1005 ) ( SURFACE-AT ?auto_1003 ?auto_1005 ) ( CLEAR ?auto_1003 ) ( LIFTING ?auto_1006 ?auto_1004 ) ( IS-CRATE ?auto_1004 ) ( not ( = ?auto_1003 ?auto_1004 ) ) ( ON ?auto_1003 ?auto_1002 ) ( not ( = ?auto_1002 ?auto_1003 ) ) ( not ( = ?auto_1002 ?auto_1004 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1003 ?auto_1004 )
      ( MAKE-2CRATE-VERIFY ?auto_1002 ?auto_1003 ?auto_1004 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1012 - SURFACE
      ?auto_1013 - SURFACE
      ?auto_1014 - SURFACE
    )
    :vars
    (
      ?auto_1015 - HOIST
      ?auto_1017 - PLACE
      ?auto_1016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1015 ?auto_1017 ) ( SURFACE-AT ?auto_1013 ?auto_1017 ) ( CLEAR ?auto_1013 ) ( IS-CRATE ?auto_1014 ) ( not ( = ?auto_1013 ?auto_1014 ) ) ( TRUCK-AT ?auto_1016 ?auto_1017 ) ( AVAILABLE ?auto_1015 ) ( IN ?auto_1014 ?auto_1016 ) ( ON ?auto_1013 ?auto_1012 ) ( not ( = ?auto_1012 ?auto_1013 ) ) ( not ( = ?auto_1012 ?auto_1014 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1013 ?auto_1014 )
      ( MAKE-2CRATE-VERIFY ?auto_1012 ?auto_1013 ?auto_1014 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1018 - SURFACE
      ?auto_1019 - SURFACE
    )
    :vars
    (
      ?auto_1023 - HOIST
      ?auto_1021 - PLACE
      ?auto_1020 - TRUCK
      ?auto_1022 - SURFACE
      ?auto_1024 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1023 ?auto_1021 ) ( SURFACE-AT ?auto_1018 ?auto_1021 ) ( CLEAR ?auto_1018 ) ( IS-CRATE ?auto_1019 ) ( not ( = ?auto_1018 ?auto_1019 ) ) ( AVAILABLE ?auto_1023 ) ( IN ?auto_1019 ?auto_1020 ) ( ON ?auto_1018 ?auto_1022 ) ( not ( = ?auto_1022 ?auto_1018 ) ) ( not ( = ?auto_1022 ?auto_1019 ) ) ( TRUCK-AT ?auto_1020 ?auto_1024 ) ( not ( = ?auto_1024 ?auto_1021 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1020 ?auto_1024 ?auto_1021 )
      ( MAKE-2CRATE ?auto_1022 ?auto_1018 ?auto_1019 )
      ( MAKE-1CRATE-VERIFY ?auto_1018 ?auto_1019 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1025 - SURFACE
      ?auto_1026 - SURFACE
      ?auto_1027 - SURFACE
    )
    :vars
    (
      ?auto_1030 - HOIST
      ?auto_1028 - PLACE
      ?auto_1031 - TRUCK
      ?auto_1029 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1030 ?auto_1028 ) ( SURFACE-AT ?auto_1026 ?auto_1028 ) ( CLEAR ?auto_1026 ) ( IS-CRATE ?auto_1027 ) ( not ( = ?auto_1026 ?auto_1027 ) ) ( AVAILABLE ?auto_1030 ) ( IN ?auto_1027 ?auto_1031 ) ( ON ?auto_1026 ?auto_1025 ) ( not ( = ?auto_1025 ?auto_1026 ) ) ( not ( = ?auto_1025 ?auto_1027 ) ) ( TRUCK-AT ?auto_1031 ?auto_1029 ) ( not ( = ?auto_1029 ?auto_1028 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1026 ?auto_1027 )
      ( MAKE-2CRATE-VERIFY ?auto_1025 ?auto_1026 ?auto_1027 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1032 - SURFACE
      ?auto_1033 - SURFACE
    )
    :vars
    (
      ?auto_1036 - HOIST
      ?auto_1037 - PLACE
      ?auto_1038 - SURFACE
      ?auto_1035 - TRUCK
      ?auto_1034 - PLACE
      ?auto_1039 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1036 ?auto_1037 ) ( SURFACE-AT ?auto_1032 ?auto_1037 ) ( CLEAR ?auto_1032 ) ( IS-CRATE ?auto_1033 ) ( not ( = ?auto_1032 ?auto_1033 ) ) ( AVAILABLE ?auto_1036 ) ( ON ?auto_1032 ?auto_1038 ) ( not ( = ?auto_1038 ?auto_1032 ) ) ( not ( = ?auto_1038 ?auto_1033 ) ) ( TRUCK-AT ?auto_1035 ?auto_1034 ) ( not ( = ?auto_1034 ?auto_1037 ) ) ( HOIST-AT ?auto_1039 ?auto_1034 ) ( LIFTING ?auto_1039 ?auto_1033 ) ( not ( = ?auto_1036 ?auto_1039 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1039 ?auto_1033 ?auto_1035 ?auto_1034 )
      ( MAKE-2CRATE ?auto_1038 ?auto_1032 ?auto_1033 )
      ( MAKE-1CRATE-VERIFY ?auto_1032 ?auto_1033 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1040 - SURFACE
      ?auto_1041 - SURFACE
      ?auto_1042 - SURFACE
    )
    :vars
    (
      ?auto_1045 - HOIST
      ?auto_1046 - PLACE
      ?auto_1047 - TRUCK
      ?auto_1043 - PLACE
      ?auto_1044 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1045 ?auto_1046 ) ( SURFACE-AT ?auto_1041 ?auto_1046 ) ( CLEAR ?auto_1041 ) ( IS-CRATE ?auto_1042 ) ( not ( = ?auto_1041 ?auto_1042 ) ) ( AVAILABLE ?auto_1045 ) ( ON ?auto_1041 ?auto_1040 ) ( not ( = ?auto_1040 ?auto_1041 ) ) ( not ( = ?auto_1040 ?auto_1042 ) ) ( TRUCK-AT ?auto_1047 ?auto_1043 ) ( not ( = ?auto_1043 ?auto_1046 ) ) ( HOIST-AT ?auto_1044 ?auto_1043 ) ( LIFTING ?auto_1044 ?auto_1042 ) ( not ( = ?auto_1045 ?auto_1044 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1041 ?auto_1042 )
      ( MAKE-2CRATE-VERIFY ?auto_1040 ?auto_1041 ?auto_1042 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1048 - SURFACE
      ?auto_1049 - SURFACE
    )
    :vars
    (
      ?auto_1050 - HOIST
      ?auto_1055 - PLACE
      ?auto_1051 - SURFACE
      ?auto_1052 - TRUCK
      ?auto_1054 - PLACE
      ?auto_1053 - HOIST
      ?auto_1056 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1050 ?auto_1055 ) ( SURFACE-AT ?auto_1048 ?auto_1055 ) ( CLEAR ?auto_1048 ) ( IS-CRATE ?auto_1049 ) ( not ( = ?auto_1048 ?auto_1049 ) ) ( AVAILABLE ?auto_1050 ) ( ON ?auto_1048 ?auto_1051 ) ( not ( = ?auto_1051 ?auto_1048 ) ) ( not ( = ?auto_1051 ?auto_1049 ) ) ( TRUCK-AT ?auto_1052 ?auto_1054 ) ( not ( = ?auto_1054 ?auto_1055 ) ) ( HOIST-AT ?auto_1053 ?auto_1054 ) ( not ( = ?auto_1050 ?auto_1053 ) ) ( AVAILABLE ?auto_1053 ) ( SURFACE-AT ?auto_1049 ?auto_1054 ) ( ON ?auto_1049 ?auto_1056 ) ( CLEAR ?auto_1049 ) ( not ( = ?auto_1048 ?auto_1056 ) ) ( not ( = ?auto_1049 ?auto_1056 ) ) ( not ( = ?auto_1051 ?auto_1056 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1053 ?auto_1049 ?auto_1056 ?auto_1054 )
      ( MAKE-2CRATE ?auto_1051 ?auto_1048 ?auto_1049 )
      ( MAKE-1CRATE-VERIFY ?auto_1048 ?auto_1049 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1057 - SURFACE
      ?auto_1058 - SURFACE
      ?auto_1059 - SURFACE
    )
    :vars
    (
      ?auto_1064 - HOIST
      ?auto_1060 - PLACE
      ?auto_1063 - TRUCK
      ?auto_1065 - PLACE
      ?auto_1061 - HOIST
      ?auto_1062 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1064 ?auto_1060 ) ( SURFACE-AT ?auto_1058 ?auto_1060 ) ( CLEAR ?auto_1058 ) ( IS-CRATE ?auto_1059 ) ( not ( = ?auto_1058 ?auto_1059 ) ) ( AVAILABLE ?auto_1064 ) ( ON ?auto_1058 ?auto_1057 ) ( not ( = ?auto_1057 ?auto_1058 ) ) ( not ( = ?auto_1057 ?auto_1059 ) ) ( TRUCK-AT ?auto_1063 ?auto_1065 ) ( not ( = ?auto_1065 ?auto_1060 ) ) ( HOIST-AT ?auto_1061 ?auto_1065 ) ( not ( = ?auto_1064 ?auto_1061 ) ) ( AVAILABLE ?auto_1061 ) ( SURFACE-AT ?auto_1059 ?auto_1065 ) ( ON ?auto_1059 ?auto_1062 ) ( CLEAR ?auto_1059 ) ( not ( = ?auto_1058 ?auto_1062 ) ) ( not ( = ?auto_1059 ?auto_1062 ) ) ( not ( = ?auto_1057 ?auto_1062 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1058 ?auto_1059 )
      ( MAKE-2CRATE-VERIFY ?auto_1057 ?auto_1058 ?auto_1059 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1066 - SURFACE
      ?auto_1067 - SURFACE
    )
    :vars
    (
      ?auto_1072 - HOIST
      ?auto_1069 - PLACE
      ?auto_1073 - SURFACE
      ?auto_1070 - PLACE
      ?auto_1071 - HOIST
      ?auto_1074 - SURFACE
      ?auto_1068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1072 ?auto_1069 ) ( SURFACE-AT ?auto_1066 ?auto_1069 ) ( CLEAR ?auto_1066 ) ( IS-CRATE ?auto_1067 ) ( not ( = ?auto_1066 ?auto_1067 ) ) ( AVAILABLE ?auto_1072 ) ( ON ?auto_1066 ?auto_1073 ) ( not ( = ?auto_1073 ?auto_1066 ) ) ( not ( = ?auto_1073 ?auto_1067 ) ) ( not ( = ?auto_1070 ?auto_1069 ) ) ( HOIST-AT ?auto_1071 ?auto_1070 ) ( not ( = ?auto_1072 ?auto_1071 ) ) ( AVAILABLE ?auto_1071 ) ( SURFACE-AT ?auto_1067 ?auto_1070 ) ( ON ?auto_1067 ?auto_1074 ) ( CLEAR ?auto_1067 ) ( not ( = ?auto_1066 ?auto_1074 ) ) ( not ( = ?auto_1067 ?auto_1074 ) ) ( not ( = ?auto_1073 ?auto_1074 ) ) ( TRUCK-AT ?auto_1068 ?auto_1069 ) )
    :subtasks
    ( ( !DRIVE ?auto_1068 ?auto_1069 ?auto_1070 )
      ( MAKE-2CRATE ?auto_1073 ?auto_1066 ?auto_1067 )
      ( MAKE-1CRATE-VERIFY ?auto_1066 ?auto_1067 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1075 - SURFACE
      ?auto_1076 - SURFACE
      ?auto_1077 - SURFACE
    )
    :vars
    (
      ?auto_1082 - HOIST
      ?auto_1079 - PLACE
      ?auto_1080 - PLACE
      ?auto_1078 - HOIST
      ?auto_1083 - SURFACE
      ?auto_1081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1082 ?auto_1079 ) ( SURFACE-AT ?auto_1076 ?auto_1079 ) ( CLEAR ?auto_1076 ) ( IS-CRATE ?auto_1077 ) ( not ( = ?auto_1076 ?auto_1077 ) ) ( AVAILABLE ?auto_1082 ) ( ON ?auto_1076 ?auto_1075 ) ( not ( = ?auto_1075 ?auto_1076 ) ) ( not ( = ?auto_1075 ?auto_1077 ) ) ( not ( = ?auto_1080 ?auto_1079 ) ) ( HOIST-AT ?auto_1078 ?auto_1080 ) ( not ( = ?auto_1082 ?auto_1078 ) ) ( AVAILABLE ?auto_1078 ) ( SURFACE-AT ?auto_1077 ?auto_1080 ) ( ON ?auto_1077 ?auto_1083 ) ( CLEAR ?auto_1077 ) ( not ( = ?auto_1076 ?auto_1083 ) ) ( not ( = ?auto_1077 ?auto_1083 ) ) ( not ( = ?auto_1075 ?auto_1083 ) ) ( TRUCK-AT ?auto_1081 ?auto_1079 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1076 ?auto_1077 )
      ( MAKE-2CRATE-VERIFY ?auto_1075 ?auto_1076 ?auto_1077 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1084 - SURFACE
      ?auto_1085 - SURFACE
    )
    :vars
    (
      ?auto_1092 - HOIST
      ?auto_1088 - PLACE
      ?auto_1087 - SURFACE
      ?auto_1090 - PLACE
      ?auto_1089 - HOIST
      ?auto_1086 - SURFACE
      ?auto_1091 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1092 ?auto_1088 ) ( IS-CRATE ?auto_1085 ) ( not ( = ?auto_1084 ?auto_1085 ) ) ( not ( = ?auto_1087 ?auto_1084 ) ) ( not ( = ?auto_1087 ?auto_1085 ) ) ( not ( = ?auto_1090 ?auto_1088 ) ) ( HOIST-AT ?auto_1089 ?auto_1090 ) ( not ( = ?auto_1092 ?auto_1089 ) ) ( AVAILABLE ?auto_1089 ) ( SURFACE-AT ?auto_1085 ?auto_1090 ) ( ON ?auto_1085 ?auto_1086 ) ( CLEAR ?auto_1085 ) ( not ( = ?auto_1084 ?auto_1086 ) ) ( not ( = ?auto_1085 ?auto_1086 ) ) ( not ( = ?auto_1087 ?auto_1086 ) ) ( TRUCK-AT ?auto_1091 ?auto_1088 ) ( SURFACE-AT ?auto_1087 ?auto_1088 ) ( CLEAR ?auto_1087 ) ( LIFTING ?auto_1092 ?auto_1084 ) ( IS-CRATE ?auto_1084 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1087 ?auto_1084 )
      ( MAKE-2CRATE ?auto_1087 ?auto_1084 ?auto_1085 )
      ( MAKE-1CRATE-VERIFY ?auto_1084 ?auto_1085 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1093 - SURFACE
      ?auto_1094 - SURFACE
      ?auto_1095 - SURFACE
    )
    :vars
    (
      ?auto_1097 - HOIST
      ?auto_1101 - PLACE
      ?auto_1100 - PLACE
      ?auto_1096 - HOIST
      ?auto_1098 - SURFACE
      ?auto_1099 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1097 ?auto_1101 ) ( IS-CRATE ?auto_1095 ) ( not ( = ?auto_1094 ?auto_1095 ) ) ( not ( = ?auto_1093 ?auto_1094 ) ) ( not ( = ?auto_1093 ?auto_1095 ) ) ( not ( = ?auto_1100 ?auto_1101 ) ) ( HOIST-AT ?auto_1096 ?auto_1100 ) ( not ( = ?auto_1097 ?auto_1096 ) ) ( AVAILABLE ?auto_1096 ) ( SURFACE-AT ?auto_1095 ?auto_1100 ) ( ON ?auto_1095 ?auto_1098 ) ( CLEAR ?auto_1095 ) ( not ( = ?auto_1094 ?auto_1098 ) ) ( not ( = ?auto_1095 ?auto_1098 ) ) ( not ( = ?auto_1093 ?auto_1098 ) ) ( TRUCK-AT ?auto_1099 ?auto_1101 ) ( SURFACE-AT ?auto_1093 ?auto_1101 ) ( CLEAR ?auto_1093 ) ( LIFTING ?auto_1097 ?auto_1094 ) ( IS-CRATE ?auto_1094 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1094 ?auto_1095 )
      ( MAKE-2CRATE-VERIFY ?auto_1093 ?auto_1094 ?auto_1095 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1102 - SURFACE
      ?auto_1103 - SURFACE
    )
    :vars
    (
      ?auto_1105 - HOIST
      ?auto_1104 - PLACE
      ?auto_1108 - SURFACE
      ?auto_1106 - PLACE
      ?auto_1109 - HOIST
      ?auto_1107 - SURFACE
      ?auto_1110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1105 ?auto_1104 ) ( IS-CRATE ?auto_1103 ) ( not ( = ?auto_1102 ?auto_1103 ) ) ( not ( = ?auto_1108 ?auto_1102 ) ) ( not ( = ?auto_1108 ?auto_1103 ) ) ( not ( = ?auto_1106 ?auto_1104 ) ) ( HOIST-AT ?auto_1109 ?auto_1106 ) ( not ( = ?auto_1105 ?auto_1109 ) ) ( AVAILABLE ?auto_1109 ) ( SURFACE-AT ?auto_1103 ?auto_1106 ) ( ON ?auto_1103 ?auto_1107 ) ( CLEAR ?auto_1103 ) ( not ( = ?auto_1102 ?auto_1107 ) ) ( not ( = ?auto_1103 ?auto_1107 ) ) ( not ( = ?auto_1108 ?auto_1107 ) ) ( TRUCK-AT ?auto_1110 ?auto_1104 ) ( SURFACE-AT ?auto_1108 ?auto_1104 ) ( CLEAR ?auto_1108 ) ( IS-CRATE ?auto_1102 ) ( AVAILABLE ?auto_1105 ) ( IN ?auto_1102 ?auto_1110 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1105 ?auto_1102 ?auto_1110 ?auto_1104 )
      ( MAKE-2CRATE ?auto_1108 ?auto_1102 ?auto_1103 )
      ( MAKE-1CRATE-VERIFY ?auto_1102 ?auto_1103 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1111 - SURFACE
      ?auto_1112 - SURFACE
      ?auto_1113 - SURFACE
    )
    :vars
    (
      ?auto_1118 - HOIST
      ?auto_1116 - PLACE
      ?auto_1114 - PLACE
      ?auto_1115 - HOIST
      ?auto_1117 - SURFACE
      ?auto_1119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1118 ?auto_1116 ) ( IS-CRATE ?auto_1113 ) ( not ( = ?auto_1112 ?auto_1113 ) ) ( not ( = ?auto_1111 ?auto_1112 ) ) ( not ( = ?auto_1111 ?auto_1113 ) ) ( not ( = ?auto_1114 ?auto_1116 ) ) ( HOIST-AT ?auto_1115 ?auto_1114 ) ( not ( = ?auto_1118 ?auto_1115 ) ) ( AVAILABLE ?auto_1115 ) ( SURFACE-AT ?auto_1113 ?auto_1114 ) ( ON ?auto_1113 ?auto_1117 ) ( CLEAR ?auto_1113 ) ( not ( = ?auto_1112 ?auto_1117 ) ) ( not ( = ?auto_1113 ?auto_1117 ) ) ( not ( = ?auto_1111 ?auto_1117 ) ) ( TRUCK-AT ?auto_1119 ?auto_1116 ) ( SURFACE-AT ?auto_1111 ?auto_1116 ) ( CLEAR ?auto_1111 ) ( IS-CRATE ?auto_1112 ) ( AVAILABLE ?auto_1118 ) ( IN ?auto_1112 ?auto_1119 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1112 ?auto_1113 )
      ( MAKE-2CRATE-VERIFY ?auto_1111 ?auto_1112 ?auto_1113 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1120 - SURFACE
      ?auto_1121 - SURFACE
    )
    :vars
    (
      ?auto_1127 - HOIST
      ?auto_1123 - PLACE
      ?auto_1128 - SURFACE
      ?auto_1122 - PLACE
      ?auto_1126 - HOIST
      ?auto_1125 - SURFACE
      ?auto_1124 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1127 ?auto_1123 ) ( IS-CRATE ?auto_1121 ) ( not ( = ?auto_1120 ?auto_1121 ) ) ( not ( = ?auto_1128 ?auto_1120 ) ) ( not ( = ?auto_1128 ?auto_1121 ) ) ( not ( = ?auto_1122 ?auto_1123 ) ) ( HOIST-AT ?auto_1126 ?auto_1122 ) ( not ( = ?auto_1127 ?auto_1126 ) ) ( AVAILABLE ?auto_1126 ) ( SURFACE-AT ?auto_1121 ?auto_1122 ) ( ON ?auto_1121 ?auto_1125 ) ( CLEAR ?auto_1121 ) ( not ( = ?auto_1120 ?auto_1125 ) ) ( not ( = ?auto_1121 ?auto_1125 ) ) ( not ( = ?auto_1128 ?auto_1125 ) ) ( SURFACE-AT ?auto_1128 ?auto_1123 ) ( CLEAR ?auto_1128 ) ( IS-CRATE ?auto_1120 ) ( AVAILABLE ?auto_1127 ) ( IN ?auto_1120 ?auto_1124 ) ( TRUCK-AT ?auto_1124 ?auto_1122 ) )
    :subtasks
    ( ( !DRIVE ?auto_1124 ?auto_1122 ?auto_1123 )
      ( MAKE-2CRATE ?auto_1128 ?auto_1120 ?auto_1121 )
      ( MAKE-1CRATE-VERIFY ?auto_1120 ?auto_1121 ) )
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
      ?auto_1133 - HOIST
      ?auto_1136 - PLACE
      ?auto_1132 - PLACE
      ?auto_1137 - HOIST
      ?auto_1135 - SURFACE
      ?auto_1134 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1133 ?auto_1136 ) ( IS-CRATE ?auto_1131 ) ( not ( = ?auto_1130 ?auto_1131 ) ) ( not ( = ?auto_1129 ?auto_1130 ) ) ( not ( = ?auto_1129 ?auto_1131 ) ) ( not ( = ?auto_1132 ?auto_1136 ) ) ( HOIST-AT ?auto_1137 ?auto_1132 ) ( not ( = ?auto_1133 ?auto_1137 ) ) ( AVAILABLE ?auto_1137 ) ( SURFACE-AT ?auto_1131 ?auto_1132 ) ( ON ?auto_1131 ?auto_1135 ) ( CLEAR ?auto_1131 ) ( not ( = ?auto_1130 ?auto_1135 ) ) ( not ( = ?auto_1131 ?auto_1135 ) ) ( not ( = ?auto_1129 ?auto_1135 ) ) ( SURFACE-AT ?auto_1129 ?auto_1136 ) ( CLEAR ?auto_1129 ) ( IS-CRATE ?auto_1130 ) ( AVAILABLE ?auto_1133 ) ( IN ?auto_1130 ?auto_1134 ) ( TRUCK-AT ?auto_1134 ?auto_1132 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1130 ?auto_1131 )
      ( MAKE-2CRATE-VERIFY ?auto_1129 ?auto_1130 ?auto_1131 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1138 - SURFACE
      ?auto_1139 - SURFACE
    )
    :vars
    (
      ?auto_1141 - HOIST
      ?auto_1140 - PLACE
      ?auto_1142 - SURFACE
      ?auto_1143 - PLACE
      ?auto_1145 - HOIST
      ?auto_1146 - SURFACE
      ?auto_1144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1141 ?auto_1140 ) ( IS-CRATE ?auto_1139 ) ( not ( = ?auto_1138 ?auto_1139 ) ) ( not ( = ?auto_1142 ?auto_1138 ) ) ( not ( = ?auto_1142 ?auto_1139 ) ) ( not ( = ?auto_1143 ?auto_1140 ) ) ( HOIST-AT ?auto_1145 ?auto_1143 ) ( not ( = ?auto_1141 ?auto_1145 ) ) ( SURFACE-AT ?auto_1139 ?auto_1143 ) ( ON ?auto_1139 ?auto_1146 ) ( CLEAR ?auto_1139 ) ( not ( = ?auto_1138 ?auto_1146 ) ) ( not ( = ?auto_1139 ?auto_1146 ) ) ( not ( = ?auto_1142 ?auto_1146 ) ) ( SURFACE-AT ?auto_1142 ?auto_1140 ) ( CLEAR ?auto_1142 ) ( IS-CRATE ?auto_1138 ) ( AVAILABLE ?auto_1141 ) ( TRUCK-AT ?auto_1144 ?auto_1143 ) ( LIFTING ?auto_1145 ?auto_1138 ) )
    :subtasks
    ( ( !LOAD ?auto_1145 ?auto_1138 ?auto_1144 ?auto_1143 )
      ( MAKE-2CRATE ?auto_1142 ?auto_1138 ?auto_1139 )
      ( MAKE-1CRATE-VERIFY ?auto_1138 ?auto_1139 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1147 - SURFACE
      ?auto_1148 - SURFACE
      ?auto_1149 - SURFACE
    )
    :vars
    (
      ?auto_1151 - HOIST
      ?auto_1153 - PLACE
      ?auto_1155 - PLACE
      ?auto_1152 - HOIST
      ?auto_1150 - SURFACE
      ?auto_1154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1151 ?auto_1153 ) ( IS-CRATE ?auto_1149 ) ( not ( = ?auto_1148 ?auto_1149 ) ) ( not ( = ?auto_1147 ?auto_1148 ) ) ( not ( = ?auto_1147 ?auto_1149 ) ) ( not ( = ?auto_1155 ?auto_1153 ) ) ( HOIST-AT ?auto_1152 ?auto_1155 ) ( not ( = ?auto_1151 ?auto_1152 ) ) ( SURFACE-AT ?auto_1149 ?auto_1155 ) ( ON ?auto_1149 ?auto_1150 ) ( CLEAR ?auto_1149 ) ( not ( = ?auto_1148 ?auto_1150 ) ) ( not ( = ?auto_1149 ?auto_1150 ) ) ( not ( = ?auto_1147 ?auto_1150 ) ) ( SURFACE-AT ?auto_1147 ?auto_1153 ) ( CLEAR ?auto_1147 ) ( IS-CRATE ?auto_1148 ) ( AVAILABLE ?auto_1151 ) ( TRUCK-AT ?auto_1154 ?auto_1155 ) ( LIFTING ?auto_1152 ?auto_1148 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1148 ?auto_1149 )
      ( MAKE-2CRATE-VERIFY ?auto_1147 ?auto_1148 ?auto_1149 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1156 - SURFACE
      ?auto_1157 - SURFACE
    )
    :vars
    (
      ?auto_1164 - HOIST
      ?auto_1162 - PLACE
      ?auto_1160 - SURFACE
      ?auto_1158 - PLACE
      ?auto_1159 - HOIST
      ?auto_1161 - SURFACE
      ?auto_1163 - TRUCK
      ?auto_1165 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1164 ?auto_1162 ) ( IS-CRATE ?auto_1157 ) ( not ( = ?auto_1156 ?auto_1157 ) ) ( not ( = ?auto_1160 ?auto_1156 ) ) ( not ( = ?auto_1160 ?auto_1157 ) ) ( not ( = ?auto_1158 ?auto_1162 ) ) ( HOIST-AT ?auto_1159 ?auto_1158 ) ( not ( = ?auto_1164 ?auto_1159 ) ) ( SURFACE-AT ?auto_1157 ?auto_1158 ) ( ON ?auto_1157 ?auto_1161 ) ( CLEAR ?auto_1157 ) ( not ( = ?auto_1156 ?auto_1161 ) ) ( not ( = ?auto_1157 ?auto_1161 ) ) ( not ( = ?auto_1160 ?auto_1161 ) ) ( SURFACE-AT ?auto_1160 ?auto_1162 ) ( CLEAR ?auto_1160 ) ( IS-CRATE ?auto_1156 ) ( AVAILABLE ?auto_1164 ) ( TRUCK-AT ?auto_1163 ?auto_1158 ) ( AVAILABLE ?auto_1159 ) ( SURFACE-AT ?auto_1156 ?auto_1158 ) ( ON ?auto_1156 ?auto_1165 ) ( CLEAR ?auto_1156 ) ( not ( = ?auto_1156 ?auto_1165 ) ) ( not ( = ?auto_1157 ?auto_1165 ) ) ( not ( = ?auto_1160 ?auto_1165 ) ) ( not ( = ?auto_1161 ?auto_1165 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1159 ?auto_1156 ?auto_1165 ?auto_1158 )
      ( MAKE-2CRATE ?auto_1160 ?auto_1156 ?auto_1157 )
      ( MAKE-1CRATE-VERIFY ?auto_1156 ?auto_1157 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1166 - SURFACE
      ?auto_1167 - SURFACE
      ?auto_1168 - SURFACE
    )
    :vars
    (
      ?auto_1172 - HOIST
      ?auto_1174 - PLACE
      ?auto_1169 - PLACE
      ?auto_1171 - HOIST
      ?auto_1170 - SURFACE
      ?auto_1173 - TRUCK
      ?auto_1175 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1172 ?auto_1174 ) ( IS-CRATE ?auto_1168 ) ( not ( = ?auto_1167 ?auto_1168 ) ) ( not ( = ?auto_1166 ?auto_1167 ) ) ( not ( = ?auto_1166 ?auto_1168 ) ) ( not ( = ?auto_1169 ?auto_1174 ) ) ( HOIST-AT ?auto_1171 ?auto_1169 ) ( not ( = ?auto_1172 ?auto_1171 ) ) ( SURFACE-AT ?auto_1168 ?auto_1169 ) ( ON ?auto_1168 ?auto_1170 ) ( CLEAR ?auto_1168 ) ( not ( = ?auto_1167 ?auto_1170 ) ) ( not ( = ?auto_1168 ?auto_1170 ) ) ( not ( = ?auto_1166 ?auto_1170 ) ) ( SURFACE-AT ?auto_1166 ?auto_1174 ) ( CLEAR ?auto_1166 ) ( IS-CRATE ?auto_1167 ) ( AVAILABLE ?auto_1172 ) ( TRUCK-AT ?auto_1173 ?auto_1169 ) ( AVAILABLE ?auto_1171 ) ( SURFACE-AT ?auto_1167 ?auto_1169 ) ( ON ?auto_1167 ?auto_1175 ) ( CLEAR ?auto_1167 ) ( not ( = ?auto_1167 ?auto_1175 ) ) ( not ( = ?auto_1168 ?auto_1175 ) ) ( not ( = ?auto_1166 ?auto_1175 ) ) ( not ( = ?auto_1170 ?auto_1175 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1167 ?auto_1168 )
      ( MAKE-2CRATE-VERIFY ?auto_1166 ?auto_1167 ?auto_1168 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1176 - SURFACE
      ?auto_1177 - SURFACE
    )
    :vars
    (
      ?auto_1179 - HOIST
      ?auto_1182 - PLACE
      ?auto_1184 - SURFACE
      ?auto_1181 - PLACE
      ?auto_1178 - HOIST
      ?auto_1180 - SURFACE
      ?auto_1183 - SURFACE
      ?auto_1185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1179 ?auto_1182 ) ( IS-CRATE ?auto_1177 ) ( not ( = ?auto_1176 ?auto_1177 ) ) ( not ( = ?auto_1184 ?auto_1176 ) ) ( not ( = ?auto_1184 ?auto_1177 ) ) ( not ( = ?auto_1181 ?auto_1182 ) ) ( HOIST-AT ?auto_1178 ?auto_1181 ) ( not ( = ?auto_1179 ?auto_1178 ) ) ( SURFACE-AT ?auto_1177 ?auto_1181 ) ( ON ?auto_1177 ?auto_1180 ) ( CLEAR ?auto_1177 ) ( not ( = ?auto_1176 ?auto_1180 ) ) ( not ( = ?auto_1177 ?auto_1180 ) ) ( not ( = ?auto_1184 ?auto_1180 ) ) ( SURFACE-AT ?auto_1184 ?auto_1182 ) ( CLEAR ?auto_1184 ) ( IS-CRATE ?auto_1176 ) ( AVAILABLE ?auto_1179 ) ( AVAILABLE ?auto_1178 ) ( SURFACE-AT ?auto_1176 ?auto_1181 ) ( ON ?auto_1176 ?auto_1183 ) ( CLEAR ?auto_1176 ) ( not ( = ?auto_1176 ?auto_1183 ) ) ( not ( = ?auto_1177 ?auto_1183 ) ) ( not ( = ?auto_1184 ?auto_1183 ) ) ( not ( = ?auto_1180 ?auto_1183 ) ) ( TRUCK-AT ?auto_1185 ?auto_1182 ) )
    :subtasks
    ( ( !DRIVE ?auto_1185 ?auto_1182 ?auto_1181 )
      ( MAKE-2CRATE ?auto_1184 ?auto_1176 ?auto_1177 )
      ( MAKE-1CRATE-VERIFY ?auto_1176 ?auto_1177 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1186 - SURFACE
      ?auto_1187 - SURFACE
      ?auto_1188 - SURFACE
    )
    :vars
    (
      ?auto_1195 - HOIST
      ?auto_1192 - PLACE
      ?auto_1193 - PLACE
      ?auto_1194 - HOIST
      ?auto_1189 - SURFACE
      ?auto_1190 - SURFACE
      ?auto_1191 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1195 ?auto_1192 ) ( IS-CRATE ?auto_1188 ) ( not ( = ?auto_1187 ?auto_1188 ) ) ( not ( = ?auto_1186 ?auto_1187 ) ) ( not ( = ?auto_1186 ?auto_1188 ) ) ( not ( = ?auto_1193 ?auto_1192 ) ) ( HOIST-AT ?auto_1194 ?auto_1193 ) ( not ( = ?auto_1195 ?auto_1194 ) ) ( SURFACE-AT ?auto_1188 ?auto_1193 ) ( ON ?auto_1188 ?auto_1189 ) ( CLEAR ?auto_1188 ) ( not ( = ?auto_1187 ?auto_1189 ) ) ( not ( = ?auto_1188 ?auto_1189 ) ) ( not ( = ?auto_1186 ?auto_1189 ) ) ( SURFACE-AT ?auto_1186 ?auto_1192 ) ( CLEAR ?auto_1186 ) ( IS-CRATE ?auto_1187 ) ( AVAILABLE ?auto_1195 ) ( AVAILABLE ?auto_1194 ) ( SURFACE-AT ?auto_1187 ?auto_1193 ) ( ON ?auto_1187 ?auto_1190 ) ( CLEAR ?auto_1187 ) ( not ( = ?auto_1187 ?auto_1190 ) ) ( not ( = ?auto_1188 ?auto_1190 ) ) ( not ( = ?auto_1186 ?auto_1190 ) ) ( not ( = ?auto_1189 ?auto_1190 ) ) ( TRUCK-AT ?auto_1191 ?auto_1192 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1187 ?auto_1188 )
      ( MAKE-2CRATE-VERIFY ?auto_1186 ?auto_1187 ?auto_1188 ) )
  )

)

