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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_301 - SURFACE
      ?auto_302 - SURFACE
    )
    :vars
    (
      ?auto_303 - HOIST
      ?auto_304 - PLACE
      ?auto_306 - PLACE
      ?auto_307 - HOIST
      ?auto_308 - SURFACE
      ?auto_305 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_303 ?auto_304 ) ( SURFACE-AT ?auto_301 ?auto_304 ) ( CLEAR ?auto_301 ) ( IS-CRATE ?auto_302 ) ( AVAILABLE ?auto_303 ) ( not ( = ?auto_306 ?auto_304 ) ) ( HOIST-AT ?auto_307 ?auto_306 ) ( AVAILABLE ?auto_307 ) ( SURFACE-AT ?auto_302 ?auto_306 ) ( ON ?auto_302 ?auto_308 ) ( CLEAR ?auto_302 ) ( TRUCK-AT ?auto_305 ?auto_304 ) ( not ( = ?auto_301 ?auto_302 ) ) ( not ( = ?auto_301 ?auto_308 ) ) ( not ( = ?auto_302 ?auto_308 ) ) ( not ( = ?auto_303 ?auto_307 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_305 ?auto_304 ?auto_306 )
      ( !LIFT ?auto_307 ?auto_302 ?auto_308 ?auto_306 )
      ( !LOAD ?auto_307 ?auto_302 ?auto_305 ?auto_306 )
      ( !DRIVE ?auto_305 ?auto_306 ?auto_304 )
      ( !UNLOAD ?auto_303 ?auto_302 ?auto_305 ?auto_304 )
      ( !DROP ?auto_303 ?auto_302 ?auto_301 ?auto_304 )
      ( MAKE-1CRATE-VERIFY ?auto_301 ?auto_302 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_311 - SURFACE
      ?auto_312 - SURFACE
    )
    :vars
    (
      ?auto_313 - HOIST
      ?auto_314 - PLACE
      ?auto_316 - PLACE
      ?auto_317 - HOIST
      ?auto_318 - SURFACE
      ?auto_315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_313 ?auto_314 ) ( SURFACE-AT ?auto_311 ?auto_314 ) ( CLEAR ?auto_311 ) ( IS-CRATE ?auto_312 ) ( AVAILABLE ?auto_313 ) ( not ( = ?auto_316 ?auto_314 ) ) ( HOIST-AT ?auto_317 ?auto_316 ) ( AVAILABLE ?auto_317 ) ( SURFACE-AT ?auto_312 ?auto_316 ) ( ON ?auto_312 ?auto_318 ) ( CLEAR ?auto_312 ) ( TRUCK-AT ?auto_315 ?auto_314 ) ( not ( = ?auto_311 ?auto_312 ) ) ( not ( = ?auto_311 ?auto_318 ) ) ( not ( = ?auto_312 ?auto_318 ) ) ( not ( = ?auto_313 ?auto_317 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_315 ?auto_314 ?auto_316 )
      ( !LIFT ?auto_317 ?auto_312 ?auto_318 ?auto_316 )
      ( !LOAD ?auto_317 ?auto_312 ?auto_315 ?auto_316 )
      ( !DRIVE ?auto_315 ?auto_316 ?auto_314 )
      ( !UNLOAD ?auto_313 ?auto_312 ?auto_315 ?auto_314 )
      ( !DROP ?auto_313 ?auto_312 ?auto_311 ?auto_314 )
      ( MAKE-1CRATE-VERIFY ?auto_311 ?auto_312 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_322 - SURFACE
      ?auto_323 - SURFACE
      ?auto_324 - SURFACE
    )
    :vars
    (
      ?auto_325 - HOIST
      ?auto_327 - PLACE
      ?auto_328 - PLACE
      ?auto_326 - HOIST
      ?auto_330 - SURFACE
      ?auto_331 - SURFACE
      ?auto_329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_325 ?auto_327 ) ( IS-CRATE ?auto_324 ) ( not ( = ?auto_328 ?auto_327 ) ) ( HOIST-AT ?auto_326 ?auto_328 ) ( SURFACE-AT ?auto_324 ?auto_328 ) ( ON ?auto_324 ?auto_330 ) ( CLEAR ?auto_324 ) ( not ( = ?auto_323 ?auto_324 ) ) ( not ( = ?auto_323 ?auto_330 ) ) ( not ( = ?auto_324 ?auto_330 ) ) ( not ( = ?auto_325 ?auto_326 ) ) ( SURFACE-AT ?auto_322 ?auto_327 ) ( CLEAR ?auto_322 ) ( IS-CRATE ?auto_323 ) ( AVAILABLE ?auto_325 ) ( AVAILABLE ?auto_326 ) ( SURFACE-AT ?auto_323 ?auto_328 ) ( ON ?auto_323 ?auto_331 ) ( CLEAR ?auto_323 ) ( TRUCK-AT ?auto_329 ?auto_327 ) ( not ( = ?auto_322 ?auto_323 ) ) ( not ( = ?auto_322 ?auto_331 ) ) ( not ( = ?auto_323 ?auto_331 ) ) ( not ( = ?auto_322 ?auto_324 ) ) ( not ( = ?auto_322 ?auto_330 ) ) ( not ( = ?auto_324 ?auto_331 ) ) ( not ( = ?auto_330 ?auto_331 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_322 ?auto_323 )
      ( MAKE-1CRATE ?auto_323 ?auto_324 )
      ( MAKE-2CRATE-VERIFY ?auto_322 ?auto_323 ?auto_324 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_334 - SURFACE
      ?auto_335 - SURFACE
    )
    :vars
    (
      ?auto_336 - HOIST
      ?auto_337 - PLACE
      ?auto_339 - PLACE
      ?auto_340 - HOIST
      ?auto_341 - SURFACE
      ?auto_338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_336 ?auto_337 ) ( SURFACE-AT ?auto_334 ?auto_337 ) ( CLEAR ?auto_334 ) ( IS-CRATE ?auto_335 ) ( AVAILABLE ?auto_336 ) ( not ( = ?auto_339 ?auto_337 ) ) ( HOIST-AT ?auto_340 ?auto_339 ) ( AVAILABLE ?auto_340 ) ( SURFACE-AT ?auto_335 ?auto_339 ) ( ON ?auto_335 ?auto_341 ) ( CLEAR ?auto_335 ) ( TRUCK-AT ?auto_338 ?auto_337 ) ( not ( = ?auto_334 ?auto_335 ) ) ( not ( = ?auto_334 ?auto_341 ) ) ( not ( = ?auto_335 ?auto_341 ) ) ( not ( = ?auto_336 ?auto_340 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_338 ?auto_337 ?auto_339 )
      ( !LIFT ?auto_340 ?auto_335 ?auto_341 ?auto_339 )
      ( !LOAD ?auto_340 ?auto_335 ?auto_338 ?auto_339 )
      ( !DRIVE ?auto_338 ?auto_339 ?auto_337 )
      ( !UNLOAD ?auto_336 ?auto_335 ?auto_338 ?auto_337 )
      ( !DROP ?auto_336 ?auto_335 ?auto_334 ?auto_337 )
      ( MAKE-1CRATE-VERIFY ?auto_334 ?auto_335 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_346 - SURFACE
      ?auto_347 - SURFACE
      ?auto_348 - SURFACE
      ?auto_349 - SURFACE
    )
    :vars
    (
      ?auto_353 - HOIST
      ?auto_350 - PLACE
      ?auto_351 - PLACE
      ?auto_354 - HOIST
      ?auto_352 - SURFACE
      ?auto_356 - SURFACE
      ?auto_357 - SURFACE
      ?auto_355 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353 ?auto_350 ) ( IS-CRATE ?auto_349 ) ( not ( = ?auto_351 ?auto_350 ) ) ( HOIST-AT ?auto_354 ?auto_351 ) ( SURFACE-AT ?auto_349 ?auto_351 ) ( ON ?auto_349 ?auto_352 ) ( CLEAR ?auto_349 ) ( not ( = ?auto_348 ?auto_349 ) ) ( not ( = ?auto_348 ?auto_352 ) ) ( not ( = ?auto_349 ?auto_352 ) ) ( not ( = ?auto_353 ?auto_354 ) ) ( IS-CRATE ?auto_348 ) ( SURFACE-AT ?auto_348 ?auto_351 ) ( ON ?auto_348 ?auto_356 ) ( CLEAR ?auto_348 ) ( not ( = ?auto_347 ?auto_348 ) ) ( not ( = ?auto_347 ?auto_356 ) ) ( not ( = ?auto_348 ?auto_356 ) ) ( SURFACE-AT ?auto_346 ?auto_350 ) ( CLEAR ?auto_346 ) ( IS-CRATE ?auto_347 ) ( AVAILABLE ?auto_353 ) ( AVAILABLE ?auto_354 ) ( SURFACE-AT ?auto_347 ?auto_351 ) ( ON ?auto_347 ?auto_357 ) ( CLEAR ?auto_347 ) ( TRUCK-AT ?auto_355 ?auto_350 ) ( not ( = ?auto_346 ?auto_347 ) ) ( not ( = ?auto_346 ?auto_357 ) ) ( not ( = ?auto_347 ?auto_357 ) ) ( not ( = ?auto_346 ?auto_348 ) ) ( not ( = ?auto_346 ?auto_356 ) ) ( not ( = ?auto_348 ?auto_357 ) ) ( not ( = ?auto_356 ?auto_357 ) ) ( not ( = ?auto_346 ?auto_349 ) ) ( not ( = ?auto_346 ?auto_352 ) ) ( not ( = ?auto_347 ?auto_349 ) ) ( not ( = ?auto_347 ?auto_352 ) ) ( not ( = ?auto_349 ?auto_356 ) ) ( not ( = ?auto_349 ?auto_357 ) ) ( not ( = ?auto_352 ?auto_356 ) ) ( not ( = ?auto_352 ?auto_357 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_346 ?auto_347 ?auto_348 )
      ( MAKE-1CRATE ?auto_348 ?auto_349 )
      ( MAKE-3CRATE-VERIFY ?auto_346 ?auto_347 ?auto_348 ?auto_349 ) )
  )

)

