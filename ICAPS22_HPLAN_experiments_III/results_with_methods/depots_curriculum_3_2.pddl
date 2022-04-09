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
      ?auto_297 - SURFACE
      ?auto_298 - SURFACE
    )
    :vars
    (
      ?auto_299 - HOIST
      ?auto_300 - PLACE
      ?auto_302 - PLACE
      ?auto_303 - HOIST
      ?auto_304 - SURFACE
      ?auto_301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_299 ?auto_300 ) ( SURFACE-AT ?auto_297 ?auto_300 ) ( CLEAR ?auto_297 ) ( IS-CRATE ?auto_298 ) ( AVAILABLE ?auto_299 ) ( not ( = ?auto_302 ?auto_300 ) ) ( HOIST-AT ?auto_303 ?auto_302 ) ( AVAILABLE ?auto_303 ) ( SURFACE-AT ?auto_298 ?auto_302 ) ( ON ?auto_298 ?auto_304 ) ( CLEAR ?auto_298 ) ( TRUCK-AT ?auto_301 ?auto_300 ) ( not ( = ?auto_297 ?auto_298 ) ) ( not ( = ?auto_297 ?auto_304 ) ) ( not ( = ?auto_298 ?auto_304 ) ) ( not ( = ?auto_299 ?auto_303 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_301 ?auto_300 ?auto_302 )
      ( !LIFT ?auto_303 ?auto_298 ?auto_304 ?auto_302 )
      ( !LOAD ?auto_303 ?auto_298 ?auto_301 ?auto_302 )
      ( !DRIVE ?auto_301 ?auto_302 ?auto_300 )
      ( !UNLOAD ?auto_299 ?auto_298 ?auto_301 ?auto_300 )
      ( !DROP ?auto_299 ?auto_298 ?auto_297 ?auto_300 )
      ( MAKE-1CRATE-VERIFY ?auto_297 ?auto_298 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_307 - SURFACE
      ?auto_308 - SURFACE
    )
    :vars
    (
      ?auto_309 - HOIST
      ?auto_310 - PLACE
      ?auto_312 - PLACE
      ?auto_313 - HOIST
      ?auto_314 - SURFACE
      ?auto_311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_309 ?auto_310 ) ( SURFACE-AT ?auto_307 ?auto_310 ) ( CLEAR ?auto_307 ) ( IS-CRATE ?auto_308 ) ( AVAILABLE ?auto_309 ) ( not ( = ?auto_312 ?auto_310 ) ) ( HOIST-AT ?auto_313 ?auto_312 ) ( AVAILABLE ?auto_313 ) ( SURFACE-AT ?auto_308 ?auto_312 ) ( ON ?auto_308 ?auto_314 ) ( CLEAR ?auto_308 ) ( TRUCK-AT ?auto_311 ?auto_310 ) ( not ( = ?auto_307 ?auto_308 ) ) ( not ( = ?auto_307 ?auto_314 ) ) ( not ( = ?auto_308 ?auto_314 ) ) ( not ( = ?auto_309 ?auto_313 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_311 ?auto_310 ?auto_312 )
      ( !LIFT ?auto_313 ?auto_308 ?auto_314 ?auto_312 )
      ( !LOAD ?auto_313 ?auto_308 ?auto_311 ?auto_312 )
      ( !DRIVE ?auto_311 ?auto_312 ?auto_310 )
      ( !UNLOAD ?auto_309 ?auto_308 ?auto_311 ?auto_310 )
      ( !DROP ?auto_309 ?auto_308 ?auto_307 ?auto_310 )
      ( MAKE-1CRATE-VERIFY ?auto_307 ?auto_308 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_318 - SURFACE
      ?auto_319 - SURFACE
      ?auto_320 - SURFACE
    )
    :vars
    (
      ?auto_322 - HOIST
      ?auto_324 - PLACE
      ?auto_321 - PLACE
      ?auto_323 - HOIST
      ?auto_325 - SURFACE
      ?auto_327 - PLACE
      ?auto_328 - HOIST
      ?auto_329 - SURFACE
      ?auto_326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_322 ?auto_324 ) ( IS-CRATE ?auto_320 ) ( not ( = ?auto_321 ?auto_324 ) ) ( HOIST-AT ?auto_323 ?auto_321 ) ( AVAILABLE ?auto_323 ) ( SURFACE-AT ?auto_320 ?auto_321 ) ( ON ?auto_320 ?auto_325 ) ( CLEAR ?auto_320 ) ( not ( = ?auto_319 ?auto_320 ) ) ( not ( = ?auto_319 ?auto_325 ) ) ( not ( = ?auto_320 ?auto_325 ) ) ( not ( = ?auto_322 ?auto_323 ) ) ( SURFACE-AT ?auto_318 ?auto_324 ) ( CLEAR ?auto_318 ) ( IS-CRATE ?auto_319 ) ( AVAILABLE ?auto_322 ) ( not ( = ?auto_327 ?auto_324 ) ) ( HOIST-AT ?auto_328 ?auto_327 ) ( AVAILABLE ?auto_328 ) ( SURFACE-AT ?auto_319 ?auto_327 ) ( ON ?auto_319 ?auto_329 ) ( CLEAR ?auto_319 ) ( TRUCK-AT ?auto_326 ?auto_324 ) ( not ( = ?auto_318 ?auto_319 ) ) ( not ( = ?auto_318 ?auto_329 ) ) ( not ( = ?auto_319 ?auto_329 ) ) ( not ( = ?auto_322 ?auto_328 ) ) ( not ( = ?auto_318 ?auto_320 ) ) ( not ( = ?auto_318 ?auto_325 ) ) ( not ( = ?auto_320 ?auto_329 ) ) ( not ( = ?auto_321 ?auto_327 ) ) ( not ( = ?auto_323 ?auto_328 ) ) ( not ( = ?auto_325 ?auto_329 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_318 ?auto_319 )
      ( MAKE-1CRATE ?auto_319 ?auto_320 )
      ( MAKE-2CRATE-VERIFY ?auto_318 ?auto_319 ?auto_320 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_332 - SURFACE
      ?auto_333 - SURFACE
    )
    :vars
    (
      ?auto_334 - HOIST
      ?auto_335 - PLACE
      ?auto_337 - PLACE
      ?auto_338 - HOIST
      ?auto_339 - SURFACE
      ?auto_336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_334 ?auto_335 ) ( SURFACE-AT ?auto_332 ?auto_335 ) ( CLEAR ?auto_332 ) ( IS-CRATE ?auto_333 ) ( AVAILABLE ?auto_334 ) ( not ( = ?auto_337 ?auto_335 ) ) ( HOIST-AT ?auto_338 ?auto_337 ) ( AVAILABLE ?auto_338 ) ( SURFACE-AT ?auto_333 ?auto_337 ) ( ON ?auto_333 ?auto_339 ) ( CLEAR ?auto_333 ) ( TRUCK-AT ?auto_336 ?auto_335 ) ( not ( = ?auto_332 ?auto_333 ) ) ( not ( = ?auto_332 ?auto_339 ) ) ( not ( = ?auto_333 ?auto_339 ) ) ( not ( = ?auto_334 ?auto_338 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_336 ?auto_335 ?auto_337 )
      ( !LIFT ?auto_338 ?auto_333 ?auto_339 ?auto_337 )
      ( !LOAD ?auto_338 ?auto_333 ?auto_336 ?auto_337 )
      ( !DRIVE ?auto_336 ?auto_337 ?auto_335 )
      ( !UNLOAD ?auto_334 ?auto_333 ?auto_336 ?auto_335 )
      ( !DROP ?auto_334 ?auto_333 ?auto_332 ?auto_335 )
      ( MAKE-1CRATE-VERIFY ?auto_332 ?auto_333 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_344 - SURFACE
      ?auto_345 - SURFACE
      ?auto_346 - SURFACE
      ?auto_347 - SURFACE
    )
    :vars
    (
      ?auto_349 - HOIST
      ?auto_352 - PLACE
      ?auto_351 - PLACE
      ?auto_348 - HOIST
      ?auto_350 - SURFACE
      ?auto_355 - PLACE
      ?auto_354 - HOIST
      ?auto_357 - SURFACE
      ?auto_356 - SURFACE
      ?auto_353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_349 ?auto_352 ) ( IS-CRATE ?auto_347 ) ( not ( = ?auto_351 ?auto_352 ) ) ( HOIST-AT ?auto_348 ?auto_351 ) ( SURFACE-AT ?auto_347 ?auto_351 ) ( ON ?auto_347 ?auto_350 ) ( CLEAR ?auto_347 ) ( not ( = ?auto_346 ?auto_347 ) ) ( not ( = ?auto_346 ?auto_350 ) ) ( not ( = ?auto_347 ?auto_350 ) ) ( not ( = ?auto_349 ?auto_348 ) ) ( IS-CRATE ?auto_346 ) ( not ( = ?auto_355 ?auto_352 ) ) ( HOIST-AT ?auto_354 ?auto_355 ) ( AVAILABLE ?auto_354 ) ( SURFACE-AT ?auto_346 ?auto_355 ) ( ON ?auto_346 ?auto_357 ) ( CLEAR ?auto_346 ) ( not ( = ?auto_345 ?auto_346 ) ) ( not ( = ?auto_345 ?auto_357 ) ) ( not ( = ?auto_346 ?auto_357 ) ) ( not ( = ?auto_349 ?auto_354 ) ) ( SURFACE-AT ?auto_344 ?auto_352 ) ( CLEAR ?auto_344 ) ( IS-CRATE ?auto_345 ) ( AVAILABLE ?auto_349 ) ( AVAILABLE ?auto_348 ) ( SURFACE-AT ?auto_345 ?auto_351 ) ( ON ?auto_345 ?auto_356 ) ( CLEAR ?auto_345 ) ( TRUCK-AT ?auto_353 ?auto_352 ) ( not ( = ?auto_344 ?auto_345 ) ) ( not ( = ?auto_344 ?auto_356 ) ) ( not ( = ?auto_345 ?auto_356 ) ) ( not ( = ?auto_344 ?auto_346 ) ) ( not ( = ?auto_344 ?auto_357 ) ) ( not ( = ?auto_346 ?auto_356 ) ) ( not ( = ?auto_355 ?auto_351 ) ) ( not ( = ?auto_354 ?auto_348 ) ) ( not ( = ?auto_357 ?auto_356 ) ) ( not ( = ?auto_344 ?auto_347 ) ) ( not ( = ?auto_344 ?auto_350 ) ) ( not ( = ?auto_345 ?auto_347 ) ) ( not ( = ?auto_345 ?auto_350 ) ) ( not ( = ?auto_347 ?auto_357 ) ) ( not ( = ?auto_347 ?auto_356 ) ) ( not ( = ?auto_350 ?auto_357 ) ) ( not ( = ?auto_350 ?auto_356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_344 ?auto_345 ?auto_346 )
      ( MAKE-1CRATE ?auto_346 ?auto_347 )
      ( MAKE-3CRATE-VERIFY ?auto_344 ?auto_345 ?auto_346 ?auto_347 ) )
  )

)

