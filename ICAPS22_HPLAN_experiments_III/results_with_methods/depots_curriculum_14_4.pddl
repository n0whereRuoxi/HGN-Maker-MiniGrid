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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19124 - SURFACE
      ?auto_19125 - SURFACE
    )
    :vars
    (
      ?auto_19126 - HOIST
      ?auto_19127 - PLACE
      ?auto_19129 - PLACE
      ?auto_19130 - HOIST
      ?auto_19131 - SURFACE
      ?auto_19128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19126 ?auto_19127 ) ( SURFACE-AT ?auto_19124 ?auto_19127 ) ( CLEAR ?auto_19124 ) ( IS-CRATE ?auto_19125 ) ( AVAILABLE ?auto_19126 ) ( not ( = ?auto_19129 ?auto_19127 ) ) ( HOIST-AT ?auto_19130 ?auto_19129 ) ( AVAILABLE ?auto_19130 ) ( SURFACE-AT ?auto_19125 ?auto_19129 ) ( ON ?auto_19125 ?auto_19131 ) ( CLEAR ?auto_19125 ) ( TRUCK-AT ?auto_19128 ?auto_19127 ) ( not ( = ?auto_19124 ?auto_19125 ) ) ( not ( = ?auto_19124 ?auto_19131 ) ) ( not ( = ?auto_19125 ?auto_19131 ) ) ( not ( = ?auto_19126 ?auto_19130 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19128 ?auto_19127 ?auto_19129 )
      ( !LIFT ?auto_19130 ?auto_19125 ?auto_19131 ?auto_19129 )
      ( !LOAD ?auto_19130 ?auto_19125 ?auto_19128 ?auto_19129 )
      ( !DRIVE ?auto_19128 ?auto_19129 ?auto_19127 )
      ( !UNLOAD ?auto_19126 ?auto_19125 ?auto_19128 ?auto_19127 )
      ( !DROP ?auto_19126 ?auto_19125 ?auto_19124 ?auto_19127 )
      ( MAKE-1CRATE-VERIFY ?auto_19124 ?auto_19125 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19134 - SURFACE
      ?auto_19135 - SURFACE
    )
    :vars
    (
      ?auto_19136 - HOIST
      ?auto_19137 - PLACE
      ?auto_19139 - PLACE
      ?auto_19140 - HOIST
      ?auto_19141 - SURFACE
      ?auto_19138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19136 ?auto_19137 ) ( SURFACE-AT ?auto_19134 ?auto_19137 ) ( CLEAR ?auto_19134 ) ( IS-CRATE ?auto_19135 ) ( AVAILABLE ?auto_19136 ) ( not ( = ?auto_19139 ?auto_19137 ) ) ( HOIST-AT ?auto_19140 ?auto_19139 ) ( AVAILABLE ?auto_19140 ) ( SURFACE-AT ?auto_19135 ?auto_19139 ) ( ON ?auto_19135 ?auto_19141 ) ( CLEAR ?auto_19135 ) ( TRUCK-AT ?auto_19138 ?auto_19137 ) ( not ( = ?auto_19134 ?auto_19135 ) ) ( not ( = ?auto_19134 ?auto_19141 ) ) ( not ( = ?auto_19135 ?auto_19141 ) ) ( not ( = ?auto_19136 ?auto_19140 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19138 ?auto_19137 ?auto_19139 )
      ( !LIFT ?auto_19140 ?auto_19135 ?auto_19141 ?auto_19139 )
      ( !LOAD ?auto_19140 ?auto_19135 ?auto_19138 ?auto_19139 )
      ( !DRIVE ?auto_19138 ?auto_19139 ?auto_19137 )
      ( !UNLOAD ?auto_19136 ?auto_19135 ?auto_19138 ?auto_19137 )
      ( !DROP ?auto_19136 ?auto_19135 ?auto_19134 ?auto_19137 )
      ( MAKE-1CRATE-VERIFY ?auto_19134 ?auto_19135 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19145 - SURFACE
      ?auto_19146 - SURFACE
      ?auto_19147 - SURFACE
    )
    :vars
    (
      ?auto_19148 - HOIST
      ?auto_19149 - PLACE
      ?auto_19151 - PLACE
      ?auto_19150 - HOIST
      ?auto_19152 - SURFACE
      ?auto_19155 - PLACE
      ?auto_19156 - HOIST
      ?auto_19154 - SURFACE
      ?auto_19153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19148 ?auto_19149 ) ( IS-CRATE ?auto_19147 ) ( not ( = ?auto_19151 ?auto_19149 ) ) ( HOIST-AT ?auto_19150 ?auto_19151 ) ( AVAILABLE ?auto_19150 ) ( SURFACE-AT ?auto_19147 ?auto_19151 ) ( ON ?auto_19147 ?auto_19152 ) ( CLEAR ?auto_19147 ) ( not ( = ?auto_19146 ?auto_19147 ) ) ( not ( = ?auto_19146 ?auto_19152 ) ) ( not ( = ?auto_19147 ?auto_19152 ) ) ( not ( = ?auto_19148 ?auto_19150 ) ) ( SURFACE-AT ?auto_19145 ?auto_19149 ) ( CLEAR ?auto_19145 ) ( IS-CRATE ?auto_19146 ) ( AVAILABLE ?auto_19148 ) ( not ( = ?auto_19155 ?auto_19149 ) ) ( HOIST-AT ?auto_19156 ?auto_19155 ) ( AVAILABLE ?auto_19156 ) ( SURFACE-AT ?auto_19146 ?auto_19155 ) ( ON ?auto_19146 ?auto_19154 ) ( CLEAR ?auto_19146 ) ( TRUCK-AT ?auto_19153 ?auto_19149 ) ( not ( = ?auto_19145 ?auto_19146 ) ) ( not ( = ?auto_19145 ?auto_19154 ) ) ( not ( = ?auto_19146 ?auto_19154 ) ) ( not ( = ?auto_19148 ?auto_19156 ) ) ( not ( = ?auto_19145 ?auto_19147 ) ) ( not ( = ?auto_19145 ?auto_19152 ) ) ( not ( = ?auto_19147 ?auto_19154 ) ) ( not ( = ?auto_19151 ?auto_19155 ) ) ( not ( = ?auto_19150 ?auto_19156 ) ) ( not ( = ?auto_19152 ?auto_19154 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19145 ?auto_19146 )
      ( MAKE-1CRATE ?auto_19146 ?auto_19147 )
      ( MAKE-2CRATE-VERIFY ?auto_19145 ?auto_19146 ?auto_19147 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19159 - SURFACE
      ?auto_19160 - SURFACE
    )
    :vars
    (
      ?auto_19161 - HOIST
      ?auto_19162 - PLACE
      ?auto_19164 - PLACE
      ?auto_19165 - HOIST
      ?auto_19166 - SURFACE
      ?auto_19163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19161 ?auto_19162 ) ( SURFACE-AT ?auto_19159 ?auto_19162 ) ( CLEAR ?auto_19159 ) ( IS-CRATE ?auto_19160 ) ( AVAILABLE ?auto_19161 ) ( not ( = ?auto_19164 ?auto_19162 ) ) ( HOIST-AT ?auto_19165 ?auto_19164 ) ( AVAILABLE ?auto_19165 ) ( SURFACE-AT ?auto_19160 ?auto_19164 ) ( ON ?auto_19160 ?auto_19166 ) ( CLEAR ?auto_19160 ) ( TRUCK-AT ?auto_19163 ?auto_19162 ) ( not ( = ?auto_19159 ?auto_19160 ) ) ( not ( = ?auto_19159 ?auto_19166 ) ) ( not ( = ?auto_19160 ?auto_19166 ) ) ( not ( = ?auto_19161 ?auto_19165 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19163 ?auto_19162 ?auto_19164 )
      ( !LIFT ?auto_19165 ?auto_19160 ?auto_19166 ?auto_19164 )
      ( !LOAD ?auto_19165 ?auto_19160 ?auto_19163 ?auto_19164 )
      ( !DRIVE ?auto_19163 ?auto_19164 ?auto_19162 )
      ( !UNLOAD ?auto_19161 ?auto_19160 ?auto_19163 ?auto_19162 )
      ( !DROP ?auto_19161 ?auto_19160 ?auto_19159 ?auto_19162 )
      ( MAKE-1CRATE-VERIFY ?auto_19159 ?auto_19160 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19171 - SURFACE
      ?auto_19172 - SURFACE
      ?auto_19173 - SURFACE
      ?auto_19174 - SURFACE
    )
    :vars
    (
      ?auto_19180 - HOIST
      ?auto_19178 - PLACE
      ?auto_19176 - PLACE
      ?auto_19175 - HOIST
      ?auto_19179 - SURFACE
      ?auto_19183 - PLACE
      ?auto_19186 - HOIST
      ?auto_19184 - SURFACE
      ?auto_19185 - PLACE
      ?auto_19182 - HOIST
      ?auto_19181 - SURFACE
      ?auto_19177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19180 ?auto_19178 ) ( IS-CRATE ?auto_19174 ) ( not ( = ?auto_19176 ?auto_19178 ) ) ( HOIST-AT ?auto_19175 ?auto_19176 ) ( AVAILABLE ?auto_19175 ) ( SURFACE-AT ?auto_19174 ?auto_19176 ) ( ON ?auto_19174 ?auto_19179 ) ( CLEAR ?auto_19174 ) ( not ( = ?auto_19173 ?auto_19174 ) ) ( not ( = ?auto_19173 ?auto_19179 ) ) ( not ( = ?auto_19174 ?auto_19179 ) ) ( not ( = ?auto_19180 ?auto_19175 ) ) ( IS-CRATE ?auto_19173 ) ( not ( = ?auto_19183 ?auto_19178 ) ) ( HOIST-AT ?auto_19186 ?auto_19183 ) ( AVAILABLE ?auto_19186 ) ( SURFACE-AT ?auto_19173 ?auto_19183 ) ( ON ?auto_19173 ?auto_19184 ) ( CLEAR ?auto_19173 ) ( not ( = ?auto_19172 ?auto_19173 ) ) ( not ( = ?auto_19172 ?auto_19184 ) ) ( not ( = ?auto_19173 ?auto_19184 ) ) ( not ( = ?auto_19180 ?auto_19186 ) ) ( SURFACE-AT ?auto_19171 ?auto_19178 ) ( CLEAR ?auto_19171 ) ( IS-CRATE ?auto_19172 ) ( AVAILABLE ?auto_19180 ) ( not ( = ?auto_19185 ?auto_19178 ) ) ( HOIST-AT ?auto_19182 ?auto_19185 ) ( AVAILABLE ?auto_19182 ) ( SURFACE-AT ?auto_19172 ?auto_19185 ) ( ON ?auto_19172 ?auto_19181 ) ( CLEAR ?auto_19172 ) ( TRUCK-AT ?auto_19177 ?auto_19178 ) ( not ( = ?auto_19171 ?auto_19172 ) ) ( not ( = ?auto_19171 ?auto_19181 ) ) ( not ( = ?auto_19172 ?auto_19181 ) ) ( not ( = ?auto_19180 ?auto_19182 ) ) ( not ( = ?auto_19171 ?auto_19173 ) ) ( not ( = ?auto_19171 ?auto_19184 ) ) ( not ( = ?auto_19173 ?auto_19181 ) ) ( not ( = ?auto_19183 ?auto_19185 ) ) ( not ( = ?auto_19186 ?auto_19182 ) ) ( not ( = ?auto_19184 ?auto_19181 ) ) ( not ( = ?auto_19171 ?auto_19174 ) ) ( not ( = ?auto_19171 ?auto_19179 ) ) ( not ( = ?auto_19172 ?auto_19174 ) ) ( not ( = ?auto_19172 ?auto_19179 ) ) ( not ( = ?auto_19174 ?auto_19184 ) ) ( not ( = ?auto_19174 ?auto_19181 ) ) ( not ( = ?auto_19176 ?auto_19183 ) ) ( not ( = ?auto_19176 ?auto_19185 ) ) ( not ( = ?auto_19175 ?auto_19186 ) ) ( not ( = ?auto_19175 ?auto_19182 ) ) ( not ( = ?auto_19179 ?auto_19184 ) ) ( not ( = ?auto_19179 ?auto_19181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19171 ?auto_19172 ?auto_19173 )
      ( MAKE-1CRATE ?auto_19173 ?auto_19174 )
      ( MAKE-3CRATE-VERIFY ?auto_19171 ?auto_19172 ?auto_19173 ?auto_19174 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19189 - SURFACE
      ?auto_19190 - SURFACE
    )
    :vars
    (
      ?auto_19191 - HOIST
      ?auto_19192 - PLACE
      ?auto_19194 - PLACE
      ?auto_19195 - HOIST
      ?auto_19196 - SURFACE
      ?auto_19193 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19191 ?auto_19192 ) ( SURFACE-AT ?auto_19189 ?auto_19192 ) ( CLEAR ?auto_19189 ) ( IS-CRATE ?auto_19190 ) ( AVAILABLE ?auto_19191 ) ( not ( = ?auto_19194 ?auto_19192 ) ) ( HOIST-AT ?auto_19195 ?auto_19194 ) ( AVAILABLE ?auto_19195 ) ( SURFACE-AT ?auto_19190 ?auto_19194 ) ( ON ?auto_19190 ?auto_19196 ) ( CLEAR ?auto_19190 ) ( TRUCK-AT ?auto_19193 ?auto_19192 ) ( not ( = ?auto_19189 ?auto_19190 ) ) ( not ( = ?auto_19189 ?auto_19196 ) ) ( not ( = ?auto_19190 ?auto_19196 ) ) ( not ( = ?auto_19191 ?auto_19195 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19193 ?auto_19192 ?auto_19194 )
      ( !LIFT ?auto_19195 ?auto_19190 ?auto_19196 ?auto_19194 )
      ( !LOAD ?auto_19195 ?auto_19190 ?auto_19193 ?auto_19194 )
      ( !DRIVE ?auto_19193 ?auto_19194 ?auto_19192 )
      ( !UNLOAD ?auto_19191 ?auto_19190 ?auto_19193 ?auto_19192 )
      ( !DROP ?auto_19191 ?auto_19190 ?auto_19189 ?auto_19192 )
      ( MAKE-1CRATE-VERIFY ?auto_19189 ?auto_19190 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19202 - SURFACE
      ?auto_19203 - SURFACE
      ?auto_19204 - SURFACE
      ?auto_19205 - SURFACE
      ?auto_19206 - SURFACE
    )
    :vars
    (
      ?auto_19208 - HOIST
      ?auto_19210 - PLACE
      ?auto_19212 - PLACE
      ?auto_19207 - HOIST
      ?auto_19209 - SURFACE
      ?auto_19214 - PLACE
      ?auto_19215 - HOIST
      ?auto_19216 - SURFACE
      ?auto_19218 - PLACE
      ?auto_19220 - HOIST
      ?auto_19221 - SURFACE
      ?auto_19217 - PLACE
      ?auto_19219 - HOIST
      ?auto_19213 - SURFACE
      ?auto_19211 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19208 ?auto_19210 ) ( IS-CRATE ?auto_19206 ) ( not ( = ?auto_19212 ?auto_19210 ) ) ( HOIST-AT ?auto_19207 ?auto_19212 ) ( AVAILABLE ?auto_19207 ) ( SURFACE-AT ?auto_19206 ?auto_19212 ) ( ON ?auto_19206 ?auto_19209 ) ( CLEAR ?auto_19206 ) ( not ( = ?auto_19205 ?auto_19206 ) ) ( not ( = ?auto_19205 ?auto_19209 ) ) ( not ( = ?auto_19206 ?auto_19209 ) ) ( not ( = ?auto_19208 ?auto_19207 ) ) ( IS-CRATE ?auto_19205 ) ( not ( = ?auto_19214 ?auto_19210 ) ) ( HOIST-AT ?auto_19215 ?auto_19214 ) ( AVAILABLE ?auto_19215 ) ( SURFACE-AT ?auto_19205 ?auto_19214 ) ( ON ?auto_19205 ?auto_19216 ) ( CLEAR ?auto_19205 ) ( not ( = ?auto_19204 ?auto_19205 ) ) ( not ( = ?auto_19204 ?auto_19216 ) ) ( not ( = ?auto_19205 ?auto_19216 ) ) ( not ( = ?auto_19208 ?auto_19215 ) ) ( IS-CRATE ?auto_19204 ) ( not ( = ?auto_19218 ?auto_19210 ) ) ( HOIST-AT ?auto_19220 ?auto_19218 ) ( AVAILABLE ?auto_19220 ) ( SURFACE-AT ?auto_19204 ?auto_19218 ) ( ON ?auto_19204 ?auto_19221 ) ( CLEAR ?auto_19204 ) ( not ( = ?auto_19203 ?auto_19204 ) ) ( not ( = ?auto_19203 ?auto_19221 ) ) ( not ( = ?auto_19204 ?auto_19221 ) ) ( not ( = ?auto_19208 ?auto_19220 ) ) ( SURFACE-AT ?auto_19202 ?auto_19210 ) ( CLEAR ?auto_19202 ) ( IS-CRATE ?auto_19203 ) ( AVAILABLE ?auto_19208 ) ( not ( = ?auto_19217 ?auto_19210 ) ) ( HOIST-AT ?auto_19219 ?auto_19217 ) ( AVAILABLE ?auto_19219 ) ( SURFACE-AT ?auto_19203 ?auto_19217 ) ( ON ?auto_19203 ?auto_19213 ) ( CLEAR ?auto_19203 ) ( TRUCK-AT ?auto_19211 ?auto_19210 ) ( not ( = ?auto_19202 ?auto_19203 ) ) ( not ( = ?auto_19202 ?auto_19213 ) ) ( not ( = ?auto_19203 ?auto_19213 ) ) ( not ( = ?auto_19208 ?auto_19219 ) ) ( not ( = ?auto_19202 ?auto_19204 ) ) ( not ( = ?auto_19202 ?auto_19221 ) ) ( not ( = ?auto_19204 ?auto_19213 ) ) ( not ( = ?auto_19218 ?auto_19217 ) ) ( not ( = ?auto_19220 ?auto_19219 ) ) ( not ( = ?auto_19221 ?auto_19213 ) ) ( not ( = ?auto_19202 ?auto_19205 ) ) ( not ( = ?auto_19202 ?auto_19216 ) ) ( not ( = ?auto_19203 ?auto_19205 ) ) ( not ( = ?auto_19203 ?auto_19216 ) ) ( not ( = ?auto_19205 ?auto_19221 ) ) ( not ( = ?auto_19205 ?auto_19213 ) ) ( not ( = ?auto_19214 ?auto_19218 ) ) ( not ( = ?auto_19214 ?auto_19217 ) ) ( not ( = ?auto_19215 ?auto_19220 ) ) ( not ( = ?auto_19215 ?auto_19219 ) ) ( not ( = ?auto_19216 ?auto_19221 ) ) ( not ( = ?auto_19216 ?auto_19213 ) ) ( not ( = ?auto_19202 ?auto_19206 ) ) ( not ( = ?auto_19202 ?auto_19209 ) ) ( not ( = ?auto_19203 ?auto_19206 ) ) ( not ( = ?auto_19203 ?auto_19209 ) ) ( not ( = ?auto_19204 ?auto_19206 ) ) ( not ( = ?auto_19204 ?auto_19209 ) ) ( not ( = ?auto_19206 ?auto_19216 ) ) ( not ( = ?auto_19206 ?auto_19221 ) ) ( not ( = ?auto_19206 ?auto_19213 ) ) ( not ( = ?auto_19212 ?auto_19214 ) ) ( not ( = ?auto_19212 ?auto_19218 ) ) ( not ( = ?auto_19212 ?auto_19217 ) ) ( not ( = ?auto_19207 ?auto_19215 ) ) ( not ( = ?auto_19207 ?auto_19220 ) ) ( not ( = ?auto_19207 ?auto_19219 ) ) ( not ( = ?auto_19209 ?auto_19216 ) ) ( not ( = ?auto_19209 ?auto_19221 ) ) ( not ( = ?auto_19209 ?auto_19213 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_19202 ?auto_19203 ?auto_19204 ?auto_19205 )
      ( MAKE-1CRATE ?auto_19205 ?auto_19206 )
      ( MAKE-4CRATE-VERIFY ?auto_19202 ?auto_19203 ?auto_19204 ?auto_19205 ?auto_19206 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19224 - SURFACE
      ?auto_19225 - SURFACE
    )
    :vars
    (
      ?auto_19226 - HOIST
      ?auto_19227 - PLACE
      ?auto_19229 - PLACE
      ?auto_19230 - HOIST
      ?auto_19231 - SURFACE
      ?auto_19228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19226 ?auto_19227 ) ( SURFACE-AT ?auto_19224 ?auto_19227 ) ( CLEAR ?auto_19224 ) ( IS-CRATE ?auto_19225 ) ( AVAILABLE ?auto_19226 ) ( not ( = ?auto_19229 ?auto_19227 ) ) ( HOIST-AT ?auto_19230 ?auto_19229 ) ( AVAILABLE ?auto_19230 ) ( SURFACE-AT ?auto_19225 ?auto_19229 ) ( ON ?auto_19225 ?auto_19231 ) ( CLEAR ?auto_19225 ) ( TRUCK-AT ?auto_19228 ?auto_19227 ) ( not ( = ?auto_19224 ?auto_19225 ) ) ( not ( = ?auto_19224 ?auto_19231 ) ) ( not ( = ?auto_19225 ?auto_19231 ) ) ( not ( = ?auto_19226 ?auto_19230 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19228 ?auto_19227 ?auto_19229 )
      ( !LIFT ?auto_19230 ?auto_19225 ?auto_19231 ?auto_19229 )
      ( !LOAD ?auto_19230 ?auto_19225 ?auto_19228 ?auto_19229 )
      ( !DRIVE ?auto_19228 ?auto_19229 ?auto_19227 )
      ( !UNLOAD ?auto_19226 ?auto_19225 ?auto_19228 ?auto_19227 )
      ( !DROP ?auto_19226 ?auto_19225 ?auto_19224 ?auto_19227 )
      ( MAKE-1CRATE-VERIFY ?auto_19224 ?auto_19225 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19238 - SURFACE
      ?auto_19239 - SURFACE
      ?auto_19240 - SURFACE
      ?auto_19241 - SURFACE
      ?auto_19242 - SURFACE
      ?auto_19243 - SURFACE
    )
    :vars
    (
      ?auto_19247 - HOIST
      ?auto_19248 - PLACE
      ?auto_19245 - PLACE
      ?auto_19244 - HOIST
      ?auto_19246 - SURFACE
      ?auto_19250 - PLACE
      ?auto_19251 - HOIST
      ?auto_19257 - SURFACE
      ?auto_19252 - PLACE
      ?auto_19260 - HOIST
      ?auto_19258 - SURFACE
      ?auto_19261 - PLACE
      ?auto_19256 - HOIST
      ?auto_19255 - SURFACE
      ?auto_19259 - PLACE
      ?auto_19253 - HOIST
      ?auto_19254 - SURFACE
      ?auto_19249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19247 ?auto_19248 ) ( IS-CRATE ?auto_19243 ) ( not ( = ?auto_19245 ?auto_19248 ) ) ( HOIST-AT ?auto_19244 ?auto_19245 ) ( AVAILABLE ?auto_19244 ) ( SURFACE-AT ?auto_19243 ?auto_19245 ) ( ON ?auto_19243 ?auto_19246 ) ( CLEAR ?auto_19243 ) ( not ( = ?auto_19242 ?auto_19243 ) ) ( not ( = ?auto_19242 ?auto_19246 ) ) ( not ( = ?auto_19243 ?auto_19246 ) ) ( not ( = ?auto_19247 ?auto_19244 ) ) ( IS-CRATE ?auto_19242 ) ( not ( = ?auto_19250 ?auto_19248 ) ) ( HOIST-AT ?auto_19251 ?auto_19250 ) ( AVAILABLE ?auto_19251 ) ( SURFACE-AT ?auto_19242 ?auto_19250 ) ( ON ?auto_19242 ?auto_19257 ) ( CLEAR ?auto_19242 ) ( not ( = ?auto_19241 ?auto_19242 ) ) ( not ( = ?auto_19241 ?auto_19257 ) ) ( not ( = ?auto_19242 ?auto_19257 ) ) ( not ( = ?auto_19247 ?auto_19251 ) ) ( IS-CRATE ?auto_19241 ) ( not ( = ?auto_19252 ?auto_19248 ) ) ( HOIST-AT ?auto_19260 ?auto_19252 ) ( AVAILABLE ?auto_19260 ) ( SURFACE-AT ?auto_19241 ?auto_19252 ) ( ON ?auto_19241 ?auto_19258 ) ( CLEAR ?auto_19241 ) ( not ( = ?auto_19240 ?auto_19241 ) ) ( not ( = ?auto_19240 ?auto_19258 ) ) ( not ( = ?auto_19241 ?auto_19258 ) ) ( not ( = ?auto_19247 ?auto_19260 ) ) ( IS-CRATE ?auto_19240 ) ( not ( = ?auto_19261 ?auto_19248 ) ) ( HOIST-AT ?auto_19256 ?auto_19261 ) ( AVAILABLE ?auto_19256 ) ( SURFACE-AT ?auto_19240 ?auto_19261 ) ( ON ?auto_19240 ?auto_19255 ) ( CLEAR ?auto_19240 ) ( not ( = ?auto_19239 ?auto_19240 ) ) ( not ( = ?auto_19239 ?auto_19255 ) ) ( not ( = ?auto_19240 ?auto_19255 ) ) ( not ( = ?auto_19247 ?auto_19256 ) ) ( SURFACE-AT ?auto_19238 ?auto_19248 ) ( CLEAR ?auto_19238 ) ( IS-CRATE ?auto_19239 ) ( AVAILABLE ?auto_19247 ) ( not ( = ?auto_19259 ?auto_19248 ) ) ( HOIST-AT ?auto_19253 ?auto_19259 ) ( AVAILABLE ?auto_19253 ) ( SURFACE-AT ?auto_19239 ?auto_19259 ) ( ON ?auto_19239 ?auto_19254 ) ( CLEAR ?auto_19239 ) ( TRUCK-AT ?auto_19249 ?auto_19248 ) ( not ( = ?auto_19238 ?auto_19239 ) ) ( not ( = ?auto_19238 ?auto_19254 ) ) ( not ( = ?auto_19239 ?auto_19254 ) ) ( not ( = ?auto_19247 ?auto_19253 ) ) ( not ( = ?auto_19238 ?auto_19240 ) ) ( not ( = ?auto_19238 ?auto_19255 ) ) ( not ( = ?auto_19240 ?auto_19254 ) ) ( not ( = ?auto_19261 ?auto_19259 ) ) ( not ( = ?auto_19256 ?auto_19253 ) ) ( not ( = ?auto_19255 ?auto_19254 ) ) ( not ( = ?auto_19238 ?auto_19241 ) ) ( not ( = ?auto_19238 ?auto_19258 ) ) ( not ( = ?auto_19239 ?auto_19241 ) ) ( not ( = ?auto_19239 ?auto_19258 ) ) ( not ( = ?auto_19241 ?auto_19255 ) ) ( not ( = ?auto_19241 ?auto_19254 ) ) ( not ( = ?auto_19252 ?auto_19261 ) ) ( not ( = ?auto_19252 ?auto_19259 ) ) ( not ( = ?auto_19260 ?auto_19256 ) ) ( not ( = ?auto_19260 ?auto_19253 ) ) ( not ( = ?auto_19258 ?auto_19255 ) ) ( not ( = ?auto_19258 ?auto_19254 ) ) ( not ( = ?auto_19238 ?auto_19242 ) ) ( not ( = ?auto_19238 ?auto_19257 ) ) ( not ( = ?auto_19239 ?auto_19242 ) ) ( not ( = ?auto_19239 ?auto_19257 ) ) ( not ( = ?auto_19240 ?auto_19242 ) ) ( not ( = ?auto_19240 ?auto_19257 ) ) ( not ( = ?auto_19242 ?auto_19258 ) ) ( not ( = ?auto_19242 ?auto_19255 ) ) ( not ( = ?auto_19242 ?auto_19254 ) ) ( not ( = ?auto_19250 ?auto_19252 ) ) ( not ( = ?auto_19250 ?auto_19261 ) ) ( not ( = ?auto_19250 ?auto_19259 ) ) ( not ( = ?auto_19251 ?auto_19260 ) ) ( not ( = ?auto_19251 ?auto_19256 ) ) ( not ( = ?auto_19251 ?auto_19253 ) ) ( not ( = ?auto_19257 ?auto_19258 ) ) ( not ( = ?auto_19257 ?auto_19255 ) ) ( not ( = ?auto_19257 ?auto_19254 ) ) ( not ( = ?auto_19238 ?auto_19243 ) ) ( not ( = ?auto_19238 ?auto_19246 ) ) ( not ( = ?auto_19239 ?auto_19243 ) ) ( not ( = ?auto_19239 ?auto_19246 ) ) ( not ( = ?auto_19240 ?auto_19243 ) ) ( not ( = ?auto_19240 ?auto_19246 ) ) ( not ( = ?auto_19241 ?auto_19243 ) ) ( not ( = ?auto_19241 ?auto_19246 ) ) ( not ( = ?auto_19243 ?auto_19257 ) ) ( not ( = ?auto_19243 ?auto_19258 ) ) ( not ( = ?auto_19243 ?auto_19255 ) ) ( not ( = ?auto_19243 ?auto_19254 ) ) ( not ( = ?auto_19245 ?auto_19250 ) ) ( not ( = ?auto_19245 ?auto_19252 ) ) ( not ( = ?auto_19245 ?auto_19261 ) ) ( not ( = ?auto_19245 ?auto_19259 ) ) ( not ( = ?auto_19244 ?auto_19251 ) ) ( not ( = ?auto_19244 ?auto_19260 ) ) ( not ( = ?auto_19244 ?auto_19256 ) ) ( not ( = ?auto_19244 ?auto_19253 ) ) ( not ( = ?auto_19246 ?auto_19257 ) ) ( not ( = ?auto_19246 ?auto_19258 ) ) ( not ( = ?auto_19246 ?auto_19255 ) ) ( not ( = ?auto_19246 ?auto_19254 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_19238 ?auto_19239 ?auto_19240 ?auto_19241 ?auto_19242 )
      ( MAKE-1CRATE ?auto_19242 ?auto_19243 )
      ( MAKE-5CRATE-VERIFY ?auto_19238 ?auto_19239 ?auto_19240 ?auto_19241 ?auto_19242 ?auto_19243 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19264 - SURFACE
      ?auto_19265 - SURFACE
    )
    :vars
    (
      ?auto_19266 - HOIST
      ?auto_19267 - PLACE
      ?auto_19269 - PLACE
      ?auto_19270 - HOIST
      ?auto_19271 - SURFACE
      ?auto_19268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19266 ?auto_19267 ) ( SURFACE-AT ?auto_19264 ?auto_19267 ) ( CLEAR ?auto_19264 ) ( IS-CRATE ?auto_19265 ) ( AVAILABLE ?auto_19266 ) ( not ( = ?auto_19269 ?auto_19267 ) ) ( HOIST-AT ?auto_19270 ?auto_19269 ) ( AVAILABLE ?auto_19270 ) ( SURFACE-AT ?auto_19265 ?auto_19269 ) ( ON ?auto_19265 ?auto_19271 ) ( CLEAR ?auto_19265 ) ( TRUCK-AT ?auto_19268 ?auto_19267 ) ( not ( = ?auto_19264 ?auto_19265 ) ) ( not ( = ?auto_19264 ?auto_19271 ) ) ( not ( = ?auto_19265 ?auto_19271 ) ) ( not ( = ?auto_19266 ?auto_19270 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19268 ?auto_19267 ?auto_19269 )
      ( !LIFT ?auto_19270 ?auto_19265 ?auto_19271 ?auto_19269 )
      ( !LOAD ?auto_19270 ?auto_19265 ?auto_19268 ?auto_19269 )
      ( !DRIVE ?auto_19268 ?auto_19269 ?auto_19267 )
      ( !UNLOAD ?auto_19266 ?auto_19265 ?auto_19268 ?auto_19267 )
      ( !DROP ?auto_19266 ?auto_19265 ?auto_19264 ?auto_19267 )
      ( MAKE-1CRATE-VERIFY ?auto_19264 ?auto_19265 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_19279 - SURFACE
      ?auto_19280 - SURFACE
      ?auto_19281 - SURFACE
      ?auto_19282 - SURFACE
      ?auto_19283 - SURFACE
      ?auto_19284 - SURFACE
      ?auto_19285 - SURFACE
    )
    :vars
    (
      ?auto_19288 - HOIST
      ?auto_19291 - PLACE
      ?auto_19290 - PLACE
      ?auto_19286 - HOIST
      ?auto_19287 - SURFACE
      ?auto_19295 - PLACE
      ?auto_19294 - HOIST
      ?auto_19298 - SURFACE
      ?auto_19301 - PLACE
      ?auto_19299 - HOIST
      ?auto_19303 - SURFACE
      ?auto_19300 - PLACE
      ?auto_19302 - HOIST
      ?auto_19292 - SURFACE
      ?auto_19304 - PLACE
      ?auto_19305 - HOIST
      ?auto_19306 - SURFACE
      ?auto_19297 - PLACE
      ?auto_19296 - HOIST
      ?auto_19293 - SURFACE
      ?auto_19289 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19288 ?auto_19291 ) ( IS-CRATE ?auto_19285 ) ( not ( = ?auto_19290 ?auto_19291 ) ) ( HOIST-AT ?auto_19286 ?auto_19290 ) ( AVAILABLE ?auto_19286 ) ( SURFACE-AT ?auto_19285 ?auto_19290 ) ( ON ?auto_19285 ?auto_19287 ) ( CLEAR ?auto_19285 ) ( not ( = ?auto_19284 ?auto_19285 ) ) ( not ( = ?auto_19284 ?auto_19287 ) ) ( not ( = ?auto_19285 ?auto_19287 ) ) ( not ( = ?auto_19288 ?auto_19286 ) ) ( IS-CRATE ?auto_19284 ) ( not ( = ?auto_19295 ?auto_19291 ) ) ( HOIST-AT ?auto_19294 ?auto_19295 ) ( AVAILABLE ?auto_19294 ) ( SURFACE-AT ?auto_19284 ?auto_19295 ) ( ON ?auto_19284 ?auto_19298 ) ( CLEAR ?auto_19284 ) ( not ( = ?auto_19283 ?auto_19284 ) ) ( not ( = ?auto_19283 ?auto_19298 ) ) ( not ( = ?auto_19284 ?auto_19298 ) ) ( not ( = ?auto_19288 ?auto_19294 ) ) ( IS-CRATE ?auto_19283 ) ( not ( = ?auto_19301 ?auto_19291 ) ) ( HOIST-AT ?auto_19299 ?auto_19301 ) ( AVAILABLE ?auto_19299 ) ( SURFACE-AT ?auto_19283 ?auto_19301 ) ( ON ?auto_19283 ?auto_19303 ) ( CLEAR ?auto_19283 ) ( not ( = ?auto_19282 ?auto_19283 ) ) ( not ( = ?auto_19282 ?auto_19303 ) ) ( not ( = ?auto_19283 ?auto_19303 ) ) ( not ( = ?auto_19288 ?auto_19299 ) ) ( IS-CRATE ?auto_19282 ) ( not ( = ?auto_19300 ?auto_19291 ) ) ( HOIST-AT ?auto_19302 ?auto_19300 ) ( AVAILABLE ?auto_19302 ) ( SURFACE-AT ?auto_19282 ?auto_19300 ) ( ON ?auto_19282 ?auto_19292 ) ( CLEAR ?auto_19282 ) ( not ( = ?auto_19281 ?auto_19282 ) ) ( not ( = ?auto_19281 ?auto_19292 ) ) ( not ( = ?auto_19282 ?auto_19292 ) ) ( not ( = ?auto_19288 ?auto_19302 ) ) ( IS-CRATE ?auto_19281 ) ( not ( = ?auto_19304 ?auto_19291 ) ) ( HOIST-AT ?auto_19305 ?auto_19304 ) ( AVAILABLE ?auto_19305 ) ( SURFACE-AT ?auto_19281 ?auto_19304 ) ( ON ?auto_19281 ?auto_19306 ) ( CLEAR ?auto_19281 ) ( not ( = ?auto_19280 ?auto_19281 ) ) ( not ( = ?auto_19280 ?auto_19306 ) ) ( not ( = ?auto_19281 ?auto_19306 ) ) ( not ( = ?auto_19288 ?auto_19305 ) ) ( SURFACE-AT ?auto_19279 ?auto_19291 ) ( CLEAR ?auto_19279 ) ( IS-CRATE ?auto_19280 ) ( AVAILABLE ?auto_19288 ) ( not ( = ?auto_19297 ?auto_19291 ) ) ( HOIST-AT ?auto_19296 ?auto_19297 ) ( AVAILABLE ?auto_19296 ) ( SURFACE-AT ?auto_19280 ?auto_19297 ) ( ON ?auto_19280 ?auto_19293 ) ( CLEAR ?auto_19280 ) ( TRUCK-AT ?auto_19289 ?auto_19291 ) ( not ( = ?auto_19279 ?auto_19280 ) ) ( not ( = ?auto_19279 ?auto_19293 ) ) ( not ( = ?auto_19280 ?auto_19293 ) ) ( not ( = ?auto_19288 ?auto_19296 ) ) ( not ( = ?auto_19279 ?auto_19281 ) ) ( not ( = ?auto_19279 ?auto_19306 ) ) ( not ( = ?auto_19281 ?auto_19293 ) ) ( not ( = ?auto_19304 ?auto_19297 ) ) ( not ( = ?auto_19305 ?auto_19296 ) ) ( not ( = ?auto_19306 ?auto_19293 ) ) ( not ( = ?auto_19279 ?auto_19282 ) ) ( not ( = ?auto_19279 ?auto_19292 ) ) ( not ( = ?auto_19280 ?auto_19282 ) ) ( not ( = ?auto_19280 ?auto_19292 ) ) ( not ( = ?auto_19282 ?auto_19306 ) ) ( not ( = ?auto_19282 ?auto_19293 ) ) ( not ( = ?auto_19300 ?auto_19304 ) ) ( not ( = ?auto_19300 ?auto_19297 ) ) ( not ( = ?auto_19302 ?auto_19305 ) ) ( not ( = ?auto_19302 ?auto_19296 ) ) ( not ( = ?auto_19292 ?auto_19306 ) ) ( not ( = ?auto_19292 ?auto_19293 ) ) ( not ( = ?auto_19279 ?auto_19283 ) ) ( not ( = ?auto_19279 ?auto_19303 ) ) ( not ( = ?auto_19280 ?auto_19283 ) ) ( not ( = ?auto_19280 ?auto_19303 ) ) ( not ( = ?auto_19281 ?auto_19283 ) ) ( not ( = ?auto_19281 ?auto_19303 ) ) ( not ( = ?auto_19283 ?auto_19292 ) ) ( not ( = ?auto_19283 ?auto_19306 ) ) ( not ( = ?auto_19283 ?auto_19293 ) ) ( not ( = ?auto_19301 ?auto_19300 ) ) ( not ( = ?auto_19301 ?auto_19304 ) ) ( not ( = ?auto_19301 ?auto_19297 ) ) ( not ( = ?auto_19299 ?auto_19302 ) ) ( not ( = ?auto_19299 ?auto_19305 ) ) ( not ( = ?auto_19299 ?auto_19296 ) ) ( not ( = ?auto_19303 ?auto_19292 ) ) ( not ( = ?auto_19303 ?auto_19306 ) ) ( not ( = ?auto_19303 ?auto_19293 ) ) ( not ( = ?auto_19279 ?auto_19284 ) ) ( not ( = ?auto_19279 ?auto_19298 ) ) ( not ( = ?auto_19280 ?auto_19284 ) ) ( not ( = ?auto_19280 ?auto_19298 ) ) ( not ( = ?auto_19281 ?auto_19284 ) ) ( not ( = ?auto_19281 ?auto_19298 ) ) ( not ( = ?auto_19282 ?auto_19284 ) ) ( not ( = ?auto_19282 ?auto_19298 ) ) ( not ( = ?auto_19284 ?auto_19303 ) ) ( not ( = ?auto_19284 ?auto_19292 ) ) ( not ( = ?auto_19284 ?auto_19306 ) ) ( not ( = ?auto_19284 ?auto_19293 ) ) ( not ( = ?auto_19295 ?auto_19301 ) ) ( not ( = ?auto_19295 ?auto_19300 ) ) ( not ( = ?auto_19295 ?auto_19304 ) ) ( not ( = ?auto_19295 ?auto_19297 ) ) ( not ( = ?auto_19294 ?auto_19299 ) ) ( not ( = ?auto_19294 ?auto_19302 ) ) ( not ( = ?auto_19294 ?auto_19305 ) ) ( not ( = ?auto_19294 ?auto_19296 ) ) ( not ( = ?auto_19298 ?auto_19303 ) ) ( not ( = ?auto_19298 ?auto_19292 ) ) ( not ( = ?auto_19298 ?auto_19306 ) ) ( not ( = ?auto_19298 ?auto_19293 ) ) ( not ( = ?auto_19279 ?auto_19285 ) ) ( not ( = ?auto_19279 ?auto_19287 ) ) ( not ( = ?auto_19280 ?auto_19285 ) ) ( not ( = ?auto_19280 ?auto_19287 ) ) ( not ( = ?auto_19281 ?auto_19285 ) ) ( not ( = ?auto_19281 ?auto_19287 ) ) ( not ( = ?auto_19282 ?auto_19285 ) ) ( not ( = ?auto_19282 ?auto_19287 ) ) ( not ( = ?auto_19283 ?auto_19285 ) ) ( not ( = ?auto_19283 ?auto_19287 ) ) ( not ( = ?auto_19285 ?auto_19298 ) ) ( not ( = ?auto_19285 ?auto_19303 ) ) ( not ( = ?auto_19285 ?auto_19292 ) ) ( not ( = ?auto_19285 ?auto_19306 ) ) ( not ( = ?auto_19285 ?auto_19293 ) ) ( not ( = ?auto_19290 ?auto_19295 ) ) ( not ( = ?auto_19290 ?auto_19301 ) ) ( not ( = ?auto_19290 ?auto_19300 ) ) ( not ( = ?auto_19290 ?auto_19304 ) ) ( not ( = ?auto_19290 ?auto_19297 ) ) ( not ( = ?auto_19286 ?auto_19294 ) ) ( not ( = ?auto_19286 ?auto_19299 ) ) ( not ( = ?auto_19286 ?auto_19302 ) ) ( not ( = ?auto_19286 ?auto_19305 ) ) ( not ( = ?auto_19286 ?auto_19296 ) ) ( not ( = ?auto_19287 ?auto_19298 ) ) ( not ( = ?auto_19287 ?auto_19303 ) ) ( not ( = ?auto_19287 ?auto_19292 ) ) ( not ( = ?auto_19287 ?auto_19306 ) ) ( not ( = ?auto_19287 ?auto_19293 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_19279 ?auto_19280 ?auto_19281 ?auto_19282 ?auto_19283 ?auto_19284 )
      ( MAKE-1CRATE ?auto_19284 ?auto_19285 )
      ( MAKE-6CRATE-VERIFY ?auto_19279 ?auto_19280 ?auto_19281 ?auto_19282 ?auto_19283 ?auto_19284 ?auto_19285 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19309 - SURFACE
      ?auto_19310 - SURFACE
    )
    :vars
    (
      ?auto_19311 - HOIST
      ?auto_19312 - PLACE
      ?auto_19314 - PLACE
      ?auto_19315 - HOIST
      ?auto_19316 - SURFACE
      ?auto_19313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19311 ?auto_19312 ) ( SURFACE-AT ?auto_19309 ?auto_19312 ) ( CLEAR ?auto_19309 ) ( IS-CRATE ?auto_19310 ) ( AVAILABLE ?auto_19311 ) ( not ( = ?auto_19314 ?auto_19312 ) ) ( HOIST-AT ?auto_19315 ?auto_19314 ) ( AVAILABLE ?auto_19315 ) ( SURFACE-AT ?auto_19310 ?auto_19314 ) ( ON ?auto_19310 ?auto_19316 ) ( CLEAR ?auto_19310 ) ( TRUCK-AT ?auto_19313 ?auto_19312 ) ( not ( = ?auto_19309 ?auto_19310 ) ) ( not ( = ?auto_19309 ?auto_19316 ) ) ( not ( = ?auto_19310 ?auto_19316 ) ) ( not ( = ?auto_19311 ?auto_19315 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19313 ?auto_19312 ?auto_19314 )
      ( !LIFT ?auto_19315 ?auto_19310 ?auto_19316 ?auto_19314 )
      ( !LOAD ?auto_19315 ?auto_19310 ?auto_19313 ?auto_19314 )
      ( !DRIVE ?auto_19313 ?auto_19314 ?auto_19312 )
      ( !UNLOAD ?auto_19311 ?auto_19310 ?auto_19313 ?auto_19312 )
      ( !DROP ?auto_19311 ?auto_19310 ?auto_19309 ?auto_19312 )
      ( MAKE-1CRATE-VERIFY ?auto_19309 ?auto_19310 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_19325 - SURFACE
      ?auto_19326 - SURFACE
      ?auto_19327 - SURFACE
      ?auto_19328 - SURFACE
      ?auto_19329 - SURFACE
      ?auto_19330 - SURFACE
      ?auto_19332 - SURFACE
      ?auto_19331 - SURFACE
    )
    :vars
    (
      ?auto_19333 - HOIST
      ?auto_19338 - PLACE
      ?auto_19334 - PLACE
      ?auto_19337 - HOIST
      ?auto_19336 - SURFACE
      ?auto_19342 - PLACE
      ?auto_19343 - HOIST
      ?auto_19356 - SURFACE
      ?auto_19347 - PLACE
      ?auto_19340 - HOIST
      ?auto_19344 - SURFACE
      ?auto_19351 - PLACE
      ?auto_19355 - HOIST
      ?auto_19352 - SURFACE
      ?auto_19349 - PLACE
      ?auto_19350 - HOIST
      ?auto_19339 - SURFACE
      ?auto_19353 - PLACE
      ?auto_19354 - HOIST
      ?auto_19341 - SURFACE
      ?auto_19345 - PLACE
      ?auto_19346 - HOIST
      ?auto_19348 - SURFACE
      ?auto_19335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19333 ?auto_19338 ) ( IS-CRATE ?auto_19331 ) ( not ( = ?auto_19334 ?auto_19338 ) ) ( HOIST-AT ?auto_19337 ?auto_19334 ) ( AVAILABLE ?auto_19337 ) ( SURFACE-AT ?auto_19331 ?auto_19334 ) ( ON ?auto_19331 ?auto_19336 ) ( CLEAR ?auto_19331 ) ( not ( = ?auto_19332 ?auto_19331 ) ) ( not ( = ?auto_19332 ?auto_19336 ) ) ( not ( = ?auto_19331 ?auto_19336 ) ) ( not ( = ?auto_19333 ?auto_19337 ) ) ( IS-CRATE ?auto_19332 ) ( not ( = ?auto_19342 ?auto_19338 ) ) ( HOIST-AT ?auto_19343 ?auto_19342 ) ( AVAILABLE ?auto_19343 ) ( SURFACE-AT ?auto_19332 ?auto_19342 ) ( ON ?auto_19332 ?auto_19356 ) ( CLEAR ?auto_19332 ) ( not ( = ?auto_19330 ?auto_19332 ) ) ( not ( = ?auto_19330 ?auto_19356 ) ) ( not ( = ?auto_19332 ?auto_19356 ) ) ( not ( = ?auto_19333 ?auto_19343 ) ) ( IS-CRATE ?auto_19330 ) ( not ( = ?auto_19347 ?auto_19338 ) ) ( HOIST-AT ?auto_19340 ?auto_19347 ) ( AVAILABLE ?auto_19340 ) ( SURFACE-AT ?auto_19330 ?auto_19347 ) ( ON ?auto_19330 ?auto_19344 ) ( CLEAR ?auto_19330 ) ( not ( = ?auto_19329 ?auto_19330 ) ) ( not ( = ?auto_19329 ?auto_19344 ) ) ( not ( = ?auto_19330 ?auto_19344 ) ) ( not ( = ?auto_19333 ?auto_19340 ) ) ( IS-CRATE ?auto_19329 ) ( not ( = ?auto_19351 ?auto_19338 ) ) ( HOIST-AT ?auto_19355 ?auto_19351 ) ( AVAILABLE ?auto_19355 ) ( SURFACE-AT ?auto_19329 ?auto_19351 ) ( ON ?auto_19329 ?auto_19352 ) ( CLEAR ?auto_19329 ) ( not ( = ?auto_19328 ?auto_19329 ) ) ( not ( = ?auto_19328 ?auto_19352 ) ) ( not ( = ?auto_19329 ?auto_19352 ) ) ( not ( = ?auto_19333 ?auto_19355 ) ) ( IS-CRATE ?auto_19328 ) ( not ( = ?auto_19349 ?auto_19338 ) ) ( HOIST-AT ?auto_19350 ?auto_19349 ) ( AVAILABLE ?auto_19350 ) ( SURFACE-AT ?auto_19328 ?auto_19349 ) ( ON ?auto_19328 ?auto_19339 ) ( CLEAR ?auto_19328 ) ( not ( = ?auto_19327 ?auto_19328 ) ) ( not ( = ?auto_19327 ?auto_19339 ) ) ( not ( = ?auto_19328 ?auto_19339 ) ) ( not ( = ?auto_19333 ?auto_19350 ) ) ( IS-CRATE ?auto_19327 ) ( not ( = ?auto_19353 ?auto_19338 ) ) ( HOIST-AT ?auto_19354 ?auto_19353 ) ( AVAILABLE ?auto_19354 ) ( SURFACE-AT ?auto_19327 ?auto_19353 ) ( ON ?auto_19327 ?auto_19341 ) ( CLEAR ?auto_19327 ) ( not ( = ?auto_19326 ?auto_19327 ) ) ( not ( = ?auto_19326 ?auto_19341 ) ) ( not ( = ?auto_19327 ?auto_19341 ) ) ( not ( = ?auto_19333 ?auto_19354 ) ) ( SURFACE-AT ?auto_19325 ?auto_19338 ) ( CLEAR ?auto_19325 ) ( IS-CRATE ?auto_19326 ) ( AVAILABLE ?auto_19333 ) ( not ( = ?auto_19345 ?auto_19338 ) ) ( HOIST-AT ?auto_19346 ?auto_19345 ) ( AVAILABLE ?auto_19346 ) ( SURFACE-AT ?auto_19326 ?auto_19345 ) ( ON ?auto_19326 ?auto_19348 ) ( CLEAR ?auto_19326 ) ( TRUCK-AT ?auto_19335 ?auto_19338 ) ( not ( = ?auto_19325 ?auto_19326 ) ) ( not ( = ?auto_19325 ?auto_19348 ) ) ( not ( = ?auto_19326 ?auto_19348 ) ) ( not ( = ?auto_19333 ?auto_19346 ) ) ( not ( = ?auto_19325 ?auto_19327 ) ) ( not ( = ?auto_19325 ?auto_19341 ) ) ( not ( = ?auto_19327 ?auto_19348 ) ) ( not ( = ?auto_19353 ?auto_19345 ) ) ( not ( = ?auto_19354 ?auto_19346 ) ) ( not ( = ?auto_19341 ?auto_19348 ) ) ( not ( = ?auto_19325 ?auto_19328 ) ) ( not ( = ?auto_19325 ?auto_19339 ) ) ( not ( = ?auto_19326 ?auto_19328 ) ) ( not ( = ?auto_19326 ?auto_19339 ) ) ( not ( = ?auto_19328 ?auto_19341 ) ) ( not ( = ?auto_19328 ?auto_19348 ) ) ( not ( = ?auto_19349 ?auto_19353 ) ) ( not ( = ?auto_19349 ?auto_19345 ) ) ( not ( = ?auto_19350 ?auto_19354 ) ) ( not ( = ?auto_19350 ?auto_19346 ) ) ( not ( = ?auto_19339 ?auto_19341 ) ) ( not ( = ?auto_19339 ?auto_19348 ) ) ( not ( = ?auto_19325 ?auto_19329 ) ) ( not ( = ?auto_19325 ?auto_19352 ) ) ( not ( = ?auto_19326 ?auto_19329 ) ) ( not ( = ?auto_19326 ?auto_19352 ) ) ( not ( = ?auto_19327 ?auto_19329 ) ) ( not ( = ?auto_19327 ?auto_19352 ) ) ( not ( = ?auto_19329 ?auto_19339 ) ) ( not ( = ?auto_19329 ?auto_19341 ) ) ( not ( = ?auto_19329 ?auto_19348 ) ) ( not ( = ?auto_19351 ?auto_19349 ) ) ( not ( = ?auto_19351 ?auto_19353 ) ) ( not ( = ?auto_19351 ?auto_19345 ) ) ( not ( = ?auto_19355 ?auto_19350 ) ) ( not ( = ?auto_19355 ?auto_19354 ) ) ( not ( = ?auto_19355 ?auto_19346 ) ) ( not ( = ?auto_19352 ?auto_19339 ) ) ( not ( = ?auto_19352 ?auto_19341 ) ) ( not ( = ?auto_19352 ?auto_19348 ) ) ( not ( = ?auto_19325 ?auto_19330 ) ) ( not ( = ?auto_19325 ?auto_19344 ) ) ( not ( = ?auto_19326 ?auto_19330 ) ) ( not ( = ?auto_19326 ?auto_19344 ) ) ( not ( = ?auto_19327 ?auto_19330 ) ) ( not ( = ?auto_19327 ?auto_19344 ) ) ( not ( = ?auto_19328 ?auto_19330 ) ) ( not ( = ?auto_19328 ?auto_19344 ) ) ( not ( = ?auto_19330 ?auto_19352 ) ) ( not ( = ?auto_19330 ?auto_19339 ) ) ( not ( = ?auto_19330 ?auto_19341 ) ) ( not ( = ?auto_19330 ?auto_19348 ) ) ( not ( = ?auto_19347 ?auto_19351 ) ) ( not ( = ?auto_19347 ?auto_19349 ) ) ( not ( = ?auto_19347 ?auto_19353 ) ) ( not ( = ?auto_19347 ?auto_19345 ) ) ( not ( = ?auto_19340 ?auto_19355 ) ) ( not ( = ?auto_19340 ?auto_19350 ) ) ( not ( = ?auto_19340 ?auto_19354 ) ) ( not ( = ?auto_19340 ?auto_19346 ) ) ( not ( = ?auto_19344 ?auto_19352 ) ) ( not ( = ?auto_19344 ?auto_19339 ) ) ( not ( = ?auto_19344 ?auto_19341 ) ) ( not ( = ?auto_19344 ?auto_19348 ) ) ( not ( = ?auto_19325 ?auto_19332 ) ) ( not ( = ?auto_19325 ?auto_19356 ) ) ( not ( = ?auto_19326 ?auto_19332 ) ) ( not ( = ?auto_19326 ?auto_19356 ) ) ( not ( = ?auto_19327 ?auto_19332 ) ) ( not ( = ?auto_19327 ?auto_19356 ) ) ( not ( = ?auto_19328 ?auto_19332 ) ) ( not ( = ?auto_19328 ?auto_19356 ) ) ( not ( = ?auto_19329 ?auto_19332 ) ) ( not ( = ?auto_19329 ?auto_19356 ) ) ( not ( = ?auto_19332 ?auto_19344 ) ) ( not ( = ?auto_19332 ?auto_19352 ) ) ( not ( = ?auto_19332 ?auto_19339 ) ) ( not ( = ?auto_19332 ?auto_19341 ) ) ( not ( = ?auto_19332 ?auto_19348 ) ) ( not ( = ?auto_19342 ?auto_19347 ) ) ( not ( = ?auto_19342 ?auto_19351 ) ) ( not ( = ?auto_19342 ?auto_19349 ) ) ( not ( = ?auto_19342 ?auto_19353 ) ) ( not ( = ?auto_19342 ?auto_19345 ) ) ( not ( = ?auto_19343 ?auto_19340 ) ) ( not ( = ?auto_19343 ?auto_19355 ) ) ( not ( = ?auto_19343 ?auto_19350 ) ) ( not ( = ?auto_19343 ?auto_19354 ) ) ( not ( = ?auto_19343 ?auto_19346 ) ) ( not ( = ?auto_19356 ?auto_19344 ) ) ( not ( = ?auto_19356 ?auto_19352 ) ) ( not ( = ?auto_19356 ?auto_19339 ) ) ( not ( = ?auto_19356 ?auto_19341 ) ) ( not ( = ?auto_19356 ?auto_19348 ) ) ( not ( = ?auto_19325 ?auto_19331 ) ) ( not ( = ?auto_19325 ?auto_19336 ) ) ( not ( = ?auto_19326 ?auto_19331 ) ) ( not ( = ?auto_19326 ?auto_19336 ) ) ( not ( = ?auto_19327 ?auto_19331 ) ) ( not ( = ?auto_19327 ?auto_19336 ) ) ( not ( = ?auto_19328 ?auto_19331 ) ) ( not ( = ?auto_19328 ?auto_19336 ) ) ( not ( = ?auto_19329 ?auto_19331 ) ) ( not ( = ?auto_19329 ?auto_19336 ) ) ( not ( = ?auto_19330 ?auto_19331 ) ) ( not ( = ?auto_19330 ?auto_19336 ) ) ( not ( = ?auto_19331 ?auto_19356 ) ) ( not ( = ?auto_19331 ?auto_19344 ) ) ( not ( = ?auto_19331 ?auto_19352 ) ) ( not ( = ?auto_19331 ?auto_19339 ) ) ( not ( = ?auto_19331 ?auto_19341 ) ) ( not ( = ?auto_19331 ?auto_19348 ) ) ( not ( = ?auto_19334 ?auto_19342 ) ) ( not ( = ?auto_19334 ?auto_19347 ) ) ( not ( = ?auto_19334 ?auto_19351 ) ) ( not ( = ?auto_19334 ?auto_19349 ) ) ( not ( = ?auto_19334 ?auto_19353 ) ) ( not ( = ?auto_19334 ?auto_19345 ) ) ( not ( = ?auto_19337 ?auto_19343 ) ) ( not ( = ?auto_19337 ?auto_19340 ) ) ( not ( = ?auto_19337 ?auto_19355 ) ) ( not ( = ?auto_19337 ?auto_19350 ) ) ( not ( = ?auto_19337 ?auto_19354 ) ) ( not ( = ?auto_19337 ?auto_19346 ) ) ( not ( = ?auto_19336 ?auto_19356 ) ) ( not ( = ?auto_19336 ?auto_19344 ) ) ( not ( = ?auto_19336 ?auto_19352 ) ) ( not ( = ?auto_19336 ?auto_19339 ) ) ( not ( = ?auto_19336 ?auto_19341 ) ) ( not ( = ?auto_19336 ?auto_19348 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_19325 ?auto_19326 ?auto_19327 ?auto_19328 ?auto_19329 ?auto_19330 ?auto_19332 )
      ( MAKE-1CRATE ?auto_19332 ?auto_19331 )
      ( MAKE-7CRATE-VERIFY ?auto_19325 ?auto_19326 ?auto_19327 ?auto_19328 ?auto_19329 ?auto_19330 ?auto_19332 ?auto_19331 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19359 - SURFACE
      ?auto_19360 - SURFACE
    )
    :vars
    (
      ?auto_19361 - HOIST
      ?auto_19362 - PLACE
      ?auto_19364 - PLACE
      ?auto_19365 - HOIST
      ?auto_19366 - SURFACE
      ?auto_19363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19361 ?auto_19362 ) ( SURFACE-AT ?auto_19359 ?auto_19362 ) ( CLEAR ?auto_19359 ) ( IS-CRATE ?auto_19360 ) ( AVAILABLE ?auto_19361 ) ( not ( = ?auto_19364 ?auto_19362 ) ) ( HOIST-AT ?auto_19365 ?auto_19364 ) ( AVAILABLE ?auto_19365 ) ( SURFACE-AT ?auto_19360 ?auto_19364 ) ( ON ?auto_19360 ?auto_19366 ) ( CLEAR ?auto_19360 ) ( TRUCK-AT ?auto_19363 ?auto_19362 ) ( not ( = ?auto_19359 ?auto_19360 ) ) ( not ( = ?auto_19359 ?auto_19366 ) ) ( not ( = ?auto_19360 ?auto_19366 ) ) ( not ( = ?auto_19361 ?auto_19365 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19363 ?auto_19362 ?auto_19364 )
      ( !LIFT ?auto_19365 ?auto_19360 ?auto_19366 ?auto_19364 )
      ( !LOAD ?auto_19365 ?auto_19360 ?auto_19363 ?auto_19364 )
      ( !DRIVE ?auto_19363 ?auto_19364 ?auto_19362 )
      ( !UNLOAD ?auto_19361 ?auto_19360 ?auto_19363 ?auto_19362 )
      ( !DROP ?auto_19361 ?auto_19360 ?auto_19359 ?auto_19362 )
      ( MAKE-1CRATE-VERIFY ?auto_19359 ?auto_19360 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_19376 - SURFACE
      ?auto_19377 - SURFACE
      ?auto_19378 - SURFACE
      ?auto_19379 - SURFACE
      ?auto_19380 - SURFACE
      ?auto_19381 - SURFACE
      ?auto_19384 - SURFACE
      ?auto_19383 - SURFACE
      ?auto_19382 - SURFACE
    )
    :vars
    (
      ?auto_19387 - HOIST
      ?auto_19385 - PLACE
      ?auto_19390 - PLACE
      ?auto_19389 - HOIST
      ?auto_19388 - SURFACE
      ?auto_19407 - PLACE
      ?auto_19405 - HOIST
      ?auto_19406 - SURFACE
      ?auto_19408 - PLACE
      ?auto_19404 - HOIST
      ?auto_19392 - SURFACE
      ?auto_19395 - PLACE
      ?auto_19411 - HOIST
      ?auto_19403 - SURFACE
      ?auto_19399 - PLACE
      ?auto_19393 - HOIST
      ?auto_19400 - SURFACE
      ?auto_19396 - PLACE
      ?auto_19398 - HOIST
      ?auto_19391 - SURFACE
      ?auto_19410 - PLACE
      ?auto_19394 - HOIST
      ?auto_19409 - SURFACE
      ?auto_19402 - PLACE
      ?auto_19401 - HOIST
      ?auto_19397 - SURFACE
      ?auto_19386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19387 ?auto_19385 ) ( IS-CRATE ?auto_19382 ) ( not ( = ?auto_19390 ?auto_19385 ) ) ( HOIST-AT ?auto_19389 ?auto_19390 ) ( AVAILABLE ?auto_19389 ) ( SURFACE-AT ?auto_19382 ?auto_19390 ) ( ON ?auto_19382 ?auto_19388 ) ( CLEAR ?auto_19382 ) ( not ( = ?auto_19383 ?auto_19382 ) ) ( not ( = ?auto_19383 ?auto_19388 ) ) ( not ( = ?auto_19382 ?auto_19388 ) ) ( not ( = ?auto_19387 ?auto_19389 ) ) ( IS-CRATE ?auto_19383 ) ( not ( = ?auto_19407 ?auto_19385 ) ) ( HOIST-AT ?auto_19405 ?auto_19407 ) ( AVAILABLE ?auto_19405 ) ( SURFACE-AT ?auto_19383 ?auto_19407 ) ( ON ?auto_19383 ?auto_19406 ) ( CLEAR ?auto_19383 ) ( not ( = ?auto_19384 ?auto_19383 ) ) ( not ( = ?auto_19384 ?auto_19406 ) ) ( not ( = ?auto_19383 ?auto_19406 ) ) ( not ( = ?auto_19387 ?auto_19405 ) ) ( IS-CRATE ?auto_19384 ) ( not ( = ?auto_19408 ?auto_19385 ) ) ( HOIST-AT ?auto_19404 ?auto_19408 ) ( AVAILABLE ?auto_19404 ) ( SURFACE-AT ?auto_19384 ?auto_19408 ) ( ON ?auto_19384 ?auto_19392 ) ( CLEAR ?auto_19384 ) ( not ( = ?auto_19381 ?auto_19384 ) ) ( not ( = ?auto_19381 ?auto_19392 ) ) ( not ( = ?auto_19384 ?auto_19392 ) ) ( not ( = ?auto_19387 ?auto_19404 ) ) ( IS-CRATE ?auto_19381 ) ( not ( = ?auto_19395 ?auto_19385 ) ) ( HOIST-AT ?auto_19411 ?auto_19395 ) ( AVAILABLE ?auto_19411 ) ( SURFACE-AT ?auto_19381 ?auto_19395 ) ( ON ?auto_19381 ?auto_19403 ) ( CLEAR ?auto_19381 ) ( not ( = ?auto_19380 ?auto_19381 ) ) ( not ( = ?auto_19380 ?auto_19403 ) ) ( not ( = ?auto_19381 ?auto_19403 ) ) ( not ( = ?auto_19387 ?auto_19411 ) ) ( IS-CRATE ?auto_19380 ) ( not ( = ?auto_19399 ?auto_19385 ) ) ( HOIST-AT ?auto_19393 ?auto_19399 ) ( AVAILABLE ?auto_19393 ) ( SURFACE-AT ?auto_19380 ?auto_19399 ) ( ON ?auto_19380 ?auto_19400 ) ( CLEAR ?auto_19380 ) ( not ( = ?auto_19379 ?auto_19380 ) ) ( not ( = ?auto_19379 ?auto_19400 ) ) ( not ( = ?auto_19380 ?auto_19400 ) ) ( not ( = ?auto_19387 ?auto_19393 ) ) ( IS-CRATE ?auto_19379 ) ( not ( = ?auto_19396 ?auto_19385 ) ) ( HOIST-AT ?auto_19398 ?auto_19396 ) ( AVAILABLE ?auto_19398 ) ( SURFACE-AT ?auto_19379 ?auto_19396 ) ( ON ?auto_19379 ?auto_19391 ) ( CLEAR ?auto_19379 ) ( not ( = ?auto_19378 ?auto_19379 ) ) ( not ( = ?auto_19378 ?auto_19391 ) ) ( not ( = ?auto_19379 ?auto_19391 ) ) ( not ( = ?auto_19387 ?auto_19398 ) ) ( IS-CRATE ?auto_19378 ) ( not ( = ?auto_19410 ?auto_19385 ) ) ( HOIST-AT ?auto_19394 ?auto_19410 ) ( AVAILABLE ?auto_19394 ) ( SURFACE-AT ?auto_19378 ?auto_19410 ) ( ON ?auto_19378 ?auto_19409 ) ( CLEAR ?auto_19378 ) ( not ( = ?auto_19377 ?auto_19378 ) ) ( not ( = ?auto_19377 ?auto_19409 ) ) ( not ( = ?auto_19378 ?auto_19409 ) ) ( not ( = ?auto_19387 ?auto_19394 ) ) ( SURFACE-AT ?auto_19376 ?auto_19385 ) ( CLEAR ?auto_19376 ) ( IS-CRATE ?auto_19377 ) ( AVAILABLE ?auto_19387 ) ( not ( = ?auto_19402 ?auto_19385 ) ) ( HOIST-AT ?auto_19401 ?auto_19402 ) ( AVAILABLE ?auto_19401 ) ( SURFACE-AT ?auto_19377 ?auto_19402 ) ( ON ?auto_19377 ?auto_19397 ) ( CLEAR ?auto_19377 ) ( TRUCK-AT ?auto_19386 ?auto_19385 ) ( not ( = ?auto_19376 ?auto_19377 ) ) ( not ( = ?auto_19376 ?auto_19397 ) ) ( not ( = ?auto_19377 ?auto_19397 ) ) ( not ( = ?auto_19387 ?auto_19401 ) ) ( not ( = ?auto_19376 ?auto_19378 ) ) ( not ( = ?auto_19376 ?auto_19409 ) ) ( not ( = ?auto_19378 ?auto_19397 ) ) ( not ( = ?auto_19410 ?auto_19402 ) ) ( not ( = ?auto_19394 ?auto_19401 ) ) ( not ( = ?auto_19409 ?auto_19397 ) ) ( not ( = ?auto_19376 ?auto_19379 ) ) ( not ( = ?auto_19376 ?auto_19391 ) ) ( not ( = ?auto_19377 ?auto_19379 ) ) ( not ( = ?auto_19377 ?auto_19391 ) ) ( not ( = ?auto_19379 ?auto_19409 ) ) ( not ( = ?auto_19379 ?auto_19397 ) ) ( not ( = ?auto_19396 ?auto_19410 ) ) ( not ( = ?auto_19396 ?auto_19402 ) ) ( not ( = ?auto_19398 ?auto_19394 ) ) ( not ( = ?auto_19398 ?auto_19401 ) ) ( not ( = ?auto_19391 ?auto_19409 ) ) ( not ( = ?auto_19391 ?auto_19397 ) ) ( not ( = ?auto_19376 ?auto_19380 ) ) ( not ( = ?auto_19376 ?auto_19400 ) ) ( not ( = ?auto_19377 ?auto_19380 ) ) ( not ( = ?auto_19377 ?auto_19400 ) ) ( not ( = ?auto_19378 ?auto_19380 ) ) ( not ( = ?auto_19378 ?auto_19400 ) ) ( not ( = ?auto_19380 ?auto_19391 ) ) ( not ( = ?auto_19380 ?auto_19409 ) ) ( not ( = ?auto_19380 ?auto_19397 ) ) ( not ( = ?auto_19399 ?auto_19396 ) ) ( not ( = ?auto_19399 ?auto_19410 ) ) ( not ( = ?auto_19399 ?auto_19402 ) ) ( not ( = ?auto_19393 ?auto_19398 ) ) ( not ( = ?auto_19393 ?auto_19394 ) ) ( not ( = ?auto_19393 ?auto_19401 ) ) ( not ( = ?auto_19400 ?auto_19391 ) ) ( not ( = ?auto_19400 ?auto_19409 ) ) ( not ( = ?auto_19400 ?auto_19397 ) ) ( not ( = ?auto_19376 ?auto_19381 ) ) ( not ( = ?auto_19376 ?auto_19403 ) ) ( not ( = ?auto_19377 ?auto_19381 ) ) ( not ( = ?auto_19377 ?auto_19403 ) ) ( not ( = ?auto_19378 ?auto_19381 ) ) ( not ( = ?auto_19378 ?auto_19403 ) ) ( not ( = ?auto_19379 ?auto_19381 ) ) ( not ( = ?auto_19379 ?auto_19403 ) ) ( not ( = ?auto_19381 ?auto_19400 ) ) ( not ( = ?auto_19381 ?auto_19391 ) ) ( not ( = ?auto_19381 ?auto_19409 ) ) ( not ( = ?auto_19381 ?auto_19397 ) ) ( not ( = ?auto_19395 ?auto_19399 ) ) ( not ( = ?auto_19395 ?auto_19396 ) ) ( not ( = ?auto_19395 ?auto_19410 ) ) ( not ( = ?auto_19395 ?auto_19402 ) ) ( not ( = ?auto_19411 ?auto_19393 ) ) ( not ( = ?auto_19411 ?auto_19398 ) ) ( not ( = ?auto_19411 ?auto_19394 ) ) ( not ( = ?auto_19411 ?auto_19401 ) ) ( not ( = ?auto_19403 ?auto_19400 ) ) ( not ( = ?auto_19403 ?auto_19391 ) ) ( not ( = ?auto_19403 ?auto_19409 ) ) ( not ( = ?auto_19403 ?auto_19397 ) ) ( not ( = ?auto_19376 ?auto_19384 ) ) ( not ( = ?auto_19376 ?auto_19392 ) ) ( not ( = ?auto_19377 ?auto_19384 ) ) ( not ( = ?auto_19377 ?auto_19392 ) ) ( not ( = ?auto_19378 ?auto_19384 ) ) ( not ( = ?auto_19378 ?auto_19392 ) ) ( not ( = ?auto_19379 ?auto_19384 ) ) ( not ( = ?auto_19379 ?auto_19392 ) ) ( not ( = ?auto_19380 ?auto_19384 ) ) ( not ( = ?auto_19380 ?auto_19392 ) ) ( not ( = ?auto_19384 ?auto_19403 ) ) ( not ( = ?auto_19384 ?auto_19400 ) ) ( not ( = ?auto_19384 ?auto_19391 ) ) ( not ( = ?auto_19384 ?auto_19409 ) ) ( not ( = ?auto_19384 ?auto_19397 ) ) ( not ( = ?auto_19408 ?auto_19395 ) ) ( not ( = ?auto_19408 ?auto_19399 ) ) ( not ( = ?auto_19408 ?auto_19396 ) ) ( not ( = ?auto_19408 ?auto_19410 ) ) ( not ( = ?auto_19408 ?auto_19402 ) ) ( not ( = ?auto_19404 ?auto_19411 ) ) ( not ( = ?auto_19404 ?auto_19393 ) ) ( not ( = ?auto_19404 ?auto_19398 ) ) ( not ( = ?auto_19404 ?auto_19394 ) ) ( not ( = ?auto_19404 ?auto_19401 ) ) ( not ( = ?auto_19392 ?auto_19403 ) ) ( not ( = ?auto_19392 ?auto_19400 ) ) ( not ( = ?auto_19392 ?auto_19391 ) ) ( not ( = ?auto_19392 ?auto_19409 ) ) ( not ( = ?auto_19392 ?auto_19397 ) ) ( not ( = ?auto_19376 ?auto_19383 ) ) ( not ( = ?auto_19376 ?auto_19406 ) ) ( not ( = ?auto_19377 ?auto_19383 ) ) ( not ( = ?auto_19377 ?auto_19406 ) ) ( not ( = ?auto_19378 ?auto_19383 ) ) ( not ( = ?auto_19378 ?auto_19406 ) ) ( not ( = ?auto_19379 ?auto_19383 ) ) ( not ( = ?auto_19379 ?auto_19406 ) ) ( not ( = ?auto_19380 ?auto_19383 ) ) ( not ( = ?auto_19380 ?auto_19406 ) ) ( not ( = ?auto_19381 ?auto_19383 ) ) ( not ( = ?auto_19381 ?auto_19406 ) ) ( not ( = ?auto_19383 ?auto_19392 ) ) ( not ( = ?auto_19383 ?auto_19403 ) ) ( not ( = ?auto_19383 ?auto_19400 ) ) ( not ( = ?auto_19383 ?auto_19391 ) ) ( not ( = ?auto_19383 ?auto_19409 ) ) ( not ( = ?auto_19383 ?auto_19397 ) ) ( not ( = ?auto_19407 ?auto_19408 ) ) ( not ( = ?auto_19407 ?auto_19395 ) ) ( not ( = ?auto_19407 ?auto_19399 ) ) ( not ( = ?auto_19407 ?auto_19396 ) ) ( not ( = ?auto_19407 ?auto_19410 ) ) ( not ( = ?auto_19407 ?auto_19402 ) ) ( not ( = ?auto_19405 ?auto_19404 ) ) ( not ( = ?auto_19405 ?auto_19411 ) ) ( not ( = ?auto_19405 ?auto_19393 ) ) ( not ( = ?auto_19405 ?auto_19398 ) ) ( not ( = ?auto_19405 ?auto_19394 ) ) ( not ( = ?auto_19405 ?auto_19401 ) ) ( not ( = ?auto_19406 ?auto_19392 ) ) ( not ( = ?auto_19406 ?auto_19403 ) ) ( not ( = ?auto_19406 ?auto_19400 ) ) ( not ( = ?auto_19406 ?auto_19391 ) ) ( not ( = ?auto_19406 ?auto_19409 ) ) ( not ( = ?auto_19406 ?auto_19397 ) ) ( not ( = ?auto_19376 ?auto_19382 ) ) ( not ( = ?auto_19376 ?auto_19388 ) ) ( not ( = ?auto_19377 ?auto_19382 ) ) ( not ( = ?auto_19377 ?auto_19388 ) ) ( not ( = ?auto_19378 ?auto_19382 ) ) ( not ( = ?auto_19378 ?auto_19388 ) ) ( not ( = ?auto_19379 ?auto_19382 ) ) ( not ( = ?auto_19379 ?auto_19388 ) ) ( not ( = ?auto_19380 ?auto_19382 ) ) ( not ( = ?auto_19380 ?auto_19388 ) ) ( not ( = ?auto_19381 ?auto_19382 ) ) ( not ( = ?auto_19381 ?auto_19388 ) ) ( not ( = ?auto_19384 ?auto_19382 ) ) ( not ( = ?auto_19384 ?auto_19388 ) ) ( not ( = ?auto_19382 ?auto_19406 ) ) ( not ( = ?auto_19382 ?auto_19392 ) ) ( not ( = ?auto_19382 ?auto_19403 ) ) ( not ( = ?auto_19382 ?auto_19400 ) ) ( not ( = ?auto_19382 ?auto_19391 ) ) ( not ( = ?auto_19382 ?auto_19409 ) ) ( not ( = ?auto_19382 ?auto_19397 ) ) ( not ( = ?auto_19390 ?auto_19407 ) ) ( not ( = ?auto_19390 ?auto_19408 ) ) ( not ( = ?auto_19390 ?auto_19395 ) ) ( not ( = ?auto_19390 ?auto_19399 ) ) ( not ( = ?auto_19390 ?auto_19396 ) ) ( not ( = ?auto_19390 ?auto_19410 ) ) ( not ( = ?auto_19390 ?auto_19402 ) ) ( not ( = ?auto_19389 ?auto_19405 ) ) ( not ( = ?auto_19389 ?auto_19404 ) ) ( not ( = ?auto_19389 ?auto_19411 ) ) ( not ( = ?auto_19389 ?auto_19393 ) ) ( not ( = ?auto_19389 ?auto_19398 ) ) ( not ( = ?auto_19389 ?auto_19394 ) ) ( not ( = ?auto_19389 ?auto_19401 ) ) ( not ( = ?auto_19388 ?auto_19406 ) ) ( not ( = ?auto_19388 ?auto_19392 ) ) ( not ( = ?auto_19388 ?auto_19403 ) ) ( not ( = ?auto_19388 ?auto_19400 ) ) ( not ( = ?auto_19388 ?auto_19391 ) ) ( not ( = ?auto_19388 ?auto_19409 ) ) ( not ( = ?auto_19388 ?auto_19397 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_19376 ?auto_19377 ?auto_19378 ?auto_19379 ?auto_19380 ?auto_19381 ?auto_19384 ?auto_19383 )
      ( MAKE-1CRATE ?auto_19383 ?auto_19382 )
      ( MAKE-8CRATE-VERIFY ?auto_19376 ?auto_19377 ?auto_19378 ?auto_19379 ?auto_19380 ?auto_19381 ?auto_19384 ?auto_19383 ?auto_19382 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19414 - SURFACE
      ?auto_19415 - SURFACE
    )
    :vars
    (
      ?auto_19416 - HOIST
      ?auto_19417 - PLACE
      ?auto_19419 - PLACE
      ?auto_19420 - HOIST
      ?auto_19421 - SURFACE
      ?auto_19418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19416 ?auto_19417 ) ( SURFACE-AT ?auto_19414 ?auto_19417 ) ( CLEAR ?auto_19414 ) ( IS-CRATE ?auto_19415 ) ( AVAILABLE ?auto_19416 ) ( not ( = ?auto_19419 ?auto_19417 ) ) ( HOIST-AT ?auto_19420 ?auto_19419 ) ( AVAILABLE ?auto_19420 ) ( SURFACE-AT ?auto_19415 ?auto_19419 ) ( ON ?auto_19415 ?auto_19421 ) ( CLEAR ?auto_19415 ) ( TRUCK-AT ?auto_19418 ?auto_19417 ) ( not ( = ?auto_19414 ?auto_19415 ) ) ( not ( = ?auto_19414 ?auto_19421 ) ) ( not ( = ?auto_19415 ?auto_19421 ) ) ( not ( = ?auto_19416 ?auto_19420 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19418 ?auto_19417 ?auto_19419 )
      ( !LIFT ?auto_19420 ?auto_19415 ?auto_19421 ?auto_19419 )
      ( !LOAD ?auto_19420 ?auto_19415 ?auto_19418 ?auto_19419 )
      ( !DRIVE ?auto_19418 ?auto_19419 ?auto_19417 )
      ( !UNLOAD ?auto_19416 ?auto_19415 ?auto_19418 ?auto_19417 )
      ( !DROP ?auto_19416 ?auto_19415 ?auto_19414 ?auto_19417 )
      ( MAKE-1CRATE-VERIFY ?auto_19414 ?auto_19415 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_19432 - SURFACE
      ?auto_19433 - SURFACE
      ?auto_19434 - SURFACE
      ?auto_19435 - SURFACE
      ?auto_19436 - SURFACE
      ?auto_19437 - SURFACE
      ?auto_19440 - SURFACE
      ?auto_19439 - SURFACE
      ?auto_19438 - SURFACE
      ?auto_19441 - SURFACE
    )
    :vars
    (
      ?auto_19446 - HOIST
      ?auto_19444 - PLACE
      ?auto_19445 - PLACE
      ?auto_19447 - HOIST
      ?auto_19442 - SURFACE
      ?auto_19458 - SURFACE
      ?auto_19464 - PLACE
      ?auto_19455 - HOIST
      ?auto_19468 - SURFACE
      ?auto_19462 - PLACE
      ?auto_19453 - HOIST
      ?auto_19469 - SURFACE
      ?auto_19461 - PLACE
      ?auto_19466 - HOIST
      ?auto_19452 - SURFACE
      ?auto_19448 - PLACE
      ?auto_19457 - HOIST
      ?auto_19450 - SURFACE
      ?auto_19460 - PLACE
      ?auto_19454 - HOIST
      ?auto_19463 - SURFACE
      ?auto_19467 - PLACE
      ?auto_19456 - HOIST
      ?auto_19465 - SURFACE
      ?auto_19451 - PLACE
      ?auto_19449 - HOIST
      ?auto_19459 - SURFACE
      ?auto_19443 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19446 ?auto_19444 ) ( IS-CRATE ?auto_19441 ) ( not ( = ?auto_19445 ?auto_19444 ) ) ( HOIST-AT ?auto_19447 ?auto_19445 ) ( SURFACE-AT ?auto_19441 ?auto_19445 ) ( ON ?auto_19441 ?auto_19442 ) ( CLEAR ?auto_19441 ) ( not ( = ?auto_19438 ?auto_19441 ) ) ( not ( = ?auto_19438 ?auto_19442 ) ) ( not ( = ?auto_19441 ?auto_19442 ) ) ( not ( = ?auto_19446 ?auto_19447 ) ) ( IS-CRATE ?auto_19438 ) ( AVAILABLE ?auto_19447 ) ( SURFACE-AT ?auto_19438 ?auto_19445 ) ( ON ?auto_19438 ?auto_19458 ) ( CLEAR ?auto_19438 ) ( not ( = ?auto_19439 ?auto_19438 ) ) ( not ( = ?auto_19439 ?auto_19458 ) ) ( not ( = ?auto_19438 ?auto_19458 ) ) ( IS-CRATE ?auto_19439 ) ( not ( = ?auto_19464 ?auto_19444 ) ) ( HOIST-AT ?auto_19455 ?auto_19464 ) ( AVAILABLE ?auto_19455 ) ( SURFACE-AT ?auto_19439 ?auto_19464 ) ( ON ?auto_19439 ?auto_19468 ) ( CLEAR ?auto_19439 ) ( not ( = ?auto_19440 ?auto_19439 ) ) ( not ( = ?auto_19440 ?auto_19468 ) ) ( not ( = ?auto_19439 ?auto_19468 ) ) ( not ( = ?auto_19446 ?auto_19455 ) ) ( IS-CRATE ?auto_19440 ) ( not ( = ?auto_19462 ?auto_19444 ) ) ( HOIST-AT ?auto_19453 ?auto_19462 ) ( AVAILABLE ?auto_19453 ) ( SURFACE-AT ?auto_19440 ?auto_19462 ) ( ON ?auto_19440 ?auto_19469 ) ( CLEAR ?auto_19440 ) ( not ( = ?auto_19437 ?auto_19440 ) ) ( not ( = ?auto_19437 ?auto_19469 ) ) ( not ( = ?auto_19440 ?auto_19469 ) ) ( not ( = ?auto_19446 ?auto_19453 ) ) ( IS-CRATE ?auto_19437 ) ( not ( = ?auto_19461 ?auto_19444 ) ) ( HOIST-AT ?auto_19466 ?auto_19461 ) ( AVAILABLE ?auto_19466 ) ( SURFACE-AT ?auto_19437 ?auto_19461 ) ( ON ?auto_19437 ?auto_19452 ) ( CLEAR ?auto_19437 ) ( not ( = ?auto_19436 ?auto_19437 ) ) ( not ( = ?auto_19436 ?auto_19452 ) ) ( not ( = ?auto_19437 ?auto_19452 ) ) ( not ( = ?auto_19446 ?auto_19466 ) ) ( IS-CRATE ?auto_19436 ) ( not ( = ?auto_19448 ?auto_19444 ) ) ( HOIST-AT ?auto_19457 ?auto_19448 ) ( AVAILABLE ?auto_19457 ) ( SURFACE-AT ?auto_19436 ?auto_19448 ) ( ON ?auto_19436 ?auto_19450 ) ( CLEAR ?auto_19436 ) ( not ( = ?auto_19435 ?auto_19436 ) ) ( not ( = ?auto_19435 ?auto_19450 ) ) ( not ( = ?auto_19436 ?auto_19450 ) ) ( not ( = ?auto_19446 ?auto_19457 ) ) ( IS-CRATE ?auto_19435 ) ( not ( = ?auto_19460 ?auto_19444 ) ) ( HOIST-AT ?auto_19454 ?auto_19460 ) ( AVAILABLE ?auto_19454 ) ( SURFACE-AT ?auto_19435 ?auto_19460 ) ( ON ?auto_19435 ?auto_19463 ) ( CLEAR ?auto_19435 ) ( not ( = ?auto_19434 ?auto_19435 ) ) ( not ( = ?auto_19434 ?auto_19463 ) ) ( not ( = ?auto_19435 ?auto_19463 ) ) ( not ( = ?auto_19446 ?auto_19454 ) ) ( IS-CRATE ?auto_19434 ) ( not ( = ?auto_19467 ?auto_19444 ) ) ( HOIST-AT ?auto_19456 ?auto_19467 ) ( AVAILABLE ?auto_19456 ) ( SURFACE-AT ?auto_19434 ?auto_19467 ) ( ON ?auto_19434 ?auto_19465 ) ( CLEAR ?auto_19434 ) ( not ( = ?auto_19433 ?auto_19434 ) ) ( not ( = ?auto_19433 ?auto_19465 ) ) ( not ( = ?auto_19434 ?auto_19465 ) ) ( not ( = ?auto_19446 ?auto_19456 ) ) ( SURFACE-AT ?auto_19432 ?auto_19444 ) ( CLEAR ?auto_19432 ) ( IS-CRATE ?auto_19433 ) ( AVAILABLE ?auto_19446 ) ( not ( = ?auto_19451 ?auto_19444 ) ) ( HOIST-AT ?auto_19449 ?auto_19451 ) ( AVAILABLE ?auto_19449 ) ( SURFACE-AT ?auto_19433 ?auto_19451 ) ( ON ?auto_19433 ?auto_19459 ) ( CLEAR ?auto_19433 ) ( TRUCK-AT ?auto_19443 ?auto_19444 ) ( not ( = ?auto_19432 ?auto_19433 ) ) ( not ( = ?auto_19432 ?auto_19459 ) ) ( not ( = ?auto_19433 ?auto_19459 ) ) ( not ( = ?auto_19446 ?auto_19449 ) ) ( not ( = ?auto_19432 ?auto_19434 ) ) ( not ( = ?auto_19432 ?auto_19465 ) ) ( not ( = ?auto_19434 ?auto_19459 ) ) ( not ( = ?auto_19467 ?auto_19451 ) ) ( not ( = ?auto_19456 ?auto_19449 ) ) ( not ( = ?auto_19465 ?auto_19459 ) ) ( not ( = ?auto_19432 ?auto_19435 ) ) ( not ( = ?auto_19432 ?auto_19463 ) ) ( not ( = ?auto_19433 ?auto_19435 ) ) ( not ( = ?auto_19433 ?auto_19463 ) ) ( not ( = ?auto_19435 ?auto_19465 ) ) ( not ( = ?auto_19435 ?auto_19459 ) ) ( not ( = ?auto_19460 ?auto_19467 ) ) ( not ( = ?auto_19460 ?auto_19451 ) ) ( not ( = ?auto_19454 ?auto_19456 ) ) ( not ( = ?auto_19454 ?auto_19449 ) ) ( not ( = ?auto_19463 ?auto_19465 ) ) ( not ( = ?auto_19463 ?auto_19459 ) ) ( not ( = ?auto_19432 ?auto_19436 ) ) ( not ( = ?auto_19432 ?auto_19450 ) ) ( not ( = ?auto_19433 ?auto_19436 ) ) ( not ( = ?auto_19433 ?auto_19450 ) ) ( not ( = ?auto_19434 ?auto_19436 ) ) ( not ( = ?auto_19434 ?auto_19450 ) ) ( not ( = ?auto_19436 ?auto_19463 ) ) ( not ( = ?auto_19436 ?auto_19465 ) ) ( not ( = ?auto_19436 ?auto_19459 ) ) ( not ( = ?auto_19448 ?auto_19460 ) ) ( not ( = ?auto_19448 ?auto_19467 ) ) ( not ( = ?auto_19448 ?auto_19451 ) ) ( not ( = ?auto_19457 ?auto_19454 ) ) ( not ( = ?auto_19457 ?auto_19456 ) ) ( not ( = ?auto_19457 ?auto_19449 ) ) ( not ( = ?auto_19450 ?auto_19463 ) ) ( not ( = ?auto_19450 ?auto_19465 ) ) ( not ( = ?auto_19450 ?auto_19459 ) ) ( not ( = ?auto_19432 ?auto_19437 ) ) ( not ( = ?auto_19432 ?auto_19452 ) ) ( not ( = ?auto_19433 ?auto_19437 ) ) ( not ( = ?auto_19433 ?auto_19452 ) ) ( not ( = ?auto_19434 ?auto_19437 ) ) ( not ( = ?auto_19434 ?auto_19452 ) ) ( not ( = ?auto_19435 ?auto_19437 ) ) ( not ( = ?auto_19435 ?auto_19452 ) ) ( not ( = ?auto_19437 ?auto_19450 ) ) ( not ( = ?auto_19437 ?auto_19463 ) ) ( not ( = ?auto_19437 ?auto_19465 ) ) ( not ( = ?auto_19437 ?auto_19459 ) ) ( not ( = ?auto_19461 ?auto_19448 ) ) ( not ( = ?auto_19461 ?auto_19460 ) ) ( not ( = ?auto_19461 ?auto_19467 ) ) ( not ( = ?auto_19461 ?auto_19451 ) ) ( not ( = ?auto_19466 ?auto_19457 ) ) ( not ( = ?auto_19466 ?auto_19454 ) ) ( not ( = ?auto_19466 ?auto_19456 ) ) ( not ( = ?auto_19466 ?auto_19449 ) ) ( not ( = ?auto_19452 ?auto_19450 ) ) ( not ( = ?auto_19452 ?auto_19463 ) ) ( not ( = ?auto_19452 ?auto_19465 ) ) ( not ( = ?auto_19452 ?auto_19459 ) ) ( not ( = ?auto_19432 ?auto_19440 ) ) ( not ( = ?auto_19432 ?auto_19469 ) ) ( not ( = ?auto_19433 ?auto_19440 ) ) ( not ( = ?auto_19433 ?auto_19469 ) ) ( not ( = ?auto_19434 ?auto_19440 ) ) ( not ( = ?auto_19434 ?auto_19469 ) ) ( not ( = ?auto_19435 ?auto_19440 ) ) ( not ( = ?auto_19435 ?auto_19469 ) ) ( not ( = ?auto_19436 ?auto_19440 ) ) ( not ( = ?auto_19436 ?auto_19469 ) ) ( not ( = ?auto_19440 ?auto_19452 ) ) ( not ( = ?auto_19440 ?auto_19450 ) ) ( not ( = ?auto_19440 ?auto_19463 ) ) ( not ( = ?auto_19440 ?auto_19465 ) ) ( not ( = ?auto_19440 ?auto_19459 ) ) ( not ( = ?auto_19462 ?auto_19461 ) ) ( not ( = ?auto_19462 ?auto_19448 ) ) ( not ( = ?auto_19462 ?auto_19460 ) ) ( not ( = ?auto_19462 ?auto_19467 ) ) ( not ( = ?auto_19462 ?auto_19451 ) ) ( not ( = ?auto_19453 ?auto_19466 ) ) ( not ( = ?auto_19453 ?auto_19457 ) ) ( not ( = ?auto_19453 ?auto_19454 ) ) ( not ( = ?auto_19453 ?auto_19456 ) ) ( not ( = ?auto_19453 ?auto_19449 ) ) ( not ( = ?auto_19469 ?auto_19452 ) ) ( not ( = ?auto_19469 ?auto_19450 ) ) ( not ( = ?auto_19469 ?auto_19463 ) ) ( not ( = ?auto_19469 ?auto_19465 ) ) ( not ( = ?auto_19469 ?auto_19459 ) ) ( not ( = ?auto_19432 ?auto_19439 ) ) ( not ( = ?auto_19432 ?auto_19468 ) ) ( not ( = ?auto_19433 ?auto_19439 ) ) ( not ( = ?auto_19433 ?auto_19468 ) ) ( not ( = ?auto_19434 ?auto_19439 ) ) ( not ( = ?auto_19434 ?auto_19468 ) ) ( not ( = ?auto_19435 ?auto_19439 ) ) ( not ( = ?auto_19435 ?auto_19468 ) ) ( not ( = ?auto_19436 ?auto_19439 ) ) ( not ( = ?auto_19436 ?auto_19468 ) ) ( not ( = ?auto_19437 ?auto_19439 ) ) ( not ( = ?auto_19437 ?auto_19468 ) ) ( not ( = ?auto_19439 ?auto_19469 ) ) ( not ( = ?auto_19439 ?auto_19452 ) ) ( not ( = ?auto_19439 ?auto_19450 ) ) ( not ( = ?auto_19439 ?auto_19463 ) ) ( not ( = ?auto_19439 ?auto_19465 ) ) ( not ( = ?auto_19439 ?auto_19459 ) ) ( not ( = ?auto_19464 ?auto_19462 ) ) ( not ( = ?auto_19464 ?auto_19461 ) ) ( not ( = ?auto_19464 ?auto_19448 ) ) ( not ( = ?auto_19464 ?auto_19460 ) ) ( not ( = ?auto_19464 ?auto_19467 ) ) ( not ( = ?auto_19464 ?auto_19451 ) ) ( not ( = ?auto_19455 ?auto_19453 ) ) ( not ( = ?auto_19455 ?auto_19466 ) ) ( not ( = ?auto_19455 ?auto_19457 ) ) ( not ( = ?auto_19455 ?auto_19454 ) ) ( not ( = ?auto_19455 ?auto_19456 ) ) ( not ( = ?auto_19455 ?auto_19449 ) ) ( not ( = ?auto_19468 ?auto_19469 ) ) ( not ( = ?auto_19468 ?auto_19452 ) ) ( not ( = ?auto_19468 ?auto_19450 ) ) ( not ( = ?auto_19468 ?auto_19463 ) ) ( not ( = ?auto_19468 ?auto_19465 ) ) ( not ( = ?auto_19468 ?auto_19459 ) ) ( not ( = ?auto_19432 ?auto_19438 ) ) ( not ( = ?auto_19432 ?auto_19458 ) ) ( not ( = ?auto_19433 ?auto_19438 ) ) ( not ( = ?auto_19433 ?auto_19458 ) ) ( not ( = ?auto_19434 ?auto_19438 ) ) ( not ( = ?auto_19434 ?auto_19458 ) ) ( not ( = ?auto_19435 ?auto_19438 ) ) ( not ( = ?auto_19435 ?auto_19458 ) ) ( not ( = ?auto_19436 ?auto_19438 ) ) ( not ( = ?auto_19436 ?auto_19458 ) ) ( not ( = ?auto_19437 ?auto_19438 ) ) ( not ( = ?auto_19437 ?auto_19458 ) ) ( not ( = ?auto_19440 ?auto_19438 ) ) ( not ( = ?auto_19440 ?auto_19458 ) ) ( not ( = ?auto_19438 ?auto_19468 ) ) ( not ( = ?auto_19438 ?auto_19469 ) ) ( not ( = ?auto_19438 ?auto_19452 ) ) ( not ( = ?auto_19438 ?auto_19450 ) ) ( not ( = ?auto_19438 ?auto_19463 ) ) ( not ( = ?auto_19438 ?auto_19465 ) ) ( not ( = ?auto_19438 ?auto_19459 ) ) ( not ( = ?auto_19445 ?auto_19464 ) ) ( not ( = ?auto_19445 ?auto_19462 ) ) ( not ( = ?auto_19445 ?auto_19461 ) ) ( not ( = ?auto_19445 ?auto_19448 ) ) ( not ( = ?auto_19445 ?auto_19460 ) ) ( not ( = ?auto_19445 ?auto_19467 ) ) ( not ( = ?auto_19445 ?auto_19451 ) ) ( not ( = ?auto_19447 ?auto_19455 ) ) ( not ( = ?auto_19447 ?auto_19453 ) ) ( not ( = ?auto_19447 ?auto_19466 ) ) ( not ( = ?auto_19447 ?auto_19457 ) ) ( not ( = ?auto_19447 ?auto_19454 ) ) ( not ( = ?auto_19447 ?auto_19456 ) ) ( not ( = ?auto_19447 ?auto_19449 ) ) ( not ( = ?auto_19458 ?auto_19468 ) ) ( not ( = ?auto_19458 ?auto_19469 ) ) ( not ( = ?auto_19458 ?auto_19452 ) ) ( not ( = ?auto_19458 ?auto_19450 ) ) ( not ( = ?auto_19458 ?auto_19463 ) ) ( not ( = ?auto_19458 ?auto_19465 ) ) ( not ( = ?auto_19458 ?auto_19459 ) ) ( not ( = ?auto_19432 ?auto_19441 ) ) ( not ( = ?auto_19432 ?auto_19442 ) ) ( not ( = ?auto_19433 ?auto_19441 ) ) ( not ( = ?auto_19433 ?auto_19442 ) ) ( not ( = ?auto_19434 ?auto_19441 ) ) ( not ( = ?auto_19434 ?auto_19442 ) ) ( not ( = ?auto_19435 ?auto_19441 ) ) ( not ( = ?auto_19435 ?auto_19442 ) ) ( not ( = ?auto_19436 ?auto_19441 ) ) ( not ( = ?auto_19436 ?auto_19442 ) ) ( not ( = ?auto_19437 ?auto_19441 ) ) ( not ( = ?auto_19437 ?auto_19442 ) ) ( not ( = ?auto_19440 ?auto_19441 ) ) ( not ( = ?auto_19440 ?auto_19442 ) ) ( not ( = ?auto_19439 ?auto_19441 ) ) ( not ( = ?auto_19439 ?auto_19442 ) ) ( not ( = ?auto_19441 ?auto_19458 ) ) ( not ( = ?auto_19441 ?auto_19468 ) ) ( not ( = ?auto_19441 ?auto_19469 ) ) ( not ( = ?auto_19441 ?auto_19452 ) ) ( not ( = ?auto_19441 ?auto_19450 ) ) ( not ( = ?auto_19441 ?auto_19463 ) ) ( not ( = ?auto_19441 ?auto_19465 ) ) ( not ( = ?auto_19441 ?auto_19459 ) ) ( not ( = ?auto_19442 ?auto_19458 ) ) ( not ( = ?auto_19442 ?auto_19468 ) ) ( not ( = ?auto_19442 ?auto_19469 ) ) ( not ( = ?auto_19442 ?auto_19452 ) ) ( not ( = ?auto_19442 ?auto_19450 ) ) ( not ( = ?auto_19442 ?auto_19463 ) ) ( not ( = ?auto_19442 ?auto_19465 ) ) ( not ( = ?auto_19442 ?auto_19459 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_19432 ?auto_19433 ?auto_19434 ?auto_19435 ?auto_19436 ?auto_19437 ?auto_19440 ?auto_19439 ?auto_19438 )
      ( MAKE-1CRATE ?auto_19438 ?auto_19441 )
      ( MAKE-9CRATE-VERIFY ?auto_19432 ?auto_19433 ?auto_19434 ?auto_19435 ?auto_19436 ?auto_19437 ?auto_19440 ?auto_19439 ?auto_19438 ?auto_19441 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19472 - SURFACE
      ?auto_19473 - SURFACE
    )
    :vars
    (
      ?auto_19474 - HOIST
      ?auto_19475 - PLACE
      ?auto_19477 - PLACE
      ?auto_19478 - HOIST
      ?auto_19479 - SURFACE
      ?auto_19476 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19474 ?auto_19475 ) ( SURFACE-AT ?auto_19472 ?auto_19475 ) ( CLEAR ?auto_19472 ) ( IS-CRATE ?auto_19473 ) ( AVAILABLE ?auto_19474 ) ( not ( = ?auto_19477 ?auto_19475 ) ) ( HOIST-AT ?auto_19478 ?auto_19477 ) ( AVAILABLE ?auto_19478 ) ( SURFACE-AT ?auto_19473 ?auto_19477 ) ( ON ?auto_19473 ?auto_19479 ) ( CLEAR ?auto_19473 ) ( TRUCK-AT ?auto_19476 ?auto_19475 ) ( not ( = ?auto_19472 ?auto_19473 ) ) ( not ( = ?auto_19472 ?auto_19479 ) ) ( not ( = ?auto_19473 ?auto_19479 ) ) ( not ( = ?auto_19474 ?auto_19478 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19476 ?auto_19475 ?auto_19477 )
      ( !LIFT ?auto_19478 ?auto_19473 ?auto_19479 ?auto_19477 )
      ( !LOAD ?auto_19478 ?auto_19473 ?auto_19476 ?auto_19477 )
      ( !DRIVE ?auto_19476 ?auto_19477 ?auto_19475 )
      ( !UNLOAD ?auto_19474 ?auto_19473 ?auto_19476 ?auto_19475 )
      ( !DROP ?auto_19474 ?auto_19473 ?auto_19472 ?auto_19475 )
      ( MAKE-1CRATE-VERIFY ?auto_19472 ?auto_19473 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_19491 - SURFACE
      ?auto_19492 - SURFACE
      ?auto_19493 - SURFACE
      ?auto_19494 - SURFACE
      ?auto_19495 - SURFACE
      ?auto_19496 - SURFACE
      ?auto_19499 - SURFACE
      ?auto_19498 - SURFACE
      ?auto_19497 - SURFACE
      ?auto_19500 - SURFACE
      ?auto_19501 - SURFACE
    )
    :vars
    (
      ?auto_19506 - HOIST
      ?auto_19505 - PLACE
      ?auto_19503 - PLACE
      ?auto_19502 - HOIST
      ?auto_19504 - SURFACE
      ?auto_19519 - PLACE
      ?auto_19518 - HOIST
      ?auto_19513 - SURFACE
      ?auto_19511 - SURFACE
      ?auto_19529 - PLACE
      ?auto_19523 - HOIST
      ?auto_19515 - SURFACE
      ?auto_19510 - PLACE
      ?auto_19525 - HOIST
      ?auto_19514 - SURFACE
      ?auto_19512 - PLACE
      ?auto_19522 - HOIST
      ?auto_19526 - SURFACE
      ?auto_19527 - PLACE
      ?auto_19509 - HOIST
      ?auto_19530 - SURFACE
      ?auto_19508 - PLACE
      ?auto_19524 - HOIST
      ?auto_19520 - SURFACE
      ?auto_19528 - PLACE
      ?auto_19531 - HOIST
      ?auto_19516 - SURFACE
      ?auto_19517 - PLACE
      ?auto_19521 - HOIST
      ?auto_19532 - SURFACE
      ?auto_19507 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19506 ?auto_19505 ) ( IS-CRATE ?auto_19501 ) ( not ( = ?auto_19503 ?auto_19505 ) ) ( HOIST-AT ?auto_19502 ?auto_19503 ) ( AVAILABLE ?auto_19502 ) ( SURFACE-AT ?auto_19501 ?auto_19503 ) ( ON ?auto_19501 ?auto_19504 ) ( CLEAR ?auto_19501 ) ( not ( = ?auto_19500 ?auto_19501 ) ) ( not ( = ?auto_19500 ?auto_19504 ) ) ( not ( = ?auto_19501 ?auto_19504 ) ) ( not ( = ?auto_19506 ?auto_19502 ) ) ( IS-CRATE ?auto_19500 ) ( not ( = ?auto_19519 ?auto_19505 ) ) ( HOIST-AT ?auto_19518 ?auto_19519 ) ( SURFACE-AT ?auto_19500 ?auto_19519 ) ( ON ?auto_19500 ?auto_19513 ) ( CLEAR ?auto_19500 ) ( not ( = ?auto_19497 ?auto_19500 ) ) ( not ( = ?auto_19497 ?auto_19513 ) ) ( not ( = ?auto_19500 ?auto_19513 ) ) ( not ( = ?auto_19506 ?auto_19518 ) ) ( IS-CRATE ?auto_19497 ) ( AVAILABLE ?auto_19518 ) ( SURFACE-AT ?auto_19497 ?auto_19519 ) ( ON ?auto_19497 ?auto_19511 ) ( CLEAR ?auto_19497 ) ( not ( = ?auto_19498 ?auto_19497 ) ) ( not ( = ?auto_19498 ?auto_19511 ) ) ( not ( = ?auto_19497 ?auto_19511 ) ) ( IS-CRATE ?auto_19498 ) ( not ( = ?auto_19529 ?auto_19505 ) ) ( HOIST-AT ?auto_19523 ?auto_19529 ) ( AVAILABLE ?auto_19523 ) ( SURFACE-AT ?auto_19498 ?auto_19529 ) ( ON ?auto_19498 ?auto_19515 ) ( CLEAR ?auto_19498 ) ( not ( = ?auto_19499 ?auto_19498 ) ) ( not ( = ?auto_19499 ?auto_19515 ) ) ( not ( = ?auto_19498 ?auto_19515 ) ) ( not ( = ?auto_19506 ?auto_19523 ) ) ( IS-CRATE ?auto_19499 ) ( not ( = ?auto_19510 ?auto_19505 ) ) ( HOIST-AT ?auto_19525 ?auto_19510 ) ( AVAILABLE ?auto_19525 ) ( SURFACE-AT ?auto_19499 ?auto_19510 ) ( ON ?auto_19499 ?auto_19514 ) ( CLEAR ?auto_19499 ) ( not ( = ?auto_19496 ?auto_19499 ) ) ( not ( = ?auto_19496 ?auto_19514 ) ) ( not ( = ?auto_19499 ?auto_19514 ) ) ( not ( = ?auto_19506 ?auto_19525 ) ) ( IS-CRATE ?auto_19496 ) ( not ( = ?auto_19512 ?auto_19505 ) ) ( HOIST-AT ?auto_19522 ?auto_19512 ) ( AVAILABLE ?auto_19522 ) ( SURFACE-AT ?auto_19496 ?auto_19512 ) ( ON ?auto_19496 ?auto_19526 ) ( CLEAR ?auto_19496 ) ( not ( = ?auto_19495 ?auto_19496 ) ) ( not ( = ?auto_19495 ?auto_19526 ) ) ( not ( = ?auto_19496 ?auto_19526 ) ) ( not ( = ?auto_19506 ?auto_19522 ) ) ( IS-CRATE ?auto_19495 ) ( not ( = ?auto_19527 ?auto_19505 ) ) ( HOIST-AT ?auto_19509 ?auto_19527 ) ( AVAILABLE ?auto_19509 ) ( SURFACE-AT ?auto_19495 ?auto_19527 ) ( ON ?auto_19495 ?auto_19530 ) ( CLEAR ?auto_19495 ) ( not ( = ?auto_19494 ?auto_19495 ) ) ( not ( = ?auto_19494 ?auto_19530 ) ) ( not ( = ?auto_19495 ?auto_19530 ) ) ( not ( = ?auto_19506 ?auto_19509 ) ) ( IS-CRATE ?auto_19494 ) ( not ( = ?auto_19508 ?auto_19505 ) ) ( HOIST-AT ?auto_19524 ?auto_19508 ) ( AVAILABLE ?auto_19524 ) ( SURFACE-AT ?auto_19494 ?auto_19508 ) ( ON ?auto_19494 ?auto_19520 ) ( CLEAR ?auto_19494 ) ( not ( = ?auto_19493 ?auto_19494 ) ) ( not ( = ?auto_19493 ?auto_19520 ) ) ( not ( = ?auto_19494 ?auto_19520 ) ) ( not ( = ?auto_19506 ?auto_19524 ) ) ( IS-CRATE ?auto_19493 ) ( not ( = ?auto_19528 ?auto_19505 ) ) ( HOIST-AT ?auto_19531 ?auto_19528 ) ( AVAILABLE ?auto_19531 ) ( SURFACE-AT ?auto_19493 ?auto_19528 ) ( ON ?auto_19493 ?auto_19516 ) ( CLEAR ?auto_19493 ) ( not ( = ?auto_19492 ?auto_19493 ) ) ( not ( = ?auto_19492 ?auto_19516 ) ) ( not ( = ?auto_19493 ?auto_19516 ) ) ( not ( = ?auto_19506 ?auto_19531 ) ) ( SURFACE-AT ?auto_19491 ?auto_19505 ) ( CLEAR ?auto_19491 ) ( IS-CRATE ?auto_19492 ) ( AVAILABLE ?auto_19506 ) ( not ( = ?auto_19517 ?auto_19505 ) ) ( HOIST-AT ?auto_19521 ?auto_19517 ) ( AVAILABLE ?auto_19521 ) ( SURFACE-AT ?auto_19492 ?auto_19517 ) ( ON ?auto_19492 ?auto_19532 ) ( CLEAR ?auto_19492 ) ( TRUCK-AT ?auto_19507 ?auto_19505 ) ( not ( = ?auto_19491 ?auto_19492 ) ) ( not ( = ?auto_19491 ?auto_19532 ) ) ( not ( = ?auto_19492 ?auto_19532 ) ) ( not ( = ?auto_19506 ?auto_19521 ) ) ( not ( = ?auto_19491 ?auto_19493 ) ) ( not ( = ?auto_19491 ?auto_19516 ) ) ( not ( = ?auto_19493 ?auto_19532 ) ) ( not ( = ?auto_19528 ?auto_19517 ) ) ( not ( = ?auto_19531 ?auto_19521 ) ) ( not ( = ?auto_19516 ?auto_19532 ) ) ( not ( = ?auto_19491 ?auto_19494 ) ) ( not ( = ?auto_19491 ?auto_19520 ) ) ( not ( = ?auto_19492 ?auto_19494 ) ) ( not ( = ?auto_19492 ?auto_19520 ) ) ( not ( = ?auto_19494 ?auto_19516 ) ) ( not ( = ?auto_19494 ?auto_19532 ) ) ( not ( = ?auto_19508 ?auto_19528 ) ) ( not ( = ?auto_19508 ?auto_19517 ) ) ( not ( = ?auto_19524 ?auto_19531 ) ) ( not ( = ?auto_19524 ?auto_19521 ) ) ( not ( = ?auto_19520 ?auto_19516 ) ) ( not ( = ?auto_19520 ?auto_19532 ) ) ( not ( = ?auto_19491 ?auto_19495 ) ) ( not ( = ?auto_19491 ?auto_19530 ) ) ( not ( = ?auto_19492 ?auto_19495 ) ) ( not ( = ?auto_19492 ?auto_19530 ) ) ( not ( = ?auto_19493 ?auto_19495 ) ) ( not ( = ?auto_19493 ?auto_19530 ) ) ( not ( = ?auto_19495 ?auto_19520 ) ) ( not ( = ?auto_19495 ?auto_19516 ) ) ( not ( = ?auto_19495 ?auto_19532 ) ) ( not ( = ?auto_19527 ?auto_19508 ) ) ( not ( = ?auto_19527 ?auto_19528 ) ) ( not ( = ?auto_19527 ?auto_19517 ) ) ( not ( = ?auto_19509 ?auto_19524 ) ) ( not ( = ?auto_19509 ?auto_19531 ) ) ( not ( = ?auto_19509 ?auto_19521 ) ) ( not ( = ?auto_19530 ?auto_19520 ) ) ( not ( = ?auto_19530 ?auto_19516 ) ) ( not ( = ?auto_19530 ?auto_19532 ) ) ( not ( = ?auto_19491 ?auto_19496 ) ) ( not ( = ?auto_19491 ?auto_19526 ) ) ( not ( = ?auto_19492 ?auto_19496 ) ) ( not ( = ?auto_19492 ?auto_19526 ) ) ( not ( = ?auto_19493 ?auto_19496 ) ) ( not ( = ?auto_19493 ?auto_19526 ) ) ( not ( = ?auto_19494 ?auto_19496 ) ) ( not ( = ?auto_19494 ?auto_19526 ) ) ( not ( = ?auto_19496 ?auto_19530 ) ) ( not ( = ?auto_19496 ?auto_19520 ) ) ( not ( = ?auto_19496 ?auto_19516 ) ) ( not ( = ?auto_19496 ?auto_19532 ) ) ( not ( = ?auto_19512 ?auto_19527 ) ) ( not ( = ?auto_19512 ?auto_19508 ) ) ( not ( = ?auto_19512 ?auto_19528 ) ) ( not ( = ?auto_19512 ?auto_19517 ) ) ( not ( = ?auto_19522 ?auto_19509 ) ) ( not ( = ?auto_19522 ?auto_19524 ) ) ( not ( = ?auto_19522 ?auto_19531 ) ) ( not ( = ?auto_19522 ?auto_19521 ) ) ( not ( = ?auto_19526 ?auto_19530 ) ) ( not ( = ?auto_19526 ?auto_19520 ) ) ( not ( = ?auto_19526 ?auto_19516 ) ) ( not ( = ?auto_19526 ?auto_19532 ) ) ( not ( = ?auto_19491 ?auto_19499 ) ) ( not ( = ?auto_19491 ?auto_19514 ) ) ( not ( = ?auto_19492 ?auto_19499 ) ) ( not ( = ?auto_19492 ?auto_19514 ) ) ( not ( = ?auto_19493 ?auto_19499 ) ) ( not ( = ?auto_19493 ?auto_19514 ) ) ( not ( = ?auto_19494 ?auto_19499 ) ) ( not ( = ?auto_19494 ?auto_19514 ) ) ( not ( = ?auto_19495 ?auto_19499 ) ) ( not ( = ?auto_19495 ?auto_19514 ) ) ( not ( = ?auto_19499 ?auto_19526 ) ) ( not ( = ?auto_19499 ?auto_19530 ) ) ( not ( = ?auto_19499 ?auto_19520 ) ) ( not ( = ?auto_19499 ?auto_19516 ) ) ( not ( = ?auto_19499 ?auto_19532 ) ) ( not ( = ?auto_19510 ?auto_19512 ) ) ( not ( = ?auto_19510 ?auto_19527 ) ) ( not ( = ?auto_19510 ?auto_19508 ) ) ( not ( = ?auto_19510 ?auto_19528 ) ) ( not ( = ?auto_19510 ?auto_19517 ) ) ( not ( = ?auto_19525 ?auto_19522 ) ) ( not ( = ?auto_19525 ?auto_19509 ) ) ( not ( = ?auto_19525 ?auto_19524 ) ) ( not ( = ?auto_19525 ?auto_19531 ) ) ( not ( = ?auto_19525 ?auto_19521 ) ) ( not ( = ?auto_19514 ?auto_19526 ) ) ( not ( = ?auto_19514 ?auto_19530 ) ) ( not ( = ?auto_19514 ?auto_19520 ) ) ( not ( = ?auto_19514 ?auto_19516 ) ) ( not ( = ?auto_19514 ?auto_19532 ) ) ( not ( = ?auto_19491 ?auto_19498 ) ) ( not ( = ?auto_19491 ?auto_19515 ) ) ( not ( = ?auto_19492 ?auto_19498 ) ) ( not ( = ?auto_19492 ?auto_19515 ) ) ( not ( = ?auto_19493 ?auto_19498 ) ) ( not ( = ?auto_19493 ?auto_19515 ) ) ( not ( = ?auto_19494 ?auto_19498 ) ) ( not ( = ?auto_19494 ?auto_19515 ) ) ( not ( = ?auto_19495 ?auto_19498 ) ) ( not ( = ?auto_19495 ?auto_19515 ) ) ( not ( = ?auto_19496 ?auto_19498 ) ) ( not ( = ?auto_19496 ?auto_19515 ) ) ( not ( = ?auto_19498 ?auto_19514 ) ) ( not ( = ?auto_19498 ?auto_19526 ) ) ( not ( = ?auto_19498 ?auto_19530 ) ) ( not ( = ?auto_19498 ?auto_19520 ) ) ( not ( = ?auto_19498 ?auto_19516 ) ) ( not ( = ?auto_19498 ?auto_19532 ) ) ( not ( = ?auto_19529 ?auto_19510 ) ) ( not ( = ?auto_19529 ?auto_19512 ) ) ( not ( = ?auto_19529 ?auto_19527 ) ) ( not ( = ?auto_19529 ?auto_19508 ) ) ( not ( = ?auto_19529 ?auto_19528 ) ) ( not ( = ?auto_19529 ?auto_19517 ) ) ( not ( = ?auto_19523 ?auto_19525 ) ) ( not ( = ?auto_19523 ?auto_19522 ) ) ( not ( = ?auto_19523 ?auto_19509 ) ) ( not ( = ?auto_19523 ?auto_19524 ) ) ( not ( = ?auto_19523 ?auto_19531 ) ) ( not ( = ?auto_19523 ?auto_19521 ) ) ( not ( = ?auto_19515 ?auto_19514 ) ) ( not ( = ?auto_19515 ?auto_19526 ) ) ( not ( = ?auto_19515 ?auto_19530 ) ) ( not ( = ?auto_19515 ?auto_19520 ) ) ( not ( = ?auto_19515 ?auto_19516 ) ) ( not ( = ?auto_19515 ?auto_19532 ) ) ( not ( = ?auto_19491 ?auto_19497 ) ) ( not ( = ?auto_19491 ?auto_19511 ) ) ( not ( = ?auto_19492 ?auto_19497 ) ) ( not ( = ?auto_19492 ?auto_19511 ) ) ( not ( = ?auto_19493 ?auto_19497 ) ) ( not ( = ?auto_19493 ?auto_19511 ) ) ( not ( = ?auto_19494 ?auto_19497 ) ) ( not ( = ?auto_19494 ?auto_19511 ) ) ( not ( = ?auto_19495 ?auto_19497 ) ) ( not ( = ?auto_19495 ?auto_19511 ) ) ( not ( = ?auto_19496 ?auto_19497 ) ) ( not ( = ?auto_19496 ?auto_19511 ) ) ( not ( = ?auto_19499 ?auto_19497 ) ) ( not ( = ?auto_19499 ?auto_19511 ) ) ( not ( = ?auto_19497 ?auto_19515 ) ) ( not ( = ?auto_19497 ?auto_19514 ) ) ( not ( = ?auto_19497 ?auto_19526 ) ) ( not ( = ?auto_19497 ?auto_19530 ) ) ( not ( = ?auto_19497 ?auto_19520 ) ) ( not ( = ?auto_19497 ?auto_19516 ) ) ( not ( = ?auto_19497 ?auto_19532 ) ) ( not ( = ?auto_19519 ?auto_19529 ) ) ( not ( = ?auto_19519 ?auto_19510 ) ) ( not ( = ?auto_19519 ?auto_19512 ) ) ( not ( = ?auto_19519 ?auto_19527 ) ) ( not ( = ?auto_19519 ?auto_19508 ) ) ( not ( = ?auto_19519 ?auto_19528 ) ) ( not ( = ?auto_19519 ?auto_19517 ) ) ( not ( = ?auto_19518 ?auto_19523 ) ) ( not ( = ?auto_19518 ?auto_19525 ) ) ( not ( = ?auto_19518 ?auto_19522 ) ) ( not ( = ?auto_19518 ?auto_19509 ) ) ( not ( = ?auto_19518 ?auto_19524 ) ) ( not ( = ?auto_19518 ?auto_19531 ) ) ( not ( = ?auto_19518 ?auto_19521 ) ) ( not ( = ?auto_19511 ?auto_19515 ) ) ( not ( = ?auto_19511 ?auto_19514 ) ) ( not ( = ?auto_19511 ?auto_19526 ) ) ( not ( = ?auto_19511 ?auto_19530 ) ) ( not ( = ?auto_19511 ?auto_19520 ) ) ( not ( = ?auto_19511 ?auto_19516 ) ) ( not ( = ?auto_19511 ?auto_19532 ) ) ( not ( = ?auto_19491 ?auto_19500 ) ) ( not ( = ?auto_19491 ?auto_19513 ) ) ( not ( = ?auto_19492 ?auto_19500 ) ) ( not ( = ?auto_19492 ?auto_19513 ) ) ( not ( = ?auto_19493 ?auto_19500 ) ) ( not ( = ?auto_19493 ?auto_19513 ) ) ( not ( = ?auto_19494 ?auto_19500 ) ) ( not ( = ?auto_19494 ?auto_19513 ) ) ( not ( = ?auto_19495 ?auto_19500 ) ) ( not ( = ?auto_19495 ?auto_19513 ) ) ( not ( = ?auto_19496 ?auto_19500 ) ) ( not ( = ?auto_19496 ?auto_19513 ) ) ( not ( = ?auto_19499 ?auto_19500 ) ) ( not ( = ?auto_19499 ?auto_19513 ) ) ( not ( = ?auto_19498 ?auto_19500 ) ) ( not ( = ?auto_19498 ?auto_19513 ) ) ( not ( = ?auto_19500 ?auto_19511 ) ) ( not ( = ?auto_19500 ?auto_19515 ) ) ( not ( = ?auto_19500 ?auto_19514 ) ) ( not ( = ?auto_19500 ?auto_19526 ) ) ( not ( = ?auto_19500 ?auto_19530 ) ) ( not ( = ?auto_19500 ?auto_19520 ) ) ( not ( = ?auto_19500 ?auto_19516 ) ) ( not ( = ?auto_19500 ?auto_19532 ) ) ( not ( = ?auto_19513 ?auto_19511 ) ) ( not ( = ?auto_19513 ?auto_19515 ) ) ( not ( = ?auto_19513 ?auto_19514 ) ) ( not ( = ?auto_19513 ?auto_19526 ) ) ( not ( = ?auto_19513 ?auto_19530 ) ) ( not ( = ?auto_19513 ?auto_19520 ) ) ( not ( = ?auto_19513 ?auto_19516 ) ) ( not ( = ?auto_19513 ?auto_19532 ) ) ( not ( = ?auto_19491 ?auto_19501 ) ) ( not ( = ?auto_19491 ?auto_19504 ) ) ( not ( = ?auto_19492 ?auto_19501 ) ) ( not ( = ?auto_19492 ?auto_19504 ) ) ( not ( = ?auto_19493 ?auto_19501 ) ) ( not ( = ?auto_19493 ?auto_19504 ) ) ( not ( = ?auto_19494 ?auto_19501 ) ) ( not ( = ?auto_19494 ?auto_19504 ) ) ( not ( = ?auto_19495 ?auto_19501 ) ) ( not ( = ?auto_19495 ?auto_19504 ) ) ( not ( = ?auto_19496 ?auto_19501 ) ) ( not ( = ?auto_19496 ?auto_19504 ) ) ( not ( = ?auto_19499 ?auto_19501 ) ) ( not ( = ?auto_19499 ?auto_19504 ) ) ( not ( = ?auto_19498 ?auto_19501 ) ) ( not ( = ?auto_19498 ?auto_19504 ) ) ( not ( = ?auto_19497 ?auto_19501 ) ) ( not ( = ?auto_19497 ?auto_19504 ) ) ( not ( = ?auto_19501 ?auto_19513 ) ) ( not ( = ?auto_19501 ?auto_19511 ) ) ( not ( = ?auto_19501 ?auto_19515 ) ) ( not ( = ?auto_19501 ?auto_19514 ) ) ( not ( = ?auto_19501 ?auto_19526 ) ) ( not ( = ?auto_19501 ?auto_19530 ) ) ( not ( = ?auto_19501 ?auto_19520 ) ) ( not ( = ?auto_19501 ?auto_19516 ) ) ( not ( = ?auto_19501 ?auto_19532 ) ) ( not ( = ?auto_19503 ?auto_19519 ) ) ( not ( = ?auto_19503 ?auto_19529 ) ) ( not ( = ?auto_19503 ?auto_19510 ) ) ( not ( = ?auto_19503 ?auto_19512 ) ) ( not ( = ?auto_19503 ?auto_19527 ) ) ( not ( = ?auto_19503 ?auto_19508 ) ) ( not ( = ?auto_19503 ?auto_19528 ) ) ( not ( = ?auto_19503 ?auto_19517 ) ) ( not ( = ?auto_19502 ?auto_19518 ) ) ( not ( = ?auto_19502 ?auto_19523 ) ) ( not ( = ?auto_19502 ?auto_19525 ) ) ( not ( = ?auto_19502 ?auto_19522 ) ) ( not ( = ?auto_19502 ?auto_19509 ) ) ( not ( = ?auto_19502 ?auto_19524 ) ) ( not ( = ?auto_19502 ?auto_19531 ) ) ( not ( = ?auto_19502 ?auto_19521 ) ) ( not ( = ?auto_19504 ?auto_19513 ) ) ( not ( = ?auto_19504 ?auto_19511 ) ) ( not ( = ?auto_19504 ?auto_19515 ) ) ( not ( = ?auto_19504 ?auto_19514 ) ) ( not ( = ?auto_19504 ?auto_19526 ) ) ( not ( = ?auto_19504 ?auto_19530 ) ) ( not ( = ?auto_19504 ?auto_19520 ) ) ( not ( = ?auto_19504 ?auto_19516 ) ) ( not ( = ?auto_19504 ?auto_19532 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_19491 ?auto_19492 ?auto_19493 ?auto_19494 ?auto_19495 ?auto_19496 ?auto_19499 ?auto_19498 ?auto_19497 ?auto_19500 )
      ( MAKE-1CRATE ?auto_19500 ?auto_19501 )
      ( MAKE-10CRATE-VERIFY ?auto_19491 ?auto_19492 ?auto_19493 ?auto_19494 ?auto_19495 ?auto_19496 ?auto_19499 ?auto_19498 ?auto_19497 ?auto_19500 ?auto_19501 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19535 - SURFACE
      ?auto_19536 - SURFACE
    )
    :vars
    (
      ?auto_19537 - HOIST
      ?auto_19538 - PLACE
      ?auto_19540 - PLACE
      ?auto_19541 - HOIST
      ?auto_19542 - SURFACE
      ?auto_19539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19537 ?auto_19538 ) ( SURFACE-AT ?auto_19535 ?auto_19538 ) ( CLEAR ?auto_19535 ) ( IS-CRATE ?auto_19536 ) ( AVAILABLE ?auto_19537 ) ( not ( = ?auto_19540 ?auto_19538 ) ) ( HOIST-AT ?auto_19541 ?auto_19540 ) ( AVAILABLE ?auto_19541 ) ( SURFACE-AT ?auto_19536 ?auto_19540 ) ( ON ?auto_19536 ?auto_19542 ) ( CLEAR ?auto_19536 ) ( TRUCK-AT ?auto_19539 ?auto_19538 ) ( not ( = ?auto_19535 ?auto_19536 ) ) ( not ( = ?auto_19535 ?auto_19542 ) ) ( not ( = ?auto_19536 ?auto_19542 ) ) ( not ( = ?auto_19537 ?auto_19541 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19539 ?auto_19538 ?auto_19540 )
      ( !LIFT ?auto_19541 ?auto_19536 ?auto_19542 ?auto_19540 )
      ( !LOAD ?auto_19541 ?auto_19536 ?auto_19539 ?auto_19540 )
      ( !DRIVE ?auto_19539 ?auto_19540 ?auto_19538 )
      ( !UNLOAD ?auto_19537 ?auto_19536 ?auto_19539 ?auto_19538 )
      ( !DROP ?auto_19537 ?auto_19536 ?auto_19535 ?auto_19538 )
      ( MAKE-1CRATE-VERIFY ?auto_19535 ?auto_19536 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_19555 - SURFACE
      ?auto_19556 - SURFACE
      ?auto_19557 - SURFACE
      ?auto_19558 - SURFACE
      ?auto_19559 - SURFACE
      ?auto_19560 - SURFACE
      ?auto_19563 - SURFACE
      ?auto_19562 - SURFACE
      ?auto_19561 - SURFACE
      ?auto_19564 - SURFACE
      ?auto_19566 - SURFACE
      ?auto_19565 - SURFACE
    )
    :vars
    (
      ?auto_19570 - HOIST
      ?auto_19568 - PLACE
      ?auto_19569 - PLACE
      ?auto_19567 - HOIST
      ?auto_19572 - SURFACE
      ?auto_19590 - PLACE
      ?auto_19589 - HOIST
      ?auto_19600 - SURFACE
      ?auto_19586 - PLACE
      ?auto_19597 - HOIST
      ?auto_19578 - SURFACE
      ?auto_19581 - SURFACE
      ?auto_19574 - PLACE
      ?auto_19593 - HOIST
      ?auto_19594 - SURFACE
      ?auto_19585 - PLACE
      ?auto_19587 - HOIST
      ?auto_19592 - SURFACE
      ?auto_19588 - PLACE
      ?auto_19599 - HOIST
      ?auto_19580 - SURFACE
      ?auto_19573 - PLACE
      ?auto_19591 - HOIST
      ?auto_19595 - SURFACE
      ?auto_19579 - PLACE
      ?auto_19584 - HOIST
      ?auto_19582 - SURFACE
      ?auto_19596 - PLACE
      ?auto_19576 - HOIST
      ?auto_19577 - SURFACE
      ?auto_19598 - PLACE
      ?auto_19583 - HOIST
      ?auto_19575 - SURFACE
      ?auto_19571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19570 ?auto_19568 ) ( IS-CRATE ?auto_19565 ) ( not ( = ?auto_19569 ?auto_19568 ) ) ( HOIST-AT ?auto_19567 ?auto_19569 ) ( AVAILABLE ?auto_19567 ) ( SURFACE-AT ?auto_19565 ?auto_19569 ) ( ON ?auto_19565 ?auto_19572 ) ( CLEAR ?auto_19565 ) ( not ( = ?auto_19566 ?auto_19565 ) ) ( not ( = ?auto_19566 ?auto_19572 ) ) ( not ( = ?auto_19565 ?auto_19572 ) ) ( not ( = ?auto_19570 ?auto_19567 ) ) ( IS-CRATE ?auto_19566 ) ( not ( = ?auto_19590 ?auto_19568 ) ) ( HOIST-AT ?auto_19589 ?auto_19590 ) ( AVAILABLE ?auto_19589 ) ( SURFACE-AT ?auto_19566 ?auto_19590 ) ( ON ?auto_19566 ?auto_19600 ) ( CLEAR ?auto_19566 ) ( not ( = ?auto_19564 ?auto_19566 ) ) ( not ( = ?auto_19564 ?auto_19600 ) ) ( not ( = ?auto_19566 ?auto_19600 ) ) ( not ( = ?auto_19570 ?auto_19589 ) ) ( IS-CRATE ?auto_19564 ) ( not ( = ?auto_19586 ?auto_19568 ) ) ( HOIST-AT ?auto_19597 ?auto_19586 ) ( SURFACE-AT ?auto_19564 ?auto_19586 ) ( ON ?auto_19564 ?auto_19578 ) ( CLEAR ?auto_19564 ) ( not ( = ?auto_19561 ?auto_19564 ) ) ( not ( = ?auto_19561 ?auto_19578 ) ) ( not ( = ?auto_19564 ?auto_19578 ) ) ( not ( = ?auto_19570 ?auto_19597 ) ) ( IS-CRATE ?auto_19561 ) ( AVAILABLE ?auto_19597 ) ( SURFACE-AT ?auto_19561 ?auto_19586 ) ( ON ?auto_19561 ?auto_19581 ) ( CLEAR ?auto_19561 ) ( not ( = ?auto_19562 ?auto_19561 ) ) ( not ( = ?auto_19562 ?auto_19581 ) ) ( not ( = ?auto_19561 ?auto_19581 ) ) ( IS-CRATE ?auto_19562 ) ( not ( = ?auto_19574 ?auto_19568 ) ) ( HOIST-AT ?auto_19593 ?auto_19574 ) ( AVAILABLE ?auto_19593 ) ( SURFACE-AT ?auto_19562 ?auto_19574 ) ( ON ?auto_19562 ?auto_19594 ) ( CLEAR ?auto_19562 ) ( not ( = ?auto_19563 ?auto_19562 ) ) ( not ( = ?auto_19563 ?auto_19594 ) ) ( not ( = ?auto_19562 ?auto_19594 ) ) ( not ( = ?auto_19570 ?auto_19593 ) ) ( IS-CRATE ?auto_19563 ) ( not ( = ?auto_19585 ?auto_19568 ) ) ( HOIST-AT ?auto_19587 ?auto_19585 ) ( AVAILABLE ?auto_19587 ) ( SURFACE-AT ?auto_19563 ?auto_19585 ) ( ON ?auto_19563 ?auto_19592 ) ( CLEAR ?auto_19563 ) ( not ( = ?auto_19560 ?auto_19563 ) ) ( not ( = ?auto_19560 ?auto_19592 ) ) ( not ( = ?auto_19563 ?auto_19592 ) ) ( not ( = ?auto_19570 ?auto_19587 ) ) ( IS-CRATE ?auto_19560 ) ( not ( = ?auto_19588 ?auto_19568 ) ) ( HOIST-AT ?auto_19599 ?auto_19588 ) ( AVAILABLE ?auto_19599 ) ( SURFACE-AT ?auto_19560 ?auto_19588 ) ( ON ?auto_19560 ?auto_19580 ) ( CLEAR ?auto_19560 ) ( not ( = ?auto_19559 ?auto_19560 ) ) ( not ( = ?auto_19559 ?auto_19580 ) ) ( not ( = ?auto_19560 ?auto_19580 ) ) ( not ( = ?auto_19570 ?auto_19599 ) ) ( IS-CRATE ?auto_19559 ) ( not ( = ?auto_19573 ?auto_19568 ) ) ( HOIST-AT ?auto_19591 ?auto_19573 ) ( AVAILABLE ?auto_19591 ) ( SURFACE-AT ?auto_19559 ?auto_19573 ) ( ON ?auto_19559 ?auto_19595 ) ( CLEAR ?auto_19559 ) ( not ( = ?auto_19558 ?auto_19559 ) ) ( not ( = ?auto_19558 ?auto_19595 ) ) ( not ( = ?auto_19559 ?auto_19595 ) ) ( not ( = ?auto_19570 ?auto_19591 ) ) ( IS-CRATE ?auto_19558 ) ( not ( = ?auto_19579 ?auto_19568 ) ) ( HOIST-AT ?auto_19584 ?auto_19579 ) ( AVAILABLE ?auto_19584 ) ( SURFACE-AT ?auto_19558 ?auto_19579 ) ( ON ?auto_19558 ?auto_19582 ) ( CLEAR ?auto_19558 ) ( not ( = ?auto_19557 ?auto_19558 ) ) ( not ( = ?auto_19557 ?auto_19582 ) ) ( not ( = ?auto_19558 ?auto_19582 ) ) ( not ( = ?auto_19570 ?auto_19584 ) ) ( IS-CRATE ?auto_19557 ) ( not ( = ?auto_19596 ?auto_19568 ) ) ( HOIST-AT ?auto_19576 ?auto_19596 ) ( AVAILABLE ?auto_19576 ) ( SURFACE-AT ?auto_19557 ?auto_19596 ) ( ON ?auto_19557 ?auto_19577 ) ( CLEAR ?auto_19557 ) ( not ( = ?auto_19556 ?auto_19557 ) ) ( not ( = ?auto_19556 ?auto_19577 ) ) ( not ( = ?auto_19557 ?auto_19577 ) ) ( not ( = ?auto_19570 ?auto_19576 ) ) ( SURFACE-AT ?auto_19555 ?auto_19568 ) ( CLEAR ?auto_19555 ) ( IS-CRATE ?auto_19556 ) ( AVAILABLE ?auto_19570 ) ( not ( = ?auto_19598 ?auto_19568 ) ) ( HOIST-AT ?auto_19583 ?auto_19598 ) ( AVAILABLE ?auto_19583 ) ( SURFACE-AT ?auto_19556 ?auto_19598 ) ( ON ?auto_19556 ?auto_19575 ) ( CLEAR ?auto_19556 ) ( TRUCK-AT ?auto_19571 ?auto_19568 ) ( not ( = ?auto_19555 ?auto_19556 ) ) ( not ( = ?auto_19555 ?auto_19575 ) ) ( not ( = ?auto_19556 ?auto_19575 ) ) ( not ( = ?auto_19570 ?auto_19583 ) ) ( not ( = ?auto_19555 ?auto_19557 ) ) ( not ( = ?auto_19555 ?auto_19577 ) ) ( not ( = ?auto_19557 ?auto_19575 ) ) ( not ( = ?auto_19596 ?auto_19598 ) ) ( not ( = ?auto_19576 ?auto_19583 ) ) ( not ( = ?auto_19577 ?auto_19575 ) ) ( not ( = ?auto_19555 ?auto_19558 ) ) ( not ( = ?auto_19555 ?auto_19582 ) ) ( not ( = ?auto_19556 ?auto_19558 ) ) ( not ( = ?auto_19556 ?auto_19582 ) ) ( not ( = ?auto_19558 ?auto_19577 ) ) ( not ( = ?auto_19558 ?auto_19575 ) ) ( not ( = ?auto_19579 ?auto_19596 ) ) ( not ( = ?auto_19579 ?auto_19598 ) ) ( not ( = ?auto_19584 ?auto_19576 ) ) ( not ( = ?auto_19584 ?auto_19583 ) ) ( not ( = ?auto_19582 ?auto_19577 ) ) ( not ( = ?auto_19582 ?auto_19575 ) ) ( not ( = ?auto_19555 ?auto_19559 ) ) ( not ( = ?auto_19555 ?auto_19595 ) ) ( not ( = ?auto_19556 ?auto_19559 ) ) ( not ( = ?auto_19556 ?auto_19595 ) ) ( not ( = ?auto_19557 ?auto_19559 ) ) ( not ( = ?auto_19557 ?auto_19595 ) ) ( not ( = ?auto_19559 ?auto_19582 ) ) ( not ( = ?auto_19559 ?auto_19577 ) ) ( not ( = ?auto_19559 ?auto_19575 ) ) ( not ( = ?auto_19573 ?auto_19579 ) ) ( not ( = ?auto_19573 ?auto_19596 ) ) ( not ( = ?auto_19573 ?auto_19598 ) ) ( not ( = ?auto_19591 ?auto_19584 ) ) ( not ( = ?auto_19591 ?auto_19576 ) ) ( not ( = ?auto_19591 ?auto_19583 ) ) ( not ( = ?auto_19595 ?auto_19582 ) ) ( not ( = ?auto_19595 ?auto_19577 ) ) ( not ( = ?auto_19595 ?auto_19575 ) ) ( not ( = ?auto_19555 ?auto_19560 ) ) ( not ( = ?auto_19555 ?auto_19580 ) ) ( not ( = ?auto_19556 ?auto_19560 ) ) ( not ( = ?auto_19556 ?auto_19580 ) ) ( not ( = ?auto_19557 ?auto_19560 ) ) ( not ( = ?auto_19557 ?auto_19580 ) ) ( not ( = ?auto_19558 ?auto_19560 ) ) ( not ( = ?auto_19558 ?auto_19580 ) ) ( not ( = ?auto_19560 ?auto_19595 ) ) ( not ( = ?auto_19560 ?auto_19582 ) ) ( not ( = ?auto_19560 ?auto_19577 ) ) ( not ( = ?auto_19560 ?auto_19575 ) ) ( not ( = ?auto_19588 ?auto_19573 ) ) ( not ( = ?auto_19588 ?auto_19579 ) ) ( not ( = ?auto_19588 ?auto_19596 ) ) ( not ( = ?auto_19588 ?auto_19598 ) ) ( not ( = ?auto_19599 ?auto_19591 ) ) ( not ( = ?auto_19599 ?auto_19584 ) ) ( not ( = ?auto_19599 ?auto_19576 ) ) ( not ( = ?auto_19599 ?auto_19583 ) ) ( not ( = ?auto_19580 ?auto_19595 ) ) ( not ( = ?auto_19580 ?auto_19582 ) ) ( not ( = ?auto_19580 ?auto_19577 ) ) ( not ( = ?auto_19580 ?auto_19575 ) ) ( not ( = ?auto_19555 ?auto_19563 ) ) ( not ( = ?auto_19555 ?auto_19592 ) ) ( not ( = ?auto_19556 ?auto_19563 ) ) ( not ( = ?auto_19556 ?auto_19592 ) ) ( not ( = ?auto_19557 ?auto_19563 ) ) ( not ( = ?auto_19557 ?auto_19592 ) ) ( not ( = ?auto_19558 ?auto_19563 ) ) ( not ( = ?auto_19558 ?auto_19592 ) ) ( not ( = ?auto_19559 ?auto_19563 ) ) ( not ( = ?auto_19559 ?auto_19592 ) ) ( not ( = ?auto_19563 ?auto_19580 ) ) ( not ( = ?auto_19563 ?auto_19595 ) ) ( not ( = ?auto_19563 ?auto_19582 ) ) ( not ( = ?auto_19563 ?auto_19577 ) ) ( not ( = ?auto_19563 ?auto_19575 ) ) ( not ( = ?auto_19585 ?auto_19588 ) ) ( not ( = ?auto_19585 ?auto_19573 ) ) ( not ( = ?auto_19585 ?auto_19579 ) ) ( not ( = ?auto_19585 ?auto_19596 ) ) ( not ( = ?auto_19585 ?auto_19598 ) ) ( not ( = ?auto_19587 ?auto_19599 ) ) ( not ( = ?auto_19587 ?auto_19591 ) ) ( not ( = ?auto_19587 ?auto_19584 ) ) ( not ( = ?auto_19587 ?auto_19576 ) ) ( not ( = ?auto_19587 ?auto_19583 ) ) ( not ( = ?auto_19592 ?auto_19580 ) ) ( not ( = ?auto_19592 ?auto_19595 ) ) ( not ( = ?auto_19592 ?auto_19582 ) ) ( not ( = ?auto_19592 ?auto_19577 ) ) ( not ( = ?auto_19592 ?auto_19575 ) ) ( not ( = ?auto_19555 ?auto_19562 ) ) ( not ( = ?auto_19555 ?auto_19594 ) ) ( not ( = ?auto_19556 ?auto_19562 ) ) ( not ( = ?auto_19556 ?auto_19594 ) ) ( not ( = ?auto_19557 ?auto_19562 ) ) ( not ( = ?auto_19557 ?auto_19594 ) ) ( not ( = ?auto_19558 ?auto_19562 ) ) ( not ( = ?auto_19558 ?auto_19594 ) ) ( not ( = ?auto_19559 ?auto_19562 ) ) ( not ( = ?auto_19559 ?auto_19594 ) ) ( not ( = ?auto_19560 ?auto_19562 ) ) ( not ( = ?auto_19560 ?auto_19594 ) ) ( not ( = ?auto_19562 ?auto_19592 ) ) ( not ( = ?auto_19562 ?auto_19580 ) ) ( not ( = ?auto_19562 ?auto_19595 ) ) ( not ( = ?auto_19562 ?auto_19582 ) ) ( not ( = ?auto_19562 ?auto_19577 ) ) ( not ( = ?auto_19562 ?auto_19575 ) ) ( not ( = ?auto_19574 ?auto_19585 ) ) ( not ( = ?auto_19574 ?auto_19588 ) ) ( not ( = ?auto_19574 ?auto_19573 ) ) ( not ( = ?auto_19574 ?auto_19579 ) ) ( not ( = ?auto_19574 ?auto_19596 ) ) ( not ( = ?auto_19574 ?auto_19598 ) ) ( not ( = ?auto_19593 ?auto_19587 ) ) ( not ( = ?auto_19593 ?auto_19599 ) ) ( not ( = ?auto_19593 ?auto_19591 ) ) ( not ( = ?auto_19593 ?auto_19584 ) ) ( not ( = ?auto_19593 ?auto_19576 ) ) ( not ( = ?auto_19593 ?auto_19583 ) ) ( not ( = ?auto_19594 ?auto_19592 ) ) ( not ( = ?auto_19594 ?auto_19580 ) ) ( not ( = ?auto_19594 ?auto_19595 ) ) ( not ( = ?auto_19594 ?auto_19582 ) ) ( not ( = ?auto_19594 ?auto_19577 ) ) ( not ( = ?auto_19594 ?auto_19575 ) ) ( not ( = ?auto_19555 ?auto_19561 ) ) ( not ( = ?auto_19555 ?auto_19581 ) ) ( not ( = ?auto_19556 ?auto_19561 ) ) ( not ( = ?auto_19556 ?auto_19581 ) ) ( not ( = ?auto_19557 ?auto_19561 ) ) ( not ( = ?auto_19557 ?auto_19581 ) ) ( not ( = ?auto_19558 ?auto_19561 ) ) ( not ( = ?auto_19558 ?auto_19581 ) ) ( not ( = ?auto_19559 ?auto_19561 ) ) ( not ( = ?auto_19559 ?auto_19581 ) ) ( not ( = ?auto_19560 ?auto_19561 ) ) ( not ( = ?auto_19560 ?auto_19581 ) ) ( not ( = ?auto_19563 ?auto_19561 ) ) ( not ( = ?auto_19563 ?auto_19581 ) ) ( not ( = ?auto_19561 ?auto_19594 ) ) ( not ( = ?auto_19561 ?auto_19592 ) ) ( not ( = ?auto_19561 ?auto_19580 ) ) ( not ( = ?auto_19561 ?auto_19595 ) ) ( not ( = ?auto_19561 ?auto_19582 ) ) ( not ( = ?auto_19561 ?auto_19577 ) ) ( not ( = ?auto_19561 ?auto_19575 ) ) ( not ( = ?auto_19586 ?auto_19574 ) ) ( not ( = ?auto_19586 ?auto_19585 ) ) ( not ( = ?auto_19586 ?auto_19588 ) ) ( not ( = ?auto_19586 ?auto_19573 ) ) ( not ( = ?auto_19586 ?auto_19579 ) ) ( not ( = ?auto_19586 ?auto_19596 ) ) ( not ( = ?auto_19586 ?auto_19598 ) ) ( not ( = ?auto_19597 ?auto_19593 ) ) ( not ( = ?auto_19597 ?auto_19587 ) ) ( not ( = ?auto_19597 ?auto_19599 ) ) ( not ( = ?auto_19597 ?auto_19591 ) ) ( not ( = ?auto_19597 ?auto_19584 ) ) ( not ( = ?auto_19597 ?auto_19576 ) ) ( not ( = ?auto_19597 ?auto_19583 ) ) ( not ( = ?auto_19581 ?auto_19594 ) ) ( not ( = ?auto_19581 ?auto_19592 ) ) ( not ( = ?auto_19581 ?auto_19580 ) ) ( not ( = ?auto_19581 ?auto_19595 ) ) ( not ( = ?auto_19581 ?auto_19582 ) ) ( not ( = ?auto_19581 ?auto_19577 ) ) ( not ( = ?auto_19581 ?auto_19575 ) ) ( not ( = ?auto_19555 ?auto_19564 ) ) ( not ( = ?auto_19555 ?auto_19578 ) ) ( not ( = ?auto_19556 ?auto_19564 ) ) ( not ( = ?auto_19556 ?auto_19578 ) ) ( not ( = ?auto_19557 ?auto_19564 ) ) ( not ( = ?auto_19557 ?auto_19578 ) ) ( not ( = ?auto_19558 ?auto_19564 ) ) ( not ( = ?auto_19558 ?auto_19578 ) ) ( not ( = ?auto_19559 ?auto_19564 ) ) ( not ( = ?auto_19559 ?auto_19578 ) ) ( not ( = ?auto_19560 ?auto_19564 ) ) ( not ( = ?auto_19560 ?auto_19578 ) ) ( not ( = ?auto_19563 ?auto_19564 ) ) ( not ( = ?auto_19563 ?auto_19578 ) ) ( not ( = ?auto_19562 ?auto_19564 ) ) ( not ( = ?auto_19562 ?auto_19578 ) ) ( not ( = ?auto_19564 ?auto_19581 ) ) ( not ( = ?auto_19564 ?auto_19594 ) ) ( not ( = ?auto_19564 ?auto_19592 ) ) ( not ( = ?auto_19564 ?auto_19580 ) ) ( not ( = ?auto_19564 ?auto_19595 ) ) ( not ( = ?auto_19564 ?auto_19582 ) ) ( not ( = ?auto_19564 ?auto_19577 ) ) ( not ( = ?auto_19564 ?auto_19575 ) ) ( not ( = ?auto_19578 ?auto_19581 ) ) ( not ( = ?auto_19578 ?auto_19594 ) ) ( not ( = ?auto_19578 ?auto_19592 ) ) ( not ( = ?auto_19578 ?auto_19580 ) ) ( not ( = ?auto_19578 ?auto_19595 ) ) ( not ( = ?auto_19578 ?auto_19582 ) ) ( not ( = ?auto_19578 ?auto_19577 ) ) ( not ( = ?auto_19578 ?auto_19575 ) ) ( not ( = ?auto_19555 ?auto_19566 ) ) ( not ( = ?auto_19555 ?auto_19600 ) ) ( not ( = ?auto_19556 ?auto_19566 ) ) ( not ( = ?auto_19556 ?auto_19600 ) ) ( not ( = ?auto_19557 ?auto_19566 ) ) ( not ( = ?auto_19557 ?auto_19600 ) ) ( not ( = ?auto_19558 ?auto_19566 ) ) ( not ( = ?auto_19558 ?auto_19600 ) ) ( not ( = ?auto_19559 ?auto_19566 ) ) ( not ( = ?auto_19559 ?auto_19600 ) ) ( not ( = ?auto_19560 ?auto_19566 ) ) ( not ( = ?auto_19560 ?auto_19600 ) ) ( not ( = ?auto_19563 ?auto_19566 ) ) ( not ( = ?auto_19563 ?auto_19600 ) ) ( not ( = ?auto_19562 ?auto_19566 ) ) ( not ( = ?auto_19562 ?auto_19600 ) ) ( not ( = ?auto_19561 ?auto_19566 ) ) ( not ( = ?auto_19561 ?auto_19600 ) ) ( not ( = ?auto_19566 ?auto_19578 ) ) ( not ( = ?auto_19566 ?auto_19581 ) ) ( not ( = ?auto_19566 ?auto_19594 ) ) ( not ( = ?auto_19566 ?auto_19592 ) ) ( not ( = ?auto_19566 ?auto_19580 ) ) ( not ( = ?auto_19566 ?auto_19595 ) ) ( not ( = ?auto_19566 ?auto_19582 ) ) ( not ( = ?auto_19566 ?auto_19577 ) ) ( not ( = ?auto_19566 ?auto_19575 ) ) ( not ( = ?auto_19590 ?auto_19586 ) ) ( not ( = ?auto_19590 ?auto_19574 ) ) ( not ( = ?auto_19590 ?auto_19585 ) ) ( not ( = ?auto_19590 ?auto_19588 ) ) ( not ( = ?auto_19590 ?auto_19573 ) ) ( not ( = ?auto_19590 ?auto_19579 ) ) ( not ( = ?auto_19590 ?auto_19596 ) ) ( not ( = ?auto_19590 ?auto_19598 ) ) ( not ( = ?auto_19589 ?auto_19597 ) ) ( not ( = ?auto_19589 ?auto_19593 ) ) ( not ( = ?auto_19589 ?auto_19587 ) ) ( not ( = ?auto_19589 ?auto_19599 ) ) ( not ( = ?auto_19589 ?auto_19591 ) ) ( not ( = ?auto_19589 ?auto_19584 ) ) ( not ( = ?auto_19589 ?auto_19576 ) ) ( not ( = ?auto_19589 ?auto_19583 ) ) ( not ( = ?auto_19600 ?auto_19578 ) ) ( not ( = ?auto_19600 ?auto_19581 ) ) ( not ( = ?auto_19600 ?auto_19594 ) ) ( not ( = ?auto_19600 ?auto_19592 ) ) ( not ( = ?auto_19600 ?auto_19580 ) ) ( not ( = ?auto_19600 ?auto_19595 ) ) ( not ( = ?auto_19600 ?auto_19582 ) ) ( not ( = ?auto_19600 ?auto_19577 ) ) ( not ( = ?auto_19600 ?auto_19575 ) ) ( not ( = ?auto_19555 ?auto_19565 ) ) ( not ( = ?auto_19555 ?auto_19572 ) ) ( not ( = ?auto_19556 ?auto_19565 ) ) ( not ( = ?auto_19556 ?auto_19572 ) ) ( not ( = ?auto_19557 ?auto_19565 ) ) ( not ( = ?auto_19557 ?auto_19572 ) ) ( not ( = ?auto_19558 ?auto_19565 ) ) ( not ( = ?auto_19558 ?auto_19572 ) ) ( not ( = ?auto_19559 ?auto_19565 ) ) ( not ( = ?auto_19559 ?auto_19572 ) ) ( not ( = ?auto_19560 ?auto_19565 ) ) ( not ( = ?auto_19560 ?auto_19572 ) ) ( not ( = ?auto_19563 ?auto_19565 ) ) ( not ( = ?auto_19563 ?auto_19572 ) ) ( not ( = ?auto_19562 ?auto_19565 ) ) ( not ( = ?auto_19562 ?auto_19572 ) ) ( not ( = ?auto_19561 ?auto_19565 ) ) ( not ( = ?auto_19561 ?auto_19572 ) ) ( not ( = ?auto_19564 ?auto_19565 ) ) ( not ( = ?auto_19564 ?auto_19572 ) ) ( not ( = ?auto_19565 ?auto_19600 ) ) ( not ( = ?auto_19565 ?auto_19578 ) ) ( not ( = ?auto_19565 ?auto_19581 ) ) ( not ( = ?auto_19565 ?auto_19594 ) ) ( not ( = ?auto_19565 ?auto_19592 ) ) ( not ( = ?auto_19565 ?auto_19580 ) ) ( not ( = ?auto_19565 ?auto_19595 ) ) ( not ( = ?auto_19565 ?auto_19582 ) ) ( not ( = ?auto_19565 ?auto_19577 ) ) ( not ( = ?auto_19565 ?auto_19575 ) ) ( not ( = ?auto_19569 ?auto_19590 ) ) ( not ( = ?auto_19569 ?auto_19586 ) ) ( not ( = ?auto_19569 ?auto_19574 ) ) ( not ( = ?auto_19569 ?auto_19585 ) ) ( not ( = ?auto_19569 ?auto_19588 ) ) ( not ( = ?auto_19569 ?auto_19573 ) ) ( not ( = ?auto_19569 ?auto_19579 ) ) ( not ( = ?auto_19569 ?auto_19596 ) ) ( not ( = ?auto_19569 ?auto_19598 ) ) ( not ( = ?auto_19567 ?auto_19589 ) ) ( not ( = ?auto_19567 ?auto_19597 ) ) ( not ( = ?auto_19567 ?auto_19593 ) ) ( not ( = ?auto_19567 ?auto_19587 ) ) ( not ( = ?auto_19567 ?auto_19599 ) ) ( not ( = ?auto_19567 ?auto_19591 ) ) ( not ( = ?auto_19567 ?auto_19584 ) ) ( not ( = ?auto_19567 ?auto_19576 ) ) ( not ( = ?auto_19567 ?auto_19583 ) ) ( not ( = ?auto_19572 ?auto_19600 ) ) ( not ( = ?auto_19572 ?auto_19578 ) ) ( not ( = ?auto_19572 ?auto_19581 ) ) ( not ( = ?auto_19572 ?auto_19594 ) ) ( not ( = ?auto_19572 ?auto_19592 ) ) ( not ( = ?auto_19572 ?auto_19580 ) ) ( not ( = ?auto_19572 ?auto_19595 ) ) ( not ( = ?auto_19572 ?auto_19582 ) ) ( not ( = ?auto_19572 ?auto_19577 ) ) ( not ( = ?auto_19572 ?auto_19575 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_19555 ?auto_19556 ?auto_19557 ?auto_19558 ?auto_19559 ?auto_19560 ?auto_19563 ?auto_19562 ?auto_19561 ?auto_19564 ?auto_19566 )
      ( MAKE-1CRATE ?auto_19566 ?auto_19565 )
      ( MAKE-11CRATE-VERIFY ?auto_19555 ?auto_19556 ?auto_19557 ?auto_19558 ?auto_19559 ?auto_19560 ?auto_19563 ?auto_19562 ?auto_19561 ?auto_19564 ?auto_19566 ?auto_19565 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19603 - SURFACE
      ?auto_19604 - SURFACE
    )
    :vars
    (
      ?auto_19605 - HOIST
      ?auto_19606 - PLACE
      ?auto_19608 - PLACE
      ?auto_19609 - HOIST
      ?auto_19610 - SURFACE
      ?auto_19607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19605 ?auto_19606 ) ( SURFACE-AT ?auto_19603 ?auto_19606 ) ( CLEAR ?auto_19603 ) ( IS-CRATE ?auto_19604 ) ( AVAILABLE ?auto_19605 ) ( not ( = ?auto_19608 ?auto_19606 ) ) ( HOIST-AT ?auto_19609 ?auto_19608 ) ( AVAILABLE ?auto_19609 ) ( SURFACE-AT ?auto_19604 ?auto_19608 ) ( ON ?auto_19604 ?auto_19610 ) ( CLEAR ?auto_19604 ) ( TRUCK-AT ?auto_19607 ?auto_19606 ) ( not ( = ?auto_19603 ?auto_19604 ) ) ( not ( = ?auto_19603 ?auto_19610 ) ) ( not ( = ?auto_19604 ?auto_19610 ) ) ( not ( = ?auto_19605 ?auto_19609 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19607 ?auto_19606 ?auto_19608 )
      ( !LIFT ?auto_19609 ?auto_19604 ?auto_19610 ?auto_19608 )
      ( !LOAD ?auto_19609 ?auto_19604 ?auto_19607 ?auto_19608 )
      ( !DRIVE ?auto_19607 ?auto_19608 ?auto_19606 )
      ( !UNLOAD ?auto_19605 ?auto_19604 ?auto_19607 ?auto_19606 )
      ( !DROP ?auto_19605 ?auto_19604 ?auto_19603 ?auto_19606 )
      ( MAKE-1CRATE-VERIFY ?auto_19603 ?auto_19604 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_19624 - SURFACE
      ?auto_19625 - SURFACE
      ?auto_19626 - SURFACE
      ?auto_19627 - SURFACE
      ?auto_19628 - SURFACE
      ?auto_19629 - SURFACE
      ?auto_19632 - SURFACE
      ?auto_19631 - SURFACE
      ?auto_19630 - SURFACE
      ?auto_19633 - SURFACE
      ?auto_19635 - SURFACE
      ?auto_19634 - SURFACE
      ?auto_19636 - SURFACE
    )
    :vars
    (
      ?auto_19641 - HOIST
      ?auto_19639 - PLACE
      ?auto_19640 - PLACE
      ?auto_19637 - HOIST
      ?auto_19642 - SURFACE
      ?auto_19650 - PLACE
      ?auto_19669 - HOIST
      ?auto_19657 - SURFACE
      ?auto_19646 - PLACE
      ?auto_19651 - HOIST
      ?auto_19644 - SURFACE
      ?auto_19660 - PLACE
      ?auto_19653 - HOIST
      ?auto_19643 - SURFACE
      ?auto_19665 - SURFACE
      ?auto_19664 - PLACE
      ?auto_19670 - HOIST
      ?auto_19673 - SURFACE
      ?auto_19649 - PLACE
      ?auto_19661 - HOIST
      ?auto_19662 - SURFACE
      ?auto_19658 - PLACE
      ?auto_19666 - HOIST
      ?auto_19648 - SURFACE
      ?auto_19667 - PLACE
      ?auto_19656 - HOIST
      ?auto_19668 - SURFACE
      ?auto_19645 - PLACE
      ?auto_19663 - HOIST
      ?auto_19672 - SURFACE
      ?auto_19655 - PLACE
      ?auto_19652 - HOIST
      ?auto_19659 - SURFACE
      ?auto_19647 - PLACE
      ?auto_19671 - HOIST
      ?auto_19654 - SURFACE
      ?auto_19638 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19641 ?auto_19639 ) ( IS-CRATE ?auto_19636 ) ( not ( = ?auto_19640 ?auto_19639 ) ) ( HOIST-AT ?auto_19637 ?auto_19640 ) ( AVAILABLE ?auto_19637 ) ( SURFACE-AT ?auto_19636 ?auto_19640 ) ( ON ?auto_19636 ?auto_19642 ) ( CLEAR ?auto_19636 ) ( not ( = ?auto_19634 ?auto_19636 ) ) ( not ( = ?auto_19634 ?auto_19642 ) ) ( not ( = ?auto_19636 ?auto_19642 ) ) ( not ( = ?auto_19641 ?auto_19637 ) ) ( IS-CRATE ?auto_19634 ) ( not ( = ?auto_19650 ?auto_19639 ) ) ( HOIST-AT ?auto_19669 ?auto_19650 ) ( AVAILABLE ?auto_19669 ) ( SURFACE-AT ?auto_19634 ?auto_19650 ) ( ON ?auto_19634 ?auto_19657 ) ( CLEAR ?auto_19634 ) ( not ( = ?auto_19635 ?auto_19634 ) ) ( not ( = ?auto_19635 ?auto_19657 ) ) ( not ( = ?auto_19634 ?auto_19657 ) ) ( not ( = ?auto_19641 ?auto_19669 ) ) ( IS-CRATE ?auto_19635 ) ( not ( = ?auto_19646 ?auto_19639 ) ) ( HOIST-AT ?auto_19651 ?auto_19646 ) ( AVAILABLE ?auto_19651 ) ( SURFACE-AT ?auto_19635 ?auto_19646 ) ( ON ?auto_19635 ?auto_19644 ) ( CLEAR ?auto_19635 ) ( not ( = ?auto_19633 ?auto_19635 ) ) ( not ( = ?auto_19633 ?auto_19644 ) ) ( not ( = ?auto_19635 ?auto_19644 ) ) ( not ( = ?auto_19641 ?auto_19651 ) ) ( IS-CRATE ?auto_19633 ) ( not ( = ?auto_19660 ?auto_19639 ) ) ( HOIST-AT ?auto_19653 ?auto_19660 ) ( SURFACE-AT ?auto_19633 ?auto_19660 ) ( ON ?auto_19633 ?auto_19643 ) ( CLEAR ?auto_19633 ) ( not ( = ?auto_19630 ?auto_19633 ) ) ( not ( = ?auto_19630 ?auto_19643 ) ) ( not ( = ?auto_19633 ?auto_19643 ) ) ( not ( = ?auto_19641 ?auto_19653 ) ) ( IS-CRATE ?auto_19630 ) ( AVAILABLE ?auto_19653 ) ( SURFACE-AT ?auto_19630 ?auto_19660 ) ( ON ?auto_19630 ?auto_19665 ) ( CLEAR ?auto_19630 ) ( not ( = ?auto_19631 ?auto_19630 ) ) ( not ( = ?auto_19631 ?auto_19665 ) ) ( not ( = ?auto_19630 ?auto_19665 ) ) ( IS-CRATE ?auto_19631 ) ( not ( = ?auto_19664 ?auto_19639 ) ) ( HOIST-AT ?auto_19670 ?auto_19664 ) ( AVAILABLE ?auto_19670 ) ( SURFACE-AT ?auto_19631 ?auto_19664 ) ( ON ?auto_19631 ?auto_19673 ) ( CLEAR ?auto_19631 ) ( not ( = ?auto_19632 ?auto_19631 ) ) ( not ( = ?auto_19632 ?auto_19673 ) ) ( not ( = ?auto_19631 ?auto_19673 ) ) ( not ( = ?auto_19641 ?auto_19670 ) ) ( IS-CRATE ?auto_19632 ) ( not ( = ?auto_19649 ?auto_19639 ) ) ( HOIST-AT ?auto_19661 ?auto_19649 ) ( AVAILABLE ?auto_19661 ) ( SURFACE-AT ?auto_19632 ?auto_19649 ) ( ON ?auto_19632 ?auto_19662 ) ( CLEAR ?auto_19632 ) ( not ( = ?auto_19629 ?auto_19632 ) ) ( not ( = ?auto_19629 ?auto_19662 ) ) ( not ( = ?auto_19632 ?auto_19662 ) ) ( not ( = ?auto_19641 ?auto_19661 ) ) ( IS-CRATE ?auto_19629 ) ( not ( = ?auto_19658 ?auto_19639 ) ) ( HOIST-AT ?auto_19666 ?auto_19658 ) ( AVAILABLE ?auto_19666 ) ( SURFACE-AT ?auto_19629 ?auto_19658 ) ( ON ?auto_19629 ?auto_19648 ) ( CLEAR ?auto_19629 ) ( not ( = ?auto_19628 ?auto_19629 ) ) ( not ( = ?auto_19628 ?auto_19648 ) ) ( not ( = ?auto_19629 ?auto_19648 ) ) ( not ( = ?auto_19641 ?auto_19666 ) ) ( IS-CRATE ?auto_19628 ) ( not ( = ?auto_19667 ?auto_19639 ) ) ( HOIST-AT ?auto_19656 ?auto_19667 ) ( AVAILABLE ?auto_19656 ) ( SURFACE-AT ?auto_19628 ?auto_19667 ) ( ON ?auto_19628 ?auto_19668 ) ( CLEAR ?auto_19628 ) ( not ( = ?auto_19627 ?auto_19628 ) ) ( not ( = ?auto_19627 ?auto_19668 ) ) ( not ( = ?auto_19628 ?auto_19668 ) ) ( not ( = ?auto_19641 ?auto_19656 ) ) ( IS-CRATE ?auto_19627 ) ( not ( = ?auto_19645 ?auto_19639 ) ) ( HOIST-AT ?auto_19663 ?auto_19645 ) ( AVAILABLE ?auto_19663 ) ( SURFACE-AT ?auto_19627 ?auto_19645 ) ( ON ?auto_19627 ?auto_19672 ) ( CLEAR ?auto_19627 ) ( not ( = ?auto_19626 ?auto_19627 ) ) ( not ( = ?auto_19626 ?auto_19672 ) ) ( not ( = ?auto_19627 ?auto_19672 ) ) ( not ( = ?auto_19641 ?auto_19663 ) ) ( IS-CRATE ?auto_19626 ) ( not ( = ?auto_19655 ?auto_19639 ) ) ( HOIST-AT ?auto_19652 ?auto_19655 ) ( AVAILABLE ?auto_19652 ) ( SURFACE-AT ?auto_19626 ?auto_19655 ) ( ON ?auto_19626 ?auto_19659 ) ( CLEAR ?auto_19626 ) ( not ( = ?auto_19625 ?auto_19626 ) ) ( not ( = ?auto_19625 ?auto_19659 ) ) ( not ( = ?auto_19626 ?auto_19659 ) ) ( not ( = ?auto_19641 ?auto_19652 ) ) ( SURFACE-AT ?auto_19624 ?auto_19639 ) ( CLEAR ?auto_19624 ) ( IS-CRATE ?auto_19625 ) ( AVAILABLE ?auto_19641 ) ( not ( = ?auto_19647 ?auto_19639 ) ) ( HOIST-AT ?auto_19671 ?auto_19647 ) ( AVAILABLE ?auto_19671 ) ( SURFACE-AT ?auto_19625 ?auto_19647 ) ( ON ?auto_19625 ?auto_19654 ) ( CLEAR ?auto_19625 ) ( TRUCK-AT ?auto_19638 ?auto_19639 ) ( not ( = ?auto_19624 ?auto_19625 ) ) ( not ( = ?auto_19624 ?auto_19654 ) ) ( not ( = ?auto_19625 ?auto_19654 ) ) ( not ( = ?auto_19641 ?auto_19671 ) ) ( not ( = ?auto_19624 ?auto_19626 ) ) ( not ( = ?auto_19624 ?auto_19659 ) ) ( not ( = ?auto_19626 ?auto_19654 ) ) ( not ( = ?auto_19655 ?auto_19647 ) ) ( not ( = ?auto_19652 ?auto_19671 ) ) ( not ( = ?auto_19659 ?auto_19654 ) ) ( not ( = ?auto_19624 ?auto_19627 ) ) ( not ( = ?auto_19624 ?auto_19672 ) ) ( not ( = ?auto_19625 ?auto_19627 ) ) ( not ( = ?auto_19625 ?auto_19672 ) ) ( not ( = ?auto_19627 ?auto_19659 ) ) ( not ( = ?auto_19627 ?auto_19654 ) ) ( not ( = ?auto_19645 ?auto_19655 ) ) ( not ( = ?auto_19645 ?auto_19647 ) ) ( not ( = ?auto_19663 ?auto_19652 ) ) ( not ( = ?auto_19663 ?auto_19671 ) ) ( not ( = ?auto_19672 ?auto_19659 ) ) ( not ( = ?auto_19672 ?auto_19654 ) ) ( not ( = ?auto_19624 ?auto_19628 ) ) ( not ( = ?auto_19624 ?auto_19668 ) ) ( not ( = ?auto_19625 ?auto_19628 ) ) ( not ( = ?auto_19625 ?auto_19668 ) ) ( not ( = ?auto_19626 ?auto_19628 ) ) ( not ( = ?auto_19626 ?auto_19668 ) ) ( not ( = ?auto_19628 ?auto_19672 ) ) ( not ( = ?auto_19628 ?auto_19659 ) ) ( not ( = ?auto_19628 ?auto_19654 ) ) ( not ( = ?auto_19667 ?auto_19645 ) ) ( not ( = ?auto_19667 ?auto_19655 ) ) ( not ( = ?auto_19667 ?auto_19647 ) ) ( not ( = ?auto_19656 ?auto_19663 ) ) ( not ( = ?auto_19656 ?auto_19652 ) ) ( not ( = ?auto_19656 ?auto_19671 ) ) ( not ( = ?auto_19668 ?auto_19672 ) ) ( not ( = ?auto_19668 ?auto_19659 ) ) ( not ( = ?auto_19668 ?auto_19654 ) ) ( not ( = ?auto_19624 ?auto_19629 ) ) ( not ( = ?auto_19624 ?auto_19648 ) ) ( not ( = ?auto_19625 ?auto_19629 ) ) ( not ( = ?auto_19625 ?auto_19648 ) ) ( not ( = ?auto_19626 ?auto_19629 ) ) ( not ( = ?auto_19626 ?auto_19648 ) ) ( not ( = ?auto_19627 ?auto_19629 ) ) ( not ( = ?auto_19627 ?auto_19648 ) ) ( not ( = ?auto_19629 ?auto_19668 ) ) ( not ( = ?auto_19629 ?auto_19672 ) ) ( not ( = ?auto_19629 ?auto_19659 ) ) ( not ( = ?auto_19629 ?auto_19654 ) ) ( not ( = ?auto_19658 ?auto_19667 ) ) ( not ( = ?auto_19658 ?auto_19645 ) ) ( not ( = ?auto_19658 ?auto_19655 ) ) ( not ( = ?auto_19658 ?auto_19647 ) ) ( not ( = ?auto_19666 ?auto_19656 ) ) ( not ( = ?auto_19666 ?auto_19663 ) ) ( not ( = ?auto_19666 ?auto_19652 ) ) ( not ( = ?auto_19666 ?auto_19671 ) ) ( not ( = ?auto_19648 ?auto_19668 ) ) ( not ( = ?auto_19648 ?auto_19672 ) ) ( not ( = ?auto_19648 ?auto_19659 ) ) ( not ( = ?auto_19648 ?auto_19654 ) ) ( not ( = ?auto_19624 ?auto_19632 ) ) ( not ( = ?auto_19624 ?auto_19662 ) ) ( not ( = ?auto_19625 ?auto_19632 ) ) ( not ( = ?auto_19625 ?auto_19662 ) ) ( not ( = ?auto_19626 ?auto_19632 ) ) ( not ( = ?auto_19626 ?auto_19662 ) ) ( not ( = ?auto_19627 ?auto_19632 ) ) ( not ( = ?auto_19627 ?auto_19662 ) ) ( not ( = ?auto_19628 ?auto_19632 ) ) ( not ( = ?auto_19628 ?auto_19662 ) ) ( not ( = ?auto_19632 ?auto_19648 ) ) ( not ( = ?auto_19632 ?auto_19668 ) ) ( not ( = ?auto_19632 ?auto_19672 ) ) ( not ( = ?auto_19632 ?auto_19659 ) ) ( not ( = ?auto_19632 ?auto_19654 ) ) ( not ( = ?auto_19649 ?auto_19658 ) ) ( not ( = ?auto_19649 ?auto_19667 ) ) ( not ( = ?auto_19649 ?auto_19645 ) ) ( not ( = ?auto_19649 ?auto_19655 ) ) ( not ( = ?auto_19649 ?auto_19647 ) ) ( not ( = ?auto_19661 ?auto_19666 ) ) ( not ( = ?auto_19661 ?auto_19656 ) ) ( not ( = ?auto_19661 ?auto_19663 ) ) ( not ( = ?auto_19661 ?auto_19652 ) ) ( not ( = ?auto_19661 ?auto_19671 ) ) ( not ( = ?auto_19662 ?auto_19648 ) ) ( not ( = ?auto_19662 ?auto_19668 ) ) ( not ( = ?auto_19662 ?auto_19672 ) ) ( not ( = ?auto_19662 ?auto_19659 ) ) ( not ( = ?auto_19662 ?auto_19654 ) ) ( not ( = ?auto_19624 ?auto_19631 ) ) ( not ( = ?auto_19624 ?auto_19673 ) ) ( not ( = ?auto_19625 ?auto_19631 ) ) ( not ( = ?auto_19625 ?auto_19673 ) ) ( not ( = ?auto_19626 ?auto_19631 ) ) ( not ( = ?auto_19626 ?auto_19673 ) ) ( not ( = ?auto_19627 ?auto_19631 ) ) ( not ( = ?auto_19627 ?auto_19673 ) ) ( not ( = ?auto_19628 ?auto_19631 ) ) ( not ( = ?auto_19628 ?auto_19673 ) ) ( not ( = ?auto_19629 ?auto_19631 ) ) ( not ( = ?auto_19629 ?auto_19673 ) ) ( not ( = ?auto_19631 ?auto_19662 ) ) ( not ( = ?auto_19631 ?auto_19648 ) ) ( not ( = ?auto_19631 ?auto_19668 ) ) ( not ( = ?auto_19631 ?auto_19672 ) ) ( not ( = ?auto_19631 ?auto_19659 ) ) ( not ( = ?auto_19631 ?auto_19654 ) ) ( not ( = ?auto_19664 ?auto_19649 ) ) ( not ( = ?auto_19664 ?auto_19658 ) ) ( not ( = ?auto_19664 ?auto_19667 ) ) ( not ( = ?auto_19664 ?auto_19645 ) ) ( not ( = ?auto_19664 ?auto_19655 ) ) ( not ( = ?auto_19664 ?auto_19647 ) ) ( not ( = ?auto_19670 ?auto_19661 ) ) ( not ( = ?auto_19670 ?auto_19666 ) ) ( not ( = ?auto_19670 ?auto_19656 ) ) ( not ( = ?auto_19670 ?auto_19663 ) ) ( not ( = ?auto_19670 ?auto_19652 ) ) ( not ( = ?auto_19670 ?auto_19671 ) ) ( not ( = ?auto_19673 ?auto_19662 ) ) ( not ( = ?auto_19673 ?auto_19648 ) ) ( not ( = ?auto_19673 ?auto_19668 ) ) ( not ( = ?auto_19673 ?auto_19672 ) ) ( not ( = ?auto_19673 ?auto_19659 ) ) ( not ( = ?auto_19673 ?auto_19654 ) ) ( not ( = ?auto_19624 ?auto_19630 ) ) ( not ( = ?auto_19624 ?auto_19665 ) ) ( not ( = ?auto_19625 ?auto_19630 ) ) ( not ( = ?auto_19625 ?auto_19665 ) ) ( not ( = ?auto_19626 ?auto_19630 ) ) ( not ( = ?auto_19626 ?auto_19665 ) ) ( not ( = ?auto_19627 ?auto_19630 ) ) ( not ( = ?auto_19627 ?auto_19665 ) ) ( not ( = ?auto_19628 ?auto_19630 ) ) ( not ( = ?auto_19628 ?auto_19665 ) ) ( not ( = ?auto_19629 ?auto_19630 ) ) ( not ( = ?auto_19629 ?auto_19665 ) ) ( not ( = ?auto_19632 ?auto_19630 ) ) ( not ( = ?auto_19632 ?auto_19665 ) ) ( not ( = ?auto_19630 ?auto_19673 ) ) ( not ( = ?auto_19630 ?auto_19662 ) ) ( not ( = ?auto_19630 ?auto_19648 ) ) ( not ( = ?auto_19630 ?auto_19668 ) ) ( not ( = ?auto_19630 ?auto_19672 ) ) ( not ( = ?auto_19630 ?auto_19659 ) ) ( not ( = ?auto_19630 ?auto_19654 ) ) ( not ( = ?auto_19660 ?auto_19664 ) ) ( not ( = ?auto_19660 ?auto_19649 ) ) ( not ( = ?auto_19660 ?auto_19658 ) ) ( not ( = ?auto_19660 ?auto_19667 ) ) ( not ( = ?auto_19660 ?auto_19645 ) ) ( not ( = ?auto_19660 ?auto_19655 ) ) ( not ( = ?auto_19660 ?auto_19647 ) ) ( not ( = ?auto_19653 ?auto_19670 ) ) ( not ( = ?auto_19653 ?auto_19661 ) ) ( not ( = ?auto_19653 ?auto_19666 ) ) ( not ( = ?auto_19653 ?auto_19656 ) ) ( not ( = ?auto_19653 ?auto_19663 ) ) ( not ( = ?auto_19653 ?auto_19652 ) ) ( not ( = ?auto_19653 ?auto_19671 ) ) ( not ( = ?auto_19665 ?auto_19673 ) ) ( not ( = ?auto_19665 ?auto_19662 ) ) ( not ( = ?auto_19665 ?auto_19648 ) ) ( not ( = ?auto_19665 ?auto_19668 ) ) ( not ( = ?auto_19665 ?auto_19672 ) ) ( not ( = ?auto_19665 ?auto_19659 ) ) ( not ( = ?auto_19665 ?auto_19654 ) ) ( not ( = ?auto_19624 ?auto_19633 ) ) ( not ( = ?auto_19624 ?auto_19643 ) ) ( not ( = ?auto_19625 ?auto_19633 ) ) ( not ( = ?auto_19625 ?auto_19643 ) ) ( not ( = ?auto_19626 ?auto_19633 ) ) ( not ( = ?auto_19626 ?auto_19643 ) ) ( not ( = ?auto_19627 ?auto_19633 ) ) ( not ( = ?auto_19627 ?auto_19643 ) ) ( not ( = ?auto_19628 ?auto_19633 ) ) ( not ( = ?auto_19628 ?auto_19643 ) ) ( not ( = ?auto_19629 ?auto_19633 ) ) ( not ( = ?auto_19629 ?auto_19643 ) ) ( not ( = ?auto_19632 ?auto_19633 ) ) ( not ( = ?auto_19632 ?auto_19643 ) ) ( not ( = ?auto_19631 ?auto_19633 ) ) ( not ( = ?auto_19631 ?auto_19643 ) ) ( not ( = ?auto_19633 ?auto_19665 ) ) ( not ( = ?auto_19633 ?auto_19673 ) ) ( not ( = ?auto_19633 ?auto_19662 ) ) ( not ( = ?auto_19633 ?auto_19648 ) ) ( not ( = ?auto_19633 ?auto_19668 ) ) ( not ( = ?auto_19633 ?auto_19672 ) ) ( not ( = ?auto_19633 ?auto_19659 ) ) ( not ( = ?auto_19633 ?auto_19654 ) ) ( not ( = ?auto_19643 ?auto_19665 ) ) ( not ( = ?auto_19643 ?auto_19673 ) ) ( not ( = ?auto_19643 ?auto_19662 ) ) ( not ( = ?auto_19643 ?auto_19648 ) ) ( not ( = ?auto_19643 ?auto_19668 ) ) ( not ( = ?auto_19643 ?auto_19672 ) ) ( not ( = ?auto_19643 ?auto_19659 ) ) ( not ( = ?auto_19643 ?auto_19654 ) ) ( not ( = ?auto_19624 ?auto_19635 ) ) ( not ( = ?auto_19624 ?auto_19644 ) ) ( not ( = ?auto_19625 ?auto_19635 ) ) ( not ( = ?auto_19625 ?auto_19644 ) ) ( not ( = ?auto_19626 ?auto_19635 ) ) ( not ( = ?auto_19626 ?auto_19644 ) ) ( not ( = ?auto_19627 ?auto_19635 ) ) ( not ( = ?auto_19627 ?auto_19644 ) ) ( not ( = ?auto_19628 ?auto_19635 ) ) ( not ( = ?auto_19628 ?auto_19644 ) ) ( not ( = ?auto_19629 ?auto_19635 ) ) ( not ( = ?auto_19629 ?auto_19644 ) ) ( not ( = ?auto_19632 ?auto_19635 ) ) ( not ( = ?auto_19632 ?auto_19644 ) ) ( not ( = ?auto_19631 ?auto_19635 ) ) ( not ( = ?auto_19631 ?auto_19644 ) ) ( not ( = ?auto_19630 ?auto_19635 ) ) ( not ( = ?auto_19630 ?auto_19644 ) ) ( not ( = ?auto_19635 ?auto_19643 ) ) ( not ( = ?auto_19635 ?auto_19665 ) ) ( not ( = ?auto_19635 ?auto_19673 ) ) ( not ( = ?auto_19635 ?auto_19662 ) ) ( not ( = ?auto_19635 ?auto_19648 ) ) ( not ( = ?auto_19635 ?auto_19668 ) ) ( not ( = ?auto_19635 ?auto_19672 ) ) ( not ( = ?auto_19635 ?auto_19659 ) ) ( not ( = ?auto_19635 ?auto_19654 ) ) ( not ( = ?auto_19646 ?auto_19660 ) ) ( not ( = ?auto_19646 ?auto_19664 ) ) ( not ( = ?auto_19646 ?auto_19649 ) ) ( not ( = ?auto_19646 ?auto_19658 ) ) ( not ( = ?auto_19646 ?auto_19667 ) ) ( not ( = ?auto_19646 ?auto_19645 ) ) ( not ( = ?auto_19646 ?auto_19655 ) ) ( not ( = ?auto_19646 ?auto_19647 ) ) ( not ( = ?auto_19651 ?auto_19653 ) ) ( not ( = ?auto_19651 ?auto_19670 ) ) ( not ( = ?auto_19651 ?auto_19661 ) ) ( not ( = ?auto_19651 ?auto_19666 ) ) ( not ( = ?auto_19651 ?auto_19656 ) ) ( not ( = ?auto_19651 ?auto_19663 ) ) ( not ( = ?auto_19651 ?auto_19652 ) ) ( not ( = ?auto_19651 ?auto_19671 ) ) ( not ( = ?auto_19644 ?auto_19643 ) ) ( not ( = ?auto_19644 ?auto_19665 ) ) ( not ( = ?auto_19644 ?auto_19673 ) ) ( not ( = ?auto_19644 ?auto_19662 ) ) ( not ( = ?auto_19644 ?auto_19648 ) ) ( not ( = ?auto_19644 ?auto_19668 ) ) ( not ( = ?auto_19644 ?auto_19672 ) ) ( not ( = ?auto_19644 ?auto_19659 ) ) ( not ( = ?auto_19644 ?auto_19654 ) ) ( not ( = ?auto_19624 ?auto_19634 ) ) ( not ( = ?auto_19624 ?auto_19657 ) ) ( not ( = ?auto_19625 ?auto_19634 ) ) ( not ( = ?auto_19625 ?auto_19657 ) ) ( not ( = ?auto_19626 ?auto_19634 ) ) ( not ( = ?auto_19626 ?auto_19657 ) ) ( not ( = ?auto_19627 ?auto_19634 ) ) ( not ( = ?auto_19627 ?auto_19657 ) ) ( not ( = ?auto_19628 ?auto_19634 ) ) ( not ( = ?auto_19628 ?auto_19657 ) ) ( not ( = ?auto_19629 ?auto_19634 ) ) ( not ( = ?auto_19629 ?auto_19657 ) ) ( not ( = ?auto_19632 ?auto_19634 ) ) ( not ( = ?auto_19632 ?auto_19657 ) ) ( not ( = ?auto_19631 ?auto_19634 ) ) ( not ( = ?auto_19631 ?auto_19657 ) ) ( not ( = ?auto_19630 ?auto_19634 ) ) ( not ( = ?auto_19630 ?auto_19657 ) ) ( not ( = ?auto_19633 ?auto_19634 ) ) ( not ( = ?auto_19633 ?auto_19657 ) ) ( not ( = ?auto_19634 ?auto_19644 ) ) ( not ( = ?auto_19634 ?auto_19643 ) ) ( not ( = ?auto_19634 ?auto_19665 ) ) ( not ( = ?auto_19634 ?auto_19673 ) ) ( not ( = ?auto_19634 ?auto_19662 ) ) ( not ( = ?auto_19634 ?auto_19648 ) ) ( not ( = ?auto_19634 ?auto_19668 ) ) ( not ( = ?auto_19634 ?auto_19672 ) ) ( not ( = ?auto_19634 ?auto_19659 ) ) ( not ( = ?auto_19634 ?auto_19654 ) ) ( not ( = ?auto_19650 ?auto_19646 ) ) ( not ( = ?auto_19650 ?auto_19660 ) ) ( not ( = ?auto_19650 ?auto_19664 ) ) ( not ( = ?auto_19650 ?auto_19649 ) ) ( not ( = ?auto_19650 ?auto_19658 ) ) ( not ( = ?auto_19650 ?auto_19667 ) ) ( not ( = ?auto_19650 ?auto_19645 ) ) ( not ( = ?auto_19650 ?auto_19655 ) ) ( not ( = ?auto_19650 ?auto_19647 ) ) ( not ( = ?auto_19669 ?auto_19651 ) ) ( not ( = ?auto_19669 ?auto_19653 ) ) ( not ( = ?auto_19669 ?auto_19670 ) ) ( not ( = ?auto_19669 ?auto_19661 ) ) ( not ( = ?auto_19669 ?auto_19666 ) ) ( not ( = ?auto_19669 ?auto_19656 ) ) ( not ( = ?auto_19669 ?auto_19663 ) ) ( not ( = ?auto_19669 ?auto_19652 ) ) ( not ( = ?auto_19669 ?auto_19671 ) ) ( not ( = ?auto_19657 ?auto_19644 ) ) ( not ( = ?auto_19657 ?auto_19643 ) ) ( not ( = ?auto_19657 ?auto_19665 ) ) ( not ( = ?auto_19657 ?auto_19673 ) ) ( not ( = ?auto_19657 ?auto_19662 ) ) ( not ( = ?auto_19657 ?auto_19648 ) ) ( not ( = ?auto_19657 ?auto_19668 ) ) ( not ( = ?auto_19657 ?auto_19672 ) ) ( not ( = ?auto_19657 ?auto_19659 ) ) ( not ( = ?auto_19657 ?auto_19654 ) ) ( not ( = ?auto_19624 ?auto_19636 ) ) ( not ( = ?auto_19624 ?auto_19642 ) ) ( not ( = ?auto_19625 ?auto_19636 ) ) ( not ( = ?auto_19625 ?auto_19642 ) ) ( not ( = ?auto_19626 ?auto_19636 ) ) ( not ( = ?auto_19626 ?auto_19642 ) ) ( not ( = ?auto_19627 ?auto_19636 ) ) ( not ( = ?auto_19627 ?auto_19642 ) ) ( not ( = ?auto_19628 ?auto_19636 ) ) ( not ( = ?auto_19628 ?auto_19642 ) ) ( not ( = ?auto_19629 ?auto_19636 ) ) ( not ( = ?auto_19629 ?auto_19642 ) ) ( not ( = ?auto_19632 ?auto_19636 ) ) ( not ( = ?auto_19632 ?auto_19642 ) ) ( not ( = ?auto_19631 ?auto_19636 ) ) ( not ( = ?auto_19631 ?auto_19642 ) ) ( not ( = ?auto_19630 ?auto_19636 ) ) ( not ( = ?auto_19630 ?auto_19642 ) ) ( not ( = ?auto_19633 ?auto_19636 ) ) ( not ( = ?auto_19633 ?auto_19642 ) ) ( not ( = ?auto_19635 ?auto_19636 ) ) ( not ( = ?auto_19635 ?auto_19642 ) ) ( not ( = ?auto_19636 ?auto_19657 ) ) ( not ( = ?auto_19636 ?auto_19644 ) ) ( not ( = ?auto_19636 ?auto_19643 ) ) ( not ( = ?auto_19636 ?auto_19665 ) ) ( not ( = ?auto_19636 ?auto_19673 ) ) ( not ( = ?auto_19636 ?auto_19662 ) ) ( not ( = ?auto_19636 ?auto_19648 ) ) ( not ( = ?auto_19636 ?auto_19668 ) ) ( not ( = ?auto_19636 ?auto_19672 ) ) ( not ( = ?auto_19636 ?auto_19659 ) ) ( not ( = ?auto_19636 ?auto_19654 ) ) ( not ( = ?auto_19640 ?auto_19650 ) ) ( not ( = ?auto_19640 ?auto_19646 ) ) ( not ( = ?auto_19640 ?auto_19660 ) ) ( not ( = ?auto_19640 ?auto_19664 ) ) ( not ( = ?auto_19640 ?auto_19649 ) ) ( not ( = ?auto_19640 ?auto_19658 ) ) ( not ( = ?auto_19640 ?auto_19667 ) ) ( not ( = ?auto_19640 ?auto_19645 ) ) ( not ( = ?auto_19640 ?auto_19655 ) ) ( not ( = ?auto_19640 ?auto_19647 ) ) ( not ( = ?auto_19637 ?auto_19669 ) ) ( not ( = ?auto_19637 ?auto_19651 ) ) ( not ( = ?auto_19637 ?auto_19653 ) ) ( not ( = ?auto_19637 ?auto_19670 ) ) ( not ( = ?auto_19637 ?auto_19661 ) ) ( not ( = ?auto_19637 ?auto_19666 ) ) ( not ( = ?auto_19637 ?auto_19656 ) ) ( not ( = ?auto_19637 ?auto_19663 ) ) ( not ( = ?auto_19637 ?auto_19652 ) ) ( not ( = ?auto_19637 ?auto_19671 ) ) ( not ( = ?auto_19642 ?auto_19657 ) ) ( not ( = ?auto_19642 ?auto_19644 ) ) ( not ( = ?auto_19642 ?auto_19643 ) ) ( not ( = ?auto_19642 ?auto_19665 ) ) ( not ( = ?auto_19642 ?auto_19673 ) ) ( not ( = ?auto_19642 ?auto_19662 ) ) ( not ( = ?auto_19642 ?auto_19648 ) ) ( not ( = ?auto_19642 ?auto_19668 ) ) ( not ( = ?auto_19642 ?auto_19672 ) ) ( not ( = ?auto_19642 ?auto_19659 ) ) ( not ( = ?auto_19642 ?auto_19654 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_19624 ?auto_19625 ?auto_19626 ?auto_19627 ?auto_19628 ?auto_19629 ?auto_19632 ?auto_19631 ?auto_19630 ?auto_19633 ?auto_19635 ?auto_19634 )
      ( MAKE-1CRATE ?auto_19634 ?auto_19636 )
      ( MAKE-12CRATE-VERIFY ?auto_19624 ?auto_19625 ?auto_19626 ?auto_19627 ?auto_19628 ?auto_19629 ?auto_19632 ?auto_19631 ?auto_19630 ?auto_19633 ?auto_19635 ?auto_19634 ?auto_19636 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19676 - SURFACE
      ?auto_19677 - SURFACE
    )
    :vars
    (
      ?auto_19678 - HOIST
      ?auto_19679 - PLACE
      ?auto_19681 - PLACE
      ?auto_19682 - HOIST
      ?auto_19683 - SURFACE
      ?auto_19680 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19678 ?auto_19679 ) ( SURFACE-AT ?auto_19676 ?auto_19679 ) ( CLEAR ?auto_19676 ) ( IS-CRATE ?auto_19677 ) ( AVAILABLE ?auto_19678 ) ( not ( = ?auto_19681 ?auto_19679 ) ) ( HOIST-AT ?auto_19682 ?auto_19681 ) ( AVAILABLE ?auto_19682 ) ( SURFACE-AT ?auto_19677 ?auto_19681 ) ( ON ?auto_19677 ?auto_19683 ) ( CLEAR ?auto_19677 ) ( TRUCK-AT ?auto_19680 ?auto_19679 ) ( not ( = ?auto_19676 ?auto_19677 ) ) ( not ( = ?auto_19676 ?auto_19683 ) ) ( not ( = ?auto_19677 ?auto_19683 ) ) ( not ( = ?auto_19678 ?auto_19682 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19680 ?auto_19679 ?auto_19681 )
      ( !LIFT ?auto_19682 ?auto_19677 ?auto_19683 ?auto_19681 )
      ( !LOAD ?auto_19682 ?auto_19677 ?auto_19680 ?auto_19681 )
      ( !DRIVE ?auto_19680 ?auto_19681 ?auto_19679 )
      ( !UNLOAD ?auto_19678 ?auto_19677 ?auto_19680 ?auto_19679 )
      ( !DROP ?auto_19678 ?auto_19677 ?auto_19676 ?auto_19679 )
      ( MAKE-1CRATE-VERIFY ?auto_19676 ?auto_19677 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_19698 - SURFACE
      ?auto_19699 - SURFACE
      ?auto_19700 - SURFACE
      ?auto_19701 - SURFACE
      ?auto_19702 - SURFACE
      ?auto_19703 - SURFACE
      ?auto_19706 - SURFACE
      ?auto_19705 - SURFACE
      ?auto_19704 - SURFACE
      ?auto_19707 - SURFACE
      ?auto_19709 - SURFACE
      ?auto_19708 - SURFACE
      ?auto_19710 - SURFACE
      ?auto_19711 - SURFACE
    )
    :vars
    (
      ?auto_19714 - HOIST
      ?auto_19717 - PLACE
      ?auto_19715 - PLACE
      ?auto_19713 - HOIST
      ?auto_19716 - SURFACE
      ?auto_19736 - PLACE
      ?auto_19718 - HOIST
      ?auto_19749 - SURFACE
      ?auto_19720 - PLACE
      ?auto_19734 - HOIST
      ?auto_19738 - SURFACE
      ?auto_19730 - PLACE
      ?auto_19724 - HOIST
      ?auto_19725 - SURFACE
      ?auto_19737 - SURFACE
      ?auto_19739 - SURFACE
      ?auto_19747 - PLACE
      ?auto_19727 - HOIST
      ?auto_19741 - SURFACE
      ?auto_19726 - PLACE
      ?auto_19735 - HOIST
      ?auto_19740 - SURFACE
      ?auto_19722 - PLACE
      ?auto_19746 - HOIST
      ?auto_19732 - SURFACE
      ?auto_19729 - PLACE
      ?auto_19719 - HOIST
      ?auto_19728 - SURFACE
      ?auto_19731 - PLACE
      ?auto_19723 - HOIST
      ?auto_19743 - SURFACE
      ?auto_19733 - PLACE
      ?auto_19721 - HOIST
      ?auto_19748 - SURFACE
      ?auto_19742 - PLACE
      ?auto_19744 - HOIST
      ?auto_19745 - SURFACE
      ?auto_19712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19714 ?auto_19717 ) ( IS-CRATE ?auto_19711 ) ( not ( = ?auto_19715 ?auto_19717 ) ) ( HOIST-AT ?auto_19713 ?auto_19715 ) ( SURFACE-AT ?auto_19711 ?auto_19715 ) ( ON ?auto_19711 ?auto_19716 ) ( CLEAR ?auto_19711 ) ( not ( = ?auto_19710 ?auto_19711 ) ) ( not ( = ?auto_19710 ?auto_19716 ) ) ( not ( = ?auto_19711 ?auto_19716 ) ) ( not ( = ?auto_19714 ?auto_19713 ) ) ( IS-CRATE ?auto_19710 ) ( not ( = ?auto_19736 ?auto_19717 ) ) ( HOIST-AT ?auto_19718 ?auto_19736 ) ( AVAILABLE ?auto_19718 ) ( SURFACE-AT ?auto_19710 ?auto_19736 ) ( ON ?auto_19710 ?auto_19749 ) ( CLEAR ?auto_19710 ) ( not ( = ?auto_19708 ?auto_19710 ) ) ( not ( = ?auto_19708 ?auto_19749 ) ) ( not ( = ?auto_19710 ?auto_19749 ) ) ( not ( = ?auto_19714 ?auto_19718 ) ) ( IS-CRATE ?auto_19708 ) ( not ( = ?auto_19720 ?auto_19717 ) ) ( HOIST-AT ?auto_19734 ?auto_19720 ) ( AVAILABLE ?auto_19734 ) ( SURFACE-AT ?auto_19708 ?auto_19720 ) ( ON ?auto_19708 ?auto_19738 ) ( CLEAR ?auto_19708 ) ( not ( = ?auto_19709 ?auto_19708 ) ) ( not ( = ?auto_19709 ?auto_19738 ) ) ( not ( = ?auto_19708 ?auto_19738 ) ) ( not ( = ?auto_19714 ?auto_19734 ) ) ( IS-CRATE ?auto_19709 ) ( not ( = ?auto_19730 ?auto_19717 ) ) ( HOIST-AT ?auto_19724 ?auto_19730 ) ( AVAILABLE ?auto_19724 ) ( SURFACE-AT ?auto_19709 ?auto_19730 ) ( ON ?auto_19709 ?auto_19725 ) ( CLEAR ?auto_19709 ) ( not ( = ?auto_19707 ?auto_19709 ) ) ( not ( = ?auto_19707 ?auto_19725 ) ) ( not ( = ?auto_19709 ?auto_19725 ) ) ( not ( = ?auto_19714 ?auto_19724 ) ) ( IS-CRATE ?auto_19707 ) ( SURFACE-AT ?auto_19707 ?auto_19715 ) ( ON ?auto_19707 ?auto_19737 ) ( CLEAR ?auto_19707 ) ( not ( = ?auto_19704 ?auto_19707 ) ) ( not ( = ?auto_19704 ?auto_19737 ) ) ( not ( = ?auto_19707 ?auto_19737 ) ) ( IS-CRATE ?auto_19704 ) ( AVAILABLE ?auto_19713 ) ( SURFACE-AT ?auto_19704 ?auto_19715 ) ( ON ?auto_19704 ?auto_19739 ) ( CLEAR ?auto_19704 ) ( not ( = ?auto_19705 ?auto_19704 ) ) ( not ( = ?auto_19705 ?auto_19739 ) ) ( not ( = ?auto_19704 ?auto_19739 ) ) ( IS-CRATE ?auto_19705 ) ( not ( = ?auto_19747 ?auto_19717 ) ) ( HOIST-AT ?auto_19727 ?auto_19747 ) ( AVAILABLE ?auto_19727 ) ( SURFACE-AT ?auto_19705 ?auto_19747 ) ( ON ?auto_19705 ?auto_19741 ) ( CLEAR ?auto_19705 ) ( not ( = ?auto_19706 ?auto_19705 ) ) ( not ( = ?auto_19706 ?auto_19741 ) ) ( not ( = ?auto_19705 ?auto_19741 ) ) ( not ( = ?auto_19714 ?auto_19727 ) ) ( IS-CRATE ?auto_19706 ) ( not ( = ?auto_19726 ?auto_19717 ) ) ( HOIST-AT ?auto_19735 ?auto_19726 ) ( AVAILABLE ?auto_19735 ) ( SURFACE-AT ?auto_19706 ?auto_19726 ) ( ON ?auto_19706 ?auto_19740 ) ( CLEAR ?auto_19706 ) ( not ( = ?auto_19703 ?auto_19706 ) ) ( not ( = ?auto_19703 ?auto_19740 ) ) ( not ( = ?auto_19706 ?auto_19740 ) ) ( not ( = ?auto_19714 ?auto_19735 ) ) ( IS-CRATE ?auto_19703 ) ( not ( = ?auto_19722 ?auto_19717 ) ) ( HOIST-AT ?auto_19746 ?auto_19722 ) ( AVAILABLE ?auto_19746 ) ( SURFACE-AT ?auto_19703 ?auto_19722 ) ( ON ?auto_19703 ?auto_19732 ) ( CLEAR ?auto_19703 ) ( not ( = ?auto_19702 ?auto_19703 ) ) ( not ( = ?auto_19702 ?auto_19732 ) ) ( not ( = ?auto_19703 ?auto_19732 ) ) ( not ( = ?auto_19714 ?auto_19746 ) ) ( IS-CRATE ?auto_19702 ) ( not ( = ?auto_19729 ?auto_19717 ) ) ( HOIST-AT ?auto_19719 ?auto_19729 ) ( AVAILABLE ?auto_19719 ) ( SURFACE-AT ?auto_19702 ?auto_19729 ) ( ON ?auto_19702 ?auto_19728 ) ( CLEAR ?auto_19702 ) ( not ( = ?auto_19701 ?auto_19702 ) ) ( not ( = ?auto_19701 ?auto_19728 ) ) ( not ( = ?auto_19702 ?auto_19728 ) ) ( not ( = ?auto_19714 ?auto_19719 ) ) ( IS-CRATE ?auto_19701 ) ( not ( = ?auto_19731 ?auto_19717 ) ) ( HOIST-AT ?auto_19723 ?auto_19731 ) ( AVAILABLE ?auto_19723 ) ( SURFACE-AT ?auto_19701 ?auto_19731 ) ( ON ?auto_19701 ?auto_19743 ) ( CLEAR ?auto_19701 ) ( not ( = ?auto_19700 ?auto_19701 ) ) ( not ( = ?auto_19700 ?auto_19743 ) ) ( not ( = ?auto_19701 ?auto_19743 ) ) ( not ( = ?auto_19714 ?auto_19723 ) ) ( IS-CRATE ?auto_19700 ) ( not ( = ?auto_19733 ?auto_19717 ) ) ( HOIST-AT ?auto_19721 ?auto_19733 ) ( AVAILABLE ?auto_19721 ) ( SURFACE-AT ?auto_19700 ?auto_19733 ) ( ON ?auto_19700 ?auto_19748 ) ( CLEAR ?auto_19700 ) ( not ( = ?auto_19699 ?auto_19700 ) ) ( not ( = ?auto_19699 ?auto_19748 ) ) ( not ( = ?auto_19700 ?auto_19748 ) ) ( not ( = ?auto_19714 ?auto_19721 ) ) ( SURFACE-AT ?auto_19698 ?auto_19717 ) ( CLEAR ?auto_19698 ) ( IS-CRATE ?auto_19699 ) ( AVAILABLE ?auto_19714 ) ( not ( = ?auto_19742 ?auto_19717 ) ) ( HOIST-AT ?auto_19744 ?auto_19742 ) ( AVAILABLE ?auto_19744 ) ( SURFACE-AT ?auto_19699 ?auto_19742 ) ( ON ?auto_19699 ?auto_19745 ) ( CLEAR ?auto_19699 ) ( TRUCK-AT ?auto_19712 ?auto_19717 ) ( not ( = ?auto_19698 ?auto_19699 ) ) ( not ( = ?auto_19698 ?auto_19745 ) ) ( not ( = ?auto_19699 ?auto_19745 ) ) ( not ( = ?auto_19714 ?auto_19744 ) ) ( not ( = ?auto_19698 ?auto_19700 ) ) ( not ( = ?auto_19698 ?auto_19748 ) ) ( not ( = ?auto_19700 ?auto_19745 ) ) ( not ( = ?auto_19733 ?auto_19742 ) ) ( not ( = ?auto_19721 ?auto_19744 ) ) ( not ( = ?auto_19748 ?auto_19745 ) ) ( not ( = ?auto_19698 ?auto_19701 ) ) ( not ( = ?auto_19698 ?auto_19743 ) ) ( not ( = ?auto_19699 ?auto_19701 ) ) ( not ( = ?auto_19699 ?auto_19743 ) ) ( not ( = ?auto_19701 ?auto_19748 ) ) ( not ( = ?auto_19701 ?auto_19745 ) ) ( not ( = ?auto_19731 ?auto_19733 ) ) ( not ( = ?auto_19731 ?auto_19742 ) ) ( not ( = ?auto_19723 ?auto_19721 ) ) ( not ( = ?auto_19723 ?auto_19744 ) ) ( not ( = ?auto_19743 ?auto_19748 ) ) ( not ( = ?auto_19743 ?auto_19745 ) ) ( not ( = ?auto_19698 ?auto_19702 ) ) ( not ( = ?auto_19698 ?auto_19728 ) ) ( not ( = ?auto_19699 ?auto_19702 ) ) ( not ( = ?auto_19699 ?auto_19728 ) ) ( not ( = ?auto_19700 ?auto_19702 ) ) ( not ( = ?auto_19700 ?auto_19728 ) ) ( not ( = ?auto_19702 ?auto_19743 ) ) ( not ( = ?auto_19702 ?auto_19748 ) ) ( not ( = ?auto_19702 ?auto_19745 ) ) ( not ( = ?auto_19729 ?auto_19731 ) ) ( not ( = ?auto_19729 ?auto_19733 ) ) ( not ( = ?auto_19729 ?auto_19742 ) ) ( not ( = ?auto_19719 ?auto_19723 ) ) ( not ( = ?auto_19719 ?auto_19721 ) ) ( not ( = ?auto_19719 ?auto_19744 ) ) ( not ( = ?auto_19728 ?auto_19743 ) ) ( not ( = ?auto_19728 ?auto_19748 ) ) ( not ( = ?auto_19728 ?auto_19745 ) ) ( not ( = ?auto_19698 ?auto_19703 ) ) ( not ( = ?auto_19698 ?auto_19732 ) ) ( not ( = ?auto_19699 ?auto_19703 ) ) ( not ( = ?auto_19699 ?auto_19732 ) ) ( not ( = ?auto_19700 ?auto_19703 ) ) ( not ( = ?auto_19700 ?auto_19732 ) ) ( not ( = ?auto_19701 ?auto_19703 ) ) ( not ( = ?auto_19701 ?auto_19732 ) ) ( not ( = ?auto_19703 ?auto_19728 ) ) ( not ( = ?auto_19703 ?auto_19743 ) ) ( not ( = ?auto_19703 ?auto_19748 ) ) ( not ( = ?auto_19703 ?auto_19745 ) ) ( not ( = ?auto_19722 ?auto_19729 ) ) ( not ( = ?auto_19722 ?auto_19731 ) ) ( not ( = ?auto_19722 ?auto_19733 ) ) ( not ( = ?auto_19722 ?auto_19742 ) ) ( not ( = ?auto_19746 ?auto_19719 ) ) ( not ( = ?auto_19746 ?auto_19723 ) ) ( not ( = ?auto_19746 ?auto_19721 ) ) ( not ( = ?auto_19746 ?auto_19744 ) ) ( not ( = ?auto_19732 ?auto_19728 ) ) ( not ( = ?auto_19732 ?auto_19743 ) ) ( not ( = ?auto_19732 ?auto_19748 ) ) ( not ( = ?auto_19732 ?auto_19745 ) ) ( not ( = ?auto_19698 ?auto_19706 ) ) ( not ( = ?auto_19698 ?auto_19740 ) ) ( not ( = ?auto_19699 ?auto_19706 ) ) ( not ( = ?auto_19699 ?auto_19740 ) ) ( not ( = ?auto_19700 ?auto_19706 ) ) ( not ( = ?auto_19700 ?auto_19740 ) ) ( not ( = ?auto_19701 ?auto_19706 ) ) ( not ( = ?auto_19701 ?auto_19740 ) ) ( not ( = ?auto_19702 ?auto_19706 ) ) ( not ( = ?auto_19702 ?auto_19740 ) ) ( not ( = ?auto_19706 ?auto_19732 ) ) ( not ( = ?auto_19706 ?auto_19728 ) ) ( not ( = ?auto_19706 ?auto_19743 ) ) ( not ( = ?auto_19706 ?auto_19748 ) ) ( not ( = ?auto_19706 ?auto_19745 ) ) ( not ( = ?auto_19726 ?auto_19722 ) ) ( not ( = ?auto_19726 ?auto_19729 ) ) ( not ( = ?auto_19726 ?auto_19731 ) ) ( not ( = ?auto_19726 ?auto_19733 ) ) ( not ( = ?auto_19726 ?auto_19742 ) ) ( not ( = ?auto_19735 ?auto_19746 ) ) ( not ( = ?auto_19735 ?auto_19719 ) ) ( not ( = ?auto_19735 ?auto_19723 ) ) ( not ( = ?auto_19735 ?auto_19721 ) ) ( not ( = ?auto_19735 ?auto_19744 ) ) ( not ( = ?auto_19740 ?auto_19732 ) ) ( not ( = ?auto_19740 ?auto_19728 ) ) ( not ( = ?auto_19740 ?auto_19743 ) ) ( not ( = ?auto_19740 ?auto_19748 ) ) ( not ( = ?auto_19740 ?auto_19745 ) ) ( not ( = ?auto_19698 ?auto_19705 ) ) ( not ( = ?auto_19698 ?auto_19741 ) ) ( not ( = ?auto_19699 ?auto_19705 ) ) ( not ( = ?auto_19699 ?auto_19741 ) ) ( not ( = ?auto_19700 ?auto_19705 ) ) ( not ( = ?auto_19700 ?auto_19741 ) ) ( not ( = ?auto_19701 ?auto_19705 ) ) ( not ( = ?auto_19701 ?auto_19741 ) ) ( not ( = ?auto_19702 ?auto_19705 ) ) ( not ( = ?auto_19702 ?auto_19741 ) ) ( not ( = ?auto_19703 ?auto_19705 ) ) ( not ( = ?auto_19703 ?auto_19741 ) ) ( not ( = ?auto_19705 ?auto_19740 ) ) ( not ( = ?auto_19705 ?auto_19732 ) ) ( not ( = ?auto_19705 ?auto_19728 ) ) ( not ( = ?auto_19705 ?auto_19743 ) ) ( not ( = ?auto_19705 ?auto_19748 ) ) ( not ( = ?auto_19705 ?auto_19745 ) ) ( not ( = ?auto_19747 ?auto_19726 ) ) ( not ( = ?auto_19747 ?auto_19722 ) ) ( not ( = ?auto_19747 ?auto_19729 ) ) ( not ( = ?auto_19747 ?auto_19731 ) ) ( not ( = ?auto_19747 ?auto_19733 ) ) ( not ( = ?auto_19747 ?auto_19742 ) ) ( not ( = ?auto_19727 ?auto_19735 ) ) ( not ( = ?auto_19727 ?auto_19746 ) ) ( not ( = ?auto_19727 ?auto_19719 ) ) ( not ( = ?auto_19727 ?auto_19723 ) ) ( not ( = ?auto_19727 ?auto_19721 ) ) ( not ( = ?auto_19727 ?auto_19744 ) ) ( not ( = ?auto_19741 ?auto_19740 ) ) ( not ( = ?auto_19741 ?auto_19732 ) ) ( not ( = ?auto_19741 ?auto_19728 ) ) ( not ( = ?auto_19741 ?auto_19743 ) ) ( not ( = ?auto_19741 ?auto_19748 ) ) ( not ( = ?auto_19741 ?auto_19745 ) ) ( not ( = ?auto_19698 ?auto_19704 ) ) ( not ( = ?auto_19698 ?auto_19739 ) ) ( not ( = ?auto_19699 ?auto_19704 ) ) ( not ( = ?auto_19699 ?auto_19739 ) ) ( not ( = ?auto_19700 ?auto_19704 ) ) ( not ( = ?auto_19700 ?auto_19739 ) ) ( not ( = ?auto_19701 ?auto_19704 ) ) ( not ( = ?auto_19701 ?auto_19739 ) ) ( not ( = ?auto_19702 ?auto_19704 ) ) ( not ( = ?auto_19702 ?auto_19739 ) ) ( not ( = ?auto_19703 ?auto_19704 ) ) ( not ( = ?auto_19703 ?auto_19739 ) ) ( not ( = ?auto_19706 ?auto_19704 ) ) ( not ( = ?auto_19706 ?auto_19739 ) ) ( not ( = ?auto_19704 ?auto_19741 ) ) ( not ( = ?auto_19704 ?auto_19740 ) ) ( not ( = ?auto_19704 ?auto_19732 ) ) ( not ( = ?auto_19704 ?auto_19728 ) ) ( not ( = ?auto_19704 ?auto_19743 ) ) ( not ( = ?auto_19704 ?auto_19748 ) ) ( not ( = ?auto_19704 ?auto_19745 ) ) ( not ( = ?auto_19715 ?auto_19747 ) ) ( not ( = ?auto_19715 ?auto_19726 ) ) ( not ( = ?auto_19715 ?auto_19722 ) ) ( not ( = ?auto_19715 ?auto_19729 ) ) ( not ( = ?auto_19715 ?auto_19731 ) ) ( not ( = ?auto_19715 ?auto_19733 ) ) ( not ( = ?auto_19715 ?auto_19742 ) ) ( not ( = ?auto_19713 ?auto_19727 ) ) ( not ( = ?auto_19713 ?auto_19735 ) ) ( not ( = ?auto_19713 ?auto_19746 ) ) ( not ( = ?auto_19713 ?auto_19719 ) ) ( not ( = ?auto_19713 ?auto_19723 ) ) ( not ( = ?auto_19713 ?auto_19721 ) ) ( not ( = ?auto_19713 ?auto_19744 ) ) ( not ( = ?auto_19739 ?auto_19741 ) ) ( not ( = ?auto_19739 ?auto_19740 ) ) ( not ( = ?auto_19739 ?auto_19732 ) ) ( not ( = ?auto_19739 ?auto_19728 ) ) ( not ( = ?auto_19739 ?auto_19743 ) ) ( not ( = ?auto_19739 ?auto_19748 ) ) ( not ( = ?auto_19739 ?auto_19745 ) ) ( not ( = ?auto_19698 ?auto_19707 ) ) ( not ( = ?auto_19698 ?auto_19737 ) ) ( not ( = ?auto_19699 ?auto_19707 ) ) ( not ( = ?auto_19699 ?auto_19737 ) ) ( not ( = ?auto_19700 ?auto_19707 ) ) ( not ( = ?auto_19700 ?auto_19737 ) ) ( not ( = ?auto_19701 ?auto_19707 ) ) ( not ( = ?auto_19701 ?auto_19737 ) ) ( not ( = ?auto_19702 ?auto_19707 ) ) ( not ( = ?auto_19702 ?auto_19737 ) ) ( not ( = ?auto_19703 ?auto_19707 ) ) ( not ( = ?auto_19703 ?auto_19737 ) ) ( not ( = ?auto_19706 ?auto_19707 ) ) ( not ( = ?auto_19706 ?auto_19737 ) ) ( not ( = ?auto_19705 ?auto_19707 ) ) ( not ( = ?auto_19705 ?auto_19737 ) ) ( not ( = ?auto_19707 ?auto_19739 ) ) ( not ( = ?auto_19707 ?auto_19741 ) ) ( not ( = ?auto_19707 ?auto_19740 ) ) ( not ( = ?auto_19707 ?auto_19732 ) ) ( not ( = ?auto_19707 ?auto_19728 ) ) ( not ( = ?auto_19707 ?auto_19743 ) ) ( not ( = ?auto_19707 ?auto_19748 ) ) ( not ( = ?auto_19707 ?auto_19745 ) ) ( not ( = ?auto_19737 ?auto_19739 ) ) ( not ( = ?auto_19737 ?auto_19741 ) ) ( not ( = ?auto_19737 ?auto_19740 ) ) ( not ( = ?auto_19737 ?auto_19732 ) ) ( not ( = ?auto_19737 ?auto_19728 ) ) ( not ( = ?auto_19737 ?auto_19743 ) ) ( not ( = ?auto_19737 ?auto_19748 ) ) ( not ( = ?auto_19737 ?auto_19745 ) ) ( not ( = ?auto_19698 ?auto_19709 ) ) ( not ( = ?auto_19698 ?auto_19725 ) ) ( not ( = ?auto_19699 ?auto_19709 ) ) ( not ( = ?auto_19699 ?auto_19725 ) ) ( not ( = ?auto_19700 ?auto_19709 ) ) ( not ( = ?auto_19700 ?auto_19725 ) ) ( not ( = ?auto_19701 ?auto_19709 ) ) ( not ( = ?auto_19701 ?auto_19725 ) ) ( not ( = ?auto_19702 ?auto_19709 ) ) ( not ( = ?auto_19702 ?auto_19725 ) ) ( not ( = ?auto_19703 ?auto_19709 ) ) ( not ( = ?auto_19703 ?auto_19725 ) ) ( not ( = ?auto_19706 ?auto_19709 ) ) ( not ( = ?auto_19706 ?auto_19725 ) ) ( not ( = ?auto_19705 ?auto_19709 ) ) ( not ( = ?auto_19705 ?auto_19725 ) ) ( not ( = ?auto_19704 ?auto_19709 ) ) ( not ( = ?auto_19704 ?auto_19725 ) ) ( not ( = ?auto_19709 ?auto_19737 ) ) ( not ( = ?auto_19709 ?auto_19739 ) ) ( not ( = ?auto_19709 ?auto_19741 ) ) ( not ( = ?auto_19709 ?auto_19740 ) ) ( not ( = ?auto_19709 ?auto_19732 ) ) ( not ( = ?auto_19709 ?auto_19728 ) ) ( not ( = ?auto_19709 ?auto_19743 ) ) ( not ( = ?auto_19709 ?auto_19748 ) ) ( not ( = ?auto_19709 ?auto_19745 ) ) ( not ( = ?auto_19730 ?auto_19715 ) ) ( not ( = ?auto_19730 ?auto_19747 ) ) ( not ( = ?auto_19730 ?auto_19726 ) ) ( not ( = ?auto_19730 ?auto_19722 ) ) ( not ( = ?auto_19730 ?auto_19729 ) ) ( not ( = ?auto_19730 ?auto_19731 ) ) ( not ( = ?auto_19730 ?auto_19733 ) ) ( not ( = ?auto_19730 ?auto_19742 ) ) ( not ( = ?auto_19724 ?auto_19713 ) ) ( not ( = ?auto_19724 ?auto_19727 ) ) ( not ( = ?auto_19724 ?auto_19735 ) ) ( not ( = ?auto_19724 ?auto_19746 ) ) ( not ( = ?auto_19724 ?auto_19719 ) ) ( not ( = ?auto_19724 ?auto_19723 ) ) ( not ( = ?auto_19724 ?auto_19721 ) ) ( not ( = ?auto_19724 ?auto_19744 ) ) ( not ( = ?auto_19725 ?auto_19737 ) ) ( not ( = ?auto_19725 ?auto_19739 ) ) ( not ( = ?auto_19725 ?auto_19741 ) ) ( not ( = ?auto_19725 ?auto_19740 ) ) ( not ( = ?auto_19725 ?auto_19732 ) ) ( not ( = ?auto_19725 ?auto_19728 ) ) ( not ( = ?auto_19725 ?auto_19743 ) ) ( not ( = ?auto_19725 ?auto_19748 ) ) ( not ( = ?auto_19725 ?auto_19745 ) ) ( not ( = ?auto_19698 ?auto_19708 ) ) ( not ( = ?auto_19698 ?auto_19738 ) ) ( not ( = ?auto_19699 ?auto_19708 ) ) ( not ( = ?auto_19699 ?auto_19738 ) ) ( not ( = ?auto_19700 ?auto_19708 ) ) ( not ( = ?auto_19700 ?auto_19738 ) ) ( not ( = ?auto_19701 ?auto_19708 ) ) ( not ( = ?auto_19701 ?auto_19738 ) ) ( not ( = ?auto_19702 ?auto_19708 ) ) ( not ( = ?auto_19702 ?auto_19738 ) ) ( not ( = ?auto_19703 ?auto_19708 ) ) ( not ( = ?auto_19703 ?auto_19738 ) ) ( not ( = ?auto_19706 ?auto_19708 ) ) ( not ( = ?auto_19706 ?auto_19738 ) ) ( not ( = ?auto_19705 ?auto_19708 ) ) ( not ( = ?auto_19705 ?auto_19738 ) ) ( not ( = ?auto_19704 ?auto_19708 ) ) ( not ( = ?auto_19704 ?auto_19738 ) ) ( not ( = ?auto_19707 ?auto_19708 ) ) ( not ( = ?auto_19707 ?auto_19738 ) ) ( not ( = ?auto_19708 ?auto_19725 ) ) ( not ( = ?auto_19708 ?auto_19737 ) ) ( not ( = ?auto_19708 ?auto_19739 ) ) ( not ( = ?auto_19708 ?auto_19741 ) ) ( not ( = ?auto_19708 ?auto_19740 ) ) ( not ( = ?auto_19708 ?auto_19732 ) ) ( not ( = ?auto_19708 ?auto_19728 ) ) ( not ( = ?auto_19708 ?auto_19743 ) ) ( not ( = ?auto_19708 ?auto_19748 ) ) ( not ( = ?auto_19708 ?auto_19745 ) ) ( not ( = ?auto_19720 ?auto_19730 ) ) ( not ( = ?auto_19720 ?auto_19715 ) ) ( not ( = ?auto_19720 ?auto_19747 ) ) ( not ( = ?auto_19720 ?auto_19726 ) ) ( not ( = ?auto_19720 ?auto_19722 ) ) ( not ( = ?auto_19720 ?auto_19729 ) ) ( not ( = ?auto_19720 ?auto_19731 ) ) ( not ( = ?auto_19720 ?auto_19733 ) ) ( not ( = ?auto_19720 ?auto_19742 ) ) ( not ( = ?auto_19734 ?auto_19724 ) ) ( not ( = ?auto_19734 ?auto_19713 ) ) ( not ( = ?auto_19734 ?auto_19727 ) ) ( not ( = ?auto_19734 ?auto_19735 ) ) ( not ( = ?auto_19734 ?auto_19746 ) ) ( not ( = ?auto_19734 ?auto_19719 ) ) ( not ( = ?auto_19734 ?auto_19723 ) ) ( not ( = ?auto_19734 ?auto_19721 ) ) ( not ( = ?auto_19734 ?auto_19744 ) ) ( not ( = ?auto_19738 ?auto_19725 ) ) ( not ( = ?auto_19738 ?auto_19737 ) ) ( not ( = ?auto_19738 ?auto_19739 ) ) ( not ( = ?auto_19738 ?auto_19741 ) ) ( not ( = ?auto_19738 ?auto_19740 ) ) ( not ( = ?auto_19738 ?auto_19732 ) ) ( not ( = ?auto_19738 ?auto_19728 ) ) ( not ( = ?auto_19738 ?auto_19743 ) ) ( not ( = ?auto_19738 ?auto_19748 ) ) ( not ( = ?auto_19738 ?auto_19745 ) ) ( not ( = ?auto_19698 ?auto_19710 ) ) ( not ( = ?auto_19698 ?auto_19749 ) ) ( not ( = ?auto_19699 ?auto_19710 ) ) ( not ( = ?auto_19699 ?auto_19749 ) ) ( not ( = ?auto_19700 ?auto_19710 ) ) ( not ( = ?auto_19700 ?auto_19749 ) ) ( not ( = ?auto_19701 ?auto_19710 ) ) ( not ( = ?auto_19701 ?auto_19749 ) ) ( not ( = ?auto_19702 ?auto_19710 ) ) ( not ( = ?auto_19702 ?auto_19749 ) ) ( not ( = ?auto_19703 ?auto_19710 ) ) ( not ( = ?auto_19703 ?auto_19749 ) ) ( not ( = ?auto_19706 ?auto_19710 ) ) ( not ( = ?auto_19706 ?auto_19749 ) ) ( not ( = ?auto_19705 ?auto_19710 ) ) ( not ( = ?auto_19705 ?auto_19749 ) ) ( not ( = ?auto_19704 ?auto_19710 ) ) ( not ( = ?auto_19704 ?auto_19749 ) ) ( not ( = ?auto_19707 ?auto_19710 ) ) ( not ( = ?auto_19707 ?auto_19749 ) ) ( not ( = ?auto_19709 ?auto_19710 ) ) ( not ( = ?auto_19709 ?auto_19749 ) ) ( not ( = ?auto_19710 ?auto_19738 ) ) ( not ( = ?auto_19710 ?auto_19725 ) ) ( not ( = ?auto_19710 ?auto_19737 ) ) ( not ( = ?auto_19710 ?auto_19739 ) ) ( not ( = ?auto_19710 ?auto_19741 ) ) ( not ( = ?auto_19710 ?auto_19740 ) ) ( not ( = ?auto_19710 ?auto_19732 ) ) ( not ( = ?auto_19710 ?auto_19728 ) ) ( not ( = ?auto_19710 ?auto_19743 ) ) ( not ( = ?auto_19710 ?auto_19748 ) ) ( not ( = ?auto_19710 ?auto_19745 ) ) ( not ( = ?auto_19736 ?auto_19720 ) ) ( not ( = ?auto_19736 ?auto_19730 ) ) ( not ( = ?auto_19736 ?auto_19715 ) ) ( not ( = ?auto_19736 ?auto_19747 ) ) ( not ( = ?auto_19736 ?auto_19726 ) ) ( not ( = ?auto_19736 ?auto_19722 ) ) ( not ( = ?auto_19736 ?auto_19729 ) ) ( not ( = ?auto_19736 ?auto_19731 ) ) ( not ( = ?auto_19736 ?auto_19733 ) ) ( not ( = ?auto_19736 ?auto_19742 ) ) ( not ( = ?auto_19718 ?auto_19734 ) ) ( not ( = ?auto_19718 ?auto_19724 ) ) ( not ( = ?auto_19718 ?auto_19713 ) ) ( not ( = ?auto_19718 ?auto_19727 ) ) ( not ( = ?auto_19718 ?auto_19735 ) ) ( not ( = ?auto_19718 ?auto_19746 ) ) ( not ( = ?auto_19718 ?auto_19719 ) ) ( not ( = ?auto_19718 ?auto_19723 ) ) ( not ( = ?auto_19718 ?auto_19721 ) ) ( not ( = ?auto_19718 ?auto_19744 ) ) ( not ( = ?auto_19749 ?auto_19738 ) ) ( not ( = ?auto_19749 ?auto_19725 ) ) ( not ( = ?auto_19749 ?auto_19737 ) ) ( not ( = ?auto_19749 ?auto_19739 ) ) ( not ( = ?auto_19749 ?auto_19741 ) ) ( not ( = ?auto_19749 ?auto_19740 ) ) ( not ( = ?auto_19749 ?auto_19732 ) ) ( not ( = ?auto_19749 ?auto_19728 ) ) ( not ( = ?auto_19749 ?auto_19743 ) ) ( not ( = ?auto_19749 ?auto_19748 ) ) ( not ( = ?auto_19749 ?auto_19745 ) ) ( not ( = ?auto_19698 ?auto_19711 ) ) ( not ( = ?auto_19698 ?auto_19716 ) ) ( not ( = ?auto_19699 ?auto_19711 ) ) ( not ( = ?auto_19699 ?auto_19716 ) ) ( not ( = ?auto_19700 ?auto_19711 ) ) ( not ( = ?auto_19700 ?auto_19716 ) ) ( not ( = ?auto_19701 ?auto_19711 ) ) ( not ( = ?auto_19701 ?auto_19716 ) ) ( not ( = ?auto_19702 ?auto_19711 ) ) ( not ( = ?auto_19702 ?auto_19716 ) ) ( not ( = ?auto_19703 ?auto_19711 ) ) ( not ( = ?auto_19703 ?auto_19716 ) ) ( not ( = ?auto_19706 ?auto_19711 ) ) ( not ( = ?auto_19706 ?auto_19716 ) ) ( not ( = ?auto_19705 ?auto_19711 ) ) ( not ( = ?auto_19705 ?auto_19716 ) ) ( not ( = ?auto_19704 ?auto_19711 ) ) ( not ( = ?auto_19704 ?auto_19716 ) ) ( not ( = ?auto_19707 ?auto_19711 ) ) ( not ( = ?auto_19707 ?auto_19716 ) ) ( not ( = ?auto_19709 ?auto_19711 ) ) ( not ( = ?auto_19709 ?auto_19716 ) ) ( not ( = ?auto_19708 ?auto_19711 ) ) ( not ( = ?auto_19708 ?auto_19716 ) ) ( not ( = ?auto_19711 ?auto_19749 ) ) ( not ( = ?auto_19711 ?auto_19738 ) ) ( not ( = ?auto_19711 ?auto_19725 ) ) ( not ( = ?auto_19711 ?auto_19737 ) ) ( not ( = ?auto_19711 ?auto_19739 ) ) ( not ( = ?auto_19711 ?auto_19741 ) ) ( not ( = ?auto_19711 ?auto_19740 ) ) ( not ( = ?auto_19711 ?auto_19732 ) ) ( not ( = ?auto_19711 ?auto_19728 ) ) ( not ( = ?auto_19711 ?auto_19743 ) ) ( not ( = ?auto_19711 ?auto_19748 ) ) ( not ( = ?auto_19711 ?auto_19745 ) ) ( not ( = ?auto_19716 ?auto_19749 ) ) ( not ( = ?auto_19716 ?auto_19738 ) ) ( not ( = ?auto_19716 ?auto_19725 ) ) ( not ( = ?auto_19716 ?auto_19737 ) ) ( not ( = ?auto_19716 ?auto_19739 ) ) ( not ( = ?auto_19716 ?auto_19741 ) ) ( not ( = ?auto_19716 ?auto_19740 ) ) ( not ( = ?auto_19716 ?auto_19732 ) ) ( not ( = ?auto_19716 ?auto_19728 ) ) ( not ( = ?auto_19716 ?auto_19743 ) ) ( not ( = ?auto_19716 ?auto_19748 ) ) ( not ( = ?auto_19716 ?auto_19745 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_19698 ?auto_19699 ?auto_19700 ?auto_19701 ?auto_19702 ?auto_19703 ?auto_19706 ?auto_19705 ?auto_19704 ?auto_19707 ?auto_19709 ?auto_19708 ?auto_19710 )
      ( MAKE-1CRATE ?auto_19710 ?auto_19711 )
      ( MAKE-13CRATE-VERIFY ?auto_19698 ?auto_19699 ?auto_19700 ?auto_19701 ?auto_19702 ?auto_19703 ?auto_19706 ?auto_19705 ?auto_19704 ?auto_19707 ?auto_19709 ?auto_19708 ?auto_19710 ?auto_19711 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19752 - SURFACE
      ?auto_19753 - SURFACE
    )
    :vars
    (
      ?auto_19754 - HOIST
      ?auto_19755 - PLACE
      ?auto_19757 - PLACE
      ?auto_19758 - HOIST
      ?auto_19759 - SURFACE
      ?auto_19756 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19754 ?auto_19755 ) ( SURFACE-AT ?auto_19752 ?auto_19755 ) ( CLEAR ?auto_19752 ) ( IS-CRATE ?auto_19753 ) ( AVAILABLE ?auto_19754 ) ( not ( = ?auto_19757 ?auto_19755 ) ) ( HOIST-AT ?auto_19758 ?auto_19757 ) ( AVAILABLE ?auto_19758 ) ( SURFACE-AT ?auto_19753 ?auto_19757 ) ( ON ?auto_19753 ?auto_19759 ) ( CLEAR ?auto_19753 ) ( TRUCK-AT ?auto_19756 ?auto_19755 ) ( not ( = ?auto_19752 ?auto_19753 ) ) ( not ( = ?auto_19752 ?auto_19759 ) ) ( not ( = ?auto_19753 ?auto_19759 ) ) ( not ( = ?auto_19754 ?auto_19758 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19756 ?auto_19755 ?auto_19757 )
      ( !LIFT ?auto_19758 ?auto_19753 ?auto_19759 ?auto_19757 )
      ( !LOAD ?auto_19758 ?auto_19753 ?auto_19756 ?auto_19757 )
      ( !DRIVE ?auto_19756 ?auto_19757 ?auto_19755 )
      ( !UNLOAD ?auto_19754 ?auto_19753 ?auto_19756 ?auto_19755 )
      ( !DROP ?auto_19754 ?auto_19753 ?auto_19752 ?auto_19755 )
      ( MAKE-1CRATE-VERIFY ?auto_19752 ?auto_19753 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_19775 - SURFACE
      ?auto_19776 - SURFACE
      ?auto_19777 - SURFACE
      ?auto_19778 - SURFACE
      ?auto_19779 - SURFACE
      ?auto_19780 - SURFACE
      ?auto_19783 - SURFACE
      ?auto_19782 - SURFACE
      ?auto_19781 - SURFACE
      ?auto_19784 - SURFACE
      ?auto_19786 - SURFACE
      ?auto_19785 - SURFACE
      ?auto_19787 - SURFACE
      ?auto_19789 - SURFACE
      ?auto_19788 - SURFACE
    )
    :vars
    (
      ?auto_19793 - HOIST
      ?auto_19795 - PLACE
      ?auto_19791 - PLACE
      ?auto_19790 - HOIST
      ?auto_19794 - SURFACE
      ?auto_19823 - PLACE
      ?auto_19797 - HOIST
      ?auto_19810 - SURFACE
      ?auto_19825 - PLACE
      ?auto_19815 - HOIST
      ?auto_19809 - SURFACE
      ?auto_19821 - PLACE
      ?auto_19802 - HOIST
      ?auto_19796 - SURFACE
      ?auto_19799 - PLACE
      ?auto_19800 - HOIST
      ?auto_19818 - SURFACE
      ?auto_19828 - SURFACE
      ?auto_19801 - SURFACE
      ?auto_19814 - PLACE
      ?auto_19811 - HOIST
      ?auto_19827 - SURFACE
      ?auto_19817 - PLACE
      ?auto_19826 - HOIST
      ?auto_19819 - SURFACE
      ?auto_19808 - PLACE
      ?auto_19805 - HOIST
      ?auto_19816 - SURFACE
      ?auto_19803 - PLACE
      ?auto_19807 - HOIST
      ?auto_19798 - SURFACE
      ?auto_19822 - PLACE
      ?auto_19813 - HOIST
      ?auto_19812 - SURFACE
      ?auto_19806 - SURFACE
      ?auto_19820 - PLACE
      ?auto_19804 - HOIST
      ?auto_19824 - SURFACE
      ?auto_19792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19793 ?auto_19795 ) ( IS-CRATE ?auto_19788 ) ( not ( = ?auto_19791 ?auto_19795 ) ) ( HOIST-AT ?auto_19790 ?auto_19791 ) ( SURFACE-AT ?auto_19788 ?auto_19791 ) ( ON ?auto_19788 ?auto_19794 ) ( CLEAR ?auto_19788 ) ( not ( = ?auto_19789 ?auto_19788 ) ) ( not ( = ?auto_19789 ?auto_19794 ) ) ( not ( = ?auto_19788 ?auto_19794 ) ) ( not ( = ?auto_19793 ?auto_19790 ) ) ( IS-CRATE ?auto_19789 ) ( not ( = ?auto_19823 ?auto_19795 ) ) ( HOIST-AT ?auto_19797 ?auto_19823 ) ( SURFACE-AT ?auto_19789 ?auto_19823 ) ( ON ?auto_19789 ?auto_19810 ) ( CLEAR ?auto_19789 ) ( not ( = ?auto_19787 ?auto_19789 ) ) ( not ( = ?auto_19787 ?auto_19810 ) ) ( not ( = ?auto_19789 ?auto_19810 ) ) ( not ( = ?auto_19793 ?auto_19797 ) ) ( IS-CRATE ?auto_19787 ) ( not ( = ?auto_19825 ?auto_19795 ) ) ( HOIST-AT ?auto_19815 ?auto_19825 ) ( AVAILABLE ?auto_19815 ) ( SURFACE-AT ?auto_19787 ?auto_19825 ) ( ON ?auto_19787 ?auto_19809 ) ( CLEAR ?auto_19787 ) ( not ( = ?auto_19785 ?auto_19787 ) ) ( not ( = ?auto_19785 ?auto_19809 ) ) ( not ( = ?auto_19787 ?auto_19809 ) ) ( not ( = ?auto_19793 ?auto_19815 ) ) ( IS-CRATE ?auto_19785 ) ( not ( = ?auto_19821 ?auto_19795 ) ) ( HOIST-AT ?auto_19802 ?auto_19821 ) ( AVAILABLE ?auto_19802 ) ( SURFACE-AT ?auto_19785 ?auto_19821 ) ( ON ?auto_19785 ?auto_19796 ) ( CLEAR ?auto_19785 ) ( not ( = ?auto_19786 ?auto_19785 ) ) ( not ( = ?auto_19786 ?auto_19796 ) ) ( not ( = ?auto_19785 ?auto_19796 ) ) ( not ( = ?auto_19793 ?auto_19802 ) ) ( IS-CRATE ?auto_19786 ) ( not ( = ?auto_19799 ?auto_19795 ) ) ( HOIST-AT ?auto_19800 ?auto_19799 ) ( AVAILABLE ?auto_19800 ) ( SURFACE-AT ?auto_19786 ?auto_19799 ) ( ON ?auto_19786 ?auto_19818 ) ( CLEAR ?auto_19786 ) ( not ( = ?auto_19784 ?auto_19786 ) ) ( not ( = ?auto_19784 ?auto_19818 ) ) ( not ( = ?auto_19786 ?auto_19818 ) ) ( not ( = ?auto_19793 ?auto_19800 ) ) ( IS-CRATE ?auto_19784 ) ( SURFACE-AT ?auto_19784 ?auto_19823 ) ( ON ?auto_19784 ?auto_19828 ) ( CLEAR ?auto_19784 ) ( not ( = ?auto_19781 ?auto_19784 ) ) ( not ( = ?auto_19781 ?auto_19828 ) ) ( not ( = ?auto_19784 ?auto_19828 ) ) ( IS-CRATE ?auto_19781 ) ( AVAILABLE ?auto_19797 ) ( SURFACE-AT ?auto_19781 ?auto_19823 ) ( ON ?auto_19781 ?auto_19801 ) ( CLEAR ?auto_19781 ) ( not ( = ?auto_19782 ?auto_19781 ) ) ( not ( = ?auto_19782 ?auto_19801 ) ) ( not ( = ?auto_19781 ?auto_19801 ) ) ( IS-CRATE ?auto_19782 ) ( not ( = ?auto_19814 ?auto_19795 ) ) ( HOIST-AT ?auto_19811 ?auto_19814 ) ( AVAILABLE ?auto_19811 ) ( SURFACE-AT ?auto_19782 ?auto_19814 ) ( ON ?auto_19782 ?auto_19827 ) ( CLEAR ?auto_19782 ) ( not ( = ?auto_19783 ?auto_19782 ) ) ( not ( = ?auto_19783 ?auto_19827 ) ) ( not ( = ?auto_19782 ?auto_19827 ) ) ( not ( = ?auto_19793 ?auto_19811 ) ) ( IS-CRATE ?auto_19783 ) ( not ( = ?auto_19817 ?auto_19795 ) ) ( HOIST-AT ?auto_19826 ?auto_19817 ) ( AVAILABLE ?auto_19826 ) ( SURFACE-AT ?auto_19783 ?auto_19817 ) ( ON ?auto_19783 ?auto_19819 ) ( CLEAR ?auto_19783 ) ( not ( = ?auto_19780 ?auto_19783 ) ) ( not ( = ?auto_19780 ?auto_19819 ) ) ( not ( = ?auto_19783 ?auto_19819 ) ) ( not ( = ?auto_19793 ?auto_19826 ) ) ( IS-CRATE ?auto_19780 ) ( not ( = ?auto_19808 ?auto_19795 ) ) ( HOIST-AT ?auto_19805 ?auto_19808 ) ( AVAILABLE ?auto_19805 ) ( SURFACE-AT ?auto_19780 ?auto_19808 ) ( ON ?auto_19780 ?auto_19816 ) ( CLEAR ?auto_19780 ) ( not ( = ?auto_19779 ?auto_19780 ) ) ( not ( = ?auto_19779 ?auto_19816 ) ) ( not ( = ?auto_19780 ?auto_19816 ) ) ( not ( = ?auto_19793 ?auto_19805 ) ) ( IS-CRATE ?auto_19779 ) ( not ( = ?auto_19803 ?auto_19795 ) ) ( HOIST-AT ?auto_19807 ?auto_19803 ) ( AVAILABLE ?auto_19807 ) ( SURFACE-AT ?auto_19779 ?auto_19803 ) ( ON ?auto_19779 ?auto_19798 ) ( CLEAR ?auto_19779 ) ( not ( = ?auto_19778 ?auto_19779 ) ) ( not ( = ?auto_19778 ?auto_19798 ) ) ( not ( = ?auto_19779 ?auto_19798 ) ) ( not ( = ?auto_19793 ?auto_19807 ) ) ( IS-CRATE ?auto_19778 ) ( not ( = ?auto_19822 ?auto_19795 ) ) ( HOIST-AT ?auto_19813 ?auto_19822 ) ( AVAILABLE ?auto_19813 ) ( SURFACE-AT ?auto_19778 ?auto_19822 ) ( ON ?auto_19778 ?auto_19812 ) ( CLEAR ?auto_19778 ) ( not ( = ?auto_19777 ?auto_19778 ) ) ( not ( = ?auto_19777 ?auto_19812 ) ) ( not ( = ?auto_19778 ?auto_19812 ) ) ( not ( = ?auto_19793 ?auto_19813 ) ) ( IS-CRATE ?auto_19777 ) ( AVAILABLE ?auto_19790 ) ( SURFACE-AT ?auto_19777 ?auto_19791 ) ( ON ?auto_19777 ?auto_19806 ) ( CLEAR ?auto_19777 ) ( not ( = ?auto_19776 ?auto_19777 ) ) ( not ( = ?auto_19776 ?auto_19806 ) ) ( not ( = ?auto_19777 ?auto_19806 ) ) ( SURFACE-AT ?auto_19775 ?auto_19795 ) ( CLEAR ?auto_19775 ) ( IS-CRATE ?auto_19776 ) ( AVAILABLE ?auto_19793 ) ( not ( = ?auto_19820 ?auto_19795 ) ) ( HOIST-AT ?auto_19804 ?auto_19820 ) ( AVAILABLE ?auto_19804 ) ( SURFACE-AT ?auto_19776 ?auto_19820 ) ( ON ?auto_19776 ?auto_19824 ) ( CLEAR ?auto_19776 ) ( TRUCK-AT ?auto_19792 ?auto_19795 ) ( not ( = ?auto_19775 ?auto_19776 ) ) ( not ( = ?auto_19775 ?auto_19824 ) ) ( not ( = ?auto_19776 ?auto_19824 ) ) ( not ( = ?auto_19793 ?auto_19804 ) ) ( not ( = ?auto_19775 ?auto_19777 ) ) ( not ( = ?auto_19775 ?auto_19806 ) ) ( not ( = ?auto_19777 ?auto_19824 ) ) ( not ( = ?auto_19791 ?auto_19820 ) ) ( not ( = ?auto_19790 ?auto_19804 ) ) ( not ( = ?auto_19806 ?auto_19824 ) ) ( not ( = ?auto_19775 ?auto_19778 ) ) ( not ( = ?auto_19775 ?auto_19812 ) ) ( not ( = ?auto_19776 ?auto_19778 ) ) ( not ( = ?auto_19776 ?auto_19812 ) ) ( not ( = ?auto_19778 ?auto_19806 ) ) ( not ( = ?auto_19778 ?auto_19824 ) ) ( not ( = ?auto_19822 ?auto_19791 ) ) ( not ( = ?auto_19822 ?auto_19820 ) ) ( not ( = ?auto_19813 ?auto_19790 ) ) ( not ( = ?auto_19813 ?auto_19804 ) ) ( not ( = ?auto_19812 ?auto_19806 ) ) ( not ( = ?auto_19812 ?auto_19824 ) ) ( not ( = ?auto_19775 ?auto_19779 ) ) ( not ( = ?auto_19775 ?auto_19798 ) ) ( not ( = ?auto_19776 ?auto_19779 ) ) ( not ( = ?auto_19776 ?auto_19798 ) ) ( not ( = ?auto_19777 ?auto_19779 ) ) ( not ( = ?auto_19777 ?auto_19798 ) ) ( not ( = ?auto_19779 ?auto_19812 ) ) ( not ( = ?auto_19779 ?auto_19806 ) ) ( not ( = ?auto_19779 ?auto_19824 ) ) ( not ( = ?auto_19803 ?auto_19822 ) ) ( not ( = ?auto_19803 ?auto_19791 ) ) ( not ( = ?auto_19803 ?auto_19820 ) ) ( not ( = ?auto_19807 ?auto_19813 ) ) ( not ( = ?auto_19807 ?auto_19790 ) ) ( not ( = ?auto_19807 ?auto_19804 ) ) ( not ( = ?auto_19798 ?auto_19812 ) ) ( not ( = ?auto_19798 ?auto_19806 ) ) ( not ( = ?auto_19798 ?auto_19824 ) ) ( not ( = ?auto_19775 ?auto_19780 ) ) ( not ( = ?auto_19775 ?auto_19816 ) ) ( not ( = ?auto_19776 ?auto_19780 ) ) ( not ( = ?auto_19776 ?auto_19816 ) ) ( not ( = ?auto_19777 ?auto_19780 ) ) ( not ( = ?auto_19777 ?auto_19816 ) ) ( not ( = ?auto_19778 ?auto_19780 ) ) ( not ( = ?auto_19778 ?auto_19816 ) ) ( not ( = ?auto_19780 ?auto_19798 ) ) ( not ( = ?auto_19780 ?auto_19812 ) ) ( not ( = ?auto_19780 ?auto_19806 ) ) ( not ( = ?auto_19780 ?auto_19824 ) ) ( not ( = ?auto_19808 ?auto_19803 ) ) ( not ( = ?auto_19808 ?auto_19822 ) ) ( not ( = ?auto_19808 ?auto_19791 ) ) ( not ( = ?auto_19808 ?auto_19820 ) ) ( not ( = ?auto_19805 ?auto_19807 ) ) ( not ( = ?auto_19805 ?auto_19813 ) ) ( not ( = ?auto_19805 ?auto_19790 ) ) ( not ( = ?auto_19805 ?auto_19804 ) ) ( not ( = ?auto_19816 ?auto_19798 ) ) ( not ( = ?auto_19816 ?auto_19812 ) ) ( not ( = ?auto_19816 ?auto_19806 ) ) ( not ( = ?auto_19816 ?auto_19824 ) ) ( not ( = ?auto_19775 ?auto_19783 ) ) ( not ( = ?auto_19775 ?auto_19819 ) ) ( not ( = ?auto_19776 ?auto_19783 ) ) ( not ( = ?auto_19776 ?auto_19819 ) ) ( not ( = ?auto_19777 ?auto_19783 ) ) ( not ( = ?auto_19777 ?auto_19819 ) ) ( not ( = ?auto_19778 ?auto_19783 ) ) ( not ( = ?auto_19778 ?auto_19819 ) ) ( not ( = ?auto_19779 ?auto_19783 ) ) ( not ( = ?auto_19779 ?auto_19819 ) ) ( not ( = ?auto_19783 ?auto_19816 ) ) ( not ( = ?auto_19783 ?auto_19798 ) ) ( not ( = ?auto_19783 ?auto_19812 ) ) ( not ( = ?auto_19783 ?auto_19806 ) ) ( not ( = ?auto_19783 ?auto_19824 ) ) ( not ( = ?auto_19817 ?auto_19808 ) ) ( not ( = ?auto_19817 ?auto_19803 ) ) ( not ( = ?auto_19817 ?auto_19822 ) ) ( not ( = ?auto_19817 ?auto_19791 ) ) ( not ( = ?auto_19817 ?auto_19820 ) ) ( not ( = ?auto_19826 ?auto_19805 ) ) ( not ( = ?auto_19826 ?auto_19807 ) ) ( not ( = ?auto_19826 ?auto_19813 ) ) ( not ( = ?auto_19826 ?auto_19790 ) ) ( not ( = ?auto_19826 ?auto_19804 ) ) ( not ( = ?auto_19819 ?auto_19816 ) ) ( not ( = ?auto_19819 ?auto_19798 ) ) ( not ( = ?auto_19819 ?auto_19812 ) ) ( not ( = ?auto_19819 ?auto_19806 ) ) ( not ( = ?auto_19819 ?auto_19824 ) ) ( not ( = ?auto_19775 ?auto_19782 ) ) ( not ( = ?auto_19775 ?auto_19827 ) ) ( not ( = ?auto_19776 ?auto_19782 ) ) ( not ( = ?auto_19776 ?auto_19827 ) ) ( not ( = ?auto_19777 ?auto_19782 ) ) ( not ( = ?auto_19777 ?auto_19827 ) ) ( not ( = ?auto_19778 ?auto_19782 ) ) ( not ( = ?auto_19778 ?auto_19827 ) ) ( not ( = ?auto_19779 ?auto_19782 ) ) ( not ( = ?auto_19779 ?auto_19827 ) ) ( not ( = ?auto_19780 ?auto_19782 ) ) ( not ( = ?auto_19780 ?auto_19827 ) ) ( not ( = ?auto_19782 ?auto_19819 ) ) ( not ( = ?auto_19782 ?auto_19816 ) ) ( not ( = ?auto_19782 ?auto_19798 ) ) ( not ( = ?auto_19782 ?auto_19812 ) ) ( not ( = ?auto_19782 ?auto_19806 ) ) ( not ( = ?auto_19782 ?auto_19824 ) ) ( not ( = ?auto_19814 ?auto_19817 ) ) ( not ( = ?auto_19814 ?auto_19808 ) ) ( not ( = ?auto_19814 ?auto_19803 ) ) ( not ( = ?auto_19814 ?auto_19822 ) ) ( not ( = ?auto_19814 ?auto_19791 ) ) ( not ( = ?auto_19814 ?auto_19820 ) ) ( not ( = ?auto_19811 ?auto_19826 ) ) ( not ( = ?auto_19811 ?auto_19805 ) ) ( not ( = ?auto_19811 ?auto_19807 ) ) ( not ( = ?auto_19811 ?auto_19813 ) ) ( not ( = ?auto_19811 ?auto_19790 ) ) ( not ( = ?auto_19811 ?auto_19804 ) ) ( not ( = ?auto_19827 ?auto_19819 ) ) ( not ( = ?auto_19827 ?auto_19816 ) ) ( not ( = ?auto_19827 ?auto_19798 ) ) ( not ( = ?auto_19827 ?auto_19812 ) ) ( not ( = ?auto_19827 ?auto_19806 ) ) ( not ( = ?auto_19827 ?auto_19824 ) ) ( not ( = ?auto_19775 ?auto_19781 ) ) ( not ( = ?auto_19775 ?auto_19801 ) ) ( not ( = ?auto_19776 ?auto_19781 ) ) ( not ( = ?auto_19776 ?auto_19801 ) ) ( not ( = ?auto_19777 ?auto_19781 ) ) ( not ( = ?auto_19777 ?auto_19801 ) ) ( not ( = ?auto_19778 ?auto_19781 ) ) ( not ( = ?auto_19778 ?auto_19801 ) ) ( not ( = ?auto_19779 ?auto_19781 ) ) ( not ( = ?auto_19779 ?auto_19801 ) ) ( not ( = ?auto_19780 ?auto_19781 ) ) ( not ( = ?auto_19780 ?auto_19801 ) ) ( not ( = ?auto_19783 ?auto_19781 ) ) ( not ( = ?auto_19783 ?auto_19801 ) ) ( not ( = ?auto_19781 ?auto_19827 ) ) ( not ( = ?auto_19781 ?auto_19819 ) ) ( not ( = ?auto_19781 ?auto_19816 ) ) ( not ( = ?auto_19781 ?auto_19798 ) ) ( not ( = ?auto_19781 ?auto_19812 ) ) ( not ( = ?auto_19781 ?auto_19806 ) ) ( not ( = ?auto_19781 ?auto_19824 ) ) ( not ( = ?auto_19823 ?auto_19814 ) ) ( not ( = ?auto_19823 ?auto_19817 ) ) ( not ( = ?auto_19823 ?auto_19808 ) ) ( not ( = ?auto_19823 ?auto_19803 ) ) ( not ( = ?auto_19823 ?auto_19822 ) ) ( not ( = ?auto_19823 ?auto_19791 ) ) ( not ( = ?auto_19823 ?auto_19820 ) ) ( not ( = ?auto_19797 ?auto_19811 ) ) ( not ( = ?auto_19797 ?auto_19826 ) ) ( not ( = ?auto_19797 ?auto_19805 ) ) ( not ( = ?auto_19797 ?auto_19807 ) ) ( not ( = ?auto_19797 ?auto_19813 ) ) ( not ( = ?auto_19797 ?auto_19790 ) ) ( not ( = ?auto_19797 ?auto_19804 ) ) ( not ( = ?auto_19801 ?auto_19827 ) ) ( not ( = ?auto_19801 ?auto_19819 ) ) ( not ( = ?auto_19801 ?auto_19816 ) ) ( not ( = ?auto_19801 ?auto_19798 ) ) ( not ( = ?auto_19801 ?auto_19812 ) ) ( not ( = ?auto_19801 ?auto_19806 ) ) ( not ( = ?auto_19801 ?auto_19824 ) ) ( not ( = ?auto_19775 ?auto_19784 ) ) ( not ( = ?auto_19775 ?auto_19828 ) ) ( not ( = ?auto_19776 ?auto_19784 ) ) ( not ( = ?auto_19776 ?auto_19828 ) ) ( not ( = ?auto_19777 ?auto_19784 ) ) ( not ( = ?auto_19777 ?auto_19828 ) ) ( not ( = ?auto_19778 ?auto_19784 ) ) ( not ( = ?auto_19778 ?auto_19828 ) ) ( not ( = ?auto_19779 ?auto_19784 ) ) ( not ( = ?auto_19779 ?auto_19828 ) ) ( not ( = ?auto_19780 ?auto_19784 ) ) ( not ( = ?auto_19780 ?auto_19828 ) ) ( not ( = ?auto_19783 ?auto_19784 ) ) ( not ( = ?auto_19783 ?auto_19828 ) ) ( not ( = ?auto_19782 ?auto_19784 ) ) ( not ( = ?auto_19782 ?auto_19828 ) ) ( not ( = ?auto_19784 ?auto_19801 ) ) ( not ( = ?auto_19784 ?auto_19827 ) ) ( not ( = ?auto_19784 ?auto_19819 ) ) ( not ( = ?auto_19784 ?auto_19816 ) ) ( not ( = ?auto_19784 ?auto_19798 ) ) ( not ( = ?auto_19784 ?auto_19812 ) ) ( not ( = ?auto_19784 ?auto_19806 ) ) ( not ( = ?auto_19784 ?auto_19824 ) ) ( not ( = ?auto_19828 ?auto_19801 ) ) ( not ( = ?auto_19828 ?auto_19827 ) ) ( not ( = ?auto_19828 ?auto_19819 ) ) ( not ( = ?auto_19828 ?auto_19816 ) ) ( not ( = ?auto_19828 ?auto_19798 ) ) ( not ( = ?auto_19828 ?auto_19812 ) ) ( not ( = ?auto_19828 ?auto_19806 ) ) ( not ( = ?auto_19828 ?auto_19824 ) ) ( not ( = ?auto_19775 ?auto_19786 ) ) ( not ( = ?auto_19775 ?auto_19818 ) ) ( not ( = ?auto_19776 ?auto_19786 ) ) ( not ( = ?auto_19776 ?auto_19818 ) ) ( not ( = ?auto_19777 ?auto_19786 ) ) ( not ( = ?auto_19777 ?auto_19818 ) ) ( not ( = ?auto_19778 ?auto_19786 ) ) ( not ( = ?auto_19778 ?auto_19818 ) ) ( not ( = ?auto_19779 ?auto_19786 ) ) ( not ( = ?auto_19779 ?auto_19818 ) ) ( not ( = ?auto_19780 ?auto_19786 ) ) ( not ( = ?auto_19780 ?auto_19818 ) ) ( not ( = ?auto_19783 ?auto_19786 ) ) ( not ( = ?auto_19783 ?auto_19818 ) ) ( not ( = ?auto_19782 ?auto_19786 ) ) ( not ( = ?auto_19782 ?auto_19818 ) ) ( not ( = ?auto_19781 ?auto_19786 ) ) ( not ( = ?auto_19781 ?auto_19818 ) ) ( not ( = ?auto_19786 ?auto_19828 ) ) ( not ( = ?auto_19786 ?auto_19801 ) ) ( not ( = ?auto_19786 ?auto_19827 ) ) ( not ( = ?auto_19786 ?auto_19819 ) ) ( not ( = ?auto_19786 ?auto_19816 ) ) ( not ( = ?auto_19786 ?auto_19798 ) ) ( not ( = ?auto_19786 ?auto_19812 ) ) ( not ( = ?auto_19786 ?auto_19806 ) ) ( not ( = ?auto_19786 ?auto_19824 ) ) ( not ( = ?auto_19799 ?auto_19823 ) ) ( not ( = ?auto_19799 ?auto_19814 ) ) ( not ( = ?auto_19799 ?auto_19817 ) ) ( not ( = ?auto_19799 ?auto_19808 ) ) ( not ( = ?auto_19799 ?auto_19803 ) ) ( not ( = ?auto_19799 ?auto_19822 ) ) ( not ( = ?auto_19799 ?auto_19791 ) ) ( not ( = ?auto_19799 ?auto_19820 ) ) ( not ( = ?auto_19800 ?auto_19797 ) ) ( not ( = ?auto_19800 ?auto_19811 ) ) ( not ( = ?auto_19800 ?auto_19826 ) ) ( not ( = ?auto_19800 ?auto_19805 ) ) ( not ( = ?auto_19800 ?auto_19807 ) ) ( not ( = ?auto_19800 ?auto_19813 ) ) ( not ( = ?auto_19800 ?auto_19790 ) ) ( not ( = ?auto_19800 ?auto_19804 ) ) ( not ( = ?auto_19818 ?auto_19828 ) ) ( not ( = ?auto_19818 ?auto_19801 ) ) ( not ( = ?auto_19818 ?auto_19827 ) ) ( not ( = ?auto_19818 ?auto_19819 ) ) ( not ( = ?auto_19818 ?auto_19816 ) ) ( not ( = ?auto_19818 ?auto_19798 ) ) ( not ( = ?auto_19818 ?auto_19812 ) ) ( not ( = ?auto_19818 ?auto_19806 ) ) ( not ( = ?auto_19818 ?auto_19824 ) ) ( not ( = ?auto_19775 ?auto_19785 ) ) ( not ( = ?auto_19775 ?auto_19796 ) ) ( not ( = ?auto_19776 ?auto_19785 ) ) ( not ( = ?auto_19776 ?auto_19796 ) ) ( not ( = ?auto_19777 ?auto_19785 ) ) ( not ( = ?auto_19777 ?auto_19796 ) ) ( not ( = ?auto_19778 ?auto_19785 ) ) ( not ( = ?auto_19778 ?auto_19796 ) ) ( not ( = ?auto_19779 ?auto_19785 ) ) ( not ( = ?auto_19779 ?auto_19796 ) ) ( not ( = ?auto_19780 ?auto_19785 ) ) ( not ( = ?auto_19780 ?auto_19796 ) ) ( not ( = ?auto_19783 ?auto_19785 ) ) ( not ( = ?auto_19783 ?auto_19796 ) ) ( not ( = ?auto_19782 ?auto_19785 ) ) ( not ( = ?auto_19782 ?auto_19796 ) ) ( not ( = ?auto_19781 ?auto_19785 ) ) ( not ( = ?auto_19781 ?auto_19796 ) ) ( not ( = ?auto_19784 ?auto_19785 ) ) ( not ( = ?auto_19784 ?auto_19796 ) ) ( not ( = ?auto_19785 ?auto_19818 ) ) ( not ( = ?auto_19785 ?auto_19828 ) ) ( not ( = ?auto_19785 ?auto_19801 ) ) ( not ( = ?auto_19785 ?auto_19827 ) ) ( not ( = ?auto_19785 ?auto_19819 ) ) ( not ( = ?auto_19785 ?auto_19816 ) ) ( not ( = ?auto_19785 ?auto_19798 ) ) ( not ( = ?auto_19785 ?auto_19812 ) ) ( not ( = ?auto_19785 ?auto_19806 ) ) ( not ( = ?auto_19785 ?auto_19824 ) ) ( not ( = ?auto_19821 ?auto_19799 ) ) ( not ( = ?auto_19821 ?auto_19823 ) ) ( not ( = ?auto_19821 ?auto_19814 ) ) ( not ( = ?auto_19821 ?auto_19817 ) ) ( not ( = ?auto_19821 ?auto_19808 ) ) ( not ( = ?auto_19821 ?auto_19803 ) ) ( not ( = ?auto_19821 ?auto_19822 ) ) ( not ( = ?auto_19821 ?auto_19791 ) ) ( not ( = ?auto_19821 ?auto_19820 ) ) ( not ( = ?auto_19802 ?auto_19800 ) ) ( not ( = ?auto_19802 ?auto_19797 ) ) ( not ( = ?auto_19802 ?auto_19811 ) ) ( not ( = ?auto_19802 ?auto_19826 ) ) ( not ( = ?auto_19802 ?auto_19805 ) ) ( not ( = ?auto_19802 ?auto_19807 ) ) ( not ( = ?auto_19802 ?auto_19813 ) ) ( not ( = ?auto_19802 ?auto_19790 ) ) ( not ( = ?auto_19802 ?auto_19804 ) ) ( not ( = ?auto_19796 ?auto_19818 ) ) ( not ( = ?auto_19796 ?auto_19828 ) ) ( not ( = ?auto_19796 ?auto_19801 ) ) ( not ( = ?auto_19796 ?auto_19827 ) ) ( not ( = ?auto_19796 ?auto_19819 ) ) ( not ( = ?auto_19796 ?auto_19816 ) ) ( not ( = ?auto_19796 ?auto_19798 ) ) ( not ( = ?auto_19796 ?auto_19812 ) ) ( not ( = ?auto_19796 ?auto_19806 ) ) ( not ( = ?auto_19796 ?auto_19824 ) ) ( not ( = ?auto_19775 ?auto_19787 ) ) ( not ( = ?auto_19775 ?auto_19809 ) ) ( not ( = ?auto_19776 ?auto_19787 ) ) ( not ( = ?auto_19776 ?auto_19809 ) ) ( not ( = ?auto_19777 ?auto_19787 ) ) ( not ( = ?auto_19777 ?auto_19809 ) ) ( not ( = ?auto_19778 ?auto_19787 ) ) ( not ( = ?auto_19778 ?auto_19809 ) ) ( not ( = ?auto_19779 ?auto_19787 ) ) ( not ( = ?auto_19779 ?auto_19809 ) ) ( not ( = ?auto_19780 ?auto_19787 ) ) ( not ( = ?auto_19780 ?auto_19809 ) ) ( not ( = ?auto_19783 ?auto_19787 ) ) ( not ( = ?auto_19783 ?auto_19809 ) ) ( not ( = ?auto_19782 ?auto_19787 ) ) ( not ( = ?auto_19782 ?auto_19809 ) ) ( not ( = ?auto_19781 ?auto_19787 ) ) ( not ( = ?auto_19781 ?auto_19809 ) ) ( not ( = ?auto_19784 ?auto_19787 ) ) ( not ( = ?auto_19784 ?auto_19809 ) ) ( not ( = ?auto_19786 ?auto_19787 ) ) ( not ( = ?auto_19786 ?auto_19809 ) ) ( not ( = ?auto_19787 ?auto_19796 ) ) ( not ( = ?auto_19787 ?auto_19818 ) ) ( not ( = ?auto_19787 ?auto_19828 ) ) ( not ( = ?auto_19787 ?auto_19801 ) ) ( not ( = ?auto_19787 ?auto_19827 ) ) ( not ( = ?auto_19787 ?auto_19819 ) ) ( not ( = ?auto_19787 ?auto_19816 ) ) ( not ( = ?auto_19787 ?auto_19798 ) ) ( not ( = ?auto_19787 ?auto_19812 ) ) ( not ( = ?auto_19787 ?auto_19806 ) ) ( not ( = ?auto_19787 ?auto_19824 ) ) ( not ( = ?auto_19825 ?auto_19821 ) ) ( not ( = ?auto_19825 ?auto_19799 ) ) ( not ( = ?auto_19825 ?auto_19823 ) ) ( not ( = ?auto_19825 ?auto_19814 ) ) ( not ( = ?auto_19825 ?auto_19817 ) ) ( not ( = ?auto_19825 ?auto_19808 ) ) ( not ( = ?auto_19825 ?auto_19803 ) ) ( not ( = ?auto_19825 ?auto_19822 ) ) ( not ( = ?auto_19825 ?auto_19791 ) ) ( not ( = ?auto_19825 ?auto_19820 ) ) ( not ( = ?auto_19815 ?auto_19802 ) ) ( not ( = ?auto_19815 ?auto_19800 ) ) ( not ( = ?auto_19815 ?auto_19797 ) ) ( not ( = ?auto_19815 ?auto_19811 ) ) ( not ( = ?auto_19815 ?auto_19826 ) ) ( not ( = ?auto_19815 ?auto_19805 ) ) ( not ( = ?auto_19815 ?auto_19807 ) ) ( not ( = ?auto_19815 ?auto_19813 ) ) ( not ( = ?auto_19815 ?auto_19790 ) ) ( not ( = ?auto_19815 ?auto_19804 ) ) ( not ( = ?auto_19809 ?auto_19796 ) ) ( not ( = ?auto_19809 ?auto_19818 ) ) ( not ( = ?auto_19809 ?auto_19828 ) ) ( not ( = ?auto_19809 ?auto_19801 ) ) ( not ( = ?auto_19809 ?auto_19827 ) ) ( not ( = ?auto_19809 ?auto_19819 ) ) ( not ( = ?auto_19809 ?auto_19816 ) ) ( not ( = ?auto_19809 ?auto_19798 ) ) ( not ( = ?auto_19809 ?auto_19812 ) ) ( not ( = ?auto_19809 ?auto_19806 ) ) ( not ( = ?auto_19809 ?auto_19824 ) ) ( not ( = ?auto_19775 ?auto_19789 ) ) ( not ( = ?auto_19775 ?auto_19810 ) ) ( not ( = ?auto_19776 ?auto_19789 ) ) ( not ( = ?auto_19776 ?auto_19810 ) ) ( not ( = ?auto_19777 ?auto_19789 ) ) ( not ( = ?auto_19777 ?auto_19810 ) ) ( not ( = ?auto_19778 ?auto_19789 ) ) ( not ( = ?auto_19778 ?auto_19810 ) ) ( not ( = ?auto_19779 ?auto_19789 ) ) ( not ( = ?auto_19779 ?auto_19810 ) ) ( not ( = ?auto_19780 ?auto_19789 ) ) ( not ( = ?auto_19780 ?auto_19810 ) ) ( not ( = ?auto_19783 ?auto_19789 ) ) ( not ( = ?auto_19783 ?auto_19810 ) ) ( not ( = ?auto_19782 ?auto_19789 ) ) ( not ( = ?auto_19782 ?auto_19810 ) ) ( not ( = ?auto_19781 ?auto_19789 ) ) ( not ( = ?auto_19781 ?auto_19810 ) ) ( not ( = ?auto_19784 ?auto_19789 ) ) ( not ( = ?auto_19784 ?auto_19810 ) ) ( not ( = ?auto_19786 ?auto_19789 ) ) ( not ( = ?auto_19786 ?auto_19810 ) ) ( not ( = ?auto_19785 ?auto_19789 ) ) ( not ( = ?auto_19785 ?auto_19810 ) ) ( not ( = ?auto_19789 ?auto_19809 ) ) ( not ( = ?auto_19789 ?auto_19796 ) ) ( not ( = ?auto_19789 ?auto_19818 ) ) ( not ( = ?auto_19789 ?auto_19828 ) ) ( not ( = ?auto_19789 ?auto_19801 ) ) ( not ( = ?auto_19789 ?auto_19827 ) ) ( not ( = ?auto_19789 ?auto_19819 ) ) ( not ( = ?auto_19789 ?auto_19816 ) ) ( not ( = ?auto_19789 ?auto_19798 ) ) ( not ( = ?auto_19789 ?auto_19812 ) ) ( not ( = ?auto_19789 ?auto_19806 ) ) ( not ( = ?auto_19789 ?auto_19824 ) ) ( not ( = ?auto_19810 ?auto_19809 ) ) ( not ( = ?auto_19810 ?auto_19796 ) ) ( not ( = ?auto_19810 ?auto_19818 ) ) ( not ( = ?auto_19810 ?auto_19828 ) ) ( not ( = ?auto_19810 ?auto_19801 ) ) ( not ( = ?auto_19810 ?auto_19827 ) ) ( not ( = ?auto_19810 ?auto_19819 ) ) ( not ( = ?auto_19810 ?auto_19816 ) ) ( not ( = ?auto_19810 ?auto_19798 ) ) ( not ( = ?auto_19810 ?auto_19812 ) ) ( not ( = ?auto_19810 ?auto_19806 ) ) ( not ( = ?auto_19810 ?auto_19824 ) ) ( not ( = ?auto_19775 ?auto_19788 ) ) ( not ( = ?auto_19775 ?auto_19794 ) ) ( not ( = ?auto_19776 ?auto_19788 ) ) ( not ( = ?auto_19776 ?auto_19794 ) ) ( not ( = ?auto_19777 ?auto_19788 ) ) ( not ( = ?auto_19777 ?auto_19794 ) ) ( not ( = ?auto_19778 ?auto_19788 ) ) ( not ( = ?auto_19778 ?auto_19794 ) ) ( not ( = ?auto_19779 ?auto_19788 ) ) ( not ( = ?auto_19779 ?auto_19794 ) ) ( not ( = ?auto_19780 ?auto_19788 ) ) ( not ( = ?auto_19780 ?auto_19794 ) ) ( not ( = ?auto_19783 ?auto_19788 ) ) ( not ( = ?auto_19783 ?auto_19794 ) ) ( not ( = ?auto_19782 ?auto_19788 ) ) ( not ( = ?auto_19782 ?auto_19794 ) ) ( not ( = ?auto_19781 ?auto_19788 ) ) ( not ( = ?auto_19781 ?auto_19794 ) ) ( not ( = ?auto_19784 ?auto_19788 ) ) ( not ( = ?auto_19784 ?auto_19794 ) ) ( not ( = ?auto_19786 ?auto_19788 ) ) ( not ( = ?auto_19786 ?auto_19794 ) ) ( not ( = ?auto_19785 ?auto_19788 ) ) ( not ( = ?auto_19785 ?auto_19794 ) ) ( not ( = ?auto_19787 ?auto_19788 ) ) ( not ( = ?auto_19787 ?auto_19794 ) ) ( not ( = ?auto_19788 ?auto_19810 ) ) ( not ( = ?auto_19788 ?auto_19809 ) ) ( not ( = ?auto_19788 ?auto_19796 ) ) ( not ( = ?auto_19788 ?auto_19818 ) ) ( not ( = ?auto_19788 ?auto_19828 ) ) ( not ( = ?auto_19788 ?auto_19801 ) ) ( not ( = ?auto_19788 ?auto_19827 ) ) ( not ( = ?auto_19788 ?auto_19819 ) ) ( not ( = ?auto_19788 ?auto_19816 ) ) ( not ( = ?auto_19788 ?auto_19798 ) ) ( not ( = ?auto_19788 ?auto_19812 ) ) ( not ( = ?auto_19788 ?auto_19806 ) ) ( not ( = ?auto_19788 ?auto_19824 ) ) ( not ( = ?auto_19794 ?auto_19810 ) ) ( not ( = ?auto_19794 ?auto_19809 ) ) ( not ( = ?auto_19794 ?auto_19796 ) ) ( not ( = ?auto_19794 ?auto_19818 ) ) ( not ( = ?auto_19794 ?auto_19828 ) ) ( not ( = ?auto_19794 ?auto_19801 ) ) ( not ( = ?auto_19794 ?auto_19827 ) ) ( not ( = ?auto_19794 ?auto_19819 ) ) ( not ( = ?auto_19794 ?auto_19816 ) ) ( not ( = ?auto_19794 ?auto_19798 ) ) ( not ( = ?auto_19794 ?auto_19812 ) ) ( not ( = ?auto_19794 ?auto_19806 ) ) ( not ( = ?auto_19794 ?auto_19824 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_19775 ?auto_19776 ?auto_19777 ?auto_19778 ?auto_19779 ?auto_19780 ?auto_19783 ?auto_19782 ?auto_19781 ?auto_19784 ?auto_19786 ?auto_19785 ?auto_19787 ?auto_19789 )
      ( MAKE-1CRATE ?auto_19789 ?auto_19788 )
      ( MAKE-14CRATE-VERIFY ?auto_19775 ?auto_19776 ?auto_19777 ?auto_19778 ?auto_19779 ?auto_19780 ?auto_19783 ?auto_19782 ?auto_19781 ?auto_19784 ?auto_19786 ?auto_19785 ?auto_19787 ?auto_19789 ?auto_19788 ) )
  )

)

