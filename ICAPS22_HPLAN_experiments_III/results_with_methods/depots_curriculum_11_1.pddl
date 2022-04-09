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
      ?auto_9018 - SURFACE
      ?auto_9019 - SURFACE
    )
    :vars
    (
      ?auto_9020 - HOIST
      ?auto_9021 - PLACE
      ?auto_9023 - PLACE
      ?auto_9024 - HOIST
      ?auto_9025 - SURFACE
      ?auto_9022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9020 ?auto_9021 ) ( SURFACE-AT ?auto_9018 ?auto_9021 ) ( CLEAR ?auto_9018 ) ( IS-CRATE ?auto_9019 ) ( AVAILABLE ?auto_9020 ) ( not ( = ?auto_9023 ?auto_9021 ) ) ( HOIST-AT ?auto_9024 ?auto_9023 ) ( AVAILABLE ?auto_9024 ) ( SURFACE-AT ?auto_9019 ?auto_9023 ) ( ON ?auto_9019 ?auto_9025 ) ( CLEAR ?auto_9019 ) ( TRUCK-AT ?auto_9022 ?auto_9021 ) ( not ( = ?auto_9018 ?auto_9019 ) ) ( not ( = ?auto_9018 ?auto_9025 ) ) ( not ( = ?auto_9019 ?auto_9025 ) ) ( not ( = ?auto_9020 ?auto_9024 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9022 ?auto_9021 ?auto_9023 )
      ( !LIFT ?auto_9024 ?auto_9019 ?auto_9025 ?auto_9023 )
      ( !LOAD ?auto_9024 ?auto_9019 ?auto_9022 ?auto_9023 )
      ( !DRIVE ?auto_9022 ?auto_9023 ?auto_9021 )
      ( !UNLOAD ?auto_9020 ?auto_9019 ?auto_9022 ?auto_9021 )
      ( !DROP ?auto_9020 ?auto_9019 ?auto_9018 ?auto_9021 )
      ( MAKE-1CRATE-VERIFY ?auto_9018 ?auto_9019 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9028 - SURFACE
      ?auto_9029 - SURFACE
    )
    :vars
    (
      ?auto_9030 - HOIST
      ?auto_9031 - PLACE
      ?auto_9033 - PLACE
      ?auto_9034 - HOIST
      ?auto_9035 - SURFACE
      ?auto_9032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9030 ?auto_9031 ) ( SURFACE-AT ?auto_9028 ?auto_9031 ) ( CLEAR ?auto_9028 ) ( IS-CRATE ?auto_9029 ) ( AVAILABLE ?auto_9030 ) ( not ( = ?auto_9033 ?auto_9031 ) ) ( HOIST-AT ?auto_9034 ?auto_9033 ) ( AVAILABLE ?auto_9034 ) ( SURFACE-AT ?auto_9029 ?auto_9033 ) ( ON ?auto_9029 ?auto_9035 ) ( CLEAR ?auto_9029 ) ( TRUCK-AT ?auto_9032 ?auto_9031 ) ( not ( = ?auto_9028 ?auto_9029 ) ) ( not ( = ?auto_9028 ?auto_9035 ) ) ( not ( = ?auto_9029 ?auto_9035 ) ) ( not ( = ?auto_9030 ?auto_9034 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9032 ?auto_9031 ?auto_9033 )
      ( !LIFT ?auto_9034 ?auto_9029 ?auto_9035 ?auto_9033 )
      ( !LOAD ?auto_9034 ?auto_9029 ?auto_9032 ?auto_9033 )
      ( !DRIVE ?auto_9032 ?auto_9033 ?auto_9031 )
      ( !UNLOAD ?auto_9030 ?auto_9029 ?auto_9032 ?auto_9031 )
      ( !DROP ?auto_9030 ?auto_9029 ?auto_9028 ?auto_9031 )
      ( MAKE-1CRATE-VERIFY ?auto_9028 ?auto_9029 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9039 - SURFACE
      ?auto_9040 - SURFACE
      ?auto_9041 - SURFACE
    )
    :vars
    (
      ?auto_9045 - HOIST
      ?auto_9047 - PLACE
      ?auto_9042 - PLACE
      ?auto_9044 - HOIST
      ?auto_9046 - SURFACE
      ?auto_9048 - PLACE
      ?auto_9049 - HOIST
      ?auto_9050 - SURFACE
      ?auto_9043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9045 ?auto_9047 ) ( IS-CRATE ?auto_9041 ) ( not ( = ?auto_9042 ?auto_9047 ) ) ( HOIST-AT ?auto_9044 ?auto_9042 ) ( AVAILABLE ?auto_9044 ) ( SURFACE-AT ?auto_9041 ?auto_9042 ) ( ON ?auto_9041 ?auto_9046 ) ( CLEAR ?auto_9041 ) ( not ( = ?auto_9040 ?auto_9041 ) ) ( not ( = ?auto_9040 ?auto_9046 ) ) ( not ( = ?auto_9041 ?auto_9046 ) ) ( not ( = ?auto_9045 ?auto_9044 ) ) ( SURFACE-AT ?auto_9039 ?auto_9047 ) ( CLEAR ?auto_9039 ) ( IS-CRATE ?auto_9040 ) ( AVAILABLE ?auto_9045 ) ( not ( = ?auto_9048 ?auto_9047 ) ) ( HOIST-AT ?auto_9049 ?auto_9048 ) ( AVAILABLE ?auto_9049 ) ( SURFACE-AT ?auto_9040 ?auto_9048 ) ( ON ?auto_9040 ?auto_9050 ) ( CLEAR ?auto_9040 ) ( TRUCK-AT ?auto_9043 ?auto_9047 ) ( not ( = ?auto_9039 ?auto_9040 ) ) ( not ( = ?auto_9039 ?auto_9050 ) ) ( not ( = ?auto_9040 ?auto_9050 ) ) ( not ( = ?auto_9045 ?auto_9049 ) ) ( not ( = ?auto_9039 ?auto_9041 ) ) ( not ( = ?auto_9039 ?auto_9046 ) ) ( not ( = ?auto_9041 ?auto_9050 ) ) ( not ( = ?auto_9042 ?auto_9048 ) ) ( not ( = ?auto_9044 ?auto_9049 ) ) ( not ( = ?auto_9046 ?auto_9050 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9039 ?auto_9040 )
      ( MAKE-1CRATE ?auto_9040 ?auto_9041 )
      ( MAKE-2CRATE-VERIFY ?auto_9039 ?auto_9040 ?auto_9041 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9053 - SURFACE
      ?auto_9054 - SURFACE
    )
    :vars
    (
      ?auto_9055 - HOIST
      ?auto_9056 - PLACE
      ?auto_9058 - PLACE
      ?auto_9059 - HOIST
      ?auto_9060 - SURFACE
      ?auto_9057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9055 ?auto_9056 ) ( SURFACE-AT ?auto_9053 ?auto_9056 ) ( CLEAR ?auto_9053 ) ( IS-CRATE ?auto_9054 ) ( AVAILABLE ?auto_9055 ) ( not ( = ?auto_9058 ?auto_9056 ) ) ( HOIST-AT ?auto_9059 ?auto_9058 ) ( AVAILABLE ?auto_9059 ) ( SURFACE-AT ?auto_9054 ?auto_9058 ) ( ON ?auto_9054 ?auto_9060 ) ( CLEAR ?auto_9054 ) ( TRUCK-AT ?auto_9057 ?auto_9056 ) ( not ( = ?auto_9053 ?auto_9054 ) ) ( not ( = ?auto_9053 ?auto_9060 ) ) ( not ( = ?auto_9054 ?auto_9060 ) ) ( not ( = ?auto_9055 ?auto_9059 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9057 ?auto_9056 ?auto_9058 )
      ( !LIFT ?auto_9059 ?auto_9054 ?auto_9060 ?auto_9058 )
      ( !LOAD ?auto_9059 ?auto_9054 ?auto_9057 ?auto_9058 )
      ( !DRIVE ?auto_9057 ?auto_9058 ?auto_9056 )
      ( !UNLOAD ?auto_9055 ?auto_9054 ?auto_9057 ?auto_9056 )
      ( !DROP ?auto_9055 ?auto_9054 ?auto_9053 ?auto_9056 )
      ( MAKE-1CRATE-VERIFY ?auto_9053 ?auto_9054 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9065 - SURFACE
      ?auto_9066 - SURFACE
      ?auto_9067 - SURFACE
      ?auto_9068 - SURFACE
    )
    :vars
    (
      ?auto_9074 - HOIST
      ?auto_9072 - PLACE
      ?auto_9069 - PLACE
      ?auto_9071 - HOIST
      ?auto_9070 - SURFACE
      ?auto_9075 - PLACE
      ?auto_9078 - HOIST
      ?auto_9076 - SURFACE
      ?auto_9077 - PLACE
      ?auto_9079 - HOIST
      ?auto_9080 - SURFACE
      ?auto_9073 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9074 ?auto_9072 ) ( IS-CRATE ?auto_9068 ) ( not ( = ?auto_9069 ?auto_9072 ) ) ( HOIST-AT ?auto_9071 ?auto_9069 ) ( AVAILABLE ?auto_9071 ) ( SURFACE-AT ?auto_9068 ?auto_9069 ) ( ON ?auto_9068 ?auto_9070 ) ( CLEAR ?auto_9068 ) ( not ( = ?auto_9067 ?auto_9068 ) ) ( not ( = ?auto_9067 ?auto_9070 ) ) ( not ( = ?auto_9068 ?auto_9070 ) ) ( not ( = ?auto_9074 ?auto_9071 ) ) ( IS-CRATE ?auto_9067 ) ( not ( = ?auto_9075 ?auto_9072 ) ) ( HOIST-AT ?auto_9078 ?auto_9075 ) ( AVAILABLE ?auto_9078 ) ( SURFACE-AT ?auto_9067 ?auto_9075 ) ( ON ?auto_9067 ?auto_9076 ) ( CLEAR ?auto_9067 ) ( not ( = ?auto_9066 ?auto_9067 ) ) ( not ( = ?auto_9066 ?auto_9076 ) ) ( not ( = ?auto_9067 ?auto_9076 ) ) ( not ( = ?auto_9074 ?auto_9078 ) ) ( SURFACE-AT ?auto_9065 ?auto_9072 ) ( CLEAR ?auto_9065 ) ( IS-CRATE ?auto_9066 ) ( AVAILABLE ?auto_9074 ) ( not ( = ?auto_9077 ?auto_9072 ) ) ( HOIST-AT ?auto_9079 ?auto_9077 ) ( AVAILABLE ?auto_9079 ) ( SURFACE-AT ?auto_9066 ?auto_9077 ) ( ON ?auto_9066 ?auto_9080 ) ( CLEAR ?auto_9066 ) ( TRUCK-AT ?auto_9073 ?auto_9072 ) ( not ( = ?auto_9065 ?auto_9066 ) ) ( not ( = ?auto_9065 ?auto_9080 ) ) ( not ( = ?auto_9066 ?auto_9080 ) ) ( not ( = ?auto_9074 ?auto_9079 ) ) ( not ( = ?auto_9065 ?auto_9067 ) ) ( not ( = ?auto_9065 ?auto_9076 ) ) ( not ( = ?auto_9067 ?auto_9080 ) ) ( not ( = ?auto_9075 ?auto_9077 ) ) ( not ( = ?auto_9078 ?auto_9079 ) ) ( not ( = ?auto_9076 ?auto_9080 ) ) ( not ( = ?auto_9065 ?auto_9068 ) ) ( not ( = ?auto_9065 ?auto_9070 ) ) ( not ( = ?auto_9066 ?auto_9068 ) ) ( not ( = ?auto_9066 ?auto_9070 ) ) ( not ( = ?auto_9068 ?auto_9076 ) ) ( not ( = ?auto_9068 ?auto_9080 ) ) ( not ( = ?auto_9069 ?auto_9075 ) ) ( not ( = ?auto_9069 ?auto_9077 ) ) ( not ( = ?auto_9071 ?auto_9078 ) ) ( not ( = ?auto_9071 ?auto_9079 ) ) ( not ( = ?auto_9070 ?auto_9076 ) ) ( not ( = ?auto_9070 ?auto_9080 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9065 ?auto_9066 ?auto_9067 )
      ( MAKE-1CRATE ?auto_9067 ?auto_9068 )
      ( MAKE-3CRATE-VERIFY ?auto_9065 ?auto_9066 ?auto_9067 ?auto_9068 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9083 - SURFACE
      ?auto_9084 - SURFACE
    )
    :vars
    (
      ?auto_9085 - HOIST
      ?auto_9086 - PLACE
      ?auto_9088 - PLACE
      ?auto_9089 - HOIST
      ?auto_9090 - SURFACE
      ?auto_9087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9085 ?auto_9086 ) ( SURFACE-AT ?auto_9083 ?auto_9086 ) ( CLEAR ?auto_9083 ) ( IS-CRATE ?auto_9084 ) ( AVAILABLE ?auto_9085 ) ( not ( = ?auto_9088 ?auto_9086 ) ) ( HOIST-AT ?auto_9089 ?auto_9088 ) ( AVAILABLE ?auto_9089 ) ( SURFACE-AT ?auto_9084 ?auto_9088 ) ( ON ?auto_9084 ?auto_9090 ) ( CLEAR ?auto_9084 ) ( TRUCK-AT ?auto_9087 ?auto_9086 ) ( not ( = ?auto_9083 ?auto_9084 ) ) ( not ( = ?auto_9083 ?auto_9090 ) ) ( not ( = ?auto_9084 ?auto_9090 ) ) ( not ( = ?auto_9085 ?auto_9089 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9087 ?auto_9086 ?auto_9088 )
      ( !LIFT ?auto_9089 ?auto_9084 ?auto_9090 ?auto_9088 )
      ( !LOAD ?auto_9089 ?auto_9084 ?auto_9087 ?auto_9088 )
      ( !DRIVE ?auto_9087 ?auto_9088 ?auto_9086 )
      ( !UNLOAD ?auto_9085 ?auto_9084 ?auto_9087 ?auto_9086 )
      ( !DROP ?auto_9085 ?auto_9084 ?auto_9083 ?auto_9086 )
      ( MAKE-1CRATE-VERIFY ?auto_9083 ?auto_9084 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9096 - SURFACE
      ?auto_9097 - SURFACE
      ?auto_9098 - SURFACE
      ?auto_9099 - SURFACE
      ?auto_9100 - SURFACE
    )
    :vars
    (
      ?auto_9101 - HOIST
      ?auto_9105 - PLACE
      ?auto_9104 - PLACE
      ?auto_9103 - HOIST
      ?auto_9106 - SURFACE
      ?auto_9107 - PLACE
      ?auto_9115 - HOIST
      ?auto_9109 - SURFACE
      ?auto_9113 - PLACE
      ?auto_9108 - HOIST
      ?auto_9114 - SURFACE
      ?auto_9110 - PLACE
      ?auto_9112 - HOIST
      ?auto_9111 - SURFACE
      ?auto_9102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9101 ?auto_9105 ) ( IS-CRATE ?auto_9100 ) ( not ( = ?auto_9104 ?auto_9105 ) ) ( HOIST-AT ?auto_9103 ?auto_9104 ) ( AVAILABLE ?auto_9103 ) ( SURFACE-AT ?auto_9100 ?auto_9104 ) ( ON ?auto_9100 ?auto_9106 ) ( CLEAR ?auto_9100 ) ( not ( = ?auto_9099 ?auto_9100 ) ) ( not ( = ?auto_9099 ?auto_9106 ) ) ( not ( = ?auto_9100 ?auto_9106 ) ) ( not ( = ?auto_9101 ?auto_9103 ) ) ( IS-CRATE ?auto_9099 ) ( not ( = ?auto_9107 ?auto_9105 ) ) ( HOIST-AT ?auto_9115 ?auto_9107 ) ( AVAILABLE ?auto_9115 ) ( SURFACE-AT ?auto_9099 ?auto_9107 ) ( ON ?auto_9099 ?auto_9109 ) ( CLEAR ?auto_9099 ) ( not ( = ?auto_9098 ?auto_9099 ) ) ( not ( = ?auto_9098 ?auto_9109 ) ) ( not ( = ?auto_9099 ?auto_9109 ) ) ( not ( = ?auto_9101 ?auto_9115 ) ) ( IS-CRATE ?auto_9098 ) ( not ( = ?auto_9113 ?auto_9105 ) ) ( HOIST-AT ?auto_9108 ?auto_9113 ) ( AVAILABLE ?auto_9108 ) ( SURFACE-AT ?auto_9098 ?auto_9113 ) ( ON ?auto_9098 ?auto_9114 ) ( CLEAR ?auto_9098 ) ( not ( = ?auto_9097 ?auto_9098 ) ) ( not ( = ?auto_9097 ?auto_9114 ) ) ( not ( = ?auto_9098 ?auto_9114 ) ) ( not ( = ?auto_9101 ?auto_9108 ) ) ( SURFACE-AT ?auto_9096 ?auto_9105 ) ( CLEAR ?auto_9096 ) ( IS-CRATE ?auto_9097 ) ( AVAILABLE ?auto_9101 ) ( not ( = ?auto_9110 ?auto_9105 ) ) ( HOIST-AT ?auto_9112 ?auto_9110 ) ( AVAILABLE ?auto_9112 ) ( SURFACE-AT ?auto_9097 ?auto_9110 ) ( ON ?auto_9097 ?auto_9111 ) ( CLEAR ?auto_9097 ) ( TRUCK-AT ?auto_9102 ?auto_9105 ) ( not ( = ?auto_9096 ?auto_9097 ) ) ( not ( = ?auto_9096 ?auto_9111 ) ) ( not ( = ?auto_9097 ?auto_9111 ) ) ( not ( = ?auto_9101 ?auto_9112 ) ) ( not ( = ?auto_9096 ?auto_9098 ) ) ( not ( = ?auto_9096 ?auto_9114 ) ) ( not ( = ?auto_9098 ?auto_9111 ) ) ( not ( = ?auto_9113 ?auto_9110 ) ) ( not ( = ?auto_9108 ?auto_9112 ) ) ( not ( = ?auto_9114 ?auto_9111 ) ) ( not ( = ?auto_9096 ?auto_9099 ) ) ( not ( = ?auto_9096 ?auto_9109 ) ) ( not ( = ?auto_9097 ?auto_9099 ) ) ( not ( = ?auto_9097 ?auto_9109 ) ) ( not ( = ?auto_9099 ?auto_9114 ) ) ( not ( = ?auto_9099 ?auto_9111 ) ) ( not ( = ?auto_9107 ?auto_9113 ) ) ( not ( = ?auto_9107 ?auto_9110 ) ) ( not ( = ?auto_9115 ?auto_9108 ) ) ( not ( = ?auto_9115 ?auto_9112 ) ) ( not ( = ?auto_9109 ?auto_9114 ) ) ( not ( = ?auto_9109 ?auto_9111 ) ) ( not ( = ?auto_9096 ?auto_9100 ) ) ( not ( = ?auto_9096 ?auto_9106 ) ) ( not ( = ?auto_9097 ?auto_9100 ) ) ( not ( = ?auto_9097 ?auto_9106 ) ) ( not ( = ?auto_9098 ?auto_9100 ) ) ( not ( = ?auto_9098 ?auto_9106 ) ) ( not ( = ?auto_9100 ?auto_9109 ) ) ( not ( = ?auto_9100 ?auto_9114 ) ) ( not ( = ?auto_9100 ?auto_9111 ) ) ( not ( = ?auto_9104 ?auto_9107 ) ) ( not ( = ?auto_9104 ?auto_9113 ) ) ( not ( = ?auto_9104 ?auto_9110 ) ) ( not ( = ?auto_9103 ?auto_9115 ) ) ( not ( = ?auto_9103 ?auto_9108 ) ) ( not ( = ?auto_9103 ?auto_9112 ) ) ( not ( = ?auto_9106 ?auto_9109 ) ) ( not ( = ?auto_9106 ?auto_9114 ) ) ( not ( = ?auto_9106 ?auto_9111 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_9096 ?auto_9097 ?auto_9098 ?auto_9099 )
      ( MAKE-1CRATE ?auto_9099 ?auto_9100 )
      ( MAKE-4CRATE-VERIFY ?auto_9096 ?auto_9097 ?auto_9098 ?auto_9099 ?auto_9100 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9118 - SURFACE
      ?auto_9119 - SURFACE
    )
    :vars
    (
      ?auto_9120 - HOIST
      ?auto_9121 - PLACE
      ?auto_9123 - PLACE
      ?auto_9124 - HOIST
      ?auto_9125 - SURFACE
      ?auto_9122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9120 ?auto_9121 ) ( SURFACE-AT ?auto_9118 ?auto_9121 ) ( CLEAR ?auto_9118 ) ( IS-CRATE ?auto_9119 ) ( AVAILABLE ?auto_9120 ) ( not ( = ?auto_9123 ?auto_9121 ) ) ( HOIST-AT ?auto_9124 ?auto_9123 ) ( AVAILABLE ?auto_9124 ) ( SURFACE-AT ?auto_9119 ?auto_9123 ) ( ON ?auto_9119 ?auto_9125 ) ( CLEAR ?auto_9119 ) ( TRUCK-AT ?auto_9122 ?auto_9121 ) ( not ( = ?auto_9118 ?auto_9119 ) ) ( not ( = ?auto_9118 ?auto_9125 ) ) ( not ( = ?auto_9119 ?auto_9125 ) ) ( not ( = ?auto_9120 ?auto_9124 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9122 ?auto_9121 ?auto_9123 )
      ( !LIFT ?auto_9124 ?auto_9119 ?auto_9125 ?auto_9123 )
      ( !LOAD ?auto_9124 ?auto_9119 ?auto_9122 ?auto_9123 )
      ( !DRIVE ?auto_9122 ?auto_9123 ?auto_9121 )
      ( !UNLOAD ?auto_9120 ?auto_9119 ?auto_9122 ?auto_9121 )
      ( !DROP ?auto_9120 ?auto_9119 ?auto_9118 ?auto_9121 )
      ( MAKE-1CRATE-VERIFY ?auto_9118 ?auto_9119 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_9132 - SURFACE
      ?auto_9133 - SURFACE
      ?auto_9134 - SURFACE
      ?auto_9135 - SURFACE
      ?auto_9136 - SURFACE
      ?auto_9137 - SURFACE
    )
    :vars
    (
      ?auto_9142 - HOIST
      ?auto_9139 - PLACE
      ?auto_9138 - PLACE
      ?auto_9143 - HOIST
      ?auto_9140 - SURFACE
      ?auto_9151 - PLACE
      ?auto_9150 - HOIST
      ?auto_9152 - SURFACE
      ?auto_9144 - SURFACE
      ?auto_9146 - PLACE
      ?auto_9147 - HOIST
      ?auto_9145 - SURFACE
      ?auto_9148 - PLACE
      ?auto_9149 - HOIST
      ?auto_9153 - SURFACE
      ?auto_9141 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9142 ?auto_9139 ) ( IS-CRATE ?auto_9137 ) ( not ( = ?auto_9138 ?auto_9139 ) ) ( HOIST-AT ?auto_9143 ?auto_9138 ) ( SURFACE-AT ?auto_9137 ?auto_9138 ) ( ON ?auto_9137 ?auto_9140 ) ( CLEAR ?auto_9137 ) ( not ( = ?auto_9136 ?auto_9137 ) ) ( not ( = ?auto_9136 ?auto_9140 ) ) ( not ( = ?auto_9137 ?auto_9140 ) ) ( not ( = ?auto_9142 ?auto_9143 ) ) ( IS-CRATE ?auto_9136 ) ( not ( = ?auto_9151 ?auto_9139 ) ) ( HOIST-AT ?auto_9150 ?auto_9151 ) ( AVAILABLE ?auto_9150 ) ( SURFACE-AT ?auto_9136 ?auto_9151 ) ( ON ?auto_9136 ?auto_9152 ) ( CLEAR ?auto_9136 ) ( not ( = ?auto_9135 ?auto_9136 ) ) ( not ( = ?auto_9135 ?auto_9152 ) ) ( not ( = ?auto_9136 ?auto_9152 ) ) ( not ( = ?auto_9142 ?auto_9150 ) ) ( IS-CRATE ?auto_9135 ) ( AVAILABLE ?auto_9143 ) ( SURFACE-AT ?auto_9135 ?auto_9138 ) ( ON ?auto_9135 ?auto_9144 ) ( CLEAR ?auto_9135 ) ( not ( = ?auto_9134 ?auto_9135 ) ) ( not ( = ?auto_9134 ?auto_9144 ) ) ( not ( = ?auto_9135 ?auto_9144 ) ) ( IS-CRATE ?auto_9134 ) ( not ( = ?auto_9146 ?auto_9139 ) ) ( HOIST-AT ?auto_9147 ?auto_9146 ) ( AVAILABLE ?auto_9147 ) ( SURFACE-AT ?auto_9134 ?auto_9146 ) ( ON ?auto_9134 ?auto_9145 ) ( CLEAR ?auto_9134 ) ( not ( = ?auto_9133 ?auto_9134 ) ) ( not ( = ?auto_9133 ?auto_9145 ) ) ( not ( = ?auto_9134 ?auto_9145 ) ) ( not ( = ?auto_9142 ?auto_9147 ) ) ( SURFACE-AT ?auto_9132 ?auto_9139 ) ( CLEAR ?auto_9132 ) ( IS-CRATE ?auto_9133 ) ( AVAILABLE ?auto_9142 ) ( not ( = ?auto_9148 ?auto_9139 ) ) ( HOIST-AT ?auto_9149 ?auto_9148 ) ( AVAILABLE ?auto_9149 ) ( SURFACE-AT ?auto_9133 ?auto_9148 ) ( ON ?auto_9133 ?auto_9153 ) ( CLEAR ?auto_9133 ) ( TRUCK-AT ?auto_9141 ?auto_9139 ) ( not ( = ?auto_9132 ?auto_9133 ) ) ( not ( = ?auto_9132 ?auto_9153 ) ) ( not ( = ?auto_9133 ?auto_9153 ) ) ( not ( = ?auto_9142 ?auto_9149 ) ) ( not ( = ?auto_9132 ?auto_9134 ) ) ( not ( = ?auto_9132 ?auto_9145 ) ) ( not ( = ?auto_9134 ?auto_9153 ) ) ( not ( = ?auto_9146 ?auto_9148 ) ) ( not ( = ?auto_9147 ?auto_9149 ) ) ( not ( = ?auto_9145 ?auto_9153 ) ) ( not ( = ?auto_9132 ?auto_9135 ) ) ( not ( = ?auto_9132 ?auto_9144 ) ) ( not ( = ?auto_9133 ?auto_9135 ) ) ( not ( = ?auto_9133 ?auto_9144 ) ) ( not ( = ?auto_9135 ?auto_9145 ) ) ( not ( = ?auto_9135 ?auto_9153 ) ) ( not ( = ?auto_9138 ?auto_9146 ) ) ( not ( = ?auto_9138 ?auto_9148 ) ) ( not ( = ?auto_9143 ?auto_9147 ) ) ( not ( = ?auto_9143 ?auto_9149 ) ) ( not ( = ?auto_9144 ?auto_9145 ) ) ( not ( = ?auto_9144 ?auto_9153 ) ) ( not ( = ?auto_9132 ?auto_9136 ) ) ( not ( = ?auto_9132 ?auto_9152 ) ) ( not ( = ?auto_9133 ?auto_9136 ) ) ( not ( = ?auto_9133 ?auto_9152 ) ) ( not ( = ?auto_9134 ?auto_9136 ) ) ( not ( = ?auto_9134 ?auto_9152 ) ) ( not ( = ?auto_9136 ?auto_9144 ) ) ( not ( = ?auto_9136 ?auto_9145 ) ) ( not ( = ?auto_9136 ?auto_9153 ) ) ( not ( = ?auto_9151 ?auto_9138 ) ) ( not ( = ?auto_9151 ?auto_9146 ) ) ( not ( = ?auto_9151 ?auto_9148 ) ) ( not ( = ?auto_9150 ?auto_9143 ) ) ( not ( = ?auto_9150 ?auto_9147 ) ) ( not ( = ?auto_9150 ?auto_9149 ) ) ( not ( = ?auto_9152 ?auto_9144 ) ) ( not ( = ?auto_9152 ?auto_9145 ) ) ( not ( = ?auto_9152 ?auto_9153 ) ) ( not ( = ?auto_9132 ?auto_9137 ) ) ( not ( = ?auto_9132 ?auto_9140 ) ) ( not ( = ?auto_9133 ?auto_9137 ) ) ( not ( = ?auto_9133 ?auto_9140 ) ) ( not ( = ?auto_9134 ?auto_9137 ) ) ( not ( = ?auto_9134 ?auto_9140 ) ) ( not ( = ?auto_9135 ?auto_9137 ) ) ( not ( = ?auto_9135 ?auto_9140 ) ) ( not ( = ?auto_9137 ?auto_9152 ) ) ( not ( = ?auto_9137 ?auto_9144 ) ) ( not ( = ?auto_9137 ?auto_9145 ) ) ( not ( = ?auto_9137 ?auto_9153 ) ) ( not ( = ?auto_9140 ?auto_9152 ) ) ( not ( = ?auto_9140 ?auto_9144 ) ) ( not ( = ?auto_9140 ?auto_9145 ) ) ( not ( = ?auto_9140 ?auto_9153 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_9132 ?auto_9133 ?auto_9134 ?auto_9135 ?auto_9136 )
      ( MAKE-1CRATE ?auto_9136 ?auto_9137 )
      ( MAKE-5CRATE-VERIFY ?auto_9132 ?auto_9133 ?auto_9134 ?auto_9135 ?auto_9136 ?auto_9137 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9156 - SURFACE
      ?auto_9157 - SURFACE
    )
    :vars
    (
      ?auto_9158 - HOIST
      ?auto_9159 - PLACE
      ?auto_9161 - PLACE
      ?auto_9162 - HOIST
      ?auto_9163 - SURFACE
      ?auto_9160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9158 ?auto_9159 ) ( SURFACE-AT ?auto_9156 ?auto_9159 ) ( CLEAR ?auto_9156 ) ( IS-CRATE ?auto_9157 ) ( AVAILABLE ?auto_9158 ) ( not ( = ?auto_9161 ?auto_9159 ) ) ( HOIST-AT ?auto_9162 ?auto_9161 ) ( AVAILABLE ?auto_9162 ) ( SURFACE-AT ?auto_9157 ?auto_9161 ) ( ON ?auto_9157 ?auto_9163 ) ( CLEAR ?auto_9157 ) ( TRUCK-AT ?auto_9160 ?auto_9159 ) ( not ( = ?auto_9156 ?auto_9157 ) ) ( not ( = ?auto_9156 ?auto_9163 ) ) ( not ( = ?auto_9157 ?auto_9163 ) ) ( not ( = ?auto_9158 ?auto_9162 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9160 ?auto_9159 ?auto_9161 )
      ( !LIFT ?auto_9162 ?auto_9157 ?auto_9163 ?auto_9161 )
      ( !LOAD ?auto_9162 ?auto_9157 ?auto_9160 ?auto_9161 )
      ( !DRIVE ?auto_9160 ?auto_9161 ?auto_9159 )
      ( !UNLOAD ?auto_9158 ?auto_9157 ?auto_9160 ?auto_9159 )
      ( !DROP ?auto_9158 ?auto_9157 ?auto_9156 ?auto_9159 )
      ( MAKE-1CRATE-VERIFY ?auto_9156 ?auto_9157 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_9171 - SURFACE
      ?auto_9172 - SURFACE
      ?auto_9173 - SURFACE
      ?auto_9174 - SURFACE
      ?auto_9175 - SURFACE
      ?auto_9176 - SURFACE
      ?auto_9177 - SURFACE
    )
    :vars
    (
      ?auto_9179 - HOIST
      ?auto_9182 - PLACE
      ?auto_9181 - PLACE
      ?auto_9180 - HOIST
      ?auto_9178 - SURFACE
      ?auto_9187 - PLACE
      ?auto_9188 - HOIST
      ?auto_9186 - SURFACE
      ?auto_9185 - PLACE
      ?auto_9191 - HOIST
      ?auto_9184 - SURFACE
      ?auto_9194 - SURFACE
      ?auto_9190 - PLACE
      ?auto_9189 - HOIST
      ?auto_9193 - SURFACE
      ?auto_9192 - SURFACE
      ?auto_9183 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9179 ?auto_9182 ) ( IS-CRATE ?auto_9177 ) ( not ( = ?auto_9181 ?auto_9182 ) ) ( HOIST-AT ?auto_9180 ?auto_9181 ) ( SURFACE-AT ?auto_9177 ?auto_9181 ) ( ON ?auto_9177 ?auto_9178 ) ( CLEAR ?auto_9177 ) ( not ( = ?auto_9176 ?auto_9177 ) ) ( not ( = ?auto_9176 ?auto_9178 ) ) ( not ( = ?auto_9177 ?auto_9178 ) ) ( not ( = ?auto_9179 ?auto_9180 ) ) ( IS-CRATE ?auto_9176 ) ( not ( = ?auto_9187 ?auto_9182 ) ) ( HOIST-AT ?auto_9188 ?auto_9187 ) ( SURFACE-AT ?auto_9176 ?auto_9187 ) ( ON ?auto_9176 ?auto_9186 ) ( CLEAR ?auto_9176 ) ( not ( = ?auto_9175 ?auto_9176 ) ) ( not ( = ?auto_9175 ?auto_9186 ) ) ( not ( = ?auto_9176 ?auto_9186 ) ) ( not ( = ?auto_9179 ?auto_9188 ) ) ( IS-CRATE ?auto_9175 ) ( not ( = ?auto_9185 ?auto_9182 ) ) ( HOIST-AT ?auto_9191 ?auto_9185 ) ( AVAILABLE ?auto_9191 ) ( SURFACE-AT ?auto_9175 ?auto_9185 ) ( ON ?auto_9175 ?auto_9184 ) ( CLEAR ?auto_9175 ) ( not ( = ?auto_9174 ?auto_9175 ) ) ( not ( = ?auto_9174 ?auto_9184 ) ) ( not ( = ?auto_9175 ?auto_9184 ) ) ( not ( = ?auto_9179 ?auto_9191 ) ) ( IS-CRATE ?auto_9174 ) ( AVAILABLE ?auto_9188 ) ( SURFACE-AT ?auto_9174 ?auto_9187 ) ( ON ?auto_9174 ?auto_9194 ) ( CLEAR ?auto_9174 ) ( not ( = ?auto_9173 ?auto_9174 ) ) ( not ( = ?auto_9173 ?auto_9194 ) ) ( not ( = ?auto_9174 ?auto_9194 ) ) ( IS-CRATE ?auto_9173 ) ( not ( = ?auto_9190 ?auto_9182 ) ) ( HOIST-AT ?auto_9189 ?auto_9190 ) ( AVAILABLE ?auto_9189 ) ( SURFACE-AT ?auto_9173 ?auto_9190 ) ( ON ?auto_9173 ?auto_9193 ) ( CLEAR ?auto_9173 ) ( not ( = ?auto_9172 ?auto_9173 ) ) ( not ( = ?auto_9172 ?auto_9193 ) ) ( not ( = ?auto_9173 ?auto_9193 ) ) ( not ( = ?auto_9179 ?auto_9189 ) ) ( SURFACE-AT ?auto_9171 ?auto_9182 ) ( CLEAR ?auto_9171 ) ( IS-CRATE ?auto_9172 ) ( AVAILABLE ?auto_9179 ) ( AVAILABLE ?auto_9180 ) ( SURFACE-AT ?auto_9172 ?auto_9181 ) ( ON ?auto_9172 ?auto_9192 ) ( CLEAR ?auto_9172 ) ( TRUCK-AT ?auto_9183 ?auto_9182 ) ( not ( = ?auto_9171 ?auto_9172 ) ) ( not ( = ?auto_9171 ?auto_9192 ) ) ( not ( = ?auto_9172 ?auto_9192 ) ) ( not ( = ?auto_9171 ?auto_9173 ) ) ( not ( = ?auto_9171 ?auto_9193 ) ) ( not ( = ?auto_9173 ?auto_9192 ) ) ( not ( = ?auto_9190 ?auto_9181 ) ) ( not ( = ?auto_9189 ?auto_9180 ) ) ( not ( = ?auto_9193 ?auto_9192 ) ) ( not ( = ?auto_9171 ?auto_9174 ) ) ( not ( = ?auto_9171 ?auto_9194 ) ) ( not ( = ?auto_9172 ?auto_9174 ) ) ( not ( = ?auto_9172 ?auto_9194 ) ) ( not ( = ?auto_9174 ?auto_9193 ) ) ( not ( = ?auto_9174 ?auto_9192 ) ) ( not ( = ?auto_9187 ?auto_9190 ) ) ( not ( = ?auto_9187 ?auto_9181 ) ) ( not ( = ?auto_9188 ?auto_9189 ) ) ( not ( = ?auto_9188 ?auto_9180 ) ) ( not ( = ?auto_9194 ?auto_9193 ) ) ( not ( = ?auto_9194 ?auto_9192 ) ) ( not ( = ?auto_9171 ?auto_9175 ) ) ( not ( = ?auto_9171 ?auto_9184 ) ) ( not ( = ?auto_9172 ?auto_9175 ) ) ( not ( = ?auto_9172 ?auto_9184 ) ) ( not ( = ?auto_9173 ?auto_9175 ) ) ( not ( = ?auto_9173 ?auto_9184 ) ) ( not ( = ?auto_9175 ?auto_9194 ) ) ( not ( = ?auto_9175 ?auto_9193 ) ) ( not ( = ?auto_9175 ?auto_9192 ) ) ( not ( = ?auto_9185 ?auto_9187 ) ) ( not ( = ?auto_9185 ?auto_9190 ) ) ( not ( = ?auto_9185 ?auto_9181 ) ) ( not ( = ?auto_9191 ?auto_9188 ) ) ( not ( = ?auto_9191 ?auto_9189 ) ) ( not ( = ?auto_9191 ?auto_9180 ) ) ( not ( = ?auto_9184 ?auto_9194 ) ) ( not ( = ?auto_9184 ?auto_9193 ) ) ( not ( = ?auto_9184 ?auto_9192 ) ) ( not ( = ?auto_9171 ?auto_9176 ) ) ( not ( = ?auto_9171 ?auto_9186 ) ) ( not ( = ?auto_9172 ?auto_9176 ) ) ( not ( = ?auto_9172 ?auto_9186 ) ) ( not ( = ?auto_9173 ?auto_9176 ) ) ( not ( = ?auto_9173 ?auto_9186 ) ) ( not ( = ?auto_9174 ?auto_9176 ) ) ( not ( = ?auto_9174 ?auto_9186 ) ) ( not ( = ?auto_9176 ?auto_9184 ) ) ( not ( = ?auto_9176 ?auto_9194 ) ) ( not ( = ?auto_9176 ?auto_9193 ) ) ( not ( = ?auto_9176 ?auto_9192 ) ) ( not ( = ?auto_9186 ?auto_9184 ) ) ( not ( = ?auto_9186 ?auto_9194 ) ) ( not ( = ?auto_9186 ?auto_9193 ) ) ( not ( = ?auto_9186 ?auto_9192 ) ) ( not ( = ?auto_9171 ?auto_9177 ) ) ( not ( = ?auto_9171 ?auto_9178 ) ) ( not ( = ?auto_9172 ?auto_9177 ) ) ( not ( = ?auto_9172 ?auto_9178 ) ) ( not ( = ?auto_9173 ?auto_9177 ) ) ( not ( = ?auto_9173 ?auto_9178 ) ) ( not ( = ?auto_9174 ?auto_9177 ) ) ( not ( = ?auto_9174 ?auto_9178 ) ) ( not ( = ?auto_9175 ?auto_9177 ) ) ( not ( = ?auto_9175 ?auto_9178 ) ) ( not ( = ?auto_9177 ?auto_9186 ) ) ( not ( = ?auto_9177 ?auto_9184 ) ) ( not ( = ?auto_9177 ?auto_9194 ) ) ( not ( = ?auto_9177 ?auto_9193 ) ) ( not ( = ?auto_9177 ?auto_9192 ) ) ( not ( = ?auto_9178 ?auto_9186 ) ) ( not ( = ?auto_9178 ?auto_9184 ) ) ( not ( = ?auto_9178 ?auto_9194 ) ) ( not ( = ?auto_9178 ?auto_9193 ) ) ( not ( = ?auto_9178 ?auto_9192 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_9171 ?auto_9172 ?auto_9173 ?auto_9174 ?auto_9175 ?auto_9176 )
      ( MAKE-1CRATE ?auto_9176 ?auto_9177 )
      ( MAKE-6CRATE-VERIFY ?auto_9171 ?auto_9172 ?auto_9173 ?auto_9174 ?auto_9175 ?auto_9176 ?auto_9177 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9197 - SURFACE
      ?auto_9198 - SURFACE
    )
    :vars
    (
      ?auto_9199 - HOIST
      ?auto_9200 - PLACE
      ?auto_9202 - PLACE
      ?auto_9203 - HOIST
      ?auto_9204 - SURFACE
      ?auto_9201 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9199 ?auto_9200 ) ( SURFACE-AT ?auto_9197 ?auto_9200 ) ( CLEAR ?auto_9197 ) ( IS-CRATE ?auto_9198 ) ( AVAILABLE ?auto_9199 ) ( not ( = ?auto_9202 ?auto_9200 ) ) ( HOIST-AT ?auto_9203 ?auto_9202 ) ( AVAILABLE ?auto_9203 ) ( SURFACE-AT ?auto_9198 ?auto_9202 ) ( ON ?auto_9198 ?auto_9204 ) ( CLEAR ?auto_9198 ) ( TRUCK-AT ?auto_9201 ?auto_9200 ) ( not ( = ?auto_9197 ?auto_9198 ) ) ( not ( = ?auto_9197 ?auto_9204 ) ) ( not ( = ?auto_9198 ?auto_9204 ) ) ( not ( = ?auto_9199 ?auto_9203 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9201 ?auto_9200 ?auto_9202 )
      ( !LIFT ?auto_9203 ?auto_9198 ?auto_9204 ?auto_9202 )
      ( !LOAD ?auto_9203 ?auto_9198 ?auto_9201 ?auto_9202 )
      ( !DRIVE ?auto_9201 ?auto_9202 ?auto_9200 )
      ( !UNLOAD ?auto_9199 ?auto_9198 ?auto_9201 ?auto_9200 )
      ( !DROP ?auto_9199 ?auto_9198 ?auto_9197 ?auto_9200 )
      ( MAKE-1CRATE-VERIFY ?auto_9197 ?auto_9198 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_9213 - SURFACE
      ?auto_9214 - SURFACE
      ?auto_9215 - SURFACE
      ?auto_9216 - SURFACE
      ?auto_9217 - SURFACE
      ?auto_9218 - SURFACE
      ?auto_9220 - SURFACE
      ?auto_9219 - SURFACE
    )
    :vars
    (
      ?auto_9226 - HOIST
      ?auto_9224 - PLACE
      ?auto_9223 - PLACE
      ?auto_9221 - HOIST
      ?auto_9225 - SURFACE
      ?auto_9235 - PLACE
      ?auto_9237 - HOIST
      ?auto_9238 - SURFACE
      ?auto_9228 - PLACE
      ?auto_9234 - HOIST
      ?auto_9236 - SURFACE
      ?auto_9227 - SURFACE
      ?auto_9230 - SURFACE
      ?auto_9232 - PLACE
      ?auto_9233 - HOIST
      ?auto_9231 - SURFACE
      ?auto_9229 - SURFACE
      ?auto_9222 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9226 ?auto_9224 ) ( IS-CRATE ?auto_9219 ) ( not ( = ?auto_9223 ?auto_9224 ) ) ( HOIST-AT ?auto_9221 ?auto_9223 ) ( SURFACE-AT ?auto_9219 ?auto_9223 ) ( ON ?auto_9219 ?auto_9225 ) ( CLEAR ?auto_9219 ) ( not ( = ?auto_9220 ?auto_9219 ) ) ( not ( = ?auto_9220 ?auto_9225 ) ) ( not ( = ?auto_9219 ?auto_9225 ) ) ( not ( = ?auto_9226 ?auto_9221 ) ) ( IS-CRATE ?auto_9220 ) ( not ( = ?auto_9235 ?auto_9224 ) ) ( HOIST-AT ?auto_9237 ?auto_9235 ) ( SURFACE-AT ?auto_9220 ?auto_9235 ) ( ON ?auto_9220 ?auto_9238 ) ( CLEAR ?auto_9220 ) ( not ( = ?auto_9218 ?auto_9220 ) ) ( not ( = ?auto_9218 ?auto_9238 ) ) ( not ( = ?auto_9220 ?auto_9238 ) ) ( not ( = ?auto_9226 ?auto_9237 ) ) ( IS-CRATE ?auto_9218 ) ( not ( = ?auto_9228 ?auto_9224 ) ) ( HOIST-AT ?auto_9234 ?auto_9228 ) ( SURFACE-AT ?auto_9218 ?auto_9228 ) ( ON ?auto_9218 ?auto_9236 ) ( CLEAR ?auto_9218 ) ( not ( = ?auto_9217 ?auto_9218 ) ) ( not ( = ?auto_9217 ?auto_9236 ) ) ( not ( = ?auto_9218 ?auto_9236 ) ) ( not ( = ?auto_9226 ?auto_9234 ) ) ( IS-CRATE ?auto_9217 ) ( AVAILABLE ?auto_9221 ) ( SURFACE-AT ?auto_9217 ?auto_9223 ) ( ON ?auto_9217 ?auto_9227 ) ( CLEAR ?auto_9217 ) ( not ( = ?auto_9216 ?auto_9217 ) ) ( not ( = ?auto_9216 ?auto_9227 ) ) ( not ( = ?auto_9217 ?auto_9227 ) ) ( IS-CRATE ?auto_9216 ) ( AVAILABLE ?auto_9234 ) ( SURFACE-AT ?auto_9216 ?auto_9228 ) ( ON ?auto_9216 ?auto_9230 ) ( CLEAR ?auto_9216 ) ( not ( = ?auto_9215 ?auto_9216 ) ) ( not ( = ?auto_9215 ?auto_9230 ) ) ( not ( = ?auto_9216 ?auto_9230 ) ) ( IS-CRATE ?auto_9215 ) ( not ( = ?auto_9232 ?auto_9224 ) ) ( HOIST-AT ?auto_9233 ?auto_9232 ) ( AVAILABLE ?auto_9233 ) ( SURFACE-AT ?auto_9215 ?auto_9232 ) ( ON ?auto_9215 ?auto_9231 ) ( CLEAR ?auto_9215 ) ( not ( = ?auto_9214 ?auto_9215 ) ) ( not ( = ?auto_9214 ?auto_9231 ) ) ( not ( = ?auto_9215 ?auto_9231 ) ) ( not ( = ?auto_9226 ?auto_9233 ) ) ( SURFACE-AT ?auto_9213 ?auto_9224 ) ( CLEAR ?auto_9213 ) ( IS-CRATE ?auto_9214 ) ( AVAILABLE ?auto_9226 ) ( AVAILABLE ?auto_9237 ) ( SURFACE-AT ?auto_9214 ?auto_9235 ) ( ON ?auto_9214 ?auto_9229 ) ( CLEAR ?auto_9214 ) ( TRUCK-AT ?auto_9222 ?auto_9224 ) ( not ( = ?auto_9213 ?auto_9214 ) ) ( not ( = ?auto_9213 ?auto_9229 ) ) ( not ( = ?auto_9214 ?auto_9229 ) ) ( not ( = ?auto_9213 ?auto_9215 ) ) ( not ( = ?auto_9213 ?auto_9231 ) ) ( not ( = ?auto_9215 ?auto_9229 ) ) ( not ( = ?auto_9232 ?auto_9235 ) ) ( not ( = ?auto_9233 ?auto_9237 ) ) ( not ( = ?auto_9231 ?auto_9229 ) ) ( not ( = ?auto_9213 ?auto_9216 ) ) ( not ( = ?auto_9213 ?auto_9230 ) ) ( not ( = ?auto_9214 ?auto_9216 ) ) ( not ( = ?auto_9214 ?auto_9230 ) ) ( not ( = ?auto_9216 ?auto_9231 ) ) ( not ( = ?auto_9216 ?auto_9229 ) ) ( not ( = ?auto_9228 ?auto_9232 ) ) ( not ( = ?auto_9228 ?auto_9235 ) ) ( not ( = ?auto_9234 ?auto_9233 ) ) ( not ( = ?auto_9234 ?auto_9237 ) ) ( not ( = ?auto_9230 ?auto_9231 ) ) ( not ( = ?auto_9230 ?auto_9229 ) ) ( not ( = ?auto_9213 ?auto_9217 ) ) ( not ( = ?auto_9213 ?auto_9227 ) ) ( not ( = ?auto_9214 ?auto_9217 ) ) ( not ( = ?auto_9214 ?auto_9227 ) ) ( not ( = ?auto_9215 ?auto_9217 ) ) ( not ( = ?auto_9215 ?auto_9227 ) ) ( not ( = ?auto_9217 ?auto_9230 ) ) ( not ( = ?auto_9217 ?auto_9231 ) ) ( not ( = ?auto_9217 ?auto_9229 ) ) ( not ( = ?auto_9223 ?auto_9228 ) ) ( not ( = ?auto_9223 ?auto_9232 ) ) ( not ( = ?auto_9223 ?auto_9235 ) ) ( not ( = ?auto_9221 ?auto_9234 ) ) ( not ( = ?auto_9221 ?auto_9233 ) ) ( not ( = ?auto_9221 ?auto_9237 ) ) ( not ( = ?auto_9227 ?auto_9230 ) ) ( not ( = ?auto_9227 ?auto_9231 ) ) ( not ( = ?auto_9227 ?auto_9229 ) ) ( not ( = ?auto_9213 ?auto_9218 ) ) ( not ( = ?auto_9213 ?auto_9236 ) ) ( not ( = ?auto_9214 ?auto_9218 ) ) ( not ( = ?auto_9214 ?auto_9236 ) ) ( not ( = ?auto_9215 ?auto_9218 ) ) ( not ( = ?auto_9215 ?auto_9236 ) ) ( not ( = ?auto_9216 ?auto_9218 ) ) ( not ( = ?auto_9216 ?auto_9236 ) ) ( not ( = ?auto_9218 ?auto_9227 ) ) ( not ( = ?auto_9218 ?auto_9230 ) ) ( not ( = ?auto_9218 ?auto_9231 ) ) ( not ( = ?auto_9218 ?auto_9229 ) ) ( not ( = ?auto_9236 ?auto_9227 ) ) ( not ( = ?auto_9236 ?auto_9230 ) ) ( not ( = ?auto_9236 ?auto_9231 ) ) ( not ( = ?auto_9236 ?auto_9229 ) ) ( not ( = ?auto_9213 ?auto_9220 ) ) ( not ( = ?auto_9213 ?auto_9238 ) ) ( not ( = ?auto_9214 ?auto_9220 ) ) ( not ( = ?auto_9214 ?auto_9238 ) ) ( not ( = ?auto_9215 ?auto_9220 ) ) ( not ( = ?auto_9215 ?auto_9238 ) ) ( not ( = ?auto_9216 ?auto_9220 ) ) ( not ( = ?auto_9216 ?auto_9238 ) ) ( not ( = ?auto_9217 ?auto_9220 ) ) ( not ( = ?auto_9217 ?auto_9238 ) ) ( not ( = ?auto_9220 ?auto_9236 ) ) ( not ( = ?auto_9220 ?auto_9227 ) ) ( not ( = ?auto_9220 ?auto_9230 ) ) ( not ( = ?auto_9220 ?auto_9231 ) ) ( not ( = ?auto_9220 ?auto_9229 ) ) ( not ( = ?auto_9238 ?auto_9236 ) ) ( not ( = ?auto_9238 ?auto_9227 ) ) ( not ( = ?auto_9238 ?auto_9230 ) ) ( not ( = ?auto_9238 ?auto_9231 ) ) ( not ( = ?auto_9238 ?auto_9229 ) ) ( not ( = ?auto_9213 ?auto_9219 ) ) ( not ( = ?auto_9213 ?auto_9225 ) ) ( not ( = ?auto_9214 ?auto_9219 ) ) ( not ( = ?auto_9214 ?auto_9225 ) ) ( not ( = ?auto_9215 ?auto_9219 ) ) ( not ( = ?auto_9215 ?auto_9225 ) ) ( not ( = ?auto_9216 ?auto_9219 ) ) ( not ( = ?auto_9216 ?auto_9225 ) ) ( not ( = ?auto_9217 ?auto_9219 ) ) ( not ( = ?auto_9217 ?auto_9225 ) ) ( not ( = ?auto_9218 ?auto_9219 ) ) ( not ( = ?auto_9218 ?auto_9225 ) ) ( not ( = ?auto_9219 ?auto_9238 ) ) ( not ( = ?auto_9219 ?auto_9236 ) ) ( not ( = ?auto_9219 ?auto_9227 ) ) ( not ( = ?auto_9219 ?auto_9230 ) ) ( not ( = ?auto_9219 ?auto_9231 ) ) ( not ( = ?auto_9219 ?auto_9229 ) ) ( not ( = ?auto_9225 ?auto_9238 ) ) ( not ( = ?auto_9225 ?auto_9236 ) ) ( not ( = ?auto_9225 ?auto_9227 ) ) ( not ( = ?auto_9225 ?auto_9230 ) ) ( not ( = ?auto_9225 ?auto_9231 ) ) ( not ( = ?auto_9225 ?auto_9229 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_9213 ?auto_9214 ?auto_9215 ?auto_9216 ?auto_9217 ?auto_9218 ?auto_9220 )
      ( MAKE-1CRATE ?auto_9220 ?auto_9219 )
      ( MAKE-7CRATE-VERIFY ?auto_9213 ?auto_9214 ?auto_9215 ?auto_9216 ?auto_9217 ?auto_9218 ?auto_9220 ?auto_9219 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9241 - SURFACE
      ?auto_9242 - SURFACE
    )
    :vars
    (
      ?auto_9243 - HOIST
      ?auto_9244 - PLACE
      ?auto_9246 - PLACE
      ?auto_9247 - HOIST
      ?auto_9248 - SURFACE
      ?auto_9245 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9243 ?auto_9244 ) ( SURFACE-AT ?auto_9241 ?auto_9244 ) ( CLEAR ?auto_9241 ) ( IS-CRATE ?auto_9242 ) ( AVAILABLE ?auto_9243 ) ( not ( = ?auto_9246 ?auto_9244 ) ) ( HOIST-AT ?auto_9247 ?auto_9246 ) ( AVAILABLE ?auto_9247 ) ( SURFACE-AT ?auto_9242 ?auto_9246 ) ( ON ?auto_9242 ?auto_9248 ) ( CLEAR ?auto_9242 ) ( TRUCK-AT ?auto_9245 ?auto_9244 ) ( not ( = ?auto_9241 ?auto_9242 ) ) ( not ( = ?auto_9241 ?auto_9248 ) ) ( not ( = ?auto_9242 ?auto_9248 ) ) ( not ( = ?auto_9243 ?auto_9247 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9245 ?auto_9244 ?auto_9246 )
      ( !LIFT ?auto_9247 ?auto_9242 ?auto_9248 ?auto_9246 )
      ( !LOAD ?auto_9247 ?auto_9242 ?auto_9245 ?auto_9246 )
      ( !DRIVE ?auto_9245 ?auto_9246 ?auto_9244 )
      ( !UNLOAD ?auto_9243 ?auto_9242 ?auto_9245 ?auto_9244 )
      ( !DROP ?auto_9243 ?auto_9242 ?auto_9241 ?auto_9244 )
      ( MAKE-1CRATE-VERIFY ?auto_9241 ?auto_9242 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_9258 - SURFACE
      ?auto_9259 - SURFACE
      ?auto_9260 - SURFACE
      ?auto_9261 - SURFACE
      ?auto_9262 - SURFACE
      ?auto_9263 - SURFACE
      ?auto_9266 - SURFACE
      ?auto_9265 - SURFACE
      ?auto_9264 - SURFACE
    )
    :vars
    (
      ?auto_9267 - HOIST
      ?auto_9272 - PLACE
      ?auto_9269 - PLACE
      ?auto_9270 - HOIST
      ?auto_9271 - SURFACE
      ?auto_9273 - PLACE
      ?auto_9275 - HOIST
      ?auto_9276 - SURFACE
      ?auto_9280 - PLACE
      ?auto_9281 - HOIST
      ?auto_9283 - SURFACE
      ?auto_9277 - PLACE
      ?auto_9284 - HOIST
      ?auto_9282 - SURFACE
      ?auto_9279 - SURFACE
      ?auto_9274 - SURFACE
      ?auto_9286 - PLACE
      ?auto_9285 - HOIST
      ?auto_9287 - SURFACE
      ?auto_9278 - SURFACE
      ?auto_9268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9267 ?auto_9272 ) ( IS-CRATE ?auto_9264 ) ( not ( = ?auto_9269 ?auto_9272 ) ) ( HOIST-AT ?auto_9270 ?auto_9269 ) ( AVAILABLE ?auto_9270 ) ( SURFACE-AT ?auto_9264 ?auto_9269 ) ( ON ?auto_9264 ?auto_9271 ) ( CLEAR ?auto_9264 ) ( not ( = ?auto_9265 ?auto_9264 ) ) ( not ( = ?auto_9265 ?auto_9271 ) ) ( not ( = ?auto_9264 ?auto_9271 ) ) ( not ( = ?auto_9267 ?auto_9270 ) ) ( IS-CRATE ?auto_9265 ) ( not ( = ?auto_9273 ?auto_9272 ) ) ( HOIST-AT ?auto_9275 ?auto_9273 ) ( SURFACE-AT ?auto_9265 ?auto_9273 ) ( ON ?auto_9265 ?auto_9276 ) ( CLEAR ?auto_9265 ) ( not ( = ?auto_9266 ?auto_9265 ) ) ( not ( = ?auto_9266 ?auto_9276 ) ) ( not ( = ?auto_9265 ?auto_9276 ) ) ( not ( = ?auto_9267 ?auto_9275 ) ) ( IS-CRATE ?auto_9266 ) ( not ( = ?auto_9280 ?auto_9272 ) ) ( HOIST-AT ?auto_9281 ?auto_9280 ) ( SURFACE-AT ?auto_9266 ?auto_9280 ) ( ON ?auto_9266 ?auto_9283 ) ( CLEAR ?auto_9266 ) ( not ( = ?auto_9263 ?auto_9266 ) ) ( not ( = ?auto_9263 ?auto_9283 ) ) ( not ( = ?auto_9266 ?auto_9283 ) ) ( not ( = ?auto_9267 ?auto_9281 ) ) ( IS-CRATE ?auto_9263 ) ( not ( = ?auto_9277 ?auto_9272 ) ) ( HOIST-AT ?auto_9284 ?auto_9277 ) ( SURFACE-AT ?auto_9263 ?auto_9277 ) ( ON ?auto_9263 ?auto_9282 ) ( CLEAR ?auto_9263 ) ( not ( = ?auto_9262 ?auto_9263 ) ) ( not ( = ?auto_9262 ?auto_9282 ) ) ( not ( = ?auto_9263 ?auto_9282 ) ) ( not ( = ?auto_9267 ?auto_9284 ) ) ( IS-CRATE ?auto_9262 ) ( AVAILABLE ?auto_9275 ) ( SURFACE-AT ?auto_9262 ?auto_9273 ) ( ON ?auto_9262 ?auto_9279 ) ( CLEAR ?auto_9262 ) ( not ( = ?auto_9261 ?auto_9262 ) ) ( not ( = ?auto_9261 ?auto_9279 ) ) ( not ( = ?auto_9262 ?auto_9279 ) ) ( IS-CRATE ?auto_9261 ) ( AVAILABLE ?auto_9284 ) ( SURFACE-AT ?auto_9261 ?auto_9277 ) ( ON ?auto_9261 ?auto_9274 ) ( CLEAR ?auto_9261 ) ( not ( = ?auto_9260 ?auto_9261 ) ) ( not ( = ?auto_9260 ?auto_9274 ) ) ( not ( = ?auto_9261 ?auto_9274 ) ) ( IS-CRATE ?auto_9260 ) ( not ( = ?auto_9286 ?auto_9272 ) ) ( HOIST-AT ?auto_9285 ?auto_9286 ) ( AVAILABLE ?auto_9285 ) ( SURFACE-AT ?auto_9260 ?auto_9286 ) ( ON ?auto_9260 ?auto_9287 ) ( CLEAR ?auto_9260 ) ( not ( = ?auto_9259 ?auto_9260 ) ) ( not ( = ?auto_9259 ?auto_9287 ) ) ( not ( = ?auto_9260 ?auto_9287 ) ) ( not ( = ?auto_9267 ?auto_9285 ) ) ( SURFACE-AT ?auto_9258 ?auto_9272 ) ( CLEAR ?auto_9258 ) ( IS-CRATE ?auto_9259 ) ( AVAILABLE ?auto_9267 ) ( AVAILABLE ?auto_9281 ) ( SURFACE-AT ?auto_9259 ?auto_9280 ) ( ON ?auto_9259 ?auto_9278 ) ( CLEAR ?auto_9259 ) ( TRUCK-AT ?auto_9268 ?auto_9272 ) ( not ( = ?auto_9258 ?auto_9259 ) ) ( not ( = ?auto_9258 ?auto_9278 ) ) ( not ( = ?auto_9259 ?auto_9278 ) ) ( not ( = ?auto_9258 ?auto_9260 ) ) ( not ( = ?auto_9258 ?auto_9287 ) ) ( not ( = ?auto_9260 ?auto_9278 ) ) ( not ( = ?auto_9286 ?auto_9280 ) ) ( not ( = ?auto_9285 ?auto_9281 ) ) ( not ( = ?auto_9287 ?auto_9278 ) ) ( not ( = ?auto_9258 ?auto_9261 ) ) ( not ( = ?auto_9258 ?auto_9274 ) ) ( not ( = ?auto_9259 ?auto_9261 ) ) ( not ( = ?auto_9259 ?auto_9274 ) ) ( not ( = ?auto_9261 ?auto_9287 ) ) ( not ( = ?auto_9261 ?auto_9278 ) ) ( not ( = ?auto_9277 ?auto_9286 ) ) ( not ( = ?auto_9277 ?auto_9280 ) ) ( not ( = ?auto_9284 ?auto_9285 ) ) ( not ( = ?auto_9284 ?auto_9281 ) ) ( not ( = ?auto_9274 ?auto_9287 ) ) ( not ( = ?auto_9274 ?auto_9278 ) ) ( not ( = ?auto_9258 ?auto_9262 ) ) ( not ( = ?auto_9258 ?auto_9279 ) ) ( not ( = ?auto_9259 ?auto_9262 ) ) ( not ( = ?auto_9259 ?auto_9279 ) ) ( not ( = ?auto_9260 ?auto_9262 ) ) ( not ( = ?auto_9260 ?auto_9279 ) ) ( not ( = ?auto_9262 ?auto_9274 ) ) ( not ( = ?auto_9262 ?auto_9287 ) ) ( not ( = ?auto_9262 ?auto_9278 ) ) ( not ( = ?auto_9273 ?auto_9277 ) ) ( not ( = ?auto_9273 ?auto_9286 ) ) ( not ( = ?auto_9273 ?auto_9280 ) ) ( not ( = ?auto_9275 ?auto_9284 ) ) ( not ( = ?auto_9275 ?auto_9285 ) ) ( not ( = ?auto_9275 ?auto_9281 ) ) ( not ( = ?auto_9279 ?auto_9274 ) ) ( not ( = ?auto_9279 ?auto_9287 ) ) ( not ( = ?auto_9279 ?auto_9278 ) ) ( not ( = ?auto_9258 ?auto_9263 ) ) ( not ( = ?auto_9258 ?auto_9282 ) ) ( not ( = ?auto_9259 ?auto_9263 ) ) ( not ( = ?auto_9259 ?auto_9282 ) ) ( not ( = ?auto_9260 ?auto_9263 ) ) ( not ( = ?auto_9260 ?auto_9282 ) ) ( not ( = ?auto_9261 ?auto_9263 ) ) ( not ( = ?auto_9261 ?auto_9282 ) ) ( not ( = ?auto_9263 ?auto_9279 ) ) ( not ( = ?auto_9263 ?auto_9274 ) ) ( not ( = ?auto_9263 ?auto_9287 ) ) ( not ( = ?auto_9263 ?auto_9278 ) ) ( not ( = ?auto_9282 ?auto_9279 ) ) ( not ( = ?auto_9282 ?auto_9274 ) ) ( not ( = ?auto_9282 ?auto_9287 ) ) ( not ( = ?auto_9282 ?auto_9278 ) ) ( not ( = ?auto_9258 ?auto_9266 ) ) ( not ( = ?auto_9258 ?auto_9283 ) ) ( not ( = ?auto_9259 ?auto_9266 ) ) ( not ( = ?auto_9259 ?auto_9283 ) ) ( not ( = ?auto_9260 ?auto_9266 ) ) ( not ( = ?auto_9260 ?auto_9283 ) ) ( not ( = ?auto_9261 ?auto_9266 ) ) ( not ( = ?auto_9261 ?auto_9283 ) ) ( not ( = ?auto_9262 ?auto_9266 ) ) ( not ( = ?auto_9262 ?auto_9283 ) ) ( not ( = ?auto_9266 ?auto_9282 ) ) ( not ( = ?auto_9266 ?auto_9279 ) ) ( not ( = ?auto_9266 ?auto_9274 ) ) ( not ( = ?auto_9266 ?auto_9287 ) ) ( not ( = ?auto_9266 ?auto_9278 ) ) ( not ( = ?auto_9283 ?auto_9282 ) ) ( not ( = ?auto_9283 ?auto_9279 ) ) ( not ( = ?auto_9283 ?auto_9274 ) ) ( not ( = ?auto_9283 ?auto_9287 ) ) ( not ( = ?auto_9283 ?auto_9278 ) ) ( not ( = ?auto_9258 ?auto_9265 ) ) ( not ( = ?auto_9258 ?auto_9276 ) ) ( not ( = ?auto_9259 ?auto_9265 ) ) ( not ( = ?auto_9259 ?auto_9276 ) ) ( not ( = ?auto_9260 ?auto_9265 ) ) ( not ( = ?auto_9260 ?auto_9276 ) ) ( not ( = ?auto_9261 ?auto_9265 ) ) ( not ( = ?auto_9261 ?auto_9276 ) ) ( not ( = ?auto_9262 ?auto_9265 ) ) ( not ( = ?auto_9262 ?auto_9276 ) ) ( not ( = ?auto_9263 ?auto_9265 ) ) ( not ( = ?auto_9263 ?auto_9276 ) ) ( not ( = ?auto_9265 ?auto_9283 ) ) ( not ( = ?auto_9265 ?auto_9282 ) ) ( not ( = ?auto_9265 ?auto_9279 ) ) ( not ( = ?auto_9265 ?auto_9274 ) ) ( not ( = ?auto_9265 ?auto_9287 ) ) ( not ( = ?auto_9265 ?auto_9278 ) ) ( not ( = ?auto_9276 ?auto_9283 ) ) ( not ( = ?auto_9276 ?auto_9282 ) ) ( not ( = ?auto_9276 ?auto_9279 ) ) ( not ( = ?auto_9276 ?auto_9274 ) ) ( not ( = ?auto_9276 ?auto_9287 ) ) ( not ( = ?auto_9276 ?auto_9278 ) ) ( not ( = ?auto_9258 ?auto_9264 ) ) ( not ( = ?auto_9258 ?auto_9271 ) ) ( not ( = ?auto_9259 ?auto_9264 ) ) ( not ( = ?auto_9259 ?auto_9271 ) ) ( not ( = ?auto_9260 ?auto_9264 ) ) ( not ( = ?auto_9260 ?auto_9271 ) ) ( not ( = ?auto_9261 ?auto_9264 ) ) ( not ( = ?auto_9261 ?auto_9271 ) ) ( not ( = ?auto_9262 ?auto_9264 ) ) ( not ( = ?auto_9262 ?auto_9271 ) ) ( not ( = ?auto_9263 ?auto_9264 ) ) ( not ( = ?auto_9263 ?auto_9271 ) ) ( not ( = ?auto_9266 ?auto_9264 ) ) ( not ( = ?auto_9266 ?auto_9271 ) ) ( not ( = ?auto_9264 ?auto_9276 ) ) ( not ( = ?auto_9264 ?auto_9283 ) ) ( not ( = ?auto_9264 ?auto_9282 ) ) ( not ( = ?auto_9264 ?auto_9279 ) ) ( not ( = ?auto_9264 ?auto_9274 ) ) ( not ( = ?auto_9264 ?auto_9287 ) ) ( not ( = ?auto_9264 ?auto_9278 ) ) ( not ( = ?auto_9269 ?auto_9273 ) ) ( not ( = ?auto_9269 ?auto_9280 ) ) ( not ( = ?auto_9269 ?auto_9277 ) ) ( not ( = ?auto_9269 ?auto_9286 ) ) ( not ( = ?auto_9270 ?auto_9275 ) ) ( not ( = ?auto_9270 ?auto_9281 ) ) ( not ( = ?auto_9270 ?auto_9284 ) ) ( not ( = ?auto_9270 ?auto_9285 ) ) ( not ( = ?auto_9271 ?auto_9276 ) ) ( not ( = ?auto_9271 ?auto_9283 ) ) ( not ( = ?auto_9271 ?auto_9282 ) ) ( not ( = ?auto_9271 ?auto_9279 ) ) ( not ( = ?auto_9271 ?auto_9274 ) ) ( not ( = ?auto_9271 ?auto_9287 ) ) ( not ( = ?auto_9271 ?auto_9278 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_9258 ?auto_9259 ?auto_9260 ?auto_9261 ?auto_9262 ?auto_9263 ?auto_9266 ?auto_9265 )
      ( MAKE-1CRATE ?auto_9265 ?auto_9264 )
      ( MAKE-8CRATE-VERIFY ?auto_9258 ?auto_9259 ?auto_9260 ?auto_9261 ?auto_9262 ?auto_9263 ?auto_9266 ?auto_9265 ?auto_9264 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9290 - SURFACE
      ?auto_9291 - SURFACE
    )
    :vars
    (
      ?auto_9292 - HOIST
      ?auto_9293 - PLACE
      ?auto_9295 - PLACE
      ?auto_9296 - HOIST
      ?auto_9297 - SURFACE
      ?auto_9294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9292 ?auto_9293 ) ( SURFACE-AT ?auto_9290 ?auto_9293 ) ( CLEAR ?auto_9290 ) ( IS-CRATE ?auto_9291 ) ( AVAILABLE ?auto_9292 ) ( not ( = ?auto_9295 ?auto_9293 ) ) ( HOIST-AT ?auto_9296 ?auto_9295 ) ( AVAILABLE ?auto_9296 ) ( SURFACE-AT ?auto_9291 ?auto_9295 ) ( ON ?auto_9291 ?auto_9297 ) ( CLEAR ?auto_9291 ) ( TRUCK-AT ?auto_9294 ?auto_9293 ) ( not ( = ?auto_9290 ?auto_9291 ) ) ( not ( = ?auto_9290 ?auto_9297 ) ) ( not ( = ?auto_9291 ?auto_9297 ) ) ( not ( = ?auto_9292 ?auto_9296 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9294 ?auto_9293 ?auto_9295 )
      ( !LIFT ?auto_9296 ?auto_9291 ?auto_9297 ?auto_9295 )
      ( !LOAD ?auto_9296 ?auto_9291 ?auto_9294 ?auto_9295 )
      ( !DRIVE ?auto_9294 ?auto_9295 ?auto_9293 )
      ( !UNLOAD ?auto_9292 ?auto_9291 ?auto_9294 ?auto_9293 )
      ( !DROP ?auto_9292 ?auto_9291 ?auto_9290 ?auto_9293 )
      ( MAKE-1CRATE-VERIFY ?auto_9290 ?auto_9291 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_9308 - SURFACE
      ?auto_9309 - SURFACE
      ?auto_9310 - SURFACE
      ?auto_9311 - SURFACE
      ?auto_9312 - SURFACE
      ?auto_9313 - SURFACE
      ?auto_9316 - SURFACE
      ?auto_9315 - SURFACE
      ?auto_9314 - SURFACE
      ?auto_9317 - SURFACE
    )
    :vars
    (
      ?auto_9319 - HOIST
      ?auto_9321 - PLACE
      ?auto_9320 - PLACE
      ?auto_9323 - HOIST
      ?auto_9322 - SURFACE
      ?auto_9325 - PLACE
      ?auto_9326 - HOIST
      ?auto_9324 - SURFACE
      ?auto_9327 - PLACE
      ?auto_9338 - HOIST
      ?auto_9341 - SURFACE
      ?auto_9334 - PLACE
      ?auto_9328 - HOIST
      ?auto_9329 - SURFACE
      ?auto_9337 - PLACE
      ?auto_9331 - HOIST
      ?auto_9330 - SURFACE
      ?auto_9335 - SURFACE
      ?auto_9339 - SURFACE
      ?auto_9333 - PLACE
      ?auto_9332 - HOIST
      ?auto_9340 - SURFACE
      ?auto_9336 - SURFACE
      ?auto_9318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9319 ?auto_9321 ) ( IS-CRATE ?auto_9317 ) ( not ( = ?auto_9320 ?auto_9321 ) ) ( HOIST-AT ?auto_9323 ?auto_9320 ) ( AVAILABLE ?auto_9323 ) ( SURFACE-AT ?auto_9317 ?auto_9320 ) ( ON ?auto_9317 ?auto_9322 ) ( CLEAR ?auto_9317 ) ( not ( = ?auto_9314 ?auto_9317 ) ) ( not ( = ?auto_9314 ?auto_9322 ) ) ( not ( = ?auto_9317 ?auto_9322 ) ) ( not ( = ?auto_9319 ?auto_9323 ) ) ( IS-CRATE ?auto_9314 ) ( not ( = ?auto_9325 ?auto_9321 ) ) ( HOIST-AT ?auto_9326 ?auto_9325 ) ( AVAILABLE ?auto_9326 ) ( SURFACE-AT ?auto_9314 ?auto_9325 ) ( ON ?auto_9314 ?auto_9324 ) ( CLEAR ?auto_9314 ) ( not ( = ?auto_9315 ?auto_9314 ) ) ( not ( = ?auto_9315 ?auto_9324 ) ) ( not ( = ?auto_9314 ?auto_9324 ) ) ( not ( = ?auto_9319 ?auto_9326 ) ) ( IS-CRATE ?auto_9315 ) ( not ( = ?auto_9327 ?auto_9321 ) ) ( HOIST-AT ?auto_9338 ?auto_9327 ) ( SURFACE-AT ?auto_9315 ?auto_9327 ) ( ON ?auto_9315 ?auto_9341 ) ( CLEAR ?auto_9315 ) ( not ( = ?auto_9316 ?auto_9315 ) ) ( not ( = ?auto_9316 ?auto_9341 ) ) ( not ( = ?auto_9315 ?auto_9341 ) ) ( not ( = ?auto_9319 ?auto_9338 ) ) ( IS-CRATE ?auto_9316 ) ( not ( = ?auto_9334 ?auto_9321 ) ) ( HOIST-AT ?auto_9328 ?auto_9334 ) ( SURFACE-AT ?auto_9316 ?auto_9334 ) ( ON ?auto_9316 ?auto_9329 ) ( CLEAR ?auto_9316 ) ( not ( = ?auto_9313 ?auto_9316 ) ) ( not ( = ?auto_9313 ?auto_9329 ) ) ( not ( = ?auto_9316 ?auto_9329 ) ) ( not ( = ?auto_9319 ?auto_9328 ) ) ( IS-CRATE ?auto_9313 ) ( not ( = ?auto_9337 ?auto_9321 ) ) ( HOIST-AT ?auto_9331 ?auto_9337 ) ( SURFACE-AT ?auto_9313 ?auto_9337 ) ( ON ?auto_9313 ?auto_9330 ) ( CLEAR ?auto_9313 ) ( not ( = ?auto_9312 ?auto_9313 ) ) ( not ( = ?auto_9312 ?auto_9330 ) ) ( not ( = ?auto_9313 ?auto_9330 ) ) ( not ( = ?auto_9319 ?auto_9331 ) ) ( IS-CRATE ?auto_9312 ) ( AVAILABLE ?auto_9338 ) ( SURFACE-AT ?auto_9312 ?auto_9327 ) ( ON ?auto_9312 ?auto_9335 ) ( CLEAR ?auto_9312 ) ( not ( = ?auto_9311 ?auto_9312 ) ) ( not ( = ?auto_9311 ?auto_9335 ) ) ( not ( = ?auto_9312 ?auto_9335 ) ) ( IS-CRATE ?auto_9311 ) ( AVAILABLE ?auto_9331 ) ( SURFACE-AT ?auto_9311 ?auto_9337 ) ( ON ?auto_9311 ?auto_9339 ) ( CLEAR ?auto_9311 ) ( not ( = ?auto_9310 ?auto_9311 ) ) ( not ( = ?auto_9310 ?auto_9339 ) ) ( not ( = ?auto_9311 ?auto_9339 ) ) ( IS-CRATE ?auto_9310 ) ( not ( = ?auto_9333 ?auto_9321 ) ) ( HOIST-AT ?auto_9332 ?auto_9333 ) ( AVAILABLE ?auto_9332 ) ( SURFACE-AT ?auto_9310 ?auto_9333 ) ( ON ?auto_9310 ?auto_9340 ) ( CLEAR ?auto_9310 ) ( not ( = ?auto_9309 ?auto_9310 ) ) ( not ( = ?auto_9309 ?auto_9340 ) ) ( not ( = ?auto_9310 ?auto_9340 ) ) ( not ( = ?auto_9319 ?auto_9332 ) ) ( SURFACE-AT ?auto_9308 ?auto_9321 ) ( CLEAR ?auto_9308 ) ( IS-CRATE ?auto_9309 ) ( AVAILABLE ?auto_9319 ) ( AVAILABLE ?auto_9328 ) ( SURFACE-AT ?auto_9309 ?auto_9334 ) ( ON ?auto_9309 ?auto_9336 ) ( CLEAR ?auto_9309 ) ( TRUCK-AT ?auto_9318 ?auto_9321 ) ( not ( = ?auto_9308 ?auto_9309 ) ) ( not ( = ?auto_9308 ?auto_9336 ) ) ( not ( = ?auto_9309 ?auto_9336 ) ) ( not ( = ?auto_9308 ?auto_9310 ) ) ( not ( = ?auto_9308 ?auto_9340 ) ) ( not ( = ?auto_9310 ?auto_9336 ) ) ( not ( = ?auto_9333 ?auto_9334 ) ) ( not ( = ?auto_9332 ?auto_9328 ) ) ( not ( = ?auto_9340 ?auto_9336 ) ) ( not ( = ?auto_9308 ?auto_9311 ) ) ( not ( = ?auto_9308 ?auto_9339 ) ) ( not ( = ?auto_9309 ?auto_9311 ) ) ( not ( = ?auto_9309 ?auto_9339 ) ) ( not ( = ?auto_9311 ?auto_9340 ) ) ( not ( = ?auto_9311 ?auto_9336 ) ) ( not ( = ?auto_9337 ?auto_9333 ) ) ( not ( = ?auto_9337 ?auto_9334 ) ) ( not ( = ?auto_9331 ?auto_9332 ) ) ( not ( = ?auto_9331 ?auto_9328 ) ) ( not ( = ?auto_9339 ?auto_9340 ) ) ( not ( = ?auto_9339 ?auto_9336 ) ) ( not ( = ?auto_9308 ?auto_9312 ) ) ( not ( = ?auto_9308 ?auto_9335 ) ) ( not ( = ?auto_9309 ?auto_9312 ) ) ( not ( = ?auto_9309 ?auto_9335 ) ) ( not ( = ?auto_9310 ?auto_9312 ) ) ( not ( = ?auto_9310 ?auto_9335 ) ) ( not ( = ?auto_9312 ?auto_9339 ) ) ( not ( = ?auto_9312 ?auto_9340 ) ) ( not ( = ?auto_9312 ?auto_9336 ) ) ( not ( = ?auto_9327 ?auto_9337 ) ) ( not ( = ?auto_9327 ?auto_9333 ) ) ( not ( = ?auto_9327 ?auto_9334 ) ) ( not ( = ?auto_9338 ?auto_9331 ) ) ( not ( = ?auto_9338 ?auto_9332 ) ) ( not ( = ?auto_9338 ?auto_9328 ) ) ( not ( = ?auto_9335 ?auto_9339 ) ) ( not ( = ?auto_9335 ?auto_9340 ) ) ( not ( = ?auto_9335 ?auto_9336 ) ) ( not ( = ?auto_9308 ?auto_9313 ) ) ( not ( = ?auto_9308 ?auto_9330 ) ) ( not ( = ?auto_9309 ?auto_9313 ) ) ( not ( = ?auto_9309 ?auto_9330 ) ) ( not ( = ?auto_9310 ?auto_9313 ) ) ( not ( = ?auto_9310 ?auto_9330 ) ) ( not ( = ?auto_9311 ?auto_9313 ) ) ( not ( = ?auto_9311 ?auto_9330 ) ) ( not ( = ?auto_9313 ?auto_9335 ) ) ( not ( = ?auto_9313 ?auto_9339 ) ) ( not ( = ?auto_9313 ?auto_9340 ) ) ( not ( = ?auto_9313 ?auto_9336 ) ) ( not ( = ?auto_9330 ?auto_9335 ) ) ( not ( = ?auto_9330 ?auto_9339 ) ) ( not ( = ?auto_9330 ?auto_9340 ) ) ( not ( = ?auto_9330 ?auto_9336 ) ) ( not ( = ?auto_9308 ?auto_9316 ) ) ( not ( = ?auto_9308 ?auto_9329 ) ) ( not ( = ?auto_9309 ?auto_9316 ) ) ( not ( = ?auto_9309 ?auto_9329 ) ) ( not ( = ?auto_9310 ?auto_9316 ) ) ( not ( = ?auto_9310 ?auto_9329 ) ) ( not ( = ?auto_9311 ?auto_9316 ) ) ( not ( = ?auto_9311 ?auto_9329 ) ) ( not ( = ?auto_9312 ?auto_9316 ) ) ( not ( = ?auto_9312 ?auto_9329 ) ) ( not ( = ?auto_9316 ?auto_9330 ) ) ( not ( = ?auto_9316 ?auto_9335 ) ) ( not ( = ?auto_9316 ?auto_9339 ) ) ( not ( = ?auto_9316 ?auto_9340 ) ) ( not ( = ?auto_9316 ?auto_9336 ) ) ( not ( = ?auto_9329 ?auto_9330 ) ) ( not ( = ?auto_9329 ?auto_9335 ) ) ( not ( = ?auto_9329 ?auto_9339 ) ) ( not ( = ?auto_9329 ?auto_9340 ) ) ( not ( = ?auto_9329 ?auto_9336 ) ) ( not ( = ?auto_9308 ?auto_9315 ) ) ( not ( = ?auto_9308 ?auto_9341 ) ) ( not ( = ?auto_9309 ?auto_9315 ) ) ( not ( = ?auto_9309 ?auto_9341 ) ) ( not ( = ?auto_9310 ?auto_9315 ) ) ( not ( = ?auto_9310 ?auto_9341 ) ) ( not ( = ?auto_9311 ?auto_9315 ) ) ( not ( = ?auto_9311 ?auto_9341 ) ) ( not ( = ?auto_9312 ?auto_9315 ) ) ( not ( = ?auto_9312 ?auto_9341 ) ) ( not ( = ?auto_9313 ?auto_9315 ) ) ( not ( = ?auto_9313 ?auto_9341 ) ) ( not ( = ?auto_9315 ?auto_9329 ) ) ( not ( = ?auto_9315 ?auto_9330 ) ) ( not ( = ?auto_9315 ?auto_9335 ) ) ( not ( = ?auto_9315 ?auto_9339 ) ) ( not ( = ?auto_9315 ?auto_9340 ) ) ( not ( = ?auto_9315 ?auto_9336 ) ) ( not ( = ?auto_9341 ?auto_9329 ) ) ( not ( = ?auto_9341 ?auto_9330 ) ) ( not ( = ?auto_9341 ?auto_9335 ) ) ( not ( = ?auto_9341 ?auto_9339 ) ) ( not ( = ?auto_9341 ?auto_9340 ) ) ( not ( = ?auto_9341 ?auto_9336 ) ) ( not ( = ?auto_9308 ?auto_9314 ) ) ( not ( = ?auto_9308 ?auto_9324 ) ) ( not ( = ?auto_9309 ?auto_9314 ) ) ( not ( = ?auto_9309 ?auto_9324 ) ) ( not ( = ?auto_9310 ?auto_9314 ) ) ( not ( = ?auto_9310 ?auto_9324 ) ) ( not ( = ?auto_9311 ?auto_9314 ) ) ( not ( = ?auto_9311 ?auto_9324 ) ) ( not ( = ?auto_9312 ?auto_9314 ) ) ( not ( = ?auto_9312 ?auto_9324 ) ) ( not ( = ?auto_9313 ?auto_9314 ) ) ( not ( = ?auto_9313 ?auto_9324 ) ) ( not ( = ?auto_9316 ?auto_9314 ) ) ( not ( = ?auto_9316 ?auto_9324 ) ) ( not ( = ?auto_9314 ?auto_9341 ) ) ( not ( = ?auto_9314 ?auto_9329 ) ) ( not ( = ?auto_9314 ?auto_9330 ) ) ( not ( = ?auto_9314 ?auto_9335 ) ) ( not ( = ?auto_9314 ?auto_9339 ) ) ( not ( = ?auto_9314 ?auto_9340 ) ) ( not ( = ?auto_9314 ?auto_9336 ) ) ( not ( = ?auto_9325 ?auto_9327 ) ) ( not ( = ?auto_9325 ?auto_9334 ) ) ( not ( = ?auto_9325 ?auto_9337 ) ) ( not ( = ?auto_9325 ?auto_9333 ) ) ( not ( = ?auto_9326 ?auto_9338 ) ) ( not ( = ?auto_9326 ?auto_9328 ) ) ( not ( = ?auto_9326 ?auto_9331 ) ) ( not ( = ?auto_9326 ?auto_9332 ) ) ( not ( = ?auto_9324 ?auto_9341 ) ) ( not ( = ?auto_9324 ?auto_9329 ) ) ( not ( = ?auto_9324 ?auto_9330 ) ) ( not ( = ?auto_9324 ?auto_9335 ) ) ( not ( = ?auto_9324 ?auto_9339 ) ) ( not ( = ?auto_9324 ?auto_9340 ) ) ( not ( = ?auto_9324 ?auto_9336 ) ) ( not ( = ?auto_9308 ?auto_9317 ) ) ( not ( = ?auto_9308 ?auto_9322 ) ) ( not ( = ?auto_9309 ?auto_9317 ) ) ( not ( = ?auto_9309 ?auto_9322 ) ) ( not ( = ?auto_9310 ?auto_9317 ) ) ( not ( = ?auto_9310 ?auto_9322 ) ) ( not ( = ?auto_9311 ?auto_9317 ) ) ( not ( = ?auto_9311 ?auto_9322 ) ) ( not ( = ?auto_9312 ?auto_9317 ) ) ( not ( = ?auto_9312 ?auto_9322 ) ) ( not ( = ?auto_9313 ?auto_9317 ) ) ( not ( = ?auto_9313 ?auto_9322 ) ) ( not ( = ?auto_9316 ?auto_9317 ) ) ( not ( = ?auto_9316 ?auto_9322 ) ) ( not ( = ?auto_9315 ?auto_9317 ) ) ( not ( = ?auto_9315 ?auto_9322 ) ) ( not ( = ?auto_9317 ?auto_9324 ) ) ( not ( = ?auto_9317 ?auto_9341 ) ) ( not ( = ?auto_9317 ?auto_9329 ) ) ( not ( = ?auto_9317 ?auto_9330 ) ) ( not ( = ?auto_9317 ?auto_9335 ) ) ( not ( = ?auto_9317 ?auto_9339 ) ) ( not ( = ?auto_9317 ?auto_9340 ) ) ( not ( = ?auto_9317 ?auto_9336 ) ) ( not ( = ?auto_9320 ?auto_9325 ) ) ( not ( = ?auto_9320 ?auto_9327 ) ) ( not ( = ?auto_9320 ?auto_9334 ) ) ( not ( = ?auto_9320 ?auto_9337 ) ) ( not ( = ?auto_9320 ?auto_9333 ) ) ( not ( = ?auto_9323 ?auto_9326 ) ) ( not ( = ?auto_9323 ?auto_9338 ) ) ( not ( = ?auto_9323 ?auto_9328 ) ) ( not ( = ?auto_9323 ?auto_9331 ) ) ( not ( = ?auto_9323 ?auto_9332 ) ) ( not ( = ?auto_9322 ?auto_9324 ) ) ( not ( = ?auto_9322 ?auto_9341 ) ) ( not ( = ?auto_9322 ?auto_9329 ) ) ( not ( = ?auto_9322 ?auto_9330 ) ) ( not ( = ?auto_9322 ?auto_9335 ) ) ( not ( = ?auto_9322 ?auto_9339 ) ) ( not ( = ?auto_9322 ?auto_9340 ) ) ( not ( = ?auto_9322 ?auto_9336 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_9308 ?auto_9309 ?auto_9310 ?auto_9311 ?auto_9312 ?auto_9313 ?auto_9316 ?auto_9315 ?auto_9314 )
      ( MAKE-1CRATE ?auto_9314 ?auto_9317 )
      ( MAKE-9CRATE-VERIFY ?auto_9308 ?auto_9309 ?auto_9310 ?auto_9311 ?auto_9312 ?auto_9313 ?auto_9316 ?auto_9315 ?auto_9314 ?auto_9317 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9344 - SURFACE
      ?auto_9345 - SURFACE
    )
    :vars
    (
      ?auto_9346 - HOIST
      ?auto_9347 - PLACE
      ?auto_9349 - PLACE
      ?auto_9350 - HOIST
      ?auto_9351 - SURFACE
      ?auto_9348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9346 ?auto_9347 ) ( SURFACE-AT ?auto_9344 ?auto_9347 ) ( CLEAR ?auto_9344 ) ( IS-CRATE ?auto_9345 ) ( AVAILABLE ?auto_9346 ) ( not ( = ?auto_9349 ?auto_9347 ) ) ( HOIST-AT ?auto_9350 ?auto_9349 ) ( AVAILABLE ?auto_9350 ) ( SURFACE-AT ?auto_9345 ?auto_9349 ) ( ON ?auto_9345 ?auto_9351 ) ( CLEAR ?auto_9345 ) ( TRUCK-AT ?auto_9348 ?auto_9347 ) ( not ( = ?auto_9344 ?auto_9345 ) ) ( not ( = ?auto_9344 ?auto_9351 ) ) ( not ( = ?auto_9345 ?auto_9351 ) ) ( not ( = ?auto_9346 ?auto_9350 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9348 ?auto_9347 ?auto_9349 )
      ( !LIFT ?auto_9350 ?auto_9345 ?auto_9351 ?auto_9349 )
      ( !LOAD ?auto_9350 ?auto_9345 ?auto_9348 ?auto_9349 )
      ( !DRIVE ?auto_9348 ?auto_9349 ?auto_9347 )
      ( !UNLOAD ?auto_9346 ?auto_9345 ?auto_9348 ?auto_9347 )
      ( !DROP ?auto_9346 ?auto_9345 ?auto_9344 ?auto_9347 )
      ( MAKE-1CRATE-VERIFY ?auto_9344 ?auto_9345 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_9363 - SURFACE
      ?auto_9364 - SURFACE
      ?auto_9365 - SURFACE
      ?auto_9366 - SURFACE
      ?auto_9367 - SURFACE
      ?auto_9368 - SURFACE
      ?auto_9371 - SURFACE
      ?auto_9370 - SURFACE
      ?auto_9369 - SURFACE
      ?auto_9372 - SURFACE
      ?auto_9373 - SURFACE
    )
    :vars
    (
      ?auto_9379 - HOIST
      ?auto_9378 - PLACE
      ?auto_9377 - PLACE
      ?auto_9374 - HOIST
      ?auto_9376 - SURFACE
      ?auto_9380 - PLACE
      ?auto_9390 - HOIST
      ?auto_9389 - SURFACE
      ?auto_9385 - PLACE
      ?auto_9387 - HOIST
      ?auto_9384 - SURFACE
      ?auto_9381 - PLACE
      ?auto_9383 - HOIST
      ?auto_9382 - SURFACE
      ?auto_9388 - PLACE
      ?auto_9392 - HOIST
      ?auto_9398 - SURFACE
      ?auto_9391 - SURFACE
      ?auto_9395 - SURFACE
      ?auto_9396 - SURFACE
      ?auto_9394 - PLACE
      ?auto_9393 - HOIST
      ?auto_9386 - SURFACE
      ?auto_9397 - SURFACE
      ?auto_9375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9379 ?auto_9378 ) ( IS-CRATE ?auto_9373 ) ( not ( = ?auto_9377 ?auto_9378 ) ) ( HOIST-AT ?auto_9374 ?auto_9377 ) ( SURFACE-AT ?auto_9373 ?auto_9377 ) ( ON ?auto_9373 ?auto_9376 ) ( CLEAR ?auto_9373 ) ( not ( = ?auto_9372 ?auto_9373 ) ) ( not ( = ?auto_9372 ?auto_9376 ) ) ( not ( = ?auto_9373 ?auto_9376 ) ) ( not ( = ?auto_9379 ?auto_9374 ) ) ( IS-CRATE ?auto_9372 ) ( not ( = ?auto_9380 ?auto_9378 ) ) ( HOIST-AT ?auto_9390 ?auto_9380 ) ( AVAILABLE ?auto_9390 ) ( SURFACE-AT ?auto_9372 ?auto_9380 ) ( ON ?auto_9372 ?auto_9389 ) ( CLEAR ?auto_9372 ) ( not ( = ?auto_9369 ?auto_9372 ) ) ( not ( = ?auto_9369 ?auto_9389 ) ) ( not ( = ?auto_9372 ?auto_9389 ) ) ( not ( = ?auto_9379 ?auto_9390 ) ) ( IS-CRATE ?auto_9369 ) ( not ( = ?auto_9385 ?auto_9378 ) ) ( HOIST-AT ?auto_9387 ?auto_9385 ) ( AVAILABLE ?auto_9387 ) ( SURFACE-AT ?auto_9369 ?auto_9385 ) ( ON ?auto_9369 ?auto_9384 ) ( CLEAR ?auto_9369 ) ( not ( = ?auto_9370 ?auto_9369 ) ) ( not ( = ?auto_9370 ?auto_9384 ) ) ( not ( = ?auto_9369 ?auto_9384 ) ) ( not ( = ?auto_9379 ?auto_9387 ) ) ( IS-CRATE ?auto_9370 ) ( not ( = ?auto_9381 ?auto_9378 ) ) ( HOIST-AT ?auto_9383 ?auto_9381 ) ( SURFACE-AT ?auto_9370 ?auto_9381 ) ( ON ?auto_9370 ?auto_9382 ) ( CLEAR ?auto_9370 ) ( not ( = ?auto_9371 ?auto_9370 ) ) ( not ( = ?auto_9371 ?auto_9382 ) ) ( not ( = ?auto_9370 ?auto_9382 ) ) ( not ( = ?auto_9379 ?auto_9383 ) ) ( IS-CRATE ?auto_9371 ) ( not ( = ?auto_9388 ?auto_9378 ) ) ( HOIST-AT ?auto_9392 ?auto_9388 ) ( SURFACE-AT ?auto_9371 ?auto_9388 ) ( ON ?auto_9371 ?auto_9398 ) ( CLEAR ?auto_9371 ) ( not ( = ?auto_9368 ?auto_9371 ) ) ( not ( = ?auto_9368 ?auto_9398 ) ) ( not ( = ?auto_9371 ?auto_9398 ) ) ( not ( = ?auto_9379 ?auto_9392 ) ) ( IS-CRATE ?auto_9368 ) ( SURFACE-AT ?auto_9368 ?auto_9377 ) ( ON ?auto_9368 ?auto_9391 ) ( CLEAR ?auto_9368 ) ( not ( = ?auto_9367 ?auto_9368 ) ) ( not ( = ?auto_9367 ?auto_9391 ) ) ( not ( = ?auto_9368 ?auto_9391 ) ) ( IS-CRATE ?auto_9367 ) ( AVAILABLE ?auto_9383 ) ( SURFACE-AT ?auto_9367 ?auto_9381 ) ( ON ?auto_9367 ?auto_9395 ) ( CLEAR ?auto_9367 ) ( not ( = ?auto_9366 ?auto_9367 ) ) ( not ( = ?auto_9366 ?auto_9395 ) ) ( not ( = ?auto_9367 ?auto_9395 ) ) ( IS-CRATE ?auto_9366 ) ( AVAILABLE ?auto_9374 ) ( SURFACE-AT ?auto_9366 ?auto_9377 ) ( ON ?auto_9366 ?auto_9396 ) ( CLEAR ?auto_9366 ) ( not ( = ?auto_9365 ?auto_9366 ) ) ( not ( = ?auto_9365 ?auto_9396 ) ) ( not ( = ?auto_9366 ?auto_9396 ) ) ( IS-CRATE ?auto_9365 ) ( not ( = ?auto_9394 ?auto_9378 ) ) ( HOIST-AT ?auto_9393 ?auto_9394 ) ( AVAILABLE ?auto_9393 ) ( SURFACE-AT ?auto_9365 ?auto_9394 ) ( ON ?auto_9365 ?auto_9386 ) ( CLEAR ?auto_9365 ) ( not ( = ?auto_9364 ?auto_9365 ) ) ( not ( = ?auto_9364 ?auto_9386 ) ) ( not ( = ?auto_9365 ?auto_9386 ) ) ( not ( = ?auto_9379 ?auto_9393 ) ) ( SURFACE-AT ?auto_9363 ?auto_9378 ) ( CLEAR ?auto_9363 ) ( IS-CRATE ?auto_9364 ) ( AVAILABLE ?auto_9379 ) ( AVAILABLE ?auto_9392 ) ( SURFACE-AT ?auto_9364 ?auto_9388 ) ( ON ?auto_9364 ?auto_9397 ) ( CLEAR ?auto_9364 ) ( TRUCK-AT ?auto_9375 ?auto_9378 ) ( not ( = ?auto_9363 ?auto_9364 ) ) ( not ( = ?auto_9363 ?auto_9397 ) ) ( not ( = ?auto_9364 ?auto_9397 ) ) ( not ( = ?auto_9363 ?auto_9365 ) ) ( not ( = ?auto_9363 ?auto_9386 ) ) ( not ( = ?auto_9365 ?auto_9397 ) ) ( not ( = ?auto_9394 ?auto_9388 ) ) ( not ( = ?auto_9393 ?auto_9392 ) ) ( not ( = ?auto_9386 ?auto_9397 ) ) ( not ( = ?auto_9363 ?auto_9366 ) ) ( not ( = ?auto_9363 ?auto_9396 ) ) ( not ( = ?auto_9364 ?auto_9366 ) ) ( not ( = ?auto_9364 ?auto_9396 ) ) ( not ( = ?auto_9366 ?auto_9386 ) ) ( not ( = ?auto_9366 ?auto_9397 ) ) ( not ( = ?auto_9377 ?auto_9394 ) ) ( not ( = ?auto_9377 ?auto_9388 ) ) ( not ( = ?auto_9374 ?auto_9393 ) ) ( not ( = ?auto_9374 ?auto_9392 ) ) ( not ( = ?auto_9396 ?auto_9386 ) ) ( not ( = ?auto_9396 ?auto_9397 ) ) ( not ( = ?auto_9363 ?auto_9367 ) ) ( not ( = ?auto_9363 ?auto_9395 ) ) ( not ( = ?auto_9364 ?auto_9367 ) ) ( not ( = ?auto_9364 ?auto_9395 ) ) ( not ( = ?auto_9365 ?auto_9367 ) ) ( not ( = ?auto_9365 ?auto_9395 ) ) ( not ( = ?auto_9367 ?auto_9396 ) ) ( not ( = ?auto_9367 ?auto_9386 ) ) ( not ( = ?auto_9367 ?auto_9397 ) ) ( not ( = ?auto_9381 ?auto_9377 ) ) ( not ( = ?auto_9381 ?auto_9394 ) ) ( not ( = ?auto_9381 ?auto_9388 ) ) ( not ( = ?auto_9383 ?auto_9374 ) ) ( not ( = ?auto_9383 ?auto_9393 ) ) ( not ( = ?auto_9383 ?auto_9392 ) ) ( not ( = ?auto_9395 ?auto_9396 ) ) ( not ( = ?auto_9395 ?auto_9386 ) ) ( not ( = ?auto_9395 ?auto_9397 ) ) ( not ( = ?auto_9363 ?auto_9368 ) ) ( not ( = ?auto_9363 ?auto_9391 ) ) ( not ( = ?auto_9364 ?auto_9368 ) ) ( not ( = ?auto_9364 ?auto_9391 ) ) ( not ( = ?auto_9365 ?auto_9368 ) ) ( not ( = ?auto_9365 ?auto_9391 ) ) ( not ( = ?auto_9366 ?auto_9368 ) ) ( not ( = ?auto_9366 ?auto_9391 ) ) ( not ( = ?auto_9368 ?auto_9395 ) ) ( not ( = ?auto_9368 ?auto_9396 ) ) ( not ( = ?auto_9368 ?auto_9386 ) ) ( not ( = ?auto_9368 ?auto_9397 ) ) ( not ( = ?auto_9391 ?auto_9395 ) ) ( not ( = ?auto_9391 ?auto_9396 ) ) ( not ( = ?auto_9391 ?auto_9386 ) ) ( not ( = ?auto_9391 ?auto_9397 ) ) ( not ( = ?auto_9363 ?auto_9371 ) ) ( not ( = ?auto_9363 ?auto_9398 ) ) ( not ( = ?auto_9364 ?auto_9371 ) ) ( not ( = ?auto_9364 ?auto_9398 ) ) ( not ( = ?auto_9365 ?auto_9371 ) ) ( not ( = ?auto_9365 ?auto_9398 ) ) ( not ( = ?auto_9366 ?auto_9371 ) ) ( not ( = ?auto_9366 ?auto_9398 ) ) ( not ( = ?auto_9367 ?auto_9371 ) ) ( not ( = ?auto_9367 ?auto_9398 ) ) ( not ( = ?auto_9371 ?auto_9391 ) ) ( not ( = ?auto_9371 ?auto_9395 ) ) ( not ( = ?auto_9371 ?auto_9396 ) ) ( not ( = ?auto_9371 ?auto_9386 ) ) ( not ( = ?auto_9371 ?auto_9397 ) ) ( not ( = ?auto_9398 ?auto_9391 ) ) ( not ( = ?auto_9398 ?auto_9395 ) ) ( not ( = ?auto_9398 ?auto_9396 ) ) ( not ( = ?auto_9398 ?auto_9386 ) ) ( not ( = ?auto_9398 ?auto_9397 ) ) ( not ( = ?auto_9363 ?auto_9370 ) ) ( not ( = ?auto_9363 ?auto_9382 ) ) ( not ( = ?auto_9364 ?auto_9370 ) ) ( not ( = ?auto_9364 ?auto_9382 ) ) ( not ( = ?auto_9365 ?auto_9370 ) ) ( not ( = ?auto_9365 ?auto_9382 ) ) ( not ( = ?auto_9366 ?auto_9370 ) ) ( not ( = ?auto_9366 ?auto_9382 ) ) ( not ( = ?auto_9367 ?auto_9370 ) ) ( not ( = ?auto_9367 ?auto_9382 ) ) ( not ( = ?auto_9368 ?auto_9370 ) ) ( not ( = ?auto_9368 ?auto_9382 ) ) ( not ( = ?auto_9370 ?auto_9398 ) ) ( not ( = ?auto_9370 ?auto_9391 ) ) ( not ( = ?auto_9370 ?auto_9395 ) ) ( not ( = ?auto_9370 ?auto_9396 ) ) ( not ( = ?auto_9370 ?auto_9386 ) ) ( not ( = ?auto_9370 ?auto_9397 ) ) ( not ( = ?auto_9382 ?auto_9398 ) ) ( not ( = ?auto_9382 ?auto_9391 ) ) ( not ( = ?auto_9382 ?auto_9395 ) ) ( not ( = ?auto_9382 ?auto_9396 ) ) ( not ( = ?auto_9382 ?auto_9386 ) ) ( not ( = ?auto_9382 ?auto_9397 ) ) ( not ( = ?auto_9363 ?auto_9369 ) ) ( not ( = ?auto_9363 ?auto_9384 ) ) ( not ( = ?auto_9364 ?auto_9369 ) ) ( not ( = ?auto_9364 ?auto_9384 ) ) ( not ( = ?auto_9365 ?auto_9369 ) ) ( not ( = ?auto_9365 ?auto_9384 ) ) ( not ( = ?auto_9366 ?auto_9369 ) ) ( not ( = ?auto_9366 ?auto_9384 ) ) ( not ( = ?auto_9367 ?auto_9369 ) ) ( not ( = ?auto_9367 ?auto_9384 ) ) ( not ( = ?auto_9368 ?auto_9369 ) ) ( not ( = ?auto_9368 ?auto_9384 ) ) ( not ( = ?auto_9371 ?auto_9369 ) ) ( not ( = ?auto_9371 ?auto_9384 ) ) ( not ( = ?auto_9369 ?auto_9382 ) ) ( not ( = ?auto_9369 ?auto_9398 ) ) ( not ( = ?auto_9369 ?auto_9391 ) ) ( not ( = ?auto_9369 ?auto_9395 ) ) ( not ( = ?auto_9369 ?auto_9396 ) ) ( not ( = ?auto_9369 ?auto_9386 ) ) ( not ( = ?auto_9369 ?auto_9397 ) ) ( not ( = ?auto_9385 ?auto_9381 ) ) ( not ( = ?auto_9385 ?auto_9388 ) ) ( not ( = ?auto_9385 ?auto_9377 ) ) ( not ( = ?auto_9385 ?auto_9394 ) ) ( not ( = ?auto_9387 ?auto_9383 ) ) ( not ( = ?auto_9387 ?auto_9392 ) ) ( not ( = ?auto_9387 ?auto_9374 ) ) ( not ( = ?auto_9387 ?auto_9393 ) ) ( not ( = ?auto_9384 ?auto_9382 ) ) ( not ( = ?auto_9384 ?auto_9398 ) ) ( not ( = ?auto_9384 ?auto_9391 ) ) ( not ( = ?auto_9384 ?auto_9395 ) ) ( not ( = ?auto_9384 ?auto_9396 ) ) ( not ( = ?auto_9384 ?auto_9386 ) ) ( not ( = ?auto_9384 ?auto_9397 ) ) ( not ( = ?auto_9363 ?auto_9372 ) ) ( not ( = ?auto_9363 ?auto_9389 ) ) ( not ( = ?auto_9364 ?auto_9372 ) ) ( not ( = ?auto_9364 ?auto_9389 ) ) ( not ( = ?auto_9365 ?auto_9372 ) ) ( not ( = ?auto_9365 ?auto_9389 ) ) ( not ( = ?auto_9366 ?auto_9372 ) ) ( not ( = ?auto_9366 ?auto_9389 ) ) ( not ( = ?auto_9367 ?auto_9372 ) ) ( not ( = ?auto_9367 ?auto_9389 ) ) ( not ( = ?auto_9368 ?auto_9372 ) ) ( not ( = ?auto_9368 ?auto_9389 ) ) ( not ( = ?auto_9371 ?auto_9372 ) ) ( not ( = ?auto_9371 ?auto_9389 ) ) ( not ( = ?auto_9370 ?auto_9372 ) ) ( not ( = ?auto_9370 ?auto_9389 ) ) ( not ( = ?auto_9372 ?auto_9384 ) ) ( not ( = ?auto_9372 ?auto_9382 ) ) ( not ( = ?auto_9372 ?auto_9398 ) ) ( not ( = ?auto_9372 ?auto_9391 ) ) ( not ( = ?auto_9372 ?auto_9395 ) ) ( not ( = ?auto_9372 ?auto_9396 ) ) ( not ( = ?auto_9372 ?auto_9386 ) ) ( not ( = ?auto_9372 ?auto_9397 ) ) ( not ( = ?auto_9380 ?auto_9385 ) ) ( not ( = ?auto_9380 ?auto_9381 ) ) ( not ( = ?auto_9380 ?auto_9388 ) ) ( not ( = ?auto_9380 ?auto_9377 ) ) ( not ( = ?auto_9380 ?auto_9394 ) ) ( not ( = ?auto_9390 ?auto_9387 ) ) ( not ( = ?auto_9390 ?auto_9383 ) ) ( not ( = ?auto_9390 ?auto_9392 ) ) ( not ( = ?auto_9390 ?auto_9374 ) ) ( not ( = ?auto_9390 ?auto_9393 ) ) ( not ( = ?auto_9389 ?auto_9384 ) ) ( not ( = ?auto_9389 ?auto_9382 ) ) ( not ( = ?auto_9389 ?auto_9398 ) ) ( not ( = ?auto_9389 ?auto_9391 ) ) ( not ( = ?auto_9389 ?auto_9395 ) ) ( not ( = ?auto_9389 ?auto_9396 ) ) ( not ( = ?auto_9389 ?auto_9386 ) ) ( not ( = ?auto_9389 ?auto_9397 ) ) ( not ( = ?auto_9363 ?auto_9373 ) ) ( not ( = ?auto_9363 ?auto_9376 ) ) ( not ( = ?auto_9364 ?auto_9373 ) ) ( not ( = ?auto_9364 ?auto_9376 ) ) ( not ( = ?auto_9365 ?auto_9373 ) ) ( not ( = ?auto_9365 ?auto_9376 ) ) ( not ( = ?auto_9366 ?auto_9373 ) ) ( not ( = ?auto_9366 ?auto_9376 ) ) ( not ( = ?auto_9367 ?auto_9373 ) ) ( not ( = ?auto_9367 ?auto_9376 ) ) ( not ( = ?auto_9368 ?auto_9373 ) ) ( not ( = ?auto_9368 ?auto_9376 ) ) ( not ( = ?auto_9371 ?auto_9373 ) ) ( not ( = ?auto_9371 ?auto_9376 ) ) ( not ( = ?auto_9370 ?auto_9373 ) ) ( not ( = ?auto_9370 ?auto_9376 ) ) ( not ( = ?auto_9369 ?auto_9373 ) ) ( not ( = ?auto_9369 ?auto_9376 ) ) ( not ( = ?auto_9373 ?auto_9389 ) ) ( not ( = ?auto_9373 ?auto_9384 ) ) ( not ( = ?auto_9373 ?auto_9382 ) ) ( not ( = ?auto_9373 ?auto_9398 ) ) ( not ( = ?auto_9373 ?auto_9391 ) ) ( not ( = ?auto_9373 ?auto_9395 ) ) ( not ( = ?auto_9373 ?auto_9396 ) ) ( not ( = ?auto_9373 ?auto_9386 ) ) ( not ( = ?auto_9373 ?auto_9397 ) ) ( not ( = ?auto_9376 ?auto_9389 ) ) ( not ( = ?auto_9376 ?auto_9384 ) ) ( not ( = ?auto_9376 ?auto_9382 ) ) ( not ( = ?auto_9376 ?auto_9398 ) ) ( not ( = ?auto_9376 ?auto_9391 ) ) ( not ( = ?auto_9376 ?auto_9395 ) ) ( not ( = ?auto_9376 ?auto_9396 ) ) ( not ( = ?auto_9376 ?auto_9386 ) ) ( not ( = ?auto_9376 ?auto_9397 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_9363 ?auto_9364 ?auto_9365 ?auto_9366 ?auto_9367 ?auto_9368 ?auto_9371 ?auto_9370 ?auto_9369 ?auto_9372 )
      ( MAKE-1CRATE ?auto_9372 ?auto_9373 )
      ( MAKE-10CRATE-VERIFY ?auto_9363 ?auto_9364 ?auto_9365 ?auto_9366 ?auto_9367 ?auto_9368 ?auto_9371 ?auto_9370 ?auto_9369 ?auto_9372 ?auto_9373 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9401 - SURFACE
      ?auto_9402 - SURFACE
    )
    :vars
    (
      ?auto_9403 - HOIST
      ?auto_9404 - PLACE
      ?auto_9406 - PLACE
      ?auto_9407 - HOIST
      ?auto_9408 - SURFACE
      ?auto_9405 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9403 ?auto_9404 ) ( SURFACE-AT ?auto_9401 ?auto_9404 ) ( CLEAR ?auto_9401 ) ( IS-CRATE ?auto_9402 ) ( AVAILABLE ?auto_9403 ) ( not ( = ?auto_9406 ?auto_9404 ) ) ( HOIST-AT ?auto_9407 ?auto_9406 ) ( AVAILABLE ?auto_9407 ) ( SURFACE-AT ?auto_9402 ?auto_9406 ) ( ON ?auto_9402 ?auto_9408 ) ( CLEAR ?auto_9402 ) ( TRUCK-AT ?auto_9405 ?auto_9404 ) ( not ( = ?auto_9401 ?auto_9402 ) ) ( not ( = ?auto_9401 ?auto_9408 ) ) ( not ( = ?auto_9402 ?auto_9408 ) ) ( not ( = ?auto_9403 ?auto_9407 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9405 ?auto_9404 ?auto_9406 )
      ( !LIFT ?auto_9407 ?auto_9402 ?auto_9408 ?auto_9406 )
      ( !LOAD ?auto_9407 ?auto_9402 ?auto_9405 ?auto_9406 )
      ( !DRIVE ?auto_9405 ?auto_9406 ?auto_9404 )
      ( !UNLOAD ?auto_9403 ?auto_9402 ?auto_9405 ?auto_9404 )
      ( !DROP ?auto_9403 ?auto_9402 ?auto_9401 ?auto_9404 )
      ( MAKE-1CRATE-VERIFY ?auto_9401 ?auto_9402 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_9421 - SURFACE
      ?auto_9422 - SURFACE
      ?auto_9423 - SURFACE
      ?auto_9424 - SURFACE
      ?auto_9425 - SURFACE
      ?auto_9426 - SURFACE
      ?auto_9429 - SURFACE
      ?auto_9428 - SURFACE
      ?auto_9427 - SURFACE
      ?auto_9430 - SURFACE
      ?auto_9432 - SURFACE
      ?auto_9431 - SURFACE
    )
    :vars
    (
      ?auto_9434 - HOIST
      ?auto_9436 - PLACE
      ?auto_9435 - PLACE
      ?auto_9438 - HOIST
      ?auto_9433 - SURFACE
      ?auto_9444 - PLACE
      ?auto_9454 - HOIST
      ?auto_9453 - SURFACE
      ?auto_9442 - SURFACE
      ?auto_9457 - PLACE
      ?auto_9447 - HOIST
      ?auto_9446 - SURFACE
      ?auto_9448 - PLACE
      ?auto_9455 - HOIST
      ?auto_9439 - SURFACE
      ?auto_9458 - PLACE
      ?auto_9452 - HOIST
      ?auto_9441 - SURFACE
      ?auto_9456 - SURFACE
      ?auto_9451 - SURFACE
      ?auto_9440 - SURFACE
      ?auto_9443 - PLACE
      ?auto_9450 - HOIST
      ?auto_9449 - SURFACE
      ?auto_9445 - SURFACE
      ?auto_9437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9434 ?auto_9436 ) ( IS-CRATE ?auto_9431 ) ( not ( = ?auto_9435 ?auto_9436 ) ) ( HOIST-AT ?auto_9438 ?auto_9435 ) ( SURFACE-AT ?auto_9431 ?auto_9435 ) ( ON ?auto_9431 ?auto_9433 ) ( CLEAR ?auto_9431 ) ( not ( = ?auto_9432 ?auto_9431 ) ) ( not ( = ?auto_9432 ?auto_9433 ) ) ( not ( = ?auto_9431 ?auto_9433 ) ) ( not ( = ?auto_9434 ?auto_9438 ) ) ( IS-CRATE ?auto_9432 ) ( not ( = ?auto_9444 ?auto_9436 ) ) ( HOIST-AT ?auto_9454 ?auto_9444 ) ( SURFACE-AT ?auto_9432 ?auto_9444 ) ( ON ?auto_9432 ?auto_9453 ) ( CLEAR ?auto_9432 ) ( not ( = ?auto_9430 ?auto_9432 ) ) ( not ( = ?auto_9430 ?auto_9453 ) ) ( not ( = ?auto_9432 ?auto_9453 ) ) ( not ( = ?auto_9434 ?auto_9454 ) ) ( IS-CRATE ?auto_9430 ) ( AVAILABLE ?auto_9438 ) ( SURFACE-AT ?auto_9430 ?auto_9435 ) ( ON ?auto_9430 ?auto_9442 ) ( CLEAR ?auto_9430 ) ( not ( = ?auto_9427 ?auto_9430 ) ) ( not ( = ?auto_9427 ?auto_9442 ) ) ( not ( = ?auto_9430 ?auto_9442 ) ) ( IS-CRATE ?auto_9427 ) ( not ( = ?auto_9457 ?auto_9436 ) ) ( HOIST-AT ?auto_9447 ?auto_9457 ) ( AVAILABLE ?auto_9447 ) ( SURFACE-AT ?auto_9427 ?auto_9457 ) ( ON ?auto_9427 ?auto_9446 ) ( CLEAR ?auto_9427 ) ( not ( = ?auto_9428 ?auto_9427 ) ) ( not ( = ?auto_9428 ?auto_9446 ) ) ( not ( = ?auto_9427 ?auto_9446 ) ) ( not ( = ?auto_9434 ?auto_9447 ) ) ( IS-CRATE ?auto_9428 ) ( not ( = ?auto_9448 ?auto_9436 ) ) ( HOIST-AT ?auto_9455 ?auto_9448 ) ( SURFACE-AT ?auto_9428 ?auto_9448 ) ( ON ?auto_9428 ?auto_9439 ) ( CLEAR ?auto_9428 ) ( not ( = ?auto_9429 ?auto_9428 ) ) ( not ( = ?auto_9429 ?auto_9439 ) ) ( not ( = ?auto_9428 ?auto_9439 ) ) ( not ( = ?auto_9434 ?auto_9455 ) ) ( IS-CRATE ?auto_9429 ) ( not ( = ?auto_9458 ?auto_9436 ) ) ( HOIST-AT ?auto_9452 ?auto_9458 ) ( SURFACE-AT ?auto_9429 ?auto_9458 ) ( ON ?auto_9429 ?auto_9441 ) ( CLEAR ?auto_9429 ) ( not ( = ?auto_9426 ?auto_9429 ) ) ( not ( = ?auto_9426 ?auto_9441 ) ) ( not ( = ?auto_9429 ?auto_9441 ) ) ( not ( = ?auto_9434 ?auto_9452 ) ) ( IS-CRATE ?auto_9426 ) ( SURFACE-AT ?auto_9426 ?auto_9444 ) ( ON ?auto_9426 ?auto_9456 ) ( CLEAR ?auto_9426 ) ( not ( = ?auto_9425 ?auto_9426 ) ) ( not ( = ?auto_9425 ?auto_9456 ) ) ( not ( = ?auto_9426 ?auto_9456 ) ) ( IS-CRATE ?auto_9425 ) ( AVAILABLE ?auto_9455 ) ( SURFACE-AT ?auto_9425 ?auto_9448 ) ( ON ?auto_9425 ?auto_9451 ) ( CLEAR ?auto_9425 ) ( not ( = ?auto_9424 ?auto_9425 ) ) ( not ( = ?auto_9424 ?auto_9451 ) ) ( not ( = ?auto_9425 ?auto_9451 ) ) ( IS-CRATE ?auto_9424 ) ( AVAILABLE ?auto_9454 ) ( SURFACE-AT ?auto_9424 ?auto_9444 ) ( ON ?auto_9424 ?auto_9440 ) ( CLEAR ?auto_9424 ) ( not ( = ?auto_9423 ?auto_9424 ) ) ( not ( = ?auto_9423 ?auto_9440 ) ) ( not ( = ?auto_9424 ?auto_9440 ) ) ( IS-CRATE ?auto_9423 ) ( not ( = ?auto_9443 ?auto_9436 ) ) ( HOIST-AT ?auto_9450 ?auto_9443 ) ( AVAILABLE ?auto_9450 ) ( SURFACE-AT ?auto_9423 ?auto_9443 ) ( ON ?auto_9423 ?auto_9449 ) ( CLEAR ?auto_9423 ) ( not ( = ?auto_9422 ?auto_9423 ) ) ( not ( = ?auto_9422 ?auto_9449 ) ) ( not ( = ?auto_9423 ?auto_9449 ) ) ( not ( = ?auto_9434 ?auto_9450 ) ) ( SURFACE-AT ?auto_9421 ?auto_9436 ) ( CLEAR ?auto_9421 ) ( IS-CRATE ?auto_9422 ) ( AVAILABLE ?auto_9434 ) ( AVAILABLE ?auto_9452 ) ( SURFACE-AT ?auto_9422 ?auto_9458 ) ( ON ?auto_9422 ?auto_9445 ) ( CLEAR ?auto_9422 ) ( TRUCK-AT ?auto_9437 ?auto_9436 ) ( not ( = ?auto_9421 ?auto_9422 ) ) ( not ( = ?auto_9421 ?auto_9445 ) ) ( not ( = ?auto_9422 ?auto_9445 ) ) ( not ( = ?auto_9421 ?auto_9423 ) ) ( not ( = ?auto_9421 ?auto_9449 ) ) ( not ( = ?auto_9423 ?auto_9445 ) ) ( not ( = ?auto_9443 ?auto_9458 ) ) ( not ( = ?auto_9450 ?auto_9452 ) ) ( not ( = ?auto_9449 ?auto_9445 ) ) ( not ( = ?auto_9421 ?auto_9424 ) ) ( not ( = ?auto_9421 ?auto_9440 ) ) ( not ( = ?auto_9422 ?auto_9424 ) ) ( not ( = ?auto_9422 ?auto_9440 ) ) ( not ( = ?auto_9424 ?auto_9449 ) ) ( not ( = ?auto_9424 ?auto_9445 ) ) ( not ( = ?auto_9444 ?auto_9443 ) ) ( not ( = ?auto_9444 ?auto_9458 ) ) ( not ( = ?auto_9454 ?auto_9450 ) ) ( not ( = ?auto_9454 ?auto_9452 ) ) ( not ( = ?auto_9440 ?auto_9449 ) ) ( not ( = ?auto_9440 ?auto_9445 ) ) ( not ( = ?auto_9421 ?auto_9425 ) ) ( not ( = ?auto_9421 ?auto_9451 ) ) ( not ( = ?auto_9422 ?auto_9425 ) ) ( not ( = ?auto_9422 ?auto_9451 ) ) ( not ( = ?auto_9423 ?auto_9425 ) ) ( not ( = ?auto_9423 ?auto_9451 ) ) ( not ( = ?auto_9425 ?auto_9440 ) ) ( not ( = ?auto_9425 ?auto_9449 ) ) ( not ( = ?auto_9425 ?auto_9445 ) ) ( not ( = ?auto_9448 ?auto_9444 ) ) ( not ( = ?auto_9448 ?auto_9443 ) ) ( not ( = ?auto_9448 ?auto_9458 ) ) ( not ( = ?auto_9455 ?auto_9454 ) ) ( not ( = ?auto_9455 ?auto_9450 ) ) ( not ( = ?auto_9455 ?auto_9452 ) ) ( not ( = ?auto_9451 ?auto_9440 ) ) ( not ( = ?auto_9451 ?auto_9449 ) ) ( not ( = ?auto_9451 ?auto_9445 ) ) ( not ( = ?auto_9421 ?auto_9426 ) ) ( not ( = ?auto_9421 ?auto_9456 ) ) ( not ( = ?auto_9422 ?auto_9426 ) ) ( not ( = ?auto_9422 ?auto_9456 ) ) ( not ( = ?auto_9423 ?auto_9426 ) ) ( not ( = ?auto_9423 ?auto_9456 ) ) ( not ( = ?auto_9424 ?auto_9426 ) ) ( not ( = ?auto_9424 ?auto_9456 ) ) ( not ( = ?auto_9426 ?auto_9451 ) ) ( not ( = ?auto_9426 ?auto_9440 ) ) ( not ( = ?auto_9426 ?auto_9449 ) ) ( not ( = ?auto_9426 ?auto_9445 ) ) ( not ( = ?auto_9456 ?auto_9451 ) ) ( not ( = ?auto_9456 ?auto_9440 ) ) ( not ( = ?auto_9456 ?auto_9449 ) ) ( not ( = ?auto_9456 ?auto_9445 ) ) ( not ( = ?auto_9421 ?auto_9429 ) ) ( not ( = ?auto_9421 ?auto_9441 ) ) ( not ( = ?auto_9422 ?auto_9429 ) ) ( not ( = ?auto_9422 ?auto_9441 ) ) ( not ( = ?auto_9423 ?auto_9429 ) ) ( not ( = ?auto_9423 ?auto_9441 ) ) ( not ( = ?auto_9424 ?auto_9429 ) ) ( not ( = ?auto_9424 ?auto_9441 ) ) ( not ( = ?auto_9425 ?auto_9429 ) ) ( not ( = ?auto_9425 ?auto_9441 ) ) ( not ( = ?auto_9429 ?auto_9456 ) ) ( not ( = ?auto_9429 ?auto_9451 ) ) ( not ( = ?auto_9429 ?auto_9440 ) ) ( not ( = ?auto_9429 ?auto_9449 ) ) ( not ( = ?auto_9429 ?auto_9445 ) ) ( not ( = ?auto_9441 ?auto_9456 ) ) ( not ( = ?auto_9441 ?auto_9451 ) ) ( not ( = ?auto_9441 ?auto_9440 ) ) ( not ( = ?auto_9441 ?auto_9449 ) ) ( not ( = ?auto_9441 ?auto_9445 ) ) ( not ( = ?auto_9421 ?auto_9428 ) ) ( not ( = ?auto_9421 ?auto_9439 ) ) ( not ( = ?auto_9422 ?auto_9428 ) ) ( not ( = ?auto_9422 ?auto_9439 ) ) ( not ( = ?auto_9423 ?auto_9428 ) ) ( not ( = ?auto_9423 ?auto_9439 ) ) ( not ( = ?auto_9424 ?auto_9428 ) ) ( not ( = ?auto_9424 ?auto_9439 ) ) ( not ( = ?auto_9425 ?auto_9428 ) ) ( not ( = ?auto_9425 ?auto_9439 ) ) ( not ( = ?auto_9426 ?auto_9428 ) ) ( not ( = ?auto_9426 ?auto_9439 ) ) ( not ( = ?auto_9428 ?auto_9441 ) ) ( not ( = ?auto_9428 ?auto_9456 ) ) ( not ( = ?auto_9428 ?auto_9451 ) ) ( not ( = ?auto_9428 ?auto_9440 ) ) ( not ( = ?auto_9428 ?auto_9449 ) ) ( not ( = ?auto_9428 ?auto_9445 ) ) ( not ( = ?auto_9439 ?auto_9441 ) ) ( not ( = ?auto_9439 ?auto_9456 ) ) ( not ( = ?auto_9439 ?auto_9451 ) ) ( not ( = ?auto_9439 ?auto_9440 ) ) ( not ( = ?auto_9439 ?auto_9449 ) ) ( not ( = ?auto_9439 ?auto_9445 ) ) ( not ( = ?auto_9421 ?auto_9427 ) ) ( not ( = ?auto_9421 ?auto_9446 ) ) ( not ( = ?auto_9422 ?auto_9427 ) ) ( not ( = ?auto_9422 ?auto_9446 ) ) ( not ( = ?auto_9423 ?auto_9427 ) ) ( not ( = ?auto_9423 ?auto_9446 ) ) ( not ( = ?auto_9424 ?auto_9427 ) ) ( not ( = ?auto_9424 ?auto_9446 ) ) ( not ( = ?auto_9425 ?auto_9427 ) ) ( not ( = ?auto_9425 ?auto_9446 ) ) ( not ( = ?auto_9426 ?auto_9427 ) ) ( not ( = ?auto_9426 ?auto_9446 ) ) ( not ( = ?auto_9429 ?auto_9427 ) ) ( not ( = ?auto_9429 ?auto_9446 ) ) ( not ( = ?auto_9427 ?auto_9439 ) ) ( not ( = ?auto_9427 ?auto_9441 ) ) ( not ( = ?auto_9427 ?auto_9456 ) ) ( not ( = ?auto_9427 ?auto_9451 ) ) ( not ( = ?auto_9427 ?auto_9440 ) ) ( not ( = ?auto_9427 ?auto_9449 ) ) ( not ( = ?auto_9427 ?auto_9445 ) ) ( not ( = ?auto_9457 ?auto_9448 ) ) ( not ( = ?auto_9457 ?auto_9458 ) ) ( not ( = ?auto_9457 ?auto_9444 ) ) ( not ( = ?auto_9457 ?auto_9443 ) ) ( not ( = ?auto_9447 ?auto_9455 ) ) ( not ( = ?auto_9447 ?auto_9452 ) ) ( not ( = ?auto_9447 ?auto_9454 ) ) ( not ( = ?auto_9447 ?auto_9450 ) ) ( not ( = ?auto_9446 ?auto_9439 ) ) ( not ( = ?auto_9446 ?auto_9441 ) ) ( not ( = ?auto_9446 ?auto_9456 ) ) ( not ( = ?auto_9446 ?auto_9451 ) ) ( not ( = ?auto_9446 ?auto_9440 ) ) ( not ( = ?auto_9446 ?auto_9449 ) ) ( not ( = ?auto_9446 ?auto_9445 ) ) ( not ( = ?auto_9421 ?auto_9430 ) ) ( not ( = ?auto_9421 ?auto_9442 ) ) ( not ( = ?auto_9422 ?auto_9430 ) ) ( not ( = ?auto_9422 ?auto_9442 ) ) ( not ( = ?auto_9423 ?auto_9430 ) ) ( not ( = ?auto_9423 ?auto_9442 ) ) ( not ( = ?auto_9424 ?auto_9430 ) ) ( not ( = ?auto_9424 ?auto_9442 ) ) ( not ( = ?auto_9425 ?auto_9430 ) ) ( not ( = ?auto_9425 ?auto_9442 ) ) ( not ( = ?auto_9426 ?auto_9430 ) ) ( not ( = ?auto_9426 ?auto_9442 ) ) ( not ( = ?auto_9429 ?auto_9430 ) ) ( not ( = ?auto_9429 ?auto_9442 ) ) ( not ( = ?auto_9428 ?auto_9430 ) ) ( not ( = ?auto_9428 ?auto_9442 ) ) ( not ( = ?auto_9430 ?auto_9446 ) ) ( not ( = ?auto_9430 ?auto_9439 ) ) ( not ( = ?auto_9430 ?auto_9441 ) ) ( not ( = ?auto_9430 ?auto_9456 ) ) ( not ( = ?auto_9430 ?auto_9451 ) ) ( not ( = ?auto_9430 ?auto_9440 ) ) ( not ( = ?auto_9430 ?auto_9449 ) ) ( not ( = ?auto_9430 ?auto_9445 ) ) ( not ( = ?auto_9435 ?auto_9457 ) ) ( not ( = ?auto_9435 ?auto_9448 ) ) ( not ( = ?auto_9435 ?auto_9458 ) ) ( not ( = ?auto_9435 ?auto_9444 ) ) ( not ( = ?auto_9435 ?auto_9443 ) ) ( not ( = ?auto_9438 ?auto_9447 ) ) ( not ( = ?auto_9438 ?auto_9455 ) ) ( not ( = ?auto_9438 ?auto_9452 ) ) ( not ( = ?auto_9438 ?auto_9454 ) ) ( not ( = ?auto_9438 ?auto_9450 ) ) ( not ( = ?auto_9442 ?auto_9446 ) ) ( not ( = ?auto_9442 ?auto_9439 ) ) ( not ( = ?auto_9442 ?auto_9441 ) ) ( not ( = ?auto_9442 ?auto_9456 ) ) ( not ( = ?auto_9442 ?auto_9451 ) ) ( not ( = ?auto_9442 ?auto_9440 ) ) ( not ( = ?auto_9442 ?auto_9449 ) ) ( not ( = ?auto_9442 ?auto_9445 ) ) ( not ( = ?auto_9421 ?auto_9432 ) ) ( not ( = ?auto_9421 ?auto_9453 ) ) ( not ( = ?auto_9422 ?auto_9432 ) ) ( not ( = ?auto_9422 ?auto_9453 ) ) ( not ( = ?auto_9423 ?auto_9432 ) ) ( not ( = ?auto_9423 ?auto_9453 ) ) ( not ( = ?auto_9424 ?auto_9432 ) ) ( not ( = ?auto_9424 ?auto_9453 ) ) ( not ( = ?auto_9425 ?auto_9432 ) ) ( not ( = ?auto_9425 ?auto_9453 ) ) ( not ( = ?auto_9426 ?auto_9432 ) ) ( not ( = ?auto_9426 ?auto_9453 ) ) ( not ( = ?auto_9429 ?auto_9432 ) ) ( not ( = ?auto_9429 ?auto_9453 ) ) ( not ( = ?auto_9428 ?auto_9432 ) ) ( not ( = ?auto_9428 ?auto_9453 ) ) ( not ( = ?auto_9427 ?auto_9432 ) ) ( not ( = ?auto_9427 ?auto_9453 ) ) ( not ( = ?auto_9432 ?auto_9442 ) ) ( not ( = ?auto_9432 ?auto_9446 ) ) ( not ( = ?auto_9432 ?auto_9439 ) ) ( not ( = ?auto_9432 ?auto_9441 ) ) ( not ( = ?auto_9432 ?auto_9456 ) ) ( not ( = ?auto_9432 ?auto_9451 ) ) ( not ( = ?auto_9432 ?auto_9440 ) ) ( not ( = ?auto_9432 ?auto_9449 ) ) ( not ( = ?auto_9432 ?auto_9445 ) ) ( not ( = ?auto_9453 ?auto_9442 ) ) ( not ( = ?auto_9453 ?auto_9446 ) ) ( not ( = ?auto_9453 ?auto_9439 ) ) ( not ( = ?auto_9453 ?auto_9441 ) ) ( not ( = ?auto_9453 ?auto_9456 ) ) ( not ( = ?auto_9453 ?auto_9451 ) ) ( not ( = ?auto_9453 ?auto_9440 ) ) ( not ( = ?auto_9453 ?auto_9449 ) ) ( not ( = ?auto_9453 ?auto_9445 ) ) ( not ( = ?auto_9421 ?auto_9431 ) ) ( not ( = ?auto_9421 ?auto_9433 ) ) ( not ( = ?auto_9422 ?auto_9431 ) ) ( not ( = ?auto_9422 ?auto_9433 ) ) ( not ( = ?auto_9423 ?auto_9431 ) ) ( not ( = ?auto_9423 ?auto_9433 ) ) ( not ( = ?auto_9424 ?auto_9431 ) ) ( not ( = ?auto_9424 ?auto_9433 ) ) ( not ( = ?auto_9425 ?auto_9431 ) ) ( not ( = ?auto_9425 ?auto_9433 ) ) ( not ( = ?auto_9426 ?auto_9431 ) ) ( not ( = ?auto_9426 ?auto_9433 ) ) ( not ( = ?auto_9429 ?auto_9431 ) ) ( not ( = ?auto_9429 ?auto_9433 ) ) ( not ( = ?auto_9428 ?auto_9431 ) ) ( not ( = ?auto_9428 ?auto_9433 ) ) ( not ( = ?auto_9427 ?auto_9431 ) ) ( not ( = ?auto_9427 ?auto_9433 ) ) ( not ( = ?auto_9430 ?auto_9431 ) ) ( not ( = ?auto_9430 ?auto_9433 ) ) ( not ( = ?auto_9431 ?auto_9453 ) ) ( not ( = ?auto_9431 ?auto_9442 ) ) ( not ( = ?auto_9431 ?auto_9446 ) ) ( not ( = ?auto_9431 ?auto_9439 ) ) ( not ( = ?auto_9431 ?auto_9441 ) ) ( not ( = ?auto_9431 ?auto_9456 ) ) ( not ( = ?auto_9431 ?auto_9451 ) ) ( not ( = ?auto_9431 ?auto_9440 ) ) ( not ( = ?auto_9431 ?auto_9449 ) ) ( not ( = ?auto_9431 ?auto_9445 ) ) ( not ( = ?auto_9433 ?auto_9453 ) ) ( not ( = ?auto_9433 ?auto_9442 ) ) ( not ( = ?auto_9433 ?auto_9446 ) ) ( not ( = ?auto_9433 ?auto_9439 ) ) ( not ( = ?auto_9433 ?auto_9441 ) ) ( not ( = ?auto_9433 ?auto_9456 ) ) ( not ( = ?auto_9433 ?auto_9451 ) ) ( not ( = ?auto_9433 ?auto_9440 ) ) ( not ( = ?auto_9433 ?auto_9449 ) ) ( not ( = ?auto_9433 ?auto_9445 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_9421 ?auto_9422 ?auto_9423 ?auto_9424 ?auto_9425 ?auto_9426 ?auto_9429 ?auto_9428 ?auto_9427 ?auto_9430 ?auto_9432 )
      ( MAKE-1CRATE ?auto_9432 ?auto_9431 )
      ( MAKE-11CRATE-VERIFY ?auto_9421 ?auto_9422 ?auto_9423 ?auto_9424 ?auto_9425 ?auto_9426 ?auto_9429 ?auto_9428 ?auto_9427 ?auto_9430 ?auto_9432 ?auto_9431 ) )
  )

)

