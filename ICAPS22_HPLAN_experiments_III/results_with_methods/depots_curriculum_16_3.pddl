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
      ?auto_26246 - SURFACE
      ?auto_26247 - SURFACE
    )
    :vars
    (
      ?auto_26248 - HOIST
      ?auto_26249 - PLACE
      ?auto_26251 - PLACE
      ?auto_26252 - HOIST
      ?auto_26253 - SURFACE
      ?auto_26250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26248 ?auto_26249 ) ( SURFACE-AT ?auto_26246 ?auto_26249 ) ( CLEAR ?auto_26246 ) ( IS-CRATE ?auto_26247 ) ( AVAILABLE ?auto_26248 ) ( not ( = ?auto_26251 ?auto_26249 ) ) ( HOIST-AT ?auto_26252 ?auto_26251 ) ( AVAILABLE ?auto_26252 ) ( SURFACE-AT ?auto_26247 ?auto_26251 ) ( ON ?auto_26247 ?auto_26253 ) ( CLEAR ?auto_26247 ) ( TRUCK-AT ?auto_26250 ?auto_26249 ) ( not ( = ?auto_26246 ?auto_26247 ) ) ( not ( = ?auto_26246 ?auto_26253 ) ) ( not ( = ?auto_26247 ?auto_26253 ) ) ( not ( = ?auto_26248 ?auto_26252 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26250 ?auto_26249 ?auto_26251 )
      ( !LIFT ?auto_26252 ?auto_26247 ?auto_26253 ?auto_26251 )
      ( !LOAD ?auto_26252 ?auto_26247 ?auto_26250 ?auto_26251 )
      ( !DRIVE ?auto_26250 ?auto_26251 ?auto_26249 )
      ( !UNLOAD ?auto_26248 ?auto_26247 ?auto_26250 ?auto_26249 )
      ( !DROP ?auto_26248 ?auto_26247 ?auto_26246 ?auto_26249 )
      ( MAKE-1CRATE-VERIFY ?auto_26246 ?auto_26247 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26256 - SURFACE
      ?auto_26257 - SURFACE
    )
    :vars
    (
      ?auto_26258 - HOIST
      ?auto_26259 - PLACE
      ?auto_26261 - PLACE
      ?auto_26262 - HOIST
      ?auto_26263 - SURFACE
      ?auto_26260 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26258 ?auto_26259 ) ( SURFACE-AT ?auto_26256 ?auto_26259 ) ( CLEAR ?auto_26256 ) ( IS-CRATE ?auto_26257 ) ( AVAILABLE ?auto_26258 ) ( not ( = ?auto_26261 ?auto_26259 ) ) ( HOIST-AT ?auto_26262 ?auto_26261 ) ( AVAILABLE ?auto_26262 ) ( SURFACE-AT ?auto_26257 ?auto_26261 ) ( ON ?auto_26257 ?auto_26263 ) ( CLEAR ?auto_26257 ) ( TRUCK-AT ?auto_26260 ?auto_26259 ) ( not ( = ?auto_26256 ?auto_26257 ) ) ( not ( = ?auto_26256 ?auto_26263 ) ) ( not ( = ?auto_26257 ?auto_26263 ) ) ( not ( = ?auto_26258 ?auto_26262 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26260 ?auto_26259 ?auto_26261 )
      ( !LIFT ?auto_26262 ?auto_26257 ?auto_26263 ?auto_26261 )
      ( !LOAD ?auto_26262 ?auto_26257 ?auto_26260 ?auto_26261 )
      ( !DRIVE ?auto_26260 ?auto_26261 ?auto_26259 )
      ( !UNLOAD ?auto_26258 ?auto_26257 ?auto_26260 ?auto_26259 )
      ( !DROP ?auto_26258 ?auto_26257 ?auto_26256 ?auto_26259 )
      ( MAKE-1CRATE-VERIFY ?auto_26256 ?auto_26257 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26267 - SURFACE
      ?auto_26268 - SURFACE
      ?auto_26269 - SURFACE
    )
    :vars
    (
      ?auto_26274 - HOIST
      ?auto_26270 - PLACE
      ?auto_26275 - PLACE
      ?auto_26273 - HOIST
      ?auto_26272 - SURFACE
      ?auto_26276 - PLACE
      ?auto_26278 - HOIST
      ?auto_26277 - SURFACE
      ?auto_26271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26274 ?auto_26270 ) ( IS-CRATE ?auto_26269 ) ( not ( = ?auto_26275 ?auto_26270 ) ) ( HOIST-AT ?auto_26273 ?auto_26275 ) ( AVAILABLE ?auto_26273 ) ( SURFACE-AT ?auto_26269 ?auto_26275 ) ( ON ?auto_26269 ?auto_26272 ) ( CLEAR ?auto_26269 ) ( not ( = ?auto_26268 ?auto_26269 ) ) ( not ( = ?auto_26268 ?auto_26272 ) ) ( not ( = ?auto_26269 ?auto_26272 ) ) ( not ( = ?auto_26274 ?auto_26273 ) ) ( SURFACE-AT ?auto_26267 ?auto_26270 ) ( CLEAR ?auto_26267 ) ( IS-CRATE ?auto_26268 ) ( AVAILABLE ?auto_26274 ) ( not ( = ?auto_26276 ?auto_26270 ) ) ( HOIST-AT ?auto_26278 ?auto_26276 ) ( AVAILABLE ?auto_26278 ) ( SURFACE-AT ?auto_26268 ?auto_26276 ) ( ON ?auto_26268 ?auto_26277 ) ( CLEAR ?auto_26268 ) ( TRUCK-AT ?auto_26271 ?auto_26270 ) ( not ( = ?auto_26267 ?auto_26268 ) ) ( not ( = ?auto_26267 ?auto_26277 ) ) ( not ( = ?auto_26268 ?auto_26277 ) ) ( not ( = ?auto_26274 ?auto_26278 ) ) ( not ( = ?auto_26267 ?auto_26269 ) ) ( not ( = ?auto_26267 ?auto_26272 ) ) ( not ( = ?auto_26269 ?auto_26277 ) ) ( not ( = ?auto_26275 ?auto_26276 ) ) ( not ( = ?auto_26273 ?auto_26278 ) ) ( not ( = ?auto_26272 ?auto_26277 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26267 ?auto_26268 )
      ( MAKE-1CRATE ?auto_26268 ?auto_26269 )
      ( MAKE-2CRATE-VERIFY ?auto_26267 ?auto_26268 ?auto_26269 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26281 - SURFACE
      ?auto_26282 - SURFACE
    )
    :vars
    (
      ?auto_26283 - HOIST
      ?auto_26284 - PLACE
      ?auto_26286 - PLACE
      ?auto_26287 - HOIST
      ?auto_26288 - SURFACE
      ?auto_26285 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26283 ?auto_26284 ) ( SURFACE-AT ?auto_26281 ?auto_26284 ) ( CLEAR ?auto_26281 ) ( IS-CRATE ?auto_26282 ) ( AVAILABLE ?auto_26283 ) ( not ( = ?auto_26286 ?auto_26284 ) ) ( HOIST-AT ?auto_26287 ?auto_26286 ) ( AVAILABLE ?auto_26287 ) ( SURFACE-AT ?auto_26282 ?auto_26286 ) ( ON ?auto_26282 ?auto_26288 ) ( CLEAR ?auto_26282 ) ( TRUCK-AT ?auto_26285 ?auto_26284 ) ( not ( = ?auto_26281 ?auto_26282 ) ) ( not ( = ?auto_26281 ?auto_26288 ) ) ( not ( = ?auto_26282 ?auto_26288 ) ) ( not ( = ?auto_26283 ?auto_26287 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26285 ?auto_26284 ?auto_26286 )
      ( !LIFT ?auto_26287 ?auto_26282 ?auto_26288 ?auto_26286 )
      ( !LOAD ?auto_26287 ?auto_26282 ?auto_26285 ?auto_26286 )
      ( !DRIVE ?auto_26285 ?auto_26286 ?auto_26284 )
      ( !UNLOAD ?auto_26283 ?auto_26282 ?auto_26285 ?auto_26284 )
      ( !DROP ?auto_26283 ?auto_26282 ?auto_26281 ?auto_26284 )
      ( MAKE-1CRATE-VERIFY ?auto_26281 ?auto_26282 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_26293 - SURFACE
      ?auto_26294 - SURFACE
      ?auto_26295 - SURFACE
      ?auto_26296 - SURFACE
    )
    :vars
    (
      ?auto_26299 - HOIST
      ?auto_26301 - PLACE
      ?auto_26302 - PLACE
      ?auto_26297 - HOIST
      ?auto_26300 - SURFACE
      ?auto_26304 - PLACE
      ?auto_26308 - HOIST
      ?auto_26305 - SURFACE
      ?auto_26306 - PLACE
      ?auto_26307 - HOIST
      ?auto_26303 - SURFACE
      ?auto_26298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26299 ?auto_26301 ) ( IS-CRATE ?auto_26296 ) ( not ( = ?auto_26302 ?auto_26301 ) ) ( HOIST-AT ?auto_26297 ?auto_26302 ) ( AVAILABLE ?auto_26297 ) ( SURFACE-AT ?auto_26296 ?auto_26302 ) ( ON ?auto_26296 ?auto_26300 ) ( CLEAR ?auto_26296 ) ( not ( = ?auto_26295 ?auto_26296 ) ) ( not ( = ?auto_26295 ?auto_26300 ) ) ( not ( = ?auto_26296 ?auto_26300 ) ) ( not ( = ?auto_26299 ?auto_26297 ) ) ( IS-CRATE ?auto_26295 ) ( not ( = ?auto_26304 ?auto_26301 ) ) ( HOIST-AT ?auto_26308 ?auto_26304 ) ( AVAILABLE ?auto_26308 ) ( SURFACE-AT ?auto_26295 ?auto_26304 ) ( ON ?auto_26295 ?auto_26305 ) ( CLEAR ?auto_26295 ) ( not ( = ?auto_26294 ?auto_26295 ) ) ( not ( = ?auto_26294 ?auto_26305 ) ) ( not ( = ?auto_26295 ?auto_26305 ) ) ( not ( = ?auto_26299 ?auto_26308 ) ) ( SURFACE-AT ?auto_26293 ?auto_26301 ) ( CLEAR ?auto_26293 ) ( IS-CRATE ?auto_26294 ) ( AVAILABLE ?auto_26299 ) ( not ( = ?auto_26306 ?auto_26301 ) ) ( HOIST-AT ?auto_26307 ?auto_26306 ) ( AVAILABLE ?auto_26307 ) ( SURFACE-AT ?auto_26294 ?auto_26306 ) ( ON ?auto_26294 ?auto_26303 ) ( CLEAR ?auto_26294 ) ( TRUCK-AT ?auto_26298 ?auto_26301 ) ( not ( = ?auto_26293 ?auto_26294 ) ) ( not ( = ?auto_26293 ?auto_26303 ) ) ( not ( = ?auto_26294 ?auto_26303 ) ) ( not ( = ?auto_26299 ?auto_26307 ) ) ( not ( = ?auto_26293 ?auto_26295 ) ) ( not ( = ?auto_26293 ?auto_26305 ) ) ( not ( = ?auto_26295 ?auto_26303 ) ) ( not ( = ?auto_26304 ?auto_26306 ) ) ( not ( = ?auto_26308 ?auto_26307 ) ) ( not ( = ?auto_26305 ?auto_26303 ) ) ( not ( = ?auto_26293 ?auto_26296 ) ) ( not ( = ?auto_26293 ?auto_26300 ) ) ( not ( = ?auto_26294 ?auto_26296 ) ) ( not ( = ?auto_26294 ?auto_26300 ) ) ( not ( = ?auto_26296 ?auto_26305 ) ) ( not ( = ?auto_26296 ?auto_26303 ) ) ( not ( = ?auto_26302 ?auto_26304 ) ) ( not ( = ?auto_26302 ?auto_26306 ) ) ( not ( = ?auto_26297 ?auto_26308 ) ) ( not ( = ?auto_26297 ?auto_26307 ) ) ( not ( = ?auto_26300 ?auto_26305 ) ) ( not ( = ?auto_26300 ?auto_26303 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26293 ?auto_26294 ?auto_26295 )
      ( MAKE-1CRATE ?auto_26295 ?auto_26296 )
      ( MAKE-3CRATE-VERIFY ?auto_26293 ?auto_26294 ?auto_26295 ?auto_26296 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26311 - SURFACE
      ?auto_26312 - SURFACE
    )
    :vars
    (
      ?auto_26313 - HOIST
      ?auto_26314 - PLACE
      ?auto_26316 - PLACE
      ?auto_26317 - HOIST
      ?auto_26318 - SURFACE
      ?auto_26315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26313 ?auto_26314 ) ( SURFACE-AT ?auto_26311 ?auto_26314 ) ( CLEAR ?auto_26311 ) ( IS-CRATE ?auto_26312 ) ( AVAILABLE ?auto_26313 ) ( not ( = ?auto_26316 ?auto_26314 ) ) ( HOIST-AT ?auto_26317 ?auto_26316 ) ( AVAILABLE ?auto_26317 ) ( SURFACE-AT ?auto_26312 ?auto_26316 ) ( ON ?auto_26312 ?auto_26318 ) ( CLEAR ?auto_26312 ) ( TRUCK-AT ?auto_26315 ?auto_26314 ) ( not ( = ?auto_26311 ?auto_26312 ) ) ( not ( = ?auto_26311 ?auto_26318 ) ) ( not ( = ?auto_26312 ?auto_26318 ) ) ( not ( = ?auto_26313 ?auto_26317 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26315 ?auto_26314 ?auto_26316 )
      ( !LIFT ?auto_26317 ?auto_26312 ?auto_26318 ?auto_26316 )
      ( !LOAD ?auto_26317 ?auto_26312 ?auto_26315 ?auto_26316 )
      ( !DRIVE ?auto_26315 ?auto_26316 ?auto_26314 )
      ( !UNLOAD ?auto_26313 ?auto_26312 ?auto_26315 ?auto_26314 )
      ( !DROP ?auto_26313 ?auto_26312 ?auto_26311 ?auto_26314 )
      ( MAKE-1CRATE-VERIFY ?auto_26311 ?auto_26312 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_26324 - SURFACE
      ?auto_26325 - SURFACE
      ?auto_26326 - SURFACE
      ?auto_26327 - SURFACE
      ?auto_26328 - SURFACE
    )
    :vars
    (
      ?auto_26333 - HOIST
      ?auto_26330 - PLACE
      ?auto_26334 - PLACE
      ?auto_26331 - HOIST
      ?auto_26332 - SURFACE
      ?auto_26335 - PLACE
      ?auto_26336 - HOIST
      ?auto_26340 - SURFACE
      ?auto_26338 - SURFACE
      ?auto_26341 - PLACE
      ?auto_26339 - HOIST
      ?auto_26337 - SURFACE
      ?auto_26329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26333 ?auto_26330 ) ( IS-CRATE ?auto_26328 ) ( not ( = ?auto_26334 ?auto_26330 ) ) ( HOIST-AT ?auto_26331 ?auto_26334 ) ( SURFACE-AT ?auto_26328 ?auto_26334 ) ( ON ?auto_26328 ?auto_26332 ) ( CLEAR ?auto_26328 ) ( not ( = ?auto_26327 ?auto_26328 ) ) ( not ( = ?auto_26327 ?auto_26332 ) ) ( not ( = ?auto_26328 ?auto_26332 ) ) ( not ( = ?auto_26333 ?auto_26331 ) ) ( IS-CRATE ?auto_26327 ) ( not ( = ?auto_26335 ?auto_26330 ) ) ( HOIST-AT ?auto_26336 ?auto_26335 ) ( AVAILABLE ?auto_26336 ) ( SURFACE-AT ?auto_26327 ?auto_26335 ) ( ON ?auto_26327 ?auto_26340 ) ( CLEAR ?auto_26327 ) ( not ( = ?auto_26326 ?auto_26327 ) ) ( not ( = ?auto_26326 ?auto_26340 ) ) ( not ( = ?auto_26327 ?auto_26340 ) ) ( not ( = ?auto_26333 ?auto_26336 ) ) ( IS-CRATE ?auto_26326 ) ( AVAILABLE ?auto_26331 ) ( SURFACE-AT ?auto_26326 ?auto_26334 ) ( ON ?auto_26326 ?auto_26338 ) ( CLEAR ?auto_26326 ) ( not ( = ?auto_26325 ?auto_26326 ) ) ( not ( = ?auto_26325 ?auto_26338 ) ) ( not ( = ?auto_26326 ?auto_26338 ) ) ( SURFACE-AT ?auto_26324 ?auto_26330 ) ( CLEAR ?auto_26324 ) ( IS-CRATE ?auto_26325 ) ( AVAILABLE ?auto_26333 ) ( not ( = ?auto_26341 ?auto_26330 ) ) ( HOIST-AT ?auto_26339 ?auto_26341 ) ( AVAILABLE ?auto_26339 ) ( SURFACE-AT ?auto_26325 ?auto_26341 ) ( ON ?auto_26325 ?auto_26337 ) ( CLEAR ?auto_26325 ) ( TRUCK-AT ?auto_26329 ?auto_26330 ) ( not ( = ?auto_26324 ?auto_26325 ) ) ( not ( = ?auto_26324 ?auto_26337 ) ) ( not ( = ?auto_26325 ?auto_26337 ) ) ( not ( = ?auto_26333 ?auto_26339 ) ) ( not ( = ?auto_26324 ?auto_26326 ) ) ( not ( = ?auto_26324 ?auto_26338 ) ) ( not ( = ?auto_26326 ?auto_26337 ) ) ( not ( = ?auto_26334 ?auto_26341 ) ) ( not ( = ?auto_26331 ?auto_26339 ) ) ( not ( = ?auto_26338 ?auto_26337 ) ) ( not ( = ?auto_26324 ?auto_26327 ) ) ( not ( = ?auto_26324 ?auto_26340 ) ) ( not ( = ?auto_26325 ?auto_26327 ) ) ( not ( = ?auto_26325 ?auto_26340 ) ) ( not ( = ?auto_26327 ?auto_26338 ) ) ( not ( = ?auto_26327 ?auto_26337 ) ) ( not ( = ?auto_26335 ?auto_26334 ) ) ( not ( = ?auto_26335 ?auto_26341 ) ) ( not ( = ?auto_26336 ?auto_26331 ) ) ( not ( = ?auto_26336 ?auto_26339 ) ) ( not ( = ?auto_26340 ?auto_26338 ) ) ( not ( = ?auto_26340 ?auto_26337 ) ) ( not ( = ?auto_26324 ?auto_26328 ) ) ( not ( = ?auto_26324 ?auto_26332 ) ) ( not ( = ?auto_26325 ?auto_26328 ) ) ( not ( = ?auto_26325 ?auto_26332 ) ) ( not ( = ?auto_26326 ?auto_26328 ) ) ( not ( = ?auto_26326 ?auto_26332 ) ) ( not ( = ?auto_26328 ?auto_26340 ) ) ( not ( = ?auto_26328 ?auto_26338 ) ) ( not ( = ?auto_26328 ?auto_26337 ) ) ( not ( = ?auto_26332 ?auto_26340 ) ) ( not ( = ?auto_26332 ?auto_26338 ) ) ( not ( = ?auto_26332 ?auto_26337 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_26324 ?auto_26325 ?auto_26326 ?auto_26327 )
      ( MAKE-1CRATE ?auto_26327 ?auto_26328 )
      ( MAKE-4CRATE-VERIFY ?auto_26324 ?auto_26325 ?auto_26326 ?auto_26327 ?auto_26328 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26344 - SURFACE
      ?auto_26345 - SURFACE
    )
    :vars
    (
      ?auto_26346 - HOIST
      ?auto_26347 - PLACE
      ?auto_26349 - PLACE
      ?auto_26350 - HOIST
      ?auto_26351 - SURFACE
      ?auto_26348 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26346 ?auto_26347 ) ( SURFACE-AT ?auto_26344 ?auto_26347 ) ( CLEAR ?auto_26344 ) ( IS-CRATE ?auto_26345 ) ( AVAILABLE ?auto_26346 ) ( not ( = ?auto_26349 ?auto_26347 ) ) ( HOIST-AT ?auto_26350 ?auto_26349 ) ( AVAILABLE ?auto_26350 ) ( SURFACE-AT ?auto_26345 ?auto_26349 ) ( ON ?auto_26345 ?auto_26351 ) ( CLEAR ?auto_26345 ) ( TRUCK-AT ?auto_26348 ?auto_26347 ) ( not ( = ?auto_26344 ?auto_26345 ) ) ( not ( = ?auto_26344 ?auto_26351 ) ) ( not ( = ?auto_26345 ?auto_26351 ) ) ( not ( = ?auto_26346 ?auto_26350 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26348 ?auto_26347 ?auto_26349 )
      ( !LIFT ?auto_26350 ?auto_26345 ?auto_26351 ?auto_26349 )
      ( !LOAD ?auto_26350 ?auto_26345 ?auto_26348 ?auto_26349 )
      ( !DRIVE ?auto_26348 ?auto_26349 ?auto_26347 )
      ( !UNLOAD ?auto_26346 ?auto_26345 ?auto_26348 ?auto_26347 )
      ( !DROP ?auto_26346 ?auto_26345 ?auto_26344 ?auto_26347 )
      ( MAKE-1CRATE-VERIFY ?auto_26344 ?auto_26345 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_26358 - SURFACE
      ?auto_26359 - SURFACE
      ?auto_26360 - SURFACE
      ?auto_26361 - SURFACE
      ?auto_26362 - SURFACE
      ?auto_26363 - SURFACE
    )
    :vars
    (
      ?auto_26366 - HOIST
      ?auto_26364 - PLACE
      ?auto_26368 - PLACE
      ?auto_26367 - HOIST
      ?auto_26369 - SURFACE
      ?auto_26371 - PLACE
      ?auto_26375 - HOIST
      ?auto_26370 - SURFACE
      ?auto_26378 - PLACE
      ?auto_26379 - HOIST
      ?auto_26376 - SURFACE
      ?auto_26377 - SURFACE
      ?auto_26374 - PLACE
      ?auto_26373 - HOIST
      ?auto_26372 - SURFACE
      ?auto_26365 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26366 ?auto_26364 ) ( IS-CRATE ?auto_26363 ) ( not ( = ?auto_26368 ?auto_26364 ) ) ( HOIST-AT ?auto_26367 ?auto_26368 ) ( AVAILABLE ?auto_26367 ) ( SURFACE-AT ?auto_26363 ?auto_26368 ) ( ON ?auto_26363 ?auto_26369 ) ( CLEAR ?auto_26363 ) ( not ( = ?auto_26362 ?auto_26363 ) ) ( not ( = ?auto_26362 ?auto_26369 ) ) ( not ( = ?auto_26363 ?auto_26369 ) ) ( not ( = ?auto_26366 ?auto_26367 ) ) ( IS-CRATE ?auto_26362 ) ( not ( = ?auto_26371 ?auto_26364 ) ) ( HOIST-AT ?auto_26375 ?auto_26371 ) ( SURFACE-AT ?auto_26362 ?auto_26371 ) ( ON ?auto_26362 ?auto_26370 ) ( CLEAR ?auto_26362 ) ( not ( = ?auto_26361 ?auto_26362 ) ) ( not ( = ?auto_26361 ?auto_26370 ) ) ( not ( = ?auto_26362 ?auto_26370 ) ) ( not ( = ?auto_26366 ?auto_26375 ) ) ( IS-CRATE ?auto_26361 ) ( not ( = ?auto_26378 ?auto_26364 ) ) ( HOIST-AT ?auto_26379 ?auto_26378 ) ( AVAILABLE ?auto_26379 ) ( SURFACE-AT ?auto_26361 ?auto_26378 ) ( ON ?auto_26361 ?auto_26376 ) ( CLEAR ?auto_26361 ) ( not ( = ?auto_26360 ?auto_26361 ) ) ( not ( = ?auto_26360 ?auto_26376 ) ) ( not ( = ?auto_26361 ?auto_26376 ) ) ( not ( = ?auto_26366 ?auto_26379 ) ) ( IS-CRATE ?auto_26360 ) ( AVAILABLE ?auto_26375 ) ( SURFACE-AT ?auto_26360 ?auto_26371 ) ( ON ?auto_26360 ?auto_26377 ) ( CLEAR ?auto_26360 ) ( not ( = ?auto_26359 ?auto_26360 ) ) ( not ( = ?auto_26359 ?auto_26377 ) ) ( not ( = ?auto_26360 ?auto_26377 ) ) ( SURFACE-AT ?auto_26358 ?auto_26364 ) ( CLEAR ?auto_26358 ) ( IS-CRATE ?auto_26359 ) ( AVAILABLE ?auto_26366 ) ( not ( = ?auto_26374 ?auto_26364 ) ) ( HOIST-AT ?auto_26373 ?auto_26374 ) ( AVAILABLE ?auto_26373 ) ( SURFACE-AT ?auto_26359 ?auto_26374 ) ( ON ?auto_26359 ?auto_26372 ) ( CLEAR ?auto_26359 ) ( TRUCK-AT ?auto_26365 ?auto_26364 ) ( not ( = ?auto_26358 ?auto_26359 ) ) ( not ( = ?auto_26358 ?auto_26372 ) ) ( not ( = ?auto_26359 ?auto_26372 ) ) ( not ( = ?auto_26366 ?auto_26373 ) ) ( not ( = ?auto_26358 ?auto_26360 ) ) ( not ( = ?auto_26358 ?auto_26377 ) ) ( not ( = ?auto_26360 ?auto_26372 ) ) ( not ( = ?auto_26371 ?auto_26374 ) ) ( not ( = ?auto_26375 ?auto_26373 ) ) ( not ( = ?auto_26377 ?auto_26372 ) ) ( not ( = ?auto_26358 ?auto_26361 ) ) ( not ( = ?auto_26358 ?auto_26376 ) ) ( not ( = ?auto_26359 ?auto_26361 ) ) ( not ( = ?auto_26359 ?auto_26376 ) ) ( not ( = ?auto_26361 ?auto_26377 ) ) ( not ( = ?auto_26361 ?auto_26372 ) ) ( not ( = ?auto_26378 ?auto_26371 ) ) ( not ( = ?auto_26378 ?auto_26374 ) ) ( not ( = ?auto_26379 ?auto_26375 ) ) ( not ( = ?auto_26379 ?auto_26373 ) ) ( not ( = ?auto_26376 ?auto_26377 ) ) ( not ( = ?auto_26376 ?auto_26372 ) ) ( not ( = ?auto_26358 ?auto_26362 ) ) ( not ( = ?auto_26358 ?auto_26370 ) ) ( not ( = ?auto_26359 ?auto_26362 ) ) ( not ( = ?auto_26359 ?auto_26370 ) ) ( not ( = ?auto_26360 ?auto_26362 ) ) ( not ( = ?auto_26360 ?auto_26370 ) ) ( not ( = ?auto_26362 ?auto_26376 ) ) ( not ( = ?auto_26362 ?auto_26377 ) ) ( not ( = ?auto_26362 ?auto_26372 ) ) ( not ( = ?auto_26370 ?auto_26376 ) ) ( not ( = ?auto_26370 ?auto_26377 ) ) ( not ( = ?auto_26370 ?auto_26372 ) ) ( not ( = ?auto_26358 ?auto_26363 ) ) ( not ( = ?auto_26358 ?auto_26369 ) ) ( not ( = ?auto_26359 ?auto_26363 ) ) ( not ( = ?auto_26359 ?auto_26369 ) ) ( not ( = ?auto_26360 ?auto_26363 ) ) ( not ( = ?auto_26360 ?auto_26369 ) ) ( not ( = ?auto_26361 ?auto_26363 ) ) ( not ( = ?auto_26361 ?auto_26369 ) ) ( not ( = ?auto_26363 ?auto_26370 ) ) ( not ( = ?auto_26363 ?auto_26376 ) ) ( not ( = ?auto_26363 ?auto_26377 ) ) ( not ( = ?auto_26363 ?auto_26372 ) ) ( not ( = ?auto_26368 ?auto_26371 ) ) ( not ( = ?auto_26368 ?auto_26378 ) ) ( not ( = ?auto_26368 ?auto_26374 ) ) ( not ( = ?auto_26367 ?auto_26375 ) ) ( not ( = ?auto_26367 ?auto_26379 ) ) ( not ( = ?auto_26367 ?auto_26373 ) ) ( not ( = ?auto_26369 ?auto_26370 ) ) ( not ( = ?auto_26369 ?auto_26376 ) ) ( not ( = ?auto_26369 ?auto_26377 ) ) ( not ( = ?auto_26369 ?auto_26372 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_26358 ?auto_26359 ?auto_26360 ?auto_26361 ?auto_26362 )
      ( MAKE-1CRATE ?auto_26362 ?auto_26363 )
      ( MAKE-5CRATE-VERIFY ?auto_26358 ?auto_26359 ?auto_26360 ?auto_26361 ?auto_26362 ?auto_26363 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26382 - SURFACE
      ?auto_26383 - SURFACE
    )
    :vars
    (
      ?auto_26384 - HOIST
      ?auto_26385 - PLACE
      ?auto_26387 - PLACE
      ?auto_26388 - HOIST
      ?auto_26389 - SURFACE
      ?auto_26386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26384 ?auto_26385 ) ( SURFACE-AT ?auto_26382 ?auto_26385 ) ( CLEAR ?auto_26382 ) ( IS-CRATE ?auto_26383 ) ( AVAILABLE ?auto_26384 ) ( not ( = ?auto_26387 ?auto_26385 ) ) ( HOIST-AT ?auto_26388 ?auto_26387 ) ( AVAILABLE ?auto_26388 ) ( SURFACE-AT ?auto_26383 ?auto_26387 ) ( ON ?auto_26383 ?auto_26389 ) ( CLEAR ?auto_26383 ) ( TRUCK-AT ?auto_26386 ?auto_26385 ) ( not ( = ?auto_26382 ?auto_26383 ) ) ( not ( = ?auto_26382 ?auto_26389 ) ) ( not ( = ?auto_26383 ?auto_26389 ) ) ( not ( = ?auto_26384 ?auto_26388 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26386 ?auto_26385 ?auto_26387 )
      ( !LIFT ?auto_26388 ?auto_26383 ?auto_26389 ?auto_26387 )
      ( !LOAD ?auto_26388 ?auto_26383 ?auto_26386 ?auto_26387 )
      ( !DRIVE ?auto_26386 ?auto_26387 ?auto_26385 )
      ( !UNLOAD ?auto_26384 ?auto_26383 ?auto_26386 ?auto_26385 )
      ( !DROP ?auto_26384 ?auto_26383 ?auto_26382 ?auto_26385 )
      ( MAKE-1CRATE-VERIFY ?auto_26382 ?auto_26383 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_26397 - SURFACE
      ?auto_26398 - SURFACE
      ?auto_26399 - SURFACE
      ?auto_26400 - SURFACE
      ?auto_26401 - SURFACE
      ?auto_26402 - SURFACE
      ?auto_26403 - SURFACE
    )
    :vars
    (
      ?auto_26409 - HOIST
      ?auto_26405 - PLACE
      ?auto_26406 - PLACE
      ?auto_26404 - HOIST
      ?auto_26407 - SURFACE
      ?auto_26420 - PLACE
      ?auto_26411 - HOIST
      ?auto_26421 - SURFACE
      ?auto_26419 - PLACE
      ?auto_26415 - HOIST
      ?auto_26414 - SURFACE
      ?auto_26417 - PLACE
      ?auto_26412 - HOIST
      ?auto_26418 - SURFACE
      ?auto_26422 - SURFACE
      ?auto_26413 - PLACE
      ?auto_26416 - HOIST
      ?auto_26410 - SURFACE
      ?auto_26408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26409 ?auto_26405 ) ( IS-CRATE ?auto_26403 ) ( not ( = ?auto_26406 ?auto_26405 ) ) ( HOIST-AT ?auto_26404 ?auto_26406 ) ( AVAILABLE ?auto_26404 ) ( SURFACE-AT ?auto_26403 ?auto_26406 ) ( ON ?auto_26403 ?auto_26407 ) ( CLEAR ?auto_26403 ) ( not ( = ?auto_26402 ?auto_26403 ) ) ( not ( = ?auto_26402 ?auto_26407 ) ) ( not ( = ?auto_26403 ?auto_26407 ) ) ( not ( = ?auto_26409 ?auto_26404 ) ) ( IS-CRATE ?auto_26402 ) ( not ( = ?auto_26420 ?auto_26405 ) ) ( HOIST-AT ?auto_26411 ?auto_26420 ) ( AVAILABLE ?auto_26411 ) ( SURFACE-AT ?auto_26402 ?auto_26420 ) ( ON ?auto_26402 ?auto_26421 ) ( CLEAR ?auto_26402 ) ( not ( = ?auto_26401 ?auto_26402 ) ) ( not ( = ?auto_26401 ?auto_26421 ) ) ( not ( = ?auto_26402 ?auto_26421 ) ) ( not ( = ?auto_26409 ?auto_26411 ) ) ( IS-CRATE ?auto_26401 ) ( not ( = ?auto_26419 ?auto_26405 ) ) ( HOIST-AT ?auto_26415 ?auto_26419 ) ( SURFACE-AT ?auto_26401 ?auto_26419 ) ( ON ?auto_26401 ?auto_26414 ) ( CLEAR ?auto_26401 ) ( not ( = ?auto_26400 ?auto_26401 ) ) ( not ( = ?auto_26400 ?auto_26414 ) ) ( not ( = ?auto_26401 ?auto_26414 ) ) ( not ( = ?auto_26409 ?auto_26415 ) ) ( IS-CRATE ?auto_26400 ) ( not ( = ?auto_26417 ?auto_26405 ) ) ( HOIST-AT ?auto_26412 ?auto_26417 ) ( AVAILABLE ?auto_26412 ) ( SURFACE-AT ?auto_26400 ?auto_26417 ) ( ON ?auto_26400 ?auto_26418 ) ( CLEAR ?auto_26400 ) ( not ( = ?auto_26399 ?auto_26400 ) ) ( not ( = ?auto_26399 ?auto_26418 ) ) ( not ( = ?auto_26400 ?auto_26418 ) ) ( not ( = ?auto_26409 ?auto_26412 ) ) ( IS-CRATE ?auto_26399 ) ( AVAILABLE ?auto_26415 ) ( SURFACE-AT ?auto_26399 ?auto_26419 ) ( ON ?auto_26399 ?auto_26422 ) ( CLEAR ?auto_26399 ) ( not ( = ?auto_26398 ?auto_26399 ) ) ( not ( = ?auto_26398 ?auto_26422 ) ) ( not ( = ?auto_26399 ?auto_26422 ) ) ( SURFACE-AT ?auto_26397 ?auto_26405 ) ( CLEAR ?auto_26397 ) ( IS-CRATE ?auto_26398 ) ( AVAILABLE ?auto_26409 ) ( not ( = ?auto_26413 ?auto_26405 ) ) ( HOIST-AT ?auto_26416 ?auto_26413 ) ( AVAILABLE ?auto_26416 ) ( SURFACE-AT ?auto_26398 ?auto_26413 ) ( ON ?auto_26398 ?auto_26410 ) ( CLEAR ?auto_26398 ) ( TRUCK-AT ?auto_26408 ?auto_26405 ) ( not ( = ?auto_26397 ?auto_26398 ) ) ( not ( = ?auto_26397 ?auto_26410 ) ) ( not ( = ?auto_26398 ?auto_26410 ) ) ( not ( = ?auto_26409 ?auto_26416 ) ) ( not ( = ?auto_26397 ?auto_26399 ) ) ( not ( = ?auto_26397 ?auto_26422 ) ) ( not ( = ?auto_26399 ?auto_26410 ) ) ( not ( = ?auto_26419 ?auto_26413 ) ) ( not ( = ?auto_26415 ?auto_26416 ) ) ( not ( = ?auto_26422 ?auto_26410 ) ) ( not ( = ?auto_26397 ?auto_26400 ) ) ( not ( = ?auto_26397 ?auto_26418 ) ) ( not ( = ?auto_26398 ?auto_26400 ) ) ( not ( = ?auto_26398 ?auto_26418 ) ) ( not ( = ?auto_26400 ?auto_26422 ) ) ( not ( = ?auto_26400 ?auto_26410 ) ) ( not ( = ?auto_26417 ?auto_26419 ) ) ( not ( = ?auto_26417 ?auto_26413 ) ) ( not ( = ?auto_26412 ?auto_26415 ) ) ( not ( = ?auto_26412 ?auto_26416 ) ) ( not ( = ?auto_26418 ?auto_26422 ) ) ( not ( = ?auto_26418 ?auto_26410 ) ) ( not ( = ?auto_26397 ?auto_26401 ) ) ( not ( = ?auto_26397 ?auto_26414 ) ) ( not ( = ?auto_26398 ?auto_26401 ) ) ( not ( = ?auto_26398 ?auto_26414 ) ) ( not ( = ?auto_26399 ?auto_26401 ) ) ( not ( = ?auto_26399 ?auto_26414 ) ) ( not ( = ?auto_26401 ?auto_26418 ) ) ( not ( = ?auto_26401 ?auto_26422 ) ) ( not ( = ?auto_26401 ?auto_26410 ) ) ( not ( = ?auto_26414 ?auto_26418 ) ) ( not ( = ?auto_26414 ?auto_26422 ) ) ( not ( = ?auto_26414 ?auto_26410 ) ) ( not ( = ?auto_26397 ?auto_26402 ) ) ( not ( = ?auto_26397 ?auto_26421 ) ) ( not ( = ?auto_26398 ?auto_26402 ) ) ( not ( = ?auto_26398 ?auto_26421 ) ) ( not ( = ?auto_26399 ?auto_26402 ) ) ( not ( = ?auto_26399 ?auto_26421 ) ) ( not ( = ?auto_26400 ?auto_26402 ) ) ( not ( = ?auto_26400 ?auto_26421 ) ) ( not ( = ?auto_26402 ?auto_26414 ) ) ( not ( = ?auto_26402 ?auto_26418 ) ) ( not ( = ?auto_26402 ?auto_26422 ) ) ( not ( = ?auto_26402 ?auto_26410 ) ) ( not ( = ?auto_26420 ?auto_26419 ) ) ( not ( = ?auto_26420 ?auto_26417 ) ) ( not ( = ?auto_26420 ?auto_26413 ) ) ( not ( = ?auto_26411 ?auto_26415 ) ) ( not ( = ?auto_26411 ?auto_26412 ) ) ( not ( = ?auto_26411 ?auto_26416 ) ) ( not ( = ?auto_26421 ?auto_26414 ) ) ( not ( = ?auto_26421 ?auto_26418 ) ) ( not ( = ?auto_26421 ?auto_26422 ) ) ( not ( = ?auto_26421 ?auto_26410 ) ) ( not ( = ?auto_26397 ?auto_26403 ) ) ( not ( = ?auto_26397 ?auto_26407 ) ) ( not ( = ?auto_26398 ?auto_26403 ) ) ( not ( = ?auto_26398 ?auto_26407 ) ) ( not ( = ?auto_26399 ?auto_26403 ) ) ( not ( = ?auto_26399 ?auto_26407 ) ) ( not ( = ?auto_26400 ?auto_26403 ) ) ( not ( = ?auto_26400 ?auto_26407 ) ) ( not ( = ?auto_26401 ?auto_26403 ) ) ( not ( = ?auto_26401 ?auto_26407 ) ) ( not ( = ?auto_26403 ?auto_26421 ) ) ( not ( = ?auto_26403 ?auto_26414 ) ) ( not ( = ?auto_26403 ?auto_26418 ) ) ( not ( = ?auto_26403 ?auto_26422 ) ) ( not ( = ?auto_26403 ?auto_26410 ) ) ( not ( = ?auto_26406 ?auto_26420 ) ) ( not ( = ?auto_26406 ?auto_26419 ) ) ( not ( = ?auto_26406 ?auto_26417 ) ) ( not ( = ?auto_26406 ?auto_26413 ) ) ( not ( = ?auto_26404 ?auto_26411 ) ) ( not ( = ?auto_26404 ?auto_26415 ) ) ( not ( = ?auto_26404 ?auto_26412 ) ) ( not ( = ?auto_26404 ?auto_26416 ) ) ( not ( = ?auto_26407 ?auto_26421 ) ) ( not ( = ?auto_26407 ?auto_26414 ) ) ( not ( = ?auto_26407 ?auto_26418 ) ) ( not ( = ?auto_26407 ?auto_26422 ) ) ( not ( = ?auto_26407 ?auto_26410 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_26397 ?auto_26398 ?auto_26399 ?auto_26400 ?auto_26401 ?auto_26402 )
      ( MAKE-1CRATE ?auto_26402 ?auto_26403 )
      ( MAKE-6CRATE-VERIFY ?auto_26397 ?auto_26398 ?auto_26399 ?auto_26400 ?auto_26401 ?auto_26402 ?auto_26403 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26425 - SURFACE
      ?auto_26426 - SURFACE
    )
    :vars
    (
      ?auto_26427 - HOIST
      ?auto_26428 - PLACE
      ?auto_26430 - PLACE
      ?auto_26431 - HOIST
      ?auto_26432 - SURFACE
      ?auto_26429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26427 ?auto_26428 ) ( SURFACE-AT ?auto_26425 ?auto_26428 ) ( CLEAR ?auto_26425 ) ( IS-CRATE ?auto_26426 ) ( AVAILABLE ?auto_26427 ) ( not ( = ?auto_26430 ?auto_26428 ) ) ( HOIST-AT ?auto_26431 ?auto_26430 ) ( AVAILABLE ?auto_26431 ) ( SURFACE-AT ?auto_26426 ?auto_26430 ) ( ON ?auto_26426 ?auto_26432 ) ( CLEAR ?auto_26426 ) ( TRUCK-AT ?auto_26429 ?auto_26428 ) ( not ( = ?auto_26425 ?auto_26426 ) ) ( not ( = ?auto_26425 ?auto_26432 ) ) ( not ( = ?auto_26426 ?auto_26432 ) ) ( not ( = ?auto_26427 ?auto_26431 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26429 ?auto_26428 ?auto_26430 )
      ( !LIFT ?auto_26431 ?auto_26426 ?auto_26432 ?auto_26430 )
      ( !LOAD ?auto_26431 ?auto_26426 ?auto_26429 ?auto_26430 )
      ( !DRIVE ?auto_26429 ?auto_26430 ?auto_26428 )
      ( !UNLOAD ?auto_26427 ?auto_26426 ?auto_26429 ?auto_26428 )
      ( !DROP ?auto_26427 ?auto_26426 ?auto_26425 ?auto_26428 )
      ( MAKE-1CRATE-VERIFY ?auto_26425 ?auto_26426 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_26441 - SURFACE
      ?auto_26442 - SURFACE
      ?auto_26443 - SURFACE
      ?auto_26444 - SURFACE
      ?auto_26445 - SURFACE
      ?auto_26446 - SURFACE
      ?auto_26447 - SURFACE
      ?auto_26448 - SURFACE
    )
    :vars
    (
      ?auto_26449 - HOIST
      ?auto_26454 - PLACE
      ?auto_26452 - PLACE
      ?auto_26450 - HOIST
      ?auto_26453 - SURFACE
      ?auto_26467 - PLACE
      ?auto_26468 - HOIST
      ?auto_26461 - SURFACE
      ?auto_26458 - PLACE
      ?auto_26470 - HOIST
      ?auto_26457 - SURFACE
      ?auto_26456 - PLACE
      ?auto_26459 - HOIST
      ?auto_26460 - SURFACE
      ?auto_26464 - PLACE
      ?auto_26462 - HOIST
      ?auto_26463 - SURFACE
      ?auto_26466 - SURFACE
      ?auto_26469 - PLACE
      ?auto_26465 - HOIST
      ?auto_26455 - SURFACE
      ?auto_26451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26449 ?auto_26454 ) ( IS-CRATE ?auto_26448 ) ( not ( = ?auto_26452 ?auto_26454 ) ) ( HOIST-AT ?auto_26450 ?auto_26452 ) ( AVAILABLE ?auto_26450 ) ( SURFACE-AT ?auto_26448 ?auto_26452 ) ( ON ?auto_26448 ?auto_26453 ) ( CLEAR ?auto_26448 ) ( not ( = ?auto_26447 ?auto_26448 ) ) ( not ( = ?auto_26447 ?auto_26453 ) ) ( not ( = ?auto_26448 ?auto_26453 ) ) ( not ( = ?auto_26449 ?auto_26450 ) ) ( IS-CRATE ?auto_26447 ) ( not ( = ?auto_26467 ?auto_26454 ) ) ( HOIST-AT ?auto_26468 ?auto_26467 ) ( AVAILABLE ?auto_26468 ) ( SURFACE-AT ?auto_26447 ?auto_26467 ) ( ON ?auto_26447 ?auto_26461 ) ( CLEAR ?auto_26447 ) ( not ( = ?auto_26446 ?auto_26447 ) ) ( not ( = ?auto_26446 ?auto_26461 ) ) ( not ( = ?auto_26447 ?auto_26461 ) ) ( not ( = ?auto_26449 ?auto_26468 ) ) ( IS-CRATE ?auto_26446 ) ( not ( = ?auto_26458 ?auto_26454 ) ) ( HOIST-AT ?auto_26470 ?auto_26458 ) ( AVAILABLE ?auto_26470 ) ( SURFACE-AT ?auto_26446 ?auto_26458 ) ( ON ?auto_26446 ?auto_26457 ) ( CLEAR ?auto_26446 ) ( not ( = ?auto_26445 ?auto_26446 ) ) ( not ( = ?auto_26445 ?auto_26457 ) ) ( not ( = ?auto_26446 ?auto_26457 ) ) ( not ( = ?auto_26449 ?auto_26470 ) ) ( IS-CRATE ?auto_26445 ) ( not ( = ?auto_26456 ?auto_26454 ) ) ( HOIST-AT ?auto_26459 ?auto_26456 ) ( SURFACE-AT ?auto_26445 ?auto_26456 ) ( ON ?auto_26445 ?auto_26460 ) ( CLEAR ?auto_26445 ) ( not ( = ?auto_26444 ?auto_26445 ) ) ( not ( = ?auto_26444 ?auto_26460 ) ) ( not ( = ?auto_26445 ?auto_26460 ) ) ( not ( = ?auto_26449 ?auto_26459 ) ) ( IS-CRATE ?auto_26444 ) ( not ( = ?auto_26464 ?auto_26454 ) ) ( HOIST-AT ?auto_26462 ?auto_26464 ) ( AVAILABLE ?auto_26462 ) ( SURFACE-AT ?auto_26444 ?auto_26464 ) ( ON ?auto_26444 ?auto_26463 ) ( CLEAR ?auto_26444 ) ( not ( = ?auto_26443 ?auto_26444 ) ) ( not ( = ?auto_26443 ?auto_26463 ) ) ( not ( = ?auto_26444 ?auto_26463 ) ) ( not ( = ?auto_26449 ?auto_26462 ) ) ( IS-CRATE ?auto_26443 ) ( AVAILABLE ?auto_26459 ) ( SURFACE-AT ?auto_26443 ?auto_26456 ) ( ON ?auto_26443 ?auto_26466 ) ( CLEAR ?auto_26443 ) ( not ( = ?auto_26442 ?auto_26443 ) ) ( not ( = ?auto_26442 ?auto_26466 ) ) ( not ( = ?auto_26443 ?auto_26466 ) ) ( SURFACE-AT ?auto_26441 ?auto_26454 ) ( CLEAR ?auto_26441 ) ( IS-CRATE ?auto_26442 ) ( AVAILABLE ?auto_26449 ) ( not ( = ?auto_26469 ?auto_26454 ) ) ( HOIST-AT ?auto_26465 ?auto_26469 ) ( AVAILABLE ?auto_26465 ) ( SURFACE-AT ?auto_26442 ?auto_26469 ) ( ON ?auto_26442 ?auto_26455 ) ( CLEAR ?auto_26442 ) ( TRUCK-AT ?auto_26451 ?auto_26454 ) ( not ( = ?auto_26441 ?auto_26442 ) ) ( not ( = ?auto_26441 ?auto_26455 ) ) ( not ( = ?auto_26442 ?auto_26455 ) ) ( not ( = ?auto_26449 ?auto_26465 ) ) ( not ( = ?auto_26441 ?auto_26443 ) ) ( not ( = ?auto_26441 ?auto_26466 ) ) ( not ( = ?auto_26443 ?auto_26455 ) ) ( not ( = ?auto_26456 ?auto_26469 ) ) ( not ( = ?auto_26459 ?auto_26465 ) ) ( not ( = ?auto_26466 ?auto_26455 ) ) ( not ( = ?auto_26441 ?auto_26444 ) ) ( not ( = ?auto_26441 ?auto_26463 ) ) ( not ( = ?auto_26442 ?auto_26444 ) ) ( not ( = ?auto_26442 ?auto_26463 ) ) ( not ( = ?auto_26444 ?auto_26466 ) ) ( not ( = ?auto_26444 ?auto_26455 ) ) ( not ( = ?auto_26464 ?auto_26456 ) ) ( not ( = ?auto_26464 ?auto_26469 ) ) ( not ( = ?auto_26462 ?auto_26459 ) ) ( not ( = ?auto_26462 ?auto_26465 ) ) ( not ( = ?auto_26463 ?auto_26466 ) ) ( not ( = ?auto_26463 ?auto_26455 ) ) ( not ( = ?auto_26441 ?auto_26445 ) ) ( not ( = ?auto_26441 ?auto_26460 ) ) ( not ( = ?auto_26442 ?auto_26445 ) ) ( not ( = ?auto_26442 ?auto_26460 ) ) ( not ( = ?auto_26443 ?auto_26445 ) ) ( not ( = ?auto_26443 ?auto_26460 ) ) ( not ( = ?auto_26445 ?auto_26463 ) ) ( not ( = ?auto_26445 ?auto_26466 ) ) ( not ( = ?auto_26445 ?auto_26455 ) ) ( not ( = ?auto_26460 ?auto_26463 ) ) ( not ( = ?auto_26460 ?auto_26466 ) ) ( not ( = ?auto_26460 ?auto_26455 ) ) ( not ( = ?auto_26441 ?auto_26446 ) ) ( not ( = ?auto_26441 ?auto_26457 ) ) ( not ( = ?auto_26442 ?auto_26446 ) ) ( not ( = ?auto_26442 ?auto_26457 ) ) ( not ( = ?auto_26443 ?auto_26446 ) ) ( not ( = ?auto_26443 ?auto_26457 ) ) ( not ( = ?auto_26444 ?auto_26446 ) ) ( not ( = ?auto_26444 ?auto_26457 ) ) ( not ( = ?auto_26446 ?auto_26460 ) ) ( not ( = ?auto_26446 ?auto_26463 ) ) ( not ( = ?auto_26446 ?auto_26466 ) ) ( not ( = ?auto_26446 ?auto_26455 ) ) ( not ( = ?auto_26458 ?auto_26456 ) ) ( not ( = ?auto_26458 ?auto_26464 ) ) ( not ( = ?auto_26458 ?auto_26469 ) ) ( not ( = ?auto_26470 ?auto_26459 ) ) ( not ( = ?auto_26470 ?auto_26462 ) ) ( not ( = ?auto_26470 ?auto_26465 ) ) ( not ( = ?auto_26457 ?auto_26460 ) ) ( not ( = ?auto_26457 ?auto_26463 ) ) ( not ( = ?auto_26457 ?auto_26466 ) ) ( not ( = ?auto_26457 ?auto_26455 ) ) ( not ( = ?auto_26441 ?auto_26447 ) ) ( not ( = ?auto_26441 ?auto_26461 ) ) ( not ( = ?auto_26442 ?auto_26447 ) ) ( not ( = ?auto_26442 ?auto_26461 ) ) ( not ( = ?auto_26443 ?auto_26447 ) ) ( not ( = ?auto_26443 ?auto_26461 ) ) ( not ( = ?auto_26444 ?auto_26447 ) ) ( not ( = ?auto_26444 ?auto_26461 ) ) ( not ( = ?auto_26445 ?auto_26447 ) ) ( not ( = ?auto_26445 ?auto_26461 ) ) ( not ( = ?auto_26447 ?auto_26457 ) ) ( not ( = ?auto_26447 ?auto_26460 ) ) ( not ( = ?auto_26447 ?auto_26463 ) ) ( not ( = ?auto_26447 ?auto_26466 ) ) ( not ( = ?auto_26447 ?auto_26455 ) ) ( not ( = ?auto_26467 ?auto_26458 ) ) ( not ( = ?auto_26467 ?auto_26456 ) ) ( not ( = ?auto_26467 ?auto_26464 ) ) ( not ( = ?auto_26467 ?auto_26469 ) ) ( not ( = ?auto_26468 ?auto_26470 ) ) ( not ( = ?auto_26468 ?auto_26459 ) ) ( not ( = ?auto_26468 ?auto_26462 ) ) ( not ( = ?auto_26468 ?auto_26465 ) ) ( not ( = ?auto_26461 ?auto_26457 ) ) ( not ( = ?auto_26461 ?auto_26460 ) ) ( not ( = ?auto_26461 ?auto_26463 ) ) ( not ( = ?auto_26461 ?auto_26466 ) ) ( not ( = ?auto_26461 ?auto_26455 ) ) ( not ( = ?auto_26441 ?auto_26448 ) ) ( not ( = ?auto_26441 ?auto_26453 ) ) ( not ( = ?auto_26442 ?auto_26448 ) ) ( not ( = ?auto_26442 ?auto_26453 ) ) ( not ( = ?auto_26443 ?auto_26448 ) ) ( not ( = ?auto_26443 ?auto_26453 ) ) ( not ( = ?auto_26444 ?auto_26448 ) ) ( not ( = ?auto_26444 ?auto_26453 ) ) ( not ( = ?auto_26445 ?auto_26448 ) ) ( not ( = ?auto_26445 ?auto_26453 ) ) ( not ( = ?auto_26446 ?auto_26448 ) ) ( not ( = ?auto_26446 ?auto_26453 ) ) ( not ( = ?auto_26448 ?auto_26461 ) ) ( not ( = ?auto_26448 ?auto_26457 ) ) ( not ( = ?auto_26448 ?auto_26460 ) ) ( not ( = ?auto_26448 ?auto_26463 ) ) ( not ( = ?auto_26448 ?auto_26466 ) ) ( not ( = ?auto_26448 ?auto_26455 ) ) ( not ( = ?auto_26452 ?auto_26467 ) ) ( not ( = ?auto_26452 ?auto_26458 ) ) ( not ( = ?auto_26452 ?auto_26456 ) ) ( not ( = ?auto_26452 ?auto_26464 ) ) ( not ( = ?auto_26452 ?auto_26469 ) ) ( not ( = ?auto_26450 ?auto_26468 ) ) ( not ( = ?auto_26450 ?auto_26470 ) ) ( not ( = ?auto_26450 ?auto_26459 ) ) ( not ( = ?auto_26450 ?auto_26462 ) ) ( not ( = ?auto_26450 ?auto_26465 ) ) ( not ( = ?auto_26453 ?auto_26461 ) ) ( not ( = ?auto_26453 ?auto_26457 ) ) ( not ( = ?auto_26453 ?auto_26460 ) ) ( not ( = ?auto_26453 ?auto_26463 ) ) ( not ( = ?auto_26453 ?auto_26466 ) ) ( not ( = ?auto_26453 ?auto_26455 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_26441 ?auto_26442 ?auto_26443 ?auto_26444 ?auto_26445 ?auto_26446 ?auto_26447 )
      ( MAKE-1CRATE ?auto_26447 ?auto_26448 )
      ( MAKE-7CRATE-VERIFY ?auto_26441 ?auto_26442 ?auto_26443 ?auto_26444 ?auto_26445 ?auto_26446 ?auto_26447 ?auto_26448 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26473 - SURFACE
      ?auto_26474 - SURFACE
    )
    :vars
    (
      ?auto_26475 - HOIST
      ?auto_26476 - PLACE
      ?auto_26478 - PLACE
      ?auto_26479 - HOIST
      ?auto_26480 - SURFACE
      ?auto_26477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26475 ?auto_26476 ) ( SURFACE-AT ?auto_26473 ?auto_26476 ) ( CLEAR ?auto_26473 ) ( IS-CRATE ?auto_26474 ) ( AVAILABLE ?auto_26475 ) ( not ( = ?auto_26478 ?auto_26476 ) ) ( HOIST-AT ?auto_26479 ?auto_26478 ) ( AVAILABLE ?auto_26479 ) ( SURFACE-AT ?auto_26474 ?auto_26478 ) ( ON ?auto_26474 ?auto_26480 ) ( CLEAR ?auto_26474 ) ( TRUCK-AT ?auto_26477 ?auto_26476 ) ( not ( = ?auto_26473 ?auto_26474 ) ) ( not ( = ?auto_26473 ?auto_26480 ) ) ( not ( = ?auto_26474 ?auto_26480 ) ) ( not ( = ?auto_26475 ?auto_26479 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26477 ?auto_26476 ?auto_26478 )
      ( !LIFT ?auto_26479 ?auto_26474 ?auto_26480 ?auto_26478 )
      ( !LOAD ?auto_26479 ?auto_26474 ?auto_26477 ?auto_26478 )
      ( !DRIVE ?auto_26477 ?auto_26478 ?auto_26476 )
      ( !UNLOAD ?auto_26475 ?auto_26474 ?auto_26477 ?auto_26476 )
      ( !DROP ?auto_26475 ?auto_26474 ?auto_26473 ?auto_26476 )
      ( MAKE-1CRATE-VERIFY ?auto_26473 ?auto_26474 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_26490 - SURFACE
      ?auto_26491 - SURFACE
      ?auto_26492 - SURFACE
      ?auto_26493 - SURFACE
      ?auto_26494 - SURFACE
      ?auto_26495 - SURFACE
      ?auto_26496 - SURFACE
      ?auto_26498 - SURFACE
      ?auto_26497 - SURFACE
    )
    :vars
    (
      ?auto_26499 - HOIST
      ?auto_26504 - PLACE
      ?auto_26500 - PLACE
      ?auto_26501 - HOIST
      ?auto_26503 - SURFACE
      ?auto_26508 - PLACE
      ?auto_26522 - HOIST
      ?auto_26523 - SURFACE
      ?auto_26515 - PLACE
      ?auto_26516 - HOIST
      ?auto_26518 - SURFACE
      ?auto_26506 - PLACE
      ?auto_26510 - HOIST
      ?auto_26520 - SURFACE
      ?auto_26507 - PLACE
      ?auto_26505 - HOIST
      ?auto_26519 - SURFACE
      ?auto_26513 - PLACE
      ?auto_26517 - HOIST
      ?auto_26511 - SURFACE
      ?auto_26514 - SURFACE
      ?auto_26521 - PLACE
      ?auto_26512 - HOIST
      ?auto_26509 - SURFACE
      ?auto_26502 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26499 ?auto_26504 ) ( IS-CRATE ?auto_26497 ) ( not ( = ?auto_26500 ?auto_26504 ) ) ( HOIST-AT ?auto_26501 ?auto_26500 ) ( AVAILABLE ?auto_26501 ) ( SURFACE-AT ?auto_26497 ?auto_26500 ) ( ON ?auto_26497 ?auto_26503 ) ( CLEAR ?auto_26497 ) ( not ( = ?auto_26498 ?auto_26497 ) ) ( not ( = ?auto_26498 ?auto_26503 ) ) ( not ( = ?auto_26497 ?auto_26503 ) ) ( not ( = ?auto_26499 ?auto_26501 ) ) ( IS-CRATE ?auto_26498 ) ( not ( = ?auto_26508 ?auto_26504 ) ) ( HOIST-AT ?auto_26522 ?auto_26508 ) ( AVAILABLE ?auto_26522 ) ( SURFACE-AT ?auto_26498 ?auto_26508 ) ( ON ?auto_26498 ?auto_26523 ) ( CLEAR ?auto_26498 ) ( not ( = ?auto_26496 ?auto_26498 ) ) ( not ( = ?auto_26496 ?auto_26523 ) ) ( not ( = ?auto_26498 ?auto_26523 ) ) ( not ( = ?auto_26499 ?auto_26522 ) ) ( IS-CRATE ?auto_26496 ) ( not ( = ?auto_26515 ?auto_26504 ) ) ( HOIST-AT ?auto_26516 ?auto_26515 ) ( AVAILABLE ?auto_26516 ) ( SURFACE-AT ?auto_26496 ?auto_26515 ) ( ON ?auto_26496 ?auto_26518 ) ( CLEAR ?auto_26496 ) ( not ( = ?auto_26495 ?auto_26496 ) ) ( not ( = ?auto_26495 ?auto_26518 ) ) ( not ( = ?auto_26496 ?auto_26518 ) ) ( not ( = ?auto_26499 ?auto_26516 ) ) ( IS-CRATE ?auto_26495 ) ( not ( = ?auto_26506 ?auto_26504 ) ) ( HOIST-AT ?auto_26510 ?auto_26506 ) ( AVAILABLE ?auto_26510 ) ( SURFACE-AT ?auto_26495 ?auto_26506 ) ( ON ?auto_26495 ?auto_26520 ) ( CLEAR ?auto_26495 ) ( not ( = ?auto_26494 ?auto_26495 ) ) ( not ( = ?auto_26494 ?auto_26520 ) ) ( not ( = ?auto_26495 ?auto_26520 ) ) ( not ( = ?auto_26499 ?auto_26510 ) ) ( IS-CRATE ?auto_26494 ) ( not ( = ?auto_26507 ?auto_26504 ) ) ( HOIST-AT ?auto_26505 ?auto_26507 ) ( SURFACE-AT ?auto_26494 ?auto_26507 ) ( ON ?auto_26494 ?auto_26519 ) ( CLEAR ?auto_26494 ) ( not ( = ?auto_26493 ?auto_26494 ) ) ( not ( = ?auto_26493 ?auto_26519 ) ) ( not ( = ?auto_26494 ?auto_26519 ) ) ( not ( = ?auto_26499 ?auto_26505 ) ) ( IS-CRATE ?auto_26493 ) ( not ( = ?auto_26513 ?auto_26504 ) ) ( HOIST-AT ?auto_26517 ?auto_26513 ) ( AVAILABLE ?auto_26517 ) ( SURFACE-AT ?auto_26493 ?auto_26513 ) ( ON ?auto_26493 ?auto_26511 ) ( CLEAR ?auto_26493 ) ( not ( = ?auto_26492 ?auto_26493 ) ) ( not ( = ?auto_26492 ?auto_26511 ) ) ( not ( = ?auto_26493 ?auto_26511 ) ) ( not ( = ?auto_26499 ?auto_26517 ) ) ( IS-CRATE ?auto_26492 ) ( AVAILABLE ?auto_26505 ) ( SURFACE-AT ?auto_26492 ?auto_26507 ) ( ON ?auto_26492 ?auto_26514 ) ( CLEAR ?auto_26492 ) ( not ( = ?auto_26491 ?auto_26492 ) ) ( not ( = ?auto_26491 ?auto_26514 ) ) ( not ( = ?auto_26492 ?auto_26514 ) ) ( SURFACE-AT ?auto_26490 ?auto_26504 ) ( CLEAR ?auto_26490 ) ( IS-CRATE ?auto_26491 ) ( AVAILABLE ?auto_26499 ) ( not ( = ?auto_26521 ?auto_26504 ) ) ( HOIST-AT ?auto_26512 ?auto_26521 ) ( AVAILABLE ?auto_26512 ) ( SURFACE-AT ?auto_26491 ?auto_26521 ) ( ON ?auto_26491 ?auto_26509 ) ( CLEAR ?auto_26491 ) ( TRUCK-AT ?auto_26502 ?auto_26504 ) ( not ( = ?auto_26490 ?auto_26491 ) ) ( not ( = ?auto_26490 ?auto_26509 ) ) ( not ( = ?auto_26491 ?auto_26509 ) ) ( not ( = ?auto_26499 ?auto_26512 ) ) ( not ( = ?auto_26490 ?auto_26492 ) ) ( not ( = ?auto_26490 ?auto_26514 ) ) ( not ( = ?auto_26492 ?auto_26509 ) ) ( not ( = ?auto_26507 ?auto_26521 ) ) ( not ( = ?auto_26505 ?auto_26512 ) ) ( not ( = ?auto_26514 ?auto_26509 ) ) ( not ( = ?auto_26490 ?auto_26493 ) ) ( not ( = ?auto_26490 ?auto_26511 ) ) ( not ( = ?auto_26491 ?auto_26493 ) ) ( not ( = ?auto_26491 ?auto_26511 ) ) ( not ( = ?auto_26493 ?auto_26514 ) ) ( not ( = ?auto_26493 ?auto_26509 ) ) ( not ( = ?auto_26513 ?auto_26507 ) ) ( not ( = ?auto_26513 ?auto_26521 ) ) ( not ( = ?auto_26517 ?auto_26505 ) ) ( not ( = ?auto_26517 ?auto_26512 ) ) ( not ( = ?auto_26511 ?auto_26514 ) ) ( not ( = ?auto_26511 ?auto_26509 ) ) ( not ( = ?auto_26490 ?auto_26494 ) ) ( not ( = ?auto_26490 ?auto_26519 ) ) ( not ( = ?auto_26491 ?auto_26494 ) ) ( not ( = ?auto_26491 ?auto_26519 ) ) ( not ( = ?auto_26492 ?auto_26494 ) ) ( not ( = ?auto_26492 ?auto_26519 ) ) ( not ( = ?auto_26494 ?auto_26511 ) ) ( not ( = ?auto_26494 ?auto_26514 ) ) ( not ( = ?auto_26494 ?auto_26509 ) ) ( not ( = ?auto_26519 ?auto_26511 ) ) ( not ( = ?auto_26519 ?auto_26514 ) ) ( not ( = ?auto_26519 ?auto_26509 ) ) ( not ( = ?auto_26490 ?auto_26495 ) ) ( not ( = ?auto_26490 ?auto_26520 ) ) ( not ( = ?auto_26491 ?auto_26495 ) ) ( not ( = ?auto_26491 ?auto_26520 ) ) ( not ( = ?auto_26492 ?auto_26495 ) ) ( not ( = ?auto_26492 ?auto_26520 ) ) ( not ( = ?auto_26493 ?auto_26495 ) ) ( not ( = ?auto_26493 ?auto_26520 ) ) ( not ( = ?auto_26495 ?auto_26519 ) ) ( not ( = ?auto_26495 ?auto_26511 ) ) ( not ( = ?auto_26495 ?auto_26514 ) ) ( not ( = ?auto_26495 ?auto_26509 ) ) ( not ( = ?auto_26506 ?auto_26507 ) ) ( not ( = ?auto_26506 ?auto_26513 ) ) ( not ( = ?auto_26506 ?auto_26521 ) ) ( not ( = ?auto_26510 ?auto_26505 ) ) ( not ( = ?auto_26510 ?auto_26517 ) ) ( not ( = ?auto_26510 ?auto_26512 ) ) ( not ( = ?auto_26520 ?auto_26519 ) ) ( not ( = ?auto_26520 ?auto_26511 ) ) ( not ( = ?auto_26520 ?auto_26514 ) ) ( not ( = ?auto_26520 ?auto_26509 ) ) ( not ( = ?auto_26490 ?auto_26496 ) ) ( not ( = ?auto_26490 ?auto_26518 ) ) ( not ( = ?auto_26491 ?auto_26496 ) ) ( not ( = ?auto_26491 ?auto_26518 ) ) ( not ( = ?auto_26492 ?auto_26496 ) ) ( not ( = ?auto_26492 ?auto_26518 ) ) ( not ( = ?auto_26493 ?auto_26496 ) ) ( not ( = ?auto_26493 ?auto_26518 ) ) ( not ( = ?auto_26494 ?auto_26496 ) ) ( not ( = ?auto_26494 ?auto_26518 ) ) ( not ( = ?auto_26496 ?auto_26520 ) ) ( not ( = ?auto_26496 ?auto_26519 ) ) ( not ( = ?auto_26496 ?auto_26511 ) ) ( not ( = ?auto_26496 ?auto_26514 ) ) ( not ( = ?auto_26496 ?auto_26509 ) ) ( not ( = ?auto_26515 ?auto_26506 ) ) ( not ( = ?auto_26515 ?auto_26507 ) ) ( not ( = ?auto_26515 ?auto_26513 ) ) ( not ( = ?auto_26515 ?auto_26521 ) ) ( not ( = ?auto_26516 ?auto_26510 ) ) ( not ( = ?auto_26516 ?auto_26505 ) ) ( not ( = ?auto_26516 ?auto_26517 ) ) ( not ( = ?auto_26516 ?auto_26512 ) ) ( not ( = ?auto_26518 ?auto_26520 ) ) ( not ( = ?auto_26518 ?auto_26519 ) ) ( not ( = ?auto_26518 ?auto_26511 ) ) ( not ( = ?auto_26518 ?auto_26514 ) ) ( not ( = ?auto_26518 ?auto_26509 ) ) ( not ( = ?auto_26490 ?auto_26498 ) ) ( not ( = ?auto_26490 ?auto_26523 ) ) ( not ( = ?auto_26491 ?auto_26498 ) ) ( not ( = ?auto_26491 ?auto_26523 ) ) ( not ( = ?auto_26492 ?auto_26498 ) ) ( not ( = ?auto_26492 ?auto_26523 ) ) ( not ( = ?auto_26493 ?auto_26498 ) ) ( not ( = ?auto_26493 ?auto_26523 ) ) ( not ( = ?auto_26494 ?auto_26498 ) ) ( not ( = ?auto_26494 ?auto_26523 ) ) ( not ( = ?auto_26495 ?auto_26498 ) ) ( not ( = ?auto_26495 ?auto_26523 ) ) ( not ( = ?auto_26498 ?auto_26518 ) ) ( not ( = ?auto_26498 ?auto_26520 ) ) ( not ( = ?auto_26498 ?auto_26519 ) ) ( not ( = ?auto_26498 ?auto_26511 ) ) ( not ( = ?auto_26498 ?auto_26514 ) ) ( not ( = ?auto_26498 ?auto_26509 ) ) ( not ( = ?auto_26508 ?auto_26515 ) ) ( not ( = ?auto_26508 ?auto_26506 ) ) ( not ( = ?auto_26508 ?auto_26507 ) ) ( not ( = ?auto_26508 ?auto_26513 ) ) ( not ( = ?auto_26508 ?auto_26521 ) ) ( not ( = ?auto_26522 ?auto_26516 ) ) ( not ( = ?auto_26522 ?auto_26510 ) ) ( not ( = ?auto_26522 ?auto_26505 ) ) ( not ( = ?auto_26522 ?auto_26517 ) ) ( not ( = ?auto_26522 ?auto_26512 ) ) ( not ( = ?auto_26523 ?auto_26518 ) ) ( not ( = ?auto_26523 ?auto_26520 ) ) ( not ( = ?auto_26523 ?auto_26519 ) ) ( not ( = ?auto_26523 ?auto_26511 ) ) ( not ( = ?auto_26523 ?auto_26514 ) ) ( not ( = ?auto_26523 ?auto_26509 ) ) ( not ( = ?auto_26490 ?auto_26497 ) ) ( not ( = ?auto_26490 ?auto_26503 ) ) ( not ( = ?auto_26491 ?auto_26497 ) ) ( not ( = ?auto_26491 ?auto_26503 ) ) ( not ( = ?auto_26492 ?auto_26497 ) ) ( not ( = ?auto_26492 ?auto_26503 ) ) ( not ( = ?auto_26493 ?auto_26497 ) ) ( not ( = ?auto_26493 ?auto_26503 ) ) ( not ( = ?auto_26494 ?auto_26497 ) ) ( not ( = ?auto_26494 ?auto_26503 ) ) ( not ( = ?auto_26495 ?auto_26497 ) ) ( not ( = ?auto_26495 ?auto_26503 ) ) ( not ( = ?auto_26496 ?auto_26497 ) ) ( not ( = ?auto_26496 ?auto_26503 ) ) ( not ( = ?auto_26497 ?auto_26523 ) ) ( not ( = ?auto_26497 ?auto_26518 ) ) ( not ( = ?auto_26497 ?auto_26520 ) ) ( not ( = ?auto_26497 ?auto_26519 ) ) ( not ( = ?auto_26497 ?auto_26511 ) ) ( not ( = ?auto_26497 ?auto_26514 ) ) ( not ( = ?auto_26497 ?auto_26509 ) ) ( not ( = ?auto_26500 ?auto_26508 ) ) ( not ( = ?auto_26500 ?auto_26515 ) ) ( not ( = ?auto_26500 ?auto_26506 ) ) ( not ( = ?auto_26500 ?auto_26507 ) ) ( not ( = ?auto_26500 ?auto_26513 ) ) ( not ( = ?auto_26500 ?auto_26521 ) ) ( not ( = ?auto_26501 ?auto_26522 ) ) ( not ( = ?auto_26501 ?auto_26516 ) ) ( not ( = ?auto_26501 ?auto_26510 ) ) ( not ( = ?auto_26501 ?auto_26505 ) ) ( not ( = ?auto_26501 ?auto_26517 ) ) ( not ( = ?auto_26501 ?auto_26512 ) ) ( not ( = ?auto_26503 ?auto_26523 ) ) ( not ( = ?auto_26503 ?auto_26518 ) ) ( not ( = ?auto_26503 ?auto_26520 ) ) ( not ( = ?auto_26503 ?auto_26519 ) ) ( not ( = ?auto_26503 ?auto_26511 ) ) ( not ( = ?auto_26503 ?auto_26514 ) ) ( not ( = ?auto_26503 ?auto_26509 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_26490 ?auto_26491 ?auto_26492 ?auto_26493 ?auto_26494 ?auto_26495 ?auto_26496 ?auto_26498 )
      ( MAKE-1CRATE ?auto_26498 ?auto_26497 )
      ( MAKE-8CRATE-VERIFY ?auto_26490 ?auto_26491 ?auto_26492 ?auto_26493 ?auto_26494 ?auto_26495 ?auto_26496 ?auto_26498 ?auto_26497 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26526 - SURFACE
      ?auto_26527 - SURFACE
    )
    :vars
    (
      ?auto_26528 - HOIST
      ?auto_26529 - PLACE
      ?auto_26531 - PLACE
      ?auto_26532 - HOIST
      ?auto_26533 - SURFACE
      ?auto_26530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26528 ?auto_26529 ) ( SURFACE-AT ?auto_26526 ?auto_26529 ) ( CLEAR ?auto_26526 ) ( IS-CRATE ?auto_26527 ) ( AVAILABLE ?auto_26528 ) ( not ( = ?auto_26531 ?auto_26529 ) ) ( HOIST-AT ?auto_26532 ?auto_26531 ) ( AVAILABLE ?auto_26532 ) ( SURFACE-AT ?auto_26527 ?auto_26531 ) ( ON ?auto_26527 ?auto_26533 ) ( CLEAR ?auto_26527 ) ( TRUCK-AT ?auto_26530 ?auto_26529 ) ( not ( = ?auto_26526 ?auto_26527 ) ) ( not ( = ?auto_26526 ?auto_26533 ) ) ( not ( = ?auto_26527 ?auto_26533 ) ) ( not ( = ?auto_26528 ?auto_26532 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26530 ?auto_26529 ?auto_26531 )
      ( !LIFT ?auto_26532 ?auto_26527 ?auto_26533 ?auto_26531 )
      ( !LOAD ?auto_26532 ?auto_26527 ?auto_26530 ?auto_26531 )
      ( !DRIVE ?auto_26530 ?auto_26531 ?auto_26529 )
      ( !UNLOAD ?auto_26528 ?auto_26527 ?auto_26530 ?auto_26529 )
      ( !DROP ?auto_26528 ?auto_26527 ?auto_26526 ?auto_26529 )
      ( MAKE-1CRATE-VERIFY ?auto_26526 ?auto_26527 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_26544 - SURFACE
      ?auto_26545 - SURFACE
      ?auto_26546 - SURFACE
      ?auto_26547 - SURFACE
      ?auto_26548 - SURFACE
      ?auto_26549 - SURFACE
      ?auto_26550 - SURFACE
      ?auto_26553 - SURFACE
      ?auto_26552 - SURFACE
      ?auto_26551 - SURFACE
    )
    :vars
    (
      ?auto_26555 - HOIST
      ?auto_26557 - PLACE
      ?auto_26554 - PLACE
      ?auto_26559 - HOIST
      ?auto_26558 - SURFACE
      ?auto_26570 - PLACE
      ?auto_26571 - HOIST
      ?auto_26572 - SURFACE
      ?auto_26574 - PLACE
      ?auto_26575 - HOIST
      ?auto_26577 - SURFACE
      ?auto_26561 - PLACE
      ?auto_26563 - HOIST
      ?auto_26565 - SURFACE
      ?auto_26573 - PLACE
      ?auto_26567 - HOIST
      ?auto_26578 - SURFACE
      ?auto_26560 - PLACE
      ?auto_26576 - HOIST
      ?auto_26569 - SURFACE
      ?auto_26579 - PLACE
      ?auto_26564 - HOIST
      ?auto_26566 - SURFACE
      ?auto_26562 - SURFACE
      ?auto_26568 - SURFACE
      ?auto_26556 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26555 ?auto_26557 ) ( IS-CRATE ?auto_26551 ) ( not ( = ?auto_26554 ?auto_26557 ) ) ( HOIST-AT ?auto_26559 ?auto_26554 ) ( SURFACE-AT ?auto_26551 ?auto_26554 ) ( ON ?auto_26551 ?auto_26558 ) ( CLEAR ?auto_26551 ) ( not ( = ?auto_26552 ?auto_26551 ) ) ( not ( = ?auto_26552 ?auto_26558 ) ) ( not ( = ?auto_26551 ?auto_26558 ) ) ( not ( = ?auto_26555 ?auto_26559 ) ) ( IS-CRATE ?auto_26552 ) ( not ( = ?auto_26570 ?auto_26557 ) ) ( HOIST-AT ?auto_26571 ?auto_26570 ) ( AVAILABLE ?auto_26571 ) ( SURFACE-AT ?auto_26552 ?auto_26570 ) ( ON ?auto_26552 ?auto_26572 ) ( CLEAR ?auto_26552 ) ( not ( = ?auto_26553 ?auto_26552 ) ) ( not ( = ?auto_26553 ?auto_26572 ) ) ( not ( = ?auto_26552 ?auto_26572 ) ) ( not ( = ?auto_26555 ?auto_26571 ) ) ( IS-CRATE ?auto_26553 ) ( not ( = ?auto_26574 ?auto_26557 ) ) ( HOIST-AT ?auto_26575 ?auto_26574 ) ( AVAILABLE ?auto_26575 ) ( SURFACE-AT ?auto_26553 ?auto_26574 ) ( ON ?auto_26553 ?auto_26577 ) ( CLEAR ?auto_26553 ) ( not ( = ?auto_26550 ?auto_26553 ) ) ( not ( = ?auto_26550 ?auto_26577 ) ) ( not ( = ?auto_26553 ?auto_26577 ) ) ( not ( = ?auto_26555 ?auto_26575 ) ) ( IS-CRATE ?auto_26550 ) ( not ( = ?auto_26561 ?auto_26557 ) ) ( HOIST-AT ?auto_26563 ?auto_26561 ) ( AVAILABLE ?auto_26563 ) ( SURFACE-AT ?auto_26550 ?auto_26561 ) ( ON ?auto_26550 ?auto_26565 ) ( CLEAR ?auto_26550 ) ( not ( = ?auto_26549 ?auto_26550 ) ) ( not ( = ?auto_26549 ?auto_26565 ) ) ( not ( = ?auto_26550 ?auto_26565 ) ) ( not ( = ?auto_26555 ?auto_26563 ) ) ( IS-CRATE ?auto_26549 ) ( not ( = ?auto_26573 ?auto_26557 ) ) ( HOIST-AT ?auto_26567 ?auto_26573 ) ( AVAILABLE ?auto_26567 ) ( SURFACE-AT ?auto_26549 ?auto_26573 ) ( ON ?auto_26549 ?auto_26578 ) ( CLEAR ?auto_26549 ) ( not ( = ?auto_26548 ?auto_26549 ) ) ( not ( = ?auto_26548 ?auto_26578 ) ) ( not ( = ?auto_26549 ?auto_26578 ) ) ( not ( = ?auto_26555 ?auto_26567 ) ) ( IS-CRATE ?auto_26548 ) ( not ( = ?auto_26560 ?auto_26557 ) ) ( HOIST-AT ?auto_26576 ?auto_26560 ) ( SURFACE-AT ?auto_26548 ?auto_26560 ) ( ON ?auto_26548 ?auto_26569 ) ( CLEAR ?auto_26548 ) ( not ( = ?auto_26547 ?auto_26548 ) ) ( not ( = ?auto_26547 ?auto_26569 ) ) ( not ( = ?auto_26548 ?auto_26569 ) ) ( not ( = ?auto_26555 ?auto_26576 ) ) ( IS-CRATE ?auto_26547 ) ( not ( = ?auto_26579 ?auto_26557 ) ) ( HOIST-AT ?auto_26564 ?auto_26579 ) ( AVAILABLE ?auto_26564 ) ( SURFACE-AT ?auto_26547 ?auto_26579 ) ( ON ?auto_26547 ?auto_26566 ) ( CLEAR ?auto_26547 ) ( not ( = ?auto_26546 ?auto_26547 ) ) ( not ( = ?auto_26546 ?auto_26566 ) ) ( not ( = ?auto_26547 ?auto_26566 ) ) ( not ( = ?auto_26555 ?auto_26564 ) ) ( IS-CRATE ?auto_26546 ) ( AVAILABLE ?auto_26576 ) ( SURFACE-AT ?auto_26546 ?auto_26560 ) ( ON ?auto_26546 ?auto_26562 ) ( CLEAR ?auto_26546 ) ( not ( = ?auto_26545 ?auto_26546 ) ) ( not ( = ?auto_26545 ?auto_26562 ) ) ( not ( = ?auto_26546 ?auto_26562 ) ) ( SURFACE-AT ?auto_26544 ?auto_26557 ) ( CLEAR ?auto_26544 ) ( IS-CRATE ?auto_26545 ) ( AVAILABLE ?auto_26555 ) ( AVAILABLE ?auto_26559 ) ( SURFACE-AT ?auto_26545 ?auto_26554 ) ( ON ?auto_26545 ?auto_26568 ) ( CLEAR ?auto_26545 ) ( TRUCK-AT ?auto_26556 ?auto_26557 ) ( not ( = ?auto_26544 ?auto_26545 ) ) ( not ( = ?auto_26544 ?auto_26568 ) ) ( not ( = ?auto_26545 ?auto_26568 ) ) ( not ( = ?auto_26544 ?auto_26546 ) ) ( not ( = ?auto_26544 ?auto_26562 ) ) ( not ( = ?auto_26546 ?auto_26568 ) ) ( not ( = ?auto_26560 ?auto_26554 ) ) ( not ( = ?auto_26576 ?auto_26559 ) ) ( not ( = ?auto_26562 ?auto_26568 ) ) ( not ( = ?auto_26544 ?auto_26547 ) ) ( not ( = ?auto_26544 ?auto_26566 ) ) ( not ( = ?auto_26545 ?auto_26547 ) ) ( not ( = ?auto_26545 ?auto_26566 ) ) ( not ( = ?auto_26547 ?auto_26562 ) ) ( not ( = ?auto_26547 ?auto_26568 ) ) ( not ( = ?auto_26579 ?auto_26560 ) ) ( not ( = ?auto_26579 ?auto_26554 ) ) ( not ( = ?auto_26564 ?auto_26576 ) ) ( not ( = ?auto_26564 ?auto_26559 ) ) ( not ( = ?auto_26566 ?auto_26562 ) ) ( not ( = ?auto_26566 ?auto_26568 ) ) ( not ( = ?auto_26544 ?auto_26548 ) ) ( not ( = ?auto_26544 ?auto_26569 ) ) ( not ( = ?auto_26545 ?auto_26548 ) ) ( not ( = ?auto_26545 ?auto_26569 ) ) ( not ( = ?auto_26546 ?auto_26548 ) ) ( not ( = ?auto_26546 ?auto_26569 ) ) ( not ( = ?auto_26548 ?auto_26566 ) ) ( not ( = ?auto_26548 ?auto_26562 ) ) ( not ( = ?auto_26548 ?auto_26568 ) ) ( not ( = ?auto_26569 ?auto_26566 ) ) ( not ( = ?auto_26569 ?auto_26562 ) ) ( not ( = ?auto_26569 ?auto_26568 ) ) ( not ( = ?auto_26544 ?auto_26549 ) ) ( not ( = ?auto_26544 ?auto_26578 ) ) ( not ( = ?auto_26545 ?auto_26549 ) ) ( not ( = ?auto_26545 ?auto_26578 ) ) ( not ( = ?auto_26546 ?auto_26549 ) ) ( not ( = ?auto_26546 ?auto_26578 ) ) ( not ( = ?auto_26547 ?auto_26549 ) ) ( not ( = ?auto_26547 ?auto_26578 ) ) ( not ( = ?auto_26549 ?auto_26569 ) ) ( not ( = ?auto_26549 ?auto_26566 ) ) ( not ( = ?auto_26549 ?auto_26562 ) ) ( not ( = ?auto_26549 ?auto_26568 ) ) ( not ( = ?auto_26573 ?auto_26560 ) ) ( not ( = ?auto_26573 ?auto_26579 ) ) ( not ( = ?auto_26573 ?auto_26554 ) ) ( not ( = ?auto_26567 ?auto_26576 ) ) ( not ( = ?auto_26567 ?auto_26564 ) ) ( not ( = ?auto_26567 ?auto_26559 ) ) ( not ( = ?auto_26578 ?auto_26569 ) ) ( not ( = ?auto_26578 ?auto_26566 ) ) ( not ( = ?auto_26578 ?auto_26562 ) ) ( not ( = ?auto_26578 ?auto_26568 ) ) ( not ( = ?auto_26544 ?auto_26550 ) ) ( not ( = ?auto_26544 ?auto_26565 ) ) ( not ( = ?auto_26545 ?auto_26550 ) ) ( not ( = ?auto_26545 ?auto_26565 ) ) ( not ( = ?auto_26546 ?auto_26550 ) ) ( not ( = ?auto_26546 ?auto_26565 ) ) ( not ( = ?auto_26547 ?auto_26550 ) ) ( not ( = ?auto_26547 ?auto_26565 ) ) ( not ( = ?auto_26548 ?auto_26550 ) ) ( not ( = ?auto_26548 ?auto_26565 ) ) ( not ( = ?auto_26550 ?auto_26578 ) ) ( not ( = ?auto_26550 ?auto_26569 ) ) ( not ( = ?auto_26550 ?auto_26566 ) ) ( not ( = ?auto_26550 ?auto_26562 ) ) ( not ( = ?auto_26550 ?auto_26568 ) ) ( not ( = ?auto_26561 ?auto_26573 ) ) ( not ( = ?auto_26561 ?auto_26560 ) ) ( not ( = ?auto_26561 ?auto_26579 ) ) ( not ( = ?auto_26561 ?auto_26554 ) ) ( not ( = ?auto_26563 ?auto_26567 ) ) ( not ( = ?auto_26563 ?auto_26576 ) ) ( not ( = ?auto_26563 ?auto_26564 ) ) ( not ( = ?auto_26563 ?auto_26559 ) ) ( not ( = ?auto_26565 ?auto_26578 ) ) ( not ( = ?auto_26565 ?auto_26569 ) ) ( not ( = ?auto_26565 ?auto_26566 ) ) ( not ( = ?auto_26565 ?auto_26562 ) ) ( not ( = ?auto_26565 ?auto_26568 ) ) ( not ( = ?auto_26544 ?auto_26553 ) ) ( not ( = ?auto_26544 ?auto_26577 ) ) ( not ( = ?auto_26545 ?auto_26553 ) ) ( not ( = ?auto_26545 ?auto_26577 ) ) ( not ( = ?auto_26546 ?auto_26553 ) ) ( not ( = ?auto_26546 ?auto_26577 ) ) ( not ( = ?auto_26547 ?auto_26553 ) ) ( not ( = ?auto_26547 ?auto_26577 ) ) ( not ( = ?auto_26548 ?auto_26553 ) ) ( not ( = ?auto_26548 ?auto_26577 ) ) ( not ( = ?auto_26549 ?auto_26553 ) ) ( not ( = ?auto_26549 ?auto_26577 ) ) ( not ( = ?auto_26553 ?auto_26565 ) ) ( not ( = ?auto_26553 ?auto_26578 ) ) ( not ( = ?auto_26553 ?auto_26569 ) ) ( not ( = ?auto_26553 ?auto_26566 ) ) ( not ( = ?auto_26553 ?auto_26562 ) ) ( not ( = ?auto_26553 ?auto_26568 ) ) ( not ( = ?auto_26574 ?auto_26561 ) ) ( not ( = ?auto_26574 ?auto_26573 ) ) ( not ( = ?auto_26574 ?auto_26560 ) ) ( not ( = ?auto_26574 ?auto_26579 ) ) ( not ( = ?auto_26574 ?auto_26554 ) ) ( not ( = ?auto_26575 ?auto_26563 ) ) ( not ( = ?auto_26575 ?auto_26567 ) ) ( not ( = ?auto_26575 ?auto_26576 ) ) ( not ( = ?auto_26575 ?auto_26564 ) ) ( not ( = ?auto_26575 ?auto_26559 ) ) ( not ( = ?auto_26577 ?auto_26565 ) ) ( not ( = ?auto_26577 ?auto_26578 ) ) ( not ( = ?auto_26577 ?auto_26569 ) ) ( not ( = ?auto_26577 ?auto_26566 ) ) ( not ( = ?auto_26577 ?auto_26562 ) ) ( not ( = ?auto_26577 ?auto_26568 ) ) ( not ( = ?auto_26544 ?auto_26552 ) ) ( not ( = ?auto_26544 ?auto_26572 ) ) ( not ( = ?auto_26545 ?auto_26552 ) ) ( not ( = ?auto_26545 ?auto_26572 ) ) ( not ( = ?auto_26546 ?auto_26552 ) ) ( not ( = ?auto_26546 ?auto_26572 ) ) ( not ( = ?auto_26547 ?auto_26552 ) ) ( not ( = ?auto_26547 ?auto_26572 ) ) ( not ( = ?auto_26548 ?auto_26552 ) ) ( not ( = ?auto_26548 ?auto_26572 ) ) ( not ( = ?auto_26549 ?auto_26552 ) ) ( not ( = ?auto_26549 ?auto_26572 ) ) ( not ( = ?auto_26550 ?auto_26552 ) ) ( not ( = ?auto_26550 ?auto_26572 ) ) ( not ( = ?auto_26552 ?auto_26577 ) ) ( not ( = ?auto_26552 ?auto_26565 ) ) ( not ( = ?auto_26552 ?auto_26578 ) ) ( not ( = ?auto_26552 ?auto_26569 ) ) ( not ( = ?auto_26552 ?auto_26566 ) ) ( not ( = ?auto_26552 ?auto_26562 ) ) ( not ( = ?auto_26552 ?auto_26568 ) ) ( not ( = ?auto_26570 ?auto_26574 ) ) ( not ( = ?auto_26570 ?auto_26561 ) ) ( not ( = ?auto_26570 ?auto_26573 ) ) ( not ( = ?auto_26570 ?auto_26560 ) ) ( not ( = ?auto_26570 ?auto_26579 ) ) ( not ( = ?auto_26570 ?auto_26554 ) ) ( not ( = ?auto_26571 ?auto_26575 ) ) ( not ( = ?auto_26571 ?auto_26563 ) ) ( not ( = ?auto_26571 ?auto_26567 ) ) ( not ( = ?auto_26571 ?auto_26576 ) ) ( not ( = ?auto_26571 ?auto_26564 ) ) ( not ( = ?auto_26571 ?auto_26559 ) ) ( not ( = ?auto_26572 ?auto_26577 ) ) ( not ( = ?auto_26572 ?auto_26565 ) ) ( not ( = ?auto_26572 ?auto_26578 ) ) ( not ( = ?auto_26572 ?auto_26569 ) ) ( not ( = ?auto_26572 ?auto_26566 ) ) ( not ( = ?auto_26572 ?auto_26562 ) ) ( not ( = ?auto_26572 ?auto_26568 ) ) ( not ( = ?auto_26544 ?auto_26551 ) ) ( not ( = ?auto_26544 ?auto_26558 ) ) ( not ( = ?auto_26545 ?auto_26551 ) ) ( not ( = ?auto_26545 ?auto_26558 ) ) ( not ( = ?auto_26546 ?auto_26551 ) ) ( not ( = ?auto_26546 ?auto_26558 ) ) ( not ( = ?auto_26547 ?auto_26551 ) ) ( not ( = ?auto_26547 ?auto_26558 ) ) ( not ( = ?auto_26548 ?auto_26551 ) ) ( not ( = ?auto_26548 ?auto_26558 ) ) ( not ( = ?auto_26549 ?auto_26551 ) ) ( not ( = ?auto_26549 ?auto_26558 ) ) ( not ( = ?auto_26550 ?auto_26551 ) ) ( not ( = ?auto_26550 ?auto_26558 ) ) ( not ( = ?auto_26553 ?auto_26551 ) ) ( not ( = ?auto_26553 ?auto_26558 ) ) ( not ( = ?auto_26551 ?auto_26572 ) ) ( not ( = ?auto_26551 ?auto_26577 ) ) ( not ( = ?auto_26551 ?auto_26565 ) ) ( not ( = ?auto_26551 ?auto_26578 ) ) ( not ( = ?auto_26551 ?auto_26569 ) ) ( not ( = ?auto_26551 ?auto_26566 ) ) ( not ( = ?auto_26551 ?auto_26562 ) ) ( not ( = ?auto_26551 ?auto_26568 ) ) ( not ( = ?auto_26558 ?auto_26572 ) ) ( not ( = ?auto_26558 ?auto_26577 ) ) ( not ( = ?auto_26558 ?auto_26565 ) ) ( not ( = ?auto_26558 ?auto_26578 ) ) ( not ( = ?auto_26558 ?auto_26569 ) ) ( not ( = ?auto_26558 ?auto_26566 ) ) ( not ( = ?auto_26558 ?auto_26562 ) ) ( not ( = ?auto_26558 ?auto_26568 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_26544 ?auto_26545 ?auto_26546 ?auto_26547 ?auto_26548 ?auto_26549 ?auto_26550 ?auto_26553 ?auto_26552 )
      ( MAKE-1CRATE ?auto_26552 ?auto_26551 )
      ( MAKE-9CRATE-VERIFY ?auto_26544 ?auto_26545 ?auto_26546 ?auto_26547 ?auto_26548 ?auto_26549 ?auto_26550 ?auto_26553 ?auto_26552 ?auto_26551 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26582 - SURFACE
      ?auto_26583 - SURFACE
    )
    :vars
    (
      ?auto_26584 - HOIST
      ?auto_26585 - PLACE
      ?auto_26587 - PLACE
      ?auto_26588 - HOIST
      ?auto_26589 - SURFACE
      ?auto_26586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26584 ?auto_26585 ) ( SURFACE-AT ?auto_26582 ?auto_26585 ) ( CLEAR ?auto_26582 ) ( IS-CRATE ?auto_26583 ) ( AVAILABLE ?auto_26584 ) ( not ( = ?auto_26587 ?auto_26585 ) ) ( HOIST-AT ?auto_26588 ?auto_26587 ) ( AVAILABLE ?auto_26588 ) ( SURFACE-AT ?auto_26583 ?auto_26587 ) ( ON ?auto_26583 ?auto_26589 ) ( CLEAR ?auto_26583 ) ( TRUCK-AT ?auto_26586 ?auto_26585 ) ( not ( = ?auto_26582 ?auto_26583 ) ) ( not ( = ?auto_26582 ?auto_26589 ) ) ( not ( = ?auto_26583 ?auto_26589 ) ) ( not ( = ?auto_26584 ?auto_26588 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26586 ?auto_26585 ?auto_26587 )
      ( !LIFT ?auto_26588 ?auto_26583 ?auto_26589 ?auto_26587 )
      ( !LOAD ?auto_26588 ?auto_26583 ?auto_26586 ?auto_26587 )
      ( !DRIVE ?auto_26586 ?auto_26587 ?auto_26585 )
      ( !UNLOAD ?auto_26584 ?auto_26583 ?auto_26586 ?auto_26585 )
      ( !DROP ?auto_26584 ?auto_26583 ?auto_26582 ?auto_26585 )
      ( MAKE-1CRATE-VERIFY ?auto_26582 ?auto_26583 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_26601 - SURFACE
      ?auto_26602 - SURFACE
      ?auto_26603 - SURFACE
      ?auto_26604 - SURFACE
      ?auto_26605 - SURFACE
      ?auto_26606 - SURFACE
      ?auto_26607 - SURFACE
      ?auto_26610 - SURFACE
      ?auto_26609 - SURFACE
      ?auto_26608 - SURFACE
      ?auto_26611 - SURFACE
    )
    :vars
    (
      ?auto_26617 - HOIST
      ?auto_26616 - PLACE
      ?auto_26613 - PLACE
      ?auto_26615 - HOIST
      ?auto_26614 - SURFACE
      ?auto_26623 - PLACE
      ?auto_26633 - HOIST
      ?auto_26631 - SURFACE
      ?auto_26627 - PLACE
      ?auto_26622 - HOIST
      ?auto_26638 - SURFACE
      ?auto_26626 - PLACE
      ?auto_26636 - HOIST
      ?auto_26635 - SURFACE
      ?auto_26625 - PLACE
      ?auto_26634 - HOIST
      ?auto_26630 - SURFACE
      ?auto_26632 - PLACE
      ?auto_26628 - HOIST
      ?auto_26624 - SURFACE
      ?auto_26618 - PLACE
      ?auto_26620 - HOIST
      ?auto_26637 - SURFACE
      ?auto_26629 - SURFACE
      ?auto_26619 - SURFACE
      ?auto_26621 - SURFACE
      ?auto_26612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26617 ?auto_26616 ) ( IS-CRATE ?auto_26611 ) ( not ( = ?auto_26613 ?auto_26616 ) ) ( HOIST-AT ?auto_26615 ?auto_26613 ) ( SURFACE-AT ?auto_26611 ?auto_26613 ) ( ON ?auto_26611 ?auto_26614 ) ( CLEAR ?auto_26611 ) ( not ( = ?auto_26608 ?auto_26611 ) ) ( not ( = ?auto_26608 ?auto_26614 ) ) ( not ( = ?auto_26611 ?auto_26614 ) ) ( not ( = ?auto_26617 ?auto_26615 ) ) ( IS-CRATE ?auto_26608 ) ( not ( = ?auto_26623 ?auto_26616 ) ) ( HOIST-AT ?auto_26633 ?auto_26623 ) ( SURFACE-AT ?auto_26608 ?auto_26623 ) ( ON ?auto_26608 ?auto_26631 ) ( CLEAR ?auto_26608 ) ( not ( = ?auto_26609 ?auto_26608 ) ) ( not ( = ?auto_26609 ?auto_26631 ) ) ( not ( = ?auto_26608 ?auto_26631 ) ) ( not ( = ?auto_26617 ?auto_26633 ) ) ( IS-CRATE ?auto_26609 ) ( not ( = ?auto_26627 ?auto_26616 ) ) ( HOIST-AT ?auto_26622 ?auto_26627 ) ( AVAILABLE ?auto_26622 ) ( SURFACE-AT ?auto_26609 ?auto_26627 ) ( ON ?auto_26609 ?auto_26638 ) ( CLEAR ?auto_26609 ) ( not ( = ?auto_26610 ?auto_26609 ) ) ( not ( = ?auto_26610 ?auto_26638 ) ) ( not ( = ?auto_26609 ?auto_26638 ) ) ( not ( = ?auto_26617 ?auto_26622 ) ) ( IS-CRATE ?auto_26610 ) ( not ( = ?auto_26626 ?auto_26616 ) ) ( HOIST-AT ?auto_26636 ?auto_26626 ) ( AVAILABLE ?auto_26636 ) ( SURFACE-AT ?auto_26610 ?auto_26626 ) ( ON ?auto_26610 ?auto_26635 ) ( CLEAR ?auto_26610 ) ( not ( = ?auto_26607 ?auto_26610 ) ) ( not ( = ?auto_26607 ?auto_26635 ) ) ( not ( = ?auto_26610 ?auto_26635 ) ) ( not ( = ?auto_26617 ?auto_26636 ) ) ( IS-CRATE ?auto_26607 ) ( not ( = ?auto_26625 ?auto_26616 ) ) ( HOIST-AT ?auto_26634 ?auto_26625 ) ( AVAILABLE ?auto_26634 ) ( SURFACE-AT ?auto_26607 ?auto_26625 ) ( ON ?auto_26607 ?auto_26630 ) ( CLEAR ?auto_26607 ) ( not ( = ?auto_26606 ?auto_26607 ) ) ( not ( = ?auto_26606 ?auto_26630 ) ) ( not ( = ?auto_26607 ?auto_26630 ) ) ( not ( = ?auto_26617 ?auto_26634 ) ) ( IS-CRATE ?auto_26606 ) ( not ( = ?auto_26632 ?auto_26616 ) ) ( HOIST-AT ?auto_26628 ?auto_26632 ) ( AVAILABLE ?auto_26628 ) ( SURFACE-AT ?auto_26606 ?auto_26632 ) ( ON ?auto_26606 ?auto_26624 ) ( CLEAR ?auto_26606 ) ( not ( = ?auto_26605 ?auto_26606 ) ) ( not ( = ?auto_26605 ?auto_26624 ) ) ( not ( = ?auto_26606 ?auto_26624 ) ) ( not ( = ?auto_26617 ?auto_26628 ) ) ( IS-CRATE ?auto_26605 ) ( not ( = ?auto_26618 ?auto_26616 ) ) ( HOIST-AT ?auto_26620 ?auto_26618 ) ( SURFACE-AT ?auto_26605 ?auto_26618 ) ( ON ?auto_26605 ?auto_26637 ) ( CLEAR ?auto_26605 ) ( not ( = ?auto_26604 ?auto_26605 ) ) ( not ( = ?auto_26604 ?auto_26637 ) ) ( not ( = ?auto_26605 ?auto_26637 ) ) ( not ( = ?auto_26617 ?auto_26620 ) ) ( IS-CRATE ?auto_26604 ) ( AVAILABLE ?auto_26615 ) ( SURFACE-AT ?auto_26604 ?auto_26613 ) ( ON ?auto_26604 ?auto_26629 ) ( CLEAR ?auto_26604 ) ( not ( = ?auto_26603 ?auto_26604 ) ) ( not ( = ?auto_26603 ?auto_26629 ) ) ( not ( = ?auto_26604 ?auto_26629 ) ) ( IS-CRATE ?auto_26603 ) ( AVAILABLE ?auto_26620 ) ( SURFACE-AT ?auto_26603 ?auto_26618 ) ( ON ?auto_26603 ?auto_26619 ) ( CLEAR ?auto_26603 ) ( not ( = ?auto_26602 ?auto_26603 ) ) ( not ( = ?auto_26602 ?auto_26619 ) ) ( not ( = ?auto_26603 ?auto_26619 ) ) ( SURFACE-AT ?auto_26601 ?auto_26616 ) ( CLEAR ?auto_26601 ) ( IS-CRATE ?auto_26602 ) ( AVAILABLE ?auto_26617 ) ( AVAILABLE ?auto_26633 ) ( SURFACE-AT ?auto_26602 ?auto_26623 ) ( ON ?auto_26602 ?auto_26621 ) ( CLEAR ?auto_26602 ) ( TRUCK-AT ?auto_26612 ?auto_26616 ) ( not ( = ?auto_26601 ?auto_26602 ) ) ( not ( = ?auto_26601 ?auto_26621 ) ) ( not ( = ?auto_26602 ?auto_26621 ) ) ( not ( = ?auto_26601 ?auto_26603 ) ) ( not ( = ?auto_26601 ?auto_26619 ) ) ( not ( = ?auto_26603 ?auto_26621 ) ) ( not ( = ?auto_26618 ?auto_26623 ) ) ( not ( = ?auto_26620 ?auto_26633 ) ) ( not ( = ?auto_26619 ?auto_26621 ) ) ( not ( = ?auto_26601 ?auto_26604 ) ) ( not ( = ?auto_26601 ?auto_26629 ) ) ( not ( = ?auto_26602 ?auto_26604 ) ) ( not ( = ?auto_26602 ?auto_26629 ) ) ( not ( = ?auto_26604 ?auto_26619 ) ) ( not ( = ?auto_26604 ?auto_26621 ) ) ( not ( = ?auto_26613 ?auto_26618 ) ) ( not ( = ?auto_26613 ?auto_26623 ) ) ( not ( = ?auto_26615 ?auto_26620 ) ) ( not ( = ?auto_26615 ?auto_26633 ) ) ( not ( = ?auto_26629 ?auto_26619 ) ) ( not ( = ?auto_26629 ?auto_26621 ) ) ( not ( = ?auto_26601 ?auto_26605 ) ) ( not ( = ?auto_26601 ?auto_26637 ) ) ( not ( = ?auto_26602 ?auto_26605 ) ) ( not ( = ?auto_26602 ?auto_26637 ) ) ( not ( = ?auto_26603 ?auto_26605 ) ) ( not ( = ?auto_26603 ?auto_26637 ) ) ( not ( = ?auto_26605 ?auto_26629 ) ) ( not ( = ?auto_26605 ?auto_26619 ) ) ( not ( = ?auto_26605 ?auto_26621 ) ) ( not ( = ?auto_26637 ?auto_26629 ) ) ( not ( = ?auto_26637 ?auto_26619 ) ) ( not ( = ?auto_26637 ?auto_26621 ) ) ( not ( = ?auto_26601 ?auto_26606 ) ) ( not ( = ?auto_26601 ?auto_26624 ) ) ( not ( = ?auto_26602 ?auto_26606 ) ) ( not ( = ?auto_26602 ?auto_26624 ) ) ( not ( = ?auto_26603 ?auto_26606 ) ) ( not ( = ?auto_26603 ?auto_26624 ) ) ( not ( = ?auto_26604 ?auto_26606 ) ) ( not ( = ?auto_26604 ?auto_26624 ) ) ( not ( = ?auto_26606 ?auto_26637 ) ) ( not ( = ?auto_26606 ?auto_26629 ) ) ( not ( = ?auto_26606 ?auto_26619 ) ) ( not ( = ?auto_26606 ?auto_26621 ) ) ( not ( = ?auto_26632 ?auto_26618 ) ) ( not ( = ?auto_26632 ?auto_26613 ) ) ( not ( = ?auto_26632 ?auto_26623 ) ) ( not ( = ?auto_26628 ?auto_26620 ) ) ( not ( = ?auto_26628 ?auto_26615 ) ) ( not ( = ?auto_26628 ?auto_26633 ) ) ( not ( = ?auto_26624 ?auto_26637 ) ) ( not ( = ?auto_26624 ?auto_26629 ) ) ( not ( = ?auto_26624 ?auto_26619 ) ) ( not ( = ?auto_26624 ?auto_26621 ) ) ( not ( = ?auto_26601 ?auto_26607 ) ) ( not ( = ?auto_26601 ?auto_26630 ) ) ( not ( = ?auto_26602 ?auto_26607 ) ) ( not ( = ?auto_26602 ?auto_26630 ) ) ( not ( = ?auto_26603 ?auto_26607 ) ) ( not ( = ?auto_26603 ?auto_26630 ) ) ( not ( = ?auto_26604 ?auto_26607 ) ) ( not ( = ?auto_26604 ?auto_26630 ) ) ( not ( = ?auto_26605 ?auto_26607 ) ) ( not ( = ?auto_26605 ?auto_26630 ) ) ( not ( = ?auto_26607 ?auto_26624 ) ) ( not ( = ?auto_26607 ?auto_26637 ) ) ( not ( = ?auto_26607 ?auto_26629 ) ) ( not ( = ?auto_26607 ?auto_26619 ) ) ( not ( = ?auto_26607 ?auto_26621 ) ) ( not ( = ?auto_26625 ?auto_26632 ) ) ( not ( = ?auto_26625 ?auto_26618 ) ) ( not ( = ?auto_26625 ?auto_26613 ) ) ( not ( = ?auto_26625 ?auto_26623 ) ) ( not ( = ?auto_26634 ?auto_26628 ) ) ( not ( = ?auto_26634 ?auto_26620 ) ) ( not ( = ?auto_26634 ?auto_26615 ) ) ( not ( = ?auto_26634 ?auto_26633 ) ) ( not ( = ?auto_26630 ?auto_26624 ) ) ( not ( = ?auto_26630 ?auto_26637 ) ) ( not ( = ?auto_26630 ?auto_26629 ) ) ( not ( = ?auto_26630 ?auto_26619 ) ) ( not ( = ?auto_26630 ?auto_26621 ) ) ( not ( = ?auto_26601 ?auto_26610 ) ) ( not ( = ?auto_26601 ?auto_26635 ) ) ( not ( = ?auto_26602 ?auto_26610 ) ) ( not ( = ?auto_26602 ?auto_26635 ) ) ( not ( = ?auto_26603 ?auto_26610 ) ) ( not ( = ?auto_26603 ?auto_26635 ) ) ( not ( = ?auto_26604 ?auto_26610 ) ) ( not ( = ?auto_26604 ?auto_26635 ) ) ( not ( = ?auto_26605 ?auto_26610 ) ) ( not ( = ?auto_26605 ?auto_26635 ) ) ( not ( = ?auto_26606 ?auto_26610 ) ) ( not ( = ?auto_26606 ?auto_26635 ) ) ( not ( = ?auto_26610 ?auto_26630 ) ) ( not ( = ?auto_26610 ?auto_26624 ) ) ( not ( = ?auto_26610 ?auto_26637 ) ) ( not ( = ?auto_26610 ?auto_26629 ) ) ( not ( = ?auto_26610 ?auto_26619 ) ) ( not ( = ?auto_26610 ?auto_26621 ) ) ( not ( = ?auto_26626 ?auto_26625 ) ) ( not ( = ?auto_26626 ?auto_26632 ) ) ( not ( = ?auto_26626 ?auto_26618 ) ) ( not ( = ?auto_26626 ?auto_26613 ) ) ( not ( = ?auto_26626 ?auto_26623 ) ) ( not ( = ?auto_26636 ?auto_26634 ) ) ( not ( = ?auto_26636 ?auto_26628 ) ) ( not ( = ?auto_26636 ?auto_26620 ) ) ( not ( = ?auto_26636 ?auto_26615 ) ) ( not ( = ?auto_26636 ?auto_26633 ) ) ( not ( = ?auto_26635 ?auto_26630 ) ) ( not ( = ?auto_26635 ?auto_26624 ) ) ( not ( = ?auto_26635 ?auto_26637 ) ) ( not ( = ?auto_26635 ?auto_26629 ) ) ( not ( = ?auto_26635 ?auto_26619 ) ) ( not ( = ?auto_26635 ?auto_26621 ) ) ( not ( = ?auto_26601 ?auto_26609 ) ) ( not ( = ?auto_26601 ?auto_26638 ) ) ( not ( = ?auto_26602 ?auto_26609 ) ) ( not ( = ?auto_26602 ?auto_26638 ) ) ( not ( = ?auto_26603 ?auto_26609 ) ) ( not ( = ?auto_26603 ?auto_26638 ) ) ( not ( = ?auto_26604 ?auto_26609 ) ) ( not ( = ?auto_26604 ?auto_26638 ) ) ( not ( = ?auto_26605 ?auto_26609 ) ) ( not ( = ?auto_26605 ?auto_26638 ) ) ( not ( = ?auto_26606 ?auto_26609 ) ) ( not ( = ?auto_26606 ?auto_26638 ) ) ( not ( = ?auto_26607 ?auto_26609 ) ) ( not ( = ?auto_26607 ?auto_26638 ) ) ( not ( = ?auto_26609 ?auto_26635 ) ) ( not ( = ?auto_26609 ?auto_26630 ) ) ( not ( = ?auto_26609 ?auto_26624 ) ) ( not ( = ?auto_26609 ?auto_26637 ) ) ( not ( = ?auto_26609 ?auto_26629 ) ) ( not ( = ?auto_26609 ?auto_26619 ) ) ( not ( = ?auto_26609 ?auto_26621 ) ) ( not ( = ?auto_26627 ?auto_26626 ) ) ( not ( = ?auto_26627 ?auto_26625 ) ) ( not ( = ?auto_26627 ?auto_26632 ) ) ( not ( = ?auto_26627 ?auto_26618 ) ) ( not ( = ?auto_26627 ?auto_26613 ) ) ( not ( = ?auto_26627 ?auto_26623 ) ) ( not ( = ?auto_26622 ?auto_26636 ) ) ( not ( = ?auto_26622 ?auto_26634 ) ) ( not ( = ?auto_26622 ?auto_26628 ) ) ( not ( = ?auto_26622 ?auto_26620 ) ) ( not ( = ?auto_26622 ?auto_26615 ) ) ( not ( = ?auto_26622 ?auto_26633 ) ) ( not ( = ?auto_26638 ?auto_26635 ) ) ( not ( = ?auto_26638 ?auto_26630 ) ) ( not ( = ?auto_26638 ?auto_26624 ) ) ( not ( = ?auto_26638 ?auto_26637 ) ) ( not ( = ?auto_26638 ?auto_26629 ) ) ( not ( = ?auto_26638 ?auto_26619 ) ) ( not ( = ?auto_26638 ?auto_26621 ) ) ( not ( = ?auto_26601 ?auto_26608 ) ) ( not ( = ?auto_26601 ?auto_26631 ) ) ( not ( = ?auto_26602 ?auto_26608 ) ) ( not ( = ?auto_26602 ?auto_26631 ) ) ( not ( = ?auto_26603 ?auto_26608 ) ) ( not ( = ?auto_26603 ?auto_26631 ) ) ( not ( = ?auto_26604 ?auto_26608 ) ) ( not ( = ?auto_26604 ?auto_26631 ) ) ( not ( = ?auto_26605 ?auto_26608 ) ) ( not ( = ?auto_26605 ?auto_26631 ) ) ( not ( = ?auto_26606 ?auto_26608 ) ) ( not ( = ?auto_26606 ?auto_26631 ) ) ( not ( = ?auto_26607 ?auto_26608 ) ) ( not ( = ?auto_26607 ?auto_26631 ) ) ( not ( = ?auto_26610 ?auto_26608 ) ) ( not ( = ?auto_26610 ?auto_26631 ) ) ( not ( = ?auto_26608 ?auto_26638 ) ) ( not ( = ?auto_26608 ?auto_26635 ) ) ( not ( = ?auto_26608 ?auto_26630 ) ) ( not ( = ?auto_26608 ?auto_26624 ) ) ( not ( = ?auto_26608 ?auto_26637 ) ) ( not ( = ?auto_26608 ?auto_26629 ) ) ( not ( = ?auto_26608 ?auto_26619 ) ) ( not ( = ?auto_26608 ?auto_26621 ) ) ( not ( = ?auto_26631 ?auto_26638 ) ) ( not ( = ?auto_26631 ?auto_26635 ) ) ( not ( = ?auto_26631 ?auto_26630 ) ) ( not ( = ?auto_26631 ?auto_26624 ) ) ( not ( = ?auto_26631 ?auto_26637 ) ) ( not ( = ?auto_26631 ?auto_26629 ) ) ( not ( = ?auto_26631 ?auto_26619 ) ) ( not ( = ?auto_26631 ?auto_26621 ) ) ( not ( = ?auto_26601 ?auto_26611 ) ) ( not ( = ?auto_26601 ?auto_26614 ) ) ( not ( = ?auto_26602 ?auto_26611 ) ) ( not ( = ?auto_26602 ?auto_26614 ) ) ( not ( = ?auto_26603 ?auto_26611 ) ) ( not ( = ?auto_26603 ?auto_26614 ) ) ( not ( = ?auto_26604 ?auto_26611 ) ) ( not ( = ?auto_26604 ?auto_26614 ) ) ( not ( = ?auto_26605 ?auto_26611 ) ) ( not ( = ?auto_26605 ?auto_26614 ) ) ( not ( = ?auto_26606 ?auto_26611 ) ) ( not ( = ?auto_26606 ?auto_26614 ) ) ( not ( = ?auto_26607 ?auto_26611 ) ) ( not ( = ?auto_26607 ?auto_26614 ) ) ( not ( = ?auto_26610 ?auto_26611 ) ) ( not ( = ?auto_26610 ?auto_26614 ) ) ( not ( = ?auto_26609 ?auto_26611 ) ) ( not ( = ?auto_26609 ?auto_26614 ) ) ( not ( = ?auto_26611 ?auto_26631 ) ) ( not ( = ?auto_26611 ?auto_26638 ) ) ( not ( = ?auto_26611 ?auto_26635 ) ) ( not ( = ?auto_26611 ?auto_26630 ) ) ( not ( = ?auto_26611 ?auto_26624 ) ) ( not ( = ?auto_26611 ?auto_26637 ) ) ( not ( = ?auto_26611 ?auto_26629 ) ) ( not ( = ?auto_26611 ?auto_26619 ) ) ( not ( = ?auto_26611 ?auto_26621 ) ) ( not ( = ?auto_26614 ?auto_26631 ) ) ( not ( = ?auto_26614 ?auto_26638 ) ) ( not ( = ?auto_26614 ?auto_26635 ) ) ( not ( = ?auto_26614 ?auto_26630 ) ) ( not ( = ?auto_26614 ?auto_26624 ) ) ( not ( = ?auto_26614 ?auto_26637 ) ) ( not ( = ?auto_26614 ?auto_26629 ) ) ( not ( = ?auto_26614 ?auto_26619 ) ) ( not ( = ?auto_26614 ?auto_26621 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_26601 ?auto_26602 ?auto_26603 ?auto_26604 ?auto_26605 ?auto_26606 ?auto_26607 ?auto_26610 ?auto_26609 ?auto_26608 )
      ( MAKE-1CRATE ?auto_26608 ?auto_26611 )
      ( MAKE-10CRATE-VERIFY ?auto_26601 ?auto_26602 ?auto_26603 ?auto_26604 ?auto_26605 ?auto_26606 ?auto_26607 ?auto_26610 ?auto_26609 ?auto_26608 ?auto_26611 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26641 - SURFACE
      ?auto_26642 - SURFACE
    )
    :vars
    (
      ?auto_26643 - HOIST
      ?auto_26644 - PLACE
      ?auto_26646 - PLACE
      ?auto_26647 - HOIST
      ?auto_26648 - SURFACE
      ?auto_26645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26643 ?auto_26644 ) ( SURFACE-AT ?auto_26641 ?auto_26644 ) ( CLEAR ?auto_26641 ) ( IS-CRATE ?auto_26642 ) ( AVAILABLE ?auto_26643 ) ( not ( = ?auto_26646 ?auto_26644 ) ) ( HOIST-AT ?auto_26647 ?auto_26646 ) ( AVAILABLE ?auto_26647 ) ( SURFACE-AT ?auto_26642 ?auto_26646 ) ( ON ?auto_26642 ?auto_26648 ) ( CLEAR ?auto_26642 ) ( TRUCK-AT ?auto_26645 ?auto_26644 ) ( not ( = ?auto_26641 ?auto_26642 ) ) ( not ( = ?auto_26641 ?auto_26648 ) ) ( not ( = ?auto_26642 ?auto_26648 ) ) ( not ( = ?auto_26643 ?auto_26647 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26645 ?auto_26644 ?auto_26646 )
      ( !LIFT ?auto_26647 ?auto_26642 ?auto_26648 ?auto_26646 )
      ( !LOAD ?auto_26647 ?auto_26642 ?auto_26645 ?auto_26646 )
      ( !DRIVE ?auto_26645 ?auto_26646 ?auto_26644 )
      ( !UNLOAD ?auto_26643 ?auto_26642 ?auto_26645 ?auto_26644 )
      ( !DROP ?auto_26643 ?auto_26642 ?auto_26641 ?auto_26644 )
      ( MAKE-1CRATE-VERIFY ?auto_26641 ?auto_26642 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_26661 - SURFACE
      ?auto_26662 - SURFACE
      ?auto_26663 - SURFACE
      ?auto_26664 - SURFACE
      ?auto_26665 - SURFACE
      ?auto_26666 - SURFACE
      ?auto_26667 - SURFACE
      ?auto_26670 - SURFACE
      ?auto_26669 - SURFACE
      ?auto_26668 - SURFACE
      ?auto_26671 - SURFACE
      ?auto_26672 - SURFACE
    )
    :vars
    (
      ?auto_26673 - HOIST
      ?auto_26674 - PLACE
      ?auto_26678 - PLACE
      ?auto_26676 - HOIST
      ?auto_26677 - SURFACE
      ?auto_26690 - PLACE
      ?auto_26698 - HOIST
      ?auto_26681 - SURFACE
      ?auto_26691 - PLACE
      ?auto_26695 - HOIST
      ?auto_26697 - SURFACE
      ?auto_26701 - PLACE
      ?auto_26685 - HOIST
      ?auto_26687 - SURFACE
      ?auto_26689 - PLACE
      ?auto_26682 - HOIST
      ?auto_26679 - SURFACE
      ?auto_26686 - PLACE
      ?auto_26694 - HOIST
      ?auto_26702 - SURFACE
      ?auto_26680 - PLACE
      ?auto_26700 - HOIST
      ?auto_26699 - SURFACE
      ?auto_26692 - PLACE
      ?auto_26684 - HOIST
      ?auto_26688 - SURFACE
      ?auto_26683 - SURFACE
      ?auto_26696 - SURFACE
      ?auto_26693 - SURFACE
      ?auto_26675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26673 ?auto_26674 ) ( IS-CRATE ?auto_26672 ) ( not ( = ?auto_26678 ?auto_26674 ) ) ( HOIST-AT ?auto_26676 ?auto_26678 ) ( AVAILABLE ?auto_26676 ) ( SURFACE-AT ?auto_26672 ?auto_26678 ) ( ON ?auto_26672 ?auto_26677 ) ( CLEAR ?auto_26672 ) ( not ( = ?auto_26671 ?auto_26672 ) ) ( not ( = ?auto_26671 ?auto_26677 ) ) ( not ( = ?auto_26672 ?auto_26677 ) ) ( not ( = ?auto_26673 ?auto_26676 ) ) ( IS-CRATE ?auto_26671 ) ( not ( = ?auto_26690 ?auto_26674 ) ) ( HOIST-AT ?auto_26698 ?auto_26690 ) ( SURFACE-AT ?auto_26671 ?auto_26690 ) ( ON ?auto_26671 ?auto_26681 ) ( CLEAR ?auto_26671 ) ( not ( = ?auto_26668 ?auto_26671 ) ) ( not ( = ?auto_26668 ?auto_26681 ) ) ( not ( = ?auto_26671 ?auto_26681 ) ) ( not ( = ?auto_26673 ?auto_26698 ) ) ( IS-CRATE ?auto_26668 ) ( not ( = ?auto_26691 ?auto_26674 ) ) ( HOIST-AT ?auto_26695 ?auto_26691 ) ( SURFACE-AT ?auto_26668 ?auto_26691 ) ( ON ?auto_26668 ?auto_26697 ) ( CLEAR ?auto_26668 ) ( not ( = ?auto_26669 ?auto_26668 ) ) ( not ( = ?auto_26669 ?auto_26697 ) ) ( not ( = ?auto_26668 ?auto_26697 ) ) ( not ( = ?auto_26673 ?auto_26695 ) ) ( IS-CRATE ?auto_26669 ) ( not ( = ?auto_26701 ?auto_26674 ) ) ( HOIST-AT ?auto_26685 ?auto_26701 ) ( AVAILABLE ?auto_26685 ) ( SURFACE-AT ?auto_26669 ?auto_26701 ) ( ON ?auto_26669 ?auto_26687 ) ( CLEAR ?auto_26669 ) ( not ( = ?auto_26670 ?auto_26669 ) ) ( not ( = ?auto_26670 ?auto_26687 ) ) ( not ( = ?auto_26669 ?auto_26687 ) ) ( not ( = ?auto_26673 ?auto_26685 ) ) ( IS-CRATE ?auto_26670 ) ( not ( = ?auto_26689 ?auto_26674 ) ) ( HOIST-AT ?auto_26682 ?auto_26689 ) ( AVAILABLE ?auto_26682 ) ( SURFACE-AT ?auto_26670 ?auto_26689 ) ( ON ?auto_26670 ?auto_26679 ) ( CLEAR ?auto_26670 ) ( not ( = ?auto_26667 ?auto_26670 ) ) ( not ( = ?auto_26667 ?auto_26679 ) ) ( not ( = ?auto_26670 ?auto_26679 ) ) ( not ( = ?auto_26673 ?auto_26682 ) ) ( IS-CRATE ?auto_26667 ) ( not ( = ?auto_26686 ?auto_26674 ) ) ( HOIST-AT ?auto_26694 ?auto_26686 ) ( AVAILABLE ?auto_26694 ) ( SURFACE-AT ?auto_26667 ?auto_26686 ) ( ON ?auto_26667 ?auto_26702 ) ( CLEAR ?auto_26667 ) ( not ( = ?auto_26666 ?auto_26667 ) ) ( not ( = ?auto_26666 ?auto_26702 ) ) ( not ( = ?auto_26667 ?auto_26702 ) ) ( not ( = ?auto_26673 ?auto_26694 ) ) ( IS-CRATE ?auto_26666 ) ( not ( = ?auto_26680 ?auto_26674 ) ) ( HOIST-AT ?auto_26700 ?auto_26680 ) ( AVAILABLE ?auto_26700 ) ( SURFACE-AT ?auto_26666 ?auto_26680 ) ( ON ?auto_26666 ?auto_26699 ) ( CLEAR ?auto_26666 ) ( not ( = ?auto_26665 ?auto_26666 ) ) ( not ( = ?auto_26665 ?auto_26699 ) ) ( not ( = ?auto_26666 ?auto_26699 ) ) ( not ( = ?auto_26673 ?auto_26700 ) ) ( IS-CRATE ?auto_26665 ) ( not ( = ?auto_26692 ?auto_26674 ) ) ( HOIST-AT ?auto_26684 ?auto_26692 ) ( SURFACE-AT ?auto_26665 ?auto_26692 ) ( ON ?auto_26665 ?auto_26688 ) ( CLEAR ?auto_26665 ) ( not ( = ?auto_26664 ?auto_26665 ) ) ( not ( = ?auto_26664 ?auto_26688 ) ) ( not ( = ?auto_26665 ?auto_26688 ) ) ( not ( = ?auto_26673 ?auto_26684 ) ) ( IS-CRATE ?auto_26664 ) ( AVAILABLE ?auto_26698 ) ( SURFACE-AT ?auto_26664 ?auto_26690 ) ( ON ?auto_26664 ?auto_26683 ) ( CLEAR ?auto_26664 ) ( not ( = ?auto_26663 ?auto_26664 ) ) ( not ( = ?auto_26663 ?auto_26683 ) ) ( not ( = ?auto_26664 ?auto_26683 ) ) ( IS-CRATE ?auto_26663 ) ( AVAILABLE ?auto_26684 ) ( SURFACE-AT ?auto_26663 ?auto_26692 ) ( ON ?auto_26663 ?auto_26696 ) ( CLEAR ?auto_26663 ) ( not ( = ?auto_26662 ?auto_26663 ) ) ( not ( = ?auto_26662 ?auto_26696 ) ) ( not ( = ?auto_26663 ?auto_26696 ) ) ( SURFACE-AT ?auto_26661 ?auto_26674 ) ( CLEAR ?auto_26661 ) ( IS-CRATE ?auto_26662 ) ( AVAILABLE ?auto_26673 ) ( AVAILABLE ?auto_26695 ) ( SURFACE-AT ?auto_26662 ?auto_26691 ) ( ON ?auto_26662 ?auto_26693 ) ( CLEAR ?auto_26662 ) ( TRUCK-AT ?auto_26675 ?auto_26674 ) ( not ( = ?auto_26661 ?auto_26662 ) ) ( not ( = ?auto_26661 ?auto_26693 ) ) ( not ( = ?auto_26662 ?auto_26693 ) ) ( not ( = ?auto_26661 ?auto_26663 ) ) ( not ( = ?auto_26661 ?auto_26696 ) ) ( not ( = ?auto_26663 ?auto_26693 ) ) ( not ( = ?auto_26692 ?auto_26691 ) ) ( not ( = ?auto_26684 ?auto_26695 ) ) ( not ( = ?auto_26696 ?auto_26693 ) ) ( not ( = ?auto_26661 ?auto_26664 ) ) ( not ( = ?auto_26661 ?auto_26683 ) ) ( not ( = ?auto_26662 ?auto_26664 ) ) ( not ( = ?auto_26662 ?auto_26683 ) ) ( not ( = ?auto_26664 ?auto_26696 ) ) ( not ( = ?auto_26664 ?auto_26693 ) ) ( not ( = ?auto_26690 ?auto_26692 ) ) ( not ( = ?auto_26690 ?auto_26691 ) ) ( not ( = ?auto_26698 ?auto_26684 ) ) ( not ( = ?auto_26698 ?auto_26695 ) ) ( not ( = ?auto_26683 ?auto_26696 ) ) ( not ( = ?auto_26683 ?auto_26693 ) ) ( not ( = ?auto_26661 ?auto_26665 ) ) ( not ( = ?auto_26661 ?auto_26688 ) ) ( not ( = ?auto_26662 ?auto_26665 ) ) ( not ( = ?auto_26662 ?auto_26688 ) ) ( not ( = ?auto_26663 ?auto_26665 ) ) ( not ( = ?auto_26663 ?auto_26688 ) ) ( not ( = ?auto_26665 ?auto_26683 ) ) ( not ( = ?auto_26665 ?auto_26696 ) ) ( not ( = ?auto_26665 ?auto_26693 ) ) ( not ( = ?auto_26688 ?auto_26683 ) ) ( not ( = ?auto_26688 ?auto_26696 ) ) ( not ( = ?auto_26688 ?auto_26693 ) ) ( not ( = ?auto_26661 ?auto_26666 ) ) ( not ( = ?auto_26661 ?auto_26699 ) ) ( not ( = ?auto_26662 ?auto_26666 ) ) ( not ( = ?auto_26662 ?auto_26699 ) ) ( not ( = ?auto_26663 ?auto_26666 ) ) ( not ( = ?auto_26663 ?auto_26699 ) ) ( not ( = ?auto_26664 ?auto_26666 ) ) ( not ( = ?auto_26664 ?auto_26699 ) ) ( not ( = ?auto_26666 ?auto_26688 ) ) ( not ( = ?auto_26666 ?auto_26683 ) ) ( not ( = ?auto_26666 ?auto_26696 ) ) ( not ( = ?auto_26666 ?auto_26693 ) ) ( not ( = ?auto_26680 ?auto_26692 ) ) ( not ( = ?auto_26680 ?auto_26690 ) ) ( not ( = ?auto_26680 ?auto_26691 ) ) ( not ( = ?auto_26700 ?auto_26684 ) ) ( not ( = ?auto_26700 ?auto_26698 ) ) ( not ( = ?auto_26700 ?auto_26695 ) ) ( not ( = ?auto_26699 ?auto_26688 ) ) ( not ( = ?auto_26699 ?auto_26683 ) ) ( not ( = ?auto_26699 ?auto_26696 ) ) ( not ( = ?auto_26699 ?auto_26693 ) ) ( not ( = ?auto_26661 ?auto_26667 ) ) ( not ( = ?auto_26661 ?auto_26702 ) ) ( not ( = ?auto_26662 ?auto_26667 ) ) ( not ( = ?auto_26662 ?auto_26702 ) ) ( not ( = ?auto_26663 ?auto_26667 ) ) ( not ( = ?auto_26663 ?auto_26702 ) ) ( not ( = ?auto_26664 ?auto_26667 ) ) ( not ( = ?auto_26664 ?auto_26702 ) ) ( not ( = ?auto_26665 ?auto_26667 ) ) ( not ( = ?auto_26665 ?auto_26702 ) ) ( not ( = ?auto_26667 ?auto_26699 ) ) ( not ( = ?auto_26667 ?auto_26688 ) ) ( not ( = ?auto_26667 ?auto_26683 ) ) ( not ( = ?auto_26667 ?auto_26696 ) ) ( not ( = ?auto_26667 ?auto_26693 ) ) ( not ( = ?auto_26686 ?auto_26680 ) ) ( not ( = ?auto_26686 ?auto_26692 ) ) ( not ( = ?auto_26686 ?auto_26690 ) ) ( not ( = ?auto_26686 ?auto_26691 ) ) ( not ( = ?auto_26694 ?auto_26700 ) ) ( not ( = ?auto_26694 ?auto_26684 ) ) ( not ( = ?auto_26694 ?auto_26698 ) ) ( not ( = ?auto_26694 ?auto_26695 ) ) ( not ( = ?auto_26702 ?auto_26699 ) ) ( not ( = ?auto_26702 ?auto_26688 ) ) ( not ( = ?auto_26702 ?auto_26683 ) ) ( not ( = ?auto_26702 ?auto_26696 ) ) ( not ( = ?auto_26702 ?auto_26693 ) ) ( not ( = ?auto_26661 ?auto_26670 ) ) ( not ( = ?auto_26661 ?auto_26679 ) ) ( not ( = ?auto_26662 ?auto_26670 ) ) ( not ( = ?auto_26662 ?auto_26679 ) ) ( not ( = ?auto_26663 ?auto_26670 ) ) ( not ( = ?auto_26663 ?auto_26679 ) ) ( not ( = ?auto_26664 ?auto_26670 ) ) ( not ( = ?auto_26664 ?auto_26679 ) ) ( not ( = ?auto_26665 ?auto_26670 ) ) ( not ( = ?auto_26665 ?auto_26679 ) ) ( not ( = ?auto_26666 ?auto_26670 ) ) ( not ( = ?auto_26666 ?auto_26679 ) ) ( not ( = ?auto_26670 ?auto_26702 ) ) ( not ( = ?auto_26670 ?auto_26699 ) ) ( not ( = ?auto_26670 ?auto_26688 ) ) ( not ( = ?auto_26670 ?auto_26683 ) ) ( not ( = ?auto_26670 ?auto_26696 ) ) ( not ( = ?auto_26670 ?auto_26693 ) ) ( not ( = ?auto_26689 ?auto_26686 ) ) ( not ( = ?auto_26689 ?auto_26680 ) ) ( not ( = ?auto_26689 ?auto_26692 ) ) ( not ( = ?auto_26689 ?auto_26690 ) ) ( not ( = ?auto_26689 ?auto_26691 ) ) ( not ( = ?auto_26682 ?auto_26694 ) ) ( not ( = ?auto_26682 ?auto_26700 ) ) ( not ( = ?auto_26682 ?auto_26684 ) ) ( not ( = ?auto_26682 ?auto_26698 ) ) ( not ( = ?auto_26682 ?auto_26695 ) ) ( not ( = ?auto_26679 ?auto_26702 ) ) ( not ( = ?auto_26679 ?auto_26699 ) ) ( not ( = ?auto_26679 ?auto_26688 ) ) ( not ( = ?auto_26679 ?auto_26683 ) ) ( not ( = ?auto_26679 ?auto_26696 ) ) ( not ( = ?auto_26679 ?auto_26693 ) ) ( not ( = ?auto_26661 ?auto_26669 ) ) ( not ( = ?auto_26661 ?auto_26687 ) ) ( not ( = ?auto_26662 ?auto_26669 ) ) ( not ( = ?auto_26662 ?auto_26687 ) ) ( not ( = ?auto_26663 ?auto_26669 ) ) ( not ( = ?auto_26663 ?auto_26687 ) ) ( not ( = ?auto_26664 ?auto_26669 ) ) ( not ( = ?auto_26664 ?auto_26687 ) ) ( not ( = ?auto_26665 ?auto_26669 ) ) ( not ( = ?auto_26665 ?auto_26687 ) ) ( not ( = ?auto_26666 ?auto_26669 ) ) ( not ( = ?auto_26666 ?auto_26687 ) ) ( not ( = ?auto_26667 ?auto_26669 ) ) ( not ( = ?auto_26667 ?auto_26687 ) ) ( not ( = ?auto_26669 ?auto_26679 ) ) ( not ( = ?auto_26669 ?auto_26702 ) ) ( not ( = ?auto_26669 ?auto_26699 ) ) ( not ( = ?auto_26669 ?auto_26688 ) ) ( not ( = ?auto_26669 ?auto_26683 ) ) ( not ( = ?auto_26669 ?auto_26696 ) ) ( not ( = ?auto_26669 ?auto_26693 ) ) ( not ( = ?auto_26701 ?auto_26689 ) ) ( not ( = ?auto_26701 ?auto_26686 ) ) ( not ( = ?auto_26701 ?auto_26680 ) ) ( not ( = ?auto_26701 ?auto_26692 ) ) ( not ( = ?auto_26701 ?auto_26690 ) ) ( not ( = ?auto_26701 ?auto_26691 ) ) ( not ( = ?auto_26685 ?auto_26682 ) ) ( not ( = ?auto_26685 ?auto_26694 ) ) ( not ( = ?auto_26685 ?auto_26700 ) ) ( not ( = ?auto_26685 ?auto_26684 ) ) ( not ( = ?auto_26685 ?auto_26698 ) ) ( not ( = ?auto_26685 ?auto_26695 ) ) ( not ( = ?auto_26687 ?auto_26679 ) ) ( not ( = ?auto_26687 ?auto_26702 ) ) ( not ( = ?auto_26687 ?auto_26699 ) ) ( not ( = ?auto_26687 ?auto_26688 ) ) ( not ( = ?auto_26687 ?auto_26683 ) ) ( not ( = ?auto_26687 ?auto_26696 ) ) ( not ( = ?auto_26687 ?auto_26693 ) ) ( not ( = ?auto_26661 ?auto_26668 ) ) ( not ( = ?auto_26661 ?auto_26697 ) ) ( not ( = ?auto_26662 ?auto_26668 ) ) ( not ( = ?auto_26662 ?auto_26697 ) ) ( not ( = ?auto_26663 ?auto_26668 ) ) ( not ( = ?auto_26663 ?auto_26697 ) ) ( not ( = ?auto_26664 ?auto_26668 ) ) ( not ( = ?auto_26664 ?auto_26697 ) ) ( not ( = ?auto_26665 ?auto_26668 ) ) ( not ( = ?auto_26665 ?auto_26697 ) ) ( not ( = ?auto_26666 ?auto_26668 ) ) ( not ( = ?auto_26666 ?auto_26697 ) ) ( not ( = ?auto_26667 ?auto_26668 ) ) ( not ( = ?auto_26667 ?auto_26697 ) ) ( not ( = ?auto_26670 ?auto_26668 ) ) ( not ( = ?auto_26670 ?auto_26697 ) ) ( not ( = ?auto_26668 ?auto_26687 ) ) ( not ( = ?auto_26668 ?auto_26679 ) ) ( not ( = ?auto_26668 ?auto_26702 ) ) ( not ( = ?auto_26668 ?auto_26699 ) ) ( not ( = ?auto_26668 ?auto_26688 ) ) ( not ( = ?auto_26668 ?auto_26683 ) ) ( not ( = ?auto_26668 ?auto_26696 ) ) ( not ( = ?auto_26668 ?auto_26693 ) ) ( not ( = ?auto_26697 ?auto_26687 ) ) ( not ( = ?auto_26697 ?auto_26679 ) ) ( not ( = ?auto_26697 ?auto_26702 ) ) ( not ( = ?auto_26697 ?auto_26699 ) ) ( not ( = ?auto_26697 ?auto_26688 ) ) ( not ( = ?auto_26697 ?auto_26683 ) ) ( not ( = ?auto_26697 ?auto_26696 ) ) ( not ( = ?auto_26697 ?auto_26693 ) ) ( not ( = ?auto_26661 ?auto_26671 ) ) ( not ( = ?auto_26661 ?auto_26681 ) ) ( not ( = ?auto_26662 ?auto_26671 ) ) ( not ( = ?auto_26662 ?auto_26681 ) ) ( not ( = ?auto_26663 ?auto_26671 ) ) ( not ( = ?auto_26663 ?auto_26681 ) ) ( not ( = ?auto_26664 ?auto_26671 ) ) ( not ( = ?auto_26664 ?auto_26681 ) ) ( not ( = ?auto_26665 ?auto_26671 ) ) ( not ( = ?auto_26665 ?auto_26681 ) ) ( not ( = ?auto_26666 ?auto_26671 ) ) ( not ( = ?auto_26666 ?auto_26681 ) ) ( not ( = ?auto_26667 ?auto_26671 ) ) ( not ( = ?auto_26667 ?auto_26681 ) ) ( not ( = ?auto_26670 ?auto_26671 ) ) ( not ( = ?auto_26670 ?auto_26681 ) ) ( not ( = ?auto_26669 ?auto_26671 ) ) ( not ( = ?auto_26669 ?auto_26681 ) ) ( not ( = ?auto_26671 ?auto_26697 ) ) ( not ( = ?auto_26671 ?auto_26687 ) ) ( not ( = ?auto_26671 ?auto_26679 ) ) ( not ( = ?auto_26671 ?auto_26702 ) ) ( not ( = ?auto_26671 ?auto_26699 ) ) ( not ( = ?auto_26671 ?auto_26688 ) ) ( not ( = ?auto_26671 ?auto_26683 ) ) ( not ( = ?auto_26671 ?auto_26696 ) ) ( not ( = ?auto_26671 ?auto_26693 ) ) ( not ( = ?auto_26681 ?auto_26697 ) ) ( not ( = ?auto_26681 ?auto_26687 ) ) ( not ( = ?auto_26681 ?auto_26679 ) ) ( not ( = ?auto_26681 ?auto_26702 ) ) ( not ( = ?auto_26681 ?auto_26699 ) ) ( not ( = ?auto_26681 ?auto_26688 ) ) ( not ( = ?auto_26681 ?auto_26683 ) ) ( not ( = ?auto_26681 ?auto_26696 ) ) ( not ( = ?auto_26681 ?auto_26693 ) ) ( not ( = ?auto_26661 ?auto_26672 ) ) ( not ( = ?auto_26661 ?auto_26677 ) ) ( not ( = ?auto_26662 ?auto_26672 ) ) ( not ( = ?auto_26662 ?auto_26677 ) ) ( not ( = ?auto_26663 ?auto_26672 ) ) ( not ( = ?auto_26663 ?auto_26677 ) ) ( not ( = ?auto_26664 ?auto_26672 ) ) ( not ( = ?auto_26664 ?auto_26677 ) ) ( not ( = ?auto_26665 ?auto_26672 ) ) ( not ( = ?auto_26665 ?auto_26677 ) ) ( not ( = ?auto_26666 ?auto_26672 ) ) ( not ( = ?auto_26666 ?auto_26677 ) ) ( not ( = ?auto_26667 ?auto_26672 ) ) ( not ( = ?auto_26667 ?auto_26677 ) ) ( not ( = ?auto_26670 ?auto_26672 ) ) ( not ( = ?auto_26670 ?auto_26677 ) ) ( not ( = ?auto_26669 ?auto_26672 ) ) ( not ( = ?auto_26669 ?auto_26677 ) ) ( not ( = ?auto_26668 ?auto_26672 ) ) ( not ( = ?auto_26668 ?auto_26677 ) ) ( not ( = ?auto_26672 ?auto_26681 ) ) ( not ( = ?auto_26672 ?auto_26697 ) ) ( not ( = ?auto_26672 ?auto_26687 ) ) ( not ( = ?auto_26672 ?auto_26679 ) ) ( not ( = ?auto_26672 ?auto_26702 ) ) ( not ( = ?auto_26672 ?auto_26699 ) ) ( not ( = ?auto_26672 ?auto_26688 ) ) ( not ( = ?auto_26672 ?auto_26683 ) ) ( not ( = ?auto_26672 ?auto_26696 ) ) ( not ( = ?auto_26672 ?auto_26693 ) ) ( not ( = ?auto_26678 ?auto_26690 ) ) ( not ( = ?auto_26678 ?auto_26691 ) ) ( not ( = ?auto_26678 ?auto_26701 ) ) ( not ( = ?auto_26678 ?auto_26689 ) ) ( not ( = ?auto_26678 ?auto_26686 ) ) ( not ( = ?auto_26678 ?auto_26680 ) ) ( not ( = ?auto_26678 ?auto_26692 ) ) ( not ( = ?auto_26676 ?auto_26698 ) ) ( not ( = ?auto_26676 ?auto_26695 ) ) ( not ( = ?auto_26676 ?auto_26685 ) ) ( not ( = ?auto_26676 ?auto_26682 ) ) ( not ( = ?auto_26676 ?auto_26694 ) ) ( not ( = ?auto_26676 ?auto_26700 ) ) ( not ( = ?auto_26676 ?auto_26684 ) ) ( not ( = ?auto_26677 ?auto_26681 ) ) ( not ( = ?auto_26677 ?auto_26697 ) ) ( not ( = ?auto_26677 ?auto_26687 ) ) ( not ( = ?auto_26677 ?auto_26679 ) ) ( not ( = ?auto_26677 ?auto_26702 ) ) ( not ( = ?auto_26677 ?auto_26699 ) ) ( not ( = ?auto_26677 ?auto_26688 ) ) ( not ( = ?auto_26677 ?auto_26683 ) ) ( not ( = ?auto_26677 ?auto_26696 ) ) ( not ( = ?auto_26677 ?auto_26693 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_26661 ?auto_26662 ?auto_26663 ?auto_26664 ?auto_26665 ?auto_26666 ?auto_26667 ?auto_26670 ?auto_26669 ?auto_26668 ?auto_26671 )
      ( MAKE-1CRATE ?auto_26671 ?auto_26672 )
      ( MAKE-11CRATE-VERIFY ?auto_26661 ?auto_26662 ?auto_26663 ?auto_26664 ?auto_26665 ?auto_26666 ?auto_26667 ?auto_26670 ?auto_26669 ?auto_26668 ?auto_26671 ?auto_26672 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26705 - SURFACE
      ?auto_26706 - SURFACE
    )
    :vars
    (
      ?auto_26707 - HOIST
      ?auto_26708 - PLACE
      ?auto_26710 - PLACE
      ?auto_26711 - HOIST
      ?auto_26712 - SURFACE
      ?auto_26709 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26707 ?auto_26708 ) ( SURFACE-AT ?auto_26705 ?auto_26708 ) ( CLEAR ?auto_26705 ) ( IS-CRATE ?auto_26706 ) ( AVAILABLE ?auto_26707 ) ( not ( = ?auto_26710 ?auto_26708 ) ) ( HOIST-AT ?auto_26711 ?auto_26710 ) ( AVAILABLE ?auto_26711 ) ( SURFACE-AT ?auto_26706 ?auto_26710 ) ( ON ?auto_26706 ?auto_26712 ) ( CLEAR ?auto_26706 ) ( TRUCK-AT ?auto_26709 ?auto_26708 ) ( not ( = ?auto_26705 ?auto_26706 ) ) ( not ( = ?auto_26705 ?auto_26712 ) ) ( not ( = ?auto_26706 ?auto_26712 ) ) ( not ( = ?auto_26707 ?auto_26711 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26709 ?auto_26708 ?auto_26710 )
      ( !LIFT ?auto_26711 ?auto_26706 ?auto_26712 ?auto_26710 )
      ( !LOAD ?auto_26711 ?auto_26706 ?auto_26709 ?auto_26710 )
      ( !DRIVE ?auto_26709 ?auto_26710 ?auto_26708 )
      ( !UNLOAD ?auto_26707 ?auto_26706 ?auto_26709 ?auto_26708 )
      ( !DROP ?auto_26707 ?auto_26706 ?auto_26705 ?auto_26708 )
      ( MAKE-1CRATE-VERIFY ?auto_26705 ?auto_26706 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_26726 - SURFACE
      ?auto_26727 - SURFACE
      ?auto_26728 - SURFACE
      ?auto_26729 - SURFACE
      ?auto_26730 - SURFACE
      ?auto_26731 - SURFACE
      ?auto_26732 - SURFACE
      ?auto_26735 - SURFACE
      ?auto_26734 - SURFACE
      ?auto_26733 - SURFACE
      ?auto_26736 - SURFACE
      ?auto_26737 - SURFACE
      ?auto_26738 - SURFACE
    )
    :vars
    (
      ?auto_26742 - HOIST
      ?auto_26739 - PLACE
      ?auto_26743 - PLACE
      ?auto_26741 - HOIST
      ?auto_26740 - SURFACE
      ?auto_26760 - PLACE
      ?auto_26762 - HOIST
      ?auto_26759 - SURFACE
      ?auto_26753 - PLACE
      ?auto_26767 - HOIST
      ?auto_26765 - SURFACE
      ?auto_26745 - SURFACE
      ?auto_26755 - PLACE
      ?auto_26766 - HOIST
      ?auto_26769 - SURFACE
      ?auto_26756 - PLACE
      ?auto_26768 - HOIST
      ?auto_26754 - SURFACE
      ?auto_26746 - PLACE
      ?auto_26751 - HOIST
      ?auto_26764 - SURFACE
      ?auto_26761 - PLACE
      ?auto_26763 - HOIST
      ?auto_26749 - SURFACE
      ?auto_26752 - PLACE
      ?auto_26758 - HOIST
      ?auto_26757 - SURFACE
      ?auto_26750 - SURFACE
      ?auto_26748 - SURFACE
      ?auto_26747 - SURFACE
      ?auto_26744 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26742 ?auto_26739 ) ( IS-CRATE ?auto_26738 ) ( not ( = ?auto_26743 ?auto_26739 ) ) ( HOIST-AT ?auto_26741 ?auto_26743 ) ( SURFACE-AT ?auto_26738 ?auto_26743 ) ( ON ?auto_26738 ?auto_26740 ) ( CLEAR ?auto_26738 ) ( not ( = ?auto_26737 ?auto_26738 ) ) ( not ( = ?auto_26737 ?auto_26740 ) ) ( not ( = ?auto_26738 ?auto_26740 ) ) ( not ( = ?auto_26742 ?auto_26741 ) ) ( IS-CRATE ?auto_26737 ) ( not ( = ?auto_26760 ?auto_26739 ) ) ( HOIST-AT ?auto_26762 ?auto_26760 ) ( AVAILABLE ?auto_26762 ) ( SURFACE-AT ?auto_26737 ?auto_26760 ) ( ON ?auto_26737 ?auto_26759 ) ( CLEAR ?auto_26737 ) ( not ( = ?auto_26736 ?auto_26737 ) ) ( not ( = ?auto_26736 ?auto_26759 ) ) ( not ( = ?auto_26737 ?auto_26759 ) ) ( not ( = ?auto_26742 ?auto_26762 ) ) ( IS-CRATE ?auto_26736 ) ( not ( = ?auto_26753 ?auto_26739 ) ) ( HOIST-AT ?auto_26767 ?auto_26753 ) ( SURFACE-AT ?auto_26736 ?auto_26753 ) ( ON ?auto_26736 ?auto_26765 ) ( CLEAR ?auto_26736 ) ( not ( = ?auto_26733 ?auto_26736 ) ) ( not ( = ?auto_26733 ?auto_26765 ) ) ( not ( = ?auto_26736 ?auto_26765 ) ) ( not ( = ?auto_26742 ?auto_26767 ) ) ( IS-CRATE ?auto_26733 ) ( SURFACE-AT ?auto_26733 ?auto_26743 ) ( ON ?auto_26733 ?auto_26745 ) ( CLEAR ?auto_26733 ) ( not ( = ?auto_26734 ?auto_26733 ) ) ( not ( = ?auto_26734 ?auto_26745 ) ) ( not ( = ?auto_26733 ?auto_26745 ) ) ( IS-CRATE ?auto_26734 ) ( not ( = ?auto_26755 ?auto_26739 ) ) ( HOIST-AT ?auto_26766 ?auto_26755 ) ( AVAILABLE ?auto_26766 ) ( SURFACE-AT ?auto_26734 ?auto_26755 ) ( ON ?auto_26734 ?auto_26769 ) ( CLEAR ?auto_26734 ) ( not ( = ?auto_26735 ?auto_26734 ) ) ( not ( = ?auto_26735 ?auto_26769 ) ) ( not ( = ?auto_26734 ?auto_26769 ) ) ( not ( = ?auto_26742 ?auto_26766 ) ) ( IS-CRATE ?auto_26735 ) ( not ( = ?auto_26756 ?auto_26739 ) ) ( HOIST-AT ?auto_26768 ?auto_26756 ) ( AVAILABLE ?auto_26768 ) ( SURFACE-AT ?auto_26735 ?auto_26756 ) ( ON ?auto_26735 ?auto_26754 ) ( CLEAR ?auto_26735 ) ( not ( = ?auto_26732 ?auto_26735 ) ) ( not ( = ?auto_26732 ?auto_26754 ) ) ( not ( = ?auto_26735 ?auto_26754 ) ) ( not ( = ?auto_26742 ?auto_26768 ) ) ( IS-CRATE ?auto_26732 ) ( not ( = ?auto_26746 ?auto_26739 ) ) ( HOIST-AT ?auto_26751 ?auto_26746 ) ( AVAILABLE ?auto_26751 ) ( SURFACE-AT ?auto_26732 ?auto_26746 ) ( ON ?auto_26732 ?auto_26764 ) ( CLEAR ?auto_26732 ) ( not ( = ?auto_26731 ?auto_26732 ) ) ( not ( = ?auto_26731 ?auto_26764 ) ) ( not ( = ?auto_26732 ?auto_26764 ) ) ( not ( = ?auto_26742 ?auto_26751 ) ) ( IS-CRATE ?auto_26731 ) ( not ( = ?auto_26761 ?auto_26739 ) ) ( HOIST-AT ?auto_26763 ?auto_26761 ) ( AVAILABLE ?auto_26763 ) ( SURFACE-AT ?auto_26731 ?auto_26761 ) ( ON ?auto_26731 ?auto_26749 ) ( CLEAR ?auto_26731 ) ( not ( = ?auto_26730 ?auto_26731 ) ) ( not ( = ?auto_26730 ?auto_26749 ) ) ( not ( = ?auto_26731 ?auto_26749 ) ) ( not ( = ?auto_26742 ?auto_26763 ) ) ( IS-CRATE ?auto_26730 ) ( not ( = ?auto_26752 ?auto_26739 ) ) ( HOIST-AT ?auto_26758 ?auto_26752 ) ( SURFACE-AT ?auto_26730 ?auto_26752 ) ( ON ?auto_26730 ?auto_26757 ) ( CLEAR ?auto_26730 ) ( not ( = ?auto_26729 ?auto_26730 ) ) ( not ( = ?auto_26729 ?auto_26757 ) ) ( not ( = ?auto_26730 ?auto_26757 ) ) ( not ( = ?auto_26742 ?auto_26758 ) ) ( IS-CRATE ?auto_26729 ) ( AVAILABLE ?auto_26767 ) ( SURFACE-AT ?auto_26729 ?auto_26753 ) ( ON ?auto_26729 ?auto_26750 ) ( CLEAR ?auto_26729 ) ( not ( = ?auto_26728 ?auto_26729 ) ) ( not ( = ?auto_26728 ?auto_26750 ) ) ( not ( = ?auto_26729 ?auto_26750 ) ) ( IS-CRATE ?auto_26728 ) ( AVAILABLE ?auto_26758 ) ( SURFACE-AT ?auto_26728 ?auto_26752 ) ( ON ?auto_26728 ?auto_26748 ) ( CLEAR ?auto_26728 ) ( not ( = ?auto_26727 ?auto_26728 ) ) ( not ( = ?auto_26727 ?auto_26748 ) ) ( not ( = ?auto_26728 ?auto_26748 ) ) ( SURFACE-AT ?auto_26726 ?auto_26739 ) ( CLEAR ?auto_26726 ) ( IS-CRATE ?auto_26727 ) ( AVAILABLE ?auto_26742 ) ( AVAILABLE ?auto_26741 ) ( SURFACE-AT ?auto_26727 ?auto_26743 ) ( ON ?auto_26727 ?auto_26747 ) ( CLEAR ?auto_26727 ) ( TRUCK-AT ?auto_26744 ?auto_26739 ) ( not ( = ?auto_26726 ?auto_26727 ) ) ( not ( = ?auto_26726 ?auto_26747 ) ) ( not ( = ?auto_26727 ?auto_26747 ) ) ( not ( = ?auto_26726 ?auto_26728 ) ) ( not ( = ?auto_26726 ?auto_26748 ) ) ( not ( = ?auto_26728 ?auto_26747 ) ) ( not ( = ?auto_26752 ?auto_26743 ) ) ( not ( = ?auto_26758 ?auto_26741 ) ) ( not ( = ?auto_26748 ?auto_26747 ) ) ( not ( = ?auto_26726 ?auto_26729 ) ) ( not ( = ?auto_26726 ?auto_26750 ) ) ( not ( = ?auto_26727 ?auto_26729 ) ) ( not ( = ?auto_26727 ?auto_26750 ) ) ( not ( = ?auto_26729 ?auto_26748 ) ) ( not ( = ?auto_26729 ?auto_26747 ) ) ( not ( = ?auto_26753 ?auto_26752 ) ) ( not ( = ?auto_26753 ?auto_26743 ) ) ( not ( = ?auto_26767 ?auto_26758 ) ) ( not ( = ?auto_26767 ?auto_26741 ) ) ( not ( = ?auto_26750 ?auto_26748 ) ) ( not ( = ?auto_26750 ?auto_26747 ) ) ( not ( = ?auto_26726 ?auto_26730 ) ) ( not ( = ?auto_26726 ?auto_26757 ) ) ( not ( = ?auto_26727 ?auto_26730 ) ) ( not ( = ?auto_26727 ?auto_26757 ) ) ( not ( = ?auto_26728 ?auto_26730 ) ) ( not ( = ?auto_26728 ?auto_26757 ) ) ( not ( = ?auto_26730 ?auto_26750 ) ) ( not ( = ?auto_26730 ?auto_26748 ) ) ( not ( = ?auto_26730 ?auto_26747 ) ) ( not ( = ?auto_26757 ?auto_26750 ) ) ( not ( = ?auto_26757 ?auto_26748 ) ) ( not ( = ?auto_26757 ?auto_26747 ) ) ( not ( = ?auto_26726 ?auto_26731 ) ) ( not ( = ?auto_26726 ?auto_26749 ) ) ( not ( = ?auto_26727 ?auto_26731 ) ) ( not ( = ?auto_26727 ?auto_26749 ) ) ( not ( = ?auto_26728 ?auto_26731 ) ) ( not ( = ?auto_26728 ?auto_26749 ) ) ( not ( = ?auto_26729 ?auto_26731 ) ) ( not ( = ?auto_26729 ?auto_26749 ) ) ( not ( = ?auto_26731 ?auto_26757 ) ) ( not ( = ?auto_26731 ?auto_26750 ) ) ( not ( = ?auto_26731 ?auto_26748 ) ) ( not ( = ?auto_26731 ?auto_26747 ) ) ( not ( = ?auto_26761 ?auto_26752 ) ) ( not ( = ?auto_26761 ?auto_26753 ) ) ( not ( = ?auto_26761 ?auto_26743 ) ) ( not ( = ?auto_26763 ?auto_26758 ) ) ( not ( = ?auto_26763 ?auto_26767 ) ) ( not ( = ?auto_26763 ?auto_26741 ) ) ( not ( = ?auto_26749 ?auto_26757 ) ) ( not ( = ?auto_26749 ?auto_26750 ) ) ( not ( = ?auto_26749 ?auto_26748 ) ) ( not ( = ?auto_26749 ?auto_26747 ) ) ( not ( = ?auto_26726 ?auto_26732 ) ) ( not ( = ?auto_26726 ?auto_26764 ) ) ( not ( = ?auto_26727 ?auto_26732 ) ) ( not ( = ?auto_26727 ?auto_26764 ) ) ( not ( = ?auto_26728 ?auto_26732 ) ) ( not ( = ?auto_26728 ?auto_26764 ) ) ( not ( = ?auto_26729 ?auto_26732 ) ) ( not ( = ?auto_26729 ?auto_26764 ) ) ( not ( = ?auto_26730 ?auto_26732 ) ) ( not ( = ?auto_26730 ?auto_26764 ) ) ( not ( = ?auto_26732 ?auto_26749 ) ) ( not ( = ?auto_26732 ?auto_26757 ) ) ( not ( = ?auto_26732 ?auto_26750 ) ) ( not ( = ?auto_26732 ?auto_26748 ) ) ( not ( = ?auto_26732 ?auto_26747 ) ) ( not ( = ?auto_26746 ?auto_26761 ) ) ( not ( = ?auto_26746 ?auto_26752 ) ) ( not ( = ?auto_26746 ?auto_26753 ) ) ( not ( = ?auto_26746 ?auto_26743 ) ) ( not ( = ?auto_26751 ?auto_26763 ) ) ( not ( = ?auto_26751 ?auto_26758 ) ) ( not ( = ?auto_26751 ?auto_26767 ) ) ( not ( = ?auto_26751 ?auto_26741 ) ) ( not ( = ?auto_26764 ?auto_26749 ) ) ( not ( = ?auto_26764 ?auto_26757 ) ) ( not ( = ?auto_26764 ?auto_26750 ) ) ( not ( = ?auto_26764 ?auto_26748 ) ) ( not ( = ?auto_26764 ?auto_26747 ) ) ( not ( = ?auto_26726 ?auto_26735 ) ) ( not ( = ?auto_26726 ?auto_26754 ) ) ( not ( = ?auto_26727 ?auto_26735 ) ) ( not ( = ?auto_26727 ?auto_26754 ) ) ( not ( = ?auto_26728 ?auto_26735 ) ) ( not ( = ?auto_26728 ?auto_26754 ) ) ( not ( = ?auto_26729 ?auto_26735 ) ) ( not ( = ?auto_26729 ?auto_26754 ) ) ( not ( = ?auto_26730 ?auto_26735 ) ) ( not ( = ?auto_26730 ?auto_26754 ) ) ( not ( = ?auto_26731 ?auto_26735 ) ) ( not ( = ?auto_26731 ?auto_26754 ) ) ( not ( = ?auto_26735 ?auto_26764 ) ) ( not ( = ?auto_26735 ?auto_26749 ) ) ( not ( = ?auto_26735 ?auto_26757 ) ) ( not ( = ?auto_26735 ?auto_26750 ) ) ( not ( = ?auto_26735 ?auto_26748 ) ) ( not ( = ?auto_26735 ?auto_26747 ) ) ( not ( = ?auto_26756 ?auto_26746 ) ) ( not ( = ?auto_26756 ?auto_26761 ) ) ( not ( = ?auto_26756 ?auto_26752 ) ) ( not ( = ?auto_26756 ?auto_26753 ) ) ( not ( = ?auto_26756 ?auto_26743 ) ) ( not ( = ?auto_26768 ?auto_26751 ) ) ( not ( = ?auto_26768 ?auto_26763 ) ) ( not ( = ?auto_26768 ?auto_26758 ) ) ( not ( = ?auto_26768 ?auto_26767 ) ) ( not ( = ?auto_26768 ?auto_26741 ) ) ( not ( = ?auto_26754 ?auto_26764 ) ) ( not ( = ?auto_26754 ?auto_26749 ) ) ( not ( = ?auto_26754 ?auto_26757 ) ) ( not ( = ?auto_26754 ?auto_26750 ) ) ( not ( = ?auto_26754 ?auto_26748 ) ) ( not ( = ?auto_26754 ?auto_26747 ) ) ( not ( = ?auto_26726 ?auto_26734 ) ) ( not ( = ?auto_26726 ?auto_26769 ) ) ( not ( = ?auto_26727 ?auto_26734 ) ) ( not ( = ?auto_26727 ?auto_26769 ) ) ( not ( = ?auto_26728 ?auto_26734 ) ) ( not ( = ?auto_26728 ?auto_26769 ) ) ( not ( = ?auto_26729 ?auto_26734 ) ) ( not ( = ?auto_26729 ?auto_26769 ) ) ( not ( = ?auto_26730 ?auto_26734 ) ) ( not ( = ?auto_26730 ?auto_26769 ) ) ( not ( = ?auto_26731 ?auto_26734 ) ) ( not ( = ?auto_26731 ?auto_26769 ) ) ( not ( = ?auto_26732 ?auto_26734 ) ) ( not ( = ?auto_26732 ?auto_26769 ) ) ( not ( = ?auto_26734 ?auto_26754 ) ) ( not ( = ?auto_26734 ?auto_26764 ) ) ( not ( = ?auto_26734 ?auto_26749 ) ) ( not ( = ?auto_26734 ?auto_26757 ) ) ( not ( = ?auto_26734 ?auto_26750 ) ) ( not ( = ?auto_26734 ?auto_26748 ) ) ( not ( = ?auto_26734 ?auto_26747 ) ) ( not ( = ?auto_26755 ?auto_26756 ) ) ( not ( = ?auto_26755 ?auto_26746 ) ) ( not ( = ?auto_26755 ?auto_26761 ) ) ( not ( = ?auto_26755 ?auto_26752 ) ) ( not ( = ?auto_26755 ?auto_26753 ) ) ( not ( = ?auto_26755 ?auto_26743 ) ) ( not ( = ?auto_26766 ?auto_26768 ) ) ( not ( = ?auto_26766 ?auto_26751 ) ) ( not ( = ?auto_26766 ?auto_26763 ) ) ( not ( = ?auto_26766 ?auto_26758 ) ) ( not ( = ?auto_26766 ?auto_26767 ) ) ( not ( = ?auto_26766 ?auto_26741 ) ) ( not ( = ?auto_26769 ?auto_26754 ) ) ( not ( = ?auto_26769 ?auto_26764 ) ) ( not ( = ?auto_26769 ?auto_26749 ) ) ( not ( = ?auto_26769 ?auto_26757 ) ) ( not ( = ?auto_26769 ?auto_26750 ) ) ( not ( = ?auto_26769 ?auto_26748 ) ) ( not ( = ?auto_26769 ?auto_26747 ) ) ( not ( = ?auto_26726 ?auto_26733 ) ) ( not ( = ?auto_26726 ?auto_26745 ) ) ( not ( = ?auto_26727 ?auto_26733 ) ) ( not ( = ?auto_26727 ?auto_26745 ) ) ( not ( = ?auto_26728 ?auto_26733 ) ) ( not ( = ?auto_26728 ?auto_26745 ) ) ( not ( = ?auto_26729 ?auto_26733 ) ) ( not ( = ?auto_26729 ?auto_26745 ) ) ( not ( = ?auto_26730 ?auto_26733 ) ) ( not ( = ?auto_26730 ?auto_26745 ) ) ( not ( = ?auto_26731 ?auto_26733 ) ) ( not ( = ?auto_26731 ?auto_26745 ) ) ( not ( = ?auto_26732 ?auto_26733 ) ) ( not ( = ?auto_26732 ?auto_26745 ) ) ( not ( = ?auto_26735 ?auto_26733 ) ) ( not ( = ?auto_26735 ?auto_26745 ) ) ( not ( = ?auto_26733 ?auto_26769 ) ) ( not ( = ?auto_26733 ?auto_26754 ) ) ( not ( = ?auto_26733 ?auto_26764 ) ) ( not ( = ?auto_26733 ?auto_26749 ) ) ( not ( = ?auto_26733 ?auto_26757 ) ) ( not ( = ?auto_26733 ?auto_26750 ) ) ( not ( = ?auto_26733 ?auto_26748 ) ) ( not ( = ?auto_26733 ?auto_26747 ) ) ( not ( = ?auto_26745 ?auto_26769 ) ) ( not ( = ?auto_26745 ?auto_26754 ) ) ( not ( = ?auto_26745 ?auto_26764 ) ) ( not ( = ?auto_26745 ?auto_26749 ) ) ( not ( = ?auto_26745 ?auto_26757 ) ) ( not ( = ?auto_26745 ?auto_26750 ) ) ( not ( = ?auto_26745 ?auto_26748 ) ) ( not ( = ?auto_26745 ?auto_26747 ) ) ( not ( = ?auto_26726 ?auto_26736 ) ) ( not ( = ?auto_26726 ?auto_26765 ) ) ( not ( = ?auto_26727 ?auto_26736 ) ) ( not ( = ?auto_26727 ?auto_26765 ) ) ( not ( = ?auto_26728 ?auto_26736 ) ) ( not ( = ?auto_26728 ?auto_26765 ) ) ( not ( = ?auto_26729 ?auto_26736 ) ) ( not ( = ?auto_26729 ?auto_26765 ) ) ( not ( = ?auto_26730 ?auto_26736 ) ) ( not ( = ?auto_26730 ?auto_26765 ) ) ( not ( = ?auto_26731 ?auto_26736 ) ) ( not ( = ?auto_26731 ?auto_26765 ) ) ( not ( = ?auto_26732 ?auto_26736 ) ) ( not ( = ?auto_26732 ?auto_26765 ) ) ( not ( = ?auto_26735 ?auto_26736 ) ) ( not ( = ?auto_26735 ?auto_26765 ) ) ( not ( = ?auto_26734 ?auto_26736 ) ) ( not ( = ?auto_26734 ?auto_26765 ) ) ( not ( = ?auto_26736 ?auto_26745 ) ) ( not ( = ?auto_26736 ?auto_26769 ) ) ( not ( = ?auto_26736 ?auto_26754 ) ) ( not ( = ?auto_26736 ?auto_26764 ) ) ( not ( = ?auto_26736 ?auto_26749 ) ) ( not ( = ?auto_26736 ?auto_26757 ) ) ( not ( = ?auto_26736 ?auto_26750 ) ) ( not ( = ?auto_26736 ?auto_26748 ) ) ( not ( = ?auto_26736 ?auto_26747 ) ) ( not ( = ?auto_26765 ?auto_26745 ) ) ( not ( = ?auto_26765 ?auto_26769 ) ) ( not ( = ?auto_26765 ?auto_26754 ) ) ( not ( = ?auto_26765 ?auto_26764 ) ) ( not ( = ?auto_26765 ?auto_26749 ) ) ( not ( = ?auto_26765 ?auto_26757 ) ) ( not ( = ?auto_26765 ?auto_26750 ) ) ( not ( = ?auto_26765 ?auto_26748 ) ) ( not ( = ?auto_26765 ?auto_26747 ) ) ( not ( = ?auto_26726 ?auto_26737 ) ) ( not ( = ?auto_26726 ?auto_26759 ) ) ( not ( = ?auto_26727 ?auto_26737 ) ) ( not ( = ?auto_26727 ?auto_26759 ) ) ( not ( = ?auto_26728 ?auto_26737 ) ) ( not ( = ?auto_26728 ?auto_26759 ) ) ( not ( = ?auto_26729 ?auto_26737 ) ) ( not ( = ?auto_26729 ?auto_26759 ) ) ( not ( = ?auto_26730 ?auto_26737 ) ) ( not ( = ?auto_26730 ?auto_26759 ) ) ( not ( = ?auto_26731 ?auto_26737 ) ) ( not ( = ?auto_26731 ?auto_26759 ) ) ( not ( = ?auto_26732 ?auto_26737 ) ) ( not ( = ?auto_26732 ?auto_26759 ) ) ( not ( = ?auto_26735 ?auto_26737 ) ) ( not ( = ?auto_26735 ?auto_26759 ) ) ( not ( = ?auto_26734 ?auto_26737 ) ) ( not ( = ?auto_26734 ?auto_26759 ) ) ( not ( = ?auto_26733 ?auto_26737 ) ) ( not ( = ?auto_26733 ?auto_26759 ) ) ( not ( = ?auto_26737 ?auto_26765 ) ) ( not ( = ?auto_26737 ?auto_26745 ) ) ( not ( = ?auto_26737 ?auto_26769 ) ) ( not ( = ?auto_26737 ?auto_26754 ) ) ( not ( = ?auto_26737 ?auto_26764 ) ) ( not ( = ?auto_26737 ?auto_26749 ) ) ( not ( = ?auto_26737 ?auto_26757 ) ) ( not ( = ?auto_26737 ?auto_26750 ) ) ( not ( = ?auto_26737 ?auto_26748 ) ) ( not ( = ?auto_26737 ?auto_26747 ) ) ( not ( = ?auto_26760 ?auto_26753 ) ) ( not ( = ?auto_26760 ?auto_26743 ) ) ( not ( = ?auto_26760 ?auto_26755 ) ) ( not ( = ?auto_26760 ?auto_26756 ) ) ( not ( = ?auto_26760 ?auto_26746 ) ) ( not ( = ?auto_26760 ?auto_26761 ) ) ( not ( = ?auto_26760 ?auto_26752 ) ) ( not ( = ?auto_26762 ?auto_26767 ) ) ( not ( = ?auto_26762 ?auto_26741 ) ) ( not ( = ?auto_26762 ?auto_26766 ) ) ( not ( = ?auto_26762 ?auto_26768 ) ) ( not ( = ?auto_26762 ?auto_26751 ) ) ( not ( = ?auto_26762 ?auto_26763 ) ) ( not ( = ?auto_26762 ?auto_26758 ) ) ( not ( = ?auto_26759 ?auto_26765 ) ) ( not ( = ?auto_26759 ?auto_26745 ) ) ( not ( = ?auto_26759 ?auto_26769 ) ) ( not ( = ?auto_26759 ?auto_26754 ) ) ( not ( = ?auto_26759 ?auto_26764 ) ) ( not ( = ?auto_26759 ?auto_26749 ) ) ( not ( = ?auto_26759 ?auto_26757 ) ) ( not ( = ?auto_26759 ?auto_26750 ) ) ( not ( = ?auto_26759 ?auto_26748 ) ) ( not ( = ?auto_26759 ?auto_26747 ) ) ( not ( = ?auto_26726 ?auto_26738 ) ) ( not ( = ?auto_26726 ?auto_26740 ) ) ( not ( = ?auto_26727 ?auto_26738 ) ) ( not ( = ?auto_26727 ?auto_26740 ) ) ( not ( = ?auto_26728 ?auto_26738 ) ) ( not ( = ?auto_26728 ?auto_26740 ) ) ( not ( = ?auto_26729 ?auto_26738 ) ) ( not ( = ?auto_26729 ?auto_26740 ) ) ( not ( = ?auto_26730 ?auto_26738 ) ) ( not ( = ?auto_26730 ?auto_26740 ) ) ( not ( = ?auto_26731 ?auto_26738 ) ) ( not ( = ?auto_26731 ?auto_26740 ) ) ( not ( = ?auto_26732 ?auto_26738 ) ) ( not ( = ?auto_26732 ?auto_26740 ) ) ( not ( = ?auto_26735 ?auto_26738 ) ) ( not ( = ?auto_26735 ?auto_26740 ) ) ( not ( = ?auto_26734 ?auto_26738 ) ) ( not ( = ?auto_26734 ?auto_26740 ) ) ( not ( = ?auto_26733 ?auto_26738 ) ) ( not ( = ?auto_26733 ?auto_26740 ) ) ( not ( = ?auto_26736 ?auto_26738 ) ) ( not ( = ?auto_26736 ?auto_26740 ) ) ( not ( = ?auto_26738 ?auto_26759 ) ) ( not ( = ?auto_26738 ?auto_26765 ) ) ( not ( = ?auto_26738 ?auto_26745 ) ) ( not ( = ?auto_26738 ?auto_26769 ) ) ( not ( = ?auto_26738 ?auto_26754 ) ) ( not ( = ?auto_26738 ?auto_26764 ) ) ( not ( = ?auto_26738 ?auto_26749 ) ) ( not ( = ?auto_26738 ?auto_26757 ) ) ( not ( = ?auto_26738 ?auto_26750 ) ) ( not ( = ?auto_26738 ?auto_26748 ) ) ( not ( = ?auto_26738 ?auto_26747 ) ) ( not ( = ?auto_26740 ?auto_26759 ) ) ( not ( = ?auto_26740 ?auto_26765 ) ) ( not ( = ?auto_26740 ?auto_26745 ) ) ( not ( = ?auto_26740 ?auto_26769 ) ) ( not ( = ?auto_26740 ?auto_26754 ) ) ( not ( = ?auto_26740 ?auto_26764 ) ) ( not ( = ?auto_26740 ?auto_26749 ) ) ( not ( = ?auto_26740 ?auto_26757 ) ) ( not ( = ?auto_26740 ?auto_26750 ) ) ( not ( = ?auto_26740 ?auto_26748 ) ) ( not ( = ?auto_26740 ?auto_26747 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_26726 ?auto_26727 ?auto_26728 ?auto_26729 ?auto_26730 ?auto_26731 ?auto_26732 ?auto_26735 ?auto_26734 ?auto_26733 ?auto_26736 ?auto_26737 )
      ( MAKE-1CRATE ?auto_26737 ?auto_26738 )
      ( MAKE-12CRATE-VERIFY ?auto_26726 ?auto_26727 ?auto_26728 ?auto_26729 ?auto_26730 ?auto_26731 ?auto_26732 ?auto_26735 ?auto_26734 ?auto_26733 ?auto_26736 ?auto_26737 ?auto_26738 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26772 - SURFACE
      ?auto_26773 - SURFACE
    )
    :vars
    (
      ?auto_26774 - HOIST
      ?auto_26775 - PLACE
      ?auto_26777 - PLACE
      ?auto_26778 - HOIST
      ?auto_26779 - SURFACE
      ?auto_26776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26774 ?auto_26775 ) ( SURFACE-AT ?auto_26772 ?auto_26775 ) ( CLEAR ?auto_26772 ) ( IS-CRATE ?auto_26773 ) ( AVAILABLE ?auto_26774 ) ( not ( = ?auto_26777 ?auto_26775 ) ) ( HOIST-AT ?auto_26778 ?auto_26777 ) ( AVAILABLE ?auto_26778 ) ( SURFACE-AT ?auto_26773 ?auto_26777 ) ( ON ?auto_26773 ?auto_26779 ) ( CLEAR ?auto_26773 ) ( TRUCK-AT ?auto_26776 ?auto_26775 ) ( not ( = ?auto_26772 ?auto_26773 ) ) ( not ( = ?auto_26772 ?auto_26779 ) ) ( not ( = ?auto_26773 ?auto_26779 ) ) ( not ( = ?auto_26774 ?auto_26778 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26776 ?auto_26775 ?auto_26777 )
      ( !LIFT ?auto_26778 ?auto_26773 ?auto_26779 ?auto_26777 )
      ( !LOAD ?auto_26778 ?auto_26773 ?auto_26776 ?auto_26777 )
      ( !DRIVE ?auto_26776 ?auto_26777 ?auto_26775 )
      ( !UNLOAD ?auto_26774 ?auto_26773 ?auto_26776 ?auto_26775 )
      ( !DROP ?auto_26774 ?auto_26773 ?auto_26772 ?auto_26775 )
      ( MAKE-1CRATE-VERIFY ?auto_26772 ?auto_26773 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_26794 - SURFACE
      ?auto_26795 - SURFACE
      ?auto_26796 - SURFACE
      ?auto_26797 - SURFACE
      ?auto_26798 - SURFACE
      ?auto_26799 - SURFACE
      ?auto_26800 - SURFACE
      ?auto_26803 - SURFACE
      ?auto_26802 - SURFACE
      ?auto_26801 - SURFACE
      ?auto_26804 - SURFACE
      ?auto_26805 - SURFACE
      ?auto_26806 - SURFACE
      ?auto_26807 - SURFACE
    )
    :vars
    (
      ?auto_26810 - HOIST
      ?auto_26808 - PLACE
      ?auto_26811 - PLACE
      ?auto_26812 - HOIST
      ?auto_26813 - SURFACE
      ?auto_26841 - PLACE
      ?auto_26824 - HOIST
      ?auto_26827 - SURFACE
      ?auto_26819 - PLACE
      ?auto_26814 - HOIST
      ?auto_26836 - SURFACE
      ?auto_26821 - PLACE
      ?auto_26837 - HOIST
      ?auto_26820 - SURFACE
      ?auto_26838 - SURFACE
      ?auto_26818 - PLACE
      ?auto_26832 - HOIST
      ?auto_26833 - SURFACE
      ?auto_26816 - PLACE
      ?auto_26835 - HOIST
      ?auto_26829 - SURFACE
      ?auto_26822 - PLACE
      ?auto_26823 - HOIST
      ?auto_26840 - SURFACE
      ?auto_26839 - PLACE
      ?auto_26825 - HOIST
      ?auto_26815 - SURFACE
      ?auto_26834 - PLACE
      ?auto_26817 - HOIST
      ?auto_26826 - SURFACE
      ?auto_26830 - SURFACE
      ?auto_26828 - SURFACE
      ?auto_26831 - SURFACE
      ?auto_26809 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26810 ?auto_26808 ) ( IS-CRATE ?auto_26807 ) ( not ( = ?auto_26811 ?auto_26808 ) ) ( HOIST-AT ?auto_26812 ?auto_26811 ) ( AVAILABLE ?auto_26812 ) ( SURFACE-AT ?auto_26807 ?auto_26811 ) ( ON ?auto_26807 ?auto_26813 ) ( CLEAR ?auto_26807 ) ( not ( = ?auto_26806 ?auto_26807 ) ) ( not ( = ?auto_26806 ?auto_26813 ) ) ( not ( = ?auto_26807 ?auto_26813 ) ) ( not ( = ?auto_26810 ?auto_26812 ) ) ( IS-CRATE ?auto_26806 ) ( not ( = ?auto_26841 ?auto_26808 ) ) ( HOIST-AT ?auto_26824 ?auto_26841 ) ( SURFACE-AT ?auto_26806 ?auto_26841 ) ( ON ?auto_26806 ?auto_26827 ) ( CLEAR ?auto_26806 ) ( not ( = ?auto_26805 ?auto_26806 ) ) ( not ( = ?auto_26805 ?auto_26827 ) ) ( not ( = ?auto_26806 ?auto_26827 ) ) ( not ( = ?auto_26810 ?auto_26824 ) ) ( IS-CRATE ?auto_26805 ) ( not ( = ?auto_26819 ?auto_26808 ) ) ( HOIST-AT ?auto_26814 ?auto_26819 ) ( AVAILABLE ?auto_26814 ) ( SURFACE-AT ?auto_26805 ?auto_26819 ) ( ON ?auto_26805 ?auto_26836 ) ( CLEAR ?auto_26805 ) ( not ( = ?auto_26804 ?auto_26805 ) ) ( not ( = ?auto_26804 ?auto_26836 ) ) ( not ( = ?auto_26805 ?auto_26836 ) ) ( not ( = ?auto_26810 ?auto_26814 ) ) ( IS-CRATE ?auto_26804 ) ( not ( = ?auto_26821 ?auto_26808 ) ) ( HOIST-AT ?auto_26837 ?auto_26821 ) ( SURFACE-AT ?auto_26804 ?auto_26821 ) ( ON ?auto_26804 ?auto_26820 ) ( CLEAR ?auto_26804 ) ( not ( = ?auto_26801 ?auto_26804 ) ) ( not ( = ?auto_26801 ?auto_26820 ) ) ( not ( = ?auto_26804 ?auto_26820 ) ) ( not ( = ?auto_26810 ?auto_26837 ) ) ( IS-CRATE ?auto_26801 ) ( SURFACE-AT ?auto_26801 ?auto_26841 ) ( ON ?auto_26801 ?auto_26838 ) ( CLEAR ?auto_26801 ) ( not ( = ?auto_26802 ?auto_26801 ) ) ( not ( = ?auto_26802 ?auto_26838 ) ) ( not ( = ?auto_26801 ?auto_26838 ) ) ( IS-CRATE ?auto_26802 ) ( not ( = ?auto_26818 ?auto_26808 ) ) ( HOIST-AT ?auto_26832 ?auto_26818 ) ( AVAILABLE ?auto_26832 ) ( SURFACE-AT ?auto_26802 ?auto_26818 ) ( ON ?auto_26802 ?auto_26833 ) ( CLEAR ?auto_26802 ) ( not ( = ?auto_26803 ?auto_26802 ) ) ( not ( = ?auto_26803 ?auto_26833 ) ) ( not ( = ?auto_26802 ?auto_26833 ) ) ( not ( = ?auto_26810 ?auto_26832 ) ) ( IS-CRATE ?auto_26803 ) ( not ( = ?auto_26816 ?auto_26808 ) ) ( HOIST-AT ?auto_26835 ?auto_26816 ) ( AVAILABLE ?auto_26835 ) ( SURFACE-AT ?auto_26803 ?auto_26816 ) ( ON ?auto_26803 ?auto_26829 ) ( CLEAR ?auto_26803 ) ( not ( = ?auto_26800 ?auto_26803 ) ) ( not ( = ?auto_26800 ?auto_26829 ) ) ( not ( = ?auto_26803 ?auto_26829 ) ) ( not ( = ?auto_26810 ?auto_26835 ) ) ( IS-CRATE ?auto_26800 ) ( not ( = ?auto_26822 ?auto_26808 ) ) ( HOIST-AT ?auto_26823 ?auto_26822 ) ( AVAILABLE ?auto_26823 ) ( SURFACE-AT ?auto_26800 ?auto_26822 ) ( ON ?auto_26800 ?auto_26840 ) ( CLEAR ?auto_26800 ) ( not ( = ?auto_26799 ?auto_26800 ) ) ( not ( = ?auto_26799 ?auto_26840 ) ) ( not ( = ?auto_26800 ?auto_26840 ) ) ( not ( = ?auto_26810 ?auto_26823 ) ) ( IS-CRATE ?auto_26799 ) ( not ( = ?auto_26839 ?auto_26808 ) ) ( HOIST-AT ?auto_26825 ?auto_26839 ) ( AVAILABLE ?auto_26825 ) ( SURFACE-AT ?auto_26799 ?auto_26839 ) ( ON ?auto_26799 ?auto_26815 ) ( CLEAR ?auto_26799 ) ( not ( = ?auto_26798 ?auto_26799 ) ) ( not ( = ?auto_26798 ?auto_26815 ) ) ( not ( = ?auto_26799 ?auto_26815 ) ) ( not ( = ?auto_26810 ?auto_26825 ) ) ( IS-CRATE ?auto_26798 ) ( not ( = ?auto_26834 ?auto_26808 ) ) ( HOIST-AT ?auto_26817 ?auto_26834 ) ( SURFACE-AT ?auto_26798 ?auto_26834 ) ( ON ?auto_26798 ?auto_26826 ) ( CLEAR ?auto_26798 ) ( not ( = ?auto_26797 ?auto_26798 ) ) ( not ( = ?auto_26797 ?auto_26826 ) ) ( not ( = ?auto_26798 ?auto_26826 ) ) ( not ( = ?auto_26810 ?auto_26817 ) ) ( IS-CRATE ?auto_26797 ) ( AVAILABLE ?auto_26837 ) ( SURFACE-AT ?auto_26797 ?auto_26821 ) ( ON ?auto_26797 ?auto_26830 ) ( CLEAR ?auto_26797 ) ( not ( = ?auto_26796 ?auto_26797 ) ) ( not ( = ?auto_26796 ?auto_26830 ) ) ( not ( = ?auto_26797 ?auto_26830 ) ) ( IS-CRATE ?auto_26796 ) ( AVAILABLE ?auto_26817 ) ( SURFACE-AT ?auto_26796 ?auto_26834 ) ( ON ?auto_26796 ?auto_26828 ) ( CLEAR ?auto_26796 ) ( not ( = ?auto_26795 ?auto_26796 ) ) ( not ( = ?auto_26795 ?auto_26828 ) ) ( not ( = ?auto_26796 ?auto_26828 ) ) ( SURFACE-AT ?auto_26794 ?auto_26808 ) ( CLEAR ?auto_26794 ) ( IS-CRATE ?auto_26795 ) ( AVAILABLE ?auto_26810 ) ( AVAILABLE ?auto_26824 ) ( SURFACE-AT ?auto_26795 ?auto_26841 ) ( ON ?auto_26795 ?auto_26831 ) ( CLEAR ?auto_26795 ) ( TRUCK-AT ?auto_26809 ?auto_26808 ) ( not ( = ?auto_26794 ?auto_26795 ) ) ( not ( = ?auto_26794 ?auto_26831 ) ) ( not ( = ?auto_26795 ?auto_26831 ) ) ( not ( = ?auto_26794 ?auto_26796 ) ) ( not ( = ?auto_26794 ?auto_26828 ) ) ( not ( = ?auto_26796 ?auto_26831 ) ) ( not ( = ?auto_26834 ?auto_26841 ) ) ( not ( = ?auto_26817 ?auto_26824 ) ) ( not ( = ?auto_26828 ?auto_26831 ) ) ( not ( = ?auto_26794 ?auto_26797 ) ) ( not ( = ?auto_26794 ?auto_26830 ) ) ( not ( = ?auto_26795 ?auto_26797 ) ) ( not ( = ?auto_26795 ?auto_26830 ) ) ( not ( = ?auto_26797 ?auto_26828 ) ) ( not ( = ?auto_26797 ?auto_26831 ) ) ( not ( = ?auto_26821 ?auto_26834 ) ) ( not ( = ?auto_26821 ?auto_26841 ) ) ( not ( = ?auto_26837 ?auto_26817 ) ) ( not ( = ?auto_26837 ?auto_26824 ) ) ( not ( = ?auto_26830 ?auto_26828 ) ) ( not ( = ?auto_26830 ?auto_26831 ) ) ( not ( = ?auto_26794 ?auto_26798 ) ) ( not ( = ?auto_26794 ?auto_26826 ) ) ( not ( = ?auto_26795 ?auto_26798 ) ) ( not ( = ?auto_26795 ?auto_26826 ) ) ( not ( = ?auto_26796 ?auto_26798 ) ) ( not ( = ?auto_26796 ?auto_26826 ) ) ( not ( = ?auto_26798 ?auto_26830 ) ) ( not ( = ?auto_26798 ?auto_26828 ) ) ( not ( = ?auto_26798 ?auto_26831 ) ) ( not ( = ?auto_26826 ?auto_26830 ) ) ( not ( = ?auto_26826 ?auto_26828 ) ) ( not ( = ?auto_26826 ?auto_26831 ) ) ( not ( = ?auto_26794 ?auto_26799 ) ) ( not ( = ?auto_26794 ?auto_26815 ) ) ( not ( = ?auto_26795 ?auto_26799 ) ) ( not ( = ?auto_26795 ?auto_26815 ) ) ( not ( = ?auto_26796 ?auto_26799 ) ) ( not ( = ?auto_26796 ?auto_26815 ) ) ( not ( = ?auto_26797 ?auto_26799 ) ) ( not ( = ?auto_26797 ?auto_26815 ) ) ( not ( = ?auto_26799 ?auto_26826 ) ) ( not ( = ?auto_26799 ?auto_26830 ) ) ( not ( = ?auto_26799 ?auto_26828 ) ) ( not ( = ?auto_26799 ?auto_26831 ) ) ( not ( = ?auto_26839 ?auto_26834 ) ) ( not ( = ?auto_26839 ?auto_26821 ) ) ( not ( = ?auto_26839 ?auto_26841 ) ) ( not ( = ?auto_26825 ?auto_26817 ) ) ( not ( = ?auto_26825 ?auto_26837 ) ) ( not ( = ?auto_26825 ?auto_26824 ) ) ( not ( = ?auto_26815 ?auto_26826 ) ) ( not ( = ?auto_26815 ?auto_26830 ) ) ( not ( = ?auto_26815 ?auto_26828 ) ) ( not ( = ?auto_26815 ?auto_26831 ) ) ( not ( = ?auto_26794 ?auto_26800 ) ) ( not ( = ?auto_26794 ?auto_26840 ) ) ( not ( = ?auto_26795 ?auto_26800 ) ) ( not ( = ?auto_26795 ?auto_26840 ) ) ( not ( = ?auto_26796 ?auto_26800 ) ) ( not ( = ?auto_26796 ?auto_26840 ) ) ( not ( = ?auto_26797 ?auto_26800 ) ) ( not ( = ?auto_26797 ?auto_26840 ) ) ( not ( = ?auto_26798 ?auto_26800 ) ) ( not ( = ?auto_26798 ?auto_26840 ) ) ( not ( = ?auto_26800 ?auto_26815 ) ) ( not ( = ?auto_26800 ?auto_26826 ) ) ( not ( = ?auto_26800 ?auto_26830 ) ) ( not ( = ?auto_26800 ?auto_26828 ) ) ( not ( = ?auto_26800 ?auto_26831 ) ) ( not ( = ?auto_26822 ?auto_26839 ) ) ( not ( = ?auto_26822 ?auto_26834 ) ) ( not ( = ?auto_26822 ?auto_26821 ) ) ( not ( = ?auto_26822 ?auto_26841 ) ) ( not ( = ?auto_26823 ?auto_26825 ) ) ( not ( = ?auto_26823 ?auto_26817 ) ) ( not ( = ?auto_26823 ?auto_26837 ) ) ( not ( = ?auto_26823 ?auto_26824 ) ) ( not ( = ?auto_26840 ?auto_26815 ) ) ( not ( = ?auto_26840 ?auto_26826 ) ) ( not ( = ?auto_26840 ?auto_26830 ) ) ( not ( = ?auto_26840 ?auto_26828 ) ) ( not ( = ?auto_26840 ?auto_26831 ) ) ( not ( = ?auto_26794 ?auto_26803 ) ) ( not ( = ?auto_26794 ?auto_26829 ) ) ( not ( = ?auto_26795 ?auto_26803 ) ) ( not ( = ?auto_26795 ?auto_26829 ) ) ( not ( = ?auto_26796 ?auto_26803 ) ) ( not ( = ?auto_26796 ?auto_26829 ) ) ( not ( = ?auto_26797 ?auto_26803 ) ) ( not ( = ?auto_26797 ?auto_26829 ) ) ( not ( = ?auto_26798 ?auto_26803 ) ) ( not ( = ?auto_26798 ?auto_26829 ) ) ( not ( = ?auto_26799 ?auto_26803 ) ) ( not ( = ?auto_26799 ?auto_26829 ) ) ( not ( = ?auto_26803 ?auto_26840 ) ) ( not ( = ?auto_26803 ?auto_26815 ) ) ( not ( = ?auto_26803 ?auto_26826 ) ) ( not ( = ?auto_26803 ?auto_26830 ) ) ( not ( = ?auto_26803 ?auto_26828 ) ) ( not ( = ?auto_26803 ?auto_26831 ) ) ( not ( = ?auto_26816 ?auto_26822 ) ) ( not ( = ?auto_26816 ?auto_26839 ) ) ( not ( = ?auto_26816 ?auto_26834 ) ) ( not ( = ?auto_26816 ?auto_26821 ) ) ( not ( = ?auto_26816 ?auto_26841 ) ) ( not ( = ?auto_26835 ?auto_26823 ) ) ( not ( = ?auto_26835 ?auto_26825 ) ) ( not ( = ?auto_26835 ?auto_26817 ) ) ( not ( = ?auto_26835 ?auto_26837 ) ) ( not ( = ?auto_26835 ?auto_26824 ) ) ( not ( = ?auto_26829 ?auto_26840 ) ) ( not ( = ?auto_26829 ?auto_26815 ) ) ( not ( = ?auto_26829 ?auto_26826 ) ) ( not ( = ?auto_26829 ?auto_26830 ) ) ( not ( = ?auto_26829 ?auto_26828 ) ) ( not ( = ?auto_26829 ?auto_26831 ) ) ( not ( = ?auto_26794 ?auto_26802 ) ) ( not ( = ?auto_26794 ?auto_26833 ) ) ( not ( = ?auto_26795 ?auto_26802 ) ) ( not ( = ?auto_26795 ?auto_26833 ) ) ( not ( = ?auto_26796 ?auto_26802 ) ) ( not ( = ?auto_26796 ?auto_26833 ) ) ( not ( = ?auto_26797 ?auto_26802 ) ) ( not ( = ?auto_26797 ?auto_26833 ) ) ( not ( = ?auto_26798 ?auto_26802 ) ) ( not ( = ?auto_26798 ?auto_26833 ) ) ( not ( = ?auto_26799 ?auto_26802 ) ) ( not ( = ?auto_26799 ?auto_26833 ) ) ( not ( = ?auto_26800 ?auto_26802 ) ) ( not ( = ?auto_26800 ?auto_26833 ) ) ( not ( = ?auto_26802 ?auto_26829 ) ) ( not ( = ?auto_26802 ?auto_26840 ) ) ( not ( = ?auto_26802 ?auto_26815 ) ) ( not ( = ?auto_26802 ?auto_26826 ) ) ( not ( = ?auto_26802 ?auto_26830 ) ) ( not ( = ?auto_26802 ?auto_26828 ) ) ( not ( = ?auto_26802 ?auto_26831 ) ) ( not ( = ?auto_26818 ?auto_26816 ) ) ( not ( = ?auto_26818 ?auto_26822 ) ) ( not ( = ?auto_26818 ?auto_26839 ) ) ( not ( = ?auto_26818 ?auto_26834 ) ) ( not ( = ?auto_26818 ?auto_26821 ) ) ( not ( = ?auto_26818 ?auto_26841 ) ) ( not ( = ?auto_26832 ?auto_26835 ) ) ( not ( = ?auto_26832 ?auto_26823 ) ) ( not ( = ?auto_26832 ?auto_26825 ) ) ( not ( = ?auto_26832 ?auto_26817 ) ) ( not ( = ?auto_26832 ?auto_26837 ) ) ( not ( = ?auto_26832 ?auto_26824 ) ) ( not ( = ?auto_26833 ?auto_26829 ) ) ( not ( = ?auto_26833 ?auto_26840 ) ) ( not ( = ?auto_26833 ?auto_26815 ) ) ( not ( = ?auto_26833 ?auto_26826 ) ) ( not ( = ?auto_26833 ?auto_26830 ) ) ( not ( = ?auto_26833 ?auto_26828 ) ) ( not ( = ?auto_26833 ?auto_26831 ) ) ( not ( = ?auto_26794 ?auto_26801 ) ) ( not ( = ?auto_26794 ?auto_26838 ) ) ( not ( = ?auto_26795 ?auto_26801 ) ) ( not ( = ?auto_26795 ?auto_26838 ) ) ( not ( = ?auto_26796 ?auto_26801 ) ) ( not ( = ?auto_26796 ?auto_26838 ) ) ( not ( = ?auto_26797 ?auto_26801 ) ) ( not ( = ?auto_26797 ?auto_26838 ) ) ( not ( = ?auto_26798 ?auto_26801 ) ) ( not ( = ?auto_26798 ?auto_26838 ) ) ( not ( = ?auto_26799 ?auto_26801 ) ) ( not ( = ?auto_26799 ?auto_26838 ) ) ( not ( = ?auto_26800 ?auto_26801 ) ) ( not ( = ?auto_26800 ?auto_26838 ) ) ( not ( = ?auto_26803 ?auto_26801 ) ) ( not ( = ?auto_26803 ?auto_26838 ) ) ( not ( = ?auto_26801 ?auto_26833 ) ) ( not ( = ?auto_26801 ?auto_26829 ) ) ( not ( = ?auto_26801 ?auto_26840 ) ) ( not ( = ?auto_26801 ?auto_26815 ) ) ( not ( = ?auto_26801 ?auto_26826 ) ) ( not ( = ?auto_26801 ?auto_26830 ) ) ( not ( = ?auto_26801 ?auto_26828 ) ) ( not ( = ?auto_26801 ?auto_26831 ) ) ( not ( = ?auto_26838 ?auto_26833 ) ) ( not ( = ?auto_26838 ?auto_26829 ) ) ( not ( = ?auto_26838 ?auto_26840 ) ) ( not ( = ?auto_26838 ?auto_26815 ) ) ( not ( = ?auto_26838 ?auto_26826 ) ) ( not ( = ?auto_26838 ?auto_26830 ) ) ( not ( = ?auto_26838 ?auto_26828 ) ) ( not ( = ?auto_26838 ?auto_26831 ) ) ( not ( = ?auto_26794 ?auto_26804 ) ) ( not ( = ?auto_26794 ?auto_26820 ) ) ( not ( = ?auto_26795 ?auto_26804 ) ) ( not ( = ?auto_26795 ?auto_26820 ) ) ( not ( = ?auto_26796 ?auto_26804 ) ) ( not ( = ?auto_26796 ?auto_26820 ) ) ( not ( = ?auto_26797 ?auto_26804 ) ) ( not ( = ?auto_26797 ?auto_26820 ) ) ( not ( = ?auto_26798 ?auto_26804 ) ) ( not ( = ?auto_26798 ?auto_26820 ) ) ( not ( = ?auto_26799 ?auto_26804 ) ) ( not ( = ?auto_26799 ?auto_26820 ) ) ( not ( = ?auto_26800 ?auto_26804 ) ) ( not ( = ?auto_26800 ?auto_26820 ) ) ( not ( = ?auto_26803 ?auto_26804 ) ) ( not ( = ?auto_26803 ?auto_26820 ) ) ( not ( = ?auto_26802 ?auto_26804 ) ) ( not ( = ?auto_26802 ?auto_26820 ) ) ( not ( = ?auto_26804 ?auto_26838 ) ) ( not ( = ?auto_26804 ?auto_26833 ) ) ( not ( = ?auto_26804 ?auto_26829 ) ) ( not ( = ?auto_26804 ?auto_26840 ) ) ( not ( = ?auto_26804 ?auto_26815 ) ) ( not ( = ?auto_26804 ?auto_26826 ) ) ( not ( = ?auto_26804 ?auto_26830 ) ) ( not ( = ?auto_26804 ?auto_26828 ) ) ( not ( = ?auto_26804 ?auto_26831 ) ) ( not ( = ?auto_26820 ?auto_26838 ) ) ( not ( = ?auto_26820 ?auto_26833 ) ) ( not ( = ?auto_26820 ?auto_26829 ) ) ( not ( = ?auto_26820 ?auto_26840 ) ) ( not ( = ?auto_26820 ?auto_26815 ) ) ( not ( = ?auto_26820 ?auto_26826 ) ) ( not ( = ?auto_26820 ?auto_26830 ) ) ( not ( = ?auto_26820 ?auto_26828 ) ) ( not ( = ?auto_26820 ?auto_26831 ) ) ( not ( = ?auto_26794 ?auto_26805 ) ) ( not ( = ?auto_26794 ?auto_26836 ) ) ( not ( = ?auto_26795 ?auto_26805 ) ) ( not ( = ?auto_26795 ?auto_26836 ) ) ( not ( = ?auto_26796 ?auto_26805 ) ) ( not ( = ?auto_26796 ?auto_26836 ) ) ( not ( = ?auto_26797 ?auto_26805 ) ) ( not ( = ?auto_26797 ?auto_26836 ) ) ( not ( = ?auto_26798 ?auto_26805 ) ) ( not ( = ?auto_26798 ?auto_26836 ) ) ( not ( = ?auto_26799 ?auto_26805 ) ) ( not ( = ?auto_26799 ?auto_26836 ) ) ( not ( = ?auto_26800 ?auto_26805 ) ) ( not ( = ?auto_26800 ?auto_26836 ) ) ( not ( = ?auto_26803 ?auto_26805 ) ) ( not ( = ?auto_26803 ?auto_26836 ) ) ( not ( = ?auto_26802 ?auto_26805 ) ) ( not ( = ?auto_26802 ?auto_26836 ) ) ( not ( = ?auto_26801 ?auto_26805 ) ) ( not ( = ?auto_26801 ?auto_26836 ) ) ( not ( = ?auto_26805 ?auto_26820 ) ) ( not ( = ?auto_26805 ?auto_26838 ) ) ( not ( = ?auto_26805 ?auto_26833 ) ) ( not ( = ?auto_26805 ?auto_26829 ) ) ( not ( = ?auto_26805 ?auto_26840 ) ) ( not ( = ?auto_26805 ?auto_26815 ) ) ( not ( = ?auto_26805 ?auto_26826 ) ) ( not ( = ?auto_26805 ?auto_26830 ) ) ( not ( = ?auto_26805 ?auto_26828 ) ) ( not ( = ?auto_26805 ?auto_26831 ) ) ( not ( = ?auto_26819 ?auto_26821 ) ) ( not ( = ?auto_26819 ?auto_26841 ) ) ( not ( = ?auto_26819 ?auto_26818 ) ) ( not ( = ?auto_26819 ?auto_26816 ) ) ( not ( = ?auto_26819 ?auto_26822 ) ) ( not ( = ?auto_26819 ?auto_26839 ) ) ( not ( = ?auto_26819 ?auto_26834 ) ) ( not ( = ?auto_26814 ?auto_26837 ) ) ( not ( = ?auto_26814 ?auto_26824 ) ) ( not ( = ?auto_26814 ?auto_26832 ) ) ( not ( = ?auto_26814 ?auto_26835 ) ) ( not ( = ?auto_26814 ?auto_26823 ) ) ( not ( = ?auto_26814 ?auto_26825 ) ) ( not ( = ?auto_26814 ?auto_26817 ) ) ( not ( = ?auto_26836 ?auto_26820 ) ) ( not ( = ?auto_26836 ?auto_26838 ) ) ( not ( = ?auto_26836 ?auto_26833 ) ) ( not ( = ?auto_26836 ?auto_26829 ) ) ( not ( = ?auto_26836 ?auto_26840 ) ) ( not ( = ?auto_26836 ?auto_26815 ) ) ( not ( = ?auto_26836 ?auto_26826 ) ) ( not ( = ?auto_26836 ?auto_26830 ) ) ( not ( = ?auto_26836 ?auto_26828 ) ) ( not ( = ?auto_26836 ?auto_26831 ) ) ( not ( = ?auto_26794 ?auto_26806 ) ) ( not ( = ?auto_26794 ?auto_26827 ) ) ( not ( = ?auto_26795 ?auto_26806 ) ) ( not ( = ?auto_26795 ?auto_26827 ) ) ( not ( = ?auto_26796 ?auto_26806 ) ) ( not ( = ?auto_26796 ?auto_26827 ) ) ( not ( = ?auto_26797 ?auto_26806 ) ) ( not ( = ?auto_26797 ?auto_26827 ) ) ( not ( = ?auto_26798 ?auto_26806 ) ) ( not ( = ?auto_26798 ?auto_26827 ) ) ( not ( = ?auto_26799 ?auto_26806 ) ) ( not ( = ?auto_26799 ?auto_26827 ) ) ( not ( = ?auto_26800 ?auto_26806 ) ) ( not ( = ?auto_26800 ?auto_26827 ) ) ( not ( = ?auto_26803 ?auto_26806 ) ) ( not ( = ?auto_26803 ?auto_26827 ) ) ( not ( = ?auto_26802 ?auto_26806 ) ) ( not ( = ?auto_26802 ?auto_26827 ) ) ( not ( = ?auto_26801 ?auto_26806 ) ) ( not ( = ?auto_26801 ?auto_26827 ) ) ( not ( = ?auto_26804 ?auto_26806 ) ) ( not ( = ?auto_26804 ?auto_26827 ) ) ( not ( = ?auto_26806 ?auto_26836 ) ) ( not ( = ?auto_26806 ?auto_26820 ) ) ( not ( = ?auto_26806 ?auto_26838 ) ) ( not ( = ?auto_26806 ?auto_26833 ) ) ( not ( = ?auto_26806 ?auto_26829 ) ) ( not ( = ?auto_26806 ?auto_26840 ) ) ( not ( = ?auto_26806 ?auto_26815 ) ) ( not ( = ?auto_26806 ?auto_26826 ) ) ( not ( = ?auto_26806 ?auto_26830 ) ) ( not ( = ?auto_26806 ?auto_26828 ) ) ( not ( = ?auto_26806 ?auto_26831 ) ) ( not ( = ?auto_26827 ?auto_26836 ) ) ( not ( = ?auto_26827 ?auto_26820 ) ) ( not ( = ?auto_26827 ?auto_26838 ) ) ( not ( = ?auto_26827 ?auto_26833 ) ) ( not ( = ?auto_26827 ?auto_26829 ) ) ( not ( = ?auto_26827 ?auto_26840 ) ) ( not ( = ?auto_26827 ?auto_26815 ) ) ( not ( = ?auto_26827 ?auto_26826 ) ) ( not ( = ?auto_26827 ?auto_26830 ) ) ( not ( = ?auto_26827 ?auto_26828 ) ) ( not ( = ?auto_26827 ?auto_26831 ) ) ( not ( = ?auto_26794 ?auto_26807 ) ) ( not ( = ?auto_26794 ?auto_26813 ) ) ( not ( = ?auto_26795 ?auto_26807 ) ) ( not ( = ?auto_26795 ?auto_26813 ) ) ( not ( = ?auto_26796 ?auto_26807 ) ) ( not ( = ?auto_26796 ?auto_26813 ) ) ( not ( = ?auto_26797 ?auto_26807 ) ) ( not ( = ?auto_26797 ?auto_26813 ) ) ( not ( = ?auto_26798 ?auto_26807 ) ) ( not ( = ?auto_26798 ?auto_26813 ) ) ( not ( = ?auto_26799 ?auto_26807 ) ) ( not ( = ?auto_26799 ?auto_26813 ) ) ( not ( = ?auto_26800 ?auto_26807 ) ) ( not ( = ?auto_26800 ?auto_26813 ) ) ( not ( = ?auto_26803 ?auto_26807 ) ) ( not ( = ?auto_26803 ?auto_26813 ) ) ( not ( = ?auto_26802 ?auto_26807 ) ) ( not ( = ?auto_26802 ?auto_26813 ) ) ( not ( = ?auto_26801 ?auto_26807 ) ) ( not ( = ?auto_26801 ?auto_26813 ) ) ( not ( = ?auto_26804 ?auto_26807 ) ) ( not ( = ?auto_26804 ?auto_26813 ) ) ( not ( = ?auto_26805 ?auto_26807 ) ) ( not ( = ?auto_26805 ?auto_26813 ) ) ( not ( = ?auto_26807 ?auto_26827 ) ) ( not ( = ?auto_26807 ?auto_26836 ) ) ( not ( = ?auto_26807 ?auto_26820 ) ) ( not ( = ?auto_26807 ?auto_26838 ) ) ( not ( = ?auto_26807 ?auto_26833 ) ) ( not ( = ?auto_26807 ?auto_26829 ) ) ( not ( = ?auto_26807 ?auto_26840 ) ) ( not ( = ?auto_26807 ?auto_26815 ) ) ( not ( = ?auto_26807 ?auto_26826 ) ) ( not ( = ?auto_26807 ?auto_26830 ) ) ( not ( = ?auto_26807 ?auto_26828 ) ) ( not ( = ?auto_26807 ?auto_26831 ) ) ( not ( = ?auto_26811 ?auto_26841 ) ) ( not ( = ?auto_26811 ?auto_26819 ) ) ( not ( = ?auto_26811 ?auto_26821 ) ) ( not ( = ?auto_26811 ?auto_26818 ) ) ( not ( = ?auto_26811 ?auto_26816 ) ) ( not ( = ?auto_26811 ?auto_26822 ) ) ( not ( = ?auto_26811 ?auto_26839 ) ) ( not ( = ?auto_26811 ?auto_26834 ) ) ( not ( = ?auto_26812 ?auto_26824 ) ) ( not ( = ?auto_26812 ?auto_26814 ) ) ( not ( = ?auto_26812 ?auto_26837 ) ) ( not ( = ?auto_26812 ?auto_26832 ) ) ( not ( = ?auto_26812 ?auto_26835 ) ) ( not ( = ?auto_26812 ?auto_26823 ) ) ( not ( = ?auto_26812 ?auto_26825 ) ) ( not ( = ?auto_26812 ?auto_26817 ) ) ( not ( = ?auto_26813 ?auto_26827 ) ) ( not ( = ?auto_26813 ?auto_26836 ) ) ( not ( = ?auto_26813 ?auto_26820 ) ) ( not ( = ?auto_26813 ?auto_26838 ) ) ( not ( = ?auto_26813 ?auto_26833 ) ) ( not ( = ?auto_26813 ?auto_26829 ) ) ( not ( = ?auto_26813 ?auto_26840 ) ) ( not ( = ?auto_26813 ?auto_26815 ) ) ( not ( = ?auto_26813 ?auto_26826 ) ) ( not ( = ?auto_26813 ?auto_26830 ) ) ( not ( = ?auto_26813 ?auto_26828 ) ) ( not ( = ?auto_26813 ?auto_26831 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_26794 ?auto_26795 ?auto_26796 ?auto_26797 ?auto_26798 ?auto_26799 ?auto_26800 ?auto_26803 ?auto_26802 ?auto_26801 ?auto_26804 ?auto_26805 ?auto_26806 )
      ( MAKE-1CRATE ?auto_26806 ?auto_26807 )
      ( MAKE-13CRATE-VERIFY ?auto_26794 ?auto_26795 ?auto_26796 ?auto_26797 ?auto_26798 ?auto_26799 ?auto_26800 ?auto_26803 ?auto_26802 ?auto_26801 ?auto_26804 ?auto_26805 ?auto_26806 ?auto_26807 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26844 - SURFACE
      ?auto_26845 - SURFACE
    )
    :vars
    (
      ?auto_26846 - HOIST
      ?auto_26847 - PLACE
      ?auto_26849 - PLACE
      ?auto_26850 - HOIST
      ?auto_26851 - SURFACE
      ?auto_26848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26846 ?auto_26847 ) ( SURFACE-AT ?auto_26844 ?auto_26847 ) ( CLEAR ?auto_26844 ) ( IS-CRATE ?auto_26845 ) ( AVAILABLE ?auto_26846 ) ( not ( = ?auto_26849 ?auto_26847 ) ) ( HOIST-AT ?auto_26850 ?auto_26849 ) ( AVAILABLE ?auto_26850 ) ( SURFACE-AT ?auto_26845 ?auto_26849 ) ( ON ?auto_26845 ?auto_26851 ) ( CLEAR ?auto_26845 ) ( TRUCK-AT ?auto_26848 ?auto_26847 ) ( not ( = ?auto_26844 ?auto_26845 ) ) ( not ( = ?auto_26844 ?auto_26851 ) ) ( not ( = ?auto_26845 ?auto_26851 ) ) ( not ( = ?auto_26846 ?auto_26850 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26848 ?auto_26847 ?auto_26849 )
      ( !LIFT ?auto_26850 ?auto_26845 ?auto_26851 ?auto_26849 )
      ( !LOAD ?auto_26850 ?auto_26845 ?auto_26848 ?auto_26849 )
      ( !DRIVE ?auto_26848 ?auto_26849 ?auto_26847 )
      ( !UNLOAD ?auto_26846 ?auto_26845 ?auto_26848 ?auto_26847 )
      ( !DROP ?auto_26846 ?auto_26845 ?auto_26844 ?auto_26847 )
      ( MAKE-1CRATE-VERIFY ?auto_26844 ?auto_26845 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_26867 - SURFACE
      ?auto_26868 - SURFACE
      ?auto_26869 - SURFACE
      ?auto_26870 - SURFACE
      ?auto_26871 - SURFACE
      ?auto_26872 - SURFACE
      ?auto_26873 - SURFACE
      ?auto_26876 - SURFACE
      ?auto_26875 - SURFACE
      ?auto_26874 - SURFACE
      ?auto_26877 - SURFACE
      ?auto_26878 - SURFACE
      ?auto_26879 - SURFACE
      ?auto_26880 - SURFACE
      ?auto_26881 - SURFACE
    )
    :vars
    (
      ?auto_26885 - HOIST
      ?auto_26882 - PLACE
      ?auto_26886 - PLACE
      ?auto_26883 - HOIST
      ?auto_26887 - SURFACE
      ?auto_26910 - PLACE
      ?auto_26916 - HOIST
      ?auto_26894 - SURFACE
      ?auto_26896 - PLACE
      ?auto_26900 - HOIST
      ?auto_26895 - SURFACE
      ?auto_26917 - PLACE
      ?auto_26893 - HOIST
      ?auto_26913 - SURFACE
      ?auto_26892 - PLACE
      ?auto_26903 - HOIST
      ?auto_26889 - SURFACE
      ?auto_26902 - SURFACE
      ?auto_26912 - PLACE
      ?auto_26888 - HOIST
      ?auto_26905 - SURFACE
      ?auto_26897 - PLACE
      ?auto_26906 - HOIST
      ?auto_26899 - SURFACE
      ?auto_26890 - PLACE
      ?auto_26914 - HOIST
      ?auto_26908 - SURFACE
      ?auto_26918 - PLACE
      ?auto_26909 - HOIST
      ?auto_26911 - SURFACE
      ?auto_26891 - PLACE
      ?auto_26907 - HOIST
      ?auto_26901 - SURFACE
      ?auto_26898 - SURFACE
      ?auto_26915 - SURFACE
      ?auto_26904 - SURFACE
      ?auto_26884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26885 ?auto_26882 ) ( IS-CRATE ?auto_26881 ) ( not ( = ?auto_26886 ?auto_26882 ) ) ( HOIST-AT ?auto_26883 ?auto_26886 ) ( AVAILABLE ?auto_26883 ) ( SURFACE-AT ?auto_26881 ?auto_26886 ) ( ON ?auto_26881 ?auto_26887 ) ( CLEAR ?auto_26881 ) ( not ( = ?auto_26880 ?auto_26881 ) ) ( not ( = ?auto_26880 ?auto_26887 ) ) ( not ( = ?auto_26881 ?auto_26887 ) ) ( not ( = ?auto_26885 ?auto_26883 ) ) ( IS-CRATE ?auto_26880 ) ( not ( = ?auto_26910 ?auto_26882 ) ) ( HOIST-AT ?auto_26916 ?auto_26910 ) ( AVAILABLE ?auto_26916 ) ( SURFACE-AT ?auto_26880 ?auto_26910 ) ( ON ?auto_26880 ?auto_26894 ) ( CLEAR ?auto_26880 ) ( not ( = ?auto_26879 ?auto_26880 ) ) ( not ( = ?auto_26879 ?auto_26894 ) ) ( not ( = ?auto_26880 ?auto_26894 ) ) ( not ( = ?auto_26885 ?auto_26916 ) ) ( IS-CRATE ?auto_26879 ) ( not ( = ?auto_26896 ?auto_26882 ) ) ( HOIST-AT ?auto_26900 ?auto_26896 ) ( SURFACE-AT ?auto_26879 ?auto_26896 ) ( ON ?auto_26879 ?auto_26895 ) ( CLEAR ?auto_26879 ) ( not ( = ?auto_26878 ?auto_26879 ) ) ( not ( = ?auto_26878 ?auto_26895 ) ) ( not ( = ?auto_26879 ?auto_26895 ) ) ( not ( = ?auto_26885 ?auto_26900 ) ) ( IS-CRATE ?auto_26878 ) ( not ( = ?auto_26917 ?auto_26882 ) ) ( HOIST-AT ?auto_26893 ?auto_26917 ) ( AVAILABLE ?auto_26893 ) ( SURFACE-AT ?auto_26878 ?auto_26917 ) ( ON ?auto_26878 ?auto_26913 ) ( CLEAR ?auto_26878 ) ( not ( = ?auto_26877 ?auto_26878 ) ) ( not ( = ?auto_26877 ?auto_26913 ) ) ( not ( = ?auto_26878 ?auto_26913 ) ) ( not ( = ?auto_26885 ?auto_26893 ) ) ( IS-CRATE ?auto_26877 ) ( not ( = ?auto_26892 ?auto_26882 ) ) ( HOIST-AT ?auto_26903 ?auto_26892 ) ( SURFACE-AT ?auto_26877 ?auto_26892 ) ( ON ?auto_26877 ?auto_26889 ) ( CLEAR ?auto_26877 ) ( not ( = ?auto_26874 ?auto_26877 ) ) ( not ( = ?auto_26874 ?auto_26889 ) ) ( not ( = ?auto_26877 ?auto_26889 ) ) ( not ( = ?auto_26885 ?auto_26903 ) ) ( IS-CRATE ?auto_26874 ) ( SURFACE-AT ?auto_26874 ?auto_26896 ) ( ON ?auto_26874 ?auto_26902 ) ( CLEAR ?auto_26874 ) ( not ( = ?auto_26875 ?auto_26874 ) ) ( not ( = ?auto_26875 ?auto_26902 ) ) ( not ( = ?auto_26874 ?auto_26902 ) ) ( IS-CRATE ?auto_26875 ) ( not ( = ?auto_26912 ?auto_26882 ) ) ( HOIST-AT ?auto_26888 ?auto_26912 ) ( AVAILABLE ?auto_26888 ) ( SURFACE-AT ?auto_26875 ?auto_26912 ) ( ON ?auto_26875 ?auto_26905 ) ( CLEAR ?auto_26875 ) ( not ( = ?auto_26876 ?auto_26875 ) ) ( not ( = ?auto_26876 ?auto_26905 ) ) ( not ( = ?auto_26875 ?auto_26905 ) ) ( not ( = ?auto_26885 ?auto_26888 ) ) ( IS-CRATE ?auto_26876 ) ( not ( = ?auto_26897 ?auto_26882 ) ) ( HOIST-AT ?auto_26906 ?auto_26897 ) ( AVAILABLE ?auto_26906 ) ( SURFACE-AT ?auto_26876 ?auto_26897 ) ( ON ?auto_26876 ?auto_26899 ) ( CLEAR ?auto_26876 ) ( not ( = ?auto_26873 ?auto_26876 ) ) ( not ( = ?auto_26873 ?auto_26899 ) ) ( not ( = ?auto_26876 ?auto_26899 ) ) ( not ( = ?auto_26885 ?auto_26906 ) ) ( IS-CRATE ?auto_26873 ) ( not ( = ?auto_26890 ?auto_26882 ) ) ( HOIST-AT ?auto_26914 ?auto_26890 ) ( AVAILABLE ?auto_26914 ) ( SURFACE-AT ?auto_26873 ?auto_26890 ) ( ON ?auto_26873 ?auto_26908 ) ( CLEAR ?auto_26873 ) ( not ( = ?auto_26872 ?auto_26873 ) ) ( not ( = ?auto_26872 ?auto_26908 ) ) ( not ( = ?auto_26873 ?auto_26908 ) ) ( not ( = ?auto_26885 ?auto_26914 ) ) ( IS-CRATE ?auto_26872 ) ( not ( = ?auto_26918 ?auto_26882 ) ) ( HOIST-AT ?auto_26909 ?auto_26918 ) ( AVAILABLE ?auto_26909 ) ( SURFACE-AT ?auto_26872 ?auto_26918 ) ( ON ?auto_26872 ?auto_26911 ) ( CLEAR ?auto_26872 ) ( not ( = ?auto_26871 ?auto_26872 ) ) ( not ( = ?auto_26871 ?auto_26911 ) ) ( not ( = ?auto_26872 ?auto_26911 ) ) ( not ( = ?auto_26885 ?auto_26909 ) ) ( IS-CRATE ?auto_26871 ) ( not ( = ?auto_26891 ?auto_26882 ) ) ( HOIST-AT ?auto_26907 ?auto_26891 ) ( SURFACE-AT ?auto_26871 ?auto_26891 ) ( ON ?auto_26871 ?auto_26901 ) ( CLEAR ?auto_26871 ) ( not ( = ?auto_26870 ?auto_26871 ) ) ( not ( = ?auto_26870 ?auto_26901 ) ) ( not ( = ?auto_26871 ?auto_26901 ) ) ( not ( = ?auto_26885 ?auto_26907 ) ) ( IS-CRATE ?auto_26870 ) ( AVAILABLE ?auto_26903 ) ( SURFACE-AT ?auto_26870 ?auto_26892 ) ( ON ?auto_26870 ?auto_26898 ) ( CLEAR ?auto_26870 ) ( not ( = ?auto_26869 ?auto_26870 ) ) ( not ( = ?auto_26869 ?auto_26898 ) ) ( not ( = ?auto_26870 ?auto_26898 ) ) ( IS-CRATE ?auto_26869 ) ( AVAILABLE ?auto_26907 ) ( SURFACE-AT ?auto_26869 ?auto_26891 ) ( ON ?auto_26869 ?auto_26915 ) ( CLEAR ?auto_26869 ) ( not ( = ?auto_26868 ?auto_26869 ) ) ( not ( = ?auto_26868 ?auto_26915 ) ) ( not ( = ?auto_26869 ?auto_26915 ) ) ( SURFACE-AT ?auto_26867 ?auto_26882 ) ( CLEAR ?auto_26867 ) ( IS-CRATE ?auto_26868 ) ( AVAILABLE ?auto_26885 ) ( AVAILABLE ?auto_26900 ) ( SURFACE-AT ?auto_26868 ?auto_26896 ) ( ON ?auto_26868 ?auto_26904 ) ( CLEAR ?auto_26868 ) ( TRUCK-AT ?auto_26884 ?auto_26882 ) ( not ( = ?auto_26867 ?auto_26868 ) ) ( not ( = ?auto_26867 ?auto_26904 ) ) ( not ( = ?auto_26868 ?auto_26904 ) ) ( not ( = ?auto_26867 ?auto_26869 ) ) ( not ( = ?auto_26867 ?auto_26915 ) ) ( not ( = ?auto_26869 ?auto_26904 ) ) ( not ( = ?auto_26891 ?auto_26896 ) ) ( not ( = ?auto_26907 ?auto_26900 ) ) ( not ( = ?auto_26915 ?auto_26904 ) ) ( not ( = ?auto_26867 ?auto_26870 ) ) ( not ( = ?auto_26867 ?auto_26898 ) ) ( not ( = ?auto_26868 ?auto_26870 ) ) ( not ( = ?auto_26868 ?auto_26898 ) ) ( not ( = ?auto_26870 ?auto_26915 ) ) ( not ( = ?auto_26870 ?auto_26904 ) ) ( not ( = ?auto_26892 ?auto_26891 ) ) ( not ( = ?auto_26892 ?auto_26896 ) ) ( not ( = ?auto_26903 ?auto_26907 ) ) ( not ( = ?auto_26903 ?auto_26900 ) ) ( not ( = ?auto_26898 ?auto_26915 ) ) ( not ( = ?auto_26898 ?auto_26904 ) ) ( not ( = ?auto_26867 ?auto_26871 ) ) ( not ( = ?auto_26867 ?auto_26901 ) ) ( not ( = ?auto_26868 ?auto_26871 ) ) ( not ( = ?auto_26868 ?auto_26901 ) ) ( not ( = ?auto_26869 ?auto_26871 ) ) ( not ( = ?auto_26869 ?auto_26901 ) ) ( not ( = ?auto_26871 ?auto_26898 ) ) ( not ( = ?auto_26871 ?auto_26915 ) ) ( not ( = ?auto_26871 ?auto_26904 ) ) ( not ( = ?auto_26901 ?auto_26898 ) ) ( not ( = ?auto_26901 ?auto_26915 ) ) ( not ( = ?auto_26901 ?auto_26904 ) ) ( not ( = ?auto_26867 ?auto_26872 ) ) ( not ( = ?auto_26867 ?auto_26911 ) ) ( not ( = ?auto_26868 ?auto_26872 ) ) ( not ( = ?auto_26868 ?auto_26911 ) ) ( not ( = ?auto_26869 ?auto_26872 ) ) ( not ( = ?auto_26869 ?auto_26911 ) ) ( not ( = ?auto_26870 ?auto_26872 ) ) ( not ( = ?auto_26870 ?auto_26911 ) ) ( not ( = ?auto_26872 ?auto_26901 ) ) ( not ( = ?auto_26872 ?auto_26898 ) ) ( not ( = ?auto_26872 ?auto_26915 ) ) ( not ( = ?auto_26872 ?auto_26904 ) ) ( not ( = ?auto_26918 ?auto_26891 ) ) ( not ( = ?auto_26918 ?auto_26892 ) ) ( not ( = ?auto_26918 ?auto_26896 ) ) ( not ( = ?auto_26909 ?auto_26907 ) ) ( not ( = ?auto_26909 ?auto_26903 ) ) ( not ( = ?auto_26909 ?auto_26900 ) ) ( not ( = ?auto_26911 ?auto_26901 ) ) ( not ( = ?auto_26911 ?auto_26898 ) ) ( not ( = ?auto_26911 ?auto_26915 ) ) ( not ( = ?auto_26911 ?auto_26904 ) ) ( not ( = ?auto_26867 ?auto_26873 ) ) ( not ( = ?auto_26867 ?auto_26908 ) ) ( not ( = ?auto_26868 ?auto_26873 ) ) ( not ( = ?auto_26868 ?auto_26908 ) ) ( not ( = ?auto_26869 ?auto_26873 ) ) ( not ( = ?auto_26869 ?auto_26908 ) ) ( not ( = ?auto_26870 ?auto_26873 ) ) ( not ( = ?auto_26870 ?auto_26908 ) ) ( not ( = ?auto_26871 ?auto_26873 ) ) ( not ( = ?auto_26871 ?auto_26908 ) ) ( not ( = ?auto_26873 ?auto_26911 ) ) ( not ( = ?auto_26873 ?auto_26901 ) ) ( not ( = ?auto_26873 ?auto_26898 ) ) ( not ( = ?auto_26873 ?auto_26915 ) ) ( not ( = ?auto_26873 ?auto_26904 ) ) ( not ( = ?auto_26890 ?auto_26918 ) ) ( not ( = ?auto_26890 ?auto_26891 ) ) ( not ( = ?auto_26890 ?auto_26892 ) ) ( not ( = ?auto_26890 ?auto_26896 ) ) ( not ( = ?auto_26914 ?auto_26909 ) ) ( not ( = ?auto_26914 ?auto_26907 ) ) ( not ( = ?auto_26914 ?auto_26903 ) ) ( not ( = ?auto_26914 ?auto_26900 ) ) ( not ( = ?auto_26908 ?auto_26911 ) ) ( not ( = ?auto_26908 ?auto_26901 ) ) ( not ( = ?auto_26908 ?auto_26898 ) ) ( not ( = ?auto_26908 ?auto_26915 ) ) ( not ( = ?auto_26908 ?auto_26904 ) ) ( not ( = ?auto_26867 ?auto_26876 ) ) ( not ( = ?auto_26867 ?auto_26899 ) ) ( not ( = ?auto_26868 ?auto_26876 ) ) ( not ( = ?auto_26868 ?auto_26899 ) ) ( not ( = ?auto_26869 ?auto_26876 ) ) ( not ( = ?auto_26869 ?auto_26899 ) ) ( not ( = ?auto_26870 ?auto_26876 ) ) ( not ( = ?auto_26870 ?auto_26899 ) ) ( not ( = ?auto_26871 ?auto_26876 ) ) ( not ( = ?auto_26871 ?auto_26899 ) ) ( not ( = ?auto_26872 ?auto_26876 ) ) ( not ( = ?auto_26872 ?auto_26899 ) ) ( not ( = ?auto_26876 ?auto_26908 ) ) ( not ( = ?auto_26876 ?auto_26911 ) ) ( not ( = ?auto_26876 ?auto_26901 ) ) ( not ( = ?auto_26876 ?auto_26898 ) ) ( not ( = ?auto_26876 ?auto_26915 ) ) ( not ( = ?auto_26876 ?auto_26904 ) ) ( not ( = ?auto_26897 ?auto_26890 ) ) ( not ( = ?auto_26897 ?auto_26918 ) ) ( not ( = ?auto_26897 ?auto_26891 ) ) ( not ( = ?auto_26897 ?auto_26892 ) ) ( not ( = ?auto_26897 ?auto_26896 ) ) ( not ( = ?auto_26906 ?auto_26914 ) ) ( not ( = ?auto_26906 ?auto_26909 ) ) ( not ( = ?auto_26906 ?auto_26907 ) ) ( not ( = ?auto_26906 ?auto_26903 ) ) ( not ( = ?auto_26906 ?auto_26900 ) ) ( not ( = ?auto_26899 ?auto_26908 ) ) ( not ( = ?auto_26899 ?auto_26911 ) ) ( not ( = ?auto_26899 ?auto_26901 ) ) ( not ( = ?auto_26899 ?auto_26898 ) ) ( not ( = ?auto_26899 ?auto_26915 ) ) ( not ( = ?auto_26899 ?auto_26904 ) ) ( not ( = ?auto_26867 ?auto_26875 ) ) ( not ( = ?auto_26867 ?auto_26905 ) ) ( not ( = ?auto_26868 ?auto_26875 ) ) ( not ( = ?auto_26868 ?auto_26905 ) ) ( not ( = ?auto_26869 ?auto_26875 ) ) ( not ( = ?auto_26869 ?auto_26905 ) ) ( not ( = ?auto_26870 ?auto_26875 ) ) ( not ( = ?auto_26870 ?auto_26905 ) ) ( not ( = ?auto_26871 ?auto_26875 ) ) ( not ( = ?auto_26871 ?auto_26905 ) ) ( not ( = ?auto_26872 ?auto_26875 ) ) ( not ( = ?auto_26872 ?auto_26905 ) ) ( not ( = ?auto_26873 ?auto_26875 ) ) ( not ( = ?auto_26873 ?auto_26905 ) ) ( not ( = ?auto_26875 ?auto_26899 ) ) ( not ( = ?auto_26875 ?auto_26908 ) ) ( not ( = ?auto_26875 ?auto_26911 ) ) ( not ( = ?auto_26875 ?auto_26901 ) ) ( not ( = ?auto_26875 ?auto_26898 ) ) ( not ( = ?auto_26875 ?auto_26915 ) ) ( not ( = ?auto_26875 ?auto_26904 ) ) ( not ( = ?auto_26912 ?auto_26897 ) ) ( not ( = ?auto_26912 ?auto_26890 ) ) ( not ( = ?auto_26912 ?auto_26918 ) ) ( not ( = ?auto_26912 ?auto_26891 ) ) ( not ( = ?auto_26912 ?auto_26892 ) ) ( not ( = ?auto_26912 ?auto_26896 ) ) ( not ( = ?auto_26888 ?auto_26906 ) ) ( not ( = ?auto_26888 ?auto_26914 ) ) ( not ( = ?auto_26888 ?auto_26909 ) ) ( not ( = ?auto_26888 ?auto_26907 ) ) ( not ( = ?auto_26888 ?auto_26903 ) ) ( not ( = ?auto_26888 ?auto_26900 ) ) ( not ( = ?auto_26905 ?auto_26899 ) ) ( not ( = ?auto_26905 ?auto_26908 ) ) ( not ( = ?auto_26905 ?auto_26911 ) ) ( not ( = ?auto_26905 ?auto_26901 ) ) ( not ( = ?auto_26905 ?auto_26898 ) ) ( not ( = ?auto_26905 ?auto_26915 ) ) ( not ( = ?auto_26905 ?auto_26904 ) ) ( not ( = ?auto_26867 ?auto_26874 ) ) ( not ( = ?auto_26867 ?auto_26902 ) ) ( not ( = ?auto_26868 ?auto_26874 ) ) ( not ( = ?auto_26868 ?auto_26902 ) ) ( not ( = ?auto_26869 ?auto_26874 ) ) ( not ( = ?auto_26869 ?auto_26902 ) ) ( not ( = ?auto_26870 ?auto_26874 ) ) ( not ( = ?auto_26870 ?auto_26902 ) ) ( not ( = ?auto_26871 ?auto_26874 ) ) ( not ( = ?auto_26871 ?auto_26902 ) ) ( not ( = ?auto_26872 ?auto_26874 ) ) ( not ( = ?auto_26872 ?auto_26902 ) ) ( not ( = ?auto_26873 ?auto_26874 ) ) ( not ( = ?auto_26873 ?auto_26902 ) ) ( not ( = ?auto_26876 ?auto_26874 ) ) ( not ( = ?auto_26876 ?auto_26902 ) ) ( not ( = ?auto_26874 ?auto_26905 ) ) ( not ( = ?auto_26874 ?auto_26899 ) ) ( not ( = ?auto_26874 ?auto_26908 ) ) ( not ( = ?auto_26874 ?auto_26911 ) ) ( not ( = ?auto_26874 ?auto_26901 ) ) ( not ( = ?auto_26874 ?auto_26898 ) ) ( not ( = ?auto_26874 ?auto_26915 ) ) ( not ( = ?auto_26874 ?auto_26904 ) ) ( not ( = ?auto_26902 ?auto_26905 ) ) ( not ( = ?auto_26902 ?auto_26899 ) ) ( not ( = ?auto_26902 ?auto_26908 ) ) ( not ( = ?auto_26902 ?auto_26911 ) ) ( not ( = ?auto_26902 ?auto_26901 ) ) ( not ( = ?auto_26902 ?auto_26898 ) ) ( not ( = ?auto_26902 ?auto_26915 ) ) ( not ( = ?auto_26902 ?auto_26904 ) ) ( not ( = ?auto_26867 ?auto_26877 ) ) ( not ( = ?auto_26867 ?auto_26889 ) ) ( not ( = ?auto_26868 ?auto_26877 ) ) ( not ( = ?auto_26868 ?auto_26889 ) ) ( not ( = ?auto_26869 ?auto_26877 ) ) ( not ( = ?auto_26869 ?auto_26889 ) ) ( not ( = ?auto_26870 ?auto_26877 ) ) ( not ( = ?auto_26870 ?auto_26889 ) ) ( not ( = ?auto_26871 ?auto_26877 ) ) ( not ( = ?auto_26871 ?auto_26889 ) ) ( not ( = ?auto_26872 ?auto_26877 ) ) ( not ( = ?auto_26872 ?auto_26889 ) ) ( not ( = ?auto_26873 ?auto_26877 ) ) ( not ( = ?auto_26873 ?auto_26889 ) ) ( not ( = ?auto_26876 ?auto_26877 ) ) ( not ( = ?auto_26876 ?auto_26889 ) ) ( not ( = ?auto_26875 ?auto_26877 ) ) ( not ( = ?auto_26875 ?auto_26889 ) ) ( not ( = ?auto_26877 ?auto_26902 ) ) ( not ( = ?auto_26877 ?auto_26905 ) ) ( not ( = ?auto_26877 ?auto_26899 ) ) ( not ( = ?auto_26877 ?auto_26908 ) ) ( not ( = ?auto_26877 ?auto_26911 ) ) ( not ( = ?auto_26877 ?auto_26901 ) ) ( not ( = ?auto_26877 ?auto_26898 ) ) ( not ( = ?auto_26877 ?auto_26915 ) ) ( not ( = ?auto_26877 ?auto_26904 ) ) ( not ( = ?auto_26889 ?auto_26902 ) ) ( not ( = ?auto_26889 ?auto_26905 ) ) ( not ( = ?auto_26889 ?auto_26899 ) ) ( not ( = ?auto_26889 ?auto_26908 ) ) ( not ( = ?auto_26889 ?auto_26911 ) ) ( not ( = ?auto_26889 ?auto_26901 ) ) ( not ( = ?auto_26889 ?auto_26898 ) ) ( not ( = ?auto_26889 ?auto_26915 ) ) ( not ( = ?auto_26889 ?auto_26904 ) ) ( not ( = ?auto_26867 ?auto_26878 ) ) ( not ( = ?auto_26867 ?auto_26913 ) ) ( not ( = ?auto_26868 ?auto_26878 ) ) ( not ( = ?auto_26868 ?auto_26913 ) ) ( not ( = ?auto_26869 ?auto_26878 ) ) ( not ( = ?auto_26869 ?auto_26913 ) ) ( not ( = ?auto_26870 ?auto_26878 ) ) ( not ( = ?auto_26870 ?auto_26913 ) ) ( not ( = ?auto_26871 ?auto_26878 ) ) ( not ( = ?auto_26871 ?auto_26913 ) ) ( not ( = ?auto_26872 ?auto_26878 ) ) ( not ( = ?auto_26872 ?auto_26913 ) ) ( not ( = ?auto_26873 ?auto_26878 ) ) ( not ( = ?auto_26873 ?auto_26913 ) ) ( not ( = ?auto_26876 ?auto_26878 ) ) ( not ( = ?auto_26876 ?auto_26913 ) ) ( not ( = ?auto_26875 ?auto_26878 ) ) ( not ( = ?auto_26875 ?auto_26913 ) ) ( not ( = ?auto_26874 ?auto_26878 ) ) ( not ( = ?auto_26874 ?auto_26913 ) ) ( not ( = ?auto_26878 ?auto_26889 ) ) ( not ( = ?auto_26878 ?auto_26902 ) ) ( not ( = ?auto_26878 ?auto_26905 ) ) ( not ( = ?auto_26878 ?auto_26899 ) ) ( not ( = ?auto_26878 ?auto_26908 ) ) ( not ( = ?auto_26878 ?auto_26911 ) ) ( not ( = ?auto_26878 ?auto_26901 ) ) ( not ( = ?auto_26878 ?auto_26898 ) ) ( not ( = ?auto_26878 ?auto_26915 ) ) ( not ( = ?auto_26878 ?auto_26904 ) ) ( not ( = ?auto_26917 ?auto_26892 ) ) ( not ( = ?auto_26917 ?auto_26896 ) ) ( not ( = ?auto_26917 ?auto_26912 ) ) ( not ( = ?auto_26917 ?auto_26897 ) ) ( not ( = ?auto_26917 ?auto_26890 ) ) ( not ( = ?auto_26917 ?auto_26918 ) ) ( not ( = ?auto_26917 ?auto_26891 ) ) ( not ( = ?auto_26893 ?auto_26903 ) ) ( not ( = ?auto_26893 ?auto_26900 ) ) ( not ( = ?auto_26893 ?auto_26888 ) ) ( not ( = ?auto_26893 ?auto_26906 ) ) ( not ( = ?auto_26893 ?auto_26914 ) ) ( not ( = ?auto_26893 ?auto_26909 ) ) ( not ( = ?auto_26893 ?auto_26907 ) ) ( not ( = ?auto_26913 ?auto_26889 ) ) ( not ( = ?auto_26913 ?auto_26902 ) ) ( not ( = ?auto_26913 ?auto_26905 ) ) ( not ( = ?auto_26913 ?auto_26899 ) ) ( not ( = ?auto_26913 ?auto_26908 ) ) ( not ( = ?auto_26913 ?auto_26911 ) ) ( not ( = ?auto_26913 ?auto_26901 ) ) ( not ( = ?auto_26913 ?auto_26898 ) ) ( not ( = ?auto_26913 ?auto_26915 ) ) ( not ( = ?auto_26913 ?auto_26904 ) ) ( not ( = ?auto_26867 ?auto_26879 ) ) ( not ( = ?auto_26867 ?auto_26895 ) ) ( not ( = ?auto_26868 ?auto_26879 ) ) ( not ( = ?auto_26868 ?auto_26895 ) ) ( not ( = ?auto_26869 ?auto_26879 ) ) ( not ( = ?auto_26869 ?auto_26895 ) ) ( not ( = ?auto_26870 ?auto_26879 ) ) ( not ( = ?auto_26870 ?auto_26895 ) ) ( not ( = ?auto_26871 ?auto_26879 ) ) ( not ( = ?auto_26871 ?auto_26895 ) ) ( not ( = ?auto_26872 ?auto_26879 ) ) ( not ( = ?auto_26872 ?auto_26895 ) ) ( not ( = ?auto_26873 ?auto_26879 ) ) ( not ( = ?auto_26873 ?auto_26895 ) ) ( not ( = ?auto_26876 ?auto_26879 ) ) ( not ( = ?auto_26876 ?auto_26895 ) ) ( not ( = ?auto_26875 ?auto_26879 ) ) ( not ( = ?auto_26875 ?auto_26895 ) ) ( not ( = ?auto_26874 ?auto_26879 ) ) ( not ( = ?auto_26874 ?auto_26895 ) ) ( not ( = ?auto_26877 ?auto_26879 ) ) ( not ( = ?auto_26877 ?auto_26895 ) ) ( not ( = ?auto_26879 ?auto_26913 ) ) ( not ( = ?auto_26879 ?auto_26889 ) ) ( not ( = ?auto_26879 ?auto_26902 ) ) ( not ( = ?auto_26879 ?auto_26905 ) ) ( not ( = ?auto_26879 ?auto_26899 ) ) ( not ( = ?auto_26879 ?auto_26908 ) ) ( not ( = ?auto_26879 ?auto_26911 ) ) ( not ( = ?auto_26879 ?auto_26901 ) ) ( not ( = ?auto_26879 ?auto_26898 ) ) ( not ( = ?auto_26879 ?auto_26915 ) ) ( not ( = ?auto_26879 ?auto_26904 ) ) ( not ( = ?auto_26895 ?auto_26913 ) ) ( not ( = ?auto_26895 ?auto_26889 ) ) ( not ( = ?auto_26895 ?auto_26902 ) ) ( not ( = ?auto_26895 ?auto_26905 ) ) ( not ( = ?auto_26895 ?auto_26899 ) ) ( not ( = ?auto_26895 ?auto_26908 ) ) ( not ( = ?auto_26895 ?auto_26911 ) ) ( not ( = ?auto_26895 ?auto_26901 ) ) ( not ( = ?auto_26895 ?auto_26898 ) ) ( not ( = ?auto_26895 ?auto_26915 ) ) ( not ( = ?auto_26895 ?auto_26904 ) ) ( not ( = ?auto_26867 ?auto_26880 ) ) ( not ( = ?auto_26867 ?auto_26894 ) ) ( not ( = ?auto_26868 ?auto_26880 ) ) ( not ( = ?auto_26868 ?auto_26894 ) ) ( not ( = ?auto_26869 ?auto_26880 ) ) ( not ( = ?auto_26869 ?auto_26894 ) ) ( not ( = ?auto_26870 ?auto_26880 ) ) ( not ( = ?auto_26870 ?auto_26894 ) ) ( not ( = ?auto_26871 ?auto_26880 ) ) ( not ( = ?auto_26871 ?auto_26894 ) ) ( not ( = ?auto_26872 ?auto_26880 ) ) ( not ( = ?auto_26872 ?auto_26894 ) ) ( not ( = ?auto_26873 ?auto_26880 ) ) ( not ( = ?auto_26873 ?auto_26894 ) ) ( not ( = ?auto_26876 ?auto_26880 ) ) ( not ( = ?auto_26876 ?auto_26894 ) ) ( not ( = ?auto_26875 ?auto_26880 ) ) ( not ( = ?auto_26875 ?auto_26894 ) ) ( not ( = ?auto_26874 ?auto_26880 ) ) ( not ( = ?auto_26874 ?auto_26894 ) ) ( not ( = ?auto_26877 ?auto_26880 ) ) ( not ( = ?auto_26877 ?auto_26894 ) ) ( not ( = ?auto_26878 ?auto_26880 ) ) ( not ( = ?auto_26878 ?auto_26894 ) ) ( not ( = ?auto_26880 ?auto_26895 ) ) ( not ( = ?auto_26880 ?auto_26913 ) ) ( not ( = ?auto_26880 ?auto_26889 ) ) ( not ( = ?auto_26880 ?auto_26902 ) ) ( not ( = ?auto_26880 ?auto_26905 ) ) ( not ( = ?auto_26880 ?auto_26899 ) ) ( not ( = ?auto_26880 ?auto_26908 ) ) ( not ( = ?auto_26880 ?auto_26911 ) ) ( not ( = ?auto_26880 ?auto_26901 ) ) ( not ( = ?auto_26880 ?auto_26898 ) ) ( not ( = ?auto_26880 ?auto_26915 ) ) ( not ( = ?auto_26880 ?auto_26904 ) ) ( not ( = ?auto_26910 ?auto_26896 ) ) ( not ( = ?auto_26910 ?auto_26917 ) ) ( not ( = ?auto_26910 ?auto_26892 ) ) ( not ( = ?auto_26910 ?auto_26912 ) ) ( not ( = ?auto_26910 ?auto_26897 ) ) ( not ( = ?auto_26910 ?auto_26890 ) ) ( not ( = ?auto_26910 ?auto_26918 ) ) ( not ( = ?auto_26910 ?auto_26891 ) ) ( not ( = ?auto_26916 ?auto_26900 ) ) ( not ( = ?auto_26916 ?auto_26893 ) ) ( not ( = ?auto_26916 ?auto_26903 ) ) ( not ( = ?auto_26916 ?auto_26888 ) ) ( not ( = ?auto_26916 ?auto_26906 ) ) ( not ( = ?auto_26916 ?auto_26914 ) ) ( not ( = ?auto_26916 ?auto_26909 ) ) ( not ( = ?auto_26916 ?auto_26907 ) ) ( not ( = ?auto_26894 ?auto_26895 ) ) ( not ( = ?auto_26894 ?auto_26913 ) ) ( not ( = ?auto_26894 ?auto_26889 ) ) ( not ( = ?auto_26894 ?auto_26902 ) ) ( not ( = ?auto_26894 ?auto_26905 ) ) ( not ( = ?auto_26894 ?auto_26899 ) ) ( not ( = ?auto_26894 ?auto_26908 ) ) ( not ( = ?auto_26894 ?auto_26911 ) ) ( not ( = ?auto_26894 ?auto_26901 ) ) ( not ( = ?auto_26894 ?auto_26898 ) ) ( not ( = ?auto_26894 ?auto_26915 ) ) ( not ( = ?auto_26894 ?auto_26904 ) ) ( not ( = ?auto_26867 ?auto_26881 ) ) ( not ( = ?auto_26867 ?auto_26887 ) ) ( not ( = ?auto_26868 ?auto_26881 ) ) ( not ( = ?auto_26868 ?auto_26887 ) ) ( not ( = ?auto_26869 ?auto_26881 ) ) ( not ( = ?auto_26869 ?auto_26887 ) ) ( not ( = ?auto_26870 ?auto_26881 ) ) ( not ( = ?auto_26870 ?auto_26887 ) ) ( not ( = ?auto_26871 ?auto_26881 ) ) ( not ( = ?auto_26871 ?auto_26887 ) ) ( not ( = ?auto_26872 ?auto_26881 ) ) ( not ( = ?auto_26872 ?auto_26887 ) ) ( not ( = ?auto_26873 ?auto_26881 ) ) ( not ( = ?auto_26873 ?auto_26887 ) ) ( not ( = ?auto_26876 ?auto_26881 ) ) ( not ( = ?auto_26876 ?auto_26887 ) ) ( not ( = ?auto_26875 ?auto_26881 ) ) ( not ( = ?auto_26875 ?auto_26887 ) ) ( not ( = ?auto_26874 ?auto_26881 ) ) ( not ( = ?auto_26874 ?auto_26887 ) ) ( not ( = ?auto_26877 ?auto_26881 ) ) ( not ( = ?auto_26877 ?auto_26887 ) ) ( not ( = ?auto_26878 ?auto_26881 ) ) ( not ( = ?auto_26878 ?auto_26887 ) ) ( not ( = ?auto_26879 ?auto_26881 ) ) ( not ( = ?auto_26879 ?auto_26887 ) ) ( not ( = ?auto_26881 ?auto_26894 ) ) ( not ( = ?auto_26881 ?auto_26895 ) ) ( not ( = ?auto_26881 ?auto_26913 ) ) ( not ( = ?auto_26881 ?auto_26889 ) ) ( not ( = ?auto_26881 ?auto_26902 ) ) ( not ( = ?auto_26881 ?auto_26905 ) ) ( not ( = ?auto_26881 ?auto_26899 ) ) ( not ( = ?auto_26881 ?auto_26908 ) ) ( not ( = ?auto_26881 ?auto_26911 ) ) ( not ( = ?auto_26881 ?auto_26901 ) ) ( not ( = ?auto_26881 ?auto_26898 ) ) ( not ( = ?auto_26881 ?auto_26915 ) ) ( not ( = ?auto_26881 ?auto_26904 ) ) ( not ( = ?auto_26886 ?auto_26910 ) ) ( not ( = ?auto_26886 ?auto_26896 ) ) ( not ( = ?auto_26886 ?auto_26917 ) ) ( not ( = ?auto_26886 ?auto_26892 ) ) ( not ( = ?auto_26886 ?auto_26912 ) ) ( not ( = ?auto_26886 ?auto_26897 ) ) ( not ( = ?auto_26886 ?auto_26890 ) ) ( not ( = ?auto_26886 ?auto_26918 ) ) ( not ( = ?auto_26886 ?auto_26891 ) ) ( not ( = ?auto_26883 ?auto_26916 ) ) ( not ( = ?auto_26883 ?auto_26900 ) ) ( not ( = ?auto_26883 ?auto_26893 ) ) ( not ( = ?auto_26883 ?auto_26903 ) ) ( not ( = ?auto_26883 ?auto_26888 ) ) ( not ( = ?auto_26883 ?auto_26906 ) ) ( not ( = ?auto_26883 ?auto_26914 ) ) ( not ( = ?auto_26883 ?auto_26909 ) ) ( not ( = ?auto_26883 ?auto_26907 ) ) ( not ( = ?auto_26887 ?auto_26894 ) ) ( not ( = ?auto_26887 ?auto_26895 ) ) ( not ( = ?auto_26887 ?auto_26913 ) ) ( not ( = ?auto_26887 ?auto_26889 ) ) ( not ( = ?auto_26887 ?auto_26902 ) ) ( not ( = ?auto_26887 ?auto_26905 ) ) ( not ( = ?auto_26887 ?auto_26899 ) ) ( not ( = ?auto_26887 ?auto_26908 ) ) ( not ( = ?auto_26887 ?auto_26911 ) ) ( not ( = ?auto_26887 ?auto_26901 ) ) ( not ( = ?auto_26887 ?auto_26898 ) ) ( not ( = ?auto_26887 ?auto_26915 ) ) ( not ( = ?auto_26887 ?auto_26904 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_26867 ?auto_26868 ?auto_26869 ?auto_26870 ?auto_26871 ?auto_26872 ?auto_26873 ?auto_26876 ?auto_26875 ?auto_26874 ?auto_26877 ?auto_26878 ?auto_26879 ?auto_26880 )
      ( MAKE-1CRATE ?auto_26880 ?auto_26881 )
      ( MAKE-14CRATE-VERIFY ?auto_26867 ?auto_26868 ?auto_26869 ?auto_26870 ?auto_26871 ?auto_26872 ?auto_26873 ?auto_26876 ?auto_26875 ?auto_26874 ?auto_26877 ?auto_26878 ?auto_26879 ?auto_26880 ?auto_26881 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_26921 - SURFACE
      ?auto_26922 - SURFACE
    )
    :vars
    (
      ?auto_26923 - HOIST
      ?auto_26924 - PLACE
      ?auto_26926 - PLACE
      ?auto_26927 - HOIST
      ?auto_26928 - SURFACE
      ?auto_26925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26923 ?auto_26924 ) ( SURFACE-AT ?auto_26921 ?auto_26924 ) ( CLEAR ?auto_26921 ) ( IS-CRATE ?auto_26922 ) ( AVAILABLE ?auto_26923 ) ( not ( = ?auto_26926 ?auto_26924 ) ) ( HOIST-AT ?auto_26927 ?auto_26926 ) ( AVAILABLE ?auto_26927 ) ( SURFACE-AT ?auto_26922 ?auto_26926 ) ( ON ?auto_26922 ?auto_26928 ) ( CLEAR ?auto_26922 ) ( TRUCK-AT ?auto_26925 ?auto_26924 ) ( not ( = ?auto_26921 ?auto_26922 ) ) ( not ( = ?auto_26921 ?auto_26928 ) ) ( not ( = ?auto_26922 ?auto_26928 ) ) ( not ( = ?auto_26923 ?auto_26927 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26925 ?auto_26924 ?auto_26926 )
      ( !LIFT ?auto_26927 ?auto_26922 ?auto_26928 ?auto_26926 )
      ( !LOAD ?auto_26927 ?auto_26922 ?auto_26925 ?auto_26926 )
      ( !DRIVE ?auto_26925 ?auto_26926 ?auto_26924 )
      ( !UNLOAD ?auto_26923 ?auto_26922 ?auto_26925 ?auto_26924 )
      ( !DROP ?auto_26923 ?auto_26922 ?auto_26921 ?auto_26924 )
      ( MAKE-1CRATE-VERIFY ?auto_26921 ?auto_26922 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_26945 - SURFACE
      ?auto_26946 - SURFACE
      ?auto_26947 - SURFACE
      ?auto_26948 - SURFACE
      ?auto_26949 - SURFACE
      ?auto_26950 - SURFACE
      ?auto_26951 - SURFACE
      ?auto_26954 - SURFACE
      ?auto_26953 - SURFACE
      ?auto_26952 - SURFACE
      ?auto_26955 - SURFACE
      ?auto_26956 - SURFACE
      ?auto_26957 - SURFACE
      ?auto_26958 - SURFACE
      ?auto_26960 - SURFACE
      ?auto_26959 - SURFACE
    )
    :vars
    (
      ?auto_26964 - HOIST
      ?auto_26966 - PLACE
      ?auto_26962 - PLACE
      ?auto_26965 - HOIST
      ?auto_26963 - SURFACE
      ?auto_26985 - PLACE
      ?auto_26975 - HOIST
      ?auto_26991 - SURFACE
      ?auto_26988 - PLACE
      ?auto_26970 - HOIST
      ?auto_26978 - SURFACE
      ?auto_26977 - PLACE
      ?auto_26983 - HOIST
      ?auto_26974 - SURFACE
      ?auto_26999 - PLACE
      ?auto_26967 - HOIST
      ?auto_26992 - SURFACE
      ?auto_26998 - PLACE
      ?auto_26995 - HOIST
      ?auto_26973 - SURFACE
      ?auto_26993 - SURFACE
      ?auto_26980 - PLACE
      ?auto_26982 - HOIST
      ?auto_26997 - SURFACE
      ?auto_26981 - PLACE
      ?auto_26979 - HOIST
      ?auto_26987 - SURFACE
      ?auto_26968 - PLACE
      ?auto_26971 - HOIST
      ?auto_26972 - SURFACE
      ?auto_26989 - PLACE
      ?auto_26994 - HOIST
      ?auto_26986 - SURFACE
      ?auto_26996 - PLACE
      ?auto_26984 - HOIST
      ?auto_27000 - SURFACE
      ?auto_26990 - SURFACE
      ?auto_26976 - SURFACE
      ?auto_26969 - SURFACE
      ?auto_26961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26964 ?auto_26966 ) ( IS-CRATE ?auto_26959 ) ( not ( = ?auto_26962 ?auto_26966 ) ) ( HOIST-AT ?auto_26965 ?auto_26962 ) ( AVAILABLE ?auto_26965 ) ( SURFACE-AT ?auto_26959 ?auto_26962 ) ( ON ?auto_26959 ?auto_26963 ) ( CLEAR ?auto_26959 ) ( not ( = ?auto_26960 ?auto_26959 ) ) ( not ( = ?auto_26960 ?auto_26963 ) ) ( not ( = ?auto_26959 ?auto_26963 ) ) ( not ( = ?auto_26964 ?auto_26965 ) ) ( IS-CRATE ?auto_26960 ) ( not ( = ?auto_26985 ?auto_26966 ) ) ( HOIST-AT ?auto_26975 ?auto_26985 ) ( AVAILABLE ?auto_26975 ) ( SURFACE-AT ?auto_26960 ?auto_26985 ) ( ON ?auto_26960 ?auto_26991 ) ( CLEAR ?auto_26960 ) ( not ( = ?auto_26958 ?auto_26960 ) ) ( not ( = ?auto_26958 ?auto_26991 ) ) ( not ( = ?auto_26960 ?auto_26991 ) ) ( not ( = ?auto_26964 ?auto_26975 ) ) ( IS-CRATE ?auto_26958 ) ( not ( = ?auto_26988 ?auto_26966 ) ) ( HOIST-AT ?auto_26970 ?auto_26988 ) ( AVAILABLE ?auto_26970 ) ( SURFACE-AT ?auto_26958 ?auto_26988 ) ( ON ?auto_26958 ?auto_26978 ) ( CLEAR ?auto_26958 ) ( not ( = ?auto_26957 ?auto_26958 ) ) ( not ( = ?auto_26957 ?auto_26978 ) ) ( not ( = ?auto_26958 ?auto_26978 ) ) ( not ( = ?auto_26964 ?auto_26970 ) ) ( IS-CRATE ?auto_26957 ) ( not ( = ?auto_26977 ?auto_26966 ) ) ( HOIST-AT ?auto_26983 ?auto_26977 ) ( SURFACE-AT ?auto_26957 ?auto_26977 ) ( ON ?auto_26957 ?auto_26974 ) ( CLEAR ?auto_26957 ) ( not ( = ?auto_26956 ?auto_26957 ) ) ( not ( = ?auto_26956 ?auto_26974 ) ) ( not ( = ?auto_26957 ?auto_26974 ) ) ( not ( = ?auto_26964 ?auto_26983 ) ) ( IS-CRATE ?auto_26956 ) ( not ( = ?auto_26999 ?auto_26966 ) ) ( HOIST-AT ?auto_26967 ?auto_26999 ) ( AVAILABLE ?auto_26967 ) ( SURFACE-AT ?auto_26956 ?auto_26999 ) ( ON ?auto_26956 ?auto_26992 ) ( CLEAR ?auto_26956 ) ( not ( = ?auto_26955 ?auto_26956 ) ) ( not ( = ?auto_26955 ?auto_26992 ) ) ( not ( = ?auto_26956 ?auto_26992 ) ) ( not ( = ?auto_26964 ?auto_26967 ) ) ( IS-CRATE ?auto_26955 ) ( not ( = ?auto_26998 ?auto_26966 ) ) ( HOIST-AT ?auto_26995 ?auto_26998 ) ( SURFACE-AT ?auto_26955 ?auto_26998 ) ( ON ?auto_26955 ?auto_26973 ) ( CLEAR ?auto_26955 ) ( not ( = ?auto_26952 ?auto_26955 ) ) ( not ( = ?auto_26952 ?auto_26973 ) ) ( not ( = ?auto_26955 ?auto_26973 ) ) ( not ( = ?auto_26964 ?auto_26995 ) ) ( IS-CRATE ?auto_26952 ) ( SURFACE-AT ?auto_26952 ?auto_26977 ) ( ON ?auto_26952 ?auto_26993 ) ( CLEAR ?auto_26952 ) ( not ( = ?auto_26953 ?auto_26952 ) ) ( not ( = ?auto_26953 ?auto_26993 ) ) ( not ( = ?auto_26952 ?auto_26993 ) ) ( IS-CRATE ?auto_26953 ) ( not ( = ?auto_26980 ?auto_26966 ) ) ( HOIST-AT ?auto_26982 ?auto_26980 ) ( AVAILABLE ?auto_26982 ) ( SURFACE-AT ?auto_26953 ?auto_26980 ) ( ON ?auto_26953 ?auto_26997 ) ( CLEAR ?auto_26953 ) ( not ( = ?auto_26954 ?auto_26953 ) ) ( not ( = ?auto_26954 ?auto_26997 ) ) ( not ( = ?auto_26953 ?auto_26997 ) ) ( not ( = ?auto_26964 ?auto_26982 ) ) ( IS-CRATE ?auto_26954 ) ( not ( = ?auto_26981 ?auto_26966 ) ) ( HOIST-AT ?auto_26979 ?auto_26981 ) ( AVAILABLE ?auto_26979 ) ( SURFACE-AT ?auto_26954 ?auto_26981 ) ( ON ?auto_26954 ?auto_26987 ) ( CLEAR ?auto_26954 ) ( not ( = ?auto_26951 ?auto_26954 ) ) ( not ( = ?auto_26951 ?auto_26987 ) ) ( not ( = ?auto_26954 ?auto_26987 ) ) ( not ( = ?auto_26964 ?auto_26979 ) ) ( IS-CRATE ?auto_26951 ) ( not ( = ?auto_26968 ?auto_26966 ) ) ( HOIST-AT ?auto_26971 ?auto_26968 ) ( AVAILABLE ?auto_26971 ) ( SURFACE-AT ?auto_26951 ?auto_26968 ) ( ON ?auto_26951 ?auto_26972 ) ( CLEAR ?auto_26951 ) ( not ( = ?auto_26950 ?auto_26951 ) ) ( not ( = ?auto_26950 ?auto_26972 ) ) ( not ( = ?auto_26951 ?auto_26972 ) ) ( not ( = ?auto_26964 ?auto_26971 ) ) ( IS-CRATE ?auto_26950 ) ( not ( = ?auto_26989 ?auto_26966 ) ) ( HOIST-AT ?auto_26994 ?auto_26989 ) ( AVAILABLE ?auto_26994 ) ( SURFACE-AT ?auto_26950 ?auto_26989 ) ( ON ?auto_26950 ?auto_26986 ) ( CLEAR ?auto_26950 ) ( not ( = ?auto_26949 ?auto_26950 ) ) ( not ( = ?auto_26949 ?auto_26986 ) ) ( not ( = ?auto_26950 ?auto_26986 ) ) ( not ( = ?auto_26964 ?auto_26994 ) ) ( IS-CRATE ?auto_26949 ) ( not ( = ?auto_26996 ?auto_26966 ) ) ( HOIST-AT ?auto_26984 ?auto_26996 ) ( SURFACE-AT ?auto_26949 ?auto_26996 ) ( ON ?auto_26949 ?auto_27000 ) ( CLEAR ?auto_26949 ) ( not ( = ?auto_26948 ?auto_26949 ) ) ( not ( = ?auto_26948 ?auto_27000 ) ) ( not ( = ?auto_26949 ?auto_27000 ) ) ( not ( = ?auto_26964 ?auto_26984 ) ) ( IS-CRATE ?auto_26948 ) ( AVAILABLE ?auto_26995 ) ( SURFACE-AT ?auto_26948 ?auto_26998 ) ( ON ?auto_26948 ?auto_26990 ) ( CLEAR ?auto_26948 ) ( not ( = ?auto_26947 ?auto_26948 ) ) ( not ( = ?auto_26947 ?auto_26990 ) ) ( not ( = ?auto_26948 ?auto_26990 ) ) ( IS-CRATE ?auto_26947 ) ( AVAILABLE ?auto_26984 ) ( SURFACE-AT ?auto_26947 ?auto_26996 ) ( ON ?auto_26947 ?auto_26976 ) ( CLEAR ?auto_26947 ) ( not ( = ?auto_26946 ?auto_26947 ) ) ( not ( = ?auto_26946 ?auto_26976 ) ) ( not ( = ?auto_26947 ?auto_26976 ) ) ( SURFACE-AT ?auto_26945 ?auto_26966 ) ( CLEAR ?auto_26945 ) ( IS-CRATE ?auto_26946 ) ( AVAILABLE ?auto_26964 ) ( AVAILABLE ?auto_26983 ) ( SURFACE-AT ?auto_26946 ?auto_26977 ) ( ON ?auto_26946 ?auto_26969 ) ( CLEAR ?auto_26946 ) ( TRUCK-AT ?auto_26961 ?auto_26966 ) ( not ( = ?auto_26945 ?auto_26946 ) ) ( not ( = ?auto_26945 ?auto_26969 ) ) ( not ( = ?auto_26946 ?auto_26969 ) ) ( not ( = ?auto_26945 ?auto_26947 ) ) ( not ( = ?auto_26945 ?auto_26976 ) ) ( not ( = ?auto_26947 ?auto_26969 ) ) ( not ( = ?auto_26996 ?auto_26977 ) ) ( not ( = ?auto_26984 ?auto_26983 ) ) ( not ( = ?auto_26976 ?auto_26969 ) ) ( not ( = ?auto_26945 ?auto_26948 ) ) ( not ( = ?auto_26945 ?auto_26990 ) ) ( not ( = ?auto_26946 ?auto_26948 ) ) ( not ( = ?auto_26946 ?auto_26990 ) ) ( not ( = ?auto_26948 ?auto_26976 ) ) ( not ( = ?auto_26948 ?auto_26969 ) ) ( not ( = ?auto_26998 ?auto_26996 ) ) ( not ( = ?auto_26998 ?auto_26977 ) ) ( not ( = ?auto_26995 ?auto_26984 ) ) ( not ( = ?auto_26995 ?auto_26983 ) ) ( not ( = ?auto_26990 ?auto_26976 ) ) ( not ( = ?auto_26990 ?auto_26969 ) ) ( not ( = ?auto_26945 ?auto_26949 ) ) ( not ( = ?auto_26945 ?auto_27000 ) ) ( not ( = ?auto_26946 ?auto_26949 ) ) ( not ( = ?auto_26946 ?auto_27000 ) ) ( not ( = ?auto_26947 ?auto_26949 ) ) ( not ( = ?auto_26947 ?auto_27000 ) ) ( not ( = ?auto_26949 ?auto_26990 ) ) ( not ( = ?auto_26949 ?auto_26976 ) ) ( not ( = ?auto_26949 ?auto_26969 ) ) ( not ( = ?auto_27000 ?auto_26990 ) ) ( not ( = ?auto_27000 ?auto_26976 ) ) ( not ( = ?auto_27000 ?auto_26969 ) ) ( not ( = ?auto_26945 ?auto_26950 ) ) ( not ( = ?auto_26945 ?auto_26986 ) ) ( not ( = ?auto_26946 ?auto_26950 ) ) ( not ( = ?auto_26946 ?auto_26986 ) ) ( not ( = ?auto_26947 ?auto_26950 ) ) ( not ( = ?auto_26947 ?auto_26986 ) ) ( not ( = ?auto_26948 ?auto_26950 ) ) ( not ( = ?auto_26948 ?auto_26986 ) ) ( not ( = ?auto_26950 ?auto_27000 ) ) ( not ( = ?auto_26950 ?auto_26990 ) ) ( not ( = ?auto_26950 ?auto_26976 ) ) ( not ( = ?auto_26950 ?auto_26969 ) ) ( not ( = ?auto_26989 ?auto_26996 ) ) ( not ( = ?auto_26989 ?auto_26998 ) ) ( not ( = ?auto_26989 ?auto_26977 ) ) ( not ( = ?auto_26994 ?auto_26984 ) ) ( not ( = ?auto_26994 ?auto_26995 ) ) ( not ( = ?auto_26994 ?auto_26983 ) ) ( not ( = ?auto_26986 ?auto_27000 ) ) ( not ( = ?auto_26986 ?auto_26990 ) ) ( not ( = ?auto_26986 ?auto_26976 ) ) ( not ( = ?auto_26986 ?auto_26969 ) ) ( not ( = ?auto_26945 ?auto_26951 ) ) ( not ( = ?auto_26945 ?auto_26972 ) ) ( not ( = ?auto_26946 ?auto_26951 ) ) ( not ( = ?auto_26946 ?auto_26972 ) ) ( not ( = ?auto_26947 ?auto_26951 ) ) ( not ( = ?auto_26947 ?auto_26972 ) ) ( not ( = ?auto_26948 ?auto_26951 ) ) ( not ( = ?auto_26948 ?auto_26972 ) ) ( not ( = ?auto_26949 ?auto_26951 ) ) ( not ( = ?auto_26949 ?auto_26972 ) ) ( not ( = ?auto_26951 ?auto_26986 ) ) ( not ( = ?auto_26951 ?auto_27000 ) ) ( not ( = ?auto_26951 ?auto_26990 ) ) ( not ( = ?auto_26951 ?auto_26976 ) ) ( not ( = ?auto_26951 ?auto_26969 ) ) ( not ( = ?auto_26968 ?auto_26989 ) ) ( not ( = ?auto_26968 ?auto_26996 ) ) ( not ( = ?auto_26968 ?auto_26998 ) ) ( not ( = ?auto_26968 ?auto_26977 ) ) ( not ( = ?auto_26971 ?auto_26994 ) ) ( not ( = ?auto_26971 ?auto_26984 ) ) ( not ( = ?auto_26971 ?auto_26995 ) ) ( not ( = ?auto_26971 ?auto_26983 ) ) ( not ( = ?auto_26972 ?auto_26986 ) ) ( not ( = ?auto_26972 ?auto_27000 ) ) ( not ( = ?auto_26972 ?auto_26990 ) ) ( not ( = ?auto_26972 ?auto_26976 ) ) ( not ( = ?auto_26972 ?auto_26969 ) ) ( not ( = ?auto_26945 ?auto_26954 ) ) ( not ( = ?auto_26945 ?auto_26987 ) ) ( not ( = ?auto_26946 ?auto_26954 ) ) ( not ( = ?auto_26946 ?auto_26987 ) ) ( not ( = ?auto_26947 ?auto_26954 ) ) ( not ( = ?auto_26947 ?auto_26987 ) ) ( not ( = ?auto_26948 ?auto_26954 ) ) ( not ( = ?auto_26948 ?auto_26987 ) ) ( not ( = ?auto_26949 ?auto_26954 ) ) ( not ( = ?auto_26949 ?auto_26987 ) ) ( not ( = ?auto_26950 ?auto_26954 ) ) ( not ( = ?auto_26950 ?auto_26987 ) ) ( not ( = ?auto_26954 ?auto_26972 ) ) ( not ( = ?auto_26954 ?auto_26986 ) ) ( not ( = ?auto_26954 ?auto_27000 ) ) ( not ( = ?auto_26954 ?auto_26990 ) ) ( not ( = ?auto_26954 ?auto_26976 ) ) ( not ( = ?auto_26954 ?auto_26969 ) ) ( not ( = ?auto_26981 ?auto_26968 ) ) ( not ( = ?auto_26981 ?auto_26989 ) ) ( not ( = ?auto_26981 ?auto_26996 ) ) ( not ( = ?auto_26981 ?auto_26998 ) ) ( not ( = ?auto_26981 ?auto_26977 ) ) ( not ( = ?auto_26979 ?auto_26971 ) ) ( not ( = ?auto_26979 ?auto_26994 ) ) ( not ( = ?auto_26979 ?auto_26984 ) ) ( not ( = ?auto_26979 ?auto_26995 ) ) ( not ( = ?auto_26979 ?auto_26983 ) ) ( not ( = ?auto_26987 ?auto_26972 ) ) ( not ( = ?auto_26987 ?auto_26986 ) ) ( not ( = ?auto_26987 ?auto_27000 ) ) ( not ( = ?auto_26987 ?auto_26990 ) ) ( not ( = ?auto_26987 ?auto_26976 ) ) ( not ( = ?auto_26987 ?auto_26969 ) ) ( not ( = ?auto_26945 ?auto_26953 ) ) ( not ( = ?auto_26945 ?auto_26997 ) ) ( not ( = ?auto_26946 ?auto_26953 ) ) ( not ( = ?auto_26946 ?auto_26997 ) ) ( not ( = ?auto_26947 ?auto_26953 ) ) ( not ( = ?auto_26947 ?auto_26997 ) ) ( not ( = ?auto_26948 ?auto_26953 ) ) ( not ( = ?auto_26948 ?auto_26997 ) ) ( not ( = ?auto_26949 ?auto_26953 ) ) ( not ( = ?auto_26949 ?auto_26997 ) ) ( not ( = ?auto_26950 ?auto_26953 ) ) ( not ( = ?auto_26950 ?auto_26997 ) ) ( not ( = ?auto_26951 ?auto_26953 ) ) ( not ( = ?auto_26951 ?auto_26997 ) ) ( not ( = ?auto_26953 ?auto_26987 ) ) ( not ( = ?auto_26953 ?auto_26972 ) ) ( not ( = ?auto_26953 ?auto_26986 ) ) ( not ( = ?auto_26953 ?auto_27000 ) ) ( not ( = ?auto_26953 ?auto_26990 ) ) ( not ( = ?auto_26953 ?auto_26976 ) ) ( not ( = ?auto_26953 ?auto_26969 ) ) ( not ( = ?auto_26980 ?auto_26981 ) ) ( not ( = ?auto_26980 ?auto_26968 ) ) ( not ( = ?auto_26980 ?auto_26989 ) ) ( not ( = ?auto_26980 ?auto_26996 ) ) ( not ( = ?auto_26980 ?auto_26998 ) ) ( not ( = ?auto_26980 ?auto_26977 ) ) ( not ( = ?auto_26982 ?auto_26979 ) ) ( not ( = ?auto_26982 ?auto_26971 ) ) ( not ( = ?auto_26982 ?auto_26994 ) ) ( not ( = ?auto_26982 ?auto_26984 ) ) ( not ( = ?auto_26982 ?auto_26995 ) ) ( not ( = ?auto_26982 ?auto_26983 ) ) ( not ( = ?auto_26997 ?auto_26987 ) ) ( not ( = ?auto_26997 ?auto_26972 ) ) ( not ( = ?auto_26997 ?auto_26986 ) ) ( not ( = ?auto_26997 ?auto_27000 ) ) ( not ( = ?auto_26997 ?auto_26990 ) ) ( not ( = ?auto_26997 ?auto_26976 ) ) ( not ( = ?auto_26997 ?auto_26969 ) ) ( not ( = ?auto_26945 ?auto_26952 ) ) ( not ( = ?auto_26945 ?auto_26993 ) ) ( not ( = ?auto_26946 ?auto_26952 ) ) ( not ( = ?auto_26946 ?auto_26993 ) ) ( not ( = ?auto_26947 ?auto_26952 ) ) ( not ( = ?auto_26947 ?auto_26993 ) ) ( not ( = ?auto_26948 ?auto_26952 ) ) ( not ( = ?auto_26948 ?auto_26993 ) ) ( not ( = ?auto_26949 ?auto_26952 ) ) ( not ( = ?auto_26949 ?auto_26993 ) ) ( not ( = ?auto_26950 ?auto_26952 ) ) ( not ( = ?auto_26950 ?auto_26993 ) ) ( not ( = ?auto_26951 ?auto_26952 ) ) ( not ( = ?auto_26951 ?auto_26993 ) ) ( not ( = ?auto_26954 ?auto_26952 ) ) ( not ( = ?auto_26954 ?auto_26993 ) ) ( not ( = ?auto_26952 ?auto_26997 ) ) ( not ( = ?auto_26952 ?auto_26987 ) ) ( not ( = ?auto_26952 ?auto_26972 ) ) ( not ( = ?auto_26952 ?auto_26986 ) ) ( not ( = ?auto_26952 ?auto_27000 ) ) ( not ( = ?auto_26952 ?auto_26990 ) ) ( not ( = ?auto_26952 ?auto_26976 ) ) ( not ( = ?auto_26952 ?auto_26969 ) ) ( not ( = ?auto_26993 ?auto_26997 ) ) ( not ( = ?auto_26993 ?auto_26987 ) ) ( not ( = ?auto_26993 ?auto_26972 ) ) ( not ( = ?auto_26993 ?auto_26986 ) ) ( not ( = ?auto_26993 ?auto_27000 ) ) ( not ( = ?auto_26993 ?auto_26990 ) ) ( not ( = ?auto_26993 ?auto_26976 ) ) ( not ( = ?auto_26993 ?auto_26969 ) ) ( not ( = ?auto_26945 ?auto_26955 ) ) ( not ( = ?auto_26945 ?auto_26973 ) ) ( not ( = ?auto_26946 ?auto_26955 ) ) ( not ( = ?auto_26946 ?auto_26973 ) ) ( not ( = ?auto_26947 ?auto_26955 ) ) ( not ( = ?auto_26947 ?auto_26973 ) ) ( not ( = ?auto_26948 ?auto_26955 ) ) ( not ( = ?auto_26948 ?auto_26973 ) ) ( not ( = ?auto_26949 ?auto_26955 ) ) ( not ( = ?auto_26949 ?auto_26973 ) ) ( not ( = ?auto_26950 ?auto_26955 ) ) ( not ( = ?auto_26950 ?auto_26973 ) ) ( not ( = ?auto_26951 ?auto_26955 ) ) ( not ( = ?auto_26951 ?auto_26973 ) ) ( not ( = ?auto_26954 ?auto_26955 ) ) ( not ( = ?auto_26954 ?auto_26973 ) ) ( not ( = ?auto_26953 ?auto_26955 ) ) ( not ( = ?auto_26953 ?auto_26973 ) ) ( not ( = ?auto_26955 ?auto_26993 ) ) ( not ( = ?auto_26955 ?auto_26997 ) ) ( not ( = ?auto_26955 ?auto_26987 ) ) ( not ( = ?auto_26955 ?auto_26972 ) ) ( not ( = ?auto_26955 ?auto_26986 ) ) ( not ( = ?auto_26955 ?auto_27000 ) ) ( not ( = ?auto_26955 ?auto_26990 ) ) ( not ( = ?auto_26955 ?auto_26976 ) ) ( not ( = ?auto_26955 ?auto_26969 ) ) ( not ( = ?auto_26973 ?auto_26993 ) ) ( not ( = ?auto_26973 ?auto_26997 ) ) ( not ( = ?auto_26973 ?auto_26987 ) ) ( not ( = ?auto_26973 ?auto_26972 ) ) ( not ( = ?auto_26973 ?auto_26986 ) ) ( not ( = ?auto_26973 ?auto_27000 ) ) ( not ( = ?auto_26973 ?auto_26990 ) ) ( not ( = ?auto_26973 ?auto_26976 ) ) ( not ( = ?auto_26973 ?auto_26969 ) ) ( not ( = ?auto_26945 ?auto_26956 ) ) ( not ( = ?auto_26945 ?auto_26992 ) ) ( not ( = ?auto_26946 ?auto_26956 ) ) ( not ( = ?auto_26946 ?auto_26992 ) ) ( not ( = ?auto_26947 ?auto_26956 ) ) ( not ( = ?auto_26947 ?auto_26992 ) ) ( not ( = ?auto_26948 ?auto_26956 ) ) ( not ( = ?auto_26948 ?auto_26992 ) ) ( not ( = ?auto_26949 ?auto_26956 ) ) ( not ( = ?auto_26949 ?auto_26992 ) ) ( not ( = ?auto_26950 ?auto_26956 ) ) ( not ( = ?auto_26950 ?auto_26992 ) ) ( not ( = ?auto_26951 ?auto_26956 ) ) ( not ( = ?auto_26951 ?auto_26992 ) ) ( not ( = ?auto_26954 ?auto_26956 ) ) ( not ( = ?auto_26954 ?auto_26992 ) ) ( not ( = ?auto_26953 ?auto_26956 ) ) ( not ( = ?auto_26953 ?auto_26992 ) ) ( not ( = ?auto_26952 ?auto_26956 ) ) ( not ( = ?auto_26952 ?auto_26992 ) ) ( not ( = ?auto_26956 ?auto_26973 ) ) ( not ( = ?auto_26956 ?auto_26993 ) ) ( not ( = ?auto_26956 ?auto_26997 ) ) ( not ( = ?auto_26956 ?auto_26987 ) ) ( not ( = ?auto_26956 ?auto_26972 ) ) ( not ( = ?auto_26956 ?auto_26986 ) ) ( not ( = ?auto_26956 ?auto_27000 ) ) ( not ( = ?auto_26956 ?auto_26990 ) ) ( not ( = ?auto_26956 ?auto_26976 ) ) ( not ( = ?auto_26956 ?auto_26969 ) ) ( not ( = ?auto_26999 ?auto_26998 ) ) ( not ( = ?auto_26999 ?auto_26977 ) ) ( not ( = ?auto_26999 ?auto_26980 ) ) ( not ( = ?auto_26999 ?auto_26981 ) ) ( not ( = ?auto_26999 ?auto_26968 ) ) ( not ( = ?auto_26999 ?auto_26989 ) ) ( not ( = ?auto_26999 ?auto_26996 ) ) ( not ( = ?auto_26967 ?auto_26995 ) ) ( not ( = ?auto_26967 ?auto_26983 ) ) ( not ( = ?auto_26967 ?auto_26982 ) ) ( not ( = ?auto_26967 ?auto_26979 ) ) ( not ( = ?auto_26967 ?auto_26971 ) ) ( not ( = ?auto_26967 ?auto_26994 ) ) ( not ( = ?auto_26967 ?auto_26984 ) ) ( not ( = ?auto_26992 ?auto_26973 ) ) ( not ( = ?auto_26992 ?auto_26993 ) ) ( not ( = ?auto_26992 ?auto_26997 ) ) ( not ( = ?auto_26992 ?auto_26987 ) ) ( not ( = ?auto_26992 ?auto_26972 ) ) ( not ( = ?auto_26992 ?auto_26986 ) ) ( not ( = ?auto_26992 ?auto_27000 ) ) ( not ( = ?auto_26992 ?auto_26990 ) ) ( not ( = ?auto_26992 ?auto_26976 ) ) ( not ( = ?auto_26992 ?auto_26969 ) ) ( not ( = ?auto_26945 ?auto_26957 ) ) ( not ( = ?auto_26945 ?auto_26974 ) ) ( not ( = ?auto_26946 ?auto_26957 ) ) ( not ( = ?auto_26946 ?auto_26974 ) ) ( not ( = ?auto_26947 ?auto_26957 ) ) ( not ( = ?auto_26947 ?auto_26974 ) ) ( not ( = ?auto_26948 ?auto_26957 ) ) ( not ( = ?auto_26948 ?auto_26974 ) ) ( not ( = ?auto_26949 ?auto_26957 ) ) ( not ( = ?auto_26949 ?auto_26974 ) ) ( not ( = ?auto_26950 ?auto_26957 ) ) ( not ( = ?auto_26950 ?auto_26974 ) ) ( not ( = ?auto_26951 ?auto_26957 ) ) ( not ( = ?auto_26951 ?auto_26974 ) ) ( not ( = ?auto_26954 ?auto_26957 ) ) ( not ( = ?auto_26954 ?auto_26974 ) ) ( not ( = ?auto_26953 ?auto_26957 ) ) ( not ( = ?auto_26953 ?auto_26974 ) ) ( not ( = ?auto_26952 ?auto_26957 ) ) ( not ( = ?auto_26952 ?auto_26974 ) ) ( not ( = ?auto_26955 ?auto_26957 ) ) ( not ( = ?auto_26955 ?auto_26974 ) ) ( not ( = ?auto_26957 ?auto_26992 ) ) ( not ( = ?auto_26957 ?auto_26973 ) ) ( not ( = ?auto_26957 ?auto_26993 ) ) ( not ( = ?auto_26957 ?auto_26997 ) ) ( not ( = ?auto_26957 ?auto_26987 ) ) ( not ( = ?auto_26957 ?auto_26972 ) ) ( not ( = ?auto_26957 ?auto_26986 ) ) ( not ( = ?auto_26957 ?auto_27000 ) ) ( not ( = ?auto_26957 ?auto_26990 ) ) ( not ( = ?auto_26957 ?auto_26976 ) ) ( not ( = ?auto_26957 ?auto_26969 ) ) ( not ( = ?auto_26974 ?auto_26992 ) ) ( not ( = ?auto_26974 ?auto_26973 ) ) ( not ( = ?auto_26974 ?auto_26993 ) ) ( not ( = ?auto_26974 ?auto_26997 ) ) ( not ( = ?auto_26974 ?auto_26987 ) ) ( not ( = ?auto_26974 ?auto_26972 ) ) ( not ( = ?auto_26974 ?auto_26986 ) ) ( not ( = ?auto_26974 ?auto_27000 ) ) ( not ( = ?auto_26974 ?auto_26990 ) ) ( not ( = ?auto_26974 ?auto_26976 ) ) ( not ( = ?auto_26974 ?auto_26969 ) ) ( not ( = ?auto_26945 ?auto_26958 ) ) ( not ( = ?auto_26945 ?auto_26978 ) ) ( not ( = ?auto_26946 ?auto_26958 ) ) ( not ( = ?auto_26946 ?auto_26978 ) ) ( not ( = ?auto_26947 ?auto_26958 ) ) ( not ( = ?auto_26947 ?auto_26978 ) ) ( not ( = ?auto_26948 ?auto_26958 ) ) ( not ( = ?auto_26948 ?auto_26978 ) ) ( not ( = ?auto_26949 ?auto_26958 ) ) ( not ( = ?auto_26949 ?auto_26978 ) ) ( not ( = ?auto_26950 ?auto_26958 ) ) ( not ( = ?auto_26950 ?auto_26978 ) ) ( not ( = ?auto_26951 ?auto_26958 ) ) ( not ( = ?auto_26951 ?auto_26978 ) ) ( not ( = ?auto_26954 ?auto_26958 ) ) ( not ( = ?auto_26954 ?auto_26978 ) ) ( not ( = ?auto_26953 ?auto_26958 ) ) ( not ( = ?auto_26953 ?auto_26978 ) ) ( not ( = ?auto_26952 ?auto_26958 ) ) ( not ( = ?auto_26952 ?auto_26978 ) ) ( not ( = ?auto_26955 ?auto_26958 ) ) ( not ( = ?auto_26955 ?auto_26978 ) ) ( not ( = ?auto_26956 ?auto_26958 ) ) ( not ( = ?auto_26956 ?auto_26978 ) ) ( not ( = ?auto_26958 ?auto_26974 ) ) ( not ( = ?auto_26958 ?auto_26992 ) ) ( not ( = ?auto_26958 ?auto_26973 ) ) ( not ( = ?auto_26958 ?auto_26993 ) ) ( not ( = ?auto_26958 ?auto_26997 ) ) ( not ( = ?auto_26958 ?auto_26987 ) ) ( not ( = ?auto_26958 ?auto_26972 ) ) ( not ( = ?auto_26958 ?auto_26986 ) ) ( not ( = ?auto_26958 ?auto_27000 ) ) ( not ( = ?auto_26958 ?auto_26990 ) ) ( not ( = ?auto_26958 ?auto_26976 ) ) ( not ( = ?auto_26958 ?auto_26969 ) ) ( not ( = ?auto_26988 ?auto_26977 ) ) ( not ( = ?auto_26988 ?auto_26999 ) ) ( not ( = ?auto_26988 ?auto_26998 ) ) ( not ( = ?auto_26988 ?auto_26980 ) ) ( not ( = ?auto_26988 ?auto_26981 ) ) ( not ( = ?auto_26988 ?auto_26968 ) ) ( not ( = ?auto_26988 ?auto_26989 ) ) ( not ( = ?auto_26988 ?auto_26996 ) ) ( not ( = ?auto_26970 ?auto_26983 ) ) ( not ( = ?auto_26970 ?auto_26967 ) ) ( not ( = ?auto_26970 ?auto_26995 ) ) ( not ( = ?auto_26970 ?auto_26982 ) ) ( not ( = ?auto_26970 ?auto_26979 ) ) ( not ( = ?auto_26970 ?auto_26971 ) ) ( not ( = ?auto_26970 ?auto_26994 ) ) ( not ( = ?auto_26970 ?auto_26984 ) ) ( not ( = ?auto_26978 ?auto_26974 ) ) ( not ( = ?auto_26978 ?auto_26992 ) ) ( not ( = ?auto_26978 ?auto_26973 ) ) ( not ( = ?auto_26978 ?auto_26993 ) ) ( not ( = ?auto_26978 ?auto_26997 ) ) ( not ( = ?auto_26978 ?auto_26987 ) ) ( not ( = ?auto_26978 ?auto_26972 ) ) ( not ( = ?auto_26978 ?auto_26986 ) ) ( not ( = ?auto_26978 ?auto_27000 ) ) ( not ( = ?auto_26978 ?auto_26990 ) ) ( not ( = ?auto_26978 ?auto_26976 ) ) ( not ( = ?auto_26978 ?auto_26969 ) ) ( not ( = ?auto_26945 ?auto_26960 ) ) ( not ( = ?auto_26945 ?auto_26991 ) ) ( not ( = ?auto_26946 ?auto_26960 ) ) ( not ( = ?auto_26946 ?auto_26991 ) ) ( not ( = ?auto_26947 ?auto_26960 ) ) ( not ( = ?auto_26947 ?auto_26991 ) ) ( not ( = ?auto_26948 ?auto_26960 ) ) ( not ( = ?auto_26948 ?auto_26991 ) ) ( not ( = ?auto_26949 ?auto_26960 ) ) ( not ( = ?auto_26949 ?auto_26991 ) ) ( not ( = ?auto_26950 ?auto_26960 ) ) ( not ( = ?auto_26950 ?auto_26991 ) ) ( not ( = ?auto_26951 ?auto_26960 ) ) ( not ( = ?auto_26951 ?auto_26991 ) ) ( not ( = ?auto_26954 ?auto_26960 ) ) ( not ( = ?auto_26954 ?auto_26991 ) ) ( not ( = ?auto_26953 ?auto_26960 ) ) ( not ( = ?auto_26953 ?auto_26991 ) ) ( not ( = ?auto_26952 ?auto_26960 ) ) ( not ( = ?auto_26952 ?auto_26991 ) ) ( not ( = ?auto_26955 ?auto_26960 ) ) ( not ( = ?auto_26955 ?auto_26991 ) ) ( not ( = ?auto_26956 ?auto_26960 ) ) ( not ( = ?auto_26956 ?auto_26991 ) ) ( not ( = ?auto_26957 ?auto_26960 ) ) ( not ( = ?auto_26957 ?auto_26991 ) ) ( not ( = ?auto_26960 ?auto_26978 ) ) ( not ( = ?auto_26960 ?auto_26974 ) ) ( not ( = ?auto_26960 ?auto_26992 ) ) ( not ( = ?auto_26960 ?auto_26973 ) ) ( not ( = ?auto_26960 ?auto_26993 ) ) ( not ( = ?auto_26960 ?auto_26997 ) ) ( not ( = ?auto_26960 ?auto_26987 ) ) ( not ( = ?auto_26960 ?auto_26972 ) ) ( not ( = ?auto_26960 ?auto_26986 ) ) ( not ( = ?auto_26960 ?auto_27000 ) ) ( not ( = ?auto_26960 ?auto_26990 ) ) ( not ( = ?auto_26960 ?auto_26976 ) ) ( not ( = ?auto_26960 ?auto_26969 ) ) ( not ( = ?auto_26985 ?auto_26988 ) ) ( not ( = ?auto_26985 ?auto_26977 ) ) ( not ( = ?auto_26985 ?auto_26999 ) ) ( not ( = ?auto_26985 ?auto_26998 ) ) ( not ( = ?auto_26985 ?auto_26980 ) ) ( not ( = ?auto_26985 ?auto_26981 ) ) ( not ( = ?auto_26985 ?auto_26968 ) ) ( not ( = ?auto_26985 ?auto_26989 ) ) ( not ( = ?auto_26985 ?auto_26996 ) ) ( not ( = ?auto_26975 ?auto_26970 ) ) ( not ( = ?auto_26975 ?auto_26983 ) ) ( not ( = ?auto_26975 ?auto_26967 ) ) ( not ( = ?auto_26975 ?auto_26995 ) ) ( not ( = ?auto_26975 ?auto_26982 ) ) ( not ( = ?auto_26975 ?auto_26979 ) ) ( not ( = ?auto_26975 ?auto_26971 ) ) ( not ( = ?auto_26975 ?auto_26994 ) ) ( not ( = ?auto_26975 ?auto_26984 ) ) ( not ( = ?auto_26991 ?auto_26978 ) ) ( not ( = ?auto_26991 ?auto_26974 ) ) ( not ( = ?auto_26991 ?auto_26992 ) ) ( not ( = ?auto_26991 ?auto_26973 ) ) ( not ( = ?auto_26991 ?auto_26993 ) ) ( not ( = ?auto_26991 ?auto_26997 ) ) ( not ( = ?auto_26991 ?auto_26987 ) ) ( not ( = ?auto_26991 ?auto_26972 ) ) ( not ( = ?auto_26991 ?auto_26986 ) ) ( not ( = ?auto_26991 ?auto_27000 ) ) ( not ( = ?auto_26991 ?auto_26990 ) ) ( not ( = ?auto_26991 ?auto_26976 ) ) ( not ( = ?auto_26991 ?auto_26969 ) ) ( not ( = ?auto_26945 ?auto_26959 ) ) ( not ( = ?auto_26945 ?auto_26963 ) ) ( not ( = ?auto_26946 ?auto_26959 ) ) ( not ( = ?auto_26946 ?auto_26963 ) ) ( not ( = ?auto_26947 ?auto_26959 ) ) ( not ( = ?auto_26947 ?auto_26963 ) ) ( not ( = ?auto_26948 ?auto_26959 ) ) ( not ( = ?auto_26948 ?auto_26963 ) ) ( not ( = ?auto_26949 ?auto_26959 ) ) ( not ( = ?auto_26949 ?auto_26963 ) ) ( not ( = ?auto_26950 ?auto_26959 ) ) ( not ( = ?auto_26950 ?auto_26963 ) ) ( not ( = ?auto_26951 ?auto_26959 ) ) ( not ( = ?auto_26951 ?auto_26963 ) ) ( not ( = ?auto_26954 ?auto_26959 ) ) ( not ( = ?auto_26954 ?auto_26963 ) ) ( not ( = ?auto_26953 ?auto_26959 ) ) ( not ( = ?auto_26953 ?auto_26963 ) ) ( not ( = ?auto_26952 ?auto_26959 ) ) ( not ( = ?auto_26952 ?auto_26963 ) ) ( not ( = ?auto_26955 ?auto_26959 ) ) ( not ( = ?auto_26955 ?auto_26963 ) ) ( not ( = ?auto_26956 ?auto_26959 ) ) ( not ( = ?auto_26956 ?auto_26963 ) ) ( not ( = ?auto_26957 ?auto_26959 ) ) ( not ( = ?auto_26957 ?auto_26963 ) ) ( not ( = ?auto_26958 ?auto_26959 ) ) ( not ( = ?auto_26958 ?auto_26963 ) ) ( not ( = ?auto_26959 ?auto_26991 ) ) ( not ( = ?auto_26959 ?auto_26978 ) ) ( not ( = ?auto_26959 ?auto_26974 ) ) ( not ( = ?auto_26959 ?auto_26992 ) ) ( not ( = ?auto_26959 ?auto_26973 ) ) ( not ( = ?auto_26959 ?auto_26993 ) ) ( not ( = ?auto_26959 ?auto_26997 ) ) ( not ( = ?auto_26959 ?auto_26987 ) ) ( not ( = ?auto_26959 ?auto_26972 ) ) ( not ( = ?auto_26959 ?auto_26986 ) ) ( not ( = ?auto_26959 ?auto_27000 ) ) ( not ( = ?auto_26959 ?auto_26990 ) ) ( not ( = ?auto_26959 ?auto_26976 ) ) ( not ( = ?auto_26959 ?auto_26969 ) ) ( not ( = ?auto_26962 ?auto_26985 ) ) ( not ( = ?auto_26962 ?auto_26988 ) ) ( not ( = ?auto_26962 ?auto_26977 ) ) ( not ( = ?auto_26962 ?auto_26999 ) ) ( not ( = ?auto_26962 ?auto_26998 ) ) ( not ( = ?auto_26962 ?auto_26980 ) ) ( not ( = ?auto_26962 ?auto_26981 ) ) ( not ( = ?auto_26962 ?auto_26968 ) ) ( not ( = ?auto_26962 ?auto_26989 ) ) ( not ( = ?auto_26962 ?auto_26996 ) ) ( not ( = ?auto_26965 ?auto_26975 ) ) ( not ( = ?auto_26965 ?auto_26970 ) ) ( not ( = ?auto_26965 ?auto_26983 ) ) ( not ( = ?auto_26965 ?auto_26967 ) ) ( not ( = ?auto_26965 ?auto_26995 ) ) ( not ( = ?auto_26965 ?auto_26982 ) ) ( not ( = ?auto_26965 ?auto_26979 ) ) ( not ( = ?auto_26965 ?auto_26971 ) ) ( not ( = ?auto_26965 ?auto_26994 ) ) ( not ( = ?auto_26965 ?auto_26984 ) ) ( not ( = ?auto_26963 ?auto_26991 ) ) ( not ( = ?auto_26963 ?auto_26978 ) ) ( not ( = ?auto_26963 ?auto_26974 ) ) ( not ( = ?auto_26963 ?auto_26992 ) ) ( not ( = ?auto_26963 ?auto_26973 ) ) ( not ( = ?auto_26963 ?auto_26993 ) ) ( not ( = ?auto_26963 ?auto_26997 ) ) ( not ( = ?auto_26963 ?auto_26987 ) ) ( not ( = ?auto_26963 ?auto_26972 ) ) ( not ( = ?auto_26963 ?auto_26986 ) ) ( not ( = ?auto_26963 ?auto_27000 ) ) ( not ( = ?auto_26963 ?auto_26990 ) ) ( not ( = ?auto_26963 ?auto_26976 ) ) ( not ( = ?auto_26963 ?auto_26969 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_26945 ?auto_26946 ?auto_26947 ?auto_26948 ?auto_26949 ?auto_26950 ?auto_26951 ?auto_26954 ?auto_26953 ?auto_26952 ?auto_26955 ?auto_26956 ?auto_26957 ?auto_26958 ?auto_26960 )
      ( MAKE-1CRATE ?auto_26960 ?auto_26959 )
      ( MAKE-15CRATE-VERIFY ?auto_26945 ?auto_26946 ?auto_26947 ?auto_26948 ?auto_26949 ?auto_26950 ?auto_26951 ?auto_26954 ?auto_26953 ?auto_26952 ?auto_26955 ?auto_26956 ?auto_26957 ?auto_26958 ?auto_26960 ?auto_26959 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27003 - SURFACE
      ?auto_27004 - SURFACE
    )
    :vars
    (
      ?auto_27005 - HOIST
      ?auto_27006 - PLACE
      ?auto_27008 - PLACE
      ?auto_27009 - HOIST
      ?auto_27010 - SURFACE
      ?auto_27007 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27005 ?auto_27006 ) ( SURFACE-AT ?auto_27003 ?auto_27006 ) ( CLEAR ?auto_27003 ) ( IS-CRATE ?auto_27004 ) ( AVAILABLE ?auto_27005 ) ( not ( = ?auto_27008 ?auto_27006 ) ) ( HOIST-AT ?auto_27009 ?auto_27008 ) ( AVAILABLE ?auto_27009 ) ( SURFACE-AT ?auto_27004 ?auto_27008 ) ( ON ?auto_27004 ?auto_27010 ) ( CLEAR ?auto_27004 ) ( TRUCK-AT ?auto_27007 ?auto_27006 ) ( not ( = ?auto_27003 ?auto_27004 ) ) ( not ( = ?auto_27003 ?auto_27010 ) ) ( not ( = ?auto_27004 ?auto_27010 ) ) ( not ( = ?auto_27005 ?auto_27009 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27007 ?auto_27006 ?auto_27008 )
      ( !LIFT ?auto_27009 ?auto_27004 ?auto_27010 ?auto_27008 )
      ( !LOAD ?auto_27009 ?auto_27004 ?auto_27007 ?auto_27008 )
      ( !DRIVE ?auto_27007 ?auto_27008 ?auto_27006 )
      ( !UNLOAD ?auto_27005 ?auto_27004 ?auto_27007 ?auto_27006 )
      ( !DROP ?auto_27005 ?auto_27004 ?auto_27003 ?auto_27006 )
      ( MAKE-1CRATE-VERIFY ?auto_27003 ?auto_27004 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_27028 - SURFACE
      ?auto_27029 - SURFACE
      ?auto_27030 - SURFACE
      ?auto_27031 - SURFACE
      ?auto_27032 - SURFACE
      ?auto_27033 - SURFACE
      ?auto_27034 - SURFACE
      ?auto_27037 - SURFACE
      ?auto_27036 - SURFACE
      ?auto_27035 - SURFACE
      ?auto_27038 - SURFACE
      ?auto_27039 - SURFACE
      ?auto_27040 - SURFACE
      ?auto_27041 - SURFACE
      ?auto_27043 - SURFACE
      ?auto_27042 - SURFACE
      ?auto_27044 - SURFACE
    )
    :vars
    (
      ?auto_27047 - HOIST
      ?auto_27046 - PLACE
      ?auto_27048 - PLACE
      ?auto_27049 - HOIST
      ?auto_27050 - SURFACE
      ?auto_27070 - PLACE
      ?auto_27079 - HOIST
      ?auto_27065 - SURFACE
      ?auto_27059 - PLACE
      ?auto_27053 - HOIST
      ?auto_27084 - SURFACE
      ?auto_27066 - PLACE
      ?auto_27061 - HOIST
      ?auto_27074 - SURFACE
      ?auto_27078 - PLACE
      ?auto_27052 - HOIST
      ?auto_27055 - SURFACE
      ?auto_27064 - PLACE
      ?auto_27076 - HOIST
      ?auto_27060 - SURFACE
      ?auto_27081 - PLACE
      ?auto_27057 - HOIST
      ?auto_27071 - SURFACE
      ?auto_27075 - SURFACE
      ?auto_27082 - PLACE
      ?auto_27073 - HOIST
      ?auto_27067 - SURFACE
      ?auto_27085 - PLACE
      ?auto_27072 - HOIST
      ?auto_27068 - SURFACE
      ?auto_27054 - PLACE
      ?auto_27051 - HOIST
      ?auto_27077 - SURFACE
      ?auto_27087 - PLACE
      ?auto_27080 - HOIST
      ?auto_27056 - SURFACE
      ?auto_27069 - PLACE
      ?auto_27058 - HOIST
      ?auto_27086 - SURFACE
      ?auto_27062 - SURFACE
      ?auto_27063 - SURFACE
      ?auto_27083 - SURFACE
      ?auto_27045 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27047 ?auto_27046 ) ( IS-CRATE ?auto_27044 ) ( not ( = ?auto_27048 ?auto_27046 ) ) ( HOIST-AT ?auto_27049 ?auto_27048 ) ( AVAILABLE ?auto_27049 ) ( SURFACE-AT ?auto_27044 ?auto_27048 ) ( ON ?auto_27044 ?auto_27050 ) ( CLEAR ?auto_27044 ) ( not ( = ?auto_27042 ?auto_27044 ) ) ( not ( = ?auto_27042 ?auto_27050 ) ) ( not ( = ?auto_27044 ?auto_27050 ) ) ( not ( = ?auto_27047 ?auto_27049 ) ) ( IS-CRATE ?auto_27042 ) ( not ( = ?auto_27070 ?auto_27046 ) ) ( HOIST-AT ?auto_27079 ?auto_27070 ) ( AVAILABLE ?auto_27079 ) ( SURFACE-AT ?auto_27042 ?auto_27070 ) ( ON ?auto_27042 ?auto_27065 ) ( CLEAR ?auto_27042 ) ( not ( = ?auto_27043 ?auto_27042 ) ) ( not ( = ?auto_27043 ?auto_27065 ) ) ( not ( = ?auto_27042 ?auto_27065 ) ) ( not ( = ?auto_27047 ?auto_27079 ) ) ( IS-CRATE ?auto_27043 ) ( not ( = ?auto_27059 ?auto_27046 ) ) ( HOIST-AT ?auto_27053 ?auto_27059 ) ( AVAILABLE ?auto_27053 ) ( SURFACE-AT ?auto_27043 ?auto_27059 ) ( ON ?auto_27043 ?auto_27084 ) ( CLEAR ?auto_27043 ) ( not ( = ?auto_27041 ?auto_27043 ) ) ( not ( = ?auto_27041 ?auto_27084 ) ) ( not ( = ?auto_27043 ?auto_27084 ) ) ( not ( = ?auto_27047 ?auto_27053 ) ) ( IS-CRATE ?auto_27041 ) ( not ( = ?auto_27066 ?auto_27046 ) ) ( HOIST-AT ?auto_27061 ?auto_27066 ) ( AVAILABLE ?auto_27061 ) ( SURFACE-AT ?auto_27041 ?auto_27066 ) ( ON ?auto_27041 ?auto_27074 ) ( CLEAR ?auto_27041 ) ( not ( = ?auto_27040 ?auto_27041 ) ) ( not ( = ?auto_27040 ?auto_27074 ) ) ( not ( = ?auto_27041 ?auto_27074 ) ) ( not ( = ?auto_27047 ?auto_27061 ) ) ( IS-CRATE ?auto_27040 ) ( not ( = ?auto_27078 ?auto_27046 ) ) ( HOIST-AT ?auto_27052 ?auto_27078 ) ( SURFACE-AT ?auto_27040 ?auto_27078 ) ( ON ?auto_27040 ?auto_27055 ) ( CLEAR ?auto_27040 ) ( not ( = ?auto_27039 ?auto_27040 ) ) ( not ( = ?auto_27039 ?auto_27055 ) ) ( not ( = ?auto_27040 ?auto_27055 ) ) ( not ( = ?auto_27047 ?auto_27052 ) ) ( IS-CRATE ?auto_27039 ) ( not ( = ?auto_27064 ?auto_27046 ) ) ( HOIST-AT ?auto_27076 ?auto_27064 ) ( AVAILABLE ?auto_27076 ) ( SURFACE-AT ?auto_27039 ?auto_27064 ) ( ON ?auto_27039 ?auto_27060 ) ( CLEAR ?auto_27039 ) ( not ( = ?auto_27038 ?auto_27039 ) ) ( not ( = ?auto_27038 ?auto_27060 ) ) ( not ( = ?auto_27039 ?auto_27060 ) ) ( not ( = ?auto_27047 ?auto_27076 ) ) ( IS-CRATE ?auto_27038 ) ( not ( = ?auto_27081 ?auto_27046 ) ) ( HOIST-AT ?auto_27057 ?auto_27081 ) ( SURFACE-AT ?auto_27038 ?auto_27081 ) ( ON ?auto_27038 ?auto_27071 ) ( CLEAR ?auto_27038 ) ( not ( = ?auto_27035 ?auto_27038 ) ) ( not ( = ?auto_27035 ?auto_27071 ) ) ( not ( = ?auto_27038 ?auto_27071 ) ) ( not ( = ?auto_27047 ?auto_27057 ) ) ( IS-CRATE ?auto_27035 ) ( SURFACE-AT ?auto_27035 ?auto_27078 ) ( ON ?auto_27035 ?auto_27075 ) ( CLEAR ?auto_27035 ) ( not ( = ?auto_27036 ?auto_27035 ) ) ( not ( = ?auto_27036 ?auto_27075 ) ) ( not ( = ?auto_27035 ?auto_27075 ) ) ( IS-CRATE ?auto_27036 ) ( not ( = ?auto_27082 ?auto_27046 ) ) ( HOIST-AT ?auto_27073 ?auto_27082 ) ( AVAILABLE ?auto_27073 ) ( SURFACE-AT ?auto_27036 ?auto_27082 ) ( ON ?auto_27036 ?auto_27067 ) ( CLEAR ?auto_27036 ) ( not ( = ?auto_27037 ?auto_27036 ) ) ( not ( = ?auto_27037 ?auto_27067 ) ) ( not ( = ?auto_27036 ?auto_27067 ) ) ( not ( = ?auto_27047 ?auto_27073 ) ) ( IS-CRATE ?auto_27037 ) ( not ( = ?auto_27085 ?auto_27046 ) ) ( HOIST-AT ?auto_27072 ?auto_27085 ) ( AVAILABLE ?auto_27072 ) ( SURFACE-AT ?auto_27037 ?auto_27085 ) ( ON ?auto_27037 ?auto_27068 ) ( CLEAR ?auto_27037 ) ( not ( = ?auto_27034 ?auto_27037 ) ) ( not ( = ?auto_27034 ?auto_27068 ) ) ( not ( = ?auto_27037 ?auto_27068 ) ) ( not ( = ?auto_27047 ?auto_27072 ) ) ( IS-CRATE ?auto_27034 ) ( not ( = ?auto_27054 ?auto_27046 ) ) ( HOIST-AT ?auto_27051 ?auto_27054 ) ( AVAILABLE ?auto_27051 ) ( SURFACE-AT ?auto_27034 ?auto_27054 ) ( ON ?auto_27034 ?auto_27077 ) ( CLEAR ?auto_27034 ) ( not ( = ?auto_27033 ?auto_27034 ) ) ( not ( = ?auto_27033 ?auto_27077 ) ) ( not ( = ?auto_27034 ?auto_27077 ) ) ( not ( = ?auto_27047 ?auto_27051 ) ) ( IS-CRATE ?auto_27033 ) ( not ( = ?auto_27087 ?auto_27046 ) ) ( HOIST-AT ?auto_27080 ?auto_27087 ) ( AVAILABLE ?auto_27080 ) ( SURFACE-AT ?auto_27033 ?auto_27087 ) ( ON ?auto_27033 ?auto_27056 ) ( CLEAR ?auto_27033 ) ( not ( = ?auto_27032 ?auto_27033 ) ) ( not ( = ?auto_27032 ?auto_27056 ) ) ( not ( = ?auto_27033 ?auto_27056 ) ) ( not ( = ?auto_27047 ?auto_27080 ) ) ( IS-CRATE ?auto_27032 ) ( not ( = ?auto_27069 ?auto_27046 ) ) ( HOIST-AT ?auto_27058 ?auto_27069 ) ( SURFACE-AT ?auto_27032 ?auto_27069 ) ( ON ?auto_27032 ?auto_27086 ) ( CLEAR ?auto_27032 ) ( not ( = ?auto_27031 ?auto_27032 ) ) ( not ( = ?auto_27031 ?auto_27086 ) ) ( not ( = ?auto_27032 ?auto_27086 ) ) ( not ( = ?auto_27047 ?auto_27058 ) ) ( IS-CRATE ?auto_27031 ) ( AVAILABLE ?auto_27057 ) ( SURFACE-AT ?auto_27031 ?auto_27081 ) ( ON ?auto_27031 ?auto_27062 ) ( CLEAR ?auto_27031 ) ( not ( = ?auto_27030 ?auto_27031 ) ) ( not ( = ?auto_27030 ?auto_27062 ) ) ( not ( = ?auto_27031 ?auto_27062 ) ) ( IS-CRATE ?auto_27030 ) ( AVAILABLE ?auto_27058 ) ( SURFACE-AT ?auto_27030 ?auto_27069 ) ( ON ?auto_27030 ?auto_27063 ) ( CLEAR ?auto_27030 ) ( not ( = ?auto_27029 ?auto_27030 ) ) ( not ( = ?auto_27029 ?auto_27063 ) ) ( not ( = ?auto_27030 ?auto_27063 ) ) ( SURFACE-AT ?auto_27028 ?auto_27046 ) ( CLEAR ?auto_27028 ) ( IS-CRATE ?auto_27029 ) ( AVAILABLE ?auto_27047 ) ( AVAILABLE ?auto_27052 ) ( SURFACE-AT ?auto_27029 ?auto_27078 ) ( ON ?auto_27029 ?auto_27083 ) ( CLEAR ?auto_27029 ) ( TRUCK-AT ?auto_27045 ?auto_27046 ) ( not ( = ?auto_27028 ?auto_27029 ) ) ( not ( = ?auto_27028 ?auto_27083 ) ) ( not ( = ?auto_27029 ?auto_27083 ) ) ( not ( = ?auto_27028 ?auto_27030 ) ) ( not ( = ?auto_27028 ?auto_27063 ) ) ( not ( = ?auto_27030 ?auto_27083 ) ) ( not ( = ?auto_27069 ?auto_27078 ) ) ( not ( = ?auto_27058 ?auto_27052 ) ) ( not ( = ?auto_27063 ?auto_27083 ) ) ( not ( = ?auto_27028 ?auto_27031 ) ) ( not ( = ?auto_27028 ?auto_27062 ) ) ( not ( = ?auto_27029 ?auto_27031 ) ) ( not ( = ?auto_27029 ?auto_27062 ) ) ( not ( = ?auto_27031 ?auto_27063 ) ) ( not ( = ?auto_27031 ?auto_27083 ) ) ( not ( = ?auto_27081 ?auto_27069 ) ) ( not ( = ?auto_27081 ?auto_27078 ) ) ( not ( = ?auto_27057 ?auto_27058 ) ) ( not ( = ?auto_27057 ?auto_27052 ) ) ( not ( = ?auto_27062 ?auto_27063 ) ) ( not ( = ?auto_27062 ?auto_27083 ) ) ( not ( = ?auto_27028 ?auto_27032 ) ) ( not ( = ?auto_27028 ?auto_27086 ) ) ( not ( = ?auto_27029 ?auto_27032 ) ) ( not ( = ?auto_27029 ?auto_27086 ) ) ( not ( = ?auto_27030 ?auto_27032 ) ) ( not ( = ?auto_27030 ?auto_27086 ) ) ( not ( = ?auto_27032 ?auto_27062 ) ) ( not ( = ?auto_27032 ?auto_27063 ) ) ( not ( = ?auto_27032 ?auto_27083 ) ) ( not ( = ?auto_27086 ?auto_27062 ) ) ( not ( = ?auto_27086 ?auto_27063 ) ) ( not ( = ?auto_27086 ?auto_27083 ) ) ( not ( = ?auto_27028 ?auto_27033 ) ) ( not ( = ?auto_27028 ?auto_27056 ) ) ( not ( = ?auto_27029 ?auto_27033 ) ) ( not ( = ?auto_27029 ?auto_27056 ) ) ( not ( = ?auto_27030 ?auto_27033 ) ) ( not ( = ?auto_27030 ?auto_27056 ) ) ( not ( = ?auto_27031 ?auto_27033 ) ) ( not ( = ?auto_27031 ?auto_27056 ) ) ( not ( = ?auto_27033 ?auto_27086 ) ) ( not ( = ?auto_27033 ?auto_27062 ) ) ( not ( = ?auto_27033 ?auto_27063 ) ) ( not ( = ?auto_27033 ?auto_27083 ) ) ( not ( = ?auto_27087 ?auto_27069 ) ) ( not ( = ?auto_27087 ?auto_27081 ) ) ( not ( = ?auto_27087 ?auto_27078 ) ) ( not ( = ?auto_27080 ?auto_27058 ) ) ( not ( = ?auto_27080 ?auto_27057 ) ) ( not ( = ?auto_27080 ?auto_27052 ) ) ( not ( = ?auto_27056 ?auto_27086 ) ) ( not ( = ?auto_27056 ?auto_27062 ) ) ( not ( = ?auto_27056 ?auto_27063 ) ) ( not ( = ?auto_27056 ?auto_27083 ) ) ( not ( = ?auto_27028 ?auto_27034 ) ) ( not ( = ?auto_27028 ?auto_27077 ) ) ( not ( = ?auto_27029 ?auto_27034 ) ) ( not ( = ?auto_27029 ?auto_27077 ) ) ( not ( = ?auto_27030 ?auto_27034 ) ) ( not ( = ?auto_27030 ?auto_27077 ) ) ( not ( = ?auto_27031 ?auto_27034 ) ) ( not ( = ?auto_27031 ?auto_27077 ) ) ( not ( = ?auto_27032 ?auto_27034 ) ) ( not ( = ?auto_27032 ?auto_27077 ) ) ( not ( = ?auto_27034 ?auto_27056 ) ) ( not ( = ?auto_27034 ?auto_27086 ) ) ( not ( = ?auto_27034 ?auto_27062 ) ) ( not ( = ?auto_27034 ?auto_27063 ) ) ( not ( = ?auto_27034 ?auto_27083 ) ) ( not ( = ?auto_27054 ?auto_27087 ) ) ( not ( = ?auto_27054 ?auto_27069 ) ) ( not ( = ?auto_27054 ?auto_27081 ) ) ( not ( = ?auto_27054 ?auto_27078 ) ) ( not ( = ?auto_27051 ?auto_27080 ) ) ( not ( = ?auto_27051 ?auto_27058 ) ) ( not ( = ?auto_27051 ?auto_27057 ) ) ( not ( = ?auto_27051 ?auto_27052 ) ) ( not ( = ?auto_27077 ?auto_27056 ) ) ( not ( = ?auto_27077 ?auto_27086 ) ) ( not ( = ?auto_27077 ?auto_27062 ) ) ( not ( = ?auto_27077 ?auto_27063 ) ) ( not ( = ?auto_27077 ?auto_27083 ) ) ( not ( = ?auto_27028 ?auto_27037 ) ) ( not ( = ?auto_27028 ?auto_27068 ) ) ( not ( = ?auto_27029 ?auto_27037 ) ) ( not ( = ?auto_27029 ?auto_27068 ) ) ( not ( = ?auto_27030 ?auto_27037 ) ) ( not ( = ?auto_27030 ?auto_27068 ) ) ( not ( = ?auto_27031 ?auto_27037 ) ) ( not ( = ?auto_27031 ?auto_27068 ) ) ( not ( = ?auto_27032 ?auto_27037 ) ) ( not ( = ?auto_27032 ?auto_27068 ) ) ( not ( = ?auto_27033 ?auto_27037 ) ) ( not ( = ?auto_27033 ?auto_27068 ) ) ( not ( = ?auto_27037 ?auto_27077 ) ) ( not ( = ?auto_27037 ?auto_27056 ) ) ( not ( = ?auto_27037 ?auto_27086 ) ) ( not ( = ?auto_27037 ?auto_27062 ) ) ( not ( = ?auto_27037 ?auto_27063 ) ) ( not ( = ?auto_27037 ?auto_27083 ) ) ( not ( = ?auto_27085 ?auto_27054 ) ) ( not ( = ?auto_27085 ?auto_27087 ) ) ( not ( = ?auto_27085 ?auto_27069 ) ) ( not ( = ?auto_27085 ?auto_27081 ) ) ( not ( = ?auto_27085 ?auto_27078 ) ) ( not ( = ?auto_27072 ?auto_27051 ) ) ( not ( = ?auto_27072 ?auto_27080 ) ) ( not ( = ?auto_27072 ?auto_27058 ) ) ( not ( = ?auto_27072 ?auto_27057 ) ) ( not ( = ?auto_27072 ?auto_27052 ) ) ( not ( = ?auto_27068 ?auto_27077 ) ) ( not ( = ?auto_27068 ?auto_27056 ) ) ( not ( = ?auto_27068 ?auto_27086 ) ) ( not ( = ?auto_27068 ?auto_27062 ) ) ( not ( = ?auto_27068 ?auto_27063 ) ) ( not ( = ?auto_27068 ?auto_27083 ) ) ( not ( = ?auto_27028 ?auto_27036 ) ) ( not ( = ?auto_27028 ?auto_27067 ) ) ( not ( = ?auto_27029 ?auto_27036 ) ) ( not ( = ?auto_27029 ?auto_27067 ) ) ( not ( = ?auto_27030 ?auto_27036 ) ) ( not ( = ?auto_27030 ?auto_27067 ) ) ( not ( = ?auto_27031 ?auto_27036 ) ) ( not ( = ?auto_27031 ?auto_27067 ) ) ( not ( = ?auto_27032 ?auto_27036 ) ) ( not ( = ?auto_27032 ?auto_27067 ) ) ( not ( = ?auto_27033 ?auto_27036 ) ) ( not ( = ?auto_27033 ?auto_27067 ) ) ( not ( = ?auto_27034 ?auto_27036 ) ) ( not ( = ?auto_27034 ?auto_27067 ) ) ( not ( = ?auto_27036 ?auto_27068 ) ) ( not ( = ?auto_27036 ?auto_27077 ) ) ( not ( = ?auto_27036 ?auto_27056 ) ) ( not ( = ?auto_27036 ?auto_27086 ) ) ( not ( = ?auto_27036 ?auto_27062 ) ) ( not ( = ?auto_27036 ?auto_27063 ) ) ( not ( = ?auto_27036 ?auto_27083 ) ) ( not ( = ?auto_27082 ?auto_27085 ) ) ( not ( = ?auto_27082 ?auto_27054 ) ) ( not ( = ?auto_27082 ?auto_27087 ) ) ( not ( = ?auto_27082 ?auto_27069 ) ) ( not ( = ?auto_27082 ?auto_27081 ) ) ( not ( = ?auto_27082 ?auto_27078 ) ) ( not ( = ?auto_27073 ?auto_27072 ) ) ( not ( = ?auto_27073 ?auto_27051 ) ) ( not ( = ?auto_27073 ?auto_27080 ) ) ( not ( = ?auto_27073 ?auto_27058 ) ) ( not ( = ?auto_27073 ?auto_27057 ) ) ( not ( = ?auto_27073 ?auto_27052 ) ) ( not ( = ?auto_27067 ?auto_27068 ) ) ( not ( = ?auto_27067 ?auto_27077 ) ) ( not ( = ?auto_27067 ?auto_27056 ) ) ( not ( = ?auto_27067 ?auto_27086 ) ) ( not ( = ?auto_27067 ?auto_27062 ) ) ( not ( = ?auto_27067 ?auto_27063 ) ) ( not ( = ?auto_27067 ?auto_27083 ) ) ( not ( = ?auto_27028 ?auto_27035 ) ) ( not ( = ?auto_27028 ?auto_27075 ) ) ( not ( = ?auto_27029 ?auto_27035 ) ) ( not ( = ?auto_27029 ?auto_27075 ) ) ( not ( = ?auto_27030 ?auto_27035 ) ) ( not ( = ?auto_27030 ?auto_27075 ) ) ( not ( = ?auto_27031 ?auto_27035 ) ) ( not ( = ?auto_27031 ?auto_27075 ) ) ( not ( = ?auto_27032 ?auto_27035 ) ) ( not ( = ?auto_27032 ?auto_27075 ) ) ( not ( = ?auto_27033 ?auto_27035 ) ) ( not ( = ?auto_27033 ?auto_27075 ) ) ( not ( = ?auto_27034 ?auto_27035 ) ) ( not ( = ?auto_27034 ?auto_27075 ) ) ( not ( = ?auto_27037 ?auto_27035 ) ) ( not ( = ?auto_27037 ?auto_27075 ) ) ( not ( = ?auto_27035 ?auto_27067 ) ) ( not ( = ?auto_27035 ?auto_27068 ) ) ( not ( = ?auto_27035 ?auto_27077 ) ) ( not ( = ?auto_27035 ?auto_27056 ) ) ( not ( = ?auto_27035 ?auto_27086 ) ) ( not ( = ?auto_27035 ?auto_27062 ) ) ( not ( = ?auto_27035 ?auto_27063 ) ) ( not ( = ?auto_27035 ?auto_27083 ) ) ( not ( = ?auto_27075 ?auto_27067 ) ) ( not ( = ?auto_27075 ?auto_27068 ) ) ( not ( = ?auto_27075 ?auto_27077 ) ) ( not ( = ?auto_27075 ?auto_27056 ) ) ( not ( = ?auto_27075 ?auto_27086 ) ) ( not ( = ?auto_27075 ?auto_27062 ) ) ( not ( = ?auto_27075 ?auto_27063 ) ) ( not ( = ?auto_27075 ?auto_27083 ) ) ( not ( = ?auto_27028 ?auto_27038 ) ) ( not ( = ?auto_27028 ?auto_27071 ) ) ( not ( = ?auto_27029 ?auto_27038 ) ) ( not ( = ?auto_27029 ?auto_27071 ) ) ( not ( = ?auto_27030 ?auto_27038 ) ) ( not ( = ?auto_27030 ?auto_27071 ) ) ( not ( = ?auto_27031 ?auto_27038 ) ) ( not ( = ?auto_27031 ?auto_27071 ) ) ( not ( = ?auto_27032 ?auto_27038 ) ) ( not ( = ?auto_27032 ?auto_27071 ) ) ( not ( = ?auto_27033 ?auto_27038 ) ) ( not ( = ?auto_27033 ?auto_27071 ) ) ( not ( = ?auto_27034 ?auto_27038 ) ) ( not ( = ?auto_27034 ?auto_27071 ) ) ( not ( = ?auto_27037 ?auto_27038 ) ) ( not ( = ?auto_27037 ?auto_27071 ) ) ( not ( = ?auto_27036 ?auto_27038 ) ) ( not ( = ?auto_27036 ?auto_27071 ) ) ( not ( = ?auto_27038 ?auto_27075 ) ) ( not ( = ?auto_27038 ?auto_27067 ) ) ( not ( = ?auto_27038 ?auto_27068 ) ) ( not ( = ?auto_27038 ?auto_27077 ) ) ( not ( = ?auto_27038 ?auto_27056 ) ) ( not ( = ?auto_27038 ?auto_27086 ) ) ( not ( = ?auto_27038 ?auto_27062 ) ) ( not ( = ?auto_27038 ?auto_27063 ) ) ( not ( = ?auto_27038 ?auto_27083 ) ) ( not ( = ?auto_27071 ?auto_27075 ) ) ( not ( = ?auto_27071 ?auto_27067 ) ) ( not ( = ?auto_27071 ?auto_27068 ) ) ( not ( = ?auto_27071 ?auto_27077 ) ) ( not ( = ?auto_27071 ?auto_27056 ) ) ( not ( = ?auto_27071 ?auto_27086 ) ) ( not ( = ?auto_27071 ?auto_27062 ) ) ( not ( = ?auto_27071 ?auto_27063 ) ) ( not ( = ?auto_27071 ?auto_27083 ) ) ( not ( = ?auto_27028 ?auto_27039 ) ) ( not ( = ?auto_27028 ?auto_27060 ) ) ( not ( = ?auto_27029 ?auto_27039 ) ) ( not ( = ?auto_27029 ?auto_27060 ) ) ( not ( = ?auto_27030 ?auto_27039 ) ) ( not ( = ?auto_27030 ?auto_27060 ) ) ( not ( = ?auto_27031 ?auto_27039 ) ) ( not ( = ?auto_27031 ?auto_27060 ) ) ( not ( = ?auto_27032 ?auto_27039 ) ) ( not ( = ?auto_27032 ?auto_27060 ) ) ( not ( = ?auto_27033 ?auto_27039 ) ) ( not ( = ?auto_27033 ?auto_27060 ) ) ( not ( = ?auto_27034 ?auto_27039 ) ) ( not ( = ?auto_27034 ?auto_27060 ) ) ( not ( = ?auto_27037 ?auto_27039 ) ) ( not ( = ?auto_27037 ?auto_27060 ) ) ( not ( = ?auto_27036 ?auto_27039 ) ) ( not ( = ?auto_27036 ?auto_27060 ) ) ( not ( = ?auto_27035 ?auto_27039 ) ) ( not ( = ?auto_27035 ?auto_27060 ) ) ( not ( = ?auto_27039 ?auto_27071 ) ) ( not ( = ?auto_27039 ?auto_27075 ) ) ( not ( = ?auto_27039 ?auto_27067 ) ) ( not ( = ?auto_27039 ?auto_27068 ) ) ( not ( = ?auto_27039 ?auto_27077 ) ) ( not ( = ?auto_27039 ?auto_27056 ) ) ( not ( = ?auto_27039 ?auto_27086 ) ) ( not ( = ?auto_27039 ?auto_27062 ) ) ( not ( = ?auto_27039 ?auto_27063 ) ) ( not ( = ?auto_27039 ?auto_27083 ) ) ( not ( = ?auto_27064 ?auto_27081 ) ) ( not ( = ?auto_27064 ?auto_27078 ) ) ( not ( = ?auto_27064 ?auto_27082 ) ) ( not ( = ?auto_27064 ?auto_27085 ) ) ( not ( = ?auto_27064 ?auto_27054 ) ) ( not ( = ?auto_27064 ?auto_27087 ) ) ( not ( = ?auto_27064 ?auto_27069 ) ) ( not ( = ?auto_27076 ?auto_27057 ) ) ( not ( = ?auto_27076 ?auto_27052 ) ) ( not ( = ?auto_27076 ?auto_27073 ) ) ( not ( = ?auto_27076 ?auto_27072 ) ) ( not ( = ?auto_27076 ?auto_27051 ) ) ( not ( = ?auto_27076 ?auto_27080 ) ) ( not ( = ?auto_27076 ?auto_27058 ) ) ( not ( = ?auto_27060 ?auto_27071 ) ) ( not ( = ?auto_27060 ?auto_27075 ) ) ( not ( = ?auto_27060 ?auto_27067 ) ) ( not ( = ?auto_27060 ?auto_27068 ) ) ( not ( = ?auto_27060 ?auto_27077 ) ) ( not ( = ?auto_27060 ?auto_27056 ) ) ( not ( = ?auto_27060 ?auto_27086 ) ) ( not ( = ?auto_27060 ?auto_27062 ) ) ( not ( = ?auto_27060 ?auto_27063 ) ) ( not ( = ?auto_27060 ?auto_27083 ) ) ( not ( = ?auto_27028 ?auto_27040 ) ) ( not ( = ?auto_27028 ?auto_27055 ) ) ( not ( = ?auto_27029 ?auto_27040 ) ) ( not ( = ?auto_27029 ?auto_27055 ) ) ( not ( = ?auto_27030 ?auto_27040 ) ) ( not ( = ?auto_27030 ?auto_27055 ) ) ( not ( = ?auto_27031 ?auto_27040 ) ) ( not ( = ?auto_27031 ?auto_27055 ) ) ( not ( = ?auto_27032 ?auto_27040 ) ) ( not ( = ?auto_27032 ?auto_27055 ) ) ( not ( = ?auto_27033 ?auto_27040 ) ) ( not ( = ?auto_27033 ?auto_27055 ) ) ( not ( = ?auto_27034 ?auto_27040 ) ) ( not ( = ?auto_27034 ?auto_27055 ) ) ( not ( = ?auto_27037 ?auto_27040 ) ) ( not ( = ?auto_27037 ?auto_27055 ) ) ( not ( = ?auto_27036 ?auto_27040 ) ) ( not ( = ?auto_27036 ?auto_27055 ) ) ( not ( = ?auto_27035 ?auto_27040 ) ) ( not ( = ?auto_27035 ?auto_27055 ) ) ( not ( = ?auto_27038 ?auto_27040 ) ) ( not ( = ?auto_27038 ?auto_27055 ) ) ( not ( = ?auto_27040 ?auto_27060 ) ) ( not ( = ?auto_27040 ?auto_27071 ) ) ( not ( = ?auto_27040 ?auto_27075 ) ) ( not ( = ?auto_27040 ?auto_27067 ) ) ( not ( = ?auto_27040 ?auto_27068 ) ) ( not ( = ?auto_27040 ?auto_27077 ) ) ( not ( = ?auto_27040 ?auto_27056 ) ) ( not ( = ?auto_27040 ?auto_27086 ) ) ( not ( = ?auto_27040 ?auto_27062 ) ) ( not ( = ?auto_27040 ?auto_27063 ) ) ( not ( = ?auto_27040 ?auto_27083 ) ) ( not ( = ?auto_27055 ?auto_27060 ) ) ( not ( = ?auto_27055 ?auto_27071 ) ) ( not ( = ?auto_27055 ?auto_27075 ) ) ( not ( = ?auto_27055 ?auto_27067 ) ) ( not ( = ?auto_27055 ?auto_27068 ) ) ( not ( = ?auto_27055 ?auto_27077 ) ) ( not ( = ?auto_27055 ?auto_27056 ) ) ( not ( = ?auto_27055 ?auto_27086 ) ) ( not ( = ?auto_27055 ?auto_27062 ) ) ( not ( = ?auto_27055 ?auto_27063 ) ) ( not ( = ?auto_27055 ?auto_27083 ) ) ( not ( = ?auto_27028 ?auto_27041 ) ) ( not ( = ?auto_27028 ?auto_27074 ) ) ( not ( = ?auto_27029 ?auto_27041 ) ) ( not ( = ?auto_27029 ?auto_27074 ) ) ( not ( = ?auto_27030 ?auto_27041 ) ) ( not ( = ?auto_27030 ?auto_27074 ) ) ( not ( = ?auto_27031 ?auto_27041 ) ) ( not ( = ?auto_27031 ?auto_27074 ) ) ( not ( = ?auto_27032 ?auto_27041 ) ) ( not ( = ?auto_27032 ?auto_27074 ) ) ( not ( = ?auto_27033 ?auto_27041 ) ) ( not ( = ?auto_27033 ?auto_27074 ) ) ( not ( = ?auto_27034 ?auto_27041 ) ) ( not ( = ?auto_27034 ?auto_27074 ) ) ( not ( = ?auto_27037 ?auto_27041 ) ) ( not ( = ?auto_27037 ?auto_27074 ) ) ( not ( = ?auto_27036 ?auto_27041 ) ) ( not ( = ?auto_27036 ?auto_27074 ) ) ( not ( = ?auto_27035 ?auto_27041 ) ) ( not ( = ?auto_27035 ?auto_27074 ) ) ( not ( = ?auto_27038 ?auto_27041 ) ) ( not ( = ?auto_27038 ?auto_27074 ) ) ( not ( = ?auto_27039 ?auto_27041 ) ) ( not ( = ?auto_27039 ?auto_27074 ) ) ( not ( = ?auto_27041 ?auto_27055 ) ) ( not ( = ?auto_27041 ?auto_27060 ) ) ( not ( = ?auto_27041 ?auto_27071 ) ) ( not ( = ?auto_27041 ?auto_27075 ) ) ( not ( = ?auto_27041 ?auto_27067 ) ) ( not ( = ?auto_27041 ?auto_27068 ) ) ( not ( = ?auto_27041 ?auto_27077 ) ) ( not ( = ?auto_27041 ?auto_27056 ) ) ( not ( = ?auto_27041 ?auto_27086 ) ) ( not ( = ?auto_27041 ?auto_27062 ) ) ( not ( = ?auto_27041 ?auto_27063 ) ) ( not ( = ?auto_27041 ?auto_27083 ) ) ( not ( = ?auto_27066 ?auto_27078 ) ) ( not ( = ?auto_27066 ?auto_27064 ) ) ( not ( = ?auto_27066 ?auto_27081 ) ) ( not ( = ?auto_27066 ?auto_27082 ) ) ( not ( = ?auto_27066 ?auto_27085 ) ) ( not ( = ?auto_27066 ?auto_27054 ) ) ( not ( = ?auto_27066 ?auto_27087 ) ) ( not ( = ?auto_27066 ?auto_27069 ) ) ( not ( = ?auto_27061 ?auto_27052 ) ) ( not ( = ?auto_27061 ?auto_27076 ) ) ( not ( = ?auto_27061 ?auto_27057 ) ) ( not ( = ?auto_27061 ?auto_27073 ) ) ( not ( = ?auto_27061 ?auto_27072 ) ) ( not ( = ?auto_27061 ?auto_27051 ) ) ( not ( = ?auto_27061 ?auto_27080 ) ) ( not ( = ?auto_27061 ?auto_27058 ) ) ( not ( = ?auto_27074 ?auto_27055 ) ) ( not ( = ?auto_27074 ?auto_27060 ) ) ( not ( = ?auto_27074 ?auto_27071 ) ) ( not ( = ?auto_27074 ?auto_27075 ) ) ( not ( = ?auto_27074 ?auto_27067 ) ) ( not ( = ?auto_27074 ?auto_27068 ) ) ( not ( = ?auto_27074 ?auto_27077 ) ) ( not ( = ?auto_27074 ?auto_27056 ) ) ( not ( = ?auto_27074 ?auto_27086 ) ) ( not ( = ?auto_27074 ?auto_27062 ) ) ( not ( = ?auto_27074 ?auto_27063 ) ) ( not ( = ?auto_27074 ?auto_27083 ) ) ( not ( = ?auto_27028 ?auto_27043 ) ) ( not ( = ?auto_27028 ?auto_27084 ) ) ( not ( = ?auto_27029 ?auto_27043 ) ) ( not ( = ?auto_27029 ?auto_27084 ) ) ( not ( = ?auto_27030 ?auto_27043 ) ) ( not ( = ?auto_27030 ?auto_27084 ) ) ( not ( = ?auto_27031 ?auto_27043 ) ) ( not ( = ?auto_27031 ?auto_27084 ) ) ( not ( = ?auto_27032 ?auto_27043 ) ) ( not ( = ?auto_27032 ?auto_27084 ) ) ( not ( = ?auto_27033 ?auto_27043 ) ) ( not ( = ?auto_27033 ?auto_27084 ) ) ( not ( = ?auto_27034 ?auto_27043 ) ) ( not ( = ?auto_27034 ?auto_27084 ) ) ( not ( = ?auto_27037 ?auto_27043 ) ) ( not ( = ?auto_27037 ?auto_27084 ) ) ( not ( = ?auto_27036 ?auto_27043 ) ) ( not ( = ?auto_27036 ?auto_27084 ) ) ( not ( = ?auto_27035 ?auto_27043 ) ) ( not ( = ?auto_27035 ?auto_27084 ) ) ( not ( = ?auto_27038 ?auto_27043 ) ) ( not ( = ?auto_27038 ?auto_27084 ) ) ( not ( = ?auto_27039 ?auto_27043 ) ) ( not ( = ?auto_27039 ?auto_27084 ) ) ( not ( = ?auto_27040 ?auto_27043 ) ) ( not ( = ?auto_27040 ?auto_27084 ) ) ( not ( = ?auto_27043 ?auto_27074 ) ) ( not ( = ?auto_27043 ?auto_27055 ) ) ( not ( = ?auto_27043 ?auto_27060 ) ) ( not ( = ?auto_27043 ?auto_27071 ) ) ( not ( = ?auto_27043 ?auto_27075 ) ) ( not ( = ?auto_27043 ?auto_27067 ) ) ( not ( = ?auto_27043 ?auto_27068 ) ) ( not ( = ?auto_27043 ?auto_27077 ) ) ( not ( = ?auto_27043 ?auto_27056 ) ) ( not ( = ?auto_27043 ?auto_27086 ) ) ( not ( = ?auto_27043 ?auto_27062 ) ) ( not ( = ?auto_27043 ?auto_27063 ) ) ( not ( = ?auto_27043 ?auto_27083 ) ) ( not ( = ?auto_27059 ?auto_27066 ) ) ( not ( = ?auto_27059 ?auto_27078 ) ) ( not ( = ?auto_27059 ?auto_27064 ) ) ( not ( = ?auto_27059 ?auto_27081 ) ) ( not ( = ?auto_27059 ?auto_27082 ) ) ( not ( = ?auto_27059 ?auto_27085 ) ) ( not ( = ?auto_27059 ?auto_27054 ) ) ( not ( = ?auto_27059 ?auto_27087 ) ) ( not ( = ?auto_27059 ?auto_27069 ) ) ( not ( = ?auto_27053 ?auto_27061 ) ) ( not ( = ?auto_27053 ?auto_27052 ) ) ( not ( = ?auto_27053 ?auto_27076 ) ) ( not ( = ?auto_27053 ?auto_27057 ) ) ( not ( = ?auto_27053 ?auto_27073 ) ) ( not ( = ?auto_27053 ?auto_27072 ) ) ( not ( = ?auto_27053 ?auto_27051 ) ) ( not ( = ?auto_27053 ?auto_27080 ) ) ( not ( = ?auto_27053 ?auto_27058 ) ) ( not ( = ?auto_27084 ?auto_27074 ) ) ( not ( = ?auto_27084 ?auto_27055 ) ) ( not ( = ?auto_27084 ?auto_27060 ) ) ( not ( = ?auto_27084 ?auto_27071 ) ) ( not ( = ?auto_27084 ?auto_27075 ) ) ( not ( = ?auto_27084 ?auto_27067 ) ) ( not ( = ?auto_27084 ?auto_27068 ) ) ( not ( = ?auto_27084 ?auto_27077 ) ) ( not ( = ?auto_27084 ?auto_27056 ) ) ( not ( = ?auto_27084 ?auto_27086 ) ) ( not ( = ?auto_27084 ?auto_27062 ) ) ( not ( = ?auto_27084 ?auto_27063 ) ) ( not ( = ?auto_27084 ?auto_27083 ) ) ( not ( = ?auto_27028 ?auto_27042 ) ) ( not ( = ?auto_27028 ?auto_27065 ) ) ( not ( = ?auto_27029 ?auto_27042 ) ) ( not ( = ?auto_27029 ?auto_27065 ) ) ( not ( = ?auto_27030 ?auto_27042 ) ) ( not ( = ?auto_27030 ?auto_27065 ) ) ( not ( = ?auto_27031 ?auto_27042 ) ) ( not ( = ?auto_27031 ?auto_27065 ) ) ( not ( = ?auto_27032 ?auto_27042 ) ) ( not ( = ?auto_27032 ?auto_27065 ) ) ( not ( = ?auto_27033 ?auto_27042 ) ) ( not ( = ?auto_27033 ?auto_27065 ) ) ( not ( = ?auto_27034 ?auto_27042 ) ) ( not ( = ?auto_27034 ?auto_27065 ) ) ( not ( = ?auto_27037 ?auto_27042 ) ) ( not ( = ?auto_27037 ?auto_27065 ) ) ( not ( = ?auto_27036 ?auto_27042 ) ) ( not ( = ?auto_27036 ?auto_27065 ) ) ( not ( = ?auto_27035 ?auto_27042 ) ) ( not ( = ?auto_27035 ?auto_27065 ) ) ( not ( = ?auto_27038 ?auto_27042 ) ) ( not ( = ?auto_27038 ?auto_27065 ) ) ( not ( = ?auto_27039 ?auto_27042 ) ) ( not ( = ?auto_27039 ?auto_27065 ) ) ( not ( = ?auto_27040 ?auto_27042 ) ) ( not ( = ?auto_27040 ?auto_27065 ) ) ( not ( = ?auto_27041 ?auto_27042 ) ) ( not ( = ?auto_27041 ?auto_27065 ) ) ( not ( = ?auto_27042 ?auto_27084 ) ) ( not ( = ?auto_27042 ?auto_27074 ) ) ( not ( = ?auto_27042 ?auto_27055 ) ) ( not ( = ?auto_27042 ?auto_27060 ) ) ( not ( = ?auto_27042 ?auto_27071 ) ) ( not ( = ?auto_27042 ?auto_27075 ) ) ( not ( = ?auto_27042 ?auto_27067 ) ) ( not ( = ?auto_27042 ?auto_27068 ) ) ( not ( = ?auto_27042 ?auto_27077 ) ) ( not ( = ?auto_27042 ?auto_27056 ) ) ( not ( = ?auto_27042 ?auto_27086 ) ) ( not ( = ?auto_27042 ?auto_27062 ) ) ( not ( = ?auto_27042 ?auto_27063 ) ) ( not ( = ?auto_27042 ?auto_27083 ) ) ( not ( = ?auto_27070 ?auto_27059 ) ) ( not ( = ?auto_27070 ?auto_27066 ) ) ( not ( = ?auto_27070 ?auto_27078 ) ) ( not ( = ?auto_27070 ?auto_27064 ) ) ( not ( = ?auto_27070 ?auto_27081 ) ) ( not ( = ?auto_27070 ?auto_27082 ) ) ( not ( = ?auto_27070 ?auto_27085 ) ) ( not ( = ?auto_27070 ?auto_27054 ) ) ( not ( = ?auto_27070 ?auto_27087 ) ) ( not ( = ?auto_27070 ?auto_27069 ) ) ( not ( = ?auto_27079 ?auto_27053 ) ) ( not ( = ?auto_27079 ?auto_27061 ) ) ( not ( = ?auto_27079 ?auto_27052 ) ) ( not ( = ?auto_27079 ?auto_27076 ) ) ( not ( = ?auto_27079 ?auto_27057 ) ) ( not ( = ?auto_27079 ?auto_27073 ) ) ( not ( = ?auto_27079 ?auto_27072 ) ) ( not ( = ?auto_27079 ?auto_27051 ) ) ( not ( = ?auto_27079 ?auto_27080 ) ) ( not ( = ?auto_27079 ?auto_27058 ) ) ( not ( = ?auto_27065 ?auto_27084 ) ) ( not ( = ?auto_27065 ?auto_27074 ) ) ( not ( = ?auto_27065 ?auto_27055 ) ) ( not ( = ?auto_27065 ?auto_27060 ) ) ( not ( = ?auto_27065 ?auto_27071 ) ) ( not ( = ?auto_27065 ?auto_27075 ) ) ( not ( = ?auto_27065 ?auto_27067 ) ) ( not ( = ?auto_27065 ?auto_27068 ) ) ( not ( = ?auto_27065 ?auto_27077 ) ) ( not ( = ?auto_27065 ?auto_27056 ) ) ( not ( = ?auto_27065 ?auto_27086 ) ) ( not ( = ?auto_27065 ?auto_27062 ) ) ( not ( = ?auto_27065 ?auto_27063 ) ) ( not ( = ?auto_27065 ?auto_27083 ) ) ( not ( = ?auto_27028 ?auto_27044 ) ) ( not ( = ?auto_27028 ?auto_27050 ) ) ( not ( = ?auto_27029 ?auto_27044 ) ) ( not ( = ?auto_27029 ?auto_27050 ) ) ( not ( = ?auto_27030 ?auto_27044 ) ) ( not ( = ?auto_27030 ?auto_27050 ) ) ( not ( = ?auto_27031 ?auto_27044 ) ) ( not ( = ?auto_27031 ?auto_27050 ) ) ( not ( = ?auto_27032 ?auto_27044 ) ) ( not ( = ?auto_27032 ?auto_27050 ) ) ( not ( = ?auto_27033 ?auto_27044 ) ) ( not ( = ?auto_27033 ?auto_27050 ) ) ( not ( = ?auto_27034 ?auto_27044 ) ) ( not ( = ?auto_27034 ?auto_27050 ) ) ( not ( = ?auto_27037 ?auto_27044 ) ) ( not ( = ?auto_27037 ?auto_27050 ) ) ( not ( = ?auto_27036 ?auto_27044 ) ) ( not ( = ?auto_27036 ?auto_27050 ) ) ( not ( = ?auto_27035 ?auto_27044 ) ) ( not ( = ?auto_27035 ?auto_27050 ) ) ( not ( = ?auto_27038 ?auto_27044 ) ) ( not ( = ?auto_27038 ?auto_27050 ) ) ( not ( = ?auto_27039 ?auto_27044 ) ) ( not ( = ?auto_27039 ?auto_27050 ) ) ( not ( = ?auto_27040 ?auto_27044 ) ) ( not ( = ?auto_27040 ?auto_27050 ) ) ( not ( = ?auto_27041 ?auto_27044 ) ) ( not ( = ?auto_27041 ?auto_27050 ) ) ( not ( = ?auto_27043 ?auto_27044 ) ) ( not ( = ?auto_27043 ?auto_27050 ) ) ( not ( = ?auto_27044 ?auto_27065 ) ) ( not ( = ?auto_27044 ?auto_27084 ) ) ( not ( = ?auto_27044 ?auto_27074 ) ) ( not ( = ?auto_27044 ?auto_27055 ) ) ( not ( = ?auto_27044 ?auto_27060 ) ) ( not ( = ?auto_27044 ?auto_27071 ) ) ( not ( = ?auto_27044 ?auto_27075 ) ) ( not ( = ?auto_27044 ?auto_27067 ) ) ( not ( = ?auto_27044 ?auto_27068 ) ) ( not ( = ?auto_27044 ?auto_27077 ) ) ( not ( = ?auto_27044 ?auto_27056 ) ) ( not ( = ?auto_27044 ?auto_27086 ) ) ( not ( = ?auto_27044 ?auto_27062 ) ) ( not ( = ?auto_27044 ?auto_27063 ) ) ( not ( = ?auto_27044 ?auto_27083 ) ) ( not ( = ?auto_27048 ?auto_27070 ) ) ( not ( = ?auto_27048 ?auto_27059 ) ) ( not ( = ?auto_27048 ?auto_27066 ) ) ( not ( = ?auto_27048 ?auto_27078 ) ) ( not ( = ?auto_27048 ?auto_27064 ) ) ( not ( = ?auto_27048 ?auto_27081 ) ) ( not ( = ?auto_27048 ?auto_27082 ) ) ( not ( = ?auto_27048 ?auto_27085 ) ) ( not ( = ?auto_27048 ?auto_27054 ) ) ( not ( = ?auto_27048 ?auto_27087 ) ) ( not ( = ?auto_27048 ?auto_27069 ) ) ( not ( = ?auto_27049 ?auto_27079 ) ) ( not ( = ?auto_27049 ?auto_27053 ) ) ( not ( = ?auto_27049 ?auto_27061 ) ) ( not ( = ?auto_27049 ?auto_27052 ) ) ( not ( = ?auto_27049 ?auto_27076 ) ) ( not ( = ?auto_27049 ?auto_27057 ) ) ( not ( = ?auto_27049 ?auto_27073 ) ) ( not ( = ?auto_27049 ?auto_27072 ) ) ( not ( = ?auto_27049 ?auto_27051 ) ) ( not ( = ?auto_27049 ?auto_27080 ) ) ( not ( = ?auto_27049 ?auto_27058 ) ) ( not ( = ?auto_27050 ?auto_27065 ) ) ( not ( = ?auto_27050 ?auto_27084 ) ) ( not ( = ?auto_27050 ?auto_27074 ) ) ( not ( = ?auto_27050 ?auto_27055 ) ) ( not ( = ?auto_27050 ?auto_27060 ) ) ( not ( = ?auto_27050 ?auto_27071 ) ) ( not ( = ?auto_27050 ?auto_27075 ) ) ( not ( = ?auto_27050 ?auto_27067 ) ) ( not ( = ?auto_27050 ?auto_27068 ) ) ( not ( = ?auto_27050 ?auto_27077 ) ) ( not ( = ?auto_27050 ?auto_27056 ) ) ( not ( = ?auto_27050 ?auto_27086 ) ) ( not ( = ?auto_27050 ?auto_27062 ) ) ( not ( = ?auto_27050 ?auto_27063 ) ) ( not ( = ?auto_27050 ?auto_27083 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_27028 ?auto_27029 ?auto_27030 ?auto_27031 ?auto_27032 ?auto_27033 ?auto_27034 ?auto_27037 ?auto_27036 ?auto_27035 ?auto_27038 ?auto_27039 ?auto_27040 ?auto_27041 ?auto_27043 ?auto_27042 )
      ( MAKE-1CRATE ?auto_27042 ?auto_27044 )
      ( MAKE-16CRATE-VERIFY ?auto_27028 ?auto_27029 ?auto_27030 ?auto_27031 ?auto_27032 ?auto_27033 ?auto_27034 ?auto_27037 ?auto_27036 ?auto_27035 ?auto_27038 ?auto_27039 ?auto_27040 ?auto_27041 ?auto_27043 ?auto_27042 ?auto_27044 ) )
  )

)

