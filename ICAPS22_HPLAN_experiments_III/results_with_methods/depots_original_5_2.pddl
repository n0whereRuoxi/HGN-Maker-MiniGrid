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
      ?auto_23922 - SURFACE
      ?auto_23923 - SURFACE
    )
    :vars
    (
      ?auto_23924 - HOIST
      ?auto_23925 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23924 ?auto_23925 ) ( SURFACE-AT ?auto_23922 ?auto_23925 ) ( CLEAR ?auto_23922 ) ( LIFTING ?auto_23924 ?auto_23923 ) ( IS-CRATE ?auto_23923 ) ( not ( = ?auto_23922 ?auto_23923 ) ) )
    :subtasks
    ( ( !DROP ?auto_23924 ?auto_23923 ?auto_23922 ?auto_23925 )
      ( MAKE-1CRATE-VERIFY ?auto_23922 ?auto_23923 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23926 - SURFACE
      ?auto_23927 - SURFACE
    )
    :vars
    (
      ?auto_23929 - HOIST
      ?auto_23928 - PLACE
      ?auto_23930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23929 ?auto_23928 ) ( SURFACE-AT ?auto_23926 ?auto_23928 ) ( CLEAR ?auto_23926 ) ( IS-CRATE ?auto_23927 ) ( not ( = ?auto_23926 ?auto_23927 ) ) ( TRUCK-AT ?auto_23930 ?auto_23928 ) ( AVAILABLE ?auto_23929 ) ( IN ?auto_23927 ?auto_23930 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23929 ?auto_23927 ?auto_23930 ?auto_23928 )
      ( MAKE-1CRATE ?auto_23926 ?auto_23927 )
      ( MAKE-1CRATE-VERIFY ?auto_23926 ?auto_23927 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23931 - SURFACE
      ?auto_23932 - SURFACE
    )
    :vars
    (
      ?auto_23935 - HOIST
      ?auto_23934 - PLACE
      ?auto_23933 - TRUCK
      ?auto_23936 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23935 ?auto_23934 ) ( SURFACE-AT ?auto_23931 ?auto_23934 ) ( CLEAR ?auto_23931 ) ( IS-CRATE ?auto_23932 ) ( not ( = ?auto_23931 ?auto_23932 ) ) ( AVAILABLE ?auto_23935 ) ( IN ?auto_23932 ?auto_23933 ) ( TRUCK-AT ?auto_23933 ?auto_23936 ) ( not ( = ?auto_23936 ?auto_23934 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23933 ?auto_23936 ?auto_23934 )
      ( MAKE-1CRATE ?auto_23931 ?auto_23932 )
      ( MAKE-1CRATE-VERIFY ?auto_23931 ?auto_23932 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23937 - SURFACE
      ?auto_23938 - SURFACE
    )
    :vars
    (
      ?auto_23942 - HOIST
      ?auto_23941 - PLACE
      ?auto_23939 - TRUCK
      ?auto_23940 - PLACE
      ?auto_23943 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23942 ?auto_23941 ) ( SURFACE-AT ?auto_23937 ?auto_23941 ) ( CLEAR ?auto_23937 ) ( IS-CRATE ?auto_23938 ) ( not ( = ?auto_23937 ?auto_23938 ) ) ( AVAILABLE ?auto_23942 ) ( TRUCK-AT ?auto_23939 ?auto_23940 ) ( not ( = ?auto_23940 ?auto_23941 ) ) ( HOIST-AT ?auto_23943 ?auto_23940 ) ( LIFTING ?auto_23943 ?auto_23938 ) ( not ( = ?auto_23942 ?auto_23943 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23943 ?auto_23938 ?auto_23939 ?auto_23940 )
      ( MAKE-1CRATE ?auto_23937 ?auto_23938 )
      ( MAKE-1CRATE-VERIFY ?auto_23937 ?auto_23938 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23944 - SURFACE
      ?auto_23945 - SURFACE
    )
    :vars
    (
      ?auto_23946 - HOIST
      ?auto_23950 - PLACE
      ?auto_23949 - TRUCK
      ?auto_23948 - PLACE
      ?auto_23947 - HOIST
      ?auto_23951 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23946 ?auto_23950 ) ( SURFACE-AT ?auto_23944 ?auto_23950 ) ( CLEAR ?auto_23944 ) ( IS-CRATE ?auto_23945 ) ( not ( = ?auto_23944 ?auto_23945 ) ) ( AVAILABLE ?auto_23946 ) ( TRUCK-AT ?auto_23949 ?auto_23948 ) ( not ( = ?auto_23948 ?auto_23950 ) ) ( HOIST-AT ?auto_23947 ?auto_23948 ) ( not ( = ?auto_23946 ?auto_23947 ) ) ( AVAILABLE ?auto_23947 ) ( SURFACE-AT ?auto_23945 ?auto_23948 ) ( ON ?auto_23945 ?auto_23951 ) ( CLEAR ?auto_23945 ) ( not ( = ?auto_23944 ?auto_23951 ) ) ( not ( = ?auto_23945 ?auto_23951 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23947 ?auto_23945 ?auto_23951 ?auto_23948 )
      ( MAKE-1CRATE ?auto_23944 ?auto_23945 )
      ( MAKE-1CRATE-VERIFY ?auto_23944 ?auto_23945 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23952 - SURFACE
      ?auto_23953 - SURFACE
    )
    :vars
    (
      ?auto_23955 - HOIST
      ?auto_23958 - PLACE
      ?auto_23959 - PLACE
      ?auto_23956 - HOIST
      ?auto_23954 - SURFACE
      ?auto_23957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23955 ?auto_23958 ) ( SURFACE-AT ?auto_23952 ?auto_23958 ) ( CLEAR ?auto_23952 ) ( IS-CRATE ?auto_23953 ) ( not ( = ?auto_23952 ?auto_23953 ) ) ( AVAILABLE ?auto_23955 ) ( not ( = ?auto_23959 ?auto_23958 ) ) ( HOIST-AT ?auto_23956 ?auto_23959 ) ( not ( = ?auto_23955 ?auto_23956 ) ) ( AVAILABLE ?auto_23956 ) ( SURFACE-AT ?auto_23953 ?auto_23959 ) ( ON ?auto_23953 ?auto_23954 ) ( CLEAR ?auto_23953 ) ( not ( = ?auto_23952 ?auto_23954 ) ) ( not ( = ?auto_23953 ?auto_23954 ) ) ( TRUCK-AT ?auto_23957 ?auto_23958 ) )
    :subtasks
    ( ( !DRIVE ?auto_23957 ?auto_23958 ?auto_23959 )
      ( MAKE-1CRATE ?auto_23952 ?auto_23953 )
      ( MAKE-1CRATE-VERIFY ?auto_23952 ?auto_23953 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23965 - SURFACE
      ?auto_23966 - SURFACE
    )
    :vars
    (
      ?auto_23967 - HOIST
      ?auto_23968 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23967 ?auto_23968 ) ( SURFACE-AT ?auto_23965 ?auto_23968 ) ( CLEAR ?auto_23965 ) ( LIFTING ?auto_23967 ?auto_23966 ) ( IS-CRATE ?auto_23966 ) ( not ( = ?auto_23965 ?auto_23966 ) ) )
    :subtasks
    ( ( !DROP ?auto_23967 ?auto_23966 ?auto_23965 ?auto_23968 )
      ( MAKE-1CRATE-VERIFY ?auto_23965 ?auto_23966 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23969 - SURFACE
      ?auto_23970 - SURFACE
      ?auto_23971 - SURFACE
    )
    :vars
    (
      ?auto_23973 - HOIST
      ?auto_23972 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23973 ?auto_23972 ) ( SURFACE-AT ?auto_23970 ?auto_23972 ) ( CLEAR ?auto_23970 ) ( LIFTING ?auto_23973 ?auto_23971 ) ( IS-CRATE ?auto_23971 ) ( not ( = ?auto_23970 ?auto_23971 ) ) ( ON ?auto_23970 ?auto_23969 ) ( not ( = ?auto_23969 ?auto_23970 ) ) ( not ( = ?auto_23969 ?auto_23971 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23970 ?auto_23971 )
      ( MAKE-2CRATE-VERIFY ?auto_23969 ?auto_23970 ?auto_23971 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23974 - SURFACE
      ?auto_23975 - SURFACE
    )
    :vars
    (
      ?auto_23977 - HOIST
      ?auto_23976 - PLACE
      ?auto_23978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23977 ?auto_23976 ) ( SURFACE-AT ?auto_23974 ?auto_23976 ) ( CLEAR ?auto_23974 ) ( IS-CRATE ?auto_23975 ) ( not ( = ?auto_23974 ?auto_23975 ) ) ( TRUCK-AT ?auto_23978 ?auto_23976 ) ( AVAILABLE ?auto_23977 ) ( IN ?auto_23975 ?auto_23978 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23977 ?auto_23975 ?auto_23978 ?auto_23976 )
      ( MAKE-1CRATE ?auto_23974 ?auto_23975 )
      ( MAKE-1CRATE-VERIFY ?auto_23974 ?auto_23975 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23979 - SURFACE
      ?auto_23980 - SURFACE
      ?auto_23981 - SURFACE
    )
    :vars
    (
      ?auto_23982 - HOIST
      ?auto_23984 - PLACE
      ?auto_23983 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23982 ?auto_23984 ) ( SURFACE-AT ?auto_23980 ?auto_23984 ) ( CLEAR ?auto_23980 ) ( IS-CRATE ?auto_23981 ) ( not ( = ?auto_23980 ?auto_23981 ) ) ( TRUCK-AT ?auto_23983 ?auto_23984 ) ( AVAILABLE ?auto_23982 ) ( IN ?auto_23981 ?auto_23983 ) ( ON ?auto_23980 ?auto_23979 ) ( not ( = ?auto_23979 ?auto_23980 ) ) ( not ( = ?auto_23979 ?auto_23981 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23980 ?auto_23981 )
      ( MAKE-2CRATE-VERIFY ?auto_23979 ?auto_23980 ?auto_23981 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23985 - SURFACE
      ?auto_23986 - SURFACE
    )
    :vars
    (
      ?auto_23989 - HOIST
      ?auto_23987 - PLACE
      ?auto_23988 - TRUCK
      ?auto_23990 - SURFACE
      ?auto_23991 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23989 ?auto_23987 ) ( SURFACE-AT ?auto_23985 ?auto_23987 ) ( CLEAR ?auto_23985 ) ( IS-CRATE ?auto_23986 ) ( not ( = ?auto_23985 ?auto_23986 ) ) ( AVAILABLE ?auto_23989 ) ( IN ?auto_23986 ?auto_23988 ) ( ON ?auto_23985 ?auto_23990 ) ( not ( = ?auto_23990 ?auto_23985 ) ) ( not ( = ?auto_23990 ?auto_23986 ) ) ( TRUCK-AT ?auto_23988 ?auto_23991 ) ( not ( = ?auto_23991 ?auto_23987 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23988 ?auto_23991 ?auto_23987 )
      ( MAKE-2CRATE ?auto_23990 ?auto_23985 ?auto_23986 )
      ( MAKE-1CRATE-VERIFY ?auto_23985 ?auto_23986 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_23992 - SURFACE
      ?auto_23993 - SURFACE
      ?auto_23994 - SURFACE
    )
    :vars
    (
      ?auto_23996 - HOIST
      ?auto_23997 - PLACE
      ?auto_23998 - TRUCK
      ?auto_23995 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23996 ?auto_23997 ) ( SURFACE-AT ?auto_23993 ?auto_23997 ) ( CLEAR ?auto_23993 ) ( IS-CRATE ?auto_23994 ) ( not ( = ?auto_23993 ?auto_23994 ) ) ( AVAILABLE ?auto_23996 ) ( IN ?auto_23994 ?auto_23998 ) ( ON ?auto_23993 ?auto_23992 ) ( not ( = ?auto_23992 ?auto_23993 ) ) ( not ( = ?auto_23992 ?auto_23994 ) ) ( TRUCK-AT ?auto_23998 ?auto_23995 ) ( not ( = ?auto_23995 ?auto_23997 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_23993 ?auto_23994 )
      ( MAKE-2CRATE-VERIFY ?auto_23992 ?auto_23993 ?auto_23994 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23999 - SURFACE
      ?auto_24000 - SURFACE
    )
    :vars
    (
      ?auto_24005 - HOIST
      ?auto_24002 - PLACE
      ?auto_24003 - SURFACE
      ?auto_24001 - TRUCK
      ?auto_24004 - PLACE
      ?auto_24006 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24005 ?auto_24002 ) ( SURFACE-AT ?auto_23999 ?auto_24002 ) ( CLEAR ?auto_23999 ) ( IS-CRATE ?auto_24000 ) ( not ( = ?auto_23999 ?auto_24000 ) ) ( AVAILABLE ?auto_24005 ) ( ON ?auto_23999 ?auto_24003 ) ( not ( = ?auto_24003 ?auto_23999 ) ) ( not ( = ?auto_24003 ?auto_24000 ) ) ( TRUCK-AT ?auto_24001 ?auto_24004 ) ( not ( = ?auto_24004 ?auto_24002 ) ) ( HOIST-AT ?auto_24006 ?auto_24004 ) ( LIFTING ?auto_24006 ?auto_24000 ) ( not ( = ?auto_24005 ?auto_24006 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24006 ?auto_24000 ?auto_24001 ?auto_24004 )
      ( MAKE-2CRATE ?auto_24003 ?auto_23999 ?auto_24000 )
      ( MAKE-1CRATE-VERIFY ?auto_23999 ?auto_24000 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24007 - SURFACE
      ?auto_24008 - SURFACE
      ?auto_24009 - SURFACE
    )
    :vars
    (
      ?auto_24010 - HOIST
      ?auto_24014 - PLACE
      ?auto_24013 - TRUCK
      ?auto_24011 - PLACE
      ?auto_24012 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24010 ?auto_24014 ) ( SURFACE-AT ?auto_24008 ?auto_24014 ) ( CLEAR ?auto_24008 ) ( IS-CRATE ?auto_24009 ) ( not ( = ?auto_24008 ?auto_24009 ) ) ( AVAILABLE ?auto_24010 ) ( ON ?auto_24008 ?auto_24007 ) ( not ( = ?auto_24007 ?auto_24008 ) ) ( not ( = ?auto_24007 ?auto_24009 ) ) ( TRUCK-AT ?auto_24013 ?auto_24011 ) ( not ( = ?auto_24011 ?auto_24014 ) ) ( HOIST-AT ?auto_24012 ?auto_24011 ) ( LIFTING ?auto_24012 ?auto_24009 ) ( not ( = ?auto_24010 ?auto_24012 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24008 ?auto_24009 )
      ( MAKE-2CRATE-VERIFY ?auto_24007 ?auto_24008 ?auto_24009 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24015 - SURFACE
      ?auto_24016 - SURFACE
    )
    :vars
    (
      ?auto_24020 - HOIST
      ?auto_24018 - PLACE
      ?auto_24021 - SURFACE
      ?auto_24019 - TRUCK
      ?auto_24022 - PLACE
      ?auto_24017 - HOIST
      ?auto_24023 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24020 ?auto_24018 ) ( SURFACE-AT ?auto_24015 ?auto_24018 ) ( CLEAR ?auto_24015 ) ( IS-CRATE ?auto_24016 ) ( not ( = ?auto_24015 ?auto_24016 ) ) ( AVAILABLE ?auto_24020 ) ( ON ?auto_24015 ?auto_24021 ) ( not ( = ?auto_24021 ?auto_24015 ) ) ( not ( = ?auto_24021 ?auto_24016 ) ) ( TRUCK-AT ?auto_24019 ?auto_24022 ) ( not ( = ?auto_24022 ?auto_24018 ) ) ( HOIST-AT ?auto_24017 ?auto_24022 ) ( not ( = ?auto_24020 ?auto_24017 ) ) ( AVAILABLE ?auto_24017 ) ( SURFACE-AT ?auto_24016 ?auto_24022 ) ( ON ?auto_24016 ?auto_24023 ) ( CLEAR ?auto_24016 ) ( not ( = ?auto_24015 ?auto_24023 ) ) ( not ( = ?auto_24016 ?auto_24023 ) ) ( not ( = ?auto_24021 ?auto_24023 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24017 ?auto_24016 ?auto_24023 ?auto_24022 )
      ( MAKE-2CRATE ?auto_24021 ?auto_24015 ?auto_24016 )
      ( MAKE-1CRATE-VERIFY ?auto_24015 ?auto_24016 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24024 - SURFACE
      ?auto_24025 - SURFACE
      ?auto_24026 - SURFACE
    )
    :vars
    (
      ?auto_24032 - HOIST
      ?auto_24028 - PLACE
      ?auto_24029 - TRUCK
      ?auto_24030 - PLACE
      ?auto_24027 - HOIST
      ?auto_24031 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24032 ?auto_24028 ) ( SURFACE-AT ?auto_24025 ?auto_24028 ) ( CLEAR ?auto_24025 ) ( IS-CRATE ?auto_24026 ) ( not ( = ?auto_24025 ?auto_24026 ) ) ( AVAILABLE ?auto_24032 ) ( ON ?auto_24025 ?auto_24024 ) ( not ( = ?auto_24024 ?auto_24025 ) ) ( not ( = ?auto_24024 ?auto_24026 ) ) ( TRUCK-AT ?auto_24029 ?auto_24030 ) ( not ( = ?auto_24030 ?auto_24028 ) ) ( HOIST-AT ?auto_24027 ?auto_24030 ) ( not ( = ?auto_24032 ?auto_24027 ) ) ( AVAILABLE ?auto_24027 ) ( SURFACE-AT ?auto_24026 ?auto_24030 ) ( ON ?auto_24026 ?auto_24031 ) ( CLEAR ?auto_24026 ) ( not ( = ?auto_24025 ?auto_24031 ) ) ( not ( = ?auto_24026 ?auto_24031 ) ) ( not ( = ?auto_24024 ?auto_24031 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24025 ?auto_24026 )
      ( MAKE-2CRATE-VERIFY ?auto_24024 ?auto_24025 ?auto_24026 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24033 - SURFACE
      ?auto_24034 - SURFACE
    )
    :vars
    (
      ?auto_24037 - HOIST
      ?auto_24036 - PLACE
      ?auto_24041 - SURFACE
      ?auto_24038 - PLACE
      ?auto_24039 - HOIST
      ?auto_24040 - SURFACE
      ?auto_24035 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24037 ?auto_24036 ) ( SURFACE-AT ?auto_24033 ?auto_24036 ) ( CLEAR ?auto_24033 ) ( IS-CRATE ?auto_24034 ) ( not ( = ?auto_24033 ?auto_24034 ) ) ( AVAILABLE ?auto_24037 ) ( ON ?auto_24033 ?auto_24041 ) ( not ( = ?auto_24041 ?auto_24033 ) ) ( not ( = ?auto_24041 ?auto_24034 ) ) ( not ( = ?auto_24038 ?auto_24036 ) ) ( HOIST-AT ?auto_24039 ?auto_24038 ) ( not ( = ?auto_24037 ?auto_24039 ) ) ( AVAILABLE ?auto_24039 ) ( SURFACE-AT ?auto_24034 ?auto_24038 ) ( ON ?auto_24034 ?auto_24040 ) ( CLEAR ?auto_24034 ) ( not ( = ?auto_24033 ?auto_24040 ) ) ( not ( = ?auto_24034 ?auto_24040 ) ) ( not ( = ?auto_24041 ?auto_24040 ) ) ( TRUCK-AT ?auto_24035 ?auto_24036 ) )
    :subtasks
    ( ( !DRIVE ?auto_24035 ?auto_24036 ?auto_24038 )
      ( MAKE-2CRATE ?auto_24041 ?auto_24033 ?auto_24034 )
      ( MAKE-1CRATE-VERIFY ?auto_24033 ?auto_24034 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24042 - SURFACE
      ?auto_24043 - SURFACE
      ?auto_24044 - SURFACE
    )
    :vars
    (
      ?auto_24045 - HOIST
      ?auto_24047 - PLACE
      ?auto_24048 - PLACE
      ?auto_24046 - HOIST
      ?auto_24049 - SURFACE
      ?auto_24050 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24045 ?auto_24047 ) ( SURFACE-AT ?auto_24043 ?auto_24047 ) ( CLEAR ?auto_24043 ) ( IS-CRATE ?auto_24044 ) ( not ( = ?auto_24043 ?auto_24044 ) ) ( AVAILABLE ?auto_24045 ) ( ON ?auto_24043 ?auto_24042 ) ( not ( = ?auto_24042 ?auto_24043 ) ) ( not ( = ?auto_24042 ?auto_24044 ) ) ( not ( = ?auto_24048 ?auto_24047 ) ) ( HOIST-AT ?auto_24046 ?auto_24048 ) ( not ( = ?auto_24045 ?auto_24046 ) ) ( AVAILABLE ?auto_24046 ) ( SURFACE-AT ?auto_24044 ?auto_24048 ) ( ON ?auto_24044 ?auto_24049 ) ( CLEAR ?auto_24044 ) ( not ( = ?auto_24043 ?auto_24049 ) ) ( not ( = ?auto_24044 ?auto_24049 ) ) ( not ( = ?auto_24042 ?auto_24049 ) ) ( TRUCK-AT ?auto_24050 ?auto_24047 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24043 ?auto_24044 )
      ( MAKE-2CRATE-VERIFY ?auto_24042 ?auto_24043 ?auto_24044 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24051 - SURFACE
      ?auto_24052 - SURFACE
    )
    :vars
    (
      ?auto_24057 - HOIST
      ?auto_24059 - PLACE
      ?auto_24055 - SURFACE
      ?auto_24054 - PLACE
      ?auto_24058 - HOIST
      ?auto_24053 - SURFACE
      ?auto_24056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24057 ?auto_24059 ) ( IS-CRATE ?auto_24052 ) ( not ( = ?auto_24051 ?auto_24052 ) ) ( not ( = ?auto_24055 ?auto_24051 ) ) ( not ( = ?auto_24055 ?auto_24052 ) ) ( not ( = ?auto_24054 ?auto_24059 ) ) ( HOIST-AT ?auto_24058 ?auto_24054 ) ( not ( = ?auto_24057 ?auto_24058 ) ) ( AVAILABLE ?auto_24058 ) ( SURFACE-AT ?auto_24052 ?auto_24054 ) ( ON ?auto_24052 ?auto_24053 ) ( CLEAR ?auto_24052 ) ( not ( = ?auto_24051 ?auto_24053 ) ) ( not ( = ?auto_24052 ?auto_24053 ) ) ( not ( = ?auto_24055 ?auto_24053 ) ) ( TRUCK-AT ?auto_24056 ?auto_24059 ) ( SURFACE-AT ?auto_24055 ?auto_24059 ) ( CLEAR ?auto_24055 ) ( LIFTING ?auto_24057 ?auto_24051 ) ( IS-CRATE ?auto_24051 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24055 ?auto_24051 )
      ( MAKE-2CRATE ?auto_24055 ?auto_24051 ?auto_24052 )
      ( MAKE-1CRATE-VERIFY ?auto_24051 ?auto_24052 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24060 - SURFACE
      ?auto_24061 - SURFACE
      ?auto_24062 - SURFACE
    )
    :vars
    (
      ?auto_24066 - HOIST
      ?auto_24067 - PLACE
      ?auto_24064 - PLACE
      ?auto_24068 - HOIST
      ?auto_24063 - SURFACE
      ?auto_24065 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24066 ?auto_24067 ) ( IS-CRATE ?auto_24062 ) ( not ( = ?auto_24061 ?auto_24062 ) ) ( not ( = ?auto_24060 ?auto_24061 ) ) ( not ( = ?auto_24060 ?auto_24062 ) ) ( not ( = ?auto_24064 ?auto_24067 ) ) ( HOIST-AT ?auto_24068 ?auto_24064 ) ( not ( = ?auto_24066 ?auto_24068 ) ) ( AVAILABLE ?auto_24068 ) ( SURFACE-AT ?auto_24062 ?auto_24064 ) ( ON ?auto_24062 ?auto_24063 ) ( CLEAR ?auto_24062 ) ( not ( = ?auto_24061 ?auto_24063 ) ) ( not ( = ?auto_24062 ?auto_24063 ) ) ( not ( = ?auto_24060 ?auto_24063 ) ) ( TRUCK-AT ?auto_24065 ?auto_24067 ) ( SURFACE-AT ?auto_24060 ?auto_24067 ) ( CLEAR ?auto_24060 ) ( LIFTING ?auto_24066 ?auto_24061 ) ( IS-CRATE ?auto_24061 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24061 ?auto_24062 )
      ( MAKE-2CRATE-VERIFY ?auto_24060 ?auto_24061 ?auto_24062 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24069 - SURFACE
      ?auto_24070 - SURFACE
    )
    :vars
    (
      ?auto_24074 - HOIST
      ?auto_24072 - PLACE
      ?auto_24075 - SURFACE
      ?auto_24077 - PLACE
      ?auto_24076 - HOIST
      ?auto_24073 - SURFACE
      ?auto_24071 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24074 ?auto_24072 ) ( IS-CRATE ?auto_24070 ) ( not ( = ?auto_24069 ?auto_24070 ) ) ( not ( = ?auto_24075 ?auto_24069 ) ) ( not ( = ?auto_24075 ?auto_24070 ) ) ( not ( = ?auto_24077 ?auto_24072 ) ) ( HOIST-AT ?auto_24076 ?auto_24077 ) ( not ( = ?auto_24074 ?auto_24076 ) ) ( AVAILABLE ?auto_24076 ) ( SURFACE-AT ?auto_24070 ?auto_24077 ) ( ON ?auto_24070 ?auto_24073 ) ( CLEAR ?auto_24070 ) ( not ( = ?auto_24069 ?auto_24073 ) ) ( not ( = ?auto_24070 ?auto_24073 ) ) ( not ( = ?auto_24075 ?auto_24073 ) ) ( TRUCK-AT ?auto_24071 ?auto_24072 ) ( SURFACE-AT ?auto_24075 ?auto_24072 ) ( CLEAR ?auto_24075 ) ( IS-CRATE ?auto_24069 ) ( AVAILABLE ?auto_24074 ) ( IN ?auto_24069 ?auto_24071 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24074 ?auto_24069 ?auto_24071 ?auto_24072 )
      ( MAKE-2CRATE ?auto_24075 ?auto_24069 ?auto_24070 )
      ( MAKE-1CRATE-VERIFY ?auto_24069 ?auto_24070 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24078 - SURFACE
      ?auto_24079 - SURFACE
      ?auto_24080 - SURFACE
    )
    :vars
    (
      ?auto_24084 - HOIST
      ?auto_24086 - PLACE
      ?auto_24081 - PLACE
      ?auto_24085 - HOIST
      ?auto_24082 - SURFACE
      ?auto_24083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24084 ?auto_24086 ) ( IS-CRATE ?auto_24080 ) ( not ( = ?auto_24079 ?auto_24080 ) ) ( not ( = ?auto_24078 ?auto_24079 ) ) ( not ( = ?auto_24078 ?auto_24080 ) ) ( not ( = ?auto_24081 ?auto_24086 ) ) ( HOIST-AT ?auto_24085 ?auto_24081 ) ( not ( = ?auto_24084 ?auto_24085 ) ) ( AVAILABLE ?auto_24085 ) ( SURFACE-AT ?auto_24080 ?auto_24081 ) ( ON ?auto_24080 ?auto_24082 ) ( CLEAR ?auto_24080 ) ( not ( = ?auto_24079 ?auto_24082 ) ) ( not ( = ?auto_24080 ?auto_24082 ) ) ( not ( = ?auto_24078 ?auto_24082 ) ) ( TRUCK-AT ?auto_24083 ?auto_24086 ) ( SURFACE-AT ?auto_24078 ?auto_24086 ) ( CLEAR ?auto_24078 ) ( IS-CRATE ?auto_24079 ) ( AVAILABLE ?auto_24084 ) ( IN ?auto_24079 ?auto_24083 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24079 ?auto_24080 )
      ( MAKE-2CRATE-VERIFY ?auto_24078 ?auto_24079 ?auto_24080 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24087 - SURFACE
      ?auto_24088 - SURFACE
    )
    :vars
    (
      ?auto_24091 - HOIST
      ?auto_24094 - PLACE
      ?auto_24089 - SURFACE
      ?auto_24092 - PLACE
      ?auto_24095 - HOIST
      ?auto_24090 - SURFACE
      ?auto_24093 - TRUCK
      ?auto_24096 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24091 ?auto_24094 ) ( IS-CRATE ?auto_24088 ) ( not ( = ?auto_24087 ?auto_24088 ) ) ( not ( = ?auto_24089 ?auto_24087 ) ) ( not ( = ?auto_24089 ?auto_24088 ) ) ( not ( = ?auto_24092 ?auto_24094 ) ) ( HOIST-AT ?auto_24095 ?auto_24092 ) ( not ( = ?auto_24091 ?auto_24095 ) ) ( AVAILABLE ?auto_24095 ) ( SURFACE-AT ?auto_24088 ?auto_24092 ) ( ON ?auto_24088 ?auto_24090 ) ( CLEAR ?auto_24088 ) ( not ( = ?auto_24087 ?auto_24090 ) ) ( not ( = ?auto_24088 ?auto_24090 ) ) ( not ( = ?auto_24089 ?auto_24090 ) ) ( SURFACE-AT ?auto_24089 ?auto_24094 ) ( CLEAR ?auto_24089 ) ( IS-CRATE ?auto_24087 ) ( AVAILABLE ?auto_24091 ) ( IN ?auto_24087 ?auto_24093 ) ( TRUCK-AT ?auto_24093 ?auto_24096 ) ( not ( = ?auto_24096 ?auto_24094 ) ) ( not ( = ?auto_24092 ?auto_24096 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24093 ?auto_24096 ?auto_24094 )
      ( MAKE-2CRATE ?auto_24089 ?auto_24087 ?auto_24088 )
      ( MAKE-1CRATE-VERIFY ?auto_24087 ?auto_24088 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24097 - SURFACE
      ?auto_24098 - SURFACE
      ?auto_24099 - SURFACE
    )
    :vars
    (
      ?auto_24105 - HOIST
      ?auto_24106 - PLACE
      ?auto_24100 - PLACE
      ?auto_24104 - HOIST
      ?auto_24103 - SURFACE
      ?auto_24101 - TRUCK
      ?auto_24102 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24105 ?auto_24106 ) ( IS-CRATE ?auto_24099 ) ( not ( = ?auto_24098 ?auto_24099 ) ) ( not ( = ?auto_24097 ?auto_24098 ) ) ( not ( = ?auto_24097 ?auto_24099 ) ) ( not ( = ?auto_24100 ?auto_24106 ) ) ( HOIST-AT ?auto_24104 ?auto_24100 ) ( not ( = ?auto_24105 ?auto_24104 ) ) ( AVAILABLE ?auto_24104 ) ( SURFACE-AT ?auto_24099 ?auto_24100 ) ( ON ?auto_24099 ?auto_24103 ) ( CLEAR ?auto_24099 ) ( not ( = ?auto_24098 ?auto_24103 ) ) ( not ( = ?auto_24099 ?auto_24103 ) ) ( not ( = ?auto_24097 ?auto_24103 ) ) ( SURFACE-AT ?auto_24097 ?auto_24106 ) ( CLEAR ?auto_24097 ) ( IS-CRATE ?auto_24098 ) ( AVAILABLE ?auto_24105 ) ( IN ?auto_24098 ?auto_24101 ) ( TRUCK-AT ?auto_24101 ?auto_24102 ) ( not ( = ?auto_24102 ?auto_24106 ) ) ( not ( = ?auto_24100 ?auto_24102 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24098 ?auto_24099 )
      ( MAKE-2CRATE-VERIFY ?auto_24097 ?auto_24098 ?auto_24099 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24107 - SURFACE
      ?auto_24108 - SURFACE
    )
    :vars
    (
      ?auto_24116 - HOIST
      ?auto_24111 - PLACE
      ?auto_24113 - SURFACE
      ?auto_24112 - PLACE
      ?auto_24110 - HOIST
      ?auto_24115 - SURFACE
      ?auto_24109 - TRUCK
      ?auto_24114 - PLACE
      ?auto_24117 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24116 ?auto_24111 ) ( IS-CRATE ?auto_24108 ) ( not ( = ?auto_24107 ?auto_24108 ) ) ( not ( = ?auto_24113 ?auto_24107 ) ) ( not ( = ?auto_24113 ?auto_24108 ) ) ( not ( = ?auto_24112 ?auto_24111 ) ) ( HOIST-AT ?auto_24110 ?auto_24112 ) ( not ( = ?auto_24116 ?auto_24110 ) ) ( AVAILABLE ?auto_24110 ) ( SURFACE-AT ?auto_24108 ?auto_24112 ) ( ON ?auto_24108 ?auto_24115 ) ( CLEAR ?auto_24108 ) ( not ( = ?auto_24107 ?auto_24115 ) ) ( not ( = ?auto_24108 ?auto_24115 ) ) ( not ( = ?auto_24113 ?auto_24115 ) ) ( SURFACE-AT ?auto_24113 ?auto_24111 ) ( CLEAR ?auto_24113 ) ( IS-CRATE ?auto_24107 ) ( AVAILABLE ?auto_24116 ) ( TRUCK-AT ?auto_24109 ?auto_24114 ) ( not ( = ?auto_24114 ?auto_24111 ) ) ( not ( = ?auto_24112 ?auto_24114 ) ) ( HOIST-AT ?auto_24117 ?auto_24114 ) ( LIFTING ?auto_24117 ?auto_24107 ) ( not ( = ?auto_24116 ?auto_24117 ) ) ( not ( = ?auto_24110 ?auto_24117 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24117 ?auto_24107 ?auto_24109 ?auto_24114 )
      ( MAKE-2CRATE ?auto_24113 ?auto_24107 ?auto_24108 )
      ( MAKE-1CRATE-VERIFY ?auto_24107 ?auto_24108 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24118 - SURFACE
      ?auto_24119 - SURFACE
      ?auto_24120 - SURFACE
    )
    :vars
    (
      ?auto_24124 - HOIST
      ?auto_24127 - PLACE
      ?auto_24122 - PLACE
      ?auto_24128 - HOIST
      ?auto_24123 - SURFACE
      ?auto_24125 - TRUCK
      ?auto_24126 - PLACE
      ?auto_24121 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24124 ?auto_24127 ) ( IS-CRATE ?auto_24120 ) ( not ( = ?auto_24119 ?auto_24120 ) ) ( not ( = ?auto_24118 ?auto_24119 ) ) ( not ( = ?auto_24118 ?auto_24120 ) ) ( not ( = ?auto_24122 ?auto_24127 ) ) ( HOIST-AT ?auto_24128 ?auto_24122 ) ( not ( = ?auto_24124 ?auto_24128 ) ) ( AVAILABLE ?auto_24128 ) ( SURFACE-AT ?auto_24120 ?auto_24122 ) ( ON ?auto_24120 ?auto_24123 ) ( CLEAR ?auto_24120 ) ( not ( = ?auto_24119 ?auto_24123 ) ) ( not ( = ?auto_24120 ?auto_24123 ) ) ( not ( = ?auto_24118 ?auto_24123 ) ) ( SURFACE-AT ?auto_24118 ?auto_24127 ) ( CLEAR ?auto_24118 ) ( IS-CRATE ?auto_24119 ) ( AVAILABLE ?auto_24124 ) ( TRUCK-AT ?auto_24125 ?auto_24126 ) ( not ( = ?auto_24126 ?auto_24127 ) ) ( not ( = ?auto_24122 ?auto_24126 ) ) ( HOIST-AT ?auto_24121 ?auto_24126 ) ( LIFTING ?auto_24121 ?auto_24119 ) ( not ( = ?auto_24124 ?auto_24121 ) ) ( not ( = ?auto_24128 ?auto_24121 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24119 ?auto_24120 )
      ( MAKE-2CRATE-VERIFY ?auto_24118 ?auto_24119 ?auto_24120 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24129 - SURFACE
      ?auto_24130 - SURFACE
    )
    :vars
    (
      ?auto_24134 - HOIST
      ?auto_24137 - PLACE
      ?auto_24133 - SURFACE
      ?auto_24138 - PLACE
      ?auto_24139 - HOIST
      ?auto_24136 - SURFACE
      ?auto_24132 - TRUCK
      ?auto_24135 - PLACE
      ?auto_24131 - HOIST
      ?auto_24140 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24134 ?auto_24137 ) ( IS-CRATE ?auto_24130 ) ( not ( = ?auto_24129 ?auto_24130 ) ) ( not ( = ?auto_24133 ?auto_24129 ) ) ( not ( = ?auto_24133 ?auto_24130 ) ) ( not ( = ?auto_24138 ?auto_24137 ) ) ( HOIST-AT ?auto_24139 ?auto_24138 ) ( not ( = ?auto_24134 ?auto_24139 ) ) ( AVAILABLE ?auto_24139 ) ( SURFACE-AT ?auto_24130 ?auto_24138 ) ( ON ?auto_24130 ?auto_24136 ) ( CLEAR ?auto_24130 ) ( not ( = ?auto_24129 ?auto_24136 ) ) ( not ( = ?auto_24130 ?auto_24136 ) ) ( not ( = ?auto_24133 ?auto_24136 ) ) ( SURFACE-AT ?auto_24133 ?auto_24137 ) ( CLEAR ?auto_24133 ) ( IS-CRATE ?auto_24129 ) ( AVAILABLE ?auto_24134 ) ( TRUCK-AT ?auto_24132 ?auto_24135 ) ( not ( = ?auto_24135 ?auto_24137 ) ) ( not ( = ?auto_24138 ?auto_24135 ) ) ( HOIST-AT ?auto_24131 ?auto_24135 ) ( not ( = ?auto_24134 ?auto_24131 ) ) ( not ( = ?auto_24139 ?auto_24131 ) ) ( AVAILABLE ?auto_24131 ) ( SURFACE-AT ?auto_24129 ?auto_24135 ) ( ON ?auto_24129 ?auto_24140 ) ( CLEAR ?auto_24129 ) ( not ( = ?auto_24129 ?auto_24140 ) ) ( not ( = ?auto_24130 ?auto_24140 ) ) ( not ( = ?auto_24133 ?auto_24140 ) ) ( not ( = ?auto_24136 ?auto_24140 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24131 ?auto_24129 ?auto_24140 ?auto_24135 )
      ( MAKE-2CRATE ?auto_24133 ?auto_24129 ?auto_24130 )
      ( MAKE-1CRATE-VERIFY ?auto_24129 ?auto_24130 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24141 - SURFACE
      ?auto_24142 - SURFACE
      ?auto_24143 - SURFACE
    )
    :vars
    (
      ?auto_24147 - HOIST
      ?auto_24149 - PLACE
      ?auto_24146 - PLACE
      ?auto_24151 - HOIST
      ?auto_24148 - SURFACE
      ?auto_24152 - TRUCK
      ?auto_24150 - PLACE
      ?auto_24144 - HOIST
      ?auto_24145 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24147 ?auto_24149 ) ( IS-CRATE ?auto_24143 ) ( not ( = ?auto_24142 ?auto_24143 ) ) ( not ( = ?auto_24141 ?auto_24142 ) ) ( not ( = ?auto_24141 ?auto_24143 ) ) ( not ( = ?auto_24146 ?auto_24149 ) ) ( HOIST-AT ?auto_24151 ?auto_24146 ) ( not ( = ?auto_24147 ?auto_24151 ) ) ( AVAILABLE ?auto_24151 ) ( SURFACE-AT ?auto_24143 ?auto_24146 ) ( ON ?auto_24143 ?auto_24148 ) ( CLEAR ?auto_24143 ) ( not ( = ?auto_24142 ?auto_24148 ) ) ( not ( = ?auto_24143 ?auto_24148 ) ) ( not ( = ?auto_24141 ?auto_24148 ) ) ( SURFACE-AT ?auto_24141 ?auto_24149 ) ( CLEAR ?auto_24141 ) ( IS-CRATE ?auto_24142 ) ( AVAILABLE ?auto_24147 ) ( TRUCK-AT ?auto_24152 ?auto_24150 ) ( not ( = ?auto_24150 ?auto_24149 ) ) ( not ( = ?auto_24146 ?auto_24150 ) ) ( HOIST-AT ?auto_24144 ?auto_24150 ) ( not ( = ?auto_24147 ?auto_24144 ) ) ( not ( = ?auto_24151 ?auto_24144 ) ) ( AVAILABLE ?auto_24144 ) ( SURFACE-AT ?auto_24142 ?auto_24150 ) ( ON ?auto_24142 ?auto_24145 ) ( CLEAR ?auto_24142 ) ( not ( = ?auto_24142 ?auto_24145 ) ) ( not ( = ?auto_24143 ?auto_24145 ) ) ( not ( = ?auto_24141 ?auto_24145 ) ) ( not ( = ?auto_24148 ?auto_24145 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24142 ?auto_24143 )
      ( MAKE-2CRATE-VERIFY ?auto_24141 ?auto_24142 ?auto_24143 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24153 - SURFACE
      ?auto_24154 - SURFACE
    )
    :vars
    (
      ?auto_24157 - HOIST
      ?auto_24159 - PLACE
      ?auto_24158 - SURFACE
      ?auto_24164 - PLACE
      ?auto_24163 - HOIST
      ?auto_24162 - SURFACE
      ?auto_24156 - PLACE
      ?auto_24160 - HOIST
      ?auto_24155 - SURFACE
      ?auto_24161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24157 ?auto_24159 ) ( IS-CRATE ?auto_24154 ) ( not ( = ?auto_24153 ?auto_24154 ) ) ( not ( = ?auto_24158 ?auto_24153 ) ) ( not ( = ?auto_24158 ?auto_24154 ) ) ( not ( = ?auto_24164 ?auto_24159 ) ) ( HOIST-AT ?auto_24163 ?auto_24164 ) ( not ( = ?auto_24157 ?auto_24163 ) ) ( AVAILABLE ?auto_24163 ) ( SURFACE-AT ?auto_24154 ?auto_24164 ) ( ON ?auto_24154 ?auto_24162 ) ( CLEAR ?auto_24154 ) ( not ( = ?auto_24153 ?auto_24162 ) ) ( not ( = ?auto_24154 ?auto_24162 ) ) ( not ( = ?auto_24158 ?auto_24162 ) ) ( SURFACE-AT ?auto_24158 ?auto_24159 ) ( CLEAR ?auto_24158 ) ( IS-CRATE ?auto_24153 ) ( AVAILABLE ?auto_24157 ) ( not ( = ?auto_24156 ?auto_24159 ) ) ( not ( = ?auto_24164 ?auto_24156 ) ) ( HOIST-AT ?auto_24160 ?auto_24156 ) ( not ( = ?auto_24157 ?auto_24160 ) ) ( not ( = ?auto_24163 ?auto_24160 ) ) ( AVAILABLE ?auto_24160 ) ( SURFACE-AT ?auto_24153 ?auto_24156 ) ( ON ?auto_24153 ?auto_24155 ) ( CLEAR ?auto_24153 ) ( not ( = ?auto_24153 ?auto_24155 ) ) ( not ( = ?auto_24154 ?auto_24155 ) ) ( not ( = ?auto_24158 ?auto_24155 ) ) ( not ( = ?auto_24162 ?auto_24155 ) ) ( TRUCK-AT ?auto_24161 ?auto_24159 ) )
    :subtasks
    ( ( !DRIVE ?auto_24161 ?auto_24159 ?auto_24156 )
      ( MAKE-2CRATE ?auto_24158 ?auto_24153 ?auto_24154 )
      ( MAKE-1CRATE-VERIFY ?auto_24153 ?auto_24154 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24165 - SURFACE
      ?auto_24166 - SURFACE
      ?auto_24167 - SURFACE
    )
    :vars
    (
      ?auto_24170 - HOIST
      ?auto_24173 - PLACE
      ?auto_24176 - PLACE
      ?auto_24169 - HOIST
      ?auto_24171 - SURFACE
      ?auto_24172 - PLACE
      ?auto_24174 - HOIST
      ?auto_24168 - SURFACE
      ?auto_24175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24170 ?auto_24173 ) ( IS-CRATE ?auto_24167 ) ( not ( = ?auto_24166 ?auto_24167 ) ) ( not ( = ?auto_24165 ?auto_24166 ) ) ( not ( = ?auto_24165 ?auto_24167 ) ) ( not ( = ?auto_24176 ?auto_24173 ) ) ( HOIST-AT ?auto_24169 ?auto_24176 ) ( not ( = ?auto_24170 ?auto_24169 ) ) ( AVAILABLE ?auto_24169 ) ( SURFACE-AT ?auto_24167 ?auto_24176 ) ( ON ?auto_24167 ?auto_24171 ) ( CLEAR ?auto_24167 ) ( not ( = ?auto_24166 ?auto_24171 ) ) ( not ( = ?auto_24167 ?auto_24171 ) ) ( not ( = ?auto_24165 ?auto_24171 ) ) ( SURFACE-AT ?auto_24165 ?auto_24173 ) ( CLEAR ?auto_24165 ) ( IS-CRATE ?auto_24166 ) ( AVAILABLE ?auto_24170 ) ( not ( = ?auto_24172 ?auto_24173 ) ) ( not ( = ?auto_24176 ?auto_24172 ) ) ( HOIST-AT ?auto_24174 ?auto_24172 ) ( not ( = ?auto_24170 ?auto_24174 ) ) ( not ( = ?auto_24169 ?auto_24174 ) ) ( AVAILABLE ?auto_24174 ) ( SURFACE-AT ?auto_24166 ?auto_24172 ) ( ON ?auto_24166 ?auto_24168 ) ( CLEAR ?auto_24166 ) ( not ( = ?auto_24166 ?auto_24168 ) ) ( not ( = ?auto_24167 ?auto_24168 ) ) ( not ( = ?auto_24165 ?auto_24168 ) ) ( not ( = ?auto_24171 ?auto_24168 ) ) ( TRUCK-AT ?auto_24175 ?auto_24173 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24166 ?auto_24167 )
      ( MAKE-2CRATE-VERIFY ?auto_24165 ?auto_24166 ?auto_24167 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24186 - SURFACE
      ?auto_24187 - SURFACE
    )
    :vars
    (
      ?auto_24188 - HOIST
      ?auto_24189 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24188 ?auto_24189 ) ( SURFACE-AT ?auto_24186 ?auto_24189 ) ( CLEAR ?auto_24186 ) ( LIFTING ?auto_24188 ?auto_24187 ) ( IS-CRATE ?auto_24187 ) ( not ( = ?auto_24186 ?auto_24187 ) ) )
    :subtasks
    ( ( !DROP ?auto_24188 ?auto_24187 ?auto_24186 ?auto_24189 )
      ( MAKE-1CRATE-VERIFY ?auto_24186 ?auto_24187 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24190 - SURFACE
      ?auto_24191 - SURFACE
      ?auto_24192 - SURFACE
    )
    :vars
    (
      ?auto_24194 - HOIST
      ?auto_24193 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24194 ?auto_24193 ) ( SURFACE-AT ?auto_24191 ?auto_24193 ) ( CLEAR ?auto_24191 ) ( LIFTING ?auto_24194 ?auto_24192 ) ( IS-CRATE ?auto_24192 ) ( not ( = ?auto_24191 ?auto_24192 ) ) ( ON ?auto_24191 ?auto_24190 ) ( not ( = ?auto_24190 ?auto_24191 ) ) ( not ( = ?auto_24190 ?auto_24192 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24191 ?auto_24192 )
      ( MAKE-2CRATE-VERIFY ?auto_24190 ?auto_24191 ?auto_24192 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24195 - SURFACE
      ?auto_24196 - SURFACE
      ?auto_24197 - SURFACE
      ?auto_24198 - SURFACE
    )
    :vars
    (
      ?auto_24200 - HOIST
      ?auto_24199 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24200 ?auto_24199 ) ( SURFACE-AT ?auto_24197 ?auto_24199 ) ( CLEAR ?auto_24197 ) ( LIFTING ?auto_24200 ?auto_24198 ) ( IS-CRATE ?auto_24198 ) ( not ( = ?auto_24197 ?auto_24198 ) ) ( ON ?auto_24196 ?auto_24195 ) ( ON ?auto_24197 ?auto_24196 ) ( not ( = ?auto_24195 ?auto_24196 ) ) ( not ( = ?auto_24195 ?auto_24197 ) ) ( not ( = ?auto_24195 ?auto_24198 ) ) ( not ( = ?auto_24196 ?auto_24197 ) ) ( not ( = ?auto_24196 ?auto_24198 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24197 ?auto_24198 )
      ( MAKE-3CRATE-VERIFY ?auto_24195 ?auto_24196 ?auto_24197 ?auto_24198 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24201 - SURFACE
      ?auto_24202 - SURFACE
    )
    :vars
    (
      ?auto_24204 - HOIST
      ?auto_24203 - PLACE
      ?auto_24205 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24204 ?auto_24203 ) ( SURFACE-AT ?auto_24201 ?auto_24203 ) ( CLEAR ?auto_24201 ) ( IS-CRATE ?auto_24202 ) ( not ( = ?auto_24201 ?auto_24202 ) ) ( TRUCK-AT ?auto_24205 ?auto_24203 ) ( AVAILABLE ?auto_24204 ) ( IN ?auto_24202 ?auto_24205 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24204 ?auto_24202 ?auto_24205 ?auto_24203 )
      ( MAKE-1CRATE ?auto_24201 ?auto_24202 )
      ( MAKE-1CRATE-VERIFY ?auto_24201 ?auto_24202 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24206 - SURFACE
      ?auto_24207 - SURFACE
      ?auto_24208 - SURFACE
    )
    :vars
    (
      ?auto_24211 - HOIST
      ?auto_24209 - PLACE
      ?auto_24210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24211 ?auto_24209 ) ( SURFACE-AT ?auto_24207 ?auto_24209 ) ( CLEAR ?auto_24207 ) ( IS-CRATE ?auto_24208 ) ( not ( = ?auto_24207 ?auto_24208 ) ) ( TRUCK-AT ?auto_24210 ?auto_24209 ) ( AVAILABLE ?auto_24211 ) ( IN ?auto_24208 ?auto_24210 ) ( ON ?auto_24207 ?auto_24206 ) ( not ( = ?auto_24206 ?auto_24207 ) ) ( not ( = ?auto_24206 ?auto_24208 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24207 ?auto_24208 )
      ( MAKE-2CRATE-VERIFY ?auto_24206 ?auto_24207 ?auto_24208 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24212 - SURFACE
      ?auto_24213 - SURFACE
      ?auto_24214 - SURFACE
      ?auto_24215 - SURFACE
    )
    :vars
    (
      ?auto_24218 - HOIST
      ?auto_24217 - PLACE
      ?auto_24216 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24218 ?auto_24217 ) ( SURFACE-AT ?auto_24214 ?auto_24217 ) ( CLEAR ?auto_24214 ) ( IS-CRATE ?auto_24215 ) ( not ( = ?auto_24214 ?auto_24215 ) ) ( TRUCK-AT ?auto_24216 ?auto_24217 ) ( AVAILABLE ?auto_24218 ) ( IN ?auto_24215 ?auto_24216 ) ( ON ?auto_24214 ?auto_24213 ) ( not ( = ?auto_24213 ?auto_24214 ) ) ( not ( = ?auto_24213 ?auto_24215 ) ) ( ON ?auto_24213 ?auto_24212 ) ( not ( = ?auto_24212 ?auto_24213 ) ) ( not ( = ?auto_24212 ?auto_24214 ) ) ( not ( = ?auto_24212 ?auto_24215 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24213 ?auto_24214 ?auto_24215 )
      ( MAKE-3CRATE-VERIFY ?auto_24212 ?auto_24213 ?auto_24214 ?auto_24215 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24219 - SURFACE
      ?auto_24220 - SURFACE
    )
    :vars
    (
      ?auto_24224 - HOIST
      ?auto_24223 - PLACE
      ?auto_24221 - TRUCK
      ?auto_24222 - SURFACE
      ?auto_24225 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24224 ?auto_24223 ) ( SURFACE-AT ?auto_24219 ?auto_24223 ) ( CLEAR ?auto_24219 ) ( IS-CRATE ?auto_24220 ) ( not ( = ?auto_24219 ?auto_24220 ) ) ( AVAILABLE ?auto_24224 ) ( IN ?auto_24220 ?auto_24221 ) ( ON ?auto_24219 ?auto_24222 ) ( not ( = ?auto_24222 ?auto_24219 ) ) ( not ( = ?auto_24222 ?auto_24220 ) ) ( TRUCK-AT ?auto_24221 ?auto_24225 ) ( not ( = ?auto_24225 ?auto_24223 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24221 ?auto_24225 ?auto_24223 )
      ( MAKE-2CRATE ?auto_24222 ?auto_24219 ?auto_24220 )
      ( MAKE-1CRATE-VERIFY ?auto_24219 ?auto_24220 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24226 - SURFACE
      ?auto_24227 - SURFACE
      ?auto_24228 - SURFACE
    )
    :vars
    (
      ?auto_24231 - HOIST
      ?auto_24229 - PLACE
      ?auto_24230 - TRUCK
      ?auto_24232 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24231 ?auto_24229 ) ( SURFACE-AT ?auto_24227 ?auto_24229 ) ( CLEAR ?auto_24227 ) ( IS-CRATE ?auto_24228 ) ( not ( = ?auto_24227 ?auto_24228 ) ) ( AVAILABLE ?auto_24231 ) ( IN ?auto_24228 ?auto_24230 ) ( ON ?auto_24227 ?auto_24226 ) ( not ( = ?auto_24226 ?auto_24227 ) ) ( not ( = ?auto_24226 ?auto_24228 ) ) ( TRUCK-AT ?auto_24230 ?auto_24232 ) ( not ( = ?auto_24232 ?auto_24229 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24227 ?auto_24228 )
      ( MAKE-2CRATE-VERIFY ?auto_24226 ?auto_24227 ?auto_24228 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24233 - SURFACE
      ?auto_24234 - SURFACE
      ?auto_24235 - SURFACE
      ?auto_24236 - SURFACE
    )
    :vars
    (
      ?auto_24237 - HOIST
      ?auto_24238 - PLACE
      ?auto_24239 - TRUCK
      ?auto_24240 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24237 ?auto_24238 ) ( SURFACE-AT ?auto_24235 ?auto_24238 ) ( CLEAR ?auto_24235 ) ( IS-CRATE ?auto_24236 ) ( not ( = ?auto_24235 ?auto_24236 ) ) ( AVAILABLE ?auto_24237 ) ( IN ?auto_24236 ?auto_24239 ) ( ON ?auto_24235 ?auto_24234 ) ( not ( = ?auto_24234 ?auto_24235 ) ) ( not ( = ?auto_24234 ?auto_24236 ) ) ( TRUCK-AT ?auto_24239 ?auto_24240 ) ( not ( = ?auto_24240 ?auto_24238 ) ) ( ON ?auto_24234 ?auto_24233 ) ( not ( = ?auto_24233 ?auto_24234 ) ) ( not ( = ?auto_24233 ?auto_24235 ) ) ( not ( = ?auto_24233 ?auto_24236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24234 ?auto_24235 ?auto_24236 )
      ( MAKE-3CRATE-VERIFY ?auto_24233 ?auto_24234 ?auto_24235 ?auto_24236 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24241 - SURFACE
      ?auto_24242 - SURFACE
    )
    :vars
    (
      ?auto_24244 - HOIST
      ?auto_24245 - PLACE
      ?auto_24243 - SURFACE
      ?auto_24246 - TRUCK
      ?auto_24247 - PLACE
      ?auto_24248 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24244 ?auto_24245 ) ( SURFACE-AT ?auto_24241 ?auto_24245 ) ( CLEAR ?auto_24241 ) ( IS-CRATE ?auto_24242 ) ( not ( = ?auto_24241 ?auto_24242 ) ) ( AVAILABLE ?auto_24244 ) ( ON ?auto_24241 ?auto_24243 ) ( not ( = ?auto_24243 ?auto_24241 ) ) ( not ( = ?auto_24243 ?auto_24242 ) ) ( TRUCK-AT ?auto_24246 ?auto_24247 ) ( not ( = ?auto_24247 ?auto_24245 ) ) ( HOIST-AT ?auto_24248 ?auto_24247 ) ( LIFTING ?auto_24248 ?auto_24242 ) ( not ( = ?auto_24244 ?auto_24248 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24248 ?auto_24242 ?auto_24246 ?auto_24247 )
      ( MAKE-2CRATE ?auto_24243 ?auto_24241 ?auto_24242 )
      ( MAKE-1CRATE-VERIFY ?auto_24241 ?auto_24242 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24249 - SURFACE
      ?auto_24250 - SURFACE
      ?auto_24251 - SURFACE
    )
    :vars
    (
      ?auto_24254 - HOIST
      ?auto_24255 - PLACE
      ?auto_24252 - TRUCK
      ?auto_24253 - PLACE
      ?auto_24256 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24254 ?auto_24255 ) ( SURFACE-AT ?auto_24250 ?auto_24255 ) ( CLEAR ?auto_24250 ) ( IS-CRATE ?auto_24251 ) ( not ( = ?auto_24250 ?auto_24251 ) ) ( AVAILABLE ?auto_24254 ) ( ON ?auto_24250 ?auto_24249 ) ( not ( = ?auto_24249 ?auto_24250 ) ) ( not ( = ?auto_24249 ?auto_24251 ) ) ( TRUCK-AT ?auto_24252 ?auto_24253 ) ( not ( = ?auto_24253 ?auto_24255 ) ) ( HOIST-AT ?auto_24256 ?auto_24253 ) ( LIFTING ?auto_24256 ?auto_24251 ) ( not ( = ?auto_24254 ?auto_24256 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24250 ?auto_24251 )
      ( MAKE-2CRATE-VERIFY ?auto_24249 ?auto_24250 ?auto_24251 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24257 - SURFACE
      ?auto_24258 - SURFACE
      ?auto_24259 - SURFACE
      ?auto_24260 - SURFACE
    )
    :vars
    (
      ?auto_24263 - HOIST
      ?auto_24262 - PLACE
      ?auto_24261 - TRUCK
      ?auto_24264 - PLACE
      ?auto_24265 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24263 ?auto_24262 ) ( SURFACE-AT ?auto_24259 ?auto_24262 ) ( CLEAR ?auto_24259 ) ( IS-CRATE ?auto_24260 ) ( not ( = ?auto_24259 ?auto_24260 ) ) ( AVAILABLE ?auto_24263 ) ( ON ?auto_24259 ?auto_24258 ) ( not ( = ?auto_24258 ?auto_24259 ) ) ( not ( = ?auto_24258 ?auto_24260 ) ) ( TRUCK-AT ?auto_24261 ?auto_24264 ) ( not ( = ?auto_24264 ?auto_24262 ) ) ( HOIST-AT ?auto_24265 ?auto_24264 ) ( LIFTING ?auto_24265 ?auto_24260 ) ( not ( = ?auto_24263 ?auto_24265 ) ) ( ON ?auto_24258 ?auto_24257 ) ( not ( = ?auto_24257 ?auto_24258 ) ) ( not ( = ?auto_24257 ?auto_24259 ) ) ( not ( = ?auto_24257 ?auto_24260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24258 ?auto_24259 ?auto_24260 )
      ( MAKE-3CRATE-VERIFY ?auto_24257 ?auto_24258 ?auto_24259 ?auto_24260 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24266 - SURFACE
      ?auto_24267 - SURFACE
    )
    :vars
    (
      ?auto_24271 - HOIST
      ?auto_24270 - PLACE
      ?auto_24269 - SURFACE
      ?auto_24268 - TRUCK
      ?auto_24272 - PLACE
      ?auto_24273 - HOIST
      ?auto_24274 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24271 ?auto_24270 ) ( SURFACE-AT ?auto_24266 ?auto_24270 ) ( CLEAR ?auto_24266 ) ( IS-CRATE ?auto_24267 ) ( not ( = ?auto_24266 ?auto_24267 ) ) ( AVAILABLE ?auto_24271 ) ( ON ?auto_24266 ?auto_24269 ) ( not ( = ?auto_24269 ?auto_24266 ) ) ( not ( = ?auto_24269 ?auto_24267 ) ) ( TRUCK-AT ?auto_24268 ?auto_24272 ) ( not ( = ?auto_24272 ?auto_24270 ) ) ( HOIST-AT ?auto_24273 ?auto_24272 ) ( not ( = ?auto_24271 ?auto_24273 ) ) ( AVAILABLE ?auto_24273 ) ( SURFACE-AT ?auto_24267 ?auto_24272 ) ( ON ?auto_24267 ?auto_24274 ) ( CLEAR ?auto_24267 ) ( not ( = ?auto_24266 ?auto_24274 ) ) ( not ( = ?auto_24267 ?auto_24274 ) ) ( not ( = ?auto_24269 ?auto_24274 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24273 ?auto_24267 ?auto_24274 ?auto_24272 )
      ( MAKE-2CRATE ?auto_24269 ?auto_24266 ?auto_24267 )
      ( MAKE-1CRATE-VERIFY ?auto_24266 ?auto_24267 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24275 - SURFACE
      ?auto_24276 - SURFACE
      ?auto_24277 - SURFACE
    )
    :vars
    (
      ?auto_24283 - HOIST
      ?auto_24281 - PLACE
      ?auto_24280 - TRUCK
      ?auto_24279 - PLACE
      ?auto_24278 - HOIST
      ?auto_24282 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24283 ?auto_24281 ) ( SURFACE-AT ?auto_24276 ?auto_24281 ) ( CLEAR ?auto_24276 ) ( IS-CRATE ?auto_24277 ) ( not ( = ?auto_24276 ?auto_24277 ) ) ( AVAILABLE ?auto_24283 ) ( ON ?auto_24276 ?auto_24275 ) ( not ( = ?auto_24275 ?auto_24276 ) ) ( not ( = ?auto_24275 ?auto_24277 ) ) ( TRUCK-AT ?auto_24280 ?auto_24279 ) ( not ( = ?auto_24279 ?auto_24281 ) ) ( HOIST-AT ?auto_24278 ?auto_24279 ) ( not ( = ?auto_24283 ?auto_24278 ) ) ( AVAILABLE ?auto_24278 ) ( SURFACE-AT ?auto_24277 ?auto_24279 ) ( ON ?auto_24277 ?auto_24282 ) ( CLEAR ?auto_24277 ) ( not ( = ?auto_24276 ?auto_24282 ) ) ( not ( = ?auto_24277 ?auto_24282 ) ) ( not ( = ?auto_24275 ?auto_24282 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24276 ?auto_24277 )
      ( MAKE-2CRATE-VERIFY ?auto_24275 ?auto_24276 ?auto_24277 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24284 - SURFACE
      ?auto_24285 - SURFACE
      ?auto_24286 - SURFACE
      ?auto_24287 - SURFACE
    )
    :vars
    (
      ?auto_24289 - HOIST
      ?auto_24292 - PLACE
      ?auto_24290 - TRUCK
      ?auto_24293 - PLACE
      ?auto_24291 - HOIST
      ?auto_24288 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24289 ?auto_24292 ) ( SURFACE-AT ?auto_24286 ?auto_24292 ) ( CLEAR ?auto_24286 ) ( IS-CRATE ?auto_24287 ) ( not ( = ?auto_24286 ?auto_24287 ) ) ( AVAILABLE ?auto_24289 ) ( ON ?auto_24286 ?auto_24285 ) ( not ( = ?auto_24285 ?auto_24286 ) ) ( not ( = ?auto_24285 ?auto_24287 ) ) ( TRUCK-AT ?auto_24290 ?auto_24293 ) ( not ( = ?auto_24293 ?auto_24292 ) ) ( HOIST-AT ?auto_24291 ?auto_24293 ) ( not ( = ?auto_24289 ?auto_24291 ) ) ( AVAILABLE ?auto_24291 ) ( SURFACE-AT ?auto_24287 ?auto_24293 ) ( ON ?auto_24287 ?auto_24288 ) ( CLEAR ?auto_24287 ) ( not ( = ?auto_24286 ?auto_24288 ) ) ( not ( = ?auto_24287 ?auto_24288 ) ) ( not ( = ?auto_24285 ?auto_24288 ) ) ( ON ?auto_24285 ?auto_24284 ) ( not ( = ?auto_24284 ?auto_24285 ) ) ( not ( = ?auto_24284 ?auto_24286 ) ) ( not ( = ?auto_24284 ?auto_24287 ) ) ( not ( = ?auto_24284 ?auto_24288 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24285 ?auto_24286 ?auto_24287 )
      ( MAKE-3CRATE-VERIFY ?auto_24284 ?auto_24285 ?auto_24286 ?auto_24287 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24294 - SURFACE
      ?auto_24295 - SURFACE
    )
    :vars
    (
      ?auto_24297 - HOIST
      ?auto_24301 - PLACE
      ?auto_24298 - SURFACE
      ?auto_24302 - PLACE
      ?auto_24300 - HOIST
      ?auto_24296 - SURFACE
      ?auto_24299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24297 ?auto_24301 ) ( SURFACE-AT ?auto_24294 ?auto_24301 ) ( CLEAR ?auto_24294 ) ( IS-CRATE ?auto_24295 ) ( not ( = ?auto_24294 ?auto_24295 ) ) ( AVAILABLE ?auto_24297 ) ( ON ?auto_24294 ?auto_24298 ) ( not ( = ?auto_24298 ?auto_24294 ) ) ( not ( = ?auto_24298 ?auto_24295 ) ) ( not ( = ?auto_24302 ?auto_24301 ) ) ( HOIST-AT ?auto_24300 ?auto_24302 ) ( not ( = ?auto_24297 ?auto_24300 ) ) ( AVAILABLE ?auto_24300 ) ( SURFACE-AT ?auto_24295 ?auto_24302 ) ( ON ?auto_24295 ?auto_24296 ) ( CLEAR ?auto_24295 ) ( not ( = ?auto_24294 ?auto_24296 ) ) ( not ( = ?auto_24295 ?auto_24296 ) ) ( not ( = ?auto_24298 ?auto_24296 ) ) ( TRUCK-AT ?auto_24299 ?auto_24301 ) )
    :subtasks
    ( ( !DRIVE ?auto_24299 ?auto_24301 ?auto_24302 )
      ( MAKE-2CRATE ?auto_24298 ?auto_24294 ?auto_24295 )
      ( MAKE-1CRATE-VERIFY ?auto_24294 ?auto_24295 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24303 - SURFACE
      ?auto_24304 - SURFACE
      ?auto_24305 - SURFACE
    )
    :vars
    (
      ?auto_24308 - HOIST
      ?auto_24311 - PLACE
      ?auto_24306 - PLACE
      ?auto_24310 - HOIST
      ?auto_24309 - SURFACE
      ?auto_24307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24308 ?auto_24311 ) ( SURFACE-AT ?auto_24304 ?auto_24311 ) ( CLEAR ?auto_24304 ) ( IS-CRATE ?auto_24305 ) ( not ( = ?auto_24304 ?auto_24305 ) ) ( AVAILABLE ?auto_24308 ) ( ON ?auto_24304 ?auto_24303 ) ( not ( = ?auto_24303 ?auto_24304 ) ) ( not ( = ?auto_24303 ?auto_24305 ) ) ( not ( = ?auto_24306 ?auto_24311 ) ) ( HOIST-AT ?auto_24310 ?auto_24306 ) ( not ( = ?auto_24308 ?auto_24310 ) ) ( AVAILABLE ?auto_24310 ) ( SURFACE-AT ?auto_24305 ?auto_24306 ) ( ON ?auto_24305 ?auto_24309 ) ( CLEAR ?auto_24305 ) ( not ( = ?auto_24304 ?auto_24309 ) ) ( not ( = ?auto_24305 ?auto_24309 ) ) ( not ( = ?auto_24303 ?auto_24309 ) ) ( TRUCK-AT ?auto_24307 ?auto_24311 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24304 ?auto_24305 )
      ( MAKE-2CRATE-VERIFY ?auto_24303 ?auto_24304 ?auto_24305 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24312 - SURFACE
      ?auto_24313 - SURFACE
      ?auto_24314 - SURFACE
      ?auto_24315 - SURFACE
    )
    :vars
    (
      ?auto_24321 - HOIST
      ?auto_24317 - PLACE
      ?auto_24319 - PLACE
      ?auto_24320 - HOIST
      ?auto_24318 - SURFACE
      ?auto_24316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24321 ?auto_24317 ) ( SURFACE-AT ?auto_24314 ?auto_24317 ) ( CLEAR ?auto_24314 ) ( IS-CRATE ?auto_24315 ) ( not ( = ?auto_24314 ?auto_24315 ) ) ( AVAILABLE ?auto_24321 ) ( ON ?auto_24314 ?auto_24313 ) ( not ( = ?auto_24313 ?auto_24314 ) ) ( not ( = ?auto_24313 ?auto_24315 ) ) ( not ( = ?auto_24319 ?auto_24317 ) ) ( HOIST-AT ?auto_24320 ?auto_24319 ) ( not ( = ?auto_24321 ?auto_24320 ) ) ( AVAILABLE ?auto_24320 ) ( SURFACE-AT ?auto_24315 ?auto_24319 ) ( ON ?auto_24315 ?auto_24318 ) ( CLEAR ?auto_24315 ) ( not ( = ?auto_24314 ?auto_24318 ) ) ( not ( = ?auto_24315 ?auto_24318 ) ) ( not ( = ?auto_24313 ?auto_24318 ) ) ( TRUCK-AT ?auto_24316 ?auto_24317 ) ( ON ?auto_24313 ?auto_24312 ) ( not ( = ?auto_24312 ?auto_24313 ) ) ( not ( = ?auto_24312 ?auto_24314 ) ) ( not ( = ?auto_24312 ?auto_24315 ) ) ( not ( = ?auto_24312 ?auto_24318 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24313 ?auto_24314 ?auto_24315 )
      ( MAKE-3CRATE-VERIFY ?auto_24312 ?auto_24313 ?auto_24314 ?auto_24315 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24322 - SURFACE
      ?auto_24323 - SURFACE
    )
    :vars
    (
      ?auto_24330 - HOIST
      ?auto_24325 - PLACE
      ?auto_24327 - SURFACE
      ?auto_24328 - PLACE
      ?auto_24329 - HOIST
      ?auto_24326 - SURFACE
      ?auto_24324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24330 ?auto_24325 ) ( IS-CRATE ?auto_24323 ) ( not ( = ?auto_24322 ?auto_24323 ) ) ( not ( = ?auto_24327 ?auto_24322 ) ) ( not ( = ?auto_24327 ?auto_24323 ) ) ( not ( = ?auto_24328 ?auto_24325 ) ) ( HOIST-AT ?auto_24329 ?auto_24328 ) ( not ( = ?auto_24330 ?auto_24329 ) ) ( AVAILABLE ?auto_24329 ) ( SURFACE-AT ?auto_24323 ?auto_24328 ) ( ON ?auto_24323 ?auto_24326 ) ( CLEAR ?auto_24323 ) ( not ( = ?auto_24322 ?auto_24326 ) ) ( not ( = ?auto_24323 ?auto_24326 ) ) ( not ( = ?auto_24327 ?auto_24326 ) ) ( TRUCK-AT ?auto_24324 ?auto_24325 ) ( SURFACE-AT ?auto_24327 ?auto_24325 ) ( CLEAR ?auto_24327 ) ( LIFTING ?auto_24330 ?auto_24322 ) ( IS-CRATE ?auto_24322 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24327 ?auto_24322 )
      ( MAKE-2CRATE ?auto_24327 ?auto_24322 ?auto_24323 )
      ( MAKE-1CRATE-VERIFY ?auto_24322 ?auto_24323 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24331 - SURFACE
      ?auto_24332 - SURFACE
      ?auto_24333 - SURFACE
    )
    :vars
    (
      ?auto_24334 - HOIST
      ?auto_24338 - PLACE
      ?auto_24337 - PLACE
      ?auto_24339 - HOIST
      ?auto_24336 - SURFACE
      ?auto_24335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24334 ?auto_24338 ) ( IS-CRATE ?auto_24333 ) ( not ( = ?auto_24332 ?auto_24333 ) ) ( not ( = ?auto_24331 ?auto_24332 ) ) ( not ( = ?auto_24331 ?auto_24333 ) ) ( not ( = ?auto_24337 ?auto_24338 ) ) ( HOIST-AT ?auto_24339 ?auto_24337 ) ( not ( = ?auto_24334 ?auto_24339 ) ) ( AVAILABLE ?auto_24339 ) ( SURFACE-AT ?auto_24333 ?auto_24337 ) ( ON ?auto_24333 ?auto_24336 ) ( CLEAR ?auto_24333 ) ( not ( = ?auto_24332 ?auto_24336 ) ) ( not ( = ?auto_24333 ?auto_24336 ) ) ( not ( = ?auto_24331 ?auto_24336 ) ) ( TRUCK-AT ?auto_24335 ?auto_24338 ) ( SURFACE-AT ?auto_24331 ?auto_24338 ) ( CLEAR ?auto_24331 ) ( LIFTING ?auto_24334 ?auto_24332 ) ( IS-CRATE ?auto_24332 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24332 ?auto_24333 )
      ( MAKE-2CRATE-VERIFY ?auto_24331 ?auto_24332 ?auto_24333 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24340 - SURFACE
      ?auto_24341 - SURFACE
      ?auto_24342 - SURFACE
      ?auto_24343 - SURFACE
    )
    :vars
    (
      ?auto_24345 - HOIST
      ?auto_24346 - PLACE
      ?auto_24344 - PLACE
      ?auto_24347 - HOIST
      ?auto_24349 - SURFACE
      ?auto_24348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24345 ?auto_24346 ) ( IS-CRATE ?auto_24343 ) ( not ( = ?auto_24342 ?auto_24343 ) ) ( not ( = ?auto_24341 ?auto_24342 ) ) ( not ( = ?auto_24341 ?auto_24343 ) ) ( not ( = ?auto_24344 ?auto_24346 ) ) ( HOIST-AT ?auto_24347 ?auto_24344 ) ( not ( = ?auto_24345 ?auto_24347 ) ) ( AVAILABLE ?auto_24347 ) ( SURFACE-AT ?auto_24343 ?auto_24344 ) ( ON ?auto_24343 ?auto_24349 ) ( CLEAR ?auto_24343 ) ( not ( = ?auto_24342 ?auto_24349 ) ) ( not ( = ?auto_24343 ?auto_24349 ) ) ( not ( = ?auto_24341 ?auto_24349 ) ) ( TRUCK-AT ?auto_24348 ?auto_24346 ) ( SURFACE-AT ?auto_24341 ?auto_24346 ) ( CLEAR ?auto_24341 ) ( LIFTING ?auto_24345 ?auto_24342 ) ( IS-CRATE ?auto_24342 ) ( ON ?auto_24341 ?auto_24340 ) ( not ( = ?auto_24340 ?auto_24341 ) ) ( not ( = ?auto_24340 ?auto_24342 ) ) ( not ( = ?auto_24340 ?auto_24343 ) ) ( not ( = ?auto_24340 ?auto_24349 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24341 ?auto_24342 ?auto_24343 )
      ( MAKE-3CRATE-VERIFY ?auto_24340 ?auto_24341 ?auto_24342 ?auto_24343 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24350 - SURFACE
      ?auto_24351 - SURFACE
    )
    :vars
    (
      ?auto_24354 - HOIST
      ?auto_24355 - PLACE
      ?auto_24352 - SURFACE
      ?auto_24353 - PLACE
      ?auto_24356 - HOIST
      ?auto_24358 - SURFACE
      ?auto_24357 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24354 ?auto_24355 ) ( IS-CRATE ?auto_24351 ) ( not ( = ?auto_24350 ?auto_24351 ) ) ( not ( = ?auto_24352 ?auto_24350 ) ) ( not ( = ?auto_24352 ?auto_24351 ) ) ( not ( = ?auto_24353 ?auto_24355 ) ) ( HOIST-AT ?auto_24356 ?auto_24353 ) ( not ( = ?auto_24354 ?auto_24356 ) ) ( AVAILABLE ?auto_24356 ) ( SURFACE-AT ?auto_24351 ?auto_24353 ) ( ON ?auto_24351 ?auto_24358 ) ( CLEAR ?auto_24351 ) ( not ( = ?auto_24350 ?auto_24358 ) ) ( not ( = ?auto_24351 ?auto_24358 ) ) ( not ( = ?auto_24352 ?auto_24358 ) ) ( TRUCK-AT ?auto_24357 ?auto_24355 ) ( SURFACE-AT ?auto_24352 ?auto_24355 ) ( CLEAR ?auto_24352 ) ( IS-CRATE ?auto_24350 ) ( AVAILABLE ?auto_24354 ) ( IN ?auto_24350 ?auto_24357 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24354 ?auto_24350 ?auto_24357 ?auto_24355 )
      ( MAKE-2CRATE ?auto_24352 ?auto_24350 ?auto_24351 )
      ( MAKE-1CRATE-VERIFY ?auto_24350 ?auto_24351 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24359 - SURFACE
      ?auto_24360 - SURFACE
      ?auto_24361 - SURFACE
    )
    :vars
    (
      ?auto_24362 - HOIST
      ?auto_24363 - PLACE
      ?auto_24366 - PLACE
      ?auto_24364 - HOIST
      ?auto_24365 - SURFACE
      ?auto_24367 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24362 ?auto_24363 ) ( IS-CRATE ?auto_24361 ) ( not ( = ?auto_24360 ?auto_24361 ) ) ( not ( = ?auto_24359 ?auto_24360 ) ) ( not ( = ?auto_24359 ?auto_24361 ) ) ( not ( = ?auto_24366 ?auto_24363 ) ) ( HOIST-AT ?auto_24364 ?auto_24366 ) ( not ( = ?auto_24362 ?auto_24364 ) ) ( AVAILABLE ?auto_24364 ) ( SURFACE-AT ?auto_24361 ?auto_24366 ) ( ON ?auto_24361 ?auto_24365 ) ( CLEAR ?auto_24361 ) ( not ( = ?auto_24360 ?auto_24365 ) ) ( not ( = ?auto_24361 ?auto_24365 ) ) ( not ( = ?auto_24359 ?auto_24365 ) ) ( TRUCK-AT ?auto_24367 ?auto_24363 ) ( SURFACE-AT ?auto_24359 ?auto_24363 ) ( CLEAR ?auto_24359 ) ( IS-CRATE ?auto_24360 ) ( AVAILABLE ?auto_24362 ) ( IN ?auto_24360 ?auto_24367 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24360 ?auto_24361 )
      ( MAKE-2CRATE-VERIFY ?auto_24359 ?auto_24360 ?auto_24361 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24368 - SURFACE
      ?auto_24369 - SURFACE
      ?auto_24370 - SURFACE
      ?auto_24371 - SURFACE
    )
    :vars
    (
      ?auto_24376 - HOIST
      ?auto_24374 - PLACE
      ?auto_24372 - PLACE
      ?auto_24377 - HOIST
      ?auto_24375 - SURFACE
      ?auto_24373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24376 ?auto_24374 ) ( IS-CRATE ?auto_24371 ) ( not ( = ?auto_24370 ?auto_24371 ) ) ( not ( = ?auto_24369 ?auto_24370 ) ) ( not ( = ?auto_24369 ?auto_24371 ) ) ( not ( = ?auto_24372 ?auto_24374 ) ) ( HOIST-AT ?auto_24377 ?auto_24372 ) ( not ( = ?auto_24376 ?auto_24377 ) ) ( AVAILABLE ?auto_24377 ) ( SURFACE-AT ?auto_24371 ?auto_24372 ) ( ON ?auto_24371 ?auto_24375 ) ( CLEAR ?auto_24371 ) ( not ( = ?auto_24370 ?auto_24375 ) ) ( not ( = ?auto_24371 ?auto_24375 ) ) ( not ( = ?auto_24369 ?auto_24375 ) ) ( TRUCK-AT ?auto_24373 ?auto_24374 ) ( SURFACE-AT ?auto_24369 ?auto_24374 ) ( CLEAR ?auto_24369 ) ( IS-CRATE ?auto_24370 ) ( AVAILABLE ?auto_24376 ) ( IN ?auto_24370 ?auto_24373 ) ( ON ?auto_24369 ?auto_24368 ) ( not ( = ?auto_24368 ?auto_24369 ) ) ( not ( = ?auto_24368 ?auto_24370 ) ) ( not ( = ?auto_24368 ?auto_24371 ) ) ( not ( = ?auto_24368 ?auto_24375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24369 ?auto_24370 ?auto_24371 )
      ( MAKE-3CRATE-VERIFY ?auto_24368 ?auto_24369 ?auto_24370 ?auto_24371 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24378 - SURFACE
      ?auto_24379 - SURFACE
    )
    :vars
    (
      ?auto_24385 - HOIST
      ?auto_24383 - PLACE
      ?auto_24380 - SURFACE
      ?auto_24381 - PLACE
      ?auto_24386 - HOIST
      ?auto_24384 - SURFACE
      ?auto_24382 - TRUCK
      ?auto_24387 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24385 ?auto_24383 ) ( IS-CRATE ?auto_24379 ) ( not ( = ?auto_24378 ?auto_24379 ) ) ( not ( = ?auto_24380 ?auto_24378 ) ) ( not ( = ?auto_24380 ?auto_24379 ) ) ( not ( = ?auto_24381 ?auto_24383 ) ) ( HOIST-AT ?auto_24386 ?auto_24381 ) ( not ( = ?auto_24385 ?auto_24386 ) ) ( AVAILABLE ?auto_24386 ) ( SURFACE-AT ?auto_24379 ?auto_24381 ) ( ON ?auto_24379 ?auto_24384 ) ( CLEAR ?auto_24379 ) ( not ( = ?auto_24378 ?auto_24384 ) ) ( not ( = ?auto_24379 ?auto_24384 ) ) ( not ( = ?auto_24380 ?auto_24384 ) ) ( SURFACE-AT ?auto_24380 ?auto_24383 ) ( CLEAR ?auto_24380 ) ( IS-CRATE ?auto_24378 ) ( AVAILABLE ?auto_24385 ) ( IN ?auto_24378 ?auto_24382 ) ( TRUCK-AT ?auto_24382 ?auto_24387 ) ( not ( = ?auto_24387 ?auto_24383 ) ) ( not ( = ?auto_24381 ?auto_24387 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24382 ?auto_24387 ?auto_24383 )
      ( MAKE-2CRATE ?auto_24380 ?auto_24378 ?auto_24379 )
      ( MAKE-1CRATE-VERIFY ?auto_24378 ?auto_24379 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24388 - SURFACE
      ?auto_24389 - SURFACE
      ?auto_24390 - SURFACE
    )
    :vars
    (
      ?auto_24393 - HOIST
      ?auto_24392 - PLACE
      ?auto_24396 - PLACE
      ?auto_24397 - HOIST
      ?auto_24394 - SURFACE
      ?auto_24391 - TRUCK
      ?auto_24395 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24393 ?auto_24392 ) ( IS-CRATE ?auto_24390 ) ( not ( = ?auto_24389 ?auto_24390 ) ) ( not ( = ?auto_24388 ?auto_24389 ) ) ( not ( = ?auto_24388 ?auto_24390 ) ) ( not ( = ?auto_24396 ?auto_24392 ) ) ( HOIST-AT ?auto_24397 ?auto_24396 ) ( not ( = ?auto_24393 ?auto_24397 ) ) ( AVAILABLE ?auto_24397 ) ( SURFACE-AT ?auto_24390 ?auto_24396 ) ( ON ?auto_24390 ?auto_24394 ) ( CLEAR ?auto_24390 ) ( not ( = ?auto_24389 ?auto_24394 ) ) ( not ( = ?auto_24390 ?auto_24394 ) ) ( not ( = ?auto_24388 ?auto_24394 ) ) ( SURFACE-AT ?auto_24388 ?auto_24392 ) ( CLEAR ?auto_24388 ) ( IS-CRATE ?auto_24389 ) ( AVAILABLE ?auto_24393 ) ( IN ?auto_24389 ?auto_24391 ) ( TRUCK-AT ?auto_24391 ?auto_24395 ) ( not ( = ?auto_24395 ?auto_24392 ) ) ( not ( = ?auto_24396 ?auto_24395 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24389 ?auto_24390 )
      ( MAKE-2CRATE-VERIFY ?auto_24388 ?auto_24389 ?auto_24390 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24398 - SURFACE
      ?auto_24399 - SURFACE
      ?auto_24400 - SURFACE
      ?auto_24401 - SURFACE
    )
    :vars
    (
      ?auto_24402 - HOIST
      ?auto_24405 - PLACE
      ?auto_24406 - PLACE
      ?auto_24407 - HOIST
      ?auto_24403 - SURFACE
      ?auto_24408 - TRUCK
      ?auto_24404 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24402 ?auto_24405 ) ( IS-CRATE ?auto_24401 ) ( not ( = ?auto_24400 ?auto_24401 ) ) ( not ( = ?auto_24399 ?auto_24400 ) ) ( not ( = ?auto_24399 ?auto_24401 ) ) ( not ( = ?auto_24406 ?auto_24405 ) ) ( HOIST-AT ?auto_24407 ?auto_24406 ) ( not ( = ?auto_24402 ?auto_24407 ) ) ( AVAILABLE ?auto_24407 ) ( SURFACE-AT ?auto_24401 ?auto_24406 ) ( ON ?auto_24401 ?auto_24403 ) ( CLEAR ?auto_24401 ) ( not ( = ?auto_24400 ?auto_24403 ) ) ( not ( = ?auto_24401 ?auto_24403 ) ) ( not ( = ?auto_24399 ?auto_24403 ) ) ( SURFACE-AT ?auto_24399 ?auto_24405 ) ( CLEAR ?auto_24399 ) ( IS-CRATE ?auto_24400 ) ( AVAILABLE ?auto_24402 ) ( IN ?auto_24400 ?auto_24408 ) ( TRUCK-AT ?auto_24408 ?auto_24404 ) ( not ( = ?auto_24404 ?auto_24405 ) ) ( not ( = ?auto_24406 ?auto_24404 ) ) ( ON ?auto_24399 ?auto_24398 ) ( not ( = ?auto_24398 ?auto_24399 ) ) ( not ( = ?auto_24398 ?auto_24400 ) ) ( not ( = ?auto_24398 ?auto_24401 ) ) ( not ( = ?auto_24398 ?auto_24403 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24399 ?auto_24400 ?auto_24401 )
      ( MAKE-3CRATE-VERIFY ?auto_24398 ?auto_24399 ?auto_24400 ?auto_24401 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24409 - SURFACE
      ?auto_24410 - SURFACE
    )
    :vars
    (
      ?auto_24411 - HOIST
      ?auto_24414 - PLACE
      ?auto_24417 - SURFACE
      ?auto_24415 - PLACE
      ?auto_24416 - HOIST
      ?auto_24412 - SURFACE
      ?auto_24418 - TRUCK
      ?auto_24413 - PLACE
      ?auto_24419 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24411 ?auto_24414 ) ( IS-CRATE ?auto_24410 ) ( not ( = ?auto_24409 ?auto_24410 ) ) ( not ( = ?auto_24417 ?auto_24409 ) ) ( not ( = ?auto_24417 ?auto_24410 ) ) ( not ( = ?auto_24415 ?auto_24414 ) ) ( HOIST-AT ?auto_24416 ?auto_24415 ) ( not ( = ?auto_24411 ?auto_24416 ) ) ( AVAILABLE ?auto_24416 ) ( SURFACE-AT ?auto_24410 ?auto_24415 ) ( ON ?auto_24410 ?auto_24412 ) ( CLEAR ?auto_24410 ) ( not ( = ?auto_24409 ?auto_24412 ) ) ( not ( = ?auto_24410 ?auto_24412 ) ) ( not ( = ?auto_24417 ?auto_24412 ) ) ( SURFACE-AT ?auto_24417 ?auto_24414 ) ( CLEAR ?auto_24417 ) ( IS-CRATE ?auto_24409 ) ( AVAILABLE ?auto_24411 ) ( TRUCK-AT ?auto_24418 ?auto_24413 ) ( not ( = ?auto_24413 ?auto_24414 ) ) ( not ( = ?auto_24415 ?auto_24413 ) ) ( HOIST-AT ?auto_24419 ?auto_24413 ) ( LIFTING ?auto_24419 ?auto_24409 ) ( not ( = ?auto_24411 ?auto_24419 ) ) ( not ( = ?auto_24416 ?auto_24419 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24419 ?auto_24409 ?auto_24418 ?auto_24413 )
      ( MAKE-2CRATE ?auto_24417 ?auto_24409 ?auto_24410 )
      ( MAKE-1CRATE-VERIFY ?auto_24409 ?auto_24410 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24420 - SURFACE
      ?auto_24421 - SURFACE
      ?auto_24422 - SURFACE
    )
    :vars
    (
      ?auto_24428 - HOIST
      ?auto_24423 - PLACE
      ?auto_24430 - PLACE
      ?auto_24427 - HOIST
      ?auto_24425 - SURFACE
      ?auto_24429 - TRUCK
      ?auto_24426 - PLACE
      ?auto_24424 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24428 ?auto_24423 ) ( IS-CRATE ?auto_24422 ) ( not ( = ?auto_24421 ?auto_24422 ) ) ( not ( = ?auto_24420 ?auto_24421 ) ) ( not ( = ?auto_24420 ?auto_24422 ) ) ( not ( = ?auto_24430 ?auto_24423 ) ) ( HOIST-AT ?auto_24427 ?auto_24430 ) ( not ( = ?auto_24428 ?auto_24427 ) ) ( AVAILABLE ?auto_24427 ) ( SURFACE-AT ?auto_24422 ?auto_24430 ) ( ON ?auto_24422 ?auto_24425 ) ( CLEAR ?auto_24422 ) ( not ( = ?auto_24421 ?auto_24425 ) ) ( not ( = ?auto_24422 ?auto_24425 ) ) ( not ( = ?auto_24420 ?auto_24425 ) ) ( SURFACE-AT ?auto_24420 ?auto_24423 ) ( CLEAR ?auto_24420 ) ( IS-CRATE ?auto_24421 ) ( AVAILABLE ?auto_24428 ) ( TRUCK-AT ?auto_24429 ?auto_24426 ) ( not ( = ?auto_24426 ?auto_24423 ) ) ( not ( = ?auto_24430 ?auto_24426 ) ) ( HOIST-AT ?auto_24424 ?auto_24426 ) ( LIFTING ?auto_24424 ?auto_24421 ) ( not ( = ?auto_24428 ?auto_24424 ) ) ( not ( = ?auto_24427 ?auto_24424 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24421 ?auto_24422 )
      ( MAKE-2CRATE-VERIFY ?auto_24420 ?auto_24421 ?auto_24422 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24431 - SURFACE
      ?auto_24432 - SURFACE
      ?auto_24433 - SURFACE
      ?auto_24434 - SURFACE
    )
    :vars
    (
      ?auto_24441 - HOIST
      ?auto_24442 - PLACE
      ?auto_24436 - PLACE
      ?auto_24438 - HOIST
      ?auto_24440 - SURFACE
      ?auto_24439 - TRUCK
      ?auto_24435 - PLACE
      ?auto_24437 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24441 ?auto_24442 ) ( IS-CRATE ?auto_24434 ) ( not ( = ?auto_24433 ?auto_24434 ) ) ( not ( = ?auto_24432 ?auto_24433 ) ) ( not ( = ?auto_24432 ?auto_24434 ) ) ( not ( = ?auto_24436 ?auto_24442 ) ) ( HOIST-AT ?auto_24438 ?auto_24436 ) ( not ( = ?auto_24441 ?auto_24438 ) ) ( AVAILABLE ?auto_24438 ) ( SURFACE-AT ?auto_24434 ?auto_24436 ) ( ON ?auto_24434 ?auto_24440 ) ( CLEAR ?auto_24434 ) ( not ( = ?auto_24433 ?auto_24440 ) ) ( not ( = ?auto_24434 ?auto_24440 ) ) ( not ( = ?auto_24432 ?auto_24440 ) ) ( SURFACE-AT ?auto_24432 ?auto_24442 ) ( CLEAR ?auto_24432 ) ( IS-CRATE ?auto_24433 ) ( AVAILABLE ?auto_24441 ) ( TRUCK-AT ?auto_24439 ?auto_24435 ) ( not ( = ?auto_24435 ?auto_24442 ) ) ( not ( = ?auto_24436 ?auto_24435 ) ) ( HOIST-AT ?auto_24437 ?auto_24435 ) ( LIFTING ?auto_24437 ?auto_24433 ) ( not ( = ?auto_24441 ?auto_24437 ) ) ( not ( = ?auto_24438 ?auto_24437 ) ) ( ON ?auto_24432 ?auto_24431 ) ( not ( = ?auto_24431 ?auto_24432 ) ) ( not ( = ?auto_24431 ?auto_24433 ) ) ( not ( = ?auto_24431 ?auto_24434 ) ) ( not ( = ?auto_24431 ?auto_24440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24432 ?auto_24433 ?auto_24434 )
      ( MAKE-3CRATE-VERIFY ?auto_24431 ?auto_24432 ?auto_24433 ?auto_24434 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24443 - SURFACE
      ?auto_24444 - SURFACE
    )
    :vars
    (
      ?auto_24452 - HOIST
      ?auto_24453 - PLACE
      ?auto_24450 - SURFACE
      ?auto_24446 - PLACE
      ?auto_24448 - HOIST
      ?auto_24451 - SURFACE
      ?auto_24449 - TRUCK
      ?auto_24445 - PLACE
      ?auto_24447 - HOIST
      ?auto_24454 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24452 ?auto_24453 ) ( IS-CRATE ?auto_24444 ) ( not ( = ?auto_24443 ?auto_24444 ) ) ( not ( = ?auto_24450 ?auto_24443 ) ) ( not ( = ?auto_24450 ?auto_24444 ) ) ( not ( = ?auto_24446 ?auto_24453 ) ) ( HOIST-AT ?auto_24448 ?auto_24446 ) ( not ( = ?auto_24452 ?auto_24448 ) ) ( AVAILABLE ?auto_24448 ) ( SURFACE-AT ?auto_24444 ?auto_24446 ) ( ON ?auto_24444 ?auto_24451 ) ( CLEAR ?auto_24444 ) ( not ( = ?auto_24443 ?auto_24451 ) ) ( not ( = ?auto_24444 ?auto_24451 ) ) ( not ( = ?auto_24450 ?auto_24451 ) ) ( SURFACE-AT ?auto_24450 ?auto_24453 ) ( CLEAR ?auto_24450 ) ( IS-CRATE ?auto_24443 ) ( AVAILABLE ?auto_24452 ) ( TRUCK-AT ?auto_24449 ?auto_24445 ) ( not ( = ?auto_24445 ?auto_24453 ) ) ( not ( = ?auto_24446 ?auto_24445 ) ) ( HOIST-AT ?auto_24447 ?auto_24445 ) ( not ( = ?auto_24452 ?auto_24447 ) ) ( not ( = ?auto_24448 ?auto_24447 ) ) ( AVAILABLE ?auto_24447 ) ( SURFACE-AT ?auto_24443 ?auto_24445 ) ( ON ?auto_24443 ?auto_24454 ) ( CLEAR ?auto_24443 ) ( not ( = ?auto_24443 ?auto_24454 ) ) ( not ( = ?auto_24444 ?auto_24454 ) ) ( not ( = ?auto_24450 ?auto_24454 ) ) ( not ( = ?auto_24451 ?auto_24454 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24447 ?auto_24443 ?auto_24454 ?auto_24445 )
      ( MAKE-2CRATE ?auto_24450 ?auto_24443 ?auto_24444 )
      ( MAKE-1CRATE-VERIFY ?auto_24443 ?auto_24444 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24455 - SURFACE
      ?auto_24456 - SURFACE
      ?auto_24457 - SURFACE
    )
    :vars
    (
      ?auto_24461 - HOIST
      ?auto_24463 - PLACE
      ?auto_24462 - PLACE
      ?auto_24460 - HOIST
      ?auto_24459 - SURFACE
      ?auto_24464 - TRUCK
      ?auto_24458 - PLACE
      ?auto_24465 - HOIST
      ?auto_24466 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24461 ?auto_24463 ) ( IS-CRATE ?auto_24457 ) ( not ( = ?auto_24456 ?auto_24457 ) ) ( not ( = ?auto_24455 ?auto_24456 ) ) ( not ( = ?auto_24455 ?auto_24457 ) ) ( not ( = ?auto_24462 ?auto_24463 ) ) ( HOIST-AT ?auto_24460 ?auto_24462 ) ( not ( = ?auto_24461 ?auto_24460 ) ) ( AVAILABLE ?auto_24460 ) ( SURFACE-AT ?auto_24457 ?auto_24462 ) ( ON ?auto_24457 ?auto_24459 ) ( CLEAR ?auto_24457 ) ( not ( = ?auto_24456 ?auto_24459 ) ) ( not ( = ?auto_24457 ?auto_24459 ) ) ( not ( = ?auto_24455 ?auto_24459 ) ) ( SURFACE-AT ?auto_24455 ?auto_24463 ) ( CLEAR ?auto_24455 ) ( IS-CRATE ?auto_24456 ) ( AVAILABLE ?auto_24461 ) ( TRUCK-AT ?auto_24464 ?auto_24458 ) ( not ( = ?auto_24458 ?auto_24463 ) ) ( not ( = ?auto_24462 ?auto_24458 ) ) ( HOIST-AT ?auto_24465 ?auto_24458 ) ( not ( = ?auto_24461 ?auto_24465 ) ) ( not ( = ?auto_24460 ?auto_24465 ) ) ( AVAILABLE ?auto_24465 ) ( SURFACE-AT ?auto_24456 ?auto_24458 ) ( ON ?auto_24456 ?auto_24466 ) ( CLEAR ?auto_24456 ) ( not ( = ?auto_24456 ?auto_24466 ) ) ( not ( = ?auto_24457 ?auto_24466 ) ) ( not ( = ?auto_24455 ?auto_24466 ) ) ( not ( = ?auto_24459 ?auto_24466 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24456 ?auto_24457 )
      ( MAKE-2CRATE-VERIFY ?auto_24455 ?auto_24456 ?auto_24457 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24467 - SURFACE
      ?auto_24468 - SURFACE
      ?auto_24469 - SURFACE
      ?auto_24470 - SURFACE
    )
    :vars
    (
      ?auto_24476 - HOIST
      ?auto_24474 - PLACE
      ?auto_24471 - PLACE
      ?auto_24478 - HOIST
      ?auto_24477 - SURFACE
      ?auto_24473 - TRUCK
      ?auto_24475 - PLACE
      ?auto_24479 - HOIST
      ?auto_24472 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24476 ?auto_24474 ) ( IS-CRATE ?auto_24470 ) ( not ( = ?auto_24469 ?auto_24470 ) ) ( not ( = ?auto_24468 ?auto_24469 ) ) ( not ( = ?auto_24468 ?auto_24470 ) ) ( not ( = ?auto_24471 ?auto_24474 ) ) ( HOIST-AT ?auto_24478 ?auto_24471 ) ( not ( = ?auto_24476 ?auto_24478 ) ) ( AVAILABLE ?auto_24478 ) ( SURFACE-AT ?auto_24470 ?auto_24471 ) ( ON ?auto_24470 ?auto_24477 ) ( CLEAR ?auto_24470 ) ( not ( = ?auto_24469 ?auto_24477 ) ) ( not ( = ?auto_24470 ?auto_24477 ) ) ( not ( = ?auto_24468 ?auto_24477 ) ) ( SURFACE-AT ?auto_24468 ?auto_24474 ) ( CLEAR ?auto_24468 ) ( IS-CRATE ?auto_24469 ) ( AVAILABLE ?auto_24476 ) ( TRUCK-AT ?auto_24473 ?auto_24475 ) ( not ( = ?auto_24475 ?auto_24474 ) ) ( not ( = ?auto_24471 ?auto_24475 ) ) ( HOIST-AT ?auto_24479 ?auto_24475 ) ( not ( = ?auto_24476 ?auto_24479 ) ) ( not ( = ?auto_24478 ?auto_24479 ) ) ( AVAILABLE ?auto_24479 ) ( SURFACE-AT ?auto_24469 ?auto_24475 ) ( ON ?auto_24469 ?auto_24472 ) ( CLEAR ?auto_24469 ) ( not ( = ?auto_24469 ?auto_24472 ) ) ( not ( = ?auto_24470 ?auto_24472 ) ) ( not ( = ?auto_24468 ?auto_24472 ) ) ( not ( = ?auto_24477 ?auto_24472 ) ) ( ON ?auto_24468 ?auto_24467 ) ( not ( = ?auto_24467 ?auto_24468 ) ) ( not ( = ?auto_24467 ?auto_24469 ) ) ( not ( = ?auto_24467 ?auto_24470 ) ) ( not ( = ?auto_24467 ?auto_24477 ) ) ( not ( = ?auto_24467 ?auto_24472 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24468 ?auto_24469 ?auto_24470 )
      ( MAKE-3CRATE-VERIFY ?auto_24467 ?auto_24468 ?auto_24469 ?auto_24470 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24480 - SURFACE
      ?auto_24481 - SURFACE
    )
    :vars
    (
      ?auto_24487 - HOIST
      ?auto_24485 - PLACE
      ?auto_24489 - SURFACE
      ?auto_24482 - PLACE
      ?auto_24490 - HOIST
      ?auto_24488 - SURFACE
      ?auto_24486 - PLACE
      ?auto_24491 - HOIST
      ?auto_24483 - SURFACE
      ?auto_24484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24487 ?auto_24485 ) ( IS-CRATE ?auto_24481 ) ( not ( = ?auto_24480 ?auto_24481 ) ) ( not ( = ?auto_24489 ?auto_24480 ) ) ( not ( = ?auto_24489 ?auto_24481 ) ) ( not ( = ?auto_24482 ?auto_24485 ) ) ( HOIST-AT ?auto_24490 ?auto_24482 ) ( not ( = ?auto_24487 ?auto_24490 ) ) ( AVAILABLE ?auto_24490 ) ( SURFACE-AT ?auto_24481 ?auto_24482 ) ( ON ?auto_24481 ?auto_24488 ) ( CLEAR ?auto_24481 ) ( not ( = ?auto_24480 ?auto_24488 ) ) ( not ( = ?auto_24481 ?auto_24488 ) ) ( not ( = ?auto_24489 ?auto_24488 ) ) ( SURFACE-AT ?auto_24489 ?auto_24485 ) ( CLEAR ?auto_24489 ) ( IS-CRATE ?auto_24480 ) ( AVAILABLE ?auto_24487 ) ( not ( = ?auto_24486 ?auto_24485 ) ) ( not ( = ?auto_24482 ?auto_24486 ) ) ( HOIST-AT ?auto_24491 ?auto_24486 ) ( not ( = ?auto_24487 ?auto_24491 ) ) ( not ( = ?auto_24490 ?auto_24491 ) ) ( AVAILABLE ?auto_24491 ) ( SURFACE-AT ?auto_24480 ?auto_24486 ) ( ON ?auto_24480 ?auto_24483 ) ( CLEAR ?auto_24480 ) ( not ( = ?auto_24480 ?auto_24483 ) ) ( not ( = ?auto_24481 ?auto_24483 ) ) ( not ( = ?auto_24489 ?auto_24483 ) ) ( not ( = ?auto_24488 ?auto_24483 ) ) ( TRUCK-AT ?auto_24484 ?auto_24485 ) )
    :subtasks
    ( ( !DRIVE ?auto_24484 ?auto_24485 ?auto_24486 )
      ( MAKE-2CRATE ?auto_24489 ?auto_24480 ?auto_24481 )
      ( MAKE-1CRATE-VERIFY ?auto_24480 ?auto_24481 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24492 - SURFACE
      ?auto_24493 - SURFACE
      ?auto_24494 - SURFACE
    )
    :vars
    (
      ?auto_24495 - HOIST
      ?auto_24500 - PLACE
      ?auto_24498 - PLACE
      ?auto_24496 - HOIST
      ?auto_24503 - SURFACE
      ?auto_24502 - PLACE
      ?auto_24497 - HOIST
      ?auto_24499 - SURFACE
      ?auto_24501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24495 ?auto_24500 ) ( IS-CRATE ?auto_24494 ) ( not ( = ?auto_24493 ?auto_24494 ) ) ( not ( = ?auto_24492 ?auto_24493 ) ) ( not ( = ?auto_24492 ?auto_24494 ) ) ( not ( = ?auto_24498 ?auto_24500 ) ) ( HOIST-AT ?auto_24496 ?auto_24498 ) ( not ( = ?auto_24495 ?auto_24496 ) ) ( AVAILABLE ?auto_24496 ) ( SURFACE-AT ?auto_24494 ?auto_24498 ) ( ON ?auto_24494 ?auto_24503 ) ( CLEAR ?auto_24494 ) ( not ( = ?auto_24493 ?auto_24503 ) ) ( not ( = ?auto_24494 ?auto_24503 ) ) ( not ( = ?auto_24492 ?auto_24503 ) ) ( SURFACE-AT ?auto_24492 ?auto_24500 ) ( CLEAR ?auto_24492 ) ( IS-CRATE ?auto_24493 ) ( AVAILABLE ?auto_24495 ) ( not ( = ?auto_24502 ?auto_24500 ) ) ( not ( = ?auto_24498 ?auto_24502 ) ) ( HOIST-AT ?auto_24497 ?auto_24502 ) ( not ( = ?auto_24495 ?auto_24497 ) ) ( not ( = ?auto_24496 ?auto_24497 ) ) ( AVAILABLE ?auto_24497 ) ( SURFACE-AT ?auto_24493 ?auto_24502 ) ( ON ?auto_24493 ?auto_24499 ) ( CLEAR ?auto_24493 ) ( not ( = ?auto_24493 ?auto_24499 ) ) ( not ( = ?auto_24494 ?auto_24499 ) ) ( not ( = ?auto_24492 ?auto_24499 ) ) ( not ( = ?auto_24503 ?auto_24499 ) ) ( TRUCK-AT ?auto_24501 ?auto_24500 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24493 ?auto_24494 )
      ( MAKE-2CRATE-VERIFY ?auto_24492 ?auto_24493 ?auto_24494 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24504 - SURFACE
      ?auto_24505 - SURFACE
      ?auto_24506 - SURFACE
      ?auto_24507 - SURFACE
    )
    :vars
    (
      ?auto_24514 - HOIST
      ?auto_24516 - PLACE
      ?auto_24512 - PLACE
      ?auto_24511 - HOIST
      ?auto_24515 - SURFACE
      ?auto_24509 - PLACE
      ?auto_24508 - HOIST
      ?auto_24513 - SURFACE
      ?auto_24510 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24514 ?auto_24516 ) ( IS-CRATE ?auto_24507 ) ( not ( = ?auto_24506 ?auto_24507 ) ) ( not ( = ?auto_24505 ?auto_24506 ) ) ( not ( = ?auto_24505 ?auto_24507 ) ) ( not ( = ?auto_24512 ?auto_24516 ) ) ( HOIST-AT ?auto_24511 ?auto_24512 ) ( not ( = ?auto_24514 ?auto_24511 ) ) ( AVAILABLE ?auto_24511 ) ( SURFACE-AT ?auto_24507 ?auto_24512 ) ( ON ?auto_24507 ?auto_24515 ) ( CLEAR ?auto_24507 ) ( not ( = ?auto_24506 ?auto_24515 ) ) ( not ( = ?auto_24507 ?auto_24515 ) ) ( not ( = ?auto_24505 ?auto_24515 ) ) ( SURFACE-AT ?auto_24505 ?auto_24516 ) ( CLEAR ?auto_24505 ) ( IS-CRATE ?auto_24506 ) ( AVAILABLE ?auto_24514 ) ( not ( = ?auto_24509 ?auto_24516 ) ) ( not ( = ?auto_24512 ?auto_24509 ) ) ( HOIST-AT ?auto_24508 ?auto_24509 ) ( not ( = ?auto_24514 ?auto_24508 ) ) ( not ( = ?auto_24511 ?auto_24508 ) ) ( AVAILABLE ?auto_24508 ) ( SURFACE-AT ?auto_24506 ?auto_24509 ) ( ON ?auto_24506 ?auto_24513 ) ( CLEAR ?auto_24506 ) ( not ( = ?auto_24506 ?auto_24513 ) ) ( not ( = ?auto_24507 ?auto_24513 ) ) ( not ( = ?auto_24505 ?auto_24513 ) ) ( not ( = ?auto_24515 ?auto_24513 ) ) ( TRUCK-AT ?auto_24510 ?auto_24516 ) ( ON ?auto_24505 ?auto_24504 ) ( not ( = ?auto_24504 ?auto_24505 ) ) ( not ( = ?auto_24504 ?auto_24506 ) ) ( not ( = ?auto_24504 ?auto_24507 ) ) ( not ( = ?auto_24504 ?auto_24515 ) ) ( not ( = ?auto_24504 ?auto_24513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24505 ?auto_24506 ?auto_24507 )
      ( MAKE-3CRATE-VERIFY ?auto_24504 ?auto_24505 ?auto_24506 ?auto_24507 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24517 - SURFACE
      ?auto_24518 - SURFACE
    )
    :vars
    (
      ?auto_24526 - HOIST
      ?auto_24528 - PLACE
      ?auto_24523 - SURFACE
      ?auto_24524 - PLACE
      ?auto_24522 - HOIST
      ?auto_24527 - SURFACE
      ?auto_24520 - PLACE
      ?auto_24519 - HOIST
      ?auto_24525 - SURFACE
      ?auto_24521 - TRUCK
      ?auto_24529 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24526 ?auto_24528 ) ( IS-CRATE ?auto_24518 ) ( not ( = ?auto_24517 ?auto_24518 ) ) ( not ( = ?auto_24523 ?auto_24517 ) ) ( not ( = ?auto_24523 ?auto_24518 ) ) ( not ( = ?auto_24524 ?auto_24528 ) ) ( HOIST-AT ?auto_24522 ?auto_24524 ) ( not ( = ?auto_24526 ?auto_24522 ) ) ( AVAILABLE ?auto_24522 ) ( SURFACE-AT ?auto_24518 ?auto_24524 ) ( ON ?auto_24518 ?auto_24527 ) ( CLEAR ?auto_24518 ) ( not ( = ?auto_24517 ?auto_24527 ) ) ( not ( = ?auto_24518 ?auto_24527 ) ) ( not ( = ?auto_24523 ?auto_24527 ) ) ( IS-CRATE ?auto_24517 ) ( not ( = ?auto_24520 ?auto_24528 ) ) ( not ( = ?auto_24524 ?auto_24520 ) ) ( HOIST-AT ?auto_24519 ?auto_24520 ) ( not ( = ?auto_24526 ?auto_24519 ) ) ( not ( = ?auto_24522 ?auto_24519 ) ) ( AVAILABLE ?auto_24519 ) ( SURFACE-AT ?auto_24517 ?auto_24520 ) ( ON ?auto_24517 ?auto_24525 ) ( CLEAR ?auto_24517 ) ( not ( = ?auto_24517 ?auto_24525 ) ) ( not ( = ?auto_24518 ?auto_24525 ) ) ( not ( = ?auto_24523 ?auto_24525 ) ) ( not ( = ?auto_24527 ?auto_24525 ) ) ( TRUCK-AT ?auto_24521 ?auto_24528 ) ( SURFACE-AT ?auto_24529 ?auto_24528 ) ( CLEAR ?auto_24529 ) ( LIFTING ?auto_24526 ?auto_24523 ) ( IS-CRATE ?auto_24523 ) ( not ( = ?auto_24529 ?auto_24523 ) ) ( not ( = ?auto_24517 ?auto_24529 ) ) ( not ( = ?auto_24518 ?auto_24529 ) ) ( not ( = ?auto_24527 ?auto_24529 ) ) ( not ( = ?auto_24525 ?auto_24529 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24529 ?auto_24523 )
      ( MAKE-2CRATE ?auto_24523 ?auto_24517 ?auto_24518 )
      ( MAKE-1CRATE-VERIFY ?auto_24517 ?auto_24518 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24530 - SURFACE
      ?auto_24531 - SURFACE
      ?auto_24532 - SURFACE
    )
    :vars
    (
      ?auto_24537 - HOIST
      ?auto_24538 - PLACE
      ?auto_24542 - PLACE
      ?auto_24533 - HOIST
      ?auto_24535 - SURFACE
      ?auto_24540 - PLACE
      ?auto_24541 - HOIST
      ?auto_24534 - SURFACE
      ?auto_24536 - TRUCK
      ?auto_24539 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24537 ?auto_24538 ) ( IS-CRATE ?auto_24532 ) ( not ( = ?auto_24531 ?auto_24532 ) ) ( not ( = ?auto_24530 ?auto_24531 ) ) ( not ( = ?auto_24530 ?auto_24532 ) ) ( not ( = ?auto_24542 ?auto_24538 ) ) ( HOIST-AT ?auto_24533 ?auto_24542 ) ( not ( = ?auto_24537 ?auto_24533 ) ) ( AVAILABLE ?auto_24533 ) ( SURFACE-AT ?auto_24532 ?auto_24542 ) ( ON ?auto_24532 ?auto_24535 ) ( CLEAR ?auto_24532 ) ( not ( = ?auto_24531 ?auto_24535 ) ) ( not ( = ?auto_24532 ?auto_24535 ) ) ( not ( = ?auto_24530 ?auto_24535 ) ) ( IS-CRATE ?auto_24531 ) ( not ( = ?auto_24540 ?auto_24538 ) ) ( not ( = ?auto_24542 ?auto_24540 ) ) ( HOIST-AT ?auto_24541 ?auto_24540 ) ( not ( = ?auto_24537 ?auto_24541 ) ) ( not ( = ?auto_24533 ?auto_24541 ) ) ( AVAILABLE ?auto_24541 ) ( SURFACE-AT ?auto_24531 ?auto_24540 ) ( ON ?auto_24531 ?auto_24534 ) ( CLEAR ?auto_24531 ) ( not ( = ?auto_24531 ?auto_24534 ) ) ( not ( = ?auto_24532 ?auto_24534 ) ) ( not ( = ?auto_24530 ?auto_24534 ) ) ( not ( = ?auto_24535 ?auto_24534 ) ) ( TRUCK-AT ?auto_24536 ?auto_24538 ) ( SURFACE-AT ?auto_24539 ?auto_24538 ) ( CLEAR ?auto_24539 ) ( LIFTING ?auto_24537 ?auto_24530 ) ( IS-CRATE ?auto_24530 ) ( not ( = ?auto_24539 ?auto_24530 ) ) ( not ( = ?auto_24531 ?auto_24539 ) ) ( not ( = ?auto_24532 ?auto_24539 ) ) ( not ( = ?auto_24535 ?auto_24539 ) ) ( not ( = ?auto_24534 ?auto_24539 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24531 ?auto_24532 )
      ( MAKE-2CRATE-VERIFY ?auto_24530 ?auto_24531 ?auto_24532 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24543 - SURFACE
      ?auto_24544 - SURFACE
      ?auto_24545 - SURFACE
      ?auto_24546 - SURFACE
    )
    :vars
    (
      ?auto_24549 - HOIST
      ?auto_24554 - PLACE
      ?auto_24555 - PLACE
      ?auto_24547 - HOIST
      ?auto_24551 - SURFACE
      ?auto_24552 - PLACE
      ?auto_24548 - HOIST
      ?auto_24553 - SURFACE
      ?auto_24550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24549 ?auto_24554 ) ( IS-CRATE ?auto_24546 ) ( not ( = ?auto_24545 ?auto_24546 ) ) ( not ( = ?auto_24544 ?auto_24545 ) ) ( not ( = ?auto_24544 ?auto_24546 ) ) ( not ( = ?auto_24555 ?auto_24554 ) ) ( HOIST-AT ?auto_24547 ?auto_24555 ) ( not ( = ?auto_24549 ?auto_24547 ) ) ( AVAILABLE ?auto_24547 ) ( SURFACE-AT ?auto_24546 ?auto_24555 ) ( ON ?auto_24546 ?auto_24551 ) ( CLEAR ?auto_24546 ) ( not ( = ?auto_24545 ?auto_24551 ) ) ( not ( = ?auto_24546 ?auto_24551 ) ) ( not ( = ?auto_24544 ?auto_24551 ) ) ( IS-CRATE ?auto_24545 ) ( not ( = ?auto_24552 ?auto_24554 ) ) ( not ( = ?auto_24555 ?auto_24552 ) ) ( HOIST-AT ?auto_24548 ?auto_24552 ) ( not ( = ?auto_24549 ?auto_24548 ) ) ( not ( = ?auto_24547 ?auto_24548 ) ) ( AVAILABLE ?auto_24548 ) ( SURFACE-AT ?auto_24545 ?auto_24552 ) ( ON ?auto_24545 ?auto_24553 ) ( CLEAR ?auto_24545 ) ( not ( = ?auto_24545 ?auto_24553 ) ) ( not ( = ?auto_24546 ?auto_24553 ) ) ( not ( = ?auto_24544 ?auto_24553 ) ) ( not ( = ?auto_24551 ?auto_24553 ) ) ( TRUCK-AT ?auto_24550 ?auto_24554 ) ( SURFACE-AT ?auto_24543 ?auto_24554 ) ( CLEAR ?auto_24543 ) ( LIFTING ?auto_24549 ?auto_24544 ) ( IS-CRATE ?auto_24544 ) ( not ( = ?auto_24543 ?auto_24544 ) ) ( not ( = ?auto_24545 ?auto_24543 ) ) ( not ( = ?auto_24546 ?auto_24543 ) ) ( not ( = ?auto_24551 ?auto_24543 ) ) ( not ( = ?auto_24553 ?auto_24543 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24544 ?auto_24545 ?auto_24546 )
      ( MAKE-3CRATE-VERIFY ?auto_24543 ?auto_24544 ?auto_24545 ?auto_24546 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24556 - SURFACE
      ?auto_24557 - SURFACE
    )
    :vars
    (
      ?auto_24560 - HOIST
      ?auto_24567 - PLACE
      ?auto_24565 - SURFACE
      ?auto_24568 - PLACE
      ?auto_24558 - HOIST
      ?auto_24562 - SURFACE
      ?auto_24563 - PLACE
      ?auto_24559 - HOIST
      ?auto_24566 - SURFACE
      ?auto_24561 - TRUCK
      ?auto_24564 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24560 ?auto_24567 ) ( IS-CRATE ?auto_24557 ) ( not ( = ?auto_24556 ?auto_24557 ) ) ( not ( = ?auto_24565 ?auto_24556 ) ) ( not ( = ?auto_24565 ?auto_24557 ) ) ( not ( = ?auto_24568 ?auto_24567 ) ) ( HOIST-AT ?auto_24558 ?auto_24568 ) ( not ( = ?auto_24560 ?auto_24558 ) ) ( AVAILABLE ?auto_24558 ) ( SURFACE-AT ?auto_24557 ?auto_24568 ) ( ON ?auto_24557 ?auto_24562 ) ( CLEAR ?auto_24557 ) ( not ( = ?auto_24556 ?auto_24562 ) ) ( not ( = ?auto_24557 ?auto_24562 ) ) ( not ( = ?auto_24565 ?auto_24562 ) ) ( IS-CRATE ?auto_24556 ) ( not ( = ?auto_24563 ?auto_24567 ) ) ( not ( = ?auto_24568 ?auto_24563 ) ) ( HOIST-AT ?auto_24559 ?auto_24563 ) ( not ( = ?auto_24560 ?auto_24559 ) ) ( not ( = ?auto_24558 ?auto_24559 ) ) ( AVAILABLE ?auto_24559 ) ( SURFACE-AT ?auto_24556 ?auto_24563 ) ( ON ?auto_24556 ?auto_24566 ) ( CLEAR ?auto_24556 ) ( not ( = ?auto_24556 ?auto_24566 ) ) ( not ( = ?auto_24557 ?auto_24566 ) ) ( not ( = ?auto_24565 ?auto_24566 ) ) ( not ( = ?auto_24562 ?auto_24566 ) ) ( TRUCK-AT ?auto_24561 ?auto_24567 ) ( SURFACE-AT ?auto_24564 ?auto_24567 ) ( CLEAR ?auto_24564 ) ( IS-CRATE ?auto_24565 ) ( not ( = ?auto_24564 ?auto_24565 ) ) ( not ( = ?auto_24556 ?auto_24564 ) ) ( not ( = ?auto_24557 ?auto_24564 ) ) ( not ( = ?auto_24562 ?auto_24564 ) ) ( not ( = ?auto_24566 ?auto_24564 ) ) ( AVAILABLE ?auto_24560 ) ( IN ?auto_24565 ?auto_24561 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24560 ?auto_24565 ?auto_24561 ?auto_24567 )
      ( MAKE-2CRATE ?auto_24565 ?auto_24556 ?auto_24557 )
      ( MAKE-1CRATE-VERIFY ?auto_24556 ?auto_24557 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24569 - SURFACE
      ?auto_24570 - SURFACE
      ?auto_24571 - SURFACE
    )
    :vars
    (
      ?auto_24578 - HOIST
      ?auto_24572 - PLACE
      ?auto_24573 - PLACE
      ?auto_24579 - HOIST
      ?auto_24574 - SURFACE
      ?auto_24576 - PLACE
      ?auto_24581 - HOIST
      ?auto_24575 - SURFACE
      ?auto_24577 - TRUCK
      ?auto_24580 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24578 ?auto_24572 ) ( IS-CRATE ?auto_24571 ) ( not ( = ?auto_24570 ?auto_24571 ) ) ( not ( = ?auto_24569 ?auto_24570 ) ) ( not ( = ?auto_24569 ?auto_24571 ) ) ( not ( = ?auto_24573 ?auto_24572 ) ) ( HOIST-AT ?auto_24579 ?auto_24573 ) ( not ( = ?auto_24578 ?auto_24579 ) ) ( AVAILABLE ?auto_24579 ) ( SURFACE-AT ?auto_24571 ?auto_24573 ) ( ON ?auto_24571 ?auto_24574 ) ( CLEAR ?auto_24571 ) ( not ( = ?auto_24570 ?auto_24574 ) ) ( not ( = ?auto_24571 ?auto_24574 ) ) ( not ( = ?auto_24569 ?auto_24574 ) ) ( IS-CRATE ?auto_24570 ) ( not ( = ?auto_24576 ?auto_24572 ) ) ( not ( = ?auto_24573 ?auto_24576 ) ) ( HOIST-AT ?auto_24581 ?auto_24576 ) ( not ( = ?auto_24578 ?auto_24581 ) ) ( not ( = ?auto_24579 ?auto_24581 ) ) ( AVAILABLE ?auto_24581 ) ( SURFACE-AT ?auto_24570 ?auto_24576 ) ( ON ?auto_24570 ?auto_24575 ) ( CLEAR ?auto_24570 ) ( not ( = ?auto_24570 ?auto_24575 ) ) ( not ( = ?auto_24571 ?auto_24575 ) ) ( not ( = ?auto_24569 ?auto_24575 ) ) ( not ( = ?auto_24574 ?auto_24575 ) ) ( TRUCK-AT ?auto_24577 ?auto_24572 ) ( SURFACE-AT ?auto_24580 ?auto_24572 ) ( CLEAR ?auto_24580 ) ( IS-CRATE ?auto_24569 ) ( not ( = ?auto_24580 ?auto_24569 ) ) ( not ( = ?auto_24570 ?auto_24580 ) ) ( not ( = ?auto_24571 ?auto_24580 ) ) ( not ( = ?auto_24574 ?auto_24580 ) ) ( not ( = ?auto_24575 ?auto_24580 ) ) ( AVAILABLE ?auto_24578 ) ( IN ?auto_24569 ?auto_24577 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24570 ?auto_24571 )
      ( MAKE-2CRATE-VERIFY ?auto_24569 ?auto_24570 ?auto_24571 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24582 - SURFACE
      ?auto_24583 - SURFACE
      ?auto_24584 - SURFACE
      ?auto_24585 - SURFACE
    )
    :vars
    (
      ?auto_24590 - HOIST
      ?auto_24591 - PLACE
      ?auto_24594 - PLACE
      ?auto_24588 - HOIST
      ?auto_24589 - SURFACE
      ?auto_24586 - PLACE
      ?auto_24592 - HOIST
      ?auto_24593 - SURFACE
      ?auto_24587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24590 ?auto_24591 ) ( IS-CRATE ?auto_24585 ) ( not ( = ?auto_24584 ?auto_24585 ) ) ( not ( = ?auto_24583 ?auto_24584 ) ) ( not ( = ?auto_24583 ?auto_24585 ) ) ( not ( = ?auto_24594 ?auto_24591 ) ) ( HOIST-AT ?auto_24588 ?auto_24594 ) ( not ( = ?auto_24590 ?auto_24588 ) ) ( AVAILABLE ?auto_24588 ) ( SURFACE-AT ?auto_24585 ?auto_24594 ) ( ON ?auto_24585 ?auto_24589 ) ( CLEAR ?auto_24585 ) ( not ( = ?auto_24584 ?auto_24589 ) ) ( not ( = ?auto_24585 ?auto_24589 ) ) ( not ( = ?auto_24583 ?auto_24589 ) ) ( IS-CRATE ?auto_24584 ) ( not ( = ?auto_24586 ?auto_24591 ) ) ( not ( = ?auto_24594 ?auto_24586 ) ) ( HOIST-AT ?auto_24592 ?auto_24586 ) ( not ( = ?auto_24590 ?auto_24592 ) ) ( not ( = ?auto_24588 ?auto_24592 ) ) ( AVAILABLE ?auto_24592 ) ( SURFACE-AT ?auto_24584 ?auto_24586 ) ( ON ?auto_24584 ?auto_24593 ) ( CLEAR ?auto_24584 ) ( not ( = ?auto_24584 ?auto_24593 ) ) ( not ( = ?auto_24585 ?auto_24593 ) ) ( not ( = ?auto_24583 ?auto_24593 ) ) ( not ( = ?auto_24589 ?auto_24593 ) ) ( TRUCK-AT ?auto_24587 ?auto_24591 ) ( SURFACE-AT ?auto_24582 ?auto_24591 ) ( CLEAR ?auto_24582 ) ( IS-CRATE ?auto_24583 ) ( not ( = ?auto_24582 ?auto_24583 ) ) ( not ( = ?auto_24584 ?auto_24582 ) ) ( not ( = ?auto_24585 ?auto_24582 ) ) ( not ( = ?auto_24589 ?auto_24582 ) ) ( not ( = ?auto_24593 ?auto_24582 ) ) ( AVAILABLE ?auto_24590 ) ( IN ?auto_24583 ?auto_24587 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24583 ?auto_24584 ?auto_24585 )
      ( MAKE-3CRATE-VERIFY ?auto_24582 ?auto_24583 ?auto_24584 ?auto_24585 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24595 - SURFACE
      ?auto_24596 - SURFACE
    )
    :vars
    (
      ?auto_24601 - HOIST
      ?auto_24602 - PLACE
      ?auto_24603 - SURFACE
      ?auto_24607 - PLACE
      ?auto_24599 - HOIST
      ?auto_24600 - SURFACE
      ?auto_24597 - PLACE
      ?auto_24605 - HOIST
      ?auto_24606 - SURFACE
      ?auto_24604 - SURFACE
      ?auto_24598 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24601 ?auto_24602 ) ( IS-CRATE ?auto_24596 ) ( not ( = ?auto_24595 ?auto_24596 ) ) ( not ( = ?auto_24603 ?auto_24595 ) ) ( not ( = ?auto_24603 ?auto_24596 ) ) ( not ( = ?auto_24607 ?auto_24602 ) ) ( HOIST-AT ?auto_24599 ?auto_24607 ) ( not ( = ?auto_24601 ?auto_24599 ) ) ( AVAILABLE ?auto_24599 ) ( SURFACE-AT ?auto_24596 ?auto_24607 ) ( ON ?auto_24596 ?auto_24600 ) ( CLEAR ?auto_24596 ) ( not ( = ?auto_24595 ?auto_24600 ) ) ( not ( = ?auto_24596 ?auto_24600 ) ) ( not ( = ?auto_24603 ?auto_24600 ) ) ( IS-CRATE ?auto_24595 ) ( not ( = ?auto_24597 ?auto_24602 ) ) ( not ( = ?auto_24607 ?auto_24597 ) ) ( HOIST-AT ?auto_24605 ?auto_24597 ) ( not ( = ?auto_24601 ?auto_24605 ) ) ( not ( = ?auto_24599 ?auto_24605 ) ) ( AVAILABLE ?auto_24605 ) ( SURFACE-AT ?auto_24595 ?auto_24597 ) ( ON ?auto_24595 ?auto_24606 ) ( CLEAR ?auto_24595 ) ( not ( = ?auto_24595 ?auto_24606 ) ) ( not ( = ?auto_24596 ?auto_24606 ) ) ( not ( = ?auto_24603 ?auto_24606 ) ) ( not ( = ?auto_24600 ?auto_24606 ) ) ( SURFACE-AT ?auto_24604 ?auto_24602 ) ( CLEAR ?auto_24604 ) ( IS-CRATE ?auto_24603 ) ( not ( = ?auto_24604 ?auto_24603 ) ) ( not ( = ?auto_24595 ?auto_24604 ) ) ( not ( = ?auto_24596 ?auto_24604 ) ) ( not ( = ?auto_24600 ?auto_24604 ) ) ( not ( = ?auto_24606 ?auto_24604 ) ) ( AVAILABLE ?auto_24601 ) ( IN ?auto_24603 ?auto_24598 ) ( TRUCK-AT ?auto_24598 ?auto_24607 ) )
    :subtasks
    ( ( !DRIVE ?auto_24598 ?auto_24607 ?auto_24602 )
      ( MAKE-2CRATE ?auto_24603 ?auto_24595 ?auto_24596 )
      ( MAKE-1CRATE-VERIFY ?auto_24595 ?auto_24596 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24608 - SURFACE
      ?auto_24609 - SURFACE
      ?auto_24610 - SURFACE
    )
    :vars
    (
      ?auto_24618 - HOIST
      ?auto_24615 - PLACE
      ?auto_24616 - PLACE
      ?auto_24619 - HOIST
      ?auto_24612 - SURFACE
      ?auto_24617 - PLACE
      ?auto_24620 - HOIST
      ?auto_24613 - SURFACE
      ?auto_24614 - SURFACE
      ?auto_24611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24618 ?auto_24615 ) ( IS-CRATE ?auto_24610 ) ( not ( = ?auto_24609 ?auto_24610 ) ) ( not ( = ?auto_24608 ?auto_24609 ) ) ( not ( = ?auto_24608 ?auto_24610 ) ) ( not ( = ?auto_24616 ?auto_24615 ) ) ( HOIST-AT ?auto_24619 ?auto_24616 ) ( not ( = ?auto_24618 ?auto_24619 ) ) ( AVAILABLE ?auto_24619 ) ( SURFACE-AT ?auto_24610 ?auto_24616 ) ( ON ?auto_24610 ?auto_24612 ) ( CLEAR ?auto_24610 ) ( not ( = ?auto_24609 ?auto_24612 ) ) ( not ( = ?auto_24610 ?auto_24612 ) ) ( not ( = ?auto_24608 ?auto_24612 ) ) ( IS-CRATE ?auto_24609 ) ( not ( = ?auto_24617 ?auto_24615 ) ) ( not ( = ?auto_24616 ?auto_24617 ) ) ( HOIST-AT ?auto_24620 ?auto_24617 ) ( not ( = ?auto_24618 ?auto_24620 ) ) ( not ( = ?auto_24619 ?auto_24620 ) ) ( AVAILABLE ?auto_24620 ) ( SURFACE-AT ?auto_24609 ?auto_24617 ) ( ON ?auto_24609 ?auto_24613 ) ( CLEAR ?auto_24609 ) ( not ( = ?auto_24609 ?auto_24613 ) ) ( not ( = ?auto_24610 ?auto_24613 ) ) ( not ( = ?auto_24608 ?auto_24613 ) ) ( not ( = ?auto_24612 ?auto_24613 ) ) ( SURFACE-AT ?auto_24614 ?auto_24615 ) ( CLEAR ?auto_24614 ) ( IS-CRATE ?auto_24608 ) ( not ( = ?auto_24614 ?auto_24608 ) ) ( not ( = ?auto_24609 ?auto_24614 ) ) ( not ( = ?auto_24610 ?auto_24614 ) ) ( not ( = ?auto_24612 ?auto_24614 ) ) ( not ( = ?auto_24613 ?auto_24614 ) ) ( AVAILABLE ?auto_24618 ) ( IN ?auto_24608 ?auto_24611 ) ( TRUCK-AT ?auto_24611 ?auto_24616 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24609 ?auto_24610 )
      ( MAKE-2CRATE-VERIFY ?auto_24608 ?auto_24609 ?auto_24610 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24621 - SURFACE
      ?auto_24622 - SURFACE
      ?auto_24623 - SURFACE
      ?auto_24624 - SURFACE
    )
    :vars
    (
      ?auto_24631 - HOIST
      ?auto_24627 - PLACE
      ?auto_24632 - PLACE
      ?auto_24630 - HOIST
      ?auto_24625 - SURFACE
      ?auto_24629 - PLACE
      ?auto_24628 - HOIST
      ?auto_24633 - SURFACE
      ?auto_24626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24631 ?auto_24627 ) ( IS-CRATE ?auto_24624 ) ( not ( = ?auto_24623 ?auto_24624 ) ) ( not ( = ?auto_24622 ?auto_24623 ) ) ( not ( = ?auto_24622 ?auto_24624 ) ) ( not ( = ?auto_24632 ?auto_24627 ) ) ( HOIST-AT ?auto_24630 ?auto_24632 ) ( not ( = ?auto_24631 ?auto_24630 ) ) ( AVAILABLE ?auto_24630 ) ( SURFACE-AT ?auto_24624 ?auto_24632 ) ( ON ?auto_24624 ?auto_24625 ) ( CLEAR ?auto_24624 ) ( not ( = ?auto_24623 ?auto_24625 ) ) ( not ( = ?auto_24624 ?auto_24625 ) ) ( not ( = ?auto_24622 ?auto_24625 ) ) ( IS-CRATE ?auto_24623 ) ( not ( = ?auto_24629 ?auto_24627 ) ) ( not ( = ?auto_24632 ?auto_24629 ) ) ( HOIST-AT ?auto_24628 ?auto_24629 ) ( not ( = ?auto_24631 ?auto_24628 ) ) ( not ( = ?auto_24630 ?auto_24628 ) ) ( AVAILABLE ?auto_24628 ) ( SURFACE-AT ?auto_24623 ?auto_24629 ) ( ON ?auto_24623 ?auto_24633 ) ( CLEAR ?auto_24623 ) ( not ( = ?auto_24623 ?auto_24633 ) ) ( not ( = ?auto_24624 ?auto_24633 ) ) ( not ( = ?auto_24622 ?auto_24633 ) ) ( not ( = ?auto_24625 ?auto_24633 ) ) ( SURFACE-AT ?auto_24621 ?auto_24627 ) ( CLEAR ?auto_24621 ) ( IS-CRATE ?auto_24622 ) ( not ( = ?auto_24621 ?auto_24622 ) ) ( not ( = ?auto_24623 ?auto_24621 ) ) ( not ( = ?auto_24624 ?auto_24621 ) ) ( not ( = ?auto_24625 ?auto_24621 ) ) ( not ( = ?auto_24633 ?auto_24621 ) ) ( AVAILABLE ?auto_24631 ) ( IN ?auto_24622 ?auto_24626 ) ( TRUCK-AT ?auto_24626 ?auto_24632 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24622 ?auto_24623 ?auto_24624 )
      ( MAKE-3CRATE-VERIFY ?auto_24621 ?auto_24622 ?auto_24623 ?auto_24624 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24634 - SURFACE
      ?auto_24635 - SURFACE
    )
    :vars
    (
      ?auto_24644 - HOIST
      ?auto_24638 - PLACE
      ?auto_24641 - SURFACE
      ?auto_24645 - PLACE
      ?auto_24643 - HOIST
      ?auto_24636 - SURFACE
      ?auto_24640 - PLACE
      ?auto_24639 - HOIST
      ?auto_24646 - SURFACE
      ?auto_24642 - SURFACE
      ?auto_24637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24644 ?auto_24638 ) ( IS-CRATE ?auto_24635 ) ( not ( = ?auto_24634 ?auto_24635 ) ) ( not ( = ?auto_24641 ?auto_24634 ) ) ( not ( = ?auto_24641 ?auto_24635 ) ) ( not ( = ?auto_24645 ?auto_24638 ) ) ( HOIST-AT ?auto_24643 ?auto_24645 ) ( not ( = ?auto_24644 ?auto_24643 ) ) ( SURFACE-AT ?auto_24635 ?auto_24645 ) ( ON ?auto_24635 ?auto_24636 ) ( CLEAR ?auto_24635 ) ( not ( = ?auto_24634 ?auto_24636 ) ) ( not ( = ?auto_24635 ?auto_24636 ) ) ( not ( = ?auto_24641 ?auto_24636 ) ) ( IS-CRATE ?auto_24634 ) ( not ( = ?auto_24640 ?auto_24638 ) ) ( not ( = ?auto_24645 ?auto_24640 ) ) ( HOIST-AT ?auto_24639 ?auto_24640 ) ( not ( = ?auto_24644 ?auto_24639 ) ) ( not ( = ?auto_24643 ?auto_24639 ) ) ( AVAILABLE ?auto_24639 ) ( SURFACE-AT ?auto_24634 ?auto_24640 ) ( ON ?auto_24634 ?auto_24646 ) ( CLEAR ?auto_24634 ) ( not ( = ?auto_24634 ?auto_24646 ) ) ( not ( = ?auto_24635 ?auto_24646 ) ) ( not ( = ?auto_24641 ?auto_24646 ) ) ( not ( = ?auto_24636 ?auto_24646 ) ) ( SURFACE-AT ?auto_24642 ?auto_24638 ) ( CLEAR ?auto_24642 ) ( IS-CRATE ?auto_24641 ) ( not ( = ?auto_24642 ?auto_24641 ) ) ( not ( = ?auto_24634 ?auto_24642 ) ) ( not ( = ?auto_24635 ?auto_24642 ) ) ( not ( = ?auto_24636 ?auto_24642 ) ) ( not ( = ?auto_24646 ?auto_24642 ) ) ( AVAILABLE ?auto_24644 ) ( TRUCK-AT ?auto_24637 ?auto_24645 ) ( LIFTING ?auto_24643 ?auto_24641 ) )
    :subtasks
    ( ( !LOAD ?auto_24643 ?auto_24641 ?auto_24637 ?auto_24645 )
      ( MAKE-2CRATE ?auto_24641 ?auto_24634 ?auto_24635 )
      ( MAKE-1CRATE-VERIFY ?auto_24634 ?auto_24635 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24647 - SURFACE
      ?auto_24648 - SURFACE
      ?auto_24649 - SURFACE
    )
    :vars
    (
      ?auto_24655 - HOIST
      ?auto_24658 - PLACE
      ?auto_24651 - PLACE
      ?auto_24656 - HOIST
      ?auto_24659 - SURFACE
      ?auto_24653 - PLACE
      ?auto_24652 - HOIST
      ?auto_24654 - SURFACE
      ?auto_24657 - SURFACE
      ?auto_24650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24655 ?auto_24658 ) ( IS-CRATE ?auto_24649 ) ( not ( = ?auto_24648 ?auto_24649 ) ) ( not ( = ?auto_24647 ?auto_24648 ) ) ( not ( = ?auto_24647 ?auto_24649 ) ) ( not ( = ?auto_24651 ?auto_24658 ) ) ( HOIST-AT ?auto_24656 ?auto_24651 ) ( not ( = ?auto_24655 ?auto_24656 ) ) ( SURFACE-AT ?auto_24649 ?auto_24651 ) ( ON ?auto_24649 ?auto_24659 ) ( CLEAR ?auto_24649 ) ( not ( = ?auto_24648 ?auto_24659 ) ) ( not ( = ?auto_24649 ?auto_24659 ) ) ( not ( = ?auto_24647 ?auto_24659 ) ) ( IS-CRATE ?auto_24648 ) ( not ( = ?auto_24653 ?auto_24658 ) ) ( not ( = ?auto_24651 ?auto_24653 ) ) ( HOIST-AT ?auto_24652 ?auto_24653 ) ( not ( = ?auto_24655 ?auto_24652 ) ) ( not ( = ?auto_24656 ?auto_24652 ) ) ( AVAILABLE ?auto_24652 ) ( SURFACE-AT ?auto_24648 ?auto_24653 ) ( ON ?auto_24648 ?auto_24654 ) ( CLEAR ?auto_24648 ) ( not ( = ?auto_24648 ?auto_24654 ) ) ( not ( = ?auto_24649 ?auto_24654 ) ) ( not ( = ?auto_24647 ?auto_24654 ) ) ( not ( = ?auto_24659 ?auto_24654 ) ) ( SURFACE-AT ?auto_24657 ?auto_24658 ) ( CLEAR ?auto_24657 ) ( IS-CRATE ?auto_24647 ) ( not ( = ?auto_24657 ?auto_24647 ) ) ( not ( = ?auto_24648 ?auto_24657 ) ) ( not ( = ?auto_24649 ?auto_24657 ) ) ( not ( = ?auto_24659 ?auto_24657 ) ) ( not ( = ?auto_24654 ?auto_24657 ) ) ( AVAILABLE ?auto_24655 ) ( TRUCK-AT ?auto_24650 ?auto_24651 ) ( LIFTING ?auto_24656 ?auto_24647 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24648 ?auto_24649 )
      ( MAKE-2CRATE-VERIFY ?auto_24647 ?auto_24648 ?auto_24649 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24660 - SURFACE
      ?auto_24661 - SURFACE
      ?auto_24662 - SURFACE
      ?auto_24663 - SURFACE
    )
    :vars
    (
      ?auto_24666 - HOIST
      ?auto_24665 - PLACE
      ?auto_24671 - PLACE
      ?auto_24670 - HOIST
      ?auto_24668 - SURFACE
      ?auto_24669 - PLACE
      ?auto_24667 - HOIST
      ?auto_24672 - SURFACE
      ?auto_24664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24666 ?auto_24665 ) ( IS-CRATE ?auto_24663 ) ( not ( = ?auto_24662 ?auto_24663 ) ) ( not ( = ?auto_24661 ?auto_24662 ) ) ( not ( = ?auto_24661 ?auto_24663 ) ) ( not ( = ?auto_24671 ?auto_24665 ) ) ( HOIST-AT ?auto_24670 ?auto_24671 ) ( not ( = ?auto_24666 ?auto_24670 ) ) ( SURFACE-AT ?auto_24663 ?auto_24671 ) ( ON ?auto_24663 ?auto_24668 ) ( CLEAR ?auto_24663 ) ( not ( = ?auto_24662 ?auto_24668 ) ) ( not ( = ?auto_24663 ?auto_24668 ) ) ( not ( = ?auto_24661 ?auto_24668 ) ) ( IS-CRATE ?auto_24662 ) ( not ( = ?auto_24669 ?auto_24665 ) ) ( not ( = ?auto_24671 ?auto_24669 ) ) ( HOIST-AT ?auto_24667 ?auto_24669 ) ( not ( = ?auto_24666 ?auto_24667 ) ) ( not ( = ?auto_24670 ?auto_24667 ) ) ( AVAILABLE ?auto_24667 ) ( SURFACE-AT ?auto_24662 ?auto_24669 ) ( ON ?auto_24662 ?auto_24672 ) ( CLEAR ?auto_24662 ) ( not ( = ?auto_24662 ?auto_24672 ) ) ( not ( = ?auto_24663 ?auto_24672 ) ) ( not ( = ?auto_24661 ?auto_24672 ) ) ( not ( = ?auto_24668 ?auto_24672 ) ) ( SURFACE-AT ?auto_24660 ?auto_24665 ) ( CLEAR ?auto_24660 ) ( IS-CRATE ?auto_24661 ) ( not ( = ?auto_24660 ?auto_24661 ) ) ( not ( = ?auto_24662 ?auto_24660 ) ) ( not ( = ?auto_24663 ?auto_24660 ) ) ( not ( = ?auto_24668 ?auto_24660 ) ) ( not ( = ?auto_24672 ?auto_24660 ) ) ( AVAILABLE ?auto_24666 ) ( TRUCK-AT ?auto_24664 ?auto_24671 ) ( LIFTING ?auto_24670 ?auto_24661 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24661 ?auto_24662 ?auto_24663 )
      ( MAKE-3CRATE-VERIFY ?auto_24660 ?auto_24661 ?auto_24662 ?auto_24663 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24673 - SURFACE
      ?auto_24674 - SURFACE
    )
    :vars
    (
      ?auto_24678 - HOIST
      ?auto_24676 - PLACE
      ?auto_24677 - SURFACE
      ?auto_24684 - PLACE
      ?auto_24683 - HOIST
      ?auto_24680 - SURFACE
      ?auto_24681 - PLACE
      ?auto_24679 - HOIST
      ?auto_24685 - SURFACE
      ?auto_24682 - SURFACE
      ?auto_24675 - TRUCK
      ?auto_24686 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24678 ?auto_24676 ) ( IS-CRATE ?auto_24674 ) ( not ( = ?auto_24673 ?auto_24674 ) ) ( not ( = ?auto_24677 ?auto_24673 ) ) ( not ( = ?auto_24677 ?auto_24674 ) ) ( not ( = ?auto_24684 ?auto_24676 ) ) ( HOIST-AT ?auto_24683 ?auto_24684 ) ( not ( = ?auto_24678 ?auto_24683 ) ) ( SURFACE-AT ?auto_24674 ?auto_24684 ) ( ON ?auto_24674 ?auto_24680 ) ( CLEAR ?auto_24674 ) ( not ( = ?auto_24673 ?auto_24680 ) ) ( not ( = ?auto_24674 ?auto_24680 ) ) ( not ( = ?auto_24677 ?auto_24680 ) ) ( IS-CRATE ?auto_24673 ) ( not ( = ?auto_24681 ?auto_24676 ) ) ( not ( = ?auto_24684 ?auto_24681 ) ) ( HOIST-AT ?auto_24679 ?auto_24681 ) ( not ( = ?auto_24678 ?auto_24679 ) ) ( not ( = ?auto_24683 ?auto_24679 ) ) ( AVAILABLE ?auto_24679 ) ( SURFACE-AT ?auto_24673 ?auto_24681 ) ( ON ?auto_24673 ?auto_24685 ) ( CLEAR ?auto_24673 ) ( not ( = ?auto_24673 ?auto_24685 ) ) ( not ( = ?auto_24674 ?auto_24685 ) ) ( not ( = ?auto_24677 ?auto_24685 ) ) ( not ( = ?auto_24680 ?auto_24685 ) ) ( SURFACE-AT ?auto_24682 ?auto_24676 ) ( CLEAR ?auto_24682 ) ( IS-CRATE ?auto_24677 ) ( not ( = ?auto_24682 ?auto_24677 ) ) ( not ( = ?auto_24673 ?auto_24682 ) ) ( not ( = ?auto_24674 ?auto_24682 ) ) ( not ( = ?auto_24680 ?auto_24682 ) ) ( not ( = ?auto_24685 ?auto_24682 ) ) ( AVAILABLE ?auto_24678 ) ( TRUCK-AT ?auto_24675 ?auto_24684 ) ( AVAILABLE ?auto_24683 ) ( SURFACE-AT ?auto_24677 ?auto_24684 ) ( ON ?auto_24677 ?auto_24686 ) ( CLEAR ?auto_24677 ) ( not ( = ?auto_24673 ?auto_24686 ) ) ( not ( = ?auto_24674 ?auto_24686 ) ) ( not ( = ?auto_24677 ?auto_24686 ) ) ( not ( = ?auto_24680 ?auto_24686 ) ) ( not ( = ?auto_24685 ?auto_24686 ) ) ( not ( = ?auto_24682 ?auto_24686 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24683 ?auto_24677 ?auto_24686 ?auto_24684 )
      ( MAKE-2CRATE ?auto_24677 ?auto_24673 ?auto_24674 )
      ( MAKE-1CRATE-VERIFY ?auto_24673 ?auto_24674 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24687 - SURFACE
      ?auto_24688 - SURFACE
      ?auto_24689 - SURFACE
    )
    :vars
    (
      ?auto_24700 - HOIST
      ?auto_24698 - PLACE
      ?auto_24692 - PLACE
      ?auto_24699 - HOIST
      ?auto_24693 - SURFACE
      ?auto_24694 - PLACE
      ?auto_24695 - HOIST
      ?auto_24690 - SURFACE
      ?auto_24697 - SURFACE
      ?auto_24691 - TRUCK
      ?auto_24696 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24700 ?auto_24698 ) ( IS-CRATE ?auto_24689 ) ( not ( = ?auto_24688 ?auto_24689 ) ) ( not ( = ?auto_24687 ?auto_24688 ) ) ( not ( = ?auto_24687 ?auto_24689 ) ) ( not ( = ?auto_24692 ?auto_24698 ) ) ( HOIST-AT ?auto_24699 ?auto_24692 ) ( not ( = ?auto_24700 ?auto_24699 ) ) ( SURFACE-AT ?auto_24689 ?auto_24692 ) ( ON ?auto_24689 ?auto_24693 ) ( CLEAR ?auto_24689 ) ( not ( = ?auto_24688 ?auto_24693 ) ) ( not ( = ?auto_24689 ?auto_24693 ) ) ( not ( = ?auto_24687 ?auto_24693 ) ) ( IS-CRATE ?auto_24688 ) ( not ( = ?auto_24694 ?auto_24698 ) ) ( not ( = ?auto_24692 ?auto_24694 ) ) ( HOIST-AT ?auto_24695 ?auto_24694 ) ( not ( = ?auto_24700 ?auto_24695 ) ) ( not ( = ?auto_24699 ?auto_24695 ) ) ( AVAILABLE ?auto_24695 ) ( SURFACE-AT ?auto_24688 ?auto_24694 ) ( ON ?auto_24688 ?auto_24690 ) ( CLEAR ?auto_24688 ) ( not ( = ?auto_24688 ?auto_24690 ) ) ( not ( = ?auto_24689 ?auto_24690 ) ) ( not ( = ?auto_24687 ?auto_24690 ) ) ( not ( = ?auto_24693 ?auto_24690 ) ) ( SURFACE-AT ?auto_24697 ?auto_24698 ) ( CLEAR ?auto_24697 ) ( IS-CRATE ?auto_24687 ) ( not ( = ?auto_24697 ?auto_24687 ) ) ( not ( = ?auto_24688 ?auto_24697 ) ) ( not ( = ?auto_24689 ?auto_24697 ) ) ( not ( = ?auto_24693 ?auto_24697 ) ) ( not ( = ?auto_24690 ?auto_24697 ) ) ( AVAILABLE ?auto_24700 ) ( TRUCK-AT ?auto_24691 ?auto_24692 ) ( AVAILABLE ?auto_24699 ) ( SURFACE-AT ?auto_24687 ?auto_24692 ) ( ON ?auto_24687 ?auto_24696 ) ( CLEAR ?auto_24687 ) ( not ( = ?auto_24688 ?auto_24696 ) ) ( not ( = ?auto_24689 ?auto_24696 ) ) ( not ( = ?auto_24687 ?auto_24696 ) ) ( not ( = ?auto_24693 ?auto_24696 ) ) ( not ( = ?auto_24690 ?auto_24696 ) ) ( not ( = ?auto_24697 ?auto_24696 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24688 ?auto_24689 )
      ( MAKE-2CRATE-VERIFY ?auto_24687 ?auto_24688 ?auto_24689 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24701 - SURFACE
      ?auto_24702 - SURFACE
      ?auto_24703 - SURFACE
      ?auto_24704 - SURFACE
    )
    :vars
    (
      ?auto_24709 - HOIST
      ?auto_24710 - PLACE
      ?auto_24708 - PLACE
      ?auto_24714 - HOIST
      ?auto_24706 - SURFACE
      ?auto_24712 - PLACE
      ?auto_24707 - HOIST
      ?auto_24705 - SURFACE
      ?auto_24713 - TRUCK
      ?auto_24711 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24709 ?auto_24710 ) ( IS-CRATE ?auto_24704 ) ( not ( = ?auto_24703 ?auto_24704 ) ) ( not ( = ?auto_24702 ?auto_24703 ) ) ( not ( = ?auto_24702 ?auto_24704 ) ) ( not ( = ?auto_24708 ?auto_24710 ) ) ( HOIST-AT ?auto_24714 ?auto_24708 ) ( not ( = ?auto_24709 ?auto_24714 ) ) ( SURFACE-AT ?auto_24704 ?auto_24708 ) ( ON ?auto_24704 ?auto_24706 ) ( CLEAR ?auto_24704 ) ( not ( = ?auto_24703 ?auto_24706 ) ) ( not ( = ?auto_24704 ?auto_24706 ) ) ( not ( = ?auto_24702 ?auto_24706 ) ) ( IS-CRATE ?auto_24703 ) ( not ( = ?auto_24712 ?auto_24710 ) ) ( not ( = ?auto_24708 ?auto_24712 ) ) ( HOIST-AT ?auto_24707 ?auto_24712 ) ( not ( = ?auto_24709 ?auto_24707 ) ) ( not ( = ?auto_24714 ?auto_24707 ) ) ( AVAILABLE ?auto_24707 ) ( SURFACE-AT ?auto_24703 ?auto_24712 ) ( ON ?auto_24703 ?auto_24705 ) ( CLEAR ?auto_24703 ) ( not ( = ?auto_24703 ?auto_24705 ) ) ( not ( = ?auto_24704 ?auto_24705 ) ) ( not ( = ?auto_24702 ?auto_24705 ) ) ( not ( = ?auto_24706 ?auto_24705 ) ) ( SURFACE-AT ?auto_24701 ?auto_24710 ) ( CLEAR ?auto_24701 ) ( IS-CRATE ?auto_24702 ) ( not ( = ?auto_24701 ?auto_24702 ) ) ( not ( = ?auto_24703 ?auto_24701 ) ) ( not ( = ?auto_24704 ?auto_24701 ) ) ( not ( = ?auto_24706 ?auto_24701 ) ) ( not ( = ?auto_24705 ?auto_24701 ) ) ( AVAILABLE ?auto_24709 ) ( TRUCK-AT ?auto_24713 ?auto_24708 ) ( AVAILABLE ?auto_24714 ) ( SURFACE-AT ?auto_24702 ?auto_24708 ) ( ON ?auto_24702 ?auto_24711 ) ( CLEAR ?auto_24702 ) ( not ( = ?auto_24703 ?auto_24711 ) ) ( not ( = ?auto_24704 ?auto_24711 ) ) ( not ( = ?auto_24702 ?auto_24711 ) ) ( not ( = ?auto_24706 ?auto_24711 ) ) ( not ( = ?auto_24705 ?auto_24711 ) ) ( not ( = ?auto_24701 ?auto_24711 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24702 ?auto_24703 ?auto_24704 )
      ( MAKE-3CRATE-VERIFY ?auto_24701 ?auto_24702 ?auto_24703 ?auto_24704 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24715 - SURFACE
      ?auto_24716 - SURFACE
    )
    :vars
    (
      ?auto_24722 - HOIST
      ?auto_24723 - PLACE
      ?auto_24727 - SURFACE
      ?auto_24721 - PLACE
      ?auto_24728 - HOIST
      ?auto_24719 - SURFACE
      ?auto_24725 - PLACE
      ?auto_24720 - HOIST
      ?auto_24717 - SURFACE
      ?auto_24718 - SURFACE
      ?auto_24724 - SURFACE
      ?auto_24726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24722 ?auto_24723 ) ( IS-CRATE ?auto_24716 ) ( not ( = ?auto_24715 ?auto_24716 ) ) ( not ( = ?auto_24727 ?auto_24715 ) ) ( not ( = ?auto_24727 ?auto_24716 ) ) ( not ( = ?auto_24721 ?auto_24723 ) ) ( HOIST-AT ?auto_24728 ?auto_24721 ) ( not ( = ?auto_24722 ?auto_24728 ) ) ( SURFACE-AT ?auto_24716 ?auto_24721 ) ( ON ?auto_24716 ?auto_24719 ) ( CLEAR ?auto_24716 ) ( not ( = ?auto_24715 ?auto_24719 ) ) ( not ( = ?auto_24716 ?auto_24719 ) ) ( not ( = ?auto_24727 ?auto_24719 ) ) ( IS-CRATE ?auto_24715 ) ( not ( = ?auto_24725 ?auto_24723 ) ) ( not ( = ?auto_24721 ?auto_24725 ) ) ( HOIST-AT ?auto_24720 ?auto_24725 ) ( not ( = ?auto_24722 ?auto_24720 ) ) ( not ( = ?auto_24728 ?auto_24720 ) ) ( AVAILABLE ?auto_24720 ) ( SURFACE-AT ?auto_24715 ?auto_24725 ) ( ON ?auto_24715 ?auto_24717 ) ( CLEAR ?auto_24715 ) ( not ( = ?auto_24715 ?auto_24717 ) ) ( not ( = ?auto_24716 ?auto_24717 ) ) ( not ( = ?auto_24727 ?auto_24717 ) ) ( not ( = ?auto_24719 ?auto_24717 ) ) ( SURFACE-AT ?auto_24718 ?auto_24723 ) ( CLEAR ?auto_24718 ) ( IS-CRATE ?auto_24727 ) ( not ( = ?auto_24718 ?auto_24727 ) ) ( not ( = ?auto_24715 ?auto_24718 ) ) ( not ( = ?auto_24716 ?auto_24718 ) ) ( not ( = ?auto_24719 ?auto_24718 ) ) ( not ( = ?auto_24717 ?auto_24718 ) ) ( AVAILABLE ?auto_24722 ) ( AVAILABLE ?auto_24728 ) ( SURFACE-AT ?auto_24727 ?auto_24721 ) ( ON ?auto_24727 ?auto_24724 ) ( CLEAR ?auto_24727 ) ( not ( = ?auto_24715 ?auto_24724 ) ) ( not ( = ?auto_24716 ?auto_24724 ) ) ( not ( = ?auto_24727 ?auto_24724 ) ) ( not ( = ?auto_24719 ?auto_24724 ) ) ( not ( = ?auto_24717 ?auto_24724 ) ) ( not ( = ?auto_24718 ?auto_24724 ) ) ( TRUCK-AT ?auto_24726 ?auto_24723 ) )
    :subtasks
    ( ( !DRIVE ?auto_24726 ?auto_24723 ?auto_24721 )
      ( MAKE-2CRATE ?auto_24727 ?auto_24715 ?auto_24716 )
      ( MAKE-1CRATE-VERIFY ?auto_24715 ?auto_24716 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24729 - SURFACE
      ?auto_24730 - SURFACE
      ?auto_24731 - SURFACE
    )
    :vars
    (
      ?auto_24733 - HOIST
      ?auto_24741 - PLACE
      ?auto_24738 - PLACE
      ?auto_24736 - HOIST
      ?auto_24737 - SURFACE
      ?auto_24740 - PLACE
      ?auto_24742 - HOIST
      ?auto_24732 - SURFACE
      ?auto_24734 - SURFACE
      ?auto_24735 - SURFACE
      ?auto_24739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24733 ?auto_24741 ) ( IS-CRATE ?auto_24731 ) ( not ( = ?auto_24730 ?auto_24731 ) ) ( not ( = ?auto_24729 ?auto_24730 ) ) ( not ( = ?auto_24729 ?auto_24731 ) ) ( not ( = ?auto_24738 ?auto_24741 ) ) ( HOIST-AT ?auto_24736 ?auto_24738 ) ( not ( = ?auto_24733 ?auto_24736 ) ) ( SURFACE-AT ?auto_24731 ?auto_24738 ) ( ON ?auto_24731 ?auto_24737 ) ( CLEAR ?auto_24731 ) ( not ( = ?auto_24730 ?auto_24737 ) ) ( not ( = ?auto_24731 ?auto_24737 ) ) ( not ( = ?auto_24729 ?auto_24737 ) ) ( IS-CRATE ?auto_24730 ) ( not ( = ?auto_24740 ?auto_24741 ) ) ( not ( = ?auto_24738 ?auto_24740 ) ) ( HOIST-AT ?auto_24742 ?auto_24740 ) ( not ( = ?auto_24733 ?auto_24742 ) ) ( not ( = ?auto_24736 ?auto_24742 ) ) ( AVAILABLE ?auto_24742 ) ( SURFACE-AT ?auto_24730 ?auto_24740 ) ( ON ?auto_24730 ?auto_24732 ) ( CLEAR ?auto_24730 ) ( not ( = ?auto_24730 ?auto_24732 ) ) ( not ( = ?auto_24731 ?auto_24732 ) ) ( not ( = ?auto_24729 ?auto_24732 ) ) ( not ( = ?auto_24737 ?auto_24732 ) ) ( SURFACE-AT ?auto_24734 ?auto_24741 ) ( CLEAR ?auto_24734 ) ( IS-CRATE ?auto_24729 ) ( not ( = ?auto_24734 ?auto_24729 ) ) ( not ( = ?auto_24730 ?auto_24734 ) ) ( not ( = ?auto_24731 ?auto_24734 ) ) ( not ( = ?auto_24737 ?auto_24734 ) ) ( not ( = ?auto_24732 ?auto_24734 ) ) ( AVAILABLE ?auto_24733 ) ( AVAILABLE ?auto_24736 ) ( SURFACE-AT ?auto_24729 ?auto_24738 ) ( ON ?auto_24729 ?auto_24735 ) ( CLEAR ?auto_24729 ) ( not ( = ?auto_24730 ?auto_24735 ) ) ( not ( = ?auto_24731 ?auto_24735 ) ) ( not ( = ?auto_24729 ?auto_24735 ) ) ( not ( = ?auto_24737 ?auto_24735 ) ) ( not ( = ?auto_24732 ?auto_24735 ) ) ( not ( = ?auto_24734 ?auto_24735 ) ) ( TRUCK-AT ?auto_24739 ?auto_24741 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24730 ?auto_24731 )
      ( MAKE-2CRATE-VERIFY ?auto_24729 ?auto_24730 ?auto_24731 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24743 - SURFACE
      ?auto_24744 - SURFACE
      ?auto_24745 - SURFACE
      ?auto_24746 - SURFACE
    )
    :vars
    (
      ?auto_24749 - HOIST
      ?auto_24750 - PLACE
      ?auto_24753 - PLACE
      ?auto_24747 - HOIST
      ?auto_24754 - SURFACE
      ?auto_24748 - PLACE
      ?auto_24752 - HOIST
      ?auto_24751 - SURFACE
      ?auto_24755 - SURFACE
      ?auto_24756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24749 ?auto_24750 ) ( IS-CRATE ?auto_24746 ) ( not ( = ?auto_24745 ?auto_24746 ) ) ( not ( = ?auto_24744 ?auto_24745 ) ) ( not ( = ?auto_24744 ?auto_24746 ) ) ( not ( = ?auto_24753 ?auto_24750 ) ) ( HOIST-AT ?auto_24747 ?auto_24753 ) ( not ( = ?auto_24749 ?auto_24747 ) ) ( SURFACE-AT ?auto_24746 ?auto_24753 ) ( ON ?auto_24746 ?auto_24754 ) ( CLEAR ?auto_24746 ) ( not ( = ?auto_24745 ?auto_24754 ) ) ( not ( = ?auto_24746 ?auto_24754 ) ) ( not ( = ?auto_24744 ?auto_24754 ) ) ( IS-CRATE ?auto_24745 ) ( not ( = ?auto_24748 ?auto_24750 ) ) ( not ( = ?auto_24753 ?auto_24748 ) ) ( HOIST-AT ?auto_24752 ?auto_24748 ) ( not ( = ?auto_24749 ?auto_24752 ) ) ( not ( = ?auto_24747 ?auto_24752 ) ) ( AVAILABLE ?auto_24752 ) ( SURFACE-AT ?auto_24745 ?auto_24748 ) ( ON ?auto_24745 ?auto_24751 ) ( CLEAR ?auto_24745 ) ( not ( = ?auto_24745 ?auto_24751 ) ) ( not ( = ?auto_24746 ?auto_24751 ) ) ( not ( = ?auto_24744 ?auto_24751 ) ) ( not ( = ?auto_24754 ?auto_24751 ) ) ( SURFACE-AT ?auto_24743 ?auto_24750 ) ( CLEAR ?auto_24743 ) ( IS-CRATE ?auto_24744 ) ( not ( = ?auto_24743 ?auto_24744 ) ) ( not ( = ?auto_24745 ?auto_24743 ) ) ( not ( = ?auto_24746 ?auto_24743 ) ) ( not ( = ?auto_24754 ?auto_24743 ) ) ( not ( = ?auto_24751 ?auto_24743 ) ) ( AVAILABLE ?auto_24749 ) ( AVAILABLE ?auto_24747 ) ( SURFACE-AT ?auto_24744 ?auto_24753 ) ( ON ?auto_24744 ?auto_24755 ) ( CLEAR ?auto_24744 ) ( not ( = ?auto_24745 ?auto_24755 ) ) ( not ( = ?auto_24746 ?auto_24755 ) ) ( not ( = ?auto_24744 ?auto_24755 ) ) ( not ( = ?auto_24754 ?auto_24755 ) ) ( not ( = ?auto_24751 ?auto_24755 ) ) ( not ( = ?auto_24743 ?auto_24755 ) ) ( TRUCK-AT ?auto_24756 ?auto_24750 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24744 ?auto_24745 ?auto_24746 )
      ( MAKE-3CRATE-VERIFY ?auto_24743 ?auto_24744 ?auto_24745 ?auto_24746 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24771 - SURFACE
      ?auto_24772 - SURFACE
    )
    :vars
    (
      ?auto_24773 - HOIST
      ?auto_24774 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24773 ?auto_24774 ) ( SURFACE-AT ?auto_24771 ?auto_24774 ) ( CLEAR ?auto_24771 ) ( LIFTING ?auto_24773 ?auto_24772 ) ( IS-CRATE ?auto_24772 ) ( not ( = ?auto_24771 ?auto_24772 ) ) )
    :subtasks
    ( ( !DROP ?auto_24773 ?auto_24772 ?auto_24771 ?auto_24774 )
      ( MAKE-1CRATE-VERIFY ?auto_24771 ?auto_24772 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24775 - SURFACE
      ?auto_24776 - SURFACE
      ?auto_24777 - SURFACE
    )
    :vars
    (
      ?auto_24778 - HOIST
      ?auto_24779 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24778 ?auto_24779 ) ( SURFACE-AT ?auto_24776 ?auto_24779 ) ( CLEAR ?auto_24776 ) ( LIFTING ?auto_24778 ?auto_24777 ) ( IS-CRATE ?auto_24777 ) ( not ( = ?auto_24776 ?auto_24777 ) ) ( ON ?auto_24776 ?auto_24775 ) ( not ( = ?auto_24775 ?auto_24776 ) ) ( not ( = ?auto_24775 ?auto_24777 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24776 ?auto_24777 )
      ( MAKE-2CRATE-VERIFY ?auto_24775 ?auto_24776 ?auto_24777 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24780 - SURFACE
      ?auto_24781 - SURFACE
      ?auto_24782 - SURFACE
      ?auto_24783 - SURFACE
    )
    :vars
    (
      ?auto_24784 - HOIST
      ?auto_24785 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24784 ?auto_24785 ) ( SURFACE-AT ?auto_24782 ?auto_24785 ) ( CLEAR ?auto_24782 ) ( LIFTING ?auto_24784 ?auto_24783 ) ( IS-CRATE ?auto_24783 ) ( not ( = ?auto_24782 ?auto_24783 ) ) ( ON ?auto_24781 ?auto_24780 ) ( ON ?auto_24782 ?auto_24781 ) ( not ( = ?auto_24780 ?auto_24781 ) ) ( not ( = ?auto_24780 ?auto_24782 ) ) ( not ( = ?auto_24780 ?auto_24783 ) ) ( not ( = ?auto_24781 ?auto_24782 ) ) ( not ( = ?auto_24781 ?auto_24783 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24782 ?auto_24783 )
      ( MAKE-3CRATE-VERIFY ?auto_24780 ?auto_24781 ?auto_24782 ?auto_24783 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_24786 - SURFACE
      ?auto_24787 - SURFACE
      ?auto_24788 - SURFACE
      ?auto_24789 - SURFACE
      ?auto_24790 - SURFACE
    )
    :vars
    (
      ?auto_24791 - HOIST
      ?auto_24792 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24791 ?auto_24792 ) ( SURFACE-AT ?auto_24789 ?auto_24792 ) ( CLEAR ?auto_24789 ) ( LIFTING ?auto_24791 ?auto_24790 ) ( IS-CRATE ?auto_24790 ) ( not ( = ?auto_24789 ?auto_24790 ) ) ( ON ?auto_24787 ?auto_24786 ) ( ON ?auto_24788 ?auto_24787 ) ( ON ?auto_24789 ?auto_24788 ) ( not ( = ?auto_24786 ?auto_24787 ) ) ( not ( = ?auto_24786 ?auto_24788 ) ) ( not ( = ?auto_24786 ?auto_24789 ) ) ( not ( = ?auto_24786 ?auto_24790 ) ) ( not ( = ?auto_24787 ?auto_24788 ) ) ( not ( = ?auto_24787 ?auto_24789 ) ) ( not ( = ?auto_24787 ?auto_24790 ) ) ( not ( = ?auto_24788 ?auto_24789 ) ) ( not ( = ?auto_24788 ?auto_24790 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24789 ?auto_24790 )
      ( MAKE-4CRATE-VERIFY ?auto_24786 ?auto_24787 ?auto_24788 ?auto_24789 ?auto_24790 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24793 - SURFACE
      ?auto_24794 - SURFACE
    )
    :vars
    (
      ?auto_24795 - HOIST
      ?auto_24796 - PLACE
      ?auto_24797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24795 ?auto_24796 ) ( SURFACE-AT ?auto_24793 ?auto_24796 ) ( CLEAR ?auto_24793 ) ( IS-CRATE ?auto_24794 ) ( not ( = ?auto_24793 ?auto_24794 ) ) ( TRUCK-AT ?auto_24797 ?auto_24796 ) ( AVAILABLE ?auto_24795 ) ( IN ?auto_24794 ?auto_24797 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24795 ?auto_24794 ?auto_24797 ?auto_24796 )
      ( MAKE-1CRATE ?auto_24793 ?auto_24794 )
      ( MAKE-1CRATE-VERIFY ?auto_24793 ?auto_24794 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24798 - SURFACE
      ?auto_24799 - SURFACE
      ?auto_24800 - SURFACE
    )
    :vars
    (
      ?auto_24801 - HOIST
      ?auto_24802 - PLACE
      ?auto_24803 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24801 ?auto_24802 ) ( SURFACE-AT ?auto_24799 ?auto_24802 ) ( CLEAR ?auto_24799 ) ( IS-CRATE ?auto_24800 ) ( not ( = ?auto_24799 ?auto_24800 ) ) ( TRUCK-AT ?auto_24803 ?auto_24802 ) ( AVAILABLE ?auto_24801 ) ( IN ?auto_24800 ?auto_24803 ) ( ON ?auto_24799 ?auto_24798 ) ( not ( = ?auto_24798 ?auto_24799 ) ) ( not ( = ?auto_24798 ?auto_24800 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24799 ?auto_24800 )
      ( MAKE-2CRATE-VERIFY ?auto_24798 ?auto_24799 ?auto_24800 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24804 - SURFACE
      ?auto_24805 - SURFACE
      ?auto_24806 - SURFACE
      ?auto_24807 - SURFACE
    )
    :vars
    (
      ?auto_24809 - HOIST
      ?auto_24810 - PLACE
      ?auto_24808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24809 ?auto_24810 ) ( SURFACE-AT ?auto_24806 ?auto_24810 ) ( CLEAR ?auto_24806 ) ( IS-CRATE ?auto_24807 ) ( not ( = ?auto_24806 ?auto_24807 ) ) ( TRUCK-AT ?auto_24808 ?auto_24810 ) ( AVAILABLE ?auto_24809 ) ( IN ?auto_24807 ?auto_24808 ) ( ON ?auto_24806 ?auto_24805 ) ( not ( = ?auto_24805 ?auto_24806 ) ) ( not ( = ?auto_24805 ?auto_24807 ) ) ( ON ?auto_24805 ?auto_24804 ) ( not ( = ?auto_24804 ?auto_24805 ) ) ( not ( = ?auto_24804 ?auto_24806 ) ) ( not ( = ?auto_24804 ?auto_24807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24805 ?auto_24806 ?auto_24807 )
      ( MAKE-3CRATE-VERIFY ?auto_24804 ?auto_24805 ?auto_24806 ?auto_24807 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_24811 - SURFACE
      ?auto_24812 - SURFACE
      ?auto_24813 - SURFACE
      ?auto_24814 - SURFACE
      ?auto_24815 - SURFACE
    )
    :vars
    (
      ?auto_24817 - HOIST
      ?auto_24818 - PLACE
      ?auto_24816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24817 ?auto_24818 ) ( SURFACE-AT ?auto_24814 ?auto_24818 ) ( CLEAR ?auto_24814 ) ( IS-CRATE ?auto_24815 ) ( not ( = ?auto_24814 ?auto_24815 ) ) ( TRUCK-AT ?auto_24816 ?auto_24818 ) ( AVAILABLE ?auto_24817 ) ( IN ?auto_24815 ?auto_24816 ) ( ON ?auto_24814 ?auto_24813 ) ( not ( = ?auto_24813 ?auto_24814 ) ) ( not ( = ?auto_24813 ?auto_24815 ) ) ( ON ?auto_24812 ?auto_24811 ) ( ON ?auto_24813 ?auto_24812 ) ( not ( = ?auto_24811 ?auto_24812 ) ) ( not ( = ?auto_24811 ?auto_24813 ) ) ( not ( = ?auto_24811 ?auto_24814 ) ) ( not ( = ?auto_24811 ?auto_24815 ) ) ( not ( = ?auto_24812 ?auto_24813 ) ) ( not ( = ?auto_24812 ?auto_24814 ) ) ( not ( = ?auto_24812 ?auto_24815 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24813 ?auto_24814 ?auto_24815 )
      ( MAKE-4CRATE-VERIFY ?auto_24811 ?auto_24812 ?auto_24813 ?auto_24814 ?auto_24815 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24819 - SURFACE
      ?auto_24820 - SURFACE
    )
    :vars
    (
      ?auto_24823 - HOIST
      ?auto_24824 - PLACE
      ?auto_24822 - TRUCK
      ?auto_24821 - SURFACE
      ?auto_24825 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24823 ?auto_24824 ) ( SURFACE-AT ?auto_24819 ?auto_24824 ) ( CLEAR ?auto_24819 ) ( IS-CRATE ?auto_24820 ) ( not ( = ?auto_24819 ?auto_24820 ) ) ( AVAILABLE ?auto_24823 ) ( IN ?auto_24820 ?auto_24822 ) ( ON ?auto_24819 ?auto_24821 ) ( not ( = ?auto_24821 ?auto_24819 ) ) ( not ( = ?auto_24821 ?auto_24820 ) ) ( TRUCK-AT ?auto_24822 ?auto_24825 ) ( not ( = ?auto_24825 ?auto_24824 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24822 ?auto_24825 ?auto_24824 )
      ( MAKE-2CRATE ?auto_24821 ?auto_24819 ?auto_24820 )
      ( MAKE-1CRATE-VERIFY ?auto_24819 ?auto_24820 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24826 - SURFACE
      ?auto_24827 - SURFACE
      ?auto_24828 - SURFACE
    )
    :vars
    (
      ?auto_24830 - HOIST
      ?auto_24832 - PLACE
      ?auto_24831 - TRUCK
      ?auto_24829 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24830 ?auto_24832 ) ( SURFACE-AT ?auto_24827 ?auto_24832 ) ( CLEAR ?auto_24827 ) ( IS-CRATE ?auto_24828 ) ( not ( = ?auto_24827 ?auto_24828 ) ) ( AVAILABLE ?auto_24830 ) ( IN ?auto_24828 ?auto_24831 ) ( ON ?auto_24827 ?auto_24826 ) ( not ( = ?auto_24826 ?auto_24827 ) ) ( not ( = ?auto_24826 ?auto_24828 ) ) ( TRUCK-AT ?auto_24831 ?auto_24829 ) ( not ( = ?auto_24829 ?auto_24832 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24827 ?auto_24828 )
      ( MAKE-2CRATE-VERIFY ?auto_24826 ?auto_24827 ?auto_24828 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24833 - SURFACE
      ?auto_24834 - SURFACE
      ?auto_24835 - SURFACE
      ?auto_24836 - SURFACE
    )
    :vars
    (
      ?auto_24837 - HOIST
      ?auto_24838 - PLACE
      ?auto_24839 - TRUCK
      ?auto_24840 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24837 ?auto_24838 ) ( SURFACE-AT ?auto_24835 ?auto_24838 ) ( CLEAR ?auto_24835 ) ( IS-CRATE ?auto_24836 ) ( not ( = ?auto_24835 ?auto_24836 ) ) ( AVAILABLE ?auto_24837 ) ( IN ?auto_24836 ?auto_24839 ) ( ON ?auto_24835 ?auto_24834 ) ( not ( = ?auto_24834 ?auto_24835 ) ) ( not ( = ?auto_24834 ?auto_24836 ) ) ( TRUCK-AT ?auto_24839 ?auto_24840 ) ( not ( = ?auto_24840 ?auto_24838 ) ) ( ON ?auto_24834 ?auto_24833 ) ( not ( = ?auto_24833 ?auto_24834 ) ) ( not ( = ?auto_24833 ?auto_24835 ) ) ( not ( = ?auto_24833 ?auto_24836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24834 ?auto_24835 ?auto_24836 )
      ( MAKE-3CRATE-VERIFY ?auto_24833 ?auto_24834 ?auto_24835 ?auto_24836 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_24841 - SURFACE
      ?auto_24842 - SURFACE
      ?auto_24843 - SURFACE
      ?auto_24844 - SURFACE
      ?auto_24845 - SURFACE
    )
    :vars
    (
      ?auto_24846 - HOIST
      ?auto_24847 - PLACE
      ?auto_24848 - TRUCK
      ?auto_24849 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24846 ?auto_24847 ) ( SURFACE-AT ?auto_24844 ?auto_24847 ) ( CLEAR ?auto_24844 ) ( IS-CRATE ?auto_24845 ) ( not ( = ?auto_24844 ?auto_24845 ) ) ( AVAILABLE ?auto_24846 ) ( IN ?auto_24845 ?auto_24848 ) ( ON ?auto_24844 ?auto_24843 ) ( not ( = ?auto_24843 ?auto_24844 ) ) ( not ( = ?auto_24843 ?auto_24845 ) ) ( TRUCK-AT ?auto_24848 ?auto_24849 ) ( not ( = ?auto_24849 ?auto_24847 ) ) ( ON ?auto_24842 ?auto_24841 ) ( ON ?auto_24843 ?auto_24842 ) ( not ( = ?auto_24841 ?auto_24842 ) ) ( not ( = ?auto_24841 ?auto_24843 ) ) ( not ( = ?auto_24841 ?auto_24844 ) ) ( not ( = ?auto_24841 ?auto_24845 ) ) ( not ( = ?auto_24842 ?auto_24843 ) ) ( not ( = ?auto_24842 ?auto_24844 ) ) ( not ( = ?auto_24842 ?auto_24845 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24843 ?auto_24844 ?auto_24845 )
      ( MAKE-4CRATE-VERIFY ?auto_24841 ?auto_24842 ?auto_24843 ?auto_24844 ?auto_24845 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24850 - SURFACE
      ?auto_24851 - SURFACE
    )
    :vars
    (
      ?auto_24852 - HOIST
      ?auto_24853 - PLACE
      ?auto_24854 - SURFACE
      ?auto_24855 - TRUCK
      ?auto_24856 - PLACE
      ?auto_24857 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24852 ?auto_24853 ) ( SURFACE-AT ?auto_24850 ?auto_24853 ) ( CLEAR ?auto_24850 ) ( IS-CRATE ?auto_24851 ) ( not ( = ?auto_24850 ?auto_24851 ) ) ( AVAILABLE ?auto_24852 ) ( ON ?auto_24850 ?auto_24854 ) ( not ( = ?auto_24854 ?auto_24850 ) ) ( not ( = ?auto_24854 ?auto_24851 ) ) ( TRUCK-AT ?auto_24855 ?auto_24856 ) ( not ( = ?auto_24856 ?auto_24853 ) ) ( HOIST-AT ?auto_24857 ?auto_24856 ) ( LIFTING ?auto_24857 ?auto_24851 ) ( not ( = ?auto_24852 ?auto_24857 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24857 ?auto_24851 ?auto_24855 ?auto_24856 )
      ( MAKE-2CRATE ?auto_24854 ?auto_24850 ?auto_24851 )
      ( MAKE-1CRATE-VERIFY ?auto_24850 ?auto_24851 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24858 - SURFACE
      ?auto_24859 - SURFACE
      ?auto_24860 - SURFACE
    )
    :vars
    (
      ?auto_24861 - HOIST
      ?auto_24863 - PLACE
      ?auto_24864 - TRUCK
      ?auto_24862 - PLACE
      ?auto_24865 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24861 ?auto_24863 ) ( SURFACE-AT ?auto_24859 ?auto_24863 ) ( CLEAR ?auto_24859 ) ( IS-CRATE ?auto_24860 ) ( not ( = ?auto_24859 ?auto_24860 ) ) ( AVAILABLE ?auto_24861 ) ( ON ?auto_24859 ?auto_24858 ) ( not ( = ?auto_24858 ?auto_24859 ) ) ( not ( = ?auto_24858 ?auto_24860 ) ) ( TRUCK-AT ?auto_24864 ?auto_24862 ) ( not ( = ?auto_24862 ?auto_24863 ) ) ( HOIST-AT ?auto_24865 ?auto_24862 ) ( LIFTING ?auto_24865 ?auto_24860 ) ( not ( = ?auto_24861 ?auto_24865 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24859 ?auto_24860 )
      ( MAKE-2CRATE-VERIFY ?auto_24858 ?auto_24859 ?auto_24860 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24866 - SURFACE
      ?auto_24867 - SURFACE
      ?auto_24868 - SURFACE
      ?auto_24869 - SURFACE
    )
    :vars
    (
      ?auto_24870 - HOIST
      ?auto_24874 - PLACE
      ?auto_24873 - TRUCK
      ?auto_24872 - PLACE
      ?auto_24871 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24870 ?auto_24874 ) ( SURFACE-AT ?auto_24868 ?auto_24874 ) ( CLEAR ?auto_24868 ) ( IS-CRATE ?auto_24869 ) ( not ( = ?auto_24868 ?auto_24869 ) ) ( AVAILABLE ?auto_24870 ) ( ON ?auto_24868 ?auto_24867 ) ( not ( = ?auto_24867 ?auto_24868 ) ) ( not ( = ?auto_24867 ?auto_24869 ) ) ( TRUCK-AT ?auto_24873 ?auto_24872 ) ( not ( = ?auto_24872 ?auto_24874 ) ) ( HOIST-AT ?auto_24871 ?auto_24872 ) ( LIFTING ?auto_24871 ?auto_24869 ) ( not ( = ?auto_24870 ?auto_24871 ) ) ( ON ?auto_24867 ?auto_24866 ) ( not ( = ?auto_24866 ?auto_24867 ) ) ( not ( = ?auto_24866 ?auto_24868 ) ) ( not ( = ?auto_24866 ?auto_24869 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24867 ?auto_24868 ?auto_24869 )
      ( MAKE-3CRATE-VERIFY ?auto_24866 ?auto_24867 ?auto_24868 ?auto_24869 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_24875 - SURFACE
      ?auto_24876 - SURFACE
      ?auto_24877 - SURFACE
      ?auto_24878 - SURFACE
      ?auto_24879 - SURFACE
    )
    :vars
    (
      ?auto_24880 - HOIST
      ?auto_24884 - PLACE
      ?auto_24883 - TRUCK
      ?auto_24882 - PLACE
      ?auto_24881 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24880 ?auto_24884 ) ( SURFACE-AT ?auto_24878 ?auto_24884 ) ( CLEAR ?auto_24878 ) ( IS-CRATE ?auto_24879 ) ( not ( = ?auto_24878 ?auto_24879 ) ) ( AVAILABLE ?auto_24880 ) ( ON ?auto_24878 ?auto_24877 ) ( not ( = ?auto_24877 ?auto_24878 ) ) ( not ( = ?auto_24877 ?auto_24879 ) ) ( TRUCK-AT ?auto_24883 ?auto_24882 ) ( not ( = ?auto_24882 ?auto_24884 ) ) ( HOIST-AT ?auto_24881 ?auto_24882 ) ( LIFTING ?auto_24881 ?auto_24879 ) ( not ( = ?auto_24880 ?auto_24881 ) ) ( ON ?auto_24876 ?auto_24875 ) ( ON ?auto_24877 ?auto_24876 ) ( not ( = ?auto_24875 ?auto_24876 ) ) ( not ( = ?auto_24875 ?auto_24877 ) ) ( not ( = ?auto_24875 ?auto_24878 ) ) ( not ( = ?auto_24875 ?auto_24879 ) ) ( not ( = ?auto_24876 ?auto_24877 ) ) ( not ( = ?auto_24876 ?auto_24878 ) ) ( not ( = ?auto_24876 ?auto_24879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24877 ?auto_24878 ?auto_24879 )
      ( MAKE-4CRATE-VERIFY ?auto_24875 ?auto_24876 ?auto_24877 ?auto_24878 ?auto_24879 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24885 - SURFACE
      ?auto_24886 - SURFACE
    )
    :vars
    (
      ?auto_24887 - HOIST
      ?auto_24892 - PLACE
      ?auto_24891 - SURFACE
      ?auto_24890 - TRUCK
      ?auto_24889 - PLACE
      ?auto_24888 - HOIST
      ?auto_24893 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24887 ?auto_24892 ) ( SURFACE-AT ?auto_24885 ?auto_24892 ) ( CLEAR ?auto_24885 ) ( IS-CRATE ?auto_24886 ) ( not ( = ?auto_24885 ?auto_24886 ) ) ( AVAILABLE ?auto_24887 ) ( ON ?auto_24885 ?auto_24891 ) ( not ( = ?auto_24891 ?auto_24885 ) ) ( not ( = ?auto_24891 ?auto_24886 ) ) ( TRUCK-AT ?auto_24890 ?auto_24889 ) ( not ( = ?auto_24889 ?auto_24892 ) ) ( HOIST-AT ?auto_24888 ?auto_24889 ) ( not ( = ?auto_24887 ?auto_24888 ) ) ( AVAILABLE ?auto_24888 ) ( SURFACE-AT ?auto_24886 ?auto_24889 ) ( ON ?auto_24886 ?auto_24893 ) ( CLEAR ?auto_24886 ) ( not ( = ?auto_24885 ?auto_24893 ) ) ( not ( = ?auto_24886 ?auto_24893 ) ) ( not ( = ?auto_24891 ?auto_24893 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24888 ?auto_24886 ?auto_24893 ?auto_24889 )
      ( MAKE-2CRATE ?auto_24891 ?auto_24885 ?auto_24886 )
      ( MAKE-1CRATE-VERIFY ?auto_24885 ?auto_24886 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24894 - SURFACE
      ?auto_24895 - SURFACE
      ?auto_24896 - SURFACE
    )
    :vars
    (
      ?auto_24898 - HOIST
      ?auto_24897 - PLACE
      ?auto_24900 - TRUCK
      ?auto_24899 - PLACE
      ?auto_24901 - HOIST
      ?auto_24902 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24898 ?auto_24897 ) ( SURFACE-AT ?auto_24895 ?auto_24897 ) ( CLEAR ?auto_24895 ) ( IS-CRATE ?auto_24896 ) ( not ( = ?auto_24895 ?auto_24896 ) ) ( AVAILABLE ?auto_24898 ) ( ON ?auto_24895 ?auto_24894 ) ( not ( = ?auto_24894 ?auto_24895 ) ) ( not ( = ?auto_24894 ?auto_24896 ) ) ( TRUCK-AT ?auto_24900 ?auto_24899 ) ( not ( = ?auto_24899 ?auto_24897 ) ) ( HOIST-AT ?auto_24901 ?auto_24899 ) ( not ( = ?auto_24898 ?auto_24901 ) ) ( AVAILABLE ?auto_24901 ) ( SURFACE-AT ?auto_24896 ?auto_24899 ) ( ON ?auto_24896 ?auto_24902 ) ( CLEAR ?auto_24896 ) ( not ( = ?auto_24895 ?auto_24902 ) ) ( not ( = ?auto_24896 ?auto_24902 ) ) ( not ( = ?auto_24894 ?auto_24902 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24895 ?auto_24896 )
      ( MAKE-2CRATE-VERIFY ?auto_24894 ?auto_24895 ?auto_24896 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24903 - SURFACE
      ?auto_24904 - SURFACE
      ?auto_24905 - SURFACE
      ?auto_24906 - SURFACE
    )
    :vars
    (
      ?auto_24911 - HOIST
      ?auto_24907 - PLACE
      ?auto_24908 - TRUCK
      ?auto_24910 - PLACE
      ?auto_24912 - HOIST
      ?auto_24909 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24911 ?auto_24907 ) ( SURFACE-AT ?auto_24905 ?auto_24907 ) ( CLEAR ?auto_24905 ) ( IS-CRATE ?auto_24906 ) ( not ( = ?auto_24905 ?auto_24906 ) ) ( AVAILABLE ?auto_24911 ) ( ON ?auto_24905 ?auto_24904 ) ( not ( = ?auto_24904 ?auto_24905 ) ) ( not ( = ?auto_24904 ?auto_24906 ) ) ( TRUCK-AT ?auto_24908 ?auto_24910 ) ( not ( = ?auto_24910 ?auto_24907 ) ) ( HOIST-AT ?auto_24912 ?auto_24910 ) ( not ( = ?auto_24911 ?auto_24912 ) ) ( AVAILABLE ?auto_24912 ) ( SURFACE-AT ?auto_24906 ?auto_24910 ) ( ON ?auto_24906 ?auto_24909 ) ( CLEAR ?auto_24906 ) ( not ( = ?auto_24905 ?auto_24909 ) ) ( not ( = ?auto_24906 ?auto_24909 ) ) ( not ( = ?auto_24904 ?auto_24909 ) ) ( ON ?auto_24904 ?auto_24903 ) ( not ( = ?auto_24903 ?auto_24904 ) ) ( not ( = ?auto_24903 ?auto_24905 ) ) ( not ( = ?auto_24903 ?auto_24906 ) ) ( not ( = ?auto_24903 ?auto_24909 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24904 ?auto_24905 ?auto_24906 )
      ( MAKE-3CRATE-VERIFY ?auto_24903 ?auto_24904 ?auto_24905 ?auto_24906 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_24913 - SURFACE
      ?auto_24914 - SURFACE
      ?auto_24915 - SURFACE
      ?auto_24916 - SURFACE
      ?auto_24917 - SURFACE
    )
    :vars
    (
      ?auto_24922 - HOIST
      ?auto_24918 - PLACE
      ?auto_24919 - TRUCK
      ?auto_24921 - PLACE
      ?auto_24923 - HOIST
      ?auto_24920 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24922 ?auto_24918 ) ( SURFACE-AT ?auto_24916 ?auto_24918 ) ( CLEAR ?auto_24916 ) ( IS-CRATE ?auto_24917 ) ( not ( = ?auto_24916 ?auto_24917 ) ) ( AVAILABLE ?auto_24922 ) ( ON ?auto_24916 ?auto_24915 ) ( not ( = ?auto_24915 ?auto_24916 ) ) ( not ( = ?auto_24915 ?auto_24917 ) ) ( TRUCK-AT ?auto_24919 ?auto_24921 ) ( not ( = ?auto_24921 ?auto_24918 ) ) ( HOIST-AT ?auto_24923 ?auto_24921 ) ( not ( = ?auto_24922 ?auto_24923 ) ) ( AVAILABLE ?auto_24923 ) ( SURFACE-AT ?auto_24917 ?auto_24921 ) ( ON ?auto_24917 ?auto_24920 ) ( CLEAR ?auto_24917 ) ( not ( = ?auto_24916 ?auto_24920 ) ) ( not ( = ?auto_24917 ?auto_24920 ) ) ( not ( = ?auto_24915 ?auto_24920 ) ) ( ON ?auto_24914 ?auto_24913 ) ( ON ?auto_24915 ?auto_24914 ) ( not ( = ?auto_24913 ?auto_24914 ) ) ( not ( = ?auto_24913 ?auto_24915 ) ) ( not ( = ?auto_24913 ?auto_24916 ) ) ( not ( = ?auto_24913 ?auto_24917 ) ) ( not ( = ?auto_24913 ?auto_24920 ) ) ( not ( = ?auto_24914 ?auto_24915 ) ) ( not ( = ?auto_24914 ?auto_24916 ) ) ( not ( = ?auto_24914 ?auto_24917 ) ) ( not ( = ?auto_24914 ?auto_24920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24915 ?auto_24916 ?auto_24917 )
      ( MAKE-4CRATE-VERIFY ?auto_24913 ?auto_24914 ?auto_24915 ?auto_24916 ?auto_24917 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24924 - SURFACE
      ?auto_24925 - SURFACE
    )
    :vars
    (
      ?auto_24930 - HOIST
      ?auto_24926 - PLACE
      ?auto_24931 - SURFACE
      ?auto_24929 - PLACE
      ?auto_24932 - HOIST
      ?auto_24928 - SURFACE
      ?auto_24927 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24930 ?auto_24926 ) ( SURFACE-AT ?auto_24924 ?auto_24926 ) ( CLEAR ?auto_24924 ) ( IS-CRATE ?auto_24925 ) ( not ( = ?auto_24924 ?auto_24925 ) ) ( AVAILABLE ?auto_24930 ) ( ON ?auto_24924 ?auto_24931 ) ( not ( = ?auto_24931 ?auto_24924 ) ) ( not ( = ?auto_24931 ?auto_24925 ) ) ( not ( = ?auto_24929 ?auto_24926 ) ) ( HOIST-AT ?auto_24932 ?auto_24929 ) ( not ( = ?auto_24930 ?auto_24932 ) ) ( AVAILABLE ?auto_24932 ) ( SURFACE-AT ?auto_24925 ?auto_24929 ) ( ON ?auto_24925 ?auto_24928 ) ( CLEAR ?auto_24925 ) ( not ( = ?auto_24924 ?auto_24928 ) ) ( not ( = ?auto_24925 ?auto_24928 ) ) ( not ( = ?auto_24931 ?auto_24928 ) ) ( TRUCK-AT ?auto_24927 ?auto_24926 ) )
    :subtasks
    ( ( !DRIVE ?auto_24927 ?auto_24926 ?auto_24929 )
      ( MAKE-2CRATE ?auto_24931 ?auto_24924 ?auto_24925 )
      ( MAKE-1CRATE-VERIFY ?auto_24924 ?auto_24925 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24933 - SURFACE
      ?auto_24934 - SURFACE
      ?auto_24935 - SURFACE
    )
    :vars
    (
      ?auto_24936 - HOIST
      ?auto_24939 - PLACE
      ?auto_24937 - PLACE
      ?auto_24938 - HOIST
      ?auto_24940 - SURFACE
      ?auto_24941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24936 ?auto_24939 ) ( SURFACE-AT ?auto_24934 ?auto_24939 ) ( CLEAR ?auto_24934 ) ( IS-CRATE ?auto_24935 ) ( not ( = ?auto_24934 ?auto_24935 ) ) ( AVAILABLE ?auto_24936 ) ( ON ?auto_24934 ?auto_24933 ) ( not ( = ?auto_24933 ?auto_24934 ) ) ( not ( = ?auto_24933 ?auto_24935 ) ) ( not ( = ?auto_24937 ?auto_24939 ) ) ( HOIST-AT ?auto_24938 ?auto_24937 ) ( not ( = ?auto_24936 ?auto_24938 ) ) ( AVAILABLE ?auto_24938 ) ( SURFACE-AT ?auto_24935 ?auto_24937 ) ( ON ?auto_24935 ?auto_24940 ) ( CLEAR ?auto_24935 ) ( not ( = ?auto_24934 ?auto_24940 ) ) ( not ( = ?auto_24935 ?auto_24940 ) ) ( not ( = ?auto_24933 ?auto_24940 ) ) ( TRUCK-AT ?auto_24941 ?auto_24939 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24934 ?auto_24935 )
      ( MAKE-2CRATE-VERIFY ?auto_24933 ?auto_24934 ?auto_24935 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24942 - SURFACE
      ?auto_24943 - SURFACE
      ?auto_24944 - SURFACE
      ?auto_24945 - SURFACE
    )
    :vars
    (
      ?auto_24950 - HOIST
      ?auto_24951 - PLACE
      ?auto_24947 - PLACE
      ?auto_24946 - HOIST
      ?auto_24949 - SURFACE
      ?auto_24948 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24950 ?auto_24951 ) ( SURFACE-AT ?auto_24944 ?auto_24951 ) ( CLEAR ?auto_24944 ) ( IS-CRATE ?auto_24945 ) ( not ( = ?auto_24944 ?auto_24945 ) ) ( AVAILABLE ?auto_24950 ) ( ON ?auto_24944 ?auto_24943 ) ( not ( = ?auto_24943 ?auto_24944 ) ) ( not ( = ?auto_24943 ?auto_24945 ) ) ( not ( = ?auto_24947 ?auto_24951 ) ) ( HOIST-AT ?auto_24946 ?auto_24947 ) ( not ( = ?auto_24950 ?auto_24946 ) ) ( AVAILABLE ?auto_24946 ) ( SURFACE-AT ?auto_24945 ?auto_24947 ) ( ON ?auto_24945 ?auto_24949 ) ( CLEAR ?auto_24945 ) ( not ( = ?auto_24944 ?auto_24949 ) ) ( not ( = ?auto_24945 ?auto_24949 ) ) ( not ( = ?auto_24943 ?auto_24949 ) ) ( TRUCK-AT ?auto_24948 ?auto_24951 ) ( ON ?auto_24943 ?auto_24942 ) ( not ( = ?auto_24942 ?auto_24943 ) ) ( not ( = ?auto_24942 ?auto_24944 ) ) ( not ( = ?auto_24942 ?auto_24945 ) ) ( not ( = ?auto_24942 ?auto_24949 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24943 ?auto_24944 ?auto_24945 )
      ( MAKE-3CRATE-VERIFY ?auto_24942 ?auto_24943 ?auto_24944 ?auto_24945 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_24952 - SURFACE
      ?auto_24953 - SURFACE
      ?auto_24954 - SURFACE
      ?auto_24955 - SURFACE
      ?auto_24956 - SURFACE
    )
    :vars
    (
      ?auto_24961 - HOIST
      ?auto_24962 - PLACE
      ?auto_24958 - PLACE
      ?auto_24957 - HOIST
      ?auto_24960 - SURFACE
      ?auto_24959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24961 ?auto_24962 ) ( SURFACE-AT ?auto_24955 ?auto_24962 ) ( CLEAR ?auto_24955 ) ( IS-CRATE ?auto_24956 ) ( not ( = ?auto_24955 ?auto_24956 ) ) ( AVAILABLE ?auto_24961 ) ( ON ?auto_24955 ?auto_24954 ) ( not ( = ?auto_24954 ?auto_24955 ) ) ( not ( = ?auto_24954 ?auto_24956 ) ) ( not ( = ?auto_24958 ?auto_24962 ) ) ( HOIST-AT ?auto_24957 ?auto_24958 ) ( not ( = ?auto_24961 ?auto_24957 ) ) ( AVAILABLE ?auto_24957 ) ( SURFACE-AT ?auto_24956 ?auto_24958 ) ( ON ?auto_24956 ?auto_24960 ) ( CLEAR ?auto_24956 ) ( not ( = ?auto_24955 ?auto_24960 ) ) ( not ( = ?auto_24956 ?auto_24960 ) ) ( not ( = ?auto_24954 ?auto_24960 ) ) ( TRUCK-AT ?auto_24959 ?auto_24962 ) ( ON ?auto_24953 ?auto_24952 ) ( ON ?auto_24954 ?auto_24953 ) ( not ( = ?auto_24952 ?auto_24953 ) ) ( not ( = ?auto_24952 ?auto_24954 ) ) ( not ( = ?auto_24952 ?auto_24955 ) ) ( not ( = ?auto_24952 ?auto_24956 ) ) ( not ( = ?auto_24952 ?auto_24960 ) ) ( not ( = ?auto_24953 ?auto_24954 ) ) ( not ( = ?auto_24953 ?auto_24955 ) ) ( not ( = ?auto_24953 ?auto_24956 ) ) ( not ( = ?auto_24953 ?auto_24960 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24954 ?auto_24955 ?auto_24956 )
      ( MAKE-4CRATE-VERIFY ?auto_24952 ?auto_24953 ?auto_24954 ?auto_24955 ?auto_24956 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24963 - SURFACE
      ?auto_24964 - SURFACE
    )
    :vars
    (
      ?auto_24970 - HOIST
      ?auto_24971 - PLACE
      ?auto_24966 - SURFACE
      ?auto_24967 - PLACE
      ?auto_24965 - HOIST
      ?auto_24969 - SURFACE
      ?auto_24968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24970 ?auto_24971 ) ( IS-CRATE ?auto_24964 ) ( not ( = ?auto_24963 ?auto_24964 ) ) ( not ( = ?auto_24966 ?auto_24963 ) ) ( not ( = ?auto_24966 ?auto_24964 ) ) ( not ( = ?auto_24967 ?auto_24971 ) ) ( HOIST-AT ?auto_24965 ?auto_24967 ) ( not ( = ?auto_24970 ?auto_24965 ) ) ( AVAILABLE ?auto_24965 ) ( SURFACE-AT ?auto_24964 ?auto_24967 ) ( ON ?auto_24964 ?auto_24969 ) ( CLEAR ?auto_24964 ) ( not ( = ?auto_24963 ?auto_24969 ) ) ( not ( = ?auto_24964 ?auto_24969 ) ) ( not ( = ?auto_24966 ?auto_24969 ) ) ( TRUCK-AT ?auto_24968 ?auto_24971 ) ( SURFACE-AT ?auto_24966 ?auto_24971 ) ( CLEAR ?auto_24966 ) ( LIFTING ?auto_24970 ?auto_24963 ) ( IS-CRATE ?auto_24963 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24966 ?auto_24963 )
      ( MAKE-2CRATE ?auto_24966 ?auto_24963 ?auto_24964 )
      ( MAKE-1CRATE-VERIFY ?auto_24963 ?auto_24964 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24972 - SURFACE
      ?auto_24973 - SURFACE
      ?auto_24974 - SURFACE
    )
    :vars
    (
      ?auto_24979 - HOIST
      ?auto_24980 - PLACE
      ?auto_24977 - PLACE
      ?auto_24978 - HOIST
      ?auto_24975 - SURFACE
      ?auto_24976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24979 ?auto_24980 ) ( IS-CRATE ?auto_24974 ) ( not ( = ?auto_24973 ?auto_24974 ) ) ( not ( = ?auto_24972 ?auto_24973 ) ) ( not ( = ?auto_24972 ?auto_24974 ) ) ( not ( = ?auto_24977 ?auto_24980 ) ) ( HOIST-AT ?auto_24978 ?auto_24977 ) ( not ( = ?auto_24979 ?auto_24978 ) ) ( AVAILABLE ?auto_24978 ) ( SURFACE-AT ?auto_24974 ?auto_24977 ) ( ON ?auto_24974 ?auto_24975 ) ( CLEAR ?auto_24974 ) ( not ( = ?auto_24973 ?auto_24975 ) ) ( not ( = ?auto_24974 ?auto_24975 ) ) ( not ( = ?auto_24972 ?auto_24975 ) ) ( TRUCK-AT ?auto_24976 ?auto_24980 ) ( SURFACE-AT ?auto_24972 ?auto_24980 ) ( CLEAR ?auto_24972 ) ( LIFTING ?auto_24979 ?auto_24973 ) ( IS-CRATE ?auto_24973 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24973 ?auto_24974 )
      ( MAKE-2CRATE-VERIFY ?auto_24972 ?auto_24973 ?auto_24974 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24981 - SURFACE
      ?auto_24982 - SURFACE
      ?auto_24983 - SURFACE
      ?auto_24984 - SURFACE
    )
    :vars
    (
      ?auto_24988 - HOIST
      ?auto_24990 - PLACE
      ?auto_24989 - PLACE
      ?auto_24987 - HOIST
      ?auto_24985 - SURFACE
      ?auto_24986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24988 ?auto_24990 ) ( IS-CRATE ?auto_24984 ) ( not ( = ?auto_24983 ?auto_24984 ) ) ( not ( = ?auto_24982 ?auto_24983 ) ) ( not ( = ?auto_24982 ?auto_24984 ) ) ( not ( = ?auto_24989 ?auto_24990 ) ) ( HOIST-AT ?auto_24987 ?auto_24989 ) ( not ( = ?auto_24988 ?auto_24987 ) ) ( AVAILABLE ?auto_24987 ) ( SURFACE-AT ?auto_24984 ?auto_24989 ) ( ON ?auto_24984 ?auto_24985 ) ( CLEAR ?auto_24984 ) ( not ( = ?auto_24983 ?auto_24985 ) ) ( not ( = ?auto_24984 ?auto_24985 ) ) ( not ( = ?auto_24982 ?auto_24985 ) ) ( TRUCK-AT ?auto_24986 ?auto_24990 ) ( SURFACE-AT ?auto_24982 ?auto_24990 ) ( CLEAR ?auto_24982 ) ( LIFTING ?auto_24988 ?auto_24983 ) ( IS-CRATE ?auto_24983 ) ( ON ?auto_24982 ?auto_24981 ) ( not ( = ?auto_24981 ?auto_24982 ) ) ( not ( = ?auto_24981 ?auto_24983 ) ) ( not ( = ?auto_24981 ?auto_24984 ) ) ( not ( = ?auto_24981 ?auto_24985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24982 ?auto_24983 ?auto_24984 )
      ( MAKE-3CRATE-VERIFY ?auto_24981 ?auto_24982 ?auto_24983 ?auto_24984 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_24991 - SURFACE
      ?auto_24992 - SURFACE
      ?auto_24993 - SURFACE
      ?auto_24994 - SURFACE
      ?auto_24995 - SURFACE
    )
    :vars
    (
      ?auto_24999 - HOIST
      ?auto_25001 - PLACE
      ?auto_25000 - PLACE
      ?auto_24998 - HOIST
      ?auto_24996 - SURFACE
      ?auto_24997 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24999 ?auto_25001 ) ( IS-CRATE ?auto_24995 ) ( not ( = ?auto_24994 ?auto_24995 ) ) ( not ( = ?auto_24993 ?auto_24994 ) ) ( not ( = ?auto_24993 ?auto_24995 ) ) ( not ( = ?auto_25000 ?auto_25001 ) ) ( HOIST-AT ?auto_24998 ?auto_25000 ) ( not ( = ?auto_24999 ?auto_24998 ) ) ( AVAILABLE ?auto_24998 ) ( SURFACE-AT ?auto_24995 ?auto_25000 ) ( ON ?auto_24995 ?auto_24996 ) ( CLEAR ?auto_24995 ) ( not ( = ?auto_24994 ?auto_24996 ) ) ( not ( = ?auto_24995 ?auto_24996 ) ) ( not ( = ?auto_24993 ?auto_24996 ) ) ( TRUCK-AT ?auto_24997 ?auto_25001 ) ( SURFACE-AT ?auto_24993 ?auto_25001 ) ( CLEAR ?auto_24993 ) ( LIFTING ?auto_24999 ?auto_24994 ) ( IS-CRATE ?auto_24994 ) ( ON ?auto_24992 ?auto_24991 ) ( ON ?auto_24993 ?auto_24992 ) ( not ( = ?auto_24991 ?auto_24992 ) ) ( not ( = ?auto_24991 ?auto_24993 ) ) ( not ( = ?auto_24991 ?auto_24994 ) ) ( not ( = ?auto_24991 ?auto_24995 ) ) ( not ( = ?auto_24991 ?auto_24996 ) ) ( not ( = ?auto_24992 ?auto_24993 ) ) ( not ( = ?auto_24992 ?auto_24994 ) ) ( not ( = ?auto_24992 ?auto_24995 ) ) ( not ( = ?auto_24992 ?auto_24996 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24993 ?auto_24994 ?auto_24995 )
      ( MAKE-4CRATE-VERIFY ?auto_24991 ?auto_24992 ?auto_24993 ?auto_24994 ?auto_24995 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25002 - SURFACE
      ?auto_25003 - SURFACE
    )
    :vars
    (
      ?auto_25008 - HOIST
      ?auto_25010 - PLACE
      ?auto_25004 - SURFACE
      ?auto_25009 - PLACE
      ?auto_25007 - HOIST
      ?auto_25005 - SURFACE
      ?auto_25006 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25008 ?auto_25010 ) ( IS-CRATE ?auto_25003 ) ( not ( = ?auto_25002 ?auto_25003 ) ) ( not ( = ?auto_25004 ?auto_25002 ) ) ( not ( = ?auto_25004 ?auto_25003 ) ) ( not ( = ?auto_25009 ?auto_25010 ) ) ( HOIST-AT ?auto_25007 ?auto_25009 ) ( not ( = ?auto_25008 ?auto_25007 ) ) ( AVAILABLE ?auto_25007 ) ( SURFACE-AT ?auto_25003 ?auto_25009 ) ( ON ?auto_25003 ?auto_25005 ) ( CLEAR ?auto_25003 ) ( not ( = ?auto_25002 ?auto_25005 ) ) ( not ( = ?auto_25003 ?auto_25005 ) ) ( not ( = ?auto_25004 ?auto_25005 ) ) ( TRUCK-AT ?auto_25006 ?auto_25010 ) ( SURFACE-AT ?auto_25004 ?auto_25010 ) ( CLEAR ?auto_25004 ) ( IS-CRATE ?auto_25002 ) ( AVAILABLE ?auto_25008 ) ( IN ?auto_25002 ?auto_25006 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25008 ?auto_25002 ?auto_25006 ?auto_25010 )
      ( MAKE-2CRATE ?auto_25004 ?auto_25002 ?auto_25003 )
      ( MAKE-1CRATE-VERIFY ?auto_25002 ?auto_25003 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25011 - SURFACE
      ?auto_25012 - SURFACE
      ?auto_25013 - SURFACE
    )
    :vars
    (
      ?auto_25016 - HOIST
      ?auto_25015 - PLACE
      ?auto_25014 - PLACE
      ?auto_25017 - HOIST
      ?auto_25018 - SURFACE
      ?auto_25019 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25016 ?auto_25015 ) ( IS-CRATE ?auto_25013 ) ( not ( = ?auto_25012 ?auto_25013 ) ) ( not ( = ?auto_25011 ?auto_25012 ) ) ( not ( = ?auto_25011 ?auto_25013 ) ) ( not ( = ?auto_25014 ?auto_25015 ) ) ( HOIST-AT ?auto_25017 ?auto_25014 ) ( not ( = ?auto_25016 ?auto_25017 ) ) ( AVAILABLE ?auto_25017 ) ( SURFACE-AT ?auto_25013 ?auto_25014 ) ( ON ?auto_25013 ?auto_25018 ) ( CLEAR ?auto_25013 ) ( not ( = ?auto_25012 ?auto_25018 ) ) ( not ( = ?auto_25013 ?auto_25018 ) ) ( not ( = ?auto_25011 ?auto_25018 ) ) ( TRUCK-AT ?auto_25019 ?auto_25015 ) ( SURFACE-AT ?auto_25011 ?auto_25015 ) ( CLEAR ?auto_25011 ) ( IS-CRATE ?auto_25012 ) ( AVAILABLE ?auto_25016 ) ( IN ?auto_25012 ?auto_25019 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25012 ?auto_25013 )
      ( MAKE-2CRATE-VERIFY ?auto_25011 ?auto_25012 ?auto_25013 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25020 - SURFACE
      ?auto_25021 - SURFACE
      ?auto_25022 - SURFACE
      ?auto_25023 - SURFACE
    )
    :vars
    (
      ?auto_25026 - HOIST
      ?auto_25027 - PLACE
      ?auto_25028 - PLACE
      ?auto_25025 - HOIST
      ?auto_25024 - SURFACE
      ?auto_25029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25026 ?auto_25027 ) ( IS-CRATE ?auto_25023 ) ( not ( = ?auto_25022 ?auto_25023 ) ) ( not ( = ?auto_25021 ?auto_25022 ) ) ( not ( = ?auto_25021 ?auto_25023 ) ) ( not ( = ?auto_25028 ?auto_25027 ) ) ( HOIST-AT ?auto_25025 ?auto_25028 ) ( not ( = ?auto_25026 ?auto_25025 ) ) ( AVAILABLE ?auto_25025 ) ( SURFACE-AT ?auto_25023 ?auto_25028 ) ( ON ?auto_25023 ?auto_25024 ) ( CLEAR ?auto_25023 ) ( not ( = ?auto_25022 ?auto_25024 ) ) ( not ( = ?auto_25023 ?auto_25024 ) ) ( not ( = ?auto_25021 ?auto_25024 ) ) ( TRUCK-AT ?auto_25029 ?auto_25027 ) ( SURFACE-AT ?auto_25021 ?auto_25027 ) ( CLEAR ?auto_25021 ) ( IS-CRATE ?auto_25022 ) ( AVAILABLE ?auto_25026 ) ( IN ?auto_25022 ?auto_25029 ) ( ON ?auto_25021 ?auto_25020 ) ( not ( = ?auto_25020 ?auto_25021 ) ) ( not ( = ?auto_25020 ?auto_25022 ) ) ( not ( = ?auto_25020 ?auto_25023 ) ) ( not ( = ?auto_25020 ?auto_25024 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25021 ?auto_25022 ?auto_25023 )
      ( MAKE-3CRATE-VERIFY ?auto_25020 ?auto_25021 ?auto_25022 ?auto_25023 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25030 - SURFACE
      ?auto_25031 - SURFACE
      ?auto_25032 - SURFACE
      ?auto_25033 - SURFACE
      ?auto_25034 - SURFACE
    )
    :vars
    (
      ?auto_25037 - HOIST
      ?auto_25038 - PLACE
      ?auto_25039 - PLACE
      ?auto_25036 - HOIST
      ?auto_25035 - SURFACE
      ?auto_25040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25037 ?auto_25038 ) ( IS-CRATE ?auto_25034 ) ( not ( = ?auto_25033 ?auto_25034 ) ) ( not ( = ?auto_25032 ?auto_25033 ) ) ( not ( = ?auto_25032 ?auto_25034 ) ) ( not ( = ?auto_25039 ?auto_25038 ) ) ( HOIST-AT ?auto_25036 ?auto_25039 ) ( not ( = ?auto_25037 ?auto_25036 ) ) ( AVAILABLE ?auto_25036 ) ( SURFACE-AT ?auto_25034 ?auto_25039 ) ( ON ?auto_25034 ?auto_25035 ) ( CLEAR ?auto_25034 ) ( not ( = ?auto_25033 ?auto_25035 ) ) ( not ( = ?auto_25034 ?auto_25035 ) ) ( not ( = ?auto_25032 ?auto_25035 ) ) ( TRUCK-AT ?auto_25040 ?auto_25038 ) ( SURFACE-AT ?auto_25032 ?auto_25038 ) ( CLEAR ?auto_25032 ) ( IS-CRATE ?auto_25033 ) ( AVAILABLE ?auto_25037 ) ( IN ?auto_25033 ?auto_25040 ) ( ON ?auto_25031 ?auto_25030 ) ( ON ?auto_25032 ?auto_25031 ) ( not ( = ?auto_25030 ?auto_25031 ) ) ( not ( = ?auto_25030 ?auto_25032 ) ) ( not ( = ?auto_25030 ?auto_25033 ) ) ( not ( = ?auto_25030 ?auto_25034 ) ) ( not ( = ?auto_25030 ?auto_25035 ) ) ( not ( = ?auto_25031 ?auto_25032 ) ) ( not ( = ?auto_25031 ?auto_25033 ) ) ( not ( = ?auto_25031 ?auto_25034 ) ) ( not ( = ?auto_25031 ?auto_25035 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25032 ?auto_25033 ?auto_25034 )
      ( MAKE-4CRATE-VERIFY ?auto_25030 ?auto_25031 ?auto_25032 ?auto_25033 ?auto_25034 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25041 - SURFACE
      ?auto_25042 - SURFACE
    )
    :vars
    (
      ?auto_25045 - HOIST
      ?auto_25046 - PLACE
      ?auto_25048 - SURFACE
      ?auto_25047 - PLACE
      ?auto_25044 - HOIST
      ?auto_25043 - SURFACE
      ?auto_25049 - TRUCK
      ?auto_25050 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25045 ?auto_25046 ) ( IS-CRATE ?auto_25042 ) ( not ( = ?auto_25041 ?auto_25042 ) ) ( not ( = ?auto_25048 ?auto_25041 ) ) ( not ( = ?auto_25048 ?auto_25042 ) ) ( not ( = ?auto_25047 ?auto_25046 ) ) ( HOIST-AT ?auto_25044 ?auto_25047 ) ( not ( = ?auto_25045 ?auto_25044 ) ) ( AVAILABLE ?auto_25044 ) ( SURFACE-AT ?auto_25042 ?auto_25047 ) ( ON ?auto_25042 ?auto_25043 ) ( CLEAR ?auto_25042 ) ( not ( = ?auto_25041 ?auto_25043 ) ) ( not ( = ?auto_25042 ?auto_25043 ) ) ( not ( = ?auto_25048 ?auto_25043 ) ) ( SURFACE-AT ?auto_25048 ?auto_25046 ) ( CLEAR ?auto_25048 ) ( IS-CRATE ?auto_25041 ) ( AVAILABLE ?auto_25045 ) ( IN ?auto_25041 ?auto_25049 ) ( TRUCK-AT ?auto_25049 ?auto_25050 ) ( not ( = ?auto_25050 ?auto_25046 ) ) ( not ( = ?auto_25047 ?auto_25050 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25049 ?auto_25050 ?auto_25046 )
      ( MAKE-2CRATE ?auto_25048 ?auto_25041 ?auto_25042 )
      ( MAKE-1CRATE-VERIFY ?auto_25041 ?auto_25042 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25051 - SURFACE
      ?auto_25052 - SURFACE
      ?auto_25053 - SURFACE
    )
    :vars
    (
      ?auto_25056 - HOIST
      ?auto_25059 - PLACE
      ?auto_25058 - PLACE
      ?auto_25054 - HOIST
      ?auto_25055 - SURFACE
      ?auto_25060 - TRUCK
      ?auto_25057 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25056 ?auto_25059 ) ( IS-CRATE ?auto_25053 ) ( not ( = ?auto_25052 ?auto_25053 ) ) ( not ( = ?auto_25051 ?auto_25052 ) ) ( not ( = ?auto_25051 ?auto_25053 ) ) ( not ( = ?auto_25058 ?auto_25059 ) ) ( HOIST-AT ?auto_25054 ?auto_25058 ) ( not ( = ?auto_25056 ?auto_25054 ) ) ( AVAILABLE ?auto_25054 ) ( SURFACE-AT ?auto_25053 ?auto_25058 ) ( ON ?auto_25053 ?auto_25055 ) ( CLEAR ?auto_25053 ) ( not ( = ?auto_25052 ?auto_25055 ) ) ( not ( = ?auto_25053 ?auto_25055 ) ) ( not ( = ?auto_25051 ?auto_25055 ) ) ( SURFACE-AT ?auto_25051 ?auto_25059 ) ( CLEAR ?auto_25051 ) ( IS-CRATE ?auto_25052 ) ( AVAILABLE ?auto_25056 ) ( IN ?auto_25052 ?auto_25060 ) ( TRUCK-AT ?auto_25060 ?auto_25057 ) ( not ( = ?auto_25057 ?auto_25059 ) ) ( not ( = ?auto_25058 ?auto_25057 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25052 ?auto_25053 )
      ( MAKE-2CRATE-VERIFY ?auto_25051 ?auto_25052 ?auto_25053 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25061 - SURFACE
      ?auto_25062 - SURFACE
      ?auto_25063 - SURFACE
      ?auto_25064 - SURFACE
    )
    :vars
    (
      ?auto_25070 - HOIST
      ?auto_25068 - PLACE
      ?auto_25071 - PLACE
      ?auto_25067 - HOIST
      ?auto_25066 - SURFACE
      ?auto_25069 - TRUCK
      ?auto_25065 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25070 ?auto_25068 ) ( IS-CRATE ?auto_25064 ) ( not ( = ?auto_25063 ?auto_25064 ) ) ( not ( = ?auto_25062 ?auto_25063 ) ) ( not ( = ?auto_25062 ?auto_25064 ) ) ( not ( = ?auto_25071 ?auto_25068 ) ) ( HOIST-AT ?auto_25067 ?auto_25071 ) ( not ( = ?auto_25070 ?auto_25067 ) ) ( AVAILABLE ?auto_25067 ) ( SURFACE-AT ?auto_25064 ?auto_25071 ) ( ON ?auto_25064 ?auto_25066 ) ( CLEAR ?auto_25064 ) ( not ( = ?auto_25063 ?auto_25066 ) ) ( not ( = ?auto_25064 ?auto_25066 ) ) ( not ( = ?auto_25062 ?auto_25066 ) ) ( SURFACE-AT ?auto_25062 ?auto_25068 ) ( CLEAR ?auto_25062 ) ( IS-CRATE ?auto_25063 ) ( AVAILABLE ?auto_25070 ) ( IN ?auto_25063 ?auto_25069 ) ( TRUCK-AT ?auto_25069 ?auto_25065 ) ( not ( = ?auto_25065 ?auto_25068 ) ) ( not ( = ?auto_25071 ?auto_25065 ) ) ( ON ?auto_25062 ?auto_25061 ) ( not ( = ?auto_25061 ?auto_25062 ) ) ( not ( = ?auto_25061 ?auto_25063 ) ) ( not ( = ?auto_25061 ?auto_25064 ) ) ( not ( = ?auto_25061 ?auto_25066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25062 ?auto_25063 ?auto_25064 )
      ( MAKE-3CRATE-VERIFY ?auto_25061 ?auto_25062 ?auto_25063 ?auto_25064 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25072 - SURFACE
      ?auto_25073 - SURFACE
      ?auto_25074 - SURFACE
      ?auto_25075 - SURFACE
      ?auto_25076 - SURFACE
    )
    :vars
    (
      ?auto_25082 - HOIST
      ?auto_25080 - PLACE
      ?auto_25083 - PLACE
      ?auto_25079 - HOIST
      ?auto_25078 - SURFACE
      ?auto_25081 - TRUCK
      ?auto_25077 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25082 ?auto_25080 ) ( IS-CRATE ?auto_25076 ) ( not ( = ?auto_25075 ?auto_25076 ) ) ( not ( = ?auto_25074 ?auto_25075 ) ) ( not ( = ?auto_25074 ?auto_25076 ) ) ( not ( = ?auto_25083 ?auto_25080 ) ) ( HOIST-AT ?auto_25079 ?auto_25083 ) ( not ( = ?auto_25082 ?auto_25079 ) ) ( AVAILABLE ?auto_25079 ) ( SURFACE-AT ?auto_25076 ?auto_25083 ) ( ON ?auto_25076 ?auto_25078 ) ( CLEAR ?auto_25076 ) ( not ( = ?auto_25075 ?auto_25078 ) ) ( not ( = ?auto_25076 ?auto_25078 ) ) ( not ( = ?auto_25074 ?auto_25078 ) ) ( SURFACE-AT ?auto_25074 ?auto_25080 ) ( CLEAR ?auto_25074 ) ( IS-CRATE ?auto_25075 ) ( AVAILABLE ?auto_25082 ) ( IN ?auto_25075 ?auto_25081 ) ( TRUCK-AT ?auto_25081 ?auto_25077 ) ( not ( = ?auto_25077 ?auto_25080 ) ) ( not ( = ?auto_25083 ?auto_25077 ) ) ( ON ?auto_25073 ?auto_25072 ) ( ON ?auto_25074 ?auto_25073 ) ( not ( = ?auto_25072 ?auto_25073 ) ) ( not ( = ?auto_25072 ?auto_25074 ) ) ( not ( = ?auto_25072 ?auto_25075 ) ) ( not ( = ?auto_25072 ?auto_25076 ) ) ( not ( = ?auto_25072 ?auto_25078 ) ) ( not ( = ?auto_25073 ?auto_25074 ) ) ( not ( = ?auto_25073 ?auto_25075 ) ) ( not ( = ?auto_25073 ?auto_25076 ) ) ( not ( = ?auto_25073 ?auto_25078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25074 ?auto_25075 ?auto_25076 )
      ( MAKE-4CRATE-VERIFY ?auto_25072 ?auto_25073 ?auto_25074 ?auto_25075 ?auto_25076 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25084 - SURFACE
      ?auto_25085 - SURFACE
    )
    :vars
    (
      ?auto_25092 - HOIST
      ?auto_25090 - PLACE
      ?auto_25088 - SURFACE
      ?auto_25093 - PLACE
      ?auto_25089 - HOIST
      ?auto_25087 - SURFACE
      ?auto_25091 - TRUCK
      ?auto_25086 - PLACE
      ?auto_25094 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25092 ?auto_25090 ) ( IS-CRATE ?auto_25085 ) ( not ( = ?auto_25084 ?auto_25085 ) ) ( not ( = ?auto_25088 ?auto_25084 ) ) ( not ( = ?auto_25088 ?auto_25085 ) ) ( not ( = ?auto_25093 ?auto_25090 ) ) ( HOIST-AT ?auto_25089 ?auto_25093 ) ( not ( = ?auto_25092 ?auto_25089 ) ) ( AVAILABLE ?auto_25089 ) ( SURFACE-AT ?auto_25085 ?auto_25093 ) ( ON ?auto_25085 ?auto_25087 ) ( CLEAR ?auto_25085 ) ( not ( = ?auto_25084 ?auto_25087 ) ) ( not ( = ?auto_25085 ?auto_25087 ) ) ( not ( = ?auto_25088 ?auto_25087 ) ) ( SURFACE-AT ?auto_25088 ?auto_25090 ) ( CLEAR ?auto_25088 ) ( IS-CRATE ?auto_25084 ) ( AVAILABLE ?auto_25092 ) ( TRUCK-AT ?auto_25091 ?auto_25086 ) ( not ( = ?auto_25086 ?auto_25090 ) ) ( not ( = ?auto_25093 ?auto_25086 ) ) ( HOIST-AT ?auto_25094 ?auto_25086 ) ( LIFTING ?auto_25094 ?auto_25084 ) ( not ( = ?auto_25092 ?auto_25094 ) ) ( not ( = ?auto_25089 ?auto_25094 ) ) )
    :subtasks
    ( ( !LOAD ?auto_25094 ?auto_25084 ?auto_25091 ?auto_25086 )
      ( MAKE-2CRATE ?auto_25088 ?auto_25084 ?auto_25085 )
      ( MAKE-1CRATE-VERIFY ?auto_25084 ?auto_25085 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25095 - SURFACE
      ?auto_25096 - SURFACE
      ?auto_25097 - SURFACE
    )
    :vars
    (
      ?auto_25102 - HOIST
      ?auto_25101 - PLACE
      ?auto_25098 - PLACE
      ?auto_25104 - HOIST
      ?auto_25099 - SURFACE
      ?auto_25103 - TRUCK
      ?auto_25100 - PLACE
      ?auto_25105 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25102 ?auto_25101 ) ( IS-CRATE ?auto_25097 ) ( not ( = ?auto_25096 ?auto_25097 ) ) ( not ( = ?auto_25095 ?auto_25096 ) ) ( not ( = ?auto_25095 ?auto_25097 ) ) ( not ( = ?auto_25098 ?auto_25101 ) ) ( HOIST-AT ?auto_25104 ?auto_25098 ) ( not ( = ?auto_25102 ?auto_25104 ) ) ( AVAILABLE ?auto_25104 ) ( SURFACE-AT ?auto_25097 ?auto_25098 ) ( ON ?auto_25097 ?auto_25099 ) ( CLEAR ?auto_25097 ) ( not ( = ?auto_25096 ?auto_25099 ) ) ( not ( = ?auto_25097 ?auto_25099 ) ) ( not ( = ?auto_25095 ?auto_25099 ) ) ( SURFACE-AT ?auto_25095 ?auto_25101 ) ( CLEAR ?auto_25095 ) ( IS-CRATE ?auto_25096 ) ( AVAILABLE ?auto_25102 ) ( TRUCK-AT ?auto_25103 ?auto_25100 ) ( not ( = ?auto_25100 ?auto_25101 ) ) ( not ( = ?auto_25098 ?auto_25100 ) ) ( HOIST-AT ?auto_25105 ?auto_25100 ) ( LIFTING ?auto_25105 ?auto_25096 ) ( not ( = ?auto_25102 ?auto_25105 ) ) ( not ( = ?auto_25104 ?auto_25105 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25096 ?auto_25097 )
      ( MAKE-2CRATE-VERIFY ?auto_25095 ?auto_25096 ?auto_25097 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25106 - SURFACE
      ?auto_25107 - SURFACE
      ?auto_25108 - SURFACE
      ?auto_25109 - SURFACE
    )
    :vars
    (
      ?auto_25111 - HOIST
      ?auto_25112 - PLACE
      ?auto_25113 - PLACE
      ?auto_25115 - HOIST
      ?auto_25110 - SURFACE
      ?auto_25117 - TRUCK
      ?auto_25116 - PLACE
      ?auto_25114 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25111 ?auto_25112 ) ( IS-CRATE ?auto_25109 ) ( not ( = ?auto_25108 ?auto_25109 ) ) ( not ( = ?auto_25107 ?auto_25108 ) ) ( not ( = ?auto_25107 ?auto_25109 ) ) ( not ( = ?auto_25113 ?auto_25112 ) ) ( HOIST-AT ?auto_25115 ?auto_25113 ) ( not ( = ?auto_25111 ?auto_25115 ) ) ( AVAILABLE ?auto_25115 ) ( SURFACE-AT ?auto_25109 ?auto_25113 ) ( ON ?auto_25109 ?auto_25110 ) ( CLEAR ?auto_25109 ) ( not ( = ?auto_25108 ?auto_25110 ) ) ( not ( = ?auto_25109 ?auto_25110 ) ) ( not ( = ?auto_25107 ?auto_25110 ) ) ( SURFACE-AT ?auto_25107 ?auto_25112 ) ( CLEAR ?auto_25107 ) ( IS-CRATE ?auto_25108 ) ( AVAILABLE ?auto_25111 ) ( TRUCK-AT ?auto_25117 ?auto_25116 ) ( not ( = ?auto_25116 ?auto_25112 ) ) ( not ( = ?auto_25113 ?auto_25116 ) ) ( HOIST-AT ?auto_25114 ?auto_25116 ) ( LIFTING ?auto_25114 ?auto_25108 ) ( not ( = ?auto_25111 ?auto_25114 ) ) ( not ( = ?auto_25115 ?auto_25114 ) ) ( ON ?auto_25107 ?auto_25106 ) ( not ( = ?auto_25106 ?auto_25107 ) ) ( not ( = ?auto_25106 ?auto_25108 ) ) ( not ( = ?auto_25106 ?auto_25109 ) ) ( not ( = ?auto_25106 ?auto_25110 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25107 ?auto_25108 ?auto_25109 )
      ( MAKE-3CRATE-VERIFY ?auto_25106 ?auto_25107 ?auto_25108 ?auto_25109 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25118 - SURFACE
      ?auto_25119 - SURFACE
      ?auto_25120 - SURFACE
      ?auto_25121 - SURFACE
      ?auto_25122 - SURFACE
    )
    :vars
    (
      ?auto_25124 - HOIST
      ?auto_25125 - PLACE
      ?auto_25126 - PLACE
      ?auto_25128 - HOIST
      ?auto_25123 - SURFACE
      ?auto_25130 - TRUCK
      ?auto_25129 - PLACE
      ?auto_25127 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25124 ?auto_25125 ) ( IS-CRATE ?auto_25122 ) ( not ( = ?auto_25121 ?auto_25122 ) ) ( not ( = ?auto_25120 ?auto_25121 ) ) ( not ( = ?auto_25120 ?auto_25122 ) ) ( not ( = ?auto_25126 ?auto_25125 ) ) ( HOIST-AT ?auto_25128 ?auto_25126 ) ( not ( = ?auto_25124 ?auto_25128 ) ) ( AVAILABLE ?auto_25128 ) ( SURFACE-AT ?auto_25122 ?auto_25126 ) ( ON ?auto_25122 ?auto_25123 ) ( CLEAR ?auto_25122 ) ( not ( = ?auto_25121 ?auto_25123 ) ) ( not ( = ?auto_25122 ?auto_25123 ) ) ( not ( = ?auto_25120 ?auto_25123 ) ) ( SURFACE-AT ?auto_25120 ?auto_25125 ) ( CLEAR ?auto_25120 ) ( IS-CRATE ?auto_25121 ) ( AVAILABLE ?auto_25124 ) ( TRUCK-AT ?auto_25130 ?auto_25129 ) ( not ( = ?auto_25129 ?auto_25125 ) ) ( not ( = ?auto_25126 ?auto_25129 ) ) ( HOIST-AT ?auto_25127 ?auto_25129 ) ( LIFTING ?auto_25127 ?auto_25121 ) ( not ( = ?auto_25124 ?auto_25127 ) ) ( not ( = ?auto_25128 ?auto_25127 ) ) ( ON ?auto_25119 ?auto_25118 ) ( ON ?auto_25120 ?auto_25119 ) ( not ( = ?auto_25118 ?auto_25119 ) ) ( not ( = ?auto_25118 ?auto_25120 ) ) ( not ( = ?auto_25118 ?auto_25121 ) ) ( not ( = ?auto_25118 ?auto_25122 ) ) ( not ( = ?auto_25118 ?auto_25123 ) ) ( not ( = ?auto_25119 ?auto_25120 ) ) ( not ( = ?auto_25119 ?auto_25121 ) ) ( not ( = ?auto_25119 ?auto_25122 ) ) ( not ( = ?auto_25119 ?auto_25123 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25120 ?auto_25121 ?auto_25122 )
      ( MAKE-4CRATE-VERIFY ?auto_25118 ?auto_25119 ?auto_25120 ?auto_25121 ?auto_25122 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25131 - SURFACE
      ?auto_25132 - SURFACE
    )
    :vars
    (
      ?auto_25134 - HOIST
      ?auto_25135 - PLACE
      ?auto_25140 - SURFACE
      ?auto_25136 - PLACE
      ?auto_25138 - HOIST
      ?auto_25133 - SURFACE
      ?auto_25141 - TRUCK
      ?auto_25139 - PLACE
      ?auto_25137 - HOIST
      ?auto_25142 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25134 ?auto_25135 ) ( IS-CRATE ?auto_25132 ) ( not ( = ?auto_25131 ?auto_25132 ) ) ( not ( = ?auto_25140 ?auto_25131 ) ) ( not ( = ?auto_25140 ?auto_25132 ) ) ( not ( = ?auto_25136 ?auto_25135 ) ) ( HOIST-AT ?auto_25138 ?auto_25136 ) ( not ( = ?auto_25134 ?auto_25138 ) ) ( AVAILABLE ?auto_25138 ) ( SURFACE-AT ?auto_25132 ?auto_25136 ) ( ON ?auto_25132 ?auto_25133 ) ( CLEAR ?auto_25132 ) ( not ( = ?auto_25131 ?auto_25133 ) ) ( not ( = ?auto_25132 ?auto_25133 ) ) ( not ( = ?auto_25140 ?auto_25133 ) ) ( SURFACE-AT ?auto_25140 ?auto_25135 ) ( CLEAR ?auto_25140 ) ( IS-CRATE ?auto_25131 ) ( AVAILABLE ?auto_25134 ) ( TRUCK-AT ?auto_25141 ?auto_25139 ) ( not ( = ?auto_25139 ?auto_25135 ) ) ( not ( = ?auto_25136 ?auto_25139 ) ) ( HOIST-AT ?auto_25137 ?auto_25139 ) ( not ( = ?auto_25134 ?auto_25137 ) ) ( not ( = ?auto_25138 ?auto_25137 ) ) ( AVAILABLE ?auto_25137 ) ( SURFACE-AT ?auto_25131 ?auto_25139 ) ( ON ?auto_25131 ?auto_25142 ) ( CLEAR ?auto_25131 ) ( not ( = ?auto_25131 ?auto_25142 ) ) ( not ( = ?auto_25132 ?auto_25142 ) ) ( not ( = ?auto_25140 ?auto_25142 ) ) ( not ( = ?auto_25133 ?auto_25142 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25137 ?auto_25131 ?auto_25142 ?auto_25139 )
      ( MAKE-2CRATE ?auto_25140 ?auto_25131 ?auto_25132 )
      ( MAKE-1CRATE-VERIFY ?auto_25131 ?auto_25132 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25143 - SURFACE
      ?auto_25144 - SURFACE
      ?auto_25145 - SURFACE
    )
    :vars
    (
      ?auto_25149 - HOIST
      ?auto_25148 - PLACE
      ?auto_25146 - PLACE
      ?auto_25150 - HOIST
      ?auto_25147 - SURFACE
      ?auto_25152 - TRUCK
      ?auto_25151 - PLACE
      ?auto_25154 - HOIST
      ?auto_25153 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25149 ?auto_25148 ) ( IS-CRATE ?auto_25145 ) ( not ( = ?auto_25144 ?auto_25145 ) ) ( not ( = ?auto_25143 ?auto_25144 ) ) ( not ( = ?auto_25143 ?auto_25145 ) ) ( not ( = ?auto_25146 ?auto_25148 ) ) ( HOIST-AT ?auto_25150 ?auto_25146 ) ( not ( = ?auto_25149 ?auto_25150 ) ) ( AVAILABLE ?auto_25150 ) ( SURFACE-AT ?auto_25145 ?auto_25146 ) ( ON ?auto_25145 ?auto_25147 ) ( CLEAR ?auto_25145 ) ( not ( = ?auto_25144 ?auto_25147 ) ) ( not ( = ?auto_25145 ?auto_25147 ) ) ( not ( = ?auto_25143 ?auto_25147 ) ) ( SURFACE-AT ?auto_25143 ?auto_25148 ) ( CLEAR ?auto_25143 ) ( IS-CRATE ?auto_25144 ) ( AVAILABLE ?auto_25149 ) ( TRUCK-AT ?auto_25152 ?auto_25151 ) ( not ( = ?auto_25151 ?auto_25148 ) ) ( not ( = ?auto_25146 ?auto_25151 ) ) ( HOIST-AT ?auto_25154 ?auto_25151 ) ( not ( = ?auto_25149 ?auto_25154 ) ) ( not ( = ?auto_25150 ?auto_25154 ) ) ( AVAILABLE ?auto_25154 ) ( SURFACE-AT ?auto_25144 ?auto_25151 ) ( ON ?auto_25144 ?auto_25153 ) ( CLEAR ?auto_25144 ) ( not ( = ?auto_25144 ?auto_25153 ) ) ( not ( = ?auto_25145 ?auto_25153 ) ) ( not ( = ?auto_25143 ?auto_25153 ) ) ( not ( = ?auto_25147 ?auto_25153 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25144 ?auto_25145 )
      ( MAKE-2CRATE-VERIFY ?auto_25143 ?auto_25144 ?auto_25145 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25155 - SURFACE
      ?auto_25156 - SURFACE
      ?auto_25157 - SURFACE
      ?auto_25158 - SURFACE
    )
    :vars
    (
      ?auto_25162 - HOIST
      ?auto_25164 - PLACE
      ?auto_25161 - PLACE
      ?auto_25159 - HOIST
      ?auto_25160 - SURFACE
      ?auto_25165 - TRUCK
      ?auto_25163 - PLACE
      ?auto_25167 - HOIST
      ?auto_25166 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25162 ?auto_25164 ) ( IS-CRATE ?auto_25158 ) ( not ( = ?auto_25157 ?auto_25158 ) ) ( not ( = ?auto_25156 ?auto_25157 ) ) ( not ( = ?auto_25156 ?auto_25158 ) ) ( not ( = ?auto_25161 ?auto_25164 ) ) ( HOIST-AT ?auto_25159 ?auto_25161 ) ( not ( = ?auto_25162 ?auto_25159 ) ) ( AVAILABLE ?auto_25159 ) ( SURFACE-AT ?auto_25158 ?auto_25161 ) ( ON ?auto_25158 ?auto_25160 ) ( CLEAR ?auto_25158 ) ( not ( = ?auto_25157 ?auto_25160 ) ) ( not ( = ?auto_25158 ?auto_25160 ) ) ( not ( = ?auto_25156 ?auto_25160 ) ) ( SURFACE-AT ?auto_25156 ?auto_25164 ) ( CLEAR ?auto_25156 ) ( IS-CRATE ?auto_25157 ) ( AVAILABLE ?auto_25162 ) ( TRUCK-AT ?auto_25165 ?auto_25163 ) ( not ( = ?auto_25163 ?auto_25164 ) ) ( not ( = ?auto_25161 ?auto_25163 ) ) ( HOIST-AT ?auto_25167 ?auto_25163 ) ( not ( = ?auto_25162 ?auto_25167 ) ) ( not ( = ?auto_25159 ?auto_25167 ) ) ( AVAILABLE ?auto_25167 ) ( SURFACE-AT ?auto_25157 ?auto_25163 ) ( ON ?auto_25157 ?auto_25166 ) ( CLEAR ?auto_25157 ) ( not ( = ?auto_25157 ?auto_25166 ) ) ( not ( = ?auto_25158 ?auto_25166 ) ) ( not ( = ?auto_25156 ?auto_25166 ) ) ( not ( = ?auto_25160 ?auto_25166 ) ) ( ON ?auto_25156 ?auto_25155 ) ( not ( = ?auto_25155 ?auto_25156 ) ) ( not ( = ?auto_25155 ?auto_25157 ) ) ( not ( = ?auto_25155 ?auto_25158 ) ) ( not ( = ?auto_25155 ?auto_25160 ) ) ( not ( = ?auto_25155 ?auto_25166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25156 ?auto_25157 ?auto_25158 )
      ( MAKE-3CRATE-VERIFY ?auto_25155 ?auto_25156 ?auto_25157 ?auto_25158 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25168 - SURFACE
      ?auto_25169 - SURFACE
      ?auto_25170 - SURFACE
      ?auto_25171 - SURFACE
      ?auto_25172 - SURFACE
    )
    :vars
    (
      ?auto_25176 - HOIST
      ?auto_25178 - PLACE
      ?auto_25175 - PLACE
      ?auto_25173 - HOIST
      ?auto_25174 - SURFACE
      ?auto_25179 - TRUCK
      ?auto_25177 - PLACE
      ?auto_25181 - HOIST
      ?auto_25180 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25176 ?auto_25178 ) ( IS-CRATE ?auto_25172 ) ( not ( = ?auto_25171 ?auto_25172 ) ) ( not ( = ?auto_25170 ?auto_25171 ) ) ( not ( = ?auto_25170 ?auto_25172 ) ) ( not ( = ?auto_25175 ?auto_25178 ) ) ( HOIST-AT ?auto_25173 ?auto_25175 ) ( not ( = ?auto_25176 ?auto_25173 ) ) ( AVAILABLE ?auto_25173 ) ( SURFACE-AT ?auto_25172 ?auto_25175 ) ( ON ?auto_25172 ?auto_25174 ) ( CLEAR ?auto_25172 ) ( not ( = ?auto_25171 ?auto_25174 ) ) ( not ( = ?auto_25172 ?auto_25174 ) ) ( not ( = ?auto_25170 ?auto_25174 ) ) ( SURFACE-AT ?auto_25170 ?auto_25178 ) ( CLEAR ?auto_25170 ) ( IS-CRATE ?auto_25171 ) ( AVAILABLE ?auto_25176 ) ( TRUCK-AT ?auto_25179 ?auto_25177 ) ( not ( = ?auto_25177 ?auto_25178 ) ) ( not ( = ?auto_25175 ?auto_25177 ) ) ( HOIST-AT ?auto_25181 ?auto_25177 ) ( not ( = ?auto_25176 ?auto_25181 ) ) ( not ( = ?auto_25173 ?auto_25181 ) ) ( AVAILABLE ?auto_25181 ) ( SURFACE-AT ?auto_25171 ?auto_25177 ) ( ON ?auto_25171 ?auto_25180 ) ( CLEAR ?auto_25171 ) ( not ( = ?auto_25171 ?auto_25180 ) ) ( not ( = ?auto_25172 ?auto_25180 ) ) ( not ( = ?auto_25170 ?auto_25180 ) ) ( not ( = ?auto_25174 ?auto_25180 ) ) ( ON ?auto_25169 ?auto_25168 ) ( ON ?auto_25170 ?auto_25169 ) ( not ( = ?auto_25168 ?auto_25169 ) ) ( not ( = ?auto_25168 ?auto_25170 ) ) ( not ( = ?auto_25168 ?auto_25171 ) ) ( not ( = ?auto_25168 ?auto_25172 ) ) ( not ( = ?auto_25168 ?auto_25174 ) ) ( not ( = ?auto_25168 ?auto_25180 ) ) ( not ( = ?auto_25169 ?auto_25170 ) ) ( not ( = ?auto_25169 ?auto_25171 ) ) ( not ( = ?auto_25169 ?auto_25172 ) ) ( not ( = ?auto_25169 ?auto_25174 ) ) ( not ( = ?auto_25169 ?auto_25180 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25170 ?auto_25171 ?auto_25172 )
      ( MAKE-4CRATE-VERIFY ?auto_25168 ?auto_25169 ?auto_25170 ?auto_25171 ?auto_25172 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25182 - SURFACE
      ?auto_25183 - SURFACE
    )
    :vars
    (
      ?auto_25187 - HOIST
      ?auto_25190 - PLACE
      ?auto_25189 - SURFACE
      ?auto_25186 - PLACE
      ?auto_25184 - HOIST
      ?auto_25185 - SURFACE
      ?auto_25188 - PLACE
      ?auto_25193 - HOIST
      ?auto_25192 - SURFACE
      ?auto_25191 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25187 ?auto_25190 ) ( IS-CRATE ?auto_25183 ) ( not ( = ?auto_25182 ?auto_25183 ) ) ( not ( = ?auto_25189 ?auto_25182 ) ) ( not ( = ?auto_25189 ?auto_25183 ) ) ( not ( = ?auto_25186 ?auto_25190 ) ) ( HOIST-AT ?auto_25184 ?auto_25186 ) ( not ( = ?auto_25187 ?auto_25184 ) ) ( AVAILABLE ?auto_25184 ) ( SURFACE-AT ?auto_25183 ?auto_25186 ) ( ON ?auto_25183 ?auto_25185 ) ( CLEAR ?auto_25183 ) ( not ( = ?auto_25182 ?auto_25185 ) ) ( not ( = ?auto_25183 ?auto_25185 ) ) ( not ( = ?auto_25189 ?auto_25185 ) ) ( SURFACE-AT ?auto_25189 ?auto_25190 ) ( CLEAR ?auto_25189 ) ( IS-CRATE ?auto_25182 ) ( AVAILABLE ?auto_25187 ) ( not ( = ?auto_25188 ?auto_25190 ) ) ( not ( = ?auto_25186 ?auto_25188 ) ) ( HOIST-AT ?auto_25193 ?auto_25188 ) ( not ( = ?auto_25187 ?auto_25193 ) ) ( not ( = ?auto_25184 ?auto_25193 ) ) ( AVAILABLE ?auto_25193 ) ( SURFACE-AT ?auto_25182 ?auto_25188 ) ( ON ?auto_25182 ?auto_25192 ) ( CLEAR ?auto_25182 ) ( not ( = ?auto_25182 ?auto_25192 ) ) ( not ( = ?auto_25183 ?auto_25192 ) ) ( not ( = ?auto_25189 ?auto_25192 ) ) ( not ( = ?auto_25185 ?auto_25192 ) ) ( TRUCK-AT ?auto_25191 ?auto_25190 ) )
    :subtasks
    ( ( !DRIVE ?auto_25191 ?auto_25190 ?auto_25188 )
      ( MAKE-2CRATE ?auto_25189 ?auto_25182 ?auto_25183 )
      ( MAKE-1CRATE-VERIFY ?auto_25182 ?auto_25183 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25194 - SURFACE
      ?auto_25195 - SURFACE
      ?auto_25196 - SURFACE
    )
    :vars
    (
      ?auto_25198 - HOIST
      ?auto_25203 - PLACE
      ?auto_25199 - PLACE
      ?auto_25201 - HOIST
      ?auto_25205 - SURFACE
      ?auto_25200 - PLACE
      ?auto_25202 - HOIST
      ?auto_25197 - SURFACE
      ?auto_25204 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25198 ?auto_25203 ) ( IS-CRATE ?auto_25196 ) ( not ( = ?auto_25195 ?auto_25196 ) ) ( not ( = ?auto_25194 ?auto_25195 ) ) ( not ( = ?auto_25194 ?auto_25196 ) ) ( not ( = ?auto_25199 ?auto_25203 ) ) ( HOIST-AT ?auto_25201 ?auto_25199 ) ( not ( = ?auto_25198 ?auto_25201 ) ) ( AVAILABLE ?auto_25201 ) ( SURFACE-AT ?auto_25196 ?auto_25199 ) ( ON ?auto_25196 ?auto_25205 ) ( CLEAR ?auto_25196 ) ( not ( = ?auto_25195 ?auto_25205 ) ) ( not ( = ?auto_25196 ?auto_25205 ) ) ( not ( = ?auto_25194 ?auto_25205 ) ) ( SURFACE-AT ?auto_25194 ?auto_25203 ) ( CLEAR ?auto_25194 ) ( IS-CRATE ?auto_25195 ) ( AVAILABLE ?auto_25198 ) ( not ( = ?auto_25200 ?auto_25203 ) ) ( not ( = ?auto_25199 ?auto_25200 ) ) ( HOIST-AT ?auto_25202 ?auto_25200 ) ( not ( = ?auto_25198 ?auto_25202 ) ) ( not ( = ?auto_25201 ?auto_25202 ) ) ( AVAILABLE ?auto_25202 ) ( SURFACE-AT ?auto_25195 ?auto_25200 ) ( ON ?auto_25195 ?auto_25197 ) ( CLEAR ?auto_25195 ) ( not ( = ?auto_25195 ?auto_25197 ) ) ( not ( = ?auto_25196 ?auto_25197 ) ) ( not ( = ?auto_25194 ?auto_25197 ) ) ( not ( = ?auto_25205 ?auto_25197 ) ) ( TRUCK-AT ?auto_25204 ?auto_25203 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25195 ?auto_25196 )
      ( MAKE-2CRATE-VERIFY ?auto_25194 ?auto_25195 ?auto_25196 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25206 - SURFACE
      ?auto_25207 - SURFACE
      ?auto_25208 - SURFACE
      ?auto_25209 - SURFACE
    )
    :vars
    (
      ?auto_25216 - HOIST
      ?auto_25215 - PLACE
      ?auto_25218 - PLACE
      ?auto_25210 - HOIST
      ?auto_25211 - SURFACE
      ?auto_25214 - PLACE
      ?auto_25212 - HOIST
      ?auto_25213 - SURFACE
      ?auto_25217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25216 ?auto_25215 ) ( IS-CRATE ?auto_25209 ) ( not ( = ?auto_25208 ?auto_25209 ) ) ( not ( = ?auto_25207 ?auto_25208 ) ) ( not ( = ?auto_25207 ?auto_25209 ) ) ( not ( = ?auto_25218 ?auto_25215 ) ) ( HOIST-AT ?auto_25210 ?auto_25218 ) ( not ( = ?auto_25216 ?auto_25210 ) ) ( AVAILABLE ?auto_25210 ) ( SURFACE-AT ?auto_25209 ?auto_25218 ) ( ON ?auto_25209 ?auto_25211 ) ( CLEAR ?auto_25209 ) ( not ( = ?auto_25208 ?auto_25211 ) ) ( not ( = ?auto_25209 ?auto_25211 ) ) ( not ( = ?auto_25207 ?auto_25211 ) ) ( SURFACE-AT ?auto_25207 ?auto_25215 ) ( CLEAR ?auto_25207 ) ( IS-CRATE ?auto_25208 ) ( AVAILABLE ?auto_25216 ) ( not ( = ?auto_25214 ?auto_25215 ) ) ( not ( = ?auto_25218 ?auto_25214 ) ) ( HOIST-AT ?auto_25212 ?auto_25214 ) ( not ( = ?auto_25216 ?auto_25212 ) ) ( not ( = ?auto_25210 ?auto_25212 ) ) ( AVAILABLE ?auto_25212 ) ( SURFACE-AT ?auto_25208 ?auto_25214 ) ( ON ?auto_25208 ?auto_25213 ) ( CLEAR ?auto_25208 ) ( not ( = ?auto_25208 ?auto_25213 ) ) ( not ( = ?auto_25209 ?auto_25213 ) ) ( not ( = ?auto_25207 ?auto_25213 ) ) ( not ( = ?auto_25211 ?auto_25213 ) ) ( TRUCK-AT ?auto_25217 ?auto_25215 ) ( ON ?auto_25207 ?auto_25206 ) ( not ( = ?auto_25206 ?auto_25207 ) ) ( not ( = ?auto_25206 ?auto_25208 ) ) ( not ( = ?auto_25206 ?auto_25209 ) ) ( not ( = ?auto_25206 ?auto_25211 ) ) ( not ( = ?auto_25206 ?auto_25213 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25207 ?auto_25208 ?auto_25209 )
      ( MAKE-3CRATE-VERIFY ?auto_25206 ?auto_25207 ?auto_25208 ?auto_25209 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25219 - SURFACE
      ?auto_25220 - SURFACE
      ?auto_25221 - SURFACE
      ?auto_25222 - SURFACE
      ?auto_25223 - SURFACE
    )
    :vars
    (
      ?auto_25230 - HOIST
      ?auto_25229 - PLACE
      ?auto_25232 - PLACE
      ?auto_25224 - HOIST
      ?auto_25225 - SURFACE
      ?auto_25228 - PLACE
      ?auto_25226 - HOIST
      ?auto_25227 - SURFACE
      ?auto_25231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25230 ?auto_25229 ) ( IS-CRATE ?auto_25223 ) ( not ( = ?auto_25222 ?auto_25223 ) ) ( not ( = ?auto_25221 ?auto_25222 ) ) ( not ( = ?auto_25221 ?auto_25223 ) ) ( not ( = ?auto_25232 ?auto_25229 ) ) ( HOIST-AT ?auto_25224 ?auto_25232 ) ( not ( = ?auto_25230 ?auto_25224 ) ) ( AVAILABLE ?auto_25224 ) ( SURFACE-AT ?auto_25223 ?auto_25232 ) ( ON ?auto_25223 ?auto_25225 ) ( CLEAR ?auto_25223 ) ( not ( = ?auto_25222 ?auto_25225 ) ) ( not ( = ?auto_25223 ?auto_25225 ) ) ( not ( = ?auto_25221 ?auto_25225 ) ) ( SURFACE-AT ?auto_25221 ?auto_25229 ) ( CLEAR ?auto_25221 ) ( IS-CRATE ?auto_25222 ) ( AVAILABLE ?auto_25230 ) ( not ( = ?auto_25228 ?auto_25229 ) ) ( not ( = ?auto_25232 ?auto_25228 ) ) ( HOIST-AT ?auto_25226 ?auto_25228 ) ( not ( = ?auto_25230 ?auto_25226 ) ) ( not ( = ?auto_25224 ?auto_25226 ) ) ( AVAILABLE ?auto_25226 ) ( SURFACE-AT ?auto_25222 ?auto_25228 ) ( ON ?auto_25222 ?auto_25227 ) ( CLEAR ?auto_25222 ) ( not ( = ?auto_25222 ?auto_25227 ) ) ( not ( = ?auto_25223 ?auto_25227 ) ) ( not ( = ?auto_25221 ?auto_25227 ) ) ( not ( = ?auto_25225 ?auto_25227 ) ) ( TRUCK-AT ?auto_25231 ?auto_25229 ) ( ON ?auto_25220 ?auto_25219 ) ( ON ?auto_25221 ?auto_25220 ) ( not ( = ?auto_25219 ?auto_25220 ) ) ( not ( = ?auto_25219 ?auto_25221 ) ) ( not ( = ?auto_25219 ?auto_25222 ) ) ( not ( = ?auto_25219 ?auto_25223 ) ) ( not ( = ?auto_25219 ?auto_25225 ) ) ( not ( = ?auto_25219 ?auto_25227 ) ) ( not ( = ?auto_25220 ?auto_25221 ) ) ( not ( = ?auto_25220 ?auto_25222 ) ) ( not ( = ?auto_25220 ?auto_25223 ) ) ( not ( = ?auto_25220 ?auto_25225 ) ) ( not ( = ?auto_25220 ?auto_25227 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25221 ?auto_25222 ?auto_25223 )
      ( MAKE-4CRATE-VERIFY ?auto_25219 ?auto_25220 ?auto_25221 ?auto_25222 ?auto_25223 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25233 - SURFACE
      ?auto_25234 - SURFACE
    )
    :vars
    (
      ?auto_25242 - HOIST
      ?auto_25240 - PLACE
      ?auto_25241 - SURFACE
      ?auto_25244 - PLACE
      ?auto_25235 - HOIST
      ?auto_25236 - SURFACE
      ?auto_25239 - PLACE
      ?auto_25237 - HOIST
      ?auto_25238 - SURFACE
      ?auto_25243 - TRUCK
      ?auto_25245 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25242 ?auto_25240 ) ( IS-CRATE ?auto_25234 ) ( not ( = ?auto_25233 ?auto_25234 ) ) ( not ( = ?auto_25241 ?auto_25233 ) ) ( not ( = ?auto_25241 ?auto_25234 ) ) ( not ( = ?auto_25244 ?auto_25240 ) ) ( HOIST-AT ?auto_25235 ?auto_25244 ) ( not ( = ?auto_25242 ?auto_25235 ) ) ( AVAILABLE ?auto_25235 ) ( SURFACE-AT ?auto_25234 ?auto_25244 ) ( ON ?auto_25234 ?auto_25236 ) ( CLEAR ?auto_25234 ) ( not ( = ?auto_25233 ?auto_25236 ) ) ( not ( = ?auto_25234 ?auto_25236 ) ) ( not ( = ?auto_25241 ?auto_25236 ) ) ( IS-CRATE ?auto_25233 ) ( not ( = ?auto_25239 ?auto_25240 ) ) ( not ( = ?auto_25244 ?auto_25239 ) ) ( HOIST-AT ?auto_25237 ?auto_25239 ) ( not ( = ?auto_25242 ?auto_25237 ) ) ( not ( = ?auto_25235 ?auto_25237 ) ) ( AVAILABLE ?auto_25237 ) ( SURFACE-AT ?auto_25233 ?auto_25239 ) ( ON ?auto_25233 ?auto_25238 ) ( CLEAR ?auto_25233 ) ( not ( = ?auto_25233 ?auto_25238 ) ) ( not ( = ?auto_25234 ?auto_25238 ) ) ( not ( = ?auto_25241 ?auto_25238 ) ) ( not ( = ?auto_25236 ?auto_25238 ) ) ( TRUCK-AT ?auto_25243 ?auto_25240 ) ( SURFACE-AT ?auto_25245 ?auto_25240 ) ( CLEAR ?auto_25245 ) ( LIFTING ?auto_25242 ?auto_25241 ) ( IS-CRATE ?auto_25241 ) ( not ( = ?auto_25245 ?auto_25241 ) ) ( not ( = ?auto_25233 ?auto_25245 ) ) ( not ( = ?auto_25234 ?auto_25245 ) ) ( not ( = ?auto_25236 ?auto_25245 ) ) ( not ( = ?auto_25238 ?auto_25245 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25245 ?auto_25241 )
      ( MAKE-2CRATE ?auto_25241 ?auto_25233 ?auto_25234 )
      ( MAKE-1CRATE-VERIFY ?auto_25233 ?auto_25234 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25246 - SURFACE
      ?auto_25247 - SURFACE
      ?auto_25248 - SURFACE
    )
    :vars
    (
      ?auto_25249 - HOIST
      ?auto_25250 - PLACE
      ?auto_25254 - PLACE
      ?auto_25258 - HOIST
      ?auto_25253 - SURFACE
      ?auto_25251 - PLACE
      ?auto_25255 - HOIST
      ?auto_25256 - SURFACE
      ?auto_25257 - TRUCK
      ?auto_25252 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25249 ?auto_25250 ) ( IS-CRATE ?auto_25248 ) ( not ( = ?auto_25247 ?auto_25248 ) ) ( not ( = ?auto_25246 ?auto_25247 ) ) ( not ( = ?auto_25246 ?auto_25248 ) ) ( not ( = ?auto_25254 ?auto_25250 ) ) ( HOIST-AT ?auto_25258 ?auto_25254 ) ( not ( = ?auto_25249 ?auto_25258 ) ) ( AVAILABLE ?auto_25258 ) ( SURFACE-AT ?auto_25248 ?auto_25254 ) ( ON ?auto_25248 ?auto_25253 ) ( CLEAR ?auto_25248 ) ( not ( = ?auto_25247 ?auto_25253 ) ) ( not ( = ?auto_25248 ?auto_25253 ) ) ( not ( = ?auto_25246 ?auto_25253 ) ) ( IS-CRATE ?auto_25247 ) ( not ( = ?auto_25251 ?auto_25250 ) ) ( not ( = ?auto_25254 ?auto_25251 ) ) ( HOIST-AT ?auto_25255 ?auto_25251 ) ( not ( = ?auto_25249 ?auto_25255 ) ) ( not ( = ?auto_25258 ?auto_25255 ) ) ( AVAILABLE ?auto_25255 ) ( SURFACE-AT ?auto_25247 ?auto_25251 ) ( ON ?auto_25247 ?auto_25256 ) ( CLEAR ?auto_25247 ) ( not ( = ?auto_25247 ?auto_25256 ) ) ( not ( = ?auto_25248 ?auto_25256 ) ) ( not ( = ?auto_25246 ?auto_25256 ) ) ( not ( = ?auto_25253 ?auto_25256 ) ) ( TRUCK-AT ?auto_25257 ?auto_25250 ) ( SURFACE-AT ?auto_25252 ?auto_25250 ) ( CLEAR ?auto_25252 ) ( LIFTING ?auto_25249 ?auto_25246 ) ( IS-CRATE ?auto_25246 ) ( not ( = ?auto_25252 ?auto_25246 ) ) ( not ( = ?auto_25247 ?auto_25252 ) ) ( not ( = ?auto_25248 ?auto_25252 ) ) ( not ( = ?auto_25253 ?auto_25252 ) ) ( not ( = ?auto_25256 ?auto_25252 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25247 ?auto_25248 )
      ( MAKE-2CRATE-VERIFY ?auto_25246 ?auto_25247 ?auto_25248 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25259 - SURFACE
      ?auto_25260 - SURFACE
      ?auto_25261 - SURFACE
      ?auto_25262 - SURFACE
    )
    :vars
    (
      ?auto_25266 - HOIST
      ?auto_25267 - PLACE
      ?auto_25265 - PLACE
      ?auto_25270 - HOIST
      ?auto_25263 - SURFACE
      ?auto_25271 - PLACE
      ?auto_25264 - HOIST
      ?auto_25268 - SURFACE
      ?auto_25269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25266 ?auto_25267 ) ( IS-CRATE ?auto_25262 ) ( not ( = ?auto_25261 ?auto_25262 ) ) ( not ( = ?auto_25260 ?auto_25261 ) ) ( not ( = ?auto_25260 ?auto_25262 ) ) ( not ( = ?auto_25265 ?auto_25267 ) ) ( HOIST-AT ?auto_25270 ?auto_25265 ) ( not ( = ?auto_25266 ?auto_25270 ) ) ( AVAILABLE ?auto_25270 ) ( SURFACE-AT ?auto_25262 ?auto_25265 ) ( ON ?auto_25262 ?auto_25263 ) ( CLEAR ?auto_25262 ) ( not ( = ?auto_25261 ?auto_25263 ) ) ( not ( = ?auto_25262 ?auto_25263 ) ) ( not ( = ?auto_25260 ?auto_25263 ) ) ( IS-CRATE ?auto_25261 ) ( not ( = ?auto_25271 ?auto_25267 ) ) ( not ( = ?auto_25265 ?auto_25271 ) ) ( HOIST-AT ?auto_25264 ?auto_25271 ) ( not ( = ?auto_25266 ?auto_25264 ) ) ( not ( = ?auto_25270 ?auto_25264 ) ) ( AVAILABLE ?auto_25264 ) ( SURFACE-AT ?auto_25261 ?auto_25271 ) ( ON ?auto_25261 ?auto_25268 ) ( CLEAR ?auto_25261 ) ( not ( = ?auto_25261 ?auto_25268 ) ) ( not ( = ?auto_25262 ?auto_25268 ) ) ( not ( = ?auto_25260 ?auto_25268 ) ) ( not ( = ?auto_25263 ?auto_25268 ) ) ( TRUCK-AT ?auto_25269 ?auto_25267 ) ( SURFACE-AT ?auto_25259 ?auto_25267 ) ( CLEAR ?auto_25259 ) ( LIFTING ?auto_25266 ?auto_25260 ) ( IS-CRATE ?auto_25260 ) ( not ( = ?auto_25259 ?auto_25260 ) ) ( not ( = ?auto_25261 ?auto_25259 ) ) ( not ( = ?auto_25262 ?auto_25259 ) ) ( not ( = ?auto_25263 ?auto_25259 ) ) ( not ( = ?auto_25268 ?auto_25259 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25260 ?auto_25261 ?auto_25262 )
      ( MAKE-3CRATE-VERIFY ?auto_25259 ?auto_25260 ?auto_25261 ?auto_25262 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25272 - SURFACE
      ?auto_25273 - SURFACE
      ?auto_25274 - SURFACE
      ?auto_25275 - SURFACE
      ?auto_25276 - SURFACE
    )
    :vars
    (
      ?auto_25280 - HOIST
      ?auto_25281 - PLACE
      ?auto_25279 - PLACE
      ?auto_25284 - HOIST
      ?auto_25277 - SURFACE
      ?auto_25285 - PLACE
      ?auto_25278 - HOIST
      ?auto_25282 - SURFACE
      ?auto_25283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25280 ?auto_25281 ) ( IS-CRATE ?auto_25276 ) ( not ( = ?auto_25275 ?auto_25276 ) ) ( not ( = ?auto_25274 ?auto_25275 ) ) ( not ( = ?auto_25274 ?auto_25276 ) ) ( not ( = ?auto_25279 ?auto_25281 ) ) ( HOIST-AT ?auto_25284 ?auto_25279 ) ( not ( = ?auto_25280 ?auto_25284 ) ) ( AVAILABLE ?auto_25284 ) ( SURFACE-AT ?auto_25276 ?auto_25279 ) ( ON ?auto_25276 ?auto_25277 ) ( CLEAR ?auto_25276 ) ( not ( = ?auto_25275 ?auto_25277 ) ) ( not ( = ?auto_25276 ?auto_25277 ) ) ( not ( = ?auto_25274 ?auto_25277 ) ) ( IS-CRATE ?auto_25275 ) ( not ( = ?auto_25285 ?auto_25281 ) ) ( not ( = ?auto_25279 ?auto_25285 ) ) ( HOIST-AT ?auto_25278 ?auto_25285 ) ( not ( = ?auto_25280 ?auto_25278 ) ) ( not ( = ?auto_25284 ?auto_25278 ) ) ( AVAILABLE ?auto_25278 ) ( SURFACE-AT ?auto_25275 ?auto_25285 ) ( ON ?auto_25275 ?auto_25282 ) ( CLEAR ?auto_25275 ) ( not ( = ?auto_25275 ?auto_25282 ) ) ( not ( = ?auto_25276 ?auto_25282 ) ) ( not ( = ?auto_25274 ?auto_25282 ) ) ( not ( = ?auto_25277 ?auto_25282 ) ) ( TRUCK-AT ?auto_25283 ?auto_25281 ) ( SURFACE-AT ?auto_25273 ?auto_25281 ) ( CLEAR ?auto_25273 ) ( LIFTING ?auto_25280 ?auto_25274 ) ( IS-CRATE ?auto_25274 ) ( not ( = ?auto_25273 ?auto_25274 ) ) ( not ( = ?auto_25275 ?auto_25273 ) ) ( not ( = ?auto_25276 ?auto_25273 ) ) ( not ( = ?auto_25277 ?auto_25273 ) ) ( not ( = ?auto_25282 ?auto_25273 ) ) ( ON ?auto_25273 ?auto_25272 ) ( not ( = ?auto_25272 ?auto_25273 ) ) ( not ( = ?auto_25272 ?auto_25274 ) ) ( not ( = ?auto_25272 ?auto_25275 ) ) ( not ( = ?auto_25272 ?auto_25276 ) ) ( not ( = ?auto_25272 ?auto_25277 ) ) ( not ( = ?auto_25272 ?auto_25282 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25274 ?auto_25275 ?auto_25276 )
      ( MAKE-4CRATE-VERIFY ?auto_25272 ?auto_25273 ?auto_25274 ?auto_25275 ?auto_25276 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25286 - SURFACE
      ?auto_25287 - SURFACE
    )
    :vars
    (
      ?auto_25292 - HOIST
      ?auto_25293 - PLACE
      ?auto_25291 - SURFACE
      ?auto_25290 - PLACE
      ?auto_25297 - HOIST
      ?auto_25288 - SURFACE
      ?auto_25298 - PLACE
      ?auto_25289 - HOIST
      ?auto_25295 - SURFACE
      ?auto_25296 - TRUCK
      ?auto_25294 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25292 ?auto_25293 ) ( IS-CRATE ?auto_25287 ) ( not ( = ?auto_25286 ?auto_25287 ) ) ( not ( = ?auto_25291 ?auto_25286 ) ) ( not ( = ?auto_25291 ?auto_25287 ) ) ( not ( = ?auto_25290 ?auto_25293 ) ) ( HOIST-AT ?auto_25297 ?auto_25290 ) ( not ( = ?auto_25292 ?auto_25297 ) ) ( AVAILABLE ?auto_25297 ) ( SURFACE-AT ?auto_25287 ?auto_25290 ) ( ON ?auto_25287 ?auto_25288 ) ( CLEAR ?auto_25287 ) ( not ( = ?auto_25286 ?auto_25288 ) ) ( not ( = ?auto_25287 ?auto_25288 ) ) ( not ( = ?auto_25291 ?auto_25288 ) ) ( IS-CRATE ?auto_25286 ) ( not ( = ?auto_25298 ?auto_25293 ) ) ( not ( = ?auto_25290 ?auto_25298 ) ) ( HOIST-AT ?auto_25289 ?auto_25298 ) ( not ( = ?auto_25292 ?auto_25289 ) ) ( not ( = ?auto_25297 ?auto_25289 ) ) ( AVAILABLE ?auto_25289 ) ( SURFACE-AT ?auto_25286 ?auto_25298 ) ( ON ?auto_25286 ?auto_25295 ) ( CLEAR ?auto_25286 ) ( not ( = ?auto_25286 ?auto_25295 ) ) ( not ( = ?auto_25287 ?auto_25295 ) ) ( not ( = ?auto_25291 ?auto_25295 ) ) ( not ( = ?auto_25288 ?auto_25295 ) ) ( TRUCK-AT ?auto_25296 ?auto_25293 ) ( SURFACE-AT ?auto_25294 ?auto_25293 ) ( CLEAR ?auto_25294 ) ( IS-CRATE ?auto_25291 ) ( not ( = ?auto_25294 ?auto_25291 ) ) ( not ( = ?auto_25286 ?auto_25294 ) ) ( not ( = ?auto_25287 ?auto_25294 ) ) ( not ( = ?auto_25288 ?auto_25294 ) ) ( not ( = ?auto_25295 ?auto_25294 ) ) ( AVAILABLE ?auto_25292 ) ( IN ?auto_25291 ?auto_25296 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25292 ?auto_25291 ?auto_25296 ?auto_25293 )
      ( MAKE-2CRATE ?auto_25291 ?auto_25286 ?auto_25287 )
      ( MAKE-1CRATE-VERIFY ?auto_25286 ?auto_25287 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25299 - SURFACE
      ?auto_25300 - SURFACE
      ?auto_25301 - SURFACE
    )
    :vars
    (
      ?auto_25307 - HOIST
      ?auto_25305 - PLACE
      ?auto_25302 - PLACE
      ?auto_25309 - HOIST
      ?auto_25304 - SURFACE
      ?auto_25306 - PLACE
      ?auto_25310 - HOIST
      ?auto_25311 - SURFACE
      ?auto_25308 - TRUCK
      ?auto_25303 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25307 ?auto_25305 ) ( IS-CRATE ?auto_25301 ) ( not ( = ?auto_25300 ?auto_25301 ) ) ( not ( = ?auto_25299 ?auto_25300 ) ) ( not ( = ?auto_25299 ?auto_25301 ) ) ( not ( = ?auto_25302 ?auto_25305 ) ) ( HOIST-AT ?auto_25309 ?auto_25302 ) ( not ( = ?auto_25307 ?auto_25309 ) ) ( AVAILABLE ?auto_25309 ) ( SURFACE-AT ?auto_25301 ?auto_25302 ) ( ON ?auto_25301 ?auto_25304 ) ( CLEAR ?auto_25301 ) ( not ( = ?auto_25300 ?auto_25304 ) ) ( not ( = ?auto_25301 ?auto_25304 ) ) ( not ( = ?auto_25299 ?auto_25304 ) ) ( IS-CRATE ?auto_25300 ) ( not ( = ?auto_25306 ?auto_25305 ) ) ( not ( = ?auto_25302 ?auto_25306 ) ) ( HOIST-AT ?auto_25310 ?auto_25306 ) ( not ( = ?auto_25307 ?auto_25310 ) ) ( not ( = ?auto_25309 ?auto_25310 ) ) ( AVAILABLE ?auto_25310 ) ( SURFACE-AT ?auto_25300 ?auto_25306 ) ( ON ?auto_25300 ?auto_25311 ) ( CLEAR ?auto_25300 ) ( not ( = ?auto_25300 ?auto_25311 ) ) ( not ( = ?auto_25301 ?auto_25311 ) ) ( not ( = ?auto_25299 ?auto_25311 ) ) ( not ( = ?auto_25304 ?auto_25311 ) ) ( TRUCK-AT ?auto_25308 ?auto_25305 ) ( SURFACE-AT ?auto_25303 ?auto_25305 ) ( CLEAR ?auto_25303 ) ( IS-CRATE ?auto_25299 ) ( not ( = ?auto_25303 ?auto_25299 ) ) ( not ( = ?auto_25300 ?auto_25303 ) ) ( not ( = ?auto_25301 ?auto_25303 ) ) ( not ( = ?auto_25304 ?auto_25303 ) ) ( not ( = ?auto_25311 ?auto_25303 ) ) ( AVAILABLE ?auto_25307 ) ( IN ?auto_25299 ?auto_25308 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25300 ?auto_25301 )
      ( MAKE-2CRATE-VERIFY ?auto_25299 ?auto_25300 ?auto_25301 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25312 - SURFACE
      ?auto_25313 - SURFACE
      ?auto_25314 - SURFACE
      ?auto_25315 - SURFACE
    )
    :vars
    (
      ?auto_25320 - HOIST
      ?auto_25318 - PLACE
      ?auto_25323 - PLACE
      ?auto_25316 - HOIST
      ?auto_25317 - SURFACE
      ?auto_25321 - PLACE
      ?auto_25324 - HOIST
      ?auto_25322 - SURFACE
      ?auto_25319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25320 ?auto_25318 ) ( IS-CRATE ?auto_25315 ) ( not ( = ?auto_25314 ?auto_25315 ) ) ( not ( = ?auto_25313 ?auto_25314 ) ) ( not ( = ?auto_25313 ?auto_25315 ) ) ( not ( = ?auto_25323 ?auto_25318 ) ) ( HOIST-AT ?auto_25316 ?auto_25323 ) ( not ( = ?auto_25320 ?auto_25316 ) ) ( AVAILABLE ?auto_25316 ) ( SURFACE-AT ?auto_25315 ?auto_25323 ) ( ON ?auto_25315 ?auto_25317 ) ( CLEAR ?auto_25315 ) ( not ( = ?auto_25314 ?auto_25317 ) ) ( not ( = ?auto_25315 ?auto_25317 ) ) ( not ( = ?auto_25313 ?auto_25317 ) ) ( IS-CRATE ?auto_25314 ) ( not ( = ?auto_25321 ?auto_25318 ) ) ( not ( = ?auto_25323 ?auto_25321 ) ) ( HOIST-AT ?auto_25324 ?auto_25321 ) ( not ( = ?auto_25320 ?auto_25324 ) ) ( not ( = ?auto_25316 ?auto_25324 ) ) ( AVAILABLE ?auto_25324 ) ( SURFACE-AT ?auto_25314 ?auto_25321 ) ( ON ?auto_25314 ?auto_25322 ) ( CLEAR ?auto_25314 ) ( not ( = ?auto_25314 ?auto_25322 ) ) ( not ( = ?auto_25315 ?auto_25322 ) ) ( not ( = ?auto_25313 ?auto_25322 ) ) ( not ( = ?auto_25317 ?auto_25322 ) ) ( TRUCK-AT ?auto_25319 ?auto_25318 ) ( SURFACE-AT ?auto_25312 ?auto_25318 ) ( CLEAR ?auto_25312 ) ( IS-CRATE ?auto_25313 ) ( not ( = ?auto_25312 ?auto_25313 ) ) ( not ( = ?auto_25314 ?auto_25312 ) ) ( not ( = ?auto_25315 ?auto_25312 ) ) ( not ( = ?auto_25317 ?auto_25312 ) ) ( not ( = ?auto_25322 ?auto_25312 ) ) ( AVAILABLE ?auto_25320 ) ( IN ?auto_25313 ?auto_25319 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25313 ?auto_25314 ?auto_25315 )
      ( MAKE-3CRATE-VERIFY ?auto_25312 ?auto_25313 ?auto_25314 ?auto_25315 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25325 - SURFACE
      ?auto_25326 - SURFACE
      ?auto_25327 - SURFACE
      ?auto_25328 - SURFACE
      ?auto_25329 - SURFACE
    )
    :vars
    (
      ?auto_25334 - HOIST
      ?auto_25332 - PLACE
      ?auto_25337 - PLACE
      ?auto_25330 - HOIST
      ?auto_25331 - SURFACE
      ?auto_25335 - PLACE
      ?auto_25338 - HOIST
      ?auto_25336 - SURFACE
      ?auto_25333 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25334 ?auto_25332 ) ( IS-CRATE ?auto_25329 ) ( not ( = ?auto_25328 ?auto_25329 ) ) ( not ( = ?auto_25327 ?auto_25328 ) ) ( not ( = ?auto_25327 ?auto_25329 ) ) ( not ( = ?auto_25337 ?auto_25332 ) ) ( HOIST-AT ?auto_25330 ?auto_25337 ) ( not ( = ?auto_25334 ?auto_25330 ) ) ( AVAILABLE ?auto_25330 ) ( SURFACE-AT ?auto_25329 ?auto_25337 ) ( ON ?auto_25329 ?auto_25331 ) ( CLEAR ?auto_25329 ) ( not ( = ?auto_25328 ?auto_25331 ) ) ( not ( = ?auto_25329 ?auto_25331 ) ) ( not ( = ?auto_25327 ?auto_25331 ) ) ( IS-CRATE ?auto_25328 ) ( not ( = ?auto_25335 ?auto_25332 ) ) ( not ( = ?auto_25337 ?auto_25335 ) ) ( HOIST-AT ?auto_25338 ?auto_25335 ) ( not ( = ?auto_25334 ?auto_25338 ) ) ( not ( = ?auto_25330 ?auto_25338 ) ) ( AVAILABLE ?auto_25338 ) ( SURFACE-AT ?auto_25328 ?auto_25335 ) ( ON ?auto_25328 ?auto_25336 ) ( CLEAR ?auto_25328 ) ( not ( = ?auto_25328 ?auto_25336 ) ) ( not ( = ?auto_25329 ?auto_25336 ) ) ( not ( = ?auto_25327 ?auto_25336 ) ) ( not ( = ?auto_25331 ?auto_25336 ) ) ( TRUCK-AT ?auto_25333 ?auto_25332 ) ( SURFACE-AT ?auto_25326 ?auto_25332 ) ( CLEAR ?auto_25326 ) ( IS-CRATE ?auto_25327 ) ( not ( = ?auto_25326 ?auto_25327 ) ) ( not ( = ?auto_25328 ?auto_25326 ) ) ( not ( = ?auto_25329 ?auto_25326 ) ) ( not ( = ?auto_25331 ?auto_25326 ) ) ( not ( = ?auto_25336 ?auto_25326 ) ) ( AVAILABLE ?auto_25334 ) ( IN ?auto_25327 ?auto_25333 ) ( ON ?auto_25326 ?auto_25325 ) ( not ( = ?auto_25325 ?auto_25326 ) ) ( not ( = ?auto_25325 ?auto_25327 ) ) ( not ( = ?auto_25325 ?auto_25328 ) ) ( not ( = ?auto_25325 ?auto_25329 ) ) ( not ( = ?auto_25325 ?auto_25331 ) ) ( not ( = ?auto_25325 ?auto_25336 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25327 ?auto_25328 ?auto_25329 )
      ( MAKE-4CRATE-VERIFY ?auto_25325 ?auto_25326 ?auto_25327 ?auto_25328 ?auto_25329 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25339 - SURFACE
      ?auto_25340 - SURFACE
    )
    :vars
    (
      ?auto_25346 - HOIST
      ?auto_25344 - PLACE
      ?auto_25342 - SURFACE
      ?auto_25349 - PLACE
      ?auto_25341 - HOIST
      ?auto_25343 - SURFACE
      ?auto_25347 - PLACE
      ?auto_25350 - HOIST
      ?auto_25348 - SURFACE
      ?auto_25351 - SURFACE
      ?auto_25345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25346 ?auto_25344 ) ( IS-CRATE ?auto_25340 ) ( not ( = ?auto_25339 ?auto_25340 ) ) ( not ( = ?auto_25342 ?auto_25339 ) ) ( not ( = ?auto_25342 ?auto_25340 ) ) ( not ( = ?auto_25349 ?auto_25344 ) ) ( HOIST-AT ?auto_25341 ?auto_25349 ) ( not ( = ?auto_25346 ?auto_25341 ) ) ( AVAILABLE ?auto_25341 ) ( SURFACE-AT ?auto_25340 ?auto_25349 ) ( ON ?auto_25340 ?auto_25343 ) ( CLEAR ?auto_25340 ) ( not ( = ?auto_25339 ?auto_25343 ) ) ( not ( = ?auto_25340 ?auto_25343 ) ) ( not ( = ?auto_25342 ?auto_25343 ) ) ( IS-CRATE ?auto_25339 ) ( not ( = ?auto_25347 ?auto_25344 ) ) ( not ( = ?auto_25349 ?auto_25347 ) ) ( HOIST-AT ?auto_25350 ?auto_25347 ) ( not ( = ?auto_25346 ?auto_25350 ) ) ( not ( = ?auto_25341 ?auto_25350 ) ) ( AVAILABLE ?auto_25350 ) ( SURFACE-AT ?auto_25339 ?auto_25347 ) ( ON ?auto_25339 ?auto_25348 ) ( CLEAR ?auto_25339 ) ( not ( = ?auto_25339 ?auto_25348 ) ) ( not ( = ?auto_25340 ?auto_25348 ) ) ( not ( = ?auto_25342 ?auto_25348 ) ) ( not ( = ?auto_25343 ?auto_25348 ) ) ( SURFACE-AT ?auto_25351 ?auto_25344 ) ( CLEAR ?auto_25351 ) ( IS-CRATE ?auto_25342 ) ( not ( = ?auto_25351 ?auto_25342 ) ) ( not ( = ?auto_25339 ?auto_25351 ) ) ( not ( = ?auto_25340 ?auto_25351 ) ) ( not ( = ?auto_25343 ?auto_25351 ) ) ( not ( = ?auto_25348 ?auto_25351 ) ) ( AVAILABLE ?auto_25346 ) ( IN ?auto_25342 ?auto_25345 ) ( TRUCK-AT ?auto_25345 ?auto_25349 ) )
    :subtasks
    ( ( !DRIVE ?auto_25345 ?auto_25349 ?auto_25344 )
      ( MAKE-2CRATE ?auto_25342 ?auto_25339 ?auto_25340 )
      ( MAKE-1CRATE-VERIFY ?auto_25339 ?auto_25340 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25352 - SURFACE
      ?auto_25353 - SURFACE
      ?auto_25354 - SURFACE
    )
    :vars
    (
      ?auto_25356 - HOIST
      ?auto_25359 - PLACE
      ?auto_25363 - PLACE
      ?auto_25361 - HOIST
      ?auto_25360 - SURFACE
      ?auto_25357 - PLACE
      ?auto_25355 - HOIST
      ?auto_25358 - SURFACE
      ?auto_25362 - SURFACE
      ?auto_25364 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25356 ?auto_25359 ) ( IS-CRATE ?auto_25354 ) ( not ( = ?auto_25353 ?auto_25354 ) ) ( not ( = ?auto_25352 ?auto_25353 ) ) ( not ( = ?auto_25352 ?auto_25354 ) ) ( not ( = ?auto_25363 ?auto_25359 ) ) ( HOIST-AT ?auto_25361 ?auto_25363 ) ( not ( = ?auto_25356 ?auto_25361 ) ) ( AVAILABLE ?auto_25361 ) ( SURFACE-AT ?auto_25354 ?auto_25363 ) ( ON ?auto_25354 ?auto_25360 ) ( CLEAR ?auto_25354 ) ( not ( = ?auto_25353 ?auto_25360 ) ) ( not ( = ?auto_25354 ?auto_25360 ) ) ( not ( = ?auto_25352 ?auto_25360 ) ) ( IS-CRATE ?auto_25353 ) ( not ( = ?auto_25357 ?auto_25359 ) ) ( not ( = ?auto_25363 ?auto_25357 ) ) ( HOIST-AT ?auto_25355 ?auto_25357 ) ( not ( = ?auto_25356 ?auto_25355 ) ) ( not ( = ?auto_25361 ?auto_25355 ) ) ( AVAILABLE ?auto_25355 ) ( SURFACE-AT ?auto_25353 ?auto_25357 ) ( ON ?auto_25353 ?auto_25358 ) ( CLEAR ?auto_25353 ) ( not ( = ?auto_25353 ?auto_25358 ) ) ( not ( = ?auto_25354 ?auto_25358 ) ) ( not ( = ?auto_25352 ?auto_25358 ) ) ( not ( = ?auto_25360 ?auto_25358 ) ) ( SURFACE-AT ?auto_25362 ?auto_25359 ) ( CLEAR ?auto_25362 ) ( IS-CRATE ?auto_25352 ) ( not ( = ?auto_25362 ?auto_25352 ) ) ( not ( = ?auto_25353 ?auto_25362 ) ) ( not ( = ?auto_25354 ?auto_25362 ) ) ( not ( = ?auto_25360 ?auto_25362 ) ) ( not ( = ?auto_25358 ?auto_25362 ) ) ( AVAILABLE ?auto_25356 ) ( IN ?auto_25352 ?auto_25364 ) ( TRUCK-AT ?auto_25364 ?auto_25363 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25353 ?auto_25354 )
      ( MAKE-2CRATE-VERIFY ?auto_25352 ?auto_25353 ?auto_25354 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25365 - SURFACE
      ?auto_25366 - SURFACE
      ?auto_25367 - SURFACE
      ?auto_25368 - SURFACE
    )
    :vars
    (
      ?auto_25374 - HOIST
      ?auto_25375 - PLACE
      ?auto_25377 - PLACE
      ?auto_25376 - HOIST
      ?auto_25372 - SURFACE
      ?auto_25373 - PLACE
      ?auto_25369 - HOIST
      ?auto_25370 - SURFACE
      ?auto_25371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25374 ?auto_25375 ) ( IS-CRATE ?auto_25368 ) ( not ( = ?auto_25367 ?auto_25368 ) ) ( not ( = ?auto_25366 ?auto_25367 ) ) ( not ( = ?auto_25366 ?auto_25368 ) ) ( not ( = ?auto_25377 ?auto_25375 ) ) ( HOIST-AT ?auto_25376 ?auto_25377 ) ( not ( = ?auto_25374 ?auto_25376 ) ) ( AVAILABLE ?auto_25376 ) ( SURFACE-AT ?auto_25368 ?auto_25377 ) ( ON ?auto_25368 ?auto_25372 ) ( CLEAR ?auto_25368 ) ( not ( = ?auto_25367 ?auto_25372 ) ) ( not ( = ?auto_25368 ?auto_25372 ) ) ( not ( = ?auto_25366 ?auto_25372 ) ) ( IS-CRATE ?auto_25367 ) ( not ( = ?auto_25373 ?auto_25375 ) ) ( not ( = ?auto_25377 ?auto_25373 ) ) ( HOIST-AT ?auto_25369 ?auto_25373 ) ( not ( = ?auto_25374 ?auto_25369 ) ) ( not ( = ?auto_25376 ?auto_25369 ) ) ( AVAILABLE ?auto_25369 ) ( SURFACE-AT ?auto_25367 ?auto_25373 ) ( ON ?auto_25367 ?auto_25370 ) ( CLEAR ?auto_25367 ) ( not ( = ?auto_25367 ?auto_25370 ) ) ( not ( = ?auto_25368 ?auto_25370 ) ) ( not ( = ?auto_25366 ?auto_25370 ) ) ( not ( = ?auto_25372 ?auto_25370 ) ) ( SURFACE-AT ?auto_25365 ?auto_25375 ) ( CLEAR ?auto_25365 ) ( IS-CRATE ?auto_25366 ) ( not ( = ?auto_25365 ?auto_25366 ) ) ( not ( = ?auto_25367 ?auto_25365 ) ) ( not ( = ?auto_25368 ?auto_25365 ) ) ( not ( = ?auto_25372 ?auto_25365 ) ) ( not ( = ?auto_25370 ?auto_25365 ) ) ( AVAILABLE ?auto_25374 ) ( IN ?auto_25366 ?auto_25371 ) ( TRUCK-AT ?auto_25371 ?auto_25377 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25366 ?auto_25367 ?auto_25368 )
      ( MAKE-3CRATE-VERIFY ?auto_25365 ?auto_25366 ?auto_25367 ?auto_25368 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25378 - SURFACE
      ?auto_25379 - SURFACE
      ?auto_25380 - SURFACE
      ?auto_25381 - SURFACE
      ?auto_25382 - SURFACE
    )
    :vars
    (
      ?auto_25388 - HOIST
      ?auto_25389 - PLACE
      ?auto_25391 - PLACE
      ?auto_25390 - HOIST
      ?auto_25386 - SURFACE
      ?auto_25387 - PLACE
      ?auto_25383 - HOIST
      ?auto_25384 - SURFACE
      ?auto_25385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25388 ?auto_25389 ) ( IS-CRATE ?auto_25382 ) ( not ( = ?auto_25381 ?auto_25382 ) ) ( not ( = ?auto_25380 ?auto_25381 ) ) ( not ( = ?auto_25380 ?auto_25382 ) ) ( not ( = ?auto_25391 ?auto_25389 ) ) ( HOIST-AT ?auto_25390 ?auto_25391 ) ( not ( = ?auto_25388 ?auto_25390 ) ) ( AVAILABLE ?auto_25390 ) ( SURFACE-AT ?auto_25382 ?auto_25391 ) ( ON ?auto_25382 ?auto_25386 ) ( CLEAR ?auto_25382 ) ( not ( = ?auto_25381 ?auto_25386 ) ) ( not ( = ?auto_25382 ?auto_25386 ) ) ( not ( = ?auto_25380 ?auto_25386 ) ) ( IS-CRATE ?auto_25381 ) ( not ( = ?auto_25387 ?auto_25389 ) ) ( not ( = ?auto_25391 ?auto_25387 ) ) ( HOIST-AT ?auto_25383 ?auto_25387 ) ( not ( = ?auto_25388 ?auto_25383 ) ) ( not ( = ?auto_25390 ?auto_25383 ) ) ( AVAILABLE ?auto_25383 ) ( SURFACE-AT ?auto_25381 ?auto_25387 ) ( ON ?auto_25381 ?auto_25384 ) ( CLEAR ?auto_25381 ) ( not ( = ?auto_25381 ?auto_25384 ) ) ( not ( = ?auto_25382 ?auto_25384 ) ) ( not ( = ?auto_25380 ?auto_25384 ) ) ( not ( = ?auto_25386 ?auto_25384 ) ) ( SURFACE-AT ?auto_25379 ?auto_25389 ) ( CLEAR ?auto_25379 ) ( IS-CRATE ?auto_25380 ) ( not ( = ?auto_25379 ?auto_25380 ) ) ( not ( = ?auto_25381 ?auto_25379 ) ) ( not ( = ?auto_25382 ?auto_25379 ) ) ( not ( = ?auto_25386 ?auto_25379 ) ) ( not ( = ?auto_25384 ?auto_25379 ) ) ( AVAILABLE ?auto_25388 ) ( IN ?auto_25380 ?auto_25385 ) ( TRUCK-AT ?auto_25385 ?auto_25391 ) ( ON ?auto_25379 ?auto_25378 ) ( not ( = ?auto_25378 ?auto_25379 ) ) ( not ( = ?auto_25378 ?auto_25380 ) ) ( not ( = ?auto_25378 ?auto_25381 ) ) ( not ( = ?auto_25378 ?auto_25382 ) ) ( not ( = ?auto_25378 ?auto_25386 ) ) ( not ( = ?auto_25378 ?auto_25384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25380 ?auto_25381 ?auto_25382 )
      ( MAKE-4CRATE-VERIFY ?auto_25378 ?auto_25379 ?auto_25380 ?auto_25381 ?auto_25382 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25392 - SURFACE
      ?auto_25393 - SURFACE
    )
    :vars
    (
      ?auto_25401 - HOIST
      ?auto_25402 - PLACE
      ?auto_25395 - SURFACE
      ?auto_25404 - PLACE
      ?auto_25403 - HOIST
      ?auto_25399 - SURFACE
      ?auto_25400 - PLACE
      ?auto_25394 - HOIST
      ?auto_25396 - SURFACE
      ?auto_25397 - SURFACE
      ?auto_25398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25401 ?auto_25402 ) ( IS-CRATE ?auto_25393 ) ( not ( = ?auto_25392 ?auto_25393 ) ) ( not ( = ?auto_25395 ?auto_25392 ) ) ( not ( = ?auto_25395 ?auto_25393 ) ) ( not ( = ?auto_25404 ?auto_25402 ) ) ( HOIST-AT ?auto_25403 ?auto_25404 ) ( not ( = ?auto_25401 ?auto_25403 ) ) ( SURFACE-AT ?auto_25393 ?auto_25404 ) ( ON ?auto_25393 ?auto_25399 ) ( CLEAR ?auto_25393 ) ( not ( = ?auto_25392 ?auto_25399 ) ) ( not ( = ?auto_25393 ?auto_25399 ) ) ( not ( = ?auto_25395 ?auto_25399 ) ) ( IS-CRATE ?auto_25392 ) ( not ( = ?auto_25400 ?auto_25402 ) ) ( not ( = ?auto_25404 ?auto_25400 ) ) ( HOIST-AT ?auto_25394 ?auto_25400 ) ( not ( = ?auto_25401 ?auto_25394 ) ) ( not ( = ?auto_25403 ?auto_25394 ) ) ( AVAILABLE ?auto_25394 ) ( SURFACE-AT ?auto_25392 ?auto_25400 ) ( ON ?auto_25392 ?auto_25396 ) ( CLEAR ?auto_25392 ) ( not ( = ?auto_25392 ?auto_25396 ) ) ( not ( = ?auto_25393 ?auto_25396 ) ) ( not ( = ?auto_25395 ?auto_25396 ) ) ( not ( = ?auto_25399 ?auto_25396 ) ) ( SURFACE-AT ?auto_25397 ?auto_25402 ) ( CLEAR ?auto_25397 ) ( IS-CRATE ?auto_25395 ) ( not ( = ?auto_25397 ?auto_25395 ) ) ( not ( = ?auto_25392 ?auto_25397 ) ) ( not ( = ?auto_25393 ?auto_25397 ) ) ( not ( = ?auto_25399 ?auto_25397 ) ) ( not ( = ?auto_25396 ?auto_25397 ) ) ( AVAILABLE ?auto_25401 ) ( TRUCK-AT ?auto_25398 ?auto_25404 ) ( LIFTING ?auto_25403 ?auto_25395 ) )
    :subtasks
    ( ( !LOAD ?auto_25403 ?auto_25395 ?auto_25398 ?auto_25404 )
      ( MAKE-2CRATE ?auto_25395 ?auto_25392 ?auto_25393 )
      ( MAKE-1CRATE-VERIFY ?auto_25392 ?auto_25393 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25405 - SURFACE
      ?auto_25406 - SURFACE
      ?auto_25407 - SURFACE
    )
    :vars
    (
      ?auto_25412 - HOIST
      ?auto_25417 - PLACE
      ?auto_25410 - PLACE
      ?auto_25416 - HOIST
      ?auto_25408 - SURFACE
      ?auto_25415 - PLACE
      ?auto_25413 - HOIST
      ?auto_25411 - SURFACE
      ?auto_25409 - SURFACE
      ?auto_25414 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25412 ?auto_25417 ) ( IS-CRATE ?auto_25407 ) ( not ( = ?auto_25406 ?auto_25407 ) ) ( not ( = ?auto_25405 ?auto_25406 ) ) ( not ( = ?auto_25405 ?auto_25407 ) ) ( not ( = ?auto_25410 ?auto_25417 ) ) ( HOIST-AT ?auto_25416 ?auto_25410 ) ( not ( = ?auto_25412 ?auto_25416 ) ) ( SURFACE-AT ?auto_25407 ?auto_25410 ) ( ON ?auto_25407 ?auto_25408 ) ( CLEAR ?auto_25407 ) ( not ( = ?auto_25406 ?auto_25408 ) ) ( not ( = ?auto_25407 ?auto_25408 ) ) ( not ( = ?auto_25405 ?auto_25408 ) ) ( IS-CRATE ?auto_25406 ) ( not ( = ?auto_25415 ?auto_25417 ) ) ( not ( = ?auto_25410 ?auto_25415 ) ) ( HOIST-AT ?auto_25413 ?auto_25415 ) ( not ( = ?auto_25412 ?auto_25413 ) ) ( not ( = ?auto_25416 ?auto_25413 ) ) ( AVAILABLE ?auto_25413 ) ( SURFACE-AT ?auto_25406 ?auto_25415 ) ( ON ?auto_25406 ?auto_25411 ) ( CLEAR ?auto_25406 ) ( not ( = ?auto_25406 ?auto_25411 ) ) ( not ( = ?auto_25407 ?auto_25411 ) ) ( not ( = ?auto_25405 ?auto_25411 ) ) ( not ( = ?auto_25408 ?auto_25411 ) ) ( SURFACE-AT ?auto_25409 ?auto_25417 ) ( CLEAR ?auto_25409 ) ( IS-CRATE ?auto_25405 ) ( not ( = ?auto_25409 ?auto_25405 ) ) ( not ( = ?auto_25406 ?auto_25409 ) ) ( not ( = ?auto_25407 ?auto_25409 ) ) ( not ( = ?auto_25408 ?auto_25409 ) ) ( not ( = ?auto_25411 ?auto_25409 ) ) ( AVAILABLE ?auto_25412 ) ( TRUCK-AT ?auto_25414 ?auto_25410 ) ( LIFTING ?auto_25416 ?auto_25405 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25406 ?auto_25407 )
      ( MAKE-2CRATE-VERIFY ?auto_25405 ?auto_25406 ?auto_25407 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25418 - SURFACE
      ?auto_25419 - SURFACE
      ?auto_25420 - SURFACE
      ?auto_25421 - SURFACE
    )
    :vars
    (
      ?auto_25424 - HOIST
      ?auto_25423 - PLACE
      ?auto_25422 - PLACE
      ?auto_25427 - HOIST
      ?auto_25425 - SURFACE
      ?auto_25430 - PLACE
      ?auto_25428 - HOIST
      ?auto_25429 - SURFACE
      ?auto_25426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25424 ?auto_25423 ) ( IS-CRATE ?auto_25421 ) ( not ( = ?auto_25420 ?auto_25421 ) ) ( not ( = ?auto_25419 ?auto_25420 ) ) ( not ( = ?auto_25419 ?auto_25421 ) ) ( not ( = ?auto_25422 ?auto_25423 ) ) ( HOIST-AT ?auto_25427 ?auto_25422 ) ( not ( = ?auto_25424 ?auto_25427 ) ) ( SURFACE-AT ?auto_25421 ?auto_25422 ) ( ON ?auto_25421 ?auto_25425 ) ( CLEAR ?auto_25421 ) ( not ( = ?auto_25420 ?auto_25425 ) ) ( not ( = ?auto_25421 ?auto_25425 ) ) ( not ( = ?auto_25419 ?auto_25425 ) ) ( IS-CRATE ?auto_25420 ) ( not ( = ?auto_25430 ?auto_25423 ) ) ( not ( = ?auto_25422 ?auto_25430 ) ) ( HOIST-AT ?auto_25428 ?auto_25430 ) ( not ( = ?auto_25424 ?auto_25428 ) ) ( not ( = ?auto_25427 ?auto_25428 ) ) ( AVAILABLE ?auto_25428 ) ( SURFACE-AT ?auto_25420 ?auto_25430 ) ( ON ?auto_25420 ?auto_25429 ) ( CLEAR ?auto_25420 ) ( not ( = ?auto_25420 ?auto_25429 ) ) ( not ( = ?auto_25421 ?auto_25429 ) ) ( not ( = ?auto_25419 ?auto_25429 ) ) ( not ( = ?auto_25425 ?auto_25429 ) ) ( SURFACE-AT ?auto_25418 ?auto_25423 ) ( CLEAR ?auto_25418 ) ( IS-CRATE ?auto_25419 ) ( not ( = ?auto_25418 ?auto_25419 ) ) ( not ( = ?auto_25420 ?auto_25418 ) ) ( not ( = ?auto_25421 ?auto_25418 ) ) ( not ( = ?auto_25425 ?auto_25418 ) ) ( not ( = ?auto_25429 ?auto_25418 ) ) ( AVAILABLE ?auto_25424 ) ( TRUCK-AT ?auto_25426 ?auto_25422 ) ( LIFTING ?auto_25427 ?auto_25419 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25419 ?auto_25420 ?auto_25421 )
      ( MAKE-3CRATE-VERIFY ?auto_25418 ?auto_25419 ?auto_25420 ?auto_25421 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25431 - SURFACE
      ?auto_25432 - SURFACE
      ?auto_25433 - SURFACE
      ?auto_25434 - SURFACE
      ?auto_25435 - SURFACE
    )
    :vars
    (
      ?auto_25438 - HOIST
      ?auto_25437 - PLACE
      ?auto_25436 - PLACE
      ?auto_25441 - HOIST
      ?auto_25439 - SURFACE
      ?auto_25444 - PLACE
      ?auto_25442 - HOIST
      ?auto_25443 - SURFACE
      ?auto_25440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25438 ?auto_25437 ) ( IS-CRATE ?auto_25435 ) ( not ( = ?auto_25434 ?auto_25435 ) ) ( not ( = ?auto_25433 ?auto_25434 ) ) ( not ( = ?auto_25433 ?auto_25435 ) ) ( not ( = ?auto_25436 ?auto_25437 ) ) ( HOIST-AT ?auto_25441 ?auto_25436 ) ( not ( = ?auto_25438 ?auto_25441 ) ) ( SURFACE-AT ?auto_25435 ?auto_25436 ) ( ON ?auto_25435 ?auto_25439 ) ( CLEAR ?auto_25435 ) ( not ( = ?auto_25434 ?auto_25439 ) ) ( not ( = ?auto_25435 ?auto_25439 ) ) ( not ( = ?auto_25433 ?auto_25439 ) ) ( IS-CRATE ?auto_25434 ) ( not ( = ?auto_25444 ?auto_25437 ) ) ( not ( = ?auto_25436 ?auto_25444 ) ) ( HOIST-AT ?auto_25442 ?auto_25444 ) ( not ( = ?auto_25438 ?auto_25442 ) ) ( not ( = ?auto_25441 ?auto_25442 ) ) ( AVAILABLE ?auto_25442 ) ( SURFACE-AT ?auto_25434 ?auto_25444 ) ( ON ?auto_25434 ?auto_25443 ) ( CLEAR ?auto_25434 ) ( not ( = ?auto_25434 ?auto_25443 ) ) ( not ( = ?auto_25435 ?auto_25443 ) ) ( not ( = ?auto_25433 ?auto_25443 ) ) ( not ( = ?auto_25439 ?auto_25443 ) ) ( SURFACE-AT ?auto_25432 ?auto_25437 ) ( CLEAR ?auto_25432 ) ( IS-CRATE ?auto_25433 ) ( not ( = ?auto_25432 ?auto_25433 ) ) ( not ( = ?auto_25434 ?auto_25432 ) ) ( not ( = ?auto_25435 ?auto_25432 ) ) ( not ( = ?auto_25439 ?auto_25432 ) ) ( not ( = ?auto_25443 ?auto_25432 ) ) ( AVAILABLE ?auto_25438 ) ( TRUCK-AT ?auto_25440 ?auto_25436 ) ( LIFTING ?auto_25441 ?auto_25433 ) ( ON ?auto_25432 ?auto_25431 ) ( not ( = ?auto_25431 ?auto_25432 ) ) ( not ( = ?auto_25431 ?auto_25433 ) ) ( not ( = ?auto_25431 ?auto_25434 ) ) ( not ( = ?auto_25431 ?auto_25435 ) ) ( not ( = ?auto_25431 ?auto_25439 ) ) ( not ( = ?auto_25431 ?auto_25443 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25433 ?auto_25434 ?auto_25435 )
      ( MAKE-4CRATE-VERIFY ?auto_25431 ?auto_25432 ?auto_25433 ?auto_25434 ?auto_25435 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25445 - SURFACE
      ?auto_25446 - SURFACE
    )
    :vars
    (
      ?auto_25449 - HOIST
      ?auto_25448 - PLACE
      ?auto_25451 - SURFACE
      ?auto_25447 - PLACE
      ?auto_25453 - HOIST
      ?auto_25450 - SURFACE
      ?auto_25456 - PLACE
      ?auto_25454 - HOIST
      ?auto_25455 - SURFACE
      ?auto_25457 - SURFACE
      ?auto_25452 - TRUCK
      ?auto_25458 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25449 ?auto_25448 ) ( IS-CRATE ?auto_25446 ) ( not ( = ?auto_25445 ?auto_25446 ) ) ( not ( = ?auto_25451 ?auto_25445 ) ) ( not ( = ?auto_25451 ?auto_25446 ) ) ( not ( = ?auto_25447 ?auto_25448 ) ) ( HOIST-AT ?auto_25453 ?auto_25447 ) ( not ( = ?auto_25449 ?auto_25453 ) ) ( SURFACE-AT ?auto_25446 ?auto_25447 ) ( ON ?auto_25446 ?auto_25450 ) ( CLEAR ?auto_25446 ) ( not ( = ?auto_25445 ?auto_25450 ) ) ( not ( = ?auto_25446 ?auto_25450 ) ) ( not ( = ?auto_25451 ?auto_25450 ) ) ( IS-CRATE ?auto_25445 ) ( not ( = ?auto_25456 ?auto_25448 ) ) ( not ( = ?auto_25447 ?auto_25456 ) ) ( HOIST-AT ?auto_25454 ?auto_25456 ) ( not ( = ?auto_25449 ?auto_25454 ) ) ( not ( = ?auto_25453 ?auto_25454 ) ) ( AVAILABLE ?auto_25454 ) ( SURFACE-AT ?auto_25445 ?auto_25456 ) ( ON ?auto_25445 ?auto_25455 ) ( CLEAR ?auto_25445 ) ( not ( = ?auto_25445 ?auto_25455 ) ) ( not ( = ?auto_25446 ?auto_25455 ) ) ( not ( = ?auto_25451 ?auto_25455 ) ) ( not ( = ?auto_25450 ?auto_25455 ) ) ( SURFACE-AT ?auto_25457 ?auto_25448 ) ( CLEAR ?auto_25457 ) ( IS-CRATE ?auto_25451 ) ( not ( = ?auto_25457 ?auto_25451 ) ) ( not ( = ?auto_25445 ?auto_25457 ) ) ( not ( = ?auto_25446 ?auto_25457 ) ) ( not ( = ?auto_25450 ?auto_25457 ) ) ( not ( = ?auto_25455 ?auto_25457 ) ) ( AVAILABLE ?auto_25449 ) ( TRUCK-AT ?auto_25452 ?auto_25447 ) ( AVAILABLE ?auto_25453 ) ( SURFACE-AT ?auto_25451 ?auto_25447 ) ( ON ?auto_25451 ?auto_25458 ) ( CLEAR ?auto_25451 ) ( not ( = ?auto_25445 ?auto_25458 ) ) ( not ( = ?auto_25446 ?auto_25458 ) ) ( not ( = ?auto_25451 ?auto_25458 ) ) ( not ( = ?auto_25450 ?auto_25458 ) ) ( not ( = ?auto_25455 ?auto_25458 ) ) ( not ( = ?auto_25457 ?auto_25458 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25453 ?auto_25451 ?auto_25458 ?auto_25447 )
      ( MAKE-2CRATE ?auto_25451 ?auto_25445 ?auto_25446 )
      ( MAKE-1CRATE-VERIFY ?auto_25445 ?auto_25446 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25459 - SURFACE
      ?auto_25460 - SURFACE
      ?auto_25461 - SURFACE
    )
    :vars
    (
      ?auto_25469 - HOIST
      ?auto_25464 - PLACE
      ?auto_25470 - PLACE
      ?auto_25467 - HOIST
      ?auto_25462 - SURFACE
      ?auto_25471 - PLACE
      ?auto_25465 - HOIST
      ?auto_25468 - SURFACE
      ?auto_25463 - SURFACE
      ?auto_25466 - TRUCK
      ?auto_25472 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25469 ?auto_25464 ) ( IS-CRATE ?auto_25461 ) ( not ( = ?auto_25460 ?auto_25461 ) ) ( not ( = ?auto_25459 ?auto_25460 ) ) ( not ( = ?auto_25459 ?auto_25461 ) ) ( not ( = ?auto_25470 ?auto_25464 ) ) ( HOIST-AT ?auto_25467 ?auto_25470 ) ( not ( = ?auto_25469 ?auto_25467 ) ) ( SURFACE-AT ?auto_25461 ?auto_25470 ) ( ON ?auto_25461 ?auto_25462 ) ( CLEAR ?auto_25461 ) ( not ( = ?auto_25460 ?auto_25462 ) ) ( not ( = ?auto_25461 ?auto_25462 ) ) ( not ( = ?auto_25459 ?auto_25462 ) ) ( IS-CRATE ?auto_25460 ) ( not ( = ?auto_25471 ?auto_25464 ) ) ( not ( = ?auto_25470 ?auto_25471 ) ) ( HOIST-AT ?auto_25465 ?auto_25471 ) ( not ( = ?auto_25469 ?auto_25465 ) ) ( not ( = ?auto_25467 ?auto_25465 ) ) ( AVAILABLE ?auto_25465 ) ( SURFACE-AT ?auto_25460 ?auto_25471 ) ( ON ?auto_25460 ?auto_25468 ) ( CLEAR ?auto_25460 ) ( not ( = ?auto_25460 ?auto_25468 ) ) ( not ( = ?auto_25461 ?auto_25468 ) ) ( not ( = ?auto_25459 ?auto_25468 ) ) ( not ( = ?auto_25462 ?auto_25468 ) ) ( SURFACE-AT ?auto_25463 ?auto_25464 ) ( CLEAR ?auto_25463 ) ( IS-CRATE ?auto_25459 ) ( not ( = ?auto_25463 ?auto_25459 ) ) ( not ( = ?auto_25460 ?auto_25463 ) ) ( not ( = ?auto_25461 ?auto_25463 ) ) ( not ( = ?auto_25462 ?auto_25463 ) ) ( not ( = ?auto_25468 ?auto_25463 ) ) ( AVAILABLE ?auto_25469 ) ( TRUCK-AT ?auto_25466 ?auto_25470 ) ( AVAILABLE ?auto_25467 ) ( SURFACE-AT ?auto_25459 ?auto_25470 ) ( ON ?auto_25459 ?auto_25472 ) ( CLEAR ?auto_25459 ) ( not ( = ?auto_25460 ?auto_25472 ) ) ( not ( = ?auto_25461 ?auto_25472 ) ) ( not ( = ?auto_25459 ?auto_25472 ) ) ( not ( = ?auto_25462 ?auto_25472 ) ) ( not ( = ?auto_25468 ?auto_25472 ) ) ( not ( = ?auto_25463 ?auto_25472 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25460 ?auto_25461 )
      ( MAKE-2CRATE-VERIFY ?auto_25459 ?auto_25460 ?auto_25461 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25473 - SURFACE
      ?auto_25474 - SURFACE
      ?auto_25475 - SURFACE
      ?auto_25476 - SURFACE
    )
    :vars
    (
      ?auto_25482 - HOIST
      ?auto_25478 - PLACE
      ?auto_25483 - PLACE
      ?auto_25477 - HOIST
      ?auto_25484 - SURFACE
      ?auto_25481 - PLACE
      ?auto_25486 - HOIST
      ?auto_25480 - SURFACE
      ?auto_25485 - TRUCK
      ?auto_25479 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25482 ?auto_25478 ) ( IS-CRATE ?auto_25476 ) ( not ( = ?auto_25475 ?auto_25476 ) ) ( not ( = ?auto_25474 ?auto_25475 ) ) ( not ( = ?auto_25474 ?auto_25476 ) ) ( not ( = ?auto_25483 ?auto_25478 ) ) ( HOIST-AT ?auto_25477 ?auto_25483 ) ( not ( = ?auto_25482 ?auto_25477 ) ) ( SURFACE-AT ?auto_25476 ?auto_25483 ) ( ON ?auto_25476 ?auto_25484 ) ( CLEAR ?auto_25476 ) ( not ( = ?auto_25475 ?auto_25484 ) ) ( not ( = ?auto_25476 ?auto_25484 ) ) ( not ( = ?auto_25474 ?auto_25484 ) ) ( IS-CRATE ?auto_25475 ) ( not ( = ?auto_25481 ?auto_25478 ) ) ( not ( = ?auto_25483 ?auto_25481 ) ) ( HOIST-AT ?auto_25486 ?auto_25481 ) ( not ( = ?auto_25482 ?auto_25486 ) ) ( not ( = ?auto_25477 ?auto_25486 ) ) ( AVAILABLE ?auto_25486 ) ( SURFACE-AT ?auto_25475 ?auto_25481 ) ( ON ?auto_25475 ?auto_25480 ) ( CLEAR ?auto_25475 ) ( not ( = ?auto_25475 ?auto_25480 ) ) ( not ( = ?auto_25476 ?auto_25480 ) ) ( not ( = ?auto_25474 ?auto_25480 ) ) ( not ( = ?auto_25484 ?auto_25480 ) ) ( SURFACE-AT ?auto_25473 ?auto_25478 ) ( CLEAR ?auto_25473 ) ( IS-CRATE ?auto_25474 ) ( not ( = ?auto_25473 ?auto_25474 ) ) ( not ( = ?auto_25475 ?auto_25473 ) ) ( not ( = ?auto_25476 ?auto_25473 ) ) ( not ( = ?auto_25484 ?auto_25473 ) ) ( not ( = ?auto_25480 ?auto_25473 ) ) ( AVAILABLE ?auto_25482 ) ( TRUCK-AT ?auto_25485 ?auto_25483 ) ( AVAILABLE ?auto_25477 ) ( SURFACE-AT ?auto_25474 ?auto_25483 ) ( ON ?auto_25474 ?auto_25479 ) ( CLEAR ?auto_25474 ) ( not ( = ?auto_25475 ?auto_25479 ) ) ( not ( = ?auto_25476 ?auto_25479 ) ) ( not ( = ?auto_25474 ?auto_25479 ) ) ( not ( = ?auto_25484 ?auto_25479 ) ) ( not ( = ?auto_25480 ?auto_25479 ) ) ( not ( = ?auto_25473 ?auto_25479 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25474 ?auto_25475 ?auto_25476 )
      ( MAKE-3CRATE-VERIFY ?auto_25473 ?auto_25474 ?auto_25475 ?auto_25476 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25487 - SURFACE
      ?auto_25488 - SURFACE
      ?auto_25489 - SURFACE
      ?auto_25490 - SURFACE
      ?auto_25491 - SURFACE
    )
    :vars
    (
      ?auto_25497 - HOIST
      ?auto_25493 - PLACE
      ?auto_25498 - PLACE
      ?auto_25492 - HOIST
      ?auto_25499 - SURFACE
      ?auto_25496 - PLACE
      ?auto_25501 - HOIST
      ?auto_25495 - SURFACE
      ?auto_25500 - TRUCK
      ?auto_25494 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25497 ?auto_25493 ) ( IS-CRATE ?auto_25491 ) ( not ( = ?auto_25490 ?auto_25491 ) ) ( not ( = ?auto_25489 ?auto_25490 ) ) ( not ( = ?auto_25489 ?auto_25491 ) ) ( not ( = ?auto_25498 ?auto_25493 ) ) ( HOIST-AT ?auto_25492 ?auto_25498 ) ( not ( = ?auto_25497 ?auto_25492 ) ) ( SURFACE-AT ?auto_25491 ?auto_25498 ) ( ON ?auto_25491 ?auto_25499 ) ( CLEAR ?auto_25491 ) ( not ( = ?auto_25490 ?auto_25499 ) ) ( not ( = ?auto_25491 ?auto_25499 ) ) ( not ( = ?auto_25489 ?auto_25499 ) ) ( IS-CRATE ?auto_25490 ) ( not ( = ?auto_25496 ?auto_25493 ) ) ( not ( = ?auto_25498 ?auto_25496 ) ) ( HOIST-AT ?auto_25501 ?auto_25496 ) ( not ( = ?auto_25497 ?auto_25501 ) ) ( not ( = ?auto_25492 ?auto_25501 ) ) ( AVAILABLE ?auto_25501 ) ( SURFACE-AT ?auto_25490 ?auto_25496 ) ( ON ?auto_25490 ?auto_25495 ) ( CLEAR ?auto_25490 ) ( not ( = ?auto_25490 ?auto_25495 ) ) ( not ( = ?auto_25491 ?auto_25495 ) ) ( not ( = ?auto_25489 ?auto_25495 ) ) ( not ( = ?auto_25499 ?auto_25495 ) ) ( SURFACE-AT ?auto_25488 ?auto_25493 ) ( CLEAR ?auto_25488 ) ( IS-CRATE ?auto_25489 ) ( not ( = ?auto_25488 ?auto_25489 ) ) ( not ( = ?auto_25490 ?auto_25488 ) ) ( not ( = ?auto_25491 ?auto_25488 ) ) ( not ( = ?auto_25499 ?auto_25488 ) ) ( not ( = ?auto_25495 ?auto_25488 ) ) ( AVAILABLE ?auto_25497 ) ( TRUCK-AT ?auto_25500 ?auto_25498 ) ( AVAILABLE ?auto_25492 ) ( SURFACE-AT ?auto_25489 ?auto_25498 ) ( ON ?auto_25489 ?auto_25494 ) ( CLEAR ?auto_25489 ) ( not ( = ?auto_25490 ?auto_25494 ) ) ( not ( = ?auto_25491 ?auto_25494 ) ) ( not ( = ?auto_25489 ?auto_25494 ) ) ( not ( = ?auto_25499 ?auto_25494 ) ) ( not ( = ?auto_25495 ?auto_25494 ) ) ( not ( = ?auto_25488 ?auto_25494 ) ) ( ON ?auto_25488 ?auto_25487 ) ( not ( = ?auto_25487 ?auto_25488 ) ) ( not ( = ?auto_25487 ?auto_25489 ) ) ( not ( = ?auto_25487 ?auto_25490 ) ) ( not ( = ?auto_25487 ?auto_25491 ) ) ( not ( = ?auto_25487 ?auto_25499 ) ) ( not ( = ?auto_25487 ?auto_25495 ) ) ( not ( = ?auto_25487 ?auto_25494 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25489 ?auto_25490 ?auto_25491 )
      ( MAKE-4CRATE-VERIFY ?auto_25487 ?auto_25488 ?auto_25489 ?auto_25490 ?auto_25491 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25502 - SURFACE
      ?auto_25503 - SURFACE
    )
    :vars
    (
      ?auto_25510 - HOIST
      ?auto_25505 - PLACE
      ?auto_25512 - SURFACE
      ?auto_25511 - PLACE
      ?auto_25504 - HOIST
      ?auto_25513 - SURFACE
      ?auto_25509 - PLACE
      ?auto_25515 - HOIST
      ?auto_25508 - SURFACE
      ?auto_25506 - SURFACE
      ?auto_25507 - SURFACE
      ?auto_25514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25510 ?auto_25505 ) ( IS-CRATE ?auto_25503 ) ( not ( = ?auto_25502 ?auto_25503 ) ) ( not ( = ?auto_25512 ?auto_25502 ) ) ( not ( = ?auto_25512 ?auto_25503 ) ) ( not ( = ?auto_25511 ?auto_25505 ) ) ( HOIST-AT ?auto_25504 ?auto_25511 ) ( not ( = ?auto_25510 ?auto_25504 ) ) ( SURFACE-AT ?auto_25503 ?auto_25511 ) ( ON ?auto_25503 ?auto_25513 ) ( CLEAR ?auto_25503 ) ( not ( = ?auto_25502 ?auto_25513 ) ) ( not ( = ?auto_25503 ?auto_25513 ) ) ( not ( = ?auto_25512 ?auto_25513 ) ) ( IS-CRATE ?auto_25502 ) ( not ( = ?auto_25509 ?auto_25505 ) ) ( not ( = ?auto_25511 ?auto_25509 ) ) ( HOIST-AT ?auto_25515 ?auto_25509 ) ( not ( = ?auto_25510 ?auto_25515 ) ) ( not ( = ?auto_25504 ?auto_25515 ) ) ( AVAILABLE ?auto_25515 ) ( SURFACE-AT ?auto_25502 ?auto_25509 ) ( ON ?auto_25502 ?auto_25508 ) ( CLEAR ?auto_25502 ) ( not ( = ?auto_25502 ?auto_25508 ) ) ( not ( = ?auto_25503 ?auto_25508 ) ) ( not ( = ?auto_25512 ?auto_25508 ) ) ( not ( = ?auto_25513 ?auto_25508 ) ) ( SURFACE-AT ?auto_25506 ?auto_25505 ) ( CLEAR ?auto_25506 ) ( IS-CRATE ?auto_25512 ) ( not ( = ?auto_25506 ?auto_25512 ) ) ( not ( = ?auto_25502 ?auto_25506 ) ) ( not ( = ?auto_25503 ?auto_25506 ) ) ( not ( = ?auto_25513 ?auto_25506 ) ) ( not ( = ?auto_25508 ?auto_25506 ) ) ( AVAILABLE ?auto_25510 ) ( AVAILABLE ?auto_25504 ) ( SURFACE-AT ?auto_25512 ?auto_25511 ) ( ON ?auto_25512 ?auto_25507 ) ( CLEAR ?auto_25512 ) ( not ( = ?auto_25502 ?auto_25507 ) ) ( not ( = ?auto_25503 ?auto_25507 ) ) ( not ( = ?auto_25512 ?auto_25507 ) ) ( not ( = ?auto_25513 ?auto_25507 ) ) ( not ( = ?auto_25508 ?auto_25507 ) ) ( not ( = ?auto_25506 ?auto_25507 ) ) ( TRUCK-AT ?auto_25514 ?auto_25505 ) )
    :subtasks
    ( ( !DRIVE ?auto_25514 ?auto_25505 ?auto_25511 )
      ( MAKE-2CRATE ?auto_25512 ?auto_25502 ?auto_25503 )
      ( MAKE-1CRATE-VERIFY ?auto_25502 ?auto_25503 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25516 - SURFACE
      ?auto_25517 - SURFACE
      ?auto_25518 - SURFACE
    )
    :vars
    (
      ?auto_25522 - HOIST
      ?auto_25525 - PLACE
      ?auto_25521 - PLACE
      ?auto_25527 - HOIST
      ?auto_25529 - SURFACE
      ?auto_25526 - PLACE
      ?auto_25520 - HOIST
      ?auto_25519 - SURFACE
      ?auto_25528 - SURFACE
      ?auto_25523 - SURFACE
      ?auto_25524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25522 ?auto_25525 ) ( IS-CRATE ?auto_25518 ) ( not ( = ?auto_25517 ?auto_25518 ) ) ( not ( = ?auto_25516 ?auto_25517 ) ) ( not ( = ?auto_25516 ?auto_25518 ) ) ( not ( = ?auto_25521 ?auto_25525 ) ) ( HOIST-AT ?auto_25527 ?auto_25521 ) ( not ( = ?auto_25522 ?auto_25527 ) ) ( SURFACE-AT ?auto_25518 ?auto_25521 ) ( ON ?auto_25518 ?auto_25529 ) ( CLEAR ?auto_25518 ) ( not ( = ?auto_25517 ?auto_25529 ) ) ( not ( = ?auto_25518 ?auto_25529 ) ) ( not ( = ?auto_25516 ?auto_25529 ) ) ( IS-CRATE ?auto_25517 ) ( not ( = ?auto_25526 ?auto_25525 ) ) ( not ( = ?auto_25521 ?auto_25526 ) ) ( HOIST-AT ?auto_25520 ?auto_25526 ) ( not ( = ?auto_25522 ?auto_25520 ) ) ( not ( = ?auto_25527 ?auto_25520 ) ) ( AVAILABLE ?auto_25520 ) ( SURFACE-AT ?auto_25517 ?auto_25526 ) ( ON ?auto_25517 ?auto_25519 ) ( CLEAR ?auto_25517 ) ( not ( = ?auto_25517 ?auto_25519 ) ) ( not ( = ?auto_25518 ?auto_25519 ) ) ( not ( = ?auto_25516 ?auto_25519 ) ) ( not ( = ?auto_25529 ?auto_25519 ) ) ( SURFACE-AT ?auto_25528 ?auto_25525 ) ( CLEAR ?auto_25528 ) ( IS-CRATE ?auto_25516 ) ( not ( = ?auto_25528 ?auto_25516 ) ) ( not ( = ?auto_25517 ?auto_25528 ) ) ( not ( = ?auto_25518 ?auto_25528 ) ) ( not ( = ?auto_25529 ?auto_25528 ) ) ( not ( = ?auto_25519 ?auto_25528 ) ) ( AVAILABLE ?auto_25522 ) ( AVAILABLE ?auto_25527 ) ( SURFACE-AT ?auto_25516 ?auto_25521 ) ( ON ?auto_25516 ?auto_25523 ) ( CLEAR ?auto_25516 ) ( not ( = ?auto_25517 ?auto_25523 ) ) ( not ( = ?auto_25518 ?auto_25523 ) ) ( not ( = ?auto_25516 ?auto_25523 ) ) ( not ( = ?auto_25529 ?auto_25523 ) ) ( not ( = ?auto_25519 ?auto_25523 ) ) ( not ( = ?auto_25528 ?auto_25523 ) ) ( TRUCK-AT ?auto_25524 ?auto_25525 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25517 ?auto_25518 )
      ( MAKE-2CRATE-VERIFY ?auto_25516 ?auto_25517 ?auto_25518 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25530 - SURFACE
      ?auto_25531 - SURFACE
      ?auto_25532 - SURFACE
      ?auto_25533 - SURFACE
    )
    :vars
    (
      ?auto_25542 - HOIST
      ?auto_25541 - PLACE
      ?auto_25535 - PLACE
      ?auto_25537 - HOIST
      ?auto_25539 - SURFACE
      ?auto_25538 - PLACE
      ?auto_25536 - HOIST
      ?auto_25534 - SURFACE
      ?auto_25543 - SURFACE
      ?auto_25540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25542 ?auto_25541 ) ( IS-CRATE ?auto_25533 ) ( not ( = ?auto_25532 ?auto_25533 ) ) ( not ( = ?auto_25531 ?auto_25532 ) ) ( not ( = ?auto_25531 ?auto_25533 ) ) ( not ( = ?auto_25535 ?auto_25541 ) ) ( HOIST-AT ?auto_25537 ?auto_25535 ) ( not ( = ?auto_25542 ?auto_25537 ) ) ( SURFACE-AT ?auto_25533 ?auto_25535 ) ( ON ?auto_25533 ?auto_25539 ) ( CLEAR ?auto_25533 ) ( not ( = ?auto_25532 ?auto_25539 ) ) ( not ( = ?auto_25533 ?auto_25539 ) ) ( not ( = ?auto_25531 ?auto_25539 ) ) ( IS-CRATE ?auto_25532 ) ( not ( = ?auto_25538 ?auto_25541 ) ) ( not ( = ?auto_25535 ?auto_25538 ) ) ( HOIST-AT ?auto_25536 ?auto_25538 ) ( not ( = ?auto_25542 ?auto_25536 ) ) ( not ( = ?auto_25537 ?auto_25536 ) ) ( AVAILABLE ?auto_25536 ) ( SURFACE-AT ?auto_25532 ?auto_25538 ) ( ON ?auto_25532 ?auto_25534 ) ( CLEAR ?auto_25532 ) ( not ( = ?auto_25532 ?auto_25534 ) ) ( not ( = ?auto_25533 ?auto_25534 ) ) ( not ( = ?auto_25531 ?auto_25534 ) ) ( not ( = ?auto_25539 ?auto_25534 ) ) ( SURFACE-AT ?auto_25530 ?auto_25541 ) ( CLEAR ?auto_25530 ) ( IS-CRATE ?auto_25531 ) ( not ( = ?auto_25530 ?auto_25531 ) ) ( not ( = ?auto_25532 ?auto_25530 ) ) ( not ( = ?auto_25533 ?auto_25530 ) ) ( not ( = ?auto_25539 ?auto_25530 ) ) ( not ( = ?auto_25534 ?auto_25530 ) ) ( AVAILABLE ?auto_25542 ) ( AVAILABLE ?auto_25537 ) ( SURFACE-AT ?auto_25531 ?auto_25535 ) ( ON ?auto_25531 ?auto_25543 ) ( CLEAR ?auto_25531 ) ( not ( = ?auto_25532 ?auto_25543 ) ) ( not ( = ?auto_25533 ?auto_25543 ) ) ( not ( = ?auto_25531 ?auto_25543 ) ) ( not ( = ?auto_25539 ?auto_25543 ) ) ( not ( = ?auto_25534 ?auto_25543 ) ) ( not ( = ?auto_25530 ?auto_25543 ) ) ( TRUCK-AT ?auto_25540 ?auto_25541 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25531 ?auto_25532 ?auto_25533 )
      ( MAKE-3CRATE-VERIFY ?auto_25530 ?auto_25531 ?auto_25532 ?auto_25533 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25544 - SURFACE
      ?auto_25545 - SURFACE
      ?auto_25546 - SURFACE
      ?auto_25547 - SURFACE
      ?auto_25548 - SURFACE
    )
    :vars
    (
      ?auto_25557 - HOIST
      ?auto_25556 - PLACE
      ?auto_25550 - PLACE
      ?auto_25552 - HOIST
      ?auto_25554 - SURFACE
      ?auto_25553 - PLACE
      ?auto_25551 - HOIST
      ?auto_25549 - SURFACE
      ?auto_25558 - SURFACE
      ?auto_25555 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25557 ?auto_25556 ) ( IS-CRATE ?auto_25548 ) ( not ( = ?auto_25547 ?auto_25548 ) ) ( not ( = ?auto_25546 ?auto_25547 ) ) ( not ( = ?auto_25546 ?auto_25548 ) ) ( not ( = ?auto_25550 ?auto_25556 ) ) ( HOIST-AT ?auto_25552 ?auto_25550 ) ( not ( = ?auto_25557 ?auto_25552 ) ) ( SURFACE-AT ?auto_25548 ?auto_25550 ) ( ON ?auto_25548 ?auto_25554 ) ( CLEAR ?auto_25548 ) ( not ( = ?auto_25547 ?auto_25554 ) ) ( not ( = ?auto_25548 ?auto_25554 ) ) ( not ( = ?auto_25546 ?auto_25554 ) ) ( IS-CRATE ?auto_25547 ) ( not ( = ?auto_25553 ?auto_25556 ) ) ( not ( = ?auto_25550 ?auto_25553 ) ) ( HOIST-AT ?auto_25551 ?auto_25553 ) ( not ( = ?auto_25557 ?auto_25551 ) ) ( not ( = ?auto_25552 ?auto_25551 ) ) ( AVAILABLE ?auto_25551 ) ( SURFACE-AT ?auto_25547 ?auto_25553 ) ( ON ?auto_25547 ?auto_25549 ) ( CLEAR ?auto_25547 ) ( not ( = ?auto_25547 ?auto_25549 ) ) ( not ( = ?auto_25548 ?auto_25549 ) ) ( not ( = ?auto_25546 ?auto_25549 ) ) ( not ( = ?auto_25554 ?auto_25549 ) ) ( SURFACE-AT ?auto_25545 ?auto_25556 ) ( CLEAR ?auto_25545 ) ( IS-CRATE ?auto_25546 ) ( not ( = ?auto_25545 ?auto_25546 ) ) ( not ( = ?auto_25547 ?auto_25545 ) ) ( not ( = ?auto_25548 ?auto_25545 ) ) ( not ( = ?auto_25554 ?auto_25545 ) ) ( not ( = ?auto_25549 ?auto_25545 ) ) ( AVAILABLE ?auto_25557 ) ( AVAILABLE ?auto_25552 ) ( SURFACE-AT ?auto_25546 ?auto_25550 ) ( ON ?auto_25546 ?auto_25558 ) ( CLEAR ?auto_25546 ) ( not ( = ?auto_25547 ?auto_25558 ) ) ( not ( = ?auto_25548 ?auto_25558 ) ) ( not ( = ?auto_25546 ?auto_25558 ) ) ( not ( = ?auto_25554 ?auto_25558 ) ) ( not ( = ?auto_25549 ?auto_25558 ) ) ( not ( = ?auto_25545 ?auto_25558 ) ) ( TRUCK-AT ?auto_25555 ?auto_25556 ) ( ON ?auto_25545 ?auto_25544 ) ( not ( = ?auto_25544 ?auto_25545 ) ) ( not ( = ?auto_25544 ?auto_25546 ) ) ( not ( = ?auto_25544 ?auto_25547 ) ) ( not ( = ?auto_25544 ?auto_25548 ) ) ( not ( = ?auto_25544 ?auto_25554 ) ) ( not ( = ?auto_25544 ?auto_25549 ) ) ( not ( = ?auto_25544 ?auto_25558 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25546 ?auto_25547 ?auto_25548 )
      ( MAKE-4CRATE-VERIFY ?auto_25544 ?auto_25545 ?auto_25546 ?auto_25547 ?auto_25548 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25559 - SURFACE
      ?auto_25560 - SURFACE
    )
    :vars
    (
      ?auto_25569 - HOIST
      ?auto_25568 - PLACE
      ?auto_25572 - SURFACE
      ?auto_25562 - PLACE
      ?auto_25564 - HOIST
      ?auto_25566 - SURFACE
      ?auto_25565 - PLACE
      ?auto_25563 - HOIST
      ?auto_25561 - SURFACE
      ?auto_25571 - SURFACE
      ?auto_25570 - SURFACE
      ?auto_25567 - TRUCK
      ?auto_25573 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25569 ?auto_25568 ) ( IS-CRATE ?auto_25560 ) ( not ( = ?auto_25559 ?auto_25560 ) ) ( not ( = ?auto_25572 ?auto_25559 ) ) ( not ( = ?auto_25572 ?auto_25560 ) ) ( not ( = ?auto_25562 ?auto_25568 ) ) ( HOIST-AT ?auto_25564 ?auto_25562 ) ( not ( = ?auto_25569 ?auto_25564 ) ) ( SURFACE-AT ?auto_25560 ?auto_25562 ) ( ON ?auto_25560 ?auto_25566 ) ( CLEAR ?auto_25560 ) ( not ( = ?auto_25559 ?auto_25566 ) ) ( not ( = ?auto_25560 ?auto_25566 ) ) ( not ( = ?auto_25572 ?auto_25566 ) ) ( IS-CRATE ?auto_25559 ) ( not ( = ?auto_25565 ?auto_25568 ) ) ( not ( = ?auto_25562 ?auto_25565 ) ) ( HOIST-AT ?auto_25563 ?auto_25565 ) ( not ( = ?auto_25569 ?auto_25563 ) ) ( not ( = ?auto_25564 ?auto_25563 ) ) ( AVAILABLE ?auto_25563 ) ( SURFACE-AT ?auto_25559 ?auto_25565 ) ( ON ?auto_25559 ?auto_25561 ) ( CLEAR ?auto_25559 ) ( not ( = ?auto_25559 ?auto_25561 ) ) ( not ( = ?auto_25560 ?auto_25561 ) ) ( not ( = ?auto_25572 ?auto_25561 ) ) ( not ( = ?auto_25566 ?auto_25561 ) ) ( IS-CRATE ?auto_25572 ) ( not ( = ?auto_25571 ?auto_25572 ) ) ( not ( = ?auto_25559 ?auto_25571 ) ) ( not ( = ?auto_25560 ?auto_25571 ) ) ( not ( = ?auto_25566 ?auto_25571 ) ) ( not ( = ?auto_25561 ?auto_25571 ) ) ( AVAILABLE ?auto_25564 ) ( SURFACE-AT ?auto_25572 ?auto_25562 ) ( ON ?auto_25572 ?auto_25570 ) ( CLEAR ?auto_25572 ) ( not ( = ?auto_25559 ?auto_25570 ) ) ( not ( = ?auto_25560 ?auto_25570 ) ) ( not ( = ?auto_25572 ?auto_25570 ) ) ( not ( = ?auto_25566 ?auto_25570 ) ) ( not ( = ?auto_25561 ?auto_25570 ) ) ( not ( = ?auto_25571 ?auto_25570 ) ) ( TRUCK-AT ?auto_25567 ?auto_25568 ) ( SURFACE-AT ?auto_25573 ?auto_25568 ) ( CLEAR ?auto_25573 ) ( LIFTING ?auto_25569 ?auto_25571 ) ( IS-CRATE ?auto_25571 ) ( not ( = ?auto_25573 ?auto_25571 ) ) ( not ( = ?auto_25559 ?auto_25573 ) ) ( not ( = ?auto_25560 ?auto_25573 ) ) ( not ( = ?auto_25572 ?auto_25573 ) ) ( not ( = ?auto_25566 ?auto_25573 ) ) ( not ( = ?auto_25561 ?auto_25573 ) ) ( not ( = ?auto_25570 ?auto_25573 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25573 ?auto_25571 )
      ( MAKE-2CRATE ?auto_25572 ?auto_25559 ?auto_25560 )
      ( MAKE-1CRATE-VERIFY ?auto_25559 ?auto_25560 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25574 - SURFACE
      ?auto_25575 - SURFACE
      ?auto_25576 - SURFACE
    )
    :vars
    (
      ?auto_25584 - HOIST
      ?auto_25577 - PLACE
      ?auto_25579 - PLACE
      ?auto_25587 - HOIST
      ?auto_25580 - SURFACE
      ?auto_25583 - PLACE
      ?auto_25588 - HOIST
      ?auto_25585 - SURFACE
      ?auto_25578 - SURFACE
      ?auto_25582 - SURFACE
      ?auto_25581 - TRUCK
      ?auto_25586 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25584 ?auto_25577 ) ( IS-CRATE ?auto_25576 ) ( not ( = ?auto_25575 ?auto_25576 ) ) ( not ( = ?auto_25574 ?auto_25575 ) ) ( not ( = ?auto_25574 ?auto_25576 ) ) ( not ( = ?auto_25579 ?auto_25577 ) ) ( HOIST-AT ?auto_25587 ?auto_25579 ) ( not ( = ?auto_25584 ?auto_25587 ) ) ( SURFACE-AT ?auto_25576 ?auto_25579 ) ( ON ?auto_25576 ?auto_25580 ) ( CLEAR ?auto_25576 ) ( not ( = ?auto_25575 ?auto_25580 ) ) ( not ( = ?auto_25576 ?auto_25580 ) ) ( not ( = ?auto_25574 ?auto_25580 ) ) ( IS-CRATE ?auto_25575 ) ( not ( = ?auto_25583 ?auto_25577 ) ) ( not ( = ?auto_25579 ?auto_25583 ) ) ( HOIST-AT ?auto_25588 ?auto_25583 ) ( not ( = ?auto_25584 ?auto_25588 ) ) ( not ( = ?auto_25587 ?auto_25588 ) ) ( AVAILABLE ?auto_25588 ) ( SURFACE-AT ?auto_25575 ?auto_25583 ) ( ON ?auto_25575 ?auto_25585 ) ( CLEAR ?auto_25575 ) ( not ( = ?auto_25575 ?auto_25585 ) ) ( not ( = ?auto_25576 ?auto_25585 ) ) ( not ( = ?auto_25574 ?auto_25585 ) ) ( not ( = ?auto_25580 ?auto_25585 ) ) ( IS-CRATE ?auto_25574 ) ( not ( = ?auto_25578 ?auto_25574 ) ) ( not ( = ?auto_25575 ?auto_25578 ) ) ( not ( = ?auto_25576 ?auto_25578 ) ) ( not ( = ?auto_25580 ?auto_25578 ) ) ( not ( = ?auto_25585 ?auto_25578 ) ) ( AVAILABLE ?auto_25587 ) ( SURFACE-AT ?auto_25574 ?auto_25579 ) ( ON ?auto_25574 ?auto_25582 ) ( CLEAR ?auto_25574 ) ( not ( = ?auto_25575 ?auto_25582 ) ) ( not ( = ?auto_25576 ?auto_25582 ) ) ( not ( = ?auto_25574 ?auto_25582 ) ) ( not ( = ?auto_25580 ?auto_25582 ) ) ( not ( = ?auto_25585 ?auto_25582 ) ) ( not ( = ?auto_25578 ?auto_25582 ) ) ( TRUCK-AT ?auto_25581 ?auto_25577 ) ( SURFACE-AT ?auto_25586 ?auto_25577 ) ( CLEAR ?auto_25586 ) ( LIFTING ?auto_25584 ?auto_25578 ) ( IS-CRATE ?auto_25578 ) ( not ( = ?auto_25586 ?auto_25578 ) ) ( not ( = ?auto_25575 ?auto_25586 ) ) ( not ( = ?auto_25576 ?auto_25586 ) ) ( not ( = ?auto_25574 ?auto_25586 ) ) ( not ( = ?auto_25580 ?auto_25586 ) ) ( not ( = ?auto_25585 ?auto_25586 ) ) ( not ( = ?auto_25582 ?auto_25586 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25575 ?auto_25576 )
      ( MAKE-2CRATE-VERIFY ?auto_25574 ?auto_25575 ?auto_25576 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25589 - SURFACE
      ?auto_25590 - SURFACE
      ?auto_25591 - SURFACE
      ?auto_25592 - SURFACE
    )
    :vars
    (
      ?auto_25602 - HOIST
      ?auto_25596 - PLACE
      ?auto_25599 - PLACE
      ?auto_25593 - HOIST
      ?auto_25603 - SURFACE
      ?auto_25600 - PLACE
      ?auto_25595 - HOIST
      ?auto_25597 - SURFACE
      ?auto_25594 - SURFACE
      ?auto_25598 - TRUCK
      ?auto_25601 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25602 ?auto_25596 ) ( IS-CRATE ?auto_25592 ) ( not ( = ?auto_25591 ?auto_25592 ) ) ( not ( = ?auto_25590 ?auto_25591 ) ) ( not ( = ?auto_25590 ?auto_25592 ) ) ( not ( = ?auto_25599 ?auto_25596 ) ) ( HOIST-AT ?auto_25593 ?auto_25599 ) ( not ( = ?auto_25602 ?auto_25593 ) ) ( SURFACE-AT ?auto_25592 ?auto_25599 ) ( ON ?auto_25592 ?auto_25603 ) ( CLEAR ?auto_25592 ) ( not ( = ?auto_25591 ?auto_25603 ) ) ( not ( = ?auto_25592 ?auto_25603 ) ) ( not ( = ?auto_25590 ?auto_25603 ) ) ( IS-CRATE ?auto_25591 ) ( not ( = ?auto_25600 ?auto_25596 ) ) ( not ( = ?auto_25599 ?auto_25600 ) ) ( HOIST-AT ?auto_25595 ?auto_25600 ) ( not ( = ?auto_25602 ?auto_25595 ) ) ( not ( = ?auto_25593 ?auto_25595 ) ) ( AVAILABLE ?auto_25595 ) ( SURFACE-AT ?auto_25591 ?auto_25600 ) ( ON ?auto_25591 ?auto_25597 ) ( CLEAR ?auto_25591 ) ( not ( = ?auto_25591 ?auto_25597 ) ) ( not ( = ?auto_25592 ?auto_25597 ) ) ( not ( = ?auto_25590 ?auto_25597 ) ) ( not ( = ?auto_25603 ?auto_25597 ) ) ( IS-CRATE ?auto_25590 ) ( not ( = ?auto_25589 ?auto_25590 ) ) ( not ( = ?auto_25591 ?auto_25589 ) ) ( not ( = ?auto_25592 ?auto_25589 ) ) ( not ( = ?auto_25603 ?auto_25589 ) ) ( not ( = ?auto_25597 ?auto_25589 ) ) ( AVAILABLE ?auto_25593 ) ( SURFACE-AT ?auto_25590 ?auto_25599 ) ( ON ?auto_25590 ?auto_25594 ) ( CLEAR ?auto_25590 ) ( not ( = ?auto_25591 ?auto_25594 ) ) ( not ( = ?auto_25592 ?auto_25594 ) ) ( not ( = ?auto_25590 ?auto_25594 ) ) ( not ( = ?auto_25603 ?auto_25594 ) ) ( not ( = ?auto_25597 ?auto_25594 ) ) ( not ( = ?auto_25589 ?auto_25594 ) ) ( TRUCK-AT ?auto_25598 ?auto_25596 ) ( SURFACE-AT ?auto_25601 ?auto_25596 ) ( CLEAR ?auto_25601 ) ( LIFTING ?auto_25602 ?auto_25589 ) ( IS-CRATE ?auto_25589 ) ( not ( = ?auto_25601 ?auto_25589 ) ) ( not ( = ?auto_25591 ?auto_25601 ) ) ( not ( = ?auto_25592 ?auto_25601 ) ) ( not ( = ?auto_25590 ?auto_25601 ) ) ( not ( = ?auto_25603 ?auto_25601 ) ) ( not ( = ?auto_25597 ?auto_25601 ) ) ( not ( = ?auto_25594 ?auto_25601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25590 ?auto_25591 ?auto_25592 )
      ( MAKE-3CRATE-VERIFY ?auto_25589 ?auto_25590 ?auto_25591 ?auto_25592 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25604 - SURFACE
      ?auto_25605 - SURFACE
      ?auto_25606 - SURFACE
      ?auto_25607 - SURFACE
      ?auto_25608 - SURFACE
    )
    :vars
    (
      ?auto_25617 - HOIST
      ?auto_25612 - PLACE
      ?auto_25615 - PLACE
      ?auto_25609 - HOIST
      ?auto_25618 - SURFACE
      ?auto_25616 - PLACE
      ?auto_25611 - HOIST
      ?auto_25613 - SURFACE
      ?auto_25610 - SURFACE
      ?auto_25614 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25617 ?auto_25612 ) ( IS-CRATE ?auto_25608 ) ( not ( = ?auto_25607 ?auto_25608 ) ) ( not ( = ?auto_25606 ?auto_25607 ) ) ( not ( = ?auto_25606 ?auto_25608 ) ) ( not ( = ?auto_25615 ?auto_25612 ) ) ( HOIST-AT ?auto_25609 ?auto_25615 ) ( not ( = ?auto_25617 ?auto_25609 ) ) ( SURFACE-AT ?auto_25608 ?auto_25615 ) ( ON ?auto_25608 ?auto_25618 ) ( CLEAR ?auto_25608 ) ( not ( = ?auto_25607 ?auto_25618 ) ) ( not ( = ?auto_25608 ?auto_25618 ) ) ( not ( = ?auto_25606 ?auto_25618 ) ) ( IS-CRATE ?auto_25607 ) ( not ( = ?auto_25616 ?auto_25612 ) ) ( not ( = ?auto_25615 ?auto_25616 ) ) ( HOIST-AT ?auto_25611 ?auto_25616 ) ( not ( = ?auto_25617 ?auto_25611 ) ) ( not ( = ?auto_25609 ?auto_25611 ) ) ( AVAILABLE ?auto_25611 ) ( SURFACE-AT ?auto_25607 ?auto_25616 ) ( ON ?auto_25607 ?auto_25613 ) ( CLEAR ?auto_25607 ) ( not ( = ?auto_25607 ?auto_25613 ) ) ( not ( = ?auto_25608 ?auto_25613 ) ) ( not ( = ?auto_25606 ?auto_25613 ) ) ( not ( = ?auto_25618 ?auto_25613 ) ) ( IS-CRATE ?auto_25606 ) ( not ( = ?auto_25605 ?auto_25606 ) ) ( not ( = ?auto_25607 ?auto_25605 ) ) ( not ( = ?auto_25608 ?auto_25605 ) ) ( not ( = ?auto_25618 ?auto_25605 ) ) ( not ( = ?auto_25613 ?auto_25605 ) ) ( AVAILABLE ?auto_25609 ) ( SURFACE-AT ?auto_25606 ?auto_25615 ) ( ON ?auto_25606 ?auto_25610 ) ( CLEAR ?auto_25606 ) ( not ( = ?auto_25607 ?auto_25610 ) ) ( not ( = ?auto_25608 ?auto_25610 ) ) ( not ( = ?auto_25606 ?auto_25610 ) ) ( not ( = ?auto_25618 ?auto_25610 ) ) ( not ( = ?auto_25613 ?auto_25610 ) ) ( not ( = ?auto_25605 ?auto_25610 ) ) ( TRUCK-AT ?auto_25614 ?auto_25612 ) ( SURFACE-AT ?auto_25604 ?auto_25612 ) ( CLEAR ?auto_25604 ) ( LIFTING ?auto_25617 ?auto_25605 ) ( IS-CRATE ?auto_25605 ) ( not ( = ?auto_25604 ?auto_25605 ) ) ( not ( = ?auto_25607 ?auto_25604 ) ) ( not ( = ?auto_25608 ?auto_25604 ) ) ( not ( = ?auto_25606 ?auto_25604 ) ) ( not ( = ?auto_25618 ?auto_25604 ) ) ( not ( = ?auto_25613 ?auto_25604 ) ) ( not ( = ?auto_25610 ?auto_25604 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25606 ?auto_25607 ?auto_25608 )
      ( MAKE-4CRATE-VERIFY ?auto_25604 ?auto_25605 ?auto_25606 ?auto_25607 ?auto_25608 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25619 - SURFACE
      ?auto_25620 - SURFACE
    )
    :vars
    (
      ?auto_25630 - HOIST
      ?auto_25624 - PLACE
      ?auto_25631 - SURFACE
      ?auto_25627 - PLACE
      ?auto_25621 - HOIST
      ?auto_25633 - SURFACE
      ?auto_25628 - PLACE
      ?auto_25623 - HOIST
      ?auto_25625 - SURFACE
      ?auto_25632 - SURFACE
      ?auto_25622 - SURFACE
      ?auto_25626 - TRUCK
      ?auto_25629 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25630 ?auto_25624 ) ( IS-CRATE ?auto_25620 ) ( not ( = ?auto_25619 ?auto_25620 ) ) ( not ( = ?auto_25631 ?auto_25619 ) ) ( not ( = ?auto_25631 ?auto_25620 ) ) ( not ( = ?auto_25627 ?auto_25624 ) ) ( HOIST-AT ?auto_25621 ?auto_25627 ) ( not ( = ?auto_25630 ?auto_25621 ) ) ( SURFACE-AT ?auto_25620 ?auto_25627 ) ( ON ?auto_25620 ?auto_25633 ) ( CLEAR ?auto_25620 ) ( not ( = ?auto_25619 ?auto_25633 ) ) ( not ( = ?auto_25620 ?auto_25633 ) ) ( not ( = ?auto_25631 ?auto_25633 ) ) ( IS-CRATE ?auto_25619 ) ( not ( = ?auto_25628 ?auto_25624 ) ) ( not ( = ?auto_25627 ?auto_25628 ) ) ( HOIST-AT ?auto_25623 ?auto_25628 ) ( not ( = ?auto_25630 ?auto_25623 ) ) ( not ( = ?auto_25621 ?auto_25623 ) ) ( AVAILABLE ?auto_25623 ) ( SURFACE-AT ?auto_25619 ?auto_25628 ) ( ON ?auto_25619 ?auto_25625 ) ( CLEAR ?auto_25619 ) ( not ( = ?auto_25619 ?auto_25625 ) ) ( not ( = ?auto_25620 ?auto_25625 ) ) ( not ( = ?auto_25631 ?auto_25625 ) ) ( not ( = ?auto_25633 ?auto_25625 ) ) ( IS-CRATE ?auto_25631 ) ( not ( = ?auto_25632 ?auto_25631 ) ) ( not ( = ?auto_25619 ?auto_25632 ) ) ( not ( = ?auto_25620 ?auto_25632 ) ) ( not ( = ?auto_25633 ?auto_25632 ) ) ( not ( = ?auto_25625 ?auto_25632 ) ) ( AVAILABLE ?auto_25621 ) ( SURFACE-AT ?auto_25631 ?auto_25627 ) ( ON ?auto_25631 ?auto_25622 ) ( CLEAR ?auto_25631 ) ( not ( = ?auto_25619 ?auto_25622 ) ) ( not ( = ?auto_25620 ?auto_25622 ) ) ( not ( = ?auto_25631 ?auto_25622 ) ) ( not ( = ?auto_25633 ?auto_25622 ) ) ( not ( = ?auto_25625 ?auto_25622 ) ) ( not ( = ?auto_25632 ?auto_25622 ) ) ( TRUCK-AT ?auto_25626 ?auto_25624 ) ( SURFACE-AT ?auto_25629 ?auto_25624 ) ( CLEAR ?auto_25629 ) ( IS-CRATE ?auto_25632 ) ( not ( = ?auto_25629 ?auto_25632 ) ) ( not ( = ?auto_25619 ?auto_25629 ) ) ( not ( = ?auto_25620 ?auto_25629 ) ) ( not ( = ?auto_25631 ?auto_25629 ) ) ( not ( = ?auto_25633 ?auto_25629 ) ) ( not ( = ?auto_25625 ?auto_25629 ) ) ( not ( = ?auto_25622 ?auto_25629 ) ) ( AVAILABLE ?auto_25630 ) ( IN ?auto_25632 ?auto_25626 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25630 ?auto_25632 ?auto_25626 ?auto_25624 )
      ( MAKE-2CRATE ?auto_25631 ?auto_25619 ?auto_25620 )
      ( MAKE-1CRATE-VERIFY ?auto_25619 ?auto_25620 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25634 - SURFACE
      ?auto_25635 - SURFACE
      ?auto_25636 - SURFACE
    )
    :vars
    (
      ?auto_25639 - HOIST
      ?auto_25643 - PLACE
      ?auto_25647 - PLACE
      ?auto_25637 - HOIST
      ?auto_25641 - SURFACE
      ?auto_25645 - PLACE
      ?auto_25642 - HOIST
      ?auto_25638 - SURFACE
      ?auto_25648 - SURFACE
      ?auto_25646 - SURFACE
      ?auto_25644 - TRUCK
      ?auto_25640 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25639 ?auto_25643 ) ( IS-CRATE ?auto_25636 ) ( not ( = ?auto_25635 ?auto_25636 ) ) ( not ( = ?auto_25634 ?auto_25635 ) ) ( not ( = ?auto_25634 ?auto_25636 ) ) ( not ( = ?auto_25647 ?auto_25643 ) ) ( HOIST-AT ?auto_25637 ?auto_25647 ) ( not ( = ?auto_25639 ?auto_25637 ) ) ( SURFACE-AT ?auto_25636 ?auto_25647 ) ( ON ?auto_25636 ?auto_25641 ) ( CLEAR ?auto_25636 ) ( not ( = ?auto_25635 ?auto_25641 ) ) ( not ( = ?auto_25636 ?auto_25641 ) ) ( not ( = ?auto_25634 ?auto_25641 ) ) ( IS-CRATE ?auto_25635 ) ( not ( = ?auto_25645 ?auto_25643 ) ) ( not ( = ?auto_25647 ?auto_25645 ) ) ( HOIST-AT ?auto_25642 ?auto_25645 ) ( not ( = ?auto_25639 ?auto_25642 ) ) ( not ( = ?auto_25637 ?auto_25642 ) ) ( AVAILABLE ?auto_25642 ) ( SURFACE-AT ?auto_25635 ?auto_25645 ) ( ON ?auto_25635 ?auto_25638 ) ( CLEAR ?auto_25635 ) ( not ( = ?auto_25635 ?auto_25638 ) ) ( not ( = ?auto_25636 ?auto_25638 ) ) ( not ( = ?auto_25634 ?auto_25638 ) ) ( not ( = ?auto_25641 ?auto_25638 ) ) ( IS-CRATE ?auto_25634 ) ( not ( = ?auto_25648 ?auto_25634 ) ) ( not ( = ?auto_25635 ?auto_25648 ) ) ( not ( = ?auto_25636 ?auto_25648 ) ) ( not ( = ?auto_25641 ?auto_25648 ) ) ( not ( = ?auto_25638 ?auto_25648 ) ) ( AVAILABLE ?auto_25637 ) ( SURFACE-AT ?auto_25634 ?auto_25647 ) ( ON ?auto_25634 ?auto_25646 ) ( CLEAR ?auto_25634 ) ( not ( = ?auto_25635 ?auto_25646 ) ) ( not ( = ?auto_25636 ?auto_25646 ) ) ( not ( = ?auto_25634 ?auto_25646 ) ) ( not ( = ?auto_25641 ?auto_25646 ) ) ( not ( = ?auto_25638 ?auto_25646 ) ) ( not ( = ?auto_25648 ?auto_25646 ) ) ( TRUCK-AT ?auto_25644 ?auto_25643 ) ( SURFACE-AT ?auto_25640 ?auto_25643 ) ( CLEAR ?auto_25640 ) ( IS-CRATE ?auto_25648 ) ( not ( = ?auto_25640 ?auto_25648 ) ) ( not ( = ?auto_25635 ?auto_25640 ) ) ( not ( = ?auto_25636 ?auto_25640 ) ) ( not ( = ?auto_25634 ?auto_25640 ) ) ( not ( = ?auto_25641 ?auto_25640 ) ) ( not ( = ?auto_25638 ?auto_25640 ) ) ( not ( = ?auto_25646 ?auto_25640 ) ) ( AVAILABLE ?auto_25639 ) ( IN ?auto_25648 ?auto_25644 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25635 ?auto_25636 )
      ( MAKE-2CRATE-VERIFY ?auto_25634 ?auto_25635 ?auto_25636 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25649 - SURFACE
      ?auto_25650 - SURFACE
      ?auto_25651 - SURFACE
      ?auto_25652 - SURFACE
    )
    :vars
    (
      ?auto_25662 - HOIST
      ?auto_25657 - PLACE
      ?auto_25655 - PLACE
      ?auto_25660 - HOIST
      ?auto_25654 - SURFACE
      ?auto_25659 - PLACE
      ?auto_25653 - HOIST
      ?auto_25656 - SURFACE
      ?auto_25658 - SURFACE
      ?auto_25661 - TRUCK
      ?auto_25663 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25662 ?auto_25657 ) ( IS-CRATE ?auto_25652 ) ( not ( = ?auto_25651 ?auto_25652 ) ) ( not ( = ?auto_25650 ?auto_25651 ) ) ( not ( = ?auto_25650 ?auto_25652 ) ) ( not ( = ?auto_25655 ?auto_25657 ) ) ( HOIST-AT ?auto_25660 ?auto_25655 ) ( not ( = ?auto_25662 ?auto_25660 ) ) ( SURFACE-AT ?auto_25652 ?auto_25655 ) ( ON ?auto_25652 ?auto_25654 ) ( CLEAR ?auto_25652 ) ( not ( = ?auto_25651 ?auto_25654 ) ) ( not ( = ?auto_25652 ?auto_25654 ) ) ( not ( = ?auto_25650 ?auto_25654 ) ) ( IS-CRATE ?auto_25651 ) ( not ( = ?auto_25659 ?auto_25657 ) ) ( not ( = ?auto_25655 ?auto_25659 ) ) ( HOIST-AT ?auto_25653 ?auto_25659 ) ( not ( = ?auto_25662 ?auto_25653 ) ) ( not ( = ?auto_25660 ?auto_25653 ) ) ( AVAILABLE ?auto_25653 ) ( SURFACE-AT ?auto_25651 ?auto_25659 ) ( ON ?auto_25651 ?auto_25656 ) ( CLEAR ?auto_25651 ) ( not ( = ?auto_25651 ?auto_25656 ) ) ( not ( = ?auto_25652 ?auto_25656 ) ) ( not ( = ?auto_25650 ?auto_25656 ) ) ( not ( = ?auto_25654 ?auto_25656 ) ) ( IS-CRATE ?auto_25650 ) ( not ( = ?auto_25649 ?auto_25650 ) ) ( not ( = ?auto_25651 ?auto_25649 ) ) ( not ( = ?auto_25652 ?auto_25649 ) ) ( not ( = ?auto_25654 ?auto_25649 ) ) ( not ( = ?auto_25656 ?auto_25649 ) ) ( AVAILABLE ?auto_25660 ) ( SURFACE-AT ?auto_25650 ?auto_25655 ) ( ON ?auto_25650 ?auto_25658 ) ( CLEAR ?auto_25650 ) ( not ( = ?auto_25651 ?auto_25658 ) ) ( not ( = ?auto_25652 ?auto_25658 ) ) ( not ( = ?auto_25650 ?auto_25658 ) ) ( not ( = ?auto_25654 ?auto_25658 ) ) ( not ( = ?auto_25656 ?auto_25658 ) ) ( not ( = ?auto_25649 ?auto_25658 ) ) ( TRUCK-AT ?auto_25661 ?auto_25657 ) ( SURFACE-AT ?auto_25663 ?auto_25657 ) ( CLEAR ?auto_25663 ) ( IS-CRATE ?auto_25649 ) ( not ( = ?auto_25663 ?auto_25649 ) ) ( not ( = ?auto_25651 ?auto_25663 ) ) ( not ( = ?auto_25652 ?auto_25663 ) ) ( not ( = ?auto_25650 ?auto_25663 ) ) ( not ( = ?auto_25654 ?auto_25663 ) ) ( not ( = ?auto_25656 ?auto_25663 ) ) ( not ( = ?auto_25658 ?auto_25663 ) ) ( AVAILABLE ?auto_25662 ) ( IN ?auto_25649 ?auto_25661 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25650 ?auto_25651 ?auto_25652 )
      ( MAKE-3CRATE-VERIFY ?auto_25649 ?auto_25650 ?auto_25651 ?auto_25652 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25664 - SURFACE
      ?auto_25665 - SURFACE
      ?auto_25666 - SURFACE
      ?auto_25667 - SURFACE
      ?auto_25668 - SURFACE
    )
    :vars
    (
      ?auto_25678 - HOIST
      ?auto_25673 - PLACE
      ?auto_25671 - PLACE
      ?auto_25676 - HOIST
      ?auto_25670 - SURFACE
      ?auto_25675 - PLACE
      ?auto_25669 - HOIST
      ?auto_25672 - SURFACE
      ?auto_25674 - SURFACE
      ?auto_25677 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25678 ?auto_25673 ) ( IS-CRATE ?auto_25668 ) ( not ( = ?auto_25667 ?auto_25668 ) ) ( not ( = ?auto_25666 ?auto_25667 ) ) ( not ( = ?auto_25666 ?auto_25668 ) ) ( not ( = ?auto_25671 ?auto_25673 ) ) ( HOIST-AT ?auto_25676 ?auto_25671 ) ( not ( = ?auto_25678 ?auto_25676 ) ) ( SURFACE-AT ?auto_25668 ?auto_25671 ) ( ON ?auto_25668 ?auto_25670 ) ( CLEAR ?auto_25668 ) ( not ( = ?auto_25667 ?auto_25670 ) ) ( not ( = ?auto_25668 ?auto_25670 ) ) ( not ( = ?auto_25666 ?auto_25670 ) ) ( IS-CRATE ?auto_25667 ) ( not ( = ?auto_25675 ?auto_25673 ) ) ( not ( = ?auto_25671 ?auto_25675 ) ) ( HOIST-AT ?auto_25669 ?auto_25675 ) ( not ( = ?auto_25678 ?auto_25669 ) ) ( not ( = ?auto_25676 ?auto_25669 ) ) ( AVAILABLE ?auto_25669 ) ( SURFACE-AT ?auto_25667 ?auto_25675 ) ( ON ?auto_25667 ?auto_25672 ) ( CLEAR ?auto_25667 ) ( not ( = ?auto_25667 ?auto_25672 ) ) ( not ( = ?auto_25668 ?auto_25672 ) ) ( not ( = ?auto_25666 ?auto_25672 ) ) ( not ( = ?auto_25670 ?auto_25672 ) ) ( IS-CRATE ?auto_25666 ) ( not ( = ?auto_25665 ?auto_25666 ) ) ( not ( = ?auto_25667 ?auto_25665 ) ) ( not ( = ?auto_25668 ?auto_25665 ) ) ( not ( = ?auto_25670 ?auto_25665 ) ) ( not ( = ?auto_25672 ?auto_25665 ) ) ( AVAILABLE ?auto_25676 ) ( SURFACE-AT ?auto_25666 ?auto_25671 ) ( ON ?auto_25666 ?auto_25674 ) ( CLEAR ?auto_25666 ) ( not ( = ?auto_25667 ?auto_25674 ) ) ( not ( = ?auto_25668 ?auto_25674 ) ) ( not ( = ?auto_25666 ?auto_25674 ) ) ( not ( = ?auto_25670 ?auto_25674 ) ) ( not ( = ?auto_25672 ?auto_25674 ) ) ( not ( = ?auto_25665 ?auto_25674 ) ) ( TRUCK-AT ?auto_25677 ?auto_25673 ) ( SURFACE-AT ?auto_25664 ?auto_25673 ) ( CLEAR ?auto_25664 ) ( IS-CRATE ?auto_25665 ) ( not ( = ?auto_25664 ?auto_25665 ) ) ( not ( = ?auto_25667 ?auto_25664 ) ) ( not ( = ?auto_25668 ?auto_25664 ) ) ( not ( = ?auto_25666 ?auto_25664 ) ) ( not ( = ?auto_25670 ?auto_25664 ) ) ( not ( = ?auto_25672 ?auto_25664 ) ) ( not ( = ?auto_25674 ?auto_25664 ) ) ( AVAILABLE ?auto_25678 ) ( IN ?auto_25665 ?auto_25677 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25666 ?auto_25667 ?auto_25668 )
      ( MAKE-4CRATE-VERIFY ?auto_25664 ?auto_25665 ?auto_25666 ?auto_25667 ?auto_25668 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25679 - SURFACE
      ?auto_25680 - SURFACE
    )
    :vars
    (
      ?auto_25692 - HOIST
      ?auto_25685 - PLACE
      ?auto_25689 - SURFACE
      ?auto_25683 - PLACE
      ?auto_25690 - HOIST
      ?auto_25682 - SURFACE
      ?auto_25688 - PLACE
      ?auto_25681 - HOIST
      ?auto_25684 - SURFACE
      ?auto_25686 - SURFACE
      ?auto_25687 - SURFACE
      ?auto_25693 - SURFACE
      ?auto_25691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25692 ?auto_25685 ) ( IS-CRATE ?auto_25680 ) ( not ( = ?auto_25679 ?auto_25680 ) ) ( not ( = ?auto_25689 ?auto_25679 ) ) ( not ( = ?auto_25689 ?auto_25680 ) ) ( not ( = ?auto_25683 ?auto_25685 ) ) ( HOIST-AT ?auto_25690 ?auto_25683 ) ( not ( = ?auto_25692 ?auto_25690 ) ) ( SURFACE-AT ?auto_25680 ?auto_25683 ) ( ON ?auto_25680 ?auto_25682 ) ( CLEAR ?auto_25680 ) ( not ( = ?auto_25679 ?auto_25682 ) ) ( not ( = ?auto_25680 ?auto_25682 ) ) ( not ( = ?auto_25689 ?auto_25682 ) ) ( IS-CRATE ?auto_25679 ) ( not ( = ?auto_25688 ?auto_25685 ) ) ( not ( = ?auto_25683 ?auto_25688 ) ) ( HOIST-AT ?auto_25681 ?auto_25688 ) ( not ( = ?auto_25692 ?auto_25681 ) ) ( not ( = ?auto_25690 ?auto_25681 ) ) ( AVAILABLE ?auto_25681 ) ( SURFACE-AT ?auto_25679 ?auto_25688 ) ( ON ?auto_25679 ?auto_25684 ) ( CLEAR ?auto_25679 ) ( not ( = ?auto_25679 ?auto_25684 ) ) ( not ( = ?auto_25680 ?auto_25684 ) ) ( not ( = ?auto_25689 ?auto_25684 ) ) ( not ( = ?auto_25682 ?auto_25684 ) ) ( IS-CRATE ?auto_25689 ) ( not ( = ?auto_25686 ?auto_25689 ) ) ( not ( = ?auto_25679 ?auto_25686 ) ) ( not ( = ?auto_25680 ?auto_25686 ) ) ( not ( = ?auto_25682 ?auto_25686 ) ) ( not ( = ?auto_25684 ?auto_25686 ) ) ( AVAILABLE ?auto_25690 ) ( SURFACE-AT ?auto_25689 ?auto_25683 ) ( ON ?auto_25689 ?auto_25687 ) ( CLEAR ?auto_25689 ) ( not ( = ?auto_25679 ?auto_25687 ) ) ( not ( = ?auto_25680 ?auto_25687 ) ) ( not ( = ?auto_25689 ?auto_25687 ) ) ( not ( = ?auto_25682 ?auto_25687 ) ) ( not ( = ?auto_25684 ?auto_25687 ) ) ( not ( = ?auto_25686 ?auto_25687 ) ) ( SURFACE-AT ?auto_25693 ?auto_25685 ) ( CLEAR ?auto_25693 ) ( IS-CRATE ?auto_25686 ) ( not ( = ?auto_25693 ?auto_25686 ) ) ( not ( = ?auto_25679 ?auto_25693 ) ) ( not ( = ?auto_25680 ?auto_25693 ) ) ( not ( = ?auto_25689 ?auto_25693 ) ) ( not ( = ?auto_25682 ?auto_25693 ) ) ( not ( = ?auto_25684 ?auto_25693 ) ) ( not ( = ?auto_25687 ?auto_25693 ) ) ( AVAILABLE ?auto_25692 ) ( IN ?auto_25686 ?auto_25691 ) ( TRUCK-AT ?auto_25691 ?auto_25688 ) )
    :subtasks
    ( ( !DRIVE ?auto_25691 ?auto_25688 ?auto_25685 )
      ( MAKE-2CRATE ?auto_25689 ?auto_25679 ?auto_25680 )
      ( MAKE-1CRATE-VERIFY ?auto_25679 ?auto_25680 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25694 - SURFACE
      ?auto_25695 - SURFACE
      ?auto_25696 - SURFACE
    )
    :vars
    (
      ?auto_25706 - HOIST
      ?auto_25700 - PLACE
      ?auto_25697 - PLACE
      ?auto_25698 - HOIST
      ?auto_25708 - SURFACE
      ?auto_25703 - PLACE
      ?auto_25704 - HOIST
      ?auto_25707 - SURFACE
      ?auto_25701 - SURFACE
      ?auto_25702 - SURFACE
      ?auto_25699 - SURFACE
      ?auto_25705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25706 ?auto_25700 ) ( IS-CRATE ?auto_25696 ) ( not ( = ?auto_25695 ?auto_25696 ) ) ( not ( = ?auto_25694 ?auto_25695 ) ) ( not ( = ?auto_25694 ?auto_25696 ) ) ( not ( = ?auto_25697 ?auto_25700 ) ) ( HOIST-AT ?auto_25698 ?auto_25697 ) ( not ( = ?auto_25706 ?auto_25698 ) ) ( SURFACE-AT ?auto_25696 ?auto_25697 ) ( ON ?auto_25696 ?auto_25708 ) ( CLEAR ?auto_25696 ) ( not ( = ?auto_25695 ?auto_25708 ) ) ( not ( = ?auto_25696 ?auto_25708 ) ) ( not ( = ?auto_25694 ?auto_25708 ) ) ( IS-CRATE ?auto_25695 ) ( not ( = ?auto_25703 ?auto_25700 ) ) ( not ( = ?auto_25697 ?auto_25703 ) ) ( HOIST-AT ?auto_25704 ?auto_25703 ) ( not ( = ?auto_25706 ?auto_25704 ) ) ( not ( = ?auto_25698 ?auto_25704 ) ) ( AVAILABLE ?auto_25704 ) ( SURFACE-AT ?auto_25695 ?auto_25703 ) ( ON ?auto_25695 ?auto_25707 ) ( CLEAR ?auto_25695 ) ( not ( = ?auto_25695 ?auto_25707 ) ) ( not ( = ?auto_25696 ?auto_25707 ) ) ( not ( = ?auto_25694 ?auto_25707 ) ) ( not ( = ?auto_25708 ?auto_25707 ) ) ( IS-CRATE ?auto_25694 ) ( not ( = ?auto_25701 ?auto_25694 ) ) ( not ( = ?auto_25695 ?auto_25701 ) ) ( not ( = ?auto_25696 ?auto_25701 ) ) ( not ( = ?auto_25708 ?auto_25701 ) ) ( not ( = ?auto_25707 ?auto_25701 ) ) ( AVAILABLE ?auto_25698 ) ( SURFACE-AT ?auto_25694 ?auto_25697 ) ( ON ?auto_25694 ?auto_25702 ) ( CLEAR ?auto_25694 ) ( not ( = ?auto_25695 ?auto_25702 ) ) ( not ( = ?auto_25696 ?auto_25702 ) ) ( not ( = ?auto_25694 ?auto_25702 ) ) ( not ( = ?auto_25708 ?auto_25702 ) ) ( not ( = ?auto_25707 ?auto_25702 ) ) ( not ( = ?auto_25701 ?auto_25702 ) ) ( SURFACE-AT ?auto_25699 ?auto_25700 ) ( CLEAR ?auto_25699 ) ( IS-CRATE ?auto_25701 ) ( not ( = ?auto_25699 ?auto_25701 ) ) ( not ( = ?auto_25695 ?auto_25699 ) ) ( not ( = ?auto_25696 ?auto_25699 ) ) ( not ( = ?auto_25694 ?auto_25699 ) ) ( not ( = ?auto_25708 ?auto_25699 ) ) ( not ( = ?auto_25707 ?auto_25699 ) ) ( not ( = ?auto_25702 ?auto_25699 ) ) ( AVAILABLE ?auto_25706 ) ( IN ?auto_25701 ?auto_25705 ) ( TRUCK-AT ?auto_25705 ?auto_25703 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25695 ?auto_25696 )
      ( MAKE-2CRATE-VERIFY ?auto_25694 ?auto_25695 ?auto_25696 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25709 - SURFACE
      ?auto_25710 - SURFACE
      ?auto_25711 - SURFACE
      ?auto_25712 - SURFACE
    )
    :vars
    (
      ?auto_25717 - HOIST
      ?auto_25720 - PLACE
      ?auto_25716 - PLACE
      ?auto_25723 - HOIST
      ?auto_25719 - SURFACE
      ?auto_25722 - PLACE
      ?auto_25715 - HOIST
      ?auto_25718 - SURFACE
      ?auto_25713 - SURFACE
      ?auto_25721 - SURFACE
      ?auto_25714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25717 ?auto_25720 ) ( IS-CRATE ?auto_25712 ) ( not ( = ?auto_25711 ?auto_25712 ) ) ( not ( = ?auto_25710 ?auto_25711 ) ) ( not ( = ?auto_25710 ?auto_25712 ) ) ( not ( = ?auto_25716 ?auto_25720 ) ) ( HOIST-AT ?auto_25723 ?auto_25716 ) ( not ( = ?auto_25717 ?auto_25723 ) ) ( SURFACE-AT ?auto_25712 ?auto_25716 ) ( ON ?auto_25712 ?auto_25719 ) ( CLEAR ?auto_25712 ) ( not ( = ?auto_25711 ?auto_25719 ) ) ( not ( = ?auto_25712 ?auto_25719 ) ) ( not ( = ?auto_25710 ?auto_25719 ) ) ( IS-CRATE ?auto_25711 ) ( not ( = ?auto_25722 ?auto_25720 ) ) ( not ( = ?auto_25716 ?auto_25722 ) ) ( HOIST-AT ?auto_25715 ?auto_25722 ) ( not ( = ?auto_25717 ?auto_25715 ) ) ( not ( = ?auto_25723 ?auto_25715 ) ) ( AVAILABLE ?auto_25715 ) ( SURFACE-AT ?auto_25711 ?auto_25722 ) ( ON ?auto_25711 ?auto_25718 ) ( CLEAR ?auto_25711 ) ( not ( = ?auto_25711 ?auto_25718 ) ) ( not ( = ?auto_25712 ?auto_25718 ) ) ( not ( = ?auto_25710 ?auto_25718 ) ) ( not ( = ?auto_25719 ?auto_25718 ) ) ( IS-CRATE ?auto_25710 ) ( not ( = ?auto_25709 ?auto_25710 ) ) ( not ( = ?auto_25711 ?auto_25709 ) ) ( not ( = ?auto_25712 ?auto_25709 ) ) ( not ( = ?auto_25719 ?auto_25709 ) ) ( not ( = ?auto_25718 ?auto_25709 ) ) ( AVAILABLE ?auto_25723 ) ( SURFACE-AT ?auto_25710 ?auto_25716 ) ( ON ?auto_25710 ?auto_25713 ) ( CLEAR ?auto_25710 ) ( not ( = ?auto_25711 ?auto_25713 ) ) ( not ( = ?auto_25712 ?auto_25713 ) ) ( not ( = ?auto_25710 ?auto_25713 ) ) ( not ( = ?auto_25719 ?auto_25713 ) ) ( not ( = ?auto_25718 ?auto_25713 ) ) ( not ( = ?auto_25709 ?auto_25713 ) ) ( SURFACE-AT ?auto_25721 ?auto_25720 ) ( CLEAR ?auto_25721 ) ( IS-CRATE ?auto_25709 ) ( not ( = ?auto_25721 ?auto_25709 ) ) ( not ( = ?auto_25711 ?auto_25721 ) ) ( not ( = ?auto_25712 ?auto_25721 ) ) ( not ( = ?auto_25710 ?auto_25721 ) ) ( not ( = ?auto_25719 ?auto_25721 ) ) ( not ( = ?auto_25718 ?auto_25721 ) ) ( not ( = ?auto_25713 ?auto_25721 ) ) ( AVAILABLE ?auto_25717 ) ( IN ?auto_25709 ?auto_25714 ) ( TRUCK-AT ?auto_25714 ?auto_25722 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25710 ?auto_25711 ?auto_25712 )
      ( MAKE-3CRATE-VERIFY ?auto_25709 ?auto_25710 ?auto_25711 ?auto_25712 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25724 - SURFACE
      ?auto_25725 - SURFACE
      ?auto_25726 - SURFACE
      ?auto_25727 - SURFACE
      ?auto_25728 - SURFACE
    )
    :vars
    (
      ?auto_25733 - HOIST
      ?auto_25736 - PLACE
      ?auto_25732 - PLACE
      ?auto_25738 - HOIST
      ?auto_25735 - SURFACE
      ?auto_25737 - PLACE
      ?auto_25731 - HOIST
      ?auto_25734 - SURFACE
      ?auto_25729 - SURFACE
      ?auto_25730 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25733 ?auto_25736 ) ( IS-CRATE ?auto_25728 ) ( not ( = ?auto_25727 ?auto_25728 ) ) ( not ( = ?auto_25726 ?auto_25727 ) ) ( not ( = ?auto_25726 ?auto_25728 ) ) ( not ( = ?auto_25732 ?auto_25736 ) ) ( HOIST-AT ?auto_25738 ?auto_25732 ) ( not ( = ?auto_25733 ?auto_25738 ) ) ( SURFACE-AT ?auto_25728 ?auto_25732 ) ( ON ?auto_25728 ?auto_25735 ) ( CLEAR ?auto_25728 ) ( not ( = ?auto_25727 ?auto_25735 ) ) ( not ( = ?auto_25728 ?auto_25735 ) ) ( not ( = ?auto_25726 ?auto_25735 ) ) ( IS-CRATE ?auto_25727 ) ( not ( = ?auto_25737 ?auto_25736 ) ) ( not ( = ?auto_25732 ?auto_25737 ) ) ( HOIST-AT ?auto_25731 ?auto_25737 ) ( not ( = ?auto_25733 ?auto_25731 ) ) ( not ( = ?auto_25738 ?auto_25731 ) ) ( AVAILABLE ?auto_25731 ) ( SURFACE-AT ?auto_25727 ?auto_25737 ) ( ON ?auto_25727 ?auto_25734 ) ( CLEAR ?auto_25727 ) ( not ( = ?auto_25727 ?auto_25734 ) ) ( not ( = ?auto_25728 ?auto_25734 ) ) ( not ( = ?auto_25726 ?auto_25734 ) ) ( not ( = ?auto_25735 ?auto_25734 ) ) ( IS-CRATE ?auto_25726 ) ( not ( = ?auto_25725 ?auto_25726 ) ) ( not ( = ?auto_25727 ?auto_25725 ) ) ( not ( = ?auto_25728 ?auto_25725 ) ) ( not ( = ?auto_25735 ?auto_25725 ) ) ( not ( = ?auto_25734 ?auto_25725 ) ) ( AVAILABLE ?auto_25738 ) ( SURFACE-AT ?auto_25726 ?auto_25732 ) ( ON ?auto_25726 ?auto_25729 ) ( CLEAR ?auto_25726 ) ( not ( = ?auto_25727 ?auto_25729 ) ) ( not ( = ?auto_25728 ?auto_25729 ) ) ( not ( = ?auto_25726 ?auto_25729 ) ) ( not ( = ?auto_25735 ?auto_25729 ) ) ( not ( = ?auto_25734 ?auto_25729 ) ) ( not ( = ?auto_25725 ?auto_25729 ) ) ( SURFACE-AT ?auto_25724 ?auto_25736 ) ( CLEAR ?auto_25724 ) ( IS-CRATE ?auto_25725 ) ( not ( = ?auto_25724 ?auto_25725 ) ) ( not ( = ?auto_25727 ?auto_25724 ) ) ( not ( = ?auto_25728 ?auto_25724 ) ) ( not ( = ?auto_25726 ?auto_25724 ) ) ( not ( = ?auto_25735 ?auto_25724 ) ) ( not ( = ?auto_25734 ?auto_25724 ) ) ( not ( = ?auto_25729 ?auto_25724 ) ) ( AVAILABLE ?auto_25733 ) ( IN ?auto_25725 ?auto_25730 ) ( TRUCK-AT ?auto_25730 ?auto_25737 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25726 ?auto_25727 ?auto_25728 )
      ( MAKE-4CRATE-VERIFY ?auto_25724 ?auto_25725 ?auto_25726 ?auto_25727 ?auto_25728 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25739 - SURFACE
      ?auto_25740 - SURFACE
    )
    :vars
    (
      ?auto_25745 - HOIST
      ?auto_25750 - PLACE
      ?auto_25746 - SURFACE
      ?auto_25744 - PLACE
      ?auto_25753 - HOIST
      ?auto_25748 - SURFACE
      ?auto_25752 - PLACE
      ?auto_25743 - HOIST
      ?auto_25747 - SURFACE
      ?auto_25749 - SURFACE
      ?auto_25741 - SURFACE
      ?auto_25751 - SURFACE
      ?auto_25742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25745 ?auto_25750 ) ( IS-CRATE ?auto_25740 ) ( not ( = ?auto_25739 ?auto_25740 ) ) ( not ( = ?auto_25746 ?auto_25739 ) ) ( not ( = ?auto_25746 ?auto_25740 ) ) ( not ( = ?auto_25744 ?auto_25750 ) ) ( HOIST-AT ?auto_25753 ?auto_25744 ) ( not ( = ?auto_25745 ?auto_25753 ) ) ( SURFACE-AT ?auto_25740 ?auto_25744 ) ( ON ?auto_25740 ?auto_25748 ) ( CLEAR ?auto_25740 ) ( not ( = ?auto_25739 ?auto_25748 ) ) ( not ( = ?auto_25740 ?auto_25748 ) ) ( not ( = ?auto_25746 ?auto_25748 ) ) ( IS-CRATE ?auto_25739 ) ( not ( = ?auto_25752 ?auto_25750 ) ) ( not ( = ?auto_25744 ?auto_25752 ) ) ( HOIST-AT ?auto_25743 ?auto_25752 ) ( not ( = ?auto_25745 ?auto_25743 ) ) ( not ( = ?auto_25753 ?auto_25743 ) ) ( SURFACE-AT ?auto_25739 ?auto_25752 ) ( ON ?auto_25739 ?auto_25747 ) ( CLEAR ?auto_25739 ) ( not ( = ?auto_25739 ?auto_25747 ) ) ( not ( = ?auto_25740 ?auto_25747 ) ) ( not ( = ?auto_25746 ?auto_25747 ) ) ( not ( = ?auto_25748 ?auto_25747 ) ) ( IS-CRATE ?auto_25746 ) ( not ( = ?auto_25749 ?auto_25746 ) ) ( not ( = ?auto_25739 ?auto_25749 ) ) ( not ( = ?auto_25740 ?auto_25749 ) ) ( not ( = ?auto_25748 ?auto_25749 ) ) ( not ( = ?auto_25747 ?auto_25749 ) ) ( AVAILABLE ?auto_25753 ) ( SURFACE-AT ?auto_25746 ?auto_25744 ) ( ON ?auto_25746 ?auto_25741 ) ( CLEAR ?auto_25746 ) ( not ( = ?auto_25739 ?auto_25741 ) ) ( not ( = ?auto_25740 ?auto_25741 ) ) ( not ( = ?auto_25746 ?auto_25741 ) ) ( not ( = ?auto_25748 ?auto_25741 ) ) ( not ( = ?auto_25747 ?auto_25741 ) ) ( not ( = ?auto_25749 ?auto_25741 ) ) ( SURFACE-AT ?auto_25751 ?auto_25750 ) ( CLEAR ?auto_25751 ) ( IS-CRATE ?auto_25749 ) ( not ( = ?auto_25751 ?auto_25749 ) ) ( not ( = ?auto_25739 ?auto_25751 ) ) ( not ( = ?auto_25740 ?auto_25751 ) ) ( not ( = ?auto_25746 ?auto_25751 ) ) ( not ( = ?auto_25748 ?auto_25751 ) ) ( not ( = ?auto_25747 ?auto_25751 ) ) ( not ( = ?auto_25741 ?auto_25751 ) ) ( AVAILABLE ?auto_25745 ) ( TRUCK-AT ?auto_25742 ?auto_25752 ) ( LIFTING ?auto_25743 ?auto_25749 ) )
    :subtasks
    ( ( !LOAD ?auto_25743 ?auto_25749 ?auto_25742 ?auto_25752 )
      ( MAKE-2CRATE ?auto_25746 ?auto_25739 ?auto_25740 )
      ( MAKE-1CRATE-VERIFY ?auto_25739 ?auto_25740 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25754 - SURFACE
      ?auto_25755 - SURFACE
      ?auto_25756 - SURFACE
    )
    :vars
    (
      ?auto_25763 - HOIST
      ?auto_25768 - PLACE
      ?auto_25759 - PLACE
      ?auto_25764 - HOIST
      ?auto_25757 - SURFACE
      ?auto_25767 - PLACE
      ?auto_25765 - HOIST
      ?auto_25760 - SURFACE
      ?auto_25761 - SURFACE
      ?auto_25762 - SURFACE
      ?auto_25758 - SURFACE
      ?auto_25766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25763 ?auto_25768 ) ( IS-CRATE ?auto_25756 ) ( not ( = ?auto_25755 ?auto_25756 ) ) ( not ( = ?auto_25754 ?auto_25755 ) ) ( not ( = ?auto_25754 ?auto_25756 ) ) ( not ( = ?auto_25759 ?auto_25768 ) ) ( HOIST-AT ?auto_25764 ?auto_25759 ) ( not ( = ?auto_25763 ?auto_25764 ) ) ( SURFACE-AT ?auto_25756 ?auto_25759 ) ( ON ?auto_25756 ?auto_25757 ) ( CLEAR ?auto_25756 ) ( not ( = ?auto_25755 ?auto_25757 ) ) ( not ( = ?auto_25756 ?auto_25757 ) ) ( not ( = ?auto_25754 ?auto_25757 ) ) ( IS-CRATE ?auto_25755 ) ( not ( = ?auto_25767 ?auto_25768 ) ) ( not ( = ?auto_25759 ?auto_25767 ) ) ( HOIST-AT ?auto_25765 ?auto_25767 ) ( not ( = ?auto_25763 ?auto_25765 ) ) ( not ( = ?auto_25764 ?auto_25765 ) ) ( SURFACE-AT ?auto_25755 ?auto_25767 ) ( ON ?auto_25755 ?auto_25760 ) ( CLEAR ?auto_25755 ) ( not ( = ?auto_25755 ?auto_25760 ) ) ( not ( = ?auto_25756 ?auto_25760 ) ) ( not ( = ?auto_25754 ?auto_25760 ) ) ( not ( = ?auto_25757 ?auto_25760 ) ) ( IS-CRATE ?auto_25754 ) ( not ( = ?auto_25761 ?auto_25754 ) ) ( not ( = ?auto_25755 ?auto_25761 ) ) ( not ( = ?auto_25756 ?auto_25761 ) ) ( not ( = ?auto_25757 ?auto_25761 ) ) ( not ( = ?auto_25760 ?auto_25761 ) ) ( AVAILABLE ?auto_25764 ) ( SURFACE-AT ?auto_25754 ?auto_25759 ) ( ON ?auto_25754 ?auto_25762 ) ( CLEAR ?auto_25754 ) ( not ( = ?auto_25755 ?auto_25762 ) ) ( not ( = ?auto_25756 ?auto_25762 ) ) ( not ( = ?auto_25754 ?auto_25762 ) ) ( not ( = ?auto_25757 ?auto_25762 ) ) ( not ( = ?auto_25760 ?auto_25762 ) ) ( not ( = ?auto_25761 ?auto_25762 ) ) ( SURFACE-AT ?auto_25758 ?auto_25768 ) ( CLEAR ?auto_25758 ) ( IS-CRATE ?auto_25761 ) ( not ( = ?auto_25758 ?auto_25761 ) ) ( not ( = ?auto_25755 ?auto_25758 ) ) ( not ( = ?auto_25756 ?auto_25758 ) ) ( not ( = ?auto_25754 ?auto_25758 ) ) ( not ( = ?auto_25757 ?auto_25758 ) ) ( not ( = ?auto_25760 ?auto_25758 ) ) ( not ( = ?auto_25762 ?auto_25758 ) ) ( AVAILABLE ?auto_25763 ) ( TRUCK-AT ?auto_25766 ?auto_25767 ) ( LIFTING ?auto_25765 ?auto_25761 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25755 ?auto_25756 )
      ( MAKE-2CRATE-VERIFY ?auto_25754 ?auto_25755 ?auto_25756 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25769 - SURFACE
      ?auto_25770 - SURFACE
      ?auto_25771 - SURFACE
      ?auto_25772 - SURFACE
    )
    :vars
    (
      ?auto_25775 - HOIST
      ?auto_25779 - PLACE
      ?auto_25780 - PLACE
      ?auto_25774 - HOIST
      ?auto_25776 - SURFACE
      ?auto_25781 - PLACE
      ?auto_25783 - HOIST
      ?auto_25778 - SURFACE
      ?auto_25777 - SURFACE
      ?auto_25782 - SURFACE
      ?auto_25773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25775 ?auto_25779 ) ( IS-CRATE ?auto_25772 ) ( not ( = ?auto_25771 ?auto_25772 ) ) ( not ( = ?auto_25770 ?auto_25771 ) ) ( not ( = ?auto_25770 ?auto_25772 ) ) ( not ( = ?auto_25780 ?auto_25779 ) ) ( HOIST-AT ?auto_25774 ?auto_25780 ) ( not ( = ?auto_25775 ?auto_25774 ) ) ( SURFACE-AT ?auto_25772 ?auto_25780 ) ( ON ?auto_25772 ?auto_25776 ) ( CLEAR ?auto_25772 ) ( not ( = ?auto_25771 ?auto_25776 ) ) ( not ( = ?auto_25772 ?auto_25776 ) ) ( not ( = ?auto_25770 ?auto_25776 ) ) ( IS-CRATE ?auto_25771 ) ( not ( = ?auto_25781 ?auto_25779 ) ) ( not ( = ?auto_25780 ?auto_25781 ) ) ( HOIST-AT ?auto_25783 ?auto_25781 ) ( not ( = ?auto_25775 ?auto_25783 ) ) ( not ( = ?auto_25774 ?auto_25783 ) ) ( SURFACE-AT ?auto_25771 ?auto_25781 ) ( ON ?auto_25771 ?auto_25778 ) ( CLEAR ?auto_25771 ) ( not ( = ?auto_25771 ?auto_25778 ) ) ( not ( = ?auto_25772 ?auto_25778 ) ) ( not ( = ?auto_25770 ?auto_25778 ) ) ( not ( = ?auto_25776 ?auto_25778 ) ) ( IS-CRATE ?auto_25770 ) ( not ( = ?auto_25769 ?auto_25770 ) ) ( not ( = ?auto_25771 ?auto_25769 ) ) ( not ( = ?auto_25772 ?auto_25769 ) ) ( not ( = ?auto_25776 ?auto_25769 ) ) ( not ( = ?auto_25778 ?auto_25769 ) ) ( AVAILABLE ?auto_25774 ) ( SURFACE-AT ?auto_25770 ?auto_25780 ) ( ON ?auto_25770 ?auto_25777 ) ( CLEAR ?auto_25770 ) ( not ( = ?auto_25771 ?auto_25777 ) ) ( not ( = ?auto_25772 ?auto_25777 ) ) ( not ( = ?auto_25770 ?auto_25777 ) ) ( not ( = ?auto_25776 ?auto_25777 ) ) ( not ( = ?auto_25778 ?auto_25777 ) ) ( not ( = ?auto_25769 ?auto_25777 ) ) ( SURFACE-AT ?auto_25782 ?auto_25779 ) ( CLEAR ?auto_25782 ) ( IS-CRATE ?auto_25769 ) ( not ( = ?auto_25782 ?auto_25769 ) ) ( not ( = ?auto_25771 ?auto_25782 ) ) ( not ( = ?auto_25772 ?auto_25782 ) ) ( not ( = ?auto_25770 ?auto_25782 ) ) ( not ( = ?auto_25776 ?auto_25782 ) ) ( not ( = ?auto_25778 ?auto_25782 ) ) ( not ( = ?auto_25777 ?auto_25782 ) ) ( AVAILABLE ?auto_25775 ) ( TRUCK-AT ?auto_25773 ?auto_25781 ) ( LIFTING ?auto_25783 ?auto_25769 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25770 ?auto_25771 ?auto_25772 )
      ( MAKE-3CRATE-VERIFY ?auto_25769 ?auto_25770 ?auto_25771 ?auto_25772 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25784 - SURFACE
      ?auto_25785 - SURFACE
      ?auto_25786 - SURFACE
      ?auto_25787 - SURFACE
      ?auto_25788 - SURFACE
    )
    :vars
    (
      ?auto_25791 - HOIST
      ?auto_25795 - PLACE
      ?auto_25796 - PLACE
      ?auto_25790 - HOIST
      ?auto_25792 - SURFACE
      ?auto_25797 - PLACE
      ?auto_25798 - HOIST
      ?auto_25794 - SURFACE
      ?auto_25793 - SURFACE
      ?auto_25789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25791 ?auto_25795 ) ( IS-CRATE ?auto_25788 ) ( not ( = ?auto_25787 ?auto_25788 ) ) ( not ( = ?auto_25786 ?auto_25787 ) ) ( not ( = ?auto_25786 ?auto_25788 ) ) ( not ( = ?auto_25796 ?auto_25795 ) ) ( HOIST-AT ?auto_25790 ?auto_25796 ) ( not ( = ?auto_25791 ?auto_25790 ) ) ( SURFACE-AT ?auto_25788 ?auto_25796 ) ( ON ?auto_25788 ?auto_25792 ) ( CLEAR ?auto_25788 ) ( not ( = ?auto_25787 ?auto_25792 ) ) ( not ( = ?auto_25788 ?auto_25792 ) ) ( not ( = ?auto_25786 ?auto_25792 ) ) ( IS-CRATE ?auto_25787 ) ( not ( = ?auto_25797 ?auto_25795 ) ) ( not ( = ?auto_25796 ?auto_25797 ) ) ( HOIST-AT ?auto_25798 ?auto_25797 ) ( not ( = ?auto_25791 ?auto_25798 ) ) ( not ( = ?auto_25790 ?auto_25798 ) ) ( SURFACE-AT ?auto_25787 ?auto_25797 ) ( ON ?auto_25787 ?auto_25794 ) ( CLEAR ?auto_25787 ) ( not ( = ?auto_25787 ?auto_25794 ) ) ( not ( = ?auto_25788 ?auto_25794 ) ) ( not ( = ?auto_25786 ?auto_25794 ) ) ( not ( = ?auto_25792 ?auto_25794 ) ) ( IS-CRATE ?auto_25786 ) ( not ( = ?auto_25785 ?auto_25786 ) ) ( not ( = ?auto_25787 ?auto_25785 ) ) ( not ( = ?auto_25788 ?auto_25785 ) ) ( not ( = ?auto_25792 ?auto_25785 ) ) ( not ( = ?auto_25794 ?auto_25785 ) ) ( AVAILABLE ?auto_25790 ) ( SURFACE-AT ?auto_25786 ?auto_25796 ) ( ON ?auto_25786 ?auto_25793 ) ( CLEAR ?auto_25786 ) ( not ( = ?auto_25787 ?auto_25793 ) ) ( not ( = ?auto_25788 ?auto_25793 ) ) ( not ( = ?auto_25786 ?auto_25793 ) ) ( not ( = ?auto_25792 ?auto_25793 ) ) ( not ( = ?auto_25794 ?auto_25793 ) ) ( not ( = ?auto_25785 ?auto_25793 ) ) ( SURFACE-AT ?auto_25784 ?auto_25795 ) ( CLEAR ?auto_25784 ) ( IS-CRATE ?auto_25785 ) ( not ( = ?auto_25784 ?auto_25785 ) ) ( not ( = ?auto_25787 ?auto_25784 ) ) ( not ( = ?auto_25788 ?auto_25784 ) ) ( not ( = ?auto_25786 ?auto_25784 ) ) ( not ( = ?auto_25792 ?auto_25784 ) ) ( not ( = ?auto_25794 ?auto_25784 ) ) ( not ( = ?auto_25793 ?auto_25784 ) ) ( AVAILABLE ?auto_25791 ) ( TRUCK-AT ?auto_25789 ?auto_25797 ) ( LIFTING ?auto_25798 ?auto_25785 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25786 ?auto_25787 ?auto_25788 )
      ( MAKE-4CRATE-VERIFY ?auto_25784 ?auto_25785 ?auto_25786 ?auto_25787 ?auto_25788 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25799 - SURFACE
      ?auto_25800 - SURFACE
    )
    :vars
    (
      ?auto_25803 - HOIST
      ?auto_25808 - PLACE
      ?auto_25804 - SURFACE
      ?auto_25809 - PLACE
      ?auto_25802 - HOIST
      ?auto_25805 - SURFACE
      ?auto_25810 - PLACE
      ?auto_25813 - HOIST
      ?auto_25807 - SURFACE
      ?auto_25812 - SURFACE
      ?auto_25806 - SURFACE
      ?auto_25811 - SURFACE
      ?auto_25801 - TRUCK
      ?auto_25814 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25803 ?auto_25808 ) ( IS-CRATE ?auto_25800 ) ( not ( = ?auto_25799 ?auto_25800 ) ) ( not ( = ?auto_25804 ?auto_25799 ) ) ( not ( = ?auto_25804 ?auto_25800 ) ) ( not ( = ?auto_25809 ?auto_25808 ) ) ( HOIST-AT ?auto_25802 ?auto_25809 ) ( not ( = ?auto_25803 ?auto_25802 ) ) ( SURFACE-AT ?auto_25800 ?auto_25809 ) ( ON ?auto_25800 ?auto_25805 ) ( CLEAR ?auto_25800 ) ( not ( = ?auto_25799 ?auto_25805 ) ) ( not ( = ?auto_25800 ?auto_25805 ) ) ( not ( = ?auto_25804 ?auto_25805 ) ) ( IS-CRATE ?auto_25799 ) ( not ( = ?auto_25810 ?auto_25808 ) ) ( not ( = ?auto_25809 ?auto_25810 ) ) ( HOIST-AT ?auto_25813 ?auto_25810 ) ( not ( = ?auto_25803 ?auto_25813 ) ) ( not ( = ?auto_25802 ?auto_25813 ) ) ( SURFACE-AT ?auto_25799 ?auto_25810 ) ( ON ?auto_25799 ?auto_25807 ) ( CLEAR ?auto_25799 ) ( not ( = ?auto_25799 ?auto_25807 ) ) ( not ( = ?auto_25800 ?auto_25807 ) ) ( not ( = ?auto_25804 ?auto_25807 ) ) ( not ( = ?auto_25805 ?auto_25807 ) ) ( IS-CRATE ?auto_25804 ) ( not ( = ?auto_25812 ?auto_25804 ) ) ( not ( = ?auto_25799 ?auto_25812 ) ) ( not ( = ?auto_25800 ?auto_25812 ) ) ( not ( = ?auto_25805 ?auto_25812 ) ) ( not ( = ?auto_25807 ?auto_25812 ) ) ( AVAILABLE ?auto_25802 ) ( SURFACE-AT ?auto_25804 ?auto_25809 ) ( ON ?auto_25804 ?auto_25806 ) ( CLEAR ?auto_25804 ) ( not ( = ?auto_25799 ?auto_25806 ) ) ( not ( = ?auto_25800 ?auto_25806 ) ) ( not ( = ?auto_25804 ?auto_25806 ) ) ( not ( = ?auto_25805 ?auto_25806 ) ) ( not ( = ?auto_25807 ?auto_25806 ) ) ( not ( = ?auto_25812 ?auto_25806 ) ) ( SURFACE-AT ?auto_25811 ?auto_25808 ) ( CLEAR ?auto_25811 ) ( IS-CRATE ?auto_25812 ) ( not ( = ?auto_25811 ?auto_25812 ) ) ( not ( = ?auto_25799 ?auto_25811 ) ) ( not ( = ?auto_25800 ?auto_25811 ) ) ( not ( = ?auto_25804 ?auto_25811 ) ) ( not ( = ?auto_25805 ?auto_25811 ) ) ( not ( = ?auto_25807 ?auto_25811 ) ) ( not ( = ?auto_25806 ?auto_25811 ) ) ( AVAILABLE ?auto_25803 ) ( TRUCK-AT ?auto_25801 ?auto_25810 ) ( AVAILABLE ?auto_25813 ) ( SURFACE-AT ?auto_25812 ?auto_25810 ) ( ON ?auto_25812 ?auto_25814 ) ( CLEAR ?auto_25812 ) ( not ( = ?auto_25799 ?auto_25814 ) ) ( not ( = ?auto_25800 ?auto_25814 ) ) ( not ( = ?auto_25804 ?auto_25814 ) ) ( not ( = ?auto_25805 ?auto_25814 ) ) ( not ( = ?auto_25807 ?auto_25814 ) ) ( not ( = ?auto_25812 ?auto_25814 ) ) ( not ( = ?auto_25806 ?auto_25814 ) ) ( not ( = ?auto_25811 ?auto_25814 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25813 ?auto_25812 ?auto_25814 ?auto_25810 )
      ( MAKE-2CRATE ?auto_25804 ?auto_25799 ?auto_25800 )
      ( MAKE-1CRATE-VERIFY ?auto_25799 ?auto_25800 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25815 - SURFACE
      ?auto_25816 - SURFACE
      ?auto_25817 - SURFACE
    )
    :vars
    (
      ?auto_25819 - HOIST
      ?auto_25821 - PLACE
      ?auto_25830 - PLACE
      ?auto_25826 - HOIST
      ?auto_25829 - SURFACE
      ?auto_25825 - PLACE
      ?auto_25828 - HOIST
      ?auto_25824 - SURFACE
      ?auto_25822 - SURFACE
      ?auto_25827 - SURFACE
      ?auto_25818 - SURFACE
      ?auto_25823 - TRUCK
      ?auto_25820 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25819 ?auto_25821 ) ( IS-CRATE ?auto_25817 ) ( not ( = ?auto_25816 ?auto_25817 ) ) ( not ( = ?auto_25815 ?auto_25816 ) ) ( not ( = ?auto_25815 ?auto_25817 ) ) ( not ( = ?auto_25830 ?auto_25821 ) ) ( HOIST-AT ?auto_25826 ?auto_25830 ) ( not ( = ?auto_25819 ?auto_25826 ) ) ( SURFACE-AT ?auto_25817 ?auto_25830 ) ( ON ?auto_25817 ?auto_25829 ) ( CLEAR ?auto_25817 ) ( not ( = ?auto_25816 ?auto_25829 ) ) ( not ( = ?auto_25817 ?auto_25829 ) ) ( not ( = ?auto_25815 ?auto_25829 ) ) ( IS-CRATE ?auto_25816 ) ( not ( = ?auto_25825 ?auto_25821 ) ) ( not ( = ?auto_25830 ?auto_25825 ) ) ( HOIST-AT ?auto_25828 ?auto_25825 ) ( not ( = ?auto_25819 ?auto_25828 ) ) ( not ( = ?auto_25826 ?auto_25828 ) ) ( SURFACE-AT ?auto_25816 ?auto_25825 ) ( ON ?auto_25816 ?auto_25824 ) ( CLEAR ?auto_25816 ) ( not ( = ?auto_25816 ?auto_25824 ) ) ( not ( = ?auto_25817 ?auto_25824 ) ) ( not ( = ?auto_25815 ?auto_25824 ) ) ( not ( = ?auto_25829 ?auto_25824 ) ) ( IS-CRATE ?auto_25815 ) ( not ( = ?auto_25822 ?auto_25815 ) ) ( not ( = ?auto_25816 ?auto_25822 ) ) ( not ( = ?auto_25817 ?auto_25822 ) ) ( not ( = ?auto_25829 ?auto_25822 ) ) ( not ( = ?auto_25824 ?auto_25822 ) ) ( AVAILABLE ?auto_25826 ) ( SURFACE-AT ?auto_25815 ?auto_25830 ) ( ON ?auto_25815 ?auto_25827 ) ( CLEAR ?auto_25815 ) ( not ( = ?auto_25816 ?auto_25827 ) ) ( not ( = ?auto_25817 ?auto_25827 ) ) ( not ( = ?auto_25815 ?auto_25827 ) ) ( not ( = ?auto_25829 ?auto_25827 ) ) ( not ( = ?auto_25824 ?auto_25827 ) ) ( not ( = ?auto_25822 ?auto_25827 ) ) ( SURFACE-AT ?auto_25818 ?auto_25821 ) ( CLEAR ?auto_25818 ) ( IS-CRATE ?auto_25822 ) ( not ( = ?auto_25818 ?auto_25822 ) ) ( not ( = ?auto_25816 ?auto_25818 ) ) ( not ( = ?auto_25817 ?auto_25818 ) ) ( not ( = ?auto_25815 ?auto_25818 ) ) ( not ( = ?auto_25829 ?auto_25818 ) ) ( not ( = ?auto_25824 ?auto_25818 ) ) ( not ( = ?auto_25827 ?auto_25818 ) ) ( AVAILABLE ?auto_25819 ) ( TRUCK-AT ?auto_25823 ?auto_25825 ) ( AVAILABLE ?auto_25828 ) ( SURFACE-AT ?auto_25822 ?auto_25825 ) ( ON ?auto_25822 ?auto_25820 ) ( CLEAR ?auto_25822 ) ( not ( = ?auto_25816 ?auto_25820 ) ) ( not ( = ?auto_25817 ?auto_25820 ) ) ( not ( = ?auto_25815 ?auto_25820 ) ) ( not ( = ?auto_25829 ?auto_25820 ) ) ( not ( = ?auto_25824 ?auto_25820 ) ) ( not ( = ?auto_25822 ?auto_25820 ) ) ( not ( = ?auto_25827 ?auto_25820 ) ) ( not ( = ?auto_25818 ?auto_25820 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25816 ?auto_25817 )
      ( MAKE-2CRATE-VERIFY ?auto_25815 ?auto_25816 ?auto_25817 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25831 - SURFACE
      ?auto_25832 - SURFACE
      ?auto_25833 - SURFACE
      ?auto_25834 - SURFACE
    )
    :vars
    (
      ?auto_25839 - HOIST
      ?auto_25844 - PLACE
      ?auto_25838 - PLACE
      ?auto_25842 - HOIST
      ?auto_25843 - SURFACE
      ?auto_25846 - PLACE
      ?auto_25840 - HOIST
      ?auto_25837 - SURFACE
      ?auto_25845 - SURFACE
      ?auto_25835 - SURFACE
      ?auto_25836 - TRUCK
      ?auto_25841 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25839 ?auto_25844 ) ( IS-CRATE ?auto_25834 ) ( not ( = ?auto_25833 ?auto_25834 ) ) ( not ( = ?auto_25832 ?auto_25833 ) ) ( not ( = ?auto_25832 ?auto_25834 ) ) ( not ( = ?auto_25838 ?auto_25844 ) ) ( HOIST-AT ?auto_25842 ?auto_25838 ) ( not ( = ?auto_25839 ?auto_25842 ) ) ( SURFACE-AT ?auto_25834 ?auto_25838 ) ( ON ?auto_25834 ?auto_25843 ) ( CLEAR ?auto_25834 ) ( not ( = ?auto_25833 ?auto_25843 ) ) ( not ( = ?auto_25834 ?auto_25843 ) ) ( not ( = ?auto_25832 ?auto_25843 ) ) ( IS-CRATE ?auto_25833 ) ( not ( = ?auto_25846 ?auto_25844 ) ) ( not ( = ?auto_25838 ?auto_25846 ) ) ( HOIST-AT ?auto_25840 ?auto_25846 ) ( not ( = ?auto_25839 ?auto_25840 ) ) ( not ( = ?auto_25842 ?auto_25840 ) ) ( SURFACE-AT ?auto_25833 ?auto_25846 ) ( ON ?auto_25833 ?auto_25837 ) ( CLEAR ?auto_25833 ) ( not ( = ?auto_25833 ?auto_25837 ) ) ( not ( = ?auto_25834 ?auto_25837 ) ) ( not ( = ?auto_25832 ?auto_25837 ) ) ( not ( = ?auto_25843 ?auto_25837 ) ) ( IS-CRATE ?auto_25832 ) ( not ( = ?auto_25831 ?auto_25832 ) ) ( not ( = ?auto_25833 ?auto_25831 ) ) ( not ( = ?auto_25834 ?auto_25831 ) ) ( not ( = ?auto_25843 ?auto_25831 ) ) ( not ( = ?auto_25837 ?auto_25831 ) ) ( AVAILABLE ?auto_25842 ) ( SURFACE-AT ?auto_25832 ?auto_25838 ) ( ON ?auto_25832 ?auto_25845 ) ( CLEAR ?auto_25832 ) ( not ( = ?auto_25833 ?auto_25845 ) ) ( not ( = ?auto_25834 ?auto_25845 ) ) ( not ( = ?auto_25832 ?auto_25845 ) ) ( not ( = ?auto_25843 ?auto_25845 ) ) ( not ( = ?auto_25837 ?auto_25845 ) ) ( not ( = ?auto_25831 ?auto_25845 ) ) ( SURFACE-AT ?auto_25835 ?auto_25844 ) ( CLEAR ?auto_25835 ) ( IS-CRATE ?auto_25831 ) ( not ( = ?auto_25835 ?auto_25831 ) ) ( not ( = ?auto_25833 ?auto_25835 ) ) ( not ( = ?auto_25834 ?auto_25835 ) ) ( not ( = ?auto_25832 ?auto_25835 ) ) ( not ( = ?auto_25843 ?auto_25835 ) ) ( not ( = ?auto_25837 ?auto_25835 ) ) ( not ( = ?auto_25845 ?auto_25835 ) ) ( AVAILABLE ?auto_25839 ) ( TRUCK-AT ?auto_25836 ?auto_25846 ) ( AVAILABLE ?auto_25840 ) ( SURFACE-AT ?auto_25831 ?auto_25846 ) ( ON ?auto_25831 ?auto_25841 ) ( CLEAR ?auto_25831 ) ( not ( = ?auto_25833 ?auto_25841 ) ) ( not ( = ?auto_25834 ?auto_25841 ) ) ( not ( = ?auto_25832 ?auto_25841 ) ) ( not ( = ?auto_25843 ?auto_25841 ) ) ( not ( = ?auto_25837 ?auto_25841 ) ) ( not ( = ?auto_25831 ?auto_25841 ) ) ( not ( = ?auto_25845 ?auto_25841 ) ) ( not ( = ?auto_25835 ?auto_25841 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25832 ?auto_25833 ?auto_25834 )
      ( MAKE-3CRATE-VERIFY ?auto_25831 ?auto_25832 ?auto_25833 ?auto_25834 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25847 - SURFACE
      ?auto_25848 - SURFACE
      ?auto_25849 - SURFACE
      ?auto_25850 - SURFACE
      ?auto_25851 - SURFACE
    )
    :vars
    (
      ?auto_25855 - HOIST
      ?auto_25860 - PLACE
      ?auto_25854 - PLACE
      ?auto_25858 - HOIST
      ?auto_25859 - SURFACE
      ?auto_25862 - PLACE
      ?auto_25856 - HOIST
      ?auto_25853 - SURFACE
      ?auto_25861 - SURFACE
      ?auto_25852 - TRUCK
      ?auto_25857 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25855 ?auto_25860 ) ( IS-CRATE ?auto_25851 ) ( not ( = ?auto_25850 ?auto_25851 ) ) ( not ( = ?auto_25849 ?auto_25850 ) ) ( not ( = ?auto_25849 ?auto_25851 ) ) ( not ( = ?auto_25854 ?auto_25860 ) ) ( HOIST-AT ?auto_25858 ?auto_25854 ) ( not ( = ?auto_25855 ?auto_25858 ) ) ( SURFACE-AT ?auto_25851 ?auto_25854 ) ( ON ?auto_25851 ?auto_25859 ) ( CLEAR ?auto_25851 ) ( not ( = ?auto_25850 ?auto_25859 ) ) ( not ( = ?auto_25851 ?auto_25859 ) ) ( not ( = ?auto_25849 ?auto_25859 ) ) ( IS-CRATE ?auto_25850 ) ( not ( = ?auto_25862 ?auto_25860 ) ) ( not ( = ?auto_25854 ?auto_25862 ) ) ( HOIST-AT ?auto_25856 ?auto_25862 ) ( not ( = ?auto_25855 ?auto_25856 ) ) ( not ( = ?auto_25858 ?auto_25856 ) ) ( SURFACE-AT ?auto_25850 ?auto_25862 ) ( ON ?auto_25850 ?auto_25853 ) ( CLEAR ?auto_25850 ) ( not ( = ?auto_25850 ?auto_25853 ) ) ( not ( = ?auto_25851 ?auto_25853 ) ) ( not ( = ?auto_25849 ?auto_25853 ) ) ( not ( = ?auto_25859 ?auto_25853 ) ) ( IS-CRATE ?auto_25849 ) ( not ( = ?auto_25848 ?auto_25849 ) ) ( not ( = ?auto_25850 ?auto_25848 ) ) ( not ( = ?auto_25851 ?auto_25848 ) ) ( not ( = ?auto_25859 ?auto_25848 ) ) ( not ( = ?auto_25853 ?auto_25848 ) ) ( AVAILABLE ?auto_25858 ) ( SURFACE-AT ?auto_25849 ?auto_25854 ) ( ON ?auto_25849 ?auto_25861 ) ( CLEAR ?auto_25849 ) ( not ( = ?auto_25850 ?auto_25861 ) ) ( not ( = ?auto_25851 ?auto_25861 ) ) ( not ( = ?auto_25849 ?auto_25861 ) ) ( not ( = ?auto_25859 ?auto_25861 ) ) ( not ( = ?auto_25853 ?auto_25861 ) ) ( not ( = ?auto_25848 ?auto_25861 ) ) ( SURFACE-AT ?auto_25847 ?auto_25860 ) ( CLEAR ?auto_25847 ) ( IS-CRATE ?auto_25848 ) ( not ( = ?auto_25847 ?auto_25848 ) ) ( not ( = ?auto_25850 ?auto_25847 ) ) ( not ( = ?auto_25851 ?auto_25847 ) ) ( not ( = ?auto_25849 ?auto_25847 ) ) ( not ( = ?auto_25859 ?auto_25847 ) ) ( not ( = ?auto_25853 ?auto_25847 ) ) ( not ( = ?auto_25861 ?auto_25847 ) ) ( AVAILABLE ?auto_25855 ) ( TRUCK-AT ?auto_25852 ?auto_25862 ) ( AVAILABLE ?auto_25856 ) ( SURFACE-AT ?auto_25848 ?auto_25862 ) ( ON ?auto_25848 ?auto_25857 ) ( CLEAR ?auto_25848 ) ( not ( = ?auto_25850 ?auto_25857 ) ) ( not ( = ?auto_25851 ?auto_25857 ) ) ( not ( = ?auto_25849 ?auto_25857 ) ) ( not ( = ?auto_25859 ?auto_25857 ) ) ( not ( = ?auto_25853 ?auto_25857 ) ) ( not ( = ?auto_25848 ?auto_25857 ) ) ( not ( = ?auto_25861 ?auto_25857 ) ) ( not ( = ?auto_25847 ?auto_25857 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25849 ?auto_25850 ?auto_25851 )
      ( MAKE-4CRATE-VERIFY ?auto_25847 ?auto_25848 ?auto_25849 ?auto_25850 ?auto_25851 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25863 - SURFACE
      ?auto_25864 - SURFACE
    )
    :vars
    (
      ?auto_25870 - HOIST
      ?auto_25876 - PLACE
      ?auto_25871 - SURFACE
      ?auto_25869 - PLACE
      ?auto_25874 - HOIST
      ?auto_25875 - SURFACE
      ?auto_25878 - PLACE
      ?auto_25872 - HOIST
      ?auto_25868 - SURFACE
      ?auto_25867 - SURFACE
      ?auto_25877 - SURFACE
      ?auto_25865 - SURFACE
      ?auto_25873 - SURFACE
      ?auto_25866 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25870 ?auto_25876 ) ( IS-CRATE ?auto_25864 ) ( not ( = ?auto_25863 ?auto_25864 ) ) ( not ( = ?auto_25871 ?auto_25863 ) ) ( not ( = ?auto_25871 ?auto_25864 ) ) ( not ( = ?auto_25869 ?auto_25876 ) ) ( HOIST-AT ?auto_25874 ?auto_25869 ) ( not ( = ?auto_25870 ?auto_25874 ) ) ( SURFACE-AT ?auto_25864 ?auto_25869 ) ( ON ?auto_25864 ?auto_25875 ) ( CLEAR ?auto_25864 ) ( not ( = ?auto_25863 ?auto_25875 ) ) ( not ( = ?auto_25864 ?auto_25875 ) ) ( not ( = ?auto_25871 ?auto_25875 ) ) ( IS-CRATE ?auto_25863 ) ( not ( = ?auto_25878 ?auto_25876 ) ) ( not ( = ?auto_25869 ?auto_25878 ) ) ( HOIST-AT ?auto_25872 ?auto_25878 ) ( not ( = ?auto_25870 ?auto_25872 ) ) ( not ( = ?auto_25874 ?auto_25872 ) ) ( SURFACE-AT ?auto_25863 ?auto_25878 ) ( ON ?auto_25863 ?auto_25868 ) ( CLEAR ?auto_25863 ) ( not ( = ?auto_25863 ?auto_25868 ) ) ( not ( = ?auto_25864 ?auto_25868 ) ) ( not ( = ?auto_25871 ?auto_25868 ) ) ( not ( = ?auto_25875 ?auto_25868 ) ) ( IS-CRATE ?auto_25871 ) ( not ( = ?auto_25867 ?auto_25871 ) ) ( not ( = ?auto_25863 ?auto_25867 ) ) ( not ( = ?auto_25864 ?auto_25867 ) ) ( not ( = ?auto_25875 ?auto_25867 ) ) ( not ( = ?auto_25868 ?auto_25867 ) ) ( AVAILABLE ?auto_25874 ) ( SURFACE-AT ?auto_25871 ?auto_25869 ) ( ON ?auto_25871 ?auto_25877 ) ( CLEAR ?auto_25871 ) ( not ( = ?auto_25863 ?auto_25877 ) ) ( not ( = ?auto_25864 ?auto_25877 ) ) ( not ( = ?auto_25871 ?auto_25877 ) ) ( not ( = ?auto_25875 ?auto_25877 ) ) ( not ( = ?auto_25868 ?auto_25877 ) ) ( not ( = ?auto_25867 ?auto_25877 ) ) ( SURFACE-AT ?auto_25865 ?auto_25876 ) ( CLEAR ?auto_25865 ) ( IS-CRATE ?auto_25867 ) ( not ( = ?auto_25865 ?auto_25867 ) ) ( not ( = ?auto_25863 ?auto_25865 ) ) ( not ( = ?auto_25864 ?auto_25865 ) ) ( not ( = ?auto_25871 ?auto_25865 ) ) ( not ( = ?auto_25875 ?auto_25865 ) ) ( not ( = ?auto_25868 ?auto_25865 ) ) ( not ( = ?auto_25877 ?auto_25865 ) ) ( AVAILABLE ?auto_25870 ) ( AVAILABLE ?auto_25872 ) ( SURFACE-AT ?auto_25867 ?auto_25878 ) ( ON ?auto_25867 ?auto_25873 ) ( CLEAR ?auto_25867 ) ( not ( = ?auto_25863 ?auto_25873 ) ) ( not ( = ?auto_25864 ?auto_25873 ) ) ( not ( = ?auto_25871 ?auto_25873 ) ) ( not ( = ?auto_25875 ?auto_25873 ) ) ( not ( = ?auto_25868 ?auto_25873 ) ) ( not ( = ?auto_25867 ?auto_25873 ) ) ( not ( = ?auto_25877 ?auto_25873 ) ) ( not ( = ?auto_25865 ?auto_25873 ) ) ( TRUCK-AT ?auto_25866 ?auto_25876 ) )
    :subtasks
    ( ( !DRIVE ?auto_25866 ?auto_25876 ?auto_25878 )
      ( MAKE-2CRATE ?auto_25871 ?auto_25863 ?auto_25864 )
      ( MAKE-1CRATE-VERIFY ?auto_25863 ?auto_25864 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25879 - SURFACE
      ?auto_25880 - SURFACE
      ?auto_25881 - SURFACE
    )
    :vars
    (
      ?auto_25887 - HOIST
      ?auto_25891 - PLACE
      ?auto_25888 - PLACE
      ?auto_25884 - HOIST
      ?auto_25885 - SURFACE
      ?auto_25889 - PLACE
      ?auto_25893 - HOIST
      ?auto_25894 - SURFACE
      ?auto_25892 - SURFACE
      ?auto_25882 - SURFACE
      ?auto_25883 - SURFACE
      ?auto_25890 - SURFACE
      ?auto_25886 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25887 ?auto_25891 ) ( IS-CRATE ?auto_25881 ) ( not ( = ?auto_25880 ?auto_25881 ) ) ( not ( = ?auto_25879 ?auto_25880 ) ) ( not ( = ?auto_25879 ?auto_25881 ) ) ( not ( = ?auto_25888 ?auto_25891 ) ) ( HOIST-AT ?auto_25884 ?auto_25888 ) ( not ( = ?auto_25887 ?auto_25884 ) ) ( SURFACE-AT ?auto_25881 ?auto_25888 ) ( ON ?auto_25881 ?auto_25885 ) ( CLEAR ?auto_25881 ) ( not ( = ?auto_25880 ?auto_25885 ) ) ( not ( = ?auto_25881 ?auto_25885 ) ) ( not ( = ?auto_25879 ?auto_25885 ) ) ( IS-CRATE ?auto_25880 ) ( not ( = ?auto_25889 ?auto_25891 ) ) ( not ( = ?auto_25888 ?auto_25889 ) ) ( HOIST-AT ?auto_25893 ?auto_25889 ) ( not ( = ?auto_25887 ?auto_25893 ) ) ( not ( = ?auto_25884 ?auto_25893 ) ) ( SURFACE-AT ?auto_25880 ?auto_25889 ) ( ON ?auto_25880 ?auto_25894 ) ( CLEAR ?auto_25880 ) ( not ( = ?auto_25880 ?auto_25894 ) ) ( not ( = ?auto_25881 ?auto_25894 ) ) ( not ( = ?auto_25879 ?auto_25894 ) ) ( not ( = ?auto_25885 ?auto_25894 ) ) ( IS-CRATE ?auto_25879 ) ( not ( = ?auto_25892 ?auto_25879 ) ) ( not ( = ?auto_25880 ?auto_25892 ) ) ( not ( = ?auto_25881 ?auto_25892 ) ) ( not ( = ?auto_25885 ?auto_25892 ) ) ( not ( = ?auto_25894 ?auto_25892 ) ) ( AVAILABLE ?auto_25884 ) ( SURFACE-AT ?auto_25879 ?auto_25888 ) ( ON ?auto_25879 ?auto_25882 ) ( CLEAR ?auto_25879 ) ( not ( = ?auto_25880 ?auto_25882 ) ) ( not ( = ?auto_25881 ?auto_25882 ) ) ( not ( = ?auto_25879 ?auto_25882 ) ) ( not ( = ?auto_25885 ?auto_25882 ) ) ( not ( = ?auto_25894 ?auto_25882 ) ) ( not ( = ?auto_25892 ?auto_25882 ) ) ( SURFACE-AT ?auto_25883 ?auto_25891 ) ( CLEAR ?auto_25883 ) ( IS-CRATE ?auto_25892 ) ( not ( = ?auto_25883 ?auto_25892 ) ) ( not ( = ?auto_25880 ?auto_25883 ) ) ( not ( = ?auto_25881 ?auto_25883 ) ) ( not ( = ?auto_25879 ?auto_25883 ) ) ( not ( = ?auto_25885 ?auto_25883 ) ) ( not ( = ?auto_25894 ?auto_25883 ) ) ( not ( = ?auto_25882 ?auto_25883 ) ) ( AVAILABLE ?auto_25887 ) ( AVAILABLE ?auto_25893 ) ( SURFACE-AT ?auto_25892 ?auto_25889 ) ( ON ?auto_25892 ?auto_25890 ) ( CLEAR ?auto_25892 ) ( not ( = ?auto_25880 ?auto_25890 ) ) ( not ( = ?auto_25881 ?auto_25890 ) ) ( not ( = ?auto_25879 ?auto_25890 ) ) ( not ( = ?auto_25885 ?auto_25890 ) ) ( not ( = ?auto_25894 ?auto_25890 ) ) ( not ( = ?auto_25892 ?auto_25890 ) ) ( not ( = ?auto_25882 ?auto_25890 ) ) ( not ( = ?auto_25883 ?auto_25890 ) ) ( TRUCK-AT ?auto_25886 ?auto_25891 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25880 ?auto_25881 )
      ( MAKE-2CRATE-VERIFY ?auto_25879 ?auto_25880 ?auto_25881 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25895 - SURFACE
      ?auto_25896 - SURFACE
      ?auto_25897 - SURFACE
      ?auto_25898 - SURFACE
    )
    :vars
    (
      ?auto_25908 - HOIST
      ?auto_25909 - PLACE
      ?auto_25900 - PLACE
      ?auto_25904 - HOIST
      ?auto_25907 - SURFACE
      ?auto_25899 - PLACE
      ?auto_25902 - HOIST
      ?auto_25901 - SURFACE
      ?auto_25910 - SURFACE
      ?auto_25903 - SURFACE
      ?auto_25905 - SURFACE
      ?auto_25906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25908 ?auto_25909 ) ( IS-CRATE ?auto_25898 ) ( not ( = ?auto_25897 ?auto_25898 ) ) ( not ( = ?auto_25896 ?auto_25897 ) ) ( not ( = ?auto_25896 ?auto_25898 ) ) ( not ( = ?auto_25900 ?auto_25909 ) ) ( HOIST-AT ?auto_25904 ?auto_25900 ) ( not ( = ?auto_25908 ?auto_25904 ) ) ( SURFACE-AT ?auto_25898 ?auto_25900 ) ( ON ?auto_25898 ?auto_25907 ) ( CLEAR ?auto_25898 ) ( not ( = ?auto_25897 ?auto_25907 ) ) ( not ( = ?auto_25898 ?auto_25907 ) ) ( not ( = ?auto_25896 ?auto_25907 ) ) ( IS-CRATE ?auto_25897 ) ( not ( = ?auto_25899 ?auto_25909 ) ) ( not ( = ?auto_25900 ?auto_25899 ) ) ( HOIST-AT ?auto_25902 ?auto_25899 ) ( not ( = ?auto_25908 ?auto_25902 ) ) ( not ( = ?auto_25904 ?auto_25902 ) ) ( SURFACE-AT ?auto_25897 ?auto_25899 ) ( ON ?auto_25897 ?auto_25901 ) ( CLEAR ?auto_25897 ) ( not ( = ?auto_25897 ?auto_25901 ) ) ( not ( = ?auto_25898 ?auto_25901 ) ) ( not ( = ?auto_25896 ?auto_25901 ) ) ( not ( = ?auto_25907 ?auto_25901 ) ) ( IS-CRATE ?auto_25896 ) ( not ( = ?auto_25895 ?auto_25896 ) ) ( not ( = ?auto_25897 ?auto_25895 ) ) ( not ( = ?auto_25898 ?auto_25895 ) ) ( not ( = ?auto_25907 ?auto_25895 ) ) ( not ( = ?auto_25901 ?auto_25895 ) ) ( AVAILABLE ?auto_25904 ) ( SURFACE-AT ?auto_25896 ?auto_25900 ) ( ON ?auto_25896 ?auto_25910 ) ( CLEAR ?auto_25896 ) ( not ( = ?auto_25897 ?auto_25910 ) ) ( not ( = ?auto_25898 ?auto_25910 ) ) ( not ( = ?auto_25896 ?auto_25910 ) ) ( not ( = ?auto_25907 ?auto_25910 ) ) ( not ( = ?auto_25901 ?auto_25910 ) ) ( not ( = ?auto_25895 ?auto_25910 ) ) ( SURFACE-AT ?auto_25903 ?auto_25909 ) ( CLEAR ?auto_25903 ) ( IS-CRATE ?auto_25895 ) ( not ( = ?auto_25903 ?auto_25895 ) ) ( not ( = ?auto_25897 ?auto_25903 ) ) ( not ( = ?auto_25898 ?auto_25903 ) ) ( not ( = ?auto_25896 ?auto_25903 ) ) ( not ( = ?auto_25907 ?auto_25903 ) ) ( not ( = ?auto_25901 ?auto_25903 ) ) ( not ( = ?auto_25910 ?auto_25903 ) ) ( AVAILABLE ?auto_25908 ) ( AVAILABLE ?auto_25902 ) ( SURFACE-AT ?auto_25895 ?auto_25899 ) ( ON ?auto_25895 ?auto_25905 ) ( CLEAR ?auto_25895 ) ( not ( = ?auto_25897 ?auto_25905 ) ) ( not ( = ?auto_25898 ?auto_25905 ) ) ( not ( = ?auto_25896 ?auto_25905 ) ) ( not ( = ?auto_25907 ?auto_25905 ) ) ( not ( = ?auto_25901 ?auto_25905 ) ) ( not ( = ?auto_25895 ?auto_25905 ) ) ( not ( = ?auto_25910 ?auto_25905 ) ) ( not ( = ?auto_25903 ?auto_25905 ) ) ( TRUCK-AT ?auto_25906 ?auto_25909 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25896 ?auto_25897 ?auto_25898 )
      ( MAKE-3CRATE-VERIFY ?auto_25895 ?auto_25896 ?auto_25897 ?auto_25898 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25911 - SURFACE
      ?auto_25912 - SURFACE
      ?auto_25913 - SURFACE
      ?auto_25914 - SURFACE
      ?auto_25915 - SURFACE
    )
    :vars
    (
      ?auto_25924 - HOIST
      ?auto_25925 - PLACE
      ?auto_25917 - PLACE
      ?auto_25920 - HOIST
      ?auto_25923 - SURFACE
      ?auto_25916 - PLACE
      ?auto_25919 - HOIST
      ?auto_25918 - SURFACE
      ?auto_25926 - SURFACE
      ?auto_25921 - SURFACE
      ?auto_25922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25924 ?auto_25925 ) ( IS-CRATE ?auto_25915 ) ( not ( = ?auto_25914 ?auto_25915 ) ) ( not ( = ?auto_25913 ?auto_25914 ) ) ( not ( = ?auto_25913 ?auto_25915 ) ) ( not ( = ?auto_25917 ?auto_25925 ) ) ( HOIST-AT ?auto_25920 ?auto_25917 ) ( not ( = ?auto_25924 ?auto_25920 ) ) ( SURFACE-AT ?auto_25915 ?auto_25917 ) ( ON ?auto_25915 ?auto_25923 ) ( CLEAR ?auto_25915 ) ( not ( = ?auto_25914 ?auto_25923 ) ) ( not ( = ?auto_25915 ?auto_25923 ) ) ( not ( = ?auto_25913 ?auto_25923 ) ) ( IS-CRATE ?auto_25914 ) ( not ( = ?auto_25916 ?auto_25925 ) ) ( not ( = ?auto_25917 ?auto_25916 ) ) ( HOIST-AT ?auto_25919 ?auto_25916 ) ( not ( = ?auto_25924 ?auto_25919 ) ) ( not ( = ?auto_25920 ?auto_25919 ) ) ( SURFACE-AT ?auto_25914 ?auto_25916 ) ( ON ?auto_25914 ?auto_25918 ) ( CLEAR ?auto_25914 ) ( not ( = ?auto_25914 ?auto_25918 ) ) ( not ( = ?auto_25915 ?auto_25918 ) ) ( not ( = ?auto_25913 ?auto_25918 ) ) ( not ( = ?auto_25923 ?auto_25918 ) ) ( IS-CRATE ?auto_25913 ) ( not ( = ?auto_25912 ?auto_25913 ) ) ( not ( = ?auto_25914 ?auto_25912 ) ) ( not ( = ?auto_25915 ?auto_25912 ) ) ( not ( = ?auto_25923 ?auto_25912 ) ) ( not ( = ?auto_25918 ?auto_25912 ) ) ( AVAILABLE ?auto_25920 ) ( SURFACE-AT ?auto_25913 ?auto_25917 ) ( ON ?auto_25913 ?auto_25926 ) ( CLEAR ?auto_25913 ) ( not ( = ?auto_25914 ?auto_25926 ) ) ( not ( = ?auto_25915 ?auto_25926 ) ) ( not ( = ?auto_25913 ?auto_25926 ) ) ( not ( = ?auto_25923 ?auto_25926 ) ) ( not ( = ?auto_25918 ?auto_25926 ) ) ( not ( = ?auto_25912 ?auto_25926 ) ) ( SURFACE-AT ?auto_25911 ?auto_25925 ) ( CLEAR ?auto_25911 ) ( IS-CRATE ?auto_25912 ) ( not ( = ?auto_25911 ?auto_25912 ) ) ( not ( = ?auto_25914 ?auto_25911 ) ) ( not ( = ?auto_25915 ?auto_25911 ) ) ( not ( = ?auto_25913 ?auto_25911 ) ) ( not ( = ?auto_25923 ?auto_25911 ) ) ( not ( = ?auto_25918 ?auto_25911 ) ) ( not ( = ?auto_25926 ?auto_25911 ) ) ( AVAILABLE ?auto_25924 ) ( AVAILABLE ?auto_25919 ) ( SURFACE-AT ?auto_25912 ?auto_25916 ) ( ON ?auto_25912 ?auto_25921 ) ( CLEAR ?auto_25912 ) ( not ( = ?auto_25914 ?auto_25921 ) ) ( not ( = ?auto_25915 ?auto_25921 ) ) ( not ( = ?auto_25913 ?auto_25921 ) ) ( not ( = ?auto_25923 ?auto_25921 ) ) ( not ( = ?auto_25918 ?auto_25921 ) ) ( not ( = ?auto_25912 ?auto_25921 ) ) ( not ( = ?auto_25926 ?auto_25921 ) ) ( not ( = ?auto_25911 ?auto_25921 ) ) ( TRUCK-AT ?auto_25922 ?auto_25925 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25913 ?auto_25914 ?auto_25915 )
      ( MAKE-4CRATE-VERIFY ?auto_25911 ?auto_25912 ?auto_25913 ?auto_25914 ?auto_25915 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25947 - SURFACE
      ?auto_25948 - SURFACE
    )
    :vars
    (
      ?auto_25949 - HOIST
      ?auto_25950 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25949 ?auto_25950 ) ( SURFACE-AT ?auto_25947 ?auto_25950 ) ( CLEAR ?auto_25947 ) ( LIFTING ?auto_25949 ?auto_25948 ) ( IS-CRATE ?auto_25948 ) ( not ( = ?auto_25947 ?auto_25948 ) ) )
    :subtasks
    ( ( !DROP ?auto_25949 ?auto_25948 ?auto_25947 ?auto_25950 )
      ( MAKE-1CRATE-VERIFY ?auto_25947 ?auto_25948 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25951 - SURFACE
      ?auto_25952 - SURFACE
      ?auto_25953 - SURFACE
    )
    :vars
    (
      ?auto_25955 - HOIST
      ?auto_25954 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25955 ?auto_25954 ) ( SURFACE-AT ?auto_25952 ?auto_25954 ) ( CLEAR ?auto_25952 ) ( LIFTING ?auto_25955 ?auto_25953 ) ( IS-CRATE ?auto_25953 ) ( not ( = ?auto_25952 ?auto_25953 ) ) ( ON ?auto_25952 ?auto_25951 ) ( not ( = ?auto_25951 ?auto_25952 ) ) ( not ( = ?auto_25951 ?auto_25953 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25952 ?auto_25953 )
      ( MAKE-2CRATE-VERIFY ?auto_25951 ?auto_25952 ?auto_25953 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25956 - SURFACE
      ?auto_25957 - SURFACE
      ?auto_25958 - SURFACE
      ?auto_25959 - SURFACE
    )
    :vars
    (
      ?auto_25961 - HOIST
      ?auto_25960 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25961 ?auto_25960 ) ( SURFACE-AT ?auto_25958 ?auto_25960 ) ( CLEAR ?auto_25958 ) ( LIFTING ?auto_25961 ?auto_25959 ) ( IS-CRATE ?auto_25959 ) ( not ( = ?auto_25958 ?auto_25959 ) ) ( ON ?auto_25957 ?auto_25956 ) ( ON ?auto_25958 ?auto_25957 ) ( not ( = ?auto_25956 ?auto_25957 ) ) ( not ( = ?auto_25956 ?auto_25958 ) ) ( not ( = ?auto_25956 ?auto_25959 ) ) ( not ( = ?auto_25957 ?auto_25958 ) ) ( not ( = ?auto_25957 ?auto_25959 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25958 ?auto_25959 )
      ( MAKE-3CRATE-VERIFY ?auto_25956 ?auto_25957 ?auto_25958 ?auto_25959 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25962 - SURFACE
      ?auto_25963 - SURFACE
      ?auto_25964 - SURFACE
      ?auto_25965 - SURFACE
      ?auto_25966 - SURFACE
    )
    :vars
    (
      ?auto_25968 - HOIST
      ?auto_25967 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25968 ?auto_25967 ) ( SURFACE-AT ?auto_25965 ?auto_25967 ) ( CLEAR ?auto_25965 ) ( LIFTING ?auto_25968 ?auto_25966 ) ( IS-CRATE ?auto_25966 ) ( not ( = ?auto_25965 ?auto_25966 ) ) ( ON ?auto_25963 ?auto_25962 ) ( ON ?auto_25964 ?auto_25963 ) ( ON ?auto_25965 ?auto_25964 ) ( not ( = ?auto_25962 ?auto_25963 ) ) ( not ( = ?auto_25962 ?auto_25964 ) ) ( not ( = ?auto_25962 ?auto_25965 ) ) ( not ( = ?auto_25962 ?auto_25966 ) ) ( not ( = ?auto_25963 ?auto_25964 ) ) ( not ( = ?auto_25963 ?auto_25965 ) ) ( not ( = ?auto_25963 ?auto_25966 ) ) ( not ( = ?auto_25964 ?auto_25965 ) ) ( not ( = ?auto_25964 ?auto_25966 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25965 ?auto_25966 )
      ( MAKE-4CRATE-VERIFY ?auto_25962 ?auto_25963 ?auto_25964 ?auto_25965 ?auto_25966 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_25969 - SURFACE
      ?auto_25970 - SURFACE
      ?auto_25971 - SURFACE
      ?auto_25972 - SURFACE
      ?auto_25973 - SURFACE
      ?auto_25974 - SURFACE
    )
    :vars
    (
      ?auto_25976 - HOIST
      ?auto_25975 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25976 ?auto_25975 ) ( SURFACE-AT ?auto_25973 ?auto_25975 ) ( CLEAR ?auto_25973 ) ( LIFTING ?auto_25976 ?auto_25974 ) ( IS-CRATE ?auto_25974 ) ( not ( = ?auto_25973 ?auto_25974 ) ) ( ON ?auto_25970 ?auto_25969 ) ( ON ?auto_25971 ?auto_25970 ) ( ON ?auto_25972 ?auto_25971 ) ( ON ?auto_25973 ?auto_25972 ) ( not ( = ?auto_25969 ?auto_25970 ) ) ( not ( = ?auto_25969 ?auto_25971 ) ) ( not ( = ?auto_25969 ?auto_25972 ) ) ( not ( = ?auto_25969 ?auto_25973 ) ) ( not ( = ?auto_25969 ?auto_25974 ) ) ( not ( = ?auto_25970 ?auto_25971 ) ) ( not ( = ?auto_25970 ?auto_25972 ) ) ( not ( = ?auto_25970 ?auto_25973 ) ) ( not ( = ?auto_25970 ?auto_25974 ) ) ( not ( = ?auto_25971 ?auto_25972 ) ) ( not ( = ?auto_25971 ?auto_25973 ) ) ( not ( = ?auto_25971 ?auto_25974 ) ) ( not ( = ?auto_25972 ?auto_25973 ) ) ( not ( = ?auto_25972 ?auto_25974 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25973 ?auto_25974 )
      ( MAKE-5CRATE-VERIFY ?auto_25969 ?auto_25970 ?auto_25971 ?auto_25972 ?auto_25973 ?auto_25974 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25977 - SURFACE
      ?auto_25978 - SURFACE
    )
    :vars
    (
      ?auto_25980 - HOIST
      ?auto_25979 - PLACE
      ?auto_25981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25980 ?auto_25979 ) ( SURFACE-AT ?auto_25977 ?auto_25979 ) ( CLEAR ?auto_25977 ) ( IS-CRATE ?auto_25978 ) ( not ( = ?auto_25977 ?auto_25978 ) ) ( TRUCK-AT ?auto_25981 ?auto_25979 ) ( AVAILABLE ?auto_25980 ) ( IN ?auto_25978 ?auto_25981 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25980 ?auto_25978 ?auto_25981 ?auto_25979 )
      ( MAKE-1CRATE ?auto_25977 ?auto_25978 )
      ( MAKE-1CRATE-VERIFY ?auto_25977 ?auto_25978 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25982 - SURFACE
      ?auto_25983 - SURFACE
      ?auto_25984 - SURFACE
    )
    :vars
    (
      ?auto_25985 - HOIST
      ?auto_25986 - PLACE
      ?auto_25987 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25985 ?auto_25986 ) ( SURFACE-AT ?auto_25983 ?auto_25986 ) ( CLEAR ?auto_25983 ) ( IS-CRATE ?auto_25984 ) ( not ( = ?auto_25983 ?auto_25984 ) ) ( TRUCK-AT ?auto_25987 ?auto_25986 ) ( AVAILABLE ?auto_25985 ) ( IN ?auto_25984 ?auto_25987 ) ( ON ?auto_25983 ?auto_25982 ) ( not ( = ?auto_25982 ?auto_25983 ) ) ( not ( = ?auto_25982 ?auto_25984 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25983 ?auto_25984 )
      ( MAKE-2CRATE-VERIFY ?auto_25982 ?auto_25983 ?auto_25984 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25988 - SURFACE
      ?auto_25989 - SURFACE
      ?auto_25990 - SURFACE
      ?auto_25991 - SURFACE
    )
    :vars
    (
      ?auto_25994 - HOIST
      ?auto_25993 - PLACE
      ?auto_25992 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25994 ?auto_25993 ) ( SURFACE-AT ?auto_25990 ?auto_25993 ) ( CLEAR ?auto_25990 ) ( IS-CRATE ?auto_25991 ) ( not ( = ?auto_25990 ?auto_25991 ) ) ( TRUCK-AT ?auto_25992 ?auto_25993 ) ( AVAILABLE ?auto_25994 ) ( IN ?auto_25991 ?auto_25992 ) ( ON ?auto_25990 ?auto_25989 ) ( not ( = ?auto_25989 ?auto_25990 ) ) ( not ( = ?auto_25989 ?auto_25991 ) ) ( ON ?auto_25989 ?auto_25988 ) ( not ( = ?auto_25988 ?auto_25989 ) ) ( not ( = ?auto_25988 ?auto_25990 ) ) ( not ( = ?auto_25988 ?auto_25991 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25989 ?auto_25990 ?auto_25991 )
      ( MAKE-3CRATE-VERIFY ?auto_25988 ?auto_25989 ?auto_25990 ?auto_25991 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25995 - SURFACE
      ?auto_25996 - SURFACE
      ?auto_25997 - SURFACE
      ?auto_25998 - SURFACE
      ?auto_25999 - SURFACE
    )
    :vars
    (
      ?auto_26002 - HOIST
      ?auto_26001 - PLACE
      ?auto_26000 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26002 ?auto_26001 ) ( SURFACE-AT ?auto_25998 ?auto_26001 ) ( CLEAR ?auto_25998 ) ( IS-CRATE ?auto_25999 ) ( not ( = ?auto_25998 ?auto_25999 ) ) ( TRUCK-AT ?auto_26000 ?auto_26001 ) ( AVAILABLE ?auto_26002 ) ( IN ?auto_25999 ?auto_26000 ) ( ON ?auto_25998 ?auto_25997 ) ( not ( = ?auto_25997 ?auto_25998 ) ) ( not ( = ?auto_25997 ?auto_25999 ) ) ( ON ?auto_25996 ?auto_25995 ) ( ON ?auto_25997 ?auto_25996 ) ( not ( = ?auto_25995 ?auto_25996 ) ) ( not ( = ?auto_25995 ?auto_25997 ) ) ( not ( = ?auto_25995 ?auto_25998 ) ) ( not ( = ?auto_25995 ?auto_25999 ) ) ( not ( = ?auto_25996 ?auto_25997 ) ) ( not ( = ?auto_25996 ?auto_25998 ) ) ( not ( = ?auto_25996 ?auto_25999 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25997 ?auto_25998 ?auto_25999 )
      ( MAKE-4CRATE-VERIFY ?auto_25995 ?auto_25996 ?auto_25997 ?auto_25998 ?auto_25999 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26003 - SURFACE
      ?auto_26004 - SURFACE
      ?auto_26005 - SURFACE
      ?auto_26006 - SURFACE
      ?auto_26007 - SURFACE
      ?auto_26008 - SURFACE
    )
    :vars
    (
      ?auto_26011 - HOIST
      ?auto_26010 - PLACE
      ?auto_26009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26011 ?auto_26010 ) ( SURFACE-AT ?auto_26007 ?auto_26010 ) ( CLEAR ?auto_26007 ) ( IS-CRATE ?auto_26008 ) ( not ( = ?auto_26007 ?auto_26008 ) ) ( TRUCK-AT ?auto_26009 ?auto_26010 ) ( AVAILABLE ?auto_26011 ) ( IN ?auto_26008 ?auto_26009 ) ( ON ?auto_26007 ?auto_26006 ) ( not ( = ?auto_26006 ?auto_26007 ) ) ( not ( = ?auto_26006 ?auto_26008 ) ) ( ON ?auto_26004 ?auto_26003 ) ( ON ?auto_26005 ?auto_26004 ) ( ON ?auto_26006 ?auto_26005 ) ( not ( = ?auto_26003 ?auto_26004 ) ) ( not ( = ?auto_26003 ?auto_26005 ) ) ( not ( = ?auto_26003 ?auto_26006 ) ) ( not ( = ?auto_26003 ?auto_26007 ) ) ( not ( = ?auto_26003 ?auto_26008 ) ) ( not ( = ?auto_26004 ?auto_26005 ) ) ( not ( = ?auto_26004 ?auto_26006 ) ) ( not ( = ?auto_26004 ?auto_26007 ) ) ( not ( = ?auto_26004 ?auto_26008 ) ) ( not ( = ?auto_26005 ?auto_26006 ) ) ( not ( = ?auto_26005 ?auto_26007 ) ) ( not ( = ?auto_26005 ?auto_26008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26006 ?auto_26007 ?auto_26008 )
      ( MAKE-5CRATE-VERIFY ?auto_26003 ?auto_26004 ?auto_26005 ?auto_26006 ?auto_26007 ?auto_26008 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26012 - SURFACE
      ?auto_26013 - SURFACE
    )
    :vars
    (
      ?auto_26017 - HOIST
      ?auto_26016 - PLACE
      ?auto_26014 - TRUCK
      ?auto_26015 - SURFACE
      ?auto_26018 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26017 ?auto_26016 ) ( SURFACE-AT ?auto_26012 ?auto_26016 ) ( CLEAR ?auto_26012 ) ( IS-CRATE ?auto_26013 ) ( not ( = ?auto_26012 ?auto_26013 ) ) ( AVAILABLE ?auto_26017 ) ( IN ?auto_26013 ?auto_26014 ) ( ON ?auto_26012 ?auto_26015 ) ( not ( = ?auto_26015 ?auto_26012 ) ) ( not ( = ?auto_26015 ?auto_26013 ) ) ( TRUCK-AT ?auto_26014 ?auto_26018 ) ( not ( = ?auto_26018 ?auto_26016 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26014 ?auto_26018 ?auto_26016 )
      ( MAKE-2CRATE ?auto_26015 ?auto_26012 ?auto_26013 )
      ( MAKE-1CRATE-VERIFY ?auto_26012 ?auto_26013 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26019 - SURFACE
      ?auto_26020 - SURFACE
      ?auto_26021 - SURFACE
    )
    :vars
    (
      ?auto_26023 - HOIST
      ?auto_26025 - PLACE
      ?auto_26024 - TRUCK
      ?auto_26022 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26023 ?auto_26025 ) ( SURFACE-AT ?auto_26020 ?auto_26025 ) ( CLEAR ?auto_26020 ) ( IS-CRATE ?auto_26021 ) ( not ( = ?auto_26020 ?auto_26021 ) ) ( AVAILABLE ?auto_26023 ) ( IN ?auto_26021 ?auto_26024 ) ( ON ?auto_26020 ?auto_26019 ) ( not ( = ?auto_26019 ?auto_26020 ) ) ( not ( = ?auto_26019 ?auto_26021 ) ) ( TRUCK-AT ?auto_26024 ?auto_26022 ) ( not ( = ?auto_26022 ?auto_26025 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26020 ?auto_26021 )
      ( MAKE-2CRATE-VERIFY ?auto_26019 ?auto_26020 ?auto_26021 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26026 - SURFACE
      ?auto_26027 - SURFACE
      ?auto_26028 - SURFACE
      ?auto_26029 - SURFACE
    )
    :vars
    (
      ?auto_26033 - HOIST
      ?auto_26031 - PLACE
      ?auto_26032 - TRUCK
      ?auto_26030 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26033 ?auto_26031 ) ( SURFACE-AT ?auto_26028 ?auto_26031 ) ( CLEAR ?auto_26028 ) ( IS-CRATE ?auto_26029 ) ( not ( = ?auto_26028 ?auto_26029 ) ) ( AVAILABLE ?auto_26033 ) ( IN ?auto_26029 ?auto_26032 ) ( ON ?auto_26028 ?auto_26027 ) ( not ( = ?auto_26027 ?auto_26028 ) ) ( not ( = ?auto_26027 ?auto_26029 ) ) ( TRUCK-AT ?auto_26032 ?auto_26030 ) ( not ( = ?auto_26030 ?auto_26031 ) ) ( ON ?auto_26027 ?auto_26026 ) ( not ( = ?auto_26026 ?auto_26027 ) ) ( not ( = ?auto_26026 ?auto_26028 ) ) ( not ( = ?auto_26026 ?auto_26029 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26027 ?auto_26028 ?auto_26029 )
      ( MAKE-3CRATE-VERIFY ?auto_26026 ?auto_26027 ?auto_26028 ?auto_26029 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26034 - SURFACE
      ?auto_26035 - SURFACE
      ?auto_26036 - SURFACE
      ?auto_26037 - SURFACE
      ?auto_26038 - SURFACE
    )
    :vars
    (
      ?auto_26042 - HOIST
      ?auto_26040 - PLACE
      ?auto_26041 - TRUCK
      ?auto_26039 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26042 ?auto_26040 ) ( SURFACE-AT ?auto_26037 ?auto_26040 ) ( CLEAR ?auto_26037 ) ( IS-CRATE ?auto_26038 ) ( not ( = ?auto_26037 ?auto_26038 ) ) ( AVAILABLE ?auto_26042 ) ( IN ?auto_26038 ?auto_26041 ) ( ON ?auto_26037 ?auto_26036 ) ( not ( = ?auto_26036 ?auto_26037 ) ) ( not ( = ?auto_26036 ?auto_26038 ) ) ( TRUCK-AT ?auto_26041 ?auto_26039 ) ( not ( = ?auto_26039 ?auto_26040 ) ) ( ON ?auto_26035 ?auto_26034 ) ( ON ?auto_26036 ?auto_26035 ) ( not ( = ?auto_26034 ?auto_26035 ) ) ( not ( = ?auto_26034 ?auto_26036 ) ) ( not ( = ?auto_26034 ?auto_26037 ) ) ( not ( = ?auto_26034 ?auto_26038 ) ) ( not ( = ?auto_26035 ?auto_26036 ) ) ( not ( = ?auto_26035 ?auto_26037 ) ) ( not ( = ?auto_26035 ?auto_26038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26036 ?auto_26037 ?auto_26038 )
      ( MAKE-4CRATE-VERIFY ?auto_26034 ?auto_26035 ?auto_26036 ?auto_26037 ?auto_26038 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26043 - SURFACE
      ?auto_26044 - SURFACE
      ?auto_26045 - SURFACE
      ?auto_26046 - SURFACE
      ?auto_26047 - SURFACE
      ?auto_26048 - SURFACE
    )
    :vars
    (
      ?auto_26052 - HOIST
      ?auto_26050 - PLACE
      ?auto_26051 - TRUCK
      ?auto_26049 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26052 ?auto_26050 ) ( SURFACE-AT ?auto_26047 ?auto_26050 ) ( CLEAR ?auto_26047 ) ( IS-CRATE ?auto_26048 ) ( not ( = ?auto_26047 ?auto_26048 ) ) ( AVAILABLE ?auto_26052 ) ( IN ?auto_26048 ?auto_26051 ) ( ON ?auto_26047 ?auto_26046 ) ( not ( = ?auto_26046 ?auto_26047 ) ) ( not ( = ?auto_26046 ?auto_26048 ) ) ( TRUCK-AT ?auto_26051 ?auto_26049 ) ( not ( = ?auto_26049 ?auto_26050 ) ) ( ON ?auto_26044 ?auto_26043 ) ( ON ?auto_26045 ?auto_26044 ) ( ON ?auto_26046 ?auto_26045 ) ( not ( = ?auto_26043 ?auto_26044 ) ) ( not ( = ?auto_26043 ?auto_26045 ) ) ( not ( = ?auto_26043 ?auto_26046 ) ) ( not ( = ?auto_26043 ?auto_26047 ) ) ( not ( = ?auto_26043 ?auto_26048 ) ) ( not ( = ?auto_26044 ?auto_26045 ) ) ( not ( = ?auto_26044 ?auto_26046 ) ) ( not ( = ?auto_26044 ?auto_26047 ) ) ( not ( = ?auto_26044 ?auto_26048 ) ) ( not ( = ?auto_26045 ?auto_26046 ) ) ( not ( = ?auto_26045 ?auto_26047 ) ) ( not ( = ?auto_26045 ?auto_26048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26046 ?auto_26047 ?auto_26048 )
      ( MAKE-5CRATE-VERIFY ?auto_26043 ?auto_26044 ?auto_26045 ?auto_26046 ?auto_26047 ?auto_26048 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26053 - SURFACE
      ?auto_26054 - SURFACE
    )
    :vars
    (
      ?auto_26059 - HOIST
      ?auto_26056 - PLACE
      ?auto_26058 - SURFACE
      ?auto_26057 - TRUCK
      ?auto_26055 - PLACE
      ?auto_26060 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26059 ?auto_26056 ) ( SURFACE-AT ?auto_26053 ?auto_26056 ) ( CLEAR ?auto_26053 ) ( IS-CRATE ?auto_26054 ) ( not ( = ?auto_26053 ?auto_26054 ) ) ( AVAILABLE ?auto_26059 ) ( ON ?auto_26053 ?auto_26058 ) ( not ( = ?auto_26058 ?auto_26053 ) ) ( not ( = ?auto_26058 ?auto_26054 ) ) ( TRUCK-AT ?auto_26057 ?auto_26055 ) ( not ( = ?auto_26055 ?auto_26056 ) ) ( HOIST-AT ?auto_26060 ?auto_26055 ) ( LIFTING ?auto_26060 ?auto_26054 ) ( not ( = ?auto_26059 ?auto_26060 ) ) )
    :subtasks
    ( ( !LOAD ?auto_26060 ?auto_26054 ?auto_26057 ?auto_26055 )
      ( MAKE-2CRATE ?auto_26058 ?auto_26053 ?auto_26054 )
      ( MAKE-1CRATE-VERIFY ?auto_26053 ?auto_26054 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26061 - SURFACE
      ?auto_26062 - SURFACE
      ?auto_26063 - SURFACE
    )
    :vars
    (
      ?auto_26068 - HOIST
      ?auto_26064 - PLACE
      ?auto_26066 - TRUCK
      ?auto_26065 - PLACE
      ?auto_26067 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26068 ?auto_26064 ) ( SURFACE-AT ?auto_26062 ?auto_26064 ) ( CLEAR ?auto_26062 ) ( IS-CRATE ?auto_26063 ) ( not ( = ?auto_26062 ?auto_26063 ) ) ( AVAILABLE ?auto_26068 ) ( ON ?auto_26062 ?auto_26061 ) ( not ( = ?auto_26061 ?auto_26062 ) ) ( not ( = ?auto_26061 ?auto_26063 ) ) ( TRUCK-AT ?auto_26066 ?auto_26065 ) ( not ( = ?auto_26065 ?auto_26064 ) ) ( HOIST-AT ?auto_26067 ?auto_26065 ) ( LIFTING ?auto_26067 ?auto_26063 ) ( not ( = ?auto_26068 ?auto_26067 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26062 ?auto_26063 )
      ( MAKE-2CRATE-VERIFY ?auto_26061 ?auto_26062 ?auto_26063 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26069 - SURFACE
      ?auto_26070 - SURFACE
      ?auto_26071 - SURFACE
      ?auto_26072 - SURFACE
    )
    :vars
    (
      ?auto_26076 - HOIST
      ?auto_26073 - PLACE
      ?auto_26077 - TRUCK
      ?auto_26074 - PLACE
      ?auto_26075 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26076 ?auto_26073 ) ( SURFACE-AT ?auto_26071 ?auto_26073 ) ( CLEAR ?auto_26071 ) ( IS-CRATE ?auto_26072 ) ( not ( = ?auto_26071 ?auto_26072 ) ) ( AVAILABLE ?auto_26076 ) ( ON ?auto_26071 ?auto_26070 ) ( not ( = ?auto_26070 ?auto_26071 ) ) ( not ( = ?auto_26070 ?auto_26072 ) ) ( TRUCK-AT ?auto_26077 ?auto_26074 ) ( not ( = ?auto_26074 ?auto_26073 ) ) ( HOIST-AT ?auto_26075 ?auto_26074 ) ( LIFTING ?auto_26075 ?auto_26072 ) ( not ( = ?auto_26076 ?auto_26075 ) ) ( ON ?auto_26070 ?auto_26069 ) ( not ( = ?auto_26069 ?auto_26070 ) ) ( not ( = ?auto_26069 ?auto_26071 ) ) ( not ( = ?auto_26069 ?auto_26072 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26070 ?auto_26071 ?auto_26072 )
      ( MAKE-3CRATE-VERIFY ?auto_26069 ?auto_26070 ?auto_26071 ?auto_26072 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26078 - SURFACE
      ?auto_26079 - SURFACE
      ?auto_26080 - SURFACE
      ?auto_26081 - SURFACE
      ?auto_26082 - SURFACE
    )
    :vars
    (
      ?auto_26086 - HOIST
      ?auto_26083 - PLACE
      ?auto_26087 - TRUCK
      ?auto_26084 - PLACE
      ?auto_26085 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26086 ?auto_26083 ) ( SURFACE-AT ?auto_26081 ?auto_26083 ) ( CLEAR ?auto_26081 ) ( IS-CRATE ?auto_26082 ) ( not ( = ?auto_26081 ?auto_26082 ) ) ( AVAILABLE ?auto_26086 ) ( ON ?auto_26081 ?auto_26080 ) ( not ( = ?auto_26080 ?auto_26081 ) ) ( not ( = ?auto_26080 ?auto_26082 ) ) ( TRUCK-AT ?auto_26087 ?auto_26084 ) ( not ( = ?auto_26084 ?auto_26083 ) ) ( HOIST-AT ?auto_26085 ?auto_26084 ) ( LIFTING ?auto_26085 ?auto_26082 ) ( not ( = ?auto_26086 ?auto_26085 ) ) ( ON ?auto_26079 ?auto_26078 ) ( ON ?auto_26080 ?auto_26079 ) ( not ( = ?auto_26078 ?auto_26079 ) ) ( not ( = ?auto_26078 ?auto_26080 ) ) ( not ( = ?auto_26078 ?auto_26081 ) ) ( not ( = ?auto_26078 ?auto_26082 ) ) ( not ( = ?auto_26079 ?auto_26080 ) ) ( not ( = ?auto_26079 ?auto_26081 ) ) ( not ( = ?auto_26079 ?auto_26082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26080 ?auto_26081 ?auto_26082 )
      ( MAKE-4CRATE-VERIFY ?auto_26078 ?auto_26079 ?auto_26080 ?auto_26081 ?auto_26082 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26088 - SURFACE
      ?auto_26089 - SURFACE
      ?auto_26090 - SURFACE
      ?auto_26091 - SURFACE
      ?auto_26092 - SURFACE
      ?auto_26093 - SURFACE
    )
    :vars
    (
      ?auto_26097 - HOIST
      ?auto_26094 - PLACE
      ?auto_26098 - TRUCK
      ?auto_26095 - PLACE
      ?auto_26096 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26097 ?auto_26094 ) ( SURFACE-AT ?auto_26092 ?auto_26094 ) ( CLEAR ?auto_26092 ) ( IS-CRATE ?auto_26093 ) ( not ( = ?auto_26092 ?auto_26093 ) ) ( AVAILABLE ?auto_26097 ) ( ON ?auto_26092 ?auto_26091 ) ( not ( = ?auto_26091 ?auto_26092 ) ) ( not ( = ?auto_26091 ?auto_26093 ) ) ( TRUCK-AT ?auto_26098 ?auto_26095 ) ( not ( = ?auto_26095 ?auto_26094 ) ) ( HOIST-AT ?auto_26096 ?auto_26095 ) ( LIFTING ?auto_26096 ?auto_26093 ) ( not ( = ?auto_26097 ?auto_26096 ) ) ( ON ?auto_26089 ?auto_26088 ) ( ON ?auto_26090 ?auto_26089 ) ( ON ?auto_26091 ?auto_26090 ) ( not ( = ?auto_26088 ?auto_26089 ) ) ( not ( = ?auto_26088 ?auto_26090 ) ) ( not ( = ?auto_26088 ?auto_26091 ) ) ( not ( = ?auto_26088 ?auto_26092 ) ) ( not ( = ?auto_26088 ?auto_26093 ) ) ( not ( = ?auto_26089 ?auto_26090 ) ) ( not ( = ?auto_26089 ?auto_26091 ) ) ( not ( = ?auto_26089 ?auto_26092 ) ) ( not ( = ?auto_26089 ?auto_26093 ) ) ( not ( = ?auto_26090 ?auto_26091 ) ) ( not ( = ?auto_26090 ?auto_26092 ) ) ( not ( = ?auto_26090 ?auto_26093 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26091 ?auto_26092 ?auto_26093 )
      ( MAKE-5CRATE-VERIFY ?auto_26088 ?auto_26089 ?auto_26090 ?auto_26091 ?auto_26092 ?auto_26093 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26099 - SURFACE
      ?auto_26100 - SURFACE
    )
    :vars
    (
      ?auto_26105 - HOIST
      ?auto_26102 - PLACE
      ?auto_26101 - SURFACE
      ?auto_26106 - TRUCK
      ?auto_26103 - PLACE
      ?auto_26104 - HOIST
      ?auto_26107 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26105 ?auto_26102 ) ( SURFACE-AT ?auto_26099 ?auto_26102 ) ( CLEAR ?auto_26099 ) ( IS-CRATE ?auto_26100 ) ( not ( = ?auto_26099 ?auto_26100 ) ) ( AVAILABLE ?auto_26105 ) ( ON ?auto_26099 ?auto_26101 ) ( not ( = ?auto_26101 ?auto_26099 ) ) ( not ( = ?auto_26101 ?auto_26100 ) ) ( TRUCK-AT ?auto_26106 ?auto_26103 ) ( not ( = ?auto_26103 ?auto_26102 ) ) ( HOIST-AT ?auto_26104 ?auto_26103 ) ( not ( = ?auto_26105 ?auto_26104 ) ) ( AVAILABLE ?auto_26104 ) ( SURFACE-AT ?auto_26100 ?auto_26103 ) ( ON ?auto_26100 ?auto_26107 ) ( CLEAR ?auto_26100 ) ( not ( = ?auto_26099 ?auto_26107 ) ) ( not ( = ?auto_26100 ?auto_26107 ) ) ( not ( = ?auto_26101 ?auto_26107 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26104 ?auto_26100 ?auto_26107 ?auto_26103 )
      ( MAKE-2CRATE ?auto_26101 ?auto_26099 ?auto_26100 )
      ( MAKE-1CRATE-VERIFY ?auto_26099 ?auto_26100 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26108 - SURFACE
      ?auto_26109 - SURFACE
      ?auto_26110 - SURFACE
    )
    :vars
    (
      ?auto_26112 - HOIST
      ?auto_26116 - PLACE
      ?auto_26114 - TRUCK
      ?auto_26115 - PLACE
      ?auto_26113 - HOIST
      ?auto_26111 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26112 ?auto_26116 ) ( SURFACE-AT ?auto_26109 ?auto_26116 ) ( CLEAR ?auto_26109 ) ( IS-CRATE ?auto_26110 ) ( not ( = ?auto_26109 ?auto_26110 ) ) ( AVAILABLE ?auto_26112 ) ( ON ?auto_26109 ?auto_26108 ) ( not ( = ?auto_26108 ?auto_26109 ) ) ( not ( = ?auto_26108 ?auto_26110 ) ) ( TRUCK-AT ?auto_26114 ?auto_26115 ) ( not ( = ?auto_26115 ?auto_26116 ) ) ( HOIST-AT ?auto_26113 ?auto_26115 ) ( not ( = ?auto_26112 ?auto_26113 ) ) ( AVAILABLE ?auto_26113 ) ( SURFACE-AT ?auto_26110 ?auto_26115 ) ( ON ?auto_26110 ?auto_26111 ) ( CLEAR ?auto_26110 ) ( not ( = ?auto_26109 ?auto_26111 ) ) ( not ( = ?auto_26110 ?auto_26111 ) ) ( not ( = ?auto_26108 ?auto_26111 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26109 ?auto_26110 )
      ( MAKE-2CRATE-VERIFY ?auto_26108 ?auto_26109 ?auto_26110 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26117 - SURFACE
      ?auto_26118 - SURFACE
      ?auto_26119 - SURFACE
      ?auto_26120 - SURFACE
    )
    :vars
    (
      ?auto_26126 - HOIST
      ?auto_26124 - PLACE
      ?auto_26122 - TRUCK
      ?auto_26121 - PLACE
      ?auto_26123 - HOIST
      ?auto_26125 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26126 ?auto_26124 ) ( SURFACE-AT ?auto_26119 ?auto_26124 ) ( CLEAR ?auto_26119 ) ( IS-CRATE ?auto_26120 ) ( not ( = ?auto_26119 ?auto_26120 ) ) ( AVAILABLE ?auto_26126 ) ( ON ?auto_26119 ?auto_26118 ) ( not ( = ?auto_26118 ?auto_26119 ) ) ( not ( = ?auto_26118 ?auto_26120 ) ) ( TRUCK-AT ?auto_26122 ?auto_26121 ) ( not ( = ?auto_26121 ?auto_26124 ) ) ( HOIST-AT ?auto_26123 ?auto_26121 ) ( not ( = ?auto_26126 ?auto_26123 ) ) ( AVAILABLE ?auto_26123 ) ( SURFACE-AT ?auto_26120 ?auto_26121 ) ( ON ?auto_26120 ?auto_26125 ) ( CLEAR ?auto_26120 ) ( not ( = ?auto_26119 ?auto_26125 ) ) ( not ( = ?auto_26120 ?auto_26125 ) ) ( not ( = ?auto_26118 ?auto_26125 ) ) ( ON ?auto_26118 ?auto_26117 ) ( not ( = ?auto_26117 ?auto_26118 ) ) ( not ( = ?auto_26117 ?auto_26119 ) ) ( not ( = ?auto_26117 ?auto_26120 ) ) ( not ( = ?auto_26117 ?auto_26125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26118 ?auto_26119 ?auto_26120 )
      ( MAKE-3CRATE-VERIFY ?auto_26117 ?auto_26118 ?auto_26119 ?auto_26120 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26127 - SURFACE
      ?auto_26128 - SURFACE
      ?auto_26129 - SURFACE
      ?auto_26130 - SURFACE
      ?auto_26131 - SURFACE
    )
    :vars
    (
      ?auto_26137 - HOIST
      ?auto_26135 - PLACE
      ?auto_26133 - TRUCK
      ?auto_26132 - PLACE
      ?auto_26134 - HOIST
      ?auto_26136 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26137 ?auto_26135 ) ( SURFACE-AT ?auto_26130 ?auto_26135 ) ( CLEAR ?auto_26130 ) ( IS-CRATE ?auto_26131 ) ( not ( = ?auto_26130 ?auto_26131 ) ) ( AVAILABLE ?auto_26137 ) ( ON ?auto_26130 ?auto_26129 ) ( not ( = ?auto_26129 ?auto_26130 ) ) ( not ( = ?auto_26129 ?auto_26131 ) ) ( TRUCK-AT ?auto_26133 ?auto_26132 ) ( not ( = ?auto_26132 ?auto_26135 ) ) ( HOIST-AT ?auto_26134 ?auto_26132 ) ( not ( = ?auto_26137 ?auto_26134 ) ) ( AVAILABLE ?auto_26134 ) ( SURFACE-AT ?auto_26131 ?auto_26132 ) ( ON ?auto_26131 ?auto_26136 ) ( CLEAR ?auto_26131 ) ( not ( = ?auto_26130 ?auto_26136 ) ) ( not ( = ?auto_26131 ?auto_26136 ) ) ( not ( = ?auto_26129 ?auto_26136 ) ) ( ON ?auto_26128 ?auto_26127 ) ( ON ?auto_26129 ?auto_26128 ) ( not ( = ?auto_26127 ?auto_26128 ) ) ( not ( = ?auto_26127 ?auto_26129 ) ) ( not ( = ?auto_26127 ?auto_26130 ) ) ( not ( = ?auto_26127 ?auto_26131 ) ) ( not ( = ?auto_26127 ?auto_26136 ) ) ( not ( = ?auto_26128 ?auto_26129 ) ) ( not ( = ?auto_26128 ?auto_26130 ) ) ( not ( = ?auto_26128 ?auto_26131 ) ) ( not ( = ?auto_26128 ?auto_26136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26129 ?auto_26130 ?auto_26131 )
      ( MAKE-4CRATE-VERIFY ?auto_26127 ?auto_26128 ?auto_26129 ?auto_26130 ?auto_26131 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26138 - SURFACE
      ?auto_26139 - SURFACE
      ?auto_26140 - SURFACE
      ?auto_26141 - SURFACE
      ?auto_26142 - SURFACE
      ?auto_26143 - SURFACE
    )
    :vars
    (
      ?auto_26149 - HOIST
      ?auto_26147 - PLACE
      ?auto_26145 - TRUCK
      ?auto_26144 - PLACE
      ?auto_26146 - HOIST
      ?auto_26148 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26149 ?auto_26147 ) ( SURFACE-AT ?auto_26142 ?auto_26147 ) ( CLEAR ?auto_26142 ) ( IS-CRATE ?auto_26143 ) ( not ( = ?auto_26142 ?auto_26143 ) ) ( AVAILABLE ?auto_26149 ) ( ON ?auto_26142 ?auto_26141 ) ( not ( = ?auto_26141 ?auto_26142 ) ) ( not ( = ?auto_26141 ?auto_26143 ) ) ( TRUCK-AT ?auto_26145 ?auto_26144 ) ( not ( = ?auto_26144 ?auto_26147 ) ) ( HOIST-AT ?auto_26146 ?auto_26144 ) ( not ( = ?auto_26149 ?auto_26146 ) ) ( AVAILABLE ?auto_26146 ) ( SURFACE-AT ?auto_26143 ?auto_26144 ) ( ON ?auto_26143 ?auto_26148 ) ( CLEAR ?auto_26143 ) ( not ( = ?auto_26142 ?auto_26148 ) ) ( not ( = ?auto_26143 ?auto_26148 ) ) ( not ( = ?auto_26141 ?auto_26148 ) ) ( ON ?auto_26139 ?auto_26138 ) ( ON ?auto_26140 ?auto_26139 ) ( ON ?auto_26141 ?auto_26140 ) ( not ( = ?auto_26138 ?auto_26139 ) ) ( not ( = ?auto_26138 ?auto_26140 ) ) ( not ( = ?auto_26138 ?auto_26141 ) ) ( not ( = ?auto_26138 ?auto_26142 ) ) ( not ( = ?auto_26138 ?auto_26143 ) ) ( not ( = ?auto_26138 ?auto_26148 ) ) ( not ( = ?auto_26139 ?auto_26140 ) ) ( not ( = ?auto_26139 ?auto_26141 ) ) ( not ( = ?auto_26139 ?auto_26142 ) ) ( not ( = ?auto_26139 ?auto_26143 ) ) ( not ( = ?auto_26139 ?auto_26148 ) ) ( not ( = ?auto_26140 ?auto_26141 ) ) ( not ( = ?auto_26140 ?auto_26142 ) ) ( not ( = ?auto_26140 ?auto_26143 ) ) ( not ( = ?auto_26140 ?auto_26148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26141 ?auto_26142 ?auto_26143 )
      ( MAKE-5CRATE-VERIFY ?auto_26138 ?auto_26139 ?auto_26140 ?auto_26141 ?auto_26142 ?auto_26143 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26150 - SURFACE
      ?auto_26151 - SURFACE
    )
    :vars
    (
      ?auto_26157 - HOIST
      ?auto_26155 - PLACE
      ?auto_26158 - SURFACE
      ?auto_26152 - PLACE
      ?auto_26154 - HOIST
      ?auto_26156 - SURFACE
      ?auto_26153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26157 ?auto_26155 ) ( SURFACE-AT ?auto_26150 ?auto_26155 ) ( CLEAR ?auto_26150 ) ( IS-CRATE ?auto_26151 ) ( not ( = ?auto_26150 ?auto_26151 ) ) ( AVAILABLE ?auto_26157 ) ( ON ?auto_26150 ?auto_26158 ) ( not ( = ?auto_26158 ?auto_26150 ) ) ( not ( = ?auto_26158 ?auto_26151 ) ) ( not ( = ?auto_26152 ?auto_26155 ) ) ( HOIST-AT ?auto_26154 ?auto_26152 ) ( not ( = ?auto_26157 ?auto_26154 ) ) ( AVAILABLE ?auto_26154 ) ( SURFACE-AT ?auto_26151 ?auto_26152 ) ( ON ?auto_26151 ?auto_26156 ) ( CLEAR ?auto_26151 ) ( not ( = ?auto_26150 ?auto_26156 ) ) ( not ( = ?auto_26151 ?auto_26156 ) ) ( not ( = ?auto_26158 ?auto_26156 ) ) ( TRUCK-AT ?auto_26153 ?auto_26155 ) )
    :subtasks
    ( ( !DRIVE ?auto_26153 ?auto_26155 ?auto_26152 )
      ( MAKE-2CRATE ?auto_26158 ?auto_26150 ?auto_26151 )
      ( MAKE-1CRATE-VERIFY ?auto_26150 ?auto_26151 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26159 - SURFACE
      ?auto_26160 - SURFACE
      ?auto_26161 - SURFACE
    )
    :vars
    (
      ?auto_26164 - HOIST
      ?auto_26165 - PLACE
      ?auto_26167 - PLACE
      ?auto_26162 - HOIST
      ?auto_26163 - SURFACE
      ?auto_26166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26164 ?auto_26165 ) ( SURFACE-AT ?auto_26160 ?auto_26165 ) ( CLEAR ?auto_26160 ) ( IS-CRATE ?auto_26161 ) ( not ( = ?auto_26160 ?auto_26161 ) ) ( AVAILABLE ?auto_26164 ) ( ON ?auto_26160 ?auto_26159 ) ( not ( = ?auto_26159 ?auto_26160 ) ) ( not ( = ?auto_26159 ?auto_26161 ) ) ( not ( = ?auto_26167 ?auto_26165 ) ) ( HOIST-AT ?auto_26162 ?auto_26167 ) ( not ( = ?auto_26164 ?auto_26162 ) ) ( AVAILABLE ?auto_26162 ) ( SURFACE-AT ?auto_26161 ?auto_26167 ) ( ON ?auto_26161 ?auto_26163 ) ( CLEAR ?auto_26161 ) ( not ( = ?auto_26160 ?auto_26163 ) ) ( not ( = ?auto_26161 ?auto_26163 ) ) ( not ( = ?auto_26159 ?auto_26163 ) ) ( TRUCK-AT ?auto_26166 ?auto_26165 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26160 ?auto_26161 )
      ( MAKE-2CRATE-VERIFY ?auto_26159 ?auto_26160 ?auto_26161 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26168 - SURFACE
      ?auto_26169 - SURFACE
      ?auto_26170 - SURFACE
      ?auto_26171 - SURFACE
    )
    :vars
    (
      ?auto_26172 - HOIST
      ?auto_26176 - PLACE
      ?auto_26175 - PLACE
      ?auto_26174 - HOIST
      ?auto_26173 - SURFACE
      ?auto_26177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26172 ?auto_26176 ) ( SURFACE-AT ?auto_26170 ?auto_26176 ) ( CLEAR ?auto_26170 ) ( IS-CRATE ?auto_26171 ) ( not ( = ?auto_26170 ?auto_26171 ) ) ( AVAILABLE ?auto_26172 ) ( ON ?auto_26170 ?auto_26169 ) ( not ( = ?auto_26169 ?auto_26170 ) ) ( not ( = ?auto_26169 ?auto_26171 ) ) ( not ( = ?auto_26175 ?auto_26176 ) ) ( HOIST-AT ?auto_26174 ?auto_26175 ) ( not ( = ?auto_26172 ?auto_26174 ) ) ( AVAILABLE ?auto_26174 ) ( SURFACE-AT ?auto_26171 ?auto_26175 ) ( ON ?auto_26171 ?auto_26173 ) ( CLEAR ?auto_26171 ) ( not ( = ?auto_26170 ?auto_26173 ) ) ( not ( = ?auto_26171 ?auto_26173 ) ) ( not ( = ?auto_26169 ?auto_26173 ) ) ( TRUCK-AT ?auto_26177 ?auto_26176 ) ( ON ?auto_26169 ?auto_26168 ) ( not ( = ?auto_26168 ?auto_26169 ) ) ( not ( = ?auto_26168 ?auto_26170 ) ) ( not ( = ?auto_26168 ?auto_26171 ) ) ( not ( = ?auto_26168 ?auto_26173 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26169 ?auto_26170 ?auto_26171 )
      ( MAKE-3CRATE-VERIFY ?auto_26168 ?auto_26169 ?auto_26170 ?auto_26171 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26178 - SURFACE
      ?auto_26179 - SURFACE
      ?auto_26180 - SURFACE
      ?auto_26181 - SURFACE
      ?auto_26182 - SURFACE
    )
    :vars
    (
      ?auto_26183 - HOIST
      ?auto_26187 - PLACE
      ?auto_26186 - PLACE
      ?auto_26185 - HOIST
      ?auto_26184 - SURFACE
      ?auto_26188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26183 ?auto_26187 ) ( SURFACE-AT ?auto_26181 ?auto_26187 ) ( CLEAR ?auto_26181 ) ( IS-CRATE ?auto_26182 ) ( not ( = ?auto_26181 ?auto_26182 ) ) ( AVAILABLE ?auto_26183 ) ( ON ?auto_26181 ?auto_26180 ) ( not ( = ?auto_26180 ?auto_26181 ) ) ( not ( = ?auto_26180 ?auto_26182 ) ) ( not ( = ?auto_26186 ?auto_26187 ) ) ( HOIST-AT ?auto_26185 ?auto_26186 ) ( not ( = ?auto_26183 ?auto_26185 ) ) ( AVAILABLE ?auto_26185 ) ( SURFACE-AT ?auto_26182 ?auto_26186 ) ( ON ?auto_26182 ?auto_26184 ) ( CLEAR ?auto_26182 ) ( not ( = ?auto_26181 ?auto_26184 ) ) ( not ( = ?auto_26182 ?auto_26184 ) ) ( not ( = ?auto_26180 ?auto_26184 ) ) ( TRUCK-AT ?auto_26188 ?auto_26187 ) ( ON ?auto_26179 ?auto_26178 ) ( ON ?auto_26180 ?auto_26179 ) ( not ( = ?auto_26178 ?auto_26179 ) ) ( not ( = ?auto_26178 ?auto_26180 ) ) ( not ( = ?auto_26178 ?auto_26181 ) ) ( not ( = ?auto_26178 ?auto_26182 ) ) ( not ( = ?auto_26178 ?auto_26184 ) ) ( not ( = ?auto_26179 ?auto_26180 ) ) ( not ( = ?auto_26179 ?auto_26181 ) ) ( not ( = ?auto_26179 ?auto_26182 ) ) ( not ( = ?auto_26179 ?auto_26184 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26180 ?auto_26181 ?auto_26182 )
      ( MAKE-4CRATE-VERIFY ?auto_26178 ?auto_26179 ?auto_26180 ?auto_26181 ?auto_26182 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26189 - SURFACE
      ?auto_26190 - SURFACE
      ?auto_26191 - SURFACE
      ?auto_26192 - SURFACE
      ?auto_26193 - SURFACE
      ?auto_26194 - SURFACE
    )
    :vars
    (
      ?auto_26195 - HOIST
      ?auto_26199 - PLACE
      ?auto_26198 - PLACE
      ?auto_26197 - HOIST
      ?auto_26196 - SURFACE
      ?auto_26200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26195 ?auto_26199 ) ( SURFACE-AT ?auto_26193 ?auto_26199 ) ( CLEAR ?auto_26193 ) ( IS-CRATE ?auto_26194 ) ( not ( = ?auto_26193 ?auto_26194 ) ) ( AVAILABLE ?auto_26195 ) ( ON ?auto_26193 ?auto_26192 ) ( not ( = ?auto_26192 ?auto_26193 ) ) ( not ( = ?auto_26192 ?auto_26194 ) ) ( not ( = ?auto_26198 ?auto_26199 ) ) ( HOIST-AT ?auto_26197 ?auto_26198 ) ( not ( = ?auto_26195 ?auto_26197 ) ) ( AVAILABLE ?auto_26197 ) ( SURFACE-AT ?auto_26194 ?auto_26198 ) ( ON ?auto_26194 ?auto_26196 ) ( CLEAR ?auto_26194 ) ( not ( = ?auto_26193 ?auto_26196 ) ) ( not ( = ?auto_26194 ?auto_26196 ) ) ( not ( = ?auto_26192 ?auto_26196 ) ) ( TRUCK-AT ?auto_26200 ?auto_26199 ) ( ON ?auto_26190 ?auto_26189 ) ( ON ?auto_26191 ?auto_26190 ) ( ON ?auto_26192 ?auto_26191 ) ( not ( = ?auto_26189 ?auto_26190 ) ) ( not ( = ?auto_26189 ?auto_26191 ) ) ( not ( = ?auto_26189 ?auto_26192 ) ) ( not ( = ?auto_26189 ?auto_26193 ) ) ( not ( = ?auto_26189 ?auto_26194 ) ) ( not ( = ?auto_26189 ?auto_26196 ) ) ( not ( = ?auto_26190 ?auto_26191 ) ) ( not ( = ?auto_26190 ?auto_26192 ) ) ( not ( = ?auto_26190 ?auto_26193 ) ) ( not ( = ?auto_26190 ?auto_26194 ) ) ( not ( = ?auto_26190 ?auto_26196 ) ) ( not ( = ?auto_26191 ?auto_26192 ) ) ( not ( = ?auto_26191 ?auto_26193 ) ) ( not ( = ?auto_26191 ?auto_26194 ) ) ( not ( = ?auto_26191 ?auto_26196 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26192 ?auto_26193 ?auto_26194 )
      ( MAKE-5CRATE-VERIFY ?auto_26189 ?auto_26190 ?auto_26191 ?auto_26192 ?auto_26193 ?auto_26194 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26201 - SURFACE
      ?auto_26202 - SURFACE
    )
    :vars
    (
      ?auto_26203 - HOIST
      ?auto_26208 - PLACE
      ?auto_26205 - SURFACE
      ?auto_26207 - PLACE
      ?auto_26206 - HOIST
      ?auto_26204 - SURFACE
      ?auto_26209 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26203 ?auto_26208 ) ( IS-CRATE ?auto_26202 ) ( not ( = ?auto_26201 ?auto_26202 ) ) ( not ( = ?auto_26205 ?auto_26201 ) ) ( not ( = ?auto_26205 ?auto_26202 ) ) ( not ( = ?auto_26207 ?auto_26208 ) ) ( HOIST-AT ?auto_26206 ?auto_26207 ) ( not ( = ?auto_26203 ?auto_26206 ) ) ( AVAILABLE ?auto_26206 ) ( SURFACE-AT ?auto_26202 ?auto_26207 ) ( ON ?auto_26202 ?auto_26204 ) ( CLEAR ?auto_26202 ) ( not ( = ?auto_26201 ?auto_26204 ) ) ( not ( = ?auto_26202 ?auto_26204 ) ) ( not ( = ?auto_26205 ?auto_26204 ) ) ( TRUCK-AT ?auto_26209 ?auto_26208 ) ( SURFACE-AT ?auto_26205 ?auto_26208 ) ( CLEAR ?auto_26205 ) ( LIFTING ?auto_26203 ?auto_26201 ) ( IS-CRATE ?auto_26201 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26205 ?auto_26201 )
      ( MAKE-2CRATE ?auto_26205 ?auto_26201 ?auto_26202 )
      ( MAKE-1CRATE-VERIFY ?auto_26201 ?auto_26202 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26210 - SURFACE
      ?auto_26211 - SURFACE
      ?auto_26212 - SURFACE
    )
    :vars
    (
      ?auto_26216 - HOIST
      ?auto_26215 - PLACE
      ?auto_26213 - PLACE
      ?auto_26214 - HOIST
      ?auto_26217 - SURFACE
      ?auto_26218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26216 ?auto_26215 ) ( IS-CRATE ?auto_26212 ) ( not ( = ?auto_26211 ?auto_26212 ) ) ( not ( = ?auto_26210 ?auto_26211 ) ) ( not ( = ?auto_26210 ?auto_26212 ) ) ( not ( = ?auto_26213 ?auto_26215 ) ) ( HOIST-AT ?auto_26214 ?auto_26213 ) ( not ( = ?auto_26216 ?auto_26214 ) ) ( AVAILABLE ?auto_26214 ) ( SURFACE-AT ?auto_26212 ?auto_26213 ) ( ON ?auto_26212 ?auto_26217 ) ( CLEAR ?auto_26212 ) ( not ( = ?auto_26211 ?auto_26217 ) ) ( not ( = ?auto_26212 ?auto_26217 ) ) ( not ( = ?auto_26210 ?auto_26217 ) ) ( TRUCK-AT ?auto_26218 ?auto_26215 ) ( SURFACE-AT ?auto_26210 ?auto_26215 ) ( CLEAR ?auto_26210 ) ( LIFTING ?auto_26216 ?auto_26211 ) ( IS-CRATE ?auto_26211 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26211 ?auto_26212 )
      ( MAKE-2CRATE-VERIFY ?auto_26210 ?auto_26211 ?auto_26212 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26219 - SURFACE
      ?auto_26220 - SURFACE
      ?auto_26221 - SURFACE
      ?auto_26222 - SURFACE
    )
    :vars
    (
      ?auto_26223 - HOIST
      ?auto_26224 - PLACE
      ?auto_26225 - PLACE
      ?auto_26228 - HOIST
      ?auto_26227 - SURFACE
      ?auto_26226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26223 ?auto_26224 ) ( IS-CRATE ?auto_26222 ) ( not ( = ?auto_26221 ?auto_26222 ) ) ( not ( = ?auto_26220 ?auto_26221 ) ) ( not ( = ?auto_26220 ?auto_26222 ) ) ( not ( = ?auto_26225 ?auto_26224 ) ) ( HOIST-AT ?auto_26228 ?auto_26225 ) ( not ( = ?auto_26223 ?auto_26228 ) ) ( AVAILABLE ?auto_26228 ) ( SURFACE-AT ?auto_26222 ?auto_26225 ) ( ON ?auto_26222 ?auto_26227 ) ( CLEAR ?auto_26222 ) ( not ( = ?auto_26221 ?auto_26227 ) ) ( not ( = ?auto_26222 ?auto_26227 ) ) ( not ( = ?auto_26220 ?auto_26227 ) ) ( TRUCK-AT ?auto_26226 ?auto_26224 ) ( SURFACE-AT ?auto_26220 ?auto_26224 ) ( CLEAR ?auto_26220 ) ( LIFTING ?auto_26223 ?auto_26221 ) ( IS-CRATE ?auto_26221 ) ( ON ?auto_26220 ?auto_26219 ) ( not ( = ?auto_26219 ?auto_26220 ) ) ( not ( = ?auto_26219 ?auto_26221 ) ) ( not ( = ?auto_26219 ?auto_26222 ) ) ( not ( = ?auto_26219 ?auto_26227 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26220 ?auto_26221 ?auto_26222 )
      ( MAKE-3CRATE-VERIFY ?auto_26219 ?auto_26220 ?auto_26221 ?auto_26222 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26229 - SURFACE
      ?auto_26230 - SURFACE
      ?auto_26231 - SURFACE
      ?auto_26232 - SURFACE
      ?auto_26233 - SURFACE
    )
    :vars
    (
      ?auto_26234 - HOIST
      ?auto_26235 - PLACE
      ?auto_26236 - PLACE
      ?auto_26239 - HOIST
      ?auto_26238 - SURFACE
      ?auto_26237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26234 ?auto_26235 ) ( IS-CRATE ?auto_26233 ) ( not ( = ?auto_26232 ?auto_26233 ) ) ( not ( = ?auto_26231 ?auto_26232 ) ) ( not ( = ?auto_26231 ?auto_26233 ) ) ( not ( = ?auto_26236 ?auto_26235 ) ) ( HOIST-AT ?auto_26239 ?auto_26236 ) ( not ( = ?auto_26234 ?auto_26239 ) ) ( AVAILABLE ?auto_26239 ) ( SURFACE-AT ?auto_26233 ?auto_26236 ) ( ON ?auto_26233 ?auto_26238 ) ( CLEAR ?auto_26233 ) ( not ( = ?auto_26232 ?auto_26238 ) ) ( not ( = ?auto_26233 ?auto_26238 ) ) ( not ( = ?auto_26231 ?auto_26238 ) ) ( TRUCK-AT ?auto_26237 ?auto_26235 ) ( SURFACE-AT ?auto_26231 ?auto_26235 ) ( CLEAR ?auto_26231 ) ( LIFTING ?auto_26234 ?auto_26232 ) ( IS-CRATE ?auto_26232 ) ( ON ?auto_26230 ?auto_26229 ) ( ON ?auto_26231 ?auto_26230 ) ( not ( = ?auto_26229 ?auto_26230 ) ) ( not ( = ?auto_26229 ?auto_26231 ) ) ( not ( = ?auto_26229 ?auto_26232 ) ) ( not ( = ?auto_26229 ?auto_26233 ) ) ( not ( = ?auto_26229 ?auto_26238 ) ) ( not ( = ?auto_26230 ?auto_26231 ) ) ( not ( = ?auto_26230 ?auto_26232 ) ) ( not ( = ?auto_26230 ?auto_26233 ) ) ( not ( = ?auto_26230 ?auto_26238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26231 ?auto_26232 ?auto_26233 )
      ( MAKE-4CRATE-VERIFY ?auto_26229 ?auto_26230 ?auto_26231 ?auto_26232 ?auto_26233 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26240 - SURFACE
      ?auto_26241 - SURFACE
      ?auto_26242 - SURFACE
      ?auto_26243 - SURFACE
      ?auto_26244 - SURFACE
      ?auto_26245 - SURFACE
    )
    :vars
    (
      ?auto_26246 - HOIST
      ?auto_26247 - PLACE
      ?auto_26248 - PLACE
      ?auto_26251 - HOIST
      ?auto_26250 - SURFACE
      ?auto_26249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26246 ?auto_26247 ) ( IS-CRATE ?auto_26245 ) ( not ( = ?auto_26244 ?auto_26245 ) ) ( not ( = ?auto_26243 ?auto_26244 ) ) ( not ( = ?auto_26243 ?auto_26245 ) ) ( not ( = ?auto_26248 ?auto_26247 ) ) ( HOIST-AT ?auto_26251 ?auto_26248 ) ( not ( = ?auto_26246 ?auto_26251 ) ) ( AVAILABLE ?auto_26251 ) ( SURFACE-AT ?auto_26245 ?auto_26248 ) ( ON ?auto_26245 ?auto_26250 ) ( CLEAR ?auto_26245 ) ( not ( = ?auto_26244 ?auto_26250 ) ) ( not ( = ?auto_26245 ?auto_26250 ) ) ( not ( = ?auto_26243 ?auto_26250 ) ) ( TRUCK-AT ?auto_26249 ?auto_26247 ) ( SURFACE-AT ?auto_26243 ?auto_26247 ) ( CLEAR ?auto_26243 ) ( LIFTING ?auto_26246 ?auto_26244 ) ( IS-CRATE ?auto_26244 ) ( ON ?auto_26241 ?auto_26240 ) ( ON ?auto_26242 ?auto_26241 ) ( ON ?auto_26243 ?auto_26242 ) ( not ( = ?auto_26240 ?auto_26241 ) ) ( not ( = ?auto_26240 ?auto_26242 ) ) ( not ( = ?auto_26240 ?auto_26243 ) ) ( not ( = ?auto_26240 ?auto_26244 ) ) ( not ( = ?auto_26240 ?auto_26245 ) ) ( not ( = ?auto_26240 ?auto_26250 ) ) ( not ( = ?auto_26241 ?auto_26242 ) ) ( not ( = ?auto_26241 ?auto_26243 ) ) ( not ( = ?auto_26241 ?auto_26244 ) ) ( not ( = ?auto_26241 ?auto_26245 ) ) ( not ( = ?auto_26241 ?auto_26250 ) ) ( not ( = ?auto_26242 ?auto_26243 ) ) ( not ( = ?auto_26242 ?auto_26244 ) ) ( not ( = ?auto_26242 ?auto_26245 ) ) ( not ( = ?auto_26242 ?auto_26250 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26243 ?auto_26244 ?auto_26245 )
      ( MAKE-5CRATE-VERIFY ?auto_26240 ?auto_26241 ?auto_26242 ?auto_26243 ?auto_26244 ?auto_26245 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26252 - SURFACE
      ?auto_26253 - SURFACE
    )
    :vars
    (
      ?auto_26254 - HOIST
      ?auto_26255 - PLACE
      ?auto_26259 - SURFACE
      ?auto_26256 - PLACE
      ?auto_26260 - HOIST
      ?auto_26258 - SURFACE
      ?auto_26257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26254 ?auto_26255 ) ( IS-CRATE ?auto_26253 ) ( not ( = ?auto_26252 ?auto_26253 ) ) ( not ( = ?auto_26259 ?auto_26252 ) ) ( not ( = ?auto_26259 ?auto_26253 ) ) ( not ( = ?auto_26256 ?auto_26255 ) ) ( HOIST-AT ?auto_26260 ?auto_26256 ) ( not ( = ?auto_26254 ?auto_26260 ) ) ( AVAILABLE ?auto_26260 ) ( SURFACE-AT ?auto_26253 ?auto_26256 ) ( ON ?auto_26253 ?auto_26258 ) ( CLEAR ?auto_26253 ) ( not ( = ?auto_26252 ?auto_26258 ) ) ( not ( = ?auto_26253 ?auto_26258 ) ) ( not ( = ?auto_26259 ?auto_26258 ) ) ( TRUCK-AT ?auto_26257 ?auto_26255 ) ( SURFACE-AT ?auto_26259 ?auto_26255 ) ( CLEAR ?auto_26259 ) ( IS-CRATE ?auto_26252 ) ( AVAILABLE ?auto_26254 ) ( IN ?auto_26252 ?auto_26257 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26254 ?auto_26252 ?auto_26257 ?auto_26255 )
      ( MAKE-2CRATE ?auto_26259 ?auto_26252 ?auto_26253 )
      ( MAKE-1CRATE-VERIFY ?auto_26252 ?auto_26253 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26261 - SURFACE
      ?auto_26262 - SURFACE
      ?auto_26263 - SURFACE
    )
    :vars
    (
      ?auto_26264 - HOIST
      ?auto_26267 - PLACE
      ?auto_26268 - PLACE
      ?auto_26266 - HOIST
      ?auto_26269 - SURFACE
      ?auto_26265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26264 ?auto_26267 ) ( IS-CRATE ?auto_26263 ) ( not ( = ?auto_26262 ?auto_26263 ) ) ( not ( = ?auto_26261 ?auto_26262 ) ) ( not ( = ?auto_26261 ?auto_26263 ) ) ( not ( = ?auto_26268 ?auto_26267 ) ) ( HOIST-AT ?auto_26266 ?auto_26268 ) ( not ( = ?auto_26264 ?auto_26266 ) ) ( AVAILABLE ?auto_26266 ) ( SURFACE-AT ?auto_26263 ?auto_26268 ) ( ON ?auto_26263 ?auto_26269 ) ( CLEAR ?auto_26263 ) ( not ( = ?auto_26262 ?auto_26269 ) ) ( not ( = ?auto_26263 ?auto_26269 ) ) ( not ( = ?auto_26261 ?auto_26269 ) ) ( TRUCK-AT ?auto_26265 ?auto_26267 ) ( SURFACE-AT ?auto_26261 ?auto_26267 ) ( CLEAR ?auto_26261 ) ( IS-CRATE ?auto_26262 ) ( AVAILABLE ?auto_26264 ) ( IN ?auto_26262 ?auto_26265 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26262 ?auto_26263 )
      ( MAKE-2CRATE-VERIFY ?auto_26261 ?auto_26262 ?auto_26263 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26270 - SURFACE
      ?auto_26271 - SURFACE
      ?auto_26272 - SURFACE
      ?auto_26273 - SURFACE
    )
    :vars
    (
      ?auto_26274 - HOIST
      ?auto_26279 - PLACE
      ?auto_26278 - PLACE
      ?auto_26276 - HOIST
      ?auto_26275 - SURFACE
      ?auto_26277 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26274 ?auto_26279 ) ( IS-CRATE ?auto_26273 ) ( not ( = ?auto_26272 ?auto_26273 ) ) ( not ( = ?auto_26271 ?auto_26272 ) ) ( not ( = ?auto_26271 ?auto_26273 ) ) ( not ( = ?auto_26278 ?auto_26279 ) ) ( HOIST-AT ?auto_26276 ?auto_26278 ) ( not ( = ?auto_26274 ?auto_26276 ) ) ( AVAILABLE ?auto_26276 ) ( SURFACE-AT ?auto_26273 ?auto_26278 ) ( ON ?auto_26273 ?auto_26275 ) ( CLEAR ?auto_26273 ) ( not ( = ?auto_26272 ?auto_26275 ) ) ( not ( = ?auto_26273 ?auto_26275 ) ) ( not ( = ?auto_26271 ?auto_26275 ) ) ( TRUCK-AT ?auto_26277 ?auto_26279 ) ( SURFACE-AT ?auto_26271 ?auto_26279 ) ( CLEAR ?auto_26271 ) ( IS-CRATE ?auto_26272 ) ( AVAILABLE ?auto_26274 ) ( IN ?auto_26272 ?auto_26277 ) ( ON ?auto_26271 ?auto_26270 ) ( not ( = ?auto_26270 ?auto_26271 ) ) ( not ( = ?auto_26270 ?auto_26272 ) ) ( not ( = ?auto_26270 ?auto_26273 ) ) ( not ( = ?auto_26270 ?auto_26275 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26271 ?auto_26272 ?auto_26273 )
      ( MAKE-3CRATE-VERIFY ?auto_26270 ?auto_26271 ?auto_26272 ?auto_26273 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26280 - SURFACE
      ?auto_26281 - SURFACE
      ?auto_26282 - SURFACE
      ?auto_26283 - SURFACE
      ?auto_26284 - SURFACE
    )
    :vars
    (
      ?auto_26285 - HOIST
      ?auto_26290 - PLACE
      ?auto_26289 - PLACE
      ?auto_26287 - HOIST
      ?auto_26286 - SURFACE
      ?auto_26288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26285 ?auto_26290 ) ( IS-CRATE ?auto_26284 ) ( not ( = ?auto_26283 ?auto_26284 ) ) ( not ( = ?auto_26282 ?auto_26283 ) ) ( not ( = ?auto_26282 ?auto_26284 ) ) ( not ( = ?auto_26289 ?auto_26290 ) ) ( HOIST-AT ?auto_26287 ?auto_26289 ) ( not ( = ?auto_26285 ?auto_26287 ) ) ( AVAILABLE ?auto_26287 ) ( SURFACE-AT ?auto_26284 ?auto_26289 ) ( ON ?auto_26284 ?auto_26286 ) ( CLEAR ?auto_26284 ) ( not ( = ?auto_26283 ?auto_26286 ) ) ( not ( = ?auto_26284 ?auto_26286 ) ) ( not ( = ?auto_26282 ?auto_26286 ) ) ( TRUCK-AT ?auto_26288 ?auto_26290 ) ( SURFACE-AT ?auto_26282 ?auto_26290 ) ( CLEAR ?auto_26282 ) ( IS-CRATE ?auto_26283 ) ( AVAILABLE ?auto_26285 ) ( IN ?auto_26283 ?auto_26288 ) ( ON ?auto_26281 ?auto_26280 ) ( ON ?auto_26282 ?auto_26281 ) ( not ( = ?auto_26280 ?auto_26281 ) ) ( not ( = ?auto_26280 ?auto_26282 ) ) ( not ( = ?auto_26280 ?auto_26283 ) ) ( not ( = ?auto_26280 ?auto_26284 ) ) ( not ( = ?auto_26280 ?auto_26286 ) ) ( not ( = ?auto_26281 ?auto_26282 ) ) ( not ( = ?auto_26281 ?auto_26283 ) ) ( not ( = ?auto_26281 ?auto_26284 ) ) ( not ( = ?auto_26281 ?auto_26286 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26282 ?auto_26283 ?auto_26284 )
      ( MAKE-4CRATE-VERIFY ?auto_26280 ?auto_26281 ?auto_26282 ?auto_26283 ?auto_26284 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26291 - SURFACE
      ?auto_26292 - SURFACE
      ?auto_26293 - SURFACE
      ?auto_26294 - SURFACE
      ?auto_26295 - SURFACE
      ?auto_26296 - SURFACE
    )
    :vars
    (
      ?auto_26297 - HOIST
      ?auto_26302 - PLACE
      ?auto_26301 - PLACE
      ?auto_26299 - HOIST
      ?auto_26298 - SURFACE
      ?auto_26300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26297 ?auto_26302 ) ( IS-CRATE ?auto_26296 ) ( not ( = ?auto_26295 ?auto_26296 ) ) ( not ( = ?auto_26294 ?auto_26295 ) ) ( not ( = ?auto_26294 ?auto_26296 ) ) ( not ( = ?auto_26301 ?auto_26302 ) ) ( HOIST-AT ?auto_26299 ?auto_26301 ) ( not ( = ?auto_26297 ?auto_26299 ) ) ( AVAILABLE ?auto_26299 ) ( SURFACE-AT ?auto_26296 ?auto_26301 ) ( ON ?auto_26296 ?auto_26298 ) ( CLEAR ?auto_26296 ) ( not ( = ?auto_26295 ?auto_26298 ) ) ( not ( = ?auto_26296 ?auto_26298 ) ) ( not ( = ?auto_26294 ?auto_26298 ) ) ( TRUCK-AT ?auto_26300 ?auto_26302 ) ( SURFACE-AT ?auto_26294 ?auto_26302 ) ( CLEAR ?auto_26294 ) ( IS-CRATE ?auto_26295 ) ( AVAILABLE ?auto_26297 ) ( IN ?auto_26295 ?auto_26300 ) ( ON ?auto_26292 ?auto_26291 ) ( ON ?auto_26293 ?auto_26292 ) ( ON ?auto_26294 ?auto_26293 ) ( not ( = ?auto_26291 ?auto_26292 ) ) ( not ( = ?auto_26291 ?auto_26293 ) ) ( not ( = ?auto_26291 ?auto_26294 ) ) ( not ( = ?auto_26291 ?auto_26295 ) ) ( not ( = ?auto_26291 ?auto_26296 ) ) ( not ( = ?auto_26291 ?auto_26298 ) ) ( not ( = ?auto_26292 ?auto_26293 ) ) ( not ( = ?auto_26292 ?auto_26294 ) ) ( not ( = ?auto_26292 ?auto_26295 ) ) ( not ( = ?auto_26292 ?auto_26296 ) ) ( not ( = ?auto_26292 ?auto_26298 ) ) ( not ( = ?auto_26293 ?auto_26294 ) ) ( not ( = ?auto_26293 ?auto_26295 ) ) ( not ( = ?auto_26293 ?auto_26296 ) ) ( not ( = ?auto_26293 ?auto_26298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26294 ?auto_26295 ?auto_26296 )
      ( MAKE-5CRATE-VERIFY ?auto_26291 ?auto_26292 ?auto_26293 ?auto_26294 ?auto_26295 ?auto_26296 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26303 - SURFACE
      ?auto_26304 - SURFACE
    )
    :vars
    (
      ?auto_26305 - HOIST
      ?auto_26311 - PLACE
      ?auto_26309 - SURFACE
      ?auto_26310 - PLACE
      ?auto_26307 - HOIST
      ?auto_26306 - SURFACE
      ?auto_26308 - TRUCK
      ?auto_26312 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26305 ?auto_26311 ) ( IS-CRATE ?auto_26304 ) ( not ( = ?auto_26303 ?auto_26304 ) ) ( not ( = ?auto_26309 ?auto_26303 ) ) ( not ( = ?auto_26309 ?auto_26304 ) ) ( not ( = ?auto_26310 ?auto_26311 ) ) ( HOIST-AT ?auto_26307 ?auto_26310 ) ( not ( = ?auto_26305 ?auto_26307 ) ) ( AVAILABLE ?auto_26307 ) ( SURFACE-AT ?auto_26304 ?auto_26310 ) ( ON ?auto_26304 ?auto_26306 ) ( CLEAR ?auto_26304 ) ( not ( = ?auto_26303 ?auto_26306 ) ) ( not ( = ?auto_26304 ?auto_26306 ) ) ( not ( = ?auto_26309 ?auto_26306 ) ) ( SURFACE-AT ?auto_26309 ?auto_26311 ) ( CLEAR ?auto_26309 ) ( IS-CRATE ?auto_26303 ) ( AVAILABLE ?auto_26305 ) ( IN ?auto_26303 ?auto_26308 ) ( TRUCK-AT ?auto_26308 ?auto_26312 ) ( not ( = ?auto_26312 ?auto_26311 ) ) ( not ( = ?auto_26310 ?auto_26312 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26308 ?auto_26312 ?auto_26311 )
      ( MAKE-2CRATE ?auto_26309 ?auto_26303 ?auto_26304 )
      ( MAKE-1CRATE-VERIFY ?auto_26303 ?auto_26304 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26313 - SURFACE
      ?auto_26314 - SURFACE
      ?auto_26315 - SURFACE
    )
    :vars
    (
      ?auto_26316 - HOIST
      ?auto_26317 - PLACE
      ?auto_26318 - PLACE
      ?auto_26319 - HOIST
      ?auto_26321 - SURFACE
      ?auto_26320 - TRUCK
      ?auto_26322 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26316 ?auto_26317 ) ( IS-CRATE ?auto_26315 ) ( not ( = ?auto_26314 ?auto_26315 ) ) ( not ( = ?auto_26313 ?auto_26314 ) ) ( not ( = ?auto_26313 ?auto_26315 ) ) ( not ( = ?auto_26318 ?auto_26317 ) ) ( HOIST-AT ?auto_26319 ?auto_26318 ) ( not ( = ?auto_26316 ?auto_26319 ) ) ( AVAILABLE ?auto_26319 ) ( SURFACE-AT ?auto_26315 ?auto_26318 ) ( ON ?auto_26315 ?auto_26321 ) ( CLEAR ?auto_26315 ) ( not ( = ?auto_26314 ?auto_26321 ) ) ( not ( = ?auto_26315 ?auto_26321 ) ) ( not ( = ?auto_26313 ?auto_26321 ) ) ( SURFACE-AT ?auto_26313 ?auto_26317 ) ( CLEAR ?auto_26313 ) ( IS-CRATE ?auto_26314 ) ( AVAILABLE ?auto_26316 ) ( IN ?auto_26314 ?auto_26320 ) ( TRUCK-AT ?auto_26320 ?auto_26322 ) ( not ( = ?auto_26322 ?auto_26317 ) ) ( not ( = ?auto_26318 ?auto_26322 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26314 ?auto_26315 )
      ( MAKE-2CRATE-VERIFY ?auto_26313 ?auto_26314 ?auto_26315 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26323 - SURFACE
      ?auto_26324 - SURFACE
      ?auto_26325 - SURFACE
      ?auto_26326 - SURFACE
    )
    :vars
    (
      ?auto_26327 - HOIST
      ?auto_26329 - PLACE
      ?auto_26328 - PLACE
      ?auto_26333 - HOIST
      ?auto_26332 - SURFACE
      ?auto_26331 - TRUCK
      ?auto_26330 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26327 ?auto_26329 ) ( IS-CRATE ?auto_26326 ) ( not ( = ?auto_26325 ?auto_26326 ) ) ( not ( = ?auto_26324 ?auto_26325 ) ) ( not ( = ?auto_26324 ?auto_26326 ) ) ( not ( = ?auto_26328 ?auto_26329 ) ) ( HOIST-AT ?auto_26333 ?auto_26328 ) ( not ( = ?auto_26327 ?auto_26333 ) ) ( AVAILABLE ?auto_26333 ) ( SURFACE-AT ?auto_26326 ?auto_26328 ) ( ON ?auto_26326 ?auto_26332 ) ( CLEAR ?auto_26326 ) ( not ( = ?auto_26325 ?auto_26332 ) ) ( not ( = ?auto_26326 ?auto_26332 ) ) ( not ( = ?auto_26324 ?auto_26332 ) ) ( SURFACE-AT ?auto_26324 ?auto_26329 ) ( CLEAR ?auto_26324 ) ( IS-CRATE ?auto_26325 ) ( AVAILABLE ?auto_26327 ) ( IN ?auto_26325 ?auto_26331 ) ( TRUCK-AT ?auto_26331 ?auto_26330 ) ( not ( = ?auto_26330 ?auto_26329 ) ) ( not ( = ?auto_26328 ?auto_26330 ) ) ( ON ?auto_26324 ?auto_26323 ) ( not ( = ?auto_26323 ?auto_26324 ) ) ( not ( = ?auto_26323 ?auto_26325 ) ) ( not ( = ?auto_26323 ?auto_26326 ) ) ( not ( = ?auto_26323 ?auto_26332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26324 ?auto_26325 ?auto_26326 )
      ( MAKE-3CRATE-VERIFY ?auto_26323 ?auto_26324 ?auto_26325 ?auto_26326 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26334 - SURFACE
      ?auto_26335 - SURFACE
      ?auto_26336 - SURFACE
      ?auto_26337 - SURFACE
      ?auto_26338 - SURFACE
    )
    :vars
    (
      ?auto_26339 - HOIST
      ?auto_26341 - PLACE
      ?auto_26340 - PLACE
      ?auto_26345 - HOIST
      ?auto_26344 - SURFACE
      ?auto_26343 - TRUCK
      ?auto_26342 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26339 ?auto_26341 ) ( IS-CRATE ?auto_26338 ) ( not ( = ?auto_26337 ?auto_26338 ) ) ( not ( = ?auto_26336 ?auto_26337 ) ) ( not ( = ?auto_26336 ?auto_26338 ) ) ( not ( = ?auto_26340 ?auto_26341 ) ) ( HOIST-AT ?auto_26345 ?auto_26340 ) ( not ( = ?auto_26339 ?auto_26345 ) ) ( AVAILABLE ?auto_26345 ) ( SURFACE-AT ?auto_26338 ?auto_26340 ) ( ON ?auto_26338 ?auto_26344 ) ( CLEAR ?auto_26338 ) ( not ( = ?auto_26337 ?auto_26344 ) ) ( not ( = ?auto_26338 ?auto_26344 ) ) ( not ( = ?auto_26336 ?auto_26344 ) ) ( SURFACE-AT ?auto_26336 ?auto_26341 ) ( CLEAR ?auto_26336 ) ( IS-CRATE ?auto_26337 ) ( AVAILABLE ?auto_26339 ) ( IN ?auto_26337 ?auto_26343 ) ( TRUCK-AT ?auto_26343 ?auto_26342 ) ( not ( = ?auto_26342 ?auto_26341 ) ) ( not ( = ?auto_26340 ?auto_26342 ) ) ( ON ?auto_26335 ?auto_26334 ) ( ON ?auto_26336 ?auto_26335 ) ( not ( = ?auto_26334 ?auto_26335 ) ) ( not ( = ?auto_26334 ?auto_26336 ) ) ( not ( = ?auto_26334 ?auto_26337 ) ) ( not ( = ?auto_26334 ?auto_26338 ) ) ( not ( = ?auto_26334 ?auto_26344 ) ) ( not ( = ?auto_26335 ?auto_26336 ) ) ( not ( = ?auto_26335 ?auto_26337 ) ) ( not ( = ?auto_26335 ?auto_26338 ) ) ( not ( = ?auto_26335 ?auto_26344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26336 ?auto_26337 ?auto_26338 )
      ( MAKE-4CRATE-VERIFY ?auto_26334 ?auto_26335 ?auto_26336 ?auto_26337 ?auto_26338 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26346 - SURFACE
      ?auto_26347 - SURFACE
      ?auto_26348 - SURFACE
      ?auto_26349 - SURFACE
      ?auto_26350 - SURFACE
      ?auto_26351 - SURFACE
    )
    :vars
    (
      ?auto_26352 - HOIST
      ?auto_26354 - PLACE
      ?auto_26353 - PLACE
      ?auto_26358 - HOIST
      ?auto_26357 - SURFACE
      ?auto_26356 - TRUCK
      ?auto_26355 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26352 ?auto_26354 ) ( IS-CRATE ?auto_26351 ) ( not ( = ?auto_26350 ?auto_26351 ) ) ( not ( = ?auto_26349 ?auto_26350 ) ) ( not ( = ?auto_26349 ?auto_26351 ) ) ( not ( = ?auto_26353 ?auto_26354 ) ) ( HOIST-AT ?auto_26358 ?auto_26353 ) ( not ( = ?auto_26352 ?auto_26358 ) ) ( AVAILABLE ?auto_26358 ) ( SURFACE-AT ?auto_26351 ?auto_26353 ) ( ON ?auto_26351 ?auto_26357 ) ( CLEAR ?auto_26351 ) ( not ( = ?auto_26350 ?auto_26357 ) ) ( not ( = ?auto_26351 ?auto_26357 ) ) ( not ( = ?auto_26349 ?auto_26357 ) ) ( SURFACE-AT ?auto_26349 ?auto_26354 ) ( CLEAR ?auto_26349 ) ( IS-CRATE ?auto_26350 ) ( AVAILABLE ?auto_26352 ) ( IN ?auto_26350 ?auto_26356 ) ( TRUCK-AT ?auto_26356 ?auto_26355 ) ( not ( = ?auto_26355 ?auto_26354 ) ) ( not ( = ?auto_26353 ?auto_26355 ) ) ( ON ?auto_26347 ?auto_26346 ) ( ON ?auto_26348 ?auto_26347 ) ( ON ?auto_26349 ?auto_26348 ) ( not ( = ?auto_26346 ?auto_26347 ) ) ( not ( = ?auto_26346 ?auto_26348 ) ) ( not ( = ?auto_26346 ?auto_26349 ) ) ( not ( = ?auto_26346 ?auto_26350 ) ) ( not ( = ?auto_26346 ?auto_26351 ) ) ( not ( = ?auto_26346 ?auto_26357 ) ) ( not ( = ?auto_26347 ?auto_26348 ) ) ( not ( = ?auto_26347 ?auto_26349 ) ) ( not ( = ?auto_26347 ?auto_26350 ) ) ( not ( = ?auto_26347 ?auto_26351 ) ) ( not ( = ?auto_26347 ?auto_26357 ) ) ( not ( = ?auto_26348 ?auto_26349 ) ) ( not ( = ?auto_26348 ?auto_26350 ) ) ( not ( = ?auto_26348 ?auto_26351 ) ) ( not ( = ?auto_26348 ?auto_26357 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26349 ?auto_26350 ?auto_26351 )
      ( MAKE-5CRATE-VERIFY ?auto_26346 ?auto_26347 ?auto_26348 ?auto_26349 ?auto_26350 ?auto_26351 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26359 - SURFACE
      ?auto_26360 - SURFACE
    )
    :vars
    (
      ?auto_26362 - HOIST
      ?auto_26364 - PLACE
      ?auto_26361 - SURFACE
      ?auto_26363 - PLACE
      ?auto_26368 - HOIST
      ?auto_26367 - SURFACE
      ?auto_26366 - TRUCK
      ?auto_26365 - PLACE
      ?auto_26369 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26362 ?auto_26364 ) ( IS-CRATE ?auto_26360 ) ( not ( = ?auto_26359 ?auto_26360 ) ) ( not ( = ?auto_26361 ?auto_26359 ) ) ( not ( = ?auto_26361 ?auto_26360 ) ) ( not ( = ?auto_26363 ?auto_26364 ) ) ( HOIST-AT ?auto_26368 ?auto_26363 ) ( not ( = ?auto_26362 ?auto_26368 ) ) ( AVAILABLE ?auto_26368 ) ( SURFACE-AT ?auto_26360 ?auto_26363 ) ( ON ?auto_26360 ?auto_26367 ) ( CLEAR ?auto_26360 ) ( not ( = ?auto_26359 ?auto_26367 ) ) ( not ( = ?auto_26360 ?auto_26367 ) ) ( not ( = ?auto_26361 ?auto_26367 ) ) ( SURFACE-AT ?auto_26361 ?auto_26364 ) ( CLEAR ?auto_26361 ) ( IS-CRATE ?auto_26359 ) ( AVAILABLE ?auto_26362 ) ( TRUCK-AT ?auto_26366 ?auto_26365 ) ( not ( = ?auto_26365 ?auto_26364 ) ) ( not ( = ?auto_26363 ?auto_26365 ) ) ( HOIST-AT ?auto_26369 ?auto_26365 ) ( LIFTING ?auto_26369 ?auto_26359 ) ( not ( = ?auto_26362 ?auto_26369 ) ) ( not ( = ?auto_26368 ?auto_26369 ) ) )
    :subtasks
    ( ( !LOAD ?auto_26369 ?auto_26359 ?auto_26366 ?auto_26365 )
      ( MAKE-2CRATE ?auto_26361 ?auto_26359 ?auto_26360 )
      ( MAKE-1CRATE-VERIFY ?auto_26359 ?auto_26360 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26370 - SURFACE
      ?auto_26371 - SURFACE
      ?auto_26372 - SURFACE
    )
    :vars
    (
      ?auto_26377 - HOIST
      ?auto_26376 - PLACE
      ?auto_26375 - PLACE
      ?auto_26374 - HOIST
      ?auto_26380 - SURFACE
      ?auto_26378 - TRUCK
      ?auto_26379 - PLACE
      ?auto_26373 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26377 ?auto_26376 ) ( IS-CRATE ?auto_26372 ) ( not ( = ?auto_26371 ?auto_26372 ) ) ( not ( = ?auto_26370 ?auto_26371 ) ) ( not ( = ?auto_26370 ?auto_26372 ) ) ( not ( = ?auto_26375 ?auto_26376 ) ) ( HOIST-AT ?auto_26374 ?auto_26375 ) ( not ( = ?auto_26377 ?auto_26374 ) ) ( AVAILABLE ?auto_26374 ) ( SURFACE-AT ?auto_26372 ?auto_26375 ) ( ON ?auto_26372 ?auto_26380 ) ( CLEAR ?auto_26372 ) ( not ( = ?auto_26371 ?auto_26380 ) ) ( not ( = ?auto_26372 ?auto_26380 ) ) ( not ( = ?auto_26370 ?auto_26380 ) ) ( SURFACE-AT ?auto_26370 ?auto_26376 ) ( CLEAR ?auto_26370 ) ( IS-CRATE ?auto_26371 ) ( AVAILABLE ?auto_26377 ) ( TRUCK-AT ?auto_26378 ?auto_26379 ) ( not ( = ?auto_26379 ?auto_26376 ) ) ( not ( = ?auto_26375 ?auto_26379 ) ) ( HOIST-AT ?auto_26373 ?auto_26379 ) ( LIFTING ?auto_26373 ?auto_26371 ) ( not ( = ?auto_26377 ?auto_26373 ) ) ( not ( = ?auto_26374 ?auto_26373 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26371 ?auto_26372 )
      ( MAKE-2CRATE-VERIFY ?auto_26370 ?auto_26371 ?auto_26372 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26381 - SURFACE
      ?auto_26382 - SURFACE
      ?auto_26383 - SURFACE
      ?auto_26384 - SURFACE
    )
    :vars
    (
      ?auto_26391 - HOIST
      ?auto_26385 - PLACE
      ?auto_26386 - PLACE
      ?auto_26387 - HOIST
      ?auto_26392 - SURFACE
      ?auto_26389 - TRUCK
      ?auto_26388 - PLACE
      ?auto_26390 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26391 ?auto_26385 ) ( IS-CRATE ?auto_26384 ) ( not ( = ?auto_26383 ?auto_26384 ) ) ( not ( = ?auto_26382 ?auto_26383 ) ) ( not ( = ?auto_26382 ?auto_26384 ) ) ( not ( = ?auto_26386 ?auto_26385 ) ) ( HOIST-AT ?auto_26387 ?auto_26386 ) ( not ( = ?auto_26391 ?auto_26387 ) ) ( AVAILABLE ?auto_26387 ) ( SURFACE-AT ?auto_26384 ?auto_26386 ) ( ON ?auto_26384 ?auto_26392 ) ( CLEAR ?auto_26384 ) ( not ( = ?auto_26383 ?auto_26392 ) ) ( not ( = ?auto_26384 ?auto_26392 ) ) ( not ( = ?auto_26382 ?auto_26392 ) ) ( SURFACE-AT ?auto_26382 ?auto_26385 ) ( CLEAR ?auto_26382 ) ( IS-CRATE ?auto_26383 ) ( AVAILABLE ?auto_26391 ) ( TRUCK-AT ?auto_26389 ?auto_26388 ) ( not ( = ?auto_26388 ?auto_26385 ) ) ( not ( = ?auto_26386 ?auto_26388 ) ) ( HOIST-AT ?auto_26390 ?auto_26388 ) ( LIFTING ?auto_26390 ?auto_26383 ) ( not ( = ?auto_26391 ?auto_26390 ) ) ( not ( = ?auto_26387 ?auto_26390 ) ) ( ON ?auto_26382 ?auto_26381 ) ( not ( = ?auto_26381 ?auto_26382 ) ) ( not ( = ?auto_26381 ?auto_26383 ) ) ( not ( = ?auto_26381 ?auto_26384 ) ) ( not ( = ?auto_26381 ?auto_26392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26382 ?auto_26383 ?auto_26384 )
      ( MAKE-3CRATE-VERIFY ?auto_26381 ?auto_26382 ?auto_26383 ?auto_26384 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26393 - SURFACE
      ?auto_26394 - SURFACE
      ?auto_26395 - SURFACE
      ?auto_26396 - SURFACE
      ?auto_26397 - SURFACE
    )
    :vars
    (
      ?auto_26404 - HOIST
      ?auto_26398 - PLACE
      ?auto_26399 - PLACE
      ?auto_26400 - HOIST
      ?auto_26405 - SURFACE
      ?auto_26402 - TRUCK
      ?auto_26401 - PLACE
      ?auto_26403 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26404 ?auto_26398 ) ( IS-CRATE ?auto_26397 ) ( not ( = ?auto_26396 ?auto_26397 ) ) ( not ( = ?auto_26395 ?auto_26396 ) ) ( not ( = ?auto_26395 ?auto_26397 ) ) ( not ( = ?auto_26399 ?auto_26398 ) ) ( HOIST-AT ?auto_26400 ?auto_26399 ) ( not ( = ?auto_26404 ?auto_26400 ) ) ( AVAILABLE ?auto_26400 ) ( SURFACE-AT ?auto_26397 ?auto_26399 ) ( ON ?auto_26397 ?auto_26405 ) ( CLEAR ?auto_26397 ) ( not ( = ?auto_26396 ?auto_26405 ) ) ( not ( = ?auto_26397 ?auto_26405 ) ) ( not ( = ?auto_26395 ?auto_26405 ) ) ( SURFACE-AT ?auto_26395 ?auto_26398 ) ( CLEAR ?auto_26395 ) ( IS-CRATE ?auto_26396 ) ( AVAILABLE ?auto_26404 ) ( TRUCK-AT ?auto_26402 ?auto_26401 ) ( not ( = ?auto_26401 ?auto_26398 ) ) ( not ( = ?auto_26399 ?auto_26401 ) ) ( HOIST-AT ?auto_26403 ?auto_26401 ) ( LIFTING ?auto_26403 ?auto_26396 ) ( not ( = ?auto_26404 ?auto_26403 ) ) ( not ( = ?auto_26400 ?auto_26403 ) ) ( ON ?auto_26394 ?auto_26393 ) ( ON ?auto_26395 ?auto_26394 ) ( not ( = ?auto_26393 ?auto_26394 ) ) ( not ( = ?auto_26393 ?auto_26395 ) ) ( not ( = ?auto_26393 ?auto_26396 ) ) ( not ( = ?auto_26393 ?auto_26397 ) ) ( not ( = ?auto_26393 ?auto_26405 ) ) ( not ( = ?auto_26394 ?auto_26395 ) ) ( not ( = ?auto_26394 ?auto_26396 ) ) ( not ( = ?auto_26394 ?auto_26397 ) ) ( not ( = ?auto_26394 ?auto_26405 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26395 ?auto_26396 ?auto_26397 )
      ( MAKE-4CRATE-VERIFY ?auto_26393 ?auto_26394 ?auto_26395 ?auto_26396 ?auto_26397 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26406 - SURFACE
      ?auto_26407 - SURFACE
      ?auto_26408 - SURFACE
      ?auto_26409 - SURFACE
      ?auto_26410 - SURFACE
      ?auto_26411 - SURFACE
    )
    :vars
    (
      ?auto_26418 - HOIST
      ?auto_26412 - PLACE
      ?auto_26413 - PLACE
      ?auto_26414 - HOIST
      ?auto_26419 - SURFACE
      ?auto_26416 - TRUCK
      ?auto_26415 - PLACE
      ?auto_26417 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26418 ?auto_26412 ) ( IS-CRATE ?auto_26411 ) ( not ( = ?auto_26410 ?auto_26411 ) ) ( not ( = ?auto_26409 ?auto_26410 ) ) ( not ( = ?auto_26409 ?auto_26411 ) ) ( not ( = ?auto_26413 ?auto_26412 ) ) ( HOIST-AT ?auto_26414 ?auto_26413 ) ( not ( = ?auto_26418 ?auto_26414 ) ) ( AVAILABLE ?auto_26414 ) ( SURFACE-AT ?auto_26411 ?auto_26413 ) ( ON ?auto_26411 ?auto_26419 ) ( CLEAR ?auto_26411 ) ( not ( = ?auto_26410 ?auto_26419 ) ) ( not ( = ?auto_26411 ?auto_26419 ) ) ( not ( = ?auto_26409 ?auto_26419 ) ) ( SURFACE-AT ?auto_26409 ?auto_26412 ) ( CLEAR ?auto_26409 ) ( IS-CRATE ?auto_26410 ) ( AVAILABLE ?auto_26418 ) ( TRUCK-AT ?auto_26416 ?auto_26415 ) ( not ( = ?auto_26415 ?auto_26412 ) ) ( not ( = ?auto_26413 ?auto_26415 ) ) ( HOIST-AT ?auto_26417 ?auto_26415 ) ( LIFTING ?auto_26417 ?auto_26410 ) ( not ( = ?auto_26418 ?auto_26417 ) ) ( not ( = ?auto_26414 ?auto_26417 ) ) ( ON ?auto_26407 ?auto_26406 ) ( ON ?auto_26408 ?auto_26407 ) ( ON ?auto_26409 ?auto_26408 ) ( not ( = ?auto_26406 ?auto_26407 ) ) ( not ( = ?auto_26406 ?auto_26408 ) ) ( not ( = ?auto_26406 ?auto_26409 ) ) ( not ( = ?auto_26406 ?auto_26410 ) ) ( not ( = ?auto_26406 ?auto_26411 ) ) ( not ( = ?auto_26406 ?auto_26419 ) ) ( not ( = ?auto_26407 ?auto_26408 ) ) ( not ( = ?auto_26407 ?auto_26409 ) ) ( not ( = ?auto_26407 ?auto_26410 ) ) ( not ( = ?auto_26407 ?auto_26411 ) ) ( not ( = ?auto_26407 ?auto_26419 ) ) ( not ( = ?auto_26408 ?auto_26409 ) ) ( not ( = ?auto_26408 ?auto_26410 ) ) ( not ( = ?auto_26408 ?auto_26411 ) ) ( not ( = ?auto_26408 ?auto_26419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26409 ?auto_26410 ?auto_26411 )
      ( MAKE-5CRATE-VERIFY ?auto_26406 ?auto_26407 ?auto_26408 ?auto_26409 ?auto_26410 ?auto_26411 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26420 - SURFACE
      ?auto_26421 - SURFACE
    )
    :vars
    (
      ?auto_26429 - HOIST
      ?auto_26422 - PLACE
      ?auto_26424 - SURFACE
      ?auto_26423 - PLACE
      ?auto_26425 - HOIST
      ?auto_26430 - SURFACE
      ?auto_26427 - TRUCK
      ?auto_26426 - PLACE
      ?auto_26428 - HOIST
      ?auto_26431 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26429 ?auto_26422 ) ( IS-CRATE ?auto_26421 ) ( not ( = ?auto_26420 ?auto_26421 ) ) ( not ( = ?auto_26424 ?auto_26420 ) ) ( not ( = ?auto_26424 ?auto_26421 ) ) ( not ( = ?auto_26423 ?auto_26422 ) ) ( HOIST-AT ?auto_26425 ?auto_26423 ) ( not ( = ?auto_26429 ?auto_26425 ) ) ( AVAILABLE ?auto_26425 ) ( SURFACE-AT ?auto_26421 ?auto_26423 ) ( ON ?auto_26421 ?auto_26430 ) ( CLEAR ?auto_26421 ) ( not ( = ?auto_26420 ?auto_26430 ) ) ( not ( = ?auto_26421 ?auto_26430 ) ) ( not ( = ?auto_26424 ?auto_26430 ) ) ( SURFACE-AT ?auto_26424 ?auto_26422 ) ( CLEAR ?auto_26424 ) ( IS-CRATE ?auto_26420 ) ( AVAILABLE ?auto_26429 ) ( TRUCK-AT ?auto_26427 ?auto_26426 ) ( not ( = ?auto_26426 ?auto_26422 ) ) ( not ( = ?auto_26423 ?auto_26426 ) ) ( HOIST-AT ?auto_26428 ?auto_26426 ) ( not ( = ?auto_26429 ?auto_26428 ) ) ( not ( = ?auto_26425 ?auto_26428 ) ) ( AVAILABLE ?auto_26428 ) ( SURFACE-AT ?auto_26420 ?auto_26426 ) ( ON ?auto_26420 ?auto_26431 ) ( CLEAR ?auto_26420 ) ( not ( = ?auto_26420 ?auto_26431 ) ) ( not ( = ?auto_26421 ?auto_26431 ) ) ( not ( = ?auto_26424 ?auto_26431 ) ) ( not ( = ?auto_26430 ?auto_26431 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26428 ?auto_26420 ?auto_26431 ?auto_26426 )
      ( MAKE-2CRATE ?auto_26424 ?auto_26420 ?auto_26421 )
      ( MAKE-1CRATE-VERIFY ?auto_26420 ?auto_26421 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26432 - SURFACE
      ?auto_26433 - SURFACE
      ?auto_26434 - SURFACE
    )
    :vars
    (
      ?auto_26442 - HOIST
      ?auto_26437 - PLACE
      ?auto_26441 - PLACE
      ?auto_26439 - HOIST
      ?auto_26435 - SURFACE
      ?auto_26436 - TRUCK
      ?auto_26440 - PLACE
      ?auto_26438 - HOIST
      ?auto_26443 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26442 ?auto_26437 ) ( IS-CRATE ?auto_26434 ) ( not ( = ?auto_26433 ?auto_26434 ) ) ( not ( = ?auto_26432 ?auto_26433 ) ) ( not ( = ?auto_26432 ?auto_26434 ) ) ( not ( = ?auto_26441 ?auto_26437 ) ) ( HOIST-AT ?auto_26439 ?auto_26441 ) ( not ( = ?auto_26442 ?auto_26439 ) ) ( AVAILABLE ?auto_26439 ) ( SURFACE-AT ?auto_26434 ?auto_26441 ) ( ON ?auto_26434 ?auto_26435 ) ( CLEAR ?auto_26434 ) ( not ( = ?auto_26433 ?auto_26435 ) ) ( not ( = ?auto_26434 ?auto_26435 ) ) ( not ( = ?auto_26432 ?auto_26435 ) ) ( SURFACE-AT ?auto_26432 ?auto_26437 ) ( CLEAR ?auto_26432 ) ( IS-CRATE ?auto_26433 ) ( AVAILABLE ?auto_26442 ) ( TRUCK-AT ?auto_26436 ?auto_26440 ) ( not ( = ?auto_26440 ?auto_26437 ) ) ( not ( = ?auto_26441 ?auto_26440 ) ) ( HOIST-AT ?auto_26438 ?auto_26440 ) ( not ( = ?auto_26442 ?auto_26438 ) ) ( not ( = ?auto_26439 ?auto_26438 ) ) ( AVAILABLE ?auto_26438 ) ( SURFACE-AT ?auto_26433 ?auto_26440 ) ( ON ?auto_26433 ?auto_26443 ) ( CLEAR ?auto_26433 ) ( not ( = ?auto_26433 ?auto_26443 ) ) ( not ( = ?auto_26434 ?auto_26443 ) ) ( not ( = ?auto_26432 ?auto_26443 ) ) ( not ( = ?auto_26435 ?auto_26443 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26433 ?auto_26434 )
      ( MAKE-2CRATE-VERIFY ?auto_26432 ?auto_26433 ?auto_26434 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26444 - SURFACE
      ?auto_26445 - SURFACE
      ?auto_26446 - SURFACE
      ?auto_26447 - SURFACE
    )
    :vars
    (
      ?auto_26449 - HOIST
      ?auto_26456 - PLACE
      ?auto_26452 - PLACE
      ?auto_26454 - HOIST
      ?auto_26455 - SURFACE
      ?auto_26453 - TRUCK
      ?auto_26450 - PLACE
      ?auto_26451 - HOIST
      ?auto_26448 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26449 ?auto_26456 ) ( IS-CRATE ?auto_26447 ) ( not ( = ?auto_26446 ?auto_26447 ) ) ( not ( = ?auto_26445 ?auto_26446 ) ) ( not ( = ?auto_26445 ?auto_26447 ) ) ( not ( = ?auto_26452 ?auto_26456 ) ) ( HOIST-AT ?auto_26454 ?auto_26452 ) ( not ( = ?auto_26449 ?auto_26454 ) ) ( AVAILABLE ?auto_26454 ) ( SURFACE-AT ?auto_26447 ?auto_26452 ) ( ON ?auto_26447 ?auto_26455 ) ( CLEAR ?auto_26447 ) ( not ( = ?auto_26446 ?auto_26455 ) ) ( not ( = ?auto_26447 ?auto_26455 ) ) ( not ( = ?auto_26445 ?auto_26455 ) ) ( SURFACE-AT ?auto_26445 ?auto_26456 ) ( CLEAR ?auto_26445 ) ( IS-CRATE ?auto_26446 ) ( AVAILABLE ?auto_26449 ) ( TRUCK-AT ?auto_26453 ?auto_26450 ) ( not ( = ?auto_26450 ?auto_26456 ) ) ( not ( = ?auto_26452 ?auto_26450 ) ) ( HOIST-AT ?auto_26451 ?auto_26450 ) ( not ( = ?auto_26449 ?auto_26451 ) ) ( not ( = ?auto_26454 ?auto_26451 ) ) ( AVAILABLE ?auto_26451 ) ( SURFACE-AT ?auto_26446 ?auto_26450 ) ( ON ?auto_26446 ?auto_26448 ) ( CLEAR ?auto_26446 ) ( not ( = ?auto_26446 ?auto_26448 ) ) ( not ( = ?auto_26447 ?auto_26448 ) ) ( not ( = ?auto_26445 ?auto_26448 ) ) ( not ( = ?auto_26455 ?auto_26448 ) ) ( ON ?auto_26445 ?auto_26444 ) ( not ( = ?auto_26444 ?auto_26445 ) ) ( not ( = ?auto_26444 ?auto_26446 ) ) ( not ( = ?auto_26444 ?auto_26447 ) ) ( not ( = ?auto_26444 ?auto_26455 ) ) ( not ( = ?auto_26444 ?auto_26448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26445 ?auto_26446 ?auto_26447 )
      ( MAKE-3CRATE-VERIFY ?auto_26444 ?auto_26445 ?auto_26446 ?auto_26447 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26457 - SURFACE
      ?auto_26458 - SURFACE
      ?auto_26459 - SURFACE
      ?auto_26460 - SURFACE
      ?auto_26461 - SURFACE
    )
    :vars
    (
      ?auto_26463 - HOIST
      ?auto_26470 - PLACE
      ?auto_26466 - PLACE
      ?auto_26468 - HOIST
      ?auto_26469 - SURFACE
      ?auto_26467 - TRUCK
      ?auto_26464 - PLACE
      ?auto_26465 - HOIST
      ?auto_26462 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26463 ?auto_26470 ) ( IS-CRATE ?auto_26461 ) ( not ( = ?auto_26460 ?auto_26461 ) ) ( not ( = ?auto_26459 ?auto_26460 ) ) ( not ( = ?auto_26459 ?auto_26461 ) ) ( not ( = ?auto_26466 ?auto_26470 ) ) ( HOIST-AT ?auto_26468 ?auto_26466 ) ( not ( = ?auto_26463 ?auto_26468 ) ) ( AVAILABLE ?auto_26468 ) ( SURFACE-AT ?auto_26461 ?auto_26466 ) ( ON ?auto_26461 ?auto_26469 ) ( CLEAR ?auto_26461 ) ( not ( = ?auto_26460 ?auto_26469 ) ) ( not ( = ?auto_26461 ?auto_26469 ) ) ( not ( = ?auto_26459 ?auto_26469 ) ) ( SURFACE-AT ?auto_26459 ?auto_26470 ) ( CLEAR ?auto_26459 ) ( IS-CRATE ?auto_26460 ) ( AVAILABLE ?auto_26463 ) ( TRUCK-AT ?auto_26467 ?auto_26464 ) ( not ( = ?auto_26464 ?auto_26470 ) ) ( not ( = ?auto_26466 ?auto_26464 ) ) ( HOIST-AT ?auto_26465 ?auto_26464 ) ( not ( = ?auto_26463 ?auto_26465 ) ) ( not ( = ?auto_26468 ?auto_26465 ) ) ( AVAILABLE ?auto_26465 ) ( SURFACE-AT ?auto_26460 ?auto_26464 ) ( ON ?auto_26460 ?auto_26462 ) ( CLEAR ?auto_26460 ) ( not ( = ?auto_26460 ?auto_26462 ) ) ( not ( = ?auto_26461 ?auto_26462 ) ) ( not ( = ?auto_26459 ?auto_26462 ) ) ( not ( = ?auto_26469 ?auto_26462 ) ) ( ON ?auto_26458 ?auto_26457 ) ( ON ?auto_26459 ?auto_26458 ) ( not ( = ?auto_26457 ?auto_26458 ) ) ( not ( = ?auto_26457 ?auto_26459 ) ) ( not ( = ?auto_26457 ?auto_26460 ) ) ( not ( = ?auto_26457 ?auto_26461 ) ) ( not ( = ?auto_26457 ?auto_26469 ) ) ( not ( = ?auto_26457 ?auto_26462 ) ) ( not ( = ?auto_26458 ?auto_26459 ) ) ( not ( = ?auto_26458 ?auto_26460 ) ) ( not ( = ?auto_26458 ?auto_26461 ) ) ( not ( = ?auto_26458 ?auto_26469 ) ) ( not ( = ?auto_26458 ?auto_26462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26459 ?auto_26460 ?auto_26461 )
      ( MAKE-4CRATE-VERIFY ?auto_26457 ?auto_26458 ?auto_26459 ?auto_26460 ?auto_26461 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26471 - SURFACE
      ?auto_26472 - SURFACE
      ?auto_26473 - SURFACE
      ?auto_26474 - SURFACE
      ?auto_26475 - SURFACE
      ?auto_26476 - SURFACE
    )
    :vars
    (
      ?auto_26478 - HOIST
      ?auto_26485 - PLACE
      ?auto_26481 - PLACE
      ?auto_26483 - HOIST
      ?auto_26484 - SURFACE
      ?auto_26482 - TRUCK
      ?auto_26479 - PLACE
      ?auto_26480 - HOIST
      ?auto_26477 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26478 ?auto_26485 ) ( IS-CRATE ?auto_26476 ) ( not ( = ?auto_26475 ?auto_26476 ) ) ( not ( = ?auto_26474 ?auto_26475 ) ) ( not ( = ?auto_26474 ?auto_26476 ) ) ( not ( = ?auto_26481 ?auto_26485 ) ) ( HOIST-AT ?auto_26483 ?auto_26481 ) ( not ( = ?auto_26478 ?auto_26483 ) ) ( AVAILABLE ?auto_26483 ) ( SURFACE-AT ?auto_26476 ?auto_26481 ) ( ON ?auto_26476 ?auto_26484 ) ( CLEAR ?auto_26476 ) ( not ( = ?auto_26475 ?auto_26484 ) ) ( not ( = ?auto_26476 ?auto_26484 ) ) ( not ( = ?auto_26474 ?auto_26484 ) ) ( SURFACE-AT ?auto_26474 ?auto_26485 ) ( CLEAR ?auto_26474 ) ( IS-CRATE ?auto_26475 ) ( AVAILABLE ?auto_26478 ) ( TRUCK-AT ?auto_26482 ?auto_26479 ) ( not ( = ?auto_26479 ?auto_26485 ) ) ( not ( = ?auto_26481 ?auto_26479 ) ) ( HOIST-AT ?auto_26480 ?auto_26479 ) ( not ( = ?auto_26478 ?auto_26480 ) ) ( not ( = ?auto_26483 ?auto_26480 ) ) ( AVAILABLE ?auto_26480 ) ( SURFACE-AT ?auto_26475 ?auto_26479 ) ( ON ?auto_26475 ?auto_26477 ) ( CLEAR ?auto_26475 ) ( not ( = ?auto_26475 ?auto_26477 ) ) ( not ( = ?auto_26476 ?auto_26477 ) ) ( not ( = ?auto_26474 ?auto_26477 ) ) ( not ( = ?auto_26484 ?auto_26477 ) ) ( ON ?auto_26472 ?auto_26471 ) ( ON ?auto_26473 ?auto_26472 ) ( ON ?auto_26474 ?auto_26473 ) ( not ( = ?auto_26471 ?auto_26472 ) ) ( not ( = ?auto_26471 ?auto_26473 ) ) ( not ( = ?auto_26471 ?auto_26474 ) ) ( not ( = ?auto_26471 ?auto_26475 ) ) ( not ( = ?auto_26471 ?auto_26476 ) ) ( not ( = ?auto_26471 ?auto_26484 ) ) ( not ( = ?auto_26471 ?auto_26477 ) ) ( not ( = ?auto_26472 ?auto_26473 ) ) ( not ( = ?auto_26472 ?auto_26474 ) ) ( not ( = ?auto_26472 ?auto_26475 ) ) ( not ( = ?auto_26472 ?auto_26476 ) ) ( not ( = ?auto_26472 ?auto_26484 ) ) ( not ( = ?auto_26472 ?auto_26477 ) ) ( not ( = ?auto_26473 ?auto_26474 ) ) ( not ( = ?auto_26473 ?auto_26475 ) ) ( not ( = ?auto_26473 ?auto_26476 ) ) ( not ( = ?auto_26473 ?auto_26484 ) ) ( not ( = ?auto_26473 ?auto_26477 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26474 ?auto_26475 ?auto_26476 )
      ( MAKE-5CRATE-VERIFY ?auto_26471 ?auto_26472 ?auto_26473 ?auto_26474 ?auto_26475 ?auto_26476 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26486 - SURFACE
      ?auto_26487 - SURFACE
    )
    :vars
    (
      ?auto_26489 - HOIST
      ?auto_26496 - PLACE
      ?auto_26497 - SURFACE
      ?auto_26492 - PLACE
      ?auto_26494 - HOIST
      ?auto_26495 - SURFACE
      ?auto_26490 - PLACE
      ?auto_26491 - HOIST
      ?auto_26488 - SURFACE
      ?auto_26493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26489 ?auto_26496 ) ( IS-CRATE ?auto_26487 ) ( not ( = ?auto_26486 ?auto_26487 ) ) ( not ( = ?auto_26497 ?auto_26486 ) ) ( not ( = ?auto_26497 ?auto_26487 ) ) ( not ( = ?auto_26492 ?auto_26496 ) ) ( HOIST-AT ?auto_26494 ?auto_26492 ) ( not ( = ?auto_26489 ?auto_26494 ) ) ( AVAILABLE ?auto_26494 ) ( SURFACE-AT ?auto_26487 ?auto_26492 ) ( ON ?auto_26487 ?auto_26495 ) ( CLEAR ?auto_26487 ) ( not ( = ?auto_26486 ?auto_26495 ) ) ( not ( = ?auto_26487 ?auto_26495 ) ) ( not ( = ?auto_26497 ?auto_26495 ) ) ( SURFACE-AT ?auto_26497 ?auto_26496 ) ( CLEAR ?auto_26497 ) ( IS-CRATE ?auto_26486 ) ( AVAILABLE ?auto_26489 ) ( not ( = ?auto_26490 ?auto_26496 ) ) ( not ( = ?auto_26492 ?auto_26490 ) ) ( HOIST-AT ?auto_26491 ?auto_26490 ) ( not ( = ?auto_26489 ?auto_26491 ) ) ( not ( = ?auto_26494 ?auto_26491 ) ) ( AVAILABLE ?auto_26491 ) ( SURFACE-AT ?auto_26486 ?auto_26490 ) ( ON ?auto_26486 ?auto_26488 ) ( CLEAR ?auto_26486 ) ( not ( = ?auto_26486 ?auto_26488 ) ) ( not ( = ?auto_26487 ?auto_26488 ) ) ( not ( = ?auto_26497 ?auto_26488 ) ) ( not ( = ?auto_26495 ?auto_26488 ) ) ( TRUCK-AT ?auto_26493 ?auto_26496 ) )
    :subtasks
    ( ( !DRIVE ?auto_26493 ?auto_26496 ?auto_26490 )
      ( MAKE-2CRATE ?auto_26497 ?auto_26486 ?auto_26487 )
      ( MAKE-1CRATE-VERIFY ?auto_26486 ?auto_26487 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26498 - SURFACE
      ?auto_26499 - SURFACE
      ?auto_26500 - SURFACE
    )
    :vars
    (
      ?auto_26504 - HOIST
      ?auto_26505 - PLACE
      ?auto_26501 - PLACE
      ?auto_26509 - HOIST
      ?auto_26508 - SURFACE
      ?auto_26507 - PLACE
      ?auto_26502 - HOIST
      ?auto_26503 - SURFACE
      ?auto_26506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26504 ?auto_26505 ) ( IS-CRATE ?auto_26500 ) ( not ( = ?auto_26499 ?auto_26500 ) ) ( not ( = ?auto_26498 ?auto_26499 ) ) ( not ( = ?auto_26498 ?auto_26500 ) ) ( not ( = ?auto_26501 ?auto_26505 ) ) ( HOIST-AT ?auto_26509 ?auto_26501 ) ( not ( = ?auto_26504 ?auto_26509 ) ) ( AVAILABLE ?auto_26509 ) ( SURFACE-AT ?auto_26500 ?auto_26501 ) ( ON ?auto_26500 ?auto_26508 ) ( CLEAR ?auto_26500 ) ( not ( = ?auto_26499 ?auto_26508 ) ) ( not ( = ?auto_26500 ?auto_26508 ) ) ( not ( = ?auto_26498 ?auto_26508 ) ) ( SURFACE-AT ?auto_26498 ?auto_26505 ) ( CLEAR ?auto_26498 ) ( IS-CRATE ?auto_26499 ) ( AVAILABLE ?auto_26504 ) ( not ( = ?auto_26507 ?auto_26505 ) ) ( not ( = ?auto_26501 ?auto_26507 ) ) ( HOIST-AT ?auto_26502 ?auto_26507 ) ( not ( = ?auto_26504 ?auto_26502 ) ) ( not ( = ?auto_26509 ?auto_26502 ) ) ( AVAILABLE ?auto_26502 ) ( SURFACE-AT ?auto_26499 ?auto_26507 ) ( ON ?auto_26499 ?auto_26503 ) ( CLEAR ?auto_26499 ) ( not ( = ?auto_26499 ?auto_26503 ) ) ( not ( = ?auto_26500 ?auto_26503 ) ) ( not ( = ?auto_26498 ?auto_26503 ) ) ( not ( = ?auto_26508 ?auto_26503 ) ) ( TRUCK-AT ?auto_26506 ?auto_26505 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26499 ?auto_26500 )
      ( MAKE-2CRATE-VERIFY ?auto_26498 ?auto_26499 ?auto_26500 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26510 - SURFACE
      ?auto_26511 - SURFACE
      ?auto_26512 - SURFACE
      ?auto_26513 - SURFACE
    )
    :vars
    (
      ?auto_26515 - HOIST
      ?auto_26516 - PLACE
      ?auto_26518 - PLACE
      ?auto_26520 - HOIST
      ?auto_26514 - SURFACE
      ?auto_26522 - PLACE
      ?auto_26519 - HOIST
      ?auto_26517 - SURFACE
      ?auto_26521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26515 ?auto_26516 ) ( IS-CRATE ?auto_26513 ) ( not ( = ?auto_26512 ?auto_26513 ) ) ( not ( = ?auto_26511 ?auto_26512 ) ) ( not ( = ?auto_26511 ?auto_26513 ) ) ( not ( = ?auto_26518 ?auto_26516 ) ) ( HOIST-AT ?auto_26520 ?auto_26518 ) ( not ( = ?auto_26515 ?auto_26520 ) ) ( AVAILABLE ?auto_26520 ) ( SURFACE-AT ?auto_26513 ?auto_26518 ) ( ON ?auto_26513 ?auto_26514 ) ( CLEAR ?auto_26513 ) ( not ( = ?auto_26512 ?auto_26514 ) ) ( not ( = ?auto_26513 ?auto_26514 ) ) ( not ( = ?auto_26511 ?auto_26514 ) ) ( SURFACE-AT ?auto_26511 ?auto_26516 ) ( CLEAR ?auto_26511 ) ( IS-CRATE ?auto_26512 ) ( AVAILABLE ?auto_26515 ) ( not ( = ?auto_26522 ?auto_26516 ) ) ( not ( = ?auto_26518 ?auto_26522 ) ) ( HOIST-AT ?auto_26519 ?auto_26522 ) ( not ( = ?auto_26515 ?auto_26519 ) ) ( not ( = ?auto_26520 ?auto_26519 ) ) ( AVAILABLE ?auto_26519 ) ( SURFACE-AT ?auto_26512 ?auto_26522 ) ( ON ?auto_26512 ?auto_26517 ) ( CLEAR ?auto_26512 ) ( not ( = ?auto_26512 ?auto_26517 ) ) ( not ( = ?auto_26513 ?auto_26517 ) ) ( not ( = ?auto_26511 ?auto_26517 ) ) ( not ( = ?auto_26514 ?auto_26517 ) ) ( TRUCK-AT ?auto_26521 ?auto_26516 ) ( ON ?auto_26511 ?auto_26510 ) ( not ( = ?auto_26510 ?auto_26511 ) ) ( not ( = ?auto_26510 ?auto_26512 ) ) ( not ( = ?auto_26510 ?auto_26513 ) ) ( not ( = ?auto_26510 ?auto_26514 ) ) ( not ( = ?auto_26510 ?auto_26517 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26511 ?auto_26512 ?auto_26513 )
      ( MAKE-3CRATE-VERIFY ?auto_26510 ?auto_26511 ?auto_26512 ?auto_26513 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26523 - SURFACE
      ?auto_26524 - SURFACE
      ?auto_26525 - SURFACE
      ?auto_26526 - SURFACE
      ?auto_26527 - SURFACE
    )
    :vars
    (
      ?auto_26529 - HOIST
      ?auto_26530 - PLACE
      ?auto_26532 - PLACE
      ?auto_26534 - HOIST
      ?auto_26528 - SURFACE
      ?auto_26536 - PLACE
      ?auto_26533 - HOIST
      ?auto_26531 - SURFACE
      ?auto_26535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26529 ?auto_26530 ) ( IS-CRATE ?auto_26527 ) ( not ( = ?auto_26526 ?auto_26527 ) ) ( not ( = ?auto_26525 ?auto_26526 ) ) ( not ( = ?auto_26525 ?auto_26527 ) ) ( not ( = ?auto_26532 ?auto_26530 ) ) ( HOIST-AT ?auto_26534 ?auto_26532 ) ( not ( = ?auto_26529 ?auto_26534 ) ) ( AVAILABLE ?auto_26534 ) ( SURFACE-AT ?auto_26527 ?auto_26532 ) ( ON ?auto_26527 ?auto_26528 ) ( CLEAR ?auto_26527 ) ( not ( = ?auto_26526 ?auto_26528 ) ) ( not ( = ?auto_26527 ?auto_26528 ) ) ( not ( = ?auto_26525 ?auto_26528 ) ) ( SURFACE-AT ?auto_26525 ?auto_26530 ) ( CLEAR ?auto_26525 ) ( IS-CRATE ?auto_26526 ) ( AVAILABLE ?auto_26529 ) ( not ( = ?auto_26536 ?auto_26530 ) ) ( not ( = ?auto_26532 ?auto_26536 ) ) ( HOIST-AT ?auto_26533 ?auto_26536 ) ( not ( = ?auto_26529 ?auto_26533 ) ) ( not ( = ?auto_26534 ?auto_26533 ) ) ( AVAILABLE ?auto_26533 ) ( SURFACE-AT ?auto_26526 ?auto_26536 ) ( ON ?auto_26526 ?auto_26531 ) ( CLEAR ?auto_26526 ) ( not ( = ?auto_26526 ?auto_26531 ) ) ( not ( = ?auto_26527 ?auto_26531 ) ) ( not ( = ?auto_26525 ?auto_26531 ) ) ( not ( = ?auto_26528 ?auto_26531 ) ) ( TRUCK-AT ?auto_26535 ?auto_26530 ) ( ON ?auto_26524 ?auto_26523 ) ( ON ?auto_26525 ?auto_26524 ) ( not ( = ?auto_26523 ?auto_26524 ) ) ( not ( = ?auto_26523 ?auto_26525 ) ) ( not ( = ?auto_26523 ?auto_26526 ) ) ( not ( = ?auto_26523 ?auto_26527 ) ) ( not ( = ?auto_26523 ?auto_26528 ) ) ( not ( = ?auto_26523 ?auto_26531 ) ) ( not ( = ?auto_26524 ?auto_26525 ) ) ( not ( = ?auto_26524 ?auto_26526 ) ) ( not ( = ?auto_26524 ?auto_26527 ) ) ( not ( = ?auto_26524 ?auto_26528 ) ) ( not ( = ?auto_26524 ?auto_26531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26525 ?auto_26526 ?auto_26527 )
      ( MAKE-4CRATE-VERIFY ?auto_26523 ?auto_26524 ?auto_26525 ?auto_26526 ?auto_26527 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26537 - SURFACE
      ?auto_26538 - SURFACE
      ?auto_26539 - SURFACE
      ?auto_26540 - SURFACE
      ?auto_26541 - SURFACE
      ?auto_26542 - SURFACE
    )
    :vars
    (
      ?auto_26544 - HOIST
      ?auto_26545 - PLACE
      ?auto_26547 - PLACE
      ?auto_26549 - HOIST
      ?auto_26543 - SURFACE
      ?auto_26551 - PLACE
      ?auto_26548 - HOIST
      ?auto_26546 - SURFACE
      ?auto_26550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26544 ?auto_26545 ) ( IS-CRATE ?auto_26542 ) ( not ( = ?auto_26541 ?auto_26542 ) ) ( not ( = ?auto_26540 ?auto_26541 ) ) ( not ( = ?auto_26540 ?auto_26542 ) ) ( not ( = ?auto_26547 ?auto_26545 ) ) ( HOIST-AT ?auto_26549 ?auto_26547 ) ( not ( = ?auto_26544 ?auto_26549 ) ) ( AVAILABLE ?auto_26549 ) ( SURFACE-AT ?auto_26542 ?auto_26547 ) ( ON ?auto_26542 ?auto_26543 ) ( CLEAR ?auto_26542 ) ( not ( = ?auto_26541 ?auto_26543 ) ) ( not ( = ?auto_26542 ?auto_26543 ) ) ( not ( = ?auto_26540 ?auto_26543 ) ) ( SURFACE-AT ?auto_26540 ?auto_26545 ) ( CLEAR ?auto_26540 ) ( IS-CRATE ?auto_26541 ) ( AVAILABLE ?auto_26544 ) ( not ( = ?auto_26551 ?auto_26545 ) ) ( not ( = ?auto_26547 ?auto_26551 ) ) ( HOIST-AT ?auto_26548 ?auto_26551 ) ( not ( = ?auto_26544 ?auto_26548 ) ) ( not ( = ?auto_26549 ?auto_26548 ) ) ( AVAILABLE ?auto_26548 ) ( SURFACE-AT ?auto_26541 ?auto_26551 ) ( ON ?auto_26541 ?auto_26546 ) ( CLEAR ?auto_26541 ) ( not ( = ?auto_26541 ?auto_26546 ) ) ( not ( = ?auto_26542 ?auto_26546 ) ) ( not ( = ?auto_26540 ?auto_26546 ) ) ( not ( = ?auto_26543 ?auto_26546 ) ) ( TRUCK-AT ?auto_26550 ?auto_26545 ) ( ON ?auto_26538 ?auto_26537 ) ( ON ?auto_26539 ?auto_26538 ) ( ON ?auto_26540 ?auto_26539 ) ( not ( = ?auto_26537 ?auto_26538 ) ) ( not ( = ?auto_26537 ?auto_26539 ) ) ( not ( = ?auto_26537 ?auto_26540 ) ) ( not ( = ?auto_26537 ?auto_26541 ) ) ( not ( = ?auto_26537 ?auto_26542 ) ) ( not ( = ?auto_26537 ?auto_26543 ) ) ( not ( = ?auto_26537 ?auto_26546 ) ) ( not ( = ?auto_26538 ?auto_26539 ) ) ( not ( = ?auto_26538 ?auto_26540 ) ) ( not ( = ?auto_26538 ?auto_26541 ) ) ( not ( = ?auto_26538 ?auto_26542 ) ) ( not ( = ?auto_26538 ?auto_26543 ) ) ( not ( = ?auto_26538 ?auto_26546 ) ) ( not ( = ?auto_26539 ?auto_26540 ) ) ( not ( = ?auto_26539 ?auto_26541 ) ) ( not ( = ?auto_26539 ?auto_26542 ) ) ( not ( = ?auto_26539 ?auto_26543 ) ) ( not ( = ?auto_26539 ?auto_26546 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26540 ?auto_26541 ?auto_26542 )
      ( MAKE-5CRATE-VERIFY ?auto_26537 ?auto_26538 ?auto_26539 ?auto_26540 ?auto_26541 ?auto_26542 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26552 - SURFACE
      ?auto_26553 - SURFACE
    )
    :vars
    (
      ?auto_26555 - HOIST
      ?auto_26556 - PLACE
      ?auto_26557 - SURFACE
      ?auto_26559 - PLACE
      ?auto_26561 - HOIST
      ?auto_26554 - SURFACE
      ?auto_26563 - PLACE
      ?auto_26560 - HOIST
      ?auto_26558 - SURFACE
      ?auto_26562 - TRUCK
      ?auto_26564 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26555 ?auto_26556 ) ( IS-CRATE ?auto_26553 ) ( not ( = ?auto_26552 ?auto_26553 ) ) ( not ( = ?auto_26557 ?auto_26552 ) ) ( not ( = ?auto_26557 ?auto_26553 ) ) ( not ( = ?auto_26559 ?auto_26556 ) ) ( HOIST-AT ?auto_26561 ?auto_26559 ) ( not ( = ?auto_26555 ?auto_26561 ) ) ( AVAILABLE ?auto_26561 ) ( SURFACE-AT ?auto_26553 ?auto_26559 ) ( ON ?auto_26553 ?auto_26554 ) ( CLEAR ?auto_26553 ) ( not ( = ?auto_26552 ?auto_26554 ) ) ( not ( = ?auto_26553 ?auto_26554 ) ) ( not ( = ?auto_26557 ?auto_26554 ) ) ( IS-CRATE ?auto_26552 ) ( not ( = ?auto_26563 ?auto_26556 ) ) ( not ( = ?auto_26559 ?auto_26563 ) ) ( HOIST-AT ?auto_26560 ?auto_26563 ) ( not ( = ?auto_26555 ?auto_26560 ) ) ( not ( = ?auto_26561 ?auto_26560 ) ) ( AVAILABLE ?auto_26560 ) ( SURFACE-AT ?auto_26552 ?auto_26563 ) ( ON ?auto_26552 ?auto_26558 ) ( CLEAR ?auto_26552 ) ( not ( = ?auto_26552 ?auto_26558 ) ) ( not ( = ?auto_26553 ?auto_26558 ) ) ( not ( = ?auto_26557 ?auto_26558 ) ) ( not ( = ?auto_26554 ?auto_26558 ) ) ( TRUCK-AT ?auto_26562 ?auto_26556 ) ( SURFACE-AT ?auto_26564 ?auto_26556 ) ( CLEAR ?auto_26564 ) ( LIFTING ?auto_26555 ?auto_26557 ) ( IS-CRATE ?auto_26557 ) ( not ( = ?auto_26564 ?auto_26557 ) ) ( not ( = ?auto_26552 ?auto_26564 ) ) ( not ( = ?auto_26553 ?auto_26564 ) ) ( not ( = ?auto_26554 ?auto_26564 ) ) ( not ( = ?auto_26558 ?auto_26564 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26564 ?auto_26557 )
      ( MAKE-2CRATE ?auto_26557 ?auto_26552 ?auto_26553 )
      ( MAKE-1CRATE-VERIFY ?auto_26552 ?auto_26553 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26565 - SURFACE
      ?auto_26566 - SURFACE
      ?auto_26567 - SURFACE
    )
    :vars
    (
      ?auto_26568 - HOIST
      ?auto_26570 - PLACE
      ?auto_26577 - PLACE
      ?auto_26576 - HOIST
      ?auto_26573 - SURFACE
      ?auto_26574 - PLACE
      ?auto_26569 - HOIST
      ?auto_26575 - SURFACE
      ?auto_26571 - TRUCK
      ?auto_26572 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26568 ?auto_26570 ) ( IS-CRATE ?auto_26567 ) ( not ( = ?auto_26566 ?auto_26567 ) ) ( not ( = ?auto_26565 ?auto_26566 ) ) ( not ( = ?auto_26565 ?auto_26567 ) ) ( not ( = ?auto_26577 ?auto_26570 ) ) ( HOIST-AT ?auto_26576 ?auto_26577 ) ( not ( = ?auto_26568 ?auto_26576 ) ) ( AVAILABLE ?auto_26576 ) ( SURFACE-AT ?auto_26567 ?auto_26577 ) ( ON ?auto_26567 ?auto_26573 ) ( CLEAR ?auto_26567 ) ( not ( = ?auto_26566 ?auto_26573 ) ) ( not ( = ?auto_26567 ?auto_26573 ) ) ( not ( = ?auto_26565 ?auto_26573 ) ) ( IS-CRATE ?auto_26566 ) ( not ( = ?auto_26574 ?auto_26570 ) ) ( not ( = ?auto_26577 ?auto_26574 ) ) ( HOIST-AT ?auto_26569 ?auto_26574 ) ( not ( = ?auto_26568 ?auto_26569 ) ) ( not ( = ?auto_26576 ?auto_26569 ) ) ( AVAILABLE ?auto_26569 ) ( SURFACE-AT ?auto_26566 ?auto_26574 ) ( ON ?auto_26566 ?auto_26575 ) ( CLEAR ?auto_26566 ) ( not ( = ?auto_26566 ?auto_26575 ) ) ( not ( = ?auto_26567 ?auto_26575 ) ) ( not ( = ?auto_26565 ?auto_26575 ) ) ( not ( = ?auto_26573 ?auto_26575 ) ) ( TRUCK-AT ?auto_26571 ?auto_26570 ) ( SURFACE-AT ?auto_26572 ?auto_26570 ) ( CLEAR ?auto_26572 ) ( LIFTING ?auto_26568 ?auto_26565 ) ( IS-CRATE ?auto_26565 ) ( not ( = ?auto_26572 ?auto_26565 ) ) ( not ( = ?auto_26566 ?auto_26572 ) ) ( not ( = ?auto_26567 ?auto_26572 ) ) ( not ( = ?auto_26573 ?auto_26572 ) ) ( not ( = ?auto_26575 ?auto_26572 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26566 ?auto_26567 )
      ( MAKE-2CRATE-VERIFY ?auto_26565 ?auto_26566 ?auto_26567 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26578 - SURFACE
      ?auto_26579 - SURFACE
      ?auto_26580 - SURFACE
      ?auto_26581 - SURFACE
    )
    :vars
    (
      ?auto_26586 - HOIST
      ?auto_26582 - PLACE
      ?auto_26583 - PLACE
      ?auto_26589 - HOIST
      ?auto_26584 - SURFACE
      ?auto_26585 - PLACE
      ?auto_26590 - HOIST
      ?auto_26588 - SURFACE
      ?auto_26587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26586 ?auto_26582 ) ( IS-CRATE ?auto_26581 ) ( not ( = ?auto_26580 ?auto_26581 ) ) ( not ( = ?auto_26579 ?auto_26580 ) ) ( not ( = ?auto_26579 ?auto_26581 ) ) ( not ( = ?auto_26583 ?auto_26582 ) ) ( HOIST-AT ?auto_26589 ?auto_26583 ) ( not ( = ?auto_26586 ?auto_26589 ) ) ( AVAILABLE ?auto_26589 ) ( SURFACE-AT ?auto_26581 ?auto_26583 ) ( ON ?auto_26581 ?auto_26584 ) ( CLEAR ?auto_26581 ) ( not ( = ?auto_26580 ?auto_26584 ) ) ( not ( = ?auto_26581 ?auto_26584 ) ) ( not ( = ?auto_26579 ?auto_26584 ) ) ( IS-CRATE ?auto_26580 ) ( not ( = ?auto_26585 ?auto_26582 ) ) ( not ( = ?auto_26583 ?auto_26585 ) ) ( HOIST-AT ?auto_26590 ?auto_26585 ) ( not ( = ?auto_26586 ?auto_26590 ) ) ( not ( = ?auto_26589 ?auto_26590 ) ) ( AVAILABLE ?auto_26590 ) ( SURFACE-AT ?auto_26580 ?auto_26585 ) ( ON ?auto_26580 ?auto_26588 ) ( CLEAR ?auto_26580 ) ( not ( = ?auto_26580 ?auto_26588 ) ) ( not ( = ?auto_26581 ?auto_26588 ) ) ( not ( = ?auto_26579 ?auto_26588 ) ) ( not ( = ?auto_26584 ?auto_26588 ) ) ( TRUCK-AT ?auto_26587 ?auto_26582 ) ( SURFACE-AT ?auto_26578 ?auto_26582 ) ( CLEAR ?auto_26578 ) ( LIFTING ?auto_26586 ?auto_26579 ) ( IS-CRATE ?auto_26579 ) ( not ( = ?auto_26578 ?auto_26579 ) ) ( not ( = ?auto_26580 ?auto_26578 ) ) ( not ( = ?auto_26581 ?auto_26578 ) ) ( not ( = ?auto_26584 ?auto_26578 ) ) ( not ( = ?auto_26588 ?auto_26578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26579 ?auto_26580 ?auto_26581 )
      ( MAKE-3CRATE-VERIFY ?auto_26578 ?auto_26579 ?auto_26580 ?auto_26581 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26591 - SURFACE
      ?auto_26592 - SURFACE
      ?auto_26593 - SURFACE
      ?auto_26594 - SURFACE
      ?auto_26595 - SURFACE
    )
    :vars
    (
      ?auto_26600 - HOIST
      ?auto_26596 - PLACE
      ?auto_26597 - PLACE
      ?auto_26603 - HOIST
      ?auto_26598 - SURFACE
      ?auto_26599 - PLACE
      ?auto_26604 - HOIST
      ?auto_26602 - SURFACE
      ?auto_26601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26600 ?auto_26596 ) ( IS-CRATE ?auto_26595 ) ( not ( = ?auto_26594 ?auto_26595 ) ) ( not ( = ?auto_26593 ?auto_26594 ) ) ( not ( = ?auto_26593 ?auto_26595 ) ) ( not ( = ?auto_26597 ?auto_26596 ) ) ( HOIST-AT ?auto_26603 ?auto_26597 ) ( not ( = ?auto_26600 ?auto_26603 ) ) ( AVAILABLE ?auto_26603 ) ( SURFACE-AT ?auto_26595 ?auto_26597 ) ( ON ?auto_26595 ?auto_26598 ) ( CLEAR ?auto_26595 ) ( not ( = ?auto_26594 ?auto_26598 ) ) ( not ( = ?auto_26595 ?auto_26598 ) ) ( not ( = ?auto_26593 ?auto_26598 ) ) ( IS-CRATE ?auto_26594 ) ( not ( = ?auto_26599 ?auto_26596 ) ) ( not ( = ?auto_26597 ?auto_26599 ) ) ( HOIST-AT ?auto_26604 ?auto_26599 ) ( not ( = ?auto_26600 ?auto_26604 ) ) ( not ( = ?auto_26603 ?auto_26604 ) ) ( AVAILABLE ?auto_26604 ) ( SURFACE-AT ?auto_26594 ?auto_26599 ) ( ON ?auto_26594 ?auto_26602 ) ( CLEAR ?auto_26594 ) ( not ( = ?auto_26594 ?auto_26602 ) ) ( not ( = ?auto_26595 ?auto_26602 ) ) ( not ( = ?auto_26593 ?auto_26602 ) ) ( not ( = ?auto_26598 ?auto_26602 ) ) ( TRUCK-AT ?auto_26601 ?auto_26596 ) ( SURFACE-AT ?auto_26592 ?auto_26596 ) ( CLEAR ?auto_26592 ) ( LIFTING ?auto_26600 ?auto_26593 ) ( IS-CRATE ?auto_26593 ) ( not ( = ?auto_26592 ?auto_26593 ) ) ( not ( = ?auto_26594 ?auto_26592 ) ) ( not ( = ?auto_26595 ?auto_26592 ) ) ( not ( = ?auto_26598 ?auto_26592 ) ) ( not ( = ?auto_26602 ?auto_26592 ) ) ( ON ?auto_26592 ?auto_26591 ) ( not ( = ?auto_26591 ?auto_26592 ) ) ( not ( = ?auto_26591 ?auto_26593 ) ) ( not ( = ?auto_26591 ?auto_26594 ) ) ( not ( = ?auto_26591 ?auto_26595 ) ) ( not ( = ?auto_26591 ?auto_26598 ) ) ( not ( = ?auto_26591 ?auto_26602 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26593 ?auto_26594 ?auto_26595 )
      ( MAKE-4CRATE-VERIFY ?auto_26591 ?auto_26592 ?auto_26593 ?auto_26594 ?auto_26595 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26605 - SURFACE
      ?auto_26606 - SURFACE
      ?auto_26607 - SURFACE
      ?auto_26608 - SURFACE
      ?auto_26609 - SURFACE
      ?auto_26610 - SURFACE
    )
    :vars
    (
      ?auto_26615 - HOIST
      ?auto_26611 - PLACE
      ?auto_26612 - PLACE
      ?auto_26618 - HOIST
      ?auto_26613 - SURFACE
      ?auto_26614 - PLACE
      ?auto_26619 - HOIST
      ?auto_26617 - SURFACE
      ?auto_26616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26615 ?auto_26611 ) ( IS-CRATE ?auto_26610 ) ( not ( = ?auto_26609 ?auto_26610 ) ) ( not ( = ?auto_26608 ?auto_26609 ) ) ( not ( = ?auto_26608 ?auto_26610 ) ) ( not ( = ?auto_26612 ?auto_26611 ) ) ( HOIST-AT ?auto_26618 ?auto_26612 ) ( not ( = ?auto_26615 ?auto_26618 ) ) ( AVAILABLE ?auto_26618 ) ( SURFACE-AT ?auto_26610 ?auto_26612 ) ( ON ?auto_26610 ?auto_26613 ) ( CLEAR ?auto_26610 ) ( not ( = ?auto_26609 ?auto_26613 ) ) ( not ( = ?auto_26610 ?auto_26613 ) ) ( not ( = ?auto_26608 ?auto_26613 ) ) ( IS-CRATE ?auto_26609 ) ( not ( = ?auto_26614 ?auto_26611 ) ) ( not ( = ?auto_26612 ?auto_26614 ) ) ( HOIST-AT ?auto_26619 ?auto_26614 ) ( not ( = ?auto_26615 ?auto_26619 ) ) ( not ( = ?auto_26618 ?auto_26619 ) ) ( AVAILABLE ?auto_26619 ) ( SURFACE-AT ?auto_26609 ?auto_26614 ) ( ON ?auto_26609 ?auto_26617 ) ( CLEAR ?auto_26609 ) ( not ( = ?auto_26609 ?auto_26617 ) ) ( not ( = ?auto_26610 ?auto_26617 ) ) ( not ( = ?auto_26608 ?auto_26617 ) ) ( not ( = ?auto_26613 ?auto_26617 ) ) ( TRUCK-AT ?auto_26616 ?auto_26611 ) ( SURFACE-AT ?auto_26607 ?auto_26611 ) ( CLEAR ?auto_26607 ) ( LIFTING ?auto_26615 ?auto_26608 ) ( IS-CRATE ?auto_26608 ) ( not ( = ?auto_26607 ?auto_26608 ) ) ( not ( = ?auto_26609 ?auto_26607 ) ) ( not ( = ?auto_26610 ?auto_26607 ) ) ( not ( = ?auto_26613 ?auto_26607 ) ) ( not ( = ?auto_26617 ?auto_26607 ) ) ( ON ?auto_26606 ?auto_26605 ) ( ON ?auto_26607 ?auto_26606 ) ( not ( = ?auto_26605 ?auto_26606 ) ) ( not ( = ?auto_26605 ?auto_26607 ) ) ( not ( = ?auto_26605 ?auto_26608 ) ) ( not ( = ?auto_26605 ?auto_26609 ) ) ( not ( = ?auto_26605 ?auto_26610 ) ) ( not ( = ?auto_26605 ?auto_26613 ) ) ( not ( = ?auto_26605 ?auto_26617 ) ) ( not ( = ?auto_26606 ?auto_26607 ) ) ( not ( = ?auto_26606 ?auto_26608 ) ) ( not ( = ?auto_26606 ?auto_26609 ) ) ( not ( = ?auto_26606 ?auto_26610 ) ) ( not ( = ?auto_26606 ?auto_26613 ) ) ( not ( = ?auto_26606 ?auto_26617 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26608 ?auto_26609 ?auto_26610 )
      ( MAKE-5CRATE-VERIFY ?auto_26605 ?auto_26606 ?auto_26607 ?auto_26608 ?auto_26609 ?auto_26610 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26620 - SURFACE
      ?auto_26621 - SURFACE
    )
    :vars
    (
      ?auto_26628 - HOIST
      ?auto_26623 - PLACE
      ?auto_26622 - SURFACE
      ?auto_26624 - PLACE
      ?auto_26631 - HOIST
      ?auto_26625 - SURFACE
      ?auto_26626 - PLACE
      ?auto_26632 - HOIST
      ?auto_26630 - SURFACE
      ?auto_26629 - TRUCK
      ?auto_26627 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26628 ?auto_26623 ) ( IS-CRATE ?auto_26621 ) ( not ( = ?auto_26620 ?auto_26621 ) ) ( not ( = ?auto_26622 ?auto_26620 ) ) ( not ( = ?auto_26622 ?auto_26621 ) ) ( not ( = ?auto_26624 ?auto_26623 ) ) ( HOIST-AT ?auto_26631 ?auto_26624 ) ( not ( = ?auto_26628 ?auto_26631 ) ) ( AVAILABLE ?auto_26631 ) ( SURFACE-AT ?auto_26621 ?auto_26624 ) ( ON ?auto_26621 ?auto_26625 ) ( CLEAR ?auto_26621 ) ( not ( = ?auto_26620 ?auto_26625 ) ) ( not ( = ?auto_26621 ?auto_26625 ) ) ( not ( = ?auto_26622 ?auto_26625 ) ) ( IS-CRATE ?auto_26620 ) ( not ( = ?auto_26626 ?auto_26623 ) ) ( not ( = ?auto_26624 ?auto_26626 ) ) ( HOIST-AT ?auto_26632 ?auto_26626 ) ( not ( = ?auto_26628 ?auto_26632 ) ) ( not ( = ?auto_26631 ?auto_26632 ) ) ( AVAILABLE ?auto_26632 ) ( SURFACE-AT ?auto_26620 ?auto_26626 ) ( ON ?auto_26620 ?auto_26630 ) ( CLEAR ?auto_26620 ) ( not ( = ?auto_26620 ?auto_26630 ) ) ( not ( = ?auto_26621 ?auto_26630 ) ) ( not ( = ?auto_26622 ?auto_26630 ) ) ( not ( = ?auto_26625 ?auto_26630 ) ) ( TRUCK-AT ?auto_26629 ?auto_26623 ) ( SURFACE-AT ?auto_26627 ?auto_26623 ) ( CLEAR ?auto_26627 ) ( IS-CRATE ?auto_26622 ) ( not ( = ?auto_26627 ?auto_26622 ) ) ( not ( = ?auto_26620 ?auto_26627 ) ) ( not ( = ?auto_26621 ?auto_26627 ) ) ( not ( = ?auto_26625 ?auto_26627 ) ) ( not ( = ?auto_26630 ?auto_26627 ) ) ( AVAILABLE ?auto_26628 ) ( IN ?auto_26622 ?auto_26629 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26628 ?auto_26622 ?auto_26629 ?auto_26623 )
      ( MAKE-2CRATE ?auto_26622 ?auto_26620 ?auto_26621 )
      ( MAKE-1CRATE-VERIFY ?auto_26620 ?auto_26621 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26633 - SURFACE
      ?auto_26634 - SURFACE
      ?auto_26635 - SURFACE
    )
    :vars
    (
      ?auto_26644 - HOIST
      ?auto_26642 - PLACE
      ?auto_26643 - PLACE
      ?auto_26637 - HOIST
      ?auto_26638 - SURFACE
      ?auto_26641 - PLACE
      ?auto_26636 - HOIST
      ?auto_26645 - SURFACE
      ?auto_26639 - TRUCK
      ?auto_26640 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26644 ?auto_26642 ) ( IS-CRATE ?auto_26635 ) ( not ( = ?auto_26634 ?auto_26635 ) ) ( not ( = ?auto_26633 ?auto_26634 ) ) ( not ( = ?auto_26633 ?auto_26635 ) ) ( not ( = ?auto_26643 ?auto_26642 ) ) ( HOIST-AT ?auto_26637 ?auto_26643 ) ( not ( = ?auto_26644 ?auto_26637 ) ) ( AVAILABLE ?auto_26637 ) ( SURFACE-AT ?auto_26635 ?auto_26643 ) ( ON ?auto_26635 ?auto_26638 ) ( CLEAR ?auto_26635 ) ( not ( = ?auto_26634 ?auto_26638 ) ) ( not ( = ?auto_26635 ?auto_26638 ) ) ( not ( = ?auto_26633 ?auto_26638 ) ) ( IS-CRATE ?auto_26634 ) ( not ( = ?auto_26641 ?auto_26642 ) ) ( not ( = ?auto_26643 ?auto_26641 ) ) ( HOIST-AT ?auto_26636 ?auto_26641 ) ( not ( = ?auto_26644 ?auto_26636 ) ) ( not ( = ?auto_26637 ?auto_26636 ) ) ( AVAILABLE ?auto_26636 ) ( SURFACE-AT ?auto_26634 ?auto_26641 ) ( ON ?auto_26634 ?auto_26645 ) ( CLEAR ?auto_26634 ) ( not ( = ?auto_26634 ?auto_26645 ) ) ( not ( = ?auto_26635 ?auto_26645 ) ) ( not ( = ?auto_26633 ?auto_26645 ) ) ( not ( = ?auto_26638 ?auto_26645 ) ) ( TRUCK-AT ?auto_26639 ?auto_26642 ) ( SURFACE-AT ?auto_26640 ?auto_26642 ) ( CLEAR ?auto_26640 ) ( IS-CRATE ?auto_26633 ) ( not ( = ?auto_26640 ?auto_26633 ) ) ( not ( = ?auto_26634 ?auto_26640 ) ) ( not ( = ?auto_26635 ?auto_26640 ) ) ( not ( = ?auto_26638 ?auto_26640 ) ) ( not ( = ?auto_26645 ?auto_26640 ) ) ( AVAILABLE ?auto_26644 ) ( IN ?auto_26633 ?auto_26639 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26634 ?auto_26635 )
      ( MAKE-2CRATE-VERIFY ?auto_26633 ?auto_26634 ?auto_26635 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26646 - SURFACE
      ?auto_26647 - SURFACE
      ?auto_26648 - SURFACE
      ?auto_26649 - SURFACE
    )
    :vars
    (
      ?auto_26651 - HOIST
      ?auto_26650 - PLACE
      ?auto_26654 - PLACE
      ?auto_26652 - HOIST
      ?auto_26657 - SURFACE
      ?auto_26653 - PLACE
      ?auto_26655 - HOIST
      ?auto_26656 - SURFACE
      ?auto_26658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26651 ?auto_26650 ) ( IS-CRATE ?auto_26649 ) ( not ( = ?auto_26648 ?auto_26649 ) ) ( not ( = ?auto_26647 ?auto_26648 ) ) ( not ( = ?auto_26647 ?auto_26649 ) ) ( not ( = ?auto_26654 ?auto_26650 ) ) ( HOIST-AT ?auto_26652 ?auto_26654 ) ( not ( = ?auto_26651 ?auto_26652 ) ) ( AVAILABLE ?auto_26652 ) ( SURFACE-AT ?auto_26649 ?auto_26654 ) ( ON ?auto_26649 ?auto_26657 ) ( CLEAR ?auto_26649 ) ( not ( = ?auto_26648 ?auto_26657 ) ) ( not ( = ?auto_26649 ?auto_26657 ) ) ( not ( = ?auto_26647 ?auto_26657 ) ) ( IS-CRATE ?auto_26648 ) ( not ( = ?auto_26653 ?auto_26650 ) ) ( not ( = ?auto_26654 ?auto_26653 ) ) ( HOIST-AT ?auto_26655 ?auto_26653 ) ( not ( = ?auto_26651 ?auto_26655 ) ) ( not ( = ?auto_26652 ?auto_26655 ) ) ( AVAILABLE ?auto_26655 ) ( SURFACE-AT ?auto_26648 ?auto_26653 ) ( ON ?auto_26648 ?auto_26656 ) ( CLEAR ?auto_26648 ) ( not ( = ?auto_26648 ?auto_26656 ) ) ( not ( = ?auto_26649 ?auto_26656 ) ) ( not ( = ?auto_26647 ?auto_26656 ) ) ( not ( = ?auto_26657 ?auto_26656 ) ) ( TRUCK-AT ?auto_26658 ?auto_26650 ) ( SURFACE-AT ?auto_26646 ?auto_26650 ) ( CLEAR ?auto_26646 ) ( IS-CRATE ?auto_26647 ) ( not ( = ?auto_26646 ?auto_26647 ) ) ( not ( = ?auto_26648 ?auto_26646 ) ) ( not ( = ?auto_26649 ?auto_26646 ) ) ( not ( = ?auto_26657 ?auto_26646 ) ) ( not ( = ?auto_26656 ?auto_26646 ) ) ( AVAILABLE ?auto_26651 ) ( IN ?auto_26647 ?auto_26658 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26647 ?auto_26648 ?auto_26649 )
      ( MAKE-3CRATE-VERIFY ?auto_26646 ?auto_26647 ?auto_26648 ?auto_26649 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26659 - SURFACE
      ?auto_26660 - SURFACE
      ?auto_26661 - SURFACE
      ?auto_26662 - SURFACE
      ?auto_26663 - SURFACE
    )
    :vars
    (
      ?auto_26665 - HOIST
      ?auto_26664 - PLACE
      ?auto_26668 - PLACE
      ?auto_26666 - HOIST
      ?auto_26671 - SURFACE
      ?auto_26667 - PLACE
      ?auto_26669 - HOIST
      ?auto_26670 - SURFACE
      ?auto_26672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26665 ?auto_26664 ) ( IS-CRATE ?auto_26663 ) ( not ( = ?auto_26662 ?auto_26663 ) ) ( not ( = ?auto_26661 ?auto_26662 ) ) ( not ( = ?auto_26661 ?auto_26663 ) ) ( not ( = ?auto_26668 ?auto_26664 ) ) ( HOIST-AT ?auto_26666 ?auto_26668 ) ( not ( = ?auto_26665 ?auto_26666 ) ) ( AVAILABLE ?auto_26666 ) ( SURFACE-AT ?auto_26663 ?auto_26668 ) ( ON ?auto_26663 ?auto_26671 ) ( CLEAR ?auto_26663 ) ( not ( = ?auto_26662 ?auto_26671 ) ) ( not ( = ?auto_26663 ?auto_26671 ) ) ( not ( = ?auto_26661 ?auto_26671 ) ) ( IS-CRATE ?auto_26662 ) ( not ( = ?auto_26667 ?auto_26664 ) ) ( not ( = ?auto_26668 ?auto_26667 ) ) ( HOIST-AT ?auto_26669 ?auto_26667 ) ( not ( = ?auto_26665 ?auto_26669 ) ) ( not ( = ?auto_26666 ?auto_26669 ) ) ( AVAILABLE ?auto_26669 ) ( SURFACE-AT ?auto_26662 ?auto_26667 ) ( ON ?auto_26662 ?auto_26670 ) ( CLEAR ?auto_26662 ) ( not ( = ?auto_26662 ?auto_26670 ) ) ( not ( = ?auto_26663 ?auto_26670 ) ) ( not ( = ?auto_26661 ?auto_26670 ) ) ( not ( = ?auto_26671 ?auto_26670 ) ) ( TRUCK-AT ?auto_26672 ?auto_26664 ) ( SURFACE-AT ?auto_26660 ?auto_26664 ) ( CLEAR ?auto_26660 ) ( IS-CRATE ?auto_26661 ) ( not ( = ?auto_26660 ?auto_26661 ) ) ( not ( = ?auto_26662 ?auto_26660 ) ) ( not ( = ?auto_26663 ?auto_26660 ) ) ( not ( = ?auto_26671 ?auto_26660 ) ) ( not ( = ?auto_26670 ?auto_26660 ) ) ( AVAILABLE ?auto_26665 ) ( IN ?auto_26661 ?auto_26672 ) ( ON ?auto_26660 ?auto_26659 ) ( not ( = ?auto_26659 ?auto_26660 ) ) ( not ( = ?auto_26659 ?auto_26661 ) ) ( not ( = ?auto_26659 ?auto_26662 ) ) ( not ( = ?auto_26659 ?auto_26663 ) ) ( not ( = ?auto_26659 ?auto_26671 ) ) ( not ( = ?auto_26659 ?auto_26670 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26661 ?auto_26662 ?auto_26663 )
      ( MAKE-4CRATE-VERIFY ?auto_26659 ?auto_26660 ?auto_26661 ?auto_26662 ?auto_26663 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26673 - SURFACE
      ?auto_26674 - SURFACE
      ?auto_26675 - SURFACE
      ?auto_26676 - SURFACE
      ?auto_26677 - SURFACE
      ?auto_26678 - SURFACE
    )
    :vars
    (
      ?auto_26680 - HOIST
      ?auto_26679 - PLACE
      ?auto_26683 - PLACE
      ?auto_26681 - HOIST
      ?auto_26686 - SURFACE
      ?auto_26682 - PLACE
      ?auto_26684 - HOIST
      ?auto_26685 - SURFACE
      ?auto_26687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26680 ?auto_26679 ) ( IS-CRATE ?auto_26678 ) ( not ( = ?auto_26677 ?auto_26678 ) ) ( not ( = ?auto_26676 ?auto_26677 ) ) ( not ( = ?auto_26676 ?auto_26678 ) ) ( not ( = ?auto_26683 ?auto_26679 ) ) ( HOIST-AT ?auto_26681 ?auto_26683 ) ( not ( = ?auto_26680 ?auto_26681 ) ) ( AVAILABLE ?auto_26681 ) ( SURFACE-AT ?auto_26678 ?auto_26683 ) ( ON ?auto_26678 ?auto_26686 ) ( CLEAR ?auto_26678 ) ( not ( = ?auto_26677 ?auto_26686 ) ) ( not ( = ?auto_26678 ?auto_26686 ) ) ( not ( = ?auto_26676 ?auto_26686 ) ) ( IS-CRATE ?auto_26677 ) ( not ( = ?auto_26682 ?auto_26679 ) ) ( not ( = ?auto_26683 ?auto_26682 ) ) ( HOIST-AT ?auto_26684 ?auto_26682 ) ( not ( = ?auto_26680 ?auto_26684 ) ) ( not ( = ?auto_26681 ?auto_26684 ) ) ( AVAILABLE ?auto_26684 ) ( SURFACE-AT ?auto_26677 ?auto_26682 ) ( ON ?auto_26677 ?auto_26685 ) ( CLEAR ?auto_26677 ) ( not ( = ?auto_26677 ?auto_26685 ) ) ( not ( = ?auto_26678 ?auto_26685 ) ) ( not ( = ?auto_26676 ?auto_26685 ) ) ( not ( = ?auto_26686 ?auto_26685 ) ) ( TRUCK-AT ?auto_26687 ?auto_26679 ) ( SURFACE-AT ?auto_26675 ?auto_26679 ) ( CLEAR ?auto_26675 ) ( IS-CRATE ?auto_26676 ) ( not ( = ?auto_26675 ?auto_26676 ) ) ( not ( = ?auto_26677 ?auto_26675 ) ) ( not ( = ?auto_26678 ?auto_26675 ) ) ( not ( = ?auto_26686 ?auto_26675 ) ) ( not ( = ?auto_26685 ?auto_26675 ) ) ( AVAILABLE ?auto_26680 ) ( IN ?auto_26676 ?auto_26687 ) ( ON ?auto_26674 ?auto_26673 ) ( ON ?auto_26675 ?auto_26674 ) ( not ( = ?auto_26673 ?auto_26674 ) ) ( not ( = ?auto_26673 ?auto_26675 ) ) ( not ( = ?auto_26673 ?auto_26676 ) ) ( not ( = ?auto_26673 ?auto_26677 ) ) ( not ( = ?auto_26673 ?auto_26678 ) ) ( not ( = ?auto_26673 ?auto_26686 ) ) ( not ( = ?auto_26673 ?auto_26685 ) ) ( not ( = ?auto_26674 ?auto_26675 ) ) ( not ( = ?auto_26674 ?auto_26676 ) ) ( not ( = ?auto_26674 ?auto_26677 ) ) ( not ( = ?auto_26674 ?auto_26678 ) ) ( not ( = ?auto_26674 ?auto_26686 ) ) ( not ( = ?auto_26674 ?auto_26685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26676 ?auto_26677 ?auto_26678 )
      ( MAKE-5CRATE-VERIFY ?auto_26673 ?auto_26674 ?auto_26675 ?auto_26676 ?auto_26677 ?auto_26678 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26688 - SURFACE
      ?auto_26689 - SURFACE
    )
    :vars
    (
      ?auto_26691 - HOIST
      ?auto_26690 - PLACE
      ?auto_26692 - SURFACE
      ?auto_26696 - PLACE
      ?auto_26694 - HOIST
      ?auto_26699 - SURFACE
      ?auto_26695 - PLACE
      ?auto_26697 - HOIST
      ?auto_26698 - SURFACE
      ?auto_26693 - SURFACE
      ?auto_26700 - TRUCK
      ?auto_26701 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26691 ?auto_26690 ) ( IS-CRATE ?auto_26689 ) ( not ( = ?auto_26688 ?auto_26689 ) ) ( not ( = ?auto_26692 ?auto_26688 ) ) ( not ( = ?auto_26692 ?auto_26689 ) ) ( not ( = ?auto_26696 ?auto_26690 ) ) ( HOIST-AT ?auto_26694 ?auto_26696 ) ( not ( = ?auto_26691 ?auto_26694 ) ) ( AVAILABLE ?auto_26694 ) ( SURFACE-AT ?auto_26689 ?auto_26696 ) ( ON ?auto_26689 ?auto_26699 ) ( CLEAR ?auto_26689 ) ( not ( = ?auto_26688 ?auto_26699 ) ) ( not ( = ?auto_26689 ?auto_26699 ) ) ( not ( = ?auto_26692 ?auto_26699 ) ) ( IS-CRATE ?auto_26688 ) ( not ( = ?auto_26695 ?auto_26690 ) ) ( not ( = ?auto_26696 ?auto_26695 ) ) ( HOIST-AT ?auto_26697 ?auto_26695 ) ( not ( = ?auto_26691 ?auto_26697 ) ) ( not ( = ?auto_26694 ?auto_26697 ) ) ( AVAILABLE ?auto_26697 ) ( SURFACE-AT ?auto_26688 ?auto_26695 ) ( ON ?auto_26688 ?auto_26698 ) ( CLEAR ?auto_26688 ) ( not ( = ?auto_26688 ?auto_26698 ) ) ( not ( = ?auto_26689 ?auto_26698 ) ) ( not ( = ?auto_26692 ?auto_26698 ) ) ( not ( = ?auto_26699 ?auto_26698 ) ) ( SURFACE-AT ?auto_26693 ?auto_26690 ) ( CLEAR ?auto_26693 ) ( IS-CRATE ?auto_26692 ) ( not ( = ?auto_26693 ?auto_26692 ) ) ( not ( = ?auto_26688 ?auto_26693 ) ) ( not ( = ?auto_26689 ?auto_26693 ) ) ( not ( = ?auto_26699 ?auto_26693 ) ) ( not ( = ?auto_26698 ?auto_26693 ) ) ( AVAILABLE ?auto_26691 ) ( IN ?auto_26692 ?auto_26700 ) ( TRUCK-AT ?auto_26700 ?auto_26701 ) ( not ( = ?auto_26701 ?auto_26690 ) ) ( not ( = ?auto_26696 ?auto_26701 ) ) ( not ( = ?auto_26695 ?auto_26701 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26700 ?auto_26701 ?auto_26690 )
      ( MAKE-2CRATE ?auto_26692 ?auto_26688 ?auto_26689 )
      ( MAKE-1CRATE-VERIFY ?auto_26688 ?auto_26689 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26702 - SURFACE
      ?auto_26703 - SURFACE
      ?auto_26704 - SURFACE
    )
    :vars
    (
      ?auto_26715 - HOIST
      ?auto_26706 - PLACE
      ?auto_26708 - PLACE
      ?auto_26714 - HOIST
      ?auto_26709 - SURFACE
      ?auto_26713 - PLACE
      ?auto_26710 - HOIST
      ?auto_26712 - SURFACE
      ?auto_26705 - SURFACE
      ?auto_26707 - TRUCK
      ?auto_26711 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26715 ?auto_26706 ) ( IS-CRATE ?auto_26704 ) ( not ( = ?auto_26703 ?auto_26704 ) ) ( not ( = ?auto_26702 ?auto_26703 ) ) ( not ( = ?auto_26702 ?auto_26704 ) ) ( not ( = ?auto_26708 ?auto_26706 ) ) ( HOIST-AT ?auto_26714 ?auto_26708 ) ( not ( = ?auto_26715 ?auto_26714 ) ) ( AVAILABLE ?auto_26714 ) ( SURFACE-AT ?auto_26704 ?auto_26708 ) ( ON ?auto_26704 ?auto_26709 ) ( CLEAR ?auto_26704 ) ( not ( = ?auto_26703 ?auto_26709 ) ) ( not ( = ?auto_26704 ?auto_26709 ) ) ( not ( = ?auto_26702 ?auto_26709 ) ) ( IS-CRATE ?auto_26703 ) ( not ( = ?auto_26713 ?auto_26706 ) ) ( not ( = ?auto_26708 ?auto_26713 ) ) ( HOIST-AT ?auto_26710 ?auto_26713 ) ( not ( = ?auto_26715 ?auto_26710 ) ) ( not ( = ?auto_26714 ?auto_26710 ) ) ( AVAILABLE ?auto_26710 ) ( SURFACE-AT ?auto_26703 ?auto_26713 ) ( ON ?auto_26703 ?auto_26712 ) ( CLEAR ?auto_26703 ) ( not ( = ?auto_26703 ?auto_26712 ) ) ( not ( = ?auto_26704 ?auto_26712 ) ) ( not ( = ?auto_26702 ?auto_26712 ) ) ( not ( = ?auto_26709 ?auto_26712 ) ) ( SURFACE-AT ?auto_26705 ?auto_26706 ) ( CLEAR ?auto_26705 ) ( IS-CRATE ?auto_26702 ) ( not ( = ?auto_26705 ?auto_26702 ) ) ( not ( = ?auto_26703 ?auto_26705 ) ) ( not ( = ?auto_26704 ?auto_26705 ) ) ( not ( = ?auto_26709 ?auto_26705 ) ) ( not ( = ?auto_26712 ?auto_26705 ) ) ( AVAILABLE ?auto_26715 ) ( IN ?auto_26702 ?auto_26707 ) ( TRUCK-AT ?auto_26707 ?auto_26711 ) ( not ( = ?auto_26711 ?auto_26706 ) ) ( not ( = ?auto_26708 ?auto_26711 ) ) ( not ( = ?auto_26713 ?auto_26711 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26703 ?auto_26704 )
      ( MAKE-2CRATE-VERIFY ?auto_26702 ?auto_26703 ?auto_26704 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26716 - SURFACE
      ?auto_26717 - SURFACE
      ?auto_26718 - SURFACE
      ?auto_26719 - SURFACE
    )
    :vars
    (
      ?auto_26729 - HOIST
      ?auto_26726 - PLACE
      ?auto_26724 - PLACE
      ?auto_26723 - HOIST
      ?auto_26727 - SURFACE
      ?auto_26725 - PLACE
      ?auto_26721 - HOIST
      ?auto_26728 - SURFACE
      ?auto_26722 - TRUCK
      ?auto_26720 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26729 ?auto_26726 ) ( IS-CRATE ?auto_26719 ) ( not ( = ?auto_26718 ?auto_26719 ) ) ( not ( = ?auto_26717 ?auto_26718 ) ) ( not ( = ?auto_26717 ?auto_26719 ) ) ( not ( = ?auto_26724 ?auto_26726 ) ) ( HOIST-AT ?auto_26723 ?auto_26724 ) ( not ( = ?auto_26729 ?auto_26723 ) ) ( AVAILABLE ?auto_26723 ) ( SURFACE-AT ?auto_26719 ?auto_26724 ) ( ON ?auto_26719 ?auto_26727 ) ( CLEAR ?auto_26719 ) ( not ( = ?auto_26718 ?auto_26727 ) ) ( not ( = ?auto_26719 ?auto_26727 ) ) ( not ( = ?auto_26717 ?auto_26727 ) ) ( IS-CRATE ?auto_26718 ) ( not ( = ?auto_26725 ?auto_26726 ) ) ( not ( = ?auto_26724 ?auto_26725 ) ) ( HOIST-AT ?auto_26721 ?auto_26725 ) ( not ( = ?auto_26729 ?auto_26721 ) ) ( not ( = ?auto_26723 ?auto_26721 ) ) ( AVAILABLE ?auto_26721 ) ( SURFACE-AT ?auto_26718 ?auto_26725 ) ( ON ?auto_26718 ?auto_26728 ) ( CLEAR ?auto_26718 ) ( not ( = ?auto_26718 ?auto_26728 ) ) ( not ( = ?auto_26719 ?auto_26728 ) ) ( not ( = ?auto_26717 ?auto_26728 ) ) ( not ( = ?auto_26727 ?auto_26728 ) ) ( SURFACE-AT ?auto_26716 ?auto_26726 ) ( CLEAR ?auto_26716 ) ( IS-CRATE ?auto_26717 ) ( not ( = ?auto_26716 ?auto_26717 ) ) ( not ( = ?auto_26718 ?auto_26716 ) ) ( not ( = ?auto_26719 ?auto_26716 ) ) ( not ( = ?auto_26727 ?auto_26716 ) ) ( not ( = ?auto_26728 ?auto_26716 ) ) ( AVAILABLE ?auto_26729 ) ( IN ?auto_26717 ?auto_26722 ) ( TRUCK-AT ?auto_26722 ?auto_26720 ) ( not ( = ?auto_26720 ?auto_26726 ) ) ( not ( = ?auto_26724 ?auto_26720 ) ) ( not ( = ?auto_26725 ?auto_26720 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26717 ?auto_26718 ?auto_26719 )
      ( MAKE-3CRATE-VERIFY ?auto_26716 ?auto_26717 ?auto_26718 ?auto_26719 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26730 - SURFACE
      ?auto_26731 - SURFACE
      ?auto_26732 - SURFACE
      ?auto_26733 - SURFACE
      ?auto_26734 - SURFACE
    )
    :vars
    (
      ?auto_26744 - HOIST
      ?auto_26741 - PLACE
      ?auto_26739 - PLACE
      ?auto_26738 - HOIST
      ?auto_26742 - SURFACE
      ?auto_26740 - PLACE
      ?auto_26736 - HOIST
      ?auto_26743 - SURFACE
      ?auto_26737 - TRUCK
      ?auto_26735 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26744 ?auto_26741 ) ( IS-CRATE ?auto_26734 ) ( not ( = ?auto_26733 ?auto_26734 ) ) ( not ( = ?auto_26732 ?auto_26733 ) ) ( not ( = ?auto_26732 ?auto_26734 ) ) ( not ( = ?auto_26739 ?auto_26741 ) ) ( HOIST-AT ?auto_26738 ?auto_26739 ) ( not ( = ?auto_26744 ?auto_26738 ) ) ( AVAILABLE ?auto_26738 ) ( SURFACE-AT ?auto_26734 ?auto_26739 ) ( ON ?auto_26734 ?auto_26742 ) ( CLEAR ?auto_26734 ) ( not ( = ?auto_26733 ?auto_26742 ) ) ( not ( = ?auto_26734 ?auto_26742 ) ) ( not ( = ?auto_26732 ?auto_26742 ) ) ( IS-CRATE ?auto_26733 ) ( not ( = ?auto_26740 ?auto_26741 ) ) ( not ( = ?auto_26739 ?auto_26740 ) ) ( HOIST-AT ?auto_26736 ?auto_26740 ) ( not ( = ?auto_26744 ?auto_26736 ) ) ( not ( = ?auto_26738 ?auto_26736 ) ) ( AVAILABLE ?auto_26736 ) ( SURFACE-AT ?auto_26733 ?auto_26740 ) ( ON ?auto_26733 ?auto_26743 ) ( CLEAR ?auto_26733 ) ( not ( = ?auto_26733 ?auto_26743 ) ) ( not ( = ?auto_26734 ?auto_26743 ) ) ( not ( = ?auto_26732 ?auto_26743 ) ) ( not ( = ?auto_26742 ?auto_26743 ) ) ( SURFACE-AT ?auto_26731 ?auto_26741 ) ( CLEAR ?auto_26731 ) ( IS-CRATE ?auto_26732 ) ( not ( = ?auto_26731 ?auto_26732 ) ) ( not ( = ?auto_26733 ?auto_26731 ) ) ( not ( = ?auto_26734 ?auto_26731 ) ) ( not ( = ?auto_26742 ?auto_26731 ) ) ( not ( = ?auto_26743 ?auto_26731 ) ) ( AVAILABLE ?auto_26744 ) ( IN ?auto_26732 ?auto_26737 ) ( TRUCK-AT ?auto_26737 ?auto_26735 ) ( not ( = ?auto_26735 ?auto_26741 ) ) ( not ( = ?auto_26739 ?auto_26735 ) ) ( not ( = ?auto_26740 ?auto_26735 ) ) ( ON ?auto_26731 ?auto_26730 ) ( not ( = ?auto_26730 ?auto_26731 ) ) ( not ( = ?auto_26730 ?auto_26732 ) ) ( not ( = ?auto_26730 ?auto_26733 ) ) ( not ( = ?auto_26730 ?auto_26734 ) ) ( not ( = ?auto_26730 ?auto_26742 ) ) ( not ( = ?auto_26730 ?auto_26743 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26732 ?auto_26733 ?auto_26734 )
      ( MAKE-4CRATE-VERIFY ?auto_26730 ?auto_26731 ?auto_26732 ?auto_26733 ?auto_26734 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26745 - SURFACE
      ?auto_26746 - SURFACE
      ?auto_26747 - SURFACE
      ?auto_26748 - SURFACE
      ?auto_26749 - SURFACE
      ?auto_26750 - SURFACE
    )
    :vars
    (
      ?auto_26760 - HOIST
      ?auto_26757 - PLACE
      ?auto_26755 - PLACE
      ?auto_26754 - HOIST
      ?auto_26758 - SURFACE
      ?auto_26756 - PLACE
      ?auto_26752 - HOIST
      ?auto_26759 - SURFACE
      ?auto_26753 - TRUCK
      ?auto_26751 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26760 ?auto_26757 ) ( IS-CRATE ?auto_26750 ) ( not ( = ?auto_26749 ?auto_26750 ) ) ( not ( = ?auto_26748 ?auto_26749 ) ) ( not ( = ?auto_26748 ?auto_26750 ) ) ( not ( = ?auto_26755 ?auto_26757 ) ) ( HOIST-AT ?auto_26754 ?auto_26755 ) ( not ( = ?auto_26760 ?auto_26754 ) ) ( AVAILABLE ?auto_26754 ) ( SURFACE-AT ?auto_26750 ?auto_26755 ) ( ON ?auto_26750 ?auto_26758 ) ( CLEAR ?auto_26750 ) ( not ( = ?auto_26749 ?auto_26758 ) ) ( not ( = ?auto_26750 ?auto_26758 ) ) ( not ( = ?auto_26748 ?auto_26758 ) ) ( IS-CRATE ?auto_26749 ) ( not ( = ?auto_26756 ?auto_26757 ) ) ( not ( = ?auto_26755 ?auto_26756 ) ) ( HOIST-AT ?auto_26752 ?auto_26756 ) ( not ( = ?auto_26760 ?auto_26752 ) ) ( not ( = ?auto_26754 ?auto_26752 ) ) ( AVAILABLE ?auto_26752 ) ( SURFACE-AT ?auto_26749 ?auto_26756 ) ( ON ?auto_26749 ?auto_26759 ) ( CLEAR ?auto_26749 ) ( not ( = ?auto_26749 ?auto_26759 ) ) ( not ( = ?auto_26750 ?auto_26759 ) ) ( not ( = ?auto_26748 ?auto_26759 ) ) ( not ( = ?auto_26758 ?auto_26759 ) ) ( SURFACE-AT ?auto_26747 ?auto_26757 ) ( CLEAR ?auto_26747 ) ( IS-CRATE ?auto_26748 ) ( not ( = ?auto_26747 ?auto_26748 ) ) ( not ( = ?auto_26749 ?auto_26747 ) ) ( not ( = ?auto_26750 ?auto_26747 ) ) ( not ( = ?auto_26758 ?auto_26747 ) ) ( not ( = ?auto_26759 ?auto_26747 ) ) ( AVAILABLE ?auto_26760 ) ( IN ?auto_26748 ?auto_26753 ) ( TRUCK-AT ?auto_26753 ?auto_26751 ) ( not ( = ?auto_26751 ?auto_26757 ) ) ( not ( = ?auto_26755 ?auto_26751 ) ) ( not ( = ?auto_26756 ?auto_26751 ) ) ( ON ?auto_26746 ?auto_26745 ) ( ON ?auto_26747 ?auto_26746 ) ( not ( = ?auto_26745 ?auto_26746 ) ) ( not ( = ?auto_26745 ?auto_26747 ) ) ( not ( = ?auto_26745 ?auto_26748 ) ) ( not ( = ?auto_26745 ?auto_26749 ) ) ( not ( = ?auto_26745 ?auto_26750 ) ) ( not ( = ?auto_26745 ?auto_26758 ) ) ( not ( = ?auto_26745 ?auto_26759 ) ) ( not ( = ?auto_26746 ?auto_26747 ) ) ( not ( = ?auto_26746 ?auto_26748 ) ) ( not ( = ?auto_26746 ?auto_26749 ) ) ( not ( = ?auto_26746 ?auto_26750 ) ) ( not ( = ?auto_26746 ?auto_26758 ) ) ( not ( = ?auto_26746 ?auto_26759 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26748 ?auto_26749 ?auto_26750 )
      ( MAKE-5CRATE-VERIFY ?auto_26745 ?auto_26746 ?auto_26747 ?auto_26748 ?auto_26749 ?auto_26750 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26761 - SURFACE
      ?auto_26762 - SURFACE
    )
    :vars
    (
      ?auto_26774 - HOIST
      ?auto_26769 - PLACE
      ?auto_26771 - SURFACE
      ?auto_26767 - PLACE
      ?auto_26766 - HOIST
      ?auto_26770 - SURFACE
      ?auto_26768 - PLACE
      ?auto_26764 - HOIST
      ?auto_26772 - SURFACE
      ?auto_26773 - SURFACE
      ?auto_26765 - TRUCK
      ?auto_26763 - PLACE
      ?auto_26775 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26774 ?auto_26769 ) ( IS-CRATE ?auto_26762 ) ( not ( = ?auto_26761 ?auto_26762 ) ) ( not ( = ?auto_26771 ?auto_26761 ) ) ( not ( = ?auto_26771 ?auto_26762 ) ) ( not ( = ?auto_26767 ?auto_26769 ) ) ( HOIST-AT ?auto_26766 ?auto_26767 ) ( not ( = ?auto_26774 ?auto_26766 ) ) ( AVAILABLE ?auto_26766 ) ( SURFACE-AT ?auto_26762 ?auto_26767 ) ( ON ?auto_26762 ?auto_26770 ) ( CLEAR ?auto_26762 ) ( not ( = ?auto_26761 ?auto_26770 ) ) ( not ( = ?auto_26762 ?auto_26770 ) ) ( not ( = ?auto_26771 ?auto_26770 ) ) ( IS-CRATE ?auto_26761 ) ( not ( = ?auto_26768 ?auto_26769 ) ) ( not ( = ?auto_26767 ?auto_26768 ) ) ( HOIST-AT ?auto_26764 ?auto_26768 ) ( not ( = ?auto_26774 ?auto_26764 ) ) ( not ( = ?auto_26766 ?auto_26764 ) ) ( AVAILABLE ?auto_26764 ) ( SURFACE-AT ?auto_26761 ?auto_26768 ) ( ON ?auto_26761 ?auto_26772 ) ( CLEAR ?auto_26761 ) ( not ( = ?auto_26761 ?auto_26772 ) ) ( not ( = ?auto_26762 ?auto_26772 ) ) ( not ( = ?auto_26771 ?auto_26772 ) ) ( not ( = ?auto_26770 ?auto_26772 ) ) ( SURFACE-AT ?auto_26773 ?auto_26769 ) ( CLEAR ?auto_26773 ) ( IS-CRATE ?auto_26771 ) ( not ( = ?auto_26773 ?auto_26771 ) ) ( not ( = ?auto_26761 ?auto_26773 ) ) ( not ( = ?auto_26762 ?auto_26773 ) ) ( not ( = ?auto_26770 ?auto_26773 ) ) ( not ( = ?auto_26772 ?auto_26773 ) ) ( AVAILABLE ?auto_26774 ) ( TRUCK-AT ?auto_26765 ?auto_26763 ) ( not ( = ?auto_26763 ?auto_26769 ) ) ( not ( = ?auto_26767 ?auto_26763 ) ) ( not ( = ?auto_26768 ?auto_26763 ) ) ( HOIST-AT ?auto_26775 ?auto_26763 ) ( LIFTING ?auto_26775 ?auto_26771 ) ( not ( = ?auto_26774 ?auto_26775 ) ) ( not ( = ?auto_26766 ?auto_26775 ) ) ( not ( = ?auto_26764 ?auto_26775 ) ) )
    :subtasks
    ( ( !LOAD ?auto_26775 ?auto_26771 ?auto_26765 ?auto_26763 )
      ( MAKE-2CRATE ?auto_26771 ?auto_26761 ?auto_26762 )
      ( MAKE-1CRATE-VERIFY ?auto_26761 ?auto_26762 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26776 - SURFACE
      ?auto_26777 - SURFACE
      ?auto_26778 - SURFACE
    )
    :vars
    (
      ?auto_26780 - HOIST
      ?auto_26786 - PLACE
      ?auto_26785 - PLACE
      ?auto_26783 - HOIST
      ?auto_26781 - SURFACE
      ?auto_26779 - PLACE
      ?auto_26787 - HOIST
      ?auto_26784 - SURFACE
      ?auto_26790 - SURFACE
      ?auto_26788 - TRUCK
      ?auto_26782 - PLACE
      ?auto_26789 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26780 ?auto_26786 ) ( IS-CRATE ?auto_26778 ) ( not ( = ?auto_26777 ?auto_26778 ) ) ( not ( = ?auto_26776 ?auto_26777 ) ) ( not ( = ?auto_26776 ?auto_26778 ) ) ( not ( = ?auto_26785 ?auto_26786 ) ) ( HOIST-AT ?auto_26783 ?auto_26785 ) ( not ( = ?auto_26780 ?auto_26783 ) ) ( AVAILABLE ?auto_26783 ) ( SURFACE-AT ?auto_26778 ?auto_26785 ) ( ON ?auto_26778 ?auto_26781 ) ( CLEAR ?auto_26778 ) ( not ( = ?auto_26777 ?auto_26781 ) ) ( not ( = ?auto_26778 ?auto_26781 ) ) ( not ( = ?auto_26776 ?auto_26781 ) ) ( IS-CRATE ?auto_26777 ) ( not ( = ?auto_26779 ?auto_26786 ) ) ( not ( = ?auto_26785 ?auto_26779 ) ) ( HOIST-AT ?auto_26787 ?auto_26779 ) ( not ( = ?auto_26780 ?auto_26787 ) ) ( not ( = ?auto_26783 ?auto_26787 ) ) ( AVAILABLE ?auto_26787 ) ( SURFACE-AT ?auto_26777 ?auto_26779 ) ( ON ?auto_26777 ?auto_26784 ) ( CLEAR ?auto_26777 ) ( not ( = ?auto_26777 ?auto_26784 ) ) ( not ( = ?auto_26778 ?auto_26784 ) ) ( not ( = ?auto_26776 ?auto_26784 ) ) ( not ( = ?auto_26781 ?auto_26784 ) ) ( SURFACE-AT ?auto_26790 ?auto_26786 ) ( CLEAR ?auto_26790 ) ( IS-CRATE ?auto_26776 ) ( not ( = ?auto_26790 ?auto_26776 ) ) ( not ( = ?auto_26777 ?auto_26790 ) ) ( not ( = ?auto_26778 ?auto_26790 ) ) ( not ( = ?auto_26781 ?auto_26790 ) ) ( not ( = ?auto_26784 ?auto_26790 ) ) ( AVAILABLE ?auto_26780 ) ( TRUCK-AT ?auto_26788 ?auto_26782 ) ( not ( = ?auto_26782 ?auto_26786 ) ) ( not ( = ?auto_26785 ?auto_26782 ) ) ( not ( = ?auto_26779 ?auto_26782 ) ) ( HOIST-AT ?auto_26789 ?auto_26782 ) ( LIFTING ?auto_26789 ?auto_26776 ) ( not ( = ?auto_26780 ?auto_26789 ) ) ( not ( = ?auto_26783 ?auto_26789 ) ) ( not ( = ?auto_26787 ?auto_26789 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26777 ?auto_26778 )
      ( MAKE-2CRATE-VERIFY ?auto_26776 ?auto_26777 ?auto_26778 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26791 - SURFACE
      ?auto_26792 - SURFACE
      ?auto_26793 - SURFACE
      ?auto_26794 - SURFACE
    )
    :vars
    (
      ?auto_26803 - HOIST
      ?auto_26800 - PLACE
      ?auto_26805 - PLACE
      ?auto_26801 - HOIST
      ?auto_26795 - SURFACE
      ?auto_26799 - PLACE
      ?auto_26796 - HOIST
      ?auto_26804 - SURFACE
      ?auto_26797 - TRUCK
      ?auto_26798 - PLACE
      ?auto_26802 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26803 ?auto_26800 ) ( IS-CRATE ?auto_26794 ) ( not ( = ?auto_26793 ?auto_26794 ) ) ( not ( = ?auto_26792 ?auto_26793 ) ) ( not ( = ?auto_26792 ?auto_26794 ) ) ( not ( = ?auto_26805 ?auto_26800 ) ) ( HOIST-AT ?auto_26801 ?auto_26805 ) ( not ( = ?auto_26803 ?auto_26801 ) ) ( AVAILABLE ?auto_26801 ) ( SURFACE-AT ?auto_26794 ?auto_26805 ) ( ON ?auto_26794 ?auto_26795 ) ( CLEAR ?auto_26794 ) ( not ( = ?auto_26793 ?auto_26795 ) ) ( not ( = ?auto_26794 ?auto_26795 ) ) ( not ( = ?auto_26792 ?auto_26795 ) ) ( IS-CRATE ?auto_26793 ) ( not ( = ?auto_26799 ?auto_26800 ) ) ( not ( = ?auto_26805 ?auto_26799 ) ) ( HOIST-AT ?auto_26796 ?auto_26799 ) ( not ( = ?auto_26803 ?auto_26796 ) ) ( not ( = ?auto_26801 ?auto_26796 ) ) ( AVAILABLE ?auto_26796 ) ( SURFACE-AT ?auto_26793 ?auto_26799 ) ( ON ?auto_26793 ?auto_26804 ) ( CLEAR ?auto_26793 ) ( not ( = ?auto_26793 ?auto_26804 ) ) ( not ( = ?auto_26794 ?auto_26804 ) ) ( not ( = ?auto_26792 ?auto_26804 ) ) ( not ( = ?auto_26795 ?auto_26804 ) ) ( SURFACE-AT ?auto_26791 ?auto_26800 ) ( CLEAR ?auto_26791 ) ( IS-CRATE ?auto_26792 ) ( not ( = ?auto_26791 ?auto_26792 ) ) ( not ( = ?auto_26793 ?auto_26791 ) ) ( not ( = ?auto_26794 ?auto_26791 ) ) ( not ( = ?auto_26795 ?auto_26791 ) ) ( not ( = ?auto_26804 ?auto_26791 ) ) ( AVAILABLE ?auto_26803 ) ( TRUCK-AT ?auto_26797 ?auto_26798 ) ( not ( = ?auto_26798 ?auto_26800 ) ) ( not ( = ?auto_26805 ?auto_26798 ) ) ( not ( = ?auto_26799 ?auto_26798 ) ) ( HOIST-AT ?auto_26802 ?auto_26798 ) ( LIFTING ?auto_26802 ?auto_26792 ) ( not ( = ?auto_26803 ?auto_26802 ) ) ( not ( = ?auto_26801 ?auto_26802 ) ) ( not ( = ?auto_26796 ?auto_26802 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26792 ?auto_26793 ?auto_26794 )
      ( MAKE-3CRATE-VERIFY ?auto_26791 ?auto_26792 ?auto_26793 ?auto_26794 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26806 - SURFACE
      ?auto_26807 - SURFACE
      ?auto_26808 - SURFACE
      ?auto_26809 - SURFACE
      ?auto_26810 - SURFACE
    )
    :vars
    (
      ?auto_26819 - HOIST
      ?auto_26816 - PLACE
      ?auto_26821 - PLACE
      ?auto_26817 - HOIST
      ?auto_26811 - SURFACE
      ?auto_26815 - PLACE
      ?auto_26812 - HOIST
      ?auto_26820 - SURFACE
      ?auto_26813 - TRUCK
      ?auto_26814 - PLACE
      ?auto_26818 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26819 ?auto_26816 ) ( IS-CRATE ?auto_26810 ) ( not ( = ?auto_26809 ?auto_26810 ) ) ( not ( = ?auto_26808 ?auto_26809 ) ) ( not ( = ?auto_26808 ?auto_26810 ) ) ( not ( = ?auto_26821 ?auto_26816 ) ) ( HOIST-AT ?auto_26817 ?auto_26821 ) ( not ( = ?auto_26819 ?auto_26817 ) ) ( AVAILABLE ?auto_26817 ) ( SURFACE-AT ?auto_26810 ?auto_26821 ) ( ON ?auto_26810 ?auto_26811 ) ( CLEAR ?auto_26810 ) ( not ( = ?auto_26809 ?auto_26811 ) ) ( not ( = ?auto_26810 ?auto_26811 ) ) ( not ( = ?auto_26808 ?auto_26811 ) ) ( IS-CRATE ?auto_26809 ) ( not ( = ?auto_26815 ?auto_26816 ) ) ( not ( = ?auto_26821 ?auto_26815 ) ) ( HOIST-AT ?auto_26812 ?auto_26815 ) ( not ( = ?auto_26819 ?auto_26812 ) ) ( not ( = ?auto_26817 ?auto_26812 ) ) ( AVAILABLE ?auto_26812 ) ( SURFACE-AT ?auto_26809 ?auto_26815 ) ( ON ?auto_26809 ?auto_26820 ) ( CLEAR ?auto_26809 ) ( not ( = ?auto_26809 ?auto_26820 ) ) ( not ( = ?auto_26810 ?auto_26820 ) ) ( not ( = ?auto_26808 ?auto_26820 ) ) ( not ( = ?auto_26811 ?auto_26820 ) ) ( SURFACE-AT ?auto_26807 ?auto_26816 ) ( CLEAR ?auto_26807 ) ( IS-CRATE ?auto_26808 ) ( not ( = ?auto_26807 ?auto_26808 ) ) ( not ( = ?auto_26809 ?auto_26807 ) ) ( not ( = ?auto_26810 ?auto_26807 ) ) ( not ( = ?auto_26811 ?auto_26807 ) ) ( not ( = ?auto_26820 ?auto_26807 ) ) ( AVAILABLE ?auto_26819 ) ( TRUCK-AT ?auto_26813 ?auto_26814 ) ( not ( = ?auto_26814 ?auto_26816 ) ) ( not ( = ?auto_26821 ?auto_26814 ) ) ( not ( = ?auto_26815 ?auto_26814 ) ) ( HOIST-AT ?auto_26818 ?auto_26814 ) ( LIFTING ?auto_26818 ?auto_26808 ) ( not ( = ?auto_26819 ?auto_26818 ) ) ( not ( = ?auto_26817 ?auto_26818 ) ) ( not ( = ?auto_26812 ?auto_26818 ) ) ( ON ?auto_26807 ?auto_26806 ) ( not ( = ?auto_26806 ?auto_26807 ) ) ( not ( = ?auto_26806 ?auto_26808 ) ) ( not ( = ?auto_26806 ?auto_26809 ) ) ( not ( = ?auto_26806 ?auto_26810 ) ) ( not ( = ?auto_26806 ?auto_26811 ) ) ( not ( = ?auto_26806 ?auto_26820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26808 ?auto_26809 ?auto_26810 )
      ( MAKE-4CRATE-VERIFY ?auto_26806 ?auto_26807 ?auto_26808 ?auto_26809 ?auto_26810 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26822 - SURFACE
      ?auto_26823 - SURFACE
      ?auto_26824 - SURFACE
      ?auto_26825 - SURFACE
      ?auto_26826 - SURFACE
      ?auto_26827 - SURFACE
    )
    :vars
    (
      ?auto_26836 - HOIST
      ?auto_26833 - PLACE
      ?auto_26838 - PLACE
      ?auto_26834 - HOIST
      ?auto_26828 - SURFACE
      ?auto_26832 - PLACE
      ?auto_26829 - HOIST
      ?auto_26837 - SURFACE
      ?auto_26830 - TRUCK
      ?auto_26831 - PLACE
      ?auto_26835 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26836 ?auto_26833 ) ( IS-CRATE ?auto_26827 ) ( not ( = ?auto_26826 ?auto_26827 ) ) ( not ( = ?auto_26825 ?auto_26826 ) ) ( not ( = ?auto_26825 ?auto_26827 ) ) ( not ( = ?auto_26838 ?auto_26833 ) ) ( HOIST-AT ?auto_26834 ?auto_26838 ) ( not ( = ?auto_26836 ?auto_26834 ) ) ( AVAILABLE ?auto_26834 ) ( SURFACE-AT ?auto_26827 ?auto_26838 ) ( ON ?auto_26827 ?auto_26828 ) ( CLEAR ?auto_26827 ) ( not ( = ?auto_26826 ?auto_26828 ) ) ( not ( = ?auto_26827 ?auto_26828 ) ) ( not ( = ?auto_26825 ?auto_26828 ) ) ( IS-CRATE ?auto_26826 ) ( not ( = ?auto_26832 ?auto_26833 ) ) ( not ( = ?auto_26838 ?auto_26832 ) ) ( HOIST-AT ?auto_26829 ?auto_26832 ) ( not ( = ?auto_26836 ?auto_26829 ) ) ( not ( = ?auto_26834 ?auto_26829 ) ) ( AVAILABLE ?auto_26829 ) ( SURFACE-AT ?auto_26826 ?auto_26832 ) ( ON ?auto_26826 ?auto_26837 ) ( CLEAR ?auto_26826 ) ( not ( = ?auto_26826 ?auto_26837 ) ) ( not ( = ?auto_26827 ?auto_26837 ) ) ( not ( = ?auto_26825 ?auto_26837 ) ) ( not ( = ?auto_26828 ?auto_26837 ) ) ( SURFACE-AT ?auto_26824 ?auto_26833 ) ( CLEAR ?auto_26824 ) ( IS-CRATE ?auto_26825 ) ( not ( = ?auto_26824 ?auto_26825 ) ) ( not ( = ?auto_26826 ?auto_26824 ) ) ( not ( = ?auto_26827 ?auto_26824 ) ) ( not ( = ?auto_26828 ?auto_26824 ) ) ( not ( = ?auto_26837 ?auto_26824 ) ) ( AVAILABLE ?auto_26836 ) ( TRUCK-AT ?auto_26830 ?auto_26831 ) ( not ( = ?auto_26831 ?auto_26833 ) ) ( not ( = ?auto_26838 ?auto_26831 ) ) ( not ( = ?auto_26832 ?auto_26831 ) ) ( HOIST-AT ?auto_26835 ?auto_26831 ) ( LIFTING ?auto_26835 ?auto_26825 ) ( not ( = ?auto_26836 ?auto_26835 ) ) ( not ( = ?auto_26834 ?auto_26835 ) ) ( not ( = ?auto_26829 ?auto_26835 ) ) ( ON ?auto_26823 ?auto_26822 ) ( ON ?auto_26824 ?auto_26823 ) ( not ( = ?auto_26822 ?auto_26823 ) ) ( not ( = ?auto_26822 ?auto_26824 ) ) ( not ( = ?auto_26822 ?auto_26825 ) ) ( not ( = ?auto_26822 ?auto_26826 ) ) ( not ( = ?auto_26822 ?auto_26827 ) ) ( not ( = ?auto_26822 ?auto_26828 ) ) ( not ( = ?auto_26822 ?auto_26837 ) ) ( not ( = ?auto_26823 ?auto_26824 ) ) ( not ( = ?auto_26823 ?auto_26825 ) ) ( not ( = ?auto_26823 ?auto_26826 ) ) ( not ( = ?auto_26823 ?auto_26827 ) ) ( not ( = ?auto_26823 ?auto_26828 ) ) ( not ( = ?auto_26823 ?auto_26837 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26825 ?auto_26826 ?auto_26827 )
      ( MAKE-5CRATE-VERIFY ?auto_26822 ?auto_26823 ?auto_26824 ?auto_26825 ?auto_26826 ?auto_26827 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26839 - SURFACE
      ?auto_26840 - SURFACE
    )
    :vars
    (
      ?auto_26850 - HOIST
      ?auto_26846 - PLACE
      ?auto_26849 - SURFACE
      ?auto_26853 - PLACE
      ?auto_26847 - HOIST
      ?auto_26841 - SURFACE
      ?auto_26845 - PLACE
      ?auto_26842 - HOIST
      ?auto_26852 - SURFACE
      ?auto_26851 - SURFACE
      ?auto_26843 - TRUCK
      ?auto_26844 - PLACE
      ?auto_26848 - HOIST
      ?auto_26854 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26850 ?auto_26846 ) ( IS-CRATE ?auto_26840 ) ( not ( = ?auto_26839 ?auto_26840 ) ) ( not ( = ?auto_26849 ?auto_26839 ) ) ( not ( = ?auto_26849 ?auto_26840 ) ) ( not ( = ?auto_26853 ?auto_26846 ) ) ( HOIST-AT ?auto_26847 ?auto_26853 ) ( not ( = ?auto_26850 ?auto_26847 ) ) ( AVAILABLE ?auto_26847 ) ( SURFACE-AT ?auto_26840 ?auto_26853 ) ( ON ?auto_26840 ?auto_26841 ) ( CLEAR ?auto_26840 ) ( not ( = ?auto_26839 ?auto_26841 ) ) ( not ( = ?auto_26840 ?auto_26841 ) ) ( not ( = ?auto_26849 ?auto_26841 ) ) ( IS-CRATE ?auto_26839 ) ( not ( = ?auto_26845 ?auto_26846 ) ) ( not ( = ?auto_26853 ?auto_26845 ) ) ( HOIST-AT ?auto_26842 ?auto_26845 ) ( not ( = ?auto_26850 ?auto_26842 ) ) ( not ( = ?auto_26847 ?auto_26842 ) ) ( AVAILABLE ?auto_26842 ) ( SURFACE-AT ?auto_26839 ?auto_26845 ) ( ON ?auto_26839 ?auto_26852 ) ( CLEAR ?auto_26839 ) ( not ( = ?auto_26839 ?auto_26852 ) ) ( not ( = ?auto_26840 ?auto_26852 ) ) ( not ( = ?auto_26849 ?auto_26852 ) ) ( not ( = ?auto_26841 ?auto_26852 ) ) ( SURFACE-AT ?auto_26851 ?auto_26846 ) ( CLEAR ?auto_26851 ) ( IS-CRATE ?auto_26849 ) ( not ( = ?auto_26851 ?auto_26849 ) ) ( not ( = ?auto_26839 ?auto_26851 ) ) ( not ( = ?auto_26840 ?auto_26851 ) ) ( not ( = ?auto_26841 ?auto_26851 ) ) ( not ( = ?auto_26852 ?auto_26851 ) ) ( AVAILABLE ?auto_26850 ) ( TRUCK-AT ?auto_26843 ?auto_26844 ) ( not ( = ?auto_26844 ?auto_26846 ) ) ( not ( = ?auto_26853 ?auto_26844 ) ) ( not ( = ?auto_26845 ?auto_26844 ) ) ( HOIST-AT ?auto_26848 ?auto_26844 ) ( not ( = ?auto_26850 ?auto_26848 ) ) ( not ( = ?auto_26847 ?auto_26848 ) ) ( not ( = ?auto_26842 ?auto_26848 ) ) ( AVAILABLE ?auto_26848 ) ( SURFACE-AT ?auto_26849 ?auto_26844 ) ( ON ?auto_26849 ?auto_26854 ) ( CLEAR ?auto_26849 ) ( not ( = ?auto_26839 ?auto_26854 ) ) ( not ( = ?auto_26840 ?auto_26854 ) ) ( not ( = ?auto_26849 ?auto_26854 ) ) ( not ( = ?auto_26841 ?auto_26854 ) ) ( not ( = ?auto_26852 ?auto_26854 ) ) ( not ( = ?auto_26851 ?auto_26854 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26848 ?auto_26849 ?auto_26854 ?auto_26844 )
      ( MAKE-2CRATE ?auto_26849 ?auto_26839 ?auto_26840 )
      ( MAKE-1CRATE-VERIFY ?auto_26839 ?auto_26840 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26855 - SURFACE
      ?auto_26856 - SURFACE
      ?auto_26857 - SURFACE
    )
    :vars
    (
      ?auto_26866 - HOIST
      ?auto_26863 - PLACE
      ?auto_26860 - PLACE
      ?auto_26858 - HOIST
      ?auto_26870 - SURFACE
      ?auto_26861 - PLACE
      ?auto_26869 - HOIST
      ?auto_26862 - SURFACE
      ?auto_26864 - SURFACE
      ?auto_26867 - TRUCK
      ?auto_26859 - PLACE
      ?auto_26865 - HOIST
      ?auto_26868 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26866 ?auto_26863 ) ( IS-CRATE ?auto_26857 ) ( not ( = ?auto_26856 ?auto_26857 ) ) ( not ( = ?auto_26855 ?auto_26856 ) ) ( not ( = ?auto_26855 ?auto_26857 ) ) ( not ( = ?auto_26860 ?auto_26863 ) ) ( HOIST-AT ?auto_26858 ?auto_26860 ) ( not ( = ?auto_26866 ?auto_26858 ) ) ( AVAILABLE ?auto_26858 ) ( SURFACE-AT ?auto_26857 ?auto_26860 ) ( ON ?auto_26857 ?auto_26870 ) ( CLEAR ?auto_26857 ) ( not ( = ?auto_26856 ?auto_26870 ) ) ( not ( = ?auto_26857 ?auto_26870 ) ) ( not ( = ?auto_26855 ?auto_26870 ) ) ( IS-CRATE ?auto_26856 ) ( not ( = ?auto_26861 ?auto_26863 ) ) ( not ( = ?auto_26860 ?auto_26861 ) ) ( HOIST-AT ?auto_26869 ?auto_26861 ) ( not ( = ?auto_26866 ?auto_26869 ) ) ( not ( = ?auto_26858 ?auto_26869 ) ) ( AVAILABLE ?auto_26869 ) ( SURFACE-AT ?auto_26856 ?auto_26861 ) ( ON ?auto_26856 ?auto_26862 ) ( CLEAR ?auto_26856 ) ( not ( = ?auto_26856 ?auto_26862 ) ) ( not ( = ?auto_26857 ?auto_26862 ) ) ( not ( = ?auto_26855 ?auto_26862 ) ) ( not ( = ?auto_26870 ?auto_26862 ) ) ( SURFACE-AT ?auto_26864 ?auto_26863 ) ( CLEAR ?auto_26864 ) ( IS-CRATE ?auto_26855 ) ( not ( = ?auto_26864 ?auto_26855 ) ) ( not ( = ?auto_26856 ?auto_26864 ) ) ( not ( = ?auto_26857 ?auto_26864 ) ) ( not ( = ?auto_26870 ?auto_26864 ) ) ( not ( = ?auto_26862 ?auto_26864 ) ) ( AVAILABLE ?auto_26866 ) ( TRUCK-AT ?auto_26867 ?auto_26859 ) ( not ( = ?auto_26859 ?auto_26863 ) ) ( not ( = ?auto_26860 ?auto_26859 ) ) ( not ( = ?auto_26861 ?auto_26859 ) ) ( HOIST-AT ?auto_26865 ?auto_26859 ) ( not ( = ?auto_26866 ?auto_26865 ) ) ( not ( = ?auto_26858 ?auto_26865 ) ) ( not ( = ?auto_26869 ?auto_26865 ) ) ( AVAILABLE ?auto_26865 ) ( SURFACE-AT ?auto_26855 ?auto_26859 ) ( ON ?auto_26855 ?auto_26868 ) ( CLEAR ?auto_26855 ) ( not ( = ?auto_26856 ?auto_26868 ) ) ( not ( = ?auto_26857 ?auto_26868 ) ) ( not ( = ?auto_26855 ?auto_26868 ) ) ( not ( = ?auto_26870 ?auto_26868 ) ) ( not ( = ?auto_26862 ?auto_26868 ) ) ( not ( = ?auto_26864 ?auto_26868 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26856 ?auto_26857 )
      ( MAKE-2CRATE-VERIFY ?auto_26855 ?auto_26856 ?auto_26857 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26871 - SURFACE
      ?auto_26872 - SURFACE
      ?auto_26873 - SURFACE
      ?auto_26874 - SURFACE
    )
    :vars
    (
      ?auto_26879 - HOIST
      ?auto_26886 - PLACE
      ?auto_26881 - PLACE
      ?auto_26878 - HOIST
      ?auto_26885 - SURFACE
      ?auto_26877 - PLACE
      ?auto_26882 - HOIST
      ?auto_26876 - SURFACE
      ?auto_26880 - TRUCK
      ?auto_26884 - PLACE
      ?auto_26875 - HOIST
      ?auto_26883 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26879 ?auto_26886 ) ( IS-CRATE ?auto_26874 ) ( not ( = ?auto_26873 ?auto_26874 ) ) ( not ( = ?auto_26872 ?auto_26873 ) ) ( not ( = ?auto_26872 ?auto_26874 ) ) ( not ( = ?auto_26881 ?auto_26886 ) ) ( HOIST-AT ?auto_26878 ?auto_26881 ) ( not ( = ?auto_26879 ?auto_26878 ) ) ( AVAILABLE ?auto_26878 ) ( SURFACE-AT ?auto_26874 ?auto_26881 ) ( ON ?auto_26874 ?auto_26885 ) ( CLEAR ?auto_26874 ) ( not ( = ?auto_26873 ?auto_26885 ) ) ( not ( = ?auto_26874 ?auto_26885 ) ) ( not ( = ?auto_26872 ?auto_26885 ) ) ( IS-CRATE ?auto_26873 ) ( not ( = ?auto_26877 ?auto_26886 ) ) ( not ( = ?auto_26881 ?auto_26877 ) ) ( HOIST-AT ?auto_26882 ?auto_26877 ) ( not ( = ?auto_26879 ?auto_26882 ) ) ( not ( = ?auto_26878 ?auto_26882 ) ) ( AVAILABLE ?auto_26882 ) ( SURFACE-AT ?auto_26873 ?auto_26877 ) ( ON ?auto_26873 ?auto_26876 ) ( CLEAR ?auto_26873 ) ( not ( = ?auto_26873 ?auto_26876 ) ) ( not ( = ?auto_26874 ?auto_26876 ) ) ( not ( = ?auto_26872 ?auto_26876 ) ) ( not ( = ?auto_26885 ?auto_26876 ) ) ( SURFACE-AT ?auto_26871 ?auto_26886 ) ( CLEAR ?auto_26871 ) ( IS-CRATE ?auto_26872 ) ( not ( = ?auto_26871 ?auto_26872 ) ) ( not ( = ?auto_26873 ?auto_26871 ) ) ( not ( = ?auto_26874 ?auto_26871 ) ) ( not ( = ?auto_26885 ?auto_26871 ) ) ( not ( = ?auto_26876 ?auto_26871 ) ) ( AVAILABLE ?auto_26879 ) ( TRUCK-AT ?auto_26880 ?auto_26884 ) ( not ( = ?auto_26884 ?auto_26886 ) ) ( not ( = ?auto_26881 ?auto_26884 ) ) ( not ( = ?auto_26877 ?auto_26884 ) ) ( HOIST-AT ?auto_26875 ?auto_26884 ) ( not ( = ?auto_26879 ?auto_26875 ) ) ( not ( = ?auto_26878 ?auto_26875 ) ) ( not ( = ?auto_26882 ?auto_26875 ) ) ( AVAILABLE ?auto_26875 ) ( SURFACE-AT ?auto_26872 ?auto_26884 ) ( ON ?auto_26872 ?auto_26883 ) ( CLEAR ?auto_26872 ) ( not ( = ?auto_26873 ?auto_26883 ) ) ( not ( = ?auto_26874 ?auto_26883 ) ) ( not ( = ?auto_26872 ?auto_26883 ) ) ( not ( = ?auto_26885 ?auto_26883 ) ) ( not ( = ?auto_26876 ?auto_26883 ) ) ( not ( = ?auto_26871 ?auto_26883 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26872 ?auto_26873 ?auto_26874 )
      ( MAKE-3CRATE-VERIFY ?auto_26871 ?auto_26872 ?auto_26873 ?auto_26874 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26887 - SURFACE
      ?auto_26888 - SURFACE
      ?auto_26889 - SURFACE
      ?auto_26890 - SURFACE
      ?auto_26891 - SURFACE
    )
    :vars
    (
      ?auto_26896 - HOIST
      ?auto_26903 - PLACE
      ?auto_26898 - PLACE
      ?auto_26895 - HOIST
      ?auto_26902 - SURFACE
      ?auto_26894 - PLACE
      ?auto_26899 - HOIST
      ?auto_26893 - SURFACE
      ?auto_26897 - TRUCK
      ?auto_26901 - PLACE
      ?auto_26892 - HOIST
      ?auto_26900 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26896 ?auto_26903 ) ( IS-CRATE ?auto_26891 ) ( not ( = ?auto_26890 ?auto_26891 ) ) ( not ( = ?auto_26889 ?auto_26890 ) ) ( not ( = ?auto_26889 ?auto_26891 ) ) ( not ( = ?auto_26898 ?auto_26903 ) ) ( HOIST-AT ?auto_26895 ?auto_26898 ) ( not ( = ?auto_26896 ?auto_26895 ) ) ( AVAILABLE ?auto_26895 ) ( SURFACE-AT ?auto_26891 ?auto_26898 ) ( ON ?auto_26891 ?auto_26902 ) ( CLEAR ?auto_26891 ) ( not ( = ?auto_26890 ?auto_26902 ) ) ( not ( = ?auto_26891 ?auto_26902 ) ) ( not ( = ?auto_26889 ?auto_26902 ) ) ( IS-CRATE ?auto_26890 ) ( not ( = ?auto_26894 ?auto_26903 ) ) ( not ( = ?auto_26898 ?auto_26894 ) ) ( HOIST-AT ?auto_26899 ?auto_26894 ) ( not ( = ?auto_26896 ?auto_26899 ) ) ( not ( = ?auto_26895 ?auto_26899 ) ) ( AVAILABLE ?auto_26899 ) ( SURFACE-AT ?auto_26890 ?auto_26894 ) ( ON ?auto_26890 ?auto_26893 ) ( CLEAR ?auto_26890 ) ( not ( = ?auto_26890 ?auto_26893 ) ) ( not ( = ?auto_26891 ?auto_26893 ) ) ( not ( = ?auto_26889 ?auto_26893 ) ) ( not ( = ?auto_26902 ?auto_26893 ) ) ( SURFACE-AT ?auto_26888 ?auto_26903 ) ( CLEAR ?auto_26888 ) ( IS-CRATE ?auto_26889 ) ( not ( = ?auto_26888 ?auto_26889 ) ) ( not ( = ?auto_26890 ?auto_26888 ) ) ( not ( = ?auto_26891 ?auto_26888 ) ) ( not ( = ?auto_26902 ?auto_26888 ) ) ( not ( = ?auto_26893 ?auto_26888 ) ) ( AVAILABLE ?auto_26896 ) ( TRUCK-AT ?auto_26897 ?auto_26901 ) ( not ( = ?auto_26901 ?auto_26903 ) ) ( not ( = ?auto_26898 ?auto_26901 ) ) ( not ( = ?auto_26894 ?auto_26901 ) ) ( HOIST-AT ?auto_26892 ?auto_26901 ) ( not ( = ?auto_26896 ?auto_26892 ) ) ( not ( = ?auto_26895 ?auto_26892 ) ) ( not ( = ?auto_26899 ?auto_26892 ) ) ( AVAILABLE ?auto_26892 ) ( SURFACE-AT ?auto_26889 ?auto_26901 ) ( ON ?auto_26889 ?auto_26900 ) ( CLEAR ?auto_26889 ) ( not ( = ?auto_26890 ?auto_26900 ) ) ( not ( = ?auto_26891 ?auto_26900 ) ) ( not ( = ?auto_26889 ?auto_26900 ) ) ( not ( = ?auto_26902 ?auto_26900 ) ) ( not ( = ?auto_26893 ?auto_26900 ) ) ( not ( = ?auto_26888 ?auto_26900 ) ) ( ON ?auto_26888 ?auto_26887 ) ( not ( = ?auto_26887 ?auto_26888 ) ) ( not ( = ?auto_26887 ?auto_26889 ) ) ( not ( = ?auto_26887 ?auto_26890 ) ) ( not ( = ?auto_26887 ?auto_26891 ) ) ( not ( = ?auto_26887 ?auto_26902 ) ) ( not ( = ?auto_26887 ?auto_26893 ) ) ( not ( = ?auto_26887 ?auto_26900 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26889 ?auto_26890 ?auto_26891 )
      ( MAKE-4CRATE-VERIFY ?auto_26887 ?auto_26888 ?auto_26889 ?auto_26890 ?auto_26891 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26904 - SURFACE
      ?auto_26905 - SURFACE
      ?auto_26906 - SURFACE
      ?auto_26907 - SURFACE
      ?auto_26908 - SURFACE
      ?auto_26909 - SURFACE
    )
    :vars
    (
      ?auto_26914 - HOIST
      ?auto_26921 - PLACE
      ?auto_26916 - PLACE
      ?auto_26913 - HOIST
      ?auto_26920 - SURFACE
      ?auto_26912 - PLACE
      ?auto_26917 - HOIST
      ?auto_26911 - SURFACE
      ?auto_26915 - TRUCK
      ?auto_26919 - PLACE
      ?auto_26910 - HOIST
      ?auto_26918 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26914 ?auto_26921 ) ( IS-CRATE ?auto_26909 ) ( not ( = ?auto_26908 ?auto_26909 ) ) ( not ( = ?auto_26907 ?auto_26908 ) ) ( not ( = ?auto_26907 ?auto_26909 ) ) ( not ( = ?auto_26916 ?auto_26921 ) ) ( HOIST-AT ?auto_26913 ?auto_26916 ) ( not ( = ?auto_26914 ?auto_26913 ) ) ( AVAILABLE ?auto_26913 ) ( SURFACE-AT ?auto_26909 ?auto_26916 ) ( ON ?auto_26909 ?auto_26920 ) ( CLEAR ?auto_26909 ) ( not ( = ?auto_26908 ?auto_26920 ) ) ( not ( = ?auto_26909 ?auto_26920 ) ) ( not ( = ?auto_26907 ?auto_26920 ) ) ( IS-CRATE ?auto_26908 ) ( not ( = ?auto_26912 ?auto_26921 ) ) ( not ( = ?auto_26916 ?auto_26912 ) ) ( HOIST-AT ?auto_26917 ?auto_26912 ) ( not ( = ?auto_26914 ?auto_26917 ) ) ( not ( = ?auto_26913 ?auto_26917 ) ) ( AVAILABLE ?auto_26917 ) ( SURFACE-AT ?auto_26908 ?auto_26912 ) ( ON ?auto_26908 ?auto_26911 ) ( CLEAR ?auto_26908 ) ( not ( = ?auto_26908 ?auto_26911 ) ) ( not ( = ?auto_26909 ?auto_26911 ) ) ( not ( = ?auto_26907 ?auto_26911 ) ) ( not ( = ?auto_26920 ?auto_26911 ) ) ( SURFACE-AT ?auto_26906 ?auto_26921 ) ( CLEAR ?auto_26906 ) ( IS-CRATE ?auto_26907 ) ( not ( = ?auto_26906 ?auto_26907 ) ) ( not ( = ?auto_26908 ?auto_26906 ) ) ( not ( = ?auto_26909 ?auto_26906 ) ) ( not ( = ?auto_26920 ?auto_26906 ) ) ( not ( = ?auto_26911 ?auto_26906 ) ) ( AVAILABLE ?auto_26914 ) ( TRUCK-AT ?auto_26915 ?auto_26919 ) ( not ( = ?auto_26919 ?auto_26921 ) ) ( not ( = ?auto_26916 ?auto_26919 ) ) ( not ( = ?auto_26912 ?auto_26919 ) ) ( HOIST-AT ?auto_26910 ?auto_26919 ) ( not ( = ?auto_26914 ?auto_26910 ) ) ( not ( = ?auto_26913 ?auto_26910 ) ) ( not ( = ?auto_26917 ?auto_26910 ) ) ( AVAILABLE ?auto_26910 ) ( SURFACE-AT ?auto_26907 ?auto_26919 ) ( ON ?auto_26907 ?auto_26918 ) ( CLEAR ?auto_26907 ) ( not ( = ?auto_26908 ?auto_26918 ) ) ( not ( = ?auto_26909 ?auto_26918 ) ) ( not ( = ?auto_26907 ?auto_26918 ) ) ( not ( = ?auto_26920 ?auto_26918 ) ) ( not ( = ?auto_26911 ?auto_26918 ) ) ( not ( = ?auto_26906 ?auto_26918 ) ) ( ON ?auto_26905 ?auto_26904 ) ( ON ?auto_26906 ?auto_26905 ) ( not ( = ?auto_26904 ?auto_26905 ) ) ( not ( = ?auto_26904 ?auto_26906 ) ) ( not ( = ?auto_26904 ?auto_26907 ) ) ( not ( = ?auto_26904 ?auto_26908 ) ) ( not ( = ?auto_26904 ?auto_26909 ) ) ( not ( = ?auto_26904 ?auto_26920 ) ) ( not ( = ?auto_26904 ?auto_26911 ) ) ( not ( = ?auto_26904 ?auto_26918 ) ) ( not ( = ?auto_26905 ?auto_26906 ) ) ( not ( = ?auto_26905 ?auto_26907 ) ) ( not ( = ?auto_26905 ?auto_26908 ) ) ( not ( = ?auto_26905 ?auto_26909 ) ) ( not ( = ?auto_26905 ?auto_26920 ) ) ( not ( = ?auto_26905 ?auto_26911 ) ) ( not ( = ?auto_26905 ?auto_26918 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26907 ?auto_26908 ?auto_26909 )
      ( MAKE-5CRATE-VERIFY ?auto_26904 ?auto_26905 ?auto_26906 ?auto_26907 ?auto_26908 ?auto_26909 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26922 - SURFACE
      ?auto_26923 - SURFACE
    )
    :vars
    (
      ?auto_26928 - HOIST
      ?auto_26937 - PLACE
      ?auto_26930 - SURFACE
      ?auto_26932 - PLACE
      ?auto_26927 - HOIST
      ?auto_26936 - SURFACE
      ?auto_26926 - PLACE
      ?auto_26933 - HOIST
      ?auto_26925 - SURFACE
      ?auto_26929 - SURFACE
      ?auto_26935 - PLACE
      ?auto_26924 - HOIST
      ?auto_26934 - SURFACE
      ?auto_26931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26928 ?auto_26937 ) ( IS-CRATE ?auto_26923 ) ( not ( = ?auto_26922 ?auto_26923 ) ) ( not ( = ?auto_26930 ?auto_26922 ) ) ( not ( = ?auto_26930 ?auto_26923 ) ) ( not ( = ?auto_26932 ?auto_26937 ) ) ( HOIST-AT ?auto_26927 ?auto_26932 ) ( not ( = ?auto_26928 ?auto_26927 ) ) ( AVAILABLE ?auto_26927 ) ( SURFACE-AT ?auto_26923 ?auto_26932 ) ( ON ?auto_26923 ?auto_26936 ) ( CLEAR ?auto_26923 ) ( not ( = ?auto_26922 ?auto_26936 ) ) ( not ( = ?auto_26923 ?auto_26936 ) ) ( not ( = ?auto_26930 ?auto_26936 ) ) ( IS-CRATE ?auto_26922 ) ( not ( = ?auto_26926 ?auto_26937 ) ) ( not ( = ?auto_26932 ?auto_26926 ) ) ( HOIST-AT ?auto_26933 ?auto_26926 ) ( not ( = ?auto_26928 ?auto_26933 ) ) ( not ( = ?auto_26927 ?auto_26933 ) ) ( AVAILABLE ?auto_26933 ) ( SURFACE-AT ?auto_26922 ?auto_26926 ) ( ON ?auto_26922 ?auto_26925 ) ( CLEAR ?auto_26922 ) ( not ( = ?auto_26922 ?auto_26925 ) ) ( not ( = ?auto_26923 ?auto_26925 ) ) ( not ( = ?auto_26930 ?auto_26925 ) ) ( not ( = ?auto_26936 ?auto_26925 ) ) ( SURFACE-AT ?auto_26929 ?auto_26937 ) ( CLEAR ?auto_26929 ) ( IS-CRATE ?auto_26930 ) ( not ( = ?auto_26929 ?auto_26930 ) ) ( not ( = ?auto_26922 ?auto_26929 ) ) ( not ( = ?auto_26923 ?auto_26929 ) ) ( not ( = ?auto_26936 ?auto_26929 ) ) ( not ( = ?auto_26925 ?auto_26929 ) ) ( AVAILABLE ?auto_26928 ) ( not ( = ?auto_26935 ?auto_26937 ) ) ( not ( = ?auto_26932 ?auto_26935 ) ) ( not ( = ?auto_26926 ?auto_26935 ) ) ( HOIST-AT ?auto_26924 ?auto_26935 ) ( not ( = ?auto_26928 ?auto_26924 ) ) ( not ( = ?auto_26927 ?auto_26924 ) ) ( not ( = ?auto_26933 ?auto_26924 ) ) ( AVAILABLE ?auto_26924 ) ( SURFACE-AT ?auto_26930 ?auto_26935 ) ( ON ?auto_26930 ?auto_26934 ) ( CLEAR ?auto_26930 ) ( not ( = ?auto_26922 ?auto_26934 ) ) ( not ( = ?auto_26923 ?auto_26934 ) ) ( not ( = ?auto_26930 ?auto_26934 ) ) ( not ( = ?auto_26936 ?auto_26934 ) ) ( not ( = ?auto_26925 ?auto_26934 ) ) ( not ( = ?auto_26929 ?auto_26934 ) ) ( TRUCK-AT ?auto_26931 ?auto_26937 ) )
    :subtasks
    ( ( !DRIVE ?auto_26931 ?auto_26937 ?auto_26935 )
      ( MAKE-2CRATE ?auto_26930 ?auto_26922 ?auto_26923 )
      ( MAKE-1CRATE-VERIFY ?auto_26922 ?auto_26923 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26938 - SURFACE
      ?auto_26939 - SURFACE
      ?auto_26940 - SURFACE
    )
    :vars
    (
      ?auto_26942 - HOIST
      ?auto_26944 - PLACE
      ?auto_26945 - PLACE
      ?auto_26950 - HOIST
      ?auto_26948 - SURFACE
      ?auto_26946 - PLACE
      ?auto_26943 - HOIST
      ?auto_26952 - SURFACE
      ?auto_26953 - SURFACE
      ?auto_26947 - PLACE
      ?auto_26951 - HOIST
      ?auto_26941 - SURFACE
      ?auto_26949 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26942 ?auto_26944 ) ( IS-CRATE ?auto_26940 ) ( not ( = ?auto_26939 ?auto_26940 ) ) ( not ( = ?auto_26938 ?auto_26939 ) ) ( not ( = ?auto_26938 ?auto_26940 ) ) ( not ( = ?auto_26945 ?auto_26944 ) ) ( HOIST-AT ?auto_26950 ?auto_26945 ) ( not ( = ?auto_26942 ?auto_26950 ) ) ( AVAILABLE ?auto_26950 ) ( SURFACE-AT ?auto_26940 ?auto_26945 ) ( ON ?auto_26940 ?auto_26948 ) ( CLEAR ?auto_26940 ) ( not ( = ?auto_26939 ?auto_26948 ) ) ( not ( = ?auto_26940 ?auto_26948 ) ) ( not ( = ?auto_26938 ?auto_26948 ) ) ( IS-CRATE ?auto_26939 ) ( not ( = ?auto_26946 ?auto_26944 ) ) ( not ( = ?auto_26945 ?auto_26946 ) ) ( HOIST-AT ?auto_26943 ?auto_26946 ) ( not ( = ?auto_26942 ?auto_26943 ) ) ( not ( = ?auto_26950 ?auto_26943 ) ) ( AVAILABLE ?auto_26943 ) ( SURFACE-AT ?auto_26939 ?auto_26946 ) ( ON ?auto_26939 ?auto_26952 ) ( CLEAR ?auto_26939 ) ( not ( = ?auto_26939 ?auto_26952 ) ) ( not ( = ?auto_26940 ?auto_26952 ) ) ( not ( = ?auto_26938 ?auto_26952 ) ) ( not ( = ?auto_26948 ?auto_26952 ) ) ( SURFACE-AT ?auto_26953 ?auto_26944 ) ( CLEAR ?auto_26953 ) ( IS-CRATE ?auto_26938 ) ( not ( = ?auto_26953 ?auto_26938 ) ) ( not ( = ?auto_26939 ?auto_26953 ) ) ( not ( = ?auto_26940 ?auto_26953 ) ) ( not ( = ?auto_26948 ?auto_26953 ) ) ( not ( = ?auto_26952 ?auto_26953 ) ) ( AVAILABLE ?auto_26942 ) ( not ( = ?auto_26947 ?auto_26944 ) ) ( not ( = ?auto_26945 ?auto_26947 ) ) ( not ( = ?auto_26946 ?auto_26947 ) ) ( HOIST-AT ?auto_26951 ?auto_26947 ) ( not ( = ?auto_26942 ?auto_26951 ) ) ( not ( = ?auto_26950 ?auto_26951 ) ) ( not ( = ?auto_26943 ?auto_26951 ) ) ( AVAILABLE ?auto_26951 ) ( SURFACE-AT ?auto_26938 ?auto_26947 ) ( ON ?auto_26938 ?auto_26941 ) ( CLEAR ?auto_26938 ) ( not ( = ?auto_26939 ?auto_26941 ) ) ( not ( = ?auto_26940 ?auto_26941 ) ) ( not ( = ?auto_26938 ?auto_26941 ) ) ( not ( = ?auto_26948 ?auto_26941 ) ) ( not ( = ?auto_26952 ?auto_26941 ) ) ( not ( = ?auto_26953 ?auto_26941 ) ) ( TRUCK-AT ?auto_26949 ?auto_26944 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26939 ?auto_26940 )
      ( MAKE-2CRATE-VERIFY ?auto_26938 ?auto_26939 ?auto_26940 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26954 - SURFACE
      ?auto_26955 - SURFACE
      ?auto_26956 - SURFACE
      ?auto_26957 - SURFACE
    )
    :vars
    (
      ?auto_26961 - HOIST
      ?auto_26960 - PLACE
      ?auto_26964 - PLACE
      ?auto_26959 - HOIST
      ?auto_26967 - SURFACE
      ?auto_26969 - PLACE
      ?auto_26958 - HOIST
      ?auto_26965 - SURFACE
      ?auto_26962 - PLACE
      ?auto_26966 - HOIST
      ?auto_26963 - SURFACE
      ?auto_26968 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26961 ?auto_26960 ) ( IS-CRATE ?auto_26957 ) ( not ( = ?auto_26956 ?auto_26957 ) ) ( not ( = ?auto_26955 ?auto_26956 ) ) ( not ( = ?auto_26955 ?auto_26957 ) ) ( not ( = ?auto_26964 ?auto_26960 ) ) ( HOIST-AT ?auto_26959 ?auto_26964 ) ( not ( = ?auto_26961 ?auto_26959 ) ) ( AVAILABLE ?auto_26959 ) ( SURFACE-AT ?auto_26957 ?auto_26964 ) ( ON ?auto_26957 ?auto_26967 ) ( CLEAR ?auto_26957 ) ( not ( = ?auto_26956 ?auto_26967 ) ) ( not ( = ?auto_26957 ?auto_26967 ) ) ( not ( = ?auto_26955 ?auto_26967 ) ) ( IS-CRATE ?auto_26956 ) ( not ( = ?auto_26969 ?auto_26960 ) ) ( not ( = ?auto_26964 ?auto_26969 ) ) ( HOIST-AT ?auto_26958 ?auto_26969 ) ( not ( = ?auto_26961 ?auto_26958 ) ) ( not ( = ?auto_26959 ?auto_26958 ) ) ( AVAILABLE ?auto_26958 ) ( SURFACE-AT ?auto_26956 ?auto_26969 ) ( ON ?auto_26956 ?auto_26965 ) ( CLEAR ?auto_26956 ) ( not ( = ?auto_26956 ?auto_26965 ) ) ( not ( = ?auto_26957 ?auto_26965 ) ) ( not ( = ?auto_26955 ?auto_26965 ) ) ( not ( = ?auto_26967 ?auto_26965 ) ) ( SURFACE-AT ?auto_26954 ?auto_26960 ) ( CLEAR ?auto_26954 ) ( IS-CRATE ?auto_26955 ) ( not ( = ?auto_26954 ?auto_26955 ) ) ( not ( = ?auto_26956 ?auto_26954 ) ) ( not ( = ?auto_26957 ?auto_26954 ) ) ( not ( = ?auto_26967 ?auto_26954 ) ) ( not ( = ?auto_26965 ?auto_26954 ) ) ( AVAILABLE ?auto_26961 ) ( not ( = ?auto_26962 ?auto_26960 ) ) ( not ( = ?auto_26964 ?auto_26962 ) ) ( not ( = ?auto_26969 ?auto_26962 ) ) ( HOIST-AT ?auto_26966 ?auto_26962 ) ( not ( = ?auto_26961 ?auto_26966 ) ) ( not ( = ?auto_26959 ?auto_26966 ) ) ( not ( = ?auto_26958 ?auto_26966 ) ) ( AVAILABLE ?auto_26966 ) ( SURFACE-AT ?auto_26955 ?auto_26962 ) ( ON ?auto_26955 ?auto_26963 ) ( CLEAR ?auto_26955 ) ( not ( = ?auto_26956 ?auto_26963 ) ) ( not ( = ?auto_26957 ?auto_26963 ) ) ( not ( = ?auto_26955 ?auto_26963 ) ) ( not ( = ?auto_26967 ?auto_26963 ) ) ( not ( = ?auto_26965 ?auto_26963 ) ) ( not ( = ?auto_26954 ?auto_26963 ) ) ( TRUCK-AT ?auto_26968 ?auto_26960 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26955 ?auto_26956 ?auto_26957 )
      ( MAKE-3CRATE-VERIFY ?auto_26954 ?auto_26955 ?auto_26956 ?auto_26957 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26970 - SURFACE
      ?auto_26971 - SURFACE
      ?auto_26972 - SURFACE
      ?auto_26973 - SURFACE
      ?auto_26974 - SURFACE
    )
    :vars
    (
      ?auto_26978 - HOIST
      ?auto_26977 - PLACE
      ?auto_26981 - PLACE
      ?auto_26976 - HOIST
      ?auto_26984 - SURFACE
      ?auto_26986 - PLACE
      ?auto_26975 - HOIST
      ?auto_26982 - SURFACE
      ?auto_26979 - PLACE
      ?auto_26983 - HOIST
      ?auto_26980 - SURFACE
      ?auto_26985 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26978 ?auto_26977 ) ( IS-CRATE ?auto_26974 ) ( not ( = ?auto_26973 ?auto_26974 ) ) ( not ( = ?auto_26972 ?auto_26973 ) ) ( not ( = ?auto_26972 ?auto_26974 ) ) ( not ( = ?auto_26981 ?auto_26977 ) ) ( HOIST-AT ?auto_26976 ?auto_26981 ) ( not ( = ?auto_26978 ?auto_26976 ) ) ( AVAILABLE ?auto_26976 ) ( SURFACE-AT ?auto_26974 ?auto_26981 ) ( ON ?auto_26974 ?auto_26984 ) ( CLEAR ?auto_26974 ) ( not ( = ?auto_26973 ?auto_26984 ) ) ( not ( = ?auto_26974 ?auto_26984 ) ) ( not ( = ?auto_26972 ?auto_26984 ) ) ( IS-CRATE ?auto_26973 ) ( not ( = ?auto_26986 ?auto_26977 ) ) ( not ( = ?auto_26981 ?auto_26986 ) ) ( HOIST-AT ?auto_26975 ?auto_26986 ) ( not ( = ?auto_26978 ?auto_26975 ) ) ( not ( = ?auto_26976 ?auto_26975 ) ) ( AVAILABLE ?auto_26975 ) ( SURFACE-AT ?auto_26973 ?auto_26986 ) ( ON ?auto_26973 ?auto_26982 ) ( CLEAR ?auto_26973 ) ( not ( = ?auto_26973 ?auto_26982 ) ) ( not ( = ?auto_26974 ?auto_26982 ) ) ( not ( = ?auto_26972 ?auto_26982 ) ) ( not ( = ?auto_26984 ?auto_26982 ) ) ( SURFACE-AT ?auto_26971 ?auto_26977 ) ( CLEAR ?auto_26971 ) ( IS-CRATE ?auto_26972 ) ( not ( = ?auto_26971 ?auto_26972 ) ) ( not ( = ?auto_26973 ?auto_26971 ) ) ( not ( = ?auto_26974 ?auto_26971 ) ) ( not ( = ?auto_26984 ?auto_26971 ) ) ( not ( = ?auto_26982 ?auto_26971 ) ) ( AVAILABLE ?auto_26978 ) ( not ( = ?auto_26979 ?auto_26977 ) ) ( not ( = ?auto_26981 ?auto_26979 ) ) ( not ( = ?auto_26986 ?auto_26979 ) ) ( HOIST-AT ?auto_26983 ?auto_26979 ) ( not ( = ?auto_26978 ?auto_26983 ) ) ( not ( = ?auto_26976 ?auto_26983 ) ) ( not ( = ?auto_26975 ?auto_26983 ) ) ( AVAILABLE ?auto_26983 ) ( SURFACE-AT ?auto_26972 ?auto_26979 ) ( ON ?auto_26972 ?auto_26980 ) ( CLEAR ?auto_26972 ) ( not ( = ?auto_26973 ?auto_26980 ) ) ( not ( = ?auto_26974 ?auto_26980 ) ) ( not ( = ?auto_26972 ?auto_26980 ) ) ( not ( = ?auto_26984 ?auto_26980 ) ) ( not ( = ?auto_26982 ?auto_26980 ) ) ( not ( = ?auto_26971 ?auto_26980 ) ) ( TRUCK-AT ?auto_26985 ?auto_26977 ) ( ON ?auto_26971 ?auto_26970 ) ( not ( = ?auto_26970 ?auto_26971 ) ) ( not ( = ?auto_26970 ?auto_26972 ) ) ( not ( = ?auto_26970 ?auto_26973 ) ) ( not ( = ?auto_26970 ?auto_26974 ) ) ( not ( = ?auto_26970 ?auto_26984 ) ) ( not ( = ?auto_26970 ?auto_26982 ) ) ( not ( = ?auto_26970 ?auto_26980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26972 ?auto_26973 ?auto_26974 )
      ( MAKE-4CRATE-VERIFY ?auto_26970 ?auto_26971 ?auto_26972 ?auto_26973 ?auto_26974 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26987 - SURFACE
      ?auto_26988 - SURFACE
      ?auto_26989 - SURFACE
      ?auto_26990 - SURFACE
      ?auto_26991 - SURFACE
      ?auto_26992 - SURFACE
    )
    :vars
    (
      ?auto_26996 - HOIST
      ?auto_26995 - PLACE
      ?auto_26999 - PLACE
      ?auto_26994 - HOIST
      ?auto_27002 - SURFACE
      ?auto_27004 - PLACE
      ?auto_26993 - HOIST
      ?auto_27000 - SURFACE
      ?auto_26997 - PLACE
      ?auto_27001 - HOIST
      ?auto_26998 - SURFACE
      ?auto_27003 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26996 ?auto_26995 ) ( IS-CRATE ?auto_26992 ) ( not ( = ?auto_26991 ?auto_26992 ) ) ( not ( = ?auto_26990 ?auto_26991 ) ) ( not ( = ?auto_26990 ?auto_26992 ) ) ( not ( = ?auto_26999 ?auto_26995 ) ) ( HOIST-AT ?auto_26994 ?auto_26999 ) ( not ( = ?auto_26996 ?auto_26994 ) ) ( AVAILABLE ?auto_26994 ) ( SURFACE-AT ?auto_26992 ?auto_26999 ) ( ON ?auto_26992 ?auto_27002 ) ( CLEAR ?auto_26992 ) ( not ( = ?auto_26991 ?auto_27002 ) ) ( not ( = ?auto_26992 ?auto_27002 ) ) ( not ( = ?auto_26990 ?auto_27002 ) ) ( IS-CRATE ?auto_26991 ) ( not ( = ?auto_27004 ?auto_26995 ) ) ( not ( = ?auto_26999 ?auto_27004 ) ) ( HOIST-AT ?auto_26993 ?auto_27004 ) ( not ( = ?auto_26996 ?auto_26993 ) ) ( not ( = ?auto_26994 ?auto_26993 ) ) ( AVAILABLE ?auto_26993 ) ( SURFACE-AT ?auto_26991 ?auto_27004 ) ( ON ?auto_26991 ?auto_27000 ) ( CLEAR ?auto_26991 ) ( not ( = ?auto_26991 ?auto_27000 ) ) ( not ( = ?auto_26992 ?auto_27000 ) ) ( not ( = ?auto_26990 ?auto_27000 ) ) ( not ( = ?auto_27002 ?auto_27000 ) ) ( SURFACE-AT ?auto_26989 ?auto_26995 ) ( CLEAR ?auto_26989 ) ( IS-CRATE ?auto_26990 ) ( not ( = ?auto_26989 ?auto_26990 ) ) ( not ( = ?auto_26991 ?auto_26989 ) ) ( not ( = ?auto_26992 ?auto_26989 ) ) ( not ( = ?auto_27002 ?auto_26989 ) ) ( not ( = ?auto_27000 ?auto_26989 ) ) ( AVAILABLE ?auto_26996 ) ( not ( = ?auto_26997 ?auto_26995 ) ) ( not ( = ?auto_26999 ?auto_26997 ) ) ( not ( = ?auto_27004 ?auto_26997 ) ) ( HOIST-AT ?auto_27001 ?auto_26997 ) ( not ( = ?auto_26996 ?auto_27001 ) ) ( not ( = ?auto_26994 ?auto_27001 ) ) ( not ( = ?auto_26993 ?auto_27001 ) ) ( AVAILABLE ?auto_27001 ) ( SURFACE-AT ?auto_26990 ?auto_26997 ) ( ON ?auto_26990 ?auto_26998 ) ( CLEAR ?auto_26990 ) ( not ( = ?auto_26991 ?auto_26998 ) ) ( not ( = ?auto_26992 ?auto_26998 ) ) ( not ( = ?auto_26990 ?auto_26998 ) ) ( not ( = ?auto_27002 ?auto_26998 ) ) ( not ( = ?auto_27000 ?auto_26998 ) ) ( not ( = ?auto_26989 ?auto_26998 ) ) ( TRUCK-AT ?auto_27003 ?auto_26995 ) ( ON ?auto_26988 ?auto_26987 ) ( ON ?auto_26989 ?auto_26988 ) ( not ( = ?auto_26987 ?auto_26988 ) ) ( not ( = ?auto_26987 ?auto_26989 ) ) ( not ( = ?auto_26987 ?auto_26990 ) ) ( not ( = ?auto_26987 ?auto_26991 ) ) ( not ( = ?auto_26987 ?auto_26992 ) ) ( not ( = ?auto_26987 ?auto_27002 ) ) ( not ( = ?auto_26987 ?auto_27000 ) ) ( not ( = ?auto_26987 ?auto_26998 ) ) ( not ( = ?auto_26988 ?auto_26989 ) ) ( not ( = ?auto_26988 ?auto_26990 ) ) ( not ( = ?auto_26988 ?auto_26991 ) ) ( not ( = ?auto_26988 ?auto_26992 ) ) ( not ( = ?auto_26988 ?auto_27002 ) ) ( not ( = ?auto_26988 ?auto_27000 ) ) ( not ( = ?auto_26988 ?auto_26998 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26990 ?auto_26991 ?auto_26992 )
      ( MAKE-5CRATE-VERIFY ?auto_26987 ?auto_26988 ?auto_26989 ?auto_26990 ?auto_26991 ?auto_26992 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27005 - SURFACE
      ?auto_27006 - SURFACE
    )
    :vars
    (
      ?auto_27010 - HOIST
      ?auto_27009 - PLACE
      ?auto_27012 - SURFACE
      ?auto_27014 - PLACE
      ?auto_27008 - HOIST
      ?auto_27017 - SURFACE
      ?auto_27019 - PLACE
      ?auto_27007 - HOIST
      ?auto_27015 - SURFACE
      ?auto_27020 - SURFACE
      ?auto_27011 - PLACE
      ?auto_27016 - HOIST
      ?auto_27013 - SURFACE
      ?auto_27018 - TRUCK
      ?auto_27021 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27010 ?auto_27009 ) ( IS-CRATE ?auto_27006 ) ( not ( = ?auto_27005 ?auto_27006 ) ) ( not ( = ?auto_27012 ?auto_27005 ) ) ( not ( = ?auto_27012 ?auto_27006 ) ) ( not ( = ?auto_27014 ?auto_27009 ) ) ( HOIST-AT ?auto_27008 ?auto_27014 ) ( not ( = ?auto_27010 ?auto_27008 ) ) ( AVAILABLE ?auto_27008 ) ( SURFACE-AT ?auto_27006 ?auto_27014 ) ( ON ?auto_27006 ?auto_27017 ) ( CLEAR ?auto_27006 ) ( not ( = ?auto_27005 ?auto_27017 ) ) ( not ( = ?auto_27006 ?auto_27017 ) ) ( not ( = ?auto_27012 ?auto_27017 ) ) ( IS-CRATE ?auto_27005 ) ( not ( = ?auto_27019 ?auto_27009 ) ) ( not ( = ?auto_27014 ?auto_27019 ) ) ( HOIST-AT ?auto_27007 ?auto_27019 ) ( not ( = ?auto_27010 ?auto_27007 ) ) ( not ( = ?auto_27008 ?auto_27007 ) ) ( AVAILABLE ?auto_27007 ) ( SURFACE-AT ?auto_27005 ?auto_27019 ) ( ON ?auto_27005 ?auto_27015 ) ( CLEAR ?auto_27005 ) ( not ( = ?auto_27005 ?auto_27015 ) ) ( not ( = ?auto_27006 ?auto_27015 ) ) ( not ( = ?auto_27012 ?auto_27015 ) ) ( not ( = ?auto_27017 ?auto_27015 ) ) ( IS-CRATE ?auto_27012 ) ( not ( = ?auto_27020 ?auto_27012 ) ) ( not ( = ?auto_27005 ?auto_27020 ) ) ( not ( = ?auto_27006 ?auto_27020 ) ) ( not ( = ?auto_27017 ?auto_27020 ) ) ( not ( = ?auto_27015 ?auto_27020 ) ) ( not ( = ?auto_27011 ?auto_27009 ) ) ( not ( = ?auto_27014 ?auto_27011 ) ) ( not ( = ?auto_27019 ?auto_27011 ) ) ( HOIST-AT ?auto_27016 ?auto_27011 ) ( not ( = ?auto_27010 ?auto_27016 ) ) ( not ( = ?auto_27008 ?auto_27016 ) ) ( not ( = ?auto_27007 ?auto_27016 ) ) ( AVAILABLE ?auto_27016 ) ( SURFACE-AT ?auto_27012 ?auto_27011 ) ( ON ?auto_27012 ?auto_27013 ) ( CLEAR ?auto_27012 ) ( not ( = ?auto_27005 ?auto_27013 ) ) ( not ( = ?auto_27006 ?auto_27013 ) ) ( not ( = ?auto_27012 ?auto_27013 ) ) ( not ( = ?auto_27017 ?auto_27013 ) ) ( not ( = ?auto_27015 ?auto_27013 ) ) ( not ( = ?auto_27020 ?auto_27013 ) ) ( TRUCK-AT ?auto_27018 ?auto_27009 ) ( SURFACE-AT ?auto_27021 ?auto_27009 ) ( CLEAR ?auto_27021 ) ( LIFTING ?auto_27010 ?auto_27020 ) ( IS-CRATE ?auto_27020 ) ( not ( = ?auto_27021 ?auto_27020 ) ) ( not ( = ?auto_27005 ?auto_27021 ) ) ( not ( = ?auto_27006 ?auto_27021 ) ) ( not ( = ?auto_27012 ?auto_27021 ) ) ( not ( = ?auto_27017 ?auto_27021 ) ) ( not ( = ?auto_27015 ?auto_27021 ) ) ( not ( = ?auto_27013 ?auto_27021 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27021 ?auto_27020 )
      ( MAKE-2CRATE ?auto_27012 ?auto_27005 ?auto_27006 )
      ( MAKE-1CRATE-VERIFY ?auto_27005 ?auto_27006 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27022 - SURFACE
      ?auto_27023 - SURFACE
      ?auto_27024 - SURFACE
    )
    :vars
    (
      ?auto_27036 - HOIST
      ?auto_27029 - PLACE
      ?auto_27026 - PLACE
      ?auto_27031 - HOIST
      ?auto_27035 - SURFACE
      ?auto_27027 - PLACE
      ?auto_27038 - HOIST
      ?auto_27025 - SURFACE
      ?auto_27034 - SURFACE
      ?auto_27032 - PLACE
      ?auto_27028 - HOIST
      ?auto_27037 - SURFACE
      ?auto_27030 - TRUCK
      ?auto_27033 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27036 ?auto_27029 ) ( IS-CRATE ?auto_27024 ) ( not ( = ?auto_27023 ?auto_27024 ) ) ( not ( = ?auto_27022 ?auto_27023 ) ) ( not ( = ?auto_27022 ?auto_27024 ) ) ( not ( = ?auto_27026 ?auto_27029 ) ) ( HOIST-AT ?auto_27031 ?auto_27026 ) ( not ( = ?auto_27036 ?auto_27031 ) ) ( AVAILABLE ?auto_27031 ) ( SURFACE-AT ?auto_27024 ?auto_27026 ) ( ON ?auto_27024 ?auto_27035 ) ( CLEAR ?auto_27024 ) ( not ( = ?auto_27023 ?auto_27035 ) ) ( not ( = ?auto_27024 ?auto_27035 ) ) ( not ( = ?auto_27022 ?auto_27035 ) ) ( IS-CRATE ?auto_27023 ) ( not ( = ?auto_27027 ?auto_27029 ) ) ( not ( = ?auto_27026 ?auto_27027 ) ) ( HOIST-AT ?auto_27038 ?auto_27027 ) ( not ( = ?auto_27036 ?auto_27038 ) ) ( not ( = ?auto_27031 ?auto_27038 ) ) ( AVAILABLE ?auto_27038 ) ( SURFACE-AT ?auto_27023 ?auto_27027 ) ( ON ?auto_27023 ?auto_27025 ) ( CLEAR ?auto_27023 ) ( not ( = ?auto_27023 ?auto_27025 ) ) ( not ( = ?auto_27024 ?auto_27025 ) ) ( not ( = ?auto_27022 ?auto_27025 ) ) ( not ( = ?auto_27035 ?auto_27025 ) ) ( IS-CRATE ?auto_27022 ) ( not ( = ?auto_27034 ?auto_27022 ) ) ( not ( = ?auto_27023 ?auto_27034 ) ) ( not ( = ?auto_27024 ?auto_27034 ) ) ( not ( = ?auto_27035 ?auto_27034 ) ) ( not ( = ?auto_27025 ?auto_27034 ) ) ( not ( = ?auto_27032 ?auto_27029 ) ) ( not ( = ?auto_27026 ?auto_27032 ) ) ( not ( = ?auto_27027 ?auto_27032 ) ) ( HOIST-AT ?auto_27028 ?auto_27032 ) ( not ( = ?auto_27036 ?auto_27028 ) ) ( not ( = ?auto_27031 ?auto_27028 ) ) ( not ( = ?auto_27038 ?auto_27028 ) ) ( AVAILABLE ?auto_27028 ) ( SURFACE-AT ?auto_27022 ?auto_27032 ) ( ON ?auto_27022 ?auto_27037 ) ( CLEAR ?auto_27022 ) ( not ( = ?auto_27023 ?auto_27037 ) ) ( not ( = ?auto_27024 ?auto_27037 ) ) ( not ( = ?auto_27022 ?auto_27037 ) ) ( not ( = ?auto_27035 ?auto_27037 ) ) ( not ( = ?auto_27025 ?auto_27037 ) ) ( not ( = ?auto_27034 ?auto_27037 ) ) ( TRUCK-AT ?auto_27030 ?auto_27029 ) ( SURFACE-AT ?auto_27033 ?auto_27029 ) ( CLEAR ?auto_27033 ) ( LIFTING ?auto_27036 ?auto_27034 ) ( IS-CRATE ?auto_27034 ) ( not ( = ?auto_27033 ?auto_27034 ) ) ( not ( = ?auto_27023 ?auto_27033 ) ) ( not ( = ?auto_27024 ?auto_27033 ) ) ( not ( = ?auto_27022 ?auto_27033 ) ) ( not ( = ?auto_27035 ?auto_27033 ) ) ( not ( = ?auto_27025 ?auto_27033 ) ) ( not ( = ?auto_27037 ?auto_27033 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27023 ?auto_27024 )
      ( MAKE-2CRATE-VERIFY ?auto_27022 ?auto_27023 ?auto_27024 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27039 - SURFACE
      ?auto_27040 - SURFACE
      ?auto_27041 - SURFACE
      ?auto_27042 - SURFACE
    )
    :vars
    (
      ?auto_27043 - HOIST
      ?auto_27047 - PLACE
      ?auto_27046 - PLACE
      ?auto_27045 - HOIST
      ?auto_27055 - SURFACE
      ?auto_27053 - PLACE
      ?auto_27054 - HOIST
      ?auto_27044 - SURFACE
      ?auto_27052 - PLACE
      ?auto_27049 - HOIST
      ?auto_27050 - SURFACE
      ?auto_27051 - TRUCK
      ?auto_27048 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27043 ?auto_27047 ) ( IS-CRATE ?auto_27042 ) ( not ( = ?auto_27041 ?auto_27042 ) ) ( not ( = ?auto_27040 ?auto_27041 ) ) ( not ( = ?auto_27040 ?auto_27042 ) ) ( not ( = ?auto_27046 ?auto_27047 ) ) ( HOIST-AT ?auto_27045 ?auto_27046 ) ( not ( = ?auto_27043 ?auto_27045 ) ) ( AVAILABLE ?auto_27045 ) ( SURFACE-AT ?auto_27042 ?auto_27046 ) ( ON ?auto_27042 ?auto_27055 ) ( CLEAR ?auto_27042 ) ( not ( = ?auto_27041 ?auto_27055 ) ) ( not ( = ?auto_27042 ?auto_27055 ) ) ( not ( = ?auto_27040 ?auto_27055 ) ) ( IS-CRATE ?auto_27041 ) ( not ( = ?auto_27053 ?auto_27047 ) ) ( not ( = ?auto_27046 ?auto_27053 ) ) ( HOIST-AT ?auto_27054 ?auto_27053 ) ( not ( = ?auto_27043 ?auto_27054 ) ) ( not ( = ?auto_27045 ?auto_27054 ) ) ( AVAILABLE ?auto_27054 ) ( SURFACE-AT ?auto_27041 ?auto_27053 ) ( ON ?auto_27041 ?auto_27044 ) ( CLEAR ?auto_27041 ) ( not ( = ?auto_27041 ?auto_27044 ) ) ( not ( = ?auto_27042 ?auto_27044 ) ) ( not ( = ?auto_27040 ?auto_27044 ) ) ( not ( = ?auto_27055 ?auto_27044 ) ) ( IS-CRATE ?auto_27040 ) ( not ( = ?auto_27039 ?auto_27040 ) ) ( not ( = ?auto_27041 ?auto_27039 ) ) ( not ( = ?auto_27042 ?auto_27039 ) ) ( not ( = ?auto_27055 ?auto_27039 ) ) ( not ( = ?auto_27044 ?auto_27039 ) ) ( not ( = ?auto_27052 ?auto_27047 ) ) ( not ( = ?auto_27046 ?auto_27052 ) ) ( not ( = ?auto_27053 ?auto_27052 ) ) ( HOIST-AT ?auto_27049 ?auto_27052 ) ( not ( = ?auto_27043 ?auto_27049 ) ) ( not ( = ?auto_27045 ?auto_27049 ) ) ( not ( = ?auto_27054 ?auto_27049 ) ) ( AVAILABLE ?auto_27049 ) ( SURFACE-AT ?auto_27040 ?auto_27052 ) ( ON ?auto_27040 ?auto_27050 ) ( CLEAR ?auto_27040 ) ( not ( = ?auto_27041 ?auto_27050 ) ) ( not ( = ?auto_27042 ?auto_27050 ) ) ( not ( = ?auto_27040 ?auto_27050 ) ) ( not ( = ?auto_27055 ?auto_27050 ) ) ( not ( = ?auto_27044 ?auto_27050 ) ) ( not ( = ?auto_27039 ?auto_27050 ) ) ( TRUCK-AT ?auto_27051 ?auto_27047 ) ( SURFACE-AT ?auto_27048 ?auto_27047 ) ( CLEAR ?auto_27048 ) ( LIFTING ?auto_27043 ?auto_27039 ) ( IS-CRATE ?auto_27039 ) ( not ( = ?auto_27048 ?auto_27039 ) ) ( not ( = ?auto_27041 ?auto_27048 ) ) ( not ( = ?auto_27042 ?auto_27048 ) ) ( not ( = ?auto_27040 ?auto_27048 ) ) ( not ( = ?auto_27055 ?auto_27048 ) ) ( not ( = ?auto_27044 ?auto_27048 ) ) ( not ( = ?auto_27050 ?auto_27048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27040 ?auto_27041 ?auto_27042 )
      ( MAKE-3CRATE-VERIFY ?auto_27039 ?auto_27040 ?auto_27041 ?auto_27042 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27056 - SURFACE
      ?auto_27057 - SURFACE
      ?auto_27058 - SURFACE
      ?auto_27059 - SURFACE
      ?auto_27060 - SURFACE
    )
    :vars
    (
      ?auto_27061 - HOIST
      ?auto_27065 - PLACE
      ?auto_27064 - PLACE
      ?auto_27063 - HOIST
      ?auto_27072 - SURFACE
      ?auto_27070 - PLACE
      ?auto_27071 - HOIST
      ?auto_27062 - SURFACE
      ?auto_27069 - PLACE
      ?auto_27066 - HOIST
      ?auto_27067 - SURFACE
      ?auto_27068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27061 ?auto_27065 ) ( IS-CRATE ?auto_27060 ) ( not ( = ?auto_27059 ?auto_27060 ) ) ( not ( = ?auto_27058 ?auto_27059 ) ) ( not ( = ?auto_27058 ?auto_27060 ) ) ( not ( = ?auto_27064 ?auto_27065 ) ) ( HOIST-AT ?auto_27063 ?auto_27064 ) ( not ( = ?auto_27061 ?auto_27063 ) ) ( AVAILABLE ?auto_27063 ) ( SURFACE-AT ?auto_27060 ?auto_27064 ) ( ON ?auto_27060 ?auto_27072 ) ( CLEAR ?auto_27060 ) ( not ( = ?auto_27059 ?auto_27072 ) ) ( not ( = ?auto_27060 ?auto_27072 ) ) ( not ( = ?auto_27058 ?auto_27072 ) ) ( IS-CRATE ?auto_27059 ) ( not ( = ?auto_27070 ?auto_27065 ) ) ( not ( = ?auto_27064 ?auto_27070 ) ) ( HOIST-AT ?auto_27071 ?auto_27070 ) ( not ( = ?auto_27061 ?auto_27071 ) ) ( not ( = ?auto_27063 ?auto_27071 ) ) ( AVAILABLE ?auto_27071 ) ( SURFACE-AT ?auto_27059 ?auto_27070 ) ( ON ?auto_27059 ?auto_27062 ) ( CLEAR ?auto_27059 ) ( not ( = ?auto_27059 ?auto_27062 ) ) ( not ( = ?auto_27060 ?auto_27062 ) ) ( not ( = ?auto_27058 ?auto_27062 ) ) ( not ( = ?auto_27072 ?auto_27062 ) ) ( IS-CRATE ?auto_27058 ) ( not ( = ?auto_27057 ?auto_27058 ) ) ( not ( = ?auto_27059 ?auto_27057 ) ) ( not ( = ?auto_27060 ?auto_27057 ) ) ( not ( = ?auto_27072 ?auto_27057 ) ) ( not ( = ?auto_27062 ?auto_27057 ) ) ( not ( = ?auto_27069 ?auto_27065 ) ) ( not ( = ?auto_27064 ?auto_27069 ) ) ( not ( = ?auto_27070 ?auto_27069 ) ) ( HOIST-AT ?auto_27066 ?auto_27069 ) ( not ( = ?auto_27061 ?auto_27066 ) ) ( not ( = ?auto_27063 ?auto_27066 ) ) ( not ( = ?auto_27071 ?auto_27066 ) ) ( AVAILABLE ?auto_27066 ) ( SURFACE-AT ?auto_27058 ?auto_27069 ) ( ON ?auto_27058 ?auto_27067 ) ( CLEAR ?auto_27058 ) ( not ( = ?auto_27059 ?auto_27067 ) ) ( not ( = ?auto_27060 ?auto_27067 ) ) ( not ( = ?auto_27058 ?auto_27067 ) ) ( not ( = ?auto_27072 ?auto_27067 ) ) ( not ( = ?auto_27062 ?auto_27067 ) ) ( not ( = ?auto_27057 ?auto_27067 ) ) ( TRUCK-AT ?auto_27068 ?auto_27065 ) ( SURFACE-AT ?auto_27056 ?auto_27065 ) ( CLEAR ?auto_27056 ) ( LIFTING ?auto_27061 ?auto_27057 ) ( IS-CRATE ?auto_27057 ) ( not ( = ?auto_27056 ?auto_27057 ) ) ( not ( = ?auto_27059 ?auto_27056 ) ) ( not ( = ?auto_27060 ?auto_27056 ) ) ( not ( = ?auto_27058 ?auto_27056 ) ) ( not ( = ?auto_27072 ?auto_27056 ) ) ( not ( = ?auto_27062 ?auto_27056 ) ) ( not ( = ?auto_27067 ?auto_27056 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27058 ?auto_27059 ?auto_27060 )
      ( MAKE-4CRATE-VERIFY ?auto_27056 ?auto_27057 ?auto_27058 ?auto_27059 ?auto_27060 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27073 - SURFACE
      ?auto_27074 - SURFACE
      ?auto_27075 - SURFACE
      ?auto_27076 - SURFACE
      ?auto_27077 - SURFACE
      ?auto_27078 - SURFACE
    )
    :vars
    (
      ?auto_27079 - HOIST
      ?auto_27083 - PLACE
      ?auto_27082 - PLACE
      ?auto_27081 - HOIST
      ?auto_27090 - SURFACE
      ?auto_27088 - PLACE
      ?auto_27089 - HOIST
      ?auto_27080 - SURFACE
      ?auto_27087 - PLACE
      ?auto_27084 - HOIST
      ?auto_27085 - SURFACE
      ?auto_27086 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27079 ?auto_27083 ) ( IS-CRATE ?auto_27078 ) ( not ( = ?auto_27077 ?auto_27078 ) ) ( not ( = ?auto_27076 ?auto_27077 ) ) ( not ( = ?auto_27076 ?auto_27078 ) ) ( not ( = ?auto_27082 ?auto_27083 ) ) ( HOIST-AT ?auto_27081 ?auto_27082 ) ( not ( = ?auto_27079 ?auto_27081 ) ) ( AVAILABLE ?auto_27081 ) ( SURFACE-AT ?auto_27078 ?auto_27082 ) ( ON ?auto_27078 ?auto_27090 ) ( CLEAR ?auto_27078 ) ( not ( = ?auto_27077 ?auto_27090 ) ) ( not ( = ?auto_27078 ?auto_27090 ) ) ( not ( = ?auto_27076 ?auto_27090 ) ) ( IS-CRATE ?auto_27077 ) ( not ( = ?auto_27088 ?auto_27083 ) ) ( not ( = ?auto_27082 ?auto_27088 ) ) ( HOIST-AT ?auto_27089 ?auto_27088 ) ( not ( = ?auto_27079 ?auto_27089 ) ) ( not ( = ?auto_27081 ?auto_27089 ) ) ( AVAILABLE ?auto_27089 ) ( SURFACE-AT ?auto_27077 ?auto_27088 ) ( ON ?auto_27077 ?auto_27080 ) ( CLEAR ?auto_27077 ) ( not ( = ?auto_27077 ?auto_27080 ) ) ( not ( = ?auto_27078 ?auto_27080 ) ) ( not ( = ?auto_27076 ?auto_27080 ) ) ( not ( = ?auto_27090 ?auto_27080 ) ) ( IS-CRATE ?auto_27076 ) ( not ( = ?auto_27075 ?auto_27076 ) ) ( not ( = ?auto_27077 ?auto_27075 ) ) ( not ( = ?auto_27078 ?auto_27075 ) ) ( not ( = ?auto_27090 ?auto_27075 ) ) ( not ( = ?auto_27080 ?auto_27075 ) ) ( not ( = ?auto_27087 ?auto_27083 ) ) ( not ( = ?auto_27082 ?auto_27087 ) ) ( not ( = ?auto_27088 ?auto_27087 ) ) ( HOIST-AT ?auto_27084 ?auto_27087 ) ( not ( = ?auto_27079 ?auto_27084 ) ) ( not ( = ?auto_27081 ?auto_27084 ) ) ( not ( = ?auto_27089 ?auto_27084 ) ) ( AVAILABLE ?auto_27084 ) ( SURFACE-AT ?auto_27076 ?auto_27087 ) ( ON ?auto_27076 ?auto_27085 ) ( CLEAR ?auto_27076 ) ( not ( = ?auto_27077 ?auto_27085 ) ) ( not ( = ?auto_27078 ?auto_27085 ) ) ( not ( = ?auto_27076 ?auto_27085 ) ) ( not ( = ?auto_27090 ?auto_27085 ) ) ( not ( = ?auto_27080 ?auto_27085 ) ) ( not ( = ?auto_27075 ?auto_27085 ) ) ( TRUCK-AT ?auto_27086 ?auto_27083 ) ( SURFACE-AT ?auto_27074 ?auto_27083 ) ( CLEAR ?auto_27074 ) ( LIFTING ?auto_27079 ?auto_27075 ) ( IS-CRATE ?auto_27075 ) ( not ( = ?auto_27074 ?auto_27075 ) ) ( not ( = ?auto_27077 ?auto_27074 ) ) ( not ( = ?auto_27078 ?auto_27074 ) ) ( not ( = ?auto_27076 ?auto_27074 ) ) ( not ( = ?auto_27090 ?auto_27074 ) ) ( not ( = ?auto_27080 ?auto_27074 ) ) ( not ( = ?auto_27085 ?auto_27074 ) ) ( ON ?auto_27074 ?auto_27073 ) ( not ( = ?auto_27073 ?auto_27074 ) ) ( not ( = ?auto_27073 ?auto_27075 ) ) ( not ( = ?auto_27073 ?auto_27076 ) ) ( not ( = ?auto_27073 ?auto_27077 ) ) ( not ( = ?auto_27073 ?auto_27078 ) ) ( not ( = ?auto_27073 ?auto_27090 ) ) ( not ( = ?auto_27073 ?auto_27080 ) ) ( not ( = ?auto_27073 ?auto_27085 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27076 ?auto_27077 ?auto_27078 )
      ( MAKE-5CRATE-VERIFY ?auto_27073 ?auto_27074 ?auto_27075 ?auto_27076 ?auto_27077 ?auto_27078 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27091 - SURFACE
      ?auto_27092 - SURFACE
    )
    :vars
    (
      ?auto_27093 - HOIST
      ?auto_27097 - PLACE
      ?auto_27102 - SURFACE
      ?auto_27096 - PLACE
      ?auto_27095 - HOIST
      ?auto_27106 - SURFACE
      ?auto_27104 - PLACE
      ?auto_27105 - HOIST
      ?auto_27094 - SURFACE
      ?auto_27107 - SURFACE
      ?auto_27103 - PLACE
      ?auto_27099 - HOIST
      ?auto_27100 - SURFACE
      ?auto_27101 - TRUCK
      ?auto_27098 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27093 ?auto_27097 ) ( IS-CRATE ?auto_27092 ) ( not ( = ?auto_27091 ?auto_27092 ) ) ( not ( = ?auto_27102 ?auto_27091 ) ) ( not ( = ?auto_27102 ?auto_27092 ) ) ( not ( = ?auto_27096 ?auto_27097 ) ) ( HOIST-AT ?auto_27095 ?auto_27096 ) ( not ( = ?auto_27093 ?auto_27095 ) ) ( AVAILABLE ?auto_27095 ) ( SURFACE-AT ?auto_27092 ?auto_27096 ) ( ON ?auto_27092 ?auto_27106 ) ( CLEAR ?auto_27092 ) ( not ( = ?auto_27091 ?auto_27106 ) ) ( not ( = ?auto_27092 ?auto_27106 ) ) ( not ( = ?auto_27102 ?auto_27106 ) ) ( IS-CRATE ?auto_27091 ) ( not ( = ?auto_27104 ?auto_27097 ) ) ( not ( = ?auto_27096 ?auto_27104 ) ) ( HOIST-AT ?auto_27105 ?auto_27104 ) ( not ( = ?auto_27093 ?auto_27105 ) ) ( not ( = ?auto_27095 ?auto_27105 ) ) ( AVAILABLE ?auto_27105 ) ( SURFACE-AT ?auto_27091 ?auto_27104 ) ( ON ?auto_27091 ?auto_27094 ) ( CLEAR ?auto_27091 ) ( not ( = ?auto_27091 ?auto_27094 ) ) ( not ( = ?auto_27092 ?auto_27094 ) ) ( not ( = ?auto_27102 ?auto_27094 ) ) ( not ( = ?auto_27106 ?auto_27094 ) ) ( IS-CRATE ?auto_27102 ) ( not ( = ?auto_27107 ?auto_27102 ) ) ( not ( = ?auto_27091 ?auto_27107 ) ) ( not ( = ?auto_27092 ?auto_27107 ) ) ( not ( = ?auto_27106 ?auto_27107 ) ) ( not ( = ?auto_27094 ?auto_27107 ) ) ( not ( = ?auto_27103 ?auto_27097 ) ) ( not ( = ?auto_27096 ?auto_27103 ) ) ( not ( = ?auto_27104 ?auto_27103 ) ) ( HOIST-AT ?auto_27099 ?auto_27103 ) ( not ( = ?auto_27093 ?auto_27099 ) ) ( not ( = ?auto_27095 ?auto_27099 ) ) ( not ( = ?auto_27105 ?auto_27099 ) ) ( AVAILABLE ?auto_27099 ) ( SURFACE-AT ?auto_27102 ?auto_27103 ) ( ON ?auto_27102 ?auto_27100 ) ( CLEAR ?auto_27102 ) ( not ( = ?auto_27091 ?auto_27100 ) ) ( not ( = ?auto_27092 ?auto_27100 ) ) ( not ( = ?auto_27102 ?auto_27100 ) ) ( not ( = ?auto_27106 ?auto_27100 ) ) ( not ( = ?auto_27094 ?auto_27100 ) ) ( not ( = ?auto_27107 ?auto_27100 ) ) ( TRUCK-AT ?auto_27101 ?auto_27097 ) ( SURFACE-AT ?auto_27098 ?auto_27097 ) ( CLEAR ?auto_27098 ) ( IS-CRATE ?auto_27107 ) ( not ( = ?auto_27098 ?auto_27107 ) ) ( not ( = ?auto_27091 ?auto_27098 ) ) ( not ( = ?auto_27092 ?auto_27098 ) ) ( not ( = ?auto_27102 ?auto_27098 ) ) ( not ( = ?auto_27106 ?auto_27098 ) ) ( not ( = ?auto_27094 ?auto_27098 ) ) ( not ( = ?auto_27100 ?auto_27098 ) ) ( AVAILABLE ?auto_27093 ) ( IN ?auto_27107 ?auto_27101 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27093 ?auto_27107 ?auto_27101 ?auto_27097 )
      ( MAKE-2CRATE ?auto_27102 ?auto_27091 ?auto_27092 )
      ( MAKE-1CRATE-VERIFY ?auto_27091 ?auto_27092 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27108 - SURFACE
      ?auto_27109 - SURFACE
      ?auto_27110 - SURFACE
    )
    :vars
    (
      ?auto_27122 - HOIST
      ?auto_27117 - PLACE
      ?auto_27115 - PLACE
      ?auto_27113 - HOIST
      ?auto_27114 - SURFACE
      ?auto_27123 - PLACE
      ?auto_27124 - HOIST
      ?auto_27120 - SURFACE
      ?auto_27121 - SURFACE
      ?auto_27119 - PLACE
      ?auto_27116 - HOIST
      ?auto_27111 - SURFACE
      ?auto_27112 - TRUCK
      ?auto_27118 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27122 ?auto_27117 ) ( IS-CRATE ?auto_27110 ) ( not ( = ?auto_27109 ?auto_27110 ) ) ( not ( = ?auto_27108 ?auto_27109 ) ) ( not ( = ?auto_27108 ?auto_27110 ) ) ( not ( = ?auto_27115 ?auto_27117 ) ) ( HOIST-AT ?auto_27113 ?auto_27115 ) ( not ( = ?auto_27122 ?auto_27113 ) ) ( AVAILABLE ?auto_27113 ) ( SURFACE-AT ?auto_27110 ?auto_27115 ) ( ON ?auto_27110 ?auto_27114 ) ( CLEAR ?auto_27110 ) ( not ( = ?auto_27109 ?auto_27114 ) ) ( not ( = ?auto_27110 ?auto_27114 ) ) ( not ( = ?auto_27108 ?auto_27114 ) ) ( IS-CRATE ?auto_27109 ) ( not ( = ?auto_27123 ?auto_27117 ) ) ( not ( = ?auto_27115 ?auto_27123 ) ) ( HOIST-AT ?auto_27124 ?auto_27123 ) ( not ( = ?auto_27122 ?auto_27124 ) ) ( not ( = ?auto_27113 ?auto_27124 ) ) ( AVAILABLE ?auto_27124 ) ( SURFACE-AT ?auto_27109 ?auto_27123 ) ( ON ?auto_27109 ?auto_27120 ) ( CLEAR ?auto_27109 ) ( not ( = ?auto_27109 ?auto_27120 ) ) ( not ( = ?auto_27110 ?auto_27120 ) ) ( not ( = ?auto_27108 ?auto_27120 ) ) ( not ( = ?auto_27114 ?auto_27120 ) ) ( IS-CRATE ?auto_27108 ) ( not ( = ?auto_27121 ?auto_27108 ) ) ( not ( = ?auto_27109 ?auto_27121 ) ) ( not ( = ?auto_27110 ?auto_27121 ) ) ( not ( = ?auto_27114 ?auto_27121 ) ) ( not ( = ?auto_27120 ?auto_27121 ) ) ( not ( = ?auto_27119 ?auto_27117 ) ) ( not ( = ?auto_27115 ?auto_27119 ) ) ( not ( = ?auto_27123 ?auto_27119 ) ) ( HOIST-AT ?auto_27116 ?auto_27119 ) ( not ( = ?auto_27122 ?auto_27116 ) ) ( not ( = ?auto_27113 ?auto_27116 ) ) ( not ( = ?auto_27124 ?auto_27116 ) ) ( AVAILABLE ?auto_27116 ) ( SURFACE-AT ?auto_27108 ?auto_27119 ) ( ON ?auto_27108 ?auto_27111 ) ( CLEAR ?auto_27108 ) ( not ( = ?auto_27109 ?auto_27111 ) ) ( not ( = ?auto_27110 ?auto_27111 ) ) ( not ( = ?auto_27108 ?auto_27111 ) ) ( not ( = ?auto_27114 ?auto_27111 ) ) ( not ( = ?auto_27120 ?auto_27111 ) ) ( not ( = ?auto_27121 ?auto_27111 ) ) ( TRUCK-AT ?auto_27112 ?auto_27117 ) ( SURFACE-AT ?auto_27118 ?auto_27117 ) ( CLEAR ?auto_27118 ) ( IS-CRATE ?auto_27121 ) ( not ( = ?auto_27118 ?auto_27121 ) ) ( not ( = ?auto_27109 ?auto_27118 ) ) ( not ( = ?auto_27110 ?auto_27118 ) ) ( not ( = ?auto_27108 ?auto_27118 ) ) ( not ( = ?auto_27114 ?auto_27118 ) ) ( not ( = ?auto_27120 ?auto_27118 ) ) ( not ( = ?auto_27111 ?auto_27118 ) ) ( AVAILABLE ?auto_27122 ) ( IN ?auto_27121 ?auto_27112 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27109 ?auto_27110 )
      ( MAKE-2CRATE-VERIFY ?auto_27108 ?auto_27109 ?auto_27110 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27125 - SURFACE
      ?auto_27126 - SURFACE
      ?auto_27127 - SURFACE
      ?auto_27128 - SURFACE
    )
    :vars
    (
      ?auto_27132 - HOIST
      ?auto_27137 - PLACE
      ?auto_27139 - PLACE
      ?auto_27140 - HOIST
      ?auto_27129 - SURFACE
      ?auto_27141 - PLACE
      ?auto_27135 - HOIST
      ?auto_27133 - SURFACE
      ?auto_27136 - PLACE
      ?auto_27138 - HOIST
      ?auto_27134 - SURFACE
      ?auto_27131 - TRUCK
      ?auto_27130 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27132 ?auto_27137 ) ( IS-CRATE ?auto_27128 ) ( not ( = ?auto_27127 ?auto_27128 ) ) ( not ( = ?auto_27126 ?auto_27127 ) ) ( not ( = ?auto_27126 ?auto_27128 ) ) ( not ( = ?auto_27139 ?auto_27137 ) ) ( HOIST-AT ?auto_27140 ?auto_27139 ) ( not ( = ?auto_27132 ?auto_27140 ) ) ( AVAILABLE ?auto_27140 ) ( SURFACE-AT ?auto_27128 ?auto_27139 ) ( ON ?auto_27128 ?auto_27129 ) ( CLEAR ?auto_27128 ) ( not ( = ?auto_27127 ?auto_27129 ) ) ( not ( = ?auto_27128 ?auto_27129 ) ) ( not ( = ?auto_27126 ?auto_27129 ) ) ( IS-CRATE ?auto_27127 ) ( not ( = ?auto_27141 ?auto_27137 ) ) ( not ( = ?auto_27139 ?auto_27141 ) ) ( HOIST-AT ?auto_27135 ?auto_27141 ) ( not ( = ?auto_27132 ?auto_27135 ) ) ( not ( = ?auto_27140 ?auto_27135 ) ) ( AVAILABLE ?auto_27135 ) ( SURFACE-AT ?auto_27127 ?auto_27141 ) ( ON ?auto_27127 ?auto_27133 ) ( CLEAR ?auto_27127 ) ( not ( = ?auto_27127 ?auto_27133 ) ) ( not ( = ?auto_27128 ?auto_27133 ) ) ( not ( = ?auto_27126 ?auto_27133 ) ) ( not ( = ?auto_27129 ?auto_27133 ) ) ( IS-CRATE ?auto_27126 ) ( not ( = ?auto_27125 ?auto_27126 ) ) ( not ( = ?auto_27127 ?auto_27125 ) ) ( not ( = ?auto_27128 ?auto_27125 ) ) ( not ( = ?auto_27129 ?auto_27125 ) ) ( not ( = ?auto_27133 ?auto_27125 ) ) ( not ( = ?auto_27136 ?auto_27137 ) ) ( not ( = ?auto_27139 ?auto_27136 ) ) ( not ( = ?auto_27141 ?auto_27136 ) ) ( HOIST-AT ?auto_27138 ?auto_27136 ) ( not ( = ?auto_27132 ?auto_27138 ) ) ( not ( = ?auto_27140 ?auto_27138 ) ) ( not ( = ?auto_27135 ?auto_27138 ) ) ( AVAILABLE ?auto_27138 ) ( SURFACE-AT ?auto_27126 ?auto_27136 ) ( ON ?auto_27126 ?auto_27134 ) ( CLEAR ?auto_27126 ) ( not ( = ?auto_27127 ?auto_27134 ) ) ( not ( = ?auto_27128 ?auto_27134 ) ) ( not ( = ?auto_27126 ?auto_27134 ) ) ( not ( = ?auto_27129 ?auto_27134 ) ) ( not ( = ?auto_27133 ?auto_27134 ) ) ( not ( = ?auto_27125 ?auto_27134 ) ) ( TRUCK-AT ?auto_27131 ?auto_27137 ) ( SURFACE-AT ?auto_27130 ?auto_27137 ) ( CLEAR ?auto_27130 ) ( IS-CRATE ?auto_27125 ) ( not ( = ?auto_27130 ?auto_27125 ) ) ( not ( = ?auto_27127 ?auto_27130 ) ) ( not ( = ?auto_27128 ?auto_27130 ) ) ( not ( = ?auto_27126 ?auto_27130 ) ) ( not ( = ?auto_27129 ?auto_27130 ) ) ( not ( = ?auto_27133 ?auto_27130 ) ) ( not ( = ?auto_27134 ?auto_27130 ) ) ( AVAILABLE ?auto_27132 ) ( IN ?auto_27125 ?auto_27131 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27126 ?auto_27127 ?auto_27128 )
      ( MAKE-3CRATE-VERIFY ?auto_27125 ?auto_27126 ?auto_27127 ?auto_27128 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27142 - SURFACE
      ?auto_27143 - SURFACE
      ?auto_27144 - SURFACE
      ?auto_27145 - SURFACE
      ?auto_27146 - SURFACE
    )
    :vars
    (
      ?auto_27149 - HOIST
      ?auto_27154 - PLACE
      ?auto_27156 - PLACE
      ?auto_27157 - HOIST
      ?auto_27147 - SURFACE
      ?auto_27158 - PLACE
      ?auto_27152 - HOIST
      ?auto_27150 - SURFACE
      ?auto_27153 - PLACE
      ?auto_27155 - HOIST
      ?auto_27151 - SURFACE
      ?auto_27148 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27149 ?auto_27154 ) ( IS-CRATE ?auto_27146 ) ( not ( = ?auto_27145 ?auto_27146 ) ) ( not ( = ?auto_27144 ?auto_27145 ) ) ( not ( = ?auto_27144 ?auto_27146 ) ) ( not ( = ?auto_27156 ?auto_27154 ) ) ( HOIST-AT ?auto_27157 ?auto_27156 ) ( not ( = ?auto_27149 ?auto_27157 ) ) ( AVAILABLE ?auto_27157 ) ( SURFACE-AT ?auto_27146 ?auto_27156 ) ( ON ?auto_27146 ?auto_27147 ) ( CLEAR ?auto_27146 ) ( not ( = ?auto_27145 ?auto_27147 ) ) ( not ( = ?auto_27146 ?auto_27147 ) ) ( not ( = ?auto_27144 ?auto_27147 ) ) ( IS-CRATE ?auto_27145 ) ( not ( = ?auto_27158 ?auto_27154 ) ) ( not ( = ?auto_27156 ?auto_27158 ) ) ( HOIST-AT ?auto_27152 ?auto_27158 ) ( not ( = ?auto_27149 ?auto_27152 ) ) ( not ( = ?auto_27157 ?auto_27152 ) ) ( AVAILABLE ?auto_27152 ) ( SURFACE-AT ?auto_27145 ?auto_27158 ) ( ON ?auto_27145 ?auto_27150 ) ( CLEAR ?auto_27145 ) ( not ( = ?auto_27145 ?auto_27150 ) ) ( not ( = ?auto_27146 ?auto_27150 ) ) ( not ( = ?auto_27144 ?auto_27150 ) ) ( not ( = ?auto_27147 ?auto_27150 ) ) ( IS-CRATE ?auto_27144 ) ( not ( = ?auto_27143 ?auto_27144 ) ) ( not ( = ?auto_27145 ?auto_27143 ) ) ( not ( = ?auto_27146 ?auto_27143 ) ) ( not ( = ?auto_27147 ?auto_27143 ) ) ( not ( = ?auto_27150 ?auto_27143 ) ) ( not ( = ?auto_27153 ?auto_27154 ) ) ( not ( = ?auto_27156 ?auto_27153 ) ) ( not ( = ?auto_27158 ?auto_27153 ) ) ( HOIST-AT ?auto_27155 ?auto_27153 ) ( not ( = ?auto_27149 ?auto_27155 ) ) ( not ( = ?auto_27157 ?auto_27155 ) ) ( not ( = ?auto_27152 ?auto_27155 ) ) ( AVAILABLE ?auto_27155 ) ( SURFACE-AT ?auto_27144 ?auto_27153 ) ( ON ?auto_27144 ?auto_27151 ) ( CLEAR ?auto_27144 ) ( not ( = ?auto_27145 ?auto_27151 ) ) ( not ( = ?auto_27146 ?auto_27151 ) ) ( not ( = ?auto_27144 ?auto_27151 ) ) ( not ( = ?auto_27147 ?auto_27151 ) ) ( not ( = ?auto_27150 ?auto_27151 ) ) ( not ( = ?auto_27143 ?auto_27151 ) ) ( TRUCK-AT ?auto_27148 ?auto_27154 ) ( SURFACE-AT ?auto_27142 ?auto_27154 ) ( CLEAR ?auto_27142 ) ( IS-CRATE ?auto_27143 ) ( not ( = ?auto_27142 ?auto_27143 ) ) ( not ( = ?auto_27145 ?auto_27142 ) ) ( not ( = ?auto_27146 ?auto_27142 ) ) ( not ( = ?auto_27144 ?auto_27142 ) ) ( not ( = ?auto_27147 ?auto_27142 ) ) ( not ( = ?auto_27150 ?auto_27142 ) ) ( not ( = ?auto_27151 ?auto_27142 ) ) ( AVAILABLE ?auto_27149 ) ( IN ?auto_27143 ?auto_27148 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27144 ?auto_27145 ?auto_27146 )
      ( MAKE-4CRATE-VERIFY ?auto_27142 ?auto_27143 ?auto_27144 ?auto_27145 ?auto_27146 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27159 - SURFACE
      ?auto_27160 - SURFACE
      ?auto_27161 - SURFACE
      ?auto_27162 - SURFACE
      ?auto_27163 - SURFACE
      ?auto_27164 - SURFACE
    )
    :vars
    (
      ?auto_27167 - HOIST
      ?auto_27172 - PLACE
      ?auto_27174 - PLACE
      ?auto_27175 - HOIST
      ?auto_27165 - SURFACE
      ?auto_27176 - PLACE
      ?auto_27170 - HOIST
      ?auto_27168 - SURFACE
      ?auto_27171 - PLACE
      ?auto_27173 - HOIST
      ?auto_27169 - SURFACE
      ?auto_27166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27167 ?auto_27172 ) ( IS-CRATE ?auto_27164 ) ( not ( = ?auto_27163 ?auto_27164 ) ) ( not ( = ?auto_27162 ?auto_27163 ) ) ( not ( = ?auto_27162 ?auto_27164 ) ) ( not ( = ?auto_27174 ?auto_27172 ) ) ( HOIST-AT ?auto_27175 ?auto_27174 ) ( not ( = ?auto_27167 ?auto_27175 ) ) ( AVAILABLE ?auto_27175 ) ( SURFACE-AT ?auto_27164 ?auto_27174 ) ( ON ?auto_27164 ?auto_27165 ) ( CLEAR ?auto_27164 ) ( not ( = ?auto_27163 ?auto_27165 ) ) ( not ( = ?auto_27164 ?auto_27165 ) ) ( not ( = ?auto_27162 ?auto_27165 ) ) ( IS-CRATE ?auto_27163 ) ( not ( = ?auto_27176 ?auto_27172 ) ) ( not ( = ?auto_27174 ?auto_27176 ) ) ( HOIST-AT ?auto_27170 ?auto_27176 ) ( not ( = ?auto_27167 ?auto_27170 ) ) ( not ( = ?auto_27175 ?auto_27170 ) ) ( AVAILABLE ?auto_27170 ) ( SURFACE-AT ?auto_27163 ?auto_27176 ) ( ON ?auto_27163 ?auto_27168 ) ( CLEAR ?auto_27163 ) ( not ( = ?auto_27163 ?auto_27168 ) ) ( not ( = ?auto_27164 ?auto_27168 ) ) ( not ( = ?auto_27162 ?auto_27168 ) ) ( not ( = ?auto_27165 ?auto_27168 ) ) ( IS-CRATE ?auto_27162 ) ( not ( = ?auto_27161 ?auto_27162 ) ) ( not ( = ?auto_27163 ?auto_27161 ) ) ( not ( = ?auto_27164 ?auto_27161 ) ) ( not ( = ?auto_27165 ?auto_27161 ) ) ( not ( = ?auto_27168 ?auto_27161 ) ) ( not ( = ?auto_27171 ?auto_27172 ) ) ( not ( = ?auto_27174 ?auto_27171 ) ) ( not ( = ?auto_27176 ?auto_27171 ) ) ( HOIST-AT ?auto_27173 ?auto_27171 ) ( not ( = ?auto_27167 ?auto_27173 ) ) ( not ( = ?auto_27175 ?auto_27173 ) ) ( not ( = ?auto_27170 ?auto_27173 ) ) ( AVAILABLE ?auto_27173 ) ( SURFACE-AT ?auto_27162 ?auto_27171 ) ( ON ?auto_27162 ?auto_27169 ) ( CLEAR ?auto_27162 ) ( not ( = ?auto_27163 ?auto_27169 ) ) ( not ( = ?auto_27164 ?auto_27169 ) ) ( not ( = ?auto_27162 ?auto_27169 ) ) ( not ( = ?auto_27165 ?auto_27169 ) ) ( not ( = ?auto_27168 ?auto_27169 ) ) ( not ( = ?auto_27161 ?auto_27169 ) ) ( TRUCK-AT ?auto_27166 ?auto_27172 ) ( SURFACE-AT ?auto_27160 ?auto_27172 ) ( CLEAR ?auto_27160 ) ( IS-CRATE ?auto_27161 ) ( not ( = ?auto_27160 ?auto_27161 ) ) ( not ( = ?auto_27163 ?auto_27160 ) ) ( not ( = ?auto_27164 ?auto_27160 ) ) ( not ( = ?auto_27162 ?auto_27160 ) ) ( not ( = ?auto_27165 ?auto_27160 ) ) ( not ( = ?auto_27168 ?auto_27160 ) ) ( not ( = ?auto_27169 ?auto_27160 ) ) ( AVAILABLE ?auto_27167 ) ( IN ?auto_27161 ?auto_27166 ) ( ON ?auto_27160 ?auto_27159 ) ( not ( = ?auto_27159 ?auto_27160 ) ) ( not ( = ?auto_27159 ?auto_27161 ) ) ( not ( = ?auto_27159 ?auto_27162 ) ) ( not ( = ?auto_27159 ?auto_27163 ) ) ( not ( = ?auto_27159 ?auto_27164 ) ) ( not ( = ?auto_27159 ?auto_27165 ) ) ( not ( = ?auto_27159 ?auto_27168 ) ) ( not ( = ?auto_27159 ?auto_27169 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27162 ?auto_27163 ?auto_27164 )
      ( MAKE-5CRATE-VERIFY ?auto_27159 ?auto_27160 ?auto_27161 ?auto_27162 ?auto_27163 ?auto_27164 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27177 - SURFACE
      ?auto_27178 - SURFACE
    )
    :vars
    (
      ?auto_27182 - HOIST
      ?auto_27187 - PLACE
      ?auto_27193 - SURFACE
      ?auto_27189 - PLACE
      ?auto_27191 - HOIST
      ?auto_27179 - SURFACE
      ?auto_27192 - PLACE
      ?auto_27185 - HOIST
      ?auto_27183 - SURFACE
      ?auto_27190 - SURFACE
      ?auto_27186 - PLACE
      ?auto_27188 - HOIST
      ?auto_27184 - SURFACE
      ?auto_27180 - SURFACE
      ?auto_27181 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27182 ?auto_27187 ) ( IS-CRATE ?auto_27178 ) ( not ( = ?auto_27177 ?auto_27178 ) ) ( not ( = ?auto_27193 ?auto_27177 ) ) ( not ( = ?auto_27193 ?auto_27178 ) ) ( not ( = ?auto_27189 ?auto_27187 ) ) ( HOIST-AT ?auto_27191 ?auto_27189 ) ( not ( = ?auto_27182 ?auto_27191 ) ) ( AVAILABLE ?auto_27191 ) ( SURFACE-AT ?auto_27178 ?auto_27189 ) ( ON ?auto_27178 ?auto_27179 ) ( CLEAR ?auto_27178 ) ( not ( = ?auto_27177 ?auto_27179 ) ) ( not ( = ?auto_27178 ?auto_27179 ) ) ( not ( = ?auto_27193 ?auto_27179 ) ) ( IS-CRATE ?auto_27177 ) ( not ( = ?auto_27192 ?auto_27187 ) ) ( not ( = ?auto_27189 ?auto_27192 ) ) ( HOIST-AT ?auto_27185 ?auto_27192 ) ( not ( = ?auto_27182 ?auto_27185 ) ) ( not ( = ?auto_27191 ?auto_27185 ) ) ( AVAILABLE ?auto_27185 ) ( SURFACE-AT ?auto_27177 ?auto_27192 ) ( ON ?auto_27177 ?auto_27183 ) ( CLEAR ?auto_27177 ) ( not ( = ?auto_27177 ?auto_27183 ) ) ( not ( = ?auto_27178 ?auto_27183 ) ) ( not ( = ?auto_27193 ?auto_27183 ) ) ( not ( = ?auto_27179 ?auto_27183 ) ) ( IS-CRATE ?auto_27193 ) ( not ( = ?auto_27190 ?auto_27193 ) ) ( not ( = ?auto_27177 ?auto_27190 ) ) ( not ( = ?auto_27178 ?auto_27190 ) ) ( not ( = ?auto_27179 ?auto_27190 ) ) ( not ( = ?auto_27183 ?auto_27190 ) ) ( not ( = ?auto_27186 ?auto_27187 ) ) ( not ( = ?auto_27189 ?auto_27186 ) ) ( not ( = ?auto_27192 ?auto_27186 ) ) ( HOIST-AT ?auto_27188 ?auto_27186 ) ( not ( = ?auto_27182 ?auto_27188 ) ) ( not ( = ?auto_27191 ?auto_27188 ) ) ( not ( = ?auto_27185 ?auto_27188 ) ) ( AVAILABLE ?auto_27188 ) ( SURFACE-AT ?auto_27193 ?auto_27186 ) ( ON ?auto_27193 ?auto_27184 ) ( CLEAR ?auto_27193 ) ( not ( = ?auto_27177 ?auto_27184 ) ) ( not ( = ?auto_27178 ?auto_27184 ) ) ( not ( = ?auto_27193 ?auto_27184 ) ) ( not ( = ?auto_27179 ?auto_27184 ) ) ( not ( = ?auto_27183 ?auto_27184 ) ) ( not ( = ?auto_27190 ?auto_27184 ) ) ( SURFACE-AT ?auto_27180 ?auto_27187 ) ( CLEAR ?auto_27180 ) ( IS-CRATE ?auto_27190 ) ( not ( = ?auto_27180 ?auto_27190 ) ) ( not ( = ?auto_27177 ?auto_27180 ) ) ( not ( = ?auto_27178 ?auto_27180 ) ) ( not ( = ?auto_27193 ?auto_27180 ) ) ( not ( = ?auto_27179 ?auto_27180 ) ) ( not ( = ?auto_27183 ?auto_27180 ) ) ( not ( = ?auto_27184 ?auto_27180 ) ) ( AVAILABLE ?auto_27182 ) ( IN ?auto_27190 ?auto_27181 ) ( TRUCK-AT ?auto_27181 ?auto_27192 ) )
    :subtasks
    ( ( !DRIVE ?auto_27181 ?auto_27192 ?auto_27187 )
      ( MAKE-2CRATE ?auto_27193 ?auto_27177 ?auto_27178 )
      ( MAKE-1CRATE-VERIFY ?auto_27177 ?auto_27178 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27194 - SURFACE
      ?auto_27195 - SURFACE
      ?auto_27196 - SURFACE
    )
    :vars
    (
      ?auto_27198 - HOIST
      ?auto_27208 - PLACE
      ?auto_27199 - PLACE
      ?auto_27204 - HOIST
      ?auto_27197 - SURFACE
      ?auto_27209 - PLACE
      ?auto_27201 - HOIST
      ?auto_27207 - SURFACE
      ?auto_27206 - SURFACE
      ?auto_27203 - PLACE
      ?auto_27202 - HOIST
      ?auto_27205 - SURFACE
      ?auto_27200 - SURFACE
      ?auto_27210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27198 ?auto_27208 ) ( IS-CRATE ?auto_27196 ) ( not ( = ?auto_27195 ?auto_27196 ) ) ( not ( = ?auto_27194 ?auto_27195 ) ) ( not ( = ?auto_27194 ?auto_27196 ) ) ( not ( = ?auto_27199 ?auto_27208 ) ) ( HOIST-AT ?auto_27204 ?auto_27199 ) ( not ( = ?auto_27198 ?auto_27204 ) ) ( AVAILABLE ?auto_27204 ) ( SURFACE-AT ?auto_27196 ?auto_27199 ) ( ON ?auto_27196 ?auto_27197 ) ( CLEAR ?auto_27196 ) ( not ( = ?auto_27195 ?auto_27197 ) ) ( not ( = ?auto_27196 ?auto_27197 ) ) ( not ( = ?auto_27194 ?auto_27197 ) ) ( IS-CRATE ?auto_27195 ) ( not ( = ?auto_27209 ?auto_27208 ) ) ( not ( = ?auto_27199 ?auto_27209 ) ) ( HOIST-AT ?auto_27201 ?auto_27209 ) ( not ( = ?auto_27198 ?auto_27201 ) ) ( not ( = ?auto_27204 ?auto_27201 ) ) ( AVAILABLE ?auto_27201 ) ( SURFACE-AT ?auto_27195 ?auto_27209 ) ( ON ?auto_27195 ?auto_27207 ) ( CLEAR ?auto_27195 ) ( not ( = ?auto_27195 ?auto_27207 ) ) ( not ( = ?auto_27196 ?auto_27207 ) ) ( not ( = ?auto_27194 ?auto_27207 ) ) ( not ( = ?auto_27197 ?auto_27207 ) ) ( IS-CRATE ?auto_27194 ) ( not ( = ?auto_27206 ?auto_27194 ) ) ( not ( = ?auto_27195 ?auto_27206 ) ) ( not ( = ?auto_27196 ?auto_27206 ) ) ( not ( = ?auto_27197 ?auto_27206 ) ) ( not ( = ?auto_27207 ?auto_27206 ) ) ( not ( = ?auto_27203 ?auto_27208 ) ) ( not ( = ?auto_27199 ?auto_27203 ) ) ( not ( = ?auto_27209 ?auto_27203 ) ) ( HOIST-AT ?auto_27202 ?auto_27203 ) ( not ( = ?auto_27198 ?auto_27202 ) ) ( not ( = ?auto_27204 ?auto_27202 ) ) ( not ( = ?auto_27201 ?auto_27202 ) ) ( AVAILABLE ?auto_27202 ) ( SURFACE-AT ?auto_27194 ?auto_27203 ) ( ON ?auto_27194 ?auto_27205 ) ( CLEAR ?auto_27194 ) ( not ( = ?auto_27195 ?auto_27205 ) ) ( not ( = ?auto_27196 ?auto_27205 ) ) ( not ( = ?auto_27194 ?auto_27205 ) ) ( not ( = ?auto_27197 ?auto_27205 ) ) ( not ( = ?auto_27207 ?auto_27205 ) ) ( not ( = ?auto_27206 ?auto_27205 ) ) ( SURFACE-AT ?auto_27200 ?auto_27208 ) ( CLEAR ?auto_27200 ) ( IS-CRATE ?auto_27206 ) ( not ( = ?auto_27200 ?auto_27206 ) ) ( not ( = ?auto_27195 ?auto_27200 ) ) ( not ( = ?auto_27196 ?auto_27200 ) ) ( not ( = ?auto_27194 ?auto_27200 ) ) ( not ( = ?auto_27197 ?auto_27200 ) ) ( not ( = ?auto_27207 ?auto_27200 ) ) ( not ( = ?auto_27205 ?auto_27200 ) ) ( AVAILABLE ?auto_27198 ) ( IN ?auto_27206 ?auto_27210 ) ( TRUCK-AT ?auto_27210 ?auto_27209 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27195 ?auto_27196 )
      ( MAKE-2CRATE-VERIFY ?auto_27194 ?auto_27195 ?auto_27196 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27211 - SURFACE
      ?auto_27212 - SURFACE
      ?auto_27213 - SURFACE
      ?auto_27214 - SURFACE
    )
    :vars
    (
      ?auto_27216 - HOIST
      ?auto_27224 - PLACE
      ?auto_27222 - PLACE
      ?auto_27225 - HOIST
      ?auto_27220 - SURFACE
      ?auto_27221 - PLACE
      ?auto_27227 - HOIST
      ?auto_27226 - SURFACE
      ?auto_27223 - PLACE
      ?auto_27215 - HOIST
      ?auto_27217 - SURFACE
      ?auto_27218 - SURFACE
      ?auto_27219 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27216 ?auto_27224 ) ( IS-CRATE ?auto_27214 ) ( not ( = ?auto_27213 ?auto_27214 ) ) ( not ( = ?auto_27212 ?auto_27213 ) ) ( not ( = ?auto_27212 ?auto_27214 ) ) ( not ( = ?auto_27222 ?auto_27224 ) ) ( HOIST-AT ?auto_27225 ?auto_27222 ) ( not ( = ?auto_27216 ?auto_27225 ) ) ( AVAILABLE ?auto_27225 ) ( SURFACE-AT ?auto_27214 ?auto_27222 ) ( ON ?auto_27214 ?auto_27220 ) ( CLEAR ?auto_27214 ) ( not ( = ?auto_27213 ?auto_27220 ) ) ( not ( = ?auto_27214 ?auto_27220 ) ) ( not ( = ?auto_27212 ?auto_27220 ) ) ( IS-CRATE ?auto_27213 ) ( not ( = ?auto_27221 ?auto_27224 ) ) ( not ( = ?auto_27222 ?auto_27221 ) ) ( HOIST-AT ?auto_27227 ?auto_27221 ) ( not ( = ?auto_27216 ?auto_27227 ) ) ( not ( = ?auto_27225 ?auto_27227 ) ) ( AVAILABLE ?auto_27227 ) ( SURFACE-AT ?auto_27213 ?auto_27221 ) ( ON ?auto_27213 ?auto_27226 ) ( CLEAR ?auto_27213 ) ( not ( = ?auto_27213 ?auto_27226 ) ) ( not ( = ?auto_27214 ?auto_27226 ) ) ( not ( = ?auto_27212 ?auto_27226 ) ) ( not ( = ?auto_27220 ?auto_27226 ) ) ( IS-CRATE ?auto_27212 ) ( not ( = ?auto_27211 ?auto_27212 ) ) ( not ( = ?auto_27213 ?auto_27211 ) ) ( not ( = ?auto_27214 ?auto_27211 ) ) ( not ( = ?auto_27220 ?auto_27211 ) ) ( not ( = ?auto_27226 ?auto_27211 ) ) ( not ( = ?auto_27223 ?auto_27224 ) ) ( not ( = ?auto_27222 ?auto_27223 ) ) ( not ( = ?auto_27221 ?auto_27223 ) ) ( HOIST-AT ?auto_27215 ?auto_27223 ) ( not ( = ?auto_27216 ?auto_27215 ) ) ( not ( = ?auto_27225 ?auto_27215 ) ) ( not ( = ?auto_27227 ?auto_27215 ) ) ( AVAILABLE ?auto_27215 ) ( SURFACE-AT ?auto_27212 ?auto_27223 ) ( ON ?auto_27212 ?auto_27217 ) ( CLEAR ?auto_27212 ) ( not ( = ?auto_27213 ?auto_27217 ) ) ( not ( = ?auto_27214 ?auto_27217 ) ) ( not ( = ?auto_27212 ?auto_27217 ) ) ( not ( = ?auto_27220 ?auto_27217 ) ) ( not ( = ?auto_27226 ?auto_27217 ) ) ( not ( = ?auto_27211 ?auto_27217 ) ) ( SURFACE-AT ?auto_27218 ?auto_27224 ) ( CLEAR ?auto_27218 ) ( IS-CRATE ?auto_27211 ) ( not ( = ?auto_27218 ?auto_27211 ) ) ( not ( = ?auto_27213 ?auto_27218 ) ) ( not ( = ?auto_27214 ?auto_27218 ) ) ( not ( = ?auto_27212 ?auto_27218 ) ) ( not ( = ?auto_27220 ?auto_27218 ) ) ( not ( = ?auto_27226 ?auto_27218 ) ) ( not ( = ?auto_27217 ?auto_27218 ) ) ( AVAILABLE ?auto_27216 ) ( IN ?auto_27211 ?auto_27219 ) ( TRUCK-AT ?auto_27219 ?auto_27221 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27212 ?auto_27213 ?auto_27214 )
      ( MAKE-3CRATE-VERIFY ?auto_27211 ?auto_27212 ?auto_27213 ?auto_27214 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27228 - SURFACE
      ?auto_27229 - SURFACE
      ?auto_27230 - SURFACE
      ?auto_27231 - SURFACE
      ?auto_27232 - SURFACE
    )
    :vars
    (
      ?auto_27234 - HOIST
      ?auto_27241 - PLACE
      ?auto_27239 - PLACE
      ?auto_27242 - HOIST
      ?auto_27237 - SURFACE
      ?auto_27238 - PLACE
      ?auto_27244 - HOIST
      ?auto_27243 - SURFACE
      ?auto_27240 - PLACE
      ?auto_27233 - HOIST
      ?auto_27235 - SURFACE
      ?auto_27236 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27234 ?auto_27241 ) ( IS-CRATE ?auto_27232 ) ( not ( = ?auto_27231 ?auto_27232 ) ) ( not ( = ?auto_27230 ?auto_27231 ) ) ( not ( = ?auto_27230 ?auto_27232 ) ) ( not ( = ?auto_27239 ?auto_27241 ) ) ( HOIST-AT ?auto_27242 ?auto_27239 ) ( not ( = ?auto_27234 ?auto_27242 ) ) ( AVAILABLE ?auto_27242 ) ( SURFACE-AT ?auto_27232 ?auto_27239 ) ( ON ?auto_27232 ?auto_27237 ) ( CLEAR ?auto_27232 ) ( not ( = ?auto_27231 ?auto_27237 ) ) ( not ( = ?auto_27232 ?auto_27237 ) ) ( not ( = ?auto_27230 ?auto_27237 ) ) ( IS-CRATE ?auto_27231 ) ( not ( = ?auto_27238 ?auto_27241 ) ) ( not ( = ?auto_27239 ?auto_27238 ) ) ( HOIST-AT ?auto_27244 ?auto_27238 ) ( not ( = ?auto_27234 ?auto_27244 ) ) ( not ( = ?auto_27242 ?auto_27244 ) ) ( AVAILABLE ?auto_27244 ) ( SURFACE-AT ?auto_27231 ?auto_27238 ) ( ON ?auto_27231 ?auto_27243 ) ( CLEAR ?auto_27231 ) ( not ( = ?auto_27231 ?auto_27243 ) ) ( not ( = ?auto_27232 ?auto_27243 ) ) ( not ( = ?auto_27230 ?auto_27243 ) ) ( not ( = ?auto_27237 ?auto_27243 ) ) ( IS-CRATE ?auto_27230 ) ( not ( = ?auto_27229 ?auto_27230 ) ) ( not ( = ?auto_27231 ?auto_27229 ) ) ( not ( = ?auto_27232 ?auto_27229 ) ) ( not ( = ?auto_27237 ?auto_27229 ) ) ( not ( = ?auto_27243 ?auto_27229 ) ) ( not ( = ?auto_27240 ?auto_27241 ) ) ( not ( = ?auto_27239 ?auto_27240 ) ) ( not ( = ?auto_27238 ?auto_27240 ) ) ( HOIST-AT ?auto_27233 ?auto_27240 ) ( not ( = ?auto_27234 ?auto_27233 ) ) ( not ( = ?auto_27242 ?auto_27233 ) ) ( not ( = ?auto_27244 ?auto_27233 ) ) ( AVAILABLE ?auto_27233 ) ( SURFACE-AT ?auto_27230 ?auto_27240 ) ( ON ?auto_27230 ?auto_27235 ) ( CLEAR ?auto_27230 ) ( not ( = ?auto_27231 ?auto_27235 ) ) ( not ( = ?auto_27232 ?auto_27235 ) ) ( not ( = ?auto_27230 ?auto_27235 ) ) ( not ( = ?auto_27237 ?auto_27235 ) ) ( not ( = ?auto_27243 ?auto_27235 ) ) ( not ( = ?auto_27229 ?auto_27235 ) ) ( SURFACE-AT ?auto_27228 ?auto_27241 ) ( CLEAR ?auto_27228 ) ( IS-CRATE ?auto_27229 ) ( not ( = ?auto_27228 ?auto_27229 ) ) ( not ( = ?auto_27231 ?auto_27228 ) ) ( not ( = ?auto_27232 ?auto_27228 ) ) ( not ( = ?auto_27230 ?auto_27228 ) ) ( not ( = ?auto_27237 ?auto_27228 ) ) ( not ( = ?auto_27243 ?auto_27228 ) ) ( not ( = ?auto_27235 ?auto_27228 ) ) ( AVAILABLE ?auto_27234 ) ( IN ?auto_27229 ?auto_27236 ) ( TRUCK-AT ?auto_27236 ?auto_27238 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27230 ?auto_27231 ?auto_27232 )
      ( MAKE-4CRATE-VERIFY ?auto_27228 ?auto_27229 ?auto_27230 ?auto_27231 ?auto_27232 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27245 - SURFACE
      ?auto_27246 - SURFACE
      ?auto_27247 - SURFACE
      ?auto_27248 - SURFACE
      ?auto_27249 - SURFACE
      ?auto_27250 - SURFACE
    )
    :vars
    (
      ?auto_27252 - HOIST
      ?auto_27259 - PLACE
      ?auto_27257 - PLACE
      ?auto_27260 - HOIST
      ?auto_27255 - SURFACE
      ?auto_27256 - PLACE
      ?auto_27262 - HOIST
      ?auto_27261 - SURFACE
      ?auto_27258 - PLACE
      ?auto_27251 - HOIST
      ?auto_27253 - SURFACE
      ?auto_27254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27252 ?auto_27259 ) ( IS-CRATE ?auto_27250 ) ( not ( = ?auto_27249 ?auto_27250 ) ) ( not ( = ?auto_27248 ?auto_27249 ) ) ( not ( = ?auto_27248 ?auto_27250 ) ) ( not ( = ?auto_27257 ?auto_27259 ) ) ( HOIST-AT ?auto_27260 ?auto_27257 ) ( not ( = ?auto_27252 ?auto_27260 ) ) ( AVAILABLE ?auto_27260 ) ( SURFACE-AT ?auto_27250 ?auto_27257 ) ( ON ?auto_27250 ?auto_27255 ) ( CLEAR ?auto_27250 ) ( not ( = ?auto_27249 ?auto_27255 ) ) ( not ( = ?auto_27250 ?auto_27255 ) ) ( not ( = ?auto_27248 ?auto_27255 ) ) ( IS-CRATE ?auto_27249 ) ( not ( = ?auto_27256 ?auto_27259 ) ) ( not ( = ?auto_27257 ?auto_27256 ) ) ( HOIST-AT ?auto_27262 ?auto_27256 ) ( not ( = ?auto_27252 ?auto_27262 ) ) ( not ( = ?auto_27260 ?auto_27262 ) ) ( AVAILABLE ?auto_27262 ) ( SURFACE-AT ?auto_27249 ?auto_27256 ) ( ON ?auto_27249 ?auto_27261 ) ( CLEAR ?auto_27249 ) ( not ( = ?auto_27249 ?auto_27261 ) ) ( not ( = ?auto_27250 ?auto_27261 ) ) ( not ( = ?auto_27248 ?auto_27261 ) ) ( not ( = ?auto_27255 ?auto_27261 ) ) ( IS-CRATE ?auto_27248 ) ( not ( = ?auto_27247 ?auto_27248 ) ) ( not ( = ?auto_27249 ?auto_27247 ) ) ( not ( = ?auto_27250 ?auto_27247 ) ) ( not ( = ?auto_27255 ?auto_27247 ) ) ( not ( = ?auto_27261 ?auto_27247 ) ) ( not ( = ?auto_27258 ?auto_27259 ) ) ( not ( = ?auto_27257 ?auto_27258 ) ) ( not ( = ?auto_27256 ?auto_27258 ) ) ( HOIST-AT ?auto_27251 ?auto_27258 ) ( not ( = ?auto_27252 ?auto_27251 ) ) ( not ( = ?auto_27260 ?auto_27251 ) ) ( not ( = ?auto_27262 ?auto_27251 ) ) ( AVAILABLE ?auto_27251 ) ( SURFACE-AT ?auto_27248 ?auto_27258 ) ( ON ?auto_27248 ?auto_27253 ) ( CLEAR ?auto_27248 ) ( not ( = ?auto_27249 ?auto_27253 ) ) ( not ( = ?auto_27250 ?auto_27253 ) ) ( not ( = ?auto_27248 ?auto_27253 ) ) ( not ( = ?auto_27255 ?auto_27253 ) ) ( not ( = ?auto_27261 ?auto_27253 ) ) ( not ( = ?auto_27247 ?auto_27253 ) ) ( SURFACE-AT ?auto_27246 ?auto_27259 ) ( CLEAR ?auto_27246 ) ( IS-CRATE ?auto_27247 ) ( not ( = ?auto_27246 ?auto_27247 ) ) ( not ( = ?auto_27249 ?auto_27246 ) ) ( not ( = ?auto_27250 ?auto_27246 ) ) ( not ( = ?auto_27248 ?auto_27246 ) ) ( not ( = ?auto_27255 ?auto_27246 ) ) ( not ( = ?auto_27261 ?auto_27246 ) ) ( not ( = ?auto_27253 ?auto_27246 ) ) ( AVAILABLE ?auto_27252 ) ( IN ?auto_27247 ?auto_27254 ) ( TRUCK-AT ?auto_27254 ?auto_27256 ) ( ON ?auto_27246 ?auto_27245 ) ( not ( = ?auto_27245 ?auto_27246 ) ) ( not ( = ?auto_27245 ?auto_27247 ) ) ( not ( = ?auto_27245 ?auto_27248 ) ) ( not ( = ?auto_27245 ?auto_27249 ) ) ( not ( = ?auto_27245 ?auto_27250 ) ) ( not ( = ?auto_27245 ?auto_27255 ) ) ( not ( = ?auto_27245 ?auto_27261 ) ) ( not ( = ?auto_27245 ?auto_27253 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27248 ?auto_27249 ?auto_27250 )
      ( MAKE-5CRATE-VERIFY ?auto_27245 ?auto_27246 ?auto_27247 ?auto_27248 ?auto_27249 ?auto_27250 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27263 - SURFACE
      ?auto_27264 - SURFACE
    )
    :vars
    (
      ?auto_27266 - HOIST
      ?auto_27275 - PLACE
      ?auto_27276 - SURFACE
      ?auto_27273 - PLACE
      ?auto_27277 - HOIST
      ?auto_27270 - SURFACE
      ?auto_27271 - PLACE
      ?auto_27279 - HOIST
      ?auto_27278 - SURFACE
      ?auto_27272 - SURFACE
      ?auto_27274 - PLACE
      ?auto_27265 - HOIST
      ?auto_27267 - SURFACE
      ?auto_27268 - SURFACE
      ?auto_27269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27266 ?auto_27275 ) ( IS-CRATE ?auto_27264 ) ( not ( = ?auto_27263 ?auto_27264 ) ) ( not ( = ?auto_27276 ?auto_27263 ) ) ( not ( = ?auto_27276 ?auto_27264 ) ) ( not ( = ?auto_27273 ?auto_27275 ) ) ( HOIST-AT ?auto_27277 ?auto_27273 ) ( not ( = ?auto_27266 ?auto_27277 ) ) ( AVAILABLE ?auto_27277 ) ( SURFACE-AT ?auto_27264 ?auto_27273 ) ( ON ?auto_27264 ?auto_27270 ) ( CLEAR ?auto_27264 ) ( not ( = ?auto_27263 ?auto_27270 ) ) ( not ( = ?auto_27264 ?auto_27270 ) ) ( not ( = ?auto_27276 ?auto_27270 ) ) ( IS-CRATE ?auto_27263 ) ( not ( = ?auto_27271 ?auto_27275 ) ) ( not ( = ?auto_27273 ?auto_27271 ) ) ( HOIST-AT ?auto_27279 ?auto_27271 ) ( not ( = ?auto_27266 ?auto_27279 ) ) ( not ( = ?auto_27277 ?auto_27279 ) ) ( SURFACE-AT ?auto_27263 ?auto_27271 ) ( ON ?auto_27263 ?auto_27278 ) ( CLEAR ?auto_27263 ) ( not ( = ?auto_27263 ?auto_27278 ) ) ( not ( = ?auto_27264 ?auto_27278 ) ) ( not ( = ?auto_27276 ?auto_27278 ) ) ( not ( = ?auto_27270 ?auto_27278 ) ) ( IS-CRATE ?auto_27276 ) ( not ( = ?auto_27272 ?auto_27276 ) ) ( not ( = ?auto_27263 ?auto_27272 ) ) ( not ( = ?auto_27264 ?auto_27272 ) ) ( not ( = ?auto_27270 ?auto_27272 ) ) ( not ( = ?auto_27278 ?auto_27272 ) ) ( not ( = ?auto_27274 ?auto_27275 ) ) ( not ( = ?auto_27273 ?auto_27274 ) ) ( not ( = ?auto_27271 ?auto_27274 ) ) ( HOIST-AT ?auto_27265 ?auto_27274 ) ( not ( = ?auto_27266 ?auto_27265 ) ) ( not ( = ?auto_27277 ?auto_27265 ) ) ( not ( = ?auto_27279 ?auto_27265 ) ) ( AVAILABLE ?auto_27265 ) ( SURFACE-AT ?auto_27276 ?auto_27274 ) ( ON ?auto_27276 ?auto_27267 ) ( CLEAR ?auto_27276 ) ( not ( = ?auto_27263 ?auto_27267 ) ) ( not ( = ?auto_27264 ?auto_27267 ) ) ( not ( = ?auto_27276 ?auto_27267 ) ) ( not ( = ?auto_27270 ?auto_27267 ) ) ( not ( = ?auto_27278 ?auto_27267 ) ) ( not ( = ?auto_27272 ?auto_27267 ) ) ( SURFACE-AT ?auto_27268 ?auto_27275 ) ( CLEAR ?auto_27268 ) ( IS-CRATE ?auto_27272 ) ( not ( = ?auto_27268 ?auto_27272 ) ) ( not ( = ?auto_27263 ?auto_27268 ) ) ( not ( = ?auto_27264 ?auto_27268 ) ) ( not ( = ?auto_27276 ?auto_27268 ) ) ( not ( = ?auto_27270 ?auto_27268 ) ) ( not ( = ?auto_27278 ?auto_27268 ) ) ( not ( = ?auto_27267 ?auto_27268 ) ) ( AVAILABLE ?auto_27266 ) ( TRUCK-AT ?auto_27269 ?auto_27271 ) ( LIFTING ?auto_27279 ?auto_27272 ) )
    :subtasks
    ( ( !LOAD ?auto_27279 ?auto_27272 ?auto_27269 ?auto_27271 )
      ( MAKE-2CRATE ?auto_27276 ?auto_27263 ?auto_27264 )
      ( MAKE-1CRATE-VERIFY ?auto_27263 ?auto_27264 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27280 - SURFACE
      ?auto_27281 - SURFACE
      ?auto_27282 - SURFACE
    )
    :vars
    (
      ?auto_27289 - HOIST
      ?auto_27295 - PLACE
      ?auto_27284 - PLACE
      ?auto_27288 - HOIST
      ?auto_27293 - SURFACE
      ?auto_27291 - PLACE
      ?auto_27296 - HOIST
      ?auto_27285 - SURFACE
      ?auto_27283 - SURFACE
      ?auto_27287 - PLACE
      ?auto_27294 - HOIST
      ?auto_27290 - SURFACE
      ?auto_27286 - SURFACE
      ?auto_27292 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27289 ?auto_27295 ) ( IS-CRATE ?auto_27282 ) ( not ( = ?auto_27281 ?auto_27282 ) ) ( not ( = ?auto_27280 ?auto_27281 ) ) ( not ( = ?auto_27280 ?auto_27282 ) ) ( not ( = ?auto_27284 ?auto_27295 ) ) ( HOIST-AT ?auto_27288 ?auto_27284 ) ( not ( = ?auto_27289 ?auto_27288 ) ) ( AVAILABLE ?auto_27288 ) ( SURFACE-AT ?auto_27282 ?auto_27284 ) ( ON ?auto_27282 ?auto_27293 ) ( CLEAR ?auto_27282 ) ( not ( = ?auto_27281 ?auto_27293 ) ) ( not ( = ?auto_27282 ?auto_27293 ) ) ( not ( = ?auto_27280 ?auto_27293 ) ) ( IS-CRATE ?auto_27281 ) ( not ( = ?auto_27291 ?auto_27295 ) ) ( not ( = ?auto_27284 ?auto_27291 ) ) ( HOIST-AT ?auto_27296 ?auto_27291 ) ( not ( = ?auto_27289 ?auto_27296 ) ) ( not ( = ?auto_27288 ?auto_27296 ) ) ( SURFACE-AT ?auto_27281 ?auto_27291 ) ( ON ?auto_27281 ?auto_27285 ) ( CLEAR ?auto_27281 ) ( not ( = ?auto_27281 ?auto_27285 ) ) ( not ( = ?auto_27282 ?auto_27285 ) ) ( not ( = ?auto_27280 ?auto_27285 ) ) ( not ( = ?auto_27293 ?auto_27285 ) ) ( IS-CRATE ?auto_27280 ) ( not ( = ?auto_27283 ?auto_27280 ) ) ( not ( = ?auto_27281 ?auto_27283 ) ) ( not ( = ?auto_27282 ?auto_27283 ) ) ( not ( = ?auto_27293 ?auto_27283 ) ) ( not ( = ?auto_27285 ?auto_27283 ) ) ( not ( = ?auto_27287 ?auto_27295 ) ) ( not ( = ?auto_27284 ?auto_27287 ) ) ( not ( = ?auto_27291 ?auto_27287 ) ) ( HOIST-AT ?auto_27294 ?auto_27287 ) ( not ( = ?auto_27289 ?auto_27294 ) ) ( not ( = ?auto_27288 ?auto_27294 ) ) ( not ( = ?auto_27296 ?auto_27294 ) ) ( AVAILABLE ?auto_27294 ) ( SURFACE-AT ?auto_27280 ?auto_27287 ) ( ON ?auto_27280 ?auto_27290 ) ( CLEAR ?auto_27280 ) ( not ( = ?auto_27281 ?auto_27290 ) ) ( not ( = ?auto_27282 ?auto_27290 ) ) ( not ( = ?auto_27280 ?auto_27290 ) ) ( not ( = ?auto_27293 ?auto_27290 ) ) ( not ( = ?auto_27285 ?auto_27290 ) ) ( not ( = ?auto_27283 ?auto_27290 ) ) ( SURFACE-AT ?auto_27286 ?auto_27295 ) ( CLEAR ?auto_27286 ) ( IS-CRATE ?auto_27283 ) ( not ( = ?auto_27286 ?auto_27283 ) ) ( not ( = ?auto_27281 ?auto_27286 ) ) ( not ( = ?auto_27282 ?auto_27286 ) ) ( not ( = ?auto_27280 ?auto_27286 ) ) ( not ( = ?auto_27293 ?auto_27286 ) ) ( not ( = ?auto_27285 ?auto_27286 ) ) ( not ( = ?auto_27290 ?auto_27286 ) ) ( AVAILABLE ?auto_27289 ) ( TRUCK-AT ?auto_27292 ?auto_27291 ) ( LIFTING ?auto_27296 ?auto_27283 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27281 ?auto_27282 )
      ( MAKE-2CRATE-VERIFY ?auto_27280 ?auto_27281 ?auto_27282 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27297 - SURFACE
      ?auto_27298 - SURFACE
      ?auto_27299 - SURFACE
      ?auto_27300 - SURFACE
    )
    :vars
    (
      ?auto_27302 - HOIST
      ?auto_27303 - PLACE
      ?auto_27301 - PLACE
      ?auto_27305 - HOIST
      ?auto_27312 - SURFACE
      ?auto_27308 - PLACE
      ?auto_27310 - HOIST
      ?auto_27311 - SURFACE
      ?auto_27307 - PLACE
      ?auto_27309 - HOIST
      ?auto_27313 - SURFACE
      ?auto_27304 - SURFACE
      ?auto_27306 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27302 ?auto_27303 ) ( IS-CRATE ?auto_27300 ) ( not ( = ?auto_27299 ?auto_27300 ) ) ( not ( = ?auto_27298 ?auto_27299 ) ) ( not ( = ?auto_27298 ?auto_27300 ) ) ( not ( = ?auto_27301 ?auto_27303 ) ) ( HOIST-AT ?auto_27305 ?auto_27301 ) ( not ( = ?auto_27302 ?auto_27305 ) ) ( AVAILABLE ?auto_27305 ) ( SURFACE-AT ?auto_27300 ?auto_27301 ) ( ON ?auto_27300 ?auto_27312 ) ( CLEAR ?auto_27300 ) ( not ( = ?auto_27299 ?auto_27312 ) ) ( not ( = ?auto_27300 ?auto_27312 ) ) ( not ( = ?auto_27298 ?auto_27312 ) ) ( IS-CRATE ?auto_27299 ) ( not ( = ?auto_27308 ?auto_27303 ) ) ( not ( = ?auto_27301 ?auto_27308 ) ) ( HOIST-AT ?auto_27310 ?auto_27308 ) ( not ( = ?auto_27302 ?auto_27310 ) ) ( not ( = ?auto_27305 ?auto_27310 ) ) ( SURFACE-AT ?auto_27299 ?auto_27308 ) ( ON ?auto_27299 ?auto_27311 ) ( CLEAR ?auto_27299 ) ( not ( = ?auto_27299 ?auto_27311 ) ) ( not ( = ?auto_27300 ?auto_27311 ) ) ( not ( = ?auto_27298 ?auto_27311 ) ) ( not ( = ?auto_27312 ?auto_27311 ) ) ( IS-CRATE ?auto_27298 ) ( not ( = ?auto_27297 ?auto_27298 ) ) ( not ( = ?auto_27299 ?auto_27297 ) ) ( not ( = ?auto_27300 ?auto_27297 ) ) ( not ( = ?auto_27312 ?auto_27297 ) ) ( not ( = ?auto_27311 ?auto_27297 ) ) ( not ( = ?auto_27307 ?auto_27303 ) ) ( not ( = ?auto_27301 ?auto_27307 ) ) ( not ( = ?auto_27308 ?auto_27307 ) ) ( HOIST-AT ?auto_27309 ?auto_27307 ) ( not ( = ?auto_27302 ?auto_27309 ) ) ( not ( = ?auto_27305 ?auto_27309 ) ) ( not ( = ?auto_27310 ?auto_27309 ) ) ( AVAILABLE ?auto_27309 ) ( SURFACE-AT ?auto_27298 ?auto_27307 ) ( ON ?auto_27298 ?auto_27313 ) ( CLEAR ?auto_27298 ) ( not ( = ?auto_27299 ?auto_27313 ) ) ( not ( = ?auto_27300 ?auto_27313 ) ) ( not ( = ?auto_27298 ?auto_27313 ) ) ( not ( = ?auto_27312 ?auto_27313 ) ) ( not ( = ?auto_27311 ?auto_27313 ) ) ( not ( = ?auto_27297 ?auto_27313 ) ) ( SURFACE-AT ?auto_27304 ?auto_27303 ) ( CLEAR ?auto_27304 ) ( IS-CRATE ?auto_27297 ) ( not ( = ?auto_27304 ?auto_27297 ) ) ( not ( = ?auto_27299 ?auto_27304 ) ) ( not ( = ?auto_27300 ?auto_27304 ) ) ( not ( = ?auto_27298 ?auto_27304 ) ) ( not ( = ?auto_27312 ?auto_27304 ) ) ( not ( = ?auto_27311 ?auto_27304 ) ) ( not ( = ?auto_27313 ?auto_27304 ) ) ( AVAILABLE ?auto_27302 ) ( TRUCK-AT ?auto_27306 ?auto_27308 ) ( LIFTING ?auto_27310 ?auto_27297 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27298 ?auto_27299 ?auto_27300 )
      ( MAKE-3CRATE-VERIFY ?auto_27297 ?auto_27298 ?auto_27299 ?auto_27300 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27314 - SURFACE
      ?auto_27315 - SURFACE
      ?auto_27316 - SURFACE
      ?auto_27317 - SURFACE
      ?auto_27318 - SURFACE
    )
    :vars
    (
      ?auto_27320 - HOIST
      ?auto_27321 - PLACE
      ?auto_27319 - PLACE
      ?auto_27322 - HOIST
      ?auto_27329 - SURFACE
      ?auto_27325 - PLACE
      ?auto_27327 - HOIST
      ?auto_27328 - SURFACE
      ?auto_27324 - PLACE
      ?auto_27326 - HOIST
      ?auto_27330 - SURFACE
      ?auto_27323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27320 ?auto_27321 ) ( IS-CRATE ?auto_27318 ) ( not ( = ?auto_27317 ?auto_27318 ) ) ( not ( = ?auto_27316 ?auto_27317 ) ) ( not ( = ?auto_27316 ?auto_27318 ) ) ( not ( = ?auto_27319 ?auto_27321 ) ) ( HOIST-AT ?auto_27322 ?auto_27319 ) ( not ( = ?auto_27320 ?auto_27322 ) ) ( AVAILABLE ?auto_27322 ) ( SURFACE-AT ?auto_27318 ?auto_27319 ) ( ON ?auto_27318 ?auto_27329 ) ( CLEAR ?auto_27318 ) ( not ( = ?auto_27317 ?auto_27329 ) ) ( not ( = ?auto_27318 ?auto_27329 ) ) ( not ( = ?auto_27316 ?auto_27329 ) ) ( IS-CRATE ?auto_27317 ) ( not ( = ?auto_27325 ?auto_27321 ) ) ( not ( = ?auto_27319 ?auto_27325 ) ) ( HOIST-AT ?auto_27327 ?auto_27325 ) ( not ( = ?auto_27320 ?auto_27327 ) ) ( not ( = ?auto_27322 ?auto_27327 ) ) ( SURFACE-AT ?auto_27317 ?auto_27325 ) ( ON ?auto_27317 ?auto_27328 ) ( CLEAR ?auto_27317 ) ( not ( = ?auto_27317 ?auto_27328 ) ) ( not ( = ?auto_27318 ?auto_27328 ) ) ( not ( = ?auto_27316 ?auto_27328 ) ) ( not ( = ?auto_27329 ?auto_27328 ) ) ( IS-CRATE ?auto_27316 ) ( not ( = ?auto_27315 ?auto_27316 ) ) ( not ( = ?auto_27317 ?auto_27315 ) ) ( not ( = ?auto_27318 ?auto_27315 ) ) ( not ( = ?auto_27329 ?auto_27315 ) ) ( not ( = ?auto_27328 ?auto_27315 ) ) ( not ( = ?auto_27324 ?auto_27321 ) ) ( not ( = ?auto_27319 ?auto_27324 ) ) ( not ( = ?auto_27325 ?auto_27324 ) ) ( HOIST-AT ?auto_27326 ?auto_27324 ) ( not ( = ?auto_27320 ?auto_27326 ) ) ( not ( = ?auto_27322 ?auto_27326 ) ) ( not ( = ?auto_27327 ?auto_27326 ) ) ( AVAILABLE ?auto_27326 ) ( SURFACE-AT ?auto_27316 ?auto_27324 ) ( ON ?auto_27316 ?auto_27330 ) ( CLEAR ?auto_27316 ) ( not ( = ?auto_27317 ?auto_27330 ) ) ( not ( = ?auto_27318 ?auto_27330 ) ) ( not ( = ?auto_27316 ?auto_27330 ) ) ( not ( = ?auto_27329 ?auto_27330 ) ) ( not ( = ?auto_27328 ?auto_27330 ) ) ( not ( = ?auto_27315 ?auto_27330 ) ) ( SURFACE-AT ?auto_27314 ?auto_27321 ) ( CLEAR ?auto_27314 ) ( IS-CRATE ?auto_27315 ) ( not ( = ?auto_27314 ?auto_27315 ) ) ( not ( = ?auto_27317 ?auto_27314 ) ) ( not ( = ?auto_27318 ?auto_27314 ) ) ( not ( = ?auto_27316 ?auto_27314 ) ) ( not ( = ?auto_27329 ?auto_27314 ) ) ( not ( = ?auto_27328 ?auto_27314 ) ) ( not ( = ?auto_27330 ?auto_27314 ) ) ( AVAILABLE ?auto_27320 ) ( TRUCK-AT ?auto_27323 ?auto_27325 ) ( LIFTING ?auto_27327 ?auto_27315 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27316 ?auto_27317 ?auto_27318 )
      ( MAKE-4CRATE-VERIFY ?auto_27314 ?auto_27315 ?auto_27316 ?auto_27317 ?auto_27318 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27331 - SURFACE
      ?auto_27332 - SURFACE
      ?auto_27333 - SURFACE
      ?auto_27334 - SURFACE
      ?auto_27335 - SURFACE
      ?auto_27336 - SURFACE
    )
    :vars
    (
      ?auto_27338 - HOIST
      ?auto_27339 - PLACE
      ?auto_27337 - PLACE
      ?auto_27340 - HOIST
      ?auto_27347 - SURFACE
      ?auto_27343 - PLACE
      ?auto_27345 - HOIST
      ?auto_27346 - SURFACE
      ?auto_27342 - PLACE
      ?auto_27344 - HOIST
      ?auto_27348 - SURFACE
      ?auto_27341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27338 ?auto_27339 ) ( IS-CRATE ?auto_27336 ) ( not ( = ?auto_27335 ?auto_27336 ) ) ( not ( = ?auto_27334 ?auto_27335 ) ) ( not ( = ?auto_27334 ?auto_27336 ) ) ( not ( = ?auto_27337 ?auto_27339 ) ) ( HOIST-AT ?auto_27340 ?auto_27337 ) ( not ( = ?auto_27338 ?auto_27340 ) ) ( AVAILABLE ?auto_27340 ) ( SURFACE-AT ?auto_27336 ?auto_27337 ) ( ON ?auto_27336 ?auto_27347 ) ( CLEAR ?auto_27336 ) ( not ( = ?auto_27335 ?auto_27347 ) ) ( not ( = ?auto_27336 ?auto_27347 ) ) ( not ( = ?auto_27334 ?auto_27347 ) ) ( IS-CRATE ?auto_27335 ) ( not ( = ?auto_27343 ?auto_27339 ) ) ( not ( = ?auto_27337 ?auto_27343 ) ) ( HOIST-AT ?auto_27345 ?auto_27343 ) ( not ( = ?auto_27338 ?auto_27345 ) ) ( not ( = ?auto_27340 ?auto_27345 ) ) ( SURFACE-AT ?auto_27335 ?auto_27343 ) ( ON ?auto_27335 ?auto_27346 ) ( CLEAR ?auto_27335 ) ( not ( = ?auto_27335 ?auto_27346 ) ) ( not ( = ?auto_27336 ?auto_27346 ) ) ( not ( = ?auto_27334 ?auto_27346 ) ) ( not ( = ?auto_27347 ?auto_27346 ) ) ( IS-CRATE ?auto_27334 ) ( not ( = ?auto_27333 ?auto_27334 ) ) ( not ( = ?auto_27335 ?auto_27333 ) ) ( not ( = ?auto_27336 ?auto_27333 ) ) ( not ( = ?auto_27347 ?auto_27333 ) ) ( not ( = ?auto_27346 ?auto_27333 ) ) ( not ( = ?auto_27342 ?auto_27339 ) ) ( not ( = ?auto_27337 ?auto_27342 ) ) ( not ( = ?auto_27343 ?auto_27342 ) ) ( HOIST-AT ?auto_27344 ?auto_27342 ) ( not ( = ?auto_27338 ?auto_27344 ) ) ( not ( = ?auto_27340 ?auto_27344 ) ) ( not ( = ?auto_27345 ?auto_27344 ) ) ( AVAILABLE ?auto_27344 ) ( SURFACE-AT ?auto_27334 ?auto_27342 ) ( ON ?auto_27334 ?auto_27348 ) ( CLEAR ?auto_27334 ) ( not ( = ?auto_27335 ?auto_27348 ) ) ( not ( = ?auto_27336 ?auto_27348 ) ) ( not ( = ?auto_27334 ?auto_27348 ) ) ( not ( = ?auto_27347 ?auto_27348 ) ) ( not ( = ?auto_27346 ?auto_27348 ) ) ( not ( = ?auto_27333 ?auto_27348 ) ) ( SURFACE-AT ?auto_27332 ?auto_27339 ) ( CLEAR ?auto_27332 ) ( IS-CRATE ?auto_27333 ) ( not ( = ?auto_27332 ?auto_27333 ) ) ( not ( = ?auto_27335 ?auto_27332 ) ) ( not ( = ?auto_27336 ?auto_27332 ) ) ( not ( = ?auto_27334 ?auto_27332 ) ) ( not ( = ?auto_27347 ?auto_27332 ) ) ( not ( = ?auto_27346 ?auto_27332 ) ) ( not ( = ?auto_27348 ?auto_27332 ) ) ( AVAILABLE ?auto_27338 ) ( TRUCK-AT ?auto_27341 ?auto_27343 ) ( LIFTING ?auto_27345 ?auto_27333 ) ( ON ?auto_27332 ?auto_27331 ) ( not ( = ?auto_27331 ?auto_27332 ) ) ( not ( = ?auto_27331 ?auto_27333 ) ) ( not ( = ?auto_27331 ?auto_27334 ) ) ( not ( = ?auto_27331 ?auto_27335 ) ) ( not ( = ?auto_27331 ?auto_27336 ) ) ( not ( = ?auto_27331 ?auto_27347 ) ) ( not ( = ?auto_27331 ?auto_27346 ) ) ( not ( = ?auto_27331 ?auto_27348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27334 ?auto_27335 ?auto_27336 )
      ( MAKE-5CRATE-VERIFY ?auto_27331 ?auto_27332 ?auto_27333 ?auto_27334 ?auto_27335 ?auto_27336 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27349 - SURFACE
      ?auto_27350 - SURFACE
    )
    :vars
    (
      ?auto_27352 - HOIST
      ?auto_27353 - PLACE
      ?auto_27361 - SURFACE
      ?auto_27351 - PLACE
      ?auto_27355 - HOIST
      ?auto_27363 - SURFACE
      ?auto_27358 - PLACE
      ?auto_27360 - HOIST
      ?auto_27362 - SURFACE
      ?auto_27365 - SURFACE
      ?auto_27357 - PLACE
      ?auto_27359 - HOIST
      ?auto_27364 - SURFACE
      ?auto_27354 - SURFACE
      ?auto_27356 - TRUCK
      ?auto_27366 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27352 ?auto_27353 ) ( IS-CRATE ?auto_27350 ) ( not ( = ?auto_27349 ?auto_27350 ) ) ( not ( = ?auto_27361 ?auto_27349 ) ) ( not ( = ?auto_27361 ?auto_27350 ) ) ( not ( = ?auto_27351 ?auto_27353 ) ) ( HOIST-AT ?auto_27355 ?auto_27351 ) ( not ( = ?auto_27352 ?auto_27355 ) ) ( AVAILABLE ?auto_27355 ) ( SURFACE-AT ?auto_27350 ?auto_27351 ) ( ON ?auto_27350 ?auto_27363 ) ( CLEAR ?auto_27350 ) ( not ( = ?auto_27349 ?auto_27363 ) ) ( not ( = ?auto_27350 ?auto_27363 ) ) ( not ( = ?auto_27361 ?auto_27363 ) ) ( IS-CRATE ?auto_27349 ) ( not ( = ?auto_27358 ?auto_27353 ) ) ( not ( = ?auto_27351 ?auto_27358 ) ) ( HOIST-AT ?auto_27360 ?auto_27358 ) ( not ( = ?auto_27352 ?auto_27360 ) ) ( not ( = ?auto_27355 ?auto_27360 ) ) ( SURFACE-AT ?auto_27349 ?auto_27358 ) ( ON ?auto_27349 ?auto_27362 ) ( CLEAR ?auto_27349 ) ( not ( = ?auto_27349 ?auto_27362 ) ) ( not ( = ?auto_27350 ?auto_27362 ) ) ( not ( = ?auto_27361 ?auto_27362 ) ) ( not ( = ?auto_27363 ?auto_27362 ) ) ( IS-CRATE ?auto_27361 ) ( not ( = ?auto_27365 ?auto_27361 ) ) ( not ( = ?auto_27349 ?auto_27365 ) ) ( not ( = ?auto_27350 ?auto_27365 ) ) ( not ( = ?auto_27363 ?auto_27365 ) ) ( not ( = ?auto_27362 ?auto_27365 ) ) ( not ( = ?auto_27357 ?auto_27353 ) ) ( not ( = ?auto_27351 ?auto_27357 ) ) ( not ( = ?auto_27358 ?auto_27357 ) ) ( HOIST-AT ?auto_27359 ?auto_27357 ) ( not ( = ?auto_27352 ?auto_27359 ) ) ( not ( = ?auto_27355 ?auto_27359 ) ) ( not ( = ?auto_27360 ?auto_27359 ) ) ( AVAILABLE ?auto_27359 ) ( SURFACE-AT ?auto_27361 ?auto_27357 ) ( ON ?auto_27361 ?auto_27364 ) ( CLEAR ?auto_27361 ) ( not ( = ?auto_27349 ?auto_27364 ) ) ( not ( = ?auto_27350 ?auto_27364 ) ) ( not ( = ?auto_27361 ?auto_27364 ) ) ( not ( = ?auto_27363 ?auto_27364 ) ) ( not ( = ?auto_27362 ?auto_27364 ) ) ( not ( = ?auto_27365 ?auto_27364 ) ) ( SURFACE-AT ?auto_27354 ?auto_27353 ) ( CLEAR ?auto_27354 ) ( IS-CRATE ?auto_27365 ) ( not ( = ?auto_27354 ?auto_27365 ) ) ( not ( = ?auto_27349 ?auto_27354 ) ) ( not ( = ?auto_27350 ?auto_27354 ) ) ( not ( = ?auto_27361 ?auto_27354 ) ) ( not ( = ?auto_27363 ?auto_27354 ) ) ( not ( = ?auto_27362 ?auto_27354 ) ) ( not ( = ?auto_27364 ?auto_27354 ) ) ( AVAILABLE ?auto_27352 ) ( TRUCK-AT ?auto_27356 ?auto_27358 ) ( AVAILABLE ?auto_27360 ) ( SURFACE-AT ?auto_27365 ?auto_27358 ) ( ON ?auto_27365 ?auto_27366 ) ( CLEAR ?auto_27365 ) ( not ( = ?auto_27349 ?auto_27366 ) ) ( not ( = ?auto_27350 ?auto_27366 ) ) ( not ( = ?auto_27361 ?auto_27366 ) ) ( not ( = ?auto_27363 ?auto_27366 ) ) ( not ( = ?auto_27362 ?auto_27366 ) ) ( not ( = ?auto_27365 ?auto_27366 ) ) ( not ( = ?auto_27364 ?auto_27366 ) ) ( not ( = ?auto_27354 ?auto_27366 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27360 ?auto_27365 ?auto_27366 ?auto_27358 )
      ( MAKE-2CRATE ?auto_27361 ?auto_27349 ?auto_27350 )
      ( MAKE-1CRATE-VERIFY ?auto_27349 ?auto_27350 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27367 - SURFACE
      ?auto_27368 - SURFACE
      ?auto_27369 - SURFACE
    )
    :vars
    (
      ?auto_27380 - HOIST
      ?auto_27374 - PLACE
      ?auto_27379 - PLACE
      ?auto_27381 - HOIST
      ?auto_27377 - SURFACE
      ?auto_27371 - PLACE
      ?auto_27370 - HOIST
      ?auto_27382 - SURFACE
      ?auto_27376 - SURFACE
      ?auto_27378 - PLACE
      ?auto_27373 - HOIST
      ?auto_27383 - SURFACE
      ?auto_27375 - SURFACE
      ?auto_27384 - TRUCK
      ?auto_27372 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27380 ?auto_27374 ) ( IS-CRATE ?auto_27369 ) ( not ( = ?auto_27368 ?auto_27369 ) ) ( not ( = ?auto_27367 ?auto_27368 ) ) ( not ( = ?auto_27367 ?auto_27369 ) ) ( not ( = ?auto_27379 ?auto_27374 ) ) ( HOIST-AT ?auto_27381 ?auto_27379 ) ( not ( = ?auto_27380 ?auto_27381 ) ) ( AVAILABLE ?auto_27381 ) ( SURFACE-AT ?auto_27369 ?auto_27379 ) ( ON ?auto_27369 ?auto_27377 ) ( CLEAR ?auto_27369 ) ( not ( = ?auto_27368 ?auto_27377 ) ) ( not ( = ?auto_27369 ?auto_27377 ) ) ( not ( = ?auto_27367 ?auto_27377 ) ) ( IS-CRATE ?auto_27368 ) ( not ( = ?auto_27371 ?auto_27374 ) ) ( not ( = ?auto_27379 ?auto_27371 ) ) ( HOIST-AT ?auto_27370 ?auto_27371 ) ( not ( = ?auto_27380 ?auto_27370 ) ) ( not ( = ?auto_27381 ?auto_27370 ) ) ( SURFACE-AT ?auto_27368 ?auto_27371 ) ( ON ?auto_27368 ?auto_27382 ) ( CLEAR ?auto_27368 ) ( not ( = ?auto_27368 ?auto_27382 ) ) ( not ( = ?auto_27369 ?auto_27382 ) ) ( not ( = ?auto_27367 ?auto_27382 ) ) ( not ( = ?auto_27377 ?auto_27382 ) ) ( IS-CRATE ?auto_27367 ) ( not ( = ?auto_27376 ?auto_27367 ) ) ( not ( = ?auto_27368 ?auto_27376 ) ) ( not ( = ?auto_27369 ?auto_27376 ) ) ( not ( = ?auto_27377 ?auto_27376 ) ) ( not ( = ?auto_27382 ?auto_27376 ) ) ( not ( = ?auto_27378 ?auto_27374 ) ) ( not ( = ?auto_27379 ?auto_27378 ) ) ( not ( = ?auto_27371 ?auto_27378 ) ) ( HOIST-AT ?auto_27373 ?auto_27378 ) ( not ( = ?auto_27380 ?auto_27373 ) ) ( not ( = ?auto_27381 ?auto_27373 ) ) ( not ( = ?auto_27370 ?auto_27373 ) ) ( AVAILABLE ?auto_27373 ) ( SURFACE-AT ?auto_27367 ?auto_27378 ) ( ON ?auto_27367 ?auto_27383 ) ( CLEAR ?auto_27367 ) ( not ( = ?auto_27368 ?auto_27383 ) ) ( not ( = ?auto_27369 ?auto_27383 ) ) ( not ( = ?auto_27367 ?auto_27383 ) ) ( not ( = ?auto_27377 ?auto_27383 ) ) ( not ( = ?auto_27382 ?auto_27383 ) ) ( not ( = ?auto_27376 ?auto_27383 ) ) ( SURFACE-AT ?auto_27375 ?auto_27374 ) ( CLEAR ?auto_27375 ) ( IS-CRATE ?auto_27376 ) ( not ( = ?auto_27375 ?auto_27376 ) ) ( not ( = ?auto_27368 ?auto_27375 ) ) ( not ( = ?auto_27369 ?auto_27375 ) ) ( not ( = ?auto_27367 ?auto_27375 ) ) ( not ( = ?auto_27377 ?auto_27375 ) ) ( not ( = ?auto_27382 ?auto_27375 ) ) ( not ( = ?auto_27383 ?auto_27375 ) ) ( AVAILABLE ?auto_27380 ) ( TRUCK-AT ?auto_27384 ?auto_27371 ) ( AVAILABLE ?auto_27370 ) ( SURFACE-AT ?auto_27376 ?auto_27371 ) ( ON ?auto_27376 ?auto_27372 ) ( CLEAR ?auto_27376 ) ( not ( = ?auto_27368 ?auto_27372 ) ) ( not ( = ?auto_27369 ?auto_27372 ) ) ( not ( = ?auto_27367 ?auto_27372 ) ) ( not ( = ?auto_27377 ?auto_27372 ) ) ( not ( = ?auto_27382 ?auto_27372 ) ) ( not ( = ?auto_27376 ?auto_27372 ) ) ( not ( = ?auto_27383 ?auto_27372 ) ) ( not ( = ?auto_27375 ?auto_27372 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27368 ?auto_27369 )
      ( MAKE-2CRATE-VERIFY ?auto_27367 ?auto_27368 ?auto_27369 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27385 - SURFACE
      ?auto_27386 - SURFACE
      ?auto_27387 - SURFACE
      ?auto_27388 - SURFACE
    )
    :vars
    (
      ?auto_27396 - HOIST
      ?auto_27391 - PLACE
      ?auto_27398 - PLACE
      ?auto_27389 - HOIST
      ?auto_27402 - SURFACE
      ?auto_27390 - PLACE
      ?auto_27395 - HOIST
      ?auto_27394 - SURFACE
      ?auto_27401 - PLACE
      ?auto_27392 - HOIST
      ?auto_27397 - SURFACE
      ?auto_27399 - SURFACE
      ?auto_27400 - TRUCK
      ?auto_27393 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27396 ?auto_27391 ) ( IS-CRATE ?auto_27388 ) ( not ( = ?auto_27387 ?auto_27388 ) ) ( not ( = ?auto_27386 ?auto_27387 ) ) ( not ( = ?auto_27386 ?auto_27388 ) ) ( not ( = ?auto_27398 ?auto_27391 ) ) ( HOIST-AT ?auto_27389 ?auto_27398 ) ( not ( = ?auto_27396 ?auto_27389 ) ) ( AVAILABLE ?auto_27389 ) ( SURFACE-AT ?auto_27388 ?auto_27398 ) ( ON ?auto_27388 ?auto_27402 ) ( CLEAR ?auto_27388 ) ( not ( = ?auto_27387 ?auto_27402 ) ) ( not ( = ?auto_27388 ?auto_27402 ) ) ( not ( = ?auto_27386 ?auto_27402 ) ) ( IS-CRATE ?auto_27387 ) ( not ( = ?auto_27390 ?auto_27391 ) ) ( not ( = ?auto_27398 ?auto_27390 ) ) ( HOIST-AT ?auto_27395 ?auto_27390 ) ( not ( = ?auto_27396 ?auto_27395 ) ) ( not ( = ?auto_27389 ?auto_27395 ) ) ( SURFACE-AT ?auto_27387 ?auto_27390 ) ( ON ?auto_27387 ?auto_27394 ) ( CLEAR ?auto_27387 ) ( not ( = ?auto_27387 ?auto_27394 ) ) ( not ( = ?auto_27388 ?auto_27394 ) ) ( not ( = ?auto_27386 ?auto_27394 ) ) ( not ( = ?auto_27402 ?auto_27394 ) ) ( IS-CRATE ?auto_27386 ) ( not ( = ?auto_27385 ?auto_27386 ) ) ( not ( = ?auto_27387 ?auto_27385 ) ) ( not ( = ?auto_27388 ?auto_27385 ) ) ( not ( = ?auto_27402 ?auto_27385 ) ) ( not ( = ?auto_27394 ?auto_27385 ) ) ( not ( = ?auto_27401 ?auto_27391 ) ) ( not ( = ?auto_27398 ?auto_27401 ) ) ( not ( = ?auto_27390 ?auto_27401 ) ) ( HOIST-AT ?auto_27392 ?auto_27401 ) ( not ( = ?auto_27396 ?auto_27392 ) ) ( not ( = ?auto_27389 ?auto_27392 ) ) ( not ( = ?auto_27395 ?auto_27392 ) ) ( AVAILABLE ?auto_27392 ) ( SURFACE-AT ?auto_27386 ?auto_27401 ) ( ON ?auto_27386 ?auto_27397 ) ( CLEAR ?auto_27386 ) ( not ( = ?auto_27387 ?auto_27397 ) ) ( not ( = ?auto_27388 ?auto_27397 ) ) ( not ( = ?auto_27386 ?auto_27397 ) ) ( not ( = ?auto_27402 ?auto_27397 ) ) ( not ( = ?auto_27394 ?auto_27397 ) ) ( not ( = ?auto_27385 ?auto_27397 ) ) ( SURFACE-AT ?auto_27399 ?auto_27391 ) ( CLEAR ?auto_27399 ) ( IS-CRATE ?auto_27385 ) ( not ( = ?auto_27399 ?auto_27385 ) ) ( not ( = ?auto_27387 ?auto_27399 ) ) ( not ( = ?auto_27388 ?auto_27399 ) ) ( not ( = ?auto_27386 ?auto_27399 ) ) ( not ( = ?auto_27402 ?auto_27399 ) ) ( not ( = ?auto_27394 ?auto_27399 ) ) ( not ( = ?auto_27397 ?auto_27399 ) ) ( AVAILABLE ?auto_27396 ) ( TRUCK-AT ?auto_27400 ?auto_27390 ) ( AVAILABLE ?auto_27395 ) ( SURFACE-AT ?auto_27385 ?auto_27390 ) ( ON ?auto_27385 ?auto_27393 ) ( CLEAR ?auto_27385 ) ( not ( = ?auto_27387 ?auto_27393 ) ) ( not ( = ?auto_27388 ?auto_27393 ) ) ( not ( = ?auto_27386 ?auto_27393 ) ) ( not ( = ?auto_27402 ?auto_27393 ) ) ( not ( = ?auto_27394 ?auto_27393 ) ) ( not ( = ?auto_27385 ?auto_27393 ) ) ( not ( = ?auto_27397 ?auto_27393 ) ) ( not ( = ?auto_27399 ?auto_27393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27386 ?auto_27387 ?auto_27388 )
      ( MAKE-3CRATE-VERIFY ?auto_27385 ?auto_27386 ?auto_27387 ?auto_27388 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27403 - SURFACE
      ?auto_27404 - SURFACE
      ?auto_27405 - SURFACE
      ?auto_27406 - SURFACE
      ?auto_27407 - SURFACE
    )
    :vars
    (
      ?auto_27415 - HOIST
      ?auto_27410 - PLACE
      ?auto_27417 - PLACE
      ?auto_27408 - HOIST
      ?auto_27420 - SURFACE
      ?auto_27409 - PLACE
      ?auto_27414 - HOIST
      ?auto_27413 - SURFACE
      ?auto_27419 - PLACE
      ?auto_27411 - HOIST
      ?auto_27416 - SURFACE
      ?auto_27418 - TRUCK
      ?auto_27412 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27415 ?auto_27410 ) ( IS-CRATE ?auto_27407 ) ( not ( = ?auto_27406 ?auto_27407 ) ) ( not ( = ?auto_27405 ?auto_27406 ) ) ( not ( = ?auto_27405 ?auto_27407 ) ) ( not ( = ?auto_27417 ?auto_27410 ) ) ( HOIST-AT ?auto_27408 ?auto_27417 ) ( not ( = ?auto_27415 ?auto_27408 ) ) ( AVAILABLE ?auto_27408 ) ( SURFACE-AT ?auto_27407 ?auto_27417 ) ( ON ?auto_27407 ?auto_27420 ) ( CLEAR ?auto_27407 ) ( not ( = ?auto_27406 ?auto_27420 ) ) ( not ( = ?auto_27407 ?auto_27420 ) ) ( not ( = ?auto_27405 ?auto_27420 ) ) ( IS-CRATE ?auto_27406 ) ( not ( = ?auto_27409 ?auto_27410 ) ) ( not ( = ?auto_27417 ?auto_27409 ) ) ( HOIST-AT ?auto_27414 ?auto_27409 ) ( not ( = ?auto_27415 ?auto_27414 ) ) ( not ( = ?auto_27408 ?auto_27414 ) ) ( SURFACE-AT ?auto_27406 ?auto_27409 ) ( ON ?auto_27406 ?auto_27413 ) ( CLEAR ?auto_27406 ) ( not ( = ?auto_27406 ?auto_27413 ) ) ( not ( = ?auto_27407 ?auto_27413 ) ) ( not ( = ?auto_27405 ?auto_27413 ) ) ( not ( = ?auto_27420 ?auto_27413 ) ) ( IS-CRATE ?auto_27405 ) ( not ( = ?auto_27404 ?auto_27405 ) ) ( not ( = ?auto_27406 ?auto_27404 ) ) ( not ( = ?auto_27407 ?auto_27404 ) ) ( not ( = ?auto_27420 ?auto_27404 ) ) ( not ( = ?auto_27413 ?auto_27404 ) ) ( not ( = ?auto_27419 ?auto_27410 ) ) ( not ( = ?auto_27417 ?auto_27419 ) ) ( not ( = ?auto_27409 ?auto_27419 ) ) ( HOIST-AT ?auto_27411 ?auto_27419 ) ( not ( = ?auto_27415 ?auto_27411 ) ) ( not ( = ?auto_27408 ?auto_27411 ) ) ( not ( = ?auto_27414 ?auto_27411 ) ) ( AVAILABLE ?auto_27411 ) ( SURFACE-AT ?auto_27405 ?auto_27419 ) ( ON ?auto_27405 ?auto_27416 ) ( CLEAR ?auto_27405 ) ( not ( = ?auto_27406 ?auto_27416 ) ) ( not ( = ?auto_27407 ?auto_27416 ) ) ( not ( = ?auto_27405 ?auto_27416 ) ) ( not ( = ?auto_27420 ?auto_27416 ) ) ( not ( = ?auto_27413 ?auto_27416 ) ) ( not ( = ?auto_27404 ?auto_27416 ) ) ( SURFACE-AT ?auto_27403 ?auto_27410 ) ( CLEAR ?auto_27403 ) ( IS-CRATE ?auto_27404 ) ( not ( = ?auto_27403 ?auto_27404 ) ) ( not ( = ?auto_27406 ?auto_27403 ) ) ( not ( = ?auto_27407 ?auto_27403 ) ) ( not ( = ?auto_27405 ?auto_27403 ) ) ( not ( = ?auto_27420 ?auto_27403 ) ) ( not ( = ?auto_27413 ?auto_27403 ) ) ( not ( = ?auto_27416 ?auto_27403 ) ) ( AVAILABLE ?auto_27415 ) ( TRUCK-AT ?auto_27418 ?auto_27409 ) ( AVAILABLE ?auto_27414 ) ( SURFACE-AT ?auto_27404 ?auto_27409 ) ( ON ?auto_27404 ?auto_27412 ) ( CLEAR ?auto_27404 ) ( not ( = ?auto_27406 ?auto_27412 ) ) ( not ( = ?auto_27407 ?auto_27412 ) ) ( not ( = ?auto_27405 ?auto_27412 ) ) ( not ( = ?auto_27420 ?auto_27412 ) ) ( not ( = ?auto_27413 ?auto_27412 ) ) ( not ( = ?auto_27404 ?auto_27412 ) ) ( not ( = ?auto_27416 ?auto_27412 ) ) ( not ( = ?auto_27403 ?auto_27412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27405 ?auto_27406 ?auto_27407 )
      ( MAKE-4CRATE-VERIFY ?auto_27403 ?auto_27404 ?auto_27405 ?auto_27406 ?auto_27407 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27421 - SURFACE
      ?auto_27422 - SURFACE
      ?auto_27423 - SURFACE
      ?auto_27424 - SURFACE
      ?auto_27425 - SURFACE
      ?auto_27426 - SURFACE
    )
    :vars
    (
      ?auto_27434 - HOIST
      ?auto_27429 - PLACE
      ?auto_27436 - PLACE
      ?auto_27427 - HOIST
      ?auto_27439 - SURFACE
      ?auto_27428 - PLACE
      ?auto_27433 - HOIST
      ?auto_27432 - SURFACE
      ?auto_27438 - PLACE
      ?auto_27430 - HOIST
      ?auto_27435 - SURFACE
      ?auto_27437 - TRUCK
      ?auto_27431 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27434 ?auto_27429 ) ( IS-CRATE ?auto_27426 ) ( not ( = ?auto_27425 ?auto_27426 ) ) ( not ( = ?auto_27424 ?auto_27425 ) ) ( not ( = ?auto_27424 ?auto_27426 ) ) ( not ( = ?auto_27436 ?auto_27429 ) ) ( HOIST-AT ?auto_27427 ?auto_27436 ) ( not ( = ?auto_27434 ?auto_27427 ) ) ( AVAILABLE ?auto_27427 ) ( SURFACE-AT ?auto_27426 ?auto_27436 ) ( ON ?auto_27426 ?auto_27439 ) ( CLEAR ?auto_27426 ) ( not ( = ?auto_27425 ?auto_27439 ) ) ( not ( = ?auto_27426 ?auto_27439 ) ) ( not ( = ?auto_27424 ?auto_27439 ) ) ( IS-CRATE ?auto_27425 ) ( not ( = ?auto_27428 ?auto_27429 ) ) ( not ( = ?auto_27436 ?auto_27428 ) ) ( HOIST-AT ?auto_27433 ?auto_27428 ) ( not ( = ?auto_27434 ?auto_27433 ) ) ( not ( = ?auto_27427 ?auto_27433 ) ) ( SURFACE-AT ?auto_27425 ?auto_27428 ) ( ON ?auto_27425 ?auto_27432 ) ( CLEAR ?auto_27425 ) ( not ( = ?auto_27425 ?auto_27432 ) ) ( not ( = ?auto_27426 ?auto_27432 ) ) ( not ( = ?auto_27424 ?auto_27432 ) ) ( not ( = ?auto_27439 ?auto_27432 ) ) ( IS-CRATE ?auto_27424 ) ( not ( = ?auto_27423 ?auto_27424 ) ) ( not ( = ?auto_27425 ?auto_27423 ) ) ( not ( = ?auto_27426 ?auto_27423 ) ) ( not ( = ?auto_27439 ?auto_27423 ) ) ( not ( = ?auto_27432 ?auto_27423 ) ) ( not ( = ?auto_27438 ?auto_27429 ) ) ( not ( = ?auto_27436 ?auto_27438 ) ) ( not ( = ?auto_27428 ?auto_27438 ) ) ( HOIST-AT ?auto_27430 ?auto_27438 ) ( not ( = ?auto_27434 ?auto_27430 ) ) ( not ( = ?auto_27427 ?auto_27430 ) ) ( not ( = ?auto_27433 ?auto_27430 ) ) ( AVAILABLE ?auto_27430 ) ( SURFACE-AT ?auto_27424 ?auto_27438 ) ( ON ?auto_27424 ?auto_27435 ) ( CLEAR ?auto_27424 ) ( not ( = ?auto_27425 ?auto_27435 ) ) ( not ( = ?auto_27426 ?auto_27435 ) ) ( not ( = ?auto_27424 ?auto_27435 ) ) ( not ( = ?auto_27439 ?auto_27435 ) ) ( not ( = ?auto_27432 ?auto_27435 ) ) ( not ( = ?auto_27423 ?auto_27435 ) ) ( SURFACE-AT ?auto_27422 ?auto_27429 ) ( CLEAR ?auto_27422 ) ( IS-CRATE ?auto_27423 ) ( not ( = ?auto_27422 ?auto_27423 ) ) ( not ( = ?auto_27425 ?auto_27422 ) ) ( not ( = ?auto_27426 ?auto_27422 ) ) ( not ( = ?auto_27424 ?auto_27422 ) ) ( not ( = ?auto_27439 ?auto_27422 ) ) ( not ( = ?auto_27432 ?auto_27422 ) ) ( not ( = ?auto_27435 ?auto_27422 ) ) ( AVAILABLE ?auto_27434 ) ( TRUCK-AT ?auto_27437 ?auto_27428 ) ( AVAILABLE ?auto_27433 ) ( SURFACE-AT ?auto_27423 ?auto_27428 ) ( ON ?auto_27423 ?auto_27431 ) ( CLEAR ?auto_27423 ) ( not ( = ?auto_27425 ?auto_27431 ) ) ( not ( = ?auto_27426 ?auto_27431 ) ) ( not ( = ?auto_27424 ?auto_27431 ) ) ( not ( = ?auto_27439 ?auto_27431 ) ) ( not ( = ?auto_27432 ?auto_27431 ) ) ( not ( = ?auto_27423 ?auto_27431 ) ) ( not ( = ?auto_27435 ?auto_27431 ) ) ( not ( = ?auto_27422 ?auto_27431 ) ) ( ON ?auto_27422 ?auto_27421 ) ( not ( = ?auto_27421 ?auto_27422 ) ) ( not ( = ?auto_27421 ?auto_27423 ) ) ( not ( = ?auto_27421 ?auto_27424 ) ) ( not ( = ?auto_27421 ?auto_27425 ) ) ( not ( = ?auto_27421 ?auto_27426 ) ) ( not ( = ?auto_27421 ?auto_27439 ) ) ( not ( = ?auto_27421 ?auto_27432 ) ) ( not ( = ?auto_27421 ?auto_27435 ) ) ( not ( = ?auto_27421 ?auto_27431 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27424 ?auto_27425 ?auto_27426 )
      ( MAKE-5CRATE-VERIFY ?auto_27421 ?auto_27422 ?auto_27423 ?auto_27424 ?auto_27425 ?auto_27426 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27440 - SURFACE
      ?auto_27441 - SURFACE
    )
    :vars
    (
      ?auto_27450 - HOIST
      ?auto_27445 - PLACE
      ?auto_27444 - SURFACE
      ?auto_27452 - PLACE
      ?auto_27442 - HOIST
      ?auto_27457 - SURFACE
      ?auto_27443 - PLACE
      ?auto_27449 - HOIST
      ?auto_27448 - SURFACE
      ?auto_27454 - SURFACE
      ?auto_27456 - PLACE
      ?auto_27446 - HOIST
      ?auto_27451 - SURFACE
      ?auto_27453 - SURFACE
      ?auto_27447 - SURFACE
      ?auto_27455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27450 ?auto_27445 ) ( IS-CRATE ?auto_27441 ) ( not ( = ?auto_27440 ?auto_27441 ) ) ( not ( = ?auto_27444 ?auto_27440 ) ) ( not ( = ?auto_27444 ?auto_27441 ) ) ( not ( = ?auto_27452 ?auto_27445 ) ) ( HOIST-AT ?auto_27442 ?auto_27452 ) ( not ( = ?auto_27450 ?auto_27442 ) ) ( AVAILABLE ?auto_27442 ) ( SURFACE-AT ?auto_27441 ?auto_27452 ) ( ON ?auto_27441 ?auto_27457 ) ( CLEAR ?auto_27441 ) ( not ( = ?auto_27440 ?auto_27457 ) ) ( not ( = ?auto_27441 ?auto_27457 ) ) ( not ( = ?auto_27444 ?auto_27457 ) ) ( IS-CRATE ?auto_27440 ) ( not ( = ?auto_27443 ?auto_27445 ) ) ( not ( = ?auto_27452 ?auto_27443 ) ) ( HOIST-AT ?auto_27449 ?auto_27443 ) ( not ( = ?auto_27450 ?auto_27449 ) ) ( not ( = ?auto_27442 ?auto_27449 ) ) ( SURFACE-AT ?auto_27440 ?auto_27443 ) ( ON ?auto_27440 ?auto_27448 ) ( CLEAR ?auto_27440 ) ( not ( = ?auto_27440 ?auto_27448 ) ) ( not ( = ?auto_27441 ?auto_27448 ) ) ( not ( = ?auto_27444 ?auto_27448 ) ) ( not ( = ?auto_27457 ?auto_27448 ) ) ( IS-CRATE ?auto_27444 ) ( not ( = ?auto_27454 ?auto_27444 ) ) ( not ( = ?auto_27440 ?auto_27454 ) ) ( not ( = ?auto_27441 ?auto_27454 ) ) ( not ( = ?auto_27457 ?auto_27454 ) ) ( not ( = ?auto_27448 ?auto_27454 ) ) ( not ( = ?auto_27456 ?auto_27445 ) ) ( not ( = ?auto_27452 ?auto_27456 ) ) ( not ( = ?auto_27443 ?auto_27456 ) ) ( HOIST-AT ?auto_27446 ?auto_27456 ) ( not ( = ?auto_27450 ?auto_27446 ) ) ( not ( = ?auto_27442 ?auto_27446 ) ) ( not ( = ?auto_27449 ?auto_27446 ) ) ( AVAILABLE ?auto_27446 ) ( SURFACE-AT ?auto_27444 ?auto_27456 ) ( ON ?auto_27444 ?auto_27451 ) ( CLEAR ?auto_27444 ) ( not ( = ?auto_27440 ?auto_27451 ) ) ( not ( = ?auto_27441 ?auto_27451 ) ) ( not ( = ?auto_27444 ?auto_27451 ) ) ( not ( = ?auto_27457 ?auto_27451 ) ) ( not ( = ?auto_27448 ?auto_27451 ) ) ( not ( = ?auto_27454 ?auto_27451 ) ) ( SURFACE-AT ?auto_27453 ?auto_27445 ) ( CLEAR ?auto_27453 ) ( IS-CRATE ?auto_27454 ) ( not ( = ?auto_27453 ?auto_27454 ) ) ( not ( = ?auto_27440 ?auto_27453 ) ) ( not ( = ?auto_27441 ?auto_27453 ) ) ( not ( = ?auto_27444 ?auto_27453 ) ) ( not ( = ?auto_27457 ?auto_27453 ) ) ( not ( = ?auto_27448 ?auto_27453 ) ) ( not ( = ?auto_27451 ?auto_27453 ) ) ( AVAILABLE ?auto_27450 ) ( AVAILABLE ?auto_27449 ) ( SURFACE-AT ?auto_27454 ?auto_27443 ) ( ON ?auto_27454 ?auto_27447 ) ( CLEAR ?auto_27454 ) ( not ( = ?auto_27440 ?auto_27447 ) ) ( not ( = ?auto_27441 ?auto_27447 ) ) ( not ( = ?auto_27444 ?auto_27447 ) ) ( not ( = ?auto_27457 ?auto_27447 ) ) ( not ( = ?auto_27448 ?auto_27447 ) ) ( not ( = ?auto_27454 ?auto_27447 ) ) ( not ( = ?auto_27451 ?auto_27447 ) ) ( not ( = ?auto_27453 ?auto_27447 ) ) ( TRUCK-AT ?auto_27455 ?auto_27445 ) )
    :subtasks
    ( ( !DRIVE ?auto_27455 ?auto_27445 ?auto_27443 )
      ( MAKE-2CRATE ?auto_27444 ?auto_27440 ?auto_27441 )
      ( MAKE-1CRATE-VERIFY ?auto_27440 ?auto_27441 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27458 - SURFACE
      ?auto_27459 - SURFACE
      ?auto_27460 - SURFACE
    )
    :vars
    (
      ?auto_27461 - HOIST
      ?auto_27462 - PLACE
      ?auto_27474 - PLACE
      ?auto_27468 - HOIST
      ?auto_27470 - SURFACE
      ?auto_27472 - PLACE
      ?auto_27464 - HOIST
      ?auto_27469 - SURFACE
      ?auto_27471 - SURFACE
      ?auto_27466 - PLACE
      ?auto_27467 - HOIST
      ?auto_27465 - SURFACE
      ?auto_27473 - SURFACE
      ?auto_27475 - SURFACE
      ?auto_27463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27461 ?auto_27462 ) ( IS-CRATE ?auto_27460 ) ( not ( = ?auto_27459 ?auto_27460 ) ) ( not ( = ?auto_27458 ?auto_27459 ) ) ( not ( = ?auto_27458 ?auto_27460 ) ) ( not ( = ?auto_27474 ?auto_27462 ) ) ( HOIST-AT ?auto_27468 ?auto_27474 ) ( not ( = ?auto_27461 ?auto_27468 ) ) ( AVAILABLE ?auto_27468 ) ( SURFACE-AT ?auto_27460 ?auto_27474 ) ( ON ?auto_27460 ?auto_27470 ) ( CLEAR ?auto_27460 ) ( not ( = ?auto_27459 ?auto_27470 ) ) ( not ( = ?auto_27460 ?auto_27470 ) ) ( not ( = ?auto_27458 ?auto_27470 ) ) ( IS-CRATE ?auto_27459 ) ( not ( = ?auto_27472 ?auto_27462 ) ) ( not ( = ?auto_27474 ?auto_27472 ) ) ( HOIST-AT ?auto_27464 ?auto_27472 ) ( not ( = ?auto_27461 ?auto_27464 ) ) ( not ( = ?auto_27468 ?auto_27464 ) ) ( SURFACE-AT ?auto_27459 ?auto_27472 ) ( ON ?auto_27459 ?auto_27469 ) ( CLEAR ?auto_27459 ) ( not ( = ?auto_27459 ?auto_27469 ) ) ( not ( = ?auto_27460 ?auto_27469 ) ) ( not ( = ?auto_27458 ?auto_27469 ) ) ( not ( = ?auto_27470 ?auto_27469 ) ) ( IS-CRATE ?auto_27458 ) ( not ( = ?auto_27471 ?auto_27458 ) ) ( not ( = ?auto_27459 ?auto_27471 ) ) ( not ( = ?auto_27460 ?auto_27471 ) ) ( not ( = ?auto_27470 ?auto_27471 ) ) ( not ( = ?auto_27469 ?auto_27471 ) ) ( not ( = ?auto_27466 ?auto_27462 ) ) ( not ( = ?auto_27474 ?auto_27466 ) ) ( not ( = ?auto_27472 ?auto_27466 ) ) ( HOIST-AT ?auto_27467 ?auto_27466 ) ( not ( = ?auto_27461 ?auto_27467 ) ) ( not ( = ?auto_27468 ?auto_27467 ) ) ( not ( = ?auto_27464 ?auto_27467 ) ) ( AVAILABLE ?auto_27467 ) ( SURFACE-AT ?auto_27458 ?auto_27466 ) ( ON ?auto_27458 ?auto_27465 ) ( CLEAR ?auto_27458 ) ( not ( = ?auto_27459 ?auto_27465 ) ) ( not ( = ?auto_27460 ?auto_27465 ) ) ( not ( = ?auto_27458 ?auto_27465 ) ) ( not ( = ?auto_27470 ?auto_27465 ) ) ( not ( = ?auto_27469 ?auto_27465 ) ) ( not ( = ?auto_27471 ?auto_27465 ) ) ( SURFACE-AT ?auto_27473 ?auto_27462 ) ( CLEAR ?auto_27473 ) ( IS-CRATE ?auto_27471 ) ( not ( = ?auto_27473 ?auto_27471 ) ) ( not ( = ?auto_27459 ?auto_27473 ) ) ( not ( = ?auto_27460 ?auto_27473 ) ) ( not ( = ?auto_27458 ?auto_27473 ) ) ( not ( = ?auto_27470 ?auto_27473 ) ) ( not ( = ?auto_27469 ?auto_27473 ) ) ( not ( = ?auto_27465 ?auto_27473 ) ) ( AVAILABLE ?auto_27461 ) ( AVAILABLE ?auto_27464 ) ( SURFACE-AT ?auto_27471 ?auto_27472 ) ( ON ?auto_27471 ?auto_27475 ) ( CLEAR ?auto_27471 ) ( not ( = ?auto_27459 ?auto_27475 ) ) ( not ( = ?auto_27460 ?auto_27475 ) ) ( not ( = ?auto_27458 ?auto_27475 ) ) ( not ( = ?auto_27470 ?auto_27475 ) ) ( not ( = ?auto_27469 ?auto_27475 ) ) ( not ( = ?auto_27471 ?auto_27475 ) ) ( not ( = ?auto_27465 ?auto_27475 ) ) ( not ( = ?auto_27473 ?auto_27475 ) ) ( TRUCK-AT ?auto_27463 ?auto_27462 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27459 ?auto_27460 )
      ( MAKE-2CRATE-VERIFY ?auto_27458 ?auto_27459 ?auto_27460 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27476 - SURFACE
      ?auto_27477 - SURFACE
      ?auto_27478 - SURFACE
      ?auto_27479 - SURFACE
    )
    :vars
    (
      ?auto_27482 - HOIST
      ?auto_27493 - PLACE
      ?auto_27488 - PLACE
      ?auto_27485 - HOIST
      ?auto_27486 - SURFACE
      ?auto_27483 - PLACE
      ?auto_27480 - HOIST
      ?auto_27491 - SURFACE
      ?auto_27484 - PLACE
      ?auto_27489 - HOIST
      ?auto_27492 - SURFACE
      ?auto_27481 - SURFACE
      ?auto_27490 - SURFACE
      ?auto_27487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27482 ?auto_27493 ) ( IS-CRATE ?auto_27479 ) ( not ( = ?auto_27478 ?auto_27479 ) ) ( not ( = ?auto_27477 ?auto_27478 ) ) ( not ( = ?auto_27477 ?auto_27479 ) ) ( not ( = ?auto_27488 ?auto_27493 ) ) ( HOIST-AT ?auto_27485 ?auto_27488 ) ( not ( = ?auto_27482 ?auto_27485 ) ) ( AVAILABLE ?auto_27485 ) ( SURFACE-AT ?auto_27479 ?auto_27488 ) ( ON ?auto_27479 ?auto_27486 ) ( CLEAR ?auto_27479 ) ( not ( = ?auto_27478 ?auto_27486 ) ) ( not ( = ?auto_27479 ?auto_27486 ) ) ( not ( = ?auto_27477 ?auto_27486 ) ) ( IS-CRATE ?auto_27478 ) ( not ( = ?auto_27483 ?auto_27493 ) ) ( not ( = ?auto_27488 ?auto_27483 ) ) ( HOIST-AT ?auto_27480 ?auto_27483 ) ( not ( = ?auto_27482 ?auto_27480 ) ) ( not ( = ?auto_27485 ?auto_27480 ) ) ( SURFACE-AT ?auto_27478 ?auto_27483 ) ( ON ?auto_27478 ?auto_27491 ) ( CLEAR ?auto_27478 ) ( not ( = ?auto_27478 ?auto_27491 ) ) ( not ( = ?auto_27479 ?auto_27491 ) ) ( not ( = ?auto_27477 ?auto_27491 ) ) ( not ( = ?auto_27486 ?auto_27491 ) ) ( IS-CRATE ?auto_27477 ) ( not ( = ?auto_27476 ?auto_27477 ) ) ( not ( = ?auto_27478 ?auto_27476 ) ) ( not ( = ?auto_27479 ?auto_27476 ) ) ( not ( = ?auto_27486 ?auto_27476 ) ) ( not ( = ?auto_27491 ?auto_27476 ) ) ( not ( = ?auto_27484 ?auto_27493 ) ) ( not ( = ?auto_27488 ?auto_27484 ) ) ( not ( = ?auto_27483 ?auto_27484 ) ) ( HOIST-AT ?auto_27489 ?auto_27484 ) ( not ( = ?auto_27482 ?auto_27489 ) ) ( not ( = ?auto_27485 ?auto_27489 ) ) ( not ( = ?auto_27480 ?auto_27489 ) ) ( AVAILABLE ?auto_27489 ) ( SURFACE-AT ?auto_27477 ?auto_27484 ) ( ON ?auto_27477 ?auto_27492 ) ( CLEAR ?auto_27477 ) ( not ( = ?auto_27478 ?auto_27492 ) ) ( not ( = ?auto_27479 ?auto_27492 ) ) ( not ( = ?auto_27477 ?auto_27492 ) ) ( not ( = ?auto_27486 ?auto_27492 ) ) ( not ( = ?auto_27491 ?auto_27492 ) ) ( not ( = ?auto_27476 ?auto_27492 ) ) ( SURFACE-AT ?auto_27481 ?auto_27493 ) ( CLEAR ?auto_27481 ) ( IS-CRATE ?auto_27476 ) ( not ( = ?auto_27481 ?auto_27476 ) ) ( not ( = ?auto_27478 ?auto_27481 ) ) ( not ( = ?auto_27479 ?auto_27481 ) ) ( not ( = ?auto_27477 ?auto_27481 ) ) ( not ( = ?auto_27486 ?auto_27481 ) ) ( not ( = ?auto_27491 ?auto_27481 ) ) ( not ( = ?auto_27492 ?auto_27481 ) ) ( AVAILABLE ?auto_27482 ) ( AVAILABLE ?auto_27480 ) ( SURFACE-AT ?auto_27476 ?auto_27483 ) ( ON ?auto_27476 ?auto_27490 ) ( CLEAR ?auto_27476 ) ( not ( = ?auto_27478 ?auto_27490 ) ) ( not ( = ?auto_27479 ?auto_27490 ) ) ( not ( = ?auto_27477 ?auto_27490 ) ) ( not ( = ?auto_27486 ?auto_27490 ) ) ( not ( = ?auto_27491 ?auto_27490 ) ) ( not ( = ?auto_27476 ?auto_27490 ) ) ( not ( = ?auto_27492 ?auto_27490 ) ) ( not ( = ?auto_27481 ?auto_27490 ) ) ( TRUCK-AT ?auto_27487 ?auto_27493 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27477 ?auto_27478 ?auto_27479 )
      ( MAKE-3CRATE-VERIFY ?auto_27476 ?auto_27477 ?auto_27478 ?auto_27479 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27494 - SURFACE
      ?auto_27495 - SURFACE
      ?auto_27496 - SURFACE
      ?auto_27497 - SURFACE
      ?auto_27498 - SURFACE
    )
    :vars
    (
      ?auto_27500 - HOIST
      ?auto_27511 - PLACE
      ?auto_27506 - PLACE
      ?auto_27503 - HOIST
      ?auto_27504 - SURFACE
      ?auto_27501 - PLACE
      ?auto_27499 - HOIST
      ?auto_27509 - SURFACE
      ?auto_27502 - PLACE
      ?auto_27507 - HOIST
      ?auto_27510 - SURFACE
      ?auto_27508 - SURFACE
      ?auto_27505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27500 ?auto_27511 ) ( IS-CRATE ?auto_27498 ) ( not ( = ?auto_27497 ?auto_27498 ) ) ( not ( = ?auto_27496 ?auto_27497 ) ) ( not ( = ?auto_27496 ?auto_27498 ) ) ( not ( = ?auto_27506 ?auto_27511 ) ) ( HOIST-AT ?auto_27503 ?auto_27506 ) ( not ( = ?auto_27500 ?auto_27503 ) ) ( AVAILABLE ?auto_27503 ) ( SURFACE-AT ?auto_27498 ?auto_27506 ) ( ON ?auto_27498 ?auto_27504 ) ( CLEAR ?auto_27498 ) ( not ( = ?auto_27497 ?auto_27504 ) ) ( not ( = ?auto_27498 ?auto_27504 ) ) ( not ( = ?auto_27496 ?auto_27504 ) ) ( IS-CRATE ?auto_27497 ) ( not ( = ?auto_27501 ?auto_27511 ) ) ( not ( = ?auto_27506 ?auto_27501 ) ) ( HOIST-AT ?auto_27499 ?auto_27501 ) ( not ( = ?auto_27500 ?auto_27499 ) ) ( not ( = ?auto_27503 ?auto_27499 ) ) ( SURFACE-AT ?auto_27497 ?auto_27501 ) ( ON ?auto_27497 ?auto_27509 ) ( CLEAR ?auto_27497 ) ( not ( = ?auto_27497 ?auto_27509 ) ) ( not ( = ?auto_27498 ?auto_27509 ) ) ( not ( = ?auto_27496 ?auto_27509 ) ) ( not ( = ?auto_27504 ?auto_27509 ) ) ( IS-CRATE ?auto_27496 ) ( not ( = ?auto_27495 ?auto_27496 ) ) ( not ( = ?auto_27497 ?auto_27495 ) ) ( not ( = ?auto_27498 ?auto_27495 ) ) ( not ( = ?auto_27504 ?auto_27495 ) ) ( not ( = ?auto_27509 ?auto_27495 ) ) ( not ( = ?auto_27502 ?auto_27511 ) ) ( not ( = ?auto_27506 ?auto_27502 ) ) ( not ( = ?auto_27501 ?auto_27502 ) ) ( HOIST-AT ?auto_27507 ?auto_27502 ) ( not ( = ?auto_27500 ?auto_27507 ) ) ( not ( = ?auto_27503 ?auto_27507 ) ) ( not ( = ?auto_27499 ?auto_27507 ) ) ( AVAILABLE ?auto_27507 ) ( SURFACE-AT ?auto_27496 ?auto_27502 ) ( ON ?auto_27496 ?auto_27510 ) ( CLEAR ?auto_27496 ) ( not ( = ?auto_27497 ?auto_27510 ) ) ( not ( = ?auto_27498 ?auto_27510 ) ) ( not ( = ?auto_27496 ?auto_27510 ) ) ( not ( = ?auto_27504 ?auto_27510 ) ) ( not ( = ?auto_27509 ?auto_27510 ) ) ( not ( = ?auto_27495 ?auto_27510 ) ) ( SURFACE-AT ?auto_27494 ?auto_27511 ) ( CLEAR ?auto_27494 ) ( IS-CRATE ?auto_27495 ) ( not ( = ?auto_27494 ?auto_27495 ) ) ( not ( = ?auto_27497 ?auto_27494 ) ) ( not ( = ?auto_27498 ?auto_27494 ) ) ( not ( = ?auto_27496 ?auto_27494 ) ) ( not ( = ?auto_27504 ?auto_27494 ) ) ( not ( = ?auto_27509 ?auto_27494 ) ) ( not ( = ?auto_27510 ?auto_27494 ) ) ( AVAILABLE ?auto_27500 ) ( AVAILABLE ?auto_27499 ) ( SURFACE-AT ?auto_27495 ?auto_27501 ) ( ON ?auto_27495 ?auto_27508 ) ( CLEAR ?auto_27495 ) ( not ( = ?auto_27497 ?auto_27508 ) ) ( not ( = ?auto_27498 ?auto_27508 ) ) ( not ( = ?auto_27496 ?auto_27508 ) ) ( not ( = ?auto_27504 ?auto_27508 ) ) ( not ( = ?auto_27509 ?auto_27508 ) ) ( not ( = ?auto_27495 ?auto_27508 ) ) ( not ( = ?auto_27510 ?auto_27508 ) ) ( not ( = ?auto_27494 ?auto_27508 ) ) ( TRUCK-AT ?auto_27505 ?auto_27511 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27496 ?auto_27497 ?auto_27498 )
      ( MAKE-4CRATE-VERIFY ?auto_27494 ?auto_27495 ?auto_27496 ?auto_27497 ?auto_27498 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27512 - SURFACE
      ?auto_27513 - SURFACE
      ?auto_27514 - SURFACE
      ?auto_27515 - SURFACE
      ?auto_27516 - SURFACE
      ?auto_27517 - SURFACE
    )
    :vars
    (
      ?auto_27519 - HOIST
      ?auto_27530 - PLACE
      ?auto_27525 - PLACE
      ?auto_27522 - HOIST
      ?auto_27523 - SURFACE
      ?auto_27520 - PLACE
      ?auto_27518 - HOIST
      ?auto_27528 - SURFACE
      ?auto_27521 - PLACE
      ?auto_27526 - HOIST
      ?auto_27529 - SURFACE
      ?auto_27527 - SURFACE
      ?auto_27524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27519 ?auto_27530 ) ( IS-CRATE ?auto_27517 ) ( not ( = ?auto_27516 ?auto_27517 ) ) ( not ( = ?auto_27515 ?auto_27516 ) ) ( not ( = ?auto_27515 ?auto_27517 ) ) ( not ( = ?auto_27525 ?auto_27530 ) ) ( HOIST-AT ?auto_27522 ?auto_27525 ) ( not ( = ?auto_27519 ?auto_27522 ) ) ( AVAILABLE ?auto_27522 ) ( SURFACE-AT ?auto_27517 ?auto_27525 ) ( ON ?auto_27517 ?auto_27523 ) ( CLEAR ?auto_27517 ) ( not ( = ?auto_27516 ?auto_27523 ) ) ( not ( = ?auto_27517 ?auto_27523 ) ) ( not ( = ?auto_27515 ?auto_27523 ) ) ( IS-CRATE ?auto_27516 ) ( not ( = ?auto_27520 ?auto_27530 ) ) ( not ( = ?auto_27525 ?auto_27520 ) ) ( HOIST-AT ?auto_27518 ?auto_27520 ) ( not ( = ?auto_27519 ?auto_27518 ) ) ( not ( = ?auto_27522 ?auto_27518 ) ) ( SURFACE-AT ?auto_27516 ?auto_27520 ) ( ON ?auto_27516 ?auto_27528 ) ( CLEAR ?auto_27516 ) ( not ( = ?auto_27516 ?auto_27528 ) ) ( not ( = ?auto_27517 ?auto_27528 ) ) ( not ( = ?auto_27515 ?auto_27528 ) ) ( not ( = ?auto_27523 ?auto_27528 ) ) ( IS-CRATE ?auto_27515 ) ( not ( = ?auto_27514 ?auto_27515 ) ) ( not ( = ?auto_27516 ?auto_27514 ) ) ( not ( = ?auto_27517 ?auto_27514 ) ) ( not ( = ?auto_27523 ?auto_27514 ) ) ( not ( = ?auto_27528 ?auto_27514 ) ) ( not ( = ?auto_27521 ?auto_27530 ) ) ( not ( = ?auto_27525 ?auto_27521 ) ) ( not ( = ?auto_27520 ?auto_27521 ) ) ( HOIST-AT ?auto_27526 ?auto_27521 ) ( not ( = ?auto_27519 ?auto_27526 ) ) ( not ( = ?auto_27522 ?auto_27526 ) ) ( not ( = ?auto_27518 ?auto_27526 ) ) ( AVAILABLE ?auto_27526 ) ( SURFACE-AT ?auto_27515 ?auto_27521 ) ( ON ?auto_27515 ?auto_27529 ) ( CLEAR ?auto_27515 ) ( not ( = ?auto_27516 ?auto_27529 ) ) ( not ( = ?auto_27517 ?auto_27529 ) ) ( not ( = ?auto_27515 ?auto_27529 ) ) ( not ( = ?auto_27523 ?auto_27529 ) ) ( not ( = ?auto_27528 ?auto_27529 ) ) ( not ( = ?auto_27514 ?auto_27529 ) ) ( SURFACE-AT ?auto_27513 ?auto_27530 ) ( CLEAR ?auto_27513 ) ( IS-CRATE ?auto_27514 ) ( not ( = ?auto_27513 ?auto_27514 ) ) ( not ( = ?auto_27516 ?auto_27513 ) ) ( not ( = ?auto_27517 ?auto_27513 ) ) ( not ( = ?auto_27515 ?auto_27513 ) ) ( not ( = ?auto_27523 ?auto_27513 ) ) ( not ( = ?auto_27528 ?auto_27513 ) ) ( not ( = ?auto_27529 ?auto_27513 ) ) ( AVAILABLE ?auto_27519 ) ( AVAILABLE ?auto_27518 ) ( SURFACE-AT ?auto_27514 ?auto_27520 ) ( ON ?auto_27514 ?auto_27527 ) ( CLEAR ?auto_27514 ) ( not ( = ?auto_27516 ?auto_27527 ) ) ( not ( = ?auto_27517 ?auto_27527 ) ) ( not ( = ?auto_27515 ?auto_27527 ) ) ( not ( = ?auto_27523 ?auto_27527 ) ) ( not ( = ?auto_27528 ?auto_27527 ) ) ( not ( = ?auto_27514 ?auto_27527 ) ) ( not ( = ?auto_27529 ?auto_27527 ) ) ( not ( = ?auto_27513 ?auto_27527 ) ) ( TRUCK-AT ?auto_27524 ?auto_27530 ) ( ON ?auto_27513 ?auto_27512 ) ( not ( = ?auto_27512 ?auto_27513 ) ) ( not ( = ?auto_27512 ?auto_27514 ) ) ( not ( = ?auto_27512 ?auto_27515 ) ) ( not ( = ?auto_27512 ?auto_27516 ) ) ( not ( = ?auto_27512 ?auto_27517 ) ) ( not ( = ?auto_27512 ?auto_27523 ) ) ( not ( = ?auto_27512 ?auto_27528 ) ) ( not ( = ?auto_27512 ?auto_27529 ) ) ( not ( = ?auto_27512 ?auto_27527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27515 ?auto_27516 ?auto_27517 )
      ( MAKE-5CRATE-VERIFY ?auto_27512 ?auto_27513 ?auto_27514 ?auto_27515 ?auto_27516 ?auto_27517 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27531 - SURFACE
      ?auto_27532 - SURFACE
    )
    :vars
    (
      ?auto_27535 - HOIST
      ?auto_27548 - PLACE
      ?auto_27546 - SURFACE
      ?auto_27541 - PLACE
      ?auto_27538 - HOIST
      ?auto_27539 - SURFACE
      ?auto_27536 - PLACE
      ?auto_27533 - HOIST
      ?auto_27544 - SURFACE
      ?auto_27545 - SURFACE
      ?auto_27537 - PLACE
      ?auto_27542 - HOIST
      ?auto_27547 - SURFACE
      ?auto_27534 - SURFACE
      ?auto_27543 - SURFACE
      ?auto_27540 - TRUCK
      ?auto_27549 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27535 ?auto_27548 ) ( IS-CRATE ?auto_27532 ) ( not ( = ?auto_27531 ?auto_27532 ) ) ( not ( = ?auto_27546 ?auto_27531 ) ) ( not ( = ?auto_27546 ?auto_27532 ) ) ( not ( = ?auto_27541 ?auto_27548 ) ) ( HOIST-AT ?auto_27538 ?auto_27541 ) ( not ( = ?auto_27535 ?auto_27538 ) ) ( AVAILABLE ?auto_27538 ) ( SURFACE-AT ?auto_27532 ?auto_27541 ) ( ON ?auto_27532 ?auto_27539 ) ( CLEAR ?auto_27532 ) ( not ( = ?auto_27531 ?auto_27539 ) ) ( not ( = ?auto_27532 ?auto_27539 ) ) ( not ( = ?auto_27546 ?auto_27539 ) ) ( IS-CRATE ?auto_27531 ) ( not ( = ?auto_27536 ?auto_27548 ) ) ( not ( = ?auto_27541 ?auto_27536 ) ) ( HOIST-AT ?auto_27533 ?auto_27536 ) ( not ( = ?auto_27535 ?auto_27533 ) ) ( not ( = ?auto_27538 ?auto_27533 ) ) ( SURFACE-AT ?auto_27531 ?auto_27536 ) ( ON ?auto_27531 ?auto_27544 ) ( CLEAR ?auto_27531 ) ( not ( = ?auto_27531 ?auto_27544 ) ) ( not ( = ?auto_27532 ?auto_27544 ) ) ( not ( = ?auto_27546 ?auto_27544 ) ) ( not ( = ?auto_27539 ?auto_27544 ) ) ( IS-CRATE ?auto_27546 ) ( not ( = ?auto_27545 ?auto_27546 ) ) ( not ( = ?auto_27531 ?auto_27545 ) ) ( not ( = ?auto_27532 ?auto_27545 ) ) ( not ( = ?auto_27539 ?auto_27545 ) ) ( not ( = ?auto_27544 ?auto_27545 ) ) ( not ( = ?auto_27537 ?auto_27548 ) ) ( not ( = ?auto_27541 ?auto_27537 ) ) ( not ( = ?auto_27536 ?auto_27537 ) ) ( HOIST-AT ?auto_27542 ?auto_27537 ) ( not ( = ?auto_27535 ?auto_27542 ) ) ( not ( = ?auto_27538 ?auto_27542 ) ) ( not ( = ?auto_27533 ?auto_27542 ) ) ( AVAILABLE ?auto_27542 ) ( SURFACE-AT ?auto_27546 ?auto_27537 ) ( ON ?auto_27546 ?auto_27547 ) ( CLEAR ?auto_27546 ) ( not ( = ?auto_27531 ?auto_27547 ) ) ( not ( = ?auto_27532 ?auto_27547 ) ) ( not ( = ?auto_27546 ?auto_27547 ) ) ( not ( = ?auto_27539 ?auto_27547 ) ) ( not ( = ?auto_27544 ?auto_27547 ) ) ( not ( = ?auto_27545 ?auto_27547 ) ) ( IS-CRATE ?auto_27545 ) ( not ( = ?auto_27534 ?auto_27545 ) ) ( not ( = ?auto_27531 ?auto_27534 ) ) ( not ( = ?auto_27532 ?auto_27534 ) ) ( not ( = ?auto_27546 ?auto_27534 ) ) ( not ( = ?auto_27539 ?auto_27534 ) ) ( not ( = ?auto_27544 ?auto_27534 ) ) ( not ( = ?auto_27547 ?auto_27534 ) ) ( AVAILABLE ?auto_27533 ) ( SURFACE-AT ?auto_27545 ?auto_27536 ) ( ON ?auto_27545 ?auto_27543 ) ( CLEAR ?auto_27545 ) ( not ( = ?auto_27531 ?auto_27543 ) ) ( not ( = ?auto_27532 ?auto_27543 ) ) ( not ( = ?auto_27546 ?auto_27543 ) ) ( not ( = ?auto_27539 ?auto_27543 ) ) ( not ( = ?auto_27544 ?auto_27543 ) ) ( not ( = ?auto_27545 ?auto_27543 ) ) ( not ( = ?auto_27547 ?auto_27543 ) ) ( not ( = ?auto_27534 ?auto_27543 ) ) ( TRUCK-AT ?auto_27540 ?auto_27548 ) ( SURFACE-AT ?auto_27549 ?auto_27548 ) ( CLEAR ?auto_27549 ) ( LIFTING ?auto_27535 ?auto_27534 ) ( IS-CRATE ?auto_27534 ) ( not ( = ?auto_27549 ?auto_27534 ) ) ( not ( = ?auto_27531 ?auto_27549 ) ) ( not ( = ?auto_27532 ?auto_27549 ) ) ( not ( = ?auto_27546 ?auto_27549 ) ) ( not ( = ?auto_27539 ?auto_27549 ) ) ( not ( = ?auto_27544 ?auto_27549 ) ) ( not ( = ?auto_27545 ?auto_27549 ) ) ( not ( = ?auto_27547 ?auto_27549 ) ) ( not ( = ?auto_27543 ?auto_27549 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27549 ?auto_27534 )
      ( MAKE-2CRATE ?auto_27546 ?auto_27531 ?auto_27532 )
      ( MAKE-1CRATE-VERIFY ?auto_27531 ?auto_27532 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27550 - SURFACE
      ?auto_27551 - SURFACE
      ?auto_27552 - SURFACE
    )
    :vars
    (
      ?auto_27567 - HOIST
      ?auto_27555 - PLACE
      ?auto_27558 - PLACE
      ?auto_27557 - HOIST
      ?auto_27559 - SURFACE
      ?auto_27565 - PLACE
      ?auto_27556 - HOIST
      ?auto_27562 - SURFACE
      ?auto_27560 - SURFACE
      ?auto_27568 - PLACE
      ?auto_27566 - HOIST
      ?auto_27564 - SURFACE
      ?auto_27553 - SURFACE
      ?auto_27561 - SURFACE
      ?auto_27563 - TRUCK
      ?auto_27554 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27567 ?auto_27555 ) ( IS-CRATE ?auto_27552 ) ( not ( = ?auto_27551 ?auto_27552 ) ) ( not ( = ?auto_27550 ?auto_27551 ) ) ( not ( = ?auto_27550 ?auto_27552 ) ) ( not ( = ?auto_27558 ?auto_27555 ) ) ( HOIST-AT ?auto_27557 ?auto_27558 ) ( not ( = ?auto_27567 ?auto_27557 ) ) ( AVAILABLE ?auto_27557 ) ( SURFACE-AT ?auto_27552 ?auto_27558 ) ( ON ?auto_27552 ?auto_27559 ) ( CLEAR ?auto_27552 ) ( not ( = ?auto_27551 ?auto_27559 ) ) ( not ( = ?auto_27552 ?auto_27559 ) ) ( not ( = ?auto_27550 ?auto_27559 ) ) ( IS-CRATE ?auto_27551 ) ( not ( = ?auto_27565 ?auto_27555 ) ) ( not ( = ?auto_27558 ?auto_27565 ) ) ( HOIST-AT ?auto_27556 ?auto_27565 ) ( not ( = ?auto_27567 ?auto_27556 ) ) ( not ( = ?auto_27557 ?auto_27556 ) ) ( SURFACE-AT ?auto_27551 ?auto_27565 ) ( ON ?auto_27551 ?auto_27562 ) ( CLEAR ?auto_27551 ) ( not ( = ?auto_27551 ?auto_27562 ) ) ( not ( = ?auto_27552 ?auto_27562 ) ) ( not ( = ?auto_27550 ?auto_27562 ) ) ( not ( = ?auto_27559 ?auto_27562 ) ) ( IS-CRATE ?auto_27550 ) ( not ( = ?auto_27560 ?auto_27550 ) ) ( not ( = ?auto_27551 ?auto_27560 ) ) ( not ( = ?auto_27552 ?auto_27560 ) ) ( not ( = ?auto_27559 ?auto_27560 ) ) ( not ( = ?auto_27562 ?auto_27560 ) ) ( not ( = ?auto_27568 ?auto_27555 ) ) ( not ( = ?auto_27558 ?auto_27568 ) ) ( not ( = ?auto_27565 ?auto_27568 ) ) ( HOIST-AT ?auto_27566 ?auto_27568 ) ( not ( = ?auto_27567 ?auto_27566 ) ) ( not ( = ?auto_27557 ?auto_27566 ) ) ( not ( = ?auto_27556 ?auto_27566 ) ) ( AVAILABLE ?auto_27566 ) ( SURFACE-AT ?auto_27550 ?auto_27568 ) ( ON ?auto_27550 ?auto_27564 ) ( CLEAR ?auto_27550 ) ( not ( = ?auto_27551 ?auto_27564 ) ) ( not ( = ?auto_27552 ?auto_27564 ) ) ( not ( = ?auto_27550 ?auto_27564 ) ) ( not ( = ?auto_27559 ?auto_27564 ) ) ( not ( = ?auto_27562 ?auto_27564 ) ) ( not ( = ?auto_27560 ?auto_27564 ) ) ( IS-CRATE ?auto_27560 ) ( not ( = ?auto_27553 ?auto_27560 ) ) ( not ( = ?auto_27551 ?auto_27553 ) ) ( not ( = ?auto_27552 ?auto_27553 ) ) ( not ( = ?auto_27550 ?auto_27553 ) ) ( not ( = ?auto_27559 ?auto_27553 ) ) ( not ( = ?auto_27562 ?auto_27553 ) ) ( not ( = ?auto_27564 ?auto_27553 ) ) ( AVAILABLE ?auto_27556 ) ( SURFACE-AT ?auto_27560 ?auto_27565 ) ( ON ?auto_27560 ?auto_27561 ) ( CLEAR ?auto_27560 ) ( not ( = ?auto_27551 ?auto_27561 ) ) ( not ( = ?auto_27552 ?auto_27561 ) ) ( not ( = ?auto_27550 ?auto_27561 ) ) ( not ( = ?auto_27559 ?auto_27561 ) ) ( not ( = ?auto_27562 ?auto_27561 ) ) ( not ( = ?auto_27560 ?auto_27561 ) ) ( not ( = ?auto_27564 ?auto_27561 ) ) ( not ( = ?auto_27553 ?auto_27561 ) ) ( TRUCK-AT ?auto_27563 ?auto_27555 ) ( SURFACE-AT ?auto_27554 ?auto_27555 ) ( CLEAR ?auto_27554 ) ( LIFTING ?auto_27567 ?auto_27553 ) ( IS-CRATE ?auto_27553 ) ( not ( = ?auto_27554 ?auto_27553 ) ) ( not ( = ?auto_27551 ?auto_27554 ) ) ( not ( = ?auto_27552 ?auto_27554 ) ) ( not ( = ?auto_27550 ?auto_27554 ) ) ( not ( = ?auto_27559 ?auto_27554 ) ) ( not ( = ?auto_27562 ?auto_27554 ) ) ( not ( = ?auto_27560 ?auto_27554 ) ) ( not ( = ?auto_27564 ?auto_27554 ) ) ( not ( = ?auto_27561 ?auto_27554 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27551 ?auto_27552 )
      ( MAKE-2CRATE-VERIFY ?auto_27550 ?auto_27551 ?auto_27552 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27569 - SURFACE
      ?auto_27570 - SURFACE
      ?auto_27571 - SURFACE
      ?auto_27572 - SURFACE
    )
    :vars
    (
      ?auto_27578 - HOIST
      ?auto_27575 - PLACE
      ?auto_27582 - PLACE
      ?auto_27580 - HOIST
      ?auto_27577 - SURFACE
      ?auto_27586 - PLACE
      ?auto_27585 - HOIST
      ?auto_27583 - SURFACE
      ?auto_27587 - PLACE
      ?auto_27579 - HOIST
      ?auto_27576 - SURFACE
      ?auto_27581 - SURFACE
      ?auto_27573 - SURFACE
      ?auto_27584 - TRUCK
      ?auto_27574 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27578 ?auto_27575 ) ( IS-CRATE ?auto_27572 ) ( not ( = ?auto_27571 ?auto_27572 ) ) ( not ( = ?auto_27570 ?auto_27571 ) ) ( not ( = ?auto_27570 ?auto_27572 ) ) ( not ( = ?auto_27582 ?auto_27575 ) ) ( HOIST-AT ?auto_27580 ?auto_27582 ) ( not ( = ?auto_27578 ?auto_27580 ) ) ( AVAILABLE ?auto_27580 ) ( SURFACE-AT ?auto_27572 ?auto_27582 ) ( ON ?auto_27572 ?auto_27577 ) ( CLEAR ?auto_27572 ) ( not ( = ?auto_27571 ?auto_27577 ) ) ( not ( = ?auto_27572 ?auto_27577 ) ) ( not ( = ?auto_27570 ?auto_27577 ) ) ( IS-CRATE ?auto_27571 ) ( not ( = ?auto_27586 ?auto_27575 ) ) ( not ( = ?auto_27582 ?auto_27586 ) ) ( HOIST-AT ?auto_27585 ?auto_27586 ) ( not ( = ?auto_27578 ?auto_27585 ) ) ( not ( = ?auto_27580 ?auto_27585 ) ) ( SURFACE-AT ?auto_27571 ?auto_27586 ) ( ON ?auto_27571 ?auto_27583 ) ( CLEAR ?auto_27571 ) ( not ( = ?auto_27571 ?auto_27583 ) ) ( not ( = ?auto_27572 ?auto_27583 ) ) ( not ( = ?auto_27570 ?auto_27583 ) ) ( not ( = ?auto_27577 ?auto_27583 ) ) ( IS-CRATE ?auto_27570 ) ( not ( = ?auto_27569 ?auto_27570 ) ) ( not ( = ?auto_27571 ?auto_27569 ) ) ( not ( = ?auto_27572 ?auto_27569 ) ) ( not ( = ?auto_27577 ?auto_27569 ) ) ( not ( = ?auto_27583 ?auto_27569 ) ) ( not ( = ?auto_27587 ?auto_27575 ) ) ( not ( = ?auto_27582 ?auto_27587 ) ) ( not ( = ?auto_27586 ?auto_27587 ) ) ( HOIST-AT ?auto_27579 ?auto_27587 ) ( not ( = ?auto_27578 ?auto_27579 ) ) ( not ( = ?auto_27580 ?auto_27579 ) ) ( not ( = ?auto_27585 ?auto_27579 ) ) ( AVAILABLE ?auto_27579 ) ( SURFACE-AT ?auto_27570 ?auto_27587 ) ( ON ?auto_27570 ?auto_27576 ) ( CLEAR ?auto_27570 ) ( not ( = ?auto_27571 ?auto_27576 ) ) ( not ( = ?auto_27572 ?auto_27576 ) ) ( not ( = ?auto_27570 ?auto_27576 ) ) ( not ( = ?auto_27577 ?auto_27576 ) ) ( not ( = ?auto_27583 ?auto_27576 ) ) ( not ( = ?auto_27569 ?auto_27576 ) ) ( IS-CRATE ?auto_27569 ) ( not ( = ?auto_27581 ?auto_27569 ) ) ( not ( = ?auto_27571 ?auto_27581 ) ) ( not ( = ?auto_27572 ?auto_27581 ) ) ( not ( = ?auto_27570 ?auto_27581 ) ) ( not ( = ?auto_27577 ?auto_27581 ) ) ( not ( = ?auto_27583 ?auto_27581 ) ) ( not ( = ?auto_27576 ?auto_27581 ) ) ( AVAILABLE ?auto_27585 ) ( SURFACE-AT ?auto_27569 ?auto_27586 ) ( ON ?auto_27569 ?auto_27573 ) ( CLEAR ?auto_27569 ) ( not ( = ?auto_27571 ?auto_27573 ) ) ( not ( = ?auto_27572 ?auto_27573 ) ) ( not ( = ?auto_27570 ?auto_27573 ) ) ( not ( = ?auto_27577 ?auto_27573 ) ) ( not ( = ?auto_27583 ?auto_27573 ) ) ( not ( = ?auto_27569 ?auto_27573 ) ) ( not ( = ?auto_27576 ?auto_27573 ) ) ( not ( = ?auto_27581 ?auto_27573 ) ) ( TRUCK-AT ?auto_27584 ?auto_27575 ) ( SURFACE-AT ?auto_27574 ?auto_27575 ) ( CLEAR ?auto_27574 ) ( LIFTING ?auto_27578 ?auto_27581 ) ( IS-CRATE ?auto_27581 ) ( not ( = ?auto_27574 ?auto_27581 ) ) ( not ( = ?auto_27571 ?auto_27574 ) ) ( not ( = ?auto_27572 ?auto_27574 ) ) ( not ( = ?auto_27570 ?auto_27574 ) ) ( not ( = ?auto_27577 ?auto_27574 ) ) ( not ( = ?auto_27583 ?auto_27574 ) ) ( not ( = ?auto_27569 ?auto_27574 ) ) ( not ( = ?auto_27576 ?auto_27574 ) ) ( not ( = ?auto_27573 ?auto_27574 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27570 ?auto_27571 ?auto_27572 )
      ( MAKE-3CRATE-VERIFY ?auto_27569 ?auto_27570 ?auto_27571 ?auto_27572 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27588 - SURFACE
      ?auto_27589 - SURFACE
      ?auto_27590 - SURFACE
      ?auto_27591 - SURFACE
      ?auto_27592 - SURFACE
    )
    :vars
    (
      ?auto_27598 - HOIST
      ?auto_27595 - PLACE
      ?auto_27601 - PLACE
      ?auto_27600 - HOIST
      ?auto_27597 - SURFACE
      ?auto_27605 - PLACE
      ?auto_27604 - HOIST
      ?auto_27602 - SURFACE
      ?auto_27606 - PLACE
      ?auto_27599 - HOIST
      ?auto_27596 - SURFACE
      ?auto_27593 - SURFACE
      ?auto_27603 - TRUCK
      ?auto_27594 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27598 ?auto_27595 ) ( IS-CRATE ?auto_27592 ) ( not ( = ?auto_27591 ?auto_27592 ) ) ( not ( = ?auto_27590 ?auto_27591 ) ) ( not ( = ?auto_27590 ?auto_27592 ) ) ( not ( = ?auto_27601 ?auto_27595 ) ) ( HOIST-AT ?auto_27600 ?auto_27601 ) ( not ( = ?auto_27598 ?auto_27600 ) ) ( AVAILABLE ?auto_27600 ) ( SURFACE-AT ?auto_27592 ?auto_27601 ) ( ON ?auto_27592 ?auto_27597 ) ( CLEAR ?auto_27592 ) ( not ( = ?auto_27591 ?auto_27597 ) ) ( not ( = ?auto_27592 ?auto_27597 ) ) ( not ( = ?auto_27590 ?auto_27597 ) ) ( IS-CRATE ?auto_27591 ) ( not ( = ?auto_27605 ?auto_27595 ) ) ( not ( = ?auto_27601 ?auto_27605 ) ) ( HOIST-AT ?auto_27604 ?auto_27605 ) ( not ( = ?auto_27598 ?auto_27604 ) ) ( not ( = ?auto_27600 ?auto_27604 ) ) ( SURFACE-AT ?auto_27591 ?auto_27605 ) ( ON ?auto_27591 ?auto_27602 ) ( CLEAR ?auto_27591 ) ( not ( = ?auto_27591 ?auto_27602 ) ) ( not ( = ?auto_27592 ?auto_27602 ) ) ( not ( = ?auto_27590 ?auto_27602 ) ) ( not ( = ?auto_27597 ?auto_27602 ) ) ( IS-CRATE ?auto_27590 ) ( not ( = ?auto_27589 ?auto_27590 ) ) ( not ( = ?auto_27591 ?auto_27589 ) ) ( not ( = ?auto_27592 ?auto_27589 ) ) ( not ( = ?auto_27597 ?auto_27589 ) ) ( not ( = ?auto_27602 ?auto_27589 ) ) ( not ( = ?auto_27606 ?auto_27595 ) ) ( not ( = ?auto_27601 ?auto_27606 ) ) ( not ( = ?auto_27605 ?auto_27606 ) ) ( HOIST-AT ?auto_27599 ?auto_27606 ) ( not ( = ?auto_27598 ?auto_27599 ) ) ( not ( = ?auto_27600 ?auto_27599 ) ) ( not ( = ?auto_27604 ?auto_27599 ) ) ( AVAILABLE ?auto_27599 ) ( SURFACE-AT ?auto_27590 ?auto_27606 ) ( ON ?auto_27590 ?auto_27596 ) ( CLEAR ?auto_27590 ) ( not ( = ?auto_27591 ?auto_27596 ) ) ( not ( = ?auto_27592 ?auto_27596 ) ) ( not ( = ?auto_27590 ?auto_27596 ) ) ( not ( = ?auto_27597 ?auto_27596 ) ) ( not ( = ?auto_27602 ?auto_27596 ) ) ( not ( = ?auto_27589 ?auto_27596 ) ) ( IS-CRATE ?auto_27589 ) ( not ( = ?auto_27588 ?auto_27589 ) ) ( not ( = ?auto_27591 ?auto_27588 ) ) ( not ( = ?auto_27592 ?auto_27588 ) ) ( not ( = ?auto_27590 ?auto_27588 ) ) ( not ( = ?auto_27597 ?auto_27588 ) ) ( not ( = ?auto_27602 ?auto_27588 ) ) ( not ( = ?auto_27596 ?auto_27588 ) ) ( AVAILABLE ?auto_27604 ) ( SURFACE-AT ?auto_27589 ?auto_27605 ) ( ON ?auto_27589 ?auto_27593 ) ( CLEAR ?auto_27589 ) ( not ( = ?auto_27591 ?auto_27593 ) ) ( not ( = ?auto_27592 ?auto_27593 ) ) ( not ( = ?auto_27590 ?auto_27593 ) ) ( not ( = ?auto_27597 ?auto_27593 ) ) ( not ( = ?auto_27602 ?auto_27593 ) ) ( not ( = ?auto_27589 ?auto_27593 ) ) ( not ( = ?auto_27596 ?auto_27593 ) ) ( not ( = ?auto_27588 ?auto_27593 ) ) ( TRUCK-AT ?auto_27603 ?auto_27595 ) ( SURFACE-AT ?auto_27594 ?auto_27595 ) ( CLEAR ?auto_27594 ) ( LIFTING ?auto_27598 ?auto_27588 ) ( IS-CRATE ?auto_27588 ) ( not ( = ?auto_27594 ?auto_27588 ) ) ( not ( = ?auto_27591 ?auto_27594 ) ) ( not ( = ?auto_27592 ?auto_27594 ) ) ( not ( = ?auto_27590 ?auto_27594 ) ) ( not ( = ?auto_27597 ?auto_27594 ) ) ( not ( = ?auto_27602 ?auto_27594 ) ) ( not ( = ?auto_27589 ?auto_27594 ) ) ( not ( = ?auto_27596 ?auto_27594 ) ) ( not ( = ?auto_27593 ?auto_27594 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27590 ?auto_27591 ?auto_27592 )
      ( MAKE-4CRATE-VERIFY ?auto_27588 ?auto_27589 ?auto_27590 ?auto_27591 ?auto_27592 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27607 - SURFACE
      ?auto_27608 - SURFACE
      ?auto_27609 - SURFACE
      ?auto_27610 - SURFACE
      ?auto_27611 - SURFACE
      ?auto_27612 - SURFACE
    )
    :vars
    (
      ?auto_27617 - HOIST
      ?auto_27614 - PLACE
      ?auto_27620 - PLACE
      ?auto_27619 - HOIST
      ?auto_27616 - SURFACE
      ?auto_27624 - PLACE
      ?auto_27623 - HOIST
      ?auto_27621 - SURFACE
      ?auto_27625 - PLACE
      ?auto_27618 - HOIST
      ?auto_27615 - SURFACE
      ?auto_27613 - SURFACE
      ?auto_27622 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27617 ?auto_27614 ) ( IS-CRATE ?auto_27612 ) ( not ( = ?auto_27611 ?auto_27612 ) ) ( not ( = ?auto_27610 ?auto_27611 ) ) ( not ( = ?auto_27610 ?auto_27612 ) ) ( not ( = ?auto_27620 ?auto_27614 ) ) ( HOIST-AT ?auto_27619 ?auto_27620 ) ( not ( = ?auto_27617 ?auto_27619 ) ) ( AVAILABLE ?auto_27619 ) ( SURFACE-AT ?auto_27612 ?auto_27620 ) ( ON ?auto_27612 ?auto_27616 ) ( CLEAR ?auto_27612 ) ( not ( = ?auto_27611 ?auto_27616 ) ) ( not ( = ?auto_27612 ?auto_27616 ) ) ( not ( = ?auto_27610 ?auto_27616 ) ) ( IS-CRATE ?auto_27611 ) ( not ( = ?auto_27624 ?auto_27614 ) ) ( not ( = ?auto_27620 ?auto_27624 ) ) ( HOIST-AT ?auto_27623 ?auto_27624 ) ( not ( = ?auto_27617 ?auto_27623 ) ) ( not ( = ?auto_27619 ?auto_27623 ) ) ( SURFACE-AT ?auto_27611 ?auto_27624 ) ( ON ?auto_27611 ?auto_27621 ) ( CLEAR ?auto_27611 ) ( not ( = ?auto_27611 ?auto_27621 ) ) ( not ( = ?auto_27612 ?auto_27621 ) ) ( not ( = ?auto_27610 ?auto_27621 ) ) ( not ( = ?auto_27616 ?auto_27621 ) ) ( IS-CRATE ?auto_27610 ) ( not ( = ?auto_27609 ?auto_27610 ) ) ( not ( = ?auto_27611 ?auto_27609 ) ) ( not ( = ?auto_27612 ?auto_27609 ) ) ( not ( = ?auto_27616 ?auto_27609 ) ) ( not ( = ?auto_27621 ?auto_27609 ) ) ( not ( = ?auto_27625 ?auto_27614 ) ) ( not ( = ?auto_27620 ?auto_27625 ) ) ( not ( = ?auto_27624 ?auto_27625 ) ) ( HOIST-AT ?auto_27618 ?auto_27625 ) ( not ( = ?auto_27617 ?auto_27618 ) ) ( not ( = ?auto_27619 ?auto_27618 ) ) ( not ( = ?auto_27623 ?auto_27618 ) ) ( AVAILABLE ?auto_27618 ) ( SURFACE-AT ?auto_27610 ?auto_27625 ) ( ON ?auto_27610 ?auto_27615 ) ( CLEAR ?auto_27610 ) ( not ( = ?auto_27611 ?auto_27615 ) ) ( not ( = ?auto_27612 ?auto_27615 ) ) ( not ( = ?auto_27610 ?auto_27615 ) ) ( not ( = ?auto_27616 ?auto_27615 ) ) ( not ( = ?auto_27621 ?auto_27615 ) ) ( not ( = ?auto_27609 ?auto_27615 ) ) ( IS-CRATE ?auto_27609 ) ( not ( = ?auto_27608 ?auto_27609 ) ) ( not ( = ?auto_27611 ?auto_27608 ) ) ( not ( = ?auto_27612 ?auto_27608 ) ) ( not ( = ?auto_27610 ?auto_27608 ) ) ( not ( = ?auto_27616 ?auto_27608 ) ) ( not ( = ?auto_27621 ?auto_27608 ) ) ( not ( = ?auto_27615 ?auto_27608 ) ) ( AVAILABLE ?auto_27623 ) ( SURFACE-AT ?auto_27609 ?auto_27624 ) ( ON ?auto_27609 ?auto_27613 ) ( CLEAR ?auto_27609 ) ( not ( = ?auto_27611 ?auto_27613 ) ) ( not ( = ?auto_27612 ?auto_27613 ) ) ( not ( = ?auto_27610 ?auto_27613 ) ) ( not ( = ?auto_27616 ?auto_27613 ) ) ( not ( = ?auto_27621 ?auto_27613 ) ) ( not ( = ?auto_27609 ?auto_27613 ) ) ( not ( = ?auto_27615 ?auto_27613 ) ) ( not ( = ?auto_27608 ?auto_27613 ) ) ( TRUCK-AT ?auto_27622 ?auto_27614 ) ( SURFACE-AT ?auto_27607 ?auto_27614 ) ( CLEAR ?auto_27607 ) ( LIFTING ?auto_27617 ?auto_27608 ) ( IS-CRATE ?auto_27608 ) ( not ( = ?auto_27607 ?auto_27608 ) ) ( not ( = ?auto_27611 ?auto_27607 ) ) ( not ( = ?auto_27612 ?auto_27607 ) ) ( not ( = ?auto_27610 ?auto_27607 ) ) ( not ( = ?auto_27616 ?auto_27607 ) ) ( not ( = ?auto_27621 ?auto_27607 ) ) ( not ( = ?auto_27609 ?auto_27607 ) ) ( not ( = ?auto_27615 ?auto_27607 ) ) ( not ( = ?auto_27613 ?auto_27607 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27610 ?auto_27611 ?auto_27612 )
      ( MAKE-5CRATE-VERIFY ?auto_27607 ?auto_27608 ?auto_27609 ?auto_27610 ?auto_27611 ?auto_27612 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27626 - SURFACE
      ?auto_27627 - SURFACE
    )
    :vars
    (
      ?auto_27634 - HOIST
      ?auto_27631 - PLACE
      ?auto_27637 - SURFACE
      ?auto_27639 - PLACE
      ?auto_27636 - HOIST
      ?auto_27633 - SURFACE
      ?auto_27643 - PLACE
      ?auto_27642 - HOIST
      ?auto_27640 - SURFACE
      ?auto_27630 - SURFACE
      ?auto_27644 - PLACE
      ?auto_27635 - HOIST
      ?auto_27632 - SURFACE
      ?auto_27638 - SURFACE
      ?auto_27628 - SURFACE
      ?auto_27641 - TRUCK
      ?auto_27629 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27634 ?auto_27631 ) ( IS-CRATE ?auto_27627 ) ( not ( = ?auto_27626 ?auto_27627 ) ) ( not ( = ?auto_27637 ?auto_27626 ) ) ( not ( = ?auto_27637 ?auto_27627 ) ) ( not ( = ?auto_27639 ?auto_27631 ) ) ( HOIST-AT ?auto_27636 ?auto_27639 ) ( not ( = ?auto_27634 ?auto_27636 ) ) ( AVAILABLE ?auto_27636 ) ( SURFACE-AT ?auto_27627 ?auto_27639 ) ( ON ?auto_27627 ?auto_27633 ) ( CLEAR ?auto_27627 ) ( not ( = ?auto_27626 ?auto_27633 ) ) ( not ( = ?auto_27627 ?auto_27633 ) ) ( not ( = ?auto_27637 ?auto_27633 ) ) ( IS-CRATE ?auto_27626 ) ( not ( = ?auto_27643 ?auto_27631 ) ) ( not ( = ?auto_27639 ?auto_27643 ) ) ( HOIST-AT ?auto_27642 ?auto_27643 ) ( not ( = ?auto_27634 ?auto_27642 ) ) ( not ( = ?auto_27636 ?auto_27642 ) ) ( SURFACE-AT ?auto_27626 ?auto_27643 ) ( ON ?auto_27626 ?auto_27640 ) ( CLEAR ?auto_27626 ) ( not ( = ?auto_27626 ?auto_27640 ) ) ( not ( = ?auto_27627 ?auto_27640 ) ) ( not ( = ?auto_27637 ?auto_27640 ) ) ( not ( = ?auto_27633 ?auto_27640 ) ) ( IS-CRATE ?auto_27637 ) ( not ( = ?auto_27630 ?auto_27637 ) ) ( not ( = ?auto_27626 ?auto_27630 ) ) ( not ( = ?auto_27627 ?auto_27630 ) ) ( not ( = ?auto_27633 ?auto_27630 ) ) ( not ( = ?auto_27640 ?auto_27630 ) ) ( not ( = ?auto_27644 ?auto_27631 ) ) ( not ( = ?auto_27639 ?auto_27644 ) ) ( not ( = ?auto_27643 ?auto_27644 ) ) ( HOIST-AT ?auto_27635 ?auto_27644 ) ( not ( = ?auto_27634 ?auto_27635 ) ) ( not ( = ?auto_27636 ?auto_27635 ) ) ( not ( = ?auto_27642 ?auto_27635 ) ) ( AVAILABLE ?auto_27635 ) ( SURFACE-AT ?auto_27637 ?auto_27644 ) ( ON ?auto_27637 ?auto_27632 ) ( CLEAR ?auto_27637 ) ( not ( = ?auto_27626 ?auto_27632 ) ) ( not ( = ?auto_27627 ?auto_27632 ) ) ( not ( = ?auto_27637 ?auto_27632 ) ) ( not ( = ?auto_27633 ?auto_27632 ) ) ( not ( = ?auto_27640 ?auto_27632 ) ) ( not ( = ?auto_27630 ?auto_27632 ) ) ( IS-CRATE ?auto_27630 ) ( not ( = ?auto_27638 ?auto_27630 ) ) ( not ( = ?auto_27626 ?auto_27638 ) ) ( not ( = ?auto_27627 ?auto_27638 ) ) ( not ( = ?auto_27637 ?auto_27638 ) ) ( not ( = ?auto_27633 ?auto_27638 ) ) ( not ( = ?auto_27640 ?auto_27638 ) ) ( not ( = ?auto_27632 ?auto_27638 ) ) ( AVAILABLE ?auto_27642 ) ( SURFACE-AT ?auto_27630 ?auto_27643 ) ( ON ?auto_27630 ?auto_27628 ) ( CLEAR ?auto_27630 ) ( not ( = ?auto_27626 ?auto_27628 ) ) ( not ( = ?auto_27627 ?auto_27628 ) ) ( not ( = ?auto_27637 ?auto_27628 ) ) ( not ( = ?auto_27633 ?auto_27628 ) ) ( not ( = ?auto_27640 ?auto_27628 ) ) ( not ( = ?auto_27630 ?auto_27628 ) ) ( not ( = ?auto_27632 ?auto_27628 ) ) ( not ( = ?auto_27638 ?auto_27628 ) ) ( TRUCK-AT ?auto_27641 ?auto_27631 ) ( SURFACE-AT ?auto_27629 ?auto_27631 ) ( CLEAR ?auto_27629 ) ( IS-CRATE ?auto_27638 ) ( not ( = ?auto_27629 ?auto_27638 ) ) ( not ( = ?auto_27626 ?auto_27629 ) ) ( not ( = ?auto_27627 ?auto_27629 ) ) ( not ( = ?auto_27637 ?auto_27629 ) ) ( not ( = ?auto_27633 ?auto_27629 ) ) ( not ( = ?auto_27640 ?auto_27629 ) ) ( not ( = ?auto_27630 ?auto_27629 ) ) ( not ( = ?auto_27632 ?auto_27629 ) ) ( not ( = ?auto_27628 ?auto_27629 ) ) ( AVAILABLE ?auto_27634 ) ( IN ?auto_27638 ?auto_27641 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27634 ?auto_27638 ?auto_27641 ?auto_27631 )
      ( MAKE-2CRATE ?auto_27637 ?auto_27626 ?auto_27627 )
      ( MAKE-1CRATE-VERIFY ?auto_27626 ?auto_27627 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27645 - SURFACE
      ?auto_27646 - SURFACE
      ?auto_27647 - SURFACE
    )
    :vars
    (
      ?auto_27656 - HOIST
      ?auto_27659 - PLACE
      ?auto_27663 - PLACE
      ?auto_27655 - HOIST
      ?auto_27658 - SURFACE
      ?auto_27651 - PLACE
      ?auto_27653 - HOIST
      ?auto_27650 - SURFACE
      ?auto_27662 - SURFACE
      ?auto_27648 - PLACE
      ?auto_27660 - HOIST
      ?auto_27657 - SURFACE
      ?auto_27661 - SURFACE
      ?auto_27654 - SURFACE
      ?auto_27649 - TRUCK
      ?auto_27652 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27656 ?auto_27659 ) ( IS-CRATE ?auto_27647 ) ( not ( = ?auto_27646 ?auto_27647 ) ) ( not ( = ?auto_27645 ?auto_27646 ) ) ( not ( = ?auto_27645 ?auto_27647 ) ) ( not ( = ?auto_27663 ?auto_27659 ) ) ( HOIST-AT ?auto_27655 ?auto_27663 ) ( not ( = ?auto_27656 ?auto_27655 ) ) ( AVAILABLE ?auto_27655 ) ( SURFACE-AT ?auto_27647 ?auto_27663 ) ( ON ?auto_27647 ?auto_27658 ) ( CLEAR ?auto_27647 ) ( not ( = ?auto_27646 ?auto_27658 ) ) ( not ( = ?auto_27647 ?auto_27658 ) ) ( not ( = ?auto_27645 ?auto_27658 ) ) ( IS-CRATE ?auto_27646 ) ( not ( = ?auto_27651 ?auto_27659 ) ) ( not ( = ?auto_27663 ?auto_27651 ) ) ( HOIST-AT ?auto_27653 ?auto_27651 ) ( not ( = ?auto_27656 ?auto_27653 ) ) ( not ( = ?auto_27655 ?auto_27653 ) ) ( SURFACE-AT ?auto_27646 ?auto_27651 ) ( ON ?auto_27646 ?auto_27650 ) ( CLEAR ?auto_27646 ) ( not ( = ?auto_27646 ?auto_27650 ) ) ( not ( = ?auto_27647 ?auto_27650 ) ) ( not ( = ?auto_27645 ?auto_27650 ) ) ( not ( = ?auto_27658 ?auto_27650 ) ) ( IS-CRATE ?auto_27645 ) ( not ( = ?auto_27662 ?auto_27645 ) ) ( not ( = ?auto_27646 ?auto_27662 ) ) ( not ( = ?auto_27647 ?auto_27662 ) ) ( not ( = ?auto_27658 ?auto_27662 ) ) ( not ( = ?auto_27650 ?auto_27662 ) ) ( not ( = ?auto_27648 ?auto_27659 ) ) ( not ( = ?auto_27663 ?auto_27648 ) ) ( not ( = ?auto_27651 ?auto_27648 ) ) ( HOIST-AT ?auto_27660 ?auto_27648 ) ( not ( = ?auto_27656 ?auto_27660 ) ) ( not ( = ?auto_27655 ?auto_27660 ) ) ( not ( = ?auto_27653 ?auto_27660 ) ) ( AVAILABLE ?auto_27660 ) ( SURFACE-AT ?auto_27645 ?auto_27648 ) ( ON ?auto_27645 ?auto_27657 ) ( CLEAR ?auto_27645 ) ( not ( = ?auto_27646 ?auto_27657 ) ) ( not ( = ?auto_27647 ?auto_27657 ) ) ( not ( = ?auto_27645 ?auto_27657 ) ) ( not ( = ?auto_27658 ?auto_27657 ) ) ( not ( = ?auto_27650 ?auto_27657 ) ) ( not ( = ?auto_27662 ?auto_27657 ) ) ( IS-CRATE ?auto_27662 ) ( not ( = ?auto_27661 ?auto_27662 ) ) ( not ( = ?auto_27646 ?auto_27661 ) ) ( not ( = ?auto_27647 ?auto_27661 ) ) ( not ( = ?auto_27645 ?auto_27661 ) ) ( not ( = ?auto_27658 ?auto_27661 ) ) ( not ( = ?auto_27650 ?auto_27661 ) ) ( not ( = ?auto_27657 ?auto_27661 ) ) ( AVAILABLE ?auto_27653 ) ( SURFACE-AT ?auto_27662 ?auto_27651 ) ( ON ?auto_27662 ?auto_27654 ) ( CLEAR ?auto_27662 ) ( not ( = ?auto_27646 ?auto_27654 ) ) ( not ( = ?auto_27647 ?auto_27654 ) ) ( not ( = ?auto_27645 ?auto_27654 ) ) ( not ( = ?auto_27658 ?auto_27654 ) ) ( not ( = ?auto_27650 ?auto_27654 ) ) ( not ( = ?auto_27662 ?auto_27654 ) ) ( not ( = ?auto_27657 ?auto_27654 ) ) ( not ( = ?auto_27661 ?auto_27654 ) ) ( TRUCK-AT ?auto_27649 ?auto_27659 ) ( SURFACE-AT ?auto_27652 ?auto_27659 ) ( CLEAR ?auto_27652 ) ( IS-CRATE ?auto_27661 ) ( not ( = ?auto_27652 ?auto_27661 ) ) ( not ( = ?auto_27646 ?auto_27652 ) ) ( not ( = ?auto_27647 ?auto_27652 ) ) ( not ( = ?auto_27645 ?auto_27652 ) ) ( not ( = ?auto_27658 ?auto_27652 ) ) ( not ( = ?auto_27650 ?auto_27652 ) ) ( not ( = ?auto_27662 ?auto_27652 ) ) ( not ( = ?auto_27657 ?auto_27652 ) ) ( not ( = ?auto_27654 ?auto_27652 ) ) ( AVAILABLE ?auto_27656 ) ( IN ?auto_27661 ?auto_27649 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27646 ?auto_27647 )
      ( MAKE-2CRATE-VERIFY ?auto_27645 ?auto_27646 ?auto_27647 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27664 - SURFACE
      ?auto_27665 - SURFACE
      ?auto_27666 - SURFACE
      ?auto_27667 - SURFACE
    )
    :vars
    (
      ?auto_27674 - HOIST
      ?auto_27673 - PLACE
      ?auto_27670 - PLACE
      ?auto_27680 - HOIST
      ?auto_27681 - SURFACE
      ?auto_27679 - PLACE
      ?auto_27669 - HOIST
      ?auto_27668 - SURFACE
      ?auto_27677 - PLACE
      ?auto_27678 - HOIST
      ?auto_27682 - SURFACE
      ?auto_27672 - SURFACE
      ?auto_27675 - SURFACE
      ?auto_27676 - TRUCK
      ?auto_27671 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27674 ?auto_27673 ) ( IS-CRATE ?auto_27667 ) ( not ( = ?auto_27666 ?auto_27667 ) ) ( not ( = ?auto_27665 ?auto_27666 ) ) ( not ( = ?auto_27665 ?auto_27667 ) ) ( not ( = ?auto_27670 ?auto_27673 ) ) ( HOIST-AT ?auto_27680 ?auto_27670 ) ( not ( = ?auto_27674 ?auto_27680 ) ) ( AVAILABLE ?auto_27680 ) ( SURFACE-AT ?auto_27667 ?auto_27670 ) ( ON ?auto_27667 ?auto_27681 ) ( CLEAR ?auto_27667 ) ( not ( = ?auto_27666 ?auto_27681 ) ) ( not ( = ?auto_27667 ?auto_27681 ) ) ( not ( = ?auto_27665 ?auto_27681 ) ) ( IS-CRATE ?auto_27666 ) ( not ( = ?auto_27679 ?auto_27673 ) ) ( not ( = ?auto_27670 ?auto_27679 ) ) ( HOIST-AT ?auto_27669 ?auto_27679 ) ( not ( = ?auto_27674 ?auto_27669 ) ) ( not ( = ?auto_27680 ?auto_27669 ) ) ( SURFACE-AT ?auto_27666 ?auto_27679 ) ( ON ?auto_27666 ?auto_27668 ) ( CLEAR ?auto_27666 ) ( not ( = ?auto_27666 ?auto_27668 ) ) ( not ( = ?auto_27667 ?auto_27668 ) ) ( not ( = ?auto_27665 ?auto_27668 ) ) ( not ( = ?auto_27681 ?auto_27668 ) ) ( IS-CRATE ?auto_27665 ) ( not ( = ?auto_27664 ?auto_27665 ) ) ( not ( = ?auto_27666 ?auto_27664 ) ) ( not ( = ?auto_27667 ?auto_27664 ) ) ( not ( = ?auto_27681 ?auto_27664 ) ) ( not ( = ?auto_27668 ?auto_27664 ) ) ( not ( = ?auto_27677 ?auto_27673 ) ) ( not ( = ?auto_27670 ?auto_27677 ) ) ( not ( = ?auto_27679 ?auto_27677 ) ) ( HOIST-AT ?auto_27678 ?auto_27677 ) ( not ( = ?auto_27674 ?auto_27678 ) ) ( not ( = ?auto_27680 ?auto_27678 ) ) ( not ( = ?auto_27669 ?auto_27678 ) ) ( AVAILABLE ?auto_27678 ) ( SURFACE-AT ?auto_27665 ?auto_27677 ) ( ON ?auto_27665 ?auto_27682 ) ( CLEAR ?auto_27665 ) ( not ( = ?auto_27666 ?auto_27682 ) ) ( not ( = ?auto_27667 ?auto_27682 ) ) ( not ( = ?auto_27665 ?auto_27682 ) ) ( not ( = ?auto_27681 ?auto_27682 ) ) ( not ( = ?auto_27668 ?auto_27682 ) ) ( not ( = ?auto_27664 ?auto_27682 ) ) ( IS-CRATE ?auto_27664 ) ( not ( = ?auto_27672 ?auto_27664 ) ) ( not ( = ?auto_27666 ?auto_27672 ) ) ( not ( = ?auto_27667 ?auto_27672 ) ) ( not ( = ?auto_27665 ?auto_27672 ) ) ( not ( = ?auto_27681 ?auto_27672 ) ) ( not ( = ?auto_27668 ?auto_27672 ) ) ( not ( = ?auto_27682 ?auto_27672 ) ) ( AVAILABLE ?auto_27669 ) ( SURFACE-AT ?auto_27664 ?auto_27679 ) ( ON ?auto_27664 ?auto_27675 ) ( CLEAR ?auto_27664 ) ( not ( = ?auto_27666 ?auto_27675 ) ) ( not ( = ?auto_27667 ?auto_27675 ) ) ( not ( = ?auto_27665 ?auto_27675 ) ) ( not ( = ?auto_27681 ?auto_27675 ) ) ( not ( = ?auto_27668 ?auto_27675 ) ) ( not ( = ?auto_27664 ?auto_27675 ) ) ( not ( = ?auto_27682 ?auto_27675 ) ) ( not ( = ?auto_27672 ?auto_27675 ) ) ( TRUCK-AT ?auto_27676 ?auto_27673 ) ( SURFACE-AT ?auto_27671 ?auto_27673 ) ( CLEAR ?auto_27671 ) ( IS-CRATE ?auto_27672 ) ( not ( = ?auto_27671 ?auto_27672 ) ) ( not ( = ?auto_27666 ?auto_27671 ) ) ( not ( = ?auto_27667 ?auto_27671 ) ) ( not ( = ?auto_27665 ?auto_27671 ) ) ( not ( = ?auto_27681 ?auto_27671 ) ) ( not ( = ?auto_27668 ?auto_27671 ) ) ( not ( = ?auto_27664 ?auto_27671 ) ) ( not ( = ?auto_27682 ?auto_27671 ) ) ( not ( = ?auto_27675 ?auto_27671 ) ) ( AVAILABLE ?auto_27674 ) ( IN ?auto_27672 ?auto_27676 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27665 ?auto_27666 ?auto_27667 )
      ( MAKE-3CRATE-VERIFY ?auto_27664 ?auto_27665 ?auto_27666 ?auto_27667 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27683 - SURFACE
      ?auto_27684 - SURFACE
      ?auto_27685 - SURFACE
      ?auto_27686 - SURFACE
      ?auto_27687 - SURFACE
    )
    :vars
    (
      ?auto_27693 - HOIST
      ?auto_27692 - PLACE
      ?auto_27690 - PLACE
      ?auto_27699 - HOIST
      ?auto_27700 - SURFACE
      ?auto_27698 - PLACE
      ?auto_27689 - HOIST
      ?auto_27688 - SURFACE
      ?auto_27696 - PLACE
      ?auto_27697 - HOIST
      ?auto_27701 - SURFACE
      ?auto_27694 - SURFACE
      ?auto_27695 - TRUCK
      ?auto_27691 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27693 ?auto_27692 ) ( IS-CRATE ?auto_27687 ) ( not ( = ?auto_27686 ?auto_27687 ) ) ( not ( = ?auto_27685 ?auto_27686 ) ) ( not ( = ?auto_27685 ?auto_27687 ) ) ( not ( = ?auto_27690 ?auto_27692 ) ) ( HOIST-AT ?auto_27699 ?auto_27690 ) ( not ( = ?auto_27693 ?auto_27699 ) ) ( AVAILABLE ?auto_27699 ) ( SURFACE-AT ?auto_27687 ?auto_27690 ) ( ON ?auto_27687 ?auto_27700 ) ( CLEAR ?auto_27687 ) ( not ( = ?auto_27686 ?auto_27700 ) ) ( not ( = ?auto_27687 ?auto_27700 ) ) ( not ( = ?auto_27685 ?auto_27700 ) ) ( IS-CRATE ?auto_27686 ) ( not ( = ?auto_27698 ?auto_27692 ) ) ( not ( = ?auto_27690 ?auto_27698 ) ) ( HOIST-AT ?auto_27689 ?auto_27698 ) ( not ( = ?auto_27693 ?auto_27689 ) ) ( not ( = ?auto_27699 ?auto_27689 ) ) ( SURFACE-AT ?auto_27686 ?auto_27698 ) ( ON ?auto_27686 ?auto_27688 ) ( CLEAR ?auto_27686 ) ( not ( = ?auto_27686 ?auto_27688 ) ) ( not ( = ?auto_27687 ?auto_27688 ) ) ( not ( = ?auto_27685 ?auto_27688 ) ) ( not ( = ?auto_27700 ?auto_27688 ) ) ( IS-CRATE ?auto_27685 ) ( not ( = ?auto_27684 ?auto_27685 ) ) ( not ( = ?auto_27686 ?auto_27684 ) ) ( not ( = ?auto_27687 ?auto_27684 ) ) ( not ( = ?auto_27700 ?auto_27684 ) ) ( not ( = ?auto_27688 ?auto_27684 ) ) ( not ( = ?auto_27696 ?auto_27692 ) ) ( not ( = ?auto_27690 ?auto_27696 ) ) ( not ( = ?auto_27698 ?auto_27696 ) ) ( HOIST-AT ?auto_27697 ?auto_27696 ) ( not ( = ?auto_27693 ?auto_27697 ) ) ( not ( = ?auto_27699 ?auto_27697 ) ) ( not ( = ?auto_27689 ?auto_27697 ) ) ( AVAILABLE ?auto_27697 ) ( SURFACE-AT ?auto_27685 ?auto_27696 ) ( ON ?auto_27685 ?auto_27701 ) ( CLEAR ?auto_27685 ) ( not ( = ?auto_27686 ?auto_27701 ) ) ( not ( = ?auto_27687 ?auto_27701 ) ) ( not ( = ?auto_27685 ?auto_27701 ) ) ( not ( = ?auto_27700 ?auto_27701 ) ) ( not ( = ?auto_27688 ?auto_27701 ) ) ( not ( = ?auto_27684 ?auto_27701 ) ) ( IS-CRATE ?auto_27684 ) ( not ( = ?auto_27683 ?auto_27684 ) ) ( not ( = ?auto_27686 ?auto_27683 ) ) ( not ( = ?auto_27687 ?auto_27683 ) ) ( not ( = ?auto_27685 ?auto_27683 ) ) ( not ( = ?auto_27700 ?auto_27683 ) ) ( not ( = ?auto_27688 ?auto_27683 ) ) ( not ( = ?auto_27701 ?auto_27683 ) ) ( AVAILABLE ?auto_27689 ) ( SURFACE-AT ?auto_27684 ?auto_27698 ) ( ON ?auto_27684 ?auto_27694 ) ( CLEAR ?auto_27684 ) ( not ( = ?auto_27686 ?auto_27694 ) ) ( not ( = ?auto_27687 ?auto_27694 ) ) ( not ( = ?auto_27685 ?auto_27694 ) ) ( not ( = ?auto_27700 ?auto_27694 ) ) ( not ( = ?auto_27688 ?auto_27694 ) ) ( not ( = ?auto_27684 ?auto_27694 ) ) ( not ( = ?auto_27701 ?auto_27694 ) ) ( not ( = ?auto_27683 ?auto_27694 ) ) ( TRUCK-AT ?auto_27695 ?auto_27692 ) ( SURFACE-AT ?auto_27691 ?auto_27692 ) ( CLEAR ?auto_27691 ) ( IS-CRATE ?auto_27683 ) ( not ( = ?auto_27691 ?auto_27683 ) ) ( not ( = ?auto_27686 ?auto_27691 ) ) ( not ( = ?auto_27687 ?auto_27691 ) ) ( not ( = ?auto_27685 ?auto_27691 ) ) ( not ( = ?auto_27700 ?auto_27691 ) ) ( not ( = ?auto_27688 ?auto_27691 ) ) ( not ( = ?auto_27684 ?auto_27691 ) ) ( not ( = ?auto_27701 ?auto_27691 ) ) ( not ( = ?auto_27694 ?auto_27691 ) ) ( AVAILABLE ?auto_27693 ) ( IN ?auto_27683 ?auto_27695 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27685 ?auto_27686 ?auto_27687 )
      ( MAKE-4CRATE-VERIFY ?auto_27683 ?auto_27684 ?auto_27685 ?auto_27686 ?auto_27687 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27702 - SURFACE
      ?auto_27703 - SURFACE
      ?auto_27704 - SURFACE
      ?auto_27705 - SURFACE
      ?auto_27706 - SURFACE
      ?auto_27707 - SURFACE
    )
    :vars
    (
      ?auto_27712 - HOIST
      ?auto_27711 - PLACE
      ?auto_27710 - PLACE
      ?auto_27718 - HOIST
      ?auto_27719 - SURFACE
      ?auto_27717 - PLACE
      ?auto_27709 - HOIST
      ?auto_27708 - SURFACE
      ?auto_27715 - PLACE
      ?auto_27716 - HOIST
      ?auto_27720 - SURFACE
      ?auto_27713 - SURFACE
      ?auto_27714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27712 ?auto_27711 ) ( IS-CRATE ?auto_27707 ) ( not ( = ?auto_27706 ?auto_27707 ) ) ( not ( = ?auto_27705 ?auto_27706 ) ) ( not ( = ?auto_27705 ?auto_27707 ) ) ( not ( = ?auto_27710 ?auto_27711 ) ) ( HOIST-AT ?auto_27718 ?auto_27710 ) ( not ( = ?auto_27712 ?auto_27718 ) ) ( AVAILABLE ?auto_27718 ) ( SURFACE-AT ?auto_27707 ?auto_27710 ) ( ON ?auto_27707 ?auto_27719 ) ( CLEAR ?auto_27707 ) ( not ( = ?auto_27706 ?auto_27719 ) ) ( not ( = ?auto_27707 ?auto_27719 ) ) ( not ( = ?auto_27705 ?auto_27719 ) ) ( IS-CRATE ?auto_27706 ) ( not ( = ?auto_27717 ?auto_27711 ) ) ( not ( = ?auto_27710 ?auto_27717 ) ) ( HOIST-AT ?auto_27709 ?auto_27717 ) ( not ( = ?auto_27712 ?auto_27709 ) ) ( not ( = ?auto_27718 ?auto_27709 ) ) ( SURFACE-AT ?auto_27706 ?auto_27717 ) ( ON ?auto_27706 ?auto_27708 ) ( CLEAR ?auto_27706 ) ( not ( = ?auto_27706 ?auto_27708 ) ) ( not ( = ?auto_27707 ?auto_27708 ) ) ( not ( = ?auto_27705 ?auto_27708 ) ) ( not ( = ?auto_27719 ?auto_27708 ) ) ( IS-CRATE ?auto_27705 ) ( not ( = ?auto_27704 ?auto_27705 ) ) ( not ( = ?auto_27706 ?auto_27704 ) ) ( not ( = ?auto_27707 ?auto_27704 ) ) ( not ( = ?auto_27719 ?auto_27704 ) ) ( not ( = ?auto_27708 ?auto_27704 ) ) ( not ( = ?auto_27715 ?auto_27711 ) ) ( not ( = ?auto_27710 ?auto_27715 ) ) ( not ( = ?auto_27717 ?auto_27715 ) ) ( HOIST-AT ?auto_27716 ?auto_27715 ) ( not ( = ?auto_27712 ?auto_27716 ) ) ( not ( = ?auto_27718 ?auto_27716 ) ) ( not ( = ?auto_27709 ?auto_27716 ) ) ( AVAILABLE ?auto_27716 ) ( SURFACE-AT ?auto_27705 ?auto_27715 ) ( ON ?auto_27705 ?auto_27720 ) ( CLEAR ?auto_27705 ) ( not ( = ?auto_27706 ?auto_27720 ) ) ( not ( = ?auto_27707 ?auto_27720 ) ) ( not ( = ?auto_27705 ?auto_27720 ) ) ( not ( = ?auto_27719 ?auto_27720 ) ) ( not ( = ?auto_27708 ?auto_27720 ) ) ( not ( = ?auto_27704 ?auto_27720 ) ) ( IS-CRATE ?auto_27704 ) ( not ( = ?auto_27703 ?auto_27704 ) ) ( not ( = ?auto_27706 ?auto_27703 ) ) ( not ( = ?auto_27707 ?auto_27703 ) ) ( not ( = ?auto_27705 ?auto_27703 ) ) ( not ( = ?auto_27719 ?auto_27703 ) ) ( not ( = ?auto_27708 ?auto_27703 ) ) ( not ( = ?auto_27720 ?auto_27703 ) ) ( AVAILABLE ?auto_27709 ) ( SURFACE-AT ?auto_27704 ?auto_27717 ) ( ON ?auto_27704 ?auto_27713 ) ( CLEAR ?auto_27704 ) ( not ( = ?auto_27706 ?auto_27713 ) ) ( not ( = ?auto_27707 ?auto_27713 ) ) ( not ( = ?auto_27705 ?auto_27713 ) ) ( not ( = ?auto_27719 ?auto_27713 ) ) ( not ( = ?auto_27708 ?auto_27713 ) ) ( not ( = ?auto_27704 ?auto_27713 ) ) ( not ( = ?auto_27720 ?auto_27713 ) ) ( not ( = ?auto_27703 ?auto_27713 ) ) ( TRUCK-AT ?auto_27714 ?auto_27711 ) ( SURFACE-AT ?auto_27702 ?auto_27711 ) ( CLEAR ?auto_27702 ) ( IS-CRATE ?auto_27703 ) ( not ( = ?auto_27702 ?auto_27703 ) ) ( not ( = ?auto_27706 ?auto_27702 ) ) ( not ( = ?auto_27707 ?auto_27702 ) ) ( not ( = ?auto_27705 ?auto_27702 ) ) ( not ( = ?auto_27719 ?auto_27702 ) ) ( not ( = ?auto_27708 ?auto_27702 ) ) ( not ( = ?auto_27704 ?auto_27702 ) ) ( not ( = ?auto_27720 ?auto_27702 ) ) ( not ( = ?auto_27713 ?auto_27702 ) ) ( AVAILABLE ?auto_27712 ) ( IN ?auto_27703 ?auto_27714 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27705 ?auto_27706 ?auto_27707 )
      ( MAKE-5CRATE-VERIFY ?auto_27702 ?auto_27703 ?auto_27704 ?auto_27705 ?auto_27706 ?auto_27707 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27721 - SURFACE
      ?auto_27722 - SURFACE
    )
    :vars
    (
      ?auto_27729 - HOIST
      ?auto_27728 - PLACE
      ?auto_27736 - SURFACE
      ?auto_27725 - PLACE
      ?auto_27735 - HOIST
      ?auto_27737 - SURFACE
      ?auto_27734 - PLACE
      ?auto_27724 - HOIST
      ?auto_27723 - SURFACE
      ?auto_27739 - SURFACE
      ?auto_27732 - PLACE
      ?auto_27733 - HOIST
      ?auto_27738 - SURFACE
      ?auto_27727 - SURFACE
      ?auto_27730 - SURFACE
      ?auto_27726 - SURFACE
      ?auto_27731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27729 ?auto_27728 ) ( IS-CRATE ?auto_27722 ) ( not ( = ?auto_27721 ?auto_27722 ) ) ( not ( = ?auto_27736 ?auto_27721 ) ) ( not ( = ?auto_27736 ?auto_27722 ) ) ( not ( = ?auto_27725 ?auto_27728 ) ) ( HOIST-AT ?auto_27735 ?auto_27725 ) ( not ( = ?auto_27729 ?auto_27735 ) ) ( AVAILABLE ?auto_27735 ) ( SURFACE-AT ?auto_27722 ?auto_27725 ) ( ON ?auto_27722 ?auto_27737 ) ( CLEAR ?auto_27722 ) ( not ( = ?auto_27721 ?auto_27737 ) ) ( not ( = ?auto_27722 ?auto_27737 ) ) ( not ( = ?auto_27736 ?auto_27737 ) ) ( IS-CRATE ?auto_27721 ) ( not ( = ?auto_27734 ?auto_27728 ) ) ( not ( = ?auto_27725 ?auto_27734 ) ) ( HOIST-AT ?auto_27724 ?auto_27734 ) ( not ( = ?auto_27729 ?auto_27724 ) ) ( not ( = ?auto_27735 ?auto_27724 ) ) ( SURFACE-AT ?auto_27721 ?auto_27734 ) ( ON ?auto_27721 ?auto_27723 ) ( CLEAR ?auto_27721 ) ( not ( = ?auto_27721 ?auto_27723 ) ) ( not ( = ?auto_27722 ?auto_27723 ) ) ( not ( = ?auto_27736 ?auto_27723 ) ) ( not ( = ?auto_27737 ?auto_27723 ) ) ( IS-CRATE ?auto_27736 ) ( not ( = ?auto_27739 ?auto_27736 ) ) ( not ( = ?auto_27721 ?auto_27739 ) ) ( not ( = ?auto_27722 ?auto_27739 ) ) ( not ( = ?auto_27737 ?auto_27739 ) ) ( not ( = ?auto_27723 ?auto_27739 ) ) ( not ( = ?auto_27732 ?auto_27728 ) ) ( not ( = ?auto_27725 ?auto_27732 ) ) ( not ( = ?auto_27734 ?auto_27732 ) ) ( HOIST-AT ?auto_27733 ?auto_27732 ) ( not ( = ?auto_27729 ?auto_27733 ) ) ( not ( = ?auto_27735 ?auto_27733 ) ) ( not ( = ?auto_27724 ?auto_27733 ) ) ( AVAILABLE ?auto_27733 ) ( SURFACE-AT ?auto_27736 ?auto_27732 ) ( ON ?auto_27736 ?auto_27738 ) ( CLEAR ?auto_27736 ) ( not ( = ?auto_27721 ?auto_27738 ) ) ( not ( = ?auto_27722 ?auto_27738 ) ) ( not ( = ?auto_27736 ?auto_27738 ) ) ( not ( = ?auto_27737 ?auto_27738 ) ) ( not ( = ?auto_27723 ?auto_27738 ) ) ( not ( = ?auto_27739 ?auto_27738 ) ) ( IS-CRATE ?auto_27739 ) ( not ( = ?auto_27727 ?auto_27739 ) ) ( not ( = ?auto_27721 ?auto_27727 ) ) ( not ( = ?auto_27722 ?auto_27727 ) ) ( not ( = ?auto_27736 ?auto_27727 ) ) ( not ( = ?auto_27737 ?auto_27727 ) ) ( not ( = ?auto_27723 ?auto_27727 ) ) ( not ( = ?auto_27738 ?auto_27727 ) ) ( AVAILABLE ?auto_27724 ) ( SURFACE-AT ?auto_27739 ?auto_27734 ) ( ON ?auto_27739 ?auto_27730 ) ( CLEAR ?auto_27739 ) ( not ( = ?auto_27721 ?auto_27730 ) ) ( not ( = ?auto_27722 ?auto_27730 ) ) ( not ( = ?auto_27736 ?auto_27730 ) ) ( not ( = ?auto_27737 ?auto_27730 ) ) ( not ( = ?auto_27723 ?auto_27730 ) ) ( not ( = ?auto_27739 ?auto_27730 ) ) ( not ( = ?auto_27738 ?auto_27730 ) ) ( not ( = ?auto_27727 ?auto_27730 ) ) ( SURFACE-AT ?auto_27726 ?auto_27728 ) ( CLEAR ?auto_27726 ) ( IS-CRATE ?auto_27727 ) ( not ( = ?auto_27726 ?auto_27727 ) ) ( not ( = ?auto_27721 ?auto_27726 ) ) ( not ( = ?auto_27722 ?auto_27726 ) ) ( not ( = ?auto_27736 ?auto_27726 ) ) ( not ( = ?auto_27737 ?auto_27726 ) ) ( not ( = ?auto_27723 ?auto_27726 ) ) ( not ( = ?auto_27739 ?auto_27726 ) ) ( not ( = ?auto_27738 ?auto_27726 ) ) ( not ( = ?auto_27730 ?auto_27726 ) ) ( AVAILABLE ?auto_27729 ) ( IN ?auto_27727 ?auto_27731 ) ( TRUCK-AT ?auto_27731 ?auto_27732 ) )
    :subtasks
    ( ( !DRIVE ?auto_27731 ?auto_27732 ?auto_27728 )
      ( MAKE-2CRATE ?auto_27736 ?auto_27721 ?auto_27722 )
      ( MAKE-1CRATE-VERIFY ?auto_27721 ?auto_27722 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27740 - SURFACE
      ?auto_27741 - SURFACE
      ?auto_27742 - SURFACE
    )
    :vars
    (
      ?auto_27750 - HOIST
      ?auto_27751 - PLACE
      ?auto_27749 - PLACE
      ?auto_27745 - HOIST
      ?auto_27756 - SURFACE
      ?auto_27758 - PLACE
      ?auto_27748 - HOIST
      ?auto_27743 - SURFACE
      ?auto_27746 - SURFACE
      ?auto_27754 - PLACE
      ?auto_27753 - HOIST
      ?auto_27744 - SURFACE
      ?auto_27755 - SURFACE
      ?auto_27757 - SURFACE
      ?auto_27752 - SURFACE
      ?auto_27747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27750 ?auto_27751 ) ( IS-CRATE ?auto_27742 ) ( not ( = ?auto_27741 ?auto_27742 ) ) ( not ( = ?auto_27740 ?auto_27741 ) ) ( not ( = ?auto_27740 ?auto_27742 ) ) ( not ( = ?auto_27749 ?auto_27751 ) ) ( HOIST-AT ?auto_27745 ?auto_27749 ) ( not ( = ?auto_27750 ?auto_27745 ) ) ( AVAILABLE ?auto_27745 ) ( SURFACE-AT ?auto_27742 ?auto_27749 ) ( ON ?auto_27742 ?auto_27756 ) ( CLEAR ?auto_27742 ) ( not ( = ?auto_27741 ?auto_27756 ) ) ( not ( = ?auto_27742 ?auto_27756 ) ) ( not ( = ?auto_27740 ?auto_27756 ) ) ( IS-CRATE ?auto_27741 ) ( not ( = ?auto_27758 ?auto_27751 ) ) ( not ( = ?auto_27749 ?auto_27758 ) ) ( HOIST-AT ?auto_27748 ?auto_27758 ) ( not ( = ?auto_27750 ?auto_27748 ) ) ( not ( = ?auto_27745 ?auto_27748 ) ) ( SURFACE-AT ?auto_27741 ?auto_27758 ) ( ON ?auto_27741 ?auto_27743 ) ( CLEAR ?auto_27741 ) ( not ( = ?auto_27741 ?auto_27743 ) ) ( not ( = ?auto_27742 ?auto_27743 ) ) ( not ( = ?auto_27740 ?auto_27743 ) ) ( not ( = ?auto_27756 ?auto_27743 ) ) ( IS-CRATE ?auto_27740 ) ( not ( = ?auto_27746 ?auto_27740 ) ) ( not ( = ?auto_27741 ?auto_27746 ) ) ( not ( = ?auto_27742 ?auto_27746 ) ) ( not ( = ?auto_27756 ?auto_27746 ) ) ( not ( = ?auto_27743 ?auto_27746 ) ) ( not ( = ?auto_27754 ?auto_27751 ) ) ( not ( = ?auto_27749 ?auto_27754 ) ) ( not ( = ?auto_27758 ?auto_27754 ) ) ( HOIST-AT ?auto_27753 ?auto_27754 ) ( not ( = ?auto_27750 ?auto_27753 ) ) ( not ( = ?auto_27745 ?auto_27753 ) ) ( not ( = ?auto_27748 ?auto_27753 ) ) ( AVAILABLE ?auto_27753 ) ( SURFACE-AT ?auto_27740 ?auto_27754 ) ( ON ?auto_27740 ?auto_27744 ) ( CLEAR ?auto_27740 ) ( not ( = ?auto_27741 ?auto_27744 ) ) ( not ( = ?auto_27742 ?auto_27744 ) ) ( not ( = ?auto_27740 ?auto_27744 ) ) ( not ( = ?auto_27756 ?auto_27744 ) ) ( not ( = ?auto_27743 ?auto_27744 ) ) ( not ( = ?auto_27746 ?auto_27744 ) ) ( IS-CRATE ?auto_27746 ) ( not ( = ?auto_27755 ?auto_27746 ) ) ( not ( = ?auto_27741 ?auto_27755 ) ) ( not ( = ?auto_27742 ?auto_27755 ) ) ( not ( = ?auto_27740 ?auto_27755 ) ) ( not ( = ?auto_27756 ?auto_27755 ) ) ( not ( = ?auto_27743 ?auto_27755 ) ) ( not ( = ?auto_27744 ?auto_27755 ) ) ( AVAILABLE ?auto_27748 ) ( SURFACE-AT ?auto_27746 ?auto_27758 ) ( ON ?auto_27746 ?auto_27757 ) ( CLEAR ?auto_27746 ) ( not ( = ?auto_27741 ?auto_27757 ) ) ( not ( = ?auto_27742 ?auto_27757 ) ) ( not ( = ?auto_27740 ?auto_27757 ) ) ( not ( = ?auto_27756 ?auto_27757 ) ) ( not ( = ?auto_27743 ?auto_27757 ) ) ( not ( = ?auto_27746 ?auto_27757 ) ) ( not ( = ?auto_27744 ?auto_27757 ) ) ( not ( = ?auto_27755 ?auto_27757 ) ) ( SURFACE-AT ?auto_27752 ?auto_27751 ) ( CLEAR ?auto_27752 ) ( IS-CRATE ?auto_27755 ) ( not ( = ?auto_27752 ?auto_27755 ) ) ( not ( = ?auto_27741 ?auto_27752 ) ) ( not ( = ?auto_27742 ?auto_27752 ) ) ( not ( = ?auto_27740 ?auto_27752 ) ) ( not ( = ?auto_27756 ?auto_27752 ) ) ( not ( = ?auto_27743 ?auto_27752 ) ) ( not ( = ?auto_27746 ?auto_27752 ) ) ( not ( = ?auto_27744 ?auto_27752 ) ) ( not ( = ?auto_27757 ?auto_27752 ) ) ( AVAILABLE ?auto_27750 ) ( IN ?auto_27755 ?auto_27747 ) ( TRUCK-AT ?auto_27747 ?auto_27754 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27741 ?auto_27742 )
      ( MAKE-2CRATE-VERIFY ?auto_27740 ?auto_27741 ?auto_27742 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27759 - SURFACE
      ?auto_27760 - SURFACE
      ?auto_27761 - SURFACE
      ?auto_27762 - SURFACE
    )
    :vars
    (
      ?auto_27775 - HOIST
      ?auto_27774 - PLACE
      ?auto_27763 - PLACE
      ?auto_27769 - HOIST
      ?auto_27765 - SURFACE
      ?auto_27766 - PLACE
      ?auto_27764 - HOIST
      ?auto_27771 - SURFACE
      ?auto_27777 - PLACE
      ?auto_27768 - HOIST
      ?auto_27772 - SURFACE
      ?auto_27773 - SURFACE
      ?auto_27770 - SURFACE
      ?auto_27767 - SURFACE
      ?auto_27776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27775 ?auto_27774 ) ( IS-CRATE ?auto_27762 ) ( not ( = ?auto_27761 ?auto_27762 ) ) ( not ( = ?auto_27760 ?auto_27761 ) ) ( not ( = ?auto_27760 ?auto_27762 ) ) ( not ( = ?auto_27763 ?auto_27774 ) ) ( HOIST-AT ?auto_27769 ?auto_27763 ) ( not ( = ?auto_27775 ?auto_27769 ) ) ( AVAILABLE ?auto_27769 ) ( SURFACE-AT ?auto_27762 ?auto_27763 ) ( ON ?auto_27762 ?auto_27765 ) ( CLEAR ?auto_27762 ) ( not ( = ?auto_27761 ?auto_27765 ) ) ( not ( = ?auto_27762 ?auto_27765 ) ) ( not ( = ?auto_27760 ?auto_27765 ) ) ( IS-CRATE ?auto_27761 ) ( not ( = ?auto_27766 ?auto_27774 ) ) ( not ( = ?auto_27763 ?auto_27766 ) ) ( HOIST-AT ?auto_27764 ?auto_27766 ) ( not ( = ?auto_27775 ?auto_27764 ) ) ( not ( = ?auto_27769 ?auto_27764 ) ) ( SURFACE-AT ?auto_27761 ?auto_27766 ) ( ON ?auto_27761 ?auto_27771 ) ( CLEAR ?auto_27761 ) ( not ( = ?auto_27761 ?auto_27771 ) ) ( not ( = ?auto_27762 ?auto_27771 ) ) ( not ( = ?auto_27760 ?auto_27771 ) ) ( not ( = ?auto_27765 ?auto_27771 ) ) ( IS-CRATE ?auto_27760 ) ( not ( = ?auto_27759 ?auto_27760 ) ) ( not ( = ?auto_27761 ?auto_27759 ) ) ( not ( = ?auto_27762 ?auto_27759 ) ) ( not ( = ?auto_27765 ?auto_27759 ) ) ( not ( = ?auto_27771 ?auto_27759 ) ) ( not ( = ?auto_27777 ?auto_27774 ) ) ( not ( = ?auto_27763 ?auto_27777 ) ) ( not ( = ?auto_27766 ?auto_27777 ) ) ( HOIST-AT ?auto_27768 ?auto_27777 ) ( not ( = ?auto_27775 ?auto_27768 ) ) ( not ( = ?auto_27769 ?auto_27768 ) ) ( not ( = ?auto_27764 ?auto_27768 ) ) ( AVAILABLE ?auto_27768 ) ( SURFACE-AT ?auto_27760 ?auto_27777 ) ( ON ?auto_27760 ?auto_27772 ) ( CLEAR ?auto_27760 ) ( not ( = ?auto_27761 ?auto_27772 ) ) ( not ( = ?auto_27762 ?auto_27772 ) ) ( not ( = ?auto_27760 ?auto_27772 ) ) ( not ( = ?auto_27765 ?auto_27772 ) ) ( not ( = ?auto_27771 ?auto_27772 ) ) ( not ( = ?auto_27759 ?auto_27772 ) ) ( IS-CRATE ?auto_27759 ) ( not ( = ?auto_27773 ?auto_27759 ) ) ( not ( = ?auto_27761 ?auto_27773 ) ) ( not ( = ?auto_27762 ?auto_27773 ) ) ( not ( = ?auto_27760 ?auto_27773 ) ) ( not ( = ?auto_27765 ?auto_27773 ) ) ( not ( = ?auto_27771 ?auto_27773 ) ) ( not ( = ?auto_27772 ?auto_27773 ) ) ( AVAILABLE ?auto_27764 ) ( SURFACE-AT ?auto_27759 ?auto_27766 ) ( ON ?auto_27759 ?auto_27770 ) ( CLEAR ?auto_27759 ) ( not ( = ?auto_27761 ?auto_27770 ) ) ( not ( = ?auto_27762 ?auto_27770 ) ) ( not ( = ?auto_27760 ?auto_27770 ) ) ( not ( = ?auto_27765 ?auto_27770 ) ) ( not ( = ?auto_27771 ?auto_27770 ) ) ( not ( = ?auto_27759 ?auto_27770 ) ) ( not ( = ?auto_27772 ?auto_27770 ) ) ( not ( = ?auto_27773 ?auto_27770 ) ) ( SURFACE-AT ?auto_27767 ?auto_27774 ) ( CLEAR ?auto_27767 ) ( IS-CRATE ?auto_27773 ) ( not ( = ?auto_27767 ?auto_27773 ) ) ( not ( = ?auto_27761 ?auto_27767 ) ) ( not ( = ?auto_27762 ?auto_27767 ) ) ( not ( = ?auto_27760 ?auto_27767 ) ) ( not ( = ?auto_27765 ?auto_27767 ) ) ( not ( = ?auto_27771 ?auto_27767 ) ) ( not ( = ?auto_27759 ?auto_27767 ) ) ( not ( = ?auto_27772 ?auto_27767 ) ) ( not ( = ?auto_27770 ?auto_27767 ) ) ( AVAILABLE ?auto_27775 ) ( IN ?auto_27773 ?auto_27776 ) ( TRUCK-AT ?auto_27776 ?auto_27777 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27760 ?auto_27761 ?auto_27762 )
      ( MAKE-3CRATE-VERIFY ?auto_27759 ?auto_27760 ?auto_27761 ?auto_27762 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27778 - SURFACE
      ?auto_27779 - SURFACE
      ?auto_27780 - SURFACE
      ?auto_27781 - SURFACE
      ?auto_27782 - SURFACE
    )
    :vars
    (
      ?auto_27794 - HOIST
      ?auto_27793 - PLACE
      ?auto_27783 - PLACE
      ?auto_27789 - HOIST
      ?auto_27785 - SURFACE
      ?auto_27786 - PLACE
      ?auto_27784 - HOIST
      ?auto_27791 - SURFACE
      ?auto_27796 - PLACE
      ?auto_27788 - HOIST
      ?auto_27792 - SURFACE
      ?auto_27790 - SURFACE
      ?auto_27787 - SURFACE
      ?auto_27795 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27794 ?auto_27793 ) ( IS-CRATE ?auto_27782 ) ( not ( = ?auto_27781 ?auto_27782 ) ) ( not ( = ?auto_27780 ?auto_27781 ) ) ( not ( = ?auto_27780 ?auto_27782 ) ) ( not ( = ?auto_27783 ?auto_27793 ) ) ( HOIST-AT ?auto_27789 ?auto_27783 ) ( not ( = ?auto_27794 ?auto_27789 ) ) ( AVAILABLE ?auto_27789 ) ( SURFACE-AT ?auto_27782 ?auto_27783 ) ( ON ?auto_27782 ?auto_27785 ) ( CLEAR ?auto_27782 ) ( not ( = ?auto_27781 ?auto_27785 ) ) ( not ( = ?auto_27782 ?auto_27785 ) ) ( not ( = ?auto_27780 ?auto_27785 ) ) ( IS-CRATE ?auto_27781 ) ( not ( = ?auto_27786 ?auto_27793 ) ) ( not ( = ?auto_27783 ?auto_27786 ) ) ( HOIST-AT ?auto_27784 ?auto_27786 ) ( not ( = ?auto_27794 ?auto_27784 ) ) ( not ( = ?auto_27789 ?auto_27784 ) ) ( SURFACE-AT ?auto_27781 ?auto_27786 ) ( ON ?auto_27781 ?auto_27791 ) ( CLEAR ?auto_27781 ) ( not ( = ?auto_27781 ?auto_27791 ) ) ( not ( = ?auto_27782 ?auto_27791 ) ) ( not ( = ?auto_27780 ?auto_27791 ) ) ( not ( = ?auto_27785 ?auto_27791 ) ) ( IS-CRATE ?auto_27780 ) ( not ( = ?auto_27779 ?auto_27780 ) ) ( not ( = ?auto_27781 ?auto_27779 ) ) ( not ( = ?auto_27782 ?auto_27779 ) ) ( not ( = ?auto_27785 ?auto_27779 ) ) ( not ( = ?auto_27791 ?auto_27779 ) ) ( not ( = ?auto_27796 ?auto_27793 ) ) ( not ( = ?auto_27783 ?auto_27796 ) ) ( not ( = ?auto_27786 ?auto_27796 ) ) ( HOIST-AT ?auto_27788 ?auto_27796 ) ( not ( = ?auto_27794 ?auto_27788 ) ) ( not ( = ?auto_27789 ?auto_27788 ) ) ( not ( = ?auto_27784 ?auto_27788 ) ) ( AVAILABLE ?auto_27788 ) ( SURFACE-AT ?auto_27780 ?auto_27796 ) ( ON ?auto_27780 ?auto_27792 ) ( CLEAR ?auto_27780 ) ( not ( = ?auto_27781 ?auto_27792 ) ) ( not ( = ?auto_27782 ?auto_27792 ) ) ( not ( = ?auto_27780 ?auto_27792 ) ) ( not ( = ?auto_27785 ?auto_27792 ) ) ( not ( = ?auto_27791 ?auto_27792 ) ) ( not ( = ?auto_27779 ?auto_27792 ) ) ( IS-CRATE ?auto_27779 ) ( not ( = ?auto_27778 ?auto_27779 ) ) ( not ( = ?auto_27781 ?auto_27778 ) ) ( not ( = ?auto_27782 ?auto_27778 ) ) ( not ( = ?auto_27780 ?auto_27778 ) ) ( not ( = ?auto_27785 ?auto_27778 ) ) ( not ( = ?auto_27791 ?auto_27778 ) ) ( not ( = ?auto_27792 ?auto_27778 ) ) ( AVAILABLE ?auto_27784 ) ( SURFACE-AT ?auto_27779 ?auto_27786 ) ( ON ?auto_27779 ?auto_27790 ) ( CLEAR ?auto_27779 ) ( not ( = ?auto_27781 ?auto_27790 ) ) ( not ( = ?auto_27782 ?auto_27790 ) ) ( not ( = ?auto_27780 ?auto_27790 ) ) ( not ( = ?auto_27785 ?auto_27790 ) ) ( not ( = ?auto_27791 ?auto_27790 ) ) ( not ( = ?auto_27779 ?auto_27790 ) ) ( not ( = ?auto_27792 ?auto_27790 ) ) ( not ( = ?auto_27778 ?auto_27790 ) ) ( SURFACE-AT ?auto_27787 ?auto_27793 ) ( CLEAR ?auto_27787 ) ( IS-CRATE ?auto_27778 ) ( not ( = ?auto_27787 ?auto_27778 ) ) ( not ( = ?auto_27781 ?auto_27787 ) ) ( not ( = ?auto_27782 ?auto_27787 ) ) ( not ( = ?auto_27780 ?auto_27787 ) ) ( not ( = ?auto_27785 ?auto_27787 ) ) ( not ( = ?auto_27791 ?auto_27787 ) ) ( not ( = ?auto_27779 ?auto_27787 ) ) ( not ( = ?auto_27792 ?auto_27787 ) ) ( not ( = ?auto_27790 ?auto_27787 ) ) ( AVAILABLE ?auto_27794 ) ( IN ?auto_27778 ?auto_27795 ) ( TRUCK-AT ?auto_27795 ?auto_27796 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27780 ?auto_27781 ?auto_27782 )
      ( MAKE-4CRATE-VERIFY ?auto_27778 ?auto_27779 ?auto_27780 ?auto_27781 ?auto_27782 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27797 - SURFACE
      ?auto_27798 - SURFACE
      ?auto_27799 - SURFACE
      ?auto_27800 - SURFACE
      ?auto_27801 - SURFACE
      ?auto_27802 - SURFACE
    )
    :vars
    (
      ?auto_27813 - HOIST
      ?auto_27812 - PLACE
      ?auto_27803 - PLACE
      ?auto_27808 - HOIST
      ?auto_27805 - SURFACE
      ?auto_27806 - PLACE
      ?auto_27804 - HOIST
      ?auto_27810 - SURFACE
      ?auto_27815 - PLACE
      ?auto_27807 - HOIST
      ?auto_27811 - SURFACE
      ?auto_27809 - SURFACE
      ?auto_27814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27813 ?auto_27812 ) ( IS-CRATE ?auto_27802 ) ( not ( = ?auto_27801 ?auto_27802 ) ) ( not ( = ?auto_27800 ?auto_27801 ) ) ( not ( = ?auto_27800 ?auto_27802 ) ) ( not ( = ?auto_27803 ?auto_27812 ) ) ( HOIST-AT ?auto_27808 ?auto_27803 ) ( not ( = ?auto_27813 ?auto_27808 ) ) ( AVAILABLE ?auto_27808 ) ( SURFACE-AT ?auto_27802 ?auto_27803 ) ( ON ?auto_27802 ?auto_27805 ) ( CLEAR ?auto_27802 ) ( not ( = ?auto_27801 ?auto_27805 ) ) ( not ( = ?auto_27802 ?auto_27805 ) ) ( not ( = ?auto_27800 ?auto_27805 ) ) ( IS-CRATE ?auto_27801 ) ( not ( = ?auto_27806 ?auto_27812 ) ) ( not ( = ?auto_27803 ?auto_27806 ) ) ( HOIST-AT ?auto_27804 ?auto_27806 ) ( not ( = ?auto_27813 ?auto_27804 ) ) ( not ( = ?auto_27808 ?auto_27804 ) ) ( SURFACE-AT ?auto_27801 ?auto_27806 ) ( ON ?auto_27801 ?auto_27810 ) ( CLEAR ?auto_27801 ) ( not ( = ?auto_27801 ?auto_27810 ) ) ( not ( = ?auto_27802 ?auto_27810 ) ) ( not ( = ?auto_27800 ?auto_27810 ) ) ( not ( = ?auto_27805 ?auto_27810 ) ) ( IS-CRATE ?auto_27800 ) ( not ( = ?auto_27799 ?auto_27800 ) ) ( not ( = ?auto_27801 ?auto_27799 ) ) ( not ( = ?auto_27802 ?auto_27799 ) ) ( not ( = ?auto_27805 ?auto_27799 ) ) ( not ( = ?auto_27810 ?auto_27799 ) ) ( not ( = ?auto_27815 ?auto_27812 ) ) ( not ( = ?auto_27803 ?auto_27815 ) ) ( not ( = ?auto_27806 ?auto_27815 ) ) ( HOIST-AT ?auto_27807 ?auto_27815 ) ( not ( = ?auto_27813 ?auto_27807 ) ) ( not ( = ?auto_27808 ?auto_27807 ) ) ( not ( = ?auto_27804 ?auto_27807 ) ) ( AVAILABLE ?auto_27807 ) ( SURFACE-AT ?auto_27800 ?auto_27815 ) ( ON ?auto_27800 ?auto_27811 ) ( CLEAR ?auto_27800 ) ( not ( = ?auto_27801 ?auto_27811 ) ) ( not ( = ?auto_27802 ?auto_27811 ) ) ( not ( = ?auto_27800 ?auto_27811 ) ) ( not ( = ?auto_27805 ?auto_27811 ) ) ( not ( = ?auto_27810 ?auto_27811 ) ) ( not ( = ?auto_27799 ?auto_27811 ) ) ( IS-CRATE ?auto_27799 ) ( not ( = ?auto_27798 ?auto_27799 ) ) ( not ( = ?auto_27801 ?auto_27798 ) ) ( not ( = ?auto_27802 ?auto_27798 ) ) ( not ( = ?auto_27800 ?auto_27798 ) ) ( not ( = ?auto_27805 ?auto_27798 ) ) ( not ( = ?auto_27810 ?auto_27798 ) ) ( not ( = ?auto_27811 ?auto_27798 ) ) ( AVAILABLE ?auto_27804 ) ( SURFACE-AT ?auto_27799 ?auto_27806 ) ( ON ?auto_27799 ?auto_27809 ) ( CLEAR ?auto_27799 ) ( not ( = ?auto_27801 ?auto_27809 ) ) ( not ( = ?auto_27802 ?auto_27809 ) ) ( not ( = ?auto_27800 ?auto_27809 ) ) ( not ( = ?auto_27805 ?auto_27809 ) ) ( not ( = ?auto_27810 ?auto_27809 ) ) ( not ( = ?auto_27799 ?auto_27809 ) ) ( not ( = ?auto_27811 ?auto_27809 ) ) ( not ( = ?auto_27798 ?auto_27809 ) ) ( SURFACE-AT ?auto_27797 ?auto_27812 ) ( CLEAR ?auto_27797 ) ( IS-CRATE ?auto_27798 ) ( not ( = ?auto_27797 ?auto_27798 ) ) ( not ( = ?auto_27801 ?auto_27797 ) ) ( not ( = ?auto_27802 ?auto_27797 ) ) ( not ( = ?auto_27800 ?auto_27797 ) ) ( not ( = ?auto_27805 ?auto_27797 ) ) ( not ( = ?auto_27810 ?auto_27797 ) ) ( not ( = ?auto_27799 ?auto_27797 ) ) ( not ( = ?auto_27811 ?auto_27797 ) ) ( not ( = ?auto_27809 ?auto_27797 ) ) ( AVAILABLE ?auto_27813 ) ( IN ?auto_27798 ?auto_27814 ) ( TRUCK-AT ?auto_27814 ?auto_27815 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27800 ?auto_27801 ?auto_27802 )
      ( MAKE-5CRATE-VERIFY ?auto_27797 ?auto_27798 ?auto_27799 ?auto_27800 ?auto_27801 ?auto_27802 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27816 - SURFACE
      ?auto_27817 - SURFACE
    )
    :vars
    (
      ?auto_27832 - HOIST
      ?auto_27831 - PLACE
      ?auto_27829 - SURFACE
      ?auto_27818 - PLACE
      ?auto_27824 - HOIST
      ?auto_27820 - SURFACE
      ?auto_27821 - PLACE
      ?auto_27819 - HOIST
      ?auto_27827 - SURFACE
      ?auto_27825 - SURFACE
      ?auto_27834 - PLACE
      ?auto_27823 - HOIST
      ?auto_27828 - SURFACE
      ?auto_27830 - SURFACE
      ?auto_27826 - SURFACE
      ?auto_27822 - SURFACE
      ?auto_27833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27832 ?auto_27831 ) ( IS-CRATE ?auto_27817 ) ( not ( = ?auto_27816 ?auto_27817 ) ) ( not ( = ?auto_27829 ?auto_27816 ) ) ( not ( = ?auto_27829 ?auto_27817 ) ) ( not ( = ?auto_27818 ?auto_27831 ) ) ( HOIST-AT ?auto_27824 ?auto_27818 ) ( not ( = ?auto_27832 ?auto_27824 ) ) ( AVAILABLE ?auto_27824 ) ( SURFACE-AT ?auto_27817 ?auto_27818 ) ( ON ?auto_27817 ?auto_27820 ) ( CLEAR ?auto_27817 ) ( not ( = ?auto_27816 ?auto_27820 ) ) ( not ( = ?auto_27817 ?auto_27820 ) ) ( not ( = ?auto_27829 ?auto_27820 ) ) ( IS-CRATE ?auto_27816 ) ( not ( = ?auto_27821 ?auto_27831 ) ) ( not ( = ?auto_27818 ?auto_27821 ) ) ( HOIST-AT ?auto_27819 ?auto_27821 ) ( not ( = ?auto_27832 ?auto_27819 ) ) ( not ( = ?auto_27824 ?auto_27819 ) ) ( SURFACE-AT ?auto_27816 ?auto_27821 ) ( ON ?auto_27816 ?auto_27827 ) ( CLEAR ?auto_27816 ) ( not ( = ?auto_27816 ?auto_27827 ) ) ( not ( = ?auto_27817 ?auto_27827 ) ) ( not ( = ?auto_27829 ?auto_27827 ) ) ( not ( = ?auto_27820 ?auto_27827 ) ) ( IS-CRATE ?auto_27829 ) ( not ( = ?auto_27825 ?auto_27829 ) ) ( not ( = ?auto_27816 ?auto_27825 ) ) ( not ( = ?auto_27817 ?auto_27825 ) ) ( not ( = ?auto_27820 ?auto_27825 ) ) ( not ( = ?auto_27827 ?auto_27825 ) ) ( not ( = ?auto_27834 ?auto_27831 ) ) ( not ( = ?auto_27818 ?auto_27834 ) ) ( not ( = ?auto_27821 ?auto_27834 ) ) ( HOIST-AT ?auto_27823 ?auto_27834 ) ( not ( = ?auto_27832 ?auto_27823 ) ) ( not ( = ?auto_27824 ?auto_27823 ) ) ( not ( = ?auto_27819 ?auto_27823 ) ) ( SURFACE-AT ?auto_27829 ?auto_27834 ) ( ON ?auto_27829 ?auto_27828 ) ( CLEAR ?auto_27829 ) ( not ( = ?auto_27816 ?auto_27828 ) ) ( not ( = ?auto_27817 ?auto_27828 ) ) ( not ( = ?auto_27829 ?auto_27828 ) ) ( not ( = ?auto_27820 ?auto_27828 ) ) ( not ( = ?auto_27827 ?auto_27828 ) ) ( not ( = ?auto_27825 ?auto_27828 ) ) ( IS-CRATE ?auto_27825 ) ( not ( = ?auto_27830 ?auto_27825 ) ) ( not ( = ?auto_27816 ?auto_27830 ) ) ( not ( = ?auto_27817 ?auto_27830 ) ) ( not ( = ?auto_27829 ?auto_27830 ) ) ( not ( = ?auto_27820 ?auto_27830 ) ) ( not ( = ?auto_27827 ?auto_27830 ) ) ( not ( = ?auto_27828 ?auto_27830 ) ) ( AVAILABLE ?auto_27819 ) ( SURFACE-AT ?auto_27825 ?auto_27821 ) ( ON ?auto_27825 ?auto_27826 ) ( CLEAR ?auto_27825 ) ( not ( = ?auto_27816 ?auto_27826 ) ) ( not ( = ?auto_27817 ?auto_27826 ) ) ( not ( = ?auto_27829 ?auto_27826 ) ) ( not ( = ?auto_27820 ?auto_27826 ) ) ( not ( = ?auto_27827 ?auto_27826 ) ) ( not ( = ?auto_27825 ?auto_27826 ) ) ( not ( = ?auto_27828 ?auto_27826 ) ) ( not ( = ?auto_27830 ?auto_27826 ) ) ( SURFACE-AT ?auto_27822 ?auto_27831 ) ( CLEAR ?auto_27822 ) ( IS-CRATE ?auto_27830 ) ( not ( = ?auto_27822 ?auto_27830 ) ) ( not ( = ?auto_27816 ?auto_27822 ) ) ( not ( = ?auto_27817 ?auto_27822 ) ) ( not ( = ?auto_27829 ?auto_27822 ) ) ( not ( = ?auto_27820 ?auto_27822 ) ) ( not ( = ?auto_27827 ?auto_27822 ) ) ( not ( = ?auto_27825 ?auto_27822 ) ) ( not ( = ?auto_27828 ?auto_27822 ) ) ( not ( = ?auto_27826 ?auto_27822 ) ) ( AVAILABLE ?auto_27832 ) ( TRUCK-AT ?auto_27833 ?auto_27834 ) ( LIFTING ?auto_27823 ?auto_27830 ) )
    :subtasks
    ( ( !LOAD ?auto_27823 ?auto_27830 ?auto_27833 ?auto_27834 )
      ( MAKE-2CRATE ?auto_27829 ?auto_27816 ?auto_27817 )
      ( MAKE-1CRATE-VERIFY ?auto_27816 ?auto_27817 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27835 - SURFACE
      ?auto_27836 - SURFACE
      ?auto_27837 - SURFACE
    )
    :vars
    (
      ?auto_27844 - HOIST
      ?auto_27838 - PLACE
      ?auto_27845 - PLACE
      ?auto_27849 - HOIST
      ?auto_27842 - SURFACE
      ?auto_27839 - PLACE
      ?auto_27848 - HOIST
      ?auto_27843 - SURFACE
      ?auto_27847 - SURFACE
      ?auto_27846 - PLACE
      ?auto_27853 - HOIST
      ?auto_27841 - SURFACE
      ?auto_27840 - SURFACE
      ?auto_27851 - SURFACE
      ?auto_27852 - SURFACE
      ?auto_27850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27844 ?auto_27838 ) ( IS-CRATE ?auto_27837 ) ( not ( = ?auto_27836 ?auto_27837 ) ) ( not ( = ?auto_27835 ?auto_27836 ) ) ( not ( = ?auto_27835 ?auto_27837 ) ) ( not ( = ?auto_27845 ?auto_27838 ) ) ( HOIST-AT ?auto_27849 ?auto_27845 ) ( not ( = ?auto_27844 ?auto_27849 ) ) ( AVAILABLE ?auto_27849 ) ( SURFACE-AT ?auto_27837 ?auto_27845 ) ( ON ?auto_27837 ?auto_27842 ) ( CLEAR ?auto_27837 ) ( not ( = ?auto_27836 ?auto_27842 ) ) ( not ( = ?auto_27837 ?auto_27842 ) ) ( not ( = ?auto_27835 ?auto_27842 ) ) ( IS-CRATE ?auto_27836 ) ( not ( = ?auto_27839 ?auto_27838 ) ) ( not ( = ?auto_27845 ?auto_27839 ) ) ( HOIST-AT ?auto_27848 ?auto_27839 ) ( not ( = ?auto_27844 ?auto_27848 ) ) ( not ( = ?auto_27849 ?auto_27848 ) ) ( SURFACE-AT ?auto_27836 ?auto_27839 ) ( ON ?auto_27836 ?auto_27843 ) ( CLEAR ?auto_27836 ) ( not ( = ?auto_27836 ?auto_27843 ) ) ( not ( = ?auto_27837 ?auto_27843 ) ) ( not ( = ?auto_27835 ?auto_27843 ) ) ( not ( = ?auto_27842 ?auto_27843 ) ) ( IS-CRATE ?auto_27835 ) ( not ( = ?auto_27847 ?auto_27835 ) ) ( not ( = ?auto_27836 ?auto_27847 ) ) ( not ( = ?auto_27837 ?auto_27847 ) ) ( not ( = ?auto_27842 ?auto_27847 ) ) ( not ( = ?auto_27843 ?auto_27847 ) ) ( not ( = ?auto_27846 ?auto_27838 ) ) ( not ( = ?auto_27845 ?auto_27846 ) ) ( not ( = ?auto_27839 ?auto_27846 ) ) ( HOIST-AT ?auto_27853 ?auto_27846 ) ( not ( = ?auto_27844 ?auto_27853 ) ) ( not ( = ?auto_27849 ?auto_27853 ) ) ( not ( = ?auto_27848 ?auto_27853 ) ) ( SURFACE-AT ?auto_27835 ?auto_27846 ) ( ON ?auto_27835 ?auto_27841 ) ( CLEAR ?auto_27835 ) ( not ( = ?auto_27836 ?auto_27841 ) ) ( not ( = ?auto_27837 ?auto_27841 ) ) ( not ( = ?auto_27835 ?auto_27841 ) ) ( not ( = ?auto_27842 ?auto_27841 ) ) ( not ( = ?auto_27843 ?auto_27841 ) ) ( not ( = ?auto_27847 ?auto_27841 ) ) ( IS-CRATE ?auto_27847 ) ( not ( = ?auto_27840 ?auto_27847 ) ) ( not ( = ?auto_27836 ?auto_27840 ) ) ( not ( = ?auto_27837 ?auto_27840 ) ) ( not ( = ?auto_27835 ?auto_27840 ) ) ( not ( = ?auto_27842 ?auto_27840 ) ) ( not ( = ?auto_27843 ?auto_27840 ) ) ( not ( = ?auto_27841 ?auto_27840 ) ) ( AVAILABLE ?auto_27848 ) ( SURFACE-AT ?auto_27847 ?auto_27839 ) ( ON ?auto_27847 ?auto_27851 ) ( CLEAR ?auto_27847 ) ( not ( = ?auto_27836 ?auto_27851 ) ) ( not ( = ?auto_27837 ?auto_27851 ) ) ( not ( = ?auto_27835 ?auto_27851 ) ) ( not ( = ?auto_27842 ?auto_27851 ) ) ( not ( = ?auto_27843 ?auto_27851 ) ) ( not ( = ?auto_27847 ?auto_27851 ) ) ( not ( = ?auto_27841 ?auto_27851 ) ) ( not ( = ?auto_27840 ?auto_27851 ) ) ( SURFACE-AT ?auto_27852 ?auto_27838 ) ( CLEAR ?auto_27852 ) ( IS-CRATE ?auto_27840 ) ( not ( = ?auto_27852 ?auto_27840 ) ) ( not ( = ?auto_27836 ?auto_27852 ) ) ( not ( = ?auto_27837 ?auto_27852 ) ) ( not ( = ?auto_27835 ?auto_27852 ) ) ( not ( = ?auto_27842 ?auto_27852 ) ) ( not ( = ?auto_27843 ?auto_27852 ) ) ( not ( = ?auto_27847 ?auto_27852 ) ) ( not ( = ?auto_27841 ?auto_27852 ) ) ( not ( = ?auto_27851 ?auto_27852 ) ) ( AVAILABLE ?auto_27844 ) ( TRUCK-AT ?auto_27850 ?auto_27846 ) ( LIFTING ?auto_27853 ?auto_27840 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27836 ?auto_27837 )
      ( MAKE-2CRATE-VERIFY ?auto_27835 ?auto_27836 ?auto_27837 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27854 - SURFACE
      ?auto_27855 - SURFACE
      ?auto_27856 - SURFACE
      ?auto_27857 - SURFACE
    )
    :vars
    (
      ?auto_27861 - HOIST
      ?auto_27871 - PLACE
      ?auto_27868 - PLACE
      ?auto_27864 - HOIST
      ?auto_27867 - SURFACE
      ?auto_27860 - PLACE
      ?auto_27858 - HOIST
      ?auto_27869 - SURFACE
      ?auto_27859 - PLACE
      ?auto_27862 - HOIST
      ?auto_27866 - SURFACE
      ?auto_27865 - SURFACE
      ?auto_27863 - SURFACE
      ?auto_27870 - SURFACE
      ?auto_27872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27861 ?auto_27871 ) ( IS-CRATE ?auto_27857 ) ( not ( = ?auto_27856 ?auto_27857 ) ) ( not ( = ?auto_27855 ?auto_27856 ) ) ( not ( = ?auto_27855 ?auto_27857 ) ) ( not ( = ?auto_27868 ?auto_27871 ) ) ( HOIST-AT ?auto_27864 ?auto_27868 ) ( not ( = ?auto_27861 ?auto_27864 ) ) ( AVAILABLE ?auto_27864 ) ( SURFACE-AT ?auto_27857 ?auto_27868 ) ( ON ?auto_27857 ?auto_27867 ) ( CLEAR ?auto_27857 ) ( not ( = ?auto_27856 ?auto_27867 ) ) ( not ( = ?auto_27857 ?auto_27867 ) ) ( not ( = ?auto_27855 ?auto_27867 ) ) ( IS-CRATE ?auto_27856 ) ( not ( = ?auto_27860 ?auto_27871 ) ) ( not ( = ?auto_27868 ?auto_27860 ) ) ( HOIST-AT ?auto_27858 ?auto_27860 ) ( not ( = ?auto_27861 ?auto_27858 ) ) ( not ( = ?auto_27864 ?auto_27858 ) ) ( SURFACE-AT ?auto_27856 ?auto_27860 ) ( ON ?auto_27856 ?auto_27869 ) ( CLEAR ?auto_27856 ) ( not ( = ?auto_27856 ?auto_27869 ) ) ( not ( = ?auto_27857 ?auto_27869 ) ) ( not ( = ?auto_27855 ?auto_27869 ) ) ( not ( = ?auto_27867 ?auto_27869 ) ) ( IS-CRATE ?auto_27855 ) ( not ( = ?auto_27854 ?auto_27855 ) ) ( not ( = ?auto_27856 ?auto_27854 ) ) ( not ( = ?auto_27857 ?auto_27854 ) ) ( not ( = ?auto_27867 ?auto_27854 ) ) ( not ( = ?auto_27869 ?auto_27854 ) ) ( not ( = ?auto_27859 ?auto_27871 ) ) ( not ( = ?auto_27868 ?auto_27859 ) ) ( not ( = ?auto_27860 ?auto_27859 ) ) ( HOIST-AT ?auto_27862 ?auto_27859 ) ( not ( = ?auto_27861 ?auto_27862 ) ) ( not ( = ?auto_27864 ?auto_27862 ) ) ( not ( = ?auto_27858 ?auto_27862 ) ) ( SURFACE-AT ?auto_27855 ?auto_27859 ) ( ON ?auto_27855 ?auto_27866 ) ( CLEAR ?auto_27855 ) ( not ( = ?auto_27856 ?auto_27866 ) ) ( not ( = ?auto_27857 ?auto_27866 ) ) ( not ( = ?auto_27855 ?auto_27866 ) ) ( not ( = ?auto_27867 ?auto_27866 ) ) ( not ( = ?auto_27869 ?auto_27866 ) ) ( not ( = ?auto_27854 ?auto_27866 ) ) ( IS-CRATE ?auto_27854 ) ( not ( = ?auto_27865 ?auto_27854 ) ) ( not ( = ?auto_27856 ?auto_27865 ) ) ( not ( = ?auto_27857 ?auto_27865 ) ) ( not ( = ?auto_27855 ?auto_27865 ) ) ( not ( = ?auto_27867 ?auto_27865 ) ) ( not ( = ?auto_27869 ?auto_27865 ) ) ( not ( = ?auto_27866 ?auto_27865 ) ) ( AVAILABLE ?auto_27858 ) ( SURFACE-AT ?auto_27854 ?auto_27860 ) ( ON ?auto_27854 ?auto_27863 ) ( CLEAR ?auto_27854 ) ( not ( = ?auto_27856 ?auto_27863 ) ) ( not ( = ?auto_27857 ?auto_27863 ) ) ( not ( = ?auto_27855 ?auto_27863 ) ) ( not ( = ?auto_27867 ?auto_27863 ) ) ( not ( = ?auto_27869 ?auto_27863 ) ) ( not ( = ?auto_27854 ?auto_27863 ) ) ( not ( = ?auto_27866 ?auto_27863 ) ) ( not ( = ?auto_27865 ?auto_27863 ) ) ( SURFACE-AT ?auto_27870 ?auto_27871 ) ( CLEAR ?auto_27870 ) ( IS-CRATE ?auto_27865 ) ( not ( = ?auto_27870 ?auto_27865 ) ) ( not ( = ?auto_27856 ?auto_27870 ) ) ( not ( = ?auto_27857 ?auto_27870 ) ) ( not ( = ?auto_27855 ?auto_27870 ) ) ( not ( = ?auto_27867 ?auto_27870 ) ) ( not ( = ?auto_27869 ?auto_27870 ) ) ( not ( = ?auto_27854 ?auto_27870 ) ) ( not ( = ?auto_27866 ?auto_27870 ) ) ( not ( = ?auto_27863 ?auto_27870 ) ) ( AVAILABLE ?auto_27861 ) ( TRUCK-AT ?auto_27872 ?auto_27859 ) ( LIFTING ?auto_27862 ?auto_27865 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27855 ?auto_27856 ?auto_27857 )
      ( MAKE-3CRATE-VERIFY ?auto_27854 ?auto_27855 ?auto_27856 ?auto_27857 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27873 - SURFACE
      ?auto_27874 - SURFACE
      ?auto_27875 - SURFACE
      ?auto_27876 - SURFACE
      ?auto_27877 - SURFACE
    )
    :vars
    (
      ?auto_27881 - HOIST
      ?auto_27890 - PLACE
      ?auto_27887 - PLACE
      ?auto_27884 - HOIST
      ?auto_27886 - SURFACE
      ?auto_27880 - PLACE
      ?auto_27878 - HOIST
      ?auto_27888 - SURFACE
      ?auto_27879 - PLACE
      ?auto_27882 - HOIST
      ?auto_27885 - SURFACE
      ?auto_27883 - SURFACE
      ?auto_27889 - SURFACE
      ?auto_27891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27881 ?auto_27890 ) ( IS-CRATE ?auto_27877 ) ( not ( = ?auto_27876 ?auto_27877 ) ) ( not ( = ?auto_27875 ?auto_27876 ) ) ( not ( = ?auto_27875 ?auto_27877 ) ) ( not ( = ?auto_27887 ?auto_27890 ) ) ( HOIST-AT ?auto_27884 ?auto_27887 ) ( not ( = ?auto_27881 ?auto_27884 ) ) ( AVAILABLE ?auto_27884 ) ( SURFACE-AT ?auto_27877 ?auto_27887 ) ( ON ?auto_27877 ?auto_27886 ) ( CLEAR ?auto_27877 ) ( not ( = ?auto_27876 ?auto_27886 ) ) ( not ( = ?auto_27877 ?auto_27886 ) ) ( not ( = ?auto_27875 ?auto_27886 ) ) ( IS-CRATE ?auto_27876 ) ( not ( = ?auto_27880 ?auto_27890 ) ) ( not ( = ?auto_27887 ?auto_27880 ) ) ( HOIST-AT ?auto_27878 ?auto_27880 ) ( not ( = ?auto_27881 ?auto_27878 ) ) ( not ( = ?auto_27884 ?auto_27878 ) ) ( SURFACE-AT ?auto_27876 ?auto_27880 ) ( ON ?auto_27876 ?auto_27888 ) ( CLEAR ?auto_27876 ) ( not ( = ?auto_27876 ?auto_27888 ) ) ( not ( = ?auto_27877 ?auto_27888 ) ) ( not ( = ?auto_27875 ?auto_27888 ) ) ( not ( = ?auto_27886 ?auto_27888 ) ) ( IS-CRATE ?auto_27875 ) ( not ( = ?auto_27874 ?auto_27875 ) ) ( not ( = ?auto_27876 ?auto_27874 ) ) ( not ( = ?auto_27877 ?auto_27874 ) ) ( not ( = ?auto_27886 ?auto_27874 ) ) ( not ( = ?auto_27888 ?auto_27874 ) ) ( not ( = ?auto_27879 ?auto_27890 ) ) ( not ( = ?auto_27887 ?auto_27879 ) ) ( not ( = ?auto_27880 ?auto_27879 ) ) ( HOIST-AT ?auto_27882 ?auto_27879 ) ( not ( = ?auto_27881 ?auto_27882 ) ) ( not ( = ?auto_27884 ?auto_27882 ) ) ( not ( = ?auto_27878 ?auto_27882 ) ) ( SURFACE-AT ?auto_27875 ?auto_27879 ) ( ON ?auto_27875 ?auto_27885 ) ( CLEAR ?auto_27875 ) ( not ( = ?auto_27876 ?auto_27885 ) ) ( not ( = ?auto_27877 ?auto_27885 ) ) ( not ( = ?auto_27875 ?auto_27885 ) ) ( not ( = ?auto_27886 ?auto_27885 ) ) ( not ( = ?auto_27888 ?auto_27885 ) ) ( not ( = ?auto_27874 ?auto_27885 ) ) ( IS-CRATE ?auto_27874 ) ( not ( = ?auto_27873 ?auto_27874 ) ) ( not ( = ?auto_27876 ?auto_27873 ) ) ( not ( = ?auto_27877 ?auto_27873 ) ) ( not ( = ?auto_27875 ?auto_27873 ) ) ( not ( = ?auto_27886 ?auto_27873 ) ) ( not ( = ?auto_27888 ?auto_27873 ) ) ( not ( = ?auto_27885 ?auto_27873 ) ) ( AVAILABLE ?auto_27878 ) ( SURFACE-AT ?auto_27874 ?auto_27880 ) ( ON ?auto_27874 ?auto_27883 ) ( CLEAR ?auto_27874 ) ( not ( = ?auto_27876 ?auto_27883 ) ) ( not ( = ?auto_27877 ?auto_27883 ) ) ( not ( = ?auto_27875 ?auto_27883 ) ) ( not ( = ?auto_27886 ?auto_27883 ) ) ( not ( = ?auto_27888 ?auto_27883 ) ) ( not ( = ?auto_27874 ?auto_27883 ) ) ( not ( = ?auto_27885 ?auto_27883 ) ) ( not ( = ?auto_27873 ?auto_27883 ) ) ( SURFACE-AT ?auto_27889 ?auto_27890 ) ( CLEAR ?auto_27889 ) ( IS-CRATE ?auto_27873 ) ( not ( = ?auto_27889 ?auto_27873 ) ) ( not ( = ?auto_27876 ?auto_27889 ) ) ( not ( = ?auto_27877 ?auto_27889 ) ) ( not ( = ?auto_27875 ?auto_27889 ) ) ( not ( = ?auto_27886 ?auto_27889 ) ) ( not ( = ?auto_27888 ?auto_27889 ) ) ( not ( = ?auto_27874 ?auto_27889 ) ) ( not ( = ?auto_27885 ?auto_27889 ) ) ( not ( = ?auto_27883 ?auto_27889 ) ) ( AVAILABLE ?auto_27881 ) ( TRUCK-AT ?auto_27891 ?auto_27879 ) ( LIFTING ?auto_27882 ?auto_27873 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27875 ?auto_27876 ?auto_27877 )
      ( MAKE-4CRATE-VERIFY ?auto_27873 ?auto_27874 ?auto_27875 ?auto_27876 ?auto_27877 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27892 - SURFACE
      ?auto_27893 - SURFACE
      ?auto_27894 - SURFACE
      ?auto_27895 - SURFACE
      ?auto_27896 - SURFACE
      ?auto_27897 - SURFACE
    )
    :vars
    (
      ?auto_27901 - HOIST
      ?auto_27909 - PLACE
      ?auto_27907 - PLACE
      ?auto_27904 - HOIST
      ?auto_27906 - SURFACE
      ?auto_27900 - PLACE
      ?auto_27898 - HOIST
      ?auto_27908 - SURFACE
      ?auto_27899 - PLACE
      ?auto_27902 - HOIST
      ?auto_27905 - SURFACE
      ?auto_27903 - SURFACE
      ?auto_27910 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27901 ?auto_27909 ) ( IS-CRATE ?auto_27897 ) ( not ( = ?auto_27896 ?auto_27897 ) ) ( not ( = ?auto_27895 ?auto_27896 ) ) ( not ( = ?auto_27895 ?auto_27897 ) ) ( not ( = ?auto_27907 ?auto_27909 ) ) ( HOIST-AT ?auto_27904 ?auto_27907 ) ( not ( = ?auto_27901 ?auto_27904 ) ) ( AVAILABLE ?auto_27904 ) ( SURFACE-AT ?auto_27897 ?auto_27907 ) ( ON ?auto_27897 ?auto_27906 ) ( CLEAR ?auto_27897 ) ( not ( = ?auto_27896 ?auto_27906 ) ) ( not ( = ?auto_27897 ?auto_27906 ) ) ( not ( = ?auto_27895 ?auto_27906 ) ) ( IS-CRATE ?auto_27896 ) ( not ( = ?auto_27900 ?auto_27909 ) ) ( not ( = ?auto_27907 ?auto_27900 ) ) ( HOIST-AT ?auto_27898 ?auto_27900 ) ( not ( = ?auto_27901 ?auto_27898 ) ) ( not ( = ?auto_27904 ?auto_27898 ) ) ( SURFACE-AT ?auto_27896 ?auto_27900 ) ( ON ?auto_27896 ?auto_27908 ) ( CLEAR ?auto_27896 ) ( not ( = ?auto_27896 ?auto_27908 ) ) ( not ( = ?auto_27897 ?auto_27908 ) ) ( not ( = ?auto_27895 ?auto_27908 ) ) ( not ( = ?auto_27906 ?auto_27908 ) ) ( IS-CRATE ?auto_27895 ) ( not ( = ?auto_27894 ?auto_27895 ) ) ( not ( = ?auto_27896 ?auto_27894 ) ) ( not ( = ?auto_27897 ?auto_27894 ) ) ( not ( = ?auto_27906 ?auto_27894 ) ) ( not ( = ?auto_27908 ?auto_27894 ) ) ( not ( = ?auto_27899 ?auto_27909 ) ) ( not ( = ?auto_27907 ?auto_27899 ) ) ( not ( = ?auto_27900 ?auto_27899 ) ) ( HOIST-AT ?auto_27902 ?auto_27899 ) ( not ( = ?auto_27901 ?auto_27902 ) ) ( not ( = ?auto_27904 ?auto_27902 ) ) ( not ( = ?auto_27898 ?auto_27902 ) ) ( SURFACE-AT ?auto_27895 ?auto_27899 ) ( ON ?auto_27895 ?auto_27905 ) ( CLEAR ?auto_27895 ) ( not ( = ?auto_27896 ?auto_27905 ) ) ( not ( = ?auto_27897 ?auto_27905 ) ) ( not ( = ?auto_27895 ?auto_27905 ) ) ( not ( = ?auto_27906 ?auto_27905 ) ) ( not ( = ?auto_27908 ?auto_27905 ) ) ( not ( = ?auto_27894 ?auto_27905 ) ) ( IS-CRATE ?auto_27894 ) ( not ( = ?auto_27893 ?auto_27894 ) ) ( not ( = ?auto_27896 ?auto_27893 ) ) ( not ( = ?auto_27897 ?auto_27893 ) ) ( not ( = ?auto_27895 ?auto_27893 ) ) ( not ( = ?auto_27906 ?auto_27893 ) ) ( not ( = ?auto_27908 ?auto_27893 ) ) ( not ( = ?auto_27905 ?auto_27893 ) ) ( AVAILABLE ?auto_27898 ) ( SURFACE-AT ?auto_27894 ?auto_27900 ) ( ON ?auto_27894 ?auto_27903 ) ( CLEAR ?auto_27894 ) ( not ( = ?auto_27896 ?auto_27903 ) ) ( not ( = ?auto_27897 ?auto_27903 ) ) ( not ( = ?auto_27895 ?auto_27903 ) ) ( not ( = ?auto_27906 ?auto_27903 ) ) ( not ( = ?auto_27908 ?auto_27903 ) ) ( not ( = ?auto_27894 ?auto_27903 ) ) ( not ( = ?auto_27905 ?auto_27903 ) ) ( not ( = ?auto_27893 ?auto_27903 ) ) ( SURFACE-AT ?auto_27892 ?auto_27909 ) ( CLEAR ?auto_27892 ) ( IS-CRATE ?auto_27893 ) ( not ( = ?auto_27892 ?auto_27893 ) ) ( not ( = ?auto_27896 ?auto_27892 ) ) ( not ( = ?auto_27897 ?auto_27892 ) ) ( not ( = ?auto_27895 ?auto_27892 ) ) ( not ( = ?auto_27906 ?auto_27892 ) ) ( not ( = ?auto_27908 ?auto_27892 ) ) ( not ( = ?auto_27894 ?auto_27892 ) ) ( not ( = ?auto_27905 ?auto_27892 ) ) ( not ( = ?auto_27903 ?auto_27892 ) ) ( AVAILABLE ?auto_27901 ) ( TRUCK-AT ?auto_27910 ?auto_27899 ) ( LIFTING ?auto_27902 ?auto_27893 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27895 ?auto_27896 ?auto_27897 )
      ( MAKE-5CRATE-VERIFY ?auto_27892 ?auto_27893 ?auto_27894 ?auto_27895 ?auto_27896 ?auto_27897 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27911 - SURFACE
      ?auto_27912 - SURFACE
    )
    :vars
    (
      ?auto_27916 - HOIST
      ?auto_27928 - PLACE
      ?auto_27926 - SURFACE
      ?auto_27924 - PLACE
      ?auto_27920 - HOIST
      ?auto_27923 - SURFACE
      ?auto_27915 - PLACE
      ?auto_27913 - HOIST
      ?auto_27925 - SURFACE
      ?auto_27918 - SURFACE
      ?auto_27914 - PLACE
      ?auto_27917 - HOIST
      ?auto_27922 - SURFACE
      ?auto_27921 - SURFACE
      ?auto_27919 - SURFACE
      ?auto_27927 - SURFACE
      ?auto_27929 - TRUCK
      ?auto_27930 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27916 ?auto_27928 ) ( IS-CRATE ?auto_27912 ) ( not ( = ?auto_27911 ?auto_27912 ) ) ( not ( = ?auto_27926 ?auto_27911 ) ) ( not ( = ?auto_27926 ?auto_27912 ) ) ( not ( = ?auto_27924 ?auto_27928 ) ) ( HOIST-AT ?auto_27920 ?auto_27924 ) ( not ( = ?auto_27916 ?auto_27920 ) ) ( AVAILABLE ?auto_27920 ) ( SURFACE-AT ?auto_27912 ?auto_27924 ) ( ON ?auto_27912 ?auto_27923 ) ( CLEAR ?auto_27912 ) ( not ( = ?auto_27911 ?auto_27923 ) ) ( not ( = ?auto_27912 ?auto_27923 ) ) ( not ( = ?auto_27926 ?auto_27923 ) ) ( IS-CRATE ?auto_27911 ) ( not ( = ?auto_27915 ?auto_27928 ) ) ( not ( = ?auto_27924 ?auto_27915 ) ) ( HOIST-AT ?auto_27913 ?auto_27915 ) ( not ( = ?auto_27916 ?auto_27913 ) ) ( not ( = ?auto_27920 ?auto_27913 ) ) ( SURFACE-AT ?auto_27911 ?auto_27915 ) ( ON ?auto_27911 ?auto_27925 ) ( CLEAR ?auto_27911 ) ( not ( = ?auto_27911 ?auto_27925 ) ) ( not ( = ?auto_27912 ?auto_27925 ) ) ( not ( = ?auto_27926 ?auto_27925 ) ) ( not ( = ?auto_27923 ?auto_27925 ) ) ( IS-CRATE ?auto_27926 ) ( not ( = ?auto_27918 ?auto_27926 ) ) ( not ( = ?auto_27911 ?auto_27918 ) ) ( not ( = ?auto_27912 ?auto_27918 ) ) ( not ( = ?auto_27923 ?auto_27918 ) ) ( not ( = ?auto_27925 ?auto_27918 ) ) ( not ( = ?auto_27914 ?auto_27928 ) ) ( not ( = ?auto_27924 ?auto_27914 ) ) ( not ( = ?auto_27915 ?auto_27914 ) ) ( HOIST-AT ?auto_27917 ?auto_27914 ) ( not ( = ?auto_27916 ?auto_27917 ) ) ( not ( = ?auto_27920 ?auto_27917 ) ) ( not ( = ?auto_27913 ?auto_27917 ) ) ( SURFACE-AT ?auto_27926 ?auto_27914 ) ( ON ?auto_27926 ?auto_27922 ) ( CLEAR ?auto_27926 ) ( not ( = ?auto_27911 ?auto_27922 ) ) ( not ( = ?auto_27912 ?auto_27922 ) ) ( not ( = ?auto_27926 ?auto_27922 ) ) ( not ( = ?auto_27923 ?auto_27922 ) ) ( not ( = ?auto_27925 ?auto_27922 ) ) ( not ( = ?auto_27918 ?auto_27922 ) ) ( IS-CRATE ?auto_27918 ) ( not ( = ?auto_27921 ?auto_27918 ) ) ( not ( = ?auto_27911 ?auto_27921 ) ) ( not ( = ?auto_27912 ?auto_27921 ) ) ( not ( = ?auto_27926 ?auto_27921 ) ) ( not ( = ?auto_27923 ?auto_27921 ) ) ( not ( = ?auto_27925 ?auto_27921 ) ) ( not ( = ?auto_27922 ?auto_27921 ) ) ( AVAILABLE ?auto_27913 ) ( SURFACE-AT ?auto_27918 ?auto_27915 ) ( ON ?auto_27918 ?auto_27919 ) ( CLEAR ?auto_27918 ) ( not ( = ?auto_27911 ?auto_27919 ) ) ( not ( = ?auto_27912 ?auto_27919 ) ) ( not ( = ?auto_27926 ?auto_27919 ) ) ( not ( = ?auto_27923 ?auto_27919 ) ) ( not ( = ?auto_27925 ?auto_27919 ) ) ( not ( = ?auto_27918 ?auto_27919 ) ) ( not ( = ?auto_27922 ?auto_27919 ) ) ( not ( = ?auto_27921 ?auto_27919 ) ) ( SURFACE-AT ?auto_27927 ?auto_27928 ) ( CLEAR ?auto_27927 ) ( IS-CRATE ?auto_27921 ) ( not ( = ?auto_27927 ?auto_27921 ) ) ( not ( = ?auto_27911 ?auto_27927 ) ) ( not ( = ?auto_27912 ?auto_27927 ) ) ( not ( = ?auto_27926 ?auto_27927 ) ) ( not ( = ?auto_27923 ?auto_27927 ) ) ( not ( = ?auto_27925 ?auto_27927 ) ) ( not ( = ?auto_27918 ?auto_27927 ) ) ( not ( = ?auto_27922 ?auto_27927 ) ) ( not ( = ?auto_27919 ?auto_27927 ) ) ( AVAILABLE ?auto_27916 ) ( TRUCK-AT ?auto_27929 ?auto_27914 ) ( AVAILABLE ?auto_27917 ) ( SURFACE-AT ?auto_27921 ?auto_27914 ) ( ON ?auto_27921 ?auto_27930 ) ( CLEAR ?auto_27921 ) ( not ( = ?auto_27911 ?auto_27930 ) ) ( not ( = ?auto_27912 ?auto_27930 ) ) ( not ( = ?auto_27926 ?auto_27930 ) ) ( not ( = ?auto_27923 ?auto_27930 ) ) ( not ( = ?auto_27925 ?auto_27930 ) ) ( not ( = ?auto_27918 ?auto_27930 ) ) ( not ( = ?auto_27922 ?auto_27930 ) ) ( not ( = ?auto_27921 ?auto_27930 ) ) ( not ( = ?auto_27919 ?auto_27930 ) ) ( not ( = ?auto_27927 ?auto_27930 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27917 ?auto_27921 ?auto_27930 ?auto_27914 )
      ( MAKE-2CRATE ?auto_27926 ?auto_27911 ?auto_27912 )
      ( MAKE-1CRATE-VERIFY ?auto_27911 ?auto_27912 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27931 - SURFACE
      ?auto_27932 - SURFACE
      ?auto_27933 - SURFACE
    )
    :vars
    (
      ?auto_27938 - HOIST
      ?auto_27949 - PLACE
      ?auto_27945 - PLACE
      ?auto_27936 - HOIST
      ?auto_27939 - SURFACE
      ?auto_27947 - PLACE
      ?auto_27950 - HOIST
      ?auto_27935 - SURFACE
      ?auto_27937 - SURFACE
      ?auto_27941 - PLACE
      ?auto_27944 - HOIST
      ?auto_27946 - SURFACE
      ?auto_27940 - SURFACE
      ?auto_27942 - SURFACE
      ?auto_27948 - SURFACE
      ?auto_27934 - TRUCK
      ?auto_27943 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27938 ?auto_27949 ) ( IS-CRATE ?auto_27933 ) ( not ( = ?auto_27932 ?auto_27933 ) ) ( not ( = ?auto_27931 ?auto_27932 ) ) ( not ( = ?auto_27931 ?auto_27933 ) ) ( not ( = ?auto_27945 ?auto_27949 ) ) ( HOIST-AT ?auto_27936 ?auto_27945 ) ( not ( = ?auto_27938 ?auto_27936 ) ) ( AVAILABLE ?auto_27936 ) ( SURFACE-AT ?auto_27933 ?auto_27945 ) ( ON ?auto_27933 ?auto_27939 ) ( CLEAR ?auto_27933 ) ( not ( = ?auto_27932 ?auto_27939 ) ) ( not ( = ?auto_27933 ?auto_27939 ) ) ( not ( = ?auto_27931 ?auto_27939 ) ) ( IS-CRATE ?auto_27932 ) ( not ( = ?auto_27947 ?auto_27949 ) ) ( not ( = ?auto_27945 ?auto_27947 ) ) ( HOIST-AT ?auto_27950 ?auto_27947 ) ( not ( = ?auto_27938 ?auto_27950 ) ) ( not ( = ?auto_27936 ?auto_27950 ) ) ( SURFACE-AT ?auto_27932 ?auto_27947 ) ( ON ?auto_27932 ?auto_27935 ) ( CLEAR ?auto_27932 ) ( not ( = ?auto_27932 ?auto_27935 ) ) ( not ( = ?auto_27933 ?auto_27935 ) ) ( not ( = ?auto_27931 ?auto_27935 ) ) ( not ( = ?auto_27939 ?auto_27935 ) ) ( IS-CRATE ?auto_27931 ) ( not ( = ?auto_27937 ?auto_27931 ) ) ( not ( = ?auto_27932 ?auto_27937 ) ) ( not ( = ?auto_27933 ?auto_27937 ) ) ( not ( = ?auto_27939 ?auto_27937 ) ) ( not ( = ?auto_27935 ?auto_27937 ) ) ( not ( = ?auto_27941 ?auto_27949 ) ) ( not ( = ?auto_27945 ?auto_27941 ) ) ( not ( = ?auto_27947 ?auto_27941 ) ) ( HOIST-AT ?auto_27944 ?auto_27941 ) ( not ( = ?auto_27938 ?auto_27944 ) ) ( not ( = ?auto_27936 ?auto_27944 ) ) ( not ( = ?auto_27950 ?auto_27944 ) ) ( SURFACE-AT ?auto_27931 ?auto_27941 ) ( ON ?auto_27931 ?auto_27946 ) ( CLEAR ?auto_27931 ) ( not ( = ?auto_27932 ?auto_27946 ) ) ( not ( = ?auto_27933 ?auto_27946 ) ) ( not ( = ?auto_27931 ?auto_27946 ) ) ( not ( = ?auto_27939 ?auto_27946 ) ) ( not ( = ?auto_27935 ?auto_27946 ) ) ( not ( = ?auto_27937 ?auto_27946 ) ) ( IS-CRATE ?auto_27937 ) ( not ( = ?auto_27940 ?auto_27937 ) ) ( not ( = ?auto_27932 ?auto_27940 ) ) ( not ( = ?auto_27933 ?auto_27940 ) ) ( not ( = ?auto_27931 ?auto_27940 ) ) ( not ( = ?auto_27939 ?auto_27940 ) ) ( not ( = ?auto_27935 ?auto_27940 ) ) ( not ( = ?auto_27946 ?auto_27940 ) ) ( AVAILABLE ?auto_27950 ) ( SURFACE-AT ?auto_27937 ?auto_27947 ) ( ON ?auto_27937 ?auto_27942 ) ( CLEAR ?auto_27937 ) ( not ( = ?auto_27932 ?auto_27942 ) ) ( not ( = ?auto_27933 ?auto_27942 ) ) ( not ( = ?auto_27931 ?auto_27942 ) ) ( not ( = ?auto_27939 ?auto_27942 ) ) ( not ( = ?auto_27935 ?auto_27942 ) ) ( not ( = ?auto_27937 ?auto_27942 ) ) ( not ( = ?auto_27946 ?auto_27942 ) ) ( not ( = ?auto_27940 ?auto_27942 ) ) ( SURFACE-AT ?auto_27948 ?auto_27949 ) ( CLEAR ?auto_27948 ) ( IS-CRATE ?auto_27940 ) ( not ( = ?auto_27948 ?auto_27940 ) ) ( not ( = ?auto_27932 ?auto_27948 ) ) ( not ( = ?auto_27933 ?auto_27948 ) ) ( not ( = ?auto_27931 ?auto_27948 ) ) ( not ( = ?auto_27939 ?auto_27948 ) ) ( not ( = ?auto_27935 ?auto_27948 ) ) ( not ( = ?auto_27937 ?auto_27948 ) ) ( not ( = ?auto_27946 ?auto_27948 ) ) ( not ( = ?auto_27942 ?auto_27948 ) ) ( AVAILABLE ?auto_27938 ) ( TRUCK-AT ?auto_27934 ?auto_27941 ) ( AVAILABLE ?auto_27944 ) ( SURFACE-AT ?auto_27940 ?auto_27941 ) ( ON ?auto_27940 ?auto_27943 ) ( CLEAR ?auto_27940 ) ( not ( = ?auto_27932 ?auto_27943 ) ) ( not ( = ?auto_27933 ?auto_27943 ) ) ( not ( = ?auto_27931 ?auto_27943 ) ) ( not ( = ?auto_27939 ?auto_27943 ) ) ( not ( = ?auto_27935 ?auto_27943 ) ) ( not ( = ?auto_27937 ?auto_27943 ) ) ( not ( = ?auto_27946 ?auto_27943 ) ) ( not ( = ?auto_27940 ?auto_27943 ) ) ( not ( = ?auto_27942 ?auto_27943 ) ) ( not ( = ?auto_27948 ?auto_27943 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27932 ?auto_27933 )
      ( MAKE-2CRATE-VERIFY ?auto_27931 ?auto_27932 ?auto_27933 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27951 - SURFACE
      ?auto_27952 - SURFACE
      ?auto_27953 - SURFACE
      ?auto_27954 - SURFACE
    )
    :vars
    (
      ?auto_27955 - HOIST
      ?auto_27959 - PLACE
      ?auto_27960 - PLACE
      ?auto_27957 - HOIST
      ?auto_27958 - SURFACE
      ?auto_27964 - PLACE
      ?auto_27963 - HOIST
      ?auto_27962 - SURFACE
      ?auto_27970 - PLACE
      ?auto_27961 - HOIST
      ?auto_27965 - SURFACE
      ?auto_27968 - SURFACE
      ?auto_27966 - SURFACE
      ?auto_27969 - SURFACE
      ?auto_27956 - TRUCK
      ?auto_27967 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27955 ?auto_27959 ) ( IS-CRATE ?auto_27954 ) ( not ( = ?auto_27953 ?auto_27954 ) ) ( not ( = ?auto_27952 ?auto_27953 ) ) ( not ( = ?auto_27952 ?auto_27954 ) ) ( not ( = ?auto_27960 ?auto_27959 ) ) ( HOIST-AT ?auto_27957 ?auto_27960 ) ( not ( = ?auto_27955 ?auto_27957 ) ) ( AVAILABLE ?auto_27957 ) ( SURFACE-AT ?auto_27954 ?auto_27960 ) ( ON ?auto_27954 ?auto_27958 ) ( CLEAR ?auto_27954 ) ( not ( = ?auto_27953 ?auto_27958 ) ) ( not ( = ?auto_27954 ?auto_27958 ) ) ( not ( = ?auto_27952 ?auto_27958 ) ) ( IS-CRATE ?auto_27953 ) ( not ( = ?auto_27964 ?auto_27959 ) ) ( not ( = ?auto_27960 ?auto_27964 ) ) ( HOIST-AT ?auto_27963 ?auto_27964 ) ( not ( = ?auto_27955 ?auto_27963 ) ) ( not ( = ?auto_27957 ?auto_27963 ) ) ( SURFACE-AT ?auto_27953 ?auto_27964 ) ( ON ?auto_27953 ?auto_27962 ) ( CLEAR ?auto_27953 ) ( not ( = ?auto_27953 ?auto_27962 ) ) ( not ( = ?auto_27954 ?auto_27962 ) ) ( not ( = ?auto_27952 ?auto_27962 ) ) ( not ( = ?auto_27958 ?auto_27962 ) ) ( IS-CRATE ?auto_27952 ) ( not ( = ?auto_27951 ?auto_27952 ) ) ( not ( = ?auto_27953 ?auto_27951 ) ) ( not ( = ?auto_27954 ?auto_27951 ) ) ( not ( = ?auto_27958 ?auto_27951 ) ) ( not ( = ?auto_27962 ?auto_27951 ) ) ( not ( = ?auto_27970 ?auto_27959 ) ) ( not ( = ?auto_27960 ?auto_27970 ) ) ( not ( = ?auto_27964 ?auto_27970 ) ) ( HOIST-AT ?auto_27961 ?auto_27970 ) ( not ( = ?auto_27955 ?auto_27961 ) ) ( not ( = ?auto_27957 ?auto_27961 ) ) ( not ( = ?auto_27963 ?auto_27961 ) ) ( SURFACE-AT ?auto_27952 ?auto_27970 ) ( ON ?auto_27952 ?auto_27965 ) ( CLEAR ?auto_27952 ) ( not ( = ?auto_27953 ?auto_27965 ) ) ( not ( = ?auto_27954 ?auto_27965 ) ) ( not ( = ?auto_27952 ?auto_27965 ) ) ( not ( = ?auto_27958 ?auto_27965 ) ) ( not ( = ?auto_27962 ?auto_27965 ) ) ( not ( = ?auto_27951 ?auto_27965 ) ) ( IS-CRATE ?auto_27951 ) ( not ( = ?auto_27968 ?auto_27951 ) ) ( not ( = ?auto_27953 ?auto_27968 ) ) ( not ( = ?auto_27954 ?auto_27968 ) ) ( not ( = ?auto_27952 ?auto_27968 ) ) ( not ( = ?auto_27958 ?auto_27968 ) ) ( not ( = ?auto_27962 ?auto_27968 ) ) ( not ( = ?auto_27965 ?auto_27968 ) ) ( AVAILABLE ?auto_27963 ) ( SURFACE-AT ?auto_27951 ?auto_27964 ) ( ON ?auto_27951 ?auto_27966 ) ( CLEAR ?auto_27951 ) ( not ( = ?auto_27953 ?auto_27966 ) ) ( not ( = ?auto_27954 ?auto_27966 ) ) ( not ( = ?auto_27952 ?auto_27966 ) ) ( not ( = ?auto_27958 ?auto_27966 ) ) ( not ( = ?auto_27962 ?auto_27966 ) ) ( not ( = ?auto_27951 ?auto_27966 ) ) ( not ( = ?auto_27965 ?auto_27966 ) ) ( not ( = ?auto_27968 ?auto_27966 ) ) ( SURFACE-AT ?auto_27969 ?auto_27959 ) ( CLEAR ?auto_27969 ) ( IS-CRATE ?auto_27968 ) ( not ( = ?auto_27969 ?auto_27968 ) ) ( not ( = ?auto_27953 ?auto_27969 ) ) ( not ( = ?auto_27954 ?auto_27969 ) ) ( not ( = ?auto_27952 ?auto_27969 ) ) ( not ( = ?auto_27958 ?auto_27969 ) ) ( not ( = ?auto_27962 ?auto_27969 ) ) ( not ( = ?auto_27951 ?auto_27969 ) ) ( not ( = ?auto_27965 ?auto_27969 ) ) ( not ( = ?auto_27966 ?auto_27969 ) ) ( AVAILABLE ?auto_27955 ) ( TRUCK-AT ?auto_27956 ?auto_27970 ) ( AVAILABLE ?auto_27961 ) ( SURFACE-AT ?auto_27968 ?auto_27970 ) ( ON ?auto_27968 ?auto_27967 ) ( CLEAR ?auto_27968 ) ( not ( = ?auto_27953 ?auto_27967 ) ) ( not ( = ?auto_27954 ?auto_27967 ) ) ( not ( = ?auto_27952 ?auto_27967 ) ) ( not ( = ?auto_27958 ?auto_27967 ) ) ( not ( = ?auto_27962 ?auto_27967 ) ) ( not ( = ?auto_27951 ?auto_27967 ) ) ( not ( = ?auto_27965 ?auto_27967 ) ) ( not ( = ?auto_27968 ?auto_27967 ) ) ( not ( = ?auto_27966 ?auto_27967 ) ) ( not ( = ?auto_27969 ?auto_27967 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27952 ?auto_27953 ?auto_27954 )
      ( MAKE-3CRATE-VERIFY ?auto_27951 ?auto_27952 ?auto_27953 ?auto_27954 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27971 - SURFACE
      ?auto_27972 - SURFACE
      ?auto_27973 - SURFACE
      ?auto_27974 - SURFACE
      ?auto_27975 - SURFACE
    )
    :vars
    (
      ?auto_27976 - HOIST
      ?auto_27980 - PLACE
      ?auto_27981 - PLACE
      ?auto_27978 - HOIST
      ?auto_27979 - SURFACE
      ?auto_27985 - PLACE
      ?auto_27984 - HOIST
      ?auto_27983 - SURFACE
      ?auto_27990 - PLACE
      ?auto_27982 - HOIST
      ?auto_27986 - SURFACE
      ?auto_27987 - SURFACE
      ?auto_27989 - SURFACE
      ?auto_27977 - TRUCK
      ?auto_27988 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27976 ?auto_27980 ) ( IS-CRATE ?auto_27975 ) ( not ( = ?auto_27974 ?auto_27975 ) ) ( not ( = ?auto_27973 ?auto_27974 ) ) ( not ( = ?auto_27973 ?auto_27975 ) ) ( not ( = ?auto_27981 ?auto_27980 ) ) ( HOIST-AT ?auto_27978 ?auto_27981 ) ( not ( = ?auto_27976 ?auto_27978 ) ) ( AVAILABLE ?auto_27978 ) ( SURFACE-AT ?auto_27975 ?auto_27981 ) ( ON ?auto_27975 ?auto_27979 ) ( CLEAR ?auto_27975 ) ( not ( = ?auto_27974 ?auto_27979 ) ) ( not ( = ?auto_27975 ?auto_27979 ) ) ( not ( = ?auto_27973 ?auto_27979 ) ) ( IS-CRATE ?auto_27974 ) ( not ( = ?auto_27985 ?auto_27980 ) ) ( not ( = ?auto_27981 ?auto_27985 ) ) ( HOIST-AT ?auto_27984 ?auto_27985 ) ( not ( = ?auto_27976 ?auto_27984 ) ) ( not ( = ?auto_27978 ?auto_27984 ) ) ( SURFACE-AT ?auto_27974 ?auto_27985 ) ( ON ?auto_27974 ?auto_27983 ) ( CLEAR ?auto_27974 ) ( not ( = ?auto_27974 ?auto_27983 ) ) ( not ( = ?auto_27975 ?auto_27983 ) ) ( not ( = ?auto_27973 ?auto_27983 ) ) ( not ( = ?auto_27979 ?auto_27983 ) ) ( IS-CRATE ?auto_27973 ) ( not ( = ?auto_27972 ?auto_27973 ) ) ( not ( = ?auto_27974 ?auto_27972 ) ) ( not ( = ?auto_27975 ?auto_27972 ) ) ( not ( = ?auto_27979 ?auto_27972 ) ) ( not ( = ?auto_27983 ?auto_27972 ) ) ( not ( = ?auto_27990 ?auto_27980 ) ) ( not ( = ?auto_27981 ?auto_27990 ) ) ( not ( = ?auto_27985 ?auto_27990 ) ) ( HOIST-AT ?auto_27982 ?auto_27990 ) ( not ( = ?auto_27976 ?auto_27982 ) ) ( not ( = ?auto_27978 ?auto_27982 ) ) ( not ( = ?auto_27984 ?auto_27982 ) ) ( SURFACE-AT ?auto_27973 ?auto_27990 ) ( ON ?auto_27973 ?auto_27986 ) ( CLEAR ?auto_27973 ) ( not ( = ?auto_27974 ?auto_27986 ) ) ( not ( = ?auto_27975 ?auto_27986 ) ) ( not ( = ?auto_27973 ?auto_27986 ) ) ( not ( = ?auto_27979 ?auto_27986 ) ) ( not ( = ?auto_27983 ?auto_27986 ) ) ( not ( = ?auto_27972 ?auto_27986 ) ) ( IS-CRATE ?auto_27972 ) ( not ( = ?auto_27971 ?auto_27972 ) ) ( not ( = ?auto_27974 ?auto_27971 ) ) ( not ( = ?auto_27975 ?auto_27971 ) ) ( not ( = ?auto_27973 ?auto_27971 ) ) ( not ( = ?auto_27979 ?auto_27971 ) ) ( not ( = ?auto_27983 ?auto_27971 ) ) ( not ( = ?auto_27986 ?auto_27971 ) ) ( AVAILABLE ?auto_27984 ) ( SURFACE-AT ?auto_27972 ?auto_27985 ) ( ON ?auto_27972 ?auto_27987 ) ( CLEAR ?auto_27972 ) ( not ( = ?auto_27974 ?auto_27987 ) ) ( not ( = ?auto_27975 ?auto_27987 ) ) ( not ( = ?auto_27973 ?auto_27987 ) ) ( not ( = ?auto_27979 ?auto_27987 ) ) ( not ( = ?auto_27983 ?auto_27987 ) ) ( not ( = ?auto_27972 ?auto_27987 ) ) ( not ( = ?auto_27986 ?auto_27987 ) ) ( not ( = ?auto_27971 ?auto_27987 ) ) ( SURFACE-AT ?auto_27989 ?auto_27980 ) ( CLEAR ?auto_27989 ) ( IS-CRATE ?auto_27971 ) ( not ( = ?auto_27989 ?auto_27971 ) ) ( not ( = ?auto_27974 ?auto_27989 ) ) ( not ( = ?auto_27975 ?auto_27989 ) ) ( not ( = ?auto_27973 ?auto_27989 ) ) ( not ( = ?auto_27979 ?auto_27989 ) ) ( not ( = ?auto_27983 ?auto_27989 ) ) ( not ( = ?auto_27972 ?auto_27989 ) ) ( not ( = ?auto_27986 ?auto_27989 ) ) ( not ( = ?auto_27987 ?auto_27989 ) ) ( AVAILABLE ?auto_27976 ) ( TRUCK-AT ?auto_27977 ?auto_27990 ) ( AVAILABLE ?auto_27982 ) ( SURFACE-AT ?auto_27971 ?auto_27990 ) ( ON ?auto_27971 ?auto_27988 ) ( CLEAR ?auto_27971 ) ( not ( = ?auto_27974 ?auto_27988 ) ) ( not ( = ?auto_27975 ?auto_27988 ) ) ( not ( = ?auto_27973 ?auto_27988 ) ) ( not ( = ?auto_27979 ?auto_27988 ) ) ( not ( = ?auto_27983 ?auto_27988 ) ) ( not ( = ?auto_27972 ?auto_27988 ) ) ( not ( = ?auto_27986 ?auto_27988 ) ) ( not ( = ?auto_27971 ?auto_27988 ) ) ( not ( = ?auto_27987 ?auto_27988 ) ) ( not ( = ?auto_27989 ?auto_27988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27973 ?auto_27974 ?auto_27975 )
      ( MAKE-4CRATE-VERIFY ?auto_27971 ?auto_27972 ?auto_27973 ?auto_27974 ?auto_27975 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27991 - SURFACE
      ?auto_27992 - SURFACE
      ?auto_27993 - SURFACE
      ?auto_27994 - SURFACE
      ?auto_27995 - SURFACE
      ?auto_27996 - SURFACE
    )
    :vars
    (
      ?auto_27997 - HOIST
      ?auto_28001 - PLACE
      ?auto_28002 - PLACE
      ?auto_27999 - HOIST
      ?auto_28000 - SURFACE
      ?auto_28006 - PLACE
      ?auto_28005 - HOIST
      ?auto_28004 - SURFACE
      ?auto_28010 - PLACE
      ?auto_28003 - HOIST
      ?auto_28007 - SURFACE
      ?auto_28008 - SURFACE
      ?auto_27998 - TRUCK
      ?auto_28009 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27997 ?auto_28001 ) ( IS-CRATE ?auto_27996 ) ( not ( = ?auto_27995 ?auto_27996 ) ) ( not ( = ?auto_27994 ?auto_27995 ) ) ( not ( = ?auto_27994 ?auto_27996 ) ) ( not ( = ?auto_28002 ?auto_28001 ) ) ( HOIST-AT ?auto_27999 ?auto_28002 ) ( not ( = ?auto_27997 ?auto_27999 ) ) ( AVAILABLE ?auto_27999 ) ( SURFACE-AT ?auto_27996 ?auto_28002 ) ( ON ?auto_27996 ?auto_28000 ) ( CLEAR ?auto_27996 ) ( not ( = ?auto_27995 ?auto_28000 ) ) ( not ( = ?auto_27996 ?auto_28000 ) ) ( not ( = ?auto_27994 ?auto_28000 ) ) ( IS-CRATE ?auto_27995 ) ( not ( = ?auto_28006 ?auto_28001 ) ) ( not ( = ?auto_28002 ?auto_28006 ) ) ( HOIST-AT ?auto_28005 ?auto_28006 ) ( not ( = ?auto_27997 ?auto_28005 ) ) ( not ( = ?auto_27999 ?auto_28005 ) ) ( SURFACE-AT ?auto_27995 ?auto_28006 ) ( ON ?auto_27995 ?auto_28004 ) ( CLEAR ?auto_27995 ) ( not ( = ?auto_27995 ?auto_28004 ) ) ( not ( = ?auto_27996 ?auto_28004 ) ) ( not ( = ?auto_27994 ?auto_28004 ) ) ( not ( = ?auto_28000 ?auto_28004 ) ) ( IS-CRATE ?auto_27994 ) ( not ( = ?auto_27993 ?auto_27994 ) ) ( not ( = ?auto_27995 ?auto_27993 ) ) ( not ( = ?auto_27996 ?auto_27993 ) ) ( not ( = ?auto_28000 ?auto_27993 ) ) ( not ( = ?auto_28004 ?auto_27993 ) ) ( not ( = ?auto_28010 ?auto_28001 ) ) ( not ( = ?auto_28002 ?auto_28010 ) ) ( not ( = ?auto_28006 ?auto_28010 ) ) ( HOIST-AT ?auto_28003 ?auto_28010 ) ( not ( = ?auto_27997 ?auto_28003 ) ) ( not ( = ?auto_27999 ?auto_28003 ) ) ( not ( = ?auto_28005 ?auto_28003 ) ) ( SURFACE-AT ?auto_27994 ?auto_28010 ) ( ON ?auto_27994 ?auto_28007 ) ( CLEAR ?auto_27994 ) ( not ( = ?auto_27995 ?auto_28007 ) ) ( not ( = ?auto_27996 ?auto_28007 ) ) ( not ( = ?auto_27994 ?auto_28007 ) ) ( not ( = ?auto_28000 ?auto_28007 ) ) ( not ( = ?auto_28004 ?auto_28007 ) ) ( not ( = ?auto_27993 ?auto_28007 ) ) ( IS-CRATE ?auto_27993 ) ( not ( = ?auto_27992 ?auto_27993 ) ) ( not ( = ?auto_27995 ?auto_27992 ) ) ( not ( = ?auto_27996 ?auto_27992 ) ) ( not ( = ?auto_27994 ?auto_27992 ) ) ( not ( = ?auto_28000 ?auto_27992 ) ) ( not ( = ?auto_28004 ?auto_27992 ) ) ( not ( = ?auto_28007 ?auto_27992 ) ) ( AVAILABLE ?auto_28005 ) ( SURFACE-AT ?auto_27993 ?auto_28006 ) ( ON ?auto_27993 ?auto_28008 ) ( CLEAR ?auto_27993 ) ( not ( = ?auto_27995 ?auto_28008 ) ) ( not ( = ?auto_27996 ?auto_28008 ) ) ( not ( = ?auto_27994 ?auto_28008 ) ) ( not ( = ?auto_28000 ?auto_28008 ) ) ( not ( = ?auto_28004 ?auto_28008 ) ) ( not ( = ?auto_27993 ?auto_28008 ) ) ( not ( = ?auto_28007 ?auto_28008 ) ) ( not ( = ?auto_27992 ?auto_28008 ) ) ( SURFACE-AT ?auto_27991 ?auto_28001 ) ( CLEAR ?auto_27991 ) ( IS-CRATE ?auto_27992 ) ( not ( = ?auto_27991 ?auto_27992 ) ) ( not ( = ?auto_27995 ?auto_27991 ) ) ( not ( = ?auto_27996 ?auto_27991 ) ) ( not ( = ?auto_27994 ?auto_27991 ) ) ( not ( = ?auto_28000 ?auto_27991 ) ) ( not ( = ?auto_28004 ?auto_27991 ) ) ( not ( = ?auto_27993 ?auto_27991 ) ) ( not ( = ?auto_28007 ?auto_27991 ) ) ( not ( = ?auto_28008 ?auto_27991 ) ) ( AVAILABLE ?auto_27997 ) ( TRUCK-AT ?auto_27998 ?auto_28010 ) ( AVAILABLE ?auto_28003 ) ( SURFACE-AT ?auto_27992 ?auto_28010 ) ( ON ?auto_27992 ?auto_28009 ) ( CLEAR ?auto_27992 ) ( not ( = ?auto_27995 ?auto_28009 ) ) ( not ( = ?auto_27996 ?auto_28009 ) ) ( not ( = ?auto_27994 ?auto_28009 ) ) ( not ( = ?auto_28000 ?auto_28009 ) ) ( not ( = ?auto_28004 ?auto_28009 ) ) ( not ( = ?auto_27993 ?auto_28009 ) ) ( not ( = ?auto_28007 ?auto_28009 ) ) ( not ( = ?auto_27992 ?auto_28009 ) ) ( not ( = ?auto_28008 ?auto_28009 ) ) ( not ( = ?auto_27991 ?auto_28009 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27994 ?auto_27995 ?auto_27996 )
      ( MAKE-5CRATE-VERIFY ?auto_27991 ?auto_27992 ?auto_27993 ?auto_27994 ?auto_27995 ?auto_27996 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_28011 - SURFACE
      ?auto_28012 - SURFACE
    )
    :vars
    (
      ?auto_28013 - HOIST
      ?auto_28017 - PLACE
      ?auto_28023 - SURFACE
      ?auto_28018 - PLACE
      ?auto_28015 - HOIST
      ?auto_28016 - SURFACE
      ?auto_28022 - PLACE
      ?auto_28021 - HOIST
      ?auto_28020 - SURFACE
      ?auto_28028 - SURFACE
      ?auto_28030 - PLACE
      ?auto_28019 - HOIST
      ?auto_28024 - SURFACE
      ?auto_28027 - SURFACE
      ?auto_28025 - SURFACE
      ?auto_28029 - SURFACE
      ?auto_28026 - SURFACE
      ?auto_28014 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28013 ?auto_28017 ) ( IS-CRATE ?auto_28012 ) ( not ( = ?auto_28011 ?auto_28012 ) ) ( not ( = ?auto_28023 ?auto_28011 ) ) ( not ( = ?auto_28023 ?auto_28012 ) ) ( not ( = ?auto_28018 ?auto_28017 ) ) ( HOIST-AT ?auto_28015 ?auto_28018 ) ( not ( = ?auto_28013 ?auto_28015 ) ) ( AVAILABLE ?auto_28015 ) ( SURFACE-AT ?auto_28012 ?auto_28018 ) ( ON ?auto_28012 ?auto_28016 ) ( CLEAR ?auto_28012 ) ( not ( = ?auto_28011 ?auto_28016 ) ) ( not ( = ?auto_28012 ?auto_28016 ) ) ( not ( = ?auto_28023 ?auto_28016 ) ) ( IS-CRATE ?auto_28011 ) ( not ( = ?auto_28022 ?auto_28017 ) ) ( not ( = ?auto_28018 ?auto_28022 ) ) ( HOIST-AT ?auto_28021 ?auto_28022 ) ( not ( = ?auto_28013 ?auto_28021 ) ) ( not ( = ?auto_28015 ?auto_28021 ) ) ( SURFACE-AT ?auto_28011 ?auto_28022 ) ( ON ?auto_28011 ?auto_28020 ) ( CLEAR ?auto_28011 ) ( not ( = ?auto_28011 ?auto_28020 ) ) ( not ( = ?auto_28012 ?auto_28020 ) ) ( not ( = ?auto_28023 ?auto_28020 ) ) ( not ( = ?auto_28016 ?auto_28020 ) ) ( IS-CRATE ?auto_28023 ) ( not ( = ?auto_28028 ?auto_28023 ) ) ( not ( = ?auto_28011 ?auto_28028 ) ) ( not ( = ?auto_28012 ?auto_28028 ) ) ( not ( = ?auto_28016 ?auto_28028 ) ) ( not ( = ?auto_28020 ?auto_28028 ) ) ( not ( = ?auto_28030 ?auto_28017 ) ) ( not ( = ?auto_28018 ?auto_28030 ) ) ( not ( = ?auto_28022 ?auto_28030 ) ) ( HOIST-AT ?auto_28019 ?auto_28030 ) ( not ( = ?auto_28013 ?auto_28019 ) ) ( not ( = ?auto_28015 ?auto_28019 ) ) ( not ( = ?auto_28021 ?auto_28019 ) ) ( SURFACE-AT ?auto_28023 ?auto_28030 ) ( ON ?auto_28023 ?auto_28024 ) ( CLEAR ?auto_28023 ) ( not ( = ?auto_28011 ?auto_28024 ) ) ( not ( = ?auto_28012 ?auto_28024 ) ) ( not ( = ?auto_28023 ?auto_28024 ) ) ( not ( = ?auto_28016 ?auto_28024 ) ) ( not ( = ?auto_28020 ?auto_28024 ) ) ( not ( = ?auto_28028 ?auto_28024 ) ) ( IS-CRATE ?auto_28028 ) ( not ( = ?auto_28027 ?auto_28028 ) ) ( not ( = ?auto_28011 ?auto_28027 ) ) ( not ( = ?auto_28012 ?auto_28027 ) ) ( not ( = ?auto_28023 ?auto_28027 ) ) ( not ( = ?auto_28016 ?auto_28027 ) ) ( not ( = ?auto_28020 ?auto_28027 ) ) ( not ( = ?auto_28024 ?auto_28027 ) ) ( AVAILABLE ?auto_28021 ) ( SURFACE-AT ?auto_28028 ?auto_28022 ) ( ON ?auto_28028 ?auto_28025 ) ( CLEAR ?auto_28028 ) ( not ( = ?auto_28011 ?auto_28025 ) ) ( not ( = ?auto_28012 ?auto_28025 ) ) ( not ( = ?auto_28023 ?auto_28025 ) ) ( not ( = ?auto_28016 ?auto_28025 ) ) ( not ( = ?auto_28020 ?auto_28025 ) ) ( not ( = ?auto_28028 ?auto_28025 ) ) ( not ( = ?auto_28024 ?auto_28025 ) ) ( not ( = ?auto_28027 ?auto_28025 ) ) ( SURFACE-AT ?auto_28029 ?auto_28017 ) ( CLEAR ?auto_28029 ) ( IS-CRATE ?auto_28027 ) ( not ( = ?auto_28029 ?auto_28027 ) ) ( not ( = ?auto_28011 ?auto_28029 ) ) ( not ( = ?auto_28012 ?auto_28029 ) ) ( not ( = ?auto_28023 ?auto_28029 ) ) ( not ( = ?auto_28016 ?auto_28029 ) ) ( not ( = ?auto_28020 ?auto_28029 ) ) ( not ( = ?auto_28028 ?auto_28029 ) ) ( not ( = ?auto_28024 ?auto_28029 ) ) ( not ( = ?auto_28025 ?auto_28029 ) ) ( AVAILABLE ?auto_28013 ) ( AVAILABLE ?auto_28019 ) ( SURFACE-AT ?auto_28027 ?auto_28030 ) ( ON ?auto_28027 ?auto_28026 ) ( CLEAR ?auto_28027 ) ( not ( = ?auto_28011 ?auto_28026 ) ) ( not ( = ?auto_28012 ?auto_28026 ) ) ( not ( = ?auto_28023 ?auto_28026 ) ) ( not ( = ?auto_28016 ?auto_28026 ) ) ( not ( = ?auto_28020 ?auto_28026 ) ) ( not ( = ?auto_28028 ?auto_28026 ) ) ( not ( = ?auto_28024 ?auto_28026 ) ) ( not ( = ?auto_28027 ?auto_28026 ) ) ( not ( = ?auto_28025 ?auto_28026 ) ) ( not ( = ?auto_28029 ?auto_28026 ) ) ( TRUCK-AT ?auto_28014 ?auto_28017 ) )
    :subtasks
    ( ( !DRIVE ?auto_28014 ?auto_28017 ?auto_28030 )
      ( MAKE-2CRATE ?auto_28023 ?auto_28011 ?auto_28012 )
      ( MAKE-1CRATE-VERIFY ?auto_28011 ?auto_28012 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28031 - SURFACE
      ?auto_28032 - SURFACE
      ?auto_28033 - SURFACE
    )
    :vars
    (
      ?auto_28047 - HOIST
      ?auto_28035 - PLACE
      ?auto_28040 - PLACE
      ?auto_28034 - HOIST
      ?auto_28042 - SURFACE
      ?auto_28039 - PLACE
      ?auto_28044 - HOIST
      ?auto_28041 - SURFACE
      ?auto_28036 - SURFACE
      ?auto_28038 - PLACE
      ?auto_28043 - HOIST
      ?auto_28050 - SURFACE
      ?auto_28049 - SURFACE
      ?auto_28045 - SURFACE
      ?auto_28048 - SURFACE
      ?auto_28037 - SURFACE
      ?auto_28046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28047 ?auto_28035 ) ( IS-CRATE ?auto_28033 ) ( not ( = ?auto_28032 ?auto_28033 ) ) ( not ( = ?auto_28031 ?auto_28032 ) ) ( not ( = ?auto_28031 ?auto_28033 ) ) ( not ( = ?auto_28040 ?auto_28035 ) ) ( HOIST-AT ?auto_28034 ?auto_28040 ) ( not ( = ?auto_28047 ?auto_28034 ) ) ( AVAILABLE ?auto_28034 ) ( SURFACE-AT ?auto_28033 ?auto_28040 ) ( ON ?auto_28033 ?auto_28042 ) ( CLEAR ?auto_28033 ) ( not ( = ?auto_28032 ?auto_28042 ) ) ( not ( = ?auto_28033 ?auto_28042 ) ) ( not ( = ?auto_28031 ?auto_28042 ) ) ( IS-CRATE ?auto_28032 ) ( not ( = ?auto_28039 ?auto_28035 ) ) ( not ( = ?auto_28040 ?auto_28039 ) ) ( HOIST-AT ?auto_28044 ?auto_28039 ) ( not ( = ?auto_28047 ?auto_28044 ) ) ( not ( = ?auto_28034 ?auto_28044 ) ) ( SURFACE-AT ?auto_28032 ?auto_28039 ) ( ON ?auto_28032 ?auto_28041 ) ( CLEAR ?auto_28032 ) ( not ( = ?auto_28032 ?auto_28041 ) ) ( not ( = ?auto_28033 ?auto_28041 ) ) ( not ( = ?auto_28031 ?auto_28041 ) ) ( not ( = ?auto_28042 ?auto_28041 ) ) ( IS-CRATE ?auto_28031 ) ( not ( = ?auto_28036 ?auto_28031 ) ) ( not ( = ?auto_28032 ?auto_28036 ) ) ( not ( = ?auto_28033 ?auto_28036 ) ) ( not ( = ?auto_28042 ?auto_28036 ) ) ( not ( = ?auto_28041 ?auto_28036 ) ) ( not ( = ?auto_28038 ?auto_28035 ) ) ( not ( = ?auto_28040 ?auto_28038 ) ) ( not ( = ?auto_28039 ?auto_28038 ) ) ( HOIST-AT ?auto_28043 ?auto_28038 ) ( not ( = ?auto_28047 ?auto_28043 ) ) ( not ( = ?auto_28034 ?auto_28043 ) ) ( not ( = ?auto_28044 ?auto_28043 ) ) ( SURFACE-AT ?auto_28031 ?auto_28038 ) ( ON ?auto_28031 ?auto_28050 ) ( CLEAR ?auto_28031 ) ( not ( = ?auto_28032 ?auto_28050 ) ) ( not ( = ?auto_28033 ?auto_28050 ) ) ( not ( = ?auto_28031 ?auto_28050 ) ) ( not ( = ?auto_28042 ?auto_28050 ) ) ( not ( = ?auto_28041 ?auto_28050 ) ) ( not ( = ?auto_28036 ?auto_28050 ) ) ( IS-CRATE ?auto_28036 ) ( not ( = ?auto_28049 ?auto_28036 ) ) ( not ( = ?auto_28032 ?auto_28049 ) ) ( not ( = ?auto_28033 ?auto_28049 ) ) ( not ( = ?auto_28031 ?auto_28049 ) ) ( not ( = ?auto_28042 ?auto_28049 ) ) ( not ( = ?auto_28041 ?auto_28049 ) ) ( not ( = ?auto_28050 ?auto_28049 ) ) ( AVAILABLE ?auto_28044 ) ( SURFACE-AT ?auto_28036 ?auto_28039 ) ( ON ?auto_28036 ?auto_28045 ) ( CLEAR ?auto_28036 ) ( not ( = ?auto_28032 ?auto_28045 ) ) ( not ( = ?auto_28033 ?auto_28045 ) ) ( not ( = ?auto_28031 ?auto_28045 ) ) ( not ( = ?auto_28042 ?auto_28045 ) ) ( not ( = ?auto_28041 ?auto_28045 ) ) ( not ( = ?auto_28036 ?auto_28045 ) ) ( not ( = ?auto_28050 ?auto_28045 ) ) ( not ( = ?auto_28049 ?auto_28045 ) ) ( SURFACE-AT ?auto_28048 ?auto_28035 ) ( CLEAR ?auto_28048 ) ( IS-CRATE ?auto_28049 ) ( not ( = ?auto_28048 ?auto_28049 ) ) ( not ( = ?auto_28032 ?auto_28048 ) ) ( not ( = ?auto_28033 ?auto_28048 ) ) ( not ( = ?auto_28031 ?auto_28048 ) ) ( not ( = ?auto_28042 ?auto_28048 ) ) ( not ( = ?auto_28041 ?auto_28048 ) ) ( not ( = ?auto_28036 ?auto_28048 ) ) ( not ( = ?auto_28050 ?auto_28048 ) ) ( not ( = ?auto_28045 ?auto_28048 ) ) ( AVAILABLE ?auto_28047 ) ( AVAILABLE ?auto_28043 ) ( SURFACE-AT ?auto_28049 ?auto_28038 ) ( ON ?auto_28049 ?auto_28037 ) ( CLEAR ?auto_28049 ) ( not ( = ?auto_28032 ?auto_28037 ) ) ( not ( = ?auto_28033 ?auto_28037 ) ) ( not ( = ?auto_28031 ?auto_28037 ) ) ( not ( = ?auto_28042 ?auto_28037 ) ) ( not ( = ?auto_28041 ?auto_28037 ) ) ( not ( = ?auto_28036 ?auto_28037 ) ) ( not ( = ?auto_28050 ?auto_28037 ) ) ( not ( = ?auto_28049 ?auto_28037 ) ) ( not ( = ?auto_28045 ?auto_28037 ) ) ( not ( = ?auto_28048 ?auto_28037 ) ) ( TRUCK-AT ?auto_28046 ?auto_28035 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28032 ?auto_28033 )
      ( MAKE-2CRATE-VERIFY ?auto_28031 ?auto_28032 ?auto_28033 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28051 - SURFACE
      ?auto_28052 - SURFACE
      ?auto_28053 - SURFACE
      ?auto_28054 - SURFACE
    )
    :vars
    (
      ?auto_28060 - HOIST
      ?auto_28066 - PLACE
      ?auto_28055 - PLACE
      ?auto_28065 - HOIST
      ?auto_28067 - SURFACE
      ?auto_28063 - PLACE
      ?auto_28062 - HOIST
      ?auto_28058 - SURFACE
      ?auto_28064 - PLACE
      ?auto_28061 - HOIST
      ?auto_28069 - SURFACE
      ?auto_28068 - SURFACE
      ?auto_28059 - SURFACE
      ?auto_28057 - SURFACE
      ?auto_28070 - SURFACE
      ?auto_28056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28060 ?auto_28066 ) ( IS-CRATE ?auto_28054 ) ( not ( = ?auto_28053 ?auto_28054 ) ) ( not ( = ?auto_28052 ?auto_28053 ) ) ( not ( = ?auto_28052 ?auto_28054 ) ) ( not ( = ?auto_28055 ?auto_28066 ) ) ( HOIST-AT ?auto_28065 ?auto_28055 ) ( not ( = ?auto_28060 ?auto_28065 ) ) ( AVAILABLE ?auto_28065 ) ( SURFACE-AT ?auto_28054 ?auto_28055 ) ( ON ?auto_28054 ?auto_28067 ) ( CLEAR ?auto_28054 ) ( not ( = ?auto_28053 ?auto_28067 ) ) ( not ( = ?auto_28054 ?auto_28067 ) ) ( not ( = ?auto_28052 ?auto_28067 ) ) ( IS-CRATE ?auto_28053 ) ( not ( = ?auto_28063 ?auto_28066 ) ) ( not ( = ?auto_28055 ?auto_28063 ) ) ( HOIST-AT ?auto_28062 ?auto_28063 ) ( not ( = ?auto_28060 ?auto_28062 ) ) ( not ( = ?auto_28065 ?auto_28062 ) ) ( SURFACE-AT ?auto_28053 ?auto_28063 ) ( ON ?auto_28053 ?auto_28058 ) ( CLEAR ?auto_28053 ) ( not ( = ?auto_28053 ?auto_28058 ) ) ( not ( = ?auto_28054 ?auto_28058 ) ) ( not ( = ?auto_28052 ?auto_28058 ) ) ( not ( = ?auto_28067 ?auto_28058 ) ) ( IS-CRATE ?auto_28052 ) ( not ( = ?auto_28051 ?auto_28052 ) ) ( not ( = ?auto_28053 ?auto_28051 ) ) ( not ( = ?auto_28054 ?auto_28051 ) ) ( not ( = ?auto_28067 ?auto_28051 ) ) ( not ( = ?auto_28058 ?auto_28051 ) ) ( not ( = ?auto_28064 ?auto_28066 ) ) ( not ( = ?auto_28055 ?auto_28064 ) ) ( not ( = ?auto_28063 ?auto_28064 ) ) ( HOIST-AT ?auto_28061 ?auto_28064 ) ( not ( = ?auto_28060 ?auto_28061 ) ) ( not ( = ?auto_28065 ?auto_28061 ) ) ( not ( = ?auto_28062 ?auto_28061 ) ) ( SURFACE-AT ?auto_28052 ?auto_28064 ) ( ON ?auto_28052 ?auto_28069 ) ( CLEAR ?auto_28052 ) ( not ( = ?auto_28053 ?auto_28069 ) ) ( not ( = ?auto_28054 ?auto_28069 ) ) ( not ( = ?auto_28052 ?auto_28069 ) ) ( not ( = ?auto_28067 ?auto_28069 ) ) ( not ( = ?auto_28058 ?auto_28069 ) ) ( not ( = ?auto_28051 ?auto_28069 ) ) ( IS-CRATE ?auto_28051 ) ( not ( = ?auto_28068 ?auto_28051 ) ) ( not ( = ?auto_28053 ?auto_28068 ) ) ( not ( = ?auto_28054 ?auto_28068 ) ) ( not ( = ?auto_28052 ?auto_28068 ) ) ( not ( = ?auto_28067 ?auto_28068 ) ) ( not ( = ?auto_28058 ?auto_28068 ) ) ( not ( = ?auto_28069 ?auto_28068 ) ) ( AVAILABLE ?auto_28062 ) ( SURFACE-AT ?auto_28051 ?auto_28063 ) ( ON ?auto_28051 ?auto_28059 ) ( CLEAR ?auto_28051 ) ( not ( = ?auto_28053 ?auto_28059 ) ) ( not ( = ?auto_28054 ?auto_28059 ) ) ( not ( = ?auto_28052 ?auto_28059 ) ) ( not ( = ?auto_28067 ?auto_28059 ) ) ( not ( = ?auto_28058 ?auto_28059 ) ) ( not ( = ?auto_28051 ?auto_28059 ) ) ( not ( = ?auto_28069 ?auto_28059 ) ) ( not ( = ?auto_28068 ?auto_28059 ) ) ( SURFACE-AT ?auto_28057 ?auto_28066 ) ( CLEAR ?auto_28057 ) ( IS-CRATE ?auto_28068 ) ( not ( = ?auto_28057 ?auto_28068 ) ) ( not ( = ?auto_28053 ?auto_28057 ) ) ( not ( = ?auto_28054 ?auto_28057 ) ) ( not ( = ?auto_28052 ?auto_28057 ) ) ( not ( = ?auto_28067 ?auto_28057 ) ) ( not ( = ?auto_28058 ?auto_28057 ) ) ( not ( = ?auto_28051 ?auto_28057 ) ) ( not ( = ?auto_28069 ?auto_28057 ) ) ( not ( = ?auto_28059 ?auto_28057 ) ) ( AVAILABLE ?auto_28060 ) ( AVAILABLE ?auto_28061 ) ( SURFACE-AT ?auto_28068 ?auto_28064 ) ( ON ?auto_28068 ?auto_28070 ) ( CLEAR ?auto_28068 ) ( not ( = ?auto_28053 ?auto_28070 ) ) ( not ( = ?auto_28054 ?auto_28070 ) ) ( not ( = ?auto_28052 ?auto_28070 ) ) ( not ( = ?auto_28067 ?auto_28070 ) ) ( not ( = ?auto_28058 ?auto_28070 ) ) ( not ( = ?auto_28051 ?auto_28070 ) ) ( not ( = ?auto_28069 ?auto_28070 ) ) ( not ( = ?auto_28068 ?auto_28070 ) ) ( not ( = ?auto_28059 ?auto_28070 ) ) ( not ( = ?auto_28057 ?auto_28070 ) ) ( TRUCK-AT ?auto_28056 ?auto_28066 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28052 ?auto_28053 ?auto_28054 )
      ( MAKE-3CRATE-VERIFY ?auto_28051 ?auto_28052 ?auto_28053 ?auto_28054 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28071 - SURFACE
      ?auto_28072 - SURFACE
      ?auto_28073 - SURFACE
      ?auto_28074 - SURFACE
      ?auto_28075 - SURFACE
    )
    :vars
    (
      ?auto_28081 - HOIST
      ?auto_28087 - PLACE
      ?auto_28076 - PLACE
      ?auto_28086 - HOIST
      ?auto_28088 - SURFACE
      ?auto_28084 - PLACE
      ?auto_28083 - HOIST
      ?auto_28079 - SURFACE
      ?auto_28085 - PLACE
      ?auto_28082 - HOIST
      ?auto_28089 - SURFACE
      ?auto_28080 - SURFACE
      ?auto_28078 - SURFACE
      ?auto_28090 - SURFACE
      ?auto_28077 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28081 ?auto_28087 ) ( IS-CRATE ?auto_28075 ) ( not ( = ?auto_28074 ?auto_28075 ) ) ( not ( = ?auto_28073 ?auto_28074 ) ) ( not ( = ?auto_28073 ?auto_28075 ) ) ( not ( = ?auto_28076 ?auto_28087 ) ) ( HOIST-AT ?auto_28086 ?auto_28076 ) ( not ( = ?auto_28081 ?auto_28086 ) ) ( AVAILABLE ?auto_28086 ) ( SURFACE-AT ?auto_28075 ?auto_28076 ) ( ON ?auto_28075 ?auto_28088 ) ( CLEAR ?auto_28075 ) ( not ( = ?auto_28074 ?auto_28088 ) ) ( not ( = ?auto_28075 ?auto_28088 ) ) ( not ( = ?auto_28073 ?auto_28088 ) ) ( IS-CRATE ?auto_28074 ) ( not ( = ?auto_28084 ?auto_28087 ) ) ( not ( = ?auto_28076 ?auto_28084 ) ) ( HOIST-AT ?auto_28083 ?auto_28084 ) ( not ( = ?auto_28081 ?auto_28083 ) ) ( not ( = ?auto_28086 ?auto_28083 ) ) ( SURFACE-AT ?auto_28074 ?auto_28084 ) ( ON ?auto_28074 ?auto_28079 ) ( CLEAR ?auto_28074 ) ( not ( = ?auto_28074 ?auto_28079 ) ) ( not ( = ?auto_28075 ?auto_28079 ) ) ( not ( = ?auto_28073 ?auto_28079 ) ) ( not ( = ?auto_28088 ?auto_28079 ) ) ( IS-CRATE ?auto_28073 ) ( not ( = ?auto_28072 ?auto_28073 ) ) ( not ( = ?auto_28074 ?auto_28072 ) ) ( not ( = ?auto_28075 ?auto_28072 ) ) ( not ( = ?auto_28088 ?auto_28072 ) ) ( not ( = ?auto_28079 ?auto_28072 ) ) ( not ( = ?auto_28085 ?auto_28087 ) ) ( not ( = ?auto_28076 ?auto_28085 ) ) ( not ( = ?auto_28084 ?auto_28085 ) ) ( HOIST-AT ?auto_28082 ?auto_28085 ) ( not ( = ?auto_28081 ?auto_28082 ) ) ( not ( = ?auto_28086 ?auto_28082 ) ) ( not ( = ?auto_28083 ?auto_28082 ) ) ( SURFACE-AT ?auto_28073 ?auto_28085 ) ( ON ?auto_28073 ?auto_28089 ) ( CLEAR ?auto_28073 ) ( not ( = ?auto_28074 ?auto_28089 ) ) ( not ( = ?auto_28075 ?auto_28089 ) ) ( not ( = ?auto_28073 ?auto_28089 ) ) ( not ( = ?auto_28088 ?auto_28089 ) ) ( not ( = ?auto_28079 ?auto_28089 ) ) ( not ( = ?auto_28072 ?auto_28089 ) ) ( IS-CRATE ?auto_28072 ) ( not ( = ?auto_28071 ?auto_28072 ) ) ( not ( = ?auto_28074 ?auto_28071 ) ) ( not ( = ?auto_28075 ?auto_28071 ) ) ( not ( = ?auto_28073 ?auto_28071 ) ) ( not ( = ?auto_28088 ?auto_28071 ) ) ( not ( = ?auto_28079 ?auto_28071 ) ) ( not ( = ?auto_28089 ?auto_28071 ) ) ( AVAILABLE ?auto_28083 ) ( SURFACE-AT ?auto_28072 ?auto_28084 ) ( ON ?auto_28072 ?auto_28080 ) ( CLEAR ?auto_28072 ) ( not ( = ?auto_28074 ?auto_28080 ) ) ( not ( = ?auto_28075 ?auto_28080 ) ) ( not ( = ?auto_28073 ?auto_28080 ) ) ( not ( = ?auto_28088 ?auto_28080 ) ) ( not ( = ?auto_28079 ?auto_28080 ) ) ( not ( = ?auto_28072 ?auto_28080 ) ) ( not ( = ?auto_28089 ?auto_28080 ) ) ( not ( = ?auto_28071 ?auto_28080 ) ) ( SURFACE-AT ?auto_28078 ?auto_28087 ) ( CLEAR ?auto_28078 ) ( IS-CRATE ?auto_28071 ) ( not ( = ?auto_28078 ?auto_28071 ) ) ( not ( = ?auto_28074 ?auto_28078 ) ) ( not ( = ?auto_28075 ?auto_28078 ) ) ( not ( = ?auto_28073 ?auto_28078 ) ) ( not ( = ?auto_28088 ?auto_28078 ) ) ( not ( = ?auto_28079 ?auto_28078 ) ) ( not ( = ?auto_28072 ?auto_28078 ) ) ( not ( = ?auto_28089 ?auto_28078 ) ) ( not ( = ?auto_28080 ?auto_28078 ) ) ( AVAILABLE ?auto_28081 ) ( AVAILABLE ?auto_28082 ) ( SURFACE-AT ?auto_28071 ?auto_28085 ) ( ON ?auto_28071 ?auto_28090 ) ( CLEAR ?auto_28071 ) ( not ( = ?auto_28074 ?auto_28090 ) ) ( not ( = ?auto_28075 ?auto_28090 ) ) ( not ( = ?auto_28073 ?auto_28090 ) ) ( not ( = ?auto_28088 ?auto_28090 ) ) ( not ( = ?auto_28079 ?auto_28090 ) ) ( not ( = ?auto_28072 ?auto_28090 ) ) ( not ( = ?auto_28089 ?auto_28090 ) ) ( not ( = ?auto_28071 ?auto_28090 ) ) ( not ( = ?auto_28080 ?auto_28090 ) ) ( not ( = ?auto_28078 ?auto_28090 ) ) ( TRUCK-AT ?auto_28077 ?auto_28087 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28073 ?auto_28074 ?auto_28075 )
      ( MAKE-4CRATE-VERIFY ?auto_28071 ?auto_28072 ?auto_28073 ?auto_28074 ?auto_28075 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_28091 - SURFACE
      ?auto_28092 - SURFACE
      ?auto_28093 - SURFACE
      ?auto_28094 - SURFACE
      ?auto_28095 - SURFACE
      ?auto_28096 - SURFACE
    )
    :vars
    (
      ?auto_28101 - HOIST
      ?auto_28107 - PLACE
      ?auto_28097 - PLACE
      ?auto_28106 - HOIST
      ?auto_28108 - SURFACE
      ?auto_28104 - PLACE
      ?auto_28103 - HOIST
      ?auto_28099 - SURFACE
      ?auto_28105 - PLACE
      ?auto_28102 - HOIST
      ?auto_28109 - SURFACE
      ?auto_28100 - SURFACE
      ?auto_28110 - SURFACE
      ?auto_28098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28101 ?auto_28107 ) ( IS-CRATE ?auto_28096 ) ( not ( = ?auto_28095 ?auto_28096 ) ) ( not ( = ?auto_28094 ?auto_28095 ) ) ( not ( = ?auto_28094 ?auto_28096 ) ) ( not ( = ?auto_28097 ?auto_28107 ) ) ( HOIST-AT ?auto_28106 ?auto_28097 ) ( not ( = ?auto_28101 ?auto_28106 ) ) ( AVAILABLE ?auto_28106 ) ( SURFACE-AT ?auto_28096 ?auto_28097 ) ( ON ?auto_28096 ?auto_28108 ) ( CLEAR ?auto_28096 ) ( not ( = ?auto_28095 ?auto_28108 ) ) ( not ( = ?auto_28096 ?auto_28108 ) ) ( not ( = ?auto_28094 ?auto_28108 ) ) ( IS-CRATE ?auto_28095 ) ( not ( = ?auto_28104 ?auto_28107 ) ) ( not ( = ?auto_28097 ?auto_28104 ) ) ( HOIST-AT ?auto_28103 ?auto_28104 ) ( not ( = ?auto_28101 ?auto_28103 ) ) ( not ( = ?auto_28106 ?auto_28103 ) ) ( SURFACE-AT ?auto_28095 ?auto_28104 ) ( ON ?auto_28095 ?auto_28099 ) ( CLEAR ?auto_28095 ) ( not ( = ?auto_28095 ?auto_28099 ) ) ( not ( = ?auto_28096 ?auto_28099 ) ) ( not ( = ?auto_28094 ?auto_28099 ) ) ( not ( = ?auto_28108 ?auto_28099 ) ) ( IS-CRATE ?auto_28094 ) ( not ( = ?auto_28093 ?auto_28094 ) ) ( not ( = ?auto_28095 ?auto_28093 ) ) ( not ( = ?auto_28096 ?auto_28093 ) ) ( not ( = ?auto_28108 ?auto_28093 ) ) ( not ( = ?auto_28099 ?auto_28093 ) ) ( not ( = ?auto_28105 ?auto_28107 ) ) ( not ( = ?auto_28097 ?auto_28105 ) ) ( not ( = ?auto_28104 ?auto_28105 ) ) ( HOIST-AT ?auto_28102 ?auto_28105 ) ( not ( = ?auto_28101 ?auto_28102 ) ) ( not ( = ?auto_28106 ?auto_28102 ) ) ( not ( = ?auto_28103 ?auto_28102 ) ) ( SURFACE-AT ?auto_28094 ?auto_28105 ) ( ON ?auto_28094 ?auto_28109 ) ( CLEAR ?auto_28094 ) ( not ( = ?auto_28095 ?auto_28109 ) ) ( not ( = ?auto_28096 ?auto_28109 ) ) ( not ( = ?auto_28094 ?auto_28109 ) ) ( not ( = ?auto_28108 ?auto_28109 ) ) ( not ( = ?auto_28099 ?auto_28109 ) ) ( not ( = ?auto_28093 ?auto_28109 ) ) ( IS-CRATE ?auto_28093 ) ( not ( = ?auto_28092 ?auto_28093 ) ) ( not ( = ?auto_28095 ?auto_28092 ) ) ( not ( = ?auto_28096 ?auto_28092 ) ) ( not ( = ?auto_28094 ?auto_28092 ) ) ( not ( = ?auto_28108 ?auto_28092 ) ) ( not ( = ?auto_28099 ?auto_28092 ) ) ( not ( = ?auto_28109 ?auto_28092 ) ) ( AVAILABLE ?auto_28103 ) ( SURFACE-AT ?auto_28093 ?auto_28104 ) ( ON ?auto_28093 ?auto_28100 ) ( CLEAR ?auto_28093 ) ( not ( = ?auto_28095 ?auto_28100 ) ) ( not ( = ?auto_28096 ?auto_28100 ) ) ( not ( = ?auto_28094 ?auto_28100 ) ) ( not ( = ?auto_28108 ?auto_28100 ) ) ( not ( = ?auto_28099 ?auto_28100 ) ) ( not ( = ?auto_28093 ?auto_28100 ) ) ( not ( = ?auto_28109 ?auto_28100 ) ) ( not ( = ?auto_28092 ?auto_28100 ) ) ( SURFACE-AT ?auto_28091 ?auto_28107 ) ( CLEAR ?auto_28091 ) ( IS-CRATE ?auto_28092 ) ( not ( = ?auto_28091 ?auto_28092 ) ) ( not ( = ?auto_28095 ?auto_28091 ) ) ( not ( = ?auto_28096 ?auto_28091 ) ) ( not ( = ?auto_28094 ?auto_28091 ) ) ( not ( = ?auto_28108 ?auto_28091 ) ) ( not ( = ?auto_28099 ?auto_28091 ) ) ( not ( = ?auto_28093 ?auto_28091 ) ) ( not ( = ?auto_28109 ?auto_28091 ) ) ( not ( = ?auto_28100 ?auto_28091 ) ) ( AVAILABLE ?auto_28101 ) ( AVAILABLE ?auto_28102 ) ( SURFACE-AT ?auto_28092 ?auto_28105 ) ( ON ?auto_28092 ?auto_28110 ) ( CLEAR ?auto_28092 ) ( not ( = ?auto_28095 ?auto_28110 ) ) ( not ( = ?auto_28096 ?auto_28110 ) ) ( not ( = ?auto_28094 ?auto_28110 ) ) ( not ( = ?auto_28108 ?auto_28110 ) ) ( not ( = ?auto_28099 ?auto_28110 ) ) ( not ( = ?auto_28093 ?auto_28110 ) ) ( not ( = ?auto_28109 ?auto_28110 ) ) ( not ( = ?auto_28092 ?auto_28110 ) ) ( not ( = ?auto_28100 ?auto_28110 ) ) ( not ( = ?auto_28091 ?auto_28110 ) ) ( TRUCK-AT ?auto_28098 ?auto_28107 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28094 ?auto_28095 ?auto_28096 )
      ( MAKE-5CRATE-VERIFY ?auto_28091 ?auto_28092 ?auto_28093 ?auto_28094 ?auto_28095 ?auto_28096 ) )
  )

)

