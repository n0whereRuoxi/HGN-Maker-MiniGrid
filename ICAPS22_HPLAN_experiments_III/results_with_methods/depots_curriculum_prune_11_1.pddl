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
      ?auto_9071 - PLACE
      ?auto_9073 - HOIST
      ?auto_9068 - SURFACE
      ?auto_9076 - PLACE
      ?auto_9075 - HOIST
      ?auto_9074 - SURFACE
      ?auto_9072 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9070 ?auto_9069 ) ( IS-CRATE ?auto_9067 ) ( not ( = ?auto_9071 ?auto_9069 ) ) ( HOIST-AT ?auto_9073 ?auto_9071 ) ( AVAILABLE ?auto_9073 ) ( SURFACE-AT ?auto_9067 ?auto_9071 ) ( ON ?auto_9067 ?auto_9068 ) ( CLEAR ?auto_9067 ) ( not ( = ?auto_9066 ?auto_9067 ) ) ( not ( = ?auto_9066 ?auto_9068 ) ) ( not ( = ?auto_9067 ?auto_9068 ) ) ( not ( = ?auto_9070 ?auto_9073 ) ) ( SURFACE-AT ?auto_9065 ?auto_9069 ) ( CLEAR ?auto_9065 ) ( IS-CRATE ?auto_9066 ) ( AVAILABLE ?auto_9070 ) ( not ( = ?auto_9076 ?auto_9069 ) ) ( HOIST-AT ?auto_9075 ?auto_9076 ) ( AVAILABLE ?auto_9075 ) ( SURFACE-AT ?auto_9066 ?auto_9076 ) ( ON ?auto_9066 ?auto_9074 ) ( CLEAR ?auto_9066 ) ( TRUCK-AT ?auto_9072 ?auto_9069 ) ( not ( = ?auto_9065 ?auto_9066 ) ) ( not ( = ?auto_9065 ?auto_9074 ) ) ( not ( = ?auto_9066 ?auto_9074 ) ) ( not ( = ?auto_9070 ?auto_9075 ) ) ( not ( = ?auto_9065 ?auto_9067 ) ) ( not ( = ?auto_9065 ?auto_9068 ) ) ( not ( = ?auto_9067 ?auto_9074 ) ) ( not ( = ?auto_9071 ?auto_9076 ) ) ( not ( = ?auto_9073 ?auto_9075 ) ) ( not ( = ?auto_9068 ?auto_9074 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9065 ?auto_9066 )
      ( MAKE-1CRATE ?auto_9066 ?auto_9067 )
      ( MAKE-2CRATE-VERIFY ?auto_9065 ?auto_9066 ?auto_9067 ) )
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
      ?auto_9096 - PLACE
      ?auto_9099 - PLACE
      ?auto_9100 - HOIST
      ?auto_9098 - SURFACE
      ?auto_9105 - PLACE
      ?auto_9101 - HOIST
      ?auto_9106 - SURFACE
      ?auto_9103 - PLACE
      ?auto_9104 - HOIST
      ?auto_9102 - SURFACE
      ?auto_9095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9097 ?auto_9096 ) ( IS-CRATE ?auto_9094 ) ( not ( = ?auto_9099 ?auto_9096 ) ) ( HOIST-AT ?auto_9100 ?auto_9099 ) ( AVAILABLE ?auto_9100 ) ( SURFACE-AT ?auto_9094 ?auto_9099 ) ( ON ?auto_9094 ?auto_9098 ) ( CLEAR ?auto_9094 ) ( not ( = ?auto_9093 ?auto_9094 ) ) ( not ( = ?auto_9093 ?auto_9098 ) ) ( not ( = ?auto_9094 ?auto_9098 ) ) ( not ( = ?auto_9097 ?auto_9100 ) ) ( IS-CRATE ?auto_9093 ) ( not ( = ?auto_9105 ?auto_9096 ) ) ( HOIST-AT ?auto_9101 ?auto_9105 ) ( AVAILABLE ?auto_9101 ) ( SURFACE-AT ?auto_9093 ?auto_9105 ) ( ON ?auto_9093 ?auto_9106 ) ( CLEAR ?auto_9093 ) ( not ( = ?auto_9092 ?auto_9093 ) ) ( not ( = ?auto_9092 ?auto_9106 ) ) ( not ( = ?auto_9093 ?auto_9106 ) ) ( not ( = ?auto_9097 ?auto_9101 ) ) ( SURFACE-AT ?auto_9091 ?auto_9096 ) ( CLEAR ?auto_9091 ) ( IS-CRATE ?auto_9092 ) ( AVAILABLE ?auto_9097 ) ( not ( = ?auto_9103 ?auto_9096 ) ) ( HOIST-AT ?auto_9104 ?auto_9103 ) ( AVAILABLE ?auto_9104 ) ( SURFACE-AT ?auto_9092 ?auto_9103 ) ( ON ?auto_9092 ?auto_9102 ) ( CLEAR ?auto_9092 ) ( TRUCK-AT ?auto_9095 ?auto_9096 ) ( not ( = ?auto_9091 ?auto_9092 ) ) ( not ( = ?auto_9091 ?auto_9102 ) ) ( not ( = ?auto_9092 ?auto_9102 ) ) ( not ( = ?auto_9097 ?auto_9104 ) ) ( not ( = ?auto_9091 ?auto_9093 ) ) ( not ( = ?auto_9091 ?auto_9106 ) ) ( not ( = ?auto_9093 ?auto_9102 ) ) ( not ( = ?auto_9105 ?auto_9103 ) ) ( not ( = ?auto_9101 ?auto_9104 ) ) ( not ( = ?auto_9106 ?auto_9102 ) ) ( not ( = ?auto_9091 ?auto_9094 ) ) ( not ( = ?auto_9091 ?auto_9098 ) ) ( not ( = ?auto_9092 ?auto_9094 ) ) ( not ( = ?auto_9092 ?auto_9098 ) ) ( not ( = ?auto_9094 ?auto_9106 ) ) ( not ( = ?auto_9094 ?auto_9102 ) ) ( not ( = ?auto_9099 ?auto_9105 ) ) ( not ( = ?auto_9099 ?auto_9103 ) ) ( not ( = ?auto_9100 ?auto_9101 ) ) ( not ( = ?auto_9100 ?auto_9104 ) ) ( not ( = ?auto_9098 ?auto_9106 ) ) ( not ( = ?auto_9098 ?auto_9102 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9091 ?auto_9092 ?auto_9093 )
      ( MAKE-1CRATE ?auto_9093 ?auto_9094 )
      ( MAKE-3CRATE-VERIFY ?auto_9091 ?auto_9092 ?auto_9093 ?auto_9094 ) )
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
      ?auto_9132 - HOIST
      ?auto_9127 - PLACE
      ?auto_9128 - PLACE
      ?auto_9130 - HOIST
      ?auto_9131 - SURFACE
      ?auto_9137 - PLACE
      ?auto_9138 - HOIST
      ?auto_9140 - SURFACE
      ?auto_9135 - PLACE
      ?auto_9141 - HOIST
      ?auto_9133 - SURFACE
      ?auto_9139 - PLACE
      ?auto_9136 - HOIST
      ?auto_9134 - SURFACE
      ?auto_9129 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9132 ?auto_9127 ) ( IS-CRATE ?auto_9126 ) ( not ( = ?auto_9128 ?auto_9127 ) ) ( HOIST-AT ?auto_9130 ?auto_9128 ) ( AVAILABLE ?auto_9130 ) ( SURFACE-AT ?auto_9126 ?auto_9128 ) ( ON ?auto_9126 ?auto_9131 ) ( CLEAR ?auto_9126 ) ( not ( = ?auto_9125 ?auto_9126 ) ) ( not ( = ?auto_9125 ?auto_9131 ) ) ( not ( = ?auto_9126 ?auto_9131 ) ) ( not ( = ?auto_9132 ?auto_9130 ) ) ( IS-CRATE ?auto_9125 ) ( not ( = ?auto_9137 ?auto_9127 ) ) ( HOIST-AT ?auto_9138 ?auto_9137 ) ( AVAILABLE ?auto_9138 ) ( SURFACE-AT ?auto_9125 ?auto_9137 ) ( ON ?auto_9125 ?auto_9140 ) ( CLEAR ?auto_9125 ) ( not ( = ?auto_9124 ?auto_9125 ) ) ( not ( = ?auto_9124 ?auto_9140 ) ) ( not ( = ?auto_9125 ?auto_9140 ) ) ( not ( = ?auto_9132 ?auto_9138 ) ) ( IS-CRATE ?auto_9124 ) ( not ( = ?auto_9135 ?auto_9127 ) ) ( HOIST-AT ?auto_9141 ?auto_9135 ) ( AVAILABLE ?auto_9141 ) ( SURFACE-AT ?auto_9124 ?auto_9135 ) ( ON ?auto_9124 ?auto_9133 ) ( CLEAR ?auto_9124 ) ( not ( = ?auto_9123 ?auto_9124 ) ) ( not ( = ?auto_9123 ?auto_9133 ) ) ( not ( = ?auto_9124 ?auto_9133 ) ) ( not ( = ?auto_9132 ?auto_9141 ) ) ( SURFACE-AT ?auto_9122 ?auto_9127 ) ( CLEAR ?auto_9122 ) ( IS-CRATE ?auto_9123 ) ( AVAILABLE ?auto_9132 ) ( not ( = ?auto_9139 ?auto_9127 ) ) ( HOIST-AT ?auto_9136 ?auto_9139 ) ( AVAILABLE ?auto_9136 ) ( SURFACE-AT ?auto_9123 ?auto_9139 ) ( ON ?auto_9123 ?auto_9134 ) ( CLEAR ?auto_9123 ) ( TRUCK-AT ?auto_9129 ?auto_9127 ) ( not ( = ?auto_9122 ?auto_9123 ) ) ( not ( = ?auto_9122 ?auto_9134 ) ) ( not ( = ?auto_9123 ?auto_9134 ) ) ( not ( = ?auto_9132 ?auto_9136 ) ) ( not ( = ?auto_9122 ?auto_9124 ) ) ( not ( = ?auto_9122 ?auto_9133 ) ) ( not ( = ?auto_9124 ?auto_9134 ) ) ( not ( = ?auto_9135 ?auto_9139 ) ) ( not ( = ?auto_9141 ?auto_9136 ) ) ( not ( = ?auto_9133 ?auto_9134 ) ) ( not ( = ?auto_9122 ?auto_9125 ) ) ( not ( = ?auto_9122 ?auto_9140 ) ) ( not ( = ?auto_9123 ?auto_9125 ) ) ( not ( = ?auto_9123 ?auto_9140 ) ) ( not ( = ?auto_9125 ?auto_9133 ) ) ( not ( = ?auto_9125 ?auto_9134 ) ) ( not ( = ?auto_9137 ?auto_9135 ) ) ( not ( = ?auto_9137 ?auto_9139 ) ) ( not ( = ?auto_9138 ?auto_9141 ) ) ( not ( = ?auto_9138 ?auto_9136 ) ) ( not ( = ?auto_9140 ?auto_9133 ) ) ( not ( = ?auto_9140 ?auto_9134 ) ) ( not ( = ?auto_9122 ?auto_9126 ) ) ( not ( = ?auto_9122 ?auto_9131 ) ) ( not ( = ?auto_9123 ?auto_9126 ) ) ( not ( = ?auto_9123 ?auto_9131 ) ) ( not ( = ?auto_9124 ?auto_9126 ) ) ( not ( = ?auto_9124 ?auto_9131 ) ) ( not ( = ?auto_9126 ?auto_9140 ) ) ( not ( = ?auto_9126 ?auto_9133 ) ) ( not ( = ?auto_9126 ?auto_9134 ) ) ( not ( = ?auto_9128 ?auto_9137 ) ) ( not ( = ?auto_9128 ?auto_9135 ) ) ( not ( = ?auto_9128 ?auto_9139 ) ) ( not ( = ?auto_9130 ?auto_9138 ) ) ( not ( = ?auto_9130 ?auto_9141 ) ) ( not ( = ?auto_9130 ?auto_9136 ) ) ( not ( = ?auto_9131 ?auto_9140 ) ) ( not ( = ?auto_9131 ?auto_9133 ) ) ( not ( = ?auto_9131 ?auto_9134 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_9122 ?auto_9123 ?auto_9124 ?auto_9125 )
      ( MAKE-1CRATE ?auto_9125 ?auto_9126 )
      ( MAKE-4CRATE-VERIFY ?auto_9122 ?auto_9123 ?auto_9124 ?auto_9125 ?auto_9126 ) )
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
      ?auto_9168 - PLACE
      ?auto_9164 - PLACE
      ?auto_9166 - HOIST
      ?auto_9169 - SURFACE
      ?auto_9176 - PLACE
      ?auto_9172 - HOIST
      ?auto_9174 - SURFACE
      ?auto_9179 - SURFACE
      ?auto_9173 - PLACE
      ?auto_9170 - HOIST
      ?auto_9171 - SURFACE
      ?auto_9175 - PLACE
      ?auto_9178 - HOIST
      ?auto_9177 - SURFACE
      ?auto_9167 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9165 ?auto_9168 ) ( IS-CRATE ?auto_9163 ) ( not ( = ?auto_9164 ?auto_9168 ) ) ( HOIST-AT ?auto_9166 ?auto_9164 ) ( SURFACE-AT ?auto_9163 ?auto_9164 ) ( ON ?auto_9163 ?auto_9169 ) ( CLEAR ?auto_9163 ) ( not ( = ?auto_9162 ?auto_9163 ) ) ( not ( = ?auto_9162 ?auto_9169 ) ) ( not ( = ?auto_9163 ?auto_9169 ) ) ( not ( = ?auto_9165 ?auto_9166 ) ) ( IS-CRATE ?auto_9162 ) ( not ( = ?auto_9176 ?auto_9168 ) ) ( HOIST-AT ?auto_9172 ?auto_9176 ) ( AVAILABLE ?auto_9172 ) ( SURFACE-AT ?auto_9162 ?auto_9176 ) ( ON ?auto_9162 ?auto_9174 ) ( CLEAR ?auto_9162 ) ( not ( = ?auto_9161 ?auto_9162 ) ) ( not ( = ?auto_9161 ?auto_9174 ) ) ( not ( = ?auto_9162 ?auto_9174 ) ) ( not ( = ?auto_9165 ?auto_9172 ) ) ( IS-CRATE ?auto_9161 ) ( AVAILABLE ?auto_9166 ) ( SURFACE-AT ?auto_9161 ?auto_9164 ) ( ON ?auto_9161 ?auto_9179 ) ( CLEAR ?auto_9161 ) ( not ( = ?auto_9160 ?auto_9161 ) ) ( not ( = ?auto_9160 ?auto_9179 ) ) ( not ( = ?auto_9161 ?auto_9179 ) ) ( IS-CRATE ?auto_9160 ) ( not ( = ?auto_9173 ?auto_9168 ) ) ( HOIST-AT ?auto_9170 ?auto_9173 ) ( AVAILABLE ?auto_9170 ) ( SURFACE-AT ?auto_9160 ?auto_9173 ) ( ON ?auto_9160 ?auto_9171 ) ( CLEAR ?auto_9160 ) ( not ( = ?auto_9159 ?auto_9160 ) ) ( not ( = ?auto_9159 ?auto_9171 ) ) ( not ( = ?auto_9160 ?auto_9171 ) ) ( not ( = ?auto_9165 ?auto_9170 ) ) ( SURFACE-AT ?auto_9158 ?auto_9168 ) ( CLEAR ?auto_9158 ) ( IS-CRATE ?auto_9159 ) ( AVAILABLE ?auto_9165 ) ( not ( = ?auto_9175 ?auto_9168 ) ) ( HOIST-AT ?auto_9178 ?auto_9175 ) ( AVAILABLE ?auto_9178 ) ( SURFACE-AT ?auto_9159 ?auto_9175 ) ( ON ?auto_9159 ?auto_9177 ) ( CLEAR ?auto_9159 ) ( TRUCK-AT ?auto_9167 ?auto_9168 ) ( not ( = ?auto_9158 ?auto_9159 ) ) ( not ( = ?auto_9158 ?auto_9177 ) ) ( not ( = ?auto_9159 ?auto_9177 ) ) ( not ( = ?auto_9165 ?auto_9178 ) ) ( not ( = ?auto_9158 ?auto_9160 ) ) ( not ( = ?auto_9158 ?auto_9171 ) ) ( not ( = ?auto_9160 ?auto_9177 ) ) ( not ( = ?auto_9173 ?auto_9175 ) ) ( not ( = ?auto_9170 ?auto_9178 ) ) ( not ( = ?auto_9171 ?auto_9177 ) ) ( not ( = ?auto_9158 ?auto_9161 ) ) ( not ( = ?auto_9158 ?auto_9179 ) ) ( not ( = ?auto_9159 ?auto_9161 ) ) ( not ( = ?auto_9159 ?auto_9179 ) ) ( not ( = ?auto_9161 ?auto_9171 ) ) ( not ( = ?auto_9161 ?auto_9177 ) ) ( not ( = ?auto_9164 ?auto_9173 ) ) ( not ( = ?auto_9164 ?auto_9175 ) ) ( not ( = ?auto_9166 ?auto_9170 ) ) ( not ( = ?auto_9166 ?auto_9178 ) ) ( not ( = ?auto_9179 ?auto_9171 ) ) ( not ( = ?auto_9179 ?auto_9177 ) ) ( not ( = ?auto_9158 ?auto_9162 ) ) ( not ( = ?auto_9158 ?auto_9174 ) ) ( not ( = ?auto_9159 ?auto_9162 ) ) ( not ( = ?auto_9159 ?auto_9174 ) ) ( not ( = ?auto_9160 ?auto_9162 ) ) ( not ( = ?auto_9160 ?auto_9174 ) ) ( not ( = ?auto_9162 ?auto_9179 ) ) ( not ( = ?auto_9162 ?auto_9171 ) ) ( not ( = ?auto_9162 ?auto_9177 ) ) ( not ( = ?auto_9176 ?auto_9164 ) ) ( not ( = ?auto_9176 ?auto_9173 ) ) ( not ( = ?auto_9176 ?auto_9175 ) ) ( not ( = ?auto_9172 ?auto_9166 ) ) ( not ( = ?auto_9172 ?auto_9170 ) ) ( not ( = ?auto_9172 ?auto_9178 ) ) ( not ( = ?auto_9174 ?auto_9179 ) ) ( not ( = ?auto_9174 ?auto_9171 ) ) ( not ( = ?auto_9174 ?auto_9177 ) ) ( not ( = ?auto_9158 ?auto_9163 ) ) ( not ( = ?auto_9158 ?auto_9169 ) ) ( not ( = ?auto_9159 ?auto_9163 ) ) ( not ( = ?auto_9159 ?auto_9169 ) ) ( not ( = ?auto_9160 ?auto_9163 ) ) ( not ( = ?auto_9160 ?auto_9169 ) ) ( not ( = ?auto_9161 ?auto_9163 ) ) ( not ( = ?auto_9161 ?auto_9169 ) ) ( not ( = ?auto_9163 ?auto_9174 ) ) ( not ( = ?auto_9163 ?auto_9179 ) ) ( not ( = ?auto_9163 ?auto_9171 ) ) ( not ( = ?auto_9163 ?auto_9177 ) ) ( not ( = ?auto_9169 ?auto_9174 ) ) ( not ( = ?auto_9169 ?auto_9179 ) ) ( not ( = ?auto_9169 ?auto_9171 ) ) ( not ( = ?auto_9169 ?auto_9177 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_9158 ?auto_9159 ?auto_9160 ?auto_9161 ?auto_9162 )
      ( MAKE-1CRATE ?auto_9162 ?auto_9163 )
      ( MAKE-5CRATE-VERIFY ?auto_9158 ?auto_9159 ?auto_9160 ?auto_9161 ?auto_9162 ?auto_9163 ) )
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
      ?auto_9204 - HOIST
      ?auto_9207 - PLACE
      ?auto_9205 - PLACE
      ?auto_9206 - HOIST
      ?auto_9209 - SURFACE
      ?auto_9210 - PLACE
      ?auto_9215 - HOIST
      ?auto_9213 - SURFACE
      ?auto_9211 - PLACE
      ?auto_9220 - HOIST
      ?auto_9212 - SURFACE
      ?auto_9218 - SURFACE
      ?auto_9219 - SURFACE
      ?auto_9217 - PLACE
      ?auto_9214 - HOIST
      ?auto_9216 - SURFACE
      ?auto_9208 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9204 ?auto_9207 ) ( IS-CRATE ?auto_9203 ) ( not ( = ?auto_9205 ?auto_9207 ) ) ( HOIST-AT ?auto_9206 ?auto_9205 ) ( SURFACE-AT ?auto_9203 ?auto_9205 ) ( ON ?auto_9203 ?auto_9209 ) ( CLEAR ?auto_9203 ) ( not ( = ?auto_9202 ?auto_9203 ) ) ( not ( = ?auto_9202 ?auto_9209 ) ) ( not ( = ?auto_9203 ?auto_9209 ) ) ( not ( = ?auto_9204 ?auto_9206 ) ) ( IS-CRATE ?auto_9202 ) ( not ( = ?auto_9210 ?auto_9207 ) ) ( HOIST-AT ?auto_9215 ?auto_9210 ) ( SURFACE-AT ?auto_9202 ?auto_9210 ) ( ON ?auto_9202 ?auto_9213 ) ( CLEAR ?auto_9202 ) ( not ( = ?auto_9201 ?auto_9202 ) ) ( not ( = ?auto_9201 ?auto_9213 ) ) ( not ( = ?auto_9202 ?auto_9213 ) ) ( not ( = ?auto_9204 ?auto_9215 ) ) ( IS-CRATE ?auto_9201 ) ( not ( = ?auto_9211 ?auto_9207 ) ) ( HOIST-AT ?auto_9220 ?auto_9211 ) ( AVAILABLE ?auto_9220 ) ( SURFACE-AT ?auto_9201 ?auto_9211 ) ( ON ?auto_9201 ?auto_9212 ) ( CLEAR ?auto_9201 ) ( not ( = ?auto_9200 ?auto_9201 ) ) ( not ( = ?auto_9200 ?auto_9212 ) ) ( not ( = ?auto_9201 ?auto_9212 ) ) ( not ( = ?auto_9204 ?auto_9220 ) ) ( IS-CRATE ?auto_9200 ) ( AVAILABLE ?auto_9215 ) ( SURFACE-AT ?auto_9200 ?auto_9210 ) ( ON ?auto_9200 ?auto_9218 ) ( CLEAR ?auto_9200 ) ( not ( = ?auto_9199 ?auto_9200 ) ) ( not ( = ?auto_9199 ?auto_9218 ) ) ( not ( = ?auto_9200 ?auto_9218 ) ) ( IS-CRATE ?auto_9199 ) ( AVAILABLE ?auto_9206 ) ( SURFACE-AT ?auto_9199 ?auto_9205 ) ( ON ?auto_9199 ?auto_9219 ) ( CLEAR ?auto_9199 ) ( not ( = ?auto_9198 ?auto_9199 ) ) ( not ( = ?auto_9198 ?auto_9219 ) ) ( not ( = ?auto_9199 ?auto_9219 ) ) ( SURFACE-AT ?auto_9197 ?auto_9207 ) ( CLEAR ?auto_9197 ) ( IS-CRATE ?auto_9198 ) ( AVAILABLE ?auto_9204 ) ( not ( = ?auto_9217 ?auto_9207 ) ) ( HOIST-AT ?auto_9214 ?auto_9217 ) ( AVAILABLE ?auto_9214 ) ( SURFACE-AT ?auto_9198 ?auto_9217 ) ( ON ?auto_9198 ?auto_9216 ) ( CLEAR ?auto_9198 ) ( TRUCK-AT ?auto_9208 ?auto_9207 ) ( not ( = ?auto_9197 ?auto_9198 ) ) ( not ( = ?auto_9197 ?auto_9216 ) ) ( not ( = ?auto_9198 ?auto_9216 ) ) ( not ( = ?auto_9204 ?auto_9214 ) ) ( not ( = ?auto_9197 ?auto_9199 ) ) ( not ( = ?auto_9197 ?auto_9219 ) ) ( not ( = ?auto_9199 ?auto_9216 ) ) ( not ( = ?auto_9205 ?auto_9217 ) ) ( not ( = ?auto_9206 ?auto_9214 ) ) ( not ( = ?auto_9219 ?auto_9216 ) ) ( not ( = ?auto_9197 ?auto_9200 ) ) ( not ( = ?auto_9197 ?auto_9218 ) ) ( not ( = ?auto_9198 ?auto_9200 ) ) ( not ( = ?auto_9198 ?auto_9218 ) ) ( not ( = ?auto_9200 ?auto_9219 ) ) ( not ( = ?auto_9200 ?auto_9216 ) ) ( not ( = ?auto_9210 ?auto_9205 ) ) ( not ( = ?auto_9210 ?auto_9217 ) ) ( not ( = ?auto_9215 ?auto_9206 ) ) ( not ( = ?auto_9215 ?auto_9214 ) ) ( not ( = ?auto_9218 ?auto_9219 ) ) ( not ( = ?auto_9218 ?auto_9216 ) ) ( not ( = ?auto_9197 ?auto_9201 ) ) ( not ( = ?auto_9197 ?auto_9212 ) ) ( not ( = ?auto_9198 ?auto_9201 ) ) ( not ( = ?auto_9198 ?auto_9212 ) ) ( not ( = ?auto_9199 ?auto_9201 ) ) ( not ( = ?auto_9199 ?auto_9212 ) ) ( not ( = ?auto_9201 ?auto_9218 ) ) ( not ( = ?auto_9201 ?auto_9219 ) ) ( not ( = ?auto_9201 ?auto_9216 ) ) ( not ( = ?auto_9211 ?auto_9210 ) ) ( not ( = ?auto_9211 ?auto_9205 ) ) ( not ( = ?auto_9211 ?auto_9217 ) ) ( not ( = ?auto_9220 ?auto_9215 ) ) ( not ( = ?auto_9220 ?auto_9206 ) ) ( not ( = ?auto_9220 ?auto_9214 ) ) ( not ( = ?auto_9212 ?auto_9218 ) ) ( not ( = ?auto_9212 ?auto_9219 ) ) ( not ( = ?auto_9212 ?auto_9216 ) ) ( not ( = ?auto_9197 ?auto_9202 ) ) ( not ( = ?auto_9197 ?auto_9213 ) ) ( not ( = ?auto_9198 ?auto_9202 ) ) ( not ( = ?auto_9198 ?auto_9213 ) ) ( not ( = ?auto_9199 ?auto_9202 ) ) ( not ( = ?auto_9199 ?auto_9213 ) ) ( not ( = ?auto_9200 ?auto_9202 ) ) ( not ( = ?auto_9200 ?auto_9213 ) ) ( not ( = ?auto_9202 ?auto_9212 ) ) ( not ( = ?auto_9202 ?auto_9218 ) ) ( not ( = ?auto_9202 ?auto_9219 ) ) ( not ( = ?auto_9202 ?auto_9216 ) ) ( not ( = ?auto_9213 ?auto_9212 ) ) ( not ( = ?auto_9213 ?auto_9218 ) ) ( not ( = ?auto_9213 ?auto_9219 ) ) ( not ( = ?auto_9213 ?auto_9216 ) ) ( not ( = ?auto_9197 ?auto_9203 ) ) ( not ( = ?auto_9197 ?auto_9209 ) ) ( not ( = ?auto_9198 ?auto_9203 ) ) ( not ( = ?auto_9198 ?auto_9209 ) ) ( not ( = ?auto_9199 ?auto_9203 ) ) ( not ( = ?auto_9199 ?auto_9209 ) ) ( not ( = ?auto_9200 ?auto_9203 ) ) ( not ( = ?auto_9200 ?auto_9209 ) ) ( not ( = ?auto_9201 ?auto_9203 ) ) ( not ( = ?auto_9201 ?auto_9209 ) ) ( not ( = ?auto_9203 ?auto_9213 ) ) ( not ( = ?auto_9203 ?auto_9212 ) ) ( not ( = ?auto_9203 ?auto_9218 ) ) ( not ( = ?auto_9203 ?auto_9219 ) ) ( not ( = ?auto_9203 ?auto_9216 ) ) ( not ( = ?auto_9209 ?auto_9213 ) ) ( not ( = ?auto_9209 ?auto_9212 ) ) ( not ( = ?auto_9209 ?auto_9218 ) ) ( not ( = ?auto_9209 ?auto_9219 ) ) ( not ( = ?auto_9209 ?auto_9216 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_9197 ?auto_9198 ?auto_9199 ?auto_9200 ?auto_9201 ?auto_9202 )
      ( MAKE-1CRATE ?auto_9202 ?auto_9203 )
      ( MAKE-6CRATE-VERIFY ?auto_9197 ?auto_9198 ?auto_9199 ?auto_9200 ?auto_9201 ?auto_9202 ?auto_9203 ) )
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
      ?auto_9250 - HOIST
      ?auto_9247 - PLACE
      ?auto_9248 - PLACE
      ?auto_9249 - HOIST
      ?auto_9252 - SURFACE
      ?auto_9261 - PLACE
      ?auto_9262 - HOIST
      ?auto_9253 - SURFACE
      ?auto_9256 - PLACE
      ?auto_9257 - HOIST
      ?auto_9258 - SURFACE
      ?auto_9264 - PLACE
      ?auto_9255 - HOIST
      ?auto_9260 - SURFACE
      ?auto_9254 - SURFACE
      ?auto_9263 - SURFACE
      ?auto_9259 - PLACE
      ?auto_9265 - HOIST
      ?auto_9266 - SURFACE
      ?auto_9251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9250 ?auto_9247 ) ( IS-CRATE ?auto_9246 ) ( not ( = ?auto_9248 ?auto_9247 ) ) ( HOIST-AT ?auto_9249 ?auto_9248 ) ( AVAILABLE ?auto_9249 ) ( SURFACE-AT ?auto_9246 ?auto_9248 ) ( ON ?auto_9246 ?auto_9252 ) ( CLEAR ?auto_9246 ) ( not ( = ?auto_9245 ?auto_9246 ) ) ( not ( = ?auto_9245 ?auto_9252 ) ) ( not ( = ?auto_9246 ?auto_9252 ) ) ( not ( = ?auto_9250 ?auto_9249 ) ) ( IS-CRATE ?auto_9245 ) ( not ( = ?auto_9261 ?auto_9247 ) ) ( HOIST-AT ?auto_9262 ?auto_9261 ) ( SURFACE-AT ?auto_9245 ?auto_9261 ) ( ON ?auto_9245 ?auto_9253 ) ( CLEAR ?auto_9245 ) ( not ( = ?auto_9244 ?auto_9245 ) ) ( not ( = ?auto_9244 ?auto_9253 ) ) ( not ( = ?auto_9245 ?auto_9253 ) ) ( not ( = ?auto_9250 ?auto_9262 ) ) ( IS-CRATE ?auto_9244 ) ( not ( = ?auto_9256 ?auto_9247 ) ) ( HOIST-AT ?auto_9257 ?auto_9256 ) ( SURFACE-AT ?auto_9244 ?auto_9256 ) ( ON ?auto_9244 ?auto_9258 ) ( CLEAR ?auto_9244 ) ( not ( = ?auto_9243 ?auto_9244 ) ) ( not ( = ?auto_9243 ?auto_9258 ) ) ( not ( = ?auto_9244 ?auto_9258 ) ) ( not ( = ?auto_9250 ?auto_9257 ) ) ( IS-CRATE ?auto_9243 ) ( not ( = ?auto_9264 ?auto_9247 ) ) ( HOIST-AT ?auto_9255 ?auto_9264 ) ( AVAILABLE ?auto_9255 ) ( SURFACE-AT ?auto_9243 ?auto_9264 ) ( ON ?auto_9243 ?auto_9260 ) ( CLEAR ?auto_9243 ) ( not ( = ?auto_9242 ?auto_9243 ) ) ( not ( = ?auto_9242 ?auto_9260 ) ) ( not ( = ?auto_9243 ?auto_9260 ) ) ( not ( = ?auto_9250 ?auto_9255 ) ) ( IS-CRATE ?auto_9242 ) ( AVAILABLE ?auto_9257 ) ( SURFACE-AT ?auto_9242 ?auto_9256 ) ( ON ?auto_9242 ?auto_9254 ) ( CLEAR ?auto_9242 ) ( not ( = ?auto_9241 ?auto_9242 ) ) ( not ( = ?auto_9241 ?auto_9254 ) ) ( not ( = ?auto_9242 ?auto_9254 ) ) ( IS-CRATE ?auto_9241 ) ( AVAILABLE ?auto_9262 ) ( SURFACE-AT ?auto_9241 ?auto_9261 ) ( ON ?auto_9241 ?auto_9263 ) ( CLEAR ?auto_9241 ) ( not ( = ?auto_9240 ?auto_9241 ) ) ( not ( = ?auto_9240 ?auto_9263 ) ) ( not ( = ?auto_9241 ?auto_9263 ) ) ( SURFACE-AT ?auto_9239 ?auto_9247 ) ( CLEAR ?auto_9239 ) ( IS-CRATE ?auto_9240 ) ( AVAILABLE ?auto_9250 ) ( not ( = ?auto_9259 ?auto_9247 ) ) ( HOIST-AT ?auto_9265 ?auto_9259 ) ( AVAILABLE ?auto_9265 ) ( SURFACE-AT ?auto_9240 ?auto_9259 ) ( ON ?auto_9240 ?auto_9266 ) ( CLEAR ?auto_9240 ) ( TRUCK-AT ?auto_9251 ?auto_9247 ) ( not ( = ?auto_9239 ?auto_9240 ) ) ( not ( = ?auto_9239 ?auto_9266 ) ) ( not ( = ?auto_9240 ?auto_9266 ) ) ( not ( = ?auto_9250 ?auto_9265 ) ) ( not ( = ?auto_9239 ?auto_9241 ) ) ( not ( = ?auto_9239 ?auto_9263 ) ) ( not ( = ?auto_9241 ?auto_9266 ) ) ( not ( = ?auto_9261 ?auto_9259 ) ) ( not ( = ?auto_9262 ?auto_9265 ) ) ( not ( = ?auto_9263 ?auto_9266 ) ) ( not ( = ?auto_9239 ?auto_9242 ) ) ( not ( = ?auto_9239 ?auto_9254 ) ) ( not ( = ?auto_9240 ?auto_9242 ) ) ( not ( = ?auto_9240 ?auto_9254 ) ) ( not ( = ?auto_9242 ?auto_9263 ) ) ( not ( = ?auto_9242 ?auto_9266 ) ) ( not ( = ?auto_9256 ?auto_9261 ) ) ( not ( = ?auto_9256 ?auto_9259 ) ) ( not ( = ?auto_9257 ?auto_9262 ) ) ( not ( = ?auto_9257 ?auto_9265 ) ) ( not ( = ?auto_9254 ?auto_9263 ) ) ( not ( = ?auto_9254 ?auto_9266 ) ) ( not ( = ?auto_9239 ?auto_9243 ) ) ( not ( = ?auto_9239 ?auto_9260 ) ) ( not ( = ?auto_9240 ?auto_9243 ) ) ( not ( = ?auto_9240 ?auto_9260 ) ) ( not ( = ?auto_9241 ?auto_9243 ) ) ( not ( = ?auto_9241 ?auto_9260 ) ) ( not ( = ?auto_9243 ?auto_9254 ) ) ( not ( = ?auto_9243 ?auto_9263 ) ) ( not ( = ?auto_9243 ?auto_9266 ) ) ( not ( = ?auto_9264 ?auto_9256 ) ) ( not ( = ?auto_9264 ?auto_9261 ) ) ( not ( = ?auto_9264 ?auto_9259 ) ) ( not ( = ?auto_9255 ?auto_9257 ) ) ( not ( = ?auto_9255 ?auto_9262 ) ) ( not ( = ?auto_9255 ?auto_9265 ) ) ( not ( = ?auto_9260 ?auto_9254 ) ) ( not ( = ?auto_9260 ?auto_9263 ) ) ( not ( = ?auto_9260 ?auto_9266 ) ) ( not ( = ?auto_9239 ?auto_9244 ) ) ( not ( = ?auto_9239 ?auto_9258 ) ) ( not ( = ?auto_9240 ?auto_9244 ) ) ( not ( = ?auto_9240 ?auto_9258 ) ) ( not ( = ?auto_9241 ?auto_9244 ) ) ( not ( = ?auto_9241 ?auto_9258 ) ) ( not ( = ?auto_9242 ?auto_9244 ) ) ( not ( = ?auto_9242 ?auto_9258 ) ) ( not ( = ?auto_9244 ?auto_9260 ) ) ( not ( = ?auto_9244 ?auto_9254 ) ) ( not ( = ?auto_9244 ?auto_9263 ) ) ( not ( = ?auto_9244 ?auto_9266 ) ) ( not ( = ?auto_9258 ?auto_9260 ) ) ( not ( = ?auto_9258 ?auto_9254 ) ) ( not ( = ?auto_9258 ?auto_9263 ) ) ( not ( = ?auto_9258 ?auto_9266 ) ) ( not ( = ?auto_9239 ?auto_9245 ) ) ( not ( = ?auto_9239 ?auto_9253 ) ) ( not ( = ?auto_9240 ?auto_9245 ) ) ( not ( = ?auto_9240 ?auto_9253 ) ) ( not ( = ?auto_9241 ?auto_9245 ) ) ( not ( = ?auto_9241 ?auto_9253 ) ) ( not ( = ?auto_9242 ?auto_9245 ) ) ( not ( = ?auto_9242 ?auto_9253 ) ) ( not ( = ?auto_9243 ?auto_9245 ) ) ( not ( = ?auto_9243 ?auto_9253 ) ) ( not ( = ?auto_9245 ?auto_9258 ) ) ( not ( = ?auto_9245 ?auto_9260 ) ) ( not ( = ?auto_9245 ?auto_9254 ) ) ( not ( = ?auto_9245 ?auto_9263 ) ) ( not ( = ?auto_9245 ?auto_9266 ) ) ( not ( = ?auto_9253 ?auto_9258 ) ) ( not ( = ?auto_9253 ?auto_9260 ) ) ( not ( = ?auto_9253 ?auto_9254 ) ) ( not ( = ?auto_9253 ?auto_9263 ) ) ( not ( = ?auto_9253 ?auto_9266 ) ) ( not ( = ?auto_9239 ?auto_9246 ) ) ( not ( = ?auto_9239 ?auto_9252 ) ) ( not ( = ?auto_9240 ?auto_9246 ) ) ( not ( = ?auto_9240 ?auto_9252 ) ) ( not ( = ?auto_9241 ?auto_9246 ) ) ( not ( = ?auto_9241 ?auto_9252 ) ) ( not ( = ?auto_9242 ?auto_9246 ) ) ( not ( = ?auto_9242 ?auto_9252 ) ) ( not ( = ?auto_9243 ?auto_9246 ) ) ( not ( = ?auto_9243 ?auto_9252 ) ) ( not ( = ?auto_9244 ?auto_9246 ) ) ( not ( = ?auto_9244 ?auto_9252 ) ) ( not ( = ?auto_9246 ?auto_9253 ) ) ( not ( = ?auto_9246 ?auto_9258 ) ) ( not ( = ?auto_9246 ?auto_9260 ) ) ( not ( = ?auto_9246 ?auto_9254 ) ) ( not ( = ?auto_9246 ?auto_9263 ) ) ( not ( = ?auto_9246 ?auto_9266 ) ) ( not ( = ?auto_9248 ?auto_9261 ) ) ( not ( = ?auto_9248 ?auto_9256 ) ) ( not ( = ?auto_9248 ?auto_9264 ) ) ( not ( = ?auto_9248 ?auto_9259 ) ) ( not ( = ?auto_9249 ?auto_9262 ) ) ( not ( = ?auto_9249 ?auto_9257 ) ) ( not ( = ?auto_9249 ?auto_9255 ) ) ( not ( = ?auto_9249 ?auto_9265 ) ) ( not ( = ?auto_9252 ?auto_9253 ) ) ( not ( = ?auto_9252 ?auto_9258 ) ) ( not ( = ?auto_9252 ?auto_9260 ) ) ( not ( = ?auto_9252 ?auto_9254 ) ) ( not ( = ?auto_9252 ?auto_9263 ) ) ( not ( = ?auto_9252 ?auto_9266 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_9239 ?auto_9240 ?auto_9241 ?auto_9242 ?auto_9243 ?auto_9244 ?auto_9245 )
      ( MAKE-1CRATE ?auto_9245 ?auto_9246 )
      ( MAKE-7CRATE-VERIFY ?auto_9239 ?auto_9240 ?auto_9241 ?auto_9242 ?auto_9243 ?auto_9244 ?auto_9245 ?auto_9246 ) )
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
      ?auto_9293 - SURFACE
      ?auto_9294 - SURFACE
    )
    :vars
    (
      ?auto_9300 - HOIST
      ?auto_9297 - PLACE
      ?auto_9298 - PLACE
      ?auto_9296 - HOIST
      ?auto_9295 - SURFACE
      ?auto_9312 - PLACE
      ?auto_9303 - HOIST
      ?auto_9307 - SURFACE
      ?auto_9308 - PLACE
      ?auto_9304 - HOIST
      ?auto_9310 - SURFACE
      ?auto_9309 - PLACE
      ?auto_9315 - HOIST
      ?auto_9311 - SURFACE
      ?auto_9306 - PLACE
      ?auto_9305 - HOIST
      ?auto_9317 - SURFACE
      ?auto_9302 - SURFACE
      ?auto_9316 - SURFACE
      ?auto_9313 - PLACE
      ?auto_9301 - HOIST
      ?auto_9314 - SURFACE
      ?auto_9299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9300 ?auto_9297 ) ( IS-CRATE ?auto_9294 ) ( not ( = ?auto_9298 ?auto_9297 ) ) ( HOIST-AT ?auto_9296 ?auto_9298 ) ( AVAILABLE ?auto_9296 ) ( SURFACE-AT ?auto_9294 ?auto_9298 ) ( ON ?auto_9294 ?auto_9295 ) ( CLEAR ?auto_9294 ) ( not ( = ?auto_9293 ?auto_9294 ) ) ( not ( = ?auto_9293 ?auto_9295 ) ) ( not ( = ?auto_9294 ?auto_9295 ) ) ( not ( = ?auto_9300 ?auto_9296 ) ) ( IS-CRATE ?auto_9293 ) ( not ( = ?auto_9312 ?auto_9297 ) ) ( HOIST-AT ?auto_9303 ?auto_9312 ) ( AVAILABLE ?auto_9303 ) ( SURFACE-AT ?auto_9293 ?auto_9312 ) ( ON ?auto_9293 ?auto_9307 ) ( CLEAR ?auto_9293 ) ( not ( = ?auto_9292 ?auto_9293 ) ) ( not ( = ?auto_9292 ?auto_9307 ) ) ( not ( = ?auto_9293 ?auto_9307 ) ) ( not ( = ?auto_9300 ?auto_9303 ) ) ( IS-CRATE ?auto_9292 ) ( not ( = ?auto_9308 ?auto_9297 ) ) ( HOIST-AT ?auto_9304 ?auto_9308 ) ( SURFACE-AT ?auto_9292 ?auto_9308 ) ( ON ?auto_9292 ?auto_9310 ) ( CLEAR ?auto_9292 ) ( not ( = ?auto_9291 ?auto_9292 ) ) ( not ( = ?auto_9291 ?auto_9310 ) ) ( not ( = ?auto_9292 ?auto_9310 ) ) ( not ( = ?auto_9300 ?auto_9304 ) ) ( IS-CRATE ?auto_9291 ) ( not ( = ?auto_9309 ?auto_9297 ) ) ( HOIST-AT ?auto_9315 ?auto_9309 ) ( SURFACE-AT ?auto_9291 ?auto_9309 ) ( ON ?auto_9291 ?auto_9311 ) ( CLEAR ?auto_9291 ) ( not ( = ?auto_9290 ?auto_9291 ) ) ( not ( = ?auto_9290 ?auto_9311 ) ) ( not ( = ?auto_9291 ?auto_9311 ) ) ( not ( = ?auto_9300 ?auto_9315 ) ) ( IS-CRATE ?auto_9290 ) ( not ( = ?auto_9306 ?auto_9297 ) ) ( HOIST-AT ?auto_9305 ?auto_9306 ) ( AVAILABLE ?auto_9305 ) ( SURFACE-AT ?auto_9290 ?auto_9306 ) ( ON ?auto_9290 ?auto_9317 ) ( CLEAR ?auto_9290 ) ( not ( = ?auto_9289 ?auto_9290 ) ) ( not ( = ?auto_9289 ?auto_9317 ) ) ( not ( = ?auto_9290 ?auto_9317 ) ) ( not ( = ?auto_9300 ?auto_9305 ) ) ( IS-CRATE ?auto_9289 ) ( AVAILABLE ?auto_9315 ) ( SURFACE-AT ?auto_9289 ?auto_9309 ) ( ON ?auto_9289 ?auto_9302 ) ( CLEAR ?auto_9289 ) ( not ( = ?auto_9288 ?auto_9289 ) ) ( not ( = ?auto_9288 ?auto_9302 ) ) ( not ( = ?auto_9289 ?auto_9302 ) ) ( IS-CRATE ?auto_9288 ) ( AVAILABLE ?auto_9304 ) ( SURFACE-AT ?auto_9288 ?auto_9308 ) ( ON ?auto_9288 ?auto_9316 ) ( CLEAR ?auto_9288 ) ( not ( = ?auto_9287 ?auto_9288 ) ) ( not ( = ?auto_9287 ?auto_9316 ) ) ( not ( = ?auto_9288 ?auto_9316 ) ) ( SURFACE-AT ?auto_9286 ?auto_9297 ) ( CLEAR ?auto_9286 ) ( IS-CRATE ?auto_9287 ) ( AVAILABLE ?auto_9300 ) ( not ( = ?auto_9313 ?auto_9297 ) ) ( HOIST-AT ?auto_9301 ?auto_9313 ) ( AVAILABLE ?auto_9301 ) ( SURFACE-AT ?auto_9287 ?auto_9313 ) ( ON ?auto_9287 ?auto_9314 ) ( CLEAR ?auto_9287 ) ( TRUCK-AT ?auto_9299 ?auto_9297 ) ( not ( = ?auto_9286 ?auto_9287 ) ) ( not ( = ?auto_9286 ?auto_9314 ) ) ( not ( = ?auto_9287 ?auto_9314 ) ) ( not ( = ?auto_9300 ?auto_9301 ) ) ( not ( = ?auto_9286 ?auto_9288 ) ) ( not ( = ?auto_9286 ?auto_9316 ) ) ( not ( = ?auto_9288 ?auto_9314 ) ) ( not ( = ?auto_9308 ?auto_9313 ) ) ( not ( = ?auto_9304 ?auto_9301 ) ) ( not ( = ?auto_9316 ?auto_9314 ) ) ( not ( = ?auto_9286 ?auto_9289 ) ) ( not ( = ?auto_9286 ?auto_9302 ) ) ( not ( = ?auto_9287 ?auto_9289 ) ) ( not ( = ?auto_9287 ?auto_9302 ) ) ( not ( = ?auto_9289 ?auto_9316 ) ) ( not ( = ?auto_9289 ?auto_9314 ) ) ( not ( = ?auto_9309 ?auto_9308 ) ) ( not ( = ?auto_9309 ?auto_9313 ) ) ( not ( = ?auto_9315 ?auto_9304 ) ) ( not ( = ?auto_9315 ?auto_9301 ) ) ( not ( = ?auto_9302 ?auto_9316 ) ) ( not ( = ?auto_9302 ?auto_9314 ) ) ( not ( = ?auto_9286 ?auto_9290 ) ) ( not ( = ?auto_9286 ?auto_9317 ) ) ( not ( = ?auto_9287 ?auto_9290 ) ) ( not ( = ?auto_9287 ?auto_9317 ) ) ( not ( = ?auto_9288 ?auto_9290 ) ) ( not ( = ?auto_9288 ?auto_9317 ) ) ( not ( = ?auto_9290 ?auto_9302 ) ) ( not ( = ?auto_9290 ?auto_9316 ) ) ( not ( = ?auto_9290 ?auto_9314 ) ) ( not ( = ?auto_9306 ?auto_9309 ) ) ( not ( = ?auto_9306 ?auto_9308 ) ) ( not ( = ?auto_9306 ?auto_9313 ) ) ( not ( = ?auto_9305 ?auto_9315 ) ) ( not ( = ?auto_9305 ?auto_9304 ) ) ( not ( = ?auto_9305 ?auto_9301 ) ) ( not ( = ?auto_9317 ?auto_9302 ) ) ( not ( = ?auto_9317 ?auto_9316 ) ) ( not ( = ?auto_9317 ?auto_9314 ) ) ( not ( = ?auto_9286 ?auto_9291 ) ) ( not ( = ?auto_9286 ?auto_9311 ) ) ( not ( = ?auto_9287 ?auto_9291 ) ) ( not ( = ?auto_9287 ?auto_9311 ) ) ( not ( = ?auto_9288 ?auto_9291 ) ) ( not ( = ?auto_9288 ?auto_9311 ) ) ( not ( = ?auto_9289 ?auto_9291 ) ) ( not ( = ?auto_9289 ?auto_9311 ) ) ( not ( = ?auto_9291 ?auto_9317 ) ) ( not ( = ?auto_9291 ?auto_9302 ) ) ( not ( = ?auto_9291 ?auto_9316 ) ) ( not ( = ?auto_9291 ?auto_9314 ) ) ( not ( = ?auto_9311 ?auto_9317 ) ) ( not ( = ?auto_9311 ?auto_9302 ) ) ( not ( = ?auto_9311 ?auto_9316 ) ) ( not ( = ?auto_9311 ?auto_9314 ) ) ( not ( = ?auto_9286 ?auto_9292 ) ) ( not ( = ?auto_9286 ?auto_9310 ) ) ( not ( = ?auto_9287 ?auto_9292 ) ) ( not ( = ?auto_9287 ?auto_9310 ) ) ( not ( = ?auto_9288 ?auto_9292 ) ) ( not ( = ?auto_9288 ?auto_9310 ) ) ( not ( = ?auto_9289 ?auto_9292 ) ) ( not ( = ?auto_9289 ?auto_9310 ) ) ( not ( = ?auto_9290 ?auto_9292 ) ) ( not ( = ?auto_9290 ?auto_9310 ) ) ( not ( = ?auto_9292 ?auto_9311 ) ) ( not ( = ?auto_9292 ?auto_9317 ) ) ( not ( = ?auto_9292 ?auto_9302 ) ) ( not ( = ?auto_9292 ?auto_9316 ) ) ( not ( = ?auto_9292 ?auto_9314 ) ) ( not ( = ?auto_9310 ?auto_9311 ) ) ( not ( = ?auto_9310 ?auto_9317 ) ) ( not ( = ?auto_9310 ?auto_9302 ) ) ( not ( = ?auto_9310 ?auto_9316 ) ) ( not ( = ?auto_9310 ?auto_9314 ) ) ( not ( = ?auto_9286 ?auto_9293 ) ) ( not ( = ?auto_9286 ?auto_9307 ) ) ( not ( = ?auto_9287 ?auto_9293 ) ) ( not ( = ?auto_9287 ?auto_9307 ) ) ( not ( = ?auto_9288 ?auto_9293 ) ) ( not ( = ?auto_9288 ?auto_9307 ) ) ( not ( = ?auto_9289 ?auto_9293 ) ) ( not ( = ?auto_9289 ?auto_9307 ) ) ( not ( = ?auto_9290 ?auto_9293 ) ) ( not ( = ?auto_9290 ?auto_9307 ) ) ( not ( = ?auto_9291 ?auto_9293 ) ) ( not ( = ?auto_9291 ?auto_9307 ) ) ( not ( = ?auto_9293 ?auto_9310 ) ) ( not ( = ?auto_9293 ?auto_9311 ) ) ( not ( = ?auto_9293 ?auto_9317 ) ) ( not ( = ?auto_9293 ?auto_9302 ) ) ( not ( = ?auto_9293 ?auto_9316 ) ) ( not ( = ?auto_9293 ?auto_9314 ) ) ( not ( = ?auto_9312 ?auto_9308 ) ) ( not ( = ?auto_9312 ?auto_9309 ) ) ( not ( = ?auto_9312 ?auto_9306 ) ) ( not ( = ?auto_9312 ?auto_9313 ) ) ( not ( = ?auto_9303 ?auto_9304 ) ) ( not ( = ?auto_9303 ?auto_9315 ) ) ( not ( = ?auto_9303 ?auto_9305 ) ) ( not ( = ?auto_9303 ?auto_9301 ) ) ( not ( = ?auto_9307 ?auto_9310 ) ) ( not ( = ?auto_9307 ?auto_9311 ) ) ( not ( = ?auto_9307 ?auto_9317 ) ) ( not ( = ?auto_9307 ?auto_9302 ) ) ( not ( = ?auto_9307 ?auto_9316 ) ) ( not ( = ?auto_9307 ?auto_9314 ) ) ( not ( = ?auto_9286 ?auto_9294 ) ) ( not ( = ?auto_9286 ?auto_9295 ) ) ( not ( = ?auto_9287 ?auto_9294 ) ) ( not ( = ?auto_9287 ?auto_9295 ) ) ( not ( = ?auto_9288 ?auto_9294 ) ) ( not ( = ?auto_9288 ?auto_9295 ) ) ( not ( = ?auto_9289 ?auto_9294 ) ) ( not ( = ?auto_9289 ?auto_9295 ) ) ( not ( = ?auto_9290 ?auto_9294 ) ) ( not ( = ?auto_9290 ?auto_9295 ) ) ( not ( = ?auto_9291 ?auto_9294 ) ) ( not ( = ?auto_9291 ?auto_9295 ) ) ( not ( = ?auto_9292 ?auto_9294 ) ) ( not ( = ?auto_9292 ?auto_9295 ) ) ( not ( = ?auto_9294 ?auto_9307 ) ) ( not ( = ?auto_9294 ?auto_9310 ) ) ( not ( = ?auto_9294 ?auto_9311 ) ) ( not ( = ?auto_9294 ?auto_9317 ) ) ( not ( = ?auto_9294 ?auto_9302 ) ) ( not ( = ?auto_9294 ?auto_9316 ) ) ( not ( = ?auto_9294 ?auto_9314 ) ) ( not ( = ?auto_9298 ?auto_9312 ) ) ( not ( = ?auto_9298 ?auto_9308 ) ) ( not ( = ?auto_9298 ?auto_9309 ) ) ( not ( = ?auto_9298 ?auto_9306 ) ) ( not ( = ?auto_9298 ?auto_9313 ) ) ( not ( = ?auto_9296 ?auto_9303 ) ) ( not ( = ?auto_9296 ?auto_9304 ) ) ( not ( = ?auto_9296 ?auto_9315 ) ) ( not ( = ?auto_9296 ?auto_9305 ) ) ( not ( = ?auto_9296 ?auto_9301 ) ) ( not ( = ?auto_9295 ?auto_9307 ) ) ( not ( = ?auto_9295 ?auto_9310 ) ) ( not ( = ?auto_9295 ?auto_9311 ) ) ( not ( = ?auto_9295 ?auto_9317 ) ) ( not ( = ?auto_9295 ?auto_9302 ) ) ( not ( = ?auto_9295 ?auto_9316 ) ) ( not ( = ?auto_9295 ?auto_9314 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_9286 ?auto_9287 ?auto_9288 ?auto_9289 ?auto_9290 ?auto_9291 ?auto_9292 ?auto_9293 )
      ( MAKE-1CRATE ?auto_9293 ?auto_9294 )
      ( MAKE-8CRATE-VERIFY ?auto_9286 ?auto_9287 ?auto_9288 ?auto_9289 ?auto_9290 ?auto_9291 ?auto_9292 ?auto_9293 ?auto_9294 ) )
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
      ?auto_9345 - SURFACE
      ?auto_9346 - SURFACE
      ?auto_9347 - SURFACE
    )
    :vars
    (
      ?auto_9352 - HOIST
      ?auto_9351 - PLACE
      ?auto_9353 - PLACE
      ?auto_9349 - HOIST
      ?auto_9350 - SURFACE
      ?auto_9359 - PLACE
      ?auto_9357 - HOIST
      ?auto_9354 - SURFACE
      ?auto_9373 - PLACE
      ?auto_9364 - HOIST
      ?auto_9355 - SURFACE
      ?auto_9365 - PLACE
      ?auto_9366 - HOIST
      ?auto_9372 - SURFACE
      ?auto_9361 - PLACE
      ?auto_9363 - HOIST
      ?auto_9362 - SURFACE
      ?auto_9358 - PLACE
      ?auto_9368 - HOIST
      ?auto_9356 - SURFACE
      ?auto_9371 - SURFACE
      ?auto_9370 - SURFACE
      ?auto_9367 - PLACE
      ?auto_9369 - HOIST
      ?auto_9360 - SURFACE
      ?auto_9348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9352 ?auto_9351 ) ( IS-CRATE ?auto_9347 ) ( not ( = ?auto_9353 ?auto_9351 ) ) ( HOIST-AT ?auto_9349 ?auto_9353 ) ( AVAILABLE ?auto_9349 ) ( SURFACE-AT ?auto_9347 ?auto_9353 ) ( ON ?auto_9347 ?auto_9350 ) ( CLEAR ?auto_9347 ) ( not ( = ?auto_9346 ?auto_9347 ) ) ( not ( = ?auto_9346 ?auto_9350 ) ) ( not ( = ?auto_9347 ?auto_9350 ) ) ( not ( = ?auto_9352 ?auto_9349 ) ) ( IS-CRATE ?auto_9346 ) ( not ( = ?auto_9359 ?auto_9351 ) ) ( HOIST-AT ?auto_9357 ?auto_9359 ) ( AVAILABLE ?auto_9357 ) ( SURFACE-AT ?auto_9346 ?auto_9359 ) ( ON ?auto_9346 ?auto_9354 ) ( CLEAR ?auto_9346 ) ( not ( = ?auto_9345 ?auto_9346 ) ) ( not ( = ?auto_9345 ?auto_9354 ) ) ( not ( = ?auto_9346 ?auto_9354 ) ) ( not ( = ?auto_9352 ?auto_9357 ) ) ( IS-CRATE ?auto_9345 ) ( not ( = ?auto_9373 ?auto_9351 ) ) ( HOIST-AT ?auto_9364 ?auto_9373 ) ( AVAILABLE ?auto_9364 ) ( SURFACE-AT ?auto_9345 ?auto_9373 ) ( ON ?auto_9345 ?auto_9355 ) ( CLEAR ?auto_9345 ) ( not ( = ?auto_9344 ?auto_9345 ) ) ( not ( = ?auto_9344 ?auto_9355 ) ) ( not ( = ?auto_9345 ?auto_9355 ) ) ( not ( = ?auto_9352 ?auto_9364 ) ) ( IS-CRATE ?auto_9344 ) ( not ( = ?auto_9365 ?auto_9351 ) ) ( HOIST-AT ?auto_9366 ?auto_9365 ) ( SURFACE-AT ?auto_9344 ?auto_9365 ) ( ON ?auto_9344 ?auto_9372 ) ( CLEAR ?auto_9344 ) ( not ( = ?auto_9343 ?auto_9344 ) ) ( not ( = ?auto_9343 ?auto_9372 ) ) ( not ( = ?auto_9344 ?auto_9372 ) ) ( not ( = ?auto_9352 ?auto_9366 ) ) ( IS-CRATE ?auto_9343 ) ( not ( = ?auto_9361 ?auto_9351 ) ) ( HOIST-AT ?auto_9363 ?auto_9361 ) ( SURFACE-AT ?auto_9343 ?auto_9361 ) ( ON ?auto_9343 ?auto_9362 ) ( CLEAR ?auto_9343 ) ( not ( = ?auto_9342 ?auto_9343 ) ) ( not ( = ?auto_9342 ?auto_9362 ) ) ( not ( = ?auto_9343 ?auto_9362 ) ) ( not ( = ?auto_9352 ?auto_9363 ) ) ( IS-CRATE ?auto_9342 ) ( not ( = ?auto_9358 ?auto_9351 ) ) ( HOIST-AT ?auto_9368 ?auto_9358 ) ( AVAILABLE ?auto_9368 ) ( SURFACE-AT ?auto_9342 ?auto_9358 ) ( ON ?auto_9342 ?auto_9356 ) ( CLEAR ?auto_9342 ) ( not ( = ?auto_9341 ?auto_9342 ) ) ( not ( = ?auto_9341 ?auto_9356 ) ) ( not ( = ?auto_9342 ?auto_9356 ) ) ( not ( = ?auto_9352 ?auto_9368 ) ) ( IS-CRATE ?auto_9341 ) ( AVAILABLE ?auto_9363 ) ( SURFACE-AT ?auto_9341 ?auto_9361 ) ( ON ?auto_9341 ?auto_9371 ) ( CLEAR ?auto_9341 ) ( not ( = ?auto_9340 ?auto_9341 ) ) ( not ( = ?auto_9340 ?auto_9371 ) ) ( not ( = ?auto_9341 ?auto_9371 ) ) ( IS-CRATE ?auto_9340 ) ( AVAILABLE ?auto_9366 ) ( SURFACE-AT ?auto_9340 ?auto_9365 ) ( ON ?auto_9340 ?auto_9370 ) ( CLEAR ?auto_9340 ) ( not ( = ?auto_9339 ?auto_9340 ) ) ( not ( = ?auto_9339 ?auto_9370 ) ) ( not ( = ?auto_9340 ?auto_9370 ) ) ( SURFACE-AT ?auto_9338 ?auto_9351 ) ( CLEAR ?auto_9338 ) ( IS-CRATE ?auto_9339 ) ( AVAILABLE ?auto_9352 ) ( not ( = ?auto_9367 ?auto_9351 ) ) ( HOIST-AT ?auto_9369 ?auto_9367 ) ( AVAILABLE ?auto_9369 ) ( SURFACE-AT ?auto_9339 ?auto_9367 ) ( ON ?auto_9339 ?auto_9360 ) ( CLEAR ?auto_9339 ) ( TRUCK-AT ?auto_9348 ?auto_9351 ) ( not ( = ?auto_9338 ?auto_9339 ) ) ( not ( = ?auto_9338 ?auto_9360 ) ) ( not ( = ?auto_9339 ?auto_9360 ) ) ( not ( = ?auto_9352 ?auto_9369 ) ) ( not ( = ?auto_9338 ?auto_9340 ) ) ( not ( = ?auto_9338 ?auto_9370 ) ) ( not ( = ?auto_9340 ?auto_9360 ) ) ( not ( = ?auto_9365 ?auto_9367 ) ) ( not ( = ?auto_9366 ?auto_9369 ) ) ( not ( = ?auto_9370 ?auto_9360 ) ) ( not ( = ?auto_9338 ?auto_9341 ) ) ( not ( = ?auto_9338 ?auto_9371 ) ) ( not ( = ?auto_9339 ?auto_9341 ) ) ( not ( = ?auto_9339 ?auto_9371 ) ) ( not ( = ?auto_9341 ?auto_9370 ) ) ( not ( = ?auto_9341 ?auto_9360 ) ) ( not ( = ?auto_9361 ?auto_9365 ) ) ( not ( = ?auto_9361 ?auto_9367 ) ) ( not ( = ?auto_9363 ?auto_9366 ) ) ( not ( = ?auto_9363 ?auto_9369 ) ) ( not ( = ?auto_9371 ?auto_9370 ) ) ( not ( = ?auto_9371 ?auto_9360 ) ) ( not ( = ?auto_9338 ?auto_9342 ) ) ( not ( = ?auto_9338 ?auto_9356 ) ) ( not ( = ?auto_9339 ?auto_9342 ) ) ( not ( = ?auto_9339 ?auto_9356 ) ) ( not ( = ?auto_9340 ?auto_9342 ) ) ( not ( = ?auto_9340 ?auto_9356 ) ) ( not ( = ?auto_9342 ?auto_9371 ) ) ( not ( = ?auto_9342 ?auto_9370 ) ) ( not ( = ?auto_9342 ?auto_9360 ) ) ( not ( = ?auto_9358 ?auto_9361 ) ) ( not ( = ?auto_9358 ?auto_9365 ) ) ( not ( = ?auto_9358 ?auto_9367 ) ) ( not ( = ?auto_9368 ?auto_9363 ) ) ( not ( = ?auto_9368 ?auto_9366 ) ) ( not ( = ?auto_9368 ?auto_9369 ) ) ( not ( = ?auto_9356 ?auto_9371 ) ) ( not ( = ?auto_9356 ?auto_9370 ) ) ( not ( = ?auto_9356 ?auto_9360 ) ) ( not ( = ?auto_9338 ?auto_9343 ) ) ( not ( = ?auto_9338 ?auto_9362 ) ) ( not ( = ?auto_9339 ?auto_9343 ) ) ( not ( = ?auto_9339 ?auto_9362 ) ) ( not ( = ?auto_9340 ?auto_9343 ) ) ( not ( = ?auto_9340 ?auto_9362 ) ) ( not ( = ?auto_9341 ?auto_9343 ) ) ( not ( = ?auto_9341 ?auto_9362 ) ) ( not ( = ?auto_9343 ?auto_9356 ) ) ( not ( = ?auto_9343 ?auto_9371 ) ) ( not ( = ?auto_9343 ?auto_9370 ) ) ( not ( = ?auto_9343 ?auto_9360 ) ) ( not ( = ?auto_9362 ?auto_9356 ) ) ( not ( = ?auto_9362 ?auto_9371 ) ) ( not ( = ?auto_9362 ?auto_9370 ) ) ( not ( = ?auto_9362 ?auto_9360 ) ) ( not ( = ?auto_9338 ?auto_9344 ) ) ( not ( = ?auto_9338 ?auto_9372 ) ) ( not ( = ?auto_9339 ?auto_9344 ) ) ( not ( = ?auto_9339 ?auto_9372 ) ) ( not ( = ?auto_9340 ?auto_9344 ) ) ( not ( = ?auto_9340 ?auto_9372 ) ) ( not ( = ?auto_9341 ?auto_9344 ) ) ( not ( = ?auto_9341 ?auto_9372 ) ) ( not ( = ?auto_9342 ?auto_9344 ) ) ( not ( = ?auto_9342 ?auto_9372 ) ) ( not ( = ?auto_9344 ?auto_9362 ) ) ( not ( = ?auto_9344 ?auto_9356 ) ) ( not ( = ?auto_9344 ?auto_9371 ) ) ( not ( = ?auto_9344 ?auto_9370 ) ) ( not ( = ?auto_9344 ?auto_9360 ) ) ( not ( = ?auto_9372 ?auto_9362 ) ) ( not ( = ?auto_9372 ?auto_9356 ) ) ( not ( = ?auto_9372 ?auto_9371 ) ) ( not ( = ?auto_9372 ?auto_9370 ) ) ( not ( = ?auto_9372 ?auto_9360 ) ) ( not ( = ?auto_9338 ?auto_9345 ) ) ( not ( = ?auto_9338 ?auto_9355 ) ) ( not ( = ?auto_9339 ?auto_9345 ) ) ( not ( = ?auto_9339 ?auto_9355 ) ) ( not ( = ?auto_9340 ?auto_9345 ) ) ( not ( = ?auto_9340 ?auto_9355 ) ) ( not ( = ?auto_9341 ?auto_9345 ) ) ( not ( = ?auto_9341 ?auto_9355 ) ) ( not ( = ?auto_9342 ?auto_9345 ) ) ( not ( = ?auto_9342 ?auto_9355 ) ) ( not ( = ?auto_9343 ?auto_9345 ) ) ( not ( = ?auto_9343 ?auto_9355 ) ) ( not ( = ?auto_9345 ?auto_9372 ) ) ( not ( = ?auto_9345 ?auto_9362 ) ) ( not ( = ?auto_9345 ?auto_9356 ) ) ( not ( = ?auto_9345 ?auto_9371 ) ) ( not ( = ?auto_9345 ?auto_9370 ) ) ( not ( = ?auto_9345 ?auto_9360 ) ) ( not ( = ?auto_9373 ?auto_9365 ) ) ( not ( = ?auto_9373 ?auto_9361 ) ) ( not ( = ?auto_9373 ?auto_9358 ) ) ( not ( = ?auto_9373 ?auto_9367 ) ) ( not ( = ?auto_9364 ?auto_9366 ) ) ( not ( = ?auto_9364 ?auto_9363 ) ) ( not ( = ?auto_9364 ?auto_9368 ) ) ( not ( = ?auto_9364 ?auto_9369 ) ) ( not ( = ?auto_9355 ?auto_9372 ) ) ( not ( = ?auto_9355 ?auto_9362 ) ) ( not ( = ?auto_9355 ?auto_9356 ) ) ( not ( = ?auto_9355 ?auto_9371 ) ) ( not ( = ?auto_9355 ?auto_9370 ) ) ( not ( = ?auto_9355 ?auto_9360 ) ) ( not ( = ?auto_9338 ?auto_9346 ) ) ( not ( = ?auto_9338 ?auto_9354 ) ) ( not ( = ?auto_9339 ?auto_9346 ) ) ( not ( = ?auto_9339 ?auto_9354 ) ) ( not ( = ?auto_9340 ?auto_9346 ) ) ( not ( = ?auto_9340 ?auto_9354 ) ) ( not ( = ?auto_9341 ?auto_9346 ) ) ( not ( = ?auto_9341 ?auto_9354 ) ) ( not ( = ?auto_9342 ?auto_9346 ) ) ( not ( = ?auto_9342 ?auto_9354 ) ) ( not ( = ?auto_9343 ?auto_9346 ) ) ( not ( = ?auto_9343 ?auto_9354 ) ) ( not ( = ?auto_9344 ?auto_9346 ) ) ( not ( = ?auto_9344 ?auto_9354 ) ) ( not ( = ?auto_9346 ?auto_9355 ) ) ( not ( = ?auto_9346 ?auto_9372 ) ) ( not ( = ?auto_9346 ?auto_9362 ) ) ( not ( = ?auto_9346 ?auto_9356 ) ) ( not ( = ?auto_9346 ?auto_9371 ) ) ( not ( = ?auto_9346 ?auto_9370 ) ) ( not ( = ?auto_9346 ?auto_9360 ) ) ( not ( = ?auto_9359 ?auto_9373 ) ) ( not ( = ?auto_9359 ?auto_9365 ) ) ( not ( = ?auto_9359 ?auto_9361 ) ) ( not ( = ?auto_9359 ?auto_9358 ) ) ( not ( = ?auto_9359 ?auto_9367 ) ) ( not ( = ?auto_9357 ?auto_9364 ) ) ( not ( = ?auto_9357 ?auto_9366 ) ) ( not ( = ?auto_9357 ?auto_9363 ) ) ( not ( = ?auto_9357 ?auto_9368 ) ) ( not ( = ?auto_9357 ?auto_9369 ) ) ( not ( = ?auto_9354 ?auto_9355 ) ) ( not ( = ?auto_9354 ?auto_9372 ) ) ( not ( = ?auto_9354 ?auto_9362 ) ) ( not ( = ?auto_9354 ?auto_9356 ) ) ( not ( = ?auto_9354 ?auto_9371 ) ) ( not ( = ?auto_9354 ?auto_9370 ) ) ( not ( = ?auto_9354 ?auto_9360 ) ) ( not ( = ?auto_9338 ?auto_9347 ) ) ( not ( = ?auto_9338 ?auto_9350 ) ) ( not ( = ?auto_9339 ?auto_9347 ) ) ( not ( = ?auto_9339 ?auto_9350 ) ) ( not ( = ?auto_9340 ?auto_9347 ) ) ( not ( = ?auto_9340 ?auto_9350 ) ) ( not ( = ?auto_9341 ?auto_9347 ) ) ( not ( = ?auto_9341 ?auto_9350 ) ) ( not ( = ?auto_9342 ?auto_9347 ) ) ( not ( = ?auto_9342 ?auto_9350 ) ) ( not ( = ?auto_9343 ?auto_9347 ) ) ( not ( = ?auto_9343 ?auto_9350 ) ) ( not ( = ?auto_9344 ?auto_9347 ) ) ( not ( = ?auto_9344 ?auto_9350 ) ) ( not ( = ?auto_9345 ?auto_9347 ) ) ( not ( = ?auto_9345 ?auto_9350 ) ) ( not ( = ?auto_9347 ?auto_9354 ) ) ( not ( = ?auto_9347 ?auto_9355 ) ) ( not ( = ?auto_9347 ?auto_9372 ) ) ( not ( = ?auto_9347 ?auto_9362 ) ) ( not ( = ?auto_9347 ?auto_9356 ) ) ( not ( = ?auto_9347 ?auto_9371 ) ) ( not ( = ?auto_9347 ?auto_9370 ) ) ( not ( = ?auto_9347 ?auto_9360 ) ) ( not ( = ?auto_9353 ?auto_9359 ) ) ( not ( = ?auto_9353 ?auto_9373 ) ) ( not ( = ?auto_9353 ?auto_9365 ) ) ( not ( = ?auto_9353 ?auto_9361 ) ) ( not ( = ?auto_9353 ?auto_9358 ) ) ( not ( = ?auto_9353 ?auto_9367 ) ) ( not ( = ?auto_9349 ?auto_9357 ) ) ( not ( = ?auto_9349 ?auto_9364 ) ) ( not ( = ?auto_9349 ?auto_9366 ) ) ( not ( = ?auto_9349 ?auto_9363 ) ) ( not ( = ?auto_9349 ?auto_9368 ) ) ( not ( = ?auto_9349 ?auto_9369 ) ) ( not ( = ?auto_9350 ?auto_9354 ) ) ( not ( = ?auto_9350 ?auto_9355 ) ) ( not ( = ?auto_9350 ?auto_9372 ) ) ( not ( = ?auto_9350 ?auto_9362 ) ) ( not ( = ?auto_9350 ?auto_9356 ) ) ( not ( = ?auto_9350 ?auto_9371 ) ) ( not ( = ?auto_9350 ?auto_9370 ) ) ( not ( = ?auto_9350 ?auto_9360 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_9338 ?auto_9339 ?auto_9340 ?auto_9341 ?auto_9342 ?auto_9343 ?auto_9344 ?auto_9345 ?auto_9346 )
      ( MAKE-1CRATE ?auto_9346 ?auto_9347 )
      ( MAKE-9CRATE-VERIFY ?auto_9338 ?auto_9339 ?auto_9340 ?auto_9341 ?auto_9342 ?auto_9343 ?auto_9344 ?auto_9345 ?auto_9346 ?auto_9347 ) )
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
      ?auto_9402 - SURFACE
      ?auto_9403 - SURFACE
      ?auto_9404 - SURFACE
      ?auto_9405 - SURFACE
    )
    :vars
    (
      ?auto_9409 - HOIST
      ?auto_9407 - PLACE
      ?auto_9411 - PLACE
      ?auto_9410 - HOIST
      ?auto_9406 - SURFACE
      ?auto_9431 - PLACE
      ?auto_9414 - HOIST
      ?auto_9419 - SURFACE
      ?auto_9417 - PLACE
      ?auto_9432 - HOIST
      ?auto_9412 - SURFACE
      ?auto_9415 - PLACE
      ?auto_9428 - HOIST
      ?auto_9413 - SURFACE
      ?auto_9416 - SURFACE
      ?auto_9427 - PLACE
      ?auto_9429 - HOIST
      ?auto_9423 - SURFACE
      ?auto_9418 - PLACE
      ?auto_9420 - HOIST
      ?auto_9426 - SURFACE
      ?auto_9422 - SURFACE
      ?auto_9430 - SURFACE
      ?auto_9425 - PLACE
      ?auto_9424 - HOIST
      ?auto_9421 - SURFACE
      ?auto_9408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9409 ?auto_9407 ) ( IS-CRATE ?auto_9405 ) ( not ( = ?auto_9411 ?auto_9407 ) ) ( HOIST-AT ?auto_9410 ?auto_9411 ) ( SURFACE-AT ?auto_9405 ?auto_9411 ) ( ON ?auto_9405 ?auto_9406 ) ( CLEAR ?auto_9405 ) ( not ( = ?auto_9404 ?auto_9405 ) ) ( not ( = ?auto_9404 ?auto_9406 ) ) ( not ( = ?auto_9405 ?auto_9406 ) ) ( not ( = ?auto_9409 ?auto_9410 ) ) ( IS-CRATE ?auto_9404 ) ( not ( = ?auto_9431 ?auto_9407 ) ) ( HOIST-AT ?auto_9414 ?auto_9431 ) ( AVAILABLE ?auto_9414 ) ( SURFACE-AT ?auto_9404 ?auto_9431 ) ( ON ?auto_9404 ?auto_9419 ) ( CLEAR ?auto_9404 ) ( not ( = ?auto_9403 ?auto_9404 ) ) ( not ( = ?auto_9403 ?auto_9419 ) ) ( not ( = ?auto_9404 ?auto_9419 ) ) ( not ( = ?auto_9409 ?auto_9414 ) ) ( IS-CRATE ?auto_9403 ) ( not ( = ?auto_9417 ?auto_9407 ) ) ( HOIST-AT ?auto_9432 ?auto_9417 ) ( AVAILABLE ?auto_9432 ) ( SURFACE-AT ?auto_9403 ?auto_9417 ) ( ON ?auto_9403 ?auto_9412 ) ( CLEAR ?auto_9403 ) ( not ( = ?auto_9402 ?auto_9403 ) ) ( not ( = ?auto_9402 ?auto_9412 ) ) ( not ( = ?auto_9403 ?auto_9412 ) ) ( not ( = ?auto_9409 ?auto_9432 ) ) ( IS-CRATE ?auto_9402 ) ( not ( = ?auto_9415 ?auto_9407 ) ) ( HOIST-AT ?auto_9428 ?auto_9415 ) ( AVAILABLE ?auto_9428 ) ( SURFACE-AT ?auto_9402 ?auto_9415 ) ( ON ?auto_9402 ?auto_9413 ) ( CLEAR ?auto_9402 ) ( not ( = ?auto_9401 ?auto_9402 ) ) ( not ( = ?auto_9401 ?auto_9413 ) ) ( not ( = ?auto_9402 ?auto_9413 ) ) ( not ( = ?auto_9409 ?auto_9428 ) ) ( IS-CRATE ?auto_9401 ) ( SURFACE-AT ?auto_9401 ?auto_9411 ) ( ON ?auto_9401 ?auto_9416 ) ( CLEAR ?auto_9401 ) ( not ( = ?auto_9400 ?auto_9401 ) ) ( not ( = ?auto_9400 ?auto_9416 ) ) ( not ( = ?auto_9401 ?auto_9416 ) ) ( IS-CRATE ?auto_9400 ) ( not ( = ?auto_9427 ?auto_9407 ) ) ( HOIST-AT ?auto_9429 ?auto_9427 ) ( SURFACE-AT ?auto_9400 ?auto_9427 ) ( ON ?auto_9400 ?auto_9423 ) ( CLEAR ?auto_9400 ) ( not ( = ?auto_9399 ?auto_9400 ) ) ( not ( = ?auto_9399 ?auto_9423 ) ) ( not ( = ?auto_9400 ?auto_9423 ) ) ( not ( = ?auto_9409 ?auto_9429 ) ) ( IS-CRATE ?auto_9399 ) ( not ( = ?auto_9418 ?auto_9407 ) ) ( HOIST-AT ?auto_9420 ?auto_9418 ) ( AVAILABLE ?auto_9420 ) ( SURFACE-AT ?auto_9399 ?auto_9418 ) ( ON ?auto_9399 ?auto_9426 ) ( CLEAR ?auto_9399 ) ( not ( = ?auto_9398 ?auto_9399 ) ) ( not ( = ?auto_9398 ?auto_9426 ) ) ( not ( = ?auto_9399 ?auto_9426 ) ) ( not ( = ?auto_9409 ?auto_9420 ) ) ( IS-CRATE ?auto_9398 ) ( AVAILABLE ?auto_9429 ) ( SURFACE-AT ?auto_9398 ?auto_9427 ) ( ON ?auto_9398 ?auto_9422 ) ( CLEAR ?auto_9398 ) ( not ( = ?auto_9397 ?auto_9398 ) ) ( not ( = ?auto_9397 ?auto_9422 ) ) ( not ( = ?auto_9398 ?auto_9422 ) ) ( IS-CRATE ?auto_9397 ) ( AVAILABLE ?auto_9410 ) ( SURFACE-AT ?auto_9397 ?auto_9411 ) ( ON ?auto_9397 ?auto_9430 ) ( CLEAR ?auto_9397 ) ( not ( = ?auto_9396 ?auto_9397 ) ) ( not ( = ?auto_9396 ?auto_9430 ) ) ( not ( = ?auto_9397 ?auto_9430 ) ) ( SURFACE-AT ?auto_9395 ?auto_9407 ) ( CLEAR ?auto_9395 ) ( IS-CRATE ?auto_9396 ) ( AVAILABLE ?auto_9409 ) ( not ( = ?auto_9425 ?auto_9407 ) ) ( HOIST-AT ?auto_9424 ?auto_9425 ) ( AVAILABLE ?auto_9424 ) ( SURFACE-AT ?auto_9396 ?auto_9425 ) ( ON ?auto_9396 ?auto_9421 ) ( CLEAR ?auto_9396 ) ( TRUCK-AT ?auto_9408 ?auto_9407 ) ( not ( = ?auto_9395 ?auto_9396 ) ) ( not ( = ?auto_9395 ?auto_9421 ) ) ( not ( = ?auto_9396 ?auto_9421 ) ) ( not ( = ?auto_9409 ?auto_9424 ) ) ( not ( = ?auto_9395 ?auto_9397 ) ) ( not ( = ?auto_9395 ?auto_9430 ) ) ( not ( = ?auto_9397 ?auto_9421 ) ) ( not ( = ?auto_9411 ?auto_9425 ) ) ( not ( = ?auto_9410 ?auto_9424 ) ) ( not ( = ?auto_9430 ?auto_9421 ) ) ( not ( = ?auto_9395 ?auto_9398 ) ) ( not ( = ?auto_9395 ?auto_9422 ) ) ( not ( = ?auto_9396 ?auto_9398 ) ) ( not ( = ?auto_9396 ?auto_9422 ) ) ( not ( = ?auto_9398 ?auto_9430 ) ) ( not ( = ?auto_9398 ?auto_9421 ) ) ( not ( = ?auto_9427 ?auto_9411 ) ) ( not ( = ?auto_9427 ?auto_9425 ) ) ( not ( = ?auto_9429 ?auto_9410 ) ) ( not ( = ?auto_9429 ?auto_9424 ) ) ( not ( = ?auto_9422 ?auto_9430 ) ) ( not ( = ?auto_9422 ?auto_9421 ) ) ( not ( = ?auto_9395 ?auto_9399 ) ) ( not ( = ?auto_9395 ?auto_9426 ) ) ( not ( = ?auto_9396 ?auto_9399 ) ) ( not ( = ?auto_9396 ?auto_9426 ) ) ( not ( = ?auto_9397 ?auto_9399 ) ) ( not ( = ?auto_9397 ?auto_9426 ) ) ( not ( = ?auto_9399 ?auto_9422 ) ) ( not ( = ?auto_9399 ?auto_9430 ) ) ( not ( = ?auto_9399 ?auto_9421 ) ) ( not ( = ?auto_9418 ?auto_9427 ) ) ( not ( = ?auto_9418 ?auto_9411 ) ) ( not ( = ?auto_9418 ?auto_9425 ) ) ( not ( = ?auto_9420 ?auto_9429 ) ) ( not ( = ?auto_9420 ?auto_9410 ) ) ( not ( = ?auto_9420 ?auto_9424 ) ) ( not ( = ?auto_9426 ?auto_9422 ) ) ( not ( = ?auto_9426 ?auto_9430 ) ) ( not ( = ?auto_9426 ?auto_9421 ) ) ( not ( = ?auto_9395 ?auto_9400 ) ) ( not ( = ?auto_9395 ?auto_9423 ) ) ( not ( = ?auto_9396 ?auto_9400 ) ) ( not ( = ?auto_9396 ?auto_9423 ) ) ( not ( = ?auto_9397 ?auto_9400 ) ) ( not ( = ?auto_9397 ?auto_9423 ) ) ( not ( = ?auto_9398 ?auto_9400 ) ) ( not ( = ?auto_9398 ?auto_9423 ) ) ( not ( = ?auto_9400 ?auto_9426 ) ) ( not ( = ?auto_9400 ?auto_9422 ) ) ( not ( = ?auto_9400 ?auto_9430 ) ) ( not ( = ?auto_9400 ?auto_9421 ) ) ( not ( = ?auto_9423 ?auto_9426 ) ) ( not ( = ?auto_9423 ?auto_9422 ) ) ( not ( = ?auto_9423 ?auto_9430 ) ) ( not ( = ?auto_9423 ?auto_9421 ) ) ( not ( = ?auto_9395 ?auto_9401 ) ) ( not ( = ?auto_9395 ?auto_9416 ) ) ( not ( = ?auto_9396 ?auto_9401 ) ) ( not ( = ?auto_9396 ?auto_9416 ) ) ( not ( = ?auto_9397 ?auto_9401 ) ) ( not ( = ?auto_9397 ?auto_9416 ) ) ( not ( = ?auto_9398 ?auto_9401 ) ) ( not ( = ?auto_9398 ?auto_9416 ) ) ( not ( = ?auto_9399 ?auto_9401 ) ) ( not ( = ?auto_9399 ?auto_9416 ) ) ( not ( = ?auto_9401 ?auto_9423 ) ) ( not ( = ?auto_9401 ?auto_9426 ) ) ( not ( = ?auto_9401 ?auto_9422 ) ) ( not ( = ?auto_9401 ?auto_9430 ) ) ( not ( = ?auto_9401 ?auto_9421 ) ) ( not ( = ?auto_9416 ?auto_9423 ) ) ( not ( = ?auto_9416 ?auto_9426 ) ) ( not ( = ?auto_9416 ?auto_9422 ) ) ( not ( = ?auto_9416 ?auto_9430 ) ) ( not ( = ?auto_9416 ?auto_9421 ) ) ( not ( = ?auto_9395 ?auto_9402 ) ) ( not ( = ?auto_9395 ?auto_9413 ) ) ( not ( = ?auto_9396 ?auto_9402 ) ) ( not ( = ?auto_9396 ?auto_9413 ) ) ( not ( = ?auto_9397 ?auto_9402 ) ) ( not ( = ?auto_9397 ?auto_9413 ) ) ( not ( = ?auto_9398 ?auto_9402 ) ) ( not ( = ?auto_9398 ?auto_9413 ) ) ( not ( = ?auto_9399 ?auto_9402 ) ) ( not ( = ?auto_9399 ?auto_9413 ) ) ( not ( = ?auto_9400 ?auto_9402 ) ) ( not ( = ?auto_9400 ?auto_9413 ) ) ( not ( = ?auto_9402 ?auto_9416 ) ) ( not ( = ?auto_9402 ?auto_9423 ) ) ( not ( = ?auto_9402 ?auto_9426 ) ) ( not ( = ?auto_9402 ?auto_9422 ) ) ( not ( = ?auto_9402 ?auto_9430 ) ) ( not ( = ?auto_9402 ?auto_9421 ) ) ( not ( = ?auto_9415 ?auto_9411 ) ) ( not ( = ?auto_9415 ?auto_9427 ) ) ( not ( = ?auto_9415 ?auto_9418 ) ) ( not ( = ?auto_9415 ?auto_9425 ) ) ( not ( = ?auto_9428 ?auto_9410 ) ) ( not ( = ?auto_9428 ?auto_9429 ) ) ( not ( = ?auto_9428 ?auto_9420 ) ) ( not ( = ?auto_9428 ?auto_9424 ) ) ( not ( = ?auto_9413 ?auto_9416 ) ) ( not ( = ?auto_9413 ?auto_9423 ) ) ( not ( = ?auto_9413 ?auto_9426 ) ) ( not ( = ?auto_9413 ?auto_9422 ) ) ( not ( = ?auto_9413 ?auto_9430 ) ) ( not ( = ?auto_9413 ?auto_9421 ) ) ( not ( = ?auto_9395 ?auto_9403 ) ) ( not ( = ?auto_9395 ?auto_9412 ) ) ( not ( = ?auto_9396 ?auto_9403 ) ) ( not ( = ?auto_9396 ?auto_9412 ) ) ( not ( = ?auto_9397 ?auto_9403 ) ) ( not ( = ?auto_9397 ?auto_9412 ) ) ( not ( = ?auto_9398 ?auto_9403 ) ) ( not ( = ?auto_9398 ?auto_9412 ) ) ( not ( = ?auto_9399 ?auto_9403 ) ) ( not ( = ?auto_9399 ?auto_9412 ) ) ( not ( = ?auto_9400 ?auto_9403 ) ) ( not ( = ?auto_9400 ?auto_9412 ) ) ( not ( = ?auto_9401 ?auto_9403 ) ) ( not ( = ?auto_9401 ?auto_9412 ) ) ( not ( = ?auto_9403 ?auto_9413 ) ) ( not ( = ?auto_9403 ?auto_9416 ) ) ( not ( = ?auto_9403 ?auto_9423 ) ) ( not ( = ?auto_9403 ?auto_9426 ) ) ( not ( = ?auto_9403 ?auto_9422 ) ) ( not ( = ?auto_9403 ?auto_9430 ) ) ( not ( = ?auto_9403 ?auto_9421 ) ) ( not ( = ?auto_9417 ?auto_9415 ) ) ( not ( = ?auto_9417 ?auto_9411 ) ) ( not ( = ?auto_9417 ?auto_9427 ) ) ( not ( = ?auto_9417 ?auto_9418 ) ) ( not ( = ?auto_9417 ?auto_9425 ) ) ( not ( = ?auto_9432 ?auto_9428 ) ) ( not ( = ?auto_9432 ?auto_9410 ) ) ( not ( = ?auto_9432 ?auto_9429 ) ) ( not ( = ?auto_9432 ?auto_9420 ) ) ( not ( = ?auto_9432 ?auto_9424 ) ) ( not ( = ?auto_9412 ?auto_9413 ) ) ( not ( = ?auto_9412 ?auto_9416 ) ) ( not ( = ?auto_9412 ?auto_9423 ) ) ( not ( = ?auto_9412 ?auto_9426 ) ) ( not ( = ?auto_9412 ?auto_9422 ) ) ( not ( = ?auto_9412 ?auto_9430 ) ) ( not ( = ?auto_9412 ?auto_9421 ) ) ( not ( = ?auto_9395 ?auto_9404 ) ) ( not ( = ?auto_9395 ?auto_9419 ) ) ( not ( = ?auto_9396 ?auto_9404 ) ) ( not ( = ?auto_9396 ?auto_9419 ) ) ( not ( = ?auto_9397 ?auto_9404 ) ) ( not ( = ?auto_9397 ?auto_9419 ) ) ( not ( = ?auto_9398 ?auto_9404 ) ) ( not ( = ?auto_9398 ?auto_9419 ) ) ( not ( = ?auto_9399 ?auto_9404 ) ) ( not ( = ?auto_9399 ?auto_9419 ) ) ( not ( = ?auto_9400 ?auto_9404 ) ) ( not ( = ?auto_9400 ?auto_9419 ) ) ( not ( = ?auto_9401 ?auto_9404 ) ) ( not ( = ?auto_9401 ?auto_9419 ) ) ( not ( = ?auto_9402 ?auto_9404 ) ) ( not ( = ?auto_9402 ?auto_9419 ) ) ( not ( = ?auto_9404 ?auto_9412 ) ) ( not ( = ?auto_9404 ?auto_9413 ) ) ( not ( = ?auto_9404 ?auto_9416 ) ) ( not ( = ?auto_9404 ?auto_9423 ) ) ( not ( = ?auto_9404 ?auto_9426 ) ) ( not ( = ?auto_9404 ?auto_9422 ) ) ( not ( = ?auto_9404 ?auto_9430 ) ) ( not ( = ?auto_9404 ?auto_9421 ) ) ( not ( = ?auto_9431 ?auto_9417 ) ) ( not ( = ?auto_9431 ?auto_9415 ) ) ( not ( = ?auto_9431 ?auto_9411 ) ) ( not ( = ?auto_9431 ?auto_9427 ) ) ( not ( = ?auto_9431 ?auto_9418 ) ) ( not ( = ?auto_9431 ?auto_9425 ) ) ( not ( = ?auto_9414 ?auto_9432 ) ) ( not ( = ?auto_9414 ?auto_9428 ) ) ( not ( = ?auto_9414 ?auto_9410 ) ) ( not ( = ?auto_9414 ?auto_9429 ) ) ( not ( = ?auto_9414 ?auto_9420 ) ) ( not ( = ?auto_9414 ?auto_9424 ) ) ( not ( = ?auto_9419 ?auto_9412 ) ) ( not ( = ?auto_9419 ?auto_9413 ) ) ( not ( = ?auto_9419 ?auto_9416 ) ) ( not ( = ?auto_9419 ?auto_9423 ) ) ( not ( = ?auto_9419 ?auto_9426 ) ) ( not ( = ?auto_9419 ?auto_9422 ) ) ( not ( = ?auto_9419 ?auto_9430 ) ) ( not ( = ?auto_9419 ?auto_9421 ) ) ( not ( = ?auto_9395 ?auto_9405 ) ) ( not ( = ?auto_9395 ?auto_9406 ) ) ( not ( = ?auto_9396 ?auto_9405 ) ) ( not ( = ?auto_9396 ?auto_9406 ) ) ( not ( = ?auto_9397 ?auto_9405 ) ) ( not ( = ?auto_9397 ?auto_9406 ) ) ( not ( = ?auto_9398 ?auto_9405 ) ) ( not ( = ?auto_9398 ?auto_9406 ) ) ( not ( = ?auto_9399 ?auto_9405 ) ) ( not ( = ?auto_9399 ?auto_9406 ) ) ( not ( = ?auto_9400 ?auto_9405 ) ) ( not ( = ?auto_9400 ?auto_9406 ) ) ( not ( = ?auto_9401 ?auto_9405 ) ) ( not ( = ?auto_9401 ?auto_9406 ) ) ( not ( = ?auto_9402 ?auto_9405 ) ) ( not ( = ?auto_9402 ?auto_9406 ) ) ( not ( = ?auto_9403 ?auto_9405 ) ) ( not ( = ?auto_9403 ?auto_9406 ) ) ( not ( = ?auto_9405 ?auto_9419 ) ) ( not ( = ?auto_9405 ?auto_9412 ) ) ( not ( = ?auto_9405 ?auto_9413 ) ) ( not ( = ?auto_9405 ?auto_9416 ) ) ( not ( = ?auto_9405 ?auto_9423 ) ) ( not ( = ?auto_9405 ?auto_9426 ) ) ( not ( = ?auto_9405 ?auto_9422 ) ) ( not ( = ?auto_9405 ?auto_9430 ) ) ( not ( = ?auto_9405 ?auto_9421 ) ) ( not ( = ?auto_9406 ?auto_9419 ) ) ( not ( = ?auto_9406 ?auto_9412 ) ) ( not ( = ?auto_9406 ?auto_9413 ) ) ( not ( = ?auto_9406 ?auto_9416 ) ) ( not ( = ?auto_9406 ?auto_9423 ) ) ( not ( = ?auto_9406 ?auto_9426 ) ) ( not ( = ?auto_9406 ?auto_9422 ) ) ( not ( = ?auto_9406 ?auto_9430 ) ) ( not ( = ?auto_9406 ?auto_9421 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_9395 ?auto_9396 ?auto_9397 ?auto_9398 ?auto_9399 ?auto_9400 ?auto_9401 ?auto_9402 ?auto_9403 ?auto_9404 )
      ( MAKE-1CRATE ?auto_9404 ?auto_9405 )
      ( MAKE-10CRATE-VERIFY ?auto_9395 ?auto_9396 ?auto_9397 ?auto_9398 ?auto_9399 ?auto_9400 ?auto_9401 ?auto_9402 ?auto_9403 ?auto_9404 ?auto_9405 ) )
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
      ?auto_9462 - SURFACE
      ?auto_9463 - SURFACE
      ?auto_9464 - SURFACE
      ?auto_9465 - SURFACE
      ?auto_9466 - SURFACE
    )
    :vars
    (
      ?auto_9471 - HOIST
      ?auto_9468 - PLACE
      ?auto_9467 - PLACE
      ?auto_9472 - HOIST
      ?auto_9470 - SURFACE
      ?auto_9491 - PLACE
      ?auto_9493 - HOIST
      ?auto_9490 - SURFACE
      ?auto_9479 - PLACE
      ?auto_9484 - HOIST
      ?auto_9485 - SURFACE
      ?auto_9489 - PLACE
      ?auto_9494 - HOIST
      ?auto_9480 - SURFACE
      ?auto_9486 - PLACE
      ?auto_9487 - HOIST
      ?auto_9481 - SURFACE
      ?auto_9476 - SURFACE
      ?auto_9475 - PLACE
      ?auto_9482 - HOIST
      ?auto_9483 - SURFACE
      ?auto_9473 - PLACE
      ?auto_9477 - HOIST
      ?auto_9488 - SURFACE
      ?auto_9474 - SURFACE
      ?auto_9478 - SURFACE
      ?auto_9492 - SURFACE
      ?auto_9469 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9471 ?auto_9468 ) ( IS-CRATE ?auto_9466 ) ( not ( = ?auto_9467 ?auto_9468 ) ) ( HOIST-AT ?auto_9472 ?auto_9467 ) ( SURFACE-AT ?auto_9466 ?auto_9467 ) ( ON ?auto_9466 ?auto_9470 ) ( CLEAR ?auto_9466 ) ( not ( = ?auto_9465 ?auto_9466 ) ) ( not ( = ?auto_9465 ?auto_9470 ) ) ( not ( = ?auto_9466 ?auto_9470 ) ) ( not ( = ?auto_9471 ?auto_9472 ) ) ( IS-CRATE ?auto_9465 ) ( not ( = ?auto_9491 ?auto_9468 ) ) ( HOIST-AT ?auto_9493 ?auto_9491 ) ( SURFACE-AT ?auto_9465 ?auto_9491 ) ( ON ?auto_9465 ?auto_9490 ) ( CLEAR ?auto_9465 ) ( not ( = ?auto_9464 ?auto_9465 ) ) ( not ( = ?auto_9464 ?auto_9490 ) ) ( not ( = ?auto_9465 ?auto_9490 ) ) ( not ( = ?auto_9471 ?auto_9493 ) ) ( IS-CRATE ?auto_9464 ) ( not ( = ?auto_9479 ?auto_9468 ) ) ( HOIST-AT ?auto_9484 ?auto_9479 ) ( AVAILABLE ?auto_9484 ) ( SURFACE-AT ?auto_9464 ?auto_9479 ) ( ON ?auto_9464 ?auto_9485 ) ( CLEAR ?auto_9464 ) ( not ( = ?auto_9463 ?auto_9464 ) ) ( not ( = ?auto_9463 ?auto_9485 ) ) ( not ( = ?auto_9464 ?auto_9485 ) ) ( not ( = ?auto_9471 ?auto_9484 ) ) ( IS-CRATE ?auto_9463 ) ( not ( = ?auto_9489 ?auto_9468 ) ) ( HOIST-AT ?auto_9494 ?auto_9489 ) ( AVAILABLE ?auto_9494 ) ( SURFACE-AT ?auto_9463 ?auto_9489 ) ( ON ?auto_9463 ?auto_9480 ) ( CLEAR ?auto_9463 ) ( not ( = ?auto_9462 ?auto_9463 ) ) ( not ( = ?auto_9462 ?auto_9480 ) ) ( not ( = ?auto_9463 ?auto_9480 ) ) ( not ( = ?auto_9471 ?auto_9494 ) ) ( IS-CRATE ?auto_9462 ) ( not ( = ?auto_9486 ?auto_9468 ) ) ( HOIST-AT ?auto_9487 ?auto_9486 ) ( AVAILABLE ?auto_9487 ) ( SURFACE-AT ?auto_9462 ?auto_9486 ) ( ON ?auto_9462 ?auto_9481 ) ( CLEAR ?auto_9462 ) ( not ( = ?auto_9461 ?auto_9462 ) ) ( not ( = ?auto_9461 ?auto_9481 ) ) ( not ( = ?auto_9462 ?auto_9481 ) ) ( not ( = ?auto_9471 ?auto_9487 ) ) ( IS-CRATE ?auto_9461 ) ( SURFACE-AT ?auto_9461 ?auto_9491 ) ( ON ?auto_9461 ?auto_9476 ) ( CLEAR ?auto_9461 ) ( not ( = ?auto_9460 ?auto_9461 ) ) ( not ( = ?auto_9460 ?auto_9476 ) ) ( not ( = ?auto_9461 ?auto_9476 ) ) ( IS-CRATE ?auto_9460 ) ( not ( = ?auto_9475 ?auto_9468 ) ) ( HOIST-AT ?auto_9482 ?auto_9475 ) ( SURFACE-AT ?auto_9460 ?auto_9475 ) ( ON ?auto_9460 ?auto_9483 ) ( CLEAR ?auto_9460 ) ( not ( = ?auto_9459 ?auto_9460 ) ) ( not ( = ?auto_9459 ?auto_9483 ) ) ( not ( = ?auto_9460 ?auto_9483 ) ) ( not ( = ?auto_9471 ?auto_9482 ) ) ( IS-CRATE ?auto_9459 ) ( not ( = ?auto_9473 ?auto_9468 ) ) ( HOIST-AT ?auto_9477 ?auto_9473 ) ( AVAILABLE ?auto_9477 ) ( SURFACE-AT ?auto_9459 ?auto_9473 ) ( ON ?auto_9459 ?auto_9488 ) ( CLEAR ?auto_9459 ) ( not ( = ?auto_9458 ?auto_9459 ) ) ( not ( = ?auto_9458 ?auto_9488 ) ) ( not ( = ?auto_9459 ?auto_9488 ) ) ( not ( = ?auto_9471 ?auto_9477 ) ) ( IS-CRATE ?auto_9458 ) ( AVAILABLE ?auto_9482 ) ( SURFACE-AT ?auto_9458 ?auto_9475 ) ( ON ?auto_9458 ?auto_9474 ) ( CLEAR ?auto_9458 ) ( not ( = ?auto_9457 ?auto_9458 ) ) ( not ( = ?auto_9457 ?auto_9474 ) ) ( not ( = ?auto_9458 ?auto_9474 ) ) ( IS-CRATE ?auto_9457 ) ( AVAILABLE ?auto_9493 ) ( SURFACE-AT ?auto_9457 ?auto_9491 ) ( ON ?auto_9457 ?auto_9478 ) ( CLEAR ?auto_9457 ) ( not ( = ?auto_9456 ?auto_9457 ) ) ( not ( = ?auto_9456 ?auto_9478 ) ) ( not ( = ?auto_9457 ?auto_9478 ) ) ( SURFACE-AT ?auto_9455 ?auto_9468 ) ( CLEAR ?auto_9455 ) ( IS-CRATE ?auto_9456 ) ( AVAILABLE ?auto_9471 ) ( AVAILABLE ?auto_9472 ) ( SURFACE-AT ?auto_9456 ?auto_9467 ) ( ON ?auto_9456 ?auto_9492 ) ( CLEAR ?auto_9456 ) ( TRUCK-AT ?auto_9469 ?auto_9468 ) ( not ( = ?auto_9455 ?auto_9456 ) ) ( not ( = ?auto_9455 ?auto_9492 ) ) ( not ( = ?auto_9456 ?auto_9492 ) ) ( not ( = ?auto_9455 ?auto_9457 ) ) ( not ( = ?auto_9455 ?auto_9478 ) ) ( not ( = ?auto_9457 ?auto_9492 ) ) ( not ( = ?auto_9491 ?auto_9467 ) ) ( not ( = ?auto_9493 ?auto_9472 ) ) ( not ( = ?auto_9478 ?auto_9492 ) ) ( not ( = ?auto_9455 ?auto_9458 ) ) ( not ( = ?auto_9455 ?auto_9474 ) ) ( not ( = ?auto_9456 ?auto_9458 ) ) ( not ( = ?auto_9456 ?auto_9474 ) ) ( not ( = ?auto_9458 ?auto_9478 ) ) ( not ( = ?auto_9458 ?auto_9492 ) ) ( not ( = ?auto_9475 ?auto_9491 ) ) ( not ( = ?auto_9475 ?auto_9467 ) ) ( not ( = ?auto_9482 ?auto_9493 ) ) ( not ( = ?auto_9482 ?auto_9472 ) ) ( not ( = ?auto_9474 ?auto_9478 ) ) ( not ( = ?auto_9474 ?auto_9492 ) ) ( not ( = ?auto_9455 ?auto_9459 ) ) ( not ( = ?auto_9455 ?auto_9488 ) ) ( not ( = ?auto_9456 ?auto_9459 ) ) ( not ( = ?auto_9456 ?auto_9488 ) ) ( not ( = ?auto_9457 ?auto_9459 ) ) ( not ( = ?auto_9457 ?auto_9488 ) ) ( not ( = ?auto_9459 ?auto_9474 ) ) ( not ( = ?auto_9459 ?auto_9478 ) ) ( not ( = ?auto_9459 ?auto_9492 ) ) ( not ( = ?auto_9473 ?auto_9475 ) ) ( not ( = ?auto_9473 ?auto_9491 ) ) ( not ( = ?auto_9473 ?auto_9467 ) ) ( not ( = ?auto_9477 ?auto_9482 ) ) ( not ( = ?auto_9477 ?auto_9493 ) ) ( not ( = ?auto_9477 ?auto_9472 ) ) ( not ( = ?auto_9488 ?auto_9474 ) ) ( not ( = ?auto_9488 ?auto_9478 ) ) ( not ( = ?auto_9488 ?auto_9492 ) ) ( not ( = ?auto_9455 ?auto_9460 ) ) ( not ( = ?auto_9455 ?auto_9483 ) ) ( not ( = ?auto_9456 ?auto_9460 ) ) ( not ( = ?auto_9456 ?auto_9483 ) ) ( not ( = ?auto_9457 ?auto_9460 ) ) ( not ( = ?auto_9457 ?auto_9483 ) ) ( not ( = ?auto_9458 ?auto_9460 ) ) ( not ( = ?auto_9458 ?auto_9483 ) ) ( not ( = ?auto_9460 ?auto_9488 ) ) ( not ( = ?auto_9460 ?auto_9474 ) ) ( not ( = ?auto_9460 ?auto_9478 ) ) ( not ( = ?auto_9460 ?auto_9492 ) ) ( not ( = ?auto_9483 ?auto_9488 ) ) ( not ( = ?auto_9483 ?auto_9474 ) ) ( not ( = ?auto_9483 ?auto_9478 ) ) ( not ( = ?auto_9483 ?auto_9492 ) ) ( not ( = ?auto_9455 ?auto_9461 ) ) ( not ( = ?auto_9455 ?auto_9476 ) ) ( not ( = ?auto_9456 ?auto_9461 ) ) ( not ( = ?auto_9456 ?auto_9476 ) ) ( not ( = ?auto_9457 ?auto_9461 ) ) ( not ( = ?auto_9457 ?auto_9476 ) ) ( not ( = ?auto_9458 ?auto_9461 ) ) ( not ( = ?auto_9458 ?auto_9476 ) ) ( not ( = ?auto_9459 ?auto_9461 ) ) ( not ( = ?auto_9459 ?auto_9476 ) ) ( not ( = ?auto_9461 ?auto_9483 ) ) ( not ( = ?auto_9461 ?auto_9488 ) ) ( not ( = ?auto_9461 ?auto_9474 ) ) ( not ( = ?auto_9461 ?auto_9478 ) ) ( not ( = ?auto_9461 ?auto_9492 ) ) ( not ( = ?auto_9476 ?auto_9483 ) ) ( not ( = ?auto_9476 ?auto_9488 ) ) ( not ( = ?auto_9476 ?auto_9474 ) ) ( not ( = ?auto_9476 ?auto_9478 ) ) ( not ( = ?auto_9476 ?auto_9492 ) ) ( not ( = ?auto_9455 ?auto_9462 ) ) ( not ( = ?auto_9455 ?auto_9481 ) ) ( not ( = ?auto_9456 ?auto_9462 ) ) ( not ( = ?auto_9456 ?auto_9481 ) ) ( not ( = ?auto_9457 ?auto_9462 ) ) ( not ( = ?auto_9457 ?auto_9481 ) ) ( not ( = ?auto_9458 ?auto_9462 ) ) ( not ( = ?auto_9458 ?auto_9481 ) ) ( not ( = ?auto_9459 ?auto_9462 ) ) ( not ( = ?auto_9459 ?auto_9481 ) ) ( not ( = ?auto_9460 ?auto_9462 ) ) ( not ( = ?auto_9460 ?auto_9481 ) ) ( not ( = ?auto_9462 ?auto_9476 ) ) ( not ( = ?auto_9462 ?auto_9483 ) ) ( not ( = ?auto_9462 ?auto_9488 ) ) ( not ( = ?auto_9462 ?auto_9474 ) ) ( not ( = ?auto_9462 ?auto_9478 ) ) ( not ( = ?auto_9462 ?auto_9492 ) ) ( not ( = ?auto_9486 ?auto_9491 ) ) ( not ( = ?auto_9486 ?auto_9475 ) ) ( not ( = ?auto_9486 ?auto_9473 ) ) ( not ( = ?auto_9486 ?auto_9467 ) ) ( not ( = ?auto_9487 ?auto_9493 ) ) ( not ( = ?auto_9487 ?auto_9482 ) ) ( not ( = ?auto_9487 ?auto_9477 ) ) ( not ( = ?auto_9487 ?auto_9472 ) ) ( not ( = ?auto_9481 ?auto_9476 ) ) ( not ( = ?auto_9481 ?auto_9483 ) ) ( not ( = ?auto_9481 ?auto_9488 ) ) ( not ( = ?auto_9481 ?auto_9474 ) ) ( not ( = ?auto_9481 ?auto_9478 ) ) ( not ( = ?auto_9481 ?auto_9492 ) ) ( not ( = ?auto_9455 ?auto_9463 ) ) ( not ( = ?auto_9455 ?auto_9480 ) ) ( not ( = ?auto_9456 ?auto_9463 ) ) ( not ( = ?auto_9456 ?auto_9480 ) ) ( not ( = ?auto_9457 ?auto_9463 ) ) ( not ( = ?auto_9457 ?auto_9480 ) ) ( not ( = ?auto_9458 ?auto_9463 ) ) ( not ( = ?auto_9458 ?auto_9480 ) ) ( not ( = ?auto_9459 ?auto_9463 ) ) ( not ( = ?auto_9459 ?auto_9480 ) ) ( not ( = ?auto_9460 ?auto_9463 ) ) ( not ( = ?auto_9460 ?auto_9480 ) ) ( not ( = ?auto_9461 ?auto_9463 ) ) ( not ( = ?auto_9461 ?auto_9480 ) ) ( not ( = ?auto_9463 ?auto_9481 ) ) ( not ( = ?auto_9463 ?auto_9476 ) ) ( not ( = ?auto_9463 ?auto_9483 ) ) ( not ( = ?auto_9463 ?auto_9488 ) ) ( not ( = ?auto_9463 ?auto_9474 ) ) ( not ( = ?auto_9463 ?auto_9478 ) ) ( not ( = ?auto_9463 ?auto_9492 ) ) ( not ( = ?auto_9489 ?auto_9486 ) ) ( not ( = ?auto_9489 ?auto_9491 ) ) ( not ( = ?auto_9489 ?auto_9475 ) ) ( not ( = ?auto_9489 ?auto_9473 ) ) ( not ( = ?auto_9489 ?auto_9467 ) ) ( not ( = ?auto_9494 ?auto_9487 ) ) ( not ( = ?auto_9494 ?auto_9493 ) ) ( not ( = ?auto_9494 ?auto_9482 ) ) ( not ( = ?auto_9494 ?auto_9477 ) ) ( not ( = ?auto_9494 ?auto_9472 ) ) ( not ( = ?auto_9480 ?auto_9481 ) ) ( not ( = ?auto_9480 ?auto_9476 ) ) ( not ( = ?auto_9480 ?auto_9483 ) ) ( not ( = ?auto_9480 ?auto_9488 ) ) ( not ( = ?auto_9480 ?auto_9474 ) ) ( not ( = ?auto_9480 ?auto_9478 ) ) ( not ( = ?auto_9480 ?auto_9492 ) ) ( not ( = ?auto_9455 ?auto_9464 ) ) ( not ( = ?auto_9455 ?auto_9485 ) ) ( not ( = ?auto_9456 ?auto_9464 ) ) ( not ( = ?auto_9456 ?auto_9485 ) ) ( not ( = ?auto_9457 ?auto_9464 ) ) ( not ( = ?auto_9457 ?auto_9485 ) ) ( not ( = ?auto_9458 ?auto_9464 ) ) ( not ( = ?auto_9458 ?auto_9485 ) ) ( not ( = ?auto_9459 ?auto_9464 ) ) ( not ( = ?auto_9459 ?auto_9485 ) ) ( not ( = ?auto_9460 ?auto_9464 ) ) ( not ( = ?auto_9460 ?auto_9485 ) ) ( not ( = ?auto_9461 ?auto_9464 ) ) ( not ( = ?auto_9461 ?auto_9485 ) ) ( not ( = ?auto_9462 ?auto_9464 ) ) ( not ( = ?auto_9462 ?auto_9485 ) ) ( not ( = ?auto_9464 ?auto_9480 ) ) ( not ( = ?auto_9464 ?auto_9481 ) ) ( not ( = ?auto_9464 ?auto_9476 ) ) ( not ( = ?auto_9464 ?auto_9483 ) ) ( not ( = ?auto_9464 ?auto_9488 ) ) ( not ( = ?auto_9464 ?auto_9474 ) ) ( not ( = ?auto_9464 ?auto_9478 ) ) ( not ( = ?auto_9464 ?auto_9492 ) ) ( not ( = ?auto_9479 ?auto_9489 ) ) ( not ( = ?auto_9479 ?auto_9486 ) ) ( not ( = ?auto_9479 ?auto_9491 ) ) ( not ( = ?auto_9479 ?auto_9475 ) ) ( not ( = ?auto_9479 ?auto_9473 ) ) ( not ( = ?auto_9479 ?auto_9467 ) ) ( not ( = ?auto_9484 ?auto_9494 ) ) ( not ( = ?auto_9484 ?auto_9487 ) ) ( not ( = ?auto_9484 ?auto_9493 ) ) ( not ( = ?auto_9484 ?auto_9482 ) ) ( not ( = ?auto_9484 ?auto_9477 ) ) ( not ( = ?auto_9484 ?auto_9472 ) ) ( not ( = ?auto_9485 ?auto_9480 ) ) ( not ( = ?auto_9485 ?auto_9481 ) ) ( not ( = ?auto_9485 ?auto_9476 ) ) ( not ( = ?auto_9485 ?auto_9483 ) ) ( not ( = ?auto_9485 ?auto_9488 ) ) ( not ( = ?auto_9485 ?auto_9474 ) ) ( not ( = ?auto_9485 ?auto_9478 ) ) ( not ( = ?auto_9485 ?auto_9492 ) ) ( not ( = ?auto_9455 ?auto_9465 ) ) ( not ( = ?auto_9455 ?auto_9490 ) ) ( not ( = ?auto_9456 ?auto_9465 ) ) ( not ( = ?auto_9456 ?auto_9490 ) ) ( not ( = ?auto_9457 ?auto_9465 ) ) ( not ( = ?auto_9457 ?auto_9490 ) ) ( not ( = ?auto_9458 ?auto_9465 ) ) ( not ( = ?auto_9458 ?auto_9490 ) ) ( not ( = ?auto_9459 ?auto_9465 ) ) ( not ( = ?auto_9459 ?auto_9490 ) ) ( not ( = ?auto_9460 ?auto_9465 ) ) ( not ( = ?auto_9460 ?auto_9490 ) ) ( not ( = ?auto_9461 ?auto_9465 ) ) ( not ( = ?auto_9461 ?auto_9490 ) ) ( not ( = ?auto_9462 ?auto_9465 ) ) ( not ( = ?auto_9462 ?auto_9490 ) ) ( not ( = ?auto_9463 ?auto_9465 ) ) ( not ( = ?auto_9463 ?auto_9490 ) ) ( not ( = ?auto_9465 ?auto_9485 ) ) ( not ( = ?auto_9465 ?auto_9480 ) ) ( not ( = ?auto_9465 ?auto_9481 ) ) ( not ( = ?auto_9465 ?auto_9476 ) ) ( not ( = ?auto_9465 ?auto_9483 ) ) ( not ( = ?auto_9465 ?auto_9488 ) ) ( not ( = ?auto_9465 ?auto_9474 ) ) ( not ( = ?auto_9465 ?auto_9478 ) ) ( not ( = ?auto_9465 ?auto_9492 ) ) ( not ( = ?auto_9490 ?auto_9485 ) ) ( not ( = ?auto_9490 ?auto_9480 ) ) ( not ( = ?auto_9490 ?auto_9481 ) ) ( not ( = ?auto_9490 ?auto_9476 ) ) ( not ( = ?auto_9490 ?auto_9483 ) ) ( not ( = ?auto_9490 ?auto_9488 ) ) ( not ( = ?auto_9490 ?auto_9474 ) ) ( not ( = ?auto_9490 ?auto_9478 ) ) ( not ( = ?auto_9490 ?auto_9492 ) ) ( not ( = ?auto_9455 ?auto_9466 ) ) ( not ( = ?auto_9455 ?auto_9470 ) ) ( not ( = ?auto_9456 ?auto_9466 ) ) ( not ( = ?auto_9456 ?auto_9470 ) ) ( not ( = ?auto_9457 ?auto_9466 ) ) ( not ( = ?auto_9457 ?auto_9470 ) ) ( not ( = ?auto_9458 ?auto_9466 ) ) ( not ( = ?auto_9458 ?auto_9470 ) ) ( not ( = ?auto_9459 ?auto_9466 ) ) ( not ( = ?auto_9459 ?auto_9470 ) ) ( not ( = ?auto_9460 ?auto_9466 ) ) ( not ( = ?auto_9460 ?auto_9470 ) ) ( not ( = ?auto_9461 ?auto_9466 ) ) ( not ( = ?auto_9461 ?auto_9470 ) ) ( not ( = ?auto_9462 ?auto_9466 ) ) ( not ( = ?auto_9462 ?auto_9470 ) ) ( not ( = ?auto_9463 ?auto_9466 ) ) ( not ( = ?auto_9463 ?auto_9470 ) ) ( not ( = ?auto_9464 ?auto_9466 ) ) ( not ( = ?auto_9464 ?auto_9470 ) ) ( not ( = ?auto_9466 ?auto_9490 ) ) ( not ( = ?auto_9466 ?auto_9485 ) ) ( not ( = ?auto_9466 ?auto_9480 ) ) ( not ( = ?auto_9466 ?auto_9481 ) ) ( not ( = ?auto_9466 ?auto_9476 ) ) ( not ( = ?auto_9466 ?auto_9483 ) ) ( not ( = ?auto_9466 ?auto_9488 ) ) ( not ( = ?auto_9466 ?auto_9474 ) ) ( not ( = ?auto_9466 ?auto_9478 ) ) ( not ( = ?auto_9466 ?auto_9492 ) ) ( not ( = ?auto_9470 ?auto_9490 ) ) ( not ( = ?auto_9470 ?auto_9485 ) ) ( not ( = ?auto_9470 ?auto_9480 ) ) ( not ( = ?auto_9470 ?auto_9481 ) ) ( not ( = ?auto_9470 ?auto_9476 ) ) ( not ( = ?auto_9470 ?auto_9483 ) ) ( not ( = ?auto_9470 ?auto_9488 ) ) ( not ( = ?auto_9470 ?auto_9474 ) ) ( not ( = ?auto_9470 ?auto_9478 ) ) ( not ( = ?auto_9470 ?auto_9492 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_9455 ?auto_9456 ?auto_9457 ?auto_9458 ?auto_9459 ?auto_9460 ?auto_9461 ?auto_9462 ?auto_9463 ?auto_9464 ?auto_9465 )
      ( MAKE-1CRATE ?auto_9465 ?auto_9466 )
      ( MAKE-11CRATE-VERIFY ?auto_9455 ?auto_9456 ?auto_9457 ?auto_9458 ?auto_9459 ?auto_9460 ?auto_9461 ?auto_9462 ?auto_9463 ?auto_9464 ?auto_9465 ?auto_9466 ) )
  )

)

