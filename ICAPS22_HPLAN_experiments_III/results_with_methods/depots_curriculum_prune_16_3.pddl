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
      ?auto_26182 - SURFACE
      ?auto_26183 - SURFACE
    )
    :vars
    (
      ?auto_26184 - HOIST
      ?auto_26185 - PLACE
      ?auto_26187 - PLACE
      ?auto_26188 - HOIST
      ?auto_26189 - SURFACE
      ?auto_26186 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26184 ?auto_26185 ) ( SURFACE-AT ?auto_26182 ?auto_26185 ) ( CLEAR ?auto_26182 ) ( IS-CRATE ?auto_26183 ) ( AVAILABLE ?auto_26184 ) ( not ( = ?auto_26187 ?auto_26185 ) ) ( HOIST-AT ?auto_26188 ?auto_26187 ) ( AVAILABLE ?auto_26188 ) ( SURFACE-AT ?auto_26183 ?auto_26187 ) ( ON ?auto_26183 ?auto_26189 ) ( CLEAR ?auto_26183 ) ( TRUCK-AT ?auto_26186 ?auto_26185 ) ( not ( = ?auto_26182 ?auto_26183 ) ) ( not ( = ?auto_26182 ?auto_26189 ) ) ( not ( = ?auto_26183 ?auto_26189 ) ) ( not ( = ?auto_26184 ?auto_26188 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26186 ?auto_26185 ?auto_26187 )
      ( !LIFT ?auto_26188 ?auto_26183 ?auto_26189 ?auto_26187 )
      ( !LOAD ?auto_26188 ?auto_26183 ?auto_26186 ?auto_26187 )
      ( !DRIVE ?auto_26186 ?auto_26187 ?auto_26185 )
      ( !UNLOAD ?auto_26184 ?auto_26183 ?auto_26186 ?auto_26185 )
      ( !DROP ?auto_26184 ?auto_26183 ?auto_26182 ?auto_26185 )
      ( MAKE-1CRATE-VERIFY ?auto_26182 ?auto_26183 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26203 - SURFACE
      ?auto_26204 - SURFACE
      ?auto_26205 - SURFACE
    )
    :vars
    (
      ?auto_26208 - HOIST
      ?auto_26209 - PLACE
      ?auto_26210 - PLACE
      ?auto_26211 - HOIST
      ?auto_26206 - SURFACE
      ?auto_26214 - PLACE
      ?auto_26213 - HOIST
      ?auto_26212 - SURFACE
      ?auto_26207 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26208 ?auto_26209 ) ( IS-CRATE ?auto_26205 ) ( not ( = ?auto_26210 ?auto_26209 ) ) ( HOIST-AT ?auto_26211 ?auto_26210 ) ( AVAILABLE ?auto_26211 ) ( SURFACE-AT ?auto_26205 ?auto_26210 ) ( ON ?auto_26205 ?auto_26206 ) ( CLEAR ?auto_26205 ) ( not ( = ?auto_26204 ?auto_26205 ) ) ( not ( = ?auto_26204 ?auto_26206 ) ) ( not ( = ?auto_26205 ?auto_26206 ) ) ( not ( = ?auto_26208 ?auto_26211 ) ) ( SURFACE-AT ?auto_26203 ?auto_26209 ) ( CLEAR ?auto_26203 ) ( IS-CRATE ?auto_26204 ) ( AVAILABLE ?auto_26208 ) ( not ( = ?auto_26214 ?auto_26209 ) ) ( HOIST-AT ?auto_26213 ?auto_26214 ) ( AVAILABLE ?auto_26213 ) ( SURFACE-AT ?auto_26204 ?auto_26214 ) ( ON ?auto_26204 ?auto_26212 ) ( CLEAR ?auto_26204 ) ( TRUCK-AT ?auto_26207 ?auto_26209 ) ( not ( = ?auto_26203 ?auto_26204 ) ) ( not ( = ?auto_26203 ?auto_26212 ) ) ( not ( = ?auto_26204 ?auto_26212 ) ) ( not ( = ?auto_26208 ?auto_26213 ) ) ( not ( = ?auto_26203 ?auto_26205 ) ) ( not ( = ?auto_26203 ?auto_26206 ) ) ( not ( = ?auto_26205 ?auto_26212 ) ) ( not ( = ?auto_26210 ?auto_26214 ) ) ( not ( = ?auto_26211 ?auto_26213 ) ) ( not ( = ?auto_26206 ?auto_26212 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26203 ?auto_26204 )
      ( MAKE-1CRATE ?auto_26204 ?auto_26205 )
      ( MAKE-2CRATE-VERIFY ?auto_26203 ?auto_26204 ?auto_26205 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26229 - SURFACE
      ?auto_26230 - SURFACE
      ?auto_26231 - SURFACE
      ?auto_26232 - SURFACE
    )
    :vars
    (
      ?auto_26233 - HOIST
      ?auto_26234 - PLACE
      ?auto_26238 - PLACE
      ?auto_26237 - HOIST
      ?auto_26236 - SURFACE
      ?auto_26239 - PLACE
      ?auto_26244 - HOIST
      ?auto_26242 - SURFACE
      ?auto_26240 - PLACE
      ?auto_26241 - HOIST
      ?auto_26243 - SURFACE
      ?auto_26235 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26233 ?auto_26234 ) ( IS-CRATE ?auto_26232 ) ( not ( = ?auto_26238 ?auto_26234 ) ) ( HOIST-AT ?auto_26237 ?auto_26238 ) ( AVAILABLE ?auto_26237 ) ( SURFACE-AT ?auto_26232 ?auto_26238 ) ( ON ?auto_26232 ?auto_26236 ) ( CLEAR ?auto_26232 ) ( not ( = ?auto_26231 ?auto_26232 ) ) ( not ( = ?auto_26231 ?auto_26236 ) ) ( not ( = ?auto_26232 ?auto_26236 ) ) ( not ( = ?auto_26233 ?auto_26237 ) ) ( IS-CRATE ?auto_26231 ) ( not ( = ?auto_26239 ?auto_26234 ) ) ( HOIST-AT ?auto_26244 ?auto_26239 ) ( AVAILABLE ?auto_26244 ) ( SURFACE-AT ?auto_26231 ?auto_26239 ) ( ON ?auto_26231 ?auto_26242 ) ( CLEAR ?auto_26231 ) ( not ( = ?auto_26230 ?auto_26231 ) ) ( not ( = ?auto_26230 ?auto_26242 ) ) ( not ( = ?auto_26231 ?auto_26242 ) ) ( not ( = ?auto_26233 ?auto_26244 ) ) ( SURFACE-AT ?auto_26229 ?auto_26234 ) ( CLEAR ?auto_26229 ) ( IS-CRATE ?auto_26230 ) ( AVAILABLE ?auto_26233 ) ( not ( = ?auto_26240 ?auto_26234 ) ) ( HOIST-AT ?auto_26241 ?auto_26240 ) ( AVAILABLE ?auto_26241 ) ( SURFACE-AT ?auto_26230 ?auto_26240 ) ( ON ?auto_26230 ?auto_26243 ) ( CLEAR ?auto_26230 ) ( TRUCK-AT ?auto_26235 ?auto_26234 ) ( not ( = ?auto_26229 ?auto_26230 ) ) ( not ( = ?auto_26229 ?auto_26243 ) ) ( not ( = ?auto_26230 ?auto_26243 ) ) ( not ( = ?auto_26233 ?auto_26241 ) ) ( not ( = ?auto_26229 ?auto_26231 ) ) ( not ( = ?auto_26229 ?auto_26242 ) ) ( not ( = ?auto_26231 ?auto_26243 ) ) ( not ( = ?auto_26239 ?auto_26240 ) ) ( not ( = ?auto_26244 ?auto_26241 ) ) ( not ( = ?auto_26242 ?auto_26243 ) ) ( not ( = ?auto_26229 ?auto_26232 ) ) ( not ( = ?auto_26229 ?auto_26236 ) ) ( not ( = ?auto_26230 ?auto_26232 ) ) ( not ( = ?auto_26230 ?auto_26236 ) ) ( not ( = ?auto_26232 ?auto_26242 ) ) ( not ( = ?auto_26232 ?auto_26243 ) ) ( not ( = ?auto_26238 ?auto_26239 ) ) ( not ( = ?auto_26238 ?auto_26240 ) ) ( not ( = ?auto_26237 ?auto_26244 ) ) ( not ( = ?auto_26237 ?auto_26241 ) ) ( not ( = ?auto_26236 ?auto_26242 ) ) ( not ( = ?auto_26236 ?auto_26243 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26229 ?auto_26230 ?auto_26231 )
      ( MAKE-1CRATE ?auto_26231 ?auto_26232 )
      ( MAKE-3CRATE-VERIFY ?auto_26229 ?auto_26230 ?auto_26231 ?auto_26232 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26260 - SURFACE
      ?auto_26261 - SURFACE
      ?auto_26262 - SURFACE
      ?auto_26263 - SURFACE
      ?auto_26264 - SURFACE
    )
    :vars
    (
      ?auto_26265 - HOIST
      ?auto_26266 - PLACE
      ?auto_26267 - PLACE
      ?auto_26270 - HOIST
      ?auto_26268 - SURFACE
      ?auto_26279 - PLACE
      ?auto_26271 - HOIST
      ?auto_26276 - SURFACE
      ?auto_26275 - PLACE
      ?auto_26277 - HOIST
      ?auto_26274 - SURFACE
      ?auto_26278 - PLACE
      ?auto_26273 - HOIST
      ?auto_26272 - SURFACE
      ?auto_26269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26265 ?auto_26266 ) ( IS-CRATE ?auto_26264 ) ( not ( = ?auto_26267 ?auto_26266 ) ) ( HOIST-AT ?auto_26270 ?auto_26267 ) ( AVAILABLE ?auto_26270 ) ( SURFACE-AT ?auto_26264 ?auto_26267 ) ( ON ?auto_26264 ?auto_26268 ) ( CLEAR ?auto_26264 ) ( not ( = ?auto_26263 ?auto_26264 ) ) ( not ( = ?auto_26263 ?auto_26268 ) ) ( not ( = ?auto_26264 ?auto_26268 ) ) ( not ( = ?auto_26265 ?auto_26270 ) ) ( IS-CRATE ?auto_26263 ) ( not ( = ?auto_26279 ?auto_26266 ) ) ( HOIST-AT ?auto_26271 ?auto_26279 ) ( AVAILABLE ?auto_26271 ) ( SURFACE-AT ?auto_26263 ?auto_26279 ) ( ON ?auto_26263 ?auto_26276 ) ( CLEAR ?auto_26263 ) ( not ( = ?auto_26262 ?auto_26263 ) ) ( not ( = ?auto_26262 ?auto_26276 ) ) ( not ( = ?auto_26263 ?auto_26276 ) ) ( not ( = ?auto_26265 ?auto_26271 ) ) ( IS-CRATE ?auto_26262 ) ( not ( = ?auto_26275 ?auto_26266 ) ) ( HOIST-AT ?auto_26277 ?auto_26275 ) ( AVAILABLE ?auto_26277 ) ( SURFACE-AT ?auto_26262 ?auto_26275 ) ( ON ?auto_26262 ?auto_26274 ) ( CLEAR ?auto_26262 ) ( not ( = ?auto_26261 ?auto_26262 ) ) ( not ( = ?auto_26261 ?auto_26274 ) ) ( not ( = ?auto_26262 ?auto_26274 ) ) ( not ( = ?auto_26265 ?auto_26277 ) ) ( SURFACE-AT ?auto_26260 ?auto_26266 ) ( CLEAR ?auto_26260 ) ( IS-CRATE ?auto_26261 ) ( AVAILABLE ?auto_26265 ) ( not ( = ?auto_26278 ?auto_26266 ) ) ( HOIST-AT ?auto_26273 ?auto_26278 ) ( AVAILABLE ?auto_26273 ) ( SURFACE-AT ?auto_26261 ?auto_26278 ) ( ON ?auto_26261 ?auto_26272 ) ( CLEAR ?auto_26261 ) ( TRUCK-AT ?auto_26269 ?auto_26266 ) ( not ( = ?auto_26260 ?auto_26261 ) ) ( not ( = ?auto_26260 ?auto_26272 ) ) ( not ( = ?auto_26261 ?auto_26272 ) ) ( not ( = ?auto_26265 ?auto_26273 ) ) ( not ( = ?auto_26260 ?auto_26262 ) ) ( not ( = ?auto_26260 ?auto_26274 ) ) ( not ( = ?auto_26262 ?auto_26272 ) ) ( not ( = ?auto_26275 ?auto_26278 ) ) ( not ( = ?auto_26277 ?auto_26273 ) ) ( not ( = ?auto_26274 ?auto_26272 ) ) ( not ( = ?auto_26260 ?auto_26263 ) ) ( not ( = ?auto_26260 ?auto_26276 ) ) ( not ( = ?auto_26261 ?auto_26263 ) ) ( not ( = ?auto_26261 ?auto_26276 ) ) ( not ( = ?auto_26263 ?auto_26274 ) ) ( not ( = ?auto_26263 ?auto_26272 ) ) ( not ( = ?auto_26279 ?auto_26275 ) ) ( not ( = ?auto_26279 ?auto_26278 ) ) ( not ( = ?auto_26271 ?auto_26277 ) ) ( not ( = ?auto_26271 ?auto_26273 ) ) ( not ( = ?auto_26276 ?auto_26274 ) ) ( not ( = ?auto_26276 ?auto_26272 ) ) ( not ( = ?auto_26260 ?auto_26264 ) ) ( not ( = ?auto_26260 ?auto_26268 ) ) ( not ( = ?auto_26261 ?auto_26264 ) ) ( not ( = ?auto_26261 ?auto_26268 ) ) ( not ( = ?auto_26262 ?auto_26264 ) ) ( not ( = ?auto_26262 ?auto_26268 ) ) ( not ( = ?auto_26264 ?auto_26276 ) ) ( not ( = ?auto_26264 ?auto_26274 ) ) ( not ( = ?auto_26264 ?auto_26272 ) ) ( not ( = ?auto_26267 ?auto_26279 ) ) ( not ( = ?auto_26267 ?auto_26275 ) ) ( not ( = ?auto_26267 ?auto_26278 ) ) ( not ( = ?auto_26270 ?auto_26271 ) ) ( not ( = ?auto_26270 ?auto_26277 ) ) ( not ( = ?auto_26270 ?auto_26273 ) ) ( not ( = ?auto_26268 ?auto_26276 ) ) ( not ( = ?auto_26268 ?auto_26274 ) ) ( not ( = ?auto_26268 ?auto_26272 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_26260 ?auto_26261 ?auto_26262 ?auto_26263 )
      ( MAKE-1CRATE ?auto_26263 ?auto_26264 )
      ( MAKE-4CRATE-VERIFY ?auto_26260 ?auto_26261 ?auto_26262 ?auto_26263 ?auto_26264 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26296 - SURFACE
      ?auto_26297 - SURFACE
      ?auto_26298 - SURFACE
      ?auto_26299 - SURFACE
      ?auto_26300 - SURFACE
      ?auto_26301 - SURFACE
    )
    :vars
    (
      ?auto_26303 - HOIST
      ?auto_26306 - PLACE
      ?auto_26304 - PLACE
      ?auto_26302 - HOIST
      ?auto_26305 - SURFACE
      ?auto_26315 - PLACE
      ?auto_26318 - HOIST
      ?auto_26317 - SURFACE
      ?auto_26309 - PLACE
      ?auto_26308 - HOIST
      ?auto_26313 - SURFACE
      ?auto_26319 - PLACE
      ?auto_26314 - HOIST
      ?auto_26310 - SURFACE
      ?auto_26316 - PLACE
      ?auto_26312 - HOIST
      ?auto_26311 - SURFACE
      ?auto_26307 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26303 ?auto_26306 ) ( IS-CRATE ?auto_26301 ) ( not ( = ?auto_26304 ?auto_26306 ) ) ( HOIST-AT ?auto_26302 ?auto_26304 ) ( AVAILABLE ?auto_26302 ) ( SURFACE-AT ?auto_26301 ?auto_26304 ) ( ON ?auto_26301 ?auto_26305 ) ( CLEAR ?auto_26301 ) ( not ( = ?auto_26300 ?auto_26301 ) ) ( not ( = ?auto_26300 ?auto_26305 ) ) ( not ( = ?auto_26301 ?auto_26305 ) ) ( not ( = ?auto_26303 ?auto_26302 ) ) ( IS-CRATE ?auto_26300 ) ( not ( = ?auto_26315 ?auto_26306 ) ) ( HOIST-AT ?auto_26318 ?auto_26315 ) ( AVAILABLE ?auto_26318 ) ( SURFACE-AT ?auto_26300 ?auto_26315 ) ( ON ?auto_26300 ?auto_26317 ) ( CLEAR ?auto_26300 ) ( not ( = ?auto_26299 ?auto_26300 ) ) ( not ( = ?auto_26299 ?auto_26317 ) ) ( not ( = ?auto_26300 ?auto_26317 ) ) ( not ( = ?auto_26303 ?auto_26318 ) ) ( IS-CRATE ?auto_26299 ) ( not ( = ?auto_26309 ?auto_26306 ) ) ( HOIST-AT ?auto_26308 ?auto_26309 ) ( AVAILABLE ?auto_26308 ) ( SURFACE-AT ?auto_26299 ?auto_26309 ) ( ON ?auto_26299 ?auto_26313 ) ( CLEAR ?auto_26299 ) ( not ( = ?auto_26298 ?auto_26299 ) ) ( not ( = ?auto_26298 ?auto_26313 ) ) ( not ( = ?auto_26299 ?auto_26313 ) ) ( not ( = ?auto_26303 ?auto_26308 ) ) ( IS-CRATE ?auto_26298 ) ( not ( = ?auto_26319 ?auto_26306 ) ) ( HOIST-AT ?auto_26314 ?auto_26319 ) ( AVAILABLE ?auto_26314 ) ( SURFACE-AT ?auto_26298 ?auto_26319 ) ( ON ?auto_26298 ?auto_26310 ) ( CLEAR ?auto_26298 ) ( not ( = ?auto_26297 ?auto_26298 ) ) ( not ( = ?auto_26297 ?auto_26310 ) ) ( not ( = ?auto_26298 ?auto_26310 ) ) ( not ( = ?auto_26303 ?auto_26314 ) ) ( SURFACE-AT ?auto_26296 ?auto_26306 ) ( CLEAR ?auto_26296 ) ( IS-CRATE ?auto_26297 ) ( AVAILABLE ?auto_26303 ) ( not ( = ?auto_26316 ?auto_26306 ) ) ( HOIST-AT ?auto_26312 ?auto_26316 ) ( AVAILABLE ?auto_26312 ) ( SURFACE-AT ?auto_26297 ?auto_26316 ) ( ON ?auto_26297 ?auto_26311 ) ( CLEAR ?auto_26297 ) ( TRUCK-AT ?auto_26307 ?auto_26306 ) ( not ( = ?auto_26296 ?auto_26297 ) ) ( not ( = ?auto_26296 ?auto_26311 ) ) ( not ( = ?auto_26297 ?auto_26311 ) ) ( not ( = ?auto_26303 ?auto_26312 ) ) ( not ( = ?auto_26296 ?auto_26298 ) ) ( not ( = ?auto_26296 ?auto_26310 ) ) ( not ( = ?auto_26298 ?auto_26311 ) ) ( not ( = ?auto_26319 ?auto_26316 ) ) ( not ( = ?auto_26314 ?auto_26312 ) ) ( not ( = ?auto_26310 ?auto_26311 ) ) ( not ( = ?auto_26296 ?auto_26299 ) ) ( not ( = ?auto_26296 ?auto_26313 ) ) ( not ( = ?auto_26297 ?auto_26299 ) ) ( not ( = ?auto_26297 ?auto_26313 ) ) ( not ( = ?auto_26299 ?auto_26310 ) ) ( not ( = ?auto_26299 ?auto_26311 ) ) ( not ( = ?auto_26309 ?auto_26319 ) ) ( not ( = ?auto_26309 ?auto_26316 ) ) ( not ( = ?auto_26308 ?auto_26314 ) ) ( not ( = ?auto_26308 ?auto_26312 ) ) ( not ( = ?auto_26313 ?auto_26310 ) ) ( not ( = ?auto_26313 ?auto_26311 ) ) ( not ( = ?auto_26296 ?auto_26300 ) ) ( not ( = ?auto_26296 ?auto_26317 ) ) ( not ( = ?auto_26297 ?auto_26300 ) ) ( not ( = ?auto_26297 ?auto_26317 ) ) ( not ( = ?auto_26298 ?auto_26300 ) ) ( not ( = ?auto_26298 ?auto_26317 ) ) ( not ( = ?auto_26300 ?auto_26313 ) ) ( not ( = ?auto_26300 ?auto_26310 ) ) ( not ( = ?auto_26300 ?auto_26311 ) ) ( not ( = ?auto_26315 ?auto_26309 ) ) ( not ( = ?auto_26315 ?auto_26319 ) ) ( not ( = ?auto_26315 ?auto_26316 ) ) ( not ( = ?auto_26318 ?auto_26308 ) ) ( not ( = ?auto_26318 ?auto_26314 ) ) ( not ( = ?auto_26318 ?auto_26312 ) ) ( not ( = ?auto_26317 ?auto_26313 ) ) ( not ( = ?auto_26317 ?auto_26310 ) ) ( not ( = ?auto_26317 ?auto_26311 ) ) ( not ( = ?auto_26296 ?auto_26301 ) ) ( not ( = ?auto_26296 ?auto_26305 ) ) ( not ( = ?auto_26297 ?auto_26301 ) ) ( not ( = ?auto_26297 ?auto_26305 ) ) ( not ( = ?auto_26298 ?auto_26301 ) ) ( not ( = ?auto_26298 ?auto_26305 ) ) ( not ( = ?auto_26299 ?auto_26301 ) ) ( not ( = ?auto_26299 ?auto_26305 ) ) ( not ( = ?auto_26301 ?auto_26317 ) ) ( not ( = ?auto_26301 ?auto_26313 ) ) ( not ( = ?auto_26301 ?auto_26310 ) ) ( not ( = ?auto_26301 ?auto_26311 ) ) ( not ( = ?auto_26304 ?auto_26315 ) ) ( not ( = ?auto_26304 ?auto_26309 ) ) ( not ( = ?auto_26304 ?auto_26319 ) ) ( not ( = ?auto_26304 ?auto_26316 ) ) ( not ( = ?auto_26302 ?auto_26318 ) ) ( not ( = ?auto_26302 ?auto_26308 ) ) ( not ( = ?auto_26302 ?auto_26314 ) ) ( not ( = ?auto_26302 ?auto_26312 ) ) ( not ( = ?auto_26305 ?auto_26317 ) ) ( not ( = ?auto_26305 ?auto_26313 ) ) ( not ( = ?auto_26305 ?auto_26310 ) ) ( not ( = ?auto_26305 ?auto_26311 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_26296 ?auto_26297 ?auto_26298 ?auto_26299 ?auto_26300 )
      ( MAKE-1CRATE ?auto_26300 ?auto_26301 )
      ( MAKE-5CRATE-VERIFY ?auto_26296 ?auto_26297 ?auto_26298 ?auto_26299 ?auto_26300 ?auto_26301 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_26337 - SURFACE
      ?auto_26338 - SURFACE
      ?auto_26339 - SURFACE
      ?auto_26340 - SURFACE
      ?auto_26341 - SURFACE
      ?auto_26342 - SURFACE
      ?auto_26343 - SURFACE
    )
    :vars
    (
      ?auto_26344 - HOIST
      ?auto_26346 - PLACE
      ?auto_26347 - PLACE
      ?auto_26345 - HOIST
      ?auto_26349 - SURFACE
      ?auto_26357 - PLACE
      ?auto_26358 - HOIST
      ?auto_26356 - SURFACE
      ?auto_26353 - PLACE
      ?auto_26362 - HOIST
      ?auto_26351 - SURFACE
      ?auto_26359 - PLACE
      ?auto_26364 - HOIST
      ?auto_26355 - SURFACE
      ?auto_26352 - PLACE
      ?auto_26354 - HOIST
      ?auto_26363 - SURFACE
      ?auto_26350 - PLACE
      ?auto_26361 - HOIST
      ?auto_26360 - SURFACE
      ?auto_26348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26344 ?auto_26346 ) ( IS-CRATE ?auto_26343 ) ( not ( = ?auto_26347 ?auto_26346 ) ) ( HOIST-AT ?auto_26345 ?auto_26347 ) ( AVAILABLE ?auto_26345 ) ( SURFACE-AT ?auto_26343 ?auto_26347 ) ( ON ?auto_26343 ?auto_26349 ) ( CLEAR ?auto_26343 ) ( not ( = ?auto_26342 ?auto_26343 ) ) ( not ( = ?auto_26342 ?auto_26349 ) ) ( not ( = ?auto_26343 ?auto_26349 ) ) ( not ( = ?auto_26344 ?auto_26345 ) ) ( IS-CRATE ?auto_26342 ) ( not ( = ?auto_26357 ?auto_26346 ) ) ( HOIST-AT ?auto_26358 ?auto_26357 ) ( AVAILABLE ?auto_26358 ) ( SURFACE-AT ?auto_26342 ?auto_26357 ) ( ON ?auto_26342 ?auto_26356 ) ( CLEAR ?auto_26342 ) ( not ( = ?auto_26341 ?auto_26342 ) ) ( not ( = ?auto_26341 ?auto_26356 ) ) ( not ( = ?auto_26342 ?auto_26356 ) ) ( not ( = ?auto_26344 ?auto_26358 ) ) ( IS-CRATE ?auto_26341 ) ( not ( = ?auto_26353 ?auto_26346 ) ) ( HOIST-AT ?auto_26362 ?auto_26353 ) ( AVAILABLE ?auto_26362 ) ( SURFACE-AT ?auto_26341 ?auto_26353 ) ( ON ?auto_26341 ?auto_26351 ) ( CLEAR ?auto_26341 ) ( not ( = ?auto_26340 ?auto_26341 ) ) ( not ( = ?auto_26340 ?auto_26351 ) ) ( not ( = ?auto_26341 ?auto_26351 ) ) ( not ( = ?auto_26344 ?auto_26362 ) ) ( IS-CRATE ?auto_26340 ) ( not ( = ?auto_26359 ?auto_26346 ) ) ( HOIST-AT ?auto_26364 ?auto_26359 ) ( AVAILABLE ?auto_26364 ) ( SURFACE-AT ?auto_26340 ?auto_26359 ) ( ON ?auto_26340 ?auto_26355 ) ( CLEAR ?auto_26340 ) ( not ( = ?auto_26339 ?auto_26340 ) ) ( not ( = ?auto_26339 ?auto_26355 ) ) ( not ( = ?auto_26340 ?auto_26355 ) ) ( not ( = ?auto_26344 ?auto_26364 ) ) ( IS-CRATE ?auto_26339 ) ( not ( = ?auto_26352 ?auto_26346 ) ) ( HOIST-AT ?auto_26354 ?auto_26352 ) ( AVAILABLE ?auto_26354 ) ( SURFACE-AT ?auto_26339 ?auto_26352 ) ( ON ?auto_26339 ?auto_26363 ) ( CLEAR ?auto_26339 ) ( not ( = ?auto_26338 ?auto_26339 ) ) ( not ( = ?auto_26338 ?auto_26363 ) ) ( not ( = ?auto_26339 ?auto_26363 ) ) ( not ( = ?auto_26344 ?auto_26354 ) ) ( SURFACE-AT ?auto_26337 ?auto_26346 ) ( CLEAR ?auto_26337 ) ( IS-CRATE ?auto_26338 ) ( AVAILABLE ?auto_26344 ) ( not ( = ?auto_26350 ?auto_26346 ) ) ( HOIST-AT ?auto_26361 ?auto_26350 ) ( AVAILABLE ?auto_26361 ) ( SURFACE-AT ?auto_26338 ?auto_26350 ) ( ON ?auto_26338 ?auto_26360 ) ( CLEAR ?auto_26338 ) ( TRUCK-AT ?auto_26348 ?auto_26346 ) ( not ( = ?auto_26337 ?auto_26338 ) ) ( not ( = ?auto_26337 ?auto_26360 ) ) ( not ( = ?auto_26338 ?auto_26360 ) ) ( not ( = ?auto_26344 ?auto_26361 ) ) ( not ( = ?auto_26337 ?auto_26339 ) ) ( not ( = ?auto_26337 ?auto_26363 ) ) ( not ( = ?auto_26339 ?auto_26360 ) ) ( not ( = ?auto_26352 ?auto_26350 ) ) ( not ( = ?auto_26354 ?auto_26361 ) ) ( not ( = ?auto_26363 ?auto_26360 ) ) ( not ( = ?auto_26337 ?auto_26340 ) ) ( not ( = ?auto_26337 ?auto_26355 ) ) ( not ( = ?auto_26338 ?auto_26340 ) ) ( not ( = ?auto_26338 ?auto_26355 ) ) ( not ( = ?auto_26340 ?auto_26363 ) ) ( not ( = ?auto_26340 ?auto_26360 ) ) ( not ( = ?auto_26359 ?auto_26352 ) ) ( not ( = ?auto_26359 ?auto_26350 ) ) ( not ( = ?auto_26364 ?auto_26354 ) ) ( not ( = ?auto_26364 ?auto_26361 ) ) ( not ( = ?auto_26355 ?auto_26363 ) ) ( not ( = ?auto_26355 ?auto_26360 ) ) ( not ( = ?auto_26337 ?auto_26341 ) ) ( not ( = ?auto_26337 ?auto_26351 ) ) ( not ( = ?auto_26338 ?auto_26341 ) ) ( not ( = ?auto_26338 ?auto_26351 ) ) ( not ( = ?auto_26339 ?auto_26341 ) ) ( not ( = ?auto_26339 ?auto_26351 ) ) ( not ( = ?auto_26341 ?auto_26355 ) ) ( not ( = ?auto_26341 ?auto_26363 ) ) ( not ( = ?auto_26341 ?auto_26360 ) ) ( not ( = ?auto_26353 ?auto_26359 ) ) ( not ( = ?auto_26353 ?auto_26352 ) ) ( not ( = ?auto_26353 ?auto_26350 ) ) ( not ( = ?auto_26362 ?auto_26364 ) ) ( not ( = ?auto_26362 ?auto_26354 ) ) ( not ( = ?auto_26362 ?auto_26361 ) ) ( not ( = ?auto_26351 ?auto_26355 ) ) ( not ( = ?auto_26351 ?auto_26363 ) ) ( not ( = ?auto_26351 ?auto_26360 ) ) ( not ( = ?auto_26337 ?auto_26342 ) ) ( not ( = ?auto_26337 ?auto_26356 ) ) ( not ( = ?auto_26338 ?auto_26342 ) ) ( not ( = ?auto_26338 ?auto_26356 ) ) ( not ( = ?auto_26339 ?auto_26342 ) ) ( not ( = ?auto_26339 ?auto_26356 ) ) ( not ( = ?auto_26340 ?auto_26342 ) ) ( not ( = ?auto_26340 ?auto_26356 ) ) ( not ( = ?auto_26342 ?auto_26351 ) ) ( not ( = ?auto_26342 ?auto_26355 ) ) ( not ( = ?auto_26342 ?auto_26363 ) ) ( not ( = ?auto_26342 ?auto_26360 ) ) ( not ( = ?auto_26357 ?auto_26353 ) ) ( not ( = ?auto_26357 ?auto_26359 ) ) ( not ( = ?auto_26357 ?auto_26352 ) ) ( not ( = ?auto_26357 ?auto_26350 ) ) ( not ( = ?auto_26358 ?auto_26362 ) ) ( not ( = ?auto_26358 ?auto_26364 ) ) ( not ( = ?auto_26358 ?auto_26354 ) ) ( not ( = ?auto_26358 ?auto_26361 ) ) ( not ( = ?auto_26356 ?auto_26351 ) ) ( not ( = ?auto_26356 ?auto_26355 ) ) ( not ( = ?auto_26356 ?auto_26363 ) ) ( not ( = ?auto_26356 ?auto_26360 ) ) ( not ( = ?auto_26337 ?auto_26343 ) ) ( not ( = ?auto_26337 ?auto_26349 ) ) ( not ( = ?auto_26338 ?auto_26343 ) ) ( not ( = ?auto_26338 ?auto_26349 ) ) ( not ( = ?auto_26339 ?auto_26343 ) ) ( not ( = ?auto_26339 ?auto_26349 ) ) ( not ( = ?auto_26340 ?auto_26343 ) ) ( not ( = ?auto_26340 ?auto_26349 ) ) ( not ( = ?auto_26341 ?auto_26343 ) ) ( not ( = ?auto_26341 ?auto_26349 ) ) ( not ( = ?auto_26343 ?auto_26356 ) ) ( not ( = ?auto_26343 ?auto_26351 ) ) ( not ( = ?auto_26343 ?auto_26355 ) ) ( not ( = ?auto_26343 ?auto_26363 ) ) ( not ( = ?auto_26343 ?auto_26360 ) ) ( not ( = ?auto_26347 ?auto_26357 ) ) ( not ( = ?auto_26347 ?auto_26353 ) ) ( not ( = ?auto_26347 ?auto_26359 ) ) ( not ( = ?auto_26347 ?auto_26352 ) ) ( not ( = ?auto_26347 ?auto_26350 ) ) ( not ( = ?auto_26345 ?auto_26358 ) ) ( not ( = ?auto_26345 ?auto_26362 ) ) ( not ( = ?auto_26345 ?auto_26364 ) ) ( not ( = ?auto_26345 ?auto_26354 ) ) ( not ( = ?auto_26345 ?auto_26361 ) ) ( not ( = ?auto_26349 ?auto_26356 ) ) ( not ( = ?auto_26349 ?auto_26351 ) ) ( not ( = ?auto_26349 ?auto_26355 ) ) ( not ( = ?auto_26349 ?auto_26363 ) ) ( not ( = ?auto_26349 ?auto_26360 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_26337 ?auto_26338 ?auto_26339 ?auto_26340 ?auto_26341 ?auto_26342 )
      ( MAKE-1CRATE ?auto_26342 ?auto_26343 )
      ( MAKE-6CRATE-VERIFY ?auto_26337 ?auto_26338 ?auto_26339 ?auto_26340 ?auto_26341 ?auto_26342 ?auto_26343 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_26383 - SURFACE
      ?auto_26384 - SURFACE
      ?auto_26385 - SURFACE
      ?auto_26386 - SURFACE
      ?auto_26387 - SURFACE
      ?auto_26388 - SURFACE
      ?auto_26389 - SURFACE
      ?auto_26390 - SURFACE
    )
    :vars
    (
      ?auto_26394 - HOIST
      ?auto_26392 - PLACE
      ?auto_26395 - PLACE
      ?auto_26391 - HOIST
      ?auto_26396 - SURFACE
      ?auto_26400 - PLACE
      ?auto_26399 - HOIST
      ?auto_26405 - SURFACE
      ?auto_26414 - PLACE
      ?auto_26409 - HOIST
      ?auto_26397 - SURFACE
      ?auto_26406 - PLACE
      ?auto_26412 - HOIST
      ?auto_26401 - SURFACE
      ?auto_26403 - PLACE
      ?auto_26408 - HOIST
      ?auto_26410 - SURFACE
      ?auto_26407 - PLACE
      ?auto_26398 - HOIST
      ?auto_26411 - SURFACE
      ?auto_26402 - PLACE
      ?auto_26413 - HOIST
      ?auto_26404 - SURFACE
      ?auto_26393 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26394 ?auto_26392 ) ( IS-CRATE ?auto_26390 ) ( not ( = ?auto_26395 ?auto_26392 ) ) ( HOIST-AT ?auto_26391 ?auto_26395 ) ( AVAILABLE ?auto_26391 ) ( SURFACE-AT ?auto_26390 ?auto_26395 ) ( ON ?auto_26390 ?auto_26396 ) ( CLEAR ?auto_26390 ) ( not ( = ?auto_26389 ?auto_26390 ) ) ( not ( = ?auto_26389 ?auto_26396 ) ) ( not ( = ?auto_26390 ?auto_26396 ) ) ( not ( = ?auto_26394 ?auto_26391 ) ) ( IS-CRATE ?auto_26389 ) ( not ( = ?auto_26400 ?auto_26392 ) ) ( HOIST-AT ?auto_26399 ?auto_26400 ) ( AVAILABLE ?auto_26399 ) ( SURFACE-AT ?auto_26389 ?auto_26400 ) ( ON ?auto_26389 ?auto_26405 ) ( CLEAR ?auto_26389 ) ( not ( = ?auto_26388 ?auto_26389 ) ) ( not ( = ?auto_26388 ?auto_26405 ) ) ( not ( = ?auto_26389 ?auto_26405 ) ) ( not ( = ?auto_26394 ?auto_26399 ) ) ( IS-CRATE ?auto_26388 ) ( not ( = ?auto_26414 ?auto_26392 ) ) ( HOIST-AT ?auto_26409 ?auto_26414 ) ( AVAILABLE ?auto_26409 ) ( SURFACE-AT ?auto_26388 ?auto_26414 ) ( ON ?auto_26388 ?auto_26397 ) ( CLEAR ?auto_26388 ) ( not ( = ?auto_26387 ?auto_26388 ) ) ( not ( = ?auto_26387 ?auto_26397 ) ) ( not ( = ?auto_26388 ?auto_26397 ) ) ( not ( = ?auto_26394 ?auto_26409 ) ) ( IS-CRATE ?auto_26387 ) ( not ( = ?auto_26406 ?auto_26392 ) ) ( HOIST-AT ?auto_26412 ?auto_26406 ) ( AVAILABLE ?auto_26412 ) ( SURFACE-AT ?auto_26387 ?auto_26406 ) ( ON ?auto_26387 ?auto_26401 ) ( CLEAR ?auto_26387 ) ( not ( = ?auto_26386 ?auto_26387 ) ) ( not ( = ?auto_26386 ?auto_26401 ) ) ( not ( = ?auto_26387 ?auto_26401 ) ) ( not ( = ?auto_26394 ?auto_26412 ) ) ( IS-CRATE ?auto_26386 ) ( not ( = ?auto_26403 ?auto_26392 ) ) ( HOIST-AT ?auto_26408 ?auto_26403 ) ( AVAILABLE ?auto_26408 ) ( SURFACE-AT ?auto_26386 ?auto_26403 ) ( ON ?auto_26386 ?auto_26410 ) ( CLEAR ?auto_26386 ) ( not ( = ?auto_26385 ?auto_26386 ) ) ( not ( = ?auto_26385 ?auto_26410 ) ) ( not ( = ?auto_26386 ?auto_26410 ) ) ( not ( = ?auto_26394 ?auto_26408 ) ) ( IS-CRATE ?auto_26385 ) ( not ( = ?auto_26407 ?auto_26392 ) ) ( HOIST-AT ?auto_26398 ?auto_26407 ) ( AVAILABLE ?auto_26398 ) ( SURFACE-AT ?auto_26385 ?auto_26407 ) ( ON ?auto_26385 ?auto_26411 ) ( CLEAR ?auto_26385 ) ( not ( = ?auto_26384 ?auto_26385 ) ) ( not ( = ?auto_26384 ?auto_26411 ) ) ( not ( = ?auto_26385 ?auto_26411 ) ) ( not ( = ?auto_26394 ?auto_26398 ) ) ( SURFACE-AT ?auto_26383 ?auto_26392 ) ( CLEAR ?auto_26383 ) ( IS-CRATE ?auto_26384 ) ( AVAILABLE ?auto_26394 ) ( not ( = ?auto_26402 ?auto_26392 ) ) ( HOIST-AT ?auto_26413 ?auto_26402 ) ( AVAILABLE ?auto_26413 ) ( SURFACE-AT ?auto_26384 ?auto_26402 ) ( ON ?auto_26384 ?auto_26404 ) ( CLEAR ?auto_26384 ) ( TRUCK-AT ?auto_26393 ?auto_26392 ) ( not ( = ?auto_26383 ?auto_26384 ) ) ( not ( = ?auto_26383 ?auto_26404 ) ) ( not ( = ?auto_26384 ?auto_26404 ) ) ( not ( = ?auto_26394 ?auto_26413 ) ) ( not ( = ?auto_26383 ?auto_26385 ) ) ( not ( = ?auto_26383 ?auto_26411 ) ) ( not ( = ?auto_26385 ?auto_26404 ) ) ( not ( = ?auto_26407 ?auto_26402 ) ) ( not ( = ?auto_26398 ?auto_26413 ) ) ( not ( = ?auto_26411 ?auto_26404 ) ) ( not ( = ?auto_26383 ?auto_26386 ) ) ( not ( = ?auto_26383 ?auto_26410 ) ) ( not ( = ?auto_26384 ?auto_26386 ) ) ( not ( = ?auto_26384 ?auto_26410 ) ) ( not ( = ?auto_26386 ?auto_26411 ) ) ( not ( = ?auto_26386 ?auto_26404 ) ) ( not ( = ?auto_26403 ?auto_26407 ) ) ( not ( = ?auto_26403 ?auto_26402 ) ) ( not ( = ?auto_26408 ?auto_26398 ) ) ( not ( = ?auto_26408 ?auto_26413 ) ) ( not ( = ?auto_26410 ?auto_26411 ) ) ( not ( = ?auto_26410 ?auto_26404 ) ) ( not ( = ?auto_26383 ?auto_26387 ) ) ( not ( = ?auto_26383 ?auto_26401 ) ) ( not ( = ?auto_26384 ?auto_26387 ) ) ( not ( = ?auto_26384 ?auto_26401 ) ) ( not ( = ?auto_26385 ?auto_26387 ) ) ( not ( = ?auto_26385 ?auto_26401 ) ) ( not ( = ?auto_26387 ?auto_26410 ) ) ( not ( = ?auto_26387 ?auto_26411 ) ) ( not ( = ?auto_26387 ?auto_26404 ) ) ( not ( = ?auto_26406 ?auto_26403 ) ) ( not ( = ?auto_26406 ?auto_26407 ) ) ( not ( = ?auto_26406 ?auto_26402 ) ) ( not ( = ?auto_26412 ?auto_26408 ) ) ( not ( = ?auto_26412 ?auto_26398 ) ) ( not ( = ?auto_26412 ?auto_26413 ) ) ( not ( = ?auto_26401 ?auto_26410 ) ) ( not ( = ?auto_26401 ?auto_26411 ) ) ( not ( = ?auto_26401 ?auto_26404 ) ) ( not ( = ?auto_26383 ?auto_26388 ) ) ( not ( = ?auto_26383 ?auto_26397 ) ) ( not ( = ?auto_26384 ?auto_26388 ) ) ( not ( = ?auto_26384 ?auto_26397 ) ) ( not ( = ?auto_26385 ?auto_26388 ) ) ( not ( = ?auto_26385 ?auto_26397 ) ) ( not ( = ?auto_26386 ?auto_26388 ) ) ( not ( = ?auto_26386 ?auto_26397 ) ) ( not ( = ?auto_26388 ?auto_26401 ) ) ( not ( = ?auto_26388 ?auto_26410 ) ) ( not ( = ?auto_26388 ?auto_26411 ) ) ( not ( = ?auto_26388 ?auto_26404 ) ) ( not ( = ?auto_26414 ?auto_26406 ) ) ( not ( = ?auto_26414 ?auto_26403 ) ) ( not ( = ?auto_26414 ?auto_26407 ) ) ( not ( = ?auto_26414 ?auto_26402 ) ) ( not ( = ?auto_26409 ?auto_26412 ) ) ( not ( = ?auto_26409 ?auto_26408 ) ) ( not ( = ?auto_26409 ?auto_26398 ) ) ( not ( = ?auto_26409 ?auto_26413 ) ) ( not ( = ?auto_26397 ?auto_26401 ) ) ( not ( = ?auto_26397 ?auto_26410 ) ) ( not ( = ?auto_26397 ?auto_26411 ) ) ( not ( = ?auto_26397 ?auto_26404 ) ) ( not ( = ?auto_26383 ?auto_26389 ) ) ( not ( = ?auto_26383 ?auto_26405 ) ) ( not ( = ?auto_26384 ?auto_26389 ) ) ( not ( = ?auto_26384 ?auto_26405 ) ) ( not ( = ?auto_26385 ?auto_26389 ) ) ( not ( = ?auto_26385 ?auto_26405 ) ) ( not ( = ?auto_26386 ?auto_26389 ) ) ( not ( = ?auto_26386 ?auto_26405 ) ) ( not ( = ?auto_26387 ?auto_26389 ) ) ( not ( = ?auto_26387 ?auto_26405 ) ) ( not ( = ?auto_26389 ?auto_26397 ) ) ( not ( = ?auto_26389 ?auto_26401 ) ) ( not ( = ?auto_26389 ?auto_26410 ) ) ( not ( = ?auto_26389 ?auto_26411 ) ) ( not ( = ?auto_26389 ?auto_26404 ) ) ( not ( = ?auto_26400 ?auto_26414 ) ) ( not ( = ?auto_26400 ?auto_26406 ) ) ( not ( = ?auto_26400 ?auto_26403 ) ) ( not ( = ?auto_26400 ?auto_26407 ) ) ( not ( = ?auto_26400 ?auto_26402 ) ) ( not ( = ?auto_26399 ?auto_26409 ) ) ( not ( = ?auto_26399 ?auto_26412 ) ) ( not ( = ?auto_26399 ?auto_26408 ) ) ( not ( = ?auto_26399 ?auto_26398 ) ) ( not ( = ?auto_26399 ?auto_26413 ) ) ( not ( = ?auto_26405 ?auto_26397 ) ) ( not ( = ?auto_26405 ?auto_26401 ) ) ( not ( = ?auto_26405 ?auto_26410 ) ) ( not ( = ?auto_26405 ?auto_26411 ) ) ( not ( = ?auto_26405 ?auto_26404 ) ) ( not ( = ?auto_26383 ?auto_26390 ) ) ( not ( = ?auto_26383 ?auto_26396 ) ) ( not ( = ?auto_26384 ?auto_26390 ) ) ( not ( = ?auto_26384 ?auto_26396 ) ) ( not ( = ?auto_26385 ?auto_26390 ) ) ( not ( = ?auto_26385 ?auto_26396 ) ) ( not ( = ?auto_26386 ?auto_26390 ) ) ( not ( = ?auto_26386 ?auto_26396 ) ) ( not ( = ?auto_26387 ?auto_26390 ) ) ( not ( = ?auto_26387 ?auto_26396 ) ) ( not ( = ?auto_26388 ?auto_26390 ) ) ( not ( = ?auto_26388 ?auto_26396 ) ) ( not ( = ?auto_26390 ?auto_26405 ) ) ( not ( = ?auto_26390 ?auto_26397 ) ) ( not ( = ?auto_26390 ?auto_26401 ) ) ( not ( = ?auto_26390 ?auto_26410 ) ) ( not ( = ?auto_26390 ?auto_26411 ) ) ( not ( = ?auto_26390 ?auto_26404 ) ) ( not ( = ?auto_26395 ?auto_26400 ) ) ( not ( = ?auto_26395 ?auto_26414 ) ) ( not ( = ?auto_26395 ?auto_26406 ) ) ( not ( = ?auto_26395 ?auto_26403 ) ) ( not ( = ?auto_26395 ?auto_26407 ) ) ( not ( = ?auto_26395 ?auto_26402 ) ) ( not ( = ?auto_26391 ?auto_26399 ) ) ( not ( = ?auto_26391 ?auto_26409 ) ) ( not ( = ?auto_26391 ?auto_26412 ) ) ( not ( = ?auto_26391 ?auto_26408 ) ) ( not ( = ?auto_26391 ?auto_26398 ) ) ( not ( = ?auto_26391 ?auto_26413 ) ) ( not ( = ?auto_26396 ?auto_26405 ) ) ( not ( = ?auto_26396 ?auto_26397 ) ) ( not ( = ?auto_26396 ?auto_26401 ) ) ( not ( = ?auto_26396 ?auto_26410 ) ) ( not ( = ?auto_26396 ?auto_26411 ) ) ( not ( = ?auto_26396 ?auto_26404 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_26383 ?auto_26384 ?auto_26385 ?auto_26386 ?auto_26387 ?auto_26388 ?auto_26389 )
      ( MAKE-1CRATE ?auto_26389 ?auto_26390 )
      ( MAKE-7CRATE-VERIFY ?auto_26383 ?auto_26384 ?auto_26385 ?auto_26386 ?auto_26387 ?auto_26388 ?auto_26389 ?auto_26390 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_26434 - SURFACE
      ?auto_26435 - SURFACE
      ?auto_26436 - SURFACE
      ?auto_26437 - SURFACE
      ?auto_26438 - SURFACE
      ?auto_26439 - SURFACE
      ?auto_26440 - SURFACE
      ?auto_26441 - SURFACE
      ?auto_26442 - SURFACE
    )
    :vars
    (
      ?auto_26444 - HOIST
      ?auto_26448 - PLACE
      ?auto_26443 - PLACE
      ?auto_26446 - HOIST
      ?auto_26445 - SURFACE
      ?auto_26455 - PLACE
      ?auto_26457 - HOIST
      ?auto_26456 - SURFACE
      ?auto_26462 - PLACE
      ?auto_26463 - HOIST
      ?auto_26459 - SURFACE
      ?auto_26465 - PLACE
      ?auto_26449 - HOIST
      ?auto_26466 - SURFACE
      ?auto_26458 - PLACE
      ?auto_26467 - HOIST
      ?auto_26454 - SURFACE
      ?auto_26452 - PLACE
      ?auto_26460 - HOIST
      ?auto_26450 - SURFACE
      ?auto_26464 - SURFACE
      ?auto_26453 - PLACE
      ?auto_26461 - HOIST
      ?auto_26451 - SURFACE
      ?auto_26447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26444 ?auto_26448 ) ( IS-CRATE ?auto_26442 ) ( not ( = ?auto_26443 ?auto_26448 ) ) ( HOIST-AT ?auto_26446 ?auto_26443 ) ( SURFACE-AT ?auto_26442 ?auto_26443 ) ( ON ?auto_26442 ?auto_26445 ) ( CLEAR ?auto_26442 ) ( not ( = ?auto_26441 ?auto_26442 ) ) ( not ( = ?auto_26441 ?auto_26445 ) ) ( not ( = ?auto_26442 ?auto_26445 ) ) ( not ( = ?auto_26444 ?auto_26446 ) ) ( IS-CRATE ?auto_26441 ) ( not ( = ?auto_26455 ?auto_26448 ) ) ( HOIST-AT ?auto_26457 ?auto_26455 ) ( AVAILABLE ?auto_26457 ) ( SURFACE-AT ?auto_26441 ?auto_26455 ) ( ON ?auto_26441 ?auto_26456 ) ( CLEAR ?auto_26441 ) ( not ( = ?auto_26440 ?auto_26441 ) ) ( not ( = ?auto_26440 ?auto_26456 ) ) ( not ( = ?auto_26441 ?auto_26456 ) ) ( not ( = ?auto_26444 ?auto_26457 ) ) ( IS-CRATE ?auto_26440 ) ( not ( = ?auto_26462 ?auto_26448 ) ) ( HOIST-AT ?auto_26463 ?auto_26462 ) ( AVAILABLE ?auto_26463 ) ( SURFACE-AT ?auto_26440 ?auto_26462 ) ( ON ?auto_26440 ?auto_26459 ) ( CLEAR ?auto_26440 ) ( not ( = ?auto_26439 ?auto_26440 ) ) ( not ( = ?auto_26439 ?auto_26459 ) ) ( not ( = ?auto_26440 ?auto_26459 ) ) ( not ( = ?auto_26444 ?auto_26463 ) ) ( IS-CRATE ?auto_26439 ) ( not ( = ?auto_26465 ?auto_26448 ) ) ( HOIST-AT ?auto_26449 ?auto_26465 ) ( AVAILABLE ?auto_26449 ) ( SURFACE-AT ?auto_26439 ?auto_26465 ) ( ON ?auto_26439 ?auto_26466 ) ( CLEAR ?auto_26439 ) ( not ( = ?auto_26438 ?auto_26439 ) ) ( not ( = ?auto_26438 ?auto_26466 ) ) ( not ( = ?auto_26439 ?auto_26466 ) ) ( not ( = ?auto_26444 ?auto_26449 ) ) ( IS-CRATE ?auto_26438 ) ( not ( = ?auto_26458 ?auto_26448 ) ) ( HOIST-AT ?auto_26467 ?auto_26458 ) ( AVAILABLE ?auto_26467 ) ( SURFACE-AT ?auto_26438 ?auto_26458 ) ( ON ?auto_26438 ?auto_26454 ) ( CLEAR ?auto_26438 ) ( not ( = ?auto_26437 ?auto_26438 ) ) ( not ( = ?auto_26437 ?auto_26454 ) ) ( not ( = ?auto_26438 ?auto_26454 ) ) ( not ( = ?auto_26444 ?auto_26467 ) ) ( IS-CRATE ?auto_26437 ) ( not ( = ?auto_26452 ?auto_26448 ) ) ( HOIST-AT ?auto_26460 ?auto_26452 ) ( AVAILABLE ?auto_26460 ) ( SURFACE-AT ?auto_26437 ?auto_26452 ) ( ON ?auto_26437 ?auto_26450 ) ( CLEAR ?auto_26437 ) ( not ( = ?auto_26436 ?auto_26437 ) ) ( not ( = ?auto_26436 ?auto_26450 ) ) ( not ( = ?auto_26437 ?auto_26450 ) ) ( not ( = ?auto_26444 ?auto_26460 ) ) ( IS-CRATE ?auto_26436 ) ( AVAILABLE ?auto_26446 ) ( SURFACE-AT ?auto_26436 ?auto_26443 ) ( ON ?auto_26436 ?auto_26464 ) ( CLEAR ?auto_26436 ) ( not ( = ?auto_26435 ?auto_26436 ) ) ( not ( = ?auto_26435 ?auto_26464 ) ) ( not ( = ?auto_26436 ?auto_26464 ) ) ( SURFACE-AT ?auto_26434 ?auto_26448 ) ( CLEAR ?auto_26434 ) ( IS-CRATE ?auto_26435 ) ( AVAILABLE ?auto_26444 ) ( not ( = ?auto_26453 ?auto_26448 ) ) ( HOIST-AT ?auto_26461 ?auto_26453 ) ( AVAILABLE ?auto_26461 ) ( SURFACE-AT ?auto_26435 ?auto_26453 ) ( ON ?auto_26435 ?auto_26451 ) ( CLEAR ?auto_26435 ) ( TRUCK-AT ?auto_26447 ?auto_26448 ) ( not ( = ?auto_26434 ?auto_26435 ) ) ( not ( = ?auto_26434 ?auto_26451 ) ) ( not ( = ?auto_26435 ?auto_26451 ) ) ( not ( = ?auto_26444 ?auto_26461 ) ) ( not ( = ?auto_26434 ?auto_26436 ) ) ( not ( = ?auto_26434 ?auto_26464 ) ) ( not ( = ?auto_26436 ?auto_26451 ) ) ( not ( = ?auto_26443 ?auto_26453 ) ) ( not ( = ?auto_26446 ?auto_26461 ) ) ( not ( = ?auto_26464 ?auto_26451 ) ) ( not ( = ?auto_26434 ?auto_26437 ) ) ( not ( = ?auto_26434 ?auto_26450 ) ) ( not ( = ?auto_26435 ?auto_26437 ) ) ( not ( = ?auto_26435 ?auto_26450 ) ) ( not ( = ?auto_26437 ?auto_26464 ) ) ( not ( = ?auto_26437 ?auto_26451 ) ) ( not ( = ?auto_26452 ?auto_26443 ) ) ( not ( = ?auto_26452 ?auto_26453 ) ) ( not ( = ?auto_26460 ?auto_26446 ) ) ( not ( = ?auto_26460 ?auto_26461 ) ) ( not ( = ?auto_26450 ?auto_26464 ) ) ( not ( = ?auto_26450 ?auto_26451 ) ) ( not ( = ?auto_26434 ?auto_26438 ) ) ( not ( = ?auto_26434 ?auto_26454 ) ) ( not ( = ?auto_26435 ?auto_26438 ) ) ( not ( = ?auto_26435 ?auto_26454 ) ) ( not ( = ?auto_26436 ?auto_26438 ) ) ( not ( = ?auto_26436 ?auto_26454 ) ) ( not ( = ?auto_26438 ?auto_26450 ) ) ( not ( = ?auto_26438 ?auto_26464 ) ) ( not ( = ?auto_26438 ?auto_26451 ) ) ( not ( = ?auto_26458 ?auto_26452 ) ) ( not ( = ?auto_26458 ?auto_26443 ) ) ( not ( = ?auto_26458 ?auto_26453 ) ) ( not ( = ?auto_26467 ?auto_26460 ) ) ( not ( = ?auto_26467 ?auto_26446 ) ) ( not ( = ?auto_26467 ?auto_26461 ) ) ( not ( = ?auto_26454 ?auto_26450 ) ) ( not ( = ?auto_26454 ?auto_26464 ) ) ( not ( = ?auto_26454 ?auto_26451 ) ) ( not ( = ?auto_26434 ?auto_26439 ) ) ( not ( = ?auto_26434 ?auto_26466 ) ) ( not ( = ?auto_26435 ?auto_26439 ) ) ( not ( = ?auto_26435 ?auto_26466 ) ) ( not ( = ?auto_26436 ?auto_26439 ) ) ( not ( = ?auto_26436 ?auto_26466 ) ) ( not ( = ?auto_26437 ?auto_26439 ) ) ( not ( = ?auto_26437 ?auto_26466 ) ) ( not ( = ?auto_26439 ?auto_26454 ) ) ( not ( = ?auto_26439 ?auto_26450 ) ) ( not ( = ?auto_26439 ?auto_26464 ) ) ( not ( = ?auto_26439 ?auto_26451 ) ) ( not ( = ?auto_26465 ?auto_26458 ) ) ( not ( = ?auto_26465 ?auto_26452 ) ) ( not ( = ?auto_26465 ?auto_26443 ) ) ( not ( = ?auto_26465 ?auto_26453 ) ) ( not ( = ?auto_26449 ?auto_26467 ) ) ( not ( = ?auto_26449 ?auto_26460 ) ) ( not ( = ?auto_26449 ?auto_26446 ) ) ( not ( = ?auto_26449 ?auto_26461 ) ) ( not ( = ?auto_26466 ?auto_26454 ) ) ( not ( = ?auto_26466 ?auto_26450 ) ) ( not ( = ?auto_26466 ?auto_26464 ) ) ( not ( = ?auto_26466 ?auto_26451 ) ) ( not ( = ?auto_26434 ?auto_26440 ) ) ( not ( = ?auto_26434 ?auto_26459 ) ) ( not ( = ?auto_26435 ?auto_26440 ) ) ( not ( = ?auto_26435 ?auto_26459 ) ) ( not ( = ?auto_26436 ?auto_26440 ) ) ( not ( = ?auto_26436 ?auto_26459 ) ) ( not ( = ?auto_26437 ?auto_26440 ) ) ( not ( = ?auto_26437 ?auto_26459 ) ) ( not ( = ?auto_26438 ?auto_26440 ) ) ( not ( = ?auto_26438 ?auto_26459 ) ) ( not ( = ?auto_26440 ?auto_26466 ) ) ( not ( = ?auto_26440 ?auto_26454 ) ) ( not ( = ?auto_26440 ?auto_26450 ) ) ( not ( = ?auto_26440 ?auto_26464 ) ) ( not ( = ?auto_26440 ?auto_26451 ) ) ( not ( = ?auto_26462 ?auto_26465 ) ) ( not ( = ?auto_26462 ?auto_26458 ) ) ( not ( = ?auto_26462 ?auto_26452 ) ) ( not ( = ?auto_26462 ?auto_26443 ) ) ( not ( = ?auto_26462 ?auto_26453 ) ) ( not ( = ?auto_26463 ?auto_26449 ) ) ( not ( = ?auto_26463 ?auto_26467 ) ) ( not ( = ?auto_26463 ?auto_26460 ) ) ( not ( = ?auto_26463 ?auto_26446 ) ) ( not ( = ?auto_26463 ?auto_26461 ) ) ( not ( = ?auto_26459 ?auto_26466 ) ) ( not ( = ?auto_26459 ?auto_26454 ) ) ( not ( = ?auto_26459 ?auto_26450 ) ) ( not ( = ?auto_26459 ?auto_26464 ) ) ( not ( = ?auto_26459 ?auto_26451 ) ) ( not ( = ?auto_26434 ?auto_26441 ) ) ( not ( = ?auto_26434 ?auto_26456 ) ) ( not ( = ?auto_26435 ?auto_26441 ) ) ( not ( = ?auto_26435 ?auto_26456 ) ) ( not ( = ?auto_26436 ?auto_26441 ) ) ( not ( = ?auto_26436 ?auto_26456 ) ) ( not ( = ?auto_26437 ?auto_26441 ) ) ( not ( = ?auto_26437 ?auto_26456 ) ) ( not ( = ?auto_26438 ?auto_26441 ) ) ( not ( = ?auto_26438 ?auto_26456 ) ) ( not ( = ?auto_26439 ?auto_26441 ) ) ( not ( = ?auto_26439 ?auto_26456 ) ) ( not ( = ?auto_26441 ?auto_26459 ) ) ( not ( = ?auto_26441 ?auto_26466 ) ) ( not ( = ?auto_26441 ?auto_26454 ) ) ( not ( = ?auto_26441 ?auto_26450 ) ) ( not ( = ?auto_26441 ?auto_26464 ) ) ( not ( = ?auto_26441 ?auto_26451 ) ) ( not ( = ?auto_26455 ?auto_26462 ) ) ( not ( = ?auto_26455 ?auto_26465 ) ) ( not ( = ?auto_26455 ?auto_26458 ) ) ( not ( = ?auto_26455 ?auto_26452 ) ) ( not ( = ?auto_26455 ?auto_26443 ) ) ( not ( = ?auto_26455 ?auto_26453 ) ) ( not ( = ?auto_26457 ?auto_26463 ) ) ( not ( = ?auto_26457 ?auto_26449 ) ) ( not ( = ?auto_26457 ?auto_26467 ) ) ( not ( = ?auto_26457 ?auto_26460 ) ) ( not ( = ?auto_26457 ?auto_26446 ) ) ( not ( = ?auto_26457 ?auto_26461 ) ) ( not ( = ?auto_26456 ?auto_26459 ) ) ( not ( = ?auto_26456 ?auto_26466 ) ) ( not ( = ?auto_26456 ?auto_26454 ) ) ( not ( = ?auto_26456 ?auto_26450 ) ) ( not ( = ?auto_26456 ?auto_26464 ) ) ( not ( = ?auto_26456 ?auto_26451 ) ) ( not ( = ?auto_26434 ?auto_26442 ) ) ( not ( = ?auto_26434 ?auto_26445 ) ) ( not ( = ?auto_26435 ?auto_26442 ) ) ( not ( = ?auto_26435 ?auto_26445 ) ) ( not ( = ?auto_26436 ?auto_26442 ) ) ( not ( = ?auto_26436 ?auto_26445 ) ) ( not ( = ?auto_26437 ?auto_26442 ) ) ( not ( = ?auto_26437 ?auto_26445 ) ) ( not ( = ?auto_26438 ?auto_26442 ) ) ( not ( = ?auto_26438 ?auto_26445 ) ) ( not ( = ?auto_26439 ?auto_26442 ) ) ( not ( = ?auto_26439 ?auto_26445 ) ) ( not ( = ?auto_26440 ?auto_26442 ) ) ( not ( = ?auto_26440 ?auto_26445 ) ) ( not ( = ?auto_26442 ?auto_26456 ) ) ( not ( = ?auto_26442 ?auto_26459 ) ) ( not ( = ?auto_26442 ?auto_26466 ) ) ( not ( = ?auto_26442 ?auto_26454 ) ) ( not ( = ?auto_26442 ?auto_26450 ) ) ( not ( = ?auto_26442 ?auto_26464 ) ) ( not ( = ?auto_26442 ?auto_26451 ) ) ( not ( = ?auto_26445 ?auto_26456 ) ) ( not ( = ?auto_26445 ?auto_26459 ) ) ( not ( = ?auto_26445 ?auto_26466 ) ) ( not ( = ?auto_26445 ?auto_26454 ) ) ( not ( = ?auto_26445 ?auto_26450 ) ) ( not ( = ?auto_26445 ?auto_26464 ) ) ( not ( = ?auto_26445 ?auto_26451 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_26434 ?auto_26435 ?auto_26436 ?auto_26437 ?auto_26438 ?auto_26439 ?auto_26440 ?auto_26441 )
      ( MAKE-1CRATE ?auto_26441 ?auto_26442 )
      ( MAKE-8CRATE-VERIFY ?auto_26434 ?auto_26435 ?auto_26436 ?auto_26437 ?auto_26438 ?auto_26439 ?auto_26440 ?auto_26441 ?auto_26442 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_26488 - SURFACE
      ?auto_26489 - SURFACE
      ?auto_26490 - SURFACE
      ?auto_26491 - SURFACE
      ?auto_26492 - SURFACE
      ?auto_26493 - SURFACE
      ?auto_26494 - SURFACE
      ?auto_26495 - SURFACE
      ?auto_26496 - SURFACE
      ?auto_26497 - SURFACE
    )
    :vars
    (
      ?auto_26498 - HOIST
      ?auto_26501 - PLACE
      ?auto_26503 - PLACE
      ?auto_26500 - HOIST
      ?auto_26499 - SURFACE
      ?auto_26518 - PLACE
      ?auto_26520 - HOIST
      ?auto_26506 - SURFACE
      ?auto_26517 - PLACE
      ?auto_26511 - HOIST
      ?auto_26516 - SURFACE
      ?auto_26515 - PLACE
      ?auto_26523 - HOIST
      ?auto_26512 - SURFACE
      ?auto_26521 - PLACE
      ?auto_26505 - HOIST
      ?auto_26504 - SURFACE
      ?auto_26513 - PLACE
      ?auto_26522 - HOIST
      ?auto_26508 - SURFACE
      ?auto_26509 - SURFACE
      ?auto_26510 - SURFACE
      ?auto_26507 - PLACE
      ?auto_26514 - HOIST
      ?auto_26519 - SURFACE
      ?auto_26502 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26498 ?auto_26501 ) ( IS-CRATE ?auto_26497 ) ( not ( = ?auto_26503 ?auto_26501 ) ) ( HOIST-AT ?auto_26500 ?auto_26503 ) ( SURFACE-AT ?auto_26497 ?auto_26503 ) ( ON ?auto_26497 ?auto_26499 ) ( CLEAR ?auto_26497 ) ( not ( = ?auto_26496 ?auto_26497 ) ) ( not ( = ?auto_26496 ?auto_26499 ) ) ( not ( = ?auto_26497 ?auto_26499 ) ) ( not ( = ?auto_26498 ?auto_26500 ) ) ( IS-CRATE ?auto_26496 ) ( not ( = ?auto_26518 ?auto_26501 ) ) ( HOIST-AT ?auto_26520 ?auto_26518 ) ( SURFACE-AT ?auto_26496 ?auto_26518 ) ( ON ?auto_26496 ?auto_26506 ) ( CLEAR ?auto_26496 ) ( not ( = ?auto_26495 ?auto_26496 ) ) ( not ( = ?auto_26495 ?auto_26506 ) ) ( not ( = ?auto_26496 ?auto_26506 ) ) ( not ( = ?auto_26498 ?auto_26520 ) ) ( IS-CRATE ?auto_26495 ) ( not ( = ?auto_26517 ?auto_26501 ) ) ( HOIST-AT ?auto_26511 ?auto_26517 ) ( AVAILABLE ?auto_26511 ) ( SURFACE-AT ?auto_26495 ?auto_26517 ) ( ON ?auto_26495 ?auto_26516 ) ( CLEAR ?auto_26495 ) ( not ( = ?auto_26494 ?auto_26495 ) ) ( not ( = ?auto_26494 ?auto_26516 ) ) ( not ( = ?auto_26495 ?auto_26516 ) ) ( not ( = ?auto_26498 ?auto_26511 ) ) ( IS-CRATE ?auto_26494 ) ( not ( = ?auto_26515 ?auto_26501 ) ) ( HOIST-AT ?auto_26523 ?auto_26515 ) ( AVAILABLE ?auto_26523 ) ( SURFACE-AT ?auto_26494 ?auto_26515 ) ( ON ?auto_26494 ?auto_26512 ) ( CLEAR ?auto_26494 ) ( not ( = ?auto_26493 ?auto_26494 ) ) ( not ( = ?auto_26493 ?auto_26512 ) ) ( not ( = ?auto_26494 ?auto_26512 ) ) ( not ( = ?auto_26498 ?auto_26523 ) ) ( IS-CRATE ?auto_26493 ) ( not ( = ?auto_26521 ?auto_26501 ) ) ( HOIST-AT ?auto_26505 ?auto_26521 ) ( AVAILABLE ?auto_26505 ) ( SURFACE-AT ?auto_26493 ?auto_26521 ) ( ON ?auto_26493 ?auto_26504 ) ( CLEAR ?auto_26493 ) ( not ( = ?auto_26492 ?auto_26493 ) ) ( not ( = ?auto_26492 ?auto_26504 ) ) ( not ( = ?auto_26493 ?auto_26504 ) ) ( not ( = ?auto_26498 ?auto_26505 ) ) ( IS-CRATE ?auto_26492 ) ( not ( = ?auto_26513 ?auto_26501 ) ) ( HOIST-AT ?auto_26522 ?auto_26513 ) ( AVAILABLE ?auto_26522 ) ( SURFACE-AT ?auto_26492 ?auto_26513 ) ( ON ?auto_26492 ?auto_26508 ) ( CLEAR ?auto_26492 ) ( not ( = ?auto_26491 ?auto_26492 ) ) ( not ( = ?auto_26491 ?auto_26508 ) ) ( not ( = ?auto_26492 ?auto_26508 ) ) ( not ( = ?auto_26498 ?auto_26522 ) ) ( IS-CRATE ?auto_26491 ) ( AVAILABLE ?auto_26500 ) ( SURFACE-AT ?auto_26491 ?auto_26503 ) ( ON ?auto_26491 ?auto_26509 ) ( CLEAR ?auto_26491 ) ( not ( = ?auto_26490 ?auto_26491 ) ) ( not ( = ?auto_26490 ?auto_26509 ) ) ( not ( = ?auto_26491 ?auto_26509 ) ) ( IS-CRATE ?auto_26490 ) ( AVAILABLE ?auto_26520 ) ( SURFACE-AT ?auto_26490 ?auto_26518 ) ( ON ?auto_26490 ?auto_26510 ) ( CLEAR ?auto_26490 ) ( not ( = ?auto_26489 ?auto_26490 ) ) ( not ( = ?auto_26489 ?auto_26510 ) ) ( not ( = ?auto_26490 ?auto_26510 ) ) ( SURFACE-AT ?auto_26488 ?auto_26501 ) ( CLEAR ?auto_26488 ) ( IS-CRATE ?auto_26489 ) ( AVAILABLE ?auto_26498 ) ( not ( = ?auto_26507 ?auto_26501 ) ) ( HOIST-AT ?auto_26514 ?auto_26507 ) ( AVAILABLE ?auto_26514 ) ( SURFACE-AT ?auto_26489 ?auto_26507 ) ( ON ?auto_26489 ?auto_26519 ) ( CLEAR ?auto_26489 ) ( TRUCK-AT ?auto_26502 ?auto_26501 ) ( not ( = ?auto_26488 ?auto_26489 ) ) ( not ( = ?auto_26488 ?auto_26519 ) ) ( not ( = ?auto_26489 ?auto_26519 ) ) ( not ( = ?auto_26498 ?auto_26514 ) ) ( not ( = ?auto_26488 ?auto_26490 ) ) ( not ( = ?auto_26488 ?auto_26510 ) ) ( not ( = ?auto_26490 ?auto_26519 ) ) ( not ( = ?auto_26518 ?auto_26507 ) ) ( not ( = ?auto_26520 ?auto_26514 ) ) ( not ( = ?auto_26510 ?auto_26519 ) ) ( not ( = ?auto_26488 ?auto_26491 ) ) ( not ( = ?auto_26488 ?auto_26509 ) ) ( not ( = ?auto_26489 ?auto_26491 ) ) ( not ( = ?auto_26489 ?auto_26509 ) ) ( not ( = ?auto_26491 ?auto_26510 ) ) ( not ( = ?auto_26491 ?auto_26519 ) ) ( not ( = ?auto_26503 ?auto_26518 ) ) ( not ( = ?auto_26503 ?auto_26507 ) ) ( not ( = ?auto_26500 ?auto_26520 ) ) ( not ( = ?auto_26500 ?auto_26514 ) ) ( not ( = ?auto_26509 ?auto_26510 ) ) ( not ( = ?auto_26509 ?auto_26519 ) ) ( not ( = ?auto_26488 ?auto_26492 ) ) ( not ( = ?auto_26488 ?auto_26508 ) ) ( not ( = ?auto_26489 ?auto_26492 ) ) ( not ( = ?auto_26489 ?auto_26508 ) ) ( not ( = ?auto_26490 ?auto_26492 ) ) ( not ( = ?auto_26490 ?auto_26508 ) ) ( not ( = ?auto_26492 ?auto_26509 ) ) ( not ( = ?auto_26492 ?auto_26510 ) ) ( not ( = ?auto_26492 ?auto_26519 ) ) ( not ( = ?auto_26513 ?auto_26503 ) ) ( not ( = ?auto_26513 ?auto_26518 ) ) ( not ( = ?auto_26513 ?auto_26507 ) ) ( not ( = ?auto_26522 ?auto_26500 ) ) ( not ( = ?auto_26522 ?auto_26520 ) ) ( not ( = ?auto_26522 ?auto_26514 ) ) ( not ( = ?auto_26508 ?auto_26509 ) ) ( not ( = ?auto_26508 ?auto_26510 ) ) ( not ( = ?auto_26508 ?auto_26519 ) ) ( not ( = ?auto_26488 ?auto_26493 ) ) ( not ( = ?auto_26488 ?auto_26504 ) ) ( not ( = ?auto_26489 ?auto_26493 ) ) ( not ( = ?auto_26489 ?auto_26504 ) ) ( not ( = ?auto_26490 ?auto_26493 ) ) ( not ( = ?auto_26490 ?auto_26504 ) ) ( not ( = ?auto_26491 ?auto_26493 ) ) ( not ( = ?auto_26491 ?auto_26504 ) ) ( not ( = ?auto_26493 ?auto_26508 ) ) ( not ( = ?auto_26493 ?auto_26509 ) ) ( not ( = ?auto_26493 ?auto_26510 ) ) ( not ( = ?auto_26493 ?auto_26519 ) ) ( not ( = ?auto_26521 ?auto_26513 ) ) ( not ( = ?auto_26521 ?auto_26503 ) ) ( not ( = ?auto_26521 ?auto_26518 ) ) ( not ( = ?auto_26521 ?auto_26507 ) ) ( not ( = ?auto_26505 ?auto_26522 ) ) ( not ( = ?auto_26505 ?auto_26500 ) ) ( not ( = ?auto_26505 ?auto_26520 ) ) ( not ( = ?auto_26505 ?auto_26514 ) ) ( not ( = ?auto_26504 ?auto_26508 ) ) ( not ( = ?auto_26504 ?auto_26509 ) ) ( not ( = ?auto_26504 ?auto_26510 ) ) ( not ( = ?auto_26504 ?auto_26519 ) ) ( not ( = ?auto_26488 ?auto_26494 ) ) ( not ( = ?auto_26488 ?auto_26512 ) ) ( not ( = ?auto_26489 ?auto_26494 ) ) ( not ( = ?auto_26489 ?auto_26512 ) ) ( not ( = ?auto_26490 ?auto_26494 ) ) ( not ( = ?auto_26490 ?auto_26512 ) ) ( not ( = ?auto_26491 ?auto_26494 ) ) ( not ( = ?auto_26491 ?auto_26512 ) ) ( not ( = ?auto_26492 ?auto_26494 ) ) ( not ( = ?auto_26492 ?auto_26512 ) ) ( not ( = ?auto_26494 ?auto_26504 ) ) ( not ( = ?auto_26494 ?auto_26508 ) ) ( not ( = ?auto_26494 ?auto_26509 ) ) ( not ( = ?auto_26494 ?auto_26510 ) ) ( not ( = ?auto_26494 ?auto_26519 ) ) ( not ( = ?auto_26515 ?auto_26521 ) ) ( not ( = ?auto_26515 ?auto_26513 ) ) ( not ( = ?auto_26515 ?auto_26503 ) ) ( not ( = ?auto_26515 ?auto_26518 ) ) ( not ( = ?auto_26515 ?auto_26507 ) ) ( not ( = ?auto_26523 ?auto_26505 ) ) ( not ( = ?auto_26523 ?auto_26522 ) ) ( not ( = ?auto_26523 ?auto_26500 ) ) ( not ( = ?auto_26523 ?auto_26520 ) ) ( not ( = ?auto_26523 ?auto_26514 ) ) ( not ( = ?auto_26512 ?auto_26504 ) ) ( not ( = ?auto_26512 ?auto_26508 ) ) ( not ( = ?auto_26512 ?auto_26509 ) ) ( not ( = ?auto_26512 ?auto_26510 ) ) ( not ( = ?auto_26512 ?auto_26519 ) ) ( not ( = ?auto_26488 ?auto_26495 ) ) ( not ( = ?auto_26488 ?auto_26516 ) ) ( not ( = ?auto_26489 ?auto_26495 ) ) ( not ( = ?auto_26489 ?auto_26516 ) ) ( not ( = ?auto_26490 ?auto_26495 ) ) ( not ( = ?auto_26490 ?auto_26516 ) ) ( not ( = ?auto_26491 ?auto_26495 ) ) ( not ( = ?auto_26491 ?auto_26516 ) ) ( not ( = ?auto_26492 ?auto_26495 ) ) ( not ( = ?auto_26492 ?auto_26516 ) ) ( not ( = ?auto_26493 ?auto_26495 ) ) ( not ( = ?auto_26493 ?auto_26516 ) ) ( not ( = ?auto_26495 ?auto_26512 ) ) ( not ( = ?auto_26495 ?auto_26504 ) ) ( not ( = ?auto_26495 ?auto_26508 ) ) ( not ( = ?auto_26495 ?auto_26509 ) ) ( not ( = ?auto_26495 ?auto_26510 ) ) ( not ( = ?auto_26495 ?auto_26519 ) ) ( not ( = ?auto_26517 ?auto_26515 ) ) ( not ( = ?auto_26517 ?auto_26521 ) ) ( not ( = ?auto_26517 ?auto_26513 ) ) ( not ( = ?auto_26517 ?auto_26503 ) ) ( not ( = ?auto_26517 ?auto_26518 ) ) ( not ( = ?auto_26517 ?auto_26507 ) ) ( not ( = ?auto_26511 ?auto_26523 ) ) ( not ( = ?auto_26511 ?auto_26505 ) ) ( not ( = ?auto_26511 ?auto_26522 ) ) ( not ( = ?auto_26511 ?auto_26500 ) ) ( not ( = ?auto_26511 ?auto_26520 ) ) ( not ( = ?auto_26511 ?auto_26514 ) ) ( not ( = ?auto_26516 ?auto_26512 ) ) ( not ( = ?auto_26516 ?auto_26504 ) ) ( not ( = ?auto_26516 ?auto_26508 ) ) ( not ( = ?auto_26516 ?auto_26509 ) ) ( not ( = ?auto_26516 ?auto_26510 ) ) ( not ( = ?auto_26516 ?auto_26519 ) ) ( not ( = ?auto_26488 ?auto_26496 ) ) ( not ( = ?auto_26488 ?auto_26506 ) ) ( not ( = ?auto_26489 ?auto_26496 ) ) ( not ( = ?auto_26489 ?auto_26506 ) ) ( not ( = ?auto_26490 ?auto_26496 ) ) ( not ( = ?auto_26490 ?auto_26506 ) ) ( not ( = ?auto_26491 ?auto_26496 ) ) ( not ( = ?auto_26491 ?auto_26506 ) ) ( not ( = ?auto_26492 ?auto_26496 ) ) ( not ( = ?auto_26492 ?auto_26506 ) ) ( not ( = ?auto_26493 ?auto_26496 ) ) ( not ( = ?auto_26493 ?auto_26506 ) ) ( not ( = ?auto_26494 ?auto_26496 ) ) ( not ( = ?auto_26494 ?auto_26506 ) ) ( not ( = ?auto_26496 ?auto_26516 ) ) ( not ( = ?auto_26496 ?auto_26512 ) ) ( not ( = ?auto_26496 ?auto_26504 ) ) ( not ( = ?auto_26496 ?auto_26508 ) ) ( not ( = ?auto_26496 ?auto_26509 ) ) ( not ( = ?auto_26496 ?auto_26510 ) ) ( not ( = ?auto_26496 ?auto_26519 ) ) ( not ( = ?auto_26506 ?auto_26516 ) ) ( not ( = ?auto_26506 ?auto_26512 ) ) ( not ( = ?auto_26506 ?auto_26504 ) ) ( not ( = ?auto_26506 ?auto_26508 ) ) ( not ( = ?auto_26506 ?auto_26509 ) ) ( not ( = ?auto_26506 ?auto_26510 ) ) ( not ( = ?auto_26506 ?auto_26519 ) ) ( not ( = ?auto_26488 ?auto_26497 ) ) ( not ( = ?auto_26488 ?auto_26499 ) ) ( not ( = ?auto_26489 ?auto_26497 ) ) ( not ( = ?auto_26489 ?auto_26499 ) ) ( not ( = ?auto_26490 ?auto_26497 ) ) ( not ( = ?auto_26490 ?auto_26499 ) ) ( not ( = ?auto_26491 ?auto_26497 ) ) ( not ( = ?auto_26491 ?auto_26499 ) ) ( not ( = ?auto_26492 ?auto_26497 ) ) ( not ( = ?auto_26492 ?auto_26499 ) ) ( not ( = ?auto_26493 ?auto_26497 ) ) ( not ( = ?auto_26493 ?auto_26499 ) ) ( not ( = ?auto_26494 ?auto_26497 ) ) ( not ( = ?auto_26494 ?auto_26499 ) ) ( not ( = ?auto_26495 ?auto_26497 ) ) ( not ( = ?auto_26495 ?auto_26499 ) ) ( not ( = ?auto_26497 ?auto_26506 ) ) ( not ( = ?auto_26497 ?auto_26516 ) ) ( not ( = ?auto_26497 ?auto_26512 ) ) ( not ( = ?auto_26497 ?auto_26504 ) ) ( not ( = ?auto_26497 ?auto_26508 ) ) ( not ( = ?auto_26497 ?auto_26509 ) ) ( not ( = ?auto_26497 ?auto_26510 ) ) ( not ( = ?auto_26497 ?auto_26519 ) ) ( not ( = ?auto_26499 ?auto_26506 ) ) ( not ( = ?auto_26499 ?auto_26516 ) ) ( not ( = ?auto_26499 ?auto_26512 ) ) ( not ( = ?auto_26499 ?auto_26504 ) ) ( not ( = ?auto_26499 ?auto_26508 ) ) ( not ( = ?auto_26499 ?auto_26509 ) ) ( not ( = ?auto_26499 ?auto_26510 ) ) ( not ( = ?auto_26499 ?auto_26519 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_26488 ?auto_26489 ?auto_26490 ?auto_26491 ?auto_26492 ?auto_26493 ?auto_26494 ?auto_26495 ?auto_26496 )
      ( MAKE-1CRATE ?auto_26496 ?auto_26497 )
      ( MAKE-9CRATE-VERIFY ?auto_26488 ?auto_26489 ?auto_26490 ?auto_26491 ?auto_26492 ?auto_26493 ?auto_26494 ?auto_26495 ?auto_26496 ?auto_26497 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_26545 - SURFACE
      ?auto_26546 - SURFACE
      ?auto_26547 - SURFACE
      ?auto_26548 - SURFACE
      ?auto_26549 - SURFACE
      ?auto_26550 - SURFACE
      ?auto_26551 - SURFACE
      ?auto_26552 - SURFACE
      ?auto_26553 - SURFACE
      ?auto_26554 - SURFACE
      ?auto_26555 - SURFACE
    )
    :vars
    (
      ?auto_26559 - HOIST
      ?auto_26561 - PLACE
      ?auto_26560 - PLACE
      ?auto_26556 - HOIST
      ?auto_26557 - SURFACE
      ?auto_26568 - PLACE
      ?auto_26575 - HOIST
      ?auto_26565 - SURFACE
      ?auto_26571 - PLACE
      ?auto_26579 - HOIST
      ?auto_26577 - SURFACE
      ?auto_26581 - PLACE
      ?auto_26580 - HOIST
      ?auto_26583 - SURFACE
      ?auto_26582 - PLACE
      ?auto_26576 - HOIST
      ?auto_26569 - SURFACE
      ?auto_26562 - PLACE
      ?auto_26578 - HOIST
      ?auto_26567 - SURFACE
      ?auto_26570 - PLACE
      ?auto_26566 - HOIST
      ?auto_26574 - SURFACE
      ?auto_26573 - SURFACE
      ?auto_26572 - SURFACE
      ?auto_26563 - PLACE
      ?auto_26564 - HOIST
      ?auto_26584 - SURFACE
      ?auto_26558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26559 ?auto_26561 ) ( IS-CRATE ?auto_26555 ) ( not ( = ?auto_26560 ?auto_26561 ) ) ( HOIST-AT ?auto_26556 ?auto_26560 ) ( AVAILABLE ?auto_26556 ) ( SURFACE-AT ?auto_26555 ?auto_26560 ) ( ON ?auto_26555 ?auto_26557 ) ( CLEAR ?auto_26555 ) ( not ( = ?auto_26554 ?auto_26555 ) ) ( not ( = ?auto_26554 ?auto_26557 ) ) ( not ( = ?auto_26555 ?auto_26557 ) ) ( not ( = ?auto_26559 ?auto_26556 ) ) ( IS-CRATE ?auto_26554 ) ( not ( = ?auto_26568 ?auto_26561 ) ) ( HOIST-AT ?auto_26575 ?auto_26568 ) ( SURFACE-AT ?auto_26554 ?auto_26568 ) ( ON ?auto_26554 ?auto_26565 ) ( CLEAR ?auto_26554 ) ( not ( = ?auto_26553 ?auto_26554 ) ) ( not ( = ?auto_26553 ?auto_26565 ) ) ( not ( = ?auto_26554 ?auto_26565 ) ) ( not ( = ?auto_26559 ?auto_26575 ) ) ( IS-CRATE ?auto_26553 ) ( not ( = ?auto_26571 ?auto_26561 ) ) ( HOIST-AT ?auto_26579 ?auto_26571 ) ( SURFACE-AT ?auto_26553 ?auto_26571 ) ( ON ?auto_26553 ?auto_26577 ) ( CLEAR ?auto_26553 ) ( not ( = ?auto_26552 ?auto_26553 ) ) ( not ( = ?auto_26552 ?auto_26577 ) ) ( not ( = ?auto_26553 ?auto_26577 ) ) ( not ( = ?auto_26559 ?auto_26579 ) ) ( IS-CRATE ?auto_26552 ) ( not ( = ?auto_26581 ?auto_26561 ) ) ( HOIST-AT ?auto_26580 ?auto_26581 ) ( AVAILABLE ?auto_26580 ) ( SURFACE-AT ?auto_26552 ?auto_26581 ) ( ON ?auto_26552 ?auto_26583 ) ( CLEAR ?auto_26552 ) ( not ( = ?auto_26551 ?auto_26552 ) ) ( not ( = ?auto_26551 ?auto_26583 ) ) ( not ( = ?auto_26552 ?auto_26583 ) ) ( not ( = ?auto_26559 ?auto_26580 ) ) ( IS-CRATE ?auto_26551 ) ( not ( = ?auto_26582 ?auto_26561 ) ) ( HOIST-AT ?auto_26576 ?auto_26582 ) ( AVAILABLE ?auto_26576 ) ( SURFACE-AT ?auto_26551 ?auto_26582 ) ( ON ?auto_26551 ?auto_26569 ) ( CLEAR ?auto_26551 ) ( not ( = ?auto_26550 ?auto_26551 ) ) ( not ( = ?auto_26550 ?auto_26569 ) ) ( not ( = ?auto_26551 ?auto_26569 ) ) ( not ( = ?auto_26559 ?auto_26576 ) ) ( IS-CRATE ?auto_26550 ) ( not ( = ?auto_26562 ?auto_26561 ) ) ( HOIST-AT ?auto_26578 ?auto_26562 ) ( AVAILABLE ?auto_26578 ) ( SURFACE-AT ?auto_26550 ?auto_26562 ) ( ON ?auto_26550 ?auto_26567 ) ( CLEAR ?auto_26550 ) ( not ( = ?auto_26549 ?auto_26550 ) ) ( not ( = ?auto_26549 ?auto_26567 ) ) ( not ( = ?auto_26550 ?auto_26567 ) ) ( not ( = ?auto_26559 ?auto_26578 ) ) ( IS-CRATE ?auto_26549 ) ( not ( = ?auto_26570 ?auto_26561 ) ) ( HOIST-AT ?auto_26566 ?auto_26570 ) ( AVAILABLE ?auto_26566 ) ( SURFACE-AT ?auto_26549 ?auto_26570 ) ( ON ?auto_26549 ?auto_26574 ) ( CLEAR ?auto_26549 ) ( not ( = ?auto_26548 ?auto_26549 ) ) ( not ( = ?auto_26548 ?auto_26574 ) ) ( not ( = ?auto_26549 ?auto_26574 ) ) ( not ( = ?auto_26559 ?auto_26566 ) ) ( IS-CRATE ?auto_26548 ) ( AVAILABLE ?auto_26575 ) ( SURFACE-AT ?auto_26548 ?auto_26568 ) ( ON ?auto_26548 ?auto_26573 ) ( CLEAR ?auto_26548 ) ( not ( = ?auto_26547 ?auto_26548 ) ) ( not ( = ?auto_26547 ?auto_26573 ) ) ( not ( = ?auto_26548 ?auto_26573 ) ) ( IS-CRATE ?auto_26547 ) ( AVAILABLE ?auto_26579 ) ( SURFACE-AT ?auto_26547 ?auto_26571 ) ( ON ?auto_26547 ?auto_26572 ) ( CLEAR ?auto_26547 ) ( not ( = ?auto_26546 ?auto_26547 ) ) ( not ( = ?auto_26546 ?auto_26572 ) ) ( not ( = ?auto_26547 ?auto_26572 ) ) ( SURFACE-AT ?auto_26545 ?auto_26561 ) ( CLEAR ?auto_26545 ) ( IS-CRATE ?auto_26546 ) ( AVAILABLE ?auto_26559 ) ( not ( = ?auto_26563 ?auto_26561 ) ) ( HOIST-AT ?auto_26564 ?auto_26563 ) ( AVAILABLE ?auto_26564 ) ( SURFACE-AT ?auto_26546 ?auto_26563 ) ( ON ?auto_26546 ?auto_26584 ) ( CLEAR ?auto_26546 ) ( TRUCK-AT ?auto_26558 ?auto_26561 ) ( not ( = ?auto_26545 ?auto_26546 ) ) ( not ( = ?auto_26545 ?auto_26584 ) ) ( not ( = ?auto_26546 ?auto_26584 ) ) ( not ( = ?auto_26559 ?auto_26564 ) ) ( not ( = ?auto_26545 ?auto_26547 ) ) ( not ( = ?auto_26545 ?auto_26572 ) ) ( not ( = ?auto_26547 ?auto_26584 ) ) ( not ( = ?auto_26571 ?auto_26563 ) ) ( not ( = ?auto_26579 ?auto_26564 ) ) ( not ( = ?auto_26572 ?auto_26584 ) ) ( not ( = ?auto_26545 ?auto_26548 ) ) ( not ( = ?auto_26545 ?auto_26573 ) ) ( not ( = ?auto_26546 ?auto_26548 ) ) ( not ( = ?auto_26546 ?auto_26573 ) ) ( not ( = ?auto_26548 ?auto_26572 ) ) ( not ( = ?auto_26548 ?auto_26584 ) ) ( not ( = ?auto_26568 ?auto_26571 ) ) ( not ( = ?auto_26568 ?auto_26563 ) ) ( not ( = ?auto_26575 ?auto_26579 ) ) ( not ( = ?auto_26575 ?auto_26564 ) ) ( not ( = ?auto_26573 ?auto_26572 ) ) ( not ( = ?auto_26573 ?auto_26584 ) ) ( not ( = ?auto_26545 ?auto_26549 ) ) ( not ( = ?auto_26545 ?auto_26574 ) ) ( not ( = ?auto_26546 ?auto_26549 ) ) ( not ( = ?auto_26546 ?auto_26574 ) ) ( not ( = ?auto_26547 ?auto_26549 ) ) ( not ( = ?auto_26547 ?auto_26574 ) ) ( not ( = ?auto_26549 ?auto_26573 ) ) ( not ( = ?auto_26549 ?auto_26572 ) ) ( not ( = ?auto_26549 ?auto_26584 ) ) ( not ( = ?auto_26570 ?auto_26568 ) ) ( not ( = ?auto_26570 ?auto_26571 ) ) ( not ( = ?auto_26570 ?auto_26563 ) ) ( not ( = ?auto_26566 ?auto_26575 ) ) ( not ( = ?auto_26566 ?auto_26579 ) ) ( not ( = ?auto_26566 ?auto_26564 ) ) ( not ( = ?auto_26574 ?auto_26573 ) ) ( not ( = ?auto_26574 ?auto_26572 ) ) ( not ( = ?auto_26574 ?auto_26584 ) ) ( not ( = ?auto_26545 ?auto_26550 ) ) ( not ( = ?auto_26545 ?auto_26567 ) ) ( not ( = ?auto_26546 ?auto_26550 ) ) ( not ( = ?auto_26546 ?auto_26567 ) ) ( not ( = ?auto_26547 ?auto_26550 ) ) ( not ( = ?auto_26547 ?auto_26567 ) ) ( not ( = ?auto_26548 ?auto_26550 ) ) ( not ( = ?auto_26548 ?auto_26567 ) ) ( not ( = ?auto_26550 ?auto_26574 ) ) ( not ( = ?auto_26550 ?auto_26573 ) ) ( not ( = ?auto_26550 ?auto_26572 ) ) ( not ( = ?auto_26550 ?auto_26584 ) ) ( not ( = ?auto_26562 ?auto_26570 ) ) ( not ( = ?auto_26562 ?auto_26568 ) ) ( not ( = ?auto_26562 ?auto_26571 ) ) ( not ( = ?auto_26562 ?auto_26563 ) ) ( not ( = ?auto_26578 ?auto_26566 ) ) ( not ( = ?auto_26578 ?auto_26575 ) ) ( not ( = ?auto_26578 ?auto_26579 ) ) ( not ( = ?auto_26578 ?auto_26564 ) ) ( not ( = ?auto_26567 ?auto_26574 ) ) ( not ( = ?auto_26567 ?auto_26573 ) ) ( not ( = ?auto_26567 ?auto_26572 ) ) ( not ( = ?auto_26567 ?auto_26584 ) ) ( not ( = ?auto_26545 ?auto_26551 ) ) ( not ( = ?auto_26545 ?auto_26569 ) ) ( not ( = ?auto_26546 ?auto_26551 ) ) ( not ( = ?auto_26546 ?auto_26569 ) ) ( not ( = ?auto_26547 ?auto_26551 ) ) ( not ( = ?auto_26547 ?auto_26569 ) ) ( not ( = ?auto_26548 ?auto_26551 ) ) ( not ( = ?auto_26548 ?auto_26569 ) ) ( not ( = ?auto_26549 ?auto_26551 ) ) ( not ( = ?auto_26549 ?auto_26569 ) ) ( not ( = ?auto_26551 ?auto_26567 ) ) ( not ( = ?auto_26551 ?auto_26574 ) ) ( not ( = ?auto_26551 ?auto_26573 ) ) ( not ( = ?auto_26551 ?auto_26572 ) ) ( not ( = ?auto_26551 ?auto_26584 ) ) ( not ( = ?auto_26582 ?auto_26562 ) ) ( not ( = ?auto_26582 ?auto_26570 ) ) ( not ( = ?auto_26582 ?auto_26568 ) ) ( not ( = ?auto_26582 ?auto_26571 ) ) ( not ( = ?auto_26582 ?auto_26563 ) ) ( not ( = ?auto_26576 ?auto_26578 ) ) ( not ( = ?auto_26576 ?auto_26566 ) ) ( not ( = ?auto_26576 ?auto_26575 ) ) ( not ( = ?auto_26576 ?auto_26579 ) ) ( not ( = ?auto_26576 ?auto_26564 ) ) ( not ( = ?auto_26569 ?auto_26567 ) ) ( not ( = ?auto_26569 ?auto_26574 ) ) ( not ( = ?auto_26569 ?auto_26573 ) ) ( not ( = ?auto_26569 ?auto_26572 ) ) ( not ( = ?auto_26569 ?auto_26584 ) ) ( not ( = ?auto_26545 ?auto_26552 ) ) ( not ( = ?auto_26545 ?auto_26583 ) ) ( not ( = ?auto_26546 ?auto_26552 ) ) ( not ( = ?auto_26546 ?auto_26583 ) ) ( not ( = ?auto_26547 ?auto_26552 ) ) ( not ( = ?auto_26547 ?auto_26583 ) ) ( not ( = ?auto_26548 ?auto_26552 ) ) ( not ( = ?auto_26548 ?auto_26583 ) ) ( not ( = ?auto_26549 ?auto_26552 ) ) ( not ( = ?auto_26549 ?auto_26583 ) ) ( not ( = ?auto_26550 ?auto_26552 ) ) ( not ( = ?auto_26550 ?auto_26583 ) ) ( not ( = ?auto_26552 ?auto_26569 ) ) ( not ( = ?auto_26552 ?auto_26567 ) ) ( not ( = ?auto_26552 ?auto_26574 ) ) ( not ( = ?auto_26552 ?auto_26573 ) ) ( not ( = ?auto_26552 ?auto_26572 ) ) ( not ( = ?auto_26552 ?auto_26584 ) ) ( not ( = ?auto_26581 ?auto_26582 ) ) ( not ( = ?auto_26581 ?auto_26562 ) ) ( not ( = ?auto_26581 ?auto_26570 ) ) ( not ( = ?auto_26581 ?auto_26568 ) ) ( not ( = ?auto_26581 ?auto_26571 ) ) ( not ( = ?auto_26581 ?auto_26563 ) ) ( not ( = ?auto_26580 ?auto_26576 ) ) ( not ( = ?auto_26580 ?auto_26578 ) ) ( not ( = ?auto_26580 ?auto_26566 ) ) ( not ( = ?auto_26580 ?auto_26575 ) ) ( not ( = ?auto_26580 ?auto_26579 ) ) ( not ( = ?auto_26580 ?auto_26564 ) ) ( not ( = ?auto_26583 ?auto_26569 ) ) ( not ( = ?auto_26583 ?auto_26567 ) ) ( not ( = ?auto_26583 ?auto_26574 ) ) ( not ( = ?auto_26583 ?auto_26573 ) ) ( not ( = ?auto_26583 ?auto_26572 ) ) ( not ( = ?auto_26583 ?auto_26584 ) ) ( not ( = ?auto_26545 ?auto_26553 ) ) ( not ( = ?auto_26545 ?auto_26577 ) ) ( not ( = ?auto_26546 ?auto_26553 ) ) ( not ( = ?auto_26546 ?auto_26577 ) ) ( not ( = ?auto_26547 ?auto_26553 ) ) ( not ( = ?auto_26547 ?auto_26577 ) ) ( not ( = ?auto_26548 ?auto_26553 ) ) ( not ( = ?auto_26548 ?auto_26577 ) ) ( not ( = ?auto_26549 ?auto_26553 ) ) ( not ( = ?auto_26549 ?auto_26577 ) ) ( not ( = ?auto_26550 ?auto_26553 ) ) ( not ( = ?auto_26550 ?auto_26577 ) ) ( not ( = ?auto_26551 ?auto_26553 ) ) ( not ( = ?auto_26551 ?auto_26577 ) ) ( not ( = ?auto_26553 ?auto_26583 ) ) ( not ( = ?auto_26553 ?auto_26569 ) ) ( not ( = ?auto_26553 ?auto_26567 ) ) ( not ( = ?auto_26553 ?auto_26574 ) ) ( not ( = ?auto_26553 ?auto_26573 ) ) ( not ( = ?auto_26553 ?auto_26572 ) ) ( not ( = ?auto_26553 ?auto_26584 ) ) ( not ( = ?auto_26577 ?auto_26583 ) ) ( not ( = ?auto_26577 ?auto_26569 ) ) ( not ( = ?auto_26577 ?auto_26567 ) ) ( not ( = ?auto_26577 ?auto_26574 ) ) ( not ( = ?auto_26577 ?auto_26573 ) ) ( not ( = ?auto_26577 ?auto_26572 ) ) ( not ( = ?auto_26577 ?auto_26584 ) ) ( not ( = ?auto_26545 ?auto_26554 ) ) ( not ( = ?auto_26545 ?auto_26565 ) ) ( not ( = ?auto_26546 ?auto_26554 ) ) ( not ( = ?auto_26546 ?auto_26565 ) ) ( not ( = ?auto_26547 ?auto_26554 ) ) ( not ( = ?auto_26547 ?auto_26565 ) ) ( not ( = ?auto_26548 ?auto_26554 ) ) ( not ( = ?auto_26548 ?auto_26565 ) ) ( not ( = ?auto_26549 ?auto_26554 ) ) ( not ( = ?auto_26549 ?auto_26565 ) ) ( not ( = ?auto_26550 ?auto_26554 ) ) ( not ( = ?auto_26550 ?auto_26565 ) ) ( not ( = ?auto_26551 ?auto_26554 ) ) ( not ( = ?auto_26551 ?auto_26565 ) ) ( not ( = ?auto_26552 ?auto_26554 ) ) ( not ( = ?auto_26552 ?auto_26565 ) ) ( not ( = ?auto_26554 ?auto_26577 ) ) ( not ( = ?auto_26554 ?auto_26583 ) ) ( not ( = ?auto_26554 ?auto_26569 ) ) ( not ( = ?auto_26554 ?auto_26567 ) ) ( not ( = ?auto_26554 ?auto_26574 ) ) ( not ( = ?auto_26554 ?auto_26573 ) ) ( not ( = ?auto_26554 ?auto_26572 ) ) ( not ( = ?auto_26554 ?auto_26584 ) ) ( not ( = ?auto_26565 ?auto_26577 ) ) ( not ( = ?auto_26565 ?auto_26583 ) ) ( not ( = ?auto_26565 ?auto_26569 ) ) ( not ( = ?auto_26565 ?auto_26567 ) ) ( not ( = ?auto_26565 ?auto_26574 ) ) ( not ( = ?auto_26565 ?auto_26573 ) ) ( not ( = ?auto_26565 ?auto_26572 ) ) ( not ( = ?auto_26565 ?auto_26584 ) ) ( not ( = ?auto_26545 ?auto_26555 ) ) ( not ( = ?auto_26545 ?auto_26557 ) ) ( not ( = ?auto_26546 ?auto_26555 ) ) ( not ( = ?auto_26546 ?auto_26557 ) ) ( not ( = ?auto_26547 ?auto_26555 ) ) ( not ( = ?auto_26547 ?auto_26557 ) ) ( not ( = ?auto_26548 ?auto_26555 ) ) ( not ( = ?auto_26548 ?auto_26557 ) ) ( not ( = ?auto_26549 ?auto_26555 ) ) ( not ( = ?auto_26549 ?auto_26557 ) ) ( not ( = ?auto_26550 ?auto_26555 ) ) ( not ( = ?auto_26550 ?auto_26557 ) ) ( not ( = ?auto_26551 ?auto_26555 ) ) ( not ( = ?auto_26551 ?auto_26557 ) ) ( not ( = ?auto_26552 ?auto_26555 ) ) ( not ( = ?auto_26552 ?auto_26557 ) ) ( not ( = ?auto_26553 ?auto_26555 ) ) ( not ( = ?auto_26553 ?auto_26557 ) ) ( not ( = ?auto_26555 ?auto_26565 ) ) ( not ( = ?auto_26555 ?auto_26577 ) ) ( not ( = ?auto_26555 ?auto_26583 ) ) ( not ( = ?auto_26555 ?auto_26569 ) ) ( not ( = ?auto_26555 ?auto_26567 ) ) ( not ( = ?auto_26555 ?auto_26574 ) ) ( not ( = ?auto_26555 ?auto_26573 ) ) ( not ( = ?auto_26555 ?auto_26572 ) ) ( not ( = ?auto_26555 ?auto_26584 ) ) ( not ( = ?auto_26560 ?auto_26568 ) ) ( not ( = ?auto_26560 ?auto_26571 ) ) ( not ( = ?auto_26560 ?auto_26581 ) ) ( not ( = ?auto_26560 ?auto_26582 ) ) ( not ( = ?auto_26560 ?auto_26562 ) ) ( not ( = ?auto_26560 ?auto_26570 ) ) ( not ( = ?auto_26560 ?auto_26563 ) ) ( not ( = ?auto_26556 ?auto_26575 ) ) ( not ( = ?auto_26556 ?auto_26579 ) ) ( not ( = ?auto_26556 ?auto_26580 ) ) ( not ( = ?auto_26556 ?auto_26576 ) ) ( not ( = ?auto_26556 ?auto_26578 ) ) ( not ( = ?auto_26556 ?auto_26566 ) ) ( not ( = ?auto_26556 ?auto_26564 ) ) ( not ( = ?auto_26557 ?auto_26565 ) ) ( not ( = ?auto_26557 ?auto_26577 ) ) ( not ( = ?auto_26557 ?auto_26583 ) ) ( not ( = ?auto_26557 ?auto_26569 ) ) ( not ( = ?auto_26557 ?auto_26567 ) ) ( not ( = ?auto_26557 ?auto_26574 ) ) ( not ( = ?auto_26557 ?auto_26573 ) ) ( not ( = ?auto_26557 ?auto_26572 ) ) ( not ( = ?auto_26557 ?auto_26584 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_26545 ?auto_26546 ?auto_26547 ?auto_26548 ?auto_26549 ?auto_26550 ?auto_26551 ?auto_26552 ?auto_26553 ?auto_26554 )
      ( MAKE-1CRATE ?auto_26554 ?auto_26555 )
      ( MAKE-10CRATE-VERIFY ?auto_26545 ?auto_26546 ?auto_26547 ?auto_26548 ?auto_26549 ?auto_26550 ?auto_26551 ?auto_26552 ?auto_26553 ?auto_26554 ?auto_26555 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_26607 - SURFACE
      ?auto_26608 - SURFACE
      ?auto_26609 - SURFACE
      ?auto_26610 - SURFACE
      ?auto_26611 - SURFACE
      ?auto_26612 - SURFACE
      ?auto_26613 - SURFACE
      ?auto_26614 - SURFACE
      ?auto_26615 - SURFACE
      ?auto_26616 - SURFACE
      ?auto_26617 - SURFACE
      ?auto_26618 - SURFACE
    )
    :vars
    (
      ?auto_26622 - HOIST
      ?auto_26623 - PLACE
      ?auto_26620 - PLACE
      ?auto_26624 - HOIST
      ?auto_26621 - SURFACE
      ?auto_26649 - PLACE
      ?auto_26625 - HOIST
      ?auto_26633 - SURFACE
      ?auto_26645 - PLACE
      ?auto_26642 - HOIST
      ?auto_26627 - SURFACE
      ?auto_26640 - PLACE
      ?auto_26646 - HOIST
      ?auto_26650 - SURFACE
      ?auto_26637 - PLACE
      ?auto_26632 - HOIST
      ?auto_26639 - SURFACE
      ?auto_26638 - PLACE
      ?auto_26634 - HOIST
      ?auto_26635 - SURFACE
      ?auto_26628 - PLACE
      ?auto_26629 - HOIST
      ?auto_26643 - SURFACE
      ?auto_26636 - PLACE
      ?auto_26647 - HOIST
      ?auto_26641 - SURFACE
      ?auto_26631 - SURFACE
      ?auto_26626 - SURFACE
      ?auto_26648 - PLACE
      ?auto_26630 - HOIST
      ?auto_26644 - SURFACE
      ?auto_26619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26622 ?auto_26623 ) ( IS-CRATE ?auto_26618 ) ( not ( = ?auto_26620 ?auto_26623 ) ) ( HOIST-AT ?auto_26624 ?auto_26620 ) ( AVAILABLE ?auto_26624 ) ( SURFACE-AT ?auto_26618 ?auto_26620 ) ( ON ?auto_26618 ?auto_26621 ) ( CLEAR ?auto_26618 ) ( not ( = ?auto_26617 ?auto_26618 ) ) ( not ( = ?auto_26617 ?auto_26621 ) ) ( not ( = ?auto_26618 ?auto_26621 ) ) ( not ( = ?auto_26622 ?auto_26624 ) ) ( IS-CRATE ?auto_26617 ) ( not ( = ?auto_26649 ?auto_26623 ) ) ( HOIST-AT ?auto_26625 ?auto_26649 ) ( AVAILABLE ?auto_26625 ) ( SURFACE-AT ?auto_26617 ?auto_26649 ) ( ON ?auto_26617 ?auto_26633 ) ( CLEAR ?auto_26617 ) ( not ( = ?auto_26616 ?auto_26617 ) ) ( not ( = ?auto_26616 ?auto_26633 ) ) ( not ( = ?auto_26617 ?auto_26633 ) ) ( not ( = ?auto_26622 ?auto_26625 ) ) ( IS-CRATE ?auto_26616 ) ( not ( = ?auto_26645 ?auto_26623 ) ) ( HOIST-AT ?auto_26642 ?auto_26645 ) ( SURFACE-AT ?auto_26616 ?auto_26645 ) ( ON ?auto_26616 ?auto_26627 ) ( CLEAR ?auto_26616 ) ( not ( = ?auto_26615 ?auto_26616 ) ) ( not ( = ?auto_26615 ?auto_26627 ) ) ( not ( = ?auto_26616 ?auto_26627 ) ) ( not ( = ?auto_26622 ?auto_26642 ) ) ( IS-CRATE ?auto_26615 ) ( not ( = ?auto_26640 ?auto_26623 ) ) ( HOIST-AT ?auto_26646 ?auto_26640 ) ( SURFACE-AT ?auto_26615 ?auto_26640 ) ( ON ?auto_26615 ?auto_26650 ) ( CLEAR ?auto_26615 ) ( not ( = ?auto_26614 ?auto_26615 ) ) ( not ( = ?auto_26614 ?auto_26650 ) ) ( not ( = ?auto_26615 ?auto_26650 ) ) ( not ( = ?auto_26622 ?auto_26646 ) ) ( IS-CRATE ?auto_26614 ) ( not ( = ?auto_26637 ?auto_26623 ) ) ( HOIST-AT ?auto_26632 ?auto_26637 ) ( AVAILABLE ?auto_26632 ) ( SURFACE-AT ?auto_26614 ?auto_26637 ) ( ON ?auto_26614 ?auto_26639 ) ( CLEAR ?auto_26614 ) ( not ( = ?auto_26613 ?auto_26614 ) ) ( not ( = ?auto_26613 ?auto_26639 ) ) ( not ( = ?auto_26614 ?auto_26639 ) ) ( not ( = ?auto_26622 ?auto_26632 ) ) ( IS-CRATE ?auto_26613 ) ( not ( = ?auto_26638 ?auto_26623 ) ) ( HOIST-AT ?auto_26634 ?auto_26638 ) ( AVAILABLE ?auto_26634 ) ( SURFACE-AT ?auto_26613 ?auto_26638 ) ( ON ?auto_26613 ?auto_26635 ) ( CLEAR ?auto_26613 ) ( not ( = ?auto_26612 ?auto_26613 ) ) ( not ( = ?auto_26612 ?auto_26635 ) ) ( not ( = ?auto_26613 ?auto_26635 ) ) ( not ( = ?auto_26622 ?auto_26634 ) ) ( IS-CRATE ?auto_26612 ) ( not ( = ?auto_26628 ?auto_26623 ) ) ( HOIST-AT ?auto_26629 ?auto_26628 ) ( AVAILABLE ?auto_26629 ) ( SURFACE-AT ?auto_26612 ?auto_26628 ) ( ON ?auto_26612 ?auto_26643 ) ( CLEAR ?auto_26612 ) ( not ( = ?auto_26611 ?auto_26612 ) ) ( not ( = ?auto_26611 ?auto_26643 ) ) ( not ( = ?auto_26612 ?auto_26643 ) ) ( not ( = ?auto_26622 ?auto_26629 ) ) ( IS-CRATE ?auto_26611 ) ( not ( = ?auto_26636 ?auto_26623 ) ) ( HOIST-AT ?auto_26647 ?auto_26636 ) ( AVAILABLE ?auto_26647 ) ( SURFACE-AT ?auto_26611 ?auto_26636 ) ( ON ?auto_26611 ?auto_26641 ) ( CLEAR ?auto_26611 ) ( not ( = ?auto_26610 ?auto_26611 ) ) ( not ( = ?auto_26610 ?auto_26641 ) ) ( not ( = ?auto_26611 ?auto_26641 ) ) ( not ( = ?auto_26622 ?auto_26647 ) ) ( IS-CRATE ?auto_26610 ) ( AVAILABLE ?auto_26642 ) ( SURFACE-AT ?auto_26610 ?auto_26645 ) ( ON ?auto_26610 ?auto_26631 ) ( CLEAR ?auto_26610 ) ( not ( = ?auto_26609 ?auto_26610 ) ) ( not ( = ?auto_26609 ?auto_26631 ) ) ( not ( = ?auto_26610 ?auto_26631 ) ) ( IS-CRATE ?auto_26609 ) ( AVAILABLE ?auto_26646 ) ( SURFACE-AT ?auto_26609 ?auto_26640 ) ( ON ?auto_26609 ?auto_26626 ) ( CLEAR ?auto_26609 ) ( not ( = ?auto_26608 ?auto_26609 ) ) ( not ( = ?auto_26608 ?auto_26626 ) ) ( not ( = ?auto_26609 ?auto_26626 ) ) ( SURFACE-AT ?auto_26607 ?auto_26623 ) ( CLEAR ?auto_26607 ) ( IS-CRATE ?auto_26608 ) ( AVAILABLE ?auto_26622 ) ( not ( = ?auto_26648 ?auto_26623 ) ) ( HOIST-AT ?auto_26630 ?auto_26648 ) ( AVAILABLE ?auto_26630 ) ( SURFACE-AT ?auto_26608 ?auto_26648 ) ( ON ?auto_26608 ?auto_26644 ) ( CLEAR ?auto_26608 ) ( TRUCK-AT ?auto_26619 ?auto_26623 ) ( not ( = ?auto_26607 ?auto_26608 ) ) ( not ( = ?auto_26607 ?auto_26644 ) ) ( not ( = ?auto_26608 ?auto_26644 ) ) ( not ( = ?auto_26622 ?auto_26630 ) ) ( not ( = ?auto_26607 ?auto_26609 ) ) ( not ( = ?auto_26607 ?auto_26626 ) ) ( not ( = ?auto_26609 ?auto_26644 ) ) ( not ( = ?auto_26640 ?auto_26648 ) ) ( not ( = ?auto_26646 ?auto_26630 ) ) ( not ( = ?auto_26626 ?auto_26644 ) ) ( not ( = ?auto_26607 ?auto_26610 ) ) ( not ( = ?auto_26607 ?auto_26631 ) ) ( not ( = ?auto_26608 ?auto_26610 ) ) ( not ( = ?auto_26608 ?auto_26631 ) ) ( not ( = ?auto_26610 ?auto_26626 ) ) ( not ( = ?auto_26610 ?auto_26644 ) ) ( not ( = ?auto_26645 ?auto_26640 ) ) ( not ( = ?auto_26645 ?auto_26648 ) ) ( not ( = ?auto_26642 ?auto_26646 ) ) ( not ( = ?auto_26642 ?auto_26630 ) ) ( not ( = ?auto_26631 ?auto_26626 ) ) ( not ( = ?auto_26631 ?auto_26644 ) ) ( not ( = ?auto_26607 ?auto_26611 ) ) ( not ( = ?auto_26607 ?auto_26641 ) ) ( not ( = ?auto_26608 ?auto_26611 ) ) ( not ( = ?auto_26608 ?auto_26641 ) ) ( not ( = ?auto_26609 ?auto_26611 ) ) ( not ( = ?auto_26609 ?auto_26641 ) ) ( not ( = ?auto_26611 ?auto_26631 ) ) ( not ( = ?auto_26611 ?auto_26626 ) ) ( not ( = ?auto_26611 ?auto_26644 ) ) ( not ( = ?auto_26636 ?auto_26645 ) ) ( not ( = ?auto_26636 ?auto_26640 ) ) ( not ( = ?auto_26636 ?auto_26648 ) ) ( not ( = ?auto_26647 ?auto_26642 ) ) ( not ( = ?auto_26647 ?auto_26646 ) ) ( not ( = ?auto_26647 ?auto_26630 ) ) ( not ( = ?auto_26641 ?auto_26631 ) ) ( not ( = ?auto_26641 ?auto_26626 ) ) ( not ( = ?auto_26641 ?auto_26644 ) ) ( not ( = ?auto_26607 ?auto_26612 ) ) ( not ( = ?auto_26607 ?auto_26643 ) ) ( not ( = ?auto_26608 ?auto_26612 ) ) ( not ( = ?auto_26608 ?auto_26643 ) ) ( not ( = ?auto_26609 ?auto_26612 ) ) ( not ( = ?auto_26609 ?auto_26643 ) ) ( not ( = ?auto_26610 ?auto_26612 ) ) ( not ( = ?auto_26610 ?auto_26643 ) ) ( not ( = ?auto_26612 ?auto_26641 ) ) ( not ( = ?auto_26612 ?auto_26631 ) ) ( not ( = ?auto_26612 ?auto_26626 ) ) ( not ( = ?auto_26612 ?auto_26644 ) ) ( not ( = ?auto_26628 ?auto_26636 ) ) ( not ( = ?auto_26628 ?auto_26645 ) ) ( not ( = ?auto_26628 ?auto_26640 ) ) ( not ( = ?auto_26628 ?auto_26648 ) ) ( not ( = ?auto_26629 ?auto_26647 ) ) ( not ( = ?auto_26629 ?auto_26642 ) ) ( not ( = ?auto_26629 ?auto_26646 ) ) ( not ( = ?auto_26629 ?auto_26630 ) ) ( not ( = ?auto_26643 ?auto_26641 ) ) ( not ( = ?auto_26643 ?auto_26631 ) ) ( not ( = ?auto_26643 ?auto_26626 ) ) ( not ( = ?auto_26643 ?auto_26644 ) ) ( not ( = ?auto_26607 ?auto_26613 ) ) ( not ( = ?auto_26607 ?auto_26635 ) ) ( not ( = ?auto_26608 ?auto_26613 ) ) ( not ( = ?auto_26608 ?auto_26635 ) ) ( not ( = ?auto_26609 ?auto_26613 ) ) ( not ( = ?auto_26609 ?auto_26635 ) ) ( not ( = ?auto_26610 ?auto_26613 ) ) ( not ( = ?auto_26610 ?auto_26635 ) ) ( not ( = ?auto_26611 ?auto_26613 ) ) ( not ( = ?auto_26611 ?auto_26635 ) ) ( not ( = ?auto_26613 ?auto_26643 ) ) ( not ( = ?auto_26613 ?auto_26641 ) ) ( not ( = ?auto_26613 ?auto_26631 ) ) ( not ( = ?auto_26613 ?auto_26626 ) ) ( not ( = ?auto_26613 ?auto_26644 ) ) ( not ( = ?auto_26638 ?auto_26628 ) ) ( not ( = ?auto_26638 ?auto_26636 ) ) ( not ( = ?auto_26638 ?auto_26645 ) ) ( not ( = ?auto_26638 ?auto_26640 ) ) ( not ( = ?auto_26638 ?auto_26648 ) ) ( not ( = ?auto_26634 ?auto_26629 ) ) ( not ( = ?auto_26634 ?auto_26647 ) ) ( not ( = ?auto_26634 ?auto_26642 ) ) ( not ( = ?auto_26634 ?auto_26646 ) ) ( not ( = ?auto_26634 ?auto_26630 ) ) ( not ( = ?auto_26635 ?auto_26643 ) ) ( not ( = ?auto_26635 ?auto_26641 ) ) ( not ( = ?auto_26635 ?auto_26631 ) ) ( not ( = ?auto_26635 ?auto_26626 ) ) ( not ( = ?auto_26635 ?auto_26644 ) ) ( not ( = ?auto_26607 ?auto_26614 ) ) ( not ( = ?auto_26607 ?auto_26639 ) ) ( not ( = ?auto_26608 ?auto_26614 ) ) ( not ( = ?auto_26608 ?auto_26639 ) ) ( not ( = ?auto_26609 ?auto_26614 ) ) ( not ( = ?auto_26609 ?auto_26639 ) ) ( not ( = ?auto_26610 ?auto_26614 ) ) ( not ( = ?auto_26610 ?auto_26639 ) ) ( not ( = ?auto_26611 ?auto_26614 ) ) ( not ( = ?auto_26611 ?auto_26639 ) ) ( not ( = ?auto_26612 ?auto_26614 ) ) ( not ( = ?auto_26612 ?auto_26639 ) ) ( not ( = ?auto_26614 ?auto_26635 ) ) ( not ( = ?auto_26614 ?auto_26643 ) ) ( not ( = ?auto_26614 ?auto_26641 ) ) ( not ( = ?auto_26614 ?auto_26631 ) ) ( not ( = ?auto_26614 ?auto_26626 ) ) ( not ( = ?auto_26614 ?auto_26644 ) ) ( not ( = ?auto_26637 ?auto_26638 ) ) ( not ( = ?auto_26637 ?auto_26628 ) ) ( not ( = ?auto_26637 ?auto_26636 ) ) ( not ( = ?auto_26637 ?auto_26645 ) ) ( not ( = ?auto_26637 ?auto_26640 ) ) ( not ( = ?auto_26637 ?auto_26648 ) ) ( not ( = ?auto_26632 ?auto_26634 ) ) ( not ( = ?auto_26632 ?auto_26629 ) ) ( not ( = ?auto_26632 ?auto_26647 ) ) ( not ( = ?auto_26632 ?auto_26642 ) ) ( not ( = ?auto_26632 ?auto_26646 ) ) ( not ( = ?auto_26632 ?auto_26630 ) ) ( not ( = ?auto_26639 ?auto_26635 ) ) ( not ( = ?auto_26639 ?auto_26643 ) ) ( not ( = ?auto_26639 ?auto_26641 ) ) ( not ( = ?auto_26639 ?auto_26631 ) ) ( not ( = ?auto_26639 ?auto_26626 ) ) ( not ( = ?auto_26639 ?auto_26644 ) ) ( not ( = ?auto_26607 ?auto_26615 ) ) ( not ( = ?auto_26607 ?auto_26650 ) ) ( not ( = ?auto_26608 ?auto_26615 ) ) ( not ( = ?auto_26608 ?auto_26650 ) ) ( not ( = ?auto_26609 ?auto_26615 ) ) ( not ( = ?auto_26609 ?auto_26650 ) ) ( not ( = ?auto_26610 ?auto_26615 ) ) ( not ( = ?auto_26610 ?auto_26650 ) ) ( not ( = ?auto_26611 ?auto_26615 ) ) ( not ( = ?auto_26611 ?auto_26650 ) ) ( not ( = ?auto_26612 ?auto_26615 ) ) ( not ( = ?auto_26612 ?auto_26650 ) ) ( not ( = ?auto_26613 ?auto_26615 ) ) ( not ( = ?auto_26613 ?auto_26650 ) ) ( not ( = ?auto_26615 ?auto_26639 ) ) ( not ( = ?auto_26615 ?auto_26635 ) ) ( not ( = ?auto_26615 ?auto_26643 ) ) ( not ( = ?auto_26615 ?auto_26641 ) ) ( not ( = ?auto_26615 ?auto_26631 ) ) ( not ( = ?auto_26615 ?auto_26626 ) ) ( not ( = ?auto_26615 ?auto_26644 ) ) ( not ( = ?auto_26650 ?auto_26639 ) ) ( not ( = ?auto_26650 ?auto_26635 ) ) ( not ( = ?auto_26650 ?auto_26643 ) ) ( not ( = ?auto_26650 ?auto_26641 ) ) ( not ( = ?auto_26650 ?auto_26631 ) ) ( not ( = ?auto_26650 ?auto_26626 ) ) ( not ( = ?auto_26650 ?auto_26644 ) ) ( not ( = ?auto_26607 ?auto_26616 ) ) ( not ( = ?auto_26607 ?auto_26627 ) ) ( not ( = ?auto_26608 ?auto_26616 ) ) ( not ( = ?auto_26608 ?auto_26627 ) ) ( not ( = ?auto_26609 ?auto_26616 ) ) ( not ( = ?auto_26609 ?auto_26627 ) ) ( not ( = ?auto_26610 ?auto_26616 ) ) ( not ( = ?auto_26610 ?auto_26627 ) ) ( not ( = ?auto_26611 ?auto_26616 ) ) ( not ( = ?auto_26611 ?auto_26627 ) ) ( not ( = ?auto_26612 ?auto_26616 ) ) ( not ( = ?auto_26612 ?auto_26627 ) ) ( not ( = ?auto_26613 ?auto_26616 ) ) ( not ( = ?auto_26613 ?auto_26627 ) ) ( not ( = ?auto_26614 ?auto_26616 ) ) ( not ( = ?auto_26614 ?auto_26627 ) ) ( not ( = ?auto_26616 ?auto_26650 ) ) ( not ( = ?auto_26616 ?auto_26639 ) ) ( not ( = ?auto_26616 ?auto_26635 ) ) ( not ( = ?auto_26616 ?auto_26643 ) ) ( not ( = ?auto_26616 ?auto_26641 ) ) ( not ( = ?auto_26616 ?auto_26631 ) ) ( not ( = ?auto_26616 ?auto_26626 ) ) ( not ( = ?auto_26616 ?auto_26644 ) ) ( not ( = ?auto_26627 ?auto_26650 ) ) ( not ( = ?auto_26627 ?auto_26639 ) ) ( not ( = ?auto_26627 ?auto_26635 ) ) ( not ( = ?auto_26627 ?auto_26643 ) ) ( not ( = ?auto_26627 ?auto_26641 ) ) ( not ( = ?auto_26627 ?auto_26631 ) ) ( not ( = ?auto_26627 ?auto_26626 ) ) ( not ( = ?auto_26627 ?auto_26644 ) ) ( not ( = ?auto_26607 ?auto_26617 ) ) ( not ( = ?auto_26607 ?auto_26633 ) ) ( not ( = ?auto_26608 ?auto_26617 ) ) ( not ( = ?auto_26608 ?auto_26633 ) ) ( not ( = ?auto_26609 ?auto_26617 ) ) ( not ( = ?auto_26609 ?auto_26633 ) ) ( not ( = ?auto_26610 ?auto_26617 ) ) ( not ( = ?auto_26610 ?auto_26633 ) ) ( not ( = ?auto_26611 ?auto_26617 ) ) ( not ( = ?auto_26611 ?auto_26633 ) ) ( not ( = ?auto_26612 ?auto_26617 ) ) ( not ( = ?auto_26612 ?auto_26633 ) ) ( not ( = ?auto_26613 ?auto_26617 ) ) ( not ( = ?auto_26613 ?auto_26633 ) ) ( not ( = ?auto_26614 ?auto_26617 ) ) ( not ( = ?auto_26614 ?auto_26633 ) ) ( not ( = ?auto_26615 ?auto_26617 ) ) ( not ( = ?auto_26615 ?auto_26633 ) ) ( not ( = ?auto_26617 ?auto_26627 ) ) ( not ( = ?auto_26617 ?auto_26650 ) ) ( not ( = ?auto_26617 ?auto_26639 ) ) ( not ( = ?auto_26617 ?auto_26635 ) ) ( not ( = ?auto_26617 ?auto_26643 ) ) ( not ( = ?auto_26617 ?auto_26641 ) ) ( not ( = ?auto_26617 ?auto_26631 ) ) ( not ( = ?auto_26617 ?auto_26626 ) ) ( not ( = ?auto_26617 ?auto_26644 ) ) ( not ( = ?auto_26649 ?auto_26645 ) ) ( not ( = ?auto_26649 ?auto_26640 ) ) ( not ( = ?auto_26649 ?auto_26637 ) ) ( not ( = ?auto_26649 ?auto_26638 ) ) ( not ( = ?auto_26649 ?auto_26628 ) ) ( not ( = ?auto_26649 ?auto_26636 ) ) ( not ( = ?auto_26649 ?auto_26648 ) ) ( not ( = ?auto_26625 ?auto_26642 ) ) ( not ( = ?auto_26625 ?auto_26646 ) ) ( not ( = ?auto_26625 ?auto_26632 ) ) ( not ( = ?auto_26625 ?auto_26634 ) ) ( not ( = ?auto_26625 ?auto_26629 ) ) ( not ( = ?auto_26625 ?auto_26647 ) ) ( not ( = ?auto_26625 ?auto_26630 ) ) ( not ( = ?auto_26633 ?auto_26627 ) ) ( not ( = ?auto_26633 ?auto_26650 ) ) ( not ( = ?auto_26633 ?auto_26639 ) ) ( not ( = ?auto_26633 ?auto_26635 ) ) ( not ( = ?auto_26633 ?auto_26643 ) ) ( not ( = ?auto_26633 ?auto_26641 ) ) ( not ( = ?auto_26633 ?auto_26631 ) ) ( not ( = ?auto_26633 ?auto_26626 ) ) ( not ( = ?auto_26633 ?auto_26644 ) ) ( not ( = ?auto_26607 ?auto_26618 ) ) ( not ( = ?auto_26607 ?auto_26621 ) ) ( not ( = ?auto_26608 ?auto_26618 ) ) ( not ( = ?auto_26608 ?auto_26621 ) ) ( not ( = ?auto_26609 ?auto_26618 ) ) ( not ( = ?auto_26609 ?auto_26621 ) ) ( not ( = ?auto_26610 ?auto_26618 ) ) ( not ( = ?auto_26610 ?auto_26621 ) ) ( not ( = ?auto_26611 ?auto_26618 ) ) ( not ( = ?auto_26611 ?auto_26621 ) ) ( not ( = ?auto_26612 ?auto_26618 ) ) ( not ( = ?auto_26612 ?auto_26621 ) ) ( not ( = ?auto_26613 ?auto_26618 ) ) ( not ( = ?auto_26613 ?auto_26621 ) ) ( not ( = ?auto_26614 ?auto_26618 ) ) ( not ( = ?auto_26614 ?auto_26621 ) ) ( not ( = ?auto_26615 ?auto_26618 ) ) ( not ( = ?auto_26615 ?auto_26621 ) ) ( not ( = ?auto_26616 ?auto_26618 ) ) ( not ( = ?auto_26616 ?auto_26621 ) ) ( not ( = ?auto_26618 ?auto_26633 ) ) ( not ( = ?auto_26618 ?auto_26627 ) ) ( not ( = ?auto_26618 ?auto_26650 ) ) ( not ( = ?auto_26618 ?auto_26639 ) ) ( not ( = ?auto_26618 ?auto_26635 ) ) ( not ( = ?auto_26618 ?auto_26643 ) ) ( not ( = ?auto_26618 ?auto_26641 ) ) ( not ( = ?auto_26618 ?auto_26631 ) ) ( not ( = ?auto_26618 ?auto_26626 ) ) ( not ( = ?auto_26618 ?auto_26644 ) ) ( not ( = ?auto_26620 ?auto_26649 ) ) ( not ( = ?auto_26620 ?auto_26645 ) ) ( not ( = ?auto_26620 ?auto_26640 ) ) ( not ( = ?auto_26620 ?auto_26637 ) ) ( not ( = ?auto_26620 ?auto_26638 ) ) ( not ( = ?auto_26620 ?auto_26628 ) ) ( not ( = ?auto_26620 ?auto_26636 ) ) ( not ( = ?auto_26620 ?auto_26648 ) ) ( not ( = ?auto_26624 ?auto_26625 ) ) ( not ( = ?auto_26624 ?auto_26642 ) ) ( not ( = ?auto_26624 ?auto_26646 ) ) ( not ( = ?auto_26624 ?auto_26632 ) ) ( not ( = ?auto_26624 ?auto_26634 ) ) ( not ( = ?auto_26624 ?auto_26629 ) ) ( not ( = ?auto_26624 ?auto_26647 ) ) ( not ( = ?auto_26624 ?auto_26630 ) ) ( not ( = ?auto_26621 ?auto_26633 ) ) ( not ( = ?auto_26621 ?auto_26627 ) ) ( not ( = ?auto_26621 ?auto_26650 ) ) ( not ( = ?auto_26621 ?auto_26639 ) ) ( not ( = ?auto_26621 ?auto_26635 ) ) ( not ( = ?auto_26621 ?auto_26643 ) ) ( not ( = ?auto_26621 ?auto_26641 ) ) ( not ( = ?auto_26621 ?auto_26631 ) ) ( not ( = ?auto_26621 ?auto_26626 ) ) ( not ( = ?auto_26621 ?auto_26644 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_26607 ?auto_26608 ?auto_26609 ?auto_26610 ?auto_26611 ?auto_26612 ?auto_26613 ?auto_26614 ?auto_26615 ?auto_26616 ?auto_26617 )
      ( MAKE-1CRATE ?auto_26617 ?auto_26618 )
      ( MAKE-11CRATE-VERIFY ?auto_26607 ?auto_26608 ?auto_26609 ?auto_26610 ?auto_26611 ?auto_26612 ?auto_26613 ?auto_26614 ?auto_26615 ?auto_26616 ?auto_26617 ?auto_26618 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_26674 - SURFACE
      ?auto_26675 - SURFACE
      ?auto_26676 - SURFACE
      ?auto_26677 - SURFACE
      ?auto_26678 - SURFACE
      ?auto_26679 - SURFACE
      ?auto_26680 - SURFACE
      ?auto_26681 - SURFACE
      ?auto_26682 - SURFACE
      ?auto_26683 - SURFACE
      ?auto_26684 - SURFACE
      ?auto_26685 - SURFACE
      ?auto_26686 - SURFACE
    )
    :vars
    (
      ?auto_26692 - HOIST
      ?auto_26691 - PLACE
      ?auto_26689 - PLACE
      ?auto_26687 - HOIST
      ?auto_26690 - SURFACE
      ?auto_26716 - PLACE
      ?auto_26696 - HOIST
      ?auto_26699 - SURFACE
      ?auto_26708 - PLACE
      ?auto_26703 - HOIST
      ?auto_26721 - SURFACE
      ?auto_26698 - PLACE
      ?auto_26700 - HOIST
      ?auto_26709 - SURFACE
      ?auto_26712 - PLACE
      ?auto_26713 - HOIST
      ?auto_26718 - SURFACE
      ?auto_26719 - PLACE
      ?auto_26717 - HOIST
      ?auto_26694 - SURFACE
      ?auto_26714 - PLACE
      ?auto_26706 - HOIST
      ?auto_26705 - SURFACE
      ?auto_26702 - PLACE
      ?auto_26720 - HOIST
      ?auto_26704 - SURFACE
      ?auto_26715 - PLACE
      ?auto_26697 - HOIST
      ?auto_26710 - SURFACE
      ?auto_26701 - SURFACE
      ?auto_26695 - SURFACE
      ?auto_26707 - PLACE
      ?auto_26693 - HOIST
      ?auto_26711 - SURFACE
      ?auto_26688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26692 ?auto_26691 ) ( IS-CRATE ?auto_26686 ) ( not ( = ?auto_26689 ?auto_26691 ) ) ( HOIST-AT ?auto_26687 ?auto_26689 ) ( AVAILABLE ?auto_26687 ) ( SURFACE-AT ?auto_26686 ?auto_26689 ) ( ON ?auto_26686 ?auto_26690 ) ( CLEAR ?auto_26686 ) ( not ( = ?auto_26685 ?auto_26686 ) ) ( not ( = ?auto_26685 ?auto_26690 ) ) ( not ( = ?auto_26686 ?auto_26690 ) ) ( not ( = ?auto_26692 ?auto_26687 ) ) ( IS-CRATE ?auto_26685 ) ( not ( = ?auto_26716 ?auto_26691 ) ) ( HOIST-AT ?auto_26696 ?auto_26716 ) ( AVAILABLE ?auto_26696 ) ( SURFACE-AT ?auto_26685 ?auto_26716 ) ( ON ?auto_26685 ?auto_26699 ) ( CLEAR ?auto_26685 ) ( not ( = ?auto_26684 ?auto_26685 ) ) ( not ( = ?auto_26684 ?auto_26699 ) ) ( not ( = ?auto_26685 ?auto_26699 ) ) ( not ( = ?auto_26692 ?auto_26696 ) ) ( IS-CRATE ?auto_26684 ) ( not ( = ?auto_26708 ?auto_26691 ) ) ( HOIST-AT ?auto_26703 ?auto_26708 ) ( AVAILABLE ?auto_26703 ) ( SURFACE-AT ?auto_26684 ?auto_26708 ) ( ON ?auto_26684 ?auto_26721 ) ( CLEAR ?auto_26684 ) ( not ( = ?auto_26683 ?auto_26684 ) ) ( not ( = ?auto_26683 ?auto_26721 ) ) ( not ( = ?auto_26684 ?auto_26721 ) ) ( not ( = ?auto_26692 ?auto_26703 ) ) ( IS-CRATE ?auto_26683 ) ( not ( = ?auto_26698 ?auto_26691 ) ) ( HOIST-AT ?auto_26700 ?auto_26698 ) ( SURFACE-AT ?auto_26683 ?auto_26698 ) ( ON ?auto_26683 ?auto_26709 ) ( CLEAR ?auto_26683 ) ( not ( = ?auto_26682 ?auto_26683 ) ) ( not ( = ?auto_26682 ?auto_26709 ) ) ( not ( = ?auto_26683 ?auto_26709 ) ) ( not ( = ?auto_26692 ?auto_26700 ) ) ( IS-CRATE ?auto_26682 ) ( not ( = ?auto_26712 ?auto_26691 ) ) ( HOIST-AT ?auto_26713 ?auto_26712 ) ( SURFACE-AT ?auto_26682 ?auto_26712 ) ( ON ?auto_26682 ?auto_26718 ) ( CLEAR ?auto_26682 ) ( not ( = ?auto_26681 ?auto_26682 ) ) ( not ( = ?auto_26681 ?auto_26718 ) ) ( not ( = ?auto_26682 ?auto_26718 ) ) ( not ( = ?auto_26692 ?auto_26713 ) ) ( IS-CRATE ?auto_26681 ) ( not ( = ?auto_26719 ?auto_26691 ) ) ( HOIST-AT ?auto_26717 ?auto_26719 ) ( AVAILABLE ?auto_26717 ) ( SURFACE-AT ?auto_26681 ?auto_26719 ) ( ON ?auto_26681 ?auto_26694 ) ( CLEAR ?auto_26681 ) ( not ( = ?auto_26680 ?auto_26681 ) ) ( not ( = ?auto_26680 ?auto_26694 ) ) ( not ( = ?auto_26681 ?auto_26694 ) ) ( not ( = ?auto_26692 ?auto_26717 ) ) ( IS-CRATE ?auto_26680 ) ( not ( = ?auto_26714 ?auto_26691 ) ) ( HOIST-AT ?auto_26706 ?auto_26714 ) ( AVAILABLE ?auto_26706 ) ( SURFACE-AT ?auto_26680 ?auto_26714 ) ( ON ?auto_26680 ?auto_26705 ) ( CLEAR ?auto_26680 ) ( not ( = ?auto_26679 ?auto_26680 ) ) ( not ( = ?auto_26679 ?auto_26705 ) ) ( not ( = ?auto_26680 ?auto_26705 ) ) ( not ( = ?auto_26692 ?auto_26706 ) ) ( IS-CRATE ?auto_26679 ) ( not ( = ?auto_26702 ?auto_26691 ) ) ( HOIST-AT ?auto_26720 ?auto_26702 ) ( AVAILABLE ?auto_26720 ) ( SURFACE-AT ?auto_26679 ?auto_26702 ) ( ON ?auto_26679 ?auto_26704 ) ( CLEAR ?auto_26679 ) ( not ( = ?auto_26678 ?auto_26679 ) ) ( not ( = ?auto_26678 ?auto_26704 ) ) ( not ( = ?auto_26679 ?auto_26704 ) ) ( not ( = ?auto_26692 ?auto_26720 ) ) ( IS-CRATE ?auto_26678 ) ( not ( = ?auto_26715 ?auto_26691 ) ) ( HOIST-AT ?auto_26697 ?auto_26715 ) ( AVAILABLE ?auto_26697 ) ( SURFACE-AT ?auto_26678 ?auto_26715 ) ( ON ?auto_26678 ?auto_26710 ) ( CLEAR ?auto_26678 ) ( not ( = ?auto_26677 ?auto_26678 ) ) ( not ( = ?auto_26677 ?auto_26710 ) ) ( not ( = ?auto_26678 ?auto_26710 ) ) ( not ( = ?auto_26692 ?auto_26697 ) ) ( IS-CRATE ?auto_26677 ) ( AVAILABLE ?auto_26700 ) ( SURFACE-AT ?auto_26677 ?auto_26698 ) ( ON ?auto_26677 ?auto_26701 ) ( CLEAR ?auto_26677 ) ( not ( = ?auto_26676 ?auto_26677 ) ) ( not ( = ?auto_26676 ?auto_26701 ) ) ( not ( = ?auto_26677 ?auto_26701 ) ) ( IS-CRATE ?auto_26676 ) ( AVAILABLE ?auto_26713 ) ( SURFACE-AT ?auto_26676 ?auto_26712 ) ( ON ?auto_26676 ?auto_26695 ) ( CLEAR ?auto_26676 ) ( not ( = ?auto_26675 ?auto_26676 ) ) ( not ( = ?auto_26675 ?auto_26695 ) ) ( not ( = ?auto_26676 ?auto_26695 ) ) ( SURFACE-AT ?auto_26674 ?auto_26691 ) ( CLEAR ?auto_26674 ) ( IS-CRATE ?auto_26675 ) ( AVAILABLE ?auto_26692 ) ( not ( = ?auto_26707 ?auto_26691 ) ) ( HOIST-AT ?auto_26693 ?auto_26707 ) ( AVAILABLE ?auto_26693 ) ( SURFACE-AT ?auto_26675 ?auto_26707 ) ( ON ?auto_26675 ?auto_26711 ) ( CLEAR ?auto_26675 ) ( TRUCK-AT ?auto_26688 ?auto_26691 ) ( not ( = ?auto_26674 ?auto_26675 ) ) ( not ( = ?auto_26674 ?auto_26711 ) ) ( not ( = ?auto_26675 ?auto_26711 ) ) ( not ( = ?auto_26692 ?auto_26693 ) ) ( not ( = ?auto_26674 ?auto_26676 ) ) ( not ( = ?auto_26674 ?auto_26695 ) ) ( not ( = ?auto_26676 ?auto_26711 ) ) ( not ( = ?auto_26712 ?auto_26707 ) ) ( not ( = ?auto_26713 ?auto_26693 ) ) ( not ( = ?auto_26695 ?auto_26711 ) ) ( not ( = ?auto_26674 ?auto_26677 ) ) ( not ( = ?auto_26674 ?auto_26701 ) ) ( not ( = ?auto_26675 ?auto_26677 ) ) ( not ( = ?auto_26675 ?auto_26701 ) ) ( not ( = ?auto_26677 ?auto_26695 ) ) ( not ( = ?auto_26677 ?auto_26711 ) ) ( not ( = ?auto_26698 ?auto_26712 ) ) ( not ( = ?auto_26698 ?auto_26707 ) ) ( not ( = ?auto_26700 ?auto_26713 ) ) ( not ( = ?auto_26700 ?auto_26693 ) ) ( not ( = ?auto_26701 ?auto_26695 ) ) ( not ( = ?auto_26701 ?auto_26711 ) ) ( not ( = ?auto_26674 ?auto_26678 ) ) ( not ( = ?auto_26674 ?auto_26710 ) ) ( not ( = ?auto_26675 ?auto_26678 ) ) ( not ( = ?auto_26675 ?auto_26710 ) ) ( not ( = ?auto_26676 ?auto_26678 ) ) ( not ( = ?auto_26676 ?auto_26710 ) ) ( not ( = ?auto_26678 ?auto_26701 ) ) ( not ( = ?auto_26678 ?auto_26695 ) ) ( not ( = ?auto_26678 ?auto_26711 ) ) ( not ( = ?auto_26715 ?auto_26698 ) ) ( not ( = ?auto_26715 ?auto_26712 ) ) ( not ( = ?auto_26715 ?auto_26707 ) ) ( not ( = ?auto_26697 ?auto_26700 ) ) ( not ( = ?auto_26697 ?auto_26713 ) ) ( not ( = ?auto_26697 ?auto_26693 ) ) ( not ( = ?auto_26710 ?auto_26701 ) ) ( not ( = ?auto_26710 ?auto_26695 ) ) ( not ( = ?auto_26710 ?auto_26711 ) ) ( not ( = ?auto_26674 ?auto_26679 ) ) ( not ( = ?auto_26674 ?auto_26704 ) ) ( not ( = ?auto_26675 ?auto_26679 ) ) ( not ( = ?auto_26675 ?auto_26704 ) ) ( not ( = ?auto_26676 ?auto_26679 ) ) ( not ( = ?auto_26676 ?auto_26704 ) ) ( not ( = ?auto_26677 ?auto_26679 ) ) ( not ( = ?auto_26677 ?auto_26704 ) ) ( not ( = ?auto_26679 ?auto_26710 ) ) ( not ( = ?auto_26679 ?auto_26701 ) ) ( not ( = ?auto_26679 ?auto_26695 ) ) ( not ( = ?auto_26679 ?auto_26711 ) ) ( not ( = ?auto_26702 ?auto_26715 ) ) ( not ( = ?auto_26702 ?auto_26698 ) ) ( not ( = ?auto_26702 ?auto_26712 ) ) ( not ( = ?auto_26702 ?auto_26707 ) ) ( not ( = ?auto_26720 ?auto_26697 ) ) ( not ( = ?auto_26720 ?auto_26700 ) ) ( not ( = ?auto_26720 ?auto_26713 ) ) ( not ( = ?auto_26720 ?auto_26693 ) ) ( not ( = ?auto_26704 ?auto_26710 ) ) ( not ( = ?auto_26704 ?auto_26701 ) ) ( not ( = ?auto_26704 ?auto_26695 ) ) ( not ( = ?auto_26704 ?auto_26711 ) ) ( not ( = ?auto_26674 ?auto_26680 ) ) ( not ( = ?auto_26674 ?auto_26705 ) ) ( not ( = ?auto_26675 ?auto_26680 ) ) ( not ( = ?auto_26675 ?auto_26705 ) ) ( not ( = ?auto_26676 ?auto_26680 ) ) ( not ( = ?auto_26676 ?auto_26705 ) ) ( not ( = ?auto_26677 ?auto_26680 ) ) ( not ( = ?auto_26677 ?auto_26705 ) ) ( not ( = ?auto_26678 ?auto_26680 ) ) ( not ( = ?auto_26678 ?auto_26705 ) ) ( not ( = ?auto_26680 ?auto_26704 ) ) ( not ( = ?auto_26680 ?auto_26710 ) ) ( not ( = ?auto_26680 ?auto_26701 ) ) ( not ( = ?auto_26680 ?auto_26695 ) ) ( not ( = ?auto_26680 ?auto_26711 ) ) ( not ( = ?auto_26714 ?auto_26702 ) ) ( not ( = ?auto_26714 ?auto_26715 ) ) ( not ( = ?auto_26714 ?auto_26698 ) ) ( not ( = ?auto_26714 ?auto_26712 ) ) ( not ( = ?auto_26714 ?auto_26707 ) ) ( not ( = ?auto_26706 ?auto_26720 ) ) ( not ( = ?auto_26706 ?auto_26697 ) ) ( not ( = ?auto_26706 ?auto_26700 ) ) ( not ( = ?auto_26706 ?auto_26713 ) ) ( not ( = ?auto_26706 ?auto_26693 ) ) ( not ( = ?auto_26705 ?auto_26704 ) ) ( not ( = ?auto_26705 ?auto_26710 ) ) ( not ( = ?auto_26705 ?auto_26701 ) ) ( not ( = ?auto_26705 ?auto_26695 ) ) ( not ( = ?auto_26705 ?auto_26711 ) ) ( not ( = ?auto_26674 ?auto_26681 ) ) ( not ( = ?auto_26674 ?auto_26694 ) ) ( not ( = ?auto_26675 ?auto_26681 ) ) ( not ( = ?auto_26675 ?auto_26694 ) ) ( not ( = ?auto_26676 ?auto_26681 ) ) ( not ( = ?auto_26676 ?auto_26694 ) ) ( not ( = ?auto_26677 ?auto_26681 ) ) ( not ( = ?auto_26677 ?auto_26694 ) ) ( not ( = ?auto_26678 ?auto_26681 ) ) ( not ( = ?auto_26678 ?auto_26694 ) ) ( not ( = ?auto_26679 ?auto_26681 ) ) ( not ( = ?auto_26679 ?auto_26694 ) ) ( not ( = ?auto_26681 ?auto_26705 ) ) ( not ( = ?auto_26681 ?auto_26704 ) ) ( not ( = ?auto_26681 ?auto_26710 ) ) ( not ( = ?auto_26681 ?auto_26701 ) ) ( not ( = ?auto_26681 ?auto_26695 ) ) ( not ( = ?auto_26681 ?auto_26711 ) ) ( not ( = ?auto_26719 ?auto_26714 ) ) ( not ( = ?auto_26719 ?auto_26702 ) ) ( not ( = ?auto_26719 ?auto_26715 ) ) ( not ( = ?auto_26719 ?auto_26698 ) ) ( not ( = ?auto_26719 ?auto_26712 ) ) ( not ( = ?auto_26719 ?auto_26707 ) ) ( not ( = ?auto_26717 ?auto_26706 ) ) ( not ( = ?auto_26717 ?auto_26720 ) ) ( not ( = ?auto_26717 ?auto_26697 ) ) ( not ( = ?auto_26717 ?auto_26700 ) ) ( not ( = ?auto_26717 ?auto_26713 ) ) ( not ( = ?auto_26717 ?auto_26693 ) ) ( not ( = ?auto_26694 ?auto_26705 ) ) ( not ( = ?auto_26694 ?auto_26704 ) ) ( not ( = ?auto_26694 ?auto_26710 ) ) ( not ( = ?auto_26694 ?auto_26701 ) ) ( not ( = ?auto_26694 ?auto_26695 ) ) ( not ( = ?auto_26694 ?auto_26711 ) ) ( not ( = ?auto_26674 ?auto_26682 ) ) ( not ( = ?auto_26674 ?auto_26718 ) ) ( not ( = ?auto_26675 ?auto_26682 ) ) ( not ( = ?auto_26675 ?auto_26718 ) ) ( not ( = ?auto_26676 ?auto_26682 ) ) ( not ( = ?auto_26676 ?auto_26718 ) ) ( not ( = ?auto_26677 ?auto_26682 ) ) ( not ( = ?auto_26677 ?auto_26718 ) ) ( not ( = ?auto_26678 ?auto_26682 ) ) ( not ( = ?auto_26678 ?auto_26718 ) ) ( not ( = ?auto_26679 ?auto_26682 ) ) ( not ( = ?auto_26679 ?auto_26718 ) ) ( not ( = ?auto_26680 ?auto_26682 ) ) ( not ( = ?auto_26680 ?auto_26718 ) ) ( not ( = ?auto_26682 ?auto_26694 ) ) ( not ( = ?auto_26682 ?auto_26705 ) ) ( not ( = ?auto_26682 ?auto_26704 ) ) ( not ( = ?auto_26682 ?auto_26710 ) ) ( not ( = ?auto_26682 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26695 ) ) ( not ( = ?auto_26682 ?auto_26711 ) ) ( not ( = ?auto_26718 ?auto_26694 ) ) ( not ( = ?auto_26718 ?auto_26705 ) ) ( not ( = ?auto_26718 ?auto_26704 ) ) ( not ( = ?auto_26718 ?auto_26710 ) ) ( not ( = ?auto_26718 ?auto_26701 ) ) ( not ( = ?auto_26718 ?auto_26695 ) ) ( not ( = ?auto_26718 ?auto_26711 ) ) ( not ( = ?auto_26674 ?auto_26683 ) ) ( not ( = ?auto_26674 ?auto_26709 ) ) ( not ( = ?auto_26675 ?auto_26683 ) ) ( not ( = ?auto_26675 ?auto_26709 ) ) ( not ( = ?auto_26676 ?auto_26683 ) ) ( not ( = ?auto_26676 ?auto_26709 ) ) ( not ( = ?auto_26677 ?auto_26683 ) ) ( not ( = ?auto_26677 ?auto_26709 ) ) ( not ( = ?auto_26678 ?auto_26683 ) ) ( not ( = ?auto_26678 ?auto_26709 ) ) ( not ( = ?auto_26679 ?auto_26683 ) ) ( not ( = ?auto_26679 ?auto_26709 ) ) ( not ( = ?auto_26680 ?auto_26683 ) ) ( not ( = ?auto_26680 ?auto_26709 ) ) ( not ( = ?auto_26681 ?auto_26683 ) ) ( not ( = ?auto_26681 ?auto_26709 ) ) ( not ( = ?auto_26683 ?auto_26718 ) ) ( not ( = ?auto_26683 ?auto_26694 ) ) ( not ( = ?auto_26683 ?auto_26705 ) ) ( not ( = ?auto_26683 ?auto_26704 ) ) ( not ( = ?auto_26683 ?auto_26710 ) ) ( not ( = ?auto_26683 ?auto_26701 ) ) ( not ( = ?auto_26683 ?auto_26695 ) ) ( not ( = ?auto_26683 ?auto_26711 ) ) ( not ( = ?auto_26709 ?auto_26718 ) ) ( not ( = ?auto_26709 ?auto_26694 ) ) ( not ( = ?auto_26709 ?auto_26705 ) ) ( not ( = ?auto_26709 ?auto_26704 ) ) ( not ( = ?auto_26709 ?auto_26710 ) ) ( not ( = ?auto_26709 ?auto_26701 ) ) ( not ( = ?auto_26709 ?auto_26695 ) ) ( not ( = ?auto_26709 ?auto_26711 ) ) ( not ( = ?auto_26674 ?auto_26684 ) ) ( not ( = ?auto_26674 ?auto_26721 ) ) ( not ( = ?auto_26675 ?auto_26684 ) ) ( not ( = ?auto_26675 ?auto_26721 ) ) ( not ( = ?auto_26676 ?auto_26684 ) ) ( not ( = ?auto_26676 ?auto_26721 ) ) ( not ( = ?auto_26677 ?auto_26684 ) ) ( not ( = ?auto_26677 ?auto_26721 ) ) ( not ( = ?auto_26678 ?auto_26684 ) ) ( not ( = ?auto_26678 ?auto_26721 ) ) ( not ( = ?auto_26679 ?auto_26684 ) ) ( not ( = ?auto_26679 ?auto_26721 ) ) ( not ( = ?auto_26680 ?auto_26684 ) ) ( not ( = ?auto_26680 ?auto_26721 ) ) ( not ( = ?auto_26681 ?auto_26684 ) ) ( not ( = ?auto_26681 ?auto_26721 ) ) ( not ( = ?auto_26682 ?auto_26684 ) ) ( not ( = ?auto_26682 ?auto_26721 ) ) ( not ( = ?auto_26684 ?auto_26709 ) ) ( not ( = ?auto_26684 ?auto_26718 ) ) ( not ( = ?auto_26684 ?auto_26694 ) ) ( not ( = ?auto_26684 ?auto_26705 ) ) ( not ( = ?auto_26684 ?auto_26704 ) ) ( not ( = ?auto_26684 ?auto_26710 ) ) ( not ( = ?auto_26684 ?auto_26701 ) ) ( not ( = ?auto_26684 ?auto_26695 ) ) ( not ( = ?auto_26684 ?auto_26711 ) ) ( not ( = ?auto_26708 ?auto_26698 ) ) ( not ( = ?auto_26708 ?auto_26712 ) ) ( not ( = ?auto_26708 ?auto_26719 ) ) ( not ( = ?auto_26708 ?auto_26714 ) ) ( not ( = ?auto_26708 ?auto_26702 ) ) ( not ( = ?auto_26708 ?auto_26715 ) ) ( not ( = ?auto_26708 ?auto_26707 ) ) ( not ( = ?auto_26703 ?auto_26700 ) ) ( not ( = ?auto_26703 ?auto_26713 ) ) ( not ( = ?auto_26703 ?auto_26717 ) ) ( not ( = ?auto_26703 ?auto_26706 ) ) ( not ( = ?auto_26703 ?auto_26720 ) ) ( not ( = ?auto_26703 ?auto_26697 ) ) ( not ( = ?auto_26703 ?auto_26693 ) ) ( not ( = ?auto_26721 ?auto_26709 ) ) ( not ( = ?auto_26721 ?auto_26718 ) ) ( not ( = ?auto_26721 ?auto_26694 ) ) ( not ( = ?auto_26721 ?auto_26705 ) ) ( not ( = ?auto_26721 ?auto_26704 ) ) ( not ( = ?auto_26721 ?auto_26710 ) ) ( not ( = ?auto_26721 ?auto_26701 ) ) ( not ( = ?auto_26721 ?auto_26695 ) ) ( not ( = ?auto_26721 ?auto_26711 ) ) ( not ( = ?auto_26674 ?auto_26685 ) ) ( not ( = ?auto_26674 ?auto_26699 ) ) ( not ( = ?auto_26675 ?auto_26685 ) ) ( not ( = ?auto_26675 ?auto_26699 ) ) ( not ( = ?auto_26676 ?auto_26685 ) ) ( not ( = ?auto_26676 ?auto_26699 ) ) ( not ( = ?auto_26677 ?auto_26685 ) ) ( not ( = ?auto_26677 ?auto_26699 ) ) ( not ( = ?auto_26678 ?auto_26685 ) ) ( not ( = ?auto_26678 ?auto_26699 ) ) ( not ( = ?auto_26679 ?auto_26685 ) ) ( not ( = ?auto_26679 ?auto_26699 ) ) ( not ( = ?auto_26680 ?auto_26685 ) ) ( not ( = ?auto_26680 ?auto_26699 ) ) ( not ( = ?auto_26681 ?auto_26685 ) ) ( not ( = ?auto_26681 ?auto_26699 ) ) ( not ( = ?auto_26682 ?auto_26685 ) ) ( not ( = ?auto_26682 ?auto_26699 ) ) ( not ( = ?auto_26683 ?auto_26685 ) ) ( not ( = ?auto_26683 ?auto_26699 ) ) ( not ( = ?auto_26685 ?auto_26721 ) ) ( not ( = ?auto_26685 ?auto_26709 ) ) ( not ( = ?auto_26685 ?auto_26718 ) ) ( not ( = ?auto_26685 ?auto_26694 ) ) ( not ( = ?auto_26685 ?auto_26705 ) ) ( not ( = ?auto_26685 ?auto_26704 ) ) ( not ( = ?auto_26685 ?auto_26710 ) ) ( not ( = ?auto_26685 ?auto_26701 ) ) ( not ( = ?auto_26685 ?auto_26695 ) ) ( not ( = ?auto_26685 ?auto_26711 ) ) ( not ( = ?auto_26716 ?auto_26708 ) ) ( not ( = ?auto_26716 ?auto_26698 ) ) ( not ( = ?auto_26716 ?auto_26712 ) ) ( not ( = ?auto_26716 ?auto_26719 ) ) ( not ( = ?auto_26716 ?auto_26714 ) ) ( not ( = ?auto_26716 ?auto_26702 ) ) ( not ( = ?auto_26716 ?auto_26715 ) ) ( not ( = ?auto_26716 ?auto_26707 ) ) ( not ( = ?auto_26696 ?auto_26703 ) ) ( not ( = ?auto_26696 ?auto_26700 ) ) ( not ( = ?auto_26696 ?auto_26713 ) ) ( not ( = ?auto_26696 ?auto_26717 ) ) ( not ( = ?auto_26696 ?auto_26706 ) ) ( not ( = ?auto_26696 ?auto_26720 ) ) ( not ( = ?auto_26696 ?auto_26697 ) ) ( not ( = ?auto_26696 ?auto_26693 ) ) ( not ( = ?auto_26699 ?auto_26721 ) ) ( not ( = ?auto_26699 ?auto_26709 ) ) ( not ( = ?auto_26699 ?auto_26718 ) ) ( not ( = ?auto_26699 ?auto_26694 ) ) ( not ( = ?auto_26699 ?auto_26705 ) ) ( not ( = ?auto_26699 ?auto_26704 ) ) ( not ( = ?auto_26699 ?auto_26710 ) ) ( not ( = ?auto_26699 ?auto_26701 ) ) ( not ( = ?auto_26699 ?auto_26695 ) ) ( not ( = ?auto_26699 ?auto_26711 ) ) ( not ( = ?auto_26674 ?auto_26686 ) ) ( not ( = ?auto_26674 ?auto_26690 ) ) ( not ( = ?auto_26675 ?auto_26686 ) ) ( not ( = ?auto_26675 ?auto_26690 ) ) ( not ( = ?auto_26676 ?auto_26686 ) ) ( not ( = ?auto_26676 ?auto_26690 ) ) ( not ( = ?auto_26677 ?auto_26686 ) ) ( not ( = ?auto_26677 ?auto_26690 ) ) ( not ( = ?auto_26678 ?auto_26686 ) ) ( not ( = ?auto_26678 ?auto_26690 ) ) ( not ( = ?auto_26679 ?auto_26686 ) ) ( not ( = ?auto_26679 ?auto_26690 ) ) ( not ( = ?auto_26680 ?auto_26686 ) ) ( not ( = ?auto_26680 ?auto_26690 ) ) ( not ( = ?auto_26681 ?auto_26686 ) ) ( not ( = ?auto_26681 ?auto_26690 ) ) ( not ( = ?auto_26682 ?auto_26686 ) ) ( not ( = ?auto_26682 ?auto_26690 ) ) ( not ( = ?auto_26683 ?auto_26686 ) ) ( not ( = ?auto_26683 ?auto_26690 ) ) ( not ( = ?auto_26684 ?auto_26686 ) ) ( not ( = ?auto_26684 ?auto_26690 ) ) ( not ( = ?auto_26686 ?auto_26699 ) ) ( not ( = ?auto_26686 ?auto_26721 ) ) ( not ( = ?auto_26686 ?auto_26709 ) ) ( not ( = ?auto_26686 ?auto_26718 ) ) ( not ( = ?auto_26686 ?auto_26694 ) ) ( not ( = ?auto_26686 ?auto_26705 ) ) ( not ( = ?auto_26686 ?auto_26704 ) ) ( not ( = ?auto_26686 ?auto_26710 ) ) ( not ( = ?auto_26686 ?auto_26701 ) ) ( not ( = ?auto_26686 ?auto_26695 ) ) ( not ( = ?auto_26686 ?auto_26711 ) ) ( not ( = ?auto_26689 ?auto_26716 ) ) ( not ( = ?auto_26689 ?auto_26708 ) ) ( not ( = ?auto_26689 ?auto_26698 ) ) ( not ( = ?auto_26689 ?auto_26712 ) ) ( not ( = ?auto_26689 ?auto_26719 ) ) ( not ( = ?auto_26689 ?auto_26714 ) ) ( not ( = ?auto_26689 ?auto_26702 ) ) ( not ( = ?auto_26689 ?auto_26715 ) ) ( not ( = ?auto_26689 ?auto_26707 ) ) ( not ( = ?auto_26687 ?auto_26696 ) ) ( not ( = ?auto_26687 ?auto_26703 ) ) ( not ( = ?auto_26687 ?auto_26700 ) ) ( not ( = ?auto_26687 ?auto_26713 ) ) ( not ( = ?auto_26687 ?auto_26717 ) ) ( not ( = ?auto_26687 ?auto_26706 ) ) ( not ( = ?auto_26687 ?auto_26720 ) ) ( not ( = ?auto_26687 ?auto_26697 ) ) ( not ( = ?auto_26687 ?auto_26693 ) ) ( not ( = ?auto_26690 ?auto_26699 ) ) ( not ( = ?auto_26690 ?auto_26721 ) ) ( not ( = ?auto_26690 ?auto_26709 ) ) ( not ( = ?auto_26690 ?auto_26718 ) ) ( not ( = ?auto_26690 ?auto_26694 ) ) ( not ( = ?auto_26690 ?auto_26705 ) ) ( not ( = ?auto_26690 ?auto_26704 ) ) ( not ( = ?auto_26690 ?auto_26710 ) ) ( not ( = ?auto_26690 ?auto_26701 ) ) ( not ( = ?auto_26690 ?auto_26695 ) ) ( not ( = ?auto_26690 ?auto_26711 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_26674 ?auto_26675 ?auto_26676 ?auto_26677 ?auto_26678 ?auto_26679 ?auto_26680 ?auto_26681 ?auto_26682 ?auto_26683 ?auto_26684 ?auto_26685 )
      ( MAKE-1CRATE ?auto_26685 ?auto_26686 )
      ( MAKE-12CRATE-VERIFY ?auto_26674 ?auto_26675 ?auto_26676 ?auto_26677 ?auto_26678 ?auto_26679 ?auto_26680 ?auto_26681 ?auto_26682 ?auto_26683 ?auto_26684 ?auto_26685 ?auto_26686 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_26746 - SURFACE
      ?auto_26747 - SURFACE
      ?auto_26748 - SURFACE
      ?auto_26749 - SURFACE
      ?auto_26750 - SURFACE
      ?auto_26751 - SURFACE
      ?auto_26752 - SURFACE
      ?auto_26753 - SURFACE
      ?auto_26754 - SURFACE
      ?auto_26755 - SURFACE
      ?auto_26756 - SURFACE
      ?auto_26757 - SURFACE
      ?auto_26758 - SURFACE
      ?auto_26759 - SURFACE
    )
    :vars
    (
      ?auto_26762 - HOIST
      ?auto_26764 - PLACE
      ?auto_26760 - PLACE
      ?auto_26763 - HOIST
      ?auto_26761 - SURFACE
      ?auto_26769 - PLACE
      ?auto_26797 - HOIST
      ?auto_26792 - SURFACE
      ?auto_26790 - PLACE
      ?auto_26781 - HOIST
      ?auto_26787 - SURFACE
      ?auto_26785 - PLACE
      ?auto_26796 - HOIST
      ?auto_26772 - SURFACE
      ?auto_26766 - PLACE
      ?auto_26776 - HOIST
      ?auto_26791 - SURFACE
      ?auto_26779 - PLACE
      ?auto_26774 - HOIST
      ?auto_26795 - SURFACE
      ?auto_26771 - PLACE
      ?auto_26793 - HOIST
      ?auto_26786 - SURFACE
      ?auto_26780 - PLACE
      ?auto_26782 - HOIST
      ?auto_26788 - SURFACE
      ?auto_26767 - PLACE
      ?auto_26789 - HOIST
      ?auto_26773 - SURFACE
      ?auto_26777 - PLACE
      ?auto_26794 - HOIST
      ?auto_26783 - SURFACE
      ?auto_26784 - SURFACE
      ?auto_26768 - SURFACE
      ?auto_26778 - PLACE
      ?auto_26770 - HOIST
      ?auto_26775 - SURFACE
      ?auto_26765 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26762 ?auto_26764 ) ( IS-CRATE ?auto_26759 ) ( not ( = ?auto_26760 ?auto_26764 ) ) ( HOIST-AT ?auto_26763 ?auto_26760 ) ( AVAILABLE ?auto_26763 ) ( SURFACE-AT ?auto_26759 ?auto_26760 ) ( ON ?auto_26759 ?auto_26761 ) ( CLEAR ?auto_26759 ) ( not ( = ?auto_26758 ?auto_26759 ) ) ( not ( = ?auto_26758 ?auto_26761 ) ) ( not ( = ?auto_26759 ?auto_26761 ) ) ( not ( = ?auto_26762 ?auto_26763 ) ) ( IS-CRATE ?auto_26758 ) ( not ( = ?auto_26769 ?auto_26764 ) ) ( HOIST-AT ?auto_26797 ?auto_26769 ) ( AVAILABLE ?auto_26797 ) ( SURFACE-AT ?auto_26758 ?auto_26769 ) ( ON ?auto_26758 ?auto_26792 ) ( CLEAR ?auto_26758 ) ( not ( = ?auto_26757 ?auto_26758 ) ) ( not ( = ?auto_26757 ?auto_26792 ) ) ( not ( = ?auto_26758 ?auto_26792 ) ) ( not ( = ?auto_26762 ?auto_26797 ) ) ( IS-CRATE ?auto_26757 ) ( not ( = ?auto_26790 ?auto_26764 ) ) ( HOIST-AT ?auto_26781 ?auto_26790 ) ( AVAILABLE ?auto_26781 ) ( SURFACE-AT ?auto_26757 ?auto_26790 ) ( ON ?auto_26757 ?auto_26787 ) ( CLEAR ?auto_26757 ) ( not ( = ?auto_26756 ?auto_26757 ) ) ( not ( = ?auto_26756 ?auto_26787 ) ) ( not ( = ?auto_26757 ?auto_26787 ) ) ( not ( = ?auto_26762 ?auto_26781 ) ) ( IS-CRATE ?auto_26756 ) ( not ( = ?auto_26785 ?auto_26764 ) ) ( HOIST-AT ?auto_26796 ?auto_26785 ) ( AVAILABLE ?auto_26796 ) ( SURFACE-AT ?auto_26756 ?auto_26785 ) ( ON ?auto_26756 ?auto_26772 ) ( CLEAR ?auto_26756 ) ( not ( = ?auto_26755 ?auto_26756 ) ) ( not ( = ?auto_26755 ?auto_26772 ) ) ( not ( = ?auto_26756 ?auto_26772 ) ) ( not ( = ?auto_26762 ?auto_26796 ) ) ( IS-CRATE ?auto_26755 ) ( not ( = ?auto_26766 ?auto_26764 ) ) ( HOIST-AT ?auto_26776 ?auto_26766 ) ( SURFACE-AT ?auto_26755 ?auto_26766 ) ( ON ?auto_26755 ?auto_26791 ) ( CLEAR ?auto_26755 ) ( not ( = ?auto_26754 ?auto_26755 ) ) ( not ( = ?auto_26754 ?auto_26791 ) ) ( not ( = ?auto_26755 ?auto_26791 ) ) ( not ( = ?auto_26762 ?auto_26776 ) ) ( IS-CRATE ?auto_26754 ) ( not ( = ?auto_26779 ?auto_26764 ) ) ( HOIST-AT ?auto_26774 ?auto_26779 ) ( SURFACE-AT ?auto_26754 ?auto_26779 ) ( ON ?auto_26754 ?auto_26795 ) ( CLEAR ?auto_26754 ) ( not ( = ?auto_26753 ?auto_26754 ) ) ( not ( = ?auto_26753 ?auto_26795 ) ) ( not ( = ?auto_26754 ?auto_26795 ) ) ( not ( = ?auto_26762 ?auto_26774 ) ) ( IS-CRATE ?auto_26753 ) ( not ( = ?auto_26771 ?auto_26764 ) ) ( HOIST-AT ?auto_26793 ?auto_26771 ) ( AVAILABLE ?auto_26793 ) ( SURFACE-AT ?auto_26753 ?auto_26771 ) ( ON ?auto_26753 ?auto_26786 ) ( CLEAR ?auto_26753 ) ( not ( = ?auto_26752 ?auto_26753 ) ) ( not ( = ?auto_26752 ?auto_26786 ) ) ( not ( = ?auto_26753 ?auto_26786 ) ) ( not ( = ?auto_26762 ?auto_26793 ) ) ( IS-CRATE ?auto_26752 ) ( not ( = ?auto_26780 ?auto_26764 ) ) ( HOIST-AT ?auto_26782 ?auto_26780 ) ( AVAILABLE ?auto_26782 ) ( SURFACE-AT ?auto_26752 ?auto_26780 ) ( ON ?auto_26752 ?auto_26788 ) ( CLEAR ?auto_26752 ) ( not ( = ?auto_26751 ?auto_26752 ) ) ( not ( = ?auto_26751 ?auto_26788 ) ) ( not ( = ?auto_26752 ?auto_26788 ) ) ( not ( = ?auto_26762 ?auto_26782 ) ) ( IS-CRATE ?auto_26751 ) ( not ( = ?auto_26767 ?auto_26764 ) ) ( HOIST-AT ?auto_26789 ?auto_26767 ) ( AVAILABLE ?auto_26789 ) ( SURFACE-AT ?auto_26751 ?auto_26767 ) ( ON ?auto_26751 ?auto_26773 ) ( CLEAR ?auto_26751 ) ( not ( = ?auto_26750 ?auto_26751 ) ) ( not ( = ?auto_26750 ?auto_26773 ) ) ( not ( = ?auto_26751 ?auto_26773 ) ) ( not ( = ?auto_26762 ?auto_26789 ) ) ( IS-CRATE ?auto_26750 ) ( not ( = ?auto_26777 ?auto_26764 ) ) ( HOIST-AT ?auto_26794 ?auto_26777 ) ( AVAILABLE ?auto_26794 ) ( SURFACE-AT ?auto_26750 ?auto_26777 ) ( ON ?auto_26750 ?auto_26783 ) ( CLEAR ?auto_26750 ) ( not ( = ?auto_26749 ?auto_26750 ) ) ( not ( = ?auto_26749 ?auto_26783 ) ) ( not ( = ?auto_26750 ?auto_26783 ) ) ( not ( = ?auto_26762 ?auto_26794 ) ) ( IS-CRATE ?auto_26749 ) ( AVAILABLE ?auto_26776 ) ( SURFACE-AT ?auto_26749 ?auto_26766 ) ( ON ?auto_26749 ?auto_26784 ) ( CLEAR ?auto_26749 ) ( not ( = ?auto_26748 ?auto_26749 ) ) ( not ( = ?auto_26748 ?auto_26784 ) ) ( not ( = ?auto_26749 ?auto_26784 ) ) ( IS-CRATE ?auto_26748 ) ( AVAILABLE ?auto_26774 ) ( SURFACE-AT ?auto_26748 ?auto_26779 ) ( ON ?auto_26748 ?auto_26768 ) ( CLEAR ?auto_26748 ) ( not ( = ?auto_26747 ?auto_26748 ) ) ( not ( = ?auto_26747 ?auto_26768 ) ) ( not ( = ?auto_26748 ?auto_26768 ) ) ( SURFACE-AT ?auto_26746 ?auto_26764 ) ( CLEAR ?auto_26746 ) ( IS-CRATE ?auto_26747 ) ( AVAILABLE ?auto_26762 ) ( not ( = ?auto_26778 ?auto_26764 ) ) ( HOIST-AT ?auto_26770 ?auto_26778 ) ( AVAILABLE ?auto_26770 ) ( SURFACE-AT ?auto_26747 ?auto_26778 ) ( ON ?auto_26747 ?auto_26775 ) ( CLEAR ?auto_26747 ) ( TRUCK-AT ?auto_26765 ?auto_26764 ) ( not ( = ?auto_26746 ?auto_26747 ) ) ( not ( = ?auto_26746 ?auto_26775 ) ) ( not ( = ?auto_26747 ?auto_26775 ) ) ( not ( = ?auto_26762 ?auto_26770 ) ) ( not ( = ?auto_26746 ?auto_26748 ) ) ( not ( = ?auto_26746 ?auto_26768 ) ) ( not ( = ?auto_26748 ?auto_26775 ) ) ( not ( = ?auto_26779 ?auto_26778 ) ) ( not ( = ?auto_26774 ?auto_26770 ) ) ( not ( = ?auto_26768 ?auto_26775 ) ) ( not ( = ?auto_26746 ?auto_26749 ) ) ( not ( = ?auto_26746 ?auto_26784 ) ) ( not ( = ?auto_26747 ?auto_26749 ) ) ( not ( = ?auto_26747 ?auto_26784 ) ) ( not ( = ?auto_26749 ?auto_26768 ) ) ( not ( = ?auto_26749 ?auto_26775 ) ) ( not ( = ?auto_26766 ?auto_26779 ) ) ( not ( = ?auto_26766 ?auto_26778 ) ) ( not ( = ?auto_26776 ?auto_26774 ) ) ( not ( = ?auto_26776 ?auto_26770 ) ) ( not ( = ?auto_26784 ?auto_26768 ) ) ( not ( = ?auto_26784 ?auto_26775 ) ) ( not ( = ?auto_26746 ?auto_26750 ) ) ( not ( = ?auto_26746 ?auto_26783 ) ) ( not ( = ?auto_26747 ?auto_26750 ) ) ( not ( = ?auto_26747 ?auto_26783 ) ) ( not ( = ?auto_26748 ?auto_26750 ) ) ( not ( = ?auto_26748 ?auto_26783 ) ) ( not ( = ?auto_26750 ?auto_26784 ) ) ( not ( = ?auto_26750 ?auto_26768 ) ) ( not ( = ?auto_26750 ?auto_26775 ) ) ( not ( = ?auto_26777 ?auto_26766 ) ) ( not ( = ?auto_26777 ?auto_26779 ) ) ( not ( = ?auto_26777 ?auto_26778 ) ) ( not ( = ?auto_26794 ?auto_26776 ) ) ( not ( = ?auto_26794 ?auto_26774 ) ) ( not ( = ?auto_26794 ?auto_26770 ) ) ( not ( = ?auto_26783 ?auto_26784 ) ) ( not ( = ?auto_26783 ?auto_26768 ) ) ( not ( = ?auto_26783 ?auto_26775 ) ) ( not ( = ?auto_26746 ?auto_26751 ) ) ( not ( = ?auto_26746 ?auto_26773 ) ) ( not ( = ?auto_26747 ?auto_26751 ) ) ( not ( = ?auto_26747 ?auto_26773 ) ) ( not ( = ?auto_26748 ?auto_26751 ) ) ( not ( = ?auto_26748 ?auto_26773 ) ) ( not ( = ?auto_26749 ?auto_26751 ) ) ( not ( = ?auto_26749 ?auto_26773 ) ) ( not ( = ?auto_26751 ?auto_26783 ) ) ( not ( = ?auto_26751 ?auto_26784 ) ) ( not ( = ?auto_26751 ?auto_26768 ) ) ( not ( = ?auto_26751 ?auto_26775 ) ) ( not ( = ?auto_26767 ?auto_26777 ) ) ( not ( = ?auto_26767 ?auto_26766 ) ) ( not ( = ?auto_26767 ?auto_26779 ) ) ( not ( = ?auto_26767 ?auto_26778 ) ) ( not ( = ?auto_26789 ?auto_26794 ) ) ( not ( = ?auto_26789 ?auto_26776 ) ) ( not ( = ?auto_26789 ?auto_26774 ) ) ( not ( = ?auto_26789 ?auto_26770 ) ) ( not ( = ?auto_26773 ?auto_26783 ) ) ( not ( = ?auto_26773 ?auto_26784 ) ) ( not ( = ?auto_26773 ?auto_26768 ) ) ( not ( = ?auto_26773 ?auto_26775 ) ) ( not ( = ?auto_26746 ?auto_26752 ) ) ( not ( = ?auto_26746 ?auto_26788 ) ) ( not ( = ?auto_26747 ?auto_26752 ) ) ( not ( = ?auto_26747 ?auto_26788 ) ) ( not ( = ?auto_26748 ?auto_26752 ) ) ( not ( = ?auto_26748 ?auto_26788 ) ) ( not ( = ?auto_26749 ?auto_26752 ) ) ( not ( = ?auto_26749 ?auto_26788 ) ) ( not ( = ?auto_26750 ?auto_26752 ) ) ( not ( = ?auto_26750 ?auto_26788 ) ) ( not ( = ?auto_26752 ?auto_26773 ) ) ( not ( = ?auto_26752 ?auto_26783 ) ) ( not ( = ?auto_26752 ?auto_26784 ) ) ( not ( = ?auto_26752 ?auto_26768 ) ) ( not ( = ?auto_26752 ?auto_26775 ) ) ( not ( = ?auto_26780 ?auto_26767 ) ) ( not ( = ?auto_26780 ?auto_26777 ) ) ( not ( = ?auto_26780 ?auto_26766 ) ) ( not ( = ?auto_26780 ?auto_26779 ) ) ( not ( = ?auto_26780 ?auto_26778 ) ) ( not ( = ?auto_26782 ?auto_26789 ) ) ( not ( = ?auto_26782 ?auto_26794 ) ) ( not ( = ?auto_26782 ?auto_26776 ) ) ( not ( = ?auto_26782 ?auto_26774 ) ) ( not ( = ?auto_26782 ?auto_26770 ) ) ( not ( = ?auto_26788 ?auto_26773 ) ) ( not ( = ?auto_26788 ?auto_26783 ) ) ( not ( = ?auto_26788 ?auto_26784 ) ) ( not ( = ?auto_26788 ?auto_26768 ) ) ( not ( = ?auto_26788 ?auto_26775 ) ) ( not ( = ?auto_26746 ?auto_26753 ) ) ( not ( = ?auto_26746 ?auto_26786 ) ) ( not ( = ?auto_26747 ?auto_26753 ) ) ( not ( = ?auto_26747 ?auto_26786 ) ) ( not ( = ?auto_26748 ?auto_26753 ) ) ( not ( = ?auto_26748 ?auto_26786 ) ) ( not ( = ?auto_26749 ?auto_26753 ) ) ( not ( = ?auto_26749 ?auto_26786 ) ) ( not ( = ?auto_26750 ?auto_26753 ) ) ( not ( = ?auto_26750 ?auto_26786 ) ) ( not ( = ?auto_26751 ?auto_26753 ) ) ( not ( = ?auto_26751 ?auto_26786 ) ) ( not ( = ?auto_26753 ?auto_26788 ) ) ( not ( = ?auto_26753 ?auto_26773 ) ) ( not ( = ?auto_26753 ?auto_26783 ) ) ( not ( = ?auto_26753 ?auto_26784 ) ) ( not ( = ?auto_26753 ?auto_26768 ) ) ( not ( = ?auto_26753 ?auto_26775 ) ) ( not ( = ?auto_26771 ?auto_26780 ) ) ( not ( = ?auto_26771 ?auto_26767 ) ) ( not ( = ?auto_26771 ?auto_26777 ) ) ( not ( = ?auto_26771 ?auto_26766 ) ) ( not ( = ?auto_26771 ?auto_26779 ) ) ( not ( = ?auto_26771 ?auto_26778 ) ) ( not ( = ?auto_26793 ?auto_26782 ) ) ( not ( = ?auto_26793 ?auto_26789 ) ) ( not ( = ?auto_26793 ?auto_26794 ) ) ( not ( = ?auto_26793 ?auto_26776 ) ) ( not ( = ?auto_26793 ?auto_26774 ) ) ( not ( = ?auto_26793 ?auto_26770 ) ) ( not ( = ?auto_26786 ?auto_26788 ) ) ( not ( = ?auto_26786 ?auto_26773 ) ) ( not ( = ?auto_26786 ?auto_26783 ) ) ( not ( = ?auto_26786 ?auto_26784 ) ) ( not ( = ?auto_26786 ?auto_26768 ) ) ( not ( = ?auto_26786 ?auto_26775 ) ) ( not ( = ?auto_26746 ?auto_26754 ) ) ( not ( = ?auto_26746 ?auto_26795 ) ) ( not ( = ?auto_26747 ?auto_26754 ) ) ( not ( = ?auto_26747 ?auto_26795 ) ) ( not ( = ?auto_26748 ?auto_26754 ) ) ( not ( = ?auto_26748 ?auto_26795 ) ) ( not ( = ?auto_26749 ?auto_26754 ) ) ( not ( = ?auto_26749 ?auto_26795 ) ) ( not ( = ?auto_26750 ?auto_26754 ) ) ( not ( = ?auto_26750 ?auto_26795 ) ) ( not ( = ?auto_26751 ?auto_26754 ) ) ( not ( = ?auto_26751 ?auto_26795 ) ) ( not ( = ?auto_26752 ?auto_26754 ) ) ( not ( = ?auto_26752 ?auto_26795 ) ) ( not ( = ?auto_26754 ?auto_26786 ) ) ( not ( = ?auto_26754 ?auto_26788 ) ) ( not ( = ?auto_26754 ?auto_26773 ) ) ( not ( = ?auto_26754 ?auto_26783 ) ) ( not ( = ?auto_26754 ?auto_26784 ) ) ( not ( = ?auto_26754 ?auto_26768 ) ) ( not ( = ?auto_26754 ?auto_26775 ) ) ( not ( = ?auto_26795 ?auto_26786 ) ) ( not ( = ?auto_26795 ?auto_26788 ) ) ( not ( = ?auto_26795 ?auto_26773 ) ) ( not ( = ?auto_26795 ?auto_26783 ) ) ( not ( = ?auto_26795 ?auto_26784 ) ) ( not ( = ?auto_26795 ?auto_26768 ) ) ( not ( = ?auto_26795 ?auto_26775 ) ) ( not ( = ?auto_26746 ?auto_26755 ) ) ( not ( = ?auto_26746 ?auto_26791 ) ) ( not ( = ?auto_26747 ?auto_26755 ) ) ( not ( = ?auto_26747 ?auto_26791 ) ) ( not ( = ?auto_26748 ?auto_26755 ) ) ( not ( = ?auto_26748 ?auto_26791 ) ) ( not ( = ?auto_26749 ?auto_26755 ) ) ( not ( = ?auto_26749 ?auto_26791 ) ) ( not ( = ?auto_26750 ?auto_26755 ) ) ( not ( = ?auto_26750 ?auto_26791 ) ) ( not ( = ?auto_26751 ?auto_26755 ) ) ( not ( = ?auto_26751 ?auto_26791 ) ) ( not ( = ?auto_26752 ?auto_26755 ) ) ( not ( = ?auto_26752 ?auto_26791 ) ) ( not ( = ?auto_26753 ?auto_26755 ) ) ( not ( = ?auto_26753 ?auto_26791 ) ) ( not ( = ?auto_26755 ?auto_26795 ) ) ( not ( = ?auto_26755 ?auto_26786 ) ) ( not ( = ?auto_26755 ?auto_26788 ) ) ( not ( = ?auto_26755 ?auto_26773 ) ) ( not ( = ?auto_26755 ?auto_26783 ) ) ( not ( = ?auto_26755 ?auto_26784 ) ) ( not ( = ?auto_26755 ?auto_26768 ) ) ( not ( = ?auto_26755 ?auto_26775 ) ) ( not ( = ?auto_26791 ?auto_26795 ) ) ( not ( = ?auto_26791 ?auto_26786 ) ) ( not ( = ?auto_26791 ?auto_26788 ) ) ( not ( = ?auto_26791 ?auto_26773 ) ) ( not ( = ?auto_26791 ?auto_26783 ) ) ( not ( = ?auto_26791 ?auto_26784 ) ) ( not ( = ?auto_26791 ?auto_26768 ) ) ( not ( = ?auto_26791 ?auto_26775 ) ) ( not ( = ?auto_26746 ?auto_26756 ) ) ( not ( = ?auto_26746 ?auto_26772 ) ) ( not ( = ?auto_26747 ?auto_26756 ) ) ( not ( = ?auto_26747 ?auto_26772 ) ) ( not ( = ?auto_26748 ?auto_26756 ) ) ( not ( = ?auto_26748 ?auto_26772 ) ) ( not ( = ?auto_26749 ?auto_26756 ) ) ( not ( = ?auto_26749 ?auto_26772 ) ) ( not ( = ?auto_26750 ?auto_26756 ) ) ( not ( = ?auto_26750 ?auto_26772 ) ) ( not ( = ?auto_26751 ?auto_26756 ) ) ( not ( = ?auto_26751 ?auto_26772 ) ) ( not ( = ?auto_26752 ?auto_26756 ) ) ( not ( = ?auto_26752 ?auto_26772 ) ) ( not ( = ?auto_26753 ?auto_26756 ) ) ( not ( = ?auto_26753 ?auto_26772 ) ) ( not ( = ?auto_26754 ?auto_26756 ) ) ( not ( = ?auto_26754 ?auto_26772 ) ) ( not ( = ?auto_26756 ?auto_26791 ) ) ( not ( = ?auto_26756 ?auto_26795 ) ) ( not ( = ?auto_26756 ?auto_26786 ) ) ( not ( = ?auto_26756 ?auto_26788 ) ) ( not ( = ?auto_26756 ?auto_26773 ) ) ( not ( = ?auto_26756 ?auto_26783 ) ) ( not ( = ?auto_26756 ?auto_26784 ) ) ( not ( = ?auto_26756 ?auto_26768 ) ) ( not ( = ?auto_26756 ?auto_26775 ) ) ( not ( = ?auto_26785 ?auto_26766 ) ) ( not ( = ?auto_26785 ?auto_26779 ) ) ( not ( = ?auto_26785 ?auto_26771 ) ) ( not ( = ?auto_26785 ?auto_26780 ) ) ( not ( = ?auto_26785 ?auto_26767 ) ) ( not ( = ?auto_26785 ?auto_26777 ) ) ( not ( = ?auto_26785 ?auto_26778 ) ) ( not ( = ?auto_26796 ?auto_26776 ) ) ( not ( = ?auto_26796 ?auto_26774 ) ) ( not ( = ?auto_26796 ?auto_26793 ) ) ( not ( = ?auto_26796 ?auto_26782 ) ) ( not ( = ?auto_26796 ?auto_26789 ) ) ( not ( = ?auto_26796 ?auto_26794 ) ) ( not ( = ?auto_26796 ?auto_26770 ) ) ( not ( = ?auto_26772 ?auto_26791 ) ) ( not ( = ?auto_26772 ?auto_26795 ) ) ( not ( = ?auto_26772 ?auto_26786 ) ) ( not ( = ?auto_26772 ?auto_26788 ) ) ( not ( = ?auto_26772 ?auto_26773 ) ) ( not ( = ?auto_26772 ?auto_26783 ) ) ( not ( = ?auto_26772 ?auto_26784 ) ) ( not ( = ?auto_26772 ?auto_26768 ) ) ( not ( = ?auto_26772 ?auto_26775 ) ) ( not ( = ?auto_26746 ?auto_26757 ) ) ( not ( = ?auto_26746 ?auto_26787 ) ) ( not ( = ?auto_26747 ?auto_26757 ) ) ( not ( = ?auto_26747 ?auto_26787 ) ) ( not ( = ?auto_26748 ?auto_26757 ) ) ( not ( = ?auto_26748 ?auto_26787 ) ) ( not ( = ?auto_26749 ?auto_26757 ) ) ( not ( = ?auto_26749 ?auto_26787 ) ) ( not ( = ?auto_26750 ?auto_26757 ) ) ( not ( = ?auto_26750 ?auto_26787 ) ) ( not ( = ?auto_26751 ?auto_26757 ) ) ( not ( = ?auto_26751 ?auto_26787 ) ) ( not ( = ?auto_26752 ?auto_26757 ) ) ( not ( = ?auto_26752 ?auto_26787 ) ) ( not ( = ?auto_26753 ?auto_26757 ) ) ( not ( = ?auto_26753 ?auto_26787 ) ) ( not ( = ?auto_26754 ?auto_26757 ) ) ( not ( = ?auto_26754 ?auto_26787 ) ) ( not ( = ?auto_26755 ?auto_26757 ) ) ( not ( = ?auto_26755 ?auto_26787 ) ) ( not ( = ?auto_26757 ?auto_26772 ) ) ( not ( = ?auto_26757 ?auto_26791 ) ) ( not ( = ?auto_26757 ?auto_26795 ) ) ( not ( = ?auto_26757 ?auto_26786 ) ) ( not ( = ?auto_26757 ?auto_26788 ) ) ( not ( = ?auto_26757 ?auto_26773 ) ) ( not ( = ?auto_26757 ?auto_26783 ) ) ( not ( = ?auto_26757 ?auto_26784 ) ) ( not ( = ?auto_26757 ?auto_26768 ) ) ( not ( = ?auto_26757 ?auto_26775 ) ) ( not ( = ?auto_26790 ?auto_26785 ) ) ( not ( = ?auto_26790 ?auto_26766 ) ) ( not ( = ?auto_26790 ?auto_26779 ) ) ( not ( = ?auto_26790 ?auto_26771 ) ) ( not ( = ?auto_26790 ?auto_26780 ) ) ( not ( = ?auto_26790 ?auto_26767 ) ) ( not ( = ?auto_26790 ?auto_26777 ) ) ( not ( = ?auto_26790 ?auto_26778 ) ) ( not ( = ?auto_26781 ?auto_26796 ) ) ( not ( = ?auto_26781 ?auto_26776 ) ) ( not ( = ?auto_26781 ?auto_26774 ) ) ( not ( = ?auto_26781 ?auto_26793 ) ) ( not ( = ?auto_26781 ?auto_26782 ) ) ( not ( = ?auto_26781 ?auto_26789 ) ) ( not ( = ?auto_26781 ?auto_26794 ) ) ( not ( = ?auto_26781 ?auto_26770 ) ) ( not ( = ?auto_26787 ?auto_26772 ) ) ( not ( = ?auto_26787 ?auto_26791 ) ) ( not ( = ?auto_26787 ?auto_26795 ) ) ( not ( = ?auto_26787 ?auto_26786 ) ) ( not ( = ?auto_26787 ?auto_26788 ) ) ( not ( = ?auto_26787 ?auto_26773 ) ) ( not ( = ?auto_26787 ?auto_26783 ) ) ( not ( = ?auto_26787 ?auto_26784 ) ) ( not ( = ?auto_26787 ?auto_26768 ) ) ( not ( = ?auto_26787 ?auto_26775 ) ) ( not ( = ?auto_26746 ?auto_26758 ) ) ( not ( = ?auto_26746 ?auto_26792 ) ) ( not ( = ?auto_26747 ?auto_26758 ) ) ( not ( = ?auto_26747 ?auto_26792 ) ) ( not ( = ?auto_26748 ?auto_26758 ) ) ( not ( = ?auto_26748 ?auto_26792 ) ) ( not ( = ?auto_26749 ?auto_26758 ) ) ( not ( = ?auto_26749 ?auto_26792 ) ) ( not ( = ?auto_26750 ?auto_26758 ) ) ( not ( = ?auto_26750 ?auto_26792 ) ) ( not ( = ?auto_26751 ?auto_26758 ) ) ( not ( = ?auto_26751 ?auto_26792 ) ) ( not ( = ?auto_26752 ?auto_26758 ) ) ( not ( = ?auto_26752 ?auto_26792 ) ) ( not ( = ?auto_26753 ?auto_26758 ) ) ( not ( = ?auto_26753 ?auto_26792 ) ) ( not ( = ?auto_26754 ?auto_26758 ) ) ( not ( = ?auto_26754 ?auto_26792 ) ) ( not ( = ?auto_26755 ?auto_26758 ) ) ( not ( = ?auto_26755 ?auto_26792 ) ) ( not ( = ?auto_26756 ?auto_26758 ) ) ( not ( = ?auto_26756 ?auto_26792 ) ) ( not ( = ?auto_26758 ?auto_26787 ) ) ( not ( = ?auto_26758 ?auto_26772 ) ) ( not ( = ?auto_26758 ?auto_26791 ) ) ( not ( = ?auto_26758 ?auto_26795 ) ) ( not ( = ?auto_26758 ?auto_26786 ) ) ( not ( = ?auto_26758 ?auto_26788 ) ) ( not ( = ?auto_26758 ?auto_26773 ) ) ( not ( = ?auto_26758 ?auto_26783 ) ) ( not ( = ?auto_26758 ?auto_26784 ) ) ( not ( = ?auto_26758 ?auto_26768 ) ) ( not ( = ?auto_26758 ?auto_26775 ) ) ( not ( = ?auto_26769 ?auto_26790 ) ) ( not ( = ?auto_26769 ?auto_26785 ) ) ( not ( = ?auto_26769 ?auto_26766 ) ) ( not ( = ?auto_26769 ?auto_26779 ) ) ( not ( = ?auto_26769 ?auto_26771 ) ) ( not ( = ?auto_26769 ?auto_26780 ) ) ( not ( = ?auto_26769 ?auto_26767 ) ) ( not ( = ?auto_26769 ?auto_26777 ) ) ( not ( = ?auto_26769 ?auto_26778 ) ) ( not ( = ?auto_26797 ?auto_26781 ) ) ( not ( = ?auto_26797 ?auto_26796 ) ) ( not ( = ?auto_26797 ?auto_26776 ) ) ( not ( = ?auto_26797 ?auto_26774 ) ) ( not ( = ?auto_26797 ?auto_26793 ) ) ( not ( = ?auto_26797 ?auto_26782 ) ) ( not ( = ?auto_26797 ?auto_26789 ) ) ( not ( = ?auto_26797 ?auto_26794 ) ) ( not ( = ?auto_26797 ?auto_26770 ) ) ( not ( = ?auto_26792 ?auto_26787 ) ) ( not ( = ?auto_26792 ?auto_26772 ) ) ( not ( = ?auto_26792 ?auto_26791 ) ) ( not ( = ?auto_26792 ?auto_26795 ) ) ( not ( = ?auto_26792 ?auto_26786 ) ) ( not ( = ?auto_26792 ?auto_26788 ) ) ( not ( = ?auto_26792 ?auto_26773 ) ) ( not ( = ?auto_26792 ?auto_26783 ) ) ( not ( = ?auto_26792 ?auto_26784 ) ) ( not ( = ?auto_26792 ?auto_26768 ) ) ( not ( = ?auto_26792 ?auto_26775 ) ) ( not ( = ?auto_26746 ?auto_26759 ) ) ( not ( = ?auto_26746 ?auto_26761 ) ) ( not ( = ?auto_26747 ?auto_26759 ) ) ( not ( = ?auto_26747 ?auto_26761 ) ) ( not ( = ?auto_26748 ?auto_26759 ) ) ( not ( = ?auto_26748 ?auto_26761 ) ) ( not ( = ?auto_26749 ?auto_26759 ) ) ( not ( = ?auto_26749 ?auto_26761 ) ) ( not ( = ?auto_26750 ?auto_26759 ) ) ( not ( = ?auto_26750 ?auto_26761 ) ) ( not ( = ?auto_26751 ?auto_26759 ) ) ( not ( = ?auto_26751 ?auto_26761 ) ) ( not ( = ?auto_26752 ?auto_26759 ) ) ( not ( = ?auto_26752 ?auto_26761 ) ) ( not ( = ?auto_26753 ?auto_26759 ) ) ( not ( = ?auto_26753 ?auto_26761 ) ) ( not ( = ?auto_26754 ?auto_26759 ) ) ( not ( = ?auto_26754 ?auto_26761 ) ) ( not ( = ?auto_26755 ?auto_26759 ) ) ( not ( = ?auto_26755 ?auto_26761 ) ) ( not ( = ?auto_26756 ?auto_26759 ) ) ( not ( = ?auto_26756 ?auto_26761 ) ) ( not ( = ?auto_26757 ?auto_26759 ) ) ( not ( = ?auto_26757 ?auto_26761 ) ) ( not ( = ?auto_26759 ?auto_26792 ) ) ( not ( = ?auto_26759 ?auto_26787 ) ) ( not ( = ?auto_26759 ?auto_26772 ) ) ( not ( = ?auto_26759 ?auto_26791 ) ) ( not ( = ?auto_26759 ?auto_26795 ) ) ( not ( = ?auto_26759 ?auto_26786 ) ) ( not ( = ?auto_26759 ?auto_26788 ) ) ( not ( = ?auto_26759 ?auto_26773 ) ) ( not ( = ?auto_26759 ?auto_26783 ) ) ( not ( = ?auto_26759 ?auto_26784 ) ) ( not ( = ?auto_26759 ?auto_26768 ) ) ( not ( = ?auto_26759 ?auto_26775 ) ) ( not ( = ?auto_26760 ?auto_26769 ) ) ( not ( = ?auto_26760 ?auto_26790 ) ) ( not ( = ?auto_26760 ?auto_26785 ) ) ( not ( = ?auto_26760 ?auto_26766 ) ) ( not ( = ?auto_26760 ?auto_26779 ) ) ( not ( = ?auto_26760 ?auto_26771 ) ) ( not ( = ?auto_26760 ?auto_26780 ) ) ( not ( = ?auto_26760 ?auto_26767 ) ) ( not ( = ?auto_26760 ?auto_26777 ) ) ( not ( = ?auto_26760 ?auto_26778 ) ) ( not ( = ?auto_26763 ?auto_26797 ) ) ( not ( = ?auto_26763 ?auto_26781 ) ) ( not ( = ?auto_26763 ?auto_26796 ) ) ( not ( = ?auto_26763 ?auto_26776 ) ) ( not ( = ?auto_26763 ?auto_26774 ) ) ( not ( = ?auto_26763 ?auto_26793 ) ) ( not ( = ?auto_26763 ?auto_26782 ) ) ( not ( = ?auto_26763 ?auto_26789 ) ) ( not ( = ?auto_26763 ?auto_26794 ) ) ( not ( = ?auto_26763 ?auto_26770 ) ) ( not ( = ?auto_26761 ?auto_26792 ) ) ( not ( = ?auto_26761 ?auto_26787 ) ) ( not ( = ?auto_26761 ?auto_26772 ) ) ( not ( = ?auto_26761 ?auto_26791 ) ) ( not ( = ?auto_26761 ?auto_26795 ) ) ( not ( = ?auto_26761 ?auto_26786 ) ) ( not ( = ?auto_26761 ?auto_26788 ) ) ( not ( = ?auto_26761 ?auto_26773 ) ) ( not ( = ?auto_26761 ?auto_26783 ) ) ( not ( = ?auto_26761 ?auto_26784 ) ) ( not ( = ?auto_26761 ?auto_26768 ) ) ( not ( = ?auto_26761 ?auto_26775 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_26746 ?auto_26747 ?auto_26748 ?auto_26749 ?auto_26750 ?auto_26751 ?auto_26752 ?auto_26753 ?auto_26754 ?auto_26755 ?auto_26756 ?auto_26757 ?auto_26758 )
      ( MAKE-1CRATE ?auto_26758 ?auto_26759 )
      ( MAKE-13CRATE-VERIFY ?auto_26746 ?auto_26747 ?auto_26748 ?auto_26749 ?auto_26750 ?auto_26751 ?auto_26752 ?auto_26753 ?auto_26754 ?auto_26755 ?auto_26756 ?auto_26757 ?auto_26758 ?auto_26759 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_26823 - SURFACE
      ?auto_26824 - SURFACE
      ?auto_26825 - SURFACE
      ?auto_26826 - SURFACE
      ?auto_26827 - SURFACE
      ?auto_26828 - SURFACE
      ?auto_26829 - SURFACE
      ?auto_26830 - SURFACE
      ?auto_26831 - SURFACE
      ?auto_26832 - SURFACE
      ?auto_26833 - SURFACE
      ?auto_26834 - SURFACE
      ?auto_26835 - SURFACE
      ?auto_26836 - SURFACE
      ?auto_26837 - SURFACE
    )
    :vars
    (
      ?auto_26839 - HOIST
      ?auto_26840 - PLACE
      ?auto_26841 - PLACE
      ?auto_26838 - HOIST
      ?auto_26843 - SURFACE
      ?auto_26873 - PLACE
      ?auto_26860 - HOIST
      ?auto_26874 - SURFACE
      ?auto_26849 - PLACE
      ?auto_26852 - HOIST
      ?auto_26857 - SURFACE
      ?auto_26845 - PLACE
      ?auto_26865 - HOIST
      ?auto_26868 - SURFACE
      ?auto_26855 - PLACE
      ?auto_26856 - HOIST
      ?auto_26867 - SURFACE
      ?auto_26875 - PLACE
      ?auto_26876 - HOIST
      ?auto_26862 - SURFACE
      ?auto_26859 - SURFACE
      ?auto_26863 - PLACE
      ?auto_26861 - HOIST
      ?auto_26847 - SURFACE
      ?auto_26846 - PLACE
      ?auto_26864 - HOIST
      ?auto_26869 - SURFACE
      ?auto_26851 - PLACE
      ?auto_26853 - HOIST
      ?auto_26871 - SURFACE
      ?auto_26848 - PLACE
      ?auto_26858 - HOIST
      ?auto_26854 - SURFACE
      ?auto_26870 - SURFACE
      ?auto_26844 - SURFACE
      ?auto_26866 - PLACE
      ?auto_26850 - HOIST
      ?auto_26872 - SURFACE
      ?auto_26842 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26839 ?auto_26840 ) ( IS-CRATE ?auto_26837 ) ( not ( = ?auto_26841 ?auto_26840 ) ) ( HOIST-AT ?auto_26838 ?auto_26841 ) ( SURFACE-AT ?auto_26837 ?auto_26841 ) ( ON ?auto_26837 ?auto_26843 ) ( CLEAR ?auto_26837 ) ( not ( = ?auto_26836 ?auto_26837 ) ) ( not ( = ?auto_26836 ?auto_26843 ) ) ( not ( = ?auto_26837 ?auto_26843 ) ) ( not ( = ?auto_26839 ?auto_26838 ) ) ( IS-CRATE ?auto_26836 ) ( not ( = ?auto_26873 ?auto_26840 ) ) ( HOIST-AT ?auto_26860 ?auto_26873 ) ( AVAILABLE ?auto_26860 ) ( SURFACE-AT ?auto_26836 ?auto_26873 ) ( ON ?auto_26836 ?auto_26874 ) ( CLEAR ?auto_26836 ) ( not ( = ?auto_26835 ?auto_26836 ) ) ( not ( = ?auto_26835 ?auto_26874 ) ) ( not ( = ?auto_26836 ?auto_26874 ) ) ( not ( = ?auto_26839 ?auto_26860 ) ) ( IS-CRATE ?auto_26835 ) ( not ( = ?auto_26849 ?auto_26840 ) ) ( HOIST-AT ?auto_26852 ?auto_26849 ) ( AVAILABLE ?auto_26852 ) ( SURFACE-AT ?auto_26835 ?auto_26849 ) ( ON ?auto_26835 ?auto_26857 ) ( CLEAR ?auto_26835 ) ( not ( = ?auto_26834 ?auto_26835 ) ) ( not ( = ?auto_26834 ?auto_26857 ) ) ( not ( = ?auto_26835 ?auto_26857 ) ) ( not ( = ?auto_26839 ?auto_26852 ) ) ( IS-CRATE ?auto_26834 ) ( not ( = ?auto_26845 ?auto_26840 ) ) ( HOIST-AT ?auto_26865 ?auto_26845 ) ( AVAILABLE ?auto_26865 ) ( SURFACE-AT ?auto_26834 ?auto_26845 ) ( ON ?auto_26834 ?auto_26868 ) ( CLEAR ?auto_26834 ) ( not ( = ?auto_26833 ?auto_26834 ) ) ( not ( = ?auto_26833 ?auto_26868 ) ) ( not ( = ?auto_26834 ?auto_26868 ) ) ( not ( = ?auto_26839 ?auto_26865 ) ) ( IS-CRATE ?auto_26833 ) ( not ( = ?auto_26855 ?auto_26840 ) ) ( HOIST-AT ?auto_26856 ?auto_26855 ) ( AVAILABLE ?auto_26856 ) ( SURFACE-AT ?auto_26833 ?auto_26855 ) ( ON ?auto_26833 ?auto_26867 ) ( CLEAR ?auto_26833 ) ( not ( = ?auto_26832 ?auto_26833 ) ) ( not ( = ?auto_26832 ?auto_26867 ) ) ( not ( = ?auto_26833 ?auto_26867 ) ) ( not ( = ?auto_26839 ?auto_26856 ) ) ( IS-CRATE ?auto_26832 ) ( not ( = ?auto_26875 ?auto_26840 ) ) ( HOIST-AT ?auto_26876 ?auto_26875 ) ( SURFACE-AT ?auto_26832 ?auto_26875 ) ( ON ?auto_26832 ?auto_26862 ) ( CLEAR ?auto_26832 ) ( not ( = ?auto_26831 ?auto_26832 ) ) ( not ( = ?auto_26831 ?auto_26862 ) ) ( not ( = ?auto_26832 ?auto_26862 ) ) ( not ( = ?auto_26839 ?auto_26876 ) ) ( IS-CRATE ?auto_26831 ) ( SURFACE-AT ?auto_26831 ?auto_26841 ) ( ON ?auto_26831 ?auto_26859 ) ( CLEAR ?auto_26831 ) ( not ( = ?auto_26830 ?auto_26831 ) ) ( not ( = ?auto_26830 ?auto_26859 ) ) ( not ( = ?auto_26831 ?auto_26859 ) ) ( IS-CRATE ?auto_26830 ) ( not ( = ?auto_26863 ?auto_26840 ) ) ( HOIST-AT ?auto_26861 ?auto_26863 ) ( AVAILABLE ?auto_26861 ) ( SURFACE-AT ?auto_26830 ?auto_26863 ) ( ON ?auto_26830 ?auto_26847 ) ( CLEAR ?auto_26830 ) ( not ( = ?auto_26829 ?auto_26830 ) ) ( not ( = ?auto_26829 ?auto_26847 ) ) ( not ( = ?auto_26830 ?auto_26847 ) ) ( not ( = ?auto_26839 ?auto_26861 ) ) ( IS-CRATE ?auto_26829 ) ( not ( = ?auto_26846 ?auto_26840 ) ) ( HOIST-AT ?auto_26864 ?auto_26846 ) ( AVAILABLE ?auto_26864 ) ( SURFACE-AT ?auto_26829 ?auto_26846 ) ( ON ?auto_26829 ?auto_26869 ) ( CLEAR ?auto_26829 ) ( not ( = ?auto_26828 ?auto_26829 ) ) ( not ( = ?auto_26828 ?auto_26869 ) ) ( not ( = ?auto_26829 ?auto_26869 ) ) ( not ( = ?auto_26839 ?auto_26864 ) ) ( IS-CRATE ?auto_26828 ) ( not ( = ?auto_26851 ?auto_26840 ) ) ( HOIST-AT ?auto_26853 ?auto_26851 ) ( AVAILABLE ?auto_26853 ) ( SURFACE-AT ?auto_26828 ?auto_26851 ) ( ON ?auto_26828 ?auto_26871 ) ( CLEAR ?auto_26828 ) ( not ( = ?auto_26827 ?auto_26828 ) ) ( not ( = ?auto_26827 ?auto_26871 ) ) ( not ( = ?auto_26828 ?auto_26871 ) ) ( not ( = ?auto_26839 ?auto_26853 ) ) ( IS-CRATE ?auto_26827 ) ( not ( = ?auto_26848 ?auto_26840 ) ) ( HOIST-AT ?auto_26858 ?auto_26848 ) ( AVAILABLE ?auto_26858 ) ( SURFACE-AT ?auto_26827 ?auto_26848 ) ( ON ?auto_26827 ?auto_26854 ) ( CLEAR ?auto_26827 ) ( not ( = ?auto_26826 ?auto_26827 ) ) ( not ( = ?auto_26826 ?auto_26854 ) ) ( not ( = ?auto_26827 ?auto_26854 ) ) ( not ( = ?auto_26839 ?auto_26858 ) ) ( IS-CRATE ?auto_26826 ) ( AVAILABLE ?auto_26876 ) ( SURFACE-AT ?auto_26826 ?auto_26875 ) ( ON ?auto_26826 ?auto_26870 ) ( CLEAR ?auto_26826 ) ( not ( = ?auto_26825 ?auto_26826 ) ) ( not ( = ?auto_26825 ?auto_26870 ) ) ( not ( = ?auto_26826 ?auto_26870 ) ) ( IS-CRATE ?auto_26825 ) ( AVAILABLE ?auto_26838 ) ( SURFACE-AT ?auto_26825 ?auto_26841 ) ( ON ?auto_26825 ?auto_26844 ) ( CLEAR ?auto_26825 ) ( not ( = ?auto_26824 ?auto_26825 ) ) ( not ( = ?auto_26824 ?auto_26844 ) ) ( not ( = ?auto_26825 ?auto_26844 ) ) ( SURFACE-AT ?auto_26823 ?auto_26840 ) ( CLEAR ?auto_26823 ) ( IS-CRATE ?auto_26824 ) ( AVAILABLE ?auto_26839 ) ( not ( = ?auto_26866 ?auto_26840 ) ) ( HOIST-AT ?auto_26850 ?auto_26866 ) ( AVAILABLE ?auto_26850 ) ( SURFACE-AT ?auto_26824 ?auto_26866 ) ( ON ?auto_26824 ?auto_26872 ) ( CLEAR ?auto_26824 ) ( TRUCK-AT ?auto_26842 ?auto_26840 ) ( not ( = ?auto_26823 ?auto_26824 ) ) ( not ( = ?auto_26823 ?auto_26872 ) ) ( not ( = ?auto_26824 ?auto_26872 ) ) ( not ( = ?auto_26839 ?auto_26850 ) ) ( not ( = ?auto_26823 ?auto_26825 ) ) ( not ( = ?auto_26823 ?auto_26844 ) ) ( not ( = ?auto_26825 ?auto_26872 ) ) ( not ( = ?auto_26841 ?auto_26866 ) ) ( not ( = ?auto_26838 ?auto_26850 ) ) ( not ( = ?auto_26844 ?auto_26872 ) ) ( not ( = ?auto_26823 ?auto_26826 ) ) ( not ( = ?auto_26823 ?auto_26870 ) ) ( not ( = ?auto_26824 ?auto_26826 ) ) ( not ( = ?auto_26824 ?auto_26870 ) ) ( not ( = ?auto_26826 ?auto_26844 ) ) ( not ( = ?auto_26826 ?auto_26872 ) ) ( not ( = ?auto_26875 ?auto_26841 ) ) ( not ( = ?auto_26875 ?auto_26866 ) ) ( not ( = ?auto_26876 ?auto_26838 ) ) ( not ( = ?auto_26876 ?auto_26850 ) ) ( not ( = ?auto_26870 ?auto_26844 ) ) ( not ( = ?auto_26870 ?auto_26872 ) ) ( not ( = ?auto_26823 ?auto_26827 ) ) ( not ( = ?auto_26823 ?auto_26854 ) ) ( not ( = ?auto_26824 ?auto_26827 ) ) ( not ( = ?auto_26824 ?auto_26854 ) ) ( not ( = ?auto_26825 ?auto_26827 ) ) ( not ( = ?auto_26825 ?auto_26854 ) ) ( not ( = ?auto_26827 ?auto_26870 ) ) ( not ( = ?auto_26827 ?auto_26844 ) ) ( not ( = ?auto_26827 ?auto_26872 ) ) ( not ( = ?auto_26848 ?auto_26875 ) ) ( not ( = ?auto_26848 ?auto_26841 ) ) ( not ( = ?auto_26848 ?auto_26866 ) ) ( not ( = ?auto_26858 ?auto_26876 ) ) ( not ( = ?auto_26858 ?auto_26838 ) ) ( not ( = ?auto_26858 ?auto_26850 ) ) ( not ( = ?auto_26854 ?auto_26870 ) ) ( not ( = ?auto_26854 ?auto_26844 ) ) ( not ( = ?auto_26854 ?auto_26872 ) ) ( not ( = ?auto_26823 ?auto_26828 ) ) ( not ( = ?auto_26823 ?auto_26871 ) ) ( not ( = ?auto_26824 ?auto_26828 ) ) ( not ( = ?auto_26824 ?auto_26871 ) ) ( not ( = ?auto_26825 ?auto_26828 ) ) ( not ( = ?auto_26825 ?auto_26871 ) ) ( not ( = ?auto_26826 ?auto_26828 ) ) ( not ( = ?auto_26826 ?auto_26871 ) ) ( not ( = ?auto_26828 ?auto_26854 ) ) ( not ( = ?auto_26828 ?auto_26870 ) ) ( not ( = ?auto_26828 ?auto_26844 ) ) ( not ( = ?auto_26828 ?auto_26872 ) ) ( not ( = ?auto_26851 ?auto_26848 ) ) ( not ( = ?auto_26851 ?auto_26875 ) ) ( not ( = ?auto_26851 ?auto_26841 ) ) ( not ( = ?auto_26851 ?auto_26866 ) ) ( not ( = ?auto_26853 ?auto_26858 ) ) ( not ( = ?auto_26853 ?auto_26876 ) ) ( not ( = ?auto_26853 ?auto_26838 ) ) ( not ( = ?auto_26853 ?auto_26850 ) ) ( not ( = ?auto_26871 ?auto_26854 ) ) ( not ( = ?auto_26871 ?auto_26870 ) ) ( not ( = ?auto_26871 ?auto_26844 ) ) ( not ( = ?auto_26871 ?auto_26872 ) ) ( not ( = ?auto_26823 ?auto_26829 ) ) ( not ( = ?auto_26823 ?auto_26869 ) ) ( not ( = ?auto_26824 ?auto_26829 ) ) ( not ( = ?auto_26824 ?auto_26869 ) ) ( not ( = ?auto_26825 ?auto_26829 ) ) ( not ( = ?auto_26825 ?auto_26869 ) ) ( not ( = ?auto_26826 ?auto_26829 ) ) ( not ( = ?auto_26826 ?auto_26869 ) ) ( not ( = ?auto_26827 ?auto_26829 ) ) ( not ( = ?auto_26827 ?auto_26869 ) ) ( not ( = ?auto_26829 ?auto_26871 ) ) ( not ( = ?auto_26829 ?auto_26854 ) ) ( not ( = ?auto_26829 ?auto_26870 ) ) ( not ( = ?auto_26829 ?auto_26844 ) ) ( not ( = ?auto_26829 ?auto_26872 ) ) ( not ( = ?auto_26846 ?auto_26851 ) ) ( not ( = ?auto_26846 ?auto_26848 ) ) ( not ( = ?auto_26846 ?auto_26875 ) ) ( not ( = ?auto_26846 ?auto_26841 ) ) ( not ( = ?auto_26846 ?auto_26866 ) ) ( not ( = ?auto_26864 ?auto_26853 ) ) ( not ( = ?auto_26864 ?auto_26858 ) ) ( not ( = ?auto_26864 ?auto_26876 ) ) ( not ( = ?auto_26864 ?auto_26838 ) ) ( not ( = ?auto_26864 ?auto_26850 ) ) ( not ( = ?auto_26869 ?auto_26871 ) ) ( not ( = ?auto_26869 ?auto_26854 ) ) ( not ( = ?auto_26869 ?auto_26870 ) ) ( not ( = ?auto_26869 ?auto_26844 ) ) ( not ( = ?auto_26869 ?auto_26872 ) ) ( not ( = ?auto_26823 ?auto_26830 ) ) ( not ( = ?auto_26823 ?auto_26847 ) ) ( not ( = ?auto_26824 ?auto_26830 ) ) ( not ( = ?auto_26824 ?auto_26847 ) ) ( not ( = ?auto_26825 ?auto_26830 ) ) ( not ( = ?auto_26825 ?auto_26847 ) ) ( not ( = ?auto_26826 ?auto_26830 ) ) ( not ( = ?auto_26826 ?auto_26847 ) ) ( not ( = ?auto_26827 ?auto_26830 ) ) ( not ( = ?auto_26827 ?auto_26847 ) ) ( not ( = ?auto_26828 ?auto_26830 ) ) ( not ( = ?auto_26828 ?auto_26847 ) ) ( not ( = ?auto_26830 ?auto_26869 ) ) ( not ( = ?auto_26830 ?auto_26871 ) ) ( not ( = ?auto_26830 ?auto_26854 ) ) ( not ( = ?auto_26830 ?auto_26870 ) ) ( not ( = ?auto_26830 ?auto_26844 ) ) ( not ( = ?auto_26830 ?auto_26872 ) ) ( not ( = ?auto_26863 ?auto_26846 ) ) ( not ( = ?auto_26863 ?auto_26851 ) ) ( not ( = ?auto_26863 ?auto_26848 ) ) ( not ( = ?auto_26863 ?auto_26875 ) ) ( not ( = ?auto_26863 ?auto_26841 ) ) ( not ( = ?auto_26863 ?auto_26866 ) ) ( not ( = ?auto_26861 ?auto_26864 ) ) ( not ( = ?auto_26861 ?auto_26853 ) ) ( not ( = ?auto_26861 ?auto_26858 ) ) ( not ( = ?auto_26861 ?auto_26876 ) ) ( not ( = ?auto_26861 ?auto_26838 ) ) ( not ( = ?auto_26861 ?auto_26850 ) ) ( not ( = ?auto_26847 ?auto_26869 ) ) ( not ( = ?auto_26847 ?auto_26871 ) ) ( not ( = ?auto_26847 ?auto_26854 ) ) ( not ( = ?auto_26847 ?auto_26870 ) ) ( not ( = ?auto_26847 ?auto_26844 ) ) ( not ( = ?auto_26847 ?auto_26872 ) ) ( not ( = ?auto_26823 ?auto_26831 ) ) ( not ( = ?auto_26823 ?auto_26859 ) ) ( not ( = ?auto_26824 ?auto_26831 ) ) ( not ( = ?auto_26824 ?auto_26859 ) ) ( not ( = ?auto_26825 ?auto_26831 ) ) ( not ( = ?auto_26825 ?auto_26859 ) ) ( not ( = ?auto_26826 ?auto_26831 ) ) ( not ( = ?auto_26826 ?auto_26859 ) ) ( not ( = ?auto_26827 ?auto_26831 ) ) ( not ( = ?auto_26827 ?auto_26859 ) ) ( not ( = ?auto_26828 ?auto_26831 ) ) ( not ( = ?auto_26828 ?auto_26859 ) ) ( not ( = ?auto_26829 ?auto_26831 ) ) ( not ( = ?auto_26829 ?auto_26859 ) ) ( not ( = ?auto_26831 ?auto_26847 ) ) ( not ( = ?auto_26831 ?auto_26869 ) ) ( not ( = ?auto_26831 ?auto_26871 ) ) ( not ( = ?auto_26831 ?auto_26854 ) ) ( not ( = ?auto_26831 ?auto_26870 ) ) ( not ( = ?auto_26831 ?auto_26844 ) ) ( not ( = ?auto_26831 ?auto_26872 ) ) ( not ( = ?auto_26859 ?auto_26847 ) ) ( not ( = ?auto_26859 ?auto_26869 ) ) ( not ( = ?auto_26859 ?auto_26871 ) ) ( not ( = ?auto_26859 ?auto_26854 ) ) ( not ( = ?auto_26859 ?auto_26870 ) ) ( not ( = ?auto_26859 ?auto_26844 ) ) ( not ( = ?auto_26859 ?auto_26872 ) ) ( not ( = ?auto_26823 ?auto_26832 ) ) ( not ( = ?auto_26823 ?auto_26862 ) ) ( not ( = ?auto_26824 ?auto_26832 ) ) ( not ( = ?auto_26824 ?auto_26862 ) ) ( not ( = ?auto_26825 ?auto_26832 ) ) ( not ( = ?auto_26825 ?auto_26862 ) ) ( not ( = ?auto_26826 ?auto_26832 ) ) ( not ( = ?auto_26826 ?auto_26862 ) ) ( not ( = ?auto_26827 ?auto_26832 ) ) ( not ( = ?auto_26827 ?auto_26862 ) ) ( not ( = ?auto_26828 ?auto_26832 ) ) ( not ( = ?auto_26828 ?auto_26862 ) ) ( not ( = ?auto_26829 ?auto_26832 ) ) ( not ( = ?auto_26829 ?auto_26862 ) ) ( not ( = ?auto_26830 ?auto_26832 ) ) ( not ( = ?auto_26830 ?auto_26862 ) ) ( not ( = ?auto_26832 ?auto_26859 ) ) ( not ( = ?auto_26832 ?auto_26847 ) ) ( not ( = ?auto_26832 ?auto_26869 ) ) ( not ( = ?auto_26832 ?auto_26871 ) ) ( not ( = ?auto_26832 ?auto_26854 ) ) ( not ( = ?auto_26832 ?auto_26870 ) ) ( not ( = ?auto_26832 ?auto_26844 ) ) ( not ( = ?auto_26832 ?auto_26872 ) ) ( not ( = ?auto_26862 ?auto_26859 ) ) ( not ( = ?auto_26862 ?auto_26847 ) ) ( not ( = ?auto_26862 ?auto_26869 ) ) ( not ( = ?auto_26862 ?auto_26871 ) ) ( not ( = ?auto_26862 ?auto_26854 ) ) ( not ( = ?auto_26862 ?auto_26870 ) ) ( not ( = ?auto_26862 ?auto_26844 ) ) ( not ( = ?auto_26862 ?auto_26872 ) ) ( not ( = ?auto_26823 ?auto_26833 ) ) ( not ( = ?auto_26823 ?auto_26867 ) ) ( not ( = ?auto_26824 ?auto_26833 ) ) ( not ( = ?auto_26824 ?auto_26867 ) ) ( not ( = ?auto_26825 ?auto_26833 ) ) ( not ( = ?auto_26825 ?auto_26867 ) ) ( not ( = ?auto_26826 ?auto_26833 ) ) ( not ( = ?auto_26826 ?auto_26867 ) ) ( not ( = ?auto_26827 ?auto_26833 ) ) ( not ( = ?auto_26827 ?auto_26867 ) ) ( not ( = ?auto_26828 ?auto_26833 ) ) ( not ( = ?auto_26828 ?auto_26867 ) ) ( not ( = ?auto_26829 ?auto_26833 ) ) ( not ( = ?auto_26829 ?auto_26867 ) ) ( not ( = ?auto_26830 ?auto_26833 ) ) ( not ( = ?auto_26830 ?auto_26867 ) ) ( not ( = ?auto_26831 ?auto_26833 ) ) ( not ( = ?auto_26831 ?auto_26867 ) ) ( not ( = ?auto_26833 ?auto_26862 ) ) ( not ( = ?auto_26833 ?auto_26859 ) ) ( not ( = ?auto_26833 ?auto_26847 ) ) ( not ( = ?auto_26833 ?auto_26869 ) ) ( not ( = ?auto_26833 ?auto_26871 ) ) ( not ( = ?auto_26833 ?auto_26854 ) ) ( not ( = ?auto_26833 ?auto_26870 ) ) ( not ( = ?auto_26833 ?auto_26844 ) ) ( not ( = ?auto_26833 ?auto_26872 ) ) ( not ( = ?auto_26855 ?auto_26875 ) ) ( not ( = ?auto_26855 ?auto_26841 ) ) ( not ( = ?auto_26855 ?auto_26863 ) ) ( not ( = ?auto_26855 ?auto_26846 ) ) ( not ( = ?auto_26855 ?auto_26851 ) ) ( not ( = ?auto_26855 ?auto_26848 ) ) ( not ( = ?auto_26855 ?auto_26866 ) ) ( not ( = ?auto_26856 ?auto_26876 ) ) ( not ( = ?auto_26856 ?auto_26838 ) ) ( not ( = ?auto_26856 ?auto_26861 ) ) ( not ( = ?auto_26856 ?auto_26864 ) ) ( not ( = ?auto_26856 ?auto_26853 ) ) ( not ( = ?auto_26856 ?auto_26858 ) ) ( not ( = ?auto_26856 ?auto_26850 ) ) ( not ( = ?auto_26867 ?auto_26862 ) ) ( not ( = ?auto_26867 ?auto_26859 ) ) ( not ( = ?auto_26867 ?auto_26847 ) ) ( not ( = ?auto_26867 ?auto_26869 ) ) ( not ( = ?auto_26867 ?auto_26871 ) ) ( not ( = ?auto_26867 ?auto_26854 ) ) ( not ( = ?auto_26867 ?auto_26870 ) ) ( not ( = ?auto_26867 ?auto_26844 ) ) ( not ( = ?auto_26867 ?auto_26872 ) ) ( not ( = ?auto_26823 ?auto_26834 ) ) ( not ( = ?auto_26823 ?auto_26868 ) ) ( not ( = ?auto_26824 ?auto_26834 ) ) ( not ( = ?auto_26824 ?auto_26868 ) ) ( not ( = ?auto_26825 ?auto_26834 ) ) ( not ( = ?auto_26825 ?auto_26868 ) ) ( not ( = ?auto_26826 ?auto_26834 ) ) ( not ( = ?auto_26826 ?auto_26868 ) ) ( not ( = ?auto_26827 ?auto_26834 ) ) ( not ( = ?auto_26827 ?auto_26868 ) ) ( not ( = ?auto_26828 ?auto_26834 ) ) ( not ( = ?auto_26828 ?auto_26868 ) ) ( not ( = ?auto_26829 ?auto_26834 ) ) ( not ( = ?auto_26829 ?auto_26868 ) ) ( not ( = ?auto_26830 ?auto_26834 ) ) ( not ( = ?auto_26830 ?auto_26868 ) ) ( not ( = ?auto_26831 ?auto_26834 ) ) ( not ( = ?auto_26831 ?auto_26868 ) ) ( not ( = ?auto_26832 ?auto_26834 ) ) ( not ( = ?auto_26832 ?auto_26868 ) ) ( not ( = ?auto_26834 ?auto_26867 ) ) ( not ( = ?auto_26834 ?auto_26862 ) ) ( not ( = ?auto_26834 ?auto_26859 ) ) ( not ( = ?auto_26834 ?auto_26847 ) ) ( not ( = ?auto_26834 ?auto_26869 ) ) ( not ( = ?auto_26834 ?auto_26871 ) ) ( not ( = ?auto_26834 ?auto_26854 ) ) ( not ( = ?auto_26834 ?auto_26870 ) ) ( not ( = ?auto_26834 ?auto_26844 ) ) ( not ( = ?auto_26834 ?auto_26872 ) ) ( not ( = ?auto_26845 ?auto_26855 ) ) ( not ( = ?auto_26845 ?auto_26875 ) ) ( not ( = ?auto_26845 ?auto_26841 ) ) ( not ( = ?auto_26845 ?auto_26863 ) ) ( not ( = ?auto_26845 ?auto_26846 ) ) ( not ( = ?auto_26845 ?auto_26851 ) ) ( not ( = ?auto_26845 ?auto_26848 ) ) ( not ( = ?auto_26845 ?auto_26866 ) ) ( not ( = ?auto_26865 ?auto_26856 ) ) ( not ( = ?auto_26865 ?auto_26876 ) ) ( not ( = ?auto_26865 ?auto_26838 ) ) ( not ( = ?auto_26865 ?auto_26861 ) ) ( not ( = ?auto_26865 ?auto_26864 ) ) ( not ( = ?auto_26865 ?auto_26853 ) ) ( not ( = ?auto_26865 ?auto_26858 ) ) ( not ( = ?auto_26865 ?auto_26850 ) ) ( not ( = ?auto_26868 ?auto_26867 ) ) ( not ( = ?auto_26868 ?auto_26862 ) ) ( not ( = ?auto_26868 ?auto_26859 ) ) ( not ( = ?auto_26868 ?auto_26847 ) ) ( not ( = ?auto_26868 ?auto_26869 ) ) ( not ( = ?auto_26868 ?auto_26871 ) ) ( not ( = ?auto_26868 ?auto_26854 ) ) ( not ( = ?auto_26868 ?auto_26870 ) ) ( not ( = ?auto_26868 ?auto_26844 ) ) ( not ( = ?auto_26868 ?auto_26872 ) ) ( not ( = ?auto_26823 ?auto_26835 ) ) ( not ( = ?auto_26823 ?auto_26857 ) ) ( not ( = ?auto_26824 ?auto_26835 ) ) ( not ( = ?auto_26824 ?auto_26857 ) ) ( not ( = ?auto_26825 ?auto_26835 ) ) ( not ( = ?auto_26825 ?auto_26857 ) ) ( not ( = ?auto_26826 ?auto_26835 ) ) ( not ( = ?auto_26826 ?auto_26857 ) ) ( not ( = ?auto_26827 ?auto_26835 ) ) ( not ( = ?auto_26827 ?auto_26857 ) ) ( not ( = ?auto_26828 ?auto_26835 ) ) ( not ( = ?auto_26828 ?auto_26857 ) ) ( not ( = ?auto_26829 ?auto_26835 ) ) ( not ( = ?auto_26829 ?auto_26857 ) ) ( not ( = ?auto_26830 ?auto_26835 ) ) ( not ( = ?auto_26830 ?auto_26857 ) ) ( not ( = ?auto_26831 ?auto_26835 ) ) ( not ( = ?auto_26831 ?auto_26857 ) ) ( not ( = ?auto_26832 ?auto_26835 ) ) ( not ( = ?auto_26832 ?auto_26857 ) ) ( not ( = ?auto_26833 ?auto_26835 ) ) ( not ( = ?auto_26833 ?auto_26857 ) ) ( not ( = ?auto_26835 ?auto_26868 ) ) ( not ( = ?auto_26835 ?auto_26867 ) ) ( not ( = ?auto_26835 ?auto_26862 ) ) ( not ( = ?auto_26835 ?auto_26859 ) ) ( not ( = ?auto_26835 ?auto_26847 ) ) ( not ( = ?auto_26835 ?auto_26869 ) ) ( not ( = ?auto_26835 ?auto_26871 ) ) ( not ( = ?auto_26835 ?auto_26854 ) ) ( not ( = ?auto_26835 ?auto_26870 ) ) ( not ( = ?auto_26835 ?auto_26844 ) ) ( not ( = ?auto_26835 ?auto_26872 ) ) ( not ( = ?auto_26849 ?auto_26845 ) ) ( not ( = ?auto_26849 ?auto_26855 ) ) ( not ( = ?auto_26849 ?auto_26875 ) ) ( not ( = ?auto_26849 ?auto_26841 ) ) ( not ( = ?auto_26849 ?auto_26863 ) ) ( not ( = ?auto_26849 ?auto_26846 ) ) ( not ( = ?auto_26849 ?auto_26851 ) ) ( not ( = ?auto_26849 ?auto_26848 ) ) ( not ( = ?auto_26849 ?auto_26866 ) ) ( not ( = ?auto_26852 ?auto_26865 ) ) ( not ( = ?auto_26852 ?auto_26856 ) ) ( not ( = ?auto_26852 ?auto_26876 ) ) ( not ( = ?auto_26852 ?auto_26838 ) ) ( not ( = ?auto_26852 ?auto_26861 ) ) ( not ( = ?auto_26852 ?auto_26864 ) ) ( not ( = ?auto_26852 ?auto_26853 ) ) ( not ( = ?auto_26852 ?auto_26858 ) ) ( not ( = ?auto_26852 ?auto_26850 ) ) ( not ( = ?auto_26857 ?auto_26868 ) ) ( not ( = ?auto_26857 ?auto_26867 ) ) ( not ( = ?auto_26857 ?auto_26862 ) ) ( not ( = ?auto_26857 ?auto_26859 ) ) ( not ( = ?auto_26857 ?auto_26847 ) ) ( not ( = ?auto_26857 ?auto_26869 ) ) ( not ( = ?auto_26857 ?auto_26871 ) ) ( not ( = ?auto_26857 ?auto_26854 ) ) ( not ( = ?auto_26857 ?auto_26870 ) ) ( not ( = ?auto_26857 ?auto_26844 ) ) ( not ( = ?auto_26857 ?auto_26872 ) ) ( not ( = ?auto_26823 ?auto_26836 ) ) ( not ( = ?auto_26823 ?auto_26874 ) ) ( not ( = ?auto_26824 ?auto_26836 ) ) ( not ( = ?auto_26824 ?auto_26874 ) ) ( not ( = ?auto_26825 ?auto_26836 ) ) ( not ( = ?auto_26825 ?auto_26874 ) ) ( not ( = ?auto_26826 ?auto_26836 ) ) ( not ( = ?auto_26826 ?auto_26874 ) ) ( not ( = ?auto_26827 ?auto_26836 ) ) ( not ( = ?auto_26827 ?auto_26874 ) ) ( not ( = ?auto_26828 ?auto_26836 ) ) ( not ( = ?auto_26828 ?auto_26874 ) ) ( not ( = ?auto_26829 ?auto_26836 ) ) ( not ( = ?auto_26829 ?auto_26874 ) ) ( not ( = ?auto_26830 ?auto_26836 ) ) ( not ( = ?auto_26830 ?auto_26874 ) ) ( not ( = ?auto_26831 ?auto_26836 ) ) ( not ( = ?auto_26831 ?auto_26874 ) ) ( not ( = ?auto_26832 ?auto_26836 ) ) ( not ( = ?auto_26832 ?auto_26874 ) ) ( not ( = ?auto_26833 ?auto_26836 ) ) ( not ( = ?auto_26833 ?auto_26874 ) ) ( not ( = ?auto_26834 ?auto_26836 ) ) ( not ( = ?auto_26834 ?auto_26874 ) ) ( not ( = ?auto_26836 ?auto_26857 ) ) ( not ( = ?auto_26836 ?auto_26868 ) ) ( not ( = ?auto_26836 ?auto_26867 ) ) ( not ( = ?auto_26836 ?auto_26862 ) ) ( not ( = ?auto_26836 ?auto_26859 ) ) ( not ( = ?auto_26836 ?auto_26847 ) ) ( not ( = ?auto_26836 ?auto_26869 ) ) ( not ( = ?auto_26836 ?auto_26871 ) ) ( not ( = ?auto_26836 ?auto_26854 ) ) ( not ( = ?auto_26836 ?auto_26870 ) ) ( not ( = ?auto_26836 ?auto_26844 ) ) ( not ( = ?auto_26836 ?auto_26872 ) ) ( not ( = ?auto_26873 ?auto_26849 ) ) ( not ( = ?auto_26873 ?auto_26845 ) ) ( not ( = ?auto_26873 ?auto_26855 ) ) ( not ( = ?auto_26873 ?auto_26875 ) ) ( not ( = ?auto_26873 ?auto_26841 ) ) ( not ( = ?auto_26873 ?auto_26863 ) ) ( not ( = ?auto_26873 ?auto_26846 ) ) ( not ( = ?auto_26873 ?auto_26851 ) ) ( not ( = ?auto_26873 ?auto_26848 ) ) ( not ( = ?auto_26873 ?auto_26866 ) ) ( not ( = ?auto_26860 ?auto_26852 ) ) ( not ( = ?auto_26860 ?auto_26865 ) ) ( not ( = ?auto_26860 ?auto_26856 ) ) ( not ( = ?auto_26860 ?auto_26876 ) ) ( not ( = ?auto_26860 ?auto_26838 ) ) ( not ( = ?auto_26860 ?auto_26861 ) ) ( not ( = ?auto_26860 ?auto_26864 ) ) ( not ( = ?auto_26860 ?auto_26853 ) ) ( not ( = ?auto_26860 ?auto_26858 ) ) ( not ( = ?auto_26860 ?auto_26850 ) ) ( not ( = ?auto_26874 ?auto_26857 ) ) ( not ( = ?auto_26874 ?auto_26868 ) ) ( not ( = ?auto_26874 ?auto_26867 ) ) ( not ( = ?auto_26874 ?auto_26862 ) ) ( not ( = ?auto_26874 ?auto_26859 ) ) ( not ( = ?auto_26874 ?auto_26847 ) ) ( not ( = ?auto_26874 ?auto_26869 ) ) ( not ( = ?auto_26874 ?auto_26871 ) ) ( not ( = ?auto_26874 ?auto_26854 ) ) ( not ( = ?auto_26874 ?auto_26870 ) ) ( not ( = ?auto_26874 ?auto_26844 ) ) ( not ( = ?auto_26874 ?auto_26872 ) ) ( not ( = ?auto_26823 ?auto_26837 ) ) ( not ( = ?auto_26823 ?auto_26843 ) ) ( not ( = ?auto_26824 ?auto_26837 ) ) ( not ( = ?auto_26824 ?auto_26843 ) ) ( not ( = ?auto_26825 ?auto_26837 ) ) ( not ( = ?auto_26825 ?auto_26843 ) ) ( not ( = ?auto_26826 ?auto_26837 ) ) ( not ( = ?auto_26826 ?auto_26843 ) ) ( not ( = ?auto_26827 ?auto_26837 ) ) ( not ( = ?auto_26827 ?auto_26843 ) ) ( not ( = ?auto_26828 ?auto_26837 ) ) ( not ( = ?auto_26828 ?auto_26843 ) ) ( not ( = ?auto_26829 ?auto_26837 ) ) ( not ( = ?auto_26829 ?auto_26843 ) ) ( not ( = ?auto_26830 ?auto_26837 ) ) ( not ( = ?auto_26830 ?auto_26843 ) ) ( not ( = ?auto_26831 ?auto_26837 ) ) ( not ( = ?auto_26831 ?auto_26843 ) ) ( not ( = ?auto_26832 ?auto_26837 ) ) ( not ( = ?auto_26832 ?auto_26843 ) ) ( not ( = ?auto_26833 ?auto_26837 ) ) ( not ( = ?auto_26833 ?auto_26843 ) ) ( not ( = ?auto_26834 ?auto_26837 ) ) ( not ( = ?auto_26834 ?auto_26843 ) ) ( not ( = ?auto_26835 ?auto_26837 ) ) ( not ( = ?auto_26835 ?auto_26843 ) ) ( not ( = ?auto_26837 ?auto_26874 ) ) ( not ( = ?auto_26837 ?auto_26857 ) ) ( not ( = ?auto_26837 ?auto_26868 ) ) ( not ( = ?auto_26837 ?auto_26867 ) ) ( not ( = ?auto_26837 ?auto_26862 ) ) ( not ( = ?auto_26837 ?auto_26859 ) ) ( not ( = ?auto_26837 ?auto_26847 ) ) ( not ( = ?auto_26837 ?auto_26869 ) ) ( not ( = ?auto_26837 ?auto_26871 ) ) ( not ( = ?auto_26837 ?auto_26854 ) ) ( not ( = ?auto_26837 ?auto_26870 ) ) ( not ( = ?auto_26837 ?auto_26844 ) ) ( not ( = ?auto_26837 ?auto_26872 ) ) ( not ( = ?auto_26843 ?auto_26874 ) ) ( not ( = ?auto_26843 ?auto_26857 ) ) ( not ( = ?auto_26843 ?auto_26868 ) ) ( not ( = ?auto_26843 ?auto_26867 ) ) ( not ( = ?auto_26843 ?auto_26862 ) ) ( not ( = ?auto_26843 ?auto_26859 ) ) ( not ( = ?auto_26843 ?auto_26847 ) ) ( not ( = ?auto_26843 ?auto_26869 ) ) ( not ( = ?auto_26843 ?auto_26871 ) ) ( not ( = ?auto_26843 ?auto_26854 ) ) ( not ( = ?auto_26843 ?auto_26870 ) ) ( not ( = ?auto_26843 ?auto_26844 ) ) ( not ( = ?auto_26843 ?auto_26872 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_26823 ?auto_26824 ?auto_26825 ?auto_26826 ?auto_26827 ?auto_26828 ?auto_26829 ?auto_26830 ?auto_26831 ?auto_26832 ?auto_26833 ?auto_26834 ?auto_26835 ?auto_26836 )
      ( MAKE-1CRATE ?auto_26836 ?auto_26837 )
      ( MAKE-14CRATE-VERIFY ?auto_26823 ?auto_26824 ?auto_26825 ?auto_26826 ?auto_26827 ?auto_26828 ?auto_26829 ?auto_26830 ?auto_26831 ?auto_26832 ?auto_26833 ?auto_26834 ?auto_26835 ?auto_26836 ?auto_26837 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_26903 - SURFACE
      ?auto_26904 - SURFACE
      ?auto_26905 - SURFACE
      ?auto_26906 - SURFACE
      ?auto_26907 - SURFACE
      ?auto_26908 - SURFACE
      ?auto_26909 - SURFACE
      ?auto_26910 - SURFACE
      ?auto_26911 - SURFACE
      ?auto_26912 - SURFACE
      ?auto_26913 - SURFACE
      ?auto_26914 - SURFACE
      ?auto_26915 - SURFACE
      ?auto_26916 - SURFACE
      ?auto_26918 - SURFACE
      ?auto_26917 - SURFACE
    )
    :vars
    (
      ?auto_26920 - HOIST
      ?auto_26921 - PLACE
      ?auto_26923 - PLACE
      ?auto_26924 - HOIST
      ?auto_26922 - SURFACE
      ?auto_26953 - PLACE
      ?auto_26942 - HOIST
      ?auto_26955 - SURFACE
      ?auto_26959 - PLACE
      ?auto_26930 - HOIST
      ?auto_26933 - SURFACE
      ?auto_26945 - PLACE
      ?auto_26957 - HOIST
      ?auto_26954 - SURFACE
      ?auto_26950 - PLACE
      ?auto_26938 - HOIST
      ?auto_26944 - SURFACE
      ?auto_26951 - PLACE
      ?auto_26943 - HOIST
      ?auto_26941 - SURFACE
      ?auto_26929 - PLACE
      ?auto_26947 - HOIST
      ?auto_26948 - SURFACE
      ?auto_26934 - SURFACE
      ?auto_26939 - PLACE
      ?auto_26932 - HOIST
      ?auto_26935 - SURFACE
      ?auto_26928 - PLACE
      ?auto_26925 - HOIST
      ?auto_26956 - SURFACE
      ?auto_26937 - PLACE
      ?auto_26958 - HOIST
      ?auto_26931 - SURFACE
      ?auto_26927 - PLACE
      ?auto_26936 - HOIST
      ?auto_26946 - SURFACE
      ?auto_26952 - SURFACE
      ?auto_26926 - SURFACE
      ?auto_26940 - PLACE
      ?auto_26949 - HOIST
      ?auto_26960 - SURFACE
      ?auto_26919 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26920 ?auto_26921 ) ( IS-CRATE ?auto_26917 ) ( not ( = ?auto_26923 ?auto_26921 ) ) ( HOIST-AT ?auto_26924 ?auto_26923 ) ( AVAILABLE ?auto_26924 ) ( SURFACE-AT ?auto_26917 ?auto_26923 ) ( ON ?auto_26917 ?auto_26922 ) ( CLEAR ?auto_26917 ) ( not ( = ?auto_26918 ?auto_26917 ) ) ( not ( = ?auto_26918 ?auto_26922 ) ) ( not ( = ?auto_26917 ?auto_26922 ) ) ( not ( = ?auto_26920 ?auto_26924 ) ) ( IS-CRATE ?auto_26918 ) ( not ( = ?auto_26953 ?auto_26921 ) ) ( HOIST-AT ?auto_26942 ?auto_26953 ) ( SURFACE-AT ?auto_26918 ?auto_26953 ) ( ON ?auto_26918 ?auto_26955 ) ( CLEAR ?auto_26918 ) ( not ( = ?auto_26916 ?auto_26918 ) ) ( not ( = ?auto_26916 ?auto_26955 ) ) ( not ( = ?auto_26918 ?auto_26955 ) ) ( not ( = ?auto_26920 ?auto_26942 ) ) ( IS-CRATE ?auto_26916 ) ( not ( = ?auto_26959 ?auto_26921 ) ) ( HOIST-AT ?auto_26930 ?auto_26959 ) ( AVAILABLE ?auto_26930 ) ( SURFACE-AT ?auto_26916 ?auto_26959 ) ( ON ?auto_26916 ?auto_26933 ) ( CLEAR ?auto_26916 ) ( not ( = ?auto_26915 ?auto_26916 ) ) ( not ( = ?auto_26915 ?auto_26933 ) ) ( not ( = ?auto_26916 ?auto_26933 ) ) ( not ( = ?auto_26920 ?auto_26930 ) ) ( IS-CRATE ?auto_26915 ) ( not ( = ?auto_26945 ?auto_26921 ) ) ( HOIST-AT ?auto_26957 ?auto_26945 ) ( AVAILABLE ?auto_26957 ) ( SURFACE-AT ?auto_26915 ?auto_26945 ) ( ON ?auto_26915 ?auto_26954 ) ( CLEAR ?auto_26915 ) ( not ( = ?auto_26914 ?auto_26915 ) ) ( not ( = ?auto_26914 ?auto_26954 ) ) ( not ( = ?auto_26915 ?auto_26954 ) ) ( not ( = ?auto_26920 ?auto_26957 ) ) ( IS-CRATE ?auto_26914 ) ( not ( = ?auto_26950 ?auto_26921 ) ) ( HOIST-AT ?auto_26938 ?auto_26950 ) ( AVAILABLE ?auto_26938 ) ( SURFACE-AT ?auto_26914 ?auto_26950 ) ( ON ?auto_26914 ?auto_26944 ) ( CLEAR ?auto_26914 ) ( not ( = ?auto_26913 ?auto_26914 ) ) ( not ( = ?auto_26913 ?auto_26944 ) ) ( not ( = ?auto_26914 ?auto_26944 ) ) ( not ( = ?auto_26920 ?auto_26938 ) ) ( IS-CRATE ?auto_26913 ) ( not ( = ?auto_26951 ?auto_26921 ) ) ( HOIST-AT ?auto_26943 ?auto_26951 ) ( AVAILABLE ?auto_26943 ) ( SURFACE-AT ?auto_26913 ?auto_26951 ) ( ON ?auto_26913 ?auto_26941 ) ( CLEAR ?auto_26913 ) ( not ( = ?auto_26912 ?auto_26913 ) ) ( not ( = ?auto_26912 ?auto_26941 ) ) ( not ( = ?auto_26913 ?auto_26941 ) ) ( not ( = ?auto_26920 ?auto_26943 ) ) ( IS-CRATE ?auto_26912 ) ( not ( = ?auto_26929 ?auto_26921 ) ) ( HOIST-AT ?auto_26947 ?auto_26929 ) ( SURFACE-AT ?auto_26912 ?auto_26929 ) ( ON ?auto_26912 ?auto_26948 ) ( CLEAR ?auto_26912 ) ( not ( = ?auto_26911 ?auto_26912 ) ) ( not ( = ?auto_26911 ?auto_26948 ) ) ( not ( = ?auto_26912 ?auto_26948 ) ) ( not ( = ?auto_26920 ?auto_26947 ) ) ( IS-CRATE ?auto_26911 ) ( SURFACE-AT ?auto_26911 ?auto_26953 ) ( ON ?auto_26911 ?auto_26934 ) ( CLEAR ?auto_26911 ) ( not ( = ?auto_26910 ?auto_26911 ) ) ( not ( = ?auto_26910 ?auto_26934 ) ) ( not ( = ?auto_26911 ?auto_26934 ) ) ( IS-CRATE ?auto_26910 ) ( not ( = ?auto_26939 ?auto_26921 ) ) ( HOIST-AT ?auto_26932 ?auto_26939 ) ( AVAILABLE ?auto_26932 ) ( SURFACE-AT ?auto_26910 ?auto_26939 ) ( ON ?auto_26910 ?auto_26935 ) ( CLEAR ?auto_26910 ) ( not ( = ?auto_26909 ?auto_26910 ) ) ( not ( = ?auto_26909 ?auto_26935 ) ) ( not ( = ?auto_26910 ?auto_26935 ) ) ( not ( = ?auto_26920 ?auto_26932 ) ) ( IS-CRATE ?auto_26909 ) ( not ( = ?auto_26928 ?auto_26921 ) ) ( HOIST-AT ?auto_26925 ?auto_26928 ) ( AVAILABLE ?auto_26925 ) ( SURFACE-AT ?auto_26909 ?auto_26928 ) ( ON ?auto_26909 ?auto_26956 ) ( CLEAR ?auto_26909 ) ( not ( = ?auto_26908 ?auto_26909 ) ) ( not ( = ?auto_26908 ?auto_26956 ) ) ( not ( = ?auto_26909 ?auto_26956 ) ) ( not ( = ?auto_26920 ?auto_26925 ) ) ( IS-CRATE ?auto_26908 ) ( not ( = ?auto_26937 ?auto_26921 ) ) ( HOIST-AT ?auto_26958 ?auto_26937 ) ( AVAILABLE ?auto_26958 ) ( SURFACE-AT ?auto_26908 ?auto_26937 ) ( ON ?auto_26908 ?auto_26931 ) ( CLEAR ?auto_26908 ) ( not ( = ?auto_26907 ?auto_26908 ) ) ( not ( = ?auto_26907 ?auto_26931 ) ) ( not ( = ?auto_26908 ?auto_26931 ) ) ( not ( = ?auto_26920 ?auto_26958 ) ) ( IS-CRATE ?auto_26907 ) ( not ( = ?auto_26927 ?auto_26921 ) ) ( HOIST-AT ?auto_26936 ?auto_26927 ) ( AVAILABLE ?auto_26936 ) ( SURFACE-AT ?auto_26907 ?auto_26927 ) ( ON ?auto_26907 ?auto_26946 ) ( CLEAR ?auto_26907 ) ( not ( = ?auto_26906 ?auto_26907 ) ) ( not ( = ?auto_26906 ?auto_26946 ) ) ( not ( = ?auto_26907 ?auto_26946 ) ) ( not ( = ?auto_26920 ?auto_26936 ) ) ( IS-CRATE ?auto_26906 ) ( AVAILABLE ?auto_26947 ) ( SURFACE-AT ?auto_26906 ?auto_26929 ) ( ON ?auto_26906 ?auto_26952 ) ( CLEAR ?auto_26906 ) ( not ( = ?auto_26905 ?auto_26906 ) ) ( not ( = ?auto_26905 ?auto_26952 ) ) ( not ( = ?auto_26906 ?auto_26952 ) ) ( IS-CRATE ?auto_26905 ) ( AVAILABLE ?auto_26942 ) ( SURFACE-AT ?auto_26905 ?auto_26953 ) ( ON ?auto_26905 ?auto_26926 ) ( CLEAR ?auto_26905 ) ( not ( = ?auto_26904 ?auto_26905 ) ) ( not ( = ?auto_26904 ?auto_26926 ) ) ( not ( = ?auto_26905 ?auto_26926 ) ) ( SURFACE-AT ?auto_26903 ?auto_26921 ) ( CLEAR ?auto_26903 ) ( IS-CRATE ?auto_26904 ) ( AVAILABLE ?auto_26920 ) ( not ( = ?auto_26940 ?auto_26921 ) ) ( HOIST-AT ?auto_26949 ?auto_26940 ) ( AVAILABLE ?auto_26949 ) ( SURFACE-AT ?auto_26904 ?auto_26940 ) ( ON ?auto_26904 ?auto_26960 ) ( CLEAR ?auto_26904 ) ( TRUCK-AT ?auto_26919 ?auto_26921 ) ( not ( = ?auto_26903 ?auto_26904 ) ) ( not ( = ?auto_26903 ?auto_26960 ) ) ( not ( = ?auto_26904 ?auto_26960 ) ) ( not ( = ?auto_26920 ?auto_26949 ) ) ( not ( = ?auto_26903 ?auto_26905 ) ) ( not ( = ?auto_26903 ?auto_26926 ) ) ( not ( = ?auto_26905 ?auto_26960 ) ) ( not ( = ?auto_26953 ?auto_26940 ) ) ( not ( = ?auto_26942 ?auto_26949 ) ) ( not ( = ?auto_26926 ?auto_26960 ) ) ( not ( = ?auto_26903 ?auto_26906 ) ) ( not ( = ?auto_26903 ?auto_26952 ) ) ( not ( = ?auto_26904 ?auto_26906 ) ) ( not ( = ?auto_26904 ?auto_26952 ) ) ( not ( = ?auto_26906 ?auto_26926 ) ) ( not ( = ?auto_26906 ?auto_26960 ) ) ( not ( = ?auto_26929 ?auto_26953 ) ) ( not ( = ?auto_26929 ?auto_26940 ) ) ( not ( = ?auto_26947 ?auto_26942 ) ) ( not ( = ?auto_26947 ?auto_26949 ) ) ( not ( = ?auto_26952 ?auto_26926 ) ) ( not ( = ?auto_26952 ?auto_26960 ) ) ( not ( = ?auto_26903 ?auto_26907 ) ) ( not ( = ?auto_26903 ?auto_26946 ) ) ( not ( = ?auto_26904 ?auto_26907 ) ) ( not ( = ?auto_26904 ?auto_26946 ) ) ( not ( = ?auto_26905 ?auto_26907 ) ) ( not ( = ?auto_26905 ?auto_26946 ) ) ( not ( = ?auto_26907 ?auto_26952 ) ) ( not ( = ?auto_26907 ?auto_26926 ) ) ( not ( = ?auto_26907 ?auto_26960 ) ) ( not ( = ?auto_26927 ?auto_26929 ) ) ( not ( = ?auto_26927 ?auto_26953 ) ) ( not ( = ?auto_26927 ?auto_26940 ) ) ( not ( = ?auto_26936 ?auto_26947 ) ) ( not ( = ?auto_26936 ?auto_26942 ) ) ( not ( = ?auto_26936 ?auto_26949 ) ) ( not ( = ?auto_26946 ?auto_26952 ) ) ( not ( = ?auto_26946 ?auto_26926 ) ) ( not ( = ?auto_26946 ?auto_26960 ) ) ( not ( = ?auto_26903 ?auto_26908 ) ) ( not ( = ?auto_26903 ?auto_26931 ) ) ( not ( = ?auto_26904 ?auto_26908 ) ) ( not ( = ?auto_26904 ?auto_26931 ) ) ( not ( = ?auto_26905 ?auto_26908 ) ) ( not ( = ?auto_26905 ?auto_26931 ) ) ( not ( = ?auto_26906 ?auto_26908 ) ) ( not ( = ?auto_26906 ?auto_26931 ) ) ( not ( = ?auto_26908 ?auto_26946 ) ) ( not ( = ?auto_26908 ?auto_26952 ) ) ( not ( = ?auto_26908 ?auto_26926 ) ) ( not ( = ?auto_26908 ?auto_26960 ) ) ( not ( = ?auto_26937 ?auto_26927 ) ) ( not ( = ?auto_26937 ?auto_26929 ) ) ( not ( = ?auto_26937 ?auto_26953 ) ) ( not ( = ?auto_26937 ?auto_26940 ) ) ( not ( = ?auto_26958 ?auto_26936 ) ) ( not ( = ?auto_26958 ?auto_26947 ) ) ( not ( = ?auto_26958 ?auto_26942 ) ) ( not ( = ?auto_26958 ?auto_26949 ) ) ( not ( = ?auto_26931 ?auto_26946 ) ) ( not ( = ?auto_26931 ?auto_26952 ) ) ( not ( = ?auto_26931 ?auto_26926 ) ) ( not ( = ?auto_26931 ?auto_26960 ) ) ( not ( = ?auto_26903 ?auto_26909 ) ) ( not ( = ?auto_26903 ?auto_26956 ) ) ( not ( = ?auto_26904 ?auto_26909 ) ) ( not ( = ?auto_26904 ?auto_26956 ) ) ( not ( = ?auto_26905 ?auto_26909 ) ) ( not ( = ?auto_26905 ?auto_26956 ) ) ( not ( = ?auto_26906 ?auto_26909 ) ) ( not ( = ?auto_26906 ?auto_26956 ) ) ( not ( = ?auto_26907 ?auto_26909 ) ) ( not ( = ?auto_26907 ?auto_26956 ) ) ( not ( = ?auto_26909 ?auto_26931 ) ) ( not ( = ?auto_26909 ?auto_26946 ) ) ( not ( = ?auto_26909 ?auto_26952 ) ) ( not ( = ?auto_26909 ?auto_26926 ) ) ( not ( = ?auto_26909 ?auto_26960 ) ) ( not ( = ?auto_26928 ?auto_26937 ) ) ( not ( = ?auto_26928 ?auto_26927 ) ) ( not ( = ?auto_26928 ?auto_26929 ) ) ( not ( = ?auto_26928 ?auto_26953 ) ) ( not ( = ?auto_26928 ?auto_26940 ) ) ( not ( = ?auto_26925 ?auto_26958 ) ) ( not ( = ?auto_26925 ?auto_26936 ) ) ( not ( = ?auto_26925 ?auto_26947 ) ) ( not ( = ?auto_26925 ?auto_26942 ) ) ( not ( = ?auto_26925 ?auto_26949 ) ) ( not ( = ?auto_26956 ?auto_26931 ) ) ( not ( = ?auto_26956 ?auto_26946 ) ) ( not ( = ?auto_26956 ?auto_26952 ) ) ( not ( = ?auto_26956 ?auto_26926 ) ) ( not ( = ?auto_26956 ?auto_26960 ) ) ( not ( = ?auto_26903 ?auto_26910 ) ) ( not ( = ?auto_26903 ?auto_26935 ) ) ( not ( = ?auto_26904 ?auto_26910 ) ) ( not ( = ?auto_26904 ?auto_26935 ) ) ( not ( = ?auto_26905 ?auto_26910 ) ) ( not ( = ?auto_26905 ?auto_26935 ) ) ( not ( = ?auto_26906 ?auto_26910 ) ) ( not ( = ?auto_26906 ?auto_26935 ) ) ( not ( = ?auto_26907 ?auto_26910 ) ) ( not ( = ?auto_26907 ?auto_26935 ) ) ( not ( = ?auto_26908 ?auto_26910 ) ) ( not ( = ?auto_26908 ?auto_26935 ) ) ( not ( = ?auto_26910 ?auto_26956 ) ) ( not ( = ?auto_26910 ?auto_26931 ) ) ( not ( = ?auto_26910 ?auto_26946 ) ) ( not ( = ?auto_26910 ?auto_26952 ) ) ( not ( = ?auto_26910 ?auto_26926 ) ) ( not ( = ?auto_26910 ?auto_26960 ) ) ( not ( = ?auto_26939 ?auto_26928 ) ) ( not ( = ?auto_26939 ?auto_26937 ) ) ( not ( = ?auto_26939 ?auto_26927 ) ) ( not ( = ?auto_26939 ?auto_26929 ) ) ( not ( = ?auto_26939 ?auto_26953 ) ) ( not ( = ?auto_26939 ?auto_26940 ) ) ( not ( = ?auto_26932 ?auto_26925 ) ) ( not ( = ?auto_26932 ?auto_26958 ) ) ( not ( = ?auto_26932 ?auto_26936 ) ) ( not ( = ?auto_26932 ?auto_26947 ) ) ( not ( = ?auto_26932 ?auto_26942 ) ) ( not ( = ?auto_26932 ?auto_26949 ) ) ( not ( = ?auto_26935 ?auto_26956 ) ) ( not ( = ?auto_26935 ?auto_26931 ) ) ( not ( = ?auto_26935 ?auto_26946 ) ) ( not ( = ?auto_26935 ?auto_26952 ) ) ( not ( = ?auto_26935 ?auto_26926 ) ) ( not ( = ?auto_26935 ?auto_26960 ) ) ( not ( = ?auto_26903 ?auto_26911 ) ) ( not ( = ?auto_26903 ?auto_26934 ) ) ( not ( = ?auto_26904 ?auto_26911 ) ) ( not ( = ?auto_26904 ?auto_26934 ) ) ( not ( = ?auto_26905 ?auto_26911 ) ) ( not ( = ?auto_26905 ?auto_26934 ) ) ( not ( = ?auto_26906 ?auto_26911 ) ) ( not ( = ?auto_26906 ?auto_26934 ) ) ( not ( = ?auto_26907 ?auto_26911 ) ) ( not ( = ?auto_26907 ?auto_26934 ) ) ( not ( = ?auto_26908 ?auto_26911 ) ) ( not ( = ?auto_26908 ?auto_26934 ) ) ( not ( = ?auto_26909 ?auto_26911 ) ) ( not ( = ?auto_26909 ?auto_26934 ) ) ( not ( = ?auto_26911 ?auto_26935 ) ) ( not ( = ?auto_26911 ?auto_26956 ) ) ( not ( = ?auto_26911 ?auto_26931 ) ) ( not ( = ?auto_26911 ?auto_26946 ) ) ( not ( = ?auto_26911 ?auto_26952 ) ) ( not ( = ?auto_26911 ?auto_26926 ) ) ( not ( = ?auto_26911 ?auto_26960 ) ) ( not ( = ?auto_26934 ?auto_26935 ) ) ( not ( = ?auto_26934 ?auto_26956 ) ) ( not ( = ?auto_26934 ?auto_26931 ) ) ( not ( = ?auto_26934 ?auto_26946 ) ) ( not ( = ?auto_26934 ?auto_26952 ) ) ( not ( = ?auto_26934 ?auto_26926 ) ) ( not ( = ?auto_26934 ?auto_26960 ) ) ( not ( = ?auto_26903 ?auto_26912 ) ) ( not ( = ?auto_26903 ?auto_26948 ) ) ( not ( = ?auto_26904 ?auto_26912 ) ) ( not ( = ?auto_26904 ?auto_26948 ) ) ( not ( = ?auto_26905 ?auto_26912 ) ) ( not ( = ?auto_26905 ?auto_26948 ) ) ( not ( = ?auto_26906 ?auto_26912 ) ) ( not ( = ?auto_26906 ?auto_26948 ) ) ( not ( = ?auto_26907 ?auto_26912 ) ) ( not ( = ?auto_26907 ?auto_26948 ) ) ( not ( = ?auto_26908 ?auto_26912 ) ) ( not ( = ?auto_26908 ?auto_26948 ) ) ( not ( = ?auto_26909 ?auto_26912 ) ) ( not ( = ?auto_26909 ?auto_26948 ) ) ( not ( = ?auto_26910 ?auto_26912 ) ) ( not ( = ?auto_26910 ?auto_26948 ) ) ( not ( = ?auto_26912 ?auto_26934 ) ) ( not ( = ?auto_26912 ?auto_26935 ) ) ( not ( = ?auto_26912 ?auto_26956 ) ) ( not ( = ?auto_26912 ?auto_26931 ) ) ( not ( = ?auto_26912 ?auto_26946 ) ) ( not ( = ?auto_26912 ?auto_26952 ) ) ( not ( = ?auto_26912 ?auto_26926 ) ) ( not ( = ?auto_26912 ?auto_26960 ) ) ( not ( = ?auto_26948 ?auto_26934 ) ) ( not ( = ?auto_26948 ?auto_26935 ) ) ( not ( = ?auto_26948 ?auto_26956 ) ) ( not ( = ?auto_26948 ?auto_26931 ) ) ( not ( = ?auto_26948 ?auto_26946 ) ) ( not ( = ?auto_26948 ?auto_26952 ) ) ( not ( = ?auto_26948 ?auto_26926 ) ) ( not ( = ?auto_26948 ?auto_26960 ) ) ( not ( = ?auto_26903 ?auto_26913 ) ) ( not ( = ?auto_26903 ?auto_26941 ) ) ( not ( = ?auto_26904 ?auto_26913 ) ) ( not ( = ?auto_26904 ?auto_26941 ) ) ( not ( = ?auto_26905 ?auto_26913 ) ) ( not ( = ?auto_26905 ?auto_26941 ) ) ( not ( = ?auto_26906 ?auto_26913 ) ) ( not ( = ?auto_26906 ?auto_26941 ) ) ( not ( = ?auto_26907 ?auto_26913 ) ) ( not ( = ?auto_26907 ?auto_26941 ) ) ( not ( = ?auto_26908 ?auto_26913 ) ) ( not ( = ?auto_26908 ?auto_26941 ) ) ( not ( = ?auto_26909 ?auto_26913 ) ) ( not ( = ?auto_26909 ?auto_26941 ) ) ( not ( = ?auto_26910 ?auto_26913 ) ) ( not ( = ?auto_26910 ?auto_26941 ) ) ( not ( = ?auto_26911 ?auto_26913 ) ) ( not ( = ?auto_26911 ?auto_26941 ) ) ( not ( = ?auto_26913 ?auto_26948 ) ) ( not ( = ?auto_26913 ?auto_26934 ) ) ( not ( = ?auto_26913 ?auto_26935 ) ) ( not ( = ?auto_26913 ?auto_26956 ) ) ( not ( = ?auto_26913 ?auto_26931 ) ) ( not ( = ?auto_26913 ?auto_26946 ) ) ( not ( = ?auto_26913 ?auto_26952 ) ) ( not ( = ?auto_26913 ?auto_26926 ) ) ( not ( = ?auto_26913 ?auto_26960 ) ) ( not ( = ?auto_26951 ?auto_26929 ) ) ( not ( = ?auto_26951 ?auto_26953 ) ) ( not ( = ?auto_26951 ?auto_26939 ) ) ( not ( = ?auto_26951 ?auto_26928 ) ) ( not ( = ?auto_26951 ?auto_26937 ) ) ( not ( = ?auto_26951 ?auto_26927 ) ) ( not ( = ?auto_26951 ?auto_26940 ) ) ( not ( = ?auto_26943 ?auto_26947 ) ) ( not ( = ?auto_26943 ?auto_26942 ) ) ( not ( = ?auto_26943 ?auto_26932 ) ) ( not ( = ?auto_26943 ?auto_26925 ) ) ( not ( = ?auto_26943 ?auto_26958 ) ) ( not ( = ?auto_26943 ?auto_26936 ) ) ( not ( = ?auto_26943 ?auto_26949 ) ) ( not ( = ?auto_26941 ?auto_26948 ) ) ( not ( = ?auto_26941 ?auto_26934 ) ) ( not ( = ?auto_26941 ?auto_26935 ) ) ( not ( = ?auto_26941 ?auto_26956 ) ) ( not ( = ?auto_26941 ?auto_26931 ) ) ( not ( = ?auto_26941 ?auto_26946 ) ) ( not ( = ?auto_26941 ?auto_26952 ) ) ( not ( = ?auto_26941 ?auto_26926 ) ) ( not ( = ?auto_26941 ?auto_26960 ) ) ( not ( = ?auto_26903 ?auto_26914 ) ) ( not ( = ?auto_26903 ?auto_26944 ) ) ( not ( = ?auto_26904 ?auto_26914 ) ) ( not ( = ?auto_26904 ?auto_26944 ) ) ( not ( = ?auto_26905 ?auto_26914 ) ) ( not ( = ?auto_26905 ?auto_26944 ) ) ( not ( = ?auto_26906 ?auto_26914 ) ) ( not ( = ?auto_26906 ?auto_26944 ) ) ( not ( = ?auto_26907 ?auto_26914 ) ) ( not ( = ?auto_26907 ?auto_26944 ) ) ( not ( = ?auto_26908 ?auto_26914 ) ) ( not ( = ?auto_26908 ?auto_26944 ) ) ( not ( = ?auto_26909 ?auto_26914 ) ) ( not ( = ?auto_26909 ?auto_26944 ) ) ( not ( = ?auto_26910 ?auto_26914 ) ) ( not ( = ?auto_26910 ?auto_26944 ) ) ( not ( = ?auto_26911 ?auto_26914 ) ) ( not ( = ?auto_26911 ?auto_26944 ) ) ( not ( = ?auto_26912 ?auto_26914 ) ) ( not ( = ?auto_26912 ?auto_26944 ) ) ( not ( = ?auto_26914 ?auto_26941 ) ) ( not ( = ?auto_26914 ?auto_26948 ) ) ( not ( = ?auto_26914 ?auto_26934 ) ) ( not ( = ?auto_26914 ?auto_26935 ) ) ( not ( = ?auto_26914 ?auto_26956 ) ) ( not ( = ?auto_26914 ?auto_26931 ) ) ( not ( = ?auto_26914 ?auto_26946 ) ) ( not ( = ?auto_26914 ?auto_26952 ) ) ( not ( = ?auto_26914 ?auto_26926 ) ) ( not ( = ?auto_26914 ?auto_26960 ) ) ( not ( = ?auto_26950 ?auto_26951 ) ) ( not ( = ?auto_26950 ?auto_26929 ) ) ( not ( = ?auto_26950 ?auto_26953 ) ) ( not ( = ?auto_26950 ?auto_26939 ) ) ( not ( = ?auto_26950 ?auto_26928 ) ) ( not ( = ?auto_26950 ?auto_26937 ) ) ( not ( = ?auto_26950 ?auto_26927 ) ) ( not ( = ?auto_26950 ?auto_26940 ) ) ( not ( = ?auto_26938 ?auto_26943 ) ) ( not ( = ?auto_26938 ?auto_26947 ) ) ( not ( = ?auto_26938 ?auto_26942 ) ) ( not ( = ?auto_26938 ?auto_26932 ) ) ( not ( = ?auto_26938 ?auto_26925 ) ) ( not ( = ?auto_26938 ?auto_26958 ) ) ( not ( = ?auto_26938 ?auto_26936 ) ) ( not ( = ?auto_26938 ?auto_26949 ) ) ( not ( = ?auto_26944 ?auto_26941 ) ) ( not ( = ?auto_26944 ?auto_26948 ) ) ( not ( = ?auto_26944 ?auto_26934 ) ) ( not ( = ?auto_26944 ?auto_26935 ) ) ( not ( = ?auto_26944 ?auto_26956 ) ) ( not ( = ?auto_26944 ?auto_26931 ) ) ( not ( = ?auto_26944 ?auto_26946 ) ) ( not ( = ?auto_26944 ?auto_26952 ) ) ( not ( = ?auto_26944 ?auto_26926 ) ) ( not ( = ?auto_26944 ?auto_26960 ) ) ( not ( = ?auto_26903 ?auto_26915 ) ) ( not ( = ?auto_26903 ?auto_26954 ) ) ( not ( = ?auto_26904 ?auto_26915 ) ) ( not ( = ?auto_26904 ?auto_26954 ) ) ( not ( = ?auto_26905 ?auto_26915 ) ) ( not ( = ?auto_26905 ?auto_26954 ) ) ( not ( = ?auto_26906 ?auto_26915 ) ) ( not ( = ?auto_26906 ?auto_26954 ) ) ( not ( = ?auto_26907 ?auto_26915 ) ) ( not ( = ?auto_26907 ?auto_26954 ) ) ( not ( = ?auto_26908 ?auto_26915 ) ) ( not ( = ?auto_26908 ?auto_26954 ) ) ( not ( = ?auto_26909 ?auto_26915 ) ) ( not ( = ?auto_26909 ?auto_26954 ) ) ( not ( = ?auto_26910 ?auto_26915 ) ) ( not ( = ?auto_26910 ?auto_26954 ) ) ( not ( = ?auto_26911 ?auto_26915 ) ) ( not ( = ?auto_26911 ?auto_26954 ) ) ( not ( = ?auto_26912 ?auto_26915 ) ) ( not ( = ?auto_26912 ?auto_26954 ) ) ( not ( = ?auto_26913 ?auto_26915 ) ) ( not ( = ?auto_26913 ?auto_26954 ) ) ( not ( = ?auto_26915 ?auto_26944 ) ) ( not ( = ?auto_26915 ?auto_26941 ) ) ( not ( = ?auto_26915 ?auto_26948 ) ) ( not ( = ?auto_26915 ?auto_26934 ) ) ( not ( = ?auto_26915 ?auto_26935 ) ) ( not ( = ?auto_26915 ?auto_26956 ) ) ( not ( = ?auto_26915 ?auto_26931 ) ) ( not ( = ?auto_26915 ?auto_26946 ) ) ( not ( = ?auto_26915 ?auto_26952 ) ) ( not ( = ?auto_26915 ?auto_26926 ) ) ( not ( = ?auto_26915 ?auto_26960 ) ) ( not ( = ?auto_26945 ?auto_26950 ) ) ( not ( = ?auto_26945 ?auto_26951 ) ) ( not ( = ?auto_26945 ?auto_26929 ) ) ( not ( = ?auto_26945 ?auto_26953 ) ) ( not ( = ?auto_26945 ?auto_26939 ) ) ( not ( = ?auto_26945 ?auto_26928 ) ) ( not ( = ?auto_26945 ?auto_26937 ) ) ( not ( = ?auto_26945 ?auto_26927 ) ) ( not ( = ?auto_26945 ?auto_26940 ) ) ( not ( = ?auto_26957 ?auto_26938 ) ) ( not ( = ?auto_26957 ?auto_26943 ) ) ( not ( = ?auto_26957 ?auto_26947 ) ) ( not ( = ?auto_26957 ?auto_26942 ) ) ( not ( = ?auto_26957 ?auto_26932 ) ) ( not ( = ?auto_26957 ?auto_26925 ) ) ( not ( = ?auto_26957 ?auto_26958 ) ) ( not ( = ?auto_26957 ?auto_26936 ) ) ( not ( = ?auto_26957 ?auto_26949 ) ) ( not ( = ?auto_26954 ?auto_26944 ) ) ( not ( = ?auto_26954 ?auto_26941 ) ) ( not ( = ?auto_26954 ?auto_26948 ) ) ( not ( = ?auto_26954 ?auto_26934 ) ) ( not ( = ?auto_26954 ?auto_26935 ) ) ( not ( = ?auto_26954 ?auto_26956 ) ) ( not ( = ?auto_26954 ?auto_26931 ) ) ( not ( = ?auto_26954 ?auto_26946 ) ) ( not ( = ?auto_26954 ?auto_26952 ) ) ( not ( = ?auto_26954 ?auto_26926 ) ) ( not ( = ?auto_26954 ?auto_26960 ) ) ( not ( = ?auto_26903 ?auto_26916 ) ) ( not ( = ?auto_26903 ?auto_26933 ) ) ( not ( = ?auto_26904 ?auto_26916 ) ) ( not ( = ?auto_26904 ?auto_26933 ) ) ( not ( = ?auto_26905 ?auto_26916 ) ) ( not ( = ?auto_26905 ?auto_26933 ) ) ( not ( = ?auto_26906 ?auto_26916 ) ) ( not ( = ?auto_26906 ?auto_26933 ) ) ( not ( = ?auto_26907 ?auto_26916 ) ) ( not ( = ?auto_26907 ?auto_26933 ) ) ( not ( = ?auto_26908 ?auto_26916 ) ) ( not ( = ?auto_26908 ?auto_26933 ) ) ( not ( = ?auto_26909 ?auto_26916 ) ) ( not ( = ?auto_26909 ?auto_26933 ) ) ( not ( = ?auto_26910 ?auto_26916 ) ) ( not ( = ?auto_26910 ?auto_26933 ) ) ( not ( = ?auto_26911 ?auto_26916 ) ) ( not ( = ?auto_26911 ?auto_26933 ) ) ( not ( = ?auto_26912 ?auto_26916 ) ) ( not ( = ?auto_26912 ?auto_26933 ) ) ( not ( = ?auto_26913 ?auto_26916 ) ) ( not ( = ?auto_26913 ?auto_26933 ) ) ( not ( = ?auto_26914 ?auto_26916 ) ) ( not ( = ?auto_26914 ?auto_26933 ) ) ( not ( = ?auto_26916 ?auto_26954 ) ) ( not ( = ?auto_26916 ?auto_26944 ) ) ( not ( = ?auto_26916 ?auto_26941 ) ) ( not ( = ?auto_26916 ?auto_26948 ) ) ( not ( = ?auto_26916 ?auto_26934 ) ) ( not ( = ?auto_26916 ?auto_26935 ) ) ( not ( = ?auto_26916 ?auto_26956 ) ) ( not ( = ?auto_26916 ?auto_26931 ) ) ( not ( = ?auto_26916 ?auto_26946 ) ) ( not ( = ?auto_26916 ?auto_26952 ) ) ( not ( = ?auto_26916 ?auto_26926 ) ) ( not ( = ?auto_26916 ?auto_26960 ) ) ( not ( = ?auto_26959 ?auto_26945 ) ) ( not ( = ?auto_26959 ?auto_26950 ) ) ( not ( = ?auto_26959 ?auto_26951 ) ) ( not ( = ?auto_26959 ?auto_26929 ) ) ( not ( = ?auto_26959 ?auto_26953 ) ) ( not ( = ?auto_26959 ?auto_26939 ) ) ( not ( = ?auto_26959 ?auto_26928 ) ) ( not ( = ?auto_26959 ?auto_26937 ) ) ( not ( = ?auto_26959 ?auto_26927 ) ) ( not ( = ?auto_26959 ?auto_26940 ) ) ( not ( = ?auto_26930 ?auto_26957 ) ) ( not ( = ?auto_26930 ?auto_26938 ) ) ( not ( = ?auto_26930 ?auto_26943 ) ) ( not ( = ?auto_26930 ?auto_26947 ) ) ( not ( = ?auto_26930 ?auto_26942 ) ) ( not ( = ?auto_26930 ?auto_26932 ) ) ( not ( = ?auto_26930 ?auto_26925 ) ) ( not ( = ?auto_26930 ?auto_26958 ) ) ( not ( = ?auto_26930 ?auto_26936 ) ) ( not ( = ?auto_26930 ?auto_26949 ) ) ( not ( = ?auto_26933 ?auto_26954 ) ) ( not ( = ?auto_26933 ?auto_26944 ) ) ( not ( = ?auto_26933 ?auto_26941 ) ) ( not ( = ?auto_26933 ?auto_26948 ) ) ( not ( = ?auto_26933 ?auto_26934 ) ) ( not ( = ?auto_26933 ?auto_26935 ) ) ( not ( = ?auto_26933 ?auto_26956 ) ) ( not ( = ?auto_26933 ?auto_26931 ) ) ( not ( = ?auto_26933 ?auto_26946 ) ) ( not ( = ?auto_26933 ?auto_26952 ) ) ( not ( = ?auto_26933 ?auto_26926 ) ) ( not ( = ?auto_26933 ?auto_26960 ) ) ( not ( = ?auto_26903 ?auto_26918 ) ) ( not ( = ?auto_26903 ?auto_26955 ) ) ( not ( = ?auto_26904 ?auto_26918 ) ) ( not ( = ?auto_26904 ?auto_26955 ) ) ( not ( = ?auto_26905 ?auto_26918 ) ) ( not ( = ?auto_26905 ?auto_26955 ) ) ( not ( = ?auto_26906 ?auto_26918 ) ) ( not ( = ?auto_26906 ?auto_26955 ) ) ( not ( = ?auto_26907 ?auto_26918 ) ) ( not ( = ?auto_26907 ?auto_26955 ) ) ( not ( = ?auto_26908 ?auto_26918 ) ) ( not ( = ?auto_26908 ?auto_26955 ) ) ( not ( = ?auto_26909 ?auto_26918 ) ) ( not ( = ?auto_26909 ?auto_26955 ) ) ( not ( = ?auto_26910 ?auto_26918 ) ) ( not ( = ?auto_26910 ?auto_26955 ) ) ( not ( = ?auto_26911 ?auto_26918 ) ) ( not ( = ?auto_26911 ?auto_26955 ) ) ( not ( = ?auto_26912 ?auto_26918 ) ) ( not ( = ?auto_26912 ?auto_26955 ) ) ( not ( = ?auto_26913 ?auto_26918 ) ) ( not ( = ?auto_26913 ?auto_26955 ) ) ( not ( = ?auto_26914 ?auto_26918 ) ) ( not ( = ?auto_26914 ?auto_26955 ) ) ( not ( = ?auto_26915 ?auto_26918 ) ) ( not ( = ?auto_26915 ?auto_26955 ) ) ( not ( = ?auto_26918 ?auto_26933 ) ) ( not ( = ?auto_26918 ?auto_26954 ) ) ( not ( = ?auto_26918 ?auto_26944 ) ) ( not ( = ?auto_26918 ?auto_26941 ) ) ( not ( = ?auto_26918 ?auto_26948 ) ) ( not ( = ?auto_26918 ?auto_26934 ) ) ( not ( = ?auto_26918 ?auto_26935 ) ) ( not ( = ?auto_26918 ?auto_26956 ) ) ( not ( = ?auto_26918 ?auto_26931 ) ) ( not ( = ?auto_26918 ?auto_26946 ) ) ( not ( = ?auto_26918 ?auto_26952 ) ) ( not ( = ?auto_26918 ?auto_26926 ) ) ( not ( = ?auto_26918 ?auto_26960 ) ) ( not ( = ?auto_26955 ?auto_26933 ) ) ( not ( = ?auto_26955 ?auto_26954 ) ) ( not ( = ?auto_26955 ?auto_26944 ) ) ( not ( = ?auto_26955 ?auto_26941 ) ) ( not ( = ?auto_26955 ?auto_26948 ) ) ( not ( = ?auto_26955 ?auto_26934 ) ) ( not ( = ?auto_26955 ?auto_26935 ) ) ( not ( = ?auto_26955 ?auto_26956 ) ) ( not ( = ?auto_26955 ?auto_26931 ) ) ( not ( = ?auto_26955 ?auto_26946 ) ) ( not ( = ?auto_26955 ?auto_26952 ) ) ( not ( = ?auto_26955 ?auto_26926 ) ) ( not ( = ?auto_26955 ?auto_26960 ) ) ( not ( = ?auto_26903 ?auto_26917 ) ) ( not ( = ?auto_26903 ?auto_26922 ) ) ( not ( = ?auto_26904 ?auto_26917 ) ) ( not ( = ?auto_26904 ?auto_26922 ) ) ( not ( = ?auto_26905 ?auto_26917 ) ) ( not ( = ?auto_26905 ?auto_26922 ) ) ( not ( = ?auto_26906 ?auto_26917 ) ) ( not ( = ?auto_26906 ?auto_26922 ) ) ( not ( = ?auto_26907 ?auto_26917 ) ) ( not ( = ?auto_26907 ?auto_26922 ) ) ( not ( = ?auto_26908 ?auto_26917 ) ) ( not ( = ?auto_26908 ?auto_26922 ) ) ( not ( = ?auto_26909 ?auto_26917 ) ) ( not ( = ?auto_26909 ?auto_26922 ) ) ( not ( = ?auto_26910 ?auto_26917 ) ) ( not ( = ?auto_26910 ?auto_26922 ) ) ( not ( = ?auto_26911 ?auto_26917 ) ) ( not ( = ?auto_26911 ?auto_26922 ) ) ( not ( = ?auto_26912 ?auto_26917 ) ) ( not ( = ?auto_26912 ?auto_26922 ) ) ( not ( = ?auto_26913 ?auto_26917 ) ) ( not ( = ?auto_26913 ?auto_26922 ) ) ( not ( = ?auto_26914 ?auto_26917 ) ) ( not ( = ?auto_26914 ?auto_26922 ) ) ( not ( = ?auto_26915 ?auto_26917 ) ) ( not ( = ?auto_26915 ?auto_26922 ) ) ( not ( = ?auto_26916 ?auto_26917 ) ) ( not ( = ?auto_26916 ?auto_26922 ) ) ( not ( = ?auto_26917 ?auto_26955 ) ) ( not ( = ?auto_26917 ?auto_26933 ) ) ( not ( = ?auto_26917 ?auto_26954 ) ) ( not ( = ?auto_26917 ?auto_26944 ) ) ( not ( = ?auto_26917 ?auto_26941 ) ) ( not ( = ?auto_26917 ?auto_26948 ) ) ( not ( = ?auto_26917 ?auto_26934 ) ) ( not ( = ?auto_26917 ?auto_26935 ) ) ( not ( = ?auto_26917 ?auto_26956 ) ) ( not ( = ?auto_26917 ?auto_26931 ) ) ( not ( = ?auto_26917 ?auto_26946 ) ) ( not ( = ?auto_26917 ?auto_26952 ) ) ( not ( = ?auto_26917 ?auto_26926 ) ) ( not ( = ?auto_26917 ?auto_26960 ) ) ( not ( = ?auto_26923 ?auto_26953 ) ) ( not ( = ?auto_26923 ?auto_26959 ) ) ( not ( = ?auto_26923 ?auto_26945 ) ) ( not ( = ?auto_26923 ?auto_26950 ) ) ( not ( = ?auto_26923 ?auto_26951 ) ) ( not ( = ?auto_26923 ?auto_26929 ) ) ( not ( = ?auto_26923 ?auto_26939 ) ) ( not ( = ?auto_26923 ?auto_26928 ) ) ( not ( = ?auto_26923 ?auto_26937 ) ) ( not ( = ?auto_26923 ?auto_26927 ) ) ( not ( = ?auto_26923 ?auto_26940 ) ) ( not ( = ?auto_26924 ?auto_26942 ) ) ( not ( = ?auto_26924 ?auto_26930 ) ) ( not ( = ?auto_26924 ?auto_26957 ) ) ( not ( = ?auto_26924 ?auto_26938 ) ) ( not ( = ?auto_26924 ?auto_26943 ) ) ( not ( = ?auto_26924 ?auto_26947 ) ) ( not ( = ?auto_26924 ?auto_26932 ) ) ( not ( = ?auto_26924 ?auto_26925 ) ) ( not ( = ?auto_26924 ?auto_26958 ) ) ( not ( = ?auto_26924 ?auto_26936 ) ) ( not ( = ?auto_26924 ?auto_26949 ) ) ( not ( = ?auto_26922 ?auto_26955 ) ) ( not ( = ?auto_26922 ?auto_26933 ) ) ( not ( = ?auto_26922 ?auto_26954 ) ) ( not ( = ?auto_26922 ?auto_26944 ) ) ( not ( = ?auto_26922 ?auto_26941 ) ) ( not ( = ?auto_26922 ?auto_26948 ) ) ( not ( = ?auto_26922 ?auto_26934 ) ) ( not ( = ?auto_26922 ?auto_26935 ) ) ( not ( = ?auto_26922 ?auto_26956 ) ) ( not ( = ?auto_26922 ?auto_26931 ) ) ( not ( = ?auto_26922 ?auto_26946 ) ) ( not ( = ?auto_26922 ?auto_26952 ) ) ( not ( = ?auto_26922 ?auto_26926 ) ) ( not ( = ?auto_26922 ?auto_26960 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_26903 ?auto_26904 ?auto_26905 ?auto_26906 ?auto_26907 ?auto_26908 ?auto_26909 ?auto_26910 ?auto_26911 ?auto_26912 ?auto_26913 ?auto_26914 ?auto_26915 ?auto_26916 ?auto_26918 )
      ( MAKE-1CRATE ?auto_26918 ?auto_26917 )
      ( MAKE-15CRATE-VERIFY ?auto_26903 ?auto_26904 ?auto_26905 ?auto_26906 ?auto_26907 ?auto_26908 ?auto_26909 ?auto_26910 ?auto_26911 ?auto_26912 ?auto_26913 ?auto_26914 ?auto_26915 ?auto_26916 ?auto_26918 ?auto_26917 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_26988 - SURFACE
      ?auto_26989 - SURFACE
      ?auto_26990 - SURFACE
      ?auto_26991 - SURFACE
      ?auto_26992 - SURFACE
      ?auto_26993 - SURFACE
      ?auto_26994 - SURFACE
      ?auto_26995 - SURFACE
      ?auto_26996 - SURFACE
      ?auto_26997 - SURFACE
      ?auto_26998 - SURFACE
      ?auto_26999 - SURFACE
      ?auto_27000 - SURFACE
      ?auto_27001 - SURFACE
      ?auto_27003 - SURFACE
      ?auto_27002 - SURFACE
      ?auto_27004 - SURFACE
    )
    :vars
    (
      ?auto_27006 - HOIST
      ?auto_27007 - PLACE
      ?auto_27008 - PLACE
      ?auto_27005 - HOIST
      ?auto_27009 - SURFACE
      ?auto_27029 - PLACE
      ?auto_27036 - HOIST
      ?auto_27011 - SURFACE
      ?auto_27046 - PLACE
      ?auto_27032 - HOIST
      ?auto_27043 - SURFACE
      ?auto_27035 - PLACE
      ?auto_27014 - HOIST
      ?auto_27019 - SURFACE
      ?auto_27012 - SURFACE
      ?auto_27028 - PLACE
      ?auto_27038 - HOIST
      ?auto_27020 - SURFACE
      ?auto_27025 - PLACE
      ?auto_27026 - HOIST
      ?auto_27016 - SURFACE
      ?auto_27047 - PLACE
      ?auto_27033 - HOIST
      ?auto_27021 - SURFACE
      ?auto_27022 - SURFACE
      ?auto_27037 - PLACE
      ?auto_27018 - HOIST
      ?auto_27015 - SURFACE
      ?auto_27039 - PLACE
      ?auto_27024 - HOIST
      ?auto_27027 - SURFACE
      ?auto_27044 - PLACE
      ?auto_27013 - HOIST
      ?auto_27045 - SURFACE
      ?auto_27030 - PLACE
      ?auto_27034 - HOIST
      ?auto_27042 - SURFACE
      ?auto_27040 - SURFACE
      ?auto_27017 - SURFACE
      ?auto_27031 - PLACE
      ?auto_27023 - HOIST
      ?auto_27041 - SURFACE
      ?auto_27010 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27006 ?auto_27007 ) ( IS-CRATE ?auto_27004 ) ( not ( = ?auto_27008 ?auto_27007 ) ) ( HOIST-AT ?auto_27005 ?auto_27008 ) ( SURFACE-AT ?auto_27004 ?auto_27008 ) ( ON ?auto_27004 ?auto_27009 ) ( CLEAR ?auto_27004 ) ( not ( = ?auto_27002 ?auto_27004 ) ) ( not ( = ?auto_27002 ?auto_27009 ) ) ( not ( = ?auto_27004 ?auto_27009 ) ) ( not ( = ?auto_27006 ?auto_27005 ) ) ( IS-CRATE ?auto_27002 ) ( not ( = ?auto_27029 ?auto_27007 ) ) ( HOIST-AT ?auto_27036 ?auto_27029 ) ( AVAILABLE ?auto_27036 ) ( SURFACE-AT ?auto_27002 ?auto_27029 ) ( ON ?auto_27002 ?auto_27011 ) ( CLEAR ?auto_27002 ) ( not ( = ?auto_27003 ?auto_27002 ) ) ( not ( = ?auto_27003 ?auto_27011 ) ) ( not ( = ?auto_27002 ?auto_27011 ) ) ( not ( = ?auto_27006 ?auto_27036 ) ) ( IS-CRATE ?auto_27003 ) ( not ( = ?auto_27046 ?auto_27007 ) ) ( HOIST-AT ?auto_27032 ?auto_27046 ) ( SURFACE-AT ?auto_27003 ?auto_27046 ) ( ON ?auto_27003 ?auto_27043 ) ( CLEAR ?auto_27003 ) ( not ( = ?auto_27001 ?auto_27003 ) ) ( not ( = ?auto_27001 ?auto_27043 ) ) ( not ( = ?auto_27003 ?auto_27043 ) ) ( not ( = ?auto_27006 ?auto_27032 ) ) ( IS-CRATE ?auto_27001 ) ( not ( = ?auto_27035 ?auto_27007 ) ) ( HOIST-AT ?auto_27014 ?auto_27035 ) ( AVAILABLE ?auto_27014 ) ( SURFACE-AT ?auto_27001 ?auto_27035 ) ( ON ?auto_27001 ?auto_27019 ) ( CLEAR ?auto_27001 ) ( not ( = ?auto_27000 ?auto_27001 ) ) ( not ( = ?auto_27000 ?auto_27019 ) ) ( not ( = ?auto_27001 ?auto_27019 ) ) ( not ( = ?auto_27006 ?auto_27014 ) ) ( IS-CRATE ?auto_27000 ) ( AVAILABLE ?auto_27005 ) ( SURFACE-AT ?auto_27000 ?auto_27008 ) ( ON ?auto_27000 ?auto_27012 ) ( CLEAR ?auto_27000 ) ( not ( = ?auto_26999 ?auto_27000 ) ) ( not ( = ?auto_26999 ?auto_27012 ) ) ( not ( = ?auto_27000 ?auto_27012 ) ) ( IS-CRATE ?auto_26999 ) ( not ( = ?auto_27028 ?auto_27007 ) ) ( HOIST-AT ?auto_27038 ?auto_27028 ) ( AVAILABLE ?auto_27038 ) ( SURFACE-AT ?auto_26999 ?auto_27028 ) ( ON ?auto_26999 ?auto_27020 ) ( CLEAR ?auto_26999 ) ( not ( = ?auto_26998 ?auto_26999 ) ) ( not ( = ?auto_26998 ?auto_27020 ) ) ( not ( = ?auto_26999 ?auto_27020 ) ) ( not ( = ?auto_27006 ?auto_27038 ) ) ( IS-CRATE ?auto_26998 ) ( not ( = ?auto_27025 ?auto_27007 ) ) ( HOIST-AT ?auto_27026 ?auto_27025 ) ( AVAILABLE ?auto_27026 ) ( SURFACE-AT ?auto_26998 ?auto_27025 ) ( ON ?auto_26998 ?auto_27016 ) ( CLEAR ?auto_26998 ) ( not ( = ?auto_26997 ?auto_26998 ) ) ( not ( = ?auto_26997 ?auto_27016 ) ) ( not ( = ?auto_26998 ?auto_27016 ) ) ( not ( = ?auto_27006 ?auto_27026 ) ) ( IS-CRATE ?auto_26997 ) ( not ( = ?auto_27047 ?auto_27007 ) ) ( HOIST-AT ?auto_27033 ?auto_27047 ) ( SURFACE-AT ?auto_26997 ?auto_27047 ) ( ON ?auto_26997 ?auto_27021 ) ( CLEAR ?auto_26997 ) ( not ( = ?auto_26996 ?auto_26997 ) ) ( not ( = ?auto_26996 ?auto_27021 ) ) ( not ( = ?auto_26997 ?auto_27021 ) ) ( not ( = ?auto_27006 ?auto_27033 ) ) ( IS-CRATE ?auto_26996 ) ( SURFACE-AT ?auto_26996 ?auto_27046 ) ( ON ?auto_26996 ?auto_27022 ) ( CLEAR ?auto_26996 ) ( not ( = ?auto_26995 ?auto_26996 ) ) ( not ( = ?auto_26995 ?auto_27022 ) ) ( not ( = ?auto_26996 ?auto_27022 ) ) ( IS-CRATE ?auto_26995 ) ( not ( = ?auto_27037 ?auto_27007 ) ) ( HOIST-AT ?auto_27018 ?auto_27037 ) ( AVAILABLE ?auto_27018 ) ( SURFACE-AT ?auto_26995 ?auto_27037 ) ( ON ?auto_26995 ?auto_27015 ) ( CLEAR ?auto_26995 ) ( not ( = ?auto_26994 ?auto_26995 ) ) ( not ( = ?auto_26994 ?auto_27015 ) ) ( not ( = ?auto_26995 ?auto_27015 ) ) ( not ( = ?auto_27006 ?auto_27018 ) ) ( IS-CRATE ?auto_26994 ) ( not ( = ?auto_27039 ?auto_27007 ) ) ( HOIST-AT ?auto_27024 ?auto_27039 ) ( AVAILABLE ?auto_27024 ) ( SURFACE-AT ?auto_26994 ?auto_27039 ) ( ON ?auto_26994 ?auto_27027 ) ( CLEAR ?auto_26994 ) ( not ( = ?auto_26993 ?auto_26994 ) ) ( not ( = ?auto_26993 ?auto_27027 ) ) ( not ( = ?auto_26994 ?auto_27027 ) ) ( not ( = ?auto_27006 ?auto_27024 ) ) ( IS-CRATE ?auto_26993 ) ( not ( = ?auto_27044 ?auto_27007 ) ) ( HOIST-AT ?auto_27013 ?auto_27044 ) ( AVAILABLE ?auto_27013 ) ( SURFACE-AT ?auto_26993 ?auto_27044 ) ( ON ?auto_26993 ?auto_27045 ) ( CLEAR ?auto_26993 ) ( not ( = ?auto_26992 ?auto_26993 ) ) ( not ( = ?auto_26992 ?auto_27045 ) ) ( not ( = ?auto_26993 ?auto_27045 ) ) ( not ( = ?auto_27006 ?auto_27013 ) ) ( IS-CRATE ?auto_26992 ) ( not ( = ?auto_27030 ?auto_27007 ) ) ( HOIST-AT ?auto_27034 ?auto_27030 ) ( AVAILABLE ?auto_27034 ) ( SURFACE-AT ?auto_26992 ?auto_27030 ) ( ON ?auto_26992 ?auto_27042 ) ( CLEAR ?auto_26992 ) ( not ( = ?auto_26991 ?auto_26992 ) ) ( not ( = ?auto_26991 ?auto_27042 ) ) ( not ( = ?auto_26992 ?auto_27042 ) ) ( not ( = ?auto_27006 ?auto_27034 ) ) ( IS-CRATE ?auto_26991 ) ( AVAILABLE ?auto_27033 ) ( SURFACE-AT ?auto_26991 ?auto_27047 ) ( ON ?auto_26991 ?auto_27040 ) ( CLEAR ?auto_26991 ) ( not ( = ?auto_26990 ?auto_26991 ) ) ( not ( = ?auto_26990 ?auto_27040 ) ) ( not ( = ?auto_26991 ?auto_27040 ) ) ( IS-CRATE ?auto_26990 ) ( AVAILABLE ?auto_27032 ) ( SURFACE-AT ?auto_26990 ?auto_27046 ) ( ON ?auto_26990 ?auto_27017 ) ( CLEAR ?auto_26990 ) ( not ( = ?auto_26989 ?auto_26990 ) ) ( not ( = ?auto_26989 ?auto_27017 ) ) ( not ( = ?auto_26990 ?auto_27017 ) ) ( SURFACE-AT ?auto_26988 ?auto_27007 ) ( CLEAR ?auto_26988 ) ( IS-CRATE ?auto_26989 ) ( AVAILABLE ?auto_27006 ) ( not ( = ?auto_27031 ?auto_27007 ) ) ( HOIST-AT ?auto_27023 ?auto_27031 ) ( AVAILABLE ?auto_27023 ) ( SURFACE-AT ?auto_26989 ?auto_27031 ) ( ON ?auto_26989 ?auto_27041 ) ( CLEAR ?auto_26989 ) ( TRUCK-AT ?auto_27010 ?auto_27007 ) ( not ( = ?auto_26988 ?auto_26989 ) ) ( not ( = ?auto_26988 ?auto_27041 ) ) ( not ( = ?auto_26989 ?auto_27041 ) ) ( not ( = ?auto_27006 ?auto_27023 ) ) ( not ( = ?auto_26988 ?auto_26990 ) ) ( not ( = ?auto_26988 ?auto_27017 ) ) ( not ( = ?auto_26990 ?auto_27041 ) ) ( not ( = ?auto_27046 ?auto_27031 ) ) ( not ( = ?auto_27032 ?auto_27023 ) ) ( not ( = ?auto_27017 ?auto_27041 ) ) ( not ( = ?auto_26988 ?auto_26991 ) ) ( not ( = ?auto_26988 ?auto_27040 ) ) ( not ( = ?auto_26989 ?auto_26991 ) ) ( not ( = ?auto_26989 ?auto_27040 ) ) ( not ( = ?auto_26991 ?auto_27017 ) ) ( not ( = ?auto_26991 ?auto_27041 ) ) ( not ( = ?auto_27047 ?auto_27046 ) ) ( not ( = ?auto_27047 ?auto_27031 ) ) ( not ( = ?auto_27033 ?auto_27032 ) ) ( not ( = ?auto_27033 ?auto_27023 ) ) ( not ( = ?auto_27040 ?auto_27017 ) ) ( not ( = ?auto_27040 ?auto_27041 ) ) ( not ( = ?auto_26988 ?auto_26992 ) ) ( not ( = ?auto_26988 ?auto_27042 ) ) ( not ( = ?auto_26989 ?auto_26992 ) ) ( not ( = ?auto_26989 ?auto_27042 ) ) ( not ( = ?auto_26990 ?auto_26992 ) ) ( not ( = ?auto_26990 ?auto_27042 ) ) ( not ( = ?auto_26992 ?auto_27040 ) ) ( not ( = ?auto_26992 ?auto_27017 ) ) ( not ( = ?auto_26992 ?auto_27041 ) ) ( not ( = ?auto_27030 ?auto_27047 ) ) ( not ( = ?auto_27030 ?auto_27046 ) ) ( not ( = ?auto_27030 ?auto_27031 ) ) ( not ( = ?auto_27034 ?auto_27033 ) ) ( not ( = ?auto_27034 ?auto_27032 ) ) ( not ( = ?auto_27034 ?auto_27023 ) ) ( not ( = ?auto_27042 ?auto_27040 ) ) ( not ( = ?auto_27042 ?auto_27017 ) ) ( not ( = ?auto_27042 ?auto_27041 ) ) ( not ( = ?auto_26988 ?auto_26993 ) ) ( not ( = ?auto_26988 ?auto_27045 ) ) ( not ( = ?auto_26989 ?auto_26993 ) ) ( not ( = ?auto_26989 ?auto_27045 ) ) ( not ( = ?auto_26990 ?auto_26993 ) ) ( not ( = ?auto_26990 ?auto_27045 ) ) ( not ( = ?auto_26991 ?auto_26993 ) ) ( not ( = ?auto_26991 ?auto_27045 ) ) ( not ( = ?auto_26993 ?auto_27042 ) ) ( not ( = ?auto_26993 ?auto_27040 ) ) ( not ( = ?auto_26993 ?auto_27017 ) ) ( not ( = ?auto_26993 ?auto_27041 ) ) ( not ( = ?auto_27044 ?auto_27030 ) ) ( not ( = ?auto_27044 ?auto_27047 ) ) ( not ( = ?auto_27044 ?auto_27046 ) ) ( not ( = ?auto_27044 ?auto_27031 ) ) ( not ( = ?auto_27013 ?auto_27034 ) ) ( not ( = ?auto_27013 ?auto_27033 ) ) ( not ( = ?auto_27013 ?auto_27032 ) ) ( not ( = ?auto_27013 ?auto_27023 ) ) ( not ( = ?auto_27045 ?auto_27042 ) ) ( not ( = ?auto_27045 ?auto_27040 ) ) ( not ( = ?auto_27045 ?auto_27017 ) ) ( not ( = ?auto_27045 ?auto_27041 ) ) ( not ( = ?auto_26988 ?auto_26994 ) ) ( not ( = ?auto_26988 ?auto_27027 ) ) ( not ( = ?auto_26989 ?auto_26994 ) ) ( not ( = ?auto_26989 ?auto_27027 ) ) ( not ( = ?auto_26990 ?auto_26994 ) ) ( not ( = ?auto_26990 ?auto_27027 ) ) ( not ( = ?auto_26991 ?auto_26994 ) ) ( not ( = ?auto_26991 ?auto_27027 ) ) ( not ( = ?auto_26992 ?auto_26994 ) ) ( not ( = ?auto_26992 ?auto_27027 ) ) ( not ( = ?auto_26994 ?auto_27045 ) ) ( not ( = ?auto_26994 ?auto_27042 ) ) ( not ( = ?auto_26994 ?auto_27040 ) ) ( not ( = ?auto_26994 ?auto_27017 ) ) ( not ( = ?auto_26994 ?auto_27041 ) ) ( not ( = ?auto_27039 ?auto_27044 ) ) ( not ( = ?auto_27039 ?auto_27030 ) ) ( not ( = ?auto_27039 ?auto_27047 ) ) ( not ( = ?auto_27039 ?auto_27046 ) ) ( not ( = ?auto_27039 ?auto_27031 ) ) ( not ( = ?auto_27024 ?auto_27013 ) ) ( not ( = ?auto_27024 ?auto_27034 ) ) ( not ( = ?auto_27024 ?auto_27033 ) ) ( not ( = ?auto_27024 ?auto_27032 ) ) ( not ( = ?auto_27024 ?auto_27023 ) ) ( not ( = ?auto_27027 ?auto_27045 ) ) ( not ( = ?auto_27027 ?auto_27042 ) ) ( not ( = ?auto_27027 ?auto_27040 ) ) ( not ( = ?auto_27027 ?auto_27017 ) ) ( not ( = ?auto_27027 ?auto_27041 ) ) ( not ( = ?auto_26988 ?auto_26995 ) ) ( not ( = ?auto_26988 ?auto_27015 ) ) ( not ( = ?auto_26989 ?auto_26995 ) ) ( not ( = ?auto_26989 ?auto_27015 ) ) ( not ( = ?auto_26990 ?auto_26995 ) ) ( not ( = ?auto_26990 ?auto_27015 ) ) ( not ( = ?auto_26991 ?auto_26995 ) ) ( not ( = ?auto_26991 ?auto_27015 ) ) ( not ( = ?auto_26992 ?auto_26995 ) ) ( not ( = ?auto_26992 ?auto_27015 ) ) ( not ( = ?auto_26993 ?auto_26995 ) ) ( not ( = ?auto_26993 ?auto_27015 ) ) ( not ( = ?auto_26995 ?auto_27027 ) ) ( not ( = ?auto_26995 ?auto_27045 ) ) ( not ( = ?auto_26995 ?auto_27042 ) ) ( not ( = ?auto_26995 ?auto_27040 ) ) ( not ( = ?auto_26995 ?auto_27017 ) ) ( not ( = ?auto_26995 ?auto_27041 ) ) ( not ( = ?auto_27037 ?auto_27039 ) ) ( not ( = ?auto_27037 ?auto_27044 ) ) ( not ( = ?auto_27037 ?auto_27030 ) ) ( not ( = ?auto_27037 ?auto_27047 ) ) ( not ( = ?auto_27037 ?auto_27046 ) ) ( not ( = ?auto_27037 ?auto_27031 ) ) ( not ( = ?auto_27018 ?auto_27024 ) ) ( not ( = ?auto_27018 ?auto_27013 ) ) ( not ( = ?auto_27018 ?auto_27034 ) ) ( not ( = ?auto_27018 ?auto_27033 ) ) ( not ( = ?auto_27018 ?auto_27032 ) ) ( not ( = ?auto_27018 ?auto_27023 ) ) ( not ( = ?auto_27015 ?auto_27027 ) ) ( not ( = ?auto_27015 ?auto_27045 ) ) ( not ( = ?auto_27015 ?auto_27042 ) ) ( not ( = ?auto_27015 ?auto_27040 ) ) ( not ( = ?auto_27015 ?auto_27017 ) ) ( not ( = ?auto_27015 ?auto_27041 ) ) ( not ( = ?auto_26988 ?auto_26996 ) ) ( not ( = ?auto_26988 ?auto_27022 ) ) ( not ( = ?auto_26989 ?auto_26996 ) ) ( not ( = ?auto_26989 ?auto_27022 ) ) ( not ( = ?auto_26990 ?auto_26996 ) ) ( not ( = ?auto_26990 ?auto_27022 ) ) ( not ( = ?auto_26991 ?auto_26996 ) ) ( not ( = ?auto_26991 ?auto_27022 ) ) ( not ( = ?auto_26992 ?auto_26996 ) ) ( not ( = ?auto_26992 ?auto_27022 ) ) ( not ( = ?auto_26993 ?auto_26996 ) ) ( not ( = ?auto_26993 ?auto_27022 ) ) ( not ( = ?auto_26994 ?auto_26996 ) ) ( not ( = ?auto_26994 ?auto_27022 ) ) ( not ( = ?auto_26996 ?auto_27015 ) ) ( not ( = ?auto_26996 ?auto_27027 ) ) ( not ( = ?auto_26996 ?auto_27045 ) ) ( not ( = ?auto_26996 ?auto_27042 ) ) ( not ( = ?auto_26996 ?auto_27040 ) ) ( not ( = ?auto_26996 ?auto_27017 ) ) ( not ( = ?auto_26996 ?auto_27041 ) ) ( not ( = ?auto_27022 ?auto_27015 ) ) ( not ( = ?auto_27022 ?auto_27027 ) ) ( not ( = ?auto_27022 ?auto_27045 ) ) ( not ( = ?auto_27022 ?auto_27042 ) ) ( not ( = ?auto_27022 ?auto_27040 ) ) ( not ( = ?auto_27022 ?auto_27017 ) ) ( not ( = ?auto_27022 ?auto_27041 ) ) ( not ( = ?auto_26988 ?auto_26997 ) ) ( not ( = ?auto_26988 ?auto_27021 ) ) ( not ( = ?auto_26989 ?auto_26997 ) ) ( not ( = ?auto_26989 ?auto_27021 ) ) ( not ( = ?auto_26990 ?auto_26997 ) ) ( not ( = ?auto_26990 ?auto_27021 ) ) ( not ( = ?auto_26991 ?auto_26997 ) ) ( not ( = ?auto_26991 ?auto_27021 ) ) ( not ( = ?auto_26992 ?auto_26997 ) ) ( not ( = ?auto_26992 ?auto_27021 ) ) ( not ( = ?auto_26993 ?auto_26997 ) ) ( not ( = ?auto_26993 ?auto_27021 ) ) ( not ( = ?auto_26994 ?auto_26997 ) ) ( not ( = ?auto_26994 ?auto_27021 ) ) ( not ( = ?auto_26995 ?auto_26997 ) ) ( not ( = ?auto_26995 ?auto_27021 ) ) ( not ( = ?auto_26997 ?auto_27022 ) ) ( not ( = ?auto_26997 ?auto_27015 ) ) ( not ( = ?auto_26997 ?auto_27027 ) ) ( not ( = ?auto_26997 ?auto_27045 ) ) ( not ( = ?auto_26997 ?auto_27042 ) ) ( not ( = ?auto_26997 ?auto_27040 ) ) ( not ( = ?auto_26997 ?auto_27017 ) ) ( not ( = ?auto_26997 ?auto_27041 ) ) ( not ( = ?auto_27021 ?auto_27022 ) ) ( not ( = ?auto_27021 ?auto_27015 ) ) ( not ( = ?auto_27021 ?auto_27027 ) ) ( not ( = ?auto_27021 ?auto_27045 ) ) ( not ( = ?auto_27021 ?auto_27042 ) ) ( not ( = ?auto_27021 ?auto_27040 ) ) ( not ( = ?auto_27021 ?auto_27017 ) ) ( not ( = ?auto_27021 ?auto_27041 ) ) ( not ( = ?auto_26988 ?auto_26998 ) ) ( not ( = ?auto_26988 ?auto_27016 ) ) ( not ( = ?auto_26989 ?auto_26998 ) ) ( not ( = ?auto_26989 ?auto_27016 ) ) ( not ( = ?auto_26990 ?auto_26998 ) ) ( not ( = ?auto_26990 ?auto_27016 ) ) ( not ( = ?auto_26991 ?auto_26998 ) ) ( not ( = ?auto_26991 ?auto_27016 ) ) ( not ( = ?auto_26992 ?auto_26998 ) ) ( not ( = ?auto_26992 ?auto_27016 ) ) ( not ( = ?auto_26993 ?auto_26998 ) ) ( not ( = ?auto_26993 ?auto_27016 ) ) ( not ( = ?auto_26994 ?auto_26998 ) ) ( not ( = ?auto_26994 ?auto_27016 ) ) ( not ( = ?auto_26995 ?auto_26998 ) ) ( not ( = ?auto_26995 ?auto_27016 ) ) ( not ( = ?auto_26996 ?auto_26998 ) ) ( not ( = ?auto_26996 ?auto_27016 ) ) ( not ( = ?auto_26998 ?auto_27021 ) ) ( not ( = ?auto_26998 ?auto_27022 ) ) ( not ( = ?auto_26998 ?auto_27015 ) ) ( not ( = ?auto_26998 ?auto_27027 ) ) ( not ( = ?auto_26998 ?auto_27045 ) ) ( not ( = ?auto_26998 ?auto_27042 ) ) ( not ( = ?auto_26998 ?auto_27040 ) ) ( not ( = ?auto_26998 ?auto_27017 ) ) ( not ( = ?auto_26998 ?auto_27041 ) ) ( not ( = ?auto_27025 ?auto_27047 ) ) ( not ( = ?auto_27025 ?auto_27046 ) ) ( not ( = ?auto_27025 ?auto_27037 ) ) ( not ( = ?auto_27025 ?auto_27039 ) ) ( not ( = ?auto_27025 ?auto_27044 ) ) ( not ( = ?auto_27025 ?auto_27030 ) ) ( not ( = ?auto_27025 ?auto_27031 ) ) ( not ( = ?auto_27026 ?auto_27033 ) ) ( not ( = ?auto_27026 ?auto_27032 ) ) ( not ( = ?auto_27026 ?auto_27018 ) ) ( not ( = ?auto_27026 ?auto_27024 ) ) ( not ( = ?auto_27026 ?auto_27013 ) ) ( not ( = ?auto_27026 ?auto_27034 ) ) ( not ( = ?auto_27026 ?auto_27023 ) ) ( not ( = ?auto_27016 ?auto_27021 ) ) ( not ( = ?auto_27016 ?auto_27022 ) ) ( not ( = ?auto_27016 ?auto_27015 ) ) ( not ( = ?auto_27016 ?auto_27027 ) ) ( not ( = ?auto_27016 ?auto_27045 ) ) ( not ( = ?auto_27016 ?auto_27042 ) ) ( not ( = ?auto_27016 ?auto_27040 ) ) ( not ( = ?auto_27016 ?auto_27017 ) ) ( not ( = ?auto_27016 ?auto_27041 ) ) ( not ( = ?auto_26988 ?auto_26999 ) ) ( not ( = ?auto_26988 ?auto_27020 ) ) ( not ( = ?auto_26989 ?auto_26999 ) ) ( not ( = ?auto_26989 ?auto_27020 ) ) ( not ( = ?auto_26990 ?auto_26999 ) ) ( not ( = ?auto_26990 ?auto_27020 ) ) ( not ( = ?auto_26991 ?auto_26999 ) ) ( not ( = ?auto_26991 ?auto_27020 ) ) ( not ( = ?auto_26992 ?auto_26999 ) ) ( not ( = ?auto_26992 ?auto_27020 ) ) ( not ( = ?auto_26993 ?auto_26999 ) ) ( not ( = ?auto_26993 ?auto_27020 ) ) ( not ( = ?auto_26994 ?auto_26999 ) ) ( not ( = ?auto_26994 ?auto_27020 ) ) ( not ( = ?auto_26995 ?auto_26999 ) ) ( not ( = ?auto_26995 ?auto_27020 ) ) ( not ( = ?auto_26996 ?auto_26999 ) ) ( not ( = ?auto_26996 ?auto_27020 ) ) ( not ( = ?auto_26997 ?auto_26999 ) ) ( not ( = ?auto_26997 ?auto_27020 ) ) ( not ( = ?auto_26999 ?auto_27016 ) ) ( not ( = ?auto_26999 ?auto_27021 ) ) ( not ( = ?auto_26999 ?auto_27022 ) ) ( not ( = ?auto_26999 ?auto_27015 ) ) ( not ( = ?auto_26999 ?auto_27027 ) ) ( not ( = ?auto_26999 ?auto_27045 ) ) ( not ( = ?auto_26999 ?auto_27042 ) ) ( not ( = ?auto_26999 ?auto_27040 ) ) ( not ( = ?auto_26999 ?auto_27017 ) ) ( not ( = ?auto_26999 ?auto_27041 ) ) ( not ( = ?auto_27028 ?auto_27025 ) ) ( not ( = ?auto_27028 ?auto_27047 ) ) ( not ( = ?auto_27028 ?auto_27046 ) ) ( not ( = ?auto_27028 ?auto_27037 ) ) ( not ( = ?auto_27028 ?auto_27039 ) ) ( not ( = ?auto_27028 ?auto_27044 ) ) ( not ( = ?auto_27028 ?auto_27030 ) ) ( not ( = ?auto_27028 ?auto_27031 ) ) ( not ( = ?auto_27038 ?auto_27026 ) ) ( not ( = ?auto_27038 ?auto_27033 ) ) ( not ( = ?auto_27038 ?auto_27032 ) ) ( not ( = ?auto_27038 ?auto_27018 ) ) ( not ( = ?auto_27038 ?auto_27024 ) ) ( not ( = ?auto_27038 ?auto_27013 ) ) ( not ( = ?auto_27038 ?auto_27034 ) ) ( not ( = ?auto_27038 ?auto_27023 ) ) ( not ( = ?auto_27020 ?auto_27016 ) ) ( not ( = ?auto_27020 ?auto_27021 ) ) ( not ( = ?auto_27020 ?auto_27022 ) ) ( not ( = ?auto_27020 ?auto_27015 ) ) ( not ( = ?auto_27020 ?auto_27027 ) ) ( not ( = ?auto_27020 ?auto_27045 ) ) ( not ( = ?auto_27020 ?auto_27042 ) ) ( not ( = ?auto_27020 ?auto_27040 ) ) ( not ( = ?auto_27020 ?auto_27017 ) ) ( not ( = ?auto_27020 ?auto_27041 ) ) ( not ( = ?auto_26988 ?auto_27000 ) ) ( not ( = ?auto_26988 ?auto_27012 ) ) ( not ( = ?auto_26989 ?auto_27000 ) ) ( not ( = ?auto_26989 ?auto_27012 ) ) ( not ( = ?auto_26990 ?auto_27000 ) ) ( not ( = ?auto_26990 ?auto_27012 ) ) ( not ( = ?auto_26991 ?auto_27000 ) ) ( not ( = ?auto_26991 ?auto_27012 ) ) ( not ( = ?auto_26992 ?auto_27000 ) ) ( not ( = ?auto_26992 ?auto_27012 ) ) ( not ( = ?auto_26993 ?auto_27000 ) ) ( not ( = ?auto_26993 ?auto_27012 ) ) ( not ( = ?auto_26994 ?auto_27000 ) ) ( not ( = ?auto_26994 ?auto_27012 ) ) ( not ( = ?auto_26995 ?auto_27000 ) ) ( not ( = ?auto_26995 ?auto_27012 ) ) ( not ( = ?auto_26996 ?auto_27000 ) ) ( not ( = ?auto_26996 ?auto_27012 ) ) ( not ( = ?auto_26997 ?auto_27000 ) ) ( not ( = ?auto_26997 ?auto_27012 ) ) ( not ( = ?auto_26998 ?auto_27000 ) ) ( not ( = ?auto_26998 ?auto_27012 ) ) ( not ( = ?auto_27000 ?auto_27020 ) ) ( not ( = ?auto_27000 ?auto_27016 ) ) ( not ( = ?auto_27000 ?auto_27021 ) ) ( not ( = ?auto_27000 ?auto_27022 ) ) ( not ( = ?auto_27000 ?auto_27015 ) ) ( not ( = ?auto_27000 ?auto_27027 ) ) ( not ( = ?auto_27000 ?auto_27045 ) ) ( not ( = ?auto_27000 ?auto_27042 ) ) ( not ( = ?auto_27000 ?auto_27040 ) ) ( not ( = ?auto_27000 ?auto_27017 ) ) ( not ( = ?auto_27000 ?auto_27041 ) ) ( not ( = ?auto_27008 ?auto_27028 ) ) ( not ( = ?auto_27008 ?auto_27025 ) ) ( not ( = ?auto_27008 ?auto_27047 ) ) ( not ( = ?auto_27008 ?auto_27046 ) ) ( not ( = ?auto_27008 ?auto_27037 ) ) ( not ( = ?auto_27008 ?auto_27039 ) ) ( not ( = ?auto_27008 ?auto_27044 ) ) ( not ( = ?auto_27008 ?auto_27030 ) ) ( not ( = ?auto_27008 ?auto_27031 ) ) ( not ( = ?auto_27005 ?auto_27038 ) ) ( not ( = ?auto_27005 ?auto_27026 ) ) ( not ( = ?auto_27005 ?auto_27033 ) ) ( not ( = ?auto_27005 ?auto_27032 ) ) ( not ( = ?auto_27005 ?auto_27018 ) ) ( not ( = ?auto_27005 ?auto_27024 ) ) ( not ( = ?auto_27005 ?auto_27013 ) ) ( not ( = ?auto_27005 ?auto_27034 ) ) ( not ( = ?auto_27005 ?auto_27023 ) ) ( not ( = ?auto_27012 ?auto_27020 ) ) ( not ( = ?auto_27012 ?auto_27016 ) ) ( not ( = ?auto_27012 ?auto_27021 ) ) ( not ( = ?auto_27012 ?auto_27022 ) ) ( not ( = ?auto_27012 ?auto_27015 ) ) ( not ( = ?auto_27012 ?auto_27027 ) ) ( not ( = ?auto_27012 ?auto_27045 ) ) ( not ( = ?auto_27012 ?auto_27042 ) ) ( not ( = ?auto_27012 ?auto_27040 ) ) ( not ( = ?auto_27012 ?auto_27017 ) ) ( not ( = ?auto_27012 ?auto_27041 ) ) ( not ( = ?auto_26988 ?auto_27001 ) ) ( not ( = ?auto_26988 ?auto_27019 ) ) ( not ( = ?auto_26989 ?auto_27001 ) ) ( not ( = ?auto_26989 ?auto_27019 ) ) ( not ( = ?auto_26990 ?auto_27001 ) ) ( not ( = ?auto_26990 ?auto_27019 ) ) ( not ( = ?auto_26991 ?auto_27001 ) ) ( not ( = ?auto_26991 ?auto_27019 ) ) ( not ( = ?auto_26992 ?auto_27001 ) ) ( not ( = ?auto_26992 ?auto_27019 ) ) ( not ( = ?auto_26993 ?auto_27001 ) ) ( not ( = ?auto_26993 ?auto_27019 ) ) ( not ( = ?auto_26994 ?auto_27001 ) ) ( not ( = ?auto_26994 ?auto_27019 ) ) ( not ( = ?auto_26995 ?auto_27001 ) ) ( not ( = ?auto_26995 ?auto_27019 ) ) ( not ( = ?auto_26996 ?auto_27001 ) ) ( not ( = ?auto_26996 ?auto_27019 ) ) ( not ( = ?auto_26997 ?auto_27001 ) ) ( not ( = ?auto_26997 ?auto_27019 ) ) ( not ( = ?auto_26998 ?auto_27001 ) ) ( not ( = ?auto_26998 ?auto_27019 ) ) ( not ( = ?auto_26999 ?auto_27001 ) ) ( not ( = ?auto_26999 ?auto_27019 ) ) ( not ( = ?auto_27001 ?auto_27012 ) ) ( not ( = ?auto_27001 ?auto_27020 ) ) ( not ( = ?auto_27001 ?auto_27016 ) ) ( not ( = ?auto_27001 ?auto_27021 ) ) ( not ( = ?auto_27001 ?auto_27022 ) ) ( not ( = ?auto_27001 ?auto_27015 ) ) ( not ( = ?auto_27001 ?auto_27027 ) ) ( not ( = ?auto_27001 ?auto_27045 ) ) ( not ( = ?auto_27001 ?auto_27042 ) ) ( not ( = ?auto_27001 ?auto_27040 ) ) ( not ( = ?auto_27001 ?auto_27017 ) ) ( not ( = ?auto_27001 ?auto_27041 ) ) ( not ( = ?auto_27035 ?auto_27008 ) ) ( not ( = ?auto_27035 ?auto_27028 ) ) ( not ( = ?auto_27035 ?auto_27025 ) ) ( not ( = ?auto_27035 ?auto_27047 ) ) ( not ( = ?auto_27035 ?auto_27046 ) ) ( not ( = ?auto_27035 ?auto_27037 ) ) ( not ( = ?auto_27035 ?auto_27039 ) ) ( not ( = ?auto_27035 ?auto_27044 ) ) ( not ( = ?auto_27035 ?auto_27030 ) ) ( not ( = ?auto_27035 ?auto_27031 ) ) ( not ( = ?auto_27014 ?auto_27005 ) ) ( not ( = ?auto_27014 ?auto_27038 ) ) ( not ( = ?auto_27014 ?auto_27026 ) ) ( not ( = ?auto_27014 ?auto_27033 ) ) ( not ( = ?auto_27014 ?auto_27032 ) ) ( not ( = ?auto_27014 ?auto_27018 ) ) ( not ( = ?auto_27014 ?auto_27024 ) ) ( not ( = ?auto_27014 ?auto_27013 ) ) ( not ( = ?auto_27014 ?auto_27034 ) ) ( not ( = ?auto_27014 ?auto_27023 ) ) ( not ( = ?auto_27019 ?auto_27012 ) ) ( not ( = ?auto_27019 ?auto_27020 ) ) ( not ( = ?auto_27019 ?auto_27016 ) ) ( not ( = ?auto_27019 ?auto_27021 ) ) ( not ( = ?auto_27019 ?auto_27022 ) ) ( not ( = ?auto_27019 ?auto_27015 ) ) ( not ( = ?auto_27019 ?auto_27027 ) ) ( not ( = ?auto_27019 ?auto_27045 ) ) ( not ( = ?auto_27019 ?auto_27042 ) ) ( not ( = ?auto_27019 ?auto_27040 ) ) ( not ( = ?auto_27019 ?auto_27017 ) ) ( not ( = ?auto_27019 ?auto_27041 ) ) ( not ( = ?auto_26988 ?auto_27003 ) ) ( not ( = ?auto_26988 ?auto_27043 ) ) ( not ( = ?auto_26989 ?auto_27003 ) ) ( not ( = ?auto_26989 ?auto_27043 ) ) ( not ( = ?auto_26990 ?auto_27003 ) ) ( not ( = ?auto_26990 ?auto_27043 ) ) ( not ( = ?auto_26991 ?auto_27003 ) ) ( not ( = ?auto_26991 ?auto_27043 ) ) ( not ( = ?auto_26992 ?auto_27003 ) ) ( not ( = ?auto_26992 ?auto_27043 ) ) ( not ( = ?auto_26993 ?auto_27003 ) ) ( not ( = ?auto_26993 ?auto_27043 ) ) ( not ( = ?auto_26994 ?auto_27003 ) ) ( not ( = ?auto_26994 ?auto_27043 ) ) ( not ( = ?auto_26995 ?auto_27003 ) ) ( not ( = ?auto_26995 ?auto_27043 ) ) ( not ( = ?auto_26996 ?auto_27003 ) ) ( not ( = ?auto_26996 ?auto_27043 ) ) ( not ( = ?auto_26997 ?auto_27003 ) ) ( not ( = ?auto_26997 ?auto_27043 ) ) ( not ( = ?auto_26998 ?auto_27003 ) ) ( not ( = ?auto_26998 ?auto_27043 ) ) ( not ( = ?auto_26999 ?auto_27003 ) ) ( not ( = ?auto_26999 ?auto_27043 ) ) ( not ( = ?auto_27000 ?auto_27003 ) ) ( not ( = ?auto_27000 ?auto_27043 ) ) ( not ( = ?auto_27003 ?auto_27019 ) ) ( not ( = ?auto_27003 ?auto_27012 ) ) ( not ( = ?auto_27003 ?auto_27020 ) ) ( not ( = ?auto_27003 ?auto_27016 ) ) ( not ( = ?auto_27003 ?auto_27021 ) ) ( not ( = ?auto_27003 ?auto_27022 ) ) ( not ( = ?auto_27003 ?auto_27015 ) ) ( not ( = ?auto_27003 ?auto_27027 ) ) ( not ( = ?auto_27003 ?auto_27045 ) ) ( not ( = ?auto_27003 ?auto_27042 ) ) ( not ( = ?auto_27003 ?auto_27040 ) ) ( not ( = ?auto_27003 ?auto_27017 ) ) ( not ( = ?auto_27003 ?auto_27041 ) ) ( not ( = ?auto_27043 ?auto_27019 ) ) ( not ( = ?auto_27043 ?auto_27012 ) ) ( not ( = ?auto_27043 ?auto_27020 ) ) ( not ( = ?auto_27043 ?auto_27016 ) ) ( not ( = ?auto_27043 ?auto_27021 ) ) ( not ( = ?auto_27043 ?auto_27022 ) ) ( not ( = ?auto_27043 ?auto_27015 ) ) ( not ( = ?auto_27043 ?auto_27027 ) ) ( not ( = ?auto_27043 ?auto_27045 ) ) ( not ( = ?auto_27043 ?auto_27042 ) ) ( not ( = ?auto_27043 ?auto_27040 ) ) ( not ( = ?auto_27043 ?auto_27017 ) ) ( not ( = ?auto_27043 ?auto_27041 ) ) ( not ( = ?auto_26988 ?auto_27002 ) ) ( not ( = ?auto_26988 ?auto_27011 ) ) ( not ( = ?auto_26989 ?auto_27002 ) ) ( not ( = ?auto_26989 ?auto_27011 ) ) ( not ( = ?auto_26990 ?auto_27002 ) ) ( not ( = ?auto_26990 ?auto_27011 ) ) ( not ( = ?auto_26991 ?auto_27002 ) ) ( not ( = ?auto_26991 ?auto_27011 ) ) ( not ( = ?auto_26992 ?auto_27002 ) ) ( not ( = ?auto_26992 ?auto_27011 ) ) ( not ( = ?auto_26993 ?auto_27002 ) ) ( not ( = ?auto_26993 ?auto_27011 ) ) ( not ( = ?auto_26994 ?auto_27002 ) ) ( not ( = ?auto_26994 ?auto_27011 ) ) ( not ( = ?auto_26995 ?auto_27002 ) ) ( not ( = ?auto_26995 ?auto_27011 ) ) ( not ( = ?auto_26996 ?auto_27002 ) ) ( not ( = ?auto_26996 ?auto_27011 ) ) ( not ( = ?auto_26997 ?auto_27002 ) ) ( not ( = ?auto_26997 ?auto_27011 ) ) ( not ( = ?auto_26998 ?auto_27002 ) ) ( not ( = ?auto_26998 ?auto_27011 ) ) ( not ( = ?auto_26999 ?auto_27002 ) ) ( not ( = ?auto_26999 ?auto_27011 ) ) ( not ( = ?auto_27000 ?auto_27002 ) ) ( not ( = ?auto_27000 ?auto_27011 ) ) ( not ( = ?auto_27001 ?auto_27002 ) ) ( not ( = ?auto_27001 ?auto_27011 ) ) ( not ( = ?auto_27002 ?auto_27043 ) ) ( not ( = ?auto_27002 ?auto_27019 ) ) ( not ( = ?auto_27002 ?auto_27012 ) ) ( not ( = ?auto_27002 ?auto_27020 ) ) ( not ( = ?auto_27002 ?auto_27016 ) ) ( not ( = ?auto_27002 ?auto_27021 ) ) ( not ( = ?auto_27002 ?auto_27022 ) ) ( not ( = ?auto_27002 ?auto_27015 ) ) ( not ( = ?auto_27002 ?auto_27027 ) ) ( not ( = ?auto_27002 ?auto_27045 ) ) ( not ( = ?auto_27002 ?auto_27042 ) ) ( not ( = ?auto_27002 ?auto_27040 ) ) ( not ( = ?auto_27002 ?auto_27017 ) ) ( not ( = ?auto_27002 ?auto_27041 ) ) ( not ( = ?auto_27029 ?auto_27046 ) ) ( not ( = ?auto_27029 ?auto_27035 ) ) ( not ( = ?auto_27029 ?auto_27008 ) ) ( not ( = ?auto_27029 ?auto_27028 ) ) ( not ( = ?auto_27029 ?auto_27025 ) ) ( not ( = ?auto_27029 ?auto_27047 ) ) ( not ( = ?auto_27029 ?auto_27037 ) ) ( not ( = ?auto_27029 ?auto_27039 ) ) ( not ( = ?auto_27029 ?auto_27044 ) ) ( not ( = ?auto_27029 ?auto_27030 ) ) ( not ( = ?auto_27029 ?auto_27031 ) ) ( not ( = ?auto_27036 ?auto_27032 ) ) ( not ( = ?auto_27036 ?auto_27014 ) ) ( not ( = ?auto_27036 ?auto_27005 ) ) ( not ( = ?auto_27036 ?auto_27038 ) ) ( not ( = ?auto_27036 ?auto_27026 ) ) ( not ( = ?auto_27036 ?auto_27033 ) ) ( not ( = ?auto_27036 ?auto_27018 ) ) ( not ( = ?auto_27036 ?auto_27024 ) ) ( not ( = ?auto_27036 ?auto_27013 ) ) ( not ( = ?auto_27036 ?auto_27034 ) ) ( not ( = ?auto_27036 ?auto_27023 ) ) ( not ( = ?auto_27011 ?auto_27043 ) ) ( not ( = ?auto_27011 ?auto_27019 ) ) ( not ( = ?auto_27011 ?auto_27012 ) ) ( not ( = ?auto_27011 ?auto_27020 ) ) ( not ( = ?auto_27011 ?auto_27016 ) ) ( not ( = ?auto_27011 ?auto_27021 ) ) ( not ( = ?auto_27011 ?auto_27022 ) ) ( not ( = ?auto_27011 ?auto_27015 ) ) ( not ( = ?auto_27011 ?auto_27027 ) ) ( not ( = ?auto_27011 ?auto_27045 ) ) ( not ( = ?auto_27011 ?auto_27042 ) ) ( not ( = ?auto_27011 ?auto_27040 ) ) ( not ( = ?auto_27011 ?auto_27017 ) ) ( not ( = ?auto_27011 ?auto_27041 ) ) ( not ( = ?auto_26988 ?auto_27004 ) ) ( not ( = ?auto_26988 ?auto_27009 ) ) ( not ( = ?auto_26989 ?auto_27004 ) ) ( not ( = ?auto_26989 ?auto_27009 ) ) ( not ( = ?auto_26990 ?auto_27004 ) ) ( not ( = ?auto_26990 ?auto_27009 ) ) ( not ( = ?auto_26991 ?auto_27004 ) ) ( not ( = ?auto_26991 ?auto_27009 ) ) ( not ( = ?auto_26992 ?auto_27004 ) ) ( not ( = ?auto_26992 ?auto_27009 ) ) ( not ( = ?auto_26993 ?auto_27004 ) ) ( not ( = ?auto_26993 ?auto_27009 ) ) ( not ( = ?auto_26994 ?auto_27004 ) ) ( not ( = ?auto_26994 ?auto_27009 ) ) ( not ( = ?auto_26995 ?auto_27004 ) ) ( not ( = ?auto_26995 ?auto_27009 ) ) ( not ( = ?auto_26996 ?auto_27004 ) ) ( not ( = ?auto_26996 ?auto_27009 ) ) ( not ( = ?auto_26997 ?auto_27004 ) ) ( not ( = ?auto_26997 ?auto_27009 ) ) ( not ( = ?auto_26998 ?auto_27004 ) ) ( not ( = ?auto_26998 ?auto_27009 ) ) ( not ( = ?auto_26999 ?auto_27004 ) ) ( not ( = ?auto_26999 ?auto_27009 ) ) ( not ( = ?auto_27000 ?auto_27004 ) ) ( not ( = ?auto_27000 ?auto_27009 ) ) ( not ( = ?auto_27001 ?auto_27004 ) ) ( not ( = ?auto_27001 ?auto_27009 ) ) ( not ( = ?auto_27003 ?auto_27004 ) ) ( not ( = ?auto_27003 ?auto_27009 ) ) ( not ( = ?auto_27004 ?auto_27011 ) ) ( not ( = ?auto_27004 ?auto_27043 ) ) ( not ( = ?auto_27004 ?auto_27019 ) ) ( not ( = ?auto_27004 ?auto_27012 ) ) ( not ( = ?auto_27004 ?auto_27020 ) ) ( not ( = ?auto_27004 ?auto_27016 ) ) ( not ( = ?auto_27004 ?auto_27021 ) ) ( not ( = ?auto_27004 ?auto_27022 ) ) ( not ( = ?auto_27004 ?auto_27015 ) ) ( not ( = ?auto_27004 ?auto_27027 ) ) ( not ( = ?auto_27004 ?auto_27045 ) ) ( not ( = ?auto_27004 ?auto_27042 ) ) ( not ( = ?auto_27004 ?auto_27040 ) ) ( not ( = ?auto_27004 ?auto_27017 ) ) ( not ( = ?auto_27004 ?auto_27041 ) ) ( not ( = ?auto_27009 ?auto_27011 ) ) ( not ( = ?auto_27009 ?auto_27043 ) ) ( not ( = ?auto_27009 ?auto_27019 ) ) ( not ( = ?auto_27009 ?auto_27012 ) ) ( not ( = ?auto_27009 ?auto_27020 ) ) ( not ( = ?auto_27009 ?auto_27016 ) ) ( not ( = ?auto_27009 ?auto_27021 ) ) ( not ( = ?auto_27009 ?auto_27022 ) ) ( not ( = ?auto_27009 ?auto_27015 ) ) ( not ( = ?auto_27009 ?auto_27027 ) ) ( not ( = ?auto_27009 ?auto_27045 ) ) ( not ( = ?auto_27009 ?auto_27042 ) ) ( not ( = ?auto_27009 ?auto_27040 ) ) ( not ( = ?auto_27009 ?auto_27017 ) ) ( not ( = ?auto_27009 ?auto_27041 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_26988 ?auto_26989 ?auto_26990 ?auto_26991 ?auto_26992 ?auto_26993 ?auto_26994 ?auto_26995 ?auto_26996 ?auto_26997 ?auto_26998 ?auto_26999 ?auto_27000 ?auto_27001 ?auto_27003 ?auto_27002 )
      ( MAKE-1CRATE ?auto_27002 ?auto_27004 )
      ( MAKE-16CRATE-VERIFY ?auto_26988 ?auto_26989 ?auto_26990 ?auto_26991 ?auto_26992 ?auto_26993 ?auto_26994 ?auto_26995 ?auto_26996 ?auto_26997 ?auto_26998 ?auto_26999 ?auto_27000 ?auto_27001 ?auto_27003 ?auto_27002 ?auto_27004 ) )
  )

)

