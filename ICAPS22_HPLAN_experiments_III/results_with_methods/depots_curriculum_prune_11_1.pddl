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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9039 - SURFACE
      ?auto_9040 - SURFACE
      ?auto_9041 - SURFACE
    )
    :vars
    (
      ?auto_9042 - HOIST
      ?auto_9045 - PLACE
      ?auto_9046 - PLACE
      ?auto_9047 - HOIST
      ?auto_9044 - SURFACE
      ?auto_9049 - PLACE
      ?auto_9048 - HOIST
      ?auto_9050 - SURFACE
      ?auto_9043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9042 ?auto_9045 ) ( IS-CRATE ?auto_9041 ) ( not ( = ?auto_9046 ?auto_9045 ) ) ( HOIST-AT ?auto_9047 ?auto_9046 ) ( AVAILABLE ?auto_9047 ) ( SURFACE-AT ?auto_9041 ?auto_9046 ) ( ON ?auto_9041 ?auto_9044 ) ( CLEAR ?auto_9041 ) ( not ( = ?auto_9040 ?auto_9041 ) ) ( not ( = ?auto_9040 ?auto_9044 ) ) ( not ( = ?auto_9041 ?auto_9044 ) ) ( not ( = ?auto_9042 ?auto_9047 ) ) ( SURFACE-AT ?auto_9039 ?auto_9045 ) ( CLEAR ?auto_9039 ) ( IS-CRATE ?auto_9040 ) ( AVAILABLE ?auto_9042 ) ( not ( = ?auto_9049 ?auto_9045 ) ) ( HOIST-AT ?auto_9048 ?auto_9049 ) ( AVAILABLE ?auto_9048 ) ( SURFACE-AT ?auto_9040 ?auto_9049 ) ( ON ?auto_9040 ?auto_9050 ) ( CLEAR ?auto_9040 ) ( TRUCK-AT ?auto_9043 ?auto_9045 ) ( not ( = ?auto_9039 ?auto_9040 ) ) ( not ( = ?auto_9039 ?auto_9050 ) ) ( not ( = ?auto_9040 ?auto_9050 ) ) ( not ( = ?auto_9042 ?auto_9048 ) ) ( not ( = ?auto_9039 ?auto_9041 ) ) ( not ( = ?auto_9039 ?auto_9044 ) ) ( not ( = ?auto_9041 ?auto_9050 ) ) ( not ( = ?auto_9046 ?auto_9049 ) ) ( not ( = ?auto_9047 ?auto_9048 ) ) ( not ( = ?auto_9044 ?auto_9050 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9039 ?auto_9040 )
      ( MAKE-1CRATE ?auto_9040 ?auto_9041 )
      ( MAKE-2CRATE-VERIFY ?auto_9039 ?auto_9040 ?auto_9041 ) )
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
      ?auto_9069 - HOIST
      ?auto_9074 - PLACE
      ?auto_9070 - PLACE
      ?auto_9071 - HOIST
      ?auto_9073 - SURFACE
      ?auto_9077 - PLACE
      ?auto_9075 - HOIST
      ?auto_9076 - SURFACE
      ?auto_9078 - PLACE
      ?auto_9080 - HOIST
      ?auto_9079 - SURFACE
      ?auto_9072 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9069 ?auto_9074 ) ( IS-CRATE ?auto_9068 ) ( not ( = ?auto_9070 ?auto_9074 ) ) ( HOIST-AT ?auto_9071 ?auto_9070 ) ( AVAILABLE ?auto_9071 ) ( SURFACE-AT ?auto_9068 ?auto_9070 ) ( ON ?auto_9068 ?auto_9073 ) ( CLEAR ?auto_9068 ) ( not ( = ?auto_9067 ?auto_9068 ) ) ( not ( = ?auto_9067 ?auto_9073 ) ) ( not ( = ?auto_9068 ?auto_9073 ) ) ( not ( = ?auto_9069 ?auto_9071 ) ) ( IS-CRATE ?auto_9067 ) ( not ( = ?auto_9077 ?auto_9074 ) ) ( HOIST-AT ?auto_9075 ?auto_9077 ) ( AVAILABLE ?auto_9075 ) ( SURFACE-AT ?auto_9067 ?auto_9077 ) ( ON ?auto_9067 ?auto_9076 ) ( CLEAR ?auto_9067 ) ( not ( = ?auto_9066 ?auto_9067 ) ) ( not ( = ?auto_9066 ?auto_9076 ) ) ( not ( = ?auto_9067 ?auto_9076 ) ) ( not ( = ?auto_9069 ?auto_9075 ) ) ( SURFACE-AT ?auto_9065 ?auto_9074 ) ( CLEAR ?auto_9065 ) ( IS-CRATE ?auto_9066 ) ( AVAILABLE ?auto_9069 ) ( not ( = ?auto_9078 ?auto_9074 ) ) ( HOIST-AT ?auto_9080 ?auto_9078 ) ( AVAILABLE ?auto_9080 ) ( SURFACE-AT ?auto_9066 ?auto_9078 ) ( ON ?auto_9066 ?auto_9079 ) ( CLEAR ?auto_9066 ) ( TRUCK-AT ?auto_9072 ?auto_9074 ) ( not ( = ?auto_9065 ?auto_9066 ) ) ( not ( = ?auto_9065 ?auto_9079 ) ) ( not ( = ?auto_9066 ?auto_9079 ) ) ( not ( = ?auto_9069 ?auto_9080 ) ) ( not ( = ?auto_9065 ?auto_9067 ) ) ( not ( = ?auto_9065 ?auto_9076 ) ) ( not ( = ?auto_9067 ?auto_9079 ) ) ( not ( = ?auto_9077 ?auto_9078 ) ) ( not ( = ?auto_9075 ?auto_9080 ) ) ( not ( = ?auto_9076 ?auto_9079 ) ) ( not ( = ?auto_9065 ?auto_9068 ) ) ( not ( = ?auto_9065 ?auto_9073 ) ) ( not ( = ?auto_9066 ?auto_9068 ) ) ( not ( = ?auto_9066 ?auto_9073 ) ) ( not ( = ?auto_9068 ?auto_9076 ) ) ( not ( = ?auto_9068 ?auto_9079 ) ) ( not ( = ?auto_9070 ?auto_9077 ) ) ( not ( = ?auto_9070 ?auto_9078 ) ) ( not ( = ?auto_9071 ?auto_9075 ) ) ( not ( = ?auto_9071 ?auto_9080 ) ) ( not ( = ?auto_9073 ?auto_9076 ) ) ( not ( = ?auto_9073 ?auto_9079 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9065 ?auto_9066 ?auto_9067 )
      ( MAKE-1CRATE ?auto_9067 ?auto_9068 )
      ( MAKE-3CRATE-VERIFY ?auto_9065 ?auto_9066 ?auto_9067 ?auto_9068 ) )
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
      ?auto_9102 - PLACE
      ?auto_9103 - PLACE
      ?auto_9106 - HOIST
      ?auto_9105 - SURFACE
      ?auto_9110 - PLACE
      ?auto_9111 - HOIST
      ?auto_9112 - SURFACE
      ?auto_9115 - PLACE
      ?auto_9109 - HOIST
      ?auto_9113 - SURFACE
      ?auto_9108 - PLACE
      ?auto_9114 - HOIST
      ?auto_9107 - SURFACE
      ?auto_9104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9101 ?auto_9102 ) ( IS-CRATE ?auto_9100 ) ( not ( = ?auto_9103 ?auto_9102 ) ) ( HOIST-AT ?auto_9106 ?auto_9103 ) ( AVAILABLE ?auto_9106 ) ( SURFACE-AT ?auto_9100 ?auto_9103 ) ( ON ?auto_9100 ?auto_9105 ) ( CLEAR ?auto_9100 ) ( not ( = ?auto_9099 ?auto_9100 ) ) ( not ( = ?auto_9099 ?auto_9105 ) ) ( not ( = ?auto_9100 ?auto_9105 ) ) ( not ( = ?auto_9101 ?auto_9106 ) ) ( IS-CRATE ?auto_9099 ) ( not ( = ?auto_9110 ?auto_9102 ) ) ( HOIST-AT ?auto_9111 ?auto_9110 ) ( AVAILABLE ?auto_9111 ) ( SURFACE-AT ?auto_9099 ?auto_9110 ) ( ON ?auto_9099 ?auto_9112 ) ( CLEAR ?auto_9099 ) ( not ( = ?auto_9098 ?auto_9099 ) ) ( not ( = ?auto_9098 ?auto_9112 ) ) ( not ( = ?auto_9099 ?auto_9112 ) ) ( not ( = ?auto_9101 ?auto_9111 ) ) ( IS-CRATE ?auto_9098 ) ( not ( = ?auto_9115 ?auto_9102 ) ) ( HOIST-AT ?auto_9109 ?auto_9115 ) ( AVAILABLE ?auto_9109 ) ( SURFACE-AT ?auto_9098 ?auto_9115 ) ( ON ?auto_9098 ?auto_9113 ) ( CLEAR ?auto_9098 ) ( not ( = ?auto_9097 ?auto_9098 ) ) ( not ( = ?auto_9097 ?auto_9113 ) ) ( not ( = ?auto_9098 ?auto_9113 ) ) ( not ( = ?auto_9101 ?auto_9109 ) ) ( SURFACE-AT ?auto_9096 ?auto_9102 ) ( CLEAR ?auto_9096 ) ( IS-CRATE ?auto_9097 ) ( AVAILABLE ?auto_9101 ) ( not ( = ?auto_9108 ?auto_9102 ) ) ( HOIST-AT ?auto_9114 ?auto_9108 ) ( AVAILABLE ?auto_9114 ) ( SURFACE-AT ?auto_9097 ?auto_9108 ) ( ON ?auto_9097 ?auto_9107 ) ( CLEAR ?auto_9097 ) ( TRUCK-AT ?auto_9104 ?auto_9102 ) ( not ( = ?auto_9096 ?auto_9097 ) ) ( not ( = ?auto_9096 ?auto_9107 ) ) ( not ( = ?auto_9097 ?auto_9107 ) ) ( not ( = ?auto_9101 ?auto_9114 ) ) ( not ( = ?auto_9096 ?auto_9098 ) ) ( not ( = ?auto_9096 ?auto_9113 ) ) ( not ( = ?auto_9098 ?auto_9107 ) ) ( not ( = ?auto_9115 ?auto_9108 ) ) ( not ( = ?auto_9109 ?auto_9114 ) ) ( not ( = ?auto_9113 ?auto_9107 ) ) ( not ( = ?auto_9096 ?auto_9099 ) ) ( not ( = ?auto_9096 ?auto_9112 ) ) ( not ( = ?auto_9097 ?auto_9099 ) ) ( not ( = ?auto_9097 ?auto_9112 ) ) ( not ( = ?auto_9099 ?auto_9113 ) ) ( not ( = ?auto_9099 ?auto_9107 ) ) ( not ( = ?auto_9110 ?auto_9115 ) ) ( not ( = ?auto_9110 ?auto_9108 ) ) ( not ( = ?auto_9111 ?auto_9109 ) ) ( not ( = ?auto_9111 ?auto_9114 ) ) ( not ( = ?auto_9112 ?auto_9113 ) ) ( not ( = ?auto_9112 ?auto_9107 ) ) ( not ( = ?auto_9096 ?auto_9100 ) ) ( not ( = ?auto_9096 ?auto_9105 ) ) ( not ( = ?auto_9097 ?auto_9100 ) ) ( not ( = ?auto_9097 ?auto_9105 ) ) ( not ( = ?auto_9098 ?auto_9100 ) ) ( not ( = ?auto_9098 ?auto_9105 ) ) ( not ( = ?auto_9100 ?auto_9112 ) ) ( not ( = ?auto_9100 ?auto_9113 ) ) ( not ( = ?auto_9100 ?auto_9107 ) ) ( not ( = ?auto_9103 ?auto_9110 ) ) ( not ( = ?auto_9103 ?auto_9115 ) ) ( not ( = ?auto_9103 ?auto_9108 ) ) ( not ( = ?auto_9106 ?auto_9111 ) ) ( not ( = ?auto_9106 ?auto_9109 ) ) ( not ( = ?auto_9106 ?auto_9114 ) ) ( not ( = ?auto_9105 ?auto_9112 ) ) ( not ( = ?auto_9105 ?auto_9113 ) ) ( not ( = ?auto_9105 ?auto_9107 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_9096 ?auto_9097 ?auto_9098 ?auto_9099 )
      ( MAKE-1CRATE ?auto_9099 ?auto_9100 )
      ( MAKE-4CRATE-VERIFY ?auto_9096 ?auto_9097 ?auto_9098 ?auto_9099 ?auto_9100 ) )
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
      ?auto_9141 - HOIST
      ?auto_9140 - PLACE
      ?auto_9138 - PLACE
      ?auto_9143 - HOIST
      ?auto_9139 - SURFACE
      ?auto_9149 - PLACE
      ?auto_9147 - HOIST
      ?auto_9146 - SURFACE
      ?auto_9144 - SURFACE
      ?auto_9151 - PLACE
      ?auto_9150 - HOIST
      ?auto_9145 - SURFACE
      ?auto_9153 - PLACE
      ?auto_9148 - HOIST
      ?auto_9152 - SURFACE
      ?auto_9142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9141 ?auto_9140 ) ( IS-CRATE ?auto_9137 ) ( not ( = ?auto_9138 ?auto_9140 ) ) ( HOIST-AT ?auto_9143 ?auto_9138 ) ( SURFACE-AT ?auto_9137 ?auto_9138 ) ( ON ?auto_9137 ?auto_9139 ) ( CLEAR ?auto_9137 ) ( not ( = ?auto_9136 ?auto_9137 ) ) ( not ( = ?auto_9136 ?auto_9139 ) ) ( not ( = ?auto_9137 ?auto_9139 ) ) ( not ( = ?auto_9141 ?auto_9143 ) ) ( IS-CRATE ?auto_9136 ) ( not ( = ?auto_9149 ?auto_9140 ) ) ( HOIST-AT ?auto_9147 ?auto_9149 ) ( AVAILABLE ?auto_9147 ) ( SURFACE-AT ?auto_9136 ?auto_9149 ) ( ON ?auto_9136 ?auto_9146 ) ( CLEAR ?auto_9136 ) ( not ( = ?auto_9135 ?auto_9136 ) ) ( not ( = ?auto_9135 ?auto_9146 ) ) ( not ( = ?auto_9136 ?auto_9146 ) ) ( not ( = ?auto_9141 ?auto_9147 ) ) ( IS-CRATE ?auto_9135 ) ( AVAILABLE ?auto_9143 ) ( SURFACE-AT ?auto_9135 ?auto_9138 ) ( ON ?auto_9135 ?auto_9144 ) ( CLEAR ?auto_9135 ) ( not ( = ?auto_9134 ?auto_9135 ) ) ( not ( = ?auto_9134 ?auto_9144 ) ) ( not ( = ?auto_9135 ?auto_9144 ) ) ( IS-CRATE ?auto_9134 ) ( not ( = ?auto_9151 ?auto_9140 ) ) ( HOIST-AT ?auto_9150 ?auto_9151 ) ( AVAILABLE ?auto_9150 ) ( SURFACE-AT ?auto_9134 ?auto_9151 ) ( ON ?auto_9134 ?auto_9145 ) ( CLEAR ?auto_9134 ) ( not ( = ?auto_9133 ?auto_9134 ) ) ( not ( = ?auto_9133 ?auto_9145 ) ) ( not ( = ?auto_9134 ?auto_9145 ) ) ( not ( = ?auto_9141 ?auto_9150 ) ) ( SURFACE-AT ?auto_9132 ?auto_9140 ) ( CLEAR ?auto_9132 ) ( IS-CRATE ?auto_9133 ) ( AVAILABLE ?auto_9141 ) ( not ( = ?auto_9153 ?auto_9140 ) ) ( HOIST-AT ?auto_9148 ?auto_9153 ) ( AVAILABLE ?auto_9148 ) ( SURFACE-AT ?auto_9133 ?auto_9153 ) ( ON ?auto_9133 ?auto_9152 ) ( CLEAR ?auto_9133 ) ( TRUCK-AT ?auto_9142 ?auto_9140 ) ( not ( = ?auto_9132 ?auto_9133 ) ) ( not ( = ?auto_9132 ?auto_9152 ) ) ( not ( = ?auto_9133 ?auto_9152 ) ) ( not ( = ?auto_9141 ?auto_9148 ) ) ( not ( = ?auto_9132 ?auto_9134 ) ) ( not ( = ?auto_9132 ?auto_9145 ) ) ( not ( = ?auto_9134 ?auto_9152 ) ) ( not ( = ?auto_9151 ?auto_9153 ) ) ( not ( = ?auto_9150 ?auto_9148 ) ) ( not ( = ?auto_9145 ?auto_9152 ) ) ( not ( = ?auto_9132 ?auto_9135 ) ) ( not ( = ?auto_9132 ?auto_9144 ) ) ( not ( = ?auto_9133 ?auto_9135 ) ) ( not ( = ?auto_9133 ?auto_9144 ) ) ( not ( = ?auto_9135 ?auto_9145 ) ) ( not ( = ?auto_9135 ?auto_9152 ) ) ( not ( = ?auto_9138 ?auto_9151 ) ) ( not ( = ?auto_9138 ?auto_9153 ) ) ( not ( = ?auto_9143 ?auto_9150 ) ) ( not ( = ?auto_9143 ?auto_9148 ) ) ( not ( = ?auto_9144 ?auto_9145 ) ) ( not ( = ?auto_9144 ?auto_9152 ) ) ( not ( = ?auto_9132 ?auto_9136 ) ) ( not ( = ?auto_9132 ?auto_9146 ) ) ( not ( = ?auto_9133 ?auto_9136 ) ) ( not ( = ?auto_9133 ?auto_9146 ) ) ( not ( = ?auto_9134 ?auto_9136 ) ) ( not ( = ?auto_9134 ?auto_9146 ) ) ( not ( = ?auto_9136 ?auto_9144 ) ) ( not ( = ?auto_9136 ?auto_9145 ) ) ( not ( = ?auto_9136 ?auto_9152 ) ) ( not ( = ?auto_9149 ?auto_9138 ) ) ( not ( = ?auto_9149 ?auto_9151 ) ) ( not ( = ?auto_9149 ?auto_9153 ) ) ( not ( = ?auto_9147 ?auto_9143 ) ) ( not ( = ?auto_9147 ?auto_9150 ) ) ( not ( = ?auto_9147 ?auto_9148 ) ) ( not ( = ?auto_9146 ?auto_9144 ) ) ( not ( = ?auto_9146 ?auto_9145 ) ) ( not ( = ?auto_9146 ?auto_9152 ) ) ( not ( = ?auto_9132 ?auto_9137 ) ) ( not ( = ?auto_9132 ?auto_9139 ) ) ( not ( = ?auto_9133 ?auto_9137 ) ) ( not ( = ?auto_9133 ?auto_9139 ) ) ( not ( = ?auto_9134 ?auto_9137 ) ) ( not ( = ?auto_9134 ?auto_9139 ) ) ( not ( = ?auto_9135 ?auto_9137 ) ) ( not ( = ?auto_9135 ?auto_9139 ) ) ( not ( = ?auto_9137 ?auto_9146 ) ) ( not ( = ?auto_9137 ?auto_9144 ) ) ( not ( = ?auto_9137 ?auto_9145 ) ) ( not ( = ?auto_9137 ?auto_9152 ) ) ( not ( = ?auto_9139 ?auto_9146 ) ) ( not ( = ?auto_9139 ?auto_9144 ) ) ( not ( = ?auto_9139 ?auto_9145 ) ) ( not ( = ?auto_9139 ?auto_9152 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_9132 ?auto_9133 ?auto_9134 ?auto_9135 ?auto_9136 )
      ( MAKE-1CRATE ?auto_9136 ?auto_9137 )
      ( MAKE-5CRATE-VERIFY ?auto_9132 ?auto_9133 ?auto_9134 ?auto_9135 ?auto_9136 ?auto_9137 ) )
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
      ?auto_9181 - HOIST
      ?auto_9183 - PLACE
      ?auto_9179 - PLACE
      ?auto_9180 - HOIST
      ?auto_9178 - SURFACE
      ?auto_9184 - PLACE
      ?auto_9194 - HOIST
      ?auto_9192 - SURFACE
      ?auto_9188 - PLACE
      ?auto_9186 - HOIST
      ?auto_9190 - SURFACE
      ?auto_9185 - SURFACE
      ?auto_9189 - PLACE
      ?auto_9187 - HOIST
      ?auto_9191 - SURFACE
      ?auto_9193 - SURFACE
      ?auto_9182 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9181 ?auto_9183 ) ( IS-CRATE ?auto_9177 ) ( not ( = ?auto_9179 ?auto_9183 ) ) ( HOIST-AT ?auto_9180 ?auto_9179 ) ( SURFACE-AT ?auto_9177 ?auto_9179 ) ( ON ?auto_9177 ?auto_9178 ) ( CLEAR ?auto_9177 ) ( not ( = ?auto_9176 ?auto_9177 ) ) ( not ( = ?auto_9176 ?auto_9178 ) ) ( not ( = ?auto_9177 ?auto_9178 ) ) ( not ( = ?auto_9181 ?auto_9180 ) ) ( IS-CRATE ?auto_9176 ) ( not ( = ?auto_9184 ?auto_9183 ) ) ( HOIST-AT ?auto_9194 ?auto_9184 ) ( SURFACE-AT ?auto_9176 ?auto_9184 ) ( ON ?auto_9176 ?auto_9192 ) ( CLEAR ?auto_9176 ) ( not ( = ?auto_9175 ?auto_9176 ) ) ( not ( = ?auto_9175 ?auto_9192 ) ) ( not ( = ?auto_9176 ?auto_9192 ) ) ( not ( = ?auto_9181 ?auto_9194 ) ) ( IS-CRATE ?auto_9175 ) ( not ( = ?auto_9188 ?auto_9183 ) ) ( HOIST-AT ?auto_9186 ?auto_9188 ) ( AVAILABLE ?auto_9186 ) ( SURFACE-AT ?auto_9175 ?auto_9188 ) ( ON ?auto_9175 ?auto_9190 ) ( CLEAR ?auto_9175 ) ( not ( = ?auto_9174 ?auto_9175 ) ) ( not ( = ?auto_9174 ?auto_9190 ) ) ( not ( = ?auto_9175 ?auto_9190 ) ) ( not ( = ?auto_9181 ?auto_9186 ) ) ( IS-CRATE ?auto_9174 ) ( AVAILABLE ?auto_9194 ) ( SURFACE-AT ?auto_9174 ?auto_9184 ) ( ON ?auto_9174 ?auto_9185 ) ( CLEAR ?auto_9174 ) ( not ( = ?auto_9173 ?auto_9174 ) ) ( not ( = ?auto_9173 ?auto_9185 ) ) ( not ( = ?auto_9174 ?auto_9185 ) ) ( IS-CRATE ?auto_9173 ) ( not ( = ?auto_9189 ?auto_9183 ) ) ( HOIST-AT ?auto_9187 ?auto_9189 ) ( AVAILABLE ?auto_9187 ) ( SURFACE-AT ?auto_9173 ?auto_9189 ) ( ON ?auto_9173 ?auto_9191 ) ( CLEAR ?auto_9173 ) ( not ( = ?auto_9172 ?auto_9173 ) ) ( not ( = ?auto_9172 ?auto_9191 ) ) ( not ( = ?auto_9173 ?auto_9191 ) ) ( not ( = ?auto_9181 ?auto_9187 ) ) ( SURFACE-AT ?auto_9171 ?auto_9183 ) ( CLEAR ?auto_9171 ) ( IS-CRATE ?auto_9172 ) ( AVAILABLE ?auto_9181 ) ( AVAILABLE ?auto_9180 ) ( SURFACE-AT ?auto_9172 ?auto_9179 ) ( ON ?auto_9172 ?auto_9193 ) ( CLEAR ?auto_9172 ) ( TRUCK-AT ?auto_9182 ?auto_9183 ) ( not ( = ?auto_9171 ?auto_9172 ) ) ( not ( = ?auto_9171 ?auto_9193 ) ) ( not ( = ?auto_9172 ?auto_9193 ) ) ( not ( = ?auto_9171 ?auto_9173 ) ) ( not ( = ?auto_9171 ?auto_9191 ) ) ( not ( = ?auto_9173 ?auto_9193 ) ) ( not ( = ?auto_9189 ?auto_9179 ) ) ( not ( = ?auto_9187 ?auto_9180 ) ) ( not ( = ?auto_9191 ?auto_9193 ) ) ( not ( = ?auto_9171 ?auto_9174 ) ) ( not ( = ?auto_9171 ?auto_9185 ) ) ( not ( = ?auto_9172 ?auto_9174 ) ) ( not ( = ?auto_9172 ?auto_9185 ) ) ( not ( = ?auto_9174 ?auto_9191 ) ) ( not ( = ?auto_9174 ?auto_9193 ) ) ( not ( = ?auto_9184 ?auto_9189 ) ) ( not ( = ?auto_9184 ?auto_9179 ) ) ( not ( = ?auto_9194 ?auto_9187 ) ) ( not ( = ?auto_9194 ?auto_9180 ) ) ( not ( = ?auto_9185 ?auto_9191 ) ) ( not ( = ?auto_9185 ?auto_9193 ) ) ( not ( = ?auto_9171 ?auto_9175 ) ) ( not ( = ?auto_9171 ?auto_9190 ) ) ( not ( = ?auto_9172 ?auto_9175 ) ) ( not ( = ?auto_9172 ?auto_9190 ) ) ( not ( = ?auto_9173 ?auto_9175 ) ) ( not ( = ?auto_9173 ?auto_9190 ) ) ( not ( = ?auto_9175 ?auto_9185 ) ) ( not ( = ?auto_9175 ?auto_9191 ) ) ( not ( = ?auto_9175 ?auto_9193 ) ) ( not ( = ?auto_9188 ?auto_9184 ) ) ( not ( = ?auto_9188 ?auto_9189 ) ) ( not ( = ?auto_9188 ?auto_9179 ) ) ( not ( = ?auto_9186 ?auto_9194 ) ) ( not ( = ?auto_9186 ?auto_9187 ) ) ( not ( = ?auto_9186 ?auto_9180 ) ) ( not ( = ?auto_9190 ?auto_9185 ) ) ( not ( = ?auto_9190 ?auto_9191 ) ) ( not ( = ?auto_9190 ?auto_9193 ) ) ( not ( = ?auto_9171 ?auto_9176 ) ) ( not ( = ?auto_9171 ?auto_9192 ) ) ( not ( = ?auto_9172 ?auto_9176 ) ) ( not ( = ?auto_9172 ?auto_9192 ) ) ( not ( = ?auto_9173 ?auto_9176 ) ) ( not ( = ?auto_9173 ?auto_9192 ) ) ( not ( = ?auto_9174 ?auto_9176 ) ) ( not ( = ?auto_9174 ?auto_9192 ) ) ( not ( = ?auto_9176 ?auto_9190 ) ) ( not ( = ?auto_9176 ?auto_9185 ) ) ( not ( = ?auto_9176 ?auto_9191 ) ) ( not ( = ?auto_9176 ?auto_9193 ) ) ( not ( = ?auto_9192 ?auto_9190 ) ) ( not ( = ?auto_9192 ?auto_9185 ) ) ( not ( = ?auto_9192 ?auto_9191 ) ) ( not ( = ?auto_9192 ?auto_9193 ) ) ( not ( = ?auto_9171 ?auto_9177 ) ) ( not ( = ?auto_9171 ?auto_9178 ) ) ( not ( = ?auto_9172 ?auto_9177 ) ) ( not ( = ?auto_9172 ?auto_9178 ) ) ( not ( = ?auto_9173 ?auto_9177 ) ) ( not ( = ?auto_9173 ?auto_9178 ) ) ( not ( = ?auto_9174 ?auto_9177 ) ) ( not ( = ?auto_9174 ?auto_9178 ) ) ( not ( = ?auto_9175 ?auto_9177 ) ) ( not ( = ?auto_9175 ?auto_9178 ) ) ( not ( = ?auto_9177 ?auto_9192 ) ) ( not ( = ?auto_9177 ?auto_9190 ) ) ( not ( = ?auto_9177 ?auto_9185 ) ) ( not ( = ?auto_9177 ?auto_9191 ) ) ( not ( = ?auto_9177 ?auto_9193 ) ) ( not ( = ?auto_9178 ?auto_9192 ) ) ( not ( = ?auto_9178 ?auto_9190 ) ) ( not ( = ?auto_9178 ?auto_9185 ) ) ( not ( = ?auto_9178 ?auto_9191 ) ) ( not ( = ?auto_9178 ?auto_9193 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_9171 ?auto_9172 ?auto_9173 ?auto_9174 ?auto_9175 ?auto_9176 )
      ( MAKE-1CRATE ?auto_9176 ?auto_9177 )
      ( MAKE-6CRATE-VERIFY ?auto_9171 ?auto_9172 ?auto_9173 ?auto_9174 ?auto_9175 ?auto_9176 ?auto_9177 ) )
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
      ?auto_9219 - SURFACE
      ?auto_9220 - SURFACE
    )
    :vars
    (
      ?auto_9226 - HOIST
      ?auto_9224 - PLACE
      ?auto_9225 - PLACE
      ?auto_9221 - HOIST
      ?auto_9222 - SURFACE
      ?auto_9234 - PLACE
      ?auto_9233 - HOIST
      ?auto_9227 - SURFACE
      ?auto_9232 - PLACE
      ?auto_9236 - HOIST
      ?auto_9235 - SURFACE
      ?auto_9229 - SURFACE
      ?auto_9237 - SURFACE
      ?auto_9230 - PLACE
      ?auto_9228 - HOIST
      ?auto_9231 - SURFACE
      ?auto_9238 - SURFACE
      ?auto_9223 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9226 ?auto_9224 ) ( IS-CRATE ?auto_9220 ) ( not ( = ?auto_9225 ?auto_9224 ) ) ( HOIST-AT ?auto_9221 ?auto_9225 ) ( SURFACE-AT ?auto_9220 ?auto_9225 ) ( ON ?auto_9220 ?auto_9222 ) ( CLEAR ?auto_9220 ) ( not ( = ?auto_9219 ?auto_9220 ) ) ( not ( = ?auto_9219 ?auto_9222 ) ) ( not ( = ?auto_9220 ?auto_9222 ) ) ( not ( = ?auto_9226 ?auto_9221 ) ) ( IS-CRATE ?auto_9219 ) ( not ( = ?auto_9234 ?auto_9224 ) ) ( HOIST-AT ?auto_9233 ?auto_9234 ) ( SURFACE-AT ?auto_9219 ?auto_9234 ) ( ON ?auto_9219 ?auto_9227 ) ( CLEAR ?auto_9219 ) ( not ( = ?auto_9218 ?auto_9219 ) ) ( not ( = ?auto_9218 ?auto_9227 ) ) ( not ( = ?auto_9219 ?auto_9227 ) ) ( not ( = ?auto_9226 ?auto_9233 ) ) ( IS-CRATE ?auto_9218 ) ( not ( = ?auto_9232 ?auto_9224 ) ) ( HOIST-AT ?auto_9236 ?auto_9232 ) ( SURFACE-AT ?auto_9218 ?auto_9232 ) ( ON ?auto_9218 ?auto_9235 ) ( CLEAR ?auto_9218 ) ( not ( = ?auto_9217 ?auto_9218 ) ) ( not ( = ?auto_9217 ?auto_9235 ) ) ( not ( = ?auto_9218 ?auto_9235 ) ) ( not ( = ?auto_9226 ?auto_9236 ) ) ( IS-CRATE ?auto_9217 ) ( AVAILABLE ?auto_9221 ) ( SURFACE-AT ?auto_9217 ?auto_9225 ) ( ON ?auto_9217 ?auto_9229 ) ( CLEAR ?auto_9217 ) ( not ( = ?auto_9216 ?auto_9217 ) ) ( not ( = ?auto_9216 ?auto_9229 ) ) ( not ( = ?auto_9217 ?auto_9229 ) ) ( IS-CRATE ?auto_9216 ) ( AVAILABLE ?auto_9236 ) ( SURFACE-AT ?auto_9216 ?auto_9232 ) ( ON ?auto_9216 ?auto_9237 ) ( CLEAR ?auto_9216 ) ( not ( = ?auto_9215 ?auto_9216 ) ) ( not ( = ?auto_9215 ?auto_9237 ) ) ( not ( = ?auto_9216 ?auto_9237 ) ) ( IS-CRATE ?auto_9215 ) ( not ( = ?auto_9230 ?auto_9224 ) ) ( HOIST-AT ?auto_9228 ?auto_9230 ) ( AVAILABLE ?auto_9228 ) ( SURFACE-AT ?auto_9215 ?auto_9230 ) ( ON ?auto_9215 ?auto_9231 ) ( CLEAR ?auto_9215 ) ( not ( = ?auto_9214 ?auto_9215 ) ) ( not ( = ?auto_9214 ?auto_9231 ) ) ( not ( = ?auto_9215 ?auto_9231 ) ) ( not ( = ?auto_9226 ?auto_9228 ) ) ( SURFACE-AT ?auto_9213 ?auto_9224 ) ( CLEAR ?auto_9213 ) ( IS-CRATE ?auto_9214 ) ( AVAILABLE ?auto_9226 ) ( AVAILABLE ?auto_9233 ) ( SURFACE-AT ?auto_9214 ?auto_9234 ) ( ON ?auto_9214 ?auto_9238 ) ( CLEAR ?auto_9214 ) ( TRUCK-AT ?auto_9223 ?auto_9224 ) ( not ( = ?auto_9213 ?auto_9214 ) ) ( not ( = ?auto_9213 ?auto_9238 ) ) ( not ( = ?auto_9214 ?auto_9238 ) ) ( not ( = ?auto_9213 ?auto_9215 ) ) ( not ( = ?auto_9213 ?auto_9231 ) ) ( not ( = ?auto_9215 ?auto_9238 ) ) ( not ( = ?auto_9230 ?auto_9234 ) ) ( not ( = ?auto_9228 ?auto_9233 ) ) ( not ( = ?auto_9231 ?auto_9238 ) ) ( not ( = ?auto_9213 ?auto_9216 ) ) ( not ( = ?auto_9213 ?auto_9237 ) ) ( not ( = ?auto_9214 ?auto_9216 ) ) ( not ( = ?auto_9214 ?auto_9237 ) ) ( not ( = ?auto_9216 ?auto_9231 ) ) ( not ( = ?auto_9216 ?auto_9238 ) ) ( not ( = ?auto_9232 ?auto_9230 ) ) ( not ( = ?auto_9232 ?auto_9234 ) ) ( not ( = ?auto_9236 ?auto_9228 ) ) ( not ( = ?auto_9236 ?auto_9233 ) ) ( not ( = ?auto_9237 ?auto_9231 ) ) ( not ( = ?auto_9237 ?auto_9238 ) ) ( not ( = ?auto_9213 ?auto_9217 ) ) ( not ( = ?auto_9213 ?auto_9229 ) ) ( not ( = ?auto_9214 ?auto_9217 ) ) ( not ( = ?auto_9214 ?auto_9229 ) ) ( not ( = ?auto_9215 ?auto_9217 ) ) ( not ( = ?auto_9215 ?auto_9229 ) ) ( not ( = ?auto_9217 ?auto_9237 ) ) ( not ( = ?auto_9217 ?auto_9231 ) ) ( not ( = ?auto_9217 ?auto_9238 ) ) ( not ( = ?auto_9225 ?auto_9232 ) ) ( not ( = ?auto_9225 ?auto_9230 ) ) ( not ( = ?auto_9225 ?auto_9234 ) ) ( not ( = ?auto_9221 ?auto_9236 ) ) ( not ( = ?auto_9221 ?auto_9228 ) ) ( not ( = ?auto_9221 ?auto_9233 ) ) ( not ( = ?auto_9229 ?auto_9237 ) ) ( not ( = ?auto_9229 ?auto_9231 ) ) ( not ( = ?auto_9229 ?auto_9238 ) ) ( not ( = ?auto_9213 ?auto_9218 ) ) ( not ( = ?auto_9213 ?auto_9235 ) ) ( not ( = ?auto_9214 ?auto_9218 ) ) ( not ( = ?auto_9214 ?auto_9235 ) ) ( not ( = ?auto_9215 ?auto_9218 ) ) ( not ( = ?auto_9215 ?auto_9235 ) ) ( not ( = ?auto_9216 ?auto_9218 ) ) ( not ( = ?auto_9216 ?auto_9235 ) ) ( not ( = ?auto_9218 ?auto_9229 ) ) ( not ( = ?auto_9218 ?auto_9237 ) ) ( not ( = ?auto_9218 ?auto_9231 ) ) ( not ( = ?auto_9218 ?auto_9238 ) ) ( not ( = ?auto_9235 ?auto_9229 ) ) ( not ( = ?auto_9235 ?auto_9237 ) ) ( not ( = ?auto_9235 ?auto_9231 ) ) ( not ( = ?auto_9235 ?auto_9238 ) ) ( not ( = ?auto_9213 ?auto_9219 ) ) ( not ( = ?auto_9213 ?auto_9227 ) ) ( not ( = ?auto_9214 ?auto_9219 ) ) ( not ( = ?auto_9214 ?auto_9227 ) ) ( not ( = ?auto_9215 ?auto_9219 ) ) ( not ( = ?auto_9215 ?auto_9227 ) ) ( not ( = ?auto_9216 ?auto_9219 ) ) ( not ( = ?auto_9216 ?auto_9227 ) ) ( not ( = ?auto_9217 ?auto_9219 ) ) ( not ( = ?auto_9217 ?auto_9227 ) ) ( not ( = ?auto_9219 ?auto_9235 ) ) ( not ( = ?auto_9219 ?auto_9229 ) ) ( not ( = ?auto_9219 ?auto_9237 ) ) ( not ( = ?auto_9219 ?auto_9231 ) ) ( not ( = ?auto_9219 ?auto_9238 ) ) ( not ( = ?auto_9227 ?auto_9235 ) ) ( not ( = ?auto_9227 ?auto_9229 ) ) ( not ( = ?auto_9227 ?auto_9237 ) ) ( not ( = ?auto_9227 ?auto_9231 ) ) ( not ( = ?auto_9227 ?auto_9238 ) ) ( not ( = ?auto_9213 ?auto_9220 ) ) ( not ( = ?auto_9213 ?auto_9222 ) ) ( not ( = ?auto_9214 ?auto_9220 ) ) ( not ( = ?auto_9214 ?auto_9222 ) ) ( not ( = ?auto_9215 ?auto_9220 ) ) ( not ( = ?auto_9215 ?auto_9222 ) ) ( not ( = ?auto_9216 ?auto_9220 ) ) ( not ( = ?auto_9216 ?auto_9222 ) ) ( not ( = ?auto_9217 ?auto_9220 ) ) ( not ( = ?auto_9217 ?auto_9222 ) ) ( not ( = ?auto_9218 ?auto_9220 ) ) ( not ( = ?auto_9218 ?auto_9222 ) ) ( not ( = ?auto_9220 ?auto_9227 ) ) ( not ( = ?auto_9220 ?auto_9235 ) ) ( not ( = ?auto_9220 ?auto_9229 ) ) ( not ( = ?auto_9220 ?auto_9237 ) ) ( not ( = ?auto_9220 ?auto_9231 ) ) ( not ( = ?auto_9220 ?auto_9238 ) ) ( not ( = ?auto_9222 ?auto_9227 ) ) ( not ( = ?auto_9222 ?auto_9235 ) ) ( not ( = ?auto_9222 ?auto_9229 ) ) ( not ( = ?auto_9222 ?auto_9237 ) ) ( not ( = ?auto_9222 ?auto_9231 ) ) ( not ( = ?auto_9222 ?auto_9238 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_9213 ?auto_9214 ?auto_9215 ?auto_9216 ?auto_9217 ?auto_9218 ?auto_9219 )
      ( MAKE-1CRATE ?auto_9219 ?auto_9220 )
      ( MAKE-7CRATE-VERIFY ?auto_9213 ?auto_9214 ?auto_9215 ?auto_9216 ?auto_9217 ?auto_9218 ?auto_9219 ?auto_9220 ) )
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
      ?auto_9264 - SURFACE
      ?auto_9265 - SURFACE
      ?auto_9266 - SURFACE
    )
    :vars
    (
      ?auto_9271 - HOIST
      ?auto_9270 - PLACE
      ?auto_9272 - PLACE
      ?auto_9268 - HOIST
      ?auto_9267 - SURFACE
      ?auto_9281 - PLACE
      ?auto_9279 - HOIST
      ?auto_9286 - SURFACE
      ?auto_9287 - PLACE
      ?auto_9278 - HOIST
      ?auto_9277 - SURFACE
      ?auto_9276 - PLACE
      ?auto_9280 - HOIST
      ?auto_9282 - SURFACE
      ?auto_9275 - SURFACE
      ?auto_9285 - SURFACE
      ?auto_9273 - PLACE
      ?auto_9274 - HOIST
      ?auto_9284 - SURFACE
      ?auto_9283 - SURFACE
      ?auto_9269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9271 ?auto_9270 ) ( IS-CRATE ?auto_9266 ) ( not ( = ?auto_9272 ?auto_9270 ) ) ( HOIST-AT ?auto_9268 ?auto_9272 ) ( AVAILABLE ?auto_9268 ) ( SURFACE-AT ?auto_9266 ?auto_9272 ) ( ON ?auto_9266 ?auto_9267 ) ( CLEAR ?auto_9266 ) ( not ( = ?auto_9265 ?auto_9266 ) ) ( not ( = ?auto_9265 ?auto_9267 ) ) ( not ( = ?auto_9266 ?auto_9267 ) ) ( not ( = ?auto_9271 ?auto_9268 ) ) ( IS-CRATE ?auto_9265 ) ( not ( = ?auto_9281 ?auto_9270 ) ) ( HOIST-AT ?auto_9279 ?auto_9281 ) ( SURFACE-AT ?auto_9265 ?auto_9281 ) ( ON ?auto_9265 ?auto_9286 ) ( CLEAR ?auto_9265 ) ( not ( = ?auto_9264 ?auto_9265 ) ) ( not ( = ?auto_9264 ?auto_9286 ) ) ( not ( = ?auto_9265 ?auto_9286 ) ) ( not ( = ?auto_9271 ?auto_9279 ) ) ( IS-CRATE ?auto_9264 ) ( not ( = ?auto_9287 ?auto_9270 ) ) ( HOIST-AT ?auto_9278 ?auto_9287 ) ( SURFACE-AT ?auto_9264 ?auto_9287 ) ( ON ?auto_9264 ?auto_9277 ) ( CLEAR ?auto_9264 ) ( not ( = ?auto_9263 ?auto_9264 ) ) ( not ( = ?auto_9263 ?auto_9277 ) ) ( not ( = ?auto_9264 ?auto_9277 ) ) ( not ( = ?auto_9271 ?auto_9278 ) ) ( IS-CRATE ?auto_9263 ) ( not ( = ?auto_9276 ?auto_9270 ) ) ( HOIST-AT ?auto_9280 ?auto_9276 ) ( SURFACE-AT ?auto_9263 ?auto_9276 ) ( ON ?auto_9263 ?auto_9282 ) ( CLEAR ?auto_9263 ) ( not ( = ?auto_9262 ?auto_9263 ) ) ( not ( = ?auto_9262 ?auto_9282 ) ) ( not ( = ?auto_9263 ?auto_9282 ) ) ( not ( = ?auto_9271 ?auto_9280 ) ) ( IS-CRATE ?auto_9262 ) ( AVAILABLE ?auto_9279 ) ( SURFACE-AT ?auto_9262 ?auto_9281 ) ( ON ?auto_9262 ?auto_9275 ) ( CLEAR ?auto_9262 ) ( not ( = ?auto_9261 ?auto_9262 ) ) ( not ( = ?auto_9261 ?auto_9275 ) ) ( not ( = ?auto_9262 ?auto_9275 ) ) ( IS-CRATE ?auto_9261 ) ( AVAILABLE ?auto_9280 ) ( SURFACE-AT ?auto_9261 ?auto_9276 ) ( ON ?auto_9261 ?auto_9285 ) ( CLEAR ?auto_9261 ) ( not ( = ?auto_9260 ?auto_9261 ) ) ( not ( = ?auto_9260 ?auto_9285 ) ) ( not ( = ?auto_9261 ?auto_9285 ) ) ( IS-CRATE ?auto_9260 ) ( not ( = ?auto_9273 ?auto_9270 ) ) ( HOIST-AT ?auto_9274 ?auto_9273 ) ( AVAILABLE ?auto_9274 ) ( SURFACE-AT ?auto_9260 ?auto_9273 ) ( ON ?auto_9260 ?auto_9284 ) ( CLEAR ?auto_9260 ) ( not ( = ?auto_9259 ?auto_9260 ) ) ( not ( = ?auto_9259 ?auto_9284 ) ) ( not ( = ?auto_9260 ?auto_9284 ) ) ( not ( = ?auto_9271 ?auto_9274 ) ) ( SURFACE-AT ?auto_9258 ?auto_9270 ) ( CLEAR ?auto_9258 ) ( IS-CRATE ?auto_9259 ) ( AVAILABLE ?auto_9271 ) ( AVAILABLE ?auto_9278 ) ( SURFACE-AT ?auto_9259 ?auto_9287 ) ( ON ?auto_9259 ?auto_9283 ) ( CLEAR ?auto_9259 ) ( TRUCK-AT ?auto_9269 ?auto_9270 ) ( not ( = ?auto_9258 ?auto_9259 ) ) ( not ( = ?auto_9258 ?auto_9283 ) ) ( not ( = ?auto_9259 ?auto_9283 ) ) ( not ( = ?auto_9258 ?auto_9260 ) ) ( not ( = ?auto_9258 ?auto_9284 ) ) ( not ( = ?auto_9260 ?auto_9283 ) ) ( not ( = ?auto_9273 ?auto_9287 ) ) ( not ( = ?auto_9274 ?auto_9278 ) ) ( not ( = ?auto_9284 ?auto_9283 ) ) ( not ( = ?auto_9258 ?auto_9261 ) ) ( not ( = ?auto_9258 ?auto_9285 ) ) ( not ( = ?auto_9259 ?auto_9261 ) ) ( not ( = ?auto_9259 ?auto_9285 ) ) ( not ( = ?auto_9261 ?auto_9284 ) ) ( not ( = ?auto_9261 ?auto_9283 ) ) ( not ( = ?auto_9276 ?auto_9273 ) ) ( not ( = ?auto_9276 ?auto_9287 ) ) ( not ( = ?auto_9280 ?auto_9274 ) ) ( not ( = ?auto_9280 ?auto_9278 ) ) ( not ( = ?auto_9285 ?auto_9284 ) ) ( not ( = ?auto_9285 ?auto_9283 ) ) ( not ( = ?auto_9258 ?auto_9262 ) ) ( not ( = ?auto_9258 ?auto_9275 ) ) ( not ( = ?auto_9259 ?auto_9262 ) ) ( not ( = ?auto_9259 ?auto_9275 ) ) ( not ( = ?auto_9260 ?auto_9262 ) ) ( not ( = ?auto_9260 ?auto_9275 ) ) ( not ( = ?auto_9262 ?auto_9285 ) ) ( not ( = ?auto_9262 ?auto_9284 ) ) ( not ( = ?auto_9262 ?auto_9283 ) ) ( not ( = ?auto_9281 ?auto_9276 ) ) ( not ( = ?auto_9281 ?auto_9273 ) ) ( not ( = ?auto_9281 ?auto_9287 ) ) ( not ( = ?auto_9279 ?auto_9280 ) ) ( not ( = ?auto_9279 ?auto_9274 ) ) ( not ( = ?auto_9279 ?auto_9278 ) ) ( not ( = ?auto_9275 ?auto_9285 ) ) ( not ( = ?auto_9275 ?auto_9284 ) ) ( not ( = ?auto_9275 ?auto_9283 ) ) ( not ( = ?auto_9258 ?auto_9263 ) ) ( not ( = ?auto_9258 ?auto_9282 ) ) ( not ( = ?auto_9259 ?auto_9263 ) ) ( not ( = ?auto_9259 ?auto_9282 ) ) ( not ( = ?auto_9260 ?auto_9263 ) ) ( not ( = ?auto_9260 ?auto_9282 ) ) ( not ( = ?auto_9261 ?auto_9263 ) ) ( not ( = ?auto_9261 ?auto_9282 ) ) ( not ( = ?auto_9263 ?auto_9275 ) ) ( not ( = ?auto_9263 ?auto_9285 ) ) ( not ( = ?auto_9263 ?auto_9284 ) ) ( not ( = ?auto_9263 ?auto_9283 ) ) ( not ( = ?auto_9282 ?auto_9275 ) ) ( not ( = ?auto_9282 ?auto_9285 ) ) ( not ( = ?auto_9282 ?auto_9284 ) ) ( not ( = ?auto_9282 ?auto_9283 ) ) ( not ( = ?auto_9258 ?auto_9264 ) ) ( not ( = ?auto_9258 ?auto_9277 ) ) ( not ( = ?auto_9259 ?auto_9264 ) ) ( not ( = ?auto_9259 ?auto_9277 ) ) ( not ( = ?auto_9260 ?auto_9264 ) ) ( not ( = ?auto_9260 ?auto_9277 ) ) ( not ( = ?auto_9261 ?auto_9264 ) ) ( not ( = ?auto_9261 ?auto_9277 ) ) ( not ( = ?auto_9262 ?auto_9264 ) ) ( not ( = ?auto_9262 ?auto_9277 ) ) ( not ( = ?auto_9264 ?auto_9282 ) ) ( not ( = ?auto_9264 ?auto_9275 ) ) ( not ( = ?auto_9264 ?auto_9285 ) ) ( not ( = ?auto_9264 ?auto_9284 ) ) ( not ( = ?auto_9264 ?auto_9283 ) ) ( not ( = ?auto_9277 ?auto_9282 ) ) ( not ( = ?auto_9277 ?auto_9275 ) ) ( not ( = ?auto_9277 ?auto_9285 ) ) ( not ( = ?auto_9277 ?auto_9284 ) ) ( not ( = ?auto_9277 ?auto_9283 ) ) ( not ( = ?auto_9258 ?auto_9265 ) ) ( not ( = ?auto_9258 ?auto_9286 ) ) ( not ( = ?auto_9259 ?auto_9265 ) ) ( not ( = ?auto_9259 ?auto_9286 ) ) ( not ( = ?auto_9260 ?auto_9265 ) ) ( not ( = ?auto_9260 ?auto_9286 ) ) ( not ( = ?auto_9261 ?auto_9265 ) ) ( not ( = ?auto_9261 ?auto_9286 ) ) ( not ( = ?auto_9262 ?auto_9265 ) ) ( not ( = ?auto_9262 ?auto_9286 ) ) ( not ( = ?auto_9263 ?auto_9265 ) ) ( not ( = ?auto_9263 ?auto_9286 ) ) ( not ( = ?auto_9265 ?auto_9277 ) ) ( not ( = ?auto_9265 ?auto_9282 ) ) ( not ( = ?auto_9265 ?auto_9275 ) ) ( not ( = ?auto_9265 ?auto_9285 ) ) ( not ( = ?auto_9265 ?auto_9284 ) ) ( not ( = ?auto_9265 ?auto_9283 ) ) ( not ( = ?auto_9286 ?auto_9277 ) ) ( not ( = ?auto_9286 ?auto_9282 ) ) ( not ( = ?auto_9286 ?auto_9275 ) ) ( not ( = ?auto_9286 ?auto_9285 ) ) ( not ( = ?auto_9286 ?auto_9284 ) ) ( not ( = ?auto_9286 ?auto_9283 ) ) ( not ( = ?auto_9258 ?auto_9266 ) ) ( not ( = ?auto_9258 ?auto_9267 ) ) ( not ( = ?auto_9259 ?auto_9266 ) ) ( not ( = ?auto_9259 ?auto_9267 ) ) ( not ( = ?auto_9260 ?auto_9266 ) ) ( not ( = ?auto_9260 ?auto_9267 ) ) ( not ( = ?auto_9261 ?auto_9266 ) ) ( not ( = ?auto_9261 ?auto_9267 ) ) ( not ( = ?auto_9262 ?auto_9266 ) ) ( not ( = ?auto_9262 ?auto_9267 ) ) ( not ( = ?auto_9263 ?auto_9266 ) ) ( not ( = ?auto_9263 ?auto_9267 ) ) ( not ( = ?auto_9264 ?auto_9266 ) ) ( not ( = ?auto_9264 ?auto_9267 ) ) ( not ( = ?auto_9266 ?auto_9286 ) ) ( not ( = ?auto_9266 ?auto_9277 ) ) ( not ( = ?auto_9266 ?auto_9282 ) ) ( not ( = ?auto_9266 ?auto_9275 ) ) ( not ( = ?auto_9266 ?auto_9285 ) ) ( not ( = ?auto_9266 ?auto_9284 ) ) ( not ( = ?auto_9266 ?auto_9283 ) ) ( not ( = ?auto_9272 ?auto_9281 ) ) ( not ( = ?auto_9272 ?auto_9287 ) ) ( not ( = ?auto_9272 ?auto_9276 ) ) ( not ( = ?auto_9272 ?auto_9273 ) ) ( not ( = ?auto_9268 ?auto_9279 ) ) ( not ( = ?auto_9268 ?auto_9278 ) ) ( not ( = ?auto_9268 ?auto_9280 ) ) ( not ( = ?auto_9268 ?auto_9274 ) ) ( not ( = ?auto_9267 ?auto_9286 ) ) ( not ( = ?auto_9267 ?auto_9277 ) ) ( not ( = ?auto_9267 ?auto_9282 ) ) ( not ( = ?auto_9267 ?auto_9275 ) ) ( not ( = ?auto_9267 ?auto_9285 ) ) ( not ( = ?auto_9267 ?auto_9284 ) ) ( not ( = ?auto_9267 ?auto_9283 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_9258 ?auto_9259 ?auto_9260 ?auto_9261 ?auto_9262 ?auto_9263 ?auto_9264 ?auto_9265 )
      ( MAKE-1CRATE ?auto_9265 ?auto_9266 )
      ( MAKE-8CRATE-VERIFY ?auto_9258 ?auto_9259 ?auto_9260 ?auto_9261 ?auto_9262 ?auto_9263 ?auto_9264 ?auto_9265 ?auto_9266 ) )
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
      ?auto_9314 - SURFACE
      ?auto_9315 - SURFACE
      ?auto_9316 - SURFACE
      ?auto_9317 - SURFACE
    )
    :vars
    (
      ?auto_9322 - HOIST
      ?auto_9323 - PLACE
      ?auto_9318 - PLACE
      ?auto_9320 - HOIST
      ?auto_9321 - SURFACE
      ?auto_9335 - PLACE
      ?auto_9324 - HOIST
      ?auto_9334 - SURFACE
      ?auto_9331 - PLACE
      ?auto_9329 - HOIST
      ?auto_9337 - SURFACE
      ?auto_9328 - PLACE
      ?auto_9333 - HOIST
      ?auto_9341 - SURFACE
      ?auto_9326 - PLACE
      ?auto_9332 - HOIST
      ?auto_9336 - SURFACE
      ?auto_9325 - SURFACE
      ?auto_9330 - SURFACE
      ?auto_9338 - PLACE
      ?auto_9340 - HOIST
      ?auto_9327 - SURFACE
      ?auto_9339 - SURFACE
      ?auto_9319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9322 ?auto_9323 ) ( IS-CRATE ?auto_9317 ) ( not ( = ?auto_9318 ?auto_9323 ) ) ( HOIST-AT ?auto_9320 ?auto_9318 ) ( AVAILABLE ?auto_9320 ) ( SURFACE-AT ?auto_9317 ?auto_9318 ) ( ON ?auto_9317 ?auto_9321 ) ( CLEAR ?auto_9317 ) ( not ( = ?auto_9316 ?auto_9317 ) ) ( not ( = ?auto_9316 ?auto_9321 ) ) ( not ( = ?auto_9317 ?auto_9321 ) ) ( not ( = ?auto_9322 ?auto_9320 ) ) ( IS-CRATE ?auto_9316 ) ( not ( = ?auto_9335 ?auto_9323 ) ) ( HOIST-AT ?auto_9324 ?auto_9335 ) ( AVAILABLE ?auto_9324 ) ( SURFACE-AT ?auto_9316 ?auto_9335 ) ( ON ?auto_9316 ?auto_9334 ) ( CLEAR ?auto_9316 ) ( not ( = ?auto_9315 ?auto_9316 ) ) ( not ( = ?auto_9315 ?auto_9334 ) ) ( not ( = ?auto_9316 ?auto_9334 ) ) ( not ( = ?auto_9322 ?auto_9324 ) ) ( IS-CRATE ?auto_9315 ) ( not ( = ?auto_9331 ?auto_9323 ) ) ( HOIST-AT ?auto_9329 ?auto_9331 ) ( SURFACE-AT ?auto_9315 ?auto_9331 ) ( ON ?auto_9315 ?auto_9337 ) ( CLEAR ?auto_9315 ) ( not ( = ?auto_9314 ?auto_9315 ) ) ( not ( = ?auto_9314 ?auto_9337 ) ) ( not ( = ?auto_9315 ?auto_9337 ) ) ( not ( = ?auto_9322 ?auto_9329 ) ) ( IS-CRATE ?auto_9314 ) ( not ( = ?auto_9328 ?auto_9323 ) ) ( HOIST-AT ?auto_9333 ?auto_9328 ) ( SURFACE-AT ?auto_9314 ?auto_9328 ) ( ON ?auto_9314 ?auto_9341 ) ( CLEAR ?auto_9314 ) ( not ( = ?auto_9313 ?auto_9314 ) ) ( not ( = ?auto_9313 ?auto_9341 ) ) ( not ( = ?auto_9314 ?auto_9341 ) ) ( not ( = ?auto_9322 ?auto_9333 ) ) ( IS-CRATE ?auto_9313 ) ( not ( = ?auto_9326 ?auto_9323 ) ) ( HOIST-AT ?auto_9332 ?auto_9326 ) ( SURFACE-AT ?auto_9313 ?auto_9326 ) ( ON ?auto_9313 ?auto_9336 ) ( CLEAR ?auto_9313 ) ( not ( = ?auto_9312 ?auto_9313 ) ) ( not ( = ?auto_9312 ?auto_9336 ) ) ( not ( = ?auto_9313 ?auto_9336 ) ) ( not ( = ?auto_9322 ?auto_9332 ) ) ( IS-CRATE ?auto_9312 ) ( AVAILABLE ?auto_9329 ) ( SURFACE-AT ?auto_9312 ?auto_9331 ) ( ON ?auto_9312 ?auto_9325 ) ( CLEAR ?auto_9312 ) ( not ( = ?auto_9311 ?auto_9312 ) ) ( not ( = ?auto_9311 ?auto_9325 ) ) ( not ( = ?auto_9312 ?auto_9325 ) ) ( IS-CRATE ?auto_9311 ) ( AVAILABLE ?auto_9332 ) ( SURFACE-AT ?auto_9311 ?auto_9326 ) ( ON ?auto_9311 ?auto_9330 ) ( CLEAR ?auto_9311 ) ( not ( = ?auto_9310 ?auto_9311 ) ) ( not ( = ?auto_9310 ?auto_9330 ) ) ( not ( = ?auto_9311 ?auto_9330 ) ) ( IS-CRATE ?auto_9310 ) ( not ( = ?auto_9338 ?auto_9323 ) ) ( HOIST-AT ?auto_9340 ?auto_9338 ) ( AVAILABLE ?auto_9340 ) ( SURFACE-AT ?auto_9310 ?auto_9338 ) ( ON ?auto_9310 ?auto_9327 ) ( CLEAR ?auto_9310 ) ( not ( = ?auto_9309 ?auto_9310 ) ) ( not ( = ?auto_9309 ?auto_9327 ) ) ( not ( = ?auto_9310 ?auto_9327 ) ) ( not ( = ?auto_9322 ?auto_9340 ) ) ( SURFACE-AT ?auto_9308 ?auto_9323 ) ( CLEAR ?auto_9308 ) ( IS-CRATE ?auto_9309 ) ( AVAILABLE ?auto_9322 ) ( AVAILABLE ?auto_9333 ) ( SURFACE-AT ?auto_9309 ?auto_9328 ) ( ON ?auto_9309 ?auto_9339 ) ( CLEAR ?auto_9309 ) ( TRUCK-AT ?auto_9319 ?auto_9323 ) ( not ( = ?auto_9308 ?auto_9309 ) ) ( not ( = ?auto_9308 ?auto_9339 ) ) ( not ( = ?auto_9309 ?auto_9339 ) ) ( not ( = ?auto_9308 ?auto_9310 ) ) ( not ( = ?auto_9308 ?auto_9327 ) ) ( not ( = ?auto_9310 ?auto_9339 ) ) ( not ( = ?auto_9338 ?auto_9328 ) ) ( not ( = ?auto_9340 ?auto_9333 ) ) ( not ( = ?auto_9327 ?auto_9339 ) ) ( not ( = ?auto_9308 ?auto_9311 ) ) ( not ( = ?auto_9308 ?auto_9330 ) ) ( not ( = ?auto_9309 ?auto_9311 ) ) ( not ( = ?auto_9309 ?auto_9330 ) ) ( not ( = ?auto_9311 ?auto_9327 ) ) ( not ( = ?auto_9311 ?auto_9339 ) ) ( not ( = ?auto_9326 ?auto_9338 ) ) ( not ( = ?auto_9326 ?auto_9328 ) ) ( not ( = ?auto_9332 ?auto_9340 ) ) ( not ( = ?auto_9332 ?auto_9333 ) ) ( not ( = ?auto_9330 ?auto_9327 ) ) ( not ( = ?auto_9330 ?auto_9339 ) ) ( not ( = ?auto_9308 ?auto_9312 ) ) ( not ( = ?auto_9308 ?auto_9325 ) ) ( not ( = ?auto_9309 ?auto_9312 ) ) ( not ( = ?auto_9309 ?auto_9325 ) ) ( not ( = ?auto_9310 ?auto_9312 ) ) ( not ( = ?auto_9310 ?auto_9325 ) ) ( not ( = ?auto_9312 ?auto_9330 ) ) ( not ( = ?auto_9312 ?auto_9327 ) ) ( not ( = ?auto_9312 ?auto_9339 ) ) ( not ( = ?auto_9331 ?auto_9326 ) ) ( not ( = ?auto_9331 ?auto_9338 ) ) ( not ( = ?auto_9331 ?auto_9328 ) ) ( not ( = ?auto_9329 ?auto_9332 ) ) ( not ( = ?auto_9329 ?auto_9340 ) ) ( not ( = ?auto_9329 ?auto_9333 ) ) ( not ( = ?auto_9325 ?auto_9330 ) ) ( not ( = ?auto_9325 ?auto_9327 ) ) ( not ( = ?auto_9325 ?auto_9339 ) ) ( not ( = ?auto_9308 ?auto_9313 ) ) ( not ( = ?auto_9308 ?auto_9336 ) ) ( not ( = ?auto_9309 ?auto_9313 ) ) ( not ( = ?auto_9309 ?auto_9336 ) ) ( not ( = ?auto_9310 ?auto_9313 ) ) ( not ( = ?auto_9310 ?auto_9336 ) ) ( not ( = ?auto_9311 ?auto_9313 ) ) ( not ( = ?auto_9311 ?auto_9336 ) ) ( not ( = ?auto_9313 ?auto_9325 ) ) ( not ( = ?auto_9313 ?auto_9330 ) ) ( not ( = ?auto_9313 ?auto_9327 ) ) ( not ( = ?auto_9313 ?auto_9339 ) ) ( not ( = ?auto_9336 ?auto_9325 ) ) ( not ( = ?auto_9336 ?auto_9330 ) ) ( not ( = ?auto_9336 ?auto_9327 ) ) ( not ( = ?auto_9336 ?auto_9339 ) ) ( not ( = ?auto_9308 ?auto_9314 ) ) ( not ( = ?auto_9308 ?auto_9341 ) ) ( not ( = ?auto_9309 ?auto_9314 ) ) ( not ( = ?auto_9309 ?auto_9341 ) ) ( not ( = ?auto_9310 ?auto_9314 ) ) ( not ( = ?auto_9310 ?auto_9341 ) ) ( not ( = ?auto_9311 ?auto_9314 ) ) ( not ( = ?auto_9311 ?auto_9341 ) ) ( not ( = ?auto_9312 ?auto_9314 ) ) ( not ( = ?auto_9312 ?auto_9341 ) ) ( not ( = ?auto_9314 ?auto_9336 ) ) ( not ( = ?auto_9314 ?auto_9325 ) ) ( not ( = ?auto_9314 ?auto_9330 ) ) ( not ( = ?auto_9314 ?auto_9327 ) ) ( not ( = ?auto_9314 ?auto_9339 ) ) ( not ( = ?auto_9341 ?auto_9336 ) ) ( not ( = ?auto_9341 ?auto_9325 ) ) ( not ( = ?auto_9341 ?auto_9330 ) ) ( not ( = ?auto_9341 ?auto_9327 ) ) ( not ( = ?auto_9341 ?auto_9339 ) ) ( not ( = ?auto_9308 ?auto_9315 ) ) ( not ( = ?auto_9308 ?auto_9337 ) ) ( not ( = ?auto_9309 ?auto_9315 ) ) ( not ( = ?auto_9309 ?auto_9337 ) ) ( not ( = ?auto_9310 ?auto_9315 ) ) ( not ( = ?auto_9310 ?auto_9337 ) ) ( not ( = ?auto_9311 ?auto_9315 ) ) ( not ( = ?auto_9311 ?auto_9337 ) ) ( not ( = ?auto_9312 ?auto_9315 ) ) ( not ( = ?auto_9312 ?auto_9337 ) ) ( not ( = ?auto_9313 ?auto_9315 ) ) ( not ( = ?auto_9313 ?auto_9337 ) ) ( not ( = ?auto_9315 ?auto_9341 ) ) ( not ( = ?auto_9315 ?auto_9336 ) ) ( not ( = ?auto_9315 ?auto_9325 ) ) ( not ( = ?auto_9315 ?auto_9330 ) ) ( not ( = ?auto_9315 ?auto_9327 ) ) ( not ( = ?auto_9315 ?auto_9339 ) ) ( not ( = ?auto_9337 ?auto_9341 ) ) ( not ( = ?auto_9337 ?auto_9336 ) ) ( not ( = ?auto_9337 ?auto_9325 ) ) ( not ( = ?auto_9337 ?auto_9330 ) ) ( not ( = ?auto_9337 ?auto_9327 ) ) ( not ( = ?auto_9337 ?auto_9339 ) ) ( not ( = ?auto_9308 ?auto_9316 ) ) ( not ( = ?auto_9308 ?auto_9334 ) ) ( not ( = ?auto_9309 ?auto_9316 ) ) ( not ( = ?auto_9309 ?auto_9334 ) ) ( not ( = ?auto_9310 ?auto_9316 ) ) ( not ( = ?auto_9310 ?auto_9334 ) ) ( not ( = ?auto_9311 ?auto_9316 ) ) ( not ( = ?auto_9311 ?auto_9334 ) ) ( not ( = ?auto_9312 ?auto_9316 ) ) ( not ( = ?auto_9312 ?auto_9334 ) ) ( not ( = ?auto_9313 ?auto_9316 ) ) ( not ( = ?auto_9313 ?auto_9334 ) ) ( not ( = ?auto_9314 ?auto_9316 ) ) ( not ( = ?auto_9314 ?auto_9334 ) ) ( not ( = ?auto_9316 ?auto_9337 ) ) ( not ( = ?auto_9316 ?auto_9341 ) ) ( not ( = ?auto_9316 ?auto_9336 ) ) ( not ( = ?auto_9316 ?auto_9325 ) ) ( not ( = ?auto_9316 ?auto_9330 ) ) ( not ( = ?auto_9316 ?auto_9327 ) ) ( not ( = ?auto_9316 ?auto_9339 ) ) ( not ( = ?auto_9335 ?auto_9331 ) ) ( not ( = ?auto_9335 ?auto_9328 ) ) ( not ( = ?auto_9335 ?auto_9326 ) ) ( not ( = ?auto_9335 ?auto_9338 ) ) ( not ( = ?auto_9324 ?auto_9329 ) ) ( not ( = ?auto_9324 ?auto_9333 ) ) ( not ( = ?auto_9324 ?auto_9332 ) ) ( not ( = ?auto_9324 ?auto_9340 ) ) ( not ( = ?auto_9334 ?auto_9337 ) ) ( not ( = ?auto_9334 ?auto_9341 ) ) ( not ( = ?auto_9334 ?auto_9336 ) ) ( not ( = ?auto_9334 ?auto_9325 ) ) ( not ( = ?auto_9334 ?auto_9330 ) ) ( not ( = ?auto_9334 ?auto_9327 ) ) ( not ( = ?auto_9334 ?auto_9339 ) ) ( not ( = ?auto_9308 ?auto_9317 ) ) ( not ( = ?auto_9308 ?auto_9321 ) ) ( not ( = ?auto_9309 ?auto_9317 ) ) ( not ( = ?auto_9309 ?auto_9321 ) ) ( not ( = ?auto_9310 ?auto_9317 ) ) ( not ( = ?auto_9310 ?auto_9321 ) ) ( not ( = ?auto_9311 ?auto_9317 ) ) ( not ( = ?auto_9311 ?auto_9321 ) ) ( not ( = ?auto_9312 ?auto_9317 ) ) ( not ( = ?auto_9312 ?auto_9321 ) ) ( not ( = ?auto_9313 ?auto_9317 ) ) ( not ( = ?auto_9313 ?auto_9321 ) ) ( not ( = ?auto_9314 ?auto_9317 ) ) ( not ( = ?auto_9314 ?auto_9321 ) ) ( not ( = ?auto_9315 ?auto_9317 ) ) ( not ( = ?auto_9315 ?auto_9321 ) ) ( not ( = ?auto_9317 ?auto_9334 ) ) ( not ( = ?auto_9317 ?auto_9337 ) ) ( not ( = ?auto_9317 ?auto_9341 ) ) ( not ( = ?auto_9317 ?auto_9336 ) ) ( not ( = ?auto_9317 ?auto_9325 ) ) ( not ( = ?auto_9317 ?auto_9330 ) ) ( not ( = ?auto_9317 ?auto_9327 ) ) ( not ( = ?auto_9317 ?auto_9339 ) ) ( not ( = ?auto_9318 ?auto_9335 ) ) ( not ( = ?auto_9318 ?auto_9331 ) ) ( not ( = ?auto_9318 ?auto_9328 ) ) ( not ( = ?auto_9318 ?auto_9326 ) ) ( not ( = ?auto_9318 ?auto_9338 ) ) ( not ( = ?auto_9320 ?auto_9324 ) ) ( not ( = ?auto_9320 ?auto_9329 ) ) ( not ( = ?auto_9320 ?auto_9333 ) ) ( not ( = ?auto_9320 ?auto_9332 ) ) ( not ( = ?auto_9320 ?auto_9340 ) ) ( not ( = ?auto_9321 ?auto_9334 ) ) ( not ( = ?auto_9321 ?auto_9337 ) ) ( not ( = ?auto_9321 ?auto_9341 ) ) ( not ( = ?auto_9321 ?auto_9336 ) ) ( not ( = ?auto_9321 ?auto_9325 ) ) ( not ( = ?auto_9321 ?auto_9330 ) ) ( not ( = ?auto_9321 ?auto_9327 ) ) ( not ( = ?auto_9321 ?auto_9339 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_9308 ?auto_9309 ?auto_9310 ?auto_9311 ?auto_9312 ?auto_9313 ?auto_9314 ?auto_9315 ?auto_9316 )
      ( MAKE-1CRATE ?auto_9316 ?auto_9317 )
      ( MAKE-9CRATE-VERIFY ?auto_9308 ?auto_9309 ?auto_9310 ?auto_9311 ?auto_9312 ?auto_9313 ?auto_9314 ?auto_9315 ?auto_9316 ?auto_9317 ) )
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
      ?auto_9369 - SURFACE
      ?auto_9370 - SURFACE
      ?auto_9371 - SURFACE
      ?auto_9372 - SURFACE
      ?auto_9373 - SURFACE
    )
    :vars
    (
      ?auto_9379 - HOIST
      ?auto_9375 - PLACE
      ?auto_9376 - PLACE
      ?auto_9378 - HOIST
      ?auto_9377 - SURFACE
      ?auto_9386 - PLACE
      ?auto_9395 - HOIST
      ?auto_9394 - SURFACE
      ?auto_9387 - PLACE
      ?auto_9389 - HOIST
      ?auto_9384 - SURFACE
      ?auto_9382 - PLACE
      ?auto_9385 - HOIST
      ?auto_9392 - SURFACE
      ?auto_9381 - PLACE
      ?auto_9397 - HOIST
      ?auto_9396 - SURFACE
      ?auto_9391 - SURFACE
      ?auto_9390 - SURFACE
      ?auto_9388 - SURFACE
      ?auto_9393 - PLACE
      ?auto_9398 - HOIST
      ?auto_9383 - SURFACE
      ?auto_9380 - SURFACE
      ?auto_9374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9379 ?auto_9375 ) ( IS-CRATE ?auto_9373 ) ( not ( = ?auto_9376 ?auto_9375 ) ) ( HOIST-AT ?auto_9378 ?auto_9376 ) ( SURFACE-AT ?auto_9373 ?auto_9376 ) ( ON ?auto_9373 ?auto_9377 ) ( CLEAR ?auto_9373 ) ( not ( = ?auto_9372 ?auto_9373 ) ) ( not ( = ?auto_9372 ?auto_9377 ) ) ( not ( = ?auto_9373 ?auto_9377 ) ) ( not ( = ?auto_9379 ?auto_9378 ) ) ( IS-CRATE ?auto_9372 ) ( not ( = ?auto_9386 ?auto_9375 ) ) ( HOIST-AT ?auto_9395 ?auto_9386 ) ( AVAILABLE ?auto_9395 ) ( SURFACE-AT ?auto_9372 ?auto_9386 ) ( ON ?auto_9372 ?auto_9394 ) ( CLEAR ?auto_9372 ) ( not ( = ?auto_9371 ?auto_9372 ) ) ( not ( = ?auto_9371 ?auto_9394 ) ) ( not ( = ?auto_9372 ?auto_9394 ) ) ( not ( = ?auto_9379 ?auto_9395 ) ) ( IS-CRATE ?auto_9371 ) ( not ( = ?auto_9387 ?auto_9375 ) ) ( HOIST-AT ?auto_9389 ?auto_9387 ) ( AVAILABLE ?auto_9389 ) ( SURFACE-AT ?auto_9371 ?auto_9387 ) ( ON ?auto_9371 ?auto_9384 ) ( CLEAR ?auto_9371 ) ( not ( = ?auto_9370 ?auto_9371 ) ) ( not ( = ?auto_9370 ?auto_9384 ) ) ( not ( = ?auto_9371 ?auto_9384 ) ) ( not ( = ?auto_9379 ?auto_9389 ) ) ( IS-CRATE ?auto_9370 ) ( not ( = ?auto_9382 ?auto_9375 ) ) ( HOIST-AT ?auto_9385 ?auto_9382 ) ( SURFACE-AT ?auto_9370 ?auto_9382 ) ( ON ?auto_9370 ?auto_9392 ) ( CLEAR ?auto_9370 ) ( not ( = ?auto_9369 ?auto_9370 ) ) ( not ( = ?auto_9369 ?auto_9392 ) ) ( not ( = ?auto_9370 ?auto_9392 ) ) ( not ( = ?auto_9379 ?auto_9385 ) ) ( IS-CRATE ?auto_9369 ) ( not ( = ?auto_9381 ?auto_9375 ) ) ( HOIST-AT ?auto_9397 ?auto_9381 ) ( SURFACE-AT ?auto_9369 ?auto_9381 ) ( ON ?auto_9369 ?auto_9396 ) ( CLEAR ?auto_9369 ) ( not ( = ?auto_9368 ?auto_9369 ) ) ( not ( = ?auto_9368 ?auto_9396 ) ) ( not ( = ?auto_9369 ?auto_9396 ) ) ( not ( = ?auto_9379 ?auto_9397 ) ) ( IS-CRATE ?auto_9368 ) ( SURFACE-AT ?auto_9368 ?auto_9376 ) ( ON ?auto_9368 ?auto_9391 ) ( CLEAR ?auto_9368 ) ( not ( = ?auto_9367 ?auto_9368 ) ) ( not ( = ?auto_9367 ?auto_9391 ) ) ( not ( = ?auto_9368 ?auto_9391 ) ) ( IS-CRATE ?auto_9367 ) ( AVAILABLE ?auto_9385 ) ( SURFACE-AT ?auto_9367 ?auto_9382 ) ( ON ?auto_9367 ?auto_9390 ) ( CLEAR ?auto_9367 ) ( not ( = ?auto_9366 ?auto_9367 ) ) ( not ( = ?auto_9366 ?auto_9390 ) ) ( not ( = ?auto_9367 ?auto_9390 ) ) ( IS-CRATE ?auto_9366 ) ( AVAILABLE ?auto_9378 ) ( SURFACE-AT ?auto_9366 ?auto_9376 ) ( ON ?auto_9366 ?auto_9388 ) ( CLEAR ?auto_9366 ) ( not ( = ?auto_9365 ?auto_9366 ) ) ( not ( = ?auto_9365 ?auto_9388 ) ) ( not ( = ?auto_9366 ?auto_9388 ) ) ( IS-CRATE ?auto_9365 ) ( not ( = ?auto_9393 ?auto_9375 ) ) ( HOIST-AT ?auto_9398 ?auto_9393 ) ( AVAILABLE ?auto_9398 ) ( SURFACE-AT ?auto_9365 ?auto_9393 ) ( ON ?auto_9365 ?auto_9383 ) ( CLEAR ?auto_9365 ) ( not ( = ?auto_9364 ?auto_9365 ) ) ( not ( = ?auto_9364 ?auto_9383 ) ) ( not ( = ?auto_9365 ?auto_9383 ) ) ( not ( = ?auto_9379 ?auto_9398 ) ) ( SURFACE-AT ?auto_9363 ?auto_9375 ) ( CLEAR ?auto_9363 ) ( IS-CRATE ?auto_9364 ) ( AVAILABLE ?auto_9379 ) ( AVAILABLE ?auto_9397 ) ( SURFACE-AT ?auto_9364 ?auto_9381 ) ( ON ?auto_9364 ?auto_9380 ) ( CLEAR ?auto_9364 ) ( TRUCK-AT ?auto_9374 ?auto_9375 ) ( not ( = ?auto_9363 ?auto_9364 ) ) ( not ( = ?auto_9363 ?auto_9380 ) ) ( not ( = ?auto_9364 ?auto_9380 ) ) ( not ( = ?auto_9363 ?auto_9365 ) ) ( not ( = ?auto_9363 ?auto_9383 ) ) ( not ( = ?auto_9365 ?auto_9380 ) ) ( not ( = ?auto_9393 ?auto_9381 ) ) ( not ( = ?auto_9398 ?auto_9397 ) ) ( not ( = ?auto_9383 ?auto_9380 ) ) ( not ( = ?auto_9363 ?auto_9366 ) ) ( not ( = ?auto_9363 ?auto_9388 ) ) ( not ( = ?auto_9364 ?auto_9366 ) ) ( not ( = ?auto_9364 ?auto_9388 ) ) ( not ( = ?auto_9366 ?auto_9383 ) ) ( not ( = ?auto_9366 ?auto_9380 ) ) ( not ( = ?auto_9376 ?auto_9393 ) ) ( not ( = ?auto_9376 ?auto_9381 ) ) ( not ( = ?auto_9378 ?auto_9398 ) ) ( not ( = ?auto_9378 ?auto_9397 ) ) ( not ( = ?auto_9388 ?auto_9383 ) ) ( not ( = ?auto_9388 ?auto_9380 ) ) ( not ( = ?auto_9363 ?auto_9367 ) ) ( not ( = ?auto_9363 ?auto_9390 ) ) ( not ( = ?auto_9364 ?auto_9367 ) ) ( not ( = ?auto_9364 ?auto_9390 ) ) ( not ( = ?auto_9365 ?auto_9367 ) ) ( not ( = ?auto_9365 ?auto_9390 ) ) ( not ( = ?auto_9367 ?auto_9388 ) ) ( not ( = ?auto_9367 ?auto_9383 ) ) ( not ( = ?auto_9367 ?auto_9380 ) ) ( not ( = ?auto_9382 ?auto_9376 ) ) ( not ( = ?auto_9382 ?auto_9393 ) ) ( not ( = ?auto_9382 ?auto_9381 ) ) ( not ( = ?auto_9385 ?auto_9378 ) ) ( not ( = ?auto_9385 ?auto_9398 ) ) ( not ( = ?auto_9385 ?auto_9397 ) ) ( not ( = ?auto_9390 ?auto_9388 ) ) ( not ( = ?auto_9390 ?auto_9383 ) ) ( not ( = ?auto_9390 ?auto_9380 ) ) ( not ( = ?auto_9363 ?auto_9368 ) ) ( not ( = ?auto_9363 ?auto_9391 ) ) ( not ( = ?auto_9364 ?auto_9368 ) ) ( not ( = ?auto_9364 ?auto_9391 ) ) ( not ( = ?auto_9365 ?auto_9368 ) ) ( not ( = ?auto_9365 ?auto_9391 ) ) ( not ( = ?auto_9366 ?auto_9368 ) ) ( not ( = ?auto_9366 ?auto_9391 ) ) ( not ( = ?auto_9368 ?auto_9390 ) ) ( not ( = ?auto_9368 ?auto_9388 ) ) ( not ( = ?auto_9368 ?auto_9383 ) ) ( not ( = ?auto_9368 ?auto_9380 ) ) ( not ( = ?auto_9391 ?auto_9390 ) ) ( not ( = ?auto_9391 ?auto_9388 ) ) ( not ( = ?auto_9391 ?auto_9383 ) ) ( not ( = ?auto_9391 ?auto_9380 ) ) ( not ( = ?auto_9363 ?auto_9369 ) ) ( not ( = ?auto_9363 ?auto_9396 ) ) ( not ( = ?auto_9364 ?auto_9369 ) ) ( not ( = ?auto_9364 ?auto_9396 ) ) ( not ( = ?auto_9365 ?auto_9369 ) ) ( not ( = ?auto_9365 ?auto_9396 ) ) ( not ( = ?auto_9366 ?auto_9369 ) ) ( not ( = ?auto_9366 ?auto_9396 ) ) ( not ( = ?auto_9367 ?auto_9369 ) ) ( not ( = ?auto_9367 ?auto_9396 ) ) ( not ( = ?auto_9369 ?auto_9391 ) ) ( not ( = ?auto_9369 ?auto_9390 ) ) ( not ( = ?auto_9369 ?auto_9388 ) ) ( not ( = ?auto_9369 ?auto_9383 ) ) ( not ( = ?auto_9369 ?auto_9380 ) ) ( not ( = ?auto_9396 ?auto_9391 ) ) ( not ( = ?auto_9396 ?auto_9390 ) ) ( not ( = ?auto_9396 ?auto_9388 ) ) ( not ( = ?auto_9396 ?auto_9383 ) ) ( not ( = ?auto_9396 ?auto_9380 ) ) ( not ( = ?auto_9363 ?auto_9370 ) ) ( not ( = ?auto_9363 ?auto_9392 ) ) ( not ( = ?auto_9364 ?auto_9370 ) ) ( not ( = ?auto_9364 ?auto_9392 ) ) ( not ( = ?auto_9365 ?auto_9370 ) ) ( not ( = ?auto_9365 ?auto_9392 ) ) ( not ( = ?auto_9366 ?auto_9370 ) ) ( not ( = ?auto_9366 ?auto_9392 ) ) ( not ( = ?auto_9367 ?auto_9370 ) ) ( not ( = ?auto_9367 ?auto_9392 ) ) ( not ( = ?auto_9368 ?auto_9370 ) ) ( not ( = ?auto_9368 ?auto_9392 ) ) ( not ( = ?auto_9370 ?auto_9396 ) ) ( not ( = ?auto_9370 ?auto_9391 ) ) ( not ( = ?auto_9370 ?auto_9390 ) ) ( not ( = ?auto_9370 ?auto_9388 ) ) ( not ( = ?auto_9370 ?auto_9383 ) ) ( not ( = ?auto_9370 ?auto_9380 ) ) ( not ( = ?auto_9392 ?auto_9396 ) ) ( not ( = ?auto_9392 ?auto_9391 ) ) ( not ( = ?auto_9392 ?auto_9390 ) ) ( not ( = ?auto_9392 ?auto_9388 ) ) ( not ( = ?auto_9392 ?auto_9383 ) ) ( not ( = ?auto_9392 ?auto_9380 ) ) ( not ( = ?auto_9363 ?auto_9371 ) ) ( not ( = ?auto_9363 ?auto_9384 ) ) ( not ( = ?auto_9364 ?auto_9371 ) ) ( not ( = ?auto_9364 ?auto_9384 ) ) ( not ( = ?auto_9365 ?auto_9371 ) ) ( not ( = ?auto_9365 ?auto_9384 ) ) ( not ( = ?auto_9366 ?auto_9371 ) ) ( not ( = ?auto_9366 ?auto_9384 ) ) ( not ( = ?auto_9367 ?auto_9371 ) ) ( not ( = ?auto_9367 ?auto_9384 ) ) ( not ( = ?auto_9368 ?auto_9371 ) ) ( not ( = ?auto_9368 ?auto_9384 ) ) ( not ( = ?auto_9369 ?auto_9371 ) ) ( not ( = ?auto_9369 ?auto_9384 ) ) ( not ( = ?auto_9371 ?auto_9392 ) ) ( not ( = ?auto_9371 ?auto_9396 ) ) ( not ( = ?auto_9371 ?auto_9391 ) ) ( not ( = ?auto_9371 ?auto_9390 ) ) ( not ( = ?auto_9371 ?auto_9388 ) ) ( not ( = ?auto_9371 ?auto_9383 ) ) ( not ( = ?auto_9371 ?auto_9380 ) ) ( not ( = ?auto_9387 ?auto_9382 ) ) ( not ( = ?auto_9387 ?auto_9381 ) ) ( not ( = ?auto_9387 ?auto_9376 ) ) ( not ( = ?auto_9387 ?auto_9393 ) ) ( not ( = ?auto_9389 ?auto_9385 ) ) ( not ( = ?auto_9389 ?auto_9397 ) ) ( not ( = ?auto_9389 ?auto_9378 ) ) ( not ( = ?auto_9389 ?auto_9398 ) ) ( not ( = ?auto_9384 ?auto_9392 ) ) ( not ( = ?auto_9384 ?auto_9396 ) ) ( not ( = ?auto_9384 ?auto_9391 ) ) ( not ( = ?auto_9384 ?auto_9390 ) ) ( not ( = ?auto_9384 ?auto_9388 ) ) ( not ( = ?auto_9384 ?auto_9383 ) ) ( not ( = ?auto_9384 ?auto_9380 ) ) ( not ( = ?auto_9363 ?auto_9372 ) ) ( not ( = ?auto_9363 ?auto_9394 ) ) ( not ( = ?auto_9364 ?auto_9372 ) ) ( not ( = ?auto_9364 ?auto_9394 ) ) ( not ( = ?auto_9365 ?auto_9372 ) ) ( not ( = ?auto_9365 ?auto_9394 ) ) ( not ( = ?auto_9366 ?auto_9372 ) ) ( not ( = ?auto_9366 ?auto_9394 ) ) ( not ( = ?auto_9367 ?auto_9372 ) ) ( not ( = ?auto_9367 ?auto_9394 ) ) ( not ( = ?auto_9368 ?auto_9372 ) ) ( not ( = ?auto_9368 ?auto_9394 ) ) ( not ( = ?auto_9369 ?auto_9372 ) ) ( not ( = ?auto_9369 ?auto_9394 ) ) ( not ( = ?auto_9370 ?auto_9372 ) ) ( not ( = ?auto_9370 ?auto_9394 ) ) ( not ( = ?auto_9372 ?auto_9384 ) ) ( not ( = ?auto_9372 ?auto_9392 ) ) ( not ( = ?auto_9372 ?auto_9396 ) ) ( not ( = ?auto_9372 ?auto_9391 ) ) ( not ( = ?auto_9372 ?auto_9390 ) ) ( not ( = ?auto_9372 ?auto_9388 ) ) ( not ( = ?auto_9372 ?auto_9383 ) ) ( not ( = ?auto_9372 ?auto_9380 ) ) ( not ( = ?auto_9386 ?auto_9387 ) ) ( not ( = ?auto_9386 ?auto_9382 ) ) ( not ( = ?auto_9386 ?auto_9381 ) ) ( not ( = ?auto_9386 ?auto_9376 ) ) ( not ( = ?auto_9386 ?auto_9393 ) ) ( not ( = ?auto_9395 ?auto_9389 ) ) ( not ( = ?auto_9395 ?auto_9385 ) ) ( not ( = ?auto_9395 ?auto_9397 ) ) ( not ( = ?auto_9395 ?auto_9378 ) ) ( not ( = ?auto_9395 ?auto_9398 ) ) ( not ( = ?auto_9394 ?auto_9384 ) ) ( not ( = ?auto_9394 ?auto_9392 ) ) ( not ( = ?auto_9394 ?auto_9396 ) ) ( not ( = ?auto_9394 ?auto_9391 ) ) ( not ( = ?auto_9394 ?auto_9390 ) ) ( not ( = ?auto_9394 ?auto_9388 ) ) ( not ( = ?auto_9394 ?auto_9383 ) ) ( not ( = ?auto_9394 ?auto_9380 ) ) ( not ( = ?auto_9363 ?auto_9373 ) ) ( not ( = ?auto_9363 ?auto_9377 ) ) ( not ( = ?auto_9364 ?auto_9373 ) ) ( not ( = ?auto_9364 ?auto_9377 ) ) ( not ( = ?auto_9365 ?auto_9373 ) ) ( not ( = ?auto_9365 ?auto_9377 ) ) ( not ( = ?auto_9366 ?auto_9373 ) ) ( not ( = ?auto_9366 ?auto_9377 ) ) ( not ( = ?auto_9367 ?auto_9373 ) ) ( not ( = ?auto_9367 ?auto_9377 ) ) ( not ( = ?auto_9368 ?auto_9373 ) ) ( not ( = ?auto_9368 ?auto_9377 ) ) ( not ( = ?auto_9369 ?auto_9373 ) ) ( not ( = ?auto_9369 ?auto_9377 ) ) ( not ( = ?auto_9370 ?auto_9373 ) ) ( not ( = ?auto_9370 ?auto_9377 ) ) ( not ( = ?auto_9371 ?auto_9373 ) ) ( not ( = ?auto_9371 ?auto_9377 ) ) ( not ( = ?auto_9373 ?auto_9394 ) ) ( not ( = ?auto_9373 ?auto_9384 ) ) ( not ( = ?auto_9373 ?auto_9392 ) ) ( not ( = ?auto_9373 ?auto_9396 ) ) ( not ( = ?auto_9373 ?auto_9391 ) ) ( not ( = ?auto_9373 ?auto_9390 ) ) ( not ( = ?auto_9373 ?auto_9388 ) ) ( not ( = ?auto_9373 ?auto_9383 ) ) ( not ( = ?auto_9373 ?auto_9380 ) ) ( not ( = ?auto_9377 ?auto_9394 ) ) ( not ( = ?auto_9377 ?auto_9384 ) ) ( not ( = ?auto_9377 ?auto_9392 ) ) ( not ( = ?auto_9377 ?auto_9396 ) ) ( not ( = ?auto_9377 ?auto_9391 ) ) ( not ( = ?auto_9377 ?auto_9390 ) ) ( not ( = ?auto_9377 ?auto_9388 ) ) ( not ( = ?auto_9377 ?auto_9383 ) ) ( not ( = ?auto_9377 ?auto_9380 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_9363 ?auto_9364 ?auto_9365 ?auto_9366 ?auto_9367 ?auto_9368 ?auto_9369 ?auto_9370 ?auto_9371 ?auto_9372 )
      ( MAKE-1CRATE ?auto_9372 ?auto_9373 )
      ( MAKE-10CRATE-VERIFY ?auto_9363 ?auto_9364 ?auto_9365 ?auto_9366 ?auto_9367 ?auto_9368 ?auto_9369 ?auto_9370 ?auto_9371 ?auto_9372 ?auto_9373 ) )
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
      ?auto_9427 - SURFACE
      ?auto_9428 - SURFACE
      ?auto_9429 - SURFACE
      ?auto_9430 - SURFACE
      ?auto_9431 - SURFACE
      ?auto_9432 - SURFACE
    )
    :vars
    (
      ?auto_9438 - HOIST
      ?auto_9434 - PLACE
      ?auto_9436 - PLACE
      ?auto_9437 - HOIST
      ?auto_9435 - SURFACE
      ?auto_9442 - PLACE
      ?auto_9448 - HOIST
      ?auto_9451 - SURFACE
      ?auto_9443 - SURFACE
      ?auto_9444 - PLACE
      ?auto_9439 - HOIST
      ?auto_9445 - SURFACE
      ?auto_9458 - PLACE
      ?auto_9446 - HOIST
      ?auto_9455 - SURFACE
      ?auto_9453 - PLACE
      ?auto_9457 - HOIST
      ?auto_9449 - SURFACE
      ?auto_9447 - SURFACE
      ?auto_9456 - SURFACE
      ?auto_9454 - SURFACE
      ?auto_9440 - PLACE
      ?auto_9441 - HOIST
      ?auto_9452 - SURFACE
      ?auto_9450 - SURFACE
      ?auto_9433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9438 ?auto_9434 ) ( IS-CRATE ?auto_9432 ) ( not ( = ?auto_9436 ?auto_9434 ) ) ( HOIST-AT ?auto_9437 ?auto_9436 ) ( SURFACE-AT ?auto_9432 ?auto_9436 ) ( ON ?auto_9432 ?auto_9435 ) ( CLEAR ?auto_9432 ) ( not ( = ?auto_9431 ?auto_9432 ) ) ( not ( = ?auto_9431 ?auto_9435 ) ) ( not ( = ?auto_9432 ?auto_9435 ) ) ( not ( = ?auto_9438 ?auto_9437 ) ) ( IS-CRATE ?auto_9431 ) ( not ( = ?auto_9442 ?auto_9434 ) ) ( HOIST-AT ?auto_9448 ?auto_9442 ) ( SURFACE-AT ?auto_9431 ?auto_9442 ) ( ON ?auto_9431 ?auto_9451 ) ( CLEAR ?auto_9431 ) ( not ( = ?auto_9430 ?auto_9431 ) ) ( not ( = ?auto_9430 ?auto_9451 ) ) ( not ( = ?auto_9431 ?auto_9451 ) ) ( not ( = ?auto_9438 ?auto_9448 ) ) ( IS-CRATE ?auto_9430 ) ( AVAILABLE ?auto_9437 ) ( SURFACE-AT ?auto_9430 ?auto_9436 ) ( ON ?auto_9430 ?auto_9443 ) ( CLEAR ?auto_9430 ) ( not ( = ?auto_9429 ?auto_9430 ) ) ( not ( = ?auto_9429 ?auto_9443 ) ) ( not ( = ?auto_9430 ?auto_9443 ) ) ( IS-CRATE ?auto_9429 ) ( not ( = ?auto_9444 ?auto_9434 ) ) ( HOIST-AT ?auto_9439 ?auto_9444 ) ( AVAILABLE ?auto_9439 ) ( SURFACE-AT ?auto_9429 ?auto_9444 ) ( ON ?auto_9429 ?auto_9445 ) ( CLEAR ?auto_9429 ) ( not ( = ?auto_9428 ?auto_9429 ) ) ( not ( = ?auto_9428 ?auto_9445 ) ) ( not ( = ?auto_9429 ?auto_9445 ) ) ( not ( = ?auto_9438 ?auto_9439 ) ) ( IS-CRATE ?auto_9428 ) ( not ( = ?auto_9458 ?auto_9434 ) ) ( HOIST-AT ?auto_9446 ?auto_9458 ) ( SURFACE-AT ?auto_9428 ?auto_9458 ) ( ON ?auto_9428 ?auto_9455 ) ( CLEAR ?auto_9428 ) ( not ( = ?auto_9427 ?auto_9428 ) ) ( not ( = ?auto_9427 ?auto_9455 ) ) ( not ( = ?auto_9428 ?auto_9455 ) ) ( not ( = ?auto_9438 ?auto_9446 ) ) ( IS-CRATE ?auto_9427 ) ( not ( = ?auto_9453 ?auto_9434 ) ) ( HOIST-AT ?auto_9457 ?auto_9453 ) ( SURFACE-AT ?auto_9427 ?auto_9453 ) ( ON ?auto_9427 ?auto_9449 ) ( CLEAR ?auto_9427 ) ( not ( = ?auto_9426 ?auto_9427 ) ) ( not ( = ?auto_9426 ?auto_9449 ) ) ( not ( = ?auto_9427 ?auto_9449 ) ) ( not ( = ?auto_9438 ?auto_9457 ) ) ( IS-CRATE ?auto_9426 ) ( SURFACE-AT ?auto_9426 ?auto_9442 ) ( ON ?auto_9426 ?auto_9447 ) ( CLEAR ?auto_9426 ) ( not ( = ?auto_9425 ?auto_9426 ) ) ( not ( = ?auto_9425 ?auto_9447 ) ) ( not ( = ?auto_9426 ?auto_9447 ) ) ( IS-CRATE ?auto_9425 ) ( AVAILABLE ?auto_9446 ) ( SURFACE-AT ?auto_9425 ?auto_9458 ) ( ON ?auto_9425 ?auto_9456 ) ( CLEAR ?auto_9425 ) ( not ( = ?auto_9424 ?auto_9425 ) ) ( not ( = ?auto_9424 ?auto_9456 ) ) ( not ( = ?auto_9425 ?auto_9456 ) ) ( IS-CRATE ?auto_9424 ) ( AVAILABLE ?auto_9448 ) ( SURFACE-AT ?auto_9424 ?auto_9442 ) ( ON ?auto_9424 ?auto_9454 ) ( CLEAR ?auto_9424 ) ( not ( = ?auto_9423 ?auto_9424 ) ) ( not ( = ?auto_9423 ?auto_9454 ) ) ( not ( = ?auto_9424 ?auto_9454 ) ) ( IS-CRATE ?auto_9423 ) ( not ( = ?auto_9440 ?auto_9434 ) ) ( HOIST-AT ?auto_9441 ?auto_9440 ) ( AVAILABLE ?auto_9441 ) ( SURFACE-AT ?auto_9423 ?auto_9440 ) ( ON ?auto_9423 ?auto_9452 ) ( CLEAR ?auto_9423 ) ( not ( = ?auto_9422 ?auto_9423 ) ) ( not ( = ?auto_9422 ?auto_9452 ) ) ( not ( = ?auto_9423 ?auto_9452 ) ) ( not ( = ?auto_9438 ?auto_9441 ) ) ( SURFACE-AT ?auto_9421 ?auto_9434 ) ( CLEAR ?auto_9421 ) ( IS-CRATE ?auto_9422 ) ( AVAILABLE ?auto_9438 ) ( AVAILABLE ?auto_9457 ) ( SURFACE-AT ?auto_9422 ?auto_9453 ) ( ON ?auto_9422 ?auto_9450 ) ( CLEAR ?auto_9422 ) ( TRUCK-AT ?auto_9433 ?auto_9434 ) ( not ( = ?auto_9421 ?auto_9422 ) ) ( not ( = ?auto_9421 ?auto_9450 ) ) ( not ( = ?auto_9422 ?auto_9450 ) ) ( not ( = ?auto_9421 ?auto_9423 ) ) ( not ( = ?auto_9421 ?auto_9452 ) ) ( not ( = ?auto_9423 ?auto_9450 ) ) ( not ( = ?auto_9440 ?auto_9453 ) ) ( not ( = ?auto_9441 ?auto_9457 ) ) ( not ( = ?auto_9452 ?auto_9450 ) ) ( not ( = ?auto_9421 ?auto_9424 ) ) ( not ( = ?auto_9421 ?auto_9454 ) ) ( not ( = ?auto_9422 ?auto_9424 ) ) ( not ( = ?auto_9422 ?auto_9454 ) ) ( not ( = ?auto_9424 ?auto_9452 ) ) ( not ( = ?auto_9424 ?auto_9450 ) ) ( not ( = ?auto_9442 ?auto_9440 ) ) ( not ( = ?auto_9442 ?auto_9453 ) ) ( not ( = ?auto_9448 ?auto_9441 ) ) ( not ( = ?auto_9448 ?auto_9457 ) ) ( not ( = ?auto_9454 ?auto_9452 ) ) ( not ( = ?auto_9454 ?auto_9450 ) ) ( not ( = ?auto_9421 ?auto_9425 ) ) ( not ( = ?auto_9421 ?auto_9456 ) ) ( not ( = ?auto_9422 ?auto_9425 ) ) ( not ( = ?auto_9422 ?auto_9456 ) ) ( not ( = ?auto_9423 ?auto_9425 ) ) ( not ( = ?auto_9423 ?auto_9456 ) ) ( not ( = ?auto_9425 ?auto_9454 ) ) ( not ( = ?auto_9425 ?auto_9452 ) ) ( not ( = ?auto_9425 ?auto_9450 ) ) ( not ( = ?auto_9458 ?auto_9442 ) ) ( not ( = ?auto_9458 ?auto_9440 ) ) ( not ( = ?auto_9458 ?auto_9453 ) ) ( not ( = ?auto_9446 ?auto_9448 ) ) ( not ( = ?auto_9446 ?auto_9441 ) ) ( not ( = ?auto_9446 ?auto_9457 ) ) ( not ( = ?auto_9456 ?auto_9454 ) ) ( not ( = ?auto_9456 ?auto_9452 ) ) ( not ( = ?auto_9456 ?auto_9450 ) ) ( not ( = ?auto_9421 ?auto_9426 ) ) ( not ( = ?auto_9421 ?auto_9447 ) ) ( not ( = ?auto_9422 ?auto_9426 ) ) ( not ( = ?auto_9422 ?auto_9447 ) ) ( not ( = ?auto_9423 ?auto_9426 ) ) ( not ( = ?auto_9423 ?auto_9447 ) ) ( not ( = ?auto_9424 ?auto_9426 ) ) ( not ( = ?auto_9424 ?auto_9447 ) ) ( not ( = ?auto_9426 ?auto_9456 ) ) ( not ( = ?auto_9426 ?auto_9454 ) ) ( not ( = ?auto_9426 ?auto_9452 ) ) ( not ( = ?auto_9426 ?auto_9450 ) ) ( not ( = ?auto_9447 ?auto_9456 ) ) ( not ( = ?auto_9447 ?auto_9454 ) ) ( not ( = ?auto_9447 ?auto_9452 ) ) ( not ( = ?auto_9447 ?auto_9450 ) ) ( not ( = ?auto_9421 ?auto_9427 ) ) ( not ( = ?auto_9421 ?auto_9449 ) ) ( not ( = ?auto_9422 ?auto_9427 ) ) ( not ( = ?auto_9422 ?auto_9449 ) ) ( not ( = ?auto_9423 ?auto_9427 ) ) ( not ( = ?auto_9423 ?auto_9449 ) ) ( not ( = ?auto_9424 ?auto_9427 ) ) ( not ( = ?auto_9424 ?auto_9449 ) ) ( not ( = ?auto_9425 ?auto_9427 ) ) ( not ( = ?auto_9425 ?auto_9449 ) ) ( not ( = ?auto_9427 ?auto_9447 ) ) ( not ( = ?auto_9427 ?auto_9456 ) ) ( not ( = ?auto_9427 ?auto_9454 ) ) ( not ( = ?auto_9427 ?auto_9452 ) ) ( not ( = ?auto_9427 ?auto_9450 ) ) ( not ( = ?auto_9449 ?auto_9447 ) ) ( not ( = ?auto_9449 ?auto_9456 ) ) ( not ( = ?auto_9449 ?auto_9454 ) ) ( not ( = ?auto_9449 ?auto_9452 ) ) ( not ( = ?auto_9449 ?auto_9450 ) ) ( not ( = ?auto_9421 ?auto_9428 ) ) ( not ( = ?auto_9421 ?auto_9455 ) ) ( not ( = ?auto_9422 ?auto_9428 ) ) ( not ( = ?auto_9422 ?auto_9455 ) ) ( not ( = ?auto_9423 ?auto_9428 ) ) ( not ( = ?auto_9423 ?auto_9455 ) ) ( not ( = ?auto_9424 ?auto_9428 ) ) ( not ( = ?auto_9424 ?auto_9455 ) ) ( not ( = ?auto_9425 ?auto_9428 ) ) ( not ( = ?auto_9425 ?auto_9455 ) ) ( not ( = ?auto_9426 ?auto_9428 ) ) ( not ( = ?auto_9426 ?auto_9455 ) ) ( not ( = ?auto_9428 ?auto_9449 ) ) ( not ( = ?auto_9428 ?auto_9447 ) ) ( not ( = ?auto_9428 ?auto_9456 ) ) ( not ( = ?auto_9428 ?auto_9454 ) ) ( not ( = ?auto_9428 ?auto_9452 ) ) ( not ( = ?auto_9428 ?auto_9450 ) ) ( not ( = ?auto_9455 ?auto_9449 ) ) ( not ( = ?auto_9455 ?auto_9447 ) ) ( not ( = ?auto_9455 ?auto_9456 ) ) ( not ( = ?auto_9455 ?auto_9454 ) ) ( not ( = ?auto_9455 ?auto_9452 ) ) ( not ( = ?auto_9455 ?auto_9450 ) ) ( not ( = ?auto_9421 ?auto_9429 ) ) ( not ( = ?auto_9421 ?auto_9445 ) ) ( not ( = ?auto_9422 ?auto_9429 ) ) ( not ( = ?auto_9422 ?auto_9445 ) ) ( not ( = ?auto_9423 ?auto_9429 ) ) ( not ( = ?auto_9423 ?auto_9445 ) ) ( not ( = ?auto_9424 ?auto_9429 ) ) ( not ( = ?auto_9424 ?auto_9445 ) ) ( not ( = ?auto_9425 ?auto_9429 ) ) ( not ( = ?auto_9425 ?auto_9445 ) ) ( not ( = ?auto_9426 ?auto_9429 ) ) ( not ( = ?auto_9426 ?auto_9445 ) ) ( not ( = ?auto_9427 ?auto_9429 ) ) ( not ( = ?auto_9427 ?auto_9445 ) ) ( not ( = ?auto_9429 ?auto_9455 ) ) ( not ( = ?auto_9429 ?auto_9449 ) ) ( not ( = ?auto_9429 ?auto_9447 ) ) ( not ( = ?auto_9429 ?auto_9456 ) ) ( not ( = ?auto_9429 ?auto_9454 ) ) ( not ( = ?auto_9429 ?auto_9452 ) ) ( not ( = ?auto_9429 ?auto_9450 ) ) ( not ( = ?auto_9444 ?auto_9458 ) ) ( not ( = ?auto_9444 ?auto_9453 ) ) ( not ( = ?auto_9444 ?auto_9442 ) ) ( not ( = ?auto_9444 ?auto_9440 ) ) ( not ( = ?auto_9439 ?auto_9446 ) ) ( not ( = ?auto_9439 ?auto_9457 ) ) ( not ( = ?auto_9439 ?auto_9448 ) ) ( not ( = ?auto_9439 ?auto_9441 ) ) ( not ( = ?auto_9445 ?auto_9455 ) ) ( not ( = ?auto_9445 ?auto_9449 ) ) ( not ( = ?auto_9445 ?auto_9447 ) ) ( not ( = ?auto_9445 ?auto_9456 ) ) ( not ( = ?auto_9445 ?auto_9454 ) ) ( not ( = ?auto_9445 ?auto_9452 ) ) ( not ( = ?auto_9445 ?auto_9450 ) ) ( not ( = ?auto_9421 ?auto_9430 ) ) ( not ( = ?auto_9421 ?auto_9443 ) ) ( not ( = ?auto_9422 ?auto_9430 ) ) ( not ( = ?auto_9422 ?auto_9443 ) ) ( not ( = ?auto_9423 ?auto_9430 ) ) ( not ( = ?auto_9423 ?auto_9443 ) ) ( not ( = ?auto_9424 ?auto_9430 ) ) ( not ( = ?auto_9424 ?auto_9443 ) ) ( not ( = ?auto_9425 ?auto_9430 ) ) ( not ( = ?auto_9425 ?auto_9443 ) ) ( not ( = ?auto_9426 ?auto_9430 ) ) ( not ( = ?auto_9426 ?auto_9443 ) ) ( not ( = ?auto_9427 ?auto_9430 ) ) ( not ( = ?auto_9427 ?auto_9443 ) ) ( not ( = ?auto_9428 ?auto_9430 ) ) ( not ( = ?auto_9428 ?auto_9443 ) ) ( not ( = ?auto_9430 ?auto_9445 ) ) ( not ( = ?auto_9430 ?auto_9455 ) ) ( not ( = ?auto_9430 ?auto_9449 ) ) ( not ( = ?auto_9430 ?auto_9447 ) ) ( not ( = ?auto_9430 ?auto_9456 ) ) ( not ( = ?auto_9430 ?auto_9454 ) ) ( not ( = ?auto_9430 ?auto_9452 ) ) ( not ( = ?auto_9430 ?auto_9450 ) ) ( not ( = ?auto_9436 ?auto_9444 ) ) ( not ( = ?auto_9436 ?auto_9458 ) ) ( not ( = ?auto_9436 ?auto_9453 ) ) ( not ( = ?auto_9436 ?auto_9442 ) ) ( not ( = ?auto_9436 ?auto_9440 ) ) ( not ( = ?auto_9437 ?auto_9439 ) ) ( not ( = ?auto_9437 ?auto_9446 ) ) ( not ( = ?auto_9437 ?auto_9457 ) ) ( not ( = ?auto_9437 ?auto_9448 ) ) ( not ( = ?auto_9437 ?auto_9441 ) ) ( not ( = ?auto_9443 ?auto_9445 ) ) ( not ( = ?auto_9443 ?auto_9455 ) ) ( not ( = ?auto_9443 ?auto_9449 ) ) ( not ( = ?auto_9443 ?auto_9447 ) ) ( not ( = ?auto_9443 ?auto_9456 ) ) ( not ( = ?auto_9443 ?auto_9454 ) ) ( not ( = ?auto_9443 ?auto_9452 ) ) ( not ( = ?auto_9443 ?auto_9450 ) ) ( not ( = ?auto_9421 ?auto_9431 ) ) ( not ( = ?auto_9421 ?auto_9451 ) ) ( not ( = ?auto_9422 ?auto_9431 ) ) ( not ( = ?auto_9422 ?auto_9451 ) ) ( not ( = ?auto_9423 ?auto_9431 ) ) ( not ( = ?auto_9423 ?auto_9451 ) ) ( not ( = ?auto_9424 ?auto_9431 ) ) ( not ( = ?auto_9424 ?auto_9451 ) ) ( not ( = ?auto_9425 ?auto_9431 ) ) ( not ( = ?auto_9425 ?auto_9451 ) ) ( not ( = ?auto_9426 ?auto_9431 ) ) ( not ( = ?auto_9426 ?auto_9451 ) ) ( not ( = ?auto_9427 ?auto_9431 ) ) ( not ( = ?auto_9427 ?auto_9451 ) ) ( not ( = ?auto_9428 ?auto_9431 ) ) ( not ( = ?auto_9428 ?auto_9451 ) ) ( not ( = ?auto_9429 ?auto_9431 ) ) ( not ( = ?auto_9429 ?auto_9451 ) ) ( not ( = ?auto_9431 ?auto_9443 ) ) ( not ( = ?auto_9431 ?auto_9445 ) ) ( not ( = ?auto_9431 ?auto_9455 ) ) ( not ( = ?auto_9431 ?auto_9449 ) ) ( not ( = ?auto_9431 ?auto_9447 ) ) ( not ( = ?auto_9431 ?auto_9456 ) ) ( not ( = ?auto_9431 ?auto_9454 ) ) ( not ( = ?auto_9431 ?auto_9452 ) ) ( not ( = ?auto_9431 ?auto_9450 ) ) ( not ( = ?auto_9451 ?auto_9443 ) ) ( not ( = ?auto_9451 ?auto_9445 ) ) ( not ( = ?auto_9451 ?auto_9455 ) ) ( not ( = ?auto_9451 ?auto_9449 ) ) ( not ( = ?auto_9451 ?auto_9447 ) ) ( not ( = ?auto_9451 ?auto_9456 ) ) ( not ( = ?auto_9451 ?auto_9454 ) ) ( not ( = ?auto_9451 ?auto_9452 ) ) ( not ( = ?auto_9451 ?auto_9450 ) ) ( not ( = ?auto_9421 ?auto_9432 ) ) ( not ( = ?auto_9421 ?auto_9435 ) ) ( not ( = ?auto_9422 ?auto_9432 ) ) ( not ( = ?auto_9422 ?auto_9435 ) ) ( not ( = ?auto_9423 ?auto_9432 ) ) ( not ( = ?auto_9423 ?auto_9435 ) ) ( not ( = ?auto_9424 ?auto_9432 ) ) ( not ( = ?auto_9424 ?auto_9435 ) ) ( not ( = ?auto_9425 ?auto_9432 ) ) ( not ( = ?auto_9425 ?auto_9435 ) ) ( not ( = ?auto_9426 ?auto_9432 ) ) ( not ( = ?auto_9426 ?auto_9435 ) ) ( not ( = ?auto_9427 ?auto_9432 ) ) ( not ( = ?auto_9427 ?auto_9435 ) ) ( not ( = ?auto_9428 ?auto_9432 ) ) ( not ( = ?auto_9428 ?auto_9435 ) ) ( not ( = ?auto_9429 ?auto_9432 ) ) ( not ( = ?auto_9429 ?auto_9435 ) ) ( not ( = ?auto_9430 ?auto_9432 ) ) ( not ( = ?auto_9430 ?auto_9435 ) ) ( not ( = ?auto_9432 ?auto_9451 ) ) ( not ( = ?auto_9432 ?auto_9443 ) ) ( not ( = ?auto_9432 ?auto_9445 ) ) ( not ( = ?auto_9432 ?auto_9455 ) ) ( not ( = ?auto_9432 ?auto_9449 ) ) ( not ( = ?auto_9432 ?auto_9447 ) ) ( not ( = ?auto_9432 ?auto_9456 ) ) ( not ( = ?auto_9432 ?auto_9454 ) ) ( not ( = ?auto_9432 ?auto_9452 ) ) ( not ( = ?auto_9432 ?auto_9450 ) ) ( not ( = ?auto_9435 ?auto_9451 ) ) ( not ( = ?auto_9435 ?auto_9443 ) ) ( not ( = ?auto_9435 ?auto_9445 ) ) ( not ( = ?auto_9435 ?auto_9455 ) ) ( not ( = ?auto_9435 ?auto_9449 ) ) ( not ( = ?auto_9435 ?auto_9447 ) ) ( not ( = ?auto_9435 ?auto_9456 ) ) ( not ( = ?auto_9435 ?auto_9454 ) ) ( not ( = ?auto_9435 ?auto_9452 ) ) ( not ( = ?auto_9435 ?auto_9450 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_9421 ?auto_9422 ?auto_9423 ?auto_9424 ?auto_9425 ?auto_9426 ?auto_9427 ?auto_9428 ?auto_9429 ?auto_9430 ?auto_9431 )
      ( MAKE-1CRATE ?auto_9431 ?auto_9432 )
      ( MAKE-11CRATE-VERIFY ?auto_9421 ?auto_9422 ?auto_9423 ?auto_9424 ?auto_9425 ?auto_9426 ?auto_9427 ?auto_9428 ?auto_9429 ?auto_9430 ?auto_9431 ?auto_9432 ) )
  )

)

