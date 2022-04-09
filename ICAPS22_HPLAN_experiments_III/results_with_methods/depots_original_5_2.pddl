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
      ?auto_23955 - SURFACE
      ?auto_23956 - SURFACE
    )
    :vars
    (
      ?auto_23957 - HOIST
      ?auto_23958 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23957 ?auto_23958 ) ( SURFACE-AT ?auto_23955 ?auto_23958 ) ( CLEAR ?auto_23955 ) ( LIFTING ?auto_23957 ?auto_23956 ) ( IS-CRATE ?auto_23956 ) ( not ( = ?auto_23955 ?auto_23956 ) ) )
    :subtasks
    ( ( !DROP ?auto_23957 ?auto_23956 ?auto_23955 ?auto_23958 )
      ( MAKE-1CRATE-VERIFY ?auto_23955 ?auto_23956 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23959 - SURFACE
      ?auto_23960 - SURFACE
    )
    :vars
    (
      ?auto_23961 - HOIST
      ?auto_23962 - PLACE
      ?auto_23963 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23961 ?auto_23962 ) ( SURFACE-AT ?auto_23959 ?auto_23962 ) ( CLEAR ?auto_23959 ) ( IS-CRATE ?auto_23960 ) ( not ( = ?auto_23959 ?auto_23960 ) ) ( TRUCK-AT ?auto_23963 ?auto_23962 ) ( AVAILABLE ?auto_23961 ) ( IN ?auto_23960 ?auto_23963 ) )
    :subtasks
    ( ( !UNLOAD ?auto_23961 ?auto_23960 ?auto_23963 ?auto_23962 )
      ( MAKE-1CRATE ?auto_23959 ?auto_23960 )
      ( MAKE-1CRATE-VERIFY ?auto_23959 ?auto_23960 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23964 - SURFACE
      ?auto_23965 - SURFACE
    )
    :vars
    (
      ?auto_23966 - HOIST
      ?auto_23967 - PLACE
      ?auto_23968 - TRUCK
      ?auto_23969 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23966 ?auto_23967 ) ( SURFACE-AT ?auto_23964 ?auto_23967 ) ( CLEAR ?auto_23964 ) ( IS-CRATE ?auto_23965 ) ( not ( = ?auto_23964 ?auto_23965 ) ) ( AVAILABLE ?auto_23966 ) ( IN ?auto_23965 ?auto_23968 ) ( TRUCK-AT ?auto_23968 ?auto_23969 ) ( not ( = ?auto_23969 ?auto_23967 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_23968 ?auto_23969 ?auto_23967 )
      ( MAKE-1CRATE ?auto_23964 ?auto_23965 )
      ( MAKE-1CRATE-VERIFY ?auto_23964 ?auto_23965 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23970 - SURFACE
      ?auto_23971 - SURFACE
    )
    :vars
    (
      ?auto_23974 - HOIST
      ?auto_23975 - PLACE
      ?auto_23972 - TRUCK
      ?auto_23973 - PLACE
      ?auto_23976 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_23974 ?auto_23975 ) ( SURFACE-AT ?auto_23970 ?auto_23975 ) ( CLEAR ?auto_23970 ) ( IS-CRATE ?auto_23971 ) ( not ( = ?auto_23970 ?auto_23971 ) ) ( AVAILABLE ?auto_23974 ) ( TRUCK-AT ?auto_23972 ?auto_23973 ) ( not ( = ?auto_23973 ?auto_23975 ) ) ( HOIST-AT ?auto_23976 ?auto_23973 ) ( LIFTING ?auto_23976 ?auto_23971 ) ( not ( = ?auto_23974 ?auto_23976 ) ) )
    :subtasks
    ( ( !LOAD ?auto_23976 ?auto_23971 ?auto_23972 ?auto_23973 )
      ( MAKE-1CRATE ?auto_23970 ?auto_23971 )
      ( MAKE-1CRATE-VERIFY ?auto_23970 ?auto_23971 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23977 - SURFACE
      ?auto_23978 - SURFACE
    )
    :vars
    (
      ?auto_23980 - HOIST
      ?auto_23983 - PLACE
      ?auto_23982 - TRUCK
      ?auto_23981 - PLACE
      ?auto_23979 - HOIST
      ?auto_23984 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_23980 ?auto_23983 ) ( SURFACE-AT ?auto_23977 ?auto_23983 ) ( CLEAR ?auto_23977 ) ( IS-CRATE ?auto_23978 ) ( not ( = ?auto_23977 ?auto_23978 ) ) ( AVAILABLE ?auto_23980 ) ( TRUCK-AT ?auto_23982 ?auto_23981 ) ( not ( = ?auto_23981 ?auto_23983 ) ) ( HOIST-AT ?auto_23979 ?auto_23981 ) ( not ( = ?auto_23980 ?auto_23979 ) ) ( AVAILABLE ?auto_23979 ) ( SURFACE-AT ?auto_23978 ?auto_23981 ) ( ON ?auto_23978 ?auto_23984 ) ( CLEAR ?auto_23978 ) ( not ( = ?auto_23977 ?auto_23984 ) ) ( not ( = ?auto_23978 ?auto_23984 ) ) )
    :subtasks
    ( ( !LIFT ?auto_23979 ?auto_23978 ?auto_23984 ?auto_23981 )
      ( MAKE-1CRATE ?auto_23977 ?auto_23978 )
      ( MAKE-1CRATE-VERIFY ?auto_23977 ?auto_23978 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23985 - SURFACE
      ?auto_23986 - SURFACE
    )
    :vars
    (
      ?auto_23991 - HOIST
      ?auto_23990 - PLACE
      ?auto_23989 - PLACE
      ?auto_23987 - HOIST
      ?auto_23988 - SURFACE
      ?auto_23992 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_23991 ?auto_23990 ) ( SURFACE-AT ?auto_23985 ?auto_23990 ) ( CLEAR ?auto_23985 ) ( IS-CRATE ?auto_23986 ) ( not ( = ?auto_23985 ?auto_23986 ) ) ( AVAILABLE ?auto_23991 ) ( not ( = ?auto_23989 ?auto_23990 ) ) ( HOIST-AT ?auto_23987 ?auto_23989 ) ( not ( = ?auto_23991 ?auto_23987 ) ) ( AVAILABLE ?auto_23987 ) ( SURFACE-AT ?auto_23986 ?auto_23989 ) ( ON ?auto_23986 ?auto_23988 ) ( CLEAR ?auto_23986 ) ( not ( = ?auto_23985 ?auto_23988 ) ) ( not ( = ?auto_23986 ?auto_23988 ) ) ( TRUCK-AT ?auto_23992 ?auto_23990 ) )
    :subtasks
    ( ( !DRIVE ?auto_23992 ?auto_23990 ?auto_23989 )
      ( MAKE-1CRATE ?auto_23985 ?auto_23986 )
      ( MAKE-1CRATE-VERIFY ?auto_23985 ?auto_23986 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_23998 - SURFACE
      ?auto_23999 - SURFACE
    )
    :vars
    (
      ?auto_24000 - HOIST
      ?auto_24001 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24000 ?auto_24001 ) ( SURFACE-AT ?auto_23998 ?auto_24001 ) ( CLEAR ?auto_23998 ) ( LIFTING ?auto_24000 ?auto_23999 ) ( IS-CRATE ?auto_23999 ) ( not ( = ?auto_23998 ?auto_23999 ) ) )
    :subtasks
    ( ( !DROP ?auto_24000 ?auto_23999 ?auto_23998 ?auto_24001 )
      ( MAKE-1CRATE-VERIFY ?auto_23998 ?auto_23999 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24002 - SURFACE
      ?auto_24003 - SURFACE
      ?auto_24004 - SURFACE
    )
    :vars
    (
      ?auto_24006 - HOIST
      ?auto_24005 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24006 ?auto_24005 ) ( SURFACE-AT ?auto_24003 ?auto_24005 ) ( CLEAR ?auto_24003 ) ( LIFTING ?auto_24006 ?auto_24004 ) ( IS-CRATE ?auto_24004 ) ( not ( = ?auto_24003 ?auto_24004 ) ) ( ON ?auto_24003 ?auto_24002 ) ( not ( = ?auto_24002 ?auto_24003 ) ) ( not ( = ?auto_24002 ?auto_24004 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24003 ?auto_24004 )
      ( MAKE-2CRATE-VERIFY ?auto_24002 ?auto_24003 ?auto_24004 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24007 - SURFACE
      ?auto_24008 - SURFACE
    )
    :vars
    (
      ?auto_24010 - HOIST
      ?auto_24009 - PLACE
      ?auto_24011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24010 ?auto_24009 ) ( SURFACE-AT ?auto_24007 ?auto_24009 ) ( CLEAR ?auto_24007 ) ( IS-CRATE ?auto_24008 ) ( not ( = ?auto_24007 ?auto_24008 ) ) ( TRUCK-AT ?auto_24011 ?auto_24009 ) ( AVAILABLE ?auto_24010 ) ( IN ?auto_24008 ?auto_24011 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24010 ?auto_24008 ?auto_24011 ?auto_24009 )
      ( MAKE-1CRATE ?auto_24007 ?auto_24008 )
      ( MAKE-1CRATE-VERIFY ?auto_24007 ?auto_24008 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24012 - SURFACE
      ?auto_24013 - SURFACE
      ?auto_24014 - SURFACE
    )
    :vars
    (
      ?auto_24015 - HOIST
      ?auto_24017 - PLACE
      ?auto_24016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24015 ?auto_24017 ) ( SURFACE-AT ?auto_24013 ?auto_24017 ) ( CLEAR ?auto_24013 ) ( IS-CRATE ?auto_24014 ) ( not ( = ?auto_24013 ?auto_24014 ) ) ( TRUCK-AT ?auto_24016 ?auto_24017 ) ( AVAILABLE ?auto_24015 ) ( IN ?auto_24014 ?auto_24016 ) ( ON ?auto_24013 ?auto_24012 ) ( not ( = ?auto_24012 ?auto_24013 ) ) ( not ( = ?auto_24012 ?auto_24014 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24013 ?auto_24014 )
      ( MAKE-2CRATE-VERIFY ?auto_24012 ?auto_24013 ?auto_24014 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24018 - SURFACE
      ?auto_24019 - SURFACE
    )
    :vars
    (
      ?auto_24020 - HOIST
      ?auto_24023 - PLACE
      ?auto_24021 - TRUCK
      ?auto_24022 - SURFACE
      ?auto_24024 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24020 ?auto_24023 ) ( SURFACE-AT ?auto_24018 ?auto_24023 ) ( CLEAR ?auto_24018 ) ( IS-CRATE ?auto_24019 ) ( not ( = ?auto_24018 ?auto_24019 ) ) ( AVAILABLE ?auto_24020 ) ( IN ?auto_24019 ?auto_24021 ) ( ON ?auto_24018 ?auto_24022 ) ( not ( = ?auto_24022 ?auto_24018 ) ) ( not ( = ?auto_24022 ?auto_24019 ) ) ( TRUCK-AT ?auto_24021 ?auto_24024 ) ( not ( = ?auto_24024 ?auto_24023 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24021 ?auto_24024 ?auto_24023 )
      ( MAKE-2CRATE ?auto_24022 ?auto_24018 ?auto_24019 )
      ( MAKE-1CRATE-VERIFY ?auto_24018 ?auto_24019 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24025 - SURFACE
      ?auto_24026 - SURFACE
      ?auto_24027 - SURFACE
    )
    :vars
    (
      ?auto_24028 - HOIST
      ?auto_24029 - PLACE
      ?auto_24030 - TRUCK
      ?auto_24031 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24028 ?auto_24029 ) ( SURFACE-AT ?auto_24026 ?auto_24029 ) ( CLEAR ?auto_24026 ) ( IS-CRATE ?auto_24027 ) ( not ( = ?auto_24026 ?auto_24027 ) ) ( AVAILABLE ?auto_24028 ) ( IN ?auto_24027 ?auto_24030 ) ( ON ?auto_24026 ?auto_24025 ) ( not ( = ?auto_24025 ?auto_24026 ) ) ( not ( = ?auto_24025 ?auto_24027 ) ) ( TRUCK-AT ?auto_24030 ?auto_24031 ) ( not ( = ?auto_24031 ?auto_24029 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24026 ?auto_24027 )
      ( MAKE-2CRATE-VERIFY ?auto_24025 ?auto_24026 ?auto_24027 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24032 - SURFACE
      ?auto_24033 - SURFACE
    )
    :vars
    (
      ?auto_24038 - HOIST
      ?auto_24035 - PLACE
      ?auto_24036 - SURFACE
      ?auto_24034 - TRUCK
      ?auto_24037 - PLACE
      ?auto_24039 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24038 ?auto_24035 ) ( SURFACE-AT ?auto_24032 ?auto_24035 ) ( CLEAR ?auto_24032 ) ( IS-CRATE ?auto_24033 ) ( not ( = ?auto_24032 ?auto_24033 ) ) ( AVAILABLE ?auto_24038 ) ( ON ?auto_24032 ?auto_24036 ) ( not ( = ?auto_24036 ?auto_24032 ) ) ( not ( = ?auto_24036 ?auto_24033 ) ) ( TRUCK-AT ?auto_24034 ?auto_24037 ) ( not ( = ?auto_24037 ?auto_24035 ) ) ( HOIST-AT ?auto_24039 ?auto_24037 ) ( LIFTING ?auto_24039 ?auto_24033 ) ( not ( = ?auto_24038 ?auto_24039 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24039 ?auto_24033 ?auto_24034 ?auto_24037 )
      ( MAKE-2CRATE ?auto_24036 ?auto_24032 ?auto_24033 )
      ( MAKE-1CRATE-VERIFY ?auto_24032 ?auto_24033 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24040 - SURFACE
      ?auto_24041 - SURFACE
      ?auto_24042 - SURFACE
    )
    :vars
    (
      ?auto_24044 - HOIST
      ?auto_24046 - PLACE
      ?auto_24043 - TRUCK
      ?auto_24047 - PLACE
      ?auto_24045 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24044 ?auto_24046 ) ( SURFACE-AT ?auto_24041 ?auto_24046 ) ( CLEAR ?auto_24041 ) ( IS-CRATE ?auto_24042 ) ( not ( = ?auto_24041 ?auto_24042 ) ) ( AVAILABLE ?auto_24044 ) ( ON ?auto_24041 ?auto_24040 ) ( not ( = ?auto_24040 ?auto_24041 ) ) ( not ( = ?auto_24040 ?auto_24042 ) ) ( TRUCK-AT ?auto_24043 ?auto_24047 ) ( not ( = ?auto_24047 ?auto_24046 ) ) ( HOIST-AT ?auto_24045 ?auto_24047 ) ( LIFTING ?auto_24045 ?auto_24042 ) ( not ( = ?auto_24044 ?auto_24045 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24041 ?auto_24042 )
      ( MAKE-2CRATE-VERIFY ?auto_24040 ?auto_24041 ?auto_24042 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24048 - SURFACE
      ?auto_24049 - SURFACE
    )
    :vars
    (
      ?auto_24050 - HOIST
      ?auto_24055 - PLACE
      ?auto_24054 - SURFACE
      ?auto_24051 - TRUCK
      ?auto_24052 - PLACE
      ?auto_24053 - HOIST
      ?auto_24056 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24050 ?auto_24055 ) ( SURFACE-AT ?auto_24048 ?auto_24055 ) ( CLEAR ?auto_24048 ) ( IS-CRATE ?auto_24049 ) ( not ( = ?auto_24048 ?auto_24049 ) ) ( AVAILABLE ?auto_24050 ) ( ON ?auto_24048 ?auto_24054 ) ( not ( = ?auto_24054 ?auto_24048 ) ) ( not ( = ?auto_24054 ?auto_24049 ) ) ( TRUCK-AT ?auto_24051 ?auto_24052 ) ( not ( = ?auto_24052 ?auto_24055 ) ) ( HOIST-AT ?auto_24053 ?auto_24052 ) ( not ( = ?auto_24050 ?auto_24053 ) ) ( AVAILABLE ?auto_24053 ) ( SURFACE-AT ?auto_24049 ?auto_24052 ) ( ON ?auto_24049 ?auto_24056 ) ( CLEAR ?auto_24049 ) ( not ( = ?auto_24048 ?auto_24056 ) ) ( not ( = ?auto_24049 ?auto_24056 ) ) ( not ( = ?auto_24054 ?auto_24056 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24053 ?auto_24049 ?auto_24056 ?auto_24052 )
      ( MAKE-2CRATE ?auto_24054 ?auto_24048 ?auto_24049 )
      ( MAKE-1CRATE-VERIFY ?auto_24048 ?auto_24049 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24057 - SURFACE
      ?auto_24058 - SURFACE
      ?auto_24059 - SURFACE
    )
    :vars
    (
      ?auto_24065 - HOIST
      ?auto_24064 - PLACE
      ?auto_24063 - TRUCK
      ?auto_24060 - PLACE
      ?auto_24061 - HOIST
      ?auto_24062 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24065 ?auto_24064 ) ( SURFACE-AT ?auto_24058 ?auto_24064 ) ( CLEAR ?auto_24058 ) ( IS-CRATE ?auto_24059 ) ( not ( = ?auto_24058 ?auto_24059 ) ) ( AVAILABLE ?auto_24065 ) ( ON ?auto_24058 ?auto_24057 ) ( not ( = ?auto_24057 ?auto_24058 ) ) ( not ( = ?auto_24057 ?auto_24059 ) ) ( TRUCK-AT ?auto_24063 ?auto_24060 ) ( not ( = ?auto_24060 ?auto_24064 ) ) ( HOIST-AT ?auto_24061 ?auto_24060 ) ( not ( = ?auto_24065 ?auto_24061 ) ) ( AVAILABLE ?auto_24061 ) ( SURFACE-AT ?auto_24059 ?auto_24060 ) ( ON ?auto_24059 ?auto_24062 ) ( CLEAR ?auto_24059 ) ( not ( = ?auto_24058 ?auto_24062 ) ) ( not ( = ?auto_24059 ?auto_24062 ) ) ( not ( = ?auto_24057 ?auto_24062 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24058 ?auto_24059 )
      ( MAKE-2CRATE-VERIFY ?auto_24057 ?auto_24058 ?auto_24059 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24066 - SURFACE
      ?auto_24067 - SURFACE
    )
    :vars
    (
      ?auto_24069 - HOIST
      ?auto_24071 - PLACE
      ?auto_24068 - SURFACE
      ?auto_24072 - PLACE
      ?auto_24074 - HOIST
      ?auto_24070 - SURFACE
      ?auto_24073 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24069 ?auto_24071 ) ( SURFACE-AT ?auto_24066 ?auto_24071 ) ( CLEAR ?auto_24066 ) ( IS-CRATE ?auto_24067 ) ( not ( = ?auto_24066 ?auto_24067 ) ) ( AVAILABLE ?auto_24069 ) ( ON ?auto_24066 ?auto_24068 ) ( not ( = ?auto_24068 ?auto_24066 ) ) ( not ( = ?auto_24068 ?auto_24067 ) ) ( not ( = ?auto_24072 ?auto_24071 ) ) ( HOIST-AT ?auto_24074 ?auto_24072 ) ( not ( = ?auto_24069 ?auto_24074 ) ) ( AVAILABLE ?auto_24074 ) ( SURFACE-AT ?auto_24067 ?auto_24072 ) ( ON ?auto_24067 ?auto_24070 ) ( CLEAR ?auto_24067 ) ( not ( = ?auto_24066 ?auto_24070 ) ) ( not ( = ?auto_24067 ?auto_24070 ) ) ( not ( = ?auto_24068 ?auto_24070 ) ) ( TRUCK-AT ?auto_24073 ?auto_24071 ) )
    :subtasks
    ( ( !DRIVE ?auto_24073 ?auto_24071 ?auto_24072 )
      ( MAKE-2CRATE ?auto_24068 ?auto_24066 ?auto_24067 )
      ( MAKE-1CRATE-VERIFY ?auto_24066 ?auto_24067 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24075 - SURFACE
      ?auto_24076 - SURFACE
      ?auto_24077 - SURFACE
    )
    :vars
    (
      ?auto_24078 - HOIST
      ?auto_24079 - PLACE
      ?auto_24081 - PLACE
      ?auto_24082 - HOIST
      ?auto_24083 - SURFACE
      ?auto_24080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24078 ?auto_24079 ) ( SURFACE-AT ?auto_24076 ?auto_24079 ) ( CLEAR ?auto_24076 ) ( IS-CRATE ?auto_24077 ) ( not ( = ?auto_24076 ?auto_24077 ) ) ( AVAILABLE ?auto_24078 ) ( ON ?auto_24076 ?auto_24075 ) ( not ( = ?auto_24075 ?auto_24076 ) ) ( not ( = ?auto_24075 ?auto_24077 ) ) ( not ( = ?auto_24081 ?auto_24079 ) ) ( HOIST-AT ?auto_24082 ?auto_24081 ) ( not ( = ?auto_24078 ?auto_24082 ) ) ( AVAILABLE ?auto_24082 ) ( SURFACE-AT ?auto_24077 ?auto_24081 ) ( ON ?auto_24077 ?auto_24083 ) ( CLEAR ?auto_24077 ) ( not ( = ?auto_24076 ?auto_24083 ) ) ( not ( = ?auto_24077 ?auto_24083 ) ) ( not ( = ?auto_24075 ?auto_24083 ) ) ( TRUCK-AT ?auto_24080 ?auto_24079 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24076 ?auto_24077 )
      ( MAKE-2CRATE-VERIFY ?auto_24075 ?auto_24076 ?auto_24077 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24084 - SURFACE
      ?auto_24085 - SURFACE
    )
    :vars
    (
      ?auto_24091 - HOIST
      ?auto_24089 - PLACE
      ?auto_24090 - SURFACE
      ?auto_24087 - PLACE
      ?auto_24086 - HOIST
      ?auto_24092 - SURFACE
      ?auto_24088 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24091 ?auto_24089 ) ( IS-CRATE ?auto_24085 ) ( not ( = ?auto_24084 ?auto_24085 ) ) ( not ( = ?auto_24090 ?auto_24084 ) ) ( not ( = ?auto_24090 ?auto_24085 ) ) ( not ( = ?auto_24087 ?auto_24089 ) ) ( HOIST-AT ?auto_24086 ?auto_24087 ) ( not ( = ?auto_24091 ?auto_24086 ) ) ( AVAILABLE ?auto_24086 ) ( SURFACE-AT ?auto_24085 ?auto_24087 ) ( ON ?auto_24085 ?auto_24092 ) ( CLEAR ?auto_24085 ) ( not ( = ?auto_24084 ?auto_24092 ) ) ( not ( = ?auto_24085 ?auto_24092 ) ) ( not ( = ?auto_24090 ?auto_24092 ) ) ( TRUCK-AT ?auto_24088 ?auto_24089 ) ( SURFACE-AT ?auto_24090 ?auto_24089 ) ( CLEAR ?auto_24090 ) ( LIFTING ?auto_24091 ?auto_24084 ) ( IS-CRATE ?auto_24084 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24090 ?auto_24084 )
      ( MAKE-2CRATE ?auto_24090 ?auto_24084 ?auto_24085 )
      ( MAKE-1CRATE-VERIFY ?auto_24084 ?auto_24085 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24093 - SURFACE
      ?auto_24094 - SURFACE
      ?auto_24095 - SURFACE
    )
    :vars
    (
      ?auto_24100 - HOIST
      ?auto_24096 - PLACE
      ?auto_24101 - PLACE
      ?auto_24097 - HOIST
      ?auto_24098 - SURFACE
      ?auto_24099 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24100 ?auto_24096 ) ( IS-CRATE ?auto_24095 ) ( not ( = ?auto_24094 ?auto_24095 ) ) ( not ( = ?auto_24093 ?auto_24094 ) ) ( not ( = ?auto_24093 ?auto_24095 ) ) ( not ( = ?auto_24101 ?auto_24096 ) ) ( HOIST-AT ?auto_24097 ?auto_24101 ) ( not ( = ?auto_24100 ?auto_24097 ) ) ( AVAILABLE ?auto_24097 ) ( SURFACE-AT ?auto_24095 ?auto_24101 ) ( ON ?auto_24095 ?auto_24098 ) ( CLEAR ?auto_24095 ) ( not ( = ?auto_24094 ?auto_24098 ) ) ( not ( = ?auto_24095 ?auto_24098 ) ) ( not ( = ?auto_24093 ?auto_24098 ) ) ( TRUCK-AT ?auto_24099 ?auto_24096 ) ( SURFACE-AT ?auto_24093 ?auto_24096 ) ( CLEAR ?auto_24093 ) ( LIFTING ?auto_24100 ?auto_24094 ) ( IS-CRATE ?auto_24094 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24094 ?auto_24095 )
      ( MAKE-2CRATE-VERIFY ?auto_24093 ?auto_24094 ?auto_24095 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24102 - SURFACE
      ?auto_24103 - SURFACE
    )
    :vars
    (
      ?auto_24108 - HOIST
      ?auto_24109 - PLACE
      ?auto_24106 - SURFACE
      ?auto_24104 - PLACE
      ?auto_24107 - HOIST
      ?auto_24105 - SURFACE
      ?auto_24110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24108 ?auto_24109 ) ( IS-CRATE ?auto_24103 ) ( not ( = ?auto_24102 ?auto_24103 ) ) ( not ( = ?auto_24106 ?auto_24102 ) ) ( not ( = ?auto_24106 ?auto_24103 ) ) ( not ( = ?auto_24104 ?auto_24109 ) ) ( HOIST-AT ?auto_24107 ?auto_24104 ) ( not ( = ?auto_24108 ?auto_24107 ) ) ( AVAILABLE ?auto_24107 ) ( SURFACE-AT ?auto_24103 ?auto_24104 ) ( ON ?auto_24103 ?auto_24105 ) ( CLEAR ?auto_24103 ) ( not ( = ?auto_24102 ?auto_24105 ) ) ( not ( = ?auto_24103 ?auto_24105 ) ) ( not ( = ?auto_24106 ?auto_24105 ) ) ( TRUCK-AT ?auto_24110 ?auto_24109 ) ( SURFACE-AT ?auto_24106 ?auto_24109 ) ( CLEAR ?auto_24106 ) ( IS-CRATE ?auto_24102 ) ( AVAILABLE ?auto_24108 ) ( IN ?auto_24102 ?auto_24110 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24108 ?auto_24102 ?auto_24110 ?auto_24109 )
      ( MAKE-2CRATE ?auto_24106 ?auto_24102 ?auto_24103 )
      ( MAKE-1CRATE-VERIFY ?auto_24102 ?auto_24103 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24111 - SURFACE
      ?auto_24112 - SURFACE
      ?auto_24113 - SURFACE
    )
    :vars
    (
      ?auto_24114 - HOIST
      ?auto_24117 - PLACE
      ?auto_24118 - PLACE
      ?auto_24115 - HOIST
      ?auto_24116 - SURFACE
      ?auto_24119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24114 ?auto_24117 ) ( IS-CRATE ?auto_24113 ) ( not ( = ?auto_24112 ?auto_24113 ) ) ( not ( = ?auto_24111 ?auto_24112 ) ) ( not ( = ?auto_24111 ?auto_24113 ) ) ( not ( = ?auto_24118 ?auto_24117 ) ) ( HOIST-AT ?auto_24115 ?auto_24118 ) ( not ( = ?auto_24114 ?auto_24115 ) ) ( AVAILABLE ?auto_24115 ) ( SURFACE-AT ?auto_24113 ?auto_24118 ) ( ON ?auto_24113 ?auto_24116 ) ( CLEAR ?auto_24113 ) ( not ( = ?auto_24112 ?auto_24116 ) ) ( not ( = ?auto_24113 ?auto_24116 ) ) ( not ( = ?auto_24111 ?auto_24116 ) ) ( TRUCK-AT ?auto_24119 ?auto_24117 ) ( SURFACE-AT ?auto_24111 ?auto_24117 ) ( CLEAR ?auto_24111 ) ( IS-CRATE ?auto_24112 ) ( AVAILABLE ?auto_24114 ) ( IN ?auto_24112 ?auto_24119 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24112 ?auto_24113 )
      ( MAKE-2CRATE-VERIFY ?auto_24111 ?auto_24112 ?auto_24113 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24120 - SURFACE
      ?auto_24121 - SURFACE
    )
    :vars
    (
      ?auto_24126 - HOIST
      ?auto_24123 - PLACE
      ?auto_24128 - SURFACE
      ?auto_24122 - PLACE
      ?auto_24125 - HOIST
      ?auto_24124 - SURFACE
      ?auto_24127 - TRUCK
      ?auto_24129 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24126 ?auto_24123 ) ( IS-CRATE ?auto_24121 ) ( not ( = ?auto_24120 ?auto_24121 ) ) ( not ( = ?auto_24128 ?auto_24120 ) ) ( not ( = ?auto_24128 ?auto_24121 ) ) ( not ( = ?auto_24122 ?auto_24123 ) ) ( HOIST-AT ?auto_24125 ?auto_24122 ) ( not ( = ?auto_24126 ?auto_24125 ) ) ( AVAILABLE ?auto_24125 ) ( SURFACE-AT ?auto_24121 ?auto_24122 ) ( ON ?auto_24121 ?auto_24124 ) ( CLEAR ?auto_24121 ) ( not ( = ?auto_24120 ?auto_24124 ) ) ( not ( = ?auto_24121 ?auto_24124 ) ) ( not ( = ?auto_24128 ?auto_24124 ) ) ( SURFACE-AT ?auto_24128 ?auto_24123 ) ( CLEAR ?auto_24128 ) ( IS-CRATE ?auto_24120 ) ( AVAILABLE ?auto_24126 ) ( IN ?auto_24120 ?auto_24127 ) ( TRUCK-AT ?auto_24127 ?auto_24129 ) ( not ( = ?auto_24129 ?auto_24123 ) ) ( not ( = ?auto_24122 ?auto_24129 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24127 ?auto_24129 ?auto_24123 )
      ( MAKE-2CRATE ?auto_24128 ?auto_24120 ?auto_24121 )
      ( MAKE-1CRATE-VERIFY ?auto_24120 ?auto_24121 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24130 - SURFACE
      ?auto_24131 - SURFACE
      ?auto_24132 - SURFACE
    )
    :vars
    (
      ?auto_24133 - HOIST
      ?auto_24139 - PLACE
      ?auto_24137 - PLACE
      ?auto_24134 - HOIST
      ?auto_24138 - SURFACE
      ?auto_24136 - TRUCK
      ?auto_24135 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24133 ?auto_24139 ) ( IS-CRATE ?auto_24132 ) ( not ( = ?auto_24131 ?auto_24132 ) ) ( not ( = ?auto_24130 ?auto_24131 ) ) ( not ( = ?auto_24130 ?auto_24132 ) ) ( not ( = ?auto_24137 ?auto_24139 ) ) ( HOIST-AT ?auto_24134 ?auto_24137 ) ( not ( = ?auto_24133 ?auto_24134 ) ) ( AVAILABLE ?auto_24134 ) ( SURFACE-AT ?auto_24132 ?auto_24137 ) ( ON ?auto_24132 ?auto_24138 ) ( CLEAR ?auto_24132 ) ( not ( = ?auto_24131 ?auto_24138 ) ) ( not ( = ?auto_24132 ?auto_24138 ) ) ( not ( = ?auto_24130 ?auto_24138 ) ) ( SURFACE-AT ?auto_24130 ?auto_24139 ) ( CLEAR ?auto_24130 ) ( IS-CRATE ?auto_24131 ) ( AVAILABLE ?auto_24133 ) ( IN ?auto_24131 ?auto_24136 ) ( TRUCK-AT ?auto_24136 ?auto_24135 ) ( not ( = ?auto_24135 ?auto_24139 ) ) ( not ( = ?auto_24137 ?auto_24135 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24131 ?auto_24132 )
      ( MAKE-2CRATE-VERIFY ?auto_24130 ?auto_24131 ?auto_24132 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24140 - SURFACE
      ?auto_24141 - SURFACE
    )
    :vars
    (
      ?auto_24149 - HOIST
      ?auto_24142 - PLACE
      ?auto_24144 - SURFACE
      ?auto_24148 - PLACE
      ?auto_24143 - HOIST
      ?auto_24146 - SURFACE
      ?auto_24147 - TRUCK
      ?auto_24145 - PLACE
      ?auto_24150 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24149 ?auto_24142 ) ( IS-CRATE ?auto_24141 ) ( not ( = ?auto_24140 ?auto_24141 ) ) ( not ( = ?auto_24144 ?auto_24140 ) ) ( not ( = ?auto_24144 ?auto_24141 ) ) ( not ( = ?auto_24148 ?auto_24142 ) ) ( HOIST-AT ?auto_24143 ?auto_24148 ) ( not ( = ?auto_24149 ?auto_24143 ) ) ( AVAILABLE ?auto_24143 ) ( SURFACE-AT ?auto_24141 ?auto_24148 ) ( ON ?auto_24141 ?auto_24146 ) ( CLEAR ?auto_24141 ) ( not ( = ?auto_24140 ?auto_24146 ) ) ( not ( = ?auto_24141 ?auto_24146 ) ) ( not ( = ?auto_24144 ?auto_24146 ) ) ( SURFACE-AT ?auto_24144 ?auto_24142 ) ( CLEAR ?auto_24144 ) ( IS-CRATE ?auto_24140 ) ( AVAILABLE ?auto_24149 ) ( TRUCK-AT ?auto_24147 ?auto_24145 ) ( not ( = ?auto_24145 ?auto_24142 ) ) ( not ( = ?auto_24148 ?auto_24145 ) ) ( HOIST-AT ?auto_24150 ?auto_24145 ) ( LIFTING ?auto_24150 ?auto_24140 ) ( not ( = ?auto_24149 ?auto_24150 ) ) ( not ( = ?auto_24143 ?auto_24150 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24150 ?auto_24140 ?auto_24147 ?auto_24145 )
      ( MAKE-2CRATE ?auto_24144 ?auto_24140 ?auto_24141 )
      ( MAKE-1CRATE-VERIFY ?auto_24140 ?auto_24141 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24151 - SURFACE
      ?auto_24152 - SURFACE
      ?auto_24153 - SURFACE
    )
    :vars
    (
      ?auto_24155 - HOIST
      ?auto_24158 - PLACE
      ?auto_24161 - PLACE
      ?auto_24159 - HOIST
      ?auto_24154 - SURFACE
      ?auto_24156 - TRUCK
      ?auto_24157 - PLACE
      ?auto_24160 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24155 ?auto_24158 ) ( IS-CRATE ?auto_24153 ) ( not ( = ?auto_24152 ?auto_24153 ) ) ( not ( = ?auto_24151 ?auto_24152 ) ) ( not ( = ?auto_24151 ?auto_24153 ) ) ( not ( = ?auto_24161 ?auto_24158 ) ) ( HOIST-AT ?auto_24159 ?auto_24161 ) ( not ( = ?auto_24155 ?auto_24159 ) ) ( AVAILABLE ?auto_24159 ) ( SURFACE-AT ?auto_24153 ?auto_24161 ) ( ON ?auto_24153 ?auto_24154 ) ( CLEAR ?auto_24153 ) ( not ( = ?auto_24152 ?auto_24154 ) ) ( not ( = ?auto_24153 ?auto_24154 ) ) ( not ( = ?auto_24151 ?auto_24154 ) ) ( SURFACE-AT ?auto_24151 ?auto_24158 ) ( CLEAR ?auto_24151 ) ( IS-CRATE ?auto_24152 ) ( AVAILABLE ?auto_24155 ) ( TRUCK-AT ?auto_24156 ?auto_24157 ) ( not ( = ?auto_24157 ?auto_24158 ) ) ( not ( = ?auto_24161 ?auto_24157 ) ) ( HOIST-AT ?auto_24160 ?auto_24157 ) ( LIFTING ?auto_24160 ?auto_24152 ) ( not ( = ?auto_24155 ?auto_24160 ) ) ( not ( = ?auto_24159 ?auto_24160 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24152 ?auto_24153 )
      ( MAKE-2CRATE-VERIFY ?auto_24151 ?auto_24152 ?auto_24153 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24162 - SURFACE
      ?auto_24163 - SURFACE
    )
    :vars
    (
      ?auto_24164 - HOIST
      ?auto_24168 - PLACE
      ?auto_24172 - SURFACE
      ?auto_24165 - PLACE
      ?auto_24169 - HOIST
      ?auto_24167 - SURFACE
      ?auto_24170 - TRUCK
      ?auto_24166 - PLACE
      ?auto_24171 - HOIST
      ?auto_24173 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24164 ?auto_24168 ) ( IS-CRATE ?auto_24163 ) ( not ( = ?auto_24162 ?auto_24163 ) ) ( not ( = ?auto_24172 ?auto_24162 ) ) ( not ( = ?auto_24172 ?auto_24163 ) ) ( not ( = ?auto_24165 ?auto_24168 ) ) ( HOIST-AT ?auto_24169 ?auto_24165 ) ( not ( = ?auto_24164 ?auto_24169 ) ) ( AVAILABLE ?auto_24169 ) ( SURFACE-AT ?auto_24163 ?auto_24165 ) ( ON ?auto_24163 ?auto_24167 ) ( CLEAR ?auto_24163 ) ( not ( = ?auto_24162 ?auto_24167 ) ) ( not ( = ?auto_24163 ?auto_24167 ) ) ( not ( = ?auto_24172 ?auto_24167 ) ) ( SURFACE-AT ?auto_24172 ?auto_24168 ) ( CLEAR ?auto_24172 ) ( IS-CRATE ?auto_24162 ) ( AVAILABLE ?auto_24164 ) ( TRUCK-AT ?auto_24170 ?auto_24166 ) ( not ( = ?auto_24166 ?auto_24168 ) ) ( not ( = ?auto_24165 ?auto_24166 ) ) ( HOIST-AT ?auto_24171 ?auto_24166 ) ( not ( = ?auto_24164 ?auto_24171 ) ) ( not ( = ?auto_24169 ?auto_24171 ) ) ( AVAILABLE ?auto_24171 ) ( SURFACE-AT ?auto_24162 ?auto_24166 ) ( ON ?auto_24162 ?auto_24173 ) ( CLEAR ?auto_24162 ) ( not ( = ?auto_24162 ?auto_24173 ) ) ( not ( = ?auto_24163 ?auto_24173 ) ) ( not ( = ?auto_24172 ?auto_24173 ) ) ( not ( = ?auto_24167 ?auto_24173 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24171 ?auto_24162 ?auto_24173 ?auto_24166 )
      ( MAKE-2CRATE ?auto_24172 ?auto_24162 ?auto_24163 )
      ( MAKE-1CRATE-VERIFY ?auto_24162 ?auto_24163 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24174 - SURFACE
      ?auto_24175 - SURFACE
      ?auto_24176 - SURFACE
    )
    :vars
    (
      ?auto_24178 - HOIST
      ?auto_24181 - PLACE
      ?auto_24177 - PLACE
      ?auto_24179 - HOIST
      ?auto_24180 - SURFACE
      ?auto_24183 - TRUCK
      ?auto_24182 - PLACE
      ?auto_24184 - HOIST
      ?auto_24185 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24178 ?auto_24181 ) ( IS-CRATE ?auto_24176 ) ( not ( = ?auto_24175 ?auto_24176 ) ) ( not ( = ?auto_24174 ?auto_24175 ) ) ( not ( = ?auto_24174 ?auto_24176 ) ) ( not ( = ?auto_24177 ?auto_24181 ) ) ( HOIST-AT ?auto_24179 ?auto_24177 ) ( not ( = ?auto_24178 ?auto_24179 ) ) ( AVAILABLE ?auto_24179 ) ( SURFACE-AT ?auto_24176 ?auto_24177 ) ( ON ?auto_24176 ?auto_24180 ) ( CLEAR ?auto_24176 ) ( not ( = ?auto_24175 ?auto_24180 ) ) ( not ( = ?auto_24176 ?auto_24180 ) ) ( not ( = ?auto_24174 ?auto_24180 ) ) ( SURFACE-AT ?auto_24174 ?auto_24181 ) ( CLEAR ?auto_24174 ) ( IS-CRATE ?auto_24175 ) ( AVAILABLE ?auto_24178 ) ( TRUCK-AT ?auto_24183 ?auto_24182 ) ( not ( = ?auto_24182 ?auto_24181 ) ) ( not ( = ?auto_24177 ?auto_24182 ) ) ( HOIST-AT ?auto_24184 ?auto_24182 ) ( not ( = ?auto_24178 ?auto_24184 ) ) ( not ( = ?auto_24179 ?auto_24184 ) ) ( AVAILABLE ?auto_24184 ) ( SURFACE-AT ?auto_24175 ?auto_24182 ) ( ON ?auto_24175 ?auto_24185 ) ( CLEAR ?auto_24175 ) ( not ( = ?auto_24175 ?auto_24185 ) ) ( not ( = ?auto_24176 ?auto_24185 ) ) ( not ( = ?auto_24174 ?auto_24185 ) ) ( not ( = ?auto_24180 ?auto_24185 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24175 ?auto_24176 )
      ( MAKE-2CRATE-VERIFY ?auto_24174 ?auto_24175 ?auto_24176 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24186 - SURFACE
      ?auto_24187 - SURFACE
    )
    :vars
    (
      ?auto_24195 - HOIST
      ?auto_24194 - PLACE
      ?auto_24197 - SURFACE
      ?auto_24193 - PLACE
      ?auto_24191 - HOIST
      ?auto_24188 - SURFACE
      ?auto_24192 - PLACE
      ?auto_24189 - HOIST
      ?auto_24196 - SURFACE
      ?auto_24190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24195 ?auto_24194 ) ( IS-CRATE ?auto_24187 ) ( not ( = ?auto_24186 ?auto_24187 ) ) ( not ( = ?auto_24197 ?auto_24186 ) ) ( not ( = ?auto_24197 ?auto_24187 ) ) ( not ( = ?auto_24193 ?auto_24194 ) ) ( HOIST-AT ?auto_24191 ?auto_24193 ) ( not ( = ?auto_24195 ?auto_24191 ) ) ( AVAILABLE ?auto_24191 ) ( SURFACE-AT ?auto_24187 ?auto_24193 ) ( ON ?auto_24187 ?auto_24188 ) ( CLEAR ?auto_24187 ) ( not ( = ?auto_24186 ?auto_24188 ) ) ( not ( = ?auto_24187 ?auto_24188 ) ) ( not ( = ?auto_24197 ?auto_24188 ) ) ( SURFACE-AT ?auto_24197 ?auto_24194 ) ( CLEAR ?auto_24197 ) ( IS-CRATE ?auto_24186 ) ( AVAILABLE ?auto_24195 ) ( not ( = ?auto_24192 ?auto_24194 ) ) ( not ( = ?auto_24193 ?auto_24192 ) ) ( HOIST-AT ?auto_24189 ?auto_24192 ) ( not ( = ?auto_24195 ?auto_24189 ) ) ( not ( = ?auto_24191 ?auto_24189 ) ) ( AVAILABLE ?auto_24189 ) ( SURFACE-AT ?auto_24186 ?auto_24192 ) ( ON ?auto_24186 ?auto_24196 ) ( CLEAR ?auto_24186 ) ( not ( = ?auto_24186 ?auto_24196 ) ) ( not ( = ?auto_24187 ?auto_24196 ) ) ( not ( = ?auto_24197 ?auto_24196 ) ) ( not ( = ?auto_24188 ?auto_24196 ) ) ( TRUCK-AT ?auto_24190 ?auto_24194 ) )
    :subtasks
    ( ( !DRIVE ?auto_24190 ?auto_24194 ?auto_24192 )
      ( MAKE-2CRATE ?auto_24197 ?auto_24186 ?auto_24187 )
      ( MAKE-1CRATE-VERIFY ?auto_24186 ?auto_24187 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24198 - SURFACE
      ?auto_24199 - SURFACE
      ?auto_24200 - SURFACE
    )
    :vars
    (
      ?auto_24203 - HOIST
      ?auto_24202 - PLACE
      ?auto_24201 - PLACE
      ?auto_24209 - HOIST
      ?auto_24208 - SURFACE
      ?auto_24207 - PLACE
      ?auto_24206 - HOIST
      ?auto_24204 - SURFACE
      ?auto_24205 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24203 ?auto_24202 ) ( IS-CRATE ?auto_24200 ) ( not ( = ?auto_24199 ?auto_24200 ) ) ( not ( = ?auto_24198 ?auto_24199 ) ) ( not ( = ?auto_24198 ?auto_24200 ) ) ( not ( = ?auto_24201 ?auto_24202 ) ) ( HOIST-AT ?auto_24209 ?auto_24201 ) ( not ( = ?auto_24203 ?auto_24209 ) ) ( AVAILABLE ?auto_24209 ) ( SURFACE-AT ?auto_24200 ?auto_24201 ) ( ON ?auto_24200 ?auto_24208 ) ( CLEAR ?auto_24200 ) ( not ( = ?auto_24199 ?auto_24208 ) ) ( not ( = ?auto_24200 ?auto_24208 ) ) ( not ( = ?auto_24198 ?auto_24208 ) ) ( SURFACE-AT ?auto_24198 ?auto_24202 ) ( CLEAR ?auto_24198 ) ( IS-CRATE ?auto_24199 ) ( AVAILABLE ?auto_24203 ) ( not ( = ?auto_24207 ?auto_24202 ) ) ( not ( = ?auto_24201 ?auto_24207 ) ) ( HOIST-AT ?auto_24206 ?auto_24207 ) ( not ( = ?auto_24203 ?auto_24206 ) ) ( not ( = ?auto_24209 ?auto_24206 ) ) ( AVAILABLE ?auto_24206 ) ( SURFACE-AT ?auto_24199 ?auto_24207 ) ( ON ?auto_24199 ?auto_24204 ) ( CLEAR ?auto_24199 ) ( not ( = ?auto_24199 ?auto_24204 ) ) ( not ( = ?auto_24200 ?auto_24204 ) ) ( not ( = ?auto_24198 ?auto_24204 ) ) ( not ( = ?auto_24208 ?auto_24204 ) ) ( TRUCK-AT ?auto_24205 ?auto_24202 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24199 ?auto_24200 )
      ( MAKE-2CRATE-VERIFY ?auto_24198 ?auto_24199 ?auto_24200 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24219 - SURFACE
      ?auto_24220 - SURFACE
    )
    :vars
    (
      ?auto_24221 - HOIST
      ?auto_24222 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24221 ?auto_24222 ) ( SURFACE-AT ?auto_24219 ?auto_24222 ) ( CLEAR ?auto_24219 ) ( LIFTING ?auto_24221 ?auto_24220 ) ( IS-CRATE ?auto_24220 ) ( not ( = ?auto_24219 ?auto_24220 ) ) )
    :subtasks
    ( ( !DROP ?auto_24221 ?auto_24220 ?auto_24219 ?auto_24222 )
      ( MAKE-1CRATE-VERIFY ?auto_24219 ?auto_24220 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24223 - SURFACE
      ?auto_24224 - SURFACE
      ?auto_24225 - SURFACE
    )
    :vars
    (
      ?auto_24226 - HOIST
      ?auto_24227 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24226 ?auto_24227 ) ( SURFACE-AT ?auto_24224 ?auto_24227 ) ( CLEAR ?auto_24224 ) ( LIFTING ?auto_24226 ?auto_24225 ) ( IS-CRATE ?auto_24225 ) ( not ( = ?auto_24224 ?auto_24225 ) ) ( ON ?auto_24224 ?auto_24223 ) ( not ( = ?auto_24223 ?auto_24224 ) ) ( not ( = ?auto_24223 ?auto_24225 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24224 ?auto_24225 )
      ( MAKE-2CRATE-VERIFY ?auto_24223 ?auto_24224 ?auto_24225 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24228 - SURFACE
      ?auto_24229 - SURFACE
      ?auto_24230 - SURFACE
      ?auto_24231 - SURFACE
    )
    :vars
    (
      ?auto_24232 - HOIST
      ?auto_24233 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24232 ?auto_24233 ) ( SURFACE-AT ?auto_24230 ?auto_24233 ) ( CLEAR ?auto_24230 ) ( LIFTING ?auto_24232 ?auto_24231 ) ( IS-CRATE ?auto_24231 ) ( not ( = ?auto_24230 ?auto_24231 ) ) ( ON ?auto_24229 ?auto_24228 ) ( ON ?auto_24230 ?auto_24229 ) ( not ( = ?auto_24228 ?auto_24229 ) ) ( not ( = ?auto_24228 ?auto_24230 ) ) ( not ( = ?auto_24228 ?auto_24231 ) ) ( not ( = ?auto_24229 ?auto_24230 ) ) ( not ( = ?auto_24229 ?auto_24231 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24230 ?auto_24231 )
      ( MAKE-3CRATE-VERIFY ?auto_24228 ?auto_24229 ?auto_24230 ?auto_24231 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24234 - SURFACE
      ?auto_24235 - SURFACE
    )
    :vars
    (
      ?auto_24236 - HOIST
      ?auto_24237 - PLACE
      ?auto_24238 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24236 ?auto_24237 ) ( SURFACE-AT ?auto_24234 ?auto_24237 ) ( CLEAR ?auto_24234 ) ( IS-CRATE ?auto_24235 ) ( not ( = ?auto_24234 ?auto_24235 ) ) ( TRUCK-AT ?auto_24238 ?auto_24237 ) ( AVAILABLE ?auto_24236 ) ( IN ?auto_24235 ?auto_24238 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24236 ?auto_24235 ?auto_24238 ?auto_24237 )
      ( MAKE-1CRATE ?auto_24234 ?auto_24235 )
      ( MAKE-1CRATE-VERIFY ?auto_24234 ?auto_24235 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24239 - SURFACE
      ?auto_24240 - SURFACE
      ?auto_24241 - SURFACE
    )
    :vars
    (
      ?auto_24244 - HOIST
      ?auto_24242 - PLACE
      ?auto_24243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24244 ?auto_24242 ) ( SURFACE-AT ?auto_24240 ?auto_24242 ) ( CLEAR ?auto_24240 ) ( IS-CRATE ?auto_24241 ) ( not ( = ?auto_24240 ?auto_24241 ) ) ( TRUCK-AT ?auto_24243 ?auto_24242 ) ( AVAILABLE ?auto_24244 ) ( IN ?auto_24241 ?auto_24243 ) ( ON ?auto_24240 ?auto_24239 ) ( not ( = ?auto_24239 ?auto_24240 ) ) ( not ( = ?auto_24239 ?auto_24241 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24240 ?auto_24241 )
      ( MAKE-2CRATE-VERIFY ?auto_24239 ?auto_24240 ?auto_24241 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24245 - SURFACE
      ?auto_24246 - SURFACE
      ?auto_24247 - SURFACE
      ?auto_24248 - SURFACE
    )
    :vars
    (
      ?auto_24249 - HOIST
      ?auto_24250 - PLACE
      ?auto_24251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24249 ?auto_24250 ) ( SURFACE-AT ?auto_24247 ?auto_24250 ) ( CLEAR ?auto_24247 ) ( IS-CRATE ?auto_24248 ) ( not ( = ?auto_24247 ?auto_24248 ) ) ( TRUCK-AT ?auto_24251 ?auto_24250 ) ( AVAILABLE ?auto_24249 ) ( IN ?auto_24248 ?auto_24251 ) ( ON ?auto_24247 ?auto_24246 ) ( not ( = ?auto_24246 ?auto_24247 ) ) ( not ( = ?auto_24246 ?auto_24248 ) ) ( ON ?auto_24246 ?auto_24245 ) ( not ( = ?auto_24245 ?auto_24246 ) ) ( not ( = ?auto_24245 ?auto_24247 ) ) ( not ( = ?auto_24245 ?auto_24248 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24246 ?auto_24247 ?auto_24248 )
      ( MAKE-3CRATE-VERIFY ?auto_24245 ?auto_24246 ?auto_24247 ?auto_24248 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24252 - SURFACE
      ?auto_24253 - SURFACE
    )
    :vars
    (
      ?auto_24254 - HOIST
      ?auto_24256 - PLACE
      ?auto_24257 - TRUCK
      ?auto_24255 - SURFACE
      ?auto_24258 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24254 ?auto_24256 ) ( SURFACE-AT ?auto_24252 ?auto_24256 ) ( CLEAR ?auto_24252 ) ( IS-CRATE ?auto_24253 ) ( not ( = ?auto_24252 ?auto_24253 ) ) ( AVAILABLE ?auto_24254 ) ( IN ?auto_24253 ?auto_24257 ) ( ON ?auto_24252 ?auto_24255 ) ( not ( = ?auto_24255 ?auto_24252 ) ) ( not ( = ?auto_24255 ?auto_24253 ) ) ( TRUCK-AT ?auto_24257 ?auto_24258 ) ( not ( = ?auto_24258 ?auto_24256 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24257 ?auto_24258 ?auto_24256 )
      ( MAKE-2CRATE ?auto_24255 ?auto_24252 ?auto_24253 )
      ( MAKE-1CRATE-VERIFY ?auto_24252 ?auto_24253 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24259 - SURFACE
      ?auto_24260 - SURFACE
      ?auto_24261 - SURFACE
    )
    :vars
    (
      ?auto_24264 - HOIST
      ?auto_24263 - PLACE
      ?auto_24262 - TRUCK
      ?auto_24265 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24264 ?auto_24263 ) ( SURFACE-AT ?auto_24260 ?auto_24263 ) ( CLEAR ?auto_24260 ) ( IS-CRATE ?auto_24261 ) ( not ( = ?auto_24260 ?auto_24261 ) ) ( AVAILABLE ?auto_24264 ) ( IN ?auto_24261 ?auto_24262 ) ( ON ?auto_24260 ?auto_24259 ) ( not ( = ?auto_24259 ?auto_24260 ) ) ( not ( = ?auto_24259 ?auto_24261 ) ) ( TRUCK-AT ?auto_24262 ?auto_24265 ) ( not ( = ?auto_24265 ?auto_24263 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24260 ?auto_24261 )
      ( MAKE-2CRATE-VERIFY ?auto_24259 ?auto_24260 ?auto_24261 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24266 - SURFACE
      ?auto_24267 - SURFACE
      ?auto_24268 - SURFACE
      ?auto_24269 - SURFACE
    )
    :vars
    (
      ?auto_24271 - HOIST
      ?auto_24270 - PLACE
      ?auto_24273 - TRUCK
      ?auto_24272 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24271 ?auto_24270 ) ( SURFACE-AT ?auto_24268 ?auto_24270 ) ( CLEAR ?auto_24268 ) ( IS-CRATE ?auto_24269 ) ( not ( = ?auto_24268 ?auto_24269 ) ) ( AVAILABLE ?auto_24271 ) ( IN ?auto_24269 ?auto_24273 ) ( ON ?auto_24268 ?auto_24267 ) ( not ( = ?auto_24267 ?auto_24268 ) ) ( not ( = ?auto_24267 ?auto_24269 ) ) ( TRUCK-AT ?auto_24273 ?auto_24272 ) ( not ( = ?auto_24272 ?auto_24270 ) ) ( ON ?auto_24267 ?auto_24266 ) ( not ( = ?auto_24266 ?auto_24267 ) ) ( not ( = ?auto_24266 ?auto_24268 ) ) ( not ( = ?auto_24266 ?auto_24269 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24267 ?auto_24268 ?auto_24269 )
      ( MAKE-3CRATE-VERIFY ?auto_24266 ?auto_24267 ?auto_24268 ?auto_24269 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24274 - SURFACE
      ?auto_24275 - SURFACE
    )
    :vars
    (
      ?auto_24278 - HOIST
      ?auto_24277 - PLACE
      ?auto_24276 - SURFACE
      ?auto_24280 - TRUCK
      ?auto_24279 - PLACE
      ?auto_24281 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24278 ?auto_24277 ) ( SURFACE-AT ?auto_24274 ?auto_24277 ) ( CLEAR ?auto_24274 ) ( IS-CRATE ?auto_24275 ) ( not ( = ?auto_24274 ?auto_24275 ) ) ( AVAILABLE ?auto_24278 ) ( ON ?auto_24274 ?auto_24276 ) ( not ( = ?auto_24276 ?auto_24274 ) ) ( not ( = ?auto_24276 ?auto_24275 ) ) ( TRUCK-AT ?auto_24280 ?auto_24279 ) ( not ( = ?auto_24279 ?auto_24277 ) ) ( HOIST-AT ?auto_24281 ?auto_24279 ) ( LIFTING ?auto_24281 ?auto_24275 ) ( not ( = ?auto_24278 ?auto_24281 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24281 ?auto_24275 ?auto_24280 ?auto_24279 )
      ( MAKE-2CRATE ?auto_24276 ?auto_24274 ?auto_24275 )
      ( MAKE-1CRATE-VERIFY ?auto_24274 ?auto_24275 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24282 - SURFACE
      ?auto_24283 - SURFACE
      ?auto_24284 - SURFACE
    )
    :vars
    (
      ?auto_24289 - HOIST
      ?auto_24285 - PLACE
      ?auto_24287 - TRUCK
      ?auto_24288 - PLACE
      ?auto_24286 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24289 ?auto_24285 ) ( SURFACE-AT ?auto_24283 ?auto_24285 ) ( CLEAR ?auto_24283 ) ( IS-CRATE ?auto_24284 ) ( not ( = ?auto_24283 ?auto_24284 ) ) ( AVAILABLE ?auto_24289 ) ( ON ?auto_24283 ?auto_24282 ) ( not ( = ?auto_24282 ?auto_24283 ) ) ( not ( = ?auto_24282 ?auto_24284 ) ) ( TRUCK-AT ?auto_24287 ?auto_24288 ) ( not ( = ?auto_24288 ?auto_24285 ) ) ( HOIST-AT ?auto_24286 ?auto_24288 ) ( LIFTING ?auto_24286 ?auto_24284 ) ( not ( = ?auto_24289 ?auto_24286 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24283 ?auto_24284 )
      ( MAKE-2CRATE-VERIFY ?auto_24282 ?auto_24283 ?auto_24284 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24290 - SURFACE
      ?auto_24291 - SURFACE
      ?auto_24292 - SURFACE
      ?auto_24293 - SURFACE
    )
    :vars
    (
      ?auto_24295 - HOIST
      ?auto_24296 - PLACE
      ?auto_24297 - TRUCK
      ?auto_24298 - PLACE
      ?auto_24294 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24295 ?auto_24296 ) ( SURFACE-AT ?auto_24292 ?auto_24296 ) ( CLEAR ?auto_24292 ) ( IS-CRATE ?auto_24293 ) ( not ( = ?auto_24292 ?auto_24293 ) ) ( AVAILABLE ?auto_24295 ) ( ON ?auto_24292 ?auto_24291 ) ( not ( = ?auto_24291 ?auto_24292 ) ) ( not ( = ?auto_24291 ?auto_24293 ) ) ( TRUCK-AT ?auto_24297 ?auto_24298 ) ( not ( = ?auto_24298 ?auto_24296 ) ) ( HOIST-AT ?auto_24294 ?auto_24298 ) ( LIFTING ?auto_24294 ?auto_24293 ) ( not ( = ?auto_24295 ?auto_24294 ) ) ( ON ?auto_24291 ?auto_24290 ) ( not ( = ?auto_24290 ?auto_24291 ) ) ( not ( = ?auto_24290 ?auto_24292 ) ) ( not ( = ?auto_24290 ?auto_24293 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24291 ?auto_24292 ?auto_24293 )
      ( MAKE-3CRATE-VERIFY ?auto_24290 ?auto_24291 ?auto_24292 ?auto_24293 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24299 - SURFACE
      ?auto_24300 - SURFACE
    )
    :vars
    (
      ?auto_24302 - HOIST
      ?auto_24303 - PLACE
      ?auto_24304 - SURFACE
      ?auto_24305 - TRUCK
      ?auto_24306 - PLACE
      ?auto_24301 - HOIST
      ?auto_24307 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24302 ?auto_24303 ) ( SURFACE-AT ?auto_24299 ?auto_24303 ) ( CLEAR ?auto_24299 ) ( IS-CRATE ?auto_24300 ) ( not ( = ?auto_24299 ?auto_24300 ) ) ( AVAILABLE ?auto_24302 ) ( ON ?auto_24299 ?auto_24304 ) ( not ( = ?auto_24304 ?auto_24299 ) ) ( not ( = ?auto_24304 ?auto_24300 ) ) ( TRUCK-AT ?auto_24305 ?auto_24306 ) ( not ( = ?auto_24306 ?auto_24303 ) ) ( HOIST-AT ?auto_24301 ?auto_24306 ) ( not ( = ?auto_24302 ?auto_24301 ) ) ( AVAILABLE ?auto_24301 ) ( SURFACE-AT ?auto_24300 ?auto_24306 ) ( ON ?auto_24300 ?auto_24307 ) ( CLEAR ?auto_24300 ) ( not ( = ?auto_24299 ?auto_24307 ) ) ( not ( = ?auto_24300 ?auto_24307 ) ) ( not ( = ?auto_24304 ?auto_24307 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24301 ?auto_24300 ?auto_24307 ?auto_24306 )
      ( MAKE-2CRATE ?auto_24304 ?auto_24299 ?auto_24300 )
      ( MAKE-1CRATE-VERIFY ?auto_24299 ?auto_24300 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24308 - SURFACE
      ?auto_24309 - SURFACE
      ?auto_24310 - SURFACE
    )
    :vars
    (
      ?auto_24312 - HOIST
      ?auto_24313 - PLACE
      ?auto_24314 - TRUCK
      ?auto_24311 - PLACE
      ?auto_24316 - HOIST
      ?auto_24315 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24312 ?auto_24313 ) ( SURFACE-AT ?auto_24309 ?auto_24313 ) ( CLEAR ?auto_24309 ) ( IS-CRATE ?auto_24310 ) ( not ( = ?auto_24309 ?auto_24310 ) ) ( AVAILABLE ?auto_24312 ) ( ON ?auto_24309 ?auto_24308 ) ( not ( = ?auto_24308 ?auto_24309 ) ) ( not ( = ?auto_24308 ?auto_24310 ) ) ( TRUCK-AT ?auto_24314 ?auto_24311 ) ( not ( = ?auto_24311 ?auto_24313 ) ) ( HOIST-AT ?auto_24316 ?auto_24311 ) ( not ( = ?auto_24312 ?auto_24316 ) ) ( AVAILABLE ?auto_24316 ) ( SURFACE-AT ?auto_24310 ?auto_24311 ) ( ON ?auto_24310 ?auto_24315 ) ( CLEAR ?auto_24310 ) ( not ( = ?auto_24309 ?auto_24315 ) ) ( not ( = ?auto_24310 ?auto_24315 ) ) ( not ( = ?auto_24308 ?auto_24315 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24309 ?auto_24310 )
      ( MAKE-2CRATE-VERIFY ?auto_24308 ?auto_24309 ?auto_24310 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24317 - SURFACE
      ?auto_24318 - SURFACE
      ?auto_24319 - SURFACE
      ?auto_24320 - SURFACE
    )
    :vars
    (
      ?auto_24321 - HOIST
      ?auto_24324 - PLACE
      ?auto_24322 - TRUCK
      ?auto_24323 - PLACE
      ?auto_24326 - HOIST
      ?auto_24325 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24321 ?auto_24324 ) ( SURFACE-AT ?auto_24319 ?auto_24324 ) ( CLEAR ?auto_24319 ) ( IS-CRATE ?auto_24320 ) ( not ( = ?auto_24319 ?auto_24320 ) ) ( AVAILABLE ?auto_24321 ) ( ON ?auto_24319 ?auto_24318 ) ( not ( = ?auto_24318 ?auto_24319 ) ) ( not ( = ?auto_24318 ?auto_24320 ) ) ( TRUCK-AT ?auto_24322 ?auto_24323 ) ( not ( = ?auto_24323 ?auto_24324 ) ) ( HOIST-AT ?auto_24326 ?auto_24323 ) ( not ( = ?auto_24321 ?auto_24326 ) ) ( AVAILABLE ?auto_24326 ) ( SURFACE-AT ?auto_24320 ?auto_24323 ) ( ON ?auto_24320 ?auto_24325 ) ( CLEAR ?auto_24320 ) ( not ( = ?auto_24319 ?auto_24325 ) ) ( not ( = ?auto_24320 ?auto_24325 ) ) ( not ( = ?auto_24318 ?auto_24325 ) ) ( ON ?auto_24318 ?auto_24317 ) ( not ( = ?auto_24317 ?auto_24318 ) ) ( not ( = ?auto_24317 ?auto_24319 ) ) ( not ( = ?auto_24317 ?auto_24320 ) ) ( not ( = ?auto_24317 ?auto_24325 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24318 ?auto_24319 ?auto_24320 )
      ( MAKE-3CRATE-VERIFY ?auto_24317 ?auto_24318 ?auto_24319 ?auto_24320 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24327 - SURFACE
      ?auto_24328 - SURFACE
    )
    :vars
    (
      ?auto_24329 - HOIST
      ?auto_24332 - PLACE
      ?auto_24335 - SURFACE
      ?auto_24331 - PLACE
      ?auto_24334 - HOIST
      ?auto_24333 - SURFACE
      ?auto_24330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24329 ?auto_24332 ) ( SURFACE-AT ?auto_24327 ?auto_24332 ) ( CLEAR ?auto_24327 ) ( IS-CRATE ?auto_24328 ) ( not ( = ?auto_24327 ?auto_24328 ) ) ( AVAILABLE ?auto_24329 ) ( ON ?auto_24327 ?auto_24335 ) ( not ( = ?auto_24335 ?auto_24327 ) ) ( not ( = ?auto_24335 ?auto_24328 ) ) ( not ( = ?auto_24331 ?auto_24332 ) ) ( HOIST-AT ?auto_24334 ?auto_24331 ) ( not ( = ?auto_24329 ?auto_24334 ) ) ( AVAILABLE ?auto_24334 ) ( SURFACE-AT ?auto_24328 ?auto_24331 ) ( ON ?auto_24328 ?auto_24333 ) ( CLEAR ?auto_24328 ) ( not ( = ?auto_24327 ?auto_24333 ) ) ( not ( = ?auto_24328 ?auto_24333 ) ) ( not ( = ?auto_24335 ?auto_24333 ) ) ( TRUCK-AT ?auto_24330 ?auto_24332 ) )
    :subtasks
    ( ( !DRIVE ?auto_24330 ?auto_24332 ?auto_24331 )
      ( MAKE-2CRATE ?auto_24335 ?auto_24327 ?auto_24328 )
      ( MAKE-1CRATE-VERIFY ?auto_24327 ?auto_24328 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24336 - SURFACE
      ?auto_24337 - SURFACE
      ?auto_24338 - SURFACE
    )
    :vars
    (
      ?auto_24341 - HOIST
      ?auto_24340 - PLACE
      ?auto_24339 - PLACE
      ?auto_24344 - HOIST
      ?auto_24342 - SURFACE
      ?auto_24343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24341 ?auto_24340 ) ( SURFACE-AT ?auto_24337 ?auto_24340 ) ( CLEAR ?auto_24337 ) ( IS-CRATE ?auto_24338 ) ( not ( = ?auto_24337 ?auto_24338 ) ) ( AVAILABLE ?auto_24341 ) ( ON ?auto_24337 ?auto_24336 ) ( not ( = ?auto_24336 ?auto_24337 ) ) ( not ( = ?auto_24336 ?auto_24338 ) ) ( not ( = ?auto_24339 ?auto_24340 ) ) ( HOIST-AT ?auto_24344 ?auto_24339 ) ( not ( = ?auto_24341 ?auto_24344 ) ) ( AVAILABLE ?auto_24344 ) ( SURFACE-AT ?auto_24338 ?auto_24339 ) ( ON ?auto_24338 ?auto_24342 ) ( CLEAR ?auto_24338 ) ( not ( = ?auto_24337 ?auto_24342 ) ) ( not ( = ?auto_24338 ?auto_24342 ) ) ( not ( = ?auto_24336 ?auto_24342 ) ) ( TRUCK-AT ?auto_24343 ?auto_24340 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24337 ?auto_24338 )
      ( MAKE-2CRATE-VERIFY ?auto_24336 ?auto_24337 ?auto_24338 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24345 - SURFACE
      ?auto_24346 - SURFACE
      ?auto_24347 - SURFACE
      ?auto_24348 - SURFACE
    )
    :vars
    (
      ?auto_24351 - HOIST
      ?auto_24352 - PLACE
      ?auto_24354 - PLACE
      ?auto_24350 - HOIST
      ?auto_24349 - SURFACE
      ?auto_24353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24351 ?auto_24352 ) ( SURFACE-AT ?auto_24347 ?auto_24352 ) ( CLEAR ?auto_24347 ) ( IS-CRATE ?auto_24348 ) ( not ( = ?auto_24347 ?auto_24348 ) ) ( AVAILABLE ?auto_24351 ) ( ON ?auto_24347 ?auto_24346 ) ( not ( = ?auto_24346 ?auto_24347 ) ) ( not ( = ?auto_24346 ?auto_24348 ) ) ( not ( = ?auto_24354 ?auto_24352 ) ) ( HOIST-AT ?auto_24350 ?auto_24354 ) ( not ( = ?auto_24351 ?auto_24350 ) ) ( AVAILABLE ?auto_24350 ) ( SURFACE-AT ?auto_24348 ?auto_24354 ) ( ON ?auto_24348 ?auto_24349 ) ( CLEAR ?auto_24348 ) ( not ( = ?auto_24347 ?auto_24349 ) ) ( not ( = ?auto_24348 ?auto_24349 ) ) ( not ( = ?auto_24346 ?auto_24349 ) ) ( TRUCK-AT ?auto_24353 ?auto_24352 ) ( ON ?auto_24346 ?auto_24345 ) ( not ( = ?auto_24345 ?auto_24346 ) ) ( not ( = ?auto_24345 ?auto_24347 ) ) ( not ( = ?auto_24345 ?auto_24348 ) ) ( not ( = ?auto_24345 ?auto_24349 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24346 ?auto_24347 ?auto_24348 )
      ( MAKE-3CRATE-VERIFY ?auto_24345 ?auto_24346 ?auto_24347 ?auto_24348 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24355 - SURFACE
      ?auto_24356 - SURFACE
    )
    :vars
    (
      ?auto_24359 - HOIST
      ?auto_24361 - PLACE
      ?auto_24360 - SURFACE
      ?auto_24363 - PLACE
      ?auto_24358 - HOIST
      ?auto_24357 - SURFACE
      ?auto_24362 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24359 ?auto_24361 ) ( IS-CRATE ?auto_24356 ) ( not ( = ?auto_24355 ?auto_24356 ) ) ( not ( = ?auto_24360 ?auto_24355 ) ) ( not ( = ?auto_24360 ?auto_24356 ) ) ( not ( = ?auto_24363 ?auto_24361 ) ) ( HOIST-AT ?auto_24358 ?auto_24363 ) ( not ( = ?auto_24359 ?auto_24358 ) ) ( AVAILABLE ?auto_24358 ) ( SURFACE-AT ?auto_24356 ?auto_24363 ) ( ON ?auto_24356 ?auto_24357 ) ( CLEAR ?auto_24356 ) ( not ( = ?auto_24355 ?auto_24357 ) ) ( not ( = ?auto_24356 ?auto_24357 ) ) ( not ( = ?auto_24360 ?auto_24357 ) ) ( TRUCK-AT ?auto_24362 ?auto_24361 ) ( SURFACE-AT ?auto_24360 ?auto_24361 ) ( CLEAR ?auto_24360 ) ( LIFTING ?auto_24359 ?auto_24355 ) ( IS-CRATE ?auto_24355 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24360 ?auto_24355 )
      ( MAKE-2CRATE ?auto_24360 ?auto_24355 ?auto_24356 )
      ( MAKE-1CRATE-VERIFY ?auto_24355 ?auto_24356 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24364 - SURFACE
      ?auto_24365 - SURFACE
      ?auto_24366 - SURFACE
    )
    :vars
    (
      ?auto_24368 - HOIST
      ?auto_24369 - PLACE
      ?auto_24367 - PLACE
      ?auto_24372 - HOIST
      ?auto_24370 - SURFACE
      ?auto_24371 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24368 ?auto_24369 ) ( IS-CRATE ?auto_24366 ) ( not ( = ?auto_24365 ?auto_24366 ) ) ( not ( = ?auto_24364 ?auto_24365 ) ) ( not ( = ?auto_24364 ?auto_24366 ) ) ( not ( = ?auto_24367 ?auto_24369 ) ) ( HOIST-AT ?auto_24372 ?auto_24367 ) ( not ( = ?auto_24368 ?auto_24372 ) ) ( AVAILABLE ?auto_24372 ) ( SURFACE-AT ?auto_24366 ?auto_24367 ) ( ON ?auto_24366 ?auto_24370 ) ( CLEAR ?auto_24366 ) ( not ( = ?auto_24365 ?auto_24370 ) ) ( not ( = ?auto_24366 ?auto_24370 ) ) ( not ( = ?auto_24364 ?auto_24370 ) ) ( TRUCK-AT ?auto_24371 ?auto_24369 ) ( SURFACE-AT ?auto_24364 ?auto_24369 ) ( CLEAR ?auto_24364 ) ( LIFTING ?auto_24368 ?auto_24365 ) ( IS-CRATE ?auto_24365 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24365 ?auto_24366 )
      ( MAKE-2CRATE-VERIFY ?auto_24364 ?auto_24365 ?auto_24366 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24373 - SURFACE
      ?auto_24374 - SURFACE
      ?auto_24375 - SURFACE
      ?auto_24376 - SURFACE
    )
    :vars
    (
      ?auto_24378 - HOIST
      ?auto_24381 - PLACE
      ?auto_24379 - PLACE
      ?auto_24382 - HOIST
      ?auto_24377 - SURFACE
      ?auto_24380 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24378 ?auto_24381 ) ( IS-CRATE ?auto_24376 ) ( not ( = ?auto_24375 ?auto_24376 ) ) ( not ( = ?auto_24374 ?auto_24375 ) ) ( not ( = ?auto_24374 ?auto_24376 ) ) ( not ( = ?auto_24379 ?auto_24381 ) ) ( HOIST-AT ?auto_24382 ?auto_24379 ) ( not ( = ?auto_24378 ?auto_24382 ) ) ( AVAILABLE ?auto_24382 ) ( SURFACE-AT ?auto_24376 ?auto_24379 ) ( ON ?auto_24376 ?auto_24377 ) ( CLEAR ?auto_24376 ) ( not ( = ?auto_24375 ?auto_24377 ) ) ( not ( = ?auto_24376 ?auto_24377 ) ) ( not ( = ?auto_24374 ?auto_24377 ) ) ( TRUCK-AT ?auto_24380 ?auto_24381 ) ( SURFACE-AT ?auto_24374 ?auto_24381 ) ( CLEAR ?auto_24374 ) ( LIFTING ?auto_24378 ?auto_24375 ) ( IS-CRATE ?auto_24375 ) ( ON ?auto_24374 ?auto_24373 ) ( not ( = ?auto_24373 ?auto_24374 ) ) ( not ( = ?auto_24373 ?auto_24375 ) ) ( not ( = ?auto_24373 ?auto_24376 ) ) ( not ( = ?auto_24373 ?auto_24377 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24374 ?auto_24375 ?auto_24376 )
      ( MAKE-3CRATE-VERIFY ?auto_24373 ?auto_24374 ?auto_24375 ?auto_24376 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24383 - SURFACE
      ?auto_24384 - SURFACE
    )
    :vars
    (
      ?auto_24387 - HOIST
      ?auto_24390 - PLACE
      ?auto_24386 - SURFACE
      ?auto_24388 - PLACE
      ?auto_24391 - HOIST
      ?auto_24385 - SURFACE
      ?auto_24389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24387 ?auto_24390 ) ( IS-CRATE ?auto_24384 ) ( not ( = ?auto_24383 ?auto_24384 ) ) ( not ( = ?auto_24386 ?auto_24383 ) ) ( not ( = ?auto_24386 ?auto_24384 ) ) ( not ( = ?auto_24388 ?auto_24390 ) ) ( HOIST-AT ?auto_24391 ?auto_24388 ) ( not ( = ?auto_24387 ?auto_24391 ) ) ( AVAILABLE ?auto_24391 ) ( SURFACE-AT ?auto_24384 ?auto_24388 ) ( ON ?auto_24384 ?auto_24385 ) ( CLEAR ?auto_24384 ) ( not ( = ?auto_24383 ?auto_24385 ) ) ( not ( = ?auto_24384 ?auto_24385 ) ) ( not ( = ?auto_24386 ?auto_24385 ) ) ( TRUCK-AT ?auto_24389 ?auto_24390 ) ( SURFACE-AT ?auto_24386 ?auto_24390 ) ( CLEAR ?auto_24386 ) ( IS-CRATE ?auto_24383 ) ( AVAILABLE ?auto_24387 ) ( IN ?auto_24383 ?auto_24389 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24387 ?auto_24383 ?auto_24389 ?auto_24390 )
      ( MAKE-2CRATE ?auto_24386 ?auto_24383 ?auto_24384 )
      ( MAKE-1CRATE-VERIFY ?auto_24383 ?auto_24384 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24392 - SURFACE
      ?auto_24393 - SURFACE
      ?auto_24394 - SURFACE
    )
    :vars
    (
      ?auto_24395 - HOIST
      ?auto_24397 - PLACE
      ?auto_24399 - PLACE
      ?auto_24400 - HOIST
      ?auto_24398 - SURFACE
      ?auto_24396 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24395 ?auto_24397 ) ( IS-CRATE ?auto_24394 ) ( not ( = ?auto_24393 ?auto_24394 ) ) ( not ( = ?auto_24392 ?auto_24393 ) ) ( not ( = ?auto_24392 ?auto_24394 ) ) ( not ( = ?auto_24399 ?auto_24397 ) ) ( HOIST-AT ?auto_24400 ?auto_24399 ) ( not ( = ?auto_24395 ?auto_24400 ) ) ( AVAILABLE ?auto_24400 ) ( SURFACE-AT ?auto_24394 ?auto_24399 ) ( ON ?auto_24394 ?auto_24398 ) ( CLEAR ?auto_24394 ) ( not ( = ?auto_24393 ?auto_24398 ) ) ( not ( = ?auto_24394 ?auto_24398 ) ) ( not ( = ?auto_24392 ?auto_24398 ) ) ( TRUCK-AT ?auto_24396 ?auto_24397 ) ( SURFACE-AT ?auto_24392 ?auto_24397 ) ( CLEAR ?auto_24392 ) ( IS-CRATE ?auto_24393 ) ( AVAILABLE ?auto_24395 ) ( IN ?auto_24393 ?auto_24396 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24393 ?auto_24394 )
      ( MAKE-2CRATE-VERIFY ?auto_24392 ?auto_24393 ?auto_24394 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24401 - SURFACE
      ?auto_24402 - SURFACE
      ?auto_24403 - SURFACE
      ?auto_24404 - SURFACE
    )
    :vars
    (
      ?auto_24409 - HOIST
      ?auto_24405 - PLACE
      ?auto_24410 - PLACE
      ?auto_24406 - HOIST
      ?auto_24407 - SURFACE
      ?auto_24408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24409 ?auto_24405 ) ( IS-CRATE ?auto_24404 ) ( not ( = ?auto_24403 ?auto_24404 ) ) ( not ( = ?auto_24402 ?auto_24403 ) ) ( not ( = ?auto_24402 ?auto_24404 ) ) ( not ( = ?auto_24410 ?auto_24405 ) ) ( HOIST-AT ?auto_24406 ?auto_24410 ) ( not ( = ?auto_24409 ?auto_24406 ) ) ( AVAILABLE ?auto_24406 ) ( SURFACE-AT ?auto_24404 ?auto_24410 ) ( ON ?auto_24404 ?auto_24407 ) ( CLEAR ?auto_24404 ) ( not ( = ?auto_24403 ?auto_24407 ) ) ( not ( = ?auto_24404 ?auto_24407 ) ) ( not ( = ?auto_24402 ?auto_24407 ) ) ( TRUCK-AT ?auto_24408 ?auto_24405 ) ( SURFACE-AT ?auto_24402 ?auto_24405 ) ( CLEAR ?auto_24402 ) ( IS-CRATE ?auto_24403 ) ( AVAILABLE ?auto_24409 ) ( IN ?auto_24403 ?auto_24408 ) ( ON ?auto_24402 ?auto_24401 ) ( not ( = ?auto_24401 ?auto_24402 ) ) ( not ( = ?auto_24401 ?auto_24403 ) ) ( not ( = ?auto_24401 ?auto_24404 ) ) ( not ( = ?auto_24401 ?auto_24407 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24402 ?auto_24403 ?auto_24404 )
      ( MAKE-3CRATE-VERIFY ?auto_24401 ?auto_24402 ?auto_24403 ?auto_24404 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24411 - SURFACE
      ?auto_24412 - SURFACE
    )
    :vars
    (
      ?auto_24418 - HOIST
      ?auto_24414 - PLACE
      ?auto_24413 - SURFACE
      ?auto_24419 - PLACE
      ?auto_24415 - HOIST
      ?auto_24416 - SURFACE
      ?auto_24417 - TRUCK
      ?auto_24420 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24418 ?auto_24414 ) ( IS-CRATE ?auto_24412 ) ( not ( = ?auto_24411 ?auto_24412 ) ) ( not ( = ?auto_24413 ?auto_24411 ) ) ( not ( = ?auto_24413 ?auto_24412 ) ) ( not ( = ?auto_24419 ?auto_24414 ) ) ( HOIST-AT ?auto_24415 ?auto_24419 ) ( not ( = ?auto_24418 ?auto_24415 ) ) ( AVAILABLE ?auto_24415 ) ( SURFACE-AT ?auto_24412 ?auto_24419 ) ( ON ?auto_24412 ?auto_24416 ) ( CLEAR ?auto_24412 ) ( not ( = ?auto_24411 ?auto_24416 ) ) ( not ( = ?auto_24412 ?auto_24416 ) ) ( not ( = ?auto_24413 ?auto_24416 ) ) ( SURFACE-AT ?auto_24413 ?auto_24414 ) ( CLEAR ?auto_24413 ) ( IS-CRATE ?auto_24411 ) ( AVAILABLE ?auto_24418 ) ( IN ?auto_24411 ?auto_24417 ) ( TRUCK-AT ?auto_24417 ?auto_24420 ) ( not ( = ?auto_24420 ?auto_24414 ) ) ( not ( = ?auto_24419 ?auto_24420 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24417 ?auto_24420 ?auto_24414 )
      ( MAKE-2CRATE ?auto_24413 ?auto_24411 ?auto_24412 )
      ( MAKE-1CRATE-VERIFY ?auto_24411 ?auto_24412 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24421 - SURFACE
      ?auto_24422 - SURFACE
      ?auto_24423 - SURFACE
    )
    :vars
    (
      ?auto_24428 - HOIST
      ?auto_24427 - PLACE
      ?auto_24424 - PLACE
      ?auto_24426 - HOIST
      ?auto_24425 - SURFACE
      ?auto_24429 - TRUCK
      ?auto_24430 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24428 ?auto_24427 ) ( IS-CRATE ?auto_24423 ) ( not ( = ?auto_24422 ?auto_24423 ) ) ( not ( = ?auto_24421 ?auto_24422 ) ) ( not ( = ?auto_24421 ?auto_24423 ) ) ( not ( = ?auto_24424 ?auto_24427 ) ) ( HOIST-AT ?auto_24426 ?auto_24424 ) ( not ( = ?auto_24428 ?auto_24426 ) ) ( AVAILABLE ?auto_24426 ) ( SURFACE-AT ?auto_24423 ?auto_24424 ) ( ON ?auto_24423 ?auto_24425 ) ( CLEAR ?auto_24423 ) ( not ( = ?auto_24422 ?auto_24425 ) ) ( not ( = ?auto_24423 ?auto_24425 ) ) ( not ( = ?auto_24421 ?auto_24425 ) ) ( SURFACE-AT ?auto_24421 ?auto_24427 ) ( CLEAR ?auto_24421 ) ( IS-CRATE ?auto_24422 ) ( AVAILABLE ?auto_24428 ) ( IN ?auto_24422 ?auto_24429 ) ( TRUCK-AT ?auto_24429 ?auto_24430 ) ( not ( = ?auto_24430 ?auto_24427 ) ) ( not ( = ?auto_24424 ?auto_24430 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24422 ?auto_24423 )
      ( MAKE-2CRATE-VERIFY ?auto_24421 ?auto_24422 ?auto_24423 ) )
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
      ?auto_24436 - HOIST
      ?auto_24439 - PLACE
      ?auto_24440 - PLACE
      ?auto_24435 - HOIST
      ?auto_24437 - SURFACE
      ?auto_24441 - TRUCK
      ?auto_24438 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24436 ?auto_24439 ) ( IS-CRATE ?auto_24434 ) ( not ( = ?auto_24433 ?auto_24434 ) ) ( not ( = ?auto_24432 ?auto_24433 ) ) ( not ( = ?auto_24432 ?auto_24434 ) ) ( not ( = ?auto_24440 ?auto_24439 ) ) ( HOIST-AT ?auto_24435 ?auto_24440 ) ( not ( = ?auto_24436 ?auto_24435 ) ) ( AVAILABLE ?auto_24435 ) ( SURFACE-AT ?auto_24434 ?auto_24440 ) ( ON ?auto_24434 ?auto_24437 ) ( CLEAR ?auto_24434 ) ( not ( = ?auto_24433 ?auto_24437 ) ) ( not ( = ?auto_24434 ?auto_24437 ) ) ( not ( = ?auto_24432 ?auto_24437 ) ) ( SURFACE-AT ?auto_24432 ?auto_24439 ) ( CLEAR ?auto_24432 ) ( IS-CRATE ?auto_24433 ) ( AVAILABLE ?auto_24436 ) ( IN ?auto_24433 ?auto_24441 ) ( TRUCK-AT ?auto_24441 ?auto_24438 ) ( not ( = ?auto_24438 ?auto_24439 ) ) ( not ( = ?auto_24440 ?auto_24438 ) ) ( ON ?auto_24432 ?auto_24431 ) ( not ( = ?auto_24431 ?auto_24432 ) ) ( not ( = ?auto_24431 ?auto_24433 ) ) ( not ( = ?auto_24431 ?auto_24434 ) ) ( not ( = ?auto_24431 ?auto_24437 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24432 ?auto_24433 ?auto_24434 )
      ( MAKE-3CRATE-VERIFY ?auto_24431 ?auto_24432 ?auto_24433 ?auto_24434 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24442 - SURFACE
      ?auto_24443 - SURFACE
    )
    :vars
    (
      ?auto_24445 - HOIST
      ?auto_24448 - PLACE
      ?auto_24449 - SURFACE
      ?auto_24450 - PLACE
      ?auto_24444 - HOIST
      ?auto_24446 - SURFACE
      ?auto_24451 - TRUCK
      ?auto_24447 - PLACE
      ?auto_24452 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24445 ?auto_24448 ) ( IS-CRATE ?auto_24443 ) ( not ( = ?auto_24442 ?auto_24443 ) ) ( not ( = ?auto_24449 ?auto_24442 ) ) ( not ( = ?auto_24449 ?auto_24443 ) ) ( not ( = ?auto_24450 ?auto_24448 ) ) ( HOIST-AT ?auto_24444 ?auto_24450 ) ( not ( = ?auto_24445 ?auto_24444 ) ) ( AVAILABLE ?auto_24444 ) ( SURFACE-AT ?auto_24443 ?auto_24450 ) ( ON ?auto_24443 ?auto_24446 ) ( CLEAR ?auto_24443 ) ( not ( = ?auto_24442 ?auto_24446 ) ) ( not ( = ?auto_24443 ?auto_24446 ) ) ( not ( = ?auto_24449 ?auto_24446 ) ) ( SURFACE-AT ?auto_24449 ?auto_24448 ) ( CLEAR ?auto_24449 ) ( IS-CRATE ?auto_24442 ) ( AVAILABLE ?auto_24445 ) ( TRUCK-AT ?auto_24451 ?auto_24447 ) ( not ( = ?auto_24447 ?auto_24448 ) ) ( not ( = ?auto_24450 ?auto_24447 ) ) ( HOIST-AT ?auto_24452 ?auto_24447 ) ( LIFTING ?auto_24452 ?auto_24442 ) ( not ( = ?auto_24445 ?auto_24452 ) ) ( not ( = ?auto_24444 ?auto_24452 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24452 ?auto_24442 ?auto_24451 ?auto_24447 )
      ( MAKE-2CRATE ?auto_24449 ?auto_24442 ?auto_24443 )
      ( MAKE-1CRATE-VERIFY ?auto_24442 ?auto_24443 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24453 - SURFACE
      ?auto_24454 - SURFACE
      ?auto_24455 - SURFACE
    )
    :vars
    (
      ?auto_24456 - HOIST
      ?auto_24460 - PLACE
      ?auto_24463 - PLACE
      ?auto_24462 - HOIST
      ?auto_24458 - SURFACE
      ?auto_24459 - TRUCK
      ?auto_24461 - PLACE
      ?auto_24457 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24456 ?auto_24460 ) ( IS-CRATE ?auto_24455 ) ( not ( = ?auto_24454 ?auto_24455 ) ) ( not ( = ?auto_24453 ?auto_24454 ) ) ( not ( = ?auto_24453 ?auto_24455 ) ) ( not ( = ?auto_24463 ?auto_24460 ) ) ( HOIST-AT ?auto_24462 ?auto_24463 ) ( not ( = ?auto_24456 ?auto_24462 ) ) ( AVAILABLE ?auto_24462 ) ( SURFACE-AT ?auto_24455 ?auto_24463 ) ( ON ?auto_24455 ?auto_24458 ) ( CLEAR ?auto_24455 ) ( not ( = ?auto_24454 ?auto_24458 ) ) ( not ( = ?auto_24455 ?auto_24458 ) ) ( not ( = ?auto_24453 ?auto_24458 ) ) ( SURFACE-AT ?auto_24453 ?auto_24460 ) ( CLEAR ?auto_24453 ) ( IS-CRATE ?auto_24454 ) ( AVAILABLE ?auto_24456 ) ( TRUCK-AT ?auto_24459 ?auto_24461 ) ( not ( = ?auto_24461 ?auto_24460 ) ) ( not ( = ?auto_24463 ?auto_24461 ) ) ( HOIST-AT ?auto_24457 ?auto_24461 ) ( LIFTING ?auto_24457 ?auto_24454 ) ( not ( = ?auto_24456 ?auto_24457 ) ) ( not ( = ?auto_24462 ?auto_24457 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24454 ?auto_24455 )
      ( MAKE-2CRATE-VERIFY ?auto_24453 ?auto_24454 ?auto_24455 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24464 - SURFACE
      ?auto_24465 - SURFACE
      ?auto_24466 - SURFACE
      ?auto_24467 - SURFACE
    )
    :vars
    (
      ?auto_24472 - HOIST
      ?auto_24469 - PLACE
      ?auto_24470 - PLACE
      ?auto_24468 - HOIST
      ?auto_24471 - SURFACE
      ?auto_24475 - TRUCK
      ?auto_24474 - PLACE
      ?auto_24473 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24472 ?auto_24469 ) ( IS-CRATE ?auto_24467 ) ( not ( = ?auto_24466 ?auto_24467 ) ) ( not ( = ?auto_24465 ?auto_24466 ) ) ( not ( = ?auto_24465 ?auto_24467 ) ) ( not ( = ?auto_24470 ?auto_24469 ) ) ( HOIST-AT ?auto_24468 ?auto_24470 ) ( not ( = ?auto_24472 ?auto_24468 ) ) ( AVAILABLE ?auto_24468 ) ( SURFACE-AT ?auto_24467 ?auto_24470 ) ( ON ?auto_24467 ?auto_24471 ) ( CLEAR ?auto_24467 ) ( not ( = ?auto_24466 ?auto_24471 ) ) ( not ( = ?auto_24467 ?auto_24471 ) ) ( not ( = ?auto_24465 ?auto_24471 ) ) ( SURFACE-AT ?auto_24465 ?auto_24469 ) ( CLEAR ?auto_24465 ) ( IS-CRATE ?auto_24466 ) ( AVAILABLE ?auto_24472 ) ( TRUCK-AT ?auto_24475 ?auto_24474 ) ( not ( = ?auto_24474 ?auto_24469 ) ) ( not ( = ?auto_24470 ?auto_24474 ) ) ( HOIST-AT ?auto_24473 ?auto_24474 ) ( LIFTING ?auto_24473 ?auto_24466 ) ( not ( = ?auto_24472 ?auto_24473 ) ) ( not ( = ?auto_24468 ?auto_24473 ) ) ( ON ?auto_24465 ?auto_24464 ) ( not ( = ?auto_24464 ?auto_24465 ) ) ( not ( = ?auto_24464 ?auto_24466 ) ) ( not ( = ?auto_24464 ?auto_24467 ) ) ( not ( = ?auto_24464 ?auto_24471 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24465 ?auto_24466 ?auto_24467 )
      ( MAKE-3CRATE-VERIFY ?auto_24464 ?auto_24465 ?auto_24466 ?auto_24467 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24476 - SURFACE
      ?auto_24477 - SURFACE
    )
    :vars
    (
      ?auto_24483 - HOIST
      ?auto_24479 - PLACE
      ?auto_24481 - SURFACE
      ?auto_24480 - PLACE
      ?auto_24478 - HOIST
      ?auto_24482 - SURFACE
      ?auto_24486 - TRUCK
      ?auto_24485 - PLACE
      ?auto_24484 - HOIST
      ?auto_24487 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24483 ?auto_24479 ) ( IS-CRATE ?auto_24477 ) ( not ( = ?auto_24476 ?auto_24477 ) ) ( not ( = ?auto_24481 ?auto_24476 ) ) ( not ( = ?auto_24481 ?auto_24477 ) ) ( not ( = ?auto_24480 ?auto_24479 ) ) ( HOIST-AT ?auto_24478 ?auto_24480 ) ( not ( = ?auto_24483 ?auto_24478 ) ) ( AVAILABLE ?auto_24478 ) ( SURFACE-AT ?auto_24477 ?auto_24480 ) ( ON ?auto_24477 ?auto_24482 ) ( CLEAR ?auto_24477 ) ( not ( = ?auto_24476 ?auto_24482 ) ) ( not ( = ?auto_24477 ?auto_24482 ) ) ( not ( = ?auto_24481 ?auto_24482 ) ) ( SURFACE-AT ?auto_24481 ?auto_24479 ) ( CLEAR ?auto_24481 ) ( IS-CRATE ?auto_24476 ) ( AVAILABLE ?auto_24483 ) ( TRUCK-AT ?auto_24486 ?auto_24485 ) ( not ( = ?auto_24485 ?auto_24479 ) ) ( not ( = ?auto_24480 ?auto_24485 ) ) ( HOIST-AT ?auto_24484 ?auto_24485 ) ( not ( = ?auto_24483 ?auto_24484 ) ) ( not ( = ?auto_24478 ?auto_24484 ) ) ( AVAILABLE ?auto_24484 ) ( SURFACE-AT ?auto_24476 ?auto_24485 ) ( ON ?auto_24476 ?auto_24487 ) ( CLEAR ?auto_24476 ) ( not ( = ?auto_24476 ?auto_24487 ) ) ( not ( = ?auto_24477 ?auto_24487 ) ) ( not ( = ?auto_24481 ?auto_24487 ) ) ( not ( = ?auto_24482 ?auto_24487 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24484 ?auto_24476 ?auto_24487 ?auto_24485 )
      ( MAKE-2CRATE ?auto_24481 ?auto_24476 ?auto_24477 )
      ( MAKE-1CRATE-VERIFY ?auto_24476 ?auto_24477 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24488 - SURFACE
      ?auto_24489 - SURFACE
      ?auto_24490 - SURFACE
    )
    :vars
    (
      ?auto_24497 - HOIST
      ?auto_24493 - PLACE
      ?auto_24491 - PLACE
      ?auto_24498 - HOIST
      ?auto_24495 - SURFACE
      ?auto_24496 - TRUCK
      ?auto_24492 - PLACE
      ?auto_24499 - HOIST
      ?auto_24494 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24497 ?auto_24493 ) ( IS-CRATE ?auto_24490 ) ( not ( = ?auto_24489 ?auto_24490 ) ) ( not ( = ?auto_24488 ?auto_24489 ) ) ( not ( = ?auto_24488 ?auto_24490 ) ) ( not ( = ?auto_24491 ?auto_24493 ) ) ( HOIST-AT ?auto_24498 ?auto_24491 ) ( not ( = ?auto_24497 ?auto_24498 ) ) ( AVAILABLE ?auto_24498 ) ( SURFACE-AT ?auto_24490 ?auto_24491 ) ( ON ?auto_24490 ?auto_24495 ) ( CLEAR ?auto_24490 ) ( not ( = ?auto_24489 ?auto_24495 ) ) ( not ( = ?auto_24490 ?auto_24495 ) ) ( not ( = ?auto_24488 ?auto_24495 ) ) ( SURFACE-AT ?auto_24488 ?auto_24493 ) ( CLEAR ?auto_24488 ) ( IS-CRATE ?auto_24489 ) ( AVAILABLE ?auto_24497 ) ( TRUCK-AT ?auto_24496 ?auto_24492 ) ( not ( = ?auto_24492 ?auto_24493 ) ) ( not ( = ?auto_24491 ?auto_24492 ) ) ( HOIST-AT ?auto_24499 ?auto_24492 ) ( not ( = ?auto_24497 ?auto_24499 ) ) ( not ( = ?auto_24498 ?auto_24499 ) ) ( AVAILABLE ?auto_24499 ) ( SURFACE-AT ?auto_24489 ?auto_24492 ) ( ON ?auto_24489 ?auto_24494 ) ( CLEAR ?auto_24489 ) ( not ( = ?auto_24489 ?auto_24494 ) ) ( not ( = ?auto_24490 ?auto_24494 ) ) ( not ( = ?auto_24488 ?auto_24494 ) ) ( not ( = ?auto_24495 ?auto_24494 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24489 ?auto_24490 )
      ( MAKE-2CRATE-VERIFY ?auto_24488 ?auto_24489 ?auto_24490 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24500 - SURFACE
      ?auto_24501 - SURFACE
      ?auto_24502 - SURFACE
      ?auto_24503 - SURFACE
    )
    :vars
    (
      ?auto_24505 - HOIST
      ?auto_24507 - PLACE
      ?auto_24508 - PLACE
      ?auto_24511 - HOIST
      ?auto_24506 - SURFACE
      ?auto_24504 - TRUCK
      ?auto_24509 - PLACE
      ?auto_24510 - HOIST
      ?auto_24512 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24505 ?auto_24507 ) ( IS-CRATE ?auto_24503 ) ( not ( = ?auto_24502 ?auto_24503 ) ) ( not ( = ?auto_24501 ?auto_24502 ) ) ( not ( = ?auto_24501 ?auto_24503 ) ) ( not ( = ?auto_24508 ?auto_24507 ) ) ( HOIST-AT ?auto_24511 ?auto_24508 ) ( not ( = ?auto_24505 ?auto_24511 ) ) ( AVAILABLE ?auto_24511 ) ( SURFACE-AT ?auto_24503 ?auto_24508 ) ( ON ?auto_24503 ?auto_24506 ) ( CLEAR ?auto_24503 ) ( not ( = ?auto_24502 ?auto_24506 ) ) ( not ( = ?auto_24503 ?auto_24506 ) ) ( not ( = ?auto_24501 ?auto_24506 ) ) ( SURFACE-AT ?auto_24501 ?auto_24507 ) ( CLEAR ?auto_24501 ) ( IS-CRATE ?auto_24502 ) ( AVAILABLE ?auto_24505 ) ( TRUCK-AT ?auto_24504 ?auto_24509 ) ( not ( = ?auto_24509 ?auto_24507 ) ) ( not ( = ?auto_24508 ?auto_24509 ) ) ( HOIST-AT ?auto_24510 ?auto_24509 ) ( not ( = ?auto_24505 ?auto_24510 ) ) ( not ( = ?auto_24511 ?auto_24510 ) ) ( AVAILABLE ?auto_24510 ) ( SURFACE-AT ?auto_24502 ?auto_24509 ) ( ON ?auto_24502 ?auto_24512 ) ( CLEAR ?auto_24502 ) ( not ( = ?auto_24502 ?auto_24512 ) ) ( not ( = ?auto_24503 ?auto_24512 ) ) ( not ( = ?auto_24501 ?auto_24512 ) ) ( not ( = ?auto_24506 ?auto_24512 ) ) ( ON ?auto_24501 ?auto_24500 ) ( not ( = ?auto_24500 ?auto_24501 ) ) ( not ( = ?auto_24500 ?auto_24502 ) ) ( not ( = ?auto_24500 ?auto_24503 ) ) ( not ( = ?auto_24500 ?auto_24506 ) ) ( not ( = ?auto_24500 ?auto_24512 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24501 ?auto_24502 ?auto_24503 )
      ( MAKE-3CRATE-VERIFY ?auto_24500 ?auto_24501 ?auto_24502 ?auto_24503 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24513 - SURFACE
      ?auto_24514 - SURFACE
    )
    :vars
    (
      ?auto_24516 - HOIST
      ?auto_24518 - PLACE
      ?auto_24522 - SURFACE
      ?auto_24519 - PLACE
      ?auto_24523 - HOIST
      ?auto_24517 - SURFACE
      ?auto_24520 - PLACE
      ?auto_24521 - HOIST
      ?auto_24524 - SURFACE
      ?auto_24515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24516 ?auto_24518 ) ( IS-CRATE ?auto_24514 ) ( not ( = ?auto_24513 ?auto_24514 ) ) ( not ( = ?auto_24522 ?auto_24513 ) ) ( not ( = ?auto_24522 ?auto_24514 ) ) ( not ( = ?auto_24519 ?auto_24518 ) ) ( HOIST-AT ?auto_24523 ?auto_24519 ) ( not ( = ?auto_24516 ?auto_24523 ) ) ( AVAILABLE ?auto_24523 ) ( SURFACE-AT ?auto_24514 ?auto_24519 ) ( ON ?auto_24514 ?auto_24517 ) ( CLEAR ?auto_24514 ) ( not ( = ?auto_24513 ?auto_24517 ) ) ( not ( = ?auto_24514 ?auto_24517 ) ) ( not ( = ?auto_24522 ?auto_24517 ) ) ( SURFACE-AT ?auto_24522 ?auto_24518 ) ( CLEAR ?auto_24522 ) ( IS-CRATE ?auto_24513 ) ( AVAILABLE ?auto_24516 ) ( not ( = ?auto_24520 ?auto_24518 ) ) ( not ( = ?auto_24519 ?auto_24520 ) ) ( HOIST-AT ?auto_24521 ?auto_24520 ) ( not ( = ?auto_24516 ?auto_24521 ) ) ( not ( = ?auto_24523 ?auto_24521 ) ) ( AVAILABLE ?auto_24521 ) ( SURFACE-AT ?auto_24513 ?auto_24520 ) ( ON ?auto_24513 ?auto_24524 ) ( CLEAR ?auto_24513 ) ( not ( = ?auto_24513 ?auto_24524 ) ) ( not ( = ?auto_24514 ?auto_24524 ) ) ( not ( = ?auto_24522 ?auto_24524 ) ) ( not ( = ?auto_24517 ?auto_24524 ) ) ( TRUCK-AT ?auto_24515 ?auto_24518 ) )
    :subtasks
    ( ( !DRIVE ?auto_24515 ?auto_24518 ?auto_24520 )
      ( MAKE-2CRATE ?auto_24522 ?auto_24513 ?auto_24514 )
      ( MAKE-1CRATE-VERIFY ?auto_24513 ?auto_24514 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24525 - SURFACE
      ?auto_24526 - SURFACE
      ?auto_24527 - SURFACE
    )
    :vars
    (
      ?auto_24532 - HOIST
      ?auto_24534 - PLACE
      ?auto_24528 - PLACE
      ?auto_24533 - HOIST
      ?auto_24535 - SURFACE
      ?auto_24531 - PLACE
      ?auto_24536 - HOIST
      ?auto_24530 - SURFACE
      ?auto_24529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24532 ?auto_24534 ) ( IS-CRATE ?auto_24527 ) ( not ( = ?auto_24526 ?auto_24527 ) ) ( not ( = ?auto_24525 ?auto_24526 ) ) ( not ( = ?auto_24525 ?auto_24527 ) ) ( not ( = ?auto_24528 ?auto_24534 ) ) ( HOIST-AT ?auto_24533 ?auto_24528 ) ( not ( = ?auto_24532 ?auto_24533 ) ) ( AVAILABLE ?auto_24533 ) ( SURFACE-AT ?auto_24527 ?auto_24528 ) ( ON ?auto_24527 ?auto_24535 ) ( CLEAR ?auto_24527 ) ( not ( = ?auto_24526 ?auto_24535 ) ) ( not ( = ?auto_24527 ?auto_24535 ) ) ( not ( = ?auto_24525 ?auto_24535 ) ) ( SURFACE-AT ?auto_24525 ?auto_24534 ) ( CLEAR ?auto_24525 ) ( IS-CRATE ?auto_24526 ) ( AVAILABLE ?auto_24532 ) ( not ( = ?auto_24531 ?auto_24534 ) ) ( not ( = ?auto_24528 ?auto_24531 ) ) ( HOIST-AT ?auto_24536 ?auto_24531 ) ( not ( = ?auto_24532 ?auto_24536 ) ) ( not ( = ?auto_24533 ?auto_24536 ) ) ( AVAILABLE ?auto_24536 ) ( SURFACE-AT ?auto_24526 ?auto_24531 ) ( ON ?auto_24526 ?auto_24530 ) ( CLEAR ?auto_24526 ) ( not ( = ?auto_24526 ?auto_24530 ) ) ( not ( = ?auto_24527 ?auto_24530 ) ) ( not ( = ?auto_24525 ?auto_24530 ) ) ( not ( = ?auto_24535 ?auto_24530 ) ) ( TRUCK-AT ?auto_24529 ?auto_24534 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24526 ?auto_24527 )
      ( MAKE-2CRATE-VERIFY ?auto_24525 ?auto_24526 ?auto_24527 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24537 - SURFACE
      ?auto_24538 - SURFACE
      ?auto_24539 - SURFACE
      ?auto_24540 - SURFACE
    )
    :vars
    (
      ?auto_24547 - HOIST
      ?auto_24546 - PLACE
      ?auto_24542 - PLACE
      ?auto_24545 - HOIST
      ?auto_24543 - SURFACE
      ?auto_24549 - PLACE
      ?auto_24541 - HOIST
      ?auto_24544 - SURFACE
      ?auto_24548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24547 ?auto_24546 ) ( IS-CRATE ?auto_24540 ) ( not ( = ?auto_24539 ?auto_24540 ) ) ( not ( = ?auto_24538 ?auto_24539 ) ) ( not ( = ?auto_24538 ?auto_24540 ) ) ( not ( = ?auto_24542 ?auto_24546 ) ) ( HOIST-AT ?auto_24545 ?auto_24542 ) ( not ( = ?auto_24547 ?auto_24545 ) ) ( AVAILABLE ?auto_24545 ) ( SURFACE-AT ?auto_24540 ?auto_24542 ) ( ON ?auto_24540 ?auto_24543 ) ( CLEAR ?auto_24540 ) ( not ( = ?auto_24539 ?auto_24543 ) ) ( not ( = ?auto_24540 ?auto_24543 ) ) ( not ( = ?auto_24538 ?auto_24543 ) ) ( SURFACE-AT ?auto_24538 ?auto_24546 ) ( CLEAR ?auto_24538 ) ( IS-CRATE ?auto_24539 ) ( AVAILABLE ?auto_24547 ) ( not ( = ?auto_24549 ?auto_24546 ) ) ( not ( = ?auto_24542 ?auto_24549 ) ) ( HOIST-AT ?auto_24541 ?auto_24549 ) ( not ( = ?auto_24547 ?auto_24541 ) ) ( not ( = ?auto_24545 ?auto_24541 ) ) ( AVAILABLE ?auto_24541 ) ( SURFACE-AT ?auto_24539 ?auto_24549 ) ( ON ?auto_24539 ?auto_24544 ) ( CLEAR ?auto_24539 ) ( not ( = ?auto_24539 ?auto_24544 ) ) ( not ( = ?auto_24540 ?auto_24544 ) ) ( not ( = ?auto_24538 ?auto_24544 ) ) ( not ( = ?auto_24543 ?auto_24544 ) ) ( TRUCK-AT ?auto_24548 ?auto_24546 ) ( ON ?auto_24538 ?auto_24537 ) ( not ( = ?auto_24537 ?auto_24538 ) ) ( not ( = ?auto_24537 ?auto_24539 ) ) ( not ( = ?auto_24537 ?auto_24540 ) ) ( not ( = ?auto_24537 ?auto_24543 ) ) ( not ( = ?auto_24537 ?auto_24544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24538 ?auto_24539 ?auto_24540 )
      ( MAKE-3CRATE-VERIFY ?auto_24537 ?auto_24538 ?auto_24539 ?auto_24540 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24550 - SURFACE
      ?auto_24551 - SURFACE
    )
    :vars
    (
      ?auto_24559 - HOIST
      ?auto_24558 - PLACE
      ?auto_24553 - SURFACE
      ?auto_24554 - PLACE
      ?auto_24557 - HOIST
      ?auto_24555 - SURFACE
      ?auto_24561 - PLACE
      ?auto_24552 - HOIST
      ?auto_24556 - SURFACE
      ?auto_24560 - TRUCK
      ?auto_24562 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24559 ?auto_24558 ) ( IS-CRATE ?auto_24551 ) ( not ( = ?auto_24550 ?auto_24551 ) ) ( not ( = ?auto_24553 ?auto_24550 ) ) ( not ( = ?auto_24553 ?auto_24551 ) ) ( not ( = ?auto_24554 ?auto_24558 ) ) ( HOIST-AT ?auto_24557 ?auto_24554 ) ( not ( = ?auto_24559 ?auto_24557 ) ) ( AVAILABLE ?auto_24557 ) ( SURFACE-AT ?auto_24551 ?auto_24554 ) ( ON ?auto_24551 ?auto_24555 ) ( CLEAR ?auto_24551 ) ( not ( = ?auto_24550 ?auto_24555 ) ) ( not ( = ?auto_24551 ?auto_24555 ) ) ( not ( = ?auto_24553 ?auto_24555 ) ) ( IS-CRATE ?auto_24550 ) ( not ( = ?auto_24561 ?auto_24558 ) ) ( not ( = ?auto_24554 ?auto_24561 ) ) ( HOIST-AT ?auto_24552 ?auto_24561 ) ( not ( = ?auto_24559 ?auto_24552 ) ) ( not ( = ?auto_24557 ?auto_24552 ) ) ( AVAILABLE ?auto_24552 ) ( SURFACE-AT ?auto_24550 ?auto_24561 ) ( ON ?auto_24550 ?auto_24556 ) ( CLEAR ?auto_24550 ) ( not ( = ?auto_24550 ?auto_24556 ) ) ( not ( = ?auto_24551 ?auto_24556 ) ) ( not ( = ?auto_24553 ?auto_24556 ) ) ( not ( = ?auto_24555 ?auto_24556 ) ) ( TRUCK-AT ?auto_24560 ?auto_24558 ) ( SURFACE-AT ?auto_24562 ?auto_24558 ) ( CLEAR ?auto_24562 ) ( LIFTING ?auto_24559 ?auto_24553 ) ( IS-CRATE ?auto_24553 ) ( not ( = ?auto_24562 ?auto_24553 ) ) ( not ( = ?auto_24550 ?auto_24562 ) ) ( not ( = ?auto_24551 ?auto_24562 ) ) ( not ( = ?auto_24555 ?auto_24562 ) ) ( not ( = ?auto_24556 ?auto_24562 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24562 ?auto_24553 )
      ( MAKE-2CRATE ?auto_24553 ?auto_24550 ?auto_24551 )
      ( MAKE-1CRATE-VERIFY ?auto_24550 ?auto_24551 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24563 - SURFACE
      ?auto_24564 - SURFACE
      ?auto_24565 - SURFACE
    )
    :vars
    (
      ?auto_24568 - HOIST
      ?auto_24575 - PLACE
      ?auto_24573 - PLACE
      ?auto_24566 - HOIST
      ?auto_24570 - SURFACE
      ?auto_24567 - PLACE
      ?auto_24572 - HOIST
      ?auto_24569 - SURFACE
      ?auto_24571 - TRUCK
      ?auto_24574 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24568 ?auto_24575 ) ( IS-CRATE ?auto_24565 ) ( not ( = ?auto_24564 ?auto_24565 ) ) ( not ( = ?auto_24563 ?auto_24564 ) ) ( not ( = ?auto_24563 ?auto_24565 ) ) ( not ( = ?auto_24573 ?auto_24575 ) ) ( HOIST-AT ?auto_24566 ?auto_24573 ) ( not ( = ?auto_24568 ?auto_24566 ) ) ( AVAILABLE ?auto_24566 ) ( SURFACE-AT ?auto_24565 ?auto_24573 ) ( ON ?auto_24565 ?auto_24570 ) ( CLEAR ?auto_24565 ) ( not ( = ?auto_24564 ?auto_24570 ) ) ( not ( = ?auto_24565 ?auto_24570 ) ) ( not ( = ?auto_24563 ?auto_24570 ) ) ( IS-CRATE ?auto_24564 ) ( not ( = ?auto_24567 ?auto_24575 ) ) ( not ( = ?auto_24573 ?auto_24567 ) ) ( HOIST-AT ?auto_24572 ?auto_24567 ) ( not ( = ?auto_24568 ?auto_24572 ) ) ( not ( = ?auto_24566 ?auto_24572 ) ) ( AVAILABLE ?auto_24572 ) ( SURFACE-AT ?auto_24564 ?auto_24567 ) ( ON ?auto_24564 ?auto_24569 ) ( CLEAR ?auto_24564 ) ( not ( = ?auto_24564 ?auto_24569 ) ) ( not ( = ?auto_24565 ?auto_24569 ) ) ( not ( = ?auto_24563 ?auto_24569 ) ) ( not ( = ?auto_24570 ?auto_24569 ) ) ( TRUCK-AT ?auto_24571 ?auto_24575 ) ( SURFACE-AT ?auto_24574 ?auto_24575 ) ( CLEAR ?auto_24574 ) ( LIFTING ?auto_24568 ?auto_24563 ) ( IS-CRATE ?auto_24563 ) ( not ( = ?auto_24574 ?auto_24563 ) ) ( not ( = ?auto_24564 ?auto_24574 ) ) ( not ( = ?auto_24565 ?auto_24574 ) ) ( not ( = ?auto_24570 ?auto_24574 ) ) ( not ( = ?auto_24569 ?auto_24574 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24564 ?auto_24565 )
      ( MAKE-2CRATE-VERIFY ?auto_24563 ?auto_24564 ?auto_24565 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24576 - SURFACE
      ?auto_24577 - SURFACE
      ?auto_24578 - SURFACE
      ?auto_24579 - SURFACE
    )
    :vars
    (
      ?auto_24587 - HOIST
      ?auto_24582 - PLACE
      ?auto_24586 - PLACE
      ?auto_24585 - HOIST
      ?auto_24580 - SURFACE
      ?auto_24588 - PLACE
      ?auto_24583 - HOIST
      ?auto_24581 - SURFACE
      ?auto_24584 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24587 ?auto_24582 ) ( IS-CRATE ?auto_24579 ) ( not ( = ?auto_24578 ?auto_24579 ) ) ( not ( = ?auto_24577 ?auto_24578 ) ) ( not ( = ?auto_24577 ?auto_24579 ) ) ( not ( = ?auto_24586 ?auto_24582 ) ) ( HOIST-AT ?auto_24585 ?auto_24586 ) ( not ( = ?auto_24587 ?auto_24585 ) ) ( AVAILABLE ?auto_24585 ) ( SURFACE-AT ?auto_24579 ?auto_24586 ) ( ON ?auto_24579 ?auto_24580 ) ( CLEAR ?auto_24579 ) ( not ( = ?auto_24578 ?auto_24580 ) ) ( not ( = ?auto_24579 ?auto_24580 ) ) ( not ( = ?auto_24577 ?auto_24580 ) ) ( IS-CRATE ?auto_24578 ) ( not ( = ?auto_24588 ?auto_24582 ) ) ( not ( = ?auto_24586 ?auto_24588 ) ) ( HOIST-AT ?auto_24583 ?auto_24588 ) ( not ( = ?auto_24587 ?auto_24583 ) ) ( not ( = ?auto_24585 ?auto_24583 ) ) ( AVAILABLE ?auto_24583 ) ( SURFACE-AT ?auto_24578 ?auto_24588 ) ( ON ?auto_24578 ?auto_24581 ) ( CLEAR ?auto_24578 ) ( not ( = ?auto_24578 ?auto_24581 ) ) ( not ( = ?auto_24579 ?auto_24581 ) ) ( not ( = ?auto_24577 ?auto_24581 ) ) ( not ( = ?auto_24580 ?auto_24581 ) ) ( TRUCK-AT ?auto_24584 ?auto_24582 ) ( SURFACE-AT ?auto_24576 ?auto_24582 ) ( CLEAR ?auto_24576 ) ( LIFTING ?auto_24587 ?auto_24577 ) ( IS-CRATE ?auto_24577 ) ( not ( = ?auto_24576 ?auto_24577 ) ) ( not ( = ?auto_24578 ?auto_24576 ) ) ( not ( = ?auto_24579 ?auto_24576 ) ) ( not ( = ?auto_24580 ?auto_24576 ) ) ( not ( = ?auto_24581 ?auto_24576 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24577 ?auto_24578 ?auto_24579 )
      ( MAKE-3CRATE-VERIFY ?auto_24576 ?auto_24577 ?auto_24578 ?auto_24579 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24589 - SURFACE
      ?auto_24590 - SURFACE
    )
    :vars
    (
      ?auto_24600 - HOIST
      ?auto_24595 - PLACE
      ?auto_24594 - SURFACE
      ?auto_24599 - PLACE
      ?auto_24598 - HOIST
      ?auto_24592 - SURFACE
      ?auto_24601 - PLACE
      ?auto_24596 - HOIST
      ?auto_24593 - SURFACE
      ?auto_24597 - TRUCK
      ?auto_24591 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24600 ?auto_24595 ) ( IS-CRATE ?auto_24590 ) ( not ( = ?auto_24589 ?auto_24590 ) ) ( not ( = ?auto_24594 ?auto_24589 ) ) ( not ( = ?auto_24594 ?auto_24590 ) ) ( not ( = ?auto_24599 ?auto_24595 ) ) ( HOIST-AT ?auto_24598 ?auto_24599 ) ( not ( = ?auto_24600 ?auto_24598 ) ) ( AVAILABLE ?auto_24598 ) ( SURFACE-AT ?auto_24590 ?auto_24599 ) ( ON ?auto_24590 ?auto_24592 ) ( CLEAR ?auto_24590 ) ( not ( = ?auto_24589 ?auto_24592 ) ) ( not ( = ?auto_24590 ?auto_24592 ) ) ( not ( = ?auto_24594 ?auto_24592 ) ) ( IS-CRATE ?auto_24589 ) ( not ( = ?auto_24601 ?auto_24595 ) ) ( not ( = ?auto_24599 ?auto_24601 ) ) ( HOIST-AT ?auto_24596 ?auto_24601 ) ( not ( = ?auto_24600 ?auto_24596 ) ) ( not ( = ?auto_24598 ?auto_24596 ) ) ( AVAILABLE ?auto_24596 ) ( SURFACE-AT ?auto_24589 ?auto_24601 ) ( ON ?auto_24589 ?auto_24593 ) ( CLEAR ?auto_24589 ) ( not ( = ?auto_24589 ?auto_24593 ) ) ( not ( = ?auto_24590 ?auto_24593 ) ) ( not ( = ?auto_24594 ?auto_24593 ) ) ( not ( = ?auto_24592 ?auto_24593 ) ) ( TRUCK-AT ?auto_24597 ?auto_24595 ) ( SURFACE-AT ?auto_24591 ?auto_24595 ) ( CLEAR ?auto_24591 ) ( IS-CRATE ?auto_24594 ) ( not ( = ?auto_24591 ?auto_24594 ) ) ( not ( = ?auto_24589 ?auto_24591 ) ) ( not ( = ?auto_24590 ?auto_24591 ) ) ( not ( = ?auto_24592 ?auto_24591 ) ) ( not ( = ?auto_24593 ?auto_24591 ) ) ( AVAILABLE ?auto_24600 ) ( IN ?auto_24594 ?auto_24597 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24600 ?auto_24594 ?auto_24597 ?auto_24595 )
      ( MAKE-2CRATE ?auto_24594 ?auto_24589 ?auto_24590 )
      ( MAKE-1CRATE-VERIFY ?auto_24589 ?auto_24590 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24602 - SURFACE
      ?auto_24603 - SURFACE
      ?auto_24604 - SURFACE
    )
    :vars
    (
      ?auto_24610 - HOIST
      ?auto_24614 - PLACE
      ?auto_24609 - PLACE
      ?auto_24608 - HOIST
      ?auto_24612 - SURFACE
      ?auto_24607 - PLACE
      ?auto_24611 - HOIST
      ?auto_24613 - SURFACE
      ?auto_24606 - TRUCK
      ?auto_24605 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24610 ?auto_24614 ) ( IS-CRATE ?auto_24604 ) ( not ( = ?auto_24603 ?auto_24604 ) ) ( not ( = ?auto_24602 ?auto_24603 ) ) ( not ( = ?auto_24602 ?auto_24604 ) ) ( not ( = ?auto_24609 ?auto_24614 ) ) ( HOIST-AT ?auto_24608 ?auto_24609 ) ( not ( = ?auto_24610 ?auto_24608 ) ) ( AVAILABLE ?auto_24608 ) ( SURFACE-AT ?auto_24604 ?auto_24609 ) ( ON ?auto_24604 ?auto_24612 ) ( CLEAR ?auto_24604 ) ( not ( = ?auto_24603 ?auto_24612 ) ) ( not ( = ?auto_24604 ?auto_24612 ) ) ( not ( = ?auto_24602 ?auto_24612 ) ) ( IS-CRATE ?auto_24603 ) ( not ( = ?auto_24607 ?auto_24614 ) ) ( not ( = ?auto_24609 ?auto_24607 ) ) ( HOIST-AT ?auto_24611 ?auto_24607 ) ( not ( = ?auto_24610 ?auto_24611 ) ) ( not ( = ?auto_24608 ?auto_24611 ) ) ( AVAILABLE ?auto_24611 ) ( SURFACE-AT ?auto_24603 ?auto_24607 ) ( ON ?auto_24603 ?auto_24613 ) ( CLEAR ?auto_24603 ) ( not ( = ?auto_24603 ?auto_24613 ) ) ( not ( = ?auto_24604 ?auto_24613 ) ) ( not ( = ?auto_24602 ?auto_24613 ) ) ( not ( = ?auto_24612 ?auto_24613 ) ) ( TRUCK-AT ?auto_24606 ?auto_24614 ) ( SURFACE-AT ?auto_24605 ?auto_24614 ) ( CLEAR ?auto_24605 ) ( IS-CRATE ?auto_24602 ) ( not ( = ?auto_24605 ?auto_24602 ) ) ( not ( = ?auto_24603 ?auto_24605 ) ) ( not ( = ?auto_24604 ?auto_24605 ) ) ( not ( = ?auto_24612 ?auto_24605 ) ) ( not ( = ?auto_24613 ?auto_24605 ) ) ( AVAILABLE ?auto_24610 ) ( IN ?auto_24602 ?auto_24606 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24603 ?auto_24604 )
      ( MAKE-2CRATE-VERIFY ?auto_24602 ?auto_24603 ?auto_24604 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24615 - SURFACE
      ?auto_24616 - SURFACE
      ?auto_24617 - SURFACE
      ?auto_24618 - SURFACE
    )
    :vars
    (
      ?auto_24624 - HOIST
      ?auto_24623 - PLACE
      ?auto_24621 - PLACE
      ?auto_24627 - HOIST
      ?auto_24622 - SURFACE
      ?auto_24619 - PLACE
      ?auto_24626 - HOIST
      ?auto_24625 - SURFACE
      ?auto_24620 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24624 ?auto_24623 ) ( IS-CRATE ?auto_24618 ) ( not ( = ?auto_24617 ?auto_24618 ) ) ( not ( = ?auto_24616 ?auto_24617 ) ) ( not ( = ?auto_24616 ?auto_24618 ) ) ( not ( = ?auto_24621 ?auto_24623 ) ) ( HOIST-AT ?auto_24627 ?auto_24621 ) ( not ( = ?auto_24624 ?auto_24627 ) ) ( AVAILABLE ?auto_24627 ) ( SURFACE-AT ?auto_24618 ?auto_24621 ) ( ON ?auto_24618 ?auto_24622 ) ( CLEAR ?auto_24618 ) ( not ( = ?auto_24617 ?auto_24622 ) ) ( not ( = ?auto_24618 ?auto_24622 ) ) ( not ( = ?auto_24616 ?auto_24622 ) ) ( IS-CRATE ?auto_24617 ) ( not ( = ?auto_24619 ?auto_24623 ) ) ( not ( = ?auto_24621 ?auto_24619 ) ) ( HOIST-AT ?auto_24626 ?auto_24619 ) ( not ( = ?auto_24624 ?auto_24626 ) ) ( not ( = ?auto_24627 ?auto_24626 ) ) ( AVAILABLE ?auto_24626 ) ( SURFACE-AT ?auto_24617 ?auto_24619 ) ( ON ?auto_24617 ?auto_24625 ) ( CLEAR ?auto_24617 ) ( not ( = ?auto_24617 ?auto_24625 ) ) ( not ( = ?auto_24618 ?auto_24625 ) ) ( not ( = ?auto_24616 ?auto_24625 ) ) ( not ( = ?auto_24622 ?auto_24625 ) ) ( TRUCK-AT ?auto_24620 ?auto_24623 ) ( SURFACE-AT ?auto_24615 ?auto_24623 ) ( CLEAR ?auto_24615 ) ( IS-CRATE ?auto_24616 ) ( not ( = ?auto_24615 ?auto_24616 ) ) ( not ( = ?auto_24617 ?auto_24615 ) ) ( not ( = ?auto_24618 ?auto_24615 ) ) ( not ( = ?auto_24622 ?auto_24615 ) ) ( not ( = ?auto_24625 ?auto_24615 ) ) ( AVAILABLE ?auto_24624 ) ( IN ?auto_24616 ?auto_24620 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24616 ?auto_24617 ?auto_24618 )
      ( MAKE-3CRATE-VERIFY ?auto_24615 ?auto_24616 ?auto_24617 ?auto_24618 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24628 - SURFACE
      ?auto_24629 - SURFACE
    )
    :vars
    (
      ?auto_24637 - HOIST
      ?auto_24635 - PLACE
      ?auto_24636 - SURFACE
      ?auto_24633 - PLACE
      ?auto_24640 - HOIST
      ?auto_24634 - SURFACE
      ?auto_24631 - PLACE
      ?auto_24639 - HOIST
      ?auto_24638 - SURFACE
      ?auto_24630 - SURFACE
      ?auto_24632 - TRUCK
      ?auto_24641 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24637 ?auto_24635 ) ( IS-CRATE ?auto_24629 ) ( not ( = ?auto_24628 ?auto_24629 ) ) ( not ( = ?auto_24636 ?auto_24628 ) ) ( not ( = ?auto_24636 ?auto_24629 ) ) ( not ( = ?auto_24633 ?auto_24635 ) ) ( HOIST-AT ?auto_24640 ?auto_24633 ) ( not ( = ?auto_24637 ?auto_24640 ) ) ( AVAILABLE ?auto_24640 ) ( SURFACE-AT ?auto_24629 ?auto_24633 ) ( ON ?auto_24629 ?auto_24634 ) ( CLEAR ?auto_24629 ) ( not ( = ?auto_24628 ?auto_24634 ) ) ( not ( = ?auto_24629 ?auto_24634 ) ) ( not ( = ?auto_24636 ?auto_24634 ) ) ( IS-CRATE ?auto_24628 ) ( not ( = ?auto_24631 ?auto_24635 ) ) ( not ( = ?auto_24633 ?auto_24631 ) ) ( HOIST-AT ?auto_24639 ?auto_24631 ) ( not ( = ?auto_24637 ?auto_24639 ) ) ( not ( = ?auto_24640 ?auto_24639 ) ) ( AVAILABLE ?auto_24639 ) ( SURFACE-AT ?auto_24628 ?auto_24631 ) ( ON ?auto_24628 ?auto_24638 ) ( CLEAR ?auto_24628 ) ( not ( = ?auto_24628 ?auto_24638 ) ) ( not ( = ?auto_24629 ?auto_24638 ) ) ( not ( = ?auto_24636 ?auto_24638 ) ) ( not ( = ?auto_24634 ?auto_24638 ) ) ( SURFACE-AT ?auto_24630 ?auto_24635 ) ( CLEAR ?auto_24630 ) ( IS-CRATE ?auto_24636 ) ( not ( = ?auto_24630 ?auto_24636 ) ) ( not ( = ?auto_24628 ?auto_24630 ) ) ( not ( = ?auto_24629 ?auto_24630 ) ) ( not ( = ?auto_24634 ?auto_24630 ) ) ( not ( = ?auto_24638 ?auto_24630 ) ) ( AVAILABLE ?auto_24637 ) ( IN ?auto_24636 ?auto_24632 ) ( TRUCK-AT ?auto_24632 ?auto_24641 ) ( not ( = ?auto_24641 ?auto_24635 ) ) ( not ( = ?auto_24633 ?auto_24641 ) ) ( not ( = ?auto_24631 ?auto_24641 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24632 ?auto_24641 ?auto_24635 )
      ( MAKE-2CRATE ?auto_24636 ?auto_24628 ?auto_24629 )
      ( MAKE-1CRATE-VERIFY ?auto_24628 ?auto_24629 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24642 - SURFACE
      ?auto_24643 - SURFACE
      ?auto_24644 - SURFACE
    )
    :vars
    (
      ?auto_24654 - HOIST
      ?auto_24645 - PLACE
      ?auto_24655 - PLACE
      ?auto_24651 - HOIST
      ?auto_24647 - SURFACE
      ?auto_24646 - PLACE
      ?auto_24653 - HOIST
      ?auto_24652 - SURFACE
      ?auto_24650 - SURFACE
      ?auto_24649 - TRUCK
      ?auto_24648 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24654 ?auto_24645 ) ( IS-CRATE ?auto_24644 ) ( not ( = ?auto_24643 ?auto_24644 ) ) ( not ( = ?auto_24642 ?auto_24643 ) ) ( not ( = ?auto_24642 ?auto_24644 ) ) ( not ( = ?auto_24655 ?auto_24645 ) ) ( HOIST-AT ?auto_24651 ?auto_24655 ) ( not ( = ?auto_24654 ?auto_24651 ) ) ( AVAILABLE ?auto_24651 ) ( SURFACE-AT ?auto_24644 ?auto_24655 ) ( ON ?auto_24644 ?auto_24647 ) ( CLEAR ?auto_24644 ) ( not ( = ?auto_24643 ?auto_24647 ) ) ( not ( = ?auto_24644 ?auto_24647 ) ) ( not ( = ?auto_24642 ?auto_24647 ) ) ( IS-CRATE ?auto_24643 ) ( not ( = ?auto_24646 ?auto_24645 ) ) ( not ( = ?auto_24655 ?auto_24646 ) ) ( HOIST-AT ?auto_24653 ?auto_24646 ) ( not ( = ?auto_24654 ?auto_24653 ) ) ( not ( = ?auto_24651 ?auto_24653 ) ) ( AVAILABLE ?auto_24653 ) ( SURFACE-AT ?auto_24643 ?auto_24646 ) ( ON ?auto_24643 ?auto_24652 ) ( CLEAR ?auto_24643 ) ( not ( = ?auto_24643 ?auto_24652 ) ) ( not ( = ?auto_24644 ?auto_24652 ) ) ( not ( = ?auto_24642 ?auto_24652 ) ) ( not ( = ?auto_24647 ?auto_24652 ) ) ( SURFACE-AT ?auto_24650 ?auto_24645 ) ( CLEAR ?auto_24650 ) ( IS-CRATE ?auto_24642 ) ( not ( = ?auto_24650 ?auto_24642 ) ) ( not ( = ?auto_24643 ?auto_24650 ) ) ( not ( = ?auto_24644 ?auto_24650 ) ) ( not ( = ?auto_24647 ?auto_24650 ) ) ( not ( = ?auto_24652 ?auto_24650 ) ) ( AVAILABLE ?auto_24654 ) ( IN ?auto_24642 ?auto_24649 ) ( TRUCK-AT ?auto_24649 ?auto_24648 ) ( not ( = ?auto_24648 ?auto_24645 ) ) ( not ( = ?auto_24655 ?auto_24648 ) ) ( not ( = ?auto_24646 ?auto_24648 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24643 ?auto_24644 )
      ( MAKE-2CRATE-VERIFY ?auto_24642 ?auto_24643 ?auto_24644 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24656 - SURFACE
      ?auto_24657 - SURFACE
      ?auto_24658 - SURFACE
      ?auto_24659 - SURFACE
    )
    :vars
    (
      ?auto_24664 - HOIST
      ?auto_24660 - PLACE
      ?auto_24669 - PLACE
      ?auto_24662 - HOIST
      ?auto_24665 - SURFACE
      ?auto_24661 - PLACE
      ?auto_24667 - HOIST
      ?auto_24663 - SURFACE
      ?auto_24668 - TRUCK
      ?auto_24666 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24664 ?auto_24660 ) ( IS-CRATE ?auto_24659 ) ( not ( = ?auto_24658 ?auto_24659 ) ) ( not ( = ?auto_24657 ?auto_24658 ) ) ( not ( = ?auto_24657 ?auto_24659 ) ) ( not ( = ?auto_24669 ?auto_24660 ) ) ( HOIST-AT ?auto_24662 ?auto_24669 ) ( not ( = ?auto_24664 ?auto_24662 ) ) ( AVAILABLE ?auto_24662 ) ( SURFACE-AT ?auto_24659 ?auto_24669 ) ( ON ?auto_24659 ?auto_24665 ) ( CLEAR ?auto_24659 ) ( not ( = ?auto_24658 ?auto_24665 ) ) ( not ( = ?auto_24659 ?auto_24665 ) ) ( not ( = ?auto_24657 ?auto_24665 ) ) ( IS-CRATE ?auto_24658 ) ( not ( = ?auto_24661 ?auto_24660 ) ) ( not ( = ?auto_24669 ?auto_24661 ) ) ( HOIST-AT ?auto_24667 ?auto_24661 ) ( not ( = ?auto_24664 ?auto_24667 ) ) ( not ( = ?auto_24662 ?auto_24667 ) ) ( AVAILABLE ?auto_24667 ) ( SURFACE-AT ?auto_24658 ?auto_24661 ) ( ON ?auto_24658 ?auto_24663 ) ( CLEAR ?auto_24658 ) ( not ( = ?auto_24658 ?auto_24663 ) ) ( not ( = ?auto_24659 ?auto_24663 ) ) ( not ( = ?auto_24657 ?auto_24663 ) ) ( not ( = ?auto_24665 ?auto_24663 ) ) ( SURFACE-AT ?auto_24656 ?auto_24660 ) ( CLEAR ?auto_24656 ) ( IS-CRATE ?auto_24657 ) ( not ( = ?auto_24656 ?auto_24657 ) ) ( not ( = ?auto_24658 ?auto_24656 ) ) ( not ( = ?auto_24659 ?auto_24656 ) ) ( not ( = ?auto_24665 ?auto_24656 ) ) ( not ( = ?auto_24663 ?auto_24656 ) ) ( AVAILABLE ?auto_24664 ) ( IN ?auto_24657 ?auto_24668 ) ( TRUCK-AT ?auto_24668 ?auto_24666 ) ( not ( = ?auto_24666 ?auto_24660 ) ) ( not ( = ?auto_24669 ?auto_24666 ) ) ( not ( = ?auto_24661 ?auto_24666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24657 ?auto_24658 ?auto_24659 )
      ( MAKE-3CRATE-VERIFY ?auto_24656 ?auto_24657 ?auto_24658 ?auto_24659 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24670 - SURFACE
      ?auto_24671 - SURFACE
    )
    :vars
    (
      ?auto_24676 - HOIST
      ?auto_24672 - PLACE
      ?auto_24677 - SURFACE
      ?auto_24682 - PLACE
      ?auto_24674 - HOIST
      ?auto_24678 - SURFACE
      ?auto_24673 - PLACE
      ?auto_24680 - HOIST
      ?auto_24675 - SURFACE
      ?auto_24683 - SURFACE
      ?auto_24681 - TRUCK
      ?auto_24679 - PLACE
      ?auto_24684 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24676 ?auto_24672 ) ( IS-CRATE ?auto_24671 ) ( not ( = ?auto_24670 ?auto_24671 ) ) ( not ( = ?auto_24677 ?auto_24670 ) ) ( not ( = ?auto_24677 ?auto_24671 ) ) ( not ( = ?auto_24682 ?auto_24672 ) ) ( HOIST-AT ?auto_24674 ?auto_24682 ) ( not ( = ?auto_24676 ?auto_24674 ) ) ( AVAILABLE ?auto_24674 ) ( SURFACE-AT ?auto_24671 ?auto_24682 ) ( ON ?auto_24671 ?auto_24678 ) ( CLEAR ?auto_24671 ) ( not ( = ?auto_24670 ?auto_24678 ) ) ( not ( = ?auto_24671 ?auto_24678 ) ) ( not ( = ?auto_24677 ?auto_24678 ) ) ( IS-CRATE ?auto_24670 ) ( not ( = ?auto_24673 ?auto_24672 ) ) ( not ( = ?auto_24682 ?auto_24673 ) ) ( HOIST-AT ?auto_24680 ?auto_24673 ) ( not ( = ?auto_24676 ?auto_24680 ) ) ( not ( = ?auto_24674 ?auto_24680 ) ) ( AVAILABLE ?auto_24680 ) ( SURFACE-AT ?auto_24670 ?auto_24673 ) ( ON ?auto_24670 ?auto_24675 ) ( CLEAR ?auto_24670 ) ( not ( = ?auto_24670 ?auto_24675 ) ) ( not ( = ?auto_24671 ?auto_24675 ) ) ( not ( = ?auto_24677 ?auto_24675 ) ) ( not ( = ?auto_24678 ?auto_24675 ) ) ( SURFACE-AT ?auto_24683 ?auto_24672 ) ( CLEAR ?auto_24683 ) ( IS-CRATE ?auto_24677 ) ( not ( = ?auto_24683 ?auto_24677 ) ) ( not ( = ?auto_24670 ?auto_24683 ) ) ( not ( = ?auto_24671 ?auto_24683 ) ) ( not ( = ?auto_24678 ?auto_24683 ) ) ( not ( = ?auto_24675 ?auto_24683 ) ) ( AVAILABLE ?auto_24676 ) ( TRUCK-AT ?auto_24681 ?auto_24679 ) ( not ( = ?auto_24679 ?auto_24672 ) ) ( not ( = ?auto_24682 ?auto_24679 ) ) ( not ( = ?auto_24673 ?auto_24679 ) ) ( HOIST-AT ?auto_24684 ?auto_24679 ) ( LIFTING ?auto_24684 ?auto_24677 ) ( not ( = ?auto_24676 ?auto_24684 ) ) ( not ( = ?auto_24674 ?auto_24684 ) ) ( not ( = ?auto_24680 ?auto_24684 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24684 ?auto_24677 ?auto_24681 ?auto_24679 )
      ( MAKE-2CRATE ?auto_24677 ?auto_24670 ?auto_24671 )
      ( MAKE-1CRATE-VERIFY ?auto_24670 ?auto_24671 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24685 - SURFACE
      ?auto_24686 - SURFACE
      ?auto_24687 - SURFACE
    )
    :vars
    (
      ?auto_24697 - HOIST
      ?auto_24698 - PLACE
      ?auto_24692 - PLACE
      ?auto_24688 - HOIST
      ?auto_24695 - SURFACE
      ?auto_24696 - PLACE
      ?auto_24691 - HOIST
      ?auto_24689 - SURFACE
      ?auto_24699 - SURFACE
      ?auto_24694 - TRUCK
      ?auto_24693 - PLACE
      ?auto_24690 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24697 ?auto_24698 ) ( IS-CRATE ?auto_24687 ) ( not ( = ?auto_24686 ?auto_24687 ) ) ( not ( = ?auto_24685 ?auto_24686 ) ) ( not ( = ?auto_24685 ?auto_24687 ) ) ( not ( = ?auto_24692 ?auto_24698 ) ) ( HOIST-AT ?auto_24688 ?auto_24692 ) ( not ( = ?auto_24697 ?auto_24688 ) ) ( AVAILABLE ?auto_24688 ) ( SURFACE-AT ?auto_24687 ?auto_24692 ) ( ON ?auto_24687 ?auto_24695 ) ( CLEAR ?auto_24687 ) ( not ( = ?auto_24686 ?auto_24695 ) ) ( not ( = ?auto_24687 ?auto_24695 ) ) ( not ( = ?auto_24685 ?auto_24695 ) ) ( IS-CRATE ?auto_24686 ) ( not ( = ?auto_24696 ?auto_24698 ) ) ( not ( = ?auto_24692 ?auto_24696 ) ) ( HOIST-AT ?auto_24691 ?auto_24696 ) ( not ( = ?auto_24697 ?auto_24691 ) ) ( not ( = ?auto_24688 ?auto_24691 ) ) ( AVAILABLE ?auto_24691 ) ( SURFACE-AT ?auto_24686 ?auto_24696 ) ( ON ?auto_24686 ?auto_24689 ) ( CLEAR ?auto_24686 ) ( not ( = ?auto_24686 ?auto_24689 ) ) ( not ( = ?auto_24687 ?auto_24689 ) ) ( not ( = ?auto_24685 ?auto_24689 ) ) ( not ( = ?auto_24695 ?auto_24689 ) ) ( SURFACE-AT ?auto_24699 ?auto_24698 ) ( CLEAR ?auto_24699 ) ( IS-CRATE ?auto_24685 ) ( not ( = ?auto_24699 ?auto_24685 ) ) ( not ( = ?auto_24686 ?auto_24699 ) ) ( not ( = ?auto_24687 ?auto_24699 ) ) ( not ( = ?auto_24695 ?auto_24699 ) ) ( not ( = ?auto_24689 ?auto_24699 ) ) ( AVAILABLE ?auto_24697 ) ( TRUCK-AT ?auto_24694 ?auto_24693 ) ( not ( = ?auto_24693 ?auto_24698 ) ) ( not ( = ?auto_24692 ?auto_24693 ) ) ( not ( = ?auto_24696 ?auto_24693 ) ) ( HOIST-AT ?auto_24690 ?auto_24693 ) ( LIFTING ?auto_24690 ?auto_24685 ) ( not ( = ?auto_24697 ?auto_24690 ) ) ( not ( = ?auto_24688 ?auto_24690 ) ) ( not ( = ?auto_24691 ?auto_24690 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24686 ?auto_24687 )
      ( MAKE-2CRATE-VERIFY ?auto_24685 ?auto_24686 ?auto_24687 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24700 - SURFACE
      ?auto_24701 - SURFACE
      ?auto_24702 - SURFACE
      ?auto_24703 - SURFACE
    )
    :vars
    (
      ?auto_24709 - HOIST
      ?auto_24713 - PLACE
      ?auto_24706 - PLACE
      ?auto_24712 - HOIST
      ?auto_24711 - SURFACE
      ?auto_24704 - PLACE
      ?auto_24714 - HOIST
      ?auto_24705 - SURFACE
      ?auto_24708 - TRUCK
      ?auto_24710 - PLACE
      ?auto_24707 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24709 ?auto_24713 ) ( IS-CRATE ?auto_24703 ) ( not ( = ?auto_24702 ?auto_24703 ) ) ( not ( = ?auto_24701 ?auto_24702 ) ) ( not ( = ?auto_24701 ?auto_24703 ) ) ( not ( = ?auto_24706 ?auto_24713 ) ) ( HOIST-AT ?auto_24712 ?auto_24706 ) ( not ( = ?auto_24709 ?auto_24712 ) ) ( AVAILABLE ?auto_24712 ) ( SURFACE-AT ?auto_24703 ?auto_24706 ) ( ON ?auto_24703 ?auto_24711 ) ( CLEAR ?auto_24703 ) ( not ( = ?auto_24702 ?auto_24711 ) ) ( not ( = ?auto_24703 ?auto_24711 ) ) ( not ( = ?auto_24701 ?auto_24711 ) ) ( IS-CRATE ?auto_24702 ) ( not ( = ?auto_24704 ?auto_24713 ) ) ( not ( = ?auto_24706 ?auto_24704 ) ) ( HOIST-AT ?auto_24714 ?auto_24704 ) ( not ( = ?auto_24709 ?auto_24714 ) ) ( not ( = ?auto_24712 ?auto_24714 ) ) ( AVAILABLE ?auto_24714 ) ( SURFACE-AT ?auto_24702 ?auto_24704 ) ( ON ?auto_24702 ?auto_24705 ) ( CLEAR ?auto_24702 ) ( not ( = ?auto_24702 ?auto_24705 ) ) ( not ( = ?auto_24703 ?auto_24705 ) ) ( not ( = ?auto_24701 ?auto_24705 ) ) ( not ( = ?auto_24711 ?auto_24705 ) ) ( SURFACE-AT ?auto_24700 ?auto_24713 ) ( CLEAR ?auto_24700 ) ( IS-CRATE ?auto_24701 ) ( not ( = ?auto_24700 ?auto_24701 ) ) ( not ( = ?auto_24702 ?auto_24700 ) ) ( not ( = ?auto_24703 ?auto_24700 ) ) ( not ( = ?auto_24711 ?auto_24700 ) ) ( not ( = ?auto_24705 ?auto_24700 ) ) ( AVAILABLE ?auto_24709 ) ( TRUCK-AT ?auto_24708 ?auto_24710 ) ( not ( = ?auto_24710 ?auto_24713 ) ) ( not ( = ?auto_24706 ?auto_24710 ) ) ( not ( = ?auto_24704 ?auto_24710 ) ) ( HOIST-AT ?auto_24707 ?auto_24710 ) ( LIFTING ?auto_24707 ?auto_24701 ) ( not ( = ?auto_24709 ?auto_24707 ) ) ( not ( = ?auto_24712 ?auto_24707 ) ) ( not ( = ?auto_24714 ?auto_24707 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24701 ?auto_24702 ?auto_24703 )
      ( MAKE-3CRATE-VERIFY ?auto_24700 ?auto_24701 ?auto_24702 ?auto_24703 ) )
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
      ?auto_24728 - PLACE
      ?auto_24725 - SURFACE
      ?auto_24719 - PLACE
      ?auto_24727 - HOIST
      ?auto_24726 - SURFACE
      ?auto_24717 - PLACE
      ?auto_24729 - HOIST
      ?auto_24718 - SURFACE
      ?auto_24723 - SURFACE
      ?auto_24721 - TRUCK
      ?auto_24724 - PLACE
      ?auto_24720 - HOIST
      ?auto_24730 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24722 ?auto_24728 ) ( IS-CRATE ?auto_24716 ) ( not ( = ?auto_24715 ?auto_24716 ) ) ( not ( = ?auto_24725 ?auto_24715 ) ) ( not ( = ?auto_24725 ?auto_24716 ) ) ( not ( = ?auto_24719 ?auto_24728 ) ) ( HOIST-AT ?auto_24727 ?auto_24719 ) ( not ( = ?auto_24722 ?auto_24727 ) ) ( AVAILABLE ?auto_24727 ) ( SURFACE-AT ?auto_24716 ?auto_24719 ) ( ON ?auto_24716 ?auto_24726 ) ( CLEAR ?auto_24716 ) ( not ( = ?auto_24715 ?auto_24726 ) ) ( not ( = ?auto_24716 ?auto_24726 ) ) ( not ( = ?auto_24725 ?auto_24726 ) ) ( IS-CRATE ?auto_24715 ) ( not ( = ?auto_24717 ?auto_24728 ) ) ( not ( = ?auto_24719 ?auto_24717 ) ) ( HOIST-AT ?auto_24729 ?auto_24717 ) ( not ( = ?auto_24722 ?auto_24729 ) ) ( not ( = ?auto_24727 ?auto_24729 ) ) ( AVAILABLE ?auto_24729 ) ( SURFACE-AT ?auto_24715 ?auto_24717 ) ( ON ?auto_24715 ?auto_24718 ) ( CLEAR ?auto_24715 ) ( not ( = ?auto_24715 ?auto_24718 ) ) ( not ( = ?auto_24716 ?auto_24718 ) ) ( not ( = ?auto_24725 ?auto_24718 ) ) ( not ( = ?auto_24726 ?auto_24718 ) ) ( SURFACE-AT ?auto_24723 ?auto_24728 ) ( CLEAR ?auto_24723 ) ( IS-CRATE ?auto_24725 ) ( not ( = ?auto_24723 ?auto_24725 ) ) ( not ( = ?auto_24715 ?auto_24723 ) ) ( not ( = ?auto_24716 ?auto_24723 ) ) ( not ( = ?auto_24726 ?auto_24723 ) ) ( not ( = ?auto_24718 ?auto_24723 ) ) ( AVAILABLE ?auto_24722 ) ( TRUCK-AT ?auto_24721 ?auto_24724 ) ( not ( = ?auto_24724 ?auto_24728 ) ) ( not ( = ?auto_24719 ?auto_24724 ) ) ( not ( = ?auto_24717 ?auto_24724 ) ) ( HOIST-AT ?auto_24720 ?auto_24724 ) ( not ( = ?auto_24722 ?auto_24720 ) ) ( not ( = ?auto_24727 ?auto_24720 ) ) ( not ( = ?auto_24729 ?auto_24720 ) ) ( AVAILABLE ?auto_24720 ) ( SURFACE-AT ?auto_24725 ?auto_24724 ) ( ON ?auto_24725 ?auto_24730 ) ( CLEAR ?auto_24725 ) ( not ( = ?auto_24715 ?auto_24730 ) ) ( not ( = ?auto_24716 ?auto_24730 ) ) ( not ( = ?auto_24725 ?auto_24730 ) ) ( not ( = ?auto_24726 ?auto_24730 ) ) ( not ( = ?auto_24718 ?auto_24730 ) ) ( not ( = ?auto_24723 ?auto_24730 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24720 ?auto_24725 ?auto_24730 ?auto_24724 )
      ( MAKE-2CRATE ?auto_24725 ?auto_24715 ?auto_24716 )
      ( MAKE-1CRATE-VERIFY ?auto_24715 ?auto_24716 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24731 - SURFACE
      ?auto_24732 - SURFACE
      ?auto_24733 - SURFACE
    )
    :vars
    (
      ?auto_24743 - HOIST
      ?auto_24734 - PLACE
      ?auto_24739 - PLACE
      ?auto_24740 - HOIST
      ?auto_24735 - SURFACE
      ?auto_24736 - PLACE
      ?auto_24745 - HOIST
      ?auto_24744 - SURFACE
      ?auto_24741 - SURFACE
      ?auto_24738 - TRUCK
      ?auto_24746 - PLACE
      ?auto_24737 - HOIST
      ?auto_24742 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24743 ?auto_24734 ) ( IS-CRATE ?auto_24733 ) ( not ( = ?auto_24732 ?auto_24733 ) ) ( not ( = ?auto_24731 ?auto_24732 ) ) ( not ( = ?auto_24731 ?auto_24733 ) ) ( not ( = ?auto_24739 ?auto_24734 ) ) ( HOIST-AT ?auto_24740 ?auto_24739 ) ( not ( = ?auto_24743 ?auto_24740 ) ) ( AVAILABLE ?auto_24740 ) ( SURFACE-AT ?auto_24733 ?auto_24739 ) ( ON ?auto_24733 ?auto_24735 ) ( CLEAR ?auto_24733 ) ( not ( = ?auto_24732 ?auto_24735 ) ) ( not ( = ?auto_24733 ?auto_24735 ) ) ( not ( = ?auto_24731 ?auto_24735 ) ) ( IS-CRATE ?auto_24732 ) ( not ( = ?auto_24736 ?auto_24734 ) ) ( not ( = ?auto_24739 ?auto_24736 ) ) ( HOIST-AT ?auto_24745 ?auto_24736 ) ( not ( = ?auto_24743 ?auto_24745 ) ) ( not ( = ?auto_24740 ?auto_24745 ) ) ( AVAILABLE ?auto_24745 ) ( SURFACE-AT ?auto_24732 ?auto_24736 ) ( ON ?auto_24732 ?auto_24744 ) ( CLEAR ?auto_24732 ) ( not ( = ?auto_24732 ?auto_24744 ) ) ( not ( = ?auto_24733 ?auto_24744 ) ) ( not ( = ?auto_24731 ?auto_24744 ) ) ( not ( = ?auto_24735 ?auto_24744 ) ) ( SURFACE-AT ?auto_24741 ?auto_24734 ) ( CLEAR ?auto_24741 ) ( IS-CRATE ?auto_24731 ) ( not ( = ?auto_24741 ?auto_24731 ) ) ( not ( = ?auto_24732 ?auto_24741 ) ) ( not ( = ?auto_24733 ?auto_24741 ) ) ( not ( = ?auto_24735 ?auto_24741 ) ) ( not ( = ?auto_24744 ?auto_24741 ) ) ( AVAILABLE ?auto_24743 ) ( TRUCK-AT ?auto_24738 ?auto_24746 ) ( not ( = ?auto_24746 ?auto_24734 ) ) ( not ( = ?auto_24739 ?auto_24746 ) ) ( not ( = ?auto_24736 ?auto_24746 ) ) ( HOIST-AT ?auto_24737 ?auto_24746 ) ( not ( = ?auto_24743 ?auto_24737 ) ) ( not ( = ?auto_24740 ?auto_24737 ) ) ( not ( = ?auto_24745 ?auto_24737 ) ) ( AVAILABLE ?auto_24737 ) ( SURFACE-AT ?auto_24731 ?auto_24746 ) ( ON ?auto_24731 ?auto_24742 ) ( CLEAR ?auto_24731 ) ( not ( = ?auto_24732 ?auto_24742 ) ) ( not ( = ?auto_24733 ?auto_24742 ) ) ( not ( = ?auto_24731 ?auto_24742 ) ) ( not ( = ?auto_24735 ?auto_24742 ) ) ( not ( = ?auto_24744 ?auto_24742 ) ) ( not ( = ?auto_24741 ?auto_24742 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24732 ?auto_24733 )
      ( MAKE-2CRATE-VERIFY ?auto_24731 ?auto_24732 ?auto_24733 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24747 - SURFACE
      ?auto_24748 - SURFACE
      ?auto_24749 - SURFACE
      ?auto_24750 - SURFACE
    )
    :vars
    (
      ?auto_24761 - HOIST
      ?auto_24752 - PLACE
      ?auto_24757 - PLACE
      ?auto_24758 - HOIST
      ?auto_24751 - SURFACE
      ?auto_24759 - PLACE
      ?auto_24754 - HOIST
      ?auto_24760 - SURFACE
      ?auto_24762 - TRUCK
      ?auto_24755 - PLACE
      ?auto_24756 - HOIST
      ?auto_24753 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24761 ?auto_24752 ) ( IS-CRATE ?auto_24750 ) ( not ( = ?auto_24749 ?auto_24750 ) ) ( not ( = ?auto_24748 ?auto_24749 ) ) ( not ( = ?auto_24748 ?auto_24750 ) ) ( not ( = ?auto_24757 ?auto_24752 ) ) ( HOIST-AT ?auto_24758 ?auto_24757 ) ( not ( = ?auto_24761 ?auto_24758 ) ) ( AVAILABLE ?auto_24758 ) ( SURFACE-AT ?auto_24750 ?auto_24757 ) ( ON ?auto_24750 ?auto_24751 ) ( CLEAR ?auto_24750 ) ( not ( = ?auto_24749 ?auto_24751 ) ) ( not ( = ?auto_24750 ?auto_24751 ) ) ( not ( = ?auto_24748 ?auto_24751 ) ) ( IS-CRATE ?auto_24749 ) ( not ( = ?auto_24759 ?auto_24752 ) ) ( not ( = ?auto_24757 ?auto_24759 ) ) ( HOIST-AT ?auto_24754 ?auto_24759 ) ( not ( = ?auto_24761 ?auto_24754 ) ) ( not ( = ?auto_24758 ?auto_24754 ) ) ( AVAILABLE ?auto_24754 ) ( SURFACE-AT ?auto_24749 ?auto_24759 ) ( ON ?auto_24749 ?auto_24760 ) ( CLEAR ?auto_24749 ) ( not ( = ?auto_24749 ?auto_24760 ) ) ( not ( = ?auto_24750 ?auto_24760 ) ) ( not ( = ?auto_24748 ?auto_24760 ) ) ( not ( = ?auto_24751 ?auto_24760 ) ) ( SURFACE-AT ?auto_24747 ?auto_24752 ) ( CLEAR ?auto_24747 ) ( IS-CRATE ?auto_24748 ) ( not ( = ?auto_24747 ?auto_24748 ) ) ( not ( = ?auto_24749 ?auto_24747 ) ) ( not ( = ?auto_24750 ?auto_24747 ) ) ( not ( = ?auto_24751 ?auto_24747 ) ) ( not ( = ?auto_24760 ?auto_24747 ) ) ( AVAILABLE ?auto_24761 ) ( TRUCK-AT ?auto_24762 ?auto_24755 ) ( not ( = ?auto_24755 ?auto_24752 ) ) ( not ( = ?auto_24757 ?auto_24755 ) ) ( not ( = ?auto_24759 ?auto_24755 ) ) ( HOIST-AT ?auto_24756 ?auto_24755 ) ( not ( = ?auto_24761 ?auto_24756 ) ) ( not ( = ?auto_24758 ?auto_24756 ) ) ( not ( = ?auto_24754 ?auto_24756 ) ) ( AVAILABLE ?auto_24756 ) ( SURFACE-AT ?auto_24748 ?auto_24755 ) ( ON ?auto_24748 ?auto_24753 ) ( CLEAR ?auto_24748 ) ( not ( = ?auto_24749 ?auto_24753 ) ) ( not ( = ?auto_24750 ?auto_24753 ) ) ( not ( = ?auto_24748 ?auto_24753 ) ) ( not ( = ?auto_24751 ?auto_24753 ) ) ( not ( = ?auto_24760 ?auto_24753 ) ) ( not ( = ?auto_24747 ?auto_24753 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24748 ?auto_24749 ?auto_24750 )
      ( MAKE-3CRATE-VERIFY ?auto_24747 ?auto_24748 ?auto_24749 ?auto_24750 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24763 - SURFACE
      ?auto_24764 - SURFACE
    )
    :vars
    (
      ?auto_24776 - HOIST
      ?auto_24766 - PLACE
      ?auto_24777 - SURFACE
      ?auto_24772 - PLACE
      ?auto_24773 - HOIST
      ?auto_24765 - SURFACE
      ?auto_24774 - PLACE
      ?auto_24768 - HOIST
      ?auto_24775 - SURFACE
      ?auto_24770 - SURFACE
      ?auto_24769 - PLACE
      ?auto_24771 - HOIST
      ?auto_24767 - SURFACE
      ?auto_24778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24776 ?auto_24766 ) ( IS-CRATE ?auto_24764 ) ( not ( = ?auto_24763 ?auto_24764 ) ) ( not ( = ?auto_24777 ?auto_24763 ) ) ( not ( = ?auto_24777 ?auto_24764 ) ) ( not ( = ?auto_24772 ?auto_24766 ) ) ( HOIST-AT ?auto_24773 ?auto_24772 ) ( not ( = ?auto_24776 ?auto_24773 ) ) ( AVAILABLE ?auto_24773 ) ( SURFACE-AT ?auto_24764 ?auto_24772 ) ( ON ?auto_24764 ?auto_24765 ) ( CLEAR ?auto_24764 ) ( not ( = ?auto_24763 ?auto_24765 ) ) ( not ( = ?auto_24764 ?auto_24765 ) ) ( not ( = ?auto_24777 ?auto_24765 ) ) ( IS-CRATE ?auto_24763 ) ( not ( = ?auto_24774 ?auto_24766 ) ) ( not ( = ?auto_24772 ?auto_24774 ) ) ( HOIST-AT ?auto_24768 ?auto_24774 ) ( not ( = ?auto_24776 ?auto_24768 ) ) ( not ( = ?auto_24773 ?auto_24768 ) ) ( AVAILABLE ?auto_24768 ) ( SURFACE-AT ?auto_24763 ?auto_24774 ) ( ON ?auto_24763 ?auto_24775 ) ( CLEAR ?auto_24763 ) ( not ( = ?auto_24763 ?auto_24775 ) ) ( not ( = ?auto_24764 ?auto_24775 ) ) ( not ( = ?auto_24777 ?auto_24775 ) ) ( not ( = ?auto_24765 ?auto_24775 ) ) ( SURFACE-AT ?auto_24770 ?auto_24766 ) ( CLEAR ?auto_24770 ) ( IS-CRATE ?auto_24777 ) ( not ( = ?auto_24770 ?auto_24777 ) ) ( not ( = ?auto_24763 ?auto_24770 ) ) ( not ( = ?auto_24764 ?auto_24770 ) ) ( not ( = ?auto_24765 ?auto_24770 ) ) ( not ( = ?auto_24775 ?auto_24770 ) ) ( AVAILABLE ?auto_24776 ) ( not ( = ?auto_24769 ?auto_24766 ) ) ( not ( = ?auto_24772 ?auto_24769 ) ) ( not ( = ?auto_24774 ?auto_24769 ) ) ( HOIST-AT ?auto_24771 ?auto_24769 ) ( not ( = ?auto_24776 ?auto_24771 ) ) ( not ( = ?auto_24773 ?auto_24771 ) ) ( not ( = ?auto_24768 ?auto_24771 ) ) ( AVAILABLE ?auto_24771 ) ( SURFACE-AT ?auto_24777 ?auto_24769 ) ( ON ?auto_24777 ?auto_24767 ) ( CLEAR ?auto_24777 ) ( not ( = ?auto_24763 ?auto_24767 ) ) ( not ( = ?auto_24764 ?auto_24767 ) ) ( not ( = ?auto_24777 ?auto_24767 ) ) ( not ( = ?auto_24765 ?auto_24767 ) ) ( not ( = ?auto_24775 ?auto_24767 ) ) ( not ( = ?auto_24770 ?auto_24767 ) ) ( TRUCK-AT ?auto_24778 ?auto_24766 ) )
    :subtasks
    ( ( !DRIVE ?auto_24778 ?auto_24766 ?auto_24769 )
      ( MAKE-2CRATE ?auto_24777 ?auto_24763 ?auto_24764 )
      ( MAKE-1CRATE-VERIFY ?auto_24763 ?auto_24764 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24779 - SURFACE
      ?auto_24780 - SURFACE
      ?auto_24781 - SURFACE
    )
    :vars
    (
      ?auto_24783 - HOIST
      ?auto_24786 - PLACE
      ?auto_24792 - PLACE
      ?auto_24790 - HOIST
      ?auto_24785 - SURFACE
      ?auto_24782 - PLACE
      ?auto_24787 - HOIST
      ?auto_24789 - SURFACE
      ?auto_24784 - SURFACE
      ?auto_24791 - PLACE
      ?auto_24788 - HOIST
      ?auto_24794 - SURFACE
      ?auto_24793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24783 ?auto_24786 ) ( IS-CRATE ?auto_24781 ) ( not ( = ?auto_24780 ?auto_24781 ) ) ( not ( = ?auto_24779 ?auto_24780 ) ) ( not ( = ?auto_24779 ?auto_24781 ) ) ( not ( = ?auto_24792 ?auto_24786 ) ) ( HOIST-AT ?auto_24790 ?auto_24792 ) ( not ( = ?auto_24783 ?auto_24790 ) ) ( AVAILABLE ?auto_24790 ) ( SURFACE-AT ?auto_24781 ?auto_24792 ) ( ON ?auto_24781 ?auto_24785 ) ( CLEAR ?auto_24781 ) ( not ( = ?auto_24780 ?auto_24785 ) ) ( not ( = ?auto_24781 ?auto_24785 ) ) ( not ( = ?auto_24779 ?auto_24785 ) ) ( IS-CRATE ?auto_24780 ) ( not ( = ?auto_24782 ?auto_24786 ) ) ( not ( = ?auto_24792 ?auto_24782 ) ) ( HOIST-AT ?auto_24787 ?auto_24782 ) ( not ( = ?auto_24783 ?auto_24787 ) ) ( not ( = ?auto_24790 ?auto_24787 ) ) ( AVAILABLE ?auto_24787 ) ( SURFACE-AT ?auto_24780 ?auto_24782 ) ( ON ?auto_24780 ?auto_24789 ) ( CLEAR ?auto_24780 ) ( not ( = ?auto_24780 ?auto_24789 ) ) ( not ( = ?auto_24781 ?auto_24789 ) ) ( not ( = ?auto_24779 ?auto_24789 ) ) ( not ( = ?auto_24785 ?auto_24789 ) ) ( SURFACE-AT ?auto_24784 ?auto_24786 ) ( CLEAR ?auto_24784 ) ( IS-CRATE ?auto_24779 ) ( not ( = ?auto_24784 ?auto_24779 ) ) ( not ( = ?auto_24780 ?auto_24784 ) ) ( not ( = ?auto_24781 ?auto_24784 ) ) ( not ( = ?auto_24785 ?auto_24784 ) ) ( not ( = ?auto_24789 ?auto_24784 ) ) ( AVAILABLE ?auto_24783 ) ( not ( = ?auto_24791 ?auto_24786 ) ) ( not ( = ?auto_24792 ?auto_24791 ) ) ( not ( = ?auto_24782 ?auto_24791 ) ) ( HOIST-AT ?auto_24788 ?auto_24791 ) ( not ( = ?auto_24783 ?auto_24788 ) ) ( not ( = ?auto_24790 ?auto_24788 ) ) ( not ( = ?auto_24787 ?auto_24788 ) ) ( AVAILABLE ?auto_24788 ) ( SURFACE-AT ?auto_24779 ?auto_24791 ) ( ON ?auto_24779 ?auto_24794 ) ( CLEAR ?auto_24779 ) ( not ( = ?auto_24780 ?auto_24794 ) ) ( not ( = ?auto_24781 ?auto_24794 ) ) ( not ( = ?auto_24779 ?auto_24794 ) ) ( not ( = ?auto_24785 ?auto_24794 ) ) ( not ( = ?auto_24789 ?auto_24794 ) ) ( not ( = ?auto_24784 ?auto_24794 ) ) ( TRUCK-AT ?auto_24793 ?auto_24786 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24780 ?auto_24781 )
      ( MAKE-2CRATE-VERIFY ?auto_24779 ?auto_24780 ?auto_24781 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24795 - SURFACE
      ?auto_24796 - SURFACE
      ?auto_24797 - SURFACE
      ?auto_24798 - SURFACE
    )
    :vars
    (
      ?auto_24809 - HOIST
      ?auto_24802 - PLACE
      ?auto_24806 - PLACE
      ?auto_24800 - HOIST
      ?auto_24805 - SURFACE
      ?auto_24803 - PLACE
      ?auto_24807 - HOIST
      ?auto_24801 - SURFACE
      ?auto_24808 - PLACE
      ?auto_24804 - HOIST
      ?auto_24810 - SURFACE
      ?auto_24799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24809 ?auto_24802 ) ( IS-CRATE ?auto_24798 ) ( not ( = ?auto_24797 ?auto_24798 ) ) ( not ( = ?auto_24796 ?auto_24797 ) ) ( not ( = ?auto_24796 ?auto_24798 ) ) ( not ( = ?auto_24806 ?auto_24802 ) ) ( HOIST-AT ?auto_24800 ?auto_24806 ) ( not ( = ?auto_24809 ?auto_24800 ) ) ( AVAILABLE ?auto_24800 ) ( SURFACE-AT ?auto_24798 ?auto_24806 ) ( ON ?auto_24798 ?auto_24805 ) ( CLEAR ?auto_24798 ) ( not ( = ?auto_24797 ?auto_24805 ) ) ( not ( = ?auto_24798 ?auto_24805 ) ) ( not ( = ?auto_24796 ?auto_24805 ) ) ( IS-CRATE ?auto_24797 ) ( not ( = ?auto_24803 ?auto_24802 ) ) ( not ( = ?auto_24806 ?auto_24803 ) ) ( HOIST-AT ?auto_24807 ?auto_24803 ) ( not ( = ?auto_24809 ?auto_24807 ) ) ( not ( = ?auto_24800 ?auto_24807 ) ) ( AVAILABLE ?auto_24807 ) ( SURFACE-AT ?auto_24797 ?auto_24803 ) ( ON ?auto_24797 ?auto_24801 ) ( CLEAR ?auto_24797 ) ( not ( = ?auto_24797 ?auto_24801 ) ) ( not ( = ?auto_24798 ?auto_24801 ) ) ( not ( = ?auto_24796 ?auto_24801 ) ) ( not ( = ?auto_24805 ?auto_24801 ) ) ( SURFACE-AT ?auto_24795 ?auto_24802 ) ( CLEAR ?auto_24795 ) ( IS-CRATE ?auto_24796 ) ( not ( = ?auto_24795 ?auto_24796 ) ) ( not ( = ?auto_24797 ?auto_24795 ) ) ( not ( = ?auto_24798 ?auto_24795 ) ) ( not ( = ?auto_24805 ?auto_24795 ) ) ( not ( = ?auto_24801 ?auto_24795 ) ) ( AVAILABLE ?auto_24809 ) ( not ( = ?auto_24808 ?auto_24802 ) ) ( not ( = ?auto_24806 ?auto_24808 ) ) ( not ( = ?auto_24803 ?auto_24808 ) ) ( HOIST-AT ?auto_24804 ?auto_24808 ) ( not ( = ?auto_24809 ?auto_24804 ) ) ( not ( = ?auto_24800 ?auto_24804 ) ) ( not ( = ?auto_24807 ?auto_24804 ) ) ( AVAILABLE ?auto_24804 ) ( SURFACE-AT ?auto_24796 ?auto_24808 ) ( ON ?auto_24796 ?auto_24810 ) ( CLEAR ?auto_24796 ) ( not ( = ?auto_24797 ?auto_24810 ) ) ( not ( = ?auto_24798 ?auto_24810 ) ) ( not ( = ?auto_24796 ?auto_24810 ) ) ( not ( = ?auto_24805 ?auto_24810 ) ) ( not ( = ?auto_24801 ?auto_24810 ) ) ( not ( = ?auto_24795 ?auto_24810 ) ) ( TRUCK-AT ?auto_24799 ?auto_24802 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24796 ?auto_24797 ?auto_24798 )
      ( MAKE-3CRATE-VERIFY ?auto_24795 ?auto_24796 ?auto_24797 ?auto_24798 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24825 - SURFACE
      ?auto_24826 - SURFACE
    )
    :vars
    (
      ?auto_24827 - HOIST
      ?auto_24828 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24827 ?auto_24828 ) ( SURFACE-AT ?auto_24825 ?auto_24828 ) ( CLEAR ?auto_24825 ) ( LIFTING ?auto_24827 ?auto_24826 ) ( IS-CRATE ?auto_24826 ) ( not ( = ?auto_24825 ?auto_24826 ) ) )
    :subtasks
    ( ( !DROP ?auto_24827 ?auto_24826 ?auto_24825 ?auto_24828 )
      ( MAKE-1CRATE-VERIFY ?auto_24825 ?auto_24826 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24829 - SURFACE
      ?auto_24830 - SURFACE
      ?auto_24831 - SURFACE
    )
    :vars
    (
      ?auto_24833 - HOIST
      ?auto_24832 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24833 ?auto_24832 ) ( SURFACE-AT ?auto_24830 ?auto_24832 ) ( CLEAR ?auto_24830 ) ( LIFTING ?auto_24833 ?auto_24831 ) ( IS-CRATE ?auto_24831 ) ( not ( = ?auto_24830 ?auto_24831 ) ) ( ON ?auto_24830 ?auto_24829 ) ( not ( = ?auto_24829 ?auto_24830 ) ) ( not ( = ?auto_24829 ?auto_24831 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24830 ?auto_24831 )
      ( MAKE-2CRATE-VERIFY ?auto_24829 ?auto_24830 ?auto_24831 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24834 - SURFACE
      ?auto_24835 - SURFACE
      ?auto_24836 - SURFACE
      ?auto_24837 - SURFACE
    )
    :vars
    (
      ?auto_24839 - HOIST
      ?auto_24838 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24839 ?auto_24838 ) ( SURFACE-AT ?auto_24836 ?auto_24838 ) ( CLEAR ?auto_24836 ) ( LIFTING ?auto_24839 ?auto_24837 ) ( IS-CRATE ?auto_24837 ) ( not ( = ?auto_24836 ?auto_24837 ) ) ( ON ?auto_24835 ?auto_24834 ) ( ON ?auto_24836 ?auto_24835 ) ( not ( = ?auto_24834 ?auto_24835 ) ) ( not ( = ?auto_24834 ?auto_24836 ) ) ( not ( = ?auto_24834 ?auto_24837 ) ) ( not ( = ?auto_24835 ?auto_24836 ) ) ( not ( = ?auto_24835 ?auto_24837 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24836 ?auto_24837 )
      ( MAKE-3CRATE-VERIFY ?auto_24834 ?auto_24835 ?auto_24836 ?auto_24837 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_24840 - SURFACE
      ?auto_24841 - SURFACE
      ?auto_24842 - SURFACE
      ?auto_24843 - SURFACE
      ?auto_24844 - SURFACE
    )
    :vars
    (
      ?auto_24846 - HOIST
      ?auto_24845 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24846 ?auto_24845 ) ( SURFACE-AT ?auto_24843 ?auto_24845 ) ( CLEAR ?auto_24843 ) ( LIFTING ?auto_24846 ?auto_24844 ) ( IS-CRATE ?auto_24844 ) ( not ( = ?auto_24843 ?auto_24844 ) ) ( ON ?auto_24841 ?auto_24840 ) ( ON ?auto_24842 ?auto_24841 ) ( ON ?auto_24843 ?auto_24842 ) ( not ( = ?auto_24840 ?auto_24841 ) ) ( not ( = ?auto_24840 ?auto_24842 ) ) ( not ( = ?auto_24840 ?auto_24843 ) ) ( not ( = ?auto_24840 ?auto_24844 ) ) ( not ( = ?auto_24841 ?auto_24842 ) ) ( not ( = ?auto_24841 ?auto_24843 ) ) ( not ( = ?auto_24841 ?auto_24844 ) ) ( not ( = ?auto_24842 ?auto_24843 ) ) ( not ( = ?auto_24842 ?auto_24844 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24843 ?auto_24844 )
      ( MAKE-4CRATE-VERIFY ?auto_24840 ?auto_24841 ?auto_24842 ?auto_24843 ?auto_24844 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24847 - SURFACE
      ?auto_24848 - SURFACE
    )
    :vars
    (
      ?auto_24850 - HOIST
      ?auto_24849 - PLACE
      ?auto_24851 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24850 ?auto_24849 ) ( SURFACE-AT ?auto_24847 ?auto_24849 ) ( CLEAR ?auto_24847 ) ( IS-CRATE ?auto_24848 ) ( not ( = ?auto_24847 ?auto_24848 ) ) ( TRUCK-AT ?auto_24851 ?auto_24849 ) ( AVAILABLE ?auto_24850 ) ( IN ?auto_24848 ?auto_24851 ) )
    :subtasks
    ( ( !UNLOAD ?auto_24850 ?auto_24848 ?auto_24851 ?auto_24849 )
      ( MAKE-1CRATE ?auto_24847 ?auto_24848 )
      ( MAKE-1CRATE-VERIFY ?auto_24847 ?auto_24848 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24852 - SURFACE
      ?auto_24853 - SURFACE
      ?auto_24854 - SURFACE
    )
    :vars
    (
      ?auto_24857 - HOIST
      ?auto_24856 - PLACE
      ?auto_24855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24857 ?auto_24856 ) ( SURFACE-AT ?auto_24853 ?auto_24856 ) ( CLEAR ?auto_24853 ) ( IS-CRATE ?auto_24854 ) ( not ( = ?auto_24853 ?auto_24854 ) ) ( TRUCK-AT ?auto_24855 ?auto_24856 ) ( AVAILABLE ?auto_24857 ) ( IN ?auto_24854 ?auto_24855 ) ( ON ?auto_24853 ?auto_24852 ) ( not ( = ?auto_24852 ?auto_24853 ) ) ( not ( = ?auto_24852 ?auto_24854 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24853 ?auto_24854 )
      ( MAKE-2CRATE-VERIFY ?auto_24852 ?auto_24853 ?auto_24854 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24858 - SURFACE
      ?auto_24859 - SURFACE
      ?auto_24860 - SURFACE
      ?auto_24861 - SURFACE
    )
    :vars
    (
      ?auto_24864 - HOIST
      ?auto_24863 - PLACE
      ?auto_24862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24864 ?auto_24863 ) ( SURFACE-AT ?auto_24860 ?auto_24863 ) ( CLEAR ?auto_24860 ) ( IS-CRATE ?auto_24861 ) ( not ( = ?auto_24860 ?auto_24861 ) ) ( TRUCK-AT ?auto_24862 ?auto_24863 ) ( AVAILABLE ?auto_24864 ) ( IN ?auto_24861 ?auto_24862 ) ( ON ?auto_24860 ?auto_24859 ) ( not ( = ?auto_24859 ?auto_24860 ) ) ( not ( = ?auto_24859 ?auto_24861 ) ) ( ON ?auto_24859 ?auto_24858 ) ( not ( = ?auto_24858 ?auto_24859 ) ) ( not ( = ?auto_24858 ?auto_24860 ) ) ( not ( = ?auto_24858 ?auto_24861 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24859 ?auto_24860 ?auto_24861 )
      ( MAKE-3CRATE-VERIFY ?auto_24858 ?auto_24859 ?auto_24860 ?auto_24861 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_24865 - SURFACE
      ?auto_24866 - SURFACE
      ?auto_24867 - SURFACE
      ?auto_24868 - SURFACE
      ?auto_24869 - SURFACE
    )
    :vars
    (
      ?auto_24872 - HOIST
      ?auto_24871 - PLACE
      ?auto_24870 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24872 ?auto_24871 ) ( SURFACE-AT ?auto_24868 ?auto_24871 ) ( CLEAR ?auto_24868 ) ( IS-CRATE ?auto_24869 ) ( not ( = ?auto_24868 ?auto_24869 ) ) ( TRUCK-AT ?auto_24870 ?auto_24871 ) ( AVAILABLE ?auto_24872 ) ( IN ?auto_24869 ?auto_24870 ) ( ON ?auto_24868 ?auto_24867 ) ( not ( = ?auto_24867 ?auto_24868 ) ) ( not ( = ?auto_24867 ?auto_24869 ) ) ( ON ?auto_24866 ?auto_24865 ) ( ON ?auto_24867 ?auto_24866 ) ( not ( = ?auto_24865 ?auto_24866 ) ) ( not ( = ?auto_24865 ?auto_24867 ) ) ( not ( = ?auto_24865 ?auto_24868 ) ) ( not ( = ?auto_24865 ?auto_24869 ) ) ( not ( = ?auto_24866 ?auto_24867 ) ) ( not ( = ?auto_24866 ?auto_24868 ) ) ( not ( = ?auto_24866 ?auto_24869 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24867 ?auto_24868 ?auto_24869 )
      ( MAKE-4CRATE-VERIFY ?auto_24865 ?auto_24866 ?auto_24867 ?auto_24868 ?auto_24869 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24873 - SURFACE
      ?auto_24874 - SURFACE
    )
    :vars
    (
      ?auto_24877 - HOIST
      ?auto_24876 - PLACE
      ?auto_24875 - TRUCK
      ?auto_24878 - SURFACE
      ?auto_24879 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24877 ?auto_24876 ) ( SURFACE-AT ?auto_24873 ?auto_24876 ) ( CLEAR ?auto_24873 ) ( IS-CRATE ?auto_24874 ) ( not ( = ?auto_24873 ?auto_24874 ) ) ( AVAILABLE ?auto_24877 ) ( IN ?auto_24874 ?auto_24875 ) ( ON ?auto_24873 ?auto_24878 ) ( not ( = ?auto_24878 ?auto_24873 ) ) ( not ( = ?auto_24878 ?auto_24874 ) ) ( TRUCK-AT ?auto_24875 ?auto_24879 ) ( not ( = ?auto_24879 ?auto_24876 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_24875 ?auto_24879 ?auto_24876 )
      ( MAKE-2CRATE ?auto_24878 ?auto_24873 ?auto_24874 )
      ( MAKE-1CRATE-VERIFY ?auto_24873 ?auto_24874 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24880 - SURFACE
      ?auto_24881 - SURFACE
      ?auto_24882 - SURFACE
    )
    :vars
    (
      ?auto_24886 - HOIST
      ?auto_24885 - PLACE
      ?auto_24883 - TRUCK
      ?auto_24884 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24886 ?auto_24885 ) ( SURFACE-AT ?auto_24881 ?auto_24885 ) ( CLEAR ?auto_24881 ) ( IS-CRATE ?auto_24882 ) ( not ( = ?auto_24881 ?auto_24882 ) ) ( AVAILABLE ?auto_24886 ) ( IN ?auto_24882 ?auto_24883 ) ( ON ?auto_24881 ?auto_24880 ) ( not ( = ?auto_24880 ?auto_24881 ) ) ( not ( = ?auto_24880 ?auto_24882 ) ) ( TRUCK-AT ?auto_24883 ?auto_24884 ) ( not ( = ?auto_24884 ?auto_24885 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24881 ?auto_24882 )
      ( MAKE-2CRATE-VERIFY ?auto_24880 ?auto_24881 ?auto_24882 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24887 - SURFACE
      ?auto_24888 - SURFACE
      ?auto_24889 - SURFACE
      ?auto_24890 - SURFACE
    )
    :vars
    (
      ?auto_24892 - HOIST
      ?auto_24891 - PLACE
      ?auto_24893 - TRUCK
      ?auto_24894 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24892 ?auto_24891 ) ( SURFACE-AT ?auto_24889 ?auto_24891 ) ( CLEAR ?auto_24889 ) ( IS-CRATE ?auto_24890 ) ( not ( = ?auto_24889 ?auto_24890 ) ) ( AVAILABLE ?auto_24892 ) ( IN ?auto_24890 ?auto_24893 ) ( ON ?auto_24889 ?auto_24888 ) ( not ( = ?auto_24888 ?auto_24889 ) ) ( not ( = ?auto_24888 ?auto_24890 ) ) ( TRUCK-AT ?auto_24893 ?auto_24894 ) ( not ( = ?auto_24894 ?auto_24891 ) ) ( ON ?auto_24888 ?auto_24887 ) ( not ( = ?auto_24887 ?auto_24888 ) ) ( not ( = ?auto_24887 ?auto_24889 ) ) ( not ( = ?auto_24887 ?auto_24890 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24888 ?auto_24889 ?auto_24890 )
      ( MAKE-3CRATE-VERIFY ?auto_24887 ?auto_24888 ?auto_24889 ?auto_24890 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_24895 - SURFACE
      ?auto_24896 - SURFACE
      ?auto_24897 - SURFACE
      ?auto_24898 - SURFACE
      ?auto_24899 - SURFACE
    )
    :vars
    (
      ?auto_24901 - HOIST
      ?auto_24900 - PLACE
      ?auto_24902 - TRUCK
      ?auto_24903 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24901 ?auto_24900 ) ( SURFACE-AT ?auto_24898 ?auto_24900 ) ( CLEAR ?auto_24898 ) ( IS-CRATE ?auto_24899 ) ( not ( = ?auto_24898 ?auto_24899 ) ) ( AVAILABLE ?auto_24901 ) ( IN ?auto_24899 ?auto_24902 ) ( ON ?auto_24898 ?auto_24897 ) ( not ( = ?auto_24897 ?auto_24898 ) ) ( not ( = ?auto_24897 ?auto_24899 ) ) ( TRUCK-AT ?auto_24902 ?auto_24903 ) ( not ( = ?auto_24903 ?auto_24900 ) ) ( ON ?auto_24896 ?auto_24895 ) ( ON ?auto_24897 ?auto_24896 ) ( not ( = ?auto_24895 ?auto_24896 ) ) ( not ( = ?auto_24895 ?auto_24897 ) ) ( not ( = ?auto_24895 ?auto_24898 ) ) ( not ( = ?auto_24895 ?auto_24899 ) ) ( not ( = ?auto_24896 ?auto_24897 ) ) ( not ( = ?auto_24896 ?auto_24898 ) ) ( not ( = ?auto_24896 ?auto_24899 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24897 ?auto_24898 ?auto_24899 )
      ( MAKE-4CRATE-VERIFY ?auto_24895 ?auto_24896 ?auto_24897 ?auto_24898 ?auto_24899 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24904 - SURFACE
      ?auto_24905 - SURFACE
    )
    :vars
    (
      ?auto_24908 - HOIST
      ?auto_24906 - PLACE
      ?auto_24907 - SURFACE
      ?auto_24909 - TRUCK
      ?auto_24910 - PLACE
      ?auto_24911 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24908 ?auto_24906 ) ( SURFACE-AT ?auto_24904 ?auto_24906 ) ( CLEAR ?auto_24904 ) ( IS-CRATE ?auto_24905 ) ( not ( = ?auto_24904 ?auto_24905 ) ) ( AVAILABLE ?auto_24908 ) ( ON ?auto_24904 ?auto_24907 ) ( not ( = ?auto_24907 ?auto_24904 ) ) ( not ( = ?auto_24907 ?auto_24905 ) ) ( TRUCK-AT ?auto_24909 ?auto_24910 ) ( not ( = ?auto_24910 ?auto_24906 ) ) ( HOIST-AT ?auto_24911 ?auto_24910 ) ( LIFTING ?auto_24911 ?auto_24905 ) ( not ( = ?auto_24908 ?auto_24911 ) ) )
    :subtasks
    ( ( !LOAD ?auto_24911 ?auto_24905 ?auto_24909 ?auto_24910 )
      ( MAKE-2CRATE ?auto_24907 ?auto_24904 ?auto_24905 )
      ( MAKE-1CRATE-VERIFY ?auto_24904 ?auto_24905 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24912 - SURFACE
      ?auto_24913 - SURFACE
      ?auto_24914 - SURFACE
    )
    :vars
    (
      ?auto_24918 - HOIST
      ?auto_24919 - PLACE
      ?auto_24917 - TRUCK
      ?auto_24916 - PLACE
      ?auto_24915 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24918 ?auto_24919 ) ( SURFACE-AT ?auto_24913 ?auto_24919 ) ( CLEAR ?auto_24913 ) ( IS-CRATE ?auto_24914 ) ( not ( = ?auto_24913 ?auto_24914 ) ) ( AVAILABLE ?auto_24918 ) ( ON ?auto_24913 ?auto_24912 ) ( not ( = ?auto_24912 ?auto_24913 ) ) ( not ( = ?auto_24912 ?auto_24914 ) ) ( TRUCK-AT ?auto_24917 ?auto_24916 ) ( not ( = ?auto_24916 ?auto_24919 ) ) ( HOIST-AT ?auto_24915 ?auto_24916 ) ( LIFTING ?auto_24915 ?auto_24914 ) ( not ( = ?auto_24918 ?auto_24915 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24913 ?auto_24914 )
      ( MAKE-2CRATE-VERIFY ?auto_24912 ?auto_24913 ?auto_24914 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24920 - SURFACE
      ?auto_24921 - SURFACE
      ?auto_24922 - SURFACE
      ?auto_24923 - SURFACE
    )
    :vars
    (
      ?auto_24927 - HOIST
      ?auto_24926 - PLACE
      ?auto_24928 - TRUCK
      ?auto_24925 - PLACE
      ?auto_24924 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24927 ?auto_24926 ) ( SURFACE-AT ?auto_24922 ?auto_24926 ) ( CLEAR ?auto_24922 ) ( IS-CRATE ?auto_24923 ) ( not ( = ?auto_24922 ?auto_24923 ) ) ( AVAILABLE ?auto_24927 ) ( ON ?auto_24922 ?auto_24921 ) ( not ( = ?auto_24921 ?auto_24922 ) ) ( not ( = ?auto_24921 ?auto_24923 ) ) ( TRUCK-AT ?auto_24928 ?auto_24925 ) ( not ( = ?auto_24925 ?auto_24926 ) ) ( HOIST-AT ?auto_24924 ?auto_24925 ) ( LIFTING ?auto_24924 ?auto_24923 ) ( not ( = ?auto_24927 ?auto_24924 ) ) ( ON ?auto_24921 ?auto_24920 ) ( not ( = ?auto_24920 ?auto_24921 ) ) ( not ( = ?auto_24920 ?auto_24922 ) ) ( not ( = ?auto_24920 ?auto_24923 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24921 ?auto_24922 ?auto_24923 )
      ( MAKE-3CRATE-VERIFY ?auto_24920 ?auto_24921 ?auto_24922 ?auto_24923 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_24929 - SURFACE
      ?auto_24930 - SURFACE
      ?auto_24931 - SURFACE
      ?auto_24932 - SURFACE
      ?auto_24933 - SURFACE
    )
    :vars
    (
      ?auto_24937 - HOIST
      ?auto_24936 - PLACE
      ?auto_24938 - TRUCK
      ?auto_24935 - PLACE
      ?auto_24934 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_24937 ?auto_24936 ) ( SURFACE-AT ?auto_24932 ?auto_24936 ) ( CLEAR ?auto_24932 ) ( IS-CRATE ?auto_24933 ) ( not ( = ?auto_24932 ?auto_24933 ) ) ( AVAILABLE ?auto_24937 ) ( ON ?auto_24932 ?auto_24931 ) ( not ( = ?auto_24931 ?auto_24932 ) ) ( not ( = ?auto_24931 ?auto_24933 ) ) ( TRUCK-AT ?auto_24938 ?auto_24935 ) ( not ( = ?auto_24935 ?auto_24936 ) ) ( HOIST-AT ?auto_24934 ?auto_24935 ) ( LIFTING ?auto_24934 ?auto_24933 ) ( not ( = ?auto_24937 ?auto_24934 ) ) ( ON ?auto_24930 ?auto_24929 ) ( ON ?auto_24931 ?auto_24930 ) ( not ( = ?auto_24929 ?auto_24930 ) ) ( not ( = ?auto_24929 ?auto_24931 ) ) ( not ( = ?auto_24929 ?auto_24932 ) ) ( not ( = ?auto_24929 ?auto_24933 ) ) ( not ( = ?auto_24930 ?auto_24931 ) ) ( not ( = ?auto_24930 ?auto_24932 ) ) ( not ( = ?auto_24930 ?auto_24933 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24931 ?auto_24932 ?auto_24933 )
      ( MAKE-4CRATE-VERIFY ?auto_24929 ?auto_24930 ?auto_24931 ?auto_24932 ?auto_24933 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24939 - SURFACE
      ?auto_24940 - SURFACE
    )
    :vars
    (
      ?auto_24945 - HOIST
      ?auto_24944 - PLACE
      ?auto_24943 - SURFACE
      ?auto_24946 - TRUCK
      ?auto_24942 - PLACE
      ?auto_24941 - HOIST
      ?auto_24947 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24945 ?auto_24944 ) ( SURFACE-AT ?auto_24939 ?auto_24944 ) ( CLEAR ?auto_24939 ) ( IS-CRATE ?auto_24940 ) ( not ( = ?auto_24939 ?auto_24940 ) ) ( AVAILABLE ?auto_24945 ) ( ON ?auto_24939 ?auto_24943 ) ( not ( = ?auto_24943 ?auto_24939 ) ) ( not ( = ?auto_24943 ?auto_24940 ) ) ( TRUCK-AT ?auto_24946 ?auto_24942 ) ( not ( = ?auto_24942 ?auto_24944 ) ) ( HOIST-AT ?auto_24941 ?auto_24942 ) ( not ( = ?auto_24945 ?auto_24941 ) ) ( AVAILABLE ?auto_24941 ) ( SURFACE-AT ?auto_24940 ?auto_24942 ) ( ON ?auto_24940 ?auto_24947 ) ( CLEAR ?auto_24940 ) ( not ( = ?auto_24939 ?auto_24947 ) ) ( not ( = ?auto_24940 ?auto_24947 ) ) ( not ( = ?auto_24943 ?auto_24947 ) ) )
    :subtasks
    ( ( !LIFT ?auto_24941 ?auto_24940 ?auto_24947 ?auto_24942 )
      ( MAKE-2CRATE ?auto_24943 ?auto_24939 ?auto_24940 )
      ( MAKE-1CRATE-VERIFY ?auto_24939 ?auto_24940 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24948 - SURFACE
      ?auto_24949 - SURFACE
      ?auto_24950 - SURFACE
    )
    :vars
    (
      ?auto_24955 - HOIST
      ?auto_24954 - PLACE
      ?auto_24953 - TRUCK
      ?auto_24952 - PLACE
      ?auto_24956 - HOIST
      ?auto_24951 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24955 ?auto_24954 ) ( SURFACE-AT ?auto_24949 ?auto_24954 ) ( CLEAR ?auto_24949 ) ( IS-CRATE ?auto_24950 ) ( not ( = ?auto_24949 ?auto_24950 ) ) ( AVAILABLE ?auto_24955 ) ( ON ?auto_24949 ?auto_24948 ) ( not ( = ?auto_24948 ?auto_24949 ) ) ( not ( = ?auto_24948 ?auto_24950 ) ) ( TRUCK-AT ?auto_24953 ?auto_24952 ) ( not ( = ?auto_24952 ?auto_24954 ) ) ( HOIST-AT ?auto_24956 ?auto_24952 ) ( not ( = ?auto_24955 ?auto_24956 ) ) ( AVAILABLE ?auto_24956 ) ( SURFACE-AT ?auto_24950 ?auto_24952 ) ( ON ?auto_24950 ?auto_24951 ) ( CLEAR ?auto_24950 ) ( not ( = ?auto_24949 ?auto_24951 ) ) ( not ( = ?auto_24950 ?auto_24951 ) ) ( not ( = ?auto_24948 ?auto_24951 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24949 ?auto_24950 )
      ( MAKE-2CRATE-VERIFY ?auto_24948 ?auto_24949 ?auto_24950 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24957 - SURFACE
      ?auto_24958 - SURFACE
      ?auto_24959 - SURFACE
      ?auto_24960 - SURFACE
    )
    :vars
    (
      ?auto_24966 - HOIST
      ?auto_24965 - PLACE
      ?auto_24962 - TRUCK
      ?auto_24963 - PLACE
      ?auto_24961 - HOIST
      ?auto_24964 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24966 ?auto_24965 ) ( SURFACE-AT ?auto_24959 ?auto_24965 ) ( CLEAR ?auto_24959 ) ( IS-CRATE ?auto_24960 ) ( not ( = ?auto_24959 ?auto_24960 ) ) ( AVAILABLE ?auto_24966 ) ( ON ?auto_24959 ?auto_24958 ) ( not ( = ?auto_24958 ?auto_24959 ) ) ( not ( = ?auto_24958 ?auto_24960 ) ) ( TRUCK-AT ?auto_24962 ?auto_24963 ) ( not ( = ?auto_24963 ?auto_24965 ) ) ( HOIST-AT ?auto_24961 ?auto_24963 ) ( not ( = ?auto_24966 ?auto_24961 ) ) ( AVAILABLE ?auto_24961 ) ( SURFACE-AT ?auto_24960 ?auto_24963 ) ( ON ?auto_24960 ?auto_24964 ) ( CLEAR ?auto_24960 ) ( not ( = ?auto_24959 ?auto_24964 ) ) ( not ( = ?auto_24960 ?auto_24964 ) ) ( not ( = ?auto_24958 ?auto_24964 ) ) ( ON ?auto_24958 ?auto_24957 ) ( not ( = ?auto_24957 ?auto_24958 ) ) ( not ( = ?auto_24957 ?auto_24959 ) ) ( not ( = ?auto_24957 ?auto_24960 ) ) ( not ( = ?auto_24957 ?auto_24964 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24958 ?auto_24959 ?auto_24960 )
      ( MAKE-3CRATE-VERIFY ?auto_24957 ?auto_24958 ?auto_24959 ?auto_24960 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_24967 - SURFACE
      ?auto_24968 - SURFACE
      ?auto_24969 - SURFACE
      ?auto_24970 - SURFACE
      ?auto_24971 - SURFACE
    )
    :vars
    (
      ?auto_24977 - HOIST
      ?auto_24976 - PLACE
      ?auto_24973 - TRUCK
      ?auto_24974 - PLACE
      ?auto_24972 - HOIST
      ?auto_24975 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_24977 ?auto_24976 ) ( SURFACE-AT ?auto_24970 ?auto_24976 ) ( CLEAR ?auto_24970 ) ( IS-CRATE ?auto_24971 ) ( not ( = ?auto_24970 ?auto_24971 ) ) ( AVAILABLE ?auto_24977 ) ( ON ?auto_24970 ?auto_24969 ) ( not ( = ?auto_24969 ?auto_24970 ) ) ( not ( = ?auto_24969 ?auto_24971 ) ) ( TRUCK-AT ?auto_24973 ?auto_24974 ) ( not ( = ?auto_24974 ?auto_24976 ) ) ( HOIST-AT ?auto_24972 ?auto_24974 ) ( not ( = ?auto_24977 ?auto_24972 ) ) ( AVAILABLE ?auto_24972 ) ( SURFACE-AT ?auto_24971 ?auto_24974 ) ( ON ?auto_24971 ?auto_24975 ) ( CLEAR ?auto_24971 ) ( not ( = ?auto_24970 ?auto_24975 ) ) ( not ( = ?auto_24971 ?auto_24975 ) ) ( not ( = ?auto_24969 ?auto_24975 ) ) ( ON ?auto_24968 ?auto_24967 ) ( ON ?auto_24969 ?auto_24968 ) ( not ( = ?auto_24967 ?auto_24968 ) ) ( not ( = ?auto_24967 ?auto_24969 ) ) ( not ( = ?auto_24967 ?auto_24970 ) ) ( not ( = ?auto_24967 ?auto_24971 ) ) ( not ( = ?auto_24967 ?auto_24975 ) ) ( not ( = ?auto_24968 ?auto_24969 ) ) ( not ( = ?auto_24968 ?auto_24970 ) ) ( not ( = ?auto_24968 ?auto_24971 ) ) ( not ( = ?auto_24968 ?auto_24975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24969 ?auto_24970 ?auto_24971 )
      ( MAKE-4CRATE-VERIFY ?auto_24967 ?auto_24968 ?auto_24969 ?auto_24970 ?auto_24971 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_24978 - SURFACE
      ?auto_24979 - SURFACE
    )
    :vars
    (
      ?auto_24986 - HOIST
      ?auto_24985 - PLACE
      ?auto_24982 - SURFACE
      ?auto_24983 - PLACE
      ?auto_24980 - HOIST
      ?auto_24984 - SURFACE
      ?auto_24981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24986 ?auto_24985 ) ( SURFACE-AT ?auto_24978 ?auto_24985 ) ( CLEAR ?auto_24978 ) ( IS-CRATE ?auto_24979 ) ( not ( = ?auto_24978 ?auto_24979 ) ) ( AVAILABLE ?auto_24986 ) ( ON ?auto_24978 ?auto_24982 ) ( not ( = ?auto_24982 ?auto_24978 ) ) ( not ( = ?auto_24982 ?auto_24979 ) ) ( not ( = ?auto_24983 ?auto_24985 ) ) ( HOIST-AT ?auto_24980 ?auto_24983 ) ( not ( = ?auto_24986 ?auto_24980 ) ) ( AVAILABLE ?auto_24980 ) ( SURFACE-AT ?auto_24979 ?auto_24983 ) ( ON ?auto_24979 ?auto_24984 ) ( CLEAR ?auto_24979 ) ( not ( = ?auto_24978 ?auto_24984 ) ) ( not ( = ?auto_24979 ?auto_24984 ) ) ( not ( = ?auto_24982 ?auto_24984 ) ) ( TRUCK-AT ?auto_24981 ?auto_24985 ) )
    :subtasks
    ( ( !DRIVE ?auto_24981 ?auto_24985 ?auto_24983 )
      ( MAKE-2CRATE ?auto_24982 ?auto_24978 ?auto_24979 )
      ( MAKE-1CRATE-VERIFY ?auto_24978 ?auto_24979 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_24987 - SURFACE
      ?auto_24988 - SURFACE
      ?auto_24989 - SURFACE
    )
    :vars
    (
      ?auto_24992 - HOIST
      ?auto_24995 - PLACE
      ?auto_24993 - PLACE
      ?auto_24991 - HOIST
      ?auto_24990 - SURFACE
      ?auto_24994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24992 ?auto_24995 ) ( SURFACE-AT ?auto_24988 ?auto_24995 ) ( CLEAR ?auto_24988 ) ( IS-CRATE ?auto_24989 ) ( not ( = ?auto_24988 ?auto_24989 ) ) ( AVAILABLE ?auto_24992 ) ( ON ?auto_24988 ?auto_24987 ) ( not ( = ?auto_24987 ?auto_24988 ) ) ( not ( = ?auto_24987 ?auto_24989 ) ) ( not ( = ?auto_24993 ?auto_24995 ) ) ( HOIST-AT ?auto_24991 ?auto_24993 ) ( not ( = ?auto_24992 ?auto_24991 ) ) ( AVAILABLE ?auto_24991 ) ( SURFACE-AT ?auto_24989 ?auto_24993 ) ( ON ?auto_24989 ?auto_24990 ) ( CLEAR ?auto_24989 ) ( not ( = ?auto_24988 ?auto_24990 ) ) ( not ( = ?auto_24989 ?auto_24990 ) ) ( not ( = ?auto_24987 ?auto_24990 ) ) ( TRUCK-AT ?auto_24994 ?auto_24995 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_24988 ?auto_24989 )
      ( MAKE-2CRATE-VERIFY ?auto_24987 ?auto_24988 ?auto_24989 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_24996 - SURFACE
      ?auto_24997 - SURFACE
      ?auto_24998 - SURFACE
      ?auto_24999 - SURFACE
    )
    :vars
    (
      ?auto_25000 - HOIST
      ?auto_25004 - PLACE
      ?auto_25002 - PLACE
      ?auto_25001 - HOIST
      ?auto_25003 - SURFACE
      ?auto_25005 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25000 ?auto_25004 ) ( SURFACE-AT ?auto_24998 ?auto_25004 ) ( CLEAR ?auto_24998 ) ( IS-CRATE ?auto_24999 ) ( not ( = ?auto_24998 ?auto_24999 ) ) ( AVAILABLE ?auto_25000 ) ( ON ?auto_24998 ?auto_24997 ) ( not ( = ?auto_24997 ?auto_24998 ) ) ( not ( = ?auto_24997 ?auto_24999 ) ) ( not ( = ?auto_25002 ?auto_25004 ) ) ( HOIST-AT ?auto_25001 ?auto_25002 ) ( not ( = ?auto_25000 ?auto_25001 ) ) ( AVAILABLE ?auto_25001 ) ( SURFACE-AT ?auto_24999 ?auto_25002 ) ( ON ?auto_24999 ?auto_25003 ) ( CLEAR ?auto_24999 ) ( not ( = ?auto_24998 ?auto_25003 ) ) ( not ( = ?auto_24999 ?auto_25003 ) ) ( not ( = ?auto_24997 ?auto_25003 ) ) ( TRUCK-AT ?auto_25005 ?auto_25004 ) ( ON ?auto_24997 ?auto_24996 ) ( not ( = ?auto_24996 ?auto_24997 ) ) ( not ( = ?auto_24996 ?auto_24998 ) ) ( not ( = ?auto_24996 ?auto_24999 ) ) ( not ( = ?auto_24996 ?auto_25003 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_24997 ?auto_24998 ?auto_24999 )
      ( MAKE-3CRATE-VERIFY ?auto_24996 ?auto_24997 ?auto_24998 ?auto_24999 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25006 - SURFACE
      ?auto_25007 - SURFACE
      ?auto_25008 - SURFACE
      ?auto_25009 - SURFACE
      ?auto_25010 - SURFACE
    )
    :vars
    (
      ?auto_25011 - HOIST
      ?auto_25015 - PLACE
      ?auto_25013 - PLACE
      ?auto_25012 - HOIST
      ?auto_25014 - SURFACE
      ?auto_25016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25011 ?auto_25015 ) ( SURFACE-AT ?auto_25009 ?auto_25015 ) ( CLEAR ?auto_25009 ) ( IS-CRATE ?auto_25010 ) ( not ( = ?auto_25009 ?auto_25010 ) ) ( AVAILABLE ?auto_25011 ) ( ON ?auto_25009 ?auto_25008 ) ( not ( = ?auto_25008 ?auto_25009 ) ) ( not ( = ?auto_25008 ?auto_25010 ) ) ( not ( = ?auto_25013 ?auto_25015 ) ) ( HOIST-AT ?auto_25012 ?auto_25013 ) ( not ( = ?auto_25011 ?auto_25012 ) ) ( AVAILABLE ?auto_25012 ) ( SURFACE-AT ?auto_25010 ?auto_25013 ) ( ON ?auto_25010 ?auto_25014 ) ( CLEAR ?auto_25010 ) ( not ( = ?auto_25009 ?auto_25014 ) ) ( not ( = ?auto_25010 ?auto_25014 ) ) ( not ( = ?auto_25008 ?auto_25014 ) ) ( TRUCK-AT ?auto_25016 ?auto_25015 ) ( ON ?auto_25007 ?auto_25006 ) ( ON ?auto_25008 ?auto_25007 ) ( not ( = ?auto_25006 ?auto_25007 ) ) ( not ( = ?auto_25006 ?auto_25008 ) ) ( not ( = ?auto_25006 ?auto_25009 ) ) ( not ( = ?auto_25006 ?auto_25010 ) ) ( not ( = ?auto_25006 ?auto_25014 ) ) ( not ( = ?auto_25007 ?auto_25008 ) ) ( not ( = ?auto_25007 ?auto_25009 ) ) ( not ( = ?auto_25007 ?auto_25010 ) ) ( not ( = ?auto_25007 ?auto_25014 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25008 ?auto_25009 ?auto_25010 )
      ( MAKE-4CRATE-VERIFY ?auto_25006 ?auto_25007 ?auto_25008 ?auto_25009 ?auto_25010 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25017 - SURFACE
      ?auto_25018 - SURFACE
    )
    :vars
    (
      ?auto_25020 - HOIST
      ?auto_25024 - PLACE
      ?auto_25019 - SURFACE
      ?auto_25022 - PLACE
      ?auto_25021 - HOIST
      ?auto_25023 - SURFACE
      ?auto_25025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25020 ?auto_25024 ) ( IS-CRATE ?auto_25018 ) ( not ( = ?auto_25017 ?auto_25018 ) ) ( not ( = ?auto_25019 ?auto_25017 ) ) ( not ( = ?auto_25019 ?auto_25018 ) ) ( not ( = ?auto_25022 ?auto_25024 ) ) ( HOIST-AT ?auto_25021 ?auto_25022 ) ( not ( = ?auto_25020 ?auto_25021 ) ) ( AVAILABLE ?auto_25021 ) ( SURFACE-AT ?auto_25018 ?auto_25022 ) ( ON ?auto_25018 ?auto_25023 ) ( CLEAR ?auto_25018 ) ( not ( = ?auto_25017 ?auto_25023 ) ) ( not ( = ?auto_25018 ?auto_25023 ) ) ( not ( = ?auto_25019 ?auto_25023 ) ) ( TRUCK-AT ?auto_25025 ?auto_25024 ) ( SURFACE-AT ?auto_25019 ?auto_25024 ) ( CLEAR ?auto_25019 ) ( LIFTING ?auto_25020 ?auto_25017 ) ( IS-CRATE ?auto_25017 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25019 ?auto_25017 )
      ( MAKE-2CRATE ?auto_25019 ?auto_25017 ?auto_25018 )
      ( MAKE-1CRATE-VERIFY ?auto_25017 ?auto_25018 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25026 - SURFACE
      ?auto_25027 - SURFACE
      ?auto_25028 - SURFACE
    )
    :vars
    (
      ?auto_25029 - HOIST
      ?auto_25034 - PLACE
      ?auto_25030 - PLACE
      ?auto_25031 - HOIST
      ?auto_25033 - SURFACE
      ?auto_25032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25029 ?auto_25034 ) ( IS-CRATE ?auto_25028 ) ( not ( = ?auto_25027 ?auto_25028 ) ) ( not ( = ?auto_25026 ?auto_25027 ) ) ( not ( = ?auto_25026 ?auto_25028 ) ) ( not ( = ?auto_25030 ?auto_25034 ) ) ( HOIST-AT ?auto_25031 ?auto_25030 ) ( not ( = ?auto_25029 ?auto_25031 ) ) ( AVAILABLE ?auto_25031 ) ( SURFACE-AT ?auto_25028 ?auto_25030 ) ( ON ?auto_25028 ?auto_25033 ) ( CLEAR ?auto_25028 ) ( not ( = ?auto_25027 ?auto_25033 ) ) ( not ( = ?auto_25028 ?auto_25033 ) ) ( not ( = ?auto_25026 ?auto_25033 ) ) ( TRUCK-AT ?auto_25032 ?auto_25034 ) ( SURFACE-AT ?auto_25026 ?auto_25034 ) ( CLEAR ?auto_25026 ) ( LIFTING ?auto_25029 ?auto_25027 ) ( IS-CRATE ?auto_25027 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25027 ?auto_25028 )
      ( MAKE-2CRATE-VERIFY ?auto_25026 ?auto_25027 ?auto_25028 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25035 - SURFACE
      ?auto_25036 - SURFACE
      ?auto_25037 - SURFACE
      ?auto_25038 - SURFACE
    )
    :vars
    (
      ?auto_25040 - HOIST
      ?auto_25043 - PLACE
      ?auto_25041 - PLACE
      ?auto_25042 - HOIST
      ?auto_25044 - SURFACE
      ?auto_25039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25040 ?auto_25043 ) ( IS-CRATE ?auto_25038 ) ( not ( = ?auto_25037 ?auto_25038 ) ) ( not ( = ?auto_25036 ?auto_25037 ) ) ( not ( = ?auto_25036 ?auto_25038 ) ) ( not ( = ?auto_25041 ?auto_25043 ) ) ( HOIST-AT ?auto_25042 ?auto_25041 ) ( not ( = ?auto_25040 ?auto_25042 ) ) ( AVAILABLE ?auto_25042 ) ( SURFACE-AT ?auto_25038 ?auto_25041 ) ( ON ?auto_25038 ?auto_25044 ) ( CLEAR ?auto_25038 ) ( not ( = ?auto_25037 ?auto_25044 ) ) ( not ( = ?auto_25038 ?auto_25044 ) ) ( not ( = ?auto_25036 ?auto_25044 ) ) ( TRUCK-AT ?auto_25039 ?auto_25043 ) ( SURFACE-AT ?auto_25036 ?auto_25043 ) ( CLEAR ?auto_25036 ) ( LIFTING ?auto_25040 ?auto_25037 ) ( IS-CRATE ?auto_25037 ) ( ON ?auto_25036 ?auto_25035 ) ( not ( = ?auto_25035 ?auto_25036 ) ) ( not ( = ?auto_25035 ?auto_25037 ) ) ( not ( = ?auto_25035 ?auto_25038 ) ) ( not ( = ?auto_25035 ?auto_25044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25036 ?auto_25037 ?auto_25038 )
      ( MAKE-3CRATE-VERIFY ?auto_25035 ?auto_25036 ?auto_25037 ?auto_25038 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25045 - SURFACE
      ?auto_25046 - SURFACE
      ?auto_25047 - SURFACE
      ?auto_25048 - SURFACE
      ?auto_25049 - SURFACE
    )
    :vars
    (
      ?auto_25051 - HOIST
      ?auto_25054 - PLACE
      ?auto_25052 - PLACE
      ?auto_25053 - HOIST
      ?auto_25055 - SURFACE
      ?auto_25050 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25051 ?auto_25054 ) ( IS-CRATE ?auto_25049 ) ( not ( = ?auto_25048 ?auto_25049 ) ) ( not ( = ?auto_25047 ?auto_25048 ) ) ( not ( = ?auto_25047 ?auto_25049 ) ) ( not ( = ?auto_25052 ?auto_25054 ) ) ( HOIST-AT ?auto_25053 ?auto_25052 ) ( not ( = ?auto_25051 ?auto_25053 ) ) ( AVAILABLE ?auto_25053 ) ( SURFACE-AT ?auto_25049 ?auto_25052 ) ( ON ?auto_25049 ?auto_25055 ) ( CLEAR ?auto_25049 ) ( not ( = ?auto_25048 ?auto_25055 ) ) ( not ( = ?auto_25049 ?auto_25055 ) ) ( not ( = ?auto_25047 ?auto_25055 ) ) ( TRUCK-AT ?auto_25050 ?auto_25054 ) ( SURFACE-AT ?auto_25047 ?auto_25054 ) ( CLEAR ?auto_25047 ) ( LIFTING ?auto_25051 ?auto_25048 ) ( IS-CRATE ?auto_25048 ) ( ON ?auto_25046 ?auto_25045 ) ( ON ?auto_25047 ?auto_25046 ) ( not ( = ?auto_25045 ?auto_25046 ) ) ( not ( = ?auto_25045 ?auto_25047 ) ) ( not ( = ?auto_25045 ?auto_25048 ) ) ( not ( = ?auto_25045 ?auto_25049 ) ) ( not ( = ?auto_25045 ?auto_25055 ) ) ( not ( = ?auto_25046 ?auto_25047 ) ) ( not ( = ?auto_25046 ?auto_25048 ) ) ( not ( = ?auto_25046 ?auto_25049 ) ) ( not ( = ?auto_25046 ?auto_25055 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25047 ?auto_25048 ?auto_25049 )
      ( MAKE-4CRATE-VERIFY ?auto_25045 ?auto_25046 ?auto_25047 ?auto_25048 ?auto_25049 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25056 - SURFACE
      ?auto_25057 - SURFACE
    )
    :vars
    (
      ?auto_25059 - HOIST
      ?auto_25062 - PLACE
      ?auto_25064 - SURFACE
      ?auto_25060 - PLACE
      ?auto_25061 - HOIST
      ?auto_25063 - SURFACE
      ?auto_25058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25059 ?auto_25062 ) ( IS-CRATE ?auto_25057 ) ( not ( = ?auto_25056 ?auto_25057 ) ) ( not ( = ?auto_25064 ?auto_25056 ) ) ( not ( = ?auto_25064 ?auto_25057 ) ) ( not ( = ?auto_25060 ?auto_25062 ) ) ( HOIST-AT ?auto_25061 ?auto_25060 ) ( not ( = ?auto_25059 ?auto_25061 ) ) ( AVAILABLE ?auto_25061 ) ( SURFACE-AT ?auto_25057 ?auto_25060 ) ( ON ?auto_25057 ?auto_25063 ) ( CLEAR ?auto_25057 ) ( not ( = ?auto_25056 ?auto_25063 ) ) ( not ( = ?auto_25057 ?auto_25063 ) ) ( not ( = ?auto_25064 ?auto_25063 ) ) ( TRUCK-AT ?auto_25058 ?auto_25062 ) ( SURFACE-AT ?auto_25064 ?auto_25062 ) ( CLEAR ?auto_25064 ) ( IS-CRATE ?auto_25056 ) ( AVAILABLE ?auto_25059 ) ( IN ?auto_25056 ?auto_25058 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25059 ?auto_25056 ?auto_25058 ?auto_25062 )
      ( MAKE-2CRATE ?auto_25064 ?auto_25056 ?auto_25057 )
      ( MAKE-1CRATE-VERIFY ?auto_25056 ?auto_25057 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25065 - SURFACE
      ?auto_25066 - SURFACE
      ?auto_25067 - SURFACE
    )
    :vars
    (
      ?auto_25072 - HOIST
      ?auto_25073 - PLACE
      ?auto_25069 - PLACE
      ?auto_25071 - HOIST
      ?auto_25070 - SURFACE
      ?auto_25068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25072 ?auto_25073 ) ( IS-CRATE ?auto_25067 ) ( not ( = ?auto_25066 ?auto_25067 ) ) ( not ( = ?auto_25065 ?auto_25066 ) ) ( not ( = ?auto_25065 ?auto_25067 ) ) ( not ( = ?auto_25069 ?auto_25073 ) ) ( HOIST-AT ?auto_25071 ?auto_25069 ) ( not ( = ?auto_25072 ?auto_25071 ) ) ( AVAILABLE ?auto_25071 ) ( SURFACE-AT ?auto_25067 ?auto_25069 ) ( ON ?auto_25067 ?auto_25070 ) ( CLEAR ?auto_25067 ) ( not ( = ?auto_25066 ?auto_25070 ) ) ( not ( = ?auto_25067 ?auto_25070 ) ) ( not ( = ?auto_25065 ?auto_25070 ) ) ( TRUCK-AT ?auto_25068 ?auto_25073 ) ( SURFACE-AT ?auto_25065 ?auto_25073 ) ( CLEAR ?auto_25065 ) ( IS-CRATE ?auto_25066 ) ( AVAILABLE ?auto_25072 ) ( IN ?auto_25066 ?auto_25068 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25066 ?auto_25067 )
      ( MAKE-2CRATE-VERIFY ?auto_25065 ?auto_25066 ?auto_25067 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25074 - SURFACE
      ?auto_25075 - SURFACE
      ?auto_25076 - SURFACE
      ?auto_25077 - SURFACE
    )
    :vars
    (
      ?auto_25079 - HOIST
      ?auto_25082 - PLACE
      ?auto_25083 - PLACE
      ?auto_25078 - HOIST
      ?auto_25081 - SURFACE
      ?auto_25080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25079 ?auto_25082 ) ( IS-CRATE ?auto_25077 ) ( not ( = ?auto_25076 ?auto_25077 ) ) ( not ( = ?auto_25075 ?auto_25076 ) ) ( not ( = ?auto_25075 ?auto_25077 ) ) ( not ( = ?auto_25083 ?auto_25082 ) ) ( HOIST-AT ?auto_25078 ?auto_25083 ) ( not ( = ?auto_25079 ?auto_25078 ) ) ( AVAILABLE ?auto_25078 ) ( SURFACE-AT ?auto_25077 ?auto_25083 ) ( ON ?auto_25077 ?auto_25081 ) ( CLEAR ?auto_25077 ) ( not ( = ?auto_25076 ?auto_25081 ) ) ( not ( = ?auto_25077 ?auto_25081 ) ) ( not ( = ?auto_25075 ?auto_25081 ) ) ( TRUCK-AT ?auto_25080 ?auto_25082 ) ( SURFACE-AT ?auto_25075 ?auto_25082 ) ( CLEAR ?auto_25075 ) ( IS-CRATE ?auto_25076 ) ( AVAILABLE ?auto_25079 ) ( IN ?auto_25076 ?auto_25080 ) ( ON ?auto_25075 ?auto_25074 ) ( not ( = ?auto_25074 ?auto_25075 ) ) ( not ( = ?auto_25074 ?auto_25076 ) ) ( not ( = ?auto_25074 ?auto_25077 ) ) ( not ( = ?auto_25074 ?auto_25081 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25075 ?auto_25076 ?auto_25077 )
      ( MAKE-3CRATE-VERIFY ?auto_25074 ?auto_25075 ?auto_25076 ?auto_25077 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25084 - SURFACE
      ?auto_25085 - SURFACE
      ?auto_25086 - SURFACE
      ?auto_25087 - SURFACE
      ?auto_25088 - SURFACE
    )
    :vars
    (
      ?auto_25090 - HOIST
      ?auto_25093 - PLACE
      ?auto_25094 - PLACE
      ?auto_25089 - HOIST
      ?auto_25092 - SURFACE
      ?auto_25091 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25090 ?auto_25093 ) ( IS-CRATE ?auto_25088 ) ( not ( = ?auto_25087 ?auto_25088 ) ) ( not ( = ?auto_25086 ?auto_25087 ) ) ( not ( = ?auto_25086 ?auto_25088 ) ) ( not ( = ?auto_25094 ?auto_25093 ) ) ( HOIST-AT ?auto_25089 ?auto_25094 ) ( not ( = ?auto_25090 ?auto_25089 ) ) ( AVAILABLE ?auto_25089 ) ( SURFACE-AT ?auto_25088 ?auto_25094 ) ( ON ?auto_25088 ?auto_25092 ) ( CLEAR ?auto_25088 ) ( not ( = ?auto_25087 ?auto_25092 ) ) ( not ( = ?auto_25088 ?auto_25092 ) ) ( not ( = ?auto_25086 ?auto_25092 ) ) ( TRUCK-AT ?auto_25091 ?auto_25093 ) ( SURFACE-AT ?auto_25086 ?auto_25093 ) ( CLEAR ?auto_25086 ) ( IS-CRATE ?auto_25087 ) ( AVAILABLE ?auto_25090 ) ( IN ?auto_25087 ?auto_25091 ) ( ON ?auto_25085 ?auto_25084 ) ( ON ?auto_25086 ?auto_25085 ) ( not ( = ?auto_25084 ?auto_25085 ) ) ( not ( = ?auto_25084 ?auto_25086 ) ) ( not ( = ?auto_25084 ?auto_25087 ) ) ( not ( = ?auto_25084 ?auto_25088 ) ) ( not ( = ?auto_25084 ?auto_25092 ) ) ( not ( = ?auto_25085 ?auto_25086 ) ) ( not ( = ?auto_25085 ?auto_25087 ) ) ( not ( = ?auto_25085 ?auto_25088 ) ) ( not ( = ?auto_25085 ?auto_25092 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25086 ?auto_25087 ?auto_25088 )
      ( MAKE-4CRATE-VERIFY ?auto_25084 ?auto_25085 ?auto_25086 ?auto_25087 ?auto_25088 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25095 - SURFACE
      ?auto_25096 - SURFACE
    )
    :vars
    (
      ?auto_25098 - HOIST
      ?auto_25101 - PLACE
      ?auto_25103 - SURFACE
      ?auto_25102 - PLACE
      ?auto_25097 - HOIST
      ?auto_25100 - SURFACE
      ?auto_25099 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25098 ?auto_25101 ) ( IS-CRATE ?auto_25096 ) ( not ( = ?auto_25095 ?auto_25096 ) ) ( not ( = ?auto_25103 ?auto_25095 ) ) ( not ( = ?auto_25103 ?auto_25096 ) ) ( not ( = ?auto_25102 ?auto_25101 ) ) ( HOIST-AT ?auto_25097 ?auto_25102 ) ( not ( = ?auto_25098 ?auto_25097 ) ) ( AVAILABLE ?auto_25097 ) ( SURFACE-AT ?auto_25096 ?auto_25102 ) ( ON ?auto_25096 ?auto_25100 ) ( CLEAR ?auto_25096 ) ( not ( = ?auto_25095 ?auto_25100 ) ) ( not ( = ?auto_25096 ?auto_25100 ) ) ( not ( = ?auto_25103 ?auto_25100 ) ) ( SURFACE-AT ?auto_25103 ?auto_25101 ) ( CLEAR ?auto_25103 ) ( IS-CRATE ?auto_25095 ) ( AVAILABLE ?auto_25098 ) ( IN ?auto_25095 ?auto_25099 ) ( TRUCK-AT ?auto_25099 ?auto_25102 ) )
    :subtasks
    ( ( !DRIVE ?auto_25099 ?auto_25102 ?auto_25101 )
      ( MAKE-2CRATE ?auto_25103 ?auto_25095 ?auto_25096 )
      ( MAKE-1CRATE-VERIFY ?auto_25095 ?auto_25096 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25104 - SURFACE
      ?auto_25105 - SURFACE
      ?auto_25106 - SURFACE
    )
    :vars
    (
      ?auto_25108 - HOIST
      ?auto_25112 - PLACE
      ?auto_25110 - PLACE
      ?auto_25109 - HOIST
      ?auto_25107 - SURFACE
      ?auto_25111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25108 ?auto_25112 ) ( IS-CRATE ?auto_25106 ) ( not ( = ?auto_25105 ?auto_25106 ) ) ( not ( = ?auto_25104 ?auto_25105 ) ) ( not ( = ?auto_25104 ?auto_25106 ) ) ( not ( = ?auto_25110 ?auto_25112 ) ) ( HOIST-AT ?auto_25109 ?auto_25110 ) ( not ( = ?auto_25108 ?auto_25109 ) ) ( AVAILABLE ?auto_25109 ) ( SURFACE-AT ?auto_25106 ?auto_25110 ) ( ON ?auto_25106 ?auto_25107 ) ( CLEAR ?auto_25106 ) ( not ( = ?auto_25105 ?auto_25107 ) ) ( not ( = ?auto_25106 ?auto_25107 ) ) ( not ( = ?auto_25104 ?auto_25107 ) ) ( SURFACE-AT ?auto_25104 ?auto_25112 ) ( CLEAR ?auto_25104 ) ( IS-CRATE ?auto_25105 ) ( AVAILABLE ?auto_25108 ) ( IN ?auto_25105 ?auto_25111 ) ( TRUCK-AT ?auto_25111 ?auto_25110 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25105 ?auto_25106 )
      ( MAKE-2CRATE-VERIFY ?auto_25104 ?auto_25105 ?auto_25106 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25113 - SURFACE
      ?auto_25114 - SURFACE
      ?auto_25115 - SURFACE
      ?auto_25116 - SURFACE
    )
    :vars
    (
      ?auto_25121 - HOIST
      ?auto_25118 - PLACE
      ?auto_25117 - PLACE
      ?auto_25119 - HOIST
      ?auto_25122 - SURFACE
      ?auto_25120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25121 ?auto_25118 ) ( IS-CRATE ?auto_25116 ) ( not ( = ?auto_25115 ?auto_25116 ) ) ( not ( = ?auto_25114 ?auto_25115 ) ) ( not ( = ?auto_25114 ?auto_25116 ) ) ( not ( = ?auto_25117 ?auto_25118 ) ) ( HOIST-AT ?auto_25119 ?auto_25117 ) ( not ( = ?auto_25121 ?auto_25119 ) ) ( AVAILABLE ?auto_25119 ) ( SURFACE-AT ?auto_25116 ?auto_25117 ) ( ON ?auto_25116 ?auto_25122 ) ( CLEAR ?auto_25116 ) ( not ( = ?auto_25115 ?auto_25122 ) ) ( not ( = ?auto_25116 ?auto_25122 ) ) ( not ( = ?auto_25114 ?auto_25122 ) ) ( SURFACE-AT ?auto_25114 ?auto_25118 ) ( CLEAR ?auto_25114 ) ( IS-CRATE ?auto_25115 ) ( AVAILABLE ?auto_25121 ) ( IN ?auto_25115 ?auto_25120 ) ( TRUCK-AT ?auto_25120 ?auto_25117 ) ( ON ?auto_25114 ?auto_25113 ) ( not ( = ?auto_25113 ?auto_25114 ) ) ( not ( = ?auto_25113 ?auto_25115 ) ) ( not ( = ?auto_25113 ?auto_25116 ) ) ( not ( = ?auto_25113 ?auto_25122 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25114 ?auto_25115 ?auto_25116 )
      ( MAKE-3CRATE-VERIFY ?auto_25113 ?auto_25114 ?auto_25115 ?auto_25116 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25123 - SURFACE
      ?auto_25124 - SURFACE
      ?auto_25125 - SURFACE
      ?auto_25126 - SURFACE
      ?auto_25127 - SURFACE
    )
    :vars
    (
      ?auto_25132 - HOIST
      ?auto_25129 - PLACE
      ?auto_25128 - PLACE
      ?auto_25130 - HOIST
      ?auto_25133 - SURFACE
      ?auto_25131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25132 ?auto_25129 ) ( IS-CRATE ?auto_25127 ) ( not ( = ?auto_25126 ?auto_25127 ) ) ( not ( = ?auto_25125 ?auto_25126 ) ) ( not ( = ?auto_25125 ?auto_25127 ) ) ( not ( = ?auto_25128 ?auto_25129 ) ) ( HOIST-AT ?auto_25130 ?auto_25128 ) ( not ( = ?auto_25132 ?auto_25130 ) ) ( AVAILABLE ?auto_25130 ) ( SURFACE-AT ?auto_25127 ?auto_25128 ) ( ON ?auto_25127 ?auto_25133 ) ( CLEAR ?auto_25127 ) ( not ( = ?auto_25126 ?auto_25133 ) ) ( not ( = ?auto_25127 ?auto_25133 ) ) ( not ( = ?auto_25125 ?auto_25133 ) ) ( SURFACE-AT ?auto_25125 ?auto_25129 ) ( CLEAR ?auto_25125 ) ( IS-CRATE ?auto_25126 ) ( AVAILABLE ?auto_25132 ) ( IN ?auto_25126 ?auto_25131 ) ( TRUCK-AT ?auto_25131 ?auto_25128 ) ( ON ?auto_25124 ?auto_25123 ) ( ON ?auto_25125 ?auto_25124 ) ( not ( = ?auto_25123 ?auto_25124 ) ) ( not ( = ?auto_25123 ?auto_25125 ) ) ( not ( = ?auto_25123 ?auto_25126 ) ) ( not ( = ?auto_25123 ?auto_25127 ) ) ( not ( = ?auto_25123 ?auto_25133 ) ) ( not ( = ?auto_25124 ?auto_25125 ) ) ( not ( = ?auto_25124 ?auto_25126 ) ) ( not ( = ?auto_25124 ?auto_25127 ) ) ( not ( = ?auto_25124 ?auto_25133 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25125 ?auto_25126 ?auto_25127 )
      ( MAKE-4CRATE-VERIFY ?auto_25123 ?auto_25124 ?auto_25125 ?auto_25126 ?auto_25127 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25134 - SURFACE
      ?auto_25135 - SURFACE
    )
    :vars
    (
      ?auto_25141 - HOIST
      ?auto_25137 - PLACE
      ?auto_25140 - SURFACE
      ?auto_25136 - PLACE
      ?auto_25138 - HOIST
      ?auto_25142 - SURFACE
      ?auto_25139 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25141 ?auto_25137 ) ( IS-CRATE ?auto_25135 ) ( not ( = ?auto_25134 ?auto_25135 ) ) ( not ( = ?auto_25140 ?auto_25134 ) ) ( not ( = ?auto_25140 ?auto_25135 ) ) ( not ( = ?auto_25136 ?auto_25137 ) ) ( HOIST-AT ?auto_25138 ?auto_25136 ) ( not ( = ?auto_25141 ?auto_25138 ) ) ( SURFACE-AT ?auto_25135 ?auto_25136 ) ( ON ?auto_25135 ?auto_25142 ) ( CLEAR ?auto_25135 ) ( not ( = ?auto_25134 ?auto_25142 ) ) ( not ( = ?auto_25135 ?auto_25142 ) ) ( not ( = ?auto_25140 ?auto_25142 ) ) ( SURFACE-AT ?auto_25140 ?auto_25137 ) ( CLEAR ?auto_25140 ) ( IS-CRATE ?auto_25134 ) ( AVAILABLE ?auto_25141 ) ( TRUCK-AT ?auto_25139 ?auto_25136 ) ( LIFTING ?auto_25138 ?auto_25134 ) )
    :subtasks
    ( ( !LOAD ?auto_25138 ?auto_25134 ?auto_25139 ?auto_25136 )
      ( MAKE-2CRATE ?auto_25140 ?auto_25134 ?auto_25135 )
      ( MAKE-1CRATE-VERIFY ?auto_25134 ?auto_25135 ) )
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
      ?auto_25148 - HOIST
      ?auto_25151 - PLACE
      ?auto_25150 - PLACE
      ?auto_25147 - HOIST
      ?auto_25146 - SURFACE
      ?auto_25149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25148 ?auto_25151 ) ( IS-CRATE ?auto_25145 ) ( not ( = ?auto_25144 ?auto_25145 ) ) ( not ( = ?auto_25143 ?auto_25144 ) ) ( not ( = ?auto_25143 ?auto_25145 ) ) ( not ( = ?auto_25150 ?auto_25151 ) ) ( HOIST-AT ?auto_25147 ?auto_25150 ) ( not ( = ?auto_25148 ?auto_25147 ) ) ( SURFACE-AT ?auto_25145 ?auto_25150 ) ( ON ?auto_25145 ?auto_25146 ) ( CLEAR ?auto_25145 ) ( not ( = ?auto_25144 ?auto_25146 ) ) ( not ( = ?auto_25145 ?auto_25146 ) ) ( not ( = ?auto_25143 ?auto_25146 ) ) ( SURFACE-AT ?auto_25143 ?auto_25151 ) ( CLEAR ?auto_25143 ) ( IS-CRATE ?auto_25144 ) ( AVAILABLE ?auto_25148 ) ( TRUCK-AT ?auto_25149 ?auto_25150 ) ( LIFTING ?auto_25147 ?auto_25144 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25144 ?auto_25145 )
      ( MAKE-2CRATE-VERIFY ?auto_25143 ?auto_25144 ?auto_25145 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25152 - SURFACE
      ?auto_25153 - SURFACE
      ?auto_25154 - SURFACE
      ?auto_25155 - SURFACE
    )
    :vars
    (
      ?auto_25159 - HOIST
      ?auto_25160 - PLACE
      ?auto_25161 - PLACE
      ?auto_25158 - HOIST
      ?auto_25156 - SURFACE
      ?auto_25157 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25159 ?auto_25160 ) ( IS-CRATE ?auto_25155 ) ( not ( = ?auto_25154 ?auto_25155 ) ) ( not ( = ?auto_25153 ?auto_25154 ) ) ( not ( = ?auto_25153 ?auto_25155 ) ) ( not ( = ?auto_25161 ?auto_25160 ) ) ( HOIST-AT ?auto_25158 ?auto_25161 ) ( not ( = ?auto_25159 ?auto_25158 ) ) ( SURFACE-AT ?auto_25155 ?auto_25161 ) ( ON ?auto_25155 ?auto_25156 ) ( CLEAR ?auto_25155 ) ( not ( = ?auto_25154 ?auto_25156 ) ) ( not ( = ?auto_25155 ?auto_25156 ) ) ( not ( = ?auto_25153 ?auto_25156 ) ) ( SURFACE-AT ?auto_25153 ?auto_25160 ) ( CLEAR ?auto_25153 ) ( IS-CRATE ?auto_25154 ) ( AVAILABLE ?auto_25159 ) ( TRUCK-AT ?auto_25157 ?auto_25161 ) ( LIFTING ?auto_25158 ?auto_25154 ) ( ON ?auto_25153 ?auto_25152 ) ( not ( = ?auto_25152 ?auto_25153 ) ) ( not ( = ?auto_25152 ?auto_25154 ) ) ( not ( = ?auto_25152 ?auto_25155 ) ) ( not ( = ?auto_25152 ?auto_25156 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25153 ?auto_25154 ?auto_25155 )
      ( MAKE-3CRATE-VERIFY ?auto_25152 ?auto_25153 ?auto_25154 ?auto_25155 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25162 - SURFACE
      ?auto_25163 - SURFACE
      ?auto_25164 - SURFACE
      ?auto_25165 - SURFACE
      ?auto_25166 - SURFACE
    )
    :vars
    (
      ?auto_25170 - HOIST
      ?auto_25171 - PLACE
      ?auto_25172 - PLACE
      ?auto_25169 - HOIST
      ?auto_25167 - SURFACE
      ?auto_25168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25170 ?auto_25171 ) ( IS-CRATE ?auto_25166 ) ( not ( = ?auto_25165 ?auto_25166 ) ) ( not ( = ?auto_25164 ?auto_25165 ) ) ( not ( = ?auto_25164 ?auto_25166 ) ) ( not ( = ?auto_25172 ?auto_25171 ) ) ( HOIST-AT ?auto_25169 ?auto_25172 ) ( not ( = ?auto_25170 ?auto_25169 ) ) ( SURFACE-AT ?auto_25166 ?auto_25172 ) ( ON ?auto_25166 ?auto_25167 ) ( CLEAR ?auto_25166 ) ( not ( = ?auto_25165 ?auto_25167 ) ) ( not ( = ?auto_25166 ?auto_25167 ) ) ( not ( = ?auto_25164 ?auto_25167 ) ) ( SURFACE-AT ?auto_25164 ?auto_25171 ) ( CLEAR ?auto_25164 ) ( IS-CRATE ?auto_25165 ) ( AVAILABLE ?auto_25170 ) ( TRUCK-AT ?auto_25168 ?auto_25172 ) ( LIFTING ?auto_25169 ?auto_25165 ) ( ON ?auto_25163 ?auto_25162 ) ( ON ?auto_25164 ?auto_25163 ) ( not ( = ?auto_25162 ?auto_25163 ) ) ( not ( = ?auto_25162 ?auto_25164 ) ) ( not ( = ?auto_25162 ?auto_25165 ) ) ( not ( = ?auto_25162 ?auto_25166 ) ) ( not ( = ?auto_25162 ?auto_25167 ) ) ( not ( = ?auto_25163 ?auto_25164 ) ) ( not ( = ?auto_25163 ?auto_25165 ) ) ( not ( = ?auto_25163 ?auto_25166 ) ) ( not ( = ?auto_25163 ?auto_25167 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25164 ?auto_25165 ?auto_25166 )
      ( MAKE-4CRATE-VERIFY ?auto_25162 ?auto_25163 ?auto_25164 ?auto_25165 ?auto_25166 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25173 - SURFACE
      ?auto_25174 - SURFACE
    )
    :vars
    (
      ?auto_25178 - HOIST
      ?auto_25179 - PLACE
      ?auto_25181 - SURFACE
      ?auto_25180 - PLACE
      ?auto_25177 - HOIST
      ?auto_25175 - SURFACE
      ?auto_25176 - TRUCK
      ?auto_25182 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25178 ?auto_25179 ) ( IS-CRATE ?auto_25174 ) ( not ( = ?auto_25173 ?auto_25174 ) ) ( not ( = ?auto_25181 ?auto_25173 ) ) ( not ( = ?auto_25181 ?auto_25174 ) ) ( not ( = ?auto_25180 ?auto_25179 ) ) ( HOIST-AT ?auto_25177 ?auto_25180 ) ( not ( = ?auto_25178 ?auto_25177 ) ) ( SURFACE-AT ?auto_25174 ?auto_25180 ) ( ON ?auto_25174 ?auto_25175 ) ( CLEAR ?auto_25174 ) ( not ( = ?auto_25173 ?auto_25175 ) ) ( not ( = ?auto_25174 ?auto_25175 ) ) ( not ( = ?auto_25181 ?auto_25175 ) ) ( SURFACE-AT ?auto_25181 ?auto_25179 ) ( CLEAR ?auto_25181 ) ( IS-CRATE ?auto_25173 ) ( AVAILABLE ?auto_25178 ) ( TRUCK-AT ?auto_25176 ?auto_25180 ) ( AVAILABLE ?auto_25177 ) ( SURFACE-AT ?auto_25173 ?auto_25180 ) ( ON ?auto_25173 ?auto_25182 ) ( CLEAR ?auto_25173 ) ( not ( = ?auto_25173 ?auto_25182 ) ) ( not ( = ?auto_25174 ?auto_25182 ) ) ( not ( = ?auto_25181 ?auto_25182 ) ) ( not ( = ?auto_25175 ?auto_25182 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25177 ?auto_25173 ?auto_25182 ?auto_25180 )
      ( MAKE-2CRATE ?auto_25181 ?auto_25173 ?auto_25174 )
      ( MAKE-1CRATE-VERIFY ?auto_25173 ?auto_25174 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25183 - SURFACE
      ?auto_25184 - SURFACE
      ?auto_25185 - SURFACE
    )
    :vars
    (
      ?auto_25191 - HOIST
      ?auto_25188 - PLACE
      ?auto_25189 - PLACE
      ?auto_25186 - HOIST
      ?auto_25190 - SURFACE
      ?auto_25192 - TRUCK
      ?auto_25187 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25191 ?auto_25188 ) ( IS-CRATE ?auto_25185 ) ( not ( = ?auto_25184 ?auto_25185 ) ) ( not ( = ?auto_25183 ?auto_25184 ) ) ( not ( = ?auto_25183 ?auto_25185 ) ) ( not ( = ?auto_25189 ?auto_25188 ) ) ( HOIST-AT ?auto_25186 ?auto_25189 ) ( not ( = ?auto_25191 ?auto_25186 ) ) ( SURFACE-AT ?auto_25185 ?auto_25189 ) ( ON ?auto_25185 ?auto_25190 ) ( CLEAR ?auto_25185 ) ( not ( = ?auto_25184 ?auto_25190 ) ) ( not ( = ?auto_25185 ?auto_25190 ) ) ( not ( = ?auto_25183 ?auto_25190 ) ) ( SURFACE-AT ?auto_25183 ?auto_25188 ) ( CLEAR ?auto_25183 ) ( IS-CRATE ?auto_25184 ) ( AVAILABLE ?auto_25191 ) ( TRUCK-AT ?auto_25192 ?auto_25189 ) ( AVAILABLE ?auto_25186 ) ( SURFACE-AT ?auto_25184 ?auto_25189 ) ( ON ?auto_25184 ?auto_25187 ) ( CLEAR ?auto_25184 ) ( not ( = ?auto_25184 ?auto_25187 ) ) ( not ( = ?auto_25185 ?auto_25187 ) ) ( not ( = ?auto_25183 ?auto_25187 ) ) ( not ( = ?auto_25190 ?auto_25187 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25184 ?auto_25185 )
      ( MAKE-2CRATE-VERIFY ?auto_25183 ?auto_25184 ?auto_25185 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25193 - SURFACE
      ?auto_25194 - SURFACE
      ?auto_25195 - SURFACE
      ?auto_25196 - SURFACE
    )
    :vars
    (
      ?auto_25202 - HOIST
      ?auto_25203 - PLACE
      ?auto_25200 - PLACE
      ?auto_25199 - HOIST
      ?auto_25198 - SURFACE
      ?auto_25201 - TRUCK
      ?auto_25197 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25202 ?auto_25203 ) ( IS-CRATE ?auto_25196 ) ( not ( = ?auto_25195 ?auto_25196 ) ) ( not ( = ?auto_25194 ?auto_25195 ) ) ( not ( = ?auto_25194 ?auto_25196 ) ) ( not ( = ?auto_25200 ?auto_25203 ) ) ( HOIST-AT ?auto_25199 ?auto_25200 ) ( not ( = ?auto_25202 ?auto_25199 ) ) ( SURFACE-AT ?auto_25196 ?auto_25200 ) ( ON ?auto_25196 ?auto_25198 ) ( CLEAR ?auto_25196 ) ( not ( = ?auto_25195 ?auto_25198 ) ) ( not ( = ?auto_25196 ?auto_25198 ) ) ( not ( = ?auto_25194 ?auto_25198 ) ) ( SURFACE-AT ?auto_25194 ?auto_25203 ) ( CLEAR ?auto_25194 ) ( IS-CRATE ?auto_25195 ) ( AVAILABLE ?auto_25202 ) ( TRUCK-AT ?auto_25201 ?auto_25200 ) ( AVAILABLE ?auto_25199 ) ( SURFACE-AT ?auto_25195 ?auto_25200 ) ( ON ?auto_25195 ?auto_25197 ) ( CLEAR ?auto_25195 ) ( not ( = ?auto_25195 ?auto_25197 ) ) ( not ( = ?auto_25196 ?auto_25197 ) ) ( not ( = ?auto_25194 ?auto_25197 ) ) ( not ( = ?auto_25198 ?auto_25197 ) ) ( ON ?auto_25194 ?auto_25193 ) ( not ( = ?auto_25193 ?auto_25194 ) ) ( not ( = ?auto_25193 ?auto_25195 ) ) ( not ( = ?auto_25193 ?auto_25196 ) ) ( not ( = ?auto_25193 ?auto_25198 ) ) ( not ( = ?auto_25193 ?auto_25197 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25194 ?auto_25195 ?auto_25196 )
      ( MAKE-3CRATE-VERIFY ?auto_25193 ?auto_25194 ?auto_25195 ?auto_25196 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25204 - SURFACE
      ?auto_25205 - SURFACE
      ?auto_25206 - SURFACE
      ?auto_25207 - SURFACE
      ?auto_25208 - SURFACE
    )
    :vars
    (
      ?auto_25214 - HOIST
      ?auto_25215 - PLACE
      ?auto_25212 - PLACE
      ?auto_25211 - HOIST
      ?auto_25210 - SURFACE
      ?auto_25213 - TRUCK
      ?auto_25209 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25214 ?auto_25215 ) ( IS-CRATE ?auto_25208 ) ( not ( = ?auto_25207 ?auto_25208 ) ) ( not ( = ?auto_25206 ?auto_25207 ) ) ( not ( = ?auto_25206 ?auto_25208 ) ) ( not ( = ?auto_25212 ?auto_25215 ) ) ( HOIST-AT ?auto_25211 ?auto_25212 ) ( not ( = ?auto_25214 ?auto_25211 ) ) ( SURFACE-AT ?auto_25208 ?auto_25212 ) ( ON ?auto_25208 ?auto_25210 ) ( CLEAR ?auto_25208 ) ( not ( = ?auto_25207 ?auto_25210 ) ) ( not ( = ?auto_25208 ?auto_25210 ) ) ( not ( = ?auto_25206 ?auto_25210 ) ) ( SURFACE-AT ?auto_25206 ?auto_25215 ) ( CLEAR ?auto_25206 ) ( IS-CRATE ?auto_25207 ) ( AVAILABLE ?auto_25214 ) ( TRUCK-AT ?auto_25213 ?auto_25212 ) ( AVAILABLE ?auto_25211 ) ( SURFACE-AT ?auto_25207 ?auto_25212 ) ( ON ?auto_25207 ?auto_25209 ) ( CLEAR ?auto_25207 ) ( not ( = ?auto_25207 ?auto_25209 ) ) ( not ( = ?auto_25208 ?auto_25209 ) ) ( not ( = ?auto_25206 ?auto_25209 ) ) ( not ( = ?auto_25210 ?auto_25209 ) ) ( ON ?auto_25205 ?auto_25204 ) ( ON ?auto_25206 ?auto_25205 ) ( not ( = ?auto_25204 ?auto_25205 ) ) ( not ( = ?auto_25204 ?auto_25206 ) ) ( not ( = ?auto_25204 ?auto_25207 ) ) ( not ( = ?auto_25204 ?auto_25208 ) ) ( not ( = ?auto_25204 ?auto_25210 ) ) ( not ( = ?auto_25204 ?auto_25209 ) ) ( not ( = ?auto_25205 ?auto_25206 ) ) ( not ( = ?auto_25205 ?auto_25207 ) ) ( not ( = ?auto_25205 ?auto_25208 ) ) ( not ( = ?auto_25205 ?auto_25210 ) ) ( not ( = ?auto_25205 ?auto_25209 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25206 ?auto_25207 ?auto_25208 )
      ( MAKE-4CRATE-VERIFY ?auto_25204 ?auto_25205 ?auto_25206 ?auto_25207 ?auto_25208 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25216 - SURFACE
      ?auto_25217 - SURFACE
    )
    :vars
    (
      ?auto_25223 - HOIST
      ?auto_25225 - PLACE
      ?auto_25224 - SURFACE
      ?auto_25221 - PLACE
      ?auto_25220 - HOIST
      ?auto_25219 - SURFACE
      ?auto_25218 - SURFACE
      ?auto_25222 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25223 ?auto_25225 ) ( IS-CRATE ?auto_25217 ) ( not ( = ?auto_25216 ?auto_25217 ) ) ( not ( = ?auto_25224 ?auto_25216 ) ) ( not ( = ?auto_25224 ?auto_25217 ) ) ( not ( = ?auto_25221 ?auto_25225 ) ) ( HOIST-AT ?auto_25220 ?auto_25221 ) ( not ( = ?auto_25223 ?auto_25220 ) ) ( SURFACE-AT ?auto_25217 ?auto_25221 ) ( ON ?auto_25217 ?auto_25219 ) ( CLEAR ?auto_25217 ) ( not ( = ?auto_25216 ?auto_25219 ) ) ( not ( = ?auto_25217 ?auto_25219 ) ) ( not ( = ?auto_25224 ?auto_25219 ) ) ( SURFACE-AT ?auto_25224 ?auto_25225 ) ( CLEAR ?auto_25224 ) ( IS-CRATE ?auto_25216 ) ( AVAILABLE ?auto_25223 ) ( AVAILABLE ?auto_25220 ) ( SURFACE-AT ?auto_25216 ?auto_25221 ) ( ON ?auto_25216 ?auto_25218 ) ( CLEAR ?auto_25216 ) ( not ( = ?auto_25216 ?auto_25218 ) ) ( not ( = ?auto_25217 ?auto_25218 ) ) ( not ( = ?auto_25224 ?auto_25218 ) ) ( not ( = ?auto_25219 ?auto_25218 ) ) ( TRUCK-AT ?auto_25222 ?auto_25225 ) )
    :subtasks
    ( ( !DRIVE ?auto_25222 ?auto_25225 ?auto_25221 )
      ( MAKE-2CRATE ?auto_25224 ?auto_25216 ?auto_25217 )
      ( MAKE-1CRATE-VERIFY ?auto_25216 ?auto_25217 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25226 - SURFACE
      ?auto_25227 - SURFACE
      ?auto_25228 - SURFACE
    )
    :vars
    (
      ?auto_25231 - HOIST
      ?auto_25233 - PLACE
      ?auto_25230 - PLACE
      ?auto_25235 - HOIST
      ?auto_25229 - SURFACE
      ?auto_25232 - SURFACE
      ?auto_25234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25231 ?auto_25233 ) ( IS-CRATE ?auto_25228 ) ( not ( = ?auto_25227 ?auto_25228 ) ) ( not ( = ?auto_25226 ?auto_25227 ) ) ( not ( = ?auto_25226 ?auto_25228 ) ) ( not ( = ?auto_25230 ?auto_25233 ) ) ( HOIST-AT ?auto_25235 ?auto_25230 ) ( not ( = ?auto_25231 ?auto_25235 ) ) ( SURFACE-AT ?auto_25228 ?auto_25230 ) ( ON ?auto_25228 ?auto_25229 ) ( CLEAR ?auto_25228 ) ( not ( = ?auto_25227 ?auto_25229 ) ) ( not ( = ?auto_25228 ?auto_25229 ) ) ( not ( = ?auto_25226 ?auto_25229 ) ) ( SURFACE-AT ?auto_25226 ?auto_25233 ) ( CLEAR ?auto_25226 ) ( IS-CRATE ?auto_25227 ) ( AVAILABLE ?auto_25231 ) ( AVAILABLE ?auto_25235 ) ( SURFACE-AT ?auto_25227 ?auto_25230 ) ( ON ?auto_25227 ?auto_25232 ) ( CLEAR ?auto_25227 ) ( not ( = ?auto_25227 ?auto_25232 ) ) ( not ( = ?auto_25228 ?auto_25232 ) ) ( not ( = ?auto_25226 ?auto_25232 ) ) ( not ( = ?auto_25229 ?auto_25232 ) ) ( TRUCK-AT ?auto_25234 ?auto_25233 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25227 ?auto_25228 )
      ( MAKE-2CRATE-VERIFY ?auto_25226 ?auto_25227 ?auto_25228 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25236 - SURFACE
      ?auto_25237 - SURFACE
      ?auto_25238 - SURFACE
      ?auto_25239 - SURFACE
    )
    :vars
    (
      ?auto_25242 - HOIST
      ?auto_25245 - PLACE
      ?auto_25241 - PLACE
      ?auto_25246 - HOIST
      ?auto_25243 - SURFACE
      ?auto_25244 - SURFACE
      ?auto_25240 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25242 ?auto_25245 ) ( IS-CRATE ?auto_25239 ) ( not ( = ?auto_25238 ?auto_25239 ) ) ( not ( = ?auto_25237 ?auto_25238 ) ) ( not ( = ?auto_25237 ?auto_25239 ) ) ( not ( = ?auto_25241 ?auto_25245 ) ) ( HOIST-AT ?auto_25246 ?auto_25241 ) ( not ( = ?auto_25242 ?auto_25246 ) ) ( SURFACE-AT ?auto_25239 ?auto_25241 ) ( ON ?auto_25239 ?auto_25243 ) ( CLEAR ?auto_25239 ) ( not ( = ?auto_25238 ?auto_25243 ) ) ( not ( = ?auto_25239 ?auto_25243 ) ) ( not ( = ?auto_25237 ?auto_25243 ) ) ( SURFACE-AT ?auto_25237 ?auto_25245 ) ( CLEAR ?auto_25237 ) ( IS-CRATE ?auto_25238 ) ( AVAILABLE ?auto_25242 ) ( AVAILABLE ?auto_25246 ) ( SURFACE-AT ?auto_25238 ?auto_25241 ) ( ON ?auto_25238 ?auto_25244 ) ( CLEAR ?auto_25238 ) ( not ( = ?auto_25238 ?auto_25244 ) ) ( not ( = ?auto_25239 ?auto_25244 ) ) ( not ( = ?auto_25237 ?auto_25244 ) ) ( not ( = ?auto_25243 ?auto_25244 ) ) ( TRUCK-AT ?auto_25240 ?auto_25245 ) ( ON ?auto_25237 ?auto_25236 ) ( not ( = ?auto_25236 ?auto_25237 ) ) ( not ( = ?auto_25236 ?auto_25238 ) ) ( not ( = ?auto_25236 ?auto_25239 ) ) ( not ( = ?auto_25236 ?auto_25243 ) ) ( not ( = ?auto_25236 ?auto_25244 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25237 ?auto_25238 ?auto_25239 )
      ( MAKE-3CRATE-VERIFY ?auto_25236 ?auto_25237 ?auto_25238 ?auto_25239 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25247 - SURFACE
      ?auto_25248 - SURFACE
      ?auto_25249 - SURFACE
      ?auto_25250 - SURFACE
      ?auto_25251 - SURFACE
    )
    :vars
    (
      ?auto_25254 - HOIST
      ?auto_25257 - PLACE
      ?auto_25253 - PLACE
      ?auto_25258 - HOIST
      ?auto_25255 - SURFACE
      ?auto_25256 - SURFACE
      ?auto_25252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25254 ?auto_25257 ) ( IS-CRATE ?auto_25251 ) ( not ( = ?auto_25250 ?auto_25251 ) ) ( not ( = ?auto_25249 ?auto_25250 ) ) ( not ( = ?auto_25249 ?auto_25251 ) ) ( not ( = ?auto_25253 ?auto_25257 ) ) ( HOIST-AT ?auto_25258 ?auto_25253 ) ( not ( = ?auto_25254 ?auto_25258 ) ) ( SURFACE-AT ?auto_25251 ?auto_25253 ) ( ON ?auto_25251 ?auto_25255 ) ( CLEAR ?auto_25251 ) ( not ( = ?auto_25250 ?auto_25255 ) ) ( not ( = ?auto_25251 ?auto_25255 ) ) ( not ( = ?auto_25249 ?auto_25255 ) ) ( SURFACE-AT ?auto_25249 ?auto_25257 ) ( CLEAR ?auto_25249 ) ( IS-CRATE ?auto_25250 ) ( AVAILABLE ?auto_25254 ) ( AVAILABLE ?auto_25258 ) ( SURFACE-AT ?auto_25250 ?auto_25253 ) ( ON ?auto_25250 ?auto_25256 ) ( CLEAR ?auto_25250 ) ( not ( = ?auto_25250 ?auto_25256 ) ) ( not ( = ?auto_25251 ?auto_25256 ) ) ( not ( = ?auto_25249 ?auto_25256 ) ) ( not ( = ?auto_25255 ?auto_25256 ) ) ( TRUCK-AT ?auto_25252 ?auto_25257 ) ( ON ?auto_25248 ?auto_25247 ) ( ON ?auto_25249 ?auto_25248 ) ( not ( = ?auto_25247 ?auto_25248 ) ) ( not ( = ?auto_25247 ?auto_25249 ) ) ( not ( = ?auto_25247 ?auto_25250 ) ) ( not ( = ?auto_25247 ?auto_25251 ) ) ( not ( = ?auto_25247 ?auto_25255 ) ) ( not ( = ?auto_25247 ?auto_25256 ) ) ( not ( = ?auto_25248 ?auto_25249 ) ) ( not ( = ?auto_25248 ?auto_25250 ) ) ( not ( = ?auto_25248 ?auto_25251 ) ) ( not ( = ?auto_25248 ?auto_25255 ) ) ( not ( = ?auto_25248 ?auto_25256 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25249 ?auto_25250 ?auto_25251 )
      ( MAKE-4CRATE-VERIFY ?auto_25247 ?auto_25248 ?auto_25249 ?auto_25250 ?auto_25251 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25259 - SURFACE
      ?auto_25260 - SURFACE
    )
    :vars
    (
      ?auto_25264 - HOIST
      ?auto_25267 - PLACE
      ?auto_25261 - SURFACE
      ?auto_25263 - PLACE
      ?auto_25268 - HOIST
      ?auto_25265 - SURFACE
      ?auto_25266 - SURFACE
      ?auto_25262 - TRUCK
      ?auto_25269 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25264 ?auto_25267 ) ( IS-CRATE ?auto_25260 ) ( not ( = ?auto_25259 ?auto_25260 ) ) ( not ( = ?auto_25261 ?auto_25259 ) ) ( not ( = ?auto_25261 ?auto_25260 ) ) ( not ( = ?auto_25263 ?auto_25267 ) ) ( HOIST-AT ?auto_25268 ?auto_25263 ) ( not ( = ?auto_25264 ?auto_25268 ) ) ( SURFACE-AT ?auto_25260 ?auto_25263 ) ( ON ?auto_25260 ?auto_25265 ) ( CLEAR ?auto_25260 ) ( not ( = ?auto_25259 ?auto_25265 ) ) ( not ( = ?auto_25260 ?auto_25265 ) ) ( not ( = ?auto_25261 ?auto_25265 ) ) ( IS-CRATE ?auto_25259 ) ( AVAILABLE ?auto_25268 ) ( SURFACE-AT ?auto_25259 ?auto_25263 ) ( ON ?auto_25259 ?auto_25266 ) ( CLEAR ?auto_25259 ) ( not ( = ?auto_25259 ?auto_25266 ) ) ( not ( = ?auto_25260 ?auto_25266 ) ) ( not ( = ?auto_25261 ?auto_25266 ) ) ( not ( = ?auto_25265 ?auto_25266 ) ) ( TRUCK-AT ?auto_25262 ?auto_25267 ) ( SURFACE-AT ?auto_25269 ?auto_25267 ) ( CLEAR ?auto_25269 ) ( LIFTING ?auto_25264 ?auto_25261 ) ( IS-CRATE ?auto_25261 ) ( not ( = ?auto_25269 ?auto_25261 ) ) ( not ( = ?auto_25259 ?auto_25269 ) ) ( not ( = ?auto_25260 ?auto_25269 ) ) ( not ( = ?auto_25265 ?auto_25269 ) ) ( not ( = ?auto_25266 ?auto_25269 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25269 ?auto_25261 )
      ( MAKE-2CRATE ?auto_25261 ?auto_25259 ?auto_25260 )
      ( MAKE-1CRATE-VERIFY ?auto_25259 ?auto_25260 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25270 - SURFACE
      ?auto_25271 - SURFACE
      ?auto_25272 - SURFACE
    )
    :vars
    (
      ?auto_25274 - HOIST
      ?auto_25275 - PLACE
      ?auto_25279 - PLACE
      ?auto_25278 - HOIST
      ?auto_25280 - SURFACE
      ?auto_25276 - SURFACE
      ?auto_25277 - TRUCK
      ?auto_25273 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25274 ?auto_25275 ) ( IS-CRATE ?auto_25272 ) ( not ( = ?auto_25271 ?auto_25272 ) ) ( not ( = ?auto_25270 ?auto_25271 ) ) ( not ( = ?auto_25270 ?auto_25272 ) ) ( not ( = ?auto_25279 ?auto_25275 ) ) ( HOIST-AT ?auto_25278 ?auto_25279 ) ( not ( = ?auto_25274 ?auto_25278 ) ) ( SURFACE-AT ?auto_25272 ?auto_25279 ) ( ON ?auto_25272 ?auto_25280 ) ( CLEAR ?auto_25272 ) ( not ( = ?auto_25271 ?auto_25280 ) ) ( not ( = ?auto_25272 ?auto_25280 ) ) ( not ( = ?auto_25270 ?auto_25280 ) ) ( IS-CRATE ?auto_25271 ) ( AVAILABLE ?auto_25278 ) ( SURFACE-AT ?auto_25271 ?auto_25279 ) ( ON ?auto_25271 ?auto_25276 ) ( CLEAR ?auto_25271 ) ( not ( = ?auto_25271 ?auto_25276 ) ) ( not ( = ?auto_25272 ?auto_25276 ) ) ( not ( = ?auto_25270 ?auto_25276 ) ) ( not ( = ?auto_25280 ?auto_25276 ) ) ( TRUCK-AT ?auto_25277 ?auto_25275 ) ( SURFACE-AT ?auto_25273 ?auto_25275 ) ( CLEAR ?auto_25273 ) ( LIFTING ?auto_25274 ?auto_25270 ) ( IS-CRATE ?auto_25270 ) ( not ( = ?auto_25273 ?auto_25270 ) ) ( not ( = ?auto_25271 ?auto_25273 ) ) ( not ( = ?auto_25272 ?auto_25273 ) ) ( not ( = ?auto_25280 ?auto_25273 ) ) ( not ( = ?auto_25276 ?auto_25273 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25271 ?auto_25272 )
      ( MAKE-2CRATE-VERIFY ?auto_25270 ?auto_25271 ?auto_25272 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25281 - SURFACE
      ?auto_25282 - SURFACE
      ?auto_25283 - SURFACE
      ?auto_25284 - SURFACE
    )
    :vars
    (
      ?auto_25286 - HOIST
      ?auto_25289 - PLACE
      ?auto_25285 - PLACE
      ?auto_25291 - HOIST
      ?auto_25290 - SURFACE
      ?auto_25288 - SURFACE
      ?auto_25287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25286 ?auto_25289 ) ( IS-CRATE ?auto_25284 ) ( not ( = ?auto_25283 ?auto_25284 ) ) ( not ( = ?auto_25282 ?auto_25283 ) ) ( not ( = ?auto_25282 ?auto_25284 ) ) ( not ( = ?auto_25285 ?auto_25289 ) ) ( HOIST-AT ?auto_25291 ?auto_25285 ) ( not ( = ?auto_25286 ?auto_25291 ) ) ( SURFACE-AT ?auto_25284 ?auto_25285 ) ( ON ?auto_25284 ?auto_25290 ) ( CLEAR ?auto_25284 ) ( not ( = ?auto_25283 ?auto_25290 ) ) ( not ( = ?auto_25284 ?auto_25290 ) ) ( not ( = ?auto_25282 ?auto_25290 ) ) ( IS-CRATE ?auto_25283 ) ( AVAILABLE ?auto_25291 ) ( SURFACE-AT ?auto_25283 ?auto_25285 ) ( ON ?auto_25283 ?auto_25288 ) ( CLEAR ?auto_25283 ) ( not ( = ?auto_25283 ?auto_25288 ) ) ( not ( = ?auto_25284 ?auto_25288 ) ) ( not ( = ?auto_25282 ?auto_25288 ) ) ( not ( = ?auto_25290 ?auto_25288 ) ) ( TRUCK-AT ?auto_25287 ?auto_25289 ) ( SURFACE-AT ?auto_25281 ?auto_25289 ) ( CLEAR ?auto_25281 ) ( LIFTING ?auto_25286 ?auto_25282 ) ( IS-CRATE ?auto_25282 ) ( not ( = ?auto_25281 ?auto_25282 ) ) ( not ( = ?auto_25283 ?auto_25281 ) ) ( not ( = ?auto_25284 ?auto_25281 ) ) ( not ( = ?auto_25290 ?auto_25281 ) ) ( not ( = ?auto_25288 ?auto_25281 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25282 ?auto_25283 ?auto_25284 )
      ( MAKE-3CRATE-VERIFY ?auto_25281 ?auto_25282 ?auto_25283 ?auto_25284 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25292 - SURFACE
      ?auto_25293 - SURFACE
      ?auto_25294 - SURFACE
      ?auto_25295 - SURFACE
      ?auto_25296 - SURFACE
    )
    :vars
    (
      ?auto_25298 - HOIST
      ?auto_25301 - PLACE
      ?auto_25297 - PLACE
      ?auto_25303 - HOIST
      ?auto_25302 - SURFACE
      ?auto_25300 - SURFACE
      ?auto_25299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25298 ?auto_25301 ) ( IS-CRATE ?auto_25296 ) ( not ( = ?auto_25295 ?auto_25296 ) ) ( not ( = ?auto_25294 ?auto_25295 ) ) ( not ( = ?auto_25294 ?auto_25296 ) ) ( not ( = ?auto_25297 ?auto_25301 ) ) ( HOIST-AT ?auto_25303 ?auto_25297 ) ( not ( = ?auto_25298 ?auto_25303 ) ) ( SURFACE-AT ?auto_25296 ?auto_25297 ) ( ON ?auto_25296 ?auto_25302 ) ( CLEAR ?auto_25296 ) ( not ( = ?auto_25295 ?auto_25302 ) ) ( not ( = ?auto_25296 ?auto_25302 ) ) ( not ( = ?auto_25294 ?auto_25302 ) ) ( IS-CRATE ?auto_25295 ) ( AVAILABLE ?auto_25303 ) ( SURFACE-AT ?auto_25295 ?auto_25297 ) ( ON ?auto_25295 ?auto_25300 ) ( CLEAR ?auto_25295 ) ( not ( = ?auto_25295 ?auto_25300 ) ) ( not ( = ?auto_25296 ?auto_25300 ) ) ( not ( = ?auto_25294 ?auto_25300 ) ) ( not ( = ?auto_25302 ?auto_25300 ) ) ( TRUCK-AT ?auto_25299 ?auto_25301 ) ( SURFACE-AT ?auto_25293 ?auto_25301 ) ( CLEAR ?auto_25293 ) ( LIFTING ?auto_25298 ?auto_25294 ) ( IS-CRATE ?auto_25294 ) ( not ( = ?auto_25293 ?auto_25294 ) ) ( not ( = ?auto_25295 ?auto_25293 ) ) ( not ( = ?auto_25296 ?auto_25293 ) ) ( not ( = ?auto_25302 ?auto_25293 ) ) ( not ( = ?auto_25300 ?auto_25293 ) ) ( ON ?auto_25293 ?auto_25292 ) ( not ( = ?auto_25292 ?auto_25293 ) ) ( not ( = ?auto_25292 ?auto_25294 ) ) ( not ( = ?auto_25292 ?auto_25295 ) ) ( not ( = ?auto_25292 ?auto_25296 ) ) ( not ( = ?auto_25292 ?auto_25302 ) ) ( not ( = ?auto_25292 ?auto_25300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25294 ?auto_25295 ?auto_25296 )
      ( MAKE-4CRATE-VERIFY ?auto_25292 ?auto_25293 ?auto_25294 ?auto_25295 ?auto_25296 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25304 - SURFACE
      ?auto_25305 - SURFACE
    )
    :vars
    (
      ?auto_25308 - HOIST
      ?auto_25311 - PLACE
      ?auto_25312 - SURFACE
      ?auto_25307 - PLACE
      ?auto_25314 - HOIST
      ?auto_25313 - SURFACE
      ?auto_25310 - SURFACE
      ?auto_25309 - TRUCK
      ?auto_25306 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25308 ?auto_25311 ) ( IS-CRATE ?auto_25305 ) ( not ( = ?auto_25304 ?auto_25305 ) ) ( not ( = ?auto_25312 ?auto_25304 ) ) ( not ( = ?auto_25312 ?auto_25305 ) ) ( not ( = ?auto_25307 ?auto_25311 ) ) ( HOIST-AT ?auto_25314 ?auto_25307 ) ( not ( = ?auto_25308 ?auto_25314 ) ) ( SURFACE-AT ?auto_25305 ?auto_25307 ) ( ON ?auto_25305 ?auto_25313 ) ( CLEAR ?auto_25305 ) ( not ( = ?auto_25304 ?auto_25313 ) ) ( not ( = ?auto_25305 ?auto_25313 ) ) ( not ( = ?auto_25312 ?auto_25313 ) ) ( IS-CRATE ?auto_25304 ) ( AVAILABLE ?auto_25314 ) ( SURFACE-AT ?auto_25304 ?auto_25307 ) ( ON ?auto_25304 ?auto_25310 ) ( CLEAR ?auto_25304 ) ( not ( = ?auto_25304 ?auto_25310 ) ) ( not ( = ?auto_25305 ?auto_25310 ) ) ( not ( = ?auto_25312 ?auto_25310 ) ) ( not ( = ?auto_25313 ?auto_25310 ) ) ( TRUCK-AT ?auto_25309 ?auto_25311 ) ( SURFACE-AT ?auto_25306 ?auto_25311 ) ( CLEAR ?auto_25306 ) ( IS-CRATE ?auto_25312 ) ( not ( = ?auto_25306 ?auto_25312 ) ) ( not ( = ?auto_25304 ?auto_25306 ) ) ( not ( = ?auto_25305 ?auto_25306 ) ) ( not ( = ?auto_25313 ?auto_25306 ) ) ( not ( = ?auto_25310 ?auto_25306 ) ) ( AVAILABLE ?auto_25308 ) ( IN ?auto_25312 ?auto_25309 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25308 ?auto_25312 ?auto_25309 ?auto_25311 )
      ( MAKE-2CRATE ?auto_25312 ?auto_25304 ?auto_25305 )
      ( MAKE-1CRATE-VERIFY ?auto_25304 ?auto_25305 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25315 - SURFACE
      ?auto_25316 - SURFACE
      ?auto_25317 - SURFACE
    )
    :vars
    (
      ?auto_25318 - HOIST
      ?auto_25319 - PLACE
      ?auto_25321 - PLACE
      ?auto_25320 - HOIST
      ?auto_25323 - SURFACE
      ?auto_25322 - SURFACE
      ?auto_25325 - TRUCK
      ?auto_25324 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25318 ?auto_25319 ) ( IS-CRATE ?auto_25317 ) ( not ( = ?auto_25316 ?auto_25317 ) ) ( not ( = ?auto_25315 ?auto_25316 ) ) ( not ( = ?auto_25315 ?auto_25317 ) ) ( not ( = ?auto_25321 ?auto_25319 ) ) ( HOIST-AT ?auto_25320 ?auto_25321 ) ( not ( = ?auto_25318 ?auto_25320 ) ) ( SURFACE-AT ?auto_25317 ?auto_25321 ) ( ON ?auto_25317 ?auto_25323 ) ( CLEAR ?auto_25317 ) ( not ( = ?auto_25316 ?auto_25323 ) ) ( not ( = ?auto_25317 ?auto_25323 ) ) ( not ( = ?auto_25315 ?auto_25323 ) ) ( IS-CRATE ?auto_25316 ) ( AVAILABLE ?auto_25320 ) ( SURFACE-AT ?auto_25316 ?auto_25321 ) ( ON ?auto_25316 ?auto_25322 ) ( CLEAR ?auto_25316 ) ( not ( = ?auto_25316 ?auto_25322 ) ) ( not ( = ?auto_25317 ?auto_25322 ) ) ( not ( = ?auto_25315 ?auto_25322 ) ) ( not ( = ?auto_25323 ?auto_25322 ) ) ( TRUCK-AT ?auto_25325 ?auto_25319 ) ( SURFACE-AT ?auto_25324 ?auto_25319 ) ( CLEAR ?auto_25324 ) ( IS-CRATE ?auto_25315 ) ( not ( = ?auto_25324 ?auto_25315 ) ) ( not ( = ?auto_25316 ?auto_25324 ) ) ( not ( = ?auto_25317 ?auto_25324 ) ) ( not ( = ?auto_25323 ?auto_25324 ) ) ( not ( = ?auto_25322 ?auto_25324 ) ) ( AVAILABLE ?auto_25318 ) ( IN ?auto_25315 ?auto_25325 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25316 ?auto_25317 )
      ( MAKE-2CRATE-VERIFY ?auto_25315 ?auto_25316 ?auto_25317 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25326 - SURFACE
      ?auto_25327 - SURFACE
      ?auto_25328 - SURFACE
      ?auto_25329 - SURFACE
    )
    :vars
    (
      ?auto_25330 - HOIST
      ?auto_25336 - PLACE
      ?auto_25333 - PLACE
      ?auto_25335 - HOIST
      ?auto_25331 - SURFACE
      ?auto_25332 - SURFACE
      ?auto_25334 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25330 ?auto_25336 ) ( IS-CRATE ?auto_25329 ) ( not ( = ?auto_25328 ?auto_25329 ) ) ( not ( = ?auto_25327 ?auto_25328 ) ) ( not ( = ?auto_25327 ?auto_25329 ) ) ( not ( = ?auto_25333 ?auto_25336 ) ) ( HOIST-AT ?auto_25335 ?auto_25333 ) ( not ( = ?auto_25330 ?auto_25335 ) ) ( SURFACE-AT ?auto_25329 ?auto_25333 ) ( ON ?auto_25329 ?auto_25331 ) ( CLEAR ?auto_25329 ) ( not ( = ?auto_25328 ?auto_25331 ) ) ( not ( = ?auto_25329 ?auto_25331 ) ) ( not ( = ?auto_25327 ?auto_25331 ) ) ( IS-CRATE ?auto_25328 ) ( AVAILABLE ?auto_25335 ) ( SURFACE-AT ?auto_25328 ?auto_25333 ) ( ON ?auto_25328 ?auto_25332 ) ( CLEAR ?auto_25328 ) ( not ( = ?auto_25328 ?auto_25332 ) ) ( not ( = ?auto_25329 ?auto_25332 ) ) ( not ( = ?auto_25327 ?auto_25332 ) ) ( not ( = ?auto_25331 ?auto_25332 ) ) ( TRUCK-AT ?auto_25334 ?auto_25336 ) ( SURFACE-AT ?auto_25326 ?auto_25336 ) ( CLEAR ?auto_25326 ) ( IS-CRATE ?auto_25327 ) ( not ( = ?auto_25326 ?auto_25327 ) ) ( not ( = ?auto_25328 ?auto_25326 ) ) ( not ( = ?auto_25329 ?auto_25326 ) ) ( not ( = ?auto_25331 ?auto_25326 ) ) ( not ( = ?auto_25332 ?auto_25326 ) ) ( AVAILABLE ?auto_25330 ) ( IN ?auto_25327 ?auto_25334 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25327 ?auto_25328 ?auto_25329 )
      ( MAKE-3CRATE-VERIFY ?auto_25326 ?auto_25327 ?auto_25328 ?auto_25329 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25337 - SURFACE
      ?auto_25338 - SURFACE
      ?auto_25339 - SURFACE
      ?auto_25340 - SURFACE
      ?auto_25341 - SURFACE
    )
    :vars
    (
      ?auto_25342 - HOIST
      ?auto_25348 - PLACE
      ?auto_25345 - PLACE
      ?auto_25347 - HOIST
      ?auto_25343 - SURFACE
      ?auto_25344 - SURFACE
      ?auto_25346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25342 ?auto_25348 ) ( IS-CRATE ?auto_25341 ) ( not ( = ?auto_25340 ?auto_25341 ) ) ( not ( = ?auto_25339 ?auto_25340 ) ) ( not ( = ?auto_25339 ?auto_25341 ) ) ( not ( = ?auto_25345 ?auto_25348 ) ) ( HOIST-AT ?auto_25347 ?auto_25345 ) ( not ( = ?auto_25342 ?auto_25347 ) ) ( SURFACE-AT ?auto_25341 ?auto_25345 ) ( ON ?auto_25341 ?auto_25343 ) ( CLEAR ?auto_25341 ) ( not ( = ?auto_25340 ?auto_25343 ) ) ( not ( = ?auto_25341 ?auto_25343 ) ) ( not ( = ?auto_25339 ?auto_25343 ) ) ( IS-CRATE ?auto_25340 ) ( AVAILABLE ?auto_25347 ) ( SURFACE-AT ?auto_25340 ?auto_25345 ) ( ON ?auto_25340 ?auto_25344 ) ( CLEAR ?auto_25340 ) ( not ( = ?auto_25340 ?auto_25344 ) ) ( not ( = ?auto_25341 ?auto_25344 ) ) ( not ( = ?auto_25339 ?auto_25344 ) ) ( not ( = ?auto_25343 ?auto_25344 ) ) ( TRUCK-AT ?auto_25346 ?auto_25348 ) ( SURFACE-AT ?auto_25338 ?auto_25348 ) ( CLEAR ?auto_25338 ) ( IS-CRATE ?auto_25339 ) ( not ( = ?auto_25338 ?auto_25339 ) ) ( not ( = ?auto_25340 ?auto_25338 ) ) ( not ( = ?auto_25341 ?auto_25338 ) ) ( not ( = ?auto_25343 ?auto_25338 ) ) ( not ( = ?auto_25344 ?auto_25338 ) ) ( AVAILABLE ?auto_25342 ) ( IN ?auto_25339 ?auto_25346 ) ( ON ?auto_25338 ?auto_25337 ) ( not ( = ?auto_25337 ?auto_25338 ) ) ( not ( = ?auto_25337 ?auto_25339 ) ) ( not ( = ?auto_25337 ?auto_25340 ) ) ( not ( = ?auto_25337 ?auto_25341 ) ) ( not ( = ?auto_25337 ?auto_25343 ) ) ( not ( = ?auto_25337 ?auto_25344 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25339 ?auto_25340 ?auto_25341 )
      ( MAKE-4CRATE-VERIFY ?auto_25337 ?auto_25338 ?auto_25339 ?auto_25340 ?auto_25341 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25349 - SURFACE
      ?auto_25350 - SURFACE
    )
    :vars
    (
      ?auto_25352 - HOIST
      ?auto_25359 - PLACE
      ?auto_25351 - SURFACE
      ?auto_25355 - PLACE
      ?auto_25358 - HOIST
      ?auto_25353 - SURFACE
      ?auto_25354 - SURFACE
      ?auto_25357 - SURFACE
      ?auto_25356 - TRUCK
      ?auto_25360 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25352 ?auto_25359 ) ( IS-CRATE ?auto_25350 ) ( not ( = ?auto_25349 ?auto_25350 ) ) ( not ( = ?auto_25351 ?auto_25349 ) ) ( not ( = ?auto_25351 ?auto_25350 ) ) ( not ( = ?auto_25355 ?auto_25359 ) ) ( HOIST-AT ?auto_25358 ?auto_25355 ) ( not ( = ?auto_25352 ?auto_25358 ) ) ( SURFACE-AT ?auto_25350 ?auto_25355 ) ( ON ?auto_25350 ?auto_25353 ) ( CLEAR ?auto_25350 ) ( not ( = ?auto_25349 ?auto_25353 ) ) ( not ( = ?auto_25350 ?auto_25353 ) ) ( not ( = ?auto_25351 ?auto_25353 ) ) ( IS-CRATE ?auto_25349 ) ( AVAILABLE ?auto_25358 ) ( SURFACE-AT ?auto_25349 ?auto_25355 ) ( ON ?auto_25349 ?auto_25354 ) ( CLEAR ?auto_25349 ) ( not ( = ?auto_25349 ?auto_25354 ) ) ( not ( = ?auto_25350 ?auto_25354 ) ) ( not ( = ?auto_25351 ?auto_25354 ) ) ( not ( = ?auto_25353 ?auto_25354 ) ) ( SURFACE-AT ?auto_25357 ?auto_25359 ) ( CLEAR ?auto_25357 ) ( IS-CRATE ?auto_25351 ) ( not ( = ?auto_25357 ?auto_25351 ) ) ( not ( = ?auto_25349 ?auto_25357 ) ) ( not ( = ?auto_25350 ?auto_25357 ) ) ( not ( = ?auto_25353 ?auto_25357 ) ) ( not ( = ?auto_25354 ?auto_25357 ) ) ( AVAILABLE ?auto_25352 ) ( IN ?auto_25351 ?auto_25356 ) ( TRUCK-AT ?auto_25356 ?auto_25360 ) ( not ( = ?auto_25360 ?auto_25359 ) ) ( not ( = ?auto_25355 ?auto_25360 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25356 ?auto_25360 ?auto_25359 )
      ( MAKE-2CRATE ?auto_25351 ?auto_25349 ?auto_25350 )
      ( MAKE-1CRATE-VERIFY ?auto_25349 ?auto_25350 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25361 - SURFACE
      ?auto_25362 - SURFACE
      ?auto_25363 - SURFACE
    )
    :vars
    (
      ?auto_25372 - HOIST
      ?auto_25369 - PLACE
      ?auto_25365 - PLACE
      ?auto_25371 - HOIST
      ?auto_25368 - SURFACE
      ?auto_25370 - SURFACE
      ?auto_25364 - SURFACE
      ?auto_25366 - TRUCK
      ?auto_25367 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25372 ?auto_25369 ) ( IS-CRATE ?auto_25363 ) ( not ( = ?auto_25362 ?auto_25363 ) ) ( not ( = ?auto_25361 ?auto_25362 ) ) ( not ( = ?auto_25361 ?auto_25363 ) ) ( not ( = ?auto_25365 ?auto_25369 ) ) ( HOIST-AT ?auto_25371 ?auto_25365 ) ( not ( = ?auto_25372 ?auto_25371 ) ) ( SURFACE-AT ?auto_25363 ?auto_25365 ) ( ON ?auto_25363 ?auto_25368 ) ( CLEAR ?auto_25363 ) ( not ( = ?auto_25362 ?auto_25368 ) ) ( not ( = ?auto_25363 ?auto_25368 ) ) ( not ( = ?auto_25361 ?auto_25368 ) ) ( IS-CRATE ?auto_25362 ) ( AVAILABLE ?auto_25371 ) ( SURFACE-AT ?auto_25362 ?auto_25365 ) ( ON ?auto_25362 ?auto_25370 ) ( CLEAR ?auto_25362 ) ( not ( = ?auto_25362 ?auto_25370 ) ) ( not ( = ?auto_25363 ?auto_25370 ) ) ( not ( = ?auto_25361 ?auto_25370 ) ) ( not ( = ?auto_25368 ?auto_25370 ) ) ( SURFACE-AT ?auto_25364 ?auto_25369 ) ( CLEAR ?auto_25364 ) ( IS-CRATE ?auto_25361 ) ( not ( = ?auto_25364 ?auto_25361 ) ) ( not ( = ?auto_25362 ?auto_25364 ) ) ( not ( = ?auto_25363 ?auto_25364 ) ) ( not ( = ?auto_25368 ?auto_25364 ) ) ( not ( = ?auto_25370 ?auto_25364 ) ) ( AVAILABLE ?auto_25372 ) ( IN ?auto_25361 ?auto_25366 ) ( TRUCK-AT ?auto_25366 ?auto_25367 ) ( not ( = ?auto_25367 ?auto_25369 ) ) ( not ( = ?auto_25365 ?auto_25367 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25362 ?auto_25363 )
      ( MAKE-2CRATE-VERIFY ?auto_25361 ?auto_25362 ?auto_25363 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25373 - SURFACE
      ?auto_25374 - SURFACE
      ?auto_25375 - SURFACE
      ?auto_25376 - SURFACE
    )
    :vars
    (
      ?auto_25384 - HOIST
      ?auto_25377 - PLACE
      ?auto_25381 - PLACE
      ?auto_25378 - HOIST
      ?auto_25382 - SURFACE
      ?auto_25379 - SURFACE
      ?auto_25380 - TRUCK
      ?auto_25383 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25384 ?auto_25377 ) ( IS-CRATE ?auto_25376 ) ( not ( = ?auto_25375 ?auto_25376 ) ) ( not ( = ?auto_25374 ?auto_25375 ) ) ( not ( = ?auto_25374 ?auto_25376 ) ) ( not ( = ?auto_25381 ?auto_25377 ) ) ( HOIST-AT ?auto_25378 ?auto_25381 ) ( not ( = ?auto_25384 ?auto_25378 ) ) ( SURFACE-AT ?auto_25376 ?auto_25381 ) ( ON ?auto_25376 ?auto_25382 ) ( CLEAR ?auto_25376 ) ( not ( = ?auto_25375 ?auto_25382 ) ) ( not ( = ?auto_25376 ?auto_25382 ) ) ( not ( = ?auto_25374 ?auto_25382 ) ) ( IS-CRATE ?auto_25375 ) ( AVAILABLE ?auto_25378 ) ( SURFACE-AT ?auto_25375 ?auto_25381 ) ( ON ?auto_25375 ?auto_25379 ) ( CLEAR ?auto_25375 ) ( not ( = ?auto_25375 ?auto_25379 ) ) ( not ( = ?auto_25376 ?auto_25379 ) ) ( not ( = ?auto_25374 ?auto_25379 ) ) ( not ( = ?auto_25382 ?auto_25379 ) ) ( SURFACE-AT ?auto_25373 ?auto_25377 ) ( CLEAR ?auto_25373 ) ( IS-CRATE ?auto_25374 ) ( not ( = ?auto_25373 ?auto_25374 ) ) ( not ( = ?auto_25375 ?auto_25373 ) ) ( not ( = ?auto_25376 ?auto_25373 ) ) ( not ( = ?auto_25382 ?auto_25373 ) ) ( not ( = ?auto_25379 ?auto_25373 ) ) ( AVAILABLE ?auto_25384 ) ( IN ?auto_25374 ?auto_25380 ) ( TRUCK-AT ?auto_25380 ?auto_25383 ) ( not ( = ?auto_25383 ?auto_25377 ) ) ( not ( = ?auto_25381 ?auto_25383 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25374 ?auto_25375 ?auto_25376 )
      ( MAKE-3CRATE-VERIFY ?auto_25373 ?auto_25374 ?auto_25375 ?auto_25376 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25385 - SURFACE
      ?auto_25386 - SURFACE
      ?auto_25387 - SURFACE
      ?auto_25388 - SURFACE
      ?auto_25389 - SURFACE
    )
    :vars
    (
      ?auto_25397 - HOIST
      ?auto_25390 - PLACE
      ?auto_25394 - PLACE
      ?auto_25391 - HOIST
      ?auto_25395 - SURFACE
      ?auto_25392 - SURFACE
      ?auto_25393 - TRUCK
      ?auto_25396 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25397 ?auto_25390 ) ( IS-CRATE ?auto_25389 ) ( not ( = ?auto_25388 ?auto_25389 ) ) ( not ( = ?auto_25387 ?auto_25388 ) ) ( not ( = ?auto_25387 ?auto_25389 ) ) ( not ( = ?auto_25394 ?auto_25390 ) ) ( HOIST-AT ?auto_25391 ?auto_25394 ) ( not ( = ?auto_25397 ?auto_25391 ) ) ( SURFACE-AT ?auto_25389 ?auto_25394 ) ( ON ?auto_25389 ?auto_25395 ) ( CLEAR ?auto_25389 ) ( not ( = ?auto_25388 ?auto_25395 ) ) ( not ( = ?auto_25389 ?auto_25395 ) ) ( not ( = ?auto_25387 ?auto_25395 ) ) ( IS-CRATE ?auto_25388 ) ( AVAILABLE ?auto_25391 ) ( SURFACE-AT ?auto_25388 ?auto_25394 ) ( ON ?auto_25388 ?auto_25392 ) ( CLEAR ?auto_25388 ) ( not ( = ?auto_25388 ?auto_25392 ) ) ( not ( = ?auto_25389 ?auto_25392 ) ) ( not ( = ?auto_25387 ?auto_25392 ) ) ( not ( = ?auto_25395 ?auto_25392 ) ) ( SURFACE-AT ?auto_25386 ?auto_25390 ) ( CLEAR ?auto_25386 ) ( IS-CRATE ?auto_25387 ) ( not ( = ?auto_25386 ?auto_25387 ) ) ( not ( = ?auto_25388 ?auto_25386 ) ) ( not ( = ?auto_25389 ?auto_25386 ) ) ( not ( = ?auto_25395 ?auto_25386 ) ) ( not ( = ?auto_25392 ?auto_25386 ) ) ( AVAILABLE ?auto_25397 ) ( IN ?auto_25387 ?auto_25393 ) ( TRUCK-AT ?auto_25393 ?auto_25396 ) ( not ( = ?auto_25396 ?auto_25390 ) ) ( not ( = ?auto_25394 ?auto_25396 ) ) ( ON ?auto_25386 ?auto_25385 ) ( not ( = ?auto_25385 ?auto_25386 ) ) ( not ( = ?auto_25385 ?auto_25387 ) ) ( not ( = ?auto_25385 ?auto_25388 ) ) ( not ( = ?auto_25385 ?auto_25389 ) ) ( not ( = ?auto_25385 ?auto_25395 ) ) ( not ( = ?auto_25385 ?auto_25392 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25387 ?auto_25388 ?auto_25389 )
      ( MAKE-4CRATE-VERIFY ?auto_25385 ?auto_25386 ?auto_25387 ?auto_25388 ?auto_25389 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25398 - SURFACE
      ?auto_25399 - SURFACE
    )
    :vars
    (
      ?auto_25409 - HOIST
      ?auto_25401 - PLACE
      ?auto_25400 - SURFACE
      ?auto_25406 - PLACE
      ?auto_25403 - HOIST
      ?auto_25407 - SURFACE
      ?auto_25404 - SURFACE
      ?auto_25402 - SURFACE
      ?auto_25405 - TRUCK
      ?auto_25408 - PLACE
      ?auto_25410 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25409 ?auto_25401 ) ( IS-CRATE ?auto_25399 ) ( not ( = ?auto_25398 ?auto_25399 ) ) ( not ( = ?auto_25400 ?auto_25398 ) ) ( not ( = ?auto_25400 ?auto_25399 ) ) ( not ( = ?auto_25406 ?auto_25401 ) ) ( HOIST-AT ?auto_25403 ?auto_25406 ) ( not ( = ?auto_25409 ?auto_25403 ) ) ( SURFACE-AT ?auto_25399 ?auto_25406 ) ( ON ?auto_25399 ?auto_25407 ) ( CLEAR ?auto_25399 ) ( not ( = ?auto_25398 ?auto_25407 ) ) ( not ( = ?auto_25399 ?auto_25407 ) ) ( not ( = ?auto_25400 ?auto_25407 ) ) ( IS-CRATE ?auto_25398 ) ( AVAILABLE ?auto_25403 ) ( SURFACE-AT ?auto_25398 ?auto_25406 ) ( ON ?auto_25398 ?auto_25404 ) ( CLEAR ?auto_25398 ) ( not ( = ?auto_25398 ?auto_25404 ) ) ( not ( = ?auto_25399 ?auto_25404 ) ) ( not ( = ?auto_25400 ?auto_25404 ) ) ( not ( = ?auto_25407 ?auto_25404 ) ) ( SURFACE-AT ?auto_25402 ?auto_25401 ) ( CLEAR ?auto_25402 ) ( IS-CRATE ?auto_25400 ) ( not ( = ?auto_25402 ?auto_25400 ) ) ( not ( = ?auto_25398 ?auto_25402 ) ) ( not ( = ?auto_25399 ?auto_25402 ) ) ( not ( = ?auto_25407 ?auto_25402 ) ) ( not ( = ?auto_25404 ?auto_25402 ) ) ( AVAILABLE ?auto_25409 ) ( TRUCK-AT ?auto_25405 ?auto_25408 ) ( not ( = ?auto_25408 ?auto_25401 ) ) ( not ( = ?auto_25406 ?auto_25408 ) ) ( HOIST-AT ?auto_25410 ?auto_25408 ) ( LIFTING ?auto_25410 ?auto_25400 ) ( not ( = ?auto_25409 ?auto_25410 ) ) ( not ( = ?auto_25403 ?auto_25410 ) ) )
    :subtasks
    ( ( !LOAD ?auto_25410 ?auto_25400 ?auto_25405 ?auto_25408 )
      ( MAKE-2CRATE ?auto_25400 ?auto_25398 ?auto_25399 )
      ( MAKE-1CRATE-VERIFY ?auto_25398 ?auto_25399 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25411 - SURFACE
      ?auto_25412 - SURFACE
      ?auto_25413 - SURFACE
    )
    :vars
    (
      ?auto_25416 - HOIST
      ?auto_25414 - PLACE
      ?auto_25423 - PLACE
      ?auto_25422 - HOIST
      ?auto_25418 - SURFACE
      ?auto_25419 - SURFACE
      ?auto_25415 - SURFACE
      ?auto_25420 - TRUCK
      ?auto_25417 - PLACE
      ?auto_25421 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25416 ?auto_25414 ) ( IS-CRATE ?auto_25413 ) ( not ( = ?auto_25412 ?auto_25413 ) ) ( not ( = ?auto_25411 ?auto_25412 ) ) ( not ( = ?auto_25411 ?auto_25413 ) ) ( not ( = ?auto_25423 ?auto_25414 ) ) ( HOIST-AT ?auto_25422 ?auto_25423 ) ( not ( = ?auto_25416 ?auto_25422 ) ) ( SURFACE-AT ?auto_25413 ?auto_25423 ) ( ON ?auto_25413 ?auto_25418 ) ( CLEAR ?auto_25413 ) ( not ( = ?auto_25412 ?auto_25418 ) ) ( not ( = ?auto_25413 ?auto_25418 ) ) ( not ( = ?auto_25411 ?auto_25418 ) ) ( IS-CRATE ?auto_25412 ) ( AVAILABLE ?auto_25422 ) ( SURFACE-AT ?auto_25412 ?auto_25423 ) ( ON ?auto_25412 ?auto_25419 ) ( CLEAR ?auto_25412 ) ( not ( = ?auto_25412 ?auto_25419 ) ) ( not ( = ?auto_25413 ?auto_25419 ) ) ( not ( = ?auto_25411 ?auto_25419 ) ) ( not ( = ?auto_25418 ?auto_25419 ) ) ( SURFACE-AT ?auto_25415 ?auto_25414 ) ( CLEAR ?auto_25415 ) ( IS-CRATE ?auto_25411 ) ( not ( = ?auto_25415 ?auto_25411 ) ) ( not ( = ?auto_25412 ?auto_25415 ) ) ( not ( = ?auto_25413 ?auto_25415 ) ) ( not ( = ?auto_25418 ?auto_25415 ) ) ( not ( = ?auto_25419 ?auto_25415 ) ) ( AVAILABLE ?auto_25416 ) ( TRUCK-AT ?auto_25420 ?auto_25417 ) ( not ( = ?auto_25417 ?auto_25414 ) ) ( not ( = ?auto_25423 ?auto_25417 ) ) ( HOIST-AT ?auto_25421 ?auto_25417 ) ( LIFTING ?auto_25421 ?auto_25411 ) ( not ( = ?auto_25416 ?auto_25421 ) ) ( not ( = ?auto_25422 ?auto_25421 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25412 ?auto_25413 )
      ( MAKE-2CRATE-VERIFY ?auto_25411 ?auto_25412 ?auto_25413 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25424 - SURFACE
      ?auto_25425 - SURFACE
      ?auto_25426 - SURFACE
      ?auto_25427 - SURFACE
    )
    :vars
    (
      ?auto_25431 - HOIST
      ?auto_25434 - PLACE
      ?auto_25429 - PLACE
      ?auto_25436 - HOIST
      ?auto_25430 - SURFACE
      ?auto_25428 - SURFACE
      ?auto_25432 - TRUCK
      ?auto_25435 - PLACE
      ?auto_25433 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25431 ?auto_25434 ) ( IS-CRATE ?auto_25427 ) ( not ( = ?auto_25426 ?auto_25427 ) ) ( not ( = ?auto_25425 ?auto_25426 ) ) ( not ( = ?auto_25425 ?auto_25427 ) ) ( not ( = ?auto_25429 ?auto_25434 ) ) ( HOIST-AT ?auto_25436 ?auto_25429 ) ( not ( = ?auto_25431 ?auto_25436 ) ) ( SURFACE-AT ?auto_25427 ?auto_25429 ) ( ON ?auto_25427 ?auto_25430 ) ( CLEAR ?auto_25427 ) ( not ( = ?auto_25426 ?auto_25430 ) ) ( not ( = ?auto_25427 ?auto_25430 ) ) ( not ( = ?auto_25425 ?auto_25430 ) ) ( IS-CRATE ?auto_25426 ) ( AVAILABLE ?auto_25436 ) ( SURFACE-AT ?auto_25426 ?auto_25429 ) ( ON ?auto_25426 ?auto_25428 ) ( CLEAR ?auto_25426 ) ( not ( = ?auto_25426 ?auto_25428 ) ) ( not ( = ?auto_25427 ?auto_25428 ) ) ( not ( = ?auto_25425 ?auto_25428 ) ) ( not ( = ?auto_25430 ?auto_25428 ) ) ( SURFACE-AT ?auto_25424 ?auto_25434 ) ( CLEAR ?auto_25424 ) ( IS-CRATE ?auto_25425 ) ( not ( = ?auto_25424 ?auto_25425 ) ) ( not ( = ?auto_25426 ?auto_25424 ) ) ( not ( = ?auto_25427 ?auto_25424 ) ) ( not ( = ?auto_25430 ?auto_25424 ) ) ( not ( = ?auto_25428 ?auto_25424 ) ) ( AVAILABLE ?auto_25431 ) ( TRUCK-AT ?auto_25432 ?auto_25435 ) ( not ( = ?auto_25435 ?auto_25434 ) ) ( not ( = ?auto_25429 ?auto_25435 ) ) ( HOIST-AT ?auto_25433 ?auto_25435 ) ( LIFTING ?auto_25433 ?auto_25425 ) ( not ( = ?auto_25431 ?auto_25433 ) ) ( not ( = ?auto_25436 ?auto_25433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25425 ?auto_25426 ?auto_25427 )
      ( MAKE-3CRATE-VERIFY ?auto_25424 ?auto_25425 ?auto_25426 ?auto_25427 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25437 - SURFACE
      ?auto_25438 - SURFACE
      ?auto_25439 - SURFACE
      ?auto_25440 - SURFACE
      ?auto_25441 - SURFACE
    )
    :vars
    (
      ?auto_25445 - HOIST
      ?auto_25448 - PLACE
      ?auto_25443 - PLACE
      ?auto_25450 - HOIST
      ?auto_25444 - SURFACE
      ?auto_25442 - SURFACE
      ?auto_25446 - TRUCK
      ?auto_25449 - PLACE
      ?auto_25447 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25445 ?auto_25448 ) ( IS-CRATE ?auto_25441 ) ( not ( = ?auto_25440 ?auto_25441 ) ) ( not ( = ?auto_25439 ?auto_25440 ) ) ( not ( = ?auto_25439 ?auto_25441 ) ) ( not ( = ?auto_25443 ?auto_25448 ) ) ( HOIST-AT ?auto_25450 ?auto_25443 ) ( not ( = ?auto_25445 ?auto_25450 ) ) ( SURFACE-AT ?auto_25441 ?auto_25443 ) ( ON ?auto_25441 ?auto_25444 ) ( CLEAR ?auto_25441 ) ( not ( = ?auto_25440 ?auto_25444 ) ) ( not ( = ?auto_25441 ?auto_25444 ) ) ( not ( = ?auto_25439 ?auto_25444 ) ) ( IS-CRATE ?auto_25440 ) ( AVAILABLE ?auto_25450 ) ( SURFACE-AT ?auto_25440 ?auto_25443 ) ( ON ?auto_25440 ?auto_25442 ) ( CLEAR ?auto_25440 ) ( not ( = ?auto_25440 ?auto_25442 ) ) ( not ( = ?auto_25441 ?auto_25442 ) ) ( not ( = ?auto_25439 ?auto_25442 ) ) ( not ( = ?auto_25444 ?auto_25442 ) ) ( SURFACE-AT ?auto_25438 ?auto_25448 ) ( CLEAR ?auto_25438 ) ( IS-CRATE ?auto_25439 ) ( not ( = ?auto_25438 ?auto_25439 ) ) ( not ( = ?auto_25440 ?auto_25438 ) ) ( not ( = ?auto_25441 ?auto_25438 ) ) ( not ( = ?auto_25444 ?auto_25438 ) ) ( not ( = ?auto_25442 ?auto_25438 ) ) ( AVAILABLE ?auto_25445 ) ( TRUCK-AT ?auto_25446 ?auto_25449 ) ( not ( = ?auto_25449 ?auto_25448 ) ) ( not ( = ?auto_25443 ?auto_25449 ) ) ( HOIST-AT ?auto_25447 ?auto_25449 ) ( LIFTING ?auto_25447 ?auto_25439 ) ( not ( = ?auto_25445 ?auto_25447 ) ) ( not ( = ?auto_25450 ?auto_25447 ) ) ( ON ?auto_25438 ?auto_25437 ) ( not ( = ?auto_25437 ?auto_25438 ) ) ( not ( = ?auto_25437 ?auto_25439 ) ) ( not ( = ?auto_25437 ?auto_25440 ) ) ( not ( = ?auto_25437 ?auto_25441 ) ) ( not ( = ?auto_25437 ?auto_25444 ) ) ( not ( = ?auto_25437 ?auto_25442 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25439 ?auto_25440 ?auto_25441 )
      ( MAKE-4CRATE-VERIFY ?auto_25437 ?auto_25438 ?auto_25439 ?auto_25440 ?auto_25441 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25451 - SURFACE
      ?auto_25452 - SURFACE
    )
    :vars
    (
      ?auto_25458 - HOIST
      ?auto_25461 - PLACE
      ?auto_25454 - SURFACE
      ?auto_25456 - PLACE
      ?auto_25463 - HOIST
      ?auto_25457 - SURFACE
      ?auto_25453 - SURFACE
      ?auto_25455 - SURFACE
      ?auto_25459 - TRUCK
      ?auto_25462 - PLACE
      ?auto_25460 - HOIST
      ?auto_25464 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25458 ?auto_25461 ) ( IS-CRATE ?auto_25452 ) ( not ( = ?auto_25451 ?auto_25452 ) ) ( not ( = ?auto_25454 ?auto_25451 ) ) ( not ( = ?auto_25454 ?auto_25452 ) ) ( not ( = ?auto_25456 ?auto_25461 ) ) ( HOIST-AT ?auto_25463 ?auto_25456 ) ( not ( = ?auto_25458 ?auto_25463 ) ) ( SURFACE-AT ?auto_25452 ?auto_25456 ) ( ON ?auto_25452 ?auto_25457 ) ( CLEAR ?auto_25452 ) ( not ( = ?auto_25451 ?auto_25457 ) ) ( not ( = ?auto_25452 ?auto_25457 ) ) ( not ( = ?auto_25454 ?auto_25457 ) ) ( IS-CRATE ?auto_25451 ) ( AVAILABLE ?auto_25463 ) ( SURFACE-AT ?auto_25451 ?auto_25456 ) ( ON ?auto_25451 ?auto_25453 ) ( CLEAR ?auto_25451 ) ( not ( = ?auto_25451 ?auto_25453 ) ) ( not ( = ?auto_25452 ?auto_25453 ) ) ( not ( = ?auto_25454 ?auto_25453 ) ) ( not ( = ?auto_25457 ?auto_25453 ) ) ( SURFACE-AT ?auto_25455 ?auto_25461 ) ( CLEAR ?auto_25455 ) ( IS-CRATE ?auto_25454 ) ( not ( = ?auto_25455 ?auto_25454 ) ) ( not ( = ?auto_25451 ?auto_25455 ) ) ( not ( = ?auto_25452 ?auto_25455 ) ) ( not ( = ?auto_25457 ?auto_25455 ) ) ( not ( = ?auto_25453 ?auto_25455 ) ) ( AVAILABLE ?auto_25458 ) ( TRUCK-AT ?auto_25459 ?auto_25462 ) ( not ( = ?auto_25462 ?auto_25461 ) ) ( not ( = ?auto_25456 ?auto_25462 ) ) ( HOIST-AT ?auto_25460 ?auto_25462 ) ( not ( = ?auto_25458 ?auto_25460 ) ) ( not ( = ?auto_25463 ?auto_25460 ) ) ( AVAILABLE ?auto_25460 ) ( SURFACE-AT ?auto_25454 ?auto_25462 ) ( ON ?auto_25454 ?auto_25464 ) ( CLEAR ?auto_25454 ) ( not ( = ?auto_25451 ?auto_25464 ) ) ( not ( = ?auto_25452 ?auto_25464 ) ) ( not ( = ?auto_25454 ?auto_25464 ) ) ( not ( = ?auto_25457 ?auto_25464 ) ) ( not ( = ?auto_25453 ?auto_25464 ) ) ( not ( = ?auto_25455 ?auto_25464 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25460 ?auto_25454 ?auto_25464 ?auto_25462 )
      ( MAKE-2CRATE ?auto_25454 ?auto_25451 ?auto_25452 )
      ( MAKE-1CRATE-VERIFY ?auto_25451 ?auto_25452 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25465 - SURFACE
      ?auto_25466 - SURFACE
      ?auto_25467 - SURFACE
    )
    :vars
    (
      ?auto_25478 - HOIST
      ?auto_25476 - PLACE
      ?auto_25474 - PLACE
      ?auto_25475 - HOIST
      ?auto_25473 - SURFACE
      ?auto_25468 - SURFACE
      ?auto_25469 - SURFACE
      ?auto_25477 - TRUCK
      ?auto_25471 - PLACE
      ?auto_25472 - HOIST
      ?auto_25470 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25478 ?auto_25476 ) ( IS-CRATE ?auto_25467 ) ( not ( = ?auto_25466 ?auto_25467 ) ) ( not ( = ?auto_25465 ?auto_25466 ) ) ( not ( = ?auto_25465 ?auto_25467 ) ) ( not ( = ?auto_25474 ?auto_25476 ) ) ( HOIST-AT ?auto_25475 ?auto_25474 ) ( not ( = ?auto_25478 ?auto_25475 ) ) ( SURFACE-AT ?auto_25467 ?auto_25474 ) ( ON ?auto_25467 ?auto_25473 ) ( CLEAR ?auto_25467 ) ( not ( = ?auto_25466 ?auto_25473 ) ) ( not ( = ?auto_25467 ?auto_25473 ) ) ( not ( = ?auto_25465 ?auto_25473 ) ) ( IS-CRATE ?auto_25466 ) ( AVAILABLE ?auto_25475 ) ( SURFACE-AT ?auto_25466 ?auto_25474 ) ( ON ?auto_25466 ?auto_25468 ) ( CLEAR ?auto_25466 ) ( not ( = ?auto_25466 ?auto_25468 ) ) ( not ( = ?auto_25467 ?auto_25468 ) ) ( not ( = ?auto_25465 ?auto_25468 ) ) ( not ( = ?auto_25473 ?auto_25468 ) ) ( SURFACE-AT ?auto_25469 ?auto_25476 ) ( CLEAR ?auto_25469 ) ( IS-CRATE ?auto_25465 ) ( not ( = ?auto_25469 ?auto_25465 ) ) ( not ( = ?auto_25466 ?auto_25469 ) ) ( not ( = ?auto_25467 ?auto_25469 ) ) ( not ( = ?auto_25473 ?auto_25469 ) ) ( not ( = ?auto_25468 ?auto_25469 ) ) ( AVAILABLE ?auto_25478 ) ( TRUCK-AT ?auto_25477 ?auto_25471 ) ( not ( = ?auto_25471 ?auto_25476 ) ) ( not ( = ?auto_25474 ?auto_25471 ) ) ( HOIST-AT ?auto_25472 ?auto_25471 ) ( not ( = ?auto_25478 ?auto_25472 ) ) ( not ( = ?auto_25475 ?auto_25472 ) ) ( AVAILABLE ?auto_25472 ) ( SURFACE-AT ?auto_25465 ?auto_25471 ) ( ON ?auto_25465 ?auto_25470 ) ( CLEAR ?auto_25465 ) ( not ( = ?auto_25466 ?auto_25470 ) ) ( not ( = ?auto_25467 ?auto_25470 ) ) ( not ( = ?auto_25465 ?auto_25470 ) ) ( not ( = ?auto_25473 ?auto_25470 ) ) ( not ( = ?auto_25468 ?auto_25470 ) ) ( not ( = ?auto_25469 ?auto_25470 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25466 ?auto_25467 )
      ( MAKE-2CRATE-VERIFY ?auto_25465 ?auto_25466 ?auto_25467 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25479 - SURFACE
      ?auto_25480 - SURFACE
      ?auto_25481 - SURFACE
      ?auto_25482 - SURFACE
    )
    :vars
    (
      ?auto_25485 - HOIST
      ?auto_25489 - PLACE
      ?auto_25483 - PLACE
      ?auto_25486 - HOIST
      ?auto_25490 - SURFACE
      ?auto_25488 - SURFACE
      ?auto_25484 - TRUCK
      ?auto_25487 - PLACE
      ?auto_25492 - HOIST
      ?auto_25491 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25485 ?auto_25489 ) ( IS-CRATE ?auto_25482 ) ( not ( = ?auto_25481 ?auto_25482 ) ) ( not ( = ?auto_25480 ?auto_25481 ) ) ( not ( = ?auto_25480 ?auto_25482 ) ) ( not ( = ?auto_25483 ?auto_25489 ) ) ( HOIST-AT ?auto_25486 ?auto_25483 ) ( not ( = ?auto_25485 ?auto_25486 ) ) ( SURFACE-AT ?auto_25482 ?auto_25483 ) ( ON ?auto_25482 ?auto_25490 ) ( CLEAR ?auto_25482 ) ( not ( = ?auto_25481 ?auto_25490 ) ) ( not ( = ?auto_25482 ?auto_25490 ) ) ( not ( = ?auto_25480 ?auto_25490 ) ) ( IS-CRATE ?auto_25481 ) ( AVAILABLE ?auto_25486 ) ( SURFACE-AT ?auto_25481 ?auto_25483 ) ( ON ?auto_25481 ?auto_25488 ) ( CLEAR ?auto_25481 ) ( not ( = ?auto_25481 ?auto_25488 ) ) ( not ( = ?auto_25482 ?auto_25488 ) ) ( not ( = ?auto_25480 ?auto_25488 ) ) ( not ( = ?auto_25490 ?auto_25488 ) ) ( SURFACE-AT ?auto_25479 ?auto_25489 ) ( CLEAR ?auto_25479 ) ( IS-CRATE ?auto_25480 ) ( not ( = ?auto_25479 ?auto_25480 ) ) ( not ( = ?auto_25481 ?auto_25479 ) ) ( not ( = ?auto_25482 ?auto_25479 ) ) ( not ( = ?auto_25490 ?auto_25479 ) ) ( not ( = ?auto_25488 ?auto_25479 ) ) ( AVAILABLE ?auto_25485 ) ( TRUCK-AT ?auto_25484 ?auto_25487 ) ( not ( = ?auto_25487 ?auto_25489 ) ) ( not ( = ?auto_25483 ?auto_25487 ) ) ( HOIST-AT ?auto_25492 ?auto_25487 ) ( not ( = ?auto_25485 ?auto_25492 ) ) ( not ( = ?auto_25486 ?auto_25492 ) ) ( AVAILABLE ?auto_25492 ) ( SURFACE-AT ?auto_25480 ?auto_25487 ) ( ON ?auto_25480 ?auto_25491 ) ( CLEAR ?auto_25480 ) ( not ( = ?auto_25481 ?auto_25491 ) ) ( not ( = ?auto_25482 ?auto_25491 ) ) ( not ( = ?auto_25480 ?auto_25491 ) ) ( not ( = ?auto_25490 ?auto_25491 ) ) ( not ( = ?auto_25488 ?auto_25491 ) ) ( not ( = ?auto_25479 ?auto_25491 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25480 ?auto_25481 ?auto_25482 )
      ( MAKE-3CRATE-VERIFY ?auto_25479 ?auto_25480 ?auto_25481 ?auto_25482 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25493 - SURFACE
      ?auto_25494 - SURFACE
      ?auto_25495 - SURFACE
      ?auto_25496 - SURFACE
      ?auto_25497 - SURFACE
    )
    :vars
    (
      ?auto_25500 - HOIST
      ?auto_25504 - PLACE
      ?auto_25498 - PLACE
      ?auto_25501 - HOIST
      ?auto_25505 - SURFACE
      ?auto_25503 - SURFACE
      ?auto_25499 - TRUCK
      ?auto_25502 - PLACE
      ?auto_25507 - HOIST
      ?auto_25506 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25500 ?auto_25504 ) ( IS-CRATE ?auto_25497 ) ( not ( = ?auto_25496 ?auto_25497 ) ) ( not ( = ?auto_25495 ?auto_25496 ) ) ( not ( = ?auto_25495 ?auto_25497 ) ) ( not ( = ?auto_25498 ?auto_25504 ) ) ( HOIST-AT ?auto_25501 ?auto_25498 ) ( not ( = ?auto_25500 ?auto_25501 ) ) ( SURFACE-AT ?auto_25497 ?auto_25498 ) ( ON ?auto_25497 ?auto_25505 ) ( CLEAR ?auto_25497 ) ( not ( = ?auto_25496 ?auto_25505 ) ) ( not ( = ?auto_25497 ?auto_25505 ) ) ( not ( = ?auto_25495 ?auto_25505 ) ) ( IS-CRATE ?auto_25496 ) ( AVAILABLE ?auto_25501 ) ( SURFACE-AT ?auto_25496 ?auto_25498 ) ( ON ?auto_25496 ?auto_25503 ) ( CLEAR ?auto_25496 ) ( not ( = ?auto_25496 ?auto_25503 ) ) ( not ( = ?auto_25497 ?auto_25503 ) ) ( not ( = ?auto_25495 ?auto_25503 ) ) ( not ( = ?auto_25505 ?auto_25503 ) ) ( SURFACE-AT ?auto_25494 ?auto_25504 ) ( CLEAR ?auto_25494 ) ( IS-CRATE ?auto_25495 ) ( not ( = ?auto_25494 ?auto_25495 ) ) ( not ( = ?auto_25496 ?auto_25494 ) ) ( not ( = ?auto_25497 ?auto_25494 ) ) ( not ( = ?auto_25505 ?auto_25494 ) ) ( not ( = ?auto_25503 ?auto_25494 ) ) ( AVAILABLE ?auto_25500 ) ( TRUCK-AT ?auto_25499 ?auto_25502 ) ( not ( = ?auto_25502 ?auto_25504 ) ) ( not ( = ?auto_25498 ?auto_25502 ) ) ( HOIST-AT ?auto_25507 ?auto_25502 ) ( not ( = ?auto_25500 ?auto_25507 ) ) ( not ( = ?auto_25501 ?auto_25507 ) ) ( AVAILABLE ?auto_25507 ) ( SURFACE-AT ?auto_25495 ?auto_25502 ) ( ON ?auto_25495 ?auto_25506 ) ( CLEAR ?auto_25495 ) ( not ( = ?auto_25496 ?auto_25506 ) ) ( not ( = ?auto_25497 ?auto_25506 ) ) ( not ( = ?auto_25495 ?auto_25506 ) ) ( not ( = ?auto_25505 ?auto_25506 ) ) ( not ( = ?auto_25503 ?auto_25506 ) ) ( not ( = ?auto_25494 ?auto_25506 ) ) ( ON ?auto_25494 ?auto_25493 ) ( not ( = ?auto_25493 ?auto_25494 ) ) ( not ( = ?auto_25493 ?auto_25495 ) ) ( not ( = ?auto_25493 ?auto_25496 ) ) ( not ( = ?auto_25493 ?auto_25497 ) ) ( not ( = ?auto_25493 ?auto_25505 ) ) ( not ( = ?auto_25493 ?auto_25503 ) ) ( not ( = ?auto_25493 ?auto_25506 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25495 ?auto_25496 ?auto_25497 )
      ( MAKE-4CRATE-VERIFY ?auto_25493 ?auto_25494 ?auto_25495 ?auto_25496 ?auto_25497 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25508 - SURFACE
      ?auto_25509 - SURFACE
    )
    :vars
    (
      ?auto_25512 - HOIST
      ?auto_25517 - PLACE
      ?auto_25515 - SURFACE
      ?auto_25510 - PLACE
      ?auto_25513 - HOIST
      ?auto_25518 - SURFACE
      ?auto_25516 - SURFACE
      ?auto_25520 - SURFACE
      ?auto_25514 - PLACE
      ?auto_25521 - HOIST
      ?auto_25519 - SURFACE
      ?auto_25511 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25512 ?auto_25517 ) ( IS-CRATE ?auto_25509 ) ( not ( = ?auto_25508 ?auto_25509 ) ) ( not ( = ?auto_25515 ?auto_25508 ) ) ( not ( = ?auto_25515 ?auto_25509 ) ) ( not ( = ?auto_25510 ?auto_25517 ) ) ( HOIST-AT ?auto_25513 ?auto_25510 ) ( not ( = ?auto_25512 ?auto_25513 ) ) ( SURFACE-AT ?auto_25509 ?auto_25510 ) ( ON ?auto_25509 ?auto_25518 ) ( CLEAR ?auto_25509 ) ( not ( = ?auto_25508 ?auto_25518 ) ) ( not ( = ?auto_25509 ?auto_25518 ) ) ( not ( = ?auto_25515 ?auto_25518 ) ) ( IS-CRATE ?auto_25508 ) ( AVAILABLE ?auto_25513 ) ( SURFACE-AT ?auto_25508 ?auto_25510 ) ( ON ?auto_25508 ?auto_25516 ) ( CLEAR ?auto_25508 ) ( not ( = ?auto_25508 ?auto_25516 ) ) ( not ( = ?auto_25509 ?auto_25516 ) ) ( not ( = ?auto_25515 ?auto_25516 ) ) ( not ( = ?auto_25518 ?auto_25516 ) ) ( SURFACE-AT ?auto_25520 ?auto_25517 ) ( CLEAR ?auto_25520 ) ( IS-CRATE ?auto_25515 ) ( not ( = ?auto_25520 ?auto_25515 ) ) ( not ( = ?auto_25508 ?auto_25520 ) ) ( not ( = ?auto_25509 ?auto_25520 ) ) ( not ( = ?auto_25518 ?auto_25520 ) ) ( not ( = ?auto_25516 ?auto_25520 ) ) ( AVAILABLE ?auto_25512 ) ( not ( = ?auto_25514 ?auto_25517 ) ) ( not ( = ?auto_25510 ?auto_25514 ) ) ( HOIST-AT ?auto_25521 ?auto_25514 ) ( not ( = ?auto_25512 ?auto_25521 ) ) ( not ( = ?auto_25513 ?auto_25521 ) ) ( AVAILABLE ?auto_25521 ) ( SURFACE-AT ?auto_25515 ?auto_25514 ) ( ON ?auto_25515 ?auto_25519 ) ( CLEAR ?auto_25515 ) ( not ( = ?auto_25508 ?auto_25519 ) ) ( not ( = ?auto_25509 ?auto_25519 ) ) ( not ( = ?auto_25515 ?auto_25519 ) ) ( not ( = ?auto_25518 ?auto_25519 ) ) ( not ( = ?auto_25516 ?auto_25519 ) ) ( not ( = ?auto_25520 ?auto_25519 ) ) ( TRUCK-AT ?auto_25511 ?auto_25517 ) )
    :subtasks
    ( ( !DRIVE ?auto_25511 ?auto_25517 ?auto_25514 )
      ( MAKE-2CRATE ?auto_25515 ?auto_25508 ?auto_25509 )
      ( MAKE-1CRATE-VERIFY ?auto_25508 ?auto_25509 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25522 - SURFACE
      ?auto_25523 - SURFACE
      ?auto_25524 - SURFACE
    )
    :vars
    (
      ?auto_25534 - HOIST
      ?auto_25527 - PLACE
      ?auto_25531 - PLACE
      ?auto_25535 - HOIST
      ?auto_25528 - SURFACE
      ?auto_25525 - SURFACE
      ?auto_25532 - SURFACE
      ?auto_25533 - PLACE
      ?auto_25526 - HOIST
      ?auto_25530 - SURFACE
      ?auto_25529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25534 ?auto_25527 ) ( IS-CRATE ?auto_25524 ) ( not ( = ?auto_25523 ?auto_25524 ) ) ( not ( = ?auto_25522 ?auto_25523 ) ) ( not ( = ?auto_25522 ?auto_25524 ) ) ( not ( = ?auto_25531 ?auto_25527 ) ) ( HOIST-AT ?auto_25535 ?auto_25531 ) ( not ( = ?auto_25534 ?auto_25535 ) ) ( SURFACE-AT ?auto_25524 ?auto_25531 ) ( ON ?auto_25524 ?auto_25528 ) ( CLEAR ?auto_25524 ) ( not ( = ?auto_25523 ?auto_25528 ) ) ( not ( = ?auto_25524 ?auto_25528 ) ) ( not ( = ?auto_25522 ?auto_25528 ) ) ( IS-CRATE ?auto_25523 ) ( AVAILABLE ?auto_25535 ) ( SURFACE-AT ?auto_25523 ?auto_25531 ) ( ON ?auto_25523 ?auto_25525 ) ( CLEAR ?auto_25523 ) ( not ( = ?auto_25523 ?auto_25525 ) ) ( not ( = ?auto_25524 ?auto_25525 ) ) ( not ( = ?auto_25522 ?auto_25525 ) ) ( not ( = ?auto_25528 ?auto_25525 ) ) ( SURFACE-AT ?auto_25532 ?auto_25527 ) ( CLEAR ?auto_25532 ) ( IS-CRATE ?auto_25522 ) ( not ( = ?auto_25532 ?auto_25522 ) ) ( not ( = ?auto_25523 ?auto_25532 ) ) ( not ( = ?auto_25524 ?auto_25532 ) ) ( not ( = ?auto_25528 ?auto_25532 ) ) ( not ( = ?auto_25525 ?auto_25532 ) ) ( AVAILABLE ?auto_25534 ) ( not ( = ?auto_25533 ?auto_25527 ) ) ( not ( = ?auto_25531 ?auto_25533 ) ) ( HOIST-AT ?auto_25526 ?auto_25533 ) ( not ( = ?auto_25534 ?auto_25526 ) ) ( not ( = ?auto_25535 ?auto_25526 ) ) ( AVAILABLE ?auto_25526 ) ( SURFACE-AT ?auto_25522 ?auto_25533 ) ( ON ?auto_25522 ?auto_25530 ) ( CLEAR ?auto_25522 ) ( not ( = ?auto_25523 ?auto_25530 ) ) ( not ( = ?auto_25524 ?auto_25530 ) ) ( not ( = ?auto_25522 ?auto_25530 ) ) ( not ( = ?auto_25528 ?auto_25530 ) ) ( not ( = ?auto_25525 ?auto_25530 ) ) ( not ( = ?auto_25532 ?auto_25530 ) ) ( TRUCK-AT ?auto_25529 ?auto_25527 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25523 ?auto_25524 )
      ( MAKE-2CRATE-VERIFY ?auto_25522 ?auto_25523 ?auto_25524 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25536 - SURFACE
      ?auto_25537 - SURFACE
      ?auto_25538 - SURFACE
      ?auto_25539 - SURFACE
    )
    :vars
    (
      ?auto_25548 - HOIST
      ?auto_25545 - PLACE
      ?auto_25547 - PLACE
      ?auto_25549 - HOIST
      ?auto_25543 - SURFACE
      ?auto_25546 - SURFACE
      ?auto_25544 - PLACE
      ?auto_25541 - HOIST
      ?auto_25540 - SURFACE
      ?auto_25542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25548 ?auto_25545 ) ( IS-CRATE ?auto_25539 ) ( not ( = ?auto_25538 ?auto_25539 ) ) ( not ( = ?auto_25537 ?auto_25538 ) ) ( not ( = ?auto_25537 ?auto_25539 ) ) ( not ( = ?auto_25547 ?auto_25545 ) ) ( HOIST-AT ?auto_25549 ?auto_25547 ) ( not ( = ?auto_25548 ?auto_25549 ) ) ( SURFACE-AT ?auto_25539 ?auto_25547 ) ( ON ?auto_25539 ?auto_25543 ) ( CLEAR ?auto_25539 ) ( not ( = ?auto_25538 ?auto_25543 ) ) ( not ( = ?auto_25539 ?auto_25543 ) ) ( not ( = ?auto_25537 ?auto_25543 ) ) ( IS-CRATE ?auto_25538 ) ( AVAILABLE ?auto_25549 ) ( SURFACE-AT ?auto_25538 ?auto_25547 ) ( ON ?auto_25538 ?auto_25546 ) ( CLEAR ?auto_25538 ) ( not ( = ?auto_25538 ?auto_25546 ) ) ( not ( = ?auto_25539 ?auto_25546 ) ) ( not ( = ?auto_25537 ?auto_25546 ) ) ( not ( = ?auto_25543 ?auto_25546 ) ) ( SURFACE-AT ?auto_25536 ?auto_25545 ) ( CLEAR ?auto_25536 ) ( IS-CRATE ?auto_25537 ) ( not ( = ?auto_25536 ?auto_25537 ) ) ( not ( = ?auto_25538 ?auto_25536 ) ) ( not ( = ?auto_25539 ?auto_25536 ) ) ( not ( = ?auto_25543 ?auto_25536 ) ) ( not ( = ?auto_25546 ?auto_25536 ) ) ( AVAILABLE ?auto_25548 ) ( not ( = ?auto_25544 ?auto_25545 ) ) ( not ( = ?auto_25547 ?auto_25544 ) ) ( HOIST-AT ?auto_25541 ?auto_25544 ) ( not ( = ?auto_25548 ?auto_25541 ) ) ( not ( = ?auto_25549 ?auto_25541 ) ) ( AVAILABLE ?auto_25541 ) ( SURFACE-AT ?auto_25537 ?auto_25544 ) ( ON ?auto_25537 ?auto_25540 ) ( CLEAR ?auto_25537 ) ( not ( = ?auto_25538 ?auto_25540 ) ) ( not ( = ?auto_25539 ?auto_25540 ) ) ( not ( = ?auto_25537 ?auto_25540 ) ) ( not ( = ?auto_25543 ?auto_25540 ) ) ( not ( = ?auto_25546 ?auto_25540 ) ) ( not ( = ?auto_25536 ?auto_25540 ) ) ( TRUCK-AT ?auto_25542 ?auto_25545 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25537 ?auto_25538 ?auto_25539 )
      ( MAKE-3CRATE-VERIFY ?auto_25536 ?auto_25537 ?auto_25538 ?auto_25539 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25550 - SURFACE
      ?auto_25551 - SURFACE
      ?auto_25552 - SURFACE
      ?auto_25553 - SURFACE
      ?auto_25554 - SURFACE
    )
    :vars
    (
      ?auto_25563 - HOIST
      ?auto_25560 - PLACE
      ?auto_25562 - PLACE
      ?auto_25564 - HOIST
      ?auto_25558 - SURFACE
      ?auto_25561 - SURFACE
      ?auto_25559 - PLACE
      ?auto_25556 - HOIST
      ?auto_25555 - SURFACE
      ?auto_25557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25563 ?auto_25560 ) ( IS-CRATE ?auto_25554 ) ( not ( = ?auto_25553 ?auto_25554 ) ) ( not ( = ?auto_25552 ?auto_25553 ) ) ( not ( = ?auto_25552 ?auto_25554 ) ) ( not ( = ?auto_25562 ?auto_25560 ) ) ( HOIST-AT ?auto_25564 ?auto_25562 ) ( not ( = ?auto_25563 ?auto_25564 ) ) ( SURFACE-AT ?auto_25554 ?auto_25562 ) ( ON ?auto_25554 ?auto_25558 ) ( CLEAR ?auto_25554 ) ( not ( = ?auto_25553 ?auto_25558 ) ) ( not ( = ?auto_25554 ?auto_25558 ) ) ( not ( = ?auto_25552 ?auto_25558 ) ) ( IS-CRATE ?auto_25553 ) ( AVAILABLE ?auto_25564 ) ( SURFACE-AT ?auto_25553 ?auto_25562 ) ( ON ?auto_25553 ?auto_25561 ) ( CLEAR ?auto_25553 ) ( not ( = ?auto_25553 ?auto_25561 ) ) ( not ( = ?auto_25554 ?auto_25561 ) ) ( not ( = ?auto_25552 ?auto_25561 ) ) ( not ( = ?auto_25558 ?auto_25561 ) ) ( SURFACE-AT ?auto_25551 ?auto_25560 ) ( CLEAR ?auto_25551 ) ( IS-CRATE ?auto_25552 ) ( not ( = ?auto_25551 ?auto_25552 ) ) ( not ( = ?auto_25553 ?auto_25551 ) ) ( not ( = ?auto_25554 ?auto_25551 ) ) ( not ( = ?auto_25558 ?auto_25551 ) ) ( not ( = ?auto_25561 ?auto_25551 ) ) ( AVAILABLE ?auto_25563 ) ( not ( = ?auto_25559 ?auto_25560 ) ) ( not ( = ?auto_25562 ?auto_25559 ) ) ( HOIST-AT ?auto_25556 ?auto_25559 ) ( not ( = ?auto_25563 ?auto_25556 ) ) ( not ( = ?auto_25564 ?auto_25556 ) ) ( AVAILABLE ?auto_25556 ) ( SURFACE-AT ?auto_25552 ?auto_25559 ) ( ON ?auto_25552 ?auto_25555 ) ( CLEAR ?auto_25552 ) ( not ( = ?auto_25553 ?auto_25555 ) ) ( not ( = ?auto_25554 ?auto_25555 ) ) ( not ( = ?auto_25552 ?auto_25555 ) ) ( not ( = ?auto_25558 ?auto_25555 ) ) ( not ( = ?auto_25561 ?auto_25555 ) ) ( not ( = ?auto_25551 ?auto_25555 ) ) ( TRUCK-AT ?auto_25557 ?auto_25560 ) ( ON ?auto_25551 ?auto_25550 ) ( not ( = ?auto_25550 ?auto_25551 ) ) ( not ( = ?auto_25550 ?auto_25552 ) ) ( not ( = ?auto_25550 ?auto_25553 ) ) ( not ( = ?auto_25550 ?auto_25554 ) ) ( not ( = ?auto_25550 ?auto_25558 ) ) ( not ( = ?auto_25550 ?auto_25561 ) ) ( not ( = ?auto_25550 ?auto_25555 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25552 ?auto_25553 ?auto_25554 )
      ( MAKE-4CRATE-VERIFY ?auto_25550 ?auto_25551 ?auto_25552 ?auto_25553 ?auto_25554 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25565 - SURFACE
      ?auto_25566 - SURFACE
    )
    :vars
    (
      ?auto_25577 - HOIST
      ?auto_25573 - PLACE
      ?auto_25568 - SURFACE
      ?auto_25575 - PLACE
      ?auto_25578 - HOIST
      ?auto_25571 - SURFACE
      ?auto_25574 - SURFACE
      ?auto_25576 - SURFACE
      ?auto_25572 - PLACE
      ?auto_25569 - HOIST
      ?auto_25567 - SURFACE
      ?auto_25570 - TRUCK
      ?auto_25579 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25577 ?auto_25573 ) ( IS-CRATE ?auto_25566 ) ( not ( = ?auto_25565 ?auto_25566 ) ) ( not ( = ?auto_25568 ?auto_25565 ) ) ( not ( = ?auto_25568 ?auto_25566 ) ) ( not ( = ?auto_25575 ?auto_25573 ) ) ( HOIST-AT ?auto_25578 ?auto_25575 ) ( not ( = ?auto_25577 ?auto_25578 ) ) ( SURFACE-AT ?auto_25566 ?auto_25575 ) ( ON ?auto_25566 ?auto_25571 ) ( CLEAR ?auto_25566 ) ( not ( = ?auto_25565 ?auto_25571 ) ) ( not ( = ?auto_25566 ?auto_25571 ) ) ( not ( = ?auto_25568 ?auto_25571 ) ) ( IS-CRATE ?auto_25565 ) ( AVAILABLE ?auto_25578 ) ( SURFACE-AT ?auto_25565 ?auto_25575 ) ( ON ?auto_25565 ?auto_25574 ) ( CLEAR ?auto_25565 ) ( not ( = ?auto_25565 ?auto_25574 ) ) ( not ( = ?auto_25566 ?auto_25574 ) ) ( not ( = ?auto_25568 ?auto_25574 ) ) ( not ( = ?auto_25571 ?auto_25574 ) ) ( IS-CRATE ?auto_25568 ) ( not ( = ?auto_25576 ?auto_25568 ) ) ( not ( = ?auto_25565 ?auto_25576 ) ) ( not ( = ?auto_25566 ?auto_25576 ) ) ( not ( = ?auto_25571 ?auto_25576 ) ) ( not ( = ?auto_25574 ?auto_25576 ) ) ( not ( = ?auto_25572 ?auto_25573 ) ) ( not ( = ?auto_25575 ?auto_25572 ) ) ( HOIST-AT ?auto_25569 ?auto_25572 ) ( not ( = ?auto_25577 ?auto_25569 ) ) ( not ( = ?auto_25578 ?auto_25569 ) ) ( AVAILABLE ?auto_25569 ) ( SURFACE-AT ?auto_25568 ?auto_25572 ) ( ON ?auto_25568 ?auto_25567 ) ( CLEAR ?auto_25568 ) ( not ( = ?auto_25565 ?auto_25567 ) ) ( not ( = ?auto_25566 ?auto_25567 ) ) ( not ( = ?auto_25568 ?auto_25567 ) ) ( not ( = ?auto_25571 ?auto_25567 ) ) ( not ( = ?auto_25574 ?auto_25567 ) ) ( not ( = ?auto_25576 ?auto_25567 ) ) ( TRUCK-AT ?auto_25570 ?auto_25573 ) ( SURFACE-AT ?auto_25579 ?auto_25573 ) ( CLEAR ?auto_25579 ) ( LIFTING ?auto_25577 ?auto_25576 ) ( IS-CRATE ?auto_25576 ) ( not ( = ?auto_25579 ?auto_25576 ) ) ( not ( = ?auto_25565 ?auto_25579 ) ) ( not ( = ?auto_25566 ?auto_25579 ) ) ( not ( = ?auto_25568 ?auto_25579 ) ) ( not ( = ?auto_25571 ?auto_25579 ) ) ( not ( = ?auto_25574 ?auto_25579 ) ) ( not ( = ?auto_25567 ?auto_25579 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25579 ?auto_25576 )
      ( MAKE-2CRATE ?auto_25568 ?auto_25565 ?auto_25566 )
      ( MAKE-1CRATE-VERIFY ?auto_25565 ?auto_25566 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25580 - SURFACE
      ?auto_25581 - SURFACE
      ?auto_25582 - SURFACE
    )
    :vars
    (
      ?auto_25594 - HOIST
      ?auto_25585 - PLACE
      ?auto_25591 - PLACE
      ?auto_25588 - HOIST
      ?auto_25592 - SURFACE
      ?auto_25589 - SURFACE
      ?auto_25587 - SURFACE
      ?auto_25584 - PLACE
      ?auto_25583 - HOIST
      ?auto_25590 - SURFACE
      ?auto_25593 - TRUCK
      ?auto_25586 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25594 ?auto_25585 ) ( IS-CRATE ?auto_25582 ) ( not ( = ?auto_25581 ?auto_25582 ) ) ( not ( = ?auto_25580 ?auto_25581 ) ) ( not ( = ?auto_25580 ?auto_25582 ) ) ( not ( = ?auto_25591 ?auto_25585 ) ) ( HOIST-AT ?auto_25588 ?auto_25591 ) ( not ( = ?auto_25594 ?auto_25588 ) ) ( SURFACE-AT ?auto_25582 ?auto_25591 ) ( ON ?auto_25582 ?auto_25592 ) ( CLEAR ?auto_25582 ) ( not ( = ?auto_25581 ?auto_25592 ) ) ( not ( = ?auto_25582 ?auto_25592 ) ) ( not ( = ?auto_25580 ?auto_25592 ) ) ( IS-CRATE ?auto_25581 ) ( AVAILABLE ?auto_25588 ) ( SURFACE-AT ?auto_25581 ?auto_25591 ) ( ON ?auto_25581 ?auto_25589 ) ( CLEAR ?auto_25581 ) ( not ( = ?auto_25581 ?auto_25589 ) ) ( not ( = ?auto_25582 ?auto_25589 ) ) ( not ( = ?auto_25580 ?auto_25589 ) ) ( not ( = ?auto_25592 ?auto_25589 ) ) ( IS-CRATE ?auto_25580 ) ( not ( = ?auto_25587 ?auto_25580 ) ) ( not ( = ?auto_25581 ?auto_25587 ) ) ( not ( = ?auto_25582 ?auto_25587 ) ) ( not ( = ?auto_25592 ?auto_25587 ) ) ( not ( = ?auto_25589 ?auto_25587 ) ) ( not ( = ?auto_25584 ?auto_25585 ) ) ( not ( = ?auto_25591 ?auto_25584 ) ) ( HOIST-AT ?auto_25583 ?auto_25584 ) ( not ( = ?auto_25594 ?auto_25583 ) ) ( not ( = ?auto_25588 ?auto_25583 ) ) ( AVAILABLE ?auto_25583 ) ( SURFACE-AT ?auto_25580 ?auto_25584 ) ( ON ?auto_25580 ?auto_25590 ) ( CLEAR ?auto_25580 ) ( not ( = ?auto_25581 ?auto_25590 ) ) ( not ( = ?auto_25582 ?auto_25590 ) ) ( not ( = ?auto_25580 ?auto_25590 ) ) ( not ( = ?auto_25592 ?auto_25590 ) ) ( not ( = ?auto_25589 ?auto_25590 ) ) ( not ( = ?auto_25587 ?auto_25590 ) ) ( TRUCK-AT ?auto_25593 ?auto_25585 ) ( SURFACE-AT ?auto_25586 ?auto_25585 ) ( CLEAR ?auto_25586 ) ( LIFTING ?auto_25594 ?auto_25587 ) ( IS-CRATE ?auto_25587 ) ( not ( = ?auto_25586 ?auto_25587 ) ) ( not ( = ?auto_25581 ?auto_25586 ) ) ( not ( = ?auto_25582 ?auto_25586 ) ) ( not ( = ?auto_25580 ?auto_25586 ) ) ( not ( = ?auto_25592 ?auto_25586 ) ) ( not ( = ?auto_25589 ?auto_25586 ) ) ( not ( = ?auto_25590 ?auto_25586 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25581 ?auto_25582 )
      ( MAKE-2CRATE-VERIFY ?auto_25580 ?auto_25581 ?auto_25582 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25595 - SURFACE
      ?auto_25596 - SURFACE
      ?auto_25597 - SURFACE
      ?auto_25598 - SURFACE
    )
    :vars
    (
      ?auto_25603 - HOIST
      ?auto_25606 - PLACE
      ?auto_25601 - PLACE
      ?auto_25599 - HOIST
      ?auto_25600 - SURFACE
      ?auto_25608 - SURFACE
      ?auto_25607 - PLACE
      ?auto_25605 - HOIST
      ?auto_25602 - SURFACE
      ?auto_25609 - TRUCK
      ?auto_25604 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25603 ?auto_25606 ) ( IS-CRATE ?auto_25598 ) ( not ( = ?auto_25597 ?auto_25598 ) ) ( not ( = ?auto_25596 ?auto_25597 ) ) ( not ( = ?auto_25596 ?auto_25598 ) ) ( not ( = ?auto_25601 ?auto_25606 ) ) ( HOIST-AT ?auto_25599 ?auto_25601 ) ( not ( = ?auto_25603 ?auto_25599 ) ) ( SURFACE-AT ?auto_25598 ?auto_25601 ) ( ON ?auto_25598 ?auto_25600 ) ( CLEAR ?auto_25598 ) ( not ( = ?auto_25597 ?auto_25600 ) ) ( not ( = ?auto_25598 ?auto_25600 ) ) ( not ( = ?auto_25596 ?auto_25600 ) ) ( IS-CRATE ?auto_25597 ) ( AVAILABLE ?auto_25599 ) ( SURFACE-AT ?auto_25597 ?auto_25601 ) ( ON ?auto_25597 ?auto_25608 ) ( CLEAR ?auto_25597 ) ( not ( = ?auto_25597 ?auto_25608 ) ) ( not ( = ?auto_25598 ?auto_25608 ) ) ( not ( = ?auto_25596 ?auto_25608 ) ) ( not ( = ?auto_25600 ?auto_25608 ) ) ( IS-CRATE ?auto_25596 ) ( not ( = ?auto_25595 ?auto_25596 ) ) ( not ( = ?auto_25597 ?auto_25595 ) ) ( not ( = ?auto_25598 ?auto_25595 ) ) ( not ( = ?auto_25600 ?auto_25595 ) ) ( not ( = ?auto_25608 ?auto_25595 ) ) ( not ( = ?auto_25607 ?auto_25606 ) ) ( not ( = ?auto_25601 ?auto_25607 ) ) ( HOIST-AT ?auto_25605 ?auto_25607 ) ( not ( = ?auto_25603 ?auto_25605 ) ) ( not ( = ?auto_25599 ?auto_25605 ) ) ( AVAILABLE ?auto_25605 ) ( SURFACE-AT ?auto_25596 ?auto_25607 ) ( ON ?auto_25596 ?auto_25602 ) ( CLEAR ?auto_25596 ) ( not ( = ?auto_25597 ?auto_25602 ) ) ( not ( = ?auto_25598 ?auto_25602 ) ) ( not ( = ?auto_25596 ?auto_25602 ) ) ( not ( = ?auto_25600 ?auto_25602 ) ) ( not ( = ?auto_25608 ?auto_25602 ) ) ( not ( = ?auto_25595 ?auto_25602 ) ) ( TRUCK-AT ?auto_25609 ?auto_25606 ) ( SURFACE-AT ?auto_25604 ?auto_25606 ) ( CLEAR ?auto_25604 ) ( LIFTING ?auto_25603 ?auto_25595 ) ( IS-CRATE ?auto_25595 ) ( not ( = ?auto_25604 ?auto_25595 ) ) ( not ( = ?auto_25597 ?auto_25604 ) ) ( not ( = ?auto_25598 ?auto_25604 ) ) ( not ( = ?auto_25596 ?auto_25604 ) ) ( not ( = ?auto_25600 ?auto_25604 ) ) ( not ( = ?auto_25608 ?auto_25604 ) ) ( not ( = ?auto_25602 ?auto_25604 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25596 ?auto_25597 ?auto_25598 )
      ( MAKE-3CRATE-VERIFY ?auto_25595 ?auto_25596 ?auto_25597 ?auto_25598 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25610 - SURFACE
      ?auto_25611 - SURFACE
      ?auto_25612 - SURFACE
      ?auto_25613 - SURFACE
      ?auto_25614 - SURFACE
    )
    :vars
    (
      ?auto_25619 - HOIST
      ?auto_25621 - PLACE
      ?auto_25617 - PLACE
      ?auto_25615 - HOIST
      ?auto_25616 - SURFACE
      ?auto_25623 - SURFACE
      ?auto_25622 - PLACE
      ?auto_25620 - HOIST
      ?auto_25618 - SURFACE
      ?auto_25624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25619 ?auto_25621 ) ( IS-CRATE ?auto_25614 ) ( not ( = ?auto_25613 ?auto_25614 ) ) ( not ( = ?auto_25612 ?auto_25613 ) ) ( not ( = ?auto_25612 ?auto_25614 ) ) ( not ( = ?auto_25617 ?auto_25621 ) ) ( HOIST-AT ?auto_25615 ?auto_25617 ) ( not ( = ?auto_25619 ?auto_25615 ) ) ( SURFACE-AT ?auto_25614 ?auto_25617 ) ( ON ?auto_25614 ?auto_25616 ) ( CLEAR ?auto_25614 ) ( not ( = ?auto_25613 ?auto_25616 ) ) ( not ( = ?auto_25614 ?auto_25616 ) ) ( not ( = ?auto_25612 ?auto_25616 ) ) ( IS-CRATE ?auto_25613 ) ( AVAILABLE ?auto_25615 ) ( SURFACE-AT ?auto_25613 ?auto_25617 ) ( ON ?auto_25613 ?auto_25623 ) ( CLEAR ?auto_25613 ) ( not ( = ?auto_25613 ?auto_25623 ) ) ( not ( = ?auto_25614 ?auto_25623 ) ) ( not ( = ?auto_25612 ?auto_25623 ) ) ( not ( = ?auto_25616 ?auto_25623 ) ) ( IS-CRATE ?auto_25612 ) ( not ( = ?auto_25611 ?auto_25612 ) ) ( not ( = ?auto_25613 ?auto_25611 ) ) ( not ( = ?auto_25614 ?auto_25611 ) ) ( not ( = ?auto_25616 ?auto_25611 ) ) ( not ( = ?auto_25623 ?auto_25611 ) ) ( not ( = ?auto_25622 ?auto_25621 ) ) ( not ( = ?auto_25617 ?auto_25622 ) ) ( HOIST-AT ?auto_25620 ?auto_25622 ) ( not ( = ?auto_25619 ?auto_25620 ) ) ( not ( = ?auto_25615 ?auto_25620 ) ) ( AVAILABLE ?auto_25620 ) ( SURFACE-AT ?auto_25612 ?auto_25622 ) ( ON ?auto_25612 ?auto_25618 ) ( CLEAR ?auto_25612 ) ( not ( = ?auto_25613 ?auto_25618 ) ) ( not ( = ?auto_25614 ?auto_25618 ) ) ( not ( = ?auto_25612 ?auto_25618 ) ) ( not ( = ?auto_25616 ?auto_25618 ) ) ( not ( = ?auto_25623 ?auto_25618 ) ) ( not ( = ?auto_25611 ?auto_25618 ) ) ( TRUCK-AT ?auto_25624 ?auto_25621 ) ( SURFACE-AT ?auto_25610 ?auto_25621 ) ( CLEAR ?auto_25610 ) ( LIFTING ?auto_25619 ?auto_25611 ) ( IS-CRATE ?auto_25611 ) ( not ( = ?auto_25610 ?auto_25611 ) ) ( not ( = ?auto_25613 ?auto_25610 ) ) ( not ( = ?auto_25614 ?auto_25610 ) ) ( not ( = ?auto_25612 ?auto_25610 ) ) ( not ( = ?auto_25616 ?auto_25610 ) ) ( not ( = ?auto_25623 ?auto_25610 ) ) ( not ( = ?auto_25618 ?auto_25610 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25612 ?auto_25613 ?auto_25614 )
      ( MAKE-4CRATE-VERIFY ?auto_25610 ?auto_25611 ?auto_25612 ?auto_25613 ?auto_25614 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25625 - SURFACE
      ?auto_25626 - SURFACE
    )
    :vars
    (
      ?auto_25631 - HOIST
      ?auto_25635 - PLACE
      ?auto_25633 - SURFACE
      ?auto_25629 - PLACE
      ?auto_25627 - HOIST
      ?auto_25628 - SURFACE
      ?auto_25638 - SURFACE
      ?auto_25636 - SURFACE
      ?auto_25637 - PLACE
      ?auto_25634 - HOIST
      ?auto_25630 - SURFACE
      ?auto_25639 - TRUCK
      ?auto_25632 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25631 ?auto_25635 ) ( IS-CRATE ?auto_25626 ) ( not ( = ?auto_25625 ?auto_25626 ) ) ( not ( = ?auto_25633 ?auto_25625 ) ) ( not ( = ?auto_25633 ?auto_25626 ) ) ( not ( = ?auto_25629 ?auto_25635 ) ) ( HOIST-AT ?auto_25627 ?auto_25629 ) ( not ( = ?auto_25631 ?auto_25627 ) ) ( SURFACE-AT ?auto_25626 ?auto_25629 ) ( ON ?auto_25626 ?auto_25628 ) ( CLEAR ?auto_25626 ) ( not ( = ?auto_25625 ?auto_25628 ) ) ( not ( = ?auto_25626 ?auto_25628 ) ) ( not ( = ?auto_25633 ?auto_25628 ) ) ( IS-CRATE ?auto_25625 ) ( AVAILABLE ?auto_25627 ) ( SURFACE-AT ?auto_25625 ?auto_25629 ) ( ON ?auto_25625 ?auto_25638 ) ( CLEAR ?auto_25625 ) ( not ( = ?auto_25625 ?auto_25638 ) ) ( not ( = ?auto_25626 ?auto_25638 ) ) ( not ( = ?auto_25633 ?auto_25638 ) ) ( not ( = ?auto_25628 ?auto_25638 ) ) ( IS-CRATE ?auto_25633 ) ( not ( = ?auto_25636 ?auto_25633 ) ) ( not ( = ?auto_25625 ?auto_25636 ) ) ( not ( = ?auto_25626 ?auto_25636 ) ) ( not ( = ?auto_25628 ?auto_25636 ) ) ( not ( = ?auto_25638 ?auto_25636 ) ) ( not ( = ?auto_25637 ?auto_25635 ) ) ( not ( = ?auto_25629 ?auto_25637 ) ) ( HOIST-AT ?auto_25634 ?auto_25637 ) ( not ( = ?auto_25631 ?auto_25634 ) ) ( not ( = ?auto_25627 ?auto_25634 ) ) ( AVAILABLE ?auto_25634 ) ( SURFACE-AT ?auto_25633 ?auto_25637 ) ( ON ?auto_25633 ?auto_25630 ) ( CLEAR ?auto_25633 ) ( not ( = ?auto_25625 ?auto_25630 ) ) ( not ( = ?auto_25626 ?auto_25630 ) ) ( not ( = ?auto_25633 ?auto_25630 ) ) ( not ( = ?auto_25628 ?auto_25630 ) ) ( not ( = ?auto_25638 ?auto_25630 ) ) ( not ( = ?auto_25636 ?auto_25630 ) ) ( TRUCK-AT ?auto_25639 ?auto_25635 ) ( SURFACE-AT ?auto_25632 ?auto_25635 ) ( CLEAR ?auto_25632 ) ( IS-CRATE ?auto_25636 ) ( not ( = ?auto_25632 ?auto_25636 ) ) ( not ( = ?auto_25625 ?auto_25632 ) ) ( not ( = ?auto_25626 ?auto_25632 ) ) ( not ( = ?auto_25633 ?auto_25632 ) ) ( not ( = ?auto_25628 ?auto_25632 ) ) ( not ( = ?auto_25638 ?auto_25632 ) ) ( not ( = ?auto_25630 ?auto_25632 ) ) ( AVAILABLE ?auto_25631 ) ( IN ?auto_25636 ?auto_25639 ) )
    :subtasks
    ( ( !UNLOAD ?auto_25631 ?auto_25636 ?auto_25639 ?auto_25635 )
      ( MAKE-2CRATE ?auto_25633 ?auto_25625 ?auto_25626 )
      ( MAKE-1CRATE-VERIFY ?auto_25625 ?auto_25626 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25640 - SURFACE
      ?auto_25641 - SURFACE
      ?auto_25642 - SURFACE
    )
    :vars
    (
      ?auto_25646 - HOIST
      ?auto_25648 - PLACE
      ?auto_25645 - PLACE
      ?auto_25644 - HOIST
      ?auto_25643 - SURFACE
      ?auto_25651 - SURFACE
      ?auto_25647 - SURFACE
      ?auto_25652 - PLACE
      ?auto_25650 - HOIST
      ?auto_25654 - SURFACE
      ?auto_25649 - TRUCK
      ?auto_25653 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25646 ?auto_25648 ) ( IS-CRATE ?auto_25642 ) ( not ( = ?auto_25641 ?auto_25642 ) ) ( not ( = ?auto_25640 ?auto_25641 ) ) ( not ( = ?auto_25640 ?auto_25642 ) ) ( not ( = ?auto_25645 ?auto_25648 ) ) ( HOIST-AT ?auto_25644 ?auto_25645 ) ( not ( = ?auto_25646 ?auto_25644 ) ) ( SURFACE-AT ?auto_25642 ?auto_25645 ) ( ON ?auto_25642 ?auto_25643 ) ( CLEAR ?auto_25642 ) ( not ( = ?auto_25641 ?auto_25643 ) ) ( not ( = ?auto_25642 ?auto_25643 ) ) ( not ( = ?auto_25640 ?auto_25643 ) ) ( IS-CRATE ?auto_25641 ) ( AVAILABLE ?auto_25644 ) ( SURFACE-AT ?auto_25641 ?auto_25645 ) ( ON ?auto_25641 ?auto_25651 ) ( CLEAR ?auto_25641 ) ( not ( = ?auto_25641 ?auto_25651 ) ) ( not ( = ?auto_25642 ?auto_25651 ) ) ( not ( = ?auto_25640 ?auto_25651 ) ) ( not ( = ?auto_25643 ?auto_25651 ) ) ( IS-CRATE ?auto_25640 ) ( not ( = ?auto_25647 ?auto_25640 ) ) ( not ( = ?auto_25641 ?auto_25647 ) ) ( not ( = ?auto_25642 ?auto_25647 ) ) ( not ( = ?auto_25643 ?auto_25647 ) ) ( not ( = ?auto_25651 ?auto_25647 ) ) ( not ( = ?auto_25652 ?auto_25648 ) ) ( not ( = ?auto_25645 ?auto_25652 ) ) ( HOIST-AT ?auto_25650 ?auto_25652 ) ( not ( = ?auto_25646 ?auto_25650 ) ) ( not ( = ?auto_25644 ?auto_25650 ) ) ( AVAILABLE ?auto_25650 ) ( SURFACE-AT ?auto_25640 ?auto_25652 ) ( ON ?auto_25640 ?auto_25654 ) ( CLEAR ?auto_25640 ) ( not ( = ?auto_25641 ?auto_25654 ) ) ( not ( = ?auto_25642 ?auto_25654 ) ) ( not ( = ?auto_25640 ?auto_25654 ) ) ( not ( = ?auto_25643 ?auto_25654 ) ) ( not ( = ?auto_25651 ?auto_25654 ) ) ( not ( = ?auto_25647 ?auto_25654 ) ) ( TRUCK-AT ?auto_25649 ?auto_25648 ) ( SURFACE-AT ?auto_25653 ?auto_25648 ) ( CLEAR ?auto_25653 ) ( IS-CRATE ?auto_25647 ) ( not ( = ?auto_25653 ?auto_25647 ) ) ( not ( = ?auto_25641 ?auto_25653 ) ) ( not ( = ?auto_25642 ?auto_25653 ) ) ( not ( = ?auto_25640 ?auto_25653 ) ) ( not ( = ?auto_25643 ?auto_25653 ) ) ( not ( = ?auto_25651 ?auto_25653 ) ) ( not ( = ?auto_25654 ?auto_25653 ) ) ( AVAILABLE ?auto_25646 ) ( IN ?auto_25647 ?auto_25649 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25641 ?auto_25642 )
      ( MAKE-2CRATE-VERIFY ?auto_25640 ?auto_25641 ?auto_25642 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25655 - SURFACE
      ?auto_25656 - SURFACE
      ?auto_25657 - SURFACE
      ?auto_25658 - SURFACE
    )
    :vars
    (
      ?auto_25664 - HOIST
      ?auto_25669 - PLACE
      ?auto_25661 - PLACE
      ?auto_25659 - HOIST
      ?auto_25663 - SURFACE
      ?auto_25667 - SURFACE
      ?auto_25668 - PLACE
      ?auto_25660 - HOIST
      ?auto_25662 - SURFACE
      ?auto_25666 - TRUCK
      ?auto_25665 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25664 ?auto_25669 ) ( IS-CRATE ?auto_25658 ) ( not ( = ?auto_25657 ?auto_25658 ) ) ( not ( = ?auto_25656 ?auto_25657 ) ) ( not ( = ?auto_25656 ?auto_25658 ) ) ( not ( = ?auto_25661 ?auto_25669 ) ) ( HOIST-AT ?auto_25659 ?auto_25661 ) ( not ( = ?auto_25664 ?auto_25659 ) ) ( SURFACE-AT ?auto_25658 ?auto_25661 ) ( ON ?auto_25658 ?auto_25663 ) ( CLEAR ?auto_25658 ) ( not ( = ?auto_25657 ?auto_25663 ) ) ( not ( = ?auto_25658 ?auto_25663 ) ) ( not ( = ?auto_25656 ?auto_25663 ) ) ( IS-CRATE ?auto_25657 ) ( AVAILABLE ?auto_25659 ) ( SURFACE-AT ?auto_25657 ?auto_25661 ) ( ON ?auto_25657 ?auto_25667 ) ( CLEAR ?auto_25657 ) ( not ( = ?auto_25657 ?auto_25667 ) ) ( not ( = ?auto_25658 ?auto_25667 ) ) ( not ( = ?auto_25656 ?auto_25667 ) ) ( not ( = ?auto_25663 ?auto_25667 ) ) ( IS-CRATE ?auto_25656 ) ( not ( = ?auto_25655 ?auto_25656 ) ) ( not ( = ?auto_25657 ?auto_25655 ) ) ( not ( = ?auto_25658 ?auto_25655 ) ) ( not ( = ?auto_25663 ?auto_25655 ) ) ( not ( = ?auto_25667 ?auto_25655 ) ) ( not ( = ?auto_25668 ?auto_25669 ) ) ( not ( = ?auto_25661 ?auto_25668 ) ) ( HOIST-AT ?auto_25660 ?auto_25668 ) ( not ( = ?auto_25664 ?auto_25660 ) ) ( not ( = ?auto_25659 ?auto_25660 ) ) ( AVAILABLE ?auto_25660 ) ( SURFACE-AT ?auto_25656 ?auto_25668 ) ( ON ?auto_25656 ?auto_25662 ) ( CLEAR ?auto_25656 ) ( not ( = ?auto_25657 ?auto_25662 ) ) ( not ( = ?auto_25658 ?auto_25662 ) ) ( not ( = ?auto_25656 ?auto_25662 ) ) ( not ( = ?auto_25663 ?auto_25662 ) ) ( not ( = ?auto_25667 ?auto_25662 ) ) ( not ( = ?auto_25655 ?auto_25662 ) ) ( TRUCK-AT ?auto_25666 ?auto_25669 ) ( SURFACE-AT ?auto_25665 ?auto_25669 ) ( CLEAR ?auto_25665 ) ( IS-CRATE ?auto_25655 ) ( not ( = ?auto_25665 ?auto_25655 ) ) ( not ( = ?auto_25657 ?auto_25665 ) ) ( not ( = ?auto_25658 ?auto_25665 ) ) ( not ( = ?auto_25656 ?auto_25665 ) ) ( not ( = ?auto_25663 ?auto_25665 ) ) ( not ( = ?auto_25667 ?auto_25665 ) ) ( not ( = ?auto_25662 ?auto_25665 ) ) ( AVAILABLE ?auto_25664 ) ( IN ?auto_25655 ?auto_25666 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25656 ?auto_25657 ?auto_25658 )
      ( MAKE-3CRATE-VERIFY ?auto_25655 ?auto_25656 ?auto_25657 ?auto_25658 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25670 - SURFACE
      ?auto_25671 - SURFACE
      ?auto_25672 - SURFACE
      ?auto_25673 - SURFACE
      ?auto_25674 - SURFACE
    )
    :vars
    (
      ?auto_25680 - HOIST
      ?auto_25684 - PLACE
      ?auto_25677 - PLACE
      ?auto_25675 - HOIST
      ?auto_25679 - SURFACE
      ?auto_25682 - SURFACE
      ?auto_25683 - PLACE
      ?auto_25676 - HOIST
      ?auto_25678 - SURFACE
      ?auto_25681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25680 ?auto_25684 ) ( IS-CRATE ?auto_25674 ) ( not ( = ?auto_25673 ?auto_25674 ) ) ( not ( = ?auto_25672 ?auto_25673 ) ) ( not ( = ?auto_25672 ?auto_25674 ) ) ( not ( = ?auto_25677 ?auto_25684 ) ) ( HOIST-AT ?auto_25675 ?auto_25677 ) ( not ( = ?auto_25680 ?auto_25675 ) ) ( SURFACE-AT ?auto_25674 ?auto_25677 ) ( ON ?auto_25674 ?auto_25679 ) ( CLEAR ?auto_25674 ) ( not ( = ?auto_25673 ?auto_25679 ) ) ( not ( = ?auto_25674 ?auto_25679 ) ) ( not ( = ?auto_25672 ?auto_25679 ) ) ( IS-CRATE ?auto_25673 ) ( AVAILABLE ?auto_25675 ) ( SURFACE-AT ?auto_25673 ?auto_25677 ) ( ON ?auto_25673 ?auto_25682 ) ( CLEAR ?auto_25673 ) ( not ( = ?auto_25673 ?auto_25682 ) ) ( not ( = ?auto_25674 ?auto_25682 ) ) ( not ( = ?auto_25672 ?auto_25682 ) ) ( not ( = ?auto_25679 ?auto_25682 ) ) ( IS-CRATE ?auto_25672 ) ( not ( = ?auto_25671 ?auto_25672 ) ) ( not ( = ?auto_25673 ?auto_25671 ) ) ( not ( = ?auto_25674 ?auto_25671 ) ) ( not ( = ?auto_25679 ?auto_25671 ) ) ( not ( = ?auto_25682 ?auto_25671 ) ) ( not ( = ?auto_25683 ?auto_25684 ) ) ( not ( = ?auto_25677 ?auto_25683 ) ) ( HOIST-AT ?auto_25676 ?auto_25683 ) ( not ( = ?auto_25680 ?auto_25676 ) ) ( not ( = ?auto_25675 ?auto_25676 ) ) ( AVAILABLE ?auto_25676 ) ( SURFACE-AT ?auto_25672 ?auto_25683 ) ( ON ?auto_25672 ?auto_25678 ) ( CLEAR ?auto_25672 ) ( not ( = ?auto_25673 ?auto_25678 ) ) ( not ( = ?auto_25674 ?auto_25678 ) ) ( not ( = ?auto_25672 ?auto_25678 ) ) ( not ( = ?auto_25679 ?auto_25678 ) ) ( not ( = ?auto_25682 ?auto_25678 ) ) ( not ( = ?auto_25671 ?auto_25678 ) ) ( TRUCK-AT ?auto_25681 ?auto_25684 ) ( SURFACE-AT ?auto_25670 ?auto_25684 ) ( CLEAR ?auto_25670 ) ( IS-CRATE ?auto_25671 ) ( not ( = ?auto_25670 ?auto_25671 ) ) ( not ( = ?auto_25673 ?auto_25670 ) ) ( not ( = ?auto_25674 ?auto_25670 ) ) ( not ( = ?auto_25672 ?auto_25670 ) ) ( not ( = ?auto_25679 ?auto_25670 ) ) ( not ( = ?auto_25682 ?auto_25670 ) ) ( not ( = ?auto_25678 ?auto_25670 ) ) ( AVAILABLE ?auto_25680 ) ( IN ?auto_25671 ?auto_25681 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25672 ?auto_25673 ?auto_25674 )
      ( MAKE-4CRATE-VERIFY ?auto_25670 ?auto_25671 ?auto_25672 ?auto_25673 ?auto_25674 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25685 - SURFACE
      ?auto_25686 - SURFACE
    )
    :vars
    (
      ?auto_25692 - HOIST
      ?auto_25699 - PLACE
      ?auto_25696 - SURFACE
      ?auto_25689 - PLACE
      ?auto_25687 - HOIST
      ?auto_25691 - SURFACE
      ?auto_25697 - SURFACE
      ?auto_25695 - SURFACE
      ?auto_25698 - PLACE
      ?auto_25688 - HOIST
      ?auto_25690 - SURFACE
      ?auto_25693 - SURFACE
      ?auto_25694 - TRUCK
      ?auto_25700 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25692 ?auto_25699 ) ( IS-CRATE ?auto_25686 ) ( not ( = ?auto_25685 ?auto_25686 ) ) ( not ( = ?auto_25696 ?auto_25685 ) ) ( not ( = ?auto_25696 ?auto_25686 ) ) ( not ( = ?auto_25689 ?auto_25699 ) ) ( HOIST-AT ?auto_25687 ?auto_25689 ) ( not ( = ?auto_25692 ?auto_25687 ) ) ( SURFACE-AT ?auto_25686 ?auto_25689 ) ( ON ?auto_25686 ?auto_25691 ) ( CLEAR ?auto_25686 ) ( not ( = ?auto_25685 ?auto_25691 ) ) ( not ( = ?auto_25686 ?auto_25691 ) ) ( not ( = ?auto_25696 ?auto_25691 ) ) ( IS-CRATE ?auto_25685 ) ( AVAILABLE ?auto_25687 ) ( SURFACE-AT ?auto_25685 ?auto_25689 ) ( ON ?auto_25685 ?auto_25697 ) ( CLEAR ?auto_25685 ) ( not ( = ?auto_25685 ?auto_25697 ) ) ( not ( = ?auto_25686 ?auto_25697 ) ) ( not ( = ?auto_25696 ?auto_25697 ) ) ( not ( = ?auto_25691 ?auto_25697 ) ) ( IS-CRATE ?auto_25696 ) ( not ( = ?auto_25695 ?auto_25696 ) ) ( not ( = ?auto_25685 ?auto_25695 ) ) ( not ( = ?auto_25686 ?auto_25695 ) ) ( not ( = ?auto_25691 ?auto_25695 ) ) ( not ( = ?auto_25697 ?auto_25695 ) ) ( not ( = ?auto_25698 ?auto_25699 ) ) ( not ( = ?auto_25689 ?auto_25698 ) ) ( HOIST-AT ?auto_25688 ?auto_25698 ) ( not ( = ?auto_25692 ?auto_25688 ) ) ( not ( = ?auto_25687 ?auto_25688 ) ) ( AVAILABLE ?auto_25688 ) ( SURFACE-AT ?auto_25696 ?auto_25698 ) ( ON ?auto_25696 ?auto_25690 ) ( CLEAR ?auto_25696 ) ( not ( = ?auto_25685 ?auto_25690 ) ) ( not ( = ?auto_25686 ?auto_25690 ) ) ( not ( = ?auto_25696 ?auto_25690 ) ) ( not ( = ?auto_25691 ?auto_25690 ) ) ( not ( = ?auto_25697 ?auto_25690 ) ) ( not ( = ?auto_25695 ?auto_25690 ) ) ( SURFACE-AT ?auto_25693 ?auto_25699 ) ( CLEAR ?auto_25693 ) ( IS-CRATE ?auto_25695 ) ( not ( = ?auto_25693 ?auto_25695 ) ) ( not ( = ?auto_25685 ?auto_25693 ) ) ( not ( = ?auto_25686 ?auto_25693 ) ) ( not ( = ?auto_25696 ?auto_25693 ) ) ( not ( = ?auto_25691 ?auto_25693 ) ) ( not ( = ?auto_25697 ?auto_25693 ) ) ( not ( = ?auto_25690 ?auto_25693 ) ) ( AVAILABLE ?auto_25692 ) ( IN ?auto_25695 ?auto_25694 ) ( TRUCK-AT ?auto_25694 ?auto_25700 ) ( not ( = ?auto_25700 ?auto_25699 ) ) ( not ( = ?auto_25689 ?auto_25700 ) ) ( not ( = ?auto_25698 ?auto_25700 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_25694 ?auto_25700 ?auto_25699 )
      ( MAKE-2CRATE ?auto_25696 ?auto_25685 ?auto_25686 )
      ( MAKE-1CRATE-VERIFY ?auto_25685 ?auto_25686 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25701 - SURFACE
      ?auto_25702 - SURFACE
      ?auto_25703 - SURFACE
    )
    :vars
    (
      ?auto_25716 - HOIST
      ?auto_25709 - PLACE
      ?auto_25708 - PLACE
      ?auto_25715 - HOIST
      ?auto_25710 - SURFACE
      ?auto_25714 - SURFACE
      ?auto_25707 - SURFACE
      ?auto_25706 - PLACE
      ?auto_25711 - HOIST
      ?auto_25712 - SURFACE
      ?auto_25704 - SURFACE
      ?auto_25705 - TRUCK
      ?auto_25713 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25716 ?auto_25709 ) ( IS-CRATE ?auto_25703 ) ( not ( = ?auto_25702 ?auto_25703 ) ) ( not ( = ?auto_25701 ?auto_25702 ) ) ( not ( = ?auto_25701 ?auto_25703 ) ) ( not ( = ?auto_25708 ?auto_25709 ) ) ( HOIST-AT ?auto_25715 ?auto_25708 ) ( not ( = ?auto_25716 ?auto_25715 ) ) ( SURFACE-AT ?auto_25703 ?auto_25708 ) ( ON ?auto_25703 ?auto_25710 ) ( CLEAR ?auto_25703 ) ( not ( = ?auto_25702 ?auto_25710 ) ) ( not ( = ?auto_25703 ?auto_25710 ) ) ( not ( = ?auto_25701 ?auto_25710 ) ) ( IS-CRATE ?auto_25702 ) ( AVAILABLE ?auto_25715 ) ( SURFACE-AT ?auto_25702 ?auto_25708 ) ( ON ?auto_25702 ?auto_25714 ) ( CLEAR ?auto_25702 ) ( not ( = ?auto_25702 ?auto_25714 ) ) ( not ( = ?auto_25703 ?auto_25714 ) ) ( not ( = ?auto_25701 ?auto_25714 ) ) ( not ( = ?auto_25710 ?auto_25714 ) ) ( IS-CRATE ?auto_25701 ) ( not ( = ?auto_25707 ?auto_25701 ) ) ( not ( = ?auto_25702 ?auto_25707 ) ) ( not ( = ?auto_25703 ?auto_25707 ) ) ( not ( = ?auto_25710 ?auto_25707 ) ) ( not ( = ?auto_25714 ?auto_25707 ) ) ( not ( = ?auto_25706 ?auto_25709 ) ) ( not ( = ?auto_25708 ?auto_25706 ) ) ( HOIST-AT ?auto_25711 ?auto_25706 ) ( not ( = ?auto_25716 ?auto_25711 ) ) ( not ( = ?auto_25715 ?auto_25711 ) ) ( AVAILABLE ?auto_25711 ) ( SURFACE-AT ?auto_25701 ?auto_25706 ) ( ON ?auto_25701 ?auto_25712 ) ( CLEAR ?auto_25701 ) ( not ( = ?auto_25702 ?auto_25712 ) ) ( not ( = ?auto_25703 ?auto_25712 ) ) ( not ( = ?auto_25701 ?auto_25712 ) ) ( not ( = ?auto_25710 ?auto_25712 ) ) ( not ( = ?auto_25714 ?auto_25712 ) ) ( not ( = ?auto_25707 ?auto_25712 ) ) ( SURFACE-AT ?auto_25704 ?auto_25709 ) ( CLEAR ?auto_25704 ) ( IS-CRATE ?auto_25707 ) ( not ( = ?auto_25704 ?auto_25707 ) ) ( not ( = ?auto_25702 ?auto_25704 ) ) ( not ( = ?auto_25703 ?auto_25704 ) ) ( not ( = ?auto_25701 ?auto_25704 ) ) ( not ( = ?auto_25710 ?auto_25704 ) ) ( not ( = ?auto_25714 ?auto_25704 ) ) ( not ( = ?auto_25712 ?auto_25704 ) ) ( AVAILABLE ?auto_25716 ) ( IN ?auto_25707 ?auto_25705 ) ( TRUCK-AT ?auto_25705 ?auto_25713 ) ( not ( = ?auto_25713 ?auto_25709 ) ) ( not ( = ?auto_25708 ?auto_25713 ) ) ( not ( = ?auto_25706 ?auto_25713 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25702 ?auto_25703 )
      ( MAKE-2CRATE-VERIFY ?auto_25701 ?auto_25702 ?auto_25703 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25717 - SURFACE
      ?auto_25718 - SURFACE
      ?auto_25719 - SURFACE
      ?auto_25720 - SURFACE
    )
    :vars
    (
      ?auto_25722 - HOIST
      ?auto_25731 - PLACE
      ?auto_25721 - PLACE
      ?auto_25724 - HOIST
      ?auto_25732 - SURFACE
      ?auto_25730 - SURFACE
      ?auto_25728 - PLACE
      ?auto_25726 - HOIST
      ?auto_25729 - SURFACE
      ?auto_25727 - SURFACE
      ?auto_25723 - TRUCK
      ?auto_25725 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25722 ?auto_25731 ) ( IS-CRATE ?auto_25720 ) ( not ( = ?auto_25719 ?auto_25720 ) ) ( not ( = ?auto_25718 ?auto_25719 ) ) ( not ( = ?auto_25718 ?auto_25720 ) ) ( not ( = ?auto_25721 ?auto_25731 ) ) ( HOIST-AT ?auto_25724 ?auto_25721 ) ( not ( = ?auto_25722 ?auto_25724 ) ) ( SURFACE-AT ?auto_25720 ?auto_25721 ) ( ON ?auto_25720 ?auto_25732 ) ( CLEAR ?auto_25720 ) ( not ( = ?auto_25719 ?auto_25732 ) ) ( not ( = ?auto_25720 ?auto_25732 ) ) ( not ( = ?auto_25718 ?auto_25732 ) ) ( IS-CRATE ?auto_25719 ) ( AVAILABLE ?auto_25724 ) ( SURFACE-AT ?auto_25719 ?auto_25721 ) ( ON ?auto_25719 ?auto_25730 ) ( CLEAR ?auto_25719 ) ( not ( = ?auto_25719 ?auto_25730 ) ) ( not ( = ?auto_25720 ?auto_25730 ) ) ( not ( = ?auto_25718 ?auto_25730 ) ) ( not ( = ?auto_25732 ?auto_25730 ) ) ( IS-CRATE ?auto_25718 ) ( not ( = ?auto_25717 ?auto_25718 ) ) ( not ( = ?auto_25719 ?auto_25717 ) ) ( not ( = ?auto_25720 ?auto_25717 ) ) ( not ( = ?auto_25732 ?auto_25717 ) ) ( not ( = ?auto_25730 ?auto_25717 ) ) ( not ( = ?auto_25728 ?auto_25731 ) ) ( not ( = ?auto_25721 ?auto_25728 ) ) ( HOIST-AT ?auto_25726 ?auto_25728 ) ( not ( = ?auto_25722 ?auto_25726 ) ) ( not ( = ?auto_25724 ?auto_25726 ) ) ( AVAILABLE ?auto_25726 ) ( SURFACE-AT ?auto_25718 ?auto_25728 ) ( ON ?auto_25718 ?auto_25729 ) ( CLEAR ?auto_25718 ) ( not ( = ?auto_25719 ?auto_25729 ) ) ( not ( = ?auto_25720 ?auto_25729 ) ) ( not ( = ?auto_25718 ?auto_25729 ) ) ( not ( = ?auto_25732 ?auto_25729 ) ) ( not ( = ?auto_25730 ?auto_25729 ) ) ( not ( = ?auto_25717 ?auto_25729 ) ) ( SURFACE-AT ?auto_25727 ?auto_25731 ) ( CLEAR ?auto_25727 ) ( IS-CRATE ?auto_25717 ) ( not ( = ?auto_25727 ?auto_25717 ) ) ( not ( = ?auto_25719 ?auto_25727 ) ) ( not ( = ?auto_25720 ?auto_25727 ) ) ( not ( = ?auto_25718 ?auto_25727 ) ) ( not ( = ?auto_25732 ?auto_25727 ) ) ( not ( = ?auto_25730 ?auto_25727 ) ) ( not ( = ?auto_25729 ?auto_25727 ) ) ( AVAILABLE ?auto_25722 ) ( IN ?auto_25717 ?auto_25723 ) ( TRUCK-AT ?auto_25723 ?auto_25725 ) ( not ( = ?auto_25725 ?auto_25731 ) ) ( not ( = ?auto_25721 ?auto_25725 ) ) ( not ( = ?auto_25728 ?auto_25725 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25718 ?auto_25719 ?auto_25720 )
      ( MAKE-3CRATE-VERIFY ?auto_25717 ?auto_25718 ?auto_25719 ?auto_25720 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25733 - SURFACE
      ?auto_25734 - SURFACE
      ?auto_25735 - SURFACE
      ?auto_25736 - SURFACE
      ?auto_25737 - SURFACE
    )
    :vars
    (
      ?auto_25739 - HOIST
      ?auto_25747 - PLACE
      ?auto_25738 - PLACE
      ?auto_25741 - HOIST
      ?auto_25748 - SURFACE
      ?auto_25746 - SURFACE
      ?auto_25744 - PLACE
      ?auto_25743 - HOIST
      ?auto_25745 - SURFACE
      ?auto_25740 - TRUCK
      ?auto_25742 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25739 ?auto_25747 ) ( IS-CRATE ?auto_25737 ) ( not ( = ?auto_25736 ?auto_25737 ) ) ( not ( = ?auto_25735 ?auto_25736 ) ) ( not ( = ?auto_25735 ?auto_25737 ) ) ( not ( = ?auto_25738 ?auto_25747 ) ) ( HOIST-AT ?auto_25741 ?auto_25738 ) ( not ( = ?auto_25739 ?auto_25741 ) ) ( SURFACE-AT ?auto_25737 ?auto_25738 ) ( ON ?auto_25737 ?auto_25748 ) ( CLEAR ?auto_25737 ) ( not ( = ?auto_25736 ?auto_25748 ) ) ( not ( = ?auto_25737 ?auto_25748 ) ) ( not ( = ?auto_25735 ?auto_25748 ) ) ( IS-CRATE ?auto_25736 ) ( AVAILABLE ?auto_25741 ) ( SURFACE-AT ?auto_25736 ?auto_25738 ) ( ON ?auto_25736 ?auto_25746 ) ( CLEAR ?auto_25736 ) ( not ( = ?auto_25736 ?auto_25746 ) ) ( not ( = ?auto_25737 ?auto_25746 ) ) ( not ( = ?auto_25735 ?auto_25746 ) ) ( not ( = ?auto_25748 ?auto_25746 ) ) ( IS-CRATE ?auto_25735 ) ( not ( = ?auto_25734 ?auto_25735 ) ) ( not ( = ?auto_25736 ?auto_25734 ) ) ( not ( = ?auto_25737 ?auto_25734 ) ) ( not ( = ?auto_25748 ?auto_25734 ) ) ( not ( = ?auto_25746 ?auto_25734 ) ) ( not ( = ?auto_25744 ?auto_25747 ) ) ( not ( = ?auto_25738 ?auto_25744 ) ) ( HOIST-AT ?auto_25743 ?auto_25744 ) ( not ( = ?auto_25739 ?auto_25743 ) ) ( not ( = ?auto_25741 ?auto_25743 ) ) ( AVAILABLE ?auto_25743 ) ( SURFACE-AT ?auto_25735 ?auto_25744 ) ( ON ?auto_25735 ?auto_25745 ) ( CLEAR ?auto_25735 ) ( not ( = ?auto_25736 ?auto_25745 ) ) ( not ( = ?auto_25737 ?auto_25745 ) ) ( not ( = ?auto_25735 ?auto_25745 ) ) ( not ( = ?auto_25748 ?auto_25745 ) ) ( not ( = ?auto_25746 ?auto_25745 ) ) ( not ( = ?auto_25734 ?auto_25745 ) ) ( SURFACE-AT ?auto_25733 ?auto_25747 ) ( CLEAR ?auto_25733 ) ( IS-CRATE ?auto_25734 ) ( not ( = ?auto_25733 ?auto_25734 ) ) ( not ( = ?auto_25736 ?auto_25733 ) ) ( not ( = ?auto_25737 ?auto_25733 ) ) ( not ( = ?auto_25735 ?auto_25733 ) ) ( not ( = ?auto_25748 ?auto_25733 ) ) ( not ( = ?auto_25746 ?auto_25733 ) ) ( not ( = ?auto_25745 ?auto_25733 ) ) ( AVAILABLE ?auto_25739 ) ( IN ?auto_25734 ?auto_25740 ) ( TRUCK-AT ?auto_25740 ?auto_25742 ) ( not ( = ?auto_25742 ?auto_25747 ) ) ( not ( = ?auto_25738 ?auto_25742 ) ) ( not ( = ?auto_25744 ?auto_25742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25735 ?auto_25736 ?auto_25737 )
      ( MAKE-4CRATE-VERIFY ?auto_25733 ?auto_25734 ?auto_25735 ?auto_25736 ?auto_25737 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25749 - SURFACE
      ?auto_25750 - SURFACE
    )
    :vars
    (
      ?auto_25752 - HOIST
      ?auto_25763 - PLACE
      ?auto_25754 - SURFACE
      ?auto_25751 - PLACE
      ?auto_25755 - HOIST
      ?auto_25764 - SURFACE
      ?auto_25762 - SURFACE
      ?auto_25756 - SURFACE
      ?auto_25760 - PLACE
      ?auto_25758 - HOIST
      ?auto_25761 - SURFACE
      ?auto_25759 - SURFACE
      ?auto_25753 - TRUCK
      ?auto_25757 - PLACE
      ?auto_25765 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25752 ?auto_25763 ) ( IS-CRATE ?auto_25750 ) ( not ( = ?auto_25749 ?auto_25750 ) ) ( not ( = ?auto_25754 ?auto_25749 ) ) ( not ( = ?auto_25754 ?auto_25750 ) ) ( not ( = ?auto_25751 ?auto_25763 ) ) ( HOIST-AT ?auto_25755 ?auto_25751 ) ( not ( = ?auto_25752 ?auto_25755 ) ) ( SURFACE-AT ?auto_25750 ?auto_25751 ) ( ON ?auto_25750 ?auto_25764 ) ( CLEAR ?auto_25750 ) ( not ( = ?auto_25749 ?auto_25764 ) ) ( not ( = ?auto_25750 ?auto_25764 ) ) ( not ( = ?auto_25754 ?auto_25764 ) ) ( IS-CRATE ?auto_25749 ) ( AVAILABLE ?auto_25755 ) ( SURFACE-AT ?auto_25749 ?auto_25751 ) ( ON ?auto_25749 ?auto_25762 ) ( CLEAR ?auto_25749 ) ( not ( = ?auto_25749 ?auto_25762 ) ) ( not ( = ?auto_25750 ?auto_25762 ) ) ( not ( = ?auto_25754 ?auto_25762 ) ) ( not ( = ?auto_25764 ?auto_25762 ) ) ( IS-CRATE ?auto_25754 ) ( not ( = ?auto_25756 ?auto_25754 ) ) ( not ( = ?auto_25749 ?auto_25756 ) ) ( not ( = ?auto_25750 ?auto_25756 ) ) ( not ( = ?auto_25764 ?auto_25756 ) ) ( not ( = ?auto_25762 ?auto_25756 ) ) ( not ( = ?auto_25760 ?auto_25763 ) ) ( not ( = ?auto_25751 ?auto_25760 ) ) ( HOIST-AT ?auto_25758 ?auto_25760 ) ( not ( = ?auto_25752 ?auto_25758 ) ) ( not ( = ?auto_25755 ?auto_25758 ) ) ( AVAILABLE ?auto_25758 ) ( SURFACE-AT ?auto_25754 ?auto_25760 ) ( ON ?auto_25754 ?auto_25761 ) ( CLEAR ?auto_25754 ) ( not ( = ?auto_25749 ?auto_25761 ) ) ( not ( = ?auto_25750 ?auto_25761 ) ) ( not ( = ?auto_25754 ?auto_25761 ) ) ( not ( = ?auto_25764 ?auto_25761 ) ) ( not ( = ?auto_25762 ?auto_25761 ) ) ( not ( = ?auto_25756 ?auto_25761 ) ) ( SURFACE-AT ?auto_25759 ?auto_25763 ) ( CLEAR ?auto_25759 ) ( IS-CRATE ?auto_25756 ) ( not ( = ?auto_25759 ?auto_25756 ) ) ( not ( = ?auto_25749 ?auto_25759 ) ) ( not ( = ?auto_25750 ?auto_25759 ) ) ( not ( = ?auto_25754 ?auto_25759 ) ) ( not ( = ?auto_25764 ?auto_25759 ) ) ( not ( = ?auto_25762 ?auto_25759 ) ) ( not ( = ?auto_25761 ?auto_25759 ) ) ( AVAILABLE ?auto_25752 ) ( TRUCK-AT ?auto_25753 ?auto_25757 ) ( not ( = ?auto_25757 ?auto_25763 ) ) ( not ( = ?auto_25751 ?auto_25757 ) ) ( not ( = ?auto_25760 ?auto_25757 ) ) ( HOIST-AT ?auto_25765 ?auto_25757 ) ( LIFTING ?auto_25765 ?auto_25756 ) ( not ( = ?auto_25752 ?auto_25765 ) ) ( not ( = ?auto_25755 ?auto_25765 ) ) ( not ( = ?auto_25758 ?auto_25765 ) ) )
    :subtasks
    ( ( !LOAD ?auto_25765 ?auto_25756 ?auto_25753 ?auto_25757 )
      ( MAKE-2CRATE ?auto_25754 ?auto_25749 ?auto_25750 )
      ( MAKE-1CRATE-VERIFY ?auto_25749 ?auto_25750 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25766 - SURFACE
      ?auto_25767 - SURFACE
      ?auto_25768 - SURFACE
    )
    :vars
    (
      ?auto_25779 - HOIST
      ?auto_25781 - PLACE
      ?auto_25782 - PLACE
      ?auto_25770 - HOIST
      ?auto_25769 - SURFACE
      ?auto_25771 - SURFACE
      ?auto_25780 - SURFACE
      ?auto_25773 - PLACE
      ?auto_25772 - HOIST
      ?auto_25778 - SURFACE
      ?auto_25774 - SURFACE
      ?auto_25776 - TRUCK
      ?auto_25775 - PLACE
      ?auto_25777 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25779 ?auto_25781 ) ( IS-CRATE ?auto_25768 ) ( not ( = ?auto_25767 ?auto_25768 ) ) ( not ( = ?auto_25766 ?auto_25767 ) ) ( not ( = ?auto_25766 ?auto_25768 ) ) ( not ( = ?auto_25782 ?auto_25781 ) ) ( HOIST-AT ?auto_25770 ?auto_25782 ) ( not ( = ?auto_25779 ?auto_25770 ) ) ( SURFACE-AT ?auto_25768 ?auto_25782 ) ( ON ?auto_25768 ?auto_25769 ) ( CLEAR ?auto_25768 ) ( not ( = ?auto_25767 ?auto_25769 ) ) ( not ( = ?auto_25768 ?auto_25769 ) ) ( not ( = ?auto_25766 ?auto_25769 ) ) ( IS-CRATE ?auto_25767 ) ( AVAILABLE ?auto_25770 ) ( SURFACE-AT ?auto_25767 ?auto_25782 ) ( ON ?auto_25767 ?auto_25771 ) ( CLEAR ?auto_25767 ) ( not ( = ?auto_25767 ?auto_25771 ) ) ( not ( = ?auto_25768 ?auto_25771 ) ) ( not ( = ?auto_25766 ?auto_25771 ) ) ( not ( = ?auto_25769 ?auto_25771 ) ) ( IS-CRATE ?auto_25766 ) ( not ( = ?auto_25780 ?auto_25766 ) ) ( not ( = ?auto_25767 ?auto_25780 ) ) ( not ( = ?auto_25768 ?auto_25780 ) ) ( not ( = ?auto_25769 ?auto_25780 ) ) ( not ( = ?auto_25771 ?auto_25780 ) ) ( not ( = ?auto_25773 ?auto_25781 ) ) ( not ( = ?auto_25782 ?auto_25773 ) ) ( HOIST-AT ?auto_25772 ?auto_25773 ) ( not ( = ?auto_25779 ?auto_25772 ) ) ( not ( = ?auto_25770 ?auto_25772 ) ) ( AVAILABLE ?auto_25772 ) ( SURFACE-AT ?auto_25766 ?auto_25773 ) ( ON ?auto_25766 ?auto_25778 ) ( CLEAR ?auto_25766 ) ( not ( = ?auto_25767 ?auto_25778 ) ) ( not ( = ?auto_25768 ?auto_25778 ) ) ( not ( = ?auto_25766 ?auto_25778 ) ) ( not ( = ?auto_25769 ?auto_25778 ) ) ( not ( = ?auto_25771 ?auto_25778 ) ) ( not ( = ?auto_25780 ?auto_25778 ) ) ( SURFACE-AT ?auto_25774 ?auto_25781 ) ( CLEAR ?auto_25774 ) ( IS-CRATE ?auto_25780 ) ( not ( = ?auto_25774 ?auto_25780 ) ) ( not ( = ?auto_25767 ?auto_25774 ) ) ( not ( = ?auto_25768 ?auto_25774 ) ) ( not ( = ?auto_25766 ?auto_25774 ) ) ( not ( = ?auto_25769 ?auto_25774 ) ) ( not ( = ?auto_25771 ?auto_25774 ) ) ( not ( = ?auto_25778 ?auto_25774 ) ) ( AVAILABLE ?auto_25779 ) ( TRUCK-AT ?auto_25776 ?auto_25775 ) ( not ( = ?auto_25775 ?auto_25781 ) ) ( not ( = ?auto_25782 ?auto_25775 ) ) ( not ( = ?auto_25773 ?auto_25775 ) ) ( HOIST-AT ?auto_25777 ?auto_25775 ) ( LIFTING ?auto_25777 ?auto_25780 ) ( not ( = ?auto_25779 ?auto_25777 ) ) ( not ( = ?auto_25770 ?auto_25777 ) ) ( not ( = ?auto_25772 ?auto_25777 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25767 ?auto_25768 )
      ( MAKE-2CRATE-VERIFY ?auto_25766 ?auto_25767 ?auto_25768 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25783 - SURFACE
      ?auto_25784 - SURFACE
      ?auto_25785 - SURFACE
      ?auto_25786 - SURFACE
    )
    :vars
    (
      ?auto_25794 - HOIST
      ?auto_25798 - PLACE
      ?auto_25795 - PLACE
      ?auto_25789 - HOIST
      ?auto_25791 - SURFACE
      ?auto_25797 - SURFACE
      ?auto_25792 - PLACE
      ?auto_25796 - HOIST
      ?auto_25799 - SURFACE
      ?auto_25788 - SURFACE
      ?auto_25793 - TRUCK
      ?auto_25790 - PLACE
      ?auto_25787 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25794 ?auto_25798 ) ( IS-CRATE ?auto_25786 ) ( not ( = ?auto_25785 ?auto_25786 ) ) ( not ( = ?auto_25784 ?auto_25785 ) ) ( not ( = ?auto_25784 ?auto_25786 ) ) ( not ( = ?auto_25795 ?auto_25798 ) ) ( HOIST-AT ?auto_25789 ?auto_25795 ) ( not ( = ?auto_25794 ?auto_25789 ) ) ( SURFACE-AT ?auto_25786 ?auto_25795 ) ( ON ?auto_25786 ?auto_25791 ) ( CLEAR ?auto_25786 ) ( not ( = ?auto_25785 ?auto_25791 ) ) ( not ( = ?auto_25786 ?auto_25791 ) ) ( not ( = ?auto_25784 ?auto_25791 ) ) ( IS-CRATE ?auto_25785 ) ( AVAILABLE ?auto_25789 ) ( SURFACE-AT ?auto_25785 ?auto_25795 ) ( ON ?auto_25785 ?auto_25797 ) ( CLEAR ?auto_25785 ) ( not ( = ?auto_25785 ?auto_25797 ) ) ( not ( = ?auto_25786 ?auto_25797 ) ) ( not ( = ?auto_25784 ?auto_25797 ) ) ( not ( = ?auto_25791 ?auto_25797 ) ) ( IS-CRATE ?auto_25784 ) ( not ( = ?auto_25783 ?auto_25784 ) ) ( not ( = ?auto_25785 ?auto_25783 ) ) ( not ( = ?auto_25786 ?auto_25783 ) ) ( not ( = ?auto_25791 ?auto_25783 ) ) ( not ( = ?auto_25797 ?auto_25783 ) ) ( not ( = ?auto_25792 ?auto_25798 ) ) ( not ( = ?auto_25795 ?auto_25792 ) ) ( HOIST-AT ?auto_25796 ?auto_25792 ) ( not ( = ?auto_25794 ?auto_25796 ) ) ( not ( = ?auto_25789 ?auto_25796 ) ) ( AVAILABLE ?auto_25796 ) ( SURFACE-AT ?auto_25784 ?auto_25792 ) ( ON ?auto_25784 ?auto_25799 ) ( CLEAR ?auto_25784 ) ( not ( = ?auto_25785 ?auto_25799 ) ) ( not ( = ?auto_25786 ?auto_25799 ) ) ( not ( = ?auto_25784 ?auto_25799 ) ) ( not ( = ?auto_25791 ?auto_25799 ) ) ( not ( = ?auto_25797 ?auto_25799 ) ) ( not ( = ?auto_25783 ?auto_25799 ) ) ( SURFACE-AT ?auto_25788 ?auto_25798 ) ( CLEAR ?auto_25788 ) ( IS-CRATE ?auto_25783 ) ( not ( = ?auto_25788 ?auto_25783 ) ) ( not ( = ?auto_25785 ?auto_25788 ) ) ( not ( = ?auto_25786 ?auto_25788 ) ) ( not ( = ?auto_25784 ?auto_25788 ) ) ( not ( = ?auto_25791 ?auto_25788 ) ) ( not ( = ?auto_25797 ?auto_25788 ) ) ( not ( = ?auto_25799 ?auto_25788 ) ) ( AVAILABLE ?auto_25794 ) ( TRUCK-AT ?auto_25793 ?auto_25790 ) ( not ( = ?auto_25790 ?auto_25798 ) ) ( not ( = ?auto_25795 ?auto_25790 ) ) ( not ( = ?auto_25792 ?auto_25790 ) ) ( HOIST-AT ?auto_25787 ?auto_25790 ) ( LIFTING ?auto_25787 ?auto_25783 ) ( not ( = ?auto_25794 ?auto_25787 ) ) ( not ( = ?auto_25789 ?auto_25787 ) ) ( not ( = ?auto_25796 ?auto_25787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25784 ?auto_25785 ?auto_25786 )
      ( MAKE-3CRATE-VERIFY ?auto_25783 ?auto_25784 ?auto_25785 ?auto_25786 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25800 - SURFACE
      ?auto_25801 - SURFACE
      ?auto_25802 - SURFACE
      ?auto_25803 - SURFACE
      ?auto_25804 - SURFACE
    )
    :vars
    (
      ?auto_25811 - HOIST
      ?auto_25815 - PLACE
      ?auto_25812 - PLACE
      ?auto_25806 - HOIST
      ?auto_25808 - SURFACE
      ?auto_25814 - SURFACE
      ?auto_25809 - PLACE
      ?auto_25813 - HOIST
      ?auto_25816 - SURFACE
      ?auto_25810 - TRUCK
      ?auto_25807 - PLACE
      ?auto_25805 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_25811 ?auto_25815 ) ( IS-CRATE ?auto_25804 ) ( not ( = ?auto_25803 ?auto_25804 ) ) ( not ( = ?auto_25802 ?auto_25803 ) ) ( not ( = ?auto_25802 ?auto_25804 ) ) ( not ( = ?auto_25812 ?auto_25815 ) ) ( HOIST-AT ?auto_25806 ?auto_25812 ) ( not ( = ?auto_25811 ?auto_25806 ) ) ( SURFACE-AT ?auto_25804 ?auto_25812 ) ( ON ?auto_25804 ?auto_25808 ) ( CLEAR ?auto_25804 ) ( not ( = ?auto_25803 ?auto_25808 ) ) ( not ( = ?auto_25804 ?auto_25808 ) ) ( not ( = ?auto_25802 ?auto_25808 ) ) ( IS-CRATE ?auto_25803 ) ( AVAILABLE ?auto_25806 ) ( SURFACE-AT ?auto_25803 ?auto_25812 ) ( ON ?auto_25803 ?auto_25814 ) ( CLEAR ?auto_25803 ) ( not ( = ?auto_25803 ?auto_25814 ) ) ( not ( = ?auto_25804 ?auto_25814 ) ) ( not ( = ?auto_25802 ?auto_25814 ) ) ( not ( = ?auto_25808 ?auto_25814 ) ) ( IS-CRATE ?auto_25802 ) ( not ( = ?auto_25801 ?auto_25802 ) ) ( not ( = ?auto_25803 ?auto_25801 ) ) ( not ( = ?auto_25804 ?auto_25801 ) ) ( not ( = ?auto_25808 ?auto_25801 ) ) ( not ( = ?auto_25814 ?auto_25801 ) ) ( not ( = ?auto_25809 ?auto_25815 ) ) ( not ( = ?auto_25812 ?auto_25809 ) ) ( HOIST-AT ?auto_25813 ?auto_25809 ) ( not ( = ?auto_25811 ?auto_25813 ) ) ( not ( = ?auto_25806 ?auto_25813 ) ) ( AVAILABLE ?auto_25813 ) ( SURFACE-AT ?auto_25802 ?auto_25809 ) ( ON ?auto_25802 ?auto_25816 ) ( CLEAR ?auto_25802 ) ( not ( = ?auto_25803 ?auto_25816 ) ) ( not ( = ?auto_25804 ?auto_25816 ) ) ( not ( = ?auto_25802 ?auto_25816 ) ) ( not ( = ?auto_25808 ?auto_25816 ) ) ( not ( = ?auto_25814 ?auto_25816 ) ) ( not ( = ?auto_25801 ?auto_25816 ) ) ( SURFACE-AT ?auto_25800 ?auto_25815 ) ( CLEAR ?auto_25800 ) ( IS-CRATE ?auto_25801 ) ( not ( = ?auto_25800 ?auto_25801 ) ) ( not ( = ?auto_25803 ?auto_25800 ) ) ( not ( = ?auto_25804 ?auto_25800 ) ) ( not ( = ?auto_25802 ?auto_25800 ) ) ( not ( = ?auto_25808 ?auto_25800 ) ) ( not ( = ?auto_25814 ?auto_25800 ) ) ( not ( = ?auto_25816 ?auto_25800 ) ) ( AVAILABLE ?auto_25811 ) ( TRUCK-AT ?auto_25810 ?auto_25807 ) ( not ( = ?auto_25807 ?auto_25815 ) ) ( not ( = ?auto_25812 ?auto_25807 ) ) ( not ( = ?auto_25809 ?auto_25807 ) ) ( HOIST-AT ?auto_25805 ?auto_25807 ) ( LIFTING ?auto_25805 ?auto_25801 ) ( not ( = ?auto_25811 ?auto_25805 ) ) ( not ( = ?auto_25806 ?auto_25805 ) ) ( not ( = ?auto_25813 ?auto_25805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25802 ?auto_25803 ?auto_25804 )
      ( MAKE-4CRATE-VERIFY ?auto_25800 ?auto_25801 ?auto_25802 ?auto_25803 ?auto_25804 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25817 - SURFACE
      ?auto_25818 - SURFACE
    )
    :vars
    (
      ?auto_25827 - HOIST
      ?auto_25832 - PLACE
      ?auto_25831 - SURFACE
      ?auto_25828 - PLACE
      ?auto_25821 - HOIST
      ?auto_25824 - SURFACE
      ?auto_25830 - SURFACE
      ?auto_25823 - SURFACE
      ?auto_25825 - PLACE
      ?auto_25829 - HOIST
      ?auto_25833 - SURFACE
      ?auto_25820 - SURFACE
      ?auto_25826 - TRUCK
      ?auto_25822 - PLACE
      ?auto_25819 - HOIST
      ?auto_25834 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25827 ?auto_25832 ) ( IS-CRATE ?auto_25818 ) ( not ( = ?auto_25817 ?auto_25818 ) ) ( not ( = ?auto_25831 ?auto_25817 ) ) ( not ( = ?auto_25831 ?auto_25818 ) ) ( not ( = ?auto_25828 ?auto_25832 ) ) ( HOIST-AT ?auto_25821 ?auto_25828 ) ( not ( = ?auto_25827 ?auto_25821 ) ) ( SURFACE-AT ?auto_25818 ?auto_25828 ) ( ON ?auto_25818 ?auto_25824 ) ( CLEAR ?auto_25818 ) ( not ( = ?auto_25817 ?auto_25824 ) ) ( not ( = ?auto_25818 ?auto_25824 ) ) ( not ( = ?auto_25831 ?auto_25824 ) ) ( IS-CRATE ?auto_25817 ) ( AVAILABLE ?auto_25821 ) ( SURFACE-AT ?auto_25817 ?auto_25828 ) ( ON ?auto_25817 ?auto_25830 ) ( CLEAR ?auto_25817 ) ( not ( = ?auto_25817 ?auto_25830 ) ) ( not ( = ?auto_25818 ?auto_25830 ) ) ( not ( = ?auto_25831 ?auto_25830 ) ) ( not ( = ?auto_25824 ?auto_25830 ) ) ( IS-CRATE ?auto_25831 ) ( not ( = ?auto_25823 ?auto_25831 ) ) ( not ( = ?auto_25817 ?auto_25823 ) ) ( not ( = ?auto_25818 ?auto_25823 ) ) ( not ( = ?auto_25824 ?auto_25823 ) ) ( not ( = ?auto_25830 ?auto_25823 ) ) ( not ( = ?auto_25825 ?auto_25832 ) ) ( not ( = ?auto_25828 ?auto_25825 ) ) ( HOIST-AT ?auto_25829 ?auto_25825 ) ( not ( = ?auto_25827 ?auto_25829 ) ) ( not ( = ?auto_25821 ?auto_25829 ) ) ( AVAILABLE ?auto_25829 ) ( SURFACE-AT ?auto_25831 ?auto_25825 ) ( ON ?auto_25831 ?auto_25833 ) ( CLEAR ?auto_25831 ) ( not ( = ?auto_25817 ?auto_25833 ) ) ( not ( = ?auto_25818 ?auto_25833 ) ) ( not ( = ?auto_25831 ?auto_25833 ) ) ( not ( = ?auto_25824 ?auto_25833 ) ) ( not ( = ?auto_25830 ?auto_25833 ) ) ( not ( = ?auto_25823 ?auto_25833 ) ) ( SURFACE-AT ?auto_25820 ?auto_25832 ) ( CLEAR ?auto_25820 ) ( IS-CRATE ?auto_25823 ) ( not ( = ?auto_25820 ?auto_25823 ) ) ( not ( = ?auto_25817 ?auto_25820 ) ) ( not ( = ?auto_25818 ?auto_25820 ) ) ( not ( = ?auto_25831 ?auto_25820 ) ) ( not ( = ?auto_25824 ?auto_25820 ) ) ( not ( = ?auto_25830 ?auto_25820 ) ) ( not ( = ?auto_25833 ?auto_25820 ) ) ( AVAILABLE ?auto_25827 ) ( TRUCK-AT ?auto_25826 ?auto_25822 ) ( not ( = ?auto_25822 ?auto_25832 ) ) ( not ( = ?auto_25828 ?auto_25822 ) ) ( not ( = ?auto_25825 ?auto_25822 ) ) ( HOIST-AT ?auto_25819 ?auto_25822 ) ( not ( = ?auto_25827 ?auto_25819 ) ) ( not ( = ?auto_25821 ?auto_25819 ) ) ( not ( = ?auto_25829 ?auto_25819 ) ) ( AVAILABLE ?auto_25819 ) ( SURFACE-AT ?auto_25823 ?auto_25822 ) ( ON ?auto_25823 ?auto_25834 ) ( CLEAR ?auto_25823 ) ( not ( = ?auto_25817 ?auto_25834 ) ) ( not ( = ?auto_25818 ?auto_25834 ) ) ( not ( = ?auto_25831 ?auto_25834 ) ) ( not ( = ?auto_25824 ?auto_25834 ) ) ( not ( = ?auto_25830 ?auto_25834 ) ) ( not ( = ?auto_25823 ?auto_25834 ) ) ( not ( = ?auto_25833 ?auto_25834 ) ) ( not ( = ?auto_25820 ?auto_25834 ) ) )
    :subtasks
    ( ( !LIFT ?auto_25819 ?auto_25823 ?auto_25834 ?auto_25822 )
      ( MAKE-2CRATE ?auto_25831 ?auto_25817 ?auto_25818 )
      ( MAKE-1CRATE-VERIFY ?auto_25817 ?auto_25818 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25835 - SURFACE
      ?auto_25836 - SURFACE
      ?auto_25837 - SURFACE
    )
    :vars
    (
      ?auto_25850 - HOIST
      ?auto_25849 - PLACE
      ?auto_25842 - PLACE
      ?auto_25843 - HOIST
      ?auto_25841 - SURFACE
      ?auto_25851 - SURFACE
      ?auto_25846 - SURFACE
      ?auto_25840 - PLACE
      ?auto_25845 - HOIST
      ?auto_25852 - SURFACE
      ?auto_25848 - SURFACE
      ?auto_25847 - TRUCK
      ?auto_25839 - PLACE
      ?auto_25838 - HOIST
      ?auto_25844 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25850 ?auto_25849 ) ( IS-CRATE ?auto_25837 ) ( not ( = ?auto_25836 ?auto_25837 ) ) ( not ( = ?auto_25835 ?auto_25836 ) ) ( not ( = ?auto_25835 ?auto_25837 ) ) ( not ( = ?auto_25842 ?auto_25849 ) ) ( HOIST-AT ?auto_25843 ?auto_25842 ) ( not ( = ?auto_25850 ?auto_25843 ) ) ( SURFACE-AT ?auto_25837 ?auto_25842 ) ( ON ?auto_25837 ?auto_25841 ) ( CLEAR ?auto_25837 ) ( not ( = ?auto_25836 ?auto_25841 ) ) ( not ( = ?auto_25837 ?auto_25841 ) ) ( not ( = ?auto_25835 ?auto_25841 ) ) ( IS-CRATE ?auto_25836 ) ( AVAILABLE ?auto_25843 ) ( SURFACE-AT ?auto_25836 ?auto_25842 ) ( ON ?auto_25836 ?auto_25851 ) ( CLEAR ?auto_25836 ) ( not ( = ?auto_25836 ?auto_25851 ) ) ( not ( = ?auto_25837 ?auto_25851 ) ) ( not ( = ?auto_25835 ?auto_25851 ) ) ( not ( = ?auto_25841 ?auto_25851 ) ) ( IS-CRATE ?auto_25835 ) ( not ( = ?auto_25846 ?auto_25835 ) ) ( not ( = ?auto_25836 ?auto_25846 ) ) ( not ( = ?auto_25837 ?auto_25846 ) ) ( not ( = ?auto_25841 ?auto_25846 ) ) ( not ( = ?auto_25851 ?auto_25846 ) ) ( not ( = ?auto_25840 ?auto_25849 ) ) ( not ( = ?auto_25842 ?auto_25840 ) ) ( HOIST-AT ?auto_25845 ?auto_25840 ) ( not ( = ?auto_25850 ?auto_25845 ) ) ( not ( = ?auto_25843 ?auto_25845 ) ) ( AVAILABLE ?auto_25845 ) ( SURFACE-AT ?auto_25835 ?auto_25840 ) ( ON ?auto_25835 ?auto_25852 ) ( CLEAR ?auto_25835 ) ( not ( = ?auto_25836 ?auto_25852 ) ) ( not ( = ?auto_25837 ?auto_25852 ) ) ( not ( = ?auto_25835 ?auto_25852 ) ) ( not ( = ?auto_25841 ?auto_25852 ) ) ( not ( = ?auto_25851 ?auto_25852 ) ) ( not ( = ?auto_25846 ?auto_25852 ) ) ( SURFACE-AT ?auto_25848 ?auto_25849 ) ( CLEAR ?auto_25848 ) ( IS-CRATE ?auto_25846 ) ( not ( = ?auto_25848 ?auto_25846 ) ) ( not ( = ?auto_25836 ?auto_25848 ) ) ( not ( = ?auto_25837 ?auto_25848 ) ) ( not ( = ?auto_25835 ?auto_25848 ) ) ( not ( = ?auto_25841 ?auto_25848 ) ) ( not ( = ?auto_25851 ?auto_25848 ) ) ( not ( = ?auto_25852 ?auto_25848 ) ) ( AVAILABLE ?auto_25850 ) ( TRUCK-AT ?auto_25847 ?auto_25839 ) ( not ( = ?auto_25839 ?auto_25849 ) ) ( not ( = ?auto_25842 ?auto_25839 ) ) ( not ( = ?auto_25840 ?auto_25839 ) ) ( HOIST-AT ?auto_25838 ?auto_25839 ) ( not ( = ?auto_25850 ?auto_25838 ) ) ( not ( = ?auto_25843 ?auto_25838 ) ) ( not ( = ?auto_25845 ?auto_25838 ) ) ( AVAILABLE ?auto_25838 ) ( SURFACE-AT ?auto_25846 ?auto_25839 ) ( ON ?auto_25846 ?auto_25844 ) ( CLEAR ?auto_25846 ) ( not ( = ?auto_25836 ?auto_25844 ) ) ( not ( = ?auto_25837 ?auto_25844 ) ) ( not ( = ?auto_25835 ?auto_25844 ) ) ( not ( = ?auto_25841 ?auto_25844 ) ) ( not ( = ?auto_25851 ?auto_25844 ) ) ( not ( = ?auto_25846 ?auto_25844 ) ) ( not ( = ?auto_25852 ?auto_25844 ) ) ( not ( = ?auto_25848 ?auto_25844 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25836 ?auto_25837 )
      ( MAKE-2CRATE-VERIFY ?auto_25835 ?auto_25836 ?auto_25837 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25853 - SURFACE
      ?auto_25854 - SURFACE
      ?auto_25855 - SURFACE
      ?auto_25856 - SURFACE
    )
    :vars
    (
      ?auto_25863 - HOIST
      ?auto_25861 - PLACE
      ?auto_25858 - PLACE
      ?auto_25860 - HOIST
      ?auto_25868 - SURFACE
      ?auto_25862 - SURFACE
      ?auto_25864 - PLACE
      ?auto_25867 - HOIST
      ?auto_25869 - SURFACE
      ?auto_25865 - SURFACE
      ?auto_25866 - TRUCK
      ?auto_25870 - PLACE
      ?auto_25857 - HOIST
      ?auto_25859 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25863 ?auto_25861 ) ( IS-CRATE ?auto_25856 ) ( not ( = ?auto_25855 ?auto_25856 ) ) ( not ( = ?auto_25854 ?auto_25855 ) ) ( not ( = ?auto_25854 ?auto_25856 ) ) ( not ( = ?auto_25858 ?auto_25861 ) ) ( HOIST-AT ?auto_25860 ?auto_25858 ) ( not ( = ?auto_25863 ?auto_25860 ) ) ( SURFACE-AT ?auto_25856 ?auto_25858 ) ( ON ?auto_25856 ?auto_25868 ) ( CLEAR ?auto_25856 ) ( not ( = ?auto_25855 ?auto_25868 ) ) ( not ( = ?auto_25856 ?auto_25868 ) ) ( not ( = ?auto_25854 ?auto_25868 ) ) ( IS-CRATE ?auto_25855 ) ( AVAILABLE ?auto_25860 ) ( SURFACE-AT ?auto_25855 ?auto_25858 ) ( ON ?auto_25855 ?auto_25862 ) ( CLEAR ?auto_25855 ) ( not ( = ?auto_25855 ?auto_25862 ) ) ( not ( = ?auto_25856 ?auto_25862 ) ) ( not ( = ?auto_25854 ?auto_25862 ) ) ( not ( = ?auto_25868 ?auto_25862 ) ) ( IS-CRATE ?auto_25854 ) ( not ( = ?auto_25853 ?auto_25854 ) ) ( not ( = ?auto_25855 ?auto_25853 ) ) ( not ( = ?auto_25856 ?auto_25853 ) ) ( not ( = ?auto_25868 ?auto_25853 ) ) ( not ( = ?auto_25862 ?auto_25853 ) ) ( not ( = ?auto_25864 ?auto_25861 ) ) ( not ( = ?auto_25858 ?auto_25864 ) ) ( HOIST-AT ?auto_25867 ?auto_25864 ) ( not ( = ?auto_25863 ?auto_25867 ) ) ( not ( = ?auto_25860 ?auto_25867 ) ) ( AVAILABLE ?auto_25867 ) ( SURFACE-AT ?auto_25854 ?auto_25864 ) ( ON ?auto_25854 ?auto_25869 ) ( CLEAR ?auto_25854 ) ( not ( = ?auto_25855 ?auto_25869 ) ) ( not ( = ?auto_25856 ?auto_25869 ) ) ( not ( = ?auto_25854 ?auto_25869 ) ) ( not ( = ?auto_25868 ?auto_25869 ) ) ( not ( = ?auto_25862 ?auto_25869 ) ) ( not ( = ?auto_25853 ?auto_25869 ) ) ( SURFACE-AT ?auto_25865 ?auto_25861 ) ( CLEAR ?auto_25865 ) ( IS-CRATE ?auto_25853 ) ( not ( = ?auto_25865 ?auto_25853 ) ) ( not ( = ?auto_25855 ?auto_25865 ) ) ( not ( = ?auto_25856 ?auto_25865 ) ) ( not ( = ?auto_25854 ?auto_25865 ) ) ( not ( = ?auto_25868 ?auto_25865 ) ) ( not ( = ?auto_25862 ?auto_25865 ) ) ( not ( = ?auto_25869 ?auto_25865 ) ) ( AVAILABLE ?auto_25863 ) ( TRUCK-AT ?auto_25866 ?auto_25870 ) ( not ( = ?auto_25870 ?auto_25861 ) ) ( not ( = ?auto_25858 ?auto_25870 ) ) ( not ( = ?auto_25864 ?auto_25870 ) ) ( HOIST-AT ?auto_25857 ?auto_25870 ) ( not ( = ?auto_25863 ?auto_25857 ) ) ( not ( = ?auto_25860 ?auto_25857 ) ) ( not ( = ?auto_25867 ?auto_25857 ) ) ( AVAILABLE ?auto_25857 ) ( SURFACE-AT ?auto_25853 ?auto_25870 ) ( ON ?auto_25853 ?auto_25859 ) ( CLEAR ?auto_25853 ) ( not ( = ?auto_25855 ?auto_25859 ) ) ( not ( = ?auto_25856 ?auto_25859 ) ) ( not ( = ?auto_25854 ?auto_25859 ) ) ( not ( = ?auto_25868 ?auto_25859 ) ) ( not ( = ?auto_25862 ?auto_25859 ) ) ( not ( = ?auto_25853 ?auto_25859 ) ) ( not ( = ?auto_25869 ?auto_25859 ) ) ( not ( = ?auto_25865 ?auto_25859 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25854 ?auto_25855 ?auto_25856 )
      ( MAKE-3CRATE-VERIFY ?auto_25853 ?auto_25854 ?auto_25855 ?auto_25856 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25871 - SURFACE
      ?auto_25872 - SURFACE
      ?auto_25873 - SURFACE
      ?auto_25874 - SURFACE
      ?auto_25875 - SURFACE
    )
    :vars
    (
      ?auto_25882 - HOIST
      ?auto_25880 - PLACE
      ?auto_25877 - PLACE
      ?auto_25879 - HOIST
      ?auto_25886 - SURFACE
      ?auto_25881 - SURFACE
      ?auto_25883 - PLACE
      ?auto_25885 - HOIST
      ?auto_25887 - SURFACE
      ?auto_25884 - TRUCK
      ?auto_25888 - PLACE
      ?auto_25876 - HOIST
      ?auto_25878 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25882 ?auto_25880 ) ( IS-CRATE ?auto_25875 ) ( not ( = ?auto_25874 ?auto_25875 ) ) ( not ( = ?auto_25873 ?auto_25874 ) ) ( not ( = ?auto_25873 ?auto_25875 ) ) ( not ( = ?auto_25877 ?auto_25880 ) ) ( HOIST-AT ?auto_25879 ?auto_25877 ) ( not ( = ?auto_25882 ?auto_25879 ) ) ( SURFACE-AT ?auto_25875 ?auto_25877 ) ( ON ?auto_25875 ?auto_25886 ) ( CLEAR ?auto_25875 ) ( not ( = ?auto_25874 ?auto_25886 ) ) ( not ( = ?auto_25875 ?auto_25886 ) ) ( not ( = ?auto_25873 ?auto_25886 ) ) ( IS-CRATE ?auto_25874 ) ( AVAILABLE ?auto_25879 ) ( SURFACE-AT ?auto_25874 ?auto_25877 ) ( ON ?auto_25874 ?auto_25881 ) ( CLEAR ?auto_25874 ) ( not ( = ?auto_25874 ?auto_25881 ) ) ( not ( = ?auto_25875 ?auto_25881 ) ) ( not ( = ?auto_25873 ?auto_25881 ) ) ( not ( = ?auto_25886 ?auto_25881 ) ) ( IS-CRATE ?auto_25873 ) ( not ( = ?auto_25872 ?auto_25873 ) ) ( not ( = ?auto_25874 ?auto_25872 ) ) ( not ( = ?auto_25875 ?auto_25872 ) ) ( not ( = ?auto_25886 ?auto_25872 ) ) ( not ( = ?auto_25881 ?auto_25872 ) ) ( not ( = ?auto_25883 ?auto_25880 ) ) ( not ( = ?auto_25877 ?auto_25883 ) ) ( HOIST-AT ?auto_25885 ?auto_25883 ) ( not ( = ?auto_25882 ?auto_25885 ) ) ( not ( = ?auto_25879 ?auto_25885 ) ) ( AVAILABLE ?auto_25885 ) ( SURFACE-AT ?auto_25873 ?auto_25883 ) ( ON ?auto_25873 ?auto_25887 ) ( CLEAR ?auto_25873 ) ( not ( = ?auto_25874 ?auto_25887 ) ) ( not ( = ?auto_25875 ?auto_25887 ) ) ( not ( = ?auto_25873 ?auto_25887 ) ) ( not ( = ?auto_25886 ?auto_25887 ) ) ( not ( = ?auto_25881 ?auto_25887 ) ) ( not ( = ?auto_25872 ?auto_25887 ) ) ( SURFACE-AT ?auto_25871 ?auto_25880 ) ( CLEAR ?auto_25871 ) ( IS-CRATE ?auto_25872 ) ( not ( = ?auto_25871 ?auto_25872 ) ) ( not ( = ?auto_25874 ?auto_25871 ) ) ( not ( = ?auto_25875 ?auto_25871 ) ) ( not ( = ?auto_25873 ?auto_25871 ) ) ( not ( = ?auto_25886 ?auto_25871 ) ) ( not ( = ?auto_25881 ?auto_25871 ) ) ( not ( = ?auto_25887 ?auto_25871 ) ) ( AVAILABLE ?auto_25882 ) ( TRUCK-AT ?auto_25884 ?auto_25888 ) ( not ( = ?auto_25888 ?auto_25880 ) ) ( not ( = ?auto_25877 ?auto_25888 ) ) ( not ( = ?auto_25883 ?auto_25888 ) ) ( HOIST-AT ?auto_25876 ?auto_25888 ) ( not ( = ?auto_25882 ?auto_25876 ) ) ( not ( = ?auto_25879 ?auto_25876 ) ) ( not ( = ?auto_25885 ?auto_25876 ) ) ( AVAILABLE ?auto_25876 ) ( SURFACE-AT ?auto_25872 ?auto_25888 ) ( ON ?auto_25872 ?auto_25878 ) ( CLEAR ?auto_25872 ) ( not ( = ?auto_25874 ?auto_25878 ) ) ( not ( = ?auto_25875 ?auto_25878 ) ) ( not ( = ?auto_25873 ?auto_25878 ) ) ( not ( = ?auto_25886 ?auto_25878 ) ) ( not ( = ?auto_25881 ?auto_25878 ) ) ( not ( = ?auto_25872 ?auto_25878 ) ) ( not ( = ?auto_25887 ?auto_25878 ) ) ( not ( = ?auto_25871 ?auto_25878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25873 ?auto_25874 ?auto_25875 )
      ( MAKE-4CRATE-VERIFY ?auto_25871 ?auto_25872 ?auto_25873 ?auto_25874 ?auto_25875 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25889 - SURFACE
      ?auto_25890 - SURFACE
    )
    :vars
    (
      ?auto_25898 - HOIST
      ?auto_25896 - PLACE
      ?auto_25892 - SURFACE
      ?auto_25893 - PLACE
      ?auto_25895 - HOIST
      ?auto_25904 - SURFACE
      ?auto_25897 - SURFACE
      ?auto_25900 - SURFACE
      ?auto_25899 - PLACE
      ?auto_25903 - HOIST
      ?auto_25905 - SURFACE
      ?auto_25901 - SURFACE
      ?auto_25906 - PLACE
      ?auto_25891 - HOIST
      ?auto_25894 - SURFACE
      ?auto_25902 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25898 ?auto_25896 ) ( IS-CRATE ?auto_25890 ) ( not ( = ?auto_25889 ?auto_25890 ) ) ( not ( = ?auto_25892 ?auto_25889 ) ) ( not ( = ?auto_25892 ?auto_25890 ) ) ( not ( = ?auto_25893 ?auto_25896 ) ) ( HOIST-AT ?auto_25895 ?auto_25893 ) ( not ( = ?auto_25898 ?auto_25895 ) ) ( SURFACE-AT ?auto_25890 ?auto_25893 ) ( ON ?auto_25890 ?auto_25904 ) ( CLEAR ?auto_25890 ) ( not ( = ?auto_25889 ?auto_25904 ) ) ( not ( = ?auto_25890 ?auto_25904 ) ) ( not ( = ?auto_25892 ?auto_25904 ) ) ( IS-CRATE ?auto_25889 ) ( AVAILABLE ?auto_25895 ) ( SURFACE-AT ?auto_25889 ?auto_25893 ) ( ON ?auto_25889 ?auto_25897 ) ( CLEAR ?auto_25889 ) ( not ( = ?auto_25889 ?auto_25897 ) ) ( not ( = ?auto_25890 ?auto_25897 ) ) ( not ( = ?auto_25892 ?auto_25897 ) ) ( not ( = ?auto_25904 ?auto_25897 ) ) ( IS-CRATE ?auto_25892 ) ( not ( = ?auto_25900 ?auto_25892 ) ) ( not ( = ?auto_25889 ?auto_25900 ) ) ( not ( = ?auto_25890 ?auto_25900 ) ) ( not ( = ?auto_25904 ?auto_25900 ) ) ( not ( = ?auto_25897 ?auto_25900 ) ) ( not ( = ?auto_25899 ?auto_25896 ) ) ( not ( = ?auto_25893 ?auto_25899 ) ) ( HOIST-AT ?auto_25903 ?auto_25899 ) ( not ( = ?auto_25898 ?auto_25903 ) ) ( not ( = ?auto_25895 ?auto_25903 ) ) ( AVAILABLE ?auto_25903 ) ( SURFACE-AT ?auto_25892 ?auto_25899 ) ( ON ?auto_25892 ?auto_25905 ) ( CLEAR ?auto_25892 ) ( not ( = ?auto_25889 ?auto_25905 ) ) ( not ( = ?auto_25890 ?auto_25905 ) ) ( not ( = ?auto_25892 ?auto_25905 ) ) ( not ( = ?auto_25904 ?auto_25905 ) ) ( not ( = ?auto_25897 ?auto_25905 ) ) ( not ( = ?auto_25900 ?auto_25905 ) ) ( SURFACE-AT ?auto_25901 ?auto_25896 ) ( CLEAR ?auto_25901 ) ( IS-CRATE ?auto_25900 ) ( not ( = ?auto_25901 ?auto_25900 ) ) ( not ( = ?auto_25889 ?auto_25901 ) ) ( not ( = ?auto_25890 ?auto_25901 ) ) ( not ( = ?auto_25892 ?auto_25901 ) ) ( not ( = ?auto_25904 ?auto_25901 ) ) ( not ( = ?auto_25897 ?auto_25901 ) ) ( not ( = ?auto_25905 ?auto_25901 ) ) ( AVAILABLE ?auto_25898 ) ( not ( = ?auto_25906 ?auto_25896 ) ) ( not ( = ?auto_25893 ?auto_25906 ) ) ( not ( = ?auto_25899 ?auto_25906 ) ) ( HOIST-AT ?auto_25891 ?auto_25906 ) ( not ( = ?auto_25898 ?auto_25891 ) ) ( not ( = ?auto_25895 ?auto_25891 ) ) ( not ( = ?auto_25903 ?auto_25891 ) ) ( AVAILABLE ?auto_25891 ) ( SURFACE-AT ?auto_25900 ?auto_25906 ) ( ON ?auto_25900 ?auto_25894 ) ( CLEAR ?auto_25900 ) ( not ( = ?auto_25889 ?auto_25894 ) ) ( not ( = ?auto_25890 ?auto_25894 ) ) ( not ( = ?auto_25892 ?auto_25894 ) ) ( not ( = ?auto_25904 ?auto_25894 ) ) ( not ( = ?auto_25897 ?auto_25894 ) ) ( not ( = ?auto_25900 ?auto_25894 ) ) ( not ( = ?auto_25905 ?auto_25894 ) ) ( not ( = ?auto_25901 ?auto_25894 ) ) ( TRUCK-AT ?auto_25902 ?auto_25896 ) )
    :subtasks
    ( ( !DRIVE ?auto_25902 ?auto_25896 ?auto_25906 )
      ( MAKE-2CRATE ?auto_25892 ?auto_25889 ?auto_25890 )
      ( MAKE-1CRATE-VERIFY ?auto_25889 ?auto_25890 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25907 - SURFACE
      ?auto_25908 - SURFACE
      ?auto_25909 - SURFACE
    )
    :vars
    (
      ?auto_25921 - HOIST
      ?auto_25923 - PLACE
      ?auto_25922 - PLACE
      ?auto_25918 - HOIST
      ?auto_25919 - SURFACE
      ?auto_25911 - SURFACE
      ?auto_25910 - SURFACE
      ?auto_25915 - PLACE
      ?auto_25924 - HOIST
      ?auto_25913 - SURFACE
      ?auto_25920 - SURFACE
      ?auto_25912 - PLACE
      ?auto_25917 - HOIST
      ?auto_25914 - SURFACE
      ?auto_25916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25921 ?auto_25923 ) ( IS-CRATE ?auto_25909 ) ( not ( = ?auto_25908 ?auto_25909 ) ) ( not ( = ?auto_25907 ?auto_25908 ) ) ( not ( = ?auto_25907 ?auto_25909 ) ) ( not ( = ?auto_25922 ?auto_25923 ) ) ( HOIST-AT ?auto_25918 ?auto_25922 ) ( not ( = ?auto_25921 ?auto_25918 ) ) ( SURFACE-AT ?auto_25909 ?auto_25922 ) ( ON ?auto_25909 ?auto_25919 ) ( CLEAR ?auto_25909 ) ( not ( = ?auto_25908 ?auto_25919 ) ) ( not ( = ?auto_25909 ?auto_25919 ) ) ( not ( = ?auto_25907 ?auto_25919 ) ) ( IS-CRATE ?auto_25908 ) ( AVAILABLE ?auto_25918 ) ( SURFACE-AT ?auto_25908 ?auto_25922 ) ( ON ?auto_25908 ?auto_25911 ) ( CLEAR ?auto_25908 ) ( not ( = ?auto_25908 ?auto_25911 ) ) ( not ( = ?auto_25909 ?auto_25911 ) ) ( not ( = ?auto_25907 ?auto_25911 ) ) ( not ( = ?auto_25919 ?auto_25911 ) ) ( IS-CRATE ?auto_25907 ) ( not ( = ?auto_25910 ?auto_25907 ) ) ( not ( = ?auto_25908 ?auto_25910 ) ) ( not ( = ?auto_25909 ?auto_25910 ) ) ( not ( = ?auto_25919 ?auto_25910 ) ) ( not ( = ?auto_25911 ?auto_25910 ) ) ( not ( = ?auto_25915 ?auto_25923 ) ) ( not ( = ?auto_25922 ?auto_25915 ) ) ( HOIST-AT ?auto_25924 ?auto_25915 ) ( not ( = ?auto_25921 ?auto_25924 ) ) ( not ( = ?auto_25918 ?auto_25924 ) ) ( AVAILABLE ?auto_25924 ) ( SURFACE-AT ?auto_25907 ?auto_25915 ) ( ON ?auto_25907 ?auto_25913 ) ( CLEAR ?auto_25907 ) ( not ( = ?auto_25908 ?auto_25913 ) ) ( not ( = ?auto_25909 ?auto_25913 ) ) ( not ( = ?auto_25907 ?auto_25913 ) ) ( not ( = ?auto_25919 ?auto_25913 ) ) ( not ( = ?auto_25911 ?auto_25913 ) ) ( not ( = ?auto_25910 ?auto_25913 ) ) ( SURFACE-AT ?auto_25920 ?auto_25923 ) ( CLEAR ?auto_25920 ) ( IS-CRATE ?auto_25910 ) ( not ( = ?auto_25920 ?auto_25910 ) ) ( not ( = ?auto_25908 ?auto_25920 ) ) ( not ( = ?auto_25909 ?auto_25920 ) ) ( not ( = ?auto_25907 ?auto_25920 ) ) ( not ( = ?auto_25919 ?auto_25920 ) ) ( not ( = ?auto_25911 ?auto_25920 ) ) ( not ( = ?auto_25913 ?auto_25920 ) ) ( AVAILABLE ?auto_25921 ) ( not ( = ?auto_25912 ?auto_25923 ) ) ( not ( = ?auto_25922 ?auto_25912 ) ) ( not ( = ?auto_25915 ?auto_25912 ) ) ( HOIST-AT ?auto_25917 ?auto_25912 ) ( not ( = ?auto_25921 ?auto_25917 ) ) ( not ( = ?auto_25918 ?auto_25917 ) ) ( not ( = ?auto_25924 ?auto_25917 ) ) ( AVAILABLE ?auto_25917 ) ( SURFACE-AT ?auto_25910 ?auto_25912 ) ( ON ?auto_25910 ?auto_25914 ) ( CLEAR ?auto_25910 ) ( not ( = ?auto_25908 ?auto_25914 ) ) ( not ( = ?auto_25909 ?auto_25914 ) ) ( not ( = ?auto_25907 ?auto_25914 ) ) ( not ( = ?auto_25919 ?auto_25914 ) ) ( not ( = ?auto_25911 ?auto_25914 ) ) ( not ( = ?auto_25910 ?auto_25914 ) ) ( not ( = ?auto_25913 ?auto_25914 ) ) ( not ( = ?auto_25920 ?auto_25914 ) ) ( TRUCK-AT ?auto_25916 ?auto_25923 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25908 ?auto_25909 )
      ( MAKE-2CRATE-VERIFY ?auto_25907 ?auto_25908 ?auto_25909 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25925 - SURFACE
      ?auto_25926 - SURFACE
      ?auto_25927 - SURFACE
      ?auto_25928 - SURFACE
    )
    :vars
    (
      ?auto_25941 - HOIST
      ?auto_25940 - PLACE
      ?auto_25938 - PLACE
      ?auto_25934 - HOIST
      ?auto_25937 - SURFACE
      ?auto_25942 - SURFACE
      ?auto_25935 - PLACE
      ?auto_25936 - HOIST
      ?auto_25932 - SURFACE
      ?auto_25939 - SURFACE
      ?auto_25929 - PLACE
      ?auto_25930 - HOIST
      ?auto_25933 - SURFACE
      ?auto_25931 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25941 ?auto_25940 ) ( IS-CRATE ?auto_25928 ) ( not ( = ?auto_25927 ?auto_25928 ) ) ( not ( = ?auto_25926 ?auto_25927 ) ) ( not ( = ?auto_25926 ?auto_25928 ) ) ( not ( = ?auto_25938 ?auto_25940 ) ) ( HOIST-AT ?auto_25934 ?auto_25938 ) ( not ( = ?auto_25941 ?auto_25934 ) ) ( SURFACE-AT ?auto_25928 ?auto_25938 ) ( ON ?auto_25928 ?auto_25937 ) ( CLEAR ?auto_25928 ) ( not ( = ?auto_25927 ?auto_25937 ) ) ( not ( = ?auto_25928 ?auto_25937 ) ) ( not ( = ?auto_25926 ?auto_25937 ) ) ( IS-CRATE ?auto_25927 ) ( AVAILABLE ?auto_25934 ) ( SURFACE-AT ?auto_25927 ?auto_25938 ) ( ON ?auto_25927 ?auto_25942 ) ( CLEAR ?auto_25927 ) ( not ( = ?auto_25927 ?auto_25942 ) ) ( not ( = ?auto_25928 ?auto_25942 ) ) ( not ( = ?auto_25926 ?auto_25942 ) ) ( not ( = ?auto_25937 ?auto_25942 ) ) ( IS-CRATE ?auto_25926 ) ( not ( = ?auto_25925 ?auto_25926 ) ) ( not ( = ?auto_25927 ?auto_25925 ) ) ( not ( = ?auto_25928 ?auto_25925 ) ) ( not ( = ?auto_25937 ?auto_25925 ) ) ( not ( = ?auto_25942 ?auto_25925 ) ) ( not ( = ?auto_25935 ?auto_25940 ) ) ( not ( = ?auto_25938 ?auto_25935 ) ) ( HOIST-AT ?auto_25936 ?auto_25935 ) ( not ( = ?auto_25941 ?auto_25936 ) ) ( not ( = ?auto_25934 ?auto_25936 ) ) ( AVAILABLE ?auto_25936 ) ( SURFACE-AT ?auto_25926 ?auto_25935 ) ( ON ?auto_25926 ?auto_25932 ) ( CLEAR ?auto_25926 ) ( not ( = ?auto_25927 ?auto_25932 ) ) ( not ( = ?auto_25928 ?auto_25932 ) ) ( not ( = ?auto_25926 ?auto_25932 ) ) ( not ( = ?auto_25937 ?auto_25932 ) ) ( not ( = ?auto_25942 ?auto_25932 ) ) ( not ( = ?auto_25925 ?auto_25932 ) ) ( SURFACE-AT ?auto_25939 ?auto_25940 ) ( CLEAR ?auto_25939 ) ( IS-CRATE ?auto_25925 ) ( not ( = ?auto_25939 ?auto_25925 ) ) ( not ( = ?auto_25927 ?auto_25939 ) ) ( not ( = ?auto_25928 ?auto_25939 ) ) ( not ( = ?auto_25926 ?auto_25939 ) ) ( not ( = ?auto_25937 ?auto_25939 ) ) ( not ( = ?auto_25942 ?auto_25939 ) ) ( not ( = ?auto_25932 ?auto_25939 ) ) ( AVAILABLE ?auto_25941 ) ( not ( = ?auto_25929 ?auto_25940 ) ) ( not ( = ?auto_25938 ?auto_25929 ) ) ( not ( = ?auto_25935 ?auto_25929 ) ) ( HOIST-AT ?auto_25930 ?auto_25929 ) ( not ( = ?auto_25941 ?auto_25930 ) ) ( not ( = ?auto_25934 ?auto_25930 ) ) ( not ( = ?auto_25936 ?auto_25930 ) ) ( AVAILABLE ?auto_25930 ) ( SURFACE-AT ?auto_25925 ?auto_25929 ) ( ON ?auto_25925 ?auto_25933 ) ( CLEAR ?auto_25925 ) ( not ( = ?auto_25927 ?auto_25933 ) ) ( not ( = ?auto_25928 ?auto_25933 ) ) ( not ( = ?auto_25926 ?auto_25933 ) ) ( not ( = ?auto_25937 ?auto_25933 ) ) ( not ( = ?auto_25942 ?auto_25933 ) ) ( not ( = ?auto_25925 ?auto_25933 ) ) ( not ( = ?auto_25932 ?auto_25933 ) ) ( not ( = ?auto_25939 ?auto_25933 ) ) ( TRUCK-AT ?auto_25931 ?auto_25940 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25926 ?auto_25927 ?auto_25928 )
      ( MAKE-3CRATE-VERIFY ?auto_25925 ?auto_25926 ?auto_25927 ?auto_25928 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25943 - SURFACE
      ?auto_25944 - SURFACE
      ?auto_25945 - SURFACE
      ?auto_25946 - SURFACE
      ?auto_25947 - SURFACE
    )
    :vars
    (
      ?auto_25959 - HOIST
      ?auto_25958 - PLACE
      ?auto_25957 - PLACE
      ?auto_25953 - HOIST
      ?auto_25956 - SURFACE
      ?auto_25960 - SURFACE
      ?auto_25954 - PLACE
      ?auto_25955 - HOIST
      ?auto_25951 - SURFACE
      ?auto_25948 - PLACE
      ?auto_25949 - HOIST
      ?auto_25952 - SURFACE
      ?auto_25950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_25959 ?auto_25958 ) ( IS-CRATE ?auto_25947 ) ( not ( = ?auto_25946 ?auto_25947 ) ) ( not ( = ?auto_25945 ?auto_25946 ) ) ( not ( = ?auto_25945 ?auto_25947 ) ) ( not ( = ?auto_25957 ?auto_25958 ) ) ( HOIST-AT ?auto_25953 ?auto_25957 ) ( not ( = ?auto_25959 ?auto_25953 ) ) ( SURFACE-AT ?auto_25947 ?auto_25957 ) ( ON ?auto_25947 ?auto_25956 ) ( CLEAR ?auto_25947 ) ( not ( = ?auto_25946 ?auto_25956 ) ) ( not ( = ?auto_25947 ?auto_25956 ) ) ( not ( = ?auto_25945 ?auto_25956 ) ) ( IS-CRATE ?auto_25946 ) ( AVAILABLE ?auto_25953 ) ( SURFACE-AT ?auto_25946 ?auto_25957 ) ( ON ?auto_25946 ?auto_25960 ) ( CLEAR ?auto_25946 ) ( not ( = ?auto_25946 ?auto_25960 ) ) ( not ( = ?auto_25947 ?auto_25960 ) ) ( not ( = ?auto_25945 ?auto_25960 ) ) ( not ( = ?auto_25956 ?auto_25960 ) ) ( IS-CRATE ?auto_25945 ) ( not ( = ?auto_25944 ?auto_25945 ) ) ( not ( = ?auto_25946 ?auto_25944 ) ) ( not ( = ?auto_25947 ?auto_25944 ) ) ( not ( = ?auto_25956 ?auto_25944 ) ) ( not ( = ?auto_25960 ?auto_25944 ) ) ( not ( = ?auto_25954 ?auto_25958 ) ) ( not ( = ?auto_25957 ?auto_25954 ) ) ( HOIST-AT ?auto_25955 ?auto_25954 ) ( not ( = ?auto_25959 ?auto_25955 ) ) ( not ( = ?auto_25953 ?auto_25955 ) ) ( AVAILABLE ?auto_25955 ) ( SURFACE-AT ?auto_25945 ?auto_25954 ) ( ON ?auto_25945 ?auto_25951 ) ( CLEAR ?auto_25945 ) ( not ( = ?auto_25946 ?auto_25951 ) ) ( not ( = ?auto_25947 ?auto_25951 ) ) ( not ( = ?auto_25945 ?auto_25951 ) ) ( not ( = ?auto_25956 ?auto_25951 ) ) ( not ( = ?auto_25960 ?auto_25951 ) ) ( not ( = ?auto_25944 ?auto_25951 ) ) ( SURFACE-AT ?auto_25943 ?auto_25958 ) ( CLEAR ?auto_25943 ) ( IS-CRATE ?auto_25944 ) ( not ( = ?auto_25943 ?auto_25944 ) ) ( not ( = ?auto_25946 ?auto_25943 ) ) ( not ( = ?auto_25947 ?auto_25943 ) ) ( not ( = ?auto_25945 ?auto_25943 ) ) ( not ( = ?auto_25956 ?auto_25943 ) ) ( not ( = ?auto_25960 ?auto_25943 ) ) ( not ( = ?auto_25951 ?auto_25943 ) ) ( AVAILABLE ?auto_25959 ) ( not ( = ?auto_25948 ?auto_25958 ) ) ( not ( = ?auto_25957 ?auto_25948 ) ) ( not ( = ?auto_25954 ?auto_25948 ) ) ( HOIST-AT ?auto_25949 ?auto_25948 ) ( not ( = ?auto_25959 ?auto_25949 ) ) ( not ( = ?auto_25953 ?auto_25949 ) ) ( not ( = ?auto_25955 ?auto_25949 ) ) ( AVAILABLE ?auto_25949 ) ( SURFACE-AT ?auto_25944 ?auto_25948 ) ( ON ?auto_25944 ?auto_25952 ) ( CLEAR ?auto_25944 ) ( not ( = ?auto_25946 ?auto_25952 ) ) ( not ( = ?auto_25947 ?auto_25952 ) ) ( not ( = ?auto_25945 ?auto_25952 ) ) ( not ( = ?auto_25956 ?auto_25952 ) ) ( not ( = ?auto_25960 ?auto_25952 ) ) ( not ( = ?auto_25944 ?auto_25952 ) ) ( not ( = ?auto_25951 ?auto_25952 ) ) ( not ( = ?auto_25943 ?auto_25952 ) ) ( TRUCK-AT ?auto_25950 ?auto_25958 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_25945 ?auto_25946 ?auto_25947 )
      ( MAKE-4CRATE-VERIFY ?auto_25943 ?auto_25944 ?auto_25945 ?auto_25946 ?auto_25947 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_25981 - SURFACE
      ?auto_25982 - SURFACE
    )
    :vars
    (
      ?auto_25983 - HOIST
      ?auto_25984 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25983 ?auto_25984 ) ( SURFACE-AT ?auto_25981 ?auto_25984 ) ( CLEAR ?auto_25981 ) ( LIFTING ?auto_25983 ?auto_25982 ) ( IS-CRATE ?auto_25982 ) ( not ( = ?auto_25981 ?auto_25982 ) ) )
    :subtasks
    ( ( !DROP ?auto_25983 ?auto_25982 ?auto_25981 ?auto_25984 )
      ( MAKE-1CRATE-VERIFY ?auto_25981 ?auto_25982 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_25985 - SURFACE
      ?auto_25986 - SURFACE
      ?auto_25987 - SURFACE
    )
    :vars
    (
      ?auto_25989 - HOIST
      ?auto_25988 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25989 ?auto_25988 ) ( SURFACE-AT ?auto_25986 ?auto_25988 ) ( CLEAR ?auto_25986 ) ( LIFTING ?auto_25989 ?auto_25987 ) ( IS-CRATE ?auto_25987 ) ( not ( = ?auto_25986 ?auto_25987 ) ) ( ON ?auto_25986 ?auto_25985 ) ( not ( = ?auto_25985 ?auto_25986 ) ) ( not ( = ?auto_25985 ?auto_25987 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25986 ?auto_25987 )
      ( MAKE-2CRATE-VERIFY ?auto_25985 ?auto_25986 ?auto_25987 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_25990 - SURFACE
      ?auto_25991 - SURFACE
      ?auto_25992 - SURFACE
      ?auto_25993 - SURFACE
    )
    :vars
    (
      ?auto_25995 - HOIST
      ?auto_25994 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_25995 ?auto_25994 ) ( SURFACE-AT ?auto_25992 ?auto_25994 ) ( CLEAR ?auto_25992 ) ( LIFTING ?auto_25995 ?auto_25993 ) ( IS-CRATE ?auto_25993 ) ( not ( = ?auto_25992 ?auto_25993 ) ) ( ON ?auto_25991 ?auto_25990 ) ( ON ?auto_25992 ?auto_25991 ) ( not ( = ?auto_25990 ?auto_25991 ) ) ( not ( = ?auto_25990 ?auto_25992 ) ) ( not ( = ?auto_25990 ?auto_25993 ) ) ( not ( = ?auto_25991 ?auto_25992 ) ) ( not ( = ?auto_25991 ?auto_25993 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25992 ?auto_25993 )
      ( MAKE-3CRATE-VERIFY ?auto_25990 ?auto_25991 ?auto_25992 ?auto_25993 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_25996 - SURFACE
      ?auto_25997 - SURFACE
      ?auto_25998 - SURFACE
      ?auto_25999 - SURFACE
      ?auto_26000 - SURFACE
    )
    :vars
    (
      ?auto_26002 - HOIST
      ?auto_26001 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26002 ?auto_26001 ) ( SURFACE-AT ?auto_25999 ?auto_26001 ) ( CLEAR ?auto_25999 ) ( LIFTING ?auto_26002 ?auto_26000 ) ( IS-CRATE ?auto_26000 ) ( not ( = ?auto_25999 ?auto_26000 ) ) ( ON ?auto_25997 ?auto_25996 ) ( ON ?auto_25998 ?auto_25997 ) ( ON ?auto_25999 ?auto_25998 ) ( not ( = ?auto_25996 ?auto_25997 ) ) ( not ( = ?auto_25996 ?auto_25998 ) ) ( not ( = ?auto_25996 ?auto_25999 ) ) ( not ( = ?auto_25996 ?auto_26000 ) ) ( not ( = ?auto_25997 ?auto_25998 ) ) ( not ( = ?auto_25997 ?auto_25999 ) ) ( not ( = ?auto_25997 ?auto_26000 ) ) ( not ( = ?auto_25998 ?auto_25999 ) ) ( not ( = ?auto_25998 ?auto_26000 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_25999 ?auto_26000 )
      ( MAKE-4CRATE-VERIFY ?auto_25996 ?auto_25997 ?auto_25998 ?auto_25999 ?auto_26000 ) )
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
      ?auto_26010 - HOIST
      ?auto_26009 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26010 ?auto_26009 ) ( SURFACE-AT ?auto_26007 ?auto_26009 ) ( CLEAR ?auto_26007 ) ( LIFTING ?auto_26010 ?auto_26008 ) ( IS-CRATE ?auto_26008 ) ( not ( = ?auto_26007 ?auto_26008 ) ) ( ON ?auto_26004 ?auto_26003 ) ( ON ?auto_26005 ?auto_26004 ) ( ON ?auto_26006 ?auto_26005 ) ( ON ?auto_26007 ?auto_26006 ) ( not ( = ?auto_26003 ?auto_26004 ) ) ( not ( = ?auto_26003 ?auto_26005 ) ) ( not ( = ?auto_26003 ?auto_26006 ) ) ( not ( = ?auto_26003 ?auto_26007 ) ) ( not ( = ?auto_26003 ?auto_26008 ) ) ( not ( = ?auto_26004 ?auto_26005 ) ) ( not ( = ?auto_26004 ?auto_26006 ) ) ( not ( = ?auto_26004 ?auto_26007 ) ) ( not ( = ?auto_26004 ?auto_26008 ) ) ( not ( = ?auto_26005 ?auto_26006 ) ) ( not ( = ?auto_26005 ?auto_26007 ) ) ( not ( = ?auto_26005 ?auto_26008 ) ) ( not ( = ?auto_26006 ?auto_26007 ) ) ( not ( = ?auto_26006 ?auto_26008 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26007 ?auto_26008 )
      ( MAKE-5CRATE-VERIFY ?auto_26003 ?auto_26004 ?auto_26005 ?auto_26006 ?auto_26007 ?auto_26008 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26011 - SURFACE
      ?auto_26012 - SURFACE
    )
    :vars
    (
      ?auto_26014 - HOIST
      ?auto_26013 - PLACE
      ?auto_26015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26014 ?auto_26013 ) ( SURFACE-AT ?auto_26011 ?auto_26013 ) ( CLEAR ?auto_26011 ) ( IS-CRATE ?auto_26012 ) ( not ( = ?auto_26011 ?auto_26012 ) ) ( TRUCK-AT ?auto_26015 ?auto_26013 ) ( AVAILABLE ?auto_26014 ) ( IN ?auto_26012 ?auto_26015 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26014 ?auto_26012 ?auto_26015 ?auto_26013 )
      ( MAKE-1CRATE ?auto_26011 ?auto_26012 )
      ( MAKE-1CRATE-VERIFY ?auto_26011 ?auto_26012 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26016 - SURFACE
      ?auto_26017 - SURFACE
      ?auto_26018 - SURFACE
    )
    :vars
    (
      ?auto_26019 - HOIST
      ?auto_26020 - PLACE
      ?auto_26021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26019 ?auto_26020 ) ( SURFACE-AT ?auto_26017 ?auto_26020 ) ( CLEAR ?auto_26017 ) ( IS-CRATE ?auto_26018 ) ( not ( = ?auto_26017 ?auto_26018 ) ) ( TRUCK-AT ?auto_26021 ?auto_26020 ) ( AVAILABLE ?auto_26019 ) ( IN ?auto_26018 ?auto_26021 ) ( ON ?auto_26017 ?auto_26016 ) ( not ( = ?auto_26016 ?auto_26017 ) ) ( not ( = ?auto_26016 ?auto_26018 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26017 ?auto_26018 )
      ( MAKE-2CRATE-VERIFY ?auto_26016 ?auto_26017 ?auto_26018 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26022 - SURFACE
      ?auto_26023 - SURFACE
      ?auto_26024 - SURFACE
      ?auto_26025 - SURFACE
    )
    :vars
    (
      ?auto_26028 - HOIST
      ?auto_26027 - PLACE
      ?auto_26026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26028 ?auto_26027 ) ( SURFACE-AT ?auto_26024 ?auto_26027 ) ( CLEAR ?auto_26024 ) ( IS-CRATE ?auto_26025 ) ( not ( = ?auto_26024 ?auto_26025 ) ) ( TRUCK-AT ?auto_26026 ?auto_26027 ) ( AVAILABLE ?auto_26028 ) ( IN ?auto_26025 ?auto_26026 ) ( ON ?auto_26024 ?auto_26023 ) ( not ( = ?auto_26023 ?auto_26024 ) ) ( not ( = ?auto_26023 ?auto_26025 ) ) ( ON ?auto_26023 ?auto_26022 ) ( not ( = ?auto_26022 ?auto_26023 ) ) ( not ( = ?auto_26022 ?auto_26024 ) ) ( not ( = ?auto_26022 ?auto_26025 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26023 ?auto_26024 ?auto_26025 )
      ( MAKE-3CRATE-VERIFY ?auto_26022 ?auto_26023 ?auto_26024 ?auto_26025 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26029 - SURFACE
      ?auto_26030 - SURFACE
      ?auto_26031 - SURFACE
      ?auto_26032 - SURFACE
      ?auto_26033 - SURFACE
    )
    :vars
    (
      ?auto_26036 - HOIST
      ?auto_26035 - PLACE
      ?auto_26034 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26036 ?auto_26035 ) ( SURFACE-AT ?auto_26032 ?auto_26035 ) ( CLEAR ?auto_26032 ) ( IS-CRATE ?auto_26033 ) ( not ( = ?auto_26032 ?auto_26033 ) ) ( TRUCK-AT ?auto_26034 ?auto_26035 ) ( AVAILABLE ?auto_26036 ) ( IN ?auto_26033 ?auto_26034 ) ( ON ?auto_26032 ?auto_26031 ) ( not ( = ?auto_26031 ?auto_26032 ) ) ( not ( = ?auto_26031 ?auto_26033 ) ) ( ON ?auto_26030 ?auto_26029 ) ( ON ?auto_26031 ?auto_26030 ) ( not ( = ?auto_26029 ?auto_26030 ) ) ( not ( = ?auto_26029 ?auto_26031 ) ) ( not ( = ?auto_26029 ?auto_26032 ) ) ( not ( = ?auto_26029 ?auto_26033 ) ) ( not ( = ?auto_26030 ?auto_26031 ) ) ( not ( = ?auto_26030 ?auto_26032 ) ) ( not ( = ?auto_26030 ?auto_26033 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26031 ?auto_26032 ?auto_26033 )
      ( MAKE-4CRATE-VERIFY ?auto_26029 ?auto_26030 ?auto_26031 ?auto_26032 ?auto_26033 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26037 - SURFACE
      ?auto_26038 - SURFACE
      ?auto_26039 - SURFACE
      ?auto_26040 - SURFACE
      ?auto_26041 - SURFACE
      ?auto_26042 - SURFACE
    )
    :vars
    (
      ?auto_26045 - HOIST
      ?auto_26044 - PLACE
      ?auto_26043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26045 ?auto_26044 ) ( SURFACE-AT ?auto_26041 ?auto_26044 ) ( CLEAR ?auto_26041 ) ( IS-CRATE ?auto_26042 ) ( not ( = ?auto_26041 ?auto_26042 ) ) ( TRUCK-AT ?auto_26043 ?auto_26044 ) ( AVAILABLE ?auto_26045 ) ( IN ?auto_26042 ?auto_26043 ) ( ON ?auto_26041 ?auto_26040 ) ( not ( = ?auto_26040 ?auto_26041 ) ) ( not ( = ?auto_26040 ?auto_26042 ) ) ( ON ?auto_26038 ?auto_26037 ) ( ON ?auto_26039 ?auto_26038 ) ( ON ?auto_26040 ?auto_26039 ) ( not ( = ?auto_26037 ?auto_26038 ) ) ( not ( = ?auto_26037 ?auto_26039 ) ) ( not ( = ?auto_26037 ?auto_26040 ) ) ( not ( = ?auto_26037 ?auto_26041 ) ) ( not ( = ?auto_26037 ?auto_26042 ) ) ( not ( = ?auto_26038 ?auto_26039 ) ) ( not ( = ?auto_26038 ?auto_26040 ) ) ( not ( = ?auto_26038 ?auto_26041 ) ) ( not ( = ?auto_26038 ?auto_26042 ) ) ( not ( = ?auto_26039 ?auto_26040 ) ) ( not ( = ?auto_26039 ?auto_26041 ) ) ( not ( = ?auto_26039 ?auto_26042 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26040 ?auto_26041 ?auto_26042 )
      ( MAKE-5CRATE-VERIFY ?auto_26037 ?auto_26038 ?auto_26039 ?auto_26040 ?auto_26041 ?auto_26042 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26046 - SURFACE
      ?auto_26047 - SURFACE
    )
    :vars
    (
      ?auto_26051 - HOIST
      ?auto_26050 - PLACE
      ?auto_26048 - TRUCK
      ?auto_26049 - SURFACE
      ?auto_26052 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26051 ?auto_26050 ) ( SURFACE-AT ?auto_26046 ?auto_26050 ) ( CLEAR ?auto_26046 ) ( IS-CRATE ?auto_26047 ) ( not ( = ?auto_26046 ?auto_26047 ) ) ( AVAILABLE ?auto_26051 ) ( IN ?auto_26047 ?auto_26048 ) ( ON ?auto_26046 ?auto_26049 ) ( not ( = ?auto_26049 ?auto_26046 ) ) ( not ( = ?auto_26049 ?auto_26047 ) ) ( TRUCK-AT ?auto_26048 ?auto_26052 ) ( not ( = ?auto_26052 ?auto_26050 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26048 ?auto_26052 ?auto_26050 )
      ( MAKE-2CRATE ?auto_26049 ?auto_26046 ?auto_26047 )
      ( MAKE-1CRATE-VERIFY ?auto_26046 ?auto_26047 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26053 - SURFACE
      ?auto_26054 - SURFACE
      ?auto_26055 - SURFACE
    )
    :vars
    (
      ?auto_26057 - HOIST
      ?auto_26056 - PLACE
      ?auto_26058 - TRUCK
      ?auto_26059 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26057 ?auto_26056 ) ( SURFACE-AT ?auto_26054 ?auto_26056 ) ( CLEAR ?auto_26054 ) ( IS-CRATE ?auto_26055 ) ( not ( = ?auto_26054 ?auto_26055 ) ) ( AVAILABLE ?auto_26057 ) ( IN ?auto_26055 ?auto_26058 ) ( ON ?auto_26054 ?auto_26053 ) ( not ( = ?auto_26053 ?auto_26054 ) ) ( not ( = ?auto_26053 ?auto_26055 ) ) ( TRUCK-AT ?auto_26058 ?auto_26059 ) ( not ( = ?auto_26059 ?auto_26056 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26054 ?auto_26055 )
      ( MAKE-2CRATE-VERIFY ?auto_26053 ?auto_26054 ?auto_26055 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26060 - SURFACE
      ?auto_26061 - SURFACE
      ?auto_26062 - SURFACE
      ?auto_26063 - SURFACE
    )
    :vars
    (
      ?auto_26064 - HOIST
      ?auto_26065 - PLACE
      ?auto_26067 - TRUCK
      ?auto_26066 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26064 ?auto_26065 ) ( SURFACE-AT ?auto_26062 ?auto_26065 ) ( CLEAR ?auto_26062 ) ( IS-CRATE ?auto_26063 ) ( not ( = ?auto_26062 ?auto_26063 ) ) ( AVAILABLE ?auto_26064 ) ( IN ?auto_26063 ?auto_26067 ) ( ON ?auto_26062 ?auto_26061 ) ( not ( = ?auto_26061 ?auto_26062 ) ) ( not ( = ?auto_26061 ?auto_26063 ) ) ( TRUCK-AT ?auto_26067 ?auto_26066 ) ( not ( = ?auto_26066 ?auto_26065 ) ) ( ON ?auto_26061 ?auto_26060 ) ( not ( = ?auto_26060 ?auto_26061 ) ) ( not ( = ?auto_26060 ?auto_26062 ) ) ( not ( = ?auto_26060 ?auto_26063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26061 ?auto_26062 ?auto_26063 )
      ( MAKE-3CRATE-VERIFY ?auto_26060 ?auto_26061 ?auto_26062 ?auto_26063 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26068 - SURFACE
      ?auto_26069 - SURFACE
      ?auto_26070 - SURFACE
      ?auto_26071 - SURFACE
      ?auto_26072 - SURFACE
    )
    :vars
    (
      ?auto_26073 - HOIST
      ?auto_26074 - PLACE
      ?auto_26076 - TRUCK
      ?auto_26075 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26073 ?auto_26074 ) ( SURFACE-AT ?auto_26071 ?auto_26074 ) ( CLEAR ?auto_26071 ) ( IS-CRATE ?auto_26072 ) ( not ( = ?auto_26071 ?auto_26072 ) ) ( AVAILABLE ?auto_26073 ) ( IN ?auto_26072 ?auto_26076 ) ( ON ?auto_26071 ?auto_26070 ) ( not ( = ?auto_26070 ?auto_26071 ) ) ( not ( = ?auto_26070 ?auto_26072 ) ) ( TRUCK-AT ?auto_26076 ?auto_26075 ) ( not ( = ?auto_26075 ?auto_26074 ) ) ( ON ?auto_26069 ?auto_26068 ) ( ON ?auto_26070 ?auto_26069 ) ( not ( = ?auto_26068 ?auto_26069 ) ) ( not ( = ?auto_26068 ?auto_26070 ) ) ( not ( = ?auto_26068 ?auto_26071 ) ) ( not ( = ?auto_26068 ?auto_26072 ) ) ( not ( = ?auto_26069 ?auto_26070 ) ) ( not ( = ?auto_26069 ?auto_26071 ) ) ( not ( = ?auto_26069 ?auto_26072 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26070 ?auto_26071 ?auto_26072 )
      ( MAKE-4CRATE-VERIFY ?auto_26068 ?auto_26069 ?auto_26070 ?auto_26071 ?auto_26072 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26077 - SURFACE
      ?auto_26078 - SURFACE
      ?auto_26079 - SURFACE
      ?auto_26080 - SURFACE
      ?auto_26081 - SURFACE
      ?auto_26082 - SURFACE
    )
    :vars
    (
      ?auto_26083 - HOIST
      ?auto_26084 - PLACE
      ?auto_26086 - TRUCK
      ?auto_26085 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26083 ?auto_26084 ) ( SURFACE-AT ?auto_26081 ?auto_26084 ) ( CLEAR ?auto_26081 ) ( IS-CRATE ?auto_26082 ) ( not ( = ?auto_26081 ?auto_26082 ) ) ( AVAILABLE ?auto_26083 ) ( IN ?auto_26082 ?auto_26086 ) ( ON ?auto_26081 ?auto_26080 ) ( not ( = ?auto_26080 ?auto_26081 ) ) ( not ( = ?auto_26080 ?auto_26082 ) ) ( TRUCK-AT ?auto_26086 ?auto_26085 ) ( not ( = ?auto_26085 ?auto_26084 ) ) ( ON ?auto_26078 ?auto_26077 ) ( ON ?auto_26079 ?auto_26078 ) ( ON ?auto_26080 ?auto_26079 ) ( not ( = ?auto_26077 ?auto_26078 ) ) ( not ( = ?auto_26077 ?auto_26079 ) ) ( not ( = ?auto_26077 ?auto_26080 ) ) ( not ( = ?auto_26077 ?auto_26081 ) ) ( not ( = ?auto_26077 ?auto_26082 ) ) ( not ( = ?auto_26078 ?auto_26079 ) ) ( not ( = ?auto_26078 ?auto_26080 ) ) ( not ( = ?auto_26078 ?auto_26081 ) ) ( not ( = ?auto_26078 ?auto_26082 ) ) ( not ( = ?auto_26079 ?auto_26080 ) ) ( not ( = ?auto_26079 ?auto_26081 ) ) ( not ( = ?auto_26079 ?auto_26082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26080 ?auto_26081 ?auto_26082 )
      ( MAKE-5CRATE-VERIFY ?auto_26077 ?auto_26078 ?auto_26079 ?auto_26080 ?auto_26081 ?auto_26082 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26087 - SURFACE
      ?auto_26088 - SURFACE
    )
    :vars
    (
      ?auto_26089 - HOIST
      ?auto_26090 - PLACE
      ?auto_26092 - SURFACE
      ?auto_26093 - TRUCK
      ?auto_26091 - PLACE
      ?auto_26094 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26089 ?auto_26090 ) ( SURFACE-AT ?auto_26087 ?auto_26090 ) ( CLEAR ?auto_26087 ) ( IS-CRATE ?auto_26088 ) ( not ( = ?auto_26087 ?auto_26088 ) ) ( AVAILABLE ?auto_26089 ) ( ON ?auto_26087 ?auto_26092 ) ( not ( = ?auto_26092 ?auto_26087 ) ) ( not ( = ?auto_26092 ?auto_26088 ) ) ( TRUCK-AT ?auto_26093 ?auto_26091 ) ( not ( = ?auto_26091 ?auto_26090 ) ) ( HOIST-AT ?auto_26094 ?auto_26091 ) ( LIFTING ?auto_26094 ?auto_26088 ) ( not ( = ?auto_26089 ?auto_26094 ) ) )
    :subtasks
    ( ( !LOAD ?auto_26094 ?auto_26088 ?auto_26093 ?auto_26091 )
      ( MAKE-2CRATE ?auto_26092 ?auto_26087 ?auto_26088 )
      ( MAKE-1CRATE-VERIFY ?auto_26087 ?auto_26088 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26095 - SURFACE
      ?auto_26096 - SURFACE
      ?auto_26097 - SURFACE
    )
    :vars
    (
      ?auto_26099 - HOIST
      ?auto_26098 - PLACE
      ?auto_26101 - TRUCK
      ?auto_26102 - PLACE
      ?auto_26100 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26099 ?auto_26098 ) ( SURFACE-AT ?auto_26096 ?auto_26098 ) ( CLEAR ?auto_26096 ) ( IS-CRATE ?auto_26097 ) ( not ( = ?auto_26096 ?auto_26097 ) ) ( AVAILABLE ?auto_26099 ) ( ON ?auto_26096 ?auto_26095 ) ( not ( = ?auto_26095 ?auto_26096 ) ) ( not ( = ?auto_26095 ?auto_26097 ) ) ( TRUCK-AT ?auto_26101 ?auto_26102 ) ( not ( = ?auto_26102 ?auto_26098 ) ) ( HOIST-AT ?auto_26100 ?auto_26102 ) ( LIFTING ?auto_26100 ?auto_26097 ) ( not ( = ?auto_26099 ?auto_26100 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26096 ?auto_26097 )
      ( MAKE-2CRATE-VERIFY ?auto_26095 ?auto_26096 ?auto_26097 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26103 - SURFACE
      ?auto_26104 - SURFACE
      ?auto_26105 - SURFACE
      ?auto_26106 - SURFACE
    )
    :vars
    (
      ?auto_26108 - HOIST
      ?auto_26107 - PLACE
      ?auto_26109 - TRUCK
      ?auto_26111 - PLACE
      ?auto_26110 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26108 ?auto_26107 ) ( SURFACE-AT ?auto_26105 ?auto_26107 ) ( CLEAR ?auto_26105 ) ( IS-CRATE ?auto_26106 ) ( not ( = ?auto_26105 ?auto_26106 ) ) ( AVAILABLE ?auto_26108 ) ( ON ?auto_26105 ?auto_26104 ) ( not ( = ?auto_26104 ?auto_26105 ) ) ( not ( = ?auto_26104 ?auto_26106 ) ) ( TRUCK-AT ?auto_26109 ?auto_26111 ) ( not ( = ?auto_26111 ?auto_26107 ) ) ( HOIST-AT ?auto_26110 ?auto_26111 ) ( LIFTING ?auto_26110 ?auto_26106 ) ( not ( = ?auto_26108 ?auto_26110 ) ) ( ON ?auto_26104 ?auto_26103 ) ( not ( = ?auto_26103 ?auto_26104 ) ) ( not ( = ?auto_26103 ?auto_26105 ) ) ( not ( = ?auto_26103 ?auto_26106 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26104 ?auto_26105 ?auto_26106 )
      ( MAKE-3CRATE-VERIFY ?auto_26103 ?auto_26104 ?auto_26105 ?auto_26106 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26112 - SURFACE
      ?auto_26113 - SURFACE
      ?auto_26114 - SURFACE
      ?auto_26115 - SURFACE
      ?auto_26116 - SURFACE
    )
    :vars
    (
      ?auto_26118 - HOIST
      ?auto_26117 - PLACE
      ?auto_26119 - TRUCK
      ?auto_26121 - PLACE
      ?auto_26120 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26118 ?auto_26117 ) ( SURFACE-AT ?auto_26115 ?auto_26117 ) ( CLEAR ?auto_26115 ) ( IS-CRATE ?auto_26116 ) ( not ( = ?auto_26115 ?auto_26116 ) ) ( AVAILABLE ?auto_26118 ) ( ON ?auto_26115 ?auto_26114 ) ( not ( = ?auto_26114 ?auto_26115 ) ) ( not ( = ?auto_26114 ?auto_26116 ) ) ( TRUCK-AT ?auto_26119 ?auto_26121 ) ( not ( = ?auto_26121 ?auto_26117 ) ) ( HOIST-AT ?auto_26120 ?auto_26121 ) ( LIFTING ?auto_26120 ?auto_26116 ) ( not ( = ?auto_26118 ?auto_26120 ) ) ( ON ?auto_26113 ?auto_26112 ) ( ON ?auto_26114 ?auto_26113 ) ( not ( = ?auto_26112 ?auto_26113 ) ) ( not ( = ?auto_26112 ?auto_26114 ) ) ( not ( = ?auto_26112 ?auto_26115 ) ) ( not ( = ?auto_26112 ?auto_26116 ) ) ( not ( = ?auto_26113 ?auto_26114 ) ) ( not ( = ?auto_26113 ?auto_26115 ) ) ( not ( = ?auto_26113 ?auto_26116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26114 ?auto_26115 ?auto_26116 )
      ( MAKE-4CRATE-VERIFY ?auto_26112 ?auto_26113 ?auto_26114 ?auto_26115 ?auto_26116 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26122 - SURFACE
      ?auto_26123 - SURFACE
      ?auto_26124 - SURFACE
      ?auto_26125 - SURFACE
      ?auto_26126 - SURFACE
      ?auto_26127 - SURFACE
    )
    :vars
    (
      ?auto_26129 - HOIST
      ?auto_26128 - PLACE
      ?auto_26130 - TRUCK
      ?auto_26132 - PLACE
      ?auto_26131 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26129 ?auto_26128 ) ( SURFACE-AT ?auto_26126 ?auto_26128 ) ( CLEAR ?auto_26126 ) ( IS-CRATE ?auto_26127 ) ( not ( = ?auto_26126 ?auto_26127 ) ) ( AVAILABLE ?auto_26129 ) ( ON ?auto_26126 ?auto_26125 ) ( not ( = ?auto_26125 ?auto_26126 ) ) ( not ( = ?auto_26125 ?auto_26127 ) ) ( TRUCK-AT ?auto_26130 ?auto_26132 ) ( not ( = ?auto_26132 ?auto_26128 ) ) ( HOIST-AT ?auto_26131 ?auto_26132 ) ( LIFTING ?auto_26131 ?auto_26127 ) ( not ( = ?auto_26129 ?auto_26131 ) ) ( ON ?auto_26123 ?auto_26122 ) ( ON ?auto_26124 ?auto_26123 ) ( ON ?auto_26125 ?auto_26124 ) ( not ( = ?auto_26122 ?auto_26123 ) ) ( not ( = ?auto_26122 ?auto_26124 ) ) ( not ( = ?auto_26122 ?auto_26125 ) ) ( not ( = ?auto_26122 ?auto_26126 ) ) ( not ( = ?auto_26122 ?auto_26127 ) ) ( not ( = ?auto_26123 ?auto_26124 ) ) ( not ( = ?auto_26123 ?auto_26125 ) ) ( not ( = ?auto_26123 ?auto_26126 ) ) ( not ( = ?auto_26123 ?auto_26127 ) ) ( not ( = ?auto_26124 ?auto_26125 ) ) ( not ( = ?auto_26124 ?auto_26126 ) ) ( not ( = ?auto_26124 ?auto_26127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26125 ?auto_26126 ?auto_26127 )
      ( MAKE-5CRATE-VERIFY ?auto_26122 ?auto_26123 ?auto_26124 ?auto_26125 ?auto_26126 ?auto_26127 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26133 - SURFACE
      ?auto_26134 - SURFACE
    )
    :vars
    (
      ?auto_26136 - HOIST
      ?auto_26135 - PLACE
      ?auto_26138 - SURFACE
      ?auto_26137 - TRUCK
      ?auto_26140 - PLACE
      ?auto_26139 - HOIST
      ?auto_26141 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26136 ?auto_26135 ) ( SURFACE-AT ?auto_26133 ?auto_26135 ) ( CLEAR ?auto_26133 ) ( IS-CRATE ?auto_26134 ) ( not ( = ?auto_26133 ?auto_26134 ) ) ( AVAILABLE ?auto_26136 ) ( ON ?auto_26133 ?auto_26138 ) ( not ( = ?auto_26138 ?auto_26133 ) ) ( not ( = ?auto_26138 ?auto_26134 ) ) ( TRUCK-AT ?auto_26137 ?auto_26140 ) ( not ( = ?auto_26140 ?auto_26135 ) ) ( HOIST-AT ?auto_26139 ?auto_26140 ) ( not ( = ?auto_26136 ?auto_26139 ) ) ( AVAILABLE ?auto_26139 ) ( SURFACE-AT ?auto_26134 ?auto_26140 ) ( ON ?auto_26134 ?auto_26141 ) ( CLEAR ?auto_26134 ) ( not ( = ?auto_26133 ?auto_26141 ) ) ( not ( = ?auto_26134 ?auto_26141 ) ) ( not ( = ?auto_26138 ?auto_26141 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26139 ?auto_26134 ?auto_26141 ?auto_26140 )
      ( MAKE-2CRATE ?auto_26138 ?auto_26133 ?auto_26134 )
      ( MAKE-1CRATE-VERIFY ?auto_26133 ?auto_26134 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26142 - SURFACE
      ?auto_26143 - SURFACE
      ?auto_26144 - SURFACE
    )
    :vars
    (
      ?auto_26146 - HOIST
      ?auto_26145 - PLACE
      ?auto_26147 - TRUCK
      ?auto_26148 - PLACE
      ?auto_26149 - HOIST
      ?auto_26150 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26146 ?auto_26145 ) ( SURFACE-AT ?auto_26143 ?auto_26145 ) ( CLEAR ?auto_26143 ) ( IS-CRATE ?auto_26144 ) ( not ( = ?auto_26143 ?auto_26144 ) ) ( AVAILABLE ?auto_26146 ) ( ON ?auto_26143 ?auto_26142 ) ( not ( = ?auto_26142 ?auto_26143 ) ) ( not ( = ?auto_26142 ?auto_26144 ) ) ( TRUCK-AT ?auto_26147 ?auto_26148 ) ( not ( = ?auto_26148 ?auto_26145 ) ) ( HOIST-AT ?auto_26149 ?auto_26148 ) ( not ( = ?auto_26146 ?auto_26149 ) ) ( AVAILABLE ?auto_26149 ) ( SURFACE-AT ?auto_26144 ?auto_26148 ) ( ON ?auto_26144 ?auto_26150 ) ( CLEAR ?auto_26144 ) ( not ( = ?auto_26143 ?auto_26150 ) ) ( not ( = ?auto_26144 ?auto_26150 ) ) ( not ( = ?auto_26142 ?auto_26150 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26143 ?auto_26144 )
      ( MAKE-2CRATE-VERIFY ?auto_26142 ?auto_26143 ?auto_26144 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26151 - SURFACE
      ?auto_26152 - SURFACE
      ?auto_26153 - SURFACE
      ?auto_26154 - SURFACE
    )
    :vars
    (
      ?auto_26158 - HOIST
      ?auto_26157 - PLACE
      ?auto_26159 - TRUCK
      ?auto_26156 - PLACE
      ?auto_26155 - HOIST
      ?auto_26160 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26158 ?auto_26157 ) ( SURFACE-AT ?auto_26153 ?auto_26157 ) ( CLEAR ?auto_26153 ) ( IS-CRATE ?auto_26154 ) ( not ( = ?auto_26153 ?auto_26154 ) ) ( AVAILABLE ?auto_26158 ) ( ON ?auto_26153 ?auto_26152 ) ( not ( = ?auto_26152 ?auto_26153 ) ) ( not ( = ?auto_26152 ?auto_26154 ) ) ( TRUCK-AT ?auto_26159 ?auto_26156 ) ( not ( = ?auto_26156 ?auto_26157 ) ) ( HOIST-AT ?auto_26155 ?auto_26156 ) ( not ( = ?auto_26158 ?auto_26155 ) ) ( AVAILABLE ?auto_26155 ) ( SURFACE-AT ?auto_26154 ?auto_26156 ) ( ON ?auto_26154 ?auto_26160 ) ( CLEAR ?auto_26154 ) ( not ( = ?auto_26153 ?auto_26160 ) ) ( not ( = ?auto_26154 ?auto_26160 ) ) ( not ( = ?auto_26152 ?auto_26160 ) ) ( ON ?auto_26152 ?auto_26151 ) ( not ( = ?auto_26151 ?auto_26152 ) ) ( not ( = ?auto_26151 ?auto_26153 ) ) ( not ( = ?auto_26151 ?auto_26154 ) ) ( not ( = ?auto_26151 ?auto_26160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26152 ?auto_26153 ?auto_26154 )
      ( MAKE-3CRATE-VERIFY ?auto_26151 ?auto_26152 ?auto_26153 ?auto_26154 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26161 - SURFACE
      ?auto_26162 - SURFACE
      ?auto_26163 - SURFACE
      ?auto_26164 - SURFACE
      ?auto_26165 - SURFACE
    )
    :vars
    (
      ?auto_26169 - HOIST
      ?auto_26168 - PLACE
      ?auto_26170 - TRUCK
      ?auto_26167 - PLACE
      ?auto_26166 - HOIST
      ?auto_26171 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26169 ?auto_26168 ) ( SURFACE-AT ?auto_26164 ?auto_26168 ) ( CLEAR ?auto_26164 ) ( IS-CRATE ?auto_26165 ) ( not ( = ?auto_26164 ?auto_26165 ) ) ( AVAILABLE ?auto_26169 ) ( ON ?auto_26164 ?auto_26163 ) ( not ( = ?auto_26163 ?auto_26164 ) ) ( not ( = ?auto_26163 ?auto_26165 ) ) ( TRUCK-AT ?auto_26170 ?auto_26167 ) ( not ( = ?auto_26167 ?auto_26168 ) ) ( HOIST-AT ?auto_26166 ?auto_26167 ) ( not ( = ?auto_26169 ?auto_26166 ) ) ( AVAILABLE ?auto_26166 ) ( SURFACE-AT ?auto_26165 ?auto_26167 ) ( ON ?auto_26165 ?auto_26171 ) ( CLEAR ?auto_26165 ) ( not ( = ?auto_26164 ?auto_26171 ) ) ( not ( = ?auto_26165 ?auto_26171 ) ) ( not ( = ?auto_26163 ?auto_26171 ) ) ( ON ?auto_26162 ?auto_26161 ) ( ON ?auto_26163 ?auto_26162 ) ( not ( = ?auto_26161 ?auto_26162 ) ) ( not ( = ?auto_26161 ?auto_26163 ) ) ( not ( = ?auto_26161 ?auto_26164 ) ) ( not ( = ?auto_26161 ?auto_26165 ) ) ( not ( = ?auto_26161 ?auto_26171 ) ) ( not ( = ?auto_26162 ?auto_26163 ) ) ( not ( = ?auto_26162 ?auto_26164 ) ) ( not ( = ?auto_26162 ?auto_26165 ) ) ( not ( = ?auto_26162 ?auto_26171 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26163 ?auto_26164 ?auto_26165 )
      ( MAKE-4CRATE-VERIFY ?auto_26161 ?auto_26162 ?auto_26163 ?auto_26164 ?auto_26165 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26172 - SURFACE
      ?auto_26173 - SURFACE
      ?auto_26174 - SURFACE
      ?auto_26175 - SURFACE
      ?auto_26176 - SURFACE
      ?auto_26177 - SURFACE
    )
    :vars
    (
      ?auto_26181 - HOIST
      ?auto_26180 - PLACE
      ?auto_26182 - TRUCK
      ?auto_26179 - PLACE
      ?auto_26178 - HOIST
      ?auto_26183 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26181 ?auto_26180 ) ( SURFACE-AT ?auto_26176 ?auto_26180 ) ( CLEAR ?auto_26176 ) ( IS-CRATE ?auto_26177 ) ( not ( = ?auto_26176 ?auto_26177 ) ) ( AVAILABLE ?auto_26181 ) ( ON ?auto_26176 ?auto_26175 ) ( not ( = ?auto_26175 ?auto_26176 ) ) ( not ( = ?auto_26175 ?auto_26177 ) ) ( TRUCK-AT ?auto_26182 ?auto_26179 ) ( not ( = ?auto_26179 ?auto_26180 ) ) ( HOIST-AT ?auto_26178 ?auto_26179 ) ( not ( = ?auto_26181 ?auto_26178 ) ) ( AVAILABLE ?auto_26178 ) ( SURFACE-AT ?auto_26177 ?auto_26179 ) ( ON ?auto_26177 ?auto_26183 ) ( CLEAR ?auto_26177 ) ( not ( = ?auto_26176 ?auto_26183 ) ) ( not ( = ?auto_26177 ?auto_26183 ) ) ( not ( = ?auto_26175 ?auto_26183 ) ) ( ON ?auto_26173 ?auto_26172 ) ( ON ?auto_26174 ?auto_26173 ) ( ON ?auto_26175 ?auto_26174 ) ( not ( = ?auto_26172 ?auto_26173 ) ) ( not ( = ?auto_26172 ?auto_26174 ) ) ( not ( = ?auto_26172 ?auto_26175 ) ) ( not ( = ?auto_26172 ?auto_26176 ) ) ( not ( = ?auto_26172 ?auto_26177 ) ) ( not ( = ?auto_26172 ?auto_26183 ) ) ( not ( = ?auto_26173 ?auto_26174 ) ) ( not ( = ?auto_26173 ?auto_26175 ) ) ( not ( = ?auto_26173 ?auto_26176 ) ) ( not ( = ?auto_26173 ?auto_26177 ) ) ( not ( = ?auto_26173 ?auto_26183 ) ) ( not ( = ?auto_26174 ?auto_26175 ) ) ( not ( = ?auto_26174 ?auto_26176 ) ) ( not ( = ?auto_26174 ?auto_26177 ) ) ( not ( = ?auto_26174 ?auto_26183 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26175 ?auto_26176 ?auto_26177 )
      ( MAKE-5CRATE-VERIFY ?auto_26172 ?auto_26173 ?auto_26174 ?auto_26175 ?auto_26176 ?auto_26177 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26184 - SURFACE
      ?auto_26185 - SURFACE
    )
    :vars
    (
      ?auto_26190 - HOIST
      ?auto_26189 - PLACE
      ?auto_26186 - SURFACE
      ?auto_26188 - PLACE
      ?auto_26187 - HOIST
      ?auto_26192 - SURFACE
      ?auto_26191 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26190 ?auto_26189 ) ( SURFACE-AT ?auto_26184 ?auto_26189 ) ( CLEAR ?auto_26184 ) ( IS-CRATE ?auto_26185 ) ( not ( = ?auto_26184 ?auto_26185 ) ) ( AVAILABLE ?auto_26190 ) ( ON ?auto_26184 ?auto_26186 ) ( not ( = ?auto_26186 ?auto_26184 ) ) ( not ( = ?auto_26186 ?auto_26185 ) ) ( not ( = ?auto_26188 ?auto_26189 ) ) ( HOIST-AT ?auto_26187 ?auto_26188 ) ( not ( = ?auto_26190 ?auto_26187 ) ) ( AVAILABLE ?auto_26187 ) ( SURFACE-AT ?auto_26185 ?auto_26188 ) ( ON ?auto_26185 ?auto_26192 ) ( CLEAR ?auto_26185 ) ( not ( = ?auto_26184 ?auto_26192 ) ) ( not ( = ?auto_26185 ?auto_26192 ) ) ( not ( = ?auto_26186 ?auto_26192 ) ) ( TRUCK-AT ?auto_26191 ?auto_26189 ) )
    :subtasks
    ( ( !DRIVE ?auto_26191 ?auto_26189 ?auto_26188 )
      ( MAKE-2CRATE ?auto_26186 ?auto_26184 ?auto_26185 )
      ( MAKE-1CRATE-VERIFY ?auto_26184 ?auto_26185 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26193 - SURFACE
      ?auto_26194 - SURFACE
      ?auto_26195 - SURFACE
    )
    :vars
    (
      ?auto_26201 - HOIST
      ?auto_26199 - PLACE
      ?auto_26200 - PLACE
      ?auto_26197 - HOIST
      ?auto_26198 - SURFACE
      ?auto_26196 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26201 ?auto_26199 ) ( SURFACE-AT ?auto_26194 ?auto_26199 ) ( CLEAR ?auto_26194 ) ( IS-CRATE ?auto_26195 ) ( not ( = ?auto_26194 ?auto_26195 ) ) ( AVAILABLE ?auto_26201 ) ( ON ?auto_26194 ?auto_26193 ) ( not ( = ?auto_26193 ?auto_26194 ) ) ( not ( = ?auto_26193 ?auto_26195 ) ) ( not ( = ?auto_26200 ?auto_26199 ) ) ( HOIST-AT ?auto_26197 ?auto_26200 ) ( not ( = ?auto_26201 ?auto_26197 ) ) ( AVAILABLE ?auto_26197 ) ( SURFACE-AT ?auto_26195 ?auto_26200 ) ( ON ?auto_26195 ?auto_26198 ) ( CLEAR ?auto_26195 ) ( not ( = ?auto_26194 ?auto_26198 ) ) ( not ( = ?auto_26195 ?auto_26198 ) ) ( not ( = ?auto_26193 ?auto_26198 ) ) ( TRUCK-AT ?auto_26196 ?auto_26199 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26194 ?auto_26195 )
      ( MAKE-2CRATE-VERIFY ?auto_26193 ?auto_26194 ?auto_26195 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26202 - SURFACE
      ?auto_26203 - SURFACE
      ?auto_26204 - SURFACE
      ?auto_26205 - SURFACE
    )
    :vars
    (
      ?auto_26208 - HOIST
      ?auto_26209 - PLACE
      ?auto_26211 - PLACE
      ?auto_26210 - HOIST
      ?auto_26207 - SURFACE
      ?auto_26206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26208 ?auto_26209 ) ( SURFACE-AT ?auto_26204 ?auto_26209 ) ( CLEAR ?auto_26204 ) ( IS-CRATE ?auto_26205 ) ( not ( = ?auto_26204 ?auto_26205 ) ) ( AVAILABLE ?auto_26208 ) ( ON ?auto_26204 ?auto_26203 ) ( not ( = ?auto_26203 ?auto_26204 ) ) ( not ( = ?auto_26203 ?auto_26205 ) ) ( not ( = ?auto_26211 ?auto_26209 ) ) ( HOIST-AT ?auto_26210 ?auto_26211 ) ( not ( = ?auto_26208 ?auto_26210 ) ) ( AVAILABLE ?auto_26210 ) ( SURFACE-AT ?auto_26205 ?auto_26211 ) ( ON ?auto_26205 ?auto_26207 ) ( CLEAR ?auto_26205 ) ( not ( = ?auto_26204 ?auto_26207 ) ) ( not ( = ?auto_26205 ?auto_26207 ) ) ( not ( = ?auto_26203 ?auto_26207 ) ) ( TRUCK-AT ?auto_26206 ?auto_26209 ) ( ON ?auto_26203 ?auto_26202 ) ( not ( = ?auto_26202 ?auto_26203 ) ) ( not ( = ?auto_26202 ?auto_26204 ) ) ( not ( = ?auto_26202 ?auto_26205 ) ) ( not ( = ?auto_26202 ?auto_26207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26203 ?auto_26204 ?auto_26205 )
      ( MAKE-3CRATE-VERIFY ?auto_26202 ?auto_26203 ?auto_26204 ?auto_26205 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26212 - SURFACE
      ?auto_26213 - SURFACE
      ?auto_26214 - SURFACE
      ?auto_26215 - SURFACE
      ?auto_26216 - SURFACE
    )
    :vars
    (
      ?auto_26219 - HOIST
      ?auto_26220 - PLACE
      ?auto_26222 - PLACE
      ?auto_26221 - HOIST
      ?auto_26218 - SURFACE
      ?auto_26217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26219 ?auto_26220 ) ( SURFACE-AT ?auto_26215 ?auto_26220 ) ( CLEAR ?auto_26215 ) ( IS-CRATE ?auto_26216 ) ( not ( = ?auto_26215 ?auto_26216 ) ) ( AVAILABLE ?auto_26219 ) ( ON ?auto_26215 ?auto_26214 ) ( not ( = ?auto_26214 ?auto_26215 ) ) ( not ( = ?auto_26214 ?auto_26216 ) ) ( not ( = ?auto_26222 ?auto_26220 ) ) ( HOIST-AT ?auto_26221 ?auto_26222 ) ( not ( = ?auto_26219 ?auto_26221 ) ) ( AVAILABLE ?auto_26221 ) ( SURFACE-AT ?auto_26216 ?auto_26222 ) ( ON ?auto_26216 ?auto_26218 ) ( CLEAR ?auto_26216 ) ( not ( = ?auto_26215 ?auto_26218 ) ) ( not ( = ?auto_26216 ?auto_26218 ) ) ( not ( = ?auto_26214 ?auto_26218 ) ) ( TRUCK-AT ?auto_26217 ?auto_26220 ) ( ON ?auto_26213 ?auto_26212 ) ( ON ?auto_26214 ?auto_26213 ) ( not ( = ?auto_26212 ?auto_26213 ) ) ( not ( = ?auto_26212 ?auto_26214 ) ) ( not ( = ?auto_26212 ?auto_26215 ) ) ( not ( = ?auto_26212 ?auto_26216 ) ) ( not ( = ?auto_26212 ?auto_26218 ) ) ( not ( = ?auto_26213 ?auto_26214 ) ) ( not ( = ?auto_26213 ?auto_26215 ) ) ( not ( = ?auto_26213 ?auto_26216 ) ) ( not ( = ?auto_26213 ?auto_26218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26214 ?auto_26215 ?auto_26216 )
      ( MAKE-4CRATE-VERIFY ?auto_26212 ?auto_26213 ?auto_26214 ?auto_26215 ?auto_26216 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26223 - SURFACE
      ?auto_26224 - SURFACE
      ?auto_26225 - SURFACE
      ?auto_26226 - SURFACE
      ?auto_26227 - SURFACE
      ?auto_26228 - SURFACE
    )
    :vars
    (
      ?auto_26231 - HOIST
      ?auto_26232 - PLACE
      ?auto_26234 - PLACE
      ?auto_26233 - HOIST
      ?auto_26230 - SURFACE
      ?auto_26229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26231 ?auto_26232 ) ( SURFACE-AT ?auto_26227 ?auto_26232 ) ( CLEAR ?auto_26227 ) ( IS-CRATE ?auto_26228 ) ( not ( = ?auto_26227 ?auto_26228 ) ) ( AVAILABLE ?auto_26231 ) ( ON ?auto_26227 ?auto_26226 ) ( not ( = ?auto_26226 ?auto_26227 ) ) ( not ( = ?auto_26226 ?auto_26228 ) ) ( not ( = ?auto_26234 ?auto_26232 ) ) ( HOIST-AT ?auto_26233 ?auto_26234 ) ( not ( = ?auto_26231 ?auto_26233 ) ) ( AVAILABLE ?auto_26233 ) ( SURFACE-AT ?auto_26228 ?auto_26234 ) ( ON ?auto_26228 ?auto_26230 ) ( CLEAR ?auto_26228 ) ( not ( = ?auto_26227 ?auto_26230 ) ) ( not ( = ?auto_26228 ?auto_26230 ) ) ( not ( = ?auto_26226 ?auto_26230 ) ) ( TRUCK-AT ?auto_26229 ?auto_26232 ) ( ON ?auto_26224 ?auto_26223 ) ( ON ?auto_26225 ?auto_26224 ) ( ON ?auto_26226 ?auto_26225 ) ( not ( = ?auto_26223 ?auto_26224 ) ) ( not ( = ?auto_26223 ?auto_26225 ) ) ( not ( = ?auto_26223 ?auto_26226 ) ) ( not ( = ?auto_26223 ?auto_26227 ) ) ( not ( = ?auto_26223 ?auto_26228 ) ) ( not ( = ?auto_26223 ?auto_26230 ) ) ( not ( = ?auto_26224 ?auto_26225 ) ) ( not ( = ?auto_26224 ?auto_26226 ) ) ( not ( = ?auto_26224 ?auto_26227 ) ) ( not ( = ?auto_26224 ?auto_26228 ) ) ( not ( = ?auto_26224 ?auto_26230 ) ) ( not ( = ?auto_26225 ?auto_26226 ) ) ( not ( = ?auto_26225 ?auto_26227 ) ) ( not ( = ?auto_26225 ?auto_26228 ) ) ( not ( = ?auto_26225 ?auto_26230 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26226 ?auto_26227 ?auto_26228 )
      ( MAKE-5CRATE-VERIFY ?auto_26223 ?auto_26224 ?auto_26225 ?auto_26226 ?auto_26227 ?auto_26228 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26235 - SURFACE
      ?auto_26236 - SURFACE
    )
    :vars
    (
      ?auto_26240 - HOIST
      ?auto_26241 - PLACE
      ?auto_26239 - SURFACE
      ?auto_26243 - PLACE
      ?auto_26242 - HOIST
      ?auto_26238 - SURFACE
      ?auto_26237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26240 ?auto_26241 ) ( IS-CRATE ?auto_26236 ) ( not ( = ?auto_26235 ?auto_26236 ) ) ( not ( = ?auto_26239 ?auto_26235 ) ) ( not ( = ?auto_26239 ?auto_26236 ) ) ( not ( = ?auto_26243 ?auto_26241 ) ) ( HOIST-AT ?auto_26242 ?auto_26243 ) ( not ( = ?auto_26240 ?auto_26242 ) ) ( AVAILABLE ?auto_26242 ) ( SURFACE-AT ?auto_26236 ?auto_26243 ) ( ON ?auto_26236 ?auto_26238 ) ( CLEAR ?auto_26236 ) ( not ( = ?auto_26235 ?auto_26238 ) ) ( not ( = ?auto_26236 ?auto_26238 ) ) ( not ( = ?auto_26239 ?auto_26238 ) ) ( TRUCK-AT ?auto_26237 ?auto_26241 ) ( SURFACE-AT ?auto_26239 ?auto_26241 ) ( CLEAR ?auto_26239 ) ( LIFTING ?auto_26240 ?auto_26235 ) ( IS-CRATE ?auto_26235 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26239 ?auto_26235 )
      ( MAKE-2CRATE ?auto_26239 ?auto_26235 ?auto_26236 )
      ( MAKE-1CRATE-VERIFY ?auto_26235 ?auto_26236 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26244 - SURFACE
      ?auto_26245 - SURFACE
      ?auto_26246 - SURFACE
    )
    :vars
    (
      ?auto_26247 - HOIST
      ?auto_26252 - PLACE
      ?auto_26251 - PLACE
      ?auto_26249 - HOIST
      ?auto_26250 - SURFACE
      ?auto_26248 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26247 ?auto_26252 ) ( IS-CRATE ?auto_26246 ) ( not ( = ?auto_26245 ?auto_26246 ) ) ( not ( = ?auto_26244 ?auto_26245 ) ) ( not ( = ?auto_26244 ?auto_26246 ) ) ( not ( = ?auto_26251 ?auto_26252 ) ) ( HOIST-AT ?auto_26249 ?auto_26251 ) ( not ( = ?auto_26247 ?auto_26249 ) ) ( AVAILABLE ?auto_26249 ) ( SURFACE-AT ?auto_26246 ?auto_26251 ) ( ON ?auto_26246 ?auto_26250 ) ( CLEAR ?auto_26246 ) ( not ( = ?auto_26245 ?auto_26250 ) ) ( not ( = ?auto_26246 ?auto_26250 ) ) ( not ( = ?auto_26244 ?auto_26250 ) ) ( TRUCK-AT ?auto_26248 ?auto_26252 ) ( SURFACE-AT ?auto_26244 ?auto_26252 ) ( CLEAR ?auto_26244 ) ( LIFTING ?auto_26247 ?auto_26245 ) ( IS-CRATE ?auto_26245 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26245 ?auto_26246 )
      ( MAKE-2CRATE-VERIFY ?auto_26244 ?auto_26245 ?auto_26246 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26253 - SURFACE
      ?auto_26254 - SURFACE
      ?auto_26255 - SURFACE
      ?auto_26256 - SURFACE
    )
    :vars
    (
      ?auto_26258 - HOIST
      ?auto_26259 - PLACE
      ?auto_26262 - PLACE
      ?auto_26261 - HOIST
      ?auto_26260 - SURFACE
      ?auto_26257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26258 ?auto_26259 ) ( IS-CRATE ?auto_26256 ) ( not ( = ?auto_26255 ?auto_26256 ) ) ( not ( = ?auto_26254 ?auto_26255 ) ) ( not ( = ?auto_26254 ?auto_26256 ) ) ( not ( = ?auto_26262 ?auto_26259 ) ) ( HOIST-AT ?auto_26261 ?auto_26262 ) ( not ( = ?auto_26258 ?auto_26261 ) ) ( AVAILABLE ?auto_26261 ) ( SURFACE-AT ?auto_26256 ?auto_26262 ) ( ON ?auto_26256 ?auto_26260 ) ( CLEAR ?auto_26256 ) ( not ( = ?auto_26255 ?auto_26260 ) ) ( not ( = ?auto_26256 ?auto_26260 ) ) ( not ( = ?auto_26254 ?auto_26260 ) ) ( TRUCK-AT ?auto_26257 ?auto_26259 ) ( SURFACE-AT ?auto_26254 ?auto_26259 ) ( CLEAR ?auto_26254 ) ( LIFTING ?auto_26258 ?auto_26255 ) ( IS-CRATE ?auto_26255 ) ( ON ?auto_26254 ?auto_26253 ) ( not ( = ?auto_26253 ?auto_26254 ) ) ( not ( = ?auto_26253 ?auto_26255 ) ) ( not ( = ?auto_26253 ?auto_26256 ) ) ( not ( = ?auto_26253 ?auto_26260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26254 ?auto_26255 ?auto_26256 )
      ( MAKE-3CRATE-VERIFY ?auto_26253 ?auto_26254 ?auto_26255 ?auto_26256 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26263 - SURFACE
      ?auto_26264 - SURFACE
      ?auto_26265 - SURFACE
      ?auto_26266 - SURFACE
      ?auto_26267 - SURFACE
    )
    :vars
    (
      ?auto_26269 - HOIST
      ?auto_26270 - PLACE
      ?auto_26273 - PLACE
      ?auto_26272 - HOIST
      ?auto_26271 - SURFACE
      ?auto_26268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26269 ?auto_26270 ) ( IS-CRATE ?auto_26267 ) ( not ( = ?auto_26266 ?auto_26267 ) ) ( not ( = ?auto_26265 ?auto_26266 ) ) ( not ( = ?auto_26265 ?auto_26267 ) ) ( not ( = ?auto_26273 ?auto_26270 ) ) ( HOIST-AT ?auto_26272 ?auto_26273 ) ( not ( = ?auto_26269 ?auto_26272 ) ) ( AVAILABLE ?auto_26272 ) ( SURFACE-AT ?auto_26267 ?auto_26273 ) ( ON ?auto_26267 ?auto_26271 ) ( CLEAR ?auto_26267 ) ( not ( = ?auto_26266 ?auto_26271 ) ) ( not ( = ?auto_26267 ?auto_26271 ) ) ( not ( = ?auto_26265 ?auto_26271 ) ) ( TRUCK-AT ?auto_26268 ?auto_26270 ) ( SURFACE-AT ?auto_26265 ?auto_26270 ) ( CLEAR ?auto_26265 ) ( LIFTING ?auto_26269 ?auto_26266 ) ( IS-CRATE ?auto_26266 ) ( ON ?auto_26264 ?auto_26263 ) ( ON ?auto_26265 ?auto_26264 ) ( not ( = ?auto_26263 ?auto_26264 ) ) ( not ( = ?auto_26263 ?auto_26265 ) ) ( not ( = ?auto_26263 ?auto_26266 ) ) ( not ( = ?auto_26263 ?auto_26267 ) ) ( not ( = ?auto_26263 ?auto_26271 ) ) ( not ( = ?auto_26264 ?auto_26265 ) ) ( not ( = ?auto_26264 ?auto_26266 ) ) ( not ( = ?auto_26264 ?auto_26267 ) ) ( not ( = ?auto_26264 ?auto_26271 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26265 ?auto_26266 ?auto_26267 )
      ( MAKE-4CRATE-VERIFY ?auto_26263 ?auto_26264 ?auto_26265 ?auto_26266 ?auto_26267 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26274 - SURFACE
      ?auto_26275 - SURFACE
      ?auto_26276 - SURFACE
      ?auto_26277 - SURFACE
      ?auto_26278 - SURFACE
      ?auto_26279 - SURFACE
    )
    :vars
    (
      ?auto_26281 - HOIST
      ?auto_26282 - PLACE
      ?auto_26285 - PLACE
      ?auto_26284 - HOIST
      ?auto_26283 - SURFACE
      ?auto_26280 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26281 ?auto_26282 ) ( IS-CRATE ?auto_26279 ) ( not ( = ?auto_26278 ?auto_26279 ) ) ( not ( = ?auto_26277 ?auto_26278 ) ) ( not ( = ?auto_26277 ?auto_26279 ) ) ( not ( = ?auto_26285 ?auto_26282 ) ) ( HOIST-AT ?auto_26284 ?auto_26285 ) ( not ( = ?auto_26281 ?auto_26284 ) ) ( AVAILABLE ?auto_26284 ) ( SURFACE-AT ?auto_26279 ?auto_26285 ) ( ON ?auto_26279 ?auto_26283 ) ( CLEAR ?auto_26279 ) ( not ( = ?auto_26278 ?auto_26283 ) ) ( not ( = ?auto_26279 ?auto_26283 ) ) ( not ( = ?auto_26277 ?auto_26283 ) ) ( TRUCK-AT ?auto_26280 ?auto_26282 ) ( SURFACE-AT ?auto_26277 ?auto_26282 ) ( CLEAR ?auto_26277 ) ( LIFTING ?auto_26281 ?auto_26278 ) ( IS-CRATE ?auto_26278 ) ( ON ?auto_26275 ?auto_26274 ) ( ON ?auto_26276 ?auto_26275 ) ( ON ?auto_26277 ?auto_26276 ) ( not ( = ?auto_26274 ?auto_26275 ) ) ( not ( = ?auto_26274 ?auto_26276 ) ) ( not ( = ?auto_26274 ?auto_26277 ) ) ( not ( = ?auto_26274 ?auto_26278 ) ) ( not ( = ?auto_26274 ?auto_26279 ) ) ( not ( = ?auto_26274 ?auto_26283 ) ) ( not ( = ?auto_26275 ?auto_26276 ) ) ( not ( = ?auto_26275 ?auto_26277 ) ) ( not ( = ?auto_26275 ?auto_26278 ) ) ( not ( = ?auto_26275 ?auto_26279 ) ) ( not ( = ?auto_26275 ?auto_26283 ) ) ( not ( = ?auto_26276 ?auto_26277 ) ) ( not ( = ?auto_26276 ?auto_26278 ) ) ( not ( = ?auto_26276 ?auto_26279 ) ) ( not ( = ?auto_26276 ?auto_26283 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26277 ?auto_26278 ?auto_26279 )
      ( MAKE-5CRATE-VERIFY ?auto_26274 ?auto_26275 ?auto_26276 ?auto_26277 ?auto_26278 ?auto_26279 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26286 - SURFACE
      ?auto_26287 - SURFACE
    )
    :vars
    (
      ?auto_26289 - HOIST
      ?auto_26290 - PLACE
      ?auto_26294 - SURFACE
      ?auto_26293 - PLACE
      ?auto_26292 - HOIST
      ?auto_26291 - SURFACE
      ?auto_26288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26289 ?auto_26290 ) ( IS-CRATE ?auto_26287 ) ( not ( = ?auto_26286 ?auto_26287 ) ) ( not ( = ?auto_26294 ?auto_26286 ) ) ( not ( = ?auto_26294 ?auto_26287 ) ) ( not ( = ?auto_26293 ?auto_26290 ) ) ( HOIST-AT ?auto_26292 ?auto_26293 ) ( not ( = ?auto_26289 ?auto_26292 ) ) ( AVAILABLE ?auto_26292 ) ( SURFACE-AT ?auto_26287 ?auto_26293 ) ( ON ?auto_26287 ?auto_26291 ) ( CLEAR ?auto_26287 ) ( not ( = ?auto_26286 ?auto_26291 ) ) ( not ( = ?auto_26287 ?auto_26291 ) ) ( not ( = ?auto_26294 ?auto_26291 ) ) ( TRUCK-AT ?auto_26288 ?auto_26290 ) ( SURFACE-AT ?auto_26294 ?auto_26290 ) ( CLEAR ?auto_26294 ) ( IS-CRATE ?auto_26286 ) ( AVAILABLE ?auto_26289 ) ( IN ?auto_26286 ?auto_26288 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26289 ?auto_26286 ?auto_26288 ?auto_26290 )
      ( MAKE-2CRATE ?auto_26294 ?auto_26286 ?auto_26287 )
      ( MAKE-1CRATE-VERIFY ?auto_26286 ?auto_26287 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26295 - SURFACE
      ?auto_26296 - SURFACE
      ?auto_26297 - SURFACE
    )
    :vars
    (
      ?auto_26299 - HOIST
      ?auto_26302 - PLACE
      ?auto_26298 - PLACE
      ?auto_26300 - HOIST
      ?auto_26303 - SURFACE
      ?auto_26301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26299 ?auto_26302 ) ( IS-CRATE ?auto_26297 ) ( not ( = ?auto_26296 ?auto_26297 ) ) ( not ( = ?auto_26295 ?auto_26296 ) ) ( not ( = ?auto_26295 ?auto_26297 ) ) ( not ( = ?auto_26298 ?auto_26302 ) ) ( HOIST-AT ?auto_26300 ?auto_26298 ) ( not ( = ?auto_26299 ?auto_26300 ) ) ( AVAILABLE ?auto_26300 ) ( SURFACE-AT ?auto_26297 ?auto_26298 ) ( ON ?auto_26297 ?auto_26303 ) ( CLEAR ?auto_26297 ) ( not ( = ?auto_26296 ?auto_26303 ) ) ( not ( = ?auto_26297 ?auto_26303 ) ) ( not ( = ?auto_26295 ?auto_26303 ) ) ( TRUCK-AT ?auto_26301 ?auto_26302 ) ( SURFACE-AT ?auto_26295 ?auto_26302 ) ( CLEAR ?auto_26295 ) ( IS-CRATE ?auto_26296 ) ( AVAILABLE ?auto_26299 ) ( IN ?auto_26296 ?auto_26301 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26296 ?auto_26297 )
      ( MAKE-2CRATE-VERIFY ?auto_26295 ?auto_26296 ?auto_26297 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26304 - SURFACE
      ?auto_26305 - SURFACE
      ?auto_26306 - SURFACE
      ?auto_26307 - SURFACE
    )
    :vars
    (
      ?auto_26308 - HOIST
      ?auto_26311 - PLACE
      ?auto_26309 - PLACE
      ?auto_26313 - HOIST
      ?auto_26310 - SURFACE
      ?auto_26312 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26308 ?auto_26311 ) ( IS-CRATE ?auto_26307 ) ( not ( = ?auto_26306 ?auto_26307 ) ) ( not ( = ?auto_26305 ?auto_26306 ) ) ( not ( = ?auto_26305 ?auto_26307 ) ) ( not ( = ?auto_26309 ?auto_26311 ) ) ( HOIST-AT ?auto_26313 ?auto_26309 ) ( not ( = ?auto_26308 ?auto_26313 ) ) ( AVAILABLE ?auto_26313 ) ( SURFACE-AT ?auto_26307 ?auto_26309 ) ( ON ?auto_26307 ?auto_26310 ) ( CLEAR ?auto_26307 ) ( not ( = ?auto_26306 ?auto_26310 ) ) ( not ( = ?auto_26307 ?auto_26310 ) ) ( not ( = ?auto_26305 ?auto_26310 ) ) ( TRUCK-AT ?auto_26312 ?auto_26311 ) ( SURFACE-AT ?auto_26305 ?auto_26311 ) ( CLEAR ?auto_26305 ) ( IS-CRATE ?auto_26306 ) ( AVAILABLE ?auto_26308 ) ( IN ?auto_26306 ?auto_26312 ) ( ON ?auto_26305 ?auto_26304 ) ( not ( = ?auto_26304 ?auto_26305 ) ) ( not ( = ?auto_26304 ?auto_26306 ) ) ( not ( = ?auto_26304 ?auto_26307 ) ) ( not ( = ?auto_26304 ?auto_26310 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26305 ?auto_26306 ?auto_26307 )
      ( MAKE-3CRATE-VERIFY ?auto_26304 ?auto_26305 ?auto_26306 ?auto_26307 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26314 - SURFACE
      ?auto_26315 - SURFACE
      ?auto_26316 - SURFACE
      ?auto_26317 - SURFACE
      ?auto_26318 - SURFACE
    )
    :vars
    (
      ?auto_26319 - HOIST
      ?auto_26322 - PLACE
      ?auto_26320 - PLACE
      ?auto_26324 - HOIST
      ?auto_26321 - SURFACE
      ?auto_26323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26319 ?auto_26322 ) ( IS-CRATE ?auto_26318 ) ( not ( = ?auto_26317 ?auto_26318 ) ) ( not ( = ?auto_26316 ?auto_26317 ) ) ( not ( = ?auto_26316 ?auto_26318 ) ) ( not ( = ?auto_26320 ?auto_26322 ) ) ( HOIST-AT ?auto_26324 ?auto_26320 ) ( not ( = ?auto_26319 ?auto_26324 ) ) ( AVAILABLE ?auto_26324 ) ( SURFACE-AT ?auto_26318 ?auto_26320 ) ( ON ?auto_26318 ?auto_26321 ) ( CLEAR ?auto_26318 ) ( not ( = ?auto_26317 ?auto_26321 ) ) ( not ( = ?auto_26318 ?auto_26321 ) ) ( not ( = ?auto_26316 ?auto_26321 ) ) ( TRUCK-AT ?auto_26323 ?auto_26322 ) ( SURFACE-AT ?auto_26316 ?auto_26322 ) ( CLEAR ?auto_26316 ) ( IS-CRATE ?auto_26317 ) ( AVAILABLE ?auto_26319 ) ( IN ?auto_26317 ?auto_26323 ) ( ON ?auto_26315 ?auto_26314 ) ( ON ?auto_26316 ?auto_26315 ) ( not ( = ?auto_26314 ?auto_26315 ) ) ( not ( = ?auto_26314 ?auto_26316 ) ) ( not ( = ?auto_26314 ?auto_26317 ) ) ( not ( = ?auto_26314 ?auto_26318 ) ) ( not ( = ?auto_26314 ?auto_26321 ) ) ( not ( = ?auto_26315 ?auto_26316 ) ) ( not ( = ?auto_26315 ?auto_26317 ) ) ( not ( = ?auto_26315 ?auto_26318 ) ) ( not ( = ?auto_26315 ?auto_26321 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26316 ?auto_26317 ?auto_26318 )
      ( MAKE-4CRATE-VERIFY ?auto_26314 ?auto_26315 ?auto_26316 ?auto_26317 ?auto_26318 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26325 - SURFACE
      ?auto_26326 - SURFACE
      ?auto_26327 - SURFACE
      ?auto_26328 - SURFACE
      ?auto_26329 - SURFACE
      ?auto_26330 - SURFACE
    )
    :vars
    (
      ?auto_26331 - HOIST
      ?auto_26334 - PLACE
      ?auto_26332 - PLACE
      ?auto_26336 - HOIST
      ?auto_26333 - SURFACE
      ?auto_26335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26331 ?auto_26334 ) ( IS-CRATE ?auto_26330 ) ( not ( = ?auto_26329 ?auto_26330 ) ) ( not ( = ?auto_26328 ?auto_26329 ) ) ( not ( = ?auto_26328 ?auto_26330 ) ) ( not ( = ?auto_26332 ?auto_26334 ) ) ( HOIST-AT ?auto_26336 ?auto_26332 ) ( not ( = ?auto_26331 ?auto_26336 ) ) ( AVAILABLE ?auto_26336 ) ( SURFACE-AT ?auto_26330 ?auto_26332 ) ( ON ?auto_26330 ?auto_26333 ) ( CLEAR ?auto_26330 ) ( not ( = ?auto_26329 ?auto_26333 ) ) ( not ( = ?auto_26330 ?auto_26333 ) ) ( not ( = ?auto_26328 ?auto_26333 ) ) ( TRUCK-AT ?auto_26335 ?auto_26334 ) ( SURFACE-AT ?auto_26328 ?auto_26334 ) ( CLEAR ?auto_26328 ) ( IS-CRATE ?auto_26329 ) ( AVAILABLE ?auto_26331 ) ( IN ?auto_26329 ?auto_26335 ) ( ON ?auto_26326 ?auto_26325 ) ( ON ?auto_26327 ?auto_26326 ) ( ON ?auto_26328 ?auto_26327 ) ( not ( = ?auto_26325 ?auto_26326 ) ) ( not ( = ?auto_26325 ?auto_26327 ) ) ( not ( = ?auto_26325 ?auto_26328 ) ) ( not ( = ?auto_26325 ?auto_26329 ) ) ( not ( = ?auto_26325 ?auto_26330 ) ) ( not ( = ?auto_26325 ?auto_26333 ) ) ( not ( = ?auto_26326 ?auto_26327 ) ) ( not ( = ?auto_26326 ?auto_26328 ) ) ( not ( = ?auto_26326 ?auto_26329 ) ) ( not ( = ?auto_26326 ?auto_26330 ) ) ( not ( = ?auto_26326 ?auto_26333 ) ) ( not ( = ?auto_26327 ?auto_26328 ) ) ( not ( = ?auto_26327 ?auto_26329 ) ) ( not ( = ?auto_26327 ?auto_26330 ) ) ( not ( = ?auto_26327 ?auto_26333 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26328 ?auto_26329 ?auto_26330 )
      ( MAKE-5CRATE-VERIFY ?auto_26325 ?auto_26326 ?auto_26327 ?auto_26328 ?auto_26329 ?auto_26330 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26337 - SURFACE
      ?auto_26338 - SURFACE
    )
    :vars
    (
      ?auto_26339 - HOIST
      ?auto_26342 - PLACE
      ?auto_26345 - SURFACE
      ?auto_26340 - PLACE
      ?auto_26344 - HOIST
      ?auto_26341 - SURFACE
      ?auto_26343 - TRUCK
      ?auto_26346 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26339 ?auto_26342 ) ( IS-CRATE ?auto_26338 ) ( not ( = ?auto_26337 ?auto_26338 ) ) ( not ( = ?auto_26345 ?auto_26337 ) ) ( not ( = ?auto_26345 ?auto_26338 ) ) ( not ( = ?auto_26340 ?auto_26342 ) ) ( HOIST-AT ?auto_26344 ?auto_26340 ) ( not ( = ?auto_26339 ?auto_26344 ) ) ( AVAILABLE ?auto_26344 ) ( SURFACE-AT ?auto_26338 ?auto_26340 ) ( ON ?auto_26338 ?auto_26341 ) ( CLEAR ?auto_26338 ) ( not ( = ?auto_26337 ?auto_26341 ) ) ( not ( = ?auto_26338 ?auto_26341 ) ) ( not ( = ?auto_26345 ?auto_26341 ) ) ( SURFACE-AT ?auto_26345 ?auto_26342 ) ( CLEAR ?auto_26345 ) ( IS-CRATE ?auto_26337 ) ( AVAILABLE ?auto_26339 ) ( IN ?auto_26337 ?auto_26343 ) ( TRUCK-AT ?auto_26343 ?auto_26346 ) ( not ( = ?auto_26346 ?auto_26342 ) ) ( not ( = ?auto_26340 ?auto_26346 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26343 ?auto_26346 ?auto_26342 )
      ( MAKE-2CRATE ?auto_26345 ?auto_26337 ?auto_26338 )
      ( MAKE-1CRATE-VERIFY ?auto_26337 ?auto_26338 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26347 - SURFACE
      ?auto_26348 - SURFACE
      ?auto_26349 - SURFACE
    )
    :vars
    (
      ?auto_26354 - HOIST
      ?auto_26355 - PLACE
      ?auto_26353 - PLACE
      ?auto_26356 - HOIST
      ?auto_26352 - SURFACE
      ?auto_26351 - TRUCK
      ?auto_26350 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26354 ?auto_26355 ) ( IS-CRATE ?auto_26349 ) ( not ( = ?auto_26348 ?auto_26349 ) ) ( not ( = ?auto_26347 ?auto_26348 ) ) ( not ( = ?auto_26347 ?auto_26349 ) ) ( not ( = ?auto_26353 ?auto_26355 ) ) ( HOIST-AT ?auto_26356 ?auto_26353 ) ( not ( = ?auto_26354 ?auto_26356 ) ) ( AVAILABLE ?auto_26356 ) ( SURFACE-AT ?auto_26349 ?auto_26353 ) ( ON ?auto_26349 ?auto_26352 ) ( CLEAR ?auto_26349 ) ( not ( = ?auto_26348 ?auto_26352 ) ) ( not ( = ?auto_26349 ?auto_26352 ) ) ( not ( = ?auto_26347 ?auto_26352 ) ) ( SURFACE-AT ?auto_26347 ?auto_26355 ) ( CLEAR ?auto_26347 ) ( IS-CRATE ?auto_26348 ) ( AVAILABLE ?auto_26354 ) ( IN ?auto_26348 ?auto_26351 ) ( TRUCK-AT ?auto_26351 ?auto_26350 ) ( not ( = ?auto_26350 ?auto_26355 ) ) ( not ( = ?auto_26353 ?auto_26350 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26348 ?auto_26349 )
      ( MAKE-2CRATE-VERIFY ?auto_26347 ?auto_26348 ?auto_26349 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26357 - SURFACE
      ?auto_26358 - SURFACE
      ?auto_26359 - SURFACE
      ?auto_26360 - SURFACE
    )
    :vars
    (
      ?auto_26366 - HOIST
      ?auto_26362 - PLACE
      ?auto_26365 - PLACE
      ?auto_26364 - HOIST
      ?auto_26361 - SURFACE
      ?auto_26363 - TRUCK
      ?auto_26367 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26366 ?auto_26362 ) ( IS-CRATE ?auto_26360 ) ( not ( = ?auto_26359 ?auto_26360 ) ) ( not ( = ?auto_26358 ?auto_26359 ) ) ( not ( = ?auto_26358 ?auto_26360 ) ) ( not ( = ?auto_26365 ?auto_26362 ) ) ( HOIST-AT ?auto_26364 ?auto_26365 ) ( not ( = ?auto_26366 ?auto_26364 ) ) ( AVAILABLE ?auto_26364 ) ( SURFACE-AT ?auto_26360 ?auto_26365 ) ( ON ?auto_26360 ?auto_26361 ) ( CLEAR ?auto_26360 ) ( not ( = ?auto_26359 ?auto_26361 ) ) ( not ( = ?auto_26360 ?auto_26361 ) ) ( not ( = ?auto_26358 ?auto_26361 ) ) ( SURFACE-AT ?auto_26358 ?auto_26362 ) ( CLEAR ?auto_26358 ) ( IS-CRATE ?auto_26359 ) ( AVAILABLE ?auto_26366 ) ( IN ?auto_26359 ?auto_26363 ) ( TRUCK-AT ?auto_26363 ?auto_26367 ) ( not ( = ?auto_26367 ?auto_26362 ) ) ( not ( = ?auto_26365 ?auto_26367 ) ) ( ON ?auto_26358 ?auto_26357 ) ( not ( = ?auto_26357 ?auto_26358 ) ) ( not ( = ?auto_26357 ?auto_26359 ) ) ( not ( = ?auto_26357 ?auto_26360 ) ) ( not ( = ?auto_26357 ?auto_26361 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26358 ?auto_26359 ?auto_26360 )
      ( MAKE-3CRATE-VERIFY ?auto_26357 ?auto_26358 ?auto_26359 ?auto_26360 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26368 - SURFACE
      ?auto_26369 - SURFACE
      ?auto_26370 - SURFACE
      ?auto_26371 - SURFACE
      ?auto_26372 - SURFACE
    )
    :vars
    (
      ?auto_26378 - HOIST
      ?auto_26374 - PLACE
      ?auto_26377 - PLACE
      ?auto_26376 - HOIST
      ?auto_26373 - SURFACE
      ?auto_26375 - TRUCK
      ?auto_26379 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26378 ?auto_26374 ) ( IS-CRATE ?auto_26372 ) ( not ( = ?auto_26371 ?auto_26372 ) ) ( not ( = ?auto_26370 ?auto_26371 ) ) ( not ( = ?auto_26370 ?auto_26372 ) ) ( not ( = ?auto_26377 ?auto_26374 ) ) ( HOIST-AT ?auto_26376 ?auto_26377 ) ( not ( = ?auto_26378 ?auto_26376 ) ) ( AVAILABLE ?auto_26376 ) ( SURFACE-AT ?auto_26372 ?auto_26377 ) ( ON ?auto_26372 ?auto_26373 ) ( CLEAR ?auto_26372 ) ( not ( = ?auto_26371 ?auto_26373 ) ) ( not ( = ?auto_26372 ?auto_26373 ) ) ( not ( = ?auto_26370 ?auto_26373 ) ) ( SURFACE-AT ?auto_26370 ?auto_26374 ) ( CLEAR ?auto_26370 ) ( IS-CRATE ?auto_26371 ) ( AVAILABLE ?auto_26378 ) ( IN ?auto_26371 ?auto_26375 ) ( TRUCK-AT ?auto_26375 ?auto_26379 ) ( not ( = ?auto_26379 ?auto_26374 ) ) ( not ( = ?auto_26377 ?auto_26379 ) ) ( ON ?auto_26369 ?auto_26368 ) ( ON ?auto_26370 ?auto_26369 ) ( not ( = ?auto_26368 ?auto_26369 ) ) ( not ( = ?auto_26368 ?auto_26370 ) ) ( not ( = ?auto_26368 ?auto_26371 ) ) ( not ( = ?auto_26368 ?auto_26372 ) ) ( not ( = ?auto_26368 ?auto_26373 ) ) ( not ( = ?auto_26369 ?auto_26370 ) ) ( not ( = ?auto_26369 ?auto_26371 ) ) ( not ( = ?auto_26369 ?auto_26372 ) ) ( not ( = ?auto_26369 ?auto_26373 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26370 ?auto_26371 ?auto_26372 )
      ( MAKE-4CRATE-VERIFY ?auto_26368 ?auto_26369 ?auto_26370 ?auto_26371 ?auto_26372 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26380 - SURFACE
      ?auto_26381 - SURFACE
      ?auto_26382 - SURFACE
      ?auto_26383 - SURFACE
      ?auto_26384 - SURFACE
      ?auto_26385 - SURFACE
    )
    :vars
    (
      ?auto_26391 - HOIST
      ?auto_26387 - PLACE
      ?auto_26390 - PLACE
      ?auto_26389 - HOIST
      ?auto_26386 - SURFACE
      ?auto_26388 - TRUCK
      ?auto_26392 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26391 ?auto_26387 ) ( IS-CRATE ?auto_26385 ) ( not ( = ?auto_26384 ?auto_26385 ) ) ( not ( = ?auto_26383 ?auto_26384 ) ) ( not ( = ?auto_26383 ?auto_26385 ) ) ( not ( = ?auto_26390 ?auto_26387 ) ) ( HOIST-AT ?auto_26389 ?auto_26390 ) ( not ( = ?auto_26391 ?auto_26389 ) ) ( AVAILABLE ?auto_26389 ) ( SURFACE-AT ?auto_26385 ?auto_26390 ) ( ON ?auto_26385 ?auto_26386 ) ( CLEAR ?auto_26385 ) ( not ( = ?auto_26384 ?auto_26386 ) ) ( not ( = ?auto_26385 ?auto_26386 ) ) ( not ( = ?auto_26383 ?auto_26386 ) ) ( SURFACE-AT ?auto_26383 ?auto_26387 ) ( CLEAR ?auto_26383 ) ( IS-CRATE ?auto_26384 ) ( AVAILABLE ?auto_26391 ) ( IN ?auto_26384 ?auto_26388 ) ( TRUCK-AT ?auto_26388 ?auto_26392 ) ( not ( = ?auto_26392 ?auto_26387 ) ) ( not ( = ?auto_26390 ?auto_26392 ) ) ( ON ?auto_26381 ?auto_26380 ) ( ON ?auto_26382 ?auto_26381 ) ( ON ?auto_26383 ?auto_26382 ) ( not ( = ?auto_26380 ?auto_26381 ) ) ( not ( = ?auto_26380 ?auto_26382 ) ) ( not ( = ?auto_26380 ?auto_26383 ) ) ( not ( = ?auto_26380 ?auto_26384 ) ) ( not ( = ?auto_26380 ?auto_26385 ) ) ( not ( = ?auto_26380 ?auto_26386 ) ) ( not ( = ?auto_26381 ?auto_26382 ) ) ( not ( = ?auto_26381 ?auto_26383 ) ) ( not ( = ?auto_26381 ?auto_26384 ) ) ( not ( = ?auto_26381 ?auto_26385 ) ) ( not ( = ?auto_26381 ?auto_26386 ) ) ( not ( = ?auto_26382 ?auto_26383 ) ) ( not ( = ?auto_26382 ?auto_26384 ) ) ( not ( = ?auto_26382 ?auto_26385 ) ) ( not ( = ?auto_26382 ?auto_26386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26383 ?auto_26384 ?auto_26385 )
      ( MAKE-5CRATE-VERIFY ?auto_26380 ?auto_26381 ?auto_26382 ?auto_26383 ?auto_26384 ?auto_26385 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26393 - SURFACE
      ?auto_26394 - SURFACE
    )
    :vars
    (
      ?auto_26401 - HOIST
      ?auto_26397 - PLACE
      ?auto_26395 - SURFACE
      ?auto_26400 - PLACE
      ?auto_26399 - HOIST
      ?auto_26396 - SURFACE
      ?auto_26398 - TRUCK
      ?auto_26402 - PLACE
      ?auto_26403 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26401 ?auto_26397 ) ( IS-CRATE ?auto_26394 ) ( not ( = ?auto_26393 ?auto_26394 ) ) ( not ( = ?auto_26395 ?auto_26393 ) ) ( not ( = ?auto_26395 ?auto_26394 ) ) ( not ( = ?auto_26400 ?auto_26397 ) ) ( HOIST-AT ?auto_26399 ?auto_26400 ) ( not ( = ?auto_26401 ?auto_26399 ) ) ( AVAILABLE ?auto_26399 ) ( SURFACE-AT ?auto_26394 ?auto_26400 ) ( ON ?auto_26394 ?auto_26396 ) ( CLEAR ?auto_26394 ) ( not ( = ?auto_26393 ?auto_26396 ) ) ( not ( = ?auto_26394 ?auto_26396 ) ) ( not ( = ?auto_26395 ?auto_26396 ) ) ( SURFACE-AT ?auto_26395 ?auto_26397 ) ( CLEAR ?auto_26395 ) ( IS-CRATE ?auto_26393 ) ( AVAILABLE ?auto_26401 ) ( TRUCK-AT ?auto_26398 ?auto_26402 ) ( not ( = ?auto_26402 ?auto_26397 ) ) ( not ( = ?auto_26400 ?auto_26402 ) ) ( HOIST-AT ?auto_26403 ?auto_26402 ) ( LIFTING ?auto_26403 ?auto_26393 ) ( not ( = ?auto_26401 ?auto_26403 ) ) ( not ( = ?auto_26399 ?auto_26403 ) ) )
    :subtasks
    ( ( !LOAD ?auto_26403 ?auto_26393 ?auto_26398 ?auto_26402 )
      ( MAKE-2CRATE ?auto_26395 ?auto_26393 ?auto_26394 )
      ( MAKE-1CRATE-VERIFY ?auto_26393 ?auto_26394 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26404 - SURFACE
      ?auto_26405 - SURFACE
      ?auto_26406 - SURFACE
    )
    :vars
    (
      ?auto_26413 - HOIST
      ?auto_26407 - PLACE
      ?auto_26410 - PLACE
      ?auto_26414 - HOIST
      ?auto_26412 - SURFACE
      ?auto_26411 - TRUCK
      ?auto_26409 - PLACE
      ?auto_26408 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26413 ?auto_26407 ) ( IS-CRATE ?auto_26406 ) ( not ( = ?auto_26405 ?auto_26406 ) ) ( not ( = ?auto_26404 ?auto_26405 ) ) ( not ( = ?auto_26404 ?auto_26406 ) ) ( not ( = ?auto_26410 ?auto_26407 ) ) ( HOIST-AT ?auto_26414 ?auto_26410 ) ( not ( = ?auto_26413 ?auto_26414 ) ) ( AVAILABLE ?auto_26414 ) ( SURFACE-AT ?auto_26406 ?auto_26410 ) ( ON ?auto_26406 ?auto_26412 ) ( CLEAR ?auto_26406 ) ( not ( = ?auto_26405 ?auto_26412 ) ) ( not ( = ?auto_26406 ?auto_26412 ) ) ( not ( = ?auto_26404 ?auto_26412 ) ) ( SURFACE-AT ?auto_26404 ?auto_26407 ) ( CLEAR ?auto_26404 ) ( IS-CRATE ?auto_26405 ) ( AVAILABLE ?auto_26413 ) ( TRUCK-AT ?auto_26411 ?auto_26409 ) ( not ( = ?auto_26409 ?auto_26407 ) ) ( not ( = ?auto_26410 ?auto_26409 ) ) ( HOIST-AT ?auto_26408 ?auto_26409 ) ( LIFTING ?auto_26408 ?auto_26405 ) ( not ( = ?auto_26413 ?auto_26408 ) ) ( not ( = ?auto_26414 ?auto_26408 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26405 ?auto_26406 )
      ( MAKE-2CRATE-VERIFY ?auto_26404 ?auto_26405 ?auto_26406 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26415 - SURFACE
      ?auto_26416 - SURFACE
      ?auto_26417 - SURFACE
      ?auto_26418 - SURFACE
    )
    :vars
    (
      ?auto_26425 - HOIST
      ?auto_26424 - PLACE
      ?auto_26419 - PLACE
      ?auto_26421 - HOIST
      ?auto_26422 - SURFACE
      ?auto_26423 - TRUCK
      ?auto_26426 - PLACE
      ?auto_26420 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26425 ?auto_26424 ) ( IS-CRATE ?auto_26418 ) ( not ( = ?auto_26417 ?auto_26418 ) ) ( not ( = ?auto_26416 ?auto_26417 ) ) ( not ( = ?auto_26416 ?auto_26418 ) ) ( not ( = ?auto_26419 ?auto_26424 ) ) ( HOIST-AT ?auto_26421 ?auto_26419 ) ( not ( = ?auto_26425 ?auto_26421 ) ) ( AVAILABLE ?auto_26421 ) ( SURFACE-AT ?auto_26418 ?auto_26419 ) ( ON ?auto_26418 ?auto_26422 ) ( CLEAR ?auto_26418 ) ( not ( = ?auto_26417 ?auto_26422 ) ) ( not ( = ?auto_26418 ?auto_26422 ) ) ( not ( = ?auto_26416 ?auto_26422 ) ) ( SURFACE-AT ?auto_26416 ?auto_26424 ) ( CLEAR ?auto_26416 ) ( IS-CRATE ?auto_26417 ) ( AVAILABLE ?auto_26425 ) ( TRUCK-AT ?auto_26423 ?auto_26426 ) ( not ( = ?auto_26426 ?auto_26424 ) ) ( not ( = ?auto_26419 ?auto_26426 ) ) ( HOIST-AT ?auto_26420 ?auto_26426 ) ( LIFTING ?auto_26420 ?auto_26417 ) ( not ( = ?auto_26425 ?auto_26420 ) ) ( not ( = ?auto_26421 ?auto_26420 ) ) ( ON ?auto_26416 ?auto_26415 ) ( not ( = ?auto_26415 ?auto_26416 ) ) ( not ( = ?auto_26415 ?auto_26417 ) ) ( not ( = ?auto_26415 ?auto_26418 ) ) ( not ( = ?auto_26415 ?auto_26422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26416 ?auto_26417 ?auto_26418 )
      ( MAKE-3CRATE-VERIFY ?auto_26415 ?auto_26416 ?auto_26417 ?auto_26418 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26427 - SURFACE
      ?auto_26428 - SURFACE
      ?auto_26429 - SURFACE
      ?auto_26430 - SURFACE
      ?auto_26431 - SURFACE
    )
    :vars
    (
      ?auto_26438 - HOIST
      ?auto_26437 - PLACE
      ?auto_26432 - PLACE
      ?auto_26434 - HOIST
      ?auto_26435 - SURFACE
      ?auto_26436 - TRUCK
      ?auto_26439 - PLACE
      ?auto_26433 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26438 ?auto_26437 ) ( IS-CRATE ?auto_26431 ) ( not ( = ?auto_26430 ?auto_26431 ) ) ( not ( = ?auto_26429 ?auto_26430 ) ) ( not ( = ?auto_26429 ?auto_26431 ) ) ( not ( = ?auto_26432 ?auto_26437 ) ) ( HOIST-AT ?auto_26434 ?auto_26432 ) ( not ( = ?auto_26438 ?auto_26434 ) ) ( AVAILABLE ?auto_26434 ) ( SURFACE-AT ?auto_26431 ?auto_26432 ) ( ON ?auto_26431 ?auto_26435 ) ( CLEAR ?auto_26431 ) ( not ( = ?auto_26430 ?auto_26435 ) ) ( not ( = ?auto_26431 ?auto_26435 ) ) ( not ( = ?auto_26429 ?auto_26435 ) ) ( SURFACE-AT ?auto_26429 ?auto_26437 ) ( CLEAR ?auto_26429 ) ( IS-CRATE ?auto_26430 ) ( AVAILABLE ?auto_26438 ) ( TRUCK-AT ?auto_26436 ?auto_26439 ) ( not ( = ?auto_26439 ?auto_26437 ) ) ( not ( = ?auto_26432 ?auto_26439 ) ) ( HOIST-AT ?auto_26433 ?auto_26439 ) ( LIFTING ?auto_26433 ?auto_26430 ) ( not ( = ?auto_26438 ?auto_26433 ) ) ( not ( = ?auto_26434 ?auto_26433 ) ) ( ON ?auto_26428 ?auto_26427 ) ( ON ?auto_26429 ?auto_26428 ) ( not ( = ?auto_26427 ?auto_26428 ) ) ( not ( = ?auto_26427 ?auto_26429 ) ) ( not ( = ?auto_26427 ?auto_26430 ) ) ( not ( = ?auto_26427 ?auto_26431 ) ) ( not ( = ?auto_26427 ?auto_26435 ) ) ( not ( = ?auto_26428 ?auto_26429 ) ) ( not ( = ?auto_26428 ?auto_26430 ) ) ( not ( = ?auto_26428 ?auto_26431 ) ) ( not ( = ?auto_26428 ?auto_26435 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26429 ?auto_26430 ?auto_26431 )
      ( MAKE-4CRATE-VERIFY ?auto_26427 ?auto_26428 ?auto_26429 ?auto_26430 ?auto_26431 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26440 - SURFACE
      ?auto_26441 - SURFACE
      ?auto_26442 - SURFACE
      ?auto_26443 - SURFACE
      ?auto_26444 - SURFACE
      ?auto_26445 - SURFACE
    )
    :vars
    (
      ?auto_26452 - HOIST
      ?auto_26451 - PLACE
      ?auto_26446 - PLACE
      ?auto_26448 - HOIST
      ?auto_26449 - SURFACE
      ?auto_26450 - TRUCK
      ?auto_26453 - PLACE
      ?auto_26447 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_26452 ?auto_26451 ) ( IS-CRATE ?auto_26445 ) ( not ( = ?auto_26444 ?auto_26445 ) ) ( not ( = ?auto_26443 ?auto_26444 ) ) ( not ( = ?auto_26443 ?auto_26445 ) ) ( not ( = ?auto_26446 ?auto_26451 ) ) ( HOIST-AT ?auto_26448 ?auto_26446 ) ( not ( = ?auto_26452 ?auto_26448 ) ) ( AVAILABLE ?auto_26448 ) ( SURFACE-AT ?auto_26445 ?auto_26446 ) ( ON ?auto_26445 ?auto_26449 ) ( CLEAR ?auto_26445 ) ( not ( = ?auto_26444 ?auto_26449 ) ) ( not ( = ?auto_26445 ?auto_26449 ) ) ( not ( = ?auto_26443 ?auto_26449 ) ) ( SURFACE-AT ?auto_26443 ?auto_26451 ) ( CLEAR ?auto_26443 ) ( IS-CRATE ?auto_26444 ) ( AVAILABLE ?auto_26452 ) ( TRUCK-AT ?auto_26450 ?auto_26453 ) ( not ( = ?auto_26453 ?auto_26451 ) ) ( not ( = ?auto_26446 ?auto_26453 ) ) ( HOIST-AT ?auto_26447 ?auto_26453 ) ( LIFTING ?auto_26447 ?auto_26444 ) ( not ( = ?auto_26452 ?auto_26447 ) ) ( not ( = ?auto_26448 ?auto_26447 ) ) ( ON ?auto_26441 ?auto_26440 ) ( ON ?auto_26442 ?auto_26441 ) ( ON ?auto_26443 ?auto_26442 ) ( not ( = ?auto_26440 ?auto_26441 ) ) ( not ( = ?auto_26440 ?auto_26442 ) ) ( not ( = ?auto_26440 ?auto_26443 ) ) ( not ( = ?auto_26440 ?auto_26444 ) ) ( not ( = ?auto_26440 ?auto_26445 ) ) ( not ( = ?auto_26440 ?auto_26449 ) ) ( not ( = ?auto_26441 ?auto_26442 ) ) ( not ( = ?auto_26441 ?auto_26443 ) ) ( not ( = ?auto_26441 ?auto_26444 ) ) ( not ( = ?auto_26441 ?auto_26445 ) ) ( not ( = ?auto_26441 ?auto_26449 ) ) ( not ( = ?auto_26442 ?auto_26443 ) ) ( not ( = ?auto_26442 ?auto_26444 ) ) ( not ( = ?auto_26442 ?auto_26445 ) ) ( not ( = ?auto_26442 ?auto_26449 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26443 ?auto_26444 ?auto_26445 )
      ( MAKE-5CRATE-VERIFY ?auto_26440 ?auto_26441 ?auto_26442 ?auto_26443 ?auto_26444 ?auto_26445 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26454 - SURFACE
      ?auto_26455 - SURFACE
    )
    :vars
    (
      ?auto_26463 - HOIST
      ?auto_26462 - PLACE
      ?auto_26458 - SURFACE
      ?auto_26456 - PLACE
      ?auto_26459 - HOIST
      ?auto_26460 - SURFACE
      ?auto_26461 - TRUCK
      ?auto_26464 - PLACE
      ?auto_26457 - HOIST
      ?auto_26465 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26463 ?auto_26462 ) ( IS-CRATE ?auto_26455 ) ( not ( = ?auto_26454 ?auto_26455 ) ) ( not ( = ?auto_26458 ?auto_26454 ) ) ( not ( = ?auto_26458 ?auto_26455 ) ) ( not ( = ?auto_26456 ?auto_26462 ) ) ( HOIST-AT ?auto_26459 ?auto_26456 ) ( not ( = ?auto_26463 ?auto_26459 ) ) ( AVAILABLE ?auto_26459 ) ( SURFACE-AT ?auto_26455 ?auto_26456 ) ( ON ?auto_26455 ?auto_26460 ) ( CLEAR ?auto_26455 ) ( not ( = ?auto_26454 ?auto_26460 ) ) ( not ( = ?auto_26455 ?auto_26460 ) ) ( not ( = ?auto_26458 ?auto_26460 ) ) ( SURFACE-AT ?auto_26458 ?auto_26462 ) ( CLEAR ?auto_26458 ) ( IS-CRATE ?auto_26454 ) ( AVAILABLE ?auto_26463 ) ( TRUCK-AT ?auto_26461 ?auto_26464 ) ( not ( = ?auto_26464 ?auto_26462 ) ) ( not ( = ?auto_26456 ?auto_26464 ) ) ( HOIST-AT ?auto_26457 ?auto_26464 ) ( not ( = ?auto_26463 ?auto_26457 ) ) ( not ( = ?auto_26459 ?auto_26457 ) ) ( AVAILABLE ?auto_26457 ) ( SURFACE-AT ?auto_26454 ?auto_26464 ) ( ON ?auto_26454 ?auto_26465 ) ( CLEAR ?auto_26454 ) ( not ( = ?auto_26454 ?auto_26465 ) ) ( not ( = ?auto_26455 ?auto_26465 ) ) ( not ( = ?auto_26458 ?auto_26465 ) ) ( not ( = ?auto_26460 ?auto_26465 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26457 ?auto_26454 ?auto_26465 ?auto_26464 )
      ( MAKE-2CRATE ?auto_26458 ?auto_26454 ?auto_26455 )
      ( MAKE-1CRATE-VERIFY ?auto_26454 ?auto_26455 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26466 - SURFACE
      ?auto_26467 - SURFACE
      ?auto_26468 - SURFACE
    )
    :vars
    (
      ?auto_26471 - HOIST
      ?auto_26473 - PLACE
      ?auto_26477 - PLACE
      ?auto_26469 - HOIST
      ?auto_26476 - SURFACE
      ?auto_26475 - TRUCK
      ?auto_26474 - PLACE
      ?auto_26470 - HOIST
      ?auto_26472 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26471 ?auto_26473 ) ( IS-CRATE ?auto_26468 ) ( not ( = ?auto_26467 ?auto_26468 ) ) ( not ( = ?auto_26466 ?auto_26467 ) ) ( not ( = ?auto_26466 ?auto_26468 ) ) ( not ( = ?auto_26477 ?auto_26473 ) ) ( HOIST-AT ?auto_26469 ?auto_26477 ) ( not ( = ?auto_26471 ?auto_26469 ) ) ( AVAILABLE ?auto_26469 ) ( SURFACE-AT ?auto_26468 ?auto_26477 ) ( ON ?auto_26468 ?auto_26476 ) ( CLEAR ?auto_26468 ) ( not ( = ?auto_26467 ?auto_26476 ) ) ( not ( = ?auto_26468 ?auto_26476 ) ) ( not ( = ?auto_26466 ?auto_26476 ) ) ( SURFACE-AT ?auto_26466 ?auto_26473 ) ( CLEAR ?auto_26466 ) ( IS-CRATE ?auto_26467 ) ( AVAILABLE ?auto_26471 ) ( TRUCK-AT ?auto_26475 ?auto_26474 ) ( not ( = ?auto_26474 ?auto_26473 ) ) ( not ( = ?auto_26477 ?auto_26474 ) ) ( HOIST-AT ?auto_26470 ?auto_26474 ) ( not ( = ?auto_26471 ?auto_26470 ) ) ( not ( = ?auto_26469 ?auto_26470 ) ) ( AVAILABLE ?auto_26470 ) ( SURFACE-AT ?auto_26467 ?auto_26474 ) ( ON ?auto_26467 ?auto_26472 ) ( CLEAR ?auto_26467 ) ( not ( = ?auto_26467 ?auto_26472 ) ) ( not ( = ?auto_26468 ?auto_26472 ) ) ( not ( = ?auto_26466 ?auto_26472 ) ) ( not ( = ?auto_26476 ?auto_26472 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26467 ?auto_26468 )
      ( MAKE-2CRATE-VERIFY ?auto_26466 ?auto_26467 ?auto_26468 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26478 - SURFACE
      ?auto_26479 - SURFACE
      ?auto_26480 - SURFACE
      ?auto_26481 - SURFACE
    )
    :vars
    (
      ?auto_26485 - HOIST
      ?auto_26489 - PLACE
      ?auto_26486 - PLACE
      ?auto_26490 - HOIST
      ?auto_26487 - SURFACE
      ?auto_26484 - TRUCK
      ?auto_26488 - PLACE
      ?auto_26482 - HOIST
      ?auto_26483 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26485 ?auto_26489 ) ( IS-CRATE ?auto_26481 ) ( not ( = ?auto_26480 ?auto_26481 ) ) ( not ( = ?auto_26479 ?auto_26480 ) ) ( not ( = ?auto_26479 ?auto_26481 ) ) ( not ( = ?auto_26486 ?auto_26489 ) ) ( HOIST-AT ?auto_26490 ?auto_26486 ) ( not ( = ?auto_26485 ?auto_26490 ) ) ( AVAILABLE ?auto_26490 ) ( SURFACE-AT ?auto_26481 ?auto_26486 ) ( ON ?auto_26481 ?auto_26487 ) ( CLEAR ?auto_26481 ) ( not ( = ?auto_26480 ?auto_26487 ) ) ( not ( = ?auto_26481 ?auto_26487 ) ) ( not ( = ?auto_26479 ?auto_26487 ) ) ( SURFACE-AT ?auto_26479 ?auto_26489 ) ( CLEAR ?auto_26479 ) ( IS-CRATE ?auto_26480 ) ( AVAILABLE ?auto_26485 ) ( TRUCK-AT ?auto_26484 ?auto_26488 ) ( not ( = ?auto_26488 ?auto_26489 ) ) ( not ( = ?auto_26486 ?auto_26488 ) ) ( HOIST-AT ?auto_26482 ?auto_26488 ) ( not ( = ?auto_26485 ?auto_26482 ) ) ( not ( = ?auto_26490 ?auto_26482 ) ) ( AVAILABLE ?auto_26482 ) ( SURFACE-AT ?auto_26480 ?auto_26488 ) ( ON ?auto_26480 ?auto_26483 ) ( CLEAR ?auto_26480 ) ( not ( = ?auto_26480 ?auto_26483 ) ) ( not ( = ?auto_26481 ?auto_26483 ) ) ( not ( = ?auto_26479 ?auto_26483 ) ) ( not ( = ?auto_26487 ?auto_26483 ) ) ( ON ?auto_26479 ?auto_26478 ) ( not ( = ?auto_26478 ?auto_26479 ) ) ( not ( = ?auto_26478 ?auto_26480 ) ) ( not ( = ?auto_26478 ?auto_26481 ) ) ( not ( = ?auto_26478 ?auto_26487 ) ) ( not ( = ?auto_26478 ?auto_26483 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26479 ?auto_26480 ?auto_26481 )
      ( MAKE-3CRATE-VERIFY ?auto_26478 ?auto_26479 ?auto_26480 ?auto_26481 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26491 - SURFACE
      ?auto_26492 - SURFACE
      ?auto_26493 - SURFACE
      ?auto_26494 - SURFACE
      ?auto_26495 - SURFACE
    )
    :vars
    (
      ?auto_26499 - HOIST
      ?auto_26503 - PLACE
      ?auto_26500 - PLACE
      ?auto_26504 - HOIST
      ?auto_26501 - SURFACE
      ?auto_26498 - TRUCK
      ?auto_26502 - PLACE
      ?auto_26496 - HOIST
      ?auto_26497 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26499 ?auto_26503 ) ( IS-CRATE ?auto_26495 ) ( not ( = ?auto_26494 ?auto_26495 ) ) ( not ( = ?auto_26493 ?auto_26494 ) ) ( not ( = ?auto_26493 ?auto_26495 ) ) ( not ( = ?auto_26500 ?auto_26503 ) ) ( HOIST-AT ?auto_26504 ?auto_26500 ) ( not ( = ?auto_26499 ?auto_26504 ) ) ( AVAILABLE ?auto_26504 ) ( SURFACE-AT ?auto_26495 ?auto_26500 ) ( ON ?auto_26495 ?auto_26501 ) ( CLEAR ?auto_26495 ) ( not ( = ?auto_26494 ?auto_26501 ) ) ( not ( = ?auto_26495 ?auto_26501 ) ) ( not ( = ?auto_26493 ?auto_26501 ) ) ( SURFACE-AT ?auto_26493 ?auto_26503 ) ( CLEAR ?auto_26493 ) ( IS-CRATE ?auto_26494 ) ( AVAILABLE ?auto_26499 ) ( TRUCK-AT ?auto_26498 ?auto_26502 ) ( not ( = ?auto_26502 ?auto_26503 ) ) ( not ( = ?auto_26500 ?auto_26502 ) ) ( HOIST-AT ?auto_26496 ?auto_26502 ) ( not ( = ?auto_26499 ?auto_26496 ) ) ( not ( = ?auto_26504 ?auto_26496 ) ) ( AVAILABLE ?auto_26496 ) ( SURFACE-AT ?auto_26494 ?auto_26502 ) ( ON ?auto_26494 ?auto_26497 ) ( CLEAR ?auto_26494 ) ( not ( = ?auto_26494 ?auto_26497 ) ) ( not ( = ?auto_26495 ?auto_26497 ) ) ( not ( = ?auto_26493 ?auto_26497 ) ) ( not ( = ?auto_26501 ?auto_26497 ) ) ( ON ?auto_26492 ?auto_26491 ) ( ON ?auto_26493 ?auto_26492 ) ( not ( = ?auto_26491 ?auto_26492 ) ) ( not ( = ?auto_26491 ?auto_26493 ) ) ( not ( = ?auto_26491 ?auto_26494 ) ) ( not ( = ?auto_26491 ?auto_26495 ) ) ( not ( = ?auto_26491 ?auto_26501 ) ) ( not ( = ?auto_26491 ?auto_26497 ) ) ( not ( = ?auto_26492 ?auto_26493 ) ) ( not ( = ?auto_26492 ?auto_26494 ) ) ( not ( = ?auto_26492 ?auto_26495 ) ) ( not ( = ?auto_26492 ?auto_26501 ) ) ( not ( = ?auto_26492 ?auto_26497 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26493 ?auto_26494 ?auto_26495 )
      ( MAKE-4CRATE-VERIFY ?auto_26491 ?auto_26492 ?auto_26493 ?auto_26494 ?auto_26495 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26505 - SURFACE
      ?auto_26506 - SURFACE
      ?auto_26507 - SURFACE
      ?auto_26508 - SURFACE
      ?auto_26509 - SURFACE
      ?auto_26510 - SURFACE
    )
    :vars
    (
      ?auto_26514 - HOIST
      ?auto_26518 - PLACE
      ?auto_26515 - PLACE
      ?auto_26519 - HOIST
      ?auto_26516 - SURFACE
      ?auto_26513 - TRUCK
      ?auto_26517 - PLACE
      ?auto_26511 - HOIST
      ?auto_26512 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26514 ?auto_26518 ) ( IS-CRATE ?auto_26510 ) ( not ( = ?auto_26509 ?auto_26510 ) ) ( not ( = ?auto_26508 ?auto_26509 ) ) ( not ( = ?auto_26508 ?auto_26510 ) ) ( not ( = ?auto_26515 ?auto_26518 ) ) ( HOIST-AT ?auto_26519 ?auto_26515 ) ( not ( = ?auto_26514 ?auto_26519 ) ) ( AVAILABLE ?auto_26519 ) ( SURFACE-AT ?auto_26510 ?auto_26515 ) ( ON ?auto_26510 ?auto_26516 ) ( CLEAR ?auto_26510 ) ( not ( = ?auto_26509 ?auto_26516 ) ) ( not ( = ?auto_26510 ?auto_26516 ) ) ( not ( = ?auto_26508 ?auto_26516 ) ) ( SURFACE-AT ?auto_26508 ?auto_26518 ) ( CLEAR ?auto_26508 ) ( IS-CRATE ?auto_26509 ) ( AVAILABLE ?auto_26514 ) ( TRUCK-AT ?auto_26513 ?auto_26517 ) ( not ( = ?auto_26517 ?auto_26518 ) ) ( not ( = ?auto_26515 ?auto_26517 ) ) ( HOIST-AT ?auto_26511 ?auto_26517 ) ( not ( = ?auto_26514 ?auto_26511 ) ) ( not ( = ?auto_26519 ?auto_26511 ) ) ( AVAILABLE ?auto_26511 ) ( SURFACE-AT ?auto_26509 ?auto_26517 ) ( ON ?auto_26509 ?auto_26512 ) ( CLEAR ?auto_26509 ) ( not ( = ?auto_26509 ?auto_26512 ) ) ( not ( = ?auto_26510 ?auto_26512 ) ) ( not ( = ?auto_26508 ?auto_26512 ) ) ( not ( = ?auto_26516 ?auto_26512 ) ) ( ON ?auto_26506 ?auto_26505 ) ( ON ?auto_26507 ?auto_26506 ) ( ON ?auto_26508 ?auto_26507 ) ( not ( = ?auto_26505 ?auto_26506 ) ) ( not ( = ?auto_26505 ?auto_26507 ) ) ( not ( = ?auto_26505 ?auto_26508 ) ) ( not ( = ?auto_26505 ?auto_26509 ) ) ( not ( = ?auto_26505 ?auto_26510 ) ) ( not ( = ?auto_26505 ?auto_26516 ) ) ( not ( = ?auto_26505 ?auto_26512 ) ) ( not ( = ?auto_26506 ?auto_26507 ) ) ( not ( = ?auto_26506 ?auto_26508 ) ) ( not ( = ?auto_26506 ?auto_26509 ) ) ( not ( = ?auto_26506 ?auto_26510 ) ) ( not ( = ?auto_26506 ?auto_26516 ) ) ( not ( = ?auto_26506 ?auto_26512 ) ) ( not ( = ?auto_26507 ?auto_26508 ) ) ( not ( = ?auto_26507 ?auto_26509 ) ) ( not ( = ?auto_26507 ?auto_26510 ) ) ( not ( = ?auto_26507 ?auto_26516 ) ) ( not ( = ?auto_26507 ?auto_26512 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26508 ?auto_26509 ?auto_26510 )
      ( MAKE-5CRATE-VERIFY ?auto_26505 ?auto_26506 ?auto_26507 ?auto_26508 ?auto_26509 ?auto_26510 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26520 - SURFACE
      ?auto_26521 - SURFACE
    )
    :vars
    (
      ?auto_26526 - HOIST
      ?auto_26530 - PLACE
      ?auto_26523 - SURFACE
      ?auto_26527 - PLACE
      ?auto_26531 - HOIST
      ?auto_26528 - SURFACE
      ?auto_26529 - PLACE
      ?auto_26522 - HOIST
      ?auto_26524 - SURFACE
      ?auto_26525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26526 ?auto_26530 ) ( IS-CRATE ?auto_26521 ) ( not ( = ?auto_26520 ?auto_26521 ) ) ( not ( = ?auto_26523 ?auto_26520 ) ) ( not ( = ?auto_26523 ?auto_26521 ) ) ( not ( = ?auto_26527 ?auto_26530 ) ) ( HOIST-AT ?auto_26531 ?auto_26527 ) ( not ( = ?auto_26526 ?auto_26531 ) ) ( AVAILABLE ?auto_26531 ) ( SURFACE-AT ?auto_26521 ?auto_26527 ) ( ON ?auto_26521 ?auto_26528 ) ( CLEAR ?auto_26521 ) ( not ( = ?auto_26520 ?auto_26528 ) ) ( not ( = ?auto_26521 ?auto_26528 ) ) ( not ( = ?auto_26523 ?auto_26528 ) ) ( SURFACE-AT ?auto_26523 ?auto_26530 ) ( CLEAR ?auto_26523 ) ( IS-CRATE ?auto_26520 ) ( AVAILABLE ?auto_26526 ) ( not ( = ?auto_26529 ?auto_26530 ) ) ( not ( = ?auto_26527 ?auto_26529 ) ) ( HOIST-AT ?auto_26522 ?auto_26529 ) ( not ( = ?auto_26526 ?auto_26522 ) ) ( not ( = ?auto_26531 ?auto_26522 ) ) ( AVAILABLE ?auto_26522 ) ( SURFACE-AT ?auto_26520 ?auto_26529 ) ( ON ?auto_26520 ?auto_26524 ) ( CLEAR ?auto_26520 ) ( not ( = ?auto_26520 ?auto_26524 ) ) ( not ( = ?auto_26521 ?auto_26524 ) ) ( not ( = ?auto_26523 ?auto_26524 ) ) ( not ( = ?auto_26528 ?auto_26524 ) ) ( TRUCK-AT ?auto_26525 ?auto_26530 ) )
    :subtasks
    ( ( !DRIVE ?auto_26525 ?auto_26530 ?auto_26529 )
      ( MAKE-2CRATE ?auto_26523 ?auto_26520 ?auto_26521 )
      ( MAKE-1CRATE-VERIFY ?auto_26520 ?auto_26521 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26532 - SURFACE
      ?auto_26533 - SURFACE
      ?auto_26534 - SURFACE
    )
    :vars
    (
      ?auto_26537 - HOIST
      ?auto_26543 - PLACE
      ?auto_26535 - PLACE
      ?auto_26541 - HOIST
      ?auto_26536 - SURFACE
      ?auto_26538 - PLACE
      ?auto_26539 - HOIST
      ?auto_26542 - SURFACE
      ?auto_26540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26537 ?auto_26543 ) ( IS-CRATE ?auto_26534 ) ( not ( = ?auto_26533 ?auto_26534 ) ) ( not ( = ?auto_26532 ?auto_26533 ) ) ( not ( = ?auto_26532 ?auto_26534 ) ) ( not ( = ?auto_26535 ?auto_26543 ) ) ( HOIST-AT ?auto_26541 ?auto_26535 ) ( not ( = ?auto_26537 ?auto_26541 ) ) ( AVAILABLE ?auto_26541 ) ( SURFACE-AT ?auto_26534 ?auto_26535 ) ( ON ?auto_26534 ?auto_26536 ) ( CLEAR ?auto_26534 ) ( not ( = ?auto_26533 ?auto_26536 ) ) ( not ( = ?auto_26534 ?auto_26536 ) ) ( not ( = ?auto_26532 ?auto_26536 ) ) ( SURFACE-AT ?auto_26532 ?auto_26543 ) ( CLEAR ?auto_26532 ) ( IS-CRATE ?auto_26533 ) ( AVAILABLE ?auto_26537 ) ( not ( = ?auto_26538 ?auto_26543 ) ) ( not ( = ?auto_26535 ?auto_26538 ) ) ( HOIST-AT ?auto_26539 ?auto_26538 ) ( not ( = ?auto_26537 ?auto_26539 ) ) ( not ( = ?auto_26541 ?auto_26539 ) ) ( AVAILABLE ?auto_26539 ) ( SURFACE-AT ?auto_26533 ?auto_26538 ) ( ON ?auto_26533 ?auto_26542 ) ( CLEAR ?auto_26533 ) ( not ( = ?auto_26533 ?auto_26542 ) ) ( not ( = ?auto_26534 ?auto_26542 ) ) ( not ( = ?auto_26532 ?auto_26542 ) ) ( not ( = ?auto_26536 ?auto_26542 ) ) ( TRUCK-AT ?auto_26540 ?auto_26543 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26533 ?auto_26534 )
      ( MAKE-2CRATE-VERIFY ?auto_26532 ?auto_26533 ?auto_26534 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26544 - SURFACE
      ?auto_26545 - SURFACE
      ?auto_26546 - SURFACE
      ?auto_26547 - SURFACE
    )
    :vars
    (
      ?auto_26550 - HOIST
      ?auto_26549 - PLACE
      ?auto_26554 - PLACE
      ?auto_26548 - HOIST
      ?auto_26552 - SURFACE
      ?auto_26553 - PLACE
      ?auto_26556 - HOIST
      ?auto_26555 - SURFACE
      ?auto_26551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26550 ?auto_26549 ) ( IS-CRATE ?auto_26547 ) ( not ( = ?auto_26546 ?auto_26547 ) ) ( not ( = ?auto_26545 ?auto_26546 ) ) ( not ( = ?auto_26545 ?auto_26547 ) ) ( not ( = ?auto_26554 ?auto_26549 ) ) ( HOIST-AT ?auto_26548 ?auto_26554 ) ( not ( = ?auto_26550 ?auto_26548 ) ) ( AVAILABLE ?auto_26548 ) ( SURFACE-AT ?auto_26547 ?auto_26554 ) ( ON ?auto_26547 ?auto_26552 ) ( CLEAR ?auto_26547 ) ( not ( = ?auto_26546 ?auto_26552 ) ) ( not ( = ?auto_26547 ?auto_26552 ) ) ( not ( = ?auto_26545 ?auto_26552 ) ) ( SURFACE-AT ?auto_26545 ?auto_26549 ) ( CLEAR ?auto_26545 ) ( IS-CRATE ?auto_26546 ) ( AVAILABLE ?auto_26550 ) ( not ( = ?auto_26553 ?auto_26549 ) ) ( not ( = ?auto_26554 ?auto_26553 ) ) ( HOIST-AT ?auto_26556 ?auto_26553 ) ( not ( = ?auto_26550 ?auto_26556 ) ) ( not ( = ?auto_26548 ?auto_26556 ) ) ( AVAILABLE ?auto_26556 ) ( SURFACE-AT ?auto_26546 ?auto_26553 ) ( ON ?auto_26546 ?auto_26555 ) ( CLEAR ?auto_26546 ) ( not ( = ?auto_26546 ?auto_26555 ) ) ( not ( = ?auto_26547 ?auto_26555 ) ) ( not ( = ?auto_26545 ?auto_26555 ) ) ( not ( = ?auto_26552 ?auto_26555 ) ) ( TRUCK-AT ?auto_26551 ?auto_26549 ) ( ON ?auto_26545 ?auto_26544 ) ( not ( = ?auto_26544 ?auto_26545 ) ) ( not ( = ?auto_26544 ?auto_26546 ) ) ( not ( = ?auto_26544 ?auto_26547 ) ) ( not ( = ?auto_26544 ?auto_26552 ) ) ( not ( = ?auto_26544 ?auto_26555 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26545 ?auto_26546 ?auto_26547 )
      ( MAKE-3CRATE-VERIFY ?auto_26544 ?auto_26545 ?auto_26546 ?auto_26547 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26557 - SURFACE
      ?auto_26558 - SURFACE
      ?auto_26559 - SURFACE
      ?auto_26560 - SURFACE
      ?auto_26561 - SURFACE
    )
    :vars
    (
      ?auto_26564 - HOIST
      ?auto_26563 - PLACE
      ?auto_26568 - PLACE
      ?auto_26562 - HOIST
      ?auto_26566 - SURFACE
      ?auto_26567 - PLACE
      ?auto_26570 - HOIST
      ?auto_26569 - SURFACE
      ?auto_26565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26564 ?auto_26563 ) ( IS-CRATE ?auto_26561 ) ( not ( = ?auto_26560 ?auto_26561 ) ) ( not ( = ?auto_26559 ?auto_26560 ) ) ( not ( = ?auto_26559 ?auto_26561 ) ) ( not ( = ?auto_26568 ?auto_26563 ) ) ( HOIST-AT ?auto_26562 ?auto_26568 ) ( not ( = ?auto_26564 ?auto_26562 ) ) ( AVAILABLE ?auto_26562 ) ( SURFACE-AT ?auto_26561 ?auto_26568 ) ( ON ?auto_26561 ?auto_26566 ) ( CLEAR ?auto_26561 ) ( not ( = ?auto_26560 ?auto_26566 ) ) ( not ( = ?auto_26561 ?auto_26566 ) ) ( not ( = ?auto_26559 ?auto_26566 ) ) ( SURFACE-AT ?auto_26559 ?auto_26563 ) ( CLEAR ?auto_26559 ) ( IS-CRATE ?auto_26560 ) ( AVAILABLE ?auto_26564 ) ( not ( = ?auto_26567 ?auto_26563 ) ) ( not ( = ?auto_26568 ?auto_26567 ) ) ( HOIST-AT ?auto_26570 ?auto_26567 ) ( not ( = ?auto_26564 ?auto_26570 ) ) ( not ( = ?auto_26562 ?auto_26570 ) ) ( AVAILABLE ?auto_26570 ) ( SURFACE-AT ?auto_26560 ?auto_26567 ) ( ON ?auto_26560 ?auto_26569 ) ( CLEAR ?auto_26560 ) ( not ( = ?auto_26560 ?auto_26569 ) ) ( not ( = ?auto_26561 ?auto_26569 ) ) ( not ( = ?auto_26559 ?auto_26569 ) ) ( not ( = ?auto_26566 ?auto_26569 ) ) ( TRUCK-AT ?auto_26565 ?auto_26563 ) ( ON ?auto_26558 ?auto_26557 ) ( ON ?auto_26559 ?auto_26558 ) ( not ( = ?auto_26557 ?auto_26558 ) ) ( not ( = ?auto_26557 ?auto_26559 ) ) ( not ( = ?auto_26557 ?auto_26560 ) ) ( not ( = ?auto_26557 ?auto_26561 ) ) ( not ( = ?auto_26557 ?auto_26566 ) ) ( not ( = ?auto_26557 ?auto_26569 ) ) ( not ( = ?auto_26558 ?auto_26559 ) ) ( not ( = ?auto_26558 ?auto_26560 ) ) ( not ( = ?auto_26558 ?auto_26561 ) ) ( not ( = ?auto_26558 ?auto_26566 ) ) ( not ( = ?auto_26558 ?auto_26569 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26559 ?auto_26560 ?auto_26561 )
      ( MAKE-4CRATE-VERIFY ?auto_26557 ?auto_26558 ?auto_26559 ?auto_26560 ?auto_26561 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26571 - SURFACE
      ?auto_26572 - SURFACE
      ?auto_26573 - SURFACE
      ?auto_26574 - SURFACE
      ?auto_26575 - SURFACE
      ?auto_26576 - SURFACE
    )
    :vars
    (
      ?auto_26579 - HOIST
      ?auto_26578 - PLACE
      ?auto_26583 - PLACE
      ?auto_26577 - HOIST
      ?auto_26581 - SURFACE
      ?auto_26582 - PLACE
      ?auto_26585 - HOIST
      ?auto_26584 - SURFACE
      ?auto_26580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26579 ?auto_26578 ) ( IS-CRATE ?auto_26576 ) ( not ( = ?auto_26575 ?auto_26576 ) ) ( not ( = ?auto_26574 ?auto_26575 ) ) ( not ( = ?auto_26574 ?auto_26576 ) ) ( not ( = ?auto_26583 ?auto_26578 ) ) ( HOIST-AT ?auto_26577 ?auto_26583 ) ( not ( = ?auto_26579 ?auto_26577 ) ) ( AVAILABLE ?auto_26577 ) ( SURFACE-AT ?auto_26576 ?auto_26583 ) ( ON ?auto_26576 ?auto_26581 ) ( CLEAR ?auto_26576 ) ( not ( = ?auto_26575 ?auto_26581 ) ) ( not ( = ?auto_26576 ?auto_26581 ) ) ( not ( = ?auto_26574 ?auto_26581 ) ) ( SURFACE-AT ?auto_26574 ?auto_26578 ) ( CLEAR ?auto_26574 ) ( IS-CRATE ?auto_26575 ) ( AVAILABLE ?auto_26579 ) ( not ( = ?auto_26582 ?auto_26578 ) ) ( not ( = ?auto_26583 ?auto_26582 ) ) ( HOIST-AT ?auto_26585 ?auto_26582 ) ( not ( = ?auto_26579 ?auto_26585 ) ) ( not ( = ?auto_26577 ?auto_26585 ) ) ( AVAILABLE ?auto_26585 ) ( SURFACE-AT ?auto_26575 ?auto_26582 ) ( ON ?auto_26575 ?auto_26584 ) ( CLEAR ?auto_26575 ) ( not ( = ?auto_26575 ?auto_26584 ) ) ( not ( = ?auto_26576 ?auto_26584 ) ) ( not ( = ?auto_26574 ?auto_26584 ) ) ( not ( = ?auto_26581 ?auto_26584 ) ) ( TRUCK-AT ?auto_26580 ?auto_26578 ) ( ON ?auto_26572 ?auto_26571 ) ( ON ?auto_26573 ?auto_26572 ) ( ON ?auto_26574 ?auto_26573 ) ( not ( = ?auto_26571 ?auto_26572 ) ) ( not ( = ?auto_26571 ?auto_26573 ) ) ( not ( = ?auto_26571 ?auto_26574 ) ) ( not ( = ?auto_26571 ?auto_26575 ) ) ( not ( = ?auto_26571 ?auto_26576 ) ) ( not ( = ?auto_26571 ?auto_26581 ) ) ( not ( = ?auto_26571 ?auto_26584 ) ) ( not ( = ?auto_26572 ?auto_26573 ) ) ( not ( = ?auto_26572 ?auto_26574 ) ) ( not ( = ?auto_26572 ?auto_26575 ) ) ( not ( = ?auto_26572 ?auto_26576 ) ) ( not ( = ?auto_26572 ?auto_26581 ) ) ( not ( = ?auto_26572 ?auto_26584 ) ) ( not ( = ?auto_26573 ?auto_26574 ) ) ( not ( = ?auto_26573 ?auto_26575 ) ) ( not ( = ?auto_26573 ?auto_26576 ) ) ( not ( = ?auto_26573 ?auto_26581 ) ) ( not ( = ?auto_26573 ?auto_26584 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26574 ?auto_26575 ?auto_26576 )
      ( MAKE-5CRATE-VERIFY ?auto_26571 ?auto_26572 ?auto_26573 ?auto_26574 ?auto_26575 ?auto_26576 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26586 - SURFACE
      ?auto_26587 - SURFACE
    )
    :vars
    (
      ?auto_26591 - HOIST
      ?auto_26590 - PLACE
      ?auto_26588 - SURFACE
      ?auto_26595 - PLACE
      ?auto_26589 - HOIST
      ?auto_26593 - SURFACE
      ?auto_26594 - PLACE
      ?auto_26597 - HOIST
      ?auto_26596 - SURFACE
      ?auto_26592 - TRUCK
      ?auto_26598 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26591 ?auto_26590 ) ( IS-CRATE ?auto_26587 ) ( not ( = ?auto_26586 ?auto_26587 ) ) ( not ( = ?auto_26588 ?auto_26586 ) ) ( not ( = ?auto_26588 ?auto_26587 ) ) ( not ( = ?auto_26595 ?auto_26590 ) ) ( HOIST-AT ?auto_26589 ?auto_26595 ) ( not ( = ?auto_26591 ?auto_26589 ) ) ( AVAILABLE ?auto_26589 ) ( SURFACE-AT ?auto_26587 ?auto_26595 ) ( ON ?auto_26587 ?auto_26593 ) ( CLEAR ?auto_26587 ) ( not ( = ?auto_26586 ?auto_26593 ) ) ( not ( = ?auto_26587 ?auto_26593 ) ) ( not ( = ?auto_26588 ?auto_26593 ) ) ( IS-CRATE ?auto_26586 ) ( not ( = ?auto_26594 ?auto_26590 ) ) ( not ( = ?auto_26595 ?auto_26594 ) ) ( HOIST-AT ?auto_26597 ?auto_26594 ) ( not ( = ?auto_26591 ?auto_26597 ) ) ( not ( = ?auto_26589 ?auto_26597 ) ) ( AVAILABLE ?auto_26597 ) ( SURFACE-AT ?auto_26586 ?auto_26594 ) ( ON ?auto_26586 ?auto_26596 ) ( CLEAR ?auto_26586 ) ( not ( = ?auto_26586 ?auto_26596 ) ) ( not ( = ?auto_26587 ?auto_26596 ) ) ( not ( = ?auto_26588 ?auto_26596 ) ) ( not ( = ?auto_26593 ?auto_26596 ) ) ( TRUCK-AT ?auto_26592 ?auto_26590 ) ( SURFACE-AT ?auto_26598 ?auto_26590 ) ( CLEAR ?auto_26598 ) ( LIFTING ?auto_26591 ?auto_26588 ) ( IS-CRATE ?auto_26588 ) ( not ( = ?auto_26598 ?auto_26588 ) ) ( not ( = ?auto_26586 ?auto_26598 ) ) ( not ( = ?auto_26587 ?auto_26598 ) ) ( not ( = ?auto_26593 ?auto_26598 ) ) ( not ( = ?auto_26596 ?auto_26598 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26598 ?auto_26588 )
      ( MAKE-2CRATE ?auto_26588 ?auto_26586 ?auto_26587 )
      ( MAKE-1CRATE-VERIFY ?auto_26586 ?auto_26587 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26599 - SURFACE
      ?auto_26600 - SURFACE
      ?auto_26601 - SURFACE
    )
    :vars
    (
      ?auto_26605 - HOIST
      ?auto_26603 - PLACE
      ?auto_26606 - PLACE
      ?auto_26609 - HOIST
      ?auto_26602 - SURFACE
      ?auto_26604 - PLACE
      ?auto_26611 - HOIST
      ?auto_26608 - SURFACE
      ?auto_26607 - TRUCK
      ?auto_26610 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26605 ?auto_26603 ) ( IS-CRATE ?auto_26601 ) ( not ( = ?auto_26600 ?auto_26601 ) ) ( not ( = ?auto_26599 ?auto_26600 ) ) ( not ( = ?auto_26599 ?auto_26601 ) ) ( not ( = ?auto_26606 ?auto_26603 ) ) ( HOIST-AT ?auto_26609 ?auto_26606 ) ( not ( = ?auto_26605 ?auto_26609 ) ) ( AVAILABLE ?auto_26609 ) ( SURFACE-AT ?auto_26601 ?auto_26606 ) ( ON ?auto_26601 ?auto_26602 ) ( CLEAR ?auto_26601 ) ( not ( = ?auto_26600 ?auto_26602 ) ) ( not ( = ?auto_26601 ?auto_26602 ) ) ( not ( = ?auto_26599 ?auto_26602 ) ) ( IS-CRATE ?auto_26600 ) ( not ( = ?auto_26604 ?auto_26603 ) ) ( not ( = ?auto_26606 ?auto_26604 ) ) ( HOIST-AT ?auto_26611 ?auto_26604 ) ( not ( = ?auto_26605 ?auto_26611 ) ) ( not ( = ?auto_26609 ?auto_26611 ) ) ( AVAILABLE ?auto_26611 ) ( SURFACE-AT ?auto_26600 ?auto_26604 ) ( ON ?auto_26600 ?auto_26608 ) ( CLEAR ?auto_26600 ) ( not ( = ?auto_26600 ?auto_26608 ) ) ( not ( = ?auto_26601 ?auto_26608 ) ) ( not ( = ?auto_26599 ?auto_26608 ) ) ( not ( = ?auto_26602 ?auto_26608 ) ) ( TRUCK-AT ?auto_26607 ?auto_26603 ) ( SURFACE-AT ?auto_26610 ?auto_26603 ) ( CLEAR ?auto_26610 ) ( LIFTING ?auto_26605 ?auto_26599 ) ( IS-CRATE ?auto_26599 ) ( not ( = ?auto_26610 ?auto_26599 ) ) ( not ( = ?auto_26600 ?auto_26610 ) ) ( not ( = ?auto_26601 ?auto_26610 ) ) ( not ( = ?auto_26602 ?auto_26610 ) ) ( not ( = ?auto_26608 ?auto_26610 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26600 ?auto_26601 )
      ( MAKE-2CRATE-VERIFY ?auto_26599 ?auto_26600 ?auto_26601 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26612 - SURFACE
      ?auto_26613 - SURFACE
      ?auto_26614 - SURFACE
      ?auto_26615 - SURFACE
    )
    :vars
    (
      ?auto_26620 - HOIST
      ?auto_26618 - PLACE
      ?auto_26622 - PLACE
      ?auto_26616 - HOIST
      ?auto_26623 - SURFACE
      ?auto_26617 - PLACE
      ?auto_26624 - HOIST
      ?auto_26621 - SURFACE
      ?auto_26619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26620 ?auto_26618 ) ( IS-CRATE ?auto_26615 ) ( not ( = ?auto_26614 ?auto_26615 ) ) ( not ( = ?auto_26613 ?auto_26614 ) ) ( not ( = ?auto_26613 ?auto_26615 ) ) ( not ( = ?auto_26622 ?auto_26618 ) ) ( HOIST-AT ?auto_26616 ?auto_26622 ) ( not ( = ?auto_26620 ?auto_26616 ) ) ( AVAILABLE ?auto_26616 ) ( SURFACE-AT ?auto_26615 ?auto_26622 ) ( ON ?auto_26615 ?auto_26623 ) ( CLEAR ?auto_26615 ) ( not ( = ?auto_26614 ?auto_26623 ) ) ( not ( = ?auto_26615 ?auto_26623 ) ) ( not ( = ?auto_26613 ?auto_26623 ) ) ( IS-CRATE ?auto_26614 ) ( not ( = ?auto_26617 ?auto_26618 ) ) ( not ( = ?auto_26622 ?auto_26617 ) ) ( HOIST-AT ?auto_26624 ?auto_26617 ) ( not ( = ?auto_26620 ?auto_26624 ) ) ( not ( = ?auto_26616 ?auto_26624 ) ) ( AVAILABLE ?auto_26624 ) ( SURFACE-AT ?auto_26614 ?auto_26617 ) ( ON ?auto_26614 ?auto_26621 ) ( CLEAR ?auto_26614 ) ( not ( = ?auto_26614 ?auto_26621 ) ) ( not ( = ?auto_26615 ?auto_26621 ) ) ( not ( = ?auto_26613 ?auto_26621 ) ) ( not ( = ?auto_26623 ?auto_26621 ) ) ( TRUCK-AT ?auto_26619 ?auto_26618 ) ( SURFACE-AT ?auto_26612 ?auto_26618 ) ( CLEAR ?auto_26612 ) ( LIFTING ?auto_26620 ?auto_26613 ) ( IS-CRATE ?auto_26613 ) ( not ( = ?auto_26612 ?auto_26613 ) ) ( not ( = ?auto_26614 ?auto_26612 ) ) ( not ( = ?auto_26615 ?auto_26612 ) ) ( not ( = ?auto_26623 ?auto_26612 ) ) ( not ( = ?auto_26621 ?auto_26612 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26613 ?auto_26614 ?auto_26615 )
      ( MAKE-3CRATE-VERIFY ?auto_26612 ?auto_26613 ?auto_26614 ?auto_26615 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26625 - SURFACE
      ?auto_26626 - SURFACE
      ?auto_26627 - SURFACE
      ?auto_26628 - SURFACE
      ?auto_26629 - SURFACE
    )
    :vars
    (
      ?auto_26634 - HOIST
      ?auto_26632 - PLACE
      ?auto_26636 - PLACE
      ?auto_26630 - HOIST
      ?auto_26637 - SURFACE
      ?auto_26631 - PLACE
      ?auto_26638 - HOIST
      ?auto_26635 - SURFACE
      ?auto_26633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26634 ?auto_26632 ) ( IS-CRATE ?auto_26629 ) ( not ( = ?auto_26628 ?auto_26629 ) ) ( not ( = ?auto_26627 ?auto_26628 ) ) ( not ( = ?auto_26627 ?auto_26629 ) ) ( not ( = ?auto_26636 ?auto_26632 ) ) ( HOIST-AT ?auto_26630 ?auto_26636 ) ( not ( = ?auto_26634 ?auto_26630 ) ) ( AVAILABLE ?auto_26630 ) ( SURFACE-AT ?auto_26629 ?auto_26636 ) ( ON ?auto_26629 ?auto_26637 ) ( CLEAR ?auto_26629 ) ( not ( = ?auto_26628 ?auto_26637 ) ) ( not ( = ?auto_26629 ?auto_26637 ) ) ( not ( = ?auto_26627 ?auto_26637 ) ) ( IS-CRATE ?auto_26628 ) ( not ( = ?auto_26631 ?auto_26632 ) ) ( not ( = ?auto_26636 ?auto_26631 ) ) ( HOIST-AT ?auto_26638 ?auto_26631 ) ( not ( = ?auto_26634 ?auto_26638 ) ) ( not ( = ?auto_26630 ?auto_26638 ) ) ( AVAILABLE ?auto_26638 ) ( SURFACE-AT ?auto_26628 ?auto_26631 ) ( ON ?auto_26628 ?auto_26635 ) ( CLEAR ?auto_26628 ) ( not ( = ?auto_26628 ?auto_26635 ) ) ( not ( = ?auto_26629 ?auto_26635 ) ) ( not ( = ?auto_26627 ?auto_26635 ) ) ( not ( = ?auto_26637 ?auto_26635 ) ) ( TRUCK-AT ?auto_26633 ?auto_26632 ) ( SURFACE-AT ?auto_26626 ?auto_26632 ) ( CLEAR ?auto_26626 ) ( LIFTING ?auto_26634 ?auto_26627 ) ( IS-CRATE ?auto_26627 ) ( not ( = ?auto_26626 ?auto_26627 ) ) ( not ( = ?auto_26628 ?auto_26626 ) ) ( not ( = ?auto_26629 ?auto_26626 ) ) ( not ( = ?auto_26637 ?auto_26626 ) ) ( not ( = ?auto_26635 ?auto_26626 ) ) ( ON ?auto_26626 ?auto_26625 ) ( not ( = ?auto_26625 ?auto_26626 ) ) ( not ( = ?auto_26625 ?auto_26627 ) ) ( not ( = ?auto_26625 ?auto_26628 ) ) ( not ( = ?auto_26625 ?auto_26629 ) ) ( not ( = ?auto_26625 ?auto_26637 ) ) ( not ( = ?auto_26625 ?auto_26635 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26627 ?auto_26628 ?auto_26629 )
      ( MAKE-4CRATE-VERIFY ?auto_26625 ?auto_26626 ?auto_26627 ?auto_26628 ?auto_26629 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26639 - SURFACE
      ?auto_26640 - SURFACE
      ?auto_26641 - SURFACE
      ?auto_26642 - SURFACE
      ?auto_26643 - SURFACE
      ?auto_26644 - SURFACE
    )
    :vars
    (
      ?auto_26649 - HOIST
      ?auto_26647 - PLACE
      ?auto_26651 - PLACE
      ?auto_26645 - HOIST
      ?auto_26652 - SURFACE
      ?auto_26646 - PLACE
      ?auto_26653 - HOIST
      ?auto_26650 - SURFACE
      ?auto_26648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26649 ?auto_26647 ) ( IS-CRATE ?auto_26644 ) ( not ( = ?auto_26643 ?auto_26644 ) ) ( not ( = ?auto_26642 ?auto_26643 ) ) ( not ( = ?auto_26642 ?auto_26644 ) ) ( not ( = ?auto_26651 ?auto_26647 ) ) ( HOIST-AT ?auto_26645 ?auto_26651 ) ( not ( = ?auto_26649 ?auto_26645 ) ) ( AVAILABLE ?auto_26645 ) ( SURFACE-AT ?auto_26644 ?auto_26651 ) ( ON ?auto_26644 ?auto_26652 ) ( CLEAR ?auto_26644 ) ( not ( = ?auto_26643 ?auto_26652 ) ) ( not ( = ?auto_26644 ?auto_26652 ) ) ( not ( = ?auto_26642 ?auto_26652 ) ) ( IS-CRATE ?auto_26643 ) ( not ( = ?auto_26646 ?auto_26647 ) ) ( not ( = ?auto_26651 ?auto_26646 ) ) ( HOIST-AT ?auto_26653 ?auto_26646 ) ( not ( = ?auto_26649 ?auto_26653 ) ) ( not ( = ?auto_26645 ?auto_26653 ) ) ( AVAILABLE ?auto_26653 ) ( SURFACE-AT ?auto_26643 ?auto_26646 ) ( ON ?auto_26643 ?auto_26650 ) ( CLEAR ?auto_26643 ) ( not ( = ?auto_26643 ?auto_26650 ) ) ( not ( = ?auto_26644 ?auto_26650 ) ) ( not ( = ?auto_26642 ?auto_26650 ) ) ( not ( = ?auto_26652 ?auto_26650 ) ) ( TRUCK-AT ?auto_26648 ?auto_26647 ) ( SURFACE-AT ?auto_26641 ?auto_26647 ) ( CLEAR ?auto_26641 ) ( LIFTING ?auto_26649 ?auto_26642 ) ( IS-CRATE ?auto_26642 ) ( not ( = ?auto_26641 ?auto_26642 ) ) ( not ( = ?auto_26643 ?auto_26641 ) ) ( not ( = ?auto_26644 ?auto_26641 ) ) ( not ( = ?auto_26652 ?auto_26641 ) ) ( not ( = ?auto_26650 ?auto_26641 ) ) ( ON ?auto_26640 ?auto_26639 ) ( ON ?auto_26641 ?auto_26640 ) ( not ( = ?auto_26639 ?auto_26640 ) ) ( not ( = ?auto_26639 ?auto_26641 ) ) ( not ( = ?auto_26639 ?auto_26642 ) ) ( not ( = ?auto_26639 ?auto_26643 ) ) ( not ( = ?auto_26639 ?auto_26644 ) ) ( not ( = ?auto_26639 ?auto_26652 ) ) ( not ( = ?auto_26639 ?auto_26650 ) ) ( not ( = ?auto_26640 ?auto_26641 ) ) ( not ( = ?auto_26640 ?auto_26642 ) ) ( not ( = ?auto_26640 ?auto_26643 ) ) ( not ( = ?auto_26640 ?auto_26644 ) ) ( not ( = ?auto_26640 ?auto_26652 ) ) ( not ( = ?auto_26640 ?auto_26650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26642 ?auto_26643 ?auto_26644 )
      ( MAKE-5CRATE-VERIFY ?auto_26639 ?auto_26640 ?auto_26641 ?auto_26642 ?auto_26643 ?auto_26644 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26654 - SURFACE
      ?auto_26655 - SURFACE
    )
    :vars
    (
      ?auto_26662 - HOIST
      ?auto_26659 - PLACE
      ?auto_26661 - SURFACE
      ?auto_26664 - PLACE
      ?auto_26656 - HOIST
      ?auto_26665 - SURFACE
      ?auto_26658 - PLACE
      ?auto_26666 - HOIST
      ?auto_26663 - SURFACE
      ?auto_26660 - TRUCK
      ?auto_26657 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26662 ?auto_26659 ) ( IS-CRATE ?auto_26655 ) ( not ( = ?auto_26654 ?auto_26655 ) ) ( not ( = ?auto_26661 ?auto_26654 ) ) ( not ( = ?auto_26661 ?auto_26655 ) ) ( not ( = ?auto_26664 ?auto_26659 ) ) ( HOIST-AT ?auto_26656 ?auto_26664 ) ( not ( = ?auto_26662 ?auto_26656 ) ) ( AVAILABLE ?auto_26656 ) ( SURFACE-AT ?auto_26655 ?auto_26664 ) ( ON ?auto_26655 ?auto_26665 ) ( CLEAR ?auto_26655 ) ( not ( = ?auto_26654 ?auto_26665 ) ) ( not ( = ?auto_26655 ?auto_26665 ) ) ( not ( = ?auto_26661 ?auto_26665 ) ) ( IS-CRATE ?auto_26654 ) ( not ( = ?auto_26658 ?auto_26659 ) ) ( not ( = ?auto_26664 ?auto_26658 ) ) ( HOIST-AT ?auto_26666 ?auto_26658 ) ( not ( = ?auto_26662 ?auto_26666 ) ) ( not ( = ?auto_26656 ?auto_26666 ) ) ( AVAILABLE ?auto_26666 ) ( SURFACE-AT ?auto_26654 ?auto_26658 ) ( ON ?auto_26654 ?auto_26663 ) ( CLEAR ?auto_26654 ) ( not ( = ?auto_26654 ?auto_26663 ) ) ( not ( = ?auto_26655 ?auto_26663 ) ) ( not ( = ?auto_26661 ?auto_26663 ) ) ( not ( = ?auto_26665 ?auto_26663 ) ) ( TRUCK-AT ?auto_26660 ?auto_26659 ) ( SURFACE-AT ?auto_26657 ?auto_26659 ) ( CLEAR ?auto_26657 ) ( IS-CRATE ?auto_26661 ) ( not ( = ?auto_26657 ?auto_26661 ) ) ( not ( = ?auto_26654 ?auto_26657 ) ) ( not ( = ?auto_26655 ?auto_26657 ) ) ( not ( = ?auto_26665 ?auto_26657 ) ) ( not ( = ?auto_26663 ?auto_26657 ) ) ( AVAILABLE ?auto_26662 ) ( IN ?auto_26661 ?auto_26660 ) )
    :subtasks
    ( ( !UNLOAD ?auto_26662 ?auto_26661 ?auto_26660 ?auto_26659 )
      ( MAKE-2CRATE ?auto_26661 ?auto_26654 ?auto_26655 )
      ( MAKE-1CRATE-VERIFY ?auto_26654 ?auto_26655 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26667 - SURFACE
      ?auto_26668 - SURFACE
      ?auto_26669 - SURFACE
    )
    :vars
    (
      ?auto_26675 - HOIST
      ?auto_26678 - PLACE
      ?auto_26676 - PLACE
      ?auto_26672 - HOIST
      ?auto_26677 - SURFACE
      ?auto_26673 - PLACE
      ?auto_26674 - HOIST
      ?auto_26679 - SURFACE
      ?auto_26671 - TRUCK
      ?auto_26670 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26675 ?auto_26678 ) ( IS-CRATE ?auto_26669 ) ( not ( = ?auto_26668 ?auto_26669 ) ) ( not ( = ?auto_26667 ?auto_26668 ) ) ( not ( = ?auto_26667 ?auto_26669 ) ) ( not ( = ?auto_26676 ?auto_26678 ) ) ( HOIST-AT ?auto_26672 ?auto_26676 ) ( not ( = ?auto_26675 ?auto_26672 ) ) ( AVAILABLE ?auto_26672 ) ( SURFACE-AT ?auto_26669 ?auto_26676 ) ( ON ?auto_26669 ?auto_26677 ) ( CLEAR ?auto_26669 ) ( not ( = ?auto_26668 ?auto_26677 ) ) ( not ( = ?auto_26669 ?auto_26677 ) ) ( not ( = ?auto_26667 ?auto_26677 ) ) ( IS-CRATE ?auto_26668 ) ( not ( = ?auto_26673 ?auto_26678 ) ) ( not ( = ?auto_26676 ?auto_26673 ) ) ( HOIST-AT ?auto_26674 ?auto_26673 ) ( not ( = ?auto_26675 ?auto_26674 ) ) ( not ( = ?auto_26672 ?auto_26674 ) ) ( AVAILABLE ?auto_26674 ) ( SURFACE-AT ?auto_26668 ?auto_26673 ) ( ON ?auto_26668 ?auto_26679 ) ( CLEAR ?auto_26668 ) ( not ( = ?auto_26668 ?auto_26679 ) ) ( not ( = ?auto_26669 ?auto_26679 ) ) ( not ( = ?auto_26667 ?auto_26679 ) ) ( not ( = ?auto_26677 ?auto_26679 ) ) ( TRUCK-AT ?auto_26671 ?auto_26678 ) ( SURFACE-AT ?auto_26670 ?auto_26678 ) ( CLEAR ?auto_26670 ) ( IS-CRATE ?auto_26667 ) ( not ( = ?auto_26670 ?auto_26667 ) ) ( not ( = ?auto_26668 ?auto_26670 ) ) ( not ( = ?auto_26669 ?auto_26670 ) ) ( not ( = ?auto_26677 ?auto_26670 ) ) ( not ( = ?auto_26679 ?auto_26670 ) ) ( AVAILABLE ?auto_26675 ) ( IN ?auto_26667 ?auto_26671 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26668 ?auto_26669 )
      ( MAKE-2CRATE-VERIFY ?auto_26667 ?auto_26668 ?auto_26669 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26680 - SURFACE
      ?auto_26681 - SURFACE
      ?auto_26682 - SURFACE
      ?auto_26683 - SURFACE
    )
    :vars
    (
      ?auto_26686 - HOIST
      ?auto_26684 - PLACE
      ?auto_26688 - PLACE
      ?auto_26690 - HOIST
      ?auto_26692 - SURFACE
      ?auto_26687 - PLACE
      ?auto_26689 - HOIST
      ?auto_26691 - SURFACE
      ?auto_26685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26686 ?auto_26684 ) ( IS-CRATE ?auto_26683 ) ( not ( = ?auto_26682 ?auto_26683 ) ) ( not ( = ?auto_26681 ?auto_26682 ) ) ( not ( = ?auto_26681 ?auto_26683 ) ) ( not ( = ?auto_26688 ?auto_26684 ) ) ( HOIST-AT ?auto_26690 ?auto_26688 ) ( not ( = ?auto_26686 ?auto_26690 ) ) ( AVAILABLE ?auto_26690 ) ( SURFACE-AT ?auto_26683 ?auto_26688 ) ( ON ?auto_26683 ?auto_26692 ) ( CLEAR ?auto_26683 ) ( not ( = ?auto_26682 ?auto_26692 ) ) ( not ( = ?auto_26683 ?auto_26692 ) ) ( not ( = ?auto_26681 ?auto_26692 ) ) ( IS-CRATE ?auto_26682 ) ( not ( = ?auto_26687 ?auto_26684 ) ) ( not ( = ?auto_26688 ?auto_26687 ) ) ( HOIST-AT ?auto_26689 ?auto_26687 ) ( not ( = ?auto_26686 ?auto_26689 ) ) ( not ( = ?auto_26690 ?auto_26689 ) ) ( AVAILABLE ?auto_26689 ) ( SURFACE-AT ?auto_26682 ?auto_26687 ) ( ON ?auto_26682 ?auto_26691 ) ( CLEAR ?auto_26682 ) ( not ( = ?auto_26682 ?auto_26691 ) ) ( not ( = ?auto_26683 ?auto_26691 ) ) ( not ( = ?auto_26681 ?auto_26691 ) ) ( not ( = ?auto_26692 ?auto_26691 ) ) ( TRUCK-AT ?auto_26685 ?auto_26684 ) ( SURFACE-AT ?auto_26680 ?auto_26684 ) ( CLEAR ?auto_26680 ) ( IS-CRATE ?auto_26681 ) ( not ( = ?auto_26680 ?auto_26681 ) ) ( not ( = ?auto_26682 ?auto_26680 ) ) ( not ( = ?auto_26683 ?auto_26680 ) ) ( not ( = ?auto_26692 ?auto_26680 ) ) ( not ( = ?auto_26691 ?auto_26680 ) ) ( AVAILABLE ?auto_26686 ) ( IN ?auto_26681 ?auto_26685 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26681 ?auto_26682 ?auto_26683 )
      ( MAKE-3CRATE-VERIFY ?auto_26680 ?auto_26681 ?auto_26682 ?auto_26683 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26693 - SURFACE
      ?auto_26694 - SURFACE
      ?auto_26695 - SURFACE
      ?auto_26696 - SURFACE
      ?auto_26697 - SURFACE
    )
    :vars
    (
      ?auto_26700 - HOIST
      ?auto_26698 - PLACE
      ?auto_26702 - PLACE
      ?auto_26704 - HOIST
      ?auto_26706 - SURFACE
      ?auto_26701 - PLACE
      ?auto_26703 - HOIST
      ?auto_26705 - SURFACE
      ?auto_26699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26700 ?auto_26698 ) ( IS-CRATE ?auto_26697 ) ( not ( = ?auto_26696 ?auto_26697 ) ) ( not ( = ?auto_26695 ?auto_26696 ) ) ( not ( = ?auto_26695 ?auto_26697 ) ) ( not ( = ?auto_26702 ?auto_26698 ) ) ( HOIST-AT ?auto_26704 ?auto_26702 ) ( not ( = ?auto_26700 ?auto_26704 ) ) ( AVAILABLE ?auto_26704 ) ( SURFACE-AT ?auto_26697 ?auto_26702 ) ( ON ?auto_26697 ?auto_26706 ) ( CLEAR ?auto_26697 ) ( not ( = ?auto_26696 ?auto_26706 ) ) ( not ( = ?auto_26697 ?auto_26706 ) ) ( not ( = ?auto_26695 ?auto_26706 ) ) ( IS-CRATE ?auto_26696 ) ( not ( = ?auto_26701 ?auto_26698 ) ) ( not ( = ?auto_26702 ?auto_26701 ) ) ( HOIST-AT ?auto_26703 ?auto_26701 ) ( not ( = ?auto_26700 ?auto_26703 ) ) ( not ( = ?auto_26704 ?auto_26703 ) ) ( AVAILABLE ?auto_26703 ) ( SURFACE-AT ?auto_26696 ?auto_26701 ) ( ON ?auto_26696 ?auto_26705 ) ( CLEAR ?auto_26696 ) ( not ( = ?auto_26696 ?auto_26705 ) ) ( not ( = ?auto_26697 ?auto_26705 ) ) ( not ( = ?auto_26695 ?auto_26705 ) ) ( not ( = ?auto_26706 ?auto_26705 ) ) ( TRUCK-AT ?auto_26699 ?auto_26698 ) ( SURFACE-AT ?auto_26694 ?auto_26698 ) ( CLEAR ?auto_26694 ) ( IS-CRATE ?auto_26695 ) ( not ( = ?auto_26694 ?auto_26695 ) ) ( not ( = ?auto_26696 ?auto_26694 ) ) ( not ( = ?auto_26697 ?auto_26694 ) ) ( not ( = ?auto_26706 ?auto_26694 ) ) ( not ( = ?auto_26705 ?auto_26694 ) ) ( AVAILABLE ?auto_26700 ) ( IN ?auto_26695 ?auto_26699 ) ( ON ?auto_26694 ?auto_26693 ) ( not ( = ?auto_26693 ?auto_26694 ) ) ( not ( = ?auto_26693 ?auto_26695 ) ) ( not ( = ?auto_26693 ?auto_26696 ) ) ( not ( = ?auto_26693 ?auto_26697 ) ) ( not ( = ?auto_26693 ?auto_26706 ) ) ( not ( = ?auto_26693 ?auto_26705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26695 ?auto_26696 ?auto_26697 )
      ( MAKE-4CRATE-VERIFY ?auto_26693 ?auto_26694 ?auto_26695 ?auto_26696 ?auto_26697 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26707 - SURFACE
      ?auto_26708 - SURFACE
      ?auto_26709 - SURFACE
      ?auto_26710 - SURFACE
      ?auto_26711 - SURFACE
      ?auto_26712 - SURFACE
    )
    :vars
    (
      ?auto_26715 - HOIST
      ?auto_26713 - PLACE
      ?auto_26717 - PLACE
      ?auto_26719 - HOIST
      ?auto_26721 - SURFACE
      ?auto_26716 - PLACE
      ?auto_26718 - HOIST
      ?auto_26720 - SURFACE
      ?auto_26714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26715 ?auto_26713 ) ( IS-CRATE ?auto_26712 ) ( not ( = ?auto_26711 ?auto_26712 ) ) ( not ( = ?auto_26710 ?auto_26711 ) ) ( not ( = ?auto_26710 ?auto_26712 ) ) ( not ( = ?auto_26717 ?auto_26713 ) ) ( HOIST-AT ?auto_26719 ?auto_26717 ) ( not ( = ?auto_26715 ?auto_26719 ) ) ( AVAILABLE ?auto_26719 ) ( SURFACE-AT ?auto_26712 ?auto_26717 ) ( ON ?auto_26712 ?auto_26721 ) ( CLEAR ?auto_26712 ) ( not ( = ?auto_26711 ?auto_26721 ) ) ( not ( = ?auto_26712 ?auto_26721 ) ) ( not ( = ?auto_26710 ?auto_26721 ) ) ( IS-CRATE ?auto_26711 ) ( not ( = ?auto_26716 ?auto_26713 ) ) ( not ( = ?auto_26717 ?auto_26716 ) ) ( HOIST-AT ?auto_26718 ?auto_26716 ) ( not ( = ?auto_26715 ?auto_26718 ) ) ( not ( = ?auto_26719 ?auto_26718 ) ) ( AVAILABLE ?auto_26718 ) ( SURFACE-AT ?auto_26711 ?auto_26716 ) ( ON ?auto_26711 ?auto_26720 ) ( CLEAR ?auto_26711 ) ( not ( = ?auto_26711 ?auto_26720 ) ) ( not ( = ?auto_26712 ?auto_26720 ) ) ( not ( = ?auto_26710 ?auto_26720 ) ) ( not ( = ?auto_26721 ?auto_26720 ) ) ( TRUCK-AT ?auto_26714 ?auto_26713 ) ( SURFACE-AT ?auto_26709 ?auto_26713 ) ( CLEAR ?auto_26709 ) ( IS-CRATE ?auto_26710 ) ( not ( = ?auto_26709 ?auto_26710 ) ) ( not ( = ?auto_26711 ?auto_26709 ) ) ( not ( = ?auto_26712 ?auto_26709 ) ) ( not ( = ?auto_26721 ?auto_26709 ) ) ( not ( = ?auto_26720 ?auto_26709 ) ) ( AVAILABLE ?auto_26715 ) ( IN ?auto_26710 ?auto_26714 ) ( ON ?auto_26708 ?auto_26707 ) ( ON ?auto_26709 ?auto_26708 ) ( not ( = ?auto_26707 ?auto_26708 ) ) ( not ( = ?auto_26707 ?auto_26709 ) ) ( not ( = ?auto_26707 ?auto_26710 ) ) ( not ( = ?auto_26707 ?auto_26711 ) ) ( not ( = ?auto_26707 ?auto_26712 ) ) ( not ( = ?auto_26707 ?auto_26721 ) ) ( not ( = ?auto_26707 ?auto_26720 ) ) ( not ( = ?auto_26708 ?auto_26709 ) ) ( not ( = ?auto_26708 ?auto_26710 ) ) ( not ( = ?auto_26708 ?auto_26711 ) ) ( not ( = ?auto_26708 ?auto_26712 ) ) ( not ( = ?auto_26708 ?auto_26721 ) ) ( not ( = ?auto_26708 ?auto_26720 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26710 ?auto_26711 ?auto_26712 )
      ( MAKE-5CRATE-VERIFY ?auto_26707 ?auto_26708 ?auto_26709 ?auto_26710 ?auto_26711 ?auto_26712 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26722 - SURFACE
      ?auto_26723 - SURFACE
    )
    :vars
    (
      ?auto_26727 - HOIST
      ?auto_26725 - PLACE
      ?auto_26731 - SURFACE
      ?auto_26729 - PLACE
      ?auto_26732 - HOIST
      ?auto_26734 - SURFACE
      ?auto_26728 - PLACE
      ?auto_26730 - HOIST
      ?auto_26733 - SURFACE
      ?auto_26724 - SURFACE
      ?auto_26726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26727 ?auto_26725 ) ( IS-CRATE ?auto_26723 ) ( not ( = ?auto_26722 ?auto_26723 ) ) ( not ( = ?auto_26731 ?auto_26722 ) ) ( not ( = ?auto_26731 ?auto_26723 ) ) ( not ( = ?auto_26729 ?auto_26725 ) ) ( HOIST-AT ?auto_26732 ?auto_26729 ) ( not ( = ?auto_26727 ?auto_26732 ) ) ( AVAILABLE ?auto_26732 ) ( SURFACE-AT ?auto_26723 ?auto_26729 ) ( ON ?auto_26723 ?auto_26734 ) ( CLEAR ?auto_26723 ) ( not ( = ?auto_26722 ?auto_26734 ) ) ( not ( = ?auto_26723 ?auto_26734 ) ) ( not ( = ?auto_26731 ?auto_26734 ) ) ( IS-CRATE ?auto_26722 ) ( not ( = ?auto_26728 ?auto_26725 ) ) ( not ( = ?auto_26729 ?auto_26728 ) ) ( HOIST-AT ?auto_26730 ?auto_26728 ) ( not ( = ?auto_26727 ?auto_26730 ) ) ( not ( = ?auto_26732 ?auto_26730 ) ) ( AVAILABLE ?auto_26730 ) ( SURFACE-AT ?auto_26722 ?auto_26728 ) ( ON ?auto_26722 ?auto_26733 ) ( CLEAR ?auto_26722 ) ( not ( = ?auto_26722 ?auto_26733 ) ) ( not ( = ?auto_26723 ?auto_26733 ) ) ( not ( = ?auto_26731 ?auto_26733 ) ) ( not ( = ?auto_26734 ?auto_26733 ) ) ( SURFACE-AT ?auto_26724 ?auto_26725 ) ( CLEAR ?auto_26724 ) ( IS-CRATE ?auto_26731 ) ( not ( = ?auto_26724 ?auto_26731 ) ) ( not ( = ?auto_26722 ?auto_26724 ) ) ( not ( = ?auto_26723 ?auto_26724 ) ) ( not ( = ?auto_26734 ?auto_26724 ) ) ( not ( = ?auto_26733 ?auto_26724 ) ) ( AVAILABLE ?auto_26727 ) ( IN ?auto_26731 ?auto_26726 ) ( TRUCK-AT ?auto_26726 ?auto_26728 ) )
    :subtasks
    ( ( !DRIVE ?auto_26726 ?auto_26728 ?auto_26725 )
      ( MAKE-2CRATE ?auto_26731 ?auto_26722 ?auto_26723 )
      ( MAKE-1CRATE-VERIFY ?auto_26722 ?auto_26723 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26735 - SURFACE
      ?auto_26736 - SURFACE
      ?auto_26737 - SURFACE
    )
    :vars
    (
      ?auto_26743 - HOIST
      ?auto_26739 - PLACE
      ?auto_26745 - PLACE
      ?auto_26747 - HOIST
      ?auto_26741 - SURFACE
      ?auto_26746 - PLACE
      ?auto_26742 - HOIST
      ?auto_26740 - SURFACE
      ?auto_26738 - SURFACE
      ?auto_26744 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26743 ?auto_26739 ) ( IS-CRATE ?auto_26737 ) ( not ( = ?auto_26736 ?auto_26737 ) ) ( not ( = ?auto_26735 ?auto_26736 ) ) ( not ( = ?auto_26735 ?auto_26737 ) ) ( not ( = ?auto_26745 ?auto_26739 ) ) ( HOIST-AT ?auto_26747 ?auto_26745 ) ( not ( = ?auto_26743 ?auto_26747 ) ) ( AVAILABLE ?auto_26747 ) ( SURFACE-AT ?auto_26737 ?auto_26745 ) ( ON ?auto_26737 ?auto_26741 ) ( CLEAR ?auto_26737 ) ( not ( = ?auto_26736 ?auto_26741 ) ) ( not ( = ?auto_26737 ?auto_26741 ) ) ( not ( = ?auto_26735 ?auto_26741 ) ) ( IS-CRATE ?auto_26736 ) ( not ( = ?auto_26746 ?auto_26739 ) ) ( not ( = ?auto_26745 ?auto_26746 ) ) ( HOIST-AT ?auto_26742 ?auto_26746 ) ( not ( = ?auto_26743 ?auto_26742 ) ) ( not ( = ?auto_26747 ?auto_26742 ) ) ( AVAILABLE ?auto_26742 ) ( SURFACE-AT ?auto_26736 ?auto_26746 ) ( ON ?auto_26736 ?auto_26740 ) ( CLEAR ?auto_26736 ) ( not ( = ?auto_26736 ?auto_26740 ) ) ( not ( = ?auto_26737 ?auto_26740 ) ) ( not ( = ?auto_26735 ?auto_26740 ) ) ( not ( = ?auto_26741 ?auto_26740 ) ) ( SURFACE-AT ?auto_26738 ?auto_26739 ) ( CLEAR ?auto_26738 ) ( IS-CRATE ?auto_26735 ) ( not ( = ?auto_26738 ?auto_26735 ) ) ( not ( = ?auto_26736 ?auto_26738 ) ) ( not ( = ?auto_26737 ?auto_26738 ) ) ( not ( = ?auto_26741 ?auto_26738 ) ) ( not ( = ?auto_26740 ?auto_26738 ) ) ( AVAILABLE ?auto_26743 ) ( IN ?auto_26735 ?auto_26744 ) ( TRUCK-AT ?auto_26744 ?auto_26746 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26736 ?auto_26737 )
      ( MAKE-2CRATE-VERIFY ?auto_26735 ?auto_26736 ?auto_26737 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26748 - SURFACE
      ?auto_26749 - SURFACE
      ?auto_26750 - SURFACE
      ?auto_26751 - SURFACE
    )
    :vars
    (
      ?auto_26753 - HOIST
      ?auto_26757 - PLACE
      ?auto_26752 - PLACE
      ?auto_26760 - HOIST
      ?auto_26756 - SURFACE
      ?auto_26755 - PLACE
      ?auto_26758 - HOIST
      ?auto_26754 - SURFACE
      ?auto_26759 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26753 ?auto_26757 ) ( IS-CRATE ?auto_26751 ) ( not ( = ?auto_26750 ?auto_26751 ) ) ( not ( = ?auto_26749 ?auto_26750 ) ) ( not ( = ?auto_26749 ?auto_26751 ) ) ( not ( = ?auto_26752 ?auto_26757 ) ) ( HOIST-AT ?auto_26760 ?auto_26752 ) ( not ( = ?auto_26753 ?auto_26760 ) ) ( AVAILABLE ?auto_26760 ) ( SURFACE-AT ?auto_26751 ?auto_26752 ) ( ON ?auto_26751 ?auto_26756 ) ( CLEAR ?auto_26751 ) ( not ( = ?auto_26750 ?auto_26756 ) ) ( not ( = ?auto_26751 ?auto_26756 ) ) ( not ( = ?auto_26749 ?auto_26756 ) ) ( IS-CRATE ?auto_26750 ) ( not ( = ?auto_26755 ?auto_26757 ) ) ( not ( = ?auto_26752 ?auto_26755 ) ) ( HOIST-AT ?auto_26758 ?auto_26755 ) ( not ( = ?auto_26753 ?auto_26758 ) ) ( not ( = ?auto_26760 ?auto_26758 ) ) ( AVAILABLE ?auto_26758 ) ( SURFACE-AT ?auto_26750 ?auto_26755 ) ( ON ?auto_26750 ?auto_26754 ) ( CLEAR ?auto_26750 ) ( not ( = ?auto_26750 ?auto_26754 ) ) ( not ( = ?auto_26751 ?auto_26754 ) ) ( not ( = ?auto_26749 ?auto_26754 ) ) ( not ( = ?auto_26756 ?auto_26754 ) ) ( SURFACE-AT ?auto_26748 ?auto_26757 ) ( CLEAR ?auto_26748 ) ( IS-CRATE ?auto_26749 ) ( not ( = ?auto_26748 ?auto_26749 ) ) ( not ( = ?auto_26750 ?auto_26748 ) ) ( not ( = ?auto_26751 ?auto_26748 ) ) ( not ( = ?auto_26756 ?auto_26748 ) ) ( not ( = ?auto_26754 ?auto_26748 ) ) ( AVAILABLE ?auto_26753 ) ( IN ?auto_26749 ?auto_26759 ) ( TRUCK-AT ?auto_26759 ?auto_26755 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26749 ?auto_26750 ?auto_26751 )
      ( MAKE-3CRATE-VERIFY ?auto_26748 ?auto_26749 ?auto_26750 ?auto_26751 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26761 - SURFACE
      ?auto_26762 - SURFACE
      ?auto_26763 - SURFACE
      ?auto_26764 - SURFACE
      ?auto_26765 - SURFACE
    )
    :vars
    (
      ?auto_26767 - HOIST
      ?auto_26771 - PLACE
      ?auto_26766 - PLACE
      ?auto_26774 - HOIST
      ?auto_26770 - SURFACE
      ?auto_26769 - PLACE
      ?auto_26772 - HOIST
      ?auto_26768 - SURFACE
      ?auto_26773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26767 ?auto_26771 ) ( IS-CRATE ?auto_26765 ) ( not ( = ?auto_26764 ?auto_26765 ) ) ( not ( = ?auto_26763 ?auto_26764 ) ) ( not ( = ?auto_26763 ?auto_26765 ) ) ( not ( = ?auto_26766 ?auto_26771 ) ) ( HOIST-AT ?auto_26774 ?auto_26766 ) ( not ( = ?auto_26767 ?auto_26774 ) ) ( AVAILABLE ?auto_26774 ) ( SURFACE-AT ?auto_26765 ?auto_26766 ) ( ON ?auto_26765 ?auto_26770 ) ( CLEAR ?auto_26765 ) ( not ( = ?auto_26764 ?auto_26770 ) ) ( not ( = ?auto_26765 ?auto_26770 ) ) ( not ( = ?auto_26763 ?auto_26770 ) ) ( IS-CRATE ?auto_26764 ) ( not ( = ?auto_26769 ?auto_26771 ) ) ( not ( = ?auto_26766 ?auto_26769 ) ) ( HOIST-AT ?auto_26772 ?auto_26769 ) ( not ( = ?auto_26767 ?auto_26772 ) ) ( not ( = ?auto_26774 ?auto_26772 ) ) ( AVAILABLE ?auto_26772 ) ( SURFACE-AT ?auto_26764 ?auto_26769 ) ( ON ?auto_26764 ?auto_26768 ) ( CLEAR ?auto_26764 ) ( not ( = ?auto_26764 ?auto_26768 ) ) ( not ( = ?auto_26765 ?auto_26768 ) ) ( not ( = ?auto_26763 ?auto_26768 ) ) ( not ( = ?auto_26770 ?auto_26768 ) ) ( SURFACE-AT ?auto_26762 ?auto_26771 ) ( CLEAR ?auto_26762 ) ( IS-CRATE ?auto_26763 ) ( not ( = ?auto_26762 ?auto_26763 ) ) ( not ( = ?auto_26764 ?auto_26762 ) ) ( not ( = ?auto_26765 ?auto_26762 ) ) ( not ( = ?auto_26770 ?auto_26762 ) ) ( not ( = ?auto_26768 ?auto_26762 ) ) ( AVAILABLE ?auto_26767 ) ( IN ?auto_26763 ?auto_26773 ) ( TRUCK-AT ?auto_26773 ?auto_26769 ) ( ON ?auto_26762 ?auto_26761 ) ( not ( = ?auto_26761 ?auto_26762 ) ) ( not ( = ?auto_26761 ?auto_26763 ) ) ( not ( = ?auto_26761 ?auto_26764 ) ) ( not ( = ?auto_26761 ?auto_26765 ) ) ( not ( = ?auto_26761 ?auto_26770 ) ) ( not ( = ?auto_26761 ?auto_26768 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26763 ?auto_26764 ?auto_26765 )
      ( MAKE-4CRATE-VERIFY ?auto_26761 ?auto_26762 ?auto_26763 ?auto_26764 ?auto_26765 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26775 - SURFACE
      ?auto_26776 - SURFACE
      ?auto_26777 - SURFACE
      ?auto_26778 - SURFACE
      ?auto_26779 - SURFACE
      ?auto_26780 - SURFACE
    )
    :vars
    (
      ?auto_26782 - HOIST
      ?auto_26786 - PLACE
      ?auto_26781 - PLACE
      ?auto_26789 - HOIST
      ?auto_26785 - SURFACE
      ?auto_26784 - PLACE
      ?auto_26787 - HOIST
      ?auto_26783 - SURFACE
      ?auto_26788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26782 ?auto_26786 ) ( IS-CRATE ?auto_26780 ) ( not ( = ?auto_26779 ?auto_26780 ) ) ( not ( = ?auto_26778 ?auto_26779 ) ) ( not ( = ?auto_26778 ?auto_26780 ) ) ( not ( = ?auto_26781 ?auto_26786 ) ) ( HOIST-AT ?auto_26789 ?auto_26781 ) ( not ( = ?auto_26782 ?auto_26789 ) ) ( AVAILABLE ?auto_26789 ) ( SURFACE-AT ?auto_26780 ?auto_26781 ) ( ON ?auto_26780 ?auto_26785 ) ( CLEAR ?auto_26780 ) ( not ( = ?auto_26779 ?auto_26785 ) ) ( not ( = ?auto_26780 ?auto_26785 ) ) ( not ( = ?auto_26778 ?auto_26785 ) ) ( IS-CRATE ?auto_26779 ) ( not ( = ?auto_26784 ?auto_26786 ) ) ( not ( = ?auto_26781 ?auto_26784 ) ) ( HOIST-AT ?auto_26787 ?auto_26784 ) ( not ( = ?auto_26782 ?auto_26787 ) ) ( not ( = ?auto_26789 ?auto_26787 ) ) ( AVAILABLE ?auto_26787 ) ( SURFACE-AT ?auto_26779 ?auto_26784 ) ( ON ?auto_26779 ?auto_26783 ) ( CLEAR ?auto_26779 ) ( not ( = ?auto_26779 ?auto_26783 ) ) ( not ( = ?auto_26780 ?auto_26783 ) ) ( not ( = ?auto_26778 ?auto_26783 ) ) ( not ( = ?auto_26785 ?auto_26783 ) ) ( SURFACE-AT ?auto_26777 ?auto_26786 ) ( CLEAR ?auto_26777 ) ( IS-CRATE ?auto_26778 ) ( not ( = ?auto_26777 ?auto_26778 ) ) ( not ( = ?auto_26779 ?auto_26777 ) ) ( not ( = ?auto_26780 ?auto_26777 ) ) ( not ( = ?auto_26785 ?auto_26777 ) ) ( not ( = ?auto_26783 ?auto_26777 ) ) ( AVAILABLE ?auto_26782 ) ( IN ?auto_26778 ?auto_26788 ) ( TRUCK-AT ?auto_26788 ?auto_26784 ) ( ON ?auto_26776 ?auto_26775 ) ( ON ?auto_26777 ?auto_26776 ) ( not ( = ?auto_26775 ?auto_26776 ) ) ( not ( = ?auto_26775 ?auto_26777 ) ) ( not ( = ?auto_26775 ?auto_26778 ) ) ( not ( = ?auto_26775 ?auto_26779 ) ) ( not ( = ?auto_26775 ?auto_26780 ) ) ( not ( = ?auto_26775 ?auto_26785 ) ) ( not ( = ?auto_26775 ?auto_26783 ) ) ( not ( = ?auto_26776 ?auto_26777 ) ) ( not ( = ?auto_26776 ?auto_26778 ) ) ( not ( = ?auto_26776 ?auto_26779 ) ) ( not ( = ?auto_26776 ?auto_26780 ) ) ( not ( = ?auto_26776 ?auto_26785 ) ) ( not ( = ?auto_26776 ?auto_26783 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26778 ?auto_26779 ?auto_26780 )
      ( MAKE-5CRATE-VERIFY ?auto_26775 ?auto_26776 ?auto_26777 ?auto_26778 ?auto_26779 ?auto_26780 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26790 - SURFACE
      ?auto_26791 - SURFACE
    )
    :vars
    (
      ?auto_26794 - HOIST
      ?auto_26799 - PLACE
      ?auto_26793 - SURFACE
      ?auto_26792 - PLACE
      ?auto_26802 - HOIST
      ?auto_26798 - SURFACE
      ?auto_26796 - PLACE
      ?auto_26800 - HOIST
      ?auto_26795 - SURFACE
      ?auto_26797 - SURFACE
      ?auto_26801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26794 ?auto_26799 ) ( IS-CRATE ?auto_26791 ) ( not ( = ?auto_26790 ?auto_26791 ) ) ( not ( = ?auto_26793 ?auto_26790 ) ) ( not ( = ?auto_26793 ?auto_26791 ) ) ( not ( = ?auto_26792 ?auto_26799 ) ) ( HOIST-AT ?auto_26802 ?auto_26792 ) ( not ( = ?auto_26794 ?auto_26802 ) ) ( AVAILABLE ?auto_26802 ) ( SURFACE-AT ?auto_26791 ?auto_26792 ) ( ON ?auto_26791 ?auto_26798 ) ( CLEAR ?auto_26791 ) ( not ( = ?auto_26790 ?auto_26798 ) ) ( not ( = ?auto_26791 ?auto_26798 ) ) ( not ( = ?auto_26793 ?auto_26798 ) ) ( IS-CRATE ?auto_26790 ) ( not ( = ?auto_26796 ?auto_26799 ) ) ( not ( = ?auto_26792 ?auto_26796 ) ) ( HOIST-AT ?auto_26800 ?auto_26796 ) ( not ( = ?auto_26794 ?auto_26800 ) ) ( not ( = ?auto_26802 ?auto_26800 ) ) ( SURFACE-AT ?auto_26790 ?auto_26796 ) ( ON ?auto_26790 ?auto_26795 ) ( CLEAR ?auto_26790 ) ( not ( = ?auto_26790 ?auto_26795 ) ) ( not ( = ?auto_26791 ?auto_26795 ) ) ( not ( = ?auto_26793 ?auto_26795 ) ) ( not ( = ?auto_26798 ?auto_26795 ) ) ( SURFACE-AT ?auto_26797 ?auto_26799 ) ( CLEAR ?auto_26797 ) ( IS-CRATE ?auto_26793 ) ( not ( = ?auto_26797 ?auto_26793 ) ) ( not ( = ?auto_26790 ?auto_26797 ) ) ( not ( = ?auto_26791 ?auto_26797 ) ) ( not ( = ?auto_26798 ?auto_26797 ) ) ( not ( = ?auto_26795 ?auto_26797 ) ) ( AVAILABLE ?auto_26794 ) ( TRUCK-AT ?auto_26801 ?auto_26796 ) ( LIFTING ?auto_26800 ?auto_26793 ) )
    :subtasks
    ( ( !LOAD ?auto_26800 ?auto_26793 ?auto_26801 ?auto_26796 )
      ( MAKE-2CRATE ?auto_26793 ?auto_26790 ?auto_26791 )
      ( MAKE-1CRATE-VERIFY ?auto_26790 ?auto_26791 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26803 - SURFACE
      ?auto_26804 - SURFACE
      ?auto_26805 - SURFACE
    )
    :vars
    (
      ?auto_26809 - HOIST
      ?auto_26810 - PLACE
      ?auto_26813 - PLACE
      ?auto_26806 - HOIST
      ?auto_26807 - SURFACE
      ?auto_26811 - PLACE
      ?auto_26815 - HOIST
      ?auto_26812 - SURFACE
      ?auto_26808 - SURFACE
      ?auto_26814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26809 ?auto_26810 ) ( IS-CRATE ?auto_26805 ) ( not ( = ?auto_26804 ?auto_26805 ) ) ( not ( = ?auto_26803 ?auto_26804 ) ) ( not ( = ?auto_26803 ?auto_26805 ) ) ( not ( = ?auto_26813 ?auto_26810 ) ) ( HOIST-AT ?auto_26806 ?auto_26813 ) ( not ( = ?auto_26809 ?auto_26806 ) ) ( AVAILABLE ?auto_26806 ) ( SURFACE-AT ?auto_26805 ?auto_26813 ) ( ON ?auto_26805 ?auto_26807 ) ( CLEAR ?auto_26805 ) ( not ( = ?auto_26804 ?auto_26807 ) ) ( not ( = ?auto_26805 ?auto_26807 ) ) ( not ( = ?auto_26803 ?auto_26807 ) ) ( IS-CRATE ?auto_26804 ) ( not ( = ?auto_26811 ?auto_26810 ) ) ( not ( = ?auto_26813 ?auto_26811 ) ) ( HOIST-AT ?auto_26815 ?auto_26811 ) ( not ( = ?auto_26809 ?auto_26815 ) ) ( not ( = ?auto_26806 ?auto_26815 ) ) ( SURFACE-AT ?auto_26804 ?auto_26811 ) ( ON ?auto_26804 ?auto_26812 ) ( CLEAR ?auto_26804 ) ( not ( = ?auto_26804 ?auto_26812 ) ) ( not ( = ?auto_26805 ?auto_26812 ) ) ( not ( = ?auto_26803 ?auto_26812 ) ) ( not ( = ?auto_26807 ?auto_26812 ) ) ( SURFACE-AT ?auto_26808 ?auto_26810 ) ( CLEAR ?auto_26808 ) ( IS-CRATE ?auto_26803 ) ( not ( = ?auto_26808 ?auto_26803 ) ) ( not ( = ?auto_26804 ?auto_26808 ) ) ( not ( = ?auto_26805 ?auto_26808 ) ) ( not ( = ?auto_26807 ?auto_26808 ) ) ( not ( = ?auto_26812 ?auto_26808 ) ) ( AVAILABLE ?auto_26809 ) ( TRUCK-AT ?auto_26814 ?auto_26811 ) ( LIFTING ?auto_26815 ?auto_26803 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26804 ?auto_26805 )
      ( MAKE-2CRATE-VERIFY ?auto_26803 ?auto_26804 ?auto_26805 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26816 - SURFACE
      ?auto_26817 - SURFACE
      ?auto_26818 - SURFACE
      ?auto_26819 - SURFACE
    )
    :vars
    (
      ?auto_26823 - HOIST
      ?auto_26826 - PLACE
      ?auto_26820 - PLACE
      ?auto_26821 - HOIST
      ?auto_26827 - SURFACE
      ?auto_26825 - PLACE
      ?auto_26828 - HOIST
      ?auto_26824 - SURFACE
      ?auto_26822 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26823 ?auto_26826 ) ( IS-CRATE ?auto_26819 ) ( not ( = ?auto_26818 ?auto_26819 ) ) ( not ( = ?auto_26817 ?auto_26818 ) ) ( not ( = ?auto_26817 ?auto_26819 ) ) ( not ( = ?auto_26820 ?auto_26826 ) ) ( HOIST-AT ?auto_26821 ?auto_26820 ) ( not ( = ?auto_26823 ?auto_26821 ) ) ( AVAILABLE ?auto_26821 ) ( SURFACE-AT ?auto_26819 ?auto_26820 ) ( ON ?auto_26819 ?auto_26827 ) ( CLEAR ?auto_26819 ) ( not ( = ?auto_26818 ?auto_26827 ) ) ( not ( = ?auto_26819 ?auto_26827 ) ) ( not ( = ?auto_26817 ?auto_26827 ) ) ( IS-CRATE ?auto_26818 ) ( not ( = ?auto_26825 ?auto_26826 ) ) ( not ( = ?auto_26820 ?auto_26825 ) ) ( HOIST-AT ?auto_26828 ?auto_26825 ) ( not ( = ?auto_26823 ?auto_26828 ) ) ( not ( = ?auto_26821 ?auto_26828 ) ) ( SURFACE-AT ?auto_26818 ?auto_26825 ) ( ON ?auto_26818 ?auto_26824 ) ( CLEAR ?auto_26818 ) ( not ( = ?auto_26818 ?auto_26824 ) ) ( not ( = ?auto_26819 ?auto_26824 ) ) ( not ( = ?auto_26817 ?auto_26824 ) ) ( not ( = ?auto_26827 ?auto_26824 ) ) ( SURFACE-AT ?auto_26816 ?auto_26826 ) ( CLEAR ?auto_26816 ) ( IS-CRATE ?auto_26817 ) ( not ( = ?auto_26816 ?auto_26817 ) ) ( not ( = ?auto_26818 ?auto_26816 ) ) ( not ( = ?auto_26819 ?auto_26816 ) ) ( not ( = ?auto_26827 ?auto_26816 ) ) ( not ( = ?auto_26824 ?auto_26816 ) ) ( AVAILABLE ?auto_26823 ) ( TRUCK-AT ?auto_26822 ?auto_26825 ) ( LIFTING ?auto_26828 ?auto_26817 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26817 ?auto_26818 ?auto_26819 )
      ( MAKE-3CRATE-VERIFY ?auto_26816 ?auto_26817 ?auto_26818 ?auto_26819 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26829 - SURFACE
      ?auto_26830 - SURFACE
      ?auto_26831 - SURFACE
      ?auto_26832 - SURFACE
      ?auto_26833 - SURFACE
    )
    :vars
    (
      ?auto_26837 - HOIST
      ?auto_26840 - PLACE
      ?auto_26834 - PLACE
      ?auto_26835 - HOIST
      ?auto_26841 - SURFACE
      ?auto_26839 - PLACE
      ?auto_26842 - HOIST
      ?auto_26838 - SURFACE
      ?auto_26836 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26837 ?auto_26840 ) ( IS-CRATE ?auto_26833 ) ( not ( = ?auto_26832 ?auto_26833 ) ) ( not ( = ?auto_26831 ?auto_26832 ) ) ( not ( = ?auto_26831 ?auto_26833 ) ) ( not ( = ?auto_26834 ?auto_26840 ) ) ( HOIST-AT ?auto_26835 ?auto_26834 ) ( not ( = ?auto_26837 ?auto_26835 ) ) ( AVAILABLE ?auto_26835 ) ( SURFACE-AT ?auto_26833 ?auto_26834 ) ( ON ?auto_26833 ?auto_26841 ) ( CLEAR ?auto_26833 ) ( not ( = ?auto_26832 ?auto_26841 ) ) ( not ( = ?auto_26833 ?auto_26841 ) ) ( not ( = ?auto_26831 ?auto_26841 ) ) ( IS-CRATE ?auto_26832 ) ( not ( = ?auto_26839 ?auto_26840 ) ) ( not ( = ?auto_26834 ?auto_26839 ) ) ( HOIST-AT ?auto_26842 ?auto_26839 ) ( not ( = ?auto_26837 ?auto_26842 ) ) ( not ( = ?auto_26835 ?auto_26842 ) ) ( SURFACE-AT ?auto_26832 ?auto_26839 ) ( ON ?auto_26832 ?auto_26838 ) ( CLEAR ?auto_26832 ) ( not ( = ?auto_26832 ?auto_26838 ) ) ( not ( = ?auto_26833 ?auto_26838 ) ) ( not ( = ?auto_26831 ?auto_26838 ) ) ( not ( = ?auto_26841 ?auto_26838 ) ) ( SURFACE-AT ?auto_26830 ?auto_26840 ) ( CLEAR ?auto_26830 ) ( IS-CRATE ?auto_26831 ) ( not ( = ?auto_26830 ?auto_26831 ) ) ( not ( = ?auto_26832 ?auto_26830 ) ) ( not ( = ?auto_26833 ?auto_26830 ) ) ( not ( = ?auto_26841 ?auto_26830 ) ) ( not ( = ?auto_26838 ?auto_26830 ) ) ( AVAILABLE ?auto_26837 ) ( TRUCK-AT ?auto_26836 ?auto_26839 ) ( LIFTING ?auto_26842 ?auto_26831 ) ( ON ?auto_26830 ?auto_26829 ) ( not ( = ?auto_26829 ?auto_26830 ) ) ( not ( = ?auto_26829 ?auto_26831 ) ) ( not ( = ?auto_26829 ?auto_26832 ) ) ( not ( = ?auto_26829 ?auto_26833 ) ) ( not ( = ?auto_26829 ?auto_26841 ) ) ( not ( = ?auto_26829 ?auto_26838 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26831 ?auto_26832 ?auto_26833 )
      ( MAKE-4CRATE-VERIFY ?auto_26829 ?auto_26830 ?auto_26831 ?auto_26832 ?auto_26833 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26843 - SURFACE
      ?auto_26844 - SURFACE
      ?auto_26845 - SURFACE
      ?auto_26846 - SURFACE
      ?auto_26847 - SURFACE
      ?auto_26848 - SURFACE
    )
    :vars
    (
      ?auto_26852 - HOIST
      ?auto_26855 - PLACE
      ?auto_26849 - PLACE
      ?auto_26850 - HOIST
      ?auto_26856 - SURFACE
      ?auto_26854 - PLACE
      ?auto_26857 - HOIST
      ?auto_26853 - SURFACE
      ?auto_26851 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26852 ?auto_26855 ) ( IS-CRATE ?auto_26848 ) ( not ( = ?auto_26847 ?auto_26848 ) ) ( not ( = ?auto_26846 ?auto_26847 ) ) ( not ( = ?auto_26846 ?auto_26848 ) ) ( not ( = ?auto_26849 ?auto_26855 ) ) ( HOIST-AT ?auto_26850 ?auto_26849 ) ( not ( = ?auto_26852 ?auto_26850 ) ) ( AVAILABLE ?auto_26850 ) ( SURFACE-AT ?auto_26848 ?auto_26849 ) ( ON ?auto_26848 ?auto_26856 ) ( CLEAR ?auto_26848 ) ( not ( = ?auto_26847 ?auto_26856 ) ) ( not ( = ?auto_26848 ?auto_26856 ) ) ( not ( = ?auto_26846 ?auto_26856 ) ) ( IS-CRATE ?auto_26847 ) ( not ( = ?auto_26854 ?auto_26855 ) ) ( not ( = ?auto_26849 ?auto_26854 ) ) ( HOIST-AT ?auto_26857 ?auto_26854 ) ( not ( = ?auto_26852 ?auto_26857 ) ) ( not ( = ?auto_26850 ?auto_26857 ) ) ( SURFACE-AT ?auto_26847 ?auto_26854 ) ( ON ?auto_26847 ?auto_26853 ) ( CLEAR ?auto_26847 ) ( not ( = ?auto_26847 ?auto_26853 ) ) ( not ( = ?auto_26848 ?auto_26853 ) ) ( not ( = ?auto_26846 ?auto_26853 ) ) ( not ( = ?auto_26856 ?auto_26853 ) ) ( SURFACE-AT ?auto_26845 ?auto_26855 ) ( CLEAR ?auto_26845 ) ( IS-CRATE ?auto_26846 ) ( not ( = ?auto_26845 ?auto_26846 ) ) ( not ( = ?auto_26847 ?auto_26845 ) ) ( not ( = ?auto_26848 ?auto_26845 ) ) ( not ( = ?auto_26856 ?auto_26845 ) ) ( not ( = ?auto_26853 ?auto_26845 ) ) ( AVAILABLE ?auto_26852 ) ( TRUCK-AT ?auto_26851 ?auto_26854 ) ( LIFTING ?auto_26857 ?auto_26846 ) ( ON ?auto_26844 ?auto_26843 ) ( ON ?auto_26845 ?auto_26844 ) ( not ( = ?auto_26843 ?auto_26844 ) ) ( not ( = ?auto_26843 ?auto_26845 ) ) ( not ( = ?auto_26843 ?auto_26846 ) ) ( not ( = ?auto_26843 ?auto_26847 ) ) ( not ( = ?auto_26843 ?auto_26848 ) ) ( not ( = ?auto_26843 ?auto_26856 ) ) ( not ( = ?auto_26843 ?auto_26853 ) ) ( not ( = ?auto_26844 ?auto_26845 ) ) ( not ( = ?auto_26844 ?auto_26846 ) ) ( not ( = ?auto_26844 ?auto_26847 ) ) ( not ( = ?auto_26844 ?auto_26848 ) ) ( not ( = ?auto_26844 ?auto_26856 ) ) ( not ( = ?auto_26844 ?auto_26853 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26846 ?auto_26847 ?auto_26848 )
      ( MAKE-5CRATE-VERIFY ?auto_26843 ?auto_26844 ?auto_26845 ?auto_26846 ?auto_26847 ?auto_26848 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26858 - SURFACE
      ?auto_26859 - SURFACE
    )
    :vars
    (
      ?auto_26863 - HOIST
      ?auto_26868 - PLACE
      ?auto_26864 - SURFACE
      ?auto_26860 - PLACE
      ?auto_26861 - HOIST
      ?auto_26869 - SURFACE
      ?auto_26866 - PLACE
      ?auto_26870 - HOIST
      ?auto_26865 - SURFACE
      ?auto_26867 - SURFACE
      ?auto_26862 - TRUCK
      ?auto_26871 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26863 ?auto_26868 ) ( IS-CRATE ?auto_26859 ) ( not ( = ?auto_26858 ?auto_26859 ) ) ( not ( = ?auto_26864 ?auto_26858 ) ) ( not ( = ?auto_26864 ?auto_26859 ) ) ( not ( = ?auto_26860 ?auto_26868 ) ) ( HOIST-AT ?auto_26861 ?auto_26860 ) ( not ( = ?auto_26863 ?auto_26861 ) ) ( AVAILABLE ?auto_26861 ) ( SURFACE-AT ?auto_26859 ?auto_26860 ) ( ON ?auto_26859 ?auto_26869 ) ( CLEAR ?auto_26859 ) ( not ( = ?auto_26858 ?auto_26869 ) ) ( not ( = ?auto_26859 ?auto_26869 ) ) ( not ( = ?auto_26864 ?auto_26869 ) ) ( IS-CRATE ?auto_26858 ) ( not ( = ?auto_26866 ?auto_26868 ) ) ( not ( = ?auto_26860 ?auto_26866 ) ) ( HOIST-AT ?auto_26870 ?auto_26866 ) ( not ( = ?auto_26863 ?auto_26870 ) ) ( not ( = ?auto_26861 ?auto_26870 ) ) ( SURFACE-AT ?auto_26858 ?auto_26866 ) ( ON ?auto_26858 ?auto_26865 ) ( CLEAR ?auto_26858 ) ( not ( = ?auto_26858 ?auto_26865 ) ) ( not ( = ?auto_26859 ?auto_26865 ) ) ( not ( = ?auto_26864 ?auto_26865 ) ) ( not ( = ?auto_26869 ?auto_26865 ) ) ( SURFACE-AT ?auto_26867 ?auto_26868 ) ( CLEAR ?auto_26867 ) ( IS-CRATE ?auto_26864 ) ( not ( = ?auto_26867 ?auto_26864 ) ) ( not ( = ?auto_26858 ?auto_26867 ) ) ( not ( = ?auto_26859 ?auto_26867 ) ) ( not ( = ?auto_26869 ?auto_26867 ) ) ( not ( = ?auto_26865 ?auto_26867 ) ) ( AVAILABLE ?auto_26863 ) ( TRUCK-AT ?auto_26862 ?auto_26866 ) ( AVAILABLE ?auto_26870 ) ( SURFACE-AT ?auto_26864 ?auto_26866 ) ( ON ?auto_26864 ?auto_26871 ) ( CLEAR ?auto_26864 ) ( not ( = ?auto_26858 ?auto_26871 ) ) ( not ( = ?auto_26859 ?auto_26871 ) ) ( not ( = ?auto_26864 ?auto_26871 ) ) ( not ( = ?auto_26869 ?auto_26871 ) ) ( not ( = ?auto_26865 ?auto_26871 ) ) ( not ( = ?auto_26867 ?auto_26871 ) ) )
    :subtasks
    ( ( !LIFT ?auto_26870 ?auto_26864 ?auto_26871 ?auto_26866 )
      ( MAKE-2CRATE ?auto_26864 ?auto_26858 ?auto_26859 )
      ( MAKE-1CRATE-VERIFY ?auto_26858 ?auto_26859 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26872 - SURFACE
      ?auto_26873 - SURFACE
      ?auto_26874 - SURFACE
    )
    :vars
    (
      ?auto_26879 - HOIST
      ?auto_26876 - PLACE
      ?auto_26885 - PLACE
      ?auto_26884 - HOIST
      ?auto_26877 - SURFACE
      ?auto_26875 - PLACE
      ?auto_26880 - HOIST
      ?auto_26882 - SURFACE
      ?auto_26881 - SURFACE
      ?auto_26878 - TRUCK
      ?auto_26883 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26879 ?auto_26876 ) ( IS-CRATE ?auto_26874 ) ( not ( = ?auto_26873 ?auto_26874 ) ) ( not ( = ?auto_26872 ?auto_26873 ) ) ( not ( = ?auto_26872 ?auto_26874 ) ) ( not ( = ?auto_26885 ?auto_26876 ) ) ( HOIST-AT ?auto_26884 ?auto_26885 ) ( not ( = ?auto_26879 ?auto_26884 ) ) ( AVAILABLE ?auto_26884 ) ( SURFACE-AT ?auto_26874 ?auto_26885 ) ( ON ?auto_26874 ?auto_26877 ) ( CLEAR ?auto_26874 ) ( not ( = ?auto_26873 ?auto_26877 ) ) ( not ( = ?auto_26874 ?auto_26877 ) ) ( not ( = ?auto_26872 ?auto_26877 ) ) ( IS-CRATE ?auto_26873 ) ( not ( = ?auto_26875 ?auto_26876 ) ) ( not ( = ?auto_26885 ?auto_26875 ) ) ( HOIST-AT ?auto_26880 ?auto_26875 ) ( not ( = ?auto_26879 ?auto_26880 ) ) ( not ( = ?auto_26884 ?auto_26880 ) ) ( SURFACE-AT ?auto_26873 ?auto_26875 ) ( ON ?auto_26873 ?auto_26882 ) ( CLEAR ?auto_26873 ) ( not ( = ?auto_26873 ?auto_26882 ) ) ( not ( = ?auto_26874 ?auto_26882 ) ) ( not ( = ?auto_26872 ?auto_26882 ) ) ( not ( = ?auto_26877 ?auto_26882 ) ) ( SURFACE-AT ?auto_26881 ?auto_26876 ) ( CLEAR ?auto_26881 ) ( IS-CRATE ?auto_26872 ) ( not ( = ?auto_26881 ?auto_26872 ) ) ( not ( = ?auto_26873 ?auto_26881 ) ) ( not ( = ?auto_26874 ?auto_26881 ) ) ( not ( = ?auto_26877 ?auto_26881 ) ) ( not ( = ?auto_26882 ?auto_26881 ) ) ( AVAILABLE ?auto_26879 ) ( TRUCK-AT ?auto_26878 ?auto_26875 ) ( AVAILABLE ?auto_26880 ) ( SURFACE-AT ?auto_26872 ?auto_26875 ) ( ON ?auto_26872 ?auto_26883 ) ( CLEAR ?auto_26872 ) ( not ( = ?auto_26873 ?auto_26883 ) ) ( not ( = ?auto_26874 ?auto_26883 ) ) ( not ( = ?auto_26872 ?auto_26883 ) ) ( not ( = ?auto_26877 ?auto_26883 ) ) ( not ( = ?auto_26882 ?auto_26883 ) ) ( not ( = ?auto_26881 ?auto_26883 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26873 ?auto_26874 )
      ( MAKE-2CRATE-VERIFY ?auto_26872 ?auto_26873 ?auto_26874 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26886 - SURFACE
      ?auto_26887 - SURFACE
      ?auto_26888 - SURFACE
      ?auto_26889 - SURFACE
    )
    :vars
    (
      ?auto_26896 - HOIST
      ?auto_26898 - PLACE
      ?auto_26899 - PLACE
      ?auto_26894 - HOIST
      ?auto_26891 - SURFACE
      ?auto_26897 - PLACE
      ?auto_26890 - HOIST
      ?auto_26893 - SURFACE
      ?auto_26895 - TRUCK
      ?auto_26892 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26896 ?auto_26898 ) ( IS-CRATE ?auto_26889 ) ( not ( = ?auto_26888 ?auto_26889 ) ) ( not ( = ?auto_26887 ?auto_26888 ) ) ( not ( = ?auto_26887 ?auto_26889 ) ) ( not ( = ?auto_26899 ?auto_26898 ) ) ( HOIST-AT ?auto_26894 ?auto_26899 ) ( not ( = ?auto_26896 ?auto_26894 ) ) ( AVAILABLE ?auto_26894 ) ( SURFACE-AT ?auto_26889 ?auto_26899 ) ( ON ?auto_26889 ?auto_26891 ) ( CLEAR ?auto_26889 ) ( not ( = ?auto_26888 ?auto_26891 ) ) ( not ( = ?auto_26889 ?auto_26891 ) ) ( not ( = ?auto_26887 ?auto_26891 ) ) ( IS-CRATE ?auto_26888 ) ( not ( = ?auto_26897 ?auto_26898 ) ) ( not ( = ?auto_26899 ?auto_26897 ) ) ( HOIST-AT ?auto_26890 ?auto_26897 ) ( not ( = ?auto_26896 ?auto_26890 ) ) ( not ( = ?auto_26894 ?auto_26890 ) ) ( SURFACE-AT ?auto_26888 ?auto_26897 ) ( ON ?auto_26888 ?auto_26893 ) ( CLEAR ?auto_26888 ) ( not ( = ?auto_26888 ?auto_26893 ) ) ( not ( = ?auto_26889 ?auto_26893 ) ) ( not ( = ?auto_26887 ?auto_26893 ) ) ( not ( = ?auto_26891 ?auto_26893 ) ) ( SURFACE-AT ?auto_26886 ?auto_26898 ) ( CLEAR ?auto_26886 ) ( IS-CRATE ?auto_26887 ) ( not ( = ?auto_26886 ?auto_26887 ) ) ( not ( = ?auto_26888 ?auto_26886 ) ) ( not ( = ?auto_26889 ?auto_26886 ) ) ( not ( = ?auto_26891 ?auto_26886 ) ) ( not ( = ?auto_26893 ?auto_26886 ) ) ( AVAILABLE ?auto_26896 ) ( TRUCK-AT ?auto_26895 ?auto_26897 ) ( AVAILABLE ?auto_26890 ) ( SURFACE-AT ?auto_26887 ?auto_26897 ) ( ON ?auto_26887 ?auto_26892 ) ( CLEAR ?auto_26887 ) ( not ( = ?auto_26888 ?auto_26892 ) ) ( not ( = ?auto_26889 ?auto_26892 ) ) ( not ( = ?auto_26887 ?auto_26892 ) ) ( not ( = ?auto_26891 ?auto_26892 ) ) ( not ( = ?auto_26893 ?auto_26892 ) ) ( not ( = ?auto_26886 ?auto_26892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26887 ?auto_26888 ?auto_26889 )
      ( MAKE-3CRATE-VERIFY ?auto_26886 ?auto_26887 ?auto_26888 ?auto_26889 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26900 - SURFACE
      ?auto_26901 - SURFACE
      ?auto_26902 - SURFACE
      ?auto_26903 - SURFACE
      ?auto_26904 - SURFACE
    )
    :vars
    (
      ?auto_26911 - HOIST
      ?auto_26913 - PLACE
      ?auto_26914 - PLACE
      ?auto_26909 - HOIST
      ?auto_26906 - SURFACE
      ?auto_26912 - PLACE
      ?auto_26905 - HOIST
      ?auto_26908 - SURFACE
      ?auto_26910 - TRUCK
      ?auto_26907 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26911 ?auto_26913 ) ( IS-CRATE ?auto_26904 ) ( not ( = ?auto_26903 ?auto_26904 ) ) ( not ( = ?auto_26902 ?auto_26903 ) ) ( not ( = ?auto_26902 ?auto_26904 ) ) ( not ( = ?auto_26914 ?auto_26913 ) ) ( HOIST-AT ?auto_26909 ?auto_26914 ) ( not ( = ?auto_26911 ?auto_26909 ) ) ( AVAILABLE ?auto_26909 ) ( SURFACE-AT ?auto_26904 ?auto_26914 ) ( ON ?auto_26904 ?auto_26906 ) ( CLEAR ?auto_26904 ) ( not ( = ?auto_26903 ?auto_26906 ) ) ( not ( = ?auto_26904 ?auto_26906 ) ) ( not ( = ?auto_26902 ?auto_26906 ) ) ( IS-CRATE ?auto_26903 ) ( not ( = ?auto_26912 ?auto_26913 ) ) ( not ( = ?auto_26914 ?auto_26912 ) ) ( HOIST-AT ?auto_26905 ?auto_26912 ) ( not ( = ?auto_26911 ?auto_26905 ) ) ( not ( = ?auto_26909 ?auto_26905 ) ) ( SURFACE-AT ?auto_26903 ?auto_26912 ) ( ON ?auto_26903 ?auto_26908 ) ( CLEAR ?auto_26903 ) ( not ( = ?auto_26903 ?auto_26908 ) ) ( not ( = ?auto_26904 ?auto_26908 ) ) ( not ( = ?auto_26902 ?auto_26908 ) ) ( not ( = ?auto_26906 ?auto_26908 ) ) ( SURFACE-AT ?auto_26901 ?auto_26913 ) ( CLEAR ?auto_26901 ) ( IS-CRATE ?auto_26902 ) ( not ( = ?auto_26901 ?auto_26902 ) ) ( not ( = ?auto_26903 ?auto_26901 ) ) ( not ( = ?auto_26904 ?auto_26901 ) ) ( not ( = ?auto_26906 ?auto_26901 ) ) ( not ( = ?auto_26908 ?auto_26901 ) ) ( AVAILABLE ?auto_26911 ) ( TRUCK-AT ?auto_26910 ?auto_26912 ) ( AVAILABLE ?auto_26905 ) ( SURFACE-AT ?auto_26902 ?auto_26912 ) ( ON ?auto_26902 ?auto_26907 ) ( CLEAR ?auto_26902 ) ( not ( = ?auto_26903 ?auto_26907 ) ) ( not ( = ?auto_26904 ?auto_26907 ) ) ( not ( = ?auto_26902 ?auto_26907 ) ) ( not ( = ?auto_26906 ?auto_26907 ) ) ( not ( = ?auto_26908 ?auto_26907 ) ) ( not ( = ?auto_26901 ?auto_26907 ) ) ( ON ?auto_26901 ?auto_26900 ) ( not ( = ?auto_26900 ?auto_26901 ) ) ( not ( = ?auto_26900 ?auto_26902 ) ) ( not ( = ?auto_26900 ?auto_26903 ) ) ( not ( = ?auto_26900 ?auto_26904 ) ) ( not ( = ?auto_26900 ?auto_26906 ) ) ( not ( = ?auto_26900 ?auto_26908 ) ) ( not ( = ?auto_26900 ?auto_26907 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26902 ?auto_26903 ?auto_26904 )
      ( MAKE-4CRATE-VERIFY ?auto_26900 ?auto_26901 ?auto_26902 ?auto_26903 ?auto_26904 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26915 - SURFACE
      ?auto_26916 - SURFACE
      ?auto_26917 - SURFACE
      ?auto_26918 - SURFACE
      ?auto_26919 - SURFACE
      ?auto_26920 - SURFACE
    )
    :vars
    (
      ?auto_26927 - HOIST
      ?auto_26929 - PLACE
      ?auto_26930 - PLACE
      ?auto_26925 - HOIST
      ?auto_26922 - SURFACE
      ?auto_26928 - PLACE
      ?auto_26921 - HOIST
      ?auto_26924 - SURFACE
      ?auto_26926 - TRUCK
      ?auto_26923 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_26927 ?auto_26929 ) ( IS-CRATE ?auto_26920 ) ( not ( = ?auto_26919 ?auto_26920 ) ) ( not ( = ?auto_26918 ?auto_26919 ) ) ( not ( = ?auto_26918 ?auto_26920 ) ) ( not ( = ?auto_26930 ?auto_26929 ) ) ( HOIST-AT ?auto_26925 ?auto_26930 ) ( not ( = ?auto_26927 ?auto_26925 ) ) ( AVAILABLE ?auto_26925 ) ( SURFACE-AT ?auto_26920 ?auto_26930 ) ( ON ?auto_26920 ?auto_26922 ) ( CLEAR ?auto_26920 ) ( not ( = ?auto_26919 ?auto_26922 ) ) ( not ( = ?auto_26920 ?auto_26922 ) ) ( not ( = ?auto_26918 ?auto_26922 ) ) ( IS-CRATE ?auto_26919 ) ( not ( = ?auto_26928 ?auto_26929 ) ) ( not ( = ?auto_26930 ?auto_26928 ) ) ( HOIST-AT ?auto_26921 ?auto_26928 ) ( not ( = ?auto_26927 ?auto_26921 ) ) ( not ( = ?auto_26925 ?auto_26921 ) ) ( SURFACE-AT ?auto_26919 ?auto_26928 ) ( ON ?auto_26919 ?auto_26924 ) ( CLEAR ?auto_26919 ) ( not ( = ?auto_26919 ?auto_26924 ) ) ( not ( = ?auto_26920 ?auto_26924 ) ) ( not ( = ?auto_26918 ?auto_26924 ) ) ( not ( = ?auto_26922 ?auto_26924 ) ) ( SURFACE-AT ?auto_26917 ?auto_26929 ) ( CLEAR ?auto_26917 ) ( IS-CRATE ?auto_26918 ) ( not ( = ?auto_26917 ?auto_26918 ) ) ( not ( = ?auto_26919 ?auto_26917 ) ) ( not ( = ?auto_26920 ?auto_26917 ) ) ( not ( = ?auto_26922 ?auto_26917 ) ) ( not ( = ?auto_26924 ?auto_26917 ) ) ( AVAILABLE ?auto_26927 ) ( TRUCK-AT ?auto_26926 ?auto_26928 ) ( AVAILABLE ?auto_26921 ) ( SURFACE-AT ?auto_26918 ?auto_26928 ) ( ON ?auto_26918 ?auto_26923 ) ( CLEAR ?auto_26918 ) ( not ( = ?auto_26919 ?auto_26923 ) ) ( not ( = ?auto_26920 ?auto_26923 ) ) ( not ( = ?auto_26918 ?auto_26923 ) ) ( not ( = ?auto_26922 ?auto_26923 ) ) ( not ( = ?auto_26924 ?auto_26923 ) ) ( not ( = ?auto_26917 ?auto_26923 ) ) ( ON ?auto_26916 ?auto_26915 ) ( ON ?auto_26917 ?auto_26916 ) ( not ( = ?auto_26915 ?auto_26916 ) ) ( not ( = ?auto_26915 ?auto_26917 ) ) ( not ( = ?auto_26915 ?auto_26918 ) ) ( not ( = ?auto_26915 ?auto_26919 ) ) ( not ( = ?auto_26915 ?auto_26920 ) ) ( not ( = ?auto_26915 ?auto_26922 ) ) ( not ( = ?auto_26915 ?auto_26924 ) ) ( not ( = ?auto_26915 ?auto_26923 ) ) ( not ( = ?auto_26916 ?auto_26917 ) ) ( not ( = ?auto_26916 ?auto_26918 ) ) ( not ( = ?auto_26916 ?auto_26919 ) ) ( not ( = ?auto_26916 ?auto_26920 ) ) ( not ( = ?auto_26916 ?auto_26922 ) ) ( not ( = ?auto_26916 ?auto_26924 ) ) ( not ( = ?auto_26916 ?auto_26923 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26918 ?auto_26919 ?auto_26920 )
      ( MAKE-5CRATE-VERIFY ?auto_26915 ?auto_26916 ?auto_26917 ?auto_26918 ?auto_26919 ?auto_26920 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26931 - SURFACE
      ?auto_26932 - SURFACE
    )
    :vars
    (
      ?auto_26941 - HOIST
      ?auto_26943 - PLACE
      ?auto_26935 - SURFACE
      ?auto_26944 - PLACE
      ?auto_26939 - HOIST
      ?auto_26936 - SURFACE
      ?auto_26942 - PLACE
      ?auto_26933 - HOIST
      ?auto_26938 - SURFACE
      ?auto_26934 - SURFACE
      ?auto_26937 - SURFACE
      ?auto_26940 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26941 ?auto_26943 ) ( IS-CRATE ?auto_26932 ) ( not ( = ?auto_26931 ?auto_26932 ) ) ( not ( = ?auto_26935 ?auto_26931 ) ) ( not ( = ?auto_26935 ?auto_26932 ) ) ( not ( = ?auto_26944 ?auto_26943 ) ) ( HOIST-AT ?auto_26939 ?auto_26944 ) ( not ( = ?auto_26941 ?auto_26939 ) ) ( AVAILABLE ?auto_26939 ) ( SURFACE-AT ?auto_26932 ?auto_26944 ) ( ON ?auto_26932 ?auto_26936 ) ( CLEAR ?auto_26932 ) ( not ( = ?auto_26931 ?auto_26936 ) ) ( not ( = ?auto_26932 ?auto_26936 ) ) ( not ( = ?auto_26935 ?auto_26936 ) ) ( IS-CRATE ?auto_26931 ) ( not ( = ?auto_26942 ?auto_26943 ) ) ( not ( = ?auto_26944 ?auto_26942 ) ) ( HOIST-AT ?auto_26933 ?auto_26942 ) ( not ( = ?auto_26941 ?auto_26933 ) ) ( not ( = ?auto_26939 ?auto_26933 ) ) ( SURFACE-AT ?auto_26931 ?auto_26942 ) ( ON ?auto_26931 ?auto_26938 ) ( CLEAR ?auto_26931 ) ( not ( = ?auto_26931 ?auto_26938 ) ) ( not ( = ?auto_26932 ?auto_26938 ) ) ( not ( = ?auto_26935 ?auto_26938 ) ) ( not ( = ?auto_26936 ?auto_26938 ) ) ( SURFACE-AT ?auto_26934 ?auto_26943 ) ( CLEAR ?auto_26934 ) ( IS-CRATE ?auto_26935 ) ( not ( = ?auto_26934 ?auto_26935 ) ) ( not ( = ?auto_26931 ?auto_26934 ) ) ( not ( = ?auto_26932 ?auto_26934 ) ) ( not ( = ?auto_26936 ?auto_26934 ) ) ( not ( = ?auto_26938 ?auto_26934 ) ) ( AVAILABLE ?auto_26941 ) ( AVAILABLE ?auto_26933 ) ( SURFACE-AT ?auto_26935 ?auto_26942 ) ( ON ?auto_26935 ?auto_26937 ) ( CLEAR ?auto_26935 ) ( not ( = ?auto_26931 ?auto_26937 ) ) ( not ( = ?auto_26932 ?auto_26937 ) ) ( not ( = ?auto_26935 ?auto_26937 ) ) ( not ( = ?auto_26936 ?auto_26937 ) ) ( not ( = ?auto_26938 ?auto_26937 ) ) ( not ( = ?auto_26934 ?auto_26937 ) ) ( TRUCK-AT ?auto_26940 ?auto_26943 ) )
    :subtasks
    ( ( !DRIVE ?auto_26940 ?auto_26943 ?auto_26942 )
      ( MAKE-2CRATE ?auto_26935 ?auto_26931 ?auto_26932 )
      ( MAKE-1CRATE-VERIFY ?auto_26931 ?auto_26932 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26945 - SURFACE
      ?auto_26946 - SURFACE
      ?auto_26947 - SURFACE
    )
    :vars
    (
      ?auto_26953 - HOIST
      ?auto_26958 - PLACE
      ?auto_26956 - PLACE
      ?auto_26952 - HOIST
      ?auto_26950 - SURFACE
      ?auto_26954 - PLACE
      ?auto_26951 - HOIST
      ?auto_26949 - SURFACE
      ?auto_26957 - SURFACE
      ?auto_26948 - SURFACE
      ?auto_26955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26953 ?auto_26958 ) ( IS-CRATE ?auto_26947 ) ( not ( = ?auto_26946 ?auto_26947 ) ) ( not ( = ?auto_26945 ?auto_26946 ) ) ( not ( = ?auto_26945 ?auto_26947 ) ) ( not ( = ?auto_26956 ?auto_26958 ) ) ( HOIST-AT ?auto_26952 ?auto_26956 ) ( not ( = ?auto_26953 ?auto_26952 ) ) ( AVAILABLE ?auto_26952 ) ( SURFACE-AT ?auto_26947 ?auto_26956 ) ( ON ?auto_26947 ?auto_26950 ) ( CLEAR ?auto_26947 ) ( not ( = ?auto_26946 ?auto_26950 ) ) ( not ( = ?auto_26947 ?auto_26950 ) ) ( not ( = ?auto_26945 ?auto_26950 ) ) ( IS-CRATE ?auto_26946 ) ( not ( = ?auto_26954 ?auto_26958 ) ) ( not ( = ?auto_26956 ?auto_26954 ) ) ( HOIST-AT ?auto_26951 ?auto_26954 ) ( not ( = ?auto_26953 ?auto_26951 ) ) ( not ( = ?auto_26952 ?auto_26951 ) ) ( SURFACE-AT ?auto_26946 ?auto_26954 ) ( ON ?auto_26946 ?auto_26949 ) ( CLEAR ?auto_26946 ) ( not ( = ?auto_26946 ?auto_26949 ) ) ( not ( = ?auto_26947 ?auto_26949 ) ) ( not ( = ?auto_26945 ?auto_26949 ) ) ( not ( = ?auto_26950 ?auto_26949 ) ) ( SURFACE-AT ?auto_26957 ?auto_26958 ) ( CLEAR ?auto_26957 ) ( IS-CRATE ?auto_26945 ) ( not ( = ?auto_26957 ?auto_26945 ) ) ( not ( = ?auto_26946 ?auto_26957 ) ) ( not ( = ?auto_26947 ?auto_26957 ) ) ( not ( = ?auto_26950 ?auto_26957 ) ) ( not ( = ?auto_26949 ?auto_26957 ) ) ( AVAILABLE ?auto_26953 ) ( AVAILABLE ?auto_26951 ) ( SURFACE-AT ?auto_26945 ?auto_26954 ) ( ON ?auto_26945 ?auto_26948 ) ( CLEAR ?auto_26945 ) ( not ( = ?auto_26946 ?auto_26948 ) ) ( not ( = ?auto_26947 ?auto_26948 ) ) ( not ( = ?auto_26945 ?auto_26948 ) ) ( not ( = ?auto_26950 ?auto_26948 ) ) ( not ( = ?auto_26949 ?auto_26948 ) ) ( not ( = ?auto_26957 ?auto_26948 ) ) ( TRUCK-AT ?auto_26955 ?auto_26958 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26946 ?auto_26947 )
      ( MAKE-2CRATE-VERIFY ?auto_26945 ?auto_26946 ?auto_26947 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26959 - SURFACE
      ?auto_26960 - SURFACE
      ?auto_26961 - SURFACE
      ?auto_26962 - SURFACE
    )
    :vars
    (
      ?auto_26963 - HOIST
      ?auto_26966 - PLACE
      ?auto_26968 - PLACE
      ?auto_26971 - HOIST
      ?auto_26965 - SURFACE
      ?auto_26967 - PLACE
      ?auto_26970 - HOIST
      ?auto_26969 - SURFACE
      ?auto_26964 - SURFACE
      ?auto_26972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26963 ?auto_26966 ) ( IS-CRATE ?auto_26962 ) ( not ( = ?auto_26961 ?auto_26962 ) ) ( not ( = ?auto_26960 ?auto_26961 ) ) ( not ( = ?auto_26960 ?auto_26962 ) ) ( not ( = ?auto_26968 ?auto_26966 ) ) ( HOIST-AT ?auto_26971 ?auto_26968 ) ( not ( = ?auto_26963 ?auto_26971 ) ) ( AVAILABLE ?auto_26971 ) ( SURFACE-AT ?auto_26962 ?auto_26968 ) ( ON ?auto_26962 ?auto_26965 ) ( CLEAR ?auto_26962 ) ( not ( = ?auto_26961 ?auto_26965 ) ) ( not ( = ?auto_26962 ?auto_26965 ) ) ( not ( = ?auto_26960 ?auto_26965 ) ) ( IS-CRATE ?auto_26961 ) ( not ( = ?auto_26967 ?auto_26966 ) ) ( not ( = ?auto_26968 ?auto_26967 ) ) ( HOIST-AT ?auto_26970 ?auto_26967 ) ( not ( = ?auto_26963 ?auto_26970 ) ) ( not ( = ?auto_26971 ?auto_26970 ) ) ( SURFACE-AT ?auto_26961 ?auto_26967 ) ( ON ?auto_26961 ?auto_26969 ) ( CLEAR ?auto_26961 ) ( not ( = ?auto_26961 ?auto_26969 ) ) ( not ( = ?auto_26962 ?auto_26969 ) ) ( not ( = ?auto_26960 ?auto_26969 ) ) ( not ( = ?auto_26965 ?auto_26969 ) ) ( SURFACE-AT ?auto_26959 ?auto_26966 ) ( CLEAR ?auto_26959 ) ( IS-CRATE ?auto_26960 ) ( not ( = ?auto_26959 ?auto_26960 ) ) ( not ( = ?auto_26961 ?auto_26959 ) ) ( not ( = ?auto_26962 ?auto_26959 ) ) ( not ( = ?auto_26965 ?auto_26959 ) ) ( not ( = ?auto_26969 ?auto_26959 ) ) ( AVAILABLE ?auto_26963 ) ( AVAILABLE ?auto_26970 ) ( SURFACE-AT ?auto_26960 ?auto_26967 ) ( ON ?auto_26960 ?auto_26964 ) ( CLEAR ?auto_26960 ) ( not ( = ?auto_26961 ?auto_26964 ) ) ( not ( = ?auto_26962 ?auto_26964 ) ) ( not ( = ?auto_26960 ?auto_26964 ) ) ( not ( = ?auto_26965 ?auto_26964 ) ) ( not ( = ?auto_26969 ?auto_26964 ) ) ( not ( = ?auto_26959 ?auto_26964 ) ) ( TRUCK-AT ?auto_26972 ?auto_26966 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26960 ?auto_26961 ?auto_26962 )
      ( MAKE-3CRATE-VERIFY ?auto_26959 ?auto_26960 ?auto_26961 ?auto_26962 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26973 - SURFACE
      ?auto_26974 - SURFACE
      ?auto_26975 - SURFACE
      ?auto_26976 - SURFACE
      ?auto_26977 - SURFACE
    )
    :vars
    (
      ?auto_26978 - HOIST
      ?auto_26981 - PLACE
      ?auto_26983 - PLACE
      ?auto_26986 - HOIST
      ?auto_26980 - SURFACE
      ?auto_26982 - PLACE
      ?auto_26985 - HOIST
      ?auto_26984 - SURFACE
      ?auto_26979 - SURFACE
      ?auto_26987 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26978 ?auto_26981 ) ( IS-CRATE ?auto_26977 ) ( not ( = ?auto_26976 ?auto_26977 ) ) ( not ( = ?auto_26975 ?auto_26976 ) ) ( not ( = ?auto_26975 ?auto_26977 ) ) ( not ( = ?auto_26983 ?auto_26981 ) ) ( HOIST-AT ?auto_26986 ?auto_26983 ) ( not ( = ?auto_26978 ?auto_26986 ) ) ( AVAILABLE ?auto_26986 ) ( SURFACE-AT ?auto_26977 ?auto_26983 ) ( ON ?auto_26977 ?auto_26980 ) ( CLEAR ?auto_26977 ) ( not ( = ?auto_26976 ?auto_26980 ) ) ( not ( = ?auto_26977 ?auto_26980 ) ) ( not ( = ?auto_26975 ?auto_26980 ) ) ( IS-CRATE ?auto_26976 ) ( not ( = ?auto_26982 ?auto_26981 ) ) ( not ( = ?auto_26983 ?auto_26982 ) ) ( HOIST-AT ?auto_26985 ?auto_26982 ) ( not ( = ?auto_26978 ?auto_26985 ) ) ( not ( = ?auto_26986 ?auto_26985 ) ) ( SURFACE-AT ?auto_26976 ?auto_26982 ) ( ON ?auto_26976 ?auto_26984 ) ( CLEAR ?auto_26976 ) ( not ( = ?auto_26976 ?auto_26984 ) ) ( not ( = ?auto_26977 ?auto_26984 ) ) ( not ( = ?auto_26975 ?auto_26984 ) ) ( not ( = ?auto_26980 ?auto_26984 ) ) ( SURFACE-AT ?auto_26974 ?auto_26981 ) ( CLEAR ?auto_26974 ) ( IS-CRATE ?auto_26975 ) ( not ( = ?auto_26974 ?auto_26975 ) ) ( not ( = ?auto_26976 ?auto_26974 ) ) ( not ( = ?auto_26977 ?auto_26974 ) ) ( not ( = ?auto_26980 ?auto_26974 ) ) ( not ( = ?auto_26984 ?auto_26974 ) ) ( AVAILABLE ?auto_26978 ) ( AVAILABLE ?auto_26985 ) ( SURFACE-AT ?auto_26975 ?auto_26982 ) ( ON ?auto_26975 ?auto_26979 ) ( CLEAR ?auto_26975 ) ( not ( = ?auto_26976 ?auto_26979 ) ) ( not ( = ?auto_26977 ?auto_26979 ) ) ( not ( = ?auto_26975 ?auto_26979 ) ) ( not ( = ?auto_26980 ?auto_26979 ) ) ( not ( = ?auto_26984 ?auto_26979 ) ) ( not ( = ?auto_26974 ?auto_26979 ) ) ( TRUCK-AT ?auto_26987 ?auto_26981 ) ( ON ?auto_26974 ?auto_26973 ) ( not ( = ?auto_26973 ?auto_26974 ) ) ( not ( = ?auto_26973 ?auto_26975 ) ) ( not ( = ?auto_26973 ?auto_26976 ) ) ( not ( = ?auto_26973 ?auto_26977 ) ) ( not ( = ?auto_26973 ?auto_26980 ) ) ( not ( = ?auto_26973 ?auto_26984 ) ) ( not ( = ?auto_26973 ?auto_26979 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26975 ?auto_26976 ?auto_26977 )
      ( MAKE-4CRATE-VERIFY ?auto_26973 ?auto_26974 ?auto_26975 ?auto_26976 ?auto_26977 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26988 - SURFACE
      ?auto_26989 - SURFACE
      ?auto_26990 - SURFACE
      ?auto_26991 - SURFACE
      ?auto_26992 - SURFACE
      ?auto_26993 - SURFACE
    )
    :vars
    (
      ?auto_26994 - HOIST
      ?auto_26997 - PLACE
      ?auto_26999 - PLACE
      ?auto_27002 - HOIST
      ?auto_26996 - SURFACE
      ?auto_26998 - PLACE
      ?auto_27001 - HOIST
      ?auto_27000 - SURFACE
      ?auto_26995 - SURFACE
      ?auto_27003 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26994 ?auto_26997 ) ( IS-CRATE ?auto_26993 ) ( not ( = ?auto_26992 ?auto_26993 ) ) ( not ( = ?auto_26991 ?auto_26992 ) ) ( not ( = ?auto_26991 ?auto_26993 ) ) ( not ( = ?auto_26999 ?auto_26997 ) ) ( HOIST-AT ?auto_27002 ?auto_26999 ) ( not ( = ?auto_26994 ?auto_27002 ) ) ( AVAILABLE ?auto_27002 ) ( SURFACE-AT ?auto_26993 ?auto_26999 ) ( ON ?auto_26993 ?auto_26996 ) ( CLEAR ?auto_26993 ) ( not ( = ?auto_26992 ?auto_26996 ) ) ( not ( = ?auto_26993 ?auto_26996 ) ) ( not ( = ?auto_26991 ?auto_26996 ) ) ( IS-CRATE ?auto_26992 ) ( not ( = ?auto_26998 ?auto_26997 ) ) ( not ( = ?auto_26999 ?auto_26998 ) ) ( HOIST-AT ?auto_27001 ?auto_26998 ) ( not ( = ?auto_26994 ?auto_27001 ) ) ( not ( = ?auto_27002 ?auto_27001 ) ) ( SURFACE-AT ?auto_26992 ?auto_26998 ) ( ON ?auto_26992 ?auto_27000 ) ( CLEAR ?auto_26992 ) ( not ( = ?auto_26992 ?auto_27000 ) ) ( not ( = ?auto_26993 ?auto_27000 ) ) ( not ( = ?auto_26991 ?auto_27000 ) ) ( not ( = ?auto_26996 ?auto_27000 ) ) ( SURFACE-AT ?auto_26990 ?auto_26997 ) ( CLEAR ?auto_26990 ) ( IS-CRATE ?auto_26991 ) ( not ( = ?auto_26990 ?auto_26991 ) ) ( not ( = ?auto_26992 ?auto_26990 ) ) ( not ( = ?auto_26993 ?auto_26990 ) ) ( not ( = ?auto_26996 ?auto_26990 ) ) ( not ( = ?auto_27000 ?auto_26990 ) ) ( AVAILABLE ?auto_26994 ) ( AVAILABLE ?auto_27001 ) ( SURFACE-AT ?auto_26991 ?auto_26998 ) ( ON ?auto_26991 ?auto_26995 ) ( CLEAR ?auto_26991 ) ( not ( = ?auto_26992 ?auto_26995 ) ) ( not ( = ?auto_26993 ?auto_26995 ) ) ( not ( = ?auto_26991 ?auto_26995 ) ) ( not ( = ?auto_26996 ?auto_26995 ) ) ( not ( = ?auto_27000 ?auto_26995 ) ) ( not ( = ?auto_26990 ?auto_26995 ) ) ( TRUCK-AT ?auto_27003 ?auto_26997 ) ( ON ?auto_26989 ?auto_26988 ) ( ON ?auto_26990 ?auto_26989 ) ( not ( = ?auto_26988 ?auto_26989 ) ) ( not ( = ?auto_26988 ?auto_26990 ) ) ( not ( = ?auto_26988 ?auto_26991 ) ) ( not ( = ?auto_26988 ?auto_26992 ) ) ( not ( = ?auto_26988 ?auto_26993 ) ) ( not ( = ?auto_26988 ?auto_26996 ) ) ( not ( = ?auto_26988 ?auto_27000 ) ) ( not ( = ?auto_26988 ?auto_26995 ) ) ( not ( = ?auto_26989 ?auto_26990 ) ) ( not ( = ?auto_26989 ?auto_26991 ) ) ( not ( = ?auto_26989 ?auto_26992 ) ) ( not ( = ?auto_26989 ?auto_26993 ) ) ( not ( = ?auto_26989 ?auto_26996 ) ) ( not ( = ?auto_26989 ?auto_27000 ) ) ( not ( = ?auto_26989 ?auto_26995 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26991 ?auto_26992 ?auto_26993 )
      ( MAKE-5CRATE-VERIFY ?auto_26988 ?auto_26989 ?auto_26990 ?auto_26991 ?auto_26992 ?auto_26993 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27004 - SURFACE
      ?auto_27005 - SURFACE
    )
    :vars
    (
      ?auto_27006 - HOIST
      ?auto_27009 - PLACE
      ?auto_27012 - SURFACE
      ?auto_27013 - PLACE
      ?auto_27016 - HOIST
      ?auto_27008 - SURFACE
      ?auto_27011 - PLACE
      ?auto_27015 - HOIST
      ?auto_27014 - SURFACE
      ?auto_27010 - SURFACE
      ?auto_27007 - SURFACE
      ?auto_27017 - TRUCK
      ?auto_27018 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27006 ?auto_27009 ) ( IS-CRATE ?auto_27005 ) ( not ( = ?auto_27004 ?auto_27005 ) ) ( not ( = ?auto_27012 ?auto_27004 ) ) ( not ( = ?auto_27012 ?auto_27005 ) ) ( not ( = ?auto_27013 ?auto_27009 ) ) ( HOIST-AT ?auto_27016 ?auto_27013 ) ( not ( = ?auto_27006 ?auto_27016 ) ) ( AVAILABLE ?auto_27016 ) ( SURFACE-AT ?auto_27005 ?auto_27013 ) ( ON ?auto_27005 ?auto_27008 ) ( CLEAR ?auto_27005 ) ( not ( = ?auto_27004 ?auto_27008 ) ) ( not ( = ?auto_27005 ?auto_27008 ) ) ( not ( = ?auto_27012 ?auto_27008 ) ) ( IS-CRATE ?auto_27004 ) ( not ( = ?auto_27011 ?auto_27009 ) ) ( not ( = ?auto_27013 ?auto_27011 ) ) ( HOIST-AT ?auto_27015 ?auto_27011 ) ( not ( = ?auto_27006 ?auto_27015 ) ) ( not ( = ?auto_27016 ?auto_27015 ) ) ( SURFACE-AT ?auto_27004 ?auto_27011 ) ( ON ?auto_27004 ?auto_27014 ) ( CLEAR ?auto_27004 ) ( not ( = ?auto_27004 ?auto_27014 ) ) ( not ( = ?auto_27005 ?auto_27014 ) ) ( not ( = ?auto_27012 ?auto_27014 ) ) ( not ( = ?auto_27008 ?auto_27014 ) ) ( IS-CRATE ?auto_27012 ) ( not ( = ?auto_27010 ?auto_27012 ) ) ( not ( = ?auto_27004 ?auto_27010 ) ) ( not ( = ?auto_27005 ?auto_27010 ) ) ( not ( = ?auto_27008 ?auto_27010 ) ) ( not ( = ?auto_27014 ?auto_27010 ) ) ( AVAILABLE ?auto_27015 ) ( SURFACE-AT ?auto_27012 ?auto_27011 ) ( ON ?auto_27012 ?auto_27007 ) ( CLEAR ?auto_27012 ) ( not ( = ?auto_27004 ?auto_27007 ) ) ( not ( = ?auto_27005 ?auto_27007 ) ) ( not ( = ?auto_27012 ?auto_27007 ) ) ( not ( = ?auto_27008 ?auto_27007 ) ) ( not ( = ?auto_27014 ?auto_27007 ) ) ( not ( = ?auto_27010 ?auto_27007 ) ) ( TRUCK-AT ?auto_27017 ?auto_27009 ) ( SURFACE-AT ?auto_27018 ?auto_27009 ) ( CLEAR ?auto_27018 ) ( LIFTING ?auto_27006 ?auto_27010 ) ( IS-CRATE ?auto_27010 ) ( not ( = ?auto_27018 ?auto_27010 ) ) ( not ( = ?auto_27004 ?auto_27018 ) ) ( not ( = ?auto_27005 ?auto_27018 ) ) ( not ( = ?auto_27012 ?auto_27018 ) ) ( not ( = ?auto_27008 ?auto_27018 ) ) ( not ( = ?auto_27014 ?auto_27018 ) ) ( not ( = ?auto_27007 ?auto_27018 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27018 ?auto_27010 )
      ( MAKE-2CRATE ?auto_27012 ?auto_27004 ?auto_27005 )
      ( MAKE-1CRATE-VERIFY ?auto_27004 ?auto_27005 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27019 - SURFACE
      ?auto_27020 - SURFACE
      ?auto_27021 - SURFACE
    )
    :vars
    (
      ?auto_27032 - HOIST
      ?auto_27022 - PLACE
      ?auto_27026 - PLACE
      ?auto_27033 - HOIST
      ?auto_27023 - SURFACE
      ?auto_27024 - PLACE
      ?auto_27025 - HOIST
      ?auto_27031 - SURFACE
      ?auto_27027 - SURFACE
      ?auto_27030 - SURFACE
      ?auto_27029 - TRUCK
      ?auto_27028 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27032 ?auto_27022 ) ( IS-CRATE ?auto_27021 ) ( not ( = ?auto_27020 ?auto_27021 ) ) ( not ( = ?auto_27019 ?auto_27020 ) ) ( not ( = ?auto_27019 ?auto_27021 ) ) ( not ( = ?auto_27026 ?auto_27022 ) ) ( HOIST-AT ?auto_27033 ?auto_27026 ) ( not ( = ?auto_27032 ?auto_27033 ) ) ( AVAILABLE ?auto_27033 ) ( SURFACE-AT ?auto_27021 ?auto_27026 ) ( ON ?auto_27021 ?auto_27023 ) ( CLEAR ?auto_27021 ) ( not ( = ?auto_27020 ?auto_27023 ) ) ( not ( = ?auto_27021 ?auto_27023 ) ) ( not ( = ?auto_27019 ?auto_27023 ) ) ( IS-CRATE ?auto_27020 ) ( not ( = ?auto_27024 ?auto_27022 ) ) ( not ( = ?auto_27026 ?auto_27024 ) ) ( HOIST-AT ?auto_27025 ?auto_27024 ) ( not ( = ?auto_27032 ?auto_27025 ) ) ( not ( = ?auto_27033 ?auto_27025 ) ) ( SURFACE-AT ?auto_27020 ?auto_27024 ) ( ON ?auto_27020 ?auto_27031 ) ( CLEAR ?auto_27020 ) ( not ( = ?auto_27020 ?auto_27031 ) ) ( not ( = ?auto_27021 ?auto_27031 ) ) ( not ( = ?auto_27019 ?auto_27031 ) ) ( not ( = ?auto_27023 ?auto_27031 ) ) ( IS-CRATE ?auto_27019 ) ( not ( = ?auto_27027 ?auto_27019 ) ) ( not ( = ?auto_27020 ?auto_27027 ) ) ( not ( = ?auto_27021 ?auto_27027 ) ) ( not ( = ?auto_27023 ?auto_27027 ) ) ( not ( = ?auto_27031 ?auto_27027 ) ) ( AVAILABLE ?auto_27025 ) ( SURFACE-AT ?auto_27019 ?auto_27024 ) ( ON ?auto_27019 ?auto_27030 ) ( CLEAR ?auto_27019 ) ( not ( = ?auto_27020 ?auto_27030 ) ) ( not ( = ?auto_27021 ?auto_27030 ) ) ( not ( = ?auto_27019 ?auto_27030 ) ) ( not ( = ?auto_27023 ?auto_27030 ) ) ( not ( = ?auto_27031 ?auto_27030 ) ) ( not ( = ?auto_27027 ?auto_27030 ) ) ( TRUCK-AT ?auto_27029 ?auto_27022 ) ( SURFACE-AT ?auto_27028 ?auto_27022 ) ( CLEAR ?auto_27028 ) ( LIFTING ?auto_27032 ?auto_27027 ) ( IS-CRATE ?auto_27027 ) ( not ( = ?auto_27028 ?auto_27027 ) ) ( not ( = ?auto_27020 ?auto_27028 ) ) ( not ( = ?auto_27021 ?auto_27028 ) ) ( not ( = ?auto_27019 ?auto_27028 ) ) ( not ( = ?auto_27023 ?auto_27028 ) ) ( not ( = ?auto_27031 ?auto_27028 ) ) ( not ( = ?auto_27030 ?auto_27028 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27020 ?auto_27021 )
      ( MAKE-2CRATE-VERIFY ?auto_27019 ?auto_27020 ?auto_27021 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27034 - SURFACE
      ?auto_27035 - SURFACE
      ?auto_27036 - SURFACE
      ?auto_27037 - SURFACE
    )
    :vars
    (
      ?auto_27039 - HOIST
      ?auto_27045 - PLACE
      ?auto_27047 - PLACE
      ?auto_27038 - HOIST
      ?auto_27046 - SURFACE
      ?auto_27042 - PLACE
      ?auto_27040 - HOIST
      ?auto_27043 - SURFACE
      ?auto_27044 - SURFACE
      ?auto_27041 - TRUCK
      ?auto_27048 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27039 ?auto_27045 ) ( IS-CRATE ?auto_27037 ) ( not ( = ?auto_27036 ?auto_27037 ) ) ( not ( = ?auto_27035 ?auto_27036 ) ) ( not ( = ?auto_27035 ?auto_27037 ) ) ( not ( = ?auto_27047 ?auto_27045 ) ) ( HOIST-AT ?auto_27038 ?auto_27047 ) ( not ( = ?auto_27039 ?auto_27038 ) ) ( AVAILABLE ?auto_27038 ) ( SURFACE-AT ?auto_27037 ?auto_27047 ) ( ON ?auto_27037 ?auto_27046 ) ( CLEAR ?auto_27037 ) ( not ( = ?auto_27036 ?auto_27046 ) ) ( not ( = ?auto_27037 ?auto_27046 ) ) ( not ( = ?auto_27035 ?auto_27046 ) ) ( IS-CRATE ?auto_27036 ) ( not ( = ?auto_27042 ?auto_27045 ) ) ( not ( = ?auto_27047 ?auto_27042 ) ) ( HOIST-AT ?auto_27040 ?auto_27042 ) ( not ( = ?auto_27039 ?auto_27040 ) ) ( not ( = ?auto_27038 ?auto_27040 ) ) ( SURFACE-AT ?auto_27036 ?auto_27042 ) ( ON ?auto_27036 ?auto_27043 ) ( CLEAR ?auto_27036 ) ( not ( = ?auto_27036 ?auto_27043 ) ) ( not ( = ?auto_27037 ?auto_27043 ) ) ( not ( = ?auto_27035 ?auto_27043 ) ) ( not ( = ?auto_27046 ?auto_27043 ) ) ( IS-CRATE ?auto_27035 ) ( not ( = ?auto_27034 ?auto_27035 ) ) ( not ( = ?auto_27036 ?auto_27034 ) ) ( not ( = ?auto_27037 ?auto_27034 ) ) ( not ( = ?auto_27046 ?auto_27034 ) ) ( not ( = ?auto_27043 ?auto_27034 ) ) ( AVAILABLE ?auto_27040 ) ( SURFACE-AT ?auto_27035 ?auto_27042 ) ( ON ?auto_27035 ?auto_27044 ) ( CLEAR ?auto_27035 ) ( not ( = ?auto_27036 ?auto_27044 ) ) ( not ( = ?auto_27037 ?auto_27044 ) ) ( not ( = ?auto_27035 ?auto_27044 ) ) ( not ( = ?auto_27046 ?auto_27044 ) ) ( not ( = ?auto_27043 ?auto_27044 ) ) ( not ( = ?auto_27034 ?auto_27044 ) ) ( TRUCK-AT ?auto_27041 ?auto_27045 ) ( SURFACE-AT ?auto_27048 ?auto_27045 ) ( CLEAR ?auto_27048 ) ( LIFTING ?auto_27039 ?auto_27034 ) ( IS-CRATE ?auto_27034 ) ( not ( = ?auto_27048 ?auto_27034 ) ) ( not ( = ?auto_27036 ?auto_27048 ) ) ( not ( = ?auto_27037 ?auto_27048 ) ) ( not ( = ?auto_27035 ?auto_27048 ) ) ( not ( = ?auto_27046 ?auto_27048 ) ) ( not ( = ?auto_27043 ?auto_27048 ) ) ( not ( = ?auto_27044 ?auto_27048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27035 ?auto_27036 ?auto_27037 )
      ( MAKE-3CRATE-VERIFY ?auto_27034 ?auto_27035 ?auto_27036 ?auto_27037 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27049 - SURFACE
      ?auto_27050 - SURFACE
      ?auto_27051 - SURFACE
      ?auto_27052 - SURFACE
      ?auto_27053 - SURFACE
    )
    :vars
    (
      ?auto_27055 - HOIST
      ?auto_27061 - PLACE
      ?auto_27063 - PLACE
      ?auto_27054 - HOIST
      ?auto_27062 - SURFACE
      ?auto_27058 - PLACE
      ?auto_27056 - HOIST
      ?auto_27059 - SURFACE
      ?auto_27060 - SURFACE
      ?auto_27057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27055 ?auto_27061 ) ( IS-CRATE ?auto_27053 ) ( not ( = ?auto_27052 ?auto_27053 ) ) ( not ( = ?auto_27051 ?auto_27052 ) ) ( not ( = ?auto_27051 ?auto_27053 ) ) ( not ( = ?auto_27063 ?auto_27061 ) ) ( HOIST-AT ?auto_27054 ?auto_27063 ) ( not ( = ?auto_27055 ?auto_27054 ) ) ( AVAILABLE ?auto_27054 ) ( SURFACE-AT ?auto_27053 ?auto_27063 ) ( ON ?auto_27053 ?auto_27062 ) ( CLEAR ?auto_27053 ) ( not ( = ?auto_27052 ?auto_27062 ) ) ( not ( = ?auto_27053 ?auto_27062 ) ) ( not ( = ?auto_27051 ?auto_27062 ) ) ( IS-CRATE ?auto_27052 ) ( not ( = ?auto_27058 ?auto_27061 ) ) ( not ( = ?auto_27063 ?auto_27058 ) ) ( HOIST-AT ?auto_27056 ?auto_27058 ) ( not ( = ?auto_27055 ?auto_27056 ) ) ( not ( = ?auto_27054 ?auto_27056 ) ) ( SURFACE-AT ?auto_27052 ?auto_27058 ) ( ON ?auto_27052 ?auto_27059 ) ( CLEAR ?auto_27052 ) ( not ( = ?auto_27052 ?auto_27059 ) ) ( not ( = ?auto_27053 ?auto_27059 ) ) ( not ( = ?auto_27051 ?auto_27059 ) ) ( not ( = ?auto_27062 ?auto_27059 ) ) ( IS-CRATE ?auto_27051 ) ( not ( = ?auto_27050 ?auto_27051 ) ) ( not ( = ?auto_27052 ?auto_27050 ) ) ( not ( = ?auto_27053 ?auto_27050 ) ) ( not ( = ?auto_27062 ?auto_27050 ) ) ( not ( = ?auto_27059 ?auto_27050 ) ) ( AVAILABLE ?auto_27056 ) ( SURFACE-AT ?auto_27051 ?auto_27058 ) ( ON ?auto_27051 ?auto_27060 ) ( CLEAR ?auto_27051 ) ( not ( = ?auto_27052 ?auto_27060 ) ) ( not ( = ?auto_27053 ?auto_27060 ) ) ( not ( = ?auto_27051 ?auto_27060 ) ) ( not ( = ?auto_27062 ?auto_27060 ) ) ( not ( = ?auto_27059 ?auto_27060 ) ) ( not ( = ?auto_27050 ?auto_27060 ) ) ( TRUCK-AT ?auto_27057 ?auto_27061 ) ( SURFACE-AT ?auto_27049 ?auto_27061 ) ( CLEAR ?auto_27049 ) ( LIFTING ?auto_27055 ?auto_27050 ) ( IS-CRATE ?auto_27050 ) ( not ( = ?auto_27049 ?auto_27050 ) ) ( not ( = ?auto_27052 ?auto_27049 ) ) ( not ( = ?auto_27053 ?auto_27049 ) ) ( not ( = ?auto_27051 ?auto_27049 ) ) ( not ( = ?auto_27062 ?auto_27049 ) ) ( not ( = ?auto_27059 ?auto_27049 ) ) ( not ( = ?auto_27060 ?auto_27049 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27051 ?auto_27052 ?auto_27053 )
      ( MAKE-4CRATE-VERIFY ?auto_27049 ?auto_27050 ?auto_27051 ?auto_27052 ?auto_27053 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27064 - SURFACE
      ?auto_27065 - SURFACE
      ?auto_27066 - SURFACE
      ?auto_27067 - SURFACE
      ?auto_27068 - SURFACE
      ?auto_27069 - SURFACE
    )
    :vars
    (
      ?auto_27071 - HOIST
      ?auto_27077 - PLACE
      ?auto_27079 - PLACE
      ?auto_27070 - HOIST
      ?auto_27078 - SURFACE
      ?auto_27074 - PLACE
      ?auto_27072 - HOIST
      ?auto_27075 - SURFACE
      ?auto_27076 - SURFACE
      ?auto_27073 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27071 ?auto_27077 ) ( IS-CRATE ?auto_27069 ) ( not ( = ?auto_27068 ?auto_27069 ) ) ( not ( = ?auto_27067 ?auto_27068 ) ) ( not ( = ?auto_27067 ?auto_27069 ) ) ( not ( = ?auto_27079 ?auto_27077 ) ) ( HOIST-AT ?auto_27070 ?auto_27079 ) ( not ( = ?auto_27071 ?auto_27070 ) ) ( AVAILABLE ?auto_27070 ) ( SURFACE-AT ?auto_27069 ?auto_27079 ) ( ON ?auto_27069 ?auto_27078 ) ( CLEAR ?auto_27069 ) ( not ( = ?auto_27068 ?auto_27078 ) ) ( not ( = ?auto_27069 ?auto_27078 ) ) ( not ( = ?auto_27067 ?auto_27078 ) ) ( IS-CRATE ?auto_27068 ) ( not ( = ?auto_27074 ?auto_27077 ) ) ( not ( = ?auto_27079 ?auto_27074 ) ) ( HOIST-AT ?auto_27072 ?auto_27074 ) ( not ( = ?auto_27071 ?auto_27072 ) ) ( not ( = ?auto_27070 ?auto_27072 ) ) ( SURFACE-AT ?auto_27068 ?auto_27074 ) ( ON ?auto_27068 ?auto_27075 ) ( CLEAR ?auto_27068 ) ( not ( = ?auto_27068 ?auto_27075 ) ) ( not ( = ?auto_27069 ?auto_27075 ) ) ( not ( = ?auto_27067 ?auto_27075 ) ) ( not ( = ?auto_27078 ?auto_27075 ) ) ( IS-CRATE ?auto_27067 ) ( not ( = ?auto_27066 ?auto_27067 ) ) ( not ( = ?auto_27068 ?auto_27066 ) ) ( not ( = ?auto_27069 ?auto_27066 ) ) ( not ( = ?auto_27078 ?auto_27066 ) ) ( not ( = ?auto_27075 ?auto_27066 ) ) ( AVAILABLE ?auto_27072 ) ( SURFACE-AT ?auto_27067 ?auto_27074 ) ( ON ?auto_27067 ?auto_27076 ) ( CLEAR ?auto_27067 ) ( not ( = ?auto_27068 ?auto_27076 ) ) ( not ( = ?auto_27069 ?auto_27076 ) ) ( not ( = ?auto_27067 ?auto_27076 ) ) ( not ( = ?auto_27078 ?auto_27076 ) ) ( not ( = ?auto_27075 ?auto_27076 ) ) ( not ( = ?auto_27066 ?auto_27076 ) ) ( TRUCK-AT ?auto_27073 ?auto_27077 ) ( SURFACE-AT ?auto_27065 ?auto_27077 ) ( CLEAR ?auto_27065 ) ( LIFTING ?auto_27071 ?auto_27066 ) ( IS-CRATE ?auto_27066 ) ( not ( = ?auto_27065 ?auto_27066 ) ) ( not ( = ?auto_27068 ?auto_27065 ) ) ( not ( = ?auto_27069 ?auto_27065 ) ) ( not ( = ?auto_27067 ?auto_27065 ) ) ( not ( = ?auto_27078 ?auto_27065 ) ) ( not ( = ?auto_27075 ?auto_27065 ) ) ( not ( = ?auto_27076 ?auto_27065 ) ) ( ON ?auto_27065 ?auto_27064 ) ( not ( = ?auto_27064 ?auto_27065 ) ) ( not ( = ?auto_27064 ?auto_27066 ) ) ( not ( = ?auto_27064 ?auto_27067 ) ) ( not ( = ?auto_27064 ?auto_27068 ) ) ( not ( = ?auto_27064 ?auto_27069 ) ) ( not ( = ?auto_27064 ?auto_27078 ) ) ( not ( = ?auto_27064 ?auto_27075 ) ) ( not ( = ?auto_27064 ?auto_27076 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27067 ?auto_27068 ?auto_27069 )
      ( MAKE-5CRATE-VERIFY ?auto_27064 ?auto_27065 ?auto_27066 ?auto_27067 ?auto_27068 ?auto_27069 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27080 - SURFACE
      ?auto_27081 - SURFACE
    )
    :vars
    (
      ?auto_27084 - HOIST
      ?auto_27091 - PLACE
      ?auto_27083 - SURFACE
      ?auto_27093 - PLACE
      ?auto_27082 - HOIST
      ?auto_27092 - SURFACE
      ?auto_27088 - PLACE
      ?auto_27085 - HOIST
      ?auto_27089 - SURFACE
      ?auto_27086 - SURFACE
      ?auto_27090 - SURFACE
      ?auto_27087 - TRUCK
      ?auto_27094 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27084 ?auto_27091 ) ( IS-CRATE ?auto_27081 ) ( not ( = ?auto_27080 ?auto_27081 ) ) ( not ( = ?auto_27083 ?auto_27080 ) ) ( not ( = ?auto_27083 ?auto_27081 ) ) ( not ( = ?auto_27093 ?auto_27091 ) ) ( HOIST-AT ?auto_27082 ?auto_27093 ) ( not ( = ?auto_27084 ?auto_27082 ) ) ( AVAILABLE ?auto_27082 ) ( SURFACE-AT ?auto_27081 ?auto_27093 ) ( ON ?auto_27081 ?auto_27092 ) ( CLEAR ?auto_27081 ) ( not ( = ?auto_27080 ?auto_27092 ) ) ( not ( = ?auto_27081 ?auto_27092 ) ) ( not ( = ?auto_27083 ?auto_27092 ) ) ( IS-CRATE ?auto_27080 ) ( not ( = ?auto_27088 ?auto_27091 ) ) ( not ( = ?auto_27093 ?auto_27088 ) ) ( HOIST-AT ?auto_27085 ?auto_27088 ) ( not ( = ?auto_27084 ?auto_27085 ) ) ( not ( = ?auto_27082 ?auto_27085 ) ) ( SURFACE-AT ?auto_27080 ?auto_27088 ) ( ON ?auto_27080 ?auto_27089 ) ( CLEAR ?auto_27080 ) ( not ( = ?auto_27080 ?auto_27089 ) ) ( not ( = ?auto_27081 ?auto_27089 ) ) ( not ( = ?auto_27083 ?auto_27089 ) ) ( not ( = ?auto_27092 ?auto_27089 ) ) ( IS-CRATE ?auto_27083 ) ( not ( = ?auto_27086 ?auto_27083 ) ) ( not ( = ?auto_27080 ?auto_27086 ) ) ( not ( = ?auto_27081 ?auto_27086 ) ) ( not ( = ?auto_27092 ?auto_27086 ) ) ( not ( = ?auto_27089 ?auto_27086 ) ) ( AVAILABLE ?auto_27085 ) ( SURFACE-AT ?auto_27083 ?auto_27088 ) ( ON ?auto_27083 ?auto_27090 ) ( CLEAR ?auto_27083 ) ( not ( = ?auto_27080 ?auto_27090 ) ) ( not ( = ?auto_27081 ?auto_27090 ) ) ( not ( = ?auto_27083 ?auto_27090 ) ) ( not ( = ?auto_27092 ?auto_27090 ) ) ( not ( = ?auto_27089 ?auto_27090 ) ) ( not ( = ?auto_27086 ?auto_27090 ) ) ( TRUCK-AT ?auto_27087 ?auto_27091 ) ( SURFACE-AT ?auto_27094 ?auto_27091 ) ( CLEAR ?auto_27094 ) ( IS-CRATE ?auto_27086 ) ( not ( = ?auto_27094 ?auto_27086 ) ) ( not ( = ?auto_27080 ?auto_27094 ) ) ( not ( = ?auto_27081 ?auto_27094 ) ) ( not ( = ?auto_27083 ?auto_27094 ) ) ( not ( = ?auto_27092 ?auto_27094 ) ) ( not ( = ?auto_27089 ?auto_27094 ) ) ( not ( = ?auto_27090 ?auto_27094 ) ) ( AVAILABLE ?auto_27084 ) ( IN ?auto_27086 ?auto_27087 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27084 ?auto_27086 ?auto_27087 ?auto_27091 )
      ( MAKE-2CRATE ?auto_27083 ?auto_27080 ?auto_27081 )
      ( MAKE-1CRATE-VERIFY ?auto_27080 ?auto_27081 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27095 - SURFACE
      ?auto_27096 - SURFACE
      ?auto_27097 - SURFACE
    )
    :vars
    (
      ?auto_27106 - HOIST
      ?auto_27107 - PLACE
      ?auto_27101 - PLACE
      ?auto_27102 - HOIST
      ?auto_27104 - SURFACE
      ?auto_27103 - PLACE
      ?auto_27108 - HOIST
      ?auto_27109 - SURFACE
      ?auto_27099 - SURFACE
      ?auto_27105 - SURFACE
      ?auto_27098 - TRUCK
      ?auto_27100 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27106 ?auto_27107 ) ( IS-CRATE ?auto_27097 ) ( not ( = ?auto_27096 ?auto_27097 ) ) ( not ( = ?auto_27095 ?auto_27096 ) ) ( not ( = ?auto_27095 ?auto_27097 ) ) ( not ( = ?auto_27101 ?auto_27107 ) ) ( HOIST-AT ?auto_27102 ?auto_27101 ) ( not ( = ?auto_27106 ?auto_27102 ) ) ( AVAILABLE ?auto_27102 ) ( SURFACE-AT ?auto_27097 ?auto_27101 ) ( ON ?auto_27097 ?auto_27104 ) ( CLEAR ?auto_27097 ) ( not ( = ?auto_27096 ?auto_27104 ) ) ( not ( = ?auto_27097 ?auto_27104 ) ) ( not ( = ?auto_27095 ?auto_27104 ) ) ( IS-CRATE ?auto_27096 ) ( not ( = ?auto_27103 ?auto_27107 ) ) ( not ( = ?auto_27101 ?auto_27103 ) ) ( HOIST-AT ?auto_27108 ?auto_27103 ) ( not ( = ?auto_27106 ?auto_27108 ) ) ( not ( = ?auto_27102 ?auto_27108 ) ) ( SURFACE-AT ?auto_27096 ?auto_27103 ) ( ON ?auto_27096 ?auto_27109 ) ( CLEAR ?auto_27096 ) ( not ( = ?auto_27096 ?auto_27109 ) ) ( not ( = ?auto_27097 ?auto_27109 ) ) ( not ( = ?auto_27095 ?auto_27109 ) ) ( not ( = ?auto_27104 ?auto_27109 ) ) ( IS-CRATE ?auto_27095 ) ( not ( = ?auto_27099 ?auto_27095 ) ) ( not ( = ?auto_27096 ?auto_27099 ) ) ( not ( = ?auto_27097 ?auto_27099 ) ) ( not ( = ?auto_27104 ?auto_27099 ) ) ( not ( = ?auto_27109 ?auto_27099 ) ) ( AVAILABLE ?auto_27108 ) ( SURFACE-AT ?auto_27095 ?auto_27103 ) ( ON ?auto_27095 ?auto_27105 ) ( CLEAR ?auto_27095 ) ( not ( = ?auto_27096 ?auto_27105 ) ) ( not ( = ?auto_27097 ?auto_27105 ) ) ( not ( = ?auto_27095 ?auto_27105 ) ) ( not ( = ?auto_27104 ?auto_27105 ) ) ( not ( = ?auto_27109 ?auto_27105 ) ) ( not ( = ?auto_27099 ?auto_27105 ) ) ( TRUCK-AT ?auto_27098 ?auto_27107 ) ( SURFACE-AT ?auto_27100 ?auto_27107 ) ( CLEAR ?auto_27100 ) ( IS-CRATE ?auto_27099 ) ( not ( = ?auto_27100 ?auto_27099 ) ) ( not ( = ?auto_27096 ?auto_27100 ) ) ( not ( = ?auto_27097 ?auto_27100 ) ) ( not ( = ?auto_27095 ?auto_27100 ) ) ( not ( = ?auto_27104 ?auto_27100 ) ) ( not ( = ?auto_27109 ?auto_27100 ) ) ( not ( = ?auto_27105 ?auto_27100 ) ) ( AVAILABLE ?auto_27106 ) ( IN ?auto_27099 ?auto_27098 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27096 ?auto_27097 )
      ( MAKE-2CRATE-VERIFY ?auto_27095 ?auto_27096 ?auto_27097 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27110 - SURFACE
      ?auto_27111 - SURFACE
      ?auto_27112 - SURFACE
      ?auto_27113 - SURFACE
    )
    :vars
    (
      ?auto_27115 - HOIST
      ?auto_27123 - PLACE
      ?auto_27119 - PLACE
      ?auto_27124 - HOIST
      ?auto_27118 - SURFACE
      ?auto_27122 - PLACE
      ?auto_27120 - HOIST
      ?auto_27114 - SURFACE
      ?auto_27117 - SURFACE
      ?auto_27121 - TRUCK
      ?auto_27116 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27115 ?auto_27123 ) ( IS-CRATE ?auto_27113 ) ( not ( = ?auto_27112 ?auto_27113 ) ) ( not ( = ?auto_27111 ?auto_27112 ) ) ( not ( = ?auto_27111 ?auto_27113 ) ) ( not ( = ?auto_27119 ?auto_27123 ) ) ( HOIST-AT ?auto_27124 ?auto_27119 ) ( not ( = ?auto_27115 ?auto_27124 ) ) ( AVAILABLE ?auto_27124 ) ( SURFACE-AT ?auto_27113 ?auto_27119 ) ( ON ?auto_27113 ?auto_27118 ) ( CLEAR ?auto_27113 ) ( not ( = ?auto_27112 ?auto_27118 ) ) ( not ( = ?auto_27113 ?auto_27118 ) ) ( not ( = ?auto_27111 ?auto_27118 ) ) ( IS-CRATE ?auto_27112 ) ( not ( = ?auto_27122 ?auto_27123 ) ) ( not ( = ?auto_27119 ?auto_27122 ) ) ( HOIST-AT ?auto_27120 ?auto_27122 ) ( not ( = ?auto_27115 ?auto_27120 ) ) ( not ( = ?auto_27124 ?auto_27120 ) ) ( SURFACE-AT ?auto_27112 ?auto_27122 ) ( ON ?auto_27112 ?auto_27114 ) ( CLEAR ?auto_27112 ) ( not ( = ?auto_27112 ?auto_27114 ) ) ( not ( = ?auto_27113 ?auto_27114 ) ) ( not ( = ?auto_27111 ?auto_27114 ) ) ( not ( = ?auto_27118 ?auto_27114 ) ) ( IS-CRATE ?auto_27111 ) ( not ( = ?auto_27110 ?auto_27111 ) ) ( not ( = ?auto_27112 ?auto_27110 ) ) ( not ( = ?auto_27113 ?auto_27110 ) ) ( not ( = ?auto_27118 ?auto_27110 ) ) ( not ( = ?auto_27114 ?auto_27110 ) ) ( AVAILABLE ?auto_27120 ) ( SURFACE-AT ?auto_27111 ?auto_27122 ) ( ON ?auto_27111 ?auto_27117 ) ( CLEAR ?auto_27111 ) ( not ( = ?auto_27112 ?auto_27117 ) ) ( not ( = ?auto_27113 ?auto_27117 ) ) ( not ( = ?auto_27111 ?auto_27117 ) ) ( not ( = ?auto_27118 ?auto_27117 ) ) ( not ( = ?auto_27114 ?auto_27117 ) ) ( not ( = ?auto_27110 ?auto_27117 ) ) ( TRUCK-AT ?auto_27121 ?auto_27123 ) ( SURFACE-AT ?auto_27116 ?auto_27123 ) ( CLEAR ?auto_27116 ) ( IS-CRATE ?auto_27110 ) ( not ( = ?auto_27116 ?auto_27110 ) ) ( not ( = ?auto_27112 ?auto_27116 ) ) ( not ( = ?auto_27113 ?auto_27116 ) ) ( not ( = ?auto_27111 ?auto_27116 ) ) ( not ( = ?auto_27118 ?auto_27116 ) ) ( not ( = ?auto_27114 ?auto_27116 ) ) ( not ( = ?auto_27117 ?auto_27116 ) ) ( AVAILABLE ?auto_27115 ) ( IN ?auto_27110 ?auto_27121 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27111 ?auto_27112 ?auto_27113 )
      ( MAKE-3CRATE-VERIFY ?auto_27110 ?auto_27111 ?auto_27112 ?auto_27113 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27125 - SURFACE
      ?auto_27126 - SURFACE
      ?auto_27127 - SURFACE
      ?auto_27128 - SURFACE
      ?auto_27129 - SURFACE
    )
    :vars
    (
      ?auto_27131 - HOIST
      ?auto_27138 - PLACE
      ?auto_27134 - PLACE
      ?auto_27139 - HOIST
      ?auto_27133 - SURFACE
      ?auto_27137 - PLACE
      ?auto_27135 - HOIST
      ?auto_27130 - SURFACE
      ?auto_27132 - SURFACE
      ?auto_27136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27131 ?auto_27138 ) ( IS-CRATE ?auto_27129 ) ( not ( = ?auto_27128 ?auto_27129 ) ) ( not ( = ?auto_27127 ?auto_27128 ) ) ( not ( = ?auto_27127 ?auto_27129 ) ) ( not ( = ?auto_27134 ?auto_27138 ) ) ( HOIST-AT ?auto_27139 ?auto_27134 ) ( not ( = ?auto_27131 ?auto_27139 ) ) ( AVAILABLE ?auto_27139 ) ( SURFACE-AT ?auto_27129 ?auto_27134 ) ( ON ?auto_27129 ?auto_27133 ) ( CLEAR ?auto_27129 ) ( not ( = ?auto_27128 ?auto_27133 ) ) ( not ( = ?auto_27129 ?auto_27133 ) ) ( not ( = ?auto_27127 ?auto_27133 ) ) ( IS-CRATE ?auto_27128 ) ( not ( = ?auto_27137 ?auto_27138 ) ) ( not ( = ?auto_27134 ?auto_27137 ) ) ( HOIST-AT ?auto_27135 ?auto_27137 ) ( not ( = ?auto_27131 ?auto_27135 ) ) ( not ( = ?auto_27139 ?auto_27135 ) ) ( SURFACE-AT ?auto_27128 ?auto_27137 ) ( ON ?auto_27128 ?auto_27130 ) ( CLEAR ?auto_27128 ) ( not ( = ?auto_27128 ?auto_27130 ) ) ( not ( = ?auto_27129 ?auto_27130 ) ) ( not ( = ?auto_27127 ?auto_27130 ) ) ( not ( = ?auto_27133 ?auto_27130 ) ) ( IS-CRATE ?auto_27127 ) ( not ( = ?auto_27126 ?auto_27127 ) ) ( not ( = ?auto_27128 ?auto_27126 ) ) ( not ( = ?auto_27129 ?auto_27126 ) ) ( not ( = ?auto_27133 ?auto_27126 ) ) ( not ( = ?auto_27130 ?auto_27126 ) ) ( AVAILABLE ?auto_27135 ) ( SURFACE-AT ?auto_27127 ?auto_27137 ) ( ON ?auto_27127 ?auto_27132 ) ( CLEAR ?auto_27127 ) ( not ( = ?auto_27128 ?auto_27132 ) ) ( not ( = ?auto_27129 ?auto_27132 ) ) ( not ( = ?auto_27127 ?auto_27132 ) ) ( not ( = ?auto_27133 ?auto_27132 ) ) ( not ( = ?auto_27130 ?auto_27132 ) ) ( not ( = ?auto_27126 ?auto_27132 ) ) ( TRUCK-AT ?auto_27136 ?auto_27138 ) ( SURFACE-AT ?auto_27125 ?auto_27138 ) ( CLEAR ?auto_27125 ) ( IS-CRATE ?auto_27126 ) ( not ( = ?auto_27125 ?auto_27126 ) ) ( not ( = ?auto_27128 ?auto_27125 ) ) ( not ( = ?auto_27129 ?auto_27125 ) ) ( not ( = ?auto_27127 ?auto_27125 ) ) ( not ( = ?auto_27133 ?auto_27125 ) ) ( not ( = ?auto_27130 ?auto_27125 ) ) ( not ( = ?auto_27132 ?auto_27125 ) ) ( AVAILABLE ?auto_27131 ) ( IN ?auto_27126 ?auto_27136 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27127 ?auto_27128 ?auto_27129 )
      ( MAKE-4CRATE-VERIFY ?auto_27125 ?auto_27126 ?auto_27127 ?auto_27128 ?auto_27129 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27140 - SURFACE
      ?auto_27141 - SURFACE
      ?auto_27142 - SURFACE
      ?auto_27143 - SURFACE
      ?auto_27144 - SURFACE
      ?auto_27145 - SURFACE
    )
    :vars
    (
      ?auto_27147 - HOIST
      ?auto_27154 - PLACE
      ?auto_27150 - PLACE
      ?auto_27155 - HOIST
      ?auto_27149 - SURFACE
      ?auto_27153 - PLACE
      ?auto_27151 - HOIST
      ?auto_27146 - SURFACE
      ?auto_27148 - SURFACE
      ?auto_27152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27147 ?auto_27154 ) ( IS-CRATE ?auto_27145 ) ( not ( = ?auto_27144 ?auto_27145 ) ) ( not ( = ?auto_27143 ?auto_27144 ) ) ( not ( = ?auto_27143 ?auto_27145 ) ) ( not ( = ?auto_27150 ?auto_27154 ) ) ( HOIST-AT ?auto_27155 ?auto_27150 ) ( not ( = ?auto_27147 ?auto_27155 ) ) ( AVAILABLE ?auto_27155 ) ( SURFACE-AT ?auto_27145 ?auto_27150 ) ( ON ?auto_27145 ?auto_27149 ) ( CLEAR ?auto_27145 ) ( not ( = ?auto_27144 ?auto_27149 ) ) ( not ( = ?auto_27145 ?auto_27149 ) ) ( not ( = ?auto_27143 ?auto_27149 ) ) ( IS-CRATE ?auto_27144 ) ( not ( = ?auto_27153 ?auto_27154 ) ) ( not ( = ?auto_27150 ?auto_27153 ) ) ( HOIST-AT ?auto_27151 ?auto_27153 ) ( not ( = ?auto_27147 ?auto_27151 ) ) ( not ( = ?auto_27155 ?auto_27151 ) ) ( SURFACE-AT ?auto_27144 ?auto_27153 ) ( ON ?auto_27144 ?auto_27146 ) ( CLEAR ?auto_27144 ) ( not ( = ?auto_27144 ?auto_27146 ) ) ( not ( = ?auto_27145 ?auto_27146 ) ) ( not ( = ?auto_27143 ?auto_27146 ) ) ( not ( = ?auto_27149 ?auto_27146 ) ) ( IS-CRATE ?auto_27143 ) ( not ( = ?auto_27142 ?auto_27143 ) ) ( not ( = ?auto_27144 ?auto_27142 ) ) ( not ( = ?auto_27145 ?auto_27142 ) ) ( not ( = ?auto_27149 ?auto_27142 ) ) ( not ( = ?auto_27146 ?auto_27142 ) ) ( AVAILABLE ?auto_27151 ) ( SURFACE-AT ?auto_27143 ?auto_27153 ) ( ON ?auto_27143 ?auto_27148 ) ( CLEAR ?auto_27143 ) ( not ( = ?auto_27144 ?auto_27148 ) ) ( not ( = ?auto_27145 ?auto_27148 ) ) ( not ( = ?auto_27143 ?auto_27148 ) ) ( not ( = ?auto_27149 ?auto_27148 ) ) ( not ( = ?auto_27146 ?auto_27148 ) ) ( not ( = ?auto_27142 ?auto_27148 ) ) ( TRUCK-AT ?auto_27152 ?auto_27154 ) ( SURFACE-AT ?auto_27141 ?auto_27154 ) ( CLEAR ?auto_27141 ) ( IS-CRATE ?auto_27142 ) ( not ( = ?auto_27141 ?auto_27142 ) ) ( not ( = ?auto_27144 ?auto_27141 ) ) ( not ( = ?auto_27145 ?auto_27141 ) ) ( not ( = ?auto_27143 ?auto_27141 ) ) ( not ( = ?auto_27149 ?auto_27141 ) ) ( not ( = ?auto_27146 ?auto_27141 ) ) ( not ( = ?auto_27148 ?auto_27141 ) ) ( AVAILABLE ?auto_27147 ) ( IN ?auto_27142 ?auto_27152 ) ( ON ?auto_27141 ?auto_27140 ) ( not ( = ?auto_27140 ?auto_27141 ) ) ( not ( = ?auto_27140 ?auto_27142 ) ) ( not ( = ?auto_27140 ?auto_27143 ) ) ( not ( = ?auto_27140 ?auto_27144 ) ) ( not ( = ?auto_27140 ?auto_27145 ) ) ( not ( = ?auto_27140 ?auto_27149 ) ) ( not ( = ?auto_27140 ?auto_27146 ) ) ( not ( = ?auto_27140 ?auto_27148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27143 ?auto_27144 ?auto_27145 )
      ( MAKE-5CRATE-VERIFY ?auto_27140 ?auto_27141 ?auto_27142 ?auto_27143 ?auto_27144 ?auto_27145 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27156 - SURFACE
      ?auto_27157 - SURFACE
    )
    :vars
    (
      ?auto_27159 - HOIST
      ?auto_27169 - PLACE
      ?auto_27164 - SURFACE
      ?auto_27163 - PLACE
      ?auto_27170 - HOIST
      ?auto_27162 - SURFACE
      ?auto_27168 - PLACE
      ?auto_27166 - HOIST
      ?auto_27158 - SURFACE
      ?auto_27165 - SURFACE
      ?auto_27161 - SURFACE
      ?auto_27160 - SURFACE
      ?auto_27167 - TRUCK
      ?auto_27171 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27159 ?auto_27169 ) ( IS-CRATE ?auto_27157 ) ( not ( = ?auto_27156 ?auto_27157 ) ) ( not ( = ?auto_27164 ?auto_27156 ) ) ( not ( = ?auto_27164 ?auto_27157 ) ) ( not ( = ?auto_27163 ?auto_27169 ) ) ( HOIST-AT ?auto_27170 ?auto_27163 ) ( not ( = ?auto_27159 ?auto_27170 ) ) ( AVAILABLE ?auto_27170 ) ( SURFACE-AT ?auto_27157 ?auto_27163 ) ( ON ?auto_27157 ?auto_27162 ) ( CLEAR ?auto_27157 ) ( not ( = ?auto_27156 ?auto_27162 ) ) ( not ( = ?auto_27157 ?auto_27162 ) ) ( not ( = ?auto_27164 ?auto_27162 ) ) ( IS-CRATE ?auto_27156 ) ( not ( = ?auto_27168 ?auto_27169 ) ) ( not ( = ?auto_27163 ?auto_27168 ) ) ( HOIST-AT ?auto_27166 ?auto_27168 ) ( not ( = ?auto_27159 ?auto_27166 ) ) ( not ( = ?auto_27170 ?auto_27166 ) ) ( SURFACE-AT ?auto_27156 ?auto_27168 ) ( ON ?auto_27156 ?auto_27158 ) ( CLEAR ?auto_27156 ) ( not ( = ?auto_27156 ?auto_27158 ) ) ( not ( = ?auto_27157 ?auto_27158 ) ) ( not ( = ?auto_27164 ?auto_27158 ) ) ( not ( = ?auto_27162 ?auto_27158 ) ) ( IS-CRATE ?auto_27164 ) ( not ( = ?auto_27165 ?auto_27164 ) ) ( not ( = ?auto_27156 ?auto_27165 ) ) ( not ( = ?auto_27157 ?auto_27165 ) ) ( not ( = ?auto_27162 ?auto_27165 ) ) ( not ( = ?auto_27158 ?auto_27165 ) ) ( AVAILABLE ?auto_27166 ) ( SURFACE-AT ?auto_27164 ?auto_27168 ) ( ON ?auto_27164 ?auto_27161 ) ( CLEAR ?auto_27164 ) ( not ( = ?auto_27156 ?auto_27161 ) ) ( not ( = ?auto_27157 ?auto_27161 ) ) ( not ( = ?auto_27164 ?auto_27161 ) ) ( not ( = ?auto_27162 ?auto_27161 ) ) ( not ( = ?auto_27158 ?auto_27161 ) ) ( not ( = ?auto_27165 ?auto_27161 ) ) ( SURFACE-AT ?auto_27160 ?auto_27169 ) ( CLEAR ?auto_27160 ) ( IS-CRATE ?auto_27165 ) ( not ( = ?auto_27160 ?auto_27165 ) ) ( not ( = ?auto_27156 ?auto_27160 ) ) ( not ( = ?auto_27157 ?auto_27160 ) ) ( not ( = ?auto_27164 ?auto_27160 ) ) ( not ( = ?auto_27162 ?auto_27160 ) ) ( not ( = ?auto_27158 ?auto_27160 ) ) ( not ( = ?auto_27161 ?auto_27160 ) ) ( AVAILABLE ?auto_27159 ) ( IN ?auto_27165 ?auto_27167 ) ( TRUCK-AT ?auto_27167 ?auto_27171 ) ( not ( = ?auto_27171 ?auto_27169 ) ) ( not ( = ?auto_27163 ?auto_27171 ) ) ( not ( = ?auto_27168 ?auto_27171 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27167 ?auto_27171 ?auto_27169 )
      ( MAKE-2CRATE ?auto_27164 ?auto_27156 ?auto_27157 )
      ( MAKE-1CRATE-VERIFY ?auto_27156 ?auto_27157 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27172 - SURFACE
      ?auto_27173 - SURFACE
      ?auto_27174 - SURFACE
    )
    :vars
    (
      ?auto_27179 - HOIST
      ?auto_27178 - PLACE
      ?auto_27181 - PLACE
      ?auto_27183 - HOIST
      ?auto_27182 - SURFACE
      ?auto_27184 - PLACE
      ?auto_27180 - HOIST
      ?auto_27177 - SURFACE
      ?auto_27187 - SURFACE
      ?auto_27175 - SURFACE
      ?auto_27186 - SURFACE
      ?auto_27185 - TRUCK
      ?auto_27176 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27179 ?auto_27178 ) ( IS-CRATE ?auto_27174 ) ( not ( = ?auto_27173 ?auto_27174 ) ) ( not ( = ?auto_27172 ?auto_27173 ) ) ( not ( = ?auto_27172 ?auto_27174 ) ) ( not ( = ?auto_27181 ?auto_27178 ) ) ( HOIST-AT ?auto_27183 ?auto_27181 ) ( not ( = ?auto_27179 ?auto_27183 ) ) ( AVAILABLE ?auto_27183 ) ( SURFACE-AT ?auto_27174 ?auto_27181 ) ( ON ?auto_27174 ?auto_27182 ) ( CLEAR ?auto_27174 ) ( not ( = ?auto_27173 ?auto_27182 ) ) ( not ( = ?auto_27174 ?auto_27182 ) ) ( not ( = ?auto_27172 ?auto_27182 ) ) ( IS-CRATE ?auto_27173 ) ( not ( = ?auto_27184 ?auto_27178 ) ) ( not ( = ?auto_27181 ?auto_27184 ) ) ( HOIST-AT ?auto_27180 ?auto_27184 ) ( not ( = ?auto_27179 ?auto_27180 ) ) ( not ( = ?auto_27183 ?auto_27180 ) ) ( SURFACE-AT ?auto_27173 ?auto_27184 ) ( ON ?auto_27173 ?auto_27177 ) ( CLEAR ?auto_27173 ) ( not ( = ?auto_27173 ?auto_27177 ) ) ( not ( = ?auto_27174 ?auto_27177 ) ) ( not ( = ?auto_27172 ?auto_27177 ) ) ( not ( = ?auto_27182 ?auto_27177 ) ) ( IS-CRATE ?auto_27172 ) ( not ( = ?auto_27187 ?auto_27172 ) ) ( not ( = ?auto_27173 ?auto_27187 ) ) ( not ( = ?auto_27174 ?auto_27187 ) ) ( not ( = ?auto_27182 ?auto_27187 ) ) ( not ( = ?auto_27177 ?auto_27187 ) ) ( AVAILABLE ?auto_27180 ) ( SURFACE-AT ?auto_27172 ?auto_27184 ) ( ON ?auto_27172 ?auto_27175 ) ( CLEAR ?auto_27172 ) ( not ( = ?auto_27173 ?auto_27175 ) ) ( not ( = ?auto_27174 ?auto_27175 ) ) ( not ( = ?auto_27172 ?auto_27175 ) ) ( not ( = ?auto_27182 ?auto_27175 ) ) ( not ( = ?auto_27177 ?auto_27175 ) ) ( not ( = ?auto_27187 ?auto_27175 ) ) ( SURFACE-AT ?auto_27186 ?auto_27178 ) ( CLEAR ?auto_27186 ) ( IS-CRATE ?auto_27187 ) ( not ( = ?auto_27186 ?auto_27187 ) ) ( not ( = ?auto_27173 ?auto_27186 ) ) ( not ( = ?auto_27174 ?auto_27186 ) ) ( not ( = ?auto_27172 ?auto_27186 ) ) ( not ( = ?auto_27182 ?auto_27186 ) ) ( not ( = ?auto_27177 ?auto_27186 ) ) ( not ( = ?auto_27175 ?auto_27186 ) ) ( AVAILABLE ?auto_27179 ) ( IN ?auto_27187 ?auto_27185 ) ( TRUCK-AT ?auto_27185 ?auto_27176 ) ( not ( = ?auto_27176 ?auto_27178 ) ) ( not ( = ?auto_27181 ?auto_27176 ) ) ( not ( = ?auto_27184 ?auto_27176 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27173 ?auto_27174 )
      ( MAKE-2CRATE-VERIFY ?auto_27172 ?auto_27173 ?auto_27174 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27188 - SURFACE
      ?auto_27189 - SURFACE
      ?auto_27190 - SURFACE
      ?auto_27191 - SURFACE
    )
    :vars
    (
      ?auto_27203 - HOIST
      ?auto_27202 - PLACE
      ?auto_27200 - PLACE
      ?auto_27198 - HOIST
      ?auto_27201 - SURFACE
      ?auto_27199 - PLACE
      ?auto_27195 - HOIST
      ?auto_27196 - SURFACE
      ?auto_27197 - SURFACE
      ?auto_27193 - SURFACE
      ?auto_27192 - TRUCK
      ?auto_27194 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27203 ?auto_27202 ) ( IS-CRATE ?auto_27191 ) ( not ( = ?auto_27190 ?auto_27191 ) ) ( not ( = ?auto_27189 ?auto_27190 ) ) ( not ( = ?auto_27189 ?auto_27191 ) ) ( not ( = ?auto_27200 ?auto_27202 ) ) ( HOIST-AT ?auto_27198 ?auto_27200 ) ( not ( = ?auto_27203 ?auto_27198 ) ) ( AVAILABLE ?auto_27198 ) ( SURFACE-AT ?auto_27191 ?auto_27200 ) ( ON ?auto_27191 ?auto_27201 ) ( CLEAR ?auto_27191 ) ( not ( = ?auto_27190 ?auto_27201 ) ) ( not ( = ?auto_27191 ?auto_27201 ) ) ( not ( = ?auto_27189 ?auto_27201 ) ) ( IS-CRATE ?auto_27190 ) ( not ( = ?auto_27199 ?auto_27202 ) ) ( not ( = ?auto_27200 ?auto_27199 ) ) ( HOIST-AT ?auto_27195 ?auto_27199 ) ( not ( = ?auto_27203 ?auto_27195 ) ) ( not ( = ?auto_27198 ?auto_27195 ) ) ( SURFACE-AT ?auto_27190 ?auto_27199 ) ( ON ?auto_27190 ?auto_27196 ) ( CLEAR ?auto_27190 ) ( not ( = ?auto_27190 ?auto_27196 ) ) ( not ( = ?auto_27191 ?auto_27196 ) ) ( not ( = ?auto_27189 ?auto_27196 ) ) ( not ( = ?auto_27201 ?auto_27196 ) ) ( IS-CRATE ?auto_27189 ) ( not ( = ?auto_27188 ?auto_27189 ) ) ( not ( = ?auto_27190 ?auto_27188 ) ) ( not ( = ?auto_27191 ?auto_27188 ) ) ( not ( = ?auto_27201 ?auto_27188 ) ) ( not ( = ?auto_27196 ?auto_27188 ) ) ( AVAILABLE ?auto_27195 ) ( SURFACE-AT ?auto_27189 ?auto_27199 ) ( ON ?auto_27189 ?auto_27197 ) ( CLEAR ?auto_27189 ) ( not ( = ?auto_27190 ?auto_27197 ) ) ( not ( = ?auto_27191 ?auto_27197 ) ) ( not ( = ?auto_27189 ?auto_27197 ) ) ( not ( = ?auto_27201 ?auto_27197 ) ) ( not ( = ?auto_27196 ?auto_27197 ) ) ( not ( = ?auto_27188 ?auto_27197 ) ) ( SURFACE-AT ?auto_27193 ?auto_27202 ) ( CLEAR ?auto_27193 ) ( IS-CRATE ?auto_27188 ) ( not ( = ?auto_27193 ?auto_27188 ) ) ( not ( = ?auto_27190 ?auto_27193 ) ) ( not ( = ?auto_27191 ?auto_27193 ) ) ( not ( = ?auto_27189 ?auto_27193 ) ) ( not ( = ?auto_27201 ?auto_27193 ) ) ( not ( = ?auto_27196 ?auto_27193 ) ) ( not ( = ?auto_27197 ?auto_27193 ) ) ( AVAILABLE ?auto_27203 ) ( IN ?auto_27188 ?auto_27192 ) ( TRUCK-AT ?auto_27192 ?auto_27194 ) ( not ( = ?auto_27194 ?auto_27202 ) ) ( not ( = ?auto_27200 ?auto_27194 ) ) ( not ( = ?auto_27199 ?auto_27194 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27189 ?auto_27190 ?auto_27191 )
      ( MAKE-3CRATE-VERIFY ?auto_27188 ?auto_27189 ?auto_27190 ?auto_27191 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27204 - SURFACE
      ?auto_27205 - SURFACE
      ?auto_27206 - SURFACE
      ?auto_27207 - SURFACE
      ?auto_27208 - SURFACE
    )
    :vars
    (
      ?auto_27219 - HOIST
      ?auto_27218 - PLACE
      ?auto_27216 - PLACE
      ?auto_27214 - HOIST
      ?auto_27217 - SURFACE
      ?auto_27215 - PLACE
      ?auto_27211 - HOIST
      ?auto_27212 - SURFACE
      ?auto_27213 - SURFACE
      ?auto_27209 - TRUCK
      ?auto_27210 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27219 ?auto_27218 ) ( IS-CRATE ?auto_27208 ) ( not ( = ?auto_27207 ?auto_27208 ) ) ( not ( = ?auto_27206 ?auto_27207 ) ) ( not ( = ?auto_27206 ?auto_27208 ) ) ( not ( = ?auto_27216 ?auto_27218 ) ) ( HOIST-AT ?auto_27214 ?auto_27216 ) ( not ( = ?auto_27219 ?auto_27214 ) ) ( AVAILABLE ?auto_27214 ) ( SURFACE-AT ?auto_27208 ?auto_27216 ) ( ON ?auto_27208 ?auto_27217 ) ( CLEAR ?auto_27208 ) ( not ( = ?auto_27207 ?auto_27217 ) ) ( not ( = ?auto_27208 ?auto_27217 ) ) ( not ( = ?auto_27206 ?auto_27217 ) ) ( IS-CRATE ?auto_27207 ) ( not ( = ?auto_27215 ?auto_27218 ) ) ( not ( = ?auto_27216 ?auto_27215 ) ) ( HOIST-AT ?auto_27211 ?auto_27215 ) ( not ( = ?auto_27219 ?auto_27211 ) ) ( not ( = ?auto_27214 ?auto_27211 ) ) ( SURFACE-AT ?auto_27207 ?auto_27215 ) ( ON ?auto_27207 ?auto_27212 ) ( CLEAR ?auto_27207 ) ( not ( = ?auto_27207 ?auto_27212 ) ) ( not ( = ?auto_27208 ?auto_27212 ) ) ( not ( = ?auto_27206 ?auto_27212 ) ) ( not ( = ?auto_27217 ?auto_27212 ) ) ( IS-CRATE ?auto_27206 ) ( not ( = ?auto_27205 ?auto_27206 ) ) ( not ( = ?auto_27207 ?auto_27205 ) ) ( not ( = ?auto_27208 ?auto_27205 ) ) ( not ( = ?auto_27217 ?auto_27205 ) ) ( not ( = ?auto_27212 ?auto_27205 ) ) ( AVAILABLE ?auto_27211 ) ( SURFACE-AT ?auto_27206 ?auto_27215 ) ( ON ?auto_27206 ?auto_27213 ) ( CLEAR ?auto_27206 ) ( not ( = ?auto_27207 ?auto_27213 ) ) ( not ( = ?auto_27208 ?auto_27213 ) ) ( not ( = ?auto_27206 ?auto_27213 ) ) ( not ( = ?auto_27217 ?auto_27213 ) ) ( not ( = ?auto_27212 ?auto_27213 ) ) ( not ( = ?auto_27205 ?auto_27213 ) ) ( SURFACE-AT ?auto_27204 ?auto_27218 ) ( CLEAR ?auto_27204 ) ( IS-CRATE ?auto_27205 ) ( not ( = ?auto_27204 ?auto_27205 ) ) ( not ( = ?auto_27207 ?auto_27204 ) ) ( not ( = ?auto_27208 ?auto_27204 ) ) ( not ( = ?auto_27206 ?auto_27204 ) ) ( not ( = ?auto_27217 ?auto_27204 ) ) ( not ( = ?auto_27212 ?auto_27204 ) ) ( not ( = ?auto_27213 ?auto_27204 ) ) ( AVAILABLE ?auto_27219 ) ( IN ?auto_27205 ?auto_27209 ) ( TRUCK-AT ?auto_27209 ?auto_27210 ) ( not ( = ?auto_27210 ?auto_27218 ) ) ( not ( = ?auto_27216 ?auto_27210 ) ) ( not ( = ?auto_27215 ?auto_27210 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27206 ?auto_27207 ?auto_27208 )
      ( MAKE-4CRATE-VERIFY ?auto_27204 ?auto_27205 ?auto_27206 ?auto_27207 ?auto_27208 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27220 - SURFACE
      ?auto_27221 - SURFACE
      ?auto_27222 - SURFACE
      ?auto_27223 - SURFACE
      ?auto_27224 - SURFACE
      ?auto_27225 - SURFACE
    )
    :vars
    (
      ?auto_27236 - HOIST
      ?auto_27235 - PLACE
      ?auto_27233 - PLACE
      ?auto_27231 - HOIST
      ?auto_27234 - SURFACE
      ?auto_27232 - PLACE
      ?auto_27228 - HOIST
      ?auto_27229 - SURFACE
      ?auto_27230 - SURFACE
      ?auto_27226 - TRUCK
      ?auto_27227 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27236 ?auto_27235 ) ( IS-CRATE ?auto_27225 ) ( not ( = ?auto_27224 ?auto_27225 ) ) ( not ( = ?auto_27223 ?auto_27224 ) ) ( not ( = ?auto_27223 ?auto_27225 ) ) ( not ( = ?auto_27233 ?auto_27235 ) ) ( HOIST-AT ?auto_27231 ?auto_27233 ) ( not ( = ?auto_27236 ?auto_27231 ) ) ( AVAILABLE ?auto_27231 ) ( SURFACE-AT ?auto_27225 ?auto_27233 ) ( ON ?auto_27225 ?auto_27234 ) ( CLEAR ?auto_27225 ) ( not ( = ?auto_27224 ?auto_27234 ) ) ( not ( = ?auto_27225 ?auto_27234 ) ) ( not ( = ?auto_27223 ?auto_27234 ) ) ( IS-CRATE ?auto_27224 ) ( not ( = ?auto_27232 ?auto_27235 ) ) ( not ( = ?auto_27233 ?auto_27232 ) ) ( HOIST-AT ?auto_27228 ?auto_27232 ) ( not ( = ?auto_27236 ?auto_27228 ) ) ( not ( = ?auto_27231 ?auto_27228 ) ) ( SURFACE-AT ?auto_27224 ?auto_27232 ) ( ON ?auto_27224 ?auto_27229 ) ( CLEAR ?auto_27224 ) ( not ( = ?auto_27224 ?auto_27229 ) ) ( not ( = ?auto_27225 ?auto_27229 ) ) ( not ( = ?auto_27223 ?auto_27229 ) ) ( not ( = ?auto_27234 ?auto_27229 ) ) ( IS-CRATE ?auto_27223 ) ( not ( = ?auto_27222 ?auto_27223 ) ) ( not ( = ?auto_27224 ?auto_27222 ) ) ( not ( = ?auto_27225 ?auto_27222 ) ) ( not ( = ?auto_27234 ?auto_27222 ) ) ( not ( = ?auto_27229 ?auto_27222 ) ) ( AVAILABLE ?auto_27228 ) ( SURFACE-AT ?auto_27223 ?auto_27232 ) ( ON ?auto_27223 ?auto_27230 ) ( CLEAR ?auto_27223 ) ( not ( = ?auto_27224 ?auto_27230 ) ) ( not ( = ?auto_27225 ?auto_27230 ) ) ( not ( = ?auto_27223 ?auto_27230 ) ) ( not ( = ?auto_27234 ?auto_27230 ) ) ( not ( = ?auto_27229 ?auto_27230 ) ) ( not ( = ?auto_27222 ?auto_27230 ) ) ( SURFACE-AT ?auto_27221 ?auto_27235 ) ( CLEAR ?auto_27221 ) ( IS-CRATE ?auto_27222 ) ( not ( = ?auto_27221 ?auto_27222 ) ) ( not ( = ?auto_27224 ?auto_27221 ) ) ( not ( = ?auto_27225 ?auto_27221 ) ) ( not ( = ?auto_27223 ?auto_27221 ) ) ( not ( = ?auto_27234 ?auto_27221 ) ) ( not ( = ?auto_27229 ?auto_27221 ) ) ( not ( = ?auto_27230 ?auto_27221 ) ) ( AVAILABLE ?auto_27236 ) ( IN ?auto_27222 ?auto_27226 ) ( TRUCK-AT ?auto_27226 ?auto_27227 ) ( not ( = ?auto_27227 ?auto_27235 ) ) ( not ( = ?auto_27233 ?auto_27227 ) ) ( not ( = ?auto_27232 ?auto_27227 ) ) ( ON ?auto_27221 ?auto_27220 ) ( not ( = ?auto_27220 ?auto_27221 ) ) ( not ( = ?auto_27220 ?auto_27222 ) ) ( not ( = ?auto_27220 ?auto_27223 ) ) ( not ( = ?auto_27220 ?auto_27224 ) ) ( not ( = ?auto_27220 ?auto_27225 ) ) ( not ( = ?auto_27220 ?auto_27234 ) ) ( not ( = ?auto_27220 ?auto_27229 ) ) ( not ( = ?auto_27220 ?auto_27230 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27223 ?auto_27224 ?auto_27225 )
      ( MAKE-5CRATE-VERIFY ?auto_27220 ?auto_27221 ?auto_27222 ?auto_27223 ?auto_27224 ?auto_27225 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27237 - SURFACE
      ?auto_27238 - SURFACE
    )
    :vars
    (
      ?auto_27252 - HOIST
      ?auto_27251 - PLACE
      ?auto_27248 - SURFACE
      ?auto_27249 - PLACE
      ?auto_27246 - HOIST
      ?auto_27250 - SURFACE
      ?auto_27247 - PLACE
      ?auto_27242 - HOIST
      ?auto_27243 - SURFACE
      ?auto_27245 - SURFACE
      ?auto_27244 - SURFACE
      ?auto_27240 - SURFACE
      ?auto_27239 - TRUCK
      ?auto_27241 - PLACE
      ?auto_27253 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27252 ?auto_27251 ) ( IS-CRATE ?auto_27238 ) ( not ( = ?auto_27237 ?auto_27238 ) ) ( not ( = ?auto_27248 ?auto_27237 ) ) ( not ( = ?auto_27248 ?auto_27238 ) ) ( not ( = ?auto_27249 ?auto_27251 ) ) ( HOIST-AT ?auto_27246 ?auto_27249 ) ( not ( = ?auto_27252 ?auto_27246 ) ) ( AVAILABLE ?auto_27246 ) ( SURFACE-AT ?auto_27238 ?auto_27249 ) ( ON ?auto_27238 ?auto_27250 ) ( CLEAR ?auto_27238 ) ( not ( = ?auto_27237 ?auto_27250 ) ) ( not ( = ?auto_27238 ?auto_27250 ) ) ( not ( = ?auto_27248 ?auto_27250 ) ) ( IS-CRATE ?auto_27237 ) ( not ( = ?auto_27247 ?auto_27251 ) ) ( not ( = ?auto_27249 ?auto_27247 ) ) ( HOIST-AT ?auto_27242 ?auto_27247 ) ( not ( = ?auto_27252 ?auto_27242 ) ) ( not ( = ?auto_27246 ?auto_27242 ) ) ( SURFACE-AT ?auto_27237 ?auto_27247 ) ( ON ?auto_27237 ?auto_27243 ) ( CLEAR ?auto_27237 ) ( not ( = ?auto_27237 ?auto_27243 ) ) ( not ( = ?auto_27238 ?auto_27243 ) ) ( not ( = ?auto_27248 ?auto_27243 ) ) ( not ( = ?auto_27250 ?auto_27243 ) ) ( IS-CRATE ?auto_27248 ) ( not ( = ?auto_27245 ?auto_27248 ) ) ( not ( = ?auto_27237 ?auto_27245 ) ) ( not ( = ?auto_27238 ?auto_27245 ) ) ( not ( = ?auto_27250 ?auto_27245 ) ) ( not ( = ?auto_27243 ?auto_27245 ) ) ( AVAILABLE ?auto_27242 ) ( SURFACE-AT ?auto_27248 ?auto_27247 ) ( ON ?auto_27248 ?auto_27244 ) ( CLEAR ?auto_27248 ) ( not ( = ?auto_27237 ?auto_27244 ) ) ( not ( = ?auto_27238 ?auto_27244 ) ) ( not ( = ?auto_27248 ?auto_27244 ) ) ( not ( = ?auto_27250 ?auto_27244 ) ) ( not ( = ?auto_27243 ?auto_27244 ) ) ( not ( = ?auto_27245 ?auto_27244 ) ) ( SURFACE-AT ?auto_27240 ?auto_27251 ) ( CLEAR ?auto_27240 ) ( IS-CRATE ?auto_27245 ) ( not ( = ?auto_27240 ?auto_27245 ) ) ( not ( = ?auto_27237 ?auto_27240 ) ) ( not ( = ?auto_27238 ?auto_27240 ) ) ( not ( = ?auto_27248 ?auto_27240 ) ) ( not ( = ?auto_27250 ?auto_27240 ) ) ( not ( = ?auto_27243 ?auto_27240 ) ) ( not ( = ?auto_27244 ?auto_27240 ) ) ( AVAILABLE ?auto_27252 ) ( TRUCK-AT ?auto_27239 ?auto_27241 ) ( not ( = ?auto_27241 ?auto_27251 ) ) ( not ( = ?auto_27249 ?auto_27241 ) ) ( not ( = ?auto_27247 ?auto_27241 ) ) ( HOIST-AT ?auto_27253 ?auto_27241 ) ( LIFTING ?auto_27253 ?auto_27245 ) ( not ( = ?auto_27252 ?auto_27253 ) ) ( not ( = ?auto_27246 ?auto_27253 ) ) ( not ( = ?auto_27242 ?auto_27253 ) ) )
    :subtasks
    ( ( !LOAD ?auto_27253 ?auto_27245 ?auto_27239 ?auto_27241 )
      ( MAKE-2CRATE ?auto_27248 ?auto_27237 ?auto_27238 )
      ( MAKE-1CRATE-VERIFY ?auto_27237 ?auto_27238 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27254 - SURFACE
      ?auto_27255 - SURFACE
      ?auto_27256 - SURFACE
    )
    :vars
    (
      ?auto_27262 - HOIST
      ?auto_27264 - PLACE
      ?auto_27257 - PLACE
      ?auto_27261 - HOIST
      ?auto_27267 - SURFACE
      ?auto_27260 - PLACE
      ?auto_27263 - HOIST
      ?auto_27265 - SURFACE
      ?auto_27269 - SURFACE
      ?auto_27258 - SURFACE
      ?auto_27268 - SURFACE
      ?auto_27270 - TRUCK
      ?auto_27259 - PLACE
      ?auto_27266 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27262 ?auto_27264 ) ( IS-CRATE ?auto_27256 ) ( not ( = ?auto_27255 ?auto_27256 ) ) ( not ( = ?auto_27254 ?auto_27255 ) ) ( not ( = ?auto_27254 ?auto_27256 ) ) ( not ( = ?auto_27257 ?auto_27264 ) ) ( HOIST-AT ?auto_27261 ?auto_27257 ) ( not ( = ?auto_27262 ?auto_27261 ) ) ( AVAILABLE ?auto_27261 ) ( SURFACE-AT ?auto_27256 ?auto_27257 ) ( ON ?auto_27256 ?auto_27267 ) ( CLEAR ?auto_27256 ) ( not ( = ?auto_27255 ?auto_27267 ) ) ( not ( = ?auto_27256 ?auto_27267 ) ) ( not ( = ?auto_27254 ?auto_27267 ) ) ( IS-CRATE ?auto_27255 ) ( not ( = ?auto_27260 ?auto_27264 ) ) ( not ( = ?auto_27257 ?auto_27260 ) ) ( HOIST-AT ?auto_27263 ?auto_27260 ) ( not ( = ?auto_27262 ?auto_27263 ) ) ( not ( = ?auto_27261 ?auto_27263 ) ) ( SURFACE-AT ?auto_27255 ?auto_27260 ) ( ON ?auto_27255 ?auto_27265 ) ( CLEAR ?auto_27255 ) ( not ( = ?auto_27255 ?auto_27265 ) ) ( not ( = ?auto_27256 ?auto_27265 ) ) ( not ( = ?auto_27254 ?auto_27265 ) ) ( not ( = ?auto_27267 ?auto_27265 ) ) ( IS-CRATE ?auto_27254 ) ( not ( = ?auto_27269 ?auto_27254 ) ) ( not ( = ?auto_27255 ?auto_27269 ) ) ( not ( = ?auto_27256 ?auto_27269 ) ) ( not ( = ?auto_27267 ?auto_27269 ) ) ( not ( = ?auto_27265 ?auto_27269 ) ) ( AVAILABLE ?auto_27263 ) ( SURFACE-AT ?auto_27254 ?auto_27260 ) ( ON ?auto_27254 ?auto_27258 ) ( CLEAR ?auto_27254 ) ( not ( = ?auto_27255 ?auto_27258 ) ) ( not ( = ?auto_27256 ?auto_27258 ) ) ( not ( = ?auto_27254 ?auto_27258 ) ) ( not ( = ?auto_27267 ?auto_27258 ) ) ( not ( = ?auto_27265 ?auto_27258 ) ) ( not ( = ?auto_27269 ?auto_27258 ) ) ( SURFACE-AT ?auto_27268 ?auto_27264 ) ( CLEAR ?auto_27268 ) ( IS-CRATE ?auto_27269 ) ( not ( = ?auto_27268 ?auto_27269 ) ) ( not ( = ?auto_27255 ?auto_27268 ) ) ( not ( = ?auto_27256 ?auto_27268 ) ) ( not ( = ?auto_27254 ?auto_27268 ) ) ( not ( = ?auto_27267 ?auto_27268 ) ) ( not ( = ?auto_27265 ?auto_27268 ) ) ( not ( = ?auto_27258 ?auto_27268 ) ) ( AVAILABLE ?auto_27262 ) ( TRUCK-AT ?auto_27270 ?auto_27259 ) ( not ( = ?auto_27259 ?auto_27264 ) ) ( not ( = ?auto_27257 ?auto_27259 ) ) ( not ( = ?auto_27260 ?auto_27259 ) ) ( HOIST-AT ?auto_27266 ?auto_27259 ) ( LIFTING ?auto_27266 ?auto_27269 ) ( not ( = ?auto_27262 ?auto_27266 ) ) ( not ( = ?auto_27261 ?auto_27266 ) ) ( not ( = ?auto_27263 ?auto_27266 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27255 ?auto_27256 )
      ( MAKE-2CRATE-VERIFY ?auto_27254 ?auto_27255 ?auto_27256 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27271 - SURFACE
      ?auto_27272 - SURFACE
      ?auto_27273 - SURFACE
      ?auto_27274 - SURFACE
    )
    :vars
    (
      ?auto_27275 - HOIST
      ?auto_27281 - PLACE
      ?auto_27284 - PLACE
      ?auto_27278 - HOIST
      ?auto_27285 - SURFACE
      ?auto_27280 - PLACE
      ?auto_27282 - HOIST
      ?auto_27283 - SURFACE
      ?auto_27286 - SURFACE
      ?auto_27279 - SURFACE
      ?auto_27277 - TRUCK
      ?auto_27276 - PLACE
      ?auto_27287 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27275 ?auto_27281 ) ( IS-CRATE ?auto_27274 ) ( not ( = ?auto_27273 ?auto_27274 ) ) ( not ( = ?auto_27272 ?auto_27273 ) ) ( not ( = ?auto_27272 ?auto_27274 ) ) ( not ( = ?auto_27284 ?auto_27281 ) ) ( HOIST-AT ?auto_27278 ?auto_27284 ) ( not ( = ?auto_27275 ?auto_27278 ) ) ( AVAILABLE ?auto_27278 ) ( SURFACE-AT ?auto_27274 ?auto_27284 ) ( ON ?auto_27274 ?auto_27285 ) ( CLEAR ?auto_27274 ) ( not ( = ?auto_27273 ?auto_27285 ) ) ( not ( = ?auto_27274 ?auto_27285 ) ) ( not ( = ?auto_27272 ?auto_27285 ) ) ( IS-CRATE ?auto_27273 ) ( not ( = ?auto_27280 ?auto_27281 ) ) ( not ( = ?auto_27284 ?auto_27280 ) ) ( HOIST-AT ?auto_27282 ?auto_27280 ) ( not ( = ?auto_27275 ?auto_27282 ) ) ( not ( = ?auto_27278 ?auto_27282 ) ) ( SURFACE-AT ?auto_27273 ?auto_27280 ) ( ON ?auto_27273 ?auto_27283 ) ( CLEAR ?auto_27273 ) ( not ( = ?auto_27273 ?auto_27283 ) ) ( not ( = ?auto_27274 ?auto_27283 ) ) ( not ( = ?auto_27272 ?auto_27283 ) ) ( not ( = ?auto_27285 ?auto_27283 ) ) ( IS-CRATE ?auto_27272 ) ( not ( = ?auto_27271 ?auto_27272 ) ) ( not ( = ?auto_27273 ?auto_27271 ) ) ( not ( = ?auto_27274 ?auto_27271 ) ) ( not ( = ?auto_27285 ?auto_27271 ) ) ( not ( = ?auto_27283 ?auto_27271 ) ) ( AVAILABLE ?auto_27282 ) ( SURFACE-AT ?auto_27272 ?auto_27280 ) ( ON ?auto_27272 ?auto_27286 ) ( CLEAR ?auto_27272 ) ( not ( = ?auto_27273 ?auto_27286 ) ) ( not ( = ?auto_27274 ?auto_27286 ) ) ( not ( = ?auto_27272 ?auto_27286 ) ) ( not ( = ?auto_27285 ?auto_27286 ) ) ( not ( = ?auto_27283 ?auto_27286 ) ) ( not ( = ?auto_27271 ?auto_27286 ) ) ( SURFACE-AT ?auto_27279 ?auto_27281 ) ( CLEAR ?auto_27279 ) ( IS-CRATE ?auto_27271 ) ( not ( = ?auto_27279 ?auto_27271 ) ) ( not ( = ?auto_27273 ?auto_27279 ) ) ( not ( = ?auto_27274 ?auto_27279 ) ) ( not ( = ?auto_27272 ?auto_27279 ) ) ( not ( = ?auto_27285 ?auto_27279 ) ) ( not ( = ?auto_27283 ?auto_27279 ) ) ( not ( = ?auto_27286 ?auto_27279 ) ) ( AVAILABLE ?auto_27275 ) ( TRUCK-AT ?auto_27277 ?auto_27276 ) ( not ( = ?auto_27276 ?auto_27281 ) ) ( not ( = ?auto_27284 ?auto_27276 ) ) ( not ( = ?auto_27280 ?auto_27276 ) ) ( HOIST-AT ?auto_27287 ?auto_27276 ) ( LIFTING ?auto_27287 ?auto_27271 ) ( not ( = ?auto_27275 ?auto_27287 ) ) ( not ( = ?auto_27278 ?auto_27287 ) ) ( not ( = ?auto_27282 ?auto_27287 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27272 ?auto_27273 ?auto_27274 )
      ( MAKE-3CRATE-VERIFY ?auto_27271 ?auto_27272 ?auto_27273 ?auto_27274 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27288 - SURFACE
      ?auto_27289 - SURFACE
      ?auto_27290 - SURFACE
      ?auto_27291 - SURFACE
      ?auto_27292 - SURFACE
    )
    :vars
    (
      ?auto_27293 - HOIST
      ?auto_27298 - PLACE
      ?auto_27301 - PLACE
      ?auto_27296 - HOIST
      ?auto_27302 - SURFACE
      ?auto_27297 - PLACE
      ?auto_27299 - HOIST
      ?auto_27300 - SURFACE
      ?auto_27303 - SURFACE
      ?auto_27295 - TRUCK
      ?auto_27294 - PLACE
      ?auto_27304 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27293 ?auto_27298 ) ( IS-CRATE ?auto_27292 ) ( not ( = ?auto_27291 ?auto_27292 ) ) ( not ( = ?auto_27290 ?auto_27291 ) ) ( not ( = ?auto_27290 ?auto_27292 ) ) ( not ( = ?auto_27301 ?auto_27298 ) ) ( HOIST-AT ?auto_27296 ?auto_27301 ) ( not ( = ?auto_27293 ?auto_27296 ) ) ( AVAILABLE ?auto_27296 ) ( SURFACE-AT ?auto_27292 ?auto_27301 ) ( ON ?auto_27292 ?auto_27302 ) ( CLEAR ?auto_27292 ) ( not ( = ?auto_27291 ?auto_27302 ) ) ( not ( = ?auto_27292 ?auto_27302 ) ) ( not ( = ?auto_27290 ?auto_27302 ) ) ( IS-CRATE ?auto_27291 ) ( not ( = ?auto_27297 ?auto_27298 ) ) ( not ( = ?auto_27301 ?auto_27297 ) ) ( HOIST-AT ?auto_27299 ?auto_27297 ) ( not ( = ?auto_27293 ?auto_27299 ) ) ( not ( = ?auto_27296 ?auto_27299 ) ) ( SURFACE-AT ?auto_27291 ?auto_27297 ) ( ON ?auto_27291 ?auto_27300 ) ( CLEAR ?auto_27291 ) ( not ( = ?auto_27291 ?auto_27300 ) ) ( not ( = ?auto_27292 ?auto_27300 ) ) ( not ( = ?auto_27290 ?auto_27300 ) ) ( not ( = ?auto_27302 ?auto_27300 ) ) ( IS-CRATE ?auto_27290 ) ( not ( = ?auto_27289 ?auto_27290 ) ) ( not ( = ?auto_27291 ?auto_27289 ) ) ( not ( = ?auto_27292 ?auto_27289 ) ) ( not ( = ?auto_27302 ?auto_27289 ) ) ( not ( = ?auto_27300 ?auto_27289 ) ) ( AVAILABLE ?auto_27299 ) ( SURFACE-AT ?auto_27290 ?auto_27297 ) ( ON ?auto_27290 ?auto_27303 ) ( CLEAR ?auto_27290 ) ( not ( = ?auto_27291 ?auto_27303 ) ) ( not ( = ?auto_27292 ?auto_27303 ) ) ( not ( = ?auto_27290 ?auto_27303 ) ) ( not ( = ?auto_27302 ?auto_27303 ) ) ( not ( = ?auto_27300 ?auto_27303 ) ) ( not ( = ?auto_27289 ?auto_27303 ) ) ( SURFACE-AT ?auto_27288 ?auto_27298 ) ( CLEAR ?auto_27288 ) ( IS-CRATE ?auto_27289 ) ( not ( = ?auto_27288 ?auto_27289 ) ) ( not ( = ?auto_27291 ?auto_27288 ) ) ( not ( = ?auto_27292 ?auto_27288 ) ) ( not ( = ?auto_27290 ?auto_27288 ) ) ( not ( = ?auto_27302 ?auto_27288 ) ) ( not ( = ?auto_27300 ?auto_27288 ) ) ( not ( = ?auto_27303 ?auto_27288 ) ) ( AVAILABLE ?auto_27293 ) ( TRUCK-AT ?auto_27295 ?auto_27294 ) ( not ( = ?auto_27294 ?auto_27298 ) ) ( not ( = ?auto_27301 ?auto_27294 ) ) ( not ( = ?auto_27297 ?auto_27294 ) ) ( HOIST-AT ?auto_27304 ?auto_27294 ) ( LIFTING ?auto_27304 ?auto_27289 ) ( not ( = ?auto_27293 ?auto_27304 ) ) ( not ( = ?auto_27296 ?auto_27304 ) ) ( not ( = ?auto_27299 ?auto_27304 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27290 ?auto_27291 ?auto_27292 )
      ( MAKE-4CRATE-VERIFY ?auto_27288 ?auto_27289 ?auto_27290 ?auto_27291 ?auto_27292 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27305 - SURFACE
      ?auto_27306 - SURFACE
      ?auto_27307 - SURFACE
      ?auto_27308 - SURFACE
      ?auto_27309 - SURFACE
      ?auto_27310 - SURFACE
    )
    :vars
    (
      ?auto_27311 - HOIST
      ?auto_27316 - PLACE
      ?auto_27319 - PLACE
      ?auto_27314 - HOIST
      ?auto_27320 - SURFACE
      ?auto_27315 - PLACE
      ?auto_27317 - HOIST
      ?auto_27318 - SURFACE
      ?auto_27321 - SURFACE
      ?auto_27313 - TRUCK
      ?auto_27312 - PLACE
      ?auto_27322 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_27311 ?auto_27316 ) ( IS-CRATE ?auto_27310 ) ( not ( = ?auto_27309 ?auto_27310 ) ) ( not ( = ?auto_27308 ?auto_27309 ) ) ( not ( = ?auto_27308 ?auto_27310 ) ) ( not ( = ?auto_27319 ?auto_27316 ) ) ( HOIST-AT ?auto_27314 ?auto_27319 ) ( not ( = ?auto_27311 ?auto_27314 ) ) ( AVAILABLE ?auto_27314 ) ( SURFACE-AT ?auto_27310 ?auto_27319 ) ( ON ?auto_27310 ?auto_27320 ) ( CLEAR ?auto_27310 ) ( not ( = ?auto_27309 ?auto_27320 ) ) ( not ( = ?auto_27310 ?auto_27320 ) ) ( not ( = ?auto_27308 ?auto_27320 ) ) ( IS-CRATE ?auto_27309 ) ( not ( = ?auto_27315 ?auto_27316 ) ) ( not ( = ?auto_27319 ?auto_27315 ) ) ( HOIST-AT ?auto_27317 ?auto_27315 ) ( not ( = ?auto_27311 ?auto_27317 ) ) ( not ( = ?auto_27314 ?auto_27317 ) ) ( SURFACE-AT ?auto_27309 ?auto_27315 ) ( ON ?auto_27309 ?auto_27318 ) ( CLEAR ?auto_27309 ) ( not ( = ?auto_27309 ?auto_27318 ) ) ( not ( = ?auto_27310 ?auto_27318 ) ) ( not ( = ?auto_27308 ?auto_27318 ) ) ( not ( = ?auto_27320 ?auto_27318 ) ) ( IS-CRATE ?auto_27308 ) ( not ( = ?auto_27307 ?auto_27308 ) ) ( not ( = ?auto_27309 ?auto_27307 ) ) ( not ( = ?auto_27310 ?auto_27307 ) ) ( not ( = ?auto_27320 ?auto_27307 ) ) ( not ( = ?auto_27318 ?auto_27307 ) ) ( AVAILABLE ?auto_27317 ) ( SURFACE-AT ?auto_27308 ?auto_27315 ) ( ON ?auto_27308 ?auto_27321 ) ( CLEAR ?auto_27308 ) ( not ( = ?auto_27309 ?auto_27321 ) ) ( not ( = ?auto_27310 ?auto_27321 ) ) ( not ( = ?auto_27308 ?auto_27321 ) ) ( not ( = ?auto_27320 ?auto_27321 ) ) ( not ( = ?auto_27318 ?auto_27321 ) ) ( not ( = ?auto_27307 ?auto_27321 ) ) ( SURFACE-AT ?auto_27306 ?auto_27316 ) ( CLEAR ?auto_27306 ) ( IS-CRATE ?auto_27307 ) ( not ( = ?auto_27306 ?auto_27307 ) ) ( not ( = ?auto_27309 ?auto_27306 ) ) ( not ( = ?auto_27310 ?auto_27306 ) ) ( not ( = ?auto_27308 ?auto_27306 ) ) ( not ( = ?auto_27320 ?auto_27306 ) ) ( not ( = ?auto_27318 ?auto_27306 ) ) ( not ( = ?auto_27321 ?auto_27306 ) ) ( AVAILABLE ?auto_27311 ) ( TRUCK-AT ?auto_27313 ?auto_27312 ) ( not ( = ?auto_27312 ?auto_27316 ) ) ( not ( = ?auto_27319 ?auto_27312 ) ) ( not ( = ?auto_27315 ?auto_27312 ) ) ( HOIST-AT ?auto_27322 ?auto_27312 ) ( LIFTING ?auto_27322 ?auto_27307 ) ( not ( = ?auto_27311 ?auto_27322 ) ) ( not ( = ?auto_27314 ?auto_27322 ) ) ( not ( = ?auto_27317 ?auto_27322 ) ) ( ON ?auto_27306 ?auto_27305 ) ( not ( = ?auto_27305 ?auto_27306 ) ) ( not ( = ?auto_27305 ?auto_27307 ) ) ( not ( = ?auto_27305 ?auto_27308 ) ) ( not ( = ?auto_27305 ?auto_27309 ) ) ( not ( = ?auto_27305 ?auto_27310 ) ) ( not ( = ?auto_27305 ?auto_27320 ) ) ( not ( = ?auto_27305 ?auto_27318 ) ) ( not ( = ?auto_27305 ?auto_27321 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27308 ?auto_27309 ?auto_27310 )
      ( MAKE-5CRATE-VERIFY ?auto_27305 ?auto_27306 ?auto_27307 ?auto_27308 ?auto_27309 ?auto_27310 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27323 - SURFACE
      ?auto_27324 - SURFACE
    )
    :vars
    (
      ?auto_27326 - HOIST
      ?auto_27333 - PLACE
      ?auto_27325 - SURFACE
      ?auto_27336 - PLACE
      ?auto_27329 - HOIST
      ?auto_27337 - SURFACE
      ?auto_27332 - PLACE
      ?auto_27334 - HOIST
      ?auto_27335 - SURFACE
      ?auto_27330 - SURFACE
      ?auto_27338 - SURFACE
      ?auto_27331 - SURFACE
      ?auto_27328 - TRUCK
      ?auto_27327 - PLACE
      ?auto_27339 - HOIST
      ?auto_27340 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27326 ?auto_27333 ) ( IS-CRATE ?auto_27324 ) ( not ( = ?auto_27323 ?auto_27324 ) ) ( not ( = ?auto_27325 ?auto_27323 ) ) ( not ( = ?auto_27325 ?auto_27324 ) ) ( not ( = ?auto_27336 ?auto_27333 ) ) ( HOIST-AT ?auto_27329 ?auto_27336 ) ( not ( = ?auto_27326 ?auto_27329 ) ) ( AVAILABLE ?auto_27329 ) ( SURFACE-AT ?auto_27324 ?auto_27336 ) ( ON ?auto_27324 ?auto_27337 ) ( CLEAR ?auto_27324 ) ( not ( = ?auto_27323 ?auto_27337 ) ) ( not ( = ?auto_27324 ?auto_27337 ) ) ( not ( = ?auto_27325 ?auto_27337 ) ) ( IS-CRATE ?auto_27323 ) ( not ( = ?auto_27332 ?auto_27333 ) ) ( not ( = ?auto_27336 ?auto_27332 ) ) ( HOIST-AT ?auto_27334 ?auto_27332 ) ( not ( = ?auto_27326 ?auto_27334 ) ) ( not ( = ?auto_27329 ?auto_27334 ) ) ( SURFACE-AT ?auto_27323 ?auto_27332 ) ( ON ?auto_27323 ?auto_27335 ) ( CLEAR ?auto_27323 ) ( not ( = ?auto_27323 ?auto_27335 ) ) ( not ( = ?auto_27324 ?auto_27335 ) ) ( not ( = ?auto_27325 ?auto_27335 ) ) ( not ( = ?auto_27337 ?auto_27335 ) ) ( IS-CRATE ?auto_27325 ) ( not ( = ?auto_27330 ?auto_27325 ) ) ( not ( = ?auto_27323 ?auto_27330 ) ) ( not ( = ?auto_27324 ?auto_27330 ) ) ( not ( = ?auto_27337 ?auto_27330 ) ) ( not ( = ?auto_27335 ?auto_27330 ) ) ( AVAILABLE ?auto_27334 ) ( SURFACE-AT ?auto_27325 ?auto_27332 ) ( ON ?auto_27325 ?auto_27338 ) ( CLEAR ?auto_27325 ) ( not ( = ?auto_27323 ?auto_27338 ) ) ( not ( = ?auto_27324 ?auto_27338 ) ) ( not ( = ?auto_27325 ?auto_27338 ) ) ( not ( = ?auto_27337 ?auto_27338 ) ) ( not ( = ?auto_27335 ?auto_27338 ) ) ( not ( = ?auto_27330 ?auto_27338 ) ) ( SURFACE-AT ?auto_27331 ?auto_27333 ) ( CLEAR ?auto_27331 ) ( IS-CRATE ?auto_27330 ) ( not ( = ?auto_27331 ?auto_27330 ) ) ( not ( = ?auto_27323 ?auto_27331 ) ) ( not ( = ?auto_27324 ?auto_27331 ) ) ( not ( = ?auto_27325 ?auto_27331 ) ) ( not ( = ?auto_27337 ?auto_27331 ) ) ( not ( = ?auto_27335 ?auto_27331 ) ) ( not ( = ?auto_27338 ?auto_27331 ) ) ( AVAILABLE ?auto_27326 ) ( TRUCK-AT ?auto_27328 ?auto_27327 ) ( not ( = ?auto_27327 ?auto_27333 ) ) ( not ( = ?auto_27336 ?auto_27327 ) ) ( not ( = ?auto_27332 ?auto_27327 ) ) ( HOIST-AT ?auto_27339 ?auto_27327 ) ( not ( = ?auto_27326 ?auto_27339 ) ) ( not ( = ?auto_27329 ?auto_27339 ) ) ( not ( = ?auto_27334 ?auto_27339 ) ) ( AVAILABLE ?auto_27339 ) ( SURFACE-AT ?auto_27330 ?auto_27327 ) ( ON ?auto_27330 ?auto_27340 ) ( CLEAR ?auto_27330 ) ( not ( = ?auto_27323 ?auto_27340 ) ) ( not ( = ?auto_27324 ?auto_27340 ) ) ( not ( = ?auto_27325 ?auto_27340 ) ) ( not ( = ?auto_27337 ?auto_27340 ) ) ( not ( = ?auto_27335 ?auto_27340 ) ) ( not ( = ?auto_27330 ?auto_27340 ) ) ( not ( = ?auto_27338 ?auto_27340 ) ) ( not ( = ?auto_27331 ?auto_27340 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27339 ?auto_27330 ?auto_27340 ?auto_27327 )
      ( MAKE-2CRATE ?auto_27325 ?auto_27323 ?auto_27324 )
      ( MAKE-1CRATE-VERIFY ?auto_27323 ?auto_27324 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27341 - SURFACE
      ?auto_27342 - SURFACE
      ?auto_27343 - SURFACE
    )
    :vars
    (
      ?auto_27352 - HOIST
      ?auto_27347 - PLACE
      ?auto_27358 - PLACE
      ?auto_27357 - HOIST
      ?auto_27348 - SURFACE
      ?auto_27350 - PLACE
      ?auto_27354 - HOIST
      ?auto_27351 - SURFACE
      ?auto_27345 - SURFACE
      ?auto_27344 - SURFACE
      ?auto_27356 - SURFACE
      ?auto_27355 - TRUCK
      ?auto_27349 - PLACE
      ?auto_27353 - HOIST
      ?auto_27346 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27352 ?auto_27347 ) ( IS-CRATE ?auto_27343 ) ( not ( = ?auto_27342 ?auto_27343 ) ) ( not ( = ?auto_27341 ?auto_27342 ) ) ( not ( = ?auto_27341 ?auto_27343 ) ) ( not ( = ?auto_27358 ?auto_27347 ) ) ( HOIST-AT ?auto_27357 ?auto_27358 ) ( not ( = ?auto_27352 ?auto_27357 ) ) ( AVAILABLE ?auto_27357 ) ( SURFACE-AT ?auto_27343 ?auto_27358 ) ( ON ?auto_27343 ?auto_27348 ) ( CLEAR ?auto_27343 ) ( not ( = ?auto_27342 ?auto_27348 ) ) ( not ( = ?auto_27343 ?auto_27348 ) ) ( not ( = ?auto_27341 ?auto_27348 ) ) ( IS-CRATE ?auto_27342 ) ( not ( = ?auto_27350 ?auto_27347 ) ) ( not ( = ?auto_27358 ?auto_27350 ) ) ( HOIST-AT ?auto_27354 ?auto_27350 ) ( not ( = ?auto_27352 ?auto_27354 ) ) ( not ( = ?auto_27357 ?auto_27354 ) ) ( SURFACE-AT ?auto_27342 ?auto_27350 ) ( ON ?auto_27342 ?auto_27351 ) ( CLEAR ?auto_27342 ) ( not ( = ?auto_27342 ?auto_27351 ) ) ( not ( = ?auto_27343 ?auto_27351 ) ) ( not ( = ?auto_27341 ?auto_27351 ) ) ( not ( = ?auto_27348 ?auto_27351 ) ) ( IS-CRATE ?auto_27341 ) ( not ( = ?auto_27345 ?auto_27341 ) ) ( not ( = ?auto_27342 ?auto_27345 ) ) ( not ( = ?auto_27343 ?auto_27345 ) ) ( not ( = ?auto_27348 ?auto_27345 ) ) ( not ( = ?auto_27351 ?auto_27345 ) ) ( AVAILABLE ?auto_27354 ) ( SURFACE-AT ?auto_27341 ?auto_27350 ) ( ON ?auto_27341 ?auto_27344 ) ( CLEAR ?auto_27341 ) ( not ( = ?auto_27342 ?auto_27344 ) ) ( not ( = ?auto_27343 ?auto_27344 ) ) ( not ( = ?auto_27341 ?auto_27344 ) ) ( not ( = ?auto_27348 ?auto_27344 ) ) ( not ( = ?auto_27351 ?auto_27344 ) ) ( not ( = ?auto_27345 ?auto_27344 ) ) ( SURFACE-AT ?auto_27356 ?auto_27347 ) ( CLEAR ?auto_27356 ) ( IS-CRATE ?auto_27345 ) ( not ( = ?auto_27356 ?auto_27345 ) ) ( not ( = ?auto_27342 ?auto_27356 ) ) ( not ( = ?auto_27343 ?auto_27356 ) ) ( not ( = ?auto_27341 ?auto_27356 ) ) ( not ( = ?auto_27348 ?auto_27356 ) ) ( not ( = ?auto_27351 ?auto_27356 ) ) ( not ( = ?auto_27344 ?auto_27356 ) ) ( AVAILABLE ?auto_27352 ) ( TRUCK-AT ?auto_27355 ?auto_27349 ) ( not ( = ?auto_27349 ?auto_27347 ) ) ( not ( = ?auto_27358 ?auto_27349 ) ) ( not ( = ?auto_27350 ?auto_27349 ) ) ( HOIST-AT ?auto_27353 ?auto_27349 ) ( not ( = ?auto_27352 ?auto_27353 ) ) ( not ( = ?auto_27357 ?auto_27353 ) ) ( not ( = ?auto_27354 ?auto_27353 ) ) ( AVAILABLE ?auto_27353 ) ( SURFACE-AT ?auto_27345 ?auto_27349 ) ( ON ?auto_27345 ?auto_27346 ) ( CLEAR ?auto_27345 ) ( not ( = ?auto_27342 ?auto_27346 ) ) ( not ( = ?auto_27343 ?auto_27346 ) ) ( not ( = ?auto_27341 ?auto_27346 ) ) ( not ( = ?auto_27348 ?auto_27346 ) ) ( not ( = ?auto_27351 ?auto_27346 ) ) ( not ( = ?auto_27345 ?auto_27346 ) ) ( not ( = ?auto_27344 ?auto_27346 ) ) ( not ( = ?auto_27356 ?auto_27346 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27342 ?auto_27343 )
      ( MAKE-2CRATE-VERIFY ?auto_27341 ?auto_27342 ?auto_27343 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27359 - SURFACE
      ?auto_27360 - SURFACE
      ?auto_27361 - SURFACE
      ?auto_27362 - SURFACE
    )
    :vars
    (
      ?auto_27369 - HOIST
      ?auto_27371 - PLACE
      ?auto_27363 - PLACE
      ?auto_27375 - HOIST
      ?auto_27364 - SURFACE
      ?auto_27365 - PLACE
      ?auto_27374 - HOIST
      ?auto_27370 - SURFACE
      ?auto_27372 - SURFACE
      ?auto_27373 - SURFACE
      ?auto_27367 - TRUCK
      ?auto_27366 - PLACE
      ?auto_27368 - HOIST
      ?auto_27376 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27369 ?auto_27371 ) ( IS-CRATE ?auto_27362 ) ( not ( = ?auto_27361 ?auto_27362 ) ) ( not ( = ?auto_27360 ?auto_27361 ) ) ( not ( = ?auto_27360 ?auto_27362 ) ) ( not ( = ?auto_27363 ?auto_27371 ) ) ( HOIST-AT ?auto_27375 ?auto_27363 ) ( not ( = ?auto_27369 ?auto_27375 ) ) ( AVAILABLE ?auto_27375 ) ( SURFACE-AT ?auto_27362 ?auto_27363 ) ( ON ?auto_27362 ?auto_27364 ) ( CLEAR ?auto_27362 ) ( not ( = ?auto_27361 ?auto_27364 ) ) ( not ( = ?auto_27362 ?auto_27364 ) ) ( not ( = ?auto_27360 ?auto_27364 ) ) ( IS-CRATE ?auto_27361 ) ( not ( = ?auto_27365 ?auto_27371 ) ) ( not ( = ?auto_27363 ?auto_27365 ) ) ( HOIST-AT ?auto_27374 ?auto_27365 ) ( not ( = ?auto_27369 ?auto_27374 ) ) ( not ( = ?auto_27375 ?auto_27374 ) ) ( SURFACE-AT ?auto_27361 ?auto_27365 ) ( ON ?auto_27361 ?auto_27370 ) ( CLEAR ?auto_27361 ) ( not ( = ?auto_27361 ?auto_27370 ) ) ( not ( = ?auto_27362 ?auto_27370 ) ) ( not ( = ?auto_27360 ?auto_27370 ) ) ( not ( = ?auto_27364 ?auto_27370 ) ) ( IS-CRATE ?auto_27360 ) ( not ( = ?auto_27359 ?auto_27360 ) ) ( not ( = ?auto_27361 ?auto_27359 ) ) ( not ( = ?auto_27362 ?auto_27359 ) ) ( not ( = ?auto_27364 ?auto_27359 ) ) ( not ( = ?auto_27370 ?auto_27359 ) ) ( AVAILABLE ?auto_27374 ) ( SURFACE-AT ?auto_27360 ?auto_27365 ) ( ON ?auto_27360 ?auto_27372 ) ( CLEAR ?auto_27360 ) ( not ( = ?auto_27361 ?auto_27372 ) ) ( not ( = ?auto_27362 ?auto_27372 ) ) ( not ( = ?auto_27360 ?auto_27372 ) ) ( not ( = ?auto_27364 ?auto_27372 ) ) ( not ( = ?auto_27370 ?auto_27372 ) ) ( not ( = ?auto_27359 ?auto_27372 ) ) ( SURFACE-AT ?auto_27373 ?auto_27371 ) ( CLEAR ?auto_27373 ) ( IS-CRATE ?auto_27359 ) ( not ( = ?auto_27373 ?auto_27359 ) ) ( not ( = ?auto_27361 ?auto_27373 ) ) ( not ( = ?auto_27362 ?auto_27373 ) ) ( not ( = ?auto_27360 ?auto_27373 ) ) ( not ( = ?auto_27364 ?auto_27373 ) ) ( not ( = ?auto_27370 ?auto_27373 ) ) ( not ( = ?auto_27372 ?auto_27373 ) ) ( AVAILABLE ?auto_27369 ) ( TRUCK-AT ?auto_27367 ?auto_27366 ) ( not ( = ?auto_27366 ?auto_27371 ) ) ( not ( = ?auto_27363 ?auto_27366 ) ) ( not ( = ?auto_27365 ?auto_27366 ) ) ( HOIST-AT ?auto_27368 ?auto_27366 ) ( not ( = ?auto_27369 ?auto_27368 ) ) ( not ( = ?auto_27375 ?auto_27368 ) ) ( not ( = ?auto_27374 ?auto_27368 ) ) ( AVAILABLE ?auto_27368 ) ( SURFACE-AT ?auto_27359 ?auto_27366 ) ( ON ?auto_27359 ?auto_27376 ) ( CLEAR ?auto_27359 ) ( not ( = ?auto_27361 ?auto_27376 ) ) ( not ( = ?auto_27362 ?auto_27376 ) ) ( not ( = ?auto_27360 ?auto_27376 ) ) ( not ( = ?auto_27364 ?auto_27376 ) ) ( not ( = ?auto_27370 ?auto_27376 ) ) ( not ( = ?auto_27359 ?auto_27376 ) ) ( not ( = ?auto_27372 ?auto_27376 ) ) ( not ( = ?auto_27373 ?auto_27376 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27360 ?auto_27361 ?auto_27362 )
      ( MAKE-3CRATE-VERIFY ?auto_27359 ?auto_27360 ?auto_27361 ?auto_27362 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27377 - SURFACE
      ?auto_27378 - SURFACE
      ?auto_27379 - SURFACE
      ?auto_27380 - SURFACE
      ?auto_27381 - SURFACE
    )
    :vars
    (
      ?auto_27388 - HOIST
      ?auto_27390 - PLACE
      ?auto_27382 - PLACE
      ?auto_27393 - HOIST
      ?auto_27383 - SURFACE
      ?auto_27384 - PLACE
      ?auto_27392 - HOIST
      ?auto_27389 - SURFACE
      ?auto_27391 - SURFACE
      ?auto_27386 - TRUCK
      ?auto_27385 - PLACE
      ?auto_27387 - HOIST
      ?auto_27394 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27388 ?auto_27390 ) ( IS-CRATE ?auto_27381 ) ( not ( = ?auto_27380 ?auto_27381 ) ) ( not ( = ?auto_27379 ?auto_27380 ) ) ( not ( = ?auto_27379 ?auto_27381 ) ) ( not ( = ?auto_27382 ?auto_27390 ) ) ( HOIST-AT ?auto_27393 ?auto_27382 ) ( not ( = ?auto_27388 ?auto_27393 ) ) ( AVAILABLE ?auto_27393 ) ( SURFACE-AT ?auto_27381 ?auto_27382 ) ( ON ?auto_27381 ?auto_27383 ) ( CLEAR ?auto_27381 ) ( not ( = ?auto_27380 ?auto_27383 ) ) ( not ( = ?auto_27381 ?auto_27383 ) ) ( not ( = ?auto_27379 ?auto_27383 ) ) ( IS-CRATE ?auto_27380 ) ( not ( = ?auto_27384 ?auto_27390 ) ) ( not ( = ?auto_27382 ?auto_27384 ) ) ( HOIST-AT ?auto_27392 ?auto_27384 ) ( not ( = ?auto_27388 ?auto_27392 ) ) ( not ( = ?auto_27393 ?auto_27392 ) ) ( SURFACE-AT ?auto_27380 ?auto_27384 ) ( ON ?auto_27380 ?auto_27389 ) ( CLEAR ?auto_27380 ) ( not ( = ?auto_27380 ?auto_27389 ) ) ( not ( = ?auto_27381 ?auto_27389 ) ) ( not ( = ?auto_27379 ?auto_27389 ) ) ( not ( = ?auto_27383 ?auto_27389 ) ) ( IS-CRATE ?auto_27379 ) ( not ( = ?auto_27378 ?auto_27379 ) ) ( not ( = ?auto_27380 ?auto_27378 ) ) ( not ( = ?auto_27381 ?auto_27378 ) ) ( not ( = ?auto_27383 ?auto_27378 ) ) ( not ( = ?auto_27389 ?auto_27378 ) ) ( AVAILABLE ?auto_27392 ) ( SURFACE-AT ?auto_27379 ?auto_27384 ) ( ON ?auto_27379 ?auto_27391 ) ( CLEAR ?auto_27379 ) ( not ( = ?auto_27380 ?auto_27391 ) ) ( not ( = ?auto_27381 ?auto_27391 ) ) ( not ( = ?auto_27379 ?auto_27391 ) ) ( not ( = ?auto_27383 ?auto_27391 ) ) ( not ( = ?auto_27389 ?auto_27391 ) ) ( not ( = ?auto_27378 ?auto_27391 ) ) ( SURFACE-AT ?auto_27377 ?auto_27390 ) ( CLEAR ?auto_27377 ) ( IS-CRATE ?auto_27378 ) ( not ( = ?auto_27377 ?auto_27378 ) ) ( not ( = ?auto_27380 ?auto_27377 ) ) ( not ( = ?auto_27381 ?auto_27377 ) ) ( not ( = ?auto_27379 ?auto_27377 ) ) ( not ( = ?auto_27383 ?auto_27377 ) ) ( not ( = ?auto_27389 ?auto_27377 ) ) ( not ( = ?auto_27391 ?auto_27377 ) ) ( AVAILABLE ?auto_27388 ) ( TRUCK-AT ?auto_27386 ?auto_27385 ) ( not ( = ?auto_27385 ?auto_27390 ) ) ( not ( = ?auto_27382 ?auto_27385 ) ) ( not ( = ?auto_27384 ?auto_27385 ) ) ( HOIST-AT ?auto_27387 ?auto_27385 ) ( not ( = ?auto_27388 ?auto_27387 ) ) ( not ( = ?auto_27393 ?auto_27387 ) ) ( not ( = ?auto_27392 ?auto_27387 ) ) ( AVAILABLE ?auto_27387 ) ( SURFACE-AT ?auto_27378 ?auto_27385 ) ( ON ?auto_27378 ?auto_27394 ) ( CLEAR ?auto_27378 ) ( not ( = ?auto_27380 ?auto_27394 ) ) ( not ( = ?auto_27381 ?auto_27394 ) ) ( not ( = ?auto_27379 ?auto_27394 ) ) ( not ( = ?auto_27383 ?auto_27394 ) ) ( not ( = ?auto_27389 ?auto_27394 ) ) ( not ( = ?auto_27378 ?auto_27394 ) ) ( not ( = ?auto_27391 ?auto_27394 ) ) ( not ( = ?auto_27377 ?auto_27394 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27379 ?auto_27380 ?auto_27381 )
      ( MAKE-4CRATE-VERIFY ?auto_27377 ?auto_27378 ?auto_27379 ?auto_27380 ?auto_27381 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27395 - SURFACE
      ?auto_27396 - SURFACE
      ?auto_27397 - SURFACE
      ?auto_27398 - SURFACE
      ?auto_27399 - SURFACE
      ?auto_27400 - SURFACE
    )
    :vars
    (
      ?auto_27407 - HOIST
      ?auto_27409 - PLACE
      ?auto_27401 - PLACE
      ?auto_27412 - HOIST
      ?auto_27402 - SURFACE
      ?auto_27403 - PLACE
      ?auto_27411 - HOIST
      ?auto_27408 - SURFACE
      ?auto_27410 - SURFACE
      ?auto_27405 - TRUCK
      ?auto_27404 - PLACE
      ?auto_27406 - HOIST
      ?auto_27413 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27407 ?auto_27409 ) ( IS-CRATE ?auto_27400 ) ( not ( = ?auto_27399 ?auto_27400 ) ) ( not ( = ?auto_27398 ?auto_27399 ) ) ( not ( = ?auto_27398 ?auto_27400 ) ) ( not ( = ?auto_27401 ?auto_27409 ) ) ( HOIST-AT ?auto_27412 ?auto_27401 ) ( not ( = ?auto_27407 ?auto_27412 ) ) ( AVAILABLE ?auto_27412 ) ( SURFACE-AT ?auto_27400 ?auto_27401 ) ( ON ?auto_27400 ?auto_27402 ) ( CLEAR ?auto_27400 ) ( not ( = ?auto_27399 ?auto_27402 ) ) ( not ( = ?auto_27400 ?auto_27402 ) ) ( not ( = ?auto_27398 ?auto_27402 ) ) ( IS-CRATE ?auto_27399 ) ( not ( = ?auto_27403 ?auto_27409 ) ) ( not ( = ?auto_27401 ?auto_27403 ) ) ( HOIST-AT ?auto_27411 ?auto_27403 ) ( not ( = ?auto_27407 ?auto_27411 ) ) ( not ( = ?auto_27412 ?auto_27411 ) ) ( SURFACE-AT ?auto_27399 ?auto_27403 ) ( ON ?auto_27399 ?auto_27408 ) ( CLEAR ?auto_27399 ) ( not ( = ?auto_27399 ?auto_27408 ) ) ( not ( = ?auto_27400 ?auto_27408 ) ) ( not ( = ?auto_27398 ?auto_27408 ) ) ( not ( = ?auto_27402 ?auto_27408 ) ) ( IS-CRATE ?auto_27398 ) ( not ( = ?auto_27397 ?auto_27398 ) ) ( not ( = ?auto_27399 ?auto_27397 ) ) ( not ( = ?auto_27400 ?auto_27397 ) ) ( not ( = ?auto_27402 ?auto_27397 ) ) ( not ( = ?auto_27408 ?auto_27397 ) ) ( AVAILABLE ?auto_27411 ) ( SURFACE-AT ?auto_27398 ?auto_27403 ) ( ON ?auto_27398 ?auto_27410 ) ( CLEAR ?auto_27398 ) ( not ( = ?auto_27399 ?auto_27410 ) ) ( not ( = ?auto_27400 ?auto_27410 ) ) ( not ( = ?auto_27398 ?auto_27410 ) ) ( not ( = ?auto_27402 ?auto_27410 ) ) ( not ( = ?auto_27408 ?auto_27410 ) ) ( not ( = ?auto_27397 ?auto_27410 ) ) ( SURFACE-AT ?auto_27396 ?auto_27409 ) ( CLEAR ?auto_27396 ) ( IS-CRATE ?auto_27397 ) ( not ( = ?auto_27396 ?auto_27397 ) ) ( not ( = ?auto_27399 ?auto_27396 ) ) ( not ( = ?auto_27400 ?auto_27396 ) ) ( not ( = ?auto_27398 ?auto_27396 ) ) ( not ( = ?auto_27402 ?auto_27396 ) ) ( not ( = ?auto_27408 ?auto_27396 ) ) ( not ( = ?auto_27410 ?auto_27396 ) ) ( AVAILABLE ?auto_27407 ) ( TRUCK-AT ?auto_27405 ?auto_27404 ) ( not ( = ?auto_27404 ?auto_27409 ) ) ( not ( = ?auto_27401 ?auto_27404 ) ) ( not ( = ?auto_27403 ?auto_27404 ) ) ( HOIST-AT ?auto_27406 ?auto_27404 ) ( not ( = ?auto_27407 ?auto_27406 ) ) ( not ( = ?auto_27412 ?auto_27406 ) ) ( not ( = ?auto_27411 ?auto_27406 ) ) ( AVAILABLE ?auto_27406 ) ( SURFACE-AT ?auto_27397 ?auto_27404 ) ( ON ?auto_27397 ?auto_27413 ) ( CLEAR ?auto_27397 ) ( not ( = ?auto_27399 ?auto_27413 ) ) ( not ( = ?auto_27400 ?auto_27413 ) ) ( not ( = ?auto_27398 ?auto_27413 ) ) ( not ( = ?auto_27402 ?auto_27413 ) ) ( not ( = ?auto_27408 ?auto_27413 ) ) ( not ( = ?auto_27397 ?auto_27413 ) ) ( not ( = ?auto_27410 ?auto_27413 ) ) ( not ( = ?auto_27396 ?auto_27413 ) ) ( ON ?auto_27396 ?auto_27395 ) ( not ( = ?auto_27395 ?auto_27396 ) ) ( not ( = ?auto_27395 ?auto_27397 ) ) ( not ( = ?auto_27395 ?auto_27398 ) ) ( not ( = ?auto_27395 ?auto_27399 ) ) ( not ( = ?auto_27395 ?auto_27400 ) ) ( not ( = ?auto_27395 ?auto_27402 ) ) ( not ( = ?auto_27395 ?auto_27408 ) ) ( not ( = ?auto_27395 ?auto_27410 ) ) ( not ( = ?auto_27395 ?auto_27413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27398 ?auto_27399 ?auto_27400 )
      ( MAKE-5CRATE-VERIFY ?auto_27395 ?auto_27396 ?auto_27397 ?auto_27398 ?auto_27399 ?auto_27400 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27414 - SURFACE
      ?auto_27415 - SURFACE
    )
    :vars
    (
      ?auto_27422 - HOIST
      ?auto_27424 - PLACE
      ?auto_27430 - SURFACE
      ?auto_27416 - PLACE
      ?auto_27428 - HOIST
      ?auto_27417 - SURFACE
      ?auto_27418 - PLACE
      ?auto_27427 - HOIST
      ?auto_27423 - SURFACE
      ?auto_27429 - SURFACE
      ?auto_27425 - SURFACE
      ?auto_27426 - SURFACE
      ?auto_27419 - PLACE
      ?auto_27421 - HOIST
      ?auto_27431 - SURFACE
      ?auto_27420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27422 ?auto_27424 ) ( IS-CRATE ?auto_27415 ) ( not ( = ?auto_27414 ?auto_27415 ) ) ( not ( = ?auto_27430 ?auto_27414 ) ) ( not ( = ?auto_27430 ?auto_27415 ) ) ( not ( = ?auto_27416 ?auto_27424 ) ) ( HOIST-AT ?auto_27428 ?auto_27416 ) ( not ( = ?auto_27422 ?auto_27428 ) ) ( AVAILABLE ?auto_27428 ) ( SURFACE-AT ?auto_27415 ?auto_27416 ) ( ON ?auto_27415 ?auto_27417 ) ( CLEAR ?auto_27415 ) ( not ( = ?auto_27414 ?auto_27417 ) ) ( not ( = ?auto_27415 ?auto_27417 ) ) ( not ( = ?auto_27430 ?auto_27417 ) ) ( IS-CRATE ?auto_27414 ) ( not ( = ?auto_27418 ?auto_27424 ) ) ( not ( = ?auto_27416 ?auto_27418 ) ) ( HOIST-AT ?auto_27427 ?auto_27418 ) ( not ( = ?auto_27422 ?auto_27427 ) ) ( not ( = ?auto_27428 ?auto_27427 ) ) ( SURFACE-AT ?auto_27414 ?auto_27418 ) ( ON ?auto_27414 ?auto_27423 ) ( CLEAR ?auto_27414 ) ( not ( = ?auto_27414 ?auto_27423 ) ) ( not ( = ?auto_27415 ?auto_27423 ) ) ( not ( = ?auto_27430 ?auto_27423 ) ) ( not ( = ?auto_27417 ?auto_27423 ) ) ( IS-CRATE ?auto_27430 ) ( not ( = ?auto_27429 ?auto_27430 ) ) ( not ( = ?auto_27414 ?auto_27429 ) ) ( not ( = ?auto_27415 ?auto_27429 ) ) ( not ( = ?auto_27417 ?auto_27429 ) ) ( not ( = ?auto_27423 ?auto_27429 ) ) ( AVAILABLE ?auto_27427 ) ( SURFACE-AT ?auto_27430 ?auto_27418 ) ( ON ?auto_27430 ?auto_27425 ) ( CLEAR ?auto_27430 ) ( not ( = ?auto_27414 ?auto_27425 ) ) ( not ( = ?auto_27415 ?auto_27425 ) ) ( not ( = ?auto_27430 ?auto_27425 ) ) ( not ( = ?auto_27417 ?auto_27425 ) ) ( not ( = ?auto_27423 ?auto_27425 ) ) ( not ( = ?auto_27429 ?auto_27425 ) ) ( SURFACE-AT ?auto_27426 ?auto_27424 ) ( CLEAR ?auto_27426 ) ( IS-CRATE ?auto_27429 ) ( not ( = ?auto_27426 ?auto_27429 ) ) ( not ( = ?auto_27414 ?auto_27426 ) ) ( not ( = ?auto_27415 ?auto_27426 ) ) ( not ( = ?auto_27430 ?auto_27426 ) ) ( not ( = ?auto_27417 ?auto_27426 ) ) ( not ( = ?auto_27423 ?auto_27426 ) ) ( not ( = ?auto_27425 ?auto_27426 ) ) ( AVAILABLE ?auto_27422 ) ( not ( = ?auto_27419 ?auto_27424 ) ) ( not ( = ?auto_27416 ?auto_27419 ) ) ( not ( = ?auto_27418 ?auto_27419 ) ) ( HOIST-AT ?auto_27421 ?auto_27419 ) ( not ( = ?auto_27422 ?auto_27421 ) ) ( not ( = ?auto_27428 ?auto_27421 ) ) ( not ( = ?auto_27427 ?auto_27421 ) ) ( AVAILABLE ?auto_27421 ) ( SURFACE-AT ?auto_27429 ?auto_27419 ) ( ON ?auto_27429 ?auto_27431 ) ( CLEAR ?auto_27429 ) ( not ( = ?auto_27414 ?auto_27431 ) ) ( not ( = ?auto_27415 ?auto_27431 ) ) ( not ( = ?auto_27430 ?auto_27431 ) ) ( not ( = ?auto_27417 ?auto_27431 ) ) ( not ( = ?auto_27423 ?auto_27431 ) ) ( not ( = ?auto_27429 ?auto_27431 ) ) ( not ( = ?auto_27425 ?auto_27431 ) ) ( not ( = ?auto_27426 ?auto_27431 ) ) ( TRUCK-AT ?auto_27420 ?auto_27424 ) )
    :subtasks
    ( ( !DRIVE ?auto_27420 ?auto_27424 ?auto_27419 )
      ( MAKE-2CRATE ?auto_27430 ?auto_27414 ?auto_27415 )
      ( MAKE-1CRATE-VERIFY ?auto_27414 ?auto_27415 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27432 - SURFACE
      ?auto_27433 - SURFACE
      ?auto_27434 - SURFACE
    )
    :vars
    (
      ?auto_27446 - HOIST
      ?auto_27447 - PLACE
      ?auto_27448 - PLACE
      ?auto_27436 - HOIST
      ?auto_27437 - SURFACE
      ?auto_27443 - PLACE
      ?auto_27442 - HOIST
      ?auto_27441 - SURFACE
      ?auto_27439 - SURFACE
      ?auto_27440 - SURFACE
      ?auto_27438 - SURFACE
      ?auto_27444 - PLACE
      ?auto_27435 - HOIST
      ?auto_27449 - SURFACE
      ?auto_27445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27446 ?auto_27447 ) ( IS-CRATE ?auto_27434 ) ( not ( = ?auto_27433 ?auto_27434 ) ) ( not ( = ?auto_27432 ?auto_27433 ) ) ( not ( = ?auto_27432 ?auto_27434 ) ) ( not ( = ?auto_27448 ?auto_27447 ) ) ( HOIST-AT ?auto_27436 ?auto_27448 ) ( not ( = ?auto_27446 ?auto_27436 ) ) ( AVAILABLE ?auto_27436 ) ( SURFACE-AT ?auto_27434 ?auto_27448 ) ( ON ?auto_27434 ?auto_27437 ) ( CLEAR ?auto_27434 ) ( not ( = ?auto_27433 ?auto_27437 ) ) ( not ( = ?auto_27434 ?auto_27437 ) ) ( not ( = ?auto_27432 ?auto_27437 ) ) ( IS-CRATE ?auto_27433 ) ( not ( = ?auto_27443 ?auto_27447 ) ) ( not ( = ?auto_27448 ?auto_27443 ) ) ( HOIST-AT ?auto_27442 ?auto_27443 ) ( not ( = ?auto_27446 ?auto_27442 ) ) ( not ( = ?auto_27436 ?auto_27442 ) ) ( SURFACE-AT ?auto_27433 ?auto_27443 ) ( ON ?auto_27433 ?auto_27441 ) ( CLEAR ?auto_27433 ) ( not ( = ?auto_27433 ?auto_27441 ) ) ( not ( = ?auto_27434 ?auto_27441 ) ) ( not ( = ?auto_27432 ?auto_27441 ) ) ( not ( = ?auto_27437 ?auto_27441 ) ) ( IS-CRATE ?auto_27432 ) ( not ( = ?auto_27439 ?auto_27432 ) ) ( not ( = ?auto_27433 ?auto_27439 ) ) ( not ( = ?auto_27434 ?auto_27439 ) ) ( not ( = ?auto_27437 ?auto_27439 ) ) ( not ( = ?auto_27441 ?auto_27439 ) ) ( AVAILABLE ?auto_27442 ) ( SURFACE-AT ?auto_27432 ?auto_27443 ) ( ON ?auto_27432 ?auto_27440 ) ( CLEAR ?auto_27432 ) ( not ( = ?auto_27433 ?auto_27440 ) ) ( not ( = ?auto_27434 ?auto_27440 ) ) ( not ( = ?auto_27432 ?auto_27440 ) ) ( not ( = ?auto_27437 ?auto_27440 ) ) ( not ( = ?auto_27441 ?auto_27440 ) ) ( not ( = ?auto_27439 ?auto_27440 ) ) ( SURFACE-AT ?auto_27438 ?auto_27447 ) ( CLEAR ?auto_27438 ) ( IS-CRATE ?auto_27439 ) ( not ( = ?auto_27438 ?auto_27439 ) ) ( not ( = ?auto_27433 ?auto_27438 ) ) ( not ( = ?auto_27434 ?auto_27438 ) ) ( not ( = ?auto_27432 ?auto_27438 ) ) ( not ( = ?auto_27437 ?auto_27438 ) ) ( not ( = ?auto_27441 ?auto_27438 ) ) ( not ( = ?auto_27440 ?auto_27438 ) ) ( AVAILABLE ?auto_27446 ) ( not ( = ?auto_27444 ?auto_27447 ) ) ( not ( = ?auto_27448 ?auto_27444 ) ) ( not ( = ?auto_27443 ?auto_27444 ) ) ( HOIST-AT ?auto_27435 ?auto_27444 ) ( not ( = ?auto_27446 ?auto_27435 ) ) ( not ( = ?auto_27436 ?auto_27435 ) ) ( not ( = ?auto_27442 ?auto_27435 ) ) ( AVAILABLE ?auto_27435 ) ( SURFACE-AT ?auto_27439 ?auto_27444 ) ( ON ?auto_27439 ?auto_27449 ) ( CLEAR ?auto_27439 ) ( not ( = ?auto_27433 ?auto_27449 ) ) ( not ( = ?auto_27434 ?auto_27449 ) ) ( not ( = ?auto_27432 ?auto_27449 ) ) ( not ( = ?auto_27437 ?auto_27449 ) ) ( not ( = ?auto_27441 ?auto_27449 ) ) ( not ( = ?auto_27439 ?auto_27449 ) ) ( not ( = ?auto_27440 ?auto_27449 ) ) ( not ( = ?auto_27438 ?auto_27449 ) ) ( TRUCK-AT ?auto_27445 ?auto_27447 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27433 ?auto_27434 )
      ( MAKE-2CRATE-VERIFY ?auto_27432 ?auto_27433 ?auto_27434 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27450 - SURFACE
      ?auto_27451 - SURFACE
      ?auto_27452 - SURFACE
      ?auto_27453 - SURFACE
    )
    :vars
    (
      ?auto_27462 - HOIST
      ?auto_27460 - PLACE
      ?auto_27454 - PLACE
      ?auto_27459 - HOIST
      ?auto_27458 - SURFACE
      ?auto_27464 - PLACE
      ?auto_27457 - HOIST
      ?auto_27465 - SURFACE
      ?auto_27463 - SURFACE
      ?auto_27467 - SURFACE
      ?auto_27456 - PLACE
      ?auto_27466 - HOIST
      ?auto_27461 - SURFACE
      ?auto_27455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27462 ?auto_27460 ) ( IS-CRATE ?auto_27453 ) ( not ( = ?auto_27452 ?auto_27453 ) ) ( not ( = ?auto_27451 ?auto_27452 ) ) ( not ( = ?auto_27451 ?auto_27453 ) ) ( not ( = ?auto_27454 ?auto_27460 ) ) ( HOIST-AT ?auto_27459 ?auto_27454 ) ( not ( = ?auto_27462 ?auto_27459 ) ) ( AVAILABLE ?auto_27459 ) ( SURFACE-AT ?auto_27453 ?auto_27454 ) ( ON ?auto_27453 ?auto_27458 ) ( CLEAR ?auto_27453 ) ( not ( = ?auto_27452 ?auto_27458 ) ) ( not ( = ?auto_27453 ?auto_27458 ) ) ( not ( = ?auto_27451 ?auto_27458 ) ) ( IS-CRATE ?auto_27452 ) ( not ( = ?auto_27464 ?auto_27460 ) ) ( not ( = ?auto_27454 ?auto_27464 ) ) ( HOIST-AT ?auto_27457 ?auto_27464 ) ( not ( = ?auto_27462 ?auto_27457 ) ) ( not ( = ?auto_27459 ?auto_27457 ) ) ( SURFACE-AT ?auto_27452 ?auto_27464 ) ( ON ?auto_27452 ?auto_27465 ) ( CLEAR ?auto_27452 ) ( not ( = ?auto_27452 ?auto_27465 ) ) ( not ( = ?auto_27453 ?auto_27465 ) ) ( not ( = ?auto_27451 ?auto_27465 ) ) ( not ( = ?auto_27458 ?auto_27465 ) ) ( IS-CRATE ?auto_27451 ) ( not ( = ?auto_27450 ?auto_27451 ) ) ( not ( = ?auto_27452 ?auto_27450 ) ) ( not ( = ?auto_27453 ?auto_27450 ) ) ( not ( = ?auto_27458 ?auto_27450 ) ) ( not ( = ?auto_27465 ?auto_27450 ) ) ( AVAILABLE ?auto_27457 ) ( SURFACE-AT ?auto_27451 ?auto_27464 ) ( ON ?auto_27451 ?auto_27463 ) ( CLEAR ?auto_27451 ) ( not ( = ?auto_27452 ?auto_27463 ) ) ( not ( = ?auto_27453 ?auto_27463 ) ) ( not ( = ?auto_27451 ?auto_27463 ) ) ( not ( = ?auto_27458 ?auto_27463 ) ) ( not ( = ?auto_27465 ?auto_27463 ) ) ( not ( = ?auto_27450 ?auto_27463 ) ) ( SURFACE-AT ?auto_27467 ?auto_27460 ) ( CLEAR ?auto_27467 ) ( IS-CRATE ?auto_27450 ) ( not ( = ?auto_27467 ?auto_27450 ) ) ( not ( = ?auto_27452 ?auto_27467 ) ) ( not ( = ?auto_27453 ?auto_27467 ) ) ( not ( = ?auto_27451 ?auto_27467 ) ) ( not ( = ?auto_27458 ?auto_27467 ) ) ( not ( = ?auto_27465 ?auto_27467 ) ) ( not ( = ?auto_27463 ?auto_27467 ) ) ( AVAILABLE ?auto_27462 ) ( not ( = ?auto_27456 ?auto_27460 ) ) ( not ( = ?auto_27454 ?auto_27456 ) ) ( not ( = ?auto_27464 ?auto_27456 ) ) ( HOIST-AT ?auto_27466 ?auto_27456 ) ( not ( = ?auto_27462 ?auto_27466 ) ) ( not ( = ?auto_27459 ?auto_27466 ) ) ( not ( = ?auto_27457 ?auto_27466 ) ) ( AVAILABLE ?auto_27466 ) ( SURFACE-AT ?auto_27450 ?auto_27456 ) ( ON ?auto_27450 ?auto_27461 ) ( CLEAR ?auto_27450 ) ( not ( = ?auto_27452 ?auto_27461 ) ) ( not ( = ?auto_27453 ?auto_27461 ) ) ( not ( = ?auto_27451 ?auto_27461 ) ) ( not ( = ?auto_27458 ?auto_27461 ) ) ( not ( = ?auto_27465 ?auto_27461 ) ) ( not ( = ?auto_27450 ?auto_27461 ) ) ( not ( = ?auto_27463 ?auto_27461 ) ) ( not ( = ?auto_27467 ?auto_27461 ) ) ( TRUCK-AT ?auto_27455 ?auto_27460 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27451 ?auto_27452 ?auto_27453 )
      ( MAKE-3CRATE-VERIFY ?auto_27450 ?auto_27451 ?auto_27452 ?auto_27453 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27468 - SURFACE
      ?auto_27469 - SURFACE
      ?auto_27470 - SURFACE
      ?auto_27471 - SURFACE
      ?auto_27472 - SURFACE
    )
    :vars
    (
      ?auto_27481 - HOIST
      ?auto_27479 - PLACE
      ?auto_27473 - PLACE
      ?auto_27478 - HOIST
      ?auto_27477 - SURFACE
      ?auto_27483 - PLACE
      ?auto_27476 - HOIST
      ?auto_27484 - SURFACE
      ?auto_27482 - SURFACE
      ?auto_27475 - PLACE
      ?auto_27485 - HOIST
      ?auto_27480 - SURFACE
      ?auto_27474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27481 ?auto_27479 ) ( IS-CRATE ?auto_27472 ) ( not ( = ?auto_27471 ?auto_27472 ) ) ( not ( = ?auto_27470 ?auto_27471 ) ) ( not ( = ?auto_27470 ?auto_27472 ) ) ( not ( = ?auto_27473 ?auto_27479 ) ) ( HOIST-AT ?auto_27478 ?auto_27473 ) ( not ( = ?auto_27481 ?auto_27478 ) ) ( AVAILABLE ?auto_27478 ) ( SURFACE-AT ?auto_27472 ?auto_27473 ) ( ON ?auto_27472 ?auto_27477 ) ( CLEAR ?auto_27472 ) ( not ( = ?auto_27471 ?auto_27477 ) ) ( not ( = ?auto_27472 ?auto_27477 ) ) ( not ( = ?auto_27470 ?auto_27477 ) ) ( IS-CRATE ?auto_27471 ) ( not ( = ?auto_27483 ?auto_27479 ) ) ( not ( = ?auto_27473 ?auto_27483 ) ) ( HOIST-AT ?auto_27476 ?auto_27483 ) ( not ( = ?auto_27481 ?auto_27476 ) ) ( not ( = ?auto_27478 ?auto_27476 ) ) ( SURFACE-AT ?auto_27471 ?auto_27483 ) ( ON ?auto_27471 ?auto_27484 ) ( CLEAR ?auto_27471 ) ( not ( = ?auto_27471 ?auto_27484 ) ) ( not ( = ?auto_27472 ?auto_27484 ) ) ( not ( = ?auto_27470 ?auto_27484 ) ) ( not ( = ?auto_27477 ?auto_27484 ) ) ( IS-CRATE ?auto_27470 ) ( not ( = ?auto_27469 ?auto_27470 ) ) ( not ( = ?auto_27471 ?auto_27469 ) ) ( not ( = ?auto_27472 ?auto_27469 ) ) ( not ( = ?auto_27477 ?auto_27469 ) ) ( not ( = ?auto_27484 ?auto_27469 ) ) ( AVAILABLE ?auto_27476 ) ( SURFACE-AT ?auto_27470 ?auto_27483 ) ( ON ?auto_27470 ?auto_27482 ) ( CLEAR ?auto_27470 ) ( not ( = ?auto_27471 ?auto_27482 ) ) ( not ( = ?auto_27472 ?auto_27482 ) ) ( not ( = ?auto_27470 ?auto_27482 ) ) ( not ( = ?auto_27477 ?auto_27482 ) ) ( not ( = ?auto_27484 ?auto_27482 ) ) ( not ( = ?auto_27469 ?auto_27482 ) ) ( SURFACE-AT ?auto_27468 ?auto_27479 ) ( CLEAR ?auto_27468 ) ( IS-CRATE ?auto_27469 ) ( not ( = ?auto_27468 ?auto_27469 ) ) ( not ( = ?auto_27471 ?auto_27468 ) ) ( not ( = ?auto_27472 ?auto_27468 ) ) ( not ( = ?auto_27470 ?auto_27468 ) ) ( not ( = ?auto_27477 ?auto_27468 ) ) ( not ( = ?auto_27484 ?auto_27468 ) ) ( not ( = ?auto_27482 ?auto_27468 ) ) ( AVAILABLE ?auto_27481 ) ( not ( = ?auto_27475 ?auto_27479 ) ) ( not ( = ?auto_27473 ?auto_27475 ) ) ( not ( = ?auto_27483 ?auto_27475 ) ) ( HOIST-AT ?auto_27485 ?auto_27475 ) ( not ( = ?auto_27481 ?auto_27485 ) ) ( not ( = ?auto_27478 ?auto_27485 ) ) ( not ( = ?auto_27476 ?auto_27485 ) ) ( AVAILABLE ?auto_27485 ) ( SURFACE-AT ?auto_27469 ?auto_27475 ) ( ON ?auto_27469 ?auto_27480 ) ( CLEAR ?auto_27469 ) ( not ( = ?auto_27471 ?auto_27480 ) ) ( not ( = ?auto_27472 ?auto_27480 ) ) ( not ( = ?auto_27470 ?auto_27480 ) ) ( not ( = ?auto_27477 ?auto_27480 ) ) ( not ( = ?auto_27484 ?auto_27480 ) ) ( not ( = ?auto_27469 ?auto_27480 ) ) ( not ( = ?auto_27482 ?auto_27480 ) ) ( not ( = ?auto_27468 ?auto_27480 ) ) ( TRUCK-AT ?auto_27474 ?auto_27479 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27470 ?auto_27471 ?auto_27472 )
      ( MAKE-4CRATE-VERIFY ?auto_27468 ?auto_27469 ?auto_27470 ?auto_27471 ?auto_27472 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27486 - SURFACE
      ?auto_27487 - SURFACE
      ?auto_27488 - SURFACE
      ?auto_27489 - SURFACE
      ?auto_27490 - SURFACE
      ?auto_27491 - SURFACE
    )
    :vars
    (
      ?auto_27500 - HOIST
      ?auto_27498 - PLACE
      ?auto_27492 - PLACE
      ?auto_27497 - HOIST
      ?auto_27496 - SURFACE
      ?auto_27502 - PLACE
      ?auto_27495 - HOIST
      ?auto_27503 - SURFACE
      ?auto_27501 - SURFACE
      ?auto_27494 - PLACE
      ?auto_27504 - HOIST
      ?auto_27499 - SURFACE
      ?auto_27493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27500 ?auto_27498 ) ( IS-CRATE ?auto_27491 ) ( not ( = ?auto_27490 ?auto_27491 ) ) ( not ( = ?auto_27489 ?auto_27490 ) ) ( not ( = ?auto_27489 ?auto_27491 ) ) ( not ( = ?auto_27492 ?auto_27498 ) ) ( HOIST-AT ?auto_27497 ?auto_27492 ) ( not ( = ?auto_27500 ?auto_27497 ) ) ( AVAILABLE ?auto_27497 ) ( SURFACE-AT ?auto_27491 ?auto_27492 ) ( ON ?auto_27491 ?auto_27496 ) ( CLEAR ?auto_27491 ) ( not ( = ?auto_27490 ?auto_27496 ) ) ( not ( = ?auto_27491 ?auto_27496 ) ) ( not ( = ?auto_27489 ?auto_27496 ) ) ( IS-CRATE ?auto_27490 ) ( not ( = ?auto_27502 ?auto_27498 ) ) ( not ( = ?auto_27492 ?auto_27502 ) ) ( HOIST-AT ?auto_27495 ?auto_27502 ) ( not ( = ?auto_27500 ?auto_27495 ) ) ( not ( = ?auto_27497 ?auto_27495 ) ) ( SURFACE-AT ?auto_27490 ?auto_27502 ) ( ON ?auto_27490 ?auto_27503 ) ( CLEAR ?auto_27490 ) ( not ( = ?auto_27490 ?auto_27503 ) ) ( not ( = ?auto_27491 ?auto_27503 ) ) ( not ( = ?auto_27489 ?auto_27503 ) ) ( not ( = ?auto_27496 ?auto_27503 ) ) ( IS-CRATE ?auto_27489 ) ( not ( = ?auto_27488 ?auto_27489 ) ) ( not ( = ?auto_27490 ?auto_27488 ) ) ( not ( = ?auto_27491 ?auto_27488 ) ) ( not ( = ?auto_27496 ?auto_27488 ) ) ( not ( = ?auto_27503 ?auto_27488 ) ) ( AVAILABLE ?auto_27495 ) ( SURFACE-AT ?auto_27489 ?auto_27502 ) ( ON ?auto_27489 ?auto_27501 ) ( CLEAR ?auto_27489 ) ( not ( = ?auto_27490 ?auto_27501 ) ) ( not ( = ?auto_27491 ?auto_27501 ) ) ( not ( = ?auto_27489 ?auto_27501 ) ) ( not ( = ?auto_27496 ?auto_27501 ) ) ( not ( = ?auto_27503 ?auto_27501 ) ) ( not ( = ?auto_27488 ?auto_27501 ) ) ( SURFACE-AT ?auto_27487 ?auto_27498 ) ( CLEAR ?auto_27487 ) ( IS-CRATE ?auto_27488 ) ( not ( = ?auto_27487 ?auto_27488 ) ) ( not ( = ?auto_27490 ?auto_27487 ) ) ( not ( = ?auto_27491 ?auto_27487 ) ) ( not ( = ?auto_27489 ?auto_27487 ) ) ( not ( = ?auto_27496 ?auto_27487 ) ) ( not ( = ?auto_27503 ?auto_27487 ) ) ( not ( = ?auto_27501 ?auto_27487 ) ) ( AVAILABLE ?auto_27500 ) ( not ( = ?auto_27494 ?auto_27498 ) ) ( not ( = ?auto_27492 ?auto_27494 ) ) ( not ( = ?auto_27502 ?auto_27494 ) ) ( HOIST-AT ?auto_27504 ?auto_27494 ) ( not ( = ?auto_27500 ?auto_27504 ) ) ( not ( = ?auto_27497 ?auto_27504 ) ) ( not ( = ?auto_27495 ?auto_27504 ) ) ( AVAILABLE ?auto_27504 ) ( SURFACE-AT ?auto_27488 ?auto_27494 ) ( ON ?auto_27488 ?auto_27499 ) ( CLEAR ?auto_27488 ) ( not ( = ?auto_27490 ?auto_27499 ) ) ( not ( = ?auto_27491 ?auto_27499 ) ) ( not ( = ?auto_27489 ?auto_27499 ) ) ( not ( = ?auto_27496 ?auto_27499 ) ) ( not ( = ?auto_27503 ?auto_27499 ) ) ( not ( = ?auto_27488 ?auto_27499 ) ) ( not ( = ?auto_27501 ?auto_27499 ) ) ( not ( = ?auto_27487 ?auto_27499 ) ) ( TRUCK-AT ?auto_27493 ?auto_27498 ) ( ON ?auto_27487 ?auto_27486 ) ( not ( = ?auto_27486 ?auto_27487 ) ) ( not ( = ?auto_27486 ?auto_27488 ) ) ( not ( = ?auto_27486 ?auto_27489 ) ) ( not ( = ?auto_27486 ?auto_27490 ) ) ( not ( = ?auto_27486 ?auto_27491 ) ) ( not ( = ?auto_27486 ?auto_27496 ) ) ( not ( = ?auto_27486 ?auto_27503 ) ) ( not ( = ?auto_27486 ?auto_27501 ) ) ( not ( = ?auto_27486 ?auto_27499 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27489 ?auto_27490 ?auto_27491 )
      ( MAKE-5CRATE-VERIFY ?auto_27486 ?auto_27487 ?auto_27488 ?auto_27489 ?auto_27490 ?auto_27491 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27505 - SURFACE
      ?auto_27506 - SURFACE
    )
    :vars
    (
      ?auto_27517 - HOIST
      ?auto_27515 - PLACE
      ?auto_27512 - SURFACE
      ?auto_27507 - PLACE
      ?auto_27513 - HOIST
      ?auto_27511 - SURFACE
      ?auto_27519 - PLACE
      ?auto_27510 - HOIST
      ?auto_27520 - SURFACE
      ?auto_27514 - SURFACE
      ?auto_27518 - SURFACE
      ?auto_27522 - SURFACE
      ?auto_27509 - PLACE
      ?auto_27521 - HOIST
      ?auto_27516 - SURFACE
      ?auto_27508 - TRUCK
      ?auto_27523 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27517 ?auto_27515 ) ( IS-CRATE ?auto_27506 ) ( not ( = ?auto_27505 ?auto_27506 ) ) ( not ( = ?auto_27512 ?auto_27505 ) ) ( not ( = ?auto_27512 ?auto_27506 ) ) ( not ( = ?auto_27507 ?auto_27515 ) ) ( HOIST-AT ?auto_27513 ?auto_27507 ) ( not ( = ?auto_27517 ?auto_27513 ) ) ( AVAILABLE ?auto_27513 ) ( SURFACE-AT ?auto_27506 ?auto_27507 ) ( ON ?auto_27506 ?auto_27511 ) ( CLEAR ?auto_27506 ) ( not ( = ?auto_27505 ?auto_27511 ) ) ( not ( = ?auto_27506 ?auto_27511 ) ) ( not ( = ?auto_27512 ?auto_27511 ) ) ( IS-CRATE ?auto_27505 ) ( not ( = ?auto_27519 ?auto_27515 ) ) ( not ( = ?auto_27507 ?auto_27519 ) ) ( HOIST-AT ?auto_27510 ?auto_27519 ) ( not ( = ?auto_27517 ?auto_27510 ) ) ( not ( = ?auto_27513 ?auto_27510 ) ) ( SURFACE-AT ?auto_27505 ?auto_27519 ) ( ON ?auto_27505 ?auto_27520 ) ( CLEAR ?auto_27505 ) ( not ( = ?auto_27505 ?auto_27520 ) ) ( not ( = ?auto_27506 ?auto_27520 ) ) ( not ( = ?auto_27512 ?auto_27520 ) ) ( not ( = ?auto_27511 ?auto_27520 ) ) ( IS-CRATE ?auto_27512 ) ( not ( = ?auto_27514 ?auto_27512 ) ) ( not ( = ?auto_27505 ?auto_27514 ) ) ( not ( = ?auto_27506 ?auto_27514 ) ) ( not ( = ?auto_27511 ?auto_27514 ) ) ( not ( = ?auto_27520 ?auto_27514 ) ) ( AVAILABLE ?auto_27510 ) ( SURFACE-AT ?auto_27512 ?auto_27519 ) ( ON ?auto_27512 ?auto_27518 ) ( CLEAR ?auto_27512 ) ( not ( = ?auto_27505 ?auto_27518 ) ) ( not ( = ?auto_27506 ?auto_27518 ) ) ( not ( = ?auto_27512 ?auto_27518 ) ) ( not ( = ?auto_27511 ?auto_27518 ) ) ( not ( = ?auto_27520 ?auto_27518 ) ) ( not ( = ?auto_27514 ?auto_27518 ) ) ( IS-CRATE ?auto_27514 ) ( not ( = ?auto_27522 ?auto_27514 ) ) ( not ( = ?auto_27505 ?auto_27522 ) ) ( not ( = ?auto_27506 ?auto_27522 ) ) ( not ( = ?auto_27512 ?auto_27522 ) ) ( not ( = ?auto_27511 ?auto_27522 ) ) ( not ( = ?auto_27520 ?auto_27522 ) ) ( not ( = ?auto_27518 ?auto_27522 ) ) ( not ( = ?auto_27509 ?auto_27515 ) ) ( not ( = ?auto_27507 ?auto_27509 ) ) ( not ( = ?auto_27519 ?auto_27509 ) ) ( HOIST-AT ?auto_27521 ?auto_27509 ) ( not ( = ?auto_27517 ?auto_27521 ) ) ( not ( = ?auto_27513 ?auto_27521 ) ) ( not ( = ?auto_27510 ?auto_27521 ) ) ( AVAILABLE ?auto_27521 ) ( SURFACE-AT ?auto_27514 ?auto_27509 ) ( ON ?auto_27514 ?auto_27516 ) ( CLEAR ?auto_27514 ) ( not ( = ?auto_27505 ?auto_27516 ) ) ( not ( = ?auto_27506 ?auto_27516 ) ) ( not ( = ?auto_27512 ?auto_27516 ) ) ( not ( = ?auto_27511 ?auto_27516 ) ) ( not ( = ?auto_27520 ?auto_27516 ) ) ( not ( = ?auto_27514 ?auto_27516 ) ) ( not ( = ?auto_27518 ?auto_27516 ) ) ( not ( = ?auto_27522 ?auto_27516 ) ) ( TRUCK-AT ?auto_27508 ?auto_27515 ) ( SURFACE-AT ?auto_27523 ?auto_27515 ) ( CLEAR ?auto_27523 ) ( LIFTING ?auto_27517 ?auto_27522 ) ( IS-CRATE ?auto_27522 ) ( not ( = ?auto_27523 ?auto_27522 ) ) ( not ( = ?auto_27505 ?auto_27523 ) ) ( not ( = ?auto_27506 ?auto_27523 ) ) ( not ( = ?auto_27512 ?auto_27523 ) ) ( not ( = ?auto_27511 ?auto_27523 ) ) ( not ( = ?auto_27520 ?auto_27523 ) ) ( not ( = ?auto_27514 ?auto_27523 ) ) ( not ( = ?auto_27518 ?auto_27523 ) ) ( not ( = ?auto_27516 ?auto_27523 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27523 ?auto_27522 )
      ( MAKE-2CRATE ?auto_27512 ?auto_27505 ?auto_27506 )
      ( MAKE-1CRATE-VERIFY ?auto_27505 ?auto_27506 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27524 - SURFACE
      ?auto_27525 - SURFACE
      ?auto_27526 - SURFACE
    )
    :vars
    (
      ?auto_27534 - HOIST
      ?auto_27532 - PLACE
      ?auto_27541 - PLACE
      ?auto_27530 - HOIST
      ?auto_27528 - SURFACE
      ?auto_27537 - PLACE
      ?auto_27538 - HOIST
      ?auto_27533 - SURFACE
      ?auto_27536 - SURFACE
      ?auto_27535 - SURFACE
      ?auto_27542 - SURFACE
      ?auto_27529 - PLACE
      ?auto_27531 - HOIST
      ?auto_27527 - SURFACE
      ?auto_27540 - TRUCK
      ?auto_27539 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27534 ?auto_27532 ) ( IS-CRATE ?auto_27526 ) ( not ( = ?auto_27525 ?auto_27526 ) ) ( not ( = ?auto_27524 ?auto_27525 ) ) ( not ( = ?auto_27524 ?auto_27526 ) ) ( not ( = ?auto_27541 ?auto_27532 ) ) ( HOIST-AT ?auto_27530 ?auto_27541 ) ( not ( = ?auto_27534 ?auto_27530 ) ) ( AVAILABLE ?auto_27530 ) ( SURFACE-AT ?auto_27526 ?auto_27541 ) ( ON ?auto_27526 ?auto_27528 ) ( CLEAR ?auto_27526 ) ( not ( = ?auto_27525 ?auto_27528 ) ) ( not ( = ?auto_27526 ?auto_27528 ) ) ( not ( = ?auto_27524 ?auto_27528 ) ) ( IS-CRATE ?auto_27525 ) ( not ( = ?auto_27537 ?auto_27532 ) ) ( not ( = ?auto_27541 ?auto_27537 ) ) ( HOIST-AT ?auto_27538 ?auto_27537 ) ( not ( = ?auto_27534 ?auto_27538 ) ) ( not ( = ?auto_27530 ?auto_27538 ) ) ( SURFACE-AT ?auto_27525 ?auto_27537 ) ( ON ?auto_27525 ?auto_27533 ) ( CLEAR ?auto_27525 ) ( not ( = ?auto_27525 ?auto_27533 ) ) ( not ( = ?auto_27526 ?auto_27533 ) ) ( not ( = ?auto_27524 ?auto_27533 ) ) ( not ( = ?auto_27528 ?auto_27533 ) ) ( IS-CRATE ?auto_27524 ) ( not ( = ?auto_27536 ?auto_27524 ) ) ( not ( = ?auto_27525 ?auto_27536 ) ) ( not ( = ?auto_27526 ?auto_27536 ) ) ( not ( = ?auto_27528 ?auto_27536 ) ) ( not ( = ?auto_27533 ?auto_27536 ) ) ( AVAILABLE ?auto_27538 ) ( SURFACE-AT ?auto_27524 ?auto_27537 ) ( ON ?auto_27524 ?auto_27535 ) ( CLEAR ?auto_27524 ) ( not ( = ?auto_27525 ?auto_27535 ) ) ( not ( = ?auto_27526 ?auto_27535 ) ) ( not ( = ?auto_27524 ?auto_27535 ) ) ( not ( = ?auto_27528 ?auto_27535 ) ) ( not ( = ?auto_27533 ?auto_27535 ) ) ( not ( = ?auto_27536 ?auto_27535 ) ) ( IS-CRATE ?auto_27536 ) ( not ( = ?auto_27542 ?auto_27536 ) ) ( not ( = ?auto_27525 ?auto_27542 ) ) ( not ( = ?auto_27526 ?auto_27542 ) ) ( not ( = ?auto_27524 ?auto_27542 ) ) ( not ( = ?auto_27528 ?auto_27542 ) ) ( not ( = ?auto_27533 ?auto_27542 ) ) ( not ( = ?auto_27535 ?auto_27542 ) ) ( not ( = ?auto_27529 ?auto_27532 ) ) ( not ( = ?auto_27541 ?auto_27529 ) ) ( not ( = ?auto_27537 ?auto_27529 ) ) ( HOIST-AT ?auto_27531 ?auto_27529 ) ( not ( = ?auto_27534 ?auto_27531 ) ) ( not ( = ?auto_27530 ?auto_27531 ) ) ( not ( = ?auto_27538 ?auto_27531 ) ) ( AVAILABLE ?auto_27531 ) ( SURFACE-AT ?auto_27536 ?auto_27529 ) ( ON ?auto_27536 ?auto_27527 ) ( CLEAR ?auto_27536 ) ( not ( = ?auto_27525 ?auto_27527 ) ) ( not ( = ?auto_27526 ?auto_27527 ) ) ( not ( = ?auto_27524 ?auto_27527 ) ) ( not ( = ?auto_27528 ?auto_27527 ) ) ( not ( = ?auto_27533 ?auto_27527 ) ) ( not ( = ?auto_27536 ?auto_27527 ) ) ( not ( = ?auto_27535 ?auto_27527 ) ) ( not ( = ?auto_27542 ?auto_27527 ) ) ( TRUCK-AT ?auto_27540 ?auto_27532 ) ( SURFACE-AT ?auto_27539 ?auto_27532 ) ( CLEAR ?auto_27539 ) ( LIFTING ?auto_27534 ?auto_27542 ) ( IS-CRATE ?auto_27542 ) ( not ( = ?auto_27539 ?auto_27542 ) ) ( not ( = ?auto_27525 ?auto_27539 ) ) ( not ( = ?auto_27526 ?auto_27539 ) ) ( not ( = ?auto_27524 ?auto_27539 ) ) ( not ( = ?auto_27528 ?auto_27539 ) ) ( not ( = ?auto_27533 ?auto_27539 ) ) ( not ( = ?auto_27536 ?auto_27539 ) ) ( not ( = ?auto_27535 ?auto_27539 ) ) ( not ( = ?auto_27527 ?auto_27539 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27525 ?auto_27526 )
      ( MAKE-2CRATE-VERIFY ?auto_27524 ?auto_27525 ?auto_27526 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27543 - SURFACE
      ?auto_27544 - SURFACE
      ?auto_27545 - SURFACE
      ?auto_27546 - SURFACE
    )
    :vars
    (
      ?auto_27550 - HOIST
      ?auto_27554 - PLACE
      ?auto_27555 - PLACE
      ?auto_27548 - HOIST
      ?auto_27561 - SURFACE
      ?auto_27560 - PLACE
      ?auto_27559 - HOIST
      ?auto_27552 - SURFACE
      ?auto_27547 - SURFACE
      ?auto_27549 - SURFACE
      ?auto_27557 - PLACE
      ?auto_27553 - HOIST
      ?auto_27551 - SURFACE
      ?auto_27556 - TRUCK
      ?auto_27558 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27550 ?auto_27554 ) ( IS-CRATE ?auto_27546 ) ( not ( = ?auto_27545 ?auto_27546 ) ) ( not ( = ?auto_27544 ?auto_27545 ) ) ( not ( = ?auto_27544 ?auto_27546 ) ) ( not ( = ?auto_27555 ?auto_27554 ) ) ( HOIST-AT ?auto_27548 ?auto_27555 ) ( not ( = ?auto_27550 ?auto_27548 ) ) ( AVAILABLE ?auto_27548 ) ( SURFACE-AT ?auto_27546 ?auto_27555 ) ( ON ?auto_27546 ?auto_27561 ) ( CLEAR ?auto_27546 ) ( not ( = ?auto_27545 ?auto_27561 ) ) ( not ( = ?auto_27546 ?auto_27561 ) ) ( not ( = ?auto_27544 ?auto_27561 ) ) ( IS-CRATE ?auto_27545 ) ( not ( = ?auto_27560 ?auto_27554 ) ) ( not ( = ?auto_27555 ?auto_27560 ) ) ( HOIST-AT ?auto_27559 ?auto_27560 ) ( not ( = ?auto_27550 ?auto_27559 ) ) ( not ( = ?auto_27548 ?auto_27559 ) ) ( SURFACE-AT ?auto_27545 ?auto_27560 ) ( ON ?auto_27545 ?auto_27552 ) ( CLEAR ?auto_27545 ) ( not ( = ?auto_27545 ?auto_27552 ) ) ( not ( = ?auto_27546 ?auto_27552 ) ) ( not ( = ?auto_27544 ?auto_27552 ) ) ( not ( = ?auto_27561 ?auto_27552 ) ) ( IS-CRATE ?auto_27544 ) ( not ( = ?auto_27543 ?auto_27544 ) ) ( not ( = ?auto_27545 ?auto_27543 ) ) ( not ( = ?auto_27546 ?auto_27543 ) ) ( not ( = ?auto_27561 ?auto_27543 ) ) ( not ( = ?auto_27552 ?auto_27543 ) ) ( AVAILABLE ?auto_27559 ) ( SURFACE-AT ?auto_27544 ?auto_27560 ) ( ON ?auto_27544 ?auto_27547 ) ( CLEAR ?auto_27544 ) ( not ( = ?auto_27545 ?auto_27547 ) ) ( not ( = ?auto_27546 ?auto_27547 ) ) ( not ( = ?auto_27544 ?auto_27547 ) ) ( not ( = ?auto_27561 ?auto_27547 ) ) ( not ( = ?auto_27552 ?auto_27547 ) ) ( not ( = ?auto_27543 ?auto_27547 ) ) ( IS-CRATE ?auto_27543 ) ( not ( = ?auto_27549 ?auto_27543 ) ) ( not ( = ?auto_27545 ?auto_27549 ) ) ( not ( = ?auto_27546 ?auto_27549 ) ) ( not ( = ?auto_27544 ?auto_27549 ) ) ( not ( = ?auto_27561 ?auto_27549 ) ) ( not ( = ?auto_27552 ?auto_27549 ) ) ( not ( = ?auto_27547 ?auto_27549 ) ) ( not ( = ?auto_27557 ?auto_27554 ) ) ( not ( = ?auto_27555 ?auto_27557 ) ) ( not ( = ?auto_27560 ?auto_27557 ) ) ( HOIST-AT ?auto_27553 ?auto_27557 ) ( not ( = ?auto_27550 ?auto_27553 ) ) ( not ( = ?auto_27548 ?auto_27553 ) ) ( not ( = ?auto_27559 ?auto_27553 ) ) ( AVAILABLE ?auto_27553 ) ( SURFACE-AT ?auto_27543 ?auto_27557 ) ( ON ?auto_27543 ?auto_27551 ) ( CLEAR ?auto_27543 ) ( not ( = ?auto_27545 ?auto_27551 ) ) ( not ( = ?auto_27546 ?auto_27551 ) ) ( not ( = ?auto_27544 ?auto_27551 ) ) ( not ( = ?auto_27561 ?auto_27551 ) ) ( not ( = ?auto_27552 ?auto_27551 ) ) ( not ( = ?auto_27543 ?auto_27551 ) ) ( not ( = ?auto_27547 ?auto_27551 ) ) ( not ( = ?auto_27549 ?auto_27551 ) ) ( TRUCK-AT ?auto_27556 ?auto_27554 ) ( SURFACE-AT ?auto_27558 ?auto_27554 ) ( CLEAR ?auto_27558 ) ( LIFTING ?auto_27550 ?auto_27549 ) ( IS-CRATE ?auto_27549 ) ( not ( = ?auto_27558 ?auto_27549 ) ) ( not ( = ?auto_27545 ?auto_27558 ) ) ( not ( = ?auto_27546 ?auto_27558 ) ) ( not ( = ?auto_27544 ?auto_27558 ) ) ( not ( = ?auto_27561 ?auto_27558 ) ) ( not ( = ?auto_27552 ?auto_27558 ) ) ( not ( = ?auto_27543 ?auto_27558 ) ) ( not ( = ?auto_27547 ?auto_27558 ) ) ( not ( = ?auto_27551 ?auto_27558 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27544 ?auto_27545 ?auto_27546 )
      ( MAKE-3CRATE-VERIFY ?auto_27543 ?auto_27544 ?auto_27545 ?auto_27546 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27562 - SURFACE
      ?auto_27563 - SURFACE
      ?auto_27564 - SURFACE
      ?auto_27565 - SURFACE
      ?auto_27566 - SURFACE
    )
    :vars
    (
      ?auto_27569 - HOIST
      ?auto_27573 - PLACE
      ?auto_27574 - PLACE
      ?auto_27568 - HOIST
      ?auto_27580 - SURFACE
      ?auto_27579 - PLACE
      ?auto_27578 - HOIST
      ?auto_27571 - SURFACE
      ?auto_27567 - SURFACE
      ?auto_27576 - PLACE
      ?auto_27572 - HOIST
      ?auto_27570 - SURFACE
      ?auto_27575 - TRUCK
      ?auto_27577 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27569 ?auto_27573 ) ( IS-CRATE ?auto_27566 ) ( not ( = ?auto_27565 ?auto_27566 ) ) ( not ( = ?auto_27564 ?auto_27565 ) ) ( not ( = ?auto_27564 ?auto_27566 ) ) ( not ( = ?auto_27574 ?auto_27573 ) ) ( HOIST-AT ?auto_27568 ?auto_27574 ) ( not ( = ?auto_27569 ?auto_27568 ) ) ( AVAILABLE ?auto_27568 ) ( SURFACE-AT ?auto_27566 ?auto_27574 ) ( ON ?auto_27566 ?auto_27580 ) ( CLEAR ?auto_27566 ) ( not ( = ?auto_27565 ?auto_27580 ) ) ( not ( = ?auto_27566 ?auto_27580 ) ) ( not ( = ?auto_27564 ?auto_27580 ) ) ( IS-CRATE ?auto_27565 ) ( not ( = ?auto_27579 ?auto_27573 ) ) ( not ( = ?auto_27574 ?auto_27579 ) ) ( HOIST-AT ?auto_27578 ?auto_27579 ) ( not ( = ?auto_27569 ?auto_27578 ) ) ( not ( = ?auto_27568 ?auto_27578 ) ) ( SURFACE-AT ?auto_27565 ?auto_27579 ) ( ON ?auto_27565 ?auto_27571 ) ( CLEAR ?auto_27565 ) ( not ( = ?auto_27565 ?auto_27571 ) ) ( not ( = ?auto_27566 ?auto_27571 ) ) ( not ( = ?auto_27564 ?auto_27571 ) ) ( not ( = ?auto_27580 ?auto_27571 ) ) ( IS-CRATE ?auto_27564 ) ( not ( = ?auto_27563 ?auto_27564 ) ) ( not ( = ?auto_27565 ?auto_27563 ) ) ( not ( = ?auto_27566 ?auto_27563 ) ) ( not ( = ?auto_27580 ?auto_27563 ) ) ( not ( = ?auto_27571 ?auto_27563 ) ) ( AVAILABLE ?auto_27578 ) ( SURFACE-AT ?auto_27564 ?auto_27579 ) ( ON ?auto_27564 ?auto_27567 ) ( CLEAR ?auto_27564 ) ( not ( = ?auto_27565 ?auto_27567 ) ) ( not ( = ?auto_27566 ?auto_27567 ) ) ( not ( = ?auto_27564 ?auto_27567 ) ) ( not ( = ?auto_27580 ?auto_27567 ) ) ( not ( = ?auto_27571 ?auto_27567 ) ) ( not ( = ?auto_27563 ?auto_27567 ) ) ( IS-CRATE ?auto_27563 ) ( not ( = ?auto_27562 ?auto_27563 ) ) ( not ( = ?auto_27565 ?auto_27562 ) ) ( not ( = ?auto_27566 ?auto_27562 ) ) ( not ( = ?auto_27564 ?auto_27562 ) ) ( not ( = ?auto_27580 ?auto_27562 ) ) ( not ( = ?auto_27571 ?auto_27562 ) ) ( not ( = ?auto_27567 ?auto_27562 ) ) ( not ( = ?auto_27576 ?auto_27573 ) ) ( not ( = ?auto_27574 ?auto_27576 ) ) ( not ( = ?auto_27579 ?auto_27576 ) ) ( HOIST-AT ?auto_27572 ?auto_27576 ) ( not ( = ?auto_27569 ?auto_27572 ) ) ( not ( = ?auto_27568 ?auto_27572 ) ) ( not ( = ?auto_27578 ?auto_27572 ) ) ( AVAILABLE ?auto_27572 ) ( SURFACE-AT ?auto_27563 ?auto_27576 ) ( ON ?auto_27563 ?auto_27570 ) ( CLEAR ?auto_27563 ) ( not ( = ?auto_27565 ?auto_27570 ) ) ( not ( = ?auto_27566 ?auto_27570 ) ) ( not ( = ?auto_27564 ?auto_27570 ) ) ( not ( = ?auto_27580 ?auto_27570 ) ) ( not ( = ?auto_27571 ?auto_27570 ) ) ( not ( = ?auto_27563 ?auto_27570 ) ) ( not ( = ?auto_27567 ?auto_27570 ) ) ( not ( = ?auto_27562 ?auto_27570 ) ) ( TRUCK-AT ?auto_27575 ?auto_27573 ) ( SURFACE-AT ?auto_27577 ?auto_27573 ) ( CLEAR ?auto_27577 ) ( LIFTING ?auto_27569 ?auto_27562 ) ( IS-CRATE ?auto_27562 ) ( not ( = ?auto_27577 ?auto_27562 ) ) ( not ( = ?auto_27565 ?auto_27577 ) ) ( not ( = ?auto_27566 ?auto_27577 ) ) ( not ( = ?auto_27564 ?auto_27577 ) ) ( not ( = ?auto_27580 ?auto_27577 ) ) ( not ( = ?auto_27571 ?auto_27577 ) ) ( not ( = ?auto_27563 ?auto_27577 ) ) ( not ( = ?auto_27567 ?auto_27577 ) ) ( not ( = ?auto_27570 ?auto_27577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27564 ?auto_27565 ?auto_27566 )
      ( MAKE-4CRATE-VERIFY ?auto_27562 ?auto_27563 ?auto_27564 ?auto_27565 ?auto_27566 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27581 - SURFACE
      ?auto_27582 - SURFACE
      ?auto_27583 - SURFACE
      ?auto_27584 - SURFACE
      ?auto_27585 - SURFACE
      ?auto_27586 - SURFACE
    )
    :vars
    (
      ?auto_27589 - HOIST
      ?auto_27593 - PLACE
      ?auto_27594 - PLACE
      ?auto_27588 - HOIST
      ?auto_27599 - SURFACE
      ?auto_27598 - PLACE
      ?auto_27597 - HOIST
      ?auto_27591 - SURFACE
      ?auto_27587 - SURFACE
      ?auto_27596 - PLACE
      ?auto_27592 - HOIST
      ?auto_27590 - SURFACE
      ?auto_27595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27589 ?auto_27593 ) ( IS-CRATE ?auto_27586 ) ( not ( = ?auto_27585 ?auto_27586 ) ) ( not ( = ?auto_27584 ?auto_27585 ) ) ( not ( = ?auto_27584 ?auto_27586 ) ) ( not ( = ?auto_27594 ?auto_27593 ) ) ( HOIST-AT ?auto_27588 ?auto_27594 ) ( not ( = ?auto_27589 ?auto_27588 ) ) ( AVAILABLE ?auto_27588 ) ( SURFACE-AT ?auto_27586 ?auto_27594 ) ( ON ?auto_27586 ?auto_27599 ) ( CLEAR ?auto_27586 ) ( not ( = ?auto_27585 ?auto_27599 ) ) ( not ( = ?auto_27586 ?auto_27599 ) ) ( not ( = ?auto_27584 ?auto_27599 ) ) ( IS-CRATE ?auto_27585 ) ( not ( = ?auto_27598 ?auto_27593 ) ) ( not ( = ?auto_27594 ?auto_27598 ) ) ( HOIST-AT ?auto_27597 ?auto_27598 ) ( not ( = ?auto_27589 ?auto_27597 ) ) ( not ( = ?auto_27588 ?auto_27597 ) ) ( SURFACE-AT ?auto_27585 ?auto_27598 ) ( ON ?auto_27585 ?auto_27591 ) ( CLEAR ?auto_27585 ) ( not ( = ?auto_27585 ?auto_27591 ) ) ( not ( = ?auto_27586 ?auto_27591 ) ) ( not ( = ?auto_27584 ?auto_27591 ) ) ( not ( = ?auto_27599 ?auto_27591 ) ) ( IS-CRATE ?auto_27584 ) ( not ( = ?auto_27583 ?auto_27584 ) ) ( not ( = ?auto_27585 ?auto_27583 ) ) ( not ( = ?auto_27586 ?auto_27583 ) ) ( not ( = ?auto_27599 ?auto_27583 ) ) ( not ( = ?auto_27591 ?auto_27583 ) ) ( AVAILABLE ?auto_27597 ) ( SURFACE-AT ?auto_27584 ?auto_27598 ) ( ON ?auto_27584 ?auto_27587 ) ( CLEAR ?auto_27584 ) ( not ( = ?auto_27585 ?auto_27587 ) ) ( not ( = ?auto_27586 ?auto_27587 ) ) ( not ( = ?auto_27584 ?auto_27587 ) ) ( not ( = ?auto_27599 ?auto_27587 ) ) ( not ( = ?auto_27591 ?auto_27587 ) ) ( not ( = ?auto_27583 ?auto_27587 ) ) ( IS-CRATE ?auto_27583 ) ( not ( = ?auto_27582 ?auto_27583 ) ) ( not ( = ?auto_27585 ?auto_27582 ) ) ( not ( = ?auto_27586 ?auto_27582 ) ) ( not ( = ?auto_27584 ?auto_27582 ) ) ( not ( = ?auto_27599 ?auto_27582 ) ) ( not ( = ?auto_27591 ?auto_27582 ) ) ( not ( = ?auto_27587 ?auto_27582 ) ) ( not ( = ?auto_27596 ?auto_27593 ) ) ( not ( = ?auto_27594 ?auto_27596 ) ) ( not ( = ?auto_27598 ?auto_27596 ) ) ( HOIST-AT ?auto_27592 ?auto_27596 ) ( not ( = ?auto_27589 ?auto_27592 ) ) ( not ( = ?auto_27588 ?auto_27592 ) ) ( not ( = ?auto_27597 ?auto_27592 ) ) ( AVAILABLE ?auto_27592 ) ( SURFACE-AT ?auto_27583 ?auto_27596 ) ( ON ?auto_27583 ?auto_27590 ) ( CLEAR ?auto_27583 ) ( not ( = ?auto_27585 ?auto_27590 ) ) ( not ( = ?auto_27586 ?auto_27590 ) ) ( not ( = ?auto_27584 ?auto_27590 ) ) ( not ( = ?auto_27599 ?auto_27590 ) ) ( not ( = ?auto_27591 ?auto_27590 ) ) ( not ( = ?auto_27583 ?auto_27590 ) ) ( not ( = ?auto_27587 ?auto_27590 ) ) ( not ( = ?auto_27582 ?auto_27590 ) ) ( TRUCK-AT ?auto_27595 ?auto_27593 ) ( SURFACE-AT ?auto_27581 ?auto_27593 ) ( CLEAR ?auto_27581 ) ( LIFTING ?auto_27589 ?auto_27582 ) ( IS-CRATE ?auto_27582 ) ( not ( = ?auto_27581 ?auto_27582 ) ) ( not ( = ?auto_27585 ?auto_27581 ) ) ( not ( = ?auto_27586 ?auto_27581 ) ) ( not ( = ?auto_27584 ?auto_27581 ) ) ( not ( = ?auto_27599 ?auto_27581 ) ) ( not ( = ?auto_27591 ?auto_27581 ) ) ( not ( = ?auto_27583 ?auto_27581 ) ) ( not ( = ?auto_27587 ?auto_27581 ) ) ( not ( = ?auto_27590 ?auto_27581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27584 ?auto_27585 ?auto_27586 )
      ( MAKE-5CRATE-VERIFY ?auto_27581 ?auto_27582 ?auto_27583 ?auto_27584 ?auto_27585 ?auto_27586 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27600 - SURFACE
      ?auto_27601 - SURFACE
    )
    :vars
    (
      ?auto_27605 - HOIST
      ?auto_27610 - PLACE
      ?auto_27613 - SURFACE
      ?auto_27611 - PLACE
      ?auto_27603 - HOIST
      ?auto_27618 - SURFACE
      ?auto_27617 - PLACE
      ?auto_27616 - HOIST
      ?auto_27608 - SURFACE
      ?auto_27606 - SURFACE
      ?auto_27602 - SURFACE
      ?auto_27604 - SURFACE
      ?auto_27614 - PLACE
      ?auto_27609 - HOIST
      ?auto_27607 - SURFACE
      ?auto_27612 - TRUCK
      ?auto_27615 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27605 ?auto_27610 ) ( IS-CRATE ?auto_27601 ) ( not ( = ?auto_27600 ?auto_27601 ) ) ( not ( = ?auto_27613 ?auto_27600 ) ) ( not ( = ?auto_27613 ?auto_27601 ) ) ( not ( = ?auto_27611 ?auto_27610 ) ) ( HOIST-AT ?auto_27603 ?auto_27611 ) ( not ( = ?auto_27605 ?auto_27603 ) ) ( AVAILABLE ?auto_27603 ) ( SURFACE-AT ?auto_27601 ?auto_27611 ) ( ON ?auto_27601 ?auto_27618 ) ( CLEAR ?auto_27601 ) ( not ( = ?auto_27600 ?auto_27618 ) ) ( not ( = ?auto_27601 ?auto_27618 ) ) ( not ( = ?auto_27613 ?auto_27618 ) ) ( IS-CRATE ?auto_27600 ) ( not ( = ?auto_27617 ?auto_27610 ) ) ( not ( = ?auto_27611 ?auto_27617 ) ) ( HOIST-AT ?auto_27616 ?auto_27617 ) ( not ( = ?auto_27605 ?auto_27616 ) ) ( not ( = ?auto_27603 ?auto_27616 ) ) ( SURFACE-AT ?auto_27600 ?auto_27617 ) ( ON ?auto_27600 ?auto_27608 ) ( CLEAR ?auto_27600 ) ( not ( = ?auto_27600 ?auto_27608 ) ) ( not ( = ?auto_27601 ?auto_27608 ) ) ( not ( = ?auto_27613 ?auto_27608 ) ) ( not ( = ?auto_27618 ?auto_27608 ) ) ( IS-CRATE ?auto_27613 ) ( not ( = ?auto_27606 ?auto_27613 ) ) ( not ( = ?auto_27600 ?auto_27606 ) ) ( not ( = ?auto_27601 ?auto_27606 ) ) ( not ( = ?auto_27618 ?auto_27606 ) ) ( not ( = ?auto_27608 ?auto_27606 ) ) ( AVAILABLE ?auto_27616 ) ( SURFACE-AT ?auto_27613 ?auto_27617 ) ( ON ?auto_27613 ?auto_27602 ) ( CLEAR ?auto_27613 ) ( not ( = ?auto_27600 ?auto_27602 ) ) ( not ( = ?auto_27601 ?auto_27602 ) ) ( not ( = ?auto_27613 ?auto_27602 ) ) ( not ( = ?auto_27618 ?auto_27602 ) ) ( not ( = ?auto_27608 ?auto_27602 ) ) ( not ( = ?auto_27606 ?auto_27602 ) ) ( IS-CRATE ?auto_27606 ) ( not ( = ?auto_27604 ?auto_27606 ) ) ( not ( = ?auto_27600 ?auto_27604 ) ) ( not ( = ?auto_27601 ?auto_27604 ) ) ( not ( = ?auto_27613 ?auto_27604 ) ) ( not ( = ?auto_27618 ?auto_27604 ) ) ( not ( = ?auto_27608 ?auto_27604 ) ) ( not ( = ?auto_27602 ?auto_27604 ) ) ( not ( = ?auto_27614 ?auto_27610 ) ) ( not ( = ?auto_27611 ?auto_27614 ) ) ( not ( = ?auto_27617 ?auto_27614 ) ) ( HOIST-AT ?auto_27609 ?auto_27614 ) ( not ( = ?auto_27605 ?auto_27609 ) ) ( not ( = ?auto_27603 ?auto_27609 ) ) ( not ( = ?auto_27616 ?auto_27609 ) ) ( AVAILABLE ?auto_27609 ) ( SURFACE-AT ?auto_27606 ?auto_27614 ) ( ON ?auto_27606 ?auto_27607 ) ( CLEAR ?auto_27606 ) ( not ( = ?auto_27600 ?auto_27607 ) ) ( not ( = ?auto_27601 ?auto_27607 ) ) ( not ( = ?auto_27613 ?auto_27607 ) ) ( not ( = ?auto_27618 ?auto_27607 ) ) ( not ( = ?auto_27608 ?auto_27607 ) ) ( not ( = ?auto_27606 ?auto_27607 ) ) ( not ( = ?auto_27602 ?auto_27607 ) ) ( not ( = ?auto_27604 ?auto_27607 ) ) ( TRUCK-AT ?auto_27612 ?auto_27610 ) ( SURFACE-AT ?auto_27615 ?auto_27610 ) ( CLEAR ?auto_27615 ) ( IS-CRATE ?auto_27604 ) ( not ( = ?auto_27615 ?auto_27604 ) ) ( not ( = ?auto_27600 ?auto_27615 ) ) ( not ( = ?auto_27601 ?auto_27615 ) ) ( not ( = ?auto_27613 ?auto_27615 ) ) ( not ( = ?auto_27618 ?auto_27615 ) ) ( not ( = ?auto_27608 ?auto_27615 ) ) ( not ( = ?auto_27606 ?auto_27615 ) ) ( not ( = ?auto_27602 ?auto_27615 ) ) ( not ( = ?auto_27607 ?auto_27615 ) ) ( AVAILABLE ?auto_27605 ) ( IN ?auto_27604 ?auto_27612 ) )
    :subtasks
    ( ( !UNLOAD ?auto_27605 ?auto_27604 ?auto_27612 ?auto_27610 )
      ( MAKE-2CRATE ?auto_27613 ?auto_27600 ?auto_27601 )
      ( MAKE-1CRATE-VERIFY ?auto_27600 ?auto_27601 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27619 - SURFACE
      ?auto_27620 - SURFACE
      ?auto_27621 - SURFACE
    )
    :vars
    (
      ?auto_27629 - HOIST
      ?auto_27637 - PLACE
      ?auto_27633 - PLACE
      ?auto_27623 - HOIST
      ?auto_27634 - SURFACE
      ?auto_27635 - PLACE
      ?auto_27631 - HOIST
      ?auto_27624 - SURFACE
      ?auto_27627 - SURFACE
      ?auto_27636 - SURFACE
      ?auto_27632 - SURFACE
      ?auto_27622 - PLACE
      ?auto_27630 - HOIST
      ?auto_27628 - SURFACE
      ?auto_27625 - TRUCK
      ?auto_27626 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27629 ?auto_27637 ) ( IS-CRATE ?auto_27621 ) ( not ( = ?auto_27620 ?auto_27621 ) ) ( not ( = ?auto_27619 ?auto_27620 ) ) ( not ( = ?auto_27619 ?auto_27621 ) ) ( not ( = ?auto_27633 ?auto_27637 ) ) ( HOIST-AT ?auto_27623 ?auto_27633 ) ( not ( = ?auto_27629 ?auto_27623 ) ) ( AVAILABLE ?auto_27623 ) ( SURFACE-AT ?auto_27621 ?auto_27633 ) ( ON ?auto_27621 ?auto_27634 ) ( CLEAR ?auto_27621 ) ( not ( = ?auto_27620 ?auto_27634 ) ) ( not ( = ?auto_27621 ?auto_27634 ) ) ( not ( = ?auto_27619 ?auto_27634 ) ) ( IS-CRATE ?auto_27620 ) ( not ( = ?auto_27635 ?auto_27637 ) ) ( not ( = ?auto_27633 ?auto_27635 ) ) ( HOIST-AT ?auto_27631 ?auto_27635 ) ( not ( = ?auto_27629 ?auto_27631 ) ) ( not ( = ?auto_27623 ?auto_27631 ) ) ( SURFACE-AT ?auto_27620 ?auto_27635 ) ( ON ?auto_27620 ?auto_27624 ) ( CLEAR ?auto_27620 ) ( not ( = ?auto_27620 ?auto_27624 ) ) ( not ( = ?auto_27621 ?auto_27624 ) ) ( not ( = ?auto_27619 ?auto_27624 ) ) ( not ( = ?auto_27634 ?auto_27624 ) ) ( IS-CRATE ?auto_27619 ) ( not ( = ?auto_27627 ?auto_27619 ) ) ( not ( = ?auto_27620 ?auto_27627 ) ) ( not ( = ?auto_27621 ?auto_27627 ) ) ( not ( = ?auto_27634 ?auto_27627 ) ) ( not ( = ?auto_27624 ?auto_27627 ) ) ( AVAILABLE ?auto_27631 ) ( SURFACE-AT ?auto_27619 ?auto_27635 ) ( ON ?auto_27619 ?auto_27636 ) ( CLEAR ?auto_27619 ) ( not ( = ?auto_27620 ?auto_27636 ) ) ( not ( = ?auto_27621 ?auto_27636 ) ) ( not ( = ?auto_27619 ?auto_27636 ) ) ( not ( = ?auto_27634 ?auto_27636 ) ) ( not ( = ?auto_27624 ?auto_27636 ) ) ( not ( = ?auto_27627 ?auto_27636 ) ) ( IS-CRATE ?auto_27627 ) ( not ( = ?auto_27632 ?auto_27627 ) ) ( not ( = ?auto_27620 ?auto_27632 ) ) ( not ( = ?auto_27621 ?auto_27632 ) ) ( not ( = ?auto_27619 ?auto_27632 ) ) ( not ( = ?auto_27634 ?auto_27632 ) ) ( not ( = ?auto_27624 ?auto_27632 ) ) ( not ( = ?auto_27636 ?auto_27632 ) ) ( not ( = ?auto_27622 ?auto_27637 ) ) ( not ( = ?auto_27633 ?auto_27622 ) ) ( not ( = ?auto_27635 ?auto_27622 ) ) ( HOIST-AT ?auto_27630 ?auto_27622 ) ( not ( = ?auto_27629 ?auto_27630 ) ) ( not ( = ?auto_27623 ?auto_27630 ) ) ( not ( = ?auto_27631 ?auto_27630 ) ) ( AVAILABLE ?auto_27630 ) ( SURFACE-AT ?auto_27627 ?auto_27622 ) ( ON ?auto_27627 ?auto_27628 ) ( CLEAR ?auto_27627 ) ( not ( = ?auto_27620 ?auto_27628 ) ) ( not ( = ?auto_27621 ?auto_27628 ) ) ( not ( = ?auto_27619 ?auto_27628 ) ) ( not ( = ?auto_27634 ?auto_27628 ) ) ( not ( = ?auto_27624 ?auto_27628 ) ) ( not ( = ?auto_27627 ?auto_27628 ) ) ( not ( = ?auto_27636 ?auto_27628 ) ) ( not ( = ?auto_27632 ?auto_27628 ) ) ( TRUCK-AT ?auto_27625 ?auto_27637 ) ( SURFACE-AT ?auto_27626 ?auto_27637 ) ( CLEAR ?auto_27626 ) ( IS-CRATE ?auto_27632 ) ( not ( = ?auto_27626 ?auto_27632 ) ) ( not ( = ?auto_27620 ?auto_27626 ) ) ( not ( = ?auto_27621 ?auto_27626 ) ) ( not ( = ?auto_27619 ?auto_27626 ) ) ( not ( = ?auto_27634 ?auto_27626 ) ) ( not ( = ?auto_27624 ?auto_27626 ) ) ( not ( = ?auto_27627 ?auto_27626 ) ) ( not ( = ?auto_27636 ?auto_27626 ) ) ( not ( = ?auto_27628 ?auto_27626 ) ) ( AVAILABLE ?auto_27629 ) ( IN ?auto_27632 ?auto_27625 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27620 ?auto_27621 )
      ( MAKE-2CRATE-VERIFY ?auto_27619 ?auto_27620 ?auto_27621 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27638 - SURFACE
      ?auto_27639 - SURFACE
      ?auto_27640 - SURFACE
      ?auto_27641 - SURFACE
    )
    :vars
    (
      ?auto_27654 - HOIST
      ?auto_27648 - PLACE
      ?auto_27656 - PLACE
      ?auto_27645 - HOIST
      ?auto_27652 - SURFACE
      ?auto_27655 - PLACE
      ?auto_27651 - HOIST
      ?auto_27642 - SURFACE
      ?auto_27649 - SURFACE
      ?auto_27650 - SURFACE
      ?auto_27646 - PLACE
      ?auto_27647 - HOIST
      ?auto_27644 - SURFACE
      ?auto_27653 - TRUCK
      ?auto_27643 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27654 ?auto_27648 ) ( IS-CRATE ?auto_27641 ) ( not ( = ?auto_27640 ?auto_27641 ) ) ( not ( = ?auto_27639 ?auto_27640 ) ) ( not ( = ?auto_27639 ?auto_27641 ) ) ( not ( = ?auto_27656 ?auto_27648 ) ) ( HOIST-AT ?auto_27645 ?auto_27656 ) ( not ( = ?auto_27654 ?auto_27645 ) ) ( AVAILABLE ?auto_27645 ) ( SURFACE-AT ?auto_27641 ?auto_27656 ) ( ON ?auto_27641 ?auto_27652 ) ( CLEAR ?auto_27641 ) ( not ( = ?auto_27640 ?auto_27652 ) ) ( not ( = ?auto_27641 ?auto_27652 ) ) ( not ( = ?auto_27639 ?auto_27652 ) ) ( IS-CRATE ?auto_27640 ) ( not ( = ?auto_27655 ?auto_27648 ) ) ( not ( = ?auto_27656 ?auto_27655 ) ) ( HOIST-AT ?auto_27651 ?auto_27655 ) ( not ( = ?auto_27654 ?auto_27651 ) ) ( not ( = ?auto_27645 ?auto_27651 ) ) ( SURFACE-AT ?auto_27640 ?auto_27655 ) ( ON ?auto_27640 ?auto_27642 ) ( CLEAR ?auto_27640 ) ( not ( = ?auto_27640 ?auto_27642 ) ) ( not ( = ?auto_27641 ?auto_27642 ) ) ( not ( = ?auto_27639 ?auto_27642 ) ) ( not ( = ?auto_27652 ?auto_27642 ) ) ( IS-CRATE ?auto_27639 ) ( not ( = ?auto_27638 ?auto_27639 ) ) ( not ( = ?auto_27640 ?auto_27638 ) ) ( not ( = ?auto_27641 ?auto_27638 ) ) ( not ( = ?auto_27652 ?auto_27638 ) ) ( not ( = ?auto_27642 ?auto_27638 ) ) ( AVAILABLE ?auto_27651 ) ( SURFACE-AT ?auto_27639 ?auto_27655 ) ( ON ?auto_27639 ?auto_27649 ) ( CLEAR ?auto_27639 ) ( not ( = ?auto_27640 ?auto_27649 ) ) ( not ( = ?auto_27641 ?auto_27649 ) ) ( not ( = ?auto_27639 ?auto_27649 ) ) ( not ( = ?auto_27652 ?auto_27649 ) ) ( not ( = ?auto_27642 ?auto_27649 ) ) ( not ( = ?auto_27638 ?auto_27649 ) ) ( IS-CRATE ?auto_27638 ) ( not ( = ?auto_27650 ?auto_27638 ) ) ( not ( = ?auto_27640 ?auto_27650 ) ) ( not ( = ?auto_27641 ?auto_27650 ) ) ( not ( = ?auto_27639 ?auto_27650 ) ) ( not ( = ?auto_27652 ?auto_27650 ) ) ( not ( = ?auto_27642 ?auto_27650 ) ) ( not ( = ?auto_27649 ?auto_27650 ) ) ( not ( = ?auto_27646 ?auto_27648 ) ) ( not ( = ?auto_27656 ?auto_27646 ) ) ( not ( = ?auto_27655 ?auto_27646 ) ) ( HOIST-AT ?auto_27647 ?auto_27646 ) ( not ( = ?auto_27654 ?auto_27647 ) ) ( not ( = ?auto_27645 ?auto_27647 ) ) ( not ( = ?auto_27651 ?auto_27647 ) ) ( AVAILABLE ?auto_27647 ) ( SURFACE-AT ?auto_27638 ?auto_27646 ) ( ON ?auto_27638 ?auto_27644 ) ( CLEAR ?auto_27638 ) ( not ( = ?auto_27640 ?auto_27644 ) ) ( not ( = ?auto_27641 ?auto_27644 ) ) ( not ( = ?auto_27639 ?auto_27644 ) ) ( not ( = ?auto_27652 ?auto_27644 ) ) ( not ( = ?auto_27642 ?auto_27644 ) ) ( not ( = ?auto_27638 ?auto_27644 ) ) ( not ( = ?auto_27649 ?auto_27644 ) ) ( not ( = ?auto_27650 ?auto_27644 ) ) ( TRUCK-AT ?auto_27653 ?auto_27648 ) ( SURFACE-AT ?auto_27643 ?auto_27648 ) ( CLEAR ?auto_27643 ) ( IS-CRATE ?auto_27650 ) ( not ( = ?auto_27643 ?auto_27650 ) ) ( not ( = ?auto_27640 ?auto_27643 ) ) ( not ( = ?auto_27641 ?auto_27643 ) ) ( not ( = ?auto_27639 ?auto_27643 ) ) ( not ( = ?auto_27652 ?auto_27643 ) ) ( not ( = ?auto_27642 ?auto_27643 ) ) ( not ( = ?auto_27638 ?auto_27643 ) ) ( not ( = ?auto_27649 ?auto_27643 ) ) ( not ( = ?auto_27644 ?auto_27643 ) ) ( AVAILABLE ?auto_27654 ) ( IN ?auto_27650 ?auto_27653 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27639 ?auto_27640 ?auto_27641 )
      ( MAKE-3CRATE-VERIFY ?auto_27638 ?auto_27639 ?auto_27640 ?auto_27641 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27657 - SURFACE
      ?auto_27658 - SURFACE
      ?auto_27659 - SURFACE
      ?auto_27660 - SURFACE
      ?auto_27661 - SURFACE
    )
    :vars
    (
      ?auto_27673 - HOIST
      ?auto_27668 - PLACE
      ?auto_27675 - PLACE
      ?auto_27665 - HOIST
      ?auto_27671 - SURFACE
      ?auto_27674 - PLACE
      ?auto_27670 - HOIST
      ?auto_27662 - SURFACE
      ?auto_27669 - SURFACE
      ?auto_27666 - PLACE
      ?auto_27667 - HOIST
      ?auto_27664 - SURFACE
      ?auto_27672 - TRUCK
      ?auto_27663 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27673 ?auto_27668 ) ( IS-CRATE ?auto_27661 ) ( not ( = ?auto_27660 ?auto_27661 ) ) ( not ( = ?auto_27659 ?auto_27660 ) ) ( not ( = ?auto_27659 ?auto_27661 ) ) ( not ( = ?auto_27675 ?auto_27668 ) ) ( HOIST-AT ?auto_27665 ?auto_27675 ) ( not ( = ?auto_27673 ?auto_27665 ) ) ( AVAILABLE ?auto_27665 ) ( SURFACE-AT ?auto_27661 ?auto_27675 ) ( ON ?auto_27661 ?auto_27671 ) ( CLEAR ?auto_27661 ) ( not ( = ?auto_27660 ?auto_27671 ) ) ( not ( = ?auto_27661 ?auto_27671 ) ) ( not ( = ?auto_27659 ?auto_27671 ) ) ( IS-CRATE ?auto_27660 ) ( not ( = ?auto_27674 ?auto_27668 ) ) ( not ( = ?auto_27675 ?auto_27674 ) ) ( HOIST-AT ?auto_27670 ?auto_27674 ) ( not ( = ?auto_27673 ?auto_27670 ) ) ( not ( = ?auto_27665 ?auto_27670 ) ) ( SURFACE-AT ?auto_27660 ?auto_27674 ) ( ON ?auto_27660 ?auto_27662 ) ( CLEAR ?auto_27660 ) ( not ( = ?auto_27660 ?auto_27662 ) ) ( not ( = ?auto_27661 ?auto_27662 ) ) ( not ( = ?auto_27659 ?auto_27662 ) ) ( not ( = ?auto_27671 ?auto_27662 ) ) ( IS-CRATE ?auto_27659 ) ( not ( = ?auto_27658 ?auto_27659 ) ) ( not ( = ?auto_27660 ?auto_27658 ) ) ( not ( = ?auto_27661 ?auto_27658 ) ) ( not ( = ?auto_27671 ?auto_27658 ) ) ( not ( = ?auto_27662 ?auto_27658 ) ) ( AVAILABLE ?auto_27670 ) ( SURFACE-AT ?auto_27659 ?auto_27674 ) ( ON ?auto_27659 ?auto_27669 ) ( CLEAR ?auto_27659 ) ( not ( = ?auto_27660 ?auto_27669 ) ) ( not ( = ?auto_27661 ?auto_27669 ) ) ( not ( = ?auto_27659 ?auto_27669 ) ) ( not ( = ?auto_27671 ?auto_27669 ) ) ( not ( = ?auto_27662 ?auto_27669 ) ) ( not ( = ?auto_27658 ?auto_27669 ) ) ( IS-CRATE ?auto_27658 ) ( not ( = ?auto_27657 ?auto_27658 ) ) ( not ( = ?auto_27660 ?auto_27657 ) ) ( not ( = ?auto_27661 ?auto_27657 ) ) ( not ( = ?auto_27659 ?auto_27657 ) ) ( not ( = ?auto_27671 ?auto_27657 ) ) ( not ( = ?auto_27662 ?auto_27657 ) ) ( not ( = ?auto_27669 ?auto_27657 ) ) ( not ( = ?auto_27666 ?auto_27668 ) ) ( not ( = ?auto_27675 ?auto_27666 ) ) ( not ( = ?auto_27674 ?auto_27666 ) ) ( HOIST-AT ?auto_27667 ?auto_27666 ) ( not ( = ?auto_27673 ?auto_27667 ) ) ( not ( = ?auto_27665 ?auto_27667 ) ) ( not ( = ?auto_27670 ?auto_27667 ) ) ( AVAILABLE ?auto_27667 ) ( SURFACE-AT ?auto_27658 ?auto_27666 ) ( ON ?auto_27658 ?auto_27664 ) ( CLEAR ?auto_27658 ) ( not ( = ?auto_27660 ?auto_27664 ) ) ( not ( = ?auto_27661 ?auto_27664 ) ) ( not ( = ?auto_27659 ?auto_27664 ) ) ( not ( = ?auto_27671 ?auto_27664 ) ) ( not ( = ?auto_27662 ?auto_27664 ) ) ( not ( = ?auto_27658 ?auto_27664 ) ) ( not ( = ?auto_27669 ?auto_27664 ) ) ( not ( = ?auto_27657 ?auto_27664 ) ) ( TRUCK-AT ?auto_27672 ?auto_27668 ) ( SURFACE-AT ?auto_27663 ?auto_27668 ) ( CLEAR ?auto_27663 ) ( IS-CRATE ?auto_27657 ) ( not ( = ?auto_27663 ?auto_27657 ) ) ( not ( = ?auto_27660 ?auto_27663 ) ) ( not ( = ?auto_27661 ?auto_27663 ) ) ( not ( = ?auto_27659 ?auto_27663 ) ) ( not ( = ?auto_27671 ?auto_27663 ) ) ( not ( = ?auto_27662 ?auto_27663 ) ) ( not ( = ?auto_27658 ?auto_27663 ) ) ( not ( = ?auto_27669 ?auto_27663 ) ) ( not ( = ?auto_27664 ?auto_27663 ) ) ( AVAILABLE ?auto_27673 ) ( IN ?auto_27657 ?auto_27672 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27659 ?auto_27660 ?auto_27661 )
      ( MAKE-4CRATE-VERIFY ?auto_27657 ?auto_27658 ?auto_27659 ?auto_27660 ?auto_27661 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27676 - SURFACE
      ?auto_27677 - SURFACE
      ?auto_27678 - SURFACE
      ?auto_27679 - SURFACE
      ?auto_27680 - SURFACE
      ?auto_27681 - SURFACE
    )
    :vars
    (
      ?auto_27692 - HOIST
      ?auto_27687 - PLACE
      ?auto_27694 - PLACE
      ?auto_27684 - HOIST
      ?auto_27690 - SURFACE
      ?auto_27693 - PLACE
      ?auto_27689 - HOIST
      ?auto_27682 - SURFACE
      ?auto_27688 - SURFACE
      ?auto_27685 - PLACE
      ?auto_27686 - HOIST
      ?auto_27683 - SURFACE
      ?auto_27691 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27692 ?auto_27687 ) ( IS-CRATE ?auto_27681 ) ( not ( = ?auto_27680 ?auto_27681 ) ) ( not ( = ?auto_27679 ?auto_27680 ) ) ( not ( = ?auto_27679 ?auto_27681 ) ) ( not ( = ?auto_27694 ?auto_27687 ) ) ( HOIST-AT ?auto_27684 ?auto_27694 ) ( not ( = ?auto_27692 ?auto_27684 ) ) ( AVAILABLE ?auto_27684 ) ( SURFACE-AT ?auto_27681 ?auto_27694 ) ( ON ?auto_27681 ?auto_27690 ) ( CLEAR ?auto_27681 ) ( not ( = ?auto_27680 ?auto_27690 ) ) ( not ( = ?auto_27681 ?auto_27690 ) ) ( not ( = ?auto_27679 ?auto_27690 ) ) ( IS-CRATE ?auto_27680 ) ( not ( = ?auto_27693 ?auto_27687 ) ) ( not ( = ?auto_27694 ?auto_27693 ) ) ( HOIST-AT ?auto_27689 ?auto_27693 ) ( not ( = ?auto_27692 ?auto_27689 ) ) ( not ( = ?auto_27684 ?auto_27689 ) ) ( SURFACE-AT ?auto_27680 ?auto_27693 ) ( ON ?auto_27680 ?auto_27682 ) ( CLEAR ?auto_27680 ) ( not ( = ?auto_27680 ?auto_27682 ) ) ( not ( = ?auto_27681 ?auto_27682 ) ) ( not ( = ?auto_27679 ?auto_27682 ) ) ( not ( = ?auto_27690 ?auto_27682 ) ) ( IS-CRATE ?auto_27679 ) ( not ( = ?auto_27678 ?auto_27679 ) ) ( not ( = ?auto_27680 ?auto_27678 ) ) ( not ( = ?auto_27681 ?auto_27678 ) ) ( not ( = ?auto_27690 ?auto_27678 ) ) ( not ( = ?auto_27682 ?auto_27678 ) ) ( AVAILABLE ?auto_27689 ) ( SURFACE-AT ?auto_27679 ?auto_27693 ) ( ON ?auto_27679 ?auto_27688 ) ( CLEAR ?auto_27679 ) ( not ( = ?auto_27680 ?auto_27688 ) ) ( not ( = ?auto_27681 ?auto_27688 ) ) ( not ( = ?auto_27679 ?auto_27688 ) ) ( not ( = ?auto_27690 ?auto_27688 ) ) ( not ( = ?auto_27682 ?auto_27688 ) ) ( not ( = ?auto_27678 ?auto_27688 ) ) ( IS-CRATE ?auto_27678 ) ( not ( = ?auto_27677 ?auto_27678 ) ) ( not ( = ?auto_27680 ?auto_27677 ) ) ( not ( = ?auto_27681 ?auto_27677 ) ) ( not ( = ?auto_27679 ?auto_27677 ) ) ( not ( = ?auto_27690 ?auto_27677 ) ) ( not ( = ?auto_27682 ?auto_27677 ) ) ( not ( = ?auto_27688 ?auto_27677 ) ) ( not ( = ?auto_27685 ?auto_27687 ) ) ( not ( = ?auto_27694 ?auto_27685 ) ) ( not ( = ?auto_27693 ?auto_27685 ) ) ( HOIST-AT ?auto_27686 ?auto_27685 ) ( not ( = ?auto_27692 ?auto_27686 ) ) ( not ( = ?auto_27684 ?auto_27686 ) ) ( not ( = ?auto_27689 ?auto_27686 ) ) ( AVAILABLE ?auto_27686 ) ( SURFACE-AT ?auto_27678 ?auto_27685 ) ( ON ?auto_27678 ?auto_27683 ) ( CLEAR ?auto_27678 ) ( not ( = ?auto_27680 ?auto_27683 ) ) ( not ( = ?auto_27681 ?auto_27683 ) ) ( not ( = ?auto_27679 ?auto_27683 ) ) ( not ( = ?auto_27690 ?auto_27683 ) ) ( not ( = ?auto_27682 ?auto_27683 ) ) ( not ( = ?auto_27678 ?auto_27683 ) ) ( not ( = ?auto_27688 ?auto_27683 ) ) ( not ( = ?auto_27677 ?auto_27683 ) ) ( TRUCK-AT ?auto_27691 ?auto_27687 ) ( SURFACE-AT ?auto_27676 ?auto_27687 ) ( CLEAR ?auto_27676 ) ( IS-CRATE ?auto_27677 ) ( not ( = ?auto_27676 ?auto_27677 ) ) ( not ( = ?auto_27680 ?auto_27676 ) ) ( not ( = ?auto_27681 ?auto_27676 ) ) ( not ( = ?auto_27679 ?auto_27676 ) ) ( not ( = ?auto_27690 ?auto_27676 ) ) ( not ( = ?auto_27682 ?auto_27676 ) ) ( not ( = ?auto_27678 ?auto_27676 ) ) ( not ( = ?auto_27688 ?auto_27676 ) ) ( not ( = ?auto_27683 ?auto_27676 ) ) ( AVAILABLE ?auto_27692 ) ( IN ?auto_27677 ?auto_27691 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27679 ?auto_27680 ?auto_27681 )
      ( MAKE-5CRATE-VERIFY ?auto_27676 ?auto_27677 ?auto_27678 ?auto_27679 ?auto_27680 ?auto_27681 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27695 - SURFACE
      ?auto_27696 - SURFACE
    )
    :vars
    (
      ?auto_27710 - HOIST
      ?auto_27703 - PLACE
      ?auto_27711 - SURFACE
      ?auto_27713 - PLACE
      ?auto_27700 - HOIST
      ?auto_27708 - SURFACE
      ?auto_27712 - PLACE
      ?auto_27707 - HOIST
      ?auto_27697 - SURFACE
      ?auto_27704 - SURFACE
      ?auto_27705 - SURFACE
      ?auto_27706 - SURFACE
      ?auto_27701 - PLACE
      ?auto_27702 - HOIST
      ?auto_27699 - SURFACE
      ?auto_27698 - SURFACE
      ?auto_27709 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27710 ?auto_27703 ) ( IS-CRATE ?auto_27696 ) ( not ( = ?auto_27695 ?auto_27696 ) ) ( not ( = ?auto_27711 ?auto_27695 ) ) ( not ( = ?auto_27711 ?auto_27696 ) ) ( not ( = ?auto_27713 ?auto_27703 ) ) ( HOIST-AT ?auto_27700 ?auto_27713 ) ( not ( = ?auto_27710 ?auto_27700 ) ) ( AVAILABLE ?auto_27700 ) ( SURFACE-AT ?auto_27696 ?auto_27713 ) ( ON ?auto_27696 ?auto_27708 ) ( CLEAR ?auto_27696 ) ( not ( = ?auto_27695 ?auto_27708 ) ) ( not ( = ?auto_27696 ?auto_27708 ) ) ( not ( = ?auto_27711 ?auto_27708 ) ) ( IS-CRATE ?auto_27695 ) ( not ( = ?auto_27712 ?auto_27703 ) ) ( not ( = ?auto_27713 ?auto_27712 ) ) ( HOIST-AT ?auto_27707 ?auto_27712 ) ( not ( = ?auto_27710 ?auto_27707 ) ) ( not ( = ?auto_27700 ?auto_27707 ) ) ( SURFACE-AT ?auto_27695 ?auto_27712 ) ( ON ?auto_27695 ?auto_27697 ) ( CLEAR ?auto_27695 ) ( not ( = ?auto_27695 ?auto_27697 ) ) ( not ( = ?auto_27696 ?auto_27697 ) ) ( not ( = ?auto_27711 ?auto_27697 ) ) ( not ( = ?auto_27708 ?auto_27697 ) ) ( IS-CRATE ?auto_27711 ) ( not ( = ?auto_27704 ?auto_27711 ) ) ( not ( = ?auto_27695 ?auto_27704 ) ) ( not ( = ?auto_27696 ?auto_27704 ) ) ( not ( = ?auto_27708 ?auto_27704 ) ) ( not ( = ?auto_27697 ?auto_27704 ) ) ( AVAILABLE ?auto_27707 ) ( SURFACE-AT ?auto_27711 ?auto_27712 ) ( ON ?auto_27711 ?auto_27705 ) ( CLEAR ?auto_27711 ) ( not ( = ?auto_27695 ?auto_27705 ) ) ( not ( = ?auto_27696 ?auto_27705 ) ) ( not ( = ?auto_27711 ?auto_27705 ) ) ( not ( = ?auto_27708 ?auto_27705 ) ) ( not ( = ?auto_27697 ?auto_27705 ) ) ( not ( = ?auto_27704 ?auto_27705 ) ) ( IS-CRATE ?auto_27704 ) ( not ( = ?auto_27706 ?auto_27704 ) ) ( not ( = ?auto_27695 ?auto_27706 ) ) ( not ( = ?auto_27696 ?auto_27706 ) ) ( not ( = ?auto_27711 ?auto_27706 ) ) ( not ( = ?auto_27708 ?auto_27706 ) ) ( not ( = ?auto_27697 ?auto_27706 ) ) ( not ( = ?auto_27705 ?auto_27706 ) ) ( not ( = ?auto_27701 ?auto_27703 ) ) ( not ( = ?auto_27713 ?auto_27701 ) ) ( not ( = ?auto_27712 ?auto_27701 ) ) ( HOIST-AT ?auto_27702 ?auto_27701 ) ( not ( = ?auto_27710 ?auto_27702 ) ) ( not ( = ?auto_27700 ?auto_27702 ) ) ( not ( = ?auto_27707 ?auto_27702 ) ) ( AVAILABLE ?auto_27702 ) ( SURFACE-AT ?auto_27704 ?auto_27701 ) ( ON ?auto_27704 ?auto_27699 ) ( CLEAR ?auto_27704 ) ( not ( = ?auto_27695 ?auto_27699 ) ) ( not ( = ?auto_27696 ?auto_27699 ) ) ( not ( = ?auto_27711 ?auto_27699 ) ) ( not ( = ?auto_27708 ?auto_27699 ) ) ( not ( = ?auto_27697 ?auto_27699 ) ) ( not ( = ?auto_27704 ?auto_27699 ) ) ( not ( = ?auto_27705 ?auto_27699 ) ) ( not ( = ?auto_27706 ?auto_27699 ) ) ( SURFACE-AT ?auto_27698 ?auto_27703 ) ( CLEAR ?auto_27698 ) ( IS-CRATE ?auto_27706 ) ( not ( = ?auto_27698 ?auto_27706 ) ) ( not ( = ?auto_27695 ?auto_27698 ) ) ( not ( = ?auto_27696 ?auto_27698 ) ) ( not ( = ?auto_27711 ?auto_27698 ) ) ( not ( = ?auto_27708 ?auto_27698 ) ) ( not ( = ?auto_27697 ?auto_27698 ) ) ( not ( = ?auto_27704 ?auto_27698 ) ) ( not ( = ?auto_27705 ?auto_27698 ) ) ( not ( = ?auto_27699 ?auto_27698 ) ) ( AVAILABLE ?auto_27710 ) ( IN ?auto_27706 ?auto_27709 ) ( TRUCK-AT ?auto_27709 ?auto_27713 ) )
    :subtasks
    ( ( !DRIVE ?auto_27709 ?auto_27713 ?auto_27703 )
      ( MAKE-2CRATE ?auto_27711 ?auto_27695 ?auto_27696 )
      ( MAKE-1CRATE-VERIFY ?auto_27695 ?auto_27696 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27714 - SURFACE
      ?auto_27715 - SURFACE
      ?auto_27716 - SURFACE
    )
    :vars
    (
      ?auto_27730 - HOIST
      ?auto_27724 - PLACE
      ?auto_27723 - PLACE
      ?auto_27729 - HOIST
      ?auto_27732 - SURFACE
      ?auto_27718 - PLACE
      ?auto_27726 - HOIST
      ?auto_27725 - SURFACE
      ?auto_27731 - SURFACE
      ?auto_27721 - SURFACE
      ?auto_27727 - SURFACE
      ?auto_27728 - PLACE
      ?auto_27720 - HOIST
      ?auto_27719 - SURFACE
      ?auto_27722 - SURFACE
      ?auto_27717 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27730 ?auto_27724 ) ( IS-CRATE ?auto_27716 ) ( not ( = ?auto_27715 ?auto_27716 ) ) ( not ( = ?auto_27714 ?auto_27715 ) ) ( not ( = ?auto_27714 ?auto_27716 ) ) ( not ( = ?auto_27723 ?auto_27724 ) ) ( HOIST-AT ?auto_27729 ?auto_27723 ) ( not ( = ?auto_27730 ?auto_27729 ) ) ( AVAILABLE ?auto_27729 ) ( SURFACE-AT ?auto_27716 ?auto_27723 ) ( ON ?auto_27716 ?auto_27732 ) ( CLEAR ?auto_27716 ) ( not ( = ?auto_27715 ?auto_27732 ) ) ( not ( = ?auto_27716 ?auto_27732 ) ) ( not ( = ?auto_27714 ?auto_27732 ) ) ( IS-CRATE ?auto_27715 ) ( not ( = ?auto_27718 ?auto_27724 ) ) ( not ( = ?auto_27723 ?auto_27718 ) ) ( HOIST-AT ?auto_27726 ?auto_27718 ) ( not ( = ?auto_27730 ?auto_27726 ) ) ( not ( = ?auto_27729 ?auto_27726 ) ) ( SURFACE-AT ?auto_27715 ?auto_27718 ) ( ON ?auto_27715 ?auto_27725 ) ( CLEAR ?auto_27715 ) ( not ( = ?auto_27715 ?auto_27725 ) ) ( not ( = ?auto_27716 ?auto_27725 ) ) ( not ( = ?auto_27714 ?auto_27725 ) ) ( not ( = ?auto_27732 ?auto_27725 ) ) ( IS-CRATE ?auto_27714 ) ( not ( = ?auto_27731 ?auto_27714 ) ) ( not ( = ?auto_27715 ?auto_27731 ) ) ( not ( = ?auto_27716 ?auto_27731 ) ) ( not ( = ?auto_27732 ?auto_27731 ) ) ( not ( = ?auto_27725 ?auto_27731 ) ) ( AVAILABLE ?auto_27726 ) ( SURFACE-AT ?auto_27714 ?auto_27718 ) ( ON ?auto_27714 ?auto_27721 ) ( CLEAR ?auto_27714 ) ( not ( = ?auto_27715 ?auto_27721 ) ) ( not ( = ?auto_27716 ?auto_27721 ) ) ( not ( = ?auto_27714 ?auto_27721 ) ) ( not ( = ?auto_27732 ?auto_27721 ) ) ( not ( = ?auto_27725 ?auto_27721 ) ) ( not ( = ?auto_27731 ?auto_27721 ) ) ( IS-CRATE ?auto_27731 ) ( not ( = ?auto_27727 ?auto_27731 ) ) ( not ( = ?auto_27715 ?auto_27727 ) ) ( not ( = ?auto_27716 ?auto_27727 ) ) ( not ( = ?auto_27714 ?auto_27727 ) ) ( not ( = ?auto_27732 ?auto_27727 ) ) ( not ( = ?auto_27725 ?auto_27727 ) ) ( not ( = ?auto_27721 ?auto_27727 ) ) ( not ( = ?auto_27728 ?auto_27724 ) ) ( not ( = ?auto_27723 ?auto_27728 ) ) ( not ( = ?auto_27718 ?auto_27728 ) ) ( HOIST-AT ?auto_27720 ?auto_27728 ) ( not ( = ?auto_27730 ?auto_27720 ) ) ( not ( = ?auto_27729 ?auto_27720 ) ) ( not ( = ?auto_27726 ?auto_27720 ) ) ( AVAILABLE ?auto_27720 ) ( SURFACE-AT ?auto_27731 ?auto_27728 ) ( ON ?auto_27731 ?auto_27719 ) ( CLEAR ?auto_27731 ) ( not ( = ?auto_27715 ?auto_27719 ) ) ( not ( = ?auto_27716 ?auto_27719 ) ) ( not ( = ?auto_27714 ?auto_27719 ) ) ( not ( = ?auto_27732 ?auto_27719 ) ) ( not ( = ?auto_27725 ?auto_27719 ) ) ( not ( = ?auto_27731 ?auto_27719 ) ) ( not ( = ?auto_27721 ?auto_27719 ) ) ( not ( = ?auto_27727 ?auto_27719 ) ) ( SURFACE-AT ?auto_27722 ?auto_27724 ) ( CLEAR ?auto_27722 ) ( IS-CRATE ?auto_27727 ) ( not ( = ?auto_27722 ?auto_27727 ) ) ( not ( = ?auto_27715 ?auto_27722 ) ) ( not ( = ?auto_27716 ?auto_27722 ) ) ( not ( = ?auto_27714 ?auto_27722 ) ) ( not ( = ?auto_27732 ?auto_27722 ) ) ( not ( = ?auto_27725 ?auto_27722 ) ) ( not ( = ?auto_27731 ?auto_27722 ) ) ( not ( = ?auto_27721 ?auto_27722 ) ) ( not ( = ?auto_27719 ?auto_27722 ) ) ( AVAILABLE ?auto_27730 ) ( IN ?auto_27727 ?auto_27717 ) ( TRUCK-AT ?auto_27717 ?auto_27723 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27715 ?auto_27716 )
      ( MAKE-2CRATE-VERIFY ?auto_27714 ?auto_27715 ?auto_27716 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27733 - SURFACE
      ?auto_27734 - SURFACE
      ?auto_27735 - SURFACE
      ?auto_27736 - SURFACE
    )
    :vars
    (
      ?auto_27740 - HOIST
      ?auto_27738 - PLACE
      ?auto_27744 - PLACE
      ?auto_27741 - HOIST
      ?auto_27743 - SURFACE
      ?auto_27750 - PLACE
      ?auto_27745 - HOIST
      ?auto_27739 - SURFACE
      ?auto_27742 - SURFACE
      ?auto_27746 - SURFACE
      ?auto_27748 - PLACE
      ?auto_27749 - HOIST
      ?auto_27747 - SURFACE
      ?auto_27737 - SURFACE
      ?auto_27751 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27740 ?auto_27738 ) ( IS-CRATE ?auto_27736 ) ( not ( = ?auto_27735 ?auto_27736 ) ) ( not ( = ?auto_27734 ?auto_27735 ) ) ( not ( = ?auto_27734 ?auto_27736 ) ) ( not ( = ?auto_27744 ?auto_27738 ) ) ( HOIST-AT ?auto_27741 ?auto_27744 ) ( not ( = ?auto_27740 ?auto_27741 ) ) ( AVAILABLE ?auto_27741 ) ( SURFACE-AT ?auto_27736 ?auto_27744 ) ( ON ?auto_27736 ?auto_27743 ) ( CLEAR ?auto_27736 ) ( not ( = ?auto_27735 ?auto_27743 ) ) ( not ( = ?auto_27736 ?auto_27743 ) ) ( not ( = ?auto_27734 ?auto_27743 ) ) ( IS-CRATE ?auto_27735 ) ( not ( = ?auto_27750 ?auto_27738 ) ) ( not ( = ?auto_27744 ?auto_27750 ) ) ( HOIST-AT ?auto_27745 ?auto_27750 ) ( not ( = ?auto_27740 ?auto_27745 ) ) ( not ( = ?auto_27741 ?auto_27745 ) ) ( SURFACE-AT ?auto_27735 ?auto_27750 ) ( ON ?auto_27735 ?auto_27739 ) ( CLEAR ?auto_27735 ) ( not ( = ?auto_27735 ?auto_27739 ) ) ( not ( = ?auto_27736 ?auto_27739 ) ) ( not ( = ?auto_27734 ?auto_27739 ) ) ( not ( = ?auto_27743 ?auto_27739 ) ) ( IS-CRATE ?auto_27734 ) ( not ( = ?auto_27733 ?auto_27734 ) ) ( not ( = ?auto_27735 ?auto_27733 ) ) ( not ( = ?auto_27736 ?auto_27733 ) ) ( not ( = ?auto_27743 ?auto_27733 ) ) ( not ( = ?auto_27739 ?auto_27733 ) ) ( AVAILABLE ?auto_27745 ) ( SURFACE-AT ?auto_27734 ?auto_27750 ) ( ON ?auto_27734 ?auto_27742 ) ( CLEAR ?auto_27734 ) ( not ( = ?auto_27735 ?auto_27742 ) ) ( not ( = ?auto_27736 ?auto_27742 ) ) ( not ( = ?auto_27734 ?auto_27742 ) ) ( not ( = ?auto_27743 ?auto_27742 ) ) ( not ( = ?auto_27739 ?auto_27742 ) ) ( not ( = ?auto_27733 ?auto_27742 ) ) ( IS-CRATE ?auto_27733 ) ( not ( = ?auto_27746 ?auto_27733 ) ) ( not ( = ?auto_27735 ?auto_27746 ) ) ( not ( = ?auto_27736 ?auto_27746 ) ) ( not ( = ?auto_27734 ?auto_27746 ) ) ( not ( = ?auto_27743 ?auto_27746 ) ) ( not ( = ?auto_27739 ?auto_27746 ) ) ( not ( = ?auto_27742 ?auto_27746 ) ) ( not ( = ?auto_27748 ?auto_27738 ) ) ( not ( = ?auto_27744 ?auto_27748 ) ) ( not ( = ?auto_27750 ?auto_27748 ) ) ( HOIST-AT ?auto_27749 ?auto_27748 ) ( not ( = ?auto_27740 ?auto_27749 ) ) ( not ( = ?auto_27741 ?auto_27749 ) ) ( not ( = ?auto_27745 ?auto_27749 ) ) ( AVAILABLE ?auto_27749 ) ( SURFACE-AT ?auto_27733 ?auto_27748 ) ( ON ?auto_27733 ?auto_27747 ) ( CLEAR ?auto_27733 ) ( not ( = ?auto_27735 ?auto_27747 ) ) ( not ( = ?auto_27736 ?auto_27747 ) ) ( not ( = ?auto_27734 ?auto_27747 ) ) ( not ( = ?auto_27743 ?auto_27747 ) ) ( not ( = ?auto_27739 ?auto_27747 ) ) ( not ( = ?auto_27733 ?auto_27747 ) ) ( not ( = ?auto_27742 ?auto_27747 ) ) ( not ( = ?auto_27746 ?auto_27747 ) ) ( SURFACE-AT ?auto_27737 ?auto_27738 ) ( CLEAR ?auto_27737 ) ( IS-CRATE ?auto_27746 ) ( not ( = ?auto_27737 ?auto_27746 ) ) ( not ( = ?auto_27735 ?auto_27737 ) ) ( not ( = ?auto_27736 ?auto_27737 ) ) ( not ( = ?auto_27734 ?auto_27737 ) ) ( not ( = ?auto_27743 ?auto_27737 ) ) ( not ( = ?auto_27739 ?auto_27737 ) ) ( not ( = ?auto_27733 ?auto_27737 ) ) ( not ( = ?auto_27742 ?auto_27737 ) ) ( not ( = ?auto_27747 ?auto_27737 ) ) ( AVAILABLE ?auto_27740 ) ( IN ?auto_27746 ?auto_27751 ) ( TRUCK-AT ?auto_27751 ?auto_27744 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27734 ?auto_27735 ?auto_27736 )
      ( MAKE-3CRATE-VERIFY ?auto_27733 ?auto_27734 ?auto_27735 ?auto_27736 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27752 - SURFACE
      ?auto_27753 - SURFACE
      ?auto_27754 - SURFACE
      ?auto_27755 - SURFACE
      ?auto_27756 - SURFACE
    )
    :vars
    (
      ?auto_27760 - HOIST
      ?auto_27758 - PLACE
      ?auto_27764 - PLACE
      ?auto_27761 - HOIST
      ?auto_27763 - SURFACE
      ?auto_27769 - PLACE
      ?auto_27765 - HOIST
      ?auto_27759 - SURFACE
      ?auto_27762 - SURFACE
      ?auto_27767 - PLACE
      ?auto_27768 - HOIST
      ?auto_27766 - SURFACE
      ?auto_27757 - SURFACE
      ?auto_27770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27760 ?auto_27758 ) ( IS-CRATE ?auto_27756 ) ( not ( = ?auto_27755 ?auto_27756 ) ) ( not ( = ?auto_27754 ?auto_27755 ) ) ( not ( = ?auto_27754 ?auto_27756 ) ) ( not ( = ?auto_27764 ?auto_27758 ) ) ( HOIST-AT ?auto_27761 ?auto_27764 ) ( not ( = ?auto_27760 ?auto_27761 ) ) ( AVAILABLE ?auto_27761 ) ( SURFACE-AT ?auto_27756 ?auto_27764 ) ( ON ?auto_27756 ?auto_27763 ) ( CLEAR ?auto_27756 ) ( not ( = ?auto_27755 ?auto_27763 ) ) ( not ( = ?auto_27756 ?auto_27763 ) ) ( not ( = ?auto_27754 ?auto_27763 ) ) ( IS-CRATE ?auto_27755 ) ( not ( = ?auto_27769 ?auto_27758 ) ) ( not ( = ?auto_27764 ?auto_27769 ) ) ( HOIST-AT ?auto_27765 ?auto_27769 ) ( not ( = ?auto_27760 ?auto_27765 ) ) ( not ( = ?auto_27761 ?auto_27765 ) ) ( SURFACE-AT ?auto_27755 ?auto_27769 ) ( ON ?auto_27755 ?auto_27759 ) ( CLEAR ?auto_27755 ) ( not ( = ?auto_27755 ?auto_27759 ) ) ( not ( = ?auto_27756 ?auto_27759 ) ) ( not ( = ?auto_27754 ?auto_27759 ) ) ( not ( = ?auto_27763 ?auto_27759 ) ) ( IS-CRATE ?auto_27754 ) ( not ( = ?auto_27753 ?auto_27754 ) ) ( not ( = ?auto_27755 ?auto_27753 ) ) ( not ( = ?auto_27756 ?auto_27753 ) ) ( not ( = ?auto_27763 ?auto_27753 ) ) ( not ( = ?auto_27759 ?auto_27753 ) ) ( AVAILABLE ?auto_27765 ) ( SURFACE-AT ?auto_27754 ?auto_27769 ) ( ON ?auto_27754 ?auto_27762 ) ( CLEAR ?auto_27754 ) ( not ( = ?auto_27755 ?auto_27762 ) ) ( not ( = ?auto_27756 ?auto_27762 ) ) ( not ( = ?auto_27754 ?auto_27762 ) ) ( not ( = ?auto_27763 ?auto_27762 ) ) ( not ( = ?auto_27759 ?auto_27762 ) ) ( not ( = ?auto_27753 ?auto_27762 ) ) ( IS-CRATE ?auto_27753 ) ( not ( = ?auto_27752 ?auto_27753 ) ) ( not ( = ?auto_27755 ?auto_27752 ) ) ( not ( = ?auto_27756 ?auto_27752 ) ) ( not ( = ?auto_27754 ?auto_27752 ) ) ( not ( = ?auto_27763 ?auto_27752 ) ) ( not ( = ?auto_27759 ?auto_27752 ) ) ( not ( = ?auto_27762 ?auto_27752 ) ) ( not ( = ?auto_27767 ?auto_27758 ) ) ( not ( = ?auto_27764 ?auto_27767 ) ) ( not ( = ?auto_27769 ?auto_27767 ) ) ( HOIST-AT ?auto_27768 ?auto_27767 ) ( not ( = ?auto_27760 ?auto_27768 ) ) ( not ( = ?auto_27761 ?auto_27768 ) ) ( not ( = ?auto_27765 ?auto_27768 ) ) ( AVAILABLE ?auto_27768 ) ( SURFACE-AT ?auto_27753 ?auto_27767 ) ( ON ?auto_27753 ?auto_27766 ) ( CLEAR ?auto_27753 ) ( not ( = ?auto_27755 ?auto_27766 ) ) ( not ( = ?auto_27756 ?auto_27766 ) ) ( not ( = ?auto_27754 ?auto_27766 ) ) ( not ( = ?auto_27763 ?auto_27766 ) ) ( not ( = ?auto_27759 ?auto_27766 ) ) ( not ( = ?auto_27753 ?auto_27766 ) ) ( not ( = ?auto_27762 ?auto_27766 ) ) ( not ( = ?auto_27752 ?auto_27766 ) ) ( SURFACE-AT ?auto_27757 ?auto_27758 ) ( CLEAR ?auto_27757 ) ( IS-CRATE ?auto_27752 ) ( not ( = ?auto_27757 ?auto_27752 ) ) ( not ( = ?auto_27755 ?auto_27757 ) ) ( not ( = ?auto_27756 ?auto_27757 ) ) ( not ( = ?auto_27754 ?auto_27757 ) ) ( not ( = ?auto_27763 ?auto_27757 ) ) ( not ( = ?auto_27759 ?auto_27757 ) ) ( not ( = ?auto_27753 ?auto_27757 ) ) ( not ( = ?auto_27762 ?auto_27757 ) ) ( not ( = ?auto_27766 ?auto_27757 ) ) ( AVAILABLE ?auto_27760 ) ( IN ?auto_27752 ?auto_27770 ) ( TRUCK-AT ?auto_27770 ?auto_27764 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27754 ?auto_27755 ?auto_27756 )
      ( MAKE-4CRATE-VERIFY ?auto_27752 ?auto_27753 ?auto_27754 ?auto_27755 ?auto_27756 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27771 - SURFACE
      ?auto_27772 - SURFACE
      ?auto_27773 - SURFACE
      ?auto_27774 - SURFACE
      ?auto_27775 - SURFACE
      ?auto_27776 - SURFACE
    )
    :vars
    (
      ?auto_27779 - HOIST
      ?auto_27777 - PLACE
      ?auto_27783 - PLACE
      ?auto_27780 - HOIST
      ?auto_27782 - SURFACE
      ?auto_27788 - PLACE
      ?auto_27784 - HOIST
      ?auto_27778 - SURFACE
      ?auto_27781 - SURFACE
      ?auto_27786 - PLACE
      ?auto_27787 - HOIST
      ?auto_27785 - SURFACE
      ?auto_27789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27779 ?auto_27777 ) ( IS-CRATE ?auto_27776 ) ( not ( = ?auto_27775 ?auto_27776 ) ) ( not ( = ?auto_27774 ?auto_27775 ) ) ( not ( = ?auto_27774 ?auto_27776 ) ) ( not ( = ?auto_27783 ?auto_27777 ) ) ( HOIST-AT ?auto_27780 ?auto_27783 ) ( not ( = ?auto_27779 ?auto_27780 ) ) ( AVAILABLE ?auto_27780 ) ( SURFACE-AT ?auto_27776 ?auto_27783 ) ( ON ?auto_27776 ?auto_27782 ) ( CLEAR ?auto_27776 ) ( not ( = ?auto_27775 ?auto_27782 ) ) ( not ( = ?auto_27776 ?auto_27782 ) ) ( not ( = ?auto_27774 ?auto_27782 ) ) ( IS-CRATE ?auto_27775 ) ( not ( = ?auto_27788 ?auto_27777 ) ) ( not ( = ?auto_27783 ?auto_27788 ) ) ( HOIST-AT ?auto_27784 ?auto_27788 ) ( not ( = ?auto_27779 ?auto_27784 ) ) ( not ( = ?auto_27780 ?auto_27784 ) ) ( SURFACE-AT ?auto_27775 ?auto_27788 ) ( ON ?auto_27775 ?auto_27778 ) ( CLEAR ?auto_27775 ) ( not ( = ?auto_27775 ?auto_27778 ) ) ( not ( = ?auto_27776 ?auto_27778 ) ) ( not ( = ?auto_27774 ?auto_27778 ) ) ( not ( = ?auto_27782 ?auto_27778 ) ) ( IS-CRATE ?auto_27774 ) ( not ( = ?auto_27773 ?auto_27774 ) ) ( not ( = ?auto_27775 ?auto_27773 ) ) ( not ( = ?auto_27776 ?auto_27773 ) ) ( not ( = ?auto_27782 ?auto_27773 ) ) ( not ( = ?auto_27778 ?auto_27773 ) ) ( AVAILABLE ?auto_27784 ) ( SURFACE-AT ?auto_27774 ?auto_27788 ) ( ON ?auto_27774 ?auto_27781 ) ( CLEAR ?auto_27774 ) ( not ( = ?auto_27775 ?auto_27781 ) ) ( not ( = ?auto_27776 ?auto_27781 ) ) ( not ( = ?auto_27774 ?auto_27781 ) ) ( not ( = ?auto_27782 ?auto_27781 ) ) ( not ( = ?auto_27778 ?auto_27781 ) ) ( not ( = ?auto_27773 ?auto_27781 ) ) ( IS-CRATE ?auto_27773 ) ( not ( = ?auto_27772 ?auto_27773 ) ) ( not ( = ?auto_27775 ?auto_27772 ) ) ( not ( = ?auto_27776 ?auto_27772 ) ) ( not ( = ?auto_27774 ?auto_27772 ) ) ( not ( = ?auto_27782 ?auto_27772 ) ) ( not ( = ?auto_27778 ?auto_27772 ) ) ( not ( = ?auto_27781 ?auto_27772 ) ) ( not ( = ?auto_27786 ?auto_27777 ) ) ( not ( = ?auto_27783 ?auto_27786 ) ) ( not ( = ?auto_27788 ?auto_27786 ) ) ( HOIST-AT ?auto_27787 ?auto_27786 ) ( not ( = ?auto_27779 ?auto_27787 ) ) ( not ( = ?auto_27780 ?auto_27787 ) ) ( not ( = ?auto_27784 ?auto_27787 ) ) ( AVAILABLE ?auto_27787 ) ( SURFACE-AT ?auto_27773 ?auto_27786 ) ( ON ?auto_27773 ?auto_27785 ) ( CLEAR ?auto_27773 ) ( not ( = ?auto_27775 ?auto_27785 ) ) ( not ( = ?auto_27776 ?auto_27785 ) ) ( not ( = ?auto_27774 ?auto_27785 ) ) ( not ( = ?auto_27782 ?auto_27785 ) ) ( not ( = ?auto_27778 ?auto_27785 ) ) ( not ( = ?auto_27773 ?auto_27785 ) ) ( not ( = ?auto_27781 ?auto_27785 ) ) ( not ( = ?auto_27772 ?auto_27785 ) ) ( SURFACE-AT ?auto_27771 ?auto_27777 ) ( CLEAR ?auto_27771 ) ( IS-CRATE ?auto_27772 ) ( not ( = ?auto_27771 ?auto_27772 ) ) ( not ( = ?auto_27775 ?auto_27771 ) ) ( not ( = ?auto_27776 ?auto_27771 ) ) ( not ( = ?auto_27774 ?auto_27771 ) ) ( not ( = ?auto_27782 ?auto_27771 ) ) ( not ( = ?auto_27778 ?auto_27771 ) ) ( not ( = ?auto_27773 ?auto_27771 ) ) ( not ( = ?auto_27781 ?auto_27771 ) ) ( not ( = ?auto_27785 ?auto_27771 ) ) ( AVAILABLE ?auto_27779 ) ( IN ?auto_27772 ?auto_27789 ) ( TRUCK-AT ?auto_27789 ?auto_27783 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27774 ?auto_27775 ?auto_27776 )
      ( MAKE-5CRATE-VERIFY ?auto_27771 ?auto_27772 ?auto_27773 ?auto_27774 ?auto_27775 ?auto_27776 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27790 - SURFACE
      ?auto_27791 - SURFACE
    )
    :vars
    (
      ?auto_27795 - HOIST
      ?auto_27793 - PLACE
      ?auto_27808 - SURFACE
      ?auto_27800 - PLACE
      ?auto_27796 - HOIST
      ?auto_27799 - SURFACE
      ?auto_27806 - PLACE
      ?auto_27801 - HOIST
      ?auto_27794 - SURFACE
      ?auto_27798 - SURFACE
      ?auto_27797 - SURFACE
      ?auto_27802 - SURFACE
      ?auto_27804 - PLACE
      ?auto_27805 - HOIST
      ?auto_27803 - SURFACE
      ?auto_27792 - SURFACE
      ?auto_27807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27795 ?auto_27793 ) ( IS-CRATE ?auto_27791 ) ( not ( = ?auto_27790 ?auto_27791 ) ) ( not ( = ?auto_27808 ?auto_27790 ) ) ( not ( = ?auto_27808 ?auto_27791 ) ) ( not ( = ?auto_27800 ?auto_27793 ) ) ( HOIST-AT ?auto_27796 ?auto_27800 ) ( not ( = ?auto_27795 ?auto_27796 ) ) ( SURFACE-AT ?auto_27791 ?auto_27800 ) ( ON ?auto_27791 ?auto_27799 ) ( CLEAR ?auto_27791 ) ( not ( = ?auto_27790 ?auto_27799 ) ) ( not ( = ?auto_27791 ?auto_27799 ) ) ( not ( = ?auto_27808 ?auto_27799 ) ) ( IS-CRATE ?auto_27790 ) ( not ( = ?auto_27806 ?auto_27793 ) ) ( not ( = ?auto_27800 ?auto_27806 ) ) ( HOIST-AT ?auto_27801 ?auto_27806 ) ( not ( = ?auto_27795 ?auto_27801 ) ) ( not ( = ?auto_27796 ?auto_27801 ) ) ( SURFACE-AT ?auto_27790 ?auto_27806 ) ( ON ?auto_27790 ?auto_27794 ) ( CLEAR ?auto_27790 ) ( not ( = ?auto_27790 ?auto_27794 ) ) ( not ( = ?auto_27791 ?auto_27794 ) ) ( not ( = ?auto_27808 ?auto_27794 ) ) ( not ( = ?auto_27799 ?auto_27794 ) ) ( IS-CRATE ?auto_27808 ) ( not ( = ?auto_27798 ?auto_27808 ) ) ( not ( = ?auto_27790 ?auto_27798 ) ) ( not ( = ?auto_27791 ?auto_27798 ) ) ( not ( = ?auto_27799 ?auto_27798 ) ) ( not ( = ?auto_27794 ?auto_27798 ) ) ( AVAILABLE ?auto_27801 ) ( SURFACE-AT ?auto_27808 ?auto_27806 ) ( ON ?auto_27808 ?auto_27797 ) ( CLEAR ?auto_27808 ) ( not ( = ?auto_27790 ?auto_27797 ) ) ( not ( = ?auto_27791 ?auto_27797 ) ) ( not ( = ?auto_27808 ?auto_27797 ) ) ( not ( = ?auto_27799 ?auto_27797 ) ) ( not ( = ?auto_27794 ?auto_27797 ) ) ( not ( = ?auto_27798 ?auto_27797 ) ) ( IS-CRATE ?auto_27798 ) ( not ( = ?auto_27802 ?auto_27798 ) ) ( not ( = ?auto_27790 ?auto_27802 ) ) ( not ( = ?auto_27791 ?auto_27802 ) ) ( not ( = ?auto_27808 ?auto_27802 ) ) ( not ( = ?auto_27799 ?auto_27802 ) ) ( not ( = ?auto_27794 ?auto_27802 ) ) ( not ( = ?auto_27797 ?auto_27802 ) ) ( not ( = ?auto_27804 ?auto_27793 ) ) ( not ( = ?auto_27800 ?auto_27804 ) ) ( not ( = ?auto_27806 ?auto_27804 ) ) ( HOIST-AT ?auto_27805 ?auto_27804 ) ( not ( = ?auto_27795 ?auto_27805 ) ) ( not ( = ?auto_27796 ?auto_27805 ) ) ( not ( = ?auto_27801 ?auto_27805 ) ) ( AVAILABLE ?auto_27805 ) ( SURFACE-AT ?auto_27798 ?auto_27804 ) ( ON ?auto_27798 ?auto_27803 ) ( CLEAR ?auto_27798 ) ( not ( = ?auto_27790 ?auto_27803 ) ) ( not ( = ?auto_27791 ?auto_27803 ) ) ( not ( = ?auto_27808 ?auto_27803 ) ) ( not ( = ?auto_27799 ?auto_27803 ) ) ( not ( = ?auto_27794 ?auto_27803 ) ) ( not ( = ?auto_27798 ?auto_27803 ) ) ( not ( = ?auto_27797 ?auto_27803 ) ) ( not ( = ?auto_27802 ?auto_27803 ) ) ( SURFACE-AT ?auto_27792 ?auto_27793 ) ( CLEAR ?auto_27792 ) ( IS-CRATE ?auto_27802 ) ( not ( = ?auto_27792 ?auto_27802 ) ) ( not ( = ?auto_27790 ?auto_27792 ) ) ( not ( = ?auto_27791 ?auto_27792 ) ) ( not ( = ?auto_27808 ?auto_27792 ) ) ( not ( = ?auto_27799 ?auto_27792 ) ) ( not ( = ?auto_27794 ?auto_27792 ) ) ( not ( = ?auto_27798 ?auto_27792 ) ) ( not ( = ?auto_27797 ?auto_27792 ) ) ( not ( = ?auto_27803 ?auto_27792 ) ) ( AVAILABLE ?auto_27795 ) ( TRUCK-AT ?auto_27807 ?auto_27800 ) ( LIFTING ?auto_27796 ?auto_27802 ) )
    :subtasks
    ( ( !LOAD ?auto_27796 ?auto_27802 ?auto_27807 ?auto_27800 )
      ( MAKE-2CRATE ?auto_27808 ?auto_27790 ?auto_27791 )
      ( MAKE-1CRATE-VERIFY ?auto_27790 ?auto_27791 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27809 - SURFACE
      ?auto_27810 - SURFACE
      ?auto_27811 - SURFACE
    )
    :vars
    (
      ?auto_27817 - HOIST
      ?auto_27822 - PLACE
      ?auto_27825 - PLACE
      ?auto_27826 - HOIST
      ?auto_27820 - SURFACE
      ?auto_27819 - PLACE
      ?auto_27812 - HOIST
      ?auto_27815 - SURFACE
      ?auto_27823 - SURFACE
      ?auto_27827 - SURFACE
      ?auto_27814 - SURFACE
      ?auto_27818 - PLACE
      ?auto_27816 - HOIST
      ?auto_27813 - SURFACE
      ?auto_27821 - SURFACE
      ?auto_27824 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27817 ?auto_27822 ) ( IS-CRATE ?auto_27811 ) ( not ( = ?auto_27810 ?auto_27811 ) ) ( not ( = ?auto_27809 ?auto_27810 ) ) ( not ( = ?auto_27809 ?auto_27811 ) ) ( not ( = ?auto_27825 ?auto_27822 ) ) ( HOIST-AT ?auto_27826 ?auto_27825 ) ( not ( = ?auto_27817 ?auto_27826 ) ) ( SURFACE-AT ?auto_27811 ?auto_27825 ) ( ON ?auto_27811 ?auto_27820 ) ( CLEAR ?auto_27811 ) ( not ( = ?auto_27810 ?auto_27820 ) ) ( not ( = ?auto_27811 ?auto_27820 ) ) ( not ( = ?auto_27809 ?auto_27820 ) ) ( IS-CRATE ?auto_27810 ) ( not ( = ?auto_27819 ?auto_27822 ) ) ( not ( = ?auto_27825 ?auto_27819 ) ) ( HOIST-AT ?auto_27812 ?auto_27819 ) ( not ( = ?auto_27817 ?auto_27812 ) ) ( not ( = ?auto_27826 ?auto_27812 ) ) ( SURFACE-AT ?auto_27810 ?auto_27819 ) ( ON ?auto_27810 ?auto_27815 ) ( CLEAR ?auto_27810 ) ( not ( = ?auto_27810 ?auto_27815 ) ) ( not ( = ?auto_27811 ?auto_27815 ) ) ( not ( = ?auto_27809 ?auto_27815 ) ) ( not ( = ?auto_27820 ?auto_27815 ) ) ( IS-CRATE ?auto_27809 ) ( not ( = ?auto_27823 ?auto_27809 ) ) ( not ( = ?auto_27810 ?auto_27823 ) ) ( not ( = ?auto_27811 ?auto_27823 ) ) ( not ( = ?auto_27820 ?auto_27823 ) ) ( not ( = ?auto_27815 ?auto_27823 ) ) ( AVAILABLE ?auto_27812 ) ( SURFACE-AT ?auto_27809 ?auto_27819 ) ( ON ?auto_27809 ?auto_27827 ) ( CLEAR ?auto_27809 ) ( not ( = ?auto_27810 ?auto_27827 ) ) ( not ( = ?auto_27811 ?auto_27827 ) ) ( not ( = ?auto_27809 ?auto_27827 ) ) ( not ( = ?auto_27820 ?auto_27827 ) ) ( not ( = ?auto_27815 ?auto_27827 ) ) ( not ( = ?auto_27823 ?auto_27827 ) ) ( IS-CRATE ?auto_27823 ) ( not ( = ?auto_27814 ?auto_27823 ) ) ( not ( = ?auto_27810 ?auto_27814 ) ) ( not ( = ?auto_27811 ?auto_27814 ) ) ( not ( = ?auto_27809 ?auto_27814 ) ) ( not ( = ?auto_27820 ?auto_27814 ) ) ( not ( = ?auto_27815 ?auto_27814 ) ) ( not ( = ?auto_27827 ?auto_27814 ) ) ( not ( = ?auto_27818 ?auto_27822 ) ) ( not ( = ?auto_27825 ?auto_27818 ) ) ( not ( = ?auto_27819 ?auto_27818 ) ) ( HOIST-AT ?auto_27816 ?auto_27818 ) ( not ( = ?auto_27817 ?auto_27816 ) ) ( not ( = ?auto_27826 ?auto_27816 ) ) ( not ( = ?auto_27812 ?auto_27816 ) ) ( AVAILABLE ?auto_27816 ) ( SURFACE-AT ?auto_27823 ?auto_27818 ) ( ON ?auto_27823 ?auto_27813 ) ( CLEAR ?auto_27823 ) ( not ( = ?auto_27810 ?auto_27813 ) ) ( not ( = ?auto_27811 ?auto_27813 ) ) ( not ( = ?auto_27809 ?auto_27813 ) ) ( not ( = ?auto_27820 ?auto_27813 ) ) ( not ( = ?auto_27815 ?auto_27813 ) ) ( not ( = ?auto_27823 ?auto_27813 ) ) ( not ( = ?auto_27827 ?auto_27813 ) ) ( not ( = ?auto_27814 ?auto_27813 ) ) ( SURFACE-AT ?auto_27821 ?auto_27822 ) ( CLEAR ?auto_27821 ) ( IS-CRATE ?auto_27814 ) ( not ( = ?auto_27821 ?auto_27814 ) ) ( not ( = ?auto_27810 ?auto_27821 ) ) ( not ( = ?auto_27811 ?auto_27821 ) ) ( not ( = ?auto_27809 ?auto_27821 ) ) ( not ( = ?auto_27820 ?auto_27821 ) ) ( not ( = ?auto_27815 ?auto_27821 ) ) ( not ( = ?auto_27823 ?auto_27821 ) ) ( not ( = ?auto_27827 ?auto_27821 ) ) ( not ( = ?auto_27813 ?auto_27821 ) ) ( AVAILABLE ?auto_27817 ) ( TRUCK-AT ?auto_27824 ?auto_27825 ) ( LIFTING ?auto_27826 ?auto_27814 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27810 ?auto_27811 )
      ( MAKE-2CRATE-VERIFY ?auto_27809 ?auto_27810 ?auto_27811 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27828 - SURFACE
      ?auto_27829 - SURFACE
      ?auto_27830 - SURFACE
      ?auto_27831 - SURFACE
    )
    :vars
    (
      ?auto_27845 - HOIST
      ?auto_27833 - PLACE
      ?auto_27842 - PLACE
      ?auto_27844 - HOIST
      ?auto_27841 - SURFACE
      ?auto_27837 - PLACE
      ?auto_27843 - HOIST
      ?auto_27839 - SURFACE
      ?auto_27838 - SURFACE
      ?auto_27834 - SURFACE
      ?auto_27836 - PLACE
      ?auto_27840 - HOIST
      ?auto_27832 - SURFACE
      ?auto_27835 - SURFACE
      ?auto_27846 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27845 ?auto_27833 ) ( IS-CRATE ?auto_27831 ) ( not ( = ?auto_27830 ?auto_27831 ) ) ( not ( = ?auto_27829 ?auto_27830 ) ) ( not ( = ?auto_27829 ?auto_27831 ) ) ( not ( = ?auto_27842 ?auto_27833 ) ) ( HOIST-AT ?auto_27844 ?auto_27842 ) ( not ( = ?auto_27845 ?auto_27844 ) ) ( SURFACE-AT ?auto_27831 ?auto_27842 ) ( ON ?auto_27831 ?auto_27841 ) ( CLEAR ?auto_27831 ) ( not ( = ?auto_27830 ?auto_27841 ) ) ( not ( = ?auto_27831 ?auto_27841 ) ) ( not ( = ?auto_27829 ?auto_27841 ) ) ( IS-CRATE ?auto_27830 ) ( not ( = ?auto_27837 ?auto_27833 ) ) ( not ( = ?auto_27842 ?auto_27837 ) ) ( HOIST-AT ?auto_27843 ?auto_27837 ) ( not ( = ?auto_27845 ?auto_27843 ) ) ( not ( = ?auto_27844 ?auto_27843 ) ) ( SURFACE-AT ?auto_27830 ?auto_27837 ) ( ON ?auto_27830 ?auto_27839 ) ( CLEAR ?auto_27830 ) ( not ( = ?auto_27830 ?auto_27839 ) ) ( not ( = ?auto_27831 ?auto_27839 ) ) ( not ( = ?auto_27829 ?auto_27839 ) ) ( not ( = ?auto_27841 ?auto_27839 ) ) ( IS-CRATE ?auto_27829 ) ( not ( = ?auto_27828 ?auto_27829 ) ) ( not ( = ?auto_27830 ?auto_27828 ) ) ( not ( = ?auto_27831 ?auto_27828 ) ) ( not ( = ?auto_27841 ?auto_27828 ) ) ( not ( = ?auto_27839 ?auto_27828 ) ) ( AVAILABLE ?auto_27843 ) ( SURFACE-AT ?auto_27829 ?auto_27837 ) ( ON ?auto_27829 ?auto_27838 ) ( CLEAR ?auto_27829 ) ( not ( = ?auto_27830 ?auto_27838 ) ) ( not ( = ?auto_27831 ?auto_27838 ) ) ( not ( = ?auto_27829 ?auto_27838 ) ) ( not ( = ?auto_27841 ?auto_27838 ) ) ( not ( = ?auto_27839 ?auto_27838 ) ) ( not ( = ?auto_27828 ?auto_27838 ) ) ( IS-CRATE ?auto_27828 ) ( not ( = ?auto_27834 ?auto_27828 ) ) ( not ( = ?auto_27830 ?auto_27834 ) ) ( not ( = ?auto_27831 ?auto_27834 ) ) ( not ( = ?auto_27829 ?auto_27834 ) ) ( not ( = ?auto_27841 ?auto_27834 ) ) ( not ( = ?auto_27839 ?auto_27834 ) ) ( not ( = ?auto_27838 ?auto_27834 ) ) ( not ( = ?auto_27836 ?auto_27833 ) ) ( not ( = ?auto_27842 ?auto_27836 ) ) ( not ( = ?auto_27837 ?auto_27836 ) ) ( HOIST-AT ?auto_27840 ?auto_27836 ) ( not ( = ?auto_27845 ?auto_27840 ) ) ( not ( = ?auto_27844 ?auto_27840 ) ) ( not ( = ?auto_27843 ?auto_27840 ) ) ( AVAILABLE ?auto_27840 ) ( SURFACE-AT ?auto_27828 ?auto_27836 ) ( ON ?auto_27828 ?auto_27832 ) ( CLEAR ?auto_27828 ) ( not ( = ?auto_27830 ?auto_27832 ) ) ( not ( = ?auto_27831 ?auto_27832 ) ) ( not ( = ?auto_27829 ?auto_27832 ) ) ( not ( = ?auto_27841 ?auto_27832 ) ) ( not ( = ?auto_27839 ?auto_27832 ) ) ( not ( = ?auto_27828 ?auto_27832 ) ) ( not ( = ?auto_27838 ?auto_27832 ) ) ( not ( = ?auto_27834 ?auto_27832 ) ) ( SURFACE-AT ?auto_27835 ?auto_27833 ) ( CLEAR ?auto_27835 ) ( IS-CRATE ?auto_27834 ) ( not ( = ?auto_27835 ?auto_27834 ) ) ( not ( = ?auto_27830 ?auto_27835 ) ) ( not ( = ?auto_27831 ?auto_27835 ) ) ( not ( = ?auto_27829 ?auto_27835 ) ) ( not ( = ?auto_27841 ?auto_27835 ) ) ( not ( = ?auto_27839 ?auto_27835 ) ) ( not ( = ?auto_27828 ?auto_27835 ) ) ( not ( = ?auto_27838 ?auto_27835 ) ) ( not ( = ?auto_27832 ?auto_27835 ) ) ( AVAILABLE ?auto_27845 ) ( TRUCK-AT ?auto_27846 ?auto_27842 ) ( LIFTING ?auto_27844 ?auto_27834 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27829 ?auto_27830 ?auto_27831 )
      ( MAKE-3CRATE-VERIFY ?auto_27828 ?auto_27829 ?auto_27830 ?auto_27831 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27847 - SURFACE
      ?auto_27848 - SURFACE
      ?auto_27849 - SURFACE
      ?auto_27850 - SURFACE
      ?auto_27851 - SURFACE
    )
    :vars
    (
      ?auto_27864 - HOIST
      ?auto_27853 - PLACE
      ?auto_27861 - PLACE
      ?auto_27863 - HOIST
      ?auto_27860 - SURFACE
      ?auto_27856 - PLACE
      ?auto_27862 - HOIST
      ?auto_27858 - SURFACE
      ?auto_27857 - SURFACE
      ?auto_27855 - PLACE
      ?auto_27859 - HOIST
      ?auto_27852 - SURFACE
      ?auto_27854 - SURFACE
      ?auto_27865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27864 ?auto_27853 ) ( IS-CRATE ?auto_27851 ) ( not ( = ?auto_27850 ?auto_27851 ) ) ( not ( = ?auto_27849 ?auto_27850 ) ) ( not ( = ?auto_27849 ?auto_27851 ) ) ( not ( = ?auto_27861 ?auto_27853 ) ) ( HOIST-AT ?auto_27863 ?auto_27861 ) ( not ( = ?auto_27864 ?auto_27863 ) ) ( SURFACE-AT ?auto_27851 ?auto_27861 ) ( ON ?auto_27851 ?auto_27860 ) ( CLEAR ?auto_27851 ) ( not ( = ?auto_27850 ?auto_27860 ) ) ( not ( = ?auto_27851 ?auto_27860 ) ) ( not ( = ?auto_27849 ?auto_27860 ) ) ( IS-CRATE ?auto_27850 ) ( not ( = ?auto_27856 ?auto_27853 ) ) ( not ( = ?auto_27861 ?auto_27856 ) ) ( HOIST-AT ?auto_27862 ?auto_27856 ) ( not ( = ?auto_27864 ?auto_27862 ) ) ( not ( = ?auto_27863 ?auto_27862 ) ) ( SURFACE-AT ?auto_27850 ?auto_27856 ) ( ON ?auto_27850 ?auto_27858 ) ( CLEAR ?auto_27850 ) ( not ( = ?auto_27850 ?auto_27858 ) ) ( not ( = ?auto_27851 ?auto_27858 ) ) ( not ( = ?auto_27849 ?auto_27858 ) ) ( not ( = ?auto_27860 ?auto_27858 ) ) ( IS-CRATE ?auto_27849 ) ( not ( = ?auto_27848 ?auto_27849 ) ) ( not ( = ?auto_27850 ?auto_27848 ) ) ( not ( = ?auto_27851 ?auto_27848 ) ) ( not ( = ?auto_27860 ?auto_27848 ) ) ( not ( = ?auto_27858 ?auto_27848 ) ) ( AVAILABLE ?auto_27862 ) ( SURFACE-AT ?auto_27849 ?auto_27856 ) ( ON ?auto_27849 ?auto_27857 ) ( CLEAR ?auto_27849 ) ( not ( = ?auto_27850 ?auto_27857 ) ) ( not ( = ?auto_27851 ?auto_27857 ) ) ( not ( = ?auto_27849 ?auto_27857 ) ) ( not ( = ?auto_27860 ?auto_27857 ) ) ( not ( = ?auto_27858 ?auto_27857 ) ) ( not ( = ?auto_27848 ?auto_27857 ) ) ( IS-CRATE ?auto_27848 ) ( not ( = ?auto_27847 ?auto_27848 ) ) ( not ( = ?auto_27850 ?auto_27847 ) ) ( not ( = ?auto_27851 ?auto_27847 ) ) ( not ( = ?auto_27849 ?auto_27847 ) ) ( not ( = ?auto_27860 ?auto_27847 ) ) ( not ( = ?auto_27858 ?auto_27847 ) ) ( not ( = ?auto_27857 ?auto_27847 ) ) ( not ( = ?auto_27855 ?auto_27853 ) ) ( not ( = ?auto_27861 ?auto_27855 ) ) ( not ( = ?auto_27856 ?auto_27855 ) ) ( HOIST-AT ?auto_27859 ?auto_27855 ) ( not ( = ?auto_27864 ?auto_27859 ) ) ( not ( = ?auto_27863 ?auto_27859 ) ) ( not ( = ?auto_27862 ?auto_27859 ) ) ( AVAILABLE ?auto_27859 ) ( SURFACE-AT ?auto_27848 ?auto_27855 ) ( ON ?auto_27848 ?auto_27852 ) ( CLEAR ?auto_27848 ) ( not ( = ?auto_27850 ?auto_27852 ) ) ( not ( = ?auto_27851 ?auto_27852 ) ) ( not ( = ?auto_27849 ?auto_27852 ) ) ( not ( = ?auto_27860 ?auto_27852 ) ) ( not ( = ?auto_27858 ?auto_27852 ) ) ( not ( = ?auto_27848 ?auto_27852 ) ) ( not ( = ?auto_27857 ?auto_27852 ) ) ( not ( = ?auto_27847 ?auto_27852 ) ) ( SURFACE-AT ?auto_27854 ?auto_27853 ) ( CLEAR ?auto_27854 ) ( IS-CRATE ?auto_27847 ) ( not ( = ?auto_27854 ?auto_27847 ) ) ( not ( = ?auto_27850 ?auto_27854 ) ) ( not ( = ?auto_27851 ?auto_27854 ) ) ( not ( = ?auto_27849 ?auto_27854 ) ) ( not ( = ?auto_27860 ?auto_27854 ) ) ( not ( = ?auto_27858 ?auto_27854 ) ) ( not ( = ?auto_27848 ?auto_27854 ) ) ( not ( = ?auto_27857 ?auto_27854 ) ) ( not ( = ?auto_27852 ?auto_27854 ) ) ( AVAILABLE ?auto_27864 ) ( TRUCK-AT ?auto_27865 ?auto_27861 ) ( LIFTING ?auto_27863 ?auto_27847 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27849 ?auto_27850 ?auto_27851 )
      ( MAKE-4CRATE-VERIFY ?auto_27847 ?auto_27848 ?auto_27849 ?auto_27850 ?auto_27851 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27866 - SURFACE
      ?auto_27867 - SURFACE
      ?auto_27868 - SURFACE
      ?auto_27869 - SURFACE
      ?auto_27870 - SURFACE
      ?auto_27871 - SURFACE
    )
    :vars
    (
      ?auto_27883 - HOIST
      ?auto_27873 - PLACE
      ?auto_27880 - PLACE
      ?auto_27882 - HOIST
      ?auto_27879 - SURFACE
      ?auto_27875 - PLACE
      ?auto_27881 - HOIST
      ?auto_27877 - SURFACE
      ?auto_27876 - SURFACE
      ?auto_27874 - PLACE
      ?auto_27878 - HOIST
      ?auto_27872 - SURFACE
      ?auto_27884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27883 ?auto_27873 ) ( IS-CRATE ?auto_27871 ) ( not ( = ?auto_27870 ?auto_27871 ) ) ( not ( = ?auto_27869 ?auto_27870 ) ) ( not ( = ?auto_27869 ?auto_27871 ) ) ( not ( = ?auto_27880 ?auto_27873 ) ) ( HOIST-AT ?auto_27882 ?auto_27880 ) ( not ( = ?auto_27883 ?auto_27882 ) ) ( SURFACE-AT ?auto_27871 ?auto_27880 ) ( ON ?auto_27871 ?auto_27879 ) ( CLEAR ?auto_27871 ) ( not ( = ?auto_27870 ?auto_27879 ) ) ( not ( = ?auto_27871 ?auto_27879 ) ) ( not ( = ?auto_27869 ?auto_27879 ) ) ( IS-CRATE ?auto_27870 ) ( not ( = ?auto_27875 ?auto_27873 ) ) ( not ( = ?auto_27880 ?auto_27875 ) ) ( HOIST-AT ?auto_27881 ?auto_27875 ) ( not ( = ?auto_27883 ?auto_27881 ) ) ( not ( = ?auto_27882 ?auto_27881 ) ) ( SURFACE-AT ?auto_27870 ?auto_27875 ) ( ON ?auto_27870 ?auto_27877 ) ( CLEAR ?auto_27870 ) ( not ( = ?auto_27870 ?auto_27877 ) ) ( not ( = ?auto_27871 ?auto_27877 ) ) ( not ( = ?auto_27869 ?auto_27877 ) ) ( not ( = ?auto_27879 ?auto_27877 ) ) ( IS-CRATE ?auto_27869 ) ( not ( = ?auto_27868 ?auto_27869 ) ) ( not ( = ?auto_27870 ?auto_27868 ) ) ( not ( = ?auto_27871 ?auto_27868 ) ) ( not ( = ?auto_27879 ?auto_27868 ) ) ( not ( = ?auto_27877 ?auto_27868 ) ) ( AVAILABLE ?auto_27881 ) ( SURFACE-AT ?auto_27869 ?auto_27875 ) ( ON ?auto_27869 ?auto_27876 ) ( CLEAR ?auto_27869 ) ( not ( = ?auto_27870 ?auto_27876 ) ) ( not ( = ?auto_27871 ?auto_27876 ) ) ( not ( = ?auto_27869 ?auto_27876 ) ) ( not ( = ?auto_27879 ?auto_27876 ) ) ( not ( = ?auto_27877 ?auto_27876 ) ) ( not ( = ?auto_27868 ?auto_27876 ) ) ( IS-CRATE ?auto_27868 ) ( not ( = ?auto_27867 ?auto_27868 ) ) ( not ( = ?auto_27870 ?auto_27867 ) ) ( not ( = ?auto_27871 ?auto_27867 ) ) ( not ( = ?auto_27869 ?auto_27867 ) ) ( not ( = ?auto_27879 ?auto_27867 ) ) ( not ( = ?auto_27877 ?auto_27867 ) ) ( not ( = ?auto_27876 ?auto_27867 ) ) ( not ( = ?auto_27874 ?auto_27873 ) ) ( not ( = ?auto_27880 ?auto_27874 ) ) ( not ( = ?auto_27875 ?auto_27874 ) ) ( HOIST-AT ?auto_27878 ?auto_27874 ) ( not ( = ?auto_27883 ?auto_27878 ) ) ( not ( = ?auto_27882 ?auto_27878 ) ) ( not ( = ?auto_27881 ?auto_27878 ) ) ( AVAILABLE ?auto_27878 ) ( SURFACE-AT ?auto_27868 ?auto_27874 ) ( ON ?auto_27868 ?auto_27872 ) ( CLEAR ?auto_27868 ) ( not ( = ?auto_27870 ?auto_27872 ) ) ( not ( = ?auto_27871 ?auto_27872 ) ) ( not ( = ?auto_27869 ?auto_27872 ) ) ( not ( = ?auto_27879 ?auto_27872 ) ) ( not ( = ?auto_27877 ?auto_27872 ) ) ( not ( = ?auto_27868 ?auto_27872 ) ) ( not ( = ?auto_27876 ?auto_27872 ) ) ( not ( = ?auto_27867 ?auto_27872 ) ) ( SURFACE-AT ?auto_27866 ?auto_27873 ) ( CLEAR ?auto_27866 ) ( IS-CRATE ?auto_27867 ) ( not ( = ?auto_27866 ?auto_27867 ) ) ( not ( = ?auto_27870 ?auto_27866 ) ) ( not ( = ?auto_27871 ?auto_27866 ) ) ( not ( = ?auto_27869 ?auto_27866 ) ) ( not ( = ?auto_27879 ?auto_27866 ) ) ( not ( = ?auto_27877 ?auto_27866 ) ) ( not ( = ?auto_27868 ?auto_27866 ) ) ( not ( = ?auto_27876 ?auto_27866 ) ) ( not ( = ?auto_27872 ?auto_27866 ) ) ( AVAILABLE ?auto_27883 ) ( TRUCK-AT ?auto_27884 ?auto_27880 ) ( LIFTING ?auto_27882 ?auto_27867 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27869 ?auto_27870 ?auto_27871 )
      ( MAKE-5CRATE-VERIFY ?auto_27866 ?auto_27867 ?auto_27868 ?auto_27869 ?auto_27870 ?auto_27871 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27885 - SURFACE
      ?auto_27886 - SURFACE
    )
    :vars
    (
      ?auto_27901 - HOIST
      ?auto_27888 - PLACE
      ?auto_27902 - SURFACE
      ?auto_27898 - PLACE
      ?auto_27900 - HOIST
      ?auto_27897 - SURFACE
      ?auto_27892 - PLACE
      ?auto_27899 - HOIST
      ?auto_27894 - SURFACE
      ?auto_27896 - SURFACE
      ?auto_27893 - SURFACE
      ?auto_27889 - SURFACE
      ?auto_27891 - PLACE
      ?auto_27895 - HOIST
      ?auto_27887 - SURFACE
      ?auto_27890 - SURFACE
      ?auto_27903 - TRUCK
      ?auto_27904 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27901 ?auto_27888 ) ( IS-CRATE ?auto_27886 ) ( not ( = ?auto_27885 ?auto_27886 ) ) ( not ( = ?auto_27902 ?auto_27885 ) ) ( not ( = ?auto_27902 ?auto_27886 ) ) ( not ( = ?auto_27898 ?auto_27888 ) ) ( HOIST-AT ?auto_27900 ?auto_27898 ) ( not ( = ?auto_27901 ?auto_27900 ) ) ( SURFACE-AT ?auto_27886 ?auto_27898 ) ( ON ?auto_27886 ?auto_27897 ) ( CLEAR ?auto_27886 ) ( not ( = ?auto_27885 ?auto_27897 ) ) ( not ( = ?auto_27886 ?auto_27897 ) ) ( not ( = ?auto_27902 ?auto_27897 ) ) ( IS-CRATE ?auto_27885 ) ( not ( = ?auto_27892 ?auto_27888 ) ) ( not ( = ?auto_27898 ?auto_27892 ) ) ( HOIST-AT ?auto_27899 ?auto_27892 ) ( not ( = ?auto_27901 ?auto_27899 ) ) ( not ( = ?auto_27900 ?auto_27899 ) ) ( SURFACE-AT ?auto_27885 ?auto_27892 ) ( ON ?auto_27885 ?auto_27894 ) ( CLEAR ?auto_27885 ) ( not ( = ?auto_27885 ?auto_27894 ) ) ( not ( = ?auto_27886 ?auto_27894 ) ) ( not ( = ?auto_27902 ?auto_27894 ) ) ( not ( = ?auto_27897 ?auto_27894 ) ) ( IS-CRATE ?auto_27902 ) ( not ( = ?auto_27896 ?auto_27902 ) ) ( not ( = ?auto_27885 ?auto_27896 ) ) ( not ( = ?auto_27886 ?auto_27896 ) ) ( not ( = ?auto_27897 ?auto_27896 ) ) ( not ( = ?auto_27894 ?auto_27896 ) ) ( AVAILABLE ?auto_27899 ) ( SURFACE-AT ?auto_27902 ?auto_27892 ) ( ON ?auto_27902 ?auto_27893 ) ( CLEAR ?auto_27902 ) ( not ( = ?auto_27885 ?auto_27893 ) ) ( not ( = ?auto_27886 ?auto_27893 ) ) ( not ( = ?auto_27902 ?auto_27893 ) ) ( not ( = ?auto_27897 ?auto_27893 ) ) ( not ( = ?auto_27894 ?auto_27893 ) ) ( not ( = ?auto_27896 ?auto_27893 ) ) ( IS-CRATE ?auto_27896 ) ( not ( = ?auto_27889 ?auto_27896 ) ) ( not ( = ?auto_27885 ?auto_27889 ) ) ( not ( = ?auto_27886 ?auto_27889 ) ) ( not ( = ?auto_27902 ?auto_27889 ) ) ( not ( = ?auto_27897 ?auto_27889 ) ) ( not ( = ?auto_27894 ?auto_27889 ) ) ( not ( = ?auto_27893 ?auto_27889 ) ) ( not ( = ?auto_27891 ?auto_27888 ) ) ( not ( = ?auto_27898 ?auto_27891 ) ) ( not ( = ?auto_27892 ?auto_27891 ) ) ( HOIST-AT ?auto_27895 ?auto_27891 ) ( not ( = ?auto_27901 ?auto_27895 ) ) ( not ( = ?auto_27900 ?auto_27895 ) ) ( not ( = ?auto_27899 ?auto_27895 ) ) ( AVAILABLE ?auto_27895 ) ( SURFACE-AT ?auto_27896 ?auto_27891 ) ( ON ?auto_27896 ?auto_27887 ) ( CLEAR ?auto_27896 ) ( not ( = ?auto_27885 ?auto_27887 ) ) ( not ( = ?auto_27886 ?auto_27887 ) ) ( not ( = ?auto_27902 ?auto_27887 ) ) ( not ( = ?auto_27897 ?auto_27887 ) ) ( not ( = ?auto_27894 ?auto_27887 ) ) ( not ( = ?auto_27896 ?auto_27887 ) ) ( not ( = ?auto_27893 ?auto_27887 ) ) ( not ( = ?auto_27889 ?auto_27887 ) ) ( SURFACE-AT ?auto_27890 ?auto_27888 ) ( CLEAR ?auto_27890 ) ( IS-CRATE ?auto_27889 ) ( not ( = ?auto_27890 ?auto_27889 ) ) ( not ( = ?auto_27885 ?auto_27890 ) ) ( not ( = ?auto_27886 ?auto_27890 ) ) ( not ( = ?auto_27902 ?auto_27890 ) ) ( not ( = ?auto_27897 ?auto_27890 ) ) ( not ( = ?auto_27894 ?auto_27890 ) ) ( not ( = ?auto_27896 ?auto_27890 ) ) ( not ( = ?auto_27893 ?auto_27890 ) ) ( not ( = ?auto_27887 ?auto_27890 ) ) ( AVAILABLE ?auto_27901 ) ( TRUCK-AT ?auto_27903 ?auto_27898 ) ( AVAILABLE ?auto_27900 ) ( SURFACE-AT ?auto_27889 ?auto_27898 ) ( ON ?auto_27889 ?auto_27904 ) ( CLEAR ?auto_27889 ) ( not ( = ?auto_27885 ?auto_27904 ) ) ( not ( = ?auto_27886 ?auto_27904 ) ) ( not ( = ?auto_27902 ?auto_27904 ) ) ( not ( = ?auto_27897 ?auto_27904 ) ) ( not ( = ?auto_27894 ?auto_27904 ) ) ( not ( = ?auto_27896 ?auto_27904 ) ) ( not ( = ?auto_27893 ?auto_27904 ) ) ( not ( = ?auto_27889 ?auto_27904 ) ) ( not ( = ?auto_27887 ?auto_27904 ) ) ( not ( = ?auto_27890 ?auto_27904 ) ) )
    :subtasks
    ( ( !LIFT ?auto_27900 ?auto_27889 ?auto_27904 ?auto_27898 )
      ( MAKE-2CRATE ?auto_27902 ?auto_27885 ?auto_27886 )
      ( MAKE-1CRATE-VERIFY ?auto_27885 ?auto_27886 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27905 - SURFACE
      ?auto_27906 - SURFACE
      ?auto_27907 - SURFACE
    )
    :vars
    (
      ?auto_27913 - HOIST
      ?auto_27917 - PLACE
      ?auto_27919 - PLACE
      ?auto_27922 - HOIST
      ?auto_27912 - SURFACE
      ?auto_27908 - PLACE
      ?auto_27914 - HOIST
      ?auto_27911 - SURFACE
      ?auto_27920 - SURFACE
      ?auto_27916 - SURFACE
      ?auto_27921 - SURFACE
      ?auto_27918 - PLACE
      ?auto_27915 - HOIST
      ?auto_27923 - SURFACE
      ?auto_27909 - SURFACE
      ?auto_27910 - TRUCK
      ?auto_27924 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27913 ?auto_27917 ) ( IS-CRATE ?auto_27907 ) ( not ( = ?auto_27906 ?auto_27907 ) ) ( not ( = ?auto_27905 ?auto_27906 ) ) ( not ( = ?auto_27905 ?auto_27907 ) ) ( not ( = ?auto_27919 ?auto_27917 ) ) ( HOIST-AT ?auto_27922 ?auto_27919 ) ( not ( = ?auto_27913 ?auto_27922 ) ) ( SURFACE-AT ?auto_27907 ?auto_27919 ) ( ON ?auto_27907 ?auto_27912 ) ( CLEAR ?auto_27907 ) ( not ( = ?auto_27906 ?auto_27912 ) ) ( not ( = ?auto_27907 ?auto_27912 ) ) ( not ( = ?auto_27905 ?auto_27912 ) ) ( IS-CRATE ?auto_27906 ) ( not ( = ?auto_27908 ?auto_27917 ) ) ( not ( = ?auto_27919 ?auto_27908 ) ) ( HOIST-AT ?auto_27914 ?auto_27908 ) ( not ( = ?auto_27913 ?auto_27914 ) ) ( not ( = ?auto_27922 ?auto_27914 ) ) ( SURFACE-AT ?auto_27906 ?auto_27908 ) ( ON ?auto_27906 ?auto_27911 ) ( CLEAR ?auto_27906 ) ( not ( = ?auto_27906 ?auto_27911 ) ) ( not ( = ?auto_27907 ?auto_27911 ) ) ( not ( = ?auto_27905 ?auto_27911 ) ) ( not ( = ?auto_27912 ?auto_27911 ) ) ( IS-CRATE ?auto_27905 ) ( not ( = ?auto_27920 ?auto_27905 ) ) ( not ( = ?auto_27906 ?auto_27920 ) ) ( not ( = ?auto_27907 ?auto_27920 ) ) ( not ( = ?auto_27912 ?auto_27920 ) ) ( not ( = ?auto_27911 ?auto_27920 ) ) ( AVAILABLE ?auto_27914 ) ( SURFACE-AT ?auto_27905 ?auto_27908 ) ( ON ?auto_27905 ?auto_27916 ) ( CLEAR ?auto_27905 ) ( not ( = ?auto_27906 ?auto_27916 ) ) ( not ( = ?auto_27907 ?auto_27916 ) ) ( not ( = ?auto_27905 ?auto_27916 ) ) ( not ( = ?auto_27912 ?auto_27916 ) ) ( not ( = ?auto_27911 ?auto_27916 ) ) ( not ( = ?auto_27920 ?auto_27916 ) ) ( IS-CRATE ?auto_27920 ) ( not ( = ?auto_27921 ?auto_27920 ) ) ( not ( = ?auto_27906 ?auto_27921 ) ) ( not ( = ?auto_27907 ?auto_27921 ) ) ( not ( = ?auto_27905 ?auto_27921 ) ) ( not ( = ?auto_27912 ?auto_27921 ) ) ( not ( = ?auto_27911 ?auto_27921 ) ) ( not ( = ?auto_27916 ?auto_27921 ) ) ( not ( = ?auto_27918 ?auto_27917 ) ) ( not ( = ?auto_27919 ?auto_27918 ) ) ( not ( = ?auto_27908 ?auto_27918 ) ) ( HOIST-AT ?auto_27915 ?auto_27918 ) ( not ( = ?auto_27913 ?auto_27915 ) ) ( not ( = ?auto_27922 ?auto_27915 ) ) ( not ( = ?auto_27914 ?auto_27915 ) ) ( AVAILABLE ?auto_27915 ) ( SURFACE-AT ?auto_27920 ?auto_27918 ) ( ON ?auto_27920 ?auto_27923 ) ( CLEAR ?auto_27920 ) ( not ( = ?auto_27906 ?auto_27923 ) ) ( not ( = ?auto_27907 ?auto_27923 ) ) ( not ( = ?auto_27905 ?auto_27923 ) ) ( not ( = ?auto_27912 ?auto_27923 ) ) ( not ( = ?auto_27911 ?auto_27923 ) ) ( not ( = ?auto_27920 ?auto_27923 ) ) ( not ( = ?auto_27916 ?auto_27923 ) ) ( not ( = ?auto_27921 ?auto_27923 ) ) ( SURFACE-AT ?auto_27909 ?auto_27917 ) ( CLEAR ?auto_27909 ) ( IS-CRATE ?auto_27921 ) ( not ( = ?auto_27909 ?auto_27921 ) ) ( not ( = ?auto_27906 ?auto_27909 ) ) ( not ( = ?auto_27907 ?auto_27909 ) ) ( not ( = ?auto_27905 ?auto_27909 ) ) ( not ( = ?auto_27912 ?auto_27909 ) ) ( not ( = ?auto_27911 ?auto_27909 ) ) ( not ( = ?auto_27920 ?auto_27909 ) ) ( not ( = ?auto_27916 ?auto_27909 ) ) ( not ( = ?auto_27923 ?auto_27909 ) ) ( AVAILABLE ?auto_27913 ) ( TRUCK-AT ?auto_27910 ?auto_27919 ) ( AVAILABLE ?auto_27922 ) ( SURFACE-AT ?auto_27921 ?auto_27919 ) ( ON ?auto_27921 ?auto_27924 ) ( CLEAR ?auto_27921 ) ( not ( = ?auto_27906 ?auto_27924 ) ) ( not ( = ?auto_27907 ?auto_27924 ) ) ( not ( = ?auto_27905 ?auto_27924 ) ) ( not ( = ?auto_27912 ?auto_27924 ) ) ( not ( = ?auto_27911 ?auto_27924 ) ) ( not ( = ?auto_27920 ?auto_27924 ) ) ( not ( = ?auto_27916 ?auto_27924 ) ) ( not ( = ?auto_27921 ?auto_27924 ) ) ( not ( = ?auto_27923 ?auto_27924 ) ) ( not ( = ?auto_27909 ?auto_27924 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27906 ?auto_27907 )
      ( MAKE-2CRATE-VERIFY ?auto_27905 ?auto_27906 ?auto_27907 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27925 - SURFACE
      ?auto_27926 - SURFACE
      ?auto_27927 - SURFACE
      ?auto_27928 - SURFACE
    )
    :vars
    (
      ?auto_27933 - HOIST
      ?auto_27944 - PLACE
      ?auto_27939 - PLACE
      ?auto_27942 - HOIST
      ?auto_27931 - SURFACE
      ?auto_27930 - PLACE
      ?auto_27940 - HOIST
      ?auto_27941 - SURFACE
      ?auto_27929 - SURFACE
      ?auto_27938 - SURFACE
      ?auto_27935 - PLACE
      ?auto_27943 - HOIST
      ?auto_27934 - SURFACE
      ?auto_27936 - SURFACE
      ?auto_27932 - TRUCK
      ?auto_27937 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27933 ?auto_27944 ) ( IS-CRATE ?auto_27928 ) ( not ( = ?auto_27927 ?auto_27928 ) ) ( not ( = ?auto_27926 ?auto_27927 ) ) ( not ( = ?auto_27926 ?auto_27928 ) ) ( not ( = ?auto_27939 ?auto_27944 ) ) ( HOIST-AT ?auto_27942 ?auto_27939 ) ( not ( = ?auto_27933 ?auto_27942 ) ) ( SURFACE-AT ?auto_27928 ?auto_27939 ) ( ON ?auto_27928 ?auto_27931 ) ( CLEAR ?auto_27928 ) ( not ( = ?auto_27927 ?auto_27931 ) ) ( not ( = ?auto_27928 ?auto_27931 ) ) ( not ( = ?auto_27926 ?auto_27931 ) ) ( IS-CRATE ?auto_27927 ) ( not ( = ?auto_27930 ?auto_27944 ) ) ( not ( = ?auto_27939 ?auto_27930 ) ) ( HOIST-AT ?auto_27940 ?auto_27930 ) ( not ( = ?auto_27933 ?auto_27940 ) ) ( not ( = ?auto_27942 ?auto_27940 ) ) ( SURFACE-AT ?auto_27927 ?auto_27930 ) ( ON ?auto_27927 ?auto_27941 ) ( CLEAR ?auto_27927 ) ( not ( = ?auto_27927 ?auto_27941 ) ) ( not ( = ?auto_27928 ?auto_27941 ) ) ( not ( = ?auto_27926 ?auto_27941 ) ) ( not ( = ?auto_27931 ?auto_27941 ) ) ( IS-CRATE ?auto_27926 ) ( not ( = ?auto_27925 ?auto_27926 ) ) ( not ( = ?auto_27927 ?auto_27925 ) ) ( not ( = ?auto_27928 ?auto_27925 ) ) ( not ( = ?auto_27931 ?auto_27925 ) ) ( not ( = ?auto_27941 ?auto_27925 ) ) ( AVAILABLE ?auto_27940 ) ( SURFACE-AT ?auto_27926 ?auto_27930 ) ( ON ?auto_27926 ?auto_27929 ) ( CLEAR ?auto_27926 ) ( not ( = ?auto_27927 ?auto_27929 ) ) ( not ( = ?auto_27928 ?auto_27929 ) ) ( not ( = ?auto_27926 ?auto_27929 ) ) ( not ( = ?auto_27931 ?auto_27929 ) ) ( not ( = ?auto_27941 ?auto_27929 ) ) ( not ( = ?auto_27925 ?auto_27929 ) ) ( IS-CRATE ?auto_27925 ) ( not ( = ?auto_27938 ?auto_27925 ) ) ( not ( = ?auto_27927 ?auto_27938 ) ) ( not ( = ?auto_27928 ?auto_27938 ) ) ( not ( = ?auto_27926 ?auto_27938 ) ) ( not ( = ?auto_27931 ?auto_27938 ) ) ( not ( = ?auto_27941 ?auto_27938 ) ) ( not ( = ?auto_27929 ?auto_27938 ) ) ( not ( = ?auto_27935 ?auto_27944 ) ) ( not ( = ?auto_27939 ?auto_27935 ) ) ( not ( = ?auto_27930 ?auto_27935 ) ) ( HOIST-AT ?auto_27943 ?auto_27935 ) ( not ( = ?auto_27933 ?auto_27943 ) ) ( not ( = ?auto_27942 ?auto_27943 ) ) ( not ( = ?auto_27940 ?auto_27943 ) ) ( AVAILABLE ?auto_27943 ) ( SURFACE-AT ?auto_27925 ?auto_27935 ) ( ON ?auto_27925 ?auto_27934 ) ( CLEAR ?auto_27925 ) ( not ( = ?auto_27927 ?auto_27934 ) ) ( not ( = ?auto_27928 ?auto_27934 ) ) ( not ( = ?auto_27926 ?auto_27934 ) ) ( not ( = ?auto_27931 ?auto_27934 ) ) ( not ( = ?auto_27941 ?auto_27934 ) ) ( not ( = ?auto_27925 ?auto_27934 ) ) ( not ( = ?auto_27929 ?auto_27934 ) ) ( not ( = ?auto_27938 ?auto_27934 ) ) ( SURFACE-AT ?auto_27936 ?auto_27944 ) ( CLEAR ?auto_27936 ) ( IS-CRATE ?auto_27938 ) ( not ( = ?auto_27936 ?auto_27938 ) ) ( not ( = ?auto_27927 ?auto_27936 ) ) ( not ( = ?auto_27928 ?auto_27936 ) ) ( not ( = ?auto_27926 ?auto_27936 ) ) ( not ( = ?auto_27931 ?auto_27936 ) ) ( not ( = ?auto_27941 ?auto_27936 ) ) ( not ( = ?auto_27925 ?auto_27936 ) ) ( not ( = ?auto_27929 ?auto_27936 ) ) ( not ( = ?auto_27934 ?auto_27936 ) ) ( AVAILABLE ?auto_27933 ) ( TRUCK-AT ?auto_27932 ?auto_27939 ) ( AVAILABLE ?auto_27942 ) ( SURFACE-AT ?auto_27938 ?auto_27939 ) ( ON ?auto_27938 ?auto_27937 ) ( CLEAR ?auto_27938 ) ( not ( = ?auto_27927 ?auto_27937 ) ) ( not ( = ?auto_27928 ?auto_27937 ) ) ( not ( = ?auto_27926 ?auto_27937 ) ) ( not ( = ?auto_27931 ?auto_27937 ) ) ( not ( = ?auto_27941 ?auto_27937 ) ) ( not ( = ?auto_27925 ?auto_27937 ) ) ( not ( = ?auto_27929 ?auto_27937 ) ) ( not ( = ?auto_27938 ?auto_27937 ) ) ( not ( = ?auto_27934 ?auto_27937 ) ) ( not ( = ?auto_27936 ?auto_27937 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27926 ?auto_27927 ?auto_27928 )
      ( MAKE-3CRATE-VERIFY ?auto_27925 ?auto_27926 ?auto_27927 ?auto_27928 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27945 - SURFACE
      ?auto_27946 - SURFACE
      ?auto_27947 - SURFACE
      ?auto_27948 - SURFACE
      ?auto_27949 - SURFACE
    )
    :vars
    (
      ?auto_27954 - HOIST
      ?auto_27964 - PLACE
      ?auto_27959 - PLACE
      ?auto_27962 - HOIST
      ?auto_27952 - SURFACE
      ?auto_27951 - PLACE
      ?auto_27960 - HOIST
      ?auto_27961 - SURFACE
      ?auto_27950 - SURFACE
      ?auto_27956 - PLACE
      ?auto_27963 - HOIST
      ?auto_27955 - SURFACE
      ?auto_27957 - SURFACE
      ?auto_27953 - TRUCK
      ?auto_27958 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27954 ?auto_27964 ) ( IS-CRATE ?auto_27949 ) ( not ( = ?auto_27948 ?auto_27949 ) ) ( not ( = ?auto_27947 ?auto_27948 ) ) ( not ( = ?auto_27947 ?auto_27949 ) ) ( not ( = ?auto_27959 ?auto_27964 ) ) ( HOIST-AT ?auto_27962 ?auto_27959 ) ( not ( = ?auto_27954 ?auto_27962 ) ) ( SURFACE-AT ?auto_27949 ?auto_27959 ) ( ON ?auto_27949 ?auto_27952 ) ( CLEAR ?auto_27949 ) ( not ( = ?auto_27948 ?auto_27952 ) ) ( not ( = ?auto_27949 ?auto_27952 ) ) ( not ( = ?auto_27947 ?auto_27952 ) ) ( IS-CRATE ?auto_27948 ) ( not ( = ?auto_27951 ?auto_27964 ) ) ( not ( = ?auto_27959 ?auto_27951 ) ) ( HOIST-AT ?auto_27960 ?auto_27951 ) ( not ( = ?auto_27954 ?auto_27960 ) ) ( not ( = ?auto_27962 ?auto_27960 ) ) ( SURFACE-AT ?auto_27948 ?auto_27951 ) ( ON ?auto_27948 ?auto_27961 ) ( CLEAR ?auto_27948 ) ( not ( = ?auto_27948 ?auto_27961 ) ) ( not ( = ?auto_27949 ?auto_27961 ) ) ( not ( = ?auto_27947 ?auto_27961 ) ) ( not ( = ?auto_27952 ?auto_27961 ) ) ( IS-CRATE ?auto_27947 ) ( not ( = ?auto_27946 ?auto_27947 ) ) ( not ( = ?auto_27948 ?auto_27946 ) ) ( not ( = ?auto_27949 ?auto_27946 ) ) ( not ( = ?auto_27952 ?auto_27946 ) ) ( not ( = ?auto_27961 ?auto_27946 ) ) ( AVAILABLE ?auto_27960 ) ( SURFACE-AT ?auto_27947 ?auto_27951 ) ( ON ?auto_27947 ?auto_27950 ) ( CLEAR ?auto_27947 ) ( not ( = ?auto_27948 ?auto_27950 ) ) ( not ( = ?auto_27949 ?auto_27950 ) ) ( not ( = ?auto_27947 ?auto_27950 ) ) ( not ( = ?auto_27952 ?auto_27950 ) ) ( not ( = ?auto_27961 ?auto_27950 ) ) ( not ( = ?auto_27946 ?auto_27950 ) ) ( IS-CRATE ?auto_27946 ) ( not ( = ?auto_27945 ?auto_27946 ) ) ( not ( = ?auto_27948 ?auto_27945 ) ) ( not ( = ?auto_27949 ?auto_27945 ) ) ( not ( = ?auto_27947 ?auto_27945 ) ) ( not ( = ?auto_27952 ?auto_27945 ) ) ( not ( = ?auto_27961 ?auto_27945 ) ) ( not ( = ?auto_27950 ?auto_27945 ) ) ( not ( = ?auto_27956 ?auto_27964 ) ) ( not ( = ?auto_27959 ?auto_27956 ) ) ( not ( = ?auto_27951 ?auto_27956 ) ) ( HOIST-AT ?auto_27963 ?auto_27956 ) ( not ( = ?auto_27954 ?auto_27963 ) ) ( not ( = ?auto_27962 ?auto_27963 ) ) ( not ( = ?auto_27960 ?auto_27963 ) ) ( AVAILABLE ?auto_27963 ) ( SURFACE-AT ?auto_27946 ?auto_27956 ) ( ON ?auto_27946 ?auto_27955 ) ( CLEAR ?auto_27946 ) ( not ( = ?auto_27948 ?auto_27955 ) ) ( not ( = ?auto_27949 ?auto_27955 ) ) ( not ( = ?auto_27947 ?auto_27955 ) ) ( not ( = ?auto_27952 ?auto_27955 ) ) ( not ( = ?auto_27961 ?auto_27955 ) ) ( not ( = ?auto_27946 ?auto_27955 ) ) ( not ( = ?auto_27950 ?auto_27955 ) ) ( not ( = ?auto_27945 ?auto_27955 ) ) ( SURFACE-AT ?auto_27957 ?auto_27964 ) ( CLEAR ?auto_27957 ) ( IS-CRATE ?auto_27945 ) ( not ( = ?auto_27957 ?auto_27945 ) ) ( not ( = ?auto_27948 ?auto_27957 ) ) ( not ( = ?auto_27949 ?auto_27957 ) ) ( not ( = ?auto_27947 ?auto_27957 ) ) ( not ( = ?auto_27952 ?auto_27957 ) ) ( not ( = ?auto_27961 ?auto_27957 ) ) ( not ( = ?auto_27946 ?auto_27957 ) ) ( not ( = ?auto_27950 ?auto_27957 ) ) ( not ( = ?auto_27955 ?auto_27957 ) ) ( AVAILABLE ?auto_27954 ) ( TRUCK-AT ?auto_27953 ?auto_27959 ) ( AVAILABLE ?auto_27962 ) ( SURFACE-AT ?auto_27945 ?auto_27959 ) ( ON ?auto_27945 ?auto_27958 ) ( CLEAR ?auto_27945 ) ( not ( = ?auto_27948 ?auto_27958 ) ) ( not ( = ?auto_27949 ?auto_27958 ) ) ( not ( = ?auto_27947 ?auto_27958 ) ) ( not ( = ?auto_27952 ?auto_27958 ) ) ( not ( = ?auto_27961 ?auto_27958 ) ) ( not ( = ?auto_27946 ?auto_27958 ) ) ( not ( = ?auto_27950 ?auto_27958 ) ) ( not ( = ?auto_27945 ?auto_27958 ) ) ( not ( = ?auto_27955 ?auto_27958 ) ) ( not ( = ?auto_27957 ?auto_27958 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27947 ?auto_27948 ?auto_27949 )
      ( MAKE-4CRATE-VERIFY ?auto_27945 ?auto_27946 ?auto_27947 ?auto_27948 ?auto_27949 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27965 - SURFACE
      ?auto_27966 - SURFACE
      ?auto_27967 - SURFACE
      ?auto_27968 - SURFACE
      ?auto_27969 - SURFACE
      ?auto_27970 - SURFACE
    )
    :vars
    (
      ?auto_27975 - HOIST
      ?auto_27984 - PLACE
      ?auto_27979 - PLACE
      ?auto_27982 - HOIST
      ?auto_27973 - SURFACE
      ?auto_27972 - PLACE
      ?auto_27980 - HOIST
      ?auto_27981 - SURFACE
      ?auto_27971 - SURFACE
      ?auto_27977 - PLACE
      ?auto_27983 - HOIST
      ?auto_27976 - SURFACE
      ?auto_27974 - TRUCK
      ?auto_27978 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_27975 ?auto_27984 ) ( IS-CRATE ?auto_27970 ) ( not ( = ?auto_27969 ?auto_27970 ) ) ( not ( = ?auto_27968 ?auto_27969 ) ) ( not ( = ?auto_27968 ?auto_27970 ) ) ( not ( = ?auto_27979 ?auto_27984 ) ) ( HOIST-AT ?auto_27982 ?auto_27979 ) ( not ( = ?auto_27975 ?auto_27982 ) ) ( SURFACE-AT ?auto_27970 ?auto_27979 ) ( ON ?auto_27970 ?auto_27973 ) ( CLEAR ?auto_27970 ) ( not ( = ?auto_27969 ?auto_27973 ) ) ( not ( = ?auto_27970 ?auto_27973 ) ) ( not ( = ?auto_27968 ?auto_27973 ) ) ( IS-CRATE ?auto_27969 ) ( not ( = ?auto_27972 ?auto_27984 ) ) ( not ( = ?auto_27979 ?auto_27972 ) ) ( HOIST-AT ?auto_27980 ?auto_27972 ) ( not ( = ?auto_27975 ?auto_27980 ) ) ( not ( = ?auto_27982 ?auto_27980 ) ) ( SURFACE-AT ?auto_27969 ?auto_27972 ) ( ON ?auto_27969 ?auto_27981 ) ( CLEAR ?auto_27969 ) ( not ( = ?auto_27969 ?auto_27981 ) ) ( not ( = ?auto_27970 ?auto_27981 ) ) ( not ( = ?auto_27968 ?auto_27981 ) ) ( not ( = ?auto_27973 ?auto_27981 ) ) ( IS-CRATE ?auto_27968 ) ( not ( = ?auto_27967 ?auto_27968 ) ) ( not ( = ?auto_27969 ?auto_27967 ) ) ( not ( = ?auto_27970 ?auto_27967 ) ) ( not ( = ?auto_27973 ?auto_27967 ) ) ( not ( = ?auto_27981 ?auto_27967 ) ) ( AVAILABLE ?auto_27980 ) ( SURFACE-AT ?auto_27968 ?auto_27972 ) ( ON ?auto_27968 ?auto_27971 ) ( CLEAR ?auto_27968 ) ( not ( = ?auto_27969 ?auto_27971 ) ) ( not ( = ?auto_27970 ?auto_27971 ) ) ( not ( = ?auto_27968 ?auto_27971 ) ) ( not ( = ?auto_27973 ?auto_27971 ) ) ( not ( = ?auto_27981 ?auto_27971 ) ) ( not ( = ?auto_27967 ?auto_27971 ) ) ( IS-CRATE ?auto_27967 ) ( not ( = ?auto_27966 ?auto_27967 ) ) ( not ( = ?auto_27969 ?auto_27966 ) ) ( not ( = ?auto_27970 ?auto_27966 ) ) ( not ( = ?auto_27968 ?auto_27966 ) ) ( not ( = ?auto_27973 ?auto_27966 ) ) ( not ( = ?auto_27981 ?auto_27966 ) ) ( not ( = ?auto_27971 ?auto_27966 ) ) ( not ( = ?auto_27977 ?auto_27984 ) ) ( not ( = ?auto_27979 ?auto_27977 ) ) ( not ( = ?auto_27972 ?auto_27977 ) ) ( HOIST-AT ?auto_27983 ?auto_27977 ) ( not ( = ?auto_27975 ?auto_27983 ) ) ( not ( = ?auto_27982 ?auto_27983 ) ) ( not ( = ?auto_27980 ?auto_27983 ) ) ( AVAILABLE ?auto_27983 ) ( SURFACE-AT ?auto_27967 ?auto_27977 ) ( ON ?auto_27967 ?auto_27976 ) ( CLEAR ?auto_27967 ) ( not ( = ?auto_27969 ?auto_27976 ) ) ( not ( = ?auto_27970 ?auto_27976 ) ) ( not ( = ?auto_27968 ?auto_27976 ) ) ( not ( = ?auto_27973 ?auto_27976 ) ) ( not ( = ?auto_27981 ?auto_27976 ) ) ( not ( = ?auto_27967 ?auto_27976 ) ) ( not ( = ?auto_27971 ?auto_27976 ) ) ( not ( = ?auto_27966 ?auto_27976 ) ) ( SURFACE-AT ?auto_27965 ?auto_27984 ) ( CLEAR ?auto_27965 ) ( IS-CRATE ?auto_27966 ) ( not ( = ?auto_27965 ?auto_27966 ) ) ( not ( = ?auto_27969 ?auto_27965 ) ) ( not ( = ?auto_27970 ?auto_27965 ) ) ( not ( = ?auto_27968 ?auto_27965 ) ) ( not ( = ?auto_27973 ?auto_27965 ) ) ( not ( = ?auto_27981 ?auto_27965 ) ) ( not ( = ?auto_27967 ?auto_27965 ) ) ( not ( = ?auto_27971 ?auto_27965 ) ) ( not ( = ?auto_27976 ?auto_27965 ) ) ( AVAILABLE ?auto_27975 ) ( TRUCK-AT ?auto_27974 ?auto_27979 ) ( AVAILABLE ?auto_27982 ) ( SURFACE-AT ?auto_27966 ?auto_27979 ) ( ON ?auto_27966 ?auto_27978 ) ( CLEAR ?auto_27966 ) ( not ( = ?auto_27969 ?auto_27978 ) ) ( not ( = ?auto_27970 ?auto_27978 ) ) ( not ( = ?auto_27968 ?auto_27978 ) ) ( not ( = ?auto_27973 ?auto_27978 ) ) ( not ( = ?auto_27981 ?auto_27978 ) ) ( not ( = ?auto_27967 ?auto_27978 ) ) ( not ( = ?auto_27971 ?auto_27978 ) ) ( not ( = ?auto_27966 ?auto_27978 ) ) ( not ( = ?auto_27976 ?auto_27978 ) ) ( not ( = ?auto_27965 ?auto_27978 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27968 ?auto_27969 ?auto_27970 )
      ( MAKE-5CRATE-VERIFY ?auto_27965 ?auto_27966 ?auto_27967 ?auto_27968 ?auto_27969 ?auto_27970 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27985 - SURFACE
      ?auto_27986 - SURFACE
    )
    :vars
    (
      ?auto_27992 - HOIST
      ?auto_28004 - PLACE
      ?auto_27999 - SURFACE
      ?auto_27998 - PLACE
      ?auto_28002 - HOIST
      ?auto_27989 - SURFACE
      ?auto_27988 - PLACE
      ?auto_28000 - HOIST
      ?auto_28001 - SURFACE
      ?auto_27990 - SURFACE
      ?auto_27987 - SURFACE
      ?auto_27997 - SURFACE
      ?auto_27994 - PLACE
      ?auto_28003 - HOIST
      ?auto_27993 - SURFACE
      ?auto_27995 - SURFACE
      ?auto_27996 - SURFACE
      ?auto_27991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27992 ?auto_28004 ) ( IS-CRATE ?auto_27986 ) ( not ( = ?auto_27985 ?auto_27986 ) ) ( not ( = ?auto_27999 ?auto_27985 ) ) ( not ( = ?auto_27999 ?auto_27986 ) ) ( not ( = ?auto_27998 ?auto_28004 ) ) ( HOIST-AT ?auto_28002 ?auto_27998 ) ( not ( = ?auto_27992 ?auto_28002 ) ) ( SURFACE-AT ?auto_27986 ?auto_27998 ) ( ON ?auto_27986 ?auto_27989 ) ( CLEAR ?auto_27986 ) ( not ( = ?auto_27985 ?auto_27989 ) ) ( not ( = ?auto_27986 ?auto_27989 ) ) ( not ( = ?auto_27999 ?auto_27989 ) ) ( IS-CRATE ?auto_27985 ) ( not ( = ?auto_27988 ?auto_28004 ) ) ( not ( = ?auto_27998 ?auto_27988 ) ) ( HOIST-AT ?auto_28000 ?auto_27988 ) ( not ( = ?auto_27992 ?auto_28000 ) ) ( not ( = ?auto_28002 ?auto_28000 ) ) ( SURFACE-AT ?auto_27985 ?auto_27988 ) ( ON ?auto_27985 ?auto_28001 ) ( CLEAR ?auto_27985 ) ( not ( = ?auto_27985 ?auto_28001 ) ) ( not ( = ?auto_27986 ?auto_28001 ) ) ( not ( = ?auto_27999 ?auto_28001 ) ) ( not ( = ?auto_27989 ?auto_28001 ) ) ( IS-CRATE ?auto_27999 ) ( not ( = ?auto_27990 ?auto_27999 ) ) ( not ( = ?auto_27985 ?auto_27990 ) ) ( not ( = ?auto_27986 ?auto_27990 ) ) ( not ( = ?auto_27989 ?auto_27990 ) ) ( not ( = ?auto_28001 ?auto_27990 ) ) ( AVAILABLE ?auto_28000 ) ( SURFACE-AT ?auto_27999 ?auto_27988 ) ( ON ?auto_27999 ?auto_27987 ) ( CLEAR ?auto_27999 ) ( not ( = ?auto_27985 ?auto_27987 ) ) ( not ( = ?auto_27986 ?auto_27987 ) ) ( not ( = ?auto_27999 ?auto_27987 ) ) ( not ( = ?auto_27989 ?auto_27987 ) ) ( not ( = ?auto_28001 ?auto_27987 ) ) ( not ( = ?auto_27990 ?auto_27987 ) ) ( IS-CRATE ?auto_27990 ) ( not ( = ?auto_27997 ?auto_27990 ) ) ( not ( = ?auto_27985 ?auto_27997 ) ) ( not ( = ?auto_27986 ?auto_27997 ) ) ( not ( = ?auto_27999 ?auto_27997 ) ) ( not ( = ?auto_27989 ?auto_27997 ) ) ( not ( = ?auto_28001 ?auto_27997 ) ) ( not ( = ?auto_27987 ?auto_27997 ) ) ( not ( = ?auto_27994 ?auto_28004 ) ) ( not ( = ?auto_27998 ?auto_27994 ) ) ( not ( = ?auto_27988 ?auto_27994 ) ) ( HOIST-AT ?auto_28003 ?auto_27994 ) ( not ( = ?auto_27992 ?auto_28003 ) ) ( not ( = ?auto_28002 ?auto_28003 ) ) ( not ( = ?auto_28000 ?auto_28003 ) ) ( AVAILABLE ?auto_28003 ) ( SURFACE-AT ?auto_27990 ?auto_27994 ) ( ON ?auto_27990 ?auto_27993 ) ( CLEAR ?auto_27990 ) ( not ( = ?auto_27985 ?auto_27993 ) ) ( not ( = ?auto_27986 ?auto_27993 ) ) ( not ( = ?auto_27999 ?auto_27993 ) ) ( not ( = ?auto_27989 ?auto_27993 ) ) ( not ( = ?auto_28001 ?auto_27993 ) ) ( not ( = ?auto_27990 ?auto_27993 ) ) ( not ( = ?auto_27987 ?auto_27993 ) ) ( not ( = ?auto_27997 ?auto_27993 ) ) ( SURFACE-AT ?auto_27995 ?auto_28004 ) ( CLEAR ?auto_27995 ) ( IS-CRATE ?auto_27997 ) ( not ( = ?auto_27995 ?auto_27997 ) ) ( not ( = ?auto_27985 ?auto_27995 ) ) ( not ( = ?auto_27986 ?auto_27995 ) ) ( not ( = ?auto_27999 ?auto_27995 ) ) ( not ( = ?auto_27989 ?auto_27995 ) ) ( not ( = ?auto_28001 ?auto_27995 ) ) ( not ( = ?auto_27990 ?auto_27995 ) ) ( not ( = ?auto_27987 ?auto_27995 ) ) ( not ( = ?auto_27993 ?auto_27995 ) ) ( AVAILABLE ?auto_27992 ) ( AVAILABLE ?auto_28002 ) ( SURFACE-AT ?auto_27997 ?auto_27998 ) ( ON ?auto_27997 ?auto_27996 ) ( CLEAR ?auto_27997 ) ( not ( = ?auto_27985 ?auto_27996 ) ) ( not ( = ?auto_27986 ?auto_27996 ) ) ( not ( = ?auto_27999 ?auto_27996 ) ) ( not ( = ?auto_27989 ?auto_27996 ) ) ( not ( = ?auto_28001 ?auto_27996 ) ) ( not ( = ?auto_27990 ?auto_27996 ) ) ( not ( = ?auto_27987 ?auto_27996 ) ) ( not ( = ?auto_27997 ?auto_27996 ) ) ( not ( = ?auto_27993 ?auto_27996 ) ) ( not ( = ?auto_27995 ?auto_27996 ) ) ( TRUCK-AT ?auto_27991 ?auto_28004 ) )
    :subtasks
    ( ( !DRIVE ?auto_27991 ?auto_28004 ?auto_27998 )
      ( MAKE-2CRATE ?auto_27999 ?auto_27985 ?auto_27986 )
      ( MAKE-1CRATE-VERIFY ?auto_27985 ?auto_27986 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_28005 - SURFACE
      ?auto_28006 - SURFACE
      ?auto_28007 - SURFACE
    )
    :vars
    (
      ?auto_28010 - HOIST
      ?auto_28017 - PLACE
      ?auto_28024 - PLACE
      ?auto_28011 - HOIST
      ?auto_28008 - SURFACE
      ?auto_28021 - PLACE
      ?auto_28013 - HOIST
      ?auto_28023 - SURFACE
      ?auto_28018 - SURFACE
      ?auto_28022 - SURFACE
      ?auto_28015 - SURFACE
      ?auto_28009 - PLACE
      ?auto_28016 - HOIST
      ?auto_28019 - SURFACE
      ?auto_28020 - SURFACE
      ?auto_28012 - SURFACE
      ?auto_28014 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28010 ?auto_28017 ) ( IS-CRATE ?auto_28007 ) ( not ( = ?auto_28006 ?auto_28007 ) ) ( not ( = ?auto_28005 ?auto_28006 ) ) ( not ( = ?auto_28005 ?auto_28007 ) ) ( not ( = ?auto_28024 ?auto_28017 ) ) ( HOIST-AT ?auto_28011 ?auto_28024 ) ( not ( = ?auto_28010 ?auto_28011 ) ) ( SURFACE-AT ?auto_28007 ?auto_28024 ) ( ON ?auto_28007 ?auto_28008 ) ( CLEAR ?auto_28007 ) ( not ( = ?auto_28006 ?auto_28008 ) ) ( not ( = ?auto_28007 ?auto_28008 ) ) ( not ( = ?auto_28005 ?auto_28008 ) ) ( IS-CRATE ?auto_28006 ) ( not ( = ?auto_28021 ?auto_28017 ) ) ( not ( = ?auto_28024 ?auto_28021 ) ) ( HOIST-AT ?auto_28013 ?auto_28021 ) ( not ( = ?auto_28010 ?auto_28013 ) ) ( not ( = ?auto_28011 ?auto_28013 ) ) ( SURFACE-AT ?auto_28006 ?auto_28021 ) ( ON ?auto_28006 ?auto_28023 ) ( CLEAR ?auto_28006 ) ( not ( = ?auto_28006 ?auto_28023 ) ) ( not ( = ?auto_28007 ?auto_28023 ) ) ( not ( = ?auto_28005 ?auto_28023 ) ) ( not ( = ?auto_28008 ?auto_28023 ) ) ( IS-CRATE ?auto_28005 ) ( not ( = ?auto_28018 ?auto_28005 ) ) ( not ( = ?auto_28006 ?auto_28018 ) ) ( not ( = ?auto_28007 ?auto_28018 ) ) ( not ( = ?auto_28008 ?auto_28018 ) ) ( not ( = ?auto_28023 ?auto_28018 ) ) ( AVAILABLE ?auto_28013 ) ( SURFACE-AT ?auto_28005 ?auto_28021 ) ( ON ?auto_28005 ?auto_28022 ) ( CLEAR ?auto_28005 ) ( not ( = ?auto_28006 ?auto_28022 ) ) ( not ( = ?auto_28007 ?auto_28022 ) ) ( not ( = ?auto_28005 ?auto_28022 ) ) ( not ( = ?auto_28008 ?auto_28022 ) ) ( not ( = ?auto_28023 ?auto_28022 ) ) ( not ( = ?auto_28018 ?auto_28022 ) ) ( IS-CRATE ?auto_28018 ) ( not ( = ?auto_28015 ?auto_28018 ) ) ( not ( = ?auto_28006 ?auto_28015 ) ) ( not ( = ?auto_28007 ?auto_28015 ) ) ( not ( = ?auto_28005 ?auto_28015 ) ) ( not ( = ?auto_28008 ?auto_28015 ) ) ( not ( = ?auto_28023 ?auto_28015 ) ) ( not ( = ?auto_28022 ?auto_28015 ) ) ( not ( = ?auto_28009 ?auto_28017 ) ) ( not ( = ?auto_28024 ?auto_28009 ) ) ( not ( = ?auto_28021 ?auto_28009 ) ) ( HOIST-AT ?auto_28016 ?auto_28009 ) ( not ( = ?auto_28010 ?auto_28016 ) ) ( not ( = ?auto_28011 ?auto_28016 ) ) ( not ( = ?auto_28013 ?auto_28016 ) ) ( AVAILABLE ?auto_28016 ) ( SURFACE-AT ?auto_28018 ?auto_28009 ) ( ON ?auto_28018 ?auto_28019 ) ( CLEAR ?auto_28018 ) ( not ( = ?auto_28006 ?auto_28019 ) ) ( not ( = ?auto_28007 ?auto_28019 ) ) ( not ( = ?auto_28005 ?auto_28019 ) ) ( not ( = ?auto_28008 ?auto_28019 ) ) ( not ( = ?auto_28023 ?auto_28019 ) ) ( not ( = ?auto_28018 ?auto_28019 ) ) ( not ( = ?auto_28022 ?auto_28019 ) ) ( not ( = ?auto_28015 ?auto_28019 ) ) ( SURFACE-AT ?auto_28020 ?auto_28017 ) ( CLEAR ?auto_28020 ) ( IS-CRATE ?auto_28015 ) ( not ( = ?auto_28020 ?auto_28015 ) ) ( not ( = ?auto_28006 ?auto_28020 ) ) ( not ( = ?auto_28007 ?auto_28020 ) ) ( not ( = ?auto_28005 ?auto_28020 ) ) ( not ( = ?auto_28008 ?auto_28020 ) ) ( not ( = ?auto_28023 ?auto_28020 ) ) ( not ( = ?auto_28018 ?auto_28020 ) ) ( not ( = ?auto_28022 ?auto_28020 ) ) ( not ( = ?auto_28019 ?auto_28020 ) ) ( AVAILABLE ?auto_28010 ) ( AVAILABLE ?auto_28011 ) ( SURFACE-AT ?auto_28015 ?auto_28024 ) ( ON ?auto_28015 ?auto_28012 ) ( CLEAR ?auto_28015 ) ( not ( = ?auto_28006 ?auto_28012 ) ) ( not ( = ?auto_28007 ?auto_28012 ) ) ( not ( = ?auto_28005 ?auto_28012 ) ) ( not ( = ?auto_28008 ?auto_28012 ) ) ( not ( = ?auto_28023 ?auto_28012 ) ) ( not ( = ?auto_28018 ?auto_28012 ) ) ( not ( = ?auto_28022 ?auto_28012 ) ) ( not ( = ?auto_28015 ?auto_28012 ) ) ( not ( = ?auto_28019 ?auto_28012 ) ) ( not ( = ?auto_28020 ?auto_28012 ) ) ( TRUCK-AT ?auto_28014 ?auto_28017 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_28006 ?auto_28007 )
      ( MAKE-2CRATE-VERIFY ?auto_28005 ?auto_28006 ?auto_28007 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_28025 - SURFACE
      ?auto_28026 - SURFACE
      ?auto_28027 - SURFACE
      ?auto_28028 - SURFACE
    )
    :vars
    (
      ?auto_28039 - HOIST
      ?auto_28036 - PLACE
      ?auto_28043 - PLACE
      ?auto_28044 - HOIST
      ?auto_28037 - SURFACE
      ?auto_28032 - PLACE
      ?auto_28030 - HOIST
      ?auto_28042 - SURFACE
      ?auto_28040 - SURFACE
      ?auto_28031 - SURFACE
      ?auto_28038 - PLACE
      ?auto_28041 - HOIST
      ?auto_28035 - SURFACE
      ?auto_28029 - SURFACE
      ?auto_28033 - SURFACE
      ?auto_28034 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28039 ?auto_28036 ) ( IS-CRATE ?auto_28028 ) ( not ( = ?auto_28027 ?auto_28028 ) ) ( not ( = ?auto_28026 ?auto_28027 ) ) ( not ( = ?auto_28026 ?auto_28028 ) ) ( not ( = ?auto_28043 ?auto_28036 ) ) ( HOIST-AT ?auto_28044 ?auto_28043 ) ( not ( = ?auto_28039 ?auto_28044 ) ) ( SURFACE-AT ?auto_28028 ?auto_28043 ) ( ON ?auto_28028 ?auto_28037 ) ( CLEAR ?auto_28028 ) ( not ( = ?auto_28027 ?auto_28037 ) ) ( not ( = ?auto_28028 ?auto_28037 ) ) ( not ( = ?auto_28026 ?auto_28037 ) ) ( IS-CRATE ?auto_28027 ) ( not ( = ?auto_28032 ?auto_28036 ) ) ( not ( = ?auto_28043 ?auto_28032 ) ) ( HOIST-AT ?auto_28030 ?auto_28032 ) ( not ( = ?auto_28039 ?auto_28030 ) ) ( not ( = ?auto_28044 ?auto_28030 ) ) ( SURFACE-AT ?auto_28027 ?auto_28032 ) ( ON ?auto_28027 ?auto_28042 ) ( CLEAR ?auto_28027 ) ( not ( = ?auto_28027 ?auto_28042 ) ) ( not ( = ?auto_28028 ?auto_28042 ) ) ( not ( = ?auto_28026 ?auto_28042 ) ) ( not ( = ?auto_28037 ?auto_28042 ) ) ( IS-CRATE ?auto_28026 ) ( not ( = ?auto_28025 ?auto_28026 ) ) ( not ( = ?auto_28027 ?auto_28025 ) ) ( not ( = ?auto_28028 ?auto_28025 ) ) ( not ( = ?auto_28037 ?auto_28025 ) ) ( not ( = ?auto_28042 ?auto_28025 ) ) ( AVAILABLE ?auto_28030 ) ( SURFACE-AT ?auto_28026 ?auto_28032 ) ( ON ?auto_28026 ?auto_28040 ) ( CLEAR ?auto_28026 ) ( not ( = ?auto_28027 ?auto_28040 ) ) ( not ( = ?auto_28028 ?auto_28040 ) ) ( not ( = ?auto_28026 ?auto_28040 ) ) ( not ( = ?auto_28037 ?auto_28040 ) ) ( not ( = ?auto_28042 ?auto_28040 ) ) ( not ( = ?auto_28025 ?auto_28040 ) ) ( IS-CRATE ?auto_28025 ) ( not ( = ?auto_28031 ?auto_28025 ) ) ( not ( = ?auto_28027 ?auto_28031 ) ) ( not ( = ?auto_28028 ?auto_28031 ) ) ( not ( = ?auto_28026 ?auto_28031 ) ) ( not ( = ?auto_28037 ?auto_28031 ) ) ( not ( = ?auto_28042 ?auto_28031 ) ) ( not ( = ?auto_28040 ?auto_28031 ) ) ( not ( = ?auto_28038 ?auto_28036 ) ) ( not ( = ?auto_28043 ?auto_28038 ) ) ( not ( = ?auto_28032 ?auto_28038 ) ) ( HOIST-AT ?auto_28041 ?auto_28038 ) ( not ( = ?auto_28039 ?auto_28041 ) ) ( not ( = ?auto_28044 ?auto_28041 ) ) ( not ( = ?auto_28030 ?auto_28041 ) ) ( AVAILABLE ?auto_28041 ) ( SURFACE-AT ?auto_28025 ?auto_28038 ) ( ON ?auto_28025 ?auto_28035 ) ( CLEAR ?auto_28025 ) ( not ( = ?auto_28027 ?auto_28035 ) ) ( not ( = ?auto_28028 ?auto_28035 ) ) ( not ( = ?auto_28026 ?auto_28035 ) ) ( not ( = ?auto_28037 ?auto_28035 ) ) ( not ( = ?auto_28042 ?auto_28035 ) ) ( not ( = ?auto_28025 ?auto_28035 ) ) ( not ( = ?auto_28040 ?auto_28035 ) ) ( not ( = ?auto_28031 ?auto_28035 ) ) ( SURFACE-AT ?auto_28029 ?auto_28036 ) ( CLEAR ?auto_28029 ) ( IS-CRATE ?auto_28031 ) ( not ( = ?auto_28029 ?auto_28031 ) ) ( not ( = ?auto_28027 ?auto_28029 ) ) ( not ( = ?auto_28028 ?auto_28029 ) ) ( not ( = ?auto_28026 ?auto_28029 ) ) ( not ( = ?auto_28037 ?auto_28029 ) ) ( not ( = ?auto_28042 ?auto_28029 ) ) ( not ( = ?auto_28025 ?auto_28029 ) ) ( not ( = ?auto_28040 ?auto_28029 ) ) ( not ( = ?auto_28035 ?auto_28029 ) ) ( AVAILABLE ?auto_28039 ) ( AVAILABLE ?auto_28044 ) ( SURFACE-AT ?auto_28031 ?auto_28043 ) ( ON ?auto_28031 ?auto_28033 ) ( CLEAR ?auto_28031 ) ( not ( = ?auto_28027 ?auto_28033 ) ) ( not ( = ?auto_28028 ?auto_28033 ) ) ( not ( = ?auto_28026 ?auto_28033 ) ) ( not ( = ?auto_28037 ?auto_28033 ) ) ( not ( = ?auto_28042 ?auto_28033 ) ) ( not ( = ?auto_28025 ?auto_28033 ) ) ( not ( = ?auto_28040 ?auto_28033 ) ) ( not ( = ?auto_28031 ?auto_28033 ) ) ( not ( = ?auto_28035 ?auto_28033 ) ) ( not ( = ?auto_28029 ?auto_28033 ) ) ( TRUCK-AT ?auto_28034 ?auto_28036 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28026 ?auto_28027 ?auto_28028 )
      ( MAKE-3CRATE-VERIFY ?auto_28025 ?auto_28026 ?auto_28027 ?auto_28028 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_28045 - SURFACE
      ?auto_28046 - SURFACE
      ?auto_28047 - SURFACE
      ?auto_28048 - SURFACE
      ?auto_28049 - SURFACE
    )
    :vars
    (
      ?auto_28059 - HOIST
      ?auto_28056 - PLACE
      ?auto_28063 - PLACE
      ?auto_28064 - HOIST
      ?auto_28057 - SURFACE
      ?auto_28052 - PLACE
      ?auto_28051 - HOIST
      ?auto_28062 - SURFACE
      ?auto_28060 - SURFACE
      ?auto_28058 - PLACE
      ?auto_28061 - HOIST
      ?auto_28055 - SURFACE
      ?auto_28050 - SURFACE
      ?auto_28053 - SURFACE
      ?auto_28054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28059 ?auto_28056 ) ( IS-CRATE ?auto_28049 ) ( not ( = ?auto_28048 ?auto_28049 ) ) ( not ( = ?auto_28047 ?auto_28048 ) ) ( not ( = ?auto_28047 ?auto_28049 ) ) ( not ( = ?auto_28063 ?auto_28056 ) ) ( HOIST-AT ?auto_28064 ?auto_28063 ) ( not ( = ?auto_28059 ?auto_28064 ) ) ( SURFACE-AT ?auto_28049 ?auto_28063 ) ( ON ?auto_28049 ?auto_28057 ) ( CLEAR ?auto_28049 ) ( not ( = ?auto_28048 ?auto_28057 ) ) ( not ( = ?auto_28049 ?auto_28057 ) ) ( not ( = ?auto_28047 ?auto_28057 ) ) ( IS-CRATE ?auto_28048 ) ( not ( = ?auto_28052 ?auto_28056 ) ) ( not ( = ?auto_28063 ?auto_28052 ) ) ( HOIST-AT ?auto_28051 ?auto_28052 ) ( not ( = ?auto_28059 ?auto_28051 ) ) ( not ( = ?auto_28064 ?auto_28051 ) ) ( SURFACE-AT ?auto_28048 ?auto_28052 ) ( ON ?auto_28048 ?auto_28062 ) ( CLEAR ?auto_28048 ) ( not ( = ?auto_28048 ?auto_28062 ) ) ( not ( = ?auto_28049 ?auto_28062 ) ) ( not ( = ?auto_28047 ?auto_28062 ) ) ( not ( = ?auto_28057 ?auto_28062 ) ) ( IS-CRATE ?auto_28047 ) ( not ( = ?auto_28046 ?auto_28047 ) ) ( not ( = ?auto_28048 ?auto_28046 ) ) ( not ( = ?auto_28049 ?auto_28046 ) ) ( not ( = ?auto_28057 ?auto_28046 ) ) ( not ( = ?auto_28062 ?auto_28046 ) ) ( AVAILABLE ?auto_28051 ) ( SURFACE-AT ?auto_28047 ?auto_28052 ) ( ON ?auto_28047 ?auto_28060 ) ( CLEAR ?auto_28047 ) ( not ( = ?auto_28048 ?auto_28060 ) ) ( not ( = ?auto_28049 ?auto_28060 ) ) ( not ( = ?auto_28047 ?auto_28060 ) ) ( not ( = ?auto_28057 ?auto_28060 ) ) ( not ( = ?auto_28062 ?auto_28060 ) ) ( not ( = ?auto_28046 ?auto_28060 ) ) ( IS-CRATE ?auto_28046 ) ( not ( = ?auto_28045 ?auto_28046 ) ) ( not ( = ?auto_28048 ?auto_28045 ) ) ( not ( = ?auto_28049 ?auto_28045 ) ) ( not ( = ?auto_28047 ?auto_28045 ) ) ( not ( = ?auto_28057 ?auto_28045 ) ) ( not ( = ?auto_28062 ?auto_28045 ) ) ( not ( = ?auto_28060 ?auto_28045 ) ) ( not ( = ?auto_28058 ?auto_28056 ) ) ( not ( = ?auto_28063 ?auto_28058 ) ) ( not ( = ?auto_28052 ?auto_28058 ) ) ( HOIST-AT ?auto_28061 ?auto_28058 ) ( not ( = ?auto_28059 ?auto_28061 ) ) ( not ( = ?auto_28064 ?auto_28061 ) ) ( not ( = ?auto_28051 ?auto_28061 ) ) ( AVAILABLE ?auto_28061 ) ( SURFACE-AT ?auto_28046 ?auto_28058 ) ( ON ?auto_28046 ?auto_28055 ) ( CLEAR ?auto_28046 ) ( not ( = ?auto_28048 ?auto_28055 ) ) ( not ( = ?auto_28049 ?auto_28055 ) ) ( not ( = ?auto_28047 ?auto_28055 ) ) ( not ( = ?auto_28057 ?auto_28055 ) ) ( not ( = ?auto_28062 ?auto_28055 ) ) ( not ( = ?auto_28046 ?auto_28055 ) ) ( not ( = ?auto_28060 ?auto_28055 ) ) ( not ( = ?auto_28045 ?auto_28055 ) ) ( SURFACE-AT ?auto_28050 ?auto_28056 ) ( CLEAR ?auto_28050 ) ( IS-CRATE ?auto_28045 ) ( not ( = ?auto_28050 ?auto_28045 ) ) ( not ( = ?auto_28048 ?auto_28050 ) ) ( not ( = ?auto_28049 ?auto_28050 ) ) ( not ( = ?auto_28047 ?auto_28050 ) ) ( not ( = ?auto_28057 ?auto_28050 ) ) ( not ( = ?auto_28062 ?auto_28050 ) ) ( not ( = ?auto_28046 ?auto_28050 ) ) ( not ( = ?auto_28060 ?auto_28050 ) ) ( not ( = ?auto_28055 ?auto_28050 ) ) ( AVAILABLE ?auto_28059 ) ( AVAILABLE ?auto_28064 ) ( SURFACE-AT ?auto_28045 ?auto_28063 ) ( ON ?auto_28045 ?auto_28053 ) ( CLEAR ?auto_28045 ) ( not ( = ?auto_28048 ?auto_28053 ) ) ( not ( = ?auto_28049 ?auto_28053 ) ) ( not ( = ?auto_28047 ?auto_28053 ) ) ( not ( = ?auto_28057 ?auto_28053 ) ) ( not ( = ?auto_28062 ?auto_28053 ) ) ( not ( = ?auto_28046 ?auto_28053 ) ) ( not ( = ?auto_28060 ?auto_28053 ) ) ( not ( = ?auto_28045 ?auto_28053 ) ) ( not ( = ?auto_28055 ?auto_28053 ) ) ( not ( = ?auto_28050 ?auto_28053 ) ) ( TRUCK-AT ?auto_28054 ?auto_28056 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28047 ?auto_28048 ?auto_28049 )
      ( MAKE-4CRATE-VERIFY ?auto_28045 ?auto_28046 ?auto_28047 ?auto_28048 ?auto_28049 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_28065 - SURFACE
      ?auto_28066 - SURFACE
      ?auto_28067 - SURFACE
      ?auto_28068 - SURFACE
      ?auto_28069 - SURFACE
      ?auto_28070 - SURFACE
    )
    :vars
    (
      ?auto_28079 - HOIST
      ?auto_28076 - PLACE
      ?auto_28083 - PLACE
      ?auto_28084 - HOIST
      ?auto_28077 - SURFACE
      ?auto_28072 - PLACE
      ?auto_28071 - HOIST
      ?auto_28082 - SURFACE
      ?auto_28080 - SURFACE
      ?auto_28078 - PLACE
      ?auto_28081 - HOIST
      ?auto_28075 - SURFACE
      ?auto_28073 - SURFACE
      ?auto_28074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_28079 ?auto_28076 ) ( IS-CRATE ?auto_28070 ) ( not ( = ?auto_28069 ?auto_28070 ) ) ( not ( = ?auto_28068 ?auto_28069 ) ) ( not ( = ?auto_28068 ?auto_28070 ) ) ( not ( = ?auto_28083 ?auto_28076 ) ) ( HOIST-AT ?auto_28084 ?auto_28083 ) ( not ( = ?auto_28079 ?auto_28084 ) ) ( SURFACE-AT ?auto_28070 ?auto_28083 ) ( ON ?auto_28070 ?auto_28077 ) ( CLEAR ?auto_28070 ) ( not ( = ?auto_28069 ?auto_28077 ) ) ( not ( = ?auto_28070 ?auto_28077 ) ) ( not ( = ?auto_28068 ?auto_28077 ) ) ( IS-CRATE ?auto_28069 ) ( not ( = ?auto_28072 ?auto_28076 ) ) ( not ( = ?auto_28083 ?auto_28072 ) ) ( HOIST-AT ?auto_28071 ?auto_28072 ) ( not ( = ?auto_28079 ?auto_28071 ) ) ( not ( = ?auto_28084 ?auto_28071 ) ) ( SURFACE-AT ?auto_28069 ?auto_28072 ) ( ON ?auto_28069 ?auto_28082 ) ( CLEAR ?auto_28069 ) ( not ( = ?auto_28069 ?auto_28082 ) ) ( not ( = ?auto_28070 ?auto_28082 ) ) ( not ( = ?auto_28068 ?auto_28082 ) ) ( not ( = ?auto_28077 ?auto_28082 ) ) ( IS-CRATE ?auto_28068 ) ( not ( = ?auto_28067 ?auto_28068 ) ) ( not ( = ?auto_28069 ?auto_28067 ) ) ( not ( = ?auto_28070 ?auto_28067 ) ) ( not ( = ?auto_28077 ?auto_28067 ) ) ( not ( = ?auto_28082 ?auto_28067 ) ) ( AVAILABLE ?auto_28071 ) ( SURFACE-AT ?auto_28068 ?auto_28072 ) ( ON ?auto_28068 ?auto_28080 ) ( CLEAR ?auto_28068 ) ( not ( = ?auto_28069 ?auto_28080 ) ) ( not ( = ?auto_28070 ?auto_28080 ) ) ( not ( = ?auto_28068 ?auto_28080 ) ) ( not ( = ?auto_28077 ?auto_28080 ) ) ( not ( = ?auto_28082 ?auto_28080 ) ) ( not ( = ?auto_28067 ?auto_28080 ) ) ( IS-CRATE ?auto_28067 ) ( not ( = ?auto_28066 ?auto_28067 ) ) ( not ( = ?auto_28069 ?auto_28066 ) ) ( not ( = ?auto_28070 ?auto_28066 ) ) ( not ( = ?auto_28068 ?auto_28066 ) ) ( not ( = ?auto_28077 ?auto_28066 ) ) ( not ( = ?auto_28082 ?auto_28066 ) ) ( not ( = ?auto_28080 ?auto_28066 ) ) ( not ( = ?auto_28078 ?auto_28076 ) ) ( not ( = ?auto_28083 ?auto_28078 ) ) ( not ( = ?auto_28072 ?auto_28078 ) ) ( HOIST-AT ?auto_28081 ?auto_28078 ) ( not ( = ?auto_28079 ?auto_28081 ) ) ( not ( = ?auto_28084 ?auto_28081 ) ) ( not ( = ?auto_28071 ?auto_28081 ) ) ( AVAILABLE ?auto_28081 ) ( SURFACE-AT ?auto_28067 ?auto_28078 ) ( ON ?auto_28067 ?auto_28075 ) ( CLEAR ?auto_28067 ) ( not ( = ?auto_28069 ?auto_28075 ) ) ( not ( = ?auto_28070 ?auto_28075 ) ) ( not ( = ?auto_28068 ?auto_28075 ) ) ( not ( = ?auto_28077 ?auto_28075 ) ) ( not ( = ?auto_28082 ?auto_28075 ) ) ( not ( = ?auto_28067 ?auto_28075 ) ) ( not ( = ?auto_28080 ?auto_28075 ) ) ( not ( = ?auto_28066 ?auto_28075 ) ) ( SURFACE-AT ?auto_28065 ?auto_28076 ) ( CLEAR ?auto_28065 ) ( IS-CRATE ?auto_28066 ) ( not ( = ?auto_28065 ?auto_28066 ) ) ( not ( = ?auto_28069 ?auto_28065 ) ) ( not ( = ?auto_28070 ?auto_28065 ) ) ( not ( = ?auto_28068 ?auto_28065 ) ) ( not ( = ?auto_28077 ?auto_28065 ) ) ( not ( = ?auto_28082 ?auto_28065 ) ) ( not ( = ?auto_28067 ?auto_28065 ) ) ( not ( = ?auto_28080 ?auto_28065 ) ) ( not ( = ?auto_28075 ?auto_28065 ) ) ( AVAILABLE ?auto_28079 ) ( AVAILABLE ?auto_28084 ) ( SURFACE-AT ?auto_28066 ?auto_28083 ) ( ON ?auto_28066 ?auto_28073 ) ( CLEAR ?auto_28066 ) ( not ( = ?auto_28069 ?auto_28073 ) ) ( not ( = ?auto_28070 ?auto_28073 ) ) ( not ( = ?auto_28068 ?auto_28073 ) ) ( not ( = ?auto_28077 ?auto_28073 ) ) ( not ( = ?auto_28082 ?auto_28073 ) ) ( not ( = ?auto_28067 ?auto_28073 ) ) ( not ( = ?auto_28080 ?auto_28073 ) ) ( not ( = ?auto_28066 ?auto_28073 ) ) ( not ( = ?auto_28075 ?auto_28073 ) ) ( not ( = ?auto_28065 ?auto_28073 ) ) ( TRUCK-AT ?auto_28074 ?auto_28076 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_28068 ?auto_28069 ?auto_28070 )
      ( MAKE-5CRATE-VERIFY ?auto_28065 ?auto_28066 ?auto_28067 ?auto_28068 ?auto_28069 ?auto_28070 ) )
  )

)

