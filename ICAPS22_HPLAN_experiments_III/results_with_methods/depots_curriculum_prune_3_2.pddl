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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_318 - SURFACE
      ?auto_319 - SURFACE
      ?auto_320 - SURFACE
    )
    :vars
    (
      ?auto_326 - HOIST
      ?auto_321 - PLACE
      ?auto_322 - PLACE
      ?auto_323 - HOIST
      ?auto_324 - SURFACE
      ?auto_328 - PLACE
      ?auto_329 - HOIST
      ?auto_327 - SURFACE
      ?auto_325 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_326 ?auto_321 ) ( IS-CRATE ?auto_320 ) ( not ( = ?auto_322 ?auto_321 ) ) ( HOIST-AT ?auto_323 ?auto_322 ) ( AVAILABLE ?auto_323 ) ( SURFACE-AT ?auto_320 ?auto_322 ) ( ON ?auto_320 ?auto_324 ) ( CLEAR ?auto_320 ) ( not ( = ?auto_319 ?auto_320 ) ) ( not ( = ?auto_319 ?auto_324 ) ) ( not ( = ?auto_320 ?auto_324 ) ) ( not ( = ?auto_326 ?auto_323 ) ) ( SURFACE-AT ?auto_318 ?auto_321 ) ( CLEAR ?auto_318 ) ( IS-CRATE ?auto_319 ) ( AVAILABLE ?auto_326 ) ( not ( = ?auto_328 ?auto_321 ) ) ( HOIST-AT ?auto_329 ?auto_328 ) ( AVAILABLE ?auto_329 ) ( SURFACE-AT ?auto_319 ?auto_328 ) ( ON ?auto_319 ?auto_327 ) ( CLEAR ?auto_319 ) ( TRUCK-AT ?auto_325 ?auto_321 ) ( not ( = ?auto_318 ?auto_319 ) ) ( not ( = ?auto_318 ?auto_327 ) ) ( not ( = ?auto_319 ?auto_327 ) ) ( not ( = ?auto_326 ?auto_329 ) ) ( not ( = ?auto_318 ?auto_320 ) ) ( not ( = ?auto_318 ?auto_324 ) ) ( not ( = ?auto_320 ?auto_327 ) ) ( not ( = ?auto_322 ?auto_328 ) ) ( not ( = ?auto_323 ?auto_329 ) ) ( not ( = ?auto_324 ?auto_327 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_318 ?auto_319 )
      ( MAKE-1CRATE ?auto_319 ?auto_320 )
      ( MAKE-2CRATE-VERIFY ?auto_318 ?auto_319 ?auto_320 ) )
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
      ?auto_353 - HOIST
      ?auto_351 - PLACE
      ?auto_348 - PLACE
      ?auto_349 - HOIST
      ?auto_352 - SURFACE
      ?auto_357 - PLACE
      ?auto_356 - HOIST
      ?auto_355 - SURFACE
      ?auto_354 - SURFACE
      ?auto_350 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_353 ?auto_351 ) ( IS-CRATE ?auto_347 ) ( not ( = ?auto_348 ?auto_351 ) ) ( HOIST-AT ?auto_349 ?auto_348 ) ( SURFACE-AT ?auto_347 ?auto_348 ) ( ON ?auto_347 ?auto_352 ) ( CLEAR ?auto_347 ) ( not ( = ?auto_346 ?auto_347 ) ) ( not ( = ?auto_346 ?auto_352 ) ) ( not ( = ?auto_347 ?auto_352 ) ) ( not ( = ?auto_353 ?auto_349 ) ) ( IS-CRATE ?auto_346 ) ( not ( = ?auto_357 ?auto_351 ) ) ( HOIST-AT ?auto_356 ?auto_357 ) ( AVAILABLE ?auto_356 ) ( SURFACE-AT ?auto_346 ?auto_357 ) ( ON ?auto_346 ?auto_355 ) ( CLEAR ?auto_346 ) ( not ( = ?auto_345 ?auto_346 ) ) ( not ( = ?auto_345 ?auto_355 ) ) ( not ( = ?auto_346 ?auto_355 ) ) ( not ( = ?auto_353 ?auto_356 ) ) ( SURFACE-AT ?auto_344 ?auto_351 ) ( CLEAR ?auto_344 ) ( IS-CRATE ?auto_345 ) ( AVAILABLE ?auto_353 ) ( AVAILABLE ?auto_349 ) ( SURFACE-AT ?auto_345 ?auto_348 ) ( ON ?auto_345 ?auto_354 ) ( CLEAR ?auto_345 ) ( TRUCK-AT ?auto_350 ?auto_351 ) ( not ( = ?auto_344 ?auto_345 ) ) ( not ( = ?auto_344 ?auto_354 ) ) ( not ( = ?auto_345 ?auto_354 ) ) ( not ( = ?auto_344 ?auto_346 ) ) ( not ( = ?auto_344 ?auto_355 ) ) ( not ( = ?auto_346 ?auto_354 ) ) ( not ( = ?auto_357 ?auto_348 ) ) ( not ( = ?auto_356 ?auto_349 ) ) ( not ( = ?auto_355 ?auto_354 ) ) ( not ( = ?auto_344 ?auto_347 ) ) ( not ( = ?auto_344 ?auto_352 ) ) ( not ( = ?auto_345 ?auto_347 ) ) ( not ( = ?auto_345 ?auto_352 ) ) ( not ( = ?auto_347 ?auto_355 ) ) ( not ( = ?auto_347 ?auto_354 ) ) ( not ( = ?auto_352 ?auto_355 ) ) ( not ( = ?auto_352 ?auto_354 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_344 ?auto_345 ?auto_346 )
      ( MAKE-1CRATE ?auto_346 ?auto_347 )
      ( MAKE-3CRATE-VERIFY ?auto_344 ?auto_345 ?auto_346 ?auto_347 ) )
  )

)

