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
      ?auto_329 - PLACE
      ?auto_330 - PLACE
      ?auto_327 - HOIST
      ?auto_328 - SURFACE
      ?auto_331 - SURFACE
      ?auto_326 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_325 ?auto_329 ) ( IS-CRATE ?auto_324 ) ( not ( = ?auto_330 ?auto_329 ) ) ( HOIST-AT ?auto_327 ?auto_330 ) ( SURFACE-AT ?auto_324 ?auto_330 ) ( ON ?auto_324 ?auto_328 ) ( CLEAR ?auto_324 ) ( not ( = ?auto_323 ?auto_324 ) ) ( not ( = ?auto_323 ?auto_328 ) ) ( not ( = ?auto_324 ?auto_328 ) ) ( not ( = ?auto_325 ?auto_327 ) ) ( SURFACE-AT ?auto_322 ?auto_329 ) ( CLEAR ?auto_322 ) ( IS-CRATE ?auto_323 ) ( AVAILABLE ?auto_325 ) ( AVAILABLE ?auto_327 ) ( SURFACE-AT ?auto_323 ?auto_330 ) ( ON ?auto_323 ?auto_331 ) ( CLEAR ?auto_323 ) ( TRUCK-AT ?auto_326 ?auto_329 ) ( not ( = ?auto_322 ?auto_323 ) ) ( not ( = ?auto_322 ?auto_331 ) ) ( not ( = ?auto_323 ?auto_331 ) ) ( not ( = ?auto_322 ?auto_324 ) ) ( not ( = ?auto_322 ?auto_328 ) ) ( not ( = ?auto_324 ?auto_331 ) ) ( not ( = ?auto_328 ?auto_331 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_322 ?auto_323 )
      ( MAKE-1CRATE ?auto_323 ?auto_324 )
      ( MAKE-2CRATE-VERIFY ?auto_322 ?auto_323 ?auto_324 ) )
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
      ?auto_352 - HOIST
      ?auto_351 - PLACE
      ?auto_355 - PLACE
      ?auto_350 - HOIST
      ?auto_354 - SURFACE
      ?auto_356 - SURFACE
      ?auto_357 - SURFACE
      ?auto_353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_352 ?auto_351 ) ( IS-CRATE ?auto_349 ) ( not ( = ?auto_355 ?auto_351 ) ) ( HOIST-AT ?auto_350 ?auto_355 ) ( SURFACE-AT ?auto_349 ?auto_355 ) ( ON ?auto_349 ?auto_354 ) ( CLEAR ?auto_349 ) ( not ( = ?auto_348 ?auto_349 ) ) ( not ( = ?auto_348 ?auto_354 ) ) ( not ( = ?auto_349 ?auto_354 ) ) ( not ( = ?auto_352 ?auto_350 ) ) ( IS-CRATE ?auto_348 ) ( SURFACE-AT ?auto_348 ?auto_355 ) ( ON ?auto_348 ?auto_356 ) ( CLEAR ?auto_348 ) ( not ( = ?auto_347 ?auto_348 ) ) ( not ( = ?auto_347 ?auto_356 ) ) ( not ( = ?auto_348 ?auto_356 ) ) ( SURFACE-AT ?auto_346 ?auto_351 ) ( CLEAR ?auto_346 ) ( IS-CRATE ?auto_347 ) ( AVAILABLE ?auto_352 ) ( AVAILABLE ?auto_350 ) ( SURFACE-AT ?auto_347 ?auto_355 ) ( ON ?auto_347 ?auto_357 ) ( CLEAR ?auto_347 ) ( TRUCK-AT ?auto_353 ?auto_351 ) ( not ( = ?auto_346 ?auto_347 ) ) ( not ( = ?auto_346 ?auto_357 ) ) ( not ( = ?auto_347 ?auto_357 ) ) ( not ( = ?auto_346 ?auto_348 ) ) ( not ( = ?auto_346 ?auto_356 ) ) ( not ( = ?auto_348 ?auto_357 ) ) ( not ( = ?auto_356 ?auto_357 ) ) ( not ( = ?auto_346 ?auto_349 ) ) ( not ( = ?auto_346 ?auto_354 ) ) ( not ( = ?auto_347 ?auto_349 ) ) ( not ( = ?auto_347 ?auto_354 ) ) ( not ( = ?auto_349 ?auto_356 ) ) ( not ( = ?auto_349 ?auto_357 ) ) ( not ( = ?auto_354 ?auto_356 ) ) ( not ( = ?auto_354 ?auto_357 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_346 ?auto_347 ?auto_348 )
      ( MAKE-1CRATE ?auto_348 ?auto_349 )
      ( MAKE-3CRATE-VERIFY ?auto_346 ?auto_347 ?auto_348 ?auto_349 ) )
  )

)

