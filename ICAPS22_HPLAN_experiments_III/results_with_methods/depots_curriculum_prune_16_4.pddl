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

  ( :method MAKE-12CRATE-VERIFY
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
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
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
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-14CRATE-VERIFY
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
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-15CRATE-VERIFY
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
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-16CRATE-VERIFY
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
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
      ?c15 - SURFACE
      ?c16 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( ON ?c16 ?c15 ) ( CLEAR ?c16 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27090 - SURFACE
      ?auto_27091 - SURFACE
    )
    :vars
    (
      ?auto_27092 - HOIST
      ?auto_27093 - PLACE
      ?auto_27095 - PLACE
      ?auto_27096 - HOIST
      ?auto_27097 - SURFACE
      ?auto_27094 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27092 ?auto_27093 ) ( SURFACE-AT ?auto_27090 ?auto_27093 ) ( CLEAR ?auto_27090 ) ( IS-CRATE ?auto_27091 ) ( AVAILABLE ?auto_27092 ) ( not ( = ?auto_27095 ?auto_27093 ) ) ( HOIST-AT ?auto_27096 ?auto_27095 ) ( AVAILABLE ?auto_27096 ) ( SURFACE-AT ?auto_27091 ?auto_27095 ) ( ON ?auto_27091 ?auto_27097 ) ( CLEAR ?auto_27091 ) ( TRUCK-AT ?auto_27094 ?auto_27093 ) ( not ( = ?auto_27090 ?auto_27091 ) ) ( not ( = ?auto_27090 ?auto_27097 ) ) ( not ( = ?auto_27091 ?auto_27097 ) ) ( not ( = ?auto_27092 ?auto_27096 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27094 ?auto_27093 ?auto_27095 )
      ( !LIFT ?auto_27096 ?auto_27091 ?auto_27097 ?auto_27095 )
      ( !LOAD ?auto_27096 ?auto_27091 ?auto_27094 ?auto_27095 )
      ( !DRIVE ?auto_27094 ?auto_27095 ?auto_27093 )
      ( !UNLOAD ?auto_27092 ?auto_27091 ?auto_27094 ?auto_27093 )
      ( !DROP ?auto_27092 ?auto_27091 ?auto_27090 ?auto_27093 )
      ( MAKE-1CRATE-VERIFY ?auto_27090 ?auto_27091 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27111 - SURFACE
      ?auto_27112 - SURFACE
      ?auto_27113 - SURFACE
    )
    :vars
    (
      ?auto_27115 - HOIST
      ?auto_27116 - PLACE
      ?auto_27118 - PLACE
      ?auto_27114 - HOIST
      ?auto_27119 - SURFACE
      ?auto_27121 - PLACE
      ?auto_27120 - HOIST
      ?auto_27122 - SURFACE
      ?auto_27117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27115 ?auto_27116 ) ( IS-CRATE ?auto_27113 ) ( not ( = ?auto_27118 ?auto_27116 ) ) ( HOIST-AT ?auto_27114 ?auto_27118 ) ( AVAILABLE ?auto_27114 ) ( SURFACE-AT ?auto_27113 ?auto_27118 ) ( ON ?auto_27113 ?auto_27119 ) ( CLEAR ?auto_27113 ) ( not ( = ?auto_27112 ?auto_27113 ) ) ( not ( = ?auto_27112 ?auto_27119 ) ) ( not ( = ?auto_27113 ?auto_27119 ) ) ( not ( = ?auto_27115 ?auto_27114 ) ) ( SURFACE-AT ?auto_27111 ?auto_27116 ) ( CLEAR ?auto_27111 ) ( IS-CRATE ?auto_27112 ) ( AVAILABLE ?auto_27115 ) ( not ( = ?auto_27121 ?auto_27116 ) ) ( HOIST-AT ?auto_27120 ?auto_27121 ) ( AVAILABLE ?auto_27120 ) ( SURFACE-AT ?auto_27112 ?auto_27121 ) ( ON ?auto_27112 ?auto_27122 ) ( CLEAR ?auto_27112 ) ( TRUCK-AT ?auto_27117 ?auto_27116 ) ( not ( = ?auto_27111 ?auto_27112 ) ) ( not ( = ?auto_27111 ?auto_27122 ) ) ( not ( = ?auto_27112 ?auto_27122 ) ) ( not ( = ?auto_27115 ?auto_27120 ) ) ( not ( = ?auto_27111 ?auto_27113 ) ) ( not ( = ?auto_27111 ?auto_27119 ) ) ( not ( = ?auto_27113 ?auto_27122 ) ) ( not ( = ?auto_27118 ?auto_27121 ) ) ( not ( = ?auto_27114 ?auto_27120 ) ) ( not ( = ?auto_27119 ?auto_27122 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27111 ?auto_27112 )
      ( MAKE-1CRATE ?auto_27112 ?auto_27113 )
      ( MAKE-2CRATE-VERIFY ?auto_27111 ?auto_27112 ?auto_27113 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27137 - SURFACE
      ?auto_27138 - SURFACE
      ?auto_27139 - SURFACE
      ?auto_27140 - SURFACE
    )
    :vars
    (
      ?auto_27142 - HOIST
      ?auto_27145 - PLACE
      ?auto_27146 - PLACE
      ?auto_27141 - HOIST
      ?auto_27143 - SURFACE
      ?auto_27147 - PLACE
      ?auto_27151 - HOIST
      ?auto_27152 - SURFACE
      ?auto_27149 - PLACE
      ?auto_27148 - HOIST
      ?auto_27150 - SURFACE
      ?auto_27144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27142 ?auto_27145 ) ( IS-CRATE ?auto_27140 ) ( not ( = ?auto_27146 ?auto_27145 ) ) ( HOIST-AT ?auto_27141 ?auto_27146 ) ( AVAILABLE ?auto_27141 ) ( SURFACE-AT ?auto_27140 ?auto_27146 ) ( ON ?auto_27140 ?auto_27143 ) ( CLEAR ?auto_27140 ) ( not ( = ?auto_27139 ?auto_27140 ) ) ( not ( = ?auto_27139 ?auto_27143 ) ) ( not ( = ?auto_27140 ?auto_27143 ) ) ( not ( = ?auto_27142 ?auto_27141 ) ) ( IS-CRATE ?auto_27139 ) ( not ( = ?auto_27147 ?auto_27145 ) ) ( HOIST-AT ?auto_27151 ?auto_27147 ) ( AVAILABLE ?auto_27151 ) ( SURFACE-AT ?auto_27139 ?auto_27147 ) ( ON ?auto_27139 ?auto_27152 ) ( CLEAR ?auto_27139 ) ( not ( = ?auto_27138 ?auto_27139 ) ) ( not ( = ?auto_27138 ?auto_27152 ) ) ( not ( = ?auto_27139 ?auto_27152 ) ) ( not ( = ?auto_27142 ?auto_27151 ) ) ( SURFACE-AT ?auto_27137 ?auto_27145 ) ( CLEAR ?auto_27137 ) ( IS-CRATE ?auto_27138 ) ( AVAILABLE ?auto_27142 ) ( not ( = ?auto_27149 ?auto_27145 ) ) ( HOIST-AT ?auto_27148 ?auto_27149 ) ( AVAILABLE ?auto_27148 ) ( SURFACE-AT ?auto_27138 ?auto_27149 ) ( ON ?auto_27138 ?auto_27150 ) ( CLEAR ?auto_27138 ) ( TRUCK-AT ?auto_27144 ?auto_27145 ) ( not ( = ?auto_27137 ?auto_27138 ) ) ( not ( = ?auto_27137 ?auto_27150 ) ) ( not ( = ?auto_27138 ?auto_27150 ) ) ( not ( = ?auto_27142 ?auto_27148 ) ) ( not ( = ?auto_27137 ?auto_27139 ) ) ( not ( = ?auto_27137 ?auto_27152 ) ) ( not ( = ?auto_27139 ?auto_27150 ) ) ( not ( = ?auto_27147 ?auto_27149 ) ) ( not ( = ?auto_27151 ?auto_27148 ) ) ( not ( = ?auto_27152 ?auto_27150 ) ) ( not ( = ?auto_27137 ?auto_27140 ) ) ( not ( = ?auto_27137 ?auto_27143 ) ) ( not ( = ?auto_27138 ?auto_27140 ) ) ( not ( = ?auto_27138 ?auto_27143 ) ) ( not ( = ?auto_27140 ?auto_27152 ) ) ( not ( = ?auto_27140 ?auto_27150 ) ) ( not ( = ?auto_27146 ?auto_27147 ) ) ( not ( = ?auto_27146 ?auto_27149 ) ) ( not ( = ?auto_27141 ?auto_27151 ) ) ( not ( = ?auto_27141 ?auto_27148 ) ) ( not ( = ?auto_27143 ?auto_27152 ) ) ( not ( = ?auto_27143 ?auto_27150 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27137 ?auto_27138 ?auto_27139 )
      ( MAKE-1CRATE ?auto_27139 ?auto_27140 )
      ( MAKE-3CRATE-VERIFY ?auto_27137 ?auto_27138 ?auto_27139 ?auto_27140 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27168 - SURFACE
      ?auto_27169 - SURFACE
      ?auto_27170 - SURFACE
      ?auto_27171 - SURFACE
      ?auto_27172 - SURFACE
    )
    :vars
    (
      ?auto_27174 - HOIST
      ?auto_27178 - PLACE
      ?auto_27176 - PLACE
      ?auto_27173 - HOIST
      ?auto_27175 - SURFACE
      ?auto_27181 - PLACE
      ?auto_27187 - HOIST
      ?auto_27182 - SURFACE
      ?auto_27179 - PLACE
      ?auto_27185 - HOIST
      ?auto_27186 - SURFACE
      ?auto_27183 - PLACE
      ?auto_27180 - HOIST
      ?auto_27184 - SURFACE
      ?auto_27177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27174 ?auto_27178 ) ( IS-CRATE ?auto_27172 ) ( not ( = ?auto_27176 ?auto_27178 ) ) ( HOIST-AT ?auto_27173 ?auto_27176 ) ( AVAILABLE ?auto_27173 ) ( SURFACE-AT ?auto_27172 ?auto_27176 ) ( ON ?auto_27172 ?auto_27175 ) ( CLEAR ?auto_27172 ) ( not ( = ?auto_27171 ?auto_27172 ) ) ( not ( = ?auto_27171 ?auto_27175 ) ) ( not ( = ?auto_27172 ?auto_27175 ) ) ( not ( = ?auto_27174 ?auto_27173 ) ) ( IS-CRATE ?auto_27171 ) ( not ( = ?auto_27181 ?auto_27178 ) ) ( HOIST-AT ?auto_27187 ?auto_27181 ) ( AVAILABLE ?auto_27187 ) ( SURFACE-AT ?auto_27171 ?auto_27181 ) ( ON ?auto_27171 ?auto_27182 ) ( CLEAR ?auto_27171 ) ( not ( = ?auto_27170 ?auto_27171 ) ) ( not ( = ?auto_27170 ?auto_27182 ) ) ( not ( = ?auto_27171 ?auto_27182 ) ) ( not ( = ?auto_27174 ?auto_27187 ) ) ( IS-CRATE ?auto_27170 ) ( not ( = ?auto_27179 ?auto_27178 ) ) ( HOIST-AT ?auto_27185 ?auto_27179 ) ( AVAILABLE ?auto_27185 ) ( SURFACE-AT ?auto_27170 ?auto_27179 ) ( ON ?auto_27170 ?auto_27186 ) ( CLEAR ?auto_27170 ) ( not ( = ?auto_27169 ?auto_27170 ) ) ( not ( = ?auto_27169 ?auto_27186 ) ) ( not ( = ?auto_27170 ?auto_27186 ) ) ( not ( = ?auto_27174 ?auto_27185 ) ) ( SURFACE-AT ?auto_27168 ?auto_27178 ) ( CLEAR ?auto_27168 ) ( IS-CRATE ?auto_27169 ) ( AVAILABLE ?auto_27174 ) ( not ( = ?auto_27183 ?auto_27178 ) ) ( HOIST-AT ?auto_27180 ?auto_27183 ) ( AVAILABLE ?auto_27180 ) ( SURFACE-AT ?auto_27169 ?auto_27183 ) ( ON ?auto_27169 ?auto_27184 ) ( CLEAR ?auto_27169 ) ( TRUCK-AT ?auto_27177 ?auto_27178 ) ( not ( = ?auto_27168 ?auto_27169 ) ) ( not ( = ?auto_27168 ?auto_27184 ) ) ( not ( = ?auto_27169 ?auto_27184 ) ) ( not ( = ?auto_27174 ?auto_27180 ) ) ( not ( = ?auto_27168 ?auto_27170 ) ) ( not ( = ?auto_27168 ?auto_27186 ) ) ( not ( = ?auto_27170 ?auto_27184 ) ) ( not ( = ?auto_27179 ?auto_27183 ) ) ( not ( = ?auto_27185 ?auto_27180 ) ) ( not ( = ?auto_27186 ?auto_27184 ) ) ( not ( = ?auto_27168 ?auto_27171 ) ) ( not ( = ?auto_27168 ?auto_27182 ) ) ( not ( = ?auto_27169 ?auto_27171 ) ) ( not ( = ?auto_27169 ?auto_27182 ) ) ( not ( = ?auto_27171 ?auto_27186 ) ) ( not ( = ?auto_27171 ?auto_27184 ) ) ( not ( = ?auto_27181 ?auto_27179 ) ) ( not ( = ?auto_27181 ?auto_27183 ) ) ( not ( = ?auto_27187 ?auto_27185 ) ) ( not ( = ?auto_27187 ?auto_27180 ) ) ( not ( = ?auto_27182 ?auto_27186 ) ) ( not ( = ?auto_27182 ?auto_27184 ) ) ( not ( = ?auto_27168 ?auto_27172 ) ) ( not ( = ?auto_27168 ?auto_27175 ) ) ( not ( = ?auto_27169 ?auto_27172 ) ) ( not ( = ?auto_27169 ?auto_27175 ) ) ( not ( = ?auto_27170 ?auto_27172 ) ) ( not ( = ?auto_27170 ?auto_27175 ) ) ( not ( = ?auto_27172 ?auto_27182 ) ) ( not ( = ?auto_27172 ?auto_27186 ) ) ( not ( = ?auto_27172 ?auto_27184 ) ) ( not ( = ?auto_27176 ?auto_27181 ) ) ( not ( = ?auto_27176 ?auto_27179 ) ) ( not ( = ?auto_27176 ?auto_27183 ) ) ( not ( = ?auto_27173 ?auto_27187 ) ) ( not ( = ?auto_27173 ?auto_27185 ) ) ( not ( = ?auto_27173 ?auto_27180 ) ) ( not ( = ?auto_27175 ?auto_27182 ) ) ( not ( = ?auto_27175 ?auto_27186 ) ) ( not ( = ?auto_27175 ?auto_27184 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_27168 ?auto_27169 ?auto_27170 ?auto_27171 )
      ( MAKE-1CRATE ?auto_27171 ?auto_27172 )
      ( MAKE-4CRATE-VERIFY ?auto_27168 ?auto_27169 ?auto_27170 ?auto_27171 ?auto_27172 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27204 - SURFACE
      ?auto_27205 - SURFACE
      ?auto_27206 - SURFACE
      ?auto_27207 - SURFACE
      ?auto_27208 - SURFACE
      ?auto_27209 - SURFACE
    )
    :vars
    (
      ?auto_27211 - HOIST
      ?auto_27210 - PLACE
      ?auto_27214 - PLACE
      ?auto_27213 - HOIST
      ?auto_27212 - SURFACE
      ?auto_27220 - SURFACE
      ?auto_27221 - PLACE
      ?auto_27225 - HOIST
      ?auto_27218 - SURFACE
      ?auto_27224 - PLACE
      ?auto_27216 - HOIST
      ?auto_27223 - SURFACE
      ?auto_27219 - PLACE
      ?auto_27222 - HOIST
      ?auto_27217 - SURFACE
      ?auto_27215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27211 ?auto_27210 ) ( IS-CRATE ?auto_27209 ) ( not ( = ?auto_27214 ?auto_27210 ) ) ( HOIST-AT ?auto_27213 ?auto_27214 ) ( SURFACE-AT ?auto_27209 ?auto_27214 ) ( ON ?auto_27209 ?auto_27212 ) ( CLEAR ?auto_27209 ) ( not ( = ?auto_27208 ?auto_27209 ) ) ( not ( = ?auto_27208 ?auto_27212 ) ) ( not ( = ?auto_27209 ?auto_27212 ) ) ( not ( = ?auto_27211 ?auto_27213 ) ) ( IS-CRATE ?auto_27208 ) ( AVAILABLE ?auto_27213 ) ( SURFACE-AT ?auto_27208 ?auto_27214 ) ( ON ?auto_27208 ?auto_27220 ) ( CLEAR ?auto_27208 ) ( not ( = ?auto_27207 ?auto_27208 ) ) ( not ( = ?auto_27207 ?auto_27220 ) ) ( not ( = ?auto_27208 ?auto_27220 ) ) ( IS-CRATE ?auto_27207 ) ( not ( = ?auto_27221 ?auto_27210 ) ) ( HOIST-AT ?auto_27225 ?auto_27221 ) ( AVAILABLE ?auto_27225 ) ( SURFACE-AT ?auto_27207 ?auto_27221 ) ( ON ?auto_27207 ?auto_27218 ) ( CLEAR ?auto_27207 ) ( not ( = ?auto_27206 ?auto_27207 ) ) ( not ( = ?auto_27206 ?auto_27218 ) ) ( not ( = ?auto_27207 ?auto_27218 ) ) ( not ( = ?auto_27211 ?auto_27225 ) ) ( IS-CRATE ?auto_27206 ) ( not ( = ?auto_27224 ?auto_27210 ) ) ( HOIST-AT ?auto_27216 ?auto_27224 ) ( AVAILABLE ?auto_27216 ) ( SURFACE-AT ?auto_27206 ?auto_27224 ) ( ON ?auto_27206 ?auto_27223 ) ( CLEAR ?auto_27206 ) ( not ( = ?auto_27205 ?auto_27206 ) ) ( not ( = ?auto_27205 ?auto_27223 ) ) ( not ( = ?auto_27206 ?auto_27223 ) ) ( not ( = ?auto_27211 ?auto_27216 ) ) ( SURFACE-AT ?auto_27204 ?auto_27210 ) ( CLEAR ?auto_27204 ) ( IS-CRATE ?auto_27205 ) ( AVAILABLE ?auto_27211 ) ( not ( = ?auto_27219 ?auto_27210 ) ) ( HOIST-AT ?auto_27222 ?auto_27219 ) ( AVAILABLE ?auto_27222 ) ( SURFACE-AT ?auto_27205 ?auto_27219 ) ( ON ?auto_27205 ?auto_27217 ) ( CLEAR ?auto_27205 ) ( TRUCK-AT ?auto_27215 ?auto_27210 ) ( not ( = ?auto_27204 ?auto_27205 ) ) ( not ( = ?auto_27204 ?auto_27217 ) ) ( not ( = ?auto_27205 ?auto_27217 ) ) ( not ( = ?auto_27211 ?auto_27222 ) ) ( not ( = ?auto_27204 ?auto_27206 ) ) ( not ( = ?auto_27204 ?auto_27223 ) ) ( not ( = ?auto_27206 ?auto_27217 ) ) ( not ( = ?auto_27224 ?auto_27219 ) ) ( not ( = ?auto_27216 ?auto_27222 ) ) ( not ( = ?auto_27223 ?auto_27217 ) ) ( not ( = ?auto_27204 ?auto_27207 ) ) ( not ( = ?auto_27204 ?auto_27218 ) ) ( not ( = ?auto_27205 ?auto_27207 ) ) ( not ( = ?auto_27205 ?auto_27218 ) ) ( not ( = ?auto_27207 ?auto_27223 ) ) ( not ( = ?auto_27207 ?auto_27217 ) ) ( not ( = ?auto_27221 ?auto_27224 ) ) ( not ( = ?auto_27221 ?auto_27219 ) ) ( not ( = ?auto_27225 ?auto_27216 ) ) ( not ( = ?auto_27225 ?auto_27222 ) ) ( not ( = ?auto_27218 ?auto_27223 ) ) ( not ( = ?auto_27218 ?auto_27217 ) ) ( not ( = ?auto_27204 ?auto_27208 ) ) ( not ( = ?auto_27204 ?auto_27220 ) ) ( not ( = ?auto_27205 ?auto_27208 ) ) ( not ( = ?auto_27205 ?auto_27220 ) ) ( not ( = ?auto_27206 ?auto_27208 ) ) ( not ( = ?auto_27206 ?auto_27220 ) ) ( not ( = ?auto_27208 ?auto_27218 ) ) ( not ( = ?auto_27208 ?auto_27223 ) ) ( not ( = ?auto_27208 ?auto_27217 ) ) ( not ( = ?auto_27214 ?auto_27221 ) ) ( not ( = ?auto_27214 ?auto_27224 ) ) ( not ( = ?auto_27214 ?auto_27219 ) ) ( not ( = ?auto_27213 ?auto_27225 ) ) ( not ( = ?auto_27213 ?auto_27216 ) ) ( not ( = ?auto_27213 ?auto_27222 ) ) ( not ( = ?auto_27220 ?auto_27218 ) ) ( not ( = ?auto_27220 ?auto_27223 ) ) ( not ( = ?auto_27220 ?auto_27217 ) ) ( not ( = ?auto_27204 ?auto_27209 ) ) ( not ( = ?auto_27204 ?auto_27212 ) ) ( not ( = ?auto_27205 ?auto_27209 ) ) ( not ( = ?auto_27205 ?auto_27212 ) ) ( not ( = ?auto_27206 ?auto_27209 ) ) ( not ( = ?auto_27206 ?auto_27212 ) ) ( not ( = ?auto_27207 ?auto_27209 ) ) ( not ( = ?auto_27207 ?auto_27212 ) ) ( not ( = ?auto_27209 ?auto_27220 ) ) ( not ( = ?auto_27209 ?auto_27218 ) ) ( not ( = ?auto_27209 ?auto_27223 ) ) ( not ( = ?auto_27209 ?auto_27217 ) ) ( not ( = ?auto_27212 ?auto_27220 ) ) ( not ( = ?auto_27212 ?auto_27218 ) ) ( not ( = ?auto_27212 ?auto_27223 ) ) ( not ( = ?auto_27212 ?auto_27217 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_27204 ?auto_27205 ?auto_27206 ?auto_27207 ?auto_27208 )
      ( MAKE-1CRATE ?auto_27208 ?auto_27209 )
      ( MAKE-5CRATE-VERIFY ?auto_27204 ?auto_27205 ?auto_27206 ?auto_27207 ?auto_27208 ?auto_27209 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_27243 - SURFACE
      ?auto_27244 - SURFACE
      ?auto_27245 - SURFACE
      ?auto_27246 - SURFACE
      ?auto_27247 - SURFACE
      ?auto_27248 - SURFACE
      ?auto_27249 - SURFACE
    )
    :vars
    (
      ?auto_27250 - HOIST
      ?auto_27253 - PLACE
      ?auto_27255 - PLACE
      ?auto_27254 - HOIST
      ?auto_27252 - SURFACE
      ?auto_27262 - PLACE
      ?auto_27268 - HOIST
      ?auto_27264 - SURFACE
      ?auto_27260 - SURFACE
      ?auto_27256 - PLACE
      ?auto_27258 - HOIST
      ?auto_27265 - SURFACE
      ?auto_27267 - PLACE
      ?auto_27257 - HOIST
      ?auto_27266 - SURFACE
      ?auto_27259 - PLACE
      ?auto_27261 - HOIST
      ?auto_27263 - SURFACE
      ?auto_27251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27250 ?auto_27253 ) ( IS-CRATE ?auto_27249 ) ( not ( = ?auto_27255 ?auto_27253 ) ) ( HOIST-AT ?auto_27254 ?auto_27255 ) ( AVAILABLE ?auto_27254 ) ( SURFACE-AT ?auto_27249 ?auto_27255 ) ( ON ?auto_27249 ?auto_27252 ) ( CLEAR ?auto_27249 ) ( not ( = ?auto_27248 ?auto_27249 ) ) ( not ( = ?auto_27248 ?auto_27252 ) ) ( not ( = ?auto_27249 ?auto_27252 ) ) ( not ( = ?auto_27250 ?auto_27254 ) ) ( IS-CRATE ?auto_27248 ) ( not ( = ?auto_27262 ?auto_27253 ) ) ( HOIST-AT ?auto_27268 ?auto_27262 ) ( SURFACE-AT ?auto_27248 ?auto_27262 ) ( ON ?auto_27248 ?auto_27264 ) ( CLEAR ?auto_27248 ) ( not ( = ?auto_27247 ?auto_27248 ) ) ( not ( = ?auto_27247 ?auto_27264 ) ) ( not ( = ?auto_27248 ?auto_27264 ) ) ( not ( = ?auto_27250 ?auto_27268 ) ) ( IS-CRATE ?auto_27247 ) ( AVAILABLE ?auto_27268 ) ( SURFACE-AT ?auto_27247 ?auto_27262 ) ( ON ?auto_27247 ?auto_27260 ) ( CLEAR ?auto_27247 ) ( not ( = ?auto_27246 ?auto_27247 ) ) ( not ( = ?auto_27246 ?auto_27260 ) ) ( not ( = ?auto_27247 ?auto_27260 ) ) ( IS-CRATE ?auto_27246 ) ( not ( = ?auto_27256 ?auto_27253 ) ) ( HOIST-AT ?auto_27258 ?auto_27256 ) ( AVAILABLE ?auto_27258 ) ( SURFACE-AT ?auto_27246 ?auto_27256 ) ( ON ?auto_27246 ?auto_27265 ) ( CLEAR ?auto_27246 ) ( not ( = ?auto_27245 ?auto_27246 ) ) ( not ( = ?auto_27245 ?auto_27265 ) ) ( not ( = ?auto_27246 ?auto_27265 ) ) ( not ( = ?auto_27250 ?auto_27258 ) ) ( IS-CRATE ?auto_27245 ) ( not ( = ?auto_27267 ?auto_27253 ) ) ( HOIST-AT ?auto_27257 ?auto_27267 ) ( AVAILABLE ?auto_27257 ) ( SURFACE-AT ?auto_27245 ?auto_27267 ) ( ON ?auto_27245 ?auto_27266 ) ( CLEAR ?auto_27245 ) ( not ( = ?auto_27244 ?auto_27245 ) ) ( not ( = ?auto_27244 ?auto_27266 ) ) ( not ( = ?auto_27245 ?auto_27266 ) ) ( not ( = ?auto_27250 ?auto_27257 ) ) ( SURFACE-AT ?auto_27243 ?auto_27253 ) ( CLEAR ?auto_27243 ) ( IS-CRATE ?auto_27244 ) ( AVAILABLE ?auto_27250 ) ( not ( = ?auto_27259 ?auto_27253 ) ) ( HOIST-AT ?auto_27261 ?auto_27259 ) ( AVAILABLE ?auto_27261 ) ( SURFACE-AT ?auto_27244 ?auto_27259 ) ( ON ?auto_27244 ?auto_27263 ) ( CLEAR ?auto_27244 ) ( TRUCK-AT ?auto_27251 ?auto_27253 ) ( not ( = ?auto_27243 ?auto_27244 ) ) ( not ( = ?auto_27243 ?auto_27263 ) ) ( not ( = ?auto_27244 ?auto_27263 ) ) ( not ( = ?auto_27250 ?auto_27261 ) ) ( not ( = ?auto_27243 ?auto_27245 ) ) ( not ( = ?auto_27243 ?auto_27266 ) ) ( not ( = ?auto_27245 ?auto_27263 ) ) ( not ( = ?auto_27267 ?auto_27259 ) ) ( not ( = ?auto_27257 ?auto_27261 ) ) ( not ( = ?auto_27266 ?auto_27263 ) ) ( not ( = ?auto_27243 ?auto_27246 ) ) ( not ( = ?auto_27243 ?auto_27265 ) ) ( not ( = ?auto_27244 ?auto_27246 ) ) ( not ( = ?auto_27244 ?auto_27265 ) ) ( not ( = ?auto_27246 ?auto_27266 ) ) ( not ( = ?auto_27246 ?auto_27263 ) ) ( not ( = ?auto_27256 ?auto_27267 ) ) ( not ( = ?auto_27256 ?auto_27259 ) ) ( not ( = ?auto_27258 ?auto_27257 ) ) ( not ( = ?auto_27258 ?auto_27261 ) ) ( not ( = ?auto_27265 ?auto_27266 ) ) ( not ( = ?auto_27265 ?auto_27263 ) ) ( not ( = ?auto_27243 ?auto_27247 ) ) ( not ( = ?auto_27243 ?auto_27260 ) ) ( not ( = ?auto_27244 ?auto_27247 ) ) ( not ( = ?auto_27244 ?auto_27260 ) ) ( not ( = ?auto_27245 ?auto_27247 ) ) ( not ( = ?auto_27245 ?auto_27260 ) ) ( not ( = ?auto_27247 ?auto_27265 ) ) ( not ( = ?auto_27247 ?auto_27266 ) ) ( not ( = ?auto_27247 ?auto_27263 ) ) ( not ( = ?auto_27262 ?auto_27256 ) ) ( not ( = ?auto_27262 ?auto_27267 ) ) ( not ( = ?auto_27262 ?auto_27259 ) ) ( not ( = ?auto_27268 ?auto_27258 ) ) ( not ( = ?auto_27268 ?auto_27257 ) ) ( not ( = ?auto_27268 ?auto_27261 ) ) ( not ( = ?auto_27260 ?auto_27265 ) ) ( not ( = ?auto_27260 ?auto_27266 ) ) ( not ( = ?auto_27260 ?auto_27263 ) ) ( not ( = ?auto_27243 ?auto_27248 ) ) ( not ( = ?auto_27243 ?auto_27264 ) ) ( not ( = ?auto_27244 ?auto_27248 ) ) ( not ( = ?auto_27244 ?auto_27264 ) ) ( not ( = ?auto_27245 ?auto_27248 ) ) ( not ( = ?auto_27245 ?auto_27264 ) ) ( not ( = ?auto_27246 ?auto_27248 ) ) ( not ( = ?auto_27246 ?auto_27264 ) ) ( not ( = ?auto_27248 ?auto_27260 ) ) ( not ( = ?auto_27248 ?auto_27265 ) ) ( not ( = ?auto_27248 ?auto_27266 ) ) ( not ( = ?auto_27248 ?auto_27263 ) ) ( not ( = ?auto_27264 ?auto_27260 ) ) ( not ( = ?auto_27264 ?auto_27265 ) ) ( not ( = ?auto_27264 ?auto_27266 ) ) ( not ( = ?auto_27264 ?auto_27263 ) ) ( not ( = ?auto_27243 ?auto_27249 ) ) ( not ( = ?auto_27243 ?auto_27252 ) ) ( not ( = ?auto_27244 ?auto_27249 ) ) ( not ( = ?auto_27244 ?auto_27252 ) ) ( not ( = ?auto_27245 ?auto_27249 ) ) ( not ( = ?auto_27245 ?auto_27252 ) ) ( not ( = ?auto_27246 ?auto_27249 ) ) ( not ( = ?auto_27246 ?auto_27252 ) ) ( not ( = ?auto_27247 ?auto_27249 ) ) ( not ( = ?auto_27247 ?auto_27252 ) ) ( not ( = ?auto_27249 ?auto_27264 ) ) ( not ( = ?auto_27249 ?auto_27260 ) ) ( not ( = ?auto_27249 ?auto_27265 ) ) ( not ( = ?auto_27249 ?auto_27266 ) ) ( not ( = ?auto_27249 ?auto_27263 ) ) ( not ( = ?auto_27255 ?auto_27262 ) ) ( not ( = ?auto_27255 ?auto_27256 ) ) ( not ( = ?auto_27255 ?auto_27267 ) ) ( not ( = ?auto_27255 ?auto_27259 ) ) ( not ( = ?auto_27254 ?auto_27268 ) ) ( not ( = ?auto_27254 ?auto_27258 ) ) ( not ( = ?auto_27254 ?auto_27257 ) ) ( not ( = ?auto_27254 ?auto_27261 ) ) ( not ( = ?auto_27252 ?auto_27264 ) ) ( not ( = ?auto_27252 ?auto_27260 ) ) ( not ( = ?auto_27252 ?auto_27265 ) ) ( not ( = ?auto_27252 ?auto_27266 ) ) ( not ( = ?auto_27252 ?auto_27263 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_27243 ?auto_27244 ?auto_27245 ?auto_27246 ?auto_27247 ?auto_27248 )
      ( MAKE-1CRATE ?auto_27248 ?auto_27249 )
      ( MAKE-6CRATE-VERIFY ?auto_27243 ?auto_27244 ?auto_27245 ?auto_27246 ?auto_27247 ?auto_27248 ?auto_27249 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_27287 - SURFACE
      ?auto_27288 - SURFACE
      ?auto_27289 - SURFACE
      ?auto_27290 - SURFACE
      ?auto_27291 - SURFACE
      ?auto_27292 - SURFACE
      ?auto_27293 - SURFACE
      ?auto_27294 - SURFACE
    )
    :vars
    (
      ?auto_27295 - HOIST
      ?auto_27299 - PLACE
      ?auto_27300 - PLACE
      ?auto_27298 - HOIST
      ?auto_27297 - SURFACE
      ?auto_27304 - PLACE
      ?auto_27305 - HOIST
      ?auto_27302 - SURFACE
      ?auto_27316 - PLACE
      ?auto_27312 - HOIST
      ?auto_27313 - SURFACE
      ?auto_27309 - SURFACE
      ?auto_27303 - PLACE
      ?auto_27308 - HOIST
      ?auto_27307 - SURFACE
      ?auto_27301 - PLACE
      ?auto_27306 - HOIST
      ?auto_27310 - SURFACE
      ?auto_27315 - PLACE
      ?auto_27311 - HOIST
      ?auto_27314 - SURFACE
      ?auto_27296 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27295 ?auto_27299 ) ( IS-CRATE ?auto_27294 ) ( not ( = ?auto_27300 ?auto_27299 ) ) ( HOIST-AT ?auto_27298 ?auto_27300 ) ( AVAILABLE ?auto_27298 ) ( SURFACE-AT ?auto_27294 ?auto_27300 ) ( ON ?auto_27294 ?auto_27297 ) ( CLEAR ?auto_27294 ) ( not ( = ?auto_27293 ?auto_27294 ) ) ( not ( = ?auto_27293 ?auto_27297 ) ) ( not ( = ?auto_27294 ?auto_27297 ) ) ( not ( = ?auto_27295 ?auto_27298 ) ) ( IS-CRATE ?auto_27293 ) ( not ( = ?auto_27304 ?auto_27299 ) ) ( HOIST-AT ?auto_27305 ?auto_27304 ) ( AVAILABLE ?auto_27305 ) ( SURFACE-AT ?auto_27293 ?auto_27304 ) ( ON ?auto_27293 ?auto_27302 ) ( CLEAR ?auto_27293 ) ( not ( = ?auto_27292 ?auto_27293 ) ) ( not ( = ?auto_27292 ?auto_27302 ) ) ( not ( = ?auto_27293 ?auto_27302 ) ) ( not ( = ?auto_27295 ?auto_27305 ) ) ( IS-CRATE ?auto_27292 ) ( not ( = ?auto_27316 ?auto_27299 ) ) ( HOIST-AT ?auto_27312 ?auto_27316 ) ( SURFACE-AT ?auto_27292 ?auto_27316 ) ( ON ?auto_27292 ?auto_27313 ) ( CLEAR ?auto_27292 ) ( not ( = ?auto_27291 ?auto_27292 ) ) ( not ( = ?auto_27291 ?auto_27313 ) ) ( not ( = ?auto_27292 ?auto_27313 ) ) ( not ( = ?auto_27295 ?auto_27312 ) ) ( IS-CRATE ?auto_27291 ) ( AVAILABLE ?auto_27312 ) ( SURFACE-AT ?auto_27291 ?auto_27316 ) ( ON ?auto_27291 ?auto_27309 ) ( CLEAR ?auto_27291 ) ( not ( = ?auto_27290 ?auto_27291 ) ) ( not ( = ?auto_27290 ?auto_27309 ) ) ( not ( = ?auto_27291 ?auto_27309 ) ) ( IS-CRATE ?auto_27290 ) ( not ( = ?auto_27303 ?auto_27299 ) ) ( HOIST-AT ?auto_27308 ?auto_27303 ) ( AVAILABLE ?auto_27308 ) ( SURFACE-AT ?auto_27290 ?auto_27303 ) ( ON ?auto_27290 ?auto_27307 ) ( CLEAR ?auto_27290 ) ( not ( = ?auto_27289 ?auto_27290 ) ) ( not ( = ?auto_27289 ?auto_27307 ) ) ( not ( = ?auto_27290 ?auto_27307 ) ) ( not ( = ?auto_27295 ?auto_27308 ) ) ( IS-CRATE ?auto_27289 ) ( not ( = ?auto_27301 ?auto_27299 ) ) ( HOIST-AT ?auto_27306 ?auto_27301 ) ( AVAILABLE ?auto_27306 ) ( SURFACE-AT ?auto_27289 ?auto_27301 ) ( ON ?auto_27289 ?auto_27310 ) ( CLEAR ?auto_27289 ) ( not ( = ?auto_27288 ?auto_27289 ) ) ( not ( = ?auto_27288 ?auto_27310 ) ) ( not ( = ?auto_27289 ?auto_27310 ) ) ( not ( = ?auto_27295 ?auto_27306 ) ) ( SURFACE-AT ?auto_27287 ?auto_27299 ) ( CLEAR ?auto_27287 ) ( IS-CRATE ?auto_27288 ) ( AVAILABLE ?auto_27295 ) ( not ( = ?auto_27315 ?auto_27299 ) ) ( HOIST-AT ?auto_27311 ?auto_27315 ) ( AVAILABLE ?auto_27311 ) ( SURFACE-AT ?auto_27288 ?auto_27315 ) ( ON ?auto_27288 ?auto_27314 ) ( CLEAR ?auto_27288 ) ( TRUCK-AT ?auto_27296 ?auto_27299 ) ( not ( = ?auto_27287 ?auto_27288 ) ) ( not ( = ?auto_27287 ?auto_27314 ) ) ( not ( = ?auto_27288 ?auto_27314 ) ) ( not ( = ?auto_27295 ?auto_27311 ) ) ( not ( = ?auto_27287 ?auto_27289 ) ) ( not ( = ?auto_27287 ?auto_27310 ) ) ( not ( = ?auto_27289 ?auto_27314 ) ) ( not ( = ?auto_27301 ?auto_27315 ) ) ( not ( = ?auto_27306 ?auto_27311 ) ) ( not ( = ?auto_27310 ?auto_27314 ) ) ( not ( = ?auto_27287 ?auto_27290 ) ) ( not ( = ?auto_27287 ?auto_27307 ) ) ( not ( = ?auto_27288 ?auto_27290 ) ) ( not ( = ?auto_27288 ?auto_27307 ) ) ( not ( = ?auto_27290 ?auto_27310 ) ) ( not ( = ?auto_27290 ?auto_27314 ) ) ( not ( = ?auto_27303 ?auto_27301 ) ) ( not ( = ?auto_27303 ?auto_27315 ) ) ( not ( = ?auto_27308 ?auto_27306 ) ) ( not ( = ?auto_27308 ?auto_27311 ) ) ( not ( = ?auto_27307 ?auto_27310 ) ) ( not ( = ?auto_27307 ?auto_27314 ) ) ( not ( = ?auto_27287 ?auto_27291 ) ) ( not ( = ?auto_27287 ?auto_27309 ) ) ( not ( = ?auto_27288 ?auto_27291 ) ) ( not ( = ?auto_27288 ?auto_27309 ) ) ( not ( = ?auto_27289 ?auto_27291 ) ) ( not ( = ?auto_27289 ?auto_27309 ) ) ( not ( = ?auto_27291 ?auto_27307 ) ) ( not ( = ?auto_27291 ?auto_27310 ) ) ( not ( = ?auto_27291 ?auto_27314 ) ) ( not ( = ?auto_27316 ?auto_27303 ) ) ( not ( = ?auto_27316 ?auto_27301 ) ) ( not ( = ?auto_27316 ?auto_27315 ) ) ( not ( = ?auto_27312 ?auto_27308 ) ) ( not ( = ?auto_27312 ?auto_27306 ) ) ( not ( = ?auto_27312 ?auto_27311 ) ) ( not ( = ?auto_27309 ?auto_27307 ) ) ( not ( = ?auto_27309 ?auto_27310 ) ) ( not ( = ?auto_27309 ?auto_27314 ) ) ( not ( = ?auto_27287 ?auto_27292 ) ) ( not ( = ?auto_27287 ?auto_27313 ) ) ( not ( = ?auto_27288 ?auto_27292 ) ) ( not ( = ?auto_27288 ?auto_27313 ) ) ( not ( = ?auto_27289 ?auto_27292 ) ) ( not ( = ?auto_27289 ?auto_27313 ) ) ( not ( = ?auto_27290 ?auto_27292 ) ) ( not ( = ?auto_27290 ?auto_27313 ) ) ( not ( = ?auto_27292 ?auto_27309 ) ) ( not ( = ?auto_27292 ?auto_27307 ) ) ( not ( = ?auto_27292 ?auto_27310 ) ) ( not ( = ?auto_27292 ?auto_27314 ) ) ( not ( = ?auto_27313 ?auto_27309 ) ) ( not ( = ?auto_27313 ?auto_27307 ) ) ( not ( = ?auto_27313 ?auto_27310 ) ) ( not ( = ?auto_27313 ?auto_27314 ) ) ( not ( = ?auto_27287 ?auto_27293 ) ) ( not ( = ?auto_27287 ?auto_27302 ) ) ( not ( = ?auto_27288 ?auto_27293 ) ) ( not ( = ?auto_27288 ?auto_27302 ) ) ( not ( = ?auto_27289 ?auto_27293 ) ) ( not ( = ?auto_27289 ?auto_27302 ) ) ( not ( = ?auto_27290 ?auto_27293 ) ) ( not ( = ?auto_27290 ?auto_27302 ) ) ( not ( = ?auto_27291 ?auto_27293 ) ) ( not ( = ?auto_27291 ?auto_27302 ) ) ( not ( = ?auto_27293 ?auto_27313 ) ) ( not ( = ?auto_27293 ?auto_27309 ) ) ( not ( = ?auto_27293 ?auto_27307 ) ) ( not ( = ?auto_27293 ?auto_27310 ) ) ( not ( = ?auto_27293 ?auto_27314 ) ) ( not ( = ?auto_27304 ?auto_27316 ) ) ( not ( = ?auto_27304 ?auto_27303 ) ) ( not ( = ?auto_27304 ?auto_27301 ) ) ( not ( = ?auto_27304 ?auto_27315 ) ) ( not ( = ?auto_27305 ?auto_27312 ) ) ( not ( = ?auto_27305 ?auto_27308 ) ) ( not ( = ?auto_27305 ?auto_27306 ) ) ( not ( = ?auto_27305 ?auto_27311 ) ) ( not ( = ?auto_27302 ?auto_27313 ) ) ( not ( = ?auto_27302 ?auto_27309 ) ) ( not ( = ?auto_27302 ?auto_27307 ) ) ( not ( = ?auto_27302 ?auto_27310 ) ) ( not ( = ?auto_27302 ?auto_27314 ) ) ( not ( = ?auto_27287 ?auto_27294 ) ) ( not ( = ?auto_27287 ?auto_27297 ) ) ( not ( = ?auto_27288 ?auto_27294 ) ) ( not ( = ?auto_27288 ?auto_27297 ) ) ( not ( = ?auto_27289 ?auto_27294 ) ) ( not ( = ?auto_27289 ?auto_27297 ) ) ( not ( = ?auto_27290 ?auto_27294 ) ) ( not ( = ?auto_27290 ?auto_27297 ) ) ( not ( = ?auto_27291 ?auto_27294 ) ) ( not ( = ?auto_27291 ?auto_27297 ) ) ( not ( = ?auto_27292 ?auto_27294 ) ) ( not ( = ?auto_27292 ?auto_27297 ) ) ( not ( = ?auto_27294 ?auto_27302 ) ) ( not ( = ?auto_27294 ?auto_27313 ) ) ( not ( = ?auto_27294 ?auto_27309 ) ) ( not ( = ?auto_27294 ?auto_27307 ) ) ( not ( = ?auto_27294 ?auto_27310 ) ) ( not ( = ?auto_27294 ?auto_27314 ) ) ( not ( = ?auto_27300 ?auto_27304 ) ) ( not ( = ?auto_27300 ?auto_27316 ) ) ( not ( = ?auto_27300 ?auto_27303 ) ) ( not ( = ?auto_27300 ?auto_27301 ) ) ( not ( = ?auto_27300 ?auto_27315 ) ) ( not ( = ?auto_27298 ?auto_27305 ) ) ( not ( = ?auto_27298 ?auto_27312 ) ) ( not ( = ?auto_27298 ?auto_27308 ) ) ( not ( = ?auto_27298 ?auto_27306 ) ) ( not ( = ?auto_27298 ?auto_27311 ) ) ( not ( = ?auto_27297 ?auto_27302 ) ) ( not ( = ?auto_27297 ?auto_27313 ) ) ( not ( = ?auto_27297 ?auto_27309 ) ) ( not ( = ?auto_27297 ?auto_27307 ) ) ( not ( = ?auto_27297 ?auto_27310 ) ) ( not ( = ?auto_27297 ?auto_27314 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_27287 ?auto_27288 ?auto_27289 ?auto_27290 ?auto_27291 ?auto_27292 ?auto_27293 )
      ( MAKE-1CRATE ?auto_27293 ?auto_27294 )
      ( MAKE-7CRATE-VERIFY ?auto_27287 ?auto_27288 ?auto_27289 ?auto_27290 ?auto_27291 ?auto_27292 ?auto_27293 ?auto_27294 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_27336 - SURFACE
      ?auto_27337 - SURFACE
      ?auto_27338 - SURFACE
      ?auto_27339 - SURFACE
      ?auto_27340 - SURFACE
      ?auto_27341 - SURFACE
      ?auto_27342 - SURFACE
      ?auto_27343 - SURFACE
      ?auto_27344 - SURFACE
    )
    :vars
    (
      ?auto_27347 - HOIST
      ?auto_27346 - PLACE
      ?auto_27345 - PLACE
      ?auto_27350 - HOIST
      ?auto_27349 - SURFACE
      ?auto_27361 - PLACE
      ?auto_27355 - HOIST
      ?auto_27351 - SURFACE
      ?auto_27363 - PLACE
      ?auto_27356 - HOIST
      ?auto_27352 - SURFACE
      ?auto_27364 - PLACE
      ?auto_27360 - HOIST
      ?auto_27365 - SURFACE
      ?auto_27353 - SURFACE
      ?auto_27362 - PLACE
      ?auto_27358 - HOIST
      ?auto_27367 - SURFACE
      ?auto_27354 - SURFACE
      ?auto_27366 - PLACE
      ?auto_27357 - HOIST
      ?auto_27359 - SURFACE
      ?auto_27348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27347 ?auto_27346 ) ( IS-CRATE ?auto_27344 ) ( not ( = ?auto_27345 ?auto_27346 ) ) ( HOIST-AT ?auto_27350 ?auto_27345 ) ( SURFACE-AT ?auto_27344 ?auto_27345 ) ( ON ?auto_27344 ?auto_27349 ) ( CLEAR ?auto_27344 ) ( not ( = ?auto_27343 ?auto_27344 ) ) ( not ( = ?auto_27343 ?auto_27349 ) ) ( not ( = ?auto_27344 ?auto_27349 ) ) ( not ( = ?auto_27347 ?auto_27350 ) ) ( IS-CRATE ?auto_27343 ) ( not ( = ?auto_27361 ?auto_27346 ) ) ( HOIST-AT ?auto_27355 ?auto_27361 ) ( AVAILABLE ?auto_27355 ) ( SURFACE-AT ?auto_27343 ?auto_27361 ) ( ON ?auto_27343 ?auto_27351 ) ( CLEAR ?auto_27343 ) ( not ( = ?auto_27342 ?auto_27343 ) ) ( not ( = ?auto_27342 ?auto_27351 ) ) ( not ( = ?auto_27343 ?auto_27351 ) ) ( not ( = ?auto_27347 ?auto_27355 ) ) ( IS-CRATE ?auto_27342 ) ( not ( = ?auto_27363 ?auto_27346 ) ) ( HOIST-AT ?auto_27356 ?auto_27363 ) ( AVAILABLE ?auto_27356 ) ( SURFACE-AT ?auto_27342 ?auto_27363 ) ( ON ?auto_27342 ?auto_27352 ) ( CLEAR ?auto_27342 ) ( not ( = ?auto_27341 ?auto_27342 ) ) ( not ( = ?auto_27341 ?auto_27352 ) ) ( not ( = ?auto_27342 ?auto_27352 ) ) ( not ( = ?auto_27347 ?auto_27356 ) ) ( IS-CRATE ?auto_27341 ) ( not ( = ?auto_27364 ?auto_27346 ) ) ( HOIST-AT ?auto_27360 ?auto_27364 ) ( SURFACE-AT ?auto_27341 ?auto_27364 ) ( ON ?auto_27341 ?auto_27365 ) ( CLEAR ?auto_27341 ) ( not ( = ?auto_27340 ?auto_27341 ) ) ( not ( = ?auto_27340 ?auto_27365 ) ) ( not ( = ?auto_27341 ?auto_27365 ) ) ( not ( = ?auto_27347 ?auto_27360 ) ) ( IS-CRATE ?auto_27340 ) ( AVAILABLE ?auto_27360 ) ( SURFACE-AT ?auto_27340 ?auto_27364 ) ( ON ?auto_27340 ?auto_27353 ) ( CLEAR ?auto_27340 ) ( not ( = ?auto_27339 ?auto_27340 ) ) ( not ( = ?auto_27339 ?auto_27353 ) ) ( not ( = ?auto_27340 ?auto_27353 ) ) ( IS-CRATE ?auto_27339 ) ( not ( = ?auto_27362 ?auto_27346 ) ) ( HOIST-AT ?auto_27358 ?auto_27362 ) ( AVAILABLE ?auto_27358 ) ( SURFACE-AT ?auto_27339 ?auto_27362 ) ( ON ?auto_27339 ?auto_27367 ) ( CLEAR ?auto_27339 ) ( not ( = ?auto_27338 ?auto_27339 ) ) ( not ( = ?auto_27338 ?auto_27367 ) ) ( not ( = ?auto_27339 ?auto_27367 ) ) ( not ( = ?auto_27347 ?auto_27358 ) ) ( IS-CRATE ?auto_27338 ) ( AVAILABLE ?auto_27350 ) ( SURFACE-AT ?auto_27338 ?auto_27345 ) ( ON ?auto_27338 ?auto_27354 ) ( CLEAR ?auto_27338 ) ( not ( = ?auto_27337 ?auto_27338 ) ) ( not ( = ?auto_27337 ?auto_27354 ) ) ( not ( = ?auto_27338 ?auto_27354 ) ) ( SURFACE-AT ?auto_27336 ?auto_27346 ) ( CLEAR ?auto_27336 ) ( IS-CRATE ?auto_27337 ) ( AVAILABLE ?auto_27347 ) ( not ( = ?auto_27366 ?auto_27346 ) ) ( HOIST-AT ?auto_27357 ?auto_27366 ) ( AVAILABLE ?auto_27357 ) ( SURFACE-AT ?auto_27337 ?auto_27366 ) ( ON ?auto_27337 ?auto_27359 ) ( CLEAR ?auto_27337 ) ( TRUCK-AT ?auto_27348 ?auto_27346 ) ( not ( = ?auto_27336 ?auto_27337 ) ) ( not ( = ?auto_27336 ?auto_27359 ) ) ( not ( = ?auto_27337 ?auto_27359 ) ) ( not ( = ?auto_27347 ?auto_27357 ) ) ( not ( = ?auto_27336 ?auto_27338 ) ) ( not ( = ?auto_27336 ?auto_27354 ) ) ( not ( = ?auto_27338 ?auto_27359 ) ) ( not ( = ?auto_27345 ?auto_27366 ) ) ( not ( = ?auto_27350 ?auto_27357 ) ) ( not ( = ?auto_27354 ?auto_27359 ) ) ( not ( = ?auto_27336 ?auto_27339 ) ) ( not ( = ?auto_27336 ?auto_27367 ) ) ( not ( = ?auto_27337 ?auto_27339 ) ) ( not ( = ?auto_27337 ?auto_27367 ) ) ( not ( = ?auto_27339 ?auto_27354 ) ) ( not ( = ?auto_27339 ?auto_27359 ) ) ( not ( = ?auto_27362 ?auto_27345 ) ) ( not ( = ?auto_27362 ?auto_27366 ) ) ( not ( = ?auto_27358 ?auto_27350 ) ) ( not ( = ?auto_27358 ?auto_27357 ) ) ( not ( = ?auto_27367 ?auto_27354 ) ) ( not ( = ?auto_27367 ?auto_27359 ) ) ( not ( = ?auto_27336 ?auto_27340 ) ) ( not ( = ?auto_27336 ?auto_27353 ) ) ( not ( = ?auto_27337 ?auto_27340 ) ) ( not ( = ?auto_27337 ?auto_27353 ) ) ( not ( = ?auto_27338 ?auto_27340 ) ) ( not ( = ?auto_27338 ?auto_27353 ) ) ( not ( = ?auto_27340 ?auto_27367 ) ) ( not ( = ?auto_27340 ?auto_27354 ) ) ( not ( = ?auto_27340 ?auto_27359 ) ) ( not ( = ?auto_27364 ?auto_27362 ) ) ( not ( = ?auto_27364 ?auto_27345 ) ) ( not ( = ?auto_27364 ?auto_27366 ) ) ( not ( = ?auto_27360 ?auto_27358 ) ) ( not ( = ?auto_27360 ?auto_27350 ) ) ( not ( = ?auto_27360 ?auto_27357 ) ) ( not ( = ?auto_27353 ?auto_27367 ) ) ( not ( = ?auto_27353 ?auto_27354 ) ) ( not ( = ?auto_27353 ?auto_27359 ) ) ( not ( = ?auto_27336 ?auto_27341 ) ) ( not ( = ?auto_27336 ?auto_27365 ) ) ( not ( = ?auto_27337 ?auto_27341 ) ) ( not ( = ?auto_27337 ?auto_27365 ) ) ( not ( = ?auto_27338 ?auto_27341 ) ) ( not ( = ?auto_27338 ?auto_27365 ) ) ( not ( = ?auto_27339 ?auto_27341 ) ) ( not ( = ?auto_27339 ?auto_27365 ) ) ( not ( = ?auto_27341 ?auto_27353 ) ) ( not ( = ?auto_27341 ?auto_27367 ) ) ( not ( = ?auto_27341 ?auto_27354 ) ) ( not ( = ?auto_27341 ?auto_27359 ) ) ( not ( = ?auto_27365 ?auto_27353 ) ) ( not ( = ?auto_27365 ?auto_27367 ) ) ( not ( = ?auto_27365 ?auto_27354 ) ) ( not ( = ?auto_27365 ?auto_27359 ) ) ( not ( = ?auto_27336 ?auto_27342 ) ) ( not ( = ?auto_27336 ?auto_27352 ) ) ( not ( = ?auto_27337 ?auto_27342 ) ) ( not ( = ?auto_27337 ?auto_27352 ) ) ( not ( = ?auto_27338 ?auto_27342 ) ) ( not ( = ?auto_27338 ?auto_27352 ) ) ( not ( = ?auto_27339 ?auto_27342 ) ) ( not ( = ?auto_27339 ?auto_27352 ) ) ( not ( = ?auto_27340 ?auto_27342 ) ) ( not ( = ?auto_27340 ?auto_27352 ) ) ( not ( = ?auto_27342 ?auto_27365 ) ) ( not ( = ?auto_27342 ?auto_27353 ) ) ( not ( = ?auto_27342 ?auto_27367 ) ) ( not ( = ?auto_27342 ?auto_27354 ) ) ( not ( = ?auto_27342 ?auto_27359 ) ) ( not ( = ?auto_27363 ?auto_27364 ) ) ( not ( = ?auto_27363 ?auto_27362 ) ) ( not ( = ?auto_27363 ?auto_27345 ) ) ( not ( = ?auto_27363 ?auto_27366 ) ) ( not ( = ?auto_27356 ?auto_27360 ) ) ( not ( = ?auto_27356 ?auto_27358 ) ) ( not ( = ?auto_27356 ?auto_27350 ) ) ( not ( = ?auto_27356 ?auto_27357 ) ) ( not ( = ?auto_27352 ?auto_27365 ) ) ( not ( = ?auto_27352 ?auto_27353 ) ) ( not ( = ?auto_27352 ?auto_27367 ) ) ( not ( = ?auto_27352 ?auto_27354 ) ) ( not ( = ?auto_27352 ?auto_27359 ) ) ( not ( = ?auto_27336 ?auto_27343 ) ) ( not ( = ?auto_27336 ?auto_27351 ) ) ( not ( = ?auto_27337 ?auto_27343 ) ) ( not ( = ?auto_27337 ?auto_27351 ) ) ( not ( = ?auto_27338 ?auto_27343 ) ) ( not ( = ?auto_27338 ?auto_27351 ) ) ( not ( = ?auto_27339 ?auto_27343 ) ) ( not ( = ?auto_27339 ?auto_27351 ) ) ( not ( = ?auto_27340 ?auto_27343 ) ) ( not ( = ?auto_27340 ?auto_27351 ) ) ( not ( = ?auto_27341 ?auto_27343 ) ) ( not ( = ?auto_27341 ?auto_27351 ) ) ( not ( = ?auto_27343 ?auto_27352 ) ) ( not ( = ?auto_27343 ?auto_27365 ) ) ( not ( = ?auto_27343 ?auto_27353 ) ) ( not ( = ?auto_27343 ?auto_27367 ) ) ( not ( = ?auto_27343 ?auto_27354 ) ) ( not ( = ?auto_27343 ?auto_27359 ) ) ( not ( = ?auto_27361 ?auto_27363 ) ) ( not ( = ?auto_27361 ?auto_27364 ) ) ( not ( = ?auto_27361 ?auto_27362 ) ) ( not ( = ?auto_27361 ?auto_27345 ) ) ( not ( = ?auto_27361 ?auto_27366 ) ) ( not ( = ?auto_27355 ?auto_27356 ) ) ( not ( = ?auto_27355 ?auto_27360 ) ) ( not ( = ?auto_27355 ?auto_27358 ) ) ( not ( = ?auto_27355 ?auto_27350 ) ) ( not ( = ?auto_27355 ?auto_27357 ) ) ( not ( = ?auto_27351 ?auto_27352 ) ) ( not ( = ?auto_27351 ?auto_27365 ) ) ( not ( = ?auto_27351 ?auto_27353 ) ) ( not ( = ?auto_27351 ?auto_27367 ) ) ( not ( = ?auto_27351 ?auto_27354 ) ) ( not ( = ?auto_27351 ?auto_27359 ) ) ( not ( = ?auto_27336 ?auto_27344 ) ) ( not ( = ?auto_27336 ?auto_27349 ) ) ( not ( = ?auto_27337 ?auto_27344 ) ) ( not ( = ?auto_27337 ?auto_27349 ) ) ( not ( = ?auto_27338 ?auto_27344 ) ) ( not ( = ?auto_27338 ?auto_27349 ) ) ( not ( = ?auto_27339 ?auto_27344 ) ) ( not ( = ?auto_27339 ?auto_27349 ) ) ( not ( = ?auto_27340 ?auto_27344 ) ) ( not ( = ?auto_27340 ?auto_27349 ) ) ( not ( = ?auto_27341 ?auto_27344 ) ) ( not ( = ?auto_27341 ?auto_27349 ) ) ( not ( = ?auto_27342 ?auto_27344 ) ) ( not ( = ?auto_27342 ?auto_27349 ) ) ( not ( = ?auto_27344 ?auto_27351 ) ) ( not ( = ?auto_27344 ?auto_27352 ) ) ( not ( = ?auto_27344 ?auto_27365 ) ) ( not ( = ?auto_27344 ?auto_27353 ) ) ( not ( = ?auto_27344 ?auto_27367 ) ) ( not ( = ?auto_27344 ?auto_27354 ) ) ( not ( = ?auto_27344 ?auto_27359 ) ) ( not ( = ?auto_27349 ?auto_27351 ) ) ( not ( = ?auto_27349 ?auto_27352 ) ) ( not ( = ?auto_27349 ?auto_27365 ) ) ( not ( = ?auto_27349 ?auto_27353 ) ) ( not ( = ?auto_27349 ?auto_27367 ) ) ( not ( = ?auto_27349 ?auto_27354 ) ) ( not ( = ?auto_27349 ?auto_27359 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_27336 ?auto_27337 ?auto_27338 ?auto_27339 ?auto_27340 ?auto_27341 ?auto_27342 ?auto_27343 )
      ( MAKE-1CRATE ?auto_27343 ?auto_27344 )
      ( MAKE-8CRATE-VERIFY ?auto_27336 ?auto_27337 ?auto_27338 ?auto_27339 ?auto_27340 ?auto_27341 ?auto_27342 ?auto_27343 ?auto_27344 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_27388 - SURFACE
      ?auto_27389 - SURFACE
      ?auto_27390 - SURFACE
      ?auto_27391 - SURFACE
      ?auto_27392 - SURFACE
      ?auto_27393 - SURFACE
      ?auto_27394 - SURFACE
      ?auto_27395 - SURFACE
      ?auto_27396 - SURFACE
      ?auto_27397 - SURFACE
    )
    :vars
    (
      ?auto_27399 - HOIST
      ?auto_27402 - PLACE
      ?auto_27400 - PLACE
      ?auto_27401 - HOIST
      ?auto_27403 - SURFACE
      ?auto_27415 - PLACE
      ?auto_27421 - HOIST
      ?auto_27406 - SURFACE
      ?auto_27417 - PLACE
      ?auto_27419 - HOIST
      ?auto_27409 - SURFACE
      ?auto_27414 - PLACE
      ?auto_27413 - HOIST
      ?auto_27412 - SURFACE
      ?auto_27408 - PLACE
      ?auto_27404 - HOIST
      ?auto_27416 - SURFACE
      ?auto_27420 - SURFACE
      ?auto_27407 - SURFACE
      ?auto_27405 - SURFACE
      ?auto_27410 - PLACE
      ?auto_27418 - HOIST
      ?auto_27411 - SURFACE
      ?auto_27398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27399 ?auto_27402 ) ( IS-CRATE ?auto_27397 ) ( not ( = ?auto_27400 ?auto_27402 ) ) ( HOIST-AT ?auto_27401 ?auto_27400 ) ( SURFACE-AT ?auto_27397 ?auto_27400 ) ( ON ?auto_27397 ?auto_27403 ) ( CLEAR ?auto_27397 ) ( not ( = ?auto_27396 ?auto_27397 ) ) ( not ( = ?auto_27396 ?auto_27403 ) ) ( not ( = ?auto_27397 ?auto_27403 ) ) ( not ( = ?auto_27399 ?auto_27401 ) ) ( IS-CRATE ?auto_27396 ) ( not ( = ?auto_27415 ?auto_27402 ) ) ( HOIST-AT ?auto_27421 ?auto_27415 ) ( SURFACE-AT ?auto_27396 ?auto_27415 ) ( ON ?auto_27396 ?auto_27406 ) ( CLEAR ?auto_27396 ) ( not ( = ?auto_27395 ?auto_27396 ) ) ( not ( = ?auto_27395 ?auto_27406 ) ) ( not ( = ?auto_27396 ?auto_27406 ) ) ( not ( = ?auto_27399 ?auto_27421 ) ) ( IS-CRATE ?auto_27395 ) ( not ( = ?auto_27417 ?auto_27402 ) ) ( HOIST-AT ?auto_27419 ?auto_27417 ) ( AVAILABLE ?auto_27419 ) ( SURFACE-AT ?auto_27395 ?auto_27417 ) ( ON ?auto_27395 ?auto_27409 ) ( CLEAR ?auto_27395 ) ( not ( = ?auto_27394 ?auto_27395 ) ) ( not ( = ?auto_27394 ?auto_27409 ) ) ( not ( = ?auto_27395 ?auto_27409 ) ) ( not ( = ?auto_27399 ?auto_27419 ) ) ( IS-CRATE ?auto_27394 ) ( not ( = ?auto_27414 ?auto_27402 ) ) ( HOIST-AT ?auto_27413 ?auto_27414 ) ( AVAILABLE ?auto_27413 ) ( SURFACE-AT ?auto_27394 ?auto_27414 ) ( ON ?auto_27394 ?auto_27412 ) ( CLEAR ?auto_27394 ) ( not ( = ?auto_27393 ?auto_27394 ) ) ( not ( = ?auto_27393 ?auto_27412 ) ) ( not ( = ?auto_27394 ?auto_27412 ) ) ( not ( = ?auto_27399 ?auto_27413 ) ) ( IS-CRATE ?auto_27393 ) ( not ( = ?auto_27408 ?auto_27402 ) ) ( HOIST-AT ?auto_27404 ?auto_27408 ) ( SURFACE-AT ?auto_27393 ?auto_27408 ) ( ON ?auto_27393 ?auto_27416 ) ( CLEAR ?auto_27393 ) ( not ( = ?auto_27392 ?auto_27393 ) ) ( not ( = ?auto_27392 ?auto_27416 ) ) ( not ( = ?auto_27393 ?auto_27416 ) ) ( not ( = ?auto_27399 ?auto_27404 ) ) ( IS-CRATE ?auto_27392 ) ( AVAILABLE ?auto_27404 ) ( SURFACE-AT ?auto_27392 ?auto_27408 ) ( ON ?auto_27392 ?auto_27420 ) ( CLEAR ?auto_27392 ) ( not ( = ?auto_27391 ?auto_27392 ) ) ( not ( = ?auto_27391 ?auto_27420 ) ) ( not ( = ?auto_27392 ?auto_27420 ) ) ( IS-CRATE ?auto_27391 ) ( AVAILABLE ?auto_27401 ) ( SURFACE-AT ?auto_27391 ?auto_27400 ) ( ON ?auto_27391 ?auto_27407 ) ( CLEAR ?auto_27391 ) ( not ( = ?auto_27390 ?auto_27391 ) ) ( not ( = ?auto_27390 ?auto_27407 ) ) ( not ( = ?auto_27391 ?auto_27407 ) ) ( IS-CRATE ?auto_27390 ) ( AVAILABLE ?auto_27421 ) ( SURFACE-AT ?auto_27390 ?auto_27415 ) ( ON ?auto_27390 ?auto_27405 ) ( CLEAR ?auto_27390 ) ( not ( = ?auto_27389 ?auto_27390 ) ) ( not ( = ?auto_27389 ?auto_27405 ) ) ( not ( = ?auto_27390 ?auto_27405 ) ) ( SURFACE-AT ?auto_27388 ?auto_27402 ) ( CLEAR ?auto_27388 ) ( IS-CRATE ?auto_27389 ) ( AVAILABLE ?auto_27399 ) ( not ( = ?auto_27410 ?auto_27402 ) ) ( HOIST-AT ?auto_27418 ?auto_27410 ) ( AVAILABLE ?auto_27418 ) ( SURFACE-AT ?auto_27389 ?auto_27410 ) ( ON ?auto_27389 ?auto_27411 ) ( CLEAR ?auto_27389 ) ( TRUCK-AT ?auto_27398 ?auto_27402 ) ( not ( = ?auto_27388 ?auto_27389 ) ) ( not ( = ?auto_27388 ?auto_27411 ) ) ( not ( = ?auto_27389 ?auto_27411 ) ) ( not ( = ?auto_27399 ?auto_27418 ) ) ( not ( = ?auto_27388 ?auto_27390 ) ) ( not ( = ?auto_27388 ?auto_27405 ) ) ( not ( = ?auto_27390 ?auto_27411 ) ) ( not ( = ?auto_27415 ?auto_27410 ) ) ( not ( = ?auto_27421 ?auto_27418 ) ) ( not ( = ?auto_27405 ?auto_27411 ) ) ( not ( = ?auto_27388 ?auto_27391 ) ) ( not ( = ?auto_27388 ?auto_27407 ) ) ( not ( = ?auto_27389 ?auto_27391 ) ) ( not ( = ?auto_27389 ?auto_27407 ) ) ( not ( = ?auto_27391 ?auto_27405 ) ) ( not ( = ?auto_27391 ?auto_27411 ) ) ( not ( = ?auto_27400 ?auto_27415 ) ) ( not ( = ?auto_27400 ?auto_27410 ) ) ( not ( = ?auto_27401 ?auto_27421 ) ) ( not ( = ?auto_27401 ?auto_27418 ) ) ( not ( = ?auto_27407 ?auto_27405 ) ) ( not ( = ?auto_27407 ?auto_27411 ) ) ( not ( = ?auto_27388 ?auto_27392 ) ) ( not ( = ?auto_27388 ?auto_27420 ) ) ( not ( = ?auto_27389 ?auto_27392 ) ) ( not ( = ?auto_27389 ?auto_27420 ) ) ( not ( = ?auto_27390 ?auto_27392 ) ) ( not ( = ?auto_27390 ?auto_27420 ) ) ( not ( = ?auto_27392 ?auto_27407 ) ) ( not ( = ?auto_27392 ?auto_27405 ) ) ( not ( = ?auto_27392 ?auto_27411 ) ) ( not ( = ?auto_27408 ?auto_27400 ) ) ( not ( = ?auto_27408 ?auto_27415 ) ) ( not ( = ?auto_27408 ?auto_27410 ) ) ( not ( = ?auto_27404 ?auto_27401 ) ) ( not ( = ?auto_27404 ?auto_27421 ) ) ( not ( = ?auto_27404 ?auto_27418 ) ) ( not ( = ?auto_27420 ?auto_27407 ) ) ( not ( = ?auto_27420 ?auto_27405 ) ) ( not ( = ?auto_27420 ?auto_27411 ) ) ( not ( = ?auto_27388 ?auto_27393 ) ) ( not ( = ?auto_27388 ?auto_27416 ) ) ( not ( = ?auto_27389 ?auto_27393 ) ) ( not ( = ?auto_27389 ?auto_27416 ) ) ( not ( = ?auto_27390 ?auto_27393 ) ) ( not ( = ?auto_27390 ?auto_27416 ) ) ( not ( = ?auto_27391 ?auto_27393 ) ) ( not ( = ?auto_27391 ?auto_27416 ) ) ( not ( = ?auto_27393 ?auto_27420 ) ) ( not ( = ?auto_27393 ?auto_27407 ) ) ( not ( = ?auto_27393 ?auto_27405 ) ) ( not ( = ?auto_27393 ?auto_27411 ) ) ( not ( = ?auto_27416 ?auto_27420 ) ) ( not ( = ?auto_27416 ?auto_27407 ) ) ( not ( = ?auto_27416 ?auto_27405 ) ) ( not ( = ?auto_27416 ?auto_27411 ) ) ( not ( = ?auto_27388 ?auto_27394 ) ) ( not ( = ?auto_27388 ?auto_27412 ) ) ( not ( = ?auto_27389 ?auto_27394 ) ) ( not ( = ?auto_27389 ?auto_27412 ) ) ( not ( = ?auto_27390 ?auto_27394 ) ) ( not ( = ?auto_27390 ?auto_27412 ) ) ( not ( = ?auto_27391 ?auto_27394 ) ) ( not ( = ?auto_27391 ?auto_27412 ) ) ( not ( = ?auto_27392 ?auto_27394 ) ) ( not ( = ?auto_27392 ?auto_27412 ) ) ( not ( = ?auto_27394 ?auto_27416 ) ) ( not ( = ?auto_27394 ?auto_27420 ) ) ( not ( = ?auto_27394 ?auto_27407 ) ) ( not ( = ?auto_27394 ?auto_27405 ) ) ( not ( = ?auto_27394 ?auto_27411 ) ) ( not ( = ?auto_27414 ?auto_27408 ) ) ( not ( = ?auto_27414 ?auto_27400 ) ) ( not ( = ?auto_27414 ?auto_27415 ) ) ( not ( = ?auto_27414 ?auto_27410 ) ) ( not ( = ?auto_27413 ?auto_27404 ) ) ( not ( = ?auto_27413 ?auto_27401 ) ) ( not ( = ?auto_27413 ?auto_27421 ) ) ( not ( = ?auto_27413 ?auto_27418 ) ) ( not ( = ?auto_27412 ?auto_27416 ) ) ( not ( = ?auto_27412 ?auto_27420 ) ) ( not ( = ?auto_27412 ?auto_27407 ) ) ( not ( = ?auto_27412 ?auto_27405 ) ) ( not ( = ?auto_27412 ?auto_27411 ) ) ( not ( = ?auto_27388 ?auto_27395 ) ) ( not ( = ?auto_27388 ?auto_27409 ) ) ( not ( = ?auto_27389 ?auto_27395 ) ) ( not ( = ?auto_27389 ?auto_27409 ) ) ( not ( = ?auto_27390 ?auto_27395 ) ) ( not ( = ?auto_27390 ?auto_27409 ) ) ( not ( = ?auto_27391 ?auto_27395 ) ) ( not ( = ?auto_27391 ?auto_27409 ) ) ( not ( = ?auto_27392 ?auto_27395 ) ) ( not ( = ?auto_27392 ?auto_27409 ) ) ( not ( = ?auto_27393 ?auto_27395 ) ) ( not ( = ?auto_27393 ?auto_27409 ) ) ( not ( = ?auto_27395 ?auto_27412 ) ) ( not ( = ?auto_27395 ?auto_27416 ) ) ( not ( = ?auto_27395 ?auto_27420 ) ) ( not ( = ?auto_27395 ?auto_27407 ) ) ( not ( = ?auto_27395 ?auto_27405 ) ) ( not ( = ?auto_27395 ?auto_27411 ) ) ( not ( = ?auto_27417 ?auto_27414 ) ) ( not ( = ?auto_27417 ?auto_27408 ) ) ( not ( = ?auto_27417 ?auto_27400 ) ) ( not ( = ?auto_27417 ?auto_27415 ) ) ( not ( = ?auto_27417 ?auto_27410 ) ) ( not ( = ?auto_27419 ?auto_27413 ) ) ( not ( = ?auto_27419 ?auto_27404 ) ) ( not ( = ?auto_27419 ?auto_27401 ) ) ( not ( = ?auto_27419 ?auto_27421 ) ) ( not ( = ?auto_27419 ?auto_27418 ) ) ( not ( = ?auto_27409 ?auto_27412 ) ) ( not ( = ?auto_27409 ?auto_27416 ) ) ( not ( = ?auto_27409 ?auto_27420 ) ) ( not ( = ?auto_27409 ?auto_27407 ) ) ( not ( = ?auto_27409 ?auto_27405 ) ) ( not ( = ?auto_27409 ?auto_27411 ) ) ( not ( = ?auto_27388 ?auto_27396 ) ) ( not ( = ?auto_27388 ?auto_27406 ) ) ( not ( = ?auto_27389 ?auto_27396 ) ) ( not ( = ?auto_27389 ?auto_27406 ) ) ( not ( = ?auto_27390 ?auto_27396 ) ) ( not ( = ?auto_27390 ?auto_27406 ) ) ( not ( = ?auto_27391 ?auto_27396 ) ) ( not ( = ?auto_27391 ?auto_27406 ) ) ( not ( = ?auto_27392 ?auto_27396 ) ) ( not ( = ?auto_27392 ?auto_27406 ) ) ( not ( = ?auto_27393 ?auto_27396 ) ) ( not ( = ?auto_27393 ?auto_27406 ) ) ( not ( = ?auto_27394 ?auto_27396 ) ) ( not ( = ?auto_27394 ?auto_27406 ) ) ( not ( = ?auto_27396 ?auto_27409 ) ) ( not ( = ?auto_27396 ?auto_27412 ) ) ( not ( = ?auto_27396 ?auto_27416 ) ) ( not ( = ?auto_27396 ?auto_27420 ) ) ( not ( = ?auto_27396 ?auto_27407 ) ) ( not ( = ?auto_27396 ?auto_27405 ) ) ( not ( = ?auto_27396 ?auto_27411 ) ) ( not ( = ?auto_27406 ?auto_27409 ) ) ( not ( = ?auto_27406 ?auto_27412 ) ) ( not ( = ?auto_27406 ?auto_27416 ) ) ( not ( = ?auto_27406 ?auto_27420 ) ) ( not ( = ?auto_27406 ?auto_27407 ) ) ( not ( = ?auto_27406 ?auto_27405 ) ) ( not ( = ?auto_27406 ?auto_27411 ) ) ( not ( = ?auto_27388 ?auto_27397 ) ) ( not ( = ?auto_27388 ?auto_27403 ) ) ( not ( = ?auto_27389 ?auto_27397 ) ) ( not ( = ?auto_27389 ?auto_27403 ) ) ( not ( = ?auto_27390 ?auto_27397 ) ) ( not ( = ?auto_27390 ?auto_27403 ) ) ( not ( = ?auto_27391 ?auto_27397 ) ) ( not ( = ?auto_27391 ?auto_27403 ) ) ( not ( = ?auto_27392 ?auto_27397 ) ) ( not ( = ?auto_27392 ?auto_27403 ) ) ( not ( = ?auto_27393 ?auto_27397 ) ) ( not ( = ?auto_27393 ?auto_27403 ) ) ( not ( = ?auto_27394 ?auto_27397 ) ) ( not ( = ?auto_27394 ?auto_27403 ) ) ( not ( = ?auto_27395 ?auto_27397 ) ) ( not ( = ?auto_27395 ?auto_27403 ) ) ( not ( = ?auto_27397 ?auto_27406 ) ) ( not ( = ?auto_27397 ?auto_27409 ) ) ( not ( = ?auto_27397 ?auto_27412 ) ) ( not ( = ?auto_27397 ?auto_27416 ) ) ( not ( = ?auto_27397 ?auto_27420 ) ) ( not ( = ?auto_27397 ?auto_27407 ) ) ( not ( = ?auto_27397 ?auto_27405 ) ) ( not ( = ?auto_27397 ?auto_27411 ) ) ( not ( = ?auto_27403 ?auto_27406 ) ) ( not ( = ?auto_27403 ?auto_27409 ) ) ( not ( = ?auto_27403 ?auto_27412 ) ) ( not ( = ?auto_27403 ?auto_27416 ) ) ( not ( = ?auto_27403 ?auto_27420 ) ) ( not ( = ?auto_27403 ?auto_27407 ) ) ( not ( = ?auto_27403 ?auto_27405 ) ) ( not ( = ?auto_27403 ?auto_27411 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_27388 ?auto_27389 ?auto_27390 ?auto_27391 ?auto_27392 ?auto_27393 ?auto_27394 ?auto_27395 ?auto_27396 )
      ( MAKE-1CRATE ?auto_27396 ?auto_27397 )
      ( MAKE-9CRATE-VERIFY ?auto_27388 ?auto_27389 ?auto_27390 ?auto_27391 ?auto_27392 ?auto_27393 ?auto_27394 ?auto_27395 ?auto_27396 ?auto_27397 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_27443 - SURFACE
      ?auto_27444 - SURFACE
      ?auto_27445 - SURFACE
      ?auto_27446 - SURFACE
      ?auto_27447 - SURFACE
      ?auto_27448 - SURFACE
      ?auto_27449 - SURFACE
      ?auto_27450 - SURFACE
      ?auto_27451 - SURFACE
      ?auto_27452 - SURFACE
      ?auto_27453 - SURFACE
    )
    :vars
    (
      ?auto_27455 - HOIST
      ?auto_27459 - PLACE
      ?auto_27457 - PLACE
      ?auto_27456 - HOIST
      ?auto_27454 - SURFACE
      ?auto_27462 - PLACE
      ?auto_27468 - HOIST
      ?auto_27466 - SURFACE
      ?auto_27476 - PLACE
      ?auto_27477 - HOIST
      ?auto_27461 - SURFACE
      ?auto_27480 - PLACE
      ?auto_27467 - HOIST
      ?auto_27478 - SURFACE
      ?auto_27460 - PLACE
      ?auto_27471 - HOIST
      ?auto_27472 - SURFACE
      ?auto_27479 - PLACE
      ?auto_27464 - HOIST
      ?auto_27470 - SURFACE
      ?auto_27463 - SURFACE
      ?auto_27473 - SURFACE
      ?auto_27465 - SURFACE
      ?auto_27475 - PLACE
      ?auto_27469 - HOIST
      ?auto_27474 - SURFACE
      ?auto_27458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27455 ?auto_27459 ) ( IS-CRATE ?auto_27453 ) ( not ( = ?auto_27457 ?auto_27459 ) ) ( HOIST-AT ?auto_27456 ?auto_27457 ) ( AVAILABLE ?auto_27456 ) ( SURFACE-AT ?auto_27453 ?auto_27457 ) ( ON ?auto_27453 ?auto_27454 ) ( CLEAR ?auto_27453 ) ( not ( = ?auto_27452 ?auto_27453 ) ) ( not ( = ?auto_27452 ?auto_27454 ) ) ( not ( = ?auto_27453 ?auto_27454 ) ) ( not ( = ?auto_27455 ?auto_27456 ) ) ( IS-CRATE ?auto_27452 ) ( not ( = ?auto_27462 ?auto_27459 ) ) ( HOIST-AT ?auto_27468 ?auto_27462 ) ( SURFACE-AT ?auto_27452 ?auto_27462 ) ( ON ?auto_27452 ?auto_27466 ) ( CLEAR ?auto_27452 ) ( not ( = ?auto_27451 ?auto_27452 ) ) ( not ( = ?auto_27451 ?auto_27466 ) ) ( not ( = ?auto_27452 ?auto_27466 ) ) ( not ( = ?auto_27455 ?auto_27468 ) ) ( IS-CRATE ?auto_27451 ) ( not ( = ?auto_27476 ?auto_27459 ) ) ( HOIST-AT ?auto_27477 ?auto_27476 ) ( SURFACE-AT ?auto_27451 ?auto_27476 ) ( ON ?auto_27451 ?auto_27461 ) ( CLEAR ?auto_27451 ) ( not ( = ?auto_27450 ?auto_27451 ) ) ( not ( = ?auto_27450 ?auto_27461 ) ) ( not ( = ?auto_27451 ?auto_27461 ) ) ( not ( = ?auto_27455 ?auto_27477 ) ) ( IS-CRATE ?auto_27450 ) ( not ( = ?auto_27480 ?auto_27459 ) ) ( HOIST-AT ?auto_27467 ?auto_27480 ) ( AVAILABLE ?auto_27467 ) ( SURFACE-AT ?auto_27450 ?auto_27480 ) ( ON ?auto_27450 ?auto_27478 ) ( CLEAR ?auto_27450 ) ( not ( = ?auto_27449 ?auto_27450 ) ) ( not ( = ?auto_27449 ?auto_27478 ) ) ( not ( = ?auto_27450 ?auto_27478 ) ) ( not ( = ?auto_27455 ?auto_27467 ) ) ( IS-CRATE ?auto_27449 ) ( not ( = ?auto_27460 ?auto_27459 ) ) ( HOIST-AT ?auto_27471 ?auto_27460 ) ( AVAILABLE ?auto_27471 ) ( SURFACE-AT ?auto_27449 ?auto_27460 ) ( ON ?auto_27449 ?auto_27472 ) ( CLEAR ?auto_27449 ) ( not ( = ?auto_27448 ?auto_27449 ) ) ( not ( = ?auto_27448 ?auto_27472 ) ) ( not ( = ?auto_27449 ?auto_27472 ) ) ( not ( = ?auto_27455 ?auto_27471 ) ) ( IS-CRATE ?auto_27448 ) ( not ( = ?auto_27479 ?auto_27459 ) ) ( HOIST-AT ?auto_27464 ?auto_27479 ) ( SURFACE-AT ?auto_27448 ?auto_27479 ) ( ON ?auto_27448 ?auto_27470 ) ( CLEAR ?auto_27448 ) ( not ( = ?auto_27447 ?auto_27448 ) ) ( not ( = ?auto_27447 ?auto_27470 ) ) ( not ( = ?auto_27448 ?auto_27470 ) ) ( not ( = ?auto_27455 ?auto_27464 ) ) ( IS-CRATE ?auto_27447 ) ( AVAILABLE ?auto_27464 ) ( SURFACE-AT ?auto_27447 ?auto_27479 ) ( ON ?auto_27447 ?auto_27463 ) ( CLEAR ?auto_27447 ) ( not ( = ?auto_27446 ?auto_27447 ) ) ( not ( = ?auto_27446 ?auto_27463 ) ) ( not ( = ?auto_27447 ?auto_27463 ) ) ( IS-CRATE ?auto_27446 ) ( AVAILABLE ?auto_27468 ) ( SURFACE-AT ?auto_27446 ?auto_27462 ) ( ON ?auto_27446 ?auto_27473 ) ( CLEAR ?auto_27446 ) ( not ( = ?auto_27445 ?auto_27446 ) ) ( not ( = ?auto_27445 ?auto_27473 ) ) ( not ( = ?auto_27446 ?auto_27473 ) ) ( IS-CRATE ?auto_27445 ) ( AVAILABLE ?auto_27477 ) ( SURFACE-AT ?auto_27445 ?auto_27476 ) ( ON ?auto_27445 ?auto_27465 ) ( CLEAR ?auto_27445 ) ( not ( = ?auto_27444 ?auto_27445 ) ) ( not ( = ?auto_27444 ?auto_27465 ) ) ( not ( = ?auto_27445 ?auto_27465 ) ) ( SURFACE-AT ?auto_27443 ?auto_27459 ) ( CLEAR ?auto_27443 ) ( IS-CRATE ?auto_27444 ) ( AVAILABLE ?auto_27455 ) ( not ( = ?auto_27475 ?auto_27459 ) ) ( HOIST-AT ?auto_27469 ?auto_27475 ) ( AVAILABLE ?auto_27469 ) ( SURFACE-AT ?auto_27444 ?auto_27475 ) ( ON ?auto_27444 ?auto_27474 ) ( CLEAR ?auto_27444 ) ( TRUCK-AT ?auto_27458 ?auto_27459 ) ( not ( = ?auto_27443 ?auto_27444 ) ) ( not ( = ?auto_27443 ?auto_27474 ) ) ( not ( = ?auto_27444 ?auto_27474 ) ) ( not ( = ?auto_27455 ?auto_27469 ) ) ( not ( = ?auto_27443 ?auto_27445 ) ) ( not ( = ?auto_27443 ?auto_27465 ) ) ( not ( = ?auto_27445 ?auto_27474 ) ) ( not ( = ?auto_27476 ?auto_27475 ) ) ( not ( = ?auto_27477 ?auto_27469 ) ) ( not ( = ?auto_27465 ?auto_27474 ) ) ( not ( = ?auto_27443 ?auto_27446 ) ) ( not ( = ?auto_27443 ?auto_27473 ) ) ( not ( = ?auto_27444 ?auto_27446 ) ) ( not ( = ?auto_27444 ?auto_27473 ) ) ( not ( = ?auto_27446 ?auto_27465 ) ) ( not ( = ?auto_27446 ?auto_27474 ) ) ( not ( = ?auto_27462 ?auto_27476 ) ) ( not ( = ?auto_27462 ?auto_27475 ) ) ( not ( = ?auto_27468 ?auto_27477 ) ) ( not ( = ?auto_27468 ?auto_27469 ) ) ( not ( = ?auto_27473 ?auto_27465 ) ) ( not ( = ?auto_27473 ?auto_27474 ) ) ( not ( = ?auto_27443 ?auto_27447 ) ) ( not ( = ?auto_27443 ?auto_27463 ) ) ( not ( = ?auto_27444 ?auto_27447 ) ) ( not ( = ?auto_27444 ?auto_27463 ) ) ( not ( = ?auto_27445 ?auto_27447 ) ) ( not ( = ?auto_27445 ?auto_27463 ) ) ( not ( = ?auto_27447 ?auto_27473 ) ) ( not ( = ?auto_27447 ?auto_27465 ) ) ( not ( = ?auto_27447 ?auto_27474 ) ) ( not ( = ?auto_27479 ?auto_27462 ) ) ( not ( = ?auto_27479 ?auto_27476 ) ) ( not ( = ?auto_27479 ?auto_27475 ) ) ( not ( = ?auto_27464 ?auto_27468 ) ) ( not ( = ?auto_27464 ?auto_27477 ) ) ( not ( = ?auto_27464 ?auto_27469 ) ) ( not ( = ?auto_27463 ?auto_27473 ) ) ( not ( = ?auto_27463 ?auto_27465 ) ) ( not ( = ?auto_27463 ?auto_27474 ) ) ( not ( = ?auto_27443 ?auto_27448 ) ) ( not ( = ?auto_27443 ?auto_27470 ) ) ( not ( = ?auto_27444 ?auto_27448 ) ) ( not ( = ?auto_27444 ?auto_27470 ) ) ( not ( = ?auto_27445 ?auto_27448 ) ) ( not ( = ?auto_27445 ?auto_27470 ) ) ( not ( = ?auto_27446 ?auto_27448 ) ) ( not ( = ?auto_27446 ?auto_27470 ) ) ( not ( = ?auto_27448 ?auto_27463 ) ) ( not ( = ?auto_27448 ?auto_27473 ) ) ( not ( = ?auto_27448 ?auto_27465 ) ) ( not ( = ?auto_27448 ?auto_27474 ) ) ( not ( = ?auto_27470 ?auto_27463 ) ) ( not ( = ?auto_27470 ?auto_27473 ) ) ( not ( = ?auto_27470 ?auto_27465 ) ) ( not ( = ?auto_27470 ?auto_27474 ) ) ( not ( = ?auto_27443 ?auto_27449 ) ) ( not ( = ?auto_27443 ?auto_27472 ) ) ( not ( = ?auto_27444 ?auto_27449 ) ) ( not ( = ?auto_27444 ?auto_27472 ) ) ( not ( = ?auto_27445 ?auto_27449 ) ) ( not ( = ?auto_27445 ?auto_27472 ) ) ( not ( = ?auto_27446 ?auto_27449 ) ) ( not ( = ?auto_27446 ?auto_27472 ) ) ( not ( = ?auto_27447 ?auto_27449 ) ) ( not ( = ?auto_27447 ?auto_27472 ) ) ( not ( = ?auto_27449 ?auto_27470 ) ) ( not ( = ?auto_27449 ?auto_27463 ) ) ( not ( = ?auto_27449 ?auto_27473 ) ) ( not ( = ?auto_27449 ?auto_27465 ) ) ( not ( = ?auto_27449 ?auto_27474 ) ) ( not ( = ?auto_27460 ?auto_27479 ) ) ( not ( = ?auto_27460 ?auto_27462 ) ) ( not ( = ?auto_27460 ?auto_27476 ) ) ( not ( = ?auto_27460 ?auto_27475 ) ) ( not ( = ?auto_27471 ?auto_27464 ) ) ( not ( = ?auto_27471 ?auto_27468 ) ) ( not ( = ?auto_27471 ?auto_27477 ) ) ( not ( = ?auto_27471 ?auto_27469 ) ) ( not ( = ?auto_27472 ?auto_27470 ) ) ( not ( = ?auto_27472 ?auto_27463 ) ) ( not ( = ?auto_27472 ?auto_27473 ) ) ( not ( = ?auto_27472 ?auto_27465 ) ) ( not ( = ?auto_27472 ?auto_27474 ) ) ( not ( = ?auto_27443 ?auto_27450 ) ) ( not ( = ?auto_27443 ?auto_27478 ) ) ( not ( = ?auto_27444 ?auto_27450 ) ) ( not ( = ?auto_27444 ?auto_27478 ) ) ( not ( = ?auto_27445 ?auto_27450 ) ) ( not ( = ?auto_27445 ?auto_27478 ) ) ( not ( = ?auto_27446 ?auto_27450 ) ) ( not ( = ?auto_27446 ?auto_27478 ) ) ( not ( = ?auto_27447 ?auto_27450 ) ) ( not ( = ?auto_27447 ?auto_27478 ) ) ( not ( = ?auto_27448 ?auto_27450 ) ) ( not ( = ?auto_27448 ?auto_27478 ) ) ( not ( = ?auto_27450 ?auto_27472 ) ) ( not ( = ?auto_27450 ?auto_27470 ) ) ( not ( = ?auto_27450 ?auto_27463 ) ) ( not ( = ?auto_27450 ?auto_27473 ) ) ( not ( = ?auto_27450 ?auto_27465 ) ) ( not ( = ?auto_27450 ?auto_27474 ) ) ( not ( = ?auto_27480 ?auto_27460 ) ) ( not ( = ?auto_27480 ?auto_27479 ) ) ( not ( = ?auto_27480 ?auto_27462 ) ) ( not ( = ?auto_27480 ?auto_27476 ) ) ( not ( = ?auto_27480 ?auto_27475 ) ) ( not ( = ?auto_27467 ?auto_27471 ) ) ( not ( = ?auto_27467 ?auto_27464 ) ) ( not ( = ?auto_27467 ?auto_27468 ) ) ( not ( = ?auto_27467 ?auto_27477 ) ) ( not ( = ?auto_27467 ?auto_27469 ) ) ( not ( = ?auto_27478 ?auto_27472 ) ) ( not ( = ?auto_27478 ?auto_27470 ) ) ( not ( = ?auto_27478 ?auto_27463 ) ) ( not ( = ?auto_27478 ?auto_27473 ) ) ( not ( = ?auto_27478 ?auto_27465 ) ) ( not ( = ?auto_27478 ?auto_27474 ) ) ( not ( = ?auto_27443 ?auto_27451 ) ) ( not ( = ?auto_27443 ?auto_27461 ) ) ( not ( = ?auto_27444 ?auto_27451 ) ) ( not ( = ?auto_27444 ?auto_27461 ) ) ( not ( = ?auto_27445 ?auto_27451 ) ) ( not ( = ?auto_27445 ?auto_27461 ) ) ( not ( = ?auto_27446 ?auto_27451 ) ) ( not ( = ?auto_27446 ?auto_27461 ) ) ( not ( = ?auto_27447 ?auto_27451 ) ) ( not ( = ?auto_27447 ?auto_27461 ) ) ( not ( = ?auto_27448 ?auto_27451 ) ) ( not ( = ?auto_27448 ?auto_27461 ) ) ( not ( = ?auto_27449 ?auto_27451 ) ) ( not ( = ?auto_27449 ?auto_27461 ) ) ( not ( = ?auto_27451 ?auto_27478 ) ) ( not ( = ?auto_27451 ?auto_27472 ) ) ( not ( = ?auto_27451 ?auto_27470 ) ) ( not ( = ?auto_27451 ?auto_27463 ) ) ( not ( = ?auto_27451 ?auto_27473 ) ) ( not ( = ?auto_27451 ?auto_27465 ) ) ( not ( = ?auto_27451 ?auto_27474 ) ) ( not ( = ?auto_27461 ?auto_27478 ) ) ( not ( = ?auto_27461 ?auto_27472 ) ) ( not ( = ?auto_27461 ?auto_27470 ) ) ( not ( = ?auto_27461 ?auto_27463 ) ) ( not ( = ?auto_27461 ?auto_27473 ) ) ( not ( = ?auto_27461 ?auto_27465 ) ) ( not ( = ?auto_27461 ?auto_27474 ) ) ( not ( = ?auto_27443 ?auto_27452 ) ) ( not ( = ?auto_27443 ?auto_27466 ) ) ( not ( = ?auto_27444 ?auto_27452 ) ) ( not ( = ?auto_27444 ?auto_27466 ) ) ( not ( = ?auto_27445 ?auto_27452 ) ) ( not ( = ?auto_27445 ?auto_27466 ) ) ( not ( = ?auto_27446 ?auto_27452 ) ) ( not ( = ?auto_27446 ?auto_27466 ) ) ( not ( = ?auto_27447 ?auto_27452 ) ) ( not ( = ?auto_27447 ?auto_27466 ) ) ( not ( = ?auto_27448 ?auto_27452 ) ) ( not ( = ?auto_27448 ?auto_27466 ) ) ( not ( = ?auto_27449 ?auto_27452 ) ) ( not ( = ?auto_27449 ?auto_27466 ) ) ( not ( = ?auto_27450 ?auto_27452 ) ) ( not ( = ?auto_27450 ?auto_27466 ) ) ( not ( = ?auto_27452 ?auto_27461 ) ) ( not ( = ?auto_27452 ?auto_27478 ) ) ( not ( = ?auto_27452 ?auto_27472 ) ) ( not ( = ?auto_27452 ?auto_27470 ) ) ( not ( = ?auto_27452 ?auto_27463 ) ) ( not ( = ?auto_27452 ?auto_27473 ) ) ( not ( = ?auto_27452 ?auto_27465 ) ) ( not ( = ?auto_27452 ?auto_27474 ) ) ( not ( = ?auto_27466 ?auto_27461 ) ) ( not ( = ?auto_27466 ?auto_27478 ) ) ( not ( = ?auto_27466 ?auto_27472 ) ) ( not ( = ?auto_27466 ?auto_27470 ) ) ( not ( = ?auto_27466 ?auto_27463 ) ) ( not ( = ?auto_27466 ?auto_27473 ) ) ( not ( = ?auto_27466 ?auto_27465 ) ) ( not ( = ?auto_27466 ?auto_27474 ) ) ( not ( = ?auto_27443 ?auto_27453 ) ) ( not ( = ?auto_27443 ?auto_27454 ) ) ( not ( = ?auto_27444 ?auto_27453 ) ) ( not ( = ?auto_27444 ?auto_27454 ) ) ( not ( = ?auto_27445 ?auto_27453 ) ) ( not ( = ?auto_27445 ?auto_27454 ) ) ( not ( = ?auto_27446 ?auto_27453 ) ) ( not ( = ?auto_27446 ?auto_27454 ) ) ( not ( = ?auto_27447 ?auto_27453 ) ) ( not ( = ?auto_27447 ?auto_27454 ) ) ( not ( = ?auto_27448 ?auto_27453 ) ) ( not ( = ?auto_27448 ?auto_27454 ) ) ( not ( = ?auto_27449 ?auto_27453 ) ) ( not ( = ?auto_27449 ?auto_27454 ) ) ( not ( = ?auto_27450 ?auto_27453 ) ) ( not ( = ?auto_27450 ?auto_27454 ) ) ( not ( = ?auto_27451 ?auto_27453 ) ) ( not ( = ?auto_27451 ?auto_27454 ) ) ( not ( = ?auto_27453 ?auto_27466 ) ) ( not ( = ?auto_27453 ?auto_27461 ) ) ( not ( = ?auto_27453 ?auto_27478 ) ) ( not ( = ?auto_27453 ?auto_27472 ) ) ( not ( = ?auto_27453 ?auto_27470 ) ) ( not ( = ?auto_27453 ?auto_27463 ) ) ( not ( = ?auto_27453 ?auto_27473 ) ) ( not ( = ?auto_27453 ?auto_27465 ) ) ( not ( = ?auto_27453 ?auto_27474 ) ) ( not ( = ?auto_27457 ?auto_27462 ) ) ( not ( = ?auto_27457 ?auto_27476 ) ) ( not ( = ?auto_27457 ?auto_27480 ) ) ( not ( = ?auto_27457 ?auto_27460 ) ) ( not ( = ?auto_27457 ?auto_27479 ) ) ( not ( = ?auto_27457 ?auto_27475 ) ) ( not ( = ?auto_27456 ?auto_27468 ) ) ( not ( = ?auto_27456 ?auto_27477 ) ) ( not ( = ?auto_27456 ?auto_27467 ) ) ( not ( = ?auto_27456 ?auto_27471 ) ) ( not ( = ?auto_27456 ?auto_27464 ) ) ( not ( = ?auto_27456 ?auto_27469 ) ) ( not ( = ?auto_27454 ?auto_27466 ) ) ( not ( = ?auto_27454 ?auto_27461 ) ) ( not ( = ?auto_27454 ?auto_27478 ) ) ( not ( = ?auto_27454 ?auto_27472 ) ) ( not ( = ?auto_27454 ?auto_27470 ) ) ( not ( = ?auto_27454 ?auto_27463 ) ) ( not ( = ?auto_27454 ?auto_27473 ) ) ( not ( = ?auto_27454 ?auto_27465 ) ) ( not ( = ?auto_27454 ?auto_27474 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_27443 ?auto_27444 ?auto_27445 ?auto_27446 ?auto_27447 ?auto_27448 ?auto_27449 ?auto_27450 ?auto_27451 ?auto_27452 )
      ( MAKE-1CRATE ?auto_27452 ?auto_27453 )
      ( MAKE-10CRATE-VERIFY ?auto_27443 ?auto_27444 ?auto_27445 ?auto_27446 ?auto_27447 ?auto_27448 ?auto_27449 ?auto_27450 ?auto_27451 ?auto_27452 ?auto_27453 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_27503 - SURFACE
      ?auto_27504 - SURFACE
      ?auto_27505 - SURFACE
      ?auto_27506 - SURFACE
      ?auto_27507 - SURFACE
      ?auto_27508 - SURFACE
      ?auto_27509 - SURFACE
      ?auto_27510 - SURFACE
      ?auto_27511 - SURFACE
      ?auto_27512 - SURFACE
      ?auto_27513 - SURFACE
      ?auto_27514 - SURFACE
    )
    :vars
    (
      ?auto_27518 - HOIST
      ?auto_27520 - PLACE
      ?auto_27515 - PLACE
      ?auto_27516 - HOIST
      ?auto_27517 - SURFACE
      ?auto_27537 - PLACE
      ?auto_27536 - HOIST
      ?auto_27523 - SURFACE
      ?auto_27531 - PLACE
      ?auto_27524 - HOIST
      ?auto_27527 - SURFACE
      ?auto_27538 - PLACE
      ?auto_27540 - HOIST
      ?auto_27522 - SURFACE
      ?auto_27521 - PLACE
      ?auto_27534 - HOIST
      ?auto_27532 - SURFACE
      ?auto_27535 - PLACE
      ?auto_27541 - HOIST
      ?auto_27526 - SURFACE
      ?auto_27542 - PLACE
      ?auto_27539 - HOIST
      ?auto_27528 - SURFACE
      ?auto_27525 - SURFACE
      ?auto_27529 - SURFACE
      ?auto_27533 - SURFACE
      ?auto_27530 - SURFACE
      ?auto_27519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27518 ?auto_27520 ) ( IS-CRATE ?auto_27514 ) ( not ( = ?auto_27515 ?auto_27520 ) ) ( HOIST-AT ?auto_27516 ?auto_27515 ) ( SURFACE-AT ?auto_27514 ?auto_27515 ) ( ON ?auto_27514 ?auto_27517 ) ( CLEAR ?auto_27514 ) ( not ( = ?auto_27513 ?auto_27514 ) ) ( not ( = ?auto_27513 ?auto_27517 ) ) ( not ( = ?auto_27514 ?auto_27517 ) ) ( not ( = ?auto_27518 ?auto_27516 ) ) ( IS-CRATE ?auto_27513 ) ( not ( = ?auto_27537 ?auto_27520 ) ) ( HOIST-AT ?auto_27536 ?auto_27537 ) ( AVAILABLE ?auto_27536 ) ( SURFACE-AT ?auto_27513 ?auto_27537 ) ( ON ?auto_27513 ?auto_27523 ) ( CLEAR ?auto_27513 ) ( not ( = ?auto_27512 ?auto_27513 ) ) ( not ( = ?auto_27512 ?auto_27523 ) ) ( not ( = ?auto_27513 ?auto_27523 ) ) ( not ( = ?auto_27518 ?auto_27536 ) ) ( IS-CRATE ?auto_27512 ) ( not ( = ?auto_27531 ?auto_27520 ) ) ( HOIST-AT ?auto_27524 ?auto_27531 ) ( SURFACE-AT ?auto_27512 ?auto_27531 ) ( ON ?auto_27512 ?auto_27527 ) ( CLEAR ?auto_27512 ) ( not ( = ?auto_27511 ?auto_27512 ) ) ( not ( = ?auto_27511 ?auto_27527 ) ) ( not ( = ?auto_27512 ?auto_27527 ) ) ( not ( = ?auto_27518 ?auto_27524 ) ) ( IS-CRATE ?auto_27511 ) ( not ( = ?auto_27538 ?auto_27520 ) ) ( HOIST-AT ?auto_27540 ?auto_27538 ) ( SURFACE-AT ?auto_27511 ?auto_27538 ) ( ON ?auto_27511 ?auto_27522 ) ( CLEAR ?auto_27511 ) ( not ( = ?auto_27510 ?auto_27511 ) ) ( not ( = ?auto_27510 ?auto_27522 ) ) ( not ( = ?auto_27511 ?auto_27522 ) ) ( not ( = ?auto_27518 ?auto_27540 ) ) ( IS-CRATE ?auto_27510 ) ( not ( = ?auto_27521 ?auto_27520 ) ) ( HOIST-AT ?auto_27534 ?auto_27521 ) ( AVAILABLE ?auto_27534 ) ( SURFACE-AT ?auto_27510 ?auto_27521 ) ( ON ?auto_27510 ?auto_27532 ) ( CLEAR ?auto_27510 ) ( not ( = ?auto_27509 ?auto_27510 ) ) ( not ( = ?auto_27509 ?auto_27532 ) ) ( not ( = ?auto_27510 ?auto_27532 ) ) ( not ( = ?auto_27518 ?auto_27534 ) ) ( IS-CRATE ?auto_27509 ) ( not ( = ?auto_27535 ?auto_27520 ) ) ( HOIST-AT ?auto_27541 ?auto_27535 ) ( AVAILABLE ?auto_27541 ) ( SURFACE-AT ?auto_27509 ?auto_27535 ) ( ON ?auto_27509 ?auto_27526 ) ( CLEAR ?auto_27509 ) ( not ( = ?auto_27508 ?auto_27509 ) ) ( not ( = ?auto_27508 ?auto_27526 ) ) ( not ( = ?auto_27509 ?auto_27526 ) ) ( not ( = ?auto_27518 ?auto_27541 ) ) ( IS-CRATE ?auto_27508 ) ( not ( = ?auto_27542 ?auto_27520 ) ) ( HOIST-AT ?auto_27539 ?auto_27542 ) ( SURFACE-AT ?auto_27508 ?auto_27542 ) ( ON ?auto_27508 ?auto_27528 ) ( CLEAR ?auto_27508 ) ( not ( = ?auto_27507 ?auto_27508 ) ) ( not ( = ?auto_27507 ?auto_27528 ) ) ( not ( = ?auto_27508 ?auto_27528 ) ) ( not ( = ?auto_27518 ?auto_27539 ) ) ( IS-CRATE ?auto_27507 ) ( AVAILABLE ?auto_27539 ) ( SURFACE-AT ?auto_27507 ?auto_27542 ) ( ON ?auto_27507 ?auto_27525 ) ( CLEAR ?auto_27507 ) ( not ( = ?auto_27506 ?auto_27507 ) ) ( not ( = ?auto_27506 ?auto_27525 ) ) ( not ( = ?auto_27507 ?auto_27525 ) ) ( IS-CRATE ?auto_27506 ) ( AVAILABLE ?auto_27524 ) ( SURFACE-AT ?auto_27506 ?auto_27531 ) ( ON ?auto_27506 ?auto_27529 ) ( CLEAR ?auto_27506 ) ( not ( = ?auto_27505 ?auto_27506 ) ) ( not ( = ?auto_27505 ?auto_27529 ) ) ( not ( = ?auto_27506 ?auto_27529 ) ) ( IS-CRATE ?auto_27505 ) ( AVAILABLE ?auto_27540 ) ( SURFACE-AT ?auto_27505 ?auto_27538 ) ( ON ?auto_27505 ?auto_27533 ) ( CLEAR ?auto_27505 ) ( not ( = ?auto_27504 ?auto_27505 ) ) ( not ( = ?auto_27504 ?auto_27533 ) ) ( not ( = ?auto_27505 ?auto_27533 ) ) ( SURFACE-AT ?auto_27503 ?auto_27520 ) ( CLEAR ?auto_27503 ) ( IS-CRATE ?auto_27504 ) ( AVAILABLE ?auto_27518 ) ( AVAILABLE ?auto_27516 ) ( SURFACE-AT ?auto_27504 ?auto_27515 ) ( ON ?auto_27504 ?auto_27530 ) ( CLEAR ?auto_27504 ) ( TRUCK-AT ?auto_27519 ?auto_27520 ) ( not ( = ?auto_27503 ?auto_27504 ) ) ( not ( = ?auto_27503 ?auto_27530 ) ) ( not ( = ?auto_27504 ?auto_27530 ) ) ( not ( = ?auto_27503 ?auto_27505 ) ) ( not ( = ?auto_27503 ?auto_27533 ) ) ( not ( = ?auto_27505 ?auto_27530 ) ) ( not ( = ?auto_27538 ?auto_27515 ) ) ( not ( = ?auto_27540 ?auto_27516 ) ) ( not ( = ?auto_27533 ?auto_27530 ) ) ( not ( = ?auto_27503 ?auto_27506 ) ) ( not ( = ?auto_27503 ?auto_27529 ) ) ( not ( = ?auto_27504 ?auto_27506 ) ) ( not ( = ?auto_27504 ?auto_27529 ) ) ( not ( = ?auto_27506 ?auto_27533 ) ) ( not ( = ?auto_27506 ?auto_27530 ) ) ( not ( = ?auto_27531 ?auto_27538 ) ) ( not ( = ?auto_27531 ?auto_27515 ) ) ( not ( = ?auto_27524 ?auto_27540 ) ) ( not ( = ?auto_27524 ?auto_27516 ) ) ( not ( = ?auto_27529 ?auto_27533 ) ) ( not ( = ?auto_27529 ?auto_27530 ) ) ( not ( = ?auto_27503 ?auto_27507 ) ) ( not ( = ?auto_27503 ?auto_27525 ) ) ( not ( = ?auto_27504 ?auto_27507 ) ) ( not ( = ?auto_27504 ?auto_27525 ) ) ( not ( = ?auto_27505 ?auto_27507 ) ) ( not ( = ?auto_27505 ?auto_27525 ) ) ( not ( = ?auto_27507 ?auto_27529 ) ) ( not ( = ?auto_27507 ?auto_27533 ) ) ( not ( = ?auto_27507 ?auto_27530 ) ) ( not ( = ?auto_27542 ?auto_27531 ) ) ( not ( = ?auto_27542 ?auto_27538 ) ) ( not ( = ?auto_27542 ?auto_27515 ) ) ( not ( = ?auto_27539 ?auto_27524 ) ) ( not ( = ?auto_27539 ?auto_27540 ) ) ( not ( = ?auto_27539 ?auto_27516 ) ) ( not ( = ?auto_27525 ?auto_27529 ) ) ( not ( = ?auto_27525 ?auto_27533 ) ) ( not ( = ?auto_27525 ?auto_27530 ) ) ( not ( = ?auto_27503 ?auto_27508 ) ) ( not ( = ?auto_27503 ?auto_27528 ) ) ( not ( = ?auto_27504 ?auto_27508 ) ) ( not ( = ?auto_27504 ?auto_27528 ) ) ( not ( = ?auto_27505 ?auto_27508 ) ) ( not ( = ?auto_27505 ?auto_27528 ) ) ( not ( = ?auto_27506 ?auto_27508 ) ) ( not ( = ?auto_27506 ?auto_27528 ) ) ( not ( = ?auto_27508 ?auto_27525 ) ) ( not ( = ?auto_27508 ?auto_27529 ) ) ( not ( = ?auto_27508 ?auto_27533 ) ) ( not ( = ?auto_27508 ?auto_27530 ) ) ( not ( = ?auto_27528 ?auto_27525 ) ) ( not ( = ?auto_27528 ?auto_27529 ) ) ( not ( = ?auto_27528 ?auto_27533 ) ) ( not ( = ?auto_27528 ?auto_27530 ) ) ( not ( = ?auto_27503 ?auto_27509 ) ) ( not ( = ?auto_27503 ?auto_27526 ) ) ( not ( = ?auto_27504 ?auto_27509 ) ) ( not ( = ?auto_27504 ?auto_27526 ) ) ( not ( = ?auto_27505 ?auto_27509 ) ) ( not ( = ?auto_27505 ?auto_27526 ) ) ( not ( = ?auto_27506 ?auto_27509 ) ) ( not ( = ?auto_27506 ?auto_27526 ) ) ( not ( = ?auto_27507 ?auto_27509 ) ) ( not ( = ?auto_27507 ?auto_27526 ) ) ( not ( = ?auto_27509 ?auto_27528 ) ) ( not ( = ?auto_27509 ?auto_27525 ) ) ( not ( = ?auto_27509 ?auto_27529 ) ) ( not ( = ?auto_27509 ?auto_27533 ) ) ( not ( = ?auto_27509 ?auto_27530 ) ) ( not ( = ?auto_27535 ?auto_27542 ) ) ( not ( = ?auto_27535 ?auto_27531 ) ) ( not ( = ?auto_27535 ?auto_27538 ) ) ( not ( = ?auto_27535 ?auto_27515 ) ) ( not ( = ?auto_27541 ?auto_27539 ) ) ( not ( = ?auto_27541 ?auto_27524 ) ) ( not ( = ?auto_27541 ?auto_27540 ) ) ( not ( = ?auto_27541 ?auto_27516 ) ) ( not ( = ?auto_27526 ?auto_27528 ) ) ( not ( = ?auto_27526 ?auto_27525 ) ) ( not ( = ?auto_27526 ?auto_27529 ) ) ( not ( = ?auto_27526 ?auto_27533 ) ) ( not ( = ?auto_27526 ?auto_27530 ) ) ( not ( = ?auto_27503 ?auto_27510 ) ) ( not ( = ?auto_27503 ?auto_27532 ) ) ( not ( = ?auto_27504 ?auto_27510 ) ) ( not ( = ?auto_27504 ?auto_27532 ) ) ( not ( = ?auto_27505 ?auto_27510 ) ) ( not ( = ?auto_27505 ?auto_27532 ) ) ( not ( = ?auto_27506 ?auto_27510 ) ) ( not ( = ?auto_27506 ?auto_27532 ) ) ( not ( = ?auto_27507 ?auto_27510 ) ) ( not ( = ?auto_27507 ?auto_27532 ) ) ( not ( = ?auto_27508 ?auto_27510 ) ) ( not ( = ?auto_27508 ?auto_27532 ) ) ( not ( = ?auto_27510 ?auto_27526 ) ) ( not ( = ?auto_27510 ?auto_27528 ) ) ( not ( = ?auto_27510 ?auto_27525 ) ) ( not ( = ?auto_27510 ?auto_27529 ) ) ( not ( = ?auto_27510 ?auto_27533 ) ) ( not ( = ?auto_27510 ?auto_27530 ) ) ( not ( = ?auto_27521 ?auto_27535 ) ) ( not ( = ?auto_27521 ?auto_27542 ) ) ( not ( = ?auto_27521 ?auto_27531 ) ) ( not ( = ?auto_27521 ?auto_27538 ) ) ( not ( = ?auto_27521 ?auto_27515 ) ) ( not ( = ?auto_27534 ?auto_27541 ) ) ( not ( = ?auto_27534 ?auto_27539 ) ) ( not ( = ?auto_27534 ?auto_27524 ) ) ( not ( = ?auto_27534 ?auto_27540 ) ) ( not ( = ?auto_27534 ?auto_27516 ) ) ( not ( = ?auto_27532 ?auto_27526 ) ) ( not ( = ?auto_27532 ?auto_27528 ) ) ( not ( = ?auto_27532 ?auto_27525 ) ) ( not ( = ?auto_27532 ?auto_27529 ) ) ( not ( = ?auto_27532 ?auto_27533 ) ) ( not ( = ?auto_27532 ?auto_27530 ) ) ( not ( = ?auto_27503 ?auto_27511 ) ) ( not ( = ?auto_27503 ?auto_27522 ) ) ( not ( = ?auto_27504 ?auto_27511 ) ) ( not ( = ?auto_27504 ?auto_27522 ) ) ( not ( = ?auto_27505 ?auto_27511 ) ) ( not ( = ?auto_27505 ?auto_27522 ) ) ( not ( = ?auto_27506 ?auto_27511 ) ) ( not ( = ?auto_27506 ?auto_27522 ) ) ( not ( = ?auto_27507 ?auto_27511 ) ) ( not ( = ?auto_27507 ?auto_27522 ) ) ( not ( = ?auto_27508 ?auto_27511 ) ) ( not ( = ?auto_27508 ?auto_27522 ) ) ( not ( = ?auto_27509 ?auto_27511 ) ) ( not ( = ?auto_27509 ?auto_27522 ) ) ( not ( = ?auto_27511 ?auto_27532 ) ) ( not ( = ?auto_27511 ?auto_27526 ) ) ( not ( = ?auto_27511 ?auto_27528 ) ) ( not ( = ?auto_27511 ?auto_27525 ) ) ( not ( = ?auto_27511 ?auto_27529 ) ) ( not ( = ?auto_27511 ?auto_27533 ) ) ( not ( = ?auto_27511 ?auto_27530 ) ) ( not ( = ?auto_27522 ?auto_27532 ) ) ( not ( = ?auto_27522 ?auto_27526 ) ) ( not ( = ?auto_27522 ?auto_27528 ) ) ( not ( = ?auto_27522 ?auto_27525 ) ) ( not ( = ?auto_27522 ?auto_27529 ) ) ( not ( = ?auto_27522 ?auto_27533 ) ) ( not ( = ?auto_27522 ?auto_27530 ) ) ( not ( = ?auto_27503 ?auto_27512 ) ) ( not ( = ?auto_27503 ?auto_27527 ) ) ( not ( = ?auto_27504 ?auto_27512 ) ) ( not ( = ?auto_27504 ?auto_27527 ) ) ( not ( = ?auto_27505 ?auto_27512 ) ) ( not ( = ?auto_27505 ?auto_27527 ) ) ( not ( = ?auto_27506 ?auto_27512 ) ) ( not ( = ?auto_27506 ?auto_27527 ) ) ( not ( = ?auto_27507 ?auto_27512 ) ) ( not ( = ?auto_27507 ?auto_27527 ) ) ( not ( = ?auto_27508 ?auto_27512 ) ) ( not ( = ?auto_27508 ?auto_27527 ) ) ( not ( = ?auto_27509 ?auto_27512 ) ) ( not ( = ?auto_27509 ?auto_27527 ) ) ( not ( = ?auto_27510 ?auto_27512 ) ) ( not ( = ?auto_27510 ?auto_27527 ) ) ( not ( = ?auto_27512 ?auto_27522 ) ) ( not ( = ?auto_27512 ?auto_27532 ) ) ( not ( = ?auto_27512 ?auto_27526 ) ) ( not ( = ?auto_27512 ?auto_27528 ) ) ( not ( = ?auto_27512 ?auto_27525 ) ) ( not ( = ?auto_27512 ?auto_27529 ) ) ( not ( = ?auto_27512 ?auto_27533 ) ) ( not ( = ?auto_27512 ?auto_27530 ) ) ( not ( = ?auto_27527 ?auto_27522 ) ) ( not ( = ?auto_27527 ?auto_27532 ) ) ( not ( = ?auto_27527 ?auto_27526 ) ) ( not ( = ?auto_27527 ?auto_27528 ) ) ( not ( = ?auto_27527 ?auto_27525 ) ) ( not ( = ?auto_27527 ?auto_27529 ) ) ( not ( = ?auto_27527 ?auto_27533 ) ) ( not ( = ?auto_27527 ?auto_27530 ) ) ( not ( = ?auto_27503 ?auto_27513 ) ) ( not ( = ?auto_27503 ?auto_27523 ) ) ( not ( = ?auto_27504 ?auto_27513 ) ) ( not ( = ?auto_27504 ?auto_27523 ) ) ( not ( = ?auto_27505 ?auto_27513 ) ) ( not ( = ?auto_27505 ?auto_27523 ) ) ( not ( = ?auto_27506 ?auto_27513 ) ) ( not ( = ?auto_27506 ?auto_27523 ) ) ( not ( = ?auto_27507 ?auto_27513 ) ) ( not ( = ?auto_27507 ?auto_27523 ) ) ( not ( = ?auto_27508 ?auto_27513 ) ) ( not ( = ?auto_27508 ?auto_27523 ) ) ( not ( = ?auto_27509 ?auto_27513 ) ) ( not ( = ?auto_27509 ?auto_27523 ) ) ( not ( = ?auto_27510 ?auto_27513 ) ) ( not ( = ?auto_27510 ?auto_27523 ) ) ( not ( = ?auto_27511 ?auto_27513 ) ) ( not ( = ?auto_27511 ?auto_27523 ) ) ( not ( = ?auto_27513 ?auto_27527 ) ) ( not ( = ?auto_27513 ?auto_27522 ) ) ( not ( = ?auto_27513 ?auto_27532 ) ) ( not ( = ?auto_27513 ?auto_27526 ) ) ( not ( = ?auto_27513 ?auto_27528 ) ) ( not ( = ?auto_27513 ?auto_27525 ) ) ( not ( = ?auto_27513 ?auto_27529 ) ) ( not ( = ?auto_27513 ?auto_27533 ) ) ( not ( = ?auto_27513 ?auto_27530 ) ) ( not ( = ?auto_27537 ?auto_27531 ) ) ( not ( = ?auto_27537 ?auto_27538 ) ) ( not ( = ?auto_27537 ?auto_27521 ) ) ( not ( = ?auto_27537 ?auto_27535 ) ) ( not ( = ?auto_27537 ?auto_27542 ) ) ( not ( = ?auto_27537 ?auto_27515 ) ) ( not ( = ?auto_27536 ?auto_27524 ) ) ( not ( = ?auto_27536 ?auto_27540 ) ) ( not ( = ?auto_27536 ?auto_27534 ) ) ( not ( = ?auto_27536 ?auto_27541 ) ) ( not ( = ?auto_27536 ?auto_27539 ) ) ( not ( = ?auto_27536 ?auto_27516 ) ) ( not ( = ?auto_27523 ?auto_27527 ) ) ( not ( = ?auto_27523 ?auto_27522 ) ) ( not ( = ?auto_27523 ?auto_27532 ) ) ( not ( = ?auto_27523 ?auto_27526 ) ) ( not ( = ?auto_27523 ?auto_27528 ) ) ( not ( = ?auto_27523 ?auto_27525 ) ) ( not ( = ?auto_27523 ?auto_27529 ) ) ( not ( = ?auto_27523 ?auto_27533 ) ) ( not ( = ?auto_27523 ?auto_27530 ) ) ( not ( = ?auto_27503 ?auto_27514 ) ) ( not ( = ?auto_27503 ?auto_27517 ) ) ( not ( = ?auto_27504 ?auto_27514 ) ) ( not ( = ?auto_27504 ?auto_27517 ) ) ( not ( = ?auto_27505 ?auto_27514 ) ) ( not ( = ?auto_27505 ?auto_27517 ) ) ( not ( = ?auto_27506 ?auto_27514 ) ) ( not ( = ?auto_27506 ?auto_27517 ) ) ( not ( = ?auto_27507 ?auto_27514 ) ) ( not ( = ?auto_27507 ?auto_27517 ) ) ( not ( = ?auto_27508 ?auto_27514 ) ) ( not ( = ?auto_27508 ?auto_27517 ) ) ( not ( = ?auto_27509 ?auto_27514 ) ) ( not ( = ?auto_27509 ?auto_27517 ) ) ( not ( = ?auto_27510 ?auto_27514 ) ) ( not ( = ?auto_27510 ?auto_27517 ) ) ( not ( = ?auto_27511 ?auto_27514 ) ) ( not ( = ?auto_27511 ?auto_27517 ) ) ( not ( = ?auto_27512 ?auto_27514 ) ) ( not ( = ?auto_27512 ?auto_27517 ) ) ( not ( = ?auto_27514 ?auto_27523 ) ) ( not ( = ?auto_27514 ?auto_27527 ) ) ( not ( = ?auto_27514 ?auto_27522 ) ) ( not ( = ?auto_27514 ?auto_27532 ) ) ( not ( = ?auto_27514 ?auto_27526 ) ) ( not ( = ?auto_27514 ?auto_27528 ) ) ( not ( = ?auto_27514 ?auto_27525 ) ) ( not ( = ?auto_27514 ?auto_27529 ) ) ( not ( = ?auto_27514 ?auto_27533 ) ) ( not ( = ?auto_27514 ?auto_27530 ) ) ( not ( = ?auto_27517 ?auto_27523 ) ) ( not ( = ?auto_27517 ?auto_27527 ) ) ( not ( = ?auto_27517 ?auto_27522 ) ) ( not ( = ?auto_27517 ?auto_27532 ) ) ( not ( = ?auto_27517 ?auto_27526 ) ) ( not ( = ?auto_27517 ?auto_27528 ) ) ( not ( = ?auto_27517 ?auto_27525 ) ) ( not ( = ?auto_27517 ?auto_27529 ) ) ( not ( = ?auto_27517 ?auto_27533 ) ) ( not ( = ?auto_27517 ?auto_27530 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_27503 ?auto_27504 ?auto_27505 ?auto_27506 ?auto_27507 ?auto_27508 ?auto_27509 ?auto_27510 ?auto_27511 ?auto_27512 ?auto_27513 )
      ( MAKE-1CRATE ?auto_27513 ?auto_27514 )
      ( MAKE-11CRATE-VERIFY ?auto_27503 ?auto_27504 ?auto_27505 ?auto_27506 ?auto_27507 ?auto_27508 ?auto_27509 ?auto_27510 ?auto_27511 ?auto_27512 ?auto_27513 ?auto_27514 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_27566 - SURFACE
      ?auto_27567 - SURFACE
      ?auto_27568 - SURFACE
      ?auto_27569 - SURFACE
      ?auto_27570 - SURFACE
      ?auto_27571 - SURFACE
      ?auto_27572 - SURFACE
      ?auto_27573 - SURFACE
      ?auto_27574 - SURFACE
      ?auto_27575 - SURFACE
      ?auto_27576 - SURFACE
      ?auto_27577 - SURFACE
      ?auto_27578 - SURFACE
    )
    :vars
    (
      ?auto_27583 - HOIST
      ?auto_27584 - PLACE
      ?auto_27579 - PLACE
      ?auto_27582 - HOIST
      ?auto_27581 - SURFACE
      ?auto_27599 - PLACE
      ?auto_27603 - HOIST
      ?auto_27590 - SURFACE
      ?auto_27593 - PLACE
      ?auto_27585 - HOIST
      ?auto_27601 - SURFACE
      ?auto_27605 - PLACE
      ?auto_27607 - HOIST
      ?auto_27592 - SURFACE
      ?auto_27586 - SURFACE
      ?auto_27606 - PLACE
      ?auto_27598 - HOIST
      ?auto_27597 - SURFACE
      ?auto_27589 - PLACE
      ?auto_27600 - HOIST
      ?auto_27595 - SURFACE
      ?auto_27588 - PLACE
      ?auto_27594 - HOIST
      ?auto_27596 - SURFACE
      ?auto_27591 - SURFACE
      ?auto_27604 - SURFACE
      ?auto_27602 - SURFACE
      ?auto_27587 - SURFACE
      ?auto_27580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27583 ?auto_27584 ) ( IS-CRATE ?auto_27578 ) ( not ( = ?auto_27579 ?auto_27584 ) ) ( HOIST-AT ?auto_27582 ?auto_27579 ) ( SURFACE-AT ?auto_27578 ?auto_27579 ) ( ON ?auto_27578 ?auto_27581 ) ( CLEAR ?auto_27578 ) ( not ( = ?auto_27577 ?auto_27578 ) ) ( not ( = ?auto_27577 ?auto_27581 ) ) ( not ( = ?auto_27578 ?auto_27581 ) ) ( not ( = ?auto_27583 ?auto_27582 ) ) ( IS-CRATE ?auto_27577 ) ( not ( = ?auto_27599 ?auto_27584 ) ) ( HOIST-AT ?auto_27603 ?auto_27599 ) ( SURFACE-AT ?auto_27577 ?auto_27599 ) ( ON ?auto_27577 ?auto_27590 ) ( CLEAR ?auto_27577 ) ( not ( = ?auto_27576 ?auto_27577 ) ) ( not ( = ?auto_27576 ?auto_27590 ) ) ( not ( = ?auto_27577 ?auto_27590 ) ) ( not ( = ?auto_27583 ?auto_27603 ) ) ( IS-CRATE ?auto_27576 ) ( not ( = ?auto_27593 ?auto_27584 ) ) ( HOIST-AT ?auto_27585 ?auto_27593 ) ( AVAILABLE ?auto_27585 ) ( SURFACE-AT ?auto_27576 ?auto_27593 ) ( ON ?auto_27576 ?auto_27601 ) ( CLEAR ?auto_27576 ) ( not ( = ?auto_27575 ?auto_27576 ) ) ( not ( = ?auto_27575 ?auto_27601 ) ) ( not ( = ?auto_27576 ?auto_27601 ) ) ( not ( = ?auto_27583 ?auto_27585 ) ) ( IS-CRATE ?auto_27575 ) ( not ( = ?auto_27605 ?auto_27584 ) ) ( HOIST-AT ?auto_27607 ?auto_27605 ) ( SURFACE-AT ?auto_27575 ?auto_27605 ) ( ON ?auto_27575 ?auto_27592 ) ( CLEAR ?auto_27575 ) ( not ( = ?auto_27574 ?auto_27575 ) ) ( not ( = ?auto_27574 ?auto_27592 ) ) ( not ( = ?auto_27575 ?auto_27592 ) ) ( not ( = ?auto_27583 ?auto_27607 ) ) ( IS-CRATE ?auto_27574 ) ( SURFACE-AT ?auto_27574 ?auto_27579 ) ( ON ?auto_27574 ?auto_27586 ) ( CLEAR ?auto_27574 ) ( not ( = ?auto_27573 ?auto_27574 ) ) ( not ( = ?auto_27573 ?auto_27586 ) ) ( not ( = ?auto_27574 ?auto_27586 ) ) ( IS-CRATE ?auto_27573 ) ( not ( = ?auto_27606 ?auto_27584 ) ) ( HOIST-AT ?auto_27598 ?auto_27606 ) ( AVAILABLE ?auto_27598 ) ( SURFACE-AT ?auto_27573 ?auto_27606 ) ( ON ?auto_27573 ?auto_27597 ) ( CLEAR ?auto_27573 ) ( not ( = ?auto_27572 ?auto_27573 ) ) ( not ( = ?auto_27572 ?auto_27597 ) ) ( not ( = ?auto_27573 ?auto_27597 ) ) ( not ( = ?auto_27583 ?auto_27598 ) ) ( IS-CRATE ?auto_27572 ) ( not ( = ?auto_27589 ?auto_27584 ) ) ( HOIST-AT ?auto_27600 ?auto_27589 ) ( AVAILABLE ?auto_27600 ) ( SURFACE-AT ?auto_27572 ?auto_27589 ) ( ON ?auto_27572 ?auto_27595 ) ( CLEAR ?auto_27572 ) ( not ( = ?auto_27571 ?auto_27572 ) ) ( not ( = ?auto_27571 ?auto_27595 ) ) ( not ( = ?auto_27572 ?auto_27595 ) ) ( not ( = ?auto_27583 ?auto_27600 ) ) ( IS-CRATE ?auto_27571 ) ( not ( = ?auto_27588 ?auto_27584 ) ) ( HOIST-AT ?auto_27594 ?auto_27588 ) ( SURFACE-AT ?auto_27571 ?auto_27588 ) ( ON ?auto_27571 ?auto_27596 ) ( CLEAR ?auto_27571 ) ( not ( = ?auto_27570 ?auto_27571 ) ) ( not ( = ?auto_27570 ?auto_27596 ) ) ( not ( = ?auto_27571 ?auto_27596 ) ) ( not ( = ?auto_27583 ?auto_27594 ) ) ( IS-CRATE ?auto_27570 ) ( AVAILABLE ?auto_27594 ) ( SURFACE-AT ?auto_27570 ?auto_27588 ) ( ON ?auto_27570 ?auto_27591 ) ( CLEAR ?auto_27570 ) ( not ( = ?auto_27569 ?auto_27570 ) ) ( not ( = ?auto_27569 ?auto_27591 ) ) ( not ( = ?auto_27570 ?auto_27591 ) ) ( IS-CRATE ?auto_27569 ) ( AVAILABLE ?auto_27607 ) ( SURFACE-AT ?auto_27569 ?auto_27605 ) ( ON ?auto_27569 ?auto_27604 ) ( CLEAR ?auto_27569 ) ( not ( = ?auto_27568 ?auto_27569 ) ) ( not ( = ?auto_27568 ?auto_27604 ) ) ( not ( = ?auto_27569 ?auto_27604 ) ) ( IS-CRATE ?auto_27568 ) ( AVAILABLE ?auto_27582 ) ( SURFACE-AT ?auto_27568 ?auto_27579 ) ( ON ?auto_27568 ?auto_27602 ) ( CLEAR ?auto_27568 ) ( not ( = ?auto_27567 ?auto_27568 ) ) ( not ( = ?auto_27567 ?auto_27602 ) ) ( not ( = ?auto_27568 ?auto_27602 ) ) ( SURFACE-AT ?auto_27566 ?auto_27584 ) ( CLEAR ?auto_27566 ) ( IS-CRATE ?auto_27567 ) ( AVAILABLE ?auto_27583 ) ( AVAILABLE ?auto_27603 ) ( SURFACE-AT ?auto_27567 ?auto_27599 ) ( ON ?auto_27567 ?auto_27587 ) ( CLEAR ?auto_27567 ) ( TRUCK-AT ?auto_27580 ?auto_27584 ) ( not ( = ?auto_27566 ?auto_27567 ) ) ( not ( = ?auto_27566 ?auto_27587 ) ) ( not ( = ?auto_27567 ?auto_27587 ) ) ( not ( = ?auto_27566 ?auto_27568 ) ) ( not ( = ?auto_27566 ?auto_27602 ) ) ( not ( = ?auto_27568 ?auto_27587 ) ) ( not ( = ?auto_27579 ?auto_27599 ) ) ( not ( = ?auto_27582 ?auto_27603 ) ) ( not ( = ?auto_27602 ?auto_27587 ) ) ( not ( = ?auto_27566 ?auto_27569 ) ) ( not ( = ?auto_27566 ?auto_27604 ) ) ( not ( = ?auto_27567 ?auto_27569 ) ) ( not ( = ?auto_27567 ?auto_27604 ) ) ( not ( = ?auto_27569 ?auto_27602 ) ) ( not ( = ?auto_27569 ?auto_27587 ) ) ( not ( = ?auto_27605 ?auto_27579 ) ) ( not ( = ?auto_27605 ?auto_27599 ) ) ( not ( = ?auto_27607 ?auto_27582 ) ) ( not ( = ?auto_27607 ?auto_27603 ) ) ( not ( = ?auto_27604 ?auto_27602 ) ) ( not ( = ?auto_27604 ?auto_27587 ) ) ( not ( = ?auto_27566 ?auto_27570 ) ) ( not ( = ?auto_27566 ?auto_27591 ) ) ( not ( = ?auto_27567 ?auto_27570 ) ) ( not ( = ?auto_27567 ?auto_27591 ) ) ( not ( = ?auto_27568 ?auto_27570 ) ) ( not ( = ?auto_27568 ?auto_27591 ) ) ( not ( = ?auto_27570 ?auto_27604 ) ) ( not ( = ?auto_27570 ?auto_27602 ) ) ( not ( = ?auto_27570 ?auto_27587 ) ) ( not ( = ?auto_27588 ?auto_27605 ) ) ( not ( = ?auto_27588 ?auto_27579 ) ) ( not ( = ?auto_27588 ?auto_27599 ) ) ( not ( = ?auto_27594 ?auto_27607 ) ) ( not ( = ?auto_27594 ?auto_27582 ) ) ( not ( = ?auto_27594 ?auto_27603 ) ) ( not ( = ?auto_27591 ?auto_27604 ) ) ( not ( = ?auto_27591 ?auto_27602 ) ) ( not ( = ?auto_27591 ?auto_27587 ) ) ( not ( = ?auto_27566 ?auto_27571 ) ) ( not ( = ?auto_27566 ?auto_27596 ) ) ( not ( = ?auto_27567 ?auto_27571 ) ) ( not ( = ?auto_27567 ?auto_27596 ) ) ( not ( = ?auto_27568 ?auto_27571 ) ) ( not ( = ?auto_27568 ?auto_27596 ) ) ( not ( = ?auto_27569 ?auto_27571 ) ) ( not ( = ?auto_27569 ?auto_27596 ) ) ( not ( = ?auto_27571 ?auto_27591 ) ) ( not ( = ?auto_27571 ?auto_27604 ) ) ( not ( = ?auto_27571 ?auto_27602 ) ) ( not ( = ?auto_27571 ?auto_27587 ) ) ( not ( = ?auto_27596 ?auto_27591 ) ) ( not ( = ?auto_27596 ?auto_27604 ) ) ( not ( = ?auto_27596 ?auto_27602 ) ) ( not ( = ?auto_27596 ?auto_27587 ) ) ( not ( = ?auto_27566 ?auto_27572 ) ) ( not ( = ?auto_27566 ?auto_27595 ) ) ( not ( = ?auto_27567 ?auto_27572 ) ) ( not ( = ?auto_27567 ?auto_27595 ) ) ( not ( = ?auto_27568 ?auto_27572 ) ) ( not ( = ?auto_27568 ?auto_27595 ) ) ( not ( = ?auto_27569 ?auto_27572 ) ) ( not ( = ?auto_27569 ?auto_27595 ) ) ( not ( = ?auto_27570 ?auto_27572 ) ) ( not ( = ?auto_27570 ?auto_27595 ) ) ( not ( = ?auto_27572 ?auto_27596 ) ) ( not ( = ?auto_27572 ?auto_27591 ) ) ( not ( = ?auto_27572 ?auto_27604 ) ) ( not ( = ?auto_27572 ?auto_27602 ) ) ( not ( = ?auto_27572 ?auto_27587 ) ) ( not ( = ?auto_27589 ?auto_27588 ) ) ( not ( = ?auto_27589 ?auto_27605 ) ) ( not ( = ?auto_27589 ?auto_27579 ) ) ( not ( = ?auto_27589 ?auto_27599 ) ) ( not ( = ?auto_27600 ?auto_27594 ) ) ( not ( = ?auto_27600 ?auto_27607 ) ) ( not ( = ?auto_27600 ?auto_27582 ) ) ( not ( = ?auto_27600 ?auto_27603 ) ) ( not ( = ?auto_27595 ?auto_27596 ) ) ( not ( = ?auto_27595 ?auto_27591 ) ) ( not ( = ?auto_27595 ?auto_27604 ) ) ( not ( = ?auto_27595 ?auto_27602 ) ) ( not ( = ?auto_27595 ?auto_27587 ) ) ( not ( = ?auto_27566 ?auto_27573 ) ) ( not ( = ?auto_27566 ?auto_27597 ) ) ( not ( = ?auto_27567 ?auto_27573 ) ) ( not ( = ?auto_27567 ?auto_27597 ) ) ( not ( = ?auto_27568 ?auto_27573 ) ) ( not ( = ?auto_27568 ?auto_27597 ) ) ( not ( = ?auto_27569 ?auto_27573 ) ) ( not ( = ?auto_27569 ?auto_27597 ) ) ( not ( = ?auto_27570 ?auto_27573 ) ) ( not ( = ?auto_27570 ?auto_27597 ) ) ( not ( = ?auto_27571 ?auto_27573 ) ) ( not ( = ?auto_27571 ?auto_27597 ) ) ( not ( = ?auto_27573 ?auto_27595 ) ) ( not ( = ?auto_27573 ?auto_27596 ) ) ( not ( = ?auto_27573 ?auto_27591 ) ) ( not ( = ?auto_27573 ?auto_27604 ) ) ( not ( = ?auto_27573 ?auto_27602 ) ) ( not ( = ?auto_27573 ?auto_27587 ) ) ( not ( = ?auto_27606 ?auto_27589 ) ) ( not ( = ?auto_27606 ?auto_27588 ) ) ( not ( = ?auto_27606 ?auto_27605 ) ) ( not ( = ?auto_27606 ?auto_27579 ) ) ( not ( = ?auto_27606 ?auto_27599 ) ) ( not ( = ?auto_27598 ?auto_27600 ) ) ( not ( = ?auto_27598 ?auto_27594 ) ) ( not ( = ?auto_27598 ?auto_27607 ) ) ( not ( = ?auto_27598 ?auto_27582 ) ) ( not ( = ?auto_27598 ?auto_27603 ) ) ( not ( = ?auto_27597 ?auto_27595 ) ) ( not ( = ?auto_27597 ?auto_27596 ) ) ( not ( = ?auto_27597 ?auto_27591 ) ) ( not ( = ?auto_27597 ?auto_27604 ) ) ( not ( = ?auto_27597 ?auto_27602 ) ) ( not ( = ?auto_27597 ?auto_27587 ) ) ( not ( = ?auto_27566 ?auto_27574 ) ) ( not ( = ?auto_27566 ?auto_27586 ) ) ( not ( = ?auto_27567 ?auto_27574 ) ) ( not ( = ?auto_27567 ?auto_27586 ) ) ( not ( = ?auto_27568 ?auto_27574 ) ) ( not ( = ?auto_27568 ?auto_27586 ) ) ( not ( = ?auto_27569 ?auto_27574 ) ) ( not ( = ?auto_27569 ?auto_27586 ) ) ( not ( = ?auto_27570 ?auto_27574 ) ) ( not ( = ?auto_27570 ?auto_27586 ) ) ( not ( = ?auto_27571 ?auto_27574 ) ) ( not ( = ?auto_27571 ?auto_27586 ) ) ( not ( = ?auto_27572 ?auto_27574 ) ) ( not ( = ?auto_27572 ?auto_27586 ) ) ( not ( = ?auto_27574 ?auto_27597 ) ) ( not ( = ?auto_27574 ?auto_27595 ) ) ( not ( = ?auto_27574 ?auto_27596 ) ) ( not ( = ?auto_27574 ?auto_27591 ) ) ( not ( = ?auto_27574 ?auto_27604 ) ) ( not ( = ?auto_27574 ?auto_27602 ) ) ( not ( = ?auto_27574 ?auto_27587 ) ) ( not ( = ?auto_27586 ?auto_27597 ) ) ( not ( = ?auto_27586 ?auto_27595 ) ) ( not ( = ?auto_27586 ?auto_27596 ) ) ( not ( = ?auto_27586 ?auto_27591 ) ) ( not ( = ?auto_27586 ?auto_27604 ) ) ( not ( = ?auto_27586 ?auto_27602 ) ) ( not ( = ?auto_27586 ?auto_27587 ) ) ( not ( = ?auto_27566 ?auto_27575 ) ) ( not ( = ?auto_27566 ?auto_27592 ) ) ( not ( = ?auto_27567 ?auto_27575 ) ) ( not ( = ?auto_27567 ?auto_27592 ) ) ( not ( = ?auto_27568 ?auto_27575 ) ) ( not ( = ?auto_27568 ?auto_27592 ) ) ( not ( = ?auto_27569 ?auto_27575 ) ) ( not ( = ?auto_27569 ?auto_27592 ) ) ( not ( = ?auto_27570 ?auto_27575 ) ) ( not ( = ?auto_27570 ?auto_27592 ) ) ( not ( = ?auto_27571 ?auto_27575 ) ) ( not ( = ?auto_27571 ?auto_27592 ) ) ( not ( = ?auto_27572 ?auto_27575 ) ) ( not ( = ?auto_27572 ?auto_27592 ) ) ( not ( = ?auto_27573 ?auto_27575 ) ) ( not ( = ?auto_27573 ?auto_27592 ) ) ( not ( = ?auto_27575 ?auto_27586 ) ) ( not ( = ?auto_27575 ?auto_27597 ) ) ( not ( = ?auto_27575 ?auto_27595 ) ) ( not ( = ?auto_27575 ?auto_27596 ) ) ( not ( = ?auto_27575 ?auto_27591 ) ) ( not ( = ?auto_27575 ?auto_27604 ) ) ( not ( = ?auto_27575 ?auto_27602 ) ) ( not ( = ?auto_27575 ?auto_27587 ) ) ( not ( = ?auto_27592 ?auto_27586 ) ) ( not ( = ?auto_27592 ?auto_27597 ) ) ( not ( = ?auto_27592 ?auto_27595 ) ) ( not ( = ?auto_27592 ?auto_27596 ) ) ( not ( = ?auto_27592 ?auto_27591 ) ) ( not ( = ?auto_27592 ?auto_27604 ) ) ( not ( = ?auto_27592 ?auto_27602 ) ) ( not ( = ?auto_27592 ?auto_27587 ) ) ( not ( = ?auto_27566 ?auto_27576 ) ) ( not ( = ?auto_27566 ?auto_27601 ) ) ( not ( = ?auto_27567 ?auto_27576 ) ) ( not ( = ?auto_27567 ?auto_27601 ) ) ( not ( = ?auto_27568 ?auto_27576 ) ) ( not ( = ?auto_27568 ?auto_27601 ) ) ( not ( = ?auto_27569 ?auto_27576 ) ) ( not ( = ?auto_27569 ?auto_27601 ) ) ( not ( = ?auto_27570 ?auto_27576 ) ) ( not ( = ?auto_27570 ?auto_27601 ) ) ( not ( = ?auto_27571 ?auto_27576 ) ) ( not ( = ?auto_27571 ?auto_27601 ) ) ( not ( = ?auto_27572 ?auto_27576 ) ) ( not ( = ?auto_27572 ?auto_27601 ) ) ( not ( = ?auto_27573 ?auto_27576 ) ) ( not ( = ?auto_27573 ?auto_27601 ) ) ( not ( = ?auto_27574 ?auto_27576 ) ) ( not ( = ?auto_27574 ?auto_27601 ) ) ( not ( = ?auto_27576 ?auto_27592 ) ) ( not ( = ?auto_27576 ?auto_27586 ) ) ( not ( = ?auto_27576 ?auto_27597 ) ) ( not ( = ?auto_27576 ?auto_27595 ) ) ( not ( = ?auto_27576 ?auto_27596 ) ) ( not ( = ?auto_27576 ?auto_27591 ) ) ( not ( = ?auto_27576 ?auto_27604 ) ) ( not ( = ?auto_27576 ?auto_27602 ) ) ( not ( = ?auto_27576 ?auto_27587 ) ) ( not ( = ?auto_27593 ?auto_27605 ) ) ( not ( = ?auto_27593 ?auto_27579 ) ) ( not ( = ?auto_27593 ?auto_27606 ) ) ( not ( = ?auto_27593 ?auto_27589 ) ) ( not ( = ?auto_27593 ?auto_27588 ) ) ( not ( = ?auto_27593 ?auto_27599 ) ) ( not ( = ?auto_27585 ?auto_27607 ) ) ( not ( = ?auto_27585 ?auto_27582 ) ) ( not ( = ?auto_27585 ?auto_27598 ) ) ( not ( = ?auto_27585 ?auto_27600 ) ) ( not ( = ?auto_27585 ?auto_27594 ) ) ( not ( = ?auto_27585 ?auto_27603 ) ) ( not ( = ?auto_27601 ?auto_27592 ) ) ( not ( = ?auto_27601 ?auto_27586 ) ) ( not ( = ?auto_27601 ?auto_27597 ) ) ( not ( = ?auto_27601 ?auto_27595 ) ) ( not ( = ?auto_27601 ?auto_27596 ) ) ( not ( = ?auto_27601 ?auto_27591 ) ) ( not ( = ?auto_27601 ?auto_27604 ) ) ( not ( = ?auto_27601 ?auto_27602 ) ) ( not ( = ?auto_27601 ?auto_27587 ) ) ( not ( = ?auto_27566 ?auto_27577 ) ) ( not ( = ?auto_27566 ?auto_27590 ) ) ( not ( = ?auto_27567 ?auto_27577 ) ) ( not ( = ?auto_27567 ?auto_27590 ) ) ( not ( = ?auto_27568 ?auto_27577 ) ) ( not ( = ?auto_27568 ?auto_27590 ) ) ( not ( = ?auto_27569 ?auto_27577 ) ) ( not ( = ?auto_27569 ?auto_27590 ) ) ( not ( = ?auto_27570 ?auto_27577 ) ) ( not ( = ?auto_27570 ?auto_27590 ) ) ( not ( = ?auto_27571 ?auto_27577 ) ) ( not ( = ?auto_27571 ?auto_27590 ) ) ( not ( = ?auto_27572 ?auto_27577 ) ) ( not ( = ?auto_27572 ?auto_27590 ) ) ( not ( = ?auto_27573 ?auto_27577 ) ) ( not ( = ?auto_27573 ?auto_27590 ) ) ( not ( = ?auto_27574 ?auto_27577 ) ) ( not ( = ?auto_27574 ?auto_27590 ) ) ( not ( = ?auto_27575 ?auto_27577 ) ) ( not ( = ?auto_27575 ?auto_27590 ) ) ( not ( = ?auto_27577 ?auto_27601 ) ) ( not ( = ?auto_27577 ?auto_27592 ) ) ( not ( = ?auto_27577 ?auto_27586 ) ) ( not ( = ?auto_27577 ?auto_27597 ) ) ( not ( = ?auto_27577 ?auto_27595 ) ) ( not ( = ?auto_27577 ?auto_27596 ) ) ( not ( = ?auto_27577 ?auto_27591 ) ) ( not ( = ?auto_27577 ?auto_27604 ) ) ( not ( = ?auto_27577 ?auto_27602 ) ) ( not ( = ?auto_27577 ?auto_27587 ) ) ( not ( = ?auto_27590 ?auto_27601 ) ) ( not ( = ?auto_27590 ?auto_27592 ) ) ( not ( = ?auto_27590 ?auto_27586 ) ) ( not ( = ?auto_27590 ?auto_27597 ) ) ( not ( = ?auto_27590 ?auto_27595 ) ) ( not ( = ?auto_27590 ?auto_27596 ) ) ( not ( = ?auto_27590 ?auto_27591 ) ) ( not ( = ?auto_27590 ?auto_27604 ) ) ( not ( = ?auto_27590 ?auto_27602 ) ) ( not ( = ?auto_27590 ?auto_27587 ) ) ( not ( = ?auto_27566 ?auto_27578 ) ) ( not ( = ?auto_27566 ?auto_27581 ) ) ( not ( = ?auto_27567 ?auto_27578 ) ) ( not ( = ?auto_27567 ?auto_27581 ) ) ( not ( = ?auto_27568 ?auto_27578 ) ) ( not ( = ?auto_27568 ?auto_27581 ) ) ( not ( = ?auto_27569 ?auto_27578 ) ) ( not ( = ?auto_27569 ?auto_27581 ) ) ( not ( = ?auto_27570 ?auto_27578 ) ) ( not ( = ?auto_27570 ?auto_27581 ) ) ( not ( = ?auto_27571 ?auto_27578 ) ) ( not ( = ?auto_27571 ?auto_27581 ) ) ( not ( = ?auto_27572 ?auto_27578 ) ) ( not ( = ?auto_27572 ?auto_27581 ) ) ( not ( = ?auto_27573 ?auto_27578 ) ) ( not ( = ?auto_27573 ?auto_27581 ) ) ( not ( = ?auto_27574 ?auto_27578 ) ) ( not ( = ?auto_27574 ?auto_27581 ) ) ( not ( = ?auto_27575 ?auto_27578 ) ) ( not ( = ?auto_27575 ?auto_27581 ) ) ( not ( = ?auto_27576 ?auto_27578 ) ) ( not ( = ?auto_27576 ?auto_27581 ) ) ( not ( = ?auto_27578 ?auto_27590 ) ) ( not ( = ?auto_27578 ?auto_27601 ) ) ( not ( = ?auto_27578 ?auto_27592 ) ) ( not ( = ?auto_27578 ?auto_27586 ) ) ( not ( = ?auto_27578 ?auto_27597 ) ) ( not ( = ?auto_27578 ?auto_27595 ) ) ( not ( = ?auto_27578 ?auto_27596 ) ) ( not ( = ?auto_27578 ?auto_27591 ) ) ( not ( = ?auto_27578 ?auto_27604 ) ) ( not ( = ?auto_27578 ?auto_27602 ) ) ( not ( = ?auto_27578 ?auto_27587 ) ) ( not ( = ?auto_27581 ?auto_27590 ) ) ( not ( = ?auto_27581 ?auto_27601 ) ) ( not ( = ?auto_27581 ?auto_27592 ) ) ( not ( = ?auto_27581 ?auto_27586 ) ) ( not ( = ?auto_27581 ?auto_27597 ) ) ( not ( = ?auto_27581 ?auto_27595 ) ) ( not ( = ?auto_27581 ?auto_27596 ) ) ( not ( = ?auto_27581 ?auto_27591 ) ) ( not ( = ?auto_27581 ?auto_27604 ) ) ( not ( = ?auto_27581 ?auto_27602 ) ) ( not ( = ?auto_27581 ?auto_27587 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_27566 ?auto_27567 ?auto_27568 ?auto_27569 ?auto_27570 ?auto_27571 ?auto_27572 ?auto_27573 ?auto_27574 ?auto_27575 ?auto_27576 ?auto_27577 )
      ( MAKE-1CRATE ?auto_27577 ?auto_27578 )
      ( MAKE-12CRATE-VERIFY ?auto_27566 ?auto_27567 ?auto_27568 ?auto_27569 ?auto_27570 ?auto_27571 ?auto_27572 ?auto_27573 ?auto_27574 ?auto_27575 ?auto_27576 ?auto_27577 ?auto_27578 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_27632 - SURFACE
      ?auto_27633 - SURFACE
      ?auto_27634 - SURFACE
      ?auto_27635 - SURFACE
      ?auto_27636 - SURFACE
      ?auto_27637 - SURFACE
      ?auto_27638 - SURFACE
      ?auto_27639 - SURFACE
      ?auto_27640 - SURFACE
      ?auto_27641 - SURFACE
      ?auto_27642 - SURFACE
      ?auto_27643 - SURFACE
      ?auto_27644 - SURFACE
      ?auto_27645 - SURFACE
    )
    :vars
    (
      ?auto_27650 - HOIST
      ?auto_27646 - PLACE
      ?auto_27649 - PLACE
      ?auto_27648 - HOIST
      ?auto_27651 - SURFACE
      ?auto_27656 - SURFACE
      ?auto_27662 - PLACE
      ?auto_27672 - HOIST
      ?auto_27655 - SURFACE
      ?auto_27673 - PLACE
      ?auto_27674 - HOIST
      ?auto_27670 - SURFACE
      ?auto_27669 - PLACE
      ?auto_27660 - HOIST
      ?auto_27659 - SURFACE
      ?auto_27667 - SURFACE
      ?auto_27658 - PLACE
      ?auto_27666 - HOIST
      ?auto_27657 - SURFACE
      ?auto_27671 - PLACE
      ?auto_27675 - HOIST
      ?auto_27664 - SURFACE
      ?auto_27653 - PLACE
      ?auto_27652 - HOIST
      ?auto_27665 - SURFACE
      ?auto_27668 - SURFACE
      ?auto_27661 - SURFACE
      ?auto_27663 - SURFACE
      ?auto_27654 - SURFACE
      ?auto_27647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27650 ?auto_27646 ) ( IS-CRATE ?auto_27645 ) ( not ( = ?auto_27649 ?auto_27646 ) ) ( HOIST-AT ?auto_27648 ?auto_27649 ) ( SURFACE-AT ?auto_27645 ?auto_27649 ) ( ON ?auto_27645 ?auto_27651 ) ( CLEAR ?auto_27645 ) ( not ( = ?auto_27644 ?auto_27645 ) ) ( not ( = ?auto_27644 ?auto_27651 ) ) ( not ( = ?auto_27645 ?auto_27651 ) ) ( not ( = ?auto_27650 ?auto_27648 ) ) ( IS-CRATE ?auto_27644 ) ( SURFACE-AT ?auto_27644 ?auto_27649 ) ( ON ?auto_27644 ?auto_27656 ) ( CLEAR ?auto_27644 ) ( not ( = ?auto_27643 ?auto_27644 ) ) ( not ( = ?auto_27643 ?auto_27656 ) ) ( not ( = ?auto_27644 ?auto_27656 ) ) ( IS-CRATE ?auto_27643 ) ( not ( = ?auto_27662 ?auto_27646 ) ) ( HOIST-AT ?auto_27672 ?auto_27662 ) ( SURFACE-AT ?auto_27643 ?auto_27662 ) ( ON ?auto_27643 ?auto_27655 ) ( CLEAR ?auto_27643 ) ( not ( = ?auto_27642 ?auto_27643 ) ) ( not ( = ?auto_27642 ?auto_27655 ) ) ( not ( = ?auto_27643 ?auto_27655 ) ) ( not ( = ?auto_27650 ?auto_27672 ) ) ( IS-CRATE ?auto_27642 ) ( not ( = ?auto_27673 ?auto_27646 ) ) ( HOIST-AT ?auto_27674 ?auto_27673 ) ( AVAILABLE ?auto_27674 ) ( SURFACE-AT ?auto_27642 ?auto_27673 ) ( ON ?auto_27642 ?auto_27670 ) ( CLEAR ?auto_27642 ) ( not ( = ?auto_27641 ?auto_27642 ) ) ( not ( = ?auto_27641 ?auto_27670 ) ) ( not ( = ?auto_27642 ?auto_27670 ) ) ( not ( = ?auto_27650 ?auto_27674 ) ) ( IS-CRATE ?auto_27641 ) ( not ( = ?auto_27669 ?auto_27646 ) ) ( HOIST-AT ?auto_27660 ?auto_27669 ) ( SURFACE-AT ?auto_27641 ?auto_27669 ) ( ON ?auto_27641 ?auto_27659 ) ( CLEAR ?auto_27641 ) ( not ( = ?auto_27640 ?auto_27641 ) ) ( not ( = ?auto_27640 ?auto_27659 ) ) ( not ( = ?auto_27641 ?auto_27659 ) ) ( not ( = ?auto_27650 ?auto_27660 ) ) ( IS-CRATE ?auto_27640 ) ( SURFACE-AT ?auto_27640 ?auto_27649 ) ( ON ?auto_27640 ?auto_27667 ) ( CLEAR ?auto_27640 ) ( not ( = ?auto_27639 ?auto_27640 ) ) ( not ( = ?auto_27639 ?auto_27667 ) ) ( not ( = ?auto_27640 ?auto_27667 ) ) ( IS-CRATE ?auto_27639 ) ( not ( = ?auto_27658 ?auto_27646 ) ) ( HOIST-AT ?auto_27666 ?auto_27658 ) ( AVAILABLE ?auto_27666 ) ( SURFACE-AT ?auto_27639 ?auto_27658 ) ( ON ?auto_27639 ?auto_27657 ) ( CLEAR ?auto_27639 ) ( not ( = ?auto_27638 ?auto_27639 ) ) ( not ( = ?auto_27638 ?auto_27657 ) ) ( not ( = ?auto_27639 ?auto_27657 ) ) ( not ( = ?auto_27650 ?auto_27666 ) ) ( IS-CRATE ?auto_27638 ) ( not ( = ?auto_27671 ?auto_27646 ) ) ( HOIST-AT ?auto_27675 ?auto_27671 ) ( AVAILABLE ?auto_27675 ) ( SURFACE-AT ?auto_27638 ?auto_27671 ) ( ON ?auto_27638 ?auto_27664 ) ( CLEAR ?auto_27638 ) ( not ( = ?auto_27637 ?auto_27638 ) ) ( not ( = ?auto_27637 ?auto_27664 ) ) ( not ( = ?auto_27638 ?auto_27664 ) ) ( not ( = ?auto_27650 ?auto_27675 ) ) ( IS-CRATE ?auto_27637 ) ( not ( = ?auto_27653 ?auto_27646 ) ) ( HOIST-AT ?auto_27652 ?auto_27653 ) ( SURFACE-AT ?auto_27637 ?auto_27653 ) ( ON ?auto_27637 ?auto_27665 ) ( CLEAR ?auto_27637 ) ( not ( = ?auto_27636 ?auto_27637 ) ) ( not ( = ?auto_27636 ?auto_27665 ) ) ( not ( = ?auto_27637 ?auto_27665 ) ) ( not ( = ?auto_27650 ?auto_27652 ) ) ( IS-CRATE ?auto_27636 ) ( AVAILABLE ?auto_27652 ) ( SURFACE-AT ?auto_27636 ?auto_27653 ) ( ON ?auto_27636 ?auto_27668 ) ( CLEAR ?auto_27636 ) ( not ( = ?auto_27635 ?auto_27636 ) ) ( not ( = ?auto_27635 ?auto_27668 ) ) ( not ( = ?auto_27636 ?auto_27668 ) ) ( IS-CRATE ?auto_27635 ) ( AVAILABLE ?auto_27660 ) ( SURFACE-AT ?auto_27635 ?auto_27669 ) ( ON ?auto_27635 ?auto_27661 ) ( CLEAR ?auto_27635 ) ( not ( = ?auto_27634 ?auto_27635 ) ) ( not ( = ?auto_27634 ?auto_27661 ) ) ( not ( = ?auto_27635 ?auto_27661 ) ) ( IS-CRATE ?auto_27634 ) ( AVAILABLE ?auto_27648 ) ( SURFACE-AT ?auto_27634 ?auto_27649 ) ( ON ?auto_27634 ?auto_27663 ) ( CLEAR ?auto_27634 ) ( not ( = ?auto_27633 ?auto_27634 ) ) ( not ( = ?auto_27633 ?auto_27663 ) ) ( not ( = ?auto_27634 ?auto_27663 ) ) ( SURFACE-AT ?auto_27632 ?auto_27646 ) ( CLEAR ?auto_27632 ) ( IS-CRATE ?auto_27633 ) ( AVAILABLE ?auto_27650 ) ( AVAILABLE ?auto_27672 ) ( SURFACE-AT ?auto_27633 ?auto_27662 ) ( ON ?auto_27633 ?auto_27654 ) ( CLEAR ?auto_27633 ) ( TRUCK-AT ?auto_27647 ?auto_27646 ) ( not ( = ?auto_27632 ?auto_27633 ) ) ( not ( = ?auto_27632 ?auto_27654 ) ) ( not ( = ?auto_27633 ?auto_27654 ) ) ( not ( = ?auto_27632 ?auto_27634 ) ) ( not ( = ?auto_27632 ?auto_27663 ) ) ( not ( = ?auto_27634 ?auto_27654 ) ) ( not ( = ?auto_27649 ?auto_27662 ) ) ( not ( = ?auto_27648 ?auto_27672 ) ) ( not ( = ?auto_27663 ?auto_27654 ) ) ( not ( = ?auto_27632 ?auto_27635 ) ) ( not ( = ?auto_27632 ?auto_27661 ) ) ( not ( = ?auto_27633 ?auto_27635 ) ) ( not ( = ?auto_27633 ?auto_27661 ) ) ( not ( = ?auto_27635 ?auto_27663 ) ) ( not ( = ?auto_27635 ?auto_27654 ) ) ( not ( = ?auto_27669 ?auto_27649 ) ) ( not ( = ?auto_27669 ?auto_27662 ) ) ( not ( = ?auto_27660 ?auto_27648 ) ) ( not ( = ?auto_27660 ?auto_27672 ) ) ( not ( = ?auto_27661 ?auto_27663 ) ) ( not ( = ?auto_27661 ?auto_27654 ) ) ( not ( = ?auto_27632 ?auto_27636 ) ) ( not ( = ?auto_27632 ?auto_27668 ) ) ( not ( = ?auto_27633 ?auto_27636 ) ) ( not ( = ?auto_27633 ?auto_27668 ) ) ( not ( = ?auto_27634 ?auto_27636 ) ) ( not ( = ?auto_27634 ?auto_27668 ) ) ( not ( = ?auto_27636 ?auto_27661 ) ) ( not ( = ?auto_27636 ?auto_27663 ) ) ( not ( = ?auto_27636 ?auto_27654 ) ) ( not ( = ?auto_27653 ?auto_27669 ) ) ( not ( = ?auto_27653 ?auto_27649 ) ) ( not ( = ?auto_27653 ?auto_27662 ) ) ( not ( = ?auto_27652 ?auto_27660 ) ) ( not ( = ?auto_27652 ?auto_27648 ) ) ( not ( = ?auto_27652 ?auto_27672 ) ) ( not ( = ?auto_27668 ?auto_27661 ) ) ( not ( = ?auto_27668 ?auto_27663 ) ) ( not ( = ?auto_27668 ?auto_27654 ) ) ( not ( = ?auto_27632 ?auto_27637 ) ) ( not ( = ?auto_27632 ?auto_27665 ) ) ( not ( = ?auto_27633 ?auto_27637 ) ) ( not ( = ?auto_27633 ?auto_27665 ) ) ( not ( = ?auto_27634 ?auto_27637 ) ) ( not ( = ?auto_27634 ?auto_27665 ) ) ( not ( = ?auto_27635 ?auto_27637 ) ) ( not ( = ?auto_27635 ?auto_27665 ) ) ( not ( = ?auto_27637 ?auto_27668 ) ) ( not ( = ?auto_27637 ?auto_27661 ) ) ( not ( = ?auto_27637 ?auto_27663 ) ) ( not ( = ?auto_27637 ?auto_27654 ) ) ( not ( = ?auto_27665 ?auto_27668 ) ) ( not ( = ?auto_27665 ?auto_27661 ) ) ( not ( = ?auto_27665 ?auto_27663 ) ) ( not ( = ?auto_27665 ?auto_27654 ) ) ( not ( = ?auto_27632 ?auto_27638 ) ) ( not ( = ?auto_27632 ?auto_27664 ) ) ( not ( = ?auto_27633 ?auto_27638 ) ) ( not ( = ?auto_27633 ?auto_27664 ) ) ( not ( = ?auto_27634 ?auto_27638 ) ) ( not ( = ?auto_27634 ?auto_27664 ) ) ( not ( = ?auto_27635 ?auto_27638 ) ) ( not ( = ?auto_27635 ?auto_27664 ) ) ( not ( = ?auto_27636 ?auto_27638 ) ) ( not ( = ?auto_27636 ?auto_27664 ) ) ( not ( = ?auto_27638 ?auto_27665 ) ) ( not ( = ?auto_27638 ?auto_27668 ) ) ( not ( = ?auto_27638 ?auto_27661 ) ) ( not ( = ?auto_27638 ?auto_27663 ) ) ( not ( = ?auto_27638 ?auto_27654 ) ) ( not ( = ?auto_27671 ?auto_27653 ) ) ( not ( = ?auto_27671 ?auto_27669 ) ) ( not ( = ?auto_27671 ?auto_27649 ) ) ( not ( = ?auto_27671 ?auto_27662 ) ) ( not ( = ?auto_27675 ?auto_27652 ) ) ( not ( = ?auto_27675 ?auto_27660 ) ) ( not ( = ?auto_27675 ?auto_27648 ) ) ( not ( = ?auto_27675 ?auto_27672 ) ) ( not ( = ?auto_27664 ?auto_27665 ) ) ( not ( = ?auto_27664 ?auto_27668 ) ) ( not ( = ?auto_27664 ?auto_27661 ) ) ( not ( = ?auto_27664 ?auto_27663 ) ) ( not ( = ?auto_27664 ?auto_27654 ) ) ( not ( = ?auto_27632 ?auto_27639 ) ) ( not ( = ?auto_27632 ?auto_27657 ) ) ( not ( = ?auto_27633 ?auto_27639 ) ) ( not ( = ?auto_27633 ?auto_27657 ) ) ( not ( = ?auto_27634 ?auto_27639 ) ) ( not ( = ?auto_27634 ?auto_27657 ) ) ( not ( = ?auto_27635 ?auto_27639 ) ) ( not ( = ?auto_27635 ?auto_27657 ) ) ( not ( = ?auto_27636 ?auto_27639 ) ) ( not ( = ?auto_27636 ?auto_27657 ) ) ( not ( = ?auto_27637 ?auto_27639 ) ) ( not ( = ?auto_27637 ?auto_27657 ) ) ( not ( = ?auto_27639 ?auto_27664 ) ) ( not ( = ?auto_27639 ?auto_27665 ) ) ( not ( = ?auto_27639 ?auto_27668 ) ) ( not ( = ?auto_27639 ?auto_27661 ) ) ( not ( = ?auto_27639 ?auto_27663 ) ) ( not ( = ?auto_27639 ?auto_27654 ) ) ( not ( = ?auto_27658 ?auto_27671 ) ) ( not ( = ?auto_27658 ?auto_27653 ) ) ( not ( = ?auto_27658 ?auto_27669 ) ) ( not ( = ?auto_27658 ?auto_27649 ) ) ( not ( = ?auto_27658 ?auto_27662 ) ) ( not ( = ?auto_27666 ?auto_27675 ) ) ( not ( = ?auto_27666 ?auto_27652 ) ) ( not ( = ?auto_27666 ?auto_27660 ) ) ( not ( = ?auto_27666 ?auto_27648 ) ) ( not ( = ?auto_27666 ?auto_27672 ) ) ( not ( = ?auto_27657 ?auto_27664 ) ) ( not ( = ?auto_27657 ?auto_27665 ) ) ( not ( = ?auto_27657 ?auto_27668 ) ) ( not ( = ?auto_27657 ?auto_27661 ) ) ( not ( = ?auto_27657 ?auto_27663 ) ) ( not ( = ?auto_27657 ?auto_27654 ) ) ( not ( = ?auto_27632 ?auto_27640 ) ) ( not ( = ?auto_27632 ?auto_27667 ) ) ( not ( = ?auto_27633 ?auto_27640 ) ) ( not ( = ?auto_27633 ?auto_27667 ) ) ( not ( = ?auto_27634 ?auto_27640 ) ) ( not ( = ?auto_27634 ?auto_27667 ) ) ( not ( = ?auto_27635 ?auto_27640 ) ) ( not ( = ?auto_27635 ?auto_27667 ) ) ( not ( = ?auto_27636 ?auto_27640 ) ) ( not ( = ?auto_27636 ?auto_27667 ) ) ( not ( = ?auto_27637 ?auto_27640 ) ) ( not ( = ?auto_27637 ?auto_27667 ) ) ( not ( = ?auto_27638 ?auto_27640 ) ) ( not ( = ?auto_27638 ?auto_27667 ) ) ( not ( = ?auto_27640 ?auto_27657 ) ) ( not ( = ?auto_27640 ?auto_27664 ) ) ( not ( = ?auto_27640 ?auto_27665 ) ) ( not ( = ?auto_27640 ?auto_27668 ) ) ( not ( = ?auto_27640 ?auto_27661 ) ) ( not ( = ?auto_27640 ?auto_27663 ) ) ( not ( = ?auto_27640 ?auto_27654 ) ) ( not ( = ?auto_27667 ?auto_27657 ) ) ( not ( = ?auto_27667 ?auto_27664 ) ) ( not ( = ?auto_27667 ?auto_27665 ) ) ( not ( = ?auto_27667 ?auto_27668 ) ) ( not ( = ?auto_27667 ?auto_27661 ) ) ( not ( = ?auto_27667 ?auto_27663 ) ) ( not ( = ?auto_27667 ?auto_27654 ) ) ( not ( = ?auto_27632 ?auto_27641 ) ) ( not ( = ?auto_27632 ?auto_27659 ) ) ( not ( = ?auto_27633 ?auto_27641 ) ) ( not ( = ?auto_27633 ?auto_27659 ) ) ( not ( = ?auto_27634 ?auto_27641 ) ) ( not ( = ?auto_27634 ?auto_27659 ) ) ( not ( = ?auto_27635 ?auto_27641 ) ) ( not ( = ?auto_27635 ?auto_27659 ) ) ( not ( = ?auto_27636 ?auto_27641 ) ) ( not ( = ?auto_27636 ?auto_27659 ) ) ( not ( = ?auto_27637 ?auto_27641 ) ) ( not ( = ?auto_27637 ?auto_27659 ) ) ( not ( = ?auto_27638 ?auto_27641 ) ) ( not ( = ?auto_27638 ?auto_27659 ) ) ( not ( = ?auto_27639 ?auto_27641 ) ) ( not ( = ?auto_27639 ?auto_27659 ) ) ( not ( = ?auto_27641 ?auto_27667 ) ) ( not ( = ?auto_27641 ?auto_27657 ) ) ( not ( = ?auto_27641 ?auto_27664 ) ) ( not ( = ?auto_27641 ?auto_27665 ) ) ( not ( = ?auto_27641 ?auto_27668 ) ) ( not ( = ?auto_27641 ?auto_27661 ) ) ( not ( = ?auto_27641 ?auto_27663 ) ) ( not ( = ?auto_27641 ?auto_27654 ) ) ( not ( = ?auto_27659 ?auto_27667 ) ) ( not ( = ?auto_27659 ?auto_27657 ) ) ( not ( = ?auto_27659 ?auto_27664 ) ) ( not ( = ?auto_27659 ?auto_27665 ) ) ( not ( = ?auto_27659 ?auto_27668 ) ) ( not ( = ?auto_27659 ?auto_27661 ) ) ( not ( = ?auto_27659 ?auto_27663 ) ) ( not ( = ?auto_27659 ?auto_27654 ) ) ( not ( = ?auto_27632 ?auto_27642 ) ) ( not ( = ?auto_27632 ?auto_27670 ) ) ( not ( = ?auto_27633 ?auto_27642 ) ) ( not ( = ?auto_27633 ?auto_27670 ) ) ( not ( = ?auto_27634 ?auto_27642 ) ) ( not ( = ?auto_27634 ?auto_27670 ) ) ( not ( = ?auto_27635 ?auto_27642 ) ) ( not ( = ?auto_27635 ?auto_27670 ) ) ( not ( = ?auto_27636 ?auto_27642 ) ) ( not ( = ?auto_27636 ?auto_27670 ) ) ( not ( = ?auto_27637 ?auto_27642 ) ) ( not ( = ?auto_27637 ?auto_27670 ) ) ( not ( = ?auto_27638 ?auto_27642 ) ) ( not ( = ?auto_27638 ?auto_27670 ) ) ( not ( = ?auto_27639 ?auto_27642 ) ) ( not ( = ?auto_27639 ?auto_27670 ) ) ( not ( = ?auto_27640 ?auto_27642 ) ) ( not ( = ?auto_27640 ?auto_27670 ) ) ( not ( = ?auto_27642 ?auto_27659 ) ) ( not ( = ?auto_27642 ?auto_27667 ) ) ( not ( = ?auto_27642 ?auto_27657 ) ) ( not ( = ?auto_27642 ?auto_27664 ) ) ( not ( = ?auto_27642 ?auto_27665 ) ) ( not ( = ?auto_27642 ?auto_27668 ) ) ( not ( = ?auto_27642 ?auto_27661 ) ) ( not ( = ?auto_27642 ?auto_27663 ) ) ( not ( = ?auto_27642 ?auto_27654 ) ) ( not ( = ?auto_27673 ?auto_27669 ) ) ( not ( = ?auto_27673 ?auto_27649 ) ) ( not ( = ?auto_27673 ?auto_27658 ) ) ( not ( = ?auto_27673 ?auto_27671 ) ) ( not ( = ?auto_27673 ?auto_27653 ) ) ( not ( = ?auto_27673 ?auto_27662 ) ) ( not ( = ?auto_27674 ?auto_27660 ) ) ( not ( = ?auto_27674 ?auto_27648 ) ) ( not ( = ?auto_27674 ?auto_27666 ) ) ( not ( = ?auto_27674 ?auto_27675 ) ) ( not ( = ?auto_27674 ?auto_27652 ) ) ( not ( = ?auto_27674 ?auto_27672 ) ) ( not ( = ?auto_27670 ?auto_27659 ) ) ( not ( = ?auto_27670 ?auto_27667 ) ) ( not ( = ?auto_27670 ?auto_27657 ) ) ( not ( = ?auto_27670 ?auto_27664 ) ) ( not ( = ?auto_27670 ?auto_27665 ) ) ( not ( = ?auto_27670 ?auto_27668 ) ) ( not ( = ?auto_27670 ?auto_27661 ) ) ( not ( = ?auto_27670 ?auto_27663 ) ) ( not ( = ?auto_27670 ?auto_27654 ) ) ( not ( = ?auto_27632 ?auto_27643 ) ) ( not ( = ?auto_27632 ?auto_27655 ) ) ( not ( = ?auto_27633 ?auto_27643 ) ) ( not ( = ?auto_27633 ?auto_27655 ) ) ( not ( = ?auto_27634 ?auto_27643 ) ) ( not ( = ?auto_27634 ?auto_27655 ) ) ( not ( = ?auto_27635 ?auto_27643 ) ) ( not ( = ?auto_27635 ?auto_27655 ) ) ( not ( = ?auto_27636 ?auto_27643 ) ) ( not ( = ?auto_27636 ?auto_27655 ) ) ( not ( = ?auto_27637 ?auto_27643 ) ) ( not ( = ?auto_27637 ?auto_27655 ) ) ( not ( = ?auto_27638 ?auto_27643 ) ) ( not ( = ?auto_27638 ?auto_27655 ) ) ( not ( = ?auto_27639 ?auto_27643 ) ) ( not ( = ?auto_27639 ?auto_27655 ) ) ( not ( = ?auto_27640 ?auto_27643 ) ) ( not ( = ?auto_27640 ?auto_27655 ) ) ( not ( = ?auto_27641 ?auto_27643 ) ) ( not ( = ?auto_27641 ?auto_27655 ) ) ( not ( = ?auto_27643 ?auto_27670 ) ) ( not ( = ?auto_27643 ?auto_27659 ) ) ( not ( = ?auto_27643 ?auto_27667 ) ) ( not ( = ?auto_27643 ?auto_27657 ) ) ( not ( = ?auto_27643 ?auto_27664 ) ) ( not ( = ?auto_27643 ?auto_27665 ) ) ( not ( = ?auto_27643 ?auto_27668 ) ) ( not ( = ?auto_27643 ?auto_27661 ) ) ( not ( = ?auto_27643 ?auto_27663 ) ) ( not ( = ?auto_27643 ?auto_27654 ) ) ( not ( = ?auto_27655 ?auto_27670 ) ) ( not ( = ?auto_27655 ?auto_27659 ) ) ( not ( = ?auto_27655 ?auto_27667 ) ) ( not ( = ?auto_27655 ?auto_27657 ) ) ( not ( = ?auto_27655 ?auto_27664 ) ) ( not ( = ?auto_27655 ?auto_27665 ) ) ( not ( = ?auto_27655 ?auto_27668 ) ) ( not ( = ?auto_27655 ?auto_27661 ) ) ( not ( = ?auto_27655 ?auto_27663 ) ) ( not ( = ?auto_27655 ?auto_27654 ) ) ( not ( = ?auto_27632 ?auto_27644 ) ) ( not ( = ?auto_27632 ?auto_27656 ) ) ( not ( = ?auto_27633 ?auto_27644 ) ) ( not ( = ?auto_27633 ?auto_27656 ) ) ( not ( = ?auto_27634 ?auto_27644 ) ) ( not ( = ?auto_27634 ?auto_27656 ) ) ( not ( = ?auto_27635 ?auto_27644 ) ) ( not ( = ?auto_27635 ?auto_27656 ) ) ( not ( = ?auto_27636 ?auto_27644 ) ) ( not ( = ?auto_27636 ?auto_27656 ) ) ( not ( = ?auto_27637 ?auto_27644 ) ) ( not ( = ?auto_27637 ?auto_27656 ) ) ( not ( = ?auto_27638 ?auto_27644 ) ) ( not ( = ?auto_27638 ?auto_27656 ) ) ( not ( = ?auto_27639 ?auto_27644 ) ) ( not ( = ?auto_27639 ?auto_27656 ) ) ( not ( = ?auto_27640 ?auto_27644 ) ) ( not ( = ?auto_27640 ?auto_27656 ) ) ( not ( = ?auto_27641 ?auto_27644 ) ) ( not ( = ?auto_27641 ?auto_27656 ) ) ( not ( = ?auto_27642 ?auto_27644 ) ) ( not ( = ?auto_27642 ?auto_27656 ) ) ( not ( = ?auto_27644 ?auto_27655 ) ) ( not ( = ?auto_27644 ?auto_27670 ) ) ( not ( = ?auto_27644 ?auto_27659 ) ) ( not ( = ?auto_27644 ?auto_27667 ) ) ( not ( = ?auto_27644 ?auto_27657 ) ) ( not ( = ?auto_27644 ?auto_27664 ) ) ( not ( = ?auto_27644 ?auto_27665 ) ) ( not ( = ?auto_27644 ?auto_27668 ) ) ( not ( = ?auto_27644 ?auto_27661 ) ) ( not ( = ?auto_27644 ?auto_27663 ) ) ( not ( = ?auto_27644 ?auto_27654 ) ) ( not ( = ?auto_27656 ?auto_27655 ) ) ( not ( = ?auto_27656 ?auto_27670 ) ) ( not ( = ?auto_27656 ?auto_27659 ) ) ( not ( = ?auto_27656 ?auto_27667 ) ) ( not ( = ?auto_27656 ?auto_27657 ) ) ( not ( = ?auto_27656 ?auto_27664 ) ) ( not ( = ?auto_27656 ?auto_27665 ) ) ( not ( = ?auto_27656 ?auto_27668 ) ) ( not ( = ?auto_27656 ?auto_27661 ) ) ( not ( = ?auto_27656 ?auto_27663 ) ) ( not ( = ?auto_27656 ?auto_27654 ) ) ( not ( = ?auto_27632 ?auto_27645 ) ) ( not ( = ?auto_27632 ?auto_27651 ) ) ( not ( = ?auto_27633 ?auto_27645 ) ) ( not ( = ?auto_27633 ?auto_27651 ) ) ( not ( = ?auto_27634 ?auto_27645 ) ) ( not ( = ?auto_27634 ?auto_27651 ) ) ( not ( = ?auto_27635 ?auto_27645 ) ) ( not ( = ?auto_27635 ?auto_27651 ) ) ( not ( = ?auto_27636 ?auto_27645 ) ) ( not ( = ?auto_27636 ?auto_27651 ) ) ( not ( = ?auto_27637 ?auto_27645 ) ) ( not ( = ?auto_27637 ?auto_27651 ) ) ( not ( = ?auto_27638 ?auto_27645 ) ) ( not ( = ?auto_27638 ?auto_27651 ) ) ( not ( = ?auto_27639 ?auto_27645 ) ) ( not ( = ?auto_27639 ?auto_27651 ) ) ( not ( = ?auto_27640 ?auto_27645 ) ) ( not ( = ?auto_27640 ?auto_27651 ) ) ( not ( = ?auto_27641 ?auto_27645 ) ) ( not ( = ?auto_27641 ?auto_27651 ) ) ( not ( = ?auto_27642 ?auto_27645 ) ) ( not ( = ?auto_27642 ?auto_27651 ) ) ( not ( = ?auto_27643 ?auto_27645 ) ) ( not ( = ?auto_27643 ?auto_27651 ) ) ( not ( = ?auto_27645 ?auto_27656 ) ) ( not ( = ?auto_27645 ?auto_27655 ) ) ( not ( = ?auto_27645 ?auto_27670 ) ) ( not ( = ?auto_27645 ?auto_27659 ) ) ( not ( = ?auto_27645 ?auto_27667 ) ) ( not ( = ?auto_27645 ?auto_27657 ) ) ( not ( = ?auto_27645 ?auto_27664 ) ) ( not ( = ?auto_27645 ?auto_27665 ) ) ( not ( = ?auto_27645 ?auto_27668 ) ) ( not ( = ?auto_27645 ?auto_27661 ) ) ( not ( = ?auto_27645 ?auto_27663 ) ) ( not ( = ?auto_27645 ?auto_27654 ) ) ( not ( = ?auto_27651 ?auto_27656 ) ) ( not ( = ?auto_27651 ?auto_27655 ) ) ( not ( = ?auto_27651 ?auto_27670 ) ) ( not ( = ?auto_27651 ?auto_27659 ) ) ( not ( = ?auto_27651 ?auto_27667 ) ) ( not ( = ?auto_27651 ?auto_27657 ) ) ( not ( = ?auto_27651 ?auto_27664 ) ) ( not ( = ?auto_27651 ?auto_27665 ) ) ( not ( = ?auto_27651 ?auto_27668 ) ) ( not ( = ?auto_27651 ?auto_27661 ) ) ( not ( = ?auto_27651 ?auto_27663 ) ) ( not ( = ?auto_27651 ?auto_27654 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_27632 ?auto_27633 ?auto_27634 ?auto_27635 ?auto_27636 ?auto_27637 ?auto_27638 ?auto_27639 ?auto_27640 ?auto_27641 ?auto_27642 ?auto_27643 ?auto_27644 )
      ( MAKE-1CRATE ?auto_27644 ?auto_27645 )
      ( MAKE-13CRATE-VERIFY ?auto_27632 ?auto_27633 ?auto_27634 ?auto_27635 ?auto_27636 ?auto_27637 ?auto_27638 ?auto_27639 ?auto_27640 ?auto_27641 ?auto_27642 ?auto_27643 ?auto_27644 ?auto_27645 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_27701 - SURFACE
      ?auto_27702 - SURFACE
      ?auto_27703 - SURFACE
      ?auto_27704 - SURFACE
      ?auto_27705 - SURFACE
      ?auto_27706 - SURFACE
      ?auto_27707 - SURFACE
      ?auto_27708 - SURFACE
      ?auto_27709 - SURFACE
      ?auto_27710 - SURFACE
      ?auto_27711 - SURFACE
      ?auto_27712 - SURFACE
      ?auto_27713 - SURFACE
      ?auto_27715 - SURFACE
      ?auto_27714 - SURFACE
    )
    :vars
    (
      ?auto_27716 - HOIST
      ?auto_27717 - PLACE
      ?auto_27720 - PLACE
      ?auto_27719 - HOIST
      ?auto_27718 - SURFACE
      ?auto_27728 - PLACE
      ?auto_27725 - HOIST
      ?auto_27743 - SURFACE
      ?auto_27736 - SURFACE
      ?auto_27745 - PLACE
      ?auto_27723 - HOIST
      ?auto_27730 - SURFACE
      ?auto_27734 - PLACE
      ?auto_27726 - HOIST
      ?auto_27727 - SURFACE
      ?auto_27741 - PLACE
      ?auto_27744 - HOIST
      ?auto_27731 - SURFACE
      ?auto_27722 - SURFACE
      ?auto_27732 - SURFACE
      ?auto_27740 - PLACE
      ?auto_27738 - HOIST
      ?auto_27735 - SURFACE
      ?auto_27733 - PLACE
      ?auto_27724 - HOIST
      ?auto_27737 - SURFACE
      ?auto_27742 - SURFACE
      ?auto_27739 - SURFACE
      ?auto_27729 - SURFACE
      ?auto_27746 - SURFACE
      ?auto_27721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27716 ?auto_27717 ) ( IS-CRATE ?auto_27714 ) ( not ( = ?auto_27720 ?auto_27717 ) ) ( HOIST-AT ?auto_27719 ?auto_27720 ) ( SURFACE-AT ?auto_27714 ?auto_27720 ) ( ON ?auto_27714 ?auto_27718 ) ( CLEAR ?auto_27714 ) ( not ( = ?auto_27715 ?auto_27714 ) ) ( not ( = ?auto_27715 ?auto_27718 ) ) ( not ( = ?auto_27714 ?auto_27718 ) ) ( not ( = ?auto_27716 ?auto_27719 ) ) ( IS-CRATE ?auto_27715 ) ( not ( = ?auto_27728 ?auto_27717 ) ) ( HOIST-AT ?auto_27725 ?auto_27728 ) ( SURFACE-AT ?auto_27715 ?auto_27728 ) ( ON ?auto_27715 ?auto_27743 ) ( CLEAR ?auto_27715 ) ( not ( = ?auto_27713 ?auto_27715 ) ) ( not ( = ?auto_27713 ?auto_27743 ) ) ( not ( = ?auto_27715 ?auto_27743 ) ) ( not ( = ?auto_27716 ?auto_27725 ) ) ( IS-CRATE ?auto_27713 ) ( SURFACE-AT ?auto_27713 ?auto_27728 ) ( ON ?auto_27713 ?auto_27736 ) ( CLEAR ?auto_27713 ) ( not ( = ?auto_27712 ?auto_27713 ) ) ( not ( = ?auto_27712 ?auto_27736 ) ) ( not ( = ?auto_27713 ?auto_27736 ) ) ( IS-CRATE ?auto_27712 ) ( not ( = ?auto_27745 ?auto_27717 ) ) ( HOIST-AT ?auto_27723 ?auto_27745 ) ( SURFACE-AT ?auto_27712 ?auto_27745 ) ( ON ?auto_27712 ?auto_27730 ) ( CLEAR ?auto_27712 ) ( not ( = ?auto_27711 ?auto_27712 ) ) ( not ( = ?auto_27711 ?auto_27730 ) ) ( not ( = ?auto_27712 ?auto_27730 ) ) ( not ( = ?auto_27716 ?auto_27723 ) ) ( IS-CRATE ?auto_27711 ) ( not ( = ?auto_27734 ?auto_27717 ) ) ( HOIST-AT ?auto_27726 ?auto_27734 ) ( AVAILABLE ?auto_27726 ) ( SURFACE-AT ?auto_27711 ?auto_27734 ) ( ON ?auto_27711 ?auto_27727 ) ( CLEAR ?auto_27711 ) ( not ( = ?auto_27710 ?auto_27711 ) ) ( not ( = ?auto_27710 ?auto_27727 ) ) ( not ( = ?auto_27711 ?auto_27727 ) ) ( not ( = ?auto_27716 ?auto_27726 ) ) ( IS-CRATE ?auto_27710 ) ( not ( = ?auto_27741 ?auto_27717 ) ) ( HOIST-AT ?auto_27744 ?auto_27741 ) ( SURFACE-AT ?auto_27710 ?auto_27741 ) ( ON ?auto_27710 ?auto_27731 ) ( CLEAR ?auto_27710 ) ( not ( = ?auto_27709 ?auto_27710 ) ) ( not ( = ?auto_27709 ?auto_27731 ) ) ( not ( = ?auto_27710 ?auto_27731 ) ) ( not ( = ?auto_27716 ?auto_27744 ) ) ( IS-CRATE ?auto_27709 ) ( SURFACE-AT ?auto_27709 ?auto_27728 ) ( ON ?auto_27709 ?auto_27722 ) ( CLEAR ?auto_27709 ) ( not ( = ?auto_27708 ?auto_27709 ) ) ( not ( = ?auto_27708 ?auto_27722 ) ) ( not ( = ?auto_27709 ?auto_27722 ) ) ( IS-CRATE ?auto_27708 ) ( AVAILABLE ?auto_27719 ) ( SURFACE-AT ?auto_27708 ?auto_27720 ) ( ON ?auto_27708 ?auto_27732 ) ( CLEAR ?auto_27708 ) ( not ( = ?auto_27707 ?auto_27708 ) ) ( not ( = ?auto_27707 ?auto_27732 ) ) ( not ( = ?auto_27708 ?auto_27732 ) ) ( IS-CRATE ?auto_27707 ) ( not ( = ?auto_27740 ?auto_27717 ) ) ( HOIST-AT ?auto_27738 ?auto_27740 ) ( AVAILABLE ?auto_27738 ) ( SURFACE-AT ?auto_27707 ?auto_27740 ) ( ON ?auto_27707 ?auto_27735 ) ( CLEAR ?auto_27707 ) ( not ( = ?auto_27706 ?auto_27707 ) ) ( not ( = ?auto_27706 ?auto_27735 ) ) ( not ( = ?auto_27707 ?auto_27735 ) ) ( not ( = ?auto_27716 ?auto_27738 ) ) ( IS-CRATE ?auto_27706 ) ( not ( = ?auto_27733 ?auto_27717 ) ) ( HOIST-AT ?auto_27724 ?auto_27733 ) ( SURFACE-AT ?auto_27706 ?auto_27733 ) ( ON ?auto_27706 ?auto_27737 ) ( CLEAR ?auto_27706 ) ( not ( = ?auto_27705 ?auto_27706 ) ) ( not ( = ?auto_27705 ?auto_27737 ) ) ( not ( = ?auto_27706 ?auto_27737 ) ) ( not ( = ?auto_27716 ?auto_27724 ) ) ( IS-CRATE ?auto_27705 ) ( AVAILABLE ?auto_27724 ) ( SURFACE-AT ?auto_27705 ?auto_27733 ) ( ON ?auto_27705 ?auto_27742 ) ( CLEAR ?auto_27705 ) ( not ( = ?auto_27704 ?auto_27705 ) ) ( not ( = ?auto_27704 ?auto_27742 ) ) ( not ( = ?auto_27705 ?auto_27742 ) ) ( IS-CRATE ?auto_27704 ) ( AVAILABLE ?auto_27744 ) ( SURFACE-AT ?auto_27704 ?auto_27741 ) ( ON ?auto_27704 ?auto_27739 ) ( CLEAR ?auto_27704 ) ( not ( = ?auto_27703 ?auto_27704 ) ) ( not ( = ?auto_27703 ?auto_27739 ) ) ( not ( = ?auto_27704 ?auto_27739 ) ) ( IS-CRATE ?auto_27703 ) ( AVAILABLE ?auto_27725 ) ( SURFACE-AT ?auto_27703 ?auto_27728 ) ( ON ?auto_27703 ?auto_27729 ) ( CLEAR ?auto_27703 ) ( not ( = ?auto_27702 ?auto_27703 ) ) ( not ( = ?auto_27702 ?auto_27729 ) ) ( not ( = ?auto_27703 ?auto_27729 ) ) ( SURFACE-AT ?auto_27701 ?auto_27717 ) ( CLEAR ?auto_27701 ) ( IS-CRATE ?auto_27702 ) ( AVAILABLE ?auto_27716 ) ( AVAILABLE ?auto_27723 ) ( SURFACE-AT ?auto_27702 ?auto_27745 ) ( ON ?auto_27702 ?auto_27746 ) ( CLEAR ?auto_27702 ) ( TRUCK-AT ?auto_27721 ?auto_27717 ) ( not ( = ?auto_27701 ?auto_27702 ) ) ( not ( = ?auto_27701 ?auto_27746 ) ) ( not ( = ?auto_27702 ?auto_27746 ) ) ( not ( = ?auto_27701 ?auto_27703 ) ) ( not ( = ?auto_27701 ?auto_27729 ) ) ( not ( = ?auto_27703 ?auto_27746 ) ) ( not ( = ?auto_27728 ?auto_27745 ) ) ( not ( = ?auto_27725 ?auto_27723 ) ) ( not ( = ?auto_27729 ?auto_27746 ) ) ( not ( = ?auto_27701 ?auto_27704 ) ) ( not ( = ?auto_27701 ?auto_27739 ) ) ( not ( = ?auto_27702 ?auto_27704 ) ) ( not ( = ?auto_27702 ?auto_27739 ) ) ( not ( = ?auto_27704 ?auto_27729 ) ) ( not ( = ?auto_27704 ?auto_27746 ) ) ( not ( = ?auto_27741 ?auto_27728 ) ) ( not ( = ?auto_27741 ?auto_27745 ) ) ( not ( = ?auto_27744 ?auto_27725 ) ) ( not ( = ?auto_27744 ?auto_27723 ) ) ( not ( = ?auto_27739 ?auto_27729 ) ) ( not ( = ?auto_27739 ?auto_27746 ) ) ( not ( = ?auto_27701 ?auto_27705 ) ) ( not ( = ?auto_27701 ?auto_27742 ) ) ( not ( = ?auto_27702 ?auto_27705 ) ) ( not ( = ?auto_27702 ?auto_27742 ) ) ( not ( = ?auto_27703 ?auto_27705 ) ) ( not ( = ?auto_27703 ?auto_27742 ) ) ( not ( = ?auto_27705 ?auto_27739 ) ) ( not ( = ?auto_27705 ?auto_27729 ) ) ( not ( = ?auto_27705 ?auto_27746 ) ) ( not ( = ?auto_27733 ?auto_27741 ) ) ( not ( = ?auto_27733 ?auto_27728 ) ) ( not ( = ?auto_27733 ?auto_27745 ) ) ( not ( = ?auto_27724 ?auto_27744 ) ) ( not ( = ?auto_27724 ?auto_27725 ) ) ( not ( = ?auto_27724 ?auto_27723 ) ) ( not ( = ?auto_27742 ?auto_27739 ) ) ( not ( = ?auto_27742 ?auto_27729 ) ) ( not ( = ?auto_27742 ?auto_27746 ) ) ( not ( = ?auto_27701 ?auto_27706 ) ) ( not ( = ?auto_27701 ?auto_27737 ) ) ( not ( = ?auto_27702 ?auto_27706 ) ) ( not ( = ?auto_27702 ?auto_27737 ) ) ( not ( = ?auto_27703 ?auto_27706 ) ) ( not ( = ?auto_27703 ?auto_27737 ) ) ( not ( = ?auto_27704 ?auto_27706 ) ) ( not ( = ?auto_27704 ?auto_27737 ) ) ( not ( = ?auto_27706 ?auto_27742 ) ) ( not ( = ?auto_27706 ?auto_27739 ) ) ( not ( = ?auto_27706 ?auto_27729 ) ) ( not ( = ?auto_27706 ?auto_27746 ) ) ( not ( = ?auto_27737 ?auto_27742 ) ) ( not ( = ?auto_27737 ?auto_27739 ) ) ( not ( = ?auto_27737 ?auto_27729 ) ) ( not ( = ?auto_27737 ?auto_27746 ) ) ( not ( = ?auto_27701 ?auto_27707 ) ) ( not ( = ?auto_27701 ?auto_27735 ) ) ( not ( = ?auto_27702 ?auto_27707 ) ) ( not ( = ?auto_27702 ?auto_27735 ) ) ( not ( = ?auto_27703 ?auto_27707 ) ) ( not ( = ?auto_27703 ?auto_27735 ) ) ( not ( = ?auto_27704 ?auto_27707 ) ) ( not ( = ?auto_27704 ?auto_27735 ) ) ( not ( = ?auto_27705 ?auto_27707 ) ) ( not ( = ?auto_27705 ?auto_27735 ) ) ( not ( = ?auto_27707 ?auto_27737 ) ) ( not ( = ?auto_27707 ?auto_27742 ) ) ( not ( = ?auto_27707 ?auto_27739 ) ) ( not ( = ?auto_27707 ?auto_27729 ) ) ( not ( = ?auto_27707 ?auto_27746 ) ) ( not ( = ?auto_27740 ?auto_27733 ) ) ( not ( = ?auto_27740 ?auto_27741 ) ) ( not ( = ?auto_27740 ?auto_27728 ) ) ( not ( = ?auto_27740 ?auto_27745 ) ) ( not ( = ?auto_27738 ?auto_27724 ) ) ( not ( = ?auto_27738 ?auto_27744 ) ) ( not ( = ?auto_27738 ?auto_27725 ) ) ( not ( = ?auto_27738 ?auto_27723 ) ) ( not ( = ?auto_27735 ?auto_27737 ) ) ( not ( = ?auto_27735 ?auto_27742 ) ) ( not ( = ?auto_27735 ?auto_27739 ) ) ( not ( = ?auto_27735 ?auto_27729 ) ) ( not ( = ?auto_27735 ?auto_27746 ) ) ( not ( = ?auto_27701 ?auto_27708 ) ) ( not ( = ?auto_27701 ?auto_27732 ) ) ( not ( = ?auto_27702 ?auto_27708 ) ) ( not ( = ?auto_27702 ?auto_27732 ) ) ( not ( = ?auto_27703 ?auto_27708 ) ) ( not ( = ?auto_27703 ?auto_27732 ) ) ( not ( = ?auto_27704 ?auto_27708 ) ) ( not ( = ?auto_27704 ?auto_27732 ) ) ( not ( = ?auto_27705 ?auto_27708 ) ) ( not ( = ?auto_27705 ?auto_27732 ) ) ( not ( = ?auto_27706 ?auto_27708 ) ) ( not ( = ?auto_27706 ?auto_27732 ) ) ( not ( = ?auto_27708 ?auto_27735 ) ) ( not ( = ?auto_27708 ?auto_27737 ) ) ( not ( = ?auto_27708 ?auto_27742 ) ) ( not ( = ?auto_27708 ?auto_27739 ) ) ( not ( = ?auto_27708 ?auto_27729 ) ) ( not ( = ?auto_27708 ?auto_27746 ) ) ( not ( = ?auto_27720 ?auto_27740 ) ) ( not ( = ?auto_27720 ?auto_27733 ) ) ( not ( = ?auto_27720 ?auto_27741 ) ) ( not ( = ?auto_27720 ?auto_27728 ) ) ( not ( = ?auto_27720 ?auto_27745 ) ) ( not ( = ?auto_27719 ?auto_27738 ) ) ( not ( = ?auto_27719 ?auto_27724 ) ) ( not ( = ?auto_27719 ?auto_27744 ) ) ( not ( = ?auto_27719 ?auto_27725 ) ) ( not ( = ?auto_27719 ?auto_27723 ) ) ( not ( = ?auto_27732 ?auto_27735 ) ) ( not ( = ?auto_27732 ?auto_27737 ) ) ( not ( = ?auto_27732 ?auto_27742 ) ) ( not ( = ?auto_27732 ?auto_27739 ) ) ( not ( = ?auto_27732 ?auto_27729 ) ) ( not ( = ?auto_27732 ?auto_27746 ) ) ( not ( = ?auto_27701 ?auto_27709 ) ) ( not ( = ?auto_27701 ?auto_27722 ) ) ( not ( = ?auto_27702 ?auto_27709 ) ) ( not ( = ?auto_27702 ?auto_27722 ) ) ( not ( = ?auto_27703 ?auto_27709 ) ) ( not ( = ?auto_27703 ?auto_27722 ) ) ( not ( = ?auto_27704 ?auto_27709 ) ) ( not ( = ?auto_27704 ?auto_27722 ) ) ( not ( = ?auto_27705 ?auto_27709 ) ) ( not ( = ?auto_27705 ?auto_27722 ) ) ( not ( = ?auto_27706 ?auto_27709 ) ) ( not ( = ?auto_27706 ?auto_27722 ) ) ( not ( = ?auto_27707 ?auto_27709 ) ) ( not ( = ?auto_27707 ?auto_27722 ) ) ( not ( = ?auto_27709 ?auto_27732 ) ) ( not ( = ?auto_27709 ?auto_27735 ) ) ( not ( = ?auto_27709 ?auto_27737 ) ) ( not ( = ?auto_27709 ?auto_27742 ) ) ( not ( = ?auto_27709 ?auto_27739 ) ) ( not ( = ?auto_27709 ?auto_27729 ) ) ( not ( = ?auto_27709 ?auto_27746 ) ) ( not ( = ?auto_27722 ?auto_27732 ) ) ( not ( = ?auto_27722 ?auto_27735 ) ) ( not ( = ?auto_27722 ?auto_27737 ) ) ( not ( = ?auto_27722 ?auto_27742 ) ) ( not ( = ?auto_27722 ?auto_27739 ) ) ( not ( = ?auto_27722 ?auto_27729 ) ) ( not ( = ?auto_27722 ?auto_27746 ) ) ( not ( = ?auto_27701 ?auto_27710 ) ) ( not ( = ?auto_27701 ?auto_27731 ) ) ( not ( = ?auto_27702 ?auto_27710 ) ) ( not ( = ?auto_27702 ?auto_27731 ) ) ( not ( = ?auto_27703 ?auto_27710 ) ) ( not ( = ?auto_27703 ?auto_27731 ) ) ( not ( = ?auto_27704 ?auto_27710 ) ) ( not ( = ?auto_27704 ?auto_27731 ) ) ( not ( = ?auto_27705 ?auto_27710 ) ) ( not ( = ?auto_27705 ?auto_27731 ) ) ( not ( = ?auto_27706 ?auto_27710 ) ) ( not ( = ?auto_27706 ?auto_27731 ) ) ( not ( = ?auto_27707 ?auto_27710 ) ) ( not ( = ?auto_27707 ?auto_27731 ) ) ( not ( = ?auto_27708 ?auto_27710 ) ) ( not ( = ?auto_27708 ?auto_27731 ) ) ( not ( = ?auto_27710 ?auto_27722 ) ) ( not ( = ?auto_27710 ?auto_27732 ) ) ( not ( = ?auto_27710 ?auto_27735 ) ) ( not ( = ?auto_27710 ?auto_27737 ) ) ( not ( = ?auto_27710 ?auto_27742 ) ) ( not ( = ?auto_27710 ?auto_27739 ) ) ( not ( = ?auto_27710 ?auto_27729 ) ) ( not ( = ?auto_27710 ?auto_27746 ) ) ( not ( = ?auto_27731 ?auto_27722 ) ) ( not ( = ?auto_27731 ?auto_27732 ) ) ( not ( = ?auto_27731 ?auto_27735 ) ) ( not ( = ?auto_27731 ?auto_27737 ) ) ( not ( = ?auto_27731 ?auto_27742 ) ) ( not ( = ?auto_27731 ?auto_27739 ) ) ( not ( = ?auto_27731 ?auto_27729 ) ) ( not ( = ?auto_27731 ?auto_27746 ) ) ( not ( = ?auto_27701 ?auto_27711 ) ) ( not ( = ?auto_27701 ?auto_27727 ) ) ( not ( = ?auto_27702 ?auto_27711 ) ) ( not ( = ?auto_27702 ?auto_27727 ) ) ( not ( = ?auto_27703 ?auto_27711 ) ) ( not ( = ?auto_27703 ?auto_27727 ) ) ( not ( = ?auto_27704 ?auto_27711 ) ) ( not ( = ?auto_27704 ?auto_27727 ) ) ( not ( = ?auto_27705 ?auto_27711 ) ) ( not ( = ?auto_27705 ?auto_27727 ) ) ( not ( = ?auto_27706 ?auto_27711 ) ) ( not ( = ?auto_27706 ?auto_27727 ) ) ( not ( = ?auto_27707 ?auto_27711 ) ) ( not ( = ?auto_27707 ?auto_27727 ) ) ( not ( = ?auto_27708 ?auto_27711 ) ) ( not ( = ?auto_27708 ?auto_27727 ) ) ( not ( = ?auto_27709 ?auto_27711 ) ) ( not ( = ?auto_27709 ?auto_27727 ) ) ( not ( = ?auto_27711 ?auto_27731 ) ) ( not ( = ?auto_27711 ?auto_27722 ) ) ( not ( = ?auto_27711 ?auto_27732 ) ) ( not ( = ?auto_27711 ?auto_27735 ) ) ( not ( = ?auto_27711 ?auto_27737 ) ) ( not ( = ?auto_27711 ?auto_27742 ) ) ( not ( = ?auto_27711 ?auto_27739 ) ) ( not ( = ?auto_27711 ?auto_27729 ) ) ( not ( = ?auto_27711 ?auto_27746 ) ) ( not ( = ?auto_27734 ?auto_27741 ) ) ( not ( = ?auto_27734 ?auto_27728 ) ) ( not ( = ?auto_27734 ?auto_27720 ) ) ( not ( = ?auto_27734 ?auto_27740 ) ) ( not ( = ?auto_27734 ?auto_27733 ) ) ( not ( = ?auto_27734 ?auto_27745 ) ) ( not ( = ?auto_27726 ?auto_27744 ) ) ( not ( = ?auto_27726 ?auto_27725 ) ) ( not ( = ?auto_27726 ?auto_27719 ) ) ( not ( = ?auto_27726 ?auto_27738 ) ) ( not ( = ?auto_27726 ?auto_27724 ) ) ( not ( = ?auto_27726 ?auto_27723 ) ) ( not ( = ?auto_27727 ?auto_27731 ) ) ( not ( = ?auto_27727 ?auto_27722 ) ) ( not ( = ?auto_27727 ?auto_27732 ) ) ( not ( = ?auto_27727 ?auto_27735 ) ) ( not ( = ?auto_27727 ?auto_27737 ) ) ( not ( = ?auto_27727 ?auto_27742 ) ) ( not ( = ?auto_27727 ?auto_27739 ) ) ( not ( = ?auto_27727 ?auto_27729 ) ) ( not ( = ?auto_27727 ?auto_27746 ) ) ( not ( = ?auto_27701 ?auto_27712 ) ) ( not ( = ?auto_27701 ?auto_27730 ) ) ( not ( = ?auto_27702 ?auto_27712 ) ) ( not ( = ?auto_27702 ?auto_27730 ) ) ( not ( = ?auto_27703 ?auto_27712 ) ) ( not ( = ?auto_27703 ?auto_27730 ) ) ( not ( = ?auto_27704 ?auto_27712 ) ) ( not ( = ?auto_27704 ?auto_27730 ) ) ( not ( = ?auto_27705 ?auto_27712 ) ) ( not ( = ?auto_27705 ?auto_27730 ) ) ( not ( = ?auto_27706 ?auto_27712 ) ) ( not ( = ?auto_27706 ?auto_27730 ) ) ( not ( = ?auto_27707 ?auto_27712 ) ) ( not ( = ?auto_27707 ?auto_27730 ) ) ( not ( = ?auto_27708 ?auto_27712 ) ) ( not ( = ?auto_27708 ?auto_27730 ) ) ( not ( = ?auto_27709 ?auto_27712 ) ) ( not ( = ?auto_27709 ?auto_27730 ) ) ( not ( = ?auto_27710 ?auto_27712 ) ) ( not ( = ?auto_27710 ?auto_27730 ) ) ( not ( = ?auto_27712 ?auto_27727 ) ) ( not ( = ?auto_27712 ?auto_27731 ) ) ( not ( = ?auto_27712 ?auto_27722 ) ) ( not ( = ?auto_27712 ?auto_27732 ) ) ( not ( = ?auto_27712 ?auto_27735 ) ) ( not ( = ?auto_27712 ?auto_27737 ) ) ( not ( = ?auto_27712 ?auto_27742 ) ) ( not ( = ?auto_27712 ?auto_27739 ) ) ( not ( = ?auto_27712 ?auto_27729 ) ) ( not ( = ?auto_27712 ?auto_27746 ) ) ( not ( = ?auto_27730 ?auto_27727 ) ) ( not ( = ?auto_27730 ?auto_27731 ) ) ( not ( = ?auto_27730 ?auto_27722 ) ) ( not ( = ?auto_27730 ?auto_27732 ) ) ( not ( = ?auto_27730 ?auto_27735 ) ) ( not ( = ?auto_27730 ?auto_27737 ) ) ( not ( = ?auto_27730 ?auto_27742 ) ) ( not ( = ?auto_27730 ?auto_27739 ) ) ( not ( = ?auto_27730 ?auto_27729 ) ) ( not ( = ?auto_27730 ?auto_27746 ) ) ( not ( = ?auto_27701 ?auto_27713 ) ) ( not ( = ?auto_27701 ?auto_27736 ) ) ( not ( = ?auto_27702 ?auto_27713 ) ) ( not ( = ?auto_27702 ?auto_27736 ) ) ( not ( = ?auto_27703 ?auto_27713 ) ) ( not ( = ?auto_27703 ?auto_27736 ) ) ( not ( = ?auto_27704 ?auto_27713 ) ) ( not ( = ?auto_27704 ?auto_27736 ) ) ( not ( = ?auto_27705 ?auto_27713 ) ) ( not ( = ?auto_27705 ?auto_27736 ) ) ( not ( = ?auto_27706 ?auto_27713 ) ) ( not ( = ?auto_27706 ?auto_27736 ) ) ( not ( = ?auto_27707 ?auto_27713 ) ) ( not ( = ?auto_27707 ?auto_27736 ) ) ( not ( = ?auto_27708 ?auto_27713 ) ) ( not ( = ?auto_27708 ?auto_27736 ) ) ( not ( = ?auto_27709 ?auto_27713 ) ) ( not ( = ?auto_27709 ?auto_27736 ) ) ( not ( = ?auto_27710 ?auto_27713 ) ) ( not ( = ?auto_27710 ?auto_27736 ) ) ( not ( = ?auto_27711 ?auto_27713 ) ) ( not ( = ?auto_27711 ?auto_27736 ) ) ( not ( = ?auto_27713 ?auto_27730 ) ) ( not ( = ?auto_27713 ?auto_27727 ) ) ( not ( = ?auto_27713 ?auto_27731 ) ) ( not ( = ?auto_27713 ?auto_27722 ) ) ( not ( = ?auto_27713 ?auto_27732 ) ) ( not ( = ?auto_27713 ?auto_27735 ) ) ( not ( = ?auto_27713 ?auto_27737 ) ) ( not ( = ?auto_27713 ?auto_27742 ) ) ( not ( = ?auto_27713 ?auto_27739 ) ) ( not ( = ?auto_27713 ?auto_27729 ) ) ( not ( = ?auto_27713 ?auto_27746 ) ) ( not ( = ?auto_27736 ?auto_27730 ) ) ( not ( = ?auto_27736 ?auto_27727 ) ) ( not ( = ?auto_27736 ?auto_27731 ) ) ( not ( = ?auto_27736 ?auto_27722 ) ) ( not ( = ?auto_27736 ?auto_27732 ) ) ( not ( = ?auto_27736 ?auto_27735 ) ) ( not ( = ?auto_27736 ?auto_27737 ) ) ( not ( = ?auto_27736 ?auto_27742 ) ) ( not ( = ?auto_27736 ?auto_27739 ) ) ( not ( = ?auto_27736 ?auto_27729 ) ) ( not ( = ?auto_27736 ?auto_27746 ) ) ( not ( = ?auto_27701 ?auto_27715 ) ) ( not ( = ?auto_27701 ?auto_27743 ) ) ( not ( = ?auto_27702 ?auto_27715 ) ) ( not ( = ?auto_27702 ?auto_27743 ) ) ( not ( = ?auto_27703 ?auto_27715 ) ) ( not ( = ?auto_27703 ?auto_27743 ) ) ( not ( = ?auto_27704 ?auto_27715 ) ) ( not ( = ?auto_27704 ?auto_27743 ) ) ( not ( = ?auto_27705 ?auto_27715 ) ) ( not ( = ?auto_27705 ?auto_27743 ) ) ( not ( = ?auto_27706 ?auto_27715 ) ) ( not ( = ?auto_27706 ?auto_27743 ) ) ( not ( = ?auto_27707 ?auto_27715 ) ) ( not ( = ?auto_27707 ?auto_27743 ) ) ( not ( = ?auto_27708 ?auto_27715 ) ) ( not ( = ?auto_27708 ?auto_27743 ) ) ( not ( = ?auto_27709 ?auto_27715 ) ) ( not ( = ?auto_27709 ?auto_27743 ) ) ( not ( = ?auto_27710 ?auto_27715 ) ) ( not ( = ?auto_27710 ?auto_27743 ) ) ( not ( = ?auto_27711 ?auto_27715 ) ) ( not ( = ?auto_27711 ?auto_27743 ) ) ( not ( = ?auto_27712 ?auto_27715 ) ) ( not ( = ?auto_27712 ?auto_27743 ) ) ( not ( = ?auto_27715 ?auto_27736 ) ) ( not ( = ?auto_27715 ?auto_27730 ) ) ( not ( = ?auto_27715 ?auto_27727 ) ) ( not ( = ?auto_27715 ?auto_27731 ) ) ( not ( = ?auto_27715 ?auto_27722 ) ) ( not ( = ?auto_27715 ?auto_27732 ) ) ( not ( = ?auto_27715 ?auto_27735 ) ) ( not ( = ?auto_27715 ?auto_27737 ) ) ( not ( = ?auto_27715 ?auto_27742 ) ) ( not ( = ?auto_27715 ?auto_27739 ) ) ( not ( = ?auto_27715 ?auto_27729 ) ) ( not ( = ?auto_27715 ?auto_27746 ) ) ( not ( = ?auto_27743 ?auto_27736 ) ) ( not ( = ?auto_27743 ?auto_27730 ) ) ( not ( = ?auto_27743 ?auto_27727 ) ) ( not ( = ?auto_27743 ?auto_27731 ) ) ( not ( = ?auto_27743 ?auto_27722 ) ) ( not ( = ?auto_27743 ?auto_27732 ) ) ( not ( = ?auto_27743 ?auto_27735 ) ) ( not ( = ?auto_27743 ?auto_27737 ) ) ( not ( = ?auto_27743 ?auto_27742 ) ) ( not ( = ?auto_27743 ?auto_27739 ) ) ( not ( = ?auto_27743 ?auto_27729 ) ) ( not ( = ?auto_27743 ?auto_27746 ) ) ( not ( = ?auto_27701 ?auto_27714 ) ) ( not ( = ?auto_27701 ?auto_27718 ) ) ( not ( = ?auto_27702 ?auto_27714 ) ) ( not ( = ?auto_27702 ?auto_27718 ) ) ( not ( = ?auto_27703 ?auto_27714 ) ) ( not ( = ?auto_27703 ?auto_27718 ) ) ( not ( = ?auto_27704 ?auto_27714 ) ) ( not ( = ?auto_27704 ?auto_27718 ) ) ( not ( = ?auto_27705 ?auto_27714 ) ) ( not ( = ?auto_27705 ?auto_27718 ) ) ( not ( = ?auto_27706 ?auto_27714 ) ) ( not ( = ?auto_27706 ?auto_27718 ) ) ( not ( = ?auto_27707 ?auto_27714 ) ) ( not ( = ?auto_27707 ?auto_27718 ) ) ( not ( = ?auto_27708 ?auto_27714 ) ) ( not ( = ?auto_27708 ?auto_27718 ) ) ( not ( = ?auto_27709 ?auto_27714 ) ) ( not ( = ?auto_27709 ?auto_27718 ) ) ( not ( = ?auto_27710 ?auto_27714 ) ) ( not ( = ?auto_27710 ?auto_27718 ) ) ( not ( = ?auto_27711 ?auto_27714 ) ) ( not ( = ?auto_27711 ?auto_27718 ) ) ( not ( = ?auto_27712 ?auto_27714 ) ) ( not ( = ?auto_27712 ?auto_27718 ) ) ( not ( = ?auto_27713 ?auto_27714 ) ) ( not ( = ?auto_27713 ?auto_27718 ) ) ( not ( = ?auto_27714 ?auto_27743 ) ) ( not ( = ?auto_27714 ?auto_27736 ) ) ( not ( = ?auto_27714 ?auto_27730 ) ) ( not ( = ?auto_27714 ?auto_27727 ) ) ( not ( = ?auto_27714 ?auto_27731 ) ) ( not ( = ?auto_27714 ?auto_27722 ) ) ( not ( = ?auto_27714 ?auto_27732 ) ) ( not ( = ?auto_27714 ?auto_27735 ) ) ( not ( = ?auto_27714 ?auto_27737 ) ) ( not ( = ?auto_27714 ?auto_27742 ) ) ( not ( = ?auto_27714 ?auto_27739 ) ) ( not ( = ?auto_27714 ?auto_27729 ) ) ( not ( = ?auto_27714 ?auto_27746 ) ) ( not ( = ?auto_27718 ?auto_27743 ) ) ( not ( = ?auto_27718 ?auto_27736 ) ) ( not ( = ?auto_27718 ?auto_27730 ) ) ( not ( = ?auto_27718 ?auto_27727 ) ) ( not ( = ?auto_27718 ?auto_27731 ) ) ( not ( = ?auto_27718 ?auto_27722 ) ) ( not ( = ?auto_27718 ?auto_27732 ) ) ( not ( = ?auto_27718 ?auto_27735 ) ) ( not ( = ?auto_27718 ?auto_27737 ) ) ( not ( = ?auto_27718 ?auto_27742 ) ) ( not ( = ?auto_27718 ?auto_27739 ) ) ( not ( = ?auto_27718 ?auto_27729 ) ) ( not ( = ?auto_27718 ?auto_27746 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_27701 ?auto_27702 ?auto_27703 ?auto_27704 ?auto_27705 ?auto_27706 ?auto_27707 ?auto_27708 ?auto_27709 ?auto_27710 ?auto_27711 ?auto_27712 ?auto_27713 ?auto_27715 )
      ( MAKE-1CRATE ?auto_27715 ?auto_27714 )
      ( MAKE-14CRATE-VERIFY ?auto_27701 ?auto_27702 ?auto_27703 ?auto_27704 ?auto_27705 ?auto_27706 ?auto_27707 ?auto_27708 ?auto_27709 ?auto_27710 ?auto_27711 ?auto_27712 ?auto_27713 ?auto_27715 ?auto_27714 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_27773 - SURFACE
      ?auto_27774 - SURFACE
      ?auto_27775 - SURFACE
      ?auto_27776 - SURFACE
      ?auto_27777 - SURFACE
      ?auto_27778 - SURFACE
      ?auto_27779 - SURFACE
      ?auto_27780 - SURFACE
      ?auto_27781 - SURFACE
      ?auto_27782 - SURFACE
      ?auto_27783 - SURFACE
      ?auto_27784 - SURFACE
      ?auto_27785 - SURFACE
      ?auto_27787 - SURFACE
      ?auto_27786 - SURFACE
      ?auto_27788 - SURFACE
    )
    :vars
    (
      ?auto_27792 - HOIST
      ?auto_27789 - PLACE
      ?auto_27790 - PLACE
      ?auto_27794 - HOIST
      ?auto_27793 - SURFACE
      ?auto_27809 - PLACE
      ?auto_27811 - HOIST
      ?auto_27799 - SURFACE
      ?auto_27807 - PLACE
      ?auto_27820 - HOIST
      ?auto_27816 - SURFACE
      ?auto_27814 - SURFACE
      ?auto_27808 - SURFACE
      ?auto_27797 - PLACE
      ?auto_27817 - HOIST
      ?auto_27815 - SURFACE
      ?auto_27802 - PLACE
      ?auto_27819 - HOIST
      ?auto_27806 - SURFACE
      ?auto_27798 - SURFACE
      ?auto_27810 - SURFACE
      ?auto_27795 - PLACE
      ?auto_27800 - HOIST
      ?auto_27813 - SURFACE
      ?auto_27818 - PLACE
      ?auto_27805 - HOIST
      ?auto_27796 - SURFACE
      ?auto_27804 - SURFACE
      ?auto_27812 - SURFACE
      ?auto_27801 - SURFACE
      ?auto_27803 - SURFACE
      ?auto_27791 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27792 ?auto_27789 ) ( IS-CRATE ?auto_27788 ) ( not ( = ?auto_27790 ?auto_27789 ) ) ( HOIST-AT ?auto_27794 ?auto_27790 ) ( SURFACE-AT ?auto_27788 ?auto_27790 ) ( ON ?auto_27788 ?auto_27793 ) ( CLEAR ?auto_27788 ) ( not ( = ?auto_27786 ?auto_27788 ) ) ( not ( = ?auto_27786 ?auto_27793 ) ) ( not ( = ?auto_27788 ?auto_27793 ) ) ( not ( = ?auto_27792 ?auto_27794 ) ) ( IS-CRATE ?auto_27786 ) ( not ( = ?auto_27809 ?auto_27789 ) ) ( HOIST-AT ?auto_27811 ?auto_27809 ) ( SURFACE-AT ?auto_27786 ?auto_27809 ) ( ON ?auto_27786 ?auto_27799 ) ( CLEAR ?auto_27786 ) ( not ( = ?auto_27787 ?auto_27786 ) ) ( not ( = ?auto_27787 ?auto_27799 ) ) ( not ( = ?auto_27786 ?auto_27799 ) ) ( not ( = ?auto_27792 ?auto_27811 ) ) ( IS-CRATE ?auto_27787 ) ( not ( = ?auto_27807 ?auto_27789 ) ) ( HOIST-AT ?auto_27820 ?auto_27807 ) ( SURFACE-AT ?auto_27787 ?auto_27807 ) ( ON ?auto_27787 ?auto_27816 ) ( CLEAR ?auto_27787 ) ( not ( = ?auto_27785 ?auto_27787 ) ) ( not ( = ?auto_27785 ?auto_27816 ) ) ( not ( = ?auto_27787 ?auto_27816 ) ) ( not ( = ?auto_27792 ?auto_27820 ) ) ( IS-CRATE ?auto_27785 ) ( SURFACE-AT ?auto_27785 ?auto_27807 ) ( ON ?auto_27785 ?auto_27814 ) ( CLEAR ?auto_27785 ) ( not ( = ?auto_27784 ?auto_27785 ) ) ( not ( = ?auto_27784 ?auto_27814 ) ) ( not ( = ?auto_27785 ?auto_27814 ) ) ( IS-CRATE ?auto_27784 ) ( SURFACE-AT ?auto_27784 ?auto_27790 ) ( ON ?auto_27784 ?auto_27808 ) ( CLEAR ?auto_27784 ) ( not ( = ?auto_27783 ?auto_27784 ) ) ( not ( = ?auto_27783 ?auto_27808 ) ) ( not ( = ?auto_27784 ?auto_27808 ) ) ( IS-CRATE ?auto_27783 ) ( not ( = ?auto_27797 ?auto_27789 ) ) ( HOIST-AT ?auto_27817 ?auto_27797 ) ( AVAILABLE ?auto_27817 ) ( SURFACE-AT ?auto_27783 ?auto_27797 ) ( ON ?auto_27783 ?auto_27815 ) ( CLEAR ?auto_27783 ) ( not ( = ?auto_27782 ?auto_27783 ) ) ( not ( = ?auto_27782 ?auto_27815 ) ) ( not ( = ?auto_27783 ?auto_27815 ) ) ( not ( = ?auto_27792 ?auto_27817 ) ) ( IS-CRATE ?auto_27782 ) ( not ( = ?auto_27802 ?auto_27789 ) ) ( HOIST-AT ?auto_27819 ?auto_27802 ) ( SURFACE-AT ?auto_27782 ?auto_27802 ) ( ON ?auto_27782 ?auto_27806 ) ( CLEAR ?auto_27782 ) ( not ( = ?auto_27781 ?auto_27782 ) ) ( not ( = ?auto_27781 ?auto_27806 ) ) ( not ( = ?auto_27782 ?auto_27806 ) ) ( not ( = ?auto_27792 ?auto_27819 ) ) ( IS-CRATE ?auto_27781 ) ( SURFACE-AT ?auto_27781 ?auto_27807 ) ( ON ?auto_27781 ?auto_27798 ) ( CLEAR ?auto_27781 ) ( not ( = ?auto_27780 ?auto_27781 ) ) ( not ( = ?auto_27780 ?auto_27798 ) ) ( not ( = ?auto_27781 ?auto_27798 ) ) ( IS-CRATE ?auto_27780 ) ( AVAILABLE ?auto_27811 ) ( SURFACE-AT ?auto_27780 ?auto_27809 ) ( ON ?auto_27780 ?auto_27810 ) ( CLEAR ?auto_27780 ) ( not ( = ?auto_27779 ?auto_27780 ) ) ( not ( = ?auto_27779 ?auto_27810 ) ) ( not ( = ?auto_27780 ?auto_27810 ) ) ( IS-CRATE ?auto_27779 ) ( not ( = ?auto_27795 ?auto_27789 ) ) ( HOIST-AT ?auto_27800 ?auto_27795 ) ( AVAILABLE ?auto_27800 ) ( SURFACE-AT ?auto_27779 ?auto_27795 ) ( ON ?auto_27779 ?auto_27813 ) ( CLEAR ?auto_27779 ) ( not ( = ?auto_27778 ?auto_27779 ) ) ( not ( = ?auto_27778 ?auto_27813 ) ) ( not ( = ?auto_27779 ?auto_27813 ) ) ( not ( = ?auto_27792 ?auto_27800 ) ) ( IS-CRATE ?auto_27778 ) ( not ( = ?auto_27818 ?auto_27789 ) ) ( HOIST-AT ?auto_27805 ?auto_27818 ) ( SURFACE-AT ?auto_27778 ?auto_27818 ) ( ON ?auto_27778 ?auto_27796 ) ( CLEAR ?auto_27778 ) ( not ( = ?auto_27777 ?auto_27778 ) ) ( not ( = ?auto_27777 ?auto_27796 ) ) ( not ( = ?auto_27778 ?auto_27796 ) ) ( not ( = ?auto_27792 ?auto_27805 ) ) ( IS-CRATE ?auto_27777 ) ( AVAILABLE ?auto_27805 ) ( SURFACE-AT ?auto_27777 ?auto_27818 ) ( ON ?auto_27777 ?auto_27804 ) ( CLEAR ?auto_27777 ) ( not ( = ?auto_27776 ?auto_27777 ) ) ( not ( = ?auto_27776 ?auto_27804 ) ) ( not ( = ?auto_27777 ?auto_27804 ) ) ( IS-CRATE ?auto_27776 ) ( AVAILABLE ?auto_27819 ) ( SURFACE-AT ?auto_27776 ?auto_27802 ) ( ON ?auto_27776 ?auto_27812 ) ( CLEAR ?auto_27776 ) ( not ( = ?auto_27775 ?auto_27776 ) ) ( not ( = ?auto_27775 ?auto_27812 ) ) ( not ( = ?auto_27776 ?auto_27812 ) ) ( IS-CRATE ?auto_27775 ) ( AVAILABLE ?auto_27820 ) ( SURFACE-AT ?auto_27775 ?auto_27807 ) ( ON ?auto_27775 ?auto_27801 ) ( CLEAR ?auto_27775 ) ( not ( = ?auto_27774 ?auto_27775 ) ) ( not ( = ?auto_27774 ?auto_27801 ) ) ( not ( = ?auto_27775 ?auto_27801 ) ) ( SURFACE-AT ?auto_27773 ?auto_27789 ) ( CLEAR ?auto_27773 ) ( IS-CRATE ?auto_27774 ) ( AVAILABLE ?auto_27792 ) ( AVAILABLE ?auto_27794 ) ( SURFACE-AT ?auto_27774 ?auto_27790 ) ( ON ?auto_27774 ?auto_27803 ) ( CLEAR ?auto_27774 ) ( TRUCK-AT ?auto_27791 ?auto_27789 ) ( not ( = ?auto_27773 ?auto_27774 ) ) ( not ( = ?auto_27773 ?auto_27803 ) ) ( not ( = ?auto_27774 ?auto_27803 ) ) ( not ( = ?auto_27773 ?auto_27775 ) ) ( not ( = ?auto_27773 ?auto_27801 ) ) ( not ( = ?auto_27775 ?auto_27803 ) ) ( not ( = ?auto_27807 ?auto_27790 ) ) ( not ( = ?auto_27820 ?auto_27794 ) ) ( not ( = ?auto_27801 ?auto_27803 ) ) ( not ( = ?auto_27773 ?auto_27776 ) ) ( not ( = ?auto_27773 ?auto_27812 ) ) ( not ( = ?auto_27774 ?auto_27776 ) ) ( not ( = ?auto_27774 ?auto_27812 ) ) ( not ( = ?auto_27776 ?auto_27801 ) ) ( not ( = ?auto_27776 ?auto_27803 ) ) ( not ( = ?auto_27802 ?auto_27807 ) ) ( not ( = ?auto_27802 ?auto_27790 ) ) ( not ( = ?auto_27819 ?auto_27820 ) ) ( not ( = ?auto_27819 ?auto_27794 ) ) ( not ( = ?auto_27812 ?auto_27801 ) ) ( not ( = ?auto_27812 ?auto_27803 ) ) ( not ( = ?auto_27773 ?auto_27777 ) ) ( not ( = ?auto_27773 ?auto_27804 ) ) ( not ( = ?auto_27774 ?auto_27777 ) ) ( not ( = ?auto_27774 ?auto_27804 ) ) ( not ( = ?auto_27775 ?auto_27777 ) ) ( not ( = ?auto_27775 ?auto_27804 ) ) ( not ( = ?auto_27777 ?auto_27812 ) ) ( not ( = ?auto_27777 ?auto_27801 ) ) ( not ( = ?auto_27777 ?auto_27803 ) ) ( not ( = ?auto_27818 ?auto_27802 ) ) ( not ( = ?auto_27818 ?auto_27807 ) ) ( not ( = ?auto_27818 ?auto_27790 ) ) ( not ( = ?auto_27805 ?auto_27819 ) ) ( not ( = ?auto_27805 ?auto_27820 ) ) ( not ( = ?auto_27805 ?auto_27794 ) ) ( not ( = ?auto_27804 ?auto_27812 ) ) ( not ( = ?auto_27804 ?auto_27801 ) ) ( not ( = ?auto_27804 ?auto_27803 ) ) ( not ( = ?auto_27773 ?auto_27778 ) ) ( not ( = ?auto_27773 ?auto_27796 ) ) ( not ( = ?auto_27774 ?auto_27778 ) ) ( not ( = ?auto_27774 ?auto_27796 ) ) ( not ( = ?auto_27775 ?auto_27778 ) ) ( not ( = ?auto_27775 ?auto_27796 ) ) ( not ( = ?auto_27776 ?auto_27778 ) ) ( not ( = ?auto_27776 ?auto_27796 ) ) ( not ( = ?auto_27778 ?auto_27804 ) ) ( not ( = ?auto_27778 ?auto_27812 ) ) ( not ( = ?auto_27778 ?auto_27801 ) ) ( not ( = ?auto_27778 ?auto_27803 ) ) ( not ( = ?auto_27796 ?auto_27804 ) ) ( not ( = ?auto_27796 ?auto_27812 ) ) ( not ( = ?auto_27796 ?auto_27801 ) ) ( not ( = ?auto_27796 ?auto_27803 ) ) ( not ( = ?auto_27773 ?auto_27779 ) ) ( not ( = ?auto_27773 ?auto_27813 ) ) ( not ( = ?auto_27774 ?auto_27779 ) ) ( not ( = ?auto_27774 ?auto_27813 ) ) ( not ( = ?auto_27775 ?auto_27779 ) ) ( not ( = ?auto_27775 ?auto_27813 ) ) ( not ( = ?auto_27776 ?auto_27779 ) ) ( not ( = ?auto_27776 ?auto_27813 ) ) ( not ( = ?auto_27777 ?auto_27779 ) ) ( not ( = ?auto_27777 ?auto_27813 ) ) ( not ( = ?auto_27779 ?auto_27796 ) ) ( not ( = ?auto_27779 ?auto_27804 ) ) ( not ( = ?auto_27779 ?auto_27812 ) ) ( not ( = ?auto_27779 ?auto_27801 ) ) ( not ( = ?auto_27779 ?auto_27803 ) ) ( not ( = ?auto_27795 ?auto_27818 ) ) ( not ( = ?auto_27795 ?auto_27802 ) ) ( not ( = ?auto_27795 ?auto_27807 ) ) ( not ( = ?auto_27795 ?auto_27790 ) ) ( not ( = ?auto_27800 ?auto_27805 ) ) ( not ( = ?auto_27800 ?auto_27819 ) ) ( not ( = ?auto_27800 ?auto_27820 ) ) ( not ( = ?auto_27800 ?auto_27794 ) ) ( not ( = ?auto_27813 ?auto_27796 ) ) ( not ( = ?auto_27813 ?auto_27804 ) ) ( not ( = ?auto_27813 ?auto_27812 ) ) ( not ( = ?auto_27813 ?auto_27801 ) ) ( not ( = ?auto_27813 ?auto_27803 ) ) ( not ( = ?auto_27773 ?auto_27780 ) ) ( not ( = ?auto_27773 ?auto_27810 ) ) ( not ( = ?auto_27774 ?auto_27780 ) ) ( not ( = ?auto_27774 ?auto_27810 ) ) ( not ( = ?auto_27775 ?auto_27780 ) ) ( not ( = ?auto_27775 ?auto_27810 ) ) ( not ( = ?auto_27776 ?auto_27780 ) ) ( not ( = ?auto_27776 ?auto_27810 ) ) ( not ( = ?auto_27777 ?auto_27780 ) ) ( not ( = ?auto_27777 ?auto_27810 ) ) ( not ( = ?auto_27778 ?auto_27780 ) ) ( not ( = ?auto_27778 ?auto_27810 ) ) ( not ( = ?auto_27780 ?auto_27813 ) ) ( not ( = ?auto_27780 ?auto_27796 ) ) ( not ( = ?auto_27780 ?auto_27804 ) ) ( not ( = ?auto_27780 ?auto_27812 ) ) ( not ( = ?auto_27780 ?auto_27801 ) ) ( not ( = ?auto_27780 ?auto_27803 ) ) ( not ( = ?auto_27809 ?auto_27795 ) ) ( not ( = ?auto_27809 ?auto_27818 ) ) ( not ( = ?auto_27809 ?auto_27802 ) ) ( not ( = ?auto_27809 ?auto_27807 ) ) ( not ( = ?auto_27809 ?auto_27790 ) ) ( not ( = ?auto_27811 ?auto_27800 ) ) ( not ( = ?auto_27811 ?auto_27805 ) ) ( not ( = ?auto_27811 ?auto_27819 ) ) ( not ( = ?auto_27811 ?auto_27820 ) ) ( not ( = ?auto_27811 ?auto_27794 ) ) ( not ( = ?auto_27810 ?auto_27813 ) ) ( not ( = ?auto_27810 ?auto_27796 ) ) ( not ( = ?auto_27810 ?auto_27804 ) ) ( not ( = ?auto_27810 ?auto_27812 ) ) ( not ( = ?auto_27810 ?auto_27801 ) ) ( not ( = ?auto_27810 ?auto_27803 ) ) ( not ( = ?auto_27773 ?auto_27781 ) ) ( not ( = ?auto_27773 ?auto_27798 ) ) ( not ( = ?auto_27774 ?auto_27781 ) ) ( not ( = ?auto_27774 ?auto_27798 ) ) ( not ( = ?auto_27775 ?auto_27781 ) ) ( not ( = ?auto_27775 ?auto_27798 ) ) ( not ( = ?auto_27776 ?auto_27781 ) ) ( not ( = ?auto_27776 ?auto_27798 ) ) ( not ( = ?auto_27777 ?auto_27781 ) ) ( not ( = ?auto_27777 ?auto_27798 ) ) ( not ( = ?auto_27778 ?auto_27781 ) ) ( not ( = ?auto_27778 ?auto_27798 ) ) ( not ( = ?auto_27779 ?auto_27781 ) ) ( not ( = ?auto_27779 ?auto_27798 ) ) ( not ( = ?auto_27781 ?auto_27810 ) ) ( not ( = ?auto_27781 ?auto_27813 ) ) ( not ( = ?auto_27781 ?auto_27796 ) ) ( not ( = ?auto_27781 ?auto_27804 ) ) ( not ( = ?auto_27781 ?auto_27812 ) ) ( not ( = ?auto_27781 ?auto_27801 ) ) ( not ( = ?auto_27781 ?auto_27803 ) ) ( not ( = ?auto_27798 ?auto_27810 ) ) ( not ( = ?auto_27798 ?auto_27813 ) ) ( not ( = ?auto_27798 ?auto_27796 ) ) ( not ( = ?auto_27798 ?auto_27804 ) ) ( not ( = ?auto_27798 ?auto_27812 ) ) ( not ( = ?auto_27798 ?auto_27801 ) ) ( not ( = ?auto_27798 ?auto_27803 ) ) ( not ( = ?auto_27773 ?auto_27782 ) ) ( not ( = ?auto_27773 ?auto_27806 ) ) ( not ( = ?auto_27774 ?auto_27782 ) ) ( not ( = ?auto_27774 ?auto_27806 ) ) ( not ( = ?auto_27775 ?auto_27782 ) ) ( not ( = ?auto_27775 ?auto_27806 ) ) ( not ( = ?auto_27776 ?auto_27782 ) ) ( not ( = ?auto_27776 ?auto_27806 ) ) ( not ( = ?auto_27777 ?auto_27782 ) ) ( not ( = ?auto_27777 ?auto_27806 ) ) ( not ( = ?auto_27778 ?auto_27782 ) ) ( not ( = ?auto_27778 ?auto_27806 ) ) ( not ( = ?auto_27779 ?auto_27782 ) ) ( not ( = ?auto_27779 ?auto_27806 ) ) ( not ( = ?auto_27780 ?auto_27782 ) ) ( not ( = ?auto_27780 ?auto_27806 ) ) ( not ( = ?auto_27782 ?auto_27798 ) ) ( not ( = ?auto_27782 ?auto_27810 ) ) ( not ( = ?auto_27782 ?auto_27813 ) ) ( not ( = ?auto_27782 ?auto_27796 ) ) ( not ( = ?auto_27782 ?auto_27804 ) ) ( not ( = ?auto_27782 ?auto_27812 ) ) ( not ( = ?auto_27782 ?auto_27801 ) ) ( not ( = ?auto_27782 ?auto_27803 ) ) ( not ( = ?auto_27806 ?auto_27798 ) ) ( not ( = ?auto_27806 ?auto_27810 ) ) ( not ( = ?auto_27806 ?auto_27813 ) ) ( not ( = ?auto_27806 ?auto_27796 ) ) ( not ( = ?auto_27806 ?auto_27804 ) ) ( not ( = ?auto_27806 ?auto_27812 ) ) ( not ( = ?auto_27806 ?auto_27801 ) ) ( not ( = ?auto_27806 ?auto_27803 ) ) ( not ( = ?auto_27773 ?auto_27783 ) ) ( not ( = ?auto_27773 ?auto_27815 ) ) ( not ( = ?auto_27774 ?auto_27783 ) ) ( not ( = ?auto_27774 ?auto_27815 ) ) ( not ( = ?auto_27775 ?auto_27783 ) ) ( not ( = ?auto_27775 ?auto_27815 ) ) ( not ( = ?auto_27776 ?auto_27783 ) ) ( not ( = ?auto_27776 ?auto_27815 ) ) ( not ( = ?auto_27777 ?auto_27783 ) ) ( not ( = ?auto_27777 ?auto_27815 ) ) ( not ( = ?auto_27778 ?auto_27783 ) ) ( not ( = ?auto_27778 ?auto_27815 ) ) ( not ( = ?auto_27779 ?auto_27783 ) ) ( not ( = ?auto_27779 ?auto_27815 ) ) ( not ( = ?auto_27780 ?auto_27783 ) ) ( not ( = ?auto_27780 ?auto_27815 ) ) ( not ( = ?auto_27781 ?auto_27783 ) ) ( not ( = ?auto_27781 ?auto_27815 ) ) ( not ( = ?auto_27783 ?auto_27806 ) ) ( not ( = ?auto_27783 ?auto_27798 ) ) ( not ( = ?auto_27783 ?auto_27810 ) ) ( not ( = ?auto_27783 ?auto_27813 ) ) ( not ( = ?auto_27783 ?auto_27796 ) ) ( not ( = ?auto_27783 ?auto_27804 ) ) ( not ( = ?auto_27783 ?auto_27812 ) ) ( not ( = ?auto_27783 ?auto_27801 ) ) ( not ( = ?auto_27783 ?auto_27803 ) ) ( not ( = ?auto_27797 ?auto_27802 ) ) ( not ( = ?auto_27797 ?auto_27807 ) ) ( not ( = ?auto_27797 ?auto_27809 ) ) ( not ( = ?auto_27797 ?auto_27795 ) ) ( not ( = ?auto_27797 ?auto_27818 ) ) ( not ( = ?auto_27797 ?auto_27790 ) ) ( not ( = ?auto_27817 ?auto_27819 ) ) ( not ( = ?auto_27817 ?auto_27820 ) ) ( not ( = ?auto_27817 ?auto_27811 ) ) ( not ( = ?auto_27817 ?auto_27800 ) ) ( not ( = ?auto_27817 ?auto_27805 ) ) ( not ( = ?auto_27817 ?auto_27794 ) ) ( not ( = ?auto_27815 ?auto_27806 ) ) ( not ( = ?auto_27815 ?auto_27798 ) ) ( not ( = ?auto_27815 ?auto_27810 ) ) ( not ( = ?auto_27815 ?auto_27813 ) ) ( not ( = ?auto_27815 ?auto_27796 ) ) ( not ( = ?auto_27815 ?auto_27804 ) ) ( not ( = ?auto_27815 ?auto_27812 ) ) ( not ( = ?auto_27815 ?auto_27801 ) ) ( not ( = ?auto_27815 ?auto_27803 ) ) ( not ( = ?auto_27773 ?auto_27784 ) ) ( not ( = ?auto_27773 ?auto_27808 ) ) ( not ( = ?auto_27774 ?auto_27784 ) ) ( not ( = ?auto_27774 ?auto_27808 ) ) ( not ( = ?auto_27775 ?auto_27784 ) ) ( not ( = ?auto_27775 ?auto_27808 ) ) ( not ( = ?auto_27776 ?auto_27784 ) ) ( not ( = ?auto_27776 ?auto_27808 ) ) ( not ( = ?auto_27777 ?auto_27784 ) ) ( not ( = ?auto_27777 ?auto_27808 ) ) ( not ( = ?auto_27778 ?auto_27784 ) ) ( not ( = ?auto_27778 ?auto_27808 ) ) ( not ( = ?auto_27779 ?auto_27784 ) ) ( not ( = ?auto_27779 ?auto_27808 ) ) ( not ( = ?auto_27780 ?auto_27784 ) ) ( not ( = ?auto_27780 ?auto_27808 ) ) ( not ( = ?auto_27781 ?auto_27784 ) ) ( not ( = ?auto_27781 ?auto_27808 ) ) ( not ( = ?auto_27782 ?auto_27784 ) ) ( not ( = ?auto_27782 ?auto_27808 ) ) ( not ( = ?auto_27784 ?auto_27815 ) ) ( not ( = ?auto_27784 ?auto_27806 ) ) ( not ( = ?auto_27784 ?auto_27798 ) ) ( not ( = ?auto_27784 ?auto_27810 ) ) ( not ( = ?auto_27784 ?auto_27813 ) ) ( not ( = ?auto_27784 ?auto_27796 ) ) ( not ( = ?auto_27784 ?auto_27804 ) ) ( not ( = ?auto_27784 ?auto_27812 ) ) ( not ( = ?auto_27784 ?auto_27801 ) ) ( not ( = ?auto_27784 ?auto_27803 ) ) ( not ( = ?auto_27808 ?auto_27815 ) ) ( not ( = ?auto_27808 ?auto_27806 ) ) ( not ( = ?auto_27808 ?auto_27798 ) ) ( not ( = ?auto_27808 ?auto_27810 ) ) ( not ( = ?auto_27808 ?auto_27813 ) ) ( not ( = ?auto_27808 ?auto_27796 ) ) ( not ( = ?auto_27808 ?auto_27804 ) ) ( not ( = ?auto_27808 ?auto_27812 ) ) ( not ( = ?auto_27808 ?auto_27801 ) ) ( not ( = ?auto_27808 ?auto_27803 ) ) ( not ( = ?auto_27773 ?auto_27785 ) ) ( not ( = ?auto_27773 ?auto_27814 ) ) ( not ( = ?auto_27774 ?auto_27785 ) ) ( not ( = ?auto_27774 ?auto_27814 ) ) ( not ( = ?auto_27775 ?auto_27785 ) ) ( not ( = ?auto_27775 ?auto_27814 ) ) ( not ( = ?auto_27776 ?auto_27785 ) ) ( not ( = ?auto_27776 ?auto_27814 ) ) ( not ( = ?auto_27777 ?auto_27785 ) ) ( not ( = ?auto_27777 ?auto_27814 ) ) ( not ( = ?auto_27778 ?auto_27785 ) ) ( not ( = ?auto_27778 ?auto_27814 ) ) ( not ( = ?auto_27779 ?auto_27785 ) ) ( not ( = ?auto_27779 ?auto_27814 ) ) ( not ( = ?auto_27780 ?auto_27785 ) ) ( not ( = ?auto_27780 ?auto_27814 ) ) ( not ( = ?auto_27781 ?auto_27785 ) ) ( not ( = ?auto_27781 ?auto_27814 ) ) ( not ( = ?auto_27782 ?auto_27785 ) ) ( not ( = ?auto_27782 ?auto_27814 ) ) ( not ( = ?auto_27783 ?auto_27785 ) ) ( not ( = ?auto_27783 ?auto_27814 ) ) ( not ( = ?auto_27785 ?auto_27808 ) ) ( not ( = ?auto_27785 ?auto_27815 ) ) ( not ( = ?auto_27785 ?auto_27806 ) ) ( not ( = ?auto_27785 ?auto_27798 ) ) ( not ( = ?auto_27785 ?auto_27810 ) ) ( not ( = ?auto_27785 ?auto_27813 ) ) ( not ( = ?auto_27785 ?auto_27796 ) ) ( not ( = ?auto_27785 ?auto_27804 ) ) ( not ( = ?auto_27785 ?auto_27812 ) ) ( not ( = ?auto_27785 ?auto_27801 ) ) ( not ( = ?auto_27785 ?auto_27803 ) ) ( not ( = ?auto_27814 ?auto_27808 ) ) ( not ( = ?auto_27814 ?auto_27815 ) ) ( not ( = ?auto_27814 ?auto_27806 ) ) ( not ( = ?auto_27814 ?auto_27798 ) ) ( not ( = ?auto_27814 ?auto_27810 ) ) ( not ( = ?auto_27814 ?auto_27813 ) ) ( not ( = ?auto_27814 ?auto_27796 ) ) ( not ( = ?auto_27814 ?auto_27804 ) ) ( not ( = ?auto_27814 ?auto_27812 ) ) ( not ( = ?auto_27814 ?auto_27801 ) ) ( not ( = ?auto_27814 ?auto_27803 ) ) ( not ( = ?auto_27773 ?auto_27787 ) ) ( not ( = ?auto_27773 ?auto_27816 ) ) ( not ( = ?auto_27774 ?auto_27787 ) ) ( not ( = ?auto_27774 ?auto_27816 ) ) ( not ( = ?auto_27775 ?auto_27787 ) ) ( not ( = ?auto_27775 ?auto_27816 ) ) ( not ( = ?auto_27776 ?auto_27787 ) ) ( not ( = ?auto_27776 ?auto_27816 ) ) ( not ( = ?auto_27777 ?auto_27787 ) ) ( not ( = ?auto_27777 ?auto_27816 ) ) ( not ( = ?auto_27778 ?auto_27787 ) ) ( not ( = ?auto_27778 ?auto_27816 ) ) ( not ( = ?auto_27779 ?auto_27787 ) ) ( not ( = ?auto_27779 ?auto_27816 ) ) ( not ( = ?auto_27780 ?auto_27787 ) ) ( not ( = ?auto_27780 ?auto_27816 ) ) ( not ( = ?auto_27781 ?auto_27787 ) ) ( not ( = ?auto_27781 ?auto_27816 ) ) ( not ( = ?auto_27782 ?auto_27787 ) ) ( not ( = ?auto_27782 ?auto_27816 ) ) ( not ( = ?auto_27783 ?auto_27787 ) ) ( not ( = ?auto_27783 ?auto_27816 ) ) ( not ( = ?auto_27784 ?auto_27787 ) ) ( not ( = ?auto_27784 ?auto_27816 ) ) ( not ( = ?auto_27787 ?auto_27814 ) ) ( not ( = ?auto_27787 ?auto_27808 ) ) ( not ( = ?auto_27787 ?auto_27815 ) ) ( not ( = ?auto_27787 ?auto_27806 ) ) ( not ( = ?auto_27787 ?auto_27798 ) ) ( not ( = ?auto_27787 ?auto_27810 ) ) ( not ( = ?auto_27787 ?auto_27813 ) ) ( not ( = ?auto_27787 ?auto_27796 ) ) ( not ( = ?auto_27787 ?auto_27804 ) ) ( not ( = ?auto_27787 ?auto_27812 ) ) ( not ( = ?auto_27787 ?auto_27801 ) ) ( not ( = ?auto_27787 ?auto_27803 ) ) ( not ( = ?auto_27816 ?auto_27814 ) ) ( not ( = ?auto_27816 ?auto_27808 ) ) ( not ( = ?auto_27816 ?auto_27815 ) ) ( not ( = ?auto_27816 ?auto_27806 ) ) ( not ( = ?auto_27816 ?auto_27798 ) ) ( not ( = ?auto_27816 ?auto_27810 ) ) ( not ( = ?auto_27816 ?auto_27813 ) ) ( not ( = ?auto_27816 ?auto_27796 ) ) ( not ( = ?auto_27816 ?auto_27804 ) ) ( not ( = ?auto_27816 ?auto_27812 ) ) ( not ( = ?auto_27816 ?auto_27801 ) ) ( not ( = ?auto_27816 ?auto_27803 ) ) ( not ( = ?auto_27773 ?auto_27786 ) ) ( not ( = ?auto_27773 ?auto_27799 ) ) ( not ( = ?auto_27774 ?auto_27786 ) ) ( not ( = ?auto_27774 ?auto_27799 ) ) ( not ( = ?auto_27775 ?auto_27786 ) ) ( not ( = ?auto_27775 ?auto_27799 ) ) ( not ( = ?auto_27776 ?auto_27786 ) ) ( not ( = ?auto_27776 ?auto_27799 ) ) ( not ( = ?auto_27777 ?auto_27786 ) ) ( not ( = ?auto_27777 ?auto_27799 ) ) ( not ( = ?auto_27778 ?auto_27786 ) ) ( not ( = ?auto_27778 ?auto_27799 ) ) ( not ( = ?auto_27779 ?auto_27786 ) ) ( not ( = ?auto_27779 ?auto_27799 ) ) ( not ( = ?auto_27780 ?auto_27786 ) ) ( not ( = ?auto_27780 ?auto_27799 ) ) ( not ( = ?auto_27781 ?auto_27786 ) ) ( not ( = ?auto_27781 ?auto_27799 ) ) ( not ( = ?auto_27782 ?auto_27786 ) ) ( not ( = ?auto_27782 ?auto_27799 ) ) ( not ( = ?auto_27783 ?auto_27786 ) ) ( not ( = ?auto_27783 ?auto_27799 ) ) ( not ( = ?auto_27784 ?auto_27786 ) ) ( not ( = ?auto_27784 ?auto_27799 ) ) ( not ( = ?auto_27785 ?auto_27786 ) ) ( not ( = ?auto_27785 ?auto_27799 ) ) ( not ( = ?auto_27786 ?auto_27816 ) ) ( not ( = ?auto_27786 ?auto_27814 ) ) ( not ( = ?auto_27786 ?auto_27808 ) ) ( not ( = ?auto_27786 ?auto_27815 ) ) ( not ( = ?auto_27786 ?auto_27806 ) ) ( not ( = ?auto_27786 ?auto_27798 ) ) ( not ( = ?auto_27786 ?auto_27810 ) ) ( not ( = ?auto_27786 ?auto_27813 ) ) ( not ( = ?auto_27786 ?auto_27796 ) ) ( not ( = ?auto_27786 ?auto_27804 ) ) ( not ( = ?auto_27786 ?auto_27812 ) ) ( not ( = ?auto_27786 ?auto_27801 ) ) ( not ( = ?auto_27786 ?auto_27803 ) ) ( not ( = ?auto_27799 ?auto_27816 ) ) ( not ( = ?auto_27799 ?auto_27814 ) ) ( not ( = ?auto_27799 ?auto_27808 ) ) ( not ( = ?auto_27799 ?auto_27815 ) ) ( not ( = ?auto_27799 ?auto_27806 ) ) ( not ( = ?auto_27799 ?auto_27798 ) ) ( not ( = ?auto_27799 ?auto_27810 ) ) ( not ( = ?auto_27799 ?auto_27813 ) ) ( not ( = ?auto_27799 ?auto_27796 ) ) ( not ( = ?auto_27799 ?auto_27804 ) ) ( not ( = ?auto_27799 ?auto_27812 ) ) ( not ( = ?auto_27799 ?auto_27801 ) ) ( not ( = ?auto_27799 ?auto_27803 ) ) ( not ( = ?auto_27773 ?auto_27788 ) ) ( not ( = ?auto_27773 ?auto_27793 ) ) ( not ( = ?auto_27774 ?auto_27788 ) ) ( not ( = ?auto_27774 ?auto_27793 ) ) ( not ( = ?auto_27775 ?auto_27788 ) ) ( not ( = ?auto_27775 ?auto_27793 ) ) ( not ( = ?auto_27776 ?auto_27788 ) ) ( not ( = ?auto_27776 ?auto_27793 ) ) ( not ( = ?auto_27777 ?auto_27788 ) ) ( not ( = ?auto_27777 ?auto_27793 ) ) ( not ( = ?auto_27778 ?auto_27788 ) ) ( not ( = ?auto_27778 ?auto_27793 ) ) ( not ( = ?auto_27779 ?auto_27788 ) ) ( not ( = ?auto_27779 ?auto_27793 ) ) ( not ( = ?auto_27780 ?auto_27788 ) ) ( not ( = ?auto_27780 ?auto_27793 ) ) ( not ( = ?auto_27781 ?auto_27788 ) ) ( not ( = ?auto_27781 ?auto_27793 ) ) ( not ( = ?auto_27782 ?auto_27788 ) ) ( not ( = ?auto_27782 ?auto_27793 ) ) ( not ( = ?auto_27783 ?auto_27788 ) ) ( not ( = ?auto_27783 ?auto_27793 ) ) ( not ( = ?auto_27784 ?auto_27788 ) ) ( not ( = ?auto_27784 ?auto_27793 ) ) ( not ( = ?auto_27785 ?auto_27788 ) ) ( not ( = ?auto_27785 ?auto_27793 ) ) ( not ( = ?auto_27787 ?auto_27788 ) ) ( not ( = ?auto_27787 ?auto_27793 ) ) ( not ( = ?auto_27788 ?auto_27799 ) ) ( not ( = ?auto_27788 ?auto_27816 ) ) ( not ( = ?auto_27788 ?auto_27814 ) ) ( not ( = ?auto_27788 ?auto_27808 ) ) ( not ( = ?auto_27788 ?auto_27815 ) ) ( not ( = ?auto_27788 ?auto_27806 ) ) ( not ( = ?auto_27788 ?auto_27798 ) ) ( not ( = ?auto_27788 ?auto_27810 ) ) ( not ( = ?auto_27788 ?auto_27813 ) ) ( not ( = ?auto_27788 ?auto_27796 ) ) ( not ( = ?auto_27788 ?auto_27804 ) ) ( not ( = ?auto_27788 ?auto_27812 ) ) ( not ( = ?auto_27788 ?auto_27801 ) ) ( not ( = ?auto_27788 ?auto_27803 ) ) ( not ( = ?auto_27793 ?auto_27799 ) ) ( not ( = ?auto_27793 ?auto_27816 ) ) ( not ( = ?auto_27793 ?auto_27814 ) ) ( not ( = ?auto_27793 ?auto_27808 ) ) ( not ( = ?auto_27793 ?auto_27815 ) ) ( not ( = ?auto_27793 ?auto_27806 ) ) ( not ( = ?auto_27793 ?auto_27798 ) ) ( not ( = ?auto_27793 ?auto_27810 ) ) ( not ( = ?auto_27793 ?auto_27813 ) ) ( not ( = ?auto_27793 ?auto_27796 ) ) ( not ( = ?auto_27793 ?auto_27804 ) ) ( not ( = ?auto_27793 ?auto_27812 ) ) ( not ( = ?auto_27793 ?auto_27801 ) ) ( not ( = ?auto_27793 ?auto_27803 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_27773 ?auto_27774 ?auto_27775 ?auto_27776 ?auto_27777 ?auto_27778 ?auto_27779 ?auto_27780 ?auto_27781 ?auto_27782 ?auto_27783 ?auto_27784 ?auto_27785 ?auto_27787 ?auto_27786 )
      ( MAKE-1CRATE ?auto_27786 ?auto_27788 )
      ( MAKE-15CRATE-VERIFY ?auto_27773 ?auto_27774 ?auto_27775 ?auto_27776 ?auto_27777 ?auto_27778 ?auto_27779 ?auto_27780 ?auto_27781 ?auto_27782 ?auto_27783 ?auto_27784 ?auto_27785 ?auto_27787 ?auto_27786 ?auto_27788 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_27848 - SURFACE
      ?auto_27849 - SURFACE
      ?auto_27850 - SURFACE
      ?auto_27851 - SURFACE
      ?auto_27852 - SURFACE
      ?auto_27853 - SURFACE
      ?auto_27854 - SURFACE
      ?auto_27855 - SURFACE
      ?auto_27856 - SURFACE
      ?auto_27857 - SURFACE
      ?auto_27858 - SURFACE
      ?auto_27859 - SURFACE
      ?auto_27860 - SURFACE
      ?auto_27862 - SURFACE
      ?auto_27861 - SURFACE
      ?auto_27864 - SURFACE
      ?auto_27863 - SURFACE
    )
    :vars
    (
      ?auto_27868 - HOIST
      ?auto_27867 - PLACE
      ?auto_27866 - PLACE
      ?auto_27865 - HOIST
      ?auto_27870 - SURFACE
      ?auto_27897 - PLACE
      ?auto_27885 - HOIST
      ?auto_27884 - SURFACE
      ?auto_27877 - PLACE
      ?auto_27880 - HOIST
      ?auto_27881 - SURFACE
      ?auto_27896 - PLACE
      ?auto_27871 - HOIST
      ?auto_27876 - SURFACE
      ?auto_27883 - SURFACE
      ?auto_27890 - SURFACE
      ?auto_27895 - PLACE
      ?auto_27893 - HOIST
      ?auto_27882 - SURFACE
      ?auto_27879 - PLACE
      ?auto_27875 - HOIST
      ?auto_27872 - SURFACE
      ?auto_27889 - SURFACE
      ?auto_27894 - SURFACE
      ?auto_27892 - SURFACE
      ?auto_27891 - PLACE
      ?auto_27878 - HOIST
      ?auto_27873 - SURFACE
      ?auto_27886 - SURFACE
      ?auto_27874 - SURFACE
      ?auto_27887 - SURFACE
      ?auto_27888 - SURFACE
      ?auto_27869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27868 ?auto_27867 ) ( IS-CRATE ?auto_27863 ) ( not ( = ?auto_27866 ?auto_27867 ) ) ( HOIST-AT ?auto_27865 ?auto_27866 ) ( SURFACE-AT ?auto_27863 ?auto_27866 ) ( ON ?auto_27863 ?auto_27870 ) ( CLEAR ?auto_27863 ) ( not ( = ?auto_27864 ?auto_27863 ) ) ( not ( = ?auto_27864 ?auto_27870 ) ) ( not ( = ?auto_27863 ?auto_27870 ) ) ( not ( = ?auto_27868 ?auto_27865 ) ) ( IS-CRATE ?auto_27864 ) ( not ( = ?auto_27897 ?auto_27867 ) ) ( HOIST-AT ?auto_27885 ?auto_27897 ) ( SURFACE-AT ?auto_27864 ?auto_27897 ) ( ON ?auto_27864 ?auto_27884 ) ( CLEAR ?auto_27864 ) ( not ( = ?auto_27861 ?auto_27864 ) ) ( not ( = ?auto_27861 ?auto_27884 ) ) ( not ( = ?auto_27864 ?auto_27884 ) ) ( not ( = ?auto_27868 ?auto_27885 ) ) ( IS-CRATE ?auto_27861 ) ( not ( = ?auto_27877 ?auto_27867 ) ) ( HOIST-AT ?auto_27880 ?auto_27877 ) ( SURFACE-AT ?auto_27861 ?auto_27877 ) ( ON ?auto_27861 ?auto_27881 ) ( CLEAR ?auto_27861 ) ( not ( = ?auto_27862 ?auto_27861 ) ) ( not ( = ?auto_27862 ?auto_27881 ) ) ( not ( = ?auto_27861 ?auto_27881 ) ) ( not ( = ?auto_27868 ?auto_27880 ) ) ( IS-CRATE ?auto_27862 ) ( not ( = ?auto_27896 ?auto_27867 ) ) ( HOIST-AT ?auto_27871 ?auto_27896 ) ( SURFACE-AT ?auto_27862 ?auto_27896 ) ( ON ?auto_27862 ?auto_27876 ) ( CLEAR ?auto_27862 ) ( not ( = ?auto_27860 ?auto_27862 ) ) ( not ( = ?auto_27860 ?auto_27876 ) ) ( not ( = ?auto_27862 ?auto_27876 ) ) ( not ( = ?auto_27868 ?auto_27871 ) ) ( IS-CRATE ?auto_27860 ) ( SURFACE-AT ?auto_27860 ?auto_27896 ) ( ON ?auto_27860 ?auto_27883 ) ( CLEAR ?auto_27860 ) ( not ( = ?auto_27859 ?auto_27860 ) ) ( not ( = ?auto_27859 ?auto_27883 ) ) ( not ( = ?auto_27860 ?auto_27883 ) ) ( IS-CRATE ?auto_27859 ) ( SURFACE-AT ?auto_27859 ?auto_27897 ) ( ON ?auto_27859 ?auto_27890 ) ( CLEAR ?auto_27859 ) ( not ( = ?auto_27858 ?auto_27859 ) ) ( not ( = ?auto_27858 ?auto_27890 ) ) ( not ( = ?auto_27859 ?auto_27890 ) ) ( IS-CRATE ?auto_27858 ) ( not ( = ?auto_27895 ?auto_27867 ) ) ( HOIST-AT ?auto_27893 ?auto_27895 ) ( AVAILABLE ?auto_27893 ) ( SURFACE-AT ?auto_27858 ?auto_27895 ) ( ON ?auto_27858 ?auto_27882 ) ( CLEAR ?auto_27858 ) ( not ( = ?auto_27857 ?auto_27858 ) ) ( not ( = ?auto_27857 ?auto_27882 ) ) ( not ( = ?auto_27858 ?auto_27882 ) ) ( not ( = ?auto_27868 ?auto_27893 ) ) ( IS-CRATE ?auto_27857 ) ( not ( = ?auto_27879 ?auto_27867 ) ) ( HOIST-AT ?auto_27875 ?auto_27879 ) ( SURFACE-AT ?auto_27857 ?auto_27879 ) ( ON ?auto_27857 ?auto_27872 ) ( CLEAR ?auto_27857 ) ( not ( = ?auto_27856 ?auto_27857 ) ) ( not ( = ?auto_27856 ?auto_27872 ) ) ( not ( = ?auto_27857 ?auto_27872 ) ) ( not ( = ?auto_27868 ?auto_27875 ) ) ( IS-CRATE ?auto_27856 ) ( SURFACE-AT ?auto_27856 ?auto_27896 ) ( ON ?auto_27856 ?auto_27889 ) ( CLEAR ?auto_27856 ) ( not ( = ?auto_27855 ?auto_27856 ) ) ( not ( = ?auto_27855 ?auto_27889 ) ) ( not ( = ?auto_27856 ?auto_27889 ) ) ( IS-CRATE ?auto_27855 ) ( AVAILABLE ?auto_27880 ) ( SURFACE-AT ?auto_27855 ?auto_27877 ) ( ON ?auto_27855 ?auto_27894 ) ( CLEAR ?auto_27855 ) ( not ( = ?auto_27854 ?auto_27855 ) ) ( not ( = ?auto_27854 ?auto_27894 ) ) ( not ( = ?auto_27855 ?auto_27894 ) ) ( IS-CRATE ?auto_27854 ) ( AVAILABLE ?auto_27865 ) ( SURFACE-AT ?auto_27854 ?auto_27866 ) ( ON ?auto_27854 ?auto_27892 ) ( CLEAR ?auto_27854 ) ( not ( = ?auto_27853 ?auto_27854 ) ) ( not ( = ?auto_27853 ?auto_27892 ) ) ( not ( = ?auto_27854 ?auto_27892 ) ) ( IS-CRATE ?auto_27853 ) ( not ( = ?auto_27891 ?auto_27867 ) ) ( HOIST-AT ?auto_27878 ?auto_27891 ) ( SURFACE-AT ?auto_27853 ?auto_27891 ) ( ON ?auto_27853 ?auto_27873 ) ( CLEAR ?auto_27853 ) ( not ( = ?auto_27852 ?auto_27853 ) ) ( not ( = ?auto_27852 ?auto_27873 ) ) ( not ( = ?auto_27853 ?auto_27873 ) ) ( not ( = ?auto_27868 ?auto_27878 ) ) ( IS-CRATE ?auto_27852 ) ( AVAILABLE ?auto_27878 ) ( SURFACE-AT ?auto_27852 ?auto_27891 ) ( ON ?auto_27852 ?auto_27886 ) ( CLEAR ?auto_27852 ) ( not ( = ?auto_27851 ?auto_27852 ) ) ( not ( = ?auto_27851 ?auto_27886 ) ) ( not ( = ?auto_27852 ?auto_27886 ) ) ( IS-CRATE ?auto_27851 ) ( AVAILABLE ?auto_27875 ) ( SURFACE-AT ?auto_27851 ?auto_27879 ) ( ON ?auto_27851 ?auto_27874 ) ( CLEAR ?auto_27851 ) ( not ( = ?auto_27850 ?auto_27851 ) ) ( not ( = ?auto_27850 ?auto_27874 ) ) ( not ( = ?auto_27851 ?auto_27874 ) ) ( IS-CRATE ?auto_27850 ) ( AVAILABLE ?auto_27871 ) ( SURFACE-AT ?auto_27850 ?auto_27896 ) ( ON ?auto_27850 ?auto_27887 ) ( CLEAR ?auto_27850 ) ( not ( = ?auto_27849 ?auto_27850 ) ) ( not ( = ?auto_27849 ?auto_27887 ) ) ( not ( = ?auto_27850 ?auto_27887 ) ) ( SURFACE-AT ?auto_27848 ?auto_27867 ) ( CLEAR ?auto_27848 ) ( IS-CRATE ?auto_27849 ) ( AVAILABLE ?auto_27868 ) ( AVAILABLE ?auto_27885 ) ( SURFACE-AT ?auto_27849 ?auto_27897 ) ( ON ?auto_27849 ?auto_27888 ) ( CLEAR ?auto_27849 ) ( TRUCK-AT ?auto_27869 ?auto_27867 ) ( not ( = ?auto_27848 ?auto_27849 ) ) ( not ( = ?auto_27848 ?auto_27888 ) ) ( not ( = ?auto_27849 ?auto_27888 ) ) ( not ( = ?auto_27848 ?auto_27850 ) ) ( not ( = ?auto_27848 ?auto_27887 ) ) ( not ( = ?auto_27850 ?auto_27888 ) ) ( not ( = ?auto_27896 ?auto_27897 ) ) ( not ( = ?auto_27871 ?auto_27885 ) ) ( not ( = ?auto_27887 ?auto_27888 ) ) ( not ( = ?auto_27848 ?auto_27851 ) ) ( not ( = ?auto_27848 ?auto_27874 ) ) ( not ( = ?auto_27849 ?auto_27851 ) ) ( not ( = ?auto_27849 ?auto_27874 ) ) ( not ( = ?auto_27851 ?auto_27887 ) ) ( not ( = ?auto_27851 ?auto_27888 ) ) ( not ( = ?auto_27879 ?auto_27896 ) ) ( not ( = ?auto_27879 ?auto_27897 ) ) ( not ( = ?auto_27875 ?auto_27871 ) ) ( not ( = ?auto_27875 ?auto_27885 ) ) ( not ( = ?auto_27874 ?auto_27887 ) ) ( not ( = ?auto_27874 ?auto_27888 ) ) ( not ( = ?auto_27848 ?auto_27852 ) ) ( not ( = ?auto_27848 ?auto_27886 ) ) ( not ( = ?auto_27849 ?auto_27852 ) ) ( not ( = ?auto_27849 ?auto_27886 ) ) ( not ( = ?auto_27850 ?auto_27852 ) ) ( not ( = ?auto_27850 ?auto_27886 ) ) ( not ( = ?auto_27852 ?auto_27874 ) ) ( not ( = ?auto_27852 ?auto_27887 ) ) ( not ( = ?auto_27852 ?auto_27888 ) ) ( not ( = ?auto_27891 ?auto_27879 ) ) ( not ( = ?auto_27891 ?auto_27896 ) ) ( not ( = ?auto_27891 ?auto_27897 ) ) ( not ( = ?auto_27878 ?auto_27875 ) ) ( not ( = ?auto_27878 ?auto_27871 ) ) ( not ( = ?auto_27878 ?auto_27885 ) ) ( not ( = ?auto_27886 ?auto_27874 ) ) ( not ( = ?auto_27886 ?auto_27887 ) ) ( not ( = ?auto_27886 ?auto_27888 ) ) ( not ( = ?auto_27848 ?auto_27853 ) ) ( not ( = ?auto_27848 ?auto_27873 ) ) ( not ( = ?auto_27849 ?auto_27853 ) ) ( not ( = ?auto_27849 ?auto_27873 ) ) ( not ( = ?auto_27850 ?auto_27853 ) ) ( not ( = ?auto_27850 ?auto_27873 ) ) ( not ( = ?auto_27851 ?auto_27853 ) ) ( not ( = ?auto_27851 ?auto_27873 ) ) ( not ( = ?auto_27853 ?auto_27886 ) ) ( not ( = ?auto_27853 ?auto_27874 ) ) ( not ( = ?auto_27853 ?auto_27887 ) ) ( not ( = ?auto_27853 ?auto_27888 ) ) ( not ( = ?auto_27873 ?auto_27886 ) ) ( not ( = ?auto_27873 ?auto_27874 ) ) ( not ( = ?auto_27873 ?auto_27887 ) ) ( not ( = ?auto_27873 ?auto_27888 ) ) ( not ( = ?auto_27848 ?auto_27854 ) ) ( not ( = ?auto_27848 ?auto_27892 ) ) ( not ( = ?auto_27849 ?auto_27854 ) ) ( not ( = ?auto_27849 ?auto_27892 ) ) ( not ( = ?auto_27850 ?auto_27854 ) ) ( not ( = ?auto_27850 ?auto_27892 ) ) ( not ( = ?auto_27851 ?auto_27854 ) ) ( not ( = ?auto_27851 ?auto_27892 ) ) ( not ( = ?auto_27852 ?auto_27854 ) ) ( not ( = ?auto_27852 ?auto_27892 ) ) ( not ( = ?auto_27854 ?auto_27873 ) ) ( not ( = ?auto_27854 ?auto_27886 ) ) ( not ( = ?auto_27854 ?auto_27874 ) ) ( not ( = ?auto_27854 ?auto_27887 ) ) ( not ( = ?auto_27854 ?auto_27888 ) ) ( not ( = ?auto_27866 ?auto_27891 ) ) ( not ( = ?auto_27866 ?auto_27879 ) ) ( not ( = ?auto_27866 ?auto_27896 ) ) ( not ( = ?auto_27866 ?auto_27897 ) ) ( not ( = ?auto_27865 ?auto_27878 ) ) ( not ( = ?auto_27865 ?auto_27875 ) ) ( not ( = ?auto_27865 ?auto_27871 ) ) ( not ( = ?auto_27865 ?auto_27885 ) ) ( not ( = ?auto_27892 ?auto_27873 ) ) ( not ( = ?auto_27892 ?auto_27886 ) ) ( not ( = ?auto_27892 ?auto_27874 ) ) ( not ( = ?auto_27892 ?auto_27887 ) ) ( not ( = ?auto_27892 ?auto_27888 ) ) ( not ( = ?auto_27848 ?auto_27855 ) ) ( not ( = ?auto_27848 ?auto_27894 ) ) ( not ( = ?auto_27849 ?auto_27855 ) ) ( not ( = ?auto_27849 ?auto_27894 ) ) ( not ( = ?auto_27850 ?auto_27855 ) ) ( not ( = ?auto_27850 ?auto_27894 ) ) ( not ( = ?auto_27851 ?auto_27855 ) ) ( not ( = ?auto_27851 ?auto_27894 ) ) ( not ( = ?auto_27852 ?auto_27855 ) ) ( not ( = ?auto_27852 ?auto_27894 ) ) ( not ( = ?auto_27853 ?auto_27855 ) ) ( not ( = ?auto_27853 ?auto_27894 ) ) ( not ( = ?auto_27855 ?auto_27892 ) ) ( not ( = ?auto_27855 ?auto_27873 ) ) ( not ( = ?auto_27855 ?auto_27886 ) ) ( not ( = ?auto_27855 ?auto_27874 ) ) ( not ( = ?auto_27855 ?auto_27887 ) ) ( not ( = ?auto_27855 ?auto_27888 ) ) ( not ( = ?auto_27877 ?auto_27866 ) ) ( not ( = ?auto_27877 ?auto_27891 ) ) ( not ( = ?auto_27877 ?auto_27879 ) ) ( not ( = ?auto_27877 ?auto_27896 ) ) ( not ( = ?auto_27877 ?auto_27897 ) ) ( not ( = ?auto_27880 ?auto_27865 ) ) ( not ( = ?auto_27880 ?auto_27878 ) ) ( not ( = ?auto_27880 ?auto_27875 ) ) ( not ( = ?auto_27880 ?auto_27871 ) ) ( not ( = ?auto_27880 ?auto_27885 ) ) ( not ( = ?auto_27894 ?auto_27892 ) ) ( not ( = ?auto_27894 ?auto_27873 ) ) ( not ( = ?auto_27894 ?auto_27886 ) ) ( not ( = ?auto_27894 ?auto_27874 ) ) ( not ( = ?auto_27894 ?auto_27887 ) ) ( not ( = ?auto_27894 ?auto_27888 ) ) ( not ( = ?auto_27848 ?auto_27856 ) ) ( not ( = ?auto_27848 ?auto_27889 ) ) ( not ( = ?auto_27849 ?auto_27856 ) ) ( not ( = ?auto_27849 ?auto_27889 ) ) ( not ( = ?auto_27850 ?auto_27856 ) ) ( not ( = ?auto_27850 ?auto_27889 ) ) ( not ( = ?auto_27851 ?auto_27856 ) ) ( not ( = ?auto_27851 ?auto_27889 ) ) ( not ( = ?auto_27852 ?auto_27856 ) ) ( not ( = ?auto_27852 ?auto_27889 ) ) ( not ( = ?auto_27853 ?auto_27856 ) ) ( not ( = ?auto_27853 ?auto_27889 ) ) ( not ( = ?auto_27854 ?auto_27856 ) ) ( not ( = ?auto_27854 ?auto_27889 ) ) ( not ( = ?auto_27856 ?auto_27894 ) ) ( not ( = ?auto_27856 ?auto_27892 ) ) ( not ( = ?auto_27856 ?auto_27873 ) ) ( not ( = ?auto_27856 ?auto_27886 ) ) ( not ( = ?auto_27856 ?auto_27874 ) ) ( not ( = ?auto_27856 ?auto_27887 ) ) ( not ( = ?auto_27856 ?auto_27888 ) ) ( not ( = ?auto_27889 ?auto_27894 ) ) ( not ( = ?auto_27889 ?auto_27892 ) ) ( not ( = ?auto_27889 ?auto_27873 ) ) ( not ( = ?auto_27889 ?auto_27886 ) ) ( not ( = ?auto_27889 ?auto_27874 ) ) ( not ( = ?auto_27889 ?auto_27887 ) ) ( not ( = ?auto_27889 ?auto_27888 ) ) ( not ( = ?auto_27848 ?auto_27857 ) ) ( not ( = ?auto_27848 ?auto_27872 ) ) ( not ( = ?auto_27849 ?auto_27857 ) ) ( not ( = ?auto_27849 ?auto_27872 ) ) ( not ( = ?auto_27850 ?auto_27857 ) ) ( not ( = ?auto_27850 ?auto_27872 ) ) ( not ( = ?auto_27851 ?auto_27857 ) ) ( not ( = ?auto_27851 ?auto_27872 ) ) ( not ( = ?auto_27852 ?auto_27857 ) ) ( not ( = ?auto_27852 ?auto_27872 ) ) ( not ( = ?auto_27853 ?auto_27857 ) ) ( not ( = ?auto_27853 ?auto_27872 ) ) ( not ( = ?auto_27854 ?auto_27857 ) ) ( not ( = ?auto_27854 ?auto_27872 ) ) ( not ( = ?auto_27855 ?auto_27857 ) ) ( not ( = ?auto_27855 ?auto_27872 ) ) ( not ( = ?auto_27857 ?auto_27889 ) ) ( not ( = ?auto_27857 ?auto_27894 ) ) ( not ( = ?auto_27857 ?auto_27892 ) ) ( not ( = ?auto_27857 ?auto_27873 ) ) ( not ( = ?auto_27857 ?auto_27886 ) ) ( not ( = ?auto_27857 ?auto_27874 ) ) ( not ( = ?auto_27857 ?auto_27887 ) ) ( not ( = ?auto_27857 ?auto_27888 ) ) ( not ( = ?auto_27872 ?auto_27889 ) ) ( not ( = ?auto_27872 ?auto_27894 ) ) ( not ( = ?auto_27872 ?auto_27892 ) ) ( not ( = ?auto_27872 ?auto_27873 ) ) ( not ( = ?auto_27872 ?auto_27886 ) ) ( not ( = ?auto_27872 ?auto_27874 ) ) ( not ( = ?auto_27872 ?auto_27887 ) ) ( not ( = ?auto_27872 ?auto_27888 ) ) ( not ( = ?auto_27848 ?auto_27858 ) ) ( not ( = ?auto_27848 ?auto_27882 ) ) ( not ( = ?auto_27849 ?auto_27858 ) ) ( not ( = ?auto_27849 ?auto_27882 ) ) ( not ( = ?auto_27850 ?auto_27858 ) ) ( not ( = ?auto_27850 ?auto_27882 ) ) ( not ( = ?auto_27851 ?auto_27858 ) ) ( not ( = ?auto_27851 ?auto_27882 ) ) ( not ( = ?auto_27852 ?auto_27858 ) ) ( not ( = ?auto_27852 ?auto_27882 ) ) ( not ( = ?auto_27853 ?auto_27858 ) ) ( not ( = ?auto_27853 ?auto_27882 ) ) ( not ( = ?auto_27854 ?auto_27858 ) ) ( not ( = ?auto_27854 ?auto_27882 ) ) ( not ( = ?auto_27855 ?auto_27858 ) ) ( not ( = ?auto_27855 ?auto_27882 ) ) ( not ( = ?auto_27856 ?auto_27858 ) ) ( not ( = ?auto_27856 ?auto_27882 ) ) ( not ( = ?auto_27858 ?auto_27872 ) ) ( not ( = ?auto_27858 ?auto_27889 ) ) ( not ( = ?auto_27858 ?auto_27894 ) ) ( not ( = ?auto_27858 ?auto_27892 ) ) ( not ( = ?auto_27858 ?auto_27873 ) ) ( not ( = ?auto_27858 ?auto_27886 ) ) ( not ( = ?auto_27858 ?auto_27874 ) ) ( not ( = ?auto_27858 ?auto_27887 ) ) ( not ( = ?auto_27858 ?auto_27888 ) ) ( not ( = ?auto_27895 ?auto_27879 ) ) ( not ( = ?auto_27895 ?auto_27896 ) ) ( not ( = ?auto_27895 ?auto_27877 ) ) ( not ( = ?auto_27895 ?auto_27866 ) ) ( not ( = ?auto_27895 ?auto_27891 ) ) ( not ( = ?auto_27895 ?auto_27897 ) ) ( not ( = ?auto_27893 ?auto_27875 ) ) ( not ( = ?auto_27893 ?auto_27871 ) ) ( not ( = ?auto_27893 ?auto_27880 ) ) ( not ( = ?auto_27893 ?auto_27865 ) ) ( not ( = ?auto_27893 ?auto_27878 ) ) ( not ( = ?auto_27893 ?auto_27885 ) ) ( not ( = ?auto_27882 ?auto_27872 ) ) ( not ( = ?auto_27882 ?auto_27889 ) ) ( not ( = ?auto_27882 ?auto_27894 ) ) ( not ( = ?auto_27882 ?auto_27892 ) ) ( not ( = ?auto_27882 ?auto_27873 ) ) ( not ( = ?auto_27882 ?auto_27886 ) ) ( not ( = ?auto_27882 ?auto_27874 ) ) ( not ( = ?auto_27882 ?auto_27887 ) ) ( not ( = ?auto_27882 ?auto_27888 ) ) ( not ( = ?auto_27848 ?auto_27859 ) ) ( not ( = ?auto_27848 ?auto_27890 ) ) ( not ( = ?auto_27849 ?auto_27859 ) ) ( not ( = ?auto_27849 ?auto_27890 ) ) ( not ( = ?auto_27850 ?auto_27859 ) ) ( not ( = ?auto_27850 ?auto_27890 ) ) ( not ( = ?auto_27851 ?auto_27859 ) ) ( not ( = ?auto_27851 ?auto_27890 ) ) ( not ( = ?auto_27852 ?auto_27859 ) ) ( not ( = ?auto_27852 ?auto_27890 ) ) ( not ( = ?auto_27853 ?auto_27859 ) ) ( not ( = ?auto_27853 ?auto_27890 ) ) ( not ( = ?auto_27854 ?auto_27859 ) ) ( not ( = ?auto_27854 ?auto_27890 ) ) ( not ( = ?auto_27855 ?auto_27859 ) ) ( not ( = ?auto_27855 ?auto_27890 ) ) ( not ( = ?auto_27856 ?auto_27859 ) ) ( not ( = ?auto_27856 ?auto_27890 ) ) ( not ( = ?auto_27857 ?auto_27859 ) ) ( not ( = ?auto_27857 ?auto_27890 ) ) ( not ( = ?auto_27859 ?auto_27882 ) ) ( not ( = ?auto_27859 ?auto_27872 ) ) ( not ( = ?auto_27859 ?auto_27889 ) ) ( not ( = ?auto_27859 ?auto_27894 ) ) ( not ( = ?auto_27859 ?auto_27892 ) ) ( not ( = ?auto_27859 ?auto_27873 ) ) ( not ( = ?auto_27859 ?auto_27886 ) ) ( not ( = ?auto_27859 ?auto_27874 ) ) ( not ( = ?auto_27859 ?auto_27887 ) ) ( not ( = ?auto_27859 ?auto_27888 ) ) ( not ( = ?auto_27890 ?auto_27882 ) ) ( not ( = ?auto_27890 ?auto_27872 ) ) ( not ( = ?auto_27890 ?auto_27889 ) ) ( not ( = ?auto_27890 ?auto_27894 ) ) ( not ( = ?auto_27890 ?auto_27892 ) ) ( not ( = ?auto_27890 ?auto_27873 ) ) ( not ( = ?auto_27890 ?auto_27886 ) ) ( not ( = ?auto_27890 ?auto_27874 ) ) ( not ( = ?auto_27890 ?auto_27887 ) ) ( not ( = ?auto_27890 ?auto_27888 ) ) ( not ( = ?auto_27848 ?auto_27860 ) ) ( not ( = ?auto_27848 ?auto_27883 ) ) ( not ( = ?auto_27849 ?auto_27860 ) ) ( not ( = ?auto_27849 ?auto_27883 ) ) ( not ( = ?auto_27850 ?auto_27860 ) ) ( not ( = ?auto_27850 ?auto_27883 ) ) ( not ( = ?auto_27851 ?auto_27860 ) ) ( not ( = ?auto_27851 ?auto_27883 ) ) ( not ( = ?auto_27852 ?auto_27860 ) ) ( not ( = ?auto_27852 ?auto_27883 ) ) ( not ( = ?auto_27853 ?auto_27860 ) ) ( not ( = ?auto_27853 ?auto_27883 ) ) ( not ( = ?auto_27854 ?auto_27860 ) ) ( not ( = ?auto_27854 ?auto_27883 ) ) ( not ( = ?auto_27855 ?auto_27860 ) ) ( not ( = ?auto_27855 ?auto_27883 ) ) ( not ( = ?auto_27856 ?auto_27860 ) ) ( not ( = ?auto_27856 ?auto_27883 ) ) ( not ( = ?auto_27857 ?auto_27860 ) ) ( not ( = ?auto_27857 ?auto_27883 ) ) ( not ( = ?auto_27858 ?auto_27860 ) ) ( not ( = ?auto_27858 ?auto_27883 ) ) ( not ( = ?auto_27860 ?auto_27890 ) ) ( not ( = ?auto_27860 ?auto_27882 ) ) ( not ( = ?auto_27860 ?auto_27872 ) ) ( not ( = ?auto_27860 ?auto_27889 ) ) ( not ( = ?auto_27860 ?auto_27894 ) ) ( not ( = ?auto_27860 ?auto_27892 ) ) ( not ( = ?auto_27860 ?auto_27873 ) ) ( not ( = ?auto_27860 ?auto_27886 ) ) ( not ( = ?auto_27860 ?auto_27874 ) ) ( not ( = ?auto_27860 ?auto_27887 ) ) ( not ( = ?auto_27860 ?auto_27888 ) ) ( not ( = ?auto_27883 ?auto_27890 ) ) ( not ( = ?auto_27883 ?auto_27882 ) ) ( not ( = ?auto_27883 ?auto_27872 ) ) ( not ( = ?auto_27883 ?auto_27889 ) ) ( not ( = ?auto_27883 ?auto_27894 ) ) ( not ( = ?auto_27883 ?auto_27892 ) ) ( not ( = ?auto_27883 ?auto_27873 ) ) ( not ( = ?auto_27883 ?auto_27886 ) ) ( not ( = ?auto_27883 ?auto_27874 ) ) ( not ( = ?auto_27883 ?auto_27887 ) ) ( not ( = ?auto_27883 ?auto_27888 ) ) ( not ( = ?auto_27848 ?auto_27862 ) ) ( not ( = ?auto_27848 ?auto_27876 ) ) ( not ( = ?auto_27849 ?auto_27862 ) ) ( not ( = ?auto_27849 ?auto_27876 ) ) ( not ( = ?auto_27850 ?auto_27862 ) ) ( not ( = ?auto_27850 ?auto_27876 ) ) ( not ( = ?auto_27851 ?auto_27862 ) ) ( not ( = ?auto_27851 ?auto_27876 ) ) ( not ( = ?auto_27852 ?auto_27862 ) ) ( not ( = ?auto_27852 ?auto_27876 ) ) ( not ( = ?auto_27853 ?auto_27862 ) ) ( not ( = ?auto_27853 ?auto_27876 ) ) ( not ( = ?auto_27854 ?auto_27862 ) ) ( not ( = ?auto_27854 ?auto_27876 ) ) ( not ( = ?auto_27855 ?auto_27862 ) ) ( not ( = ?auto_27855 ?auto_27876 ) ) ( not ( = ?auto_27856 ?auto_27862 ) ) ( not ( = ?auto_27856 ?auto_27876 ) ) ( not ( = ?auto_27857 ?auto_27862 ) ) ( not ( = ?auto_27857 ?auto_27876 ) ) ( not ( = ?auto_27858 ?auto_27862 ) ) ( not ( = ?auto_27858 ?auto_27876 ) ) ( not ( = ?auto_27859 ?auto_27862 ) ) ( not ( = ?auto_27859 ?auto_27876 ) ) ( not ( = ?auto_27862 ?auto_27883 ) ) ( not ( = ?auto_27862 ?auto_27890 ) ) ( not ( = ?auto_27862 ?auto_27882 ) ) ( not ( = ?auto_27862 ?auto_27872 ) ) ( not ( = ?auto_27862 ?auto_27889 ) ) ( not ( = ?auto_27862 ?auto_27894 ) ) ( not ( = ?auto_27862 ?auto_27892 ) ) ( not ( = ?auto_27862 ?auto_27873 ) ) ( not ( = ?auto_27862 ?auto_27886 ) ) ( not ( = ?auto_27862 ?auto_27874 ) ) ( not ( = ?auto_27862 ?auto_27887 ) ) ( not ( = ?auto_27862 ?auto_27888 ) ) ( not ( = ?auto_27876 ?auto_27883 ) ) ( not ( = ?auto_27876 ?auto_27890 ) ) ( not ( = ?auto_27876 ?auto_27882 ) ) ( not ( = ?auto_27876 ?auto_27872 ) ) ( not ( = ?auto_27876 ?auto_27889 ) ) ( not ( = ?auto_27876 ?auto_27894 ) ) ( not ( = ?auto_27876 ?auto_27892 ) ) ( not ( = ?auto_27876 ?auto_27873 ) ) ( not ( = ?auto_27876 ?auto_27886 ) ) ( not ( = ?auto_27876 ?auto_27874 ) ) ( not ( = ?auto_27876 ?auto_27887 ) ) ( not ( = ?auto_27876 ?auto_27888 ) ) ( not ( = ?auto_27848 ?auto_27861 ) ) ( not ( = ?auto_27848 ?auto_27881 ) ) ( not ( = ?auto_27849 ?auto_27861 ) ) ( not ( = ?auto_27849 ?auto_27881 ) ) ( not ( = ?auto_27850 ?auto_27861 ) ) ( not ( = ?auto_27850 ?auto_27881 ) ) ( not ( = ?auto_27851 ?auto_27861 ) ) ( not ( = ?auto_27851 ?auto_27881 ) ) ( not ( = ?auto_27852 ?auto_27861 ) ) ( not ( = ?auto_27852 ?auto_27881 ) ) ( not ( = ?auto_27853 ?auto_27861 ) ) ( not ( = ?auto_27853 ?auto_27881 ) ) ( not ( = ?auto_27854 ?auto_27861 ) ) ( not ( = ?auto_27854 ?auto_27881 ) ) ( not ( = ?auto_27855 ?auto_27861 ) ) ( not ( = ?auto_27855 ?auto_27881 ) ) ( not ( = ?auto_27856 ?auto_27861 ) ) ( not ( = ?auto_27856 ?auto_27881 ) ) ( not ( = ?auto_27857 ?auto_27861 ) ) ( not ( = ?auto_27857 ?auto_27881 ) ) ( not ( = ?auto_27858 ?auto_27861 ) ) ( not ( = ?auto_27858 ?auto_27881 ) ) ( not ( = ?auto_27859 ?auto_27861 ) ) ( not ( = ?auto_27859 ?auto_27881 ) ) ( not ( = ?auto_27860 ?auto_27861 ) ) ( not ( = ?auto_27860 ?auto_27881 ) ) ( not ( = ?auto_27861 ?auto_27876 ) ) ( not ( = ?auto_27861 ?auto_27883 ) ) ( not ( = ?auto_27861 ?auto_27890 ) ) ( not ( = ?auto_27861 ?auto_27882 ) ) ( not ( = ?auto_27861 ?auto_27872 ) ) ( not ( = ?auto_27861 ?auto_27889 ) ) ( not ( = ?auto_27861 ?auto_27894 ) ) ( not ( = ?auto_27861 ?auto_27892 ) ) ( not ( = ?auto_27861 ?auto_27873 ) ) ( not ( = ?auto_27861 ?auto_27886 ) ) ( not ( = ?auto_27861 ?auto_27874 ) ) ( not ( = ?auto_27861 ?auto_27887 ) ) ( not ( = ?auto_27861 ?auto_27888 ) ) ( not ( = ?auto_27881 ?auto_27876 ) ) ( not ( = ?auto_27881 ?auto_27883 ) ) ( not ( = ?auto_27881 ?auto_27890 ) ) ( not ( = ?auto_27881 ?auto_27882 ) ) ( not ( = ?auto_27881 ?auto_27872 ) ) ( not ( = ?auto_27881 ?auto_27889 ) ) ( not ( = ?auto_27881 ?auto_27894 ) ) ( not ( = ?auto_27881 ?auto_27892 ) ) ( not ( = ?auto_27881 ?auto_27873 ) ) ( not ( = ?auto_27881 ?auto_27886 ) ) ( not ( = ?auto_27881 ?auto_27874 ) ) ( not ( = ?auto_27881 ?auto_27887 ) ) ( not ( = ?auto_27881 ?auto_27888 ) ) ( not ( = ?auto_27848 ?auto_27864 ) ) ( not ( = ?auto_27848 ?auto_27884 ) ) ( not ( = ?auto_27849 ?auto_27864 ) ) ( not ( = ?auto_27849 ?auto_27884 ) ) ( not ( = ?auto_27850 ?auto_27864 ) ) ( not ( = ?auto_27850 ?auto_27884 ) ) ( not ( = ?auto_27851 ?auto_27864 ) ) ( not ( = ?auto_27851 ?auto_27884 ) ) ( not ( = ?auto_27852 ?auto_27864 ) ) ( not ( = ?auto_27852 ?auto_27884 ) ) ( not ( = ?auto_27853 ?auto_27864 ) ) ( not ( = ?auto_27853 ?auto_27884 ) ) ( not ( = ?auto_27854 ?auto_27864 ) ) ( not ( = ?auto_27854 ?auto_27884 ) ) ( not ( = ?auto_27855 ?auto_27864 ) ) ( not ( = ?auto_27855 ?auto_27884 ) ) ( not ( = ?auto_27856 ?auto_27864 ) ) ( not ( = ?auto_27856 ?auto_27884 ) ) ( not ( = ?auto_27857 ?auto_27864 ) ) ( not ( = ?auto_27857 ?auto_27884 ) ) ( not ( = ?auto_27858 ?auto_27864 ) ) ( not ( = ?auto_27858 ?auto_27884 ) ) ( not ( = ?auto_27859 ?auto_27864 ) ) ( not ( = ?auto_27859 ?auto_27884 ) ) ( not ( = ?auto_27860 ?auto_27864 ) ) ( not ( = ?auto_27860 ?auto_27884 ) ) ( not ( = ?auto_27862 ?auto_27864 ) ) ( not ( = ?auto_27862 ?auto_27884 ) ) ( not ( = ?auto_27864 ?auto_27881 ) ) ( not ( = ?auto_27864 ?auto_27876 ) ) ( not ( = ?auto_27864 ?auto_27883 ) ) ( not ( = ?auto_27864 ?auto_27890 ) ) ( not ( = ?auto_27864 ?auto_27882 ) ) ( not ( = ?auto_27864 ?auto_27872 ) ) ( not ( = ?auto_27864 ?auto_27889 ) ) ( not ( = ?auto_27864 ?auto_27894 ) ) ( not ( = ?auto_27864 ?auto_27892 ) ) ( not ( = ?auto_27864 ?auto_27873 ) ) ( not ( = ?auto_27864 ?auto_27886 ) ) ( not ( = ?auto_27864 ?auto_27874 ) ) ( not ( = ?auto_27864 ?auto_27887 ) ) ( not ( = ?auto_27864 ?auto_27888 ) ) ( not ( = ?auto_27884 ?auto_27881 ) ) ( not ( = ?auto_27884 ?auto_27876 ) ) ( not ( = ?auto_27884 ?auto_27883 ) ) ( not ( = ?auto_27884 ?auto_27890 ) ) ( not ( = ?auto_27884 ?auto_27882 ) ) ( not ( = ?auto_27884 ?auto_27872 ) ) ( not ( = ?auto_27884 ?auto_27889 ) ) ( not ( = ?auto_27884 ?auto_27894 ) ) ( not ( = ?auto_27884 ?auto_27892 ) ) ( not ( = ?auto_27884 ?auto_27873 ) ) ( not ( = ?auto_27884 ?auto_27886 ) ) ( not ( = ?auto_27884 ?auto_27874 ) ) ( not ( = ?auto_27884 ?auto_27887 ) ) ( not ( = ?auto_27884 ?auto_27888 ) ) ( not ( = ?auto_27848 ?auto_27863 ) ) ( not ( = ?auto_27848 ?auto_27870 ) ) ( not ( = ?auto_27849 ?auto_27863 ) ) ( not ( = ?auto_27849 ?auto_27870 ) ) ( not ( = ?auto_27850 ?auto_27863 ) ) ( not ( = ?auto_27850 ?auto_27870 ) ) ( not ( = ?auto_27851 ?auto_27863 ) ) ( not ( = ?auto_27851 ?auto_27870 ) ) ( not ( = ?auto_27852 ?auto_27863 ) ) ( not ( = ?auto_27852 ?auto_27870 ) ) ( not ( = ?auto_27853 ?auto_27863 ) ) ( not ( = ?auto_27853 ?auto_27870 ) ) ( not ( = ?auto_27854 ?auto_27863 ) ) ( not ( = ?auto_27854 ?auto_27870 ) ) ( not ( = ?auto_27855 ?auto_27863 ) ) ( not ( = ?auto_27855 ?auto_27870 ) ) ( not ( = ?auto_27856 ?auto_27863 ) ) ( not ( = ?auto_27856 ?auto_27870 ) ) ( not ( = ?auto_27857 ?auto_27863 ) ) ( not ( = ?auto_27857 ?auto_27870 ) ) ( not ( = ?auto_27858 ?auto_27863 ) ) ( not ( = ?auto_27858 ?auto_27870 ) ) ( not ( = ?auto_27859 ?auto_27863 ) ) ( not ( = ?auto_27859 ?auto_27870 ) ) ( not ( = ?auto_27860 ?auto_27863 ) ) ( not ( = ?auto_27860 ?auto_27870 ) ) ( not ( = ?auto_27862 ?auto_27863 ) ) ( not ( = ?auto_27862 ?auto_27870 ) ) ( not ( = ?auto_27861 ?auto_27863 ) ) ( not ( = ?auto_27861 ?auto_27870 ) ) ( not ( = ?auto_27863 ?auto_27884 ) ) ( not ( = ?auto_27863 ?auto_27881 ) ) ( not ( = ?auto_27863 ?auto_27876 ) ) ( not ( = ?auto_27863 ?auto_27883 ) ) ( not ( = ?auto_27863 ?auto_27890 ) ) ( not ( = ?auto_27863 ?auto_27882 ) ) ( not ( = ?auto_27863 ?auto_27872 ) ) ( not ( = ?auto_27863 ?auto_27889 ) ) ( not ( = ?auto_27863 ?auto_27894 ) ) ( not ( = ?auto_27863 ?auto_27892 ) ) ( not ( = ?auto_27863 ?auto_27873 ) ) ( not ( = ?auto_27863 ?auto_27886 ) ) ( not ( = ?auto_27863 ?auto_27874 ) ) ( not ( = ?auto_27863 ?auto_27887 ) ) ( not ( = ?auto_27863 ?auto_27888 ) ) ( not ( = ?auto_27870 ?auto_27884 ) ) ( not ( = ?auto_27870 ?auto_27881 ) ) ( not ( = ?auto_27870 ?auto_27876 ) ) ( not ( = ?auto_27870 ?auto_27883 ) ) ( not ( = ?auto_27870 ?auto_27890 ) ) ( not ( = ?auto_27870 ?auto_27882 ) ) ( not ( = ?auto_27870 ?auto_27872 ) ) ( not ( = ?auto_27870 ?auto_27889 ) ) ( not ( = ?auto_27870 ?auto_27894 ) ) ( not ( = ?auto_27870 ?auto_27892 ) ) ( not ( = ?auto_27870 ?auto_27873 ) ) ( not ( = ?auto_27870 ?auto_27886 ) ) ( not ( = ?auto_27870 ?auto_27874 ) ) ( not ( = ?auto_27870 ?auto_27887 ) ) ( not ( = ?auto_27870 ?auto_27888 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_27848 ?auto_27849 ?auto_27850 ?auto_27851 ?auto_27852 ?auto_27853 ?auto_27854 ?auto_27855 ?auto_27856 ?auto_27857 ?auto_27858 ?auto_27859 ?auto_27860 ?auto_27862 ?auto_27861 ?auto_27864 )
      ( MAKE-1CRATE ?auto_27864 ?auto_27863 )
      ( MAKE-16CRATE-VERIFY ?auto_27848 ?auto_27849 ?auto_27850 ?auto_27851 ?auto_27852 ?auto_27853 ?auto_27854 ?auto_27855 ?auto_27856 ?auto_27857 ?auto_27858 ?auto_27859 ?auto_27860 ?auto_27862 ?auto_27861 ?auto_27864 ?auto_27863 ) )
  )

)

