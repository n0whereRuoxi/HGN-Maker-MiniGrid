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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_908 - SURFACE
      ?auto_909 - SURFACE
    )
    :vars
    (
      ?auto_910 - HOIST
      ?auto_911 - PLACE
      ?auto_912 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_910 ?auto_911 ) ( AVAILABLE ?auto_910 ) ( SURFACE-AT ?auto_912 ?auto_911 ) ( ON ?auto_912 ?auto_909 ) ( CLEAR ?auto_912 ) ( IS-CRATE ?auto_912 ) ( ON ?auto_909 ?auto_908 ) ( not ( = ?auto_908 ?auto_909 ) ) ( not ( = ?auto_908 ?auto_912 ) ) ( not ( = ?auto_909 ?auto_912 ) ) )
    :subtasks
    ( ( !LIFT ?auto_910 ?auto_912 ?auto_909 ?auto_911 )
      ( MAKE-1CRATE-VERIFY ?auto_908 ?auto_909 ) )
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
    )
    :precondition
    ( and ( HOIST-AT ?auto_923 ?auto_924 ) ( SURFACE-AT ?auto_921 ?auto_924 ) ( CLEAR ?auto_921 ) ( LIFTING ?auto_923 ?auto_922 ) ( IS-CRATE ?auto_922 ) ( not ( = ?auto_921 ?auto_922 ) ) )
    :subtasks
    ( ( !DROP ?auto_923 ?auto_922 ?auto_921 ?auto_924 )
      ( MAKE-1CRATE-VERIFY ?auto_921 ?auto_922 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_925 - SURFACE
      ?auto_926 - SURFACE
    )
    :vars
    (
      ?auto_928 - HOIST
      ?auto_927 - PLACE
      ?auto_929 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_928 ?auto_927 ) ( SURFACE-AT ?auto_925 ?auto_927 ) ( CLEAR ?auto_925 ) ( IS-CRATE ?auto_926 ) ( not ( = ?auto_925 ?auto_926 ) ) ( TRUCK-AT ?auto_929 ?auto_927 ) ( AVAILABLE ?auto_928 ) ( IN ?auto_926 ?auto_929 ) )
    :subtasks
    ( ( !UNLOAD ?auto_928 ?auto_926 ?auto_929 ?auto_927 )
      ( MAKE-1CRATE ?auto_925 ?auto_926 )
      ( MAKE-1CRATE-VERIFY ?auto_925 ?auto_926 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_930 - SURFACE
      ?auto_931 - SURFACE
    )
    :vars
    (
      ?auto_933 - HOIST
      ?auto_932 - PLACE
      ?auto_934 - TRUCK
      ?auto_935 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_933 ?auto_932 ) ( SURFACE-AT ?auto_930 ?auto_932 ) ( CLEAR ?auto_930 ) ( IS-CRATE ?auto_931 ) ( not ( = ?auto_930 ?auto_931 ) ) ( TRUCK-AT ?auto_934 ?auto_932 ) ( IN ?auto_931 ?auto_934 ) ( LIFTING ?auto_933 ?auto_935 ) ( IS-CRATE ?auto_935 ) ( not ( = ?auto_930 ?auto_935 ) ) ( not ( = ?auto_931 ?auto_935 ) ) )
    :subtasks
    ( ( !LOAD ?auto_933 ?auto_935 ?auto_934 ?auto_932 )
      ( MAKE-1CRATE ?auto_930 ?auto_931 )
      ( MAKE-1CRATE-VERIFY ?auto_930 ?auto_931 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_936 - SURFACE
      ?auto_937 - SURFACE
    )
    :vars
    (
      ?auto_938 - HOIST
      ?auto_940 - PLACE
      ?auto_941 - TRUCK
      ?auto_939 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_938 ?auto_940 ) ( SURFACE-AT ?auto_936 ?auto_940 ) ( IS-CRATE ?auto_937 ) ( not ( = ?auto_936 ?auto_937 ) ) ( TRUCK-AT ?auto_941 ?auto_940 ) ( IN ?auto_937 ?auto_941 ) ( IS-CRATE ?auto_939 ) ( not ( = ?auto_936 ?auto_939 ) ) ( not ( = ?auto_937 ?auto_939 ) ) ( AVAILABLE ?auto_938 ) ( SURFACE-AT ?auto_939 ?auto_940 ) ( ON ?auto_939 ?auto_936 ) ( CLEAR ?auto_939 ) )
    :subtasks
    ( ( !LIFT ?auto_938 ?auto_939 ?auto_936 ?auto_940 )
      ( MAKE-1CRATE ?auto_936 ?auto_937 )
      ( MAKE-1CRATE-VERIFY ?auto_936 ?auto_937 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_942 - SURFACE
      ?auto_943 - SURFACE
    )
    :vars
    (
      ?auto_945 - HOIST
      ?auto_947 - PLACE
      ?auto_944 - TRUCK
      ?auto_946 - SURFACE
      ?auto_948 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_945 ?auto_947 ) ( SURFACE-AT ?auto_942 ?auto_947 ) ( IS-CRATE ?auto_943 ) ( not ( = ?auto_942 ?auto_943 ) ) ( TRUCK-AT ?auto_944 ?auto_947 ) ( IN ?auto_943 ?auto_944 ) ( IS-CRATE ?auto_946 ) ( not ( = ?auto_942 ?auto_946 ) ) ( not ( = ?auto_943 ?auto_946 ) ) ( SURFACE-AT ?auto_946 ?auto_947 ) ( ON ?auto_946 ?auto_942 ) ( CLEAR ?auto_946 ) ( LIFTING ?auto_945 ?auto_948 ) ( IS-CRATE ?auto_948 ) ( not ( = ?auto_942 ?auto_948 ) ) ( not ( = ?auto_943 ?auto_948 ) ) ( not ( = ?auto_946 ?auto_948 ) ) )
    :subtasks
    ( ( !LOAD ?auto_945 ?auto_948 ?auto_944 ?auto_947 )
      ( MAKE-1CRATE ?auto_942 ?auto_943 )
      ( MAKE-1CRATE-VERIFY ?auto_942 ?auto_943 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_949 - SURFACE
      ?auto_950 - SURFACE
    )
    :vars
    (
      ?auto_952 - HOIST
      ?auto_953 - PLACE
      ?auto_954 - TRUCK
      ?auto_951 - SURFACE
      ?auto_955 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_952 ?auto_953 ) ( SURFACE-AT ?auto_949 ?auto_953 ) ( IS-CRATE ?auto_950 ) ( not ( = ?auto_949 ?auto_950 ) ) ( TRUCK-AT ?auto_954 ?auto_953 ) ( IN ?auto_950 ?auto_954 ) ( IS-CRATE ?auto_951 ) ( not ( = ?auto_949 ?auto_951 ) ) ( not ( = ?auto_950 ?auto_951 ) ) ( SURFACE-AT ?auto_951 ?auto_953 ) ( ON ?auto_951 ?auto_949 ) ( IS-CRATE ?auto_955 ) ( not ( = ?auto_949 ?auto_955 ) ) ( not ( = ?auto_950 ?auto_955 ) ) ( not ( = ?auto_951 ?auto_955 ) ) ( AVAILABLE ?auto_952 ) ( SURFACE-AT ?auto_955 ?auto_953 ) ( ON ?auto_955 ?auto_951 ) ( CLEAR ?auto_955 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_949 ?auto_951 )
      ( MAKE-1CRATE ?auto_949 ?auto_950 )
      ( MAKE-1CRATE-VERIFY ?auto_949 ?auto_950 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_956 - SURFACE
      ?auto_957 - SURFACE
    )
    :vars
    (
      ?auto_962 - HOIST
      ?auto_959 - PLACE
      ?auto_958 - TRUCK
      ?auto_961 - SURFACE
      ?auto_960 - SURFACE
      ?auto_963 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_962 ?auto_959 ) ( SURFACE-AT ?auto_956 ?auto_959 ) ( IS-CRATE ?auto_957 ) ( not ( = ?auto_956 ?auto_957 ) ) ( IN ?auto_957 ?auto_958 ) ( IS-CRATE ?auto_961 ) ( not ( = ?auto_956 ?auto_961 ) ) ( not ( = ?auto_957 ?auto_961 ) ) ( SURFACE-AT ?auto_961 ?auto_959 ) ( ON ?auto_961 ?auto_956 ) ( IS-CRATE ?auto_960 ) ( not ( = ?auto_956 ?auto_960 ) ) ( not ( = ?auto_957 ?auto_960 ) ) ( not ( = ?auto_961 ?auto_960 ) ) ( AVAILABLE ?auto_962 ) ( SURFACE-AT ?auto_960 ?auto_959 ) ( ON ?auto_960 ?auto_961 ) ( CLEAR ?auto_960 ) ( TRUCK-AT ?auto_958 ?auto_963 ) ( not ( = ?auto_963 ?auto_959 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_958 ?auto_963 ?auto_959 )
      ( MAKE-1CRATE ?auto_956 ?auto_957 )
      ( MAKE-1CRATE-VERIFY ?auto_956 ?auto_957 ) )
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
      ?auto_969 - PLACE
      ?auto_967 - SURFACE
      ?auto_966 - SURFACE
      ?auto_971 - TRUCK
      ?auto_970 - PLACE
      ?auto_972 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_968 ?auto_969 ) ( SURFACE-AT ?auto_964 ?auto_969 ) ( IS-CRATE ?auto_965 ) ( not ( = ?auto_964 ?auto_965 ) ) ( IS-CRATE ?auto_967 ) ( not ( = ?auto_964 ?auto_967 ) ) ( not ( = ?auto_965 ?auto_967 ) ) ( SURFACE-AT ?auto_967 ?auto_969 ) ( ON ?auto_967 ?auto_964 ) ( IS-CRATE ?auto_966 ) ( not ( = ?auto_964 ?auto_966 ) ) ( not ( = ?auto_965 ?auto_966 ) ) ( not ( = ?auto_967 ?auto_966 ) ) ( AVAILABLE ?auto_968 ) ( SURFACE-AT ?auto_966 ?auto_969 ) ( ON ?auto_966 ?auto_967 ) ( CLEAR ?auto_966 ) ( TRUCK-AT ?auto_971 ?auto_970 ) ( not ( = ?auto_970 ?auto_969 ) ) ( HOIST-AT ?auto_972 ?auto_970 ) ( LIFTING ?auto_972 ?auto_965 ) ( not ( = ?auto_968 ?auto_972 ) ) )
    :subtasks
    ( ( !LOAD ?auto_972 ?auto_965 ?auto_971 ?auto_970 )
      ( MAKE-1CRATE ?auto_964 ?auto_965 )
      ( MAKE-1CRATE-VERIFY ?auto_964 ?auto_965 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_973 - SURFACE
      ?auto_974 - SURFACE
    )
    :vars
    (
      ?auto_977 - HOIST
      ?auto_980 - PLACE
      ?auto_978 - SURFACE
      ?auto_975 - SURFACE
      ?auto_976 - TRUCK
      ?auto_981 - PLACE
      ?auto_979 - HOIST
      ?auto_982 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_977 ?auto_980 ) ( SURFACE-AT ?auto_973 ?auto_980 ) ( IS-CRATE ?auto_974 ) ( not ( = ?auto_973 ?auto_974 ) ) ( IS-CRATE ?auto_978 ) ( not ( = ?auto_973 ?auto_978 ) ) ( not ( = ?auto_974 ?auto_978 ) ) ( SURFACE-AT ?auto_978 ?auto_980 ) ( ON ?auto_978 ?auto_973 ) ( IS-CRATE ?auto_975 ) ( not ( = ?auto_973 ?auto_975 ) ) ( not ( = ?auto_974 ?auto_975 ) ) ( not ( = ?auto_978 ?auto_975 ) ) ( AVAILABLE ?auto_977 ) ( SURFACE-AT ?auto_975 ?auto_980 ) ( ON ?auto_975 ?auto_978 ) ( CLEAR ?auto_975 ) ( TRUCK-AT ?auto_976 ?auto_981 ) ( not ( = ?auto_981 ?auto_980 ) ) ( HOIST-AT ?auto_979 ?auto_981 ) ( not ( = ?auto_977 ?auto_979 ) ) ( AVAILABLE ?auto_979 ) ( SURFACE-AT ?auto_974 ?auto_981 ) ( ON ?auto_974 ?auto_982 ) ( CLEAR ?auto_974 ) ( not ( = ?auto_973 ?auto_982 ) ) ( not ( = ?auto_974 ?auto_982 ) ) ( not ( = ?auto_978 ?auto_982 ) ) ( not ( = ?auto_975 ?auto_982 ) ) )
    :subtasks
    ( ( !LIFT ?auto_979 ?auto_974 ?auto_982 ?auto_981 )
      ( MAKE-1CRATE ?auto_973 ?auto_974 )
      ( MAKE-1CRATE-VERIFY ?auto_973 ?auto_974 ) )
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
      ?auto_996 - PLACE
      ?auto_997 - TRUCK
      ?auto_999 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_998 ?auto_996 ) ( SURFACE-AT ?auto_994 ?auto_996 ) ( CLEAR ?auto_994 ) ( IS-CRATE ?auto_995 ) ( not ( = ?auto_994 ?auto_995 ) ) ( AVAILABLE ?auto_998 ) ( IN ?auto_995 ?auto_997 ) ( TRUCK-AT ?auto_997 ?auto_999 ) ( not ( = ?auto_999 ?auto_996 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_997 ?auto_999 ?auto_996 )
      ( MAKE-1CRATE ?auto_994 ?auto_995 )
      ( MAKE-1CRATE-VERIFY ?auto_994 ?auto_995 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1008 - SURFACE
      ?auto_1009 - SURFACE
    )
    :vars
    (
      ?auto_1013 - HOIST
      ?auto_1011 - PLACE
      ?auto_1012 - TRUCK
      ?auto_1010 - PLACE
      ?auto_1014 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1013 ?auto_1011 ) ( SURFACE-AT ?auto_1008 ?auto_1011 ) ( CLEAR ?auto_1008 ) ( IS-CRATE ?auto_1009 ) ( not ( = ?auto_1008 ?auto_1009 ) ) ( AVAILABLE ?auto_1013 ) ( TRUCK-AT ?auto_1012 ?auto_1010 ) ( not ( = ?auto_1010 ?auto_1011 ) ) ( HOIST-AT ?auto_1014 ?auto_1010 ) ( LIFTING ?auto_1014 ?auto_1009 ) ( not ( = ?auto_1013 ?auto_1014 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1014 ?auto_1009 ?auto_1012 ?auto_1010 )
      ( MAKE-1CRATE ?auto_1008 ?auto_1009 )
      ( MAKE-1CRATE-VERIFY ?auto_1008 ?auto_1009 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1015 - SURFACE
      ?auto_1016 - SURFACE
    )
    :vars
    (
      ?auto_1020 - HOIST
      ?auto_1019 - PLACE
      ?auto_1021 - TRUCK
      ?auto_1017 - PLACE
      ?auto_1018 - HOIST
      ?auto_1022 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1020 ?auto_1019 ) ( SURFACE-AT ?auto_1015 ?auto_1019 ) ( CLEAR ?auto_1015 ) ( IS-CRATE ?auto_1016 ) ( not ( = ?auto_1015 ?auto_1016 ) ) ( AVAILABLE ?auto_1020 ) ( TRUCK-AT ?auto_1021 ?auto_1017 ) ( not ( = ?auto_1017 ?auto_1019 ) ) ( HOIST-AT ?auto_1018 ?auto_1017 ) ( not ( = ?auto_1020 ?auto_1018 ) ) ( AVAILABLE ?auto_1018 ) ( SURFACE-AT ?auto_1016 ?auto_1017 ) ( ON ?auto_1016 ?auto_1022 ) ( CLEAR ?auto_1016 ) ( not ( = ?auto_1015 ?auto_1022 ) ) ( not ( = ?auto_1016 ?auto_1022 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1018 ?auto_1016 ?auto_1022 ?auto_1017 )
      ( MAKE-1CRATE ?auto_1015 ?auto_1016 )
      ( MAKE-1CRATE-VERIFY ?auto_1015 ?auto_1016 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1023 - SURFACE
      ?auto_1024 - SURFACE
    )
    :vars
    (
      ?auto_1029 - HOIST
      ?auto_1025 - PLACE
      ?auto_1026 - PLACE
      ?auto_1027 - HOIST
      ?auto_1030 - SURFACE
      ?auto_1028 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1029 ?auto_1025 ) ( SURFACE-AT ?auto_1023 ?auto_1025 ) ( CLEAR ?auto_1023 ) ( IS-CRATE ?auto_1024 ) ( not ( = ?auto_1023 ?auto_1024 ) ) ( AVAILABLE ?auto_1029 ) ( not ( = ?auto_1026 ?auto_1025 ) ) ( HOIST-AT ?auto_1027 ?auto_1026 ) ( not ( = ?auto_1029 ?auto_1027 ) ) ( AVAILABLE ?auto_1027 ) ( SURFACE-AT ?auto_1024 ?auto_1026 ) ( ON ?auto_1024 ?auto_1030 ) ( CLEAR ?auto_1024 ) ( not ( = ?auto_1023 ?auto_1030 ) ) ( not ( = ?auto_1024 ?auto_1030 ) ) ( TRUCK-AT ?auto_1028 ?auto_1025 ) )
    :subtasks
    ( ( !DRIVE ?auto_1028 ?auto_1025 ?auto_1026 )
      ( MAKE-1CRATE ?auto_1023 ?auto_1024 )
      ( MAKE-1CRATE-VERIFY ?auto_1023 ?auto_1024 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1031 - SURFACE
      ?auto_1032 - SURFACE
    )
    :vars
    (
      ?auto_1035 - HOIST
      ?auto_1034 - PLACE
      ?auto_1037 - PLACE
      ?auto_1033 - HOIST
      ?auto_1036 - SURFACE
      ?auto_1038 - TRUCK
      ?auto_1039 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1035 ?auto_1034 ) ( SURFACE-AT ?auto_1031 ?auto_1034 ) ( CLEAR ?auto_1031 ) ( IS-CRATE ?auto_1032 ) ( not ( = ?auto_1031 ?auto_1032 ) ) ( not ( = ?auto_1037 ?auto_1034 ) ) ( HOIST-AT ?auto_1033 ?auto_1037 ) ( not ( = ?auto_1035 ?auto_1033 ) ) ( AVAILABLE ?auto_1033 ) ( SURFACE-AT ?auto_1032 ?auto_1037 ) ( ON ?auto_1032 ?auto_1036 ) ( CLEAR ?auto_1032 ) ( not ( = ?auto_1031 ?auto_1036 ) ) ( not ( = ?auto_1032 ?auto_1036 ) ) ( TRUCK-AT ?auto_1038 ?auto_1034 ) ( LIFTING ?auto_1035 ?auto_1039 ) ( IS-CRATE ?auto_1039 ) ( not ( = ?auto_1031 ?auto_1039 ) ) ( not ( = ?auto_1032 ?auto_1039 ) ) ( not ( = ?auto_1036 ?auto_1039 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1035 ?auto_1039 ?auto_1038 ?auto_1034 )
      ( MAKE-1CRATE ?auto_1031 ?auto_1032 )
      ( MAKE-1CRATE-VERIFY ?auto_1031 ?auto_1032 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1057 - SURFACE
      ?auto_1058 - SURFACE
    )
    :vars
    (
      ?auto_1059 - HOIST
      ?auto_1060 - PLACE
      ?auto_1061 - SURFACE
      ?auto_1063 - SURFACE
      ?auto_1062 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1059 ?auto_1060 ) ( SURFACE-AT ?auto_1061 ?auto_1060 ) ( ON ?auto_1061 ?auto_1058 ) ( CLEAR ?auto_1061 ) ( IS-CRATE ?auto_1061 ) ( ON ?auto_1058 ?auto_1057 ) ( not ( = ?auto_1057 ?auto_1058 ) ) ( not ( = ?auto_1057 ?auto_1061 ) ) ( not ( = ?auto_1058 ?auto_1061 ) ) ( SURFACE-AT ?auto_1063 ?auto_1060 ) ( CLEAR ?auto_1063 ) ( LIFTING ?auto_1059 ?auto_1062 ) ( IS-CRATE ?auto_1062 ) ( not ( = ?auto_1057 ?auto_1063 ) ) ( not ( = ?auto_1057 ?auto_1062 ) ) ( not ( = ?auto_1058 ?auto_1063 ) ) ( not ( = ?auto_1058 ?auto_1062 ) ) ( not ( = ?auto_1061 ?auto_1063 ) ) ( not ( = ?auto_1061 ?auto_1062 ) ) ( not ( = ?auto_1063 ?auto_1062 ) ) )
    :subtasks
    ( ( !DROP ?auto_1059 ?auto_1062 ?auto_1063 ?auto_1060 )
      ( MAKE-1CRATE ?auto_1057 ?auto_1058 )
      ( MAKE-1CRATE-VERIFY ?auto_1057 ?auto_1058 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1131 - SURFACE
      ?auto_1132 - SURFACE
    )
    :vars
    (
      ?auto_1135 - HOIST
      ?auto_1133 - PLACE
      ?auto_1136 - TRUCK
      ?auto_1137 - SURFACE
      ?auto_1134 - SURFACE
      ?auto_1139 - SURFACE
      ?auto_1138 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1135 ?auto_1133 ) ( SURFACE-AT ?auto_1131 ?auto_1133 ) ( IS-CRATE ?auto_1132 ) ( not ( = ?auto_1131 ?auto_1132 ) ) ( TRUCK-AT ?auto_1136 ?auto_1133 ) ( IN ?auto_1132 ?auto_1136 ) ( IS-CRATE ?auto_1137 ) ( not ( = ?auto_1131 ?auto_1137 ) ) ( not ( = ?auto_1132 ?auto_1137 ) ) ( SURFACE-AT ?auto_1137 ?auto_1133 ) ( ON ?auto_1137 ?auto_1131 ) ( IS-CRATE ?auto_1134 ) ( not ( = ?auto_1131 ?auto_1134 ) ) ( not ( = ?auto_1132 ?auto_1134 ) ) ( not ( = ?auto_1137 ?auto_1134 ) ) ( SURFACE-AT ?auto_1134 ?auto_1133 ) ( ON ?auto_1134 ?auto_1137 ) ( CLEAR ?auto_1134 ) ( SURFACE-AT ?auto_1139 ?auto_1133 ) ( CLEAR ?auto_1139 ) ( LIFTING ?auto_1135 ?auto_1138 ) ( IS-CRATE ?auto_1138 ) ( not ( = ?auto_1131 ?auto_1139 ) ) ( not ( = ?auto_1131 ?auto_1138 ) ) ( not ( = ?auto_1132 ?auto_1139 ) ) ( not ( = ?auto_1132 ?auto_1138 ) ) ( not ( = ?auto_1137 ?auto_1139 ) ) ( not ( = ?auto_1137 ?auto_1138 ) ) ( not ( = ?auto_1134 ?auto_1139 ) ) ( not ( = ?auto_1134 ?auto_1138 ) ) ( not ( = ?auto_1139 ?auto_1138 ) ) )
    :subtasks
    ( ( !DROP ?auto_1135 ?auto_1138 ?auto_1139 ?auto_1133 )
      ( MAKE-1CRATE ?auto_1131 ?auto_1132 )
      ( MAKE-1CRATE-VERIFY ?auto_1131 ?auto_1132 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1142 - SURFACE
      ?auto_1143 - SURFACE
    )
    :vars
    (
      ?auto_1148 - HOIST
      ?auto_1147 - PLACE
      ?auto_1145 - TRUCK
      ?auto_1144 - SURFACE
      ?auto_1146 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1148 ?auto_1147 ) ( SURFACE-AT ?auto_1142 ?auto_1147 ) ( IS-CRATE ?auto_1143 ) ( not ( = ?auto_1142 ?auto_1143 ) ) ( TRUCK-AT ?auto_1145 ?auto_1147 ) ( IS-CRATE ?auto_1144 ) ( not ( = ?auto_1142 ?auto_1144 ) ) ( not ( = ?auto_1143 ?auto_1144 ) ) ( SURFACE-AT ?auto_1144 ?auto_1147 ) ( ON ?auto_1144 ?auto_1142 ) ( IS-CRATE ?auto_1146 ) ( not ( = ?auto_1142 ?auto_1146 ) ) ( not ( = ?auto_1143 ?auto_1146 ) ) ( not ( = ?auto_1144 ?auto_1146 ) ) ( SURFACE-AT ?auto_1146 ?auto_1147 ) ( ON ?auto_1146 ?auto_1144 ) ( CLEAR ?auto_1146 ) ( LIFTING ?auto_1148 ?auto_1143 ) )
    :subtasks
    ( ( !LOAD ?auto_1148 ?auto_1143 ?auto_1145 ?auto_1147 )
      ( MAKE-1CRATE ?auto_1142 ?auto_1143 )
      ( MAKE-1CRATE-VERIFY ?auto_1142 ?auto_1143 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1149 - SURFACE
      ?auto_1150 - SURFACE
    )
    :vars
    (
      ?auto_1151 - HOIST
      ?auto_1155 - PLACE
      ?auto_1153 - TRUCK
      ?auto_1154 - SURFACE
      ?auto_1152 - SURFACE
      ?auto_1156 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1151 ?auto_1155 ) ( SURFACE-AT ?auto_1149 ?auto_1155 ) ( IS-CRATE ?auto_1150 ) ( not ( = ?auto_1149 ?auto_1150 ) ) ( TRUCK-AT ?auto_1153 ?auto_1155 ) ( IS-CRATE ?auto_1154 ) ( not ( = ?auto_1149 ?auto_1154 ) ) ( not ( = ?auto_1150 ?auto_1154 ) ) ( SURFACE-AT ?auto_1154 ?auto_1155 ) ( ON ?auto_1154 ?auto_1149 ) ( IS-CRATE ?auto_1152 ) ( not ( = ?auto_1149 ?auto_1152 ) ) ( not ( = ?auto_1150 ?auto_1152 ) ) ( not ( = ?auto_1154 ?auto_1152 ) ) ( SURFACE-AT ?auto_1152 ?auto_1155 ) ( ON ?auto_1152 ?auto_1154 ) ( CLEAR ?auto_1152 ) ( AVAILABLE ?auto_1151 ) ( SURFACE-AT ?auto_1150 ?auto_1155 ) ( ON ?auto_1150 ?auto_1156 ) ( CLEAR ?auto_1150 ) ( not ( = ?auto_1149 ?auto_1156 ) ) ( not ( = ?auto_1150 ?auto_1156 ) ) ( not ( = ?auto_1154 ?auto_1156 ) ) ( not ( = ?auto_1152 ?auto_1156 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1151 ?auto_1150 ?auto_1156 ?auto_1155 )
      ( MAKE-1CRATE ?auto_1149 ?auto_1150 )
      ( MAKE-1CRATE-VERIFY ?auto_1149 ?auto_1150 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1157 - SURFACE
      ?auto_1158 - SURFACE
    )
    :vars
    (
      ?auto_1163 - HOIST
      ?auto_1160 - PLACE
      ?auto_1161 - TRUCK
      ?auto_1159 - SURFACE
      ?auto_1162 - SURFACE
      ?auto_1164 - SURFACE
      ?auto_1165 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1163 ?auto_1160 ) ( SURFACE-AT ?auto_1157 ?auto_1160 ) ( IS-CRATE ?auto_1158 ) ( not ( = ?auto_1157 ?auto_1158 ) ) ( TRUCK-AT ?auto_1161 ?auto_1160 ) ( IS-CRATE ?auto_1159 ) ( not ( = ?auto_1157 ?auto_1159 ) ) ( not ( = ?auto_1158 ?auto_1159 ) ) ( SURFACE-AT ?auto_1159 ?auto_1160 ) ( ON ?auto_1159 ?auto_1157 ) ( IS-CRATE ?auto_1162 ) ( not ( = ?auto_1157 ?auto_1162 ) ) ( not ( = ?auto_1158 ?auto_1162 ) ) ( not ( = ?auto_1159 ?auto_1162 ) ) ( SURFACE-AT ?auto_1162 ?auto_1160 ) ( ON ?auto_1162 ?auto_1159 ) ( CLEAR ?auto_1162 ) ( SURFACE-AT ?auto_1158 ?auto_1160 ) ( ON ?auto_1158 ?auto_1164 ) ( CLEAR ?auto_1158 ) ( not ( = ?auto_1157 ?auto_1164 ) ) ( not ( = ?auto_1158 ?auto_1164 ) ) ( not ( = ?auto_1159 ?auto_1164 ) ) ( not ( = ?auto_1162 ?auto_1164 ) ) ( LIFTING ?auto_1163 ?auto_1165 ) ( IS-CRATE ?auto_1165 ) ( not ( = ?auto_1157 ?auto_1165 ) ) ( not ( = ?auto_1158 ?auto_1165 ) ) ( not ( = ?auto_1159 ?auto_1165 ) ) ( not ( = ?auto_1162 ?auto_1165 ) ) ( not ( = ?auto_1164 ?auto_1165 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1163 ?auto_1165 ?auto_1161 ?auto_1160 )
      ( MAKE-1CRATE ?auto_1157 ?auto_1158 )
      ( MAKE-1CRATE-VERIFY ?auto_1157 ?auto_1158 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1166 - SURFACE
      ?auto_1167 - SURFACE
    )
    :vars
    (
      ?auto_1170 - HOIST
      ?auto_1172 - PLACE
      ?auto_1174 - TRUCK
      ?auto_1173 - SURFACE
      ?auto_1169 - SURFACE
      ?auto_1168 - SURFACE
      ?auto_1171 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1170 ?auto_1172 ) ( SURFACE-AT ?auto_1166 ?auto_1172 ) ( IS-CRATE ?auto_1167 ) ( not ( = ?auto_1166 ?auto_1167 ) ) ( TRUCK-AT ?auto_1174 ?auto_1172 ) ( IS-CRATE ?auto_1173 ) ( not ( = ?auto_1166 ?auto_1173 ) ) ( not ( = ?auto_1167 ?auto_1173 ) ) ( SURFACE-AT ?auto_1173 ?auto_1172 ) ( ON ?auto_1173 ?auto_1166 ) ( IS-CRATE ?auto_1169 ) ( not ( = ?auto_1166 ?auto_1169 ) ) ( not ( = ?auto_1167 ?auto_1169 ) ) ( not ( = ?auto_1173 ?auto_1169 ) ) ( SURFACE-AT ?auto_1169 ?auto_1172 ) ( ON ?auto_1169 ?auto_1173 ) ( CLEAR ?auto_1169 ) ( SURFACE-AT ?auto_1167 ?auto_1172 ) ( ON ?auto_1167 ?auto_1168 ) ( not ( = ?auto_1166 ?auto_1168 ) ) ( not ( = ?auto_1167 ?auto_1168 ) ) ( not ( = ?auto_1173 ?auto_1168 ) ) ( not ( = ?auto_1169 ?auto_1168 ) ) ( IS-CRATE ?auto_1171 ) ( not ( = ?auto_1166 ?auto_1171 ) ) ( not ( = ?auto_1167 ?auto_1171 ) ) ( not ( = ?auto_1173 ?auto_1171 ) ) ( not ( = ?auto_1169 ?auto_1171 ) ) ( not ( = ?auto_1168 ?auto_1171 ) ) ( AVAILABLE ?auto_1170 ) ( SURFACE-AT ?auto_1171 ?auto_1172 ) ( ON ?auto_1171 ?auto_1167 ) ( CLEAR ?auto_1171 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1168 ?auto_1167 )
      ( MAKE-1CRATE ?auto_1166 ?auto_1167 )
      ( MAKE-1CRATE-VERIFY ?auto_1166 ?auto_1167 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1175 - SURFACE
      ?auto_1176 - SURFACE
    )
    :vars
    (
      ?auto_1181 - HOIST
      ?auto_1183 - PLACE
      ?auto_1180 - SURFACE
      ?auto_1177 - SURFACE
      ?auto_1178 - SURFACE
      ?auto_1182 - SURFACE
      ?auto_1179 - TRUCK
      ?auto_1184 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1181 ?auto_1183 ) ( SURFACE-AT ?auto_1175 ?auto_1183 ) ( IS-CRATE ?auto_1176 ) ( not ( = ?auto_1175 ?auto_1176 ) ) ( IS-CRATE ?auto_1180 ) ( not ( = ?auto_1175 ?auto_1180 ) ) ( not ( = ?auto_1176 ?auto_1180 ) ) ( SURFACE-AT ?auto_1180 ?auto_1183 ) ( ON ?auto_1180 ?auto_1175 ) ( IS-CRATE ?auto_1177 ) ( not ( = ?auto_1175 ?auto_1177 ) ) ( not ( = ?auto_1176 ?auto_1177 ) ) ( not ( = ?auto_1180 ?auto_1177 ) ) ( SURFACE-AT ?auto_1177 ?auto_1183 ) ( ON ?auto_1177 ?auto_1180 ) ( CLEAR ?auto_1177 ) ( SURFACE-AT ?auto_1176 ?auto_1183 ) ( ON ?auto_1176 ?auto_1178 ) ( not ( = ?auto_1175 ?auto_1178 ) ) ( not ( = ?auto_1176 ?auto_1178 ) ) ( not ( = ?auto_1180 ?auto_1178 ) ) ( not ( = ?auto_1177 ?auto_1178 ) ) ( IS-CRATE ?auto_1182 ) ( not ( = ?auto_1175 ?auto_1182 ) ) ( not ( = ?auto_1176 ?auto_1182 ) ) ( not ( = ?auto_1180 ?auto_1182 ) ) ( not ( = ?auto_1177 ?auto_1182 ) ) ( not ( = ?auto_1178 ?auto_1182 ) ) ( AVAILABLE ?auto_1181 ) ( SURFACE-AT ?auto_1182 ?auto_1183 ) ( ON ?auto_1182 ?auto_1176 ) ( CLEAR ?auto_1182 ) ( TRUCK-AT ?auto_1179 ?auto_1184 ) ( not ( = ?auto_1184 ?auto_1183 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1179 ?auto_1184 ?auto_1183 )
      ( MAKE-1CRATE ?auto_1175 ?auto_1176 )
      ( MAKE-1CRATE-VERIFY ?auto_1175 ?auto_1176 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1198 - SURFACE
      ?auto_1199 - SURFACE
      ?auto_1200 - SURFACE
    )
    :vars
    (
      ?auto_1201 - HOIST
      ?auto_1202 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1201 ?auto_1202 ) ( SURFACE-AT ?auto_1199 ?auto_1202 ) ( CLEAR ?auto_1199 ) ( LIFTING ?auto_1201 ?auto_1200 ) ( IS-CRATE ?auto_1200 ) ( not ( = ?auto_1199 ?auto_1200 ) ) ( ON ?auto_1199 ?auto_1198 ) ( not ( = ?auto_1198 ?auto_1199 ) ) ( not ( = ?auto_1198 ?auto_1200 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1199 ?auto_1200 )
      ( MAKE-2CRATE-VERIFY ?auto_1198 ?auto_1199 ?auto_1200 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1208 - SURFACE
      ?auto_1209 - SURFACE
      ?auto_1210 - SURFACE
    )
    :vars
    (
      ?auto_1211 - HOIST
      ?auto_1213 - PLACE
      ?auto_1212 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1211 ?auto_1213 ) ( SURFACE-AT ?auto_1209 ?auto_1213 ) ( CLEAR ?auto_1209 ) ( IS-CRATE ?auto_1210 ) ( not ( = ?auto_1209 ?auto_1210 ) ) ( TRUCK-AT ?auto_1212 ?auto_1213 ) ( AVAILABLE ?auto_1211 ) ( IN ?auto_1210 ?auto_1212 ) ( ON ?auto_1209 ?auto_1208 ) ( not ( = ?auto_1208 ?auto_1209 ) ) ( not ( = ?auto_1208 ?auto_1210 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1209 ?auto_1210 )
      ( MAKE-2CRATE-VERIFY ?auto_1208 ?auto_1209 ?auto_1210 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1214 - SURFACE
      ?auto_1215 - SURFACE
    )
    :vars
    (
      ?auto_1217 - HOIST
      ?auto_1218 - PLACE
      ?auto_1219 - TRUCK
      ?auto_1216 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1217 ?auto_1218 ) ( IS-CRATE ?auto_1215 ) ( not ( = ?auto_1214 ?auto_1215 ) ) ( TRUCK-AT ?auto_1219 ?auto_1218 ) ( IN ?auto_1215 ?auto_1219 ) ( not ( = ?auto_1216 ?auto_1214 ) ) ( not ( = ?auto_1216 ?auto_1215 ) ) ( SURFACE-AT ?auto_1216 ?auto_1218 ) ( CLEAR ?auto_1216 ) ( LIFTING ?auto_1217 ?auto_1214 ) ( IS-CRATE ?auto_1214 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1216 ?auto_1214 )
      ( MAKE-2CRATE ?auto_1216 ?auto_1214 ?auto_1215 )
      ( MAKE-1CRATE-VERIFY ?auto_1214 ?auto_1215 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1220 - SURFACE
      ?auto_1221 - SURFACE
      ?auto_1222 - SURFACE
    )
    :vars
    (
      ?auto_1224 - HOIST
      ?auto_1225 - PLACE
      ?auto_1223 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1224 ?auto_1225 ) ( IS-CRATE ?auto_1222 ) ( not ( = ?auto_1221 ?auto_1222 ) ) ( TRUCK-AT ?auto_1223 ?auto_1225 ) ( IN ?auto_1222 ?auto_1223 ) ( not ( = ?auto_1220 ?auto_1221 ) ) ( not ( = ?auto_1220 ?auto_1222 ) ) ( SURFACE-AT ?auto_1220 ?auto_1225 ) ( CLEAR ?auto_1220 ) ( LIFTING ?auto_1224 ?auto_1221 ) ( IS-CRATE ?auto_1221 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1221 ?auto_1222 )
      ( MAKE-2CRATE-VERIFY ?auto_1220 ?auto_1221 ?auto_1222 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1226 - SURFACE
      ?auto_1227 - SURFACE
    )
    :vars
    (
      ?auto_1230 - HOIST
      ?auto_1228 - PLACE
      ?auto_1229 - TRUCK
      ?auto_1231 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1230 ?auto_1228 ) ( IS-CRATE ?auto_1227 ) ( not ( = ?auto_1226 ?auto_1227 ) ) ( TRUCK-AT ?auto_1229 ?auto_1228 ) ( IN ?auto_1227 ?auto_1229 ) ( not ( = ?auto_1231 ?auto_1226 ) ) ( not ( = ?auto_1231 ?auto_1227 ) ) ( SURFACE-AT ?auto_1231 ?auto_1228 ) ( CLEAR ?auto_1231 ) ( IS-CRATE ?auto_1226 ) ( AVAILABLE ?auto_1230 ) ( IN ?auto_1226 ?auto_1229 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1230 ?auto_1226 ?auto_1229 ?auto_1228 )
      ( MAKE-2CRATE ?auto_1231 ?auto_1226 ?auto_1227 )
      ( MAKE-1CRATE-VERIFY ?auto_1226 ?auto_1227 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1232 - SURFACE
      ?auto_1233 - SURFACE
      ?auto_1234 - SURFACE
    )
    :vars
    (
      ?auto_1237 - HOIST
      ?auto_1236 - PLACE
      ?auto_1235 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1237 ?auto_1236 ) ( IS-CRATE ?auto_1234 ) ( not ( = ?auto_1233 ?auto_1234 ) ) ( TRUCK-AT ?auto_1235 ?auto_1236 ) ( IN ?auto_1234 ?auto_1235 ) ( not ( = ?auto_1232 ?auto_1233 ) ) ( not ( = ?auto_1232 ?auto_1234 ) ) ( SURFACE-AT ?auto_1232 ?auto_1236 ) ( CLEAR ?auto_1232 ) ( IS-CRATE ?auto_1233 ) ( AVAILABLE ?auto_1237 ) ( IN ?auto_1233 ?auto_1235 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1233 ?auto_1234 )
      ( MAKE-2CRATE-VERIFY ?auto_1232 ?auto_1233 ?auto_1234 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1238 - SURFACE
      ?auto_1239 - SURFACE
    )
    :vars
    (
      ?auto_1242 - HOIST
      ?auto_1241 - PLACE
      ?auto_1240 - TRUCK
      ?auto_1243 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1242 ?auto_1241 ) ( IS-CRATE ?auto_1239 ) ( not ( = ?auto_1238 ?auto_1239 ) ) ( TRUCK-AT ?auto_1240 ?auto_1241 ) ( not ( = ?auto_1243 ?auto_1238 ) ) ( not ( = ?auto_1243 ?auto_1239 ) ) ( SURFACE-AT ?auto_1243 ?auto_1241 ) ( CLEAR ?auto_1243 ) ( IS-CRATE ?auto_1238 ) ( IN ?auto_1238 ?auto_1240 ) ( LIFTING ?auto_1242 ?auto_1239 ) )
    :subtasks
    ( ( !LOAD ?auto_1242 ?auto_1239 ?auto_1240 ?auto_1241 )
      ( MAKE-2CRATE ?auto_1243 ?auto_1238 ?auto_1239 )
      ( MAKE-1CRATE-VERIFY ?auto_1238 ?auto_1239 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1244 - SURFACE
      ?auto_1245 - SURFACE
      ?auto_1246 - SURFACE
    )
    :vars
    (
      ?auto_1249 - HOIST
      ?auto_1247 - PLACE
      ?auto_1248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1249 ?auto_1247 ) ( IS-CRATE ?auto_1246 ) ( not ( = ?auto_1245 ?auto_1246 ) ) ( TRUCK-AT ?auto_1248 ?auto_1247 ) ( not ( = ?auto_1244 ?auto_1245 ) ) ( not ( = ?auto_1244 ?auto_1246 ) ) ( SURFACE-AT ?auto_1244 ?auto_1247 ) ( CLEAR ?auto_1244 ) ( IS-CRATE ?auto_1245 ) ( IN ?auto_1245 ?auto_1248 ) ( LIFTING ?auto_1249 ?auto_1246 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1245 ?auto_1246 )
      ( MAKE-2CRATE-VERIFY ?auto_1244 ?auto_1245 ?auto_1246 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1250 - SURFACE
      ?auto_1251 - SURFACE
    )
    :vars
    (
      ?auto_1254 - HOIST
      ?auto_1255 - PLACE
      ?auto_1252 - TRUCK
      ?auto_1253 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1254 ?auto_1255 ) ( IS-CRATE ?auto_1251 ) ( not ( = ?auto_1250 ?auto_1251 ) ) ( TRUCK-AT ?auto_1252 ?auto_1255 ) ( not ( = ?auto_1253 ?auto_1250 ) ) ( not ( = ?auto_1253 ?auto_1251 ) ) ( SURFACE-AT ?auto_1253 ?auto_1255 ) ( IS-CRATE ?auto_1250 ) ( IN ?auto_1250 ?auto_1252 ) ( AVAILABLE ?auto_1254 ) ( SURFACE-AT ?auto_1251 ?auto_1255 ) ( ON ?auto_1251 ?auto_1253 ) ( CLEAR ?auto_1251 ) )
    :subtasks
    ( ( !LIFT ?auto_1254 ?auto_1251 ?auto_1253 ?auto_1255 )
      ( MAKE-2CRATE ?auto_1253 ?auto_1250 ?auto_1251 )
      ( MAKE-1CRATE-VERIFY ?auto_1250 ?auto_1251 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1256 - SURFACE
      ?auto_1257 - SURFACE
      ?auto_1258 - SURFACE
    )
    :vars
    (
      ?auto_1260 - HOIST
      ?auto_1259 - PLACE
      ?auto_1261 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1260 ?auto_1259 ) ( IS-CRATE ?auto_1258 ) ( not ( = ?auto_1257 ?auto_1258 ) ) ( TRUCK-AT ?auto_1261 ?auto_1259 ) ( not ( = ?auto_1256 ?auto_1257 ) ) ( not ( = ?auto_1256 ?auto_1258 ) ) ( SURFACE-AT ?auto_1256 ?auto_1259 ) ( IS-CRATE ?auto_1257 ) ( IN ?auto_1257 ?auto_1261 ) ( AVAILABLE ?auto_1260 ) ( SURFACE-AT ?auto_1258 ?auto_1259 ) ( ON ?auto_1258 ?auto_1256 ) ( CLEAR ?auto_1258 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1257 ?auto_1258 )
      ( MAKE-2CRATE-VERIFY ?auto_1256 ?auto_1257 ?auto_1258 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1262 - SURFACE
      ?auto_1263 - SURFACE
    )
    :vars
    (
      ?auto_1266 - HOIST
      ?auto_1265 - PLACE
      ?auto_1264 - TRUCK
      ?auto_1267 - SURFACE
      ?auto_1268 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1266 ?auto_1265 ) ( IS-CRATE ?auto_1263 ) ( not ( = ?auto_1262 ?auto_1263 ) ) ( TRUCK-AT ?auto_1264 ?auto_1265 ) ( not ( = ?auto_1267 ?auto_1262 ) ) ( not ( = ?auto_1267 ?auto_1263 ) ) ( SURFACE-AT ?auto_1267 ?auto_1265 ) ( IS-CRATE ?auto_1262 ) ( IN ?auto_1262 ?auto_1264 ) ( SURFACE-AT ?auto_1263 ?auto_1265 ) ( ON ?auto_1263 ?auto_1267 ) ( CLEAR ?auto_1263 ) ( LIFTING ?auto_1266 ?auto_1268 ) ( IS-CRATE ?auto_1268 ) ( not ( = ?auto_1262 ?auto_1268 ) ) ( not ( = ?auto_1263 ?auto_1268 ) ) ( not ( = ?auto_1267 ?auto_1268 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1266 ?auto_1268 ?auto_1264 ?auto_1265 )
      ( MAKE-2CRATE ?auto_1267 ?auto_1262 ?auto_1263 )
      ( MAKE-1CRATE-VERIFY ?auto_1262 ?auto_1263 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1269 - SURFACE
      ?auto_1270 - SURFACE
      ?auto_1271 - SURFACE
    )
    :vars
    (
      ?auto_1275 - HOIST
      ?auto_1274 - PLACE
      ?auto_1272 - TRUCK
      ?auto_1273 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1275 ?auto_1274 ) ( IS-CRATE ?auto_1271 ) ( not ( = ?auto_1270 ?auto_1271 ) ) ( TRUCK-AT ?auto_1272 ?auto_1274 ) ( not ( = ?auto_1269 ?auto_1270 ) ) ( not ( = ?auto_1269 ?auto_1271 ) ) ( SURFACE-AT ?auto_1269 ?auto_1274 ) ( IS-CRATE ?auto_1270 ) ( IN ?auto_1270 ?auto_1272 ) ( SURFACE-AT ?auto_1271 ?auto_1274 ) ( ON ?auto_1271 ?auto_1269 ) ( CLEAR ?auto_1271 ) ( LIFTING ?auto_1275 ?auto_1273 ) ( IS-CRATE ?auto_1273 ) ( not ( = ?auto_1270 ?auto_1273 ) ) ( not ( = ?auto_1271 ?auto_1273 ) ) ( not ( = ?auto_1269 ?auto_1273 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1270 ?auto_1271 )
      ( MAKE-2CRATE-VERIFY ?auto_1269 ?auto_1270 ?auto_1271 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1276 - SURFACE
      ?auto_1277 - SURFACE
    )
    :vars
    (
      ?auto_1279 - HOIST
      ?auto_1281 - PLACE
      ?auto_1278 - TRUCK
      ?auto_1282 - SURFACE
      ?auto_1280 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1279 ?auto_1281 ) ( IS-CRATE ?auto_1277 ) ( not ( = ?auto_1276 ?auto_1277 ) ) ( TRUCK-AT ?auto_1278 ?auto_1281 ) ( not ( = ?auto_1282 ?auto_1276 ) ) ( not ( = ?auto_1282 ?auto_1277 ) ) ( SURFACE-AT ?auto_1282 ?auto_1281 ) ( IS-CRATE ?auto_1276 ) ( IN ?auto_1276 ?auto_1278 ) ( SURFACE-AT ?auto_1277 ?auto_1281 ) ( ON ?auto_1277 ?auto_1282 ) ( IS-CRATE ?auto_1280 ) ( not ( = ?auto_1276 ?auto_1280 ) ) ( not ( = ?auto_1277 ?auto_1280 ) ) ( not ( = ?auto_1282 ?auto_1280 ) ) ( AVAILABLE ?auto_1279 ) ( SURFACE-AT ?auto_1280 ?auto_1281 ) ( ON ?auto_1280 ?auto_1277 ) ( CLEAR ?auto_1280 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1282 ?auto_1277 )
      ( MAKE-2CRATE ?auto_1282 ?auto_1276 ?auto_1277 )
      ( MAKE-1CRATE-VERIFY ?auto_1276 ?auto_1277 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1283 - SURFACE
      ?auto_1284 - SURFACE
      ?auto_1285 - SURFACE
    )
    :vars
    (
      ?auto_1288 - HOIST
      ?auto_1289 - PLACE
      ?auto_1287 - TRUCK
      ?auto_1286 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1288 ?auto_1289 ) ( IS-CRATE ?auto_1285 ) ( not ( = ?auto_1284 ?auto_1285 ) ) ( TRUCK-AT ?auto_1287 ?auto_1289 ) ( not ( = ?auto_1283 ?auto_1284 ) ) ( not ( = ?auto_1283 ?auto_1285 ) ) ( SURFACE-AT ?auto_1283 ?auto_1289 ) ( IS-CRATE ?auto_1284 ) ( IN ?auto_1284 ?auto_1287 ) ( SURFACE-AT ?auto_1285 ?auto_1289 ) ( ON ?auto_1285 ?auto_1283 ) ( IS-CRATE ?auto_1286 ) ( not ( = ?auto_1284 ?auto_1286 ) ) ( not ( = ?auto_1285 ?auto_1286 ) ) ( not ( = ?auto_1283 ?auto_1286 ) ) ( AVAILABLE ?auto_1288 ) ( SURFACE-AT ?auto_1286 ?auto_1289 ) ( ON ?auto_1286 ?auto_1285 ) ( CLEAR ?auto_1286 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1284 ?auto_1285 )
      ( MAKE-2CRATE-VERIFY ?auto_1283 ?auto_1284 ?auto_1285 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1290 - SURFACE
      ?auto_1291 - SURFACE
    )
    :vars
    (
      ?auto_1294 - HOIST
      ?auto_1293 - PLACE
      ?auto_1296 - SURFACE
      ?auto_1295 - TRUCK
      ?auto_1292 - SURFACE
      ?auto_1297 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1294 ?auto_1293 ) ( IS-CRATE ?auto_1291 ) ( not ( = ?auto_1290 ?auto_1291 ) ) ( not ( = ?auto_1296 ?auto_1290 ) ) ( not ( = ?auto_1296 ?auto_1291 ) ) ( SURFACE-AT ?auto_1296 ?auto_1293 ) ( IS-CRATE ?auto_1290 ) ( IN ?auto_1290 ?auto_1295 ) ( SURFACE-AT ?auto_1291 ?auto_1293 ) ( ON ?auto_1291 ?auto_1296 ) ( IS-CRATE ?auto_1292 ) ( not ( = ?auto_1290 ?auto_1292 ) ) ( not ( = ?auto_1291 ?auto_1292 ) ) ( not ( = ?auto_1296 ?auto_1292 ) ) ( AVAILABLE ?auto_1294 ) ( SURFACE-AT ?auto_1292 ?auto_1293 ) ( ON ?auto_1292 ?auto_1291 ) ( CLEAR ?auto_1292 ) ( TRUCK-AT ?auto_1295 ?auto_1297 ) ( not ( = ?auto_1297 ?auto_1293 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1295 ?auto_1297 ?auto_1293 )
      ( MAKE-2CRATE ?auto_1296 ?auto_1290 ?auto_1291 )
      ( MAKE-1CRATE-VERIFY ?auto_1290 ?auto_1291 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1298 - SURFACE
      ?auto_1299 - SURFACE
      ?auto_1300 - SURFACE
    )
    :vars
    (
      ?auto_1301 - HOIST
      ?auto_1303 - PLACE
      ?auto_1302 - TRUCK
      ?auto_1304 - SURFACE
      ?auto_1305 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1301 ?auto_1303 ) ( IS-CRATE ?auto_1300 ) ( not ( = ?auto_1299 ?auto_1300 ) ) ( not ( = ?auto_1298 ?auto_1299 ) ) ( not ( = ?auto_1298 ?auto_1300 ) ) ( SURFACE-AT ?auto_1298 ?auto_1303 ) ( IS-CRATE ?auto_1299 ) ( IN ?auto_1299 ?auto_1302 ) ( SURFACE-AT ?auto_1300 ?auto_1303 ) ( ON ?auto_1300 ?auto_1298 ) ( IS-CRATE ?auto_1304 ) ( not ( = ?auto_1299 ?auto_1304 ) ) ( not ( = ?auto_1300 ?auto_1304 ) ) ( not ( = ?auto_1298 ?auto_1304 ) ) ( AVAILABLE ?auto_1301 ) ( SURFACE-AT ?auto_1304 ?auto_1303 ) ( ON ?auto_1304 ?auto_1300 ) ( CLEAR ?auto_1304 ) ( TRUCK-AT ?auto_1302 ?auto_1305 ) ( not ( = ?auto_1305 ?auto_1303 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1299 ?auto_1300 )
      ( MAKE-2CRATE-VERIFY ?auto_1298 ?auto_1299 ?auto_1300 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1321 - SURFACE
      ?auto_1322 - SURFACE
    )
    :vars
    (
      ?auto_1327 - HOIST
      ?auto_1323 - PLACE
      ?auto_1325 - TRUCK
      ?auto_1324 - SURFACE
      ?auto_1326 - SURFACE
      ?auto_1329 - SURFACE
      ?auto_1328 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1327 ?auto_1323 ) ( IS-CRATE ?auto_1322 ) ( not ( = ?auto_1321 ?auto_1322 ) ) ( TRUCK-AT ?auto_1325 ?auto_1323 ) ( not ( = ?auto_1324 ?auto_1321 ) ) ( not ( = ?auto_1324 ?auto_1322 ) ) ( SURFACE-AT ?auto_1324 ?auto_1323 ) ( IS-CRATE ?auto_1321 ) ( IN ?auto_1321 ?auto_1325 ) ( SURFACE-AT ?auto_1322 ?auto_1323 ) ( ON ?auto_1322 ?auto_1324 ) ( IS-CRATE ?auto_1326 ) ( not ( = ?auto_1321 ?auto_1326 ) ) ( not ( = ?auto_1322 ?auto_1326 ) ) ( not ( = ?auto_1324 ?auto_1326 ) ) ( SURFACE-AT ?auto_1326 ?auto_1323 ) ( ON ?auto_1326 ?auto_1322 ) ( CLEAR ?auto_1326 ) ( SURFACE-AT ?auto_1329 ?auto_1323 ) ( CLEAR ?auto_1329 ) ( LIFTING ?auto_1327 ?auto_1328 ) ( IS-CRATE ?auto_1328 ) ( not ( = ?auto_1321 ?auto_1329 ) ) ( not ( = ?auto_1321 ?auto_1328 ) ) ( not ( = ?auto_1322 ?auto_1329 ) ) ( not ( = ?auto_1322 ?auto_1328 ) ) ( not ( = ?auto_1324 ?auto_1329 ) ) ( not ( = ?auto_1324 ?auto_1328 ) ) ( not ( = ?auto_1326 ?auto_1329 ) ) ( not ( = ?auto_1326 ?auto_1328 ) ) ( not ( = ?auto_1329 ?auto_1328 ) ) )
    :subtasks
    ( ( !DROP ?auto_1327 ?auto_1328 ?auto_1329 ?auto_1323 )
      ( MAKE-2CRATE ?auto_1324 ?auto_1321 ?auto_1322 )
      ( MAKE-1CRATE-VERIFY ?auto_1321 ?auto_1322 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1330 - SURFACE
      ?auto_1331 - SURFACE
      ?auto_1332 - SURFACE
    )
    :vars
    (
      ?auto_1336 - HOIST
      ?auto_1335 - PLACE
      ?auto_1337 - TRUCK
      ?auto_1334 - SURFACE
      ?auto_1333 - SURFACE
      ?auto_1338 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1336 ?auto_1335 ) ( IS-CRATE ?auto_1332 ) ( not ( = ?auto_1331 ?auto_1332 ) ) ( TRUCK-AT ?auto_1337 ?auto_1335 ) ( not ( = ?auto_1330 ?auto_1331 ) ) ( not ( = ?auto_1330 ?auto_1332 ) ) ( SURFACE-AT ?auto_1330 ?auto_1335 ) ( IS-CRATE ?auto_1331 ) ( IN ?auto_1331 ?auto_1337 ) ( SURFACE-AT ?auto_1332 ?auto_1335 ) ( ON ?auto_1332 ?auto_1330 ) ( IS-CRATE ?auto_1334 ) ( not ( = ?auto_1331 ?auto_1334 ) ) ( not ( = ?auto_1332 ?auto_1334 ) ) ( not ( = ?auto_1330 ?auto_1334 ) ) ( SURFACE-AT ?auto_1334 ?auto_1335 ) ( ON ?auto_1334 ?auto_1332 ) ( CLEAR ?auto_1334 ) ( SURFACE-AT ?auto_1333 ?auto_1335 ) ( CLEAR ?auto_1333 ) ( LIFTING ?auto_1336 ?auto_1338 ) ( IS-CRATE ?auto_1338 ) ( not ( = ?auto_1331 ?auto_1333 ) ) ( not ( = ?auto_1331 ?auto_1338 ) ) ( not ( = ?auto_1332 ?auto_1333 ) ) ( not ( = ?auto_1332 ?auto_1338 ) ) ( not ( = ?auto_1330 ?auto_1333 ) ) ( not ( = ?auto_1330 ?auto_1338 ) ) ( not ( = ?auto_1334 ?auto_1333 ) ) ( not ( = ?auto_1334 ?auto_1338 ) ) ( not ( = ?auto_1333 ?auto_1338 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1331 ?auto_1332 )
      ( MAKE-2CRATE-VERIFY ?auto_1330 ?auto_1331 ?auto_1332 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1344 - SURFACE
      ?auto_1345 - SURFACE
    )
    :vars
    (
      ?auto_1346 - HOIST
      ?auto_1350 - PLACE
      ?auto_1349 - TRUCK
      ?auto_1348 - SURFACE
      ?auto_1347 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1346 ?auto_1350 ) ( IS-CRATE ?auto_1345 ) ( not ( = ?auto_1344 ?auto_1345 ) ) ( TRUCK-AT ?auto_1349 ?auto_1350 ) ( not ( = ?auto_1348 ?auto_1344 ) ) ( not ( = ?auto_1348 ?auto_1345 ) ) ( SURFACE-AT ?auto_1348 ?auto_1350 ) ( IS-CRATE ?auto_1344 ) ( SURFACE-AT ?auto_1345 ?auto_1350 ) ( ON ?auto_1345 ?auto_1348 ) ( IS-CRATE ?auto_1347 ) ( not ( = ?auto_1344 ?auto_1347 ) ) ( not ( = ?auto_1345 ?auto_1347 ) ) ( not ( = ?auto_1348 ?auto_1347 ) ) ( SURFACE-AT ?auto_1347 ?auto_1350 ) ( ON ?auto_1347 ?auto_1345 ) ( CLEAR ?auto_1347 ) ( LIFTING ?auto_1346 ?auto_1344 ) )
    :subtasks
    ( ( !LOAD ?auto_1346 ?auto_1344 ?auto_1349 ?auto_1350 )
      ( MAKE-2CRATE ?auto_1348 ?auto_1344 ?auto_1345 )
      ( MAKE-1CRATE-VERIFY ?auto_1344 ?auto_1345 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1351 - SURFACE
      ?auto_1352 - SURFACE
      ?auto_1353 - SURFACE
    )
    :vars
    (
      ?auto_1355 - HOIST
      ?auto_1356 - PLACE
      ?auto_1354 - TRUCK
      ?auto_1357 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1355 ?auto_1356 ) ( IS-CRATE ?auto_1353 ) ( not ( = ?auto_1352 ?auto_1353 ) ) ( TRUCK-AT ?auto_1354 ?auto_1356 ) ( not ( = ?auto_1351 ?auto_1352 ) ) ( not ( = ?auto_1351 ?auto_1353 ) ) ( SURFACE-AT ?auto_1351 ?auto_1356 ) ( IS-CRATE ?auto_1352 ) ( SURFACE-AT ?auto_1353 ?auto_1356 ) ( ON ?auto_1353 ?auto_1351 ) ( IS-CRATE ?auto_1357 ) ( not ( = ?auto_1352 ?auto_1357 ) ) ( not ( = ?auto_1353 ?auto_1357 ) ) ( not ( = ?auto_1351 ?auto_1357 ) ) ( SURFACE-AT ?auto_1357 ?auto_1356 ) ( ON ?auto_1357 ?auto_1353 ) ( CLEAR ?auto_1357 ) ( LIFTING ?auto_1355 ?auto_1352 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1352 ?auto_1353 )
      ( MAKE-2CRATE-VERIFY ?auto_1351 ?auto_1352 ?auto_1353 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1358 - SURFACE
      ?auto_1359 - SURFACE
    )
    :vars
    (
      ?auto_1364 - HOIST
      ?auto_1362 - PLACE
      ?auto_1363 - TRUCK
      ?auto_1361 - SURFACE
      ?auto_1360 - SURFACE
      ?auto_1365 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1364 ?auto_1362 ) ( IS-CRATE ?auto_1359 ) ( not ( = ?auto_1358 ?auto_1359 ) ) ( TRUCK-AT ?auto_1363 ?auto_1362 ) ( not ( = ?auto_1361 ?auto_1358 ) ) ( not ( = ?auto_1361 ?auto_1359 ) ) ( SURFACE-AT ?auto_1361 ?auto_1362 ) ( IS-CRATE ?auto_1358 ) ( SURFACE-AT ?auto_1359 ?auto_1362 ) ( ON ?auto_1359 ?auto_1361 ) ( IS-CRATE ?auto_1360 ) ( not ( = ?auto_1358 ?auto_1360 ) ) ( not ( = ?auto_1359 ?auto_1360 ) ) ( not ( = ?auto_1361 ?auto_1360 ) ) ( SURFACE-AT ?auto_1360 ?auto_1362 ) ( ON ?auto_1360 ?auto_1359 ) ( CLEAR ?auto_1360 ) ( AVAILABLE ?auto_1364 ) ( SURFACE-AT ?auto_1358 ?auto_1362 ) ( ON ?auto_1358 ?auto_1365 ) ( CLEAR ?auto_1358 ) ( not ( = ?auto_1358 ?auto_1365 ) ) ( not ( = ?auto_1359 ?auto_1365 ) ) ( not ( = ?auto_1361 ?auto_1365 ) ) ( not ( = ?auto_1360 ?auto_1365 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1364 ?auto_1358 ?auto_1365 ?auto_1362 )
      ( MAKE-2CRATE ?auto_1361 ?auto_1358 ?auto_1359 )
      ( MAKE-1CRATE-VERIFY ?auto_1358 ?auto_1359 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1366 - SURFACE
      ?auto_1367 - SURFACE
      ?auto_1368 - SURFACE
    )
    :vars
    (
      ?auto_1369 - HOIST
      ?auto_1372 - PLACE
      ?auto_1370 - TRUCK
      ?auto_1373 - SURFACE
      ?auto_1371 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1369 ?auto_1372 ) ( IS-CRATE ?auto_1368 ) ( not ( = ?auto_1367 ?auto_1368 ) ) ( TRUCK-AT ?auto_1370 ?auto_1372 ) ( not ( = ?auto_1366 ?auto_1367 ) ) ( not ( = ?auto_1366 ?auto_1368 ) ) ( SURFACE-AT ?auto_1366 ?auto_1372 ) ( IS-CRATE ?auto_1367 ) ( SURFACE-AT ?auto_1368 ?auto_1372 ) ( ON ?auto_1368 ?auto_1366 ) ( IS-CRATE ?auto_1373 ) ( not ( = ?auto_1367 ?auto_1373 ) ) ( not ( = ?auto_1368 ?auto_1373 ) ) ( not ( = ?auto_1366 ?auto_1373 ) ) ( SURFACE-AT ?auto_1373 ?auto_1372 ) ( ON ?auto_1373 ?auto_1368 ) ( CLEAR ?auto_1373 ) ( AVAILABLE ?auto_1369 ) ( SURFACE-AT ?auto_1367 ?auto_1372 ) ( ON ?auto_1367 ?auto_1371 ) ( CLEAR ?auto_1367 ) ( not ( = ?auto_1367 ?auto_1371 ) ) ( not ( = ?auto_1368 ?auto_1371 ) ) ( not ( = ?auto_1366 ?auto_1371 ) ) ( not ( = ?auto_1373 ?auto_1371 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1367 ?auto_1368 )
      ( MAKE-2CRATE-VERIFY ?auto_1366 ?auto_1367 ?auto_1368 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1374 - SURFACE
      ?auto_1375 - SURFACE
    )
    :vars
    (
      ?auto_1376 - HOIST
      ?auto_1380 - PLACE
      ?auto_1377 - TRUCK
      ?auto_1379 - SURFACE
      ?auto_1381 - SURFACE
      ?auto_1378 - SURFACE
      ?auto_1382 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1376 ?auto_1380 ) ( IS-CRATE ?auto_1375 ) ( not ( = ?auto_1374 ?auto_1375 ) ) ( TRUCK-AT ?auto_1377 ?auto_1380 ) ( not ( = ?auto_1379 ?auto_1374 ) ) ( not ( = ?auto_1379 ?auto_1375 ) ) ( SURFACE-AT ?auto_1379 ?auto_1380 ) ( IS-CRATE ?auto_1374 ) ( SURFACE-AT ?auto_1375 ?auto_1380 ) ( ON ?auto_1375 ?auto_1379 ) ( IS-CRATE ?auto_1381 ) ( not ( = ?auto_1374 ?auto_1381 ) ) ( not ( = ?auto_1375 ?auto_1381 ) ) ( not ( = ?auto_1379 ?auto_1381 ) ) ( SURFACE-AT ?auto_1381 ?auto_1380 ) ( ON ?auto_1381 ?auto_1375 ) ( CLEAR ?auto_1381 ) ( SURFACE-AT ?auto_1374 ?auto_1380 ) ( ON ?auto_1374 ?auto_1378 ) ( CLEAR ?auto_1374 ) ( not ( = ?auto_1374 ?auto_1378 ) ) ( not ( = ?auto_1375 ?auto_1378 ) ) ( not ( = ?auto_1379 ?auto_1378 ) ) ( not ( = ?auto_1381 ?auto_1378 ) ) ( LIFTING ?auto_1376 ?auto_1382 ) ( IS-CRATE ?auto_1382 ) ( not ( = ?auto_1374 ?auto_1382 ) ) ( not ( = ?auto_1375 ?auto_1382 ) ) ( not ( = ?auto_1379 ?auto_1382 ) ) ( not ( = ?auto_1381 ?auto_1382 ) ) ( not ( = ?auto_1378 ?auto_1382 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1376 ?auto_1382 ?auto_1377 ?auto_1380 )
      ( MAKE-2CRATE ?auto_1379 ?auto_1374 ?auto_1375 )
      ( MAKE-1CRATE-VERIFY ?auto_1374 ?auto_1375 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1383 - SURFACE
      ?auto_1384 - SURFACE
      ?auto_1385 - SURFACE
    )
    :vars
    (
      ?auto_1386 - HOIST
      ?auto_1388 - PLACE
      ?auto_1390 - TRUCK
      ?auto_1389 - SURFACE
      ?auto_1387 - SURFACE
      ?auto_1391 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1386 ?auto_1388 ) ( IS-CRATE ?auto_1385 ) ( not ( = ?auto_1384 ?auto_1385 ) ) ( TRUCK-AT ?auto_1390 ?auto_1388 ) ( not ( = ?auto_1383 ?auto_1384 ) ) ( not ( = ?auto_1383 ?auto_1385 ) ) ( SURFACE-AT ?auto_1383 ?auto_1388 ) ( IS-CRATE ?auto_1384 ) ( SURFACE-AT ?auto_1385 ?auto_1388 ) ( ON ?auto_1385 ?auto_1383 ) ( IS-CRATE ?auto_1389 ) ( not ( = ?auto_1384 ?auto_1389 ) ) ( not ( = ?auto_1385 ?auto_1389 ) ) ( not ( = ?auto_1383 ?auto_1389 ) ) ( SURFACE-AT ?auto_1389 ?auto_1388 ) ( ON ?auto_1389 ?auto_1385 ) ( CLEAR ?auto_1389 ) ( SURFACE-AT ?auto_1384 ?auto_1388 ) ( ON ?auto_1384 ?auto_1387 ) ( CLEAR ?auto_1384 ) ( not ( = ?auto_1384 ?auto_1387 ) ) ( not ( = ?auto_1385 ?auto_1387 ) ) ( not ( = ?auto_1383 ?auto_1387 ) ) ( not ( = ?auto_1389 ?auto_1387 ) ) ( LIFTING ?auto_1386 ?auto_1391 ) ( IS-CRATE ?auto_1391 ) ( not ( = ?auto_1384 ?auto_1391 ) ) ( not ( = ?auto_1385 ?auto_1391 ) ) ( not ( = ?auto_1383 ?auto_1391 ) ) ( not ( = ?auto_1389 ?auto_1391 ) ) ( not ( = ?auto_1387 ?auto_1391 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1384 ?auto_1385 )
      ( MAKE-2CRATE-VERIFY ?auto_1383 ?auto_1384 ?auto_1385 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1392 - SURFACE
      ?auto_1393 - SURFACE
    )
    :vars
    (
      ?auto_1395 - HOIST
      ?auto_1394 - PLACE
      ?auto_1400 - TRUCK
      ?auto_1399 - SURFACE
      ?auto_1396 - SURFACE
      ?auto_1397 - SURFACE
      ?auto_1398 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1395 ?auto_1394 ) ( IS-CRATE ?auto_1393 ) ( not ( = ?auto_1392 ?auto_1393 ) ) ( TRUCK-AT ?auto_1400 ?auto_1394 ) ( not ( = ?auto_1399 ?auto_1392 ) ) ( not ( = ?auto_1399 ?auto_1393 ) ) ( SURFACE-AT ?auto_1399 ?auto_1394 ) ( IS-CRATE ?auto_1392 ) ( SURFACE-AT ?auto_1393 ?auto_1394 ) ( ON ?auto_1393 ?auto_1399 ) ( IS-CRATE ?auto_1396 ) ( not ( = ?auto_1392 ?auto_1396 ) ) ( not ( = ?auto_1393 ?auto_1396 ) ) ( not ( = ?auto_1399 ?auto_1396 ) ) ( SURFACE-AT ?auto_1396 ?auto_1394 ) ( ON ?auto_1396 ?auto_1393 ) ( CLEAR ?auto_1396 ) ( SURFACE-AT ?auto_1392 ?auto_1394 ) ( ON ?auto_1392 ?auto_1397 ) ( not ( = ?auto_1392 ?auto_1397 ) ) ( not ( = ?auto_1393 ?auto_1397 ) ) ( not ( = ?auto_1399 ?auto_1397 ) ) ( not ( = ?auto_1396 ?auto_1397 ) ) ( IS-CRATE ?auto_1398 ) ( not ( = ?auto_1392 ?auto_1398 ) ) ( not ( = ?auto_1393 ?auto_1398 ) ) ( not ( = ?auto_1399 ?auto_1398 ) ) ( not ( = ?auto_1396 ?auto_1398 ) ) ( not ( = ?auto_1397 ?auto_1398 ) ) ( AVAILABLE ?auto_1395 ) ( SURFACE-AT ?auto_1398 ?auto_1394 ) ( ON ?auto_1398 ?auto_1392 ) ( CLEAR ?auto_1398 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1397 ?auto_1392 )
      ( MAKE-2CRATE ?auto_1399 ?auto_1392 ?auto_1393 )
      ( MAKE-1CRATE-VERIFY ?auto_1392 ?auto_1393 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1401 - SURFACE
      ?auto_1402 - SURFACE
      ?auto_1403 - SURFACE
    )
    :vars
    (
      ?auto_1408 - HOIST
      ?auto_1409 - PLACE
      ?auto_1406 - TRUCK
      ?auto_1404 - SURFACE
      ?auto_1405 - SURFACE
      ?auto_1407 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1408 ?auto_1409 ) ( IS-CRATE ?auto_1403 ) ( not ( = ?auto_1402 ?auto_1403 ) ) ( TRUCK-AT ?auto_1406 ?auto_1409 ) ( not ( = ?auto_1401 ?auto_1402 ) ) ( not ( = ?auto_1401 ?auto_1403 ) ) ( SURFACE-AT ?auto_1401 ?auto_1409 ) ( IS-CRATE ?auto_1402 ) ( SURFACE-AT ?auto_1403 ?auto_1409 ) ( ON ?auto_1403 ?auto_1401 ) ( IS-CRATE ?auto_1404 ) ( not ( = ?auto_1402 ?auto_1404 ) ) ( not ( = ?auto_1403 ?auto_1404 ) ) ( not ( = ?auto_1401 ?auto_1404 ) ) ( SURFACE-AT ?auto_1404 ?auto_1409 ) ( ON ?auto_1404 ?auto_1403 ) ( CLEAR ?auto_1404 ) ( SURFACE-AT ?auto_1402 ?auto_1409 ) ( ON ?auto_1402 ?auto_1405 ) ( not ( = ?auto_1402 ?auto_1405 ) ) ( not ( = ?auto_1403 ?auto_1405 ) ) ( not ( = ?auto_1401 ?auto_1405 ) ) ( not ( = ?auto_1404 ?auto_1405 ) ) ( IS-CRATE ?auto_1407 ) ( not ( = ?auto_1402 ?auto_1407 ) ) ( not ( = ?auto_1403 ?auto_1407 ) ) ( not ( = ?auto_1401 ?auto_1407 ) ) ( not ( = ?auto_1404 ?auto_1407 ) ) ( not ( = ?auto_1405 ?auto_1407 ) ) ( AVAILABLE ?auto_1408 ) ( SURFACE-AT ?auto_1407 ?auto_1409 ) ( ON ?auto_1407 ?auto_1402 ) ( CLEAR ?auto_1407 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1402 ?auto_1403 )
      ( MAKE-2CRATE-VERIFY ?auto_1401 ?auto_1402 ?auto_1403 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1410 - SURFACE
      ?auto_1411 - SURFACE
    )
    :vars
    (
      ?auto_1412 - HOIST
      ?auto_1416 - PLACE
      ?auto_1415 - SURFACE
      ?auto_1418 - SURFACE
      ?auto_1413 - SURFACE
      ?auto_1417 - SURFACE
      ?auto_1414 - TRUCK
      ?auto_1419 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1412 ?auto_1416 ) ( IS-CRATE ?auto_1411 ) ( not ( = ?auto_1410 ?auto_1411 ) ) ( not ( = ?auto_1415 ?auto_1410 ) ) ( not ( = ?auto_1415 ?auto_1411 ) ) ( SURFACE-AT ?auto_1415 ?auto_1416 ) ( IS-CRATE ?auto_1410 ) ( SURFACE-AT ?auto_1411 ?auto_1416 ) ( ON ?auto_1411 ?auto_1415 ) ( IS-CRATE ?auto_1418 ) ( not ( = ?auto_1410 ?auto_1418 ) ) ( not ( = ?auto_1411 ?auto_1418 ) ) ( not ( = ?auto_1415 ?auto_1418 ) ) ( SURFACE-AT ?auto_1418 ?auto_1416 ) ( ON ?auto_1418 ?auto_1411 ) ( CLEAR ?auto_1418 ) ( SURFACE-AT ?auto_1410 ?auto_1416 ) ( ON ?auto_1410 ?auto_1413 ) ( not ( = ?auto_1410 ?auto_1413 ) ) ( not ( = ?auto_1411 ?auto_1413 ) ) ( not ( = ?auto_1415 ?auto_1413 ) ) ( not ( = ?auto_1418 ?auto_1413 ) ) ( IS-CRATE ?auto_1417 ) ( not ( = ?auto_1410 ?auto_1417 ) ) ( not ( = ?auto_1411 ?auto_1417 ) ) ( not ( = ?auto_1415 ?auto_1417 ) ) ( not ( = ?auto_1418 ?auto_1417 ) ) ( not ( = ?auto_1413 ?auto_1417 ) ) ( AVAILABLE ?auto_1412 ) ( SURFACE-AT ?auto_1417 ?auto_1416 ) ( ON ?auto_1417 ?auto_1410 ) ( CLEAR ?auto_1417 ) ( TRUCK-AT ?auto_1414 ?auto_1419 ) ( not ( = ?auto_1419 ?auto_1416 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1414 ?auto_1419 ?auto_1416 )
      ( MAKE-2CRATE ?auto_1415 ?auto_1410 ?auto_1411 )
      ( MAKE-1CRATE-VERIFY ?auto_1410 ?auto_1411 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1420 - SURFACE
      ?auto_1421 - SURFACE
      ?auto_1422 - SURFACE
    )
    :vars
    (
      ?auto_1426 - HOIST
      ?auto_1423 - PLACE
      ?auto_1427 - SURFACE
      ?auto_1429 - SURFACE
      ?auto_1428 - SURFACE
      ?auto_1424 - TRUCK
      ?auto_1425 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1426 ?auto_1423 ) ( IS-CRATE ?auto_1422 ) ( not ( = ?auto_1421 ?auto_1422 ) ) ( not ( = ?auto_1420 ?auto_1421 ) ) ( not ( = ?auto_1420 ?auto_1422 ) ) ( SURFACE-AT ?auto_1420 ?auto_1423 ) ( IS-CRATE ?auto_1421 ) ( SURFACE-AT ?auto_1422 ?auto_1423 ) ( ON ?auto_1422 ?auto_1420 ) ( IS-CRATE ?auto_1427 ) ( not ( = ?auto_1421 ?auto_1427 ) ) ( not ( = ?auto_1422 ?auto_1427 ) ) ( not ( = ?auto_1420 ?auto_1427 ) ) ( SURFACE-AT ?auto_1427 ?auto_1423 ) ( ON ?auto_1427 ?auto_1422 ) ( CLEAR ?auto_1427 ) ( SURFACE-AT ?auto_1421 ?auto_1423 ) ( ON ?auto_1421 ?auto_1429 ) ( not ( = ?auto_1421 ?auto_1429 ) ) ( not ( = ?auto_1422 ?auto_1429 ) ) ( not ( = ?auto_1420 ?auto_1429 ) ) ( not ( = ?auto_1427 ?auto_1429 ) ) ( IS-CRATE ?auto_1428 ) ( not ( = ?auto_1421 ?auto_1428 ) ) ( not ( = ?auto_1422 ?auto_1428 ) ) ( not ( = ?auto_1420 ?auto_1428 ) ) ( not ( = ?auto_1427 ?auto_1428 ) ) ( not ( = ?auto_1429 ?auto_1428 ) ) ( AVAILABLE ?auto_1426 ) ( SURFACE-AT ?auto_1428 ?auto_1423 ) ( ON ?auto_1428 ?auto_1421 ) ( CLEAR ?auto_1428 ) ( TRUCK-AT ?auto_1424 ?auto_1425 ) ( not ( = ?auto_1425 ?auto_1423 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1421 ?auto_1422 )
      ( MAKE-2CRATE-VERIFY ?auto_1420 ?auto_1421 ?auto_1422 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1458 - SURFACE
      ?auto_1459 - SURFACE
      ?auto_1460 - SURFACE
      ?auto_1461 - SURFACE
    )
    :vars
    (
      ?auto_1463 - HOIST
      ?auto_1462 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1463 ?auto_1462 ) ( SURFACE-AT ?auto_1460 ?auto_1462 ) ( CLEAR ?auto_1460 ) ( LIFTING ?auto_1463 ?auto_1461 ) ( IS-CRATE ?auto_1461 ) ( not ( = ?auto_1460 ?auto_1461 ) ) ( ON ?auto_1459 ?auto_1458 ) ( ON ?auto_1460 ?auto_1459 ) ( not ( = ?auto_1458 ?auto_1459 ) ) ( not ( = ?auto_1458 ?auto_1460 ) ) ( not ( = ?auto_1458 ?auto_1461 ) ) ( not ( = ?auto_1459 ?auto_1460 ) ) ( not ( = ?auto_1459 ?auto_1461 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1460 ?auto_1461 )
      ( MAKE-3CRATE-VERIFY ?auto_1458 ?auto_1459 ?auto_1460 ?auto_1461 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1475 - SURFACE
      ?auto_1476 - SURFACE
      ?auto_1477 - SURFACE
      ?auto_1478 - SURFACE
    )
    :vars
    (
      ?auto_1481 - HOIST
      ?auto_1479 - PLACE
      ?auto_1480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1481 ?auto_1479 ) ( SURFACE-AT ?auto_1477 ?auto_1479 ) ( CLEAR ?auto_1477 ) ( IS-CRATE ?auto_1478 ) ( not ( = ?auto_1477 ?auto_1478 ) ) ( TRUCK-AT ?auto_1480 ?auto_1479 ) ( AVAILABLE ?auto_1481 ) ( IN ?auto_1478 ?auto_1480 ) ( ON ?auto_1477 ?auto_1476 ) ( not ( = ?auto_1476 ?auto_1477 ) ) ( not ( = ?auto_1476 ?auto_1478 ) ) ( ON ?auto_1476 ?auto_1475 ) ( not ( = ?auto_1475 ?auto_1476 ) ) ( not ( = ?auto_1475 ?auto_1477 ) ) ( not ( = ?auto_1475 ?auto_1478 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1476 ?auto_1477 ?auto_1478 )
      ( MAKE-3CRATE-VERIFY ?auto_1475 ?auto_1476 ?auto_1477 ?auto_1478 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1494 - SURFACE
      ?auto_1495 - SURFACE
      ?auto_1496 - SURFACE
      ?auto_1497 - SURFACE
    )
    :vars
    (
      ?auto_1500 - HOIST
      ?auto_1498 - PLACE
      ?auto_1499 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1500 ?auto_1498 ) ( IS-CRATE ?auto_1497 ) ( not ( = ?auto_1496 ?auto_1497 ) ) ( TRUCK-AT ?auto_1499 ?auto_1498 ) ( IN ?auto_1497 ?auto_1499 ) ( not ( = ?auto_1495 ?auto_1496 ) ) ( not ( = ?auto_1495 ?auto_1497 ) ) ( SURFACE-AT ?auto_1495 ?auto_1498 ) ( CLEAR ?auto_1495 ) ( LIFTING ?auto_1500 ?auto_1496 ) ( IS-CRATE ?auto_1496 ) ( ON ?auto_1495 ?auto_1494 ) ( not ( = ?auto_1494 ?auto_1495 ) ) ( not ( = ?auto_1494 ?auto_1496 ) ) ( not ( = ?auto_1494 ?auto_1497 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1495 ?auto_1496 ?auto_1497 )
      ( MAKE-3CRATE-VERIFY ?auto_1494 ?auto_1495 ?auto_1496 ?auto_1497 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1513 - SURFACE
      ?auto_1514 - SURFACE
      ?auto_1515 - SURFACE
      ?auto_1516 - SURFACE
    )
    :vars
    (
      ?auto_1517 - HOIST
      ?auto_1519 - PLACE
      ?auto_1518 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1517 ?auto_1519 ) ( IS-CRATE ?auto_1516 ) ( not ( = ?auto_1515 ?auto_1516 ) ) ( TRUCK-AT ?auto_1518 ?auto_1519 ) ( IN ?auto_1516 ?auto_1518 ) ( not ( = ?auto_1514 ?auto_1515 ) ) ( not ( = ?auto_1514 ?auto_1516 ) ) ( SURFACE-AT ?auto_1514 ?auto_1519 ) ( CLEAR ?auto_1514 ) ( IS-CRATE ?auto_1515 ) ( AVAILABLE ?auto_1517 ) ( IN ?auto_1515 ?auto_1518 ) ( ON ?auto_1514 ?auto_1513 ) ( not ( = ?auto_1513 ?auto_1514 ) ) ( not ( = ?auto_1513 ?auto_1515 ) ) ( not ( = ?auto_1513 ?auto_1516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1514 ?auto_1515 ?auto_1516 )
      ( MAKE-3CRATE-VERIFY ?auto_1513 ?auto_1514 ?auto_1515 ?auto_1516 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1520 - SURFACE
      ?auto_1521 - SURFACE
    )
    :vars
    (
      ?auto_1522 - HOIST
      ?auto_1525 - PLACE
      ?auto_1523 - TRUCK
      ?auto_1524 - SURFACE
      ?auto_1526 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1522 ?auto_1525 ) ( IS-CRATE ?auto_1521 ) ( not ( = ?auto_1520 ?auto_1521 ) ) ( TRUCK-AT ?auto_1523 ?auto_1525 ) ( IN ?auto_1521 ?auto_1523 ) ( not ( = ?auto_1524 ?auto_1520 ) ) ( not ( = ?auto_1524 ?auto_1521 ) ) ( IS-CRATE ?auto_1520 ) ( IN ?auto_1520 ?auto_1523 ) ( SURFACE-AT ?auto_1526 ?auto_1525 ) ( CLEAR ?auto_1526 ) ( LIFTING ?auto_1522 ?auto_1524 ) ( IS-CRATE ?auto_1524 ) ( not ( = ?auto_1526 ?auto_1524 ) ) ( not ( = ?auto_1520 ?auto_1526 ) ) ( not ( = ?auto_1521 ?auto_1526 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1526 ?auto_1524 )
      ( MAKE-2CRATE ?auto_1524 ?auto_1520 ?auto_1521 )
      ( MAKE-1CRATE-VERIFY ?auto_1520 ?auto_1521 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1527 - SURFACE
      ?auto_1528 - SURFACE
      ?auto_1529 - SURFACE
    )
    :vars
    (
      ?auto_1533 - HOIST
      ?auto_1531 - PLACE
      ?auto_1530 - TRUCK
      ?auto_1532 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1533 ?auto_1531 ) ( IS-CRATE ?auto_1529 ) ( not ( = ?auto_1528 ?auto_1529 ) ) ( TRUCK-AT ?auto_1530 ?auto_1531 ) ( IN ?auto_1529 ?auto_1530 ) ( not ( = ?auto_1527 ?auto_1528 ) ) ( not ( = ?auto_1527 ?auto_1529 ) ) ( IS-CRATE ?auto_1528 ) ( IN ?auto_1528 ?auto_1530 ) ( SURFACE-AT ?auto_1532 ?auto_1531 ) ( CLEAR ?auto_1532 ) ( LIFTING ?auto_1533 ?auto_1527 ) ( IS-CRATE ?auto_1527 ) ( not ( = ?auto_1532 ?auto_1527 ) ) ( not ( = ?auto_1528 ?auto_1532 ) ) ( not ( = ?auto_1529 ?auto_1532 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1528 ?auto_1529 )
      ( MAKE-2CRATE-VERIFY ?auto_1527 ?auto_1528 ?auto_1529 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1534 - SURFACE
      ?auto_1535 - SURFACE
      ?auto_1536 - SURFACE
      ?auto_1537 - SURFACE
    )
    :vars
    (
      ?auto_1540 - HOIST
      ?auto_1538 - PLACE
      ?auto_1539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1540 ?auto_1538 ) ( IS-CRATE ?auto_1537 ) ( not ( = ?auto_1536 ?auto_1537 ) ) ( TRUCK-AT ?auto_1539 ?auto_1538 ) ( IN ?auto_1537 ?auto_1539 ) ( not ( = ?auto_1535 ?auto_1536 ) ) ( not ( = ?auto_1535 ?auto_1537 ) ) ( IS-CRATE ?auto_1536 ) ( IN ?auto_1536 ?auto_1539 ) ( SURFACE-AT ?auto_1534 ?auto_1538 ) ( CLEAR ?auto_1534 ) ( LIFTING ?auto_1540 ?auto_1535 ) ( IS-CRATE ?auto_1535 ) ( not ( = ?auto_1534 ?auto_1535 ) ) ( not ( = ?auto_1536 ?auto_1534 ) ) ( not ( = ?auto_1537 ?auto_1534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1535 ?auto_1536 ?auto_1537 )
      ( MAKE-3CRATE-VERIFY ?auto_1534 ?auto_1535 ?auto_1536 ?auto_1537 ) )
  )

)

