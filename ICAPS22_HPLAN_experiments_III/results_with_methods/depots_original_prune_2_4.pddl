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
      ?auto_917 - SURFACE
      ?auto_918 - SURFACE
    )
    :vars
    (
      ?auto_919 - HOIST
      ?auto_920 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_919 ?auto_920 ) ( SURFACE-AT ?auto_917 ?auto_920 ) ( CLEAR ?auto_917 ) ( LIFTING ?auto_919 ?auto_918 ) ( IS-CRATE ?auto_918 ) ( not ( = ?auto_917 ?auto_918 ) ) )
    :subtasks
    ( ( !DROP ?auto_919 ?auto_918 ?auto_917 ?auto_920 )
      ( MAKE-1CRATE-VERIFY ?auto_917 ?auto_918 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_921 - SURFACE
      ?auto_922 - SURFACE
    )
    :vars
    (
      ?auto_923 - HOIST
      ?auto_924 - PLACE
      ?auto_925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_923 ?auto_924 ) ( SURFACE-AT ?auto_921 ?auto_924 ) ( CLEAR ?auto_921 ) ( IS-CRATE ?auto_922 ) ( not ( = ?auto_921 ?auto_922 ) ) ( TRUCK-AT ?auto_925 ?auto_924 ) ( AVAILABLE ?auto_923 ) ( IN ?auto_922 ?auto_925 ) )
    :subtasks
    ( ( !UNLOAD ?auto_923 ?auto_922 ?auto_925 ?auto_924 )
      ( MAKE-1CRATE ?auto_921 ?auto_922 )
      ( MAKE-1CRATE-VERIFY ?auto_921 ?auto_922 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_926 - SURFACE
      ?auto_927 - SURFACE
    )
    :vars
    (
      ?auto_930 - HOIST
      ?auto_929 - PLACE
      ?auto_928 - TRUCK
      ?auto_931 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_930 ?auto_929 ) ( SURFACE-AT ?auto_926 ?auto_929 ) ( CLEAR ?auto_926 ) ( IS-CRATE ?auto_927 ) ( not ( = ?auto_926 ?auto_927 ) ) ( AVAILABLE ?auto_930 ) ( IN ?auto_927 ?auto_928 ) ( TRUCK-AT ?auto_928 ?auto_931 ) ( not ( = ?auto_931 ?auto_929 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_928 ?auto_931 ?auto_929 )
      ( MAKE-1CRATE ?auto_926 ?auto_927 )
      ( MAKE-1CRATE-VERIFY ?auto_926 ?auto_927 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_932 - SURFACE
      ?auto_933 - SURFACE
    )
    :vars
    (
      ?auto_937 - HOIST
      ?auto_935 - PLACE
      ?auto_934 - TRUCK
      ?auto_936 - PLACE
      ?auto_938 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_937 ?auto_935 ) ( SURFACE-AT ?auto_932 ?auto_935 ) ( CLEAR ?auto_932 ) ( IS-CRATE ?auto_933 ) ( not ( = ?auto_932 ?auto_933 ) ) ( AVAILABLE ?auto_937 ) ( TRUCK-AT ?auto_934 ?auto_936 ) ( not ( = ?auto_936 ?auto_935 ) ) ( HOIST-AT ?auto_938 ?auto_936 ) ( LIFTING ?auto_938 ?auto_933 ) ( not ( = ?auto_937 ?auto_938 ) ) )
    :subtasks
    ( ( !LOAD ?auto_938 ?auto_933 ?auto_934 ?auto_936 )
      ( MAKE-1CRATE ?auto_932 ?auto_933 )
      ( MAKE-1CRATE-VERIFY ?auto_932 ?auto_933 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_939 - SURFACE
      ?auto_940 - SURFACE
    )
    :vars
    (
      ?auto_943 - HOIST
      ?auto_945 - PLACE
      ?auto_944 - TRUCK
      ?auto_941 - PLACE
      ?auto_942 - HOIST
      ?auto_946 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_943 ?auto_945 ) ( SURFACE-AT ?auto_939 ?auto_945 ) ( CLEAR ?auto_939 ) ( IS-CRATE ?auto_940 ) ( not ( = ?auto_939 ?auto_940 ) ) ( AVAILABLE ?auto_943 ) ( TRUCK-AT ?auto_944 ?auto_941 ) ( not ( = ?auto_941 ?auto_945 ) ) ( HOIST-AT ?auto_942 ?auto_941 ) ( not ( = ?auto_943 ?auto_942 ) ) ( AVAILABLE ?auto_942 ) ( SURFACE-AT ?auto_940 ?auto_941 ) ( ON ?auto_940 ?auto_946 ) ( CLEAR ?auto_940 ) ( not ( = ?auto_939 ?auto_946 ) ) ( not ( = ?auto_940 ?auto_946 ) ) )
    :subtasks
    ( ( !LIFT ?auto_942 ?auto_940 ?auto_946 ?auto_941 )
      ( MAKE-1CRATE ?auto_939 ?auto_940 )
      ( MAKE-1CRATE-VERIFY ?auto_939 ?auto_940 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_947 - SURFACE
      ?auto_948 - SURFACE
    )
    :vars
    (
      ?auto_949 - HOIST
      ?auto_952 - PLACE
      ?auto_953 - PLACE
      ?auto_950 - HOIST
      ?auto_951 - SURFACE
      ?auto_954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_949 ?auto_952 ) ( SURFACE-AT ?auto_947 ?auto_952 ) ( CLEAR ?auto_947 ) ( IS-CRATE ?auto_948 ) ( not ( = ?auto_947 ?auto_948 ) ) ( AVAILABLE ?auto_949 ) ( not ( = ?auto_953 ?auto_952 ) ) ( HOIST-AT ?auto_950 ?auto_953 ) ( not ( = ?auto_949 ?auto_950 ) ) ( AVAILABLE ?auto_950 ) ( SURFACE-AT ?auto_948 ?auto_953 ) ( ON ?auto_948 ?auto_951 ) ( CLEAR ?auto_948 ) ( not ( = ?auto_947 ?auto_951 ) ) ( not ( = ?auto_948 ?auto_951 ) ) ( TRUCK-AT ?auto_954 ?auto_952 ) )
    :subtasks
    ( ( !DRIVE ?auto_954 ?auto_952 ?auto_953 )
      ( MAKE-1CRATE ?auto_947 ?auto_948 )
      ( MAKE-1CRATE-VERIFY ?auto_947 ?auto_948 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_964 - SURFACE
      ?auto_965 - SURFACE
      ?auto_966 - SURFACE
    )
    :vars
    (
      ?auto_967 - HOIST
      ?auto_968 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_967 ?auto_968 ) ( SURFACE-AT ?auto_965 ?auto_968 ) ( CLEAR ?auto_965 ) ( LIFTING ?auto_967 ?auto_966 ) ( IS-CRATE ?auto_966 ) ( not ( = ?auto_965 ?auto_966 ) ) ( ON ?auto_965 ?auto_964 ) ( not ( = ?auto_964 ?auto_965 ) ) ( not ( = ?auto_964 ?auto_966 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_965 ?auto_966 )
      ( MAKE-2CRATE-VERIFY ?auto_964 ?auto_965 ?auto_966 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_974 - SURFACE
      ?auto_975 - SURFACE
      ?auto_976 - SURFACE
    )
    :vars
    (
      ?auto_978 - HOIST
      ?auto_977 - PLACE
      ?auto_979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_978 ?auto_977 ) ( SURFACE-AT ?auto_975 ?auto_977 ) ( CLEAR ?auto_975 ) ( IS-CRATE ?auto_976 ) ( not ( = ?auto_975 ?auto_976 ) ) ( TRUCK-AT ?auto_979 ?auto_977 ) ( AVAILABLE ?auto_978 ) ( IN ?auto_976 ?auto_979 ) ( ON ?auto_975 ?auto_974 ) ( not ( = ?auto_974 ?auto_975 ) ) ( not ( = ?auto_974 ?auto_976 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_975 ?auto_976 )
      ( MAKE-2CRATE-VERIFY ?auto_974 ?auto_975 ?auto_976 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_980 - SURFACE
      ?auto_981 - SURFACE
    )
    :vars
    (
      ?auto_982 - HOIST
      ?auto_983 - PLACE
      ?auto_984 - TRUCK
      ?auto_985 - SURFACE
      ?auto_986 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_982 ?auto_983 ) ( SURFACE-AT ?auto_980 ?auto_983 ) ( CLEAR ?auto_980 ) ( IS-CRATE ?auto_981 ) ( not ( = ?auto_980 ?auto_981 ) ) ( AVAILABLE ?auto_982 ) ( IN ?auto_981 ?auto_984 ) ( ON ?auto_980 ?auto_985 ) ( not ( = ?auto_985 ?auto_980 ) ) ( not ( = ?auto_985 ?auto_981 ) ) ( TRUCK-AT ?auto_984 ?auto_986 ) ( not ( = ?auto_986 ?auto_983 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_984 ?auto_986 ?auto_983 )
      ( MAKE-2CRATE ?auto_985 ?auto_980 ?auto_981 )
      ( MAKE-1CRATE-VERIFY ?auto_980 ?auto_981 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_987 - SURFACE
      ?auto_988 - SURFACE
      ?auto_989 - SURFACE
    )
    :vars
    (
      ?auto_991 - HOIST
      ?auto_992 - PLACE
      ?auto_993 - TRUCK
      ?auto_990 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_991 ?auto_992 ) ( SURFACE-AT ?auto_988 ?auto_992 ) ( CLEAR ?auto_988 ) ( IS-CRATE ?auto_989 ) ( not ( = ?auto_988 ?auto_989 ) ) ( AVAILABLE ?auto_991 ) ( IN ?auto_989 ?auto_993 ) ( ON ?auto_988 ?auto_987 ) ( not ( = ?auto_987 ?auto_988 ) ) ( not ( = ?auto_987 ?auto_989 ) ) ( TRUCK-AT ?auto_993 ?auto_990 ) ( not ( = ?auto_990 ?auto_992 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_988 ?auto_989 )
      ( MAKE-2CRATE-VERIFY ?auto_987 ?auto_988 ?auto_989 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_994 - SURFACE
      ?auto_995 - SURFACE
    )
    :vars
    (
      ?auto_998 - HOIST
      ?auto_999 - PLACE
      ?auto_1000 - SURFACE
      ?auto_996 - TRUCK
      ?auto_997 - PLACE
      ?auto_1001 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_998 ?auto_999 ) ( SURFACE-AT ?auto_994 ?auto_999 ) ( CLEAR ?auto_994 ) ( IS-CRATE ?auto_995 ) ( not ( = ?auto_994 ?auto_995 ) ) ( AVAILABLE ?auto_998 ) ( ON ?auto_994 ?auto_1000 ) ( not ( = ?auto_1000 ?auto_994 ) ) ( not ( = ?auto_1000 ?auto_995 ) ) ( TRUCK-AT ?auto_996 ?auto_997 ) ( not ( = ?auto_997 ?auto_999 ) ) ( HOIST-AT ?auto_1001 ?auto_997 ) ( LIFTING ?auto_1001 ?auto_995 ) ( not ( = ?auto_998 ?auto_1001 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1001 ?auto_995 ?auto_996 ?auto_997 )
      ( MAKE-2CRATE ?auto_1000 ?auto_994 ?auto_995 )
      ( MAKE-1CRATE-VERIFY ?auto_994 ?auto_995 ) )
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
      ?auto_1008 - TRUCK
      ?auto_1007 - PLACE
      ?auto_1009 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1006 ?auto_1005 ) ( SURFACE-AT ?auto_1003 ?auto_1005 ) ( CLEAR ?auto_1003 ) ( IS-CRATE ?auto_1004 ) ( not ( = ?auto_1003 ?auto_1004 ) ) ( AVAILABLE ?auto_1006 ) ( ON ?auto_1003 ?auto_1002 ) ( not ( = ?auto_1002 ?auto_1003 ) ) ( not ( = ?auto_1002 ?auto_1004 ) ) ( TRUCK-AT ?auto_1008 ?auto_1007 ) ( not ( = ?auto_1007 ?auto_1005 ) ) ( HOIST-AT ?auto_1009 ?auto_1007 ) ( LIFTING ?auto_1009 ?auto_1004 ) ( not ( = ?auto_1006 ?auto_1009 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1003 ?auto_1004 )
      ( MAKE-2CRATE-VERIFY ?auto_1002 ?auto_1003 ?auto_1004 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1010 - SURFACE
      ?auto_1011 - SURFACE
    )
    :vars
    (
      ?auto_1016 - HOIST
      ?auto_1017 - PLACE
      ?auto_1013 - SURFACE
      ?auto_1012 - TRUCK
      ?auto_1014 - PLACE
      ?auto_1015 - HOIST
      ?auto_1018 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1016 ?auto_1017 ) ( SURFACE-AT ?auto_1010 ?auto_1017 ) ( CLEAR ?auto_1010 ) ( IS-CRATE ?auto_1011 ) ( not ( = ?auto_1010 ?auto_1011 ) ) ( AVAILABLE ?auto_1016 ) ( ON ?auto_1010 ?auto_1013 ) ( not ( = ?auto_1013 ?auto_1010 ) ) ( not ( = ?auto_1013 ?auto_1011 ) ) ( TRUCK-AT ?auto_1012 ?auto_1014 ) ( not ( = ?auto_1014 ?auto_1017 ) ) ( HOIST-AT ?auto_1015 ?auto_1014 ) ( not ( = ?auto_1016 ?auto_1015 ) ) ( AVAILABLE ?auto_1015 ) ( SURFACE-AT ?auto_1011 ?auto_1014 ) ( ON ?auto_1011 ?auto_1018 ) ( CLEAR ?auto_1011 ) ( not ( = ?auto_1010 ?auto_1018 ) ) ( not ( = ?auto_1011 ?auto_1018 ) ) ( not ( = ?auto_1013 ?auto_1018 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1015 ?auto_1011 ?auto_1018 ?auto_1014 )
      ( MAKE-2CRATE ?auto_1013 ?auto_1010 ?auto_1011 )
      ( MAKE-1CRATE-VERIFY ?auto_1010 ?auto_1011 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1019 - SURFACE
      ?auto_1020 - SURFACE
      ?auto_1021 - SURFACE
    )
    :vars
    (
      ?auto_1026 - HOIST
      ?auto_1023 - PLACE
      ?auto_1025 - TRUCK
      ?auto_1024 - PLACE
      ?auto_1022 - HOIST
      ?auto_1027 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1026 ?auto_1023 ) ( SURFACE-AT ?auto_1020 ?auto_1023 ) ( CLEAR ?auto_1020 ) ( IS-CRATE ?auto_1021 ) ( not ( = ?auto_1020 ?auto_1021 ) ) ( AVAILABLE ?auto_1026 ) ( ON ?auto_1020 ?auto_1019 ) ( not ( = ?auto_1019 ?auto_1020 ) ) ( not ( = ?auto_1019 ?auto_1021 ) ) ( TRUCK-AT ?auto_1025 ?auto_1024 ) ( not ( = ?auto_1024 ?auto_1023 ) ) ( HOIST-AT ?auto_1022 ?auto_1024 ) ( not ( = ?auto_1026 ?auto_1022 ) ) ( AVAILABLE ?auto_1022 ) ( SURFACE-AT ?auto_1021 ?auto_1024 ) ( ON ?auto_1021 ?auto_1027 ) ( CLEAR ?auto_1021 ) ( not ( = ?auto_1020 ?auto_1027 ) ) ( not ( = ?auto_1021 ?auto_1027 ) ) ( not ( = ?auto_1019 ?auto_1027 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1020 ?auto_1021 )
      ( MAKE-2CRATE-VERIFY ?auto_1019 ?auto_1020 ?auto_1021 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1028 - SURFACE
      ?auto_1029 - SURFACE
    )
    :vars
    (
      ?auto_1032 - HOIST
      ?auto_1031 - PLACE
      ?auto_1035 - SURFACE
      ?auto_1034 - PLACE
      ?auto_1036 - HOIST
      ?auto_1033 - SURFACE
      ?auto_1030 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1032 ?auto_1031 ) ( SURFACE-AT ?auto_1028 ?auto_1031 ) ( CLEAR ?auto_1028 ) ( IS-CRATE ?auto_1029 ) ( not ( = ?auto_1028 ?auto_1029 ) ) ( AVAILABLE ?auto_1032 ) ( ON ?auto_1028 ?auto_1035 ) ( not ( = ?auto_1035 ?auto_1028 ) ) ( not ( = ?auto_1035 ?auto_1029 ) ) ( not ( = ?auto_1034 ?auto_1031 ) ) ( HOIST-AT ?auto_1036 ?auto_1034 ) ( not ( = ?auto_1032 ?auto_1036 ) ) ( AVAILABLE ?auto_1036 ) ( SURFACE-AT ?auto_1029 ?auto_1034 ) ( ON ?auto_1029 ?auto_1033 ) ( CLEAR ?auto_1029 ) ( not ( = ?auto_1028 ?auto_1033 ) ) ( not ( = ?auto_1029 ?auto_1033 ) ) ( not ( = ?auto_1035 ?auto_1033 ) ) ( TRUCK-AT ?auto_1030 ?auto_1031 ) )
    :subtasks
    ( ( !DRIVE ?auto_1030 ?auto_1031 ?auto_1034 )
      ( MAKE-2CRATE ?auto_1035 ?auto_1028 ?auto_1029 )
      ( MAKE-1CRATE-VERIFY ?auto_1028 ?auto_1029 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1037 - SURFACE
      ?auto_1038 - SURFACE
      ?auto_1039 - SURFACE
    )
    :vars
    (
      ?auto_1042 - HOIST
      ?auto_1040 - PLACE
      ?auto_1041 - PLACE
      ?auto_1044 - HOIST
      ?auto_1043 - SURFACE
      ?auto_1045 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1042 ?auto_1040 ) ( SURFACE-AT ?auto_1038 ?auto_1040 ) ( CLEAR ?auto_1038 ) ( IS-CRATE ?auto_1039 ) ( not ( = ?auto_1038 ?auto_1039 ) ) ( AVAILABLE ?auto_1042 ) ( ON ?auto_1038 ?auto_1037 ) ( not ( = ?auto_1037 ?auto_1038 ) ) ( not ( = ?auto_1037 ?auto_1039 ) ) ( not ( = ?auto_1041 ?auto_1040 ) ) ( HOIST-AT ?auto_1044 ?auto_1041 ) ( not ( = ?auto_1042 ?auto_1044 ) ) ( AVAILABLE ?auto_1044 ) ( SURFACE-AT ?auto_1039 ?auto_1041 ) ( ON ?auto_1039 ?auto_1043 ) ( CLEAR ?auto_1039 ) ( not ( = ?auto_1038 ?auto_1043 ) ) ( not ( = ?auto_1039 ?auto_1043 ) ) ( not ( = ?auto_1037 ?auto_1043 ) ) ( TRUCK-AT ?auto_1045 ?auto_1040 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1038 ?auto_1039 )
      ( MAKE-2CRATE-VERIFY ?auto_1037 ?auto_1038 ?auto_1039 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1046 - SURFACE
      ?auto_1047 - SURFACE
    )
    :vars
    (
      ?auto_1049 - HOIST
      ?auto_1053 - PLACE
      ?auto_1048 - SURFACE
      ?auto_1051 - PLACE
      ?auto_1054 - HOIST
      ?auto_1052 - SURFACE
      ?auto_1050 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1049 ?auto_1053 ) ( IS-CRATE ?auto_1047 ) ( not ( = ?auto_1046 ?auto_1047 ) ) ( not ( = ?auto_1048 ?auto_1046 ) ) ( not ( = ?auto_1048 ?auto_1047 ) ) ( not ( = ?auto_1051 ?auto_1053 ) ) ( HOIST-AT ?auto_1054 ?auto_1051 ) ( not ( = ?auto_1049 ?auto_1054 ) ) ( AVAILABLE ?auto_1054 ) ( SURFACE-AT ?auto_1047 ?auto_1051 ) ( ON ?auto_1047 ?auto_1052 ) ( CLEAR ?auto_1047 ) ( not ( = ?auto_1046 ?auto_1052 ) ) ( not ( = ?auto_1047 ?auto_1052 ) ) ( not ( = ?auto_1048 ?auto_1052 ) ) ( TRUCK-AT ?auto_1050 ?auto_1053 ) ( SURFACE-AT ?auto_1048 ?auto_1053 ) ( CLEAR ?auto_1048 ) ( LIFTING ?auto_1049 ?auto_1046 ) ( IS-CRATE ?auto_1046 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1048 ?auto_1046 )
      ( MAKE-2CRATE ?auto_1048 ?auto_1046 ?auto_1047 )
      ( MAKE-1CRATE-VERIFY ?auto_1046 ?auto_1047 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1055 - SURFACE
      ?auto_1056 - SURFACE
      ?auto_1057 - SURFACE
    )
    :vars
    (
      ?auto_1059 - HOIST
      ?auto_1063 - PLACE
      ?auto_1060 - PLACE
      ?auto_1058 - HOIST
      ?auto_1062 - SURFACE
      ?auto_1061 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1059 ?auto_1063 ) ( IS-CRATE ?auto_1057 ) ( not ( = ?auto_1056 ?auto_1057 ) ) ( not ( = ?auto_1055 ?auto_1056 ) ) ( not ( = ?auto_1055 ?auto_1057 ) ) ( not ( = ?auto_1060 ?auto_1063 ) ) ( HOIST-AT ?auto_1058 ?auto_1060 ) ( not ( = ?auto_1059 ?auto_1058 ) ) ( AVAILABLE ?auto_1058 ) ( SURFACE-AT ?auto_1057 ?auto_1060 ) ( ON ?auto_1057 ?auto_1062 ) ( CLEAR ?auto_1057 ) ( not ( = ?auto_1056 ?auto_1062 ) ) ( not ( = ?auto_1057 ?auto_1062 ) ) ( not ( = ?auto_1055 ?auto_1062 ) ) ( TRUCK-AT ?auto_1061 ?auto_1063 ) ( SURFACE-AT ?auto_1055 ?auto_1063 ) ( CLEAR ?auto_1055 ) ( LIFTING ?auto_1059 ?auto_1056 ) ( IS-CRATE ?auto_1056 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1056 ?auto_1057 )
      ( MAKE-2CRATE-VERIFY ?auto_1055 ?auto_1056 ?auto_1057 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1064 - SURFACE
      ?auto_1065 - SURFACE
    )
    :vars
    (
      ?auto_1069 - HOIST
      ?auto_1072 - PLACE
      ?auto_1071 - SURFACE
      ?auto_1067 - PLACE
      ?auto_1068 - HOIST
      ?auto_1066 - SURFACE
      ?auto_1070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1069 ?auto_1072 ) ( IS-CRATE ?auto_1065 ) ( not ( = ?auto_1064 ?auto_1065 ) ) ( not ( = ?auto_1071 ?auto_1064 ) ) ( not ( = ?auto_1071 ?auto_1065 ) ) ( not ( = ?auto_1067 ?auto_1072 ) ) ( HOIST-AT ?auto_1068 ?auto_1067 ) ( not ( = ?auto_1069 ?auto_1068 ) ) ( AVAILABLE ?auto_1068 ) ( SURFACE-AT ?auto_1065 ?auto_1067 ) ( ON ?auto_1065 ?auto_1066 ) ( CLEAR ?auto_1065 ) ( not ( = ?auto_1064 ?auto_1066 ) ) ( not ( = ?auto_1065 ?auto_1066 ) ) ( not ( = ?auto_1071 ?auto_1066 ) ) ( TRUCK-AT ?auto_1070 ?auto_1072 ) ( SURFACE-AT ?auto_1071 ?auto_1072 ) ( CLEAR ?auto_1071 ) ( IS-CRATE ?auto_1064 ) ( AVAILABLE ?auto_1069 ) ( IN ?auto_1064 ?auto_1070 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1069 ?auto_1064 ?auto_1070 ?auto_1072 )
      ( MAKE-2CRATE ?auto_1071 ?auto_1064 ?auto_1065 )
      ( MAKE-1CRATE-VERIFY ?auto_1064 ?auto_1065 ) )
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
      ?auto_1078 - HOIST
      ?auto_1080 - PLACE
      ?auto_1081 - PLACE
      ?auto_1079 - HOIST
      ?auto_1076 - SURFACE
      ?auto_1077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1078 ?auto_1080 ) ( IS-CRATE ?auto_1075 ) ( not ( = ?auto_1074 ?auto_1075 ) ) ( not ( = ?auto_1073 ?auto_1074 ) ) ( not ( = ?auto_1073 ?auto_1075 ) ) ( not ( = ?auto_1081 ?auto_1080 ) ) ( HOIST-AT ?auto_1079 ?auto_1081 ) ( not ( = ?auto_1078 ?auto_1079 ) ) ( AVAILABLE ?auto_1079 ) ( SURFACE-AT ?auto_1075 ?auto_1081 ) ( ON ?auto_1075 ?auto_1076 ) ( CLEAR ?auto_1075 ) ( not ( = ?auto_1074 ?auto_1076 ) ) ( not ( = ?auto_1075 ?auto_1076 ) ) ( not ( = ?auto_1073 ?auto_1076 ) ) ( TRUCK-AT ?auto_1077 ?auto_1080 ) ( SURFACE-AT ?auto_1073 ?auto_1080 ) ( CLEAR ?auto_1073 ) ( IS-CRATE ?auto_1074 ) ( AVAILABLE ?auto_1078 ) ( IN ?auto_1074 ?auto_1077 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1074 ?auto_1075 )
      ( MAKE-2CRATE-VERIFY ?auto_1073 ?auto_1074 ?auto_1075 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1118 - SURFACE
      ?auto_1119 - SURFACE
    )
    :vars
    (
      ?auto_1125 - HOIST
      ?auto_1123 - PLACE
      ?auto_1126 - SURFACE
      ?auto_1122 - PLACE
      ?auto_1121 - HOIST
      ?auto_1124 - SURFACE
      ?auto_1120 - TRUCK
      ?auto_1127 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1125 ?auto_1123 ) ( SURFACE-AT ?auto_1118 ?auto_1123 ) ( CLEAR ?auto_1118 ) ( IS-CRATE ?auto_1119 ) ( not ( = ?auto_1118 ?auto_1119 ) ) ( AVAILABLE ?auto_1125 ) ( ON ?auto_1118 ?auto_1126 ) ( not ( = ?auto_1126 ?auto_1118 ) ) ( not ( = ?auto_1126 ?auto_1119 ) ) ( not ( = ?auto_1122 ?auto_1123 ) ) ( HOIST-AT ?auto_1121 ?auto_1122 ) ( not ( = ?auto_1125 ?auto_1121 ) ) ( AVAILABLE ?auto_1121 ) ( SURFACE-AT ?auto_1119 ?auto_1122 ) ( ON ?auto_1119 ?auto_1124 ) ( CLEAR ?auto_1119 ) ( not ( = ?auto_1118 ?auto_1124 ) ) ( not ( = ?auto_1119 ?auto_1124 ) ) ( not ( = ?auto_1126 ?auto_1124 ) ) ( TRUCK-AT ?auto_1120 ?auto_1127 ) ( not ( = ?auto_1127 ?auto_1123 ) ) ( not ( = ?auto_1122 ?auto_1127 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1120 ?auto_1127 ?auto_1123 )
      ( MAKE-1CRATE ?auto_1118 ?auto_1119 )
      ( MAKE-1CRATE-VERIFY ?auto_1118 ?auto_1119 ) )
  )

)

