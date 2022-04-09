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

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98958 - SURFACE
      ?auto_98959 - SURFACE
    )
    :vars
    (
      ?auto_98960 - HOIST
      ?auto_98961 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_98960 ?auto_98961 ) ( SURFACE-AT ?auto_98958 ?auto_98961 ) ( CLEAR ?auto_98958 ) ( LIFTING ?auto_98960 ?auto_98959 ) ( IS-CRATE ?auto_98959 ) ( not ( = ?auto_98958 ?auto_98959 ) ) )
    :subtasks
    ( ( !DROP ?auto_98960 ?auto_98959 ?auto_98958 ?auto_98961 )
      ( MAKE-1CRATE-VERIFY ?auto_98958 ?auto_98959 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98962 - SURFACE
      ?auto_98963 - SURFACE
    )
    :vars
    (
      ?auto_98964 - HOIST
      ?auto_98965 - PLACE
      ?auto_98966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_98964 ?auto_98965 ) ( SURFACE-AT ?auto_98962 ?auto_98965 ) ( CLEAR ?auto_98962 ) ( IS-CRATE ?auto_98963 ) ( not ( = ?auto_98962 ?auto_98963 ) ) ( TRUCK-AT ?auto_98966 ?auto_98965 ) ( AVAILABLE ?auto_98964 ) ( IN ?auto_98963 ?auto_98966 ) )
    :subtasks
    ( ( !UNLOAD ?auto_98964 ?auto_98963 ?auto_98966 ?auto_98965 )
      ( MAKE-1CRATE ?auto_98962 ?auto_98963 )
      ( MAKE-1CRATE-VERIFY ?auto_98962 ?auto_98963 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98967 - SURFACE
      ?auto_98968 - SURFACE
    )
    :vars
    (
      ?auto_98970 - HOIST
      ?auto_98969 - PLACE
      ?auto_98971 - TRUCK
      ?auto_98972 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_98970 ?auto_98969 ) ( SURFACE-AT ?auto_98967 ?auto_98969 ) ( CLEAR ?auto_98967 ) ( IS-CRATE ?auto_98968 ) ( not ( = ?auto_98967 ?auto_98968 ) ) ( AVAILABLE ?auto_98970 ) ( IN ?auto_98968 ?auto_98971 ) ( TRUCK-AT ?auto_98971 ?auto_98972 ) ( not ( = ?auto_98972 ?auto_98969 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_98971 ?auto_98972 ?auto_98969 )
      ( MAKE-1CRATE ?auto_98967 ?auto_98968 )
      ( MAKE-1CRATE-VERIFY ?auto_98967 ?auto_98968 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98973 - SURFACE
      ?auto_98974 - SURFACE
    )
    :vars
    (
      ?auto_98976 - HOIST
      ?auto_98978 - PLACE
      ?auto_98975 - TRUCK
      ?auto_98977 - PLACE
      ?auto_98979 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_98976 ?auto_98978 ) ( SURFACE-AT ?auto_98973 ?auto_98978 ) ( CLEAR ?auto_98973 ) ( IS-CRATE ?auto_98974 ) ( not ( = ?auto_98973 ?auto_98974 ) ) ( AVAILABLE ?auto_98976 ) ( TRUCK-AT ?auto_98975 ?auto_98977 ) ( not ( = ?auto_98977 ?auto_98978 ) ) ( HOIST-AT ?auto_98979 ?auto_98977 ) ( LIFTING ?auto_98979 ?auto_98974 ) ( not ( = ?auto_98976 ?auto_98979 ) ) )
    :subtasks
    ( ( !LOAD ?auto_98979 ?auto_98974 ?auto_98975 ?auto_98977 )
      ( MAKE-1CRATE ?auto_98973 ?auto_98974 )
      ( MAKE-1CRATE-VERIFY ?auto_98973 ?auto_98974 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98980 - SURFACE
      ?auto_98981 - SURFACE
    )
    :vars
    (
      ?auto_98986 - HOIST
      ?auto_98982 - PLACE
      ?auto_98985 - TRUCK
      ?auto_98983 - PLACE
      ?auto_98984 - HOIST
      ?auto_98987 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_98986 ?auto_98982 ) ( SURFACE-AT ?auto_98980 ?auto_98982 ) ( CLEAR ?auto_98980 ) ( IS-CRATE ?auto_98981 ) ( not ( = ?auto_98980 ?auto_98981 ) ) ( AVAILABLE ?auto_98986 ) ( TRUCK-AT ?auto_98985 ?auto_98983 ) ( not ( = ?auto_98983 ?auto_98982 ) ) ( HOIST-AT ?auto_98984 ?auto_98983 ) ( not ( = ?auto_98986 ?auto_98984 ) ) ( AVAILABLE ?auto_98984 ) ( SURFACE-AT ?auto_98981 ?auto_98983 ) ( ON ?auto_98981 ?auto_98987 ) ( CLEAR ?auto_98981 ) ( not ( = ?auto_98980 ?auto_98987 ) ) ( not ( = ?auto_98981 ?auto_98987 ) ) )
    :subtasks
    ( ( !LIFT ?auto_98984 ?auto_98981 ?auto_98987 ?auto_98983 )
      ( MAKE-1CRATE ?auto_98980 ?auto_98981 )
      ( MAKE-1CRATE-VERIFY ?auto_98980 ?auto_98981 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_98988 - SURFACE
      ?auto_98989 - SURFACE
    )
    :vars
    (
      ?auto_98995 - HOIST
      ?auto_98992 - PLACE
      ?auto_98991 - PLACE
      ?auto_98994 - HOIST
      ?auto_98993 - SURFACE
      ?auto_98990 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_98995 ?auto_98992 ) ( SURFACE-AT ?auto_98988 ?auto_98992 ) ( CLEAR ?auto_98988 ) ( IS-CRATE ?auto_98989 ) ( not ( = ?auto_98988 ?auto_98989 ) ) ( AVAILABLE ?auto_98995 ) ( not ( = ?auto_98991 ?auto_98992 ) ) ( HOIST-AT ?auto_98994 ?auto_98991 ) ( not ( = ?auto_98995 ?auto_98994 ) ) ( AVAILABLE ?auto_98994 ) ( SURFACE-AT ?auto_98989 ?auto_98991 ) ( ON ?auto_98989 ?auto_98993 ) ( CLEAR ?auto_98989 ) ( not ( = ?auto_98988 ?auto_98993 ) ) ( not ( = ?auto_98989 ?auto_98993 ) ) ( TRUCK-AT ?auto_98990 ?auto_98992 ) )
    :subtasks
    ( ( !DRIVE ?auto_98990 ?auto_98992 ?auto_98991 )
      ( MAKE-1CRATE ?auto_98988 ?auto_98989 )
      ( MAKE-1CRATE-VERIFY ?auto_98988 ?auto_98989 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_99005 - SURFACE
      ?auto_99006 - SURFACE
      ?auto_99007 - SURFACE
    )
    :vars
    (
      ?auto_99009 - HOIST
      ?auto_99008 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99009 ?auto_99008 ) ( SURFACE-AT ?auto_99006 ?auto_99008 ) ( CLEAR ?auto_99006 ) ( LIFTING ?auto_99009 ?auto_99007 ) ( IS-CRATE ?auto_99007 ) ( not ( = ?auto_99006 ?auto_99007 ) ) ( ON ?auto_99006 ?auto_99005 ) ( not ( = ?auto_99005 ?auto_99006 ) ) ( not ( = ?auto_99005 ?auto_99007 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99006 ?auto_99007 )
      ( MAKE-2CRATE-VERIFY ?auto_99005 ?auto_99006 ?auto_99007 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_99015 - SURFACE
      ?auto_99016 - SURFACE
      ?auto_99017 - SURFACE
    )
    :vars
    (
      ?auto_99019 - HOIST
      ?auto_99020 - PLACE
      ?auto_99018 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99019 ?auto_99020 ) ( SURFACE-AT ?auto_99016 ?auto_99020 ) ( CLEAR ?auto_99016 ) ( IS-CRATE ?auto_99017 ) ( not ( = ?auto_99016 ?auto_99017 ) ) ( TRUCK-AT ?auto_99018 ?auto_99020 ) ( AVAILABLE ?auto_99019 ) ( IN ?auto_99017 ?auto_99018 ) ( ON ?auto_99016 ?auto_99015 ) ( not ( = ?auto_99015 ?auto_99016 ) ) ( not ( = ?auto_99015 ?auto_99017 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99016 ?auto_99017 )
      ( MAKE-2CRATE-VERIFY ?auto_99015 ?auto_99016 ?auto_99017 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_99021 - SURFACE
      ?auto_99022 - SURFACE
    )
    :vars
    (
      ?auto_99026 - HOIST
      ?auto_99023 - PLACE
      ?auto_99024 - TRUCK
      ?auto_99025 - SURFACE
      ?auto_99027 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99026 ?auto_99023 ) ( SURFACE-AT ?auto_99021 ?auto_99023 ) ( CLEAR ?auto_99021 ) ( IS-CRATE ?auto_99022 ) ( not ( = ?auto_99021 ?auto_99022 ) ) ( AVAILABLE ?auto_99026 ) ( IN ?auto_99022 ?auto_99024 ) ( ON ?auto_99021 ?auto_99025 ) ( not ( = ?auto_99025 ?auto_99021 ) ) ( not ( = ?auto_99025 ?auto_99022 ) ) ( TRUCK-AT ?auto_99024 ?auto_99027 ) ( not ( = ?auto_99027 ?auto_99023 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_99024 ?auto_99027 ?auto_99023 )
      ( MAKE-2CRATE ?auto_99025 ?auto_99021 ?auto_99022 )
      ( MAKE-1CRATE-VERIFY ?auto_99021 ?auto_99022 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_99028 - SURFACE
      ?auto_99029 - SURFACE
      ?auto_99030 - SURFACE
    )
    :vars
    (
      ?auto_99033 - HOIST
      ?auto_99032 - PLACE
      ?auto_99034 - TRUCK
      ?auto_99031 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99033 ?auto_99032 ) ( SURFACE-AT ?auto_99029 ?auto_99032 ) ( CLEAR ?auto_99029 ) ( IS-CRATE ?auto_99030 ) ( not ( = ?auto_99029 ?auto_99030 ) ) ( AVAILABLE ?auto_99033 ) ( IN ?auto_99030 ?auto_99034 ) ( ON ?auto_99029 ?auto_99028 ) ( not ( = ?auto_99028 ?auto_99029 ) ) ( not ( = ?auto_99028 ?auto_99030 ) ) ( TRUCK-AT ?auto_99034 ?auto_99031 ) ( not ( = ?auto_99031 ?auto_99032 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99029 ?auto_99030 )
      ( MAKE-2CRATE-VERIFY ?auto_99028 ?auto_99029 ?auto_99030 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_99035 - SURFACE
      ?auto_99036 - SURFACE
    )
    :vars
    (
      ?auto_99040 - HOIST
      ?auto_99039 - PLACE
      ?auto_99041 - SURFACE
      ?auto_99037 - TRUCK
      ?auto_99038 - PLACE
      ?auto_99042 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_99040 ?auto_99039 ) ( SURFACE-AT ?auto_99035 ?auto_99039 ) ( CLEAR ?auto_99035 ) ( IS-CRATE ?auto_99036 ) ( not ( = ?auto_99035 ?auto_99036 ) ) ( AVAILABLE ?auto_99040 ) ( ON ?auto_99035 ?auto_99041 ) ( not ( = ?auto_99041 ?auto_99035 ) ) ( not ( = ?auto_99041 ?auto_99036 ) ) ( TRUCK-AT ?auto_99037 ?auto_99038 ) ( not ( = ?auto_99038 ?auto_99039 ) ) ( HOIST-AT ?auto_99042 ?auto_99038 ) ( LIFTING ?auto_99042 ?auto_99036 ) ( not ( = ?auto_99040 ?auto_99042 ) ) )
    :subtasks
    ( ( !LOAD ?auto_99042 ?auto_99036 ?auto_99037 ?auto_99038 )
      ( MAKE-2CRATE ?auto_99041 ?auto_99035 ?auto_99036 )
      ( MAKE-1CRATE-VERIFY ?auto_99035 ?auto_99036 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_99043 - SURFACE
      ?auto_99044 - SURFACE
      ?auto_99045 - SURFACE
    )
    :vars
    (
      ?auto_99046 - HOIST
      ?auto_99047 - PLACE
      ?auto_99048 - TRUCK
      ?auto_99050 - PLACE
      ?auto_99049 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_99046 ?auto_99047 ) ( SURFACE-AT ?auto_99044 ?auto_99047 ) ( CLEAR ?auto_99044 ) ( IS-CRATE ?auto_99045 ) ( not ( = ?auto_99044 ?auto_99045 ) ) ( AVAILABLE ?auto_99046 ) ( ON ?auto_99044 ?auto_99043 ) ( not ( = ?auto_99043 ?auto_99044 ) ) ( not ( = ?auto_99043 ?auto_99045 ) ) ( TRUCK-AT ?auto_99048 ?auto_99050 ) ( not ( = ?auto_99050 ?auto_99047 ) ) ( HOIST-AT ?auto_99049 ?auto_99050 ) ( LIFTING ?auto_99049 ?auto_99045 ) ( not ( = ?auto_99046 ?auto_99049 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99044 ?auto_99045 )
      ( MAKE-2CRATE-VERIFY ?auto_99043 ?auto_99044 ?auto_99045 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_99051 - SURFACE
      ?auto_99052 - SURFACE
    )
    :vars
    (
      ?auto_99058 - HOIST
      ?auto_99057 - PLACE
      ?auto_99054 - SURFACE
      ?auto_99053 - TRUCK
      ?auto_99055 - PLACE
      ?auto_99056 - HOIST
      ?auto_99059 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99058 ?auto_99057 ) ( SURFACE-AT ?auto_99051 ?auto_99057 ) ( CLEAR ?auto_99051 ) ( IS-CRATE ?auto_99052 ) ( not ( = ?auto_99051 ?auto_99052 ) ) ( AVAILABLE ?auto_99058 ) ( ON ?auto_99051 ?auto_99054 ) ( not ( = ?auto_99054 ?auto_99051 ) ) ( not ( = ?auto_99054 ?auto_99052 ) ) ( TRUCK-AT ?auto_99053 ?auto_99055 ) ( not ( = ?auto_99055 ?auto_99057 ) ) ( HOIST-AT ?auto_99056 ?auto_99055 ) ( not ( = ?auto_99058 ?auto_99056 ) ) ( AVAILABLE ?auto_99056 ) ( SURFACE-AT ?auto_99052 ?auto_99055 ) ( ON ?auto_99052 ?auto_99059 ) ( CLEAR ?auto_99052 ) ( not ( = ?auto_99051 ?auto_99059 ) ) ( not ( = ?auto_99052 ?auto_99059 ) ) ( not ( = ?auto_99054 ?auto_99059 ) ) )
    :subtasks
    ( ( !LIFT ?auto_99056 ?auto_99052 ?auto_99059 ?auto_99055 )
      ( MAKE-2CRATE ?auto_99054 ?auto_99051 ?auto_99052 )
      ( MAKE-1CRATE-VERIFY ?auto_99051 ?auto_99052 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_99060 - SURFACE
      ?auto_99061 - SURFACE
      ?auto_99062 - SURFACE
    )
    :vars
    (
      ?auto_99064 - HOIST
      ?auto_99063 - PLACE
      ?auto_99066 - TRUCK
      ?auto_99068 - PLACE
      ?auto_99067 - HOIST
      ?auto_99065 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99064 ?auto_99063 ) ( SURFACE-AT ?auto_99061 ?auto_99063 ) ( CLEAR ?auto_99061 ) ( IS-CRATE ?auto_99062 ) ( not ( = ?auto_99061 ?auto_99062 ) ) ( AVAILABLE ?auto_99064 ) ( ON ?auto_99061 ?auto_99060 ) ( not ( = ?auto_99060 ?auto_99061 ) ) ( not ( = ?auto_99060 ?auto_99062 ) ) ( TRUCK-AT ?auto_99066 ?auto_99068 ) ( not ( = ?auto_99068 ?auto_99063 ) ) ( HOIST-AT ?auto_99067 ?auto_99068 ) ( not ( = ?auto_99064 ?auto_99067 ) ) ( AVAILABLE ?auto_99067 ) ( SURFACE-AT ?auto_99062 ?auto_99068 ) ( ON ?auto_99062 ?auto_99065 ) ( CLEAR ?auto_99062 ) ( not ( = ?auto_99061 ?auto_99065 ) ) ( not ( = ?auto_99062 ?auto_99065 ) ) ( not ( = ?auto_99060 ?auto_99065 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99061 ?auto_99062 )
      ( MAKE-2CRATE-VERIFY ?auto_99060 ?auto_99061 ?auto_99062 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_99069 - SURFACE
      ?auto_99070 - SURFACE
    )
    :vars
    (
      ?auto_99075 - HOIST
      ?auto_99076 - PLACE
      ?auto_99071 - SURFACE
      ?auto_99077 - PLACE
      ?auto_99074 - HOIST
      ?auto_99072 - SURFACE
      ?auto_99073 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99075 ?auto_99076 ) ( SURFACE-AT ?auto_99069 ?auto_99076 ) ( CLEAR ?auto_99069 ) ( IS-CRATE ?auto_99070 ) ( not ( = ?auto_99069 ?auto_99070 ) ) ( AVAILABLE ?auto_99075 ) ( ON ?auto_99069 ?auto_99071 ) ( not ( = ?auto_99071 ?auto_99069 ) ) ( not ( = ?auto_99071 ?auto_99070 ) ) ( not ( = ?auto_99077 ?auto_99076 ) ) ( HOIST-AT ?auto_99074 ?auto_99077 ) ( not ( = ?auto_99075 ?auto_99074 ) ) ( AVAILABLE ?auto_99074 ) ( SURFACE-AT ?auto_99070 ?auto_99077 ) ( ON ?auto_99070 ?auto_99072 ) ( CLEAR ?auto_99070 ) ( not ( = ?auto_99069 ?auto_99072 ) ) ( not ( = ?auto_99070 ?auto_99072 ) ) ( not ( = ?auto_99071 ?auto_99072 ) ) ( TRUCK-AT ?auto_99073 ?auto_99076 ) )
    :subtasks
    ( ( !DRIVE ?auto_99073 ?auto_99076 ?auto_99077 )
      ( MAKE-2CRATE ?auto_99071 ?auto_99069 ?auto_99070 )
      ( MAKE-1CRATE-VERIFY ?auto_99069 ?auto_99070 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_99078 - SURFACE
      ?auto_99079 - SURFACE
      ?auto_99080 - SURFACE
    )
    :vars
    (
      ?auto_99085 - HOIST
      ?auto_99086 - PLACE
      ?auto_99084 - PLACE
      ?auto_99083 - HOIST
      ?auto_99082 - SURFACE
      ?auto_99081 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99085 ?auto_99086 ) ( SURFACE-AT ?auto_99079 ?auto_99086 ) ( CLEAR ?auto_99079 ) ( IS-CRATE ?auto_99080 ) ( not ( = ?auto_99079 ?auto_99080 ) ) ( AVAILABLE ?auto_99085 ) ( ON ?auto_99079 ?auto_99078 ) ( not ( = ?auto_99078 ?auto_99079 ) ) ( not ( = ?auto_99078 ?auto_99080 ) ) ( not ( = ?auto_99084 ?auto_99086 ) ) ( HOIST-AT ?auto_99083 ?auto_99084 ) ( not ( = ?auto_99085 ?auto_99083 ) ) ( AVAILABLE ?auto_99083 ) ( SURFACE-AT ?auto_99080 ?auto_99084 ) ( ON ?auto_99080 ?auto_99082 ) ( CLEAR ?auto_99080 ) ( not ( = ?auto_99079 ?auto_99082 ) ) ( not ( = ?auto_99080 ?auto_99082 ) ) ( not ( = ?auto_99078 ?auto_99082 ) ) ( TRUCK-AT ?auto_99081 ?auto_99086 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99079 ?auto_99080 )
      ( MAKE-2CRATE-VERIFY ?auto_99078 ?auto_99079 ?auto_99080 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_99087 - SURFACE
      ?auto_99088 - SURFACE
    )
    :vars
    (
      ?auto_99089 - HOIST
      ?auto_99094 - PLACE
      ?auto_99095 - SURFACE
      ?auto_99093 - PLACE
      ?auto_99090 - HOIST
      ?auto_99092 - SURFACE
      ?auto_99091 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99089 ?auto_99094 ) ( IS-CRATE ?auto_99088 ) ( not ( = ?auto_99087 ?auto_99088 ) ) ( not ( = ?auto_99095 ?auto_99087 ) ) ( not ( = ?auto_99095 ?auto_99088 ) ) ( not ( = ?auto_99093 ?auto_99094 ) ) ( HOIST-AT ?auto_99090 ?auto_99093 ) ( not ( = ?auto_99089 ?auto_99090 ) ) ( AVAILABLE ?auto_99090 ) ( SURFACE-AT ?auto_99088 ?auto_99093 ) ( ON ?auto_99088 ?auto_99092 ) ( CLEAR ?auto_99088 ) ( not ( = ?auto_99087 ?auto_99092 ) ) ( not ( = ?auto_99088 ?auto_99092 ) ) ( not ( = ?auto_99095 ?auto_99092 ) ) ( TRUCK-AT ?auto_99091 ?auto_99094 ) ( SURFACE-AT ?auto_99095 ?auto_99094 ) ( CLEAR ?auto_99095 ) ( LIFTING ?auto_99089 ?auto_99087 ) ( IS-CRATE ?auto_99087 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99095 ?auto_99087 )
      ( MAKE-2CRATE ?auto_99095 ?auto_99087 ?auto_99088 )
      ( MAKE-1CRATE-VERIFY ?auto_99087 ?auto_99088 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_99096 - SURFACE
      ?auto_99097 - SURFACE
      ?auto_99098 - SURFACE
    )
    :vars
    (
      ?auto_99104 - HOIST
      ?auto_99099 - PLACE
      ?auto_99101 - PLACE
      ?auto_99103 - HOIST
      ?auto_99102 - SURFACE
      ?auto_99100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99104 ?auto_99099 ) ( IS-CRATE ?auto_99098 ) ( not ( = ?auto_99097 ?auto_99098 ) ) ( not ( = ?auto_99096 ?auto_99097 ) ) ( not ( = ?auto_99096 ?auto_99098 ) ) ( not ( = ?auto_99101 ?auto_99099 ) ) ( HOIST-AT ?auto_99103 ?auto_99101 ) ( not ( = ?auto_99104 ?auto_99103 ) ) ( AVAILABLE ?auto_99103 ) ( SURFACE-AT ?auto_99098 ?auto_99101 ) ( ON ?auto_99098 ?auto_99102 ) ( CLEAR ?auto_99098 ) ( not ( = ?auto_99097 ?auto_99102 ) ) ( not ( = ?auto_99098 ?auto_99102 ) ) ( not ( = ?auto_99096 ?auto_99102 ) ) ( TRUCK-AT ?auto_99100 ?auto_99099 ) ( SURFACE-AT ?auto_99096 ?auto_99099 ) ( CLEAR ?auto_99096 ) ( LIFTING ?auto_99104 ?auto_99097 ) ( IS-CRATE ?auto_99097 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99097 ?auto_99098 )
      ( MAKE-2CRATE-VERIFY ?auto_99096 ?auto_99097 ?auto_99098 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_99105 - SURFACE
      ?auto_99106 - SURFACE
    )
    :vars
    (
      ?auto_99107 - HOIST
      ?auto_99109 - PLACE
      ?auto_99108 - SURFACE
      ?auto_99111 - PLACE
      ?auto_99113 - HOIST
      ?auto_99112 - SURFACE
      ?auto_99110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99107 ?auto_99109 ) ( IS-CRATE ?auto_99106 ) ( not ( = ?auto_99105 ?auto_99106 ) ) ( not ( = ?auto_99108 ?auto_99105 ) ) ( not ( = ?auto_99108 ?auto_99106 ) ) ( not ( = ?auto_99111 ?auto_99109 ) ) ( HOIST-AT ?auto_99113 ?auto_99111 ) ( not ( = ?auto_99107 ?auto_99113 ) ) ( AVAILABLE ?auto_99113 ) ( SURFACE-AT ?auto_99106 ?auto_99111 ) ( ON ?auto_99106 ?auto_99112 ) ( CLEAR ?auto_99106 ) ( not ( = ?auto_99105 ?auto_99112 ) ) ( not ( = ?auto_99106 ?auto_99112 ) ) ( not ( = ?auto_99108 ?auto_99112 ) ) ( TRUCK-AT ?auto_99110 ?auto_99109 ) ( SURFACE-AT ?auto_99108 ?auto_99109 ) ( CLEAR ?auto_99108 ) ( IS-CRATE ?auto_99105 ) ( AVAILABLE ?auto_99107 ) ( IN ?auto_99105 ?auto_99110 ) )
    :subtasks
    ( ( !UNLOAD ?auto_99107 ?auto_99105 ?auto_99110 ?auto_99109 )
      ( MAKE-2CRATE ?auto_99108 ?auto_99105 ?auto_99106 )
      ( MAKE-1CRATE-VERIFY ?auto_99105 ?auto_99106 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_99114 - SURFACE
      ?auto_99115 - SURFACE
      ?auto_99116 - SURFACE
    )
    :vars
    (
      ?auto_99117 - HOIST
      ?auto_99122 - PLACE
      ?auto_99121 - PLACE
      ?auto_99118 - HOIST
      ?auto_99119 - SURFACE
      ?auto_99120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99117 ?auto_99122 ) ( IS-CRATE ?auto_99116 ) ( not ( = ?auto_99115 ?auto_99116 ) ) ( not ( = ?auto_99114 ?auto_99115 ) ) ( not ( = ?auto_99114 ?auto_99116 ) ) ( not ( = ?auto_99121 ?auto_99122 ) ) ( HOIST-AT ?auto_99118 ?auto_99121 ) ( not ( = ?auto_99117 ?auto_99118 ) ) ( AVAILABLE ?auto_99118 ) ( SURFACE-AT ?auto_99116 ?auto_99121 ) ( ON ?auto_99116 ?auto_99119 ) ( CLEAR ?auto_99116 ) ( not ( = ?auto_99115 ?auto_99119 ) ) ( not ( = ?auto_99116 ?auto_99119 ) ) ( not ( = ?auto_99114 ?auto_99119 ) ) ( TRUCK-AT ?auto_99120 ?auto_99122 ) ( SURFACE-AT ?auto_99114 ?auto_99122 ) ( CLEAR ?auto_99114 ) ( IS-CRATE ?auto_99115 ) ( AVAILABLE ?auto_99117 ) ( IN ?auto_99115 ?auto_99120 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99115 ?auto_99116 )
      ( MAKE-2CRATE-VERIFY ?auto_99114 ?auto_99115 ?auto_99116 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_99159 - SURFACE
      ?auto_99160 - SURFACE
    )
    :vars
    (
      ?auto_99166 - HOIST
      ?auto_99167 - PLACE
      ?auto_99164 - SURFACE
      ?auto_99165 - PLACE
      ?auto_99162 - HOIST
      ?auto_99161 - SURFACE
      ?auto_99163 - TRUCK
      ?auto_99168 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99166 ?auto_99167 ) ( SURFACE-AT ?auto_99159 ?auto_99167 ) ( CLEAR ?auto_99159 ) ( IS-CRATE ?auto_99160 ) ( not ( = ?auto_99159 ?auto_99160 ) ) ( AVAILABLE ?auto_99166 ) ( ON ?auto_99159 ?auto_99164 ) ( not ( = ?auto_99164 ?auto_99159 ) ) ( not ( = ?auto_99164 ?auto_99160 ) ) ( not ( = ?auto_99165 ?auto_99167 ) ) ( HOIST-AT ?auto_99162 ?auto_99165 ) ( not ( = ?auto_99166 ?auto_99162 ) ) ( AVAILABLE ?auto_99162 ) ( SURFACE-AT ?auto_99160 ?auto_99165 ) ( ON ?auto_99160 ?auto_99161 ) ( CLEAR ?auto_99160 ) ( not ( = ?auto_99159 ?auto_99161 ) ) ( not ( = ?auto_99160 ?auto_99161 ) ) ( not ( = ?auto_99164 ?auto_99161 ) ) ( TRUCK-AT ?auto_99163 ?auto_99168 ) ( not ( = ?auto_99168 ?auto_99167 ) ) ( not ( = ?auto_99165 ?auto_99168 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_99163 ?auto_99168 ?auto_99167 )
      ( MAKE-1CRATE ?auto_99159 ?auto_99160 )
      ( MAKE-1CRATE-VERIFY ?auto_99159 ?auto_99160 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99198 - SURFACE
      ?auto_99199 - SURFACE
      ?auto_99200 - SURFACE
      ?auto_99201 - SURFACE
    )
    :vars
    (
      ?auto_99202 - HOIST
      ?auto_99203 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99202 ?auto_99203 ) ( SURFACE-AT ?auto_99200 ?auto_99203 ) ( CLEAR ?auto_99200 ) ( LIFTING ?auto_99202 ?auto_99201 ) ( IS-CRATE ?auto_99201 ) ( not ( = ?auto_99200 ?auto_99201 ) ) ( ON ?auto_99199 ?auto_99198 ) ( ON ?auto_99200 ?auto_99199 ) ( not ( = ?auto_99198 ?auto_99199 ) ) ( not ( = ?auto_99198 ?auto_99200 ) ) ( not ( = ?auto_99198 ?auto_99201 ) ) ( not ( = ?auto_99199 ?auto_99200 ) ) ( not ( = ?auto_99199 ?auto_99201 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99200 ?auto_99201 )
      ( MAKE-3CRATE-VERIFY ?auto_99198 ?auto_99199 ?auto_99200 ?auto_99201 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99215 - SURFACE
      ?auto_99216 - SURFACE
      ?auto_99217 - SURFACE
      ?auto_99218 - SURFACE
    )
    :vars
    (
      ?auto_99219 - HOIST
      ?auto_99220 - PLACE
      ?auto_99221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99219 ?auto_99220 ) ( SURFACE-AT ?auto_99217 ?auto_99220 ) ( CLEAR ?auto_99217 ) ( IS-CRATE ?auto_99218 ) ( not ( = ?auto_99217 ?auto_99218 ) ) ( TRUCK-AT ?auto_99221 ?auto_99220 ) ( AVAILABLE ?auto_99219 ) ( IN ?auto_99218 ?auto_99221 ) ( ON ?auto_99217 ?auto_99216 ) ( not ( = ?auto_99216 ?auto_99217 ) ) ( not ( = ?auto_99216 ?auto_99218 ) ) ( ON ?auto_99216 ?auto_99215 ) ( not ( = ?auto_99215 ?auto_99216 ) ) ( not ( = ?auto_99215 ?auto_99217 ) ) ( not ( = ?auto_99215 ?auto_99218 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99216 ?auto_99217 ?auto_99218 )
      ( MAKE-3CRATE-VERIFY ?auto_99215 ?auto_99216 ?auto_99217 ?auto_99218 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99236 - SURFACE
      ?auto_99237 - SURFACE
      ?auto_99238 - SURFACE
      ?auto_99239 - SURFACE
    )
    :vars
    (
      ?auto_99242 - HOIST
      ?auto_99241 - PLACE
      ?auto_99240 - TRUCK
      ?auto_99243 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99242 ?auto_99241 ) ( SURFACE-AT ?auto_99238 ?auto_99241 ) ( CLEAR ?auto_99238 ) ( IS-CRATE ?auto_99239 ) ( not ( = ?auto_99238 ?auto_99239 ) ) ( AVAILABLE ?auto_99242 ) ( IN ?auto_99239 ?auto_99240 ) ( ON ?auto_99238 ?auto_99237 ) ( not ( = ?auto_99237 ?auto_99238 ) ) ( not ( = ?auto_99237 ?auto_99239 ) ) ( TRUCK-AT ?auto_99240 ?auto_99243 ) ( not ( = ?auto_99243 ?auto_99241 ) ) ( ON ?auto_99237 ?auto_99236 ) ( not ( = ?auto_99236 ?auto_99237 ) ) ( not ( = ?auto_99236 ?auto_99238 ) ) ( not ( = ?auto_99236 ?auto_99239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99237 ?auto_99238 ?auto_99239 )
      ( MAKE-3CRATE-VERIFY ?auto_99236 ?auto_99237 ?auto_99238 ?auto_99239 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99260 - SURFACE
      ?auto_99261 - SURFACE
      ?auto_99262 - SURFACE
      ?auto_99263 - SURFACE
    )
    :vars
    (
      ?auto_99266 - HOIST
      ?auto_99268 - PLACE
      ?auto_99267 - TRUCK
      ?auto_99265 - PLACE
      ?auto_99264 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_99266 ?auto_99268 ) ( SURFACE-AT ?auto_99262 ?auto_99268 ) ( CLEAR ?auto_99262 ) ( IS-CRATE ?auto_99263 ) ( not ( = ?auto_99262 ?auto_99263 ) ) ( AVAILABLE ?auto_99266 ) ( ON ?auto_99262 ?auto_99261 ) ( not ( = ?auto_99261 ?auto_99262 ) ) ( not ( = ?auto_99261 ?auto_99263 ) ) ( TRUCK-AT ?auto_99267 ?auto_99265 ) ( not ( = ?auto_99265 ?auto_99268 ) ) ( HOIST-AT ?auto_99264 ?auto_99265 ) ( LIFTING ?auto_99264 ?auto_99263 ) ( not ( = ?auto_99266 ?auto_99264 ) ) ( ON ?auto_99261 ?auto_99260 ) ( not ( = ?auto_99260 ?auto_99261 ) ) ( not ( = ?auto_99260 ?auto_99262 ) ) ( not ( = ?auto_99260 ?auto_99263 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99261 ?auto_99262 ?auto_99263 )
      ( MAKE-3CRATE-VERIFY ?auto_99260 ?auto_99261 ?auto_99262 ?auto_99263 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99287 - SURFACE
      ?auto_99288 - SURFACE
      ?auto_99289 - SURFACE
      ?auto_99290 - SURFACE
    )
    :vars
    (
      ?auto_99292 - HOIST
      ?auto_99294 - PLACE
      ?auto_99291 - TRUCK
      ?auto_99295 - PLACE
      ?auto_99296 - HOIST
      ?auto_99293 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99292 ?auto_99294 ) ( SURFACE-AT ?auto_99289 ?auto_99294 ) ( CLEAR ?auto_99289 ) ( IS-CRATE ?auto_99290 ) ( not ( = ?auto_99289 ?auto_99290 ) ) ( AVAILABLE ?auto_99292 ) ( ON ?auto_99289 ?auto_99288 ) ( not ( = ?auto_99288 ?auto_99289 ) ) ( not ( = ?auto_99288 ?auto_99290 ) ) ( TRUCK-AT ?auto_99291 ?auto_99295 ) ( not ( = ?auto_99295 ?auto_99294 ) ) ( HOIST-AT ?auto_99296 ?auto_99295 ) ( not ( = ?auto_99292 ?auto_99296 ) ) ( AVAILABLE ?auto_99296 ) ( SURFACE-AT ?auto_99290 ?auto_99295 ) ( ON ?auto_99290 ?auto_99293 ) ( CLEAR ?auto_99290 ) ( not ( = ?auto_99289 ?auto_99293 ) ) ( not ( = ?auto_99290 ?auto_99293 ) ) ( not ( = ?auto_99288 ?auto_99293 ) ) ( ON ?auto_99288 ?auto_99287 ) ( not ( = ?auto_99287 ?auto_99288 ) ) ( not ( = ?auto_99287 ?auto_99289 ) ) ( not ( = ?auto_99287 ?auto_99290 ) ) ( not ( = ?auto_99287 ?auto_99293 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99288 ?auto_99289 ?auto_99290 )
      ( MAKE-3CRATE-VERIFY ?auto_99287 ?auto_99288 ?auto_99289 ?auto_99290 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99315 - SURFACE
      ?auto_99316 - SURFACE
      ?auto_99317 - SURFACE
      ?auto_99318 - SURFACE
    )
    :vars
    (
      ?auto_99322 - HOIST
      ?auto_99324 - PLACE
      ?auto_99321 - PLACE
      ?auto_99320 - HOIST
      ?auto_99323 - SURFACE
      ?auto_99319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99322 ?auto_99324 ) ( SURFACE-AT ?auto_99317 ?auto_99324 ) ( CLEAR ?auto_99317 ) ( IS-CRATE ?auto_99318 ) ( not ( = ?auto_99317 ?auto_99318 ) ) ( AVAILABLE ?auto_99322 ) ( ON ?auto_99317 ?auto_99316 ) ( not ( = ?auto_99316 ?auto_99317 ) ) ( not ( = ?auto_99316 ?auto_99318 ) ) ( not ( = ?auto_99321 ?auto_99324 ) ) ( HOIST-AT ?auto_99320 ?auto_99321 ) ( not ( = ?auto_99322 ?auto_99320 ) ) ( AVAILABLE ?auto_99320 ) ( SURFACE-AT ?auto_99318 ?auto_99321 ) ( ON ?auto_99318 ?auto_99323 ) ( CLEAR ?auto_99318 ) ( not ( = ?auto_99317 ?auto_99323 ) ) ( not ( = ?auto_99318 ?auto_99323 ) ) ( not ( = ?auto_99316 ?auto_99323 ) ) ( TRUCK-AT ?auto_99319 ?auto_99324 ) ( ON ?auto_99316 ?auto_99315 ) ( not ( = ?auto_99315 ?auto_99316 ) ) ( not ( = ?auto_99315 ?auto_99317 ) ) ( not ( = ?auto_99315 ?auto_99318 ) ) ( not ( = ?auto_99315 ?auto_99323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99316 ?auto_99317 ?auto_99318 )
      ( MAKE-3CRATE-VERIFY ?auto_99315 ?auto_99316 ?auto_99317 ?auto_99318 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99343 - SURFACE
      ?auto_99344 - SURFACE
      ?auto_99345 - SURFACE
      ?auto_99346 - SURFACE
    )
    :vars
    (
      ?auto_99352 - HOIST
      ?auto_99349 - PLACE
      ?auto_99348 - PLACE
      ?auto_99347 - HOIST
      ?auto_99350 - SURFACE
      ?auto_99351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99352 ?auto_99349 ) ( IS-CRATE ?auto_99346 ) ( not ( = ?auto_99345 ?auto_99346 ) ) ( not ( = ?auto_99344 ?auto_99345 ) ) ( not ( = ?auto_99344 ?auto_99346 ) ) ( not ( = ?auto_99348 ?auto_99349 ) ) ( HOIST-AT ?auto_99347 ?auto_99348 ) ( not ( = ?auto_99352 ?auto_99347 ) ) ( AVAILABLE ?auto_99347 ) ( SURFACE-AT ?auto_99346 ?auto_99348 ) ( ON ?auto_99346 ?auto_99350 ) ( CLEAR ?auto_99346 ) ( not ( = ?auto_99345 ?auto_99350 ) ) ( not ( = ?auto_99346 ?auto_99350 ) ) ( not ( = ?auto_99344 ?auto_99350 ) ) ( TRUCK-AT ?auto_99351 ?auto_99349 ) ( SURFACE-AT ?auto_99344 ?auto_99349 ) ( CLEAR ?auto_99344 ) ( LIFTING ?auto_99352 ?auto_99345 ) ( IS-CRATE ?auto_99345 ) ( ON ?auto_99344 ?auto_99343 ) ( not ( = ?auto_99343 ?auto_99344 ) ) ( not ( = ?auto_99343 ?auto_99345 ) ) ( not ( = ?auto_99343 ?auto_99346 ) ) ( not ( = ?auto_99343 ?auto_99350 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99344 ?auto_99345 ?auto_99346 )
      ( MAKE-3CRATE-VERIFY ?auto_99343 ?auto_99344 ?auto_99345 ?auto_99346 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_99371 - SURFACE
      ?auto_99372 - SURFACE
      ?auto_99373 - SURFACE
      ?auto_99374 - SURFACE
    )
    :vars
    (
      ?auto_99379 - HOIST
      ?auto_99377 - PLACE
      ?auto_99380 - PLACE
      ?auto_99375 - HOIST
      ?auto_99378 - SURFACE
      ?auto_99376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99379 ?auto_99377 ) ( IS-CRATE ?auto_99374 ) ( not ( = ?auto_99373 ?auto_99374 ) ) ( not ( = ?auto_99372 ?auto_99373 ) ) ( not ( = ?auto_99372 ?auto_99374 ) ) ( not ( = ?auto_99380 ?auto_99377 ) ) ( HOIST-AT ?auto_99375 ?auto_99380 ) ( not ( = ?auto_99379 ?auto_99375 ) ) ( AVAILABLE ?auto_99375 ) ( SURFACE-AT ?auto_99374 ?auto_99380 ) ( ON ?auto_99374 ?auto_99378 ) ( CLEAR ?auto_99374 ) ( not ( = ?auto_99373 ?auto_99378 ) ) ( not ( = ?auto_99374 ?auto_99378 ) ) ( not ( = ?auto_99372 ?auto_99378 ) ) ( TRUCK-AT ?auto_99376 ?auto_99377 ) ( SURFACE-AT ?auto_99372 ?auto_99377 ) ( CLEAR ?auto_99372 ) ( IS-CRATE ?auto_99373 ) ( AVAILABLE ?auto_99379 ) ( IN ?auto_99373 ?auto_99376 ) ( ON ?auto_99372 ?auto_99371 ) ( not ( = ?auto_99371 ?auto_99372 ) ) ( not ( = ?auto_99371 ?auto_99373 ) ) ( not ( = ?auto_99371 ?auto_99374 ) ) ( not ( = ?auto_99371 ?auto_99378 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99372 ?auto_99373 ?auto_99374 )
      ( MAKE-3CRATE-VERIFY ?auto_99371 ?auto_99372 ?auto_99373 ?auto_99374 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99662 - SURFACE
      ?auto_99663 - SURFACE
      ?auto_99664 - SURFACE
      ?auto_99665 - SURFACE
      ?auto_99666 - SURFACE
    )
    :vars
    (
      ?auto_99667 - HOIST
      ?auto_99668 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99667 ?auto_99668 ) ( SURFACE-AT ?auto_99665 ?auto_99668 ) ( CLEAR ?auto_99665 ) ( LIFTING ?auto_99667 ?auto_99666 ) ( IS-CRATE ?auto_99666 ) ( not ( = ?auto_99665 ?auto_99666 ) ) ( ON ?auto_99663 ?auto_99662 ) ( ON ?auto_99664 ?auto_99663 ) ( ON ?auto_99665 ?auto_99664 ) ( not ( = ?auto_99662 ?auto_99663 ) ) ( not ( = ?auto_99662 ?auto_99664 ) ) ( not ( = ?auto_99662 ?auto_99665 ) ) ( not ( = ?auto_99662 ?auto_99666 ) ) ( not ( = ?auto_99663 ?auto_99664 ) ) ( not ( = ?auto_99663 ?auto_99665 ) ) ( not ( = ?auto_99663 ?auto_99666 ) ) ( not ( = ?auto_99664 ?auto_99665 ) ) ( not ( = ?auto_99664 ?auto_99666 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_99665 ?auto_99666 )
      ( MAKE-4CRATE-VERIFY ?auto_99662 ?auto_99663 ?auto_99664 ?auto_99665 ?auto_99666 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99687 - SURFACE
      ?auto_99688 - SURFACE
      ?auto_99689 - SURFACE
      ?auto_99690 - SURFACE
      ?auto_99691 - SURFACE
    )
    :vars
    (
      ?auto_99693 - HOIST
      ?auto_99694 - PLACE
      ?auto_99692 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99693 ?auto_99694 ) ( SURFACE-AT ?auto_99690 ?auto_99694 ) ( CLEAR ?auto_99690 ) ( IS-CRATE ?auto_99691 ) ( not ( = ?auto_99690 ?auto_99691 ) ) ( TRUCK-AT ?auto_99692 ?auto_99694 ) ( AVAILABLE ?auto_99693 ) ( IN ?auto_99691 ?auto_99692 ) ( ON ?auto_99690 ?auto_99689 ) ( not ( = ?auto_99689 ?auto_99690 ) ) ( not ( = ?auto_99689 ?auto_99691 ) ) ( ON ?auto_99688 ?auto_99687 ) ( ON ?auto_99689 ?auto_99688 ) ( not ( = ?auto_99687 ?auto_99688 ) ) ( not ( = ?auto_99687 ?auto_99689 ) ) ( not ( = ?auto_99687 ?auto_99690 ) ) ( not ( = ?auto_99687 ?auto_99691 ) ) ( not ( = ?auto_99688 ?auto_99689 ) ) ( not ( = ?auto_99688 ?auto_99690 ) ) ( not ( = ?auto_99688 ?auto_99691 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99689 ?auto_99690 ?auto_99691 )
      ( MAKE-4CRATE-VERIFY ?auto_99687 ?auto_99688 ?auto_99689 ?auto_99690 ?auto_99691 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99717 - SURFACE
      ?auto_99718 - SURFACE
      ?auto_99719 - SURFACE
      ?auto_99720 - SURFACE
      ?auto_99721 - SURFACE
    )
    :vars
    (
      ?auto_99725 - HOIST
      ?auto_99722 - PLACE
      ?auto_99724 - TRUCK
      ?auto_99723 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99725 ?auto_99722 ) ( SURFACE-AT ?auto_99720 ?auto_99722 ) ( CLEAR ?auto_99720 ) ( IS-CRATE ?auto_99721 ) ( not ( = ?auto_99720 ?auto_99721 ) ) ( AVAILABLE ?auto_99725 ) ( IN ?auto_99721 ?auto_99724 ) ( ON ?auto_99720 ?auto_99719 ) ( not ( = ?auto_99719 ?auto_99720 ) ) ( not ( = ?auto_99719 ?auto_99721 ) ) ( TRUCK-AT ?auto_99724 ?auto_99723 ) ( not ( = ?auto_99723 ?auto_99722 ) ) ( ON ?auto_99718 ?auto_99717 ) ( ON ?auto_99719 ?auto_99718 ) ( not ( = ?auto_99717 ?auto_99718 ) ) ( not ( = ?auto_99717 ?auto_99719 ) ) ( not ( = ?auto_99717 ?auto_99720 ) ) ( not ( = ?auto_99717 ?auto_99721 ) ) ( not ( = ?auto_99718 ?auto_99719 ) ) ( not ( = ?auto_99718 ?auto_99720 ) ) ( not ( = ?auto_99718 ?auto_99721 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99719 ?auto_99720 ?auto_99721 )
      ( MAKE-4CRATE-VERIFY ?auto_99717 ?auto_99718 ?auto_99719 ?auto_99720 ?auto_99721 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99751 - SURFACE
      ?auto_99752 - SURFACE
      ?auto_99753 - SURFACE
      ?auto_99754 - SURFACE
      ?auto_99755 - SURFACE
    )
    :vars
    (
      ?auto_99757 - HOIST
      ?auto_99758 - PLACE
      ?auto_99756 - TRUCK
      ?auto_99760 - PLACE
      ?auto_99759 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_99757 ?auto_99758 ) ( SURFACE-AT ?auto_99754 ?auto_99758 ) ( CLEAR ?auto_99754 ) ( IS-CRATE ?auto_99755 ) ( not ( = ?auto_99754 ?auto_99755 ) ) ( AVAILABLE ?auto_99757 ) ( ON ?auto_99754 ?auto_99753 ) ( not ( = ?auto_99753 ?auto_99754 ) ) ( not ( = ?auto_99753 ?auto_99755 ) ) ( TRUCK-AT ?auto_99756 ?auto_99760 ) ( not ( = ?auto_99760 ?auto_99758 ) ) ( HOIST-AT ?auto_99759 ?auto_99760 ) ( LIFTING ?auto_99759 ?auto_99755 ) ( not ( = ?auto_99757 ?auto_99759 ) ) ( ON ?auto_99752 ?auto_99751 ) ( ON ?auto_99753 ?auto_99752 ) ( not ( = ?auto_99751 ?auto_99752 ) ) ( not ( = ?auto_99751 ?auto_99753 ) ) ( not ( = ?auto_99751 ?auto_99754 ) ) ( not ( = ?auto_99751 ?auto_99755 ) ) ( not ( = ?auto_99752 ?auto_99753 ) ) ( not ( = ?auto_99752 ?auto_99754 ) ) ( not ( = ?auto_99752 ?auto_99755 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99753 ?auto_99754 ?auto_99755 )
      ( MAKE-4CRATE-VERIFY ?auto_99751 ?auto_99752 ?auto_99753 ?auto_99754 ?auto_99755 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99789 - SURFACE
      ?auto_99790 - SURFACE
      ?auto_99791 - SURFACE
      ?auto_99792 - SURFACE
      ?auto_99793 - SURFACE
    )
    :vars
    (
      ?auto_99797 - HOIST
      ?auto_99798 - PLACE
      ?auto_99795 - TRUCK
      ?auto_99794 - PLACE
      ?auto_99799 - HOIST
      ?auto_99796 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_99797 ?auto_99798 ) ( SURFACE-AT ?auto_99792 ?auto_99798 ) ( CLEAR ?auto_99792 ) ( IS-CRATE ?auto_99793 ) ( not ( = ?auto_99792 ?auto_99793 ) ) ( AVAILABLE ?auto_99797 ) ( ON ?auto_99792 ?auto_99791 ) ( not ( = ?auto_99791 ?auto_99792 ) ) ( not ( = ?auto_99791 ?auto_99793 ) ) ( TRUCK-AT ?auto_99795 ?auto_99794 ) ( not ( = ?auto_99794 ?auto_99798 ) ) ( HOIST-AT ?auto_99799 ?auto_99794 ) ( not ( = ?auto_99797 ?auto_99799 ) ) ( AVAILABLE ?auto_99799 ) ( SURFACE-AT ?auto_99793 ?auto_99794 ) ( ON ?auto_99793 ?auto_99796 ) ( CLEAR ?auto_99793 ) ( not ( = ?auto_99792 ?auto_99796 ) ) ( not ( = ?auto_99793 ?auto_99796 ) ) ( not ( = ?auto_99791 ?auto_99796 ) ) ( ON ?auto_99790 ?auto_99789 ) ( ON ?auto_99791 ?auto_99790 ) ( not ( = ?auto_99789 ?auto_99790 ) ) ( not ( = ?auto_99789 ?auto_99791 ) ) ( not ( = ?auto_99789 ?auto_99792 ) ) ( not ( = ?auto_99789 ?auto_99793 ) ) ( not ( = ?auto_99789 ?auto_99796 ) ) ( not ( = ?auto_99790 ?auto_99791 ) ) ( not ( = ?auto_99790 ?auto_99792 ) ) ( not ( = ?auto_99790 ?auto_99793 ) ) ( not ( = ?auto_99790 ?auto_99796 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99791 ?auto_99792 ?auto_99793 )
      ( MAKE-4CRATE-VERIFY ?auto_99789 ?auto_99790 ?auto_99791 ?auto_99792 ?auto_99793 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99828 - SURFACE
      ?auto_99829 - SURFACE
      ?auto_99830 - SURFACE
      ?auto_99831 - SURFACE
      ?auto_99832 - SURFACE
    )
    :vars
    (
      ?auto_99835 - HOIST
      ?auto_99834 - PLACE
      ?auto_99838 - PLACE
      ?auto_99833 - HOIST
      ?auto_99836 - SURFACE
      ?auto_99837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99835 ?auto_99834 ) ( SURFACE-AT ?auto_99831 ?auto_99834 ) ( CLEAR ?auto_99831 ) ( IS-CRATE ?auto_99832 ) ( not ( = ?auto_99831 ?auto_99832 ) ) ( AVAILABLE ?auto_99835 ) ( ON ?auto_99831 ?auto_99830 ) ( not ( = ?auto_99830 ?auto_99831 ) ) ( not ( = ?auto_99830 ?auto_99832 ) ) ( not ( = ?auto_99838 ?auto_99834 ) ) ( HOIST-AT ?auto_99833 ?auto_99838 ) ( not ( = ?auto_99835 ?auto_99833 ) ) ( AVAILABLE ?auto_99833 ) ( SURFACE-AT ?auto_99832 ?auto_99838 ) ( ON ?auto_99832 ?auto_99836 ) ( CLEAR ?auto_99832 ) ( not ( = ?auto_99831 ?auto_99836 ) ) ( not ( = ?auto_99832 ?auto_99836 ) ) ( not ( = ?auto_99830 ?auto_99836 ) ) ( TRUCK-AT ?auto_99837 ?auto_99834 ) ( ON ?auto_99829 ?auto_99828 ) ( ON ?auto_99830 ?auto_99829 ) ( not ( = ?auto_99828 ?auto_99829 ) ) ( not ( = ?auto_99828 ?auto_99830 ) ) ( not ( = ?auto_99828 ?auto_99831 ) ) ( not ( = ?auto_99828 ?auto_99832 ) ) ( not ( = ?auto_99828 ?auto_99836 ) ) ( not ( = ?auto_99829 ?auto_99830 ) ) ( not ( = ?auto_99829 ?auto_99831 ) ) ( not ( = ?auto_99829 ?auto_99832 ) ) ( not ( = ?auto_99829 ?auto_99836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99830 ?auto_99831 ?auto_99832 )
      ( MAKE-4CRATE-VERIFY ?auto_99828 ?auto_99829 ?auto_99830 ?auto_99831 ?auto_99832 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99867 - SURFACE
      ?auto_99868 - SURFACE
      ?auto_99869 - SURFACE
      ?auto_99870 - SURFACE
      ?auto_99871 - SURFACE
    )
    :vars
    (
      ?auto_99872 - HOIST
      ?auto_99876 - PLACE
      ?auto_99873 - PLACE
      ?auto_99877 - HOIST
      ?auto_99874 - SURFACE
      ?auto_99875 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99872 ?auto_99876 ) ( IS-CRATE ?auto_99871 ) ( not ( = ?auto_99870 ?auto_99871 ) ) ( not ( = ?auto_99869 ?auto_99870 ) ) ( not ( = ?auto_99869 ?auto_99871 ) ) ( not ( = ?auto_99873 ?auto_99876 ) ) ( HOIST-AT ?auto_99877 ?auto_99873 ) ( not ( = ?auto_99872 ?auto_99877 ) ) ( AVAILABLE ?auto_99877 ) ( SURFACE-AT ?auto_99871 ?auto_99873 ) ( ON ?auto_99871 ?auto_99874 ) ( CLEAR ?auto_99871 ) ( not ( = ?auto_99870 ?auto_99874 ) ) ( not ( = ?auto_99871 ?auto_99874 ) ) ( not ( = ?auto_99869 ?auto_99874 ) ) ( TRUCK-AT ?auto_99875 ?auto_99876 ) ( SURFACE-AT ?auto_99869 ?auto_99876 ) ( CLEAR ?auto_99869 ) ( LIFTING ?auto_99872 ?auto_99870 ) ( IS-CRATE ?auto_99870 ) ( ON ?auto_99868 ?auto_99867 ) ( ON ?auto_99869 ?auto_99868 ) ( not ( = ?auto_99867 ?auto_99868 ) ) ( not ( = ?auto_99867 ?auto_99869 ) ) ( not ( = ?auto_99867 ?auto_99870 ) ) ( not ( = ?auto_99867 ?auto_99871 ) ) ( not ( = ?auto_99867 ?auto_99874 ) ) ( not ( = ?auto_99868 ?auto_99869 ) ) ( not ( = ?auto_99868 ?auto_99870 ) ) ( not ( = ?auto_99868 ?auto_99871 ) ) ( not ( = ?auto_99868 ?auto_99874 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99869 ?auto_99870 ?auto_99871 )
      ( MAKE-4CRATE-VERIFY ?auto_99867 ?auto_99868 ?auto_99869 ?auto_99870 ?auto_99871 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_99906 - SURFACE
      ?auto_99907 - SURFACE
      ?auto_99908 - SURFACE
      ?auto_99909 - SURFACE
      ?auto_99910 - SURFACE
    )
    :vars
    (
      ?auto_99914 - HOIST
      ?auto_99915 - PLACE
      ?auto_99916 - PLACE
      ?auto_99911 - HOIST
      ?auto_99912 - SURFACE
      ?auto_99913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_99914 ?auto_99915 ) ( IS-CRATE ?auto_99910 ) ( not ( = ?auto_99909 ?auto_99910 ) ) ( not ( = ?auto_99908 ?auto_99909 ) ) ( not ( = ?auto_99908 ?auto_99910 ) ) ( not ( = ?auto_99916 ?auto_99915 ) ) ( HOIST-AT ?auto_99911 ?auto_99916 ) ( not ( = ?auto_99914 ?auto_99911 ) ) ( AVAILABLE ?auto_99911 ) ( SURFACE-AT ?auto_99910 ?auto_99916 ) ( ON ?auto_99910 ?auto_99912 ) ( CLEAR ?auto_99910 ) ( not ( = ?auto_99909 ?auto_99912 ) ) ( not ( = ?auto_99910 ?auto_99912 ) ) ( not ( = ?auto_99908 ?auto_99912 ) ) ( TRUCK-AT ?auto_99913 ?auto_99915 ) ( SURFACE-AT ?auto_99908 ?auto_99915 ) ( CLEAR ?auto_99908 ) ( IS-CRATE ?auto_99909 ) ( AVAILABLE ?auto_99914 ) ( IN ?auto_99909 ?auto_99913 ) ( ON ?auto_99907 ?auto_99906 ) ( ON ?auto_99908 ?auto_99907 ) ( not ( = ?auto_99906 ?auto_99907 ) ) ( not ( = ?auto_99906 ?auto_99908 ) ) ( not ( = ?auto_99906 ?auto_99909 ) ) ( not ( = ?auto_99906 ?auto_99910 ) ) ( not ( = ?auto_99906 ?auto_99912 ) ) ( not ( = ?auto_99907 ?auto_99908 ) ) ( not ( = ?auto_99907 ?auto_99909 ) ) ( not ( = ?auto_99907 ?auto_99910 ) ) ( not ( = ?auto_99907 ?auto_99912 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_99908 ?auto_99909 ?auto_99910 )
      ( MAKE-4CRATE-VERIFY ?auto_99906 ?auto_99907 ?auto_99908 ?auto_99909 ?auto_99910 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_100407 - SURFACE
      ?auto_100408 - SURFACE
    )
    :vars
    (
      ?auto_100410 - HOIST
      ?auto_100411 - PLACE
      ?auto_100413 - SURFACE
      ?auto_100412 - TRUCK
      ?auto_100409 - PLACE
      ?auto_100415 - HOIST
      ?auto_100414 - SURFACE
      ?auto_100416 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_100410 ?auto_100411 ) ( SURFACE-AT ?auto_100407 ?auto_100411 ) ( CLEAR ?auto_100407 ) ( IS-CRATE ?auto_100408 ) ( not ( = ?auto_100407 ?auto_100408 ) ) ( AVAILABLE ?auto_100410 ) ( ON ?auto_100407 ?auto_100413 ) ( not ( = ?auto_100413 ?auto_100407 ) ) ( not ( = ?auto_100413 ?auto_100408 ) ) ( TRUCK-AT ?auto_100412 ?auto_100409 ) ( not ( = ?auto_100409 ?auto_100411 ) ) ( HOIST-AT ?auto_100415 ?auto_100409 ) ( not ( = ?auto_100410 ?auto_100415 ) ) ( SURFACE-AT ?auto_100408 ?auto_100409 ) ( ON ?auto_100408 ?auto_100414 ) ( CLEAR ?auto_100408 ) ( not ( = ?auto_100407 ?auto_100414 ) ) ( not ( = ?auto_100408 ?auto_100414 ) ) ( not ( = ?auto_100413 ?auto_100414 ) ) ( LIFTING ?auto_100415 ?auto_100416 ) ( IS-CRATE ?auto_100416 ) ( not ( = ?auto_100407 ?auto_100416 ) ) ( not ( = ?auto_100408 ?auto_100416 ) ) ( not ( = ?auto_100413 ?auto_100416 ) ) ( not ( = ?auto_100414 ?auto_100416 ) ) )
    :subtasks
    ( ( !LOAD ?auto_100415 ?auto_100416 ?auto_100412 ?auto_100409 )
      ( MAKE-1CRATE ?auto_100407 ?auto_100408 )
      ( MAKE-1CRATE-VERIFY ?auto_100407 ?auto_100408 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100566 - SURFACE
      ?auto_100567 - SURFACE
      ?auto_100568 - SURFACE
      ?auto_100569 - SURFACE
      ?auto_100570 - SURFACE
      ?auto_100571 - SURFACE
    )
    :vars
    (
      ?auto_100573 - HOIST
      ?auto_100572 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_100573 ?auto_100572 ) ( SURFACE-AT ?auto_100570 ?auto_100572 ) ( CLEAR ?auto_100570 ) ( LIFTING ?auto_100573 ?auto_100571 ) ( IS-CRATE ?auto_100571 ) ( not ( = ?auto_100570 ?auto_100571 ) ) ( ON ?auto_100567 ?auto_100566 ) ( ON ?auto_100568 ?auto_100567 ) ( ON ?auto_100569 ?auto_100568 ) ( ON ?auto_100570 ?auto_100569 ) ( not ( = ?auto_100566 ?auto_100567 ) ) ( not ( = ?auto_100566 ?auto_100568 ) ) ( not ( = ?auto_100566 ?auto_100569 ) ) ( not ( = ?auto_100566 ?auto_100570 ) ) ( not ( = ?auto_100566 ?auto_100571 ) ) ( not ( = ?auto_100567 ?auto_100568 ) ) ( not ( = ?auto_100567 ?auto_100569 ) ) ( not ( = ?auto_100567 ?auto_100570 ) ) ( not ( = ?auto_100567 ?auto_100571 ) ) ( not ( = ?auto_100568 ?auto_100569 ) ) ( not ( = ?auto_100568 ?auto_100570 ) ) ( not ( = ?auto_100568 ?auto_100571 ) ) ( not ( = ?auto_100569 ?auto_100570 ) ) ( not ( = ?auto_100569 ?auto_100571 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_100570 ?auto_100571 )
      ( MAKE-5CRATE-VERIFY ?auto_100566 ?auto_100567 ?auto_100568 ?auto_100569 ?auto_100570 ?auto_100571 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100600 - SURFACE
      ?auto_100601 - SURFACE
      ?auto_100602 - SURFACE
      ?auto_100603 - SURFACE
      ?auto_100604 - SURFACE
      ?auto_100605 - SURFACE
    )
    :vars
    (
      ?auto_100607 - HOIST
      ?auto_100606 - PLACE
      ?auto_100608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_100607 ?auto_100606 ) ( SURFACE-AT ?auto_100604 ?auto_100606 ) ( CLEAR ?auto_100604 ) ( IS-CRATE ?auto_100605 ) ( not ( = ?auto_100604 ?auto_100605 ) ) ( TRUCK-AT ?auto_100608 ?auto_100606 ) ( AVAILABLE ?auto_100607 ) ( IN ?auto_100605 ?auto_100608 ) ( ON ?auto_100604 ?auto_100603 ) ( not ( = ?auto_100603 ?auto_100604 ) ) ( not ( = ?auto_100603 ?auto_100605 ) ) ( ON ?auto_100601 ?auto_100600 ) ( ON ?auto_100602 ?auto_100601 ) ( ON ?auto_100603 ?auto_100602 ) ( not ( = ?auto_100600 ?auto_100601 ) ) ( not ( = ?auto_100600 ?auto_100602 ) ) ( not ( = ?auto_100600 ?auto_100603 ) ) ( not ( = ?auto_100600 ?auto_100604 ) ) ( not ( = ?auto_100600 ?auto_100605 ) ) ( not ( = ?auto_100601 ?auto_100602 ) ) ( not ( = ?auto_100601 ?auto_100603 ) ) ( not ( = ?auto_100601 ?auto_100604 ) ) ( not ( = ?auto_100601 ?auto_100605 ) ) ( not ( = ?auto_100602 ?auto_100603 ) ) ( not ( = ?auto_100602 ?auto_100604 ) ) ( not ( = ?auto_100602 ?auto_100605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100603 ?auto_100604 ?auto_100605 )
      ( MAKE-5CRATE-VERIFY ?auto_100600 ?auto_100601 ?auto_100602 ?auto_100603 ?auto_100604 ?auto_100605 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100640 - SURFACE
      ?auto_100641 - SURFACE
      ?auto_100642 - SURFACE
      ?auto_100643 - SURFACE
      ?auto_100644 - SURFACE
      ?auto_100645 - SURFACE
    )
    :vars
    (
      ?auto_100647 - HOIST
      ?auto_100649 - PLACE
      ?auto_100648 - TRUCK
      ?auto_100646 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_100647 ?auto_100649 ) ( SURFACE-AT ?auto_100644 ?auto_100649 ) ( CLEAR ?auto_100644 ) ( IS-CRATE ?auto_100645 ) ( not ( = ?auto_100644 ?auto_100645 ) ) ( AVAILABLE ?auto_100647 ) ( IN ?auto_100645 ?auto_100648 ) ( ON ?auto_100644 ?auto_100643 ) ( not ( = ?auto_100643 ?auto_100644 ) ) ( not ( = ?auto_100643 ?auto_100645 ) ) ( TRUCK-AT ?auto_100648 ?auto_100646 ) ( not ( = ?auto_100646 ?auto_100649 ) ) ( ON ?auto_100641 ?auto_100640 ) ( ON ?auto_100642 ?auto_100641 ) ( ON ?auto_100643 ?auto_100642 ) ( not ( = ?auto_100640 ?auto_100641 ) ) ( not ( = ?auto_100640 ?auto_100642 ) ) ( not ( = ?auto_100640 ?auto_100643 ) ) ( not ( = ?auto_100640 ?auto_100644 ) ) ( not ( = ?auto_100640 ?auto_100645 ) ) ( not ( = ?auto_100641 ?auto_100642 ) ) ( not ( = ?auto_100641 ?auto_100643 ) ) ( not ( = ?auto_100641 ?auto_100644 ) ) ( not ( = ?auto_100641 ?auto_100645 ) ) ( not ( = ?auto_100642 ?auto_100643 ) ) ( not ( = ?auto_100642 ?auto_100644 ) ) ( not ( = ?auto_100642 ?auto_100645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100643 ?auto_100644 ?auto_100645 )
      ( MAKE-5CRATE-VERIFY ?auto_100640 ?auto_100641 ?auto_100642 ?auto_100643 ?auto_100644 ?auto_100645 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100685 - SURFACE
      ?auto_100686 - SURFACE
      ?auto_100687 - SURFACE
      ?auto_100688 - SURFACE
      ?auto_100689 - SURFACE
      ?auto_100690 - SURFACE
    )
    :vars
    (
      ?auto_100695 - HOIST
      ?auto_100692 - PLACE
      ?auto_100691 - TRUCK
      ?auto_100694 - PLACE
      ?auto_100693 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_100695 ?auto_100692 ) ( SURFACE-AT ?auto_100689 ?auto_100692 ) ( CLEAR ?auto_100689 ) ( IS-CRATE ?auto_100690 ) ( not ( = ?auto_100689 ?auto_100690 ) ) ( AVAILABLE ?auto_100695 ) ( ON ?auto_100689 ?auto_100688 ) ( not ( = ?auto_100688 ?auto_100689 ) ) ( not ( = ?auto_100688 ?auto_100690 ) ) ( TRUCK-AT ?auto_100691 ?auto_100694 ) ( not ( = ?auto_100694 ?auto_100692 ) ) ( HOIST-AT ?auto_100693 ?auto_100694 ) ( LIFTING ?auto_100693 ?auto_100690 ) ( not ( = ?auto_100695 ?auto_100693 ) ) ( ON ?auto_100686 ?auto_100685 ) ( ON ?auto_100687 ?auto_100686 ) ( ON ?auto_100688 ?auto_100687 ) ( not ( = ?auto_100685 ?auto_100686 ) ) ( not ( = ?auto_100685 ?auto_100687 ) ) ( not ( = ?auto_100685 ?auto_100688 ) ) ( not ( = ?auto_100685 ?auto_100689 ) ) ( not ( = ?auto_100685 ?auto_100690 ) ) ( not ( = ?auto_100686 ?auto_100687 ) ) ( not ( = ?auto_100686 ?auto_100688 ) ) ( not ( = ?auto_100686 ?auto_100689 ) ) ( not ( = ?auto_100686 ?auto_100690 ) ) ( not ( = ?auto_100687 ?auto_100688 ) ) ( not ( = ?auto_100687 ?auto_100689 ) ) ( not ( = ?auto_100687 ?auto_100690 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100688 ?auto_100689 ?auto_100690 )
      ( MAKE-5CRATE-VERIFY ?auto_100685 ?auto_100686 ?auto_100687 ?auto_100688 ?auto_100689 ?auto_100690 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100735 - SURFACE
      ?auto_100736 - SURFACE
      ?auto_100737 - SURFACE
      ?auto_100738 - SURFACE
      ?auto_100739 - SURFACE
      ?auto_100740 - SURFACE
    )
    :vars
    (
      ?auto_100745 - HOIST
      ?auto_100744 - PLACE
      ?auto_100742 - TRUCK
      ?auto_100743 - PLACE
      ?auto_100741 - HOIST
      ?auto_100746 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_100745 ?auto_100744 ) ( SURFACE-AT ?auto_100739 ?auto_100744 ) ( CLEAR ?auto_100739 ) ( IS-CRATE ?auto_100740 ) ( not ( = ?auto_100739 ?auto_100740 ) ) ( AVAILABLE ?auto_100745 ) ( ON ?auto_100739 ?auto_100738 ) ( not ( = ?auto_100738 ?auto_100739 ) ) ( not ( = ?auto_100738 ?auto_100740 ) ) ( TRUCK-AT ?auto_100742 ?auto_100743 ) ( not ( = ?auto_100743 ?auto_100744 ) ) ( HOIST-AT ?auto_100741 ?auto_100743 ) ( not ( = ?auto_100745 ?auto_100741 ) ) ( AVAILABLE ?auto_100741 ) ( SURFACE-AT ?auto_100740 ?auto_100743 ) ( ON ?auto_100740 ?auto_100746 ) ( CLEAR ?auto_100740 ) ( not ( = ?auto_100739 ?auto_100746 ) ) ( not ( = ?auto_100740 ?auto_100746 ) ) ( not ( = ?auto_100738 ?auto_100746 ) ) ( ON ?auto_100736 ?auto_100735 ) ( ON ?auto_100737 ?auto_100736 ) ( ON ?auto_100738 ?auto_100737 ) ( not ( = ?auto_100735 ?auto_100736 ) ) ( not ( = ?auto_100735 ?auto_100737 ) ) ( not ( = ?auto_100735 ?auto_100738 ) ) ( not ( = ?auto_100735 ?auto_100739 ) ) ( not ( = ?auto_100735 ?auto_100740 ) ) ( not ( = ?auto_100735 ?auto_100746 ) ) ( not ( = ?auto_100736 ?auto_100737 ) ) ( not ( = ?auto_100736 ?auto_100738 ) ) ( not ( = ?auto_100736 ?auto_100739 ) ) ( not ( = ?auto_100736 ?auto_100740 ) ) ( not ( = ?auto_100736 ?auto_100746 ) ) ( not ( = ?auto_100737 ?auto_100738 ) ) ( not ( = ?auto_100737 ?auto_100739 ) ) ( not ( = ?auto_100737 ?auto_100740 ) ) ( not ( = ?auto_100737 ?auto_100746 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100738 ?auto_100739 ?auto_100740 )
      ( MAKE-5CRATE-VERIFY ?auto_100735 ?auto_100736 ?auto_100737 ?auto_100738 ?auto_100739 ?auto_100740 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100786 - SURFACE
      ?auto_100787 - SURFACE
      ?auto_100788 - SURFACE
      ?auto_100789 - SURFACE
      ?auto_100790 - SURFACE
      ?auto_100791 - SURFACE
    )
    :vars
    (
      ?auto_100796 - HOIST
      ?auto_100797 - PLACE
      ?auto_100795 - PLACE
      ?auto_100792 - HOIST
      ?auto_100794 - SURFACE
      ?auto_100793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_100796 ?auto_100797 ) ( SURFACE-AT ?auto_100790 ?auto_100797 ) ( CLEAR ?auto_100790 ) ( IS-CRATE ?auto_100791 ) ( not ( = ?auto_100790 ?auto_100791 ) ) ( AVAILABLE ?auto_100796 ) ( ON ?auto_100790 ?auto_100789 ) ( not ( = ?auto_100789 ?auto_100790 ) ) ( not ( = ?auto_100789 ?auto_100791 ) ) ( not ( = ?auto_100795 ?auto_100797 ) ) ( HOIST-AT ?auto_100792 ?auto_100795 ) ( not ( = ?auto_100796 ?auto_100792 ) ) ( AVAILABLE ?auto_100792 ) ( SURFACE-AT ?auto_100791 ?auto_100795 ) ( ON ?auto_100791 ?auto_100794 ) ( CLEAR ?auto_100791 ) ( not ( = ?auto_100790 ?auto_100794 ) ) ( not ( = ?auto_100791 ?auto_100794 ) ) ( not ( = ?auto_100789 ?auto_100794 ) ) ( TRUCK-AT ?auto_100793 ?auto_100797 ) ( ON ?auto_100787 ?auto_100786 ) ( ON ?auto_100788 ?auto_100787 ) ( ON ?auto_100789 ?auto_100788 ) ( not ( = ?auto_100786 ?auto_100787 ) ) ( not ( = ?auto_100786 ?auto_100788 ) ) ( not ( = ?auto_100786 ?auto_100789 ) ) ( not ( = ?auto_100786 ?auto_100790 ) ) ( not ( = ?auto_100786 ?auto_100791 ) ) ( not ( = ?auto_100786 ?auto_100794 ) ) ( not ( = ?auto_100787 ?auto_100788 ) ) ( not ( = ?auto_100787 ?auto_100789 ) ) ( not ( = ?auto_100787 ?auto_100790 ) ) ( not ( = ?auto_100787 ?auto_100791 ) ) ( not ( = ?auto_100787 ?auto_100794 ) ) ( not ( = ?auto_100788 ?auto_100789 ) ) ( not ( = ?auto_100788 ?auto_100790 ) ) ( not ( = ?auto_100788 ?auto_100791 ) ) ( not ( = ?auto_100788 ?auto_100794 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100789 ?auto_100790 ?auto_100791 )
      ( MAKE-5CRATE-VERIFY ?auto_100786 ?auto_100787 ?auto_100788 ?auto_100789 ?auto_100790 ?auto_100791 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100837 - SURFACE
      ?auto_100838 - SURFACE
      ?auto_100839 - SURFACE
      ?auto_100840 - SURFACE
      ?auto_100841 - SURFACE
      ?auto_100842 - SURFACE
    )
    :vars
    (
      ?auto_100843 - HOIST
      ?auto_100845 - PLACE
      ?auto_100846 - PLACE
      ?auto_100847 - HOIST
      ?auto_100848 - SURFACE
      ?auto_100844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_100843 ?auto_100845 ) ( IS-CRATE ?auto_100842 ) ( not ( = ?auto_100841 ?auto_100842 ) ) ( not ( = ?auto_100840 ?auto_100841 ) ) ( not ( = ?auto_100840 ?auto_100842 ) ) ( not ( = ?auto_100846 ?auto_100845 ) ) ( HOIST-AT ?auto_100847 ?auto_100846 ) ( not ( = ?auto_100843 ?auto_100847 ) ) ( AVAILABLE ?auto_100847 ) ( SURFACE-AT ?auto_100842 ?auto_100846 ) ( ON ?auto_100842 ?auto_100848 ) ( CLEAR ?auto_100842 ) ( not ( = ?auto_100841 ?auto_100848 ) ) ( not ( = ?auto_100842 ?auto_100848 ) ) ( not ( = ?auto_100840 ?auto_100848 ) ) ( TRUCK-AT ?auto_100844 ?auto_100845 ) ( SURFACE-AT ?auto_100840 ?auto_100845 ) ( CLEAR ?auto_100840 ) ( LIFTING ?auto_100843 ?auto_100841 ) ( IS-CRATE ?auto_100841 ) ( ON ?auto_100838 ?auto_100837 ) ( ON ?auto_100839 ?auto_100838 ) ( ON ?auto_100840 ?auto_100839 ) ( not ( = ?auto_100837 ?auto_100838 ) ) ( not ( = ?auto_100837 ?auto_100839 ) ) ( not ( = ?auto_100837 ?auto_100840 ) ) ( not ( = ?auto_100837 ?auto_100841 ) ) ( not ( = ?auto_100837 ?auto_100842 ) ) ( not ( = ?auto_100837 ?auto_100848 ) ) ( not ( = ?auto_100838 ?auto_100839 ) ) ( not ( = ?auto_100838 ?auto_100840 ) ) ( not ( = ?auto_100838 ?auto_100841 ) ) ( not ( = ?auto_100838 ?auto_100842 ) ) ( not ( = ?auto_100838 ?auto_100848 ) ) ( not ( = ?auto_100839 ?auto_100840 ) ) ( not ( = ?auto_100839 ?auto_100841 ) ) ( not ( = ?auto_100839 ?auto_100842 ) ) ( not ( = ?auto_100839 ?auto_100848 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100840 ?auto_100841 ?auto_100842 )
      ( MAKE-5CRATE-VERIFY ?auto_100837 ?auto_100838 ?auto_100839 ?auto_100840 ?auto_100841 ?auto_100842 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_100888 - SURFACE
      ?auto_100889 - SURFACE
      ?auto_100890 - SURFACE
      ?auto_100891 - SURFACE
      ?auto_100892 - SURFACE
      ?auto_100893 - SURFACE
    )
    :vars
    (
      ?auto_100899 - HOIST
      ?auto_100897 - PLACE
      ?auto_100894 - PLACE
      ?auto_100898 - HOIST
      ?auto_100896 - SURFACE
      ?auto_100895 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_100899 ?auto_100897 ) ( IS-CRATE ?auto_100893 ) ( not ( = ?auto_100892 ?auto_100893 ) ) ( not ( = ?auto_100891 ?auto_100892 ) ) ( not ( = ?auto_100891 ?auto_100893 ) ) ( not ( = ?auto_100894 ?auto_100897 ) ) ( HOIST-AT ?auto_100898 ?auto_100894 ) ( not ( = ?auto_100899 ?auto_100898 ) ) ( AVAILABLE ?auto_100898 ) ( SURFACE-AT ?auto_100893 ?auto_100894 ) ( ON ?auto_100893 ?auto_100896 ) ( CLEAR ?auto_100893 ) ( not ( = ?auto_100892 ?auto_100896 ) ) ( not ( = ?auto_100893 ?auto_100896 ) ) ( not ( = ?auto_100891 ?auto_100896 ) ) ( TRUCK-AT ?auto_100895 ?auto_100897 ) ( SURFACE-AT ?auto_100891 ?auto_100897 ) ( CLEAR ?auto_100891 ) ( IS-CRATE ?auto_100892 ) ( AVAILABLE ?auto_100899 ) ( IN ?auto_100892 ?auto_100895 ) ( ON ?auto_100889 ?auto_100888 ) ( ON ?auto_100890 ?auto_100889 ) ( ON ?auto_100891 ?auto_100890 ) ( not ( = ?auto_100888 ?auto_100889 ) ) ( not ( = ?auto_100888 ?auto_100890 ) ) ( not ( = ?auto_100888 ?auto_100891 ) ) ( not ( = ?auto_100888 ?auto_100892 ) ) ( not ( = ?auto_100888 ?auto_100893 ) ) ( not ( = ?auto_100888 ?auto_100896 ) ) ( not ( = ?auto_100889 ?auto_100890 ) ) ( not ( = ?auto_100889 ?auto_100891 ) ) ( not ( = ?auto_100889 ?auto_100892 ) ) ( not ( = ?auto_100889 ?auto_100893 ) ) ( not ( = ?auto_100889 ?auto_100896 ) ) ( not ( = ?auto_100890 ?auto_100891 ) ) ( not ( = ?auto_100890 ?auto_100892 ) ) ( not ( = ?auto_100890 ?auto_100893 ) ) ( not ( = ?auto_100890 ?auto_100896 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_100891 ?auto_100892 ?auto_100893 )
      ( MAKE-5CRATE-VERIFY ?auto_100888 ?auto_100889 ?auto_100890 ?auto_100891 ?auto_100892 ?auto_100893 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_101880 - SURFACE
      ?auto_101881 - SURFACE
    )
    :vars
    (
      ?auto_101885 - HOIST
      ?auto_101887 - PLACE
      ?auto_101886 - SURFACE
      ?auto_101882 - PLACE
      ?auto_101884 - HOIST
      ?auto_101883 - SURFACE
      ?auto_101888 - TRUCK
      ?auto_101889 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_101885 ?auto_101887 ) ( SURFACE-AT ?auto_101880 ?auto_101887 ) ( CLEAR ?auto_101880 ) ( IS-CRATE ?auto_101881 ) ( not ( = ?auto_101880 ?auto_101881 ) ) ( ON ?auto_101880 ?auto_101886 ) ( not ( = ?auto_101886 ?auto_101880 ) ) ( not ( = ?auto_101886 ?auto_101881 ) ) ( not ( = ?auto_101882 ?auto_101887 ) ) ( HOIST-AT ?auto_101884 ?auto_101882 ) ( not ( = ?auto_101885 ?auto_101884 ) ) ( AVAILABLE ?auto_101884 ) ( SURFACE-AT ?auto_101881 ?auto_101882 ) ( ON ?auto_101881 ?auto_101883 ) ( CLEAR ?auto_101881 ) ( not ( = ?auto_101880 ?auto_101883 ) ) ( not ( = ?auto_101881 ?auto_101883 ) ) ( not ( = ?auto_101886 ?auto_101883 ) ) ( TRUCK-AT ?auto_101888 ?auto_101887 ) ( LIFTING ?auto_101885 ?auto_101889 ) ( IS-CRATE ?auto_101889 ) ( not ( = ?auto_101880 ?auto_101889 ) ) ( not ( = ?auto_101881 ?auto_101889 ) ) ( not ( = ?auto_101886 ?auto_101889 ) ) ( not ( = ?auto_101883 ?auto_101889 ) ) )
    :subtasks
    ( ( !LOAD ?auto_101885 ?auto_101889 ?auto_101888 ?auto_101887 )
      ( MAKE-1CRATE ?auto_101880 ?auto_101881 )
      ( MAKE-1CRATE-VERIFY ?auto_101880 ?auto_101881 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102095 - SURFACE
      ?auto_102096 - SURFACE
      ?auto_102097 - SURFACE
      ?auto_102098 - SURFACE
      ?auto_102099 - SURFACE
      ?auto_102100 - SURFACE
      ?auto_102101 - SURFACE
    )
    :vars
    (
      ?auto_102103 - HOIST
      ?auto_102102 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_102103 ?auto_102102 ) ( SURFACE-AT ?auto_102100 ?auto_102102 ) ( CLEAR ?auto_102100 ) ( LIFTING ?auto_102103 ?auto_102101 ) ( IS-CRATE ?auto_102101 ) ( not ( = ?auto_102100 ?auto_102101 ) ) ( ON ?auto_102096 ?auto_102095 ) ( ON ?auto_102097 ?auto_102096 ) ( ON ?auto_102098 ?auto_102097 ) ( ON ?auto_102099 ?auto_102098 ) ( ON ?auto_102100 ?auto_102099 ) ( not ( = ?auto_102095 ?auto_102096 ) ) ( not ( = ?auto_102095 ?auto_102097 ) ) ( not ( = ?auto_102095 ?auto_102098 ) ) ( not ( = ?auto_102095 ?auto_102099 ) ) ( not ( = ?auto_102095 ?auto_102100 ) ) ( not ( = ?auto_102095 ?auto_102101 ) ) ( not ( = ?auto_102096 ?auto_102097 ) ) ( not ( = ?auto_102096 ?auto_102098 ) ) ( not ( = ?auto_102096 ?auto_102099 ) ) ( not ( = ?auto_102096 ?auto_102100 ) ) ( not ( = ?auto_102096 ?auto_102101 ) ) ( not ( = ?auto_102097 ?auto_102098 ) ) ( not ( = ?auto_102097 ?auto_102099 ) ) ( not ( = ?auto_102097 ?auto_102100 ) ) ( not ( = ?auto_102097 ?auto_102101 ) ) ( not ( = ?auto_102098 ?auto_102099 ) ) ( not ( = ?auto_102098 ?auto_102100 ) ) ( not ( = ?auto_102098 ?auto_102101 ) ) ( not ( = ?auto_102099 ?auto_102100 ) ) ( not ( = ?auto_102099 ?auto_102101 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_102100 ?auto_102101 )
      ( MAKE-6CRATE-VERIFY ?auto_102095 ?auto_102096 ?auto_102097 ?auto_102098 ?auto_102099 ?auto_102100 ?auto_102101 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102139 - SURFACE
      ?auto_102140 - SURFACE
      ?auto_102141 - SURFACE
      ?auto_102142 - SURFACE
      ?auto_102143 - SURFACE
      ?auto_102144 - SURFACE
      ?auto_102145 - SURFACE
    )
    :vars
    (
      ?auto_102147 - HOIST
      ?auto_102148 - PLACE
      ?auto_102146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_102147 ?auto_102148 ) ( SURFACE-AT ?auto_102144 ?auto_102148 ) ( CLEAR ?auto_102144 ) ( IS-CRATE ?auto_102145 ) ( not ( = ?auto_102144 ?auto_102145 ) ) ( TRUCK-AT ?auto_102146 ?auto_102148 ) ( AVAILABLE ?auto_102147 ) ( IN ?auto_102145 ?auto_102146 ) ( ON ?auto_102144 ?auto_102143 ) ( not ( = ?auto_102143 ?auto_102144 ) ) ( not ( = ?auto_102143 ?auto_102145 ) ) ( ON ?auto_102140 ?auto_102139 ) ( ON ?auto_102141 ?auto_102140 ) ( ON ?auto_102142 ?auto_102141 ) ( ON ?auto_102143 ?auto_102142 ) ( not ( = ?auto_102139 ?auto_102140 ) ) ( not ( = ?auto_102139 ?auto_102141 ) ) ( not ( = ?auto_102139 ?auto_102142 ) ) ( not ( = ?auto_102139 ?auto_102143 ) ) ( not ( = ?auto_102139 ?auto_102144 ) ) ( not ( = ?auto_102139 ?auto_102145 ) ) ( not ( = ?auto_102140 ?auto_102141 ) ) ( not ( = ?auto_102140 ?auto_102142 ) ) ( not ( = ?auto_102140 ?auto_102143 ) ) ( not ( = ?auto_102140 ?auto_102144 ) ) ( not ( = ?auto_102140 ?auto_102145 ) ) ( not ( = ?auto_102141 ?auto_102142 ) ) ( not ( = ?auto_102141 ?auto_102143 ) ) ( not ( = ?auto_102141 ?auto_102144 ) ) ( not ( = ?auto_102141 ?auto_102145 ) ) ( not ( = ?auto_102142 ?auto_102143 ) ) ( not ( = ?auto_102142 ?auto_102144 ) ) ( not ( = ?auto_102142 ?auto_102145 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102143 ?auto_102144 ?auto_102145 )
      ( MAKE-6CRATE-VERIFY ?auto_102139 ?auto_102140 ?auto_102141 ?auto_102142 ?auto_102143 ?auto_102144 ?auto_102145 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102190 - SURFACE
      ?auto_102191 - SURFACE
      ?auto_102192 - SURFACE
      ?auto_102193 - SURFACE
      ?auto_102194 - SURFACE
      ?auto_102195 - SURFACE
      ?auto_102196 - SURFACE
    )
    :vars
    (
      ?auto_102197 - HOIST
      ?auto_102199 - PLACE
      ?auto_102198 - TRUCK
      ?auto_102200 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_102197 ?auto_102199 ) ( SURFACE-AT ?auto_102195 ?auto_102199 ) ( CLEAR ?auto_102195 ) ( IS-CRATE ?auto_102196 ) ( not ( = ?auto_102195 ?auto_102196 ) ) ( AVAILABLE ?auto_102197 ) ( IN ?auto_102196 ?auto_102198 ) ( ON ?auto_102195 ?auto_102194 ) ( not ( = ?auto_102194 ?auto_102195 ) ) ( not ( = ?auto_102194 ?auto_102196 ) ) ( TRUCK-AT ?auto_102198 ?auto_102200 ) ( not ( = ?auto_102200 ?auto_102199 ) ) ( ON ?auto_102191 ?auto_102190 ) ( ON ?auto_102192 ?auto_102191 ) ( ON ?auto_102193 ?auto_102192 ) ( ON ?auto_102194 ?auto_102193 ) ( not ( = ?auto_102190 ?auto_102191 ) ) ( not ( = ?auto_102190 ?auto_102192 ) ) ( not ( = ?auto_102190 ?auto_102193 ) ) ( not ( = ?auto_102190 ?auto_102194 ) ) ( not ( = ?auto_102190 ?auto_102195 ) ) ( not ( = ?auto_102190 ?auto_102196 ) ) ( not ( = ?auto_102191 ?auto_102192 ) ) ( not ( = ?auto_102191 ?auto_102193 ) ) ( not ( = ?auto_102191 ?auto_102194 ) ) ( not ( = ?auto_102191 ?auto_102195 ) ) ( not ( = ?auto_102191 ?auto_102196 ) ) ( not ( = ?auto_102192 ?auto_102193 ) ) ( not ( = ?auto_102192 ?auto_102194 ) ) ( not ( = ?auto_102192 ?auto_102195 ) ) ( not ( = ?auto_102192 ?auto_102196 ) ) ( not ( = ?auto_102193 ?auto_102194 ) ) ( not ( = ?auto_102193 ?auto_102195 ) ) ( not ( = ?auto_102193 ?auto_102196 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102194 ?auto_102195 ?auto_102196 )
      ( MAKE-6CRATE-VERIFY ?auto_102190 ?auto_102191 ?auto_102192 ?auto_102193 ?auto_102194 ?auto_102195 ?auto_102196 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102247 - SURFACE
      ?auto_102248 - SURFACE
      ?auto_102249 - SURFACE
      ?auto_102250 - SURFACE
      ?auto_102251 - SURFACE
      ?auto_102252 - SURFACE
      ?auto_102253 - SURFACE
    )
    :vars
    (
      ?auto_102255 - HOIST
      ?auto_102258 - PLACE
      ?auto_102254 - TRUCK
      ?auto_102256 - PLACE
      ?auto_102257 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_102255 ?auto_102258 ) ( SURFACE-AT ?auto_102252 ?auto_102258 ) ( CLEAR ?auto_102252 ) ( IS-CRATE ?auto_102253 ) ( not ( = ?auto_102252 ?auto_102253 ) ) ( AVAILABLE ?auto_102255 ) ( ON ?auto_102252 ?auto_102251 ) ( not ( = ?auto_102251 ?auto_102252 ) ) ( not ( = ?auto_102251 ?auto_102253 ) ) ( TRUCK-AT ?auto_102254 ?auto_102256 ) ( not ( = ?auto_102256 ?auto_102258 ) ) ( HOIST-AT ?auto_102257 ?auto_102256 ) ( LIFTING ?auto_102257 ?auto_102253 ) ( not ( = ?auto_102255 ?auto_102257 ) ) ( ON ?auto_102248 ?auto_102247 ) ( ON ?auto_102249 ?auto_102248 ) ( ON ?auto_102250 ?auto_102249 ) ( ON ?auto_102251 ?auto_102250 ) ( not ( = ?auto_102247 ?auto_102248 ) ) ( not ( = ?auto_102247 ?auto_102249 ) ) ( not ( = ?auto_102247 ?auto_102250 ) ) ( not ( = ?auto_102247 ?auto_102251 ) ) ( not ( = ?auto_102247 ?auto_102252 ) ) ( not ( = ?auto_102247 ?auto_102253 ) ) ( not ( = ?auto_102248 ?auto_102249 ) ) ( not ( = ?auto_102248 ?auto_102250 ) ) ( not ( = ?auto_102248 ?auto_102251 ) ) ( not ( = ?auto_102248 ?auto_102252 ) ) ( not ( = ?auto_102248 ?auto_102253 ) ) ( not ( = ?auto_102249 ?auto_102250 ) ) ( not ( = ?auto_102249 ?auto_102251 ) ) ( not ( = ?auto_102249 ?auto_102252 ) ) ( not ( = ?auto_102249 ?auto_102253 ) ) ( not ( = ?auto_102250 ?auto_102251 ) ) ( not ( = ?auto_102250 ?auto_102252 ) ) ( not ( = ?auto_102250 ?auto_102253 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102251 ?auto_102252 ?auto_102253 )
      ( MAKE-6CRATE-VERIFY ?auto_102247 ?auto_102248 ?auto_102249 ?auto_102250 ?auto_102251 ?auto_102252 ?auto_102253 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102310 - SURFACE
      ?auto_102311 - SURFACE
      ?auto_102312 - SURFACE
      ?auto_102313 - SURFACE
      ?auto_102314 - SURFACE
      ?auto_102315 - SURFACE
      ?auto_102316 - SURFACE
    )
    :vars
    (
      ?auto_102318 - HOIST
      ?auto_102320 - PLACE
      ?auto_102319 - TRUCK
      ?auto_102322 - PLACE
      ?auto_102321 - HOIST
      ?auto_102317 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_102318 ?auto_102320 ) ( SURFACE-AT ?auto_102315 ?auto_102320 ) ( CLEAR ?auto_102315 ) ( IS-CRATE ?auto_102316 ) ( not ( = ?auto_102315 ?auto_102316 ) ) ( AVAILABLE ?auto_102318 ) ( ON ?auto_102315 ?auto_102314 ) ( not ( = ?auto_102314 ?auto_102315 ) ) ( not ( = ?auto_102314 ?auto_102316 ) ) ( TRUCK-AT ?auto_102319 ?auto_102322 ) ( not ( = ?auto_102322 ?auto_102320 ) ) ( HOIST-AT ?auto_102321 ?auto_102322 ) ( not ( = ?auto_102318 ?auto_102321 ) ) ( AVAILABLE ?auto_102321 ) ( SURFACE-AT ?auto_102316 ?auto_102322 ) ( ON ?auto_102316 ?auto_102317 ) ( CLEAR ?auto_102316 ) ( not ( = ?auto_102315 ?auto_102317 ) ) ( not ( = ?auto_102316 ?auto_102317 ) ) ( not ( = ?auto_102314 ?auto_102317 ) ) ( ON ?auto_102311 ?auto_102310 ) ( ON ?auto_102312 ?auto_102311 ) ( ON ?auto_102313 ?auto_102312 ) ( ON ?auto_102314 ?auto_102313 ) ( not ( = ?auto_102310 ?auto_102311 ) ) ( not ( = ?auto_102310 ?auto_102312 ) ) ( not ( = ?auto_102310 ?auto_102313 ) ) ( not ( = ?auto_102310 ?auto_102314 ) ) ( not ( = ?auto_102310 ?auto_102315 ) ) ( not ( = ?auto_102310 ?auto_102316 ) ) ( not ( = ?auto_102310 ?auto_102317 ) ) ( not ( = ?auto_102311 ?auto_102312 ) ) ( not ( = ?auto_102311 ?auto_102313 ) ) ( not ( = ?auto_102311 ?auto_102314 ) ) ( not ( = ?auto_102311 ?auto_102315 ) ) ( not ( = ?auto_102311 ?auto_102316 ) ) ( not ( = ?auto_102311 ?auto_102317 ) ) ( not ( = ?auto_102312 ?auto_102313 ) ) ( not ( = ?auto_102312 ?auto_102314 ) ) ( not ( = ?auto_102312 ?auto_102315 ) ) ( not ( = ?auto_102312 ?auto_102316 ) ) ( not ( = ?auto_102312 ?auto_102317 ) ) ( not ( = ?auto_102313 ?auto_102314 ) ) ( not ( = ?auto_102313 ?auto_102315 ) ) ( not ( = ?auto_102313 ?auto_102316 ) ) ( not ( = ?auto_102313 ?auto_102317 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102314 ?auto_102315 ?auto_102316 )
      ( MAKE-6CRATE-VERIFY ?auto_102310 ?auto_102311 ?auto_102312 ?auto_102313 ?auto_102314 ?auto_102315 ?auto_102316 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102374 - SURFACE
      ?auto_102375 - SURFACE
      ?auto_102376 - SURFACE
      ?auto_102377 - SURFACE
      ?auto_102378 - SURFACE
      ?auto_102379 - SURFACE
      ?auto_102380 - SURFACE
    )
    :vars
    (
      ?auto_102382 - HOIST
      ?auto_102386 - PLACE
      ?auto_102385 - PLACE
      ?auto_102381 - HOIST
      ?auto_102384 - SURFACE
      ?auto_102383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_102382 ?auto_102386 ) ( SURFACE-AT ?auto_102379 ?auto_102386 ) ( CLEAR ?auto_102379 ) ( IS-CRATE ?auto_102380 ) ( not ( = ?auto_102379 ?auto_102380 ) ) ( AVAILABLE ?auto_102382 ) ( ON ?auto_102379 ?auto_102378 ) ( not ( = ?auto_102378 ?auto_102379 ) ) ( not ( = ?auto_102378 ?auto_102380 ) ) ( not ( = ?auto_102385 ?auto_102386 ) ) ( HOIST-AT ?auto_102381 ?auto_102385 ) ( not ( = ?auto_102382 ?auto_102381 ) ) ( AVAILABLE ?auto_102381 ) ( SURFACE-AT ?auto_102380 ?auto_102385 ) ( ON ?auto_102380 ?auto_102384 ) ( CLEAR ?auto_102380 ) ( not ( = ?auto_102379 ?auto_102384 ) ) ( not ( = ?auto_102380 ?auto_102384 ) ) ( not ( = ?auto_102378 ?auto_102384 ) ) ( TRUCK-AT ?auto_102383 ?auto_102386 ) ( ON ?auto_102375 ?auto_102374 ) ( ON ?auto_102376 ?auto_102375 ) ( ON ?auto_102377 ?auto_102376 ) ( ON ?auto_102378 ?auto_102377 ) ( not ( = ?auto_102374 ?auto_102375 ) ) ( not ( = ?auto_102374 ?auto_102376 ) ) ( not ( = ?auto_102374 ?auto_102377 ) ) ( not ( = ?auto_102374 ?auto_102378 ) ) ( not ( = ?auto_102374 ?auto_102379 ) ) ( not ( = ?auto_102374 ?auto_102380 ) ) ( not ( = ?auto_102374 ?auto_102384 ) ) ( not ( = ?auto_102375 ?auto_102376 ) ) ( not ( = ?auto_102375 ?auto_102377 ) ) ( not ( = ?auto_102375 ?auto_102378 ) ) ( not ( = ?auto_102375 ?auto_102379 ) ) ( not ( = ?auto_102375 ?auto_102380 ) ) ( not ( = ?auto_102375 ?auto_102384 ) ) ( not ( = ?auto_102376 ?auto_102377 ) ) ( not ( = ?auto_102376 ?auto_102378 ) ) ( not ( = ?auto_102376 ?auto_102379 ) ) ( not ( = ?auto_102376 ?auto_102380 ) ) ( not ( = ?auto_102376 ?auto_102384 ) ) ( not ( = ?auto_102377 ?auto_102378 ) ) ( not ( = ?auto_102377 ?auto_102379 ) ) ( not ( = ?auto_102377 ?auto_102380 ) ) ( not ( = ?auto_102377 ?auto_102384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102378 ?auto_102379 ?auto_102380 )
      ( MAKE-6CRATE-VERIFY ?auto_102374 ?auto_102375 ?auto_102376 ?auto_102377 ?auto_102378 ?auto_102379 ?auto_102380 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102438 - SURFACE
      ?auto_102439 - SURFACE
      ?auto_102440 - SURFACE
      ?auto_102441 - SURFACE
      ?auto_102442 - SURFACE
      ?auto_102443 - SURFACE
      ?auto_102444 - SURFACE
    )
    :vars
    (
      ?auto_102447 - HOIST
      ?auto_102448 - PLACE
      ?auto_102449 - PLACE
      ?auto_102446 - HOIST
      ?auto_102450 - SURFACE
      ?auto_102445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_102447 ?auto_102448 ) ( IS-CRATE ?auto_102444 ) ( not ( = ?auto_102443 ?auto_102444 ) ) ( not ( = ?auto_102442 ?auto_102443 ) ) ( not ( = ?auto_102442 ?auto_102444 ) ) ( not ( = ?auto_102449 ?auto_102448 ) ) ( HOIST-AT ?auto_102446 ?auto_102449 ) ( not ( = ?auto_102447 ?auto_102446 ) ) ( AVAILABLE ?auto_102446 ) ( SURFACE-AT ?auto_102444 ?auto_102449 ) ( ON ?auto_102444 ?auto_102450 ) ( CLEAR ?auto_102444 ) ( not ( = ?auto_102443 ?auto_102450 ) ) ( not ( = ?auto_102444 ?auto_102450 ) ) ( not ( = ?auto_102442 ?auto_102450 ) ) ( TRUCK-AT ?auto_102445 ?auto_102448 ) ( SURFACE-AT ?auto_102442 ?auto_102448 ) ( CLEAR ?auto_102442 ) ( LIFTING ?auto_102447 ?auto_102443 ) ( IS-CRATE ?auto_102443 ) ( ON ?auto_102439 ?auto_102438 ) ( ON ?auto_102440 ?auto_102439 ) ( ON ?auto_102441 ?auto_102440 ) ( ON ?auto_102442 ?auto_102441 ) ( not ( = ?auto_102438 ?auto_102439 ) ) ( not ( = ?auto_102438 ?auto_102440 ) ) ( not ( = ?auto_102438 ?auto_102441 ) ) ( not ( = ?auto_102438 ?auto_102442 ) ) ( not ( = ?auto_102438 ?auto_102443 ) ) ( not ( = ?auto_102438 ?auto_102444 ) ) ( not ( = ?auto_102438 ?auto_102450 ) ) ( not ( = ?auto_102439 ?auto_102440 ) ) ( not ( = ?auto_102439 ?auto_102441 ) ) ( not ( = ?auto_102439 ?auto_102442 ) ) ( not ( = ?auto_102439 ?auto_102443 ) ) ( not ( = ?auto_102439 ?auto_102444 ) ) ( not ( = ?auto_102439 ?auto_102450 ) ) ( not ( = ?auto_102440 ?auto_102441 ) ) ( not ( = ?auto_102440 ?auto_102442 ) ) ( not ( = ?auto_102440 ?auto_102443 ) ) ( not ( = ?auto_102440 ?auto_102444 ) ) ( not ( = ?auto_102440 ?auto_102450 ) ) ( not ( = ?auto_102441 ?auto_102442 ) ) ( not ( = ?auto_102441 ?auto_102443 ) ) ( not ( = ?auto_102441 ?auto_102444 ) ) ( not ( = ?auto_102441 ?auto_102450 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102442 ?auto_102443 ?auto_102444 )
      ( MAKE-6CRATE-VERIFY ?auto_102438 ?auto_102439 ?auto_102440 ?auto_102441 ?auto_102442 ?auto_102443 ?auto_102444 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_102502 - SURFACE
      ?auto_102503 - SURFACE
      ?auto_102504 - SURFACE
      ?auto_102505 - SURFACE
      ?auto_102506 - SURFACE
      ?auto_102507 - SURFACE
      ?auto_102508 - SURFACE
    )
    :vars
    (
      ?auto_102510 - HOIST
      ?auto_102511 - PLACE
      ?auto_102512 - PLACE
      ?auto_102513 - HOIST
      ?auto_102509 - SURFACE
      ?auto_102514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_102510 ?auto_102511 ) ( IS-CRATE ?auto_102508 ) ( not ( = ?auto_102507 ?auto_102508 ) ) ( not ( = ?auto_102506 ?auto_102507 ) ) ( not ( = ?auto_102506 ?auto_102508 ) ) ( not ( = ?auto_102512 ?auto_102511 ) ) ( HOIST-AT ?auto_102513 ?auto_102512 ) ( not ( = ?auto_102510 ?auto_102513 ) ) ( AVAILABLE ?auto_102513 ) ( SURFACE-AT ?auto_102508 ?auto_102512 ) ( ON ?auto_102508 ?auto_102509 ) ( CLEAR ?auto_102508 ) ( not ( = ?auto_102507 ?auto_102509 ) ) ( not ( = ?auto_102508 ?auto_102509 ) ) ( not ( = ?auto_102506 ?auto_102509 ) ) ( TRUCK-AT ?auto_102514 ?auto_102511 ) ( SURFACE-AT ?auto_102506 ?auto_102511 ) ( CLEAR ?auto_102506 ) ( IS-CRATE ?auto_102507 ) ( AVAILABLE ?auto_102510 ) ( IN ?auto_102507 ?auto_102514 ) ( ON ?auto_102503 ?auto_102502 ) ( ON ?auto_102504 ?auto_102503 ) ( ON ?auto_102505 ?auto_102504 ) ( ON ?auto_102506 ?auto_102505 ) ( not ( = ?auto_102502 ?auto_102503 ) ) ( not ( = ?auto_102502 ?auto_102504 ) ) ( not ( = ?auto_102502 ?auto_102505 ) ) ( not ( = ?auto_102502 ?auto_102506 ) ) ( not ( = ?auto_102502 ?auto_102507 ) ) ( not ( = ?auto_102502 ?auto_102508 ) ) ( not ( = ?auto_102502 ?auto_102509 ) ) ( not ( = ?auto_102503 ?auto_102504 ) ) ( not ( = ?auto_102503 ?auto_102505 ) ) ( not ( = ?auto_102503 ?auto_102506 ) ) ( not ( = ?auto_102503 ?auto_102507 ) ) ( not ( = ?auto_102503 ?auto_102508 ) ) ( not ( = ?auto_102503 ?auto_102509 ) ) ( not ( = ?auto_102504 ?auto_102505 ) ) ( not ( = ?auto_102504 ?auto_102506 ) ) ( not ( = ?auto_102504 ?auto_102507 ) ) ( not ( = ?auto_102504 ?auto_102508 ) ) ( not ( = ?auto_102504 ?auto_102509 ) ) ( not ( = ?auto_102505 ?auto_102506 ) ) ( not ( = ?auto_102505 ?auto_102507 ) ) ( not ( = ?auto_102505 ?auto_102508 ) ) ( not ( = ?auto_102505 ?auto_102509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_102506 ?auto_102507 ?auto_102508 )
      ( MAKE-6CRATE-VERIFY ?auto_102502 ?auto_102503 ?auto_102504 ?auto_102505 ?auto_102506 ?auto_102507 ?auto_102508 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104458 - SURFACE
      ?auto_104459 - SURFACE
      ?auto_104460 - SURFACE
      ?auto_104461 - SURFACE
      ?auto_104462 - SURFACE
      ?auto_104463 - SURFACE
      ?auto_104464 - SURFACE
      ?auto_104465 - SURFACE
    )
    :vars
    (
      ?auto_104466 - HOIST
      ?auto_104467 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_104466 ?auto_104467 ) ( SURFACE-AT ?auto_104464 ?auto_104467 ) ( CLEAR ?auto_104464 ) ( LIFTING ?auto_104466 ?auto_104465 ) ( IS-CRATE ?auto_104465 ) ( not ( = ?auto_104464 ?auto_104465 ) ) ( ON ?auto_104459 ?auto_104458 ) ( ON ?auto_104460 ?auto_104459 ) ( ON ?auto_104461 ?auto_104460 ) ( ON ?auto_104462 ?auto_104461 ) ( ON ?auto_104463 ?auto_104462 ) ( ON ?auto_104464 ?auto_104463 ) ( not ( = ?auto_104458 ?auto_104459 ) ) ( not ( = ?auto_104458 ?auto_104460 ) ) ( not ( = ?auto_104458 ?auto_104461 ) ) ( not ( = ?auto_104458 ?auto_104462 ) ) ( not ( = ?auto_104458 ?auto_104463 ) ) ( not ( = ?auto_104458 ?auto_104464 ) ) ( not ( = ?auto_104458 ?auto_104465 ) ) ( not ( = ?auto_104459 ?auto_104460 ) ) ( not ( = ?auto_104459 ?auto_104461 ) ) ( not ( = ?auto_104459 ?auto_104462 ) ) ( not ( = ?auto_104459 ?auto_104463 ) ) ( not ( = ?auto_104459 ?auto_104464 ) ) ( not ( = ?auto_104459 ?auto_104465 ) ) ( not ( = ?auto_104460 ?auto_104461 ) ) ( not ( = ?auto_104460 ?auto_104462 ) ) ( not ( = ?auto_104460 ?auto_104463 ) ) ( not ( = ?auto_104460 ?auto_104464 ) ) ( not ( = ?auto_104460 ?auto_104465 ) ) ( not ( = ?auto_104461 ?auto_104462 ) ) ( not ( = ?auto_104461 ?auto_104463 ) ) ( not ( = ?auto_104461 ?auto_104464 ) ) ( not ( = ?auto_104461 ?auto_104465 ) ) ( not ( = ?auto_104462 ?auto_104463 ) ) ( not ( = ?auto_104462 ?auto_104464 ) ) ( not ( = ?auto_104462 ?auto_104465 ) ) ( not ( = ?auto_104463 ?auto_104464 ) ) ( not ( = ?auto_104463 ?auto_104465 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_104464 ?auto_104465 )
      ( MAKE-7CRATE-VERIFY ?auto_104458 ?auto_104459 ?auto_104460 ?auto_104461 ?auto_104462 ?auto_104463 ?auto_104464 ?auto_104465 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104513 - SURFACE
      ?auto_104514 - SURFACE
      ?auto_104515 - SURFACE
      ?auto_104516 - SURFACE
      ?auto_104517 - SURFACE
      ?auto_104518 - SURFACE
      ?auto_104519 - SURFACE
      ?auto_104520 - SURFACE
    )
    :vars
    (
      ?auto_104523 - HOIST
      ?auto_104521 - PLACE
      ?auto_104522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_104523 ?auto_104521 ) ( SURFACE-AT ?auto_104519 ?auto_104521 ) ( CLEAR ?auto_104519 ) ( IS-CRATE ?auto_104520 ) ( not ( = ?auto_104519 ?auto_104520 ) ) ( TRUCK-AT ?auto_104522 ?auto_104521 ) ( AVAILABLE ?auto_104523 ) ( IN ?auto_104520 ?auto_104522 ) ( ON ?auto_104519 ?auto_104518 ) ( not ( = ?auto_104518 ?auto_104519 ) ) ( not ( = ?auto_104518 ?auto_104520 ) ) ( ON ?auto_104514 ?auto_104513 ) ( ON ?auto_104515 ?auto_104514 ) ( ON ?auto_104516 ?auto_104515 ) ( ON ?auto_104517 ?auto_104516 ) ( ON ?auto_104518 ?auto_104517 ) ( not ( = ?auto_104513 ?auto_104514 ) ) ( not ( = ?auto_104513 ?auto_104515 ) ) ( not ( = ?auto_104513 ?auto_104516 ) ) ( not ( = ?auto_104513 ?auto_104517 ) ) ( not ( = ?auto_104513 ?auto_104518 ) ) ( not ( = ?auto_104513 ?auto_104519 ) ) ( not ( = ?auto_104513 ?auto_104520 ) ) ( not ( = ?auto_104514 ?auto_104515 ) ) ( not ( = ?auto_104514 ?auto_104516 ) ) ( not ( = ?auto_104514 ?auto_104517 ) ) ( not ( = ?auto_104514 ?auto_104518 ) ) ( not ( = ?auto_104514 ?auto_104519 ) ) ( not ( = ?auto_104514 ?auto_104520 ) ) ( not ( = ?auto_104515 ?auto_104516 ) ) ( not ( = ?auto_104515 ?auto_104517 ) ) ( not ( = ?auto_104515 ?auto_104518 ) ) ( not ( = ?auto_104515 ?auto_104519 ) ) ( not ( = ?auto_104515 ?auto_104520 ) ) ( not ( = ?auto_104516 ?auto_104517 ) ) ( not ( = ?auto_104516 ?auto_104518 ) ) ( not ( = ?auto_104516 ?auto_104519 ) ) ( not ( = ?auto_104516 ?auto_104520 ) ) ( not ( = ?auto_104517 ?auto_104518 ) ) ( not ( = ?auto_104517 ?auto_104519 ) ) ( not ( = ?auto_104517 ?auto_104520 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104518 ?auto_104519 ?auto_104520 )
      ( MAKE-7CRATE-VERIFY ?auto_104513 ?auto_104514 ?auto_104515 ?auto_104516 ?auto_104517 ?auto_104518 ?auto_104519 ?auto_104520 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104576 - SURFACE
      ?auto_104577 - SURFACE
      ?auto_104578 - SURFACE
      ?auto_104579 - SURFACE
      ?auto_104580 - SURFACE
      ?auto_104581 - SURFACE
      ?auto_104582 - SURFACE
      ?auto_104583 - SURFACE
    )
    :vars
    (
      ?auto_104584 - HOIST
      ?auto_104586 - PLACE
      ?auto_104587 - TRUCK
      ?auto_104585 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_104584 ?auto_104586 ) ( SURFACE-AT ?auto_104582 ?auto_104586 ) ( CLEAR ?auto_104582 ) ( IS-CRATE ?auto_104583 ) ( not ( = ?auto_104582 ?auto_104583 ) ) ( AVAILABLE ?auto_104584 ) ( IN ?auto_104583 ?auto_104587 ) ( ON ?auto_104582 ?auto_104581 ) ( not ( = ?auto_104581 ?auto_104582 ) ) ( not ( = ?auto_104581 ?auto_104583 ) ) ( TRUCK-AT ?auto_104587 ?auto_104585 ) ( not ( = ?auto_104585 ?auto_104586 ) ) ( ON ?auto_104577 ?auto_104576 ) ( ON ?auto_104578 ?auto_104577 ) ( ON ?auto_104579 ?auto_104578 ) ( ON ?auto_104580 ?auto_104579 ) ( ON ?auto_104581 ?auto_104580 ) ( not ( = ?auto_104576 ?auto_104577 ) ) ( not ( = ?auto_104576 ?auto_104578 ) ) ( not ( = ?auto_104576 ?auto_104579 ) ) ( not ( = ?auto_104576 ?auto_104580 ) ) ( not ( = ?auto_104576 ?auto_104581 ) ) ( not ( = ?auto_104576 ?auto_104582 ) ) ( not ( = ?auto_104576 ?auto_104583 ) ) ( not ( = ?auto_104577 ?auto_104578 ) ) ( not ( = ?auto_104577 ?auto_104579 ) ) ( not ( = ?auto_104577 ?auto_104580 ) ) ( not ( = ?auto_104577 ?auto_104581 ) ) ( not ( = ?auto_104577 ?auto_104582 ) ) ( not ( = ?auto_104577 ?auto_104583 ) ) ( not ( = ?auto_104578 ?auto_104579 ) ) ( not ( = ?auto_104578 ?auto_104580 ) ) ( not ( = ?auto_104578 ?auto_104581 ) ) ( not ( = ?auto_104578 ?auto_104582 ) ) ( not ( = ?auto_104578 ?auto_104583 ) ) ( not ( = ?auto_104579 ?auto_104580 ) ) ( not ( = ?auto_104579 ?auto_104581 ) ) ( not ( = ?auto_104579 ?auto_104582 ) ) ( not ( = ?auto_104579 ?auto_104583 ) ) ( not ( = ?auto_104580 ?auto_104581 ) ) ( not ( = ?auto_104580 ?auto_104582 ) ) ( not ( = ?auto_104580 ?auto_104583 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104581 ?auto_104582 ?auto_104583 )
      ( MAKE-7CRATE-VERIFY ?auto_104576 ?auto_104577 ?auto_104578 ?auto_104579 ?auto_104580 ?auto_104581 ?auto_104582 ?auto_104583 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104646 - SURFACE
      ?auto_104647 - SURFACE
      ?auto_104648 - SURFACE
      ?auto_104649 - SURFACE
      ?auto_104650 - SURFACE
      ?auto_104651 - SURFACE
      ?auto_104652 - SURFACE
      ?auto_104653 - SURFACE
    )
    :vars
    (
      ?auto_104656 - HOIST
      ?auto_104658 - PLACE
      ?auto_104654 - TRUCK
      ?auto_104655 - PLACE
      ?auto_104657 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_104656 ?auto_104658 ) ( SURFACE-AT ?auto_104652 ?auto_104658 ) ( CLEAR ?auto_104652 ) ( IS-CRATE ?auto_104653 ) ( not ( = ?auto_104652 ?auto_104653 ) ) ( AVAILABLE ?auto_104656 ) ( ON ?auto_104652 ?auto_104651 ) ( not ( = ?auto_104651 ?auto_104652 ) ) ( not ( = ?auto_104651 ?auto_104653 ) ) ( TRUCK-AT ?auto_104654 ?auto_104655 ) ( not ( = ?auto_104655 ?auto_104658 ) ) ( HOIST-AT ?auto_104657 ?auto_104655 ) ( LIFTING ?auto_104657 ?auto_104653 ) ( not ( = ?auto_104656 ?auto_104657 ) ) ( ON ?auto_104647 ?auto_104646 ) ( ON ?auto_104648 ?auto_104647 ) ( ON ?auto_104649 ?auto_104648 ) ( ON ?auto_104650 ?auto_104649 ) ( ON ?auto_104651 ?auto_104650 ) ( not ( = ?auto_104646 ?auto_104647 ) ) ( not ( = ?auto_104646 ?auto_104648 ) ) ( not ( = ?auto_104646 ?auto_104649 ) ) ( not ( = ?auto_104646 ?auto_104650 ) ) ( not ( = ?auto_104646 ?auto_104651 ) ) ( not ( = ?auto_104646 ?auto_104652 ) ) ( not ( = ?auto_104646 ?auto_104653 ) ) ( not ( = ?auto_104647 ?auto_104648 ) ) ( not ( = ?auto_104647 ?auto_104649 ) ) ( not ( = ?auto_104647 ?auto_104650 ) ) ( not ( = ?auto_104647 ?auto_104651 ) ) ( not ( = ?auto_104647 ?auto_104652 ) ) ( not ( = ?auto_104647 ?auto_104653 ) ) ( not ( = ?auto_104648 ?auto_104649 ) ) ( not ( = ?auto_104648 ?auto_104650 ) ) ( not ( = ?auto_104648 ?auto_104651 ) ) ( not ( = ?auto_104648 ?auto_104652 ) ) ( not ( = ?auto_104648 ?auto_104653 ) ) ( not ( = ?auto_104649 ?auto_104650 ) ) ( not ( = ?auto_104649 ?auto_104651 ) ) ( not ( = ?auto_104649 ?auto_104652 ) ) ( not ( = ?auto_104649 ?auto_104653 ) ) ( not ( = ?auto_104650 ?auto_104651 ) ) ( not ( = ?auto_104650 ?auto_104652 ) ) ( not ( = ?auto_104650 ?auto_104653 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104651 ?auto_104652 ?auto_104653 )
      ( MAKE-7CRATE-VERIFY ?auto_104646 ?auto_104647 ?auto_104648 ?auto_104649 ?auto_104650 ?auto_104651 ?auto_104652 ?auto_104653 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104723 - SURFACE
      ?auto_104724 - SURFACE
      ?auto_104725 - SURFACE
      ?auto_104726 - SURFACE
      ?auto_104727 - SURFACE
      ?auto_104728 - SURFACE
      ?auto_104729 - SURFACE
      ?auto_104730 - SURFACE
    )
    :vars
    (
      ?auto_104732 - HOIST
      ?auto_104736 - PLACE
      ?auto_104734 - TRUCK
      ?auto_104731 - PLACE
      ?auto_104733 - HOIST
      ?auto_104735 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_104732 ?auto_104736 ) ( SURFACE-AT ?auto_104729 ?auto_104736 ) ( CLEAR ?auto_104729 ) ( IS-CRATE ?auto_104730 ) ( not ( = ?auto_104729 ?auto_104730 ) ) ( AVAILABLE ?auto_104732 ) ( ON ?auto_104729 ?auto_104728 ) ( not ( = ?auto_104728 ?auto_104729 ) ) ( not ( = ?auto_104728 ?auto_104730 ) ) ( TRUCK-AT ?auto_104734 ?auto_104731 ) ( not ( = ?auto_104731 ?auto_104736 ) ) ( HOIST-AT ?auto_104733 ?auto_104731 ) ( not ( = ?auto_104732 ?auto_104733 ) ) ( AVAILABLE ?auto_104733 ) ( SURFACE-AT ?auto_104730 ?auto_104731 ) ( ON ?auto_104730 ?auto_104735 ) ( CLEAR ?auto_104730 ) ( not ( = ?auto_104729 ?auto_104735 ) ) ( not ( = ?auto_104730 ?auto_104735 ) ) ( not ( = ?auto_104728 ?auto_104735 ) ) ( ON ?auto_104724 ?auto_104723 ) ( ON ?auto_104725 ?auto_104724 ) ( ON ?auto_104726 ?auto_104725 ) ( ON ?auto_104727 ?auto_104726 ) ( ON ?auto_104728 ?auto_104727 ) ( not ( = ?auto_104723 ?auto_104724 ) ) ( not ( = ?auto_104723 ?auto_104725 ) ) ( not ( = ?auto_104723 ?auto_104726 ) ) ( not ( = ?auto_104723 ?auto_104727 ) ) ( not ( = ?auto_104723 ?auto_104728 ) ) ( not ( = ?auto_104723 ?auto_104729 ) ) ( not ( = ?auto_104723 ?auto_104730 ) ) ( not ( = ?auto_104723 ?auto_104735 ) ) ( not ( = ?auto_104724 ?auto_104725 ) ) ( not ( = ?auto_104724 ?auto_104726 ) ) ( not ( = ?auto_104724 ?auto_104727 ) ) ( not ( = ?auto_104724 ?auto_104728 ) ) ( not ( = ?auto_104724 ?auto_104729 ) ) ( not ( = ?auto_104724 ?auto_104730 ) ) ( not ( = ?auto_104724 ?auto_104735 ) ) ( not ( = ?auto_104725 ?auto_104726 ) ) ( not ( = ?auto_104725 ?auto_104727 ) ) ( not ( = ?auto_104725 ?auto_104728 ) ) ( not ( = ?auto_104725 ?auto_104729 ) ) ( not ( = ?auto_104725 ?auto_104730 ) ) ( not ( = ?auto_104725 ?auto_104735 ) ) ( not ( = ?auto_104726 ?auto_104727 ) ) ( not ( = ?auto_104726 ?auto_104728 ) ) ( not ( = ?auto_104726 ?auto_104729 ) ) ( not ( = ?auto_104726 ?auto_104730 ) ) ( not ( = ?auto_104726 ?auto_104735 ) ) ( not ( = ?auto_104727 ?auto_104728 ) ) ( not ( = ?auto_104727 ?auto_104729 ) ) ( not ( = ?auto_104727 ?auto_104730 ) ) ( not ( = ?auto_104727 ?auto_104735 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104728 ?auto_104729 ?auto_104730 )
      ( MAKE-7CRATE-VERIFY ?auto_104723 ?auto_104724 ?auto_104725 ?auto_104726 ?auto_104727 ?auto_104728 ?auto_104729 ?auto_104730 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104801 - SURFACE
      ?auto_104802 - SURFACE
      ?auto_104803 - SURFACE
      ?auto_104804 - SURFACE
      ?auto_104805 - SURFACE
      ?auto_104806 - SURFACE
      ?auto_104807 - SURFACE
      ?auto_104808 - SURFACE
    )
    :vars
    (
      ?auto_104814 - HOIST
      ?auto_104813 - PLACE
      ?auto_104810 - PLACE
      ?auto_104811 - HOIST
      ?auto_104809 - SURFACE
      ?auto_104812 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_104814 ?auto_104813 ) ( SURFACE-AT ?auto_104807 ?auto_104813 ) ( CLEAR ?auto_104807 ) ( IS-CRATE ?auto_104808 ) ( not ( = ?auto_104807 ?auto_104808 ) ) ( AVAILABLE ?auto_104814 ) ( ON ?auto_104807 ?auto_104806 ) ( not ( = ?auto_104806 ?auto_104807 ) ) ( not ( = ?auto_104806 ?auto_104808 ) ) ( not ( = ?auto_104810 ?auto_104813 ) ) ( HOIST-AT ?auto_104811 ?auto_104810 ) ( not ( = ?auto_104814 ?auto_104811 ) ) ( AVAILABLE ?auto_104811 ) ( SURFACE-AT ?auto_104808 ?auto_104810 ) ( ON ?auto_104808 ?auto_104809 ) ( CLEAR ?auto_104808 ) ( not ( = ?auto_104807 ?auto_104809 ) ) ( not ( = ?auto_104808 ?auto_104809 ) ) ( not ( = ?auto_104806 ?auto_104809 ) ) ( TRUCK-AT ?auto_104812 ?auto_104813 ) ( ON ?auto_104802 ?auto_104801 ) ( ON ?auto_104803 ?auto_104802 ) ( ON ?auto_104804 ?auto_104803 ) ( ON ?auto_104805 ?auto_104804 ) ( ON ?auto_104806 ?auto_104805 ) ( not ( = ?auto_104801 ?auto_104802 ) ) ( not ( = ?auto_104801 ?auto_104803 ) ) ( not ( = ?auto_104801 ?auto_104804 ) ) ( not ( = ?auto_104801 ?auto_104805 ) ) ( not ( = ?auto_104801 ?auto_104806 ) ) ( not ( = ?auto_104801 ?auto_104807 ) ) ( not ( = ?auto_104801 ?auto_104808 ) ) ( not ( = ?auto_104801 ?auto_104809 ) ) ( not ( = ?auto_104802 ?auto_104803 ) ) ( not ( = ?auto_104802 ?auto_104804 ) ) ( not ( = ?auto_104802 ?auto_104805 ) ) ( not ( = ?auto_104802 ?auto_104806 ) ) ( not ( = ?auto_104802 ?auto_104807 ) ) ( not ( = ?auto_104802 ?auto_104808 ) ) ( not ( = ?auto_104802 ?auto_104809 ) ) ( not ( = ?auto_104803 ?auto_104804 ) ) ( not ( = ?auto_104803 ?auto_104805 ) ) ( not ( = ?auto_104803 ?auto_104806 ) ) ( not ( = ?auto_104803 ?auto_104807 ) ) ( not ( = ?auto_104803 ?auto_104808 ) ) ( not ( = ?auto_104803 ?auto_104809 ) ) ( not ( = ?auto_104804 ?auto_104805 ) ) ( not ( = ?auto_104804 ?auto_104806 ) ) ( not ( = ?auto_104804 ?auto_104807 ) ) ( not ( = ?auto_104804 ?auto_104808 ) ) ( not ( = ?auto_104804 ?auto_104809 ) ) ( not ( = ?auto_104805 ?auto_104806 ) ) ( not ( = ?auto_104805 ?auto_104807 ) ) ( not ( = ?auto_104805 ?auto_104808 ) ) ( not ( = ?auto_104805 ?auto_104809 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104806 ?auto_104807 ?auto_104808 )
      ( MAKE-7CRATE-VERIFY ?auto_104801 ?auto_104802 ?auto_104803 ?auto_104804 ?auto_104805 ?auto_104806 ?auto_104807 ?auto_104808 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104879 - SURFACE
      ?auto_104880 - SURFACE
      ?auto_104881 - SURFACE
      ?auto_104882 - SURFACE
      ?auto_104883 - SURFACE
      ?auto_104884 - SURFACE
      ?auto_104885 - SURFACE
      ?auto_104886 - SURFACE
    )
    :vars
    (
      ?auto_104891 - HOIST
      ?auto_104887 - PLACE
      ?auto_104892 - PLACE
      ?auto_104890 - HOIST
      ?auto_104888 - SURFACE
      ?auto_104889 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_104891 ?auto_104887 ) ( IS-CRATE ?auto_104886 ) ( not ( = ?auto_104885 ?auto_104886 ) ) ( not ( = ?auto_104884 ?auto_104885 ) ) ( not ( = ?auto_104884 ?auto_104886 ) ) ( not ( = ?auto_104892 ?auto_104887 ) ) ( HOIST-AT ?auto_104890 ?auto_104892 ) ( not ( = ?auto_104891 ?auto_104890 ) ) ( AVAILABLE ?auto_104890 ) ( SURFACE-AT ?auto_104886 ?auto_104892 ) ( ON ?auto_104886 ?auto_104888 ) ( CLEAR ?auto_104886 ) ( not ( = ?auto_104885 ?auto_104888 ) ) ( not ( = ?auto_104886 ?auto_104888 ) ) ( not ( = ?auto_104884 ?auto_104888 ) ) ( TRUCK-AT ?auto_104889 ?auto_104887 ) ( SURFACE-AT ?auto_104884 ?auto_104887 ) ( CLEAR ?auto_104884 ) ( LIFTING ?auto_104891 ?auto_104885 ) ( IS-CRATE ?auto_104885 ) ( ON ?auto_104880 ?auto_104879 ) ( ON ?auto_104881 ?auto_104880 ) ( ON ?auto_104882 ?auto_104881 ) ( ON ?auto_104883 ?auto_104882 ) ( ON ?auto_104884 ?auto_104883 ) ( not ( = ?auto_104879 ?auto_104880 ) ) ( not ( = ?auto_104879 ?auto_104881 ) ) ( not ( = ?auto_104879 ?auto_104882 ) ) ( not ( = ?auto_104879 ?auto_104883 ) ) ( not ( = ?auto_104879 ?auto_104884 ) ) ( not ( = ?auto_104879 ?auto_104885 ) ) ( not ( = ?auto_104879 ?auto_104886 ) ) ( not ( = ?auto_104879 ?auto_104888 ) ) ( not ( = ?auto_104880 ?auto_104881 ) ) ( not ( = ?auto_104880 ?auto_104882 ) ) ( not ( = ?auto_104880 ?auto_104883 ) ) ( not ( = ?auto_104880 ?auto_104884 ) ) ( not ( = ?auto_104880 ?auto_104885 ) ) ( not ( = ?auto_104880 ?auto_104886 ) ) ( not ( = ?auto_104880 ?auto_104888 ) ) ( not ( = ?auto_104881 ?auto_104882 ) ) ( not ( = ?auto_104881 ?auto_104883 ) ) ( not ( = ?auto_104881 ?auto_104884 ) ) ( not ( = ?auto_104881 ?auto_104885 ) ) ( not ( = ?auto_104881 ?auto_104886 ) ) ( not ( = ?auto_104881 ?auto_104888 ) ) ( not ( = ?auto_104882 ?auto_104883 ) ) ( not ( = ?auto_104882 ?auto_104884 ) ) ( not ( = ?auto_104882 ?auto_104885 ) ) ( not ( = ?auto_104882 ?auto_104886 ) ) ( not ( = ?auto_104882 ?auto_104888 ) ) ( not ( = ?auto_104883 ?auto_104884 ) ) ( not ( = ?auto_104883 ?auto_104885 ) ) ( not ( = ?auto_104883 ?auto_104886 ) ) ( not ( = ?auto_104883 ?auto_104888 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104884 ?auto_104885 ?auto_104886 )
      ( MAKE-7CRATE-VERIFY ?auto_104879 ?auto_104880 ?auto_104881 ?auto_104882 ?auto_104883 ?auto_104884 ?auto_104885 ?auto_104886 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_104957 - SURFACE
      ?auto_104958 - SURFACE
      ?auto_104959 - SURFACE
      ?auto_104960 - SURFACE
      ?auto_104961 - SURFACE
      ?auto_104962 - SURFACE
      ?auto_104963 - SURFACE
      ?auto_104964 - SURFACE
    )
    :vars
    (
      ?auto_104969 - HOIST
      ?auto_104968 - PLACE
      ?auto_104970 - PLACE
      ?auto_104966 - HOIST
      ?auto_104967 - SURFACE
      ?auto_104965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_104969 ?auto_104968 ) ( IS-CRATE ?auto_104964 ) ( not ( = ?auto_104963 ?auto_104964 ) ) ( not ( = ?auto_104962 ?auto_104963 ) ) ( not ( = ?auto_104962 ?auto_104964 ) ) ( not ( = ?auto_104970 ?auto_104968 ) ) ( HOIST-AT ?auto_104966 ?auto_104970 ) ( not ( = ?auto_104969 ?auto_104966 ) ) ( AVAILABLE ?auto_104966 ) ( SURFACE-AT ?auto_104964 ?auto_104970 ) ( ON ?auto_104964 ?auto_104967 ) ( CLEAR ?auto_104964 ) ( not ( = ?auto_104963 ?auto_104967 ) ) ( not ( = ?auto_104964 ?auto_104967 ) ) ( not ( = ?auto_104962 ?auto_104967 ) ) ( TRUCK-AT ?auto_104965 ?auto_104968 ) ( SURFACE-AT ?auto_104962 ?auto_104968 ) ( CLEAR ?auto_104962 ) ( IS-CRATE ?auto_104963 ) ( AVAILABLE ?auto_104969 ) ( IN ?auto_104963 ?auto_104965 ) ( ON ?auto_104958 ?auto_104957 ) ( ON ?auto_104959 ?auto_104958 ) ( ON ?auto_104960 ?auto_104959 ) ( ON ?auto_104961 ?auto_104960 ) ( ON ?auto_104962 ?auto_104961 ) ( not ( = ?auto_104957 ?auto_104958 ) ) ( not ( = ?auto_104957 ?auto_104959 ) ) ( not ( = ?auto_104957 ?auto_104960 ) ) ( not ( = ?auto_104957 ?auto_104961 ) ) ( not ( = ?auto_104957 ?auto_104962 ) ) ( not ( = ?auto_104957 ?auto_104963 ) ) ( not ( = ?auto_104957 ?auto_104964 ) ) ( not ( = ?auto_104957 ?auto_104967 ) ) ( not ( = ?auto_104958 ?auto_104959 ) ) ( not ( = ?auto_104958 ?auto_104960 ) ) ( not ( = ?auto_104958 ?auto_104961 ) ) ( not ( = ?auto_104958 ?auto_104962 ) ) ( not ( = ?auto_104958 ?auto_104963 ) ) ( not ( = ?auto_104958 ?auto_104964 ) ) ( not ( = ?auto_104958 ?auto_104967 ) ) ( not ( = ?auto_104959 ?auto_104960 ) ) ( not ( = ?auto_104959 ?auto_104961 ) ) ( not ( = ?auto_104959 ?auto_104962 ) ) ( not ( = ?auto_104959 ?auto_104963 ) ) ( not ( = ?auto_104959 ?auto_104964 ) ) ( not ( = ?auto_104959 ?auto_104967 ) ) ( not ( = ?auto_104960 ?auto_104961 ) ) ( not ( = ?auto_104960 ?auto_104962 ) ) ( not ( = ?auto_104960 ?auto_104963 ) ) ( not ( = ?auto_104960 ?auto_104964 ) ) ( not ( = ?auto_104960 ?auto_104967 ) ) ( not ( = ?auto_104961 ?auto_104962 ) ) ( not ( = ?auto_104961 ?auto_104963 ) ) ( not ( = ?auto_104961 ?auto_104964 ) ) ( not ( = ?auto_104961 ?auto_104967 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_104962 ?auto_104963 ?auto_104964 )
      ( MAKE-7CRATE-VERIFY ?auto_104957 ?auto_104958 ?auto_104959 ?auto_104960 ?auto_104961 ?auto_104962 ?auto_104963 ?auto_104964 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_107866 - SURFACE
      ?auto_107867 - SURFACE
      ?auto_107868 - SURFACE
      ?auto_107869 - SURFACE
      ?auto_107870 - SURFACE
      ?auto_107871 - SURFACE
      ?auto_107872 - SURFACE
      ?auto_107873 - SURFACE
      ?auto_107874 - SURFACE
    )
    :vars
    (
      ?auto_107876 - HOIST
      ?auto_107875 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_107876 ?auto_107875 ) ( SURFACE-AT ?auto_107873 ?auto_107875 ) ( CLEAR ?auto_107873 ) ( LIFTING ?auto_107876 ?auto_107874 ) ( IS-CRATE ?auto_107874 ) ( not ( = ?auto_107873 ?auto_107874 ) ) ( ON ?auto_107867 ?auto_107866 ) ( ON ?auto_107868 ?auto_107867 ) ( ON ?auto_107869 ?auto_107868 ) ( ON ?auto_107870 ?auto_107869 ) ( ON ?auto_107871 ?auto_107870 ) ( ON ?auto_107872 ?auto_107871 ) ( ON ?auto_107873 ?auto_107872 ) ( not ( = ?auto_107866 ?auto_107867 ) ) ( not ( = ?auto_107866 ?auto_107868 ) ) ( not ( = ?auto_107866 ?auto_107869 ) ) ( not ( = ?auto_107866 ?auto_107870 ) ) ( not ( = ?auto_107866 ?auto_107871 ) ) ( not ( = ?auto_107866 ?auto_107872 ) ) ( not ( = ?auto_107866 ?auto_107873 ) ) ( not ( = ?auto_107866 ?auto_107874 ) ) ( not ( = ?auto_107867 ?auto_107868 ) ) ( not ( = ?auto_107867 ?auto_107869 ) ) ( not ( = ?auto_107867 ?auto_107870 ) ) ( not ( = ?auto_107867 ?auto_107871 ) ) ( not ( = ?auto_107867 ?auto_107872 ) ) ( not ( = ?auto_107867 ?auto_107873 ) ) ( not ( = ?auto_107867 ?auto_107874 ) ) ( not ( = ?auto_107868 ?auto_107869 ) ) ( not ( = ?auto_107868 ?auto_107870 ) ) ( not ( = ?auto_107868 ?auto_107871 ) ) ( not ( = ?auto_107868 ?auto_107872 ) ) ( not ( = ?auto_107868 ?auto_107873 ) ) ( not ( = ?auto_107868 ?auto_107874 ) ) ( not ( = ?auto_107869 ?auto_107870 ) ) ( not ( = ?auto_107869 ?auto_107871 ) ) ( not ( = ?auto_107869 ?auto_107872 ) ) ( not ( = ?auto_107869 ?auto_107873 ) ) ( not ( = ?auto_107869 ?auto_107874 ) ) ( not ( = ?auto_107870 ?auto_107871 ) ) ( not ( = ?auto_107870 ?auto_107872 ) ) ( not ( = ?auto_107870 ?auto_107873 ) ) ( not ( = ?auto_107870 ?auto_107874 ) ) ( not ( = ?auto_107871 ?auto_107872 ) ) ( not ( = ?auto_107871 ?auto_107873 ) ) ( not ( = ?auto_107871 ?auto_107874 ) ) ( not ( = ?auto_107872 ?auto_107873 ) ) ( not ( = ?auto_107872 ?auto_107874 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_107873 ?auto_107874 )
      ( MAKE-8CRATE-VERIFY ?auto_107866 ?auto_107867 ?auto_107868 ?auto_107869 ?auto_107870 ?auto_107871 ?auto_107872 ?auto_107873 ?auto_107874 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_107933 - SURFACE
      ?auto_107934 - SURFACE
      ?auto_107935 - SURFACE
      ?auto_107936 - SURFACE
      ?auto_107937 - SURFACE
      ?auto_107938 - SURFACE
      ?auto_107939 - SURFACE
      ?auto_107940 - SURFACE
      ?auto_107941 - SURFACE
    )
    :vars
    (
      ?auto_107943 - HOIST
      ?auto_107944 - PLACE
      ?auto_107942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_107943 ?auto_107944 ) ( SURFACE-AT ?auto_107940 ?auto_107944 ) ( CLEAR ?auto_107940 ) ( IS-CRATE ?auto_107941 ) ( not ( = ?auto_107940 ?auto_107941 ) ) ( TRUCK-AT ?auto_107942 ?auto_107944 ) ( AVAILABLE ?auto_107943 ) ( IN ?auto_107941 ?auto_107942 ) ( ON ?auto_107940 ?auto_107939 ) ( not ( = ?auto_107939 ?auto_107940 ) ) ( not ( = ?auto_107939 ?auto_107941 ) ) ( ON ?auto_107934 ?auto_107933 ) ( ON ?auto_107935 ?auto_107934 ) ( ON ?auto_107936 ?auto_107935 ) ( ON ?auto_107937 ?auto_107936 ) ( ON ?auto_107938 ?auto_107937 ) ( ON ?auto_107939 ?auto_107938 ) ( not ( = ?auto_107933 ?auto_107934 ) ) ( not ( = ?auto_107933 ?auto_107935 ) ) ( not ( = ?auto_107933 ?auto_107936 ) ) ( not ( = ?auto_107933 ?auto_107937 ) ) ( not ( = ?auto_107933 ?auto_107938 ) ) ( not ( = ?auto_107933 ?auto_107939 ) ) ( not ( = ?auto_107933 ?auto_107940 ) ) ( not ( = ?auto_107933 ?auto_107941 ) ) ( not ( = ?auto_107934 ?auto_107935 ) ) ( not ( = ?auto_107934 ?auto_107936 ) ) ( not ( = ?auto_107934 ?auto_107937 ) ) ( not ( = ?auto_107934 ?auto_107938 ) ) ( not ( = ?auto_107934 ?auto_107939 ) ) ( not ( = ?auto_107934 ?auto_107940 ) ) ( not ( = ?auto_107934 ?auto_107941 ) ) ( not ( = ?auto_107935 ?auto_107936 ) ) ( not ( = ?auto_107935 ?auto_107937 ) ) ( not ( = ?auto_107935 ?auto_107938 ) ) ( not ( = ?auto_107935 ?auto_107939 ) ) ( not ( = ?auto_107935 ?auto_107940 ) ) ( not ( = ?auto_107935 ?auto_107941 ) ) ( not ( = ?auto_107936 ?auto_107937 ) ) ( not ( = ?auto_107936 ?auto_107938 ) ) ( not ( = ?auto_107936 ?auto_107939 ) ) ( not ( = ?auto_107936 ?auto_107940 ) ) ( not ( = ?auto_107936 ?auto_107941 ) ) ( not ( = ?auto_107937 ?auto_107938 ) ) ( not ( = ?auto_107937 ?auto_107939 ) ) ( not ( = ?auto_107937 ?auto_107940 ) ) ( not ( = ?auto_107937 ?auto_107941 ) ) ( not ( = ?auto_107938 ?auto_107939 ) ) ( not ( = ?auto_107938 ?auto_107940 ) ) ( not ( = ?auto_107938 ?auto_107941 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_107939 ?auto_107940 ?auto_107941 )
      ( MAKE-8CRATE-VERIFY ?auto_107933 ?auto_107934 ?auto_107935 ?auto_107936 ?auto_107937 ?auto_107938 ?auto_107939 ?auto_107940 ?auto_107941 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_108009 - SURFACE
      ?auto_108010 - SURFACE
      ?auto_108011 - SURFACE
      ?auto_108012 - SURFACE
      ?auto_108013 - SURFACE
      ?auto_108014 - SURFACE
      ?auto_108015 - SURFACE
      ?auto_108016 - SURFACE
      ?auto_108017 - SURFACE
    )
    :vars
    (
      ?auto_108018 - HOIST
      ?auto_108019 - PLACE
      ?auto_108020 - TRUCK
      ?auto_108021 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_108018 ?auto_108019 ) ( SURFACE-AT ?auto_108016 ?auto_108019 ) ( CLEAR ?auto_108016 ) ( IS-CRATE ?auto_108017 ) ( not ( = ?auto_108016 ?auto_108017 ) ) ( AVAILABLE ?auto_108018 ) ( IN ?auto_108017 ?auto_108020 ) ( ON ?auto_108016 ?auto_108015 ) ( not ( = ?auto_108015 ?auto_108016 ) ) ( not ( = ?auto_108015 ?auto_108017 ) ) ( TRUCK-AT ?auto_108020 ?auto_108021 ) ( not ( = ?auto_108021 ?auto_108019 ) ) ( ON ?auto_108010 ?auto_108009 ) ( ON ?auto_108011 ?auto_108010 ) ( ON ?auto_108012 ?auto_108011 ) ( ON ?auto_108013 ?auto_108012 ) ( ON ?auto_108014 ?auto_108013 ) ( ON ?auto_108015 ?auto_108014 ) ( not ( = ?auto_108009 ?auto_108010 ) ) ( not ( = ?auto_108009 ?auto_108011 ) ) ( not ( = ?auto_108009 ?auto_108012 ) ) ( not ( = ?auto_108009 ?auto_108013 ) ) ( not ( = ?auto_108009 ?auto_108014 ) ) ( not ( = ?auto_108009 ?auto_108015 ) ) ( not ( = ?auto_108009 ?auto_108016 ) ) ( not ( = ?auto_108009 ?auto_108017 ) ) ( not ( = ?auto_108010 ?auto_108011 ) ) ( not ( = ?auto_108010 ?auto_108012 ) ) ( not ( = ?auto_108010 ?auto_108013 ) ) ( not ( = ?auto_108010 ?auto_108014 ) ) ( not ( = ?auto_108010 ?auto_108015 ) ) ( not ( = ?auto_108010 ?auto_108016 ) ) ( not ( = ?auto_108010 ?auto_108017 ) ) ( not ( = ?auto_108011 ?auto_108012 ) ) ( not ( = ?auto_108011 ?auto_108013 ) ) ( not ( = ?auto_108011 ?auto_108014 ) ) ( not ( = ?auto_108011 ?auto_108015 ) ) ( not ( = ?auto_108011 ?auto_108016 ) ) ( not ( = ?auto_108011 ?auto_108017 ) ) ( not ( = ?auto_108012 ?auto_108013 ) ) ( not ( = ?auto_108012 ?auto_108014 ) ) ( not ( = ?auto_108012 ?auto_108015 ) ) ( not ( = ?auto_108012 ?auto_108016 ) ) ( not ( = ?auto_108012 ?auto_108017 ) ) ( not ( = ?auto_108013 ?auto_108014 ) ) ( not ( = ?auto_108013 ?auto_108015 ) ) ( not ( = ?auto_108013 ?auto_108016 ) ) ( not ( = ?auto_108013 ?auto_108017 ) ) ( not ( = ?auto_108014 ?auto_108015 ) ) ( not ( = ?auto_108014 ?auto_108016 ) ) ( not ( = ?auto_108014 ?auto_108017 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_108015 ?auto_108016 ?auto_108017 )
      ( MAKE-8CRATE-VERIFY ?auto_108009 ?auto_108010 ?auto_108011 ?auto_108012 ?auto_108013 ?auto_108014 ?auto_108015 ?auto_108016 ?auto_108017 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_108093 - SURFACE
      ?auto_108094 - SURFACE
      ?auto_108095 - SURFACE
      ?auto_108096 - SURFACE
      ?auto_108097 - SURFACE
      ?auto_108098 - SURFACE
      ?auto_108099 - SURFACE
      ?auto_108100 - SURFACE
      ?auto_108101 - SURFACE
    )
    :vars
    (
      ?auto_108106 - HOIST
      ?auto_108104 - PLACE
      ?auto_108105 - TRUCK
      ?auto_108102 - PLACE
      ?auto_108103 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_108106 ?auto_108104 ) ( SURFACE-AT ?auto_108100 ?auto_108104 ) ( CLEAR ?auto_108100 ) ( IS-CRATE ?auto_108101 ) ( not ( = ?auto_108100 ?auto_108101 ) ) ( AVAILABLE ?auto_108106 ) ( ON ?auto_108100 ?auto_108099 ) ( not ( = ?auto_108099 ?auto_108100 ) ) ( not ( = ?auto_108099 ?auto_108101 ) ) ( TRUCK-AT ?auto_108105 ?auto_108102 ) ( not ( = ?auto_108102 ?auto_108104 ) ) ( HOIST-AT ?auto_108103 ?auto_108102 ) ( LIFTING ?auto_108103 ?auto_108101 ) ( not ( = ?auto_108106 ?auto_108103 ) ) ( ON ?auto_108094 ?auto_108093 ) ( ON ?auto_108095 ?auto_108094 ) ( ON ?auto_108096 ?auto_108095 ) ( ON ?auto_108097 ?auto_108096 ) ( ON ?auto_108098 ?auto_108097 ) ( ON ?auto_108099 ?auto_108098 ) ( not ( = ?auto_108093 ?auto_108094 ) ) ( not ( = ?auto_108093 ?auto_108095 ) ) ( not ( = ?auto_108093 ?auto_108096 ) ) ( not ( = ?auto_108093 ?auto_108097 ) ) ( not ( = ?auto_108093 ?auto_108098 ) ) ( not ( = ?auto_108093 ?auto_108099 ) ) ( not ( = ?auto_108093 ?auto_108100 ) ) ( not ( = ?auto_108093 ?auto_108101 ) ) ( not ( = ?auto_108094 ?auto_108095 ) ) ( not ( = ?auto_108094 ?auto_108096 ) ) ( not ( = ?auto_108094 ?auto_108097 ) ) ( not ( = ?auto_108094 ?auto_108098 ) ) ( not ( = ?auto_108094 ?auto_108099 ) ) ( not ( = ?auto_108094 ?auto_108100 ) ) ( not ( = ?auto_108094 ?auto_108101 ) ) ( not ( = ?auto_108095 ?auto_108096 ) ) ( not ( = ?auto_108095 ?auto_108097 ) ) ( not ( = ?auto_108095 ?auto_108098 ) ) ( not ( = ?auto_108095 ?auto_108099 ) ) ( not ( = ?auto_108095 ?auto_108100 ) ) ( not ( = ?auto_108095 ?auto_108101 ) ) ( not ( = ?auto_108096 ?auto_108097 ) ) ( not ( = ?auto_108096 ?auto_108098 ) ) ( not ( = ?auto_108096 ?auto_108099 ) ) ( not ( = ?auto_108096 ?auto_108100 ) ) ( not ( = ?auto_108096 ?auto_108101 ) ) ( not ( = ?auto_108097 ?auto_108098 ) ) ( not ( = ?auto_108097 ?auto_108099 ) ) ( not ( = ?auto_108097 ?auto_108100 ) ) ( not ( = ?auto_108097 ?auto_108101 ) ) ( not ( = ?auto_108098 ?auto_108099 ) ) ( not ( = ?auto_108098 ?auto_108100 ) ) ( not ( = ?auto_108098 ?auto_108101 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_108099 ?auto_108100 ?auto_108101 )
      ( MAKE-8CRATE-VERIFY ?auto_108093 ?auto_108094 ?auto_108095 ?auto_108096 ?auto_108097 ?auto_108098 ?auto_108099 ?auto_108100 ?auto_108101 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_108185 - SURFACE
      ?auto_108186 - SURFACE
      ?auto_108187 - SURFACE
      ?auto_108188 - SURFACE
      ?auto_108189 - SURFACE
      ?auto_108190 - SURFACE
      ?auto_108191 - SURFACE
      ?auto_108192 - SURFACE
      ?auto_108193 - SURFACE
    )
    :vars
    (
      ?auto_108196 - HOIST
      ?auto_108198 - PLACE
      ?auto_108194 - TRUCK
      ?auto_108197 - PLACE
      ?auto_108195 - HOIST
      ?auto_108199 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_108196 ?auto_108198 ) ( SURFACE-AT ?auto_108192 ?auto_108198 ) ( CLEAR ?auto_108192 ) ( IS-CRATE ?auto_108193 ) ( not ( = ?auto_108192 ?auto_108193 ) ) ( AVAILABLE ?auto_108196 ) ( ON ?auto_108192 ?auto_108191 ) ( not ( = ?auto_108191 ?auto_108192 ) ) ( not ( = ?auto_108191 ?auto_108193 ) ) ( TRUCK-AT ?auto_108194 ?auto_108197 ) ( not ( = ?auto_108197 ?auto_108198 ) ) ( HOIST-AT ?auto_108195 ?auto_108197 ) ( not ( = ?auto_108196 ?auto_108195 ) ) ( AVAILABLE ?auto_108195 ) ( SURFACE-AT ?auto_108193 ?auto_108197 ) ( ON ?auto_108193 ?auto_108199 ) ( CLEAR ?auto_108193 ) ( not ( = ?auto_108192 ?auto_108199 ) ) ( not ( = ?auto_108193 ?auto_108199 ) ) ( not ( = ?auto_108191 ?auto_108199 ) ) ( ON ?auto_108186 ?auto_108185 ) ( ON ?auto_108187 ?auto_108186 ) ( ON ?auto_108188 ?auto_108187 ) ( ON ?auto_108189 ?auto_108188 ) ( ON ?auto_108190 ?auto_108189 ) ( ON ?auto_108191 ?auto_108190 ) ( not ( = ?auto_108185 ?auto_108186 ) ) ( not ( = ?auto_108185 ?auto_108187 ) ) ( not ( = ?auto_108185 ?auto_108188 ) ) ( not ( = ?auto_108185 ?auto_108189 ) ) ( not ( = ?auto_108185 ?auto_108190 ) ) ( not ( = ?auto_108185 ?auto_108191 ) ) ( not ( = ?auto_108185 ?auto_108192 ) ) ( not ( = ?auto_108185 ?auto_108193 ) ) ( not ( = ?auto_108185 ?auto_108199 ) ) ( not ( = ?auto_108186 ?auto_108187 ) ) ( not ( = ?auto_108186 ?auto_108188 ) ) ( not ( = ?auto_108186 ?auto_108189 ) ) ( not ( = ?auto_108186 ?auto_108190 ) ) ( not ( = ?auto_108186 ?auto_108191 ) ) ( not ( = ?auto_108186 ?auto_108192 ) ) ( not ( = ?auto_108186 ?auto_108193 ) ) ( not ( = ?auto_108186 ?auto_108199 ) ) ( not ( = ?auto_108187 ?auto_108188 ) ) ( not ( = ?auto_108187 ?auto_108189 ) ) ( not ( = ?auto_108187 ?auto_108190 ) ) ( not ( = ?auto_108187 ?auto_108191 ) ) ( not ( = ?auto_108187 ?auto_108192 ) ) ( not ( = ?auto_108187 ?auto_108193 ) ) ( not ( = ?auto_108187 ?auto_108199 ) ) ( not ( = ?auto_108188 ?auto_108189 ) ) ( not ( = ?auto_108188 ?auto_108190 ) ) ( not ( = ?auto_108188 ?auto_108191 ) ) ( not ( = ?auto_108188 ?auto_108192 ) ) ( not ( = ?auto_108188 ?auto_108193 ) ) ( not ( = ?auto_108188 ?auto_108199 ) ) ( not ( = ?auto_108189 ?auto_108190 ) ) ( not ( = ?auto_108189 ?auto_108191 ) ) ( not ( = ?auto_108189 ?auto_108192 ) ) ( not ( = ?auto_108189 ?auto_108193 ) ) ( not ( = ?auto_108189 ?auto_108199 ) ) ( not ( = ?auto_108190 ?auto_108191 ) ) ( not ( = ?auto_108190 ?auto_108192 ) ) ( not ( = ?auto_108190 ?auto_108193 ) ) ( not ( = ?auto_108190 ?auto_108199 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_108191 ?auto_108192 ?auto_108193 )
      ( MAKE-8CRATE-VERIFY ?auto_108185 ?auto_108186 ?auto_108187 ?auto_108188 ?auto_108189 ?auto_108190 ?auto_108191 ?auto_108192 ?auto_108193 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_108278 - SURFACE
      ?auto_108279 - SURFACE
      ?auto_108280 - SURFACE
      ?auto_108281 - SURFACE
      ?auto_108282 - SURFACE
      ?auto_108283 - SURFACE
      ?auto_108284 - SURFACE
      ?auto_108285 - SURFACE
      ?auto_108286 - SURFACE
    )
    :vars
    (
      ?auto_108289 - HOIST
      ?auto_108292 - PLACE
      ?auto_108287 - PLACE
      ?auto_108290 - HOIST
      ?auto_108291 - SURFACE
      ?auto_108288 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_108289 ?auto_108292 ) ( SURFACE-AT ?auto_108285 ?auto_108292 ) ( CLEAR ?auto_108285 ) ( IS-CRATE ?auto_108286 ) ( not ( = ?auto_108285 ?auto_108286 ) ) ( AVAILABLE ?auto_108289 ) ( ON ?auto_108285 ?auto_108284 ) ( not ( = ?auto_108284 ?auto_108285 ) ) ( not ( = ?auto_108284 ?auto_108286 ) ) ( not ( = ?auto_108287 ?auto_108292 ) ) ( HOIST-AT ?auto_108290 ?auto_108287 ) ( not ( = ?auto_108289 ?auto_108290 ) ) ( AVAILABLE ?auto_108290 ) ( SURFACE-AT ?auto_108286 ?auto_108287 ) ( ON ?auto_108286 ?auto_108291 ) ( CLEAR ?auto_108286 ) ( not ( = ?auto_108285 ?auto_108291 ) ) ( not ( = ?auto_108286 ?auto_108291 ) ) ( not ( = ?auto_108284 ?auto_108291 ) ) ( TRUCK-AT ?auto_108288 ?auto_108292 ) ( ON ?auto_108279 ?auto_108278 ) ( ON ?auto_108280 ?auto_108279 ) ( ON ?auto_108281 ?auto_108280 ) ( ON ?auto_108282 ?auto_108281 ) ( ON ?auto_108283 ?auto_108282 ) ( ON ?auto_108284 ?auto_108283 ) ( not ( = ?auto_108278 ?auto_108279 ) ) ( not ( = ?auto_108278 ?auto_108280 ) ) ( not ( = ?auto_108278 ?auto_108281 ) ) ( not ( = ?auto_108278 ?auto_108282 ) ) ( not ( = ?auto_108278 ?auto_108283 ) ) ( not ( = ?auto_108278 ?auto_108284 ) ) ( not ( = ?auto_108278 ?auto_108285 ) ) ( not ( = ?auto_108278 ?auto_108286 ) ) ( not ( = ?auto_108278 ?auto_108291 ) ) ( not ( = ?auto_108279 ?auto_108280 ) ) ( not ( = ?auto_108279 ?auto_108281 ) ) ( not ( = ?auto_108279 ?auto_108282 ) ) ( not ( = ?auto_108279 ?auto_108283 ) ) ( not ( = ?auto_108279 ?auto_108284 ) ) ( not ( = ?auto_108279 ?auto_108285 ) ) ( not ( = ?auto_108279 ?auto_108286 ) ) ( not ( = ?auto_108279 ?auto_108291 ) ) ( not ( = ?auto_108280 ?auto_108281 ) ) ( not ( = ?auto_108280 ?auto_108282 ) ) ( not ( = ?auto_108280 ?auto_108283 ) ) ( not ( = ?auto_108280 ?auto_108284 ) ) ( not ( = ?auto_108280 ?auto_108285 ) ) ( not ( = ?auto_108280 ?auto_108286 ) ) ( not ( = ?auto_108280 ?auto_108291 ) ) ( not ( = ?auto_108281 ?auto_108282 ) ) ( not ( = ?auto_108281 ?auto_108283 ) ) ( not ( = ?auto_108281 ?auto_108284 ) ) ( not ( = ?auto_108281 ?auto_108285 ) ) ( not ( = ?auto_108281 ?auto_108286 ) ) ( not ( = ?auto_108281 ?auto_108291 ) ) ( not ( = ?auto_108282 ?auto_108283 ) ) ( not ( = ?auto_108282 ?auto_108284 ) ) ( not ( = ?auto_108282 ?auto_108285 ) ) ( not ( = ?auto_108282 ?auto_108286 ) ) ( not ( = ?auto_108282 ?auto_108291 ) ) ( not ( = ?auto_108283 ?auto_108284 ) ) ( not ( = ?auto_108283 ?auto_108285 ) ) ( not ( = ?auto_108283 ?auto_108286 ) ) ( not ( = ?auto_108283 ?auto_108291 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_108284 ?auto_108285 ?auto_108286 )
      ( MAKE-8CRATE-VERIFY ?auto_108278 ?auto_108279 ?auto_108280 ?auto_108281 ?auto_108282 ?auto_108283 ?auto_108284 ?auto_108285 ?auto_108286 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_108371 - SURFACE
      ?auto_108372 - SURFACE
      ?auto_108373 - SURFACE
      ?auto_108374 - SURFACE
      ?auto_108375 - SURFACE
      ?auto_108376 - SURFACE
      ?auto_108377 - SURFACE
      ?auto_108378 - SURFACE
      ?auto_108379 - SURFACE
    )
    :vars
    (
      ?auto_108383 - HOIST
      ?auto_108385 - PLACE
      ?auto_108381 - PLACE
      ?auto_108382 - HOIST
      ?auto_108380 - SURFACE
      ?auto_108384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_108383 ?auto_108385 ) ( IS-CRATE ?auto_108379 ) ( not ( = ?auto_108378 ?auto_108379 ) ) ( not ( = ?auto_108377 ?auto_108378 ) ) ( not ( = ?auto_108377 ?auto_108379 ) ) ( not ( = ?auto_108381 ?auto_108385 ) ) ( HOIST-AT ?auto_108382 ?auto_108381 ) ( not ( = ?auto_108383 ?auto_108382 ) ) ( AVAILABLE ?auto_108382 ) ( SURFACE-AT ?auto_108379 ?auto_108381 ) ( ON ?auto_108379 ?auto_108380 ) ( CLEAR ?auto_108379 ) ( not ( = ?auto_108378 ?auto_108380 ) ) ( not ( = ?auto_108379 ?auto_108380 ) ) ( not ( = ?auto_108377 ?auto_108380 ) ) ( TRUCK-AT ?auto_108384 ?auto_108385 ) ( SURFACE-AT ?auto_108377 ?auto_108385 ) ( CLEAR ?auto_108377 ) ( LIFTING ?auto_108383 ?auto_108378 ) ( IS-CRATE ?auto_108378 ) ( ON ?auto_108372 ?auto_108371 ) ( ON ?auto_108373 ?auto_108372 ) ( ON ?auto_108374 ?auto_108373 ) ( ON ?auto_108375 ?auto_108374 ) ( ON ?auto_108376 ?auto_108375 ) ( ON ?auto_108377 ?auto_108376 ) ( not ( = ?auto_108371 ?auto_108372 ) ) ( not ( = ?auto_108371 ?auto_108373 ) ) ( not ( = ?auto_108371 ?auto_108374 ) ) ( not ( = ?auto_108371 ?auto_108375 ) ) ( not ( = ?auto_108371 ?auto_108376 ) ) ( not ( = ?auto_108371 ?auto_108377 ) ) ( not ( = ?auto_108371 ?auto_108378 ) ) ( not ( = ?auto_108371 ?auto_108379 ) ) ( not ( = ?auto_108371 ?auto_108380 ) ) ( not ( = ?auto_108372 ?auto_108373 ) ) ( not ( = ?auto_108372 ?auto_108374 ) ) ( not ( = ?auto_108372 ?auto_108375 ) ) ( not ( = ?auto_108372 ?auto_108376 ) ) ( not ( = ?auto_108372 ?auto_108377 ) ) ( not ( = ?auto_108372 ?auto_108378 ) ) ( not ( = ?auto_108372 ?auto_108379 ) ) ( not ( = ?auto_108372 ?auto_108380 ) ) ( not ( = ?auto_108373 ?auto_108374 ) ) ( not ( = ?auto_108373 ?auto_108375 ) ) ( not ( = ?auto_108373 ?auto_108376 ) ) ( not ( = ?auto_108373 ?auto_108377 ) ) ( not ( = ?auto_108373 ?auto_108378 ) ) ( not ( = ?auto_108373 ?auto_108379 ) ) ( not ( = ?auto_108373 ?auto_108380 ) ) ( not ( = ?auto_108374 ?auto_108375 ) ) ( not ( = ?auto_108374 ?auto_108376 ) ) ( not ( = ?auto_108374 ?auto_108377 ) ) ( not ( = ?auto_108374 ?auto_108378 ) ) ( not ( = ?auto_108374 ?auto_108379 ) ) ( not ( = ?auto_108374 ?auto_108380 ) ) ( not ( = ?auto_108375 ?auto_108376 ) ) ( not ( = ?auto_108375 ?auto_108377 ) ) ( not ( = ?auto_108375 ?auto_108378 ) ) ( not ( = ?auto_108375 ?auto_108379 ) ) ( not ( = ?auto_108375 ?auto_108380 ) ) ( not ( = ?auto_108376 ?auto_108377 ) ) ( not ( = ?auto_108376 ?auto_108378 ) ) ( not ( = ?auto_108376 ?auto_108379 ) ) ( not ( = ?auto_108376 ?auto_108380 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_108377 ?auto_108378 ?auto_108379 )
      ( MAKE-8CRATE-VERIFY ?auto_108371 ?auto_108372 ?auto_108373 ?auto_108374 ?auto_108375 ?auto_108376 ?auto_108377 ?auto_108378 ?auto_108379 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_108464 - SURFACE
      ?auto_108465 - SURFACE
      ?auto_108466 - SURFACE
      ?auto_108467 - SURFACE
      ?auto_108468 - SURFACE
      ?auto_108469 - SURFACE
      ?auto_108470 - SURFACE
      ?auto_108471 - SURFACE
      ?auto_108472 - SURFACE
    )
    :vars
    (
      ?auto_108476 - HOIST
      ?auto_108473 - PLACE
      ?auto_108478 - PLACE
      ?auto_108477 - HOIST
      ?auto_108474 - SURFACE
      ?auto_108475 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_108476 ?auto_108473 ) ( IS-CRATE ?auto_108472 ) ( not ( = ?auto_108471 ?auto_108472 ) ) ( not ( = ?auto_108470 ?auto_108471 ) ) ( not ( = ?auto_108470 ?auto_108472 ) ) ( not ( = ?auto_108478 ?auto_108473 ) ) ( HOIST-AT ?auto_108477 ?auto_108478 ) ( not ( = ?auto_108476 ?auto_108477 ) ) ( AVAILABLE ?auto_108477 ) ( SURFACE-AT ?auto_108472 ?auto_108478 ) ( ON ?auto_108472 ?auto_108474 ) ( CLEAR ?auto_108472 ) ( not ( = ?auto_108471 ?auto_108474 ) ) ( not ( = ?auto_108472 ?auto_108474 ) ) ( not ( = ?auto_108470 ?auto_108474 ) ) ( TRUCK-AT ?auto_108475 ?auto_108473 ) ( SURFACE-AT ?auto_108470 ?auto_108473 ) ( CLEAR ?auto_108470 ) ( IS-CRATE ?auto_108471 ) ( AVAILABLE ?auto_108476 ) ( IN ?auto_108471 ?auto_108475 ) ( ON ?auto_108465 ?auto_108464 ) ( ON ?auto_108466 ?auto_108465 ) ( ON ?auto_108467 ?auto_108466 ) ( ON ?auto_108468 ?auto_108467 ) ( ON ?auto_108469 ?auto_108468 ) ( ON ?auto_108470 ?auto_108469 ) ( not ( = ?auto_108464 ?auto_108465 ) ) ( not ( = ?auto_108464 ?auto_108466 ) ) ( not ( = ?auto_108464 ?auto_108467 ) ) ( not ( = ?auto_108464 ?auto_108468 ) ) ( not ( = ?auto_108464 ?auto_108469 ) ) ( not ( = ?auto_108464 ?auto_108470 ) ) ( not ( = ?auto_108464 ?auto_108471 ) ) ( not ( = ?auto_108464 ?auto_108472 ) ) ( not ( = ?auto_108464 ?auto_108474 ) ) ( not ( = ?auto_108465 ?auto_108466 ) ) ( not ( = ?auto_108465 ?auto_108467 ) ) ( not ( = ?auto_108465 ?auto_108468 ) ) ( not ( = ?auto_108465 ?auto_108469 ) ) ( not ( = ?auto_108465 ?auto_108470 ) ) ( not ( = ?auto_108465 ?auto_108471 ) ) ( not ( = ?auto_108465 ?auto_108472 ) ) ( not ( = ?auto_108465 ?auto_108474 ) ) ( not ( = ?auto_108466 ?auto_108467 ) ) ( not ( = ?auto_108466 ?auto_108468 ) ) ( not ( = ?auto_108466 ?auto_108469 ) ) ( not ( = ?auto_108466 ?auto_108470 ) ) ( not ( = ?auto_108466 ?auto_108471 ) ) ( not ( = ?auto_108466 ?auto_108472 ) ) ( not ( = ?auto_108466 ?auto_108474 ) ) ( not ( = ?auto_108467 ?auto_108468 ) ) ( not ( = ?auto_108467 ?auto_108469 ) ) ( not ( = ?auto_108467 ?auto_108470 ) ) ( not ( = ?auto_108467 ?auto_108471 ) ) ( not ( = ?auto_108467 ?auto_108472 ) ) ( not ( = ?auto_108467 ?auto_108474 ) ) ( not ( = ?auto_108468 ?auto_108469 ) ) ( not ( = ?auto_108468 ?auto_108470 ) ) ( not ( = ?auto_108468 ?auto_108471 ) ) ( not ( = ?auto_108468 ?auto_108472 ) ) ( not ( = ?auto_108468 ?auto_108474 ) ) ( not ( = ?auto_108469 ?auto_108470 ) ) ( not ( = ?auto_108469 ?auto_108471 ) ) ( not ( = ?auto_108469 ?auto_108472 ) ) ( not ( = ?auto_108469 ?auto_108474 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_108470 ?auto_108471 ?auto_108472 )
      ( MAKE-8CRATE-VERIFY ?auto_108464 ?auto_108465 ?auto_108466 ?auto_108467 ?auto_108468 ?auto_108469 ?auto_108470 ?auto_108471 ?auto_108472 ) )
  )

)

