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

  ( :method MAKE-11CRATE-VERIFY
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
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9044 - SURFACE
      ?auto_9045 - SURFACE
    )
    :vars
    (
      ?auto_9046 - HOIST
      ?auto_9047 - PLACE
      ?auto_9049 - PLACE
      ?auto_9050 - HOIST
      ?auto_9051 - SURFACE
      ?auto_9048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9046 ?auto_9047 ) ( SURFACE-AT ?auto_9044 ?auto_9047 ) ( CLEAR ?auto_9044 ) ( IS-CRATE ?auto_9045 ) ( AVAILABLE ?auto_9046 ) ( not ( = ?auto_9049 ?auto_9047 ) ) ( HOIST-AT ?auto_9050 ?auto_9049 ) ( AVAILABLE ?auto_9050 ) ( SURFACE-AT ?auto_9045 ?auto_9049 ) ( ON ?auto_9045 ?auto_9051 ) ( CLEAR ?auto_9045 ) ( TRUCK-AT ?auto_9048 ?auto_9047 ) ( not ( = ?auto_9044 ?auto_9045 ) ) ( not ( = ?auto_9044 ?auto_9051 ) ) ( not ( = ?auto_9045 ?auto_9051 ) ) ( not ( = ?auto_9046 ?auto_9050 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9048 ?auto_9047 ?auto_9049 )
      ( !LIFT ?auto_9050 ?auto_9045 ?auto_9051 ?auto_9049 )
      ( !LOAD ?auto_9050 ?auto_9045 ?auto_9048 ?auto_9049 )
      ( !DRIVE ?auto_9048 ?auto_9049 ?auto_9047 )
      ( !UNLOAD ?auto_9046 ?auto_9045 ?auto_9048 ?auto_9047 )
      ( !DROP ?auto_9046 ?auto_9045 ?auto_9044 ?auto_9047 )
      ( MAKE-1CRATE-VERIFY ?auto_9044 ?auto_9045 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9054 - SURFACE
      ?auto_9055 - SURFACE
    )
    :vars
    (
      ?auto_9056 - HOIST
      ?auto_9057 - PLACE
      ?auto_9059 - PLACE
      ?auto_9060 - HOIST
      ?auto_9061 - SURFACE
      ?auto_9058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9056 ?auto_9057 ) ( SURFACE-AT ?auto_9054 ?auto_9057 ) ( CLEAR ?auto_9054 ) ( IS-CRATE ?auto_9055 ) ( AVAILABLE ?auto_9056 ) ( not ( = ?auto_9059 ?auto_9057 ) ) ( HOIST-AT ?auto_9060 ?auto_9059 ) ( AVAILABLE ?auto_9060 ) ( SURFACE-AT ?auto_9055 ?auto_9059 ) ( ON ?auto_9055 ?auto_9061 ) ( CLEAR ?auto_9055 ) ( TRUCK-AT ?auto_9058 ?auto_9057 ) ( not ( = ?auto_9054 ?auto_9055 ) ) ( not ( = ?auto_9054 ?auto_9061 ) ) ( not ( = ?auto_9055 ?auto_9061 ) ) ( not ( = ?auto_9056 ?auto_9060 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9058 ?auto_9057 ?auto_9059 )
      ( !LIFT ?auto_9060 ?auto_9055 ?auto_9061 ?auto_9059 )
      ( !LOAD ?auto_9060 ?auto_9055 ?auto_9058 ?auto_9059 )
      ( !DRIVE ?auto_9058 ?auto_9059 ?auto_9057 )
      ( !UNLOAD ?auto_9056 ?auto_9055 ?auto_9058 ?auto_9057 )
      ( !DROP ?auto_9056 ?auto_9055 ?auto_9054 ?auto_9057 )
      ( MAKE-1CRATE-VERIFY ?auto_9054 ?auto_9055 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9065 - SURFACE
      ?auto_9066 - SURFACE
      ?auto_9067 - SURFACE
    )
    :vars
    (
      ?auto_9070 - HOIST
      ?auto_9069 - PLACE
      ?auto_9068 - PLACE
      ?auto_9071 - HOIST
      ?auto_9072 - SURFACE
      ?auto_9075 - PLACE
      ?auto_9076 - HOIST
      ?auto_9074 - SURFACE
      ?auto_9073 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9070 ?auto_9069 ) ( IS-CRATE ?auto_9067 ) ( not ( = ?auto_9068 ?auto_9069 ) ) ( HOIST-AT ?auto_9071 ?auto_9068 ) ( AVAILABLE ?auto_9071 ) ( SURFACE-AT ?auto_9067 ?auto_9068 ) ( ON ?auto_9067 ?auto_9072 ) ( CLEAR ?auto_9067 ) ( not ( = ?auto_9066 ?auto_9067 ) ) ( not ( = ?auto_9066 ?auto_9072 ) ) ( not ( = ?auto_9067 ?auto_9072 ) ) ( not ( = ?auto_9070 ?auto_9071 ) ) ( SURFACE-AT ?auto_9065 ?auto_9069 ) ( CLEAR ?auto_9065 ) ( IS-CRATE ?auto_9066 ) ( AVAILABLE ?auto_9070 ) ( not ( = ?auto_9075 ?auto_9069 ) ) ( HOIST-AT ?auto_9076 ?auto_9075 ) ( AVAILABLE ?auto_9076 ) ( SURFACE-AT ?auto_9066 ?auto_9075 ) ( ON ?auto_9066 ?auto_9074 ) ( CLEAR ?auto_9066 ) ( TRUCK-AT ?auto_9073 ?auto_9069 ) ( not ( = ?auto_9065 ?auto_9066 ) ) ( not ( = ?auto_9065 ?auto_9074 ) ) ( not ( = ?auto_9066 ?auto_9074 ) ) ( not ( = ?auto_9070 ?auto_9076 ) ) ( not ( = ?auto_9065 ?auto_9067 ) ) ( not ( = ?auto_9065 ?auto_9072 ) ) ( not ( = ?auto_9067 ?auto_9074 ) ) ( not ( = ?auto_9068 ?auto_9075 ) ) ( not ( = ?auto_9071 ?auto_9076 ) ) ( not ( = ?auto_9072 ?auto_9074 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9065 ?auto_9066 )
      ( MAKE-1CRATE ?auto_9066 ?auto_9067 )
      ( MAKE-2CRATE-VERIFY ?auto_9065 ?auto_9066 ?auto_9067 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9079 - SURFACE
      ?auto_9080 - SURFACE
    )
    :vars
    (
      ?auto_9081 - HOIST
      ?auto_9082 - PLACE
      ?auto_9084 - PLACE
      ?auto_9085 - HOIST
      ?auto_9086 - SURFACE
      ?auto_9083 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9081 ?auto_9082 ) ( SURFACE-AT ?auto_9079 ?auto_9082 ) ( CLEAR ?auto_9079 ) ( IS-CRATE ?auto_9080 ) ( AVAILABLE ?auto_9081 ) ( not ( = ?auto_9084 ?auto_9082 ) ) ( HOIST-AT ?auto_9085 ?auto_9084 ) ( AVAILABLE ?auto_9085 ) ( SURFACE-AT ?auto_9080 ?auto_9084 ) ( ON ?auto_9080 ?auto_9086 ) ( CLEAR ?auto_9080 ) ( TRUCK-AT ?auto_9083 ?auto_9082 ) ( not ( = ?auto_9079 ?auto_9080 ) ) ( not ( = ?auto_9079 ?auto_9086 ) ) ( not ( = ?auto_9080 ?auto_9086 ) ) ( not ( = ?auto_9081 ?auto_9085 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9083 ?auto_9082 ?auto_9084 )
      ( !LIFT ?auto_9085 ?auto_9080 ?auto_9086 ?auto_9084 )
      ( !LOAD ?auto_9085 ?auto_9080 ?auto_9083 ?auto_9084 )
      ( !DRIVE ?auto_9083 ?auto_9084 ?auto_9082 )
      ( !UNLOAD ?auto_9081 ?auto_9080 ?auto_9083 ?auto_9082 )
      ( !DROP ?auto_9081 ?auto_9080 ?auto_9079 ?auto_9082 )
      ( MAKE-1CRATE-VERIFY ?auto_9079 ?auto_9080 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9091 - SURFACE
      ?auto_9092 - SURFACE
      ?auto_9093 - SURFACE
      ?auto_9094 - SURFACE
    )
    :vars
    (
      ?auto_9097 - HOIST
      ?auto_9100 - PLACE
      ?auto_9098 - PLACE
      ?auto_9095 - HOIST
      ?auto_9099 - SURFACE
      ?auto_9103 - PLACE
      ?auto_9105 - HOIST
      ?auto_9104 - SURFACE
      ?auto_9102 - PLACE
      ?auto_9106 - HOIST
      ?auto_9101 - SURFACE
      ?auto_9096 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9097 ?auto_9100 ) ( IS-CRATE ?auto_9094 ) ( not ( = ?auto_9098 ?auto_9100 ) ) ( HOIST-AT ?auto_9095 ?auto_9098 ) ( AVAILABLE ?auto_9095 ) ( SURFACE-AT ?auto_9094 ?auto_9098 ) ( ON ?auto_9094 ?auto_9099 ) ( CLEAR ?auto_9094 ) ( not ( = ?auto_9093 ?auto_9094 ) ) ( not ( = ?auto_9093 ?auto_9099 ) ) ( not ( = ?auto_9094 ?auto_9099 ) ) ( not ( = ?auto_9097 ?auto_9095 ) ) ( IS-CRATE ?auto_9093 ) ( not ( = ?auto_9103 ?auto_9100 ) ) ( HOIST-AT ?auto_9105 ?auto_9103 ) ( AVAILABLE ?auto_9105 ) ( SURFACE-AT ?auto_9093 ?auto_9103 ) ( ON ?auto_9093 ?auto_9104 ) ( CLEAR ?auto_9093 ) ( not ( = ?auto_9092 ?auto_9093 ) ) ( not ( = ?auto_9092 ?auto_9104 ) ) ( not ( = ?auto_9093 ?auto_9104 ) ) ( not ( = ?auto_9097 ?auto_9105 ) ) ( SURFACE-AT ?auto_9091 ?auto_9100 ) ( CLEAR ?auto_9091 ) ( IS-CRATE ?auto_9092 ) ( AVAILABLE ?auto_9097 ) ( not ( = ?auto_9102 ?auto_9100 ) ) ( HOIST-AT ?auto_9106 ?auto_9102 ) ( AVAILABLE ?auto_9106 ) ( SURFACE-AT ?auto_9092 ?auto_9102 ) ( ON ?auto_9092 ?auto_9101 ) ( CLEAR ?auto_9092 ) ( TRUCK-AT ?auto_9096 ?auto_9100 ) ( not ( = ?auto_9091 ?auto_9092 ) ) ( not ( = ?auto_9091 ?auto_9101 ) ) ( not ( = ?auto_9092 ?auto_9101 ) ) ( not ( = ?auto_9097 ?auto_9106 ) ) ( not ( = ?auto_9091 ?auto_9093 ) ) ( not ( = ?auto_9091 ?auto_9104 ) ) ( not ( = ?auto_9093 ?auto_9101 ) ) ( not ( = ?auto_9103 ?auto_9102 ) ) ( not ( = ?auto_9105 ?auto_9106 ) ) ( not ( = ?auto_9104 ?auto_9101 ) ) ( not ( = ?auto_9091 ?auto_9094 ) ) ( not ( = ?auto_9091 ?auto_9099 ) ) ( not ( = ?auto_9092 ?auto_9094 ) ) ( not ( = ?auto_9092 ?auto_9099 ) ) ( not ( = ?auto_9094 ?auto_9104 ) ) ( not ( = ?auto_9094 ?auto_9101 ) ) ( not ( = ?auto_9098 ?auto_9103 ) ) ( not ( = ?auto_9098 ?auto_9102 ) ) ( not ( = ?auto_9095 ?auto_9105 ) ) ( not ( = ?auto_9095 ?auto_9106 ) ) ( not ( = ?auto_9099 ?auto_9104 ) ) ( not ( = ?auto_9099 ?auto_9101 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9091 ?auto_9092 ?auto_9093 )
      ( MAKE-1CRATE ?auto_9093 ?auto_9094 )
      ( MAKE-3CRATE-VERIFY ?auto_9091 ?auto_9092 ?auto_9093 ?auto_9094 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9109 - SURFACE
      ?auto_9110 - SURFACE
    )
    :vars
    (
      ?auto_9111 - HOIST
      ?auto_9112 - PLACE
      ?auto_9114 - PLACE
      ?auto_9115 - HOIST
      ?auto_9116 - SURFACE
      ?auto_9113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9111 ?auto_9112 ) ( SURFACE-AT ?auto_9109 ?auto_9112 ) ( CLEAR ?auto_9109 ) ( IS-CRATE ?auto_9110 ) ( AVAILABLE ?auto_9111 ) ( not ( = ?auto_9114 ?auto_9112 ) ) ( HOIST-AT ?auto_9115 ?auto_9114 ) ( AVAILABLE ?auto_9115 ) ( SURFACE-AT ?auto_9110 ?auto_9114 ) ( ON ?auto_9110 ?auto_9116 ) ( CLEAR ?auto_9110 ) ( TRUCK-AT ?auto_9113 ?auto_9112 ) ( not ( = ?auto_9109 ?auto_9110 ) ) ( not ( = ?auto_9109 ?auto_9116 ) ) ( not ( = ?auto_9110 ?auto_9116 ) ) ( not ( = ?auto_9111 ?auto_9115 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9113 ?auto_9112 ?auto_9114 )
      ( !LIFT ?auto_9115 ?auto_9110 ?auto_9116 ?auto_9114 )
      ( !LOAD ?auto_9115 ?auto_9110 ?auto_9113 ?auto_9114 )
      ( !DRIVE ?auto_9113 ?auto_9114 ?auto_9112 )
      ( !UNLOAD ?auto_9111 ?auto_9110 ?auto_9113 ?auto_9112 )
      ( !DROP ?auto_9111 ?auto_9110 ?auto_9109 ?auto_9112 )
      ( MAKE-1CRATE-VERIFY ?auto_9109 ?auto_9110 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9122 - SURFACE
      ?auto_9123 - SURFACE
      ?auto_9124 - SURFACE
      ?auto_9125 - SURFACE
      ?auto_9126 - SURFACE
    )
    :vars
    (
      ?auto_9129 - HOIST
      ?auto_9131 - PLACE
      ?auto_9132 - PLACE
      ?auto_9127 - HOIST
      ?auto_9128 - SURFACE
      ?auto_9141 - PLACE
      ?auto_9136 - HOIST
      ?auto_9139 - SURFACE
      ?auto_9140 - PLACE
      ?auto_9135 - HOIST
      ?auto_9138 - SURFACE
      ?auto_9133 - PLACE
      ?auto_9137 - HOIST
      ?auto_9134 - SURFACE
      ?auto_9130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9129 ?auto_9131 ) ( IS-CRATE ?auto_9126 ) ( not ( = ?auto_9132 ?auto_9131 ) ) ( HOIST-AT ?auto_9127 ?auto_9132 ) ( AVAILABLE ?auto_9127 ) ( SURFACE-AT ?auto_9126 ?auto_9132 ) ( ON ?auto_9126 ?auto_9128 ) ( CLEAR ?auto_9126 ) ( not ( = ?auto_9125 ?auto_9126 ) ) ( not ( = ?auto_9125 ?auto_9128 ) ) ( not ( = ?auto_9126 ?auto_9128 ) ) ( not ( = ?auto_9129 ?auto_9127 ) ) ( IS-CRATE ?auto_9125 ) ( not ( = ?auto_9141 ?auto_9131 ) ) ( HOIST-AT ?auto_9136 ?auto_9141 ) ( AVAILABLE ?auto_9136 ) ( SURFACE-AT ?auto_9125 ?auto_9141 ) ( ON ?auto_9125 ?auto_9139 ) ( CLEAR ?auto_9125 ) ( not ( = ?auto_9124 ?auto_9125 ) ) ( not ( = ?auto_9124 ?auto_9139 ) ) ( not ( = ?auto_9125 ?auto_9139 ) ) ( not ( = ?auto_9129 ?auto_9136 ) ) ( IS-CRATE ?auto_9124 ) ( not ( = ?auto_9140 ?auto_9131 ) ) ( HOIST-AT ?auto_9135 ?auto_9140 ) ( AVAILABLE ?auto_9135 ) ( SURFACE-AT ?auto_9124 ?auto_9140 ) ( ON ?auto_9124 ?auto_9138 ) ( CLEAR ?auto_9124 ) ( not ( = ?auto_9123 ?auto_9124 ) ) ( not ( = ?auto_9123 ?auto_9138 ) ) ( not ( = ?auto_9124 ?auto_9138 ) ) ( not ( = ?auto_9129 ?auto_9135 ) ) ( SURFACE-AT ?auto_9122 ?auto_9131 ) ( CLEAR ?auto_9122 ) ( IS-CRATE ?auto_9123 ) ( AVAILABLE ?auto_9129 ) ( not ( = ?auto_9133 ?auto_9131 ) ) ( HOIST-AT ?auto_9137 ?auto_9133 ) ( AVAILABLE ?auto_9137 ) ( SURFACE-AT ?auto_9123 ?auto_9133 ) ( ON ?auto_9123 ?auto_9134 ) ( CLEAR ?auto_9123 ) ( TRUCK-AT ?auto_9130 ?auto_9131 ) ( not ( = ?auto_9122 ?auto_9123 ) ) ( not ( = ?auto_9122 ?auto_9134 ) ) ( not ( = ?auto_9123 ?auto_9134 ) ) ( not ( = ?auto_9129 ?auto_9137 ) ) ( not ( = ?auto_9122 ?auto_9124 ) ) ( not ( = ?auto_9122 ?auto_9138 ) ) ( not ( = ?auto_9124 ?auto_9134 ) ) ( not ( = ?auto_9140 ?auto_9133 ) ) ( not ( = ?auto_9135 ?auto_9137 ) ) ( not ( = ?auto_9138 ?auto_9134 ) ) ( not ( = ?auto_9122 ?auto_9125 ) ) ( not ( = ?auto_9122 ?auto_9139 ) ) ( not ( = ?auto_9123 ?auto_9125 ) ) ( not ( = ?auto_9123 ?auto_9139 ) ) ( not ( = ?auto_9125 ?auto_9138 ) ) ( not ( = ?auto_9125 ?auto_9134 ) ) ( not ( = ?auto_9141 ?auto_9140 ) ) ( not ( = ?auto_9141 ?auto_9133 ) ) ( not ( = ?auto_9136 ?auto_9135 ) ) ( not ( = ?auto_9136 ?auto_9137 ) ) ( not ( = ?auto_9139 ?auto_9138 ) ) ( not ( = ?auto_9139 ?auto_9134 ) ) ( not ( = ?auto_9122 ?auto_9126 ) ) ( not ( = ?auto_9122 ?auto_9128 ) ) ( not ( = ?auto_9123 ?auto_9126 ) ) ( not ( = ?auto_9123 ?auto_9128 ) ) ( not ( = ?auto_9124 ?auto_9126 ) ) ( not ( = ?auto_9124 ?auto_9128 ) ) ( not ( = ?auto_9126 ?auto_9139 ) ) ( not ( = ?auto_9126 ?auto_9138 ) ) ( not ( = ?auto_9126 ?auto_9134 ) ) ( not ( = ?auto_9132 ?auto_9141 ) ) ( not ( = ?auto_9132 ?auto_9140 ) ) ( not ( = ?auto_9132 ?auto_9133 ) ) ( not ( = ?auto_9127 ?auto_9136 ) ) ( not ( = ?auto_9127 ?auto_9135 ) ) ( not ( = ?auto_9127 ?auto_9137 ) ) ( not ( = ?auto_9128 ?auto_9139 ) ) ( not ( = ?auto_9128 ?auto_9138 ) ) ( not ( = ?auto_9128 ?auto_9134 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_9122 ?auto_9123 ?auto_9124 ?auto_9125 )
      ( MAKE-1CRATE ?auto_9125 ?auto_9126 )
      ( MAKE-4CRATE-VERIFY ?auto_9122 ?auto_9123 ?auto_9124 ?auto_9125 ?auto_9126 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9144 - SURFACE
      ?auto_9145 - SURFACE
    )
    :vars
    (
      ?auto_9146 - HOIST
      ?auto_9147 - PLACE
      ?auto_9149 - PLACE
      ?auto_9150 - HOIST
      ?auto_9151 - SURFACE
      ?auto_9148 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9146 ?auto_9147 ) ( SURFACE-AT ?auto_9144 ?auto_9147 ) ( CLEAR ?auto_9144 ) ( IS-CRATE ?auto_9145 ) ( AVAILABLE ?auto_9146 ) ( not ( = ?auto_9149 ?auto_9147 ) ) ( HOIST-AT ?auto_9150 ?auto_9149 ) ( AVAILABLE ?auto_9150 ) ( SURFACE-AT ?auto_9145 ?auto_9149 ) ( ON ?auto_9145 ?auto_9151 ) ( CLEAR ?auto_9145 ) ( TRUCK-AT ?auto_9148 ?auto_9147 ) ( not ( = ?auto_9144 ?auto_9145 ) ) ( not ( = ?auto_9144 ?auto_9151 ) ) ( not ( = ?auto_9145 ?auto_9151 ) ) ( not ( = ?auto_9146 ?auto_9150 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9148 ?auto_9147 ?auto_9149 )
      ( !LIFT ?auto_9150 ?auto_9145 ?auto_9151 ?auto_9149 )
      ( !LOAD ?auto_9150 ?auto_9145 ?auto_9148 ?auto_9149 )
      ( !DRIVE ?auto_9148 ?auto_9149 ?auto_9147 )
      ( !UNLOAD ?auto_9146 ?auto_9145 ?auto_9148 ?auto_9147 )
      ( !DROP ?auto_9146 ?auto_9145 ?auto_9144 ?auto_9147 )
      ( MAKE-1CRATE-VERIFY ?auto_9144 ?auto_9145 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_9158 - SURFACE
      ?auto_9159 - SURFACE
      ?auto_9160 - SURFACE
      ?auto_9161 - SURFACE
      ?auto_9162 - SURFACE
      ?auto_9163 - SURFACE
    )
    :vars
    (
      ?auto_9165 - HOIST
      ?auto_9166 - PLACE
      ?auto_9167 - PLACE
      ?auto_9164 - HOIST
      ?auto_9168 - SURFACE
      ?auto_9176 - PLACE
      ?auto_9174 - HOIST
      ?auto_9170 - SURFACE
      ?auto_9178 - SURFACE
      ?auto_9172 - PLACE
      ?auto_9175 - HOIST
      ?auto_9177 - SURFACE
      ?auto_9179 - PLACE
      ?auto_9171 - HOIST
      ?auto_9173 - SURFACE
      ?auto_9169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9165 ?auto_9166 ) ( IS-CRATE ?auto_9163 ) ( not ( = ?auto_9167 ?auto_9166 ) ) ( HOIST-AT ?auto_9164 ?auto_9167 ) ( SURFACE-AT ?auto_9163 ?auto_9167 ) ( ON ?auto_9163 ?auto_9168 ) ( CLEAR ?auto_9163 ) ( not ( = ?auto_9162 ?auto_9163 ) ) ( not ( = ?auto_9162 ?auto_9168 ) ) ( not ( = ?auto_9163 ?auto_9168 ) ) ( not ( = ?auto_9165 ?auto_9164 ) ) ( IS-CRATE ?auto_9162 ) ( not ( = ?auto_9176 ?auto_9166 ) ) ( HOIST-AT ?auto_9174 ?auto_9176 ) ( AVAILABLE ?auto_9174 ) ( SURFACE-AT ?auto_9162 ?auto_9176 ) ( ON ?auto_9162 ?auto_9170 ) ( CLEAR ?auto_9162 ) ( not ( = ?auto_9161 ?auto_9162 ) ) ( not ( = ?auto_9161 ?auto_9170 ) ) ( not ( = ?auto_9162 ?auto_9170 ) ) ( not ( = ?auto_9165 ?auto_9174 ) ) ( IS-CRATE ?auto_9161 ) ( AVAILABLE ?auto_9164 ) ( SURFACE-AT ?auto_9161 ?auto_9167 ) ( ON ?auto_9161 ?auto_9178 ) ( CLEAR ?auto_9161 ) ( not ( = ?auto_9160 ?auto_9161 ) ) ( not ( = ?auto_9160 ?auto_9178 ) ) ( not ( = ?auto_9161 ?auto_9178 ) ) ( IS-CRATE ?auto_9160 ) ( not ( = ?auto_9172 ?auto_9166 ) ) ( HOIST-AT ?auto_9175 ?auto_9172 ) ( AVAILABLE ?auto_9175 ) ( SURFACE-AT ?auto_9160 ?auto_9172 ) ( ON ?auto_9160 ?auto_9177 ) ( CLEAR ?auto_9160 ) ( not ( = ?auto_9159 ?auto_9160 ) ) ( not ( = ?auto_9159 ?auto_9177 ) ) ( not ( = ?auto_9160 ?auto_9177 ) ) ( not ( = ?auto_9165 ?auto_9175 ) ) ( SURFACE-AT ?auto_9158 ?auto_9166 ) ( CLEAR ?auto_9158 ) ( IS-CRATE ?auto_9159 ) ( AVAILABLE ?auto_9165 ) ( not ( = ?auto_9179 ?auto_9166 ) ) ( HOIST-AT ?auto_9171 ?auto_9179 ) ( AVAILABLE ?auto_9171 ) ( SURFACE-AT ?auto_9159 ?auto_9179 ) ( ON ?auto_9159 ?auto_9173 ) ( CLEAR ?auto_9159 ) ( TRUCK-AT ?auto_9169 ?auto_9166 ) ( not ( = ?auto_9158 ?auto_9159 ) ) ( not ( = ?auto_9158 ?auto_9173 ) ) ( not ( = ?auto_9159 ?auto_9173 ) ) ( not ( = ?auto_9165 ?auto_9171 ) ) ( not ( = ?auto_9158 ?auto_9160 ) ) ( not ( = ?auto_9158 ?auto_9177 ) ) ( not ( = ?auto_9160 ?auto_9173 ) ) ( not ( = ?auto_9172 ?auto_9179 ) ) ( not ( = ?auto_9175 ?auto_9171 ) ) ( not ( = ?auto_9177 ?auto_9173 ) ) ( not ( = ?auto_9158 ?auto_9161 ) ) ( not ( = ?auto_9158 ?auto_9178 ) ) ( not ( = ?auto_9159 ?auto_9161 ) ) ( not ( = ?auto_9159 ?auto_9178 ) ) ( not ( = ?auto_9161 ?auto_9177 ) ) ( not ( = ?auto_9161 ?auto_9173 ) ) ( not ( = ?auto_9167 ?auto_9172 ) ) ( not ( = ?auto_9167 ?auto_9179 ) ) ( not ( = ?auto_9164 ?auto_9175 ) ) ( not ( = ?auto_9164 ?auto_9171 ) ) ( not ( = ?auto_9178 ?auto_9177 ) ) ( not ( = ?auto_9178 ?auto_9173 ) ) ( not ( = ?auto_9158 ?auto_9162 ) ) ( not ( = ?auto_9158 ?auto_9170 ) ) ( not ( = ?auto_9159 ?auto_9162 ) ) ( not ( = ?auto_9159 ?auto_9170 ) ) ( not ( = ?auto_9160 ?auto_9162 ) ) ( not ( = ?auto_9160 ?auto_9170 ) ) ( not ( = ?auto_9162 ?auto_9178 ) ) ( not ( = ?auto_9162 ?auto_9177 ) ) ( not ( = ?auto_9162 ?auto_9173 ) ) ( not ( = ?auto_9176 ?auto_9167 ) ) ( not ( = ?auto_9176 ?auto_9172 ) ) ( not ( = ?auto_9176 ?auto_9179 ) ) ( not ( = ?auto_9174 ?auto_9164 ) ) ( not ( = ?auto_9174 ?auto_9175 ) ) ( not ( = ?auto_9174 ?auto_9171 ) ) ( not ( = ?auto_9170 ?auto_9178 ) ) ( not ( = ?auto_9170 ?auto_9177 ) ) ( not ( = ?auto_9170 ?auto_9173 ) ) ( not ( = ?auto_9158 ?auto_9163 ) ) ( not ( = ?auto_9158 ?auto_9168 ) ) ( not ( = ?auto_9159 ?auto_9163 ) ) ( not ( = ?auto_9159 ?auto_9168 ) ) ( not ( = ?auto_9160 ?auto_9163 ) ) ( not ( = ?auto_9160 ?auto_9168 ) ) ( not ( = ?auto_9161 ?auto_9163 ) ) ( not ( = ?auto_9161 ?auto_9168 ) ) ( not ( = ?auto_9163 ?auto_9170 ) ) ( not ( = ?auto_9163 ?auto_9178 ) ) ( not ( = ?auto_9163 ?auto_9177 ) ) ( not ( = ?auto_9163 ?auto_9173 ) ) ( not ( = ?auto_9168 ?auto_9170 ) ) ( not ( = ?auto_9168 ?auto_9178 ) ) ( not ( = ?auto_9168 ?auto_9177 ) ) ( not ( = ?auto_9168 ?auto_9173 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_9158 ?auto_9159 ?auto_9160 ?auto_9161 ?auto_9162 )
      ( MAKE-1CRATE ?auto_9162 ?auto_9163 )
      ( MAKE-5CRATE-VERIFY ?auto_9158 ?auto_9159 ?auto_9160 ?auto_9161 ?auto_9162 ?auto_9163 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9182 - SURFACE
      ?auto_9183 - SURFACE
    )
    :vars
    (
      ?auto_9184 - HOIST
      ?auto_9185 - PLACE
      ?auto_9187 - PLACE
      ?auto_9188 - HOIST
      ?auto_9189 - SURFACE
      ?auto_9186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9184 ?auto_9185 ) ( SURFACE-AT ?auto_9182 ?auto_9185 ) ( CLEAR ?auto_9182 ) ( IS-CRATE ?auto_9183 ) ( AVAILABLE ?auto_9184 ) ( not ( = ?auto_9187 ?auto_9185 ) ) ( HOIST-AT ?auto_9188 ?auto_9187 ) ( AVAILABLE ?auto_9188 ) ( SURFACE-AT ?auto_9183 ?auto_9187 ) ( ON ?auto_9183 ?auto_9189 ) ( CLEAR ?auto_9183 ) ( TRUCK-AT ?auto_9186 ?auto_9185 ) ( not ( = ?auto_9182 ?auto_9183 ) ) ( not ( = ?auto_9182 ?auto_9189 ) ) ( not ( = ?auto_9183 ?auto_9189 ) ) ( not ( = ?auto_9184 ?auto_9188 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9186 ?auto_9185 ?auto_9187 )
      ( !LIFT ?auto_9188 ?auto_9183 ?auto_9189 ?auto_9187 )
      ( !LOAD ?auto_9188 ?auto_9183 ?auto_9186 ?auto_9187 )
      ( !DRIVE ?auto_9186 ?auto_9187 ?auto_9185 )
      ( !UNLOAD ?auto_9184 ?auto_9183 ?auto_9186 ?auto_9185 )
      ( !DROP ?auto_9184 ?auto_9183 ?auto_9182 ?auto_9185 )
      ( MAKE-1CRATE-VERIFY ?auto_9182 ?auto_9183 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_9197 - SURFACE
      ?auto_9198 - SURFACE
      ?auto_9199 - SURFACE
      ?auto_9200 - SURFACE
      ?auto_9201 - SURFACE
      ?auto_9202 - SURFACE
      ?auto_9203 - SURFACE
    )
    :vars
    (
      ?auto_9206 - HOIST
      ?auto_9204 - PLACE
      ?auto_9209 - PLACE
      ?auto_9205 - HOIST
      ?auto_9208 - SURFACE
      ?auto_9213 - PLACE
      ?auto_9212 - HOIST
      ?auto_9211 - SURFACE
      ?auto_9218 - PLACE
      ?auto_9215 - HOIST
      ?auto_9220 - SURFACE
      ?auto_9210 - SURFACE
      ?auto_9219 - SURFACE
      ?auto_9217 - PLACE
      ?auto_9216 - HOIST
      ?auto_9214 - SURFACE
      ?auto_9207 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9206 ?auto_9204 ) ( IS-CRATE ?auto_9203 ) ( not ( = ?auto_9209 ?auto_9204 ) ) ( HOIST-AT ?auto_9205 ?auto_9209 ) ( SURFACE-AT ?auto_9203 ?auto_9209 ) ( ON ?auto_9203 ?auto_9208 ) ( CLEAR ?auto_9203 ) ( not ( = ?auto_9202 ?auto_9203 ) ) ( not ( = ?auto_9202 ?auto_9208 ) ) ( not ( = ?auto_9203 ?auto_9208 ) ) ( not ( = ?auto_9206 ?auto_9205 ) ) ( IS-CRATE ?auto_9202 ) ( not ( = ?auto_9213 ?auto_9204 ) ) ( HOIST-AT ?auto_9212 ?auto_9213 ) ( SURFACE-AT ?auto_9202 ?auto_9213 ) ( ON ?auto_9202 ?auto_9211 ) ( CLEAR ?auto_9202 ) ( not ( = ?auto_9201 ?auto_9202 ) ) ( not ( = ?auto_9201 ?auto_9211 ) ) ( not ( = ?auto_9202 ?auto_9211 ) ) ( not ( = ?auto_9206 ?auto_9212 ) ) ( IS-CRATE ?auto_9201 ) ( not ( = ?auto_9218 ?auto_9204 ) ) ( HOIST-AT ?auto_9215 ?auto_9218 ) ( AVAILABLE ?auto_9215 ) ( SURFACE-AT ?auto_9201 ?auto_9218 ) ( ON ?auto_9201 ?auto_9220 ) ( CLEAR ?auto_9201 ) ( not ( = ?auto_9200 ?auto_9201 ) ) ( not ( = ?auto_9200 ?auto_9220 ) ) ( not ( = ?auto_9201 ?auto_9220 ) ) ( not ( = ?auto_9206 ?auto_9215 ) ) ( IS-CRATE ?auto_9200 ) ( AVAILABLE ?auto_9212 ) ( SURFACE-AT ?auto_9200 ?auto_9213 ) ( ON ?auto_9200 ?auto_9210 ) ( CLEAR ?auto_9200 ) ( not ( = ?auto_9199 ?auto_9200 ) ) ( not ( = ?auto_9199 ?auto_9210 ) ) ( not ( = ?auto_9200 ?auto_9210 ) ) ( IS-CRATE ?auto_9199 ) ( AVAILABLE ?auto_9205 ) ( SURFACE-AT ?auto_9199 ?auto_9209 ) ( ON ?auto_9199 ?auto_9219 ) ( CLEAR ?auto_9199 ) ( not ( = ?auto_9198 ?auto_9199 ) ) ( not ( = ?auto_9198 ?auto_9219 ) ) ( not ( = ?auto_9199 ?auto_9219 ) ) ( SURFACE-AT ?auto_9197 ?auto_9204 ) ( CLEAR ?auto_9197 ) ( IS-CRATE ?auto_9198 ) ( AVAILABLE ?auto_9206 ) ( not ( = ?auto_9217 ?auto_9204 ) ) ( HOIST-AT ?auto_9216 ?auto_9217 ) ( AVAILABLE ?auto_9216 ) ( SURFACE-AT ?auto_9198 ?auto_9217 ) ( ON ?auto_9198 ?auto_9214 ) ( CLEAR ?auto_9198 ) ( TRUCK-AT ?auto_9207 ?auto_9204 ) ( not ( = ?auto_9197 ?auto_9198 ) ) ( not ( = ?auto_9197 ?auto_9214 ) ) ( not ( = ?auto_9198 ?auto_9214 ) ) ( not ( = ?auto_9206 ?auto_9216 ) ) ( not ( = ?auto_9197 ?auto_9199 ) ) ( not ( = ?auto_9197 ?auto_9219 ) ) ( not ( = ?auto_9199 ?auto_9214 ) ) ( not ( = ?auto_9209 ?auto_9217 ) ) ( not ( = ?auto_9205 ?auto_9216 ) ) ( not ( = ?auto_9219 ?auto_9214 ) ) ( not ( = ?auto_9197 ?auto_9200 ) ) ( not ( = ?auto_9197 ?auto_9210 ) ) ( not ( = ?auto_9198 ?auto_9200 ) ) ( not ( = ?auto_9198 ?auto_9210 ) ) ( not ( = ?auto_9200 ?auto_9219 ) ) ( not ( = ?auto_9200 ?auto_9214 ) ) ( not ( = ?auto_9213 ?auto_9209 ) ) ( not ( = ?auto_9213 ?auto_9217 ) ) ( not ( = ?auto_9212 ?auto_9205 ) ) ( not ( = ?auto_9212 ?auto_9216 ) ) ( not ( = ?auto_9210 ?auto_9219 ) ) ( not ( = ?auto_9210 ?auto_9214 ) ) ( not ( = ?auto_9197 ?auto_9201 ) ) ( not ( = ?auto_9197 ?auto_9220 ) ) ( not ( = ?auto_9198 ?auto_9201 ) ) ( not ( = ?auto_9198 ?auto_9220 ) ) ( not ( = ?auto_9199 ?auto_9201 ) ) ( not ( = ?auto_9199 ?auto_9220 ) ) ( not ( = ?auto_9201 ?auto_9210 ) ) ( not ( = ?auto_9201 ?auto_9219 ) ) ( not ( = ?auto_9201 ?auto_9214 ) ) ( not ( = ?auto_9218 ?auto_9213 ) ) ( not ( = ?auto_9218 ?auto_9209 ) ) ( not ( = ?auto_9218 ?auto_9217 ) ) ( not ( = ?auto_9215 ?auto_9212 ) ) ( not ( = ?auto_9215 ?auto_9205 ) ) ( not ( = ?auto_9215 ?auto_9216 ) ) ( not ( = ?auto_9220 ?auto_9210 ) ) ( not ( = ?auto_9220 ?auto_9219 ) ) ( not ( = ?auto_9220 ?auto_9214 ) ) ( not ( = ?auto_9197 ?auto_9202 ) ) ( not ( = ?auto_9197 ?auto_9211 ) ) ( not ( = ?auto_9198 ?auto_9202 ) ) ( not ( = ?auto_9198 ?auto_9211 ) ) ( not ( = ?auto_9199 ?auto_9202 ) ) ( not ( = ?auto_9199 ?auto_9211 ) ) ( not ( = ?auto_9200 ?auto_9202 ) ) ( not ( = ?auto_9200 ?auto_9211 ) ) ( not ( = ?auto_9202 ?auto_9220 ) ) ( not ( = ?auto_9202 ?auto_9210 ) ) ( not ( = ?auto_9202 ?auto_9219 ) ) ( not ( = ?auto_9202 ?auto_9214 ) ) ( not ( = ?auto_9211 ?auto_9220 ) ) ( not ( = ?auto_9211 ?auto_9210 ) ) ( not ( = ?auto_9211 ?auto_9219 ) ) ( not ( = ?auto_9211 ?auto_9214 ) ) ( not ( = ?auto_9197 ?auto_9203 ) ) ( not ( = ?auto_9197 ?auto_9208 ) ) ( not ( = ?auto_9198 ?auto_9203 ) ) ( not ( = ?auto_9198 ?auto_9208 ) ) ( not ( = ?auto_9199 ?auto_9203 ) ) ( not ( = ?auto_9199 ?auto_9208 ) ) ( not ( = ?auto_9200 ?auto_9203 ) ) ( not ( = ?auto_9200 ?auto_9208 ) ) ( not ( = ?auto_9201 ?auto_9203 ) ) ( not ( = ?auto_9201 ?auto_9208 ) ) ( not ( = ?auto_9203 ?auto_9211 ) ) ( not ( = ?auto_9203 ?auto_9220 ) ) ( not ( = ?auto_9203 ?auto_9210 ) ) ( not ( = ?auto_9203 ?auto_9219 ) ) ( not ( = ?auto_9203 ?auto_9214 ) ) ( not ( = ?auto_9208 ?auto_9211 ) ) ( not ( = ?auto_9208 ?auto_9220 ) ) ( not ( = ?auto_9208 ?auto_9210 ) ) ( not ( = ?auto_9208 ?auto_9219 ) ) ( not ( = ?auto_9208 ?auto_9214 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_9197 ?auto_9198 ?auto_9199 ?auto_9200 ?auto_9201 ?auto_9202 )
      ( MAKE-1CRATE ?auto_9202 ?auto_9203 )
      ( MAKE-6CRATE-VERIFY ?auto_9197 ?auto_9198 ?auto_9199 ?auto_9200 ?auto_9201 ?auto_9202 ?auto_9203 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9223 - SURFACE
      ?auto_9224 - SURFACE
    )
    :vars
    (
      ?auto_9225 - HOIST
      ?auto_9226 - PLACE
      ?auto_9228 - PLACE
      ?auto_9229 - HOIST
      ?auto_9230 - SURFACE
      ?auto_9227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9225 ?auto_9226 ) ( SURFACE-AT ?auto_9223 ?auto_9226 ) ( CLEAR ?auto_9223 ) ( IS-CRATE ?auto_9224 ) ( AVAILABLE ?auto_9225 ) ( not ( = ?auto_9228 ?auto_9226 ) ) ( HOIST-AT ?auto_9229 ?auto_9228 ) ( AVAILABLE ?auto_9229 ) ( SURFACE-AT ?auto_9224 ?auto_9228 ) ( ON ?auto_9224 ?auto_9230 ) ( CLEAR ?auto_9224 ) ( TRUCK-AT ?auto_9227 ?auto_9226 ) ( not ( = ?auto_9223 ?auto_9224 ) ) ( not ( = ?auto_9223 ?auto_9230 ) ) ( not ( = ?auto_9224 ?auto_9230 ) ) ( not ( = ?auto_9225 ?auto_9229 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9227 ?auto_9226 ?auto_9228 )
      ( !LIFT ?auto_9229 ?auto_9224 ?auto_9230 ?auto_9228 )
      ( !LOAD ?auto_9229 ?auto_9224 ?auto_9227 ?auto_9228 )
      ( !DRIVE ?auto_9227 ?auto_9228 ?auto_9226 )
      ( !UNLOAD ?auto_9225 ?auto_9224 ?auto_9227 ?auto_9226 )
      ( !DROP ?auto_9225 ?auto_9224 ?auto_9223 ?auto_9226 )
      ( MAKE-1CRATE-VERIFY ?auto_9223 ?auto_9224 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_9239 - SURFACE
      ?auto_9240 - SURFACE
      ?auto_9241 - SURFACE
      ?auto_9242 - SURFACE
      ?auto_9243 - SURFACE
      ?auto_9244 - SURFACE
      ?auto_9245 - SURFACE
      ?auto_9246 - SURFACE
    )
    :vars
    (
      ?auto_9248 - HOIST
      ?auto_9249 - PLACE
      ?auto_9250 - PLACE
      ?auto_9252 - HOIST
      ?auto_9251 - SURFACE
      ?auto_9262 - PLACE
      ?auto_9261 - HOIST
      ?auto_9265 - SURFACE
      ?auto_9260 - PLACE
      ?auto_9263 - HOIST
      ?auto_9266 - SURFACE
      ?auto_9253 - PLACE
      ?auto_9258 - HOIST
      ?auto_9254 - SURFACE
      ?auto_9264 - SURFACE
      ?auto_9255 - SURFACE
      ?auto_9256 - PLACE
      ?auto_9257 - HOIST
      ?auto_9259 - SURFACE
      ?auto_9247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9248 ?auto_9249 ) ( IS-CRATE ?auto_9246 ) ( not ( = ?auto_9250 ?auto_9249 ) ) ( HOIST-AT ?auto_9252 ?auto_9250 ) ( AVAILABLE ?auto_9252 ) ( SURFACE-AT ?auto_9246 ?auto_9250 ) ( ON ?auto_9246 ?auto_9251 ) ( CLEAR ?auto_9246 ) ( not ( = ?auto_9245 ?auto_9246 ) ) ( not ( = ?auto_9245 ?auto_9251 ) ) ( not ( = ?auto_9246 ?auto_9251 ) ) ( not ( = ?auto_9248 ?auto_9252 ) ) ( IS-CRATE ?auto_9245 ) ( not ( = ?auto_9262 ?auto_9249 ) ) ( HOIST-AT ?auto_9261 ?auto_9262 ) ( SURFACE-AT ?auto_9245 ?auto_9262 ) ( ON ?auto_9245 ?auto_9265 ) ( CLEAR ?auto_9245 ) ( not ( = ?auto_9244 ?auto_9245 ) ) ( not ( = ?auto_9244 ?auto_9265 ) ) ( not ( = ?auto_9245 ?auto_9265 ) ) ( not ( = ?auto_9248 ?auto_9261 ) ) ( IS-CRATE ?auto_9244 ) ( not ( = ?auto_9260 ?auto_9249 ) ) ( HOIST-AT ?auto_9263 ?auto_9260 ) ( SURFACE-AT ?auto_9244 ?auto_9260 ) ( ON ?auto_9244 ?auto_9266 ) ( CLEAR ?auto_9244 ) ( not ( = ?auto_9243 ?auto_9244 ) ) ( not ( = ?auto_9243 ?auto_9266 ) ) ( not ( = ?auto_9244 ?auto_9266 ) ) ( not ( = ?auto_9248 ?auto_9263 ) ) ( IS-CRATE ?auto_9243 ) ( not ( = ?auto_9253 ?auto_9249 ) ) ( HOIST-AT ?auto_9258 ?auto_9253 ) ( AVAILABLE ?auto_9258 ) ( SURFACE-AT ?auto_9243 ?auto_9253 ) ( ON ?auto_9243 ?auto_9254 ) ( CLEAR ?auto_9243 ) ( not ( = ?auto_9242 ?auto_9243 ) ) ( not ( = ?auto_9242 ?auto_9254 ) ) ( not ( = ?auto_9243 ?auto_9254 ) ) ( not ( = ?auto_9248 ?auto_9258 ) ) ( IS-CRATE ?auto_9242 ) ( AVAILABLE ?auto_9263 ) ( SURFACE-AT ?auto_9242 ?auto_9260 ) ( ON ?auto_9242 ?auto_9264 ) ( CLEAR ?auto_9242 ) ( not ( = ?auto_9241 ?auto_9242 ) ) ( not ( = ?auto_9241 ?auto_9264 ) ) ( not ( = ?auto_9242 ?auto_9264 ) ) ( IS-CRATE ?auto_9241 ) ( AVAILABLE ?auto_9261 ) ( SURFACE-AT ?auto_9241 ?auto_9262 ) ( ON ?auto_9241 ?auto_9255 ) ( CLEAR ?auto_9241 ) ( not ( = ?auto_9240 ?auto_9241 ) ) ( not ( = ?auto_9240 ?auto_9255 ) ) ( not ( = ?auto_9241 ?auto_9255 ) ) ( SURFACE-AT ?auto_9239 ?auto_9249 ) ( CLEAR ?auto_9239 ) ( IS-CRATE ?auto_9240 ) ( AVAILABLE ?auto_9248 ) ( not ( = ?auto_9256 ?auto_9249 ) ) ( HOIST-AT ?auto_9257 ?auto_9256 ) ( AVAILABLE ?auto_9257 ) ( SURFACE-AT ?auto_9240 ?auto_9256 ) ( ON ?auto_9240 ?auto_9259 ) ( CLEAR ?auto_9240 ) ( TRUCK-AT ?auto_9247 ?auto_9249 ) ( not ( = ?auto_9239 ?auto_9240 ) ) ( not ( = ?auto_9239 ?auto_9259 ) ) ( not ( = ?auto_9240 ?auto_9259 ) ) ( not ( = ?auto_9248 ?auto_9257 ) ) ( not ( = ?auto_9239 ?auto_9241 ) ) ( not ( = ?auto_9239 ?auto_9255 ) ) ( not ( = ?auto_9241 ?auto_9259 ) ) ( not ( = ?auto_9262 ?auto_9256 ) ) ( not ( = ?auto_9261 ?auto_9257 ) ) ( not ( = ?auto_9255 ?auto_9259 ) ) ( not ( = ?auto_9239 ?auto_9242 ) ) ( not ( = ?auto_9239 ?auto_9264 ) ) ( not ( = ?auto_9240 ?auto_9242 ) ) ( not ( = ?auto_9240 ?auto_9264 ) ) ( not ( = ?auto_9242 ?auto_9255 ) ) ( not ( = ?auto_9242 ?auto_9259 ) ) ( not ( = ?auto_9260 ?auto_9262 ) ) ( not ( = ?auto_9260 ?auto_9256 ) ) ( not ( = ?auto_9263 ?auto_9261 ) ) ( not ( = ?auto_9263 ?auto_9257 ) ) ( not ( = ?auto_9264 ?auto_9255 ) ) ( not ( = ?auto_9264 ?auto_9259 ) ) ( not ( = ?auto_9239 ?auto_9243 ) ) ( not ( = ?auto_9239 ?auto_9254 ) ) ( not ( = ?auto_9240 ?auto_9243 ) ) ( not ( = ?auto_9240 ?auto_9254 ) ) ( not ( = ?auto_9241 ?auto_9243 ) ) ( not ( = ?auto_9241 ?auto_9254 ) ) ( not ( = ?auto_9243 ?auto_9264 ) ) ( not ( = ?auto_9243 ?auto_9255 ) ) ( not ( = ?auto_9243 ?auto_9259 ) ) ( not ( = ?auto_9253 ?auto_9260 ) ) ( not ( = ?auto_9253 ?auto_9262 ) ) ( not ( = ?auto_9253 ?auto_9256 ) ) ( not ( = ?auto_9258 ?auto_9263 ) ) ( not ( = ?auto_9258 ?auto_9261 ) ) ( not ( = ?auto_9258 ?auto_9257 ) ) ( not ( = ?auto_9254 ?auto_9264 ) ) ( not ( = ?auto_9254 ?auto_9255 ) ) ( not ( = ?auto_9254 ?auto_9259 ) ) ( not ( = ?auto_9239 ?auto_9244 ) ) ( not ( = ?auto_9239 ?auto_9266 ) ) ( not ( = ?auto_9240 ?auto_9244 ) ) ( not ( = ?auto_9240 ?auto_9266 ) ) ( not ( = ?auto_9241 ?auto_9244 ) ) ( not ( = ?auto_9241 ?auto_9266 ) ) ( not ( = ?auto_9242 ?auto_9244 ) ) ( not ( = ?auto_9242 ?auto_9266 ) ) ( not ( = ?auto_9244 ?auto_9254 ) ) ( not ( = ?auto_9244 ?auto_9264 ) ) ( not ( = ?auto_9244 ?auto_9255 ) ) ( not ( = ?auto_9244 ?auto_9259 ) ) ( not ( = ?auto_9266 ?auto_9254 ) ) ( not ( = ?auto_9266 ?auto_9264 ) ) ( not ( = ?auto_9266 ?auto_9255 ) ) ( not ( = ?auto_9266 ?auto_9259 ) ) ( not ( = ?auto_9239 ?auto_9245 ) ) ( not ( = ?auto_9239 ?auto_9265 ) ) ( not ( = ?auto_9240 ?auto_9245 ) ) ( not ( = ?auto_9240 ?auto_9265 ) ) ( not ( = ?auto_9241 ?auto_9245 ) ) ( not ( = ?auto_9241 ?auto_9265 ) ) ( not ( = ?auto_9242 ?auto_9245 ) ) ( not ( = ?auto_9242 ?auto_9265 ) ) ( not ( = ?auto_9243 ?auto_9245 ) ) ( not ( = ?auto_9243 ?auto_9265 ) ) ( not ( = ?auto_9245 ?auto_9266 ) ) ( not ( = ?auto_9245 ?auto_9254 ) ) ( not ( = ?auto_9245 ?auto_9264 ) ) ( not ( = ?auto_9245 ?auto_9255 ) ) ( not ( = ?auto_9245 ?auto_9259 ) ) ( not ( = ?auto_9265 ?auto_9266 ) ) ( not ( = ?auto_9265 ?auto_9254 ) ) ( not ( = ?auto_9265 ?auto_9264 ) ) ( not ( = ?auto_9265 ?auto_9255 ) ) ( not ( = ?auto_9265 ?auto_9259 ) ) ( not ( = ?auto_9239 ?auto_9246 ) ) ( not ( = ?auto_9239 ?auto_9251 ) ) ( not ( = ?auto_9240 ?auto_9246 ) ) ( not ( = ?auto_9240 ?auto_9251 ) ) ( not ( = ?auto_9241 ?auto_9246 ) ) ( not ( = ?auto_9241 ?auto_9251 ) ) ( not ( = ?auto_9242 ?auto_9246 ) ) ( not ( = ?auto_9242 ?auto_9251 ) ) ( not ( = ?auto_9243 ?auto_9246 ) ) ( not ( = ?auto_9243 ?auto_9251 ) ) ( not ( = ?auto_9244 ?auto_9246 ) ) ( not ( = ?auto_9244 ?auto_9251 ) ) ( not ( = ?auto_9246 ?auto_9265 ) ) ( not ( = ?auto_9246 ?auto_9266 ) ) ( not ( = ?auto_9246 ?auto_9254 ) ) ( not ( = ?auto_9246 ?auto_9264 ) ) ( not ( = ?auto_9246 ?auto_9255 ) ) ( not ( = ?auto_9246 ?auto_9259 ) ) ( not ( = ?auto_9250 ?auto_9262 ) ) ( not ( = ?auto_9250 ?auto_9260 ) ) ( not ( = ?auto_9250 ?auto_9253 ) ) ( not ( = ?auto_9250 ?auto_9256 ) ) ( not ( = ?auto_9252 ?auto_9261 ) ) ( not ( = ?auto_9252 ?auto_9263 ) ) ( not ( = ?auto_9252 ?auto_9258 ) ) ( not ( = ?auto_9252 ?auto_9257 ) ) ( not ( = ?auto_9251 ?auto_9265 ) ) ( not ( = ?auto_9251 ?auto_9266 ) ) ( not ( = ?auto_9251 ?auto_9254 ) ) ( not ( = ?auto_9251 ?auto_9264 ) ) ( not ( = ?auto_9251 ?auto_9255 ) ) ( not ( = ?auto_9251 ?auto_9259 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_9239 ?auto_9240 ?auto_9241 ?auto_9242 ?auto_9243 ?auto_9244 ?auto_9245 )
      ( MAKE-1CRATE ?auto_9245 ?auto_9246 )
      ( MAKE-7CRATE-VERIFY ?auto_9239 ?auto_9240 ?auto_9241 ?auto_9242 ?auto_9243 ?auto_9244 ?auto_9245 ?auto_9246 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9269 - SURFACE
      ?auto_9270 - SURFACE
    )
    :vars
    (
      ?auto_9271 - HOIST
      ?auto_9272 - PLACE
      ?auto_9274 - PLACE
      ?auto_9275 - HOIST
      ?auto_9276 - SURFACE
      ?auto_9273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9271 ?auto_9272 ) ( SURFACE-AT ?auto_9269 ?auto_9272 ) ( CLEAR ?auto_9269 ) ( IS-CRATE ?auto_9270 ) ( AVAILABLE ?auto_9271 ) ( not ( = ?auto_9274 ?auto_9272 ) ) ( HOIST-AT ?auto_9275 ?auto_9274 ) ( AVAILABLE ?auto_9275 ) ( SURFACE-AT ?auto_9270 ?auto_9274 ) ( ON ?auto_9270 ?auto_9276 ) ( CLEAR ?auto_9270 ) ( TRUCK-AT ?auto_9273 ?auto_9272 ) ( not ( = ?auto_9269 ?auto_9270 ) ) ( not ( = ?auto_9269 ?auto_9276 ) ) ( not ( = ?auto_9270 ?auto_9276 ) ) ( not ( = ?auto_9271 ?auto_9275 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9273 ?auto_9272 ?auto_9274 )
      ( !LIFT ?auto_9275 ?auto_9270 ?auto_9276 ?auto_9274 )
      ( !LOAD ?auto_9275 ?auto_9270 ?auto_9273 ?auto_9274 )
      ( !DRIVE ?auto_9273 ?auto_9274 ?auto_9272 )
      ( !UNLOAD ?auto_9271 ?auto_9270 ?auto_9273 ?auto_9272 )
      ( !DROP ?auto_9271 ?auto_9270 ?auto_9269 ?auto_9272 )
      ( MAKE-1CRATE-VERIFY ?auto_9269 ?auto_9270 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_9286 - SURFACE
      ?auto_9287 - SURFACE
      ?auto_9288 - SURFACE
      ?auto_9289 - SURFACE
      ?auto_9290 - SURFACE
      ?auto_9291 - SURFACE
      ?auto_9292 - SURFACE
      ?auto_9294 - SURFACE
      ?auto_9293 - SURFACE
    )
    :vars
    (
      ?auto_9295 - HOIST
      ?auto_9297 - PLACE
      ?auto_9299 - PLACE
      ?auto_9300 - HOIST
      ?auto_9298 - SURFACE
      ?auto_9315 - PLACE
      ?auto_9305 - HOIST
      ?auto_9316 - SURFACE
      ?auto_9301 - PLACE
      ?auto_9302 - HOIST
      ?auto_9309 - SURFACE
      ?auto_9311 - PLACE
      ?auto_9307 - HOIST
      ?auto_9310 - SURFACE
      ?auto_9303 - PLACE
      ?auto_9313 - HOIST
      ?auto_9304 - SURFACE
      ?auto_9308 - SURFACE
      ?auto_9317 - SURFACE
      ?auto_9306 - PLACE
      ?auto_9314 - HOIST
      ?auto_9312 - SURFACE
      ?auto_9296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9295 ?auto_9297 ) ( IS-CRATE ?auto_9293 ) ( not ( = ?auto_9299 ?auto_9297 ) ) ( HOIST-AT ?auto_9300 ?auto_9299 ) ( AVAILABLE ?auto_9300 ) ( SURFACE-AT ?auto_9293 ?auto_9299 ) ( ON ?auto_9293 ?auto_9298 ) ( CLEAR ?auto_9293 ) ( not ( = ?auto_9294 ?auto_9293 ) ) ( not ( = ?auto_9294 ?auto_9298 ) ) ( not ( = ?auto_9293 ?auto_9298 ) ) ( not ( = ?auto_9295 ?auto_9300 ) ) ( IS-CRATE ?auto_9294 ) ( not ( = ?auto_9315 ?auto_9297 ) ) ( HOIST-AT ?auto_9305 ?auto_9315 ) ( AVAILABLE ?auto_9305 ) ( SURFACE-AT ?auto_9294 ?auto_9315 ) ( ON ?auto_9294 ?auto_9316 ) ( CLEAR ?auto_9294 ) ( not ( = ?auto_9292 ?auto_9294 ) ) ( not ( = ?auto_9292 ?auto_9316 ) ) ( not ( = ?auto_9294 ?auto_9316 ) ) ( not ( = ?auto_9295 ?auto_9305 ) ) ( IS-CRATE ?auto_9292 ) ( not ( = ?auto_9301 ?auto_9297 ) ) ( HOIST-AT ?auto_9302 ?auto_9301 ) ( SURFACE-AT ?auto_9292 ?auto_9301 ) ( ON ?auto_9292 ?auto_9309 ) ( CLEAR ?auto_9292 ) ( not ( = ?auto_9291 ?auto_9292 ) ) ( not ( = ?auto_9291 ?auto_9309 ) ) ( not ( = ?auto_9292 ?auto_9309 ) ) ( not ( = ?auto_9295 ?auto_9302 ) ) ( IS-CRATE ?auto_9291 ) ( not ( = ?auto_9311 ?auto_9297 ) ) ( HOIST-AT ?auto_9307 ?auto_9311 ) ( SURFACE-AT ?auto_9291 ?auto_9311 ) ( ON ?auto_9291 ?auto_9310 ) ( CLEAR ?auto_9291 ) ( not ( = ?auto_9290 ?auto_9291 ) ) ( not ( = ?auto_9290 ?auto_9310 ) ) ( not ( = ?auto_9291 ?auto_9310 ) ) ( not ( = ?auto_9295 ?auto_9307 ) ) ( IS-CRATE ?auto_9290 ) ( not ( = ?auto_9303 ?auto_9297 ) ) ( HOIST-AT ?auto_9313 ?auto_9303 ) ( AVAILABLE ?auto_9313 ) ( SURFACE-AT ?auto_9290 ?auto_9303 ) ( ON ?auto_9290 ?auto_9304 ) ( CLEAR ?auto_9290 ) ( not ( = ?auto_9289 ?auto_9290 ) ) ( not ( = ?auto_9289 ?auto_9304 ) ) ( not ( = ?auto_9290 ?auto_9304 ) ) ( not ( = ?auto_9295 ?auto_9313 ) ) ( IS-CRATE ?auto_9289 ) ( AVAILABLE ?auto_9307 ) ( SURFACE-AT ?auto_9289 ?auto_9311 ) ( ON ?auto_9289 ?auto_9308 ) ( CLEAR ?auto_9289 ) ( not ( = ?auto_9288 ?auto_9289 ) ) ( not ( = ?auto_9288 ?auto_9308 ) ) ( not ( = ?auto_9289 ?auto_9308 ) ) ( IS-CRATE ?auto_9288 ) ( AVAILABLE ?auto_9302 ) ( SURFACE-AT ?auto_9288 ?auto_9301 ) ( ON ?auto_9288 ?auto_9317 ) ( CLEAR ?auto_9288 ) ( not ( = ?auto_9287 ?auto_9288 ) ) ( not ( = ?auto_9287 ?auto_9317 ) ) ( not ( = ?auto_9288 ?auto_9317 ) ) ( SURFACE-AT ?auto_9286 ?auto_9297 ) ( CLEAR ?auto_9286 ) ( IS-CRATE ?auto_9287 ) ( AVAILABLE ?auto_9295 ) ( not ( = ?auto_9306 ?auto_9297 ) ) ( HOIST-AT ?auto_9314 ?auto_9306 ) ( AVAILABLE ?auto_9314 ) ( SURFACE-AT ?auto_9287 ?auto_9306 ) ( ON ?auto_9287 ?auto_9312 ) ( CLEAR ?auto_9287 ) ( TRUCK-AT ?auto_9296 ?auto_9297 ) ( not ( = ?auto_9286 ?auto_9287 ) ) ( not ( = ?auto_9286 ?auto_9312 ) ) ( not ( = ?auto_9287 ?auto_9312 ) ) ( not ( = ?auto_9295 ?auto_9314 ) ) ( not ( = ?auto_9286 ?auto_9288 ) ) ( not ( = ?auto_9286 ?auto_9317 ) ) ( not ( = ?auto_9288 ?auto_9312 ) ) ( not ( = ?auto_9301 ?auto_9306 ) ) ( not ( = ?auto_9302 ?auto_9314 ) ) ( not ( = ?auto_9317 ?auto_9312 ) ) ( not ( = ?auto_9286 ?auto_9289 ) ) ( not ( = ?auto_9286 ?auto_9308 ) ) ( not ( = ?auto_9287 ?auto_9289 ) ) ( not ( = ?auto_9287 ?auto_9308 ) ) ( not ( = ?auto_9289 ?auto_9317 ) ) ( not ( = ?auto_9289 ?auto_9312 ) ) ( not ( = ?auto_9311 ?auto_9301 ) ) ( not ( = ?auto_9311 ?auto_9306 ) ) ( not ( = ?auto_9307 ?auto_9302 ) ) ( not ( = ?auto_9307 ?auto_9314 ) ) ( not ( = ?auto_9308 ?auto_9317 ) ) ( not ( = ?auto_9308 ?auto_9312 ) ) ( not ( = ?auto_9286 ?auto_9290 ) ) ( not ( = ?auto_9286 ?auto_9304 ) ) ( not ( = ?auto_9287 ?auto_9290 ) ) ( not ( = ?auto_9287 ?auto_9304 ) ) ( not ( = ?auto_9288 ?auto_9290 ) ) ( not ( = ?auto_9288 ?auto_9304 ) ) ( not ( = ?auto_9290 ?auto_9308 ) ) ( not ( = ?auto_9290 ?auto_9317 ) ) ( not ( = ?auto_9290 ?auto_9312 ) ) ( not ( = ?auto_9303 ?auto_9311 ) ) ( not ( = ?auto_9303 ?auto_9301 ) ) ( not ( = ?auto_9303 ?auto_9306 ) ) ( not ( = ?auto_9313 ?auto_9307 ) ) ( not ( = ?auto_9313 ?auto_9302 ) ) ( not ( = ?auto_9313 ?auto_9314 ) ) ( not ( = ?auto_9304 ?auto_9308 ) ) ( not ( = ?auto_9304 ?auto_9317 ) ) ( not ( = ?auto_9304 ?auto_9312 ) ) ( not ( = ?auto_9286 ?auto_9291 ) ) ( not ( = ?auto_9286 ?auto_9310 ) ) ( not ( = ?auto_9287 ?auto_9291 ) ) ( not ( = ?auto_9287 ?auto_9310 ) ) ( not ( = ?auto_9288 ?auto_9291 ) ) ( not ( = ?auto_9288 ?auto_9310 ) ) ( not ( = ?auto_9289 ?auto_9291 ) ) ( not ( = ?auto_9289 ?auto_9310 ) ) ( not ( = ?auto_9291 ?auto_9304 ) ) ( not ( = ?auto_9291 ?auto_9308 ) ) ( not ( = ?auto_9291 ?auto_9317 ) ) ( not ( = ?auto_9291 ?auto_9312 ) ) ( not ( = ?auto_9310 ?auto_9304 ) ) ( not ( = ?auto_9310 ?auto_9308 ) ) ( not ( = ?auto_9310 ?auto_9317 ) ) ( not ( = ?auto_9310 ?auto_9312 ) ) ( not ( = ?auto_9286 ?auto_9292 ) ) ( not ( = ?auto_9286 ?auto_9309 ) ) ( not ( = ?auto_9287 ?auto_9292 ) ) ( not ( = ?auto_9287 ?auto_9309 ) ) ( not ( = ?auto_9288 ?auto_9292 ) ) ( not ( = ?auto_9288 ?auto_9309 ) ) ( not ( = ?auto_9289 ?auto_9292 ) ) ( not ( = ?auto_9289 ?auto_9309 ) ) ( not ( = ?auto_9290 ?auto_9292 ) ) ( not ( = ?auto_9290 ?auto_9309 ) ) ( not ( = ?auto_9292 ?auto_9310 ) ) ( not ( = ?auto_9292 ?auto_9304 ) ) ( not ( = ?auto_9292 ?auto_9308 ) ) ( not ( = ?auto_9292 ?auto_9317 ) ) ( not ( = ?auto_9292 ?auto_9312 ) ) ( not ( = ?auto_9309 ?auto_9310 ) ) ( not ( = ?auto_9309 ?auto_9304 ) ) ( not ( = ?auto_9309 ?auto_9308 ) ) ( not ( = ?auto_9309 ?auto_9317 ) ) ( not ( = ?auto_9309 ?auto_9312 ) ) ( not ( = ?auto_9286 ?auto_9294 ) ) ( not ( = ?auto_9286 ?auto_9316 ) ) ( not ( = ?auto_9287 ?auto_9294 ) ) ( not ( = ?auto_9287 ?auto_9316 ) ) ( not ( = ?auto_9288 ?auto_9294 ) ) ( not ( = ?auto_9288 ?auto_9316 ) ) ( not ( = ?auto_9289 ?auto_9294 ) ) ( not ( = ?auto_9289 ?auto_9316 ) ) ( not ( = ?auto_9290 ?auto_9294 ) ) ( not ( = ?auto_9290 ?auto_9316 ) ) ( not ( = ?auto_9291 ?auto_9294 ) ) ( not ( = ?auto_9291 ?auto_9316 ) ) ( not ( = ?auto_9294 ?auto_9309 ) ) ( not ( = ?auto_9294 ?auto_9310 ) ) ( not ( = ?auto_9294 ?auto_9304 ) ) ( not ( = ?auto_9294 ?auto_9308 ) ) ( not ( = ?auto_9294 ?auto_9317 ) ) ( not ( = ?auto_9294 ?auto_9312 ) ) ( not ( = ?auto_9315 ?auto_9301 ) ) ( not ( = ?auto_9315 ?auto_9311 ) ) ( not ( = ?auto_9315 ?auto_9303 ) ) ( not ( = ?auto_9315 ?auto_9306 ) ) ( not ( = ?auto_9305 ?auto_9302 ) ) ( not ( = ?auto_9305 ?auto_9307 ) ) ( not ( = ?auto_9305 ?auto_9313 ) ) ( not ( = ?auto_9305 ?auto_9314 ) ) ( not ( = ?auto_9316 ?auto_9309 ) ) ( not ( = ?auto_9316 ?auto_9310 ) ) ( not ( = ?auto_9316 ?auto_9304 ) ) ( not ( = ?auto_9316 ?auto_9308 ) ) ( not ( = ?auto_9316 ?auto_9317 ) ) ( not ( = ?auto_9316 ?auto_9312 ) ) ( not ( = ?auto_9286 ?auto_9293 ) ) ( not ( = ?auto_9286 ?auto_9298 ) ) ( not ( = ?auto_9287 ?auto_9293 ) ) ( not ( = ?auto_9287 ?auto_9298 ) ) ( not ( = ?auto_9288 ?auto_9293 ) ) ( not ( = ?auto_9288 ?auto_9298 ) ) ( not ( = ?auto_9289 ?auto_9293 ) ) ( not ( = ?auto_9289 ?auto_9298 ) ) ( not ( = ?auto_9290 ?auto_9293 ) ) ( not ( = ?auto_9290 ?auto_9298 ) ) ( not ( = ?auto_9291 ?auto_9293 ) ) ( not ( = ?auto_9291 ?auto_9298 ) ) ( not ( = ?auto_9292 ?auto_9293 ) ) ( not ( = ?auto_9292 ?auto_9298 ) ) ( not ( = ?auto_9293 ?auto_9316 ) ) ( not ( = ?auto_9293 ?auto_9309 ) ) ( not ( = ?auto_9293 ?auto_9310 ) ) ( not ( = ?auto_9293 ?auto_9304 ) ) ( not ( = ?auto_9293 ?auto_9308 ) ) ( not ( = ?auto_9293 ?auto_9317 ) ) ( not ( = ?auto_9293 ?auto_9312 ) ) ( not ( = ?auto_9299 ?auto_9315 ) ) ( not ( = ?auto_9299 ?auto_9301 ) ) ( not ( = ?auto_9299 ?auto_9311 ) ) ( not ( = ?auto_9299 ?auto_9303 ) ) ( not ( = ?auto_9299 ?auto_9306 ) ) ( not ( = ?auto_9300 ?auto_9305 ) ) ( not ( = ?auto_9300 ?auto_9302 ) ) ( not ( = ?auto_9300 ?auto_9307 ) ) ( not ( = ?auto_9300 ?auto_9313 ) ) ( not ( = ?auto_9300 ?auto_9314 ) ) ( not ( = ?auto_9298 ?auto_9316 ) ) ( not ( = ?auto_9298 ?auto_9309 ) ) ( not ( = ?auto_9298 ?auto_9310 ) ) ( not ( = ?auto_9298 ?auto_9304 ) ) ( not ( = ?auto_9298 ?auto_9308 ) ) ( not ( = ?auto_9298 ?auto_9317 ) ) ( not ( = ?auto_9298 ?auto_9312 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_9286 ?auto_9287 ?auto_9288 ?auto_9289 ?auto_9290 ?auto_9291 ?auto_9292 ?auto_9294 )
      ( MAKE-1CRATE ?auto_9294 ?auto_9293 )
      ( MAKE-8CRATE-VERIFY ?auto_9286 ?auto_9287 ?auto_9288 ?auto_9289 ?auto_9290 ?auto_9291 ?auto_9292 ?auto_9294 ?auto_9293 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9320 - SURFACE
      ?auto_9321 - SURFACE
    )
    :vars
    (
      ?auto_9322 - HOIST
      ?auto_9323 - PLACE
      ?auto_9325 - PLACE
      ?auto_9326 - HOIST
      ?auto_9327 - SURFACE
      ?auto_9324 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9322 ?auto_9323 ) ( SURFACE-AT ?auto_9320 ?auto_9323 ) ( CLEAR ?auto_9320 ) ( IS-CRATE ?auto_9321 ) ( AVAILABLE ?auto_9322 ) ( not ( = ?auto_9325 ?auto_9323 ) ) ( HOIST-AT ?auto_9326 ?auto_9325 ) ( AVAILABLE ?auto_9326 ) ( SURFACE-AT ?auto_9321 ?auto_9325 ) ( ON ?auto_9321 ?auto_9327 ) ( CLEAR ?auto_9321 ) ( TRUCK-AT ?auto_9324 ?auto_9323 ) ( not ( = ?auto_9320 ?auto_9321 ) ) ( not ( = ?auto_9320 ?auto_9327 ) ) ( not ( = ?auto_9321 ?auto_9327 ) ) ( not ( = ?auto_9322 ?auto_9326 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9324 ?auto_9323 ?auto_9325 )
      ( !LIFT ?auto_9326 ?auto_9321 ?auto_9327 ?auto_9325 )
      ( !LOAD ?auto_9326 ?auto_9321 ?auto_9324 ?auto_9325 )
      ( !DRIVE ?auto_9324 ?auto_9325 ?auto_9323 )
      ( !UNLOAD ?auto_9322 ?auto_9321 ?auto_9324 ?auto_9323 )
      ( !DROP ?auto_9322 ?auto_9321 ?auto_9320 ?auto_9323 )
      ( MAKE-1CRATE-VERIFY ?auto_9320 ?auto_9321 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_9338 - SURFACE
      ?auto_9339 - SURFACE
      ?auto_9340 - SURFACE
      ?auto_9341 - SURFACE
      ?auto_9342 - SURFACE
      ?auto_9343 - SURFACE
      ?auto_9344 - SURFACE
      ?auto_9347 - SURFACE
      ?auto_9346 - SURFACE
      ?auto_9345 - SURFACE
    )
    :vars
    (
      ?auto_9353 - HOIST
      ?auto_9349 - PLACE
      ?auto_9348 - PLACE
      ?auto_9350 - HOIST
      ?auto_9352 - SURFACE
      ?auto_9365 - PLACE
      ?auto_9371 - HOIST
      ?auto_9366 - SURFACE
      ?auto_9373 - PLACE
      ?auto_9359 - HOIST
      ?auto_9364 - SURFACE
      ?auto_9370 - PLACE
      ?auto_9368 - HOIST
      ?auto_9363 - SURFACE
      ?auto_9362 - PLACE
      ?auto_9357 - HOIST
      ?auto_9360 - SURFACE
      ?auto_9369 - PLACE
      ?auto_9361 - HOIST
      ?auto_9367 - SURFACE
      ?auto_9356 - SURFACE
      ?auto_9372 - SURFACE
      ?auto_9358 - PLACE
      ?auto_9355 - HOIST
      ?auto_9354 - SURFACE
      ?auto_9351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9353 ?auto_9349 ) ( IS-CRATE ?auto_9345 ) ( not ( = ?auto_9348 ?auto_9349 ) ) ( HOIST-AT ?auto_9350 ?auto_9348 ) ( AVAILABLE ?auto_9350 ) ( SURFACE-AT ?auto_9345 ?auto_9348 ) ( ON ?auto_9345 ?auto_9352 ) ( CLEAR ?auto_9345 ) ( not ( = ?auto_9346 ?auto_9345 ) ) ( not ( = ?auto_9346 ?auto_9352 ) ) ( not ( = ?auto_9345 ?auto_9352 ) ) ( not ( = ?auto_9353 ?auto_9350 ) ) ( IS-CRATE ?auto_9346 ) ( not ( = ?auto_9365 ?auto_9349 ) ) ( HOIST-AT ?auto_9371 ?auto_9365 ) ( AVAILABLE ?auto_9371 ) ( SURFACE-AT ?auto_9346 ?auto_9365 ) ( ON ?auto_9346 ?auto_9366 ) ( CLEAR ?auto_9346 ) ( not ( = ?auto_9347 ?auto_9346 ) ) ( not ( = ?auto_9347 ?auto_9366 ) ) ( not ( = ?auto_9346 ?auto_9366 ) ) ( not ( = ?auto_9353 ?auto_9371 ) ) ( IS-CRATE ?auto_9347 ) ( not ( = ?auto_9373 ?auto_9349 ) ) ( HOIST-AT ?auto_9359 ?auto_9373 ) ( AVAILABLE ?auto_9359 ) ( SURFACE-AT ?auto_9347 ?auto_9373 ) ( ON ?auto_9347 ?auto_9364 ) ( CLEAR ?auto_9347 ) ( not ( = ?auto_9344 ?auto_9347 ) ) ( not ( = ?auto_9344 ?auto_9364 ) ) ( not ( = ?auto_9347 ?auto_9364 ) ) ( not ( = ?auto_9353 ?auto_9359 ) ) ( IS-CRATE ?auto_9344 ) ( not ( = ?auto_9370 ?auto_9349 ) ) ( HOIST-AT ?auto_9368 ?auto_9370 ) ( SURFACE-AT ?auto_9344 ?auto_9370 ) ( ON ?auto_9344 ?auto_9363 ) ( CLEAR ?auto_9344 ) ( not ( = ?auto_9343 ?auto_9344 ) ) ( not ( = ?auto_9343 ?auto_9363 ) ) ( not ( = ?auto_9344 ?auto_9363 ) ) ( not ( = ?auto_9353 ?auto_9368 ) ) ( IS-CRATE ?auto_9343 ) ( not ( = ?auto_9362 ?auto_9349 ) ) ( HOIST-AT ?auto_9357 ?auto_9362 ) ( SURFACE-AT ?auto_9343 ?auto_9362 ) ( ON ?auto_9343 ?auto_9360 ) ( CLEAR ?auto_9343 ) ( not ( = ?auto_9342 ?auto_9343 ) ) ( not ( = ?auto_9342 ?auto_9360 ) ) ( not ( = ?auto_9343 ?auto_9360 ) ) ( not ( = ?auto_9353 ?auto_9357 ) ) ( IS-CRATE ?auto_9342 ) ( not ( = ?auto_9369 ?auto_9349 ) ) ( HOIST-AT ?auto_9361 ?auto_9369 ) ( AVAILABLE ?auto_9361 ) ( SURFACE-AT ?auto_9342 ?auto_9369 ) ( ON ?auto_9342 ?auto_9367 ) ( CLEAR ?auto_9342 ) ( not ( = ?auto_9341 ?auto_9342 ) ) ( not ( = ?auto_9341 ?auto_9367 ) ) ( not ( = ?auto_9342 ?auto_9367 ) ) ( not ( = ?auto_9353 ?auto_9361 ) ) ( IS-CRATE ?auto_9341 ) ( AVAILABLE ?auto_9357 ) ( SURFACE-AT ?auto_9341 ?auto_9362 ) ( ON ?auto_9341 ?auto_9356 ) ( CLEAR ?auto_9341 ) ( not ( = ?auto_9340 ?auto_9341 ) ) ( not ( = ?auto_9340 ?auto_9356 ) ) ( not ( = ?auto_9341 ?auto_9356 ) ) ( IS-CRATE ?auto_9340 ) ( AVAILABLE ?auto_9368 ) ( SURFACE-AT ?auto_9340 ?auto_9370 ) ( ON ?auto_9340 ?auto_9372 ) ( CLEAR ?auto_9340 ) ( not ( = ?auto_9339 ?auto_9340 ) ) ( not ( = ?auto_9339 ?auto_9372 ) ) ( not ( = ?auto_9340 ?auto_9372 ) ) ( SURFACE-AT ?auto_9338 ?auto_9349 ) ( CLEAR ?auto_9338 ) ( IS-CRATE ?auto_9339 ) ( AVAILABLE ?auto_9353 ) ( not ( = ?auto_9358 ?auto_9349 ) ) ( HOIST-AT ?auto_9355 ?auto_9358 ) ( AVAILABLE ?auto_9355 ) ( SURFACE-AT ?auto_9339 ?auto_9358 ) ( ON ?auto_9339 ?auto_9354 ) ( CLEAR ?auto_9339 ) ( TRUCK-AT ?auto_9351 ?auto_9349 ) ( not ( = ?auto_9338 ?auto_9339 ) ) ( not ( = ?auto_9338 ?auto_9354 ) ) ( not ( = ?auto_9339 ?auto_9354 ) ) ( not ( = ?auto_9353 ?auto_9355 ) ) ( not ( = ?auto_9338 ?auto_9340 ) ) ( not ( = ?auto_9338 ?auto_9372 ) ) ( not ( = ?auto_9340 ?auto_9354 ) ) ( not ( = ?auto_9370 ?auto_9358 ) ) ( not ( = ?auto_9368 ?auto_9355 ) ) ( not ( = ?auto_9372 ?auto_9354 ) ) ( not ( = ?auto_9338 ?auto_9341 ) ) ( not ( = ?auto_9338 ?auto_9356 ) ) ( not ( = ?auto_9339 ?auto_9341 ) ) ( not ( = ?auto_9339 ?auto_9356 ) ) ( not ( = ?auto_9341 ?auto_9372 ) ) ( not ( = ?auto_9341 ?auto_9354 ) ) ( not ( = ?auto_9362 ?auto_9370 ) ) ( not ( = ?auto_9362 ?auto_9358 ) ) ( not ( = ?auto_9357 ?auto_9368 ) ) ( not ( = ?auto_9357 ?auto_9355 ) ) ( not ( = ?auto_9356 ?auto_9372 ) ) ( not ( = ?auto_9356 ?auto_9354 ) ) ( not ( = ?auto_9338 ?auto_9342 ) ) ( not ( = ?auto_9338 ?auto_9367 ) ) ( not ( = ?auto_9339 ?auto_9342 ) ) ( not ( = ?auto_9339 ?auto_9367 ) ) ( not ( = ?auto_9340 ?auto_9342 ) ) ( not ( = ?auto_9340 ?auto_9367 ) ) ( not ( = ?auto_9342 ?auto_9356 ) ) ( not ( = ?auto_9342 ?auto_9372 ) ) ( not ( = ?auto_9342 ?auto_9354 ) ) ( not ( = ?auto_9369 ?auto_9362 ) ) ( not ( = ?auto_9369 ?auto_9370 ) ) ( not ( = ?auto_9369 ?auto_9358 ) ) ( not ( = ?auto_9361 ?auto_9357 ) ) ( not ( = ?auto_9361 ?auto_9368 ) ) ( not ( = ?auto_9361 ?auto_9355 ) ) ( not ( = ?auto_9367 ?auto_9356 ) ) ( not ( = ?auto_9367 ?auto_9372 ) ) ( not ( = ?auto_9367 ?auto_9354 ) ) ( not ( = ?auto_9338 ?auto_9343 ) ) ( not ( = ?auto_9338 ?auto_9360 ) ) ( not ( = ?auto_9339 ?auto_9343 ) ) ( not ( = ?auto_9339 ?auto_9360 ) ) ( not ( = ?auto_9340 ?auto_9343 ) ) ( not ( = ?auto_9340 ?auto_9360 ) ) ( not ( = ?auto_9341 ?auto_9343 ) ) ( not ( = ?auto_9341 ?auto_9360 ) ) ( not ( = ?auto_9343 ?auto_9367 ) ) ( not ( = ?auto_9343 ?auto_9356 ) ) ( not ( = ?auto_9343 ?auto_9372 ) ) ( not ( = ?auto_9343 ?auto_9354 ) ) ( not ( = ?auto_9360 ?auto_9367 ) ) ( not ( = ?auto_9360 ?auto_9356 ) ) ( not ( = ?auto_9360 ?auto_9372 ) ) ( not ( = ?auto_9360 ?auto_9354 ) ) ( not ( = ?auto_9338 ?auto_9344 ) ) ( not ( = ?auto_9338 ?auto_9363 ) ) ( not ( = ?auto_9339 ?auto_9344 ) ) ( not ( = ?auto_9339 ?auto_9363 ) ) ( not ( = ?auto_9340 ?auto_9344 ) ) ( not ( = ?auto_9340 ?auto_9363 ) ) ( not ( = ?auto_9341 ?auto_9344 ) ) ( not ( = ?auto_9341 ?auto_9363 ) ) ( not ( = ?auto_9342 ?auto_9344 ) ) ( not ( = ?auto_9342 ?auto_9363 ) ) ( not ( = ?auto_9344 ?auto_9360 ) ) ( not ( = ?auto_9344 ?auto_9367 ) ) ( not ( = ?auto_9344 ?auto_9356 ) ) ( not ( = ?auto_9344 ?auto_9372 ) ) ( not ( = ?auto_9344 ?auto_9354 ) ) ( not ( = ?auto_9363 ?auto_9360 ) ) ( not ( = ?auto_9363 ?auto_9367 ) ) ( not ( = ?auto_9363 ?auto_9356 ) ) ( not ( = ?auto_9363 ?auto_9372 ) ) ( not ( = ?auto_9363 ?auto_9354 ) ) ( not ( = ?auto_9338 ?auto_9347 ) ) ( not ( = ?auto_9338 ?auto_9364 ) ) ( not ( = ?auto_9339 ?auto_9347 ) ) ( not ( = ?auto_9339 ?auto_9364 ) ) ( not ( = ?auto_9340 ?auto_9347 ) ) ( not ( = ?auto_9340 ?auto_9364 ) ) ( not ( = ?auto_9341 ?auto_9347 ) ) ( not ( = ?auto_9341 ?auto_9364 ) ) ( not ( = ?auto_9342 ?auto_9347 ) ) ( not ( = ?auto_9342 ?auto_9364 ) ) ( not ( = ?auto_9343 ?auto_9347 ) ) ( not ( = ?auto_9343 ?auto_9364 ) ) ( not ( = ?auto_9347 ?auto_9363 ) ) ( not ( = ?auto_9347 ?auto_9360 ) ) ( not ( = ?auto_9347 ?auto_9367 ) ) ( not ( = ?auto_9347 ?auto_9356 ) ) ( not ( = ?auto_9347 ?auto_9372 ) ) ( not ( = ?auto_9347 ?auto_9354 ) ) ( not ( = ?auto_9373 ?auto_9370 ) ) ( not ( = ?auto_9373 ?auto_9362 ) ) ( not ( = ?auto_9373 ?auto_9369 ) ) ( not ( = ?auto_9373 ?auto_9358 ) ) ( not ( = ?auto_9359 ?auto_9368 ) ) ( not ( = ?auto_9359 ?auto_9357 ) ) ( not ( = ?auto_9359 ?auto_9361 ) ) ( not ( = ?auto_9359 ?auto_9355 ) ) ( not ( = ?auto_9364 ?auto_9363 ) ) ( not ( = ?auto_9364 ?auto_9360 ) ) ( not ( = ?auto_9364 ?auto_9367 ) ) ( not ( = ?auto_9364 ?auto_9356 ) ) ( not ( = ?auto_9364 ?auto_9372 ) ) ( not ( = ?auto_9364 ?auto_9354 ) ) ( not ( = ?auto_9338 ?auto_9346 ) ) ( not ( = ?auto_9338 ?auto_9366 ) ) ( not ( = ?auto_9339 ?auto_9346 ) ) ( not ( = ?auto_9339 ?auto_9366 ) ) ( not ( = ?auto_9340 ?auto_9346 ) ) ( not ( = ?auto_9340 ?auto_9366 ) ) ( not ( = ?auto_9341 ?auto_9346 ) ) ( not ( = ?auto_9341 ?auto_9366 ) ) ( not ( = ?auto_9342 ?auto_9346 ) ) ( not ( = ?auto_9342 ?auto_9366 ) ) ( not ( = ?auto_9343 ?auto_9346 ) ) ( not ( = ?auto_9343 ?auto_9366 ) ) ( not ( = ?auto_9344 ?auto_9346 ) ) ( not ( = ?auto_9344 ?auto_9366 ) ) ( not ( = ?auto_9346 ?auto_9364 ) ) ( not ( = ?auto_9346 ?auto_9363 ) ) ( not ( = ?auto_9346 ?auto_9360 ) ) ( not ( = ?auto_9346 ?auto_9367 ) ) ( not ( = ?auto_9346 ?auto_9356 ) ) ( not ( = ?auto_9346 ?auto_9372 ) ) ( not ( = ?auto_9346 ?auto_9354 ) ) ( not ( = ?auto_9365 ?auto_9373 ) ) ( not ( = ?auto_9365 ?auto_9370 ) ) ( not ( = ?auto_9365 ?auto_9362 ) ) ( not ( = ?auto_9365 ?auto_9369 ) ) ( not ( = ?auto_9365 ?auto_9358 ) ) ( not ( = ?auto_9371 ?auto_9359 ) ) ( not ( = ?auto_9371 ?auto_9368 ) ) ( not ( = ?auto_9371 ?auto_9357 ) ) ( not ( = ?auto_9371 ?auto_9361 ) ) ( not ( = ?auto_9371 ?auto_9355 ) ) ( not ( = ?auto_9366 ?auto_9364 ) ) ( not ( = ?auto_9366 ?auto_9363 ) ) ( not ( = ?auto_9366 ?auto_9360 ) ) ( not ( = ?auto_9366 ?auto_9367 ) ) ( not ( = ?auto_9366 ?auto_9356 ) ) ( not ( = ?auto_9366 ?auto_9372 ) ) ( not ( = ?auto_9366 ?auto_9354 ) ) ( not ( = ?auto_9338 ?auto_9345 ) ) ( not ( = ?auto_9338 ?auto_9352 ) ) ( not ( = ?auto_9339 ?auto_9345 ) ) ( not ( = ?auto_9339 ?auto_9352 ) ) ( not ( = ?auto_9340 ?auto_9345 ) ) ( not ( = ?auto_9340 ?auto_9352 ) ) ( not ( = ?auto_9341 ?auto_9345 ) ) ( not ( = ?auto_9341 ?auto_9352 ) ) ( not ( = ?auto_9342 ?auto_9345 ) ) ( not ( = ?auto_9342 ?auto_9352 ) ) ( not ( = ?auto_9343 ?auto_9345 ) ) ( not ( = ?auto_9343 ?auto_9352 ) ) ( not ( = ?auto_9344 ?auto_9345 ) ) ( not ( = ?auto_9344 ?auto_9352 ) ) ( not ( = ?auto_9347 ?auto_9345 ) ) ( not ( = ?auto_9347 ?auto_9352 ) ) ( not ( = ?auto_9345 ?auto_9366 ) ) ( not ( = ?auto_9345 ?auto_9364 ) ) ( not ( = ?auto_9345 ?auto_9363 ) ) ( not ( = ?auto_9345 ?auto_9360 ) ) ( not ( = ?auto_9345 ?auto_9367 ) ) ( not ( = ?auto_9345 ?auto_9356 ) ) ( not ( = ?auto_9345 ?auto_9372 ) ) ( not ( = ?auto_9345 ?auto_9354 ) ) ( not ( = ?auto_9348 ?auto_9365 ) ) ( not ( = ?auto_9348 ?auto_9373 ) ) ( not ( = ?auto_9348 ?auto_9370 ) ) ( not ( = ?auto_9348 ?auto_9362 ) ) ( not ( = ?auto_9348 ?auto_9369 ) ) ( not ( = ?auto_9348 ?auto_9358 ) ) ( not ( = ?auto_9350 ?auto_9371 ) ) ( not ( = ?auto_9350 ?auto_9359 ) ) ( not ( = ?auto_9350 ?auto_9368 ) ) ( not ( = ?auto_9350 ?auto_9357 ) ) ( not ( = ?auto_9350 ?auto_9361 ) ) ( not ( = ?auto_9350 ?auto_9355 ) ) ( not ( = ?auto_9352 ?auto_9366 ) ) ( not ( = ?auto_9352 ?auto_9364 ) ) ( not ( = ?auto_9352 ?auto_9363 ) ) ( not ( = ?auto_9352 ?auto_9360 ) ) ( not ( = ?auto_9352 ?auto_9367 ) ) ( not ( = ?auto_9352 ?auto_9356 ) ) ( not ( = ?auto_9352 ?auto_9372 ) ) ( not ( = ?auto_9352 ?auto_9354 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_9338 ?auto_9339 ?auto_9340 ?auto_9341 ?auto_9342 ?auto_9343 ?auto_9344 ?auto_9347 ?auto_9346 )
      ( MAKE-1CRATE ?auto_9346 ?auto_9345 )
      ( MAKE-9CRATE-VERIFY ?auto_9338 ?auto_9339 ?auto_9340 ?auto_9341 ?auto_9342 ?auto_9343 ?auto_9344 ?auto_9347 ?auto_9346 ?auto_9345 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9376 - SURFACE
      ?auto_9377 - SURFACE
    )
    :vars
    (
      ?auto_9378 - HOIST
      ?auto_9379 - PLACE
      ?auto_9381 - PLACE
      ?auto_9382 - HOIST
      ?auto_9383 - SURFACE
      ?auto_9380 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9378 ?auto_9379 ) ( SURFACE-AT ?auto_9376 ?auto_9379 ) ( CLEAR ?auto_9376 ) ( IS-CRATE ?auto_9377 ) ( AVAILABLE ?auto_9378 ) ( not ( = ?auto_9381 ?auto_9379 ) ) ( HOIST-AT ?auto_9382 ?auto_9381 ) ( AVAILABLE ?auto_9382 ) ( SURFACE-AT ?auto_9377 ?auto_9381 ) ( ON ?auto_9377 ?auto_9383 ) ( CLEAR ?auto_9377 ) ( TRUCK-AT ?auto_9380 ?auto_9379 ) ( not ( = ?auto_9376 ?auto_9377 ) ) ( not ( = ?auto_9376 ?auto_9383 ) ) ( not ( = ?auto_9377 ?auto_9383 ) ) ( not ( = ?auto_9378 ?auto_9382 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9380 ?auto_9379 ?auto_9381 )
      ( !LIFT ?auto_9382 ?auto_9377 ?auto_9383 ?auto_9381 )
      ( !LOAD ?auto_9382 ?auto_9377 ?auto_9380 ?auto_9381 )
      ( !DRIVE ?auto_9380 ?auto_9381 ?auto_9379 )
      ( !UNLOAD ?auto_9378 ?auto_9377 ?auto_9380 ?auto_9379 )
      ( !DROP ?auto_9378 ?auto_9377 ?auto_9376 ?auto_9379 )
      ( MAKE-1CRATE-VERIFY ?auto_9376 ?auto_9377 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_9395 - SURFACE
      ?auto_9396 - SURFACE
      ?auto_9397 - SURFACE
      ?auto_9398 - SURFACE
      ?auto_9399 - SURFACE
      ?auto_9400 - SURFACE
      ?auto_9401 - SURFACE
      ?auto_9404 - SURFACE
      ?auto_9403 - SURFACE
      ?auto_9402 - SURFACE
      ?auto_9405 - SURFACE
    )
    :vars
    (
      ?auto_9406 - HOIST
      ?auto_9410 - PLACE
      ?auto_9408 - PLACE
      ?auto_9407 - HOIST
      ?auto_9409 - SURFACE
      ?auto_9424 - PLACE
      ?auto_9428 - HOIST
      ?auto_9418 - SURFACE
      ?auto_9412 - PLACE
      ?auto_9426 - HOIST
      ?auto_9414 - SURFACE
      ?auto_9421 - PLACE
      ?auto_9416 - HOIST
      ?auto_9423 - SURFACE
      ?auto_9431 - SURFACE
      ?auto_9425 - PLACE
      ?auto_9427 - HOIST
      ?auto_9415 - SURFACE
      ?auto_9413 - PLACE
      ?auto_9430 - HOIST
      ?auto_9429 - SURFACE
      ?auto_9422 - SURFACE
      ?auto_9432 - SURFACE
      ?auto_9417 - PLACE
      ?auto_9420 - HOIST
      ?auto_9419 - SURFACE
      ?auto_9411 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9406 ?auto_9410 ) ( IS-CRATE ?auto_9405 ) ( not ( = ?auto_9408 ?auto_9410 ) ) ( HOIST-AT ?auto_9407 ?auto_9408 ) ( SURFACE-AT ?auto_9405 ?auto_9408 ) ( ON ?auto_9405 ?auto_9409 ) ( CLEAR ?auto_9405 ) ( not ( = ?auto_9402 ?auto_9405 ) ) ( not ( = ?auto_9402 ?auto_9409 ) ) ( not ( = ?auto_9405 ?auto_9409 ) ) ( not ( = ?auto_9406 ?auto_9407 ) ) ( IS-CRATE ?auto_9402 ) ( not ( = ?auto_9424 ?auto_9410 ) ) ( HOIST-AT ?auto_9428 ?auto_9424 ) ( AVAILABLE ?auto_9428 ) ( SURFACE-AT ?auto_9402 ?auto_9424 ) ( ON ?auto_9402 ?auto_9418 ) ( CLEAR ?auto_9402 ) ( not ( = ?auto_9403 ?auto_9402 ) ) ( not ( = ?auto_9403 ?auto_9418 ) ) ( not ( = ?auto_9402 ?auto_9418 ) ) ( not ( = ?auto_9406 ?auto_9428 ) ) ( IS-CRATE ?auto_9403 ) ( not ( = ?auto_9412 ?auto_9410 ) ) ( HOIST-AT ?auto_9426 ?auto_9412 ) ( AVAILABLE ?auto_9426 ) ( SURFACE-AT ?auto_9403 ?auto_9412 ) ( ON ?auto_9403 ?auto_9414 ) ( CLEAR ?auto_9403 ) ( not ( = ?auto_9404 ?auto_9403 ) ) ( not ( = ?auto_9404 ?auto_9414 ) ) ( not ( = ?auto_9403 ?auto_9414 ) ) ( not ( = ?auto_9406 ?auto_9426 ) ) ( IS-CRATE ?auto_9404 ) ( not ( = ?auto_9421 ?auto_9410 ) ) ( HOIST-AT ?auto_9416 ?auto_9421 ) ( AVAILABLE ?auto_9416 ) ( SURFACE-AT ?auto_9404 ?auto_9421 ) ( ON ?auto_9404 ?auto_9423 ) ( CLEAR ?auto_9404 ) ( not ( = ?auto_9401 ?auto_9404 ) ) ( not ( = ?auto_9401 ?auto_9423 ) ) ( not ( = ?auto_9404 ?auto_9423 ) ) ( not ( = ?auto_9406 ?auto_9416 ) ) ( IS-CRATE ?auto_9401 ) ( SURFACE-AT ?auto_9401 ?auto_9408 ) ( ON ?auto_9401 ?auto_9431 ) ( CLEAR ?auto_9401 ) ( not ( = ?auto_9400 ?auto_9401 ) ) ( not ( = ?auto_9400 ?auto_9431 ) ) ( not ( = ?auto_9401 ?auto_9431 ) ) ( IS-CRATE ?auto_9400 ) ( not ( = ?auto_9425 ?auto_9410 ) ) ( HOIST-AT ?auto_9427 ?auto_9425 ) ( SURFACE-AT ?auto_9400 ?auto_9425 ) ( ON ?auto_9400 ?auto_9415 ) ( CLEAR ?auto_9400 ) ( not ( = ?auto_9399 ?auto_9400 ) ) ( not ( = ?auto_9399 ?auto_9415 ) ) ( not ( = ?auto_9400 ?auto_9415 ) ) ( not ( = ?auto_9406 ?auto_9427 ) ) ( IS-CRATE ?auto_9399 ) ( not ( = ?auto_9413 ?auto_9410 ) ) ( HOIST-AT ?auto_9430 ?auto_9413 ) ( AVAILABLE ?auto_9430 ) ( SURFACE-AT ?auto_9399 ?auto_9413 ) ( ON ?auto_9399 ?auto_9429 ) ( CLEAR ?auto_9399 ) ( not ( = ?auto_9398 ?auto_9399 ) ) ( not ( = ?auto_9398 ?auto_9429 ) ) ( not ( = ?auto_9399 ?auto_9429 ) ) ( not ( = ?auto_9406 ?auto_9430 ) ) ( IS-CRATE ?auto_9398 ) ( AVAILABLE ?auto_9427 ) ( SURFACE-AT ?auto_9398 ?auto_9425 ) ( ON ?auto_9398 ?auto_9422 ) ( CLEAR ?auto_9398 ) ( not ( = ?auto_9397 ?auto_9398 ) ) ( not ( = ?auto_9397 ?auto_9422 ) ) ( not ( = ?auto_9398 ?auto_9422 ) ) ( IS-CRATE ?auto_9397 ) ( AVAILABLE ?auto_9407 ) ( SURFACE-AT ?auto_9397 ?auto_9408 ) ( ON ?auto_9397 ?auto_9432 ) ( CLEAR ?auto_9397 ) ( not ( = ?auto_9396 ?auto_9397 ) ) ( not ( = ?auto_9396 ?auto_9432 ) ) ( not ( = ?auto_9397 ?auto_9432 ) ) ( SURFACE-AT ?auto_9395 ?auto_9410 ) ( CLEAR ?auto_9395 ) ( IS-CRATE ?auto_9396 ) ( AVAILABLE ?auto_9406 ) ( not ( = ?auto_9417 ?auto_9410 ) ) ( HOIST-AT ?auto_9420 ?auto_9417 ) ( AVAILABLE ?auto_9420 ) ( SURFACE-AT ?auto_9396 ?auto_9417 ) ( ON ?auto_9396 ?auto_9419 ) ( CLEAR ?auto_9396 ) ( TRUCK-AT ?auto_9411 ?auto_9410 ) ( not ( = ?auto_9395 ?auto_9396 ) ) ( not ( = ?auto_9395 ?auto_9419 ) ) ( not ( = ?auto_9396 ?auto_9419 ) ) ( not ( = ?auto_9406 ?auto_9420 ) ) ( not ( = ?auto_9395 ?auto_9397 ) ) ( not ( = ?auto_9395 ?auto_9432 ) ) ( not ( = ?auto_9397 ?auto_9419 ) ) ( not ( = ?auto_9408 ?auto_9417 ) ) ( not ( = ?auto_9407 ?auto_9420 ) ) ( not ( = ?auto_9432 ?auto_9419 ) ) ( not ( = ?auto_9395 ?auto_9398 ) ) ( not ( = ?auto_9395 ?auto_9422 ) ) ( not ( = ?auto_9396 ?auto_9398 ) ) ( not ( = ?auto_9396 ?auto_9422 ) ) ( not ( = ?auto_9398 ?auto_9432 ) ) ( not ( = ?auto_9398 ?auto_9419 ) ) ( not ( = ?auto_9425 ?auto_9408 ) ) ( not ( = ?auto_9425 ?auto_9417 ) ) ( not ( = ?auto_9427 ?auto_9407 ) ) ( not ( = ?auto_9427 ?auto_9420 ) ) ( not ( = ?auto_9422 ?auto_9432 ) ) ( not ( = ?auto_9422 ?auto_9419 ) ) ( not ( = ?auto_9395 ?auto_9399 ) ) ( not ( = ?auto_9395 ?auto_9429 ) ) ( not ( = ?auto_9396 ?auto_9399 ) ) ( not ( = ?auto_9396 ?auto_9429 ) ) ( not ( = ?auto_9397 ?auto_9399 ) ) ( not ( = ?auto_9397 ?auto_9429 ) ) ( not ( = ?auto_9399 ?auto_9422 ) ) ( not ( = ?auto_9399 ?auto_9432 ) ) ( not ( = ?auto_9399 ?auto_9419 ) ) ( not ( = ?auto_9413 ?auto_9425 ) ) ( not ( = ?auto_9413 ?auto_9408 ) ) ( not ( = ?auto_9413 ?auto_9417 ) ) ( not ( = ?auto_9430 ?auto_9427 ) ) ( not ( = ?auto_9430 ?auto_9407 ) ) ( not ( = ?auto_9430 ?auto_9420 ) ) ( not ( = ?auto_9429 ?auto_9422 ) ) ( not ( = ?auto_9429 ?auto_9432 ) ) ( not ( = ?auto_9429 ?auto_9419 ) ) ( not ( = ?auto_9395 ?auto_9400 ) ) ( not ( = ?auto_9395 ?auto_9415 ) ) ( not ( = ?auto_9396 ?auto_9400 ) ) ( not ( = ?auto_9396 ?auto_9415 ) ) ( not ( = ?auto_9397 ?auto_9400 ) ) ( not ( = ?auto_9397 ?auto_9415 ) ) ( not ( = ?auto_9398 ?auto_9400 ) ) ( not ( = ?auto_9398 ?auto_9415 ) ) ( not ( = ?auto_9400 ?auto_9429 ) ) ( not ( = ?auto_9400 ?auto_9422 ) ) ( not ( = ?auto_9400 ?auto_9432 ) ) ( not ( = ?auto_9400 ?auto_9419 ) ) ( not ( = ?auto_9415 ?auto_9429 ) ) ( not ( = ?auto_9415 ?auto_9422 ) ) ( not ( = ?auto_9415 ?auto_9432 ) ) ( not ( = ?auto_9415 ?auto_9419 ) ) ( not ( = ?auto_9395 ?auto_9401 ) ) ( not ( = ?auto_9395 ?auto_9431 ) ) ( not ( = ?auto_9396 ?auto_9401 ) ) ( not ( = ?auto_9396 ?auto_9431 ) ) ( not ( = ?auto_9397 ?auto_9401 ) ) ( not ( = ?auto_9397 ?auto_9431 ) ) ( not ( = ?auto_9398 ?auto_9401 ) ) ( not ( = ?auto_9398 ?auto_9431 ) ) ( not ( = ?auto_9399 ?auto_9401 ) ) ( not ( = ?auto_9399 ?auto_9431 ) ) ( not ( = ?auto_9401 ?auto_9415 ) ) ( not ( = ?auto_9401 ?auto_9429 ) ) ( not ( = ?auto_9401 ?auto_9422 ) ) ( not ( = ?auto_9401 ?auto_9432 ) ) ( not ( = ?auto_9401 ?auto_9419 ) ) ( not ( = ?auto_9431 ?auto_9415 ) ) ( not ( = ?auto_9431 ?auto_9429 ) ) ( not ( = ?auto_9431 ?auto_9422 ) ) ( not ( = ?auto_9431 ?auto_9432 ) ) ( not ( = ?auto_9431 ?auto_9419 ) ) ( not ( = ?auto_9395 ?auto_9404 ) ) ( not ( = ?auto_9395 ?auto_9423 ) ) ( not ( = ?auto_9396 ?auto_9404 ) ) ( not ( = ?auto_9396 ?auto_9423 ) ) ( not ( = ?auto_9397 ?auto_9404 ) ) ( not ( = ?auto_9397 ?auto_9423 ) ) ( not ( = ?auto_9398 ?auto_9404 ) ) ( not ( = ?auto_9398 ?auto_9423 ) ) ( not ( = ?auto_9399 ?auto_9404 ) ) ( not ( = ?auto_9399 ?auto_9423 ) ) ( not ( = ?auto_9400 ?auto_9404 ) ) ( not ( = ?auto_9400 ?auto_9423 ) ) ( not ( = ?auto_9404 ?auto_9431 ) ) ( not ( = ?auto_9404 ?auto_9415 ) ) ( not ( = ?auto_9404 ?auto_9429 ) ) ( not ( = ?auto_9404 ?auto_9422 ) ) ( not ( = ?auto_9404 ?auto_9432 ) ) ( not ( = ?auto_9404 ?auto_9419 ) ) ( not ( = ?auto_9421 ?auto_9408 ) ) ( not ( = ?auto_9421 ?auto_9425 ) ) ( not ( = ?auto_9421 ?auto_9413 ) ) ( not ( = ?auto_9421 ?auto_9417 ) ) ( not ( = ?auto_9416 ?auto_9407 ) ) ( not ( = ?auto_9416 ?auto_9427 ) ) ( not ( = ?auto_9416 ?auto_9430 ) ) ( not ( = ?auto_9416 ?auto_9420 ) ) ( not ( = ?auto_9423 ?auto_9431 ) ) ( not ( = ?auto_9423 ?auto_9415 ) ) ( not ( = ?auto_9423 ?auto_9429 ) ) ( not ( = ?auto_9423 ?auto_9422 ) ) ( not ( = ?auto_9423 ?auto_9432 ) ) ( not ( = ?auto_9423 ?auto_9419 ) ) ( not ( = ?auto_9395 ?auto_9403 ) ) ( not ( = ?auto_9395 ?auto_9414 ) ) ( not ( = ?auto_9396 ?auto_9403 ) ) ( not ( = ?auto_9396 ?auto_9414 ) ) ( not ( = ?auto_9397 ?auto_9403 ) ) ( not ( = ?auto_9397 ?auto_9414 ) ) ( not ( = ?auto_9398 ?auto_9403 ) ) ( not ( = ?auto_9398 ?auto_9414 ) ) ( not ( = ?auto_9399 ?auto_9403 ) ) ( not ( = ?auto_9399 ?auto_9414 ) ) ( not ( = ?auto_9400 ?auto_9403 ) ) ( not ( = ?auto_9400 ?auto_9414 ) ) ( not ( = ?auto_9401 ?auto_9403 ) ) ( not ( = ?auto_9401 ?auto_9414 ) ) ( not ( = ?auto_9403 ?auto_9423 ) ) ( not ( = ?auto_9403 ?auto_9431 ) ) ( not ( = ?auto_9403 ?auto_9415 ) ) ( not ( = ?auto_9403 ?auto_9429 ) ) ( not ( = ?auto_9403 ?auto_9422 ) ) ( not ( = ?auto_9403 ?auto_9432 ) ) ( not ( = ?auto_9403 ?auto_9419 ) ) ( not ( = ?auto_9412 ?auto_9421 ) ) ( not ( = ?auto_9412 ?auto_9408 ) ) ( not ( = ?auto_9412 ?auto_9425 ) ) ( not ( = ?auto_9412 ?auto_9413 ) ) ( not ( = ?auto_9412 ?auto_9417 ) ) ( not ( = ?auto_9426 ?auto_9416 ) ) ( not ( = ?auto_9426 ?auto_9407 ) ) ( not ( = ?auto_9426 ?auto_9427 ) ) ( not ( = ?auto_9426 ?auto_9430 ) ) ( not ( = ?auto_9426 ?auto_9420 ) ) ( not ( = ?auto_9414 ?auto_9423 ) ) ( not ( = ?auto_9414 ?auto_9431 ) ) ( not ( = ?auto_9414 ?auto_9415 ) ) ( not ( = ?auto_9414 ?auto_9429 ) ) ( not ( = ?auto_9414 ?auto_9422 ) ) ( not ( = ?auto_9414 ?auto_9432 ) ) ( not ( = ?auto_9414 ?auto_9419 ) ) ( not ( = ?auto_9395 ?auto_9402 ) ) ( not ( = ?auto_9395 ?auto_9418 ) ) ( not ( = ?auto_9396 ?auto_9402 ) ) ( not ( = ?auto_9396 ?auto_9418 ) ) ( not ( = ?auto_9397 ?auto_9402 ) ) ( not ( = ?auto_9397 ?auto_9418 ) ) ( not ( = ?auto_9398 ?auto_9402 ) ) ( not ( = ?auto_9398 ?auto_9418 ) ) ( not ( = ?auto_9399 ?auto_9402 ) ) ( not ( = ?auto_9399 ?auto_9418 ) ) ( not ( = ?auto_9400 ?auto_9402 ) ) ( not ( = ?auto_9400 ?auto_9418 ) ) ( not ( = ?auto_9401 ?auto_9402 ) ) ( not ( = ?auto_9401 ?auto_9418 ) ) ( not ( = ?auto_9404 ?auto_9402 ) ) ( not ( = ?auto_9404 ?auto_9418 ) ) ( not ( = ?auto_9402 ?auto_9414 ) ) ( not ( = ?auto_9402 ?auto_9423 ) ) ( not ( = ?auto_9402 ?auto_9431 ) ) ( not ( = ?auto_9402 ?auto_9415 ) ) ( not ( = ?auto_9402 ?auto_9429 ) ) ( not ( = ?auto_9402 ?auto_9422 ) ) ( not ( = ?auto_9402 ?auto_9432 ) ) ( not ( = ?auto_9402 ?auto_9419 ) ) ( not ( = ?auto_9424 ?auto_9412 ) ) ( not ( = ?auto_9424 ?auto_9421 ) ) ( not ( = ?auto_9424 ?auto_9408 ) ) ( not ( = ?auto_9424 ?auto_9425 ) ) ( not ( = ?auto_9424 ?auto_9413 ) ) ( not ( = ?auto_9424 ?auto_9417 ) ) ( not ( = ?auto_9428 ?auto_9426 ) ) ( not ( = ?auto_9428 ?auto_9416 ) ) ( not ( = ?auto_9428 ?auto_9407 ) ) ( not ( = ?auto_9428 ?auto_9427 ) ) ( not ( = ?auto_9428 ?auto_9430 ) ) ( not ( = ?auto_9428 ?auto_9420 ) ) ( not ( = ?auto_9418 ?auto_9414 ) ) ( not ( = ?auto_9418 ?auto_9423 ) ) ( not ( = ?auto_9418 ?auto_9431 ) ) ( not ( = ?auto_9418 ?auto_9415 ) ) ( not ( = ?auto_9418 ?auto_9429 ) ) ( not ( = ?auto_9418 ?auto_9422 ) ) ( not ( = ?auto_9418 ?auto_9432 ) ) ( not ( = ?auto_9418 ?auto_9419 ) ) ( not ( = ?auto_9395 ?auto_9405 ) ) ( not ( = ?auto_9395 ?auto_9409 ) ) ( not ( = ?auto_9396 ?auto_9405 ) ) ( not ( = ?auto_9396 ?auto_9409 ) ) ( not ( = ?auto_9397 ?auto_9405 ) ) ( not ( = ?auto_9397 ?auto_9409 ) ) ( not ( = ?auto_9398 ?auto_9405 ) ) ( not ( = ?auto_9398 ?auto_9409 ) ) ( not ( = ?auto_9399 ?auto_9405 ) ) ( not ( = ?auto_9399 ?auto_9409 ) ) ( not ( = ?auto_9400 ?auto_9405 ) ) ( not ( = ?auto_9400 ?auto_9409 ) ) ( not ( = ?auto_9401 ?auto_9405 ) ) ( not ( = ?auto_9401 ?auto_9409 ) ) ( not ( = ?auto_9404 ?auto_9405 ) ) ( not ( = ?auto_9404 ?auto_9409 ) ) ( not ( = ?auto_9403 ?auto_9405 ) ) ( not ( = ?auto_9403 ?auto_9409 ) ) ( not ( = ?auto_9405 ?auto_9418 ) ) ( not ( = ?auto_9405 ?auto_9414 ) ) ( not ( = ?auto_9405 ?auto_9423 ) ) ( not ( = ?auto_9405 ?auto_9431 ) ) ( not ( = ?auto_9405 ?auto_9415 ) ) ( not ( = ?auto_9405 ?auto_9429 ) ) ( not ( = ?auto_9405 ?auto_9422 ) ) ( not ( = ?auto_9405 ?auto_9432 ) ) ( not ( = ?auto_9405 ?auto_9419 ) ) ( not ( = ?auto_9409 ?auto_9418 ) ) ( not ( = ?auto_9409 ?auto_9414 ) ) ( not ( = ?auto_9409 ?auto_9423 ) ) ( not ( = ?auto_9409 ?auto_9431 ) ) ( not ( = ?auto_9409 ?auto_9415 ) ) ( not ( = ?auto_9409 ?auto_9429 ) ) ( not ( = ?auto_9409 ?auto_9422 ) ) ( not ( = ?auto_9409 ?auto_9432 ) ) ( not ( = ?auto_9409 ?auto_9419 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_9395 ?auto_9396 ?auto_9397 ?auto_9398 ?auto_9399 ?auto_9400 ?auto_9401 ?auto_9404 ?auto_9403 ?auto_9402 )
      ( MAKE-1CRATE ?auto_9402 ?auto_9405 )
      ( MAKE-10CRATE-VERIFY ?auto_9395 ?auto_9396 ?auto_9397 ?auto_9398 ?auto_9399 ?auto_9400 ?auto_9401 ?auto_9404 ?auto_9403 ?auto_9402 ?auto_9405 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9435 - SURFACE
      ?auto_9436 - SURFACE
    )
    :vars
    (
      ?auto_9437 - HOIST
      ?auto_9438 - PLACE
      ?auto_9440 - PLACE
      ?auto_9441 - HOIST
      ?auto_9442 - SURFACE
      ?auto_9439 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9437 ?auto_9438 ) ( SURFACE-AT ?auto_9435 ?auto_9438 ) ( CLEAR ?auto_9435 ) ( IS-CRATE ?auto_9436 ) ( AVAILABLE ?auto_9437 ) ( not ( = ?auto_9440 ?auto_9438 ) ) ( HOIST-AT ?auto_9441 ?auto_9440 ) ( AVAILABLE ?auto_9441 ) ( SURFACE-AT ?auto_9436 ?auto_9440 ) ( ON ?auto_9436 ?auto_9442 ) ( CLEAR ?auto_9436 ) ( TRUCK-AT ?auto_9439 ?auto_9438 ) ( not ( = ?auto_9435 ?auto_9436 ) ) ( not ( = ?auto_9435 ?auto_9442 ) ) ( not ( = ?auto_9436 ?auto_9442 ) ) ( not ( = ?auto_9437 ?auto_9441 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9439 ?auto_9438 ?auto_9440 )
      ( !LIFT ?auto_9441 ?auto_9436 ?auto_9442 ?auto_9440 )
      ( !LOAD ?auto_9441 ?auto_9436 ?auto_9439 ?auto_9440 )
      ( !DRIVE ?auto_9439 ?auto_9440 ?auto_9438 )
      ( !UNLOAD ?auto_9437 ?auto_9436 ?auto_9439 ?auto_9438 )
      ( !DROP ?auto_9437 ?auto_9436 ?auto_9435 ?auto_9438 )
      ( MAKE-1CRATE-VERIFY ?auto_9435 ?auto_9436 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_9455 - SURFACE
      ?auto_9456 - SURFACE
      ?auto_9457 - SURFACE
      ?auto_9458 - SURFACE
      ?auto_9459 - SURFACE
      ?auto_9460 - SURFACE
      ?auto_9461 - SURFACE
      ?auto_9464 - SURFACE
      ?auto_9463 - SURFACE
      ?auto_9462 - SURFACE
      ?auto_9465 - SURFACE
      ?auto_9466 - SURFACE
    )
    :vars
    (
      ?auto_9468 - HOIST
      ?auto_9470 - PLACE
      ?auto_9471 - PLACE
      ?auto_9469 - HOIST
      ?auto_9472 - SURFACE
      ?auto_9473 - PLACE
      ?auto_9493 - HOIST
      ?auto_9492 - SURFACE
      ?auto_9487 - PLACE
      ?auto_9478 - HOIST
      ?auto_9484 - SURFACE
      ?auto_9475 - PLACE
      ?auto_9494 - HOIST
      ?auto_9479 - SURFACE
      ?auto_9489 - PLACE
      ?auto_9482 - HOIST
      ?auto_9480 - SURFACE
      ?auto_9491 - SURFACE
      ?auto_9485 - PLACE
      ?auto_9486 - HOIST
      ?auto_9477 - SURFACE
      ?auto_9474 - PLACE
      ?auto_9476 - HOIST
      ?auto_9481 - SURFACE
      ?auto_9488 - SURFACE
      ?auto_9490 - SURFACE
      ?auto_9483 - SURFACE
      ?auto_9467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9468 ?auto_9470 ) ( IS-CRATE ?auto_9466 ) ( not ( = ?auto_9471 ?auto_9470 ) ) ( HOIST-AT ?auto_9469 ?auto_9471 ) ( SURFACE-AT ?auto_9466 ?auto_9471 ) ( ON ?auto_9466 ?auto_9472 ) ( CLEAR ?auto_9466 ) ( not ( = ?auto_9465 ?auto_9466 ) ) ( not ( = ?auto_9465 ?auto_9472 ) ) ( not ( = ?auto_9466 ?auto_9472 ) ) ( not ( = ?auto_9468 ?auto_9469 ) ) ( IS-CRATE ?auto_9465 ) ( not ( = ?auto_9473 ?auto_9470 ) ) ( HOIST-AT ?auto_9493 ?auto_9473 ) ( SURFACE-AT ?auto_9465 ?auto_9473 ) ( ON ?auto_9465 ?auto_9492 ) ( CLEAR ?auto_9465 ) ( not ( = ?auto_9462 ?auto_9465 ) ) ( not ( = ?auto_9462 ?auto_9492 ) ) ( not ( = ?auto_9465 ?auto_9492 ) ) ( not ( = ?auto_9468 ?auto_9493 ) ) ( IS-CRATE ?auto_9462 ) ( not ( = ?auto_9487 ?auto_9470 ) ) ( HOIST-AT ?auto_9478 ?auto_9487 ) ( AVAILABLE ?auto_9478 ) ( SURFACE-AT ?auto_9462 ?auto_9487 ) ( ON ?auto_9462 ?auto_9484 ) ( CLEAR ?auto_9462 ) ( not ( = ?auto_9463 ?auto_9462 ) ) ( not ( = ?auto_9463 ?auto_9484 ) ) ( not ( = ?auto_9462 ?auto_9484 ) ) ( not ( = ?auto_9468 ?auto_9478 ) ) ( IS-CRATE ?auto_9463 ) ( not ( = ?auto_9475 ?auto_9470 ) ) ( HOIST-AT ?auto_9494 ?auto_9475 ) ( AVAILABLE ?auto_9494 ) ( SURFACE-AT ?auto_9463 ?auto_9475 ) ( ON ?auto_9463 ?auto_9479 ) ( CLEAR ?auto_9463 ) ( not ( = ?auto_9464 ?auto_9463 ) ) ( not ( = ?auto_9464 ?auto_9479 ) ) ( not ( = ?auto_9463 ?auto_9479 ) ) ( not ( = ?auto_9468 ?auto_9494 ) ) ( IS-CRATE ?auto_9464 ) ( not ( = ?auto_9489 ?auto_9470 ) ) ( HOIST-AT ?auto_9482 ?auto_9489 ) ( AVAILABLE ?auto_9482 ) ( SURFACE-AT ?auto_9464 ?auto_9489 ) ( ON ?auto_9464 ?auto_9480 ) ( CLEAR ?auto_9464 ) ( not ( = ?auto_9461 ?auto_9464 ) ) ( not ( = ?auto_9461 ?auto_9480 ) ) ( not ( = ?auto_9464 ?auto_9480 ) ) ( not ( = ?auto_9468 ?auto_9482 ) ) ( IS-CRATE ?auto_9461 ) ( SURFACE-AT ?auto_9461 ?auto_9473 ) ( ON ?auto_9461 ?auto_9491 ) ( CLEAR ?auto_9461 ) ( not ( = ?auto_9460 ?auto_9461 ) ) ( not ( = ?auto_9460 ?auto_9491 ) ) ( not ( = ?auto_9461 ?auto_9491 ) ) ( IS-CRATE ?auto_9460 ) ( not ( = ?auto_9485 ?auto_9470 ) ) ( HOIST-AT ?auto_9486 ?auto_9485 ) ( SURFACE-AT ?auto_9460 ?auto_9485 ) ( ON ?auto_9460 ?auto_9477 ) ( CLEAR ?auto_9460 ) ( not ( = ?auto_9459 ?auto_9460 ) ) ( not ( = ?auto_9459 ?auto_9477 ) ) ( not ( = ?auto_9460 ?auto_9477 ) ) ( not ( = ?auto_9468 ?auto_9486 ) ) ( IS-CRATE ?auto_9459 ) ( not ( = ?auto_9474 ?auto_9470 ) ) ( HOIST-AT ?auto_9476 ?auto_9474 ) ( AVAILABLE ?auto_9476 ) ( SURFACE-AT ?auto_9459 ?auto_9474 ) ( ON ?auto_9459 ?auto_9481 ) ( CLEAR ?auto_9459 ) ( not ( = ?auto_9458 ?auto_9459 ) ) ( not ( = ?auto_9458 ?auto_9481 ) ) ( not ( = ?auto_9459 ?auto_9481 ) ) ( not ( = ?auto_9468 ?auto_9476 ) ) ( IS-CRATE ?auto_9458 ) ( AVAILABLE ?auto_9486 ) ( SURFACE-AT ?auto_9458 ?auto_9485 ) ( ON ?auto_9458 ?auto_9488 ) ( CLEAR ?auto_9458 ) ( not ( = ?auto_9457 ?auto_9458 ) ) ( not ( = ?auto_9457 ?auto_9488 ) ) ( not ( = ?auto_9458 ?auto_9488 ) ) ( IS-CRATE ?auto_9457 ) ( AVAILABLE ?auto_9493 ) ( SURFACE-AT ?auto_9457 ?auto_9473 ) ( ON ?auto_9457 ?auto_9490 ) ( CLEAR ?auto_9457 ) ( not ( = ?auto_9456 ?auto_9457 ) ) ( not ( = ?auto_9456 ?auto_9490 ) ) ( not ( = ?auto_9457 ?auto_9490 ) ) ( SURFACE-AT ?auto_9455 ?auto_9470 ) ( CLEAR ?auto_9455 ) ( IS-CRATE ?auto_9456 ) ( AVAILABLE ?auto_9468 ) ( AVAILABLE ?auto_9469 ) ( SURFACE-AT ?auto_9456 ?auto_9471 ) ( ON ?auto_9456 ?auto_9483 ) ( CLEAR ?auto_9456 ) ( TRUCK-AT ?auto_9467 ?auto_9470 ) ( not ( = ?auto_9455 ?auto_9456 ) ) ( not ( = ?auto_9455 ?auto_9483 ) ) ( not ( = ?auto_9456 ?auto_9483 ) ) ( not ( = ?auto_9455 ?auto_9457 ) ) ( not ( = ?auto_9455 ?auto_9490 ) ) ( not ( = ?auto_9457 ?auto_9483 ) ) ( not ( = ?auto_9473 ?auto_9471 ) ) ( not ( = ?auto_9493 ?auto_9469 ) ) ( not ( = ?auto_9490 ?auto_9483 ) ) ( not ( = ?auto_9455 ?auto_9458 ) ) ( not ( = ?auto_9455 ?auto_9488 ) ) ( not ( = ?auto_9456 ?auto_9458 ) ) ( not ( = ?auto_9456 ?auto_9488 ) ) ( not ( = ?auto_9458 ?auto_9490 ) ) ( not ( = ?auto_9458 ?auto_9483 ) ) ( not ( = ?auto_9485 ?auto_9473 ) ) ( not ( = ?auto_9485 ?auto_9471 ) ) ( not ( = ?auto_9486 ?auto_9493 ) ) ( not ( = ?auto_9486 ?auto_9469 ) ) ( not ( = ?auto_9488 ?auto_9490 ) ) ( not ( = ?auto_9488 ?auto_9483 ) ) ( not ( = ?auto_9455 ?auto_9459 ) ) ( not ( = ?auto_9455 ?auto_9481 ) ) ( not ( = ?auto_9456 ?auto_9459 ) ) ( not ( = ?auto_9456 ?auto_9481 ) ) ( not ( = ?auto_9457 ?auto_9459 ) ) ( not ( = ?auto_9457 ?auto_9481 ) ) ( not ( = ?auto_9459 ?auto_9488 ) ) ( not ( = ?auto_9459 ?auto_9490 ) ) ( not ( = ?auto_9459 ?auto_9483 ) ) ( not ( = ?auto_9474 ?auto_9485 ) ) ( not ( = ?auto_9474 ?auto_9473 ) ) ( not ( = ?auto_9474 ?auto_9471 ) ) ( not ( = ?auto_9476 ?auto_9486 ) ) ( not ( = ?auto_9476 ?auto_9493 ) ) ( not ( = ?auto_9476 ?auto_9469 ) ) ( not ( = ?auto_9481 ?auto_9488 ) ) ( not ( = ?auto_9481 ?auto_9490 ) ) ( not ( = ?auto_9481 ?auto_9483 ) ) ( not ( = ?auto_9455 ?auto_9460 ) ) ( not ( = ?auto_9455 ?auto_9477 ) ) ( not ( = ?auto_9456 ?auto_9460 ) ) ( not ( = ?auto_9456 ?auto_9477 ) ) ( not ( = ?auto_9457 ?auto_9460 ) ) ( not ( = ?auto_9457 ?auto_9477 ) ) ( not ( = ?auto_9458 ?auto_9460 ) ) ( not ( = ?auto_9458 ?auto_9477 ) ) ( not ( = ?auto_9460 ?auto_9481 ) ) ( not ( = ?auto_9460 ?auto_9488 ) ) ( not ( = ?auto_9460 ?auto_9490 ) ) ( not ( = ?auto_9460 ?auto_9483 ) ) ( not ( = ?auto_9477 ?auto_9481 ) ) ( not ( = ?auto_9477 ?auto_9488 ) ) ( not ( = ?auto_9477 ?auto_9490 ) ) ( not ( = ?auto_9477 ?auto_9483 ) ) ( not ( = ?auto_9455 ?auto_9461 ) ) ( not ( = ?auto_9455 ?auto_9491 ) ) ( not ( = ?auto_9456 ?auto_9461 ) ) ( not ( = ?auto_9456 ?auto_9491 ) ) ( not ( = ?auto_9457 ?auto_9461 ) ) ( not ( = ?auto_9457 ?auto_9491 ) ) ( not ( = ?auto_9458 ?auto_9461 ) ) ( not ( = ?auto_9458 ?auto_9491 ) ) ( not ( = ?auto_9459 ?auto_9461 ) ) ( not ( = ?auto_9459 ?auto_9491 ) ) ( not ( = ?auto_9461 ?auto_9477 ) ) ( not ( = ?auto_9461 ?auto_9481 ) ) ( not ( = ?auto_9461 ?auto_9488 ) ) ( not ( = ?auto_9461 ?auto_9490 ) ) ( not ( = ?auto_9461 ?auto_9483 ) ) ( not ( = ?auto_9491 ?auto_9477 ) ) ( not ( = ?auto_9491 ?auto_9481 ) ) ( not ( = ?auto_9491 ?auto_9488 ) ) ( not ( = ?auto_9491 ?auto_9490 ) ) ( not ( = ?auto_9491 ?auto_9483 ) ) ( not ( = ?auto_9455 ?auto_9464 ) ) ( not ( = ?auto_9455 ?auto_9480 ) ) ( not ( = ?auto_9456 ?auto_9464 ) ) ( not ( = ?auto_9456 ?auto_9480 ) ) ( not ( = ?auto_9457 ?auto_9464 ) ) ( not ( = ?auto_9457 ?auto_9480 ) ) ( not ( = ?auto_9458 ?auto_9464 ) ) ( not ( = ?auto_9458 ?auto_9480 ) ) ( not ( = ?auto_9459 ?auto_9464 ) ) ( not ( = ?auto_9459 ?auto_9480 ) ) ( not ( = ?auto_9460 ?auto_9464 ) ) ( not ( = ?auto_9460 ?auto_9480 ) ) ( not ( = ?auto_9464 ?auto_9491 ) ) ( not ( = ?auto_9464 ?auto_9477 ) ) ( not ( = ?auto_9464 ?auto_9481 ) ) ( not ( = ?auto_9464 ?auto_9488 ) ) ( not ( = ?auto_9464 ?auto_9490 ) ) ( not ( = ?auto_9464 ?auto_9483 ) ) ( not ( = ?auto_9489 ?auto_9473 ) ) ( not ( = ?auto_9489 ?auto_9485 ) ) ( not ( = ?auto_9489 ?auto_9474 ) ) ( not ( = ?auto_9489 ?auto_9471 ) ) ( not ( = ?auto_9482 ?auto_9493 ) ) ( not ( = ?auto_9482 ?auto_9486 ) ) ( not ( = ?auto_9482 ?auto_9476 ) ) ( not ( = ?auto_9482 ?auto_9469 ) ) ( not ( = ?auto_9480 ?auto_9491 ) ) ( not ( = ?auto_9480 ?auto_9477 ) ) ( not ( = ?auto_9480 ?auto_9481 ) ) ( not ( = ?auto_9480 ?auto_9488 ) ) ( not ( = ?auto_9480 ?auto_9490 ) ) ( not ( = ?auto_9480 ?auto_9483 ) ) ( not ( = ?auto_9455 ?auto_9463 ) ) ( not ( = ?auto_9455 ?auto_9479 ) ) ( not ( = ?auto_9456 ?auto_9463 ) ) ( not ( = ?auto_9456 ?auto_9479 ) ) ( not ( = ?auto_9457 ?auto_9463 ) ) ( not ( = ?auto_9457 ?auto_9479 ) ) ( not ( = ?auto_9458 ?auto_9463 ) ) ( not ( = ?auto_9458 ?auto_9479 ) ) ( not ( = ?auto_9459 ?auto_9463 ) ) ( not ( = ?auto_9459 ?auto_9479 ) ) ( not ( = ?auto_9460 ?auto_9463 ) ) ( not ( = ?auto_9460 ?auto_9479 ) ) ( not ( = ?auto_9461 ?auto_9463 ) ) ( not ( = ?auto_9461 ?auto_9479 ) ) ( not ( = ?auto_9463 ?auto_9480 ) ) ( not ( = ?auto_9463 ?auto_9491 ) ) ( not ( = ?auto_9463 ?auto_9477 ) ) ( not ( = ?auto_9463 ?auto_9481 ) ) ( not ( = ?auto_9463 ?auto_9488 ) ) ( not ( = ?auto_9463 ?auto_9490 ) ) ( not ( = ?auto_9463 ?auto_9483 ) ) ( not ( = ?auto_9475 ?auto_9489 ) ) ( not ( = ?auto_9475 ?auto_9473 ) ) ( not ( = ?auto_9475 ?auto_9485 ) ) ( not ( = ?auto_9475 ?auto_9474 ) ) ( not ( = ?auto_9475 ?auto_9471 ) ) ( not ( = ?auto_9494 ?auto_9482 ) ) ( not ( = ?auto_9494 ?auto_9493 ) ) ( not ( = ?auto_9494 ?auto_9486 ) ) ( not ( = ?auto_9494 ?auto_9476 ) ) ( not ( = ?auto_9494 ?auto_9469 ) ) ( not ( = ?auto_9479 ?auto_9480 ) ) ( not ( = ?auto_9479 ?auto_9491 ) ) ( not ( = ?auto_9479 ?auto_9477 ) ) ( not ( = ?auto_9479 ?auto_9481 ) ) ( not ( = ?auto_9479 ?auto_9488 ) ) ( not ( = ?auto_9479 ?auto_9490 ) ) ( not ( = ?auto_9479 ?auto_9483 ) ) ( not ( = ?auto_9455 ?auto_9462 ) ) ( not ( = ?auto_9455 ?auto_9484 ) ) ( not ( = ?auto_9456 ?auto_9462 ) ) ( not ( = ?auto_9456 ?auto_9484 ) ) ( not ( = ?auto_9457 ?auto_9462 ) ) ( not ( = ?auto_9457 ?auto_9484 ) ) ( not ( = ?auto_9458 ?auto_9462 ) ) ( not ( = ?auto_9458 ?auto_9484 ) ) ( not ( = ?auto_9459 ?auto_9462 ) ) ( not ( = ?auto_9459 ?auto_9484 ) ) ( not ( = ?auto_9460 ?auto_9462 ) ) ( not ( = ?auto_9460 ?auto_9484 ) ) ( not ( = ?auto_9461 ?auto_9462 ) ) ( not ( = ?auto_9461 ?auto_9484 ) ) ( not ( = ?auto_9464 ?auto_9462 ) ) ( not ( = ?auto_9464 ?auto_9484 ) ) ( not ( = ?auto_9462 ?auto_9479 ) ) ( not ( = ?auto_9462 ?auto_9480 ) ) ( not ( = ?auto_9462 ?auto_9491 ) ) ( not ( = ?auto_9462 ?auto_9477 ) ) ( not ( = ?auto_9462 ?auto_9481 ) ) ( not ( = ?auto_9462 ?auto_9488 ) ) ( not ( = ?auto_9462 ?auto_9490 ) ) ( not ( = ?auto_9462 ?auto_9483 ) ) ( not ( = ?auto_9487 ?auto_9475 ) ) ( not ( = ?auto_9487 ?auto_9489 ) ) ( not ( = ?auto_9487 ?auto_9473 ) ) ( not ( = ?auto_9487 ?auto_9485 ) ) ( not ( = ?auto_9487 ?auto_9474 ) ) ( not ( = ?auto_9487 ?auto_9471 ) ) ( not ( = ?auto_9478 ?auto_9494 ) ) ( not ( = ?auto_9478 ?auto_9482 ) ) ( not ( = ?auto_9478 ?auto_9493 ) ) ( not ( = ?auto_9478 ?auto_9486 ) ) ( not ( = ?auto_9478 ?auto_9476 ) ) ( not ( = ?auto_9478 ?auto_9469 ) ) ( not ( = ?auto_9484 ?auto_9479 ) ) ( not ( = ?auto_9484 ?auto_9480 ) ) ( not ( = ?auto_9484 ?auto_9491 ) ) ( not ( = ?auto_9484 ?auto_9477 ) ) ( not ( = ?auto_9484 ?auto_9481 ) ) ( not ( = ?auto_9484 ?auto_9488 ) ) ( not ( = ?auto_9484 ?auto_9490 ) ) ( not ( = ?auto_9484 ?auto_9483 ) ) ( not ( = ?auto_9455 ?auto_9465 ) ) ( not ( = ?auto_9455 ?auto_9492 ) ) ( not ( = ?auto_9456 ?auto_9465 ) ) ( not ( = ?auto_9456 ?auto_9492 ) ) ( not ( = ?auto_9457 ?auto_9465 ) ) ( not ( = ?auto_9457 ?auto_9492 ) ) ( not ( = ?auto_9458 ?auto_9465 ) ) ( not ( = ?auto_9458 ?auto_9492 ) ) ( not ( = ?auto_9459 ?auto_9465 ) ) ( not ( = ?auto_9459 ?auto_9492 ) ) ( not ( = ?auto_9460 ?auto_9465 ) ) ( not ( = ?auto_9460 ?auto_9492 ) ) ( not ( = ?auto_9461 ?auto_9465 ) ) ( not ( = ?auto_9461 ?auto_9492 ) ) ( not ( = ?auto_9464 ?auto_9465 ) ) ( not ( = ?auto_9464 ?auto_9492 ) ) ( not ( = ?auto_9463 ?auto_9465 ) ) ( not ( = ?auto_9463 ?auto_9492 ) ) ( not ( = ?auto_9465 ?auto_9484 ) ) ( not ( = ?auto_9465 ?auto_9479 ) ) ( not ( = ?auto_9465 ?auto_9480 ) ) ( not ( = ?auto_9465 ?auto_9491 ) ) ( not ( = ?auto_9465 ?auto_9477 ) ) ( not ( = ?auto_9465 ?auto_9481 ) ) ( not ( = ?auto_9465 ?auto_9488 ) ) ( not ( = ?auto_9465 ?auto_9490 ) ) ( not ( = ?auto_9465 ?auto_9483 ) ) ( not ( = ?auto_9492 ?auto_9484 ) ) ( not ( = ?auto_9492 ?auto_9479 ) ) ( not ( = ?auto_9492 ?auto_9480 ) ) ( not ( = ?auto_9492 ?auto_9491 ) ) ( not ( = ?auto_9492 ?auto_9477 ) ) ( not ( = ?auto_9492 ?auto_9481 ) ) ( not ( = ?auto_9492 ?auto_9488 ) ) ( not ( = ?auto_9492 ?auto_9490 ) ) ( not ( = ?auto_9492 ?auto_9483 ) ) ( not ( = ?auto_9455 ?auto_9466 ) ) ( not ( = ?auto_9455 ?auto_9472 ) ) ( not ( = ?auto_9456 ?auto_9466 ) ) ( not ( = ?auto_9456 ?auto_9472 ) ) ( not ( = ?auto_9457 ?auto_9466 ) ) ( not ( = ?auto_9457 ?auto_9472 ) ) ( not ( = ?auto_9458 ?auto_9466 ) ) ( not ( = ?auto_9458 ?auto_9472 ) ) ( not ( = ?auto_9459 ?auto_9466 ) ) ( not ( = ?auto_9459 ?auto_9472 ) ) ( not ( = ?auto_9460 ?auto_9466 ) ) ( not ( = ?auto_9460 ?auto_9472 ) ) ( not ( = ?auto_9461 ?auto_9466 ) ) ( not ( = ?auto_9461 ?auto_9472 ) ) ( not ( = ?auto_9464 ?auto_9466 ) ) ( not ( = ?auto_9464 ?auto_9472 ) ) ( not ( = ?auto_9463 ?auto_9466 ) ) ( not ( = ?auto_9463 ?auto_9472 ) ) ( not ( = ?auto_9462 ?auto_9466 ) ) ( not ( = ?auto_9462 ?auto_9472 ) ) ( not ( = ?auto_9466 ?auto_9492 ) ) ( not ( = ?auto_9466 ?auto_9484 ) ) ( not ( = ?auto_9466 ?auto_9479 ) ) ( not ( = ?auto_9466 ?auto_9480 ) ) ( not ( = ?auto_9466 ?auto_9491 ) ) ( not ( = ?auto_9466 ?auto_9477 ) ) ( not ( = ?auto_9466 ?auto_9481 ) ) ( not ( = ?auto_9466 ?auto_9488 ) ) ( not ( = ?auto_9466 ?auto_9490 ) ) ( not ( = ?auto_9466 ?auto_9483 ) ) ( not ( = ?auto_9472 ?auto_9492 ) ) ( not ( = ?auto_9472 ?auto_9484 ) ) ( not ( = ?auto_9472 ?auto_9479 ) ) ( not ( = ?auto_9472 ?auto_9480 ) ) ( not ( = ?auto_9472 ?auto_9491 ) ) ( not ( = ?auto_9472 ?auto_9477 ) ) ( not ( = ?auto_9472 ?auto_9481 ) ) ( not ( = ?auto_9472 ?auto_9488 ) ) ( not ( = ?auto_9472 ?auto_9490 ) ) ( not ( = ?auto_9472 ?auto_9483 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_9455 ?auto_9456 ?auto_9457 ?auto_9458 ?auto_9459 ?auto_9460 ?auto_9461 ?auto_9464 ?auto_9463 ?auto_9462 ?auto_9465 )
      ( MAKE-1CRATE ?auto_9465 ?auto_9466 )
      ( MAKE-11CRATE-VERIFY ?auto_9455 ?auto_9456 ?auto_9457 ?auto_9458 ?auto_9459 ?auto_9460 ?auto_9461 ?auto_9464 ?auto_9463 ?auto_9462 ?auto_9465 ?auto_9466 ) )
  )

)

