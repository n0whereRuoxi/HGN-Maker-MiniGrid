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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19145 - SURFACE
      ?auto_19146 - SURFACE
      ?auto_19147 - SURFACE
    )
    :vars
    (
      ?auto_19149 - HOIST
      ?auto_19148 - PLACE
      ?auto_19151 - PLACE
      ?auto_19153 - HOIST
      ?auto_19150 - SURFACE
      ?auto_19155 - PLACE
      ?auto_19156 - HOIST
      ?auto_19154 - SURFACE
      ?auto_19152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19149 ?auto_19148 ) ( IS-CRATE ?auto_19147 ) ( not ( = ?auto_19151 ?auto_19148 ) ) ( HOIST-AT ?auto_19153 ?auto_19151 ) ( AVAILABLE ?auto_19153 ) ( SURFACE-AT ?auto_19147 ?auto_19151 ) ( ON ?auto_19147 ?auto_19150 ) ( CLEAR ?auto_19147 ) ( not ( = ?auto_19146 ?auto_19147 ) ) ( not ( = ?auto_19146 ?auto_19150 ) ) ( not ( = ?auto_19147 ?auto_19150 ) ) ( not ( = ?auto_19149 ?auto_19153 ) ) ( SURFACE-AT ?auto_19145 ?auto_19148 ) ( CLEAR ?auto_19145 ) ( IS-CRATE ?auto_19146 ) ( AVAILABLE ?auto_19149 ) ( not ( = ?auto_19155 ?auto_19148 ) ) ( HOIST-AT ?auto_19156 ?auto_19155 ) ( AVAILABLE ?auto_19156 ) ( SURFACE-AT ?auto_19146 ?auto_19155 ) ( ON ?auto_19146 ?auto_19154 ) ( CLEAR ?auto_19146 ) ( TRUCK-AT ?auto_19152 ?auto_19148 ) ( not ( = ?auto_19145 ?auto_19146 ) ) ( not ( = ?auto_19145 ?auto_19154 ) ) ( not ( = ?auto_19146 ?auto_19154 ) ) ( not ( = ?auto_19149 ?auto_19156 ) ) ( not ( = ?auto_19145 ?auto_19147 ) ) ( not ( = ?auto_19145 ?auto_19150 ) ) ( not ( = ?auto_19147 ?auto_19154 ) ) ( not ( = ?auto_19151 ?auto_19155 ) ) ( not ( = ?auto_19153 ?auto_19156 ) ) ( not ( = ?auto_19150 ?auto_19154 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19145 ?auto_19146 )
      ( MAKE-1CRATE ?auto_19146 ?auto_19147 )
      ( MAKE-2CRATE-VERIFY ?auto_19145 ?auto_19146 ?auto_19147 ) )
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
      ?auto_19179 - HOIST
      ?auto_19175 - PLACE
      ?auto_19178 - PLACE
      ?auto_19177 - HOIST
      ?auto_19180 - SURFACE
      ?auto_19186 - PLACE
      ?auto_19184 - HOIST
      ?auto_19183 - SURFACE
      ?auto_19182 - PLACE
      ?auto_19181 - HOIST
      ?auto_19185 - SURFACE
      ?auto_19176 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19179 ?auto_19175 ) ( IS-CRATE ?auto_19174 ) ( not ( = ?auto_19178 ?auto_19175 ) ) ( HOIST-AT ?auto_19177 ?auto_19178 ) ( AVAILABLE ?auto_19177 ) ( SURFACE-AT ?auto_19174 ?auto_19178 ) ( ON ?auto_19174 ?auto_19180 ) ( CLEAR ?auto_19174 ) ( not ( = ?auto_19173 ?auto_19174 ) ) ( not ( = ?auto_19173 ?auto_19180 ) ) ( not ( = ?auto_19174 ?auto_19180 ) ) ( not ( = ?auto_19179 ?auto_19177 ) ) ( IS-CRATE ?auto_19173 ) ( not ( = ?auto_19186 ?auto_19175 ) ) ( HOIST-AT ?auto_19184 ?auto_19186 ) ( AVAILABLE ?auto_19184 ) ( SURFACE-AT ?auto_19173 ?auto_19186 ) ( ON ?auto_19173 ?auto_19183 ) ( CLEAR ?auto_19173 ) ( not ( = ?auto_19172 ?auto_19173 ) ) ( not ( = ?auto_19172 ?auto_19183 ) ) ( not ( = ?auto_19173 ?auto_19183 ) ) ( not ( = ?auto_19179 ?auto_19184 ) ) ( SURFACE-AT ?auto_19171 ?auto_19175 ) ( CLEAR ?auto_19171 ) ( IS-CRATE ?auto_19172 ) ( AVAILABLE ?auto_19179 ) ( not ( = ?auto_19182 ?auto_19175 ) ) ( HOIST-AT ?auto_19181 ?auto_19182 ) ( AVAILABLE ?auto_19181 ) ( SURFACE-AT ?auto_19172 ?auto_19182 ) ( ON ?auto_19172 ?auto_19185 ) ( CLEAR ?auto_19172 ) ( TRUCK-AT ?auto_19176 ?auto_19175 ) ( not ( = ?auto_19171 ?auto_19172 ) ) ( not ( = ?auto_19171 ?auto_19185 ) ) ( not ( = ?auto_19172 ?auto_19185 ) ) ( not ( = ?auto_19179 ?auto_19181 ) ) ( not ( = ?auto_19171 ?auto_19173 ) ) ( not ( = ?auto_19171 ?auto_19183 ) ) ( not ( = ?auto_19173 ?auto_19185 ) ) ( not ( = ?auto_19186 ?auto_19182 ) ) ( not ( = ?auto_19184 ?auto_19181 ) ) ( not ( = ?auto_19183 ?auto_19185 ) ) ( not ( = ?auto_19171 ?auto_19174 ) ) ( not ( = ?auto_19171 ?auto_19180 ) ) ( not ( = ?auto_19172 ?auto_19174 ) ) ( not ( = ?auto_19172 ?auto_19180 ) ) ( not ( = ?auto_19174 ?auto_19183 ) ) ( not ( = ?auto_19174 ?auto_19185 ) ) ( not ( = ?auto_19178 ?auto_19186 ) ) ( not ( = ?auto_19178 ?auto_19182 ) ) ( not ( = ?auto_19177 ?auto_19184 ) ) ( not ( = ?auto_19177 ?auto_19181 ) ) ( not ( = ?auto_19180 ?auto_19183 ) ) ( not ( = ?auto_19180 ?auto_19185 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19171 ?auto_19172 ?auto_19173 )
      ( MAKE-1CRATE ?auto_19173 ?auto_19174 )
      ( MAKE-3CRATE-VERIFY ?auto_19171 ?auto_19172 ?auto_19173 ?auto_19174 ) )
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
      ?auto_19209 - PLACE
      ?auto_19212 - PLACE
      ?auto_19211 - HOIST
      ?auto_19207 - SURFACE
      ?auto_19215 - PLACE
      ?auto_19221 - HOIST
      ?auto_19219 - SURFACE
      ?auto_19213 - PLACE
      ?auto_19216 - HOIST
      ?auto_19217 - SURFACE
      ?auto_19214 - PLACE
      ?auto_19220 - HOIST
      ?auto_19218 - SURFACE
      ?auto_19210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19208 ?auto_19209 ) ( IS-CRATE ?auto_19206 ) ( not ( = ?auto_19212 ?auto_19209 ) ) ( HOIST-AT ?auto_19211 ?auto_19212 ) ( AVAILABLE ?auto_19211 ) ( SURFACE-AT ?auto_19206 ?auto_19212 ) ( ON ?auto_19206 ?auto_19207 ) ( CLEAR ?auto_19206 ) ( not ( = ?auto_19205 ?auto_19206 ) ) ( not ( = ?auto_19205 ?auto_19207 ) ) ( not ( = ?auto_19206 ?auto_19207 ) ) ( not ( = ?auto_19208 ?auto_19211 ) ) ( IS-CRATE ?auto_19205 ) ( not ( = ?auto_19215 ?auto_19209 ) ) ( HOIST-AT ?auto_19221 ?auto_19215 ) ( AVAILABLE ?auto_19221 ) ( SURFACE-AT ?auto_19205 ?auto_19215 ) ( ON ?auto_19205 ?auto_19219 ) ( CLEAR ?auto_19205 ) ( not ( = ?auto_19204 ?auto_19205 ) ) ( not ( = ?auto_19204 ?auto_19219 ) ) ( not ( = ?auto_19205 ?auto_19219 ) ) ( not ( = ?auto_19208 ?auto_19221 ) ) ( IS-CRATE ?auto_19204 ) ( not ( = ?auto_19213 ?auto_19209 ) ) ( HOIST-AT ?auto_19216 ?auto_19213 ) ( AVAILABLE ?auto_19216 ) ( SURFACE-AT ?auto_19204 ?auto_19213 ) ( ON ?auto_19204 ?auto_19217 ) ( CLEAR ?auto_19204 ) ( not ( = ?auto_19203 ?auto_19204 ) ) ( not ( = ?auto_19203 ?auto_19217 ) ) ( not ( = ?auto_19204 ?auto_19217 ) ) ( not ( = ?auto_19208 ?auto_19216 ) ) ( SURFACE-AT ?auto_19202 ?auto_19209 ) ( CLEAR ?auto_19202 ) ( IS-CRATE ?auto_19203 ) ( AVAILABLE ?auto_19208 ) ( not ( = ?auto_19214 ?auto_19209 ) ) ( HOIST-AT ?auto_19220 ?auto_19214 ) ( AVAILABLE ?auto_19220 ) ( SURFACE-AT ?auto_19203 ?auto_19214 ) ( ON ?auto_19203 ?auto_19218 ) ( CLEAR ?auto_19203 ) ( TRUCK-AT ?auto_19210 ?auto_19209 ) ( not ( = ?auto_19202 ?auto_19203 ) ) ( not ( = ?auto_19202 ?auto_19218 ) ) ( not ( = ?auto_19203 ?auto_19218 ) ) ( not ( = ?auto_19208 ?auto_19220 ) ) ( not ( = ?auto_19202 ?auto_19204 ) ) ( not ( = ?auto_19202 ?auto_19217 ) ) ( not ( = ?auto_19204 ?auto_19218 ) ) ( not ( = ?auto_19213 ?auto_19214 ) ) ( not ( = ?auto_19216 ?auto_19220 ) ) ( not ( = ?auto_19217 ?auto_19218 ) ) ( not ( = ?auto_19202 ?auto_19205 ) ) ( not ( = ?auto_19202 ?auto_19219 ) ) ( not ( = ?auto_19203 ?auto_19205 ) ) ( not ( = ?auto_19203 ?auto_19219 ) ) ( not ( = ?auto_19205 ?auto_19217 ) ) ( not ( = ?auto_19205 ?auto_19218 ) ) ( not ( = ?auto_19215 ?auto_19213 ) ) ( not ( = ?auto_19215 ?auto_19214 ) ) ( not ( = ?auto_19221 ?auto_19216 ) ) ( not ( = ?auto_19221 ?auto_19220 ) ) ( not ( = ?auto_19219 ?auto_19217 ) ) ( not ( = ?auto_19219 ?auto_19218 ) ) ( not ( = ?auto_19202 ?auto_19206 ) ) ( not ( = ?auto_19202 ?auto_19207 ) ) ( not ( = ?auto_19203 ?auto_19206 ) ) ( not ( = ?auto_19203 ?auto_19207 ) ) ( not ( = ?auto_19204 ?auto_19206 ) ) ( not ( = ?auto_19204 ?auto_19207 ) ) ( not ( = ?auto_19206 ?auto_19219 ) ) ( not ( = ?auto_19206 ?auto_19217 ) ) ( not ( = ?auto_19206 ?auto_19218 ) ) ( not ( = ?auto_19212 ?auto_19215 ) ) ( not ( = ?auto_19212 ?auto_19213 ) ) ( not ( = ?auto_19212 ?auto_19214 ) ) ( not ( = ?auto_19211 ?auto_19221 ) ) ( not ( = ?auto_19211 ?auto_19216 ) ) ( not ( = ?auto_19211 ?auto_19220 ) ) ( not ( = ?auto_19207 ?auto_19219 ) ) ( not ( = ?auto_19207 ?auto_19217 ) ) ( not ( = ?auto_19207 ?auto_19218 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_19202 ?auto_19203 ?auto_19204 ?auto_19205 )
      ( MAKE-1CRATE ?auto_19205 ?auto_19206 )
      ( MAKE-4CRATE-VERIFY ?auto_19202 ?auto_19203 ?auto_19204 ?auto_19205 ?auto_19206 ) )
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
      ?auto_19246 - PLACE
      ?auto_19245 - PLACE
      ?auto_19244 - HOIST
      ?auto_19248 - SURFACE
      ?auto_19260 - PLACE
      ?auto_19259 - HOIST
      ?auto_19250 - SURFACE
      ?auto_19251 - PLACE
      ?auto_19254 - HOIST
      ?auto_19252 - SURFACE
      ?auto_19253 - PLACE
      ?auto_19255 - HOIST
      ?auto_19257 - SURFACE
      ?auto_19261 - PLACE
      ?auto_19256 - HOIST
      ?auto_19258 - SURFACE
      ?auto_19249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19247 ?auto_19246 ) ( IS-CRATE ?auto_19243 ) ( not ( = ?auto_19245 ?auto_19246 ) ) ( HOIST-AT ?auto_19244 ?auto_19245 ) ( AVAILABLE ?auto_19244 ) ( SURFACE-AT ?auto_19243 ?auto_19245 ) ( ON ?auto_19243 ?auto_19248 ) ( CLEAR ?auto_19243 ) ( not ( = ?auto_19242 ?auto_19243 ) ) ( not ( = ?auto_19242 ?auto_19248 ) ) ( not ( = ?auto_19243 ?auto_19248 ) ) ( not ( = ?auto_19247 ?auto_19244 ) ) ( IS-CRATE ?auto_19242 ) ( not ( = ?auto_19260 ?auto_19246 ) ) ( HOIST-AT ?auto_19259 ?auto_19260 ) ( AVAILABLE ?auto_19259 ) ( SURFACE-AT ?auto_19242 ?auto_19260 ) ( ON ?auto_19242 ?auto_19250 ) ( CLEAR ?auto_19242 ) ( not ( = ?auto_19241 ?auto_19242 ) ) ( not ( = ?auto_19241 ?auto_19250 ) ) ( not ( = ?auto_19242 ?auto_19250 ) ) ( not ( = ?auto_19247 ?auto_19259 ) ) ( IS-CRATE ?auto_19241 ) ( not ( = ?auto_19251 ?auto_19246 ) ) ( HOIST-AT ?auto_19254 ?auto_19251 ) ( AVAILABLE ?auto_19254 ) ( SURFACE-AT ?auto_19241 ?auto_19251 ) ( ON ?auto_19241 ?auto_19252 ) ( CLEAR ?auto_19241 ) ( not ( = ?auto_19240 ?auto_19241 ) ) ( not ( = ?auto_19240 ?auto_19252 ) ) ( not ( = ?auto_19241 ?auto_19252 ) ) ( not ( = ?auto_19247 ?auto_19254 ) ) ( IS-CRATE ?auto_19240 ) ( not ( = ?auto_19253 ?auto_19246 ) ) ( HOIST-AT ?auto_19255 ?auto_19253 ) ( AVAILABLE ?auto_19255 ) ( SURFACE-AT ?auto_19240 ?auto_19253 ) ( ON ?auto_19240 ?auto_19257 ) ( CLEAR ?auto_19240 ) ( not ( = ?auto_19239 ?auto_19240 ) ) ( not ( = ?auto_19239 ?auto_19257 ) ) ( not ( = ?auto_19240 ?auto_19257 ) ) ( not ( = ?auto_19247 ?auto_19255 ) ) ( SURFACE-AT ?auto_19238 ?auto_19246 ) ( CLEAR ?auto_19238 ) ( IS-CRATE ?auto_19239 ) ( AVAILABLE ?auto_19247 ) ( not ( = ?auto_19261 ?auto_19246 ) ) ( HOIST-AT ?auto_19256 ?auto_19261 ) ( AVAILABLE ?auto_19256 ) ( SURFACE-AT ?auto_19239 ?auto_19261 ) ( ON ?auto_19239 ?auto_19258 ) ( CLEAR ?auto_19239 ) ( TRUCK-AT ?auto_19249 ?auto_19246 ) ( not ( = ?auto_19238 ?auto_19239 ) ) ( not ( = ?auto_19238 ?auto_19258 ) ) ( not ( = ?auto_19239 ?auto_19258 ) ) ( not ( = ?auto_19247 ?auto_19256 ) ) ( not ( = ?auto_19238 ?auto_19240 ) ) ( not ( = ?auto_19238 ?auto_19257 ) ) ( not ( = ?auto_19240 ?auto_19258 ) ) ( not ( = ?auto_19253 ?auto_19261 ) ) ( not ( = ?auto_19255 ?auto_19256 ) ) ( not ( = ?auto_19257 ?auto_19258 ) ) ( not ( = ?auto_19238 ?auto_19241 ) ) ( not ( = ?auto_19238 ?auto_19252 ) ) ( not ( = ?auto_19239 ?auto_19241 ) ) ( not ( = ?auto_19239 ?auto_19252 ) ) ( not ( = ?auto_19241 ?auto_19257 ) ) ( not ( = ?auto_19241 ?auto_19258 ) ) ( not ( = ?auto_19251 ?auto_19253 ) ) ( not ( = ?auto_19251 ?auto_19261 ) ) ( not ( = ?auto_19254 ?auto_19255 ) ) ( not ( = ?auto_19254 ?auto_19256 ) ) ( not ( = ?auto_19252 ?auto_19257 ) ) ( not ( = ?auto_19252 ?auto_19258 ) ) ( not ( = ?auto_19238 ?auto_19242 ) ) ( not ( = ?auto_19238 ?auto_19250 ) ) ( not ( = ?auto_19239 ?auto_19242 ) ) ( not ( = ?auto_19239 ?auto_19250 ) ) ( not ( = ?auto_19240 ?auto_19242 ) ) ( not ( = ?auto_19240 ?auto_19250 ) ) ( not ( = ?auto_19242 ?auto_19252 ) ) ( not ( = ?auto_19242 ?auto_19257 ) ) ( not ( = ?auto_19242 ?auto_19258 ) ) ( not ( = ?auto_19260 ?auto_19251 ) ) ( not ( = ?auto_19260 ?auto_19253 ) ) ( not ( = ?auto_19260 ?auto_19261 ) ) ( not ( = ?auto_19259 ?auto_19254 ) ) ( not ( = ?auto_19259 ?auto_19255 ) ) ( not ( = ?auto_19259 ?auto_19256 ) ) ( not ( = ?auto_19250 ?auto_19252 ) ) ( not ( = ?auto_19250 ?auto_19257 ) ) ( not ( = ?auto_19250 ?auto_19258 ) ) ( not ( = ?auto_19238 ?auto_19243 ) ) ( not ( = ?auto_19238 ?auto_19248 ) ) ( not ( = ?auto_19239 ?auto_19243 ) ) ( not ( = ?auto_19239 ?auto_19248 ) ) ( not ( = ?auto_19240 ?auto_19243 ) ) ( not ( = ?auto_19240 ?auto_19248 ) ) ( not ( = ?auto_19241 ?auto_19243 ) ) ( not ( = ?auto_19241 ?auto_19248 ) ) ( not ( = ?auto_19243 ?auto_19250 ) ) ( not ( = ?auto_19243 ?auto_19252 ) ) ( not ( = ?auto_19243 ?auto_19257 ) ) ( not ( = ?auto_19243 ?auto_19258 ) ) ( not ( = ?auto_19245 ?auto_19260 ) ) ( not ( = ?auto_19245 ?auto_19251 ) ) ( not ( = ?auto_19245 ?auto_19253 ) ) ( not ( = ?auto_19245 ?auto_19261 ) ) ( not ( = ?auto_19244 ?auto_19259 ) ) ( not ( = ?auto_19244 ?auto_19254 ) ) ( not ( = ?auto_19244 ?auto_19255 ) ) ( not ( = ?auto_19244 ?auto_19256 ) ) ( not ( = ?auto_19248 ?auto_19250 ) ) ( not ( = ?auto_19248 ?auto_19252 ) ) ( not ( = ?auto_19248 ?auto_19257 ) ) ( not ( = ?auto_19248 ?auto_19258 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_19238 ?auto_19239 ?auto_19240 ?auto_19241 ?auto_19242 )
      ( MAKE-1CRATE ?auto_19242 ?auto_19243 )
      ( MAKE-5CRATE-VERIFY ?auto_19238 ?auto_19239 ?auto_19240 ?auto_19241 ?auto_19242 ?auto_19243 ) )
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
      ?auto_19289 - HOIST
      ?auto_19290 - PLACE
      ?auto_19291 - PLACE
      ?auto_19286 - HOIST
      ?auto_19288 - SURFACE
      ?auto_19306 - PLACE
      ?auto_19305 - HOIST
      ?auto_19294 - SURFACE
      ?auto_19298 - PLACE
      ?auto_19296 - HOIST
      ?auto_19299 - SURFACE
      ?auto_19303 - PLACE
      ?auto_19295 - HOIST
      ?auto_19304 - SURFACE
      ?auto_19302 - PLACE
      ?auto_19292 - HOIST
      ?auto_19300 - SURFACE
      ?auto_19297 - PLACE
      ?auto_19293 - HOIST
      ?auto_19301 - SURFACE
      ?auto_19287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19289 ?auto_19290 ) ( IS-CRATE ?auto_19285 ) ( not ( = ?auto_19291 ?auto_19290 ) ) ( HOIST-AT ?auto_19286 ?auto_19291 ) ( AVAILABLE ?auto_19286 ) ( SURFACE-AT ?auto_19285 ?auto_19291 ) ( ON ?auto_19285 ?auto_19288 ) ( CLEAR ?auto_19285 ) ( not ( = ?auto_19284 ?auto_19285 ) ) ( not ( = ?auto_19284 ?auto_19288 ) ) ( not ( = ?auto_19285 ?auto_19288 ) ) ( not ( = ?auto_19289 ?auto_19286 ) ) ( IS-CRATE ?auto_19284 ) ( not ( = ?auto_19306 ?auto_19290 ) ) ( HOIST-AT ?auto_19305 ?auto_19306 ) ( AVAILABLE ?auto_19305 ) ( SURFACE-AT ?auto_19284 ?auto_19306 ) ( ON ?auto_19284 ?auto_19294 ) ( CLEAR ?auto_19284 ) ( not ( = ?auto_19283 ?auto_19284 ) ) ( not ( = ?auto_19283 ?auto_19294 ) ) ( not ( = ?auto_19284 ?auto_19294 ) ) ( not ( = ?auto_19289 ?auto_19305 ) ) ( IS-CRATE ?auto_19283 ) ( not ( = ?auto_19298 ?auto_19290 ) ) ( HOIST-AT ?auto_19296 ?auto_19298 ) ( AVAILABLE ?auto_19296 ) ( SURFACE-AT ?auto_19283 ?auto_19298 ) ( ON ?auto_19283 ?auto_19299 ) ( CLEAR ?auto_19283 ) ( not ( = ?auto_19282 ?auto_19283 ) ) ( not ( = ?auto_19282 ?auto_19299 ) ) ( not ( = ?auto_19283 ?auto_19299 ) ) ( not ( = ?auto_19289 ?auto_19296 ) ) ( IS-CRATE ?auto_19282 ) ( not ( = ?auto_19303 ?auto_19290 ) ) ( HOIST-AT ?auto_19295 ?auto_19303 ) ( AVAILABLE ?auto_19295 ) ( SURFACE-AT ?auto_19282 ?auto_19303 ) ( ON ?auto_19282 ?auto_19304 ) ( CLEAR ?auto_19282 ) ( not ( = ?auto_19281 ?auto_19282 ) ) ( not ( = ?auto_19281 ?auto_19304 ) ) ( not ( = ?auto_19282 ?auto_19304 ) ) ( not ( = ?auto_19289 ?auto_19295 ) ) ( IS-CRATE ?auto_19281 ) ( not ( = ?auto_19302 ?auto_19290 ) ) ( HOIST-AT ?auto_19292 ?auto_19302 ) ( AVAILABLE ?auto_19292 ) ( SURFACE-AT ?auto_19281 ?auto_19302 ) ( ON ?auto_19281 ?auto_19300 ) ( CLEAR ?auto_19281 ) ( not ( = ?auto_19280 ?auto_19281 ) ) ( not ( = ?auto_19280 ?auto_19300 ) ) ( not ( = ?auto_19281 ?auto_19300 ) ) ( not ( = ?auto_19289 ?auto_19292 ) ) ( SURFACE-AT ?auto_19279 ?auto_19290 ) ( CLEAR ?auto_19279 ) ( IS-CRATE ?auto_19280 ) ( AVAILABLE ?auto_19289 ) ( not ( = ?auto_19297 ?auto_19290 ) ) ( HOIST-AT ?auto_19293 ?auto_19297 ) ( AVAILABLE ?auto_19293 ) ( SURFACE-AT ?auto_19280 ?auto_19297 ) ( ON ?auto_19280 ?auto_19301 ) ( CLEAR ?auto_19280 ) ( TRUCK-AT ?auto_19287 ?auto_19290 ) ( not ( = ?auto_19279 ?auto_19280 ) ) ( not ( = ?auto_19279 ?auto_19301 ) ) ( not ( = ?auto_19280 ?auto_19301 ) ) ( not ( = ?auto_19289 ?auto_19293 ) ) ( not ( = ?auto_19279 ?auto_19281 ) ) ( not ( = ?auto_19279 ?auto_19300 ) ) ( not ( = ?auto_19281 ?auto_19301 ) ) ( not ( = ?auto_19302 ?auto_19297 ) ) ( not ( = ?auto_19292 ?auto_19293 ) ) ( not ( = ?auto_19300 ?auto_19301 ) ) ( not ( = ?auto_19279 ?auto_19282 ) ) ( not ( = ?auto_19279 ?auto_19304 ) ) ( not ( = ?auto_19280 ?auto_19282 ) ) ( not ( = ?auto_19280 ?auto_19304 ) ) ( not ( = ?auto_19282 ?auto_19300 ) ) ( not ( = ?auto_19282 ?auto_19301 ) ) ( not ( = ?auto_19303 ?auto_19302 ) ) ( not ( = ?auto_19303 ?auto_19297 ) ) ( not ( = ?auto_19295 ?auto_19292 ) ) ( not ( = ?auto_19295 ?auto_19293 ) ) ( not ( = ?auto_19304 ?auto_19300 ) ) ( not ( = ?auto_19304 ?auto_19301 ) ) ( not ( = ?auto_19279 ?auto_19283 ) ) ( not ( = ?auto_19279 ?auto_19299 ) ) ( not ( = ?auto_19280 ?auto_19283 ) ) ( not ( = ?auto_19280 ?auto_19299 ) ) ( not ( = ?auto_19281 ?auto_19283 ) ) ( not ( = ?auto_19281 ?auto_19299 ) ) ( not ( = ?auto_19283 ?auto_19304 ) ) ( not ( = ?auto_19283 ?auto_19300 ) ) ( not ( = ?auto_19283 ?auto_19301 ) ) ( not ( = ?auto_19298 ?auto_19303 ) ) ( not ( = ?auto_19298 ?auto_19302 ) ) ( not ( = ?auto_19298 ?auto_19297 ) ) ( not ( = ?auto_19296 ?auto_19295 ) ) ( not ( = ?auto_19296 ?auto_19292 ) ) ( not ( = ?auto_19296 ?auto_19293 ) ) ( not ( = ?auto_19299 ?auto_19304 ) ) ( not ( = ?auto_19299 ?auto_19300 ) ) ( not ( = ?auto_19299 ?auto_19301 ) ) ( not ( = ?auto_19279 ?auto_19284 ) ) ( not ( = ?auto_19279 ?auto_19294 ) ) ( not ( = ?auto_19280 ?auto_19284 ) ) ( not ( = ?auto_19280 ?auto_19294 ) ) ( not ( = ?auto_19281 ?auto_19284 ) ) ( not ( = ?auto_19281 ?auto_19294 ) ) ( not ( = ?auto_19282 ?auto_19284 ) ) ( not ( = ?auto_19282 ?auto_19294 ) ) ( not ( = ?auto_19284 ?auto_19299 ) ) ( not ( = ?auto_19284 ?auto_19304 ) ) ( not ( = ?auto_19284 ?auto_19300 ) ) ( not ( = ?auto_19284 ?auto_19301 ) ) ( not ( = ?auto_19306 ?auto_19298 ) ) ( not ( = ?auto_19306 ?auto_19303 ) ) ( not ( = ?auto_19306 ?auto_19302 ) ) ( not ( = ?auto_19306 ?auto_19297 ) ) ( not ( = ?auto_19305 ?auto_19296 ) ) ( not ( = ?auto_19305 ?auto_19295 ) ) ( not ( = ?auto_19305 ?auto_19292 ) ) ( not ( = ?auto_19305 ?auto_19293 ) ) ( not ( = ?auto_19294 ?auto_19299 ) ) ( not ( = ?auto_19294 ?auto_19304 ) ) ( not ( = ?auto_19294 ?auto_19300 ) ) ( not ( = ?auto_19294 ?auto_19301 ) ) ( not ( = ?auto_19279 ?auto_19285 ) ) ( not ( = ?auto_19279 ?auto_19288 ) ) ( not ( = ?auto_19280 ?auto_19285 ) ) ( not ( = ?auto_19280 ?auto_19288 ) ) ( not ( = ?auto_19281 ?auto_19285 ) ) ( not ( = ?auto_19281 ?auto_19288 ) ) ( not ( = ?auto_19282 ?auto_19285 ) ) ( not ( = ?auto_19282 ?auto_19288 ) ) ( not ( = ?auto_19283 ?auto_19285 ) ) ( not ( = ?auto_19283 ?auto_19288 ) ) ( not ( = ?auto_19285 ?auto_19294 ) ) ( not ( = ?auto_19285 ?auto_19299 ) ) ( not ( = ?auto_19285 ?auto_19304 ) ) ( not ( = ?auto_19285 ?auto_19300 ) ) ( not ( = ?auto_19285 ?auto_19301 ) ) ( not ( = ?auto_19291 ?auto_19306 ) ) ( not ( = ?auto_19291 ?auto_19298 ) ) ( not ( = ?auto_19291 ?auto_19303 ) ) ( not ( = ?auto_19291 ?auto_19302 ) ) ( not ( = ?auto_19291 ?auto_19297 ) ) ( not ( = ?auto_19286 ?auto_19305 ) ) ( not ( = ?auto_19286 ?auto_19296 ) ) ( not ( = ?auto_19286 ?auto_19295 ) ) ( not ( = ?auto_19286 ?auto_19292 ) ) ( not ( = ?auto_19286 ?auto_19293 ) ) ( not ( = ?auto_19288 ?auto_19294 ) ) ( not ( = ?auto_19288 ?auto_19299 ) ) ( not ( = ?auto_19288 ?auto_19304 ) ) ( not ( = ?auto_19288 ?auto_19300 ) ) ( not ( = ?auto_19288 ?auto_19301 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_19279 ?auto_19280 ?auto_19281 ?auto_19282 ?auto_19283 ?auto_19284 )
      ( MAKE-1CRATE ?auto_19284 ?auto_19285 )
      ( MAKE-6CRATE-VERIFY ?auto_19279 ?auto_19280 ?auto_19281 ?auto_19282 ?auto_19283 ?auto_19284 ?auto_19285 ) )
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
      ?auto_19331 - SURFACE
      ?auto_19332 - SURFACE
    )
    :vars
    (
      ?auto_19333 - HOIST
      ?auto_19336 - PLACE
      ?auto_19334 - PLACE
      ?auto_19337 - HOIST
      ?auto_19338 - SURFACE
      ?auto_19342 - PLACE
      ?auto_19355 - HOIST
      ?auto_19354 - SURFACE
      ?auto_19349 - PLACE
      ?auto_19340 - HOIST
      ?auto_19348 - SURFACE
      ?auto_19351 - PLACE
      ?auto_19353 - HOIST
      ?auto_19341 - SURFACE
      ?auto_19346 - PLACE
      ?auto_19343 - HOIST
      ?auto_19347 - SURFACE
      ?auto_19356 - PLACE
      ?auto_19350 - HOIST
      ?auto_19339 - SURFACE
      ?auto_19352 - PLACE
      ?auto_19344 - HOIST
      ?auto_19345 - SURFACE
      ?auto_19335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19333 ?auto_19336 ) ( IS-CRATE ?auto_19332 ) ( not ( = ?auto_19334 ?auto_19336 ) ) ( HOIST-AT ?auto_19337 ?auto_19334 ) ( AVAILABLE ?auto_19337 ) ( SURFACE-AT ?auto_19332 ?auto_19334 ) ( ON ?auto_19332 ?auto_19338 ) ( CLEAR ?auto_19332 ) ( not ( = ?auto_19331 ?auto_19332 ) ) ( not ( = ?auto_19331 ?auto_19338 ) ) ( not ( = ?auto_19332 ?auto_19338 ) ) ( not ( = ?auto_19333 ?auto_19337 ) ) ( IS-CRATE ?auto_19331 ) ( not ( = ?auto_19342 ?auto_19336 ) ) ( HOIST-AT ?auto_19355 ?auto_19342 ) ( AVAILABLE ?auto_19355 ) ( SURFACE-AT ?auto_19331 ?auto_19342 ) ( ON ?auto_19331 ?auto_19354 ) ( CLEAR ?auto_19331 ) ( not ( = ?auto_19330 ?auto_19331 ) ) ( not ( = ?auto_19330 ?auto_19354 ) ) ( not ( = ?auto_19331 ?auto_19354 ) ) ( not ( = ?auto_19333 ?auto_19355 ) ) ( IS-CRATE ?auto_19330 ) ( not ( = ?auto_19349 ?auto_19336 ) ) ( HOIST-AT ?auto_19340 ?auto_19349 ) ( AVAILABLE ?auto_19340 ) ( SURFACE-AT ?auto_19330 ?auto_19349 ) ( ON ?auto_19330 ?auto_19348 ) ( CLEAR ?auto_19330 ) ( not ( = ?auto_19329 ?auto_19330 ) ) ( not ( = ?auto_19329 ?auto_19348 ) ) ( not ( = ?auto_19330 ?auto_19348 ) ) ( not ( = ?auto_19333 ?auto_19340 ) ) ( IS-CRATE ?auto_19329 ) ( not ( = ?auto_19351 ?auto_19336 ) ) ( HOIST-AT ?auto_19353 ?auto_19351 ) ( AVAILABLE ?auto_19353 ) ( SURFACE-AT ?auto_19329 ?auto_19351 ) ( ON ?auto_19329 ?auto_19341 ) ( CLEAR ?auto_19329 ) ( not ( = ?auto_19328 ?auto_19329 ) ) ( not ( = ?auto_19328 ?auto_19341 ) ) ( not ( = ?auto_19329 ?auto_19341 ) ) ( not ( = ?auto_19333 ?auto_19353 ) ) ( IS-CRATE ?auto_19328 ) ( not ( = ?auto_19346 ?auto_19336 ) ) ( HOIST-AT ?auto_19343 ?auto_19346 ) ( AVAILABLE ?auto_19343 ) ( SURFACE-AT ?auto_19328 ?auto_19346 ) ( ON ?auto_19328 ?auto_19347 ) ( CLEAR ?auto_19328 ) ( not ( = ?auto_19327 ?auto_19328 ) ) ( not ( = ?auto_19327 ?auto_19347 ) ) ( not ( = ?auto_19328 ?auto_19347 ) ) ( not ( = ?auto_19333 ?auto_19343 ) ) ( IS-CRATE ?auto_19327 ) ( not ( = ?auto_19356 ?auto_19336 ) ) ( HOIST-AT ?auto_19350 ?auto_19356 ) ( AVAILABLE ?auto_19350 ) ( SURFACE-AT ?auto_19327 ?auto_19356 ) ( ON ?auto_19327 ?auto_19339 ) ( CLEAR ?auto_19327 ) ( not ( = ?auto_19326 ?auto_19327 ) ) ( not ( = ?auto_19326 ?auto_19339 ) ) ( not ( = ?auto_19327 ?auto_19339 ) ) ( not ( = ?auto_19333 ?auto_19350 ) ) ( SURFACE-AT ?auto_19325 ?auto_19336 ) ( CLEAR ?auto_19325 ) ( IS-CRATE ?auto_19326 ) ( AVAILABLE ?auto_19333 ) ( not ( = ?auto_19352 ?auto_19336 ) ) ( HOIST-AT ?auto_19344 ?auto_19352 ) ( AVAILABLE ?auto_19344 ) ( SURFACE-AT ?auto_19326 ?auto_19352 ) ( ON ?auto_19326 ?auto_19345 ) ( CLEAR ?auto_19326 ) ( TRUCK-AT ?auto_19335 ?auto_19336 ) ( not ( = ?auto_19325 ?auto_19326 ) ) ( not ( = ?auto_19325 ?auto_19345 ) ) ( not ( = ?auto_19326 ?auto_19345 ) ) ( not ( = ?auto_19333 ?auto_19344 ) ) ( not ( = ?auto_19325 ?auto_19327 ) ) ( not ( = ?auto_19325 ?auto_19339 ) ) ( not ( = ?auto_19327 ?auto_19345 ) ) ( not ( = ?auto_19356 ?auto_19352 ) ) ( not ( = ?auto_19350 ?auto_19344 ) ) ( not ( = ?auto_19339 ?auto_19345 ) ) ( not ( = ?auto_19325 ?auto_19328 ) ) ( not ( = ?auto_19325 ?auto_19347 ) ) ( not ( = ?auto_19326 ?auto_19328 ) ) ( not ( = ?auto_19326 ?auto_19347 ) ) ( not ( = ?auto_19328 ?auto_19339 ) ) ( not ( = ?auto_19328 ?auto_19345 ) ) ( not ( = ?auto_19346 ?auto_19356 ) ) ( not ( = ?auto_19346 ?auto_19352 ) ) ( not ( = ?auto_19343 ?auto_19350 ) ) ( not ( = ?auto_19343 ?auto_19344 ) ) ( not ( = ?auto_19347 ?auto_19339 ) ) ( not ( = ?auto_19347 ?auto_19345 ) ) ( not ( = ?auto_19325 ?auto_19329 ) ) ( not ( = ?auto_19325 ?auto_19341 ) ) ( not ( = ?auto_19326 ?auto_19329 ) ) ( not ( = ?auto_19326 ?auto_19341 ) ) ( not ( = ?auto_19327 ?auto_19329 ) ) ( not ( = ?auto_19327 ?auto_19341 ) ) ( not ( = ?auto_19329 ?auto_19347 ) ) ( not ( = ?auto_19329 ?auto_19339 ) ) ( not ( = ?auto_19329 ?auto_19345 ) ) ( not ( = ?auto_19351 ?auto_19346 ) ) ( not ( = ?auto_19351 ?auto_19356 ) ) ( not ( = ?auto_19351 ?auto_19352 ) ) ( not ( = ?auto_19353 ?auto_19343 ) ) ( not ( = ?auto_19353 ?auto_19350 ) ) ( not ( = ?auto_19353 ?auto_19344 ) ) ( not ( = ?auto_19341 ?auto_19347 ) ) ( not ( = ?auto_19341 ?auto_19339 ) ) ( not ( = ?auto_19341 ?auto_19345 ) ) ( not ( = ?auto_19325 ?auto_19330 ) ) ( not ( = ?auto_19325 ?auto_19348 ) ) ( not ( = ?auto_19326 ?auto_19330 ) ) ( not ( = ?auto_19326 ?auto_19348 ) ) ( not ( = ?auto_19327 ?auto_19330 ) ) ( not ( = ?auto_19327 ?auto_19348 ) ) ( not ( = ?auto_19328 ?auto_19330 ) ) ( not ( = ?auto_19328 ?auto_19348 ) ) ( not ( = ?auto_19330 ?auto_19341 ) ) ( not ( = ?auto_19330 ?auto_19347 ) ) ( not ( = ?auto_19330 ?auto_19339 ) ) ( not ( = ?auto_19330 ?auto_19345 ) ) ( not ( = ?auto_19349 ?auto_19351 ) ) ( not ( = ?auto_19349 ?auto_19346 ) ) ( not ( = ?auto_19349 ?auto_19356 ) ) ( not ( = ?auto_19349 ?auto_19352 ) ) ( not ( = ?auto_19340 ?auto_19353 ) ) ( not ( = ?auto_19340 ?auto_19343 ) ) ( not ( = ?auto_19340 ?auto_19350 ) ) ( not ( = ?auto_19340 ?auto_19344 ) ) ( not ( = ?auto_19348 ?auto_19341 ) ) ( not ( = ?auto_19348 ?auto_19347 ) ) ( not ( = ?auto_19348 ?auto_19339 ) ) ( not ( = ?auto_19348 ?auto_19345 ) ) ( not ( = ?auto_19325 ?auto_19331 ) ) ( not ( = ?auto_19325 ?auto_19354 ) ) ( not ( = ?auto_19326 ?auto_19331 ) ) ( not ( = ?auto_19326 ?auto_19354 ) ) ( not ( = ?auto_19327 ?auto_19331 ) ) ( not ( = ?auto_19327 ?auto_19354 ) ) ( not ( = ?auto_19328 ?auto_19331 ) ) ( not ( = ?auto_19328 ?auto_19354 ) ) ( not ( = ?auto_19329 ?auto_19331 ) ) ( not ( = ?auto_19329 ?auto_19354 ) ) ( not ( = ?auto_19331 ?auto_19348 ) ) ( not ( = ?auto_19331 ?auto_19341 ) ) ( not ( = ?auto_19331 ?auto_19347 ) ) ( not ( = ?auto_19331 ?auto_19339 ) ) ( not ( = ?auto_19331 ?auto_19345 ) ) ( not ( = ?auto_19342 ?auto_19349 ) ) ( not ( = ?auto_19342 ?auto_19351 ) ) ( not ( = ?auto_19342 ?auto_19346 ) ) ( not ( = ?auto_19342 ?auto_19356 ) ) ( not ( = ?auto_19342 ?auto_19352 ) ) ( not ( = ?auto_19355 ?auto_19340 ) ) ( not ( = ?auto_19355 ?auto_19353 ) ) ( not ( = ?auto_19355 ?auto_19343 ) ) ( not ( = ?auto_19355 ?auto_19350 ) ) ( not ( = ?auto_19355 ?auto_19344 ) ) ( not ( = ?auto_19354 ?auto_19348 ) ) ( not ( = ?auto_19354 ?auto_19341 ) ) ( not ( = ?auto_19354 ?auto_19347 ) ) ( not ( = ?auto_19354 ?auto_19339 ) ) ( not ( = ?auto_19354 ?auto_19345 ) ) ( not ( = ?auto_19325 ?auto_19332 ) ) ( not ( = ?auto_19325 ?auto_19338 ) ) ( not ( = ?auto_19326 ?auto_19332 ) ) ( not ( = ?auto_19326 ?auto_19338 ) ) ( not ( = ?auto_19327 ?auto_19332 ) ) ( not ( = ?auto_19327 ?auto_19338 ) ) ( not ( = ?auto_19328 ?auto_19332 ) ) ( not ( = ?auto_19328 ?auto_19338 ) ) ( not ( = ?auto_19329 ?auto_19332 ) ) ( not ( = ?auto_19329 ?auto_19338 ) ) ( not ( = ?auto_19330 ?auto_19332 ) ) ( not ( = ?auto_19330 ?auto_19338 ) ) ( not ( = ?auto_19332 ?auto_19354 ) ) ( not ( = ?auto_19332 ?auto_19348 ) ) ( not ( = ?auto_19332 ?auto_19341 ) ) ( not ( = ?auto_19332 ?auto_19347 ) ) ( not ( = ?auto_19332 ?auto_19339 ) ) ( not ( = ?auto_19332 ?auto_19345 ) ) ( not ( = ?auto_19334 ?auto_19342 ) ) ( not ( = ?auto_19334 ?auto_19349 ) ) ( not ( = ?auto_19334 ?auto_19351 ) ) ( not ( = ?auto_19334 ?auto_19346 ) ) ( not ( = ?auto_19334 ?auto_19356 ) ) ( not ( = ?auto_19334 ?auto_19352 ) ) ( not ( = ?auto_19337 ?auto_19355 ) ) ( not ( = ?auto_19337 ?auto_19340 ) ) ( not ( = ?auto_19337 ?auto_19353 ) ) ( not ( = ?auto_19337 ?auto_19343 ) ) ( not ( = ?auto_19337 ?auto_19350 ) ) ( not ( = ?auto_19337 ?auto_19344 ) ) ( not ( = ?auto_19338 ?auto_19354 ) ) ( not ( = ?auto_19338 ?auto_19348 ) ) ( not ( = ?auto_19338 ?auto_19341 ) ) ( not ( = ?auto_19338 ?auto_19347 ) ) ( not ( = ?auto_19338 ?auto_19339 ) ) ( not ( = ?auto_19338 ?auto_19345 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_19325 ?auto_19326 ?auto_19327 ?auto_19328 ?auto_19329 ?auto_19330 ?auto_19331 )
      ( MAKE-1CRATE ?auto_19331 ?auto_19332 )
      ( MAKE-7CRATE-VERIFY ?auto_19325 ?auto_19326 ?auto_19327 ?auto_19328 ?auto_19329 ?auto_19330 ?auto_19331 ?auto_19332 ) )
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
      ?auto_19382 - SURFACE
      ?auto_19383 - SURFACE
      ?auto_19384 - SURFACE
    )
    :vars
    (
      ?auto_19389 - HOIST
      ?auto_19385 - PLACE
      ?auto_19388 - PLACE
      ?auto_19390 - HOIST
      ?auto_19387 - SURFACE
      ?auto_19394 - PLACE
      ?auto_19395 - HOIST
      ?auto_19407 - SURFACE
      ?auto_19411 - PLACE
      ?auto_19392 - HOIST
      ?auto_19396 - SURFACE
      ?auto_19398 - PLACE
      ?auto_19410 - HOIST
      ?auto_19399 - SURFACE
      ?auto_19401 - PLACE
      ?auto_19408 - HOIST
      ?auto_19409 - SURFACE
      ?auto_19403 - PLACE
      ?auto_19406 - HOIST
      ?auto_19397 - SURFACE
      ?auto_19391 - PLACE
      ?auto_19400 - HOIST
      ?auto_19393 - SURFACE
      ?auto_19402 - PLACE
      ?auto_19405 - HOIST
      ?auto_19404 - SURFACE
      ?auto_19386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19389 ?auto_19385 ) ( IS-CRATE ?auto_19384 ) ( not ( = ?auto_19388 ?auto_19385 ) ) ( HOIST-AT ?auto_19390 ?auto_19388 ) ( AVAILABLE ?auto_19390 ) ( SURFACE-AT ?auto_19384 ?auto_19388 ) ( ON ?auto_19384 ?auto_19387 ) ( CLEAR ?auto_19384 ) ( not ( = ?auto_19383 ?auto_19384 ) ) ( not ( = ?auto_19383 ?auto_19387 ) ) ( not ( = ?auto_19384 ?auto_19387 ) ) ( not ( = ?auto_19389 ?auto_19390 ) ) ( IS-CRATE ?auto_19383 ) ( not ( = ?auto_19394 ?auto_19385 ) ) ( HOIST-AT ?auto_19395 ?auto_19394 ) ( AVAILABLE ?auto_19395 ) ( SURFACE-AT ?auto_19383 ?auto_19394 ) ( ON ?auto_19383 ?auto_19407 ) ( CLEAR ?auto_19383 ) ( not ( = ?auto_19382 ?auto_19383 ) ) ( not ( = ?auto_19382 ?auto_19407 ) ) ( not ( = ?auto_19383 ?auto_19407 ) ) ( not ( = ?auto_19389 ?auto_19395 ) ) ( IS-CRATE ?auto_19382 ) ( not ( = ?auto_19411 ?auto_19385 ) ) ( HOIST-AT ?auto_19392 ?auto_19411 ) ( AVAILABLE ?auto_19392 ) ( SURFACE-AT ?auto_19382 ?auto_19411 ) ( ON ?auto_19382 ?auto_19396 ) ( CLEAR ?auto_19382 ) ( not ( = ?auto_19381 ?auto_19382 ) ) ( not ( = ?auto_19381 ?auto_19396 ) ) ( not ( = ?auto_19382 ?auto_19396 ) ) ( not ( = ?auto_19389 ?auto_19392 ) ) ( IS-CRATE ?auto_19381 ) ( not ( = ?auto_19398 ?auto_19385 ) ) ( HOIST-AT ?auto_19410 ?auto_19398 ) ( AVAILABLE ?auto_19410 ) ( SURFACE-AT ?auto_19381 ?auto_19398 ) ( ON ?auto_19381 ?auto_19399 ) ( CLEAR ?auto_19381 ) ( not ( = ?auto_19380 ?auto_19381 ) ) ( not ( = ?auto_19380 ?auto_19399 ) ) ( not ( = ?auto_19381 ?auto_19399 ) ) ( not ( = ?auto_19389 ?auto_19410 ) ) ( IS-CRATE ?auto_19380 ) ( not ( = ?auto_19401 ?auto_19385 ) ) ( HOIST-AT ?auto_19408 ?auto_19401 ) ( AVAILABLE ?auto_19408 ) ( SURFACE-AT ?auto_19380 ?auto_19401 ) ( ON ?auto_19380 ?auto_19409 ) ( CLEAR ?auto_19380 ) ( not ( = ?auto_19379 ?auto_19380 ) ) ( not ( = ?auto_19379 ?auto_19409 ) ) ( not ( = ?auto_19380 ?auto_19409 ) ) ( not ( = ?auto_19389 ?auto_19408 ) ) ( IS-CRATE ?auto_19379 ) ( not ( = ?auto_19403 ?auto_19385 ) ) ( HOIST-AT ?auto_19406 ?auto_19403 ) ( AVAILABLE ?auto_19406 ) ( SURFACE-AT ?auto_19379 ?auto_19403 ) ( ON ?auto_19379 ?auto_19397 ) ( CLEAR ?auto_19379 ) ( not ( = ?auto_19378 ?auto_19379 ) ) ( not ( = ?auto_19378 ?auto_19397 ) ) ( not ( = ?auto_19379 ?auto_19397 ) ) ( not ( = ?auto_19389 ?auto_19406 ) ) ( IS-CRATE ?auto_19378 ) ( not ( = ?auto_19391 ?auto_19385 ) ) ( HOIST-AT ?auto_19400 ?auto_19391 ) ( AVAILABLE ?auto_19400 ) ( SURFACE-AT ?auto_19378 ?auto_19391 ) ( ON ?auto_19378 ?auto_19393 ) ( CLEAR ?auto_19378 ) ( not ( = ?auto_19377 ?auto_19378 ) ) ( not ( = ?auto_19377 ?auto_19393 ) ) ( not ( = ?auto_19378 ?auto_19393 ) ) ( not ( = ?auto_19389 ?auto_19400 ) ) ( SURFACE-AT ?auto_19376 ?auto_19385 ) ( CLEAR ?auto_19376 ) ( IS-CRATE ?auto_19377 ) ( AVAILABLE ?auto_19389 ) ( not ( = ?auto_19402 ?auto_19385 ) ) ( HOIST-AT ?auto_19405 ?auto_19402 ) ( AVAILABLE ?auto_19405 ) ( SURFACE-AT ?auto_19377 ?auto_19402 ) ( ON ?auto_19377 ?auto_19404 ) ( CLEAR ?auto_19377 ) ( TRUCK-AT ?auto_19386 ?auto_19385 ) ( not ( = ?auto_19376 ?auto_19377 ) ) ( not ( = ?auto_19376 ?auto_19404 ) ) ( not ( = ?auto_19377 ?auto_19404 ) ) ( not ( = ?auto_19389 ?auto_19405 ) ) ( not ( = ?auto_19376 ?auto_19378 ) ) ( not ( = ?auto_19376 ?auto_19393 ) ) ( not ( = ?auto_19378 ?auto_19404 ) ) ( not ( = ?auto_19391 ?auto_19402 ) ) ( not ( = ?auto_19400 ?auto_19405 ) ) ( not ( = ?auto_19393 ?auto_19404 ) ) ( not ( = ?auto_19376 ?auto_19379 ) ) ( not ( = ?auto_19376 ?auto_19397 ) ) ( not ( = ?auto_19377 ?auto_19379 ) ) ( not ( = ?auto_19377 ?auto_19397 ) ) ( not ( = ?auto_19379 ?auto_19393 ) ) ( not ( = ?auto_19379 ?auto_19404 ) ) ( not ( = ?auto_19403 ?auto_19391 ) ) ( not ( = ?auto_19403 ?auto_19402 ) ) ( not ( = ?auto_19406 ?auto_19400 ) ) ( not ( = ?auto_19406 ?auto_19405 ) ) ( not ( = ?auto_19397 ?auto_19393 ) ) ( not ( = ?auto_19397 ?auto_19404 ) ) ( not ( = ?auto_19376 ?auto_19380 ) ) ( not ( = ?auto_19376 ?auto_19409 ) ) ( not ( = ?auto_19377 ?auto_19380 ) ) ( not ( = ?auto_19377 ?auto_19409 ) ) ( not ( = ?auto_19378 ?auto_19380 ) ) ( not ( = ?auto_19378 ?auto_19409 ) ) ( not ( = ?auto_19380 ?auto_19397 ) ) ( not ( = ?auto_19380 ?auto_19393 ) ) ( not ( = ?auto_19380 ?auto_19404 ) ) ( not ( = ?auto_19401 ?auto_19403 ) ) ( not ( = ?auto_19401 ?auto_19391 ) ) ( not ( = ?auto_19401 ?auto_19402 ) ) ( not ( = ?auto_19408 ?auto_19406 ) ) ( not ( = ?auto_19408 ?auto_19400 ) ) ( not ( = ?auto_19408 ?auto_19405 ) ) ( not ( = ?auto_19409 ?auto_19397 ) ) ( not ( = ?auto_19409 ?auto_19393 ) ) ( not ( = ?auto_19409 ?auto_19404 ) ) ( not ( = ?auto_19376 ?auto_19381 ) ) ( not ( = ?auto_19376 ?auto_19399 ) ) ( not ( = ?auto_19377 ?auto_19381 ) ) ( not ( = ?auto_19377 ?auto_19399 ) ) ( not ( = ?auto_19378 ?auto_19381 ) ) ( not ( = ?auto_19378 ?auto_19399 ) ) ( not ( = ?auto_19379 ?auto_19381 ) ) ( not ( = ?auto_19379 ?auto_19399 ) ) ( not ( = ?auto_19381 ?auto_19409 ) ) ( not ( = ?auto_19381 ?auto_19397 ) ) ( not ( = ?auto_19381 ?auto_19393 ) ) ( not ( = ?auto_19381 ?auto_19404 ) ) ( not ( = ?auto_19398 ?auto_19401 ) ) ( not ( = ?auto_19398 ?auto_19403 ) ) ( not ( = ?auto_19398 ?auto_19391 ) ) ( not ( = ?auto_19398 ?auto_19402 ) ) ( not ( = ?auto_19410 ?auto_19408 ) ) ( not ( = ?auto_19410 ?auto_19406 ) ) ( not ( = ?auto_19410 ?auto_19400 ) ) ( not ( = ?auto_19410 ?auto_19405 ) ) ( not ( = ?auto_19399 ?auto_19409 ) ) ( not ( = ?auto_19399 ?auto_19397 ) ) ( not ( = ?auto_19399 ?auto_19393 ) ) ( not ( = ?auto_19399 ?auto_19404 ) ) ( not ( = ?auto_19376 ?auto_19382 ) ) ( not ( = ?auto_19376 ?auto_19396 ) ) ( not ( = ?auto_19377 ?auto_19382 ) ) ( not ( = ?auto_19377 ?auto_19396 ) ) ( not ( = ?auto_19378 ?auto_19382 ) ) ( not ( = ?auto_19378 ?auto_19396 ) ) ( not ( = ?auto_19379 ?auto_19382 ) ) ( not ( = ?auto_19379 ?auto_19396 ) ) ( not ( = ?auto_19380 ?auto_19382 ) ) ( not ( = ?auto_19380 ?auto_19396 ) ) ( not ( = ?auto_19382 ?auto_19399 ) ) ( not ( = ?auto_19382 ?auto_19409 ) ) ( not ( = ?auto_19382 ?auto_19397 ) ) ( not ( = ?auto_19382 ?auto_19393 ) ) ( not ( = ?auto_19382 ?auto_19404 ) ) ( not ( = ?auto_19411 ?auto_19398 ) ) ( not ( = ?auto_19411 ?auto_19401 ) ) ( not ( = ?auto_19411 ?auto_19403 ) ) ( not ( = ?auto_19411 ?auto_19391 ) ) ( not ( = ?auto_19411 ?auto_19402 ) ) ( not ( = ?auto_19392 ?auto_19410 ) ) ( not ( = ?auto_19392 ?auto_19408 ) ) ( not ( = ?auto_19392 ?auto_19406 ) ) ( not ( = ?auto_19392 ?auto_19400 ) ) ( not ( = ?auto_19392 ?auto_19405 ) ) ( not ( = ?auto_19396 ?auto_19399 ) ) ( not ( = ?auto_19396 ?auto_19409 ) ) ( not ( = ?auto_19396 ?auto_19397 ) ) ( not ( = ?auto_19396 ?auto_19393 ) ) ( not ( = ?auto_19396 ?auto_19404 ) ) ( not ( = ?auto_19376 ?auto_19383 ) ) ( not ( = ?auto_19376 ?auto_19407 ) ) ( not ( = ?auto_19377 ?auto_19383 ) ) ( not ( = ?auto_19377 ?auto_19407 ) ) ( not ( = ?auto_19378 ?auto_19383 ) ) ( not ( = ?auto_19378 ?auto_19407 ) ) ( not ( = ?auto_19379 ?auto_19383 ) ) ( not ( = ?auto_19379 ?auto_19407 ) ) ( not ( = ?auto_19380 ?auto_19383 ) ) ( not ( = ?auto_19380 ?auto_19407 ) ) ( not ( = ?auto_19381 ?auto_19383 ) ) ( not ( = ?auto_19381 ?auto_19407 ) ) ( not ( = ?auto_19383 ?auto_19396 ) ) ( not ( = ?auto_19383 ?auto_19399 ) ) ( not ( = ?auto_19383 ?auto_19409 ) ) ( not ( = ?auto_19383 ?auto_19397 ) ) ( not ( = ?auto_19383 ?auto_19393 ) ) ( not ( = ?auto_19383 ?auto_19404 ) ) ( not ( = ?auto_19394 ?auto_19411 ) ) ( not ( = ?auto_19394 ?auto_19398 ) ) ( not ( = ?auto_19394 ?auto_19401 ) ) ( not ( = ?auto_19394 ?auto_19403 ) ) ( not ( = ?auto_19394 ?auto_19391 ) ) ( not ( = ?auto_19394 ?auto_19402 ) ) ( not ( = ?auto_19395 ?auto_19392 ) ) ( not ( = ?auto_19395 ?auto_19410 ) ) ( not ( = ?auto_19395 ?auto_19408 ) ) ( not ( = ?auto_19395 ?auto_19406 ) ) ( not ( = ?auto_19395 ?auto_19400 ) ) ( not ( = ?auto_19395 ?auto_19405 ) ) ( not ( = ?auto_19407 ?auto_19396 ) ) ( not ( = ?auto_19407 ?auto_19399 ) ) ( not ( = ?auto_19407 ?auto_19409 ) ) ( not ( = ?auto_19407 ?auto_19397 ) ) ( not ( = ?auto_19407 ?auto_19393 ) ) ( not ( = ?auto_19407 ?auto_19404 ) ) ( not ( = ?auto_19376 ?auto_19384 ) ) ( not ( = ?auto_19376 ?auto_19387 ) ) ( not ( = ?auto_19377 ?auto_19384 ) ) ( not ( = ?auto_19377 ?auto_19387 ) ) ( not ( = ?auto_19378 ?auto_19384 ) ) ( not ( = ?auto_19378 ?auto_19387 ) ) ( not ( = ?auto_19379 ?auto_19384 ) ) ( not ( = ?auto_19379 ?auto_19387 ) ) ( not ( = ?auto_19380 ?auto_19384 ) ) ( not ( = ?auto_19380 ?auto_19387 ) ) ( not ( = ?auto_19381 ?auto_19384 ) ) ( not ( = ?auto_19381 ?auto_19387 ) ) ( not ( = ?auto_19382 ?auto_19384 ) ) ( not ( = ?auto_19382 ?auto_19387 ) ) ( not ( = ?auto_19384 ?auto_19407 ) ) ( not ( = ?auto_19384 ?auto_19396 ) ) ( not ( = ?auto_19384 ?auto_19399 ) ) ( not ( = ?auto_19384 ?auto_19409 ) ) ( not ( = ?auto_19384 ?auto_19397 ) ) ( not ( = ?auto_19384 ?auto_19393 ) ) ( not ( = ?auto_19384 ?auto_19404 ) ) ( not ( = ?auto_19388 ?auto_19394 ) ) ( not ( = ?auto_19388 ?auto_19411 ) ) ( not ( = ?auto_19388 ?auto_19398 ) ) ( not ( = ?auto_19388 ?auto_19401 ) ) ( not ( = ?auto_19388 ?auto_19403 ) ) ( not ( = ?auto_19388 ?auto_19391 ) ) ( not ( = ?auto_19388 ?auto_19402 ) ) ( not ( = ?auto_19390 ?auto_19395 ) ) ( not ( = ?auto_19390 ?auto_19392 ) ) ( not ( = ?auto_19390 ?auto_19410 ) ) ( not ( = ?auto_19390 ?auto_19408 ) ) ( not ( = ?auto_19390 ?auto_19406 ) ) ( not ( = ?auto_19390 ?auto_19400 ) ) ( not ( = ?auto_19390 ?auto_19405 ) ) ( not ( = ?auto_19387 ?auto_19407 ) ) ( not ( = ?auto_19387 ?auto_19396 ) ) ( not ( = ?auto_19387 ?auto_19399 ) ) ( not ( = ?auto_19387 ?auto_19409 ) ) ( not ( = ?auto_19387 ?auto_19397 ) ) ( not ( = ?auto_19387 ?auto_19393 ) ) ( not ( = ?auto_19387 ?auto_19404 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_19376 ?auto_19377 ?auto_19378 ?auto_19379 ?auto_19380 ?auto_19381 ?auto_19382 ?auto_19383 )
      ( MAKE-1CRATE ?auto_19383 ?auto_19384 )
      ( MAKE-8CRATE-VERIFY ?auto_19376 ?auto_19377 ?auto_19378 ?auto_19379 ?auto_19380 ?auto_19381 ?auto_19382 ?auto_19383 ?auto_19384 ) )
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
      ?auto_19438 - SURFACE
      ?auto_19439 - SURFACE
      ?auto_19440 - SURFACE
      ?auto_19441 - SURFACE
    )
    :vars
    (
      ?auto_19446 - HOIST
      ?auto_19443 - PLACE
      ?auto_19442 - PLACE
      ?auto_19444 - HOIST
      ?auto_19445 - SURFACE
      ?auto_19463 - SURFACE
      ?auto_19468 - PLACE
      ?auto_19457 - HOIST
      ?auto_19458 - SURFACE
      ?auto_19469 - PLACE
      ?auto_19464 - HOIST
      ?auto_19456 - SURFACE
      ?auto_19454 - PLACE
      ?auto_19462 - HOIST
      ?auto_19448 - SURFACE
      ?auto_19449 - PLACE
      ?auto_19460 - HOIST
      ?auto_19459 - SURFACE
      ?auto_19452 - PLACE
      ?auto_19461 - HOIST
      ?auto_19455 - SURFACE
      ?auto_19466 - PLACE
      ?auto_19450 - HOIST
      ?auto_19465 - SURFACE
      ?auto_19451 - PLACE
      ?auto_19467 - HOIST
      ?auto_19453 - SURFACE
      ?auto_19447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19446 ?auto_19443 ) ( IS-CRATE ?auto_19441 ) ( not ( = ?auto_19442 ?auto_19443 ) ) ( HOIST-AT ?auto_19444 ?auto_19442 ) ( SURFACE-AT ?auto_19441 ?auto_19442 ) ( ON ?auto_19441 ?auto_19445 ) ( CLEAR ?auto_19441 ) ( not ( = ?auto_19440 ?auto_19441 ) ) ( not ( = ?auto_19440 ?auto_19445 ) ) ( not ( = ?auto_19441 ?auto_19445 ) ) ( not ( = ?auto_19446 ?auto_19444 ) ) ( IS-CRATE ?auto_19440 ) ( AVAILABLE ?auto_19444 ) ( SURFACE-AT ?auto_19440 ?auto_19442 ) ( ON ?auto_19440 ?auto_19463 ) ( CLEAR ?auto_19440 ) ( not ( = ?auto_19439 ?auto_19440 ) ) ( not ( = ?auto_19439 ?auto_19463 ) ) ( not ( = ?auto_19440 ?auto_19463 ) ) ( IS-CRATE ?auto_19439 ) ( not ( = ?auto_19468 ?auto_19443 ) ) ( HOIST-AT ?auto_19457 ?auto_19468 ) ( AVAILABLE ?auto_19457 ) ( SURFACE-AT ?auto_19439 ?auto_19468 ) ( ON ?auto_19439 ?auto_19458 ) ( CLEAR ?auto_19439 ) ( not ( = ?auto_19438 ?auto_19439 ) ) ( not ( = ?auto_19438 ?auto_19458 ) ) ( not ( = ?auto_19439 ?auto_19458 ) ) ( not ( = ?auto_19446 ?auto_19457 ) ) ( IS-CRATE ?auto_19438 ) ( not ( = ?auto_19469 ?auto_19443 ) ) ( HOIST-AT ?auto_19464 ?auto_19469 ) ( AVAILABLE ?auto_19464 ) ( SURFACE-AT ?auto_19438 ?auto_19469 ) ( ON ?auto_19438 ?auto_19456 ) ( CLEAR ?auto_19438 ) ( not ( = ?auto_19437 ?auto_19438 ) ) ( not ( = ?auto_19437 ?auto_19456 ) ) ( not ( = ?auto_19438 ?auto_19456 ) ) ( not ( = ?auto_19446 ?auto_19464 ) ) ( IS-CRATE ?auto_19437 ) ( not ( = ?auto_19454 ?auto_19443 ) ) ( HOIST-AT ?auto_19462 ?auto_19454 ) ( AVAILABLE ?auto_19462 ) ( SURFACE-AT ?auto_19437 ?auto_19454 ) ( ON ?auto_19437 ?auto_19448 ) ( CLEAR ?auto_19437 ) ( not ( = ?auto_19436 ?auto_19437 ) ) ( not ( = ?auto_19436 ?auto_19448 ) ) ( not ( = ?auto_19437 ?auto_19448 ) ) ( not ( = ?auto_19446 ?auto_19462 ) ) ( IS-CRATE ?auto_19436 ) ( not ( = ?auto_19449 ?auto_19443 ) ) ( HOIST-AT ?auto_19460 ?auto_19449 ) ( AVAILABLE ?auto_19460 ) ( SURFACE-AT ?auto_19436 ?auto_19449 ) ( ON ?auto_19436 ?auto_19459 ) ( CLEAR ?auto_19436 ) ( not ( = ?auto_19435 ?auto_19436 ) ) ( not ( = ?auto_19435 ?auto_19459 ) ) ( not ( = ?auto_19436 ?auto_19459 ) ) ( not ( = ?auto_19446 ?auto_19460 ) ) ( IS-CRATE ?auto_19435 ) ( not ( = ?auto_19452 ?auto_19443 ) ) ( HOIST-AT ?auto_19461 ?auto_19452 ) ( AVAILABLE ?auto_19461 ) ( SURFACE-AT ?auto_19435 ?auto_19452 ) ( ON ?auto_19435 ?auto_19455 ) ( CLEAR ?auto_19435 ) ( not ( = ?auto_19434 ?auto_19435 ) ) ( not ( = ?auto_19434 ?auto_19455 ) ) ( not ( = ?auto_19435 ?auto_19455 ) ) ( not ( = ?auto_19446 ?auto_19461 ) ) ( IS-CRATE ?auto_19434 ) ( not ( = ?auto_19466 ?auto_19443 ) ) ( HOIST-AT ?auto_19450 ?auto_19466 ) ( AVAILABLE ?auto_19450 ) ( SURFACE-AT ?auto_19434 ?auto_19466 ) ( ON ?auto_19434 ?auto_19465 ) ( CLEAR ?auto_19434 ) ( not ( = ?auto_19433 ?auto_19434 ) ) ( not ( = ?auto_19433 ?auto_19465 ) ) ( not ( = ?auto_19434 ?auto_19465 ) ) ( not ( = ?auto_19446 ?auto_19450 ) ) ( SURFACE-AT ?auto_19432 ?auto_19443 ) ( CLEAR ?auto_19432 ) ( IS-CRATE ?auto_19433 ) ( AVAILABLE ?auto_19446 ) ( not ( = ?auto_19451 ?auto_19443 ) ) ( HOIST-AT ?auto_19467 ?auto_19451 ) ( AVAILABLE ?auto_19467 ) ( SURFACE-AT ?auto_19433 ?auto_19451 ) ( ON ?auto_19433 ?auto_19453 ) ( CLEAR ?auto_19433 ) ( TRUCK-AT ?auto_19447 ?auto_19443 ) ( not ( = ?auto_19432 ?auto_19433 ) ) ( not ( = ?auto_19432 ?auto_19453 ) ) ( not ( = ?auto_19433 ?auto_19453 ) ) ( not ( = ?auto_19446 ?auto_19467 ) ) ( not ( = ?auto_19432 ?auto_19434 ) ) ( not ( = ?auto_19432 ?auto_19465 ) ) ( not ( = ?auto_19434 ?auto_19453 ) ) ( not ( = ?auto_19466 ?auto_19451 ) ) ( not ( = ?auto_19450 ?auto_19467 ) ) ( not ( = ?auto_19465 ?auto_19453 ) ) ( not ( = ?auto_19432 ?auto_19435 ) ) ( not ( = ?auto_19432 ?auto_19455 ) ) ( not ( = ?auto_19433 ?auto_19435 ) ) ( not ( = ?auto_19433 ?auto_19455 ) ) ( not ( = ?auto_19435 ?auto_19465 ) ) ( not ( = ?auto_19435 ?auto_19453 ) ) ( not ( = ?auto_19452 ?auto_19466 ) ) ( not ( = ?auto_19452 ?auto_19451 ) ) ( not ( = ?auto_19461 ?auto_19450 ) ) ( not ( = ?auto_19461 ?auto_19467 ) ) ( not ( = ?auto_19455 ?auto_19465 ) ) ( not ( = ?auto_19455 ?auto_19453 ) ) ( not ( = ?auto_19432 ?auto_19436 ) ) ( not ( = ?auto_19432 ?auto_19459 ) ) ( not ( = ?auto_19433 ?auto_19436 ) ) ( not ( = ?auto_19433 ?auto_19459 ) ) ( not ( = ?auto_19434 ?auto_19436 ) ) ( not ( = ?auto_19434 ?auto_19459 ) ) ( not ( = ?auto_19436 ?auto_19455 ) ) ( not ( = ?auto_19436 ?auto_19465 ) ) ( not ( = ?auto_19436 ?auto_19453 ) ) ( not ( = ?auto_19449 ?auto_19452 ) ) ( not ( = ?auto_19449 ?auto_19466 ) ) ( not ( = ?auto_19449 ?auto_19451 ) ) ( not ( = ?auto_19460 ?auto_19461 ) ) ( not ( = ?auto_19460 ?auto_19450 ) ) ( not ( = ?auto_19460 ?auto_19467 ) ) ( not ( = ?auto_19459 ?auto_19455 ) ) ( not ( = ?auto_19459 ?auto_19465 ) ) ( not ( = ?auto_19459 ?auto_19453 ) ) ( not ( = ?auto_19432 ?auto_19437 ) ) ( not ( = ?auto_19432 ?auto_19448 ) ) ( not ( = ?auto_19433 ?auto_19437 ) ) ( not ( = ?auto_19433 ?auto_19448 ) ) ( not ( = ?auto_19434 ?auto_19437 ) ) ( not ( = ?auto_19434 ?auto_19448 ) ) ( not ( = ?auto_19435 ?auto_19437 ) ) ( not ( = ?auto_19435 ?auto_19448 ) ) ( not ( = ?auto_19437 ?auto_19459 ) ) ( not ( = ?auto_19437 ?auto_19455 ) ) ( not ( = ?auto_19437 ?auto_19465 ) ) ( not ( = ?auto_19437 ?auto_19453 ) ) ( not ( = ?auto_19454 ?auto_19449 ) ) ( not ( = ?auto_19454 ?auto_19452 ) ) ( not ( = ?auto_19454 ?auto_19466 ) ) ( not ( = ?auto_19454 ?auto_19451 ) ) ( not ( = ?auto_19462 ?auto_19460 ) ) ( not ( = ?auto_19462 ?auto_19461 ) ) ( not ( = ?auto_19462 ?auto_19450 ) ) ( not ( = ?auto_19462 ?auto_19467 ) ) ( not ( = ?auto_19448 ?auto_19459 ) ) ( not ( = ?auto_19448 ?auto_19455 ) ) ( not ( = ?auto_19448 ?auto_19465 ) ) ( not ( = ?auto_19448 ?auto_19453 ) ) ( not ( = ?auto_19432 ?auto_19438 ) ) ( not ( = ?auto_19432 ?auto_19456 ) ) ( not ( = ?auto_19433 ?auto_19438 ) ) ( not ( = ?auto_19433 ?auto_19456 ) ) ( not ( = ?auto_19434 ?auto_19438 ) ) ( not ( = ?auto_19434 ?auto_19456 ) ) ( not ( = ?auto_19435 ?auto_19438 ) ) ( not ( = ?auto_19435 ?auto_19456 ) ) ( not ( = ?auto_19436 ?auto_19438 ) ) ( not ( = ?auto_19436 ?auto_19456 ) ) ( not ( = ?auto_19438 ?auto_19448 ) ) ( not ( = ?auto_19438 ?auto_19459 ) ) ( not ( = ?auto_19438 ?auto_19455 ) ) ( not ( = ?auto_19438 ?auto_19465 ) ) ( not ( = ?auto_19438 ?auto_19453 ) ) ( not ( = ?auto_19469 ?auto_19454 ) ) ( not ( = ?auto_19469 ?auto_19449 ) ) ( not ( = ?auto_19469 ?auto_19452 ) ) ( not ( = ?auto_19469 ?auto_19466 ) ) ( not ( = ?auto_19469 ?auto_19451 ) ) ( not ( = ?auto_19464 ?auto_19462 ) ) ( not ( = ?auto_19464 ?auto_19460 ) ) ( not ( = ?auto_19464 ?auto_19461 ) ) ( not ( = ?auto_19464 ?auto_19450 ) ) ( not ( = ?auto_19464 ?auto_19467 ) ) ( not ( = ?auto_19456 ?auto_19448 ) ) ( not ( = ?auto_19456 ?auto_19459 ) ) ( not ( = ?auto_19456 ?auto_19455 ) ) ( not ( = ?auto_19456 ?auto_19465 ) ) ( not ( = ?auto_19456 ?auto_19453 ) ) ( not ( = ?auto_19432 ?auto_19439 ) ) ( not ( = ?auto_19432 ?auto_19458 ) ) ( not ( = ?auto_19433 ?auto_19439 ) ) ( not ( = ?auto_19433 ?auto_19458 ) ) ( not ( = ?auto_19434 ?auto_19439 ) ) ( not ( = ?auto_19434 ?auto_19458 ) ) ( not ( = ?auto_19435 ?auto_19439 ) ) ( not ( = ?auto_19435 ?auto_19458 ) ) ( not ( = ?auto_19436 ?auto_19439 ) ) ( not ( = ?auto_19436 ?auto_19458 ) ) ( not ( = ?auto_19437 ?auto_19439 ) ) ( not ( = ?auto_19437 ?auto_19458 ) ) ( not ( = ?auto_19439 ?auto_19456 ) ) ( not ( = ?auto_19439 ?auto_19448 ) ) ( not ( = ?auto_19439 ?auto_19459 ) ) ( not ( = ?auto_19439 ?auto_19455 ) ) ( not ( = ?auto_19439 ?auto_19465 ) ) ( not ( = ?auto_19439 ?auto_19453 ) ) ( not ( = ?auto_19468 ?auto_19469 ) ) ( not ( = ?auto_19468 ?auto_19454 ) ) ( not ( = ?auto_19468 ?auto_19449 ) ) ( not ( = ?auto_19468 ?auto_19452 ) ) ( not ( = ?auto_19468 ?auto_19466 ) ) ( not ( = ?auto_19468 ?auto_19451 ) ) ( not ( = ?auto_19457 ?auto_19464 ) ) ( not ( = ?auto_19457 ?auto_19462 ) ) ( not ( = ?auto_19457 ?auto_19460 ) ) ( not ( = ?auto_19457 ?auto_19461 ) ) ( not ( = ?auto_19457 ?auto_19450 ) ) ( not ( = ?auto_19457 ?auto_19467 ) ) ( not ( = ?auto_19458 ?auto_19456 ) ) ( not ( = ?auto_19458 ?auto_19448 ) ) ( not ( = ?auto_19458 ?auto_19459 ) ) ( not ( = ?auto_19458 ?auto_19455 ) ) ( not ( = ?auto_19458 ?auto_19465 ) ) ( not ( = ?auto_19458 ?auto_19453 ) ) ( not ( = ?auto_19432 ?auto_19440 ) ) ( not ( = ?auto_19432 ?auto_19463 ) ) ( not ( = ?auto_19433 ?auto_19440 ) ) ( not ( = ?auto_19433 ?auto_19463 ) ) ( not ( = ?auto_19434 ?auto_19440 ) ) ( not ( = ?auto_19434 ?auto_19463 ) ) ( not ( = ?auto_19435 ?auto_19440 ) ) ( not ( = ?auto_19435 ?auto_19463 ) ) ( not ( = ?auto_19436 ?auto_19440 ) ) ( not ( = ?auto_19436 ?auto_19463 ) ) ( not ( = ?auto_19437 ?auto_19440 ) ) ( not ( = ?auto_19437 ?auto_19463 ) ) ( not ( = ?auto_19438 ?auto_19440 ) ) ( not ( = ?auto_19438 ?auto_19463 ) ) ( not ( = ?auto_19440 ?auto_19458 ) ) ( not ( = ?auto_19440 ?auto_19456 ) ) ( not ( = ?auto_19440 ?auto_19448 ) ) ( not ( = ?auto_19440 ?auto_19459 ) ) ( not ( = ?auto_19440 ?auto_19455 ) ) ( not ( = ?auto_19440 ?auto_19465 ) ) ( not ( = ?auto_19440 ?auto_19453 ) ) ( not ( = ?auto_19442 ?auto_19468 ) ) ( not ( = ?auto_19442 ?auto_19469 ) ) ( not ( = ?auto_19442 ?auto_19454 ) ) ( not ( = ?auto_19442 ?auto_19449 ) ) ( not ( = ?auto_19442 ?auto_19452 ) ) ( not ( = ?auto_19442 ?auto_19466 ) ) ( not ( = ?auto_19442 ?auto_19451 ) ) ( not ( = ?auto_19444 ?auto_19457 ) ) ( not ( = ?auto_19444 ?auto_19464 ) ) ( not ( = ?auto_19444 ?auto_19462 ) ) ( not ( = ?auto_19444 ?auto_19460 ) ) ( not ( = ?auto_19444 ?auto_19461 ) ) ( not ( = ?auto_19444 ?auto_19450 ) ) ( not ( = ?auto_19444 ?auto_19467 ) ) ( not ( = ?auto_19463 ?auto_19458 ) ) ( not ( = ?auto_19463 ?auto_19456 ) ) ( not ( = ?auto_19463 ?auto_19448 ) ) ( not ( = ?auto_19463 ?auto_19459 ) ) ( not ( = ?auto_19463 ?auto_19455 ) ) ( not ( = ?auto_19463 ?auto_19465 ) ) ( not ( = ?auto_19463 ?auto_19453 ) ) ( not ( = ?auto_19432 ?auto_19441 ) ) ( not ( = ?auto_19432 ?auto_19445 ) ) ( not ( = ?auto_19433 ?auto_19441 ) ) ( not ( = ?auto_19433 ?auto_19445 ) ) ( not ( = ?auto_19434 ?auto_19441 ) ) ( not ( = ?auto_19434 ?auto_19445 ) ) ( not ( = ?auto_19435 ?auto_19441 ) ) ( not ( = ?auto_19435 ?auto_19445 ) ) ( not ( = ?auto_19436 ?auto_19441 ) ) ( not ( = ?auto_19436 ?auto_19445 ) ) ( not ( = ?auto_19437 ?auto_19441 ) ) ( not ( = ?auto_19437 ?auto_19445 ) ) ( not ( = ?auto_19438 ?auto_19441 ) ) ( not ( = ?auto_19438 ?auto_19445 ) ) ( not ( = ?auto_19439 ?auto_19441 ) ) ( not ( = ?auto_19439 ?auto_19445 ) ) ( not ( = ?auto_19441 ?auto_19463 ) ) ( not ( = ?auto_19441 ?auto_19458 ) ) ( not ( = ?auto_19441 ?auto_19456 ) ) ( not ( = ?auto_19441 ?auto_19448 ) ) ( not ( = ?auto_19441 ?auto_19459 ) ) ( not ( = ?auto_19441 ?auto_19455 ) ) ( not ( = ?auto_19441 ?auto_19465 ) ) ( not ( = ?auto_19441 ?auto_19453 ) ) ( not ( = ?auto_19445 ?auto_19463 ) ) ( not ( = ?auto_19445 ?auto_19458 ) ) ( not ( = ?auto_19445 ?auto_19456 ) ) ( not ( = ?auto_19445 ?auto_19448 ) ) ( not ( = ?auto_19445 ?auto_19459 ) ) ( not ( = ?auto_19445 ?auto_19455 ) ) ( not ( = ?auto_19445 ?auto_19465 ) ) ( not ( = ?auto_19445 ?auto_19453 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_19432 ?auto_19433 ?auto_19434 ?auto_19435 ?auto_19436 ?auto_19437 ?auto_19438 ?auto_19439 ?auto_19440 )
      ( MAKE-1CRATE ?auto_19440 ?auto_19441 )
      ( MAKE-9CRATE-VERIFY ?auto_19432 ?auto_19433 ?auto_19434 ?auto_19435 ?auto_19436 ?auto_19437 ?auto_19438 ?auto_19439 ?auto_19440 ?auto_19441 ) )
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
      ?auto_19497 - SURFACE
      ?auto_19498 - SURFACE
      ?auto_19499 - SURFACE
      ?auto_19500 - SURFACE
      ?auto_19501 - SURFACE
    )
    :vars
    (
      ?auto_19507 - HOIST
      ?auto_19503 - PLACE
      ?auto_19506 - PLACE
      ?auto_19504 - HOIST
      ?auto_19502 - SURFACE
      ?auto_19522 - PLACE
      ?auto_19523 - HOIST
      ?auto_19524 - SURFACE
      ?auto_19530 - SURFACE
      ?auto_19511 - PLACE
      ?auto_19520 - HOIST
      ?auto_19509 - SURFACE
      ?auto_19521 - PLACE
      ?auto_19508 - HOIST
      ?auto_19518 - SURFACE
      ?auto_19528 - PLACE
      ?auto_19532 - HOIST
      ?auto_19531 - SURFACE
      ?auto_19517 - PLACE
      ?auto_19525 - HOIST
      ?auto_19519 - SURFACE
      ?auto_19514 - PLACE
      ?auto_19526 - HOIST
      ?auto_19527 - SURFACE
      ?auto_19516 - PLACE
      ?auto_19513 - HOIST
      ?auto_19515 - SURFACE
      ?auto_19510 - PLACE
      ?auto_19512 - HOIST
      ?auto_19529 - SURFACE
      ?auto_19505 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19507 ?auto_19503 ) ( IS-CRATE ?auto_19501 ) ( not ( = ?auto_19506 ?auto_19503 ) ) ( HOIST-AT ?auto_19504 ?auto_19506 ) ( AVAILABLE ?auto_19504 ) ( SURFACE-AT ?auto_19501 ?auto_19506 ) ( ON ?auto_19501 ?auto_19502 ) ( CLEAR ?auto_19501 ) ( not ( = ?auto_19500 ?auto_19501 ) ) ( not ( = ?auto_19500 ?auto_19502 ) ) ( not ( = ?auto_19501 ?auto_19502 ) ) ( not ( = ?auto_19507 ?auto_19504 ) ) ( IS-CRATE ?auto_19500 ) ( not ( = ?auto_19522 ?auto_19503 ) ) ( HOIST-AT ?auto_19523 ?auto_19522 ) ( SURFACE-AT ?auto_19500 ?auto_19522 ) ( ON ?auto_19500 ?auto_19524 ) ( CLEAR ?auto_19500 ) ( not ( = ?auto_19499 ?auto_19500 ) ) ( not ( = ?auto_19499 ?auto_19524 ) ) ( not ( = ?auto_19500 ?auto_19524 ) ) ( not ( = ?auto_19507 ?auto_19523 ) ) ( IS-CRATE ?auto_19499 ) ( AVAILABLE ?auto_19523 ) ( SURFACE-AT ?auto_19499 ?auto_19522 ) ( ON ?auto_19499 ?auto_19530 ) ( CLEAR ?auto_19499 ) ( not ( = ?auto_19498 ?auto_19499 ) ) ( not ( = ?auto_19498 ?auto_19530 ) ) ( not ( = ?auto_19499 ?auto_19530 ) ) ( IS-CRATE ?auto_19498 ) ( not ( = ?auto_19511 ?auto_19503 ) ) ( HOIST-AT ?auto_19520 ?auto_19511 ) ( AVAILABLE ?auto_19520 ) ( SURFACE-AT ?auto_19498 ?auto_19511 ) ( ON ?auto_19498 ?auto_19509 ) ( CLEAR ?auto_19498 ) ( not ( = ?auto_19497 ?auto_19498 ) ) ( not ( = ?auto_19497 ?auto_19509 ) ) ( not ( = ?auto_19498 ?auto_19509 ) ) ( not ( = ?auto_19507 ?auto_19520 ) ) ( IS-CRATE ?auto_19497 ) ( not ( = ?auto_19521 ?auto_19503 ) ) ( HOIST-AT ?auto_19508 ?auto_19521 ) ( AVAILABLE ?auto_19508 ) ( SURFACE-AT ?auto_19497 ?auto_19521 ) ( ON ?auto_19497 ?auto_19518 ) ( CLEAR ?auto_19497 ) ( not ( = ?auto_19496 ?auto_19497 ) ) ( not ( = ?auto_19496 ?auto_19518 ) ) ( not ( = ?auto_19497 ?auto_19518 ) ) ( not ( = ?auto_19507 ?auto_19508 ) ) ( IS-CRATE ?auto_19496 ) ( not ( = ?auto_19528 ?auto_19503 ) ) ( HOIST-AT ?auto_19532 ?auto_19528 ) ( AVAILABLE ?auto_19532 ) ( SURFACE-AT ?auto_19496 ?auto_19528 ) ( ON ?auto_19496 ?auto_19531 ) ( CLEAR ?auto_19496 ) ( not ( = ?auto_19495 ?auto_19496 ) ) ( not ( = ?auto_19495 ?auto_19531 ) ) ( not ( = ?auto_19496 ?auto_19531 ) ) ( not ( = ?auto_19507 ?auto_19532 ) ) ( IS-CRATE ?auto_19495 ) ( not ( = ?auto_19517 ?auto_19503 ) ) ( HOIST-AT ?auto_19525 ?auto_19517 ) ( AVAILABLE ?auto_19525 ) ( SURFACE-AT ?auto_19495 ?auto_19517 ) ( ON ?auto_19495 ?auto_19519 ) ( CLEAR ?auto_19495 ) ( not ( = ?auto_19494 ?auto_19495 ) ) ( not ( = ?auto_19494 ?auto_19519 ) ) ( not ( = ?auto_19495 ?auto_19519 ) ) ( not ( = ?auto_19507 ?auto_19525 ) ) ( IS-CRATE ?auto_19494 ) ( not ( = ?auto_19514 ?auto_19503 ) ) ( HOIST-AT ?auto_19526 ?auto_19514 ) ( AVAILABLE ?auto_19526 ) ( SURFACE-AT ?auto_19494 ?auto_19514 ) ( ON ?auto_19494 ?auto_19527 ) ( CLEAR ?auto_19494 ) ( not ( = ?auto_19493 ?auto_19494 ) ) ( not ( = ?auto_19493 ?auto_19527 ) ) ( not ( = ?auto_19494 ?auto_19527 ) ) ( not ( = ?auto_19507 ?auto_19526 ) ) ( IS-CRATE ?auto_19493 ) ( not ( = ?auto_19516 ?auto_19503 ) ) ( HOIST-AT ?auto_19513 ?auto_19516 ) ( AVAILABLE ?auto_19513 ) ( SURFACE-AT ?auto_19493 ?auto_19516 ) ( ON ?auto_19493 ?auto_19515 ) ( CLEAR ?auto_19493 ) ( not ( = ?auto_19492 ?auto_19493 ) ) ( not ( = ?auto_19492 ?auto_19515 ) ) ( not ( = ?auto_19493 ?auto_19515 ) ) ( not ( = ?auto_19507 ?auto_19513 ) ) ( SURFACE-AT ?auto_19491 ?auto_19503 ) ( CLEAR ?auto_19491 ) ( IS-CRATE ?auto_19492 ) ( AVAILABLE ?auto_19507 ) ( not ( = ?auto_19510 ?auto_19503 ) ) ( HOIST-AT ?auto_19512 ?auto_19510 ) ( AVAILABLE ?auto_19512 ) ( SURFACE-AT ?auto_19492 ?auto_19510 ) ( ON ?auto_19492 ?auto_19529 ) ( CLEAR ?auto_19492 ) ( TRUCK-AT ?auto_19505 ?auto_19503 ) ( not ( = ?auto_19491 ?auto_19492 ) ) ( not ( = ?auto_19491 ?auto_19529 ) ) ( not ( = ?auto_19492 ?auto_19529 ) ) ( not ( = ?auto_19507 ?auto_19512 ) ) ( not ( = ?auto_19491 ?auto_19493 ) ) ( not ( = ?auto_19491 ?auto_19515 ) ) ( not ( = ?auto_19493 ?auto_19529 ) ) ( not ( = ?auto_19516 ?auto_19510 ) ) ( not ( = ?auto_19513 ?auto_19512 ) ) ( not ( = ?auto_19515 ?auto_19529 ) ) ( not ( = ?auto_19491 ?auto_19494 ) ) ( not ( = ?auto_19491 ?auto_19527 ) ) ( not ( = ?auto_19492 ?auto_19494 ) ) ( not ( = ?auto_19492 ?auto_19527 ) ) ( not ( = ?auto_19494 ?auto_19515 ) ) ( not ( = ?auto_19494 ?auto_19529 ) ) ( not ( = ?auto_19514 ?auto_19516 ) ) ( not ( = ?auto_19514 ?auto_19510 ) ) ( not ( = ?auto_19526 ?auto_19513 ) ) ( not ( = ?auto_19526 ?auto_19512 ) ) ( not ( = ?auto_19527 ?auto_19515 ) ) ( not ( = ?auto_19527 ?auto_19529 ) ) ( not ( = ?auto_19491 ?auto_19495 ) ) ( not ( = ?auto_19491 ?auto_19519 ) ) ( not ( = ?auto_19492 ?auto_19495 ) ) ( not ( = ?auto_19492 ?auto_19519 ) ) ( not ( = ?auto_19493 ?auto_19495 ) ) ( not ( = ?auto_19493 ?auto_19519 ) ) ( not ( = ?auto_19495 ?auto_19527 ) ) ( not ( = ?auto_19495 ?auto_19515 ) ) ( not ( = ?auto_19495 ?auto_19529 ) ) ( not ( = ?auto_19517 ?auto_19514 ) ) ( not ( = ?auto_19517 ?auto_19516 ) ) ( not ( = ?auto_19517 ?auto_19510 ) ) ( not ( = ?auto_19525 ?auto_19526 ) ) ( not ( = ?auto_19525 ?auto_19513 ) ) ( not ( = ?auto_19525 ?auto_19512 ) ) ( not ( = ?auto_19519 ?auto_19527 ) ) ( not ( = ?auto_19519 ?auto_19515 ) ) ( not ( = ?auto_19519 ?auto_19529 ) ) ( not ( = ?auto_19491 ?auto_19496 ) ) ( not ( = ?auto_19491 ?auto_19531 ) ) ( not ( = ?auto_19492 ?auto_19496 ) ) ( not ( = ?auto_19492 ?auto_19531 ) ) ( not ( = ?auto_19493 ?auto_19496 ) ) ( not ( = ?auto_19493 ?auto_19531 ) ) ( not ( = ?auto_19494 ?auto_19496 ) ) ( not ( = ?auto_19494 ?auto_19531 ) ) ( not ( = ?auto_19496 ?auto_19519 ) ) ( not ( = ?auto_19496 ?auto_19527 ) ) ( not ( = ?auto_19496 ?auto_19515 ) ) ( not ( = ?auto_19496 ?auto_19529 ) ) ( not ( = ?auto_19528 ?auto_19517 ) ) ( not ( = ?auto_19528 ?auto_19514 ) ) ( not ( = ?auto_19528 ?auto_19516 ) ) ( not ( = ?auto_19528 ?auto_19510 ) ) ( not ( = ?auto_19532 ?auto_19525 ) ) ( not ( = ?auto_19532 ?auto_19526 ) ) ( not ( = ?auto_19532 ?auto_19513 ) ) ( not ( = ?auto_19532 ?auto_19512 ) ) ( not ( = ?auto_19531 ?auto_19519 ) ) ( not ( = ?auto_19531 ?auto_19527 ) ) ( not ( = ?auto_19531 ?auto_19515 ) ) ( not ( = ?auto_19531 ?auto_19529 ) ) ( not ( = ?auto_19491 ?auto_19497 ) ) ( not ( = ?auto_19491 ?auto_19518 ) ) ( not ( = ?auto_19492 ?auto_19497 ) ) ( not ( = ?auto_19492 ?auto_19518 ) ) ( not ( = ?auto_19493 ?auto_19497 ) ) ( not ( = ?auto_19493 ?auto_19518 ) ) ( not ( = ?auto_19494 ?auto_19497 ) ) ( not ( = ?auto_19494 ?auto_19518 ) ) ( not ( = ?auto_19495 ?auto_19497 ) ) ( not ( = ?auto_19495 ?auto_19518 ) ) ( not ( = ?auto_19497 ?auto_19531 ) ) ( not ( = ?auto_19497 ?auto_19519 ) ) ( not ( = ?auto_19497 ?auto_19527 ) ) ( not ( = ?auto_19497 ?auto_19515 ) ) ( not ( = ?auto_19497 ?auto_19529 ) ) ( not ( = ?auto_19521 ?auto_19528 ) ) ( not ( = ?auto_19521 ?auto_19517 ) ) ( not ( = ?auto_19521 ?auto_19514 ) ) ( not ( = ?auto_19521 ?auto_19516 ) ) ( not ( = ?auto_19521 ?auto_19510 ) ) ( not ( = ?auto_19508 ?auto_19532 ) ) ( not ( = ?auto_19508 ?auto_19525 ) ) ( not ( = ?auto_19508 ?auto_19526 ) ) ( not ( = ?auto_19508 ?auto_19513 ) ) ( not ( = ?auto_19508 ?auto_19512 ) ) ( not ( = ?auto_19518 ?auto_19531 ) ) ( not ( = ?auto_19518 ?auto_19519 ) ) ( not ( = ?auto_19518 ?auto_19527 ) ) ( not ( = ?auto_19518 ?auto_19515 ) ) ( not ( = ?auto_19518 ?auto_19529 ) ) ( not ( = ?auto_19491 ?auto_19498 ) ) ( not ( = ?auto_19491 ?auto_19509 ) ) ( not ( = ?auto_19492 ?auto_19498 ) ) ( not ( = ?auto_19492 ?auto_19509 ) ) ( not ( = ?auto_19493 ?auto_19498 ) ) ( not ( = ?auto_19493 ?auto_19509 ) ) ( not ( = ?auto_19494 ?auto_19498 ) ) ( not ( = ?auto_19494 ?auto_19509 ) ) ( not ( = ?auto_19495 ?auto_19498 ) ) ( not ( = ?auto_19495 ?auto_19509 ) ) ( not ( = ?auto_19496 ?auto_19498 ) ) ( not ( = ?auto_19496 ?auto_19509 ) ) ( not ( = ?auto_19498 ?auto_19518 ) ) ( not ( = ?auto_19498 ?auto_19531 ) ) ( not ( = ?auto_19498 ?auto_19519 ) ) ( not ( = ?auto_19498 ?auto_19527 ) ) ( not ( = ?auto_19498 ?auto_19515 ) ) ( not ( = ?auto_19498 ?auto_19529 ) ) ( not ( = ?auto_19511 ?auto_19521 ) ) ( not ( = ?auto_19511 ?auto_19528 ) ) ( not ( = ?auto_19511 ?auto_19517 ) ) ( not ( = ?auto_19511 ?auto_19514 ) ) ( not ( = ?auto_19511 ?auto_19516 ) ) ( not ( = ?auto_19511 ?auto_19510 ) ) ( not ( = ?auto_19520 ?auto_19508 ) ) ( not ( = ?auto_19520 ?auto_19532 ) ) ( not ( = ?auto_19520 ?auto_19525 ) ) ( not ( = ?auto_19520 ?auto_19526 ) ) ( not ( = ?auto_19520 ?auto_19513 ) ) ( not ( = ?auto_19520 ?auto_19512 ) ) ( not ( = ?auto_19509 ?auto_19518 ) ) ( not ( = ?auto_19509 ?auto_19531 ) ) ( not ( = ?auto_19509 ?auto_19519 ) ) ( not ( = ?auto_19509 ?auto_19527 ) ) ( not ( = ?auto_19509 ?auto_19515 ) ) ( not ( = ?auto_19509 ?auto_19529 ) ) ( not ( = ?auto_19491 ?auto_19499 ) ) ( not ( = ?auto_19491 ?auto_19530 ) ) ( not ( = ?auto_19492 ?auto_19499 ) ) ( not ( = ?auto_19492 ?auto_19530 ) ) ( not ( = ?auto_19493 ?auto_19499 ) ) ( not ( = ?auto_19493 ?auto_19530 ) ) ( not ( = ?auto_19494 ?auto_19499 ) ) ( not ( = ?auto_19494 ?auto_19530 ) ) ( not ( = ?auto_19495 ?auto_19499 ) ) ( not ( = ?auto_19495 ?auto_19530 ) ) ( not ( = ?auto_19496 ?auto_19499 ) ) ( not ( = ?auto_19496 ?auto_19530 ) ) ( not ( = ?auto_19497 ?auto_19499 ) ) ( not ( = ?auto_19497 ?auto_19530 ) ) ( not ( = ?auto_19499 ?auto_19509 ) ) ( not ( = ?auto_19499 ?auto_19518 ) ) ( not ( = ?auto_19499 ?auto_19531 ) ) ( not ( = ?auto_19499 ?auto_19519 ) ) ( not ( = ?auto_19499 ?auto_19527 ) ) ( not ( = ?auto_19499 ?auto_19515 ) ) ( not ( = ?auto_19499 ?auto_19529 ) ) ( not ( = ?auto_19522 ?auto_19511 ) ) ( not ( = ?auto_19522 ?auto_19521 ) ) ( not ( = ?auto_19522 ?auto_19528 ) ) ( not ( = ?auto_19522 ?auto_19517 ) ) ( not ( = ?auto_19522 ?auto_19514 ) ) ( not ( = ?auto_19522 ?auto_19516 ) ) ( not ( = ?auto_19522 ?auto_19510 ) ) ( not ( = ?auto_19523 ?auto_19520 ) ) ( not ( = ?auto_19523 ?auto_19508 ) ) ( not ( = ?auto_19523 ?auto_19532 ) ) ( not ( = ?auto_19523 ?auto_19525 ) ) ( not ( = ?auto_19523 ?auto_19526 ) ) ( not ( = ?auto_19523 ?auto_19513 ) ) ( not ( = ?auto_19523 ?auto_19512 ) ) ( not ( = ?auto_19530 ?auto_19509 ) ) ( not ( = ?auto_19530 ?auto_19518 ) ) ( not ( = ?auto_19530 ?auto_19531 ) ) ( not ( = ?auto_19530 ?auto_19519 ) ) ( not ( = ?auto_19530 ?auto_19527 ) ) ( not ( = ?auto_19530 ?auto_19515 ) ) ( not ( = ?auto_19530 ?auto_19529 ) ) ( not ( = ?auto_19491 ?auto_19500 ) ) ( not ( = ?auto_19491 ?auto_19524 ) ) ( not ( = ?auto_19492 ?auto_19500 ) ) ( not ( = ?auto_19492 ?auto_19524 ) ) ( not ( = ?auto_19493 ?auto_19500 ) ) ( not ( = ?auto_19493 ?auto_19524 ) ) ( not ( = ?auto_19494 ?auto_19500 ) ) ( not ( = ?auto_19494 ?auto_19524 ) ) ( not ( = ?auto_19495 ?auto_19500 ) ) ( not ( = ?auto_19495 ?auto_19524 ) ) ( not ( = ?auto_19496 ?auto_19500 ) ) ( not ( = ?auto_19496 ?auto_19524 ) ) ( not ( = ?auto_19497 ?auto_19500 ) ) ( not ( = ?auto_19497 ?auto_19524 ) ) ( not ( = ?auto_19498 ?auto_19500 ) ) ( not ( = ?auto_19498 ?auto_19524 ) ) ( not ( = ?auto_19500 ?auto_19530 ) ) ( not ( = ?auto_19500 ?auto_19509 ) ) ( not ( = ?auto_19500 ?auto_19518 ) ) ( not ( = ?auto_19500 ?auto_19531 ) ) ( not ( = ?auto_19500 ?auto_19519 ) ) ( not ( = ?auto_19500 ?auto_19527 ) ) ( not ( = ?auto_19500 ?auto_19515 ) ) ( not ( = ?auto_19500 ?auto_19529 ) ) ( not ( = ?auto_19524 ?auto_19530 ) ) ( not ( = ?auto_19524 ?auto_19509 ) ) ( not ( = ?auto_19524 ?auto_19518 ) ) ( not ( = ?auto_19524 ?auto_19531 ) ) ( not ( = ?auto_19524 ?auto_19519 ) ) ( not ( = ?auto_19524 ?auto_19527 ) ) ( not ( = ?auto_19524 ?auto_19515 ) ) ( not ( = ?auto_19524 ?auto_19529 ) ) ( not ( = ?auto_19491 ?auto_19501 ) ) ( not ( = ?auto_19491 ?auto_19502 ) ) ( not ( = ?auto_19492 ?auto_19501 ) ) ( not ( = ?auto_19492 ?auto_19502 ) ) ( not ( = ?auto_19493 ?auto_19501 ) ) ( not ( = ?auto_19493 ?auto_19502 ) ) ( not ( = ?auto_19494 ?auto_19501 ) ) ( not ( = ?auto_19494 ?auto_19502 ) ) ( not ( = ?auto_19495 ?auto_19501 ) ) ( not ( = ?auto_19495 ?auto_19502 ) ) ( not ( = ?auto_19496 ?auto_19501 ) ) ( not ( = ?auto_19496 ?auto_19502 ) ) ( not ( = ?auto_19497 ?auto_19501 ) ) ( not ( = ?auto_19497 ?auto_19502 ) ) ( not ( = ?auto_19498 ?auto_19501 ) ) ( not ( = ?auto_19498 ?auto_19502 ) ) ( not ( = ?auto_19499 ?auto_19501 ) ) ( not ( = ?auto_19499 ?auto_19502 ) ) ( not ( = ?auto_19501 ?auto_19524 ) ) ( not ( = ?auto_19501 ?auto_19530 ) ) ( not ( = ?auto_19501 ?auto_19509 ) ) ( not ( = ?auto_19501 ?auto_19518 ) ) ( not ( = ?auto_19501 ?auto_19531 ) ) ( not ( = ?auto_19501 ?auto_19519 ) ) ( not ( = ?auto_19501 ?auto_19527 ) ) ( not ( = ?auto_19501 ?auto_19515 ) ) ( not ( = ?auto_19501 ?auto_19529 ) ) ( not ( = ?auto_19506 ?auto_19522 ) ) ( not ( = ?auto_19506 ?auto_19511 ) ) ( not ( = ?auto_19506 ?auto_19521 ) ) ( not ( = ?auto_19506 ?auto_19528 ) ) ( not ( = ?auto_19506 ?auto_19517 ) ) ( not ( = ?auto_19506 ?auto_19514 ) ) ( not ( = ?auto_19506 ?auto_19516 ) ) ( not ( = ?auto_19506 ?auto_19510 ) ) ( not ( = ?auto_19504 ?auto_19523 ) ) ( not ( = ?auto_19504 ?auto_19520 ) ) ( not ( = ?auto_19504 ?auto_19508 ) ) ( not ( = ?auto_19504 ?auto_19532 ) ) ( not ( = ?auto_19504 ?auto_19525 ) ) ( not ( = ?auto_19504 ?auto_19526 ) ) ( not ( = ?auto_19504 ?auto_19513 ) ) ( not ( = ?auto_19504 ?auto_19512 ) ) ( not ( = ?auto_19502 ?auto_19524 ) ) ( not ( = ?auto_19502 ?auto_19530 ) ) ( not ( = ?auto_19502 ?auto_19509 ) ) ( not ( = ?auto_19502 ?auto_19518 ) ) ( not ( = ?auto_19502 ?auto_19531 ) ) ( not ( = ?auto_19502 ?auto_19519 ) ) ( not ( = ?auto_19502 ?auto_19527 ) ) ( not ( = ?auto_19502 ?auto_19515 ) ) ( not ( = ?auto_19502 ?auto_19529 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_19491 ?auto_19492 ?auto_19493 ?auto_19494 ?auto_19495 ?auto_19496 ?auto_19497 ?auto_19498 ?auto_19499 ?auto_19500 )
      ( MAKE-1CRATE ?auto_19500 ?auto_19501 )
      ( MAKE-10CRATE-VERIFY ?auto_19491 ?auto_19492 ?auto_19493 ?auto_19494 ?auto_19495 ?auto_19496 ?auto_19497 ?auto_19498 ?auto_19499 ?auto_19500 ?auto_19501 ) )
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
      ?auto_19561 - SURFACE
      ?auto_19562 - SURFACE
      ?auto_19563 - SURFACE
      ?auto_19564 - SURFACE
      ?auto_19565 - SURFACE
      ?auto_19566 - SURFACE
    )
    :vars
    (
      ?auto_19569 - HOIST
      ?auto_19570 - PLACE
      ?auto_19572 - PLACE
      ?auto_19567 - HOIST
      ?auto_19571 - SURFACE
      ?auto_19582 - PLACE
      ?auto_19600 - HOIST
      ?auto_19580 - SURFACE
      ?auto_19591 - PLACE
      ?auto_19597 - HOIST
      ?auto_19596 - SURFACE
      ?auto_19575 - SURFACE
      ?auto_19594 - PLACE
      ?auto_19579 - HOIST
      ?auto_19593 - SURFACE
      ?auto_19590 - PLACE
      ?auto_19574 - HOIST
      ?auto_19578 - SURFACE
      ?auto_19585 - PLACE
      ?auto_19577 - HOIST
      ?auto_19581 - SURFACE
      ?auto_19573 - PLACE
      ?auto_19588 - HOIST
      ?auto_19589 - SURFACE
      ?auto_19598 - PLACE
      ?auto_19587 - HOIST
      ?auto_19584 - SURFACE
      ?auto_19583 - PLACE
      ?auto_19599 - HOIST
      ?auto_19576 - SURFACE
      ?auto_19595 - PLACE
      ?auto_19592 - HOIST
      ?auto_19586 - SURFACE
      ?auto_19568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19569 ?auto_19570 ) ( IS-CRATE ?auto_19566 ) ( not ( = ?auto_19572 ?auto_19570 ) ) ( HOIST-AT ?auto_19567 ?auto_19572 ) ( AVAILABLE ?auto_19567 ) ( SURFACE-AT ?auto_19566 ?auto_19572 ) ( ON ?auto_19566 ?auto_19571 ) ( CLEAR ?auto_19566 ) ( not ( = ?auto_19565 ?auto_19566 ) ) ( not ( = ?auto_19565 ?auto_19571 ) ) ( not ( = ?auto_19566 ?auto_19571 ) ) ( not ( = ?auto_19569 ?auto_19567 ) ) ( IS-CRATE ?auto_19565 ) ( not ( = ?auto_19582 ?auto_19570 ) ) ( HOIST-AT ?auto_19600 ?auto_19582 ) ( AVAILABLE ?auto_19600 ) ( SURFACE-AT ?auto_19565 ?auto_19582 ) ( ON ?auto_19565 ?auto_19580 ) ( CLEAR ?auto_19565 ) ( not ( = ?auto_19564 ?auto_19565 ) ) ( not ( = ?auto_19564 ?auto_19580 ) ) ( not ( = ?auto_19565 ?auto_19580 ) ) ( not ( = ?auto_19569 ?auto_19600 ) ) ( IS-CRATE ?auto_19564 ) ( not ( = ?auto_19591 ?auto_19570 ) ) ( HOIST-AT ?auto_19597 ?auto_19591 ) ( SURFACE-AT ?auto_19564 ?auto_19591 ) ( ON ?auto_19564 ?auto_19596 ) ( CLEAR ?auto_19564 ) ( not ( = ?auto_19563 ?auto_19564 ) ) ( not ( = ?auto_19563 ?auto_19596 ) ) ( not ( = ?auto_19564 ?auto_19596 ) ) ( not ( = ?auto_19569 ?auto_19597 ) ) ( IS-CRATE ?auto_19563 ) ( AVAILABLE ?auto_19597 ) ( SURFACE-AT ?auto_19563 ?auto_19591 ) ( ON ?auto_19563 ?auto_19575 ) ( CLEAR ?auto_19563 ) ( not ( = ?auto_19562 ?auto_19563 ) ) ( not ( = ?auto_19562 ?auto_19575 ) ) ( not ( = ?auto_19563 ?auto_19575 ) ) ( IS-CRATE ?auto_19562 ) ( not ( = ?auto_19594 ?auto_19570 ) ) ( HOIST-AT ?auto_19579 ?auto_19594 ) ( AVAILABLE ?auto_19579 ) ( SURFACE-AT ?auto_19562 ?auto_19594 ) ( ON ?auto_19562 ?auto_19593 ) ( CLEAR ?auto_19562 ) ( not ( = ?auto_19561 ?auto_19562 ) ) ( not ( = ?auto_19561 ?auto_19593 ) ) ( not ( = ?auto_19562 ?auto_19593 ) ) ( not ( = ?auto_19569 ?auto_19579 ) ) ( IS-CRATE ?auto_19561 ) ( not ( = ?auto_19590 ?auto_19570 ) ) ( HOIST-AT ?auto_19574 ?auto_19590 ) ( AVAILABLE ?auto_19574 ) ( SURFACE-AT ?auto_19561 ?auto_19590 ) ( ON ?auto_19561 ?auto_19578 ) ( CLEAR ?auto_19561 ) ( not ( = ?auto_19560 ?auto_19561 ) ) ( not ( = ?auto_19560 ?auto_19578 ) ) ( not ( = ?auto_19561 ?auto_19578 ) ) ( not ( = ?auto_19569 ?auto_19574 ) ) ( IS-CRATE ?auto_19560 ) ( not ( = ?auto_19585 ?auto_19570 ) ) ( HOIST-AT ?auto_19577 ?auto_19585 ) ( AVAILABLE ?auto_19577 ) ( SURFACE-AT ?auto_19560 ?auto_19585 ) ( ON ?auto_19560 ?auto_19581 ) ( CLEAR ?auto_19560 ) ( not ( = ?auto_19559 ?auto_19560 ) ) ( not ( = ?auto_19559 ?auto_19581 ) ) ( not ( = ?auto_19560 ?auto_19581 ) ) ( not ( = ?auto_19569 ?auto_19577 ) ) ( IS-CRATE ?auto_19559 ) ( not ( = ?auto_19573 ?auto_19570 ) ) ( HOIST-AT ?auto_19588 ?auto_19573 ) ( AVAILABLE ?auto_19588 ) ( SURFACE-AT ?auto_19559 ?auto_19573 ) ( ON ?auto_19559 ?auto_19589 ) ( CLEAR ?auto_19559 ) ( not ( = ?auto_19558 ?auto_19559 ) ) ( not ( = ?auto_19558 ?auto_19589 ) ) ( not ( = ?auto_19559 ?auto_19589 ) ) ( not ( = ?auto_19569 ?auto_19588 ) ) ( IS-CRATE ?auto_19558 ) ( not ( = ?auto_19598 ?auto_19570 ) ) ( HOIST-AT ?auto_19587 ?auto_19598 ) ( AVAILABLE ?auto_19587 ) ( SURFACE-AT ?auto_19558 ?auto_19598 ) ( ON ?auto_19558 ?auto_19584 ) ( CLEAR ?auto_19558 ) ( not ( = ?auto_19557 ?auto_19558 ) ) ( not ( = ?auto_19557 ?auto_19584 ) ) ( not ( = ?auto_19558 ?auto_19584 ) ) ( not ( = ?auto_19569 ?auto_19587 ) ) ( IS-CRATE ?auto_19557 ) ( not ( = ?auto_19583 ?auto_19570 ) ) ( HOIST-AT ?auto_19599 ?auto_19583 ) ( AVAILABLE ?auto_19599 ) ( SURFACE-AT ?auto_19557 ?auto_19583 ) ( ON ?auto_19557 ?auto_19576 ) ( CLEAR ?auto_19557 ) ( not ( = ?auto_19556 ?auto_19557 ) ) ( not ( = ?auto_19556 ?auto_19576 ) ) ( not ( = ?auto_19557 ?auto_19576 ) ) ( not ( = ?auto_19569 ?auto_19599 ) ) ( SURFACE-AT ?auto_19555 ?auto_19570 ) ( CLEAR ?auto_19555 ) ( IS-CRATE ?auto_19556 ) ( AVAILABLE ?auto_19569 ) ( not ( = ?auto_19595 ?auto_19570 ) ) ( HOIST-AT ?auto_19592 ?auto_19595 ) ( AVAILABLE ?auto_19592 ) ( SURFACE-AT ?auto_19556 ?auto_19595 ) ( ON ?auto_19556 ?auto_19586 ) ( CLEAR ?auto_19556 ) ( TRUCK-AT ?auto_19568 ?auto_19570 ) ( not ( = ?auto_19555 ?auto_19556 ) ) ( not ( = ?auto_19555 ?auto_19586 ) ) ( not ( = ?auto_19556 ?auto_19586 ) ) ( not ( = ?auto_19569 ?auto_19592 ) ) ( not ( = ?auto_19555 ?auto_19557 ) ) ( not ( = ?auto_19555 ?auto_19576 ) ) ( not ( = ?auto_19557 ?auto_19586 ) ) ( not ( = ?auto_19583 ?auto_19595 ) ) ( not ( = ?auto_19599 ?auto_19592 ) ) ( not ( = ?auto_19576 ?auto_19586 ) ) ( not ( = ?auto_19555 ?auto_19558 ) ) ( not ( = ?auto_19555 ?auto_19584 ) ) ( not ( = ?auto_19556 ?auto_19558 ) ) ( not ( = ?auto_19556 ?auto_19584 ) ) ( not ( = ?auto_19558 ?auto_19576 ) ) ( not ( = ?auto_19558 ?auto_19586 ) ) ( not ( = ?auto_19598 ?auto_19583 ) ) ( not ( = ?auto_19598 ?auto_19595 ) ) ( not ( = ?auto_19587 ?auto_19599 ) ) ( not ( = ?auto_19587 ?auto_19592 ) ) ( not ( = ?auto_19584 ?auto_19576 ) ) ( not ( = ?auto_19584 ?auto_19586 ) ) ( not ( = ?auto_19555 ?auto_19559 ) ) ( not ( = ?auto_19555 ?auto_19589 ) ) ( not ( = ?auto_19556 ?auto_19559 ) ) ( not ( = ?auto_19556 ?auto_19589 ) ) ( not ( = ?auto_19557 ?auto_19559 ) ) ( not ( = ?auto_19557 ?auto_19589 ) ) ( not ( = ?auto_19559 ?auto_19584 ) ) ( not ( = ?auto_19559 ?auto_19576 ) ) ( not ( = ?auto_19559 ?auto_19586 ) ) ( not ( = ?auto_19573 ?auto_19598 ) ) ( not ( = ?auto_19573 ?auto_19583 ) ) ( not ( = ?auto_19573 ?auto_19595 ) ) ( not ( = ?auto_19588 ?auto_19587 ) ) ( not ( = ?auto_19588 ?auto_19599 ) ) ( not ( = ?auto_19588 ?auto_19592 ) ) ( not ( = ?auto_19589 ?auto_19584 ) ) ( not ( = ?auto_19589 ?auto_19576 ) ) ( not ( = ?auto_19589 ?auto_19586 ) ) ( not ( = ?auto_19555 ?auto_19560 ) ) ( not ( = ?auto_19555 ?auto_19581 ) ) ( not ( = ?auto_19556 ?auto_19560 ) ) ( not ( = ?auto_19556 ?auto_19581 ) ) ( not ( = ?auto_19557 ?auto_19560 ) ) ( not ( = ?auto_19557 ?auto_19581 ) ) ( not ( = ?auto_19558 ?auto_19560 ) ) ( not ( = ?auto_19558 ?auto_19581 ) ) ( not ( = ?auto_19560 ?auto_19589 ) ) ( not ( = ?auto_19560 ?auto_19584 ) ) ( not ( = ?auto_19560 ?auto_19576 ) ) ( not ( = ?auto_19560 ?auto_19586 ) ) ( not ( = ?auto_19585 ?auto_19573 ) ) ( not ( = ?auto_19585 ?auto_19598 ) ) ( not ( = ?auto_19585 ?auto_19583 ) ) ( not ( = ?auto_19585 ?auto_19595 ) ) ( not ( = ?auto_19577 ?auto_19588 ) ) ( not ( = ?auto_19577 ?auto_19587 ) ) ( not ( = ?auto_19577 ?auto_19599 ) ) ( not ( = ?auto_19577 ?auto_19592 ) ) ( not ( = ?auto_19581 ?auto_19589 ) ) ( not ( = ?auto_19581 ?auto_19584 ) ) ( not ( = ?auto_19581 ?auto_19576 ) ) ( not ( = ?auto_19581 ?auto_19586 ) ) ( not ( = ?auto_19555 ?auto_19561 ) ) ( not ( = ?auto_19555 ?auto_19578 ) ) ( not ( = ?auto_19556 ?auto_19561 ) ) ( not ( = ?auto_19556 ?auto_19578 ) ) ( not ( = ?auto_19557 ?auto_19561 ) ) ( not ( = ?auto_19557 ?auto_19578 ) ) ( not ( = ?auto_19558 ?auto_19561 ) ) ( not ( = ?auto_19558 ?auto_19578 ) ) ( not ( = ?auto_19559 ?auto_19561 ) ) ( not ( = ?auto_19559 ?auto_19578 ) ) ( not ( = ?auto_19561 ?auto_19581 ) ) ( not ( = ?auto_19561 ?auto_19589 ) ) ( not ( = ?auto_19561 ?auto_19584 ) ) ( not ( = ?auto_19561 ?auto_19576 ) ) ( not ( = ?auto_19561 ?auto_19586 ) ) ( not ( = ?auto_19590 ?auto_19585 ) ) ( not ( = ?auto_19590 ?auto_19573 ) ) ( not ( = ?auto_19590 ?auto_19598 ) ) ( not ( = ?auto_19590 ?auto_19583 ) ) ( not ( = ?auto_19590 ?auto_19595 ) ) ( not ( = ?auto_19574 ?auto_19577 ) ) ( not ( = ?auto_19574 ?auto_19588 ) ) ( not ( = ?auto_19574 ?auto_19587 ) ) ( not ( = ?auto_19574 ?auto_19599 ) ) ( not ( = ?auto_19574 ?auto_19592 ) ) ( not ( = ?auto_19578 ?auto_19581 ) ) ( not ( = ?auto_19578 ?auto_19589 ) ) ( not ( = ?auto_19578 ?auto_19584 ) ) ( not ( = ?auto_19578 ?auto_19576 ) ) ( not ( = ?auto_19578 ?auto_19586 ) ) ( not ( = ?auto_19555 ?auto_19562 ) ) ( not ( = ?auto_19555 ?auto_19593 ) ) ( not ( = ?auto_19556 ?auto_19562 ) ) ( not ( = ?auto_19556 ?auto_19593 ) ) ( not ( = ?auto_19557 ?auto_19562 ) ) ( not ( = ?auto_19557 ?auto_19593 ) ) ( not ( = ?auto_19558 ?auto_19562 ) ) ( not ( = ?auto_19558 ?auto_19593 ) ) ( not ( = ?auto_19559 ?auto_19562 ) ) ( not ( = ?auto_19559 ?auto_19593 ) ) ( not ( = ?auto_19560 ?auto_19562 ) ) ( not ( = ?auto_19560 ?auto_19593 ) ) ( not ( = ?auto_19562 ?auto_19578 ) ) ( not ( = ?auto_19562 ?auto_19581 ) ) ( not ( = ?auto_19562 ?auto_19589 ) ) ( not ( = ?auto_19562 ?auto_19584 ) ) ( not ( = ?auto_19562 ?auto_19576 ) ) ( not ( = ?auto_19562 ?auto_19586 ) ) ( not ( = ?auto_19594 ?auto_19590 ) ) ( not ( = ?auto_19594 ?auto_19585 ) ) ( not ( = ?auto_19594 ?auto_19573 ) ) ( not ( = ?auto_19594 ?auto_19598 ) ) ( not ( = ?auto_19594 ?auto_19583 ) ) ( not ( = ?auto_19594 ?auto_19595 ) ) ( not ( = ?auto_19579 ?auto_19574 ) ) ( not ( = ?auto_19579 ?auto_19577 ) ) ( not ( = ?auto_19579 ?auto_19588 ) ) ( not ( = ?auto_19579 ?auto_19587 ) ) ( not ( = ?auto_19579 ?auto_19599 ) ) ( not ( = ?auto_19579 ?auto_19592 ) ) ( not ( = ?auto_19593 ?auto_19578 ) ) ( not ( = ?auto_19593 ?auto_19581 ) ) ( not ( = ?auto_19593 ?auto_19589 ) ) ( not ( = ?auto_19593 ?auto_19584 ) ) ( not ( = ?auto_19593 ?auto_19576 ) ) ( not ( = ?auto_19593 ?auto_19586 ) ) ( not ( = ?auto_19555 ?auto_19563 ) ) ( not ( = ?auto_19555 ?auto_19575 ) ) ( not ( = ?auto_19556 ?auto_19563 ) ) ( not ( = ?auto_19556 ?auto_19575 ) ) ( not ( = ?auto_19557 ?auto_19563 ) ) ( not ( = ?auto_19557 ?auto_19575 ) ) ( not ( = ?auto_19558 ?auto_19563 ) ) ( not ( = ?auto_19558 ?auto_19575 ) ) ( not ( = ?auto_19559 ?auto_19563 ) ) ( not ( = ?auto_19559 ?auto_19575 ) ) ( not ( = ?auto_19560 ?auto_19563 ) ) ( not ( = ?auto_19560 ?auto_19575 ) ) ( not ( = ?auto_19561 ?auto_19563 ) ) ( not ( = ?auto_19561 ?auto_19575 ) ) ( not ( = ?auto_19563 ?auto_19593 ) ) ( not ( = ?auto_19563 ?auto_19578 ) ) ( not ( = ?auto_19563 ?auto_19581 ) ) ( not ( = ?auto_19563 ?auto_19589 ) ) ( not ( = ?auto_19563 ?auto_19584 ) ) ( not ( = ?auto_19563 ?auto_19576 ) ) ( not ( = ?auto_19563 ?auto_19586 ) ) ( not ( = ?auto_19591 ?auto_19594 ) ) ( not ( = ?auto_19591 ?auto_19590 ) ) ( not ( = ?auto_19591 ?auto_19585 ) ) ( not ( = ?auto_19591 ?auto_19573 ) ) ( not ( = ?auto_19591 ?auto_19598 ) ) ( not ( = ?auto_19591 ?auto_19583 ) ) ( not ( = ?auto_19591 ?auto_19595 ) ) ( not ( = ?auto_19597 ?auto_19579 ) ) ( not ( = ?auto_19597 ?auto_19574 ) ) ( not ( = ?auto_19597 ?auto_19577 ) ) ( not ( = ?auto_19597 ?auto_19588 ) ) ( not ( = ?auto_19597 ?auto_19587 ) ) ( not ( = ?auto_19597 ?auto_19599 ) ) ( not ( = ?auto_19597 ?auto_19592 ) ) ( not ( = ?auto_19575 ?auto_19593 ) ) ( not ( = ?auto_19575 ?auto_19578 ) ) ( not ( = ?auto_19575 ?auto_19581 ) ) ( not ( = ?auto_19575 ?auto_19589 ) ) ( not ( = ?auto_19575 ?auto_19584 ) ) ( not ( = ?auto_19575 ?auto_19576 ) ) ( not ( = ?auto_19575 ?auto_19586 ) ) ( not ( = ?auto_19555 ?auto_19564 ) ) ( not ( = ?auto_19555 ?auto_19596 ) ) ( not ( = ?auto_19556 ?auto_19564 ) ) ( not ( = ?auto_19556 ?auto_19596 ) ) ( not ( = ?auto_19557 ?auto_19564 ) ) ( not ( = ?auto_19557 ?auto_19596 ) ) ( not ( = ?auto_19558 ?auto_19564 ) ) ( not ( = ?auto_19558 ?auto_19596 ) ) ( not ( = ?auto_19559 ?auto_19564 ) ) ( not ( = ?auto_19559 ?auto_19596 ) ) ( not ( = ?auto_19560 ?auto_19564 ) ) ( not ( = ?auto_19560 ?auto_19596 ) ) ( not ( = ?auto_19561 ?auto_19564 ) ) ( not ( = ?auto_19561 ?auto_19596 ) ) ( not ( = ?auto_19562 ?auto_19564 ) ) ( not ( = ?auto_19562 ?auto_19596 ) ) ( not ( = ?auto_19564 ?auto_19575 ) ) ( not ( = ?auto_19564 ?auto_19593 ) ) ( not ( = ?auto_19564 ?auto_19578 ) ) ( not ( = ?auto_19564 ?auto_19581 ) ) ( not ( = ?auto_19564 ?auto_19589 ) ) ( not ( = ?auto_19564 ?auto_19584 ) ) ( not ( = ?auto_19564 ?auto_19576 ) ) ( not ( = ?auto_19564 ?auto_19586 ) ) ( not ( = ?auto_19596 ?auto_19575 ) ) ( not ( = ?auto_19596 ?auto_19593 ) ) ( not ( = ?auto_19596 ?auto_19578 ) ) ( not ( = ?auto_19596 ?auto_19581 ) ) ( not ( = ?auto_19596 ?auto_19589 ) ) ( not ( = ?auto_19596 ?auto_19584 ) ) ( not ( = ?auto_19596 ?auto_19576 ) ) ( not ( = ?auto_19596 ?auto_19586 ) ) ( not ( = ?auto_19555 ?auto_19565 ) ) ( not ( = ?auto_19555 ?auto_19580 ) ) ( not ( = ?auto_19556 ?auto_19565 ) ) ( not ( = ?auto_19556 ?auto_19580 ) ) ( not ( = ?auto_19557 ?auto_19565 ) ) ( not ( = ?auto_19557 ?auto_19580 ) ) ( not ( = ?auto_19558 ?auto_19565 ) ) ( not ( = ?auto_19558 ?auto_19580 ) ) ( not ( = ?auto_19559 ?auto_19565 ) ) ( not ( = ?auto_19559 ?auto_19580 ) ) ( not ( = ?auto_19560 ?auto_19565 ) ) ( not ( = ?auto_19560 ?auto_19580 ) ) ( not ( = ?auto_19561 ?auto_19565 ) ) ( not ( = ?auto_19561 ?auto_19580 ) ) ( not ( = ?auto_19562 ?auto_19565 ) ) ( not ( = ?auto_19562 ?auto_19580 ) ) ( not ( = ?auto_19563 ?auto_19565 ) ) ( not ( = ?auto_19563 ?auto_19580 ) ) ( not ( = ?auto_19565 ?auto_19596 ) ) ( not ( = ?auto_19565 ?auto_19575 ) ) ( not ( = ?auto_19565 ?auto_19593 ) ) ( not ( = ?auto_19565 ?auto_19578 ) ) ( not ( = ?auto_19565 ?auto_19581 ) ) ( not ( = ?auto_19565 ?auto_19589 ) ) ( not ( = ?auto_19565 ?auto_19584 ) ) ( not ( = ?auto_19565 ?auto_19576 ) ) ( not ( = ?auto_19565 ?auto_19586 ) ) ( not ( = ?auto_19582 ?auto_19591 ) ) ( not ( = ?auto_19582 ?auto_19594 ) ) ( not ( = ?auto_19582 ?auto_19590 ) ) ( not ( = ?auto_19582 ?auto_19585 ) ) ( not ( = ?auto_19582 ?auto_19573 ) ) ( not ( = ?auto_19582 ?auto_19598 ) ) ( not ( = ?auto_19582 ?auto_19583 ) ) ( not ( = ?auto_19582 ?auto_19595 ) ) ( not ( = ?auto_19600 ?auto_19597 ) ) ( not ( = ?auto_19600 ?auto_19579 ) ) ( not ( = ?auto_19600 ?auto_19574 ) ) ( not ( = ?auto_19600 ?auto_19577 ) ) ( not ( = ?auto_19600 ?auto_19588 ) ) ( not ( = ?auto_19600 ?auto_19587 ) ) ( not ( = ?auto_19600 ?auto_19599 ) ) ( not ( = ?auto_19600 ?auto_19592 ) ) ( not ( = ?auto_19580 ?auto_19596 ) ) ( not ( = ?auto_19580 ?auto_19575 ) ) ( not ( = ?auto_19580 ?auto_19593 ) ) ( not ( = ?auto_19580 ?auto_19578 ) ) ( not ( = ?auto_19580 ?auto_19581 ) ) ( not ( = ?auto_19580 ?auto_19589 ) ) ( not ( = ?auto_19580 ?auto_19584 ) ) ( not ( = ?auto_19580 ?auto_19576 ) ) ( not ( = ?auto_19580 ?auto_19586 ) ) ( not ( = ?auto_19555 ?auto_19566 ) ) ( not ( = ?auto_19555 ?auto_19571 ) ) ( not ( = ?auto_19556 ?auto_19566 ) ) ( not ( = ?auto_19556 ?auto_19571 ) ) ( not ( = ?auto_19557 ?auto_19566 ) ) ( not ( = ?auto_19557 ?auto_19571 ) ) ( not ( = ?auto_19558 ?auto_19566 ) ) ( not ( = ?auto_19558 ?auto_19571 ) ) ( not ( = ?auto_19559 ?auto_19566 ) ) ( not ( = ?auto_19559 ?auto_19571 ) ) ( not ( = ?auto_19560 ?auto_19566 ) ) ( not ( = ?auto_19560 ?auto_19571 ) ) ( not ( = ?auto_19561 ?auto_19566 ) ) ( not ( = ?auto_19561 ?auto_19571 ) ) ( not ( = ?auto_19562 ?auto_19566 ) ) ( not ( = ?auto_19562 ?auto_19571 ) ) ( not ( = ?auto_19563 ?auto_19566 ) ) ( not ( = ?auto_19563 ?auto_19571 ) ) ( not ( = ?auto_19564 ?auto_19566 ) ) ( not ( = ?auto_19564 ?auto_19571 ) ) ( not ( = ?auto_19566 ?auto_19580 ) ) ( not ( = ?auto_19566 ?auto_19596 ) ) ( not ( = ?auto_19566 ?auto_19575 ) ) ( not ( = ?auto_19566 ?auto_19593 ) ) ( not ( = ?auto_19566 ?auto_19578 ) ) ( not ( = ?auto_19566 ?auto_19581 ) ) ( not ( = ?auto_19566 ?auto_19589 ) ) ( not ( = ?auto_19566 ?auto_19584 ) ) ( not ( = ?auto_19566 ?auto_19576 ) ) ( not ( = ?auto_19566 ?auto_19586 ) ) ( not ( = ?auto_19572 ?auto_19582 ) ) ( not ( = ?auto_19572 ?auto_19591 ) ) ( not ( = ?auto_19572 ?auto_19594 ) ) ( not ( = ?auto_19572 ?auto_19590 ) ) ( not ( = ?auto_19572 ?auto_19585 ) ) ( not ( = ?auto_19572 ?auto_19573 ) ) ( not ( = ?auto_19572 ?auto_19598 ) ) ( not ( = ?auto_19572 ?auto_19583 ) ) ( not ( = ?auto_19572 ?auto_19595 ) ) ( not ( = ?auto_19567 ?auto_19600 ) ) ( not ( = ?auto_19567 ?auto_19597 ) ) ( not ( = ?auto_19567 ?auto_19579 ) ) ( not ( = ?auto_19567 ?auto_19574 ) ) ( not ( = ?auto_19567 ?auto_19577 ) ) ( not ( = ?auto_19567 ?auto_19588 ) ) ( not ( = ?auto_19567 ?auto_19587 ) ) ( not ( = ?auto_19567 ?auto_19599 ) ) ( not ( = ?auto_19567 ?auto_19592 ) ) ( not ( = ?auto_19571 ?auto_19580 ) ) ( not ( = ?auto_19571 ?auto_19596 ) ) ( not ( = ?auto_19571 ?auto_19575 ) ) ( not ( = ?auto_19571 ?auto_19593 ) ) ( not ( = ?auto_19571 ?auto_19578 ) ) ( not ( = ?auto_19571 ?auto_19581 ) ) ( not ( = ?auto_19571 ?auto_19589 ) ) ( not ( = ?auto_19571 ?auto_19584 ) ) ( not ( = ?auto_19571 ?auto_19576 ) ) ( not ( = ?auto_19571 ?auto_19586 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_19555 ?auto_19556 ?auto_19557 ?auto_19558 ?auto_19559 ?auto_19560 ?auto_19561 ?auto_19562 ?auto_19563 ?auto_19564 ?auto_19565 )
      ( MAKE-1CRATE ?auto_19565 ?auto_19566 )
      ( MAKE-11CRATE-VERIFY ?auto_19555 ?auto_19556 ?auto_19557 ?auto_19558 ?auto_19559 ?auto_19560 ?auto_19561 ?auto_19562 ?auto_19563 ?auto_19564 ?auto_19565 ?auto_19566 ) )
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
      ?auto_19630 - SURFACE
      ?auto_19631 - SURFACE
      ?auto_19632 - SURFACE
      ?auto_19633 - SURFACE
      ?auto_19634 - SURFACE
      ?auto_19635 - SURFACE
      ?auto_19636 - SURFACE
    )
    :vars
    (
      ?auto_19642 - HOIST
      ?auto_19638 - PLACE
      ?auto_19637 - PLACE
      ?auto_19640 - HOIST
      ?auto_19639 - SURFACE
      ?auto_19668 - PLACE
      ?auto_19654 - HOIST
      ?auto_19663 - SURFACE
      ?auto_19655 - PLACE
      ?auto_19645 - HOIST
      ?auto_19656 - SURFACE
      ?auto_19672 - PLACE
      ?auto_19649 - HOIST
      ?auto_19661 - SURFACE
      ?auto_19650 - SURFACE
      ?auto_19659 - PLACE
      ?auto_19652 - HOIST
      ?auto_19665 - SURFACE
      ?auto_19671 - PLACE
      ?auto_19669 - HOIST
      ?auto_19646 - SURFACE
      ?auto_19657 - PLACE
      ?auto_19664 - HOIST
      ?auto_19648 - SURFACE
      ?auto_19666 - PLACE
      ?auto_19644 - HOIST
      ?auto_19651 - SURFACE
      ?auto_19643 - PLACE
      ?auto_19658 - HOIST
      ?auto_19670 - SURFACE
      ?auto_19653 - PLACE
      ?auto_19673 - HOIST
      ?auto_19660 - SURFACE
      ?auto_19667 - PLACE
      ?auto_19647 - HOIST
      ?auto_19662 - SURFACE
      ?auto_19641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19642 ?auto_19638 ) ( IS-CRATE ?auto_19636 ) ( not ( = ?auto_19637 ?auto_19638 ) ) ( HOIST-AT ?auto_19640 ?auto_19637 ) ( AVAILABLE ?auto_19640 ) ( SURFACE-AT ?auto_19636 ?auto_19637 ) ( ON ?auto_19636 ?auto_19639 ) ( CLEAR ?auto_19636 ) ( not ( = ?auto_19635 ?auto_19636 ) ) ( not ( = ?auto_19635 ?auto_19639 ) ) ( not ( = ?auto_19636 ?auto_19639 ) ) ( not ( = ?auto_19642 ?auto_19640 ) ) ( IS-CRATE ?auto_19635 ) ( not ( = ?auto_19668 ?auto_19638 ) ) ( HOIST-AT ?auto_19654 ?auto_19668 ) ( AVAILABLE ?auto_19654 ) ( SURFACE-AT ?auto_19635 ?auto_19668 ) ( ON ?auto_19635 ?auto_19663 ) ( CLEAR ?auto_19635 ) ( not ( = ?auto_19634 ?auto_19635 ) ) ( not ( = ?auto_19634 ?auto_19663 ) ) ( not ( = ?auto_19635 ?auto_19663 ) ) ( not ( = ?auto_19642 ?auto_19654 ) ) ( IS-CRATE ?auto_19634 ) ( not ( = ?auto_19655 ?auto_19638 ) ) ( HOIST-AT ?auto_19645 ?auto_19655 ) ( AVAILABLE ?auto_19645 ) ( SURFACE-AT ?auto_19634 ?auto_19655 ) ( ON ?auto_19634 ?auto_19656 ) ( CLEAR ?auto_19634 ) ( not ( = ?auto_19633 ?auto_19634 ) ) ( not ( = ?auto_19633 ?auto_19656 ) ) ( not ( = ?auto_19634 ?auto_19656 ) ) ( not ( = ?auto_19642 ?auto_19645 ) ) ( IS-CRATE ?auto_19633 ) ( not ( = ?auto_19672 ?auto_19638 ) ) ( HOIST-AT ?auto_19649 ?auto_19672 ) ( SURFACE-AT ?auto_19633 ?auto_19672 ) ( ON ?auto_19633 ?auto_19661 ) ( CLEAR ?auto_19633 ) ( not ( = ?auto_19632 ?auto_19633 ) ) ( not ( = ?auto_19632 ?auto_19661 ) ) ( not ( = ?auto_19633 ?auto_19661 ) ) ( not ( = ?auto_19642 ?auto_19649 ) ) ( IS-CRATE ?auto_19632 ) ( AVAILABLE ?auto_19649 ) ( SURFACE-AT ?auto_19632 ?auto_19672 ) ( ON ?auto_19632 ?auto_19650 ) ( CLEAR ?auto_19632 ) ( not ( = ?auto_19631 ?auto_19632 ) ) ( not ( = ?auto_19631 ?auto_19650 ) ) ( not ( = ?auto_19632 ?auto_19650 ) ) ( IS-CRATE ?auto_19631 ) ( not ( = ?auto_19659 ?auto_19638 ) ) ( HOIST-AT ?auto_19652 ?auto_19659 ) ( AVAILABLE ?auto_19652 ) ( SURFACE-AT ?auto_19631 ?auto_19659 ) ( ON ?auto_19631 ?auto_19665 ) ( CLEAR ?auto_19631 ) ( not ( = ?auto_19630 ?auto_19631 ) ) ( not ( = ?auto_19630 ?auto_19665 ) ) ( not ( = ?auto_19631 ?auto_19665 ) ) ( not ( = ?auto_19642 ?auto_19652 ) ) ( IS-CRATE ?auto_19630 ) ( not ( = ?auto_19671 ?auto_19638 ) ) ( HOIST-AT ?auto_19669 ?auto_19671 ) ( AVAILABLE ?auto_19669 ) ( SURFACE-AT ?auto_19630 ?auto_19671 ) ( ON ?auto_19630 ?auto_19646 ) ( CLEAR ?auto_19630 ) ( not ( = ?auto_19629 ?auto_19630 ) ) ( not ( = ?auto_19629 ?auto_19646 ) ) ( not ( = ?auto_19630 ?auto_19646 ) ) ( not ( = ?auto_19642 ?auto_19669 ) ) ( IS-CRATE ?auto_19629 ) ( not ( = ?auto_19657 ?auto_19638 ) ) ( HOIST-AT ?auto_19664 ?auto_19657 ) ( AVAILABLE ?auto_19664 ) ( SURFACE-AT ?auto_19629 ?auto_19657 ) ( ON ?auto_19629 ?auto_19648 ) ( CLEAR ?auto_19629 ) ( not ( = ?auto_19628 ?auto_19629 ) ) ( not ( = ?auto_19628 ?auto_19648 ) ) ( not ( = ?auto_19629 ?auto_19648 ) ) ( not ( = ?auto_19642 ?auto_19664 ) ) ( IS-CRATE ?auto_19628 ) ( not ( = ?auto_19666 ?auto_19638 ) ) ( HOIST-AT ?auto_19644 ?auto_19666 ) ( AVAILABLE ?auto_19644 ) ( SURFACE-AT ?auto_19628 ?auto_19666 ) ( ON ?auto_19628 ?auto_19651 ) ( CLEAR ?auto_19628 ) ( not ( = ?auto_19627 ?auto_19628 ) ) ( not ( = ?auto_19627 ?auto_19651 ) ) ( not ( = ?auto_19628 ?auto_19651 ) ) ( not ( = ?auto_19642 ?auto_19644 ) ) ( IS-CRATE ?auto_19627 ) ( not ( = ?auto_19643 ?auto_19638 ) ) ( HOIST-AT ?auto_19658 ?auto_19643 ) ( AVAILABLE ?auto_19658 ) ( SURFACE-AT ?auto_19627 ?auto_19643 ) ( ON ?auto_19627 ?auto_19670 ) ( CLEAR ?auto_19627 ) ( not ( = ?auto_19626 ?auto_19627 ) ) ( not ( = ?auto_19626 ?auto_19670 ) ) ( not ( = ?auto_19627 ?auto_19670 ) ) ( not ( = ?auto_19642 ?auto_19658 ) ) ( IS-CRATE ?auto_19626 ) ( not ( = ?auto_19653 ?auto_19638 ) ) ( HOIST-AT ?auto_19673 ?auto_19653 ) ( AVAILABLE ?auto_19673 ) ( SURFACE-AT ?auto_19626 ?auto_19653 ) ( ON ?auto_19626 ?auto_19660 ) ( CLEAR ?auto_19626 ) ( not ( = ?auto_19625 ?auto_19626 ) ) ( not ( = ?auto_19625 ?auto_19660 ) ) ( not ( = ?auto_19626 ?auto_19660 ) ) ( not ( = ?auto_19642 ?auto_19673 ) ) ( SURFACE-AT ?auto_19624 ?auto_19638 ) ( CLEAR ?auto_19624 ) ( IS-CRATE ?auto_19625 ) ( AVAILABLE ?auto_19642 ) ( not ( = ?auto_19667 ?auto_19638 ) ) ( HOIST-AT ?auto_19647 ?auto_19667 ) ( AVAILABLE ?auto_19647 ) ( SURFACE-AT ?auto_19625 ?auto_19667 ) ( ON ?auto_19625 ?auto_19662 ) ( CLEAR ?auto_19625 ) ( TRUCK-AT ?auto_19641 ?auto_19638 ) ( not ( = ?auto_19624 ?auto_19625 ) ) ( not ( = ?auto_19624 ?auto_19662 ) ) ( not ( = ?auto_19625 ?auto_19662 ) ) ( not ( = ?auto_19642 ?auto_19647 ) ) ( not ( = ?auto_19624 ?auto_19626 ) ) ( not ( = ?auto_19624 ?auto_19660 ) ) ( not ( = ?auto_19626 ?auto_19662 ) ) ( not ( = ?auto_19653 ?auto_19667 ) ) ( not ( = ?auto_19673 ?auto_19647 ) ) ( not ( = ?auto_19660 ?auto_19662 ) ) ( not ( = ?auto_19624 ?auto_19627 ) ) ( not ( = ?auto_19624 ?auto_19670 ) ) ( not ( = ?auto_19625 ?auto_19627 ) ) ( not ( = ?auto_19625 ?auto_19670 ) ) ( not ( = ?auto_19627 ?auto_19660 ) ) ( not ( = ?auto_19627 ?auto_19662 ) ) ( not ( = ?auto_19643 ?auto_19653 ) ) ( not ( = ?auto_19643 ?auto_19667 ) ) ( not ( = ?auto_19658 ?auto_19673 ) ) ( not ( = ?auto_19658 ?auto_19647 ) ) ( not ( = ?auto_19670 ?auto_19660 ) ) ( not ( = ?auto_19670 ?auto_19662 ) ) ( not ( = ?auto_19624 ?auto_19628 ) ) ( not ( = ?auto_19624 ?auto_19651 ) ) ( not ( = ?auto_19625 ?auto_19628 ) ) ( not ( = ?auto_19625 ?auto_19651 ) ) ( not ( = ?auto_19626 ?auto_19628 ) ) ( not ( = ?auto_19626 ?auto_19651 ) ) ( not ( = ?auto_19628 ?auto_19670 ) ) ( not ( = ?auto_19628 ?auto_19660 ) ) ( not ( = ?auto_19628 ?auto_19662 ) ) ( not ( = ?auto_19666 ?auto_19643 ) ) ( not ( = ?auto_19666 ?auto_19653 ) ) ( not ( = ?auto_19666 ?auto_19667 ) ) ( not ( = ?auto_19644 ?auto_19658 ) ) ( not ( = ?auto_19644 ?auto_19673 ) ) ( not ( = ?auto_19644 ?auto_19647 ) ) ( not ( = ?auto_19651 ?auto_19670 ) ) ( not ( = ?auto_19651 ?auto_19660 ) ) ( not ( = ?auto_19651 ?auto_19662 ) ) ( not ( = ?auto_19624 ?auto_19629 ) ) ( not ( = ?auto_19624 ?auto_19648 ) ) ( not ( = ?auto_19625 ?auto_19629 ) ) ( not ( = ?auto_19625 ?auto_19648 ) ) ( not ( = ?auto_19626 ?auto_19629 ) ) ( not ( = ?auto_19626 ?auto_19648 ) ) ( not ( = ?auto_19627 ?auto_19629 ) ) ( not ( = ?auto_19627 ?auto_19648 ) ) ( not ( = ?auto_19629 ?auto_19651 ) ) ( not ( = ?auto_19629 ?auto_19670 ) ) ( not ( = ?auto_19629 ?auto_19660 ) ) ( not ( = ?auto_19629 ?auto_19662 ) ) ( not ( = ?auto_19657 ?auto_19666 ) ) ( not ( = ?auto_19657 ?auto_19643 ) ) ( not ( = ?auto_19657 ?auto_19653 ) ) ( not ( = ?auto_19657 ?auto_19667 ) ) ( not ( = ?auto_19664 ?auto_19644 ) ) ( not ( = ?auto_19664 ?auto_19658 ) ) ( not ( = ?auto_19664 ?auto_19673 ) ) ( not ( = ?auto_19664 ?auto_19647 ) ) ( not ( = ?auto_19648 ?auto_19651 ) ) ( not ( = ?auto_19648 ?auto_19670 ) ) ( not ( = ?auto_19648 ?auto_19660 ) ) ( not ( = ?auto_19648 ?auto_19662 ) ) ( not ( = ?auto_19624 ?auto_19630 ) ) ( not ( = ?auto_19624 ?auto_19646 ) ) ( not ( = ?auto_19625 ?auto_19630 ) ) ( not ( = ?auto_19625 ?auto_19646 ) ) ( not ( = ?auto_19626 ?auto_19630 ) ) ( not ( = ?auto_19626 ?auto_19646 ) ) ( not ( = ?auto_19627 ?auto_19630 ) ) ( not ( = ?auto_19627 ?auto_19646 ) ) ( not ( = ?auto_19628 ?auto_19630 ) ) ( not ( = ?auto_19628 ?auto_19646 ) ) ( not ( = ?auto_19630 ?auto_19648 ) ) ( not ( = ?auto_19630 ?auto_19651 ) ) ( not ( = ?auto_19630 ?auto_19670 ) ) ( not ( = ?auto_19630 ?auto_19660 ) ) ( not ( = ?auto_19630 ?auto_19662 ) ) ( not ( = ?auto_19671 ?auto_19657 ) ) ( not ( = ?auto_19671 ?auto_19666 ) ) ( not ( = ?auto_19671 ?auto_19643 ) ) ( not ( = ?auto_19671 ?auto_19653 ) ) ( not ( = ?auto_19671 ?auto_19667 ) ) ( not ( = ?auto_19669 ?auto_19664 ) ) ( not ( = ?auto_19669 ?auto_19644 ) ) ( not ( = ?auto_19669 ?auto_19658 ) ) ( not ( = ?auto_19669 ?auto_19673 ) ) ( not ( = ?auto_19669 ?auto_19647 ) ) ( not ( = ?auto_19646 ?auto_19648 ) ) ( not ( = ?auto_19646 ?auto_19651 ) ) ( not ( = ?auto_19646 ?auto_19670 ) ) ( not ( = ?auto_19646 ?auto_19660 ) ) ( not ( = ?auto_19646 ?auto_19662 ) ) ( not ( = ?auto_19624 ?auto_19631 ) ) ( not ( = ?auto_19624 ?auto_19665 ) ) ( not ( = ?auto_19625 ?auto_19631 ) ) ( not ( = ?auto_19625 ?auto_19665 ) ) ( not ( = ?auto_19626 ?auto_19631 ) ) ( not ( = ?auto_19626 ?auto_19665 ) ) ( not ( = ?auto_19627 ?auto_19631 ) ) ( not ( = ?auto_19627 ?auto_19665 ) ) ( not ( = ?auto_19628 ?auto_19631 ) ) ( not ( = ?auto_19628 ?auto_19665 ) ) ( not ( = ?auto_19629 ?auto_19631 ) ) ( not ( = ?auto_19629 ?auto_19665 ) ) ( not ( = ?auto_19631 ?auto_19646 ) ) ( not ( = ?auto_19631 ?auto_19648 ) ) ( not ( = ?auto_19631 ?auto_19651 ) ) ( not ( = ?auto_19631 ?auto_19670 ) ) ( not ( = ?auto_19631 ?auto_19660 ) ) ( not ( = ?auto_19631 ?auto_19662 ) ) ( not ( = ?auto_19659 ?auto_19671 ) ) ( not ( = ?auto_19659 ?auto_19657 ) ) ( not ( = ?auto_19659 ?auto_19666 ) ) ( not ( = ?auto_19659 ?auto_19643 ) ) ( not ( = ?auto_19659 ?auto_19653 ) ) ( not ( = ?auto_19659 ?auto_19667 ) ) ( not ( = ?auto_19652 ?auto_19669 ) ) ( not ( = ?auto_19652 ?auto_19664 ) ) ( not ( = ?auto_19652 ?auto_19644 ) ) ( not ( = ?auto_19652 ?auto_19658 ) ) ( not ( = ?auto_19652 ?auto_19673 ) ) ( not ( = ?auto_19652 ?auto_19647 ) ) ( not ( = ?auto_19665 ?auto_19646 ) ) ( not ( = ?auto_19665 ?auto_19648 ) ) ( not ( = ?auto_19665 ?auto_19651 ) ) ( not ( = ?auto_19665 ?auto_19670 ) ) ( not ( = ?auto_19665 ?auto_19660 ) ) ( not ( = ?auto_19665 ?auto_19662 ) ) ( not ( = ?auto_19624 ?auto_19632 ) ) ( not ( = ?auto_19624 ?auto_19650 ) ) ( not ( = ?auto_19625 ?auto_19632 ) ) ( not ( = ?auto_19625 ?auto_19650 ) ) ( not ( = ?auto_19626 ?auto_19632 ) ) ( not ( = ?auto_19626 ?auto_19650 ) ) ( not ( = ?auto_19627 ?auto_19632 ) ) ( not ( = ?auto_19627 ?auto_19650 ) ) ( not ( = ?auto_19628 ?auto_19632 ) ) ( not ( = ?auto_19628 ?auto_19650 ) ) ( not ( = ?auto_19629 ?auto_19632 ) ) ( not ( = ?auto_19629 ?auto_19650 ) ) ( not ( = ?auto_19630 ?auto_19632 ) ) ( not ( = ?auto_19630 ?auto_19650 ) ) ( not ( = ?auto_19632 ?auto_19665 ) ) ( not ( = ?auto_19632 ?auto_19646 ) ) ( not ( = ?auto_19632 ?auto_19648 ) ) ( not ( = ?auto_19632 ?auto_19651 ) ) ( not ( = ?auto_19632 ?auto_19670 ) ) ( not ( = ?auto_19632 ?auto_19660 ) ) ( not ( = ?auto_19632 ?auto_19662 ) ) ( not ( = ?auto_19672 ?auto_19659 ) ) ( not ( = ?auto_19672 ?auto_19671 ) ) ( not ( = ?auto_19672 ?auto_19657 ) ) ( not ( = ?auto_19672 ?auto_19666 ) ) ( not ( = ?auto_19672 ?auto_19643 ) ) ( not ( = ?auto_19672 ?auto_19653 ) ) ( not ( = ?auto_19672 ?auto_19667 ) ) ( not ( = ?auto_19649 ?auto_19652 ) ) ( not ( = ?auto_19649 ?auto_19669 ) ) ( not ( = ?auto_19649 ?auto_19664 ) ) ( not ( = ?auto_19649 ?auto_19644 ) ) ( not ( = ?auto_19649 ?auto_19658 ) ) ( not ( = ?auto_19649 ?auto_19673 ) ) ( not ( = ?auto_19649 ?auto_19647 ) ) ( not ( = ?auto_19650 ?auto_19665 ) ) ( not ( = ?auto_19650 ?auto_19646 ) ) ( not ( = ?auto_19650 ?auto_19648 ) ) ( not ( = ?auto_19650 ?auto_19651 ) ) ( not ( = ?auto_19650 ?auto_19670 ) ) ( not ( = ?auto_19650 ?auto_19660 ) ) ( not ( = ?auto_19650 ?auto_19662 ) ) ( not ( = ?auto_19624 ?auto_19633 ) ) ( not ( = ?auto_19624 ?auto_19661 ) ) ( not ( = ?auto_19625 ?auto_19633 ) ) ( not ( = ?auto_19625 ?auto_19661 ) ) ( not ( = ?auto_19626 ?auto_19633 ) ) ( not ( = ?auto_19626 ?auto_19661 ) ) ( not ( = ?auto_19627 ?auto_19633 ) ) ( not ( = ?auto_19627 ?auto_19661 ) ) ( not ( = ?auto_19628 ?auto_19633 ) ) ( not ( = ?auto_19628 ?auto_19661 ) ) ( not ( = ?auto_19629 ?auto_19633 ) ) ( not ( = ?auto_19629 ?auto_19661 ) ) ( not ( = ?auto_19630 ?auto_19633 ) ) ( not ( = ?auto_19630 ?auto_19661 ) ) ( not ( = ?auto_19631 ?auto_19633 ) ) ( not ( = ?auto_19631 ?auto_19661 ) ) ( not ( = ?auto_19633 ?auto_19650 ) ) ( not ( = ?auto_19633 ?auto_19665 ) ) ( not ( = ?auto_19633 ?auto_19646 ) ) ( not ( = ?auto_19633 ?auto_19648 ) ) ( not ( = ?auto_19633 ?auto_19651 ) ) ( not ( = ?auto_19633 ?auto_19670 ) ) ( not ( = ?auto_19633 ?auto_19660 ) ) ( not ( = ?auto_19633 ?auto_19662 ) ) ( not ( = ?auto_19661 ?auto_19650 ) ) ( not ( = ?auto_19661 ?auto_19665 ) ) ( not ( = ?auto_19661 ?auto_19646 ) ) ( not ( = ?auto_19661 ?auto_19648 ) ) ( not ( = ?auto_19661 ?auto_19651 ) ) ( not ( = ?auto_19661 ?auto_19670 ) ) ( not ( = ?auto_19661 ?auto_19660 ) ) ( not ( = ?auto_19661 ?auto_19662 ) ) ( not ( = ?auto_19624 ?auto_19634 ) ) ( not ( = ?auto_19624 ?auto_19656 ) ) ( not ( = ?auto_19625 ?auto_19634 ) ) ( not ( = ?auto_19625 ?auto_19656 ) ) ( not ( = ?auto_19626 ?auto_19634 ) ) ( not ( = ?auto_19626 ?auto_19656 ) ) ( not ( = ?auto_19627 ?auto_19634 ) ) ( not ( = ?auto_19627 ?auto_19656 ) ) ( not ( = ?auto_19628 ?auto_19634 ) ) ( not ( = ?auto_19628 ?auto_19656 ) ) ( not ( = ?auto_19629 ?auto_19634 ) ) ( not ( = ?auto_19629 ?auto_19656 ) ) ( not ( = ?auto_19630 ?auto_19634 ) ) ( not ( = ?auto_19630 ?auto_19656 ) ) ( not ( = ?auto_19631 ?auto_19634 ) ) ( not ( = ?auto_19631 ?auto_19656 ) ) ( not ( = ?auto_19632 ?auto_19634 ) ) ( not ( = ?auto_19632 ?auto_19656 ) ) ( not ( = ?auto_19634 ?auto_19661 ) ) ( not ( = ?auto_19634 ?auto_19650 ) ) ( not ( = ?auto_19634 ?auto_19665 ) ) ( not ( = ?auto_19634 ?auto_19646 ) ) ( not ( = ?auto_19634 ?auto_19648 ) ) ( not ( = ?auto_19634 ?auto_19651 ) ) ( not ( = ?auto_19634 ?auto_19670 ) ) ( not ( = ?auto_19634 ?auto_19660 ) ) ( not ( = ?auto_19634 ?auto_19662 ) ) ( not ( = ?auto_19655 ?auto_19672 ) ) ( not ( = ?auto_19655 ?auto_19659 ) ) ( not ( = ?auto_19655 ?auto_19671 ) ) ( not ( = ?auto_19655 ?auto_19657 ) ) ( not ( = ?auto_19655 ?auto_19666 ) ) ( not ( = ?auto_19655 ?auto_19643 ) ) ( not ( = ?auto_19655 ?auto_19653 ) ) ( not ( = ?auto_19655 ?auto_19667 ) ) ( not ( = ?auto_19645 ?auto_19649 ) ) ( not ( = ?auto_19645 ?auto_19652 ) ) ( not ( = ?auto_19645 ?auto_19669 ) ) ( not ( = ?auto_19645 ?auto_19664 ) ) ( not ( = ?auto_19645 ?auto_19644 ) ) ( not ( = ?auto_19645 ?auto_19658 ) ) ( not ( = ?auto_19645 ?auto_19673 ) ) ( not ( = ?auto_19645 ?auto_19647 ) ) ( not ( = ?auto_19656 ?auto_19661 ) ) ( not ( = ?auto_19656 ?auto_19650 ) ) ( not ( = ?auto_19656 ?auto_19665 ) ) ( not ( = ?auto_19656 ?auto_19646 ) ) ( not ( = ?auto_19656 ?auto_19648 ) ) ( not ( = ?auto_19656 ?auto_19651 ) ) ( not ( = ?auto_19656 ?auto_19670 ) ) ( not ( = ?auto_19656 ?auto_19660 ) ) ( not ( = ?auto_19656 ?auto_19662 ) ) ( not ( = ?auto_19624 ?auto_19635 ) ) ( not ( = ?auto_19624 ?auto_19663 ) ) ( not ( = ?auto_19625 ?auto_19635 ) ) ( not ( = ?auto_19625 ?auto_19663 ) ) ( not ( = ?auto_19626 ?auto_19635 ) ) ( not ( = ?auto_19626 ?auto_19663 ) ) ( not ( = ?auto_19627 ?auto_19635 ) ) ( not ( = ?auto_19627 ?auto_19663 ) ) ( not ( = ?auto_19628 ?auto_19635 ) ) ( not ( = ?auto_19628 ?auto_19663 ) ) ( not ( = ?auto_19629 ?auto_19635 ) ) ( not ( = ?auto_19629 ?auto_19663 ) ) ( not ( = ?auto_19630 ?auto_19635 ) ) ( not ( = ?auto_19630 ?auto_19663 ) ) ( not ( = ?auto_19631 ?auto_19635 ) ) ( not ( = ?auto_19631 ?auto_19663 ) ) ( not ( = ?auto_19632 ?auto_19635 ) ) ( not ( = ?auto_19632 ?auto_19663 ) ) ( not ( = ?auto_19633 ?auto_19635 ) ) ( not ( = ?auto_19633 ?auto_19663 ) ) ( not ( = ?auto_19635 ?auto_19656 ) ) ( not ( = ?auto_19635 ?auto_19661 ) ) ( not ( = ?auto_19635 ?auto_19650 ) ) ( not ( = ?auto_19635 ?auto_19665 ) ) ( not ( = ?auto_19635 ?auto_19646 ) ) ( not ( = ?auto_19635 ?auto_19648 ) ) ( not ( = ?auto_19635 ?auto_19651 ) ) ( not ( = ?auto_19635 ?auto_19670 ) ) ( not ( = ?auto_19635 ?auto_19660 ) ) ( not ( = ?auto_19635 ?auto_19662 ) ) ( not ( = ?auto_19668 ?auto_19655 ) ) ( not ( = ?auto_19668 ?auto_19672 ) ) ( not ( = ?auto_19668 ?auto_19659 ) ) ( not ( = ?auto_19668 ?auto_19671 ) ) ( not ( = ?auto_19668 ?auto_19657 ) ) ( not ( = ?auto_19668 ?auto_19666 ) ) ( not ( = ?auto_19668 ?auto_19643 ) ) ( not ( = ?auto_19668 ?auto_19653 ) ) ( not ( = ?auto_19668 ?auto_19667 ) ) ( not ( = ?auto_19654 ?auto_19645 ) ) ( not ( = ?auto_19654 ?auto_19649 ) ) ( not ( = ?auto_19654 ?auto_19652 ) ) ( not ( = ?auto_19654 ?auto_19669 ) ) ( not ( = ?auto_19654 ?auto_19664 ) ) ( not ( = ?auto_19654 ?auto_19644 ) ) ( not ( = ?auto_19654 ?auto_19658 ) ) ( not ( = ?auto_19654 ?auto_19673 ) ) ( not ( = ?auto_19654 ?auto_19647 ) ) ( not ( = ?auto_19663 ?auto_19656 ) ) ( not ( = ?auto_19663 ?auto_19661 ) ) ( not ( = ?auto_19663 ?auto_19650 ) ) ( not ( = ?auto_19663 ?auto_19665 ) ) ( not ( = ?auto_19663 ?auto_19646 ) ) ( not ( = ?auto_19663 ?auto_19648 ) ) ( not ( = ?auto_19663 ?auto_19651 ) ) ( not ( = ?auto_19663 ?auto_19670 ) ) ( not ( = ?auto_19663 ?auto_19660 ) ) ( not ( = ?auto_19663 ?auto_19662 ) ) ( not ( = ?auto_19624 ?auto_19636 ) ) ( not ( = ?auto_19624 ?auto_19639 ) ) ( not ( = ?auto_19625 ?auto_19636 ) ) ( not ( = ?auto_19625 ?auto_19639 ) ) ( not ( = ?auto_19626 ?auto_19636 ) ) ( not ( = ?auto_19626 ?auto_19639 ) ) ( not ( = ?auto_19627 ?auto_19636 ) ) ( not ( = ?auto_19627 ?auto_19639 ) ) ( not ( = ?auto_19628 ?auto_19636 ) ) ( not ( = ?auto_19628 ?auto_19639 ) ) ( not ( = ?auto_19629 ?auto_19636 ) ) ( not ( = ?auto_19629 ?auto_19639 ) ) ( not ( = ?auto_19630 ?auto_19636 ) ) ( not ( = ?auto_19630 ?auto_19639 ) ) ( not ( = ?auto_19631 ?auto_19636 ) ) ( not ( = ?auto_19631 ?auto_19639 ) ) ( not ( = ?auto_19632 ?auto_19636 ) ) ( not ( = ?auto_19632 ?auto_19639 ) ) ( not ( = ?auto_19633 ?auto_19636 ) ) ( not ( = ?auto_19633 ?auto_19639 ) ) ( not ( = ?auto_19634 ?auto_19636 ) ) ( not ( = ?auto_19634 ?auto_19639 ) ) ( not ( = ?auto_19636 ?auto_19663 ) ) ( not ( = ?auto_19636 ?auto_19656 ) ) ( not ( = ?auto_19636 ?auto_19661 ) ) ( not ( = ?auto_19636 ?auto_19650 ) ) ( not ( = ?auto_19636 ?auto_19665 ) ) ( not ( = ?auto_19636 ?auto_19646 ) ) ( not ( = ?auto_19636 ?auto_19648 ) ) ( not ( = ?auto_19636 ?auto_19651 ) ) ( not ( = ?auto_19636 ?auto_19670 ) ) ( not ( = ?auto_19636 ?auto_19660 ) ) ( not ( = ?auto_19636 ?auto_19662 ) ) ( not ( = ?auto_19637 ?auto_19668 ) ) ( not ( = ?auto_19637 ?auto_19655 ) ) ( not ( = ?auto_19637 ?auto_19672 ) ) ( not ( = ?auto_19637 ?auto_19659 ) ) ( not ( = ?auto_19637 ?auto_19671 ) ) ( not ( = ?auto_19637 ?auto_19657 ) ) ( not ( = ?auto_19637 ?auto_19666 ) ) ( not ( = ?auto_19637 ?auto_19643 ) ) ( not ( = ?auto_19637 ?auto_19653 ) ) ( not ( = ?auto_19637 ?auto_19667 ) ) ( not ( = ?auto_19640 ?auto_19654 ) ) ( not ( = ?auto_19640 ?auto_19645 ) ) ( not ( = ?auto_19640 ?auto_19649 ) ) ( not ( = ?auto_19640 ?auto_19652 ) ) ( not ( = ?auto_19640 ?auto_19669 ) ) ( not ( = ?auto_19640 ?auto_19664 ) ) ( not ( = ?auto_19640 ?auto_19644 ) ) ( not ( = ?auto_19640 ?auto_19658 ) ) ( not ( = ?auto_19640 ?auto_19673 ) ) ( not ( = ?auto_19640 ?auto_19647 ) ) ( not ( = ?auto_19639 ?auto_19663 ) ) ( not ( = ?auto_19639 ?auto_19656 ) ) ( not ( = ?auto_19639 ?auto_19661 ) ) ( not ( = ?auto_19639 ?auto_19650 ) ) ( not ( = ?auto_19639 ?auto_19665 ) ) ( not ( = ?auto_19639 ?auto_19646 ) ) ( not ( = ?auto_19639 ?auto_19648 ) ) ( not ( = ?auto_19639 ?auto_19651 ) ) ( not ( = ?auto_19639 ?auto_19670 ) ) ( not ( = ?auto_19639 ?auto_19660 ) ) ( not ( = ?auto_19639 ?auto_19662 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_19624 ?auto_19625 ?auto_19626 ?auto_19627 ?auto_19628 ?auto_19629 ?auto_19630 ?auto_19631 ?auto_19632 ?auto_19633 ?auto_19634 ?auto_19635 )
      ( MAKE-1CRATE ?auto_19635 ?auto_19636 )
      ( MAKE-12CRATE-VERIFY ?auto_19624 ?auto_19625 ?auto_19626 ?auto_19627 ?auto_19628 ?auto_19629 ?auto_19630 ?auto_19631 ?auto_19632 ?auto_19633 ?auto_19634 ?auto_19635 ?auto_19636 ) )
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
      ?auto_19704 - SURFACE
      ?auto_19705 - SURFACE
      ?auto_19706 - SURFACE
      ?auto_19707 - SURFACE
      ?auto_19708 - SURFACE
      ?auto_19709 - SURFACE
      ?auto_19710 - SURFACE
      ?auto_19711 - SURFACE
    )
    :vars
    (
      ?auto_19716 - HOIST
      ?auto_19712 - PLACE
      ?auto_19715 - PLACE
      ?auto_19714 - HOIST
      ?auto_19713 - SURFACE
      ?auto_19749 - PLACE
      ?auto_19737 - HOIST
      ?auto_19719 - SURFACE
      ?auto_19721 - PLACE
      ?auto_19726 - HOIST
      ?auto_19724 - SURFACE
      ?auto_19723 - PLACE
      ?auto_19746 - HOIST
      ?auto_19720 - SURFACE
      ?auto_19729 - SURFACE
      ?auto_19732 - SURFACE
      ?auto_19735 - PLACE
      ?auto_19730 - HOIST
      ?auto_19739 - SURFACE
      ?auto_19725 - PLACE
      ?auto_19728 - HOIST
      ?auto_19747 - SURFACE
      ?auto_19733 - PLACE
      ?auto_19731 - HOIST
      ?auto_19748 - SURFACE
      ?auto_19738 - PLACE
      ?auto_19741 - HOIST
      ?auto_19742 - SURFACE
      ?auto_19722 - PLACE
      ?auto_19727 - HOIST
      ?auto_19743 - SURFACE
      ?auto_19744 - PLACE
      ?auto_19745 - HOIST
      ?auto_19740 - SURFACE
      ?auto_19736 - PLACE
      ?auto_19718 - HOIST
      ?auto_19734 - SURFACE
      ?auto_19717 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19716 ?auto_19712 ) ( IS-CRATE ?auto_19711 ) ( not ( = ?auto_19715 ?auto_19712 ) ) ( HOIST-AT ?auto_19714 ?auto_19715 ) ( SURFACE-AT ?auto_19711 ?auto_19715 ) ( ON ?auto_19711 ?auto_19713 ) ( CLEAR ?auto_19711 ) ( not ( = ?auto_19710 ?auto_19711 ) ) ( not ( = ?auto_19710 ?auto_19713 ) ) ( not ( = ?auto_19711 ?auto_19713 ) ) ( not ( = ?auto_19716 ?auto_19714 ) ) ( IS-CRATE ?auto_19710 ) ( not ( = ?auto_19749 ?auto_19712 ) ) ( HOIST-AT ?auto_19737 ?auto_19749 ) ( AVAILABLE ?auto_19737 ) ( SURFACE-AT ?auto_19710 ?auto_19749 ) ( ON ?auto_19710 ?auto_19719 ) ( CLEAR ?auto_19710 ) ( not ( = ?auto_19709 ?auto_19710 ) ) ( not ( = ?auto_19709 ?auto_19719 ) ) ( not ( = ?auto_19710 ?auto_19719 ) ) ( not ( = ?auto_19716 ?auto_19737 ) ) ( IS-CRATE ?auto_19709 ) ( not ( = ?auto_19721 ?auto_19712 ) ) ( HOIST-AT ?auto_19726 ?auto_19721 ) ( AVAILABLE ?auto_19726 ) ( SURFACE-AT ?auto_19709 ?auto_19721 ) ( ON ?auto_19709 ?auto_19724 ) ( CLEAR ?auto_19709 ) ( not ( = ?auto_19708 ?auto_19709 ) ) ( not ( = ?auto_19708 ?auto_19724 ) ) ( not ( = ?auto_19709 ?auto_19724 ) ) ( not ( = ?auto_19716 ?auto_19726 ) ) ( IS-CRATE ?auto_19708 ) ( not ( = ?auto_19723 ?auto_19712 ) ) ( HOIST-AT ?auto_19746 ?auto_19723 ) ( AVAILABLE ?auto_19746 ) ( SURFACE-AT ?auto_19708 ?auto_19723 ) ( ON ?auto_19708 ?auto_19720 ) ( CLEAR ?auto_19708 ) ( not ( = ?auto_19707 ?auto_19708 ) ) ( not ( = ?auto_19707 ?auto_19720 ) ) ( not ( = ?auto_19708 ?auto_19720 ) ) ( not ( = ?auto_19716 ?auto_19746 ) ) ( IS-CRATE ?auto_19707 ) ( SURFACE-AT ?auto_19707 ?auto_19715 ) ( ON ?auto_19707 ?auto_19729 ) ( CLEAR ?auto_19707 ) ( not ( = ?auto_19706 ?auto_19707 ) ) ( not ( = ?auto_19706 ?auto_19729 ) ) ( not ( = ?auto_19707 ?auto_19729 ) ) ( IS-CRATE ?auto_19706 ) ( AVAILABLE ?auto_19714 ) ( SURFACE-AT ?auto_19706 ?auto_19715 ) ( ON ?auto_19706 ?auto_19732 ) ( CLEAR ?auto_19706 ) ( not ( = ?auto_19705 ?auto_19706 ) ) ( not ( = ?auto_19705 ?auto_19732 ) ) ( not ( = ?auto_19706 ?auto_19732 ) ) ( IS-CRATE ?auto_19705 ) ( not ( = ?auto_19735 ?auto_19712 ) ) ( HOIST-AT ?auto_19730 ?auto_19735 ) ( AVAILABLE ?auto_19730 ) ( SURFACE-AT ?auto_19705 ?auto_19735 ) ( ON ?auto_19705 ?auto_19739 ) ( CLEAR ?auto_19705 ) ( not ( = ?auto_19704 ?auto_19705 ) ) ( not ( = ?auto_19704 ?auto_19739 ) ) ( not ( = ?auto_19705 ?auto_19739 ) ) ( not ( = ?auto_19716 ?auto_19730 ) ) ( IS-CRATE ?auto_19704 ) ( not ( = ?auto_19725 ?auto_19712 ) ) ( HOIST-AT ?auto_19728 ?auto_19725 ) ( AVAILABLE ?auto_19728 ) ( SURFACE-AT ?auto_19704 ?auto_19725 ) ( ON ?auto_19704 ?auto_19747 ) ( CLEAR ?auto_19704 ) ( not ( = ?auto_19703 ?auto_19704 ) ) ( not ( = ?auto_19703 ?auto_19747 ) ) ( not ( = ?auto_19704 ?auto_19747 ) ) ( not ( = ?auto_19716 ?auto_19728 ) ) ( IS-CRATE ?auto_19703 ) ( not ( = ?auto_19733 ?auto_19712 ) ) ( HOIST-AT ?auto_19731 ?auto_19733 ) ( AVAILABLE ?auto_19731 ) ( SURFACE-AT ?auto_19703 ?auto_19733 ) ( ON ?auto_19703 ?auto_19748 ) ( CLEAR ?auto_19703 ) ( not ( = ?auto_19702 ?auto_19703 ) ) ( not ( = ?auto_19702 ?auto_19748 ) ) ( not ( = ?auto_19703 ?auto_19748 ) ) ( not ( = ?auto_19716 ?auto_19731 ) ) ( IS-CRATE ?auto_19702 ) ( not ( = ?auto_19738 ?auto_19712 ) ) ( HOIST-AT ?auto_19741 ?auto_19738 ) ( AVAILABLE ?auto_19741 ) ( SURFACE-AT ?auto_19702 ?auto_19738 ) ( ON ?auto_19702 ?auto_19742 ) ( CLEAR ?auto_19702 ) ( not ( = ?auto_19701 ?auto_19702 ) ) ( not ( = ?auto_19701 ?auto_19742 ) ) ( not ( = ?auto_19702 ?auto_19742 ) ) ( not ( = ?auto_19716 ?auto_19741 ) ) ( IS-CRATE ?auto_19701 ) ( not ( = ?auto_19722 ?auto_19712 ) ) ( HOIST-AT ?auto_19727 ?auto_19722 ) ( AVAILABLE ?auto_19727 ) ( SURFACE-AT ?auto_19701 ?auto_19722 ) ( ON ?auto_19701 ?auto_19743 ) ( CLEAR ?auto_19701 ) ( not ( = ?auto_19700 ?auto_19701 ) ) ( not ( = ?auto_19700 ?auto_19743 ) ) ( not ( = ?auto_19701 ?auto_19743 ) ) ( not ( = ?auto_19716 ?auto_19727 ) ) ( IS-CRATE ?auto_19700 ) ( not ( = ?auto_19744 ?auto_19712 ) ) ( HOIST-AT ?auto_19745 ?auto_19744 ) ( AVAILABLE ?auto_19745 ) ( SURFACE-AT ?auto_19700 ?auto_19744 ) ( ON ?auto_19700 ?auto_19740 ) ( CLEAR ?auto_19700 ) ( not ( = ?auto_19699 ?auto_19700 ) ) ( not ( = ?auto_19699 ?auto_19740 ) ) ( not ( = ?auto_19700 ?auto_19740 ) ) ( not ( = ?auto_19716 ?auto_19745 ) ) ( SURFACE-AT ?auto_19698 ?auto_19712 ) ( CLEAR ?auto_19698 ) ( IS-CRATE ?auto_19699 ) ( AVAILABLE ?auto_19716 ) ( not ( = ?auto_19736 ?auto_19712 ) ) ( HOIST-AT ?auto_19718 ?auto_19736 ) ( AVAILABLE ?auto_19718 ) ( SURFACE-AT ?auto_19699 ?auto_19736 ) ( ON ?auto_19699 ?auto_19734 ) ( CLEAR ?auto_19699 ) ( TRUCK-AT ?auto_19717 ?auto_19712 ) ( not ( = ?auto_19698 ?auto_19699 ) ) ( not ( = ?auto_19698 ?auto_19734 ) ) ( not ( = ?auto_19699 ?auto_19734 ) ) ( not ( = ?auto_19716 ?auto_19718 ) ) ( not ( = ?auto_19698 ?auto_19700 ) ) ( not ( = ?auto_19698 ?auto_19740 ) ) ( not ( = ?auto_19700 ?auto_19734 ) ) ( not ( = ?auto_19744 ?auto_19736 ) ) ( not ( = ?auto_19745 ?auto_19718 ) ) ( not ( = ?auto_19740 ?auto_19734 ) ) ( not ( = ?auto_19698 ?auto_19701 ) ) ( not ( = ?auto_19698 ?auto_19743 ) ) ( not ( = ?auto_19699 ?auto_19701 ) ) ( not ( = ?auto_19699 ?auto_19743 ) ) ( not ( = ?auto_19701 ?auto_19740 ) ) ( not ( = ?auto_19701 ?auto_19734 ) ) ( not ( = ?auto_19722 ?auto_19744 ) ) ( not ( = ?auto_19722 ?auto_19736 ) ) ( not ( = ?auto_19727 ?auto_19745 ) ) ( not ( = ?auto_19727 ?auto_19718 ) ) ( not ( = ?auto_19743 ?auto_19740 ) ) ( not ( = ?auto_19743 ?auto_19734 ) ) ( not ( = ?auto_19698 ?auto_19702 ) ) ( not ( = ?auto_19698 ?auto_19742 ) ) ( not ( = ?auto_19699 ?auto_19702 ) ) ( not ( = ?auto_19699 ?auto_19742 ) ) ( not ( = ?auto_19700 ?auto_19702 ) ) ( not ( = ?auto_19700 ?auto_19742 ) ) ( not ( = ?auto_19702 ?auto_19743 ) ) ( not ( = ?auto_19702 ?auto_19740 ) ) ( not ( = ?auto_19702 ?auto_19734 ) ) ( not ( = ?auto_19738 ?auto_19722 ) ) ( not ( = ?auto_19738 ?auto_19744 ) ) ( not ( = ?auto_19738 ?auto_19736 ) ) ( not ( = ?auto_19741 ?auto_19727 ) ) ( not ( = ?auto_19741 ?auto_19745 ) ) ( not ( = ?auto_19741 ?auto_19718 ) ) ( not ( = ?auto_19742 ?auto_19743 ) ) ( not ( = ?auto_19742 ?auto_19740 ) ) ( not ( = ?auto_19742 ?auto_19734 ) ) ( not ( = ?auto_19698 ?auto_19703 ) ) ( not ( = ?auto_19698 ?auto_19748 ) ) ( not ( = ?auto_19699 ?auto_19703 ) ) ( not ( = ?auto_19699 ?auto_19748 ) ) ( not ( = ?auto_19700 ?auto_19703 ) ) ( not ( = ?auto_19700 ?auto_19748 ) ) ( not ( = ?auto_19701 ?auto_19703 ) ) ( not ( = ?auto_19701 ?auto_19748 ) ) ( not ( = ?auto_19703 ?auto_19742 ) ) ( not ( = ?auto_19703 ?auto_19743 ) ) ( not ( = ?auto_19703 ?auto_19740 ) ) ( not ( = ?auto_19703 ?auto_19734 ) ) ( not ( = ?auto_19733 ?auto_19738 ) ) ( not ( = ?auto_19733 ?auto_19722 ) ) ( not ( = ?auto_19733 ?auto_19744 ) ) ( not ( = ?auto_19733 ?auto_19736 ) ) ( not ( = ?auto_19731 ?auto_19741 ) ) ( not ( = ?auto_19731 ?auto_19727 ) ) ( not ( = ?auto_19731 ?auto_19745 ) ) ( not ( = ?auto_19731 ?auto_19718 ) ) ( not ( = ?auto_19748 ?auto_19742 ) ) ( not ( = ?auto_19748 ?auto_19743 ) ) ( not ( = ?auto_19748 ?auto_19740 ) ) ( not ( = ?auto_19748 ?auto_19734 ) ) ( not ( = ?auto_19698 ?auto_19704 ) ) ( not ( = ?auto_19698 ?auto_19747 ) ) ( not ( = ?auto_19699 ?auto_19704 ) ) ( not ( = ?auto_19699 ?auto_19747 ) ) ( not ( = ?auto_19700 ?auto_19704 ) ) ( not ( = ?auto_19700 ?auto_19747 ) ) ( not ( = ?auto_19701 ?auto_19704 ) ) ( not ( = ?auto_19701 ?auto_19747 ) ) ( not ( = ?auto_19702 ?auto_19704 ) ) ( not ( = ?auto_19702 ?auto_19747 ) ) ( not ( = ?auto_19704 ?auto_19748 ) ) ( not ( = ?auto_19704 ?auto_19742 ) ) ( not ( = ?auto_19704 ?auto_19743 ) ) ( not ( = ?auto_19704 ?auto_19740 ) ) ( not ( = ?auto_19704 ?auto_19734 ) ) ( not ( = ?auto_19725 ?auto_19733 ) ) ( not ( = ?auto_19725 ?auto_19738 ) ) ( not ( = ?auto_19725 ?auto_19722 ) ) ( not ( = ?auto_19725 ?auto_19744 ) ) ( not ( = ?auto_19725 ?auto_19736 ) ) ( not ( = ?auto_19728 ?auto_19731 ) ) ( not ( = ?auto_19728 ?auto_19741 ) ) ( not ( = ?auto_19728 ?auto_19727 ) ) ( not ( = ?auto_19728 ?auto_19745 ) ) ( not ( = ?auto_19728 ?auto_19718 ) ) ( not ( = ?auto_19747 ?auto_19748 ) ) ( not ( = ?auto_19747 ?auto_19742 ) ) ( not ( = ?auto_19747 ?auto_19743 ) ) ( not ( = ?auto_19747 ?auto_19740 ) ) ( not ( = ?auto_19747 ?auto_19734 ) ) ( not ( = ?auto_19698 ?auto_19705 ) ) ( not ( = ?auto_19698 ?auto_19739 ) ) ( not ( = ?auto_19699 ?auto_19705 ) ) ( not ( = ?auto_19699 ?auto_19739 ) ) ( not ( = ?auto_19700 ?auto_19705 ) ) ( not ( = ?auto_19700 ?auto_19739 ) ) ( not ( = ?auto_19701 ?auto_19705 ) ) ( not ( = ?auto_19701 ?auto_19739 ) ) ( not ( = ?auto_19702 ?auto_19705 ) ) ( not ( = ?auto_19702 ?auto_19739 ) ) ( not ( = ?auto_19703 ?auto_19705 ) ) ( not ( = ?auto_19703 ?auto_19739 ) ) ( not ( = ?auto_19705 ?auto_19747 ) ) ( not ( = ?auto_19705 ?auto_19748 ) ) ( not ( = ?auto_19705 ?auto_19742 ) ) ( not ( = ?auto_19705 ?auto_19743 ) ) ( not ( = ?auto_19705 ?auto_19740 ) ) ( not ( = ?auto_19705 ?auto_19734 ) ) ( not ( = ?auto_19735 ?auto_19725 ) ) ( not ( = ?auto_19735 ?auto_19733 ) ) ( not ( = ?auto_19735 ?auto_19738 ) ) ( not ( = ?auto_19735 ?auto_19722 ) ) ( not ( = ?auto_19735 ?auto_19744 ) ) ( not ( = ?auto_19735 ?auto_19736 ) ) ( not ( = ?auto_19730 ?auto_19728 ) ) ( not ( = ?auto_19730 ?auto_19731 ) ) ( not ( = ?auto_19730 ?auto_19741 ) ) ( not ( = ?auto_19730 ?auto_19727 ) ) ( not ( = ?auto_19730 ?auto_19745 ) ) ( not ( = ?auto_19730 ?auto_19718 ) ) ( not ( = ?auto_19739 ?auto_19747 ) ) ( not ( = ?auto_19739 ?auto_19748 ) ) ( not ( = ?auto_19739 ?auto_19742 ) ) ( not ( = ?auto_19739 ?auto_19743 ) ) ( not ( = ?auto_19739 ?auto_19740 ) ) ( not ( = ?auto_19739 ?auto_19734 ) ) ( not ( = ?auto_19698 ?auto_19706 ) ) ( not ( = ?auto_19698 ?auto_19732 ) ) ( not ( = ?auto_19699 ?auto_19706 ) ) ( not ( = ?auto_19699 ?auto_19732 ) ) ( not ( = ?auto_19700 ?auto_19706 ) ) ( not ( = ?auto_19700 ?auto_19732 ) ) ( not ( = ?auto_19701 ?auto_19706 ) ) ( not ( = ?auto_19701 ?auto_19732 ) ) ( not ( = ?auto_19702 ?auto_19706 ) ) ( not ( = ?auto_19702 ?auto_19732 ) ) ( not ( = ?auto_19703 ?auto_19706 ) ) ( not ( = ?auto_19703 ?auto_19732 ) ) ( not ( = ?auto_19704 ?auto_19706 ) ) ( not ( = ?auto_19704 ?auto_19732 ) ) ( not ( = ?auto_19706 ?auto_19739 ) ) ( not ( = ?auto_19706 ?auto_19747 ) ) ( not ( = ?auto_19706 ?auto_19748 ) ) ( not ( = ?auto_19706 ?auto_19742 ) ) ( not ( = ?auto_19706 ?auto_19743 ) ) ( not ( = ?auto_19706 ?auto_19740 ) ) ( not ( = ?auto_19706 ?auto_19734 ) ) ( not ( = ?auto_19715 ?auto_19735 ) ) ( not ( = ?auto_19715 ?auto_19725 ) ) ( not ( = ?auto_19715 ?auto_19733 ) ) ( not ( = ?auto_19715 ?auto_19738 ) ) ( not ( = ?auto_19715 ?auto_19722 ) ) ( not ( = ?auto_19715 ?auto_19744 ) ) ( not ( = ?auto_19715 ?auto_19736 ) ) ( not ( = ?auto_19714 ?auto_19730 ) ) ( not ( = ?auto_19714 ?auto_19728 ) ) ( not ( = ?auto_19714 ?auto_19731 ) ) ( not ( = ?auto_19714 ?auto_19741 ) ) ( not ( = ?auto_19714 ?auto_19727 ) ) ( not ( = ?auto_19714 ?auto_19745 ) ) ( not ( = ?auto_19714 ?auto_19718 ) ) ( not ( = ?auto_19732 ?auto_19739 ) ) ( not ( = ?auto_19732 ?auto_19747 ) ) ( not ( = ?auto_19732 ?auto_19748 ) ) ( not ( = ?auto_19732 ?auto_19742 ) ) ( not ( = ?auto_19732 ?auto_19743 ) ) ( not ( = ?auto_19732 ?auto_19740 ) ) ( not ( = ?auto_19732 ?auto_19734 ) ) ( not ( = ?auto_19698 ?auto_19707 ) ) ( not ( = ?auto_19698 ?auto_19729 ) ) ( not ( = ?auto_19699 ?auto_19707 ) ) ( not ( = ?auto_19699 ?auto_19729 ) ) ( not ( = ?auto_19700 ?auto_19707 ) ) ( not ( = ?auto_19700 ?auto_19729 ) ) ( not ( = ?auto_19701 ?auto_19707 ) ) ( not ( = ?auto_19701 ?auto_19729 ) ) ( not ( = ?auto_19702 ?auto_19707 ) ) ( not ( = ?auto_19702 ?auto_19729 ) ) ( not ( = ?auto_19703 ?auto_19707 ) ) ( not ( = ?auto_19703 ?auto_19729 ) ) ( not ( = ?auto_19704 ?auto_19707 ) ) ( not ( = ?auto_19704 ?auto_19729 ) ) ( not ( = ?auto_19705 ?auto_19707 ) ) ( not ( = ?auto_19705 ?auto_19729 ) ) ( not ( = ?auto_19707 ?auto_19732 ) ) ( not ( = ?auto_19707 ?auto_19739 ) ) ( not ( = ?auto_19707 ?auto_19747 ) ) ( not ( = ?auto_19707 ?auto_19748 ) ) ( not ( = ?auto_19707 ?auto_19742 ) ) ( not ( = ?auto_19707 ?auto_19743 ) ) ( not ( = ?auto_19707 ?auto_19740 ) ) ( not ( = ?auto_19707 ?auto_19734 ) ) ( not ( = ?auto_19729 ?auto_19732 ) ) ( not ( = ?auto_19729 ?auto_19739 ) ) ( not ( = ?auto_19729 ?auto_19747 ) ) ( not ( = ?auto_19729 ?auto_19748 ) ) ( not ( = ?auto_19729 ?auto_19742 ) ) ( not ( = ?auto_19729 ?auto_19743 ) ) ( not ( = ?auto_19729 ?auto_19740 ) ) ( not ( = ?auto_19729 ?auto_19734 ) ) ( not ( = ?auto_19698 ?auto_19708 ) ) ( not ( = ?auto_19698 ?auto_19720 ) ) ( not ( = ?auto_19699 ?auto_19708 ) ) ( not ( = ?auto_19699 ?auto_19720 ) ) ( not ( = ?auto_19700 ?auto_19708 ) ) ( not ( = ?auto_19700 ?auto_19720 ) ) ( not ( = ?auto_19701 ?auto_19708 ) ) ( not ( = ?auto_19701 ?auto_19720 ) ) ( not ( = ?auto_19702 ?auto_19708 ) ) ( not ( = ?auto_19702 ?auto_19720 ) ) ( not ( = ?auto_19703 ?auto_19708 ) ) ( not ( = ?auto_19703 ?auto_19720 ) ) ( not ( = ?auto_19704 ?auto_19708 ) ) ( not ( = ?auto_19704 ?auto_19720 ) ) ( not ( = ?auto_19705 ?auto_19708 ) ) ( not ( = ?auto_19705 ?auto_19720 ) ) ( not ( = ?auto_19706 ?auto_19708 ) ) ( not ( = ?auto_19706 ?auto_19720 ) ) ( not ( = ?auto_19708 ?auto_19729 ) ) ( not ( = ?auto_19708 ?auto_19732 ) ) ( not ( = ?auto_19708 ?auto_19739 ) ) ( not ( = ?auto_19708 ?auto_19747 ) ) ( not ( = ?auto_19708 ?auto_19748 ) ) ( not ( = ?auto_19708 ?auto_19742 ) ) ( not ( = ?auto_19708 ?auto_19743 ) ) ( not ( = ?auto_19708 ?auto_19740 ) ) ( not ( = ?auto_19708 ?auto_19734 ) ) ( not ( = ?auto_19723 ?auto_19715 ) ) ( not ( = ?auto_19723 ?auto_19735 ) ) ( not ( = ?auto_19723 ?auto_19725 ) ) ( not ( = ?auto_19723 ?auto_19733 ) ) ( not ( = ?auto_19723 ?auto_19738 ) ) ( not ( = ?auto_19723 ?auto_19722 ) ) ( not ( = ?auto_19723 ?auto_19744 ) ) ( not ( = ?auto_19723 ?auto_19736 ) ) ( not ( = ?auto_19746 ?auto_19714 ) ) ( not ( = ?auto_19746 ?auto_19730 ) ) ( not ( = ?auto_19746 ?auto_19728 ) ) ( not ( = ?auto_19746 ?auto_19731 ) ) ( not ( = ?auto_19746 ?auto_19741 ) ) ( not ( = ?auto_19746 ?auto_19727 ) ) ( not ( = ?auto_19746 ?auto_19745 ) ) ( not ( = ?auto_19746 ?auto_19718 ) ) ( not ( = ?auto_19720 ?auto_19729 ) ) ( not ( = ?auto_19720 ?auto_19732 ) ) ( not ( = ?auto_19720 ?auto_19739 ) ) ( not ( = ?auto_19720 ?auto_19747 ) ) ( not ( = ?auto_19720 ?auto_19748 ) ) ( not ( = ?auto_19720 ?auto_19742 ) ) ( not ( = ?auto_19720 ?auto_19743 ) ) ( not ( = ?auto_19720 ?auto_19740 ) ) ( not ( = ?auto_19720 ?auto_19734 ) ) ( not ( = ?auto_19698 ?auto_19709 ) ) ( not ( = ?auto_19698 ?auto_19724 ) ) ( not ( = ?auto_19699 ?auto_19709 ) ) ( not ( = ?auto_19699 ?auto_19724 ) ) ( not ( = ?auto_19700 ?auto_19709 ) ) ( not ( = ?auto_19700 ?auto_19724 ) ) ( not ( = ?auto_19701 ?auto_19709 ) ) ( not ( = ?auto_19701 ?auto_19724 ) ) ( not ( = ?auto_19702 ?auto_19709 ) ) ( not ( = ?auto_19702 ?auto_19724 ) ) ( not ( = ?auto_19703 ?auto_19709 ) ) ( not ( = ?auto_19703 ?auto_19724 ) ) ( not ( = ?auto_19704 ?auto_19709 ) ) ( not ( = ?auto_19704 ?auto_19724 ) ) ( not ( = ?auto_19705 ?auto_19709 ) ) ( not ( = ?auto_19705 ?auto_19724 ) ) ( not ( = ?auto_19706 ?auto_19709 ) ) ( not ( = ?auto_19706 ?auto_19724 ) ) ( not ( = ?auto_19707 ?auto_19709 ) ) ( not ( = ?auto_19707 ?auto_19724 ) ) ( not ( = ?auto_19709 ?auto_19720 ) ) ( not ( = ?auto_19709 ?auto_19729 ) ) ( not ( = ?auto_19709 ?auto_19732 ) ) ( not ( = ?auto_19709 ?auto_19739 ) ) ( not ( = ?auto_19709 ?auto_19747 ) ) ( not ( = ?auto_19709 ?auto_19748 ) ) ( not ( = ?auto_19709 ?auto_19742 ) ) ( not ( = ?auto_19709 ?auto_19743 ) ) ( not ( = ?auto_19709 ?auto_19740 ) ) ( not ( = ?auto_19709 ?auto_19734 ) ) ( not ( = ?auto_19721 ?auto_19723 ) ) ( not ( = ?auto_19721 ?auto_19715 ) ) ( not ( = ?auto_19721 ?auto_19735 ) ) ( not ( = ?auto_19721 ?auto_19725 ) ) ( not ( = ?auto_19721 ?auto_19733 ) ) ( not ( = ?auto_19721 ?auto_19738 ) ) ( not ( = ?auto_19721 ?auto_19722 ) ) ( not ( = ?auto_19721 ?auto_19744 ) ) ( not ( = ?auto_19721 ?auto_19736 ) ) ( not ( = ?auto_19726 ?auto_19746 ) ) ( not ( = ?auto_19726 ?auto_19714 ) ) ( not ( = ?auto_19726 ?auto_19730 ) ) ( not ( = ?auto_19726 ?auto_19728 ) ) ( not ( = ?auto_19726 ?auto_19731 ) ) ( not ( = ?auto_19726 ?auto_19741 ) ) ( not ( = ?auto_19726 ?auto_19727 ) ) ( not ( = ?auto_19726 ?auto_19745 ) ) ( not ( = ?auto_19726 ?auto_19718 ) ) ( not ( = ?auto_19724 ?auto_19720 ) ) ( not ( = ?auto_19724 ?auto_19729 ) ) ( not ( = ?auto_19724 ?auto_19732 ) ) ( not ( = ?auto_19724 ?auto_19739 ) ) ( not ( = ?auto_19724 ?auto_19747 ) ) ( not ( = ?auto_19724 ?auto_19748 ) ) ( not ( = ?auto_19724 ?auto_19742 ) ) ( not ( = ?auto_19724 ?auto_19743 ) ) ( not ( = ?auto_19724 ?auto_19740 ) ) ( not ( = ?auto_19724 ?auto_19734 ) ) ( not ( = ?auto_19698 ?auto_19710 ) ) ( not ( = ?auto_19698 ?auto_19719 ) ) ( not ( = ?auto_19699 ?auto_19710 ) ) ( not ( = ?auto_19699 ?auto_19719 ) ) ( not ( = ?auto_19700 ?auto_19710 ) ) ( not ( = ?auto_19700 ?auto_19719 ) ) ( not ( = ?auto_19701 ?auto_19710 ) ) ( not ( = ?auto_19701 ?auto_19719 ) ) ( not ( = ?auto_19702 ?auto_19710 ) ) ( not ( = ?auto_19702 ?auto_19719 ) ) ( not ( = ?auto_19703 ?auto_19710 ) ) ( not ( = ?auto_19703 ?auto_19719 ) ) ( not ( = ?auto_19704 ?auto_19710 ) ) ( not ( = ?auto_19704 ?auto_19719 ) ) ( not ( = ?auto_19705 ?auto_19710 ) ) ( not ( = ?auto_19705 ?auto_19719 ) ) ( not ( = ?auto_19706 ?auto_19710 ) ) ( not ( = ?auto_19706 ?auto_19719 ) ) ( not ( = ?auto_19707 ?auto_19710 ) ) ( not ( = ?auto_19707 ?auto_19719 ) ) ( not ( = ?auto_19708 ?auto_19710 ) ) ( not ( = ?auto_19708 ?auto_19719 ) ) ( not ( = ?auto_19710 ?auto_19724 ) ) ( not ( = ?auto_19710 ?auto_19720 ) ) ( not ( = ?auto_19710 ?auto_19729 ) ) ( not ( = ?auto_19710 ?auto_19732 ) ) ( not ( = ?auto_19710 ?auto_19739 ) ) ( not ( = ?auto_19710 ?auto_19747 ) ) ( not ( = ?auto_19710 ?auto_19748 ) ) ( not ( = ?auto_19710 ?auto_19742 ) ) ( not ( = ?auto_19710 ?auto_19743 ) ) ( not ( = ?auto_19710 ?auto_19740 ) ) ( not ( = ?auto_19710 ?auto_19734 ) ) ( not ( = ?auto_19749 ?auto_19721 ) ) ( not ( = ?auto_19749 ?auto_19723 ) ) ( not ( = ?auto_19749 ?auto_19715 ) ) ( not ( = ?auto_19749 ?auto_19735 ) ) ( not ( = ?auto_19749 ?auto_19725 ) ) ( not ( = ?auto_19749 ?auto_19733 ) ) ( not ( = ?auto_19749 ?auto_19738 ) ) ( not ( = ?auto_19749 ?auto_19722 ) ) ( not ( = ?auto_19749 ?auto_19744 ) ) ( not ( = ?auto_19749 ?auto_19736 ) ) ( not ( = ?auto_19737 ?auto_19726 ) ) ( not ( = ?auto_19737 ?auto_19746 ) ) ( not ( = ?auto_19737 ?auto_19714 ) ) ( not ( = ?auto_19737 ?auto_19730 ) ) ( not ( = ?auto_19737 ?auto_19728 ) ) ( not ( = ?auto_19737 ?auto_19731 ) ) ( not ( = ?auto_19737 ?auto_19741 ) ) ( not ( = ?auto_19737 ?auto_19727 ) ) ( not ( = ?auto_19737 ?auto_19745 ) ) ( not ( = ?auto_19737 ?auto_19718 ) ) ( not ( = ?auto_19719 ?auto_19724 ) ) ( not ( = ?auto_19719 ?auto_19720 ) ) ( not ( = ?auto_19719 ?auto_19729 ) ) ( not ( = ?auto_19719 ?auto_19732 ) ) ( not ( = ?auto_19719 ?auto_19739 ) ) ( not ( = ?auto_19719 ?auto_19747 ) ) ( not ( = ?auto_19719 ?auto_19748 ) ) ( not ( = ?auto_19719 ?auto_19742 ) ) ( not ( = ?auto_19719 ?auto_19743 ) ) ( not ( = ?auto_19719 ?auto_19740 ) ) ( not ( = ?auto_19719 ?auto_19734 ) ) ( not ( = ?auto_19698 ?auto_19711 ) ) ( not ( = ?auto_19698 ?auto_19713 ) ) ( not ( = ?auto_19699 ?auto_19711 ) ) ( not ( = ?auto_19699 ?auto_19713 ) ) ( not ( = ?auto_19700 ?auto_19711 ) ) ( not ( = ?auto_19700 ?auto_19713 ) ) ( not ( = ?auto_19701 ?auto_19711 ) ) ( not ( = ?auto_19701 ?auto_19713 ) ) ( not ( = ?auto_19702 ?auto_19711 ) ) ( not ( = ?auto_19702 ?auto_19713 ) ) ( not ( = ?auto_19703 ?auto_19711 ) ) ( not ( = ?auto_19703 ?auto_19713 ) ) ( not ( = ?auto_19704 ?auto_19711 ) ) ( not ( = ?auto_19704 ?auto_19713 ) ) ( not ( = ?auto_19705 ?auto_19711 ) ) ( not ( = ?auto_19705 ?auto_19713 ) ) ( not ( = ?auto_19706 ?auto_19711 ) ) ( not ( = ?auto_19706 ?auto_19713 ) ) ( not ( = ?auto_19707 ?auto_19711 ) ) ( not ( = ?auto_19707 ?auto_19713 ) ) ( not ( = ?auto_19708 ?auto_19711 ) ) ( not ( = ?auto_19708 ?auto_19713 ) ) ( not ( = ?auto_19709 ?auto_19711 ) ) ( not ( = ?auto_19709 ?auto_19713 ) ) ( not ( = ?auto_19711 ?auto_19719 ) ) ( not ( = ?auto_19711 ?auto_19724 ) ) ( not ( = ?auto_19711 ?auto_19720 ) ) ( not ( = ?auto_19711 ?auto_19729 ) ) ( not ( = ?auto_19711 ?auto_19732 ) ) ( not ( = ?auto_19711 ?auto_19739 ) ) ( not ( = ?auto_19711 ?auto_19747 ) ) ( not ( = ?auto_19711 ?auto_19748 ) ) ( not ( = ?auto_19711 ?auto_19742 ) ) ( not ( = ?auto_19711 ?auto_19743 ) ) ( not ( = ?auto_19711 ?auto_19740 ) ) ( not ( = ?auto_19711 ?auto_19734 ) ) ( not ( = ?auto_19713 ?auto_19719 ) ) ( not ( = ?auto_19713 ?auto_19724 ) ) ( not ( = ?auto_19713 ?auto_19720 ) ) ( not ( = ?auto_19713 ?auto_19729 ) ) ( not ( = ?auto_19713 ?auto_19732 ) ) ( not ( = ?auto_19713 ?auto_19739 ) ) ( not ( = ?auto_19713 ?auto_19747 ) ) ( not ( = ?auto_19713 ?auto_19748 ) ) ( not ( = ?auto_19713 ?auto_19742 ) ) ( not ( = ?auto_19713 ?auto_19743 ) ) ( not ( = ?auto_19713 ?auto_19740 ) ) ( not ( = ?auto_19713 ?auto_19734 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_19698 ?auto_19699 ?auto_19700 ?auto_19701 ?auto_19702 ?auto_19703 ?auto_19704 ?auto_19705 ?auto_19706 ?auto_19707 ?auto_19708 ?auto_19709 ?auto_19710 )
      ( MAKE-1CRATE ?auto_19710 ?auto_19711 )
      ( MAKE-13CRATE-VERIFY ?auto_19698 ?auto_19699 ?auto_19700 ?auto_19701 ?auto_19702 ?auto_19703 ?auto_19704 ?auto_19705 ?auto_19706 ?auto_19707 ?auto_19708 ?auto_19709 ?auto_19710 ?auto_19711 ) )
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
      ?auto_19781 - SURFACE
      ?auto_19782 - SURFACE
      ?auto_19783 - SURFACE
      ?auto_19784 - SURFACE
      ?auto_19785 - SURFACE
      ?auto_19786 - SURFACE
      ?auto_19787 - SURFACE
      ?auto_19788 - SURFACE
      ?auto_19789 - SURFACE
    )
    :vars
    (
      ?auto_19794 - HOIST
      ?auto_19791 - PLACE
      ?auto_19793 - PLACE
      ?auto_19790 - HOIST
      ?auto_19795 - SURFACE
      ?auto_19797 - PLACE
      ?auto_19813 - HOIST
      ?auto_19799 - SURFACE
      ?auto_19827 - PLACE
      ?auto_19804 - HOIST
      ?auto_19826 - SURFACE
      ?auto_19825 - PLACE
      ?auto_19811 - HOIST
      ?auto_19807 - SURFACE
      ?auto_19801 - PLACE
      ?auto_19824 - HOIST
      ?auto_19820 - SURFACE
      ?auto_19798 - SURFACE
      ?auto_19812 - SURFACE
      ?auto_19818 - PLACE
      ?auto_19803 - HOIST
      ?auto_19819 - SURFACE
      ?auto_19810 - PLACE
      ?auto_19802 - HOIST
      ?auto_19816 - SURFACE
      ?auto_19809 - PLACE
      ?auto_19796 - HOIST
      ?auto_19823 - SURFACE
      ?auto_19814 - PLACE
      ?auto_19817 - HOIST
      ?auto_19815 - SURFACE
      ?auto_19828 - PLACE
      ?auto_19822 - HOIST
      ?auto_19800 - SURFACE
      ?auto_19806 - SURFACE
      ?auto_19805 - PLACE
      ?auto_19821 - HOIST
      ?auto_19808 - SURFACE
      ?auto_19792 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19794 ?auto_19791 ) ( IS-CRATE ?auto_19789 ) ( not ( = ?auto_19793 ?auto_19791 ) ) ( HOIST-AT ?auto_19790 ?auto_19793 ) ( SURFACE-AT ?auto_19789 ?auto_19793 ) ( ON ?auto_19789 ?auto_19795 ) ( CLEAR ?auto_19789 ) ( not ( = ?auto_19788 ?auto_19789 ) ) ( not ( = ?auto_19788 ?auto_19795 ) ) ( not ( = ?auto_19789 ?auto_19795 ) ) ( not ( = ?auto_19794 ?auto_19790 ) ) ( IS-CRATE ?auto_19788 ) ( not ( = ?auto_19797 ?auto_19791 ) ) ( HOIST-AT ?auto_19813 ?auto_19797 ) ( SURFACE-AT ?auto_19788 ?auto_19797 ) ( ON ?auto_19788 ?auto_19799 ) ( CLEAR ?auto_19788 ) ( not ( = ?auto_19787 ?auto_19788 ) ) ( not ( = ?auto_19787 ?auto_19799 ) ) ( not ( = ?auto_19788 ?auto_19799 ) ) ( not ( = ?auto_19794 ?auto_19813 ) ) ( IS-CRATE ?auto_19787 ) ( not ( = ?auto_19827 ?auto_19791 ) ) ( HOIST-AT ?auto_19804 ?auto_19827 ) ( AVAILABLE ?auto_19804 ) ( SURFACE-AT ?auto_19787 ?auto_19827 ) ( ON ?auto_19787 ?auto_19826 ) ( CLEAR ?auto_19787 ) ( not ( = ?auto_19786 ?auto_19787 ) ) ( not ( = ?auto_19786 ?auto_19826 ) ) ( not ( = ?auto_19787 ?auto_19826 ) ) ( not ( = ?auto_19794 ?auto_19804 ) ) ( IS-CRATE ?auto_19786 ) ( not ( = ?auto_19825 ?auto_19791 ) ) ( HOIST-AT ?auto_19811 ?auto_19825 ) ( AVAILABLE ?auto_19811 ) ( SURFACE-AT ?auto_19786 ?auto_19825 ) ( ON ?auto_19786 ?auto_19807 ) ( CLEAR ?auto_19786 ) ( not ( = ?auto_19785 ?auto_19786 ) ) ( not ( = ?auto_19785 ?auto_19807 ) ) ( not ( = ?auto_19786 ?auto_19807 ) ) ( not ( = ?auto_19794 ?auto_19811 ) ) ( IS-CRATE ?auto_19785 ) ( not ( = ?auto_19801 ?auto_19791 ) ) ( HOIST-AT ?auto_19824 ?auto_19801 ) ( AVAILABLE ?auto_19824 ) ( SURFACE-AT ?auto_19785 ?auto_19801 ) ( ON ?auto_19785 ?auto_19820 ) ( CLEAR ?auto_19785 ) ( not ( = ?auto_19784 ?auto_19785 ) ) ( not ( = ?auto_19784 ?auto_19820 ) ) ( not ( = ?auto_19785 ?auto_19820 ) ) ( not ( = ?auto_19794 ?auto_19824 ) ) ( IS-CRATE ?auto_19784 ) ( SURFACE-AT ?auto_19784 ?auto_19797 ) ( ON ?auto_19784 ?auto_19798 ) ( CLEAR ?auto_19784 ) ( not ( = ?auto_19783 ?auto_19784 ) ) ( not ( = ?auto_19783 ?auto_19798 ) ) ( not ( = ?auto_19784 ?auto_19798 ) ) ( IS-CRATE ?auto_19783 ) ( AVAILABLE ?auto_19813 ) ( SURFACE-AT ?auto_19783 ?auto_19797 ) ( ON ?auto_19783 ?auto_19812 ) ( CLEAR ?auto_19783 ) ( not ( = ?auto_19782 ?auto_19783 ) ) ( not ( = ?auto_19782 ?auto_19812 ) ) ( not ( = ?auto_19783 ?auto_19812 ) ) ( IS-CRATE ?auto_19782 ) ( not ( = ?auto_19818 ?auto_19791 ) ) ( HOIST-AT ?auto_19803 ?auto_19818 ) ( AVAILABLE ?auto_19803 ) ( SURFACE-AT ?auto_19782 ?auto_19818 ) ( ON ?auto_19782 ?auto_19819 ) ( CLEAR ?auto_19782 ) ( not ( = ?auto_19781 ?auto_19782 ) ) ( not ( = ?auto_19781 ?auto_19819 ) ) ( not ( = ?auto_19782 ?auto_19819 ) ) ( not ( = ?auto_19794 ?auto_19803 ) ) ( IS-CRATE ?auto_19781 ) ( not ( = ?auto_19810 ?auto_19791 ) ) ( HOIST-AT ?auto_19802 ?auto_19810 ) ( AVAILABLE ?auto_19802 ) ( SURFACE-AT ?auto_19781 ?auto_19810 ) ( ON ?auto_19781 ?auto_19816 ) ( CLEAR ?auto_19781 ) ( not ( = ?auto_19780 ?auto_19781 ) ) ( not ( = ?auto_19780 ?auto_19816 ) ) ( not ( = ?auto_19781 ?auto_19816 ) ) ( not ( = ?auto_19794 ?auto_19802 ) ) ( IS-CRATE ?auto_19780 ) ( not ( = ?auto_19809 ?auto_19791 ) ) ( HOIST-AT ?auto_19796 ?auto_19809 ) ( AVAILABLE ?auto_19796 ) ( SURFACE-AT ?auto_19780 ?auto_19809 ) ( ON ?auto_19780 ?auto_19823 ) ( CLEAR ?auto_19780 ) ( not ( = ?auto_19779 ?auto_19780 ) ) ( not ( = ?auto_19779 ?auto_19823 ) ) ( not ( = ?auto_19780 ?auto_19823 ) ) ( not ( = ?auto_19794 ?auto_19796 ) ) ( IS-CRATE ?auto_19779 ) ( not ( = ?auto_19814 ?auto_19791 ) ) ( HOIST-AT ?auto_19817 ?auto_19814 ) ( AVAILABLE ?auto_19817 ) ( SURFACE-AT ?auto_19779 ?auto_19814 ) ( ON ?auto_19779 ?auto_19815 ) ( CLEAR ?auto_19779 ) ( not ( = ?auto_19778 ?auto_19779 ) ) ( not ( = ?auto_19778 ?auto_19815 ) ) ( not ( = ?auto_19779 ?auto_19815 ) ) ( not ( = ?auto_19794 ?auto_19817 ) ) ( IS-CRATE ?auto_19778 ) ( not ( = ?auto_19828 ?auto_19791 ) ) ( HOIST-AT ?auto_19822 ?auto_19828 ) ( AVAILABLE ?auto_19822 ) ( SURFACE-AT ?auto_19778 ?auto_19828 ) ( ON ?auto_19778 ?auto_19800 ) ( CLEAR ?auto_19778 ) ( not ( = ?auto_19777 ?auto_19778 ) ) ( not ( = ?auto_19777 ?auto_19800 ) ) ( not ( = ?auto_19778 ?auto_19800 ) ) ( not ( = ?auto_19794 ?auto_19822 ) ) ( IS-CRATE ?auto_19777 ) ( AVAILABLE ?auto_19790 ) ( SURFACE-AT ?auto_19777 ?auto_19793 ) ( ON ?auto_19777 ?auto_19806 ) ( CLEAR ?auto_19777 ) ( not ( = ?auto_19776 ?auto_19777 ) ) ( not ( = ?auto_19776 ?auto_19806 ) ) ( not ( = ?auto_19777 ?auto_19806 ) ) ( SURFACE-AT ?auto_19775 ?auto_19791 ) ( CLEAR ?auto_19775 ) ( IS-CRATE ?auto_19776 ) ( AVAILABLE ?auto_19794 ) ( not ( = ?auto_19805 ?auto_19791 ) ) ( HOIST-AT ?auto_19821 ?auto_19805 ) ( AVAILABLE ?auto_19821 ) ( SURFACE-AT ?auto_19776 ?auto_19805 ) ( ON ?auto_19776 ?auto_19808 ) ( CLEAR ?auto_19776 ) ( TRUCK-AT ?auto_19792 ?auto_19791 ) ( not ( = ?auto_19775 ?auto_19776 ) ) ( not ( = ?auto_19775 ?auto_19808 ) ) ( not ( = ?auto_19776 ?auto_19808 ) ) ( not ( = ?auto_19794 ?auto_19821 ) ) ( not ( = ?auto_19775 ?auto_19777 ) ) ( not ( = ?auto_19775 ?auto_19806 ) ) ( not ( = ?auto_19777 ?auto_19808 ) ) ( not ( = ?auto_19793 ?auto_19805 ) ) ( not ( = ?auto_19790 ?auto_19821 ) ) ( not ( = ?auto_19806 ?auto_19808 ) ) ( not ( = ?auto_19775 ?auto_19778 ) ) ( not ( = ?auto_19775 ?auto_19800 ) ) ( not ( = ?auto_19776 ?auto_19778 ) ) ( not ( = ?auto_19776 ?auto_19800 ) ) ( not ( = ?auto_19778 ?auto_19806 ) ) ( not ( = ?auto_19778 ?auto_19808 ) ) ( not ( = ?auto_19828 ?auto_19793 ) ) ( not ( = ?auto_19828 ?auto_19805 ) ) ( not ( = ?auto_19822 ?auto_19790 ) ) ( not ( = ?auto_19822 ?auto_19821 ) ) ( not ( = ?auto_19800 ?auto_19806 ) ) ( not ( = ?auto_19800 ?auto_19808 ) ) ( not ( = ?auto_19775 ?auto_19779 ) ) ( not ( = ?auto_19775 ?auto_19815 ) ) ( not ( = ?auto_19776 ?auto_19779 ) ) ( not ( = ?auto_19776 ?auto_19815 ) ) ( not ( = ?auto_19777 ?auto_19779 ) ) ( not ( = ?auto_19777 ?auto_19815 ) ) ( not ( = ?auto_19779 ?auto_19800 ) ) ( not ( = ?auto_19779 ?auto_19806 ) ) ( not ( = ?auto_19779 ?auto_19808 ) ) ( not ( = ?auto_19814 ?auto_19828 ) ) ( not ( = ?auto_19814 ?auto_19793 ) ) ( not ( = ?auto_19814 ?auto_19805 ) ) ( not ( = ?auto_19817 ?auto_19822 ) ) ( not ( = ?auto_19817 ?auto_19790 ) ) ( not ( = ?auto_19817 ?auto_19821 ) ) ( not ( = ?auto_19815 ?auto_19800 ) ) ( not ( = ?auto_19815 ?auto_19806 ) ) ( not ( = ?auto_19815 ?auto_19808 ) ) ( not ( = ?auto_19775 ?auto_19780 ) ) ( not ( = ?auto_19775 ?auto_19823 ) ) ( not ( = ?auto_19776 ?auto_19780 ) ) ( not ( = ?auto_19776 ?auto_19823 ) ) ( not ( = ?auto_19777 ?auto_19780 ) ) ( not ( = ?auto_19777 ?auto_19823 ) ) ( not ( = ?auto_19778 ?auto_19780 ) ) ( not ( = ?auto_19778 ?auto_19823 ) ) ( not ( = ?auto_19780 ?auto_19815 ) ) ( not ( = ?auto_19780 ?auto_19800 ) ) ( not ( = ?auto_19780 ?auto_19806 ) ) ( not ( = ?auto_19780 ?auto_19808 ) ) ( not ( = ?auto_19809 ?auto_19814 ) ) ( not ( = ?auto_19809 ?auto_19828 ) ) ( not ( = ?auto_19809 ?auto_19793 ) ) ( not ( = ?auto_19809 ?auto_19805 ) ) ( not ( = ?auto_19796 ?auto_19817 ) ) ( not ( = ?auto_19796 ?auto_19822 ) ) ( not ( = ?auto_19796 ?auto_19790 ) ) ( not ( = ?auto_19796 ?auto_19821 ) ) ( not ( = ?auto_19823 ?auto_19815 ) ) ( not ( = ?auto_19823 ?auto_19800 ) ) ( not ( = ?auto_19823 ?auto_19806 ) ) ( not ( = ?auto_19823 ?auto_19808 ) ) ( not ( = ?auto_19775 ?auto_19781 ) ) ( not ( = ?auto_19775 ?auto_19816 ) ) ( not ( = ?auto_19776 ?auto_19781 ) ) ( not ( = ?auto_19776 ?auto_19816 ) ) ( not ( = ?auto_19777 ?auto_19781 ) ) ( not ( = ?auto_19777 ?auto_19816 ) ) ( not ( = ?auto_19778 ?auto_19781 ) ) ( not ( = ?auto_19778 ?auto_19816 ) ) ( not ( = ?auto_19779 ?auto_19781 ) ) ( not ( = ?auto_19779 ?auto_19816 ) ) ( not ( = ?auto_19781 ?auto_19823 ) ) ( not ( = ?auto_19781 ?auto_19815 ) ) ( not ( = ?auto_19781 ?auto_19800 ) ) ( not ( = ?auto_19781 ?auto_19806 ) ) ( not ( = ?auto_19781 ?auto_19808 ) ) ( not ( = ?auto_19810 ?auto_19809 ) ) ( not ( = ?auto_19810 ?auto_19814 ) ) ( not ( = ?auto_19810 ?auto_19828 ) ) ( not ( = ?auto_19810 ?auto_19793 ) ) ( not ( = ?auto_19810 ?auto_19805 ) ) ( not ( = ?auto_19802 ?auto_19796 ) ) ( not ( = ?auto_19802 ?auto_19817 ) ) ( not ( = ?auto_19802 ?auto_19822 ) ) ( not ( = ?auto_19802 ?auto_19790 ) ) ( not ( = ?auto_19802 ?auto_19821 ) ) ( not ( = ?auto_19816 ?auto_19823 ) ) ( not ( = ?auto_19816 ?auto_19815 ) ) ( not ( = ?auto_19816 ?auto_19800 ) ) ( not ( = ?auto_19816 ?auto_19806 ) ) ( not ( = ?auto_19816 ?auto_19808 ) ) ( not ( = ?auto_19775 ?auto_19782 ) ) ( not ( = ?auto_19775 ?auto_19819 ) ) ( not ( = ?auto_19776 ?auto_19782 ) ) ( not ( = ?auto_19776 ?auto_19819 ) ) ( not ( = ?auto_19777 ?auto_19782 ) ) ( not ( = ?auto_19777 ?auto_19819 ) ) ( not ( = ?auto_19778 ?auto_19782 ) ) ( not ( = ?auto_19778 ?auto_19819 ) ) ( not ( = ?auto_19779 ?auto_19782 ) ) ( not ( = ?auto_19779 ?auto_19819 ) ) ( not ( = ?auto_19780 ?auto_19782 ) ) ( not ( = ?auto_19780 ?auto_19819 ) ) ( not ( = ?auto_19782 ?auto_19816 ) ) ( not ( = ?auto_19782 ?auto_19823 ) ) ( not ( = ?auto_19782 ?auto_19815 ) ) ( not ( = ?auto_19782 ?auto_19800 ) ) ( not ( = ?auto_19782 ?auto_19806 ) ) ( not ( = ?auto_19782 ?auto_19808 ) ) ( not ( = ?auto_19818 ?auto_19810 ) ) ( not ( = ?auto_19818 ?auto_19809 ) ) ( not ( = ?auto_19818 ?auto_19814 ) ) ( not ( = ?auto_19818 ?auto_19828 ) ) ( not ( = ?auto_19818 ?auto_19793 ) ) ( not ( = ?auto_19818 ?auto_19805 ) ) ( not ( = ?auto_19803 ?auto_19802 ) ) ( not ( = ?auto_19803 ?auto_19796 ) ) ( not ( = ?auto_19803 ?auto_19817 ) ) ( not ( = ?auto_19803 ?auto_19822 ) ) ( not ( = ?auto_19803 ?auto_19790 ) ) ( not ( = ?auto_19803 ?auto_19821 ) ) ( not ( = ?auto_19819 ?auto_19816 ) ) ( not ( = ?auto_19819 ?auto_19823 ) ) ( not ( = ?auto_19819 ?auto_19815 ) ) ( not ( = ?auto_19819 ?auto_19800 ) ) ( not ( = ?auto_19819 ?auto_19806 ) ) ( not ( = ?auto_19819 ?auto_19808 ) ) ( not ( = ?auto_19775 ?auto_19783 ) ) ( not ( = ?auto_19775 ?auto_19812 ) ) ( not ( = ?auto_19776 ?auto_19783 ) ) ( not ( = ?auto_19776 ?auto_19812 ) ) ( not ( = ?auto_19777 ?auto_19783 ) ) ( not ( = ?auto_19777 ?auto_19812 ) ) ( not ( = ?auto_19778 ?auto_19783 ) ) ( not ( = ?auto_19778 ?auto_19812 ) ) ( not ( = ?auto_19779 ?auto_19783 ) ) ( not ( = ?auto_19779 ?auto_19812 ) ) ( not ( = ?auto_19780 ?auto_19783 ) ) ( not ( = ?auto_19780 ?auto_19812 ) ) ( not ( = ?auto_19781 ?auto_19783 ) ) ( not ( = ?auto_19781 ?auto_19812 ) ) ( not ( = ?auto_19783 ?auto_19819 ) ) ( not ( = ?auto_19783 ?auto_19816 ) ) ( not ( = ?auto_19783 ?auto_19823 ) ) ( not ( = ?auto_19783 ?auto_19815 ) ) ( not ( = ?auto_19783 ?auto_19800 ) ) ( not ( = ?auto_19783 ?auto_19806 ) ) ( not ( = ?auto_19783 ?auto_19808 ) ) ( not ( = ?auto_19797 ?auto_19818 ) ) ( not ( = ?auto_19797 ?auto_19810 ) ) ( not ( = ?auto_19797 ?auto_19809 ) ) ( not ( = ?auto_19797 ?auto_19814 ) ) ( not ( = ?auto_19797 ?auto_19828 ) ) ( not ( = ?auto_19797 ?auto_19793 ) ) ( not ( = ?auto_19797 ?auto_19805 ) ) ( not ( = ?auto_19813 ?auto_19803 ) ) ( not ( = ?auto_19813 ?auto_19802 ) ) ( not ( = ?auto_19813 ?auto_19796 ) ) ( not ( = ?auto_19813 ?auto_19817 ) ) ( not ( = ?auto_19813 ?auto_19822 ) ) ( not ( = ?auto_19813 ?auto_19790 ) ) ( not ( = ?auto_19813 ?auto_19821 ) ) ( not ( = ?auto_19812 ?auto_19819 ) ) ( not ( = ?auto_19812 ?auto_19816 ) ) ( not ( = ?auto_19812 ?auto_19823 ) ) ( not ( = ?auto_19812 ?auto_19815 ) ) ( not ( = ?auto_19812 ?auto_19800 ) ) ( not ( = ?auto_19812 ?auto_19806 ) ) ( not ( = ?auto_19812 ?auto_19808 ) ) ( not ( = ?auto_19775 ?auto_19784 ) ) ( not ( = ?auto_19775 ?auto_19798 ) ) ( not ( = ?auto_19776 ?auto_19784 ) ) ( not ( = ?auto_19776 ?auto_19798 ) ) ( not ( = ?auto_19777 ?auto_19784 ) ) ( not ( = ?auto_19777 ?auto_19798 ) ) ( not ( = ?auto_19778 ?auto_19784 ) ) ( not ( = ?auto_19778 ?auto_19798 ) ) ( not ( = ?auto_19779 ?auto_19784 ) ) ( not ( = ?auto_19779 ?auto_19798 ) ) ( not ( = ?auto_19780 ?auto_19784 ) ) ( not ( = ?auto_19780 ?auto_19798 ) ) ( not ( = ?auto_19781 ?auto_19784 ) ) ( not ( = ?auto_19781 ?auto_19798 ) ) ( not ( = ?auto_19782 ?auto_19784 ) ) ( not ( = ?auto_19782 ?auto_19798 ) ) ( not ( = ?auto_19784 ?auto_19812 ) ) ( not ( = ?auto_19784 ?auto_19819 ) ) ( not ( = ?auto_19784 ?auto_19816 ) ) ( not ( = ?auto_19784 ?auto_19823 ) ) ( not ( = ?auto_19784 ?auto_19815 ) ) ( not ( = ?auto_19784 ?auto_19800 ) ) ( not ( = ?auto_19784 ?auto_19806 ) ) ( not ( = ?auto_19784 ?auto_19808 ) ) ( not ( = ?auto_19798 ?auto_19812 ) ) ( not ( = ?auto_19798 ?auto_19819 ) ) ( not ( = ?auto_19798 ?auto_19816 ) ) ( not ( = ?auto_19798 ?auto_19823 ) ) ( not ( = ?auto_19798 ?auto_19815 ) ) ( not ( = ?auto_19798 ?auto_19800 ) ) ( not ( = ?auto_19798 ?auto_19806 ) ) ( not ( = ?auto_19798 ?auto_19808 ) ) ( not ( = ?auto_19775 ?auto_19785 ) ) ( not ( = ?auto_19775 ?auto_19820 ) ) ( not ( = ?auto_19776 ?auto_19785 ) ) ( not ( = ?auto_19776 ?auto_19820 ) ) ( not ( = ?auto_19777 ?auto_19785 ) ) ( not ( = ?auto_19777 ?auto_19820 ) ) ( not ( = ?auto_19778 ?auto_19785 ) ) ( not ( = ?auto_19778 ?auto_19820 ) ) ( not ( = ?auto_19779 ?auto_19785 ) ) ( not ( = ?auto_19779 ?auto_19820 ) ) ( not ( = ?auto_19780 ?auto_19785 ) ) ( not ( = ?auto_19780 ?auto_19820 ) ) ( not ( = ?auto_19781 ?auto_19785 ) ) ( not ( = ?auto_19781 ?auto_19820 ) ) ( not ( = ?auto_19782 ?auto_19785 ) ) ( not ( = ?auto_19782 ?auto_19820 ) ) ( not ( = ?auto_19783 ?auto_19785 ) ) ( not ( = ?auto_19783 ?auto_19820 ) ) ( not ( = ?auto_19785 ?auto_19798 ) ) ( not ( = ?auto_19785 ?auto_19812 ) ) ( not ( = ?auto_19785 ?auto_19819 ) ) ( not ( = ?auto_19785 ?auto_19816 ) ) ( not ( = ?auto_19785 ?auto_19823 ) ) ( not ( = ?auto_19785 ?auto_19815 ) ) ( not ( = ?auto_19785 ?auto_19800 ) ) ( not ( = ?auto_19785 ?auto_19806 ) ) ( not ( = ?auto_19785 ?auto_19808 ) ) ( not ( = ?auto_19801 ?auto_19797 ) ) ( not ( = ?auto_19801 ?auto_19818 ) ) ( not ( = ?auto_19801 ?auto_19810 ) ) ( not ( = ?auto_19801 ?auto_19809 ) ) ( not ( = ?auto_19801 ?auto_19814 ) ) ( not ( = ?auto_19801 ?auto_19828 ) ) ( not ( = ?auto_19801 ?auto_19793 ) ) ( not ( = ?auto_19801 ?auto_19805 ) ) ( not ( = ?auto_19824 ?auto_19813 ) ) ( not ( = ?auto_19824 ?auto_19803 ) ) ( not ( = ?auto_19824 ?auto_19802 ) ) ( not ( = ?auto_19824 ?auto_19796 ) ) ( not ( = ?auto_19824 ?auto_19817 ) ) ( not ( = ?auto_19824 ?auto_19822 ) ) ( not ( = ?auto_19824 ?auto_19790 ) ) ( not ( = ?auto_19824 ?auto_19821 ) ) ( not ( = ?auto_19820 ?auto_19798 ) ) ( not ( = ?auto_19820 ?auto_19812 ) ) ( not ( = ?auto_19820 ?auto_19819 ) ) ( not ( = ?auto_19820 ?auto_19816 ) ) ( not ( = ?auto_19820 ?auto_19823 ) ) ( not ( = ?auto_19820 ?auto_19815 ) ) ( not ( = ?auto_19820 ?auto_19800 ) ) ( not ( = ?auto_19820 ?auto_19806 ) ) ( not ( = ?auto_19820 ?auto_19808 ) ) ( not ( = ?auto_19775 ?auto_19786 ) ) ( not ( = ?auto_19775 ?auto_19807 ) ) ( not ( = ?auto_19776 ?auto_19786 ) ) ( not ( = ?auto_19776 ?auto_19807 ) ) ( not ( = ?auto_19777 ?auto_19786 ) ) ( not ( = ?auto_19777 ?auto_19807 ) ) ( not ( = ?auto_19778 ?auto_19786 ) ) ( not ( = ?auto_19778 ?auto_19807 ) ) ( not ( = ?auto_19779 ?auto_19786 ) ) ( not ( = ?auto_19779 ?auto_19807 ) ) ( not ( = ?auto_19780 ?auto_19786 ) ) ( not ( = ?auto_19780 ?auto_19807 ) ) ( not ( = ?auto_19781 ?auto_19786 ) ) ( not ( = ?auto_19781 ?auto_19807 ) ) ( not ( = ?auto_19782 ?auto_19786 ) ) ( not ( = ?auto_19782 ?auto_19807 ) ) ( not ( = ?auto_19783 ?auto_19786 ) ) ( not ( = ?auto_19783 ?auto_19807 ) ) ( not ( = ?auto_19784 ?auto_19786 ) ) ( not ( = ?auto_19784 ?auto_19807 ) ) ( not ( = ?auto_19786 ?auto_19820 ) ) ( not ( = ?auto_19786 ?auto_19798 ) ) ( not ( = ?auto_19786 ?auto_19812 ) ) ( not ( = ?auto_19786 ?auto_19819 ) ) ( not ( = ?auto_19786 ?auto_19816 ) ) ( not ( = ?auto_19786 ?auto_19823 ) ) ( not ( = ?auto_19786 ?auto_19815 ) ) ( not ( = ?auto_19786 ?auto_19800 ) ) ( not ( = ?auto_19786 ?auto_19806 ) ) ( not ( = ?auto_19786 ?auto_19808 ) ) ( not ( = ?auto_19825 ?auto_19801 ) ) ( not ( = ?auto_19825 ?auto_19797 ) ) ( not ( = ?auto_19825 ?auto_19818 ) ) ( not ( = ?auto_19825 ?auto_19810 ) ) ( not ( = ?auto_19825 ?auto_19809 ) ) ( not ( = ?auto_19825 ?auto_19814 ) ) ( not ( = ?auto_19825 ?auto_19828 ) ) ( not ( = ?auto_19825 ?auto_19793 ) ) ( not ( = ?auto_19825 ?auto_19805 ) ) ( not ( = ?auto_19811 ?auto_19824 ) ) ( not ( = ?auto_19811 ?auto_19813 ) ) ( not ( = ?auto_19811 ?auto_19803 ) ) ( not ( = ?auto_19811 ?auto_19802 ) ) ( not ( = ?auto_19811 ?auto_19796 ) ) ( not ( = ?auto_19811 ?auto_19817 ) ) ( not ( = ?auto_19811 ?auto_19822 ) ) ( not ( = ?auto_19811 ?auto_19790 ) ) ( not ( = ?auto_19811 ?auto_19821 ) ) ( not ( = ?auto_19807 ?auto_19820 ) ) ( not ( = ?auto_19807 ?auto_19798 ) ) ( not ( = ?auto_19807 ?auto_19812 ) ) ( not ( = ?auto_19807 ?auto_19819 ) ) ( not ( = ?auto_19807 ?auto_19816 ) ) ( not ( = ?auto_19807 ?auto_19823 ) ) ( not ( = ?auto_19807 ?auto_19815 ) ) ( not ( = ?auto_19807 ?auto_19800 ) ) ( not ( = ?auto_19807 ?auto_19806 ) ) ( not ( = ?auto_19807 ?auto_19808 ) ) ( not ( = ?auto_19775 ?auto_19787 ) ) ( not ( = ?auto_19775 ?auto_19826 ) ) ( not ( = ?auto_19776 ?auto_19787 ) ) ( not ( = ?auto_19776 ?auto_19826 ) ) ( not ( = ?auto_19777 ?auto_19787 ) ) ( not ( = ?auto_19777 ?auto_19826 ) ) ( not ( = ?auto_19778 ?auto_19787 ) ) ( not ( = ?auto_19778 ?auto_19826 ) ) ( not ( = ?auto_19779 ?auto_19787 ) ) ( not ( = ?auto_19779 ?auto_19826 ) ) ( not ( = ?auto_19780 ?auto_19787 ) ) ( not ( = ?auto_19780 ?auto_19826 ) ) ( not ( = ?auto_19781 ?auto_19787 ) ) ( not ( = ?auto_19781 ?auto_19826 ) ) ( not ( = ?auto_19782 ?auto_19787 ) ) ( not ( = ?auto_19782 ?auto_19826 ) ) ( not ( = ?auto_19783 ?auto_19787 ) ) ( not ( = ?auto_19783 ?auto_19826 ) ) ( not ( = ?auto_19784 ?auto_19787 ) ) ( not ( = ?auto_19784 ?auto_19826 ) ) ( not ( = ?auto_19785 ?auto_19787 ) ) ( not ( = ?auto_19785 ?auto_19826 ) ) ( not ( = ?auto_19787 ?auto_19807 ) ) ( not ( = ?auto_19787 ?auto_19820 ) ) ( not ( = ?auto_19787 ?auto_19798 ) ) ( not ( = ?auto_19787 ?auto_19812 ) ) ( not ( = ?auto_19787 ?auto_19819 ) ) ( not ( = ?auto_19787 ?auto_19816 ) ) ( not ( = ?auto_19787 ?auto_19823 ) ) ( not ( = ?auto_19787 ?auto_19815 ) ) ( not ( = ?auto_19787 ?auto_19800 ) ) ( not ( = ?auto_19787 ?auto_19806 ) ) ( not ( = ?auto_19787 ?auto_19808 ) ) ( not ( = ?auto_19827 ?auto_19825 ) ) ( not ( = ?auto_19827 ?auto_19801 ) ) ( not ( = ?auto_19827 ?auto_19797 ) ) ( not ( = ?auto_19827 ?auto_19818 ) ) ( not ( = ?auto_19827 ?auto_19810 ) ) ( not ( = ?auto_19827 ?auto_19809 ) ) ( not ( = ?auto_19827 ?auto_19814 ) ) ( not ( = ?auto_19827 ?auto_19828 ) ) ( not ( = ?auto_19827 ?auto_19793 ) ) ( not ( = ?auto_19827 ?auto_19805 ) ) ( not ( = ?auto_19804 ?auto_19811 ) ) ( not ( = ?auto_19804 ?auto_19824 ) ) ( not ( = ?auto_19804 ?auto_19813 ) ) ( not ( = ?auto_19804 ?auto_19803 ) ) ( not ( = ?auto_19804 ?auto_19802 ) ) ( not ( = ?auto_19804 ?auto_19796 ) ) ( not ( = ?auto_19804 ?auto_19817 ) ) ( not ( = ?auto_19804 ?auto_19822 ) ) ( not ( = ?auto_19804 ?auto_19790 ) ) ( not ( = ?auto_19804 ?auto_19821 ) ) ( not ( = ?auto_19826 ?auto_19807 ) ) ( not ( = ?auto_19826 ?auto_19820 ) ) ( not ( = ?auto_19826 ?auto_19798 ) ) ( not ( = ?auto_19826 ?auto_19812 ) ) ( not ( = ?auto_19826 ?auto_19819 ) ) ( not ( = ?auto_19826 ?auto_19816 ) ) ( not ( = ?auto_19826 ?auto_19823 ) ) ( not ( = ?auto_19826 ?auto_19815 ) ) ( not ( = ?auto_19826 ?auto_19800 ) ) ( not ( = ?auto_19826 ?auto_19806 ) ) ( not ( = ?auto_19826 ?auto_19808 ) ) ( not ( = ?auto_19775 ?auto_19788 ) ) ( not ( = ?auto_19775 ?auto_19799 ) ) ( not ( = ?auto_19776 ?auto_19788 ) ) ( not ( = ?auto_19776 ?auto_19799 ) ) ( not ( = ?auto_19777 ?auto_19788 ) ) ( not ( = ?auto_19777 ?auto_19799 ) ) ( not ( = ?auto_19778 ?auto_19788 ) ) ( not ( = ?auto_19778 ?auto_19799 ) ) ( not ( = ?auto_19779 ?auto_19788 ) ) ( not ( = ?auto_19779 ?auto_19799 ) ) ( not ( = ?auto_19780 ?auto_19788 ) ) ( not ( = ?auto_19780 ?auto_19799 ) ) ( not ( = ?auto_19781 ?auto_19788 ) ) ( not ( = ?auto_19781 ?auto_19799 ) ) ( not ( = ?auto_19782 ?auto_19788 ) ) ( not ( = ?auto_19782 ?auto_19799 ) ) ( not ( = ?auto_19783 ?auto_19788 ) ) ( not ( = ?auto_19783 ?auto_19799 ) ) ( not ( = ?auto_19784 ?auto_19788 ) ) ( not ( = ?auto_19784 ?auto_19799 ) ) ( not ( = ?auto_19785 ?auto_19788 ) ) ( not ( = ?auto_19785 ?auto_19799 ) ) ( not ( = ?auto_19786 ?auto_19788 ) ) ( not ( = ?auto_19786 ?auto_19799 ) ) ( not ( = ?auto_19788 ?auto_19826 ) ) ( not ( = ?auto_19788 ?auto_19807 ) ) ( not ( = ?auto_19788 ?auto_19820 ) ) ( not ( = ?auto_19788 ?auto_19798 ) ) ( not ( = ?auto_19788 ?auto_19812 ) ) ( not ( = ?auto_19788 ?auto_19819 ) ) ( not ( = ?auto_19788 ?auto_19816 ) ) ( not ( = ?auto_19788 ?auto_19823 ) ) ( not ( = ?auto_19788 ?auto_19815 ) ) ( not ( = ?auto_19788 ?auto_19800 ) ) ( not ( = ?auto_19788 ?auto_19806 ) ) ( not ( = ?auto_19788 ?auto_19808 ) ) ( not ( = ?auto_19799 ?auto_19826 ) ) ( not ( = ?auto_19799 ?auto_19807 ) ) ( not ( = ?auto_19799 ?auto_19820 ) ) ( not ( = ?auto_19799 ?auto_19798 ) ) ( not ( = ?auto_19799 ?auto_19812 ) ) ( not ( = ?auto_19799 ?auto_19819 ) ) ( not ( = ?auto_19799 ?auto_19816 ) ) ( not ( = ?auto_19799 ?auto_19823 ) ) ( not ( = ?auto_19799 ?auto_19815 ) ) ( not ( = ?auto_19799 ?auto_19800 ) ) ( not ( = ?auto_19799 ?auto_19806 ) ) ( not ( = ?auto_19799 ?auto_19808 ) ) ( not ( = ?auto_19775 ?auto_19789 ) ) ( not ( = ?auto_19775 ?auto_19795 ) ) ( not ( = ?auto_19776 ?auto_19789 ) ) ( not ( = ?auto_19776 ?auto_19795 ) ) ( not ( = ?auto_19777 ?auto_19789 ) ) ( not ( = ?auto_19777 ?auto_19795 ) ) ( not ( = ?auto_19778 ?auto_19789 ) ) ( not ( = ?auto_19778 ?auto_19795 ) ) ( not ( = ?auto_19779 ?auto_19789 ) ) ( not ( = ?auto_19779 ?auto_19795 ) ) ( not ( = ?auto_19780 ?auto_19789 ) ) ( not ( = ?auto_19780 ?auto_19795 ) ) ( not ( = ?auto_19781 ?auto_19789 ) ) ( not ( = ?auto_19781 ?auto_19795 ) ) ( not ( = ?auto_19782 ?auto_19789 ) ) ( not ( = ?auto_19782 ?auto_19795 ) ) ( not ( = ?auto_19783 ?auto_19789 ) ) ( not ( = ?auto_19783 ?auto_19795 ) ) ( not ( = ?auto_19784 ?auto_19789 ) ) ( not ( = ?auto_19784 ?auto_19795 ) ) ( not ( = ?auto_19785 ?auto_19789 ) ) ( not ( = ?auto_19785 ?auto_19795 ) ) ( not ( = ?auto_19786 ?auto_19789 ) ) ( not ( = ?auto_19786 ?auto_19795 ) ) ( not ( = ?auto_19787 ?auto_19789 ) ) ( not ( = ?auto_19787 ?auto_19795 ) ) ( not ( = ?auto_19789 ?auto_19799 ) ) ( not ( = ?auto_19789 ?auto_19826 ) ) ( not ( = ?auto_19789 ?auto_19807 ) ) ( not ( = ?auto_19789 ?auto_19820 ) ) ( not ( = ?auto_19789 ?auto_19798 ) ) ( not ( = ?auto_19789 ?auto_19812 ) ) ( not ( = ?auto_19789 ?auto_19819 ) ) ( not ( = ?auto_19789 ?auto_19816 ) ) ( not ( = ?auto_19789 ?auto_19823 ) ) ( not ( = ?auto_19789 ?auto_19815 ) ) ( not ( = ?auto_19789 ?auto_19800 ) ) ( not ( = ?auto_19789 ?auto_19806 ) ) ( not ( = ?auto_19789 ?auto_19808 ) ) ( not ( = ?auto_19795 ?auto_19799 ) ) ( not ( = ?auto_19795 ?auto_19826 ) ) ( not ( = ?auto_19795 ?auto_19807 ) ) ( not ( = ?auto_19795 ?auto_19820 ) ) ( not ( = ?auto_19795 ?auto_19798 ) ) ( not ( = ?auto_19795 ?auto_19812 ) ) ( not ( = ?auto_19795 ?auto_19819 ) ) ( not ( = ?auto_19795 ?auto_19816 ) ) ( not ( = ?auto_19795 ?auto_19823 ) ) ( not ( = ?auto_19795 ?auto_19815 ) ) ( not ( = ?auto_19795 ?auto_19800 ) ) ( not ( = ?auto_19795 ?auto_19806 ) ) ( not ( = ?auto_19795 ?auto_19808 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_19775 ?auto_19776 ?auto_19777 ?auto_19778 ?auto_19779 ?auto_19780 ?auto_19781 ?auto_19782 ?auto_19783 ?auto_19784 ?auto_19785 ?auto_19786 ?auto_19787 ?auto_19788 )
      ( MAKE-1CRATE ?auto_19788 ?auto_19789 )
      ( MAKE-14CRATE-VERIFY ?auto_19775 ?auto_19776 ?auto_19777 ?auto_19778 ?auto_19779 ?auto_19780 ?auto_19781 ?auto_19782 ?auto_19783 ?auto_19784 ?auto_19785 ?auto_19786 ?auto_19787 ?auto_19788 ?auto_19789 ) )
  )

)

