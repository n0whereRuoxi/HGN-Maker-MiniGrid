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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_26267 - SURFACE
      ?auto_26268 - SURFACE
      ?auto_26269 - SURFACE
    )
    :vars
    (
      ?auto_26270 - HOIST
      ?auto_26274 - PLACE
      ?auto_26273 - PLACE
      ?auto_26272 - HOIST
      ?auto_26271 - SURFACE
      ?auto_26276 - PLACE
      ?auto_26278 - HOIST
      ?auto_26277 - SURFACE
      ?auto_26275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26270 ?auto_26274 ) ( IS-CRATE ?auto_26269 ) ( not ( = ?auto_26273 ?auto_26274 ) ) ( HOIST-AT ?auto_26272 ?auto_26273 ) ( AVAILABLE ?auto_26272 ) ( SURFACE-AT ?auto_26269 ?auto_26273 ) ( ON ?auto_26269 ?auto_26271 ) ( CLEAR ?auto_26269 ) ( not ( = ?auto_26268 ?auto_26269 ) ) ( not ( = ?auto_26268 ?auto_26271 ) ) ( not ( = ?auto_26269 ?auto_26271 ) ) ( not ( = ?auto_26270 ?auto_26272 ) ) ( SURFACE-AT ?auto_26267 ?auto_26274 ) ( CLEAR ?auto_26267 ) ( IS-CRATE ?auto_26268 ) ( AVAILABLE ?auto_26270 ) ( not ( = ?auto_26276 ?auto_26274 ) ) ( HOIST-AT ?auto_26278 ?auto_26276 ) ( AVAILABLE ?auto_26278 ) ( SURFACE-AT ?auto_26268 ?auto_26276 ) ( ON ?auto_26268 ?auto_26277 ) ( CLEAR ?auto_26268 ) ( TRUCK-AT ?auto_26275 ?auto_26274 ) ( not ( = ?auto_26267 ?auto_26268 ) ) ( not ( = ?auto_26267 ?auto_26277 ) ) ( not ( = ?auto_26268 ?auto_26277 ) ) ( not ( = ?auto_26270 ?auto_26278 ) ) ( not ( = ?auto_26267 ?auto_26269 ) ) ( not ( = ?auto_26267 ?auto_26271 ) ) ( not ( = ?auto_26269 ?auto_26277 ) ) ( not ( = ?auto_26273 ?auto_26276 ) ) ( not ( = ?auto_26272 ?auto_26278 ) ) ( not ( = ?auto_26271 ?auto_26277 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_26267 ?auto_26268 )
      ( MAKE-1CRATE ?auto_26268 ?auto_26269 )
      ( MAKE-2CRATE-VERIFY ?auto_26267 ?auto_26268 ?auto_26269 ) )
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
      ?auto_26300 - HOIST
      ?auto_26301 - PLACE
      ?auto_26302 - PLACE
      ?auto_26298 - HOIST
      ?auto_26299 - SURFACE
      ?auto_26305 - PLACE
      ?auto_26303 - HOIST
      ?auto_26308 - SURFACE
      ?auto_26307 - PLACE
      ?auto_26304 - HOIST
      ?auto_26306 - SURFACE
      ?auto_26297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26300 ?auto_26301 ) ( IS-CRATE ?auto_26296 ) ( not ( = ?auto_26302 ?auto_26301 ) ) ( HOIST-AT ?auto_26298 ?auto_26302 ) ( AVAILABLE ?auto_26298 ) ( SURFACE-AT ?auto_26296 ?auto_26302 ) ( ON ?auto_26296 ?auto_26299 ) ( CLEAR ?auto_26296 ) ( not ( = ?auto_26295 ?auto_26296 ) ) ( not ( = ?auto_26295 ?auto_26299 ) ) ( not ( = ?auto_26296 ?auto_26299 ) ) ( not ( = ?auto_26300 ?auto_26298 ) ) ( IS-CRATE ?auto_26295 ) ( not ( = ?auto_26305 ?auto_26301 ) ) ( HOIST-AT ?auto_26303 ?auto_26305 ) ( AVAILABLE ?auto_26303 ) ( SURFACE-AT ?auto_26295 ?auto_26305 ) ( ON ?auto_26295 ?auto_26308 ) ( CLEAR ?auto_26295 ) ( not ( = ?auto_26294 ?auto_26295 ) ) ( not ( = ?auto_26294 ?auto_26308 ) ) ( not ( = ?auto_26295 ?auto_26308 ) ) ( not ( = ?auto_26300 ?auto_26303 ) ) ( SURFACE-AT ?auto_26293 ?auto_26301 ) ( CLEAR ?auto_26293 ) ( IS-CRATE ?auto_26294 ) ( AVAILABLE ?auto_26300 ) ( not ( = ?auto_26307 ?auto_26301 ) ) ( HOIST-AT ?auto_26304 ?auto_26307 ) ( AVAILABLE ?auto_26304 ) ( SURFACE-AT ?auto_26294 ?auto_26307 ) ( ON ?auto_26294 ?auto_26306 ) ( CLEAR ?auto_26294 ) ( TRUCK-AT ?auto_26297 ?auto_26301 ) ( not ( = ?auto_26293 ?auto_26294 ) ) ( not ( = ?auto_26293 ?auto_26306 ) ) ( not ( = ?auto_26294 ?auto_26306 ) ) ( not ( = ?auto_26300 ?auto_26304 ) ) ( not ( = ?auto_26293 ?auto_26295 ) ) ( not ( = ?auto_26293 ?auto_26308 ) ) ( not ( = ?auto_26295 ?auto_26306 ) ) ( not ( = ?auto_26305 ?auto_26307 ) ) ( not ( = ?auto_26303 ?auto_26304 ) ) ( not ( = ?auto_26308 ?auto_26306 ) ) ( not ( = ?auto_26293 ?auto_26296 ) ) ( not ( = ?auto_26293 ?auto_26299 ) ) ( not ( = ?auto_26294 ?auto_26296 ) ) ( not ( = ?auto_26294 ?auto_26299 ) ) ( not ( = ?auto_26296 ?auto_26308 ) ) ( not ( = ?auto_26296 ?auto_26306 ) ) ( not ( = ?auto_26302 ?auto_26305 ) ) ( not ( = ?auto_26302 ?auto_26307 ) ) ( not ( = ?auto_26298 ?auto_26303 ) ) ( not ( = ?auto_26298 ?auto_26304 ) ) ( not ( = ?auto_26299 ?auto_26308 ) ) ( not ( = ?auto_26299 ?auto_26306 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_26293 ?auto_26294 ?auto_26295 )
      ( MAKE-1CRATE ?auto_26295 ?auto_26296 )
      ( MAKE-3CRATE-VERIFY ?auto_26293 ?auto_26294 ?auto_26295 ?auto_26296 ) )
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
      ?auto_26329 - PLACE
      ?auto_26331 - HOIST
      ?auto_26332 - SURFACE
      ?auto_26340 - PLACE
      ?auto_26335 - HOIST
      ?auto_26337 - SURFACE
      ?auto_26341 - SURFACE
      ?auto_26336 - PLACE
      ?auto_26339 - HOIST
      ?auto_26338 - SURFACE
      ?auto_26334 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26333 ?auto_26330 ) ( IS-CRATE ?auto_26328 ) ( not ( = ?auto_26329 ?auto_26330 ) ) ( HOIST-AT ?auto_26331 ?auto_26329 ) ( SURFACE-AT ?auto_26328 ?auto_26329 ) ( ON ?auto_26328 ?auto_26332 ) ( CLEAR ?auto_26328 ) ( not ( = ?auto_26327 ?auto_26328 ) ) ( not ( = ?auto_26327 ?auto_26332 ) ) ( not ( = ?auto_26328 ?auto_26332 ) ) ( not ( = ?auto_26333 ?auto_26331 ) ) ( IS-CRATE ?auto_26327 ) ( not ( = ?auto_26340 ?auto_26330 ) ) ( HOIST-AT ?auto_26335 ?auto_26340 ) ( AVAILABLE ?auto_26335 ) ( SURFACE-AT ?auto_26327 ?auto_26340 ) ( ON ?auto_26327 ?auto_26337 ) ( CLEAR ?auto_26327 ) ( not ( = ?auto_26326 ?auto_26327 ) ) ( not ( = ?auto_26326 ?auto_26337 ) ) ( not ( = ?auto_26327 ?auto_26337 ) ) ( not ( = ?auto_26333 ?auto_26335 ) ) ( IS-CRATE ?auto_26326 ) ( AVAILABLE ?auto_26331 ) ( SURFACE-AT ?auto_26326 ?auto_26329 ) ( ON ?auto_26326 ?auto_26341 ) ( CLEAR ?auto_26326 ) ( not ( = ?auto_26325 ?auto_26326 ) ) ( not ( = ?auto_26325 ?auto_26341 ) ) ( not ( = ?auto_26326 ?auto_26341 ) ) ( SURFACE-AT ?auto_26324 ?auto_26330 ) ( CLEAR ?auto_26324 ) ( IS-CRATE ?auto_26325 ) ( AVAILABLE ?auto_26333 ) ( not ( = ?auto_26336 ?auto_26330 ) ) ( HOIST-AT ?auto_26339 ?auto_26336 ) ( AVAILABLE ?auto_26339 ) ( SURFACE-AT ?auto_26325 ?auto_26336 ) ( ON ?auto_26325 ?auto_26338 ) ( CLEAR ?auto_26325 ) ( TRUCK-AT ?auto_26334 ?auto_26330 ) ( not ( = ?auto_26324 ?auto_26325 ) ) ( not ( = ?auto_26324 ?auto_26338 ) ) ( not ( = ?auto_26325 ?auto_26338 ) ) ( not ( = ?auto_26333 ?auto_26339 ) ) ( not ( = ?auto_26324 ?auto_26326 ) ) ( not ( = ?auto_26324 ?auto_26341 ) ) ( not ( = ?auto_26326 ?auto_26338 ) ) ( not ( = ?auto_26329 ?auto_26336 ) ) ( not ( = ?auto_26331 ?auto_26339 ) ) ( not ( = ?auto_26341 ?auto_26338 ) ) ( not ( = ?auto_26324 ?auto_26327 ) ) ( not ( = ?auto_26324 ?auto_26337 ) ) ( not ( = ?auto_26325 ?auto_26327 ) ) ( not ( = ?auto_26325 ?auto_26337 ) ) ( not ( = ?auto_26327 ?auto_26341 ) ) ( not ( = ?auto_26327 ?auto_26338 ) ) ( not ( = ?auto_26340 ?auto_26329 ) ) ( not ( = ?auto_26340 ?auto_26336 ) ) ( not ( = ?auto_26335 ?auto_26331 ) ) ( not ( = ?auto_26335 ?auto_26339 ) ) ( not ( = ?auto_26337 ?auto_26341 ) ) ( not ( = ?auto_26337 ?auto_26338 ) ) ( not ( = ?auto_26324 ?auto_26328 ) ) ( not ( = ?auto_26324 ?auto_26332 ) ) ( not ( = ?auto_26325 ?auto_26328 ) ) ( not ( = ?auto_26325 ?auto_26332 ) ) ( not ( = ?auto_26326 ?auto_26328 ) ) ( not ( = ?auto_26326 ?auto_26332 ) ) ( not ( = ?auto_26328 ?auto_26337 ) ) ( not ( = ?auto_26328 ?auto_26341 ) ) ( not ( = ?auto_26328 ?auto_26338 ) ) ( not ( = ?auto_26332 ?auto_26337 ) ) ( not ( = ?auto_26332 ?auto_26341 ) ) ( not ( = ?auto_26332 ?auto_26338 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_26324 ?auto_26325 ?auto_26326 ?auto_26327 )
      ( MAKE-1CRATE ?auto_26327 ?auto_26328 )
      ( MAKE-4CRATE-VERIFY ?auto_26324 ?auto_26325 ?auto_26326 ?auto_26327 ?auto_26328 ) )
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
      ?auto_26365 - PLACE
      ?auto_26367 - PLACE
      ?auto_26368 - HOIST
      ?auto_26364 - SURFACE
      ?auto_26374 - PLACE
      ?auto_26375 - HOIST
      ?auto_26372 - SURFACE
      ?auto_26378 - PLACE
      ?auto_26371 - HOIST
      ?auto_26376 - SURFACE
      ?auto_26373 - SURFACE
      ?auto_26377 - PLACE
      ?auto_26370 - HOIST
      ?auto_26379 - SURFACE
      ?auto_26369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26366 ?auto_26365 ) ( IS-CRATE ?auto_26363 ) ( not ( = ?auto_26367 ?auto_26365 ) ) ( HOIST-AT ?auto_26368 ?auto_26367 ) ( AVAILABLE ?auto_26368 ) ( SURFACE-AT ?auto_26363 ?auto_26367 ) ( ON ?auto_26363 ?auto_26364 ) ( CLEAR ?auto_26363 ) ( not ( = ?auto_26362 ?auto_26363 ) ) ( not ( = ?auto_26362 ?auto_26364 ) ) ( not ( = ?auto_26363 ?auto_26364 ) ) ( not ( = ?auto_26366 ?auto_26368 ) ) ( IS-CRATE ?auto_26362 ) ( not ( = ?auto_26374 ?auto_26365 ) ) ( HOIST-AT ?auto_26375 ?auto_26374 ) ( SURFACE-AT ?auto_26362 ?auto_26374 ) ( ON ?auto_26362 ?auto_26372 ) ( CLEAR ?auto_26362 ) ( not ( = ?auto_26361 ?auto_26362 ) ) ( not ( = ?auto_26361 ?auto_26372 ) ) ( not ( = ?auto_26362 ?auto_26372 ) ) ( not ( = ?auto_26366 ?auto_26375 ) ) ( IS-CRATE ?auto_26361 ) ( not ( = ?auto_26378 ?auto_26365 ) ) ( HOIST-AT ?auto_26371 ?auto_26378 ) ( AVAILABLE ?auto_26371 ) ( SURFACE-AT ?auto_26361 ?auto_26378 ) ( ON ?auto_26361 ?auto_26376 ) ( CLEAR ?auto_26361 ) ( not ( = ?auto_26360 ?auto_26361 ) ) ( not ( = ?auto_26360 ?auto_26376 ) ) ( not ( = ?auto_26361 ?auto_26376 ) ) ( not ( = ?auto_26366 ?auto_26371 ) ) ( IS-CRATE ?auto_26360 ) ( AVAILABLE ?auto_26375 ) ( SURFACE-AT ?auto_26360 ?auto_26374 ) ( ON ?auto_26360 ?auto_26373 ) ( CLEAR ?auto_26360 ) ( not ( = ?auto_26359 ?auto_26360 ) ) ( not ( = ?auto_26359 ?auto_26373 ) ) ( not ( = ?auto_26360 ?auto_26373 ) ) ( SURFACE-AT ?auto_26358 ?auto_26365 ) ( CLEAR ?auto_26358 ) ( IS-CRATE ?auto_26359 ) ( AVAILABLE ?auto_26366 ) ( not ( = ?auto_26377 ?auto_26365 ) ) ( HOIST-AT ?auto_26370 ?auto_26377 ) ( AVAILABLE ?auto_26370 ) ( SURFACE-AT ?auto_26359 ?auto_26377 ) ( ON ?auto_26359 ?auto_26379 ) ( CLEAR ?auto_26359 ) ( TRUCK-AT ?auto_26369 ?auto_26365 ) ( not ( = ?auto_26358 ?auto_26359 ) ) ( not ( = ?auto_26358 ?auto_26379 ) ) ( not ( = ?auto_26359 ?auto_26379 ) ) ( not ( = ?auto_26366 ?auto_26370 ) ) ( not ( = ?auto_26358 ?auto_26360 ) ) ( not ( = ?auto_26358 ?auto_26373 ) ) ( not ( = ?auto_26360 ?auto_26379 ) ) ( not ( = ?auto_26374 ?auto_26377 ) ) ( not ( = ?auto_26375 ?auto_26370 ) ) ( not ( = ?auto_26373 ?auto_26379 ) ) ( not ( = ?auto_26358 ?auto_26361 ) ) ( not ( = ?auto_26358 ?auto_26376 ) ) ( not ( = ?auto_26359 ?auto_26361 ) ) ( not ( = ?auto_26359 ?auto_26376 ) ) ( not ( = ?auto_26361 ?auto_26373 ) ) ( not ( = ?auto_26361 ?auto_26379 ) ) ( not ( = ?auto_26378 ?auto_26374 ) ) ( not ( = ?auto_26378 ?auto_26377 ) ) ( not ( = ?auto_26371 ?auto_26375 ) ) ( not ( = ?auto_26371 ?auto_26370 ) ) ( not ( = ?auto_26376 ?auto_26373 ) ) ( not ( = ?auto_26376 ?auto_26379 ) ) ( not ( = ?auto_26358 ?auto_26362 ) ) ( not ( = ?auto_26358 ?auto_26372 ) ) ( not ( = ?auto_26359 ?auto_26362 ) ) ( not ( = ?auto_26359 ?auto_26372 ) ) ( not ( = ?auto_26360 ?auto_26362 ) ) ( not ( = ?auto_26360 ?auto_26372 ) ) ( not ( = ?auto_26362 ?auto_26376 ) ) ( not ( = ?auto_26362 ?auto_26373 ) ) ( not ( = ?auto_26362 ?auto_26379 ) ) ( not ( = ?auto_26372 ?auto_26376 ) ) ( not ( = ?auto_26372 ?auto_26373 ) ) ( not ( = ?auto_26372 ?auto_26379 ) ) ( not ( = ?auto_26358 ?auto_26363 ) ) ( not ( = ?auto_26358 ?auto_26364 ) ) ( not ( = ?auto_26359 ?auto_26363 ) ) ( not ( = ?auto_26359 ?auto_26364 ) ) ( not ( = ?auto_26360 ?auto_26363 ) ) ( not ( = ?auto_26360 ?auto_26364 ) ) ( not ( = ?auto_26361 ?auto_26363 ) ) ( not ( = ?auto_26361 ?auto_26364 ) ) ( not ( = ?auto_26363 ?auto_26372 ) ) ( not ( = ?auto_26363 ?auto_26376 ) ) ( not ( = ?auto_26363 ?auto_26373 ) ) ( not ( = ?auto_26363 ?auto_26379 ) ) ( not ( = ?auto_26367 ?auto_26374 ) ) ( not ( = ?auto_26367 ?auto_26378 ) ) ( not ( = ?auto_26367 ?auto_26377 ) ) ( not ( = ?auto_26368 ?auto_26375 ) ) ( not ( = ?auto_26368 ?auto_26371 ) ) ( not ( = ?auto_26368 ?auto_26370 ) ) ( not ( = ?auto_26364 ?auto_26372 ) ) ( not ( = ?auto_26364 ?auto_26376 ) ) ( not ( = ?auto_26364 ?auto_26373 ) ) ( not ( = ?auto_26364 ?auto_26379 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_26358 ?auto_26359 ?auto_26360 ?auto_26361 ?auto_26362 )
      ( MAKE-1CRATE ?auto_26362 ?auto_26363 )
      ( MAKE-5CRATE-VERIFY ?auto_26358 ?auto_26359 ?auto_26360 ?auto_26361 ?auto_26362 ?auto_26363 ) )
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
      ?auto_26404 - HOIST
      ?auto_26409 - PLACE
      ?auto_26407 - PLACE
      ?auto_26405 - HOIST
      ?auto_26406 - SURFACE
      ?auto_26421 - PLACE
      ?auto_26410 - HOIST
      ?auto_26411 - SURFACE
      ?auto_26415 - PLACE
      ?auto_26417 - HOIST
      ?auto_26413 - SURFACE
      ?auto_26416 - PLACE
      ?auto_26412 - HOIST
      ?auto_26418 - SURFACE
      ?auto_26414 - SURFACE
      ?auto_26419 - PLACE
      ?auto_26422 - HOIST
      ?auto_26420 - SURFACE
      ?auto_26408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26404 ?auto_26409 ) ( IS-CRATE ?auto_26403 ) ( not ( = ?auto_26407 ?auto_26409 ) ) ( HOIST-AT ?auto_26405 ?auto_26407 ) ( AVAILABLE ?auto_26405 ) ( SURFACE-AT ?auto_26403 ?auto_26407 ) ( ON ?auto_26403 ?auto_26406 ) ( CLEAR ?auto_26403 ) ( not ( = ?auto_26402 ?auto_26403 ) ) ( not ( = ?auto_26402 ?auto_26406 ) ) ( not ( = ?auto_26403 ?auto_26406 ) ) ( not ( = ?auto_26404 ?auto_26405 ) ) ( IS-CRATE ?auto_26402 ) ( not ( = ?auto_26421 ?auto_26409 ) ) ( HOIST-AT ?auto_26410 ?auto_26421 ) ( AVAILABLE ?auto_26410 ) ( SURFACE-AT ?auto_26402 ?auto_26421 ) ( ON ?auto_26402 ?auto_26411 ) ( CLEAR ?auto_26402 ) ( not ( = ?auto_26401 ?auto_26402 ) ) ( not ( = ?auto_26401 ?auto_26411 ) ) ( not ( = ?auto_26402 ?auto_26411 ) ) ( not ( = ?auto_26404 ?auto_26410 ) ) ( IS-CRATE ?auto_26401 ) ( not ( = ?auto_26415 ?auto_26409 ) ) ( HOIST-AT ?auto_26417 ?auto_26415 ) ( SURFACE-AT ?auto_26401 ?auto_26415 ) ( ON ?auto_26401 ?auto_26413 ) ( CLEAR ?auto_26401 ) ( not ( = ?auto_26400 ?auto_26401 ) ) ( not ( = ?auto_26400 ?auto_26413 ) ) ( not ( = ?auto_26401 ?auto_26413 ) ) ( not ( = ?auto_26404 ?auto_26417 ) ) ( IS-CRATE ?auto_26400 ) ( not ( = ?auto_26416 ?auto_26409 ) ) ( HOIST-AT ?auto_26412 ?auto_26416 ) ( AVAILABLE ?auto_26412 ) ( SURFACE-AT ?auto_26400 ?auto_26416 ) ( ON ?auto_26400 ?auto_26418 ) ( CLEAR ?auto_26400 ) ( not ( = ?auto_26399 ?auto_26400 ) ) ( not ( = ?auto_26399 ?auto_26418 ) ) ( not ( = ?auto_26400 ?auto_26418 ) ) ( not ( = ?auto_26404 ?auto_26412 ) ) ( IS-CRATE ?auto_26399 ) ( AVAILABLE ?auto_26417 ) ( SURFACE-AT ?auto_26399 ?auto_26415 ) ( ON ?auto_26399 ?auto_26414 ) ( CLEAR ?auto_26399 ) ( not ( = ?auto_26398 ?auto_26399 ) ) ( not ( = ?auto_26398 ?auto_26414 ) ) ( not ( = ?auto_26399 ?auto_26414 ) ) ( SURFACE-AT ?auto_26397 ?auto_26409 ) ( CLEAR ?auto_26397 ) ( IS-CRATE ?auto_26398 ) ( AVAILABLE ?auto_26404 ) ( not ( = ?auto_26419 ?auto_26409 ) ) ( HOIST-AT ?auto_26422 ?auto_26419 ) ( AVAILABLE ?auto_26422 ) ( SURFACE-AT ?auto_26398 ?auto_26419 ) ( ON ?auto_26398 ?auto_26420 ) ( CLEAR ?auto_26398 ) ( TRUCK-AT ?auto_26408 ?auto_26409 ) ( not ( = ?auto_26397 ?auto_26398 ) ) ( not ( = ?auto_26397 ?auto_26420 ) ) ( not ( = ?auto_26398 ?auto_26420 ) ) ( not ( = ?auto_26404 ?auto_26422 ) ) ( not ( = ?auto_26397 ?auto_26399 ) ) ( not ( = ?auto_26397 ?auto_26414 ) ) ( not ( = ?auto_26399 ?auto_26420 ) ) ( not ( = ?auto_26415 ?auto_26419 ) ) ( not ( = ?auto_26417 ?auto_26422 ) ) ( not ( = ?auto_26414 ?auto_26420 ) ) ( not ( = ?auto_26397 ?auto_26400 ) ) ( not ( = ?auto_26397 ?auto_26418 ) ) ( not ( = ?auto_26398 ?auto_26400 ) ) ( not ( = ?auto_26398 ?auto_26418 ) ) ( not ( = ?auto_26400 ?auto_26414 ) ) ( not ( = ?auto_26400 ?auto_26420 ) ) ( not ( = ?auto_26416 ?auto_26415 ) ) ( not ( = ?auto_26416 ?auto_26419 ) ) ( not ( = ?auto_26412 ?auto_26417 ) ) ( not ( = ?auto_26412 ?auto_26422 ) ) ( not ( = ?auto_26418 ?auto_26414 ) ) ( not ( = ?auto_26418 ?auto_26420 ) ) ( not ( = ?auto_26397 ?auto_26401 ) ) ( not ( = ?auto_26397 ?auto_26413 ) ) ( not ( = ?auto_26398 ?auto_26401 ) ) ( not ( = ?auto_26398 ?auto_26413 ) ) ( not ( = ?auto_26399 ?auto_26401 ) ) ( not ( = ?auto_26399 ?auto_26413 ) ) ( not ( = ?auto_26401 ?auto_26418 ) ) ( not ( = ?auto_26401 ?auto_26414 ) ) ( not ( = ?auto_26401 ?auto_26420 ) ) ( not ( = ?auto_26413 ?auto_26418 ) ) ( not ( = ?auto_26413 ?auto_26414 ) ) ( not ( = ?auto_26413 ?auto_26420 ) ) ( not ( = ?auto_26397 ?auto_26402 ) ) ( not ( = ?auto_26397 ?auto_26411 ) ) ( not ( = ?auto_26398 ?auto_26402 ) ) ( not ( = ?auto_26398 ?auto_26411 ) ) ( not ( = ?auto_26399 ?auto_26402 ) ) ( not ( = ?auto_26399 ?auto_26411 ) ) ( not ( = ?auto_26400 ?auto_26402 ) ) ( not ( = ?auto_26400 ?auto_26411 ) ) ( not ( = ?auto_26402 ?auto_26413 ) ) ( not ( = ?auto_26402 ?auto_26418 ) ) ( not ( = ?auto_26402 ?auto_26414 ) ) ( not ( = ?auto_26402 ?auto_26420 ) ) ( not ( = ?auto_26421 ?auto_26415 ) ) ( not ( = ?auto_26421 ?auto_26416 ) ) ( not ( = ?auto_26421 ?auto_26419 ) ) ( not ( = ?auto_26410 ?auto_26417 ) ) ( not ( = ?auto_26410 ?auto_26412 ) ) ( not ( = ?auto_26410 ?auto_26422 ) ) ( not ( = ?auto_26411 ?auto_26413 ) ) ( not ( = ?auto_26411 ?auto_26418 ) ) ( not ( = ?auto_26411 ?auto_26414 ) ) ( not ( = ?auto_26411 ?auto_26420 ) ) ( not ( = ?auto_26397 ?auto_26403 ) ) ( not ( = ?auto_26397 ?auto_26406 ) ) ( not ( = ?auto_26398 ?auto_26403 ) ) ( not ( = ?auto_26398 ?auto_26406 ) ) ( not ( = ?auto_26399 ?auto_26403 ) ) ( not ( = ?auto_26399 ?auto_26406 ) ) ( not ( = ?auto_26400 ?auto_26403 ) ) ( not ( = ?auto_26400 ?auto_26406 ) ) ( not ( = ?auto_26401 ?auto_26403 ) ) ( not ( = ?auto_26401 ?auto_26406 ) ) ( not ( = ?auto_26403 ?auto_26411 ) ) ( not ( = ?auto_26403 ?auto_26413 ) ) ( not ( = ?auto_26403 ?auto_26418 ) ) ( not ( = ?auto_26403 ?auto_26414 ) ) ( not ( = ?auto_26403 ?auto_26420 ) ) ( not ( = ?auto_26407 ?auto_26421 ) ) ( not ( = ?auto_26407 ?auto_26415 ) ) ( not ( = ?auto_26407 ?auto_26416 ) ) ( not ( = ?auto_26407 ?auto_26419 ) ) ( not ( = ?auto_26405 ?auto_26410 ) ) ( not ( = ?auto_26405 ?auto_26417 ) ) ( not ( = ?auto_26405 ?auto_26412 ) ) ( not ( = ?auto_26405 ?auto_26422 ) ) ( not ( = ?auto_26406 ?auto_26411 ) ) ( not ( = ?auto_26406 ?auto_26413 ) ) ( not ( = ?auto_26406 ?auto_26418 ) ) ( not ( = ?auto_26406 ?auto_26414 ) ) ( not ( = ?auto_26406 ?auto_26420 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_26397 ?auto_26398 ?auto_26399 ?auto_26400 ?auto_26401 ?auto_26402 )
      ( MAKE-1CRATE ?auto_26402 ?auto_26403 )
      ( MAKE-6CRATE-VERIFY ?auto_26397 ?auto_26398 ?auto_26399 ?auto_26400 ?auto_26401 ?auto_26402 ?auto_26403 ) )
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
      ?auto_26454 - HOIST
      ?auto_26453 - PLACE
      ?auto_26449 - PLACE
      ?auto_26452 - HOIST
      ?auto_26450 - SURFACE
      ?auto_26456 - PLACE
      ?auto_26462 - HOIST
      ?auto_26466 - SURFACE
      ?auto_26460 - PLACE
      ?auto_26455 - HOIST
      ?auto_26463 - SURFACE
      ?auto_26468 - PLACE
      ?auto_26470 - HOIST
      ?auto_26464 - SURFACE
      ?auto_26469 - PLACE
      ?auto_26465 - HOIST
      ?auto_26457 - SURFACE
      ?auto_26467 - SURFACE
      ?auto_26459 - PLACE
      ?auto_26461 - HOIST
      ?auto_26458 - SURFACE
      ?auto_26451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26454 ?auto_26453 ) ( IS-CRATE ?auto_26448 ) ( not ( = ?auto_26449 ?auto_26453 ) ) ( HOIST-AT ?auto_26452 ?auto_26449 ) ( AVAILABLE ?auto_26452 ) ( SURFACE-AT ?auto_26448 ?auto_26449 ) ( ON ?auto_26448 ?auto_26450 ) ( CLEAR ?auto_26448 ) ( not ( = ?auto_26447 ?auto_26448 ) ) ( not ( = ?auto_26447 ?auto_26450 ) ) ( not ( = ?auto_26448 ?auto_26450 ) ) ( not ( = ?auto_26454 ?auto_26452 ) ) ( IS-CRATE ?auto_26447 ) ( not ( = ?auto_26456 ?auto_26453 ) ) ( HOIST-AT ?auto_26462 ?auto_26456 ) ( AVAILABLE ?auto_26462 ) ( SURFACE-AT ?auto_26447 ?auto_26456 ) ( ON ?auto_26447 ?auto_26466 ) ( CLEAR ?auto_26447 ) ( not ( = ?auto_26446 ?auto_26447 ) ) ( not ( = ?auto_26446 ?auto_26466 ) ) ( not ( = ?auto_26447 ?auto_26466 ) ) ( not ( = ?auto_26454 ?auto_26462 ) ) ( IS-CRATE ?auto_26446 ) ( not ( = ?auto_26460 ?auto_26453 ) ) ( HOIST-AT ?auto_26455 ?auto_26460 ) ( AVAILABLE ?auto_26455 ) ( SURFACE-AT ?auto_26446 ?auto_26460 ) ( ON ?auto_26446 ?auto_26463 ) ( CLEAR ?auto_26446 ) ( not ( = ?auto_26445 ?auto_26446 ) ) ( not ( = ?auto_26445 ?auto_26463 ) ) ( not ( = ?auto_26446 ?auto_26463 ) ) ( not ( = ?auto_26454 ?auto_26455 ) ) ( IS-CRATE ?auto_26445 ) ( not ( = ?auto_26468 ?auto_26453 ) ) ( HOIST-AT ?auto_26470 ?auto_26468 ) ( SURFACE-AT ?auto_26445 ?auto_26468 ) ( ON ?auto_26445 ?auto_26464 ) ( CLEAR ?auto_26445 ) ( not ( = ?auto_26444 ?auto_26445 ) ) ( not ( = ?auto_26444 ?auto_26464 ) ) ( not ( = ?auto_26445 ?auto_26464 ) ) ( not ( = ?auto_26454 ?auto_26470 ) ) ( IS-CRATE ?auto_26444 ) ( not ( = ?auto_26469 ?auto_26453 ) ) ( HOIST-AT ?auto_26465 ?auto_26469 ) ( AVAILABLE ?auto_26465 ) ( SURFACE-AT ?auto_26444 ?auto_26469 ) ( ON ?auto_26444 ?auto_26457 ) ( CLEAR ?auto_26444 ) ( not ( = ?auto_26443 ?auto_26444 ) ) ( not ( = ?auto_26443 ?auto_26457 ) ) ( not ( = ?auto_26444 ?auto_26457 ) ) ( not ( = ?auto_26454 ?auto_26465 ) ) ( IS-CRATE ?auto_26443 ) ( AVAILABLE ?auto_26470 ) ( SURFACE-AT ?auto_26443 ?auto_26468 ) ( ON ?auto_26443 ?auto_26467 ) ( CLEAR ?auto_26443 ) ( not ( = ?auto_26442 ?auto_26443 ) ) ( not ( = ?auto_26442 ?auto_26467 ) ) ( not ( = ?auto_26443 ?auto_26467 ) ) ( SURFACE-AT ?auto_26441 ?auto_26453 ) ( CLEAR ?auto_26441 ) ( IS-CRATE ?auto_26442 ) ( AVAILABLE ?auto_26454 ) ( not ( = ?auto_26459 ?auto_26453 ) ) ( HOIST-AT ?auto_26461 ?auto_26459 ) ( AVAILABLE ?auto_26461 ) ( SURFACE-AT ?auto_26442 ?auto_26459 ) ( ON ?auto_26442 ?auto_26458 ) ( CLEAR ?auto_26442 ) ( TRUCK-AT ?auto_26451 ?auto_26453 ) ( not ( = ?auto_26441 ?auto_26442 ) ) ( not ( = ?auto_26441 ?auto_26458 ) ) ( not ( = ?auto_26442 ?auto_26458 ) ) ( not ( = ?auto_26454 ?auto_26461 ) ) ( not ( = ?auto_26441 ?auto_26443 ) ) ( not ( = ?auto_26441 ?auto_26467 ) ) ( not ( = ?auto_26443 ?auto_26458 ) ) ( not ( = ?auto_26468 ?auto_26459 ) ) ( not ( = ?auto_26470 ?auto_26461 ) ) ( not ( = ?auto_26467 ?auto_26458 ) ) ( not ( = ?auto_26441 ?auto_26444 ) ) ( not ( = ?auto_26441 ?auto_26457 ) ) ( not ( = ?auto_26442 ?auto_26444 ) ) ( not ( = ?auto_26442 ?auto_26457 ) ) ( not ( = ?auto_26444 ?auto_26467 ) ) ( not ( = ?auto_26444 ?auto_26458 ) ) ( not ( = ?auto_26469 ?auto_26468 ) ) ( not ( = ?auto_26469 ?auto_26459 ) ) ( not ( = ?auto_26465 ?auto_26470 ) ) ( not ( = ?auto_26465 ?auto_26461 ) ) ( not ( = ?auto_26457 ?auto_26467 ) ) ( not ( = ?auto_26457 ?auto_26458 ) ) ( not ( = ?auto_26441 ?auto_26445 ) ) ( not ( = ?auto_26441 ?auto_26464 ) ) ( not ( = ?auto_26442 ?auto_26445 ) ) ( not ( = ?auto_26442 ?auto_26464 ) ) ( not ( = ?auto_26443 ?auto_26445 ) ) ( not ( = ?auto_26443 ?auto_26464 ) ) ( not ( = ?auto_26445 ?auto_26457 ) ) ( not ( = ?auto_26445 ?auto_26467 ) ) ( not ( = ?auto_26445 ?auto_26458 ) ) ( not ( = ?auto_26464 ?auto_26457 ) ) ( not ( = ?auto_26464 ?auto_26467 ) ) ( not ( = ?auto_26464 ?auto_26458 ) ) ( not ( = ?auto_26441 ?auto_26446 ) ) ( not ( = ?auto_26441 ?auto_26463 ) ) ( not ( = ?auto_26442 ?auto_26446 ) ) ( not ( = ?auto_26442 ?auto_26463 ) ) ( not ( = ?auto_26443 ?auto_26446 ) ) ( not ( = ?auto_26443 ?auto_26463 ) ) ( not ( = ?auto_26444 ?auto_26446 ) ) ( not ( = ?auto_26444 ?auto_26463 ) ) ( not ( = ?auto_26446 ?auto_26464 ) ) ( not ( = ?auto_26446 ?auto_26457 ) ) ( not ( = ?auto_26446 ?auto_26467 ) ) ( not ( = ?auto_26446 ?auto_26458 ) ) ( not ( = ?auto_26460 ?auto_26468 ) ) ( not ( = ?auto_26460 ?auto_26469 ) ) ( not ( = ?auto_26460 ?auto_26459 ) ) ( not ( = ?auto_26455 ?auto_26470 ) ) ( not ( = ?auto_26455 ?auto_26465 ) ) ( not ( = ?auto_26455 ?auto_26461 ) ) ( not ( = ?auto_26463 ?auto_26464 ) ) ( not ( = ?auto_26463 ?auto_26457 ) ) ( not ( = ?auto_26463 ?auto_26467 ) ) ( not ( = ?auto_26463 ?auto_26458 ) ) ( not ( = ?auto_26441 ?auto_26447 ) ) ( not ( = ?auto_26441 ?auto_26466 ) ) ( not ( = ?auto_26442 ?auto_26447 ) ) ( not ( = ?auto_26442 ?auto_26466 ) ) ( not ( = ?auto_26443 ?auto_26447 ) ) ( not ( = ?auto_26443 ?auto_26466 ) ) ( not ( = ?auto_26444 ?auto_26447 ) ) ( not ( = ?auto_26444 ?auto_26466 ) ) ( not ( = ?auto_26445 ?auto_26447 ) ) ( not ( = ?auto_26445 ?auto_26466 ) ) ( not ( = ?auto_26447 ?auto_26463 ) ) ( not ( = ?auto_26447 ?auto_26464 ) ) ( not ( = ?auto_26447 ?auto_26457 ) ) ( not ( = ?auto_26447 ?auto_26467 ) ) ( not ( = ?auto_26447 ?auto_26458 ) ) ( not ( = ?auto_26456 ?auto_26460 ) ) ( not ( = ?auto_26456 ?auto_26468 ) ) ( not ( = ?auto_26456 ?auto_26469 ) ) ( not ( = ?auto_26456 ?auto_26459 ) ) ( not ( = ?auto_26462 ?auto_26455 ) ) ( not ( = ?auto_26462 ?auto_26470 ) ) ( not ( = ?auto_26462 ?auto_26465 ) ) ( not ( = ?auto_26462 ?auto_26461 ) ) ( not ( = ?auto_26466 ?auto_26463 ) ) ( not ( = ?auto_26466 ?auto_26464 ) ) ( not ( = ?auto_26466 ?auto_26457 ) ) ( not ( = ?auto_26466 ?auto_26467 ) ) ( not ( = ?auto_26466 ?auto_26458 ) ) ( not ( = ?auto_26441 ?auto_26448 ) ) ( not ( = ?auto_26441 ?auto_26450 ) ) ( not ( = ?auto_26442 ?auto_26448 ) ) ( not ( = ?auto_26442 ?auto_26450 ) ) ( not ( = ?auto_26443 ?auto_26448 ) ) ( not ( = ?auto_26443 ?auto_26450 ) ) ( not ( = ?auto_26444 ?auto_26448 ) ) ( not ( = ?auto_26444 ?auto_26450 ) ) ( not ( = ?auto_26445 ?auto_26448 ) ) ( not ( = ?auto_26445 ?auto_26450 ) ) ( not ( = ?auto_26446 ?auto_26448 ) ) ( not ( = ?auto_26446 ?auto_26450 ) ) ( not ( = ?auto_26448 ?auto_26466 ) ) ( not ( = ?auto_26448 ?auto_26463 ) ) ( not ( = ?auto_26448 ?auto_26464 ) ) ( not ( = ?auto_26448 ?auto_26457 ) ) ( not ( = ?auto_26448 ?auto_26467 ) ) ( not ( = ?auto_26448 ?auto_26458 ) ) ( not ( = ?auto_26449 ?auto_26456 ) ) ( not ( = ?auto_26449 ?auto_26460 ) ) ( not ( = ?auto_26449 ?auto_26468 ) ) ( not ( = ?auto_26449 ?auto_26469 ) ) ( not ( = ?auto_26449 ?auto_26459 ) ) ( not ( = ?auto_26452 ?auto_26462 ) ) ( not ( = ?auto_26452 ?auto_26455 ) ) ( not ( = ?auto_26452 ?auto_26470 ) ) ( not ( = ?auto_26452 ?auto_26465 ) ) ( not ( = ?auto_26452 ?auto_26461 ) ) ( not ( = ?auto_26450 ?auto_26466 ) ) ( not ( = ?auto_26450 ?auto_26463 ) ) ( not ( = ?auto_26450 ?auto_26464 ) ) ( not ( = ?auto_26450 ?auto_26457 ) ) ( not ( = ?auto_26450 ?auto_26467 ) ) ( not ( = ?auto_26450 ?auto_26458 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_26441 ?auto_26442 ?auto_26443 ?auto_26444 ?auto_26445 ?auto_26446 ?auto_26447 )
      ( MAKE-1CRATE ?auto_26447 ?auto_26448 )
      ( MAKE-7CRATE-VERIFY ?auto_26441 ?auto_26442 ?auto_26443 ?auto_26444 ?auto_26445 ?auto_26446 ?auto_26447 ?auto_26448 ) )
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
      ?auto_26497 - SURFACE
      ?auto_26498 - SURFACE
    )
    :vars
    (
      ?auto_26503 - HOIST
      ?auto_26499 - PLACE
      ?auto_26501 - PLACE
      ?auto_26504 - HOIST
      ?auto_26502 - SURFACE
      ?auto_26507 - PLACE
      ?auto_26523 - HOIST
      ?auto_26522 - SURFACE
      ?auto_26511 - PLACE
      ?auto_26518 - HOIST
      ?auto_26515 - SURFACE
      ?auto_26520 - PLACE
      ?auto_26509 - HOIST
      ?auto_26512 - SURFACE
      ?auto_26517 - PLACE
      ?auto_26505 - HOIST
      ?auto_26514 - SURFACE
      ?auto_26508 - PLACE
      ?auto_26513 - HOIST
      ?auto_26510 - SURFACE
      ?auto_26516 - SURFACE
      ?auto_26521 - PLACE
      ?auto_26519 - HOIST
      ?auto_26506 - SURFACE
      ?auto_26500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26503 ?auto_26499 ) ( IS-CRATE ?auto_26498 ) ( not ( = ?auto_26501 ?auto_26499 ) ) ( HOIST-AT ?auto_26504 ?auto_26501 ) ( AVAILABLE ?auto_26504 ) ( SURFACE-AT ?auto_26498 ?auto_26501 ) ( ON ?auto_26498 ?auto_26502 ) ( CLEAR ?auto_26498 ) ( not ( = ?auto_26497 ?auto_26498 ) ) ( not ( = ?auto_26497 ?auto_26502 ) ) ( not ( = ?auto_26498 ?auto_26502 ) ) ( not ( = ?auto_26503 ?auto_26504 ) ) ( IS-CRATE ?auto_26497 ) ( not ( = ?auto_26507 ?auto_26499 ) ) ( HOIST-AT ?auto_26523 ?auto_26507 ) ( AVAILABLE ?auto_26523 ) ( SURFACE-AT ?auto_26497 ?auto_26507 ) ( ON ?auto_26497 ?auto_26522 ) ( CLEAR ?auto_26497 ) ( not ( = ?auto_26496 ?auto_26497 ) ) ( not ( = ?auto_26496 ?auto_26522 ) ) ( not ( = ?auto_26497 ?auto_26522 ) ) ( not ( = ?auto_26503 ?auto_26523 ) ) ( IS-CRATE ?auto_26496 ) ( not ( = ?auto_26511 ?auto_26499 ) ) ( HOIST-AT ?auto_26518 ?auto_26511 ) ( AVAILABLE ?auto_26518 ) ( SURFACE-AT ?auto_26496 ?auto_26511 ) ( ON ?auto_26496 ?auto_26515 ) ( CLEAR ?auto_26496 ) ( not ( = ?auto_26495 ?auto_26496 ) ) ( not ( = ?auto_26495 ?auto_26515 ) ) ( not ( = ?auto_26496 ?auto_26515 ) ) ( not ( = ?auto_26503 ?auto_26518 ) ) ( IS-CRATE ?auto_26495 ) ( not ( = ?auto_26520 ?auto_26499 ) ) ( HOIST-AT ?auto_26509 ?auto_26520 ) ( AVAILABLE ?auto_26509 ) ( SURFACE-AT ?auto_26495 ?auto_26520 ) ( ON ?auto_26495 ?auto_26512 ) ( CLEAR ?auto_26495 ) ( not ( = ?auto_26494 ?auto_26495 ) ) ( not ( = ?auto_26494 ?auto_26512 ) ) ( not ( = ?auto_26495 ?auto_26512 ) ) ( not ( = ?auto_26503 ?auto_26509 ) ) ( IS-CRATE ?auto_26494 ) ( not ( = ?auto_26517 ?auto_26499 ) ) ( HOIST-AT ?auto_26505 ?auto_26517 ) ( SURFACE-AT ?auto_26494 ?auto_26517 ) ( ON ?auto_26494 ?auto_26514 ) ( CLEAR ?auto_26494 ) ( not ( = ?auto_26493 ?auto_26494 ) ) ( not ( = ?auto_26493 ?auto_26514 ) ) ( not ( = ?auto_26494 ?auto_26514 ) ) ( not ( = ?auto_26503 ?auto_26505 ) ) ( IS-CRATE ?auto_26493 ) ( not ( = ?auto_26508 ?auto_26499 ) ) ( HOIST-AT ?auto_26513 ?auto_26508 ) ( AVAILABLE ?auto_26513 ) ( SURFACE-AT ?auto_26493 ?auto_26508 ) ( ON ?auto_26493 ?auto_26510 ) ( CLEAR ?auto_26493 ) ( not ( = ?auto_26492 ?auto_26493 ) ) ( not ( = ?auto_26492 ?auto_26510 ) ) ( not ( = ?auto_26493 ?auto_26510 ) ) ( not ( = ?auto_26503 ?auto_26513 ) ) ( IS-CRATE ?auto_26492 ) ( AVAILABLE ?auto_26505 ) ( SURFACE-AT ?auto_26492 ?auto_26517 ) ( ON ?auto_26492 ?auto_26516 ) ( CLEAR ?auto_26492 ) ( not ( = ?auto_26491 ?auto_26492 ) ) ( not ( = ?auto_26491 ?auto_26516 ) ) ( not ( = ?auto_26492 ?auto_26516 ) ) ( SURFACE-AT ?auto_26490 ?auto_26499 ) ( CLEAR ?auto_26490 ) ( IS-CRATE ?auto_26491 ) ( AVAILABLE ?auto_26503 ) ( not ( = ?auto_26521 ?auto_26499 ) ) ( HOIST-AT ?auto_26519 ?auto_26521 ) ( AVAILABLE ?auto_26519 ) ( SURFACE-AT ?auto_26491 ?auto_26521 ) ( ON ?auto_26491 ?auto_26506 ) ( CLEAR ?auto_26491 ) ( TRUCK-AT ?auto_26500 ?auto_26499 ) ( not ( = ?auto_26490 ?auto_26491 ) ) ( not ( = ?auto_26490 ?auto_26506 ) ) ( not ( = ?auto_26491 ?auto_26506 ) ) ( not ( = ?auto_26503 ?auto_26519 ) ) ( not ( = ?auto_26490 ?auto_26492 ) ) ( not ( = ?auto_26490 ?auto_26516 ) ) ( not ( = ?auto_26492 ?auto_26506 ) ) ( not ( = ?auto_26517 ?auto_26521 ) ) ( not ( = ?auto_26505 ?auto_26519 ) ) ( not ( = ?auto_26516 ?auto_26506 ) ) ( not ( = ?auto_26490 ?auto_26493 ) ) ( not ( = ?auto_26490 ?auto_26510 ) ) ( not ( = ?auto_26491 ?auto_26493 ) ) ( not ( = ?auto_26491 ?auto_26510 ) ) ( not ( = ?auto_26493 ?auto_26516 ) ) ( not ( = ?auto_26493 ?auto_26506 ) ) ( not ( = ?auto_26508 ?auto_26517 ) ) ( not ( = ?auto_26508 ?auto_26521 ) ) ( not ( = ?auto_26513 ?auto_26505 ) ) ( not ( = ?auto_26513 ?auto_26519 ) ) ( not ( = ?auto_26510 ?auto_26516 ) ) ( not ( = ?auto_26510 ?auto_26506 ) ) ( not ( = ?auto_26490 ?auto_26494 ) ) ( not ( = ?auto_26490 ?auto_26514 ) ) ( not ( = ?auto_26491 ?auto_26494 ) ) ( not ( = ?auto_26491 ?auto_26514 ) ) ( not ( = ?auto_26492 ?auto_26494 ) ) ( not ( = ?auto_26492 ?auto_26514 ) ) ( not ( = ?auto_26494 ?auto_26510 ) ) ( not ( = ?auto_26494 ?auto_26516 ) ) ( not ( = ?auto_26494 ?auto_26506 ) ) ( not ( = ?auto_26514 ?auto_26510 ) ) ( not ( = ?auto_26514 ?auto_26516 ) ) ( not ( = ?auto_26514 ?auto_26506 ) ) ( not ( = ?auto_26490 ?auto_26495 ) ) ( not ( = ?auto_26490 ?auto_26512 ) ) ( not ( = ?auto_26491 ?auto_26495 ) ) ( not ( = ?auto_26491 ?auto_26512 ) ) ( not ( = ?auto_26492 ?auto_26495 ) ) ( not ( = ?auto_26492 ?auto_26512 ) ) ( not ( = ?auto_26493 ?auto_26495 ) ) ( not ( = ?auto_26493 ?auto_26512 ) ) ( not ( = ?auto_26495 ?auto_26514 ) ) ( not ( = ?auto_26495 ?auto_26510 ) ) ( not ( = ?auto_26495 ?auto_26516 ) ) ( not ( = ?auto_26495 ?auto_26506 ) ) ( not ( = ?auto_26520 ?auto_26517 ) ) ( not ( = ?auto_26520 ?auto_26508 ) ) ( not ( = ?auto_26520 ?auto_26521 ) ) ( not ( = ?auto_26509 ?auto_26505 ) ) ( not ( = ?auto_26509 ?auto_26513 ) ) ( not ( = ?auto_26509 ?auto_26519 ) ) ( not ( = ?auto_26512 ?auto_26514 ) ) ( not ( = ?auto_26512 ?auto_26510 ) ) ( not ( = ?auto_26512 ?auto_26516 ) ) ( not ( = ?auto_26512 ?auto_26506 ) ) ( not ( = ?auto_26490 ?auto_26496 ) ) ( not ( = ?auto_26490 ?auto_26515 ) ) ( not ( = ?auto_26491 ?auto_26496 ) ) ( not ( = ?auto_26491 ?auto_26515 ) ) ( not ( = ?auto_26492 ?auto_26496 ) ) ( not ( = ?auto_26492 ?auto_26515 ) ) ( not ( = ?auto_26493 ?auto_26496 ) ) ( not ( = ?auto_26493 ?auto_26515 ) ) ( not ( = ?auto_26494 ?auto_26496 ) ) ( not ( = ?auto_26494 ?auto_26515 ) ) ( not ( = ?auto_26496 ?auto_26512 ) ) ( not ( = ?auto_26496 ?auto_26514 ) ) ( not ( = ?auto_26496 ?auto_26510 ) ) ( not ( = ?auto_26496 ?auto_26516 ) ) ( not ( = ?auto_26496 ?auto_26506 ) ) ( not ( = ?auto_26511 ?auto_26520 ) ) ( not ( = ?auto_26511 ?auto_26517 ) ) ( not ( = ?auto_26511 ?auto_26508 ) ) ( not ( = ?auto_26511 ?auto_26521 ) ) ( not ( = ?auto_26518 ?auto_26509 ) ) ( not ( = ?auto_26518 ?auto_26505 ) ) ( not ( = ?auto_26518 ?auto_26513 ) ) ( not ( = ?auto_26518 ?auto_26519 ) ) ( not ( = ?auto_26515 ?auto_26512 ) ) ( not ( = ?auto_26515 ?auto_26514 ) ) ( not ( = ?auto_26515 ?auto_26510 ) ) ( not ( = ?auto_26515 ?auto_26516 ) ) ( not ( = ?auto_26515 ?auto_26506 ) ) ( not ( = ?auto_26490 ?auto_26497 ) ) ( not ( = ?auto_26490 ?auto_26522 ) ) ( not ( = ?auto_26491 ?auto_26497 ) ) ( not ( = ?auto_26491 ?auto_26522 ) ) ( not ( = ?auto_26492 ?auto_26497 ) ) ( not ( = ?auto_26492 ?auto_26522 ) ) ( not ( = ?auto_26493 ?auto_26497 ) ) ( not ( = ?auto_26493 ?auto_26522 ) ) ( not ( = ?auto_26494 ?auto_26497 ) ) ( not ( = ?auto_26494 ?auto_26522 ) ) ( not ( = ?auto_26495 ?auto_26497 ) ) ( not ( = ?auto_26495 ?auto_26522 ) ) ( not ( = ?auto_26497 ?auto_26515 ) ) ( not ( = ?auto_26497 ?auto_26512 ) ) ( not ( = ?auto_26497 ?auto_26514 ) ) ( not ( = ?auto_26497 ?auto_26510 ) ) ( not ( = ?auto_26497 ?auto_26516 ) ) ( not ( = ?auto_26497 ?auto_26506 ) ) ( not ( = ?auto_26507 ?auto_26511 ) ) ( not ( = ?auto_26507 ?auto_26520 ) ) ( not ( = ?auto_26507 ?auto_26517 ) ) ( not ( = ?auto_26507 ?auto_26508 ) ) ( not ( = ?auto_26507 ?auto_26521 ) ) ( not ( = ?auto_26523 ?auto_26518 ) ) ( not ( = ?auto_26523 ?auto_26509 ) ) ( not ( = ?auto_26523 ?auto_26505 ) ) ( not ( = ?auto_26523 ?auto_26513 ) ) ( not ( = ?auto_26523 ?auto_26519 ) ) ( not ( = ?auto_26522 ?auto_26515 ) ) ( not ( = ?auto_26522 ?auto_26512 ) ) ( not ( = ?auto_26522 ?auto_26514 ) ) ( not ( = ?auto_26522 ?auto_26510 ) ) ( not ( = ?auto_26522 ?auto_26516 ) ) ( not ( = ?auto_26522 ?auto_26506 ) ) ( not ( = ?auto_26490 ?auto_26498 ) ) ( not ( = ?auto_26490 ?auto_26502 ) ) ( not ( = ?auto_26491 ?auto_26498 ) ) ( not ( = ?auto_26491 ?auto_26502 ) ) ( not ( = ?auto_26492 ?auto_26498 ) ) ( not ( = ?auto_26492 ?auto_26502 ) ) ( not ( = ?auto_26493 ?auto_26498 ) ) ( not ( = ?auto_26493 ?auto_26502 ) ) ( not ( = ?auto_26494 ?auto_26498 ) ) ( not ( = ?auto_26494 ?auto_26502 ) ) ( not ( = ?auto_26495 ?auto_26498 ) ) ( not ( = ?auto_26495 ?auto_26502 ) ) ( not ( = ?auto_26496 ?auto_26498 ) ) ( not ( = ?auto_26496 ?auto_26502 ) ) ( not ( = ?auto_26498 ?auto_26522 ) ) ( not ( = ?auto_26498 ?auto_26515 ) ) ( not ( = ?auto_26498 ?auto_26512 ) ) ( not ( = ?auto_26498 ?auto_26514 ) ) ( not ( = ?auto_26498 ?auto_26510 ) ) ( not ( = ?auto_26498 ?auto_26516 ) ) ( not ( = ?auto_26498 ?auto_26506 ) ) ( not ( = ?auto_26501 ?auto_26507 ) ) ( not ( = ?auto_26501 ?auto_26511 ) ) ( not ( = ?auto_26501 ?auto_26520 ) ) ( not ( = ?auto_26501 ?auto_26517 ) ) ( not ( = ?auto_26501 ?auto_26508 ) ) ( not ( = ?auto_26501 ?auto_26521 ) ) ( not ( = ?auto_26504 ?auto_26523 ) ) ( not ( = ?auto_26504 ?auto_26518 ) ) ( not ( = ?auto_26504 ?auto_26509 ) ) ( not ( = ?auto_26504 ?auto_26505 ) ) ( not ( = ?auto_26504 ?auto_26513 ) ) ( not ( = ?auto_26504 ?auto_26519 ) ) ( not ( = ?auto_26502 ?auto_26522 ) ) ( not ( = ?auto_26502 ?auto_26515 ) ) ( not ( = ?auto_26502 ?auto_26512 ) ) ( not ( = ?auto_26502 ?auto_26514 ) ) ( not ( = ?auto_26502 ?auto_26510 ) ) ( not ( = ?auto_26502 ?auto_26516 ) ) ( not ( = ?auto_26502 ?auto_26506 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_26490 ?auto_26491 ?auto_26492 ?auto_26493 ?auto_26494 ?auto_26495 ?auto_26496 ?auto_26497 )
      ( MAKE-1CRATE ?auto_26497 ?auto_26498 )
      ( MAKE-8CRATE-VERIFY ?auto_26490 ?auto_26491 ?auto_26492 ?auto_26493 ?auto_26494 ?auto_26495 ?auto_26496 ?auto_26497 ?auto_26498 ) )
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
      ?auto_26551 - SURFACE
      ?auto_26552 - SURFACE
      ?auto_26553 - SURFACE
    )
    :vars
    (
      ?auto_26556 - HOIST
      ?auto_26555 - PLACE
      ?auto_26558 - PLACE
      ?auto_26559 - HOIST
      ?auto_26557 - SURFACE
      ?auto_26564 - PLACE
      ?auto_26568 - HOIST
      ?auto_26561 - SURFACE
      ?auto_26567 - PLACE
      ?auto_26566 - HOIST
      ?auto_26562 - SURFACE
      ?auto_26576 - PLACE
      ?auto_26574 - HOIST
      ?auto_26571 - SURFACE
      ?auto_26569 - PLACE
      ?auto_26578 - HOIST
      ?auto_26575 - SURFACE
      ?auto_26573 - PLACE
      ?auto_26579 - HOIST
      ?auto_26570 - SURFACE
      ?auto_26560 - PLACE
      ?auto_26563 - HOIST
      ?auto_26577 - SURFACE
      ?auto_26572 - SURFACE
      ?auto_26565 - SURFACE
      ?auto_26554 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26556 ?auto_26555 ) ( IS-CRATE ?auto_26553 ) ( not ( = ?auto_26558 ?auto_26555 ) ) ( HOIST-AT ?auto_26559 ?auto_26558 ) ( SURFACE-AT ?auto_26553 ?auto_26558 ) ( ON ?auto_26553 ?auto_26557 ) ( CLEAR ?auto_26553 ) ( not ( = ?auto_26552 ?auto_26553 ) ) ( not ( = ?auto_26552 ?auto_26557 ) ) ( not ( = ?auto_26553 ?auto_26557 ) ) ( not ( = ?auto_26556 ?auto_26559 ) ) ( IS-CRATE ?auto_26552 ) ( not ( = ?auto_26564 ?auto_26555 ) ) ( HOIST-AT ?auto_26568 ?auto_26564 ) ( AVAILABLE ?auto_26568 ) ( SURFACE-AT ?auto_26552 ?auto_26564 ) ( ON ?auto_26552 ?auto_26561 ) ( CLEAR ?auto_26552 ) ( not ( = ?auto_26551 ?auto_26552 ) ) ( not ( = ?auto_26551 ?auto_26561 ) ) ( not ( = ?auto_26552 ?auto_26561 ) ) ( not ( = ?auto_26556 ?auto_26568 ) ) ( IS-CRATE ?auto_26551 ) ( not ( = ?auto_26567 ?auto_26555 ) ) ( HOIST-AT ?auto_26566 ?auto_26567 ) ( AVAILABLE ?auto_26566 ) ( SURFACE-AT ?auto_26551 ?auto_26567 ) ( ON ?auto_26551 ?auto_26562 ) ( CLEAR ?auto_26551 ) ( not ( = ?auto_26550 ?auto_26551 ) ) ( not ( = ?auto_26550 ?auto_26562 ) ) ( not ( = ?auto_26551 ?auto_26562 ) ) ( not ( = ?auto_26556 ?auto_26566 ) ) ( IS-CRATE ?auto_26550 ) ( not ( = ?auto_26576 ?auto_26555 ) ) ( HOIST-AT ?auto_26574 ?auto_26576 ) ( AVAILABLE ?auto_26574 ) ( SURFACE-AT ?auto_26550 ?auto_26576 ) ( ON ?auto_26550 ?auto_26571 ) ( CLEAR ?auto_26550 ) ( not ( = ?auto_26549 ?auto_26550 ) ) ( not ( = ?auto_26549 ?auto_26571 ) ) ( not ( = ?auto_26550 ?auto_26571 ) ) ( not ( = ?auto_26556 ?auto_26574 ) ) ( IS-CRATE ?auto_26549 ) ( not ( = ?auto_26569 ?auto_26555 ) ) ( HOIST-AT ?auto_26578 ?auto_26569 ) ( AVAILABLE ?auto_26578 ) ( SURFACE-AT ?auto_26549 ?auto_26569 ) ( ON ?auto_26549 ?auto_26575 ) ( CLEAR ?auto_26549 ) ( not ( = ?auto_26548 ?auto_26549 ) ) ( not ( = ?auto_26548 ?auto_26575 ) ) ( not ( = ?auto_26549 ?auto_26575 ) ) ( not ( = ?auto_26556 ?auto_26578 ) ) ( IS-CRATE ?auto_26548 ) ( not ( = ?auto_26573 ?auto_26555 ) ) ( HOIST-AT ?auto_26579 ?auto_26573 ) ( SURFACE-AT ?auto_26548 ?auto_26573 ) ( ON ?auto_26548 ?auto_26570 ) ( CLEAR ?auto_26548 ) ( not ( = ?auto_26547 ?auto_26548 ) ) ( not ( = ?auto_26547 ?auto_26570 ) ) ( not ( = ?auto_26548 ?auto_26570 ) ) ( not ( = ?auto_26556 ?auto_26579 ) ) ( IS-CRATE ?auto_26547 ) ( not ( = ?auto_26560 ?auto_26555 ) ) ( HOIST-AT ?auto_26563 ?auto_26560 ) ( AVAILABLE ?auto_26563 ) ( SURFACE-AT ?auto_26547 ?auto_26560 ) ( ON ?auto_26547 ?auto_26577 ) ( CLEAR ?auto_26547 ) ( not ( = ?auto_26546 ?auto_26547 ) ) ( not ( = ?auto_26546 ?auto_26577 ) ) ( not ( = ?auto_26547 ?auto_26577 ) ) ( not ( = ?auto_26556 ?auto_26563 ) ) ( IS-CRATE ?auto_26546 ) ( AVAILABLE ?auto_26579 ) ( SURFACE-AT ?auto_26546 ?auto_26573 ) ( ON ?auto_26546 ?auto_26572 ) ( CLEAR ?auto_26546 ) ( not ( = ?auto_26545 ?auto_26546 ) ) ( not ( = ?auto_26545 ?auto_26572 ) ) ( not ( = ?auto_26546 ?auto_26572 ) ) ( SURFACE-AT ?auto_26544 ?auto_26555 ) ( CLEAR ?auto_26544 ) ( IS-CRATE ?auto_26545 ) ( AVAILABLE ?auto_26556 ) ( AVAILABLE ?auto_26559 ) ( SURFACE-AT ?auto_26545 ?auto_26558 ) ( ON ?auto_26545 ?auto_26565 ) ( CLEAR ?auto_26545 ) ( TRUCK-AT ?auto_26554 ?auto_26555 ) ( not ( = ?auto_26544 ?auto_26545 ) ) ( not ( = ?auto_26544 ?auto_26565 ) ) ( not ( = ?auto_26545 ?auto_26565 ) ) ( not ( = ?auto_26544 ?auto_26546 ) ) ( not ( = ?auto_26544 ?auto_26572 ) ) ( not ( = ?auto_26546 ?auto_26565 ) ) ( not ( = ?auto_26573 ?auto_26558 ) ) ( not ( = ?auto_26579 ?auto_26559 ) ) ( not ( = ?auto_26572 ?auto_26565 ) ) ( not ( = ?auto_26544 ?auto_26547 ) ) ( not ( = ?auto_26544 ?auto_26577 ) ) ( not ( = ?auto_26545 ?auto_26547 ) ) ( not ( = ?auto_26545 ?auto_26577 ) ) ( not ( = ?auto_26547 ?auto_26572 ) ) ( not ( = ?auto_26547 ?auto_26565 ) ) ( not ( = ?auto_26560 ?auto_26573 ) ) ( not ( = ?auto_26560 ?auto_26558 ) ) ( not ( = ?auto_26563 ?auto_26579 ) ) ( not ( = ?auto_26563 ?auto_26559 ) ) ( not ( = ?auto_26577 ?auto_26572 ) ) ( not ( = ?auto_26577 ?auto_26565 ) ) ( not ( = ?auto_26544 ?auto_26548 ) ) ( not ( = ?auto_26544 ?auto_26570 ) ) ( not ( = ?auto_26545 ?auto_26548 ) ) ( not ( = ?auto_26545 ?auto_26570 ) ) ( not ( = ?auto_26546 ?auto_26548 ) ) ( not ( = ?auto_26546 ?auto_26570 ) ) ( not ( = ?auto_26548 ?auto_26577 ) ) ( not ( = ?auto_26548 ?auto_26572 ) ) ( not ( = ?auto_26548 ?auto_26565 ) ) ( not ( = ?auto_26570 ?auto_26577 ) ) ( not ( = ?auto_26570 ?auto_26572 ) ) ( not ( = ?auto_26570 ?auto_26565 ) ) ( not ( = ?auto_26544 ?auto_26549 ) ) ( not ( = ?auto_26544 ?auto_26575 ) ) ( not ( = ?auto_26545 ?auto_26549 ) ) ( not ( = ?auto_26545 ?auto_26575 ) ) ( not ( = ?auto_26546 ?auto_26549 ) ) ( not ( = ?auto_26546 ?auto_26575 ) ) ( not ( = ?auto_26547 ?auto_26549 ) ) ( not ( = ?auto_26547 ?auto_26575 ) ) ( not ( = ?auto_26549 ?auto_26570 ) ) ( not ( = ?auto_26549 ?auto_26577 ) ) ( not ( = ?auto_26549 ?auto_26572 ) ) ( not ( = ?auto_26549 ?auto_26565 ) ) ( not ( = ?auto_26569 ?auto_26573 ) ) ( not ( = ?auto_26569 ?auto_26560 ) ) ( not ( = ?auto_26569 ?auto_26558 ) ) ( not ( = ?auto_26578 ?auto_26579 ) ) ( not ( = ?auto_26578 ?auto_26563 ) ) ( not ( = ?auto_26578 ?auto_26559 ) ) ( not ( = ?auto_26575 ?auto_26570 ) ) ( not ( = ?auto_26575 ?auto_26577 ) ) ( not ( = ?auto_26575 ?auto_26572 ) ) ( not ( = ?auto_26575 ?auto_26565 ) ) ( not ( = ?auto_26544 ?auto_26550 ) ) ( not ( = ?auto_26544 ?auto_26571 ) ) ( not ( = ?auto_26545 ?auto_26550 ) ) ( not ( = ?auto_26545 ?auto_26571 ) ) ( not ( = ?auto_26546 ?auto_26550 ) ) ( not ( = ?auto_26546 ?auto_26571 ) ) ( not ( = ?auto_26547 ?auto_26550 ) ) ( not ( = ?auto_26547 ?auto_26571 ) ) ( not ( = ?auto_26548 ?auto_26550 ) ) ( not ( = ?auto_26548 ?auto_26571 ) ) ( not ( = ?auto_26550 ?auto_26575 ) ) ( not ( = ?auto_26550 ?auto_26570 ) ) ( not ( = ?auto_26550 ?auto_26577 ) ) ( not ( = ?auto_26550 ?auto_26572 ) ) ( not ( = ?auto_26550 ?auto_26565 ) ) ( not ( = ?auto_26576 ?auto_26569 ) ) ( not ( = ?auto_26576 ?auto_26573 ) ) ( not ( = ?auto_26576 ?auto_26560 ) ) ( not ( = ?auto_26576 ?auto_26558 ) ) ( not ( = ?auto_26574 ?auto_26578 ) ) ( not ( = ?auto_26574 ?auto_26579 ) ) ( not ( = ?auto_26574 ?auto_26563 ) ) ( not ( = ?auto_26574 ?auto_26559 ) ) ( not ( = ?auto_26571 ?auto_26575 ) ) ( not ( = ?auto_26571 ?auto_26570 ) ) ( not ( = ?auto_26571 ?auto_26577 ) ) ( not ( = ?auto_26571 ?auto_26572 ) ) ( not ( = ?auto_26571 ?auto_26565 ) ) ( not ( = ?auto_26544 ?auto_26551 ) ) ( not ( = ?auto_26544 ?auto_26562 ) ) ( not ( = ?auto_26545 ?auto_26551 ) ) ( not ( = ?auto_26545 ?auto_26562 ) ) ( not ( = ?auto_26546 ?auto_26551 ) ) ( not ( = ?auto_26546 ?auto_26562 ) ) ( not ( = ?auto_26547 ?auto_26551 ) ) ( not ( = ?auto_26547 ?auto_26562 ) ) ( not ( = ?auto_26548 ?auto_26551 ) ) ( not ( = ?auto_26548 ?auto_26562 ) ) ( not ( = ?auto_26549 ?auto_26551 ) ) ( not ( = ?auto_26549 ?auto_26562 ) ) ( not ( = ?auto_26551 ?auto_26571 ) ) ( not ( = ?auto_26551 ?auto_26575 ) ) ( not ( = ?auto_26551 ?auto_26570 ) ) ( not ( = ?auto_26551 ?auto_26577 ) ) ( not ( = ?auto_26551 ?auto_26572 ) ) ( not ( = ?auto_26551 ?auto_26565 ) ) ( not ( = ?auto_26567 ?auto_26576 ) ) ( not ( = ?auto_26567 ?auto_26569 ) ) ( not ( = ?auto_26567 ?auto_26573 ) ) ( not ( = ?auto_26567 ?auto_26560 ) ) ( not ( = ?auto_26567 ?auto_26558 ) ) ( not ( = ?auto_26566 ?auto_26574 ) ) ( not ( = ?auto_26566 ?auto_26578 ) ) ( not ( = ?auto_26566 ?auto_26579 ) ) ( not ( = ?auto_26566 ?auto_26563 ) ) ( not ( = ?auto_26566 ?auto_26559 ) ) ( not ( = ?auto_26562 ?auto_26571 ) ) ( not ( = ?auto_26562 ?auto_26575 ) ) ( not ( = ?auto_26562 ?auto_26570 ) ) ( not ( = ?auto_26562 ?auto_26577 ) ) ( not ( = ?auto_26562 ?auto_26572 ) ) ( not ( = ?auto_26562 ?auto_26565 ) ) ( not ( = ?auto_26544 ?auto_26552 ) ) ( not ( = ?auto_26544 ?auto_26561 ) ) ( not ( = ?auto_26545 ?auto_26552 ) ) ( not ( = ?auto_26545 ?auto_26561 ) ) ( not ( = ?auto_26546 ?auto_26552 ) ) ( not ( = ?auto_26546 ?auto_26561 ) ) ( not ( = ?auto_26547 ?auto_26552 ) ) ( not ( = ?auto_26547 ?auto_26561 ) ) ( not ( = ?auto_26548 ?auto_26552 ) ) ( not ( = ?auto_26548 ?auto_26561 ) ) ( not ( = ?auto_26549 ?auto_26552 ) ) ( not ( = ?auto_26549 ?auto_26561 ) ) ( not ( = ?auto_26550 ?auto_26552 ) ) ( not ( = ?auto_26550 ?auto_26561 ) ) ( not ( = ?auto_26552 ?auto_26562 ) ) ( not ( = ?auto_26552 ?auto_26571 ) ) ( not ( = ?auto_26552 ?auto_26575 ) ) ( not ( = ?auto_26552 ?auto_26570 ) ) ( not ( = ?auto_26552 ?auto_26577 ) ) ( not ( = ?auto_26552 ?auto_26572 ) ) ( not ( = ?auto_26552 ?auto_26565 ) ) ( not ( = ?auto_26564 ?auto_26567 ) ) ( not ( = ?auto_26564 ?auto_26576 ) ) ( not ( = ?auto_26564 ?auto_26569 ) ) ( not ( = ?auto_26564 ?auto_26573 ) ) ( not ( = ?auto_26564 ?auto_26560 ) ) ( not ( = ?auto_26564 ?auto_26558 ) ) ( not ( = ?auto_26568 ?auto_26566 ) ) ( not ( = ?auto_26568 ?auto_26574 ) ) ( not ( = ?auto_26568 ?auto_26578 ) ) ( not ( = ?auto_26568 ?auto_26579 ) ) ( not ( = ?auto_26568 ?auto_26563 ) ) ( not ( = ?auto_26568 ?auto_26559 ) ) ( not ( = ?auto_26561 ?auto_26562 ) ) ( not ( = ?auto_26561 ?auto_26571 ) ) ( not ( = ?auto_26561 ?auto_26575 ) ) ( not ( = ?auto_26561 ?auto_26570 ) ) ( not ( = ?auto_26561 ?auto_26577 ) ) ( not ( = ?auto_26561 ?auto_26572 ) ) ( not ( = ?auto_26561 ?auto_26565 ) ) ( not ( = ?auto_26544 ?auto_26553 ) ) ( not ( = ?auto_26544 ?auto_26557 ) ) ( not ( = ?auto_26545 ?auto_26553 ) ) ( not ( = ?auto_26545 ?auto_26557 ) ) ( not ( = ?auto_26546 ?auto_26553 ) ) ( not ( = ?auto_26546 ?auto_26557 ) ) ( not ( = ?auto_26547 ?auto_26553 ) ) ( not ( = ?auto_26547 ?auto_26557 ) ) ( not ( = ?auto_26548 ?auto_26553 ) ) ( not ( = ?auto_26548 ?auto_26557 ) ) ( not ( = ?auto_26549 ?auto_26553 ) ) ( not ( = ?auto_26549 ?auto_26557 ) ) ( not ( = ?auto_26550 ?auto_26553 ) ) ( not ( = ?auto_26550 ?auto_26557 ) ) ( not ( = ?auto_26551 ?auto_26553 ) ) ( not ( = ?auto_26551 ?auto_26557 ) ) ( not ( = ?auto_26553 ?auto_26561 ) ) ( not ( = ?auto_26553 ?auto_26562 ) ) ( not ( = ?auto_26553 ?auto_26571 ) ) ( not ( = ?auto_26553 ?auto_26575 ) ) ( not ( = ?auto_26553 ?auto_26570 ) ) ( not ( = ?auto_26553 ?auto_26577 ) ) ( not ( = ?auto_26553 ?auto_26572 ) ) ( not ( = ?auto_26553 ?auto_26565 ) ) ( not ( = ?auto_26557 ?auto_26561 ) ) ( not ( = ?auto_26557 ?auto_26562 ) ) ( not ( = ?auto_26557 ?auto_26571 ) ) ( not ( = ?auto_26557 ?auto_26575 ) ) ( not ( = ?auto_26557 ?auto_26570 ) ) ( not ( = ?auto_26557 ?auto_26577 ) ) ( not ( = ?auto_26557 ?auto_26572 ) ) ( not ( = ?auto_26557 ?auto_26565 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_26544 ?auto_26545 ?auto_26546 ?auto_26547 ?auto_26548 ?auto_26549 ?auto_26550 ?auto_26551 ?auto_26552 )
      ( MAKE-1CRATE ?auto_26552 ?auto_26553 )
      ( MAKE-9CRATE-VERIFY ?auto_26544 ?auto_26545 ?auto_26546 ?auto_26547 ?auto_26548 ?auto_26549 ?auto_26550 ?auto_26551 ?auto_26552 ?auto_26553 ) )
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
      ?auto_26608 - SURFACE
      ?auto_26609 - SURFACE
      ?auto_26610 - SURFACE
      ?auto_26611 - SURFACE
    )
    :vars
    (
      ?auto_26613 - HOIST
      ?auto_26612 - PLACE
      ?auto_26617 - PLACE
      ?auto_26616 - HOIST
      ?auto_26614 - SURFACE
      ?auto_26638 - PLACE
      ?auto_26637 - HOIST
      ?auto_26629 - SURFACE
      ?auto_26636 - PLACE
      ?auto_26631 - HOIST
      ?auto_26618 - SURFACE
      ?auto_26633 - PLACE
      ?auto_26634 - HOIST
      ?auto_26627 - SURFACE
      ?auto_26621 - PLACE
      ?auto_26620 - HOIST
      ?auto_26624 - SURFACE
      ?auto_26623 - PLACE
      ?auto_26619 - HOIST
      ?auto_26622 - SURFACE
      ?auto_26626 - PLACE
      ?auto_26628 - HOIST
      ?auto_26625 - SURFACE
      ?auto_26632 - SURFACE
      ?auto_26630 - SURFACE
      ?auto_26635 - SURFACE
      ?auto_26615 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26613 ?auto_26612 ) ( IS-CRATE ?auto_26611 ) ( not ( = ?auto_26617 ?auto_26612 ) ) ( HOIST-AT ?auto_26616 ?auto_26617 ) ( SURFACE-AT ?auto_26611 ?auto_26617 ) ( ON ?auto_26611 ?auto_26614 ) ( CLEAR ?auto_26611 ) ( not ( = ?auto_26610 ?auto_26611 ) ) ( not ( = ?auto_26610 ?auto_26614 ) ) ( not ( = ?auto_26611 ?auto_26614 ) ) ( not ( = ?auto_26613 ?auto_26616 ) ) ( IS-CRATE ?auto_26610 ) ( not ( = ?auto_26638 ?auto_26612 ) ) ( HOIST-AT ?auto_26637 ?auto_26638 ) ( SURFACE-AT ?auto_26610 ?auto_26638 ) ( ON ?auto_26610 ?auto_26629 ) ( CLEAR ?auto_26610 ) ( not ( = ?auto_26609 ?auto_26610 ) ) ( not ( = ?auto_26609 ?auto_26629 ) ) ( not ( = ?auto_26610 ?auto_26629 ) ) ( not ( = ?auto_26613 ?auto_26637 ) ) ( IS-CRATE ?auto_26609 ) ( not ( = ?auto_26636 ?auto_26612 ) ) ( HOIST-AT ?auto_26631 ?auto_26636 ) ( AVAILABLE ?auto_26631 ) ( SURFACE-AT ?auto_26609 ?auto_26636 ) ( ON ?auto_26609 ?auto_26618 ) ( CLEAR ?auto_26609 ) ( not ( = ?auto_26608 ?auto_26609 ) ) ( not ( = ?auto_26608 ?auto_26618 ) ) ( not ( = ?auto_26609 ?auto_26618 ) ) ( not ( = ?auto_26613 ?auto_26631 ) ) ( IS-CRATE ?auto_26608 ) ( not ( = ?auto_26633 ?auto_26612 ) ) ( HOIST-AT ?auto_26634 ?auto_26633 ) ( AVAILABLE ?auto_26634 ) ( SURFACE-AT ?auto_26608 ?auto_26633 ) ( ON ?auto_26608 ?auto_26627 ) ( CLEAR ?auto_26608 ) ( not ( = ?auto_26607 ?auto_26608 ) ) ( not ( = ?auto_26607 ?auto_26627 ) ) ( not ( = ?auto_26608 ?auto_26627 ) ) ( not ( = ?auto_26613 ?auto_26634 ) ) ( IS-CRATE ?auto_26607 ) ( not ( = ?auto_26621 ?auto_26612 ) ) ( HOIST-AT ?auto_26620 ?auto_26621 ) ( AVAILABLE ?auto_26620 ) ( SURFACE-AT ?auto_26607 ?auto_26621 ) ( ON ?auto_26607 ?auto_26624 ) ( CLEAR ?auto_26607 ) ( not ( = ?auto_26606 ?auto_26607 ) ) ( not ( = ?auto_26606 ?auto_26624 ) ) ( not ( = ?auto_26607 ?auto_26624 ) ) ( not ( = ?auto_26613 ?auto_26620 ) ) ( IS-CRATE ?auto_26606 ) ( not ( = ?auto_26623 ?auto_26612 ) ) ( HOIST-AT ?auto_26619 ?auto_26623 ) ( AVAILABLE ?auto_26619 ) ( SURFACE-AT ?auto_26606 ?auto_26623 ) ( ON ?auto_26606 ?auto_26622 ) ( CLEAR ?auto_26606 ) ( not ( = ?auto_26605 ?auto_26606 ) ) ( not ( = ?auto_26605 ?auto_26622 ) ) ( not ( = ?auto_26606 ?auto_26622 ) ) ( not ( = ?auto_26613 ?auto_26619 ) ) ( IS-CRATE ?auto_26605 ) ( not ( = ?auto_26626 ?auto_26612 ) ) ( HOIST-AT ?auto_26628 ?auto_26626 ) ( SURFACE-AT ?auto_26605 ?auto_26626 ) ( ON ?auto_26605 ?auto_26625 ) ( CLEAR ?auto_26605 ) ( not ( = ?auto_26604 ?auto_26605 ) ) ( not ( = ?auto_26604 ?auto_26625 ) ) ( not ( = ?auto_26605 ?auto_26625 ) ) ( not ( = ?auto_26613 ?auto_26628 ) ) ( IS-CRATE ?auto_26604 ) ( AVAILABLE ?auto_26616 ) ( SURFACE-AT ?auto_26604 ?auto_26617 ) ( ON ?auto_26604 ?auto_26632 ) ( CLEAR ?auto_26604 ) ( not ( = ?auto_26603 ?auto_26604 ) ) ( not ( = ?auto_26603 ?auto_26632 ) ) ( not ( = ?auto_26604 ?auto_26632 ) ) ( IS-CRATE ?auto_26603 ) ( AVAILABLE ?auto_26628 ) ( SURFACE-AT ?auto_26603 ?auto_26626 ) ( ON ?auto_26603 ?auto_26630 ) ( CLEAR ?auto_26603 ) ( not ( = ?auto_26602 ?auto_26603 ) ) ( not ( = ?auto_26602 ?auto_26630 ) ) ( not ( = ?auto_26603 ?auto_26630 ) ) ( SURFACE-AT ?auto_26601 ?auto_26612 ) ( CLEAR ?auto_26601 ) ( IS-CRATE ?auto_26602 ) ( AVAILABLE ?auto_26613 ) ( AVAILABLE ?auto_26637 ) ( SURFACE-AT ?auto_26602 ?auto_26638 ) ( ON ?auto_26602 ?auto_26635 ) ( CLEAR ?auto_26602 ) ( TRUCK-AT ?auto_26615 ?auto_26612 ) ( not ( = ?auto_26601 ?auto_26602 ) ) ( not ( = ?auto_26601 ?auto_26635 ) ) ( not ( = ?auto_26602 ?auto_26635 ) ) ( not ( = ?auto_26601 ?auto_26603 ) ) ( not ( = ?auto_26601 ?auto_26630 ) ) ( not ( = ?auto_26603 ?auto_26635 ) ) ( not ( = ?auto_26626 ?auto_26638 ) ) ( not ( = ?auto_26628 ?auto_26637 ) ) ( not ( = ?auto_26630 ?auto_26635 ) ) ( not ( = ?auto_26601 ?auto_26604 ) ) ( not ( = ?auto_26601 ?auto_26632 ) ) ( not ( = ?auto_26602 ?auto_26604 ) ) ( not ( = ?auto_26602 ?auto_26632 ) ) ( not ( = ?auto_26604 ?auto_26630 ) ) ( not ( = ?auto_26604 ?auto_26635 ) ) ( not ( = ?auto_26617 ?auto_26626 ) ) ( not ( = ?auto_26617 ?auto_26638 ) ) ( not ( = ?auto_26616 ?auto_26628 ) ) ( not ( = ?auto_26616 ?auto_26637 ) ) ( not ( = ?auto_26632 ?auto_26630 ) ) ( not ( = ?auto_26632 ?auto_26635 ) ) ( not ( = ?auto_26601 ?auto_26605 ) ) ( not ( = ?auto_26601 ?auto_26625 ) ) ( not ( = ?auto_26602 ?auto_26605 ) ) ( not ( = ?auto_26602 ?auto_26625 ) ) ( not ( = ?auto_26603 ?auto_26605 ) ) ( not ( = ?auto_26603 ?auto_26625 ) ) ( not ( = ?auto_26605 ?auto_26632 ) ) ( not ( = ?auto_26605 ?auto_26630 ) ) ( not ( = ?auto_26605 ?auto_26635 ) ) ( not ( = ?auto_26625 ?auto_26632 ) ) ( not ( = ?auto_26625 ?auto_26630 ) ) ( not ( = ?auto_26625 ?auto_26635 ) ) ( not ( = ?auto_26601 ?auto_26606 ) ) ( not ( = ?auto_26601 ?auto_26622 ) ) ( not ( = ?auto_26602 ?auto_26606 ) ) ( not ( = ?auto_26602 ?auto_26622 ) ) ( not ( = ?auto_26603 ?auto_26606 ) ) ( not ( = ?auto_26603 ?auto_26622 ) ) ( not ( = ?auto_26604 ?auto_26606 ) ) ( not ( = ?auto_26604 ?auto_26622 ) ) ( not ( = ?auto_26606 ?auto_26625 ) ) ( not ( = ?auto_26606 ?auto_26632 ) ) ( not ( = ?auto_26606 ?auto_26630 ) ) ( not ( = ?auto_26606 ?auto_26635 ) ) ( not ( = ?auto_26623 ?auto_26626 ) ) ( not ( = ?auto_26623 ?auto_26617 ) ) ( not ( = ?auto_26623 ?auto_26638 ) ) ( not ( = ?auto_26619 ?auto_26628 ) ) ( not ( = ?auto_26619 ?auto_26616 ) ) ( not ( = ?auto_26619 ?auto_26637 ) ) ( not ( = ?auto_26622 ?auto_26625 ) ) ( not ( = ?auto_26622 ?auto_26632 ) ) ( not ( = ?auto_26622 ?auto_26630 ) ) ( not ( = ?auto_26622 ?auto_26635 ) ) ( not ( = ?auto_26601 ?auto_26607 ) ) ( not ( = ?auto_26601 ?auto_26624 ) ) ( not ( = ?auto_26602 ?auto_26607 ) ) ( not ( = ?auto_26602 ?auto_26624 ) ) ( not ( = ?auto_26603 ?auto_26607 ) ) ( not ( = ?auto_26603 ?auto_26624 ) ) ( not ( = ?auto_26604 ?auto_26607 ) ) ( not ( = ?auto_26604 ?auto_26624 ) ) ( not ( = ?auto_26605 ?auto_26607 ) ) ( not ( = ?auto_26605 ?auto_26624 ) ) ( not ( = ?auto_26607 ?auto_26622 ) ) ( not ( = ?auto_26607 ?auto_26625 ) ) ( not ( = ?auto_26607 ?auto_26632 ) ) ( not ( = ?auto_26607 ?auto_26630 ) ) ( not ( = ?auto_26607 ?auto_26635 ) ) ( not ( = ?auto_26621 ?auto_26623 ) ) ( not ( = ?auto_26621 ?auto_26626 ) ) ( not ( = ?auto_26621 ?auto_26617 ) ) ( not ( = ?auto_26621 ?auto_26638 ) ) ( not ( = ?auto_26620 ?auto_26619 ) ) ( not ( = ?auto_26620 ?auto_26628 ) ) ( not ( = ?auto_26620 ?auto_26616 ) ) ( not ( = ?auto_26620 ?auto_26637 ) ) ( not ( = ?auto_26624 ?auto_26622 ) ) ( not ( = ?auto_26624 ?auto_26625 ) ) ( not ( = ?auto_26624 ?auto_26632 ) ) ( not ( = ?auto_26624 ?auto_26630 ) ) ( not ( = ?auto_26624 ?auto_26635 ) ) ( not ( = ?auto_26601 ?auto_26608 ) ) ( not ( = ?auto_26601 ?auto_26627 ) ) ( not ( = ?auto_26602 ?auto_26608 ) ) ( not ( = ?auto_26602 ?auto_26627 ) ) ( not ( = ?auto_26603 ?auto_26608 ) ) ( not ( = ?auto_26603 ?auto_26627 ) ) ( not ( = ?auto_26604 ?auto_26608 ) ) ( not ( = ?auto_26604 ?auto_26627 ) ) ( not ( = ?auto_26605 ?auto_26608 ) ) ( not ( = ?auto_26605 ?auto_26627 ) ) ( not ( = ?auto_26606 ?auto_26608 ) ) ( not ( = ?auto_26606 ?auto_26627 ) ) ( not ( = ?auto_26608 ?auto_26624 ) ) ( not ( = ?auto_26608 ?auto_26622 ) ) ( not ( = ?auto_26608 ?auto_26625 ) ) ( not ( = ?auto_26608 ?auto_26632 ) ) ( not ( = ?auto_26608 ?auto_26630 ) ) ( not ( = ?auto_26608 ?auto_26635 ) ) ( not ( = ?auto_26633 ?auto_26621 ) ) ( not ( = ?auto_26633 ?auto_26623 ) ) ( not ( = ?auto_26633 ?auto_26626 ) ) ( not ( = ?auto_26633 ?auto_26617 ) ) ( not ( = ?auto_26633 ?auto_26638 ) ) ( not ( = ?auto_26634 ?auto_26620 ) ) ( not ( = ?auto_26634 ?auto_26619 ) ) ( not ( = ?auto_26634 ?auto_26628 ) ) ( not ( = ?auto_26634 ?auto_26616 ) ) ( not ( = ?auto_26634 ?auto_26637 ) ) ( not ( = ?auto_26627 ?auto_26624 ) ) ( not ( = ?auto_26627 ?auto_26622 ) ) ( not ( = ?auto_26627 ?auto_26625 ) ) ( not ( = ?auto_26627 ?auto_26632 ) ) ( not ( = ?auto_26627 ?auto_26630 ) ) ( not ( = ?auto_26627 ?auto_26635 ) ) ( not ( = ?auto_26601 ?auto_26609 ) ) ( not ( = ?auto_26601 ?auto_26618 ) ) ( not ( = ?auto_26602 ?auto_26609 ) ) ( not ( = ?auto_26602 ?auto_26618 ) ) ( not ( = ?auto_26603 ?auto_26609 ) ) ( not ( = ?auto_26603 ?auto_26618 ) ) ( not ( = ?auto_26604 ?auto_26609 ) ) ( not ( = ?auto_26604 ?auto_26618 ) ) ( not ( = ?auto_26605 ?auto_26609 ) ) ( not ( = ?auto_26605 ?auto_26618 ) ) ( not ( = ?auto_26606 ?auto_26609 ) ) ( not ( = ?auto_26606 ?auto_26618 ) ) ( not ( = ?auto_26607 ?auto_26609 ) ) ( not ( = ?auto_26607 ?auto_26618 ) ) ( not ( = ?auto_26609 ?auto_26627 ) ) ( not ( = ?auto_26609 ?auto_26624 ) ) ( not ( = ?auto_26609 ?auto_26622 ) ) ( not ( = ?auto_26609 ?auto_26625 ) ) ( not ( = ?auto_26609 ?auto_26632 ) ) ( not ( = ?auto_26609 ?auto_26630 ) ) ( not ( = ?auto_26609 ?auto_26635 ) ) ( not ( = ?auto_26636 ?auto_26633 ) ) ( not ( = ?auto_26636 ?auto_26621 ) ) ( not ( = ?auto_26636 ?auto_26623 ) ) ( not ( = ?auto_26636 ?auto_26626 ) ) ( not ( = ?auto_26636 ?auto_26617 ) ) ( not ( = ?auto_26636 ?auto_26638 ) ) ( not ( = ?auto_26631 ?auto_26634 ) ) ( not ( = ?auto_26631 ?auto_26620 ) ) ( not ( = ?auto_26631 ?auto_26619 ) ) ( not ( = ?auto_26631 ?auto_26628 ) ) ( not ( = ?auto_26631 ?auto_26616 ) ) ( not ( = ?auto_26631 ?auto_26637 ) ) ( not ( = ?auto_26618 ?auto_26627 ) ) ( not ( = ?auto_26618 ?auto_26624 ) ) ( not ( = ?auto_26618 ?auto_26622 ) ) ( not ( = ?auto_26618 ?auto_26625 ) ) ( not ( = ?auto_26618 ?auto_26632 ) ) ( not ( = ?auto_26618 ?auto_26630 ) ) ( not ( = ?auto_26618 ?auto_26635 ) ) ( not ( = ?auto_26601 ?auto_26610 ) ) ( not ( = ?auto_26601 ?auto_26629 ) ) ( not ( = ?auto_26602 ?auto_26610 ) ) ( not ( = ?auto_26602 ?auto_26629 ) ) ( not ( = ?auto_26603 ?auto_26610 ) ) ( not ( = ?auto_26603 ?auto_26629 ) ) ( not ( = ?auto_26604 ?auto_26610 ) ) ( not ( = ?auto_26604 ?auto_26629 ) ) ( not ( = ?auto_26605 ?auto_26610 ) ) ( not ( = ?auto_26605 ?auto_26629 ) ) ( not ( = ?auto_26606 ?auto_26610 ) ) ( not ( = ?auto_26606 ?auto_26629 ) ) ( not ( = ?auto_26607 ?auto_26610 ) ) ( not ( = ?auto_26607 ?auto_26629 ) ) ( not ( = ?auto_26608 ?auto_26610 ) ) ( not ( = ?auto_26608 ?auto_26629 ) ) ( not ( = ?auto_26610 ?auto_26618 ) ) ( not ( = ?auto_26610 ?auto_26627 ) ) ( not ( = ?auto_26610 ?auto_26624 ) ) ( not ( = ?auto_26610 ?auto_26622 ) ) ( not ( = ?auto_26610 ?auto_26625 ) ) ( not ( = ?auto_26610 ?auto_26632 ) ) ( not ( = ?auto_26610 ?auto_26630 ) ) ( not ( = ?auto_26610 ?auto_26635 ) ) ( not ( = ?auto_26629 ?auto_26618 ) ) ( not ( = ?auto_26629 ?auto_26627 ) ) ( not ( = ?auto_26629 ?auto_26624 ) ) ( not ( = ?auto_26629 ?auto_26622 ) ) ( not ( = ?auto_26629 ?auto_26625 ) ) ( not ( = ?auto_26629 ?auto_26632 ) ) ( not ( = ?auto_26629 ?auto_26630 ) ) ( not ( = ?auto_26629 ?auto_26635 ) ) ( not ( = ?auto_26601 ?auto_26611 ) ) ( not ( = ?auto_26601 ?auto_26614 ) ) ( not ( = ?auto_26602 ?auto_26611 ) ) ( not ( = ?auto_26602 ?auto_26614 ) ) ( not ( = ?auto_26603 ?auto_26611 ) ) ( not ( = ?auto_26603 ?auto_26614 ) ) ( not ( = ?auto_26604 ?auto_26611 ) ) ( not ( = ?auto_26604 ?auto_26614 ) ) ( not ( = ?auto_26605 ?auto_26611 ) ) ( not ( = ?auto_26605 ?auto_26614 ) ) ( not ( = ?auto_26606 ?auto_26611 ) ) ( not ( = ?auto_26606 ?auto_26614 ) ) ( not ( = ?auto_26607 ?auto_26611 ) ) ( not ( = ?auto_26607 ?auto_26614 ) ) ( not ( = ?auto_26608 ?auto_26611 ) ) ( not ( = ?auto_26608 ?auto_26614 ) ) ( not ( = ?auto_26609 ?auto_26611 ) ) ( not ( = ?auto_26609 ?auto_26614 ) ) ( not ( = ?auto_26611 ?auto_26629 ) ) ( not ( = ?auto_26611 ?auto_26618 ) ) ( not ( = ?auto_26611 ?auto_26627 ) ) ( not ( = ?auto_26611 ?auto_26624 ) ) ( not ( = ?auto_26611 ?auto_26622 ) ) ( not ( = ?auto_26611 ?auto_26625 ) ) ( not ( = ?auto_26611 ?auto_26632 ) ) ( not ( = ?auto_26611 ?auto_26630 ) ) ( not ( = ?auto_26611 ?auto_26635 ) ) ( not ( = ?auto_26614 ?auto_26629 ) ) ( not ( = ?auto_26614 ?auto_26618 ) ) ( not ( = ?auto_26614 ?auto_26627 ) ) ( not ( = ?auto_26614 ?auto_26624 ) ) ( not ( = ?auto_26614 ?auto_26622 ) ) ( not ( = ?auto_26614 ?auto_26625 ) ) ( not ( = ?auto_26614 ?auto_26632 ) ) ( not ( = ?auto_26614 ?auto_26630 ) ) ( not ( = ?auto_26614 ?auto_26635 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_26601 ?auto_26602 ?auto_26603 ?auto_26604 ?auto_26605 ?auto_26606 ?auto_26607 ?auto_26608 ?auto_26609 ?auto_26610 )
      ( MAKE-1CRATE ?auto_26610 ?auto_26611 )
      ( MAKE-10CRATE-VERIFY ?auto_26601 ?auto_26602 ?auto_26603 ?auto_26604 ?auto_26605 ?auto_26606 ?auto_26607 ?auto_26608 ?auto_26609 ?auto_26610 ?auto_26611 ) )
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
      ?auto_26668 - SURFACE
      ?auto_26669 - SURFACE
      ?auto_26670 - SURFACE
      ?auto_26671 - SURFACE
      ?auto_26672 - SURFACE
    )
    :vars
    (
      ?auto_26674 - HOIST
      ?auto_26675 - PLACE
      ?auto_26673 - PLACE
      ?auto_26676 - HOIST
      ?auto_26678 - SURFACE
      ?auto_26692 - PLACE
      ?auto_26693 - HOIST
      ?auto_26695 - SURFACE
      ?auto_26689 - PLACE
      ?auto_26688 - HOIST
      ?auto_26702 - SURFACE
      ?auto_26700 - PLACE
      ?auto_26681 - HOIST
      ?auto_26694 - SURFACE
      ?auto_26679 - PLACE
      ?auto_26699 - HOIST
      ?auto_26685 - SURFACE
      ?auto_26690 - PLACE
      ?auto_26691 - HOIST
      ?auto_26680 - SURFACE
      ?auto_26682 - PLACE
      ?auto_26698 - HOIST
      ?auto_26697 - SURFACE
      ?auto_26687 - PLACE
      ?auto_26683 - HOIST
      ?auto_26686 - SURFACE
      ?auto_26696 - SURFACE
      ?auto_26684 - SURFACE
      ?auto_26701 - SURFACE
      ?auto_26677 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26674 ?auto_26675 ) ( IS-CRATE ?auto_26672 ) ( not ( = ?auto_26673 ?auto_26675 ) ) ( HOIST-AT ?auto_26676 ?auto_26673 ) ( AVAILABLE ?auto_26676 ) ( SURFACE-AT ?auto_26672 ?auto_26673 ) ( ON ?auto_26672 ?auto_26678 ) ( CLEAR ?auto_26672 ) ( not ( = ?auto_26671 ?auto_26672 ) ) ( not ( = ?auto_26671 ?auto_26678 ) ) ( not ( = ?auto_26672 ?auto_26678 ) ) ( not ( = ?auto_26674 ?auto_26676 ) ) ( IS-CRATE ?auto_26671 ) ( not ( = ?auto_26692 ?auto_26675 ) ) ( HOIST-AT ?auto_26693 ?auto_26692 ) ( SURFACE-AT ?auto_26671 ?auto_26692 ) ( ON ?auto_26671 ?auto_26695 ) ( CLEAR ?auto_26671 ) ( not ( = ?auto_26670 ?auto_26671 ) ) ( not ( = ?auto_26670 ?auto_26695 ) ) ( not ( = ?auto_26671 ?auto_26695 ) ) ( not ( = ?auto_26674 ?auto_26693 ) ) ( IS-CRATE ?auto_26670 ) ( not ( = ?auto_26689 ?auto_26675 ) ) ( HOIST-AT ?auto_26688 ?auto_26689 ) ( SURFACE-AT ?auto_26670 ?auto_26689 ) ( ON ?auto_26670 ?auto_26702 ) ( CLEAR ?auto_26670 ) ( not ( = ?auto_26669 ?auto_26670 ) ) ( not ( = ?auto_26669 ?auto_26702 ) ) ( not ( = ?auto_26670 ?auto_26702 ) ) ( not ( = ?auto_26674 ?auto_26688 ) ) ( IS-CRATE ?auto_26669 ) ( not ( = ?auto_26700 ?auto_26675 ) ) ( HOIST-AT ?auto_26681 ?auto_26700 ) ( AVAILABLE ?auto_26681 ) ( SURFACE-AT ?auto_26669 ?auto_26700 ) ( ON ?auto_26669 ?auto_26694 ) ( CLEAR ?auto_26669 ) ( not ( = ?auto_26668 ?auto_26669 ) ) ( not ( = ?auto_26668 ?auto_26694 ) ) ( not ( = ?auto_26669 ?auto_26694 ) ) ( not ( = ?auto_26674 ?auto_26681 ) ) ( IS-CRATE ?auto_26668 ) ( not ( = ?auto_26679 ?auto_26675 ) ) ( HOIST-AT ?auto_26699 ?auto_26679 ) ( AVAILABLE ?auto_26699 ) ( SURFACE-AT ?auto_26668 ?auto_26679 ) ( ON ?auto_26668 ?auto_26685 ) ( CLEAR ?auto_26668 ) ( not ( = ?auto_26667 ?auto_26668 ) ) ( not ( = ?auto_26667 ?auto_26685 ) ) ( not ( = ?auto_26668 ?auto_26685 ) ) ( not ( = ?auto_26674 ?auto_26699 ) ) ( IS-CRATE ?auto_26667 ) ( not ( = ?auto_26690 ?auto_26675 ) ) ( HOIST-AT ?auto_26691 ?auto_26690 ) ( AVAILABLE ?auto_26691 ) ( SURFACE-AT ?auto_26667 ?auto_26690 ) ( ON ?auto_26667 ?auto_26680 ) ( CLEAR ?auto_26667 ) ( not ( = ?auto_26666 ?auto_26667 ) ) ( not ( = ?auto_26666 ?auto_26680 ) ) ( not ( = ?auto_26667 ?auto_26680 ) ) ( not ( = ?auto_26674 ?auto_26691 ) ) ( IS-CRATE ?auto_26666 ) ( not ( = ?auto_26682 ?auto_26675 ) ) ( HOIST-AT ?auto_26698 ?auto_26682 ) ( AVAILABLE ?auto_26698 ) ( SURFACE-AT ?auto_26666 ?auto_26682 ) ( ON ?auto_26666 ?auto_26697 ) ( CLEAR ?auto_26666 ) ( not ( = ?auto_26665 ?auto_26666 ) ) ( not ( = ?auto_26665 ?auto_26697 ) ) ( not ( = ?auto_26666 ?auto_26697 ) ) ( not ( = ?auto_26674 ?auto_26698 ) ) ( IS-CRATE ?auto_26665 ) ( not ( = ?auto_26687 ?auto_26675 ) ) ( HOIST-AT ?auto_26683 ?auto_26687 ) ( SURFACE-AT ?auto_26665 ?auto_26687 ) ( ON ?auto_26665 ?auto_26686 ) ( CLEAR ?auto_26665 ) ( not ( = ?auto_26664 ?auto_26665 ) ) ( not ( = ?auto_26664 ?auto_26686 ) ) ( not ( = ?auto_26665 ?auto_26686 ) ) ( not ( = ?auto_26674 ?auto_26683 ) ) ( IS-CRATE ?auto_26664 ) ( AVAILABLE ?auto_26693 ) ( SURFACE-AT ?auto_26664 ?auto_26692 ) ( ON ?auto_26664 ?auto_26696 ) ( CLEAR ?auto_26664 ) ( not ( = ?auto_26663 ?auto_26664 ) ) ( not ( = ?auto_26663 ?auto_26696 ) ) ( not ( = ?auto_26664 ?auto_26696 ) ) ( IS-CRATE ?auto_26663 ) ( AVAILABLE ?auto_26683 ) ( SURFACE-AT ?auto_26663 ?auto_26687 ) ( ON ?auto_26663 ?auto_26684 ) ( CLEAR ?auto_26663 ) ( not ( = ?auto_26662 ?auto_26663 ) ) ( not ( = ?auto_26662 ?auto_26684 ) ) ( not ( = ?auto_26663 ?auto_26684 ) ) ( SURFACE-AT ?auto_26661 ?auto_26675 ) ( CLEAR ?auto_26661 ) ( IS-CRATE ?auto_26662 ) ( AVAILABLE ?auto_26674 ) ( AVAILABLE ?auto_26688 ) ( SURFACE-AT ?auto_26662 ?auto_26689 ) ( ON ?auto_26662 ?auto_26701 ) ( CLEAR ?auto_26662 ) ( TRUCK-AT ?auto_26677 ?auto_26675 ) ( not ( = ?auto_26661 ?auto_26662 ) ) ( not ( = ?auto_26661 ?auto_26701 ) ) ( not ( = ?auto_26662 ?auto_26701 ) ) ( not ( = ?auto_26661 ?auto_26663 ) ) ( not ( = ?auto_26661 ?auto_26684 ) ) ( not ( = ?auto_26663 ?auto_26701 ) ) ( not ( = ?auto_26687 ?auto_26689 ) ) ( not ( = ?auto_26683 ?auto_26688 ) ) ( not ( = ?auto_26684 ?auto_26701 ) ) ( not ( = ?auto_26661 ?auto_26664 ) ) ( not ( = ?auto_26661 ?auto_26696 ) ) ( not ( = ?auto_26662 ?auto_26664 ) ) ( not ( = ?auto_26662 ?auto_26696 ) ) ( not ( = ?auto_26664 ?auto_26684 ) ) ( not ( = ?auto_26664 ?auto_26701 ) ) ( not ( = ?auto_26692 ?auto_26687 ) ) ( not ( = ?auto_26692 ?auto_26689 ) ) ( not ( = ?auto_26693 ?auto_26683 ) ) ( not ( = ?auto_26693 ?auto_26688 ) ) ( not ( = ?auto_26696 ?auto_26684 ) ) ( not ( = ?auto_26696 ?auto_26701 ) ) ( not ( = ?auto_26661 ?auto_26665 ) ) ( not ( = ?auto_26661 ?auto_26686 ) ) ( not ( = ?auto_26662 ?auto_26665 ) ) ( not ( = ?auto_26662 ?auto_26686 ) ) ( not ( = ?auto_26663 ?auto_26665 ) ) ( not ( = ?auto_26663 ?auto_26686 ) ) ( not ( = ?auto_26665 ?auto_26696 ) ) ( not ( = ?auto_26665 ?auto_26684 ) ) ( not ( = ?auto_26665 ?auto_26701 ) ) ( not ( = ?auto_26686 ?auto_26696 ) ) ( not ( = ?auto_26686 ?auto_26684 ) ) ( not ( = ?auto_26686 ?auto_26701 ) ) ( not ( = ?auto_26661 ?auto_26666 ) ) ( not ( = ?auto_26661 ?auto_26697 ) ) ( not ( = ?auto_26662 ?auto_26666 ) ) ( not ( = ?auto_26662 ?auto_26697 ) ) ( not ( = ?auto_26663 ?auto_26666 ) ) ( not ( = ?auto_26663 ?auto_26697 ) ) ( not ( = ?auto_26664 ?auto_26666 ) ) ( not ( = ?auto_26664 ?auto_26697 ) ) ( not ( = ?auto_26666 ?auto_26686 ) ) ( not ( = ?auto_26666 ?auto_26696 ) ) ( not ( = ?auto_26666 ?auto_26684 ) ) ( not ( = ?auto_26666 ?auto_26701 ) ) ( not ( = ?auto_26682 ?auto_26687 ) ) ( not ( = ?auto_26682 ?auto_26692 ) ) ( not ( = ?auto_26682 ?auto_26689 ) ) ( not ( = ?auto_26698 ?auto_26683 ) ) ( not ( = ?auto_26698 ?auto_26693 ) ) ( not ( = ?auto_26698 ?auto_26688 ) ) ( not ( = ?auto_26697 ?auto_26686 ) ) ( not ( = ?auto_26697 ?auto_26696 ) ) ( not ( = ?auto_26697 ?auto_26684 ) ) ( not ( = ?auto_26697 ?auto_26701 ) ) ( not ( = ?auto_26661 ?auto_26667 ) ) ( not ( = ?auto_26661 ?auto_26680 ) ) ( not ( = ?auto_26662 ?auto_26667 ) ) ( not ( = ?auto_26662 ?auto_26680 ) ) ( not ( = ?auto_26663 ?auto_26667 ) ) ( not ( = ?auto_26663 ?auto_26680 ) ) ( not ( = ?auto_26664 ?auto_26667 ) ) ( not ( = ?auto_26664 ?auto_26680 ) ) ( not ( = ?auto_26665 ?auto_26667 ) ) ( not ( = ?auto_26665 ?auto_26680 ) ) ( not ( = ?auto_26667 ?auto_26697 ) ) ( not ( = ?auto_26667 ?auto_26686 ) ) ( not ( = ?auto_26667 ?auto_26696 ) ) ( not ( = ?auto_26667 ?auto_26684 ) ) ( not ( = ?auto_26667 ?auto_26701 ) ) ( not ( = ?auto_26690 ?auto_26682 ) ) ( not ( = ?auto_26690 ?auto_26687 ) ) ( not ( = ?auto_26690 ?auto_26692 ) ) ( not ( = ?auto_26690 ?auto_26689 ) ) ( not ( = ?auto_26691 ?auto_26698 ) ) ( not ( = ?auto_26691 ?auto_26683 ) ) ( not ( = ?auto_26691 ?auto_26693 ) ) ( not ( = ?auto_26691 ?auto_26688 ) ) ( not ( = ?auto_26680 ?auto_26697 ) ) ( not ( = ?auto_26680 ?auto_26686 ) ) ( not ( = ?auto_26680 ?auto_26696 ) ) ( not ( = ?auto_26680 ?auto_26684 ) ) ( not ( = ?auto_26680 ?auto_26701 ) ) ( not ( = ?auto_26661 ?auto_26668 ) ) ( not ( = ?auto_26661 ?auto_26685 ) ) ( not ( = ?auto_26662 ?auto_26668 ) ) ( not ( = ?auto_26662 ?auto_26685 ) ) ( not ( = ?auto_26663 ?auto_26668 ) ) ( not ( = ?auto_26663 ?auto_26685 ) ) ( not ( = ?auto_26664 ?auto_26668 ) ) ( not ( = ?auto_26664 ?auto_26685 ) ) ( not ( = ?auto_26665 ?auto_26668 ) ) ( not ( = ?auto_26665 ?auto_26685 ) ) ( not ( = ?auto_26666 ?auto_26668 ) ) ( not ( = ?auto_26666 ?auto_26685 ) ) ( not ( = ?auto_26668 ?auto_26680 ) ) ( not ( = ?auto_26668 ?auto_26697 ) ) ( not ( = ?auto_26668 ?auto_26686 ) ) ( not ( = ?auto_26668 ?auto_26696 ) ) ( not ( = ?auto_26668 ?auto_26684 ) ) ( not ( = ?auto_26668 ?auto_26701 ) ) ( not ( = ?auto_26679 ?auto_26690 ) ) ( not ( = ?auto_26679 ?auto_26682 ) ) ( not ( = ?auto_26679 ?auto_26687 ) ) ( not ( = ?auto_26679 ?auto_26692 ) ) ( not ( = ?auto_26679 ?auto_26689 ) ) ( not ( = ?auto_26699 ?auto_26691 ) ) ( not ( = ?auto_26699 ?auto_26698 ) ) ( not ( = ?auto_26699 ?auto_26683 ) ) ( not ( = ?auto_26699 ?auto_26693 ) ) ( not ( = ?auto_26699 ?auto_26688 ) ) ( not ( = ?auto_26685 ?auto_26680 ) ) ( not ( = ?auto_26685 ?auto_26697 ) ) ( not ( = ?auto_26685 ?auto_26686 ) ) ( not ( = ?auto_26685 ?auto_26696 ) ) ( not ( = ?auto_26685 ?auto_26684 ) ) ( not ( = ?auto_26685 ?auto_26701 ) ) ( not ( = ?auto_26661 ?auto_26669 ) ) ( not ( = ?auto_26661 ?auto_26694 ) ) ( not ( = ?auto_26662 ?auto_26669 ) ) ( not ( = ?auto_26662 ?auto_26694 ) ) ( not ( = ?auto_26663 ?auto_26669 ) ) ( not ( = ?auto_26663 ?auto_26694 ) ) ( not ( = ?auto_26664 ?auto_26669 ) ) ( not ( = ?auto_26664 ?auto_26694 ) ) ( not ( = ?auto_26665 ?auto_26669 ) ) ( not ( = ?auto_26665 ?auto_26694 ) ) ( not ( = ?auto_26666 ?auto_26669 ) ) ( not ( = ?auto_26666 ?auto_26694 ) ) ( not ( = ?auto_26667 ?auto_26669 ) ) ( not ( = ?auto_26667 ?auto_26694 ) ) ( not ( = ?auto_26669 ?auto_26685 ) ) ( not ( = ?auto_26669 ?auto_26680 ) ) ( not ( = ?auto_26669 ?auto_26697 ) ) ( not ( = ?auto_26669 ?auto_26686 ) ) ( not ( = ?auto_26669 ?auto_26696 ) ) ( not ( = ?auto_26669 ?auto_26684 ) ) ( not ( = ?auto_26669 ?auto_26701 ) ) ( not ( = ?auto_26700 ?auto_26679 ) ) ( not ( = ?auto_26700 ?auto_26690 ) ) ( not ( = ?auto_26700 ?auto_26682 ) ) ( not ( = ?auto_26700 ?auto_26687 ) ) ( not ( = ?auto_26700 ?auto_26692 ) ) ( not ( = ?auto_26700 ?auto_26689 ) ) ( not ( = ?auto_26681 ?auto_26699 ) ) ( not ( = ?auto_26681 ?auto_26691 ) ) ( not ( = ?auto_26681 ?auto_26698 ) ) ( not ( = ?auto_26681 ?auto_26683 ) ) ( not ( = ?auto_26681 ?auto_26693 ) ) ( not ( = ?auto_26681 ?auto_26688 ) ) ( not ( = ?auto_26694 ?auto_26685 ) ) ( not ( = ?auto_26694 ?auto_26680 ) ) ( not ( = ?auto_26694 ?auto_26697 ) ) ( not ( = ?auto_26694 ?auto_26686 ) ) ( not ( = ?auto_26694 ?auto_26696 ) ) ( not ( = ?auto_26694 ?auto_26684 ) ) ( not ( = ?auto_26694 ?auto_26701 ) ) ( not ( = ?auto_26661 ?auto_26670 ) ) ( not ( = ?auto_26661 ?auto_26702 ) ) ( not ( = ?auto_26662 ?auto_26670 ) ) ( not ( = ?auto_26662 ?auto_26702 ) ) ( not ( = ?auto_26663 ?auto_26670 ) ) ( not ( = ?auto_26663 ?auto_26702 ) ) ( not ( = ?auto_26664 ?auto_26670 ) ) ( not ( = ?auto_26664 ?auto_26702 ) ) ( not ( = ?auto_26665 ?auto_26670 ) ) ( not ( = ?auto_26665 ?auto_26702 ) ) ( not ( = ?auto_26666 ?auto_26670 ) ) ( not ( = ?auto_26666 ?auto_26702 ) ) ( not ( = ?auto_26667 ?auto_26670 ) ) ( not ( = ?auto_26667 ?auto_26702 ) ) ( not ( = ?auto_26668 ?auto_26670 ) ) ( not ( = ?auto_26668 ?auto_26702 ) ) ( not ( = ?auto_26670 ?auto_26694 ) ) ( not ( = ?auto_26670 ?auto_26685 ) ) ( not ( = ?auto_26670 ?auto_26680 ) ) ( not ( = ?auto_26670 ?auto_26697 ) ) ( not ( = ?auto_26670 ?auto_26686 ) ) ( not ( = ?auto_26670 ?auto_26696 ) ) ( not ( = ?auto_26670 ?auto_26684 ) ) ( not ( = ?auto_26670 ?auto_26701 ) ) ( not ( = ?auto_26702 ?auto_26694 ) ) ( not ( = ?auto_26702 ?auto_26685 ) ) ( not ( = ?auto_26702 ?auto_26680 ) ) ( not ( = ?auto_26702 ?auto_26697 ) ) ( not ( = ?auto_26702 ?auto_26686 ) ) ( not ( = ?auto_26702 ?auto_26696 ) ) ( not ( = ?auto_26702 ?auto_26684 ) ) ( not ( = ?auto_26702 ?auto_26701 ) ) ( not ( = ?auto_26661 ?auto_26671 ) ) ( not ( = ?auto_26661 ?auto_26695 ) ) ( not ( = ?auto_26662 ?auto_26671 ) ) ( not ( = ?auto_26662 ?auto_26695 ) ) ( not ( = ?auto_26663 ?auto_26671 ) ) ( not ( = ?auto_26663 ?auto_26695 ) ) ( not ( = ?auto_26664 ?auto_26671 ) ) ( not ( = ?auto_26664 ?auto_26695 ) ) ( not ( = ?auto_26665 ?auto_26671 ) ) ( not ( = ?auto_26665 ?auto_26695 ) ) ( not ( = ?auto_26666 ?auto_26671 ) ) ( not ( = ?auto_26666 ?auto_26695 ) ) ( not ( = ?auto_26667 ?auto_26671 ) ) ( not ( = ?auto_26667 ?auto_26695 ) ) ( not ( = ?auto_26668 ?auto_26671 ) ) ( not ( = ?auto_26668 ?auto_26695 ) ) ( not ( = ?auto_26669 ?auto_26671 ) ) ( not ( = ?auto_26669 ?auto_26695 ) ) ( not ( = ?auto_26671 ?auto_26702 ) ) ( not ( = ?auto_26671 ?auto_26694 ) ) ( not ( = ?auto_26671 ?auto_26685 ) ) ( not ( = ?auto_26671 ?auto_26680 ) ) ( not ( = ?auto_26671 ?auto_26697 ) ) ( not ( = ?auto_26671 ?auto_26686 ) ) ( not ( = ?auto_26671 ?auto_26696 ) ) ( not ( = ?auto_26671 ?auto_26684 ) ) ( not ( = ?auto_26671 ?auto_26701 ) ) ( not ( = ?auto_26695 ?auto_26702 ) ) ( not ( = ?auto_26695 ?auto_26694 ) ) ( not ( = ?auto_26695 ?auto_26685 ) ) ( not ( = ?auto_26695 ?auto_26680 ) ) ( not ( = ?auto_26695 ?auto_26697 ) ) ( not ( = ?auto_26695 ?auto_26686 ) ) ( not ( = ?auto_26695 ?auto_26696 ) ) ( not ( = ?auto_26695 ?auto_26684 ) ) ( not ( = ?auto_26695 ?auto_26701 ) ) ( not ( = ?auto_26661 ?auto_26672 ) ) ( not ( = ?auto_26661 ?auto_26678 ) ) ( not ( = ?auto_26662 ?auto_26672 ) ) ( not ( = ?auto_26662 ?auto_26678 ) ) ( not ( = ?auto_26663 ?auto_26672 ) ) ( not ( = ?auto_26663 ?auto_26678 ) ) ( not ( = ?auto_26664 ?auto_26672 ) ) ( not ( = ?auto_26664 ?auto_26678 ) ) ( not ( = ?auto_26665 ?auto_26672 ) ) ( not ( = ?auto_26665 ?auto_26678 ) ) ( not ( = ?auto_26666 ?auto_26672 ) ) ( not ( = ?auto_26666 ?auto_26678 ) ) ( not ( = ?auto_26667 ?auto_26672 ) ) ( not ( = ?auto_26667 ?auto_26678 ) ) ( not ( = ?auto_26668 ?auto_26672 ) ) ( not ( = ?auto_26668 ?auto_26678 ) ) ( not ( = ?auto_26669 ?auto_26672 ) ) ( not ( = ?auto_26669 ?auto_26678 ) ) ( not ( = ?auto_26670 ?auto_26672 ) ) ( not ( = ?auto_26670 ?auto_26678 ) ) ( not ( = ?auto_26672 ?auto_26695 ) ) ( not ( = ?auto_26672 ?auto_26702 ) ) ( not ( = ?auto_26672 ?auto_26694 ) ) ( not ( = ?auto_26672 ?auto_26685 ) ) ( not ( = ?auto_26672 ?auto_26680 ) ) ( not ( = ?auto_26672 ?auto_26697 ) ) ( not ( = ?auto_26672 ?auto_26686 ) ) ( not ( = ?auto_26672 ?auto_26696 ) ) ( not ( = ?auto_26672 ?auto_26684 ) ) ( not ( = ?auto_26672 ?auto_26701 ) ) ( not ( = ?auto_26673 ?auto_26692 ) ) ( not ( = ?auto_26673 ?auto_26689 ) ) ( not ( = ?auto_26673 ?auto_26700 ) ) ( not ( = ?auto_26673 ?auto_26679 ) ) ( not ( = ?auto_26673 ?auto_26690 ) ) ( not ( = ?auto_26673 ?auto_26682 ) ) ( not ( = ?auto_26673 ?auto_26687 ) ) ( not ( = ?auto_26676 ?auto_26693 ) ) ( not ( = ?auto_26676 ?auto_26688 ) ) ( not ( = ?auto_26676 ?auto_26681 ) ) ( not ( = ?auto_26676 ?auto_26699 ) ) ( not ( = ?auto_26676 ?auto_26691 ) ) ( not ( = ?auto_26676 ?auto_26698 ) ) ( not ( = ?auto_26676 ?auto_26683 ) ) ( not ( = ?auto_26678 ?auto_26695 ) ) ( not ( = ?auto_26678 ?auto_26702 ) ) ( not ( = ?auto_26678 ?auto_26694 ) ) ( not ( = ?auto_26678 ?auto_26685 ) ) ( not ( = ?auto_26678 ?auto_26680 ) ) ( not ( = ?auto_26678 ?auto_26697 ) ) ( not ( = ?auto_26678 ?auto_26686 ) ) ( not ( = ?auto_26678 ?auto_26696 ) ) ( not ( = ?auto_26678 ?auto_26684 ) ) ( not ( = ?auto_26678 ?auto_26701 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_26661 ?auto_26662 ?auto_26663 ?auto_26664 ?auto_26665 ?auto_26666 ?auto_26667 ?auto_26668 ?auto_26669 ?auto_26670 ?auto_26671 )
      ( MAKE-1CRATE ?auto_26671 ?auto_26672 )
      ( MAKE-11CRATE-VERIFY ?auto_26661 ?auto_26662 ?auto_26663 ?auto_26664 ?auto_26665 ?auto_26666 ?auto_26667 ?auto_26668 ?auto_26669 ?auto_26670 ?auto_26671 ?auto_26672 ) )
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
      ?auto_26733 - SURFACE
      ?auto_26734 - SURFACE
      ?auto_26735 - SURFACE
      ?auto_26736 - SURFACE
      ?auto_26737 - SURFACE
      ?auto_26738 - SURFACE
    )
    :vars
    (
      ?auto_26741 - HOIST
      ?auto_26743 - PLACE
      ?auto_26742 - PLACE
      ?auto_26744 - HOIST
      ?auto_26740 - SURFACE
      ?auto_26746 - PLACE
      ?auto_26761 - HOIST
      ?auto_26745 - SURFACE
      ?auto_26753 - PLACE
      ?auto_26764 - HOIST
      ?auto_26766 - SURFACE
      ?auto_26758 - SURFACE
      ?auto_26754 - PLACE
      ?auto_26759 - HOIST
      ?auto_26750 - SURFACE
      ?auto_26756 - PLACE
      ?auto_26755 - HOIST
      ?auto_26765 - SURFACE
      ?auto_26749 - PLACE
      ?auto_26763 - HOIST
      ?auto_26747 - SURFACE
      ?auto_26752 - PLACE
      ?auto_26760 - HOIST
      ?auto_26748 - SURFACE
      ?auto_26769 - PLACE
      ?auto_26767 - HOIST
      ?auto_26762 - SURFACE
      ?auto_26751 - SURFACE
      ?auto_26768 - SURFACE
      ?auto_26757 - SURFACE
      ?auto_26739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26741 ?auto_26743 ) ( IS-CRATE ?auto_26738 ) ( not ( = ?auto_26742 ?auto_26743 ) ) ( HOIST-AT ?auto_26744 ?auto_26742 ) ( SURFACE-AT ?auto_26738 ?auto_26742 ) ( ON ?auto_26738 ?auto_26740 ) ( CLEAR ?auto_26738 ) ( not ( = ?auto_26737 ?auto_26738 ) ) ( not ( = ?auto_26737 ?auto_26740 ) ) ( not ( = ?auto_26738 ?auto_26740 ) ) ( not ( = ?auto_26741 ?auto_26744 ) ) ( IS-CRATE ?auto_26737 ) ( not ( = ?auto_26746 ?auto_26743 ) ) ( HOIST-AT ?auto_26761 ?auto_26746 ) ( AVAILABLE ?auto_26761 ) ( SURFACE-AT ?auto_26737 ?auto_26746 ) ( ON ?auto_26737 ?auto_26745 ) ( CLEAR ?auto_26737 ) ( not ( = ?auto_26736 ?auto_26737 ) ) ( not ( = ?auto_26736 ?auto_26745 ) ) ( not ( = ?auto_26737 ?auto_26745 ) ) ( not ( = ?auto_26741 ?auto_26761 ) ) ( IS-CRATE ?auto_26736 ) ( not ( = ?auto_26753 ?auto_26743 ) ) ( HOIST-AT ?auto_26764 ?auto_26753 ) ( SURFACE-AT ?auto_26736 ?auto_26753 ) ( ON ?auto_26736 ?auto_26766 ) ( CLEAR ?auto_26736 ) ( not ( = ?auto_26735 ?auto_26736 ) ) ( not ( = ?auto_26735 ?auto_26766 ) ) ( not ( = ?auto_26736 ?auto_26766 ) ) ( not ( = ?auto_26741 ?auto_26764 ) ) ( IS-CRATE ?auto_26735 ) ( SURFACE-AT ?auto_26735 ?auto_26742 ) ( ON ?auto_26735 ?auto_26758 ) ( CLEAR ?auto_26735 ) ( not ( = ?auto_26734 ?auto_26735 ) ) ( not ( = ?auto_26734 ?auto_26758 ) ) ( not ( = ?auto_26735 ?auto_26758 ) ) ( IS-CRATE ?auto_26734 ) ( not ( = ?auto_26754 ?auto_26743 ) ) ( HOIST-AT ?auto_26759 ?auto_26754 ) ( AVAILABLE ?auto_26759 ) ( SURFACE-AT ?auto_26734 ?auto_26754 ) ( ON ?auto_26734 ?auto_26750 ) ( CLEAR ?auto_26734 ) ( not ( = ?auto_26733 ?auto_26734 ) ) ( not ( = ?auto_26733 ?auto_26750 ) ) ( not ( = ?auto_26734 ?auto_26750 ) ) ( not ( = ?auto_26741 ?auto_26759 ) ) ( IS-CRATE ?auto_26733 ) ( not ( = ?auto_26756 ?auto_26743 ) ) ( HOIST-AT ?auto_26755 ?auto_26756 ) ( AVAILABLE ?auto_26755 ) ( SURFACE-AT ?auto_26733 ?auto_26756 ) ( ON ?auto_26733 ?auto_26765 ) ( CLEAR ?auto_26733 ) ( not ( = ?auto_26732 ?auto_26733 ) ) ( not ( = ?auto_26732 ?auto_26765 ) ) ( not ( = ?auto_26733 ?auto_26765 ) ) ( not ( = ?auto_26741 ?auto_26755 ) ) ( IS-CRATE ?auto_26732 ) ( not ( = ?auto_26749 ?auto_26743 ) ) ( HOIST-AT ?auto_26763 ?auto_26749 ) ( AVAILABLE ?auto_26763 ) ( SURFACE-AT ?auto_26732 ?auto_26749 ) ( ON ?auto_26732 ?auto_26747 ) ( CLEAR ?auto_26732 ) ( not ( = ?auto_26731 ?auto_26732 ) ) ( not ( = ?auto_26731 ?auto_26747 ) ) ( not ( = ?auto_26732 ?auto_26747 ) ) ( not ( = ?auto_26741 ?auto_26763 ) ) ( IS-CRATE ?auto_26731 ) ( not ( = ?auto_26752 ?auto_26743 ) ) ( HOIST-AT ?auto_26760 ?auto_26752 ) ( AVAILABLE ?auto_26760 ) ( SURFACE-AT ?auto_26731 ?auto_26752 ) ( ON ?auto_26731 ?auto_26748 ) ( CLEAR ?auto_26731 ) ( not ( = ?auto_26730 ?auto_26731 ) ) ( not ( = ?auto_26730 ?auto_26748 ) ) ( not ( = ?auto_26731 ?auto_26748 ) ) ( not ( = ?auto_26741 ?auto_26760 ) ) ( IS-CRATE ?auto_26730 ) ( not ( = ?auto_26769 ?auto_26743 ) ) ( HOIST-AT ?auto_26767 ?auto_26769 ) ( SURFACE-AT ?auto_26730 ?auto_26769 ) ( ON ?auto_26730 ?auto_26762 ) ( CLEAR ?auto_26730 ) ( not ( = ?auto_26729 ?auto_26730 ) ) ( not ( = ?auto_26729 ?auto_26762 ) ) ( not ( = ?auto_26730 ?auto_26762 ) ) ( not ( = ?auto_26741 ?auto_26767 ) ) ( IS-CRATE ?auto_26729 ) ( AVAILABLE ?auto_26764 ) ( SURFACE-AT ?auto_26729 ?auto_26753 ) ( ON ?auto_26729 ?auto_26751 ) ( CLEAR ?auto_26729 ) ( not ( = ?auto_26728 ?auto_26729 ) ) ( not ( = ?auto_26728 ?auto_26751 ) ) ( not ( = ?auto_26729 ?auto_26751 ) ) ( IS-CRATE ?auto_26728 ) ( AVAILABLE ?auto_26767 ) ( SURFACE-AT ?auto_26728 ?auto_26769 ) ( ON ?auto_26728 ?auto_26768 ) ( CLEAR ?auto_26728 ) ( not ( = ?auto_26727 ?auto_26728 ) ) ( not ( = ?auto_26727 ?auto_26768 ) ) ( not ( = ?auto_26728 ?auto_26768 ) ) ( SURFACE-AT ?auto_26726 ?auto_26743 ) ( CLEAR ?auto_26726 ) ( IS-CRATE ?auto_26727 ) ( AVAILABLE ?auto_26741 ) ( AVAILABLE ?auto_26744 ) ( SURFACE-AT ?auto_26727 ?auto_26742 ) ( ON ?auto_26727 ?auto_26757 ) ( CLEAR ?auto_26727 ) ( TRUCK-AT ?auto_26739 ?auto_26743 ) ( not ( = ?auto_26726 ?auto_26727 ) ) ( not ( = ?auto_26726 ?auto_26757 ) ) ( not ( = ?auto_26727 ?auto_26757 ) ) ( not ( = ?auto_26726 ?auto_26728 ) ) ( not ( = ?auto_26726 ?auto_26768 ) ) ( not ( = ?auto_26728 ?auto_26757 ) ) ( not ( = ?auto_26769 ?auto_26742 ) ) ( not ( = ?auto_26767 ?auto_26744 ) ) ( not ( = ?auto_26768 ?auto_26757 ) ) ( not ( = ?auto_26726 ?auto_26729 ) ) ( not ( = ?auto_26726 ?auto_26751 ) ) ( not ( = ?auto_26727 ?auto_26729 ) ) ( not ( = ?auto_26727 ?auto_26751 ) ) ( not ( = ?auto_26729 ?auto_26768 ) ) ( not ( = ?auto_26729 ?auto_26757 ) ) ( not ( = ?auto_26753 ?auto_26769 ) ) ( not ( = ?auto_26753 ?auto_26742 ) ) ( not ( = ?auto_26764 ?auto_26767 ) ) ( not ( = ?auto_26764 ?auto_26744 ) ) ( not ( = ?auto_26751 ?auto_26768 ) ) ( not ( = ?auto_26751 ?auto_26757 ) ) ( not ( = ?auto_26726 ?auto_26730 ) ) ( not ( = ?auto_26726 ?auto_26762 ) ) ( not ( = ?auto_26727 ?auto_26730 ) ) ( not ( = ?auto_26727 ?auto_26762 ) ) ( not ( = ?auto_26728 ?auto_26730 ) ) ( not ( = ?auto_26728 ?auto_26762 ) ) ( not ( = ?auto_26730 ?auto_26751 ) ) ( not ( = ?auto_26730 ?auto_26768 ) ) ( not ( = ?auto_26730 ?auto_26757 ) ) ( not ( = ?auto_26762 ?auto_26751 ) ) ( not ( = ?auto_26762 ?auto_26768 ) ) ( not ( = ?auto_26762 ?auto_26757 ) ) ( not ( = ?auto_26726 ?auto_26731 ) ) ( not ( = ?auto_26726 ?auto_26748 ) ) ( not ( = ?auto_26727 ?auto_26731 ) ) ( not ( = ?auto_26727 ?auto_26748 ) ) ( not ( = ?auto_26728 ?auto_26731 ) ) ( not ( = ?auto_26728 ?auto_26748 ) ) ( not ( = ?auto_26729 ?auto_26731 ) ) ( not ( = ?auto_26729 ?auto_26748 ) ) ( not ( = ?auto_26731 ?auto_26762 ) ) ( not ( = ?auto_26731 ?auto_26751 ) ) ( not ( = ?auto_26731 ?auto_26768 ) ) ( not ( = ?auto_26731 ?auto_26757 ) ) ( not ( = ?auto_26752 ?auto_26769 ) ) ( not ( = ?auto_26752 ?auto_26753 ) ) ( not ( = ?auto_26752 ?auto_26742 ) ) ( not ( = ?auto_26760 ?auto_26767 ) ) ( not ( = ?auto_26760 ?auto_26764 ) ) ( not ( = ?auto_26760 ?auto_26744 ) ) ( not ( = ?auto_26748 ?auto_26762 ) ) ( not ( = ?auto_26748 ?auto_26751 ) ) ( not ( = ?auto_26748 ?auto_26768 ) ) ( not ( = ?auto_26748 ?auto_26757 ) ) ( not ( = ?auto_26726 ?auto_26732 ) ) ( not ( = ?auto_26726 ?auto_26747 ) ) ( not ( = ?auto_26727 ?auto_26732 ) ) ( not ( = ?auto_26727 ?auto_26747 ) ) ( not ( = ?auto_26728 ?auto_26732 ) ) ( not ( = ?auto_26728 ?auto_26747 ) ) ( not ( = ?auto_26729 ?auto_26732 ) ) ( not ( = ?auto_26729 ?auto_26747 ) ) ( not ( = ?auto_26730 ?auto_26732 ) ) ( not ( = ?auto_26730 ?auto_26747 ) ) ( not ( = ?auto_26732 ?auto_26748 ) ) ( not ( = ?auto_26732 ?auto_26762 ) ) ( not ( = ?auto_26732 ?auto_26751 ) ) ( not ( = ?auto_26732 ?auto_26768 ) ) ( not ( = ?auto_26732 ?auto_26757 ) ) ( not ( = ?auto_26749 ?auto_26752 ) ) ( not ( = ?auto_26749 ?auto_26769 ) ) ( not ( = ?auto_26749 ?auto_26753 ) ) ( not ( = ?auto_26749 ?auto_26742 ) ) ( not ( = ?auto_26763 ?auto_26760 ) ) ( not ( = ?auto_26763 ?auto_26767 ) ) ( not ( = ?auto_26763 ?auto_26764 ) ) ( not ( = ?auto_26763 ?auto_26744 ) ) ( not ( = ?auto_26747 ?auto_26748 ) ) ( not ( = ?auto_26747 ?auto_26762 ) ) ( not ( = ?auto_26747 ?auto_26751 ) ) ( not ( = ?auto_26747 ?auto_26768 ) ) ( not ( = ?auto_26747 ?auto_26757 ) ) ( not ( = ?auto_26726 ?auto_26733 ) ) ( not ( = ?auto_26726 ?auto_26765 ) ) ( not ( = ?auto_26727 ?auto_26733 ) ) ( not ( = ?auto_26727 ?auto_26765 ) ) ( not ( = ?auto_26728 ?auto_26733 ) ) ( not ( = ?auto_26728 ?auto_26765 ) ) ( not ( = ?auto_26729 ?auto_26733 ) ) ( not ( = ?auto_26729 ?auto_26765 ) ) ( not ( = ?auto_26730 ?auto_26733 ) ) ( not ( = ?auto_26730 ?auto_26765 ) ) ( not ( = ?auto_26731 ?auto_26733 ) ) ( not ( = ?auto_26731 ?auto_26765 ) ) ( not ( = ?auto_26733 ?auto_26747 ) ) ( not ( = ?auto_26733 ?auto_26748 ) ) ( not ( = ?auto_26733 ?auto_26762 ) ) ( not ( = ?auto_26733 ?auto_26751 ) ) ( not ( = ?auto_26733 ?auto_26768 ) ) ( not ( = ?auto_26733 ?auto_26757 ) ) ( not ( = ?auto_26756 ?auto_26749 ) ) ( not ( = ?auto_26756 ?auto_26752 ) ) ( not ( = ?auto_26756 ?auto_26769 ) ) ( not ( = ?auto_26756 ?auto_26753 ) ) ( not ( = ?auto_26756 ?auto_26742 ) ) ( not ( = ?auto_26755 ?auto_26763 ) ) ( not ( = ?auto_26755 ?auto_26760 ) ) ( not ( = ?auto_26755 ?auto_26767 ) ) ( not ( = ?auto_26755 ?auto_26764 ) ) ( not ( = ?auto_26755 ?auto_26744 ) ) ( not ( = ?auto_26765 ?auto_26747 ) ) ( not ( = ?auto_26765 ?auto_26748 ) ) ( not ( = ?auto_26765 ?auto_26762 ) ) ( not ( = ?auto_26765 ?auto_26751 ) ) ( not ( = ?auto_26765 ?auto_26768 ) ) ( not ( = ?auto_26765 ?auto_26757 ) ) ( not ( = ?auto_26726 ?auto_26734 ) ) ( not ( = ?auto_26726 ?auto_26750 ) ) ( not ( = ?auto_26727 ?auto_26734 ) ) ( not ( = ?auto_26727 ?auto_26750 ) ) ( not ( = ?auto_26728 ?auto_26734 ) ) ( not ( = ?auto_26728 ?auto_26750 ) ) ( not ( = ?auto_26729 ?auto_26734 ) ) ( not ( = ?auto_26729 ?auto_26750 ) ) ( not ( = ?auto_26730 ?auto_26734 ) ) ( not ( = ?auto_26730 ?auto_26750 ) ) ( not ( = ?auto_26731 ?auto_26734 ) ) ( not ( = ?auto_26731 ?auto_26750 ) ) ( not ( = ?auto_26732 ?auto_26734 ) ) ( not ( = ?auto_26732 ?auto_26750 ) ) ( not ( = ?auto_26734 ?auto_26765 ) ) ( not ( = ?auto_26734 ?auto_26747 ) ) ( not ( = ?auto_26734 ?auto_26748 ) ) ( not ( = ?auto_26734 ?auto_26762 ) ) ( not ( = ?auto_26734 ?auto_26751 ) ) ( not ( = ?auto_26734 ?auto_26768 ) ) ( not ( = ?auto_26734 ?auto_26757 ) ) ( not ( = ?auto_26754 ?auto_26756 ) ) ( not ( = ?auto_26754 ?auto_26749 ) ) ( not ( = ?auto_26754 ?auto_26752 ) ) ( not ( = ?auto_26754 ?auto_26769 ) ) ( not ( = ?auto_26754 ?auto_26753 ) ) ( not ( = ?auto_26754 ?auto_26742 ) ) ( not ( = ?auto_26759 ?auto_26755 ) ) ( not ( = ?auto_26759 ?auto_26763 ) ) ( not ( = ?auto_26759 ?auto_26760 ) ) ( not ( = ?auto_26759 ?auto_26767 ) ) ( not ( = ?auto_26759 ?auto_26764 ) ) ( not ( = ?auto_26759 ?auto_26744 ) ) ( not ( = ?auto_26750 ?auto_26765 ) ) ( not ( = ?auto_26750 ?auto_26747 ) ) ( not ( = ?auto_26750 ?auto_26748 ) ) ( not ( = ?auto_26750 ?auto_26762 ) ) ( not ( = ?auto_26750 ?auto_26751 ) ) ( not ( = ?auto_26750 ?auto_26768 ) ) ( not ( = ?auto_26750 ?auto_26757 ) ) ( not ( = ?auto_26726 ?auto_26735 ) ) ( not ( = ?auto_26726 ?auto_26758 ) ) ( not ( = ?auto_26727 ?auto_26735 ) ) ( not ( = ?auto_26727 ?auto_26758 ) ) ( not ( = ?auto_26728 ?auto_26735 ) ) ( not ( = ?auto_26728 ?auto_26758 ) ) ( not ( = ?auto_26729 ?auto_26735 ) ) ( not ( = ?auto_26729 ?auto_26758 ) ) ( not ( = ?auto_26730 ?auto_26735 ) ) ( not ( = ?auto_26730 ?auto_26758 ) ) ( not ( = ?auto_26731 ?auto_26735 ) ) ( not ( = ?auto_26731 ?auto_26758 ) ) ( not ( = ?auto_26732 ?auto_26735 ) ) ( not ( = ?auto_26732 ?auto_26758 ) ) ( not ( = ?auto_26733 ?auto_26735 ) ) ( not ( = ?auto_26733 ?auto_26758 ) ) ( not ( = ?auto_26735 ?auto_26750 ) ) ( not ( = ?auto_26735 ?auto_26765 ) ) ( not ( = ?auto_26735 ?auto_26747 ) ) ( not ( = ?auto_26735 ?auto_26748 ) ) ( not ( = ?auto_26735 ?auto_26762 ) ) ( not ( = ?auto_26735 ?auto_26751 ) ) ( not ( = ?auto_26735 ?auto_26768 ) ) ( not ( = ?auto_26735 ?auto_26757 ) ) ( not ( = ?auto_26758 ?auto_26750 ) ) ( not ( = ?auto_26758 ?auto_26765 ) ) ( not ( = ?auto_26758 ?auto_26747 ) ) ( not ( = ?auto_26758 ?auto_26748 ) ) ( not ( = ?auto_26758 ?auto_26762 ) ) ( not ( = ?auto_26758 ?auto_26751 ) ) ( not ( = ?auto_26758 ?auto_26768 ) ) ( not ( = ?auto_26758 ?auto_26757 ) ) ( not ( = ?auto_26726 ?auto_26736 ) ) ( not ( = ?auto_26726 ?auto_26766 ) ) ( not ( = ?auto_26727 ?auto_26736 ) ) ( not ( = ?auto_26727 ?auto_26766 ) ) ( not ( = ?auto_26728 ?auto_26736 ) ) ( not ( = ?auto_26728 ?auto_26766 ) ) ( not ( = ?auto_26729 ?auto_26736 ) ) ( not ( = ?auto_26729 ?auto_26766 ) ) ( not ( = ?auto_26730 ?auto_26736 ) ) ( not ( = ?auto_26730 ?auto_26766 ) ) ( not ( = ?auto_26731 ?auto_26736 ) ) ( not ( = ?auto_26731 ?auto_26766 ) ) ( not ( = ?auto_26732 ?auto_26736 ) ) ( not ( = ?auto_26732 ?auto_26766 ) ) ( not ( = ?auto_26733 ?auto_26736 ) ) ( not ( = ?auto_26733 ?auto_26766 ) ) ( not ( = ?auto_26734 ?auto_26736 ) ) ( not ( = ?auto_26734 ?auto_26766 ) ) ( not ( = ?auto_26736 ?auto_26758 ) ) ( not ( = ?auto_26736 ?auto_26750 ) ) ( not ( = ?auto_26736 ?auto_26765 ) ) ( not ( = ?auto_26736 ?auto_26747 ) ) ( not ( = ?auto_26736 ?auto_26748 ) ) ( not ( = ?auto_26736 ?auto_26762 ) ) ( not ( = ?auto_26736 ?auto_26751 ) ) ( not ( = ?auto_26736 ?auto_26768 ) ) ( not ( = ?auto_26736 ?auto_26757 ) ) ( not ( = ?auto_26766 ?auto_26758 ) ) ( not ( = ?auto_26766 ?auto_26750 ) ) ( not ( = ?auto_26766 ?auto_26765 ) ) ( not ( = ?auto_26766 ?auto_26747 ) ) ( not ( = ?auto_26766 ?auto_26748 ) ) ( not ( = ?auto_26766 ?auto_26762 ) ) ( not ( = ?auto_26766 ?auto_26751 ) ) ( not ( = ?auto_26766 ?auto_26768 ) ) ( not ( = ?auto_26766 ?auto_26757 ) ) ( not ( = ?auto_26726 ?auto_26737 ) ) ( not ( = ?auto_26726 ?auto_26745 ) ) ( not ( = ?auto_26727 ?auto_26737 ) ) ( not ( = ?auto_26727 ?auto_26745 ) ) ( not ( = ?auto_26728 ?auto_26737 ) ) ( not ( = ?auto_26728 ?auto_26745 ) ) ( not ( = ?auto_26729 ?auto_26737 ) ) ( not ( = ?auto_26729 ?auto_26745 ) ) ( not ( = ?auto_26730 ?auto_26737 ) ) ( not ( = ?auto_26730 ?auto_26745 ) ) ( not ( = ?auto_26731 ?auto_26737 ) ) ( not ( = ?auto_26731 ?auto_26745 ) ) ( not ( = ?auto_26732 ?auto_26737 ) ) ( not ( = ?auto_26732 ?auto_26745 ) ) ( not ( = ?auto_26733 ?auto_26737 ) ) ( not ( = ?auto_26733 ?auto_26745 ) ) ( not ( = ?auto_26734 ?auto_26737 ) ) ( not ( = ?auto_26734 ?auto_26745 ) ) ( not ( = ?auto_26735 ?auto_26737 ) ) ( not ( = ?auto_26735 ?auto_26745 ) ) ( not ( = ?auto_26737 ?auto_26766 ) ) ( not ( = ?auto_26737 ?auto_26758 ) ) ( not ( = ?auto_26737 ?auto_26750 ) ) ( not ( = ?auto_26737 ?auto_26765 ) ) ( not ( = ?auto_26737 ?auto_26747 ) ) ( not ( = ?auto_26737 ?auto_26748 ) ) ( not ( = ?auto_26737 ?auto_26762 ) ) ( not ( = ?auto_26737 ?auto_26751 ) ) ( not ( = ?auto_26737 ?auto_26768 ) ) ( not ( = ?auto_26737 ?auto_26757 ) ) ( not ( = ?auto_26746 ?auto_26753 ) ) ( not ( = ?auto_26746 ?auto_26742 ) ) ( not ( = ?auto_26746 ?auto_26754 ) ) ( not ( = ?auto_26746 ?auto_26756 ) ) ( not ( = ?auto_26746 ?auto_26749 ) ) ( not ( = ?auto_26746 ?auto_26752 ) ) ( not ( = ?auto_26746 ?auto_26769 ) ) ( not ( = ?auto_26761 ?auto_26764 ) ) ( not ( = ?auto_26761 ?auto_26744 ) ) ( not ( = ?auto_26761 ?auto_26759 ) ) ( not ( = ?auto_26761 ?auto_26755 ) ) ( not ( = ?auto_26761 ?auto_26763 ) ) ( not ( = ?auto_26761 ?auto_26760 ) ) ( not ( = ?auto_26761 ?auto_26767 ) ) ( not ( = ?auto_26745 ?auto_26766 ) ) ( not ( = ?auto_26745 ?auto_26758 ) ) ( not ( = ?auto_26745 ?auto_26750 ) ) ( not ( = ?auto_26745 ?auto_26765 ) ) ( not ( = ?auto_26745 ?auto_26747 ) ) ( not ( = ?auto_26745 ?auto_26748 ) ) ( not ( = ?auto_26745 ?auto_26762 ) ) ( not ( = ?auto_26745 ?auto_26751 ) ) ( not ( = ?auto_26745 ?auto_26768 ) ) ( not ( = ?auto_26745 ?auto_26757 ) ) ( not ( = ?auto_26726 ?auto_26738 ) ) ( not ( = ?auto_26726 ?auto_26740 ) ) ( not ( = ?auto_26727 ?auto_26738 ) ) ( not ( = ?auto_26727 ?auto_26740 ) ) ( not ( = ?auto_26728 ?auto_26738 ) ) ( not ( = ?auto_26728 ?auto_26740 ) ) ( not ( = ?auto_26729 ?auto_26738 ) ) ( not ( = ?auto_26729 ?auto_26740 ) ) ( not ( = ?auto_26730 ?auto_26738 ) ) ( not ( = ?auto_26730 ?auto_26740 ) ) ( not ( = ?auto_26731 ?auto_26738 ) ) ( not ( = ?auto_26731 ?auto_26740 ) ) ( not ( = ?auto_26732 ?auto_26738 ) ) ( not ( = ?auto_26732 ?auto_26740 ) ) ( not ( = ?auto_26733 ?auto_26738 ) ) ( not ( = ?auto_26733 ?auto_26740 ) ) ( not ( = ?auto_26734 ?auto_26738 ) ) ( not ( = ?auto_26734 ?auto_26740 ) ) ( not ( = ?auto_26735 ?auto_26738 ) ) ( not ( = ?auto_26735 ?auto_26740 ) ) ( not ( = ?auto_26736 ?auto_26738 ) ) ( not ( = ?auto_26736 ?auto_26740 ) ) ( not ( = ?auto_26738 ?auto_26745 ) ) ( not ( = ?auto_26738 ?auto_26766 ) ) ( not ( = ?auto_26738 ?auto_26758 ) ) ( not ( = ?auto_26738 ?auto_26750 ) ) ( not ( = ?auto_26738 ?auto_26765 ) ) ( not ( = ?auto_26738 ?auto_26747 ) ) ( not ( = ?auto_26738 ?auto_26748 ) ) ( not ( = ?auto_26738 ?auto_26762 ) ) ( not ( = ?auto_26738 ?auto_26751 ) ) ( not ( = ?auto_26738 ?auto_26768 ) ) ( not ( = ?auto_26738 ?auto_26757 ) ) ( not ( = ?auto_26740 ?auto_26745 ) ) ( not ( = ?auto_26740 ?auto_26766 ) ) ( not ( = ?auto_26740 ?auto_26758 ) ) ( not ( = ?auto_26740 ?auto_26750 ) ) ( not ( = ?auto_26740 ?auto_26765 ) ) ( not ( = ?auto_26740 ?auto_26747 ) ) ( not ( = ?auto_26740 ?auto_26748 ) ) ( not ( = ?auto_26740 ?auto_26762 ) ) ( not ( = ?auto_26740 ?auto_26751 ) ) ( not ( = ?auto_26740 ?auto_26768 ) ) ( not ( = ?auto_26740 ?auto_26757 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_26726 ?auto_26727 ?auto_26728 ?auto_26729 ?auto_26730 ?auto_26731 ?auto_26732 ?auto_26733 ?auto_26734 ?auto_26735 ?auto_26736 ?auto_26737 )
      ( MAKE-1CRATE ?auto_26737 ?auto_26738 )
      ( MAKE-12CRATE-VERIFY ?auto_26726 ?auto_26727 ?auto_26728 ?auto_26729 ?auto_26730 ?auto_26731 ?auto_26732 ?auto_26733 ?auto_26734 ?auto_26735 ?auto_26736 ?auto_26737 ?auto_26738 ) )
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
      ?auto_26801 - SURFACE
      ?auto_26802 - SURFACE
      ?auto_26803 - SURFACE
      ?auto_26804 - SURFACE
      ?auto_26805 - SURFACE
      ?auto_26806 - SURFACE
      ?auto_26807 - SURFACE
    )
    :vars
    (
      ?auto_26810 - HOIST
      ?auto_26811 - PLACE
      ?auto_26809 - PLACE
      ?auto_26808 - HOIST
      ?auto_26813 - SURFACE
      ?auto_26817 - PLACE
      ?auto_26825 - HOIST
      ?auto_26835 - SURFACE
      ?auto_26819 - PLACE
      ?auto_26834 - HOIST
      ?auto_26822 - SURFACE
      ?auto_26832 - PLACE
      ?auto_26821 - HOIST
      ?auto_26840 - SURFACE
      ?auto_26826 - SURFACE
      ?auto_26839 - PLACE
      ?auto_26815 - HOIST
      ?auto_26828 - SURFACE
      ?auto_26829 - PLACE
      ?auto_26824 - HOIST
      ?auto_26833 - SURFACE
      ?auto_26814 - PLACE
      ?auto_26827 - HOIST
      ?auto_26838 - SURFACE
      ?auto_26837 - PLACE
      ?auto_26841 - HOIST
      ?auto_26830 - SURFACE
      ?auto_26823 - PLACE
      ?auto_26836 - HOIST
      ?auto_26816 - SURFACE
      ?auto_26820 - SURFACE
      ?auto_26831 - SURFACE
      ?auto_26818 - SURFACE
      ?auto_26812 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26810 ?auto_26811 ) ( IS-CRATE ?auto_26807 ) ( not ( = ?auto_26809 ?auto_26811 ) ) ( HOIST-AT ?auto_26808 ?auto_26809 ) ( AVAILABLE ?auto_26808 ) ( SURFACE-AT ?auto_26807 ?auto_26809 ) ( ON ?auto_26807 ?auto_26813 ) ( CLEAR ?auto_26807 ) ( not ( = ?auto_26806 ?auto_26807 ) ) ( not ( = ?auto_26806 ?auto_26813 ) ) ( not ( = ?auto_26807 ?auto_26813 ) ) ( not ( = ?auto_26810 ?auto_26808 ) ) ( IS-CRATE ?auto_26806 ) ( not ( = ?auto_26817 ?auto_26811 ) ) ( HOIST-AT ?auto_26825 ?auto_26817 ) ( SURFACE-AT ?auto_26806 ?auto_26817 ) ( ON ?auto_26806 ?auto_26835 ) ( CLEAR ?auto_26806 ) ( not ( = ?auto_26805 ?auto_26806 ) ) ( not ( = ?auto_26805 ?auto_26835 ) ) ( not ( = ?auto_26806 ?auto_26835 ) ) ( not ( = ?auto_26810 ?auto_26825 ) ) ( IS-CRATE ?auto_26805 ) ( not ( = ?auto_26819 ?auto_26811 ) ) ( HOIST-AT ?auto_26834 ?auto_26819 ) ( AVAILABLE ?auto_26834 ) ( SURFACE-AT ?auto_26805 ?auto_26819 ) ( ON ?auto_26805 ?auto_26822 ) ( CLEAR ?auto_26805 ) ( not ( = ?auto_26804 ?auto_26805 ) ) ( not ( = ?auto_26804 ?auto_26822 ) ) ( not ( = ?auto_26805 ?auto_26822 ) ) ( not ( = ?auto_26810 ?auto_26834 ) ) ( IS-CRATE ?auto_26804 ) ( not ( = ?auto_26832 ?auto_26811 ) ) ( HOIST-AT ?auto_26821 ?auto_26832 ) ( SURFACE-AT ?auto_26804 ?auto_26832 ) ( ON ?auto_26804 ?auto_26840 ) ( CLEAR ?auto_26804 ) ( not ( = ?auto_26803 ?auto_26804 ) ) ( not ( = ?auto_26803 ?auto_26840 ) ) ( not ( = ?auto_26804 ?auto_26840 ) ) ( not ( = ?auto_26810 ?auto_26821 ) ) ( IS-CRATE ?auto_26803 ) ( SURFACE-AT ?auto_26803 ?auto_26817 ) ( ON ?auto_26803 ?auto_26826 ) ( CLEAR ?auto_26803 ) ( not ( = ?auto_26802 ?auto_26803 ) ) ( not ( = ?auto_26802 ?auto_26826 ) ) ( not ( = ?auto_26803 ?auto_26826 ) ) ( IS-CRATE ?auto_26802 ) ( not ( = ?auto_26839 ?auto_26811 ) ) ( HOIST-AT ?auto_26815 ?auto_26839 ) ( AVAILABLE ?auto_26815 ) ( SURFACE-AT ?auto_26802 ?auto_26839 ) ( ON ?auto_26802 ?auto_26828 ) ( CLEAR ?auto_26802 ) ( not ( = ?auto_26801 ?auto_26802 ) ) ( not ( = ?auto_26801 ?auto_26828 ) ) ( not ( = ?auto_26802 ?auto_26828 ) ) ( not ( = ?auto_26810 ?auto_26815 ) ) ( IS-CRATE ?auto_26801 ) ( not ( = ?auto_26829 ?auto_26811 ) ) ( HOIST-AT ?auto_26824 ?auto_26829 ) ( AVAILABLE ?auto_26824 ) ( SURFACE-AT ?auto_26801 ?auto_26829 ) ( ON ?auto_26801 ?auto_26833 ) ( CLEAR ?auto_26801 ) ( not ( = ?auto_26800 ?auto_26801 ) ) ( not ( = ?auto_26800 ?auto_26833 ) ) ( not ( = ?auto_26801 ?auto_26833 ) ) ( not ( = ?auto_26810 ?auto_26824 ) ) ( IS-CRATE ?auto_26800 ) ( not ( = ?auto_26814 ?auto_26811 ) ) ( HOIST-AT ?auto_26827 ?auto_26814 ) ( AVAILABLE ?auto_26827 ) ( SURFACE-AT ?auto_26800 ?auto_26814 ) ( ON ?auto_26800 ?auto_26838 ) ( CLEAR ?auto_26800 ) ( not ( = ?auto_26799 ?auto_26800 ) ) ( not ( = ?auto_26799 ?auto_26838 ) ) ( not ( = ?auto_26800 ?auto_26838 ) ) ( not ( = ?auto_26810 ?auto_26827 ) ) ( IS-CRATE ?auto_26799 ) ( not ( = ?auto_26837 ?auto_26811 ) ) ( HOIST-AT ?auto_26841 ?auto_26837 ) ( AVAILABLE ?auto_26841 ) ( SURFACE-AT ?auto_26799 ?auto_26837 ) ( ON ?auto_26799 ?auto_26830 ) ( CLEAR ?auto_26799 ) ( not ( = ?auto_26798 ?auto_26799 ) ) ( not ( = ?auto_26798 ?auto_26830 ) ) ( not ( = ?auto_26799 ?auto_26830 ) ) ( not ( = ?auto_26810 ?auto_26841 ) ) ( IS-CRATE ?auto_26798 ) ( not ( = ?auto_26823 ?auto_26811 ) ) ( HOIST-AT ?auto_26836 ?auto_26823 ) ( SURFACE-AT ?auto_26798 ?auto_26823 ) ( ON ?auto_26798 ?auto_26816 ) ( CLEAR ?auto_26798 ) ( not ( = ?auto_26797 ?auto_26798 ) ) ( not ( = ?auto_26797 ?auto_26816 ) ) ( not ( = ?auto_26798 ?auto_26816 ) ) ( not ( = ?auto_26810 ?auto_26836 ) ) ( IS-CRATE ?auto_26797 ) ( AVAILABLE ?auto_26821 ) ( SURFACE-AT ?auto_26797 ?auto_26832 ) ( ON ?auto_26797 ?auto_26820 ) ( CLEAR ?auto_26797 ) ( not ( = ?auto_26796 ?auto_26797 ) ) ( not ( = ?auto_26796 ?auto_26820 ) ) ( not ( = ?auto_26797 ?auto_26820 ) ) ( IS-CRATE ?auto_26796 ) ( AVAILABLE ?auto_26836 ) ( SURFACE-AT ?auto_26796 ?auto_26823 ) ( ON ?auto_26796 ?auto_26831 ) ( CLEAR ?auto_26796 ) ( not ( = ?auto_26795 ?auto_26796 ) ) ( not ( = ?auto_26795 ?auto_26831 ) ) ( not ( = ?auto_26796 ?auto_26831 ) ) ( SURFACE-AT ?auto_26794 ?auto_26811 ) ( CLEAR ?auto_26794 ) ( IS-CRATE ?auto_26795 ) ( AVAILABLE ?auto_26810 ) ( AVAILABLE ?auto_26825 ) ( SURFACE-AT ?auto_26795 ?auto_26817 ) ( ON ?auto_26795 ?auto_26818 ) ( CLEAR ?auto_26795 ) ( TRUCK-AT ?auto_26812 ?auto_26811 ) ( not ( = ?auto_26794 ?auto_26795 ) ) ( not ( = ?auto_26794 ?auto_26818 ) ) ( not ( = ?auto_26795 ?auto_26818 ) ) ( not ( = ?auto_26794 ?auto_26796 ) ) ( not ( = ?auto_26794 ?auto_26831 ) ) ( not ( = ?auto_26796 ?auto_26818 ) ) ( not ( = ?auto_26823 ?auto_26817 ) ) ( not ( = ?auto_26836 ?auto_26825 ) ) ( not ( = ?auto_26831 ?auto_26818 ) ) ( not ( = ?auto_26794 ?auto_26797 ) ) ( not ( = ?auto_26794 ?auto_26820 ) ) ( not ( = ?auto_26795 ?auto_26797 ) ) ( not ( = ?auto_26795 ?auto_26820 ) ) ( not ( = ?auto_26797 ?auto_26831 ) ) ( not ( = ?auto_26797 ?auto_26818 ) ) ( not ( = ?auto_26832 ?auto_26823 ) ) ( not ( = ?auto_26832 ?auto_26817 ) ) ( not ( = ?auto_26821 ?auto_26836 ) ) ( not ( = ?auto_26821 ?auto_26825 ) ) ( not ( = ?auto_26820 ?auto_26831 ) ) ( not ( = ?auto_26820 ?auto_26818 ) ) ( not ( = ?auto_26794 ?auto_26798 ) ) ( not ( = ?auto_26794 ?auto_26816 ) ) ( not ( = ?auto_26795 ?auto_26798 ) ) ( not ( = ?auto_26795 ?auto_26816 ) ) ( not ( = ?auto_26796 ?auto_26798 ) ) ( not ( = ?auto_26796 ?auto_26816 ) ) ( not ( = ?auto_26798 ?auto_26820 ) ) ( not ( = ?auto_26798 ?auto_26831 ) ) ( not ( = ?auto_26798 ?auto_26818 ) ) ( not ( = ?auto_26816 ?auto_26820 ) ) ( not ( = ?auto_26816 ?auto_26831 ) ) ( not ( = ?auto_26816 ?auto_26818 ) ) ( not ( = ?auto_26794 ?auto_26799 ) ) ( not ( = ?auto_26794 ?auto_26830 ) ) ( not ( = ?auto_26795 ?auto_26799 ) ) ( not ( = ?auto_26795 ?auto_26830 ) ) ( not ( = ?auto_26796 ?auto_26799 ) ) ( not ( = ?auto_26796 ?auto_26830 ) ) ( not ( = ?auto_26797 ?auto_26799 ) ) ( not ( = ?auto_26797 ?auto_26830 ) ) ( not ( = ?auto_26799 ?auto_26816 ) ) ( not ( = ?auto_26799 ?auto_26820 ) ) ( not ( = ?auto_26799 ?auto_26831 ) ) ( not ( = ?auto_26799 ?auto_26818 ) ) ( not ( = ?auto_26837 ?auto_26823 ) ) ( not ( = ?auto_26837 ?auto_26832 ) ) ( not ( = ?auto_26837 ?auto_26817 ) ) ( not ( = ?auto_26841 ?auto_26836 ) ) ( not ( = ?auto_26841 ?auto_26821 ) ) ( not ( = ?auto_26841 ?auto_26825 ) ) ( not ( = ?auto_26830 ?auto_26816 ) ) ( not ( = ?auto_26830 ?auto_26820 ) ) ( not ( = ?auto_26830 ?auto_26831 ) ) ( not ( = ?auto_26830 ?auto_26818 ) ) ( not ( = ?auto_26794 ?auto_26800 ) ) ( not ( = ?auto_26794 ?auto_26838 ) ) ( not ( = ?auto_26795 ?auto_26800 ) ) ( not ( = ?auto_26795 ?auto_26838 ) ) ( not ( = ?auto_26796 ?auto_26800 ) ) ( not ( = ?auto_26796 ?auto_26838 ) ) ( not ( = ?auto_26797 ?auto_26800 ) ) ( not ( = ?auto_26797 ?auto_26838 ) ) ( not ( = ?auto_26798 ?auto_26800 ) ) ( not ( = ?auto_26798 ?auto_26838 ) ) ( not ( = ?auto_26800 ?auto_26830 ) ) ( not ( = ?auto_26800 ?auto_26816 ) ) ( not ( = ?auto_26800 ?auto_26820 ) ) ( not ( = ?auto_26800 ?auto_26831 ) ) ( not ( = ?auto_26800 ?auto_26818 ) ) ( not ( = ?auto_26814 ?auto_26837 ) ) ( not ( = ?auto_26814 ?auto_26823 ) ) ( not ( = ?auto_26814 ?auto_26832 ) ) ( not ( = ?auto_26814 ?auto_26817 ) ) ( not ( = ?auto_26827 ?auto_26841 ) ) ( not ( = ?auto_26827 ?auto_26836 ) ) ( not ( = ?auto_26827 ?auto_26821 ) ) ( not ( = ?auto_26827 ?auto_26825 ) ) ( not ( = ?auto_26838 ?auto_26830 ) ) ( not ( = ?auto_26838 ?auto_26816 ) ) ( not ( = ?auto_26838 ?auto_26820 ) ) ( not ( = ?auto_26838 ?auto_26831 ) ) ( not ( = ?auto_26838 ?auto_26818 ) ) ( not ( = ?auto_26794 ?auto_26801 ) ) ( not ( = ?auto_26794 ?auto_26833 ) ) ( not ( = ?auto_26795 ?auto_26801 ) ) ( not ( = ?auto_26795 ?auto_26833 ) ) ( not ( = ?auto_26796 ?auto_26801 ) ) ( not ( = ?auto_26796 ?auto_26833 ) ) ( not ( = ?auto_26797 ?auto_26801 ) ) ( not ( = ?auto_26797 ?auto_26833 ) ) ( not ( = ?auto_26798 ?auto_26801 ) ) ( not ( = ?auto_26798 ?auto_26833 ) ) ( not ( = ?auto_26799 ?auto_26801 ) ) ( not ( = ?auto_26799 ?auto_26833 ) ) ( not ( = ?auto_26801 ?auto_26838 ) ) ( not ( = ?auto_26801 ?auto_26830 ) ) ( not ( = ?auto_26801 ?auto_26816 ) ) ( not ( = ?auto_26801 ?auto_26820 ) ) ( not ( = ?auto_26801 ?auto_26831 ) ) ( not ( = ?auto_26801 ?auto_26818 ) ) ( not ( = ?auto_26829 ?auto_26814 ) ) ( not ( = ?auto_26829 ?auto_26837 ) ) ( not ( = ?auto_26829 ?auto_26823 ) ) ( not ( = ?auto_26829 ?auto_26832 ) ) ( not ( = ?auto_26829 ?auto_26817 ) ) ( not ( = ?auto_26824 ?auto_26827 ) ) ( not ( = ?auto_26824 ?auto_26841 ) ) ( not ( = ?auto_26824 ?auto_26836 ) ) ( not ( = ?auto_26824 ?auto_26821 ) ) ( not ( = ?auto_26824 ?auto_26825 ) ) ( not ( = ?auto_26833 ?auto_26838 ) ) ( not ( = ?auto_26833 ?auto_26830 ) ) ( not ( = ?auto_26833 ?auto_26816 ) ) ( not ( = ?auto_26833 ?auto_26820 ) ) ( not ( = ?auto_26833 ?auto_26831 ) ) ( not ( = ?auto_26833 ?auto_26818 ) ) ( not ( = ?auto_26794 ?auto_26802 ) ) ( not ( = ?auto_26794 ?auto_26828 ) ) ( not ( = ?auto_26795 ?auto_26802 ) ) ( not ( = ?auto_26795 ?auto_26828 ) ) ( not ( = ?auto_26796 ?auto_26802 ) ) ( not ( = ?auto_26796 ?auto_26828 ) ) ( not ( = ?auto_26797 ?auto_26802 ) ) ( not ( = ?auto_26797 ?auto_26828 ) ) ( not ( = ?auto_26798 ?auto_26802 ) ) ( not ( = ?auto_26798 ?auto_26828 ) ) ( not ( = ?auto_26799 ?auto_26802 ) ) ( not ( = ?auto_26799 ?auto_26828 ) ) ( not ( = ?auto_26800 ?auto_26802 ) ) ( not ( = ?auto_26800 ?auto_26828 ) ) ( not ( = ?auto_26802 ?auto_26833 ) ) ( not ( = ?auto_26802 ?auto_26838 ) ) ( not ( = ?auto_26802 ?auto_26830 ) ) ( not ( = ?auto_26802 ?auto_26816 ) ) ( not ( = ?auto_26802 ?auto_26820 ) ) ( not ( = ?auto_26802 ?auto_26831 ) ) ( not ( = ?auto_26802 ?auto_26818 ) ) ( not ( = ?auto_26839 ?auto_26829 ) ) ( not ( = ?auto_26839 ?auto_26814 ) ) ( not ( = ?auto_26839 ?auto_26837 ) ) ( not ( = ?auto_26839 ?auto_26823 ) ) ( not ( = ?auto_26839 ?auto_26832 ) ) ( not ( = ?auto_26839 ?auto_26817 ) ) ( not ( = ?auto_26815 ?auto_26824 ) ) ( not ( = ?auto_26815 ?auto_26827 ) ) ( not ( = ?auto_26815 ?auto_26841 ) ) ( not ( = ?auto_26815 ?auto_26836 ) ) ( not ( = ?auto_26815 ?auto_26821 ) ) ( not ( = ?auto_26815 ?auto_26825 ) ) ( not ( = ?auto_26828 ?auto_26833 ) ) ( not ( = ?auto_26828 ?auto_26838 ) ) ( not ( = ?auto_26828 ?auto_26830 ) ) ( not ( = ?auto_26828 ?auto_26816 ) ) ( not ( = ?auto_26828 ?auto_26820 ) ) ( not ( = ?auto_26828 ?auto_26831 ) ) ( not ( = ?auto_26828 ?auto_26818 ) ) ( not ( = ?auto_26794 ?auto_26803 ) ) ( not ( = ?auto_26794 ?auto_26826 ) ) ( not ( = ?auto_26795 ?auto_26803 ) ) ( not ( = ?auto_26795 ?auto_26826 ) ) ( not ( = ?auto_26796 ?auto_26803 ) ) ( not ( = ?auto_26796 ?auto_26826 ) ) ( not ( = ?auto_26797 ?auto_26803 ) ) ( not ( = ?auto_26797 ?auto_26826 ) ) ( not ( = ?auto_26798 ?auto_26803 ) ) ( not ( = ?auto_26798 ?auto_26826 ) ) ( not ( = ?auto_26799 ?auto_26803 ) ) ( not ( = ?auto_26799 ?auto_26826 ) ) ( not ( = ?auto_26800 ?auto_26803 ) ) ( not ( = ?auto_26800 ?auto_26826 ) ) ( not ( = ?auto_26801 ?auto_26803 ) ) ( not ( = ?auto_26801 ?auto_26826 ) ) ( not ( = ?auto_26803 ?auto_26828 ) ) ( not ( = ?auto_26803 ?auto_26833 ) ) ( not ( = ?auto_26803 ?auto_26838 ) ) ( not ( = ?auto_26803 ?auto_26830 ) ) ( not ( = ?auto_26803 ?auto_26816 ) ) ( not ( = ?auto_26803 ?auto_26820 ) ) ( not ( = ?auto_26803 ?auto_26831 ) ) ( not ( = ?auto_26803 ?auto_26818 ) ) ( not ( = ?auto_26826 ?auto_26828 ) ) ( not ( = ?auto_26826 ?auto_26833 ) ) ( not ( = ?auto_26826 ?auto_26838 ) ) ( not ( = ?auto_26826 ?auto_26830 ) ) ( not ( = ?auto_26826 ?auto_26816 ) ) ( not ( = ?auto_26826 ?auto_26820 ) ) ( not ( = ?auto_26826 ?auto_26831 ) ) ( not ( = ?auto_26826 ?auto_26818 ) ) ( not ( = ?auto_26794 ?auto_26804 ) ) ( not ( = ?auto_26794 ?auto_26840 ) ) ( not ( = ?auto_26795 ?auto_26804 ) ) ( not ( = ?auto_26795 ?auto_26840 ) ) ( not ( = ?auto_26796 ?auto_26804 ) ) ( not ( = ?auto_26796 ?auto_26840 ) ) ( not ( = ?auto_26797 ?auto_26804 ) ) ( not ( = ?auto_26797 ?auto_26840 ) ) ( not ( = ?auto_26798 ?auto_26804 ) ) ( not ( = ?auto_26798 ?auto_26840 ) ) ( not ( = ?auto_26799 ?auto_26804 ) ) ( not ( = ?auto_26799 ?auto_26840 ) ) ( not ( = ?auto_26800 ?auto_26804 ) ) ( not ( = ?auto_26800 ?auto_26840 ) ) ( not ( = ?auto_26801 ?auto_26804 ) ) ( not ( = ?auto_26801 ?auto_26840 ) ) ( not ( = ?auto_26802 ?auto_26804 ) ) ( not ( = ?auto_26802 ?auto_26840 ) ) ( not ( = ?auto_26804 ?auto_26826 ) ) ( not ( = ?auto_26804 ?auto_26828 ) ) ( not ( = ?auto_26804 ?auto_26833 ) ) ( not ( = ?auto_26804 ?auto_26838 ) ) ( not ( = ?auto_26804 ?auto_26830 ) ) ( not ( = ?auto_26804 ?auto_26816 ) ) ( not ( = ?auto_26804 ?auto_26820 ) ) ( not ( = ?auto_26804 ?auto_26831 ) ) ( not ( = ?auto_26804 ?auto_26818 ) ) ( not ( = ?auto_26840 ?auto_26826 ) ) ( not ( = ?auto_26840 ?auto_26828 ) ) ( not ( = ?auto_26840 ?auto_26833 ) ) ( not ( = ?auto_26840 ?auto_26838 ) ) ( not ( = ?auto_26840 ?auto_26830 ) ) ( not ( = ?auto_26840 ?auto_26816 ) ) ( not ( = ?auto_26840 ?auto_26820 ) ) ( not ( = ?auto_26840 ?auto_26831 ) ) ( not ( = ?auto_26840 ?auto_26818 ) ) ( not ( = ?auto_26794 ?auto_26805 ) ) ( not ( = ?auto_26794 ?auto_26822 ) ) ( not ( = ?auto_26795 ?auto_26805 ) ) ( not ( = ?auto_26795 ?auto_26822 ) ) ( not ( = ?auto_26796 ?auto_26805 ) ) ( not ( = ?auto_26796 ?auto_26822 ) ) ( not ( = ?auto_26797 ?auto_26805 ) ) ( not ( = ?auto_26797 ?auto_26822 ) ) ( not ( = ?auto_26798 ?auto_26805 ) ) ( not ( = ?auto_26798 ?auto_26822 ) ) ( not ( = ?auto_26799 ?auto_26805 ) ) ( not ( = ?auto_26799 ?auto_26822 ) ) ( not ( = ?auto_26800 ?auto_26805 ) ) ( not ( = ?auto_26800 ?auto_26822 ) ) ( not ( = ?auto_26801 ?auto_26805 ) ) ( not ( = ?auto_26801 ?auto_26822 ) ) ( not ( = ?auto_26802 ?auto_26805 ) ) ( not ( = ?auto_26802 ?auto_26822 ) ) ( not ( = ?auto_26803 ?auto_26805 ) ) ( not ( = ?auto_26803 ?auto_26822 ) ) ( not ( = ?auto_26805 ?auto_26840 ) ) ( not ( = ?auto_26805 ?auto_26826 ) ) ( not ( = ?auto_26805 ?auto_26828 ) ) ( not ( = ?auto_26805 ?auto_26833 ) ) ( not ( = ?auto_26805 ?auto_26838 ) ) ( not ( = ?auto_26805 ?auto_26830 ) ) ( not ( = ?auto_26805 ?auto_26816 ) ) ( not ( = ?auto_26805 ?auto_26820 ) ) ( not ( = ?auto_26805 ?auto_26831 ) ) ( not ( = ?auto_26805 ?auto_26818 ) ) ( not ( = ?auto_26819 ?auto_26832 ) ) ( not ( = ?auto_26819 ?auto_26817 ) ) ( not ( = ?auto_26819 ?auto_26839 ) ) ( not ( = ?auto_26819 ?auto_26829 ) ) ( not ( = ?auto_26819 ?auto_26814 ) ) ( not ( = ?auto_26819 ?auto_26837 ) ) ( not ( = ?auto_26819 ?auto_26823 ) ) ( not ( = ?auto_26834 ?auto_26821 ) ) ( not ( = ?auto_26834 ?auto_26825 ) ) ( not ( = ?auto_26834 ?auto_26815 ) ) ( not ( = ?auto_26834 ?auto_26824 ) ) ( not ( = ?auto_26834 ?auto_26827 ) ) ( not ( = ?auto_26834 ?auto_26841 ) ) ( not ( = ?auto_26834 ?auto_26836 ) ) ( not ( = ?auto_26822 ?auto_26840 ) ) ( not ( = ?auto_26822 ?auto_26826 ) ) ( not ( = ?auto_26822 ?auto_26828 ) ) ( not ( = ?auto_26822 ?auto_26833 ) ) ( not ( = ?auto_26822 ?auto_26838 ) ) ( not ( = ?auto_26822 ?auto_26830 ) ) ( not ( = ?auto_26822 ?auto_26816 ) ) ( not ( = ?auto_26822 ?auto_26820 ) ) ( not ( = ?auto_26822 ?auto_26831 ) ) ( not ( = ?auto_26822 ?auto_26818 ) ) ( not ( = ?auto_26794 ?auto_26806 ) ) ( not ( = ?auto_26794 ?auto_26835 ) ) ( not ( = ?auto_26795 ?auto_26806 ) ) ( not ( = ?auto_26795 ?auto_26835 ) ) ( not ( = ?auto_26796 ?auto_26806 ) ) ( not ( = ?auto_26796 ?auto_26835 ) ) ( not ( = ?auto_26797 ?auto_26806 ) ) ( not ( = ?auto_26797 ?auto_26835 ) ) ( not ( = ?auto_26798 ?auto_26806 ) ) ( not ( = ?auto_26798 ?auto_26835 ) ) ( not ( = ?auto_26799 ?auto_26806 ) ) ( not ( = ?auto_26799 ?auto_26835 ) ) ( not ( = ?auto_26800 ?auto_26806 ) ) ( not ( = ?auto_26800 ?auto_26835 ) ) ( not ( = ?auto_26801 ?auto_26806 ) ) ( not ( = ?auto_26801 ?auto_26835 ) ) ( not ( = ?auto_26802 ?auto_26806 ) ) ( not ( = ?auto_26802 ?auto_26835 ) ) ( not ( = ?auto_26803 ?auto_26806 ) ) ( not ( = ?auto_26803 ?auto_26835 ) ) ( not ( = ?auto_26804 ?auto_26806 ) ) ( not ( = ?auto_26804 ?auto_26835 ) ) ( not ( = ?auto_26806 ?auto_26822 ) ) ( not ( = ?auto_26806 ?auto_26840 ) ) ( not ( = ?auto_26806 ?auto_26826 ) ) ( not ( = ?auto_26806 ?auto_26828 ) ) ( not ( = ?auto_26806 ?auto_26833 ) ) ( not ( = ?auto_26806 ?auto_26838 ) ) ( not ( = ?auto_26806 ?auto_26830 ) ) ( not ( = ?auto_26806 ?auto_26816 ) ) ( not ( = ?auto_26806 ?auto_26820 ) ) ( not ( = ?auto_26806 ?auto_26831 ) ) ( not ( = ?auto_26806 ?auto_26818 ) ) ( not ( = ?auto_26835 ?auto_26822 ) ) ( not ( = ?auto_26835 ?auto_26840 ) ) ( not ( = ?auto_26835 ?auto_26826 ) ) ( not ( = ?auto_26835 ?auto_26828 ) ) ( not ( = ?auto_26835 ?auto_26833 ) ) ( not ( = ?auto_26835 ?auto_26838 ) ) ( not ( = ?auto_26835 ?auto_26830 ) ) ( not ( = ?auto_26835 ?auto_26816 ) ) ( not ( = ?auto_26835 ?auto_26820 ) ) ( not ( = ?auto_26835 ?auto_26831 ) ) ( not ( = ?auto_26835 ?auto_26818 ) ) ( not ( = ?auto_26794 ?auto_26807 ) ) ( not ( = ?auto_26794 ?auto_26813 ) ) ( not ( = ?auto_26795 ?auto_26807 ) ) ( not ( = ?auto_26795 ?auto_26813 ) ) ( not ( = ?auto_26796 ?auto_26807 ) ) ( not ( = ?auto_26796 ?auto_26813 ) ) ( not ( = ?auto_26797 ?auto_26807 ) ) ( not ( = ?auto_26797 ?auto_26813 ) ) ( not ( = ?auto_26798 ?auto_26807 ) ) ( not ( = ?auto_26798 ?auto_26813 ) ) ( not ( = ?auto_26799 ?auto_26807 ) ) ( not ( = ?auto_26799 ?auto_26813 ) ) ( not ( = ?auto_26800 ?auto_26807 ) ) ( not ( = ?auto_26800 ?auto_26813 ) ) ( not ( = ?auto_26801 ?auto_26807 ) ) ( not ( = ?auto_26801 ?auto_26813 ) ) ( not ( = ?auto_26802 ?auto_26807 ) ) ( not ( = ?auto_26802 ?auto_26813 ) ) ( not ( = ?auto_26803 ?auto_26807 ) ) ( not ( = ?auto_26803 ?auto_26813 ) ) ( not ( = ?auto_26804 ?auto_26807 ) ) ( not ( = ?auto_26804 ?auto_26813 ) ) ( not ( = ?auto_26805 ?auto_26807 ) ) ( not ( = ?auto_26805 ?auto_26813 ) ) ( not ( = ?auto_26807 ?auto_26835 ) ) ( not ( = ?auto_26807 ?auto_26822 ) ) ( not ( = ?auto_26807 ?auto_26840 ) ) ( not ( = ?auto_26807 ?auto_26826 ) ) ( not ( = ?auto_26807 ?auto_26828 ) ) ( not ( = ?auto_26807 ?auto_26833 ) ) ( not ( = ?auto_26807 ?auto_26838 ) ) ( not ( = ?auto_26807 ?auto_26830 ) ) ( not ( = ?auto_26807 ?auto_26816 ) ) ( not ( = ?auto_26807 ?auto_26820 ) ) ( not ( = ?auto_26807 ?auto_26831 ) ) ( not ( = ?auto_26807 ?auto_26818 ) ) ( not ( = ?auto_26809 ?auto_26817 ) ) ( not ( = ?auto_26809 ?auto_26819 ) ) ( not ( = ?auto_26809 ?auto_26832 ) ) ( not ( = ?auto_26809 ?auto_26839 ) ) ( not ( = ?auto_26809 ?auto_26829 ) ) ( not ( = ?auto_26809 ?auto_26814 ) ) ( not ( = ?auto_26809 ?auto_26837 ) ) ( not ( = ?auto_26809 ?auto_26823 ) ) ( not ( = ?auto_26808 ?auto_26825 ) ) ( not ( = ?auto_26808 ?auto_26834 ) ) ( not ( = ?auto_26808 ?auto_26821 ) ) ( not ( = ?auto_26808 ?auto_26815 ) ) ( not ( = ?auto_26808 ?auto_26824 ) ) ( not ( = ?auto_26808 ?auto_26827 ) ) ( not ( = ?auto_26808 ?auto_26841 ) ) ( not ( = ?auto_26808 ?auto_26836 ) ) ( not ( = ?auto_26813 ?auto_26835 ) ) ( not ( = ?auto_26813 ?auto_26822 ) ) ( not ( = ?auto_26813 ?auto_26840 ) ) ( not ( = ?auto_26813 ?auto_26826 ) ) ( not ( = ?auto_26813 ?auto_26828 ) ) ( not ( = ?auto_26813 ?auto_26833 ) ) ( not ( = ?auto_26813 ?auto_26838 ) ) ( not ( = ?auto_26813 ?auto_26830 ) ) ( not ( = ?auto_26813 ?auto_26816 ) ) ( not ( = ?auto_26813 ?auto_26820 ) ) ( not ( = ?auto_26813 ?auto_26831 ) ) ( not ( = ?auto_26813 ?auto_26818 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_26794 ?auto_26795 ?auto_26796 ?auto_26797 ?auto_26798 ?auto_26799 ?auto_26800 ?auto_26801 ?auto_26802 ?auto_26803 ?auto_26804 ?auto_26805 ?auto_26806 )
      ( MAKE-1CRATE ?auto_26806 ?auto_26807 )
      ( MAKE-13CRATE-VERIFY ?auto_26794 ?auto_26795 ?auto_26796 ?auto_26797 ?auto_26798 ?auto_26799 ?auto_26800 ?auto_26801 ?auto_26802 ?auto_26803 ?auto_26804 ?auto_26805 ?auto_26806 ?auto_26807 ) )
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
      ?auto_26874 - SURFACE
      ?auto_26875 - SURFACE
      ?auto_26876 - SURFACE
      ?auto_26877 - SURFACE
      ?auto_26878 - SURFACE
      ?auto_26879 - SURFACE
      ?auto_26881 - SURFACE
      ?auto_26880 - SURFACE
    )
    :vars
    (
      ?auto_26887 - HOIST
      ?auto_26884 - PLACE
      ?auto_26885 - PLACE
      ?auto_26886 - HOIST
      ?auto_26882 - SURFACE
      ?auto_26900 - PLACE
      ?auto_26912 - HOIST
      ?auto_26911 - SURFACE
      ?auto_26906 - PLACE
      ?auto_26904 - HOIST
      ?auto_26918 - SURFACE
      ?auto_26895 - PLACE
      ?auto_26902 - HOIST
      ?auto_26909 - SURFACE
      ?auto_26890 - PLACE
      ?auto_26899 - HOIST
      ?auto_26898 - SURFACE
      ?auto_26915 - SURFACE
      ?auto_26910 - PLACE
      ?auto_26907 - HOIST
      ?auto_26916 - SURFACE
      ?auto_26891 - PLACE
      ?auto_26892 - HOIST
      ?auto_26889 - SURFACE
      ?auto_26888 - PLACE
      ?auto_26905 - HOIST
      ?auto_26901 - SURFACE
      ?auto_26893 - PLACE
      ?auto_26914 - HOIST
      ?auto_26917 - SURFACE
      ?auto_26896 - PLACE
      ?auto_26903 - HOIST
      ?auto_26913 - SURFACE
      ?auto_26897 - SURFACE
      ?auto_26894 - SURFACE
      ?auto_26908 - SURFACE
      ?auto_26883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26887 ?auto_26884 ) ( IS-CRATE ?auto_26880 ) ( not ( = ?auto_26885 ?auto_26884 ) ) ( HOIST-AT ?auto_26886 ?auto_26885 ) ( AVAILABLE ?auto_26886 ) ( SURFACE-AT ?auto_26880 ?auto_26885 ) ( ON ?auto_26880 ?auto_26882 ) ( CLEAR ?auto_26880 ) ( not ( = ?auto_26881 ?auto_26880 ) ) ( not ( = ?auto_26881 ?auto_26882 ) ) ( not ( = ?auto_26880 ?auto_26882 ) ) ( not ( = ?auto_26887 ?auto_26886 ) ) ( IS-CRATE ?auto_26881 ) ( not ( = ?auto_26900 ?auto_26884 ) ) ( HOIST-AT ?auto_26912 ?auto_26900 ) ( AVAILABLE ?auto_26912 ) ( SURFACE-AT ?auto_26881 ?auto_26900 ) ( ON ?auto_26881 ?auto_26911 ) ( CLEAR ?auto_26881 ) ( not ( = ?auto_26879 ?auto_26881 ) ) ( not ( = ?auto_26879 ?auto_26911 ) ) ( not ( = ?auto_26881 ?auto_26911 ) ) ( not ( = ?auto_26887 ?auto_26912 ) ) ( IS-CRATE ?auto_26879 ) ( not ( = ?auto_26906 ?auto_26884 ) ) ( HOIST-AT ?auto_26904 ?auto_26906 ) ( SURFACE-AT ?auto_26879 ?auto_26906 ) ( ON ?auto_26879 ?auto_26918 ) ( CLEAR ?auto_26879 ) ( not ( = ?auto_26878 ?auto_26879 ) ) ( not ( = ?auto_26878 ?auto_26918 ) ) ( not ( = ?auto_26879 ?auto_26918 ) ) ( not ( = ?auto_26887 ?auto_26904 ) ) ( IS-CRATE ?auto_26878 ) ( not ( = ?auto_26895 ?auto_26884 ) ) ( HOIST-AT ?auto_26902 ?auto_26895 ) ( AVAILABLE ?auto_26902 ) ( SURFACE-AT ?auto_26878 ?auto_26895 ) ( ON ?auto_26878 ?auto_26909 ) ( CLEAR ?auto_26878 ) ( not ( = ?auto_26877 ?auto_26878 ) ) ( not ( = ?auto_26877 ?auto_26909 ) ) ( not ( = ?auto_26878 ?auto_26909 ) ) ( not ( = ?auto_26887 ?auto_26902 ) ) ( IS-CRATE ?auto_26877 ) ( not ( = ?auto_26890 ?auto_26884 ) ) ( HOIST-AT ?auto_26899 ?auto_26890 ) ( SURFACE-AT ?auto_26877 ?auto_26890 ) ( ON ?auto_26877 ?auto_26898 ) ( CLEAR ?auto_26877 ) ( not ( = ?auto_26876 ?auto_26877 ) ) ( not ( = ?auto_26876 ?auto_26898 ) ) ( not ( = ?auto_26877 ?auto_26898 ) ) ( not ( = ?auto_26887 ?auto_26899 ) ) ( IS-CRATE ?auto_26876 ) ( SURFACE-AT ?auto_26876 ?auto_26906 ) ( ON ?auto_26876 ?auto_26915 ) ( CLEAR ?auto_26876 ) ( not ( = ?auto_26875 ?auto_26876 ) ) ( not ( = ?auto_26875 ?auto_26915 ) ) ( not ( = ?auto_26876 ?auto_26915 ) ) ( IS-CRATE ?auto_26875 ) ( not ( = ?auto_26910 ?auto_26884 ) ) ( HOIST-AT ?auto_26907 ?auto_26910 ) ( AVAILABLE ?auto_26907 ) ( SURFACE-AT ?auto_26875 ?auto_26910 ) ( ON ?auto_26875 ?auto_26916 ) ( CLEAR ?auto_26875 ) ( not ( = ?auto_26874 ?auto_26875 ) ) ( not ( = ?auto_26874 ?auto_26916 ) ) ( not ( = ?auto_26875 ?auto_26916 ) ) ( not ( = ?auto_26887 ?auto_26907 ) ) ( IS-CRATE ?auto_26874 ) ( not ( = ?auto_26891 ?auto_26884 ) ) ( HOIST-AT ?auto_26892 ?auto_26891 ) ( AVAILABLE ?auto_26892 ) ( SURFACE-AT ?auto_26874 ?auto_26891 ) ( ON ?auto_26874 ?auto_26889 ) ( CLEAR ?auto_26874 ) ( not ( = ?auto_26873 ?auto_26874 ) ) ( not ( = ?auto_26873 ?auto_26889 ) ) ( not ( = ?auto_26874 ?auto_26889 ) ) ( not ( = ?auto_26887 ?auto_26892 ) ) ( IS-CRATE ?auto_26873 ) ( not ( = ?auto_26888 ?auto_26884 ) ) ( HOIST-AT ?auto_26905 ?auto_26888 ) ( AVAILABLE ?auto_26905 ) ( SURFACE-AT ?auto_26873 ?auto_26888 ) ( ON ?auto_26873 ?auto_26901 ) ( CLEAR ?auto_26873 ) ( not ( = ?auto_26872 ?auto_26873 ) ) ( not ( = ?auto_26872 ?auto_26901 ) ) ( not ( = ?auto_26873 ?auto_26901 ) ) ( not ( = ?auto_26887 ?auto_26905 ) ) ( IS-CRATE ?auto_26872 ) ( not ( = ?auto_26893 ?auto_26884 ) ) ( HOIST-AT ?auto_26914 ?auto_26893 ) ( AVAILABLE ?auto_26914 ) ( SURFACE-AT ?auto_26872 ?auto_26893 ) ( ON ?auto_26872 ?auto_26917 ) ( CLEAR ?auto_26872 ) ( not ( = ?auto_26871 ?auto_26872 ) ) ( not ( = ?auto_26871 ?auto_26917 ) ) ( not ( = ?auto_26872 ?auto_26917 ) ) ( not ( = ?auto_26887 ?auto_26914 ) ) ( IS-CRATE ?auto_26871 ) ( not ( = ?auto_26896 ?auto_26884 ) ) ( HOIST-AT ?auto_26903 ?auto_26896 ) ( SURFACE-AT ?auto_26871 ?auto_26896 ) ( ON ?auto_26871 ?auto_26913 ) ( CLEAR ?auto_26871 ) ( not ( = ?auto_26870 ?auto_26871 ) ) ( not ( = ?auto_26870 ?auto_26913 ) ) ( not ( = ?auto_26871 ?auto_26913 ) ) ( not ( = ?auto_26887 ?auto_26903 ) ) ( IS-CRATE ?auto_26870 ) ( AVAILABLE ?auto_26899 ) ( SURFACE-AT ?auto_26870 ?auto_26890 ) ( ON ?auto_26870 ?auto_26897 ) ( CLEAR ?auto_26870 ) ( not ( = ?auto_26869 ?auto_26870 ) ) ( not ( = ?auto_26869 ?auto_26897 ) ) ( not ( = ?auto_26870 ?auto_26897 ) ) ( IS-CRATE ?auto_26869 ) ( AVAILABLE ?auto_26903 ) ( SURFACE-AT ?auto_26869 ?auto_26896 ) ( ON ?auto_26869 ?auto_26894 ) ( CLEAR ?auto_26869 ) ( not ( = ?auto_26868 ?auto_26869 ) ) ( not ( = ?auto_26868 ?auto_26894 ) ) ( not ( = ?auto_26869 ?auto_26894 ) ) ( SURFACE-AT ?auto_26867 ?auto_26884 ) ( CLEAR ?auto_26867 ) ( IS-CRATE ?auto_26868 ) ( AVAILABLE ?auto_26887 ) ( AVAILABLE ?auto_26904 ) ( SURFACE-AT ?auto_26868 ?auto_26906 ) ( ON ?auto_26868 ?auto_26908 ) ( CLEAR ?auto_26868 ) ( TRUCK-AT ?auto_26883 ?auto_26884 ) ( not ( = ?auto_26867 ?auto_26868 ) ) ( not ( = ?auto_26867 ?auto_26908 ) ) ( not ( = ?auto_26868 ?auto_26908 ) ) ( not ( = ?auto_26867 ?auto_26869 ) ) ( not ( = ?auto_26867 ?auto_26894 ) ) ( not ( = ?auto_26869 ?auto_26908 ) ) ( not ( = ?auto_26896 ?auto_26906 ) ) ( not ( = ?auto_26903 ?auto_26904 ) ) ( not ( = ?auto_26894 ?auto_26908 ) ) ( not ( = ?auto_26867 ?auto_26870 ) ) ( not ( = ?auto_26867 ?auto_26897 ) ) ( not ( = ?auto_26868 ?auto_26870 ) ) ( not ( = ?auto_26868 ?auto_26897 ) ) ( not ( = ?auto_26870 ?auto_26894 ) ) ( not ( = ?auto_26870 ?auto_26908 ) ) ( not ( = ?auto_26890 ?auto_26896 ) ) ( not ( = ?auto_26890 ?auto_26906 ) ) ( not ( = ?auto_26899 ?auto_26903 ) ) ( not ( = ?auto_26899 ?auto_26904 ) ) ( not ( = ?auto_26897 ?auto_26894 ) ) ( not ( = ?auto_26897 ?auto_26908 ) ) ( not ( = ?auto_26867 ?auto_26871 ) ) ( not ( = ?auto_26867 ?auto_26913 ) ) ( not ( = ?auto_26868 ?auto_26871 ) ) ( not ( = ?auto_26868 ?auto_26913 ) ) ( not ( = ?auto_26869 ?auto_26871 ) ) ( not ( = ?auto_26869 ?auto_26913 ) ) ( not ( = ?auto_26871 ?auto_26897 ) ) ( not ( = ?auto_26871 ?auto_26894 ) ) ( not ( = ?auto_26871 ?auto_26908 ) ) ( not ( = ?auto_26913 ?auto_26897 ) ) ( not ( = ?auto_26913 ?auto_26894 ) ) ( not ( = ?auto_26913 ?auto_26908 ) ) ( not ( = ?auto_26867 ?auto_26872 ) ) ( not ( = ?auto_26867 ?auto_26917 ) ) ( not ( = ?auto_26868 ?auto_26872 ) ) ( not ( = ?auto_26868 ?auto_26917 ) ) ( not ( = ?auto_26869 ?auto_26872 ) ) ( not ( = ?auto_26869 ?auto_26917 ) ) ( not ( = ?auto_26870 ?auto_26872 ) ) ( not ( = ?auto_26870 ?auto_26917 ) ) ( not ( = ?auto_26872 ?auto_26913 ) ) ( not ( = ?auto_26872 ?auto_26897 ) ) ( not ( = ?auto_26872 ?auto_26894 ) ) ( not ( = ?auto_26872 ?auto_26908 ) ) ( not ( = ?auto_26893 ?auto_26896 ) ) ( not ( = ?auto_26893 ?auto_26890 ) ) ( not ( = ?auto_26893 ?auto_26906 ) ) ( not ( = ?auto_26914 ?auto_26903 ) ) ( not ( = ?auto_26914 ?auto_26899 ) ) ( not ( = ?auto_26914 ?auto_26904 ) ) ( not ( = ?auto_26917 ?auto_26913 ) ) ( not ( = ?auto_26917 ?auto_26897 ) ) ( not ( = ?auto_26917 ?auto_26894 ) ) ( not ( = ?auto_26917 ?auto_26908 ) ) ( not ( = ?auto_26867 ?auto_26873 ) ) ( not ( = ?auto_26867 ?auto_26901 ) ) ( not ( = ?auto_26868 ?auto_26873 ) ) ( not ( = ?auto_26868 ?auto_26901 ) ) ( not ( = ?auto_26869 ?auto_26873 ) ) ( not ( = ?auto_26869 ?auto_26901 ) ) ( not ( = ?auto_26870 ?auto_26873 ) ) ( not ( = ?auto_26870 ?auto_26901 ) ) ( not ( = ?auto_26871 ?auto_26873 ) ) ( not ( = ?auto_26871 ?auto_26901 ) ) ( not ( = ?auto_26873 ?auto_26917 ) ) ( not ( = ?auto_26873 ?auto_26913 ) ) ( not ( = ?auto_26873 ?auto_26897 ) ) ( not ( = ?auto_26873 ?auto_26894 ) ) ( not ( = ?auto_26873 ?auto_26908 ) ) ( not ( = ?auto_26888 ?auto_26893 ) ) ( not ( = ?auto_26888 ?auto_26896 ) ) ( not ( = ?auto_26888 ?auto_26890 ) ) ( not ( = ?auto_26888 ?auto_26906 ) ) ( not ( = ?auto_26905 ?auto_26914 ) ) ( not ( = ?auto_26905 ?auto_26903 ) ) ( not ( = ?auto_26905 ?auto_26899 ) ) ( not ( = ?auto_26905 ?auto_26904 ) ) ( not ( = ?auto_26901 ?auto_26917 ) ) ( not ( = ?auto_26901 ?auto_26913 ) ) ( not ( = ?auto_26901 ?auto_26897 ) ) ( not ( = ?auto_26901 ?auto_26894 ) ) ( not ( = ?auto_26901 ?auto_26908 ) ) ( not ( = ?auto_26867 ?auto_26874 ) ) ( not ( = ?auto_26867 ?auto_26889 ) ) ( not ( = ?auto_26868 ?auto_26874 ) ) ( not ( = ?auto_26868 ?auto_26889 ) ) ( not ( = ?auto_26869 ?auto_26874 ) ) ( not ( = ?auto_26869 ?auto_26889 ) ) ( not ( = ?auto_26870 ?auto_26874 ) ) ( not ( = ?auto_26870 ?auto_26889 ) ) ( not ( = ?auto_26871 ?auto_26874 ) ) ( not ( = ?auto_26871 ?auto_26889 ) ) ( not ( = ?auto_26872 ?auto_26874 ) ) ( not ( = ?auto_26872 ?auto_26889 ) ) ( not ( = ?auto_26874 ?auto_26901 ) ) ( not ( = ?auto_26874 ?auto_26917 ) ) ( not ( = ?auto_26874 ?auto_26913 ) ) ( not ( = ?auto_26874 ?auto_26897 ) ) ( not ( = ?auto_26874 ?auto_26894 ) ) ( not ( = ?auto_26874 ?auto_26908 ) ) ( not ( = ?auto_26891 ?auto_26888 ) ) ( not ( = ?auto_26891 ?auto_26893 ) ) ( not ( = ?auto_26891 ?auto_26896 ) ) ( not ( = ?auto_26891 ?auto_26890 ) ) ( not ( = ?auto_26891 ?auto_26906 ) ) ( not ( = ?auto_26892 ?auto_26905 ) ) ( not ( = ?auto_26892 ?auto_26914 ) ) ( not ( = ?auto_26892 ?auto_26903 ) ) ( not ( = ?auto_26892 ?auto_26899 ) ) ( not ( = ?auto_26892 ?auto_26904 ) ) ( not ( = ?auto_26889 ?auto_26901 ) ) ( not ( = ?auto_26889 ?auto_26917 ) ) ( not ( = ?auto_26889 ?auto_26913 ) ) ( not ( = ?auto_26889 ?auto_26897 ) ) ( not ( = ?auto_26889 ?auto_26894 ) ) ( not ( = ?auto_26889 ?auto_26908 ) ) ( not ( = ?auto_26867 ?auto_26875 ) ) ( not ( = ?auto_26867 ?auto_26916 ) ) ( not ( = ?auto_26868 ?auto_26875 ) ) ( not ( = ?auto_26868 ?auto_26916 ) ) ( not ( = ?auto_26869 ?auto_26875 ) ) ( not ( = ?auto_26869 ?auto_26916 ) ) ( not ( = ?auto_26870 ?auto_26875 ) ) ( not ( = ?auto_26870 ?auto_26916 ) ) ( not ( = ?auto_26871 ?auto_26875 ) ) ( not ( = ?auto_26871 ?auto_26916 ) ) ( not ( = ?auto_26872 ?auto_26875 ) ) ( not ( = ?auto_26872 ?auto_26916 ) ) ( not ( = ?auto_26873 ?auto_26875 ) ) ( not ( = ?auto_26873 ?auto_26916 ) ) ( not ( = ?auto_26875 ?auto_26889 ) ) ( not ( = ?auto_26875 ?auto_26901 ) ) ( not ( = ?auto_26875 ?auto_26917 ) ) ( not ( = ?auto_26875 ?auto_26913 ) ) ( not ( = ?auto_26875 ?auto_26897 ) ) ( not ( = ?auto_26875 ?auto_26894 ) ) ( not ( = ?auto_26875 ?auto_26908 ) ) ( not ( = ?auto_26910 ?auto_26891 ) ) ( not ( = ?auto_26910 ?auto_26888 ) ) ( not ( = ?auto_26910 ?auto_26893 ) ) ( not ( = ?auto_26910 ?auto_26896 ) ) ( not ( = ?auto_26910 ?auto_26890 ) ) ( not ( = ?auto_26910 ?auto_26906 ) ) ( not ( = ?auto_26907 ?auto_26892 ) ) ( not ( = ?auto_26907 ?auto_26905 ) ) ( not ( = ?auto_26907 ?auto_26914 ) ) ( not ( = ?auto_26907 ?auto_26903 ) ) ( not ( = ?auto_26907 ?auto_26899 ) ) ( not ( = ?auto_26907 ?auto_26904 ) ) ( not ( = ?auto_26916 ?auto_26889 ) ) ( not ( = ?auto_26916 ?auto_26901 ) ) ( not ( = ?auto_26916 ?auto_26917 ) ) ( not ( = ?auto_26916 ?auto_26913 ) ) ( not ( = ?auto_26916 ?auto_26897 ) ) ( not ( = ?auto_26916 ?auto_26894 ) ) ( not ( = ?auto_26916 ?auto_26908 ) ) ( not ( = ?auto_26867 ?auto_26876 ) ) ( not ( = ?auto_26867 ?auto_26915 ) ) ( not ( = ?auto_26868 ?auto_26876 ) ) ( not ( = ?auto_26868 ?auto_26915 ) ) ( not ( = ?auto_26869 ?auto_26876 ) ) ( not ( = ?auto_26869 ?auto_26915 ) ) ( not ( = ?auto_26870 ?auto_26876 ) ) ( not ( = ?auto_26870 ?auto_26915 ) ) ( not ( = ?auto_26871 ?auto_26876 ) ) ( not ( = ?auto_26871 ?auto_26915 ) ) ( not ( = ?auto_26872 ?auto_26876 ) ) ( not ( = ?auto_26872 ?auto_26915 ) ) ( not ( = ?auto_26873 ?auto_26876 ) ) ( not ( = ?auto_26873 ?auto_26915 ) ) ( not ( = ?auto_26874 ?auto_26876 ) ) ( not ( = ?auto_26874 ?auto_26915 ) ) ( not ( = ?auto_26876 ?auto_26916 ) ) ( not ( = ?auto_26876 ?auto_26889 ) ) ( not ( = ?auto_26876 ?auto_26901 ) ) ( not ( = ?auto_26876 ?auto_26917 ) ) ( not ( = ?auto_26876 ?auto_26913 ) ) ( not ( = ?auto_26876 ?auto_26897 ) ) ( not ( = ?auto_26876 ?auto_26894 ) ) ( not ( = ?auto_26876 ?auto_26908 ) ) ( not ( = ?auto_26915 ?auto_26916 ) ) ( not ( = ?auto_26915 ?auto_26889 ) ) ( not ( = ?auto_26915 ?auto_26901 ) ) ( not ( = ?auto_26915 ?auto_26917 ) ) ( not ( = ?auto_26915 ?auto_26913 ) ) ( not ( = ?auto_26915 ?auto_26897 ) ) ( not ( = ?auto_26915 ?auto_26894 ) ) ( not ( = ?auto_26915 ?auto_26908 ) ) ( not ( = ?auto_26867 ?auto_26877 ) ) ( not ( = ?auto_26867 ?auto_26898 ) ) ( not ( = ?auto_26868 ?auto_26877 ) ) ( not ( = ?auto_26868 ?auto_26898 ) ) ( not ( = ?auto_26869 ?auto_26877 ) ) ( not ( = ?auto_26869 ?auto_26898 ) ) ( not ( = ?auto_26870 ?auto_26877 ) ) ( not ( = ?auto_26870 ?auto_26898 ) ) ( not ( = ?auto_26871 ?auto_26877 ) ) ( not ( = ?auto_26871 ?auto_26898 ) ) ( not ( = ?auto_26872 ?auto_26877 ) ) ( not ( = ?auto_26872 ?auto_26898 ) ) ( not ( = ?auto_26873 ?auto_26877 ) ) ( not ( = ?auto_26873 ?auto_26898 ) ) ( not ( = ?auto_26874 ?auto_26877 ) ) ( not ( = ?auto_26874 ?auto_26898 ) ) ( not ( = ?auto_26875 ?auto_26877 ) ) ( not ( = ?auto_26875 ?auto_26898 ) ) ( not ( = ?auto_26877 ?auto_26915 ) ) ( not ( = ?auto_26877 ?auto_26916 ) ) ( not ( = ?auto_26877 ?auto_26889 ) ) ( not ( = ?auto_26877 ?auto_26901 ) ) ( not ( = ?auto_26877 ?auto_26917 ) ) ( not ( = ?auto_26877 ?auto_26913 ) ) ( not ( = ?auto_26877 ?auto_26897 ) ) ( not ( = ?auto_26877 ?auto_26894 ) ) ( not ( = ?auto_26877 ?auto_26908 ) ) ( not ( = ?auto_26898 ?auto_26915 ) ) ( not ( = ?auto_26898 ?auto_26916 ) ) ( not ( = ?auto_26898 ?auto_26889 ) ) ( not ( = ?auto_26898 ?auto_26901 ) ) ( not ( = ?auto_26898 ?auto_26917 ) ) ( not ( = ?auto_26898 ?auto_26913 ) ) ( not ( = ?auto_26898 ?auto_26897 ) ) ( not ( = ?auto_26898 ?auto_26894 ) ) ( not ( = ?auto_26898 ?auto_26908 ) ) ( not ( = ?auto_26867 ?auto_26878 ) ) ( not ( = ?auto_26867 ?auto_26909 ) ) ( not ( = ?auto_26868 ?auto_26878 ) ) ( not ( = ?auto_26868 ?auto_26909 ) ) ( not ( = ?auto_26869 ?auto_26878 ) ) ( not ( = ?auto_26869 ?auto_26909 ) ) ( not ( = ?auto_26870 ?auto_26878 ) ) ( not ( = ?auto_26870 ?auto_26909 ) ) ( not ( = ?auto_26871 ?auto_26878 ) ) ( not ( = ?auto_26871 ?auto_26909 ) ) ( not ( = ?auto_26872 ?auto_26878 ) ) ( not ( = ?auto_26872 ?auto_26909 ) ) ( not ( = ?auto_26873 ?auto_26878 ) ) ( not ( = ?auto_26873 ?auto_26909 ) ) ( not ( = ?auto_26874 ?auto_26878 ) ) ( not ( = ?auto_26874 ?auto_26909 ) ) ( not ( = ?auto_26875 ?auto_26878 ) ) ( not ( = ?auto_26875 ?auto_26909 ) ) ( not ( = ?auto_26876 ?auto_26878 ) ) ( not ( = ?auto_26876 ?auto_26909 ) ) ( not ( = ?auto_26878 ?auto_26898 ) ) ( not ( = ?auto_26878 ?auto_26915 ) ) ( not ( = ?auto_26878 ?auto_26916 ) ) ( not ( = ?auto_26878 ?auto_26889 ) ) ( not ( = ?auto_26878 ?auto_26901 ) ) ( not ( = ?auto_26878 ?auto_26917 ) ) ( not ( = ?auto_26878 ?auto_26913 ) ) ( not ( = ?auto_26878 ?auto_26897 ) ) ( not ( = ?auto_26878 ?auto_26894 ) ) ( not ( = ?auto_26878 ?auto_26908 ) ) ( not ( = ?auto_26895 ?auto_26890 ) ) ( not ( = ?auto_26895 ?auto_26906 ) ) ( not ( = ?auto_26895 ?auto_26910 ) ) ( not ( = ?auto_26895 ?auto_26891 ) ) ( not ( = ?auto_26895 ?auto_26888 ) ) ( not ( = ?auto_26895 ?auto_26893 ) ) ( not ( = ?auto_26895 ?auto_26896 ) ) ( not ( = ?auto_26902 ?auto_26899 ) ) ( not ( = ?auto_26902 ?auto_26904 ) ) ( not ( = ?auto_26902 ?auto_26907 ) ) ( not ( = ?auto_26902 ?auto_26892 ) ) ( not ( = ?auto_26902 ?auto_26905 ) ) ( not ( = ?auto_26902 ?auto_26914 ) ) ( not ( = ?auto_26902 ?auto_26903 ) ) ( not ( = ?auto_26909 ?auto_26898 ) ) ( not ( = ?auto_26909 ?auto_26915 ) ) ( not ( = ?auto_26909 ?auto_26916 ) ) ( not ( = ?auto_26909 ?auto_26889 ) ) ( not ( = ?auto_26909 ?auto_26901 ) ) ( not ( = ?auto_26909 ?auto_26917 ) ) ( not ( = ?auto_26909 ?auto_26913 ) ) ( not ( = ?auto_26909 ?auto_26897 ) ) ( not ( = ?auto_26909 ?auto_26894 ) ) ( not ( = ?auto_26909 ?auto_26908 ) ) ( not ( = ?auto_26867 ?auto_26879 ) ) ( not ( = ?auto_26867 ?auto_26918 ) ) ( not ( = ?auto_26868 ?auto_26879 ) ) ( not ( = ?auto_26868 ?auto_26918 ) ) ( not ( = ?auto_26869 ?auto_26879 ) ) ( not ( = ?auto_26869 ?auto_26918 ) ) ( not ( = ?auto_26870 ?auto_26879 ) ) ( not ( = ?auto_26870 ?auto_26918 ) ) ( not ( = ?auto_26871 ?auto_26879 ) ) ( not ( = ?auto_26871 ?auto_26918 ) ) ( not ( = ?auto_26872 ?auto_26879 ) ) ( not ( = ?auto_26872 ?auto_26918 ) ) ( not ( = ?auto_26873 ?auto_26879 ) ) ( not ( = ?auto_26873 ?auto_26918 ) ) ( not ( = ?auto_26874 ?auto_26879 ) ) ( not ( = ?auto_26874 ?auto_26918 ) ) ( not ( = ?auto_26875 ?auto_26879 ) ) ( not ( = ?auto_26875 ?auto_26918 ) ) ( not ( = ?auto_26876 ?auto_26879 ) ) ( not ( = ?auto_26876 ?auto_26918 ) ) ( not ( = ?auto_26877 ?auto_26879 ) ) ( not ( = ?auto_26877 ?auto_26918 ) ) ( not ( = ?auto_26879 ?auto_26909 ) ) ( not ( = ?auto_26879 ?auto_26898 ) ) ( not ( = ?auto_26879 ?auto_26915 ) ) ( not ( = ?auto_26879 ?auto_26916 ) ) ( not ( = ?auto_26879 ?auto_26889 ) ) ( not ( = ?auto_26879 ?auto_26901 ) ) ( not ( = ?auto_26879 ?auto_26917 ) ) ( not ( = ?auto_26879 ?auto_26913 ) ) ( not ( = ?auto_26879 ?auto_26897 ) ) ( not ( = ?auto_26879 ?auto_26894 ) ) ( not ( = ?auto_26879 ?auto_26908 ) ) ( not ( = ?auto_26918 ?auto_26909 ) ) ( not ( = ?auto_26918 ?auto_26898 ) ) ( not ( = ?auto_26918 ?auto_26915 ) ) ( not ( = ?auto_26918 ?auto_26916 ) ) ( not ( = ?auto_26918 ?auto_26889 ) ) ( not ( = ?auto_26918 ?auto_26901 ) ) ( not ( = ?auto_26918 ?auto_26917 ) ) ( not ( = ?auto_26918 ?auto_26913 ) ) ( not ( = ?auto_26918 ?auto_26897 ) ) ( not ( = ?auto_26918 ?auto_26894 ) ) ( not ( = ?auto_26918 ?auto_26908 ) ) ( not ( = ?auto_26867 ?auto_26881 ) ) ( not ( = ?auto_26867 ?auto_26911 ) ) ( not ( = ?auto_26868 ?auto_26881 ) ) ( not ( = ?auto_26868 ?auto_26911 ) ) ( not ( = ?auto_26869 ?auto_26881 ) ) ( not ( = ?auto_26869 ?auto_26911 ) ) ( not ( = ?auto_26870 ?auto_26881 ) ) ( not ( = ?auto_26870 ?auto_26911 ) ) ( not ( = ?auto_26871 ?auto_26881 ) ) ( not ( = ?auto_26871 ?auto_26911 ) ) ( not ( = ?auto_26872 ?auto_26881 ) ) ( not ( = ?auto_26872 ?auto_26911 ) ) ( not ( = ?auto_26873 ?auto_26881 ) ) ( not ( = ?auto_26873 ?auto_26911 ) ) ( not ( = ?auto_26874 ?auto_26881 ) ) ( not ( = ?auto_26874 ?auto_26911 ) ) ( not ( = ?auto_26875 ?auto_26881 ) ) ( not ( = ?auto_26875 ?auto_26911 ) ) ( not ( = ?auto_26876 ?auto_26881 ) ) ( not ( = ?auto_26876 ?auto_26911 ) ) ( not ( = ?auto_26877 ?auto_26881 ) ) ( not ( = ?auto_26877 ?auto_26911 ) ) ( not ( = ?auto_26878 ?auto_26881 ) ) ( not ( = ?auto_26878 ?auto_26911 ) ) ( not ( = ?auto_26881 ?auto_26918 ) ) ( not ( = ?auto_26881 ?auto_26909 ) ) ( not ( = ?auto_26881 ?auto_26898 ) ) ( not ( = ?auto_26881 ?auto_26915 ) ) ( not ( = ?auto_26881 ?auto_26916 ) ) ( not ( = ?auto_26881 ?auto_26889 ) ) ( not ( = ?auto_26881 ?auto_26901 ) ) ( not ( = ?auto_26881 ?auto_26917 ) ) ( not ( = ?auto_26881 ?auto_26913 ) ) ( not ( = ?auto_26881 ?auto_26897 ) ) ( not ( = ?auto_26881 ?auto_26894 ) ) ( not ( = ?auto_26881 ?auto_26908 ) ) ( not ( = ?auto_26900 ?auto_26906 ) ) ( not ( = ?auto_26900 ?auto_26895 ) ) ( not ( = ?auto_26900 ?auto_26890 ) ) ( not ( = ?auto_26900 ?auto_26910 ) ) ( not ( = ?auto_26900 ?auto_26891 ) ) ( not ( = ?auto_26900 ?auto_26888 ) ) ( not ( = ?auto_26900 ?auto_26893 ) ) ( not ( = ?auto_26900 ?auto_26896 ) ) ( not ( = ?auto_26912 ?auto_26904 ) ) ( not ( = ?auto_26912 ?auto_26902 ) ) ( not ( = ?auto_26912 ?auto_26899 ) ) ( not ( = ?auto_26912 ?auto_26907 ) ) ( not ( = ?auto_26912 ?auto_26892 ) ) ( not ( = ?auto_26912 ?auto_26905 ) ) ( not ( = ?auto_26912 ?auto_26914 ) ) ( not ( = ?auto_26912 ?auto_26903 ) ) ( not ( = ?auto_26911 ?auto_26918 ) ) ( not ( = ?auto_26911 ?auto_26909 ) ) ( not ( = ?auto_26911 ?auto_26898 ) ) ( not ( = ?auto_26911 ?auto_26915 ) ) ( not ( = ?auto_26911 ?auto_26916 ) ) ( not ( = ?auto_26911 ?auto_26889 ) ) ( not ( = ?auto_26911 ?auto_26901 ) ) ( not ( = ?auto_26911 ?auto_26917 ) ) ( not ( = ?auto_26911 ?auto_26913 ) ) ( not ( = ?auto_26911 ?auto_26897 ) ) ( not ( = ?auto_26911 ?auto_26894 ) ) ( not ( = ?auto_26911 ?auto_26908 ) ) ( not ( = ?auto_26867 ?auto_26880 ) ) ( not ( = ?auto_26867 ?auto_26882 ) ) ( not ( = ?auto_26868 ?auto_26880 ) ) ( not ( = ?auto_26868 ?auto_26882 ) ) ( not ( = ?auto_26869 ?auto_26880 ) ) ( not ( = ?auto_26869 ?auto_26882 ) ) ( not ( = ?auto_26870 ?auto_26880 ) ) ( not ( = ?auto_26870 ?auto_26882 ) ) ( not ( = ?auto_26871 ?auto_26880 ) ) ( not ( = ?auto_26871 ?auto_26882 ) ) ( not ( = ?auto_26872 ?auto_26880 ) ) ( not ( = ?auto_26872 ?auto_26882 ) ) ( not ( = ?auto_26873 ?auto_26880 ) ) ( not ( = ?auto_26873 ?auto_26882 ) ) ( not ( = ?auto_26874 ?auto_26880 ) ) ( not ( = ?auto_26874 ?auto_26882 ) ) ( not ( = ?auto_26875 ?auto_26880 ) ) ( not ( = ?auto_26875 ?auto_26882 ) ) ( not ( = ?auto_26876 ?auto_26880 ) ) ( not ( = ?auto_26876 ?auto_26882 ) ) ( not ( = ?auto_26877 ?auto_26880 ) ) ( not ( = ?auto_26877 ?auto_26882 ) ) ( not ( = ?auto_26878 ?auto_26880 ) ) ( not ( = ?auto_26878 ?auto_26882 ) ) ( not ( = ?auto_26879 ?auto_26880 ) ) ( not ( = ?auto_26879 ?auto_26882 ) ) ( not ( = ?auto_26880 ?auto_26911 ) ) ( not ( = ?auto_26880 ?auto_26918 ) ) ( not ( = ?auto_26880 ?auto_26909 ) ) ( not ( = ?auto_26880 ?auto_26898 ) ) ( not ( = ?auto_26880 ?auto_26915 ) ) ( not ( = ?auto_26880 ?auto_26916 ) ) ( not ( = ?auto_26880 ?auto_26889 ) ) ( not ( = ?auto_26880 ?auto_26901 ) ) ( not ( = ?auto_26880 ?auto_26917 ) ) ( not ( = ?auto_26880 ?auto_26913 ) ) ( not ( = ?auto_26880 ?auto_26897 ) ) ( not ( = ?auto_26880 ?auto_26894 ) ) ( not ( = ?auto_26880 ?auto_26908 ) ) ( not ( = ?auto_26885 ?auto_26900 ) ) ( not ( = ?auto_26885 ?auto_26906 ) ) ( not ( = ?auto_26885 ?auto_26895 ) ) ( not ( = ?auto_26885 ?auto_26890 ) ) ( not ( = ?auto_26885 ?auto_26910 ) ) ( not ( = ?auto_26885 ?auto_26891 ) ) ( not ( = ?auto_26885 ?auto_26888 ) ) ( not ( = ?auto_26885 ?auto_26893 ) ) ( not ( = ?auto_26885 ?auto_26896 ) ) ( not ( = ?auto_26886 ?auto_26912 ) ) ( not ( = ?auto_26886 ?auto_26904 ) ) ( not ( = ?auto_26886 ?auto_26902 ) ) ( not ( = ?auto_26886 ?auto_26899 ) ) ( not ( = ?auto_26886 ?auto_26907 ) ) ( not ( = ?auto_26886 ?auto_26892 ) ) ( not ( = ?auto_26886 ?auto_26905 ) ) ( not ( = ?auto_26886 ?auto_26914 ) ) ( not ( = ?auto_26886 ?auto_26903 ) ) ( not ( = ?auto_26882 ?auto_26911 ) ) ( not ( = ?auto_26882 ?auto_26918 ) ) ( not ( = ?auto_26882 ?auto_26909 ) ) ( not ( = ?auto_26882 ?auto_26898 ) ) ( not ( = ?auto_26882 ?auto_26915 ) ) ( not ( = ?auto_26882 ?auto_26916 ) ) ( not ( = ?auto_26882 ?auto_26889 ) ) ( not ( = ?auto_26882 ?auto_26901 ) ) ( not ( = ?auto_26882 ?auto_26917 ) ) ( not ( = ?auto_26882 ?auto_26913 ) ) ( not ( = ?auto_26882 ?auto_26897 ) ) ( not ( = ?auto_26882 ?auto_26894 ) ) ( not ( = ?auto_26882 ?auto_26908 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_26867 ?auto_26868 ?auto_26869 ?auto_26870 ?auto_26871 ?auto_26872 ?auto_26873 ?auto_26874 ?auto_26875 ?auto_26876 ?auto_26877 ?auto_26878 ?auto_26879 ?auto_26881 )
      ( MAKE-1CRATE ?auto_26881 ?auto_26880 )
      ( MAKE-14CRATE-VERIFY ?auto_26867 ?auto_26868 ?auto_26869 ?auto_26870 ?auto_26871 ?auto_26872 ?auto_26873 ?auto_26874 ?auto_26875 ?auto_26876 ?auto_26877 ?auto_26878 ?auto_26879 ?auto_26881 ?auto_26880 ) )
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
      ?auto_26952 - SURFACE
      ?auto_26953 - SURFACE
      ?auto_26954 - SURFACE
      ?auto_26955 - SURFACE
      ?auto_26956 - SURFACE
      ?auto_26957 - SURFACE
      ?auto_26959 - SURFACE
      ?auto_26958 - SURFACE
      ?auto_26960 - SURFACE
    )
    :vars
    (
      ?auto_26965 - HOIST
      ?auto_26963 - PLACE
      ?auto_26961 - PLACE
      ?auto_26964 - HOIST
      ?auto_26962 - SURFACE
      ?auto_26977 - PLACE
      ?auto_26996 - HOIST
      ?auto_26999 - SURFACE
      ?auto_26971 - PLACE
      ?auto_26992 - HOIST
      ?auto_26967 - SURFACE
      ?auto_26989 - PLACE
      ?auto_26973 - HOIST
      ?auto_26983 - SURFACE
      ?auto_26997 - PLACE
      ?auto_26993 - HOIST
      ?auto_26994 - SURFACE
      ?auto_26974 - PLACE
      ?auto_26986 - HOIST
      ?auto_26982 - SURFACE
      ?auto_26979 - SURFACE
      ?auto_26985 - PLACE
      ?auto_26998 - HOIST
      ?auto_26987 - SURFACE
      ?auto_26970 - PLACE
      ?auto_26995 - HOIST
      ?auto_26990 - SURFACE
      ?auto_26981 - PLACE
      ?auto_26980 - HOIST
      ?auto_26978 - SURFACE
      ?auto_26988 - PLACE
      ?auto_26968 - HOIST
      ?auto_27000 - SURFACE
      ?auto_26975 - PLACE
      ?auto_26969 - HOIST
      ?auto_26984 - SURFACE
      ?auto_26991 - SURFACE
      ?auto_26976 - SURFACE
      ?auto_26972 - SURFACE
      ?auto_26966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_26965 ?auto_26963 ) ( IS-CRATE ?auto_26960 ) ( not ( = ?auto_26961 ?auto_26963 ) ) ( HOIST-AT ?auto_26964 ?auto_26961 ) ( AVAILABLE ?auto_26964 ) ( SURFACE-AT ?auto_26960 ?auto_26961 ) ( ON ?auto_26960 ?auto_26962 ) ( CLEAR ?auto_26960 ) ( not ( = ?auto_26958 ?auto_26960 ) ) ( not ( = ?auto_26958 ?auto_26962 ) ) ( not ( = ?auto_26960 ?auto_26962 ) ) ( not ( = ?auto_26965 ?auto_26964 ) ) ( IS-CRATE ?auto_26958 ) ( not ( = ?auto_26977 ?auto_26963 ) ) ( HOIST-AT ?auto_26996 ?auto_26977 ) ( AVAILABLE ?auto_26996 ) ( SURFACE-AT ?auto_26958 ?auto_26977 ) ( ON ?auto_26958 ?auto_26999 ) ( CLEAR ?auto_26958 ) ( not ( = ?auto_26959 ?auto_26958 ) ) ( not ( = ?auto_26959 ?auto_26999 ) ) ( not ( = ?auto_26958 ?auto_26999 ) ) ( not ( = ?auto_26965 ?auto_26996 ) ) ( IS-CRATE ?auto_26959 ) ( not ( = ?auto_26971 ?auto_26963 ) ) ( HOIST-AT ?auto_26992 ?auto_26971 ) ( AVAILABLE ?auto_26992 ) ( SURFACE-AT ?auto_26959 ?auto_26971 ) ( ON ?auto_26959 ?auto_26967 ) ( CLEAR ?auto_26959 ) ( not ( = ?auto_26957 ?auto_26959 ) ) ( not ( = ?auto_26957 ?auto_26967 ) ) ( not ( = ?auto_26959 ?auto_26967 ) ) ( not ( = ?auto_26965 ?auto_26992 ) ) ( IS-CRATE ?auto_26957 ) ( not ( = ?auto_26989 ?auto_26963 ) ) ( HOIST-AT ?auto_26973 ?auto_26989 ) ( SURFACE-AT ?auto_26957 ?auto_26989 ) ( ON ?auto_26957 ?auto_26983 ) ( CLEAR ?auto_26957 ) ( not ( = ?auto_26956 ?auto_26957 ) ) ( not ( = ?auto_26956 ?auto_26983 ) ) ( not ( = ?auto_26957 ?auto_26983 ) ) ( not ( = ?auto_26965 ?auto_26973 ) ) ( IS-CRATE ?auto_26956 ) ( not ( = ?auto_26997 ?auto_26963 ) ) ( HOIST-AT ?auto_26993 ?auto_26997 ) ( AVAILABLE ?auto_26993 ) ( SURFACE-AT ?auto_26956 ?auto_26997 ) ( ON ?auto_26956 ?auto_26994 ) ( CLEAR ?auto_26956 ) ( not ( = ?auto_26955 ?auto_26956 ) ) ( not ( = ?auto_26955 ?auto_26994 ) ) ( not ( = ?auto_26956 ?auto_26994 ) ) ( not ( = ?auto_26965 ?auto_26993 ) ) ( IS-CRATE ?auto_26955 ) ( not ( = ?auto_26974 ?auto_26963 ) ) ( HOIST-AT ?auto_26986 ?auto_26974 ) ( SURFACE-AT ?auto_26955 ?auto_26974 ) ( ON ?auto_26955 ?auto_26982 ) ( CLEAR ?auto_26955 ) ( not ( = ?auto_26954 ?auto_26955 ) ) ( not ( = ?auto_26954 ?auto_26982 ) ) ( not ( = ?auto_26955 ?auto_26982 ) ) ( not ( = ?auto_26965 ?auto_26986 ) ) ( IS-CRATE ?auto_26954 ) ( SURFACE-AT ?auto_26954 ?auto_26989 ) ( ON ?auto_26954 ?auto_26979 ) ( CLEAR ?auto_26954 ) ( not ( = ?auto_26953 ?auto_26954 ) ) ( not ( = ?auto_26953 ?auto_26979 ) ) ( not ( = ?auto_26954 ?auto_26979 ) ) ( IS-CRATE ?auto_26953 ) ( not ( = ?auto_26985 ?auto_26963 ) ) ( HOIST-AT ?auto_26998 ?auto_26985 ) ( AVAILABLE ?auto_26998 ) ( SURFACE-AT ?auto_26953 ?auto_26985 ) ( ON ?auto_26953 ?auto_26987 ) ( CLEAR ?auto_26953 ) ( not ( = ?auto_26952 ?auto_26953 ) ) ( not ( = ?auto_26952 ?auto_26987 ) ) ( not ( = ?auto_26953 ?auto_26987 ) ) ( not ( = ?auto_26965 ?auto_26998 ) ) ( IS-CRATE ?auto_26952 ) ( not ( = ?auto_26970 ?auto_26963 ) ) ( HOIST-AT ?auto_26995 ?auto_26970 ) ( AVAILABLE ?auto_26995 ) ( SURFACE-AT ?auto_26952 ?auto_26970 ) ( ON ?auto_26952 ?auto_26990 ) ( CLEAR ?auto_26952 ) ( not ( = ?auto_26951 ?auto_26952 ) ) ( not ( = ?auto_26951 ?auto_26990 ) ) ( not ( = ?auto_26952 ?auto_26990 ) ) ( not ( = ?auto_26965 ?auto_26995 ) ) ( IS-CRATE ?auto_26951 ) ( not ( = ?auto_26981 ?auto_26963 ) ) ( HOIST-AT ?auto_26980 ?auto_26981 ) ( AVAILABLE ?auto_26980 ) ( SURFACE-AT ?auto_26951 ?auto_26981 ) ( ON ?auto_26951 ?auto_26978 ) ( CLEAR ?auto_26951 ) ( not ( = ?auto_26950 ?auto_26951 ) ) ( not ( = ?auto_26950 ?auto_26978 ) ) ( not ( = ?auto_26951 ?auto_26978 ) ) ( not ( = ?auto_26965 ?auto_26980 ) ) ( IS-CRATE ?auto_26950 ) ( not ( = ?auto_26988 ?auto_26963 ) ) ( HOIST-AT ?auto_26968 ?auto_26988 ) ( AVAILABLE ?auto_26968 ) ( SURFACE-AT ?auto_26950 ?auto_26988 ) ( ON ?auto_26950 ?auto_27000 ) ( CLEAR ?auto_26950 ) ( not ( = ?auto_26949 ?auto_26950 ) ) ( not ( = ?auto_26949 ?auto_27000 ) ) ( not ( = ?auto_26950 ?auto_27000 ) ) ( not ( = ?auto_26965 ?auto_26968 ) ) ( IS-CRATE ?auto_26949 ) ( not ( = ?auto_26975 ?auto_26963 ) ) ( HOIST-AT ?auto_26969 ?auto_26975 ) ( SURFACE-AT ?auto_26949 ?auto_26975 ) ( ON ?auto_26949 ?auto_26984 ) ( CLEAR ?auto_26949 ) ( not ( = ?auto_26948 ?auto_26949 ) ) ( not ( = ?auto_26948 ?auto_26984 ) ) ( not ( = ?auto_26949 ?auto_26984 ) ) ( not ( = ?auto_26965 ?auto_26969 ) ) ( IS-CRATE ?auto_26948 ) ( AVAILABLE ?auto_26986 ) ( SURFACE-AT ?auto_26948 ?auto_26974 ) ( ON ?auto_26948 ?auto_26991 ) ( CLEAR ?auto_26948 ) ( not ( = ?auto_26947 ?auto_26948 ) ) ( not ( = ?auto_26947 ?auto_26991 ) ) ( not ( = ?auto_26948 ?auto_26991 ) ) ( IS-CRATE ?auto_26947 ) ( AVAILABLE ?auto_26969 ) ( SURFACE-AT ?auto_26947 ?auto_26975 ) ( ON ?auto_26947 ?auto_26976 ) ( CLEAR ?auto_26947 ) ( not ( = ?auto_26946 ?auto_26947 ) ) ( not ( = ?auto_26946 ?auto_26976 ) ) ( not ( = ?auto_26947 ?auto_26976 ) ) ( SURFACE-AT ?auto_26945 ?auto_26963 ) ( CLEAR ?auto_26945 ) ( IS-CRATE ?auto_26946 ) ( AVAILABLE ?auto_26965 ) ( AVAILABLE ?auto_26973 ) ( SURFACE-AT ?auto_26946 ?auto_26989 ) ( ON ?auto_26946 ?auto_26972 ) ( CLEAR ?auto_26946 ) ( TRUCK-AT ?auto_26966 ?auto_26963 ) ( not ( = ?auto_26945 ?auto_26946 ) ) ( not ( = ?auto_26945 ?auto_26972 ) ) ( not ( = ?auto_26946 ?auto_26972 ) ) ( not ( = ?auto_26945 ?auto_26947 ) ) ( not ( = ?auto_26945 ?auto_26976 ) ) ( not ( = ?auto_26947 ?auto_26972 ) ) ( not ( = ?auto_26975 ?auto_26989 ) ) ( not ( = ?auto_26969 ?auto_26973 ) ) ( not ( = ?auto_26976 ?auto_26972 ) ) ( not ( = ?auto_26945 ?auto_26948 ) ) ( not ( = ?auto_26945 ?auto_26991 ) ) ( not ( = ?auto_26946 ?auto_26948 ) ) ( not ( = ?auto_26946 ?auto_26991 ) ) ( not ( = ?auto_26948 ?auto_26976 ) ) ( not ( = ?auto_26948 ?auto_26972 ) ) ( not ( = ?auto_26974 ?auto_26975 ) ) ( not ( = ?auto_26974 ?auto_26989 ) ) ( not ( = ?auto_26986 ?auto_26969 ) ) ( not ( = ?auto_26986 ?auto_26973 ) ) ( not ( = ?auto_26991 ?auto_26976 ) ) ( not ( = ?auto_26991 ?auto_26972 ) ) ( not ( = ?auto_26945 ?auto_26949 ) ) ( not ( = ?auto_26945 ?auto_26984 ) ) ( not ( = ?auto_26946 ?auto_26949 ) ) ( not ( = ?auto_26946 ?auto_26984 ) ) ( not ( = ?auto_26947 ?auto_26949 ) ) ( not ( = ?auto_26947 ?auto_26984 ) ) ( not ( = ?auto_26949 ?auto_26991 ) ) ( not ( = ?auto_26949 ?auto_26976 ) ) ( not ( = ?auto_26949 ?auto_26972 ) ) ( not ( = ?auto_26984 ?auto_26991 ) ) ( not ( = ?auto_26984 ?auto_26976 ) ) ( not ( = ?auto_26984 ?auto_26972 ) ) ( not ( = ?auto_26945 ?auto_26950 ) ) ( not ( = ?auto_26945 ?auto_27000 ) ) ( not ( = ?auto_26946 ?auto_26950 ) ) ( not ( = ?auto_26946 ?auto_27000 ) ) ( not ( = ?auto_26947 ?auto_26950 ) ) ( not ( = ?auto_26947 ?auto_27000 ) ) ( not ( = ?auto_26948 ?auto_26950 ) ) ( not ( = ?auto_26948 ?auto_27000 ) ) ( not ( = ?auto_26950 ?auto_26984 ) ) ( not ( = ?auto_26950 ?auto_26991 ) ) ( not ( = ?auto_26950 ?auto_26976 ) ) ( not ( = ?auto_26950 ?auto_26972 ) ) ( not ( = ?auto_26988 ?auto_26975 ) ) ( not ( = ?auto_26988 ?auto_26974 ) ) ( not ( = ?auto_26988 ?auto_26989 ) ) ( not ( = ?auto_26968 ?auto_26969 ) ) ( not ( = ?auto_26968 ?auto_26986 ) ) ( not ( = ?auto_26968 ?auto_26973 ) ) ( not ( = ?auto_27000 ?auto_26984 ) ) ( not ( = ?auto_27000 ?auto_26991 ) ) ( not ( = ?auto_27000 ?auto_26976 ) ) ( not ( = ?auto_27000 ?auto_26972 ) ) ( not ( = ?auto_26945 ?auto_26951 ) ) ( not ( = ?auto_26945 ?auto_26978 ) ) ( not ( = ?auto_26946 ?auto_26951 ) ) ( not ( = ?auto_26946 ?auto_26978 ) ) ( not ( = ?auto_26947 ?auto_26951 ) ) ( not ( = ?auto_26947 ?auto_26978 ) ) ( not ( = ?auto_26948 ?auto_26951 ) ) ( not ( = ?auto_26948 ?auto_26978 ) ) ( not ( = ?auto_26949 ?auto_26951 ) ) ( not ( = ?auto_26949 ?auto_26978 ) ) ( not ( = ?auto_26951 ?auto_27000 ) ) ( not ( = ?auto_26951 ?auto_26984 ) ) ( not ( = ?auto_26951 ?auto_26991 ) ) ( not ( = ?auto_26951 ?auto_26976 ) ) ( not ( = ?auto_26951 ?auto_26972 ) ) ( not ( = ?auto_26981 ?auto_26988 ) ) ( not ( = ?auto_26981 ?auto_26975 ) ) ( not ( = ?auto_26981 ?auto_26974 ) ) ( not ( = ?auto_26981 ?auto_26989 ) ) ( not ( = ?auto_26980 ?auto_26968 ) ) ( not ( = ?auto_26980 ?auto_26969 ) ) ( not ( = ?auto_26980 ?auto_26986 ) ) ( not ( = ?auto_26980 ?auto_26973 ) ) ( not ( = ?auto_26978 ?auto_27000 ) ) ( not ( = ?auto_26978 ?auto_26984 ) ) ( not ( = ?auto_26978 ?auto_26991 ) ) ( not ( = ?auto_26978 ?auto_26976 ) ) ( not ( = ?auto_26978 ?auto_26972 ) ) ( not ( = ?auto_26945 ?auto_26952 ) ) ( not ( = ?auto_26945 ?auto_26990 ) ) ( not ( = ?auto_26946 ?auto_26952 ) ) ( not ( = ?auto_26946 ?auto_26990 ) ) ( not ( = ?auto_26947 ?auto_26952 ) ) ( not ( = ?auto_26947 ?auto_26990 ) ) ( not ( = ?auto_26948 ?auto_26952 ) ) ( not ( = ?auto_26948 ?auto_26990 ) ) ( not ( = ?auto_26949 ?auto_26952 ) ) ( not ( = ?auto_26949 ?auto_26990 ) ) ( not ( = ?auto_26950 ?auto_26952 ) ) ( not ( = ?auto_26950 ?auto_26990 ) ) ( not ( = ?auto_26952 ?auto_26978 ) ) ( not ( = ?auto_26952 ?auto_27000 ) ) ( not ( = ?auto_26952 ?auto_26984 ) ) ( not ( = ?auto_26952 ?auto_26991 ) ) ( not ( = ?auto_26952 ?auto_26976 ) ) ( not ( = ?auto_26952 ?auto_26972 ) ) ( not ( = ?auto_26970 ?auto_26981 ) ) ( not ( = ?auto_26970 ?auto_26988 ) ) ( not ( = ?auto_26970 ?auto_26975 ) ) ( not ( = ?auto_26970 ?auto_26974 ) ) ( not ( = ?auto_26970 ?auto_26989 ) ) ( not ( = ?auto_26995 ?auto_26980 ) ) ( not ( = ?auto_26995 ?auto_26968 ) ) ( not ( = ?auto_26995 ?auto_26969 ) ) ( not ( = ?auto_26995 ?auto_26986 ) ) ( not ( = ?auto_26995 ?auto_26973 ) ) ( not ( = ?auto_26990 ?auto_26978 ) ) ( not ( = ?auto_26990 ?auto_27000 ) ) ( not ( = ?auto_26990 ?auto_26984 ) ) ( not ( = ?auto_26990 ?auto_26991 ) ) ( not ( = ?auto_26990 ?auto_26976 ) ) ( not ( = ?auto_26990 ?auto_26972 ) ) ( not ( = ?auto_26945 ?auto_26953 ) ) ( not ( = ?auto_26945 ?auto_26987 ) ) ( not ( = ?auto_26946 ?auto_26953 ) ) ( not ( = ?auto_26946 ?auto_26987 ) ) ( not ( = ?auto_26947 ?auto_26953 ) ) ( not ( = ?auto_26947 ?auto_26987 ) ) ( not ( = ?auto_26948 ?auto_26953 ) ) ( not ( = ?auto_26948 ?auto_26987 ) ) ( not ( = ?auto_26949 ?auto_26953 ) ) ( not ( = ?auto_26949 ?auto_26987 ) ) ( not ( = ?auto_26950 ?auto_26953 ) ) ( not ( = ?auto_26950 ?auto_26987 ) ) ( not ( = ?auto_26951 ?auto_26953 ) ) ( not ( = ?auto_26951 ?auto_26987 ) ) ( not ( = ?auto_26953 ?auto_26990 ) ) ( not ( = ?auto_26953 ?auto_26978 ) ) ( not ( = ?auto_26953 ?auto_27000 ) ) ( not ( = ?auto_26953 ?auto_26984 ) ) ( not ( = ?auto_26953 ?auto_26991 ) ) ( not ( = ?auto_26953 ?auto_26976 ) ) ( not ( = ?auto_26953 ?auto_26972 ) ) ( not ( = ?auto_26985 ?auto_26970 ) ) ( not ( = ?auto_26985 ?auto_26981 ) ) ( not ( = ?auto_26985 ?auto_26988 ) ) ( not ( = ?auto_26985 ?auto_26975 ) ) ( not ( = ?auto_26985 ?auto_26974 ) ) ( not ( = ?auto_26985 ?auto_26989 ) ) ( not ( = ?auto_26998 ?auto_26995 ) ) ( not ( = ?auto_26998 ?auto_26980 ) ) ( not ( = ?auto_26998 ?auto_26968 ) ) ( not ( = ?auto_26998 ?auto_26969 ) ) ( not ( = ?auto_26998 ?auto_26986 ) ) ( not ( = ?auto_26998 ?auto_26973 ) ) ( not ( = ?auto_26987 ?auto_26990 ) ) ( not ( = ?auto_26987 ?auto_26978 ) ) ( not ( = ?auto_26987 ?auto_27000 ) ) ( not ( = ?auto_26987 ?auto_26984 ) ) ( not ( = ?auto_26987 ?auto_26991 ) ) ( not ( = ?auto_26987 ?auto_26976 ) ) ( not ( = ?auto_26987 ?auto_26972 ) ) ( not ( = ?auto_26945 ?auto_26954 ) ) ( not ( = ?auto_26945 ?auto_26979 ) ) ( not ( = ?auto_26946 ?auto_26954 ) ) ( not ( = ?auto_26946 ?auto_26979 ) ) ( not ( = ?auto_26947 ?auto_26954 ) ) ( not ( = ?auto_26947 ?auto_26979 ) ) ( not ( = ?auto_26948 ?auto_26954 ) ) ( not ( = ?auto_26948 ?auto_26979 ) ) ( not ( = ?auto_26949 ?auto_26954 ) ) ( not ( = ?auto_26949 ?auto_26979 ) ) ( not ( = ?auto_26950 ?auto_26954 ) ) ( not ( = ?auto_26950 ?auto_26979 ) ) ( not ( = ?auto_26951 ?auto_26954 ) ) ( not ( = ?auto_26951 ?auto_26979 ) ) ( not ( = ?auto_26952 ?auto_26954 ) ) ( not ( = ?auto_26952 ?auto_26979 ) ) ( not ( = ?auto_26954 ?auto_26987 ) ) ( not ( = ?auto_26954 ?auto_26990 ) ) ( not ( = ?auto_26954 ?auto_26978 ) ) ( not ( = ?auto_26954 ?auto_27000 ) ) ( not ( = ?auto_26954 ?auto_26984 ) ) ( not ( = ?auto_26954 ?auto_26991 ) ) ( not ( = ?auto_26954 ?auto_26976 ) ) ( not ( = ?auto_26954 ?auto_26972 ) ) ( not ( = ?auto_26979 ?auto_26987 ) ) ( not ( = ?auto_26979 ?auto_26990 ) ) ( not ( = ?auto_26979 ?auto_26978 ) ) ( not ( = ?auto_26979 ?auto_27000 ) ) ( not ( = ?auto_26979 ?auto_26984 ) ) ( not ( = ?auto_26979 ?auto_26991 ) ) ( not ( = ?auto_26979 ?auto_26976 ) ) ( not ( = ?auto_26979 ?auto_26972 ) ) ( not ( = ?auto_26945 ?auto_26955 ) ) ( not ( = ?auto_26945 ?auto_26982 ) ) ( not ( = ?auto_26946 ?auto_26955 ) ) ( not ( = ?auto_26946 ?auto_26982 ) ) ( not ( = ?auto_26947 ?auto_26955 ) ) ( not ( = ?auto_26947 ?auto_26982 ) ) ( not ( = ?auto_26948 ?auto_26955 ) ) ( not ( = ?auto_26948 ?auto_26982 ) ) ( not ( = ?auto_26949 ?auto_26955 ) ) ( not ( = ?auto_26949 ?auto_26982 ) ) ( not ( = ?auto_26950 ?auto_26955 ) ) ( not ( = ?auto_26950 ?auto_26982 ) ) ( not ( = ?auto_26951 ?auto_26955 ) ) ( not ( = ?auto_26951 ?auto_26982 ) ) ( not ( = ?auto_26952 ?auto_26955 ) ) ( not ( = ?auto_26952 ?auto_26982 ) ) ( not ( = ?auto_26953 ?auto_26955 ) ) ( not ( = ?auto_26953 ?auto_26982 ) ) ( not ( = ?auto_26955 ?auto_26979 ) ) ( not ( = ?auto_26955 ?auto_26987 ) ) ( not ( = ?auto_26955 ?auto_26990 ) ) ( not ( = ?auto_26955 ?auto_26978 ) ) ( not ( = ?auto_26955 ?auto_27000 ) ) ( not ( = ?auto_26955 ?auto_26984 ) ) ( not ( = ?auto_26955 ?auto_26991 ) ) ( not ( = ?auto_26955 ?auto_26976 ) ) ( not ( = ?auto_26955 ?auto_26972 ) ) ( not ( = ?auto_26982 ?auto_26979 ) ) ( not ( = ?auto_26982 ?auto_26987 ) ) ( not ( = ?auto_26982 ?auto_26990 ) ) ( not ( = ?auto_26982 ?auto_26978 ) ) ( not ( = ?auto_26982 ?auto_27000 ) ) ( not ( = ?auto_26982 ?auto_26984 ) ) ( not ( = ?auto_26982 ?auto_26991 ) ) ( not ( = ?auto_26982 ?auto_26976 ) ) ( not ( = ?auto_26982 ?auto_26972 ) ) ( not ( = ?auto_26945 ?auto_26956 ) ) ( not ( = ?auto_26945 ?auto_26994 ) ) ( not ( = ?auto_26946 ?auto_26956 ) ) ( not ( = ?auto_26946 ?auto_26994 ) ) ( not ( = ?auto_26947 ?auto_26956 ) ) ( not ( = ?auto_26947 ?auto_26994 ) ) ( not ( = ?auto_26948 ?auto_26956 ) ) ( not ( = ?auto_26948 ?auto_26994 ) ) ( not ( = ?auto_26949 ?auto_26956 ) ) ( not ( = ?auto_26949 ?auto_26994 ) ) ( not ( = ?auto_26950 ?auto_26956 ) ) ( not ( = ?auto_26950 ?auto_26994 ) ) ( not ( = ?auto_26951 ?auto_26956 ) ) ( not ( = ?auto_26951 ?auto_26994 ) ) ( not ( = ?auto_26952 ?auto_26956 ) ) ( not ( = ?auto_26952 ?auto_26994 ) ) ( not ( = ?auto_26953 ?auto_26956 ) ) ( not ( = ?auto_26953 ?auto_26994 ) ) ( not ( = ?auto_26954 ?auto_26956 ) ) ( not ( = ?auto_26954 ?auto_26994 ) ) ( not ( = ?auto_26956 ?auto_26982 ) ) ( not ( = ?auto_26956 ?auto_26979 ) ) ( not ( = ?auto_26956 ?auto_26987 ) ) ( not ( = ?auto_26956 ?auto_26990 ) ) ( not ( = ?auto_26956 ?auto_26978 ) ) ( not ( = ?auto_26956 ?auto_27000 ) ) ( not ( = ?auto_26956 ?auto_26984 ) ) ( not ( = ?auto_26956 ?auto_26991 ) ) ( not ( = ?auto_26956 ?auto_26976 ) ) ( not ( = ?auto_26956 ?auto_26972 ) ) ( not ( = ?auto_26997 ?auto_26974 ) ) ( not ( = ?auto_26997 ?auto_26989 ) ) ( not ( = ?auto_26997 ?auto_26985 ) ) ( not ( = ?auto_26997 ?auto_26970 ) ) ( not ( = ?auto_26997 ?auto_26981 ) ) ( not ( = ?auto_26997 ?auto_26988 ) ) ( not ( = ?auto_26997 ?auto_26975 ) ) ( not ( = ?auto_26993 ?auto_26986 ) ) ( not ( = ?auto_26993 ?auto_26973 ) ) ( not ( = ?auto_26993 ?auto_26998 ) ) ( not ( = ?auto_26993 ?auto_26995 ) ) ( not ( = ?auto_26993 ?auto_26980 ) ) ( not ( = ?auto_26993 ?auto_26968 ) ) ( not ( = ?auto_26993 ?auto_26969 ) ) ( not ( = ?auto_26994 ?auto_26982 ) ) ( not ( = ?auto_26994 ?auto_26979 ) ) ( not ( = ?auto_26994 ?auto_26987 ) ) ( not ( = ?auto_26994 ?auto_26990 ) ) ( not ( = ?auto_26994 ?auto_26978 ) ) ( not ( = ?auto_26994 ?auto_27000 ) ) ( not ( = ?auto_26994 ?auto_26984 ) ) ( not ( = ?auto_26994 ?auto_26991 ) ) ( not ( = ?auto_26994 ?auto_26976 ) ) ( not ( = ?auto_26994 ?auto_26972 ) ) ( not ( = ?auto_26945 ?auto_26957 ) ) ( not ( = ?auto_26945 ?auto_26983 ) ) ( not ( = ?auto_26946 ?auto_26957 ) ) ( not ( = ?auto_26946 ?auto_26983 ) ) ( not ( = ?auto_26947 ?auto_26957 ) ) ( not ( = ?auto_26947 ?auto_26983 ) ) ( not ( = ?auto_26948 ?auto_26957 ) ) ( not ( = ?auto_26948 ?auto_26983 ) ) ( not ( = ?auto_26949 ?auto_26957 ) ) ( not ( = ?auto_26949 ?auto_26983 ) ) ( not ( = ?auto_26950 ?auto_26957 ) ) ( not ( = ?auto_26950 ?auto_26983 ) ) ( not ( = ?auto_26951 ?auto_26957 ) ) ( not ( = ?auto_26951 ?auto_26983 ) ) ( not ( = ?auto_26952 ?auto_26957 ) ) ( not ( = ?auto_26952 ?auto_26983 ) ) ( not ( = ?auto_26953 ?auto_26957 ) ) ( not ( = ?auto_26953 ?auto_26983 ) ) ( not ( = ?auto_26954 ?auto_26957 ) ) ( not ( = ?auto_26954 ?auto_26983 ) ) ( not ( = ?auto_26955 ?auto_26957 ) ) ( not ( = ?auto_26955 ?auto_26983 ) ) ( not ( = ?auto_26957 ?auto_26994 ) ) ( not ( = ?auto_26957 ?auto_26982 ) ) ( not ( = ?auto_26957 ?auto_26979 ) ) ( not ( = ?auto_26957 ?auto_26987 ) ) ( not ( = ?auto_26957 ?auto_26990 ) ) ( not ( = ?auto_26957 ?auto_26978 ) ) ( not ( = ?auto_26957 ?auto_27000 ) ) ( not ( = ?auto_26957 ?auto_26984 ) ) ( not ( = ?auto_26957 ?auto_26991 ) ) ( not ( = ?auto_26957 ?auto_26976 ) ) ( not ( = ?auto_26957 ?auto_26972 ) ) ( not ( = ?auto_26983 ?auto_26994 ) ) ( not ( = ?auto_26983 ?auto_26982 ) ) ( not ( = ?auto_26983 ?auto_26979 ) ) ( not ( = ?auto_26983 ?auto_26987 ) ) ( not ( = ?auto_26983 ?auto_26990 ) ) ( not ( = ?auto_26983 ?auto_26978 ) ) ( not ( = ?auto_26983 ?auto_27000 ) ) ( not ( = ?auto_26983 ?auto_26984 ) ) ( not ( = ?auto_26983 ?auto_26991 ) ) ( not ( = ?auto_26983 ?auto_26976 ) ) ( not ( = ?auto_26983 ?auto_26972 ) ) ( not ( = ?auto_26945 ?auto_26959 ) ) ( not ( = ?auto_26945 ?auto_26967 ) ) ( not ( = ?auto_26946 ?auto_26959 ) ) ( not ( = ?auto_26946 ?auto_26967 ) ) ( not ( = ?auto_26947 ?auto_26959 ) ) ( not ( = ?auto_26947 ?auto_26967 ) ) ( not ( = ?auto_26948 ?auto_26959 ) ) ( not ( = ?auto_26948 ?auto_26967 ) ) ( not ( = ?auto_26949 ?auto_26959 ) ) ( not ( = ?auto_26949 ?auto_26967 ) ) ( not ( = ?auto_26950 ?auto_26959 ) ) ( not ( = ?auto_26950 ?auto_26967 ) ) ( not ( = ?auto_26951 ?auto_26959 ) ) ( not ( = ?auto_26951 ?auto_26967 ) ) ( not ( = ?auto_26952 ?auto_26959 ) ) ( not ( = ?auto_26952 ?auto_26967 ) ) ( not ( = ?auto_26953 ?auto_26959 ) ) ( not ( = ?auto_26953 ?auto_26967 ) ) ( not ( = ?auto_26954 ?auto_26959 ) ) ( not ( = ?auto_26954 ?auto_26967 ) ) ( not ( = ?auto_26955 ?auto_26959 ) ) ( not ( = ?auto_26955 ?auto_26967 ) ) ( not ( = ?auto_26956 ?auto_26959 ) ) ( not ( = ?auto_26956 ?auto_26967 ) ) ( not ( = ?auto_26959 ?auto_26983 ) ) ( not ( = ?auto_26959 ?auto_26994 ) ) ( not ( = ?auto_26959 ?auto_26982 ) ) ( not ( = ?auto_26959 ?auto_26979 ) ) ( not ( = ?auto_26959 ?auto_26987 ) ) ( not ( = ?auto_26959 ?auto_26990 ) ) ( not ( = ?auto_26959 ?auto_26978 ) ) ( not ( = ?auto_26959 ?auto_27000 ) ) ( not ( = ?auto_26959 ?auto_26984 ) ) ( not ( = ?auto_26959 ?auto_26991 ) ) ( not ( = ?auto_26959 ?auto_26976 ) ) ( not ( = ?auto_26959 ?auto_26972 ) ) ( not ( = ?auto_26971 ?auto_26989 ) ) ( not ( = ?auto_26971 ?auto_26997 ) ) ( not ( = ?auto_26971 ?auto_26974 ) ) ( not ( = ?auto_26971 ?auto_26985 ) ) ( not ( = ?auto_26971 ?auto_26970 ) ) ( not ( = ?auto_26971 ?auto_26981 ) ) ( not ( = ?auto_26971 ?auto_26988 ) ) ( not ( = ?auto_26971 ?auto_26975 ) ) ( not ( = ?auto_26992 ?auto_26973 ) ) ( not ( = ?auto_26992 ?auto_26993 ) ) ( not ( = ?auto_26992 ?auto_26986 ) ) ( not ( = ?auto_26992 ?auto_26998 ) ) ( not ( = ?auto_26992 ?auto_26995 ) ) ( not ( = ?auto_26992 ?auto_26980 ) ) ( not ( = ?auto_26992 ?auto_26968 ) ) ( not ( = ?auto_26992 ?auto_26969 ) ) ( not ( = ?auto_26967 ?auto_26983 ) ) ( not ( = ?auto_26967 ?auto_26994 ) ) ( not ( = ?auto_26967 ?auto_26982 ) ) ( not ( = ?auto_26967 ?auto_26979 ) ) ( not ( = ?auto_26967 ?auto_26987 ) ) ( not ( = ?auto_26967 ?auto_26990 ) ) ( not ( = ?auto_26967 ?auto_26978 ) ) ( not ( = ?auto_26967 ?auto_27000 ) ) ( not ( = ?auto_26967 ?auto_26984 ) ) ( not ( = ?auto_26967 ?auto_26991 ) ) ( not ( = ?auto_26967 ?auto_26976 ) ) ( not ( = ?auto_26967 ?auto_26972 ) ) ( not ( = ?auto_26945 ?auto_26958 ) ) ( not ( = ?auto_26945 ?auto_26999 ) ) ( not ( = ?auto_26946 ?auto_26958 ) ) ( not ( = ?auto_26946 ?auto_26999 ) ) ( not ( = ?auto_26947 ?auto_26958 ) ) ( not ( = ?auto_26947 ?auto_26999 ) ) ( not ( = ?auto_26948 ?auto_26958 ) ) ( not ( = ?auto_26948 ?auto_26999 ) ) ( not ( = ?auto_26949 ?auto_26958 ) ) ( not ( = ?auto_26949 ?auto_26999 ) ) ( not ( = ?auto_26950 ?auto_26958 ) ) ( not ( = ?auto_26950 ?auto_26999 ) ) ( not ( = ?auto_26951 ?auto_26958 ) ) ( not ( = ?auto_26951 ?auto_26999 ) ) ( not ( = ?auto_26952 ?auto_26958 ) ) ( not ( = ?auto_26952 ?auto_26999 ) ) ( not ( = ?auto_26953 ?auto_26958 ) ) ( not ( = ?auto_26953 ?auto_26999 ) ) ( not ( = ?auto_26954 ?auto_26958 ) ) ( not ( = ?auto_26954 ?auto_26999 ) ) ( not ( = ?auto_26955 ?auto_26958 ) ) ( not ( = ?auto_26955 ?auto_26999 ) ) ( not ( = ?auto_26956 ?auto_26958 ) ) ( not ( = ?auto_26956 ?auto_26999 ) ) ( not ( = ?auto_26957 ?auto_26958 ) ) ( not ( = ?auto_26957 ?auto_26999 ) ) ( not ( = ?auto_26958 ?auto_26967 ) ) ( not ( = ?auto_26958 ?auto_26983 ) ) ( not ( = ?auto_26958 ?auto_26994 ) ) ( not ( = ?auto_26958 ?auto_26982 ) ) ( not ( = ?auto_26958 ?auto_26979 ) ) ( not ( = ?auto_26958 ?auto_26987 ) ) ( not ( = ?auto_26958 ?auto_26990 ) ) ( not ( = ?auto_26958 ?auto_26978 ) ) ( not ( = ?auto_26958 ?auto_27000 ) ) ( not ( = ?auto_26958 ?auto_26984 ) ) ( not ( = ?auto_26958 ?auto_26991 ) ) ( not ( = ?auto_26958 ?auto_26976 ) ) ( not ( = ?auto_26958 ?auto_26972 ) ) ( not ( = ?auto_26977 ?auto_26971 ) ) ( not ( = ?auto_26977 ?auto_26989 ) ) ( not ( = ?auto_26977 ?auto_26997 ) ) ( not ( = ?auto_26977 ?auto_26974 ) ) ( not ( = ?auto_26977 ?auto_26985 ) ) ( not ( = ?auto_26977 ?auto_26970 ) ) ( not ( = ?auto_26977 ?auto_26981 ) ) ( not ( = ?auto_26977 ?auto_26988 ) ) ( not ( = ?auto_26977 ?auto_26975 ) ) ( not ( = ?auto_26996 ?auto_26992 ) ) ( not ( = ?auto_26996 ?auto_26973 ) ) ( not ( = ?auto_26996 ?auto_26993 ) ) ( not ( = ?auto_26996 ?auto_26986 ) ) ( not ( = ?auto_26996 ?auto_26998 ) ) ( not ( = ?auto_26996 ?auto_26995 ) ) ( not ( = ?auto_26996 ?auto_26980 ) ) ( not ( = ?auto_26996 ?auto_26968 ) ) ( not ( = ?auto_26996 ?auto_26969 ) ) ( not ( = ?auto_26999 ?auto_26967 ) ) ( not ( = ?auto_26999 ?auto_26983 ) ) ( not ( = ?auto_26999 ?auto_26994 ) ) ( not ( = ?auto_26999 ?auto_26982 ) ) ( not ( = ?auto_26999 ?auto_26979 ) ) ( not ( = ?auto_26999 ?auto_26987 ) ) ( not ( = ?auto_26999 ?auto_26990 ) ) ( not ( = ?auto_26999 ?auto_26978 ) ) ( not ( = ?auto_26999 ?auto_27000 ) ) ( not ( = ?auto_26999 ?auto_26984 ) ) ( not ( = ?auto_26999 ?auto_26991 ) ) ( not ( = ?auto_26999 ?auto_26976 ) ) ( not ( = ?auto_26999 ?auto_26972 ) ) ( not ( = ?auto_26945 ?auto_26960 ) ) ( not ( = ?auto_26945 ?auto_26962 ) ) ( not ( = ?auto_26946 ?auto_26960 ) ) ( not ( = ?auto_26946 ?auto_26962 ) ) ( not ( = ?auto_26947 ?auto_26960 ) ) ( not ( = ?auto_26947 ?auto_26962 ) ) ( not ( = ?auto_26948 ?auto_26960 ) ) ( not ( = ?auto_26948 ?auto_26962 ) ) ( not ( = ?auto_26949 ?auto_26960 ) ) ( not ( = ?auto_26949 ?auto_26962 ) ) ( not ( = ?auto_26950 ?auto_26960 ) ) ( not ( = ?auto_26950 ?auto_26962 ) ) ( not ( = ?auto_26951 ?auto_26960 ) ) ( not ( = ?auto_26951 ?auto_26962 ) ) ( not ( = ?auto_26952 ?auto_26960 ) ) ( not ( = ?auto_26952 ?auto_26962 ) ) ( not ( = ?auto_26953 ?auto_26960 ) ) ( not ( = ?auto_26953 ?auto_26962 ) ) ( not ( = ?auto_26954 ?auto_26960 ) ) ( not ( = ?auto_26954 ?auto_26962 ) ) ( not ( = ?auto_26955 ?auto_26960 ) ) ( not ( = ?auto_26955 ?auto_26962 ) ) ( not ( = ?auto_26956 ?auto_26960 ) ) ( not ( = ?auto_26956 ?auto_26962 ) ) ( not ( = ?auto_26957 ?auto_26960 ) ) ( not ( = ?auto_26957 ?auto_26962 ) ) ( not ( = ?auto_26959 ?auto_26960 ) ) ( not ( = ?auto_26959 ?auto_26962 ) ) ( not ( = ?auto_26960 ?auto_26999 ) ) ( not ( = ?auto_26960 ?auto_26967 ) ) ( not ( = ?auto_26960 ?auto_26983 ) ) ( not ( = ?auto_26960 ?auto_26994 ) ) ( not ( = ?auto_26960 ?auto_26982 ) ) ( not ( = ?auto_26960 ?auto_26979 ) ) ( not ( = ?auto_26960 ?auto_26987 ) ) ( not ( = ?auto_26960 ?auto_26990 ) ) ( not ( = ?auto_26960 ?auto_26978 ) ) ( not ( = ?auto_26960 ?auto_27000 ) ) ( not ( = ?auto_26960 ?auto_26984 ) ) ( not ( = ?auto_26960 ?auto_26991 ) ) ( not ( = ?auto_26960 ?auto_26976 ) ) ( not ( = ?auto_26960 ?auto_26972 ) ) ( not ( = ?auto_26961 ?auto_26977 ) ) ( not ( = ?auto_26961 ?auto_26971 ) ) ( not ( = ?auto_26961 ?auto_26989 ) ) ( not ( = ?auto_26961 ?auto_26997 ) ) ( not ( = ?auto_26961 ?auto_26974 ) ) ( not ( = ?auto_26961 ?auto_26985 ) ) ( not ( = ?auto_26961 ?auto_26970 ) ) ( not ( = ?auto_26961 ?auto_26981 ) ) ( not ( = ?auto_26961 ?auto_26988 ) ) ( not ( = ?auto_26961 ?auto_26975 ) ) ( not ( = ?auto_26964 ?auto_26996 ) ) ( not ( = ?auto_26964 ?auto_26992 ) ) ( not ( = ?auto_26964 ?auto_26973 ) ) ( not ( = ?auto_26964 ?auto_26993 ) ) ( not ( = ?auto_26964 ?auto_26986 ) ) ( not ( = ?auto_26964 ?auto_26998 ) ) ( not ( = ?auto_26964 ?auto_26995 ) ) ( not ( = ?auto_26964 ?auto_26980 ) ) ( not ( = ?auto_26964 ?auto_26968 ) ) ( not ( = ?auto_26964 ?auto_26969 ) ) ( not ( = ?auto_26962 ?auto_26999 ) ) ( not ( = ?auto_26962 ?auto_26967 ) ) ( not ( = ?auto_26962 ?auto_26983 ) ) ( not ( = ?auto_26962 ?auto_26994 ) ) ( not ( = ?auto_26962 ?auto_26982 ) ) ( not ( = ?auto_26962 ?auto_26979 ) ) ( not ( = ?auto_26962 ?auto_26987 ) ) ( not ( = ?auto_26962 ?auto_26990 ) ) ( not ( = ?auto_26962 ?auto_26978 ) ) ( not ( = ?auto_26962 ?auto_27000 ) ) ( not ( = ?auto_26962 ?auto_26984 ) ) ( not ( = ?auto_26962 ?auto_26991 ) ) ( not ( = ?auto_26962 ?auto_26976 ) ) ( not ( = ?auto_26962 ?auto_26972 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_26945 ?auto_26946 ?auto_26947 ?auto_26948 ?auto_26949 ?auto_26950 ?auto_26951 ?auto_26952 ?auto_26953 ?auto_26954 ?auto_26955 ?auto_26956 ?auto_26957 ?auto_26959 ?auto_26958 )
      ( MAKE-1CRATE ?auto_26958 ?auto_26960 )
      ( MAKE-15CRATE-VERIFY ?auto_26945 ?auto_26946 ?auto_26947 ?auto_26948 ?auto_26949 ?auto_26950 ?auto_26951 ?auto_26952 ?auto_26953 ?auto_26954 ?auto_26955 ?auto_26956 ?auto_26957 ?auto_26959 ?auto_26958 ?auto_26960 ) )
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
      ?auto_27035 - SURFACE
      ?auto_27036 - SURFACE
      ?auto_27037 - SURFACE
      ?auto_27038 - SURFACE
      ?auto_27039 - SURFACE
      ?auto_27040 - SURFACE
      ?auto_27042 - SURFACE
      ?auto_27041 - SURFACE
      ?auto_27044 - SURFACE
      ?auto_27043 - SURFACE
    )
    :vars
    (
      ?auto_27050 - HOIST
      ?auto_27049 - PLACE
      ?auto_27048 - PLACE
      ?auto_27046 - HOIST
      ?auto_27045 - SURFACE
      ?auto_27064 - PLACE
      ?auto_27087 - HOIST
      ?auto_27071 - SURFACE
      ?auto_27069 - PLACE
      ?auto_27073 - HOIST
      ?auto_27062 - SURFACE
      ?auto_27068 - PLACE
      ?auto_27081 - HOIST
      ?auto_27086 - SURFACE
      ?auto_27051 - PLACE
      ?auto_27066 - HOIST
      ?auto_27065 - SURFACE
      ?auto_27058 - PLACE
      ?auto_27075 - HOIST
      ?auto_27056 - SURFACE
      ?auto_27084 - PLACE
      ?auto_27067 - HOIST
      ?auto_27080 - SURFACE
      ?auto_27077 - SURFACE
      ?auto_27055 - PLACE
      ?auto_27060 - HOIST
      ?auto_27074 - SURFACE
      ?auto_27061 - PLACE
      ?auto_27072 - HOIST
      ?auto_27052 - SURFACE
      ?auto_27063 - PLACE
      ?auto_27079 - HOIST
      ?auto_27059 - SURFACE
      ?auto_27057 - PLACE
      ?auto_27082 - HOIST
      ?auto_27076 - SURFACE
      ?auto_27083 - PLACE
      ?auto_27070 - HOIST
      ?auto_27054 - SURFACE
      ?auto_27053 - SURFACE
      ?auto_27078 - SURFACE
      ?auto_27085 - SURFACE
      ?auto_27047 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27050 ?auto_27049 ) ( IS-CRATE ?auto_27043 ) ( not ( = ?auto_27048 ?auto_27049 ) ) ( HOIST-AT ?auto_27046 ?auto_27048 ) ( AVAILABLE ?auto_27046 ) ( SURFACE-AT ?auto_27043 ?auto_27048 ) ( ON ?auto_27043 ?auto_27045 ) ( CLEAR ?auto_27043 ) ( not ( = ?auto_27044 ?auto_27043 ) ) ( not ( = ?auto_27044 ?auto_27045 ) ) ( not ( = ?auto_27043 ?auto_27045 ) ) ( not ( = ?auto_27050 ?auto_27046 ) ) ( IS-CRATE ?auto_27044 ) ( not ( = ?auto_27064 ?auto_27049 ) ) ( HOIST-AT ?auto_27087 ?auto_27064 ) ( AVAILABLE ?auto_27087 ) ( SURFACE-AT ?auto_27044 ?auto_27064 ) ( ON ?auto_27044 ?auto_27071 ) ( CLEAR ?auto_27044 ) ( not ( = ?auto_27041 ?auto_27044 ) ) ( not ( = ?auto_27041 ?auto_27071 ) ) ( not ( = ?auto_27044 ?auto_27071 ) ) ( not ( = ?auto_27050 ?auto_27087 ) ) ( IS-CRATE ?auto_27041 ) ( not ( = ?auto_27069 ?auto_27049 ) ) ( HOIST-AT ?auto_27073 ?auto_27069 ) ( AVAILABLE ?auto_27073 ) ( SURFACE-AT ?auto_27041 ?auto_27069 ) ( ON ?auto_27041 ?auto_27062 ) ( CLEAR ?auto_27041 ) ( not ( = ?auto_27042 ?auto_27041 ) ) ( not ( = ?auto_27042 ?auto_27062 ) ) ( not ( = ?auto_27041 ?auto_27062 ) ) ( not ( = ?auto_27050 ?auto_27073 ) ) ( IS-CRATE ?auto_27042 ) ( not ( = ?auto_27068 ?auto_27049 ) ) ( HOIST-AT ?auto_27081 ?auto_27068 ) ( AVAILABLE ?auto_27081 ) ( SURFACE-AT ?auto_27042 ?auto_27068 ) ( ON ?auto_27042 ?auto_27086 ) ( CLEAR ?auto_27042 ) ( not ( = ?auto_27040 ?auto_27042 ) ) ( not ( = ?auto_27040 ?auto_27086 ) ) ( not ( = ?auto_27042 ?auto_27086 ) ) ( not ( = ?auto_27050 ?auto_27081 ) ) ( IS-CRATE ?auto_27040 ) ( not ( = ?auto_27051 ?auto_27049 ) ) ( HOIST-AT ?auto_27066 ?auto_27051 ) ( SURFACE-AT ?auto_27040 ?auto_27051 ) ( ON ?auto_27040 ?auto_27065 ) ( CLEAR ?auto_27040 ) ( not ( = ?auto_27039 ?auto_27040 ) ) ( not ( = ?auto_27039 ?auto_27065 ) ) ( not ( = ?auto_27040 ?auto_27065 ) ) ( not ( = ?auto_27050 ?auto_27066 ) ) ( IS-CRATE ?auto_27039 ) ( not ( = ?auto_27058 ?auto_27049 ) ) ( HOIST-AT ?auto_27075 ?auto_27058 ) ( AVAILABLE ?auto_27075 ) ( SURFACE-AT ?auto_27039 ?auto_27058 ) ( ON ?auto_27039 ?auto_27056 ) ( CLEAR ?auto_27039 ) ( not ( = ?auto_27038 ?auto_27039 ) ) ( not ( = ?auto_27038 ?auto_27056 ) ) ( not ( = ?auto_27039 ?auto_27056 ) ) ( not ( = ?auto_27050 ?auto_27075 ) ) ( IS-CRATE ?auto_27038 ) ( not ( = ?auto_27084 ?auto_27049 ) ) ( HOIST-AT ?auto_27067 ?auto_27084 ) ( SURFACE-AT ?auto_27038 ?auto_27084 ) ( ON ?auto_27038 ?auto_27080 ) ( CLEAR ?auto_27038 ) ( not ( = ?auto_27037 ?auto_27038 ) ) ( not ( = ?auto_27037 ?auto_27080 ) ) ( not ( = ?auto_27038 ?auto_27080 ) ) ( not ( = ?auto_27050 ?auto_27067 ) ) ( IS-CRATE ?auto_27037 ) ( SURFACE-AT ?auto_27037 ?auto_27051 ) ( ON ?auto_27037 ?auto_27077 ) ( CLEAR ?auto_27037 ) ( not ( = ?auto_27036 ?auto_27037 ) ) ( not ( = ?auto_27036 ?auto_27077 ) ) ( not ( = ?auto_27037 ?auto_27077 ) ) ( IS-CRATE ?auto_27036 ) ( not ( = ?auto_27055 ?auto_27049 ) ) ( HOIST-AT ?auto_27060 ?auto_27055 ) ( AVAILABLE ?auto_27060 ) ( SURFACE-AT ?auto_27036 ?auto_27055 ) ( ON ?auto_27036 ?auto_27074 ) ( CLEAR ?auto_27036 ) ( not ( = ?auto_27035 ?auto_27036 ) ) ( not ( = ?auto_27035 ?auto_27074 ) ) ( not ( = ?auto_27036 ?auto_27074 ) ) ( not ( = ?auto_27050 ?auto_27060 ) ) ( IS-CRATE ?auto_27035 ) ( not ( = ?auto_27061 ?auto_27049 ) ) ( HOIST-AT ?auto_27072 ?auto_27061 ) ( AVAILABLE ?auto_27072 ) ( SURFACE-AT ?auto_27035 ?auto_27061 ) ( ON ?auto_27035 ?auto_27052 ) ( CLEAR ?auto_27035 ) ( not ( = ?auto_27034 ?auto_27035 ) ) ( not ( = ?auto_27034 ?auto_27052 ) ) ( not ( = ?auto_27035 ?auto_27052 ) ) ( not ( = ?auto_27050 ?auto_27072 ) ) ( IS-CRATE ?auto_27034 ) ( not ( = ?auto_27063 ?auto_27049 ) ) ( HOIST-AT ?auto_27079 ?auto_27063 ) ( AVAILABLE ?auto_27079 ) ( SURFACE-AT ?auto_27034 ?auto_27063 ) ( ON ?auto_27034 ?auto_27059 ) ( CLEAR ?auto_27034 ) ( not ( = ?auto_27033 ?auto_27034 ) ) ( not ( = ?auto_27033 ?auto_27059 ) ) ( not ( = ?auto_27034 ?auto_27059 ) ) ( not ( = ?auto_27050 ?auto_27079 ) ) ( IS-CRATE ?auto_27033 ) ( not ( = ?auto_27057 ?auto_27049 ) ) ( HOIST-AT ?auto_27082 ?auto_27057 ) ( AVAILABLE ?auto_27082 ) ( SURFACE-AT ?auto_27033 ?auto_27057 ) ( ON ?auto_27033 ?auto_27076 ) ( CLEAR ?auto_27033 ) ( not ( = ?auto_27032 ?auto_27033 ) ) ( not ( = ?auto_27032 ?auto_27076 ) ) ( not ( = ?auto_27033 ?auto_27076 ) ) ( not ( = ?auto_27050 ?auto_27082 ) ) ( IS-CRATE ?auto_27032 ) ( not ( = ?auto_27083 ?auto_27049 ) ) ( HOIST-AT ?auto_27070 ?auto_27083 ) ( SURFACE-AT ?auto_27032 ?auto_27083 ) ( ON ?auto_27032 ?auto_27054 ) ( CLEAR ?auto_27032 ) ( not ( = ?auto_27031 ?auto_27032 ) ) ( not ( = ?auto_27031 ?auto_27054 ) ) ( not ( = ?auto_27032 ?auto_27054 ) ) ( not ( = ?auto_27050 ?auto_27070 ) ) ( IS-CRATE ?auto_27031 ) ( AVAILABLE ?auto_27067 ) ( SURFACE-AT ?auto_27031 ?auto_27084 ) ( ON ?auto_27031 ?auto_27053 ) ( CLEAR ?auto_27031 ) ( not ( = ?auto_27030 ?auto_27031 ) ) ( not ( = ?auto_27030 ?auto_27053 ) ) ( not ( = ?auto_27031 ?auto_27053 ) ) ( IS-CRATE ?auto_27030 ) ( AVAILABLE ?auto_27070 ) ( SURFACE-AT ?auto_27030 ?auto_27083 ) ( ON ?auto_27030 ?auto_27078 ) ( CLEAR ?auto_27030 ) ( not ( = ?auto_27029 ?auto_27030 ) ) ( not ( = ?auto_27029 ?auto_27078 ) ) ( not ( = ?auto_27030 ?auto_27078 ) ) ( SURFACE-AT ?auto_27028 ?auto_27049 ) ( CLEAR ?auto_27028 ) ( IS-CRATE ?auto_27029 ) ( AVAILABLE ?auto_27050 ) ( AVAILABLE ?auto_27066 ) ( SURFACE-AT ?auto_27029 ?auto_27051 ) ( ON ?auto_27029 ?auto_27085 ) ( CLEAR ?auto_27029 ) ( TRUCK-AT ?auto_27047 ?auto_27049 ) ( not ( = ?auto_27028 ?auto_27029 ) ) ( not ( = ?auto_27028 ?auto_27085 ) ) ( not ( = ?auto_27029 ?auto_27085 ) ) ( not ( = ?auto_27028 ?auto_27030 ) ) ( not ( = ?auto_27028 ?auto_27078 ) ) ( not ( = ?auto_27030 ?auto_27085 ) ) ( not ( = ?auto_27083 ?auto_27051 ) ) ( not ( = ?auto_27070 ?auto_27066 ) ) ( not ( = ?auto_27078 ?auto_27085 ) ) ( not ( = ?auto_27028 ?auto_27031 ) ) ( not ( = ?auto_27028 ?auto_27053 ) ) ( not ( = ?auto_27029 ?auto_27031 ) ) ( not ( = ?auto_27029 ?auto_27053 ) ) ( not ( = ?auto_27031 ?auto_27078 ) ) ( not ( = ?auto_27031 ?auto_27085 ) ) ( not ( = ?auto_27084 ?auto_27083 ) ) ( not ( = ?auto_27084 ?auto_27051 ) ) ( not ( = ?auto_27067 ?auto_27070 ) ) ( not ( = ?auto_27067 ?auto_27066 ) ) ( not ( = ?auto_27053 ?auto_27078 ) ) ( not ( = ?auto_27053 ?auto_27085 ) ) ( not ( = ?auto_27028 ?auto_27032 ) ) ( not ( = ?auto_27028 ?auto_27054 ) ) ( not ( = ?auto_27029 ?auto_27032 ) ) ( not ( = ?auto_27029 ?auto_27054 ) ) ( not ( = ?auto_27030 ?auto_27032 ) ) ( not ( = ?auto_27030 ?auto_27054 ) ) ( not ( = ?auto_27032 ?auto_27053 ) ) ( not ( = ?auto_27032 ?auto_27078 ) ) ( not ( = ?auto_27032 ?auto_27085 ) ) ( not ( = ?auto_27054 ?auto_27053 ) ) ( not ( = ?auto_27054 ?auto_27078 ) ) ( not ( = ?auto_27054 ?auto_27085 ) ) ( not ( = ?auto_27028 ?auto_27033 ) ) ( not ( = ?auto_27028 ?auto_27076 ) ) ( not ( = ?auto_27029 ?auto_27033 ) ) ( not ( = ?auto_27029 ?auto_27076 ) ) ( not ( = ?auto_27030 ?auto_27033 ) ) ( not ( = ?auto_27030 ?auto_27076 ) ) ( not ( = ?auto_27031 ?auto_27033 ) ) ( not ( = ?auto_27031 ?auto_27076 ) ) ( not ( = ?auto_27033 ?auto_27054 ) ) ( not ( = ?auto_27033 ?auto_27053 ) ) ( not ( = ?auto_27033 ?auto_27078 ) ) ( not ( = ?auto_27033 ?auto_27085 ) ) ( not ( = ?auto_27057 ?auto_27083 ) ) ( not ( = ?auto_27057 ?auto_27084 ) ) ( not ( = ?auto_27057 ?auto_27051 ) ) ( not ( = ?auto_27082 ?auto_27070 ) ) ( not ( = ?auto_27082 ?auto_27067 ) ) ( not ( = ?auto_27082 ?auto_27066 ) ) ( not ( = ?auto_27076 ?auto_27054 ) ) ( not ( = ?auto_27076 ?auto_27053 ) ) ( not ( = ?auto_27076 ?auto_27078 ) ) ( not ( = ?auto_27076 ?auto_27085 ) ) ( not ( = ?auto_27028 ?auto_27034 ) ) ( not ( = ?auto_27028 ?auto_27059 ) ) ( not ( = ?auto_27029 ?auto_27034 ) ) ( not ( = ?auto_27029 ?auto_27059 ) ) ( not ( = ?auto_27030 ?auto_27034 ) ) ( not ( = ?auto_27030 ?auto_27059 ) ) ( not ( = ?auto_27031 ?auto_27034 ) ) ( not ( = ?auto_27031 ?auto_27059 ) ) ( not ( = ?auto_27032 ?auto_27034 ) ) ( not ( = ?auto_27032 ?auto_27059 ) ) ( not ( = ?auto_27034 ?auto_27076 ) ) ( not ( = ?auto_27034 ?auto_27054 ) ) ( not ( = ?auto_27034 ?auto_27053 ) ) ( not ( = ?auto_27034 ?auto_27078 ) ) ( not ( = ?auto_27034 ?auto_27085 ) ) ( not ( = ?auto_27063 ?auto_27057 ) ) ( not ( = ?auto_27063 ?auto_27083 ) ) ( not ( = ?auto_27063 ?auto_27084 ) ) ( not ( = ?auto_27063 ?auto_27051 ) ) ( not ( = ?auto_27079 ?auto_27082 ) ) ( not ( = ?auto_27079 ?auto_27070 ) ) ( not ( = ?auto_27079 ?auto_27067 ) ) ( not ( = ?auto_27079 ?auto_27066 ) ) ( not ( = ?auto_27059 ?auto_27076 ) ) ( not ( = ?auto_27059 ?auto_27054 ) ) ( not ( = ?auto_27059 ?auto_27053 ) ) ( not ( = ?auto_27059 ?auto_27078 ) ) ( not ( = ?auto_27059 ?auto_27085 ) ) ( not ( = ?auto_27028 ?auto_27035 ) ) ( not ( = ?auto_27028 ?auto_27052 ) ) ( not ( = ?auto_27029 ?auto_27035 ) ) ( not ( = ?auto_27029 ?auto_27052 ) ) ( not ( = ?auto_27030 ?auto_27035 ) ) ( not ( = ?auto_27030 ?auto_27052 ) ) ( not ( = ?auto_27031 ?auto_27035 ) ) ( not ( = ?auto_27031 ?auto_27052 ) ) ( not ( = ?auto_27032 ?auto_27035 ) ) ( not ( = ?auto_27032 ?auto_27052 ) ) ( not ( = ?auto_27033 ?auto_27035 ) ) ( not ( = ?auto_27033 ?auto_27052 ) ) ( not ( = ?auto_27035 ?auto_27059 ) ) ( not ( = ?auto_27035 ?auto_27076 ) ) ( not ( = ?auto_27035 ?auto_27054 ) ) ( not ( = ?auto_27035 ?auto_27053 ) ) ( not ( = ?auto_27035 ?auto_27078 ) ) ( not ( = ?auto_27035 ?auto_27085 ) ) ( not ( = ?auto_27061 ?auto_27063 ) ) ( not ( = ?auto_27061 ?auto_27057 ) ) ( not ( = ?auto_27061 ?auto_27083 ) ) ( not ( = ?auto_27061 ?auto_27084 ) ) ( not ( = ?auto_27061 ?auto_27051 ) ) ( not ( = ?auto_27072 ?auto_27079 ) ) ( not ( = ?auto_27072 ?auto_27082 ) ) ( not ( = ?auto_27072 ?auto_27070 ) ) ( not ( = ?auto_27072 ?auto_27067 ) ) ( not ( = ?auto_27072 ?auto_27066 ) ) ( not ( = ?auto_27052 ?auto_27059 ) ) ( not ( = ?auto_27052 ?auto_27076 ) ) ( not ( = ?auto_27052 ?auto_27054 ) ) ( not ( = ?auto_27052 ?auto_27053 ) ) ( not ( = ?auto_27052 ?auto_27078 ) ) ( not ( = ?auto_27052 ?auto_27085 ) ) ( not ( = ?auto_27028 ?auto_27036 ) ) ( not ( = ?auto_27028 ?auto_27074 ) ) ( not ( = ?auto_27029 ?auto_27036 ) ) ( not ( = ?auto_27029 ?auto_27074 ) ) ( not ( = ?auto_27030 ?auto_27036 ) ) ( not ( = ?auto_27030 ?auto_27074 ) ) ( not ( = ?auto_27031 ?auto_27036 ) ) ( not ( = ?auto_27031 ?auto_27074 ) ) ( not ( = ?auto_27032 ?auto_27036 ) ) ( not ( = ?auto_27032 ?auto_27074 ) ) ( not ( = ?auto_27033 ?auto_27036 ) ) ( not ( = ?auto_27033 ?auto_27074 ) ) ( not ( = ?auto_27034 ?auto_27036 ) ) ( not ( = ?auto_27034 ?auto_27074 ) ) ( not ( = ?auto_27036 ?auto_27052 ) ) ( not ( = ?auto_27036 ?auto_27059 ) ) ( not ( = ?auto_27036 ?auto_27076 ) ) ( not ( = ?auto_27036 ?auto_27054 ) ) ( not ( = ?auto_27036 ?auto_27053 ) ) ( not ( = ?auto_27036 ?auto_27078 ) ) ( not ( = ?auto_27036 ?auto_27085 ) ) ( not ( = ?auto_27055 ?auto_27061 ) ) ( not ( = ?auto_27055 ?auto_27063 ) ) ( not ( = ?auto_27055 ?auto_27057 ) ) ( not ( = ?auto_27055 ?auto_27083 ) ) ( not ( = ?auto_27055 ?auto_27084 ) ) ( not ( = ?auto_27055 ?auto_27051 ) ) ( not ( = ?auto_27060 ?auto_27072 ) ) ( not ( = ?auto_27060 ?auto_27079 ) ) ( not ( = ?auto_27060 ?auto_27082 ) ) ( not ( = ?auto_27060 ?auto_27070 ) ) ( not ( = ?auto_27060 ?auto_27067 ) ) ( not ( = ?auto_27060 ?auto_27066 ) ) ( not ( = ?auto_27074 ?auto_27052 ) ) ( not ( = ?auto_27074 ?auto_27059 ) ) ( not ( = ?auto_27074 ?auto_27076 ) ) ( not ( = ?auto_27074 ?auto_27054 ) ) ( not ( = ?auto_27074 ?auto_27053 ) ) ( not ( = ?auto_27074 ?auto_27078 ) ) ( not ( = ?auto_27074 ?auto_27085 ) ) ( not ( = ?auto_27028 ?auto_27037 ) ) ( not ( = ?auto_27028 ?auto_27077 ) ) ( not ( = ?auto_27029 ?auto_27037 ) ) ( not ( = ?auto_27029 ?auto_27077 ) ) ( not ( = ?auto_27030 ?auto_27037 ) ) ( not ( = ?auto_27030 ?auto_27077 ) ) ( not ( = ?auto_27031 ?auto_27037 ) ) ( not ( = ?auto_27031 ?auto_27077 ) ) ( not ( = ?auto_27032 ?auto_27037 ) ) ( not ( = ?auto_27032 ?auto_27077 ) ) ( not ( = ?auto_27033 ?auto_27037 ) ) ( not ( = ?auto_27033 ?auto_27077 ) ) ( not ( = ?auto_27034 ?auto_27037 ) ) ( not ( = ?auto_27034 ?auto_27077 ) ) ( not ( = ?auto_27035 ?auto_27037 ) ) ( not ( = ?auto_27035 ?auto_27077 ) ) ( not ( = ?auto_27037 ?auto_27074 ) ) ( not ( = ?auto_27037 ?auto_27052 ) ) ( not ( = ?auto_27037 ?auto_27059 ) ) ( not ( = ?auto_27037 ?auto_27076 ) ) ( not ( = ?auto_27037 ?auto_27054 ) ) ( not ( = ?auto_27037 ?auto_27053 ) ) ( not ( = ?auto_27037 ?auto_27078 ) ) ( not ( = ?auto_27037 ?auto_27085 ) ) ( not ( = ?auto_27077 ?auto_27074 ) ) ( not ( = ?auto_27077 ?auto_27052 ) ) ( not ( = ?auto_27077 ?auto_27059 ) ) ( not ( = ?auto_27077 ?auto_27076 ) ) ( not ( = ?auto_27077 ?auto_27054 ) ) ( not ( = ?auto_27077 ?auto_27053 ) ) ( not ( = ?auto_27077 ?auto_27078 ) ) ( not ( = ?auto_27077 ?auto_27085 ) ) ( not ( = ?auto_27028 ?auto_27038 ) ) ( not ( = ?auto_27028 ?auto_27080 ) ) ( not ( = ?auto_27029 ?auto_27038 ) ) ( not ( = ?auto_27029 ?auto_27080 ) ) ( not ( = ?auto_27030 ?auto_27038 ) ) ( not ( = ?auto_27030 ?auto_27080 ) ) ( not ( = ?auto_27031 ?auto_27038 ) ) ( not ( = ?auto_27031 ?auto_27080 ) ) ( not ( = ?auto_27032 ?auto_27038 ) ) ( not ( = ?auto_27032 ?auto_27080 ) ) ( not ( = ?auto_27033 ?auto_27038 ) ) ( not ( = ?auto_27033 ?auto_27080 ) ) ( not ( = ?auto_27034 ?auto_27038 ) ) ( not ( = ?auto_27034 ?auto_27080 ) ) ( not ( = ?auto_27035 ?auto_27038 ) ) ( not ( = ?auto_27035 ?auto_27080 ) ) ( not ( = ?auto_27036 ?auto_27038 ) ) ( not ( = ?auto_27036 ?auto_27080 ) ) ( not ( = ?auto_27038 ?auto_27077 ) ) ( not ( = ?auto_27038 ?auto_27074 ) ) ( not ( = ?auto_27038 ?auto_27052 ) ) ( not ( = ?auto_27038 ?auto_27059 ) ) ( not ( = ?auto_27038 ?auto_27076 ) ) ( not ( = ?auto_27038 ?auto_27054 ) ) ( not ( = ?auto_27038 ?auto_27053 ) ) ( not ( = ?auto_27038 ?auto_27078 ) ) ( not ( = ?auto_27038 ?auto_27085 ) ) ( not ( = ?auto_27080 ?auto_27077 ) ) ( not ( = ?auto_27080 ?auto_27074 ) ) ( not ( = ?auto_27080 ?auto_27052 ) ) ( not ( = ?auto_27080 ?auto_27059 ) ) ( not ( = ?auto_27080 ?auto_27076 ) ) ( not ( = ?auto_27080 ?auto_27054 ) ) ( not ( = ?auto_27080 ?auto_27053 ) ) ( not ( = ?auto_27080 ?auto_27078 ) ) ( not ( = ?auto_27080 ?auto_27085 ) ) ( not ( = ?auto_27028 ?auto_27039 ) ) ( not ( = ?auto_27028 ?auto_27056 ) ) ( not ( = ?auto_27029 ?auto_27039 ) ) ( not ( = ?auto_27029 ?auto_27056 ) ) ( not ( = ?auto_27030 ?auto_27039 ) ) ( not ( = ?auto_27030 ?auto_27056 ) ) ( not ( = ?auto_27031 ?auto_27039 ) ) ( not ( = ?auto_27031 ?auto_27056 ) ) ( not ( = ?auto_27032 ?auto_27039 ) ) ( not ( = ?auto_27032 ?auto_27056 ) ) ( not ( = ?auto_27033 ?auto_27039 ) ) ( not ( = ?auto_27033 ?auto_27056 ) ) ( not ( = ?auto_27034 ?auto_27039 ) ) ( not ( = ?auto_27034 ?auto_27056 ) ) ( not ( = ?auto_27035 ?auto_27039 ) ) ( not ( = ?auto_27035 ?auto_27056 ) ) ( not ( = ?auto_27036 ?auto_27039 ) ) ( not ( = ?auto_27036 ?auto_27056 ) ) ( not ( = ?auto_27037 ?auto_27039 ) ) ( not ( = ?auto_27037 ?auto_27056 ) ) ( not ( = ?auto_27039 ?auto_27080 ) ) ( not ( = ?auto_27039 ?auto_27077 ) ) ( not ( = ?auto_27039 ?auto_27074 ) ) ( not ( = ?auto_27039 ?auto_27052 ) ) ( not ( = ?auto_27039 ?auto_27059 ) ) ( not ( = ?auto_27039 ?auto_27076 ) ) ( not ( = ?auto_27039 ?auto_27054 ) ) ( not ( = ?auto_27039 ?auto_27053 ) ) ( not ( = ?auto_27039 ?auto_27078 ) ) ( not ( = ?auto_27039 ?auto_27085 ) ) ( not ( = ?auto_27058 ?auto_27084 ) ) ( not ( = ?auto_27058 ?auto_27051 ) ) ( not ( = ?auto_27058 ?auto_27055 ) ) ( not ( = ?auto_27058 ?auto_27061 ) ) ( not ( = ?auto_27058 ?auto_27063 ) ) ( not ( = ?auto_27058 ?auto_27057 ) ) ( not ( = ?auto_27058 ?auto_27083 ) ) ( not ( = ?auto_27075 ?auto_27067 ) ) ( not ( = ?auto_27075 ?auto_27066 ) ) ( not ( = ?auto_27075 ?auto_27060 ) ) ( not ( = ?auto_27075 ?auto_27072 ) ) ( not ( = ?auto_27075 ?auto_27079 ) ) ( not ( = ?auto_27075 ?auto_27082 ) ) ( not ( = ?auto_27075 ?auto_27070 ) ) ( not ( = ?auto_27056 ?auto_27080 ) ) ( not ( = ?auto_27056 ?auto_27077 ) ) ( not ( = ?auto_27056 ?auto_27074 ) ) ( not ( = ?auto_27056 ?auto_27052 ) ) ( not ( = ?auto_27056 ?auto_27059 ) ) ( not ( = ?auto_27056 ?auto_27076 ) ) ( not ( = ?auto_27056 ?auto_27054 ) ) ( not ( = ?auto_27056 ?auto_27053 ) ) ( not ( = ?auto_27056 ?auto_27078 ) ) ( not ( = ?auto_27056 ?auto_27085 ) ) ( not ( = ?auto_27028 ?auto_27040 ) ) ( not ( = ?auto_27028 ?auto_27065 ) ) ( not ( = ?auto_27029 ?auto_27040 ) ) ( not ( = ?auto_27029 ?auto_27065 ) ) ( not ( = ?auto_27030 ?auto_27040 ) ) ( not ( = ?auto_27030 ?auto_27065 ) ) ( not ( = ?auto_27031 ?auto_27040 ) ) ( not ( = ?auto_27031 ?auto_27065 ) ) ( not ( = ?auto_27032 ?auto_27040 ) ) ( not ( = ?auto_27032 ?auto_27065 ) ) ( not ( = ?auto_27033 ?auto_27040 ) ) ( not ( = ?auto_27033 ?auto_27065 ) ) ( not ( = ?auto_27034 ?auto_27040 ) ) ( not ( = ?auto_27034 ?auto_27065 ) ) ( not ( = ?auto_27035 ?auto_27040 ) ) ( not ( = ?auto_27035 ?auto_27065 ) ) ( not ( = ?auto_27036 ?auto_27040 ) ) ( not ( = ?auto_27036 ?auto_27065 ) ) ( not ( = ?auto_27037 ?auto_27040 ) ) ( not ( = ?auto_27037 ?auto_27065 ) ) ( not ( = ?auto_27038 ?auto_27040 ) ) ( not ( = ?auto_27038 ?auto_27065 ) ) ( not ( = ?auto_27040 ?auto_27056 ) ) ( not ( = ?auto_27040 ?auto_27080 ) ) ( not ( = ?auto_27040 ?auto_27077 ) ) ( not ( = ?auto_27040 ?auto_27074 ) ) ( not ( = ?auto_27040 ?auto_27052 ) ) ( not ( = ?auto_27040 ?auto_27059 ) ) ( not ( = ?auto_27040 ?auto_27076 ) ) ( not ( = ?auto_27040 ?auto_27054 ) ) ( not ( = ?auto_27040 ?auto_27053 ) ) ( not ( = ?auto_27040 ?auto_27078 ) ) ( not ( = ?auto_27040 ?auto_27085 ) ) ( not ( = ?auto_27065 ?auto_27056 ) ) ( not ( = ?auto_27065 ?auto_27080 ) ) ( not ( = ?auto_27065 ?auto_27077 ) ) ( not ( = ?auto_27065 ?auto_27074 ) ) ( not ( = ?auto_27065 ?auto_27052 ) ) ( not ( = ?auto_27065 ?auto_27059 ) ) ( not ( = ?auto_27065 ?auto_27076 ) ) ( not ( = ?auto_27065 ?auto_27054 ) ) ( not ( = ?auto_27065 ?auto_27053 ) ) ( not ( = ?auto_27065 ?auto_27078 ) ) ( not ( = ?auto_27065 ?auto_27085 ) ) ( not ( = ?auto_27028 ?auto_27042 ) ) ( not ( = ?auto_27028 ?auto_27086 ) ) ( not ( = ?auto_27029 ?auto_27042 ) ) ( not ( = ?auto_27029 ?auto_27086 ) ) ( not ( = ?auto_27030 ?auto_27042 ) ) ( not ( = ?auto_27030 ?auto_27086 ) ) ( not ( = ?auto_27031 ?auto_27042 ) ) ( not ( = ?auto_27031 ?auto_27086 ) ) ( not ( = ?auto_27032 ?auto_27042 ) ) ( not ( = ?auto_27032 ?auto_27086 ) ) ( not ( = ?auto_27033 ?auto_27042 ) ) ( not ( = ?auto_27033 ?auto_27086 ) ) ( not ( = ?auto_27034 ?auto_27042 ) ) ( not ( = ?auto_27034 ?auto_27086 ) ) ( not ( = ?auto_27035 ?auto_27042 ) ) ( not ( = ?auto_27035 ?auto_27086 ) ) ( not ( = ?auto_27036 ?auto_27042 ) ) ( not ( = ?auto_27036 ?auto_27086 ) ) ( not ( = ?auto_27037 ?auto_27042 ) ) ( not ( = ?auto_27037 ?auto_27086 ) ) ( not ( = ?auto_27038 ?auto_27042 ) ) ( not ( = ?auto_27038 ?auto_27086 ) ) ( not ( = ?auto_27039 ?auto_27042 ) ) ( not ( = ?auto_27039 ?auto_27086 ) ) ( not ( = ?auto_27042 ?auto_27065 ) ) ( not ( = ?auto_27042 ?auto_27056 ) ) ( not ( = ?auto_27042 ?auto_27080 ) ) ( not ( = ?auto_27042 ?auto_27077 ) ) ( not ( = ?auto_27042 ?auto_27074 ) ) ( not ( = ?auto_27042 ?auto_27052 ) ) ( not ( = ?auto_27042 ?auto_27059 ) ) ( not ( = ?auto_27042 ?auto_27076 ) ) ( not ( = ?auto_27042 ?auto_27054 ) ) ( not ( = ?auto_27042 ?auto_27053 ) ) ( not ( = ?auto_27042 ?auto_27078 ) ) ( not ( = ?auto_27042 ?auto_27085 ) ) ( not ( = ?auto_27068 ?auto_27051 ) ) ( not ( = ?auto_27068 ?auto_27058 ) ) ( not ( = ?auto_27068 ?auto_27084 ) ) ( not ( = ?auto_27068 ?auto_27055 ) ) ( not ( = ?auto_27068 ?auto_27061 ) ) ( not ( = ?auto_27068 ?auto_27063 ) ) ( not ( = ?auto_27068 ?auto_27057 ) ) ( not ( = ?auto_27068 ?auto_27083 ) ) ( not ( = ?auto_27081 ?auto_27066 ) ) ( not ( = ?auto_27081 ?auto_27075 ) ) ( not ( = ?auto_27081 ?auto_27067 ) ) ( not ( = ?auto_27081 ?auto_27060 ) ) ( not ( = ?auto_27081 ?auto_27072 ) ) ( not ( = ?auto_27081 ?auto_27079 ) ) ( not ( = ?auto_27081 ?auto_27082 ) ) ( not ( = ?auto_27081 ?auto_27070 ) ) ( not ( = ?auto_27086 ?auto_27065 ) ) ( not ( = ?auto_27086 ?auto_27056 ) ) ( not ( = ?auto_27086 ?auto_27080 ) ) ( not ( = ?auto_27086 ?auto_27077 ) ) ( not ( = ?auto_27086 ?auto_27074 ) ) ( not ( = ?auto_27086 ?auto_27052 ) ) ( not ( = ?auto_27086 ?auto_27059 ) ) ( not ( = ?auto_27086 ?auto_27076 ) ) ( not ( = ?auto_27086 ?auto_27054 ) ) ( not ( = ?auto_27086 ?auto_27053 ) ) ( not ( = ?auto_27086 ?auto_27078 ) ) ( not ( = ?auto_27086 ?auto_27085 ) ) ( not ( = ?auto_27028 ?auto_27041 ) ) ( not ( = ?auto_27028 ?auto_27062 ) ) ( not ( = ?auto_27029 ?auto_27041 ) ) ( not ( = ?auto_27029 ?auto_27062 ) ) ( not ( = ?auto_27030 ?auto_27041 ) ) ( not ( = ?auto_27030 ?auto_27062 ) ) ( not ( = ?auto_27031 ?auto_27041 ) ) ( not ( = ?auto_27031 ?auto_27062 ) ) ( not ( = ?auto_27032 ?auto_27041 ) ) ( not ( = ?auto_27032 ?auto_27062 ) ) ( not ( = ?auto_27033 ?auto_27041 ) ) ( not ( = ?auto_27033 ?auto_27062 ) ) ( not ( = ?auto_27034 ?auto_27041 ) ) ( not ( = ?auto_27034 ?auto_27062 ) ) ( not ( = ?auto_27035 ?auto_27041 ) ) ( not ( = ?auto_27035 ?auto_27062 ) ) ( not ( = ?auto_27036 ?auto_27041 ) ) ( not ( = ?auto_27036 ?auto_27062 ) ) ( not ( = ?auto_27037 ?auto_27041 ) ) ( not ( = ?auto_27037 ?auto_27062 ) ) ( not ( = ?auto_27038 ?auto_27041 ) ) ( not ( = ?auto_27038 ?auto_27062 ) ) ( not ( = ?auto_27039 ?auto_27041 ) ) ( not ( = ?auto_27039 ?auto_27062 ) ) ( not ( = ?auto_27040 ?auto_27041 ) ) ( not ( = ?auto_27040 ?auto_27062 ) ) ( not ( = ?auto_27041 ?auto_27086 ) ) ( not ( = ?auto_27041 ?auto_27065 ) ) ( not ( = ?auto_27041 ?auto_27056 ) ) ( not ( = ?auto_27041 ?auto_27080 ) ) ( not ( = ?auto_27041 ?auto_27077 ) ) ( not ( = ?auto_27041 ?auto_27074 ) ) ( not ( = ?auto_27041 ?auto_27052 ) ) ( not ( = ?auto_27041 ?auto_27059 ) ) ( not ( = ?auto_27041 ?auto_27076 ) ) ( not ( = ?auto_27041 ?auto_27054 ) ) ( not ( = ?auto_27041 ?auto_27053 ) ) ( not ( = ?auto_27041 ?auto_27078 ) ) ( not ( = ?auto_27041 ?auto_27085 ) ) ( not ( = ?auto_27069 ?auto_27068 ) ) ( not ( = ?auto_27069 ?auto_27051 ) ) ( not ( = ?auto_27069 ?auto_27058 ) ) ( not ( = ?auto_27069 ?auto_27084 ) ) ( not ( = ?auto_27069 ?auto_27055 ) ) ( not ( = ?auto_27069 ?auto_27061 ) ) ( not ( = ?auto_27069 ?auto_27063 ) ) ( not ( = ?auto_27069 ?auto_27057 ) ) ( not ( = ?auto_27069 ?auto_27083 ) ) ( not ( = ?auto_27073 ?auto_27081 ) ) ( not ( = ?auto_27073 ?auto_27066 ) ) ( not ( = ?auto_27073 ?auto_27075 ) ) ( not ( = ?auto_27073 ?auto_27067 ) ) ( not ( = ?auto_27073 ?auto_27060 ) ) ( not ( = ?auto_27073 ?auto_27072 ) ) ( not ( = ?auto_27073 ?auto_27079 ) ) ( not ( = ?auto_27073 ?auto_27082 ) ) ( not ( = ?auto_27073 ?auto_27070 ) ) ( not ( = ?auto_27062 ?auto_27086 ) ) ( not ( = ?auto_27062 ?auto_27065 ) ) ( not ( = ?auto_27062 ?auto_27056 ) ) ( not ( = ?auto_27062 ?auto_27080 ) ) ( not ( = ?auto_27062 ?auto_27077 ) ) ( not ( = ?auto_27062 ?auto_27074 ) ) ( not ( = ?auto_27062 ?auto_27052 ) ) ( not ( = ?auto_27062 ?auto_27059 ) ) ( not ( = ?auto_27062 ?auto_27076 ) ) ( not ( = ?auto_27062 ?auto_27054 ) ) ( not ( = ?auto_27062 ?auto_27053 ) ) ( not ( = ?auto_27062 ?auto_27078 ) ) ( not ( = ?auto_27062 ?auto_27085 ) ) ( not ( = ?auto_27028 ?auto_27044 ) ) ( not ( = ?auto_27028 ?auto_27071 ) ) ( not ( = ?auto_27029 ?auto_27044 ) ) ( not ( = ?auto_27029 ?auto_27071 ) ) ( not ( = ?auto_27030 ?auto_27044 ) ) ( not ( = ?auto_27030 ?auto_27071 ) ) ( not ( = ?auto_27031 ?auto_27044 ) ) ( not ( = ?auto_27031 ?auto_27071 ) ) ( not ( = ?auto_27032 ?auto_27044 ) ) ( not ( = ?auto_27032 ?auto_27071 ) ) ( not ( = ?auto_27033 ?auto_27044 ) ) ( not ( = ?auto_27033 ?auto_27071 ) ) ( not ( = ?auto_27034 ?auto_27044 ) ) ( not ( = ?auto_27034 ?auto_27071 ) ) ( not ( = ?auto_27035 ?auto_27044 ) ) ( not ( = ?auto_27035 ?auto_27071 ) ) ( not ( = ?auto_27036 ?auto_27044 ) ) ( not ( = ?auto_27036 ?auto_27071 ) ) ( not ( = ?auto_27037 ?auto_27044 ) ) ( not ( = ?auto_27037 ?auto_27071 ) ) ( not ( = ?auto_27038 ?auto_27044 ) ) ( not ( = ?auto_27038 ?auto_27071 ) ) ( not ( = ?auto_27039 ?auto_27044 ) ) ( not ( = ?auto_27039 ?auto_27071 ) ) ( not ( = ?auto_27040 ?auto_27044 ) ) ( not ( = ?auto_27040 ?auto_27071 ) ) ( not ( = ?auto_27042 ?auto_27044 ) ) ( not ( = ?auto_27042 ?auto_27071 ) ) ( not ( = ?auto_27044 ?auto_27062 ) ) ( not ( = ?auto_27044 ?auto_27086 ) ) ( not ( = ?auto_27044 ?auto_27065 ) ) ( not ( = ?auto_27044 ?auto_27056 ) ) ( not ( = ?auto_27044 ?auto_27080 ) ) ( not ( = ?auto_27044 ?auto_27077 ) ) ( not ( = ?auto_27044 ?auto_27074 ) ) ( not ( = ?auto_27044 ?auto_27052 ) ) ( not ( = ?auto_27044 ?auto_27059 ) ) ( not ( = ?auto_27044 ?auto_27076 ) ) ( not ( = ?auto_27044 ?auto_27054 ) ) ( not ( = ?auto_27044 ?auto_27053 ) ) ( not ( = ?auto_27044 ?auto_27078 ) ) ( not ( = ?auto_27044 ?auto_27085 ) ) ( not ( = ?auto_27064 ?auto_27069 ) ) ( not ( = ?auto_27064 ?auto_27068 ) ) ( not ( = ?auto_27064 ?auto_27051 ) ) ( not ( = ?auto_27064 ?auto_27058 ) ) ( not ( = ?auto_27064 ?auto_27084 ) ) ( not ( = ?auto_27064 ?auto_27055 ) ) ( not ( = ?auto_27064 ?auto_27061 ) ) ( not ( = ?auto_27064 ?auto_27063 ) ) ( not ( = ?auto_27064 ?auto_27057 ) ) ( not ( = ?auto_27064 ?auto_27083 ) ) ( not ( = ?auto_27087 ?auto_27073 ) ) ( not ( = ?auto_27087 ?auto_27081 ) ) ( not ( = ?auto_27087 ?auto_27066 ) ) ( not ( = ?auto_27087 ?auto_27075 ) ) ( not ( = ?auto_27087 ?auto_27067 ) ) ( not ( = ?auto_27087 ?auto_27060 ) ) ( not ( = ?auto_27087 ?auto_27072 ) ) ( not ( = ?auto_27087 ?auto_27079 ) ) ( not ( = ?auto_27087 ?auto_27082 ) ) ( not ( = ?auto_27087 ?auto_27070 ) ) ( not ( = ?auto_27071 ?auto_27062 ) ) ( not ( = ?auto_27071 ?auto_27086 ) ) ( not ( = ?auto_27071 ?auto_27065 ) ) ( not ( = ?auto_27071 ?auto_27056 ) ) ( not ( = ?auto_27071 ?auto_27080 ) ) ( not ( = ?auto_27071 ?auto_27077 ) ) ( not ( = ?auto_27071 ?auto_27074 ) ) ( not ( = ?auto_27071 ?auto_27052 ) ) ( not ( = ?auto_27071 ?auto_27059 ) ) ( not ( = ?auto_27071 ?auto_27076 ) ) ( not ( = ?auto_27071 ?auto_27054 ) ) ( not ( = ?auto_27071 ?auto_27053 ) ) ( not ( = ?auto_27071 ?auto_27078 ) ) ( not ( = ?auto_27071 ?auto_27085 ) ) ( not ( = ?auto_27028 ?auto_27043 ) ) ( not ( = ?auto_27028 ?auto_27045 ) ) ( not ( = ?auto_27029 ?auto_27043 ) ) ( not ( = ?auto_27029 ?auto_27045 ) ) ( not ( = ?auto_27030 ?auto_27043 ) ) ( not ( = ?auto_27030 ?auto_27045 ) ) ( not ( = ?auto_27031 ?auto_27043 ) ) ( not ( = ?auto_27031 ?auto_27045 ) ) ( not ( = ?auto_27032 ?auto_27043 ) ) ( not ( = ?auto_27032 ?auto_27045 ) ) ( not ( = ?auto_27033 ?auto_27043 ) ) ( not ( = ?auto_27033 ?auto_27045 ) ) ( not ( = ?auto_27034 ?auto_27043 ) ) ( not ( = ?auto_27034 ?auto_27045 ) ) ( not ( = ?auto_27035 ?auto_27043 ) ) ( not ( = ?auto_27035 ?auto_27045 ) ) ( not ( = ?auto_27036 ?auto_27043 ) ) ( not ( = ?auto_27036 ?auto_27045 ) ) ( not ( = ?auto_27037 ?auto_27043 ) ) ( not ( = ?auto_27037 ?auto_27045 ) ) ( not ( = ?auto_27038 ?auto_27043 ) ) ( not ( = ?auto_27038 ?auto_27045 ) ) ( not ( = ?auto_27039 ?auto_27043 ) ) ( not ( = ?auto_27039 ?auto_27045 ) ) ( not ( = ?auto_27040 ?auto_27043 ) ) ( not ( = ?auto_27040 ?auto_27045 ) ) ( not ( = ?auto_27042 ?auto_27043 ) ) ( not ( = ?auto_27042 ?auto_27045 ) ) ( not ( = ?auto_27041 ?auto_27043 ) ) ( not ( = ?auto_27041 ?auto_27045 ) ) ( not ( = ?auto_27043 ?auto_27071 ) ) ( not ( = ?auto_27043 ?auto_27062 ) ) ( not ( = ?auto_27043 ?auto_27086 ) ) ( not ( = ?auto_27043 ?auto_27065 ) ) ( not ( = ?auto_27043 ?auto_27056 ) ) ( not ( = ?auto_27043 ?auto_27080 ) ) ( not ( = ?auto_27043 ?auto_27077 ) ) ( not ( = ?auto_27043 ?auto_27074 ) ) ( not ( = ?auto_27043 ?auto_27052 ) ) ( not ( = ?auto_27043 ?auto_27059 ) ) ( not ( = ?auto_27043 ?auto_27076 ) ) ( not ( = ?auto_27043 ?auto_27054 ) ) ( not ( = ?auto_27043 ?auto_27053 ) ) ( not ( = ?auto_27043 ?auto_27078 ) ) ( not ( = ?auto_27043 ?auto_27085 ) ) ( not ( = ?auto_27048 ?auto_27064 ) ) ( not ( = ?auto_27048 ?auto_27069 ) ) ( not ( = ?auto_27048 ?auto_27068 ) ) ( not ( = ?auto_27048 ?auto_27051 ) ) ( not ( = ?auto_27048 ?auto_27058 ) ) ( not ( = ?auto_27048 ?auto_27084 ) ) ( not ( = ?auto_27048 ?auto_27055 ) ) ( not ( = ?auto_27048 ?auto_27061 ) ) ( not ( = ?auto_27048 ?auto_27063 ) ) ( not ( = ?auto_27048 ?auto_27057 ) ) ( not ( = ?auto_27048 ?auto_27083 ) ) ( not ( = ?auto_27046 ?auto_27087 ) ) ( not ( = ?auto_27046 ?auto_27073 ) ) ( not ( = ?auto_27046 ?auto_27081 ) ) ( not ( = ?auto_27046 ?auto_27066 ) ) ( not ( = ?auto_27046 ?auto_27075 ) ) ( not ( = ?auto_27046 ?auto_27067 ) ) ( not ( = ?auto_27046 ?auto_27060 ) ) ( not ( = ?auto_27046 ?auto_27072 ) ) ( not ( = ?auto_27046 ?auto_27079 ) ) ( not ( = ?auto_27046 ?auto_27082 ) ) ( not ( = ?auto_27046 ?auto_27070 ) ) ( not ( = ?auto_27045 ?auto_27071 ) ) ( not ( = ?auto_27045 ?auto_27062 ) ) ( not ( = ?auto_27045 ?auto_27086 ) ) ( not ( = ?auto_27045 ?auto_27065 ) ) ( not ( = ?auto_27045 ?auto_27056 ) ) ( not ( = ?auto_27045 ?auto_27080 ) ) ( not ( = ?auto_27045 ?auto_27077 ) ) ( not ( = ?auto_27045 ?auto_27074 ) ) ( not ( = ?auto_27045 ?auto_27052 ) ) ( not ( = ?auto_27045 ?auto_27059 ) ) ( not ( = ?auto_27045 ?auto_27076 ) ) ( not ( = ?auto_27045 ?auto_27054 ) ) ( not ( = ?auto_27045 ?auto_27053 ) ) ( not ( = ?auto_27045 ?auto_27078 ) ) ( not ( = ?auto_27045 ?auto_27085 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_27028 ?auto_27029 ?auto_27030 ?auto_27031 ?auto_27032 ?auto_27033 ?auto_27034 ?auto_27035 ?auto_27036 ?auto_27037 ?auto_27038 ?auto_27039 ?auto_27040 ?auto_27042 ?auto_27041 ?auto_27044 )
      ( MAKE-1CRATE ?auto_27044 ?auto_27043 )
      ( MAKE-16CRATE-VERIFY ?auto_27028 ?auto_27029 ?auto_27030 ?auto_27031 ?auto_27032 ?auto_27033 ?auto_27034 ?auto_27035 ?auto_27036 ?auto_27037 ?auto_27038 ?auto_27039 ?auto_27040 ?auto_27042 ?auto_27041 ?auto_27044 ?auto_27043 ) )
  )

)

