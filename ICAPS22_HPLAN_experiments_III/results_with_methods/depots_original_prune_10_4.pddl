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

  ( :method MAKE-9CRATE-VERIFY
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
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
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
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375033 - SURFACE
      ?auto_375034 - SURFACE
    )
    :vars
    (
      ?auto_375035 - HOIST
      ?auto_375036 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375035 ?auto_375036 ) ( SURFACE-AT ?auto_375033 ?auto_375036 ) ( CLEAR ?auto_375033 ) ( LIFTING ?auto_375035 ?auto_375034 ) ( IS-CRATE ?auto_375034 ) ( not ( = ?auto_375033 ?auto_375034 ) ) )
    :subtasks
    ( ( !DROP ?auto_375035 ?auto_375034 ?auto_375033 ?auto_375036 )
      ( MAKE-1CRATE-VERIFY ?auto_375033 ?auto_375034 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375037 - SURFACE
      ?auto_375038 - SURFACE
    )
    :vars
    (
      ?auto_375039 - HOIST
      ?auto_375040 - PLACE
      ?auto_375041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375039 ?auto_375040 ) ( SURFACE-AT ?auto_375037 ?auto_375040 ) ( CLEAR ?auto_375037 ) ( IS-CRATE ?auto_375038 ) ( not ( = ?auto_375037 ?auto_375038 ) ) ( TRUCK-AT ?auto_375041 ?auto_375040 ) ( AVAILABLE ?auto_375039 ) ( IN ?auto_375038 ?auto_375041 ) )
    :subtasks
    ( ( !UNLOAD ?auto_375039 ?auto_375038 ?auto_375041 ?auto_375040 )
      ( MAKE-1CRATE ?auto_375037 ?auto_375038 )
      ( MAKE-1CRATE-VERIFY ?auto_375037 ?auto_375038 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375042 - SURFACE
      ?auto_375043 - SURFACE
    )
    :vars
    (
      ?auto_375046 - HOIST
      ?auto_375044 - PLACE
      ?auto_375045 - TRUCK
      ?auto_375047 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375046 ?auto_375044 ) ( SURFACE-AT ?auto_375042 ?auto_375044 ) ( CLEAR ?auto_375042 ) ( IS-CRATE ?auto_375043 ) ( not ( = ?auto_375042 ?auto_375043 ) ) ( AVAILABLE ?auto_375046 ) ( IN ?auto_375043 ?auto_375045 ) ( TRUCK-AT ?auto_375045 ?auto_375047 ) ( not ( = ?auto_375047 ?auto_375044 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_375045 ?auto_375047 ?auto_375044 )
      ( MAKE-1CRATE ?auto_375042 ?auto_375043 )
      ( MAKE-1CRATE-VERIFY ?auto_375042 ?auto_375043 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375048 - SURFACE
      ?auto_375049 - SURFACE
    )
    :vars
    (
      ?auto_375053 - HOIST
      ?auto_375051 - PLACE
      ?auto_375052 - TRUCK
      ?auto_375050 - PLACE
      ?auto_375054 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_375053 ?auto_375051 ) ( SURFACE-AT ?auto_375048 ?auto_375051 ) ( CLEAR ?auto_375048 ) ( IS-CRATE ?auto_375049 ) ( not ( = ?auto_375048 ?auto_375049 ) ) ( AVAILABLE ?auto_375053 ) ( TRUCK-AT ?auto_375052 ?auto_375050 ) ( not ( = ?auto_375050 ?auto_375051 ) ) ( HOIST-AT ?auto_375054 ?auto_375050 ) ( LIFTING ?auto_375054 ?auto_375049 ) ( not ( = ?auto_375053 ?auto_375054 ) ) )
    :subtasks
    ( ( !LOAD ?auto_375054 ?auto_375049 ?auto_375052 ?auto_375050 )
      ( MAKE-1CRATE ?auto_375048 ?auto_375049 )
      ( MAKE-1CRATE-VERIFY ?auto_375048 ?auto_375049 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375055 - SURFACE
      ?auto_375056 - SURFACE
    )
    :vars
    (
      ?auto_375058 - HOIST
      ?auto_375060 - PLACE
      ?auto_375057 - TRUCK
      ?auto_375061 - PLACE
      ?auto_375059 - HOIST
      ?auto_375062 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375058 ?auto_375060 ) ( SURFACE-AT ?auto_375055 ?auto_375060 ) ( CLEAR ?auto_375055 ) ( IS-CRATE ?auto_375056 ) ( not ( = ?auto_375055 ?auto_375056 ) ) ( AVAILABLE ?auto_375058 ) ( TRUCK-AT ?auto_375057 ?auto_375061 ) ( not ( = ?auto_375061 ?auto_375060 ) ) ( HOIST-AT ?auto_375059 ?auto_375061 ) ( not ( = ?auto_375058 ?auto_375059 ) ) ( AVAILABLE ?auto_375059 ) ( SURFACE-AT ?auto_375056 ?auto_375061 ) ( ON ?auto_375056 ?auto_375062 ) ( CLEAR ?auto_375056 ) ( not ( = ?auto_375055 ?auto_375062 ) ) ( not ( = ?auto_375056 ?auto_375062 ) ) )
    :subtasks
    ( ( !LIFT ?auto_375059 ?auto_375056 ?auto_375062 ?auto_375061 )
      ( MAKE-1CRATE ?auto_375055 ?auto_375056 )
      ( MAKE-1CRATE-VERIFY ?auto_375055 ?auto_375056 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375063 - SURFACE
      ?auto_375064 - SURFACE
    )
    :vars
    (
      ?auto_375069 - HOIST
      ?auto_375065 - PLACE
      ?auto_375066 - PLACE
      ?auto_375068 - HOIST
      ?auto_375070 - SURFACE
      ?auto_375067 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375069 ?auto_375065 ) ( SURFACE-AT ?auto_375063 ?auto_375065 ) ( CLEAR ?auto_375063 ) ( IS-CRATE ?auto_375064 ) ( not ( = ?auto_375063 ?auto_375064 ) ) ( AVAILABLE ?auto_375069 ) ( not ( = ?auto_375066 ?auto_375065 ) ) ( HOIST-AT ?auto_375068 ?auto_375066 ) ( not ( = ?auto_375069 ?auto_375068 ) ) ( AVAILABLE ?auto_375068 ) ( SURFACE-AT ?auto_375064 ?auto_375066 ) ( ON ?auto_375064 ?auto_375070 ) ( CLEAR ?auto_375064 ) ( not ( = ?auto_375063 ?auto_375070 ) ) ( not ( = ?auto_375064 ?auto_375070 ) ) ( TRUCK-AT ?auto_375067 ?auto_375065 ) )
    :subtasks
    ( ( !DRIVE ?auto_375067 ?auto_375065 ?auto_375066 )
      ( MAKE-1CRATE ?auto_375063 ?auto_375064 )
      ( MAKE-1CRATE-VERIFY ?auto_375063 ?auto_375064 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375080 - SURFACE
      ?auto_375081 - SURFACE
      ?auto_375082 - SURFACE
    )
    :vars
    (
      ?auto_375083 - HOIST
      ?auto_375084 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375083 ?auto_375084 ) ( SURFACE-AT ?auto_375081 ?auto_375084 ) ( CLEAR ?auto_375081 ) ( LIFTING ?auto_375083 ?auto_375082 ) ( IS-CRATE ?auto_375082 ) ( not ( = ?auto_375081 ?auto_375082 ) ) ( ON ?auto_375081 ?auto_375080 ) ( not ( = ?auto_375080 ?auto_375081 ) ) ( not ( = ?auto_375080 ?auto_375082 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375081 ?auto_375082 )
      ( MAKE-2CRATE-VERIFY ?auto_375080 ?auto_375081 ?auto_375082 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375090 - SURFACE
      ?auto_375091 - SURFACE
      ?auto_375092 - SURFACE
    )
    :vars
    (
      ?auto_375094 - HOIST
      ?auto_375095 - PLACE
      ?auto_375093 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375094 ?auto_375095 ) ( SURFACE-AT ?auto_375091 ?auto_375095 ) ( CLEAR ?auto_375091 ) ( IS-CRATE ?auto_375092 ) ( not ( = ?auto_375091 ?auto_375092 ) ) ( TRUCK-AT ?auto_375093 ?auto_375095 ) ( AVAILABLE ?auto_375094 ) ( IN ?auto_375092 ?auto_375093 ) ( ON ?auto_375091 ?auto_375090 ) ( not ( = ?auto_375090 ?auto_375091 ) ) ( not ( = ?auto_375090 ?auto_375092 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375091 ?auto_375092 )
      ( MAKE-2CRATE-VERIFY ?auto_375090 ?auto_375091 ?auto_375092 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375096 - SURFACE
      ?auto_375097 - SURFACE
    )
    :vars
    (
      ?auto_375098 - HOIST
      ?auto_375100 - PLACE
      ?auto_375101 - TRUCK
      ?auto_375099 - SURFACE
      ?auto_375102 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375098 ?auto_375100 ) ( SURFACE-AT ?auto_375096 ?auto_375100 ) ( CLEAR ?auto_375096 ) ( IS-CRATE ?auto_375097 ) ( not ( = ?auto_375096 ?auto_375097 ) ) ( AVAILABLE ?auto_375098 ) ( IN ?auto_375097 ?auto_375101 ) ( ON ?auto_375096 ?auto_375099 ) ( not ( = ?auto_375099 ?auto_375096 ) ) ( not ( = ?auto_375099 ?auto_375097 ) ) ( TRUCK-AT ?auto_375101 ?auto_375102 ) ( not ( = ?auto_375102 ?auto_375100 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_375101 ?auto_375102 ?auto_375100 )
      ( MAKE-2CRATE ?auto_375099 ?auto_375096 ?auto_375097 )
      ( MAKE-1CRATE-VERIFY ?auto_375096 ?auto_375097 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375103 - SURFACE
      ?auto_375104 - SURFACE
      ?auto_375105 - SURFACE
    )
    :vars
    (
      ?auto_375108 - HOIST
      ?auto_375107 - PLACE
      ?auto_375109 - TRUCK
      ?auto_375106 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375108 ?auto_375107 ) ( SURFACE-AT ?auto_375104 ?auto_375107 ) ( CLEAR ?auto_375104 ) ( IS-CRATE ?auto_375105 ) ( not ( = ?auto_375104 ?auto_375105 ) ) ( AVAILABLE ?auto_375108 ) ( IN ?auto_375105 ?auto_375109 ) ( ON ?auto_375104 ?auto_375103 ) ( not ( = ?auto_375103 ?auto_375104 ) ) ( not ( = ?auto_375103 ?auto_375105 ) ) ( TRUCK-AT ?auto_375109 ?auto_375106 ) ( not ( = ?auto_375106 ?auto_375107 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375104 ?auto_375105 )
      ( MAKE-2CRATE-VERIFY ?auto_375103 ?auto_375104 ?auto_375105 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375110 - SURFACE
      ?auto_375111 - SURFACE
    )
    :vars
    (
      ?auto_375113 - HOIST
      ?auto_375114 - PLACE
      ?auto_375112 - SURFACE
      ?auto_375115 - TRUCK
      ?auto_375116 - PLACE
      ?auto_375117 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_375113 ?auto_375114 ) ( SURFACE-AT ?auto_375110 ?auto_375114 ) ( CLEAR ?auto_375110 ) ( IS-CRATE ?auto_375111 ) ( not ( = ?auto_375110 ?auto_375111 ) ) ( AVAILABLE ?auto_375113 ) ( ON ?auto_375110 ?auto_375112 ) ( not ( = ?auto_375112 ?auto_375110 ) ) ( not ( = ?auto_375112 ?auto_375111 ) ) ( TRUCK-AT ?auto_375115 ?auto_375116 ) ( not ( = ?auto_375116 ?auto_375114 ) ) ( HOIST-AT ?auto_375117 ?auto_375116 ) ( LIFTING ?auto_375117 ?auto_375111 ) ( not ( = ?auto_375113 ?auto_375117 ) ) )
    :subtasks
    ( ( !LOAD ?auto_375117 ?auto_375111 ?auto_375115 ?auto_375116 )
      ( MAKE-2CRATE ?auto_375112 ?auto_375110 ?auto_375111 )
      ( MAKE-1CRATE-VERIFY ?auto_375110 ?auto_375111 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375118 - SURFACE
      ?auto_375119 - SURFACE
      ?auto_375120 - SURFACE
    )
    :vars
    (
      ?auto_375123 - HOIST
      ?auto_375122 - PLACE
      ?auto_375121 - TRUCK
      ?auto_375125 - PLACE
      ?auto_375124 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_375123 ?auto_375122 ) ( SURFACE-AT ?auto_375119 ?auto_375122 ) ( CLEAR ?auto_375119 ) ( IS-CRATE ?auto_375120 ) ( not ( = ?auto_375119 ?auto_375120 ) ) ( AVAILABLE ?auto_375123 ) ( ON ?auto_375119 ?auto_375118 ) ( not ( = ?auto_375118 ?auto_375119 ) ) ( not ( = ?auto_375118 ?auto_375120 ) ) ( TRUCK-AT ?auto_375121 ?auto_375125 ) ( not ( = ?auto_375125 ?auto_375122 ) ) ( HOIST-AT ?auto_375124 ?auto_375125 ) ( LIFTING ?auto_375124 ?auto_375120 ) ( not ( = ?auto_375123 ?auto_375124 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375119 ?auto_375120 )
      ( MAKE-2CRATE-VERIFY ?auto_375118 ?auto_375119 ?auto_375120 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375126 - SURFACE
      ?auto_375127 - SURFACE
    )
    :vars
    (
      ?auto_375128 - HOIST
      ?auto_375129 - PLACE
      ?auto_375130 - SURFACE
      ?auto_375132 - TRUCK
      ?auto_375131 - PLACE
      ?auto_375133 - HOIST
      ?auto_375134 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375128 ?auto_375129 ) ( SURFACE-AT ?auto_375126 ?auto_375129 ) ( CLEAR ?auto_375126 ) ( IS-CRATE ?auto_375127 ) ( not ( = ?auto_375126 ?auto_375127 ) ) ( AVAILABLE ?auto_375128 ) ( ON ?auto_375126 ?auto_375130 ) ( not ( = ?auto_375130 ?auto_375126 ) ) ( not ( = ?auto_375130 ?auto_375127 ) ) ( TRUCK-AT ?auto_375132 ?auto_375131 ) ( not ( = ?auto_375131 ?auto_375129 ) ) ( HOIST-AT ?auto_375133 ?auto_375131 ) ( not ( = ?auto_375128 ?auto_375133 ) ) ( AVAILABLE ?auto_375133 ) ( SURFACE-AT ?auto_375127 ?auto_375131 ) ( ON ?auto_375127 ?auto_375134 ) ( CLEAR ?auto_375127 ) ( not ( = ?auto_375126 ?auto_375134 ) ) ( not ( = ?auto_375127 ?auto_375134 ) ) ( not ( = ?auto_375130 ?auto_375134 ) ) )
    :subtasks
    ( ( !LIFT ?auto_375133 ?auto_375127 ?auto_375134 ?auto_375131 )
      ( MAKE-2CRATE ?auto_375130 ?auto_375126 ?auto_375127 )
      ( MAKE-1CRATE-VERIFY ?auto_375126 ?auto_375127 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375135 - SURFACE
      ?auto_375136 - SURFACE
      ?auto_375137 - SURFACE
    )
    :vars
    (
      ?auto_375140 - HOIST
      ?auto_375138 - PLACE
      ?auto_375141 - TRUCK
      ?auto_375142 - PLACE
      ?auto_375139 - HOIST
      ?auto_375143 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375140 ?auto_375138 ) ( SURFACE-AT ?auto_375136 ?auto_375138 ) ( CLEAR ?auto_375136 ) ( IS-CRATE ?auto_375137 ) ( not ( = ?auto_375136 ?auto_375137 ) ) ( AVAILABLE ?auto_375140 ) ( ON ?auto_375136 ?auto_375135 ) ( not ( = ?auto_375135 ?auto_375136 ) ) ( not ( = ?auto_375135 ?auto_375137 ) ) ( TRUCK-AT ?auto_375141 ?auto_375142 ) ( not ( = ?auto_375142 ?auto_375138 ) ) ( HOIST-AT ?auto_375139 ?auto_375142 ) ( not ( = ?auto_375140 ?auto_375139 ) ) ( AVAILABLE ?auto_375139 ) ( SURFACE-AT ?auto_375137 ?auto_375142 ) ( ON ?auto_375137 ?auto_375143 ) ( CLEAR ?auto_375137 ) ( not ( = ?auto_375136 ?auto_375143 ) ) ( not ( = ?auto_375137 ?auto_375143 ) ) ( not ( = ?auto_375135 ?auto_375143 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375136 ?auto_375137 )
      ( MAKE-2CRATE-VERIFY ?auto_375135 ?auto_375136 ?auto_375137 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375144 - SURFACE
      ?auto_375145 - SURFACE
    )
    :vars
    (
      ?auto_375146 - HOIST
      ?auto_375150 - PLACE
      ?auto_375152 - SURFACE
      ?auto_375149 - PLACE
      ?auto_375151 - HOIST
      ?auto_375148 - SURFACE
      ?auto_375147 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375146 ?auto_375150 ) ( SURFACE-AT ?auto_375144 ?auto_375150 ) ( CLEAR ?auto_375144 ) ( IS-CRATE ?auto_375145 ) ( not ( = ?auto_375144 ?auto_375145 ) ) ( AVAILABLE ?auto_375146 ) ( ON ?auto_375144 ?auto_375152 ) ( not ( = ?auto_375152 ?auto_375144 ) ) ( not ( = ?auto_375152 ?auto_375145 ) ) ( not ( = ?auto_375149 ?auto_375150 ) ) ( HOIST-AT ?auto_375151 ?auto_375149 ) ( not ( = ?auto_375146 ?auto_375151 ) ) ( AVAILABLE ?auto_375151 ) ( SURFACE-AT ?auto_375145 ?auto_375149 ) ( ON ?auto_375145 ?auto_375148 ) ( CLEAR ?auto_375145 ) ( not ( = ?auto_375144 ?auto_375148 ) ) ( not ( = ?auto_375145 ?auto_375148 ) ) ( not ( = ?auto_375152 ?auto_375148 ) ) ( TRUCK-AT ?auto_375147 ?auto_375150 ) )
    :subtasks
    ( ( !DRIVE ?auto_375147 ?auto_375150 ?auto_375149 )
      ( MAKE-2CRATE ?auto_375152 ?auto_375144 ?auto_375145 )
      ( MAKE-1CRATE-VERIFY ?auto_375144 ?auto_375145 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375153 - SURFACE
      ?auto_375154 - SURFACE
      ?auto_375155 - SURFACE
    )
    :vars
    (
      ?auto_375161 - HOIST
      ?auto_375158 - PLACE
      ?auto_375157 - PLACE
      ?auto_375156 - HOIST
      ?auto_375159 - SURFACE
      ?auto_375160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375161 ?auto_375158 ) ( SURFACE-AT ?auto_375154 ?auto_375158 ) ( CLEAR ?auto_375154 ) ( IS-CRATE ?auto_375155 ) ( not ( = ?auto_375154 ?auto_375155 ) ) ( AVAILABLE ?auto_375161 ) ( ON ?auto_375154 ?auto_375153 ) ( not ( = ?auto_375153 ?auto_375154 ) ) ( not ( = ?auto_375153 ?auto_375155 ) ) ( not ( = ?auto_375157 ?auto_375158 ) ) ( HOIST-AT ?auto_375156 ?auto_375157 ) ( not ( = ?auto_375161 ?auto_375156 ) ) ( AVAILABLE ?auto_375156 ) ( SURFACE-AT ?auto_375155 ?auto_375157 ) ( ON ?auto_375155 ?auto_375159 ) ( CLEAR ?auto_375155 ) ( not ( = ?auto_375154 ?auto_375159 ) ) ( not ( = ?auto_375155 ?auto_375159 ) ) ( not ( = ?auto_375153 ?auto_375159 ) ) ( TRUCK-AT ?auto_375160 ?auto_375158 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375154 ?auto_375155 )
      ( MAKE-2CRATE-VERIFY ?auto_375153 ?auto_375154 ?auto_375155 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375162 - SURFACE
      ?auto_375163 - SURFACE
    )
    :vars
    (
      ?auto_375170 - HOIST
      ?auto_375167 - PLACE
      ?auto_375168 - SURFACE
      ?auto_375164 - PLACE
      ?auto_375165 - HOIST
      ?auto_375169 - SURFACE
      ?auto_375166 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375170 ?auto_375167 ) ( IS-CRATE ?auto_375163 ) ( not ( = ?auto_375162 ?auto_375163 ) ) ( not ( = ?auto_375168 ?auto_375162 ) ) ( not ( = ?auto_375168 ?auto_375163 ) ) ( not ( = ?auto_375164 ?auto_375167 ) ) ( HOIST-AT ?auto_375165 ?auto_375164 ) ( not ( = ?auto_375170 ?auto_375165 ) ) ( AVAILABLE ?auto_375165 ) ( SURFACE-AT ?auto_375163 ?auto_375164 ) ( ON ?auto_375163 ?auto_375169 ) ( CLEAR ?auto_375163 ) ( not ( = ?auto_375162 ?auto_375169 ) ) ( not ( = ?auto_375163 ?auto_375169 ) ) ( not ( = ?auto_375168 ?auto_375169 ) ) ( TRUCK-AT ?auto_375166 ?auto_375167 ) ( SURFACE-AT ?auto_375168 ?auto_375167 ) ( CLEAR ?auto_375168 ) ( LIFTING ?auto_375170 ?auto_375162 ) ( IS-CRATE ?auto_375162 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375168 ?auto_375162 )
      ( MAKE-2CRATE ?auto_375168 ?auto_375162 ?auto_375163 )
      ( MAKE-1CRATE-VERIFY ?auto_375162 ?auto_375163 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375171 - SURFACE
      ?auto_375172 - SURFACE
      ?auto_375173 - SURFACE
    )
    :vars
    (
      ?auto_375175 - HOIST
      ?auto_375176 - PLACE
      ?auto_375178 - PLACE
      ?auto_375179 - HOIST
      ?auto_375174 - SURFACE
      ?auto_375177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375175 ?auto_375176 ) ( IS-CRATE ?auto_375173 ) ( not ( = ?auto_375172 ?auto_375173 ) ) ( not ( = ?auto_375171 ?auto_375172 ) ) ( not ( = ?auto_375171 ?auto_375173 ) ) ( not ( = ?auto_375178 ?auto_375176 ) ) ( HOIST-AT ?auto_375179 ?auto_375178 ) ( not ( = ?auto_375175 ?auto_375179 ) ) ( AVAILABLE ?auto_375179 ) ( SURFACE-AT ?auto_375173 ?auto_375178 ) ( ON ?auto_375173 ?auto_375174 ) ( CLEAR ?auto_375173 ) ( not ( = ?auto_375172 ?auto_375174 ) ) ( not ( = ?auto_375173 ?auto_375174 ) ) ( not ( = ?auto_375171 ?auto_375174 ) ) ( TRUCK-AT ?auto_375177 ?auto_375176 ) ( SURFACE-AT ?auto_375171 ?auto_375176 ) ( CLEAR ?auto_375171 ) ( LIFTING ?auto_375175 ?auto_375172 ) ( IS-CRATE ?auto_375172 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375172 ?auto_375173 )
      ( MAKE-2CRATE-VERIFY ?auto_375171 ?auto_375172 ?auto_375173 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375180 - SURFACE
      ?auto_375181 - SURFACE
    )
    :vars
    (
      ?auto_375183 - HOIST
      ?auto_375185 - PLACE
      ?auto_375188 - SURFACE
      ?auto_375187 - PLACE
      ?auto_375186 - HOIST
      ?auto_375184 - SURFACE
      ?auto_375182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375183 ?auto_375185 ) ( IS-CRATE ?auto_375181 ) ( not ( = ?auto_375180 ?auto_375181 ) ) ( not ( = ?auto_375188 ?auto_375180 ) ) ( not ( = ?auto_375188 ?auto_375181 ) ) ( not ( = ?auto_375187 ?auto_375185 ) ) ( HOIST-AT ?auto_375186 ?auto_375187 ) ( not ( = ?auto_375183 ?auto_375186 ) ) ( AVAILABLE ?auto_375186 ) ( SURFACE-AT ?auto_375181 ?auto_375187 ) ( ON ?auto_375181 ?auto_375184 ) ( CLEAR ?auto_375181 ) ( not ( = ?auto_375180 ?auto_375184 ) ) ( not ( = ?auto_375181 ?auto_375184 ) ) ( not ( = ?auto_375188 ?auto_375184 ) ) ( TRUCK-AT ?auto_375182 ?auto_375185 ) ( SURFACE-AT ?auto_375188 ?auto_375185 ) ( CLEAR ?auto_375188 ) ( IS-CRATE ?auto_375180 ) ( AVAILABLE ?auto_375183 ) ( IN ?auto_375180 ?auto_375182 ) )
    :subtasks
    ( ( !UNLOAD ?auto_375183 ?auto_375180 ?auto_375182 ?auto_375185 )
      ( MAKE-2CRATE ?auto_375188 ?auto_375180 ?auto_375181 )
      ( MAKE-1CRATE-VERIFY ?auto_375180 ?auto_375181 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_375189 - SURFACE
      ?auto_375190 - SURFACE
      ?auto_375191 - SURFACE
    )
    :vars
    (
      ?auto_375193 - HOIST
      ?auto_375195 - PLACE
      ?auto_375196 - PLACE
      ?auto_375197 - HOIST
      ?auto_375192 - SURFACE
      ?auto_375194 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375193 ?auto_375195 ) ( IS-CRATE ?auto_375191 ) ( not ( = ?auto_375190 ?auto_375191 ) ) ( not ( = ?auto_375189 ?auto_375190 ) ) ( not ( = ?auto_375189 ?auto_375191 ) ) ( not ( = ?auto_375196 ?auto_375195 ) ) ( HOIST-AT ?auto_375197 ?auto_375196 ) ( not ( = ?auto_375193 ?auto_375197 ) ) ( AVAILABLE ?auto_375197 ) ( SURFACE-AT ?auto_375191 ?auto_375196 ) ( ON ?auto_375191 ?auto_375192 ) ( CLEAR ?auto_375191 ) ( not ( = ?auto_375190 ?auto_375192 ) ) ( not ( = ?auto_375191 ?auto_375192 ) ) ( not ( = ?auto_375189 ?auto_375192 ) ) ( TRUCK-AT ?auto_375194 ?auto_375195 ) ( SURFACE-AT ?auto_375189 ?auto_375195 ) ( CLEAR ?auto_375189 ) ( IS-CRATE ?auto_375190 ) ( AVAILABLE ?auto_375193 ) ( IN ?auto_375190 ?auto_375194 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375190 ?auto_375191 )
      ( MAKE-2CRATE-VERIFY ?auto_375189 ?auto_375190 ?auto_375191 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_375234 - SURFACE
      ?auto_375235 - SURFACE
    )
    :vars
    (
      ?auto_375242 - HOIST
      ?auto_375240 - PLACE
      ?auto_375238 - SURFACE
      ?auto_375236 - PLACE
      ?auto_375237 - HOIST
      ?auto_375239 - SURFACE
      ?auto_375241 - TRUCK
      ?auto_375243 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375242 ?auto_375240 ) ( SURFACE-AT ?auto_375234 ?auto_375240 ) ( CLEAR ?auto_375234 ) ( IS-CRATE ?auto_375235 ) ( not ( = ?auto_375234 ?auto_375235 ) ) ( AVAILABLE ?auto_375242 ) ( ON ?auto_375234 ?auto_375238 ) ( not ( = ?auto_375238 ?auto_375234 ) ) ( not ( = ?auto_375238 ?auto_375235 ) ) ( not ( = ?auto_375236 ?auto_375240 ) ) ( HOIST-AT ?auto_375237 ?auto_375236 ) ( not ( = ?auto_375242 ?auto_375237 ) ) ( AVAILABLE ?auto_375237 ) ( SURFACE-AT ?auto_375235 ?auto_375236 ) ( ON ?auto_375235 ?auto_375239 ) ( CLEAR ?auto_375235 ) ( not ( = ?auto_375234 ?auto_375239 ) ) ( not ( = ?auto_375235 ?auto_375239 ) ) ( not ( = ?auto_375238 ?auto_375239 ) ) ( TRUCK-AT ?auto_375241 ?auto_375243 ) ( not ( = ?auto_375243 ?auto_375240 ) ) ( not ( = ?auto_375236 ?auto_375243 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_375241 ?auto_375243 ?auto_375240 )
      ( MAKE-1CRATE ?auto_375234 ?auto_375235 )
      ( MAKE-1CRATE-VERIFY ?auto_375234 ?auto_375235 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_375273 - SURFACE
      ?auto_375274 - SURFACE
      ?auto_375275 - SURFACE
      ?auto_375276 - SURFACE
    )
    :vars
    (
      ?auto_375278 - HOIST
      ?auto_375277 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375278 ?auto_375277 ) ( SURFACE-AT ?auto_375275 ?auto_375277 ) ( CLEAR ?auto_375275 ) ( LIFTING ?auto_375278 ?auto_375276 ) ( IS-CRATE ?auto_375276 ) ( not ( = ?auto_375275 ?auto_375276 ) ) ( ON ?auto_375274 ?auto_375273 ) ( ON ?auto_375275 ?auto_375274 ) ( not ( = ?auto_375273 ?auto_375274 ) ) ( not ( = ?auto_375273 ?auto_375275 ) ) ( not ( = ?auto_375273 ?auto_375276 ) ) ( not ( = ?auto_375274 ?auto_375275 ) ) ( not ( = ?auto_375274 ?auto_375276 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375275 ?auto_375276 )
      ( MAKE-3CRATE-VERIFY ?auto_375273 ?auto_375274 ?auto_375275 ?auto_375276 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_375290 - SURFACE
      ?auto_375291 - SURFACE
      ?auto_375292 - SURFACE
      ?auto_375293 - SURFACE
    )
    :vars
    (
      ?auto_375296 - HOIST
      ?auto_375294 - PLACE
      ?auto_375295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375296 ?auto_375294 ) ( SURFACE-AT ?auto_375292 ?auto_375294 ) ( CLEAR ?auto_375292 ) ( IS-CRATE ?auto_375293 ) ( not ( = ?auto_375292 ?auto_375293 ) ) ( TRUCK-AT ?auto_375295 ?auto_375294 ) ( AVAILABLE ?auto_375296 ) ( IN ?auto_375293 ?auto_375295 ) ( ON ?auto_375292 ?auto_375291 ) ( not ( = ?auto_375291 ?auto_375292 ) ) ( not ( = ?auto_375291 ?auto_375293 ) ) ( ON ?auto_375291 ?auto_375290 ) ( not ( = ?auto_375290 ?auto_375291 ) ) ( not ( = ?auto_375290 ?auto_375292 ) ) ( not ( = ?auto_375290 ?auto_375293 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375291 ?auto_375292 ?auto_375293 )
      ( MAKE-3CRATE-VERIFY ?auto_375290 ?auto_375291 ?auto_375292 ?auto_375293 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_375311 - SURFACE
      ?auto_375312 - SURFACE
      ?auto_375313 - SURFACE
      ?auto_375314 - SURFACE
    )
    :vars
    (
      ?auto_375318 - HOIST
      ?auto_375316 - PLACE
      ?auto_375315 - TRUCK
      ?auto_375317 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375318 ?auto_375316 ) ( SURFACE-AT ?auto_375313 ?auto_375316 ) ( CLEAR ?auto_375313 ) ( IS-CRATE ?auto_375314 ) ( not ( = ?auto_375313 ?auto_375314 ) ) ( AVAILABLE ?auto_375318 ) ( IN ?auto_375314 ?auto_375315 ) ( ON ?auto_375313 ?auto_375312 ) ( not ( = ?auto_375312 ?auto_375313 ) ) ( not ( = ?auto_375312 ?auto_375314 ) ) ( TRUCK-AT ?auto_375315 ?auto_375317 ) ( not ( = ?auto_375317 ?auto_375316 ) ) ( ON ?auto_375312 ?auto_375311 ) ( not ( = ?auto_375311 ?auto_375312 ) ) ( not ( = ?auto_375311 ?auto_375313 ) ) ( not ( = ?auto_375311 ?auto_375314 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375312 ?auto_375313 ?auto_375314 )
      ( MAKE-3CRATE-VERIFY ?auto_375311 ?auto_375312 ?auto_375313 ?auto_375314 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_375335 - SURFACE
      ?auto_375336 - SURFACE
      ?auto_375337 - SURFACE
      ?auto_375338 - SURFACE
    )
    :vars
    (
      ?auto_375343 - HOIST
      ?auto_375342 - PLACE
      ?auto_375339 - TRUCK
      ?auto_375341 - PLACE
      ?auto_375340 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_375343 ?auto_375342 ) ( SURFACE-AT ?auto_375337 ?auto_375342 ) ( CLEAR ?auto_375337 ) ( IS-CRATE ?auto_375338 ) ( not ( = ?auto_375337 ?auto_375338 ) ) ( AVAILABLE ?auto_375343 ) ( ON ?auto_375337 ?auto_375336 ) ( not ( = ?auto_375336 ?auto_375337 ) ) ( not ( = ?auto_375336 ?auto_375338 ) ) ( TRUCK-AT ?auto_375339 ?auto_375341 ) ( not ( = ?auto_375341 ?auto_375342 ) ) ( HOIST-AT ?auto_375340 ?auto_375341 ) ( LIFTING ?auto_375340 ?auto_375338 ) ( not ( = ?auto_375343 ?auto_375340 ) ) ( ON ?auto_375336 ?auto_375335 ) ( not ( = ?auto_375335 ?auto_375336 ) ) ( not ( = ?auto_375335 ?auto_375337 ) ) ( not ( = ?auto_375335 ?auto_375338 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375336 ?auto_375337 ?auto_375338 )
      ( MAKE-3CRATE-VERIFY ?auto_375335 ?auto_375336 ?auto_375337 ?auto_375338 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_375362 - SURFACE
      ?auto_375363 - SURFACE
      ?auto_375364 - SURFACE
      ?auto_375365 - SURFACE
    )
    :vars
    (
      ?auto_375369 - HOIST
      ?auto_375367 - PLACE
      ?auto_375371 - TRUCK
      ?auto_375370 - PLACE
      ?auto_375368 - HOIST
      ?auto_375366 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375369 ?auto_375367 ) ( SURFACE-AT ?auto_375364 ?auto_375367 ) ( CLEAR ?auto_375364 ) ( IS-CRATE ?auto_375365 ) ( not ( = ?auto_375364 ?auto_375365 ) ) ( AVAILABLE ?auto_375369 ) ( ON ?auto_375364 ?auto_375363 ) ( not ( = ?auto_375363 ?auto_375364 ) ) ( not ( = ?auto_375363 ?auto_375365 ) ) ( TRUCK-AT ?auto_375371 ?auto_375370 ) ( not ( = ?auto_375370 ?auto_375367 ) ) ( HOIST-AT ?auto_375368 ?auto_375370 ) ( not ( = ?auto_375369 ?auto_375368 ) ) ( AVAILABLE ?auto_375368 ) ( SURFACE-AT ?auto_375365 ?auto_375370 ) ( ON ?auto_375365 ?auto_375366 ) ( CLEAR ?auto_375365 ) ( not ( = ?auto_375364 ?auto_375366 ) ) ( not ( = ?auto_375365 ?auto_375366 ) ) ( not ( = ?auto_375363 ?auto_375366 ) ) ( ON ?auto_375363 ?auto_375362 ) ( not ( = ?auto_375362 ?auto_375363 ) ) ( not ( = ?auto_375362 ?auto_375364 ) ) ( not ( = ?auto_375362 ?auto_375365 ) ) ( not ( = ?auto_375362 ?auto_375366 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375363 ?auto_375364 ?auto_375365 )
      ( MAKE-3CRATE-VERIFY ?auto_375362 ?auto_375363 ?auto_375364 ?auto_375365 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_375390 - SURFACE
      ?auto_375391 - SURFACE
      ?auto_375392 - SURFACE
      ?auto_375393 - SURFACE
    )
    :vars
    (
      ?auto_375395 - HOIST
      ?auto_375399 - PLACE
      ?auto_375398 - PLACE
      ?auto_375396 - HOIST
      ?auto_375394 - SURFACE
      ?auto_375397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375395 ?auto_375399 ) ( SURFACE-AT ?auto_375392 ?auto_375399 ) ( CLEAR ?auto_375392 ) ( IS-CRATE ?auto_375393 ) ( not ( = ?auto_375392 ?auto_375393 ) ) ( AVAILABLE ?auto_375395 ) ( ON ?auto_375392 ?auto_375391 ) ( not ( = ?auto_375391 ?auto_375392 ) ) ( not ( = ?auto_375391 ?auto_375393 ) ) ( not ( = ?auto_375398 ?auto_375399 ) ) ( HOIST-AT ?auto_375396 ?auto_375398 ) ( not ( = ?auto_375395 ?auto_375396 ) ) ( AVAILABLE ?auto_375396 ) ( SURFACE-AT ?auto_375393 ?auto_375398 ) ( ON ?auto_375393 ?auto_375394 ) ( CLEAR ?auto_375393 ) ( not ( = ?auto_375392 ?auto_375394 ) ) ( not ( = ?auto_375393 ?auto_375394 ) ) ( not ( = ?auto_375391 ?auto_375394 ) ) ( TRUCK-AT ?auto_375397 ?auto_375399 ) ( ON ?auto_375391 ?auto_375390 ) ( not ( = ?auto_375390 ?auto_375391 ) ) ( not ( = ?auto_375390 ?auto_375392 ) ) ( not ( = ?auto_375390 ?auto_375393 ) ) ( not ( = ?auto_375390 ?auto_375394 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375391 ?auto_375392 ?auto_375393 )
      ( MAKE-3CRATE-VERIFY ?auto_375390 ?auto_375391 ?auto_375392 ?auto_375393 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_375418 - SURFACE
      ?auto_375419 - SURFACE
      ?auto_375420 - SURFACE
      ?auto_375421 - SURFACE
    )
    :vars
    (
      ?auto_375427 - HOIST
      ?auto_375424 - PLACE
      ?auto_375426 - PLACE
      ?auto_375425 - HOIST
      ?auto_375423 - SURFACE
      ?auto_375422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375427 ?auto_375424 ) ( IS-CRATE ?auto_375421 ) ( not ( = ?auto_375420 ?auto_375421 ) ) ( not ( = ?auto_375419 ?auto_375420 ) ) ( not ( = ?auto_375419 ?auto_375421 ) ) ( not ( = ?auto_375426 ?auto_375424 ) ) ( HOIST-AT ?auto_375425 ?auto_375426 ) ( not ( = ?auto_375427 ?auto_375425 ) ) ( AVAILABLE ?auto_375425 ) ( SURFACE-AT ?auto_375421 ?auto_375426 ) ( ON ?auto_375421 ?auto_375423 ) ( CLEAR ?auto_375421 ) ( not ( = ?auto_375420 ?auto_375423 ) ) ( not ( = ?auto_375421 ?auto_375423 ) ) ( not ( = ?auto_375419 ?auto_375423 ) ) ( TRUCK-AT ?auto_375422 ?auto_375424 ) ( SURFACE-AT ?auto_375419 ?auto_375424 ) ( CLEAR ?auto_375419 ) ( LIFTING ?auto_375427 ?auto_375420 ) ( IS-CRATE ?auto_375420 ) ( ON ?auto_375419 ?auto_375418 ) ( not ( = ?auto_375418 ?auto_375419 ) ) ( not ( = ?auto_375418 ?auto_375420 ) ) ( not ( = ?auto_375418 ?auto_375421 ) ) ( not ( = ?auto_375418 ?auto_375423 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375419 ?auto_375420 ?auto_375421 )
      ( MAKE-3CRATE-VERIFY ?auto_375418 ?auto_375419 ?auto_375420 ?auto_375421 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_375446 - SURFACE
      ?auto_375447 - SURFACE
      ?auto_375448 - SURFACE
      ?auto_375449 - SURFACE
    )
    :vars
    (
      ?auto_375453 - HOIST
      ?auto_375451 - PLACE
      ?auto_375454 - PLACE
      ?auto_375452 - HOIST
      ?auto_375455 - SURFACE
      ?auto_375450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375453 ?auto_375451 ) ( IS-CRATE ?auto_375449 ) ( not ( = ?auto_375448 ?auto_375449 ) ) ( not ( = ?auto_375447 ?auto_375448 ) ) ( not ( = ?auto_375447 ?auto_375449 ) ) ( not ( = ?auto_375454 ?auto_375451 ) ) ( HOIST-AT ?auto_375452 ?auto_375454 ) ( not ( = ?auto_375453 ?auto_375452 ) ) ( AVAILABLE ?auto_375452 ) ( SURFACE-AT ?auto_375449 ?auto_375454 ) ( ON ?auto_375449 ?auto_375455 ) ( CLEAR ?auto_375449 ) ( not ( = ?auto_375448 ?auto_375455 ) ) ( not ( = ?auto_375449 ?auto_375455 ) ) ( not ( = ?auto_375447 ?auto_375455 ) ) ( TRUCK-AT ?auto_375450 ?auto_375451 ) ( SURFACE-AT ?auto_375447 ?auto_375451 ) ( CLEAR ?auto_375447 ) ( IS-CRATE ?auto_375448 ) ( AVAILABLE ?auto_375453 ) ( IN ?auto_375448 ?auto_375450 ) ( ON ?auto_375447 ?auto_375446 ) ( not ( = ?auto_375446 ?auto_375447 ) ) ( not ( = ?auto_375446 ?auto_375448 ) ) ( not ( = ?auto_375446 ?auto_375449 ) ) ( not ( = ?auto_375446 ?auto_375455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375447 ?auto_375448 ?auto_375449 )
      ( MAKE-3CRATE-VERIFY ?auto_375446 ?auto_375447 ?auto_375448 ?auto_375449 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_375737 - SURFACE
      ?auto_375738 - SURFACE
      ?auto_375739 - SURFACE
      ?auto_375741 - SURFACE
      ?auto_375740 - SURFACE
    )
    :vars
    (
      ?auto_375743 - HOIST
      ?auto_375742 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375743 ?auto_375742 ) ( SURFACE-AT ?auto_375741 ?auto_375742 ) ( CLEAR ?auto_375741 ) ( LIFTING ?auto_375743 ?auto_375740 ) ( IS-CRATE ?auto_375740 ) ( not ( = ?auto_375741 ?auto_375740 ) ) ( ON ?auto_375738 ?auto_375737 ) ( ON ?auto_375739 ?auto_375738 ) ( ON ?auto_375741 ?auto_375739 ) ( not ( = ?auto_375737 ?auto_375738 ) ) ( not ( = ?auto_375737 ?auto_375739 ) ) ( not ( = ?auto_375737 ?auto_375741 ) ) ( not ( = ?auto_375737 ?auto_375740 ) ) ( not ( = ?auto_375738 ?auto_375739 ) ) ( not ( = ?auto_375738 ?auto_375741 ) ) ( not ( = ?auto_375738 ?auto_375740 ) ) ( not ( = ?auto_375739 ?auto_375741 ) ) ( not ( = ?auto_375739 ?auto_375740 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_375741 ?auto_375740 )
      ( MAKE-4CRATE-VERIFY ?auto_375737 ?auto_375738 ?auto_375739 ?auto_375741 ?auto_375740 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_375762 - SURFACE
      ?auto_375763 - SURFACE
      ?auto_375764 - SURFACE
      ?auto_375766 - SURFACE
      ?auto_375765 - SURFACE
    )
    :vars
    (
      ?auto_375767 - HOIST
      ?auto_375769 - PLACE
      ?auto_375768 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375767 ?auto_375769 ) ( SURFACE-AT ?auto_375766 ?auto_375769 ) ( CLEAR ?auto_375766 ) ( IS-CRATE ?auto_375765 ) ( not ( = ?auto_375766 ?auto_375765 ) ) ( TRUCK-AT ?auto_375768 ?auto_375769 ) ( AVAILABLE ?auto_375767 ) ( IN ?auto_375765 ?auto_375768 ) ( ON ?auto_375766 ?auto_375764 ) ( not ( = ?auto_375764 ?auto_375766 ) ) ( not ( = ?auto_375764 ?auto_375765 ) ) ( ON ?auto_375763 ?auto_375762 ) ( ON ?auto_375764 ?auto_375763 ) ( not ( = ?auto_375762 ?auto_375763 ) ) ( not ( = ?auto_375762 ?auto_375764 ) ) ( not ( = ?auto_375762 ?auto_375766 ) ) ( not ( = ?auto_375762 ?auto_375765 ) ) ( not ( = ?auto_375763 ?auto_375764 ) ) ( not ( = ?auto_375763 ?auto_375766 ) ) ( not ( = ?auto_375763 ?auto_375765 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375764 ?auto_375766 ?auto_375765 )
      ( MAKE-4CRATE-VERIFY ?auto_375762 ?auto_375763 ?auto_375764 ?auto_375766 ?auto_375765 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_375792 - SURFACE
      ?auto_375793 - SURFACE
      ?auto_375794 - SURFACE
      ?auto_375796 - SURFACE
      ?auto_375795 - SURFACE
    )
    :vars
    (
      ?auto_375798 - HOIST
      ?auto_375800 - PLACE
      ?auto_375799 - TRUCK
      ?auto_375797 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375798 ?auto_375800 ) ( SURFACE-AT ?auto_375796 ?auto_375800 ) ( CLEAR ?auto_375796 ) ( IS-CRATE ?auto_375795 ) ( not ( = ?auto_375796 ?auto_375795 ) ) ( AVAILABLE ?auto_375798 ) ( IN ?auto_375795 ?auto_375799 ) ( ON ?auto_375796 ?auto_375794 ) ( not ( = ?auto_375794 ?auto_375796 ) ) ( not ( = ?auto_375794 ?auto_375795 ) ) ( TRUCK-AT ?auto_375799 ?auto_375797 ) ( not ( = ?auto_375797 ?auto_375800 ) ) ( ON ?auto_375793 ?auto_375792 ) ( ON ?auto_375794 ?auto_375793 ) ( not ( = ?auto_375792 ?auto_375793 ) ) ( not ( = ?auto_375792 ?auto_375794 ) ) ( not ( = ?auto_375792 ?auto_375796 ) ) ( not ( = ?auto_375792 ?auto_375795 ) ) ( not ( = ?auto_375793 ?auto_375794 ) ) ( not ( = ?auto_375793 ?auto_375796 ) ) ( not ( = ?auto_375793 ?auto_375795 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375794 ?auto_375796 ?auto_375795 )
      ( MAKE-4CRATE-VERIFY ?auto_375792 ?auto_375793 ?auto_375794 ?auto_375796 ?auto_375795 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_375826 - SURFACE
      ?auto_375827 - SURFACE
      ?auto_375828 - SURFACE
      ?auto_375830 - SURFACE
      ?auto_375829 - SURFACE
    )
    :vars
    (
      ?auto_375834 - HOIST
      ?auto_375835 - PLACE
      ?auto_375832 - TRUCK
      ?auto_375833 - PLACE
      ?auto_375831 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_375834 ?auto_375835 ) ( SURFACE-AT ?auto_375830 ?auto_375835 ) ( CLEAR ?auto_375830 ) ( IS-CRATE ?auto_375829 ) ( not ( = ?auto_375830 ?auto_375829 ) ) ( AVAILABLE ?auto_375834 ) ( ON ?auto_375830 ?auto_375828 ) ( not ( = ?auto_375828 ?auto_375830 ) ) ( not ( = ?auto_375828 ?auto_375829 ) ) ( TRUCK-AT ?auto_375832 ?auto_375833 ) ( not ( = ?auto_375833 ?auto_375835 ) ) ( HOIST-AT ?auto_375831 ?auto_375833 ) ( LIFTING ?auto_375831 ?auto_375829 ) ( not ( = ?auto_375834 ?auto_375831 ) ) ( ON ?auto_375827 ?auto_375826 ) ( ON ?auto_375828 ?auto_375827 ) ( not ( = ?auto_375826 ?auto_375827 ) ) ( not ( = ?auto_375826 ?auto_375828 ) ) ( not ( = ?auto_375826 ?auto_375830 ) ) ( not ( = ?auto_375826 ?auto_375829 ) ) ( not ( = ?auto_375827 ?auto_375828 ) ) ( not ( = ?auto_375827 ?auto_375830 ) ) ( not ( = ?auto_375827 ?auto_375829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375828 ?auto_375830 ?auto_375829 )
      ( MAKE-4CRATE-VERIFY ?auto_375826 ?auto_375827 ?auto_375828 ?auto_375830 ?auto_375829 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_375864 - SURFACE
      ?auto_375865 - SURFACE
      ?auto_375866 - SURFACE
      ?auto_375868 - SURFACE
      ?auto_375867 - SURFACE
    )
    :vars
    (
      ?auto_375870 - HOIST
      ?auto_375872 - PLACE
      ?auto_375873 - TRUCK
      ?auto_375874 - PLACE
      ?auto_375869 - HOIST
      ?auto_375871 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_375870 ?auto_375872 ) ( SURFACE-AT ?auto_375868 ?auto_375872 ) ( CLEAR ?auto_375868 ) ( IS-CRATE ?auto_375867 ) ( not ( = ?auto_375868 ?auto_375867 ) ) ( AVAILABLE ?auto_375870 ) ( ON ?auto_375868 ?auto_375866 ) ( not ( = ?auto_375866 ?auto_375868 ) ) ( not ( = ?auto_375866 ?auto_375867 ) ) ( TRUCK-AT ?auto_375873 ?auto_375874 ) ( not ( = ?auto_375874 ?auto_375872 ) ) ( HOIST-AT ?auto_375869 ?auto_375874 ) ( not ( = ?auto_375870 ?auto_375869 ) ) ( AVAILABLE ?auto_375869 ) ( SURFACE-AT ?auto_375867 ?auto_375874 ) ( ON ?auto_375867 ?auto_375871 ) ( CLEAR ?auto_375867 ) ( not ( = ?auto_375868 ?auto_375871 ) ) ( not ( = ?auto_375867 ?auto_375871 ) ) ( not ( = ?auto_375866 ?auto_375871 ) ) ( ON ?auto_375865 ?auto_375864 ) ( ON ?auto_375866 ?auto_375865 ) ( not ( = ?auto_375864 ?auto_375865 ) ) ( not ( = ?auto_375864 ?auto_375866 ) ) ( not ( = ?auto_375864 ?auto_375868 ) ) ( not ( = ?auto_375864 ?auto_375867 ) ) ( not ( = ?auto_375864 ?auto_375871 ) ) ( not ( = ?auto_375865 ?auto_375866 ) ) ( not ( = ?auto_375865 ?auto_375868 ) ) ( not ( = ?auto_375865 ?auto_375867 ) ) ( not ( = ?auto_375865 ?auto_375871 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375866 ?auto_375868 ?auto_375867 )
      ( MAKE-4CRATE-VERIFY ?auto_375864 ?auto_375865 ?auto_375866 ?auto_375868 ?auto_375867 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_375903 - SURFACE
      ?auto_375904 - SURFACE
      ?auto_375905 - SURFACE
      ?auto_375907 - SURFACE
      ?auto_375906 - SURFACE
    )
    :vars
    (
      ?auto_375908 - HOIST
      ?auto_375910 - PLACE
      ?auto_375909 - PLACE
      ?auto_375912 - HOIST
      ?auto_375911 - SURFACE
      ?auto_375913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375908 ?auto_375910 ) ( SURFACE-AT ?auto_375907 ?auto_375910 ) ( CLEAR ?auto_375907 ) ( IS-CRATE ?auto_375906 ) ( not ( = ?auto_375907 ?auto_375906 ) ) ( AVAILABLE ?auto_375908 ) ( ON ?auto_375907 ?auto_375905 ) ( not ( = ?auto_375905 ?auto_375907 ) ) ( not ( = ?auto_375905 ?auto_375906 ) ) ( not ( = ?auto_375909 ?auto_375910 ) ) ( HOIST-AT ?auto_375912 ?auto_375909 ) ( not ( = ?auto_375908 ?auto_375912 ) ) ( AVAILABLE ?auto_375912 ) ( SURFACE-AT ?auto_375906 ?auto_375909 ) ( ON ?auto_375906 ?auto_375911 ) ( CLEAR ?auto_375906 ) ( not ( = ?auto_375907 ?auto_375911 ) ) ( not ( = ?auto_375906 ?auto_375911 ) ) ( not ( = ?auto_375905 ?auto_375911 ) ) ( TRUCK-AT ?auto_375913 ?auto_375910 ) ( ON ?auto_375904 ?auto_375903 ) ( ON ?auto_375905 ?auto_375904 ) ( not ( = ?auto_375903 ?auto_375904 ) ) ( not ( = ?auto_375903 ?auto_375905 ) ) ( not ( = ?auto_375903 ?auto_375907 ) ) ( not ( = ?auto_375903 ?auto_375906 ) ) ( not ( = ?auto_375903 ?auto_375911 ) ) ( not ( = ?auto_375904 ?auto_375905 ) ) ( not ( = ?auto_375904 ?auto_375907 ) ) ( not ( = ?auto_375904 ?auto_375906 ) ) ( not ( = ?auto_375904 ?auto_375911 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375905 ?auto_375907 ?auto_375906 )
      ( MAKE-4CRATE-VERIFY ?auto_375903 ?auto_375904 ?auto_375905 ?auto_375907 ?auto_375906 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_375942 - SURFACE
      ?auto_375943 - SURFACE
      ?auto_375944 - SURFACE
      ?auto_375946 - SURFACE
      ?auto_375945 - SURFACE
    )
    :vars
    (
      ?auto_375949 - HOIST
      ?auto_375951 - PLACE
      ?auto_375952 - PLACE
      ?auto_375947 - HOIST
      ?auto_375950 - SURFACE
      ?auto_375948 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375949 ?auto_375951 ) ( IS-CRATE ?auto_375945 ) ( not ( = ?auto_375946 ?auto_375945 ) ) ( not ( = ?auto_375944 ?auto_375946 ) ) ( not ( = ?auto_375944 ?auto_375945 ) ) ( not ( = ?auto_375952 ?auto_375951 ) ) ( HOIST-AT ?auto_375947 ?auto_375952 ) ( not ( = ?auto_375949 ?auto_375947 ) ) ( AVAILABLE ?auto_375947 ) ( SURFACE-AT ?auto_375945 ?auto_375952 ) ( ON ?auto_375945 ?auto_375950 ) ( CLEAR ?auto_375945 ) ( not ( = ?auto_375946 ?auto_375950 ) ) ( not ( = ?auto_375945 ?auto_375950 ) ) ( not ( = ?auto_375944 ?auto_375950 ) ) ( TRUCK-AT ?auto_375948 ?auto_375951 ) ( SURFACE-AT ?auto_375944 ?auto_375951 ) ( CLEAR ?auto_375944 ) ( LIFTING ?auto_375949 ?auto_375946 ) ( IS-CRATE ?auto_375946 ) ( ON ?auto_375943 ?auto_375942 ) ( ON ?auto_375944 ?auto_375943 ) ( not ( = ?auto_375942 ?auto_375943 ) ) ( not ( = ?auto_375942 ?auto_375944 ) ) ( not ( = ?auto_375942 ?auto_375946 ) ) ( not ( = ?auto_375942 ?auto_375945 ) ) ( not ( = ?auto_375942 ?auto_375950 ) ) ( not ( = ?auto_375943 ?auto_375944 ) ) ( not ( = ?auto_375943 ?auto_375946 ) ) ( not ( = ?auto_375943 ?auto_375945 ) ) ( not ( = ?auto_375943 ?auto_375950 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375944 ?auto_375946 ?auto_375945 )
      ( MAKE-4CRATE-VERIFY ?auto_375942 ?auto_375943 ?auto_375944 ?auto_375946 ?auto_375945 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_375981 - SURFACE
      ?auto_375982 - SURFACE
      ?auto_375983 - SURFACE
      ?auto_375985 - SURFACE
      ?auto_375984 - SURFACE
    )
    :vars
    (
      ?auto_375989 - HOIST
      ?auto_375986 - PLACE
      ?auto_375987 - PLACE
      ?auto_375990 - HOIST
      ?auto_375988 - SURFACE
      ?auto_375991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_375989 ?auto_375986 ) ( IS-CRATE ?auto_375984 ) ( not ( = ?auto_375985 ?auto_375984 ) ) ( not ( = ?auto_375983 ?auto_375985 ) ) ( not ( = ?auto_375983 ?auto_375984 ) ) ( not ( = ?auto_375987 ?auto_375986 ) ) ( HOIST-AT ?auto_375990 ?auto_375987 ) ( not ( = ?auto_375989 ?auto_375990 ) ) ( AVAILABLE ?auto_375990 ) ( SURFACE-AT ?auto_375984 ?auto_375987 ) ( ON ?auto_375984 ?auto_375988 ) ( CLEAR ?auto_375984 ) ( not ( = ?auto_375985 ?auto_375988 ) ) ( not ( = ?auto_375984 ?auto_375988 ) ) ( not ( = ?auto_375983 ?auto_375988 ) ) ( TRUCK-AT ?auto_375991 ?auto_375986 ) ( SURFACE-AT ?auto_375983 ?auto_375986 ) ( CLEAR ?auto_375983 ) ( IS-CRATE ?auto_375985 ) ( AVAILABLE ?auto_375989 ) ( IN ?auto_375985 ?auto_375991 ) ( ON ?auto_375982 ?auto_375981 ) ( ON ?auto_375983 ?auto_375982 ) ( not ( = ?auto_375981 ?auto_375982 ) ) ( not ( = ?auto_375981 ?auto_375983 ) ) ( not ( = ?auto_375981 ?auto_375985 ) ) ( not ( = ?auto_375981 ?auto_375984 ) ) ( not ( = ?auto_375981 ?auto_375988 ) ) ( not ( = ?auto_375982 ?auto_375983 ) ) ( not ( = ?auto_375982 ?auto_375985 ) ) ( not ( = ?auto_375982 ?auto_375984 ) ) ( not ( = ?auto_375982 ?auto_375988 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_375983 ?auto_375985 ?auto_375984 )
      ( MAKE-4CRATE-VERIFY ?auto_375981 ?auto_375982 ?auto_375983 ?auto_375985 ?auto_375984 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_376641 - SURFACE
      ?auto_376642 - SURFACE
      ?auto_376643 - SURFACE
      ?auto_376645 - SURFACE
      ?auto_376644 - SURFACE
      ?auto_376646 - SURFACE
    )
    :vars
    (
      ?auto_376647 - HOIST
      ?auto_376648 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_376647 ?auto_376648 ) ( SURFACE-AT ?auto_376644 ?auto_376648 ) ( CLEAR ?auto_376644 ) ( LIFTING ?auto_376647 ?auto_376646 ) ( IS-CRATE ?auto_376646 ) ( not ( = ?auto_376644 ?auto_376646 ) ) ( ON ?auto_376642 ?auto_376641 ) ( ON ?auto_376643 ?auto_376642 ) ( ON ?auto_376645 ?auto_376643 ) ( ON ?auto_376644 ?auto_376645 ) ( not ( = ?auto_376641 ?auto_376642 ) ) ( not ( = ?auto_376641 ?auto_376643 ) ) ( not ( = ?auto_376641 ?auto_376645 ) ) ( not ( = ?auto_376641 ?auto_376644 ) ) ( not ( = ?auto_376641 ?auto_376646 ) ) ( not ( = ?auto_376642 ?auto_376643 ) ) ( not ( = ?auto_376642 ?auto_376645 ) ) ( not ( = ?auto_376642 ?auto_376644 ) ) ( not ( = ?auto_376642 ?auto_376646 ) ) ( not ( = ?auto_376643 ?auto_376645 ) ) ( not ( = ?auto_376643 ?auto_376644 ) ) ( not ( = ?auto_376643 ?auto_376646 ) ) ( not ( = ?auto_376645 ?auto_376644 ) ) ( not ( = ?auto_376645 ?auto_376646 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_376644 ?auto_376646 )
      ( MAKE-5CRATE-VERIFY ?auto_376641 ?auto_376642 ?auto_376643 ?auto_376645 ?auto_376644 ?auto_376646 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_376675 - SURFACE
      ?auto_376676 - SURFACE
      ?auto_376677 - SURFACE
      ?auto_376679 - SURFACE
      ?auto_376678 - SURFACE
      ?auto_376680 - SURFACE
    )
    :vars
    (
      ?auto_376682 - HOIST
      ?auto_376683 - PLACE
      ?auto_376681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376682 ?auto_376683 ) ( SURFACE-AT ?auto_376678 ?auto_376683 ) ( CLEAR ?auto_376678 ) ( IS-CRATE ?auto_376680 ) ( not ( = ?auto_376678 ?auto_376680 ) ) ( TRUCK-AT ?auto_376681 ?auto_376683 ) ( AVAILABLE ?auto_376682 ) ( IN ?auto_376680 ?auto_376681 ) ( ON ?auto_376678 ?auto_376679 ) ( not ( = ?auto_376679 ?auto_376678 ) ) ( not ( = ?auto_376679 ?auto_376680 ) ) ( ON ?auto_376676 ?auto_376675 ) ( ON ?auto_376677 ?auto_376676 ) ( ON ?auto_376679 ?auto_376677 ) ( not ( = ?auto_376675 ?auto_376676 ) ) ( not ( = ?auto_376675 ?auto_376677 ) ) ( not ( = ?auto_376675 ?auto_376679 ) ) ( not ( = ?auto_376675 ?auto_376678 ) ) ( not ( = ?auto_376675 ?auto_376680 ) ) ( not ( = ?auto_376676 ?auto_376677 ) ) ( not ( = ?auto_376676 ?auto_376679 ) ) ( not ( = ?auto_376676 ?auto_376678 ) ) ( not ( = ?auto_376676 ?auto_376680 ) ) ( not ( = ?auto_376677 ?auto_376679 ) ) ( not ( = ?auto_376677 ?auto_376678 ) ) ( not ( = ?auto_376677 ?auto_376680 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376679 ?auto_376678 ?auto_376680 )
      ( MAKE-5CRATE-VERIFY ?auto_376675 ?auto_376676 ?auto_376677 ?auto_376679 ?auto_376678 ?auto_376680 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_376715 - SURFACE
      ?auto_376716 - SURFACE
      ?auto_376717 - SURFACE
      ?auto_376719 - SURFACE
      ?auto_376718 - SURFACE
      ?auto_376720 - SURFACE
    )
    :vars
    (
      ?auto_376721 - HOIST
      ?auto_376724 - PLACE
      ?auto_376722 - TRUCK
      ?auto_376723 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_376721 ?auto_376724 ) ( SURFACE-AT ?auto_376718 ?auto_376724 ) ( CLEAR ?auto_376718 ) ( IS-CRATE ?auto_376720 ) ( not ( = ?auto_376718 ?auto_376720 ) ) ( AVAILABLE ?auto_376721 ) ( IN ?auto_376720 ?auto_376722 ) ( ON ?auto_376718 ?auto_376719 ) ( not ( = ?auto_376719 ?auto_376718 ) ) ( not ( = ?auto_376719 ?auto_376720 ) ) ( TRUCK-AT ?auto_376722 ?auto_376723 ) ( not ( = ?auto_376723 ?auto_376724 ) ) ( ON ?auto_376716 ?auto_376715 ) ( ON ?auto_376717 ?auto_376716 ) ( ON ?auto_376719 ?auto_376717 ) ( not ( = ?auto_376715 ?auto_376716 ) ) ( not ( = ?auto_376715 ?auto_376717 ) ) ( not ( = ?auto_376715 ?auto_376719 ) ) ( not ( = ?auto_376715 ?auto_376718 ) ) ( not ( = ?auto_376715 ?auto_376720 ) ) ( not ( = ?auto_376716 ?auto_376717 ) ) ( not ( = ?auto_376716 ?auto_376719 ) ) ( not ( = ?auto_376716 ?auto_376718 ) ) ( not ( = ?auto_376716 ?auto_376720 ) ) ( not ( = ?auto_376717 ?auto_376719 ) ) ( not ( = ?auto_376717 ?auto_376718 ) ) ( not ( = ?auto_376717 ?auto_376720 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376719 ?auto_376718 ?auto_376720 )
      ( MAKE-5CRATE-VERIFY ?auto_376715 ?auto_376716 ?auto_376717 ?auto_376719 ?auto_376718 ?auto_376720 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_376760 - SURFACE
      ?auto_376761 - SURFACE
      ?auto_376762 - SURFACE
      ?auto_376764 - SURFACE
      ?auto_376763 - SURFACE
      ?auto_376765 - SURFACE
    )
    :vars
    (
      ?auto_376768 - HOIST
      ?auto_376767 - PLACE
      ?auto_376766 - TRUCK
      ?auto_376769 - PLACE
      ?auto_376770 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_376768 ?auto_376767 ) ( SURFACE-AT ?auto_376763 ?auto_376767 ) ( CLEAR ?auto_376763 ) ( IS-CRATE ?auto_376765 ) ( not ( = ?auto_376763 ?auto_376765 ) ) ( AVAILABLE ?auto_376768 ) ( ON ?auto_376763 ?auto_376764 ) ( not ( = ?auto_376764 ?auto_376763 ) ) ( not ( = ?auto_376764 ?auto_376765 ) ) ( TRUCK-AT ?auto_376766 ?auto_376769 ) ( not ( = ?auto_376769 ?auto_376767 ) ) ( HOIST-AT ?auto_376770 ?auto_376769 ) ( LIFTING ?auto_376770 ?auto_376765 ) ( not ( = ?auto_376768 ?auto_376770 ) ) ( ON ?auto_376761 ?auto_376760 ) ( ON ?auto_376762 ?auto_376761 ) ( ON ?auto_376764 ?auto_376762 ) ( not ( = ?auto_376760 ?auto_376761 ) ) ( not ( = ?auto_376760 ?auto_376762 ) ) ( not ( = ?auto_376760 ?auto_376764 ) ) ( not ( = ?auto_376760 ?auto_376763 ) ) ( not ( = ?auto_376760 ?auto_376765 ) ) ( not ( = ?auto_376761 ?auto_376762 ) ) ( not ( = ?auto_376761 ?auto_376764 ) ) ( not ( = ?auto_376761 ?auto_376763 ) ) ( not ( = ?auto_376761 ?auto_376765 ) ) ( not ( = ?auto_376762 ?auto_376764 ) ) ( not ( = ?auto_376762 ?auto_376763 ) ) ( not ( = ?auto_376762 ?auto_376765 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376764 ?auto_376763 ?auto_376765 )
      ( MAKE-5CRATE-VERIFY ?auto_376760 ?auto_376761 ?auto_376762 ?auto_376764 ?auto_376763 ?auto_376765 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_376810 - SURFACE
      ?auto_376811 - SURFACE
      ?auto_376812 - SURFACE
      ?auto_376814 - SURFACE
      ?auto_376813 - SURFACE
      ?auto_376815 - SURFACE
    )
    :vars
    (
      ?auto_376821 - HOIST
      ?auto_376819 - PLACE
      ?auto_376817 - TRUCK
      ?auto_376816 - PLACE
      ?auto_376820 - HOIST
      ?auto_376818 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_376821 ?auto_376819 ) ( SURFACE-AT ?auto_376813 ?auto_376819 ) ( CLEAR ?auto_376813 ) ( IS-CRATE ?auto_376815 ) ( not ( = ?auto_376813 ?auto_376815 ) ) ( AVAILABLE ?auto_376821 ) ( ON ?auto_376813 ?auto_376814 ) ( not ( = ?auto_376814 ?auto_376813 ) ) ( not ( = ?auto_376814 ?auto_376815 ) ) ( TRUCK-AT ?auto_376817 ?auto_376816 ) ( not ( = ?auto_376816 ?auto_376819 ) ) ( HOIST-AT ?auto_376820 ?auto_376816 ) ( not ( = ?auto_376821 ?auto_376820 ) ) ( AVAILABLE ?auto_376820 ) ( SURFACE-AT ?auto_376815 ?auto_376816 ) ( ON ?auto_376815 ?auto_376818 ) ( CLEAR ?auto_376815 ) ( not ( = ?auto_376813 ?auto_376818 ) ) ( not ( = ?auto_376815 ?auto_376818 ) ) ( not ( = ?auto_376814 ?auto_376818 ) ) ( ON ?auto_376811 ?auto_376810 ) ( ON ?auto_376812 ?auto_376811 ) ( ON ?auto_376814 ?auto_376812 ) ( not ( = ?auto_376810 ?auto_376811 ) ) ( not ( = ?auto_376810 ?auto_376812 ) ) ( not ( = ?auto_376810 ?auto_376814 ) ) ( not ( = ?auto_376810 ?auto_376813 ) ) ( not ( = ?auto_376810 ?auto_376815 ) ) ( not ( = ?auto_376810 ?auto_376818 ) ) ( not ( = ?auto_376811 ?auto_376812 ) ) ( not ( = ?auto_376811 ?auto_376814 ) ) ( not ( = ?auto_376811 ?auto_376813 ) ) ( not ( = ?auto_376811 ?auto_376815 ) ) ( not ( = ?auto_376811 ?auto_376818 ) ) ( not ( = ?auto_376812 ?auto_376814 ) ) ( not ( = ?auto_376812 ?auto_376813 ) ) ( not ( = ?auto_376812 ?auto_376815 ) ) ( not ( = ?auto_376812 ?auto_376818 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376814 ?auto_376813 ?auto_376815 )
      ( MAKE-5CRATE-VERIFY ?auto_376810 ?auto_376811 ?auto_376812 ?auto_376814 ?auto_376813 ?auto_376815 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_376861 - SURFACE
      ?auto_376862 - SURFACE
      ?auto_376863 - SURFACE
      ?auto_376865 - SURFACE
      ?auto_376864 - SURFACE
      ?auto_376866 - SURFACE
    )
    :vars
    (
      ?auto_376869 - HOIST
      ?auto_376871 - PLACE
      ?auto_376872 - PLACE
      ?auto_376870 - HOIST
      ?auto_376867 - SURFACE
      ?auto_376868 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376869 ?auto_376871 ) ( SURFACE-AT ?auto_376864 ?auto_376871 ) ( CLEAR ?auto_376864 ) ( IS-CRATE ?auto_376866 ) ( not ( = ?auto_376864 ?auto_376866 ) ) ( AVAILABLE ?auto_376869 ) ( ON ?auto_376864 ?auto_376865 ) ( not ( = ?auto_376865 ?auto_376864 ) ) ( not ( = ?auto_376865 ?auto_376866 ) ) ( not ( = ?auto_376872 ?auto_376871 ) ) ( HOIST-AT ?auto_376870 ?auto_376872 ) ( not ( = ?auto_376869 ?auto_376870 ) ) ( AVAILABLE ?auto_376870 ) ( SURFACE-AT ?auto_376866 ?auto_376872 ) ( ON ?auto_376866 ?auto_376867 ) ( CLEAR ?auto_376866 ) ( not ( = ?auto_376864 ?auto_376867 ) ) ( not ( = ?auto_376866 ?auto_376867 ) ) ( not ( = ?auto_376865 ?auto_376867 ) ) ( TRUCK-AT ?auto_376868 ?auto_376871 ) ( ON ?auto_376862 ?auto_376861 ) ( ON ?auto_376863 ?auto_376862 ) ( ON ?auto_376865 ?auto_376863 ) ( not ( = ?auto_376861 ?auto_376862 ) ) ( not ( = ?auto_376861 ?auto_376863 ) ) ( not ( = ?auto_376861 ?auto_376865 ) ) ( not ( = ?auto_376861 ?auto_376864 ) ) ( not ( = ?auto_376861 ?auto_376866 ) ) ( not ( = ?auto_376861 ?auto_376867 ) ) ( not ( = ?auto_376862 ?auto_376863 ) ) ( not ( = ?auto_376862 ?auto_376865 ) ) ( not ( = ?auto_376862 ?auto_376864 ) ) ( not ( = ?auto_376862 ?auto_376866 ) ) ( not ( = ?auto_376862 ?auto_376867 ) ) ( not ( = ?auto_376863 ?auto_376865 ) ) ( not ( = ?auto_376863 ?auto_376864 ) ) ( not ( = ?auto_376863 ?auto_376866 ) ) ( not ( = ?auto_376863 ?auto_376867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376865 ?auto_376864 ?auto_376866 )
      ( MAKE-5CRATE-VERIFY ?auto_376861 ?auto_376862 ?auto_376863 ?auto_376865 ?auto_376864 ?auto_376866 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_376912 - SURFACE
      ?auto_376913 - SURFACE
      ?auto_376914 - SURFACE
      ?auto_376916 - SURFACE
      ?auto_376915 - SURFACE
      ?auto_376917 - SURFACE
    )
    :vars
    (
      ?auto_376920 - HOIST
      ?auto_376922 - PLACE
      ?auto_376918 - PLACE
      ?auto_376921 - HOIST
      ?auto_376919 - SURFACE
      ?auto_376923 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376920 ?auto_376922 ) ( IS-CRATE ?auto_376917 ) ( not ( = ?auto_376915 ?auto_376917 ) ) ( not ( = ?auto_376916 ?auto_376915 ) ) ( not ( = ?auto_376916 ?auto_376917 ) ) ( not ( = ?auto_376918 ?auto_376922 ) ) ( HOIST-AT ?auto_376921 ?auto_376918 ) ( not ( = ?auto_376920 ?auto_376921 ) ) ( AVAILABLE ?auto_376921 ) ( SURFACE-AT ?auto_376917 ?auto_376918 ) ( ON ?auto_376917 ?auto_376919 ) ( CLEAR ?auto_376917 ) ( not ( = ?auto_376915 ?auto_376919 ) ) ( not ( = ?auto_376917 ?auto_376919 ) ) ( not ( = ?auto_376916 ?auto_376919 ) ) ( TRUCK-AT ?auto_376923 ?auto_376922 ) ( SURFACE-AT ?auto_376916 ?auto_376922 ) ( CLEAR ?auto_376916 ) ( LIFTING ?auto_376920 ?auto_376915 ) ( IS-CRATE ?auto_376915 ) ( ON ?auto_376913 ?auto_376912 ) ( ON ?auto_376914 ?auto_376913 ) ( ON ?auto_376916 ?auto_376914 ) ( not ( = ?auto_376912 ?auto_376913 ) ) ( not ( = ?auto_376912 ?auto_376914 ) ) ( not ( = ?auto_376912 ?auto_376916 ) ) ( not ( = ?auto_376912 ?auto_376915 ) ) ( not ( = ?auto_376912 ?auto_376917 ) ) ( not ( = ?auto_376912 ?auto_376919 ) ) ( not ( = ?auto_376913 ?auto_376914 ) ) ( not ( = ?auto_376913 ?auto_376916 ) ) ( not ( = ?auto_376913 ?auto_376915 ) ) ( not ( = ?auto_376913 ?auto_376917 ) ) ( not ( = ?auto_376913 ?auto_376919 ) ) ( not ( = ?auto_376914 ?auto_376916 ) ) ( not ( = ?auto_376914 ?auto_376915 ) ) ( not ( = ?auto_376914 ?auto_376917 ) ) ( not ( = ?auto_376914 ?auto_376919 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376916 ?auto_376915 ?auto_376917 )
      ( MAKE-5CRATE-VERIFY ?auto_376912 ?auto_376913 ?auto_376914 ?auto_376916 ?auto_376915 ?auto_376917 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_376963 - SURFACE
      ?auto_376964 - SURFACE
      ?auto_376965 - SURFACE
      ?auto_376967 - SURFACE
      ?auto_376966 - SURFACE
      ?auto_376968 - SURFACE
    )
    :vars
    (
      ?auto_376972 - HOIST
      ?auto_376969 - PLACE
      ?auto_376970 - PLACE
      ?auto_376974 - HOIST
      ?auto_376973 - SURFACE
      ?auto_376971 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_376972 ?auto_376969 ) ( IS-CRATE ?auto_376968 ) ( not ( = ?auto_376966 ?auto_376968 ) ) ( not ( = ?auto_376967 ?auto_376966 ) ) ( not ( = ?auto_376967 ?auto_376968 ) ) ( not ( = ?auto_376970 ?auto_376969 ) ) ( HOIST-AT ?auto_376974 ?auto_376970 ) ( not ( = ?auto_376972 ?auto_376974 ) ) ( AVAILABLE ?auto_376974 ) ( SURFACE-AT ?auto_376968 ?auto_376970 ) ( ON ?auto_376968 ?auto_376973 ) ( CLEAR ?auto_376968 ) ( not ( = ?auto_376966 ?auto_376973 ) ) ( not ( = ?auto_376968 ?auto_376973 ) ) ( not ( = ?auto_376967 ?auto_376973 ) ) ( TRUCK-AT ?auto_376971 ?auto_376969 ) ( SURFACE-AT ?auto_376967 ?auto_376969 ) ( CLEAR ?auto_376967 ) ( IS-CRATE ?auto_376966 ) ( AVAILABLE ?auto_376972 ) ( IN ?auto_376966 ?auto_376971 ) ( ON ?auto_376964 ?auto_376963 ) ( ON ?auto_376965 ?auto_376964 ) ( ON ?auto_376967 ?auto_376965 ) ( not ( = ?auto_376963 ?auto_376964 ) ) ( not ( = ?auto_376963 ?auto_376965 ) ) ( not ( = ?auto_376963 ?auto_376967 ) ) ( not ( = ?auto_376963 ?auto_376966 ) ) ( not ( = ?auto_376963 ?auto_376968 ) ) ( not ( = ?auto_376963 ?auto_376973 ) ) ( not ( = ?auto_376964 ?auto_376965 ) ) ( not ( = ?auto_376964 ?auto_376967 ) ) ( not ( = ?auto_376964 ?auto_376966 ) ) ( not ( = ?auto_376964 ?auto_376968 ) ) ( not ( = ?auto_376964 ?auto_376973 ) ) ( not ( = ?auto_376965 ?auto_376967 ) ) ( not ( = ?auto_376965 ?auto_376966 ) ) ( not ( = ?auto_376965 ?auto_376968 ) ) ( not ( = ?auto_376965 ?auto_376973 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_376967 ?auto_376966 ?auto_376968 )
      ( MAKE-5CRATE-VERIFY ?auto_376963 ?auto_376964 ?auto_376965 ?auto_376967 ?auto_376966 ?auto_376968 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_378172 - SURFACE
      ?auto_378173 - SURFACE
      ?auto_378174 - SURFACE
      ?auto_378176 - SURFACE
      ?auto_378175 - SURFACE
      ?auto_378177 - SURFACE
      ?auto_378178 - SURFACE
    )
    :vars
    (
      ?auto_378179 - HOIST
      ?auto_378180 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_378179 ?auto_378180 ) ( SURFACE-AT ?auto_378177 ?auto_378180 ) ( CLEAR ?auto_378177 ) ( LIFTING ?auto_378179 ?auto_378178 ) ( IS-CRATE ?auto_378178 ) ( not ( = ?auto_378177 ?auto_378178 ) ) ( ON ?auto_378173 ?auto_378172 ) ( ON ?auto_378174 ?auto_378173 ) ( ON ?auto_378176 ?auto_378174 ) ( ON ?auto_378175 ?auto_378176 ) ( ON ?auto_378177 ?auto_378175 ) ( not ( = ?auto_378172 ?auto_378173 ) ) ( not ( = ?auto_378172 ?auto_378174 ) ) ( not ( = ?auto_378172 ?auto_378176 ) ) ( not ( = ?auto_378172 ?auto_378175 ) ) ( not ( = ?auto_378172 ?auto_378177 ) ) ( not ( = ?auto_378172 ?auto_378178 ) ) ( not ( = ?auto_378173 ?auto_378174 ) ) ( not ( = ?auto_378173 ?auto_378176 ) ) ( not ( = ?auto_378173 ?auto_378175 ) ) ( not ( = ?auto_378173 ?auto_378177 ) ) ( not ( = ?auto_378173 ?auto_378178 ) ) ( not ( = ?auto_378174 ?auto_378176 ) ) ( not ( = ?auto_378174 ?auto_378175 ) ) ( not ( = ?auto_378174 ?auto_378177 ) ) ( not ( = ?auto_378174 ?auto_378178 ) ) ( not ( = ?auto_378176 ?auto_378175 ) ) ( not ( = ?auto_378176 ?auto_378177 ) ) ( not ( = ?auto_378176 ?auto_378178 ) ) ( not ( = ?auto_378175 ?auto_378177 ) ) ( not ( = ?auto_378175 ?auto_378178 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_378177 ?auto_378178 )
      ( MAKE-6CRATE-VERIFY ?auto_378172 ?auto_378173 ?auto_378174 ?auto_378176 ?auto_378175 ?auto_378177 ?auto_378178 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_378216 - SURFACE
      ?auto_378217 - SURFACE
      ?auto_378218 - SURFACE
      ?auto_378220 - SURFACE
      ?auto_378219 - SURFACE
      ?auto_378221 - SURFACE
      ?auto_378222 - SURFACE
    )
    :vars
    (
      ?auto_378223 - HOIST
      ?auto_378225 - PLACE
      ?auto_378224 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_378223 ?auto_378225 ) ( SURFACE-AT ?auto_378221 ?auto_378225 ) ( CLEAR ?auto_378221 ) ( IS-CRATE ?auto_378222 ) ( not ( = ?auto_378221 ?auto_378222 ) ) ( TRUCK-AT ?auto_378224 ?auto_378225 ) ( AVAILABLE ?auto_378223 ) ( IN ?auto_378222 ?auto_378224 ) ( ON ?auto_378221 ?auto_378219 ) ( not ( = ?auto_378219 ?auto_378221 ) ) ( not ( = ?auto_378219 ?auto_378222 ) ) ( ON ?auto_378217 ?auto_378216 ) ( ON ?auto_378218 ?auto_378217 ) ( ON ?auto_378220 ?auto_378218 ) ( ON ?auto_378219 ?auto_378220 ) ( not ( = ?auto_378216 ?auto_378217 ) ) ( not ( = ?auto_378216 ?auto_378218 ) ) ( not ( = ?auto_378216 ?auto_378220 ) ) ( not ( = ?auto_378216 ?auto_378219 ) ) ( not ( = ?auto_378216 ?auto_378221 ) ) ( not ( = ?auto_378216 ?auto_378222 ) ) ( not ( = ?auto_378217 ?auto_378218 ) ) ( not ( = ?auto_378217 ?auto_378220 ) ) ( not ( = ?auto_378217 ?auto_378219 ) ) ( not ( = ?auto_378217 ?auto_378221 ) ) ( not ( = ?auto_378217 ?auto_378222 ) ) ( not ( = ?auto_378218 ?auto_378220 ) ) ( not ( = ?auto_378218 ?auto_378219 ) ) ( not ( = ?auto_378218 ?auto_378221 ) ) ( not ( = ?auto_378218 ?auto_378222 ) ) ( not ( = ?auto_378220 ?auto_378219 ) ) ( not ( = ?auto_378220 ?auto_378221 ) ) ( not ( = ?auto_378220 ?auto_378222 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_378219 ?auto_378221 ?auto_378222 )
      ( MAKE-6CRATE-VERIFY ?auto_378216 ?auto_378217 ?auto_378218 ?auto_378220 ?auto_378219 ?auto_378221 ?auto_378222 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_378267 - SURFACE
      ?auto_378268 - SURFACE
      ?auto_378269 - SURFACE
      ?auto_378271 - SURFACE
      ?auto_378270 - SURFACE
      ?auto_378272 - SURFACE
      ?auto_378273 - SURFACE
    )
    :vars
    (
      ?auto_378275 - HOIST
      ?auto_378277 - PLACE
      ?auto_378274 - TRUCK
      ?auto_378276 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_378275 ?auto_378277 ) ( SURFACE-AT ?auto_378272 ?auto_378277 ) ( CLEAR ?auto_378272 ) ( IS-CRATE ?auto_378273 ) ( not ( = ?auto_378272 ?auto_378273 ) ) ( AVAILABLE ?auto_378275 ) ( IN ?auto_378273 ?auto_378274 ) ( ON ?auto_378272 ?auto_378270 ) ( not ( = ?auto_378270 ?auto_378272 ) ) ( not ( = ?auto_378270 ?auto_378273 ) ) ( TRUCK-AT ?auto_378274 ?auto_378276 ) ( not ( = ?auto_378276 ?auto_378277 ) ) ( ON ?auto_378268 ?auto_378267 ) ( ON ?auto_378269 ?auto_378268 ) ( ON ?auto_378271 ?auto_378269 ) ( ON ?auto_378270 ?auto_378271 ) ( not ( = ?auto_378267 ?auto_378268 ) ) ( not ( = ?auto_378267 ?auto_378269 ) ) ( not ( = ?auto_378267 ?auto_378271 ) ) ( not ( = ?auto_378267 ?auto_378270 ) ) ( not ( = ?auto_378267 ?auto_378272 ) ) ( not ( = ?auto_378267 ?auto_378273 ) ) ( not ( = ?auto_378268 ?auto_378269 ) ) ( not ( = ?auto_378268 ?auto_378271 ) ) ( not ( = ?auto_378268 ?auto_378270 ) ) ( not ( = ?auto_378268 ?auto_378272 ) ) ( not ( = ?auto_378268 ?auto_378273 ) ) ( not ( = ?auto_378269 ?auto_378271 ) ) ( not ( = ?auto_378269 ?auto_378270 ) ) ( not ( = ?auto_378269 ?auto_378272 ) ) ( not ( = ?auto_378269 ?auto_378273 ) ) ( not ( = ?auto_378271 ?auto_378270 ) ) ( not ( = ?auto_378271 ?auto_378272 ) ) ( not ( = ?auto_378271 ?auto_378273 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_378270 ?auto_378272 ?auto_378273 )
      ( MAKE-6CRATE-VERIFY ?auto_378267 ?auto_378268 ?auto_378269 ?auto_378271 ?auto_378270 ?auto_378272 ?auto_378273 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_378324 - SURFACE
      ?auto_378325 - SURFACE
      ?auto_378326 - SURFACE
      ?auto_378328 - SURFACE
      ?auto_378327 - SURFACE
      ?auto_378329 - SURFACE
      ?auto_378330 - SURFACE
    )
    :vars
    (
      ?auto_378332 - HOIST
      ?auto_378331 - PLACE
      ?auto_378334 - TRUCK
      ?auto_378333 - PLACE
      ?auto_378335 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_378332 ?auto_378331 ) ( SURFACE-AT ?auto_378329 ?auto_378331 ) ( CLEAR ?auto_378329 ) ( IS-CRATE ?auto_378330 ) ( not ( = ?auto_378329 ?auto_378330 ) ) ( AVAILABLE ?auto_378332 ) ( ON ?auto_378329 ?auto_378327 ) ( not ( = ?auto_378327 ?auto_378329 ) ) ( not ( = ?auto_378327 ?auto_378330 ) ) ( TRUCK-AT ?auto_378334 ?auto_378333 ) ( not ( = ?auto_378333 ?auto_378331 ) ) ( HOIST-AT ?auto_378335 ?auto_378333 ) ( LIFTING ?auto_378335 ?auto_378330 ) ( not ( = ?auto_378332 ?auto_378335 ) ) ( ON ?auto_378325 ?auto_378324 ) ( ON ?auto_378326 ?auto_378325 ) ( ON ?auto_378328 ?auto_378326 ) ( ON ?auto_378327 ?auto_378328 ) ( not ( = ?auto_378324 ?auto_378325 ) ) ( not ( = ?auto_378324 ?auto_378326 ) ) ( not ( = ?auto_378324 ?auto_378328 ) ) ( not ( = ?auto_378324 ?auto_378327 ) ) ( not ( = ?auto_378324 ?auto_378329 ) ) ( not ( = ?auto_378324 ?auto_378330 ) ) ( not ( = ?auto_378325 ?auto_378326 ) ) ( not ( = ?auto_378325 ?auto_378328 ) ) ( not ( = ?auto_378325 ?auto_378327 ) ) ( not ( = ?auto_378325 ?auto_378329 ) ) ( not ( = ?auto_378325 ?auto_378330 ) ) ( not ( = ?auto_378326 ?auto_378328 ) ) ( not ( = ?auto_378326 ?auto_378327 ) ) ( not ( = ?auto_378326 ?auto_378329 ) ) ( not ( = ?auto_378326 ?auto_378330 ) ) ( not ( = ?auto_378328 ?auto_378327 ) ) ( not ( = ?auto_378328 ?auto_378329 ) ) ( not ( = ?auto_378328 ?auto_378330 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_378327 ?auto_378329 ?auto_378330 )
      ( MAKE-6CRATE-VERIFY ?auto_378324 ?auto_378325 ?auto_378326 ?auto_378328 ?auto_378327 ?auto_378329 ?auto_378330 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_378387 - SURFACE
      ?auto_378388 - SURFACE
      ?auto_378389 - SURFACE
      ?auto_378391 - SURFACE
      ?auto_378390 - SURFACE
      ?auto_378392 - SURFACE
      ?auto_378393 - SURFACE
    )
    :vars
    (
      ?auto_378397 - HOIST
      ?auto_378396 - PLACE
      ?auto_378398 - TRUCK
      ?auto_378395 - PLACE
      ?auto_378394 - HOIST
      ?auto_378399 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_378397 ?auto_378396 ) ( SURFACE-AT ?auto_378392 ?auto_378396 ) ( CLEAR ?auto_378392 ) ( IS-CRATE ?auto_378393 ) ( not ( = ?auto_378392 ?auto_378393 ) ) ( AVAILABLE ?auto_378397 ) ( ON ?auto_378392 ?auto_378390 ) ( not ( = ?auto_378390 ?auto_378392 ) ) ( not ( = ?auto_378390 ?auto_378393 ) ) ( TRUCK-AT ?auto_378398 ?auto_378395 ) ( not ( = ?auto_378395 ?auto_378396 ) ) ( HOIST-AT ?auto_378394 ?auto_378395 ) ( not ( = ?auto_378397 ?auto_378394 ) ) ( AVAILABLE ?auto_378394 ) ( SURFACE-AT ?auto_378393 ?auto_378395 ) ( ON ?auto_378393 ?auto_378399 ) ( CLEAR ?auto_378393 ) ( not ( = ?auto_378392 ?auto_378399 ) ) ( not ( = ?auto_378393 ?auto_378399 ) ) ( not ( = ?auto_378390 ?auto_378399 ) ) ( ON ?auto_378388 ?auto_378387 ) ( ON ?auto_378389 ?auto_378388 ) ( ON ?auto_378391 ?auto_378389 ) ( ON ?auto_378390 ?auto_378391 ) ( not ( = ?auto_378387 ?auto_378388 ) ) ( not ( = ?auto_378387 ?auto_378389 ) ) ( not ( = ?auto_378387 ?auto_378391 ) ) ( not ( = ?auto_378387 ?auto_378390 ) ) ( not ( = ?auto_378387 ?auto_378392 ) ) ( not ( = ?auto_378387 ?auto_378393 ) ) ( not ( = ?auto_378387 ?auto_378399 ) ) ( not ( = ?auto_378388 ?auto_378389 ) ) ( not ( = ?auto_378388 ?auto_378391 ) ) ( not ( = ?auto_378388 ?auto_378390 ) ) ( not ( = ?auto_378388 ?auto_378392 ) ) ( not ( = ?auto_378388 ?auto_378393 ) ) ( not ( = ?auto_378388 ?auto_378399 ) ) ( not ( = ?auto_378389 ?auto_378391 ) ) ( not ( = ?auto_378389 ?auto_378390 ) ) ( not ( = ?auto_378389 ?auto_378392 ) ) ( not ( = ?auto_378389 ?auto_378393 ) ) ( not ( = ?auto_378389 ?auto_378399 ) ) ( not ( = ?auto_378391 ?auto_378390 ) ) ( not ( = ?auto_378391 ?auto_378392 ) ) ( not ( = ?auto_378391 ?auto_378393 ) ) ( not ( = ?auto_378391 ?auto_378399 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_378390 ?auto_378392 ?auto_378393 )
      ( MAKE-6CRATE-VERIFY ?auto_378387 ?auto_378388 ?auto_378389 ?auto_378391 ?auto_378390 ?auto_378392 ?auto_378393 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_378451 - SURFACE
      ?auto_378452 - SURFACE
      ?auto_378453 - SURFACE
      ?auto_378455 - SURFACE
      ?auto_378454 - SURFACE
      ?auto_378456 - SURFACE
      ?auto_378457 - SURFACE
    )
    :vars
    (
      ?auto_378459 - HOIST
      ?auto_378462 - PLACE
      ?auto_378461 - PLACE
      ?auto_378458 - HOIST
      ?auto_378463 - SURFACE
      ?auto_378460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_378459 ?auto_378462 ) ( SURFACE-AT ?auto_378456 ?auto_378462 ) ( CLEAR ?auto_378456 ) ( IS-CRATE ?auto_378457 ) ( not ( = ?auto_378456 ?auto_378457 ) ) ( AVAILABLE ?auto_378459 ) ( ON ?auto_378456 ?auto_378454 ) ( not ( = ?auto_378454 ?auto_378456 ) ) ( not ( = ?auto_378454 ?auto_378457 ) ) ( not ( = ?auto_378461 ?auto_378462 ) ) ( HOIST-AT ?auto_378458 ?auto_378461 ) ( not ( = ?auto_378459 ?auto_378458 ) ) ( AVAILABLE ?auto_378458 ) ( SURFACE-AT ?auto_378457 ?auto_378461 ) ( ON ?auto_378457 ?auto_378463 ) ( CLEAR ?auto_378457 ) ( not ( = ?auto_378456 ?auto_378463 ) ) ( not ( = ?auto_378457 ?auto_378463 ) ) ( not ( = ?auto_378454 ?auto_378463 ) ) ( TRUCK-AT ?auto_378460 ?auto_378462 ) ( ON ?auto_378452 ?auto_378451 ) ( ON ?auto_378453 ?auto_378452 ) ( ON ?auto_378455 ?auto_378453 ) ( ON ?auto_378454 ?auto_378455 ) ( not ( = ?auto_378451 ?auto_378452 ) ) ( not ( = ?auto_378451 ?auto_378453 ) ) ( not ( = ?auto_378451 ?auto_378455 ) ) ( not ( = ?auto_378451 ?auto_378454 ) ) ( not ( = ?auto_378451 ?auto_378456 ) ) ( not ( = ?auto_378451 ?auto_378457 ) ) ( not ( = ?auto_378451 ?auto_378463 ) ) ( not ( = ?auto_378452 ?auto_378453 ) ) ( not ( = ?auto_378452 ?auto_378455 ) ) ( not ( = ?auto_378452 ?auto_378454 ) ) ( not ( = ?auto_378452 ?auto_378456 ) ) ( not ( = ?auto_378452 ?auto_378457 ) ) ( not ( = ?auto_378452 ?auto_378463 ) ) ( not ( = ?auto_378453 ?auto_378455 ) ) ( not ( = ?auto_378453 ?auto_378454 ) ) ( not ( = ?auto_378453 ?auto_378456 ) ) ( not ( = ?auto_378453 ?auto_378457 ) ) ( not ( = ?auto_378453 ?auto_378463 ) ) ( not ( = ?auto_378455 ?auto_378454 ) ) ( not ( = ?auto_378455 ?auto_378456 ) ) ( not ( = ?auto_378455 ?auto_378457 ) ) ( not ( = ?auto_378455 ?auto_378463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_378454 ?auto_378456 ?auto_378457 )
      ( MAKE-6CRATE-VERIFY ?auto_378451 ?auto_378452 ?auto_378453 ?auto_378455 ?auto_378454 ?auto_378456 ?auto_378457 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_378515 - SURFACE
      ?auto_378516 - SURFACE
      ?auto_378517 - SURFACE
      ?auto_378519 - SURFACE
      ?auto_378518 - SURFACE
      ?auto_378520 - SURFACE
      ?auto_378521 - SURFACE
    )
    :vars
    (
      ?auto_378527 - HOIST
      ?auto_378523 - PLACE
      ?auto_378522 - PLACE
      ?auto_378524 - HOIST
      ?auto_378526 - SURFACE
      ?auto_378525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_378527 ?auto_378523 ) ( IS-CRATE ?auto_378521 ) ( not ( = ?auto_378520 ?auto_378521 ) ) ( not ( = ?auto_378518 ?auto_378520 ) ) ( not ( = ?auto_378518 ?auto_378521 ) ) ( not ( = ?auto_378522 ?auto_378523 ) ) ( HOIST-AT ?auto_378524 ?auto_378522 ) ( not ( = ?auto_378527 ?auto_378524 ) ) ( AVAILABLE ?auto_378524 ) ( SURFACE-AT ?auto_378521 ?auto_378522 ) ( ON ?auto_378521 ?auto_378526 ) ( CLEAR ?auto_378521 ) ( not ( = ?auto_378520 ?auto_378526 ) ) ( not ( = ?auto_378521 ?auto_378526 ) ) ( not ( = ?auto_378518 ?auto_378526 ) ) ( TRUCK-AT ?auto_378525 ?auto_378523 ) ( SURFACE-AT ?auto_378518 ?auto_378523 ) ( CLEAR ?auto_378518 ) ( LIFTING ?auto_378527 ?auto_378520 ) ( IS-CRATE ?auto_378520 ) ( ON ?auto_378516 ?auto_378515 ) ( ON ?auto_378517 ?auto_378516 ) ( ON ?auto_378519 ?auto_378517 ) ( ON ?auto_378518 ?auto_378519 ) ( not ( = ?auto_378515 ?auto_378516 ) ) ( not ( = ?auto_378515 ?auto_378517 ) ) ( not ( = ?auto_378515 ?auto_378519 ) ) ( not ( = ?auto_378515 ?auto_378518 ) ) ( not ( = ?auto_378515 ?auto_378520 ) ) ( not ( = ?auto_378515 ?auto_378521 ) ) ( not ( = ?auto_378515 ?auto_378526 ) ) ( not ( = ?auto_378516 ?auto_378517 ) ) ( not ( = ?auto_378516 ?auto_378519 ) ) ( not ( = ?auto_378516 ?auto_378518 ) ) ( not ( = ?auto_378516 ?auto_378520 ) ) ( not ( = ?auto_378516 ?auto_378521 ) ) ( not ( = ?auto_378516 ?auto_378526 ) ) ( not ( = ?auto_378517 ?auto_378519 ) ) ( not ( = ?auto_378517 ?auto_378518 ) ) ( not ( = ?auto_378517 ?auto_378520 ) ) ( not ( = ?auto_378517 ?auto_378521 ) ) ( not ( = ?auto_378517 ?auto_378526 ) ) ( not ( = ?auto_378519 ?auto_378518 ) ) ( not ( = ?auto_378519 ?auto_378520 ) ) ( not ( = ?auto_378519 ?auto_378521 ) ) ( not ( = ?auto_378519 ?auto_378526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_378518 ?auto_378520 ?auto_378521 )
      ( MAKE-6CRATE-VERIFY ?auto_378515 ?auto_378516 ?auto_378517 ?auto_378519 ?auto_378518 ?auto_378520 ?auto_378521 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_378579 - SURFACE
      ?auto_378580 - SURFACE
      ?auto_378581 - SURFACE
      ?auto_378583 - SURFACE
      ?auto_378582 - SURFACE
      ?auto_378584 - SURFACE
      ?auto_378585 - SURFACE
    )
    :vars
    (
      ?auto_378590 - HOIST
      ?auto_378591 - PLACE
      ?auto_378588 - PLACE
      ?auto_378587 - HOIST
      ?auto_378586 - SURFACE
      ?auto_378589 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_378590 ?auto_378591 ) ( IS-CRATE ?auto_378585 ) ( not ( = ?auto_378584 ?auto_378585 ) ) ( not ( = ?auto_378582 ?auto_378584 ) ) ( not ( = ?auto_378582 ?auto_378585 ) ) ( not ( = ?auto_378588 ?auto_378591 ) ) ( HOIST-AT ?auto_378587 ?auto_378588 ) ( not ( = ?auto_378590 ?auto_378587 ) ) ( AVAILABLE ?auto_378587 ) ( SURFACE-AT ?auto_378585 ?auto_378588 ) ( ON ?auto_378585 ?auto_378586 ) ( CLEAR ?auto_378585 ) ( not ( = ?auto_378584 ?auto_378586 ) ) ( not ( = ?auto_378585 ?auto_378586 ) ) ( not ( = ?auto_378582 ?auto_378586 ) ) ( TRUCK-AT ?auto_378589 ?auto_378591 ) ( SURFACE-AT ?auto_378582 ?auto_378591 ) ( CLEAR ?auto_378582 ) ( IS-CRATE ?auto_378584 ) ( AVAILABLE ?auto_378590 ) ( IN ?auto_378584 ?auto_378589 ) ( ON ?auto_378580 ?auto_378579 ) ( ON ?auto_378581 ?auto_378580 ) ( ON ?auto_378583 ?auto_378581 ) ( ON ?auto_378582 ?auto_378583 ) ( not ( = ?auto_378579 ?auto_378580 ) ) ( not ( = ?auto_378579 ?auto_378581 ) ) ( not ( = ?auto_378579 ?auto_378583 ) ) ( not ( = ?auto_378579 ?auto_378582 ) ) ( not ( = ?auto_378579 ?auto_378584 ) ) ( not ( = ?auto_378579 ?auto_378585 ) ) ( not ( = ?auto_378579 ?auto_378586 ) ) ( not ( = ?auto_378580 ?auto_378581 ) ) ( not ( = ?auto_378580 ?auto_378583 ) ) ( not ( = ?auto_378580 ?auto_378582 ) ) ( not ( = ?auto_378580 ?auto_378584 ) ) ( not ( = ?auto_378580 ?auto_378585 ) ) ( not ( = ?auto_378580 ?auto_378586 ) ) ( not ( = ?auto_378581 ?auto_378583 ) ) ( not ( = ?auto_378581 ?auto_378582 ) ) ( not ( = ?auto_378581 ?auto_378584 ) ) ( not ( = ?auto_378581 ?auto_378585 ) ) ( not ( = ?auto_378581 ?auto_378586 ) ) ( not ( = ?auto_378583 ?auto_378582 ) ) ( not ( = ?auto_378583 ?auto_378584 ) ) ( not ( = ?auto_378583 ?auto_378585 ) ) ( not ( = ?auto_378583 ?auto_378586 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_378582 ?auto_378584 ?auto_378585 )
      ( MAKE-6CRATE-VERIFY ?auto_378579 ?auto_378580 ?auto_378581 ?auto_378583 ?auto_378582 ?auto_378584 ?auto_378585 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_380535 - SURFACE
      ?auto_380536 - SURFACE
      ?auto_380537 - SURFACE
      ?auto_380539 - SURFACE
      ?auto_380538 - SURFACE
      ?auto_380540 - SURFACE
      ?auto_380541 - SURFACE
      ?auto_380542 - SURFACE
    )
    :vars
    (
      ?auto_380544 - HOIST
      ?auto_380543 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_380544 ?auto_380543 ) ( SURFACE-AT ?auto_380541 ?auto_380543 ) ( CLEAR ?auto_380541 ) ( LIFTING ?auto_380544 ?auto_380542 ) ( IS-CRATE ?auto_380542 ) ( not ( = ?auto_380541 ?auto_380542 ) ) ( ON ?auto_380536 ?auto_380535 ) ( ON ?auto_380537 ?auto_380536 ) ( ON ?auto_380539 ?auto_380537 ) ( ON ?auto_380538 ?auto_380539 ) ( ON ?auto_380540 ?auto_380538 ) ( ON ?auto_380541 ?auto_380540 ) ( not ( = ?auto_380535 ?auto_380536 ) ) ( not ( = ?auto_380535 ?auto_380537 ) ) ( not ( = ?auto_380535 ?auto_380539 ) ) ( not ( = ?auto_380535 ?auto_380538 ) ) ( not ( = ?auto_380535 ?auto_380540 ) ) ( not ( = ?auto_380535 ?auto_380541 ) ) ( not ( = ?auto_380535 ?auto_380542 ) ) ( not ( = ?auto_380536 ?auto_380537 ) ) ( not ( = ?auto_380536 ?auto_380539 ) ) ( not ( = ?auto_380536 ?auto_380538 ) ) ( not ( = ?auto_380536 ?auto_380540 ) ) ( not ( = ?auto_380536 ?auto_380541 ) ) ( not ( = ?auto_380536 ?auto_380542 ) ) ( not ( = ?auto_380537 ?auto_380539 ) ) ( not ( = ?auto_380537 ?auto_380538 ) ) ( not ( = ?auto_380537 ?auto_380540 ) ) ( not ( = ?auto_380537 ?auto_380541 ) ) ( not ( = ?auto_380537 ?auto_380542 ) ) ( not ( = ?auto_380539 ?auto_380538 ) ) ( not ( = ?auto_380539 ?auto_380540 ) ) ( not ( = ?auto_380539 ?auto_380541 ) ) ( not ( = ?auto_380539 ?auto_380542 ) ) ( not ( = ?auto_380538 ?auto_380540 ) ) ( not ( = ?auto_380538 ?auto_380541 ) ) ( not ( = ?auto_380538 ?auto_380542 ) ) ( not ( = ?auto_380540 ?auto_380541 ) ) ( not ( = ?auto_380540 ?auto_380542 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_380541 ?auto_380542 )
      ( MAKE-7CRATE-VERIFY ?auto_380535 ?auto_380536 ?auto_380537 ?auto_380539 ?auto_380538 ?auto_380540 ?auto_380541 ?auto_380542 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_380590 - SURFACE
      ?auto_380591 - SURFACE
      ?auto_380592 - SURFACE
      ?auto_380594 - SURFACE
      ?auto_380593 - SURFACE
      ?auto_380595 - SURFACE
      ?auto_380596 - SURFACE
      ?auto_380597 - SURFACE
    )
    :vars
    (
      ?auto_380599 - HOIST
      ?auto_380600 - PLACE
      ?auto_380598 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_380599 ?auto_380600 ) ( SURFACE-AT ?auto_380596 ?auto_380600 ) ( CLEAR ?auto_380596 ) ( IS-CRATE ?auto_380597 ) ( not ( = ?auto_380596 ?auto_380597 ) ) ( TRUCK-AT ?auto_380598 ?auto_380600 ) ( AVAILABLE ?auto_380599 ) ( IN ?auto_380597 ?auto_380598 ) ( ON ?auto_380596 ?auto_380595 ) ( not ( = ?auto_380595 ?auto_380596 ) ) ( not ( = ?auto_380595 ?auto_380597 ) ) ( ON ?auto_380591 ?auto_380590 ) ( ON ?auto_380592 ?auto_380591 ) ( ON ?auto_380594 ?auto_380592 ) ( ON ?auto_380593 ?auto_380594 ) ( ON ?auto_380595 ?auto_380593 ) ( not ( = ?auto_380590 ?auto_380591 ) ) ( not ( = ?auto_380590 ?auto_380592 ) ) ( not ( = ?auto_380590 ?auto_380594 ) ) ( not ( = ?auto_380590 ?auto_380593 ) ) ( not ( = ?auto_380590 ?auto_380595 ) ) ( not ( = ?auto_380590 ?auto_380596 ) ) ( not ( = ?auto_380590 ?auto_380597 ) ) ( not ( = ?auto_380591 ?auto_380592 ) ) ( not ( = ?auto_380591 ?auto_380594 ) ) ( not ( = ?auto_380591 ?auto_380593 ) ) ( not ( = ?auto_380591 ?auto_380595 ) ) ( not ( = ?auto_380591 ?auto_380596 ) ) ( not ( = ?auto_380591 ?auto_380597 ) ) ( not ( = ?auto_380592 ?auto_380594 ) ) ( not ( = ?auto_380592 ?auto_380593 ) ) ( not ( = ?auto_380592 ?auto_380595 ) ) ( not ( = ?auto_380592 ?auto_380596 ) ) ( not ( = ?auto_380592 ?auto_380597 ) ) ( not ( = ?auto_380594 ?auto_380593 ) ) ( not ( = ?auto_380594 ?auto_380595 ) ) ( not ( = ?auto_380594 ?auto_380596 ) ) ( not ( = ?auto_380594 ?auto_380597 ) ) ( not ( = ?auto_380593 ?auto_380595 ) ) ( not ( = ?auto_380593 ?auto_380596 ) ) ( not ( = ?auto_380593 ?auto_380597 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_380595 ?auto_380596 ?auto_380597 )
      ( MAKE-7CRATE-VERIFY ?auto_380590 ?auto_380591 ?auto_380592 ?auto_380594 ?auto_380593 ?auto_380595 ?auto_380596 ?auto_380597 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_380653 - SURFACE
      ?auto_380654 - SURFACE
      ?auto_380655 - SURFACE
      ?auto_380657 - SURFACE
      ?auto_380656 - SURFACE
      ?auto_380658 - SURFACE
      ?auto_380659 - SURFACE
      ?auto_380660 - SURFACE
    )
    :vars
    (
      ?auto_380662 - HOIST
      ?auto_380661 - PLACE
      ?auto_380664 - TRUCK
      ?auto_380663 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_380662 ?auto_380661 ) ( SURFACE-AT ?auto_380659 ?auto_380661 ) ( CLEAR ?auto_380659 ) ( IS-CRATE ?auto_380660 ) ( not ( = ?auto_380659 ?auto_380660 ) ) ( AVAILABLE ?auto_380662 ) ( IN ?auto_380660 ?auto_380664 ) ( ON ?auto_380659 ?auto_380658 ) ( not ( = ?auto_380658 ?auto_380659 ) ) ( not ( = ?auto_380658 ?auto_380660 ) ) ( TRUCK-AT ?auto_380664 ?auto_380663 ) ( not ( = ?auto_380663 ?auto_380661 ) ) ( ON ?auto_380654 ?auto_380653 ) ( ON ?auto_380655 ?auto_380654 ) ( ON ?auto_380657 ?auto_380655 ) ( ON ?auto_380656 ?auto_380657 ) ( ON ?auto_380658 ?auto_380656 ) ( not ( = ?auto_380653 ?auto_380654 ) ) ( not ( = ?auto_380653 ?auto_380655 ) ) ( not ( = ?auto_380653 ?auto_380657 ) ) ( not ( = ?auto_380653 ?auto_380656 ) ) ( not ( = ?auto_380653 ?auto_380658 ) ) ( not ( = ?auto_380653 ?auto_380659 ) ) ( not ( = ?auto_380653 ?auto_380660 ) ) ( not ( = ?auto_380654 ?auto_380655 ) ) ( not ( = ?auto_380654 ?auto_380657 ) ) ( not ( = ?auto_380654 ?auto_380656 ) ) ( not ( = ?auto_380654 ?auto_380658 ) ) ( not ( = ?auto_380654 ?auto_380659 ) ) ( not ( = ?auto_380654 ?auto_380660 ) ) ( not ( = ?auto_380655 ?auto_380657 ) ) ( not ( = ?auto_380655 ?auto_380656 ) ) ( not ( = ?auto_380655 ?auto_380658 ) ) ( not ( = ?auto_380655 ?auto_380659 ) ) ( not ( = ?auto_380655 ?auto_380660 ) ) ( not ( = ?auto_380657 ?auto_380656 ) ) ( not ( = ?auto_380657 ?auto_380658 ) ) ( not ( = ?auto_380657 ?auto_380659 ) ) ( not ( = ?auto_380657 ?auto_380660 ) ) ( not ( = ?auto_380656 ?auto_380658 ) ) ( not ( = ?auto_380656 ?auto_380659 ) ) ( not ( = ?auto_380656 ?auto_380660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_380658 ?auto_380659 ?auto_380660 )
      ( MAKE-7CRATE-VERIFY ?auto_380653 ?auto_380654 ?auto_380655 ?auto_380657 ?auto_380656 ?auto_380658 ?auto_380659 ?auto_380660 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_380723 - SURFACE
      ?auto_380724 - SURFACE
      ?auto_380725 - SURFACE
      ?auto_380727 - SURFACE
      ?auto_380726 - SURFACE
      ?auto_380728 - SURFACE
      ?auto_380729 - SURFACE
      ?auto_380730 - SURFACE
    )
    :vars
    (
      ?auto_380735 - HOIST
      ?auto_380732 - PLACE
      ?auto_380731 - TRUCK
      ?auto_380734 - PLACE
      ?auto_380733 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_380735 ?auto_380732 ) ( SURFACE-AT ?auto_380729 ?auto_380732 ) ( CLEAR ?auto_380729 ) ( IS-CRATE ?auto_380730 ) ( not ( = ?auto_380729 ?auto_380730 ) ) ( AVAILABLE ?auto_380735 ) ( ON ?auto_380729 ?auto_380728 ) ( not ( = ?auto_380728 ?auto_380729 ) ) ( not ( = ?auto_380728 ?auto_380730 ) ) ( TRUCK-AT ?auto_380731 ?auto_380734 ) ( not ( = ?auto_380734 ?auto_380732 ) ) ( HOIST-AT ?auto_380733 ?auto_380734 ) ( LIFTING ?auto_380733 ?auto_380730 ) ( not ( = ?auto_380735 ?auto_380733 ) ) ( ON ?auto_380724 ?auto_380723 ) ( ON ?auto_380725 ?auto_380724 ) ( ON ?auto_380727 ?auto_380725 ) ( ON ?auto_380726 ?auto_380727 ) ( ON ?auto_380728 ?auto_380726 ) ( not ( = ?auto_380723 ?auto_380724 ) ) ( not ( = ?auto_380723 ?auto_380725 ) ) ( not ( = ?auto_380723 ?auto_380727 ) ) ( not ( = ?auto_380723 ?auto_380726 ) ) ( not ( = ?auto_380723 ?auto_380728 ) ) ( not ( = ?auto_380723 ?auto_380729 ) ) ( not ( = ?auto_380723 ?auto_380730 ) ) ( not ( = ?auto_380724 ?auto_380725 ) ) ( not ( = ?auto_380724 ?auto_380727 ) ) ( not ( = ?auto_380724 ?auto_380726 ) ) ( not ( = ?auto_380724 ?auto_380728 ) ) ( not ( = ?auto_380724 ?auto_380729 ) ) ( not ( = ?auto_380724 ?auto_380730 ) ) ( not ( = ?auto_380725 ?auto_380727 ) ) ( not ( = ?auto_380725 ?auto_380726 ) ) ( not ( = ?auto_380725 ?auto_380728 ) ) ( not ( = ?auto_380725 ?auto_380729 ) ) ( not ( = ?auto_380725 ?auto_380730 ) ) ( not ( = ?auto_380727 ?auto_380726 ) ) ( not ( = ?auto_380727 ?auto_380728 ) ) ( not ( = ?auto_380727 ?auto_380729 ) ) ( not ( = ?auto_380727 ?auto_380730 ) ) ( not ( = ?auto_380726 ?auto_380728 ) ) ( not ( = ?auto_380726 ?auto_380729 ) ) ( not ( = ?auto_380726 ?auto_380730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_380728 ?auto_380729 ?auto_380730 )
      ( MAKE-7CRATE-VERIFY ?auto_380723 ?auto_380724 ?auto_380725 ?auto_380727 ?auto_380726 ?auto_380728 ?auto_380729 ?auto_380730 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_380800 - SURFACE
      ?auto_380801 - SURFACE
      ?auto_380802 - SURFACE
      ?auto_380804 - SURFACE
      ?auto_380803 - SURFACE
      ?auto_380805 - SURFACE
      ?auto_380806 - SURFACE
      ?auto_380807 - SURFACE
    )
    :vars
    (
      ?auto_380810 - HOIST
      ?auto_380812 - PLACE
      ?auto_380813 - TRUCK
      ?auto_380808 - PLACE
      ?auto_380809 - HOIST
      ?auto_380811 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_380810 ?auto_380812 ) ( SURFACE-AT ?auto_380806 ?auto_380812 ) ( CLEAR ?auto_380806 ) ( IS-CRATE ?auto_380807 ) ( not ( = ?auto_380806 ?auto_380807 ) ) ( AVAILABLE ?auto_380810 ) ( ON ?auto_380806 ?auto_380805 ) ( not ( = ?auto_380805 ?auto_380806 ) ) ( not ( = ?auto_380805 ?auto_380807 ) ) ( TRUCK-AT ?auto_380813 ?auto_380808 ) ( not ( = ?auto_380808 ?auto_380812 ) ) ( HOIST-AT ?auto_380809 ?auto_380808 ) ( not ( = ?auto_380810 ?auto_380809 ) ) ( AVAILABLE ?auto_380809 ) ( SURFACE-AT ?auto_380807 ?auto_380808 ) ( ON ?auto_380807 ?auto_380811 ) ( CLEAR ?auto_380807 ) ( not ( = ?auto_380806 ?auto_380811 ) ) ( not ( = ?auto_380807 ?auto_380811 ) ) ( not ( = ?auto_380805 ?auto_380811 ) ) ( ON ?auto_380801 ?auto_380800 ) ( ON ?auto_380802 ?auto_380801 ) ( ON ?auto_380804 ?auto_380802 ) ( ON ?auto_380803 ?auto_380804 ) ( ON ?auto_380805 ?auto_380803 ) ( not ( = ?auto_380800 ?auto_380801 ) ) ( not ( = ?auto_380800 ?auto_380802 ) ) ( not ( = ?auto_380800 ?auto_380804 ) ) ( not ( = ?auto_380800 ?auto_380803 ) ) ( not ( = ?auto_380800 ?auto_380805 ) ) ( not ( = ?auto_380800 ?auto_380806 ) ) ( not ( = ?auto_380800 ?auto_380807 ) ) ( not ( = ?auto_380800 ?auto_380811 ) ) ( not ( = ?auto_380801 ?auto_380802 ) ) ( not ( = ?auto_380801 ?auto_380804 ) ) ( not ( = ?auto_380801 ?auto_380803 ) ) ( not ( = ?auto_380801 ?auto_380805 ) ) ( not ( = ?auto_380801 ?auto_380806 ) ) ( not ( = ?auto_380801 ?auto_380807 ) ) ( not ( = ?auto_380801 ?auto_380811 ) ) ( not ( = ?auto_380802 ?auto_380804 ) ) ( not ( = ?auto_380802 ?auto_380803 ) ) ( not ( = ?auto_380802 ?auto_380805 ) ) ( not ( = ?auto_380802 ?auto_380806 ) ) ( not ( = ?auto_380802 ?auto_380807 ) ) ( not ( = ?auto_380802 ?auto_380811 ) ) ( not ( = ?auto_380804 ?auto_380803 ) ) ( not ( = ?auto_380804 ?auto_380805 ) ) ( not ( = ?auto_380804 ?auto_380806 ) ) ( not ( = ?auto_380804 ?auto_380807 ) ) ( not ( = ?auto_380804 ?auto_380811 ) ) ( not ( = ?auto_380803 ?auto_380805 ) ) ( not ( = ?auto_380803 ?auto_380806 ) ) ( not ( = ?auto_380803 ?auto_380807 ) ) ( not ( = ?auto_380803 ?auto_380811 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_380805 ?auto_380806 ?auto_380807 )
      ( MAKE-7CRATE-VERIFY ?auto_380800 ?auto_380801 ?auto_380802 ?auto_380804 ?auto_380803 ?auto_380805 ?auto_380806 ?auto_380807 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_380878 - SURFACE
      ?auto_380879 - SURFACE
      ?auto_380880 - SURFACE
      ?auto_380882 - SURFACE
      ?auto_380881 - SURFACE
      ?auto_380883 - SURFACE
      ?auto_380884 - SURFACE
      ?auto_380885 - SURFACE
    )
    :vars
    (
      ?auto_380891 - HOIST
      ?auto_380888 - PLACE
      ?auto_380890 - PLACE
      ?auto_380889 - HOIST
      ?auto_380886 - SURFACE
      ?auto_380887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_380891 ?auto_380888 ) ( SURFACE-AT ?auto_380884 ?auto_380888 ) ( CLEAR ?auto_380884 ) ( IS-CRATE ?auto_380885 ) ( not ( = ?auto_380884 ?auto_380885 ) ) ( AVAILABLE ?auto_380891 ) ( ON ?auto_380884 ?auto_380883 ) ( not ( = ?auto_380883 ?auto_380884 ) ) ( not ( = ?auto_380883 ?auto_380885 ) ) ( not ( = ?auto_380890 ?auto_380888 ) ) ( HOIST-AT ?auto_380889 ?auto_380890 ) ( not ( = ?auto_380891 ?auto_380889 ) ) ( AVAILABLE ?auto_380889 ) ( SURFACE-AT ?auto_380885 ?auto_380890 ) ( ON ?auto_380885 ?auto_380886 ) ( CLEAR ?auto_380885 ) ( not ( = ?auto_380884 ?auto_380886 ) ) ( not ( = ?auto_380885 ?auto_380886 ) ) ( not ( = ?auto_380883 ?auto_380886 ) ) ( TRUCK-AT ?auto_380887 ?auto_380888 ) ( ON ?auto_380879 ?auto_380878 ) ( ON ?auto_380880 ?auto_380879 ) ( ON ?auto_380882 ?auto_380880 ) ( ON ?auto_380881 ?auto_380882 ) ( ON ?auto_380883 ?auto_380881 ) ( not ( = ?auto_380878 ?auto_380879 ) ) ( not ( = ?auto_380878 ?auto_380880 ) ) ( not ( = ?auto_380878 ?auto_380882 ) ) ( not ( = ?auto_380878 ?auto_380881 ) ) ( not ( = ?auto_380878 ?auto_380883 ) ) ( not ( = ?auto_380878 ?auto_380884 ) ) ( not ( = ?auto_380878 ?auto_380885 ) ) ( not ( = ?auto_380878 ?auto_380886 ) ) ( not ( = ?auto_380879 ?auto_380880 ) ) ( not ( = ?auto_380879 ?auto_380882 ) ) ( not ( = ?auto_380879 ?auto_380881 ) ) ( not ( = ?auto_380879 ?auto_380883 ) ) ( not ( = ?auto_380879 ?auto_380884 ) ) ( not ( = ?auto_380879 ?auto_380885 ) ) ( not ( = ?auto_380879 ?auto_380886 ) ) ( not ( = ?auto_380880 ?auto_380882 ) ) ( not ( = ?auto_380880 ?auto_380881 ) ) ( not ( = ?auto_380880 ?auto_380883 ) ) ( not ( = ?auto_380880 ?auto_380884 ) ) ( not ( = ?auto_380880 ?auto_380885 ) ) ( not ( = ?auto_380880 ?auto_380886 ) ) ( not ( = ?auto_380882 ?auto_380881 ) ) ( not ( = ?auto_380882 ?auto_380883 ) ) ( not ( = ?auto_380882 ?auto_380884 ) ) ( not ( = ?auto_380882 ?auto_380885 ) ) ( not ( = ?auto_380882 ?auto_380886 ) ) ( not ( = ?auto_380881 ?auto_380883 ) ) ( not ( = ?auto_380881 ?auto_380884 ) ) ( not ( = ?auto_380881 ?auto_380885 ) ) ( not ( = ?auto_380881 ?auto_380886 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_380883 ?auto_380884 ?auto_380885 )
      ( MAKE-7CRATE-VERIFY ?auto_380878 ?auto_380879 ?auto_380880 ?auto_380882 ?auto_380881 ?auto_380883 ?auto_380884 ?auto_380885 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_380956 - SURFACE
      ?auto_380957 - SURFACE
      ?auto_380958 - SURFACE
      ?auto_380960 - SURFACE
      ?auto_380959 - SURFACE
      ?auto_380961 - SURFACE
      ?auto_380962 - SURFACE
      ?auto_380963 - SURFACE
    )
    :vars
    (
      ?auto_380968 - HOIST
      ?auto_380969 - PLACE
      ?auto_380966 - PLACE
      ?auto_380964 - HOIST
      ?auto_380967 - SURFACE
      ?auto_380965 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_380968 ?auto_380969 ) ( IS-CRATE ?auto_380963 ) ( not ( = ?auto_380962 ?auto_380963 ) ) ( not ( = ?auto_380961 ?auto_380962 ) ) ( not ( = ?auto_380961 ?auto_380963 ) ) ( not ( = ?auto_380966 ?auto_380969 ) ) ( HOIST-AT ?auto_380964 ?auto_380966 ) ( not ( = ?auto_380968 ?auto_380964 ) ) ( AVAILABLE ?auto_380964 ) ( SURFACE-AT ?auto_380963 ?auto_380966 ) ( ON ?auto_380963 ?auto_380967 ) ( CLEAR ?auto_380963 ) ( not ( = ?auto_380962 ?auto_380967 ) ) ( not ( = ?auto_380963 ?auto_380967 ) ) ( not ( = ?auto_380961 ?auto_380967 ) ) ( TRUCK-AT ?auto_380965 ?auto_380969 ) ( SURFACE-AT ?auto_380961 ?auto_380969 ) ( CLEAR ?auto_380961 ) ( LIFTING ?auto_380968 ?auto_380962 ) ( IS-CRATE ?auto_380962 ) ( ON ?auto_380957 ?auto_380956 ) ( ON ?auto_380958 ?auto_380957 ) ( ON ?auto_380960 ?auto_380958 ) ( ON ?auto_380959 ?auto_380960 ) ( ON ?auto_380961 ?auto_380959 ) ( not ( = ?auto_380956 ?auto_380957 ) ) ( not ( = ?auto_380956 ?auto_380958 ) ) ( not ( = ?auto_380956 ?auto_380960 ) ) ( not ( = ?auto_380956 ?auto_380959 ) ) ( not ( = ?auto_380956 ?auto_380961 ) ) ( not ( = ?auto_380956 ?auto_380962 ) ) ( not ( = ?auto_380956 ?auto_380963 ) ) ( not ( = ?auto_380956 ?auto_380967 ) ) ( not ( = ?auto_380957 ?auto_380958 ) ) ( not ( = ?auto_380957 ?auto_380960 ) ) ( not ( = ?auto_380957 ?auto_380959 ) ) ( not ( = ?auto_380957 ?auto_380961 ) ) ( not ( = ?auto_380957 ?auto_380962 ) ) ( not ( = ?auto_380957 ?auto_380963 ) ) ( not ( = ?auto_380957 ?auto_380967 ) ) ( not ( = ?auto_380958 ?auto_380960 ) ) ( not ( = ?auto_380958 ?auto_380959 ) ) ( not ( = ?auto_380958 ?auto_380961 ) ) ( not ( = ?auto_380958 ?auto_380962 ) ) ( not ( = ?auto_380958 ?auto_380963 ) ) ( not ( = ?auto_380958 ?auto_380967 ) ) ( not ( = ?auto_380960 ?auto_380959 ) ) ( not ( = ?auto_380960 ?auto_380961 ) ) ( not ( = ?auto_380960 ?auto_380962 ) ) ( not ( = ?auto_380960 ?auto_380963 ) ) ( not ( = ?auto_380960 ?auto_380967 ) ) ( not ( = ?auto_380959 ?auto_380961 ) ) ( not ( = ?auto_380959 ?auto_380962 ) ) ( not ( = ?auto_380959 ?auto_380963 ) ) ( not ( = ?auto_380959 ?auto_380967 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_380961 ?auto_380962 ?auto_380963 )
      ( MAKE-7CRATE-VERIFY ?auto_380956 ?auto_380957 ?auto_380958 ?auto_380960 ?auto_380959 ?auto_380961 ?auto_380962 ?auto_380963 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_381034 - SURFACE
      ?auto_381035 - SURFACE
      ?auto_381036 - SURFACE
      ?auto_381038 - SURFACE
      ?auto_381037 - SURFACE
      ?auto_381039 - SURFACE
      ?auto_381040 - SURFACE
      ?auto_381041 - SURFACE
    )
    :vars
    (
      ?auto_381043 - HOIST
      ?auto_381046 - PLACE
      ?auto_381047 - PLACE
      ?auto_381044 - HOIST
      ?auto_381042 - SURFACE
      ?auto_381045 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_381043 ?auto_381046 ) ( IS-CRATE ?auto_381041 ) ( not ( = ?auto_381040 ?auto_381041 ) ) ( not ( = ?auto_381039 ?auto_381040 ) ) ( not ( = ?auto_381039 ?auto_381041 ) ) ( not ( = ?auto_381047 ?auto_381046 ) ) ( HOIST-AT ?auto_381044 ?auto_381047 ) ( not ( = ?auto_381043 ?auto_381044 ) ) ( AVAILABLE ?auto_381044 ) ( SURFACE-AT ?auto_381041 ?auto_381047 ) ( ON ?auto_381041 ?auto_381042 ) ( CLEAR ?auto_381041 ) ( not ( = ?auto_381040 ?auto_381042 ) ) ( not ( = ?auto_381041 ?auto_381042 ) ) ( not ( = ?auto_381039 ?auto_381042 ) ) ( TRUCK-AT ?auto_381045 ?auto_381046 ) ( SURFACE-AT ?auto_381039 ?auto_381046 ) ( CLEAR ?auto_381039 ) ( IS-CRATE ?auto_381040 ) ( AVAILABLE ?auto_381043 ) ( IN ?auto_381040 ?auto_381045 ) ( ON ?auto_381035 ?auto_381034 ) ( ON ?auto_381036 ?auto_381035 ) ( ON ?auto_381038 ?auto_381036 ) ( ON ?auto_381037 ?auto_381038 ) ( ON ?auto_381039 ?auto_381037 ) ( not ( = ?auto_381034 ?auto_381035 ) ) ( not ( = ?auto_381034 ?auto_381036 ) ) ( not ( = ?auto_381034 ?auto_381038 ) ) ( not ( = ?auto_381034 ?auto_381037 ) ) ( not ( = ?auto_381034 ?auto_381039 ) ) ( not ( = ?auto_381034 ?auto_381040 ) ) ( not ( = ?auto_381034 ?auto_381041 ) ) ( not ( = ?auto_381034 ?auto_381042 ) ) ( not ( = ?auto_381035 ?auto_381036 ) ) ( not ( = ?auto_381035 ?auto_381038 ) ) ( not ( = ?auto_381035 ?auto_381037 ) ) ( not ( = ?auto_381035 ?auto_381039 ) ) ( not ( = ?auto_381035 ?auto_381040 ) ) ( not ( = ?auto_381035 ?auto_381041 ) ) ( not ( = ?auto_381035 ?auto_381042 ) ) ( not ( = ?auto_381036 ?auto_381038 ) ) ( not ( = ?auto_381036 ?auto_381037 ) ) ( not ( = ?auto_381036 ?auto_381039 ) ) ( not ( = ?auto_381036 ?auto_381040 ) ) ( not ( = ?auto_381036 ?auto_381041 ) ) ( not ( = ?auto_381036 ?auto_381042 ) ) ( not ( = ?auto_381038 ?auto_381037 ) ) ( not ( = ?auto_381038 ?auto_381039 ) ) ( not ( = ?auto_381038 ?auto_381040 ) ) ( not ( = ?auto_381038 ?auto_381041 ) ) ( not ( = ?auto_381038 ?auto_381042 ) ) ( not ( = ?auto_381037 ?auto_381039 ) ) ( not ( = ?auto_381037 ?auto_381040 ) ) ( not ( = ?auto_381037 ?auto_381041 ) ) ( not ( = ?auto_381037 ?auto_381042 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_381039 ?auto_381040 ?auto_381041 )
      ( MAKE-7CRATE-VERIFY ?auto_381034 ?auto_381035 ?auto_381036 ?auto_381038 ?auto_381037 ?auto_381039 ?auto_381040 ?auto_381041 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_381613 - SURFACE
      ?auto_381614 - SURFACE
    )
    :vars
    (
      ?auto_381619 - HOIST
      ?auto_381615 - PLACE
      ?auto_381616 - SURFACE
      ?auto_381618 - TRUCK
      ?auto_381617 - PLACE
      ?auto_381620 - HOIST
      ?auto_381621 - SURFACE
      ?auto_381622 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_381619 ?auto_381615 ) ( SURFACE-AT ?auto_381613 ?auto_381615 ) ( CLEAR ?auto_381613 ) ( IS-CRATE ?auto_381614 ) ( not ( = ?auto_381613 ?auto_381614 ) ) ( AVAILABLE ?auto_381619 ) ( ON ?auto_381613 ?auto_381616 ) ( not ( = ?auto_381616 ?auto_381613 ) ) ( not ( = ?auto_381616 ?auto_381614 ) ) ( TRUCK-AT ?auto_381618 ?auto_381617 ) ( not ( = ?auto_381617 ?auto_381615 ) ) ( HOIST-AT ?auto_381620 ?auto_381617 ) ( not ( = ?auto_381619 ?auto_381620 ) ) ( SURFACE-AT ?auto_381614 ?auto_381617 ) ( ON ?auto_381614 ?auto_381621 ) ( CLEAR ?auto_381614 ) ( not ( = ?auto_381613 ?auto_381621 ) ) ( not ( = ?auto_381614 ?auto_381621 ) ) ( not ( = ?auto_381616 ?auto_381621 ) ) ( LIFTING ?auto_381620 ?auto_381622 ) ( IS-CRATE ?auto_381622 ) ( not ( = ?auto_381613 ?auto_381622 ) ) ( not ( = ?auto_381614 ?auto_381622 ) ) ( not ( = ?auto_381616 ?auto_381622 ) ) ( not ( = ?auto_381621 ?auto_381622 ) ) )
    :subtasks
    ( ( !LOAD ?auto_381620 ?auto_381622 ?auto_381618 ?auto_381617 )
      ( MAKE-1CRATE ?auto_381613 ?auto_381614 )
      ( MAKE-1CRATE-VERIFY ?auto_381613 ?auto_381614 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_383943 - SURFACE
      ?auto_383944 - SURFACE
      ?auto_383945 - SURFACE
      ?auto_383947 - SURFACE
      ?auto_383946 - SURFACE
      ?auto_383948 - SURFACE
      ?auto_383949 - SURFACE
      ?auto_383950 - SURFACE
      ?auto_383951 - SURFACE
    )
    :vars
    (
      ?auto_383952 - HOIST
      ?auto_383953 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_383952 ?auto_383953 ) ( SURFACE-AT ?auto_383950 ?auto_383953 ) ( CLEAR ?auto_383950 ) ( LIFTING ?auto_383952 ?auto_383951 ) ( IS-CRATE ?auto_383951 ) ( not ( = ?auto_383950 ?auto_383951 ) ) ( ON ?auto_383944 ?auto_383943 ) ( ON ?auto_383945 ?auto_383944 ) ( ON ?auto_383947 ?auto_383945 ) ( ON ?auto_383946 ?auto_383947 ) ( ON ?auto_383948 ?auto_383946 ) ( ON ?auto_383949 ?auto_383948 ) ( ON ?auto_383950 ?auto_383949 ) ( not ( = ?auto_383943 ?auto_383944 ) ) ( not ( = ?auto_383943 ?auto_383945 ) ) ( not ( = ?auto_383943 ?auto_383947 ) ) ( not ( = ?auto_383943 ?auto_383946 ) ) ( not ( = ?auto_383943 ?auto_383948 ) ) ( not ( = ?auto_383943 ?auto_383949 ) ) ( not ( = ?auto_383943 ?auto_383950 ) ) ( not ( = ?auto_383943 ?auto_383951 ) ) ( not ( = ?auto_383944 ?auto_383945 ) ) ( not ( = ?auto_383944 ?auto_383947 ) ) ( not ( = ?auto_383944 ?auto_383946 ) ) ( not ( = ?auto_383944 ?auto_383948 ) ) ( not ( = ?auto_383944 ?auto_383949 ) ) ( not ( = ?auto_383944 ?auto_383950 ) ) ( not ( = ?auto_383944 ?auto_383951 ) ) ( not ( = ?auto_383945 ?auto_383947 ) ) ( not ( = ?auto_383945 ?auto_383946 ) ) ( not ( = ?auto_383945 ?auto_383948 ) ) ( not ( = ?auto_383945 ?auto_383949 ) ) ( not ( = ?auto_383945 ?auto_383950 ) ) ( not ( = ?auto_383945 ?auto_383951 ) ) ( not ( = ?auto_383947 ?auto_383946 ) ) ( not ( = ?auto_383947 ?auto_383948 ) ) ( not ( = ?auto_383947 ?auto_383949 ) ) ( not ( = ?auto_383947 ?auto_383950 ) ) ( not ( = ?auto_383947 ?auto_383951 ) ) ( not ( = ?auto_383946 ?auto_383948 ) ) ( not ( = ?auto_383946 ?auto_383949 ) ) ( not ( = ?auto_383946 ?auto_383950 ) ) ( not ( = ?auto_383946 ?auto_383951 ) ) ( not ( = ?auto_383948 ?auto_383949 ) ) ( not ( = ?auto_383948 ?auto_383950 ) ) ( not ( = ?auto_383948 ?auto_383951 ) ) ( not ( = ?auto_383949 ?auto_383950 ) ) ( not ( = ?auto_383949 ?auto_383951 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_383950 ?auto_383951 )
      ( MAKE-8CRATE-VERIFY ?auto_383943 ?auto_383944 ?auto_383945 ?auto_383947 ?auto_383946 ?auto_383948 ?auto_383949 ?auto_383950 ?auto_383951 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_384010 - SURFACE
      ?auto_384011 - SURFACE
      ?auto_384012 - SURFACE
      ?auto_384014 - SURFACE
      ?auto_384013 - SURFACE
      ?auto_384015 - SURFACE
      ?auto_384016 - SURFACE
      ?auto_384017 - SURFACE
      ?auto_384018 - SURFACE
    )
    :vars
    (
      ?auto_384021 - HOIST
      ?auto_384019 - PLACE
      ?auto_384020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_384021 ?auto_384019 ) ( SURFACE-AT ?auto_384017 ?auto_384019 ) ( CLEAR ?auto_384017 ) ( IS-CRATE ?auto_384018 ) ( not ( = ?auto_384017 ?auto_384018 ) ) ( TRUCK-AT ?auto_384020 ?auto_384019 ) ( AVAILABLE ?auto_384021 ) ( IN ?auto_384018 ?auto_384020 ) ( ON ?auto_384017 ?auto_384016 ) ( not ( = ?auto_384016 ?auto_384017 ) ) ( not ( = ?auto_384016 ?auto_384018 ) ) ( ON ?auto_384011 ?auto_384010 ) ( ON ?auto_384012 ?auto_384011 ) ( ON ?auto_384014 ?auto_384012 ) ( ON ?auto_384013 ?auto_384014 ) ( ON ?auto_384015 ?auto_384013 ) ( ON ?auto_384016 ?auto_384015 ) ( not ( = ?auto_384010 ?auto_384011 ) ) ( not ( = ?auto_384010 ?auto_384012 ) ) ( not ( = ?auto_384010 ?auto_384014 ) ) ( not ( = ?auto_384010 ?auto_384013 ) ) ( not ( = ?auto_384010 ?auto_384015 ) ) ( not ( = ?auto_384010 ?auto_384016 ) ) ( not ( = ?auto_384010 ?auto_384017 ) ) ( not ( = ?auto_384010 ?auto_384018 ) ) ( not ( = ?auto_384011 ?auto_384012 ) ) ( not ( = ?auto_384011 ?auto_384014 ) ) ( not ( = ?auto_384011 ?auto_384013 ) ) ( not ( = ?auto_384011 ?auto_384015 ) ) ( not ( = ?auto_384011 ?auto_384016 ) ) ( not ( = ?auto_384011 ?auto_384017 ) ) ( not ( = ?auto_384011 ?auto_384018 ) ) ( not ( = ?auto_384012 ?auto_384014 ) ) ( not ( = ?auto_384012 ?auto_384013 ) ) ( not ( = ?auto_384012 ?auto_384015 ) ) ( not ( = ?auto_384012 ?auto_384016 ) ) ( not ( = ?auto_384012 ?auto_384017 ) ) ( not ( = ?auto_384012 ?auto_384018 ) ) ( not ( = ?auto_384014 ?auto_384013 ) ) ( not ( = ?auto_384014 ?auto_384015 ) ) ( not ( = ?auto_384014 ?auto_384016 ) ) ( not ( = ?auto_384014 ?auto_384017 ) ) ( not ( = ?auto_384014 ?auto_384018 ) ) ( not ( = ?auto_384013 ?auto_384015 ) ) ( not ( = ?auto_384013 ?auto_384016 ) ) ( not ( = ?auto_384013 ?auto_384017 ) ) ( not ( = ?auto_384013 ?auto_384018 ) ) ( not ( = ?auto_384015 ?auto_384016 ) ) ( not ( = ?auto_384015 ?auto_384017 ) ) ( not ( = ?auto_384015 ?auto_384018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_384016 ?auto_384017 ?auto_384018 )
      ( MAKE-8CRATE-VERIFY ?auto_384010 ?auto_384011 ?auto_384012 ?auto_384014 ?auto_384013 ?auto_384015 ?auto_384016 ?auto_384017 ?auto_384018 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_384086 - SURFACE
      ?auto_384087 - SURFACE
      ?auto_384088 - SURFACE
      ?auto_384090 - SURFACE
      ?auto_384089 - SURFACE
      ?auto_384091 - SURFACE
      ?auto_384092 - SURFACE
      ?auto_384093 - SURFACE
      ?auto_384094 - SURFACE
    )
    :vars
    (
      ?auto_384095 - HOIST
      ?auto_384096 - PLACE
      ?auto_384098 - TRUCK
      ?auto_384097 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_384095 ?auto_384096 ) ( SURFACE-AT ?auto_384093 ?auto_384096 ) ( CLEAR ?auto_384093 ) ( IS-CRATE ?auto_384094 ) ( not ( = ?auto_384093 ?auto_384094 ) ) ( AVAILABLE ?auto_384095 ) ( IN ?auto_384094 ?auto_384098 ) ( ON ?auto_384093 ?auto_384092 ) ( not ( = ?auto_384092 ?auto_384093 ) ) ( not ( = ?auto_384092 ?auto_384094 ) ) ( TRUCK-AT ?auto_384098 ?auto_384097 ) ( not ( = ?auto_384097 ?auto_384096 ) ) ( ON ?auto_384087 ?auto_384086 ) ( ON ?auto_384088 ?auto_384087 ) ( ON ?auto_384090 ?auto_384088 ) ( ON ?auto_384089 ?auto_384090 ) ( ON ?auto_384091 ?auto_384089 ) ( ON ?auto_384092 ?auto_384091 ) ( not ( = ?auto_384086 ?auto_384087 ) ) ( not ( = ?auto_384086 ?auto_384088 ) ) ( not ( = ?auto_384086 ?auto_384090 ) ) ( not ( = ?auto_384086 ?auto_384089 ) ) ( not ( = ?auto_384086 ?auto_384091 ) ) ( not ( = ?auto_384086 ?auto_384092 ) ) ( not ( = ?auto_384086 ?auto_384093 ) ) ( not ( = ?auto_384086 ?auto_384094 ) ) ( not ( = ?auto_384087 ?auto_384088 ) ) ( not ( = ?auto_384087 ?auto_384090 ) ) ( not ( = ?auto_384087 ?auto_384089 ) ) ( not ( = ?auto_384087 ?auto_384091 ) ) ( not ( = ?auto_384087 ?auto_384092 ) ) ( not ( = ?auto_384087 ?auto_384093 ) ) ( not ( = ?auto_384087 ?auto_384094 ) ) ( not ( = ?auto_384088 ?auto_384090 ) ) ( not ( = ?auto_384088 ?auto_384089 ) ) ( not ( = ?auto_384088 ?auto_384091 ) ) ( not ( = ?auto_384088 ?auto_384092 ) ) ( not ( = ?auto_384088 ?auto_384093 ) ) ( not ( = ?auto_384088 ?auto_384094 ) ) ( not ( = ?auto_384090 ?auto_384089 ) ) ( not ( = ?auto_384090 ?auto_384091 ) ) ( not ( = ?auto_384090 ?auto_384092 ) ) ( not ( = ?auto_384090 ?auto_384093 ) ) ( not ( = ?auto_384090 ?auto_384094 ) ) ( not ( = ?auto_384089 ?auto_384091 ) ) ( not ( = ?auto_384089 ?auto_384092 ) ) ( not ( = ?auto_384089 ?auto_384093 ) ) ( not ( = ?auto_384089 ?auto_384094 ) ) ( not ( = ?auto_384091 ?auto_384092 ) ) ( not ( = ?auto_384091 ?auto_384093 ) ) ( not ( = ?auto_384091 ?auto_384094 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_384092 ?auto_384093 ?auto_384094 )
      ( MAKE-8CRATE-VERIFY ?auto_384086 ?auto_384087 ?auto_384088 ?auto_384090 ?auto_384089 ?auto_384091 ?auto_384092 ?auto_384093 ?auto_384094 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_384170 - SURFACE
      ?auto_384171 - SURFACE
      ?auto_384172 - SURFACE
      ?auto_384174 - SURFACE
      ?auto_384173 - SURFACE
      ?auto_384175 - SURFACE
      ?auto_384176 - SURFACE
      ?auto_384177 - SURFACE
      ?auto_384178 - SURFACE
    )
    :vars
    (
      ?auto_384182 - HOIST
      ?auto_384181 - PLACE
      ?auto_384179 - TRUCK
      ?auto_384180 - PLACE
      ?auto_384183 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_384182 ?auto_384181 ) ( SURFACE-AT ?auto_384177 ?auto_384181 ) ( CLEAR ?auto_384177 ) ( IS-CRATE ?auto_384178 ) ( not ( = ?auto_384177 ?auto_384178 ) ) ( AVAILABLE ?auto_384182 ) ( ON ?auto_384177 ?auto_384176 ) ( not ( = ?auto_384176 ?auto_384177 ) ) ( not ( = ?auto_384176 ?auto_384178 ) ) ( TRUCK-AT ?auto_384179 ?auto_384180 ) ( not ( = ?auto_384180 ?auto_384181 ) ) ( HOIST-AT ?auto_384183 ?auto_384180 ) ( LIFTING ?auto_384183 ?auto_384178 ) ( not ( = ?auto_384182 ?auto_384183 ) ) ( ON ?auto_384171 ?auto_384170 ) ( ON ?auto_384172 ?auto_384171 ) ( ON ?auto_384174 ?auto_384172 ) ( ON ?auto_384173 ?auto_384174 ) ( ON ?auto_384175 ?auto_384173 ) ( ON ?auto_384176 ?auto_384175 ) ( not ( = ?auto_384170 ?auto_384171 ) ) ( not ( = ?auto_384170 ?auto_384172 ) ) ( not ( = ?auto_384170 ?auto_384174 ) ) ( not ( = ?auto_384170 ?auto_384173 ) ) ( not ( = ?auto_384170 ?auto_384175 ) ) ( not ( = ?auto_384170 ?auto_384176 ) ) ( not ( = ?auto_384170 ?auto_384177 ) ) ( not ( = ?auto_384170 ?auto_384178 ) ) ( not ( = ?auto_384171 ?auto_384172 ) ) ( not ( = ?auto_384171 ?auto_384174 ) ) ( not ( = ?auto_384171 ?auto_384173 ) ) ( not ( = ?auto_384171 ?auto_384175 ) ) ( not ( = ?auto_384171 ?auto_384176 ) ) ( not ( = ?auto_384171 ?auto_384177 ) ) ( not ( = ?auto_384171 ?auto_384178 ) ) ( not ( = ?auto_384172 ?auto_384174 ) ) ( not ( = ?auto_384172 ?auto_384173 ) ) ( not ( = ?auto_384172 ?auto_384175 ) ) ( not ( = ?auto_384172 ?auto_384176 ) ) ( not ( = ?auto_384172 ?auto_384177 ) ) ( not ( = ?auto_384172 ?auto_384178 ) ) ( not ( = ?auto_384174 ?auto_384173 ) ) ( not ( = ?auto_384174 ?auto_384175 ) ) ( not ( = ?auto_384174 ?auto_384176 ) ) ( not ( = ?auto_384174 ?auto_384177 ) ) ( not ( = ?auto_384174 ?auto_384178 ) ) ( not ( = ?auto_384173 ?auto_384175 ) ) ( not ( = ?auto_384173 ?auto_384176 ) ) ( not ( = ?auto_384173 ?auto_384177 ) ) ( not ( = ?auto_384173 ?auto_384178 ) ) ( not ( = ?auto_384175 ?auto_384176 ) ) ( not ( = ?auto_384175 ?auto_384177 ) ) ( not ( = ?auto_384175 ?auto_384178 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_384176 ?auto_384177 ?auto_384178 )
      ( MAKE-8CRATE-VERIFY ?auto_384170 ?auto_384171 ?auto_384172 ?auto_384174 ?auto_384173 ?auto_384175 ?auto_384176 ?auto_384177 ?auto_384178 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_384262 - SURFACE
      ?auto_384263 - SURFACE
      ?auto_384264 - SURFACE
      ?auto_384266 - SURFACE
      ?auto_384265 - SURFACE
      ?auto_384267 - SURFACE
      ?auto_384268 - SURFACE
      ?auto_384269 - SURFACE
      ?auto_384270 - SURFACE
    )
    :vars
    (
      ?auto_384275 - HOIST
      ?auto_384271 - PLACE
      ?auto_384272 - TRUCK
      ?auto_384276 - PLACE
      ?auto_384274 - HOIST
      ?auto_384273 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_384275 ?auto_384271 ) ( SURFACE-AT ?auto_384269 ?auto_384271 ) ( CLEAR ?auto_384269 ) ( IS-CRATE ?auto_384270 ) ( not ( = ?auto_384269 ?auto_384270 ) ) ( AVAILABLE ?auto_384275 ) ( ON ?auto_384269 ?auto_384268 ) ( not ( = ?auto_384268 ?auto_384269 ) ) ( not ( = ?auto_384268 ?auto_384270 ) ) ( TRUCK-AT ?auto_384272 ?auto_384276 ) ( not ( = ?auto_384276 ?auto_384271 ) ) ( HOIST-AT ?auto_384274 ?auto_384276 ) ( not ( = ?auto_384275 ?auto_384274 ) ) ( AVAILABLE ?auto_384274 ) ( SURFACE-AT ?auto_384270 ?auto_384276 ) ( ON ?auto_384270 ?auto_384273 ) ( CLEAR ?auto_384270 ) ( not ( = ?auto_384269 ?auto_384273 ) ) ( not ( = ?auto_384270 ?auto_384273 ) ) ( not ( = ?auto_384268 ?auto_384273 ) ) ( ON ?auto_384263 ?auto_384262 ) ( ON ?auto_384264 ?auto_384263 ) ( ON ?auto_384266 ?auto_384264 ) ( ON ?auto_384265 ?auto_384266 ) ( ON ?auto_384267 ?auto_384265 ) ( ON ?auto_384268 ?auto_384267 ) ( not ( = ?auto_384262 ?auto_384263 ) ) ( not ( = ?auto_384262 ?auto_384264 ) ) ( not ( = ?auto_384262 ?auto_384266 ) ) ( not ( = ?auto_384262 ?auto_384265 ) ) ( not ( = ?auto_384262 ?auto_384267 ) ) ( not ( = ?auto_384262 ?auto_384268 ) ) ( not ( = ?auto_384262 ?auto_384269 ) ) ( not ( = ?auto_384262 ?auto_384270 ) ) ( not ( = ?auto_384262 ?auto_384273 ) ) ( not ( = ?auto_384263 ?auto_384264 ) ) ( not ( = ?auto_384263 ?auto_384266 ) ) ( not ( = ?auto_384263 ?auto_384265 ) ) ( not ( = ?auto_384263 ?auto_384267 ) ) ( not ( = ?auto_384263 ?auto_384268 ) ) ( not ( = ?auto_384263 ?auto_384269 ) ) ( not ( = ?auto_384263 ?auto_384270 ) ) ( not ( = ?auto_384263 ?auto_384273 ) ) ( not ( = ?auto_384264 ?auto_384266 ) ) ( not ( = ?auto_384264 ?auto_384265 ) ) ( not ( = ?auto_384264 ?auto_384267 ) ) ( not ( = ?auto_384264 ?auto_384268 ) ) ( not ( = ?auto_384264 ?auto_384269 ) ) ( not ( = ?auto_384264 ?auto_384270 ) ) ( not ( = ?auto_384264 ?auto_384273 ) ) ( not ( = ?auto_384266 ?auto_384265 ) ) ( not ( = ?auto_384266 ?auto_384267 ) ) ( not ( = ?auto_384266 ?auto_384268 ) ) ( not ( = ?auto_384266 ?auto_384269 ) ) ( not ( = ?auto_384266 ?auto_384270 ) ) ( not ( = ?auto_384266 ?auto_384273 ) ) ( not ( = ?auto_384265 ?auto_384267 ) ) ( not ( = ?auto_384265 ?auto_384268 ) ) ( not ( = ?auto_384265 ?auto_384269 ) ) ( not ( = ?auto_384265 ?auto_384270 ) ) ( not ( = ?auto_384265 ?auto_384273 ) ) ( not ( = ?auto_384267 ?auto_384268 ) ) ( not ( = ?auto_384267 ?auto_384269 ) ) ( not ( = ?auto_384267 ?auto_384270 ) ) ( not ( = ?auto_384267 ?auto_384273 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_384268 ?auto_384269 ?auto_384270 )
      ( MAKE-8CRATE-VERIFY ?auto_384262 ?auto_384263 ?auto_384264 ?auto_384266 ?auto_384265 ?auto_384267 ?auto_384268 ?auto_384269 ?auto_384270 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_384355 - SURFACE
      ?auto_384356 - SURFACE
      ?auto_384357 - SURFACE
      ?auto_384359 - SURFACE
      ?auto_384358 - SURFACE
      ?auto_384360 - SURFACE
      ?auto_384361 - SURFACE
      ?auto_384362 - SURFACE
      ?auto_384363 - SURFACE
    )
    :vars
    (
      ?auto_384367 - HOIST
      ?auto_384364 - PLACE
      ?auto_384365 - PLACE
      ?auto_384369 - HOIST
      ?auto_384366 - SURFACE
      ?auto_384368 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_384367 ?auto_384364 ) ( SURFACE-AT ?auto_384362 ?auto_384364 ) ( CLEAR ?auto_384362 ) ( IS-CRATE ?auto_384363 ) ( not ( = ?auto_384362 ?auto_384363 ) ) ( AVAILABLE ?auto_384367 ) ( ON ?auto_384362 ?auto_384361 ) ( not ( = ?auto_384361 ?auto_384362 ) ) ( not ( = ?auto_384361 ?auto_384363 ) ) ( not ( = ?auto_384365 ?auto_384364 ) ) ( HOIST-AT ?auto_384369 ?auto_384365 ) ( not ( = ?auto_384367 ?auto_384369 ) ) ( AVAILABLE ?auto_384369 ) ( SURFACE-AT ?auto_384363 ?auto_384365 ) ( ON ?auto_384363 ?auto_384366 ) ( CLEAR ?auto_384363 ) ( not ( = ?auto_384362 ?auto_384366 ) ) ( not ( = ?auto_384363 ?auto_384366 ) ) ( not ( = ?auto_384361 ?auto_384366 ) ) ( TRUCK-AT ?auto_384368 ?auto_384364 ) ( ON ?auto_384356 ?auto_384355 ) ( ON ?auto_384357 ?auto_384356 ) ( ON ?auto_384359 ?auto_384357 ) ( ON ?auto_384358 ?auto_384359 ) ( ON ?auto_384360 ?auto_384358 ) ( ON ?auto_384361 ?auto_384360 ) ( not ( = ?auto_384355 ?auto_384356 ) ) ( not ( = ?auto_384355 ?auto_384357 ) ) ( not ( = ?auto_384355 ?auto_384359 ) ) ( not ( = ?auto_384355 ?auto_384358 ) ) ( not ( = ?auto_384355 ?auto_384360 ) ) ( not ( = ?auto_384355 ?auto_384361 ) ) ( not ( = ?auto_384355 ?auto_384362 ) ) ( not ( = ?auto_384355 ?auto_384363 ) ) ( not ( = ?auto_384355 ?auto_384366 ) ) ( not ( = ?auto_384356 ?auto_384357 ) ) ( not ( = ?auto_384356 ?auto_384359 ) ) ( not ( = ?auto_384356 ?auto_384358 ) ) ( not ( = ?auto_384356 ?auto_384360 ) ) ( not ( = ?auto_384356 ?auto_384361 ) ) ( not ( = ?auto_384356 ?auto_384362 ) ) ( not ( = ?auto_384356 ?auto_384363 ) ) ( not ( = ?auto_384356 ?auto_384366 ) ) ( not ( = ?auto_384357 ?auto_384359 ) ) ( not ( = ?auto_384357 ?auto_384358 ) ) ( not ( = ?auto_384357 ?auto_384360 ) ) ( not ( = ?auto_384357 ?auto_384361 ) ) ( not ( = ?auto_384357 ?auto_384362 ) ) ( not ( = ?auto_384357 ?auto_384363 ) ) ( not ( = ?auto_384357 ?auto_384366 ) ) ( not ( = ?auto_384359 ?auto_384358 ) ) ( not ( = ?auto_384359 ?auto_384360 ) ) ( not ( = ?auto_384359 ?auto_384361 ) ) ( not ( = ?auto_384359 ?auto_384362 ) ) ( not ( = ?auto_384359 ?auto_384363 ) ) ( not ( = ?auto_384359 ?auto_384366 ) ) ( not ( = ?auto_384358 ?auto_384360 ) ) ( not ( = ?auto_384358 ?auto_384361 ) ) ( not ( = ?auto_384358 ?auto_384362 ) ) ( not ( = ?auto_384358 ?auto_384363 ) ) ( not ( = ?auto_384358 ?auto_384366 ) ) ( not ( = ?auto_384360 ?auto_384361 ) ) ( not ( = ?auto_384360 ?auto_384362 ) ) ( not ( = ?auto_384360 ?auto_384363 ) ) ( not ( = ?auto_384360 ?auto_384366 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_384361 ?auto_384362 ?auto_384363 )
      ( MAKE-8CRATE-VERIFY ?auto_384355 ?auto_384356 ?auto_384357 ?auto_384359 ?auto_384358 ?auto_384360 ?auto_384361 ?auto_384362 ?auto_384363 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_384448 - SURFACE
      ?auto_384449 - SURFACE
      ?auto_384450 - SURFACE
      ?auto_384452 - SURFACE
      ?auto_384451 - SURFACE
      ?auto_384453 - SURFACE
      ?auto_384454 - SURFACE
      ?auto_384455 - SURFACE
      ?auto_384456 - SURFACE
    )
    :vars
    (
      ?auto_384457 - HOIST
      ?auto_384461 - PLACE
      ?auto_384460 - PLACE
      ?auto_384462 - HOIST
      ?auto_384458 - SURFACE
      ?auto_384459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_384457 ?auto_384461 ) ( IS-CRATE ?auto_384456 ) ( not ( = ?auto_384455 ?auto_384456 ) ) ( not ( = ?auto_384454 ?auto_384455 ) ) ( not ( = ?auto_384454 ?auto_384456 ) ) ( not ( = ?auto_384460 ?auto_384461 ) ) ( HOIST-AT ?auto_384462 ?auto_384460 ) ( not ( = ?auto_384457 ?auto_384462 ) ) ( AVAILABLE ?auto_384462 ) ( SURFACE-AT ?auto_384456 ?auto_384460 ) ( ON ?auto_384456 ?auto_384458 ) ( CLEAR ?auto_384456 ) ( not ( = ?auto_384455 ?auto_384458 ) ) ( not ( = ?auto_384456 ?auto_384458 ) ) ( not ( = ?auto_384454 ?auto_384458 ) ) ( TRUCK-AT ?auto_384459 ?auto_384461 ) ( SURFACE-AT ?auto_384454 ?auto_384461 ) ( CLEAR ?auto_384454 ) ( LIFTING ?auto_384457 ?auto_384455 ) ( IS-CRATE ?auto_384455 ) ( ON ?auto_384449 ?auto_384448 ) ( ON ?auto_384450 ?auto_384449 ) ( ON ?auto_384452 ?auto_384450 ) ( ON ?auto_384451 ?auto_384452 ) ( ON ?auto_384453 ?auto_384451 ) ( ON ?auto_384454 ?auto_384453 ) ( not ( = ?auto_384448 ?auto_384449 ) ) ( not ( = ?auto_384448 ?auto_384450 ) ) ( not ( = ?auto_384448 ?auto_384452 ) ) ( not ( = ?auto_384448 ?auto_384451 ) ) ( not ( = ?auto_384448 ?auto_384453 ) ) ( not ( = ?auto_384448 ?auto_384454 ) ) ( not ( = ?auto_384448 ?auto_384455 ) ) ( not ( = ?auto_384448 ?auto_384456 ) ) ( not ( = ?auto_384448 ?auto_384458 ) ) ( not ( = ?auto_384449 ?auto_384450 ) ) ( not ( = ?auto_384449 ?auto_384452 ) ) ( not ( = ?auto_384449 ?auto_384451 ) ) ( not ( = ?auto_384449 ?auto_384453 ) ) ( not ( = ?auto_384449 ?auto_384454 ) ) ( not ( = ?auto_384449 ?auto_384455 ) ) ( not ( = ?auto_384449 ?auto_384456 ) ) ( not ( = ?auto_384449 ?auto_384458 ) ) ( not ( = ?auto_384450 ?auto_384452 ) ) ( not ( = ?auto_384450 ?auto_384451 ) ) ( not ( = ?auto_384450 ?auto_384453 ) ) ( not ( = ?auto_384450 ?auto_384454 ) ) ( not ( = ?auto_384450 ?auto_384455 ) ) ( not ( = ?auto_384450 ?auto_384456 ) ) ( not ( = ?auto_384450 ?auto_384458 ) ) ( not ( = ?auto_384452 ?auto_384451 ) ) ( not ( = ?auto_384452 ?auto_384453 ) ) ( not ( = ?auto_384452 ?auto_384454 ) ) ( not ( = ?auto_384452 ?auto_384455 ) ) ( not ( = ?auto_384452 ?auto_384456 ) ) ( not ( = ?auto_384452 ?auto_384458 ) ) ( not ( = ?auto_384451 ?auto_384453 ) ) ( not ( = ?auto_384451 ?auto_384454 ) ) ( not ( = ?auto_384451 ?auto_384455 ) ) ( not ( = ?auto_384451 ?auto_384456 ) ) ( not ( = ?auto_384451 ?auto_384458 ) ) ( not ( = ?auto_384453 ?auto_384454 ) ) ( not ( = ?auto_384453 ?auto_384455 ) ) ( not ( = ?auto_384453 ?auto_384456 ) ) ( not ( = ?auto_384453 ?auto_384458 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_384454 ?auto_384455 ?auto_384456 )
      ( MAKE-8CRATE-VERIFY ?auto_384448 ?auto_384449 ?auto_384450 ?auto_384452 ?auto_384451 ?auto_384453 ?auto_384454 ?auto_384455 ?auto_384456 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_384541 - SURFACE
      ?auto_384542 - SURFACE
      ?auto_384543 - SURFACE
      ?auto_384545 - SURFACE
      ?auto_384544 - SURFACE
      ?auto_384546 - SURFACE
      ?auto_384547 - SURFACE
      ?auto_384548 - SURFACE
      ?auto_384549 - SURFACE
    )
    :vars
    (
      ?auto_384551 - HOIST
      ?auto_384554 - PLACE
      ?auto_384550 - PLACE
      ?auto_384553 - HOIST
      ?auto_384552 - SURFACE
      ?auto_384555 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_384551 ?auto_384554 ) ( IS-CRATE ?auto_384549 ) ( not ( = ?auto_384548 ?auto_384549 ) ) ( not ( = ?auto_384547 ?auto_384548 ) ) ( not ( = ?auto_384547 ?auto_384549 ) ) ( not ( = ?auto_384550 ?auto_384554 ) ) ( HOIST-AT ?auto_384553 ?auto_384550 ) ( not ( = ?auto_384551 ?auto_384553 ) ) ( AVAILABLE ?auto_384553 ) ( SURFACE-AT ?auto_384549 ?auto_384550 ) ( ON ?auto_384549 ?auto_384552 ) ( CLEAR ?auto_384549 ) ( not ( = ?auto_384548 ?auto_384552 ) ) ( not ( = ?auto_384549 ?auto_384552 ) ) ( not ( = ?auto_384547 ?auto_384552 ) ) ( TRUCK-AT ?auto_384555 ?auto_384554 ) ( SURFACE-AT ?auto_384547 ?auto_384554 ) ( CLEAR ?auto_384547 ) ( IS-CRATE ?auto_384548 ) ( AVAILABLE ?auto_384551 ) ( IN ?auto_384548 ?auto_384555 ) ( ON ?auto_384542 ?auto_384541 ) ( ON ?auto_384543 ?auto_384542 ) ( ON ?auto_384545 ?auto_384543 ) ( ON ?auto_384544 ?auto_384545 ) ( ON ?auto_384546 ?auto_384544 ) ( ON ?auto_384547 ?auto_384546 ) ( not ( = ?auto_384541 ?auto_384542 ) ) ( not ( = ?auto_384541 ?auto_384543 ) ) ( not ( = ?auto_384541 ?auto_384545 ) ) ( not ( = ?auto_384541 ?auto_384544 ) ) ( not ( = ?auto_384541 ?auto_384546 ) ) ( not ( = ?auto_384541 ?auto_384547 ) ) ( not ( = ?auto_384541 ?auto_384548 ) ) ( not ( = ?auto_384541 ?auto_384549 ) ) ( not ( = ?auto_384541 ?auto_384552 ) ) ( not ( = ?auto_384542 ?auto_384543 ) ) ( not ( = ?auto_384542 ?auto_384545 ) ) ( not ( = ?auto_384542 ?auto_384544 ) ) ( not ( = ?auto_384542 ?auto_384546 ) ) ( not ( = ?auto_384542 ?auto_384547 ) ) ( not ( = ?auto_384542 ?auto_384548 ) ) ( not ( = ?auto_384542 ?auto_384549 ) ) ( not ( = ?auto_384542 ?auto_384552 ) ) ( not ( = ?auto_384543 ?auto_384545 ) ) ( not ( = ?auto_384543 ?auto_384544 ) ) ( not ( = ?auto_384543 ?auto_384546 ) ) ( not ( = ?auto_384543 ?auto_384547 ) ) ( not ( = ?auto_384543 ?auto_384548 ) ) ( not ( = ?auto_384543 ?auto_384549 ) ) ( not ( = ?auto_384543 ?auto_384552 ) ) ( not ( = ?auto_384545 ?auto_384544 ) ) ( not ( = ?auto_384545 ?auto_384546 ) ) ( not ( = ?auto_384545 ?auto_384547 ) ) ( not ( = ?auto_384545 ?auto_384548 ) ) ( not ( = ?auto_384545 ?auto_384549 ) ) ( not ( = ?auto_384545 ?auto_384552 ) ) ( not ( = ?auto_384544 ?auto_384546 ) ) ( not ( = ?auto_384544 ?auto_384547 ) ) ( not ( = ?auto_384544 ?auto_384548 ) ) ( not ( = ?auto_384544 ?auto_384549 ) ) ( not ( = ?auto_384544 ?auto_384552 ) ) ( not ( = ?auto_384546 ?auto_384547 ) ) ( not ( = ?auto_384546 ?auto_384548 ) ) ( not ( = ?auto_384546 ?auto_384549 ) ) ( not ( = ?auto_384546 ?auto_384552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_384547 ?auto_384548 ?auto_384549 )
      ( MAKE-8CRATE-VERIFY ?auto_384541 ?auto_384542 ?auto_384543 ?auto_384545 ?auto_384544 ?auto_384546 ?auto_384547 ?auto_384548 ?auto_384549 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_385836 - SURFACE
      ?auto_385837 - SURFACE
    )
    :vars
    (
      ?auto_385842 - HOIST
      ?auto_385841 - PLACE
      ?auto_385839 - SURFACE
      ?auto_385843 - PLACE
      ?auto_385844 - HOIST
      ?auto_385838 - SURFACE
      ?auto_385840 - TRUCK
      ?auto_385845 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_385842 ?auto_385841 ) ( SURFACE-AT ?auto_385836 ?auto_385841 ) ( CLEAR ?auto_385836 ) ( IS-CRATE ?auto_385837 ) ( not ( = ?auto_385836 ?auto_385837 ) ) ( ON ?auto_385836 ?auto_385839 ) ( not ( = ?auto_385839 ?auto_385836 ) ) ( not ( = ?auto_385839 ?auto_385837 ) ) ( not ( = ?auto_385843 ?auto_385841 ) ) ( HOIST-AT ?auto_385844 ?auto_385843 ) ( not ( = ?auto_385842 ?auto_385844 ) ) ( AVAILABLE ?auto_385844 ) ( SURFACE-AT ?auto_385837 ?auto_385843 ) ( ON ?auto_385837 ?auto_385838 ) ( CLEAR ?auto_385837 ) ( not ( = ?auto_385836 ?auto_385838 ) ) ( not ( = ?auto_385837 ?auto_385838 ) ) ( not ( = ?auto_385839 ?auto_385838 ) ) ( TRUCK-AT ?auto_385840 ?auto_385841 ) ( LIFTING ?auto_385842 ?auto_385845 ) ( IS-CRATE ?auto_385845 ) ( not ( = ?auto_385836 ?auto_385845 ) ) ( not ( = ?auto_385837 ?auto_385845 ) ) ( not ( = ?auto_385839 ?auto_385845 ) ) ( not ( = ?auto_385838 ?auto_385845 ) ) )
    :subtasks
    ( ( !LOAD ?auto_385842 ?auto_385845 ?auto_385840 ?auto_385841 )
      ( MAKE-1CRATE ?auto_385836 ?auto_385837 )
      ( MAKE-1CRATE-VERIFY ?auto_385836 ?auto_385837 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_388645 - SURFACE
      ?auto_388646 - SURFACE
      ?auto_388647 - SURFACE
      ?auto_388649 - SURFACE
      ?auto_388648 - SURFACE
      ?auto_388650 - SURFACE
      ?auto_388651 - SURFACE
      ?auto_388652 - SURFACE
      ?auto_388653 - SURFACE
      ?auto_388654 - SURFACE
    )
    :vars
    (
      ?auto_388655 - HOIST
      ?auto_388656 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_388655 ?auto_388656 ) ( SURFACE-AT ?auto_388653 ?auto_388656 ) ( CLEAR ?auto_388653 ) ( LIFTING ?auto_388655 ?auto_388654 ) ( IS-CRATE ?auto_388654 ) ( not ( = ?auto_388653 ?auto_388654 ) ) ( ON ?auto_388646 ?auto_388645 ) ( ON ?auto_388647 ?auto_388646 ) ( ON ?auto_388649 ?auto_388647 ) ( ON ?auto_388648 ?auto_388649 ) ( ON ?auto_388650 ?auto_388648 ) ( ON ?auto_388651 ?auto_388650 ) ( ON ?auto_388652 ?auto_388651 ) ( ON ?auto_388653 ?auto_388652 ) ( not ( = ?auto_388645 ?auto_388646 ) ) ( not ( = ?auto_388645 ?auto_388647 ) ) ( not ( = ?auto_388645 ?auto_388649 ) ) ( not ( = ?auto_388645 ?auto_388648 ) ) ( not ( = ?auto_388645 ?auto_388650 ) ) ( not ( = ?auto_388645 ?auto_388651 ) ) ( not ( = ?auto_388645 ?auto_388652 ) ) ( not ( = ?auto_388645 ?auto_388653 ) ) ( not ( = ?auto_388645 ?auto_388654 ) ) ( not ( = ?auto_388646 ?auto_388647 ) ) ( not ( = ?auto_388646 ?auto_388649 ) ) ( not ( = ?auto_388646 ?auto_388648 ) ) ( not ( = ?auto_388646 ?auto_388650 ) ) ( not ( = ?auto_388646 ?auto_388651 ) ) ( not ( = ?auto_388646 ?auto_388652 ) ) ( not ( = ?auto_388646 ?auto_388653 ) ) ( not ( = ?auto_388646 ?auto_388654 ) ) ( not ( = ?auto_388647 ?auto_388649 ) ) ( not ( = ?auto_388647 ?auto_388648 ) ) ( not ( = ?auto_388647 ?auto_388650 ) ) ( not ( = ?auto_388647 ?auto_388651 ) ) ( not ( = ?auto_388647 ?auto_388652 ) ) ( not ( = ?auto_388647 ?auto_388653 ) ) ( not ( = ?auto_388647 ?auto_388654 ) ) ( not ( = ?auto_388649 ?auto_388648 ) ) ( not ( = ?auto_388649 ?auto_388650 ) ) ( not ( = ?auto_388649 ?auto_388651 ) ) ( not ( = ?auto_388649 ?auto_388652 ) ) ( not ( = ?auto_388649 ?auto_388653 ) ) ( not ( = ?auto_388649 ?auto_388654 ) ) ( not ( = ?auto_388648 ?auto_388650 ) ) ( not ( = ?auto_388648 ?auto_388651 ) ) ( not ( = ?auto_388648 ?auto_388652 ) ) ( not ( = ?auto_388648 ?auto_388653 ) ) ( not ( = ?auto_388648 ?auto_388654 ) ) ( not ( = ?auto_388650 ?auto_388651 ) ) ( not ( = ?auto_388650 ?auto_388652 ) ) ( not ( = ?auto_388650 ?auto_388653 ) ) ( not ( = ?auto_388650 ?auto_388654 ) ) ( not ( = ?auto_388651 ?auto_388652 ) ) ( not ( = ?auto_388651 ?auto_388653 ) ) ( not ( = ?auto_388651 ?auto_388654 ) ) ( not ( = ?auto_388652 ?auto_388653 ) ) ( not ( = ?auto_388652 ?auto_388654 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_388653 ?auto_388654 )
      ( MAKE-9CRATE-VERIFY ?auto_388645 ?auto_388646 ?auto_388647 ?auto_388649 ?auto_388648 ?auto_388650 ?auto_388651 ?auto_388652 ?auto_388653 ?auto_388654 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_388725 - SURFACE
      ?auto_388726 - SURFACE
      ?auto_388727 - SURFACE
      ?auto_388729 - SURFACE
      ?auto_388728 - SURFACE
      ?auto_388730 - SURFACE
      ?auto_388731 - SURFACE
      ?auto_388732 - SURFACE
      ?auto_388733 - SURFACE
      ?auto_388734 - SURFACE
    )
    :vars
    (
      ?auto_388735 - HOIST
      ?auto_388737 - PLACE
      ?auto_388736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_388735 ?auto_388737 ) ( SURFACE-AT ?auto_388733 ?auto_388737 ) ( CLEAR ?auto_388733 ) ( IS-CRATE ?auto_388734 ) ( not ( = ?auto_388733 ?auto_388734 ) ) ( TRUCK-AT ?auto_388736 ?auto_388737 ) ( AVAILABLE ?auto_388735 ) ( IN ?auto_388734 ?auto_388736 ) ( ON ?auto_388733 ?auto_388732 ) ( not ( = ?auto_388732 ?auto_388733 ) ) ( not ( = ?auto_388732 ?auto_388734 ) ) ( ON ?auto_388726 ?auto_388725 ) ( ON ?auto_388727 ?auto_388726 ) ( ON ?auto_388729 ?auto_388727 ) ( ON ?auto_388728 ?auto_388729 ) ( ON ?auto_388730 ?auto_388728 ) ( ON ?auto_388731 ?auto_388730 ) ( ON ?auto_388732 ?auto_388731 ) ( not ( = ?auto_388725 ?auto_388726 ) ) ( not ( = ?auto_388725 ?auto_388727 ) ) ( not ( = ?auto_388725 ?auto_388729 ) ) ( not ( = ?auto_388725 ?auto_388728 ) ) ( not ( = ?auto_388725 ?auto_388730 ) ) ( not ( = ?auto_388725 ?auto_388731 ) ) ( not ( = ?auto_388725 ?auto_388732 ) ) ( not ( = ?auto_388725 ?auto_388733 ) ) ( not ( = ?auto_388725 ?auto_388734 ) ) ( not ( = ?auto_388726 ?auto_388727 ) ) ( not ( = ?auto_388726 ?auto_388729 ) ) ( not ( = ?auto_388726 ?auto_388728 ) ) ( not ( = ?auto_388726 ?auto_388730 ) ) ( not ( = ?auto_388726 ?auto_388731 ) ) ( not ( = ?auto_388726 ?auto_388732 ) ) ( not ( = ?auto_388726 ?auto_388733 ) ) ( not ( = ?auto_388726 ?auto_388734 ) ) ( not ( = ?auto_388727 ?auto_388729 ) ) ( not ( = ?auto_388727 ?auto_388728 ) ) ( not ( = ?auto_388727 ?auto_388730 ) ) ( not ( = ?auto_388727 ?auto_388731 ) ) ( not ( = ?auto_388727 ?auto_388732 ) ) ( not ( = ?auto_388727 ?auto_388733 ) ) ( not ( = ?auto_388727 ?auto_388734 ) ) ( not ( = ?auto_388729 ?auto_388728 ) ) ( not ( = ?auto_388729 ?auto_388730 ) ) ( not ( = ?auto_388729 ?auto_388731 ) ) ( not ( = ?auto_388729 ?auto_388732 ) ) ( not ( = ?auto_388729 ?auto_388733 ) ) ( not ( = ?auto_388729 ?auto_388734 ) ) ( not ( = ?auto_388728 ?auto_388730 ) ) ( not ( = ?auto_388728 ?auto_388731 ) ) ( not ( = ?auto_388728 ?auto_388732 ) ) ( not ( = ?auto_388728 ?auto_388733 ) ) ( not ( = ?auto_388728 ?auto_388734 ) ) ( not ( = ?auto_388730 ?auto_388731 ) ) ( not ( = ?auto_388730 ?auto_388732 ) ) ( not ( = ?auto_388730 ?auto_388733 ) ) ( not ( = ?auto_388730 ?auto_388734 ) ) ( not ( = ?auto_388731 ?auto_388732 ) ) ( not ( = ?auto_388731 ?auto_388733 ) ) ( not ( = ?auto_388731 ?auto_388734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_388732 ?auto_388733 ?auto_388734 )
      ( MAKE-9CRATE-VERIFY ?auto_388725 ?auto_388726 ?auto_388727 ?auto_388729 ?auto_388728 ?auto_388730 ?auto_388731 ?auto_388732 ?auto_388733 ?auto_388734 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_388815 - SURFACE
      ?auto_388816 - SURFACE
      ?auto_388817 - SURFACE
      ?auto_388819 - SURFACE
      ?auto_388818 - SURFACE
      ?auto_388820 - SURFACE
      ?auto_388821 - SURFACE
      ?auto_388822 - SURFACE
      ?auto_388823 - SURFACE
      ?auto_388824 - SURFACE
    )
    :vars
    (
      ?auto_388827 - HOIST
      ?auto_388825 - PLACE
      ?auto_388826 - TRUCK
      ?auto_388828 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_388827 ?auto_388825 ) ( SURFACE-AT ?auto_388823 ?auto_388825 ) ( CLEAR ?auto_388823 ) ( IS-CRATE ?auto_388824 ) ( not ( = ?auto_388823 ?auto_388824 ) ) ( AVAILABLE ?auto_388827 ) ( IN ?auto_388824 ?auto_388826 ) ( ON ?auto_388823 ?auto_388822 ) ( not ( = ?auto_388822 ?auto_388823 ) ) ( not ( = ?auto_388822 ?auto_388824 ) ) ( TRUCK-AT ?auto_388826 ?auto_388828 ) ( not ( = ?auto_388828 ?auto_388825 ) ) ( ON ?auto_388816 ?auto_388815 ) ( ON ?auto_388817 ?auto_388816 ) ( ON ?auto_388819 ?auto_388817 ) ( ON ?auto_388818 ?auto_388819 ) ( ON ?auto_388820 ?auto_388818 ) ( ON ?auto_388821 ?auto_388820 ) ( ON ?auto_388822 ?auto_388821 ) ( not ( = ?auto_388815 ?auto_388816 ) ) ( not ( = ?auto_388815 ?auto_388817 ) ) ( not ( = ?auto_388815 ?auto_388819 ) ) ( not ( = ?auto_388815 ?auto_388818 ) ) ( not ( = ?auto_388815 ?auto_388820 ) ) ( not ( = ?auto_388815 ?auto_388821 ) ) ( not ( = ?auto_388815 ?auto_388822 ) ) ( not ( = ?auto_388815 ?auto_388823 ) ) ( not ( = ?auto_388815 ?auto_388824 ) ) ( not ( = ?auto_388816 ?auto_388817 ) ) ( not ( = ?auto_388816 ?auto_388819 ) ) ( not ( = ?auto_388816 ?auto_388818 ) ) ( not ( = ?auto_388816 ?auto_388820 ) ) ( not ( = ?auto_388816 ?auto_388821 ) ) ( not ( = ?auto_388816 ?auto_388822 ) ) ( not ( = ?auto_388816 ?auto_388823 ) ) ( not ( = ?auto_388816 ?auto_388824 ) ) ( not ( = ?auto_388817 ?auto_388819 ) ) ( not ( = ?auto_388817 ?auto_388818 ) ) ( not ( = ?auto_388817 ?auto_388820 ) ) ( not ( = ?auto_388817 ?auto_388821 ) ) ( not ( = ?auto_388817 ?auto_388822 ) ) ( not ( = ?auto_388817 ?auto_388823 ) ) ( not ( = ?auto_388817 ?auto_388824 ) ) ( not ( = ?auto_388819 ?auto_388818 ) ) ( not ( = ?auto_388819 ?auto_388820 ) ) ( not ( = ?auto_388819 ?auto_388821 ) ) ( not ( = ?auto_388819 ?auto_388822 ) ) ( not ( = ?auto_388819 ?auto_388823 ) ) ( not ( = ?auto_388819 ?auto_388824 ) ) ( not ( = ?auto_388818 ?auto_388820 ) ) ( not ( = ?auto_388818 ?auto_388821 ) ) ( not ( = ?auto_388818 ?auto_388822 ) ) ( not ( = ?auto_388818 ?auto_388823 ) ) ( not ( = ?auto_388818 ?auto_388824 ) ) ( not ( = ?auto_388820 ?auto_388821 ) ) ( not ( = ?auto_388820 ?auto_388822 ) ) ( not ( = ?auto_388820 ?auto_388823 ) ) ( not ( = ?auto_388820 ?auto_388824 ) ) ( not ( = ?auto_388821 ?auto_388822 ) ) ( not ( = ?auto_388821 ?auto_388823 ) ) ( not ( = ?auto_388821 ?auto_388824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_388822 ?auto_388823 ?auto_388824 )
      ( MAKE-9CRATE-VERIFY ?auto_388815 ?auto_388816 ?auto_388817 ?auto_388819 ?auto_388818 ?auto_388820 ?auto_388821 ?auto_388822 ?auto_388823 ?auto_388824 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_388914 - SURFACE
      ?auto_388915 - SURFACE
      ?auto_388916 - SURFACE
      ?auto_388918 - SURFACE
      ?auto_388917 - SURFACE
      ?auto_388919 - SURFACE
      ?auto_388920 - SURFACE
      ?auto_388921 - SURFACE
      ?auto_388922 - SURFACE
      ?auto_388923 - SURFACE
    )
    :vars
    (
      ?auto_388927 - HOIST
      ?auto_388928 - PLACE
      ?auto_388926 - TRUCK
      ?auto_388925 - PLACE
      ?auto_388924 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_388927 ?auto_388928 ) ( SURFACE-AT ?auto_388922 ?auto_388928 ) ( CLEAR ?auto_388922 ) ( IS-CRATE ?auto_388923 ) ( not ( = ?auto_388922 ?auto_388923 ) ) ( AVAILABLE ?auto_388927 ) ( ON ?auto_388922 ?auto_388921 ) ( not ( = ?auto_388921 ?auto_388922 ) ) ( not ( = ?auto_388921 ?auto_388923 ) ) ( TRUCK-AT ?auto_388926 ?auto_388925 ) ( not ( = ?auto_388925 ?auto_388928 ) ) ( HOIST-AT ?auto_388924 ?auto_388925 ) ( LIFTING ?auto_388924 ?auto_388923 ) ( not ( = ?auto_388927 ?auto_388924 ) ) ( ON ?auto_388915 ?auto_388914 ) ( ON ?auto_388916 ?auto_388915 ) ( ON ?auto_388918 ?auto_388916 ) ( ON ?auto_388917 ?auto_388918 ) ( ON ?auto_388919 ?auto_388917 ) ( ON ?auto_388920 ?auto_388919 ) ( ON ?auto_388921 ?auto_388920 ) ( not ( = ?auto_388914 ?auto_388915 ) ) ( not ( = ?auto_388914 ?auto_388916 ) ) ( not ( = ?auto_388914 ?auto_388918 ) ) ( not ( = ?auto_388914 ?auto_388917 ) ) ( not ( = ?auto_388914 ?auto_388919 ) ) ( not ( = ?auto_388914 ?auto_388920 ) ) ( not ( = ?auto_388914 ?auto_388921 ) ) ( not ( = ?auto_388914 ?auto_388922 ) ) ( not ( = ?auto_388914 ?auto_388923 ) ) ( not ( = ?auto_388915 ?auto_388916 ) ) ( not ( = ?auto_388915 ?auto_388918 ) ) ( not ( = ?auto_388915 ?auto_388917 ) ) ( not ( = ?auto_388915 ?auto_388919 ) ) ( not ( = ?auto_388915 ?auto_388920 ) ) ( not ( = ?auto_388915 ?auto_388921 ) ) ( not ( = ?auto_388915 ?auto_388922 ) ) ( not ( = ?auto_388915 ?auto_388923 ) ) ( not ( = ?auto_388916 ?auto_388918 ) ) ( not ( = ?auto_388916 ?auto_388917 ) ) ( not ( = ?auto_388916 ?auto_388919 ) ) ( not ( = ?auto_388916 ?auto_388920 ) ) ( not ( = ?auto_388916 ?auto_388921 ) ) ( not ( = ?auto_388916 ?auto_388922 ) ) ( not ( = ?auto_388916 ?auto_388923 ) ) ( not ( = ?auto_388918 ?auto_388917 ) ) ( not ( = ?auto_388918 ?auto_388919 ) ) ( not ( = ?auto_388918 ?auto_388920 ) ) ( not ( = ?auto_388918 ?auto_388921 ) ) ( not ( = ?auto_388918 ?auto_388922 ) ) ( not ( = ?auto_388918 ?auto_388923 ) ) ( not ( = ?auto_388917 ?auto_388919 ) ) ( not ( = ?auto_388917 ?auto_388920 ) ) ( not ( = ?auto_388917 ?auto_388921 ) ) ( not ( = ?auto_388917 ?auto_388922 ) ) ( not ( = ?auto_388917 ?auto_388923 ) ) ( not ( = ?auto_388919 ?auto_388920 ) ) ( not ( = ?auto_388919 ?auto_388921 ) ) ( not ( = ?auto_388919 ?auto_388922 ) ) ( not ( = ?auto_388919 ?auto_388923 ) ) ( not ( = ?auto_388920 ?auto_388921 ) ) ( not ( = ?auto_388920 ?auto_388922 ) ) ( not ( = ?auto_388920 ?auto_388923 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_388921 ?auto_388922 ?auto_388923 )
      ( MAKE-9CRATE-VERIFY ?auto_388914 ?auto_388915 ?auto_388916 ?auto_388918 ?auto_388917 ?auto_388919 ?auto_388920 ?auto_388921 ?auto_388922 ?auto_388923 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_389022 - SURFACE
      ?auto_389023 - SURFACE
      ?auto_389024 - SURFACE
      ?auto_389026 - SURFACE
      ?auto_389025 - SURFACE
      ?auto_389027 - SURFACE
      ?auto_389028 - SURFACE
      ?auto_389029 - SURFACE
      ?auto_389030 - SURFACE
      ?auto_389031 - SURFACE
    )
    :vars
    (
      ?auto_389034 - HOIST
      ?auto_389033 - PLACE
      ?auto_389035 - TRUCK
      ?auto_389032 - PLACE
      ?auto_389036 - HOIST
      ?auto_389037 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_389034 ?auto_389033 ) ( SURFACE-AT ?auto_389030 ?auto_389033 ) ( CLEAR ?auto_389030 ) ( IS-CRATE ?auto_389031 ) ( not ( = ?auto_389030 ?auto_389031 ) ) ( AVAILABLE ?auto_389034 ) ( ON ?auto_389030 ?auto_389029 ) ( not ( = ?auto_389029 ?auto_389030 ) ) ( not ( = ?auto_389029 ?auto_389031 ) ) ( TRUCK-AT ?auto_389035 ?auto_389032 ) ( not ( = ?auto_389032 ?auto_389033 ) ) ( HOIST-AT ?auto_389036 ?auto_389032 ) ( not ( = ?auto_389034 ?auto_389036 ) ) ( AVAILABLE ?auto_389036 ) ( SURFACE-AT ?auto_389031 ?auto_389032 ) ( ON ?auto_389031 ?auto_389037 ) ( CLEAR ?auto_389031 ) ( not ( = ?auto_389030 ?auto_389037 ) ) ( not ( = ?auto_389031 ?auto_389037 ) ) ( not ( = ?auto_389029 ?auto_389037 ) ) ( ON ?auto_389023 ?auto_389022 ) ( ON ?auto_389024 ?auto_389023 ) ( ON ?auto_389026 ?auto_389024 ) ( ON ?auto_389025 ?auto_389026 ) ( ON ?auto_389027 ?auto_389025 ) ( ON ?auto_389028 ?auto_389027 ) ( ON ?auto_389029 ?auto_389028 ) ( not ( = ?auto_389022 ?auto_389023 ) ) ( not ( = ?auto_389022 ?auto_389024 ) ) ( not ( = ?auto_389022 ?auto_389026 ) ) ( not ( = ?auto_389022 ?auto_389025 ) ) ( not ( = ?auto_389022 ?auto_389027 ) ) ( not ( = ?auto_389022 ?auto_389028 ) ) ( not ( = ?auto_389022 ?auto_389029 ) ) ( not ( = ?auto_389022 ?auto_389030 ) ) ( not ( = ?auto_389022 ?auto_389031 ) ) ( not ( = ?auto_389022 ?auto_389037 ) ) ( not ( = ?auto_389023 ?auto_389024 ) ) ( not ( = ?auto_389023 ?auto_389026 ) ) ( not ( = ?auto_389023 ?auto_389025 ) ) ( not ( = ?auto_389023 ?auto_389027 ) ) ( not ( = ?auto_389023 ?auto_389028 ) ) ( not ( = ?auto_389023 ?auto_389029 ) ) ( not ( = ?auto_389023 ?auto_389030 ) ) ( not ( = ?auto_389023 ?auto_389031 ) ) ( not ( = ?auto_389023 ?auto_389037 ) ) ( not ( = ?auto_389024 ?auto_389026 ) ) ( not ( = ?auto_389024 ?auto_389025 ) ) ( not ( = ?auto_389024 ?auto_389027 ) ) ( not ( = ?auto_389024 ?auto_389028 ) ) ( not ( = ?auto_389024 ?auto_389029 ) ) ( not ( = ?auto_389024 ?auto_389030 ) ) ( not ( = ?auto_389024 ?auto_389031 ) ) ( not ( = ?auto_389024 ?auto_389037 ) ) ( not ( = ?auto_389026 ?auto_389025 ) ) ( not ( = ?auto_389026 ?auto_389027 ) ) ( not ( = ?auto_389026 ?auto_389028 ) ) ( not ( = ?auto_389026 ?auto_389029 ) ) ( not ( = ?auto_389026 ?auto_389030 ) ) ( not ( = ?auto_389026 ?auto_389031 ) ) ( not ( = ?auto_389026 ?auto_389037 ) ) ( not ( = ?auto_389025 ?auto_389027 ) ) ( not ( = ?auto_389025 ?auto_389028 ) ) ( not ( = ?auto_389025 ?auto_389029 ) ) ( not ( = ?auto_389025 ?auto_389030 ) ) ( not ( = ?auto_389025 ?auto_389031 ) ) ( not ( = ?auto_389025 ?auto_389037 ) ) ( not ( = ?auto_389027 ?auto_389028 ) ) ( not ( = ?auto_389027 ?auto_389029 ) ) ( not ( = ?auto_389027 ?auto_389030 ) ) ( not ( = ?auto_389027 ?auto_389031 ) ) ( not ( = ?auto_389027 ?auto_389037 ) ) ( not ( = ?auto_389028 ?auto_389029 ) ) ( not ( = ?auto_389028 ?auto_389030 ) ) ( not ( = ?auto_389028 ?auto_389031 ) ) ( not ( = ?auto_389028 ?auto_389037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_389029 ?auto_389030 ?auto_389031 )
      ( MAKE-9CRATE-VERIFY ?auto_389022 ?auto_389023 ?auto_389024 ?auto_389026 ?auto_389025 ?auto_389027 ?auto_389028 ?auto_389029 ?auto_389030 ?auto_389031 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_389131 - SURFACE
      ?auto_389132 - SURFACE
      ?auto_389133 - SURFACE
      ?auto_389135 - SURFACE
      ?auto_389134 - SURFACE
      ?auto_389136 - SURFACE
      ?auto_389137 - SURFACE
      ?auto_389138 - SURFACE
      ?auto_389139 - SURFACE
      ?auto_389140 - SURFACE
    )
    :vars
    (
      ?auto_389146 - HOIST
      ?auto_389144 - PLACE
      ?auto_389142 - PLACE
      ?auto_389145 - HOIST
      ?auto_389141 - SURFACE
      ?auto_389143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_389146 ?auto_389144 ) ( SURFACE-AT ?auto_389139 ?auto_389144 ) ( CLEAR ?auto_389139 ) ( IS-CRATE ?auto_389140 ) ( not ( = ?auto_389139 ?auto_389140 ) ) ( AVAILABLE ?auto_389146 ) ( ON ?auto_389139 ?auto_389138 ) ( not ( = ?auto_389138 ?auto_389139 ) ) ( not ( = ?auto_389138 ?auto_389140 ) ) ( not ( = ?auto_389142 ?auto_389144 ) ) ( HOIST-AT ?auto_389145 ?auto_389142 ) ( not ( = ?auto_389146 ?auto_389145 ) ) ( AVAILABLE ?auto_389145 ) ( SURFACE-AT ?auto_389140 ?auto_389142 ) ( ON ?auto_389140 ?auto_389141 ) ( CLEAR ?auto_389140 ) ( not ( = ?auto_389139 ?auto_389141 ) ) ( not ( = ?auto_389140 ?auto_389141 ) ) ( not ( = ?auto_389138 ?auto_389141 ) ) ( TRUCK-AT ?auto_389143 ?auto_389144 ) ( ON ?auto_389132 ?auto_389131 ) ( ON ?auto_389133 ?auto_389132 ) ( ON ?auto_389135 ?auto_389133 ) ( ON ?auto_389134 ?auto_389135 ) ( ON ?auto_389136 ?auto_389134 ) ( ON ?auto_389137 ?auto_389136 ) ( ON ?auto_389138 ?auto_389137 ) ( not ( = ?auto_389131 ?auto_389132 ) ) ( not ( = ?auto_389131 ?auto_389133 ) ) ( not ( = ?auto_389131 ?auto_389135 ) ) ( not ( = ?auto_389131 ?auto_389134 ) ) ( not ( = ?auto_389131 ?auto_389136 ) ) ( not ( = ?auto_389131 ?auto_389137 ) ) ( not ( = ?auto_389131 ?auto_389138 ) ) ( not ( = ?auto_389131 ?auto_389139 ) ) ( not ( = ?auto_389131 ?auto_389140 ) ) ( not ( = ?auto_389131 ?auto_389141 ) ) ( not ( = ?auto_389132 ?auto_389133 ) ) ( not ( = ?auto_389132 ?auto_389135 ) ) ( not ( = ?auto_389132 ?auto_389134 ) ) ( not ( = ?auto_389132 ?auto_389136 ) ) ( not ( = ?auto_389132 ?auto_389137 ) ) ( not ( = ?auto_389132 ?auto_389138 ) ) ( not ( = ?auto_389132 ?auto_389139 ) ) ( not ( = ?auto_389132 ?auto_389140 ) ) ( not ( = ?auto_389132 ?auto_389141 ) ) ( not ( = ?auto_389133 ?auto_389135 ) ) ( not ( = ?auto_389133 ?auto_389134 ) ) ( not ( = ?auto_389133 ?auto_389136 ) ) ( not ( = ?auto_389133 ?auto_389137 ) ) ( not ( = ?auto_389133 ?auto_389138 ) ) ( not ( = ?auto_389133 ?auto_389139 ) ) ( not ( = ?auto_389133 ?auto_389140 ) ) ( not ( = ?auto_389133 ?auto_389141 ) ) ( not ( = ?auto_389135 ?auto_389134 ) ) ( not ( = ?auto_389135 ?auto_389136 ) ) ( not ( = ?auto_389135 ?auto_389137 ) ) ( not ( = ?auto_389135 ?auto_389138 ) ) ( not ( = ?auto_389135 ?auto_389139 ) ) ( not ( = ?auto_389135 ?auto_389140 ) ) ( not ( = ?auto_389135 ?auto_389141 ) ) ( not ( = ?auto_389134 ?auto_389136 ) ) ( not ( = ?auto_389134 ?auto_389137 ) ) ( not ( = ?auto_389134 ?auto_389138 ) ) ( not ( = ?auto_389134 ?auto_389139 ) ) ( not ( = ?auto_389134 ?auto_389140 ) ) ( not ( = ?auto_389134 ?auto_389141 ) ) ( not ( = ?auto_389136 ?auto_389137 ) ) ( not ( = ?auto_389136 ?auto_389138 ) ) ( not ( = ?auto_389136 ?auto_389139 ) ) ( not ( = ?auto_389136 ?auto_389140 ) ) ( not ( = ?auto_389136 ?auto_389141 ) ) ( not ( = ?auto_389137 ?auto_389138 ) ) ( not ( = ?auto_389137 ?auto_389139 ) ) ( not ( = ?auto_389137 ?auto_389140 ) ) ( not ( = ?auto_389137 ?auto_389141 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_389138 ?auto_389139 ?auto_389140 )
      ( MAKE-9CRATE-VERIFY ?auto_389131 ?auto_389132 ?auto_389133 ?auto_389135 ?auto_389134 ?auto_389136 ?auto_389137 ?auto_389138 ?auto_389139 ?auto_389140 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_389240 - SURFACE
      ?auto_389241 - SURFACE
      ?auto_389242 - SURFACE
      ?auto_389244 - SURFACE
      ?auto_389243 - SURFACE
      ?auto_389245 - SURFACE
      ?auto_389246 - SURFACE
      ?auto_389247 - SURFACE
      ?auto_389248 - SURFACE
      ?auto_389249 - SURFACE
    )
    :vars
    (
      ?auto_389250 - HOIST
      ?auto_389251 - PLACE
      ?auto_389252 - PLACE
      ?auto_389254 - HOIST
      ?auto_389253 - SURFACE
      ?auto_389255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_389250 ?auto_389251 ) ( IS-CRATE ?auto_389249 ) ( not ( = ?auto_389248 ?auto_389249 ) ) ( not ( = ?auto_389247 ?auto_389248 ) ) ( not ( = ?auto_389247 ?auto_389249 ) ) ( not ( = ?auto_389252 ?auto_389251 ) ) ( HOIST-AT ?auto_389254 ?auto_389252 ) ( not ( = ?auto_389250 ?auto_389254 ) ) ( AVAILABLE ?auto_389254 ) ( SURFACE-AT ?auto_389249 ?auto_389252 ) ( ON ?auto_389249 ?auto_389253 ) ( CLEAR ?auto_389249 ) ( not ( = ?auto_389248 ?auto_389253 ) ) ( not ( = ?auto_389249 ?auto_389253 ) ) ( not ( = ?auto_389247 ?auto_389253 ) ) ( TRUCK-AT ?auto_389255 ?auto_389251 ) ( SURFACE-AT ?auto_389247 ?auto_389251 ) ( CLEAR ?auto_389247 ) ( LIFTING ?auto_389250 ?auto_389248 ) ( IS-CRATE ?auto_389248 ) ( ON ?auto_389241 ?auto_389240 ) ( ON ?auto_389242 ?auto_389241 ) ( ON ?auto_389244 ?auto_389242 ) ( ON ?auto_389243 ?auto_389244 ) ( ON ?auto_389245 ?auto_389243 ) ( ON ?auto_389246 ?auto_389245 ) ( ON ?auto_389247 ?auto_389246 ) ( not ( = ?auto_389240 ?auto_389241 ) ) ( not ( = ?auto_389240 ?auto_389242 ) ) ( not ( = ?auto_389240 ?auto_389244 ) ) ( not ( = ?auto_389240 ?auto_389243 ) ) ( not ( = ?auto_389240 ?auto_389245 ) ) ( not ( = ?auto_389240 ?auto_389246 ) ) ( not ( = ?auto_389240 ?auto_389247 ) ) ( not ( = ?auto_389240 ?auto_389248 ) ) ( not ( = ?auto_389240 ?auto_389249 ) ) ( not ( = ?auto_389240 ?auto_389253 ) ) ( not ( = ?auto_389241 ?auto_389242 ) ) ( not ( = ?auto_389241 ?auto_389244 ) ) ( not ( = ?auto_389241 ?auto_389243 ) ) ( not ( = ?auto_389241 ?auto_389245 ) ) ( not ( = ?auto_389241 ?auto_389246 ) ) ( not ( = ?auto_389241 ?auto_389247 ) ) ( not ( = ?auto_389241 ?auto_389248 ) ) ( not ( = ?auto_389241 ?auto_389249 ) ) ( not ( = ?auto_389241 ?auto_389253 ) ) ( not ( = ?auto_389242 ?auto_389244 ) ) ( not ( = ?auto_389242 ?auto_389243 ) ) ( not ( = ?auto_389242 ?auto_389245 ) ) ( not ( = ?auto_389242 ?auto_389246 ) ) ( not ( = ?auto_389242 ?auto_389247 ) ) ( not ( = ?auto_389242 ?auto_389248 ) ) ( not ( = ?auto_389242 ?auto_389249 ) ) ( not ( = ?auto_389242 ?auto_389253 ) ) ( not ( = ?auto_389244 ?auto_389243 ) ) ( not ( = ?auto_389244 ?auto_389245 ) ) ( not ( = ?auto_389244 ?auto_389246 ) ) ( not ( = ?auto_389244 ?auto_389247 ) ) ( not ( = ?auto_389244 ?auto_389248 ) ) ( not ( = ?auto_389244 ?auto_389249 ) ) ( not ( = ?auto_389244 ?auto_389253 ) ) ( not ( = ?auto_389243 ?auto_389245 ) ) ( not ( = ?auto_389243 ?auto_389246 ) ) ( not ( = ?auto_389243 ?auto_389247 ) ) ( not ( = ?auto_389243 ?auto_389248 ) ) ( not ( = ?auto_389243 ?auto_389249 ) ) ( not ( = ?auto_389243 ?auto_389253 ) ) ( not ( = ?auto_389245 ?auto_389246 ) ) ( not ( = ?auto_389245 ?auto_389247 ) ) ( not ( = ?auto_389245 ?auto_389248 ) ) ( not ( = ?auto_389245 ?auto_389249 ) ) ( not ( = ?auto_389245 ?auto_389253 ) ) ( not ( = ?auto_389246 ?auto_389247 ) ) ( not ( = ?auto_389246 ?auto_389248 ) ) ( not ( = ?auto_389246 ?auto_389249 ) ) ( not ( = ?auto_389246 ?auto_389253 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_389247 ?auto_389248 ?auto_389249 )
      ( MAKE-9CRATE-VERIFY ?auto_389240 ?auto_389241 ?auto_389242 ?auto_389244 ?auto_389243 ?auto_389245 ?auto_389246 ?auto_389247 ?auto_389248 ?auto_389249 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_389349 - SURFACE
      ?auto_389350 - SURFACE
      ?auto_389351 - SURFACE
      ?auto_389353 - SURFACE
      ?auto_389352 - SURFACE
      ?auto_389354 - SURFACE
      ?auto_389355 - SURFACE
      ?auto_389356 - SURFACE
      ?auto_389357 - SURFACE
      ?auto_389358 - SURFACE
    )
    :vars
    (
      ?auto_389359 - HOIST
      ?auto_389363 - PLACE
      ?auto_389362 - PLACE
      ?auto_389361 - HOIST
      ?auto_389364 - SURFACE
      ?auto_389360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_389359 ?auto_389363 ) ( IS-CRATE ?auto_389358 ) ( not ( = ?auto_389357 ?auto_389358 ) ) ( not ( = ?auto_389356 ?auto_389357 ) ) ( not ( = ?auto_389356 ?auto_389358 ) ) ( not ( = ?auto_389362 ?auto_389363 ) ) ( HOIST-AT ?auto_389361 ?auto_389362 ) ( not ( = ?auto_389359 ?auto_389361 ) ) ( AVAILABLE ?auto_389361 ) ( SURFACE-AT ?auto_389358 ?auto_389362 ) ( ON ?auto_389358 ?auto_389364 ) ( CLEAR ?auto_389358 ) ( not ( = ?auto_389357 ?auto_389364 ) ) ( not ( = ?auto_389358 ?auto_389364 ) ) ( not ( = ?auto_389356 ?auto_389364 ) ) ( TRUCK-AT ?auto_389360 ?auto_389363 ) ( SURFACE-AT ?auto_389356 ?auto_389363 ) ( CLEAR ?auto_389356 ) ( IS-CRATE ?auto_389357 ) ( AVAILABLE ?auto_389359 ) ( IN ?auto_389357 ?auto_389360 ) ( ON ?auto_389350 ?auto_389349 ) ( ON ?auto_389351 ?auto_389350 ) ( ON ?auto_389353 ?auto_389351 ) ( ON ?auto_389352 ?auto_389353 ) ( ON ?auto_389354 ?auto_389352 ) ( ON ?auto_389355 ?auto_389354 ) ( ON ?auto_389356 ?auto_389355 ) ( not ( = ?auto_389349 ?auto_389350 ) ) ( not ( = ?auto_389349 ?auto_389351 ) ) ( not ( = ?auto_389349 ?auto_389353 ) ) ( not ( = ?auto_389349 ?auto_389352 ) ) ( not ( = ?auto_389349 ?auto_389354 ) ) ( not ( = ?auto_389349 ?auto_389355 ) ) ( not ( = ?auto_389349 ?auto_389356 ) ) ( not ( = ?auto_389349 ?auto_389357 ) ) ( not ( = ?auto_389349 ?auto_389358 ) ) ( not ( = ?auto_389349 ?auto_389364 ) ) ( not ( = ?auto_389350 ?auto_389351 ) ) ( not ( = ?auto_389350 ?auto_389353 ) ) ( not ( = ?auto_389350 ?auto_389352 ) ) ( not ( = ?auto_389350 ?auto_389354 ) ) ( not ( = ?auto_389350 ?auto_389355 ) ) ( not ( = ?auto_389350 ?auto_389356 ) ) ( not ( = ?auto_389350 ?auto_389357 ) ) ( not ( = ?auto_389350 ?auto_389358 ) ) ( not ( = ?auto_389350 ?auto_389364 ) ) ( not ( = ?auto_389351 ?auto_389353 ) ) ( not ( = ?auto_389351 ?auto_389352 ) ) ( not ( = ?auto_389351 ?auto_389354 ) ) ( not ( = ?auto_389351 ?auto_389355 ) ) ( not ( = ?auto_389351 ?auto_389356 ) ) ( not ( = ?auto_389351 ?auto_389357 ) ) ( not ( = ?auto_389351 ?auto_389358 ) ) ( not ( = ?auto_389351 ?auto_389364 ) ) ( not ( = ?auto_389353 ?auto_389352 ) ) ( not ( = ?auto_389353 ?auto_389354 ) ) ( not ( = ?auto_389353 ?auto_389355 ) ) ( not ( = ?auto_389353 ?auto_389356 ) ) ( not ( = ?auto_389353 ?auto_389357 ) ) ( not ( = ?auto_389353 ?auto_389358 ) ) ( not ( = ?auto_389353 ?auto_389364 ) ) ( not ( = ?auto_389352 ?auto_389354 ) ) ( not ( = ?auto_389352 ?auto_389355 ) ) ( not ( = ?auto_389352 ?auto_389356 ) ) ( not ( = ?auto_389352 ?auto_389357 ) ) ( not ( = ?auto_389352 ?auto_389358 ) ) ( not ( = ?auto_389352 ?auto_389364 ) ) ( not ( = ?auto_389354 ?auto_389355 ) ) ( not ( = ?auto_389354 ?auto_389356 ) ) ( not ( = ?auto_389354 ?auto_389357 ) ) ( not ( = ?auto_389354 ?auto_389358 ) ) ( not ( = ?auto_389354 ?auto_389364 ) ) ( not ( = ?auto_389355 ?auto_389356 ) ) ( not ( = ?auto_389355 ?auto_389357 ) ) ( not ( = ?auto_389355 ?auto_389358 ) ) ( not ( = ?auto_389355 ?auto_389364 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_389356 ?auto_389357 ?auto_389358 )
      ( MAKE-9CRATE-VERIFY ?auto_389349 ?auto_389350 ?auto_389351 ?auto_389353 ?auto_389352 ?auto_389354 ?auto_389355 ?auto_389356 ?auto_389357 ?auto_389358 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_394914 - SURFACE
      ?auto_394915 - SURFACE
      ?auto_394916 - SURFACE
      ?auto_394918 - SURFACE
      ?auto_394917 - SURFACE
      ?auto_394919 - SURFACE
      ?auto_394920 - SURFACE
      ?auto_394921 - SURFACE
      ?auto_394922 - SURFACE
      ?auto_394923 - SURFACE
      ?auto_394924 - SURFACE
    )
    :vars
    (
      ?auto_394926 - HOIST
      ?auto_394925 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_394926 ?auto_394925 ) ( SURFACE-AT ?auto_394923 ?auto_394925 ) ( CLEAR ?auto_394923 ) ( LIFTING ?auto_394926 ?auto_394924 ) ( IS-CRATE ?auto_394924 ) ( not ( = ?auto_394923 ?auto_394924 ) ) ( ON ?auto_394915 ?auto_394914 ) ( ON ?auto_394916 ?auto_394915 ) ( ON ?auto_394918 ?auto_394916 ) ( ON ?auto_394917 ?auto_394918 ) ( ON ?auto_394919 ?auto_394917 ) ( ON ?auto_394920 ?auto_394919 ) ( ON ?auto_394921 ?auto_394920 ) ( ON ?auto_394922 ?auto_394921 ) ( ON ?auto_394923 ?auto_394922 ) ( not ( = ?auto_394914 ?auto_394915 ) ) ( not ( = ?auto_394914 ?auto_394916 ) ) ( not ( = ?auto_394914 ?auto_394918 ) ) ( not ( = ?auto_394914 ?auto_394917 ) ) ( not ( = ?auto_394914 ?auto_394919 ) ) ( not ( = ?auto_394914 ?auto_394920 ) ) ( not ( = ?auto_394914 ?auto_394921 ) ) ( not ( = ?auto_394914 ?auto_394922 ) ) ( not ( = ?auto_394914 ?auto_394923 ) ) ( not ( = ?auto_394914 ?auto_394924 ) ) ( not ( = ?auto_394915 ?auto_394916 ) ) ( not ( = ?auto_394915 ?auto_394918 ) ) ( not ( = ?auto_394915 ?auto_394917 ) ) ( not ( = ?auto_394915 ?auto_394919 ) ) ( not ( = ?auto_394915 ?auto_394920 ) ) ( not ( = ?auto_394915 ?auto_394921 ) ) ( not ( = ?auto_394915 ?auto_394922 ) ) ( not ( = ?auto_394915 ?auto_394923 ) ) ( not ( = ?auto_394915 ?auto_394924 ) ) ( not ( = ?auto_394916 ?auto_394918 ) ) ( not ( = ?auto_394916 ?auto_394917 ) ) ( not ( = ?auto_394916 ?auto_394919 ) ) ( not ( = ?auto_394916 ?auto_394920 ) ) ( not ( = ?auto_394916 ?auto_394921 ) ) ( not ( = ?auto_394916 ?auto_394922 ) ) ( not ( = ?auto_394916 ?auto_394923 ) ) ( not ( = ?auto_394916 ?auto_394924 ) ) ( not ( = ?auto_394918 ?auto_394917 ) ) ( not ( = ?auto_394918 ?auto_394919 ) ) ( not ( = ?auto_394918 ?auto_394920 ) ) ( not ( = ?auto_394918 ?auto_394921 ) ) ( not ( = ?auto_394918 ?auto_394922 ) ) ( not ( = ?auto_394918 ?auto_394923 ) ) ( not ( = ?auto_394918 ?auto_394924 ) ) ( not ( = ?auto_394917 ?auto_394919 ) ) ( not ( = ?auto_394917 ?auto_394920 ) ) ( not ( = ?auto_394917 ?auto_394921 ) ) ( not ( = ?auto_394917 ?auto_394922 ) ) ( not ( = ?auto_394917 ?auto_394923 ) ) ( not ( = ?auto_394917 ?auto_394924 ) ) ( not ( = ?auto_394919 ?auto_394920 ) ) ( not ( = ?auto_394919 ?auto_394921 ) ) ( not ( = ?auto_394919 ?auto_394922 ) ) ( not ( = ?auto_394919 ?auto_394923 ) ) ( not ( = ?auto_394919 ?auto_394924 ) ) ( not ( = ?auto_394920 ?auto_394921 ) ) ( not ( = ?auto_394920 ?auto_394922 ) ) ( not ( = ?auto_394920 ?auto_394923 ) ) ( not ( = ?auto_394920 ?auto_394924 ) ) ( not ( = ?auto_394921 ?auto_394922 ) ) ( not ( = ?auto_394921 ?auto_394923 ) ) ( not ( = ?auto_394921 ?auto_394924 ) ) ( not ( = ?auto_394922 ?auto_394923 ) ) ( not ( = ?auto_394922 ?auto_394924 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_394923 ?auto_394924 )
      ( MAKE-10CRATE-VERIFY ?auto_394914 ?auto_394915 ?auto_394916 ?auto_394918 ?auto_394917 ?auto_394919 ?auto_394920 ?auto_394921 ?auto_394922 ?auto_394923 ?auto_394924 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_395008 - SURFACE
      ?auto_395009 - SURFACE
      ?auto_395010 - SURFACE
      ?auto_395012 - SURFACE
      ?auto_395011 - SURFACE
      ?auto_395013 - SURFACE
      ?auto_395014 - SURFACE
      ?auto_395015 - SURFACE
      ?auto_395016 - SURFACE
      ?auto_395017 - SURFACE
      ?auto_395018 - SURFACE
    )
    :vars
    (
      ?auto_395019 - HOIST
      ?auto_395021 - PLACE
      ?auto_395020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_395019 ?auto_395021 ) ( SURFACE-AT ?auto_395017 ?auto_395021 ) ( CLEAR ?auto_395017 ) ( IS-CRATE ?auto_395018 ) ( not ( = ?auto_395017 ?auto_395018 ) ) ( TRUCK-AT ?auto_395020 ?auto_395021 ) ( AVAILABLE ?auto_395019 ) ( IN ?auto_395018 ?auto_395020 ) ( ON ?auto_395017 ?auto_395016 ) ( not ( = ?auto_395016 ?auto_395017 ) ) ( not ( = ?auto_395016 ?auto_395018 ) ) ( ON ?auto_395009 ?auto_395008 ) ( ON ?auto_395010 ?auto_395009 ) ( ON ?auto_395012 ?auto_395010 ) ( ON ?auto_395011 ?auto_395012 ) ( ON ?auto_395013 ?auto_395011 ) ( ON ?auto_395014 ?auto_395013 ) ( ON ?auto_395015 ?auto_395014 ) ( ON ?auto_395016 ?auto_395015 ) ( not ( = ?auto_395008 ?auto_395009 ) ) ( not ( = ?auto_395008 ?auto_395010 ) ) ( not ( = ?auto_395008 ?auto_395012 ) ) ( not ( = ?auto_395008 ?auto_395011 ) ) ( not ( = ?auto_395008 ?auto_395013 ) ) ( not ( = ?auto_395008 ?auto_395014 ) ) ( not ( = ?auto_395008 ?auto_395015 ) ) ( not ( = ?auto_395008 ?auto_395016 ) ) ( not ( = ?auto_395008 ?auto_395017 ) ) ( not ( = ?auto_395008 ?auto_395018 ) ) ( not ( = ?auto_395009 ?auto_395010 ) ) ( not ( = ?auto_395009 ?auto_395012 ) ) ( not ( = ?auto_395009 ?auto_395011 ) ) ( not ( = ?auto_395009 ?auto_395013 ) ) ( not ( = ?auto_395009 ?auto_395014 ) ) ( not ( = ?auto_395009 ?auto_395015 ) ) ( not ( = ?auto_395009 ?auto_395016 ) ) ( not ( = ?auto_395009 ?auto_395017 ) ) ( not ( = ?auto_395009 ?auto_395018 ) ) ( not ( = ?auto_395010 ?auto_395012 ) ) ( not ( = ?auto_395010 ?auto_395011 ) ) ( not ( = ?auto_395010 ?auto_395013 ) ) ( not ( = ?auto_395010 ?auto_395014 ) ) ( not ( = ?auto_395010 ?auto_395015 ) ) ( not ( = ?auto_395010 ?auto_395016 ) ) ( not ( = ?auto_395010 ?auto_395017 ) ) ( not ( = ?auto_395010 ?auto_395018 ) ) ( not ( = ?auto_395012 ?auto_395011 ) ) ( not ( = ?auto_395012 ?auto_395013 ) ) ( not ( = ?auto_395012 ?auto_395014 ) ) ( not ( = ?auto_395012 ?auto_395015 ) ) ( not ( = ?auto_395012 ?auto_395016 ) ) ( not ( = ?auto_395012 ?auto_395017 ) ) ( not ( = ?auto_395012 ?auto_395018 ) ) ( not ( = ?auto_395011 ?auto_395013 ) ) ( not ( = ?auto_395011 ?auto_395014 ) ) ( not ( = ?auto_395011 ?auto_395015 ) ) ( not ( = ?auto_395011 ?auto_395016 ) ) ( not ( = ?auto_395011 ?auto_395017 ) ) ( not ( = ?auto_395011 ?auto_395018 ) ) ( not ( = ?auto_395013 ?auto_395014 ) ) ( not ( = ?auto_395013 ?auto_395015 ) ) ( not ( = ?auto_395013 ?auto_395016 ) ) ( not ( = ?auto_395013 ?auto_395017 ) ) ( not ( = ?auto_395013 ?auto_395018 ) ) ( not ( = ?auto_395014 ?auto_395015 ) ) ( not ( = ?auto_395014 ?auto_395016 ) ) ( not ( = ?auto_395014 ?auto_395017 ) ) ( not ( = ?auto_395014 ?auto_395018 ) ) ( not ( = ?auto_395015 ?auto_395016 ) ) ( not ( = ?auto_395015 ?auto_395017 ) ) ( not ( = ?auto_395015 ?auto_395018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_395016 ?auto_395017 ?auto_395018 )
      ( MAKE-10CRATE-VERIFY ?auto_395008 ?auto_395009 ?auto_395010 ?auto_395012 ?auto_395011 ?auto_395013 ?auto_395014 ?auto_395015 ?auto_395016 ?auto_395017 ?auto_395018 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_395113 - SURFACE
      ?auto_395114 - SURFACE
      ?auto_395115 - SURFACE
      ?auto_395117 - SURFACE
      ?auto_395116 - SURFACE
      ?auto_395118 - SURFACE
      ?auto_395119 - SURFACE
      ?auto_395120 - SURFACE
      ?auto_395121 - SURFACE
      ?auto_395122 - SURFACE
      ?auto_395123 - SURFACE
    )
    :vars
    (
      ?auto_395126 - HOIST
      ?auto_395125 - PLACE
      ?auto_395127 - TRUCK
      ?auto_395124 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_395126 ?auto_395125 ) ( SURFACE-AT ?auto_395122 ?auto_395125 ) ( CLEAR ?auto_395122 ) ( IS-CRATE ?auto_395123 ) ( not ( = ?auto_395122 ?auto_395123 ) ) ( AVAILABLE ?auto_395126 ) ( IN ?auto_395123 ?auto_395127 ) ( ON ?auto_395122 ?auto_395121 ) ( not ( = ?auto_395121 ?auto_395122 ) ) ( not ( = ?auto_395121 ?auto_395123 ) ) ( TRUCK-AT ?auto_395127 ?auto_395124 ) ( not ( = ?auto_395124 ?auto_395125 ) ) ( ON ?auto_395114 ?auto_395113 ) ( ON ?auto_395115 ?auto_395114 ) ( ON ?auto_395117 ?auto_395115 ) ( ON ?auto_395116 ?auto_395117 ) ( ON ?auto_395118 ?auto_395116 ) ( ON ?auto_395119 ?auto_395118 ) ( ON ?auto_395120 ?auto_395119 ) ( ON ?auto_395121 ?auto_395120 ) ( not ( = ?auto_395113 ?auto_395114 ) ) ( not ( = ?auto_395113 ?auto_395115 ) ) ( not ( = ?auto_395113 ?auto_395117 ) ) ( not ( = ?auto_395113 ?auto_395116 ) ) ( not ( = ?auto_395113 ?auto_395118 ) ) ( not ( = ?auto_395113 ?auto_395119 ) ) ( not ( = ?auto_395113 ?auto_395120 ) ) ( not ( = ?auto_395113 ?auto_395121 ) ) ( not ( = ?auto_395113 ?auto_395122 ) ) ( not ( = ?auto_395113 ?auto_395123 ) ) ( not ( = ?auto_395114 ?auto_395115 ) ) ( not ( = ?auto_395114 ?auto_395117 ) ) ( not ( = ?auto_395114 ?auto_395116 ) ) ( not ( = ?auto_395114 ?auto_395118 ) ) ( not ( = ?auto_395114 ?auto_395119 ) ) ( not ( = ?auto_395114 ?auto_395120 ) ) ( not ( = ?auto_395114 ?auto_395121 ) ) ( not ( = ?auto_395114 ?auto_395122 ) ) ( not ( = ?auto_395114 ?auto_395123 ) ) ( not ( = ?auto_395115 ?auto_395117 ) ) ( not ( = ?auto_395115 ?auto_395116 ) ) ( not ( = ?auto_395115 ?auto_395118 ) ) ( not ( = ?auto_395115 ?auto_395119 ) ) ( not ( = ?auto_395115 ?auto_395120 ) ) ( not ( = ?auto_395115 ?auto_395121 ) ) ( not ( = ?auto_395115 ?auto_395122 ) ) ( not ( = ?auto_395115 ?auto_395123 ) ) ( not ( = ?auto_395117 ?auto_395116 ) ) ( not ( = ?auto_395117 ?auto_395118 ) ) ( not ( = ?auto_395117 ?auto_395119 ) ) ( not ( = ?auto_395117 ?auto_395120 ) ) ( not ( = ?auto_395117 ?auto_395121 ) ) ( not ( = ?auto_395117 ?auto_395122 ) ) ( not ( = ?auto_395117 ?auto_395123 ) ) ( not ( = ?auto_395116 ?auto_395118 ) ) ( not ( = ?auto_395116 ?auto_395119 ) ) ( not ( = ?auto_395116 ?auto_395120 ) ) ( not ( = ?auto_395116 ?auto_395121 ) ) ( not ( = ?auto_395116 ?auto_395122 ) ) ( not ( = ?auto_395116 ?auto_395123 ) ) ( not ( = ?auto_395118 ?auto_395119 ) ) ( not ( = ?auto_395118 ?auto_395120 ) ) ( not ( = ?auto_395118 ?auto_395121 ) ) ( not ( = ?auto_395118 ?auto_395122 ) ) ( not ( = ?auto_395118 ?auto_395123 ) ) ( not ( = ?auto_395119 ?auto_395120 ) ) ( not ( = ?auto_395119 ?auto_395121 ) ) ( not ( = ?auto_395119 ?auto_395122 ) ) ( not ( = ?auto_395119 ?auto_395123 ) ) ( not ( = ?auto_395120 ?auto_395121 ) ) ( not ( = ?auto_395120 ?auto_395122 ) ) ( not ( = ?auto_395120 ?auto_395123 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_395121 ?auto_395122 ?auto_395123 )
      ( MAKE-10CRATE-VERIFY ?auto_395113 ?auto_395114 ?auto_395115 ?auto_395117 ?auto_395116 ?auto_395118 ?auto_395119 ?auto_395120 ?auto_395121 ?auto_395122 ?auto_395123 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_395228 - SURFACE
      ?auto_395229 - SURFACE
      ?auto_395230 - SURFACE
      ?auto_395232 - SURFACE
      ?auto_395231 - SURFACE
      ?auto_395233 - SURFACE
      ?auto_395234 - SURFACE
      ?auto_395235 - SURFACE
      ?auto_395236 - SURFACE
      ?auto_395237 - SURFACE
      ?auto_395238 - SURFACE
    )
    :vars
    (
      ?auto_395242 - HOIST
      ?auto_395239 - PLACE
      ?auto_395241 - TRUCK
      ?auto_395243 - PLACE
      ?auto_395240 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_395242 ?auto_395239 ) ( SURFACE-AT ?auto_395237 ?auto_395239 ) ( CLEAR ?auto_395237 ) ( IS-CRATE ?auto_395238 ) ( not ( = ?auto_395237 ?auto_395238 ) ) ( AVAILABLE ?auto_395242 ) ( ON ?auto_395237 ?auto_395236 ) ( not ( = ?auto_395236 ?auto_395237 ) ) ( not ( = ?auto_395236 ?auto_395238 ) ) ( TRUCK-AT ?auto_395241 ?auto_395243 ) ( not ( = ?auto_395243 ?auto_395239 ) ) ( HOIST-AT ?auto_395240 ?auto_395243 ) ( LIFTING ?auto_395240 ?auto_395238 ) ( not ( = ?auto_395242 ?auto_395240 ) ) ( ON ?auto_395229 ?auto_395228 ) ( ON ?auto_395230 ?auto_395229 ) ( ON ?auto_395232 ?auto_395230 ) ( ON ?auto_395231 ?auto_395232 ) ( ON ?auto_395233 ?auto_395231 ) ( ON ?auto_395234 ?auto_395233 ) ( ON ?auto_395235 ?auto_395234 ) ( ON ?auto_395236 ?auto_395235 ) ( not ( = ?auto_395228 ?auto_395229 ) ) ( not ( = ?auto_395228 ?auto_395230 ) ) ( not ( = ?auto_395228 ?auto_395232 ) ) ( not ( = ?auto_395228 ?auto_395231 ) ) ( not ( = ?auto_395228 ?auto_395233 ) ) ( not ( = ?auto_395228 ?auto_395234 ) ) ( not ( = ?auto_395228 ?auto_395235 ) ) ( not ( = ?auto_395228 ?auto_395236 ) ) ( not ( = ?auto_395228 ?auto_395237 ) ) ( not ( = ?auto_395228 ?auto_395238 ) ) ( not ( = ?auto_395229 ?auto_395230 ) ) ( not ( = ?auto_395229 ?auto_395232 ) ) ( not ( = ?auto_395229 ?auto_395231 ) ) ( not ( = ?auto_395229 ?auto_395233 ) ) ( not ( = ?auto_395229 ?auto_395234 ) ) ( not ( = ?auto_395229 ?auto_395235 ) ) ( not ( = ?auto_395229 ?auto_395236 ) ) ( not ( = ?auto_395229 ?auto_395237 ) ) ( not ( = ?auto_395229 ?auto_395238 ) ) ( not ( = ?auto_395230 ?auto_395232 ) ) ( not ( = ?auto_395230 ?auto_395231 ) ) ( not ( = ?auto_395230 ?auto_395233 ) ) ( not ( = ?auto_395230 ?auto_395234 ) ) ( not ( = ?auto_395230 ?auto_395235 ) ) ( not ( = ?auto_395230 ?auto_395236 ) ) ( not ( = ?auto_395230 ?auto_395237 ) ) ( not ( = ?auto_395230 ?auto_395238 ) ) ( not ( = ?auto_395232 ?auto_395231 ) ) ( not ( = ?auto_395232 ?auto_395233 ) ) ( not ( = ?auto_395232 ?auto_395234 ) ) ( not ( = ?auto_395232 ?auto_395235 ) ) ( not ( = ?auto_395232 ?auto_395236 ) ) ( not ( = ?auto_395232 ?auto_395237 ) ) ( not ( = ?auto_395232 ?auto_395238 ) ) ( not ( = ?auto_395231 ?auto_395233 ) ) ( not ( = ?auto_395231 ?auto_395234 ) ) ( not ( = ?auto_395231 ?auto_395235 ) ) ( not ( = ?auto_395231 ?auto_395236 ) ) ( not ( = ?auto_395231 ?auto_395237 ) ) ( not ( = ?auto_395231 ?auto_395238 ) ) ( not ( = ?auto_395233 ?auto_395234 ) ) ( not ( = ?auto_395233 ?auto_395235 ) ) ( not ( = ?auto_395233 ?auto_395236 ) ) ( not ( = ?auto_395233 ?auto_395237 ) ) ( not ( = ?auto_395233 ?auto_395238 ) ) ( not ( = ?auto_395234 ?auto_395235 ) ) ( not ( = ?auto_395234 ?auto_395236 ) ) ( not ( = ?auto_395234 ?auto_395237 ) ) ( not ( = ?auto_395234 ?auto_395238 ) ) ( not ( = ?auto_395235 ?auto_395236 ) ) ( not ( = ?auto_395235 ?auto_395237 ) ) ( not ( = ?auto_395235 ?auto_395238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_395236 ?auto_395237 ?auto_395238 )
      ( MAKE-10CRATE-VERIFY ?auto_395228 ?auto_395229 ?auto_395230 ?auto_395232 ?auto_395231 ?auto_395233 ?auto_395234 ?auto_395235 ?auto_395236 ?auto_395237 ?auto_395238 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_395353 - SURFACE
      ?auto_395354 - SURFACE
      ?auto_395355 - SURFACE
      ?auto_395357 - SURFACE
      ?auto_395356 - SURFACE
      ?auto_395358 - SURFACE
      ?auto_395359 - SURFACE
      ?auto_395360 - SURFACE
      ?auto_395361 - SURFACE
      ?auto_395362 - SURFACE
      ?auto_395363 - SURFACE
    )
    :vars
    (
      ?auto_395364 - HOIST
      ?auto_395369 - PLACE
      ?auto_395365 - TRUCK
      ?auto_395366 - PLACE
      ?auto_395368 - HOIST
      ?auto_395367 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_395364 ?auto_395369 ) ( SURFACE-AT ?auto_395362 ?auto_395369 ) ( CLEAR ?auto_395362 ) ( IS-CRATE ?auto_395363 ) ( not ( = ?auto_395362 ?auto_395363 ) ) ( AVAILABLE ?auto_395364 ) ( ON ?auto_395362 ?auto_395361 ) ( not ( = ?auto_395361 ?auto_395362 ) ) ( not ( = ?auto_395361 ?auto_395363 ) ) ( TRUCK-AT ?auto_395365 ?auto_395366 ) ( not ( = ?auto_395366 ?auto_395369 ) ) ( HOIST-AT ?auto_395368 ?auto_395366 ) ( not ( = ?auto_395364 ?auto_395368 ) ) ( AVAILABLE ?auto_395368 ) ( SURFACE-AT ?auto_395363 ?auto_395366 ) ( ON ?auto_395363 ?auto_395367 ) ( CLEAR ?auto_395363 ) ( not ( = ?auto_395362 ?auto_395367 ) ) ( not ( = ?auto_395363 ?auto_395367 ) ) ( not ( = ?auto_395361 ?auto_395367 ) ) ( ON ?auto_395354 ?auto_395353 ) ( ON ?auto_395355 ?auto_395354 ) ( ON ?auto_395357 ?auto_395355 ) ( ON ?auto_395356 ?auto_395357 ) ( ON ?auto_395358 ?auto_395356 ) ( ON ?auto_395359 ?auto_395358 ) ( ON ?auto_395360 ?auto_395359 ) ( ON ?auto_395361 ?auto_395360 ) ( not ( = ?auto_395353 ?auto_395354 ) ) ( not ( = ?auto_395353 ?auto_395355 ) ) ( not ( = ?auto_395353 ?auto_395357 ) ) ( not ( = ?auto_395353 ?auto_395356 ) ) ( not ( = ?auto_395353 ?auto_395358 ) ) ( not ( = ?auto_395353 ?auto_395359 ) ) ( not ( = ?auto_395353 ?auto_395360 ) ) ( not ( = ?auto_395353 ?auto_395361 ) ) ( not ( = ?auto_395353 ?auto_395362 ) ) ( not ( = ?auto_395353 ?auto_395363 ) ) ( not ( = ?auto_395353 ?auto_395367 ) ) ( not ( = ?auto_395354 ?auto_395355 ) ) ( not ( = ?auto_395354 ?auto_395357 ) ) ( not ( = ?auto_395354 ?auto_395356 ) ) ( not ( = ?auto_395354 ?auto_395358 ) ) ( not ( = ?auto_395354 ?auto_395359 ) ) ( not ( = ?auto_395354 ?auto_395360 ) ) ( not ( = ?auto_395354 ?auto_395361 ) ) ( not ( = ?auto_395354 ?auto_395362 ) ) ( not ( = ?auto_395354 ?auto_395363 ) ) ( not ( = ?auto_395354 ?auto_395367 ) ) ( not ( = ?auto_395355 ?auto_395357 ) ) ( not ( = ?auto_395355 ?auto_395356 ) ) ( not ( = ?auto_395355 ?auto_395358 ) ) ( not ( = ?auto_395355 ?auto_395359 ) ) ( not ( = ?auto_395355 ?auto_395360 ) ) ( not ( = ?auto_395355 ?auto_395361 ) ) ( not ( = ?auto_395355 ?auto_395362 ) ) ( not ( = ?auto_395355 ?auto_395363 ) ) ( not ( = ?auto_395355 ?auto_395367 ) ) ( not ( = ?auto_395357 ?auto_395356 ) ) ( not ( = ?auto_395357 ?auto_395358 ) ) ( not ( = ?auto_395357 ?auto_395359 ) ) ( not ( = ?auto_395357 ?auto_395360 ) ) ( not ( = ?auto_395357 ?auto_395361 ) ) ( not ( = ?auto_395357 ?auto_395362 ) ) ( not ( = ?auto_395357 ?auto_395363 ) ) ( not ( = ?auto_395357 ?auto_395367 ) ) ( not ( = ?auto_395356 ?auto_395358 ) ) ( not ( = ?auto_395356 ?auto_395359 ) ) ( not ( = ?auto_395356 ?auto_395360 ) ) ( not ( = ?auto_395356 ?auto_395361 ) ) ( not ( = ?auto_395356 ?auto_395362 ) ) ( not ( = ?auto_395356 ?auto_395363 ) ) ( not ( = ?auto_395356 ?auto_395367 ) ) ( not ( = ?auto_395358 ?auto_395359 ) ) ( not ( = ?auto_395358 ?auto_395360 ) ) ( not ( = ?auto_395358 ?auto_395361 ) ) ( not ( = ?auto_395358 ?auto_395362 ) ) ( not ( = ?auto_395358 ?auto_395363 ) ) ( not ( = ?auto_395358 ?auto_395367 ) ) ( not ( = ?auto_395359 ?auto_395360 ) ) ( not ( = ?auto_395359 ?auto_395361 ) ) ( not ( = ?auto_395359 ?auto_395362 ) ) ( not ( = ?auto_395359 ?auto_395363 ) ) ( not ( = ?auto_395359 ?auto_395367 ) ) ( not ( = ?auto_395360 ?auto_395361 ) ) ( not ( = ?auto_395360 ?auto_395362 ) ) ( not ( = ?auto_395360 ?auto_395363 ) ) ( not ( = ?auto_395360 ?auto_395367 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_395361 ?auto_395362 ?auto_395363 )
      ( MAKE-10CRATE-VERIFY ?auto_395353 ?auto_395354 ?auto_395355 ?auto_395357 ?auto_395356 ?auto_395358 ?auto_395359 ?auto_395360 ?auto_395361 ?auto_395362 ?auto_395363 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_395479 - SURFACE
      ?auto_395480 - SURFACE
      ?auto_395481 - SURFACE
      ?auto_395483 - SURFACE
      ?auto_395482 - SURFACE
      ?auto_395484 - SURFACE
      ?auto_395485 - SURFACE
      ?auto_395486 - SURFACE
      ?auto_395487 - SURFACE
      ?auto_395488 - SURFACE
      ?auto_395489 - SURFACE
    )
    :vars
    (
      ?auto_395493 - HOIST
      ?auto_395490 - PLACE
      ?auto_395491 - PLACE
      ?auto_395495 - HOIST
      ?auto_395492 - SURFACE
      ?auto_395494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_395493 ?auto_395490 ) ( SURFACE-AT ?auto_395488 ?auto_395490 ) ( CLEAR ?auto_395488 ) ( IS-CRATE ?auto_395489 ) ( not ( = ?auto_395488 ?auto_395489 ) ) ( AVAILABLE ?auto_395493 ) ( ON ?auto_395488 ?auto_395487 ) ( not ( = ?auto_395487 ?auto_395488 ) ) ( not ( = ?auto_395487 ?auto_395489 ) ) ( not ( = ?auto_395491 ?auto_395490 ) ) ( HOIST-AT ?auto_395495 ?auto_395491 ) ( not ( = ?auto_395493 ?auto_395495 ) ) ( AVAILABLE ?auto_395495 ) ( SURFACE-AT ?auto_395489 ?auto_395491 ) ( ON ?auto_395489 ?auto_395492 ) ( CLEAR ?auto_395489 ) ( not ( = ?auto_395488 ?auto_395492 ) ) ( not ( = ?auto_395489 ?auto_395492 ) ) ( not ( = ?auto_395487 ?auto_395492 ) ) ( TRUCK-AT ?auto_395494 ?auto_395490 ) ( ON ?auto_395480 ?auto_395479 ) ( ON ?auto_395481 ?auto_395480 ) ( ON ?auto_395483 ?auto_395481 ) ( ON ?auto_395482 ?auto_395483 ) ( ON ?auto_395484 ?auto_395482 ) ( ON ?auto_395485 ?auto_395484 ) ( ON ?auto_395486 ?auto_395485 ) ( ON ?auto_395487 ?auto_395486 ) ( not ( = ?auto_395479 ?auto_395480 ) ) ( not ( = ?auto_395479 ?auto_395481 ) ) ( not ( = ?auto_395479 ?auto_395483 ) ) ( not ( = ?auto_395479 ?auto_395482 ) ) ( not ( = ?auto_395479 ?auto_395484 ) ) ( not ( = ?auto_395479 ?auto_395485 ) ) ( not ( = ?auto_395479 ?auto_395486 ) ) ( not ( = ?auto_395479 ?auto_395487 ) ) ( not ( = ?auto_395479 ?auto_395488 ) ) ( not ( = ?auto_395479 ?auto_395489 ) ) ( not ( = ?auto_395479 ?auto_395492 ) ) ( not ( = ?auto_395480 ?auto_395481 ) ) ( not ( = ?auto_395480 ?auto_395483 ) ) ( not ( = ?auto_395480 ?auto_395482 ) ) ( not ( = ?auto_395480 ?auto_395484 ) ) ( not ( = ?auto_395480 ?auto_395485 ) ) ( not ( = ?auto_395480 ?auto_395486 ) ) ( not ( = ?auto_395480 ?auto_395487 ) ) ( not ( = ?auto_395480 ?auto_395488 ) ) ( not ( = ?auto_395480 ?auto_395489 ) ) ( not ( = ?auto_395480 ?auto_395492 ) ) ( not ( = ?auto_395481 ?auto_395483 ) ) ( not ( = ?auto_395481 ?auto_395482 ) ) ( not ( = ?auto_395481 ?auto_395484 ) ) ( not ( = ?auto_395481 ?auto_395485 ) ) ( not ( = ?auto_395481 ?auto_395486 ) ) ( not ( = ?auto_395481 ?auto_395487 ) ) ( not ( = ?auto_395481 ?auto_395488 ) ) ( not ( = ?auto_395481 ?auto_395489 ) ) ( not ( = ?auto_395481 ?auto_395492 ) ) ( not ( = ?auto_395483 ?auto_395482 ) ) ( not ( = ?auto_395483 ?auto_395484 ) ) ( not ( = ?auto_395483 ?auto_395485 ) ) ( not ( = ?auto_395483 ?auto_395486 ) ) ( not ( = ?auto_395483 ?auto_395487 ) ) ( not ( = ?auto_395483 ?auto_395488 ) ) ( not ( = ?auto_395483 ?auto_395489 ) ) ( not ( = ?auto_395483 ?auto_395492 ) ) ( not ( = ?auto_395482 ?auto_395484 ) ) ( not ( = ?auto_395482 ?auto_395485 ) ) ( not ( = ?auto_395482 ?auto_395486 ) ) ( not ( = ?auto_395482 ?auto_395487 ) ) ( not ( = ?auto_395482 ?auto_395488 ) ) ( not ( = ?auto_395482 ?auto_395489 ) ) ( not ( = ?auto_395482 ?auto_395492 ) ) ( not ( = ?auto_395484 ?auto_395485 ) ) ( not ( = ?auto_395484 ?auto_395486 ) ) ( not ( = ?auto_395484 ?auto_395487 ) ) ( not ( = ?auto_395484 ?auto_395488 ) ) ( not ( = ?auto_395484 ?auto_395489 ) ) ( not ( = ?auto_395484 ?auto_395492 ) ) ( not ( = ?auto_395485 ?auto_395486 ) ) ( not ( = ?auto_395485 ?auto_395487 ) ) ( not ( = ?auto_395485 ?auto_395488 ) ) ( not ( = ?auto_395485 ?auto_395489 ) ) ( not ( = ?auto_395485 ?auto_395492 ) ) ( not ( = ?auto_395486 ?auto_395487 ) ) ( not ( = ?auto_395486 ?auto_395488 ) ) ( not ( = ?auto_395486 ?auto_395489 ) ) ( not ( = ?auto_395486 ?auto_395492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_395487 ?auto_395488 ?auto_395489 )
      ( MAKE-10CRATE-VERIFY ?auto_395479 ?auto_395480 ?auto_395481 ?auto_395483 ?auto_395482 ?auto_395484 ?auto_395485 ?auto_395486 ?auto_395487 ?auto_395488 ?auto_395489 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_395605 - SURFACE
      ?auto_395606 - SURFACE
      ?auto_395607 - SURFACE
      ?auto_395609 - SURFACE
      ?auto_395608 - SURFACE
      ?auto_395610 - SURFACE
      ?auto_395611 - SURFACE
      ?auto_395612 - SURFACE
      ?auto_395613 - SURFACE
      ?auto_395614 - SURFACE
      ?auto_395615 - SURFACE
    )
    :vars
    (
      ?auto_395620 - HOIST
      ?auto_395616 - PLACE
      ?auto_395618 - PLACE
      ?auto_395619 - HOIST
      ?auto_395621 - SURFACE
      ?auto_395617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_395620 ?auto_395616 ) ( IS-CRATE ?auto_395615 ) ( not ( = ?auto_395614 ?auto_395615 ) ) ( not ( = ?auto_395613 ?auto_395614 ) ) ( not ( = ?auto_395613 ?auto_395615 ) ) ( not ( = ?auto_395618 ?auto_395616 ) ) ( HOIST-AT ?auto_395619 ?auto_395618 ) ( not ( = ?auto_395620 ?auto_395619 ) ) ( AVAILABLE ?auto_395619 ) ( SURFACE-AT ?auto_395615 ?auto_395618 ) ( ON ?auto_395615 ?auto_395621 ) ( CLEAR ?auto_395615 ) ( not ( = ?auto_395614 ?auto_395621 ) ) ( not ( = ?auto_395615 ?auto_395621 ) ) ( not ( = ?auto_395613 ?auto_395621 ) ) ( TRUCK-AT ?auto_395617 ?auto_395616 ) ( SURFACE-AT ?auto_395613 ?auto_395616 ) ( CLEAR ?auto_395613 ) ( LIFTING ?auto_395620 ?auto_395614 ) ( IS-CRATE ?auto_395614 ) ( ON ?auto_395606 ?auto_395605 ) ( ON ?auto_395607 ?auto_395606 ) ( ON ?auto_395609 ?auto_395607 ) ( ON ?auto_395608 ?auto_395609 ) ( ON ?auto_395610 ?auto_395608 ) ( ON ?auto_395611 ?auto_395610 ) ( ON ?auto_395612 ?auto_395611 ) ( ON ?auto_395613 ?auto_395612 ) ( not ( = ?auto_395605 ?auto_395606 ) ) ( not ( = ?auto_395605 ?auto_395607 ) ) ( not ( = ?auto_395605 ?auto_395609 ) ) ( not ( = ?auto_395605 ?auto_395608 ) ) ( not ( = ?auto_395605 ?auto_395610 ) ) ( not ( = ?auto_395605 ?auto_395611 ) ) ( not ( = ?auto_395605 ?auto_395612 ) ) ( not ( = ?auto_395605 ?auto_395613 ) ) ( not ( = ?auto_395605 ?auto_395614 ) ) ( not ( = ?auto_395605 ?auto_395615 ) ) ( not ( = ?auto_395605 ?auto_395621 ) ) ( not ( = ?auto_395606 ?auto_395607 ) ) ( not ( = ?auto_395606 ?auto_395609 ) ) ( not ( = ?auto_395606 ?auto_395608 ) ) ( not ( = ?auto_395606 ?auto_395610 ) ) ( not ( = ?auto_395606 ?auto_395611 ) ) ( not ( = ?auto_395606 ?auto_395612 ) ) ( not ( = ?auto_395606 ?auto_395613 ) ) ( not ( = ?auto_395606 ?auto_395614 ) ) ( not ( = ?auto_395606 ?auto_395615 ) ) ( not ( = ?auto_395606 ?auto_395621 ) ) ( not ( = ?auto_395607 ?auto_395609 ) ) ( not ( = ?auto_395607 ?auto_395608 ) ) ( not ( = ?auto_395607 ?auto_395610 ) ) ( not ( = ?auto_395607 ?auto_395611 ) ) ( not ( = ?auto_395607 ?auto_395612 ) ) ( not ( = ?auto_395607 ?auto_395613 ) ) ( not ( = ?auto_395607 ?auto_395614 ) ) ( not ( = ?auto_395607 ?auto_395615 ) ) ( not ( = ?auto_395607 ?auto_395621 ) ) ( not ( = ?auto_395609 ?auto_395608 ) ) ( not ( = ?auto_395609 ?auto_395610 ) ) ( not ( = ?auto_395609 ?auto_395611 ) ) ( not ( = ?auto_395609 ?auto_395612 ) ) ( not ( = ?auto_395609 ?auto_395613 ) ) ( not ( = ?auto_395609 ?auto_395614 ) ) ( not ( = ?auto_395609 ?auto_395615 ) ) ( not ( = ?auto_395609 ?auto_395621 ) ) ( not ( = ?auto_395608 ?auto_395610 ) ) ( not ( = ?auto_395608 ?auto_395611 ) ) ( not ( = ?auto_395608 ?auto_395612 ) ) ( not ( = ?auto_395608 ?auto_395613 ) ) ( not ( = ?auto_395608 ?auto_395614 ) ) ( not ( = ?auto_395608 ?auto_395615 ) ) ( not ( = ?auto_395608 ?auto_395621 ) ) ( not ( = ?auto_395610 ?auto_395611 ) ) ( not ( = ?auto_395610 ?auto_395612 ) ) ( not ( = ?auto_395610 ?auto_395613 ) ) ( not ( = ?auto_395610 ?auto_395614 ) ) ( not ( = ?auto_395610 ?auto_395615 ) ) ( not ( = ?auto_395610 ?auto_395621 ) ) ( not ( = ?auto_395611 ?auto_395612 ) ) ( not ( = ?auto_395611 ?auto_395613 ) ) ( not ( = ?auto_395611 ?auto_395614 ) ) ( not ( = ?auto_395611 ?auto_395615 ) ) ( not ( = ?auto_395611 ?auto_395621 ) ) ( not ( = ?auto_395612 ?auto_395613 ) ) ( not ( = ?auto_395612 ?auto_395614 ) ) ( not ( = ?auto_395612 ?auto_395615 ) ) ( not ( = ?auto_395612 ?auto_395621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_395613 ?auto_395614 ?auto_395615 )
      ( MAKE-10CRATE-VERIFY ?auto_395605 ?auto_395606 ?auto_395607 ?auto_395609 ?auto_395608 ?auto_395610 ?auto_395611 ?auto_395612 ?auto_395613 ?auto_395614 ?auto_395615 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_395731 - SURFACE
      ?auto_395732 - SURFACE
      ?auto_395733 - SURFACE
      ?auto_395735 - SURFACE
      ?auto_395734 - SURFACE
      ?auto_395736 - SURFACE
      ?auto_395737 - SURFACE
      ?auto_395738 - SURFACE
      ?auto_395739 - SURFACE
      ?auto_395740 - SURFACE
      ?auto_395741 - SURFACE
    )
    :vars
    (
      ?auto_395745 - HOIST
      ?auto_395744 - PLACE
      ?auto_395742 - PLACE
      ?auto_395747 - HOIST
      ?auto_395746 - SURFACE
      ?auto_395743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_395745 ?auto_395744 ) ( IS-CRATE ?auto_395741 ) ( not ( = ?auto_395740 ?auto_395741 ) ) ( not ( = ?auto_395739 ?auto_395740 ) ) ( not ( = ?auto_395739 ?auto_395741 ) ) ( not ( = ?auto_395742 ?auto_395744 ) ) ( HOIST-AT ?auto_395747 ?auto_395742 ) ( not ( = ?auto_395745 ?auto_395747 ) ) ( AVAILABLE ?auto_395747 ) ( SURFACE-AT ?auto_395741 ?auto_395742 ) ( ON ?auto_395741 ?auto_395746 ) ( CLEAR ?auto_395741 ) ( not ( = ?auto_395740 ?auto_395746 ) ) ( not ( = ?auto_395741 ?auto_395746 ) ) ( not ( = ?auto_395739 ?auto_395746 ) ) ( TRUCK-AT ?auto_395743 ?auto_395744 ) ( SURFACE-AT ?auto_395739 ?auto_395744 ) ( CLEAR ?auto_395739 ) ( IS-CRATE ?auto_395740 ) ( AVAILABLE ?auto_395745 ) ( IN ?auto_395740 ?auto_395743 ) ( ON ?auto_395732 ?auto_395731 ) ( ON ?auto_395733 ?auto_395732 ) ( ON ?auto_395735 ?auto_395733 ) ( ON ?auto_395734 ?auto_395735 ) ( ON ?auto_395736 ?auto_395734 ) ( ON ?auto_395737 ?auto_395736 ) ( ON ?auto_395738 ?auto_395737 ) ( ON ?auto_395739 ?auto_395738 ) ( not ( = ?auto_395731 ?auto_395732 ) ) ( not ( = ?auto_395731 ?auto_395733 ) ) ( not ( = ?auto_395731 ?auto_395735 ) ) ( not ( = ?auto_395731 ?auto_395734 ) ) ( not ( = ?auto_395731 ?auto_395736 ) ) ( not ( = ?auto_395731 ?auto_395737 ) ) ( not ( = ?auto_395731 ?auto_395738 ) ) ( not ( = ?auto_395731 ?auto_395739 ) ) ( not ( = ?auto_395731 ?auto_395740 ) ) ( not ( = ?auto_395731 ?auto_395741 ) ) ( not ( = ?auto_395731 ?auto_395746 ) ) ( not ( = ?auto_395732 ?auto_395733 ) ) ( not ( = ?auto_395732 ?auto_395735 ) ) ( not ( = ?auto_395732 ?auto_395734 ) ) ( not ( = ?auto_395732 ?auto_395736 ) ) ( not ( = ?auto_395732 ?auto_395737 ) ) ( not ( = ?auto_395732 ?auto_395738 ) ) ( not ( = ?auto_395732 ?auto_395739 ) ) ( not ( = ?auto_395732 ?auto_395740 ) ) ( not ( = ?auto_395732 ?auto_395741 ) ) ( not ( = ?auto_395732 ?auto_395746 ) ) ( not ( = ?auto_395733 ?auto_395735 ) ) ( not ( = ?auto_395733 ?auto_395734 ) ) ( not ( = ?auto_395733 ?auto_395736 ) ) ( not ( = ?auto_395733 ?auto_395737 ) ) ( not ( = ?auto_395733 ?auto_395738 ) ) ( not ( = ?auto_395733 ?auto_395739 ) ) ( not ( = ?auto_395733 ?auto_395740 ) ) ( not ( = ?auto_395733 ?auto_395741 ) ) ( not ( = ?auto_395733 ?auto_395746 ) ) ( not ( = ?auto_395735 ?auto_395734 ) ) ( not ( = ?auto_395735 ?auto_395736 ) ) ( not ( = ?auto_395735 ?auto_395737 ) ) ( not ( = ?auto_395735 ?auto_395738 ) ) ( not ( = ?auto_395735 ?auto_395739 ) ) ( not ( = ?auto_395735 ?auto_395740 ) ) ( not ( = ?auto_395735 ?auto_395741 ) ) ( not ( = ?auto_395735 ?auto_395746 ) ) ( not ( = ?auto_395734 ?auto_395736 ) ) ( not ( = ?auto_395734 ?auto_395737 ) ) ( not ( = ?auto_395734 ?auto_395738 ) ) ( not ( = ?auto_395734 ?auto_395739 ) ) ( not ( = ?auto_395734 ?auto_395740 ) ) ( not ( = ?auto_395734 ?auto_395741 ) ) ( not ( = ?auto_395734 ?auto_395746 ) ) ( not ( = ?auto_395736 ?auto_395737 ) ) ( not ( = ?auto_395736 ?auto_395738 ) ) ( not ( = ?auto_395736 ?auto_395739 ) ) ( not ( = ?auto_395736 ?auto_395740 ) ) ( not ( = ?auto_395736 ?auto_395741 ) ) ( not ( = ?auto_395736 ?auto_395746 ) ) ( not ( = ?auto_395737 ?auto_395738 ) ) ( not ( = ?auto_395737 ?auto_395739 ) ) ( not ( = ?auto_395737 ?auto_395740 ) ) ( not ( = ?auto_395737 ?auto_395741 ) ) ( not ( = ?auto_395737 ?auto_395746 ) ) ( not ( = ?auto_395738 ?auto_395739 ) ) ( not ( = ?auto_395738 ?auto_395740 ) ) ( not ( = ?auto_395738 ?auto_395741 ) ) ( not ( = ?auto_395738 ?auto_395746 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_395739 ?auto_395740 ?auto_395741 )
      ( MAKE-10CRATE-VERIFY ?auto_395731 ?auto_395732 ?auto_395733 ?auto_395735 ?auto_395734 ?auto_395736 ?auto_395737 ?auto_395738 ?auto_395739 ?auto_395740 ?auto_395741 ) )
  )

)

