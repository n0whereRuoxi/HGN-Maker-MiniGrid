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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845324 - SURFACE
      ?auto_845325 - SURFACE
    )
    :vars
    (
      ?auto_845326 - HOIST
      ?auto_845327 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845326 ?auto_845327 ) ( SURFACE-AT ?auto_845324 ?auto_845327 ) ( CLEAR ?auto_845324 ) ( LIFTING ?auto_845326 ?auto_845325 ) ( IS-CRATE ?auto_845325 ) ( not ( = ?auto_845324 ?auto_845325 ) ) )
    :subtasks
    ( ( !DROP ?auto_845326 ?auto_845325 ?auto_845324 ?auto_845327 )
      ( MAKE-1CRATE-VERIFY ?auto_845324 ?auto_845325 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845328 - SURFACE
      ?auto_845329 - SURFACE
    )
    :vars
    (
      ?auto_845331 - HOIST
      ?auto_845330 - PLACE
      ?auto_845332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845331 ?auto_845330 ) ( SURFACE-AT ?auto_845328 ?auto_845330 ) ( CLEAR ?auto_845328 ) ( IS-CRATE ?auto_845329 ) ( not ( = ?auto_845328 ?auto_845329 ) ) ( TRUCK-AT ?auto_845332 ?auto_845330 ) ( AVAILABLE ?auto_845331 ) ( IN ?auto_845329 ?auto_845332 ) )
    :subtasks
    ( ( !UNLOAD ?auto_845331 ?auto_845329 ?auto_845332 ?auto_845330 )
      ( MAKE-1CRATE ?auto_845328 ?auto_845329 )
      ( MAKE-1CRATE-VERIFY ?auto_845328 ?auto_845329 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845333 - SURFACE
      ?auto_845334 - SURFACE
    )
    :vars
    (
      ?auto_845337 - HOIST
      ?auto_845335 - PLACE
      ?auto_845336 - TRUCK
      ?auto_845338 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845337 ?auto_845335 ) ( SURFACE-AT ?auto_845333 ?auto_845335 ) ( CLEAR ?auto_845333 ) ( IS-CRATE ?auto_845334 ) ( not ( = ?auto_845333 ?auto_845334 ) ) ( AVAILABLE ?auto_845337 ) ( IN ?auto_845334 ?auto_845336 ) ( TRUCK-AT ?auto_845336 ?auto_845338 ) ( not ( = ?auto_845338 ?auto_845335 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_845336 ?auto_845338 ?auto_845335 )
      ( MAKE-1CRATE ?auto_845333 ?auto_845334 )
      ( MAKE-1CRATE-VERIFY ?auto_845333 ?auto_845334 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845339 - SURFACE
      ?auto_845340 - SURFACE
    )
    :vars
    (
      ?auto_845344 - HOIST
      ?auto_845343 - PLACE
      ?auto_845342 - TRUCK
      ?auto_845341 - PLACE
      ?auto_845345 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_845344 ?auto_845343 ) ( SURFACE-AT ?auto_845339 ?auto_845343 ) ( CLEAR ?auto_845339 ) ( IS-CRATE ?auto_845340 ) ( not ( = ?auto_845339 ?auto_845340 ) ) ( AVAILABLE ?auto_845344 ) ( TRUCK-AT ?auto_845342 ?auto_845341 ) ( not ( = ?auto_845341 ?auto_845343 ) ) ( HOIST-AT ?auto_845345 ?auto_845341 ) ( LIFTING ?auto_845345 ?auto_845340 ) ( not ( = ?auto_845344 ?auto_845345 ) ) )
    :subtasks
    ( ( !LOAD ?auto_845345 ?auto_845340 ?auto_845342 ?auto_845341 )
      ( MAKE-1CRATE ?auto_845339 ?auto_845340 )
      ( MAKE-1CRATE-VERIFY ?auto_845339 ?auto_845340 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845346 - SURFACE
      ?auto_845347 - SURFACE
    )
    :vars
    (
      ?auto_845352 - HOIST
      ?auto_845348 - PLACE
      ?auto_845350 - TRUCK
      ?auto_845351 - PLACE
      ?auto_845349 - HOIST
      ?auto_845353 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845352 ?auto_845348 ) ( SURFACE-AT ?auto_845346 ?auto_845348 ) ( CLEAR ?auto_845346 ) ( IS-CRATE ?auto_845347 ) ( not ( = ?auto_845346 ?auto_845347 ) ) ( AVAILABLE ?auto_845352 ) ( TRUCK-AT ?auto_845350 ?auto_845351 ) ( not ( = ?auto_845351 ?auto_845348 ) ) ( HOIST-AT ?auto_845349 ?auto_845351 ) ( not ( = ?auto_845352 ?auto_845349 ) ) ( AVAILABLE ?auto_845349 ) ( SURFACE-AT ?auto_845347 ?auto_845351 ) ( ON ?auto_845347 ?auto_845353 ) ( CLEAR ?auto_845347 ) ( not ( = ?auto_845346 ?auto_845353 ) ) ( not ( = ?auto_845347 ?auto_845353 ) ) )
    :subtasks
    ( ( !LIFT ?auto_845349 ?auto_845347 ?auto_845353 ?auto_845351 )
      ( MAKE-1CRATE ?auto_845346 ?auto_845347 )
      ( MAKE-1CRATE-VERIFY ?auto_845346 ?auto_845347 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845354 - SURFACE
      ?auto_845355 - SURFACE
    )
    :vars
    (
      ?auto_845360 - HOIST
      ?auto_845358 - PLACE
      ?auto_845361 - PLACE
      ?auto_845359 - HOIST
      ?auto_845357 - SURFACE
      ?auto_845356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845360 ?auto_845358 ) ( SURFACE-AT ?auto_845354 ?auto_845358 ) ( CLEAR ?auto_845354 ) ( IS-CRATE ?auto_845355 ) ( not ( = ?auto_845354 ?auto_845355 ) ) ( AVAILABLE ?auto_845360 ) ( not ( = ?auto_845361 ?auto_845358 ) ) ( HOIST-AT ?auto_845359 ?auto_845361 ) ( not ( = ?auto_845360 ?auto_845359 ) ) ( AVAILABLE ?auto_845359 ) ( SURFACE-AT ?auto_845355 ?auto_845361 ) ( ON ?auto_845355 ?auto_845357 ) ( CLEAR ?auto_845355 ) ( not ( = ?auto_845354 ?auto_845357 ) ) ( not ( = ?auto_845355 ?auto_845357 ) ) ( TRUCK-AT ?auto_845356 ?auto_845358 ) )
    :subtasks
    ( ( !DRIVE ?auto_845356 ?auto_845358 ?auto_845361 )
      ( MAKE-1CRATE ?auto_845354 ?auto_845355 )
      ( MAKE-1CRATE-VERIFY ?auto_845354 ?auto_845355 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_845371 - SURFACE
      ?auto_845372 - SURFACE
      ?auto_845373 - SURFACE
    )
    :vars
    (
      ?auto_845375 - HOIST
      ?auto_845374 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845375 ?auto_845374 ) ( SURFACE-AT ?auto_845372 ?auto_845374 ) ( CLEAR ?auto_845372 ) ( LIFTING ?auto_845375 ?auto_845373 ) ( IS-CRATE ?auto_845373 ) ( not ( = ?auto_845372 ?auto_845373 ) ) ( ON ?auto_845372 ?auto_845371 ) ( not ( = ?auto_845371 ?auto_845372 ) ) ( not ( = ?auto_845371 ?auto_845373 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845372 ?auto_845373 )
      ( MAKE-2CRATE-VERIFY ?auto_845371 ?auto_845372 ?auto_845373 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_845381 - SURFACE
      ?auto_845382 - SURFACE
      ?auto_845383 - SURFACE
    )
    :vars
    (
      ?auto_845384 - HOIST
      ?auto_845385 - PLACE
      ?auto_845386 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845384 ?auto_845385 ) ( SURFACE-AT ?auto_845382 ?auto_845385 ) ( CLEAR ?auto_845382 ) ( IS-CRATE ?auto_845383 ) ( not ( = ?auto_845382 ?auto_845383 ) ) ( TRUCK-AT ?auto_845386 ?auto_845385 ) ( AVAILABLE ?auto_845384 ) ( IN ?auto_845383 ?auto_845386 ) ( ON ?auto_845382 ?auto_845381 ) ( not ( = ?auto_845381 ?auto_845382 ) ) ( not ( = ?auto_845381 ?auto_845383 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845382 ?auto_845383 )
      ( MAKE-2CRATE-VERIFY ?auto_845381 ?auto_845382 ?auto_845383 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845387 - SURFACE
      ?auto_845388 - SURFACE
    )
    :vars
    (
      ?auto_845389 - HOIST
      ?auto_845391 - PLACE
      ?auto_845390 - TRUCK
      ?auto_845392 - SURFACE
      ?auto_845393 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845389 ?auto_845391 ) ( SURFACE-AT ?auto_845387 ?auto_845391 ) ( CLEAR ?auto_845387 ) ( IS-CRATE ?auto_845388 ) ( not ( = ?auto_845387 ?auto_845388 ) ) ( AVAILABLE ?auto_845389 ) ( IN ?auto_845388 ?auto_845390 ) ( ON ?auto_845387 ?auto_845392 ) ( not ( = ?auto_845392 ?auto_845387 ) ) ( not ( = ?auto_845392 ?auto_845388 ) ) ( TRUCK-AT ?auto_845390 ?auto_845393 ) ( not ( = ?auto_845393 ?auto_845391 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_845390 ?auto_845393 ?auto_845391 )
      ( MAKE-2CRATE ?auto_845392 ?auto_845387 ?auto_845388 )
      ( MAKE-1CRATE-VERIFY ?auto_845387 ?auto_845388 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_845394 - SURFACE
      ?auto_845395 - SURFACE
      ?auto_845396 - SURFACE
    )
    :vars
    (
      ?auto_845400 - HOIST
      ?auto_845398 - PLACE
      ?auto_845399 - TRUCK
      ?auto_845397 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845400 ?auto_845398 ) ( SURFACE-AT ?auto_845395 ?auto_845398 ) ( CLEAR ?auto_845395 ) ( IS-CRATE ?auto_845396 ) ( not ( = ?auto_845395 ?auto_845396 ) ) ( AVAILABLE ?auto_845400 ) ( IN ?auto_845396 ?auto_845399 ) ( ON ?auto_845395 ?auto_845394 ) ( not ( = ?auto_845394 ?auto_845395 ) ) ( not ( = ?auto_845394 ?auto_845396 ) ) ( TRUCK-AT ?auto_845399 ?auto_845397 ) ( not ( = ?auto_845397 ?auto_845398 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845395 ?auto_845396 )
      ( MAKE-2CRATE-VERIFY ?auto_845394 ?auto_845395 ?auto_845396 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845401 - SURFACE
      ?auto_845402 - SURFACE
    )
    :vars
    (
      ?auto_845405 - HOIST
      ?auto_845404 - PLACE
      ?auto_845403 - SURFACE
      ?auto_845406 - TRUCK
      ?auto_845407 - PLACE
      ?auto_845408 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_845405 ?auto_845404 ) ( SURFACE-AT ?auto_845401 ?auto_845404 ) ( CLEAR ?auto_845401 ) ( IS-CRATE ?auto_845402 ) ( not ( = ?auto_845401 ?auto_845402 ) ) ( AVAILABLE ?auto_845405 ) ( ON ?auto_845401 ?auto_845403 ) ( not ( = ?auto_845403 ?auto_845401 ) ) ( not ( = ?auto_845403 ?auto_845402 ) ) ( TRUCK-AT ?auto_845406 ?auto_845407 ) ( not ( = ?auto_845407 ?auto_845404 ) ) ( HOIST-AT ?auto_845408 ?auto_845407 ) ( LIFTING ?auto_845408 ?auto_845402 ) ( not ( = ?auto_845405 ?auto_845408 ) ) )
    :subtasks
    ( ( !LOAD ?auto_845408 ?auto_845402 ?auto_845406 ?auto_845407 )
      ( MAKE-2CRATE ?auto_845403 ?auto_845401 ?auto_845402 )
      ( MAKE-1CRATE-VERIFY ?auto_845401 ?auto_845402 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_845409 - SURFACE
      ?auto_845410 - SURFACE
      ?auto_845411 - SURFACE
    )
    :vars
    (
      ?auto_845415 - HOIST
      ?auto_845416 - PLACE
      ?auto_845414 - TRUCK
      ?auto_845412 - PLACE
      ?auto_845413 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_845415 ?auto_845416 ) ( SURFACE-AT ?auto_845410 ?auto_845416 ) ( CLEAR ?auto_845410 ) ( IS-CRATE ?auto_845411 ) ( not ( = ?auto_845410 ?auto_845411 ) ) ( AVAILABLE ?auto_845415 ) ( ON ?auto_845410 ?auto_845409 ) ( not ( = ?auto_845409 ?auto_845410 ) ) ( not ( = ?auto_845409 ?auto_845411 ) ) ( TRUCK-AT ?auto_845414 ?auto_845412 ) ( not ( = ?auto_845412 ?auto_845416 ) ) ( HOIST-AT ?auto_845413 ?auto_845412 ) ( LIFTING ?auto_845413 ?auto_845411 ) ( not ( = ?auto_845415 ?auto_845413 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845410 ?auto_845411 )
      ( MAKE-2CRATE-VERIFY ?auto_845409 ?auto_845410 ?auto_845411 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845417 - SURFACE
      ?auto_845418 - SURFACE
    )
    :vars
    (
      ?auto_845422 - HOIST
      ?auto_845419 - PLACE
      ?auto_845420 - SURFACE
      ?auto_845423 - TRUCK
      ?auto_845424 - PLACE
      ?auto_845421 - HOIST
      ?auto_845425 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845422 ?auto_845419 ) ( SURFACE-AT ?auto_845417 ?auto_845419 ) ( CLEAR ?auto_845417 ) ( IS-CRATE ?auto_845418 ) ( not ( = ?auto_845417 ?auto_845418 ) ) ( AVAILABLE ?auto_845422 ) ( ON ?auto_845417 ?auto_845420 ) ( not ( = ?auto_845420 ?auto_845417 ) ) ( not ( = ?auto_845420 ?auto_845418 ) ) ( TRUCK-AT ?auto_845423 ?auto_845424 ) ( not ( = ?auto_845424 ?auto_845419 ) ) ( HOIST-AT ?auto_845421 ?auto_845424 ) ( not ( = ?auto_845422 ?auto_845421 ) ) ( AVAILABLE ?auto_845421 ) ( SURFACE-AT ?auto_845418 ?auto_845424 ) ( ON ?auto_845418 ?auto_845425 ) ( CLEAR ?auto_845418 ) ( not ( = ?auto_845417 ?auto_845425 ) ) ( not ( = ?auto_845418 ?auto_845425 ) ) ( not ( = ?auto_845420 ?auto_845425 ) ) )
    :subtasks
    ( ( !LIFT ?auto_845421 ?auto_845418 ?auto_845425 ?auto_845424 )
      ( MAKE-2CRATE ?auto_845420 ?auto_845417 ?auto_845418 )
      ( MAKE-1CRATE-VERIFY ?auto_845417 ?auto_845418 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_845426 - SURFACE
      ?auto_845427 - SURFACE
      ?auto_845428 - SURFACE
    )
    :vars
    (
      ?auto_845433 - HOIST
      ?auto_845434 - PLACE
      ?auto_845431 - TRUCK
      ?auto_845430 - PLACE
      ?auto_845429 - HOIST
      ?auto_845432 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845433 ?auto_845434 ) ( SURFACE-AT ?auto_845427 ?auto_845434 ) ( CLEAR ?auto_845427 ) ( IS-CRATE ?auto_845428 ) ( not ( = ?auto_845427 ?auto_845428 ) ) ( AVAILABLE ?auto_845433 ) ( ON ?auto_845427 ?auto_845426 ) ( not ( = ?auto_845426 ?auto_845427 ) ) ( not ( = ?auto_845426 ?auto_845428 ) ) ( TRUCK-AT ?auto_845431 ?auto_845430 ) ( not ( = ?auto_845430 ?auto_845434 ) ) ( HOIST-AT ?auto_845429 ?auto_845430 ) ( not ( = ?auto_845433 ?auto_845429 ) ) ( AVAILABLE ?auto_845429 ) ( SURFACE-AT ?auto_845428 ?auto_845430 ) ( ON ?auto_845428 ?auto_845432 ) ( CLEAR ?auto_845428 ) ( not ( = ?auto_845427 ?auto_845432 ) ) ( not ( = ?auto_845428 ?auto_845432 ) ) ( not ( = ?auto_845426 ?auto_845432 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845427 ?auto_845428 )
      ( MAKE-2CRATE-VERIFY ?auto_845426 ?auto_845427 ?auto_845428 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845435 - SURFACE
      ?auto_845436 - SURFACE
    )
    :vars
    (
      ?auto_845438 - HOIST
      ?auto_845440 - PLACE
      ?auto_845442 - SURFACE
      ?auto_845437 - PLACE
      ?auto_845443 - HOIST
      ?auto_845439 - SURFACE
      ?auto_845441 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845438 ?auto_845440 ) ( SURFACE-AT ?auto_845435 ?auto_845440 ) ( CLEAR ?auto_845435 ) ( IS-CRATE ?auto_845436 ) ( not ( = ?auto_845435 ?auto_845436 ) ) ( AVAILABLE ?auto_845438 ) ( ON ?auto_845435 ?auto_845442 ) ( not ( = ?auto_845442 ?auto_845435 ) ) ( not ( = ?auto_845442 ?auto_845436 ) ) ( not ( = ?auto_845437 ?auto_845440 ) ) ( HOIST-AT ?auto_845443 ?auto_845437 ) ( not ( = ?auto_845438 ?auto_845443 ) ) ( AVAILABLE ?auto_845443 ) ( SURFACE-AT ?auto_845436 ?auto_845437 ) ( ON ?auto_845436 ?auto_845439 ) ( CLEAR ?auto_845436 ) ( not ( = ?auto_845435 ?auto_845439 ) ) ( not ( = ?auto_845436 ?auto_845439 ) ) ( not ( = ?auto_845442 ?auto_845439 ) ) ( TRUCK-AT ?auto_845441 ?auto_845440 ) )
    :subtasks
    ( ( !DRIVE ?auto_845441 ?auto_845440 ?auto_845437 )
      ( MAKE-2CRATE ?auto_845442 ?auto_845435 ?auto_845436 )
      ( MAKE-1CRATE-VERIFY ?auto_845435 ?auto_845436 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_845444 - SURFACE
      ?auto_845445 - SURFACE
      ?auto_845446 - SURFACE
    )
    :vars
    (
      ?auto_845448 - HOIST
      ?auto_845451 - PLACE
      ?auto_845449 - PLACE
      ?auto_845450 - HOIST
      ?auto_845447 - SURFACE
      ?auto_845452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845448 ?auto_845451 ) ( SURFACE-AT ?auto_845445 ?auto_845451 ) ( CLEAR ?auto_845445 ) ( IS-CRATE ?auto_845446 ) ( not ( = ?auto_845445 ?auto_845446 ) ) ( AVAILABLE ?auto_845448 ) ( ON ?auto_845445 ?auto_845444 ) ( not ( = ?auto_845444 ?auto_845445 ) ) ( not ( = ?auto_845444 ?auto_845446 ) ) ( not ( = ?auto_845449 ?auto_845451 ) ) ( HOIST-AT ?auto_845450 ?auto_845449 ) ( not ( = ?auto_845448 ?auto_845450 ) ) ( AVAILABLE ?auto_845450 ) ( SURFACE-AT ?auto_845446 ?auto_845449 ) ( ON ?auto_845446 ?auto_845447 ) ( CLEAR ?auto_845446 ) ( not ( = ?auto_845445 ?auto_845447 ) ) ( not ( = ?auto_845446 ?auto_845447 ) ) ( not ( = ?auto_845444 ?auto_845447 ) ) ( TRUCK-AT ?auto_845452 ?auto_845451 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845445 ?auto_845446 )
      ( MAKE-2CRATE-VERIFY ?auto_845444 ?auto_845445 ?auto_845446 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845453 - SURFACE
      ?auto_845454 - SURFACE
    )
    :vars
    (
      ?auto_845457 - HOIST
      ?auto_845459 - PLACE
      ?auto_845461 - SURFACE
      ?auto_845460 - PLACE
      ?auto_845456 - HOIST
      ?auto_845455 - SURFACE
      ?auto_845458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845457 ?auto_845459 ) ( IS-CRATE ?auto_845454 ) ( not ( = ?auto_845453 ?auto_845454 ) ) ( not ( = ?auto_845461 ?auto_845453 ) ) ( not ( = ?auto_845461 ?auto_845454 ) ) ( not ( = ?auto_845460 ?auto_845459 ) ) ( HOIST-AT ?auto_845456 ?auto_845460 ) ( not ( = ?auto_845457 ?auto_845456 ) ) ( AVAILABLE ?auto_845456 ) ( SURFACE-AT ?auto_845454 ?auto_845460 ) ( ON ?auto_845454 ?auto_845455 ) ( CLEAR ?auto_845454 ) ( not ( = ?auto_845453 ?auto_845455 ) ) ( not ( = ?auto_845454 ?auto_845455 ) ) ( not ( = ?auto_845461 ?auto_845455 ) ) ( TRUCK-AT ?auto_845458 ?auto_845459 ) ( SURFACE-AT ?auto_845461 ?auto_845459 ) ( CLEAR ?auto_845461 ) ( LIFTING ?auto_845457 ?auto_845453 ) ( IS-CRATE ?auto_845453 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845461 ?auto_845453 )
      ( MAKE-2CRATE ?auto_845461 ?auto_845453 ?auto_845454 )
      ( MAKE-1CRATE-VERIFY ?auto_845453 ?auto_845454 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_845462 - SURFACE
      ?auto_845463 - SURFACE
      ?auto_845464 - SURFACE
    )
    :vars
    (
      ?auto_845468 - HOIST
      ?auto_845470 - PLACE
      ?auto_845465 - PLACE
      ?auto_845469 - HOIST
      ?auto_845466 - SURFACE
      ?auto_845467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845468 ?auto_845470 ) ( IS-CRATE ?auto_845464 ) ( not ( = ?auto_845463 ?auto_845464 ) ) ( not ( = ?auto_845462 ?auto_845463 ) ) ( not ( = ?auto_845462 ?auto_845464 ) ) ( not ( = ?auto_845465 ?auto_845470 ) ) ( HOIST-AT ?auto_845469 ?auto_845465 ) ( not ( = ?auto_845468 ?auto_845469 ) ) ( AVAILABLE ?auto_845469 ) ( SURFACE-AT ?auto_845464 ?auto_845465 ) ( ON ?auto_845464 ?auto_845466 ) ( CLEAR ?auto_845464 ) ( not ( = ?auto_845463 ?auto_845466 ) ) ( not ( = ?auto_845464 ?auto_845466 ) ) ( not ( = ?auto_845462 ?auto_845466 ) ) ( TRUCK-AT ?auto_845467 ?auto_845470 ) ( SURFACE-AT ?auto_845462 ?auto_845470 ) ( CLEAR ?auto_845462 ) ( LIFTING ?auto_845468 ?auto_845463 ) ( IS-CRATE ?auto_845463 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845463 ?auto_845464 )
      ( MAKE-2CRATE-VERIFY ?auto_845462 ?auto_845463 ?auto_845464 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845471 - SURFACE
      ?auto_845472 - SURFACE
    )
    :vars
    (
      ?auto_845479 - HOIST
      ?auto_845476 - PLACE
      ?auto_845474 - SURFACE
      ?auto_845475 - PLACE
      ?auto_845473 - HOIST
      ?auto_845477 - SURFACE
      ?auto_845478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845479 ?auto_845476 ) ( IS-CRATE ?auto_845472 ) ( not ( = ?auto_845471 ?auto_845472 ) ) ( not ( = ?auto_845474 ?auto_845471 ) ) ( not ( = ?auto_845474 ?auto_845472 ) ) ( not ( = ?auto_845475 ?auto_845476 ) ) ( HOIST-AT ?auto_845473 ?auto_845475 ) ( not ( = ?auto_845479 ?auto_845473 ) ) ( AVAILABLE ?auto_845473 ) ( SURFACE-AT ?auto_845472 ?auto_845475 ) ( ON ?auto_845472 ?auto_845477 ) ( CLEAR ?auto_845472 ) ( not ( = ?auto_845471 ?auto_845477 ) ) ( not ( = ?auto_845472 ?auto_845477 ) ) ( not ( = ?auto_845474 ?auto_845477 ) ) ( TRUCK-AT ?auto_845478 ?auto_845476 ) ( SURFACE-AT ?auto_845474 ?auto_845476 ) ( CLEAR ?auto_845474 ) ( IS-CRATE ?auto_845471 ) ( AVAILABLE ?auto_845479 ) ( IN ?auto_845471 ?auto_845478 ) )
    :subtasks
    ( ( !UNLOAD ?auto_845479 ?auto_845471 ?auto_845478 ?auto_845476 )
      ( MAKE-2CRATE ?auto_845474 ?auto_845471 ?auto_845472 )
      ( MAKE-1CRATE-VERIFY ?auto_845471 ?auto_845472 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_845480 - SURFACE
      ?auto_845481 - SURFACE
      ?auto_845482 - SURFACE
    )
    :vars
    (
      ?auto_845488 - HOIST
      ?auto_845485 - PLACE
      ?auto_845486 - PLACE
      ?auto_845487 - HOIST
      ?auto_845484 - SURFACE
      ?auto_845483 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845488 ?auto_845485 ) ( IS-CRATE ?auto_845482 ) ( not ( = ?auto_845481 ?auto_845482 ) ) ( not ( = ?auto_845480 ?auto_845481 ) ) ( not ( = ?auto_845480 ?auto_845482 ) ) ( not ( = ?auto_845486 ?auto_845485 ) ) ( HOIST-AT ?auto_845487 ?auto_845486 ) ( not ( = ?auto_845488 ?auto_845487 ) ) ( AVAILABLE ?auto_845487 ) ( SURFACE-AT ?auto_845482 ?auto_845486 ) ( ON ?auto_845482 ?auto_845484 ) ( CLEAR ?auto_845482 ) ( not ( = ?auto_845481 ?auto_845484 ) ) ( not ( = ?auto_845482 ?auto_845484 ) ) ( not ( = ?auto_845480 ?auto_845484 ) ) ( TRUCK-AT ?auto_845483 ?auto_845485 ) ( SURFACE-AT ?auto_845480 ?auto_845485 ) ( CLEAR ?auto_845480 ) ( IS-CRATE ?auto_845481 ) ( AVAILABLE ?auto_845488 ) ( IN ?auto_845481 ?auto_845483 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845481 ?auto_845482 )
      ( MAKE-2CRATE-VERIFY ?auto_845480 ?auto_845481 ?auto_845482 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_845525 - SURFACE
      ?auto_845526 - SURFACE
    )
    :vars
    (
      ?auto_845529 - HOIST
      ?auto_845528 - PLACE
      ?auto_845533 - SURFACE
      ?auto_845532 - PLACE
      ?auto_845530 - HOIST
      ?auto_845531 - SURFACE
      ?auto_845527 - TRUCK
      ?auto_845534 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845529 ?auto_845528 ) ( SURFACE-AT ?auto_845525 ?auto_845528 ) ( CLEAR ?auto_845525 ) ( IS-CRATE ?auto_845526 ) ( not ( = ?auto_845525 ?auto_845526 ) ) ( AVAILABLE ?auto_845529 ) ( ON ?auto_845525 ?auto_845533 ) ( not ( = ?auto_845533 ?auto_845525 ) ) ( not ( = ?auto_845533 ?auto_845526 ) ) ( not ( = ?auto_845532 ?auto_845528 ) ) ( HOIST-AT ?auto_845530 ?auto_845532 ) ( not ( = ?auto_845529 ?auto_845530 ) ) ( AVAILABLE ?auto_845530 ) ( SURFACE-AT ?auto_845526 ?auto_845532 ) ( ON ?auto_845526 ?auto_845531 ) ( CLEAR ?auto_845526 ) ( not ( = ?auto_845525 ?auto_845531 ) ) ( not ( = ?auto_845526 ?auto_845531 ) ) ( not ( = ?auto_845533 ?auto_845531 ) ) ( TRUCK-AT ?auto_845527 ?auto_845534 ) ( not ( = ?auto_845534 ?auto_845528 ) ) ( not ( = ?auto_845532 ?auto_845534 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_845527 ?auto_845534 ?auto_845528 )
      ( MAKE-1CRATE ?auto_845525 ?auto_845526 )
      ( MAKE-1CRATE-VERIFY ?auto_845525 ?auto_845526 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845564 - SURFACE
      ?auto_845565 - SURFACE
      ?auto_845566 - SURFACE
      ?auto_845567 - SURFACE
    )
    :vars
    (
      ?auto_845569 - HOIST
      ?auto_845568 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845569 ?auto_845568 ) ( SURFACE-AT ?auto_845566 ?auto_845568 ) ( CLEAR ?auto_845566 ) ( LIFTING ?auto_845569 ?auto_845567 ) ( IS-CRATE ?auto_845567 ) ( not ( = ?auto_845566 ?auto_845567 ) ) ( ON ?auto_845565 ?auto_845564 ) ( ON ?auto_845566 ?auto_845565 ) ( not ( = ?auto_845564 ?auto_845565 ) ) ( not ( = ?auto_845564 ?auto_845566 ) ) ( not ( = ?auto_845564 ?auto_845567 ) ) ( not ( = ?auto_845565 ?auto_845566 ) ) ( not ( = ?auto_845565 ?auto_845567 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_845566 ?auto_845567 )
      ( MAKE-3CRATE-VERIFY ?auto_845564 ?auto_845565 ?auto_845566 ?auto_845567 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845581 - SURFACE
      ?auto_845582 - SURFACE
      ?auto_845583 - SURFACE
      ?auto_845584 - SURFACE
    )
    :vars
    (
      ?auto_845585 - HOIST
      ?auto_845586 - PLACE
      ?auto_845587 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845585 ?auto_845586 ) ( SURFACE-AT ?auto_845583 ?auto_845586 ) ( CLEAR ?auto_845583 ) ( IS-CRATE ?auto_845584 ) ( not ( = ?auto_845583 ?auto_845584 ) ) ( TRUCK-AT ?auto_845587 ?auto_845586 ) ( AVAILABLE ?auto_845585 ) ( IN ?auto_845584 ?auto_845587 ) ( ON ?auto_845583 ?auto_845582 ) ( not ( = ?auto_845582 ?auto_845583 ) ) ( not ( = ?auto_845582 ?auto_845584 ) ) ( ON ?auto_845582 ?auto_845581 ) ( not ( = ?auto_845581 ?auto_845582 ) ) ( not ( = ?auto_845581 ?auto_845583 ) ) ( not ( = ?auto_845581 ?auto_845584 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845582 ?auto_845583 ?auto_845584 )
      ( MAKE-3CRATE-VERIFY ?auto_845581 ?auto_845582 ?auto_845583 ?auto_845584 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845602 - SURFACE
      ?auto_845603 - SURFACE
      ?auto_845604 - SURFACE
      ?auto_845605 - SURFACE
    )
    :vars
    (
      ?auto_845609 - HOIST
      ?auto_845607 - PLACE
      ?auto_845606 - TRUCK
      ?auto_845608 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845609 ?auto_845607 ) ( SURFACE-AT ?auto_845604 ?auto_845607 ) ( CLEAR ?auto_845604 ) ( IS-CRATE ?auto_845605 ) ( not ( = ?auto_845604 ?auto_845605 ) ) ( AVAILABLE ?auto_845609 ) ( IN ?auto_845605 ?auto_845606 ) ( ON ?auto_845604 ?auto_845603 ) ( not ( = ?auto_845603 ?auto_845604 ) ) ( not ( = ?auto_845603 ?auto_845605 ) ) ( TRUCK-AT ?auto_845606 ?auto_845608 ) ( not ( = ?auto_845608 ?auto_845607 ) ) ( ON ?auto_845603 ?auto_845602 ) ( not ( = ?auto_845602 ?auto_845603 ) ) ( not ( = ?auto_845602 ?auto_845604 ) ) ( not ( = ?auto_845602 ?auto_845605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845603 ?auto_845604 ?auto_845605 )
      ( MAKE-3CRATE-VERIFY ?auto_845602 ?auto_845603 ?auto_845604 ?auto_845605 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845626 - SURFACE
      ?auto_845627 - SURFACE
      ?auto_845628 - SURFACE
      ?auto_845629 - SURFACE
    )
    :vars
    (
      ?auto_845631 - HOIST
      ?auto_845630 - PLACE
      ?auto_845633 - TRUCK
      ?auto_845632 - PLACE
      ?auto_845634 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_845631 ?auto_845630 ) ( SURFACE-AT ?auto_845628 ?auto_845630 ) ( CLEAR ?auto_845628 ) ( IS-CRATE ?auto_845629 ) ( not ( = ?auto_845628 ?auto_845629 ) ) ( AVAILABLE ?auto_845631 ) ( ON ?auto_845628 ?auto_845627 ) ( not ( = ?auto_845627 ?auto_845628 ) ) ( not ( = ?auto_845627 ?auto_845629 ) ) ( TRUCK-AT ?auto_845633 ?auto_845632 ) ( not ( = ?auto_845632 ?auto_845630 ) ) ( HOIST-AT ?auto_845634 ?auto_845632 ) ( LIFTING ?auto_845634 ?auto_845629 ) ( not ( = ?auto_845631 ?auto_845634 ) ) ( ON ?auto_845627 ?auto_845626 ) ( not ( = ?auto_845626 ?auto_845627 ) ) ( not ( = ?auto_845626 ?auto_845628 ) ) ( not ( = ?auto_845626 ?auto_845629 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845627 ?auto_845628 ?auto_845629 )
      ( MAKE-3CRATE-VERIFY ?auto_845626 ?auto_845627 ?auto_845628 ?auto_845629 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845653 - SURFACE
      ?auto_845654 - SURFACE
      ?auto_845655 - SURFACE
      ?auto_845656 - SURFACE
    )
    :vars
    (
      ?auto_845659 - HOIST
      ?auto_845657 - PLACE
      ?auto_845658 - TRUCK
      ?auto_845662 - PLACE
      ?auto_845660 - HOIST
      ?auto_845661 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845659 ?auto_845657 ) ( SURFACE-AT ?auto_845655 ?auto_845657 ) ( CLEAR ?auto_845655 ) ( IS-CRATE ?auto_845656 ) ( not ( = ?auto_845655 ?auto_845656 ) ) ( AVAILABLE ?auto_845659 ) ( ON ?auto_845655 ?auto_845654 ) ( not ( = ?auto_845654 ?auto_845655 ) ) ( not ( = ?auto_845654 ?auto_845656 ) ) ( TRUCK-AT ?auto_845658 ?auto_845662 ) ( not ( = ?auto_845662 ?auto_845657 ) ) ( HOIST-AT ?auto_845660 ?auto_845662 ) ( not ( = ?auto_845659 ?auto_845660 ) ) ( AVAILABLE ?auto_845660 ) ( SURFACE-AT ?auto_845656 ?auto_845662 ) ( ON ?auto_845656 ?auto_845661 ) ( CLEAR ?auto_845656 ) ( not ( = ?auto_845655 ?auto_845661 ) ) ( not ( = ?auto_845656 ?auto_845661 ) ) ( not ( = ?auto_845654 ?auto_845661 ) ) ( ON ?auto_845654 ?auto_845653 ) ( not ( = ?auto_845653 ?auto_845654 ) ) ( not ( = ?auto_845653 ?auto_845655 ) ) ( not ( = ?auto_845653 ?auto_845656 ) ) ( not ( = ?auto_845653 ?auto_845661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845654 ?auto_845655 ?auto_845656 )
      ( MAKE-3CRATE-VERIFY ?auto_845653 ?auto_845654 ?auto_845655 ?auto_845656 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845681 - SURFACE
      ?auto_845682 - SURFACE
      ?auto_845683 - SURFACE
      ?auto_845684 - SURFACE
    )
    :vars
    (
      ?auto_845688 - HOIST
      ?auto_845689 - PLACE
      ?auto_845690 - PLACE
      ?auto_845686 - HOIST
      ?auto_845687 - SURFACE
      ?auto_845685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845688 ?auto_845689 ) ( SURFACE-AT ?auto_845683 ?auto_845689 ) ( CLEAR ?auto_845683 ) ( IS-CRATE ?auto_845684 ) ( not ( = ?auto_845683 ?auto_845684 ) ) ( AVAILABLE ?auto_845688 ) ( ON ?auto_845683 ?auto_845682 ) ( not ( = ?auto_845682 ?auto_845683 ) ) ( not ( = ?auto_845682 ?auto_845684 ) ) ( not ( = ?auto_845690 ?auto_845689 ) ) ( HOIST-AT ?auto_845686 ?auto_845690 ) ( not ( = ?auto_845688 ?auto_845686 ) ) ( AVAILABLE ?auto_845686 ) ( SURFACE-AT ?auto_845684 ?auto_845690 ) ( ON ?auto_845684 ?auto_845687 ) ( CLEAR ?auto_845684 ) ( not ( = ?auto_845683 ?auto_845687 ) ) ( not ( = ?auto_845684 ?auto_845687 ) ) ( not ( = ?auto_845682 ?auto_845687 ) ) ( TRUCK-AT ?auto_845685 ?auto_845689 ) ( ON ?auto_845682 ?auto_845681 ) ( not ( = ?auto_845681 ?auto_845682 ) ) ( not ( = ?auto_845681 ?auto_845683 ) ) ( not ( = ?auto_845681 ?auto_845684 ) ) ( not ( = ?auto_845681 ?auto_845687 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845682 ?auto_845683 ?auto_845684 )
      ( MAKE-3CRATE-VERIFY ?auto_845681 ?auto_845682 ?auto_845683 ?auto_845684 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845709 - SURFACE
      ?auto_845710 - SURFACE
      ?auto_845711 - SURFACE
      ?auto_845712 - SURFACE
    )
    :vars
    (
      ?auto_845717 - HOIST
      ?auto_845716 - PLACE
      ?auto_845713 - PLACE
      ?auto_845718 - HOIST
      ?auto_845715 - SURFACE
      ?auto_845714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845717 ?auto_845716 ) ( IS-CRATE ?auto_845712 ) ( not ( = ?auto_845711 ?auto_845712 ) ) ( not ( = ?auto_845710 ?auto_845711 ) ) ( not ( = ?auto_845710 ?auto_845712 ) ) ( not ( = ?auto_845713 ?auto_845716 ) ) ( HOIST-AT ?auto_845718 ?auto_845713 ) ( not ( = ?auto_845717 ?auto_845718 ) ) ( AVAILABLE ?auto_845718 ) ( SURFACE-AT ?auto_845712 ?auto_845713 ) ( ON ?auto_845712 ?auto_845715 ) ( CLEAR ?auto_845712 ) ( not ( = ?auto_845711 ?auto_845715 ) ) ( not ( = ?auto_845712 ?auto_845715 ) ) ( not ( = ?auto_845710 ?auto_845715 ) ) ( TRUCK-AT ?auto_845714 ?auto_845716 ) ( SURFACE-AT ?auto_845710 ?auto_845716 ) ( CLEAR ?auto_845710 ) ( LIFTING ?auto_845717 ?auto_845711 ) ( IS-CRATE ?auto_845711 ) ( ON ?auto_845710 ?auto_845709 ) ( not ( = ?auto_845709 ?auto_845710 ) ) ( not ( = ?auto_845709 ?auto_845711 ) ) ( not ( = ?auto_845709 ?auto_845712 ) ) ( not ( = ?auto_845709 ?auto_845715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845710 ?auto_845711 ?auto_845712 )
      ( MAKE-3CRATE-VERIFY ?auto_845709 ?auto_845710 ?auto_845711 ?auto_845712 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_845737 - SURFACE
      ?auto_845738 - SURFACE
      ?auto_845739 - SURFACE
      ?auto_845740 - SURFACE
    )
    :vars
    (
      ?auto_845741 - HOIST
      ?auto_845746 - PLACE
      ?auto_845742 - PLACE
      ?auto_845743 - HOIST
      ?auto_845744 - SURFACE
      ?auto_845745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_845741 ?auto_845746 ) ( IS-CRATE ?auto_845740 ) ( not ( = ?auto_845739 ?auto_845740 ) ) ( not ( = ?auto_845738 ?auto_845739 ) ) ( not ( = ?auto_845738 ?auto_845740 ) ) ( not ( = ?auto_845742 ?auto_845746 ) ) ( HOIST-AT ?auto_845743 ?auto_845742 ) ( not ( = ?auto_845741 ?auto_845743 ) ) ( AVAILABLE ?auto_845743 ) ( SURFACE-AT ?auto_845740 ?auto_845742 ) ( ON ?auto_845740 ?auto_845744 ) ( CLEAR ?auto_845740 ) ( not ( = ?auto_845739 ?auto_845744 ) ) ( not ( = ?auto_845740 ?auto_845744 ) ) ( not ( = ?auto_845738 ?auto_845744 ) ) ( TRUCK-AT ?auto_845745 ?auto_845746 ) ( SURFACE-AT ?auto_845738 ?auto_845746 ) ( CLEAR ?auto_845738 ) ( IS-CRATE ?auto_845739 ) ( AVAILABLE ?auto_845741 ) ( IN ?auto_845739 ?auto_845745 ) ( ON ?auto_845738 ?auto_845737 ) ( not ( = ?auto_845737 ?auto_845738 ) ) ( not ( = ?auto_845737 ?auto_845739 ) ) ( not ( = ?auto_845737 ?auto_845740 ) ) ( not ( = ?auto_845737 ?auto_845744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_845738 ?auto_845739 ?auto_845740 )
      ( MAKE-3CRATE-VERIFY ?auto_845737 ?auto_845738 ?auto_845739 ?auto_845740 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_846028 - SURFACE
      ?auto_846029 - SURFACE
      ?auto_846030 - SURFACE
      ?auto_846031 - SURFACE
      ?auto_846032 - SURFACE
    )
    :vars
    (
      ?auto_846034 - HOIST
      ?auto_846033 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_846034 ?auto_846033 ) ( SURFACE-AT ?auto_846031 ?auto_846033 ) ( CLEAR ?auto_846031 ) ( LIFTING ?auto_846034 ?auto_846032 ) ( IS-CRATE ?auto_846032 ) ( not ( = ?auto_846031 ?auto_846032 ) ) ( ON ?auto_846029 ?auto_846028 ) ( ON ?auto_846030 ?auto_846029 ) ( ON ?auto_846031 ?auto_846030 ) ( not ( = ?auto_846028 ?auto_846029 ) ) ( not ( = ?auto_846028 ?auto_846030 ) ) ( not ( = ?auto_846028 ?auto_846031 ) ) ( not ( = ?auto_846028 ?auto_846032 ) ) ( not ( = ?auto_846029 ?auto_846030 ) ) ( not ( = ?auto_846029 ?auto_846031 ) ) ( not ( = ?auto_846029 ?auto_846032 ) ) ( not ( = ?auto_846030 ?auto_846031 ) ) ( not ( = ?auto_846030 ?auto_846032 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_846031 ?auto_846032 )
      ( MAKE-4CRATE-VERIFY ?auto_846028 ?auto_846029 ?auto_846030 ?auto_846031 ?auto_846032 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_846053 - SURFACE
      ?auto_846054 - SURFACE
      ?auto_846055 - SURFACE
      ?auto_846056 - SURFACE
      ?auto_846057 - SURFACE
    )
    :vars
    (
      ?auto_846060 - HOIST
      ?auto_846059 - PLACE
      ?auto_846058 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_846060 ?auto_846059 ) ( SURFACE-AT ?auto_846056 ?auto_846059 ) ( CLEAR ?auto_846056 ) ( IS-CRATE ?auto_846057 ) ( not ( = ?auto_846056 ?auto_846057 ) ) ( TRUCK-AT ?auto_846058 ?auto_846059 ) ( AVAILABLE ?auto_846060 ) ( IN ?auto_846057 ?auto_846058 ) ( ON ?auto_846056 ?auto_846055 ) ( not ( = ?auto_846055 ?auto_846056 ) ) ( not ( = ?auto_846055 ?auto_846057 ) ) ( ON ?auto_846054 ?auto_846053 ) ( ON ?auto_846055 ?auto_846054 ) ( not ( = ?auto_846053 ?auto_846054 ) ) ( not ( = ?auto_846053 ?auto_846055 ) ) ( not ( = ?auto_846053 ?auto_846056 ) ) ( not ( = ?auto_846053 ?auto_846057 ) ) ( not ( = ?auto_846054 ?auto_846055 ) ) ( not ( = ?auto_846054 ?auto_846056 ) ) ( not ( = ?auto_846054 ?auto_846057 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846055 ?auto_846056 ?auto_846057 )
      ( MAKE-4CRATE-VERIFY ?auto_846053 ?auto_846054 ?auto_846055 ?auto_846056 ?auto_846057 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_846083 - SURFACE
      ?auto_846084 - SURFACE
      ?auto_846085 - SURFACE
      ?auto_846086 - SURFACE
      ?auto_846087 - SURFACE
    )
    :vars
    (
      ?auto_846088 - HOIST
      ?auto_846089 - PLACE
      ?auto_846091 - TRUCK
      ?auto_846090 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_846088 ?auto_846089 ) ( SURFACE-AT ?auto_846086 ?auto_846089 ) ( CLEAR ?auto_846086 ) ( IS-CRATE ?auto_846087 ) ( not ( = ?auto_846086 ?auto_846087 ) ) ( AVAILABLE ?auto_846088 ) ( IN ?auto_846087 ?auto_846091 ) ( ON ?auto_846086 ?auto_846085 ) ( not ( = ?auto_846085 ?auto_846086 ) ) ( not ( = ?auto_846085 ?auto_846087 ) ) ( TRUCK-AT ?auto_846091 ?auto_846090 ) ( not ( = ?auto_846090 ?auto_846089 ) ) ( ON ?auto_846084 ?auto_846083 ) ( ON ?auto_846085 ?auto_846084 ) ( not ( = ?auto_846083 ?auto_846084 ) ) ( not ( = ?auto_846083 ?auto_846085 ) ) ( not ( = ?auto_846083 ?auto_846086 ) ) ( not ( = ?auto_846083 ?auto_846087 ) ) ( not ( = ?auto_846084 ?auto_846085 ) ) ( not ( = ?auto_846084 ?auto_846086 ) ) ( not ( = ?auto_846084 ?auto_846087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846085 ?auto_846086 ?auto_846087 )
      ( MAKE-4CRATE-VERIFY ?auto_846083 ?auto_846084 ?auto_846085 ?auto_846086 ?auto_846087 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_846117 - SURFACE
      ?auto_846118 - SURFACE
      ?auto_846119 - SURFACE
      ?auto_846120 - SURFACE
      ?auto_846121 - SURFACE
    )
    :vars
    (
      ?auto_846123 - HOIST
      ?auto_846125 - PLACE
      ?auto_846122 - TRUCK
      ?auto_846124 - PLACE
      ?auto_846126 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_846123 ?auto_846125 ) ( SURFACE-AT ?auto_846120 ?auto_846125 ) ( CLEAR ?auto_846120 ) ( IS-CRATE ?auto_846121 ) ( not ( = ?auto_846120 ?auto_846121 ) ) ( AVAILABLE ?auto_846123 ) ( ON ?auto_846120 ?auto_846119 ) ( not ( = ?auto_846119 ?auto_846120 ) ) ( not ( = ?auto_846119 ?auto_846121 ) ) ( TRUCK-AT ?auto_846122 ?auto_846124 ) ( not ( = ?auto_846124 ?auto_846125 ) ) ( HOIST-AT ?auto_846126 ?auto_846124 ) ( LIFTING ?auto_846126 ?auto_846121 ) ( not ( = ?auto_846123 ?auto_846126 ) ) ( ON ?auto_846118 ?auto_846117 ) ( ON ?auto_846119 ?auto_846118 ) ( not ( = ?auto_846117 ?auto_846118 ) ) ( not ( = ?auto_846117 ?auto_846119 ) ) ( not ( = ?auto_846117 ?auto_846120 ) ) ( not ( = ?auto_846117 ?auto_846121 ) ) ( not ( = ?auto_846118 ?auto_846119 ) ) ( not ( = ?auto_846118 ?auto_846120 ) ) ( not ( = ?auto_846118 ?auto_846121 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846119 ?auto_846120 ?auto_846121 )
      ( MAKE-4CRATE-VERIFY ?auto_846117 ?auto_846118 ?auto_846119 ?auto_846120 ?auto_846121 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_846155 - SURFACE
      ?auto_846156 - SURFACE
      ?auto_846157 - SURFACE
      ?auto_846158 - SURFACE
      ?auto_846159 - SURFACE
    )
    :vars
    (
      ?auto_846161 - HOIST
      ?auto_846163 - PLACE
      ?auto_846165 - TRUCK
      ?auto_846162 - PLACE
      ?auto_846160 - HOIST
      ?auto_846164 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_846161 ?auto_846163 ) ( SURFACE-AT ?auto_846158 ?auto_846163 ) ( CLEAR ?auto_846158 ) ( IS-CRATE ?auto_846159 ) ( not ( = ?auto_846158 ?auto_846159 ) ) ( AVAILABLE ?auto_846161 ) ( ON ?auto_846158 ?auto_846157 ) ( not ( = ?auto_846157 ?auto_846158 ) ) ( not ( = ?auto_846157 ?auto_846159 ) ) ( TRUCK-AT ?auto_846165 ?auto_846162 ) ( not ( = ?auto_846162 ?auto_846163 ) ) ( HOIST-AT ?auto_846160 ?auto_846162 ) ( not ( = ?auto_846161 ?auto_846160 ) ) ( AVAILABLE ?auto_846160 ) ( SURFACE-AT ?auto_846159 ?auto_846162 ) ( ON ?auto_846159 ?auto_846164 ) ( CLEAR ?auto_846159 ) ( not ( = ?auto_846158 ?auto_846164 ) ) ( not ( = ?auto_846159 ?auto_846164 ) ) ( not ( = ?auto_846157 ?auto_846164 ) ) ( ON ?auto_846156 ?auto_846155 ) ( ON ?auto_846157 ?auto_846156 ) ( not ( = ?auto_846155 ?auto_846156 ) ) ( not ( = ?auto_846155 ?auto_846157 ) ) ( not ( = ?auto_846155 ?auto_846158 ) ) ( not ( = ?auto_846155 ?auto_846159 ) ) ( not ( = ?auto_846155 ?auto_846164 ) ) ( not ( = ?auto_846156 ?auto_846157 ) ) ( not ( = ?auto_846156 ?auto_846158 ) ) ( not ( = ?auto_846156 ?auto_846159 ) ) ( not ( = ?auto_846156 ?auto_846164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846157 ?auto_846158 ?auto_846159 )
      ( MAKE-4CRATE-VERIFY ?auto_846155 ?auto_846156 ?auto_846157 ?auto_846158 ?auto_846159 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_846194 - SURFACE
      ?auto_846195 - SURFACE
      ?auto_846196 - SURFACE
      ?auto_846197 - SURFACE
      ?auto_846198 - SURFACE
    )
    :vars
    (
      ?auto_846204 - HOIST
      ?auto_846200 - PLACE
      ?auto_846201 - PLACE
      ?auto_846203 - HOIST
      ?auto_846199 - SURFACE
      ?auto_846202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_846204 ?auto_846200 ) ( SURFACE-AT ?auto_846197 ?auto_846200 ) ( CLEAR ?auto_846197 ) ( IS-CRATE ?auto_846198 ) ( not ( = ?auto_846197 ?auto_846198 ) ) ( AVAILABLE ?auto_846204 ) ( ON ?auto_846197 ?auto_846196 ) ( not ( = ?auto_846196 ?auto_846197 ) ) ( not ( = ?auto_846196 ?auto_846198 ) ) ( not ( = ?auto_846201 ?auto_846200 ) ) ( HOIST-AT ?auto_846203 ?auto_846201 ) ( not ( = ?auto_846204 ?auto_846203 ) ) ( AVAILABLE ?auto_846203 ) ( SURFACE-AT ?auto_846198 ?auto_846201 ) ( ON ?auto_846198 ?auto_846199 ) ( CLEAR ?auto_846198 ) ( not ( = ?auto_846197 ?auto_846199 ) ) ( not ( = ?auto_846198 ?auto_846199 ) ) ( not ( = ?auto_846196 ?auto_846199 ) ) ( TRUCK-AT ?auto_846202 ?auto_846200 ) ( ON ?auto_846195 ?auto_846194 ) ( ON ?auto_846196 ?auto_846195 ) ( not ( = ?auto_846194 ?auto_846195 ) ) ( not ( = ?auto_846194 ?auto_846196 ) ) ( not ( = ?auto_846194 ?auto_846197 ) ) ( not ( = ?auto_846194 ?auto_846198 ) ) ( not ( = ?auto_846194 ?auto_846199 ) ) ( not ( = ?auto_846195 ?auto_846196 ) ) ( not ( = ?auto_846195 ?auto_846197 ) ) ( not ( = ?auto_846195 ?auto_846198 ) ) ( not ( = ?auto_846195 ?auto_846199 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846196 ?auto_846197 ?auto_846198 )
      ( MAKE-4CRATE-VERIFY ?auto_846194 ?auto_846195 ?auto_846196 ?auto_846197 ?auto_846198 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_846233 - SURFACE
      ?auto_846234 - SURFACE
      ?auto_846235 - SURFACE
      ?auto_846236 - SURFACE
      ?auto_846237 - SURFACE
    )
    :vars
    (
      ?auto_846240 - HOIST
      ?auto_846241 - PLACE
      ?auto_846243 - PLACE
      ?auto_846242 - HOIST
      ?auto_846238 - SURFACE
      ?auto_846239 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_846240 ?auto_846241 ) ( IS-CRATE ?auto_846237 ) ( not ( = ?auto_846236 ?auto_846237 ) ) ( not ( = ?auto_846235 ?auto_846236 ) ) ( not ( = ?auto_846235 ?auto_846237 ) ) ( not ( = ?auto_846243 ?auto_846241 ) ) ( HOIST-AT ?auto_846242 ?auto_846243 ) ( not ( = ?auto_846240 ?auto_846242 ) ) ( AVAILABLE ?auto_846242 ) ( SURFACE-AT ?auto_846237 ?auto_846243 ) ( ON ?auto_846237 ?auto_846238 ) ( CLEAR ?auto_846237 ) ( not ( = ?auto_846236 ?auto_846238 ) ) ( not ( = ?auto_846237 ?auto_846238 ) ) ( not ( = ?auto_846235 ?auto_846238 ) ) ( TRUCK-AT ?auto_846239 ?auto_846241 ) ( SURFACE-AT ?auto_846235 ?auto_846241 ) ( CLEAR ?auto_846235 ) ( LIFTING ?auto_846240 ?auto_846236 ) ( IS-CRATE ?auto_846236 ) ( ON ?auto_846234 ?auto_846233 ) ( ON ?auto_846235 ?auto_846234 ) ( not ( = ?auto_846233 ?auto_846234 ) ) ( not ( = ?auto_846233 ?auto_846235 ) ) ( not ( = ?auto_846233 ?auto_846236 ) ) ( not ( = ?auto_846233 ?auto_846237 ) ) ( not ( = ?auto_846233 ?auto_846238 ) ) ( not ( = ?auto_846234 ?auto_846235 ) ) ( not ( = ?auto_846234 ?auto_846236 ) ) ( not ( = ?auto_846234 ?auto_846237 ) ) ( not ( = ?auto_846234 ?auto_846238 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846235 ?auto_846236 ?auto_846237 )
      ( MAKE-4CRATE-VERIFY ?auto_846233 ?auto_846234 ?auto_846235 ?auto_846236 ?auto_846237 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_846272 - SURFACE
      ?auto_846273 - SURFACE
      ?auto_846274 - SURFACE
      ?auto_846275 - SURFACE
      ?auto_846276 - SURFACE
    )
    :vars
    (
      ?auto_846277 - HOIST
      ?auto_846281 - PLACE
      ?auto_846282 - PLACE
      ?auto_846278 - HOIST
      ?auto_846280 - SURFACE
      ?auto_846279 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_846277 ?auto_846281 ) ( IS-CRATE ?auto_846276 ) ( not ( = ?auto_846275 ?auto_846276 ) ) ( not ( = ?auto_846274 ?auto_846275 ) ) ( not ( = ?auto_846274 ?auto_846276 ) ) ( not ( = ?auto_846282 ?auto_846281 ) ) ( HOIST-AT ?auto_846278 ?auto_846282 ) ( not ( = ?auto_846277 ?auto_846278 ) ) ( AVAILABLE ?auto_846278 ) ( SURFACE-AT ?auto_846276 ?auto_846282 ) ( ON ?auto_846276 ?auto_846280 ) ( CLEAR ?auto_846276 ) ( not ( = ?auto_846275 ?auto_846280 ) ) ( not ( = ?auto_846276 ?auto_846280 ) ) ( not ( = ?auto_846274 ?auto_846280 ) ) ( TRUCK-AT ?auto_846279 ?auto_846281 ) ( SURFACE-AT ?auto_846274 ?auto_846281 ) ( CLEAR ?auto_846274 ) ( IS-CRATE ?auto_846275 ) ( AVAILABLE ?auto_846277 ) ( IN ?auto_846275 ?auto_846279 ) ( ON ?auto_846273 ?auto_846272 ) ( ON ?auto_846274 ?auto_846273 ) ( not ( = ?auto_846272 ?auto_846273 ) ) ( not ( = ?auto_846272 ?auto_846274 ) ) ( not ( = ?auto_846272 ?auto_846275 ) ) ( not ( = ?auto_846272 ?auto_846276 ) ) ( not ( = ?auto_846272 ?auto_846280 ) ) ( not ( = ?auto_846273 ?auto_846274 ) ) ( not ( = ?auto_846273 ?auto_846275 ) ) ( not ( = ?auto_846273 ?auto_846276 ) ) ( not ( = ?auto_846273 ?auto_846280 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846274 ?auto_846275 ?auto_846276 )
      ( MAKE-4CRATE-VERIFY ?auto_846272 ?auto_846273 ?auto_846274 ?auto_846275 ?auto_846276 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_846932 - SURFACE
      ?auto_846933 - SURFACE
      ?auto_846934 - SURFACE
      ?auto_846935 - SURFACE
      ?auto_846936 - SURFACE
      ?auto_846937 - SURFACE
    )
    :vars
    (
      ?auto_846938 - HOIST
      ?auto_846939 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_846938 ?auto_846939 ) ( SURFACE-AT ?auto_846936 ?auto_846939 ) ( CLEAR ?auto_846936 ) ( LIFTING ?auto_846938 ?auto_846937 ) ( IS-CRATE ?auto_846937 ) ( not ( = ?auto_846936 ?auto_846937 ) ) ( ON ?auto_846933 ?auto_846932 ) ( ON ?auto_846934 ?auto_846933 ) ( ON ?auto_846935 ?auto_846934 ) ( ON ?auto_846936 ?auto_846935 ) ( not ( = ?auto_846932 ?auto_846933 ) ) ( not ( = ?auto_846932 ?auto_846934 ) ) ( not ( = ?auto_846932 ?auto_846935 ) ) ( not ( = ?auto_846932 ?auto_846936 ) ) ( not ( = ?auto_846932 ?auto_846937 ) ) ( not ( = ?auto_846933 ?auto_846934 ) ) ( not ( = ?auto_846933 ?auto_846935 ) ) ( not ( = ?auto_846933 ?auto_846936 ) ) ( not ( = ?auto_846933 ?auto_846937 ) ) ( not ( = ?auto_846934 ?auto_846935 ) ) ( not ( = ?auto_846934 ?auto_846936 ) ) ( not ( = ?auto_846934 ?auto_846937 ) ) ( not ( = ?auto_846935 ?auto_846936 ) ) ( not ( = ?auto_846935 ?auto_846937 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_846936 ?auto_846937 )
      ( MAKE-5CRATE-VERIFY ?auto_846932 ?auto_846933 ?auto_846934 ?auto_846935 ?auto_846936 ?auto_846937 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_846966 - SURFACE
      ?auto_846967 - SURFACE
      ?auto_846968 - SURFACE
      ?auto_846969 - SURFACE
      ?auto_846970 - SURFACE
      ?auto_846971 - SURFACE
    )
    :vars
    (
      ?auto_846974 - HOIST
      ?auto_846972 - PLACE
      ?auto_846973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_846974 ?auto_846972 ) ( SURFACE-AT ?auto_846970 ?auto_846972 ) ( CLEAR ?auto_846970 ) ( IS-CRATE ?auto_846971 ) ( not ( = ?auto_846970 ?auto_846971 ) ) ( TRUCK-AT ?auto_846973 ?auto_846972 ) ( AVAILABLE ?auto_846974 ) ( IN ?auto_846971 ?auto_846973 ) ( ON ?auto_846970 ?auto_846969 ) ( not ( = ?auto_846969 ?auto_846970 ) ) ( not ( = ?auto_846969 ?auto_846971 ) ) ( ON ?auto_846967 ?auto_846966 ) ( ON ?auto_846968 ?auto_846967 ) ( ON ?auto_846969 ?auto_846968 ) ( not ( = ?auto_846966 ?auto_846967 ) ) ( not ( = ?auto_846966 ?auto_846968 ) ) ( not ( = ?auto_846966 ?auto_846969 ) ) ( not ( = ?auto_846966 ?auto_846970 ) ) ( not ( = ?auto_846966 ?auto_846971 ) ) ( not ( = ?auto_846967 ?auto_846968 ) ) ( not ( = ?auto_846967 ?auto_846969 ) ) ( not ( = ?auto_846967 ?auto_846970 ) ) ( not ( = ?auto_846967 ?auto_846971 ) ) ( not ( = ?auto_846968 ?auto_846969 ) ) ( not ( = ?auto_846968 ?auto_846970 ) ) ( not ( = ?auto_846968 ?auto_846971 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_846969 ?auto_846970 ?auto_846971 )
      ( MAKE-5CRATE-VERIFY ?auto_846966 ?auto_846967 ?auto_846968 ?auto_846969 ?auto_846970 ?auto_846971 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_847006 - SURFACE
      ?auto_847007 - SURFACE
      ?auto_847008 - SURFACE
      ?auto_847009 - SURFACE
      ?auto_847010 - SURFACE
      ?auto_847011 - SURFACE
    )
    :vars
    (
      ?auto_847015 - HOIST
      ?auto_847013 - PLACE
      ?auto_847014 - TRUCK
      ?auto_847012 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_847015 ?auto_847013 ) ( SURFACE-AT ?auto_847010 ?auto_847013 ) ( CLEAR ?auto_847010 ) ( IS-CRATE ?auto_847011 ) ( not ( = ?auto_847010 ?auto_847011 ) ) ( AVAILABLE ?auto_847015 ) ( IN ?auto_847011 ?auto_847014 ) ( ON ?auto_847010 ?auto_847009 ) ( not ( = ?auto_847009 ?auto_847010 ) ) ( not ( = ?auto_847009 ?auto_847011 ) ) ( TRUCK-AT ?auto_847014 ?auto_847012 ) ( not ( = ?auto_847012 ?auto_847013 ) ) ( ON ?auto_847007 ?auto_847006 ) ( ON ?auto_847008 ?auto_847007 ) ( ON ?auto_847009 ?auto_847008 ) ( not ( = ?auto_847006 ?auto_847007 ) ) ( not ( = ?auto_847006 ?auto_847008 ) ) ( not ( = ?auto_847006 ?auto_847009 ) ) ( not ( = ?auto_847006 ?auto_847010 ) ) ( not ( = ?auto_847006 ?auto_847011 ) ) ( not ( = ?auto_847007 ?auto_847008 ) ) ( not ( = ?auto_847007 ?auto_847009 ) ) ( not ( = ?auto_847007 ?auto_847010 ) ) ( not ( = ?auto_847007 ?auto_847011 ) ) ( not ( = ?auto_847008 ?auto_847009 ) ) ( not ( = ?auto_847008 ?auto_847010 ) ) ( not ( = ?auto_847008 ?auto_847011 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847009 ?auto_847010 ?auto_847011 )
      ( MAKE-5CRATE-VERIFY ?auto_847006 ?auto_847007 ?auto_847008 ?auto_847009 ?auto_847010 ?auto_847011 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_847051 - SURFACE
      ?auto_847052 - SURFACE
      ?auto_847053 - SURFACE
      ?auto_847054 - SURFACE
      ?auto_847055 - SURFACE
      ?auto_847056 - SURFACE
    )
    :vars
    (
      ?auto_847060 - HOIST
      ?auto_847057 - PLACE
      ?auto_847059 - TRUCK
      ?auto_847058 - PLACE
      ?auto_847061 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_847060 ?auto_847057 ) ( SURFACE-AT ?auto_847055 ?auto_847057 ) ( CLEAR ?auto_847055 ) ( IS-CRATE ?auto_847056 ) ( not ( = ?auto_847055 ?auto_847056 ) ) ( AVAILABLE ?auto_847060 ) ( ON ?auto_847055 ?auto_847054 ) ( not ( = ?auto_847054 ?auto_847055 ) ) ( not ( = ?auto_847054 ?auto_847056 ) ) ( TRUCK-AT ?auto_847059 ?auto_847058 ) ( not ( = ?auto_847058 ?auto_847057 ) ) ( HOIST-AT ?auto_847061 ?auto_847058 ) ( LIFTING ?auto_847061 ?auto_847056 ) ( not ( = ?auto_847060 ?auto_847061 ) ) ( ON ?auto_847052 ?auto_847051 ) ( ON ?auto_847053 ?auto_847052 ) ( ON ?auto_847054 ?auto_847053 ) ( not ( = ?auto_847051 ?auto_847052 ) ) ( not ( = ?auto_847051 ?auto_847053 ) ) ( not ( = ?auto_847051 ?auto_847054 ) ) ( not ( = ?auto_847051 ?auto_847055 ) ) ( not ( = ?auto_847051 ?auto_847056 ) ) ( not ( = ?auto_847052 ?auto_847053 ) ) ( not ( = ?auto_847052 ?auto_847054 ) ) ( not ( = ?auto_847052 ?auto_847055 ) ) ( not ( = ?auto_847052 ?auto_847056 ) ) ( not ( = ?auto_847053 ?auto_847054 ) ) ( not ( = ?auto_847053 ?auto_847055 ) ) ( not ( = ?auto_847053 ?auto_847056 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847054 ?auto_847055 ?auto_847056 )
      ( MAKE-5CRATE-VERIFY ?auto_847051 ?auto_847052 ?auto_847053 ?auto_847054 ?auto_847055 ?auto_847056 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_847101 - SURFACE
      ?auto_847102 - SURFACE
      ?auto_847103 - SURFACE
      ?auto_847104 - SURFACE
      ?auto_847105 - SURFACE
      ?auto_847106 - SURFACE
    )
    :vars
    (
      ?auto_847109 - HOIST
      ?auto_847110 - PLACE
      ?auto_847108 - TRUCK
      ?auto_847111 - PLACE
      ?auto_847107 - HOIST
      ?auto_847112 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_847109 ?auto_847110 ) ( SURFACE-AT ?auto_847105 ?auto_847110 ) ( CLEAR ?auto_847105 ) ( IS-CRATE ?auto_847106 ) ( not ( = ?auto_847105 ?auto_847106 ) ) ( AVAILABLE ?auto_847109 ) ( ON ?auto_847105 ?auto_847104 ) ( not ( = ?auto_847104 ?auto_847105 ) ) ( not ( = ?auto_847104 ?auto_847106 ) ) ( TRUCK-AT ?auto_847108 ?auto_847111 ) ( not ( = ?auto_847111 ?auto_847110 ) ) ( HOIST-AT ?auto_847107 ?auto_847111 ) ( not ( = ?auto_847109 ?auto_847107 ) ) ( AVAILABLE ?auto_847107 ) ( SURFACE-AT ?auto_847106 ?auto_847111 ) ( ON ?auto_847106 ?auto_847112 ) ( CLEAR ?auto_847106 ) ( not ( = ?auto_847105 ?auto_847112 ) ) ( not ( = ?auto_847106 ?auto_847112 ) ) ( not ( = ?auto_847104 ?auto_847112 ) ) ( ON ?auto_847102 ?auto_847101 ) ( ON ?auto_847103 ?auto_847102 ) ( ON ?auto_847104 ?auto_847103 ) ( not ( = ?auto_847101 ?auto_847102 ) ) ( not ( = ?auto_847101 ?auto_847103 ) ) ( not ( = ?auto_847101 ?auto_847104 ) ) ( not ( = ?auto_847101 ?auto_847105 ) ) ( not ( = ?auto_847101 ?auto_847106 ) ) ( not ( = ?auto_847101 ?auto_847112 ) ) ( not ( = ?auto_847102 ?auto_847103 ) ) ( not ( = ?auto_847102 ?auto_847104 ) ) ( not ( = ?auto_847102 ?auto_847105 ) ) ( not ( = ?auto_847102 ?auto_847106 ) ) ( not ( = ?auto_847102 ?auto_847112 ) ) ( not ( = ?auto_847103 ?auto_847104 ) ) ( not ( = ?auto_847103 ?auto_847105 ) ) ( not ( = ?auto_847103 ?auto_847106 ) ) ( not ( = ?auto_847103 ?auto_847112 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847104 ?auto_847105 ?auto_847106 )
      ( MAKE-5CRATE-VERIFY ?auto_847101 ?auto_847102 ?auto_847103 ?auto_847104 ?auto_847105 ?auto_847106 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_847152 - SURFACE
      ?auto_847153 - SURFACE
      ?auto_847154 - SURFACE
      ?auto_847155 - SURFACE
      ?auto_847156 - SURFACE
      ?auto_847157 - SURFACE
    )
    :vars
    (
      ?auto_847162 - HOIST
      ?auto_847159 - PLACE
      ?auto_847160 - PLACE
      ?auto_847163 - HOIST
      ?auto_847161 - SURFACE
      ?auto_847158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847162 ?auto_847159 ) ( SURFACE-AT ?auto_847156 ?auto_847159 ) ( CLEAR ?auto_847156 ) ( IS-CRATE ?auto_847157 ) ( not ( = ?auto_847156 ?auto_847157 ) ) ( AVAILABLE ?auto_847162 ) ( ON ?auto_847156 ?auto_847155 ) ( not ( = ?auto_847155 ?auto_847156 ) ) ( not ( = ?auto_847155 ?auto_847157 ) ) ( not ( = ?auto_847160 ?auto_847159 ) ) ( HOIST-AT ?auto_847163 ?auto_847160 ) ( not ( = ?auto_847162 ?auto_847163 ) ) ( AVAILABLE ?auto_847163 ) ( SURFACE-AT ?auto_847157 ?auto_847160 ) ( ON ?auto_847157 ?auto_847161 ) ( CLEAR ?auto_847157 ) ( not ( = ?auto_847156 ?auto_847161 ) ) ( not ( = ?auto_847157 ?auto_847161 ) ) ( not ( = ?auto_847155 ?auto_847161 ) ) ( TRUCK-AT ?auto_847158 ?auto_847159 ) ( ON ?auto_847153 ?auto_847152 ) ( ON ?auto_847154 ?auto_847153 ) ( ON ?auto_847155 ?auto_847154 ) ( not ( = ?auto_847152 ?auto_847153 ) ) ( not ( = ?auto_847152 ?auto_847154 ) ) ( not ( = ?auto_847152 ?auto_847155 ) ) ( not ( = ?auto_847152 ?auto_847156 ) ) ( not ( = ?auto_847152 ?auto_847157 ) ) ( not ( = ?auto_847152 ?auto_847161 ) ) ( not ( = ?auto_847153 ?auto_847154 ) ) ( not ( = ?auto_847153 ?auto_847155 ) ) ( not ( = ?auto_847153 ?auto_847156 ) ) ( not ( = ?auto_847153 ?auto_847157 ) ) ( not ( = ?auto_847153 ?auto_847161 ) ) ( not ( = ?auto_847154 ?auto_847155 ) ) ( not ( = ?auto_847154 ?auto_847156 ) ) ( not ( = ?auto_847154 ?auto_847157 ) ) ( not ( = ?auto_847154 ?auto_847161 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847155 ?auto_847156 ?auto_847157 )
      ( MAKE-5CRATE-VERIFY ?auto_847152 ?auto_847153 ?auto_847154 ?auto_847155 ?auto_847156 ?auto_847157 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_847203 - SURFACE
      ?auto_847204 - SURFACE
      ?auto_847205 - SURFACE
      ?auto_847206 - SURFACE
      ?auto_847207 - SURFACE
      ?auto_847208 - SURFACE
    )
    :vars
    (
      ?auto_847211 - HOIST
      ?auto_847209 - PLACE
      ?auto_847212 - PLACE
      ?auto_847210 - HOIST
      ?auto_847214 - SURFACE
      ?auto_847213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847211 ?auto_847209 ) ( IS-CRATE ?auto_847208 ) ( not ( = ?auto_847207 ?auto_847208 ) ) ( not ( = ?auto_847206 ?auto_847207 ) ) ( not ( = ?auto_847206 ?auto_847208 ) ) ( not ( = ?auto_847212 ?auto_847209 ) ) ( HOIST-AT ?auto_847210 ?auto_847212 ) ( not ( = ?auto_847211 ?auto_847210 ) ) ( AVAILABLE ?auto_847210 ) ( SURFACE-AT ?auto_847208 ?auto_847212 ) ( ON ?auto_847208 ?auto_847214 ) ( CLEAR ?auto_847208 ) ( not ( = ?auto_847207 ?auto_847214 ) ) ( not ( = ?auto_847208 ?auto_847214 ) ) ( not ( = ?auto_847206 ?auto_847214 ) ) ( TRUCK-AT ?auto_847213 ?auto_847209 ) ( SURFACE-AT ?auto_847206 ?auto_847209 ) ( CLEAR ?auto_847206 ) ( LIFTING ?auto_847211 ?auto_847207 ) ( IS-CRATE ?auto_847207 ) ( ON ?auto_847204 ?auto_847203 ) ( ON ?auto_847205 ?auto_847204 ) ( ON ?auto_847206 ?auto_847205 ) ( not ( = ?auto_847203 ?auto_847204 ) ) ( not ( = ?auto_847203 ?auto_847205 ) ) ( not ( = ?auto_847203 ?auto_847206 ) ) ( not ( = ?auto_847203 ?auto_847207 ) ) ( not ( = ?auto_847203 ?auto_847208 ) ) ( not ( = ?auto_847203 ?auto_847214 ) ) ( not ( = ?auto_847204 ?auto_847205 ) ) ( not ( = ?auto_847204 ?auto_847206 ) ) ( not ( = ?auto_847204 ?auto_847207 ) ) ( not ( = ?auto_847204 ?auto_847208 ) ) ( not ( = ?auto_847204 ?auto_847214 ) ) ( not ( = ?auto_847205 ?auto_847206 ) ) ( not ( = ?auto_847205 ?auto_847207 ) ) ( not ( = ?auto_847205 ?auto_847208 ) ) ( not ( = ?auto_847205 ?auto_847214 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847206 ?auto_847207 ?auto_847208 )
      ( MAKE-5CRATE-VERIFY ?auto_847203 ?auto_847204 ?auto_847205 ?auto_847206 ?auto_847207 ?auto_847208 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_847254 - SURFACE
      ?auto_847255 - SURFACE
      ?auto_847256 - SURFACE
      ?auto_847257 - SURFACE
      ?auto_847258 - SURFACE
      ?auto_847259 - SURFACE
    )
    :vars
    (
      ?auto_847260 - HOIST
      ?auto_847261 - PLACE
      ?auto_847264 - PLACE
      ?auto_847262 - HOIST
      ?auto_847263 - SURFACE
      ?auto_847265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847260 ?auto_847261 ) ( IS-CRATE ?auto_847259 ) ( not ( = ?auto_847258 ?auto_847259 ) ) ( not ( = ?auto_847257 ?auto_847258 ) ) ( not ( = ?auto_847257 ?auto_847259 ) ) ( not ( = ?auto_847264 ?auto_847261 ) ) ( HOIST-AT ?auto_847262 ?auto_847264 ) ( not ( = ?auto_847260 ?auto_847262 ) ) ( AVAILABLE ?auto_847262 ) ( SURFACE-AT ?auto_847259 ?auto_847264 ) ( ON ?auto_847259 ?auto_847263 ) ( CLEAR ?auto_847259 ) ( not ( = ?auto_847258 ?auto_847263 ) ) ( not ( = ?auto_847259 ?auto_847263 ) ) ( not ( = ?auto_847257 ?auto_847263 ) ) ( TRUCK-AT ?auto_847265 ?auto_847261 ) ( SURFACE-AT ?auto_847257 ?auto_847261 ) ( CLEAR ?auto_847257 ) ( IS-CRATE ?auto_847258 ) ( AVAILABLE ?auto_847260 ) ( IN ?auto_847258 ?auto_847265 ) ( ON ?auto_847255 ?auto_847254 ) ( ON ?auto_847256 ?auto_847255 ) ( ON ?auto_847257 ?auto_847256 ) ( not ( = ?auto_847254 ?auto_847255 ) ) ( not ( = ?auto_847254 ?auto_847256 ) ) ( not ( = ?auto_847254 ?auto_847257 ) ) ( not ( = ?auto_847254 ?auto_847258 ) ) ( not ( = ?auto_847254 ?auto_847259 ) ) ( not ( = ?auto_847254 ?auto_847263 ) ) ( not ( = ?auto_847255 ?auto_847256 ) ) ( not ( = ?auto_847255 ?auto_847257 ) ) ( not ( = ?auto_847255 ?auto_847258 ) ) ( not ( = ?auto_847255 ?auto_847259 ) ) ( not ( = ?auto_847255 ?auto_847263 ) ) ( not ( = ?auto_847256 ?auto_847257 ) ) ( not ( = ?auto_847256 ?auto_847258 ) ) ( not ( = ?auto_847256 ?auto_847259 ) ) ( not ( = ?auto_847256 ?auto_847263 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847257 ?auto_847258 ?auto_847259 )
      ( MAKE-5CRATE-VERIFY ?auto_847254 ?auto_847255 ?auto_847256 ?auto_847257 ?auto_847258 ?auto_847259 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_847266 - SURFACE
      ?auto_847267 - SURFACE
    )
    :vars
    (
      ?auto_847268 - HOIST
      ?auto_847270 - PLACE
      ?auto_847269 - SURFACE
      ?auto_847273 - PLACE
      ?auto_847271 - HOIST
      ?auto_847272 - SURFACE
      ?auto_847274 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847268 ?auto_847270 ) ( IS-CRATE ?auto_847267 ) ( not ( = ?auto_847266 ?auto_847267 ) ) ( not ( = ?auto_847269 ?auto_847266 ) ) ( not ( = ?auto_847269 ?auto_847267 ) ) ( not ( = ?auto_847273 ?auto_847270 ) ) ( HOIST-AT ?auto_847271 ?auto_847273 ) ( not ( = ?auto_847268 ?auto_847271 ) ) ( AVAILABLE ?auto_847271 ) ( SURFACE-AT ?auto_847267 ?auto_847273 ) ( ON ?auto_847267 ?auto_847272 ) ( CLEAR ?auto_847267 ) ( not ( = ?auto_847266 ?auto_847272 ) ) ( not ( = ?auto_847267 ?auto_847272 ) ) ( not ( = ?auto_847269 ?auto_847272 ) ) ( SURFACE-AT ?auto_847269 ?auto_847270 ) ( CLEAR ?auto_847269 ) ( IS-CRATE ?auto_847266 ) ( AVAILABLE ?auto_847268 ) ( IN ?auto_847266 ?auto_847274 ) ( TRUCK-AT ?auto_847274 ?auto_847273 ) )
    :subtasks
    ( ( !DRIVE ?auto_847274 ?auto_847273 ?auto_847270 )
      ( MAKE-2CRATE ?auto_847269 ?auto_847266 ?auto_847267 )
      ( MAKE-1CRATE-VERIFY ?auto_847266 ?auto_847267 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_847275 - SURFACE
      ?auto_847276 - SURFACE
      ?auto_847277 - SURFACE
    )
    :vars
    (
      ?auto_847278 - HOIST
      ?auto_847281 - PLACE
      ?auto_847279 - PLACE
      ?auto_847283 - HOIST
      ?auto_847280 - SURFACE
      ?auto_847282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847278 ?auto_847281 ) ( IS-CRATE ?auto_847277 ) ( not ( = ?auto_847276 ?auto_847277 ) ) ( not ( = ?auto_847275 ?auto_847276 ) ) ( not ( = ?auto_847275 ?auto_847277 ) ) ( not ( = ?auto_847279 ?auto_847281 ) ) ( HOIST-AT ?auto_847283 ?auto_847279 ) ( not ( = ?auto_847278 ?auto_847283 ) ) ( AVAILABLE ?auto_847283 ) ( SURFACE-AT ?auto_847277 ?auto_847279 ) ( ON ?auto_847277 ?auto_847280 ) ( CLEAR ?auto_847277 ) ( not ( = ?auto_847276 ?auto_847280 ) ) ( not ( = ?auto_847277 ?auto_847280 ) ) ( not ( = ?auto_847275 ?auto_847280 ) ) ( SURFACE-AT ?auto_847275 ?auto_847281 ) ( CLEAR ?auto_847275 ) ( IS-CRATE ?auto_847276 ) ( AVAILABLE ?auto_847278 ) ( IN ?auto_847276 ?auto_847282 ) ( TRUCK-AT ?auto_847282 ?auto_847279 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_847276 ?auto_847277 )
      ( MAKE-2CRATE-VERIFY ?auto_847275 ?auto_847276 ?auto_847277 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_847284 - SURFACE
      ?auto_847285 - SURFACE
      ?auto_847286 - SURFACE
      ?auto_847287 - SURFACE
    )
    :vars
    (
      ?auto_847293 - HOIST
      ?auto_847291 - PLACE
      ?auto_847292 - PLACE
      ?auto_847288 - HOIST
      ?auto_847289 - SURFACE
      ?auto_847290 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847293 ?auto_847291 ) ( IS-CRATE ?auto_847287 ) ( not ( = ?auto_847286 ?auto_847287 ) ) ( not ( = ?auto_847285 ?auto_847286 ) ) ( not ( = ?auto_847285 ?auto_847287 ) ) ( not ( = ?auto_847292 ?auto_847291 ) ) ( HOIST-AT ?auto_847288 ?auto_847292 ) ( not ( = ?auto_847293 ?auto_847288 ) ) ( AVAILABLE ?auto_847288 ) ( SURFACE-AT ?auto_847287 ?auto_847292 ) ( ON ?auto_847287 ?auto_847289 ) ( CLEAR ?auto_847287 ) ( not ( = ?auto_847286 ?auto_847289 ) ) ( not ( = ?auto_847287 ?auto_847289 ) ) ( not ( = ?auto_847285 ?auto_847289 ) ) ( SURFACE-AT ?auto_847285 ?auto_847291 ) ( CLEAR ?auto_847285 ) ( IS-CRATE ?auto_847286 ) ( AVAILABLE ?auto_847293 ) ( IN ?auto_847286 ?auto_847290 ) ( TRUCK-AT ?auto_847290 ?auto_847292 ) ( ON ?auto_847285 ?auto_847284 ) ( not ( = ?auto_847284 ?auto_847285 ) ) ( not ( = ?auto_847284 ?auto_847286 ) ) ( not ( = ?auto_847284 ?auto_847287 ) ) ( not ( = ?auto_847284 ?auto_847289 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847285 ?auto_847286 ?auto_847287 )
      ( MAKE-3CRATE-VERIFY ?auto_847284 ?auto_847285 ?auto_847286 ?auto_847287 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_847294 - SURFACE
      ?auto_847295 - SURFACE
      ?auto_847296 - SURFACE
      ?auto_847297 - SURFACE
      ?auto_847298 - SURFACE
    )
    :vars
    (
      ?auto_847304 - HOIST
      ?auto_847302 - PLACE
      ?auto_847303 - PLACE
      ?auto_847299 - HOIST
      ?auto_847300 - SURFACE
      ?auto_847301 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847304 ?auto_847302 ) ( IS-CRATE ?auto_847298 ) ( not ( = ?auto_847297 ?auto_847298 ) ) ( not ( = ?auto_847296 ?auto_847297 ) ) ( not ( = ?auto_847296 ?auto_847298 ) ) ( not ( = ?auto_847303 ?auto_847302 ) ) ( HOIST-AT ?auto_847299 ?auto_847303 ) ( not ( = ?auto_847304 ?auto_847299 ) ) ( AVAILABLE ?auto_847299 ) ( SURFACE-AT ?auto_847298 ?auto_847303 ) ( ON ?auto_847298 ?auto_847300 ) ( CLEAR ?auto_847298 ) ( not ( = ?auto_847297 ?auto_847300 ) ) ( not ( = ?auto_847298 ?auto_847300 ) ) ( not ( = ?auto_847296 ?auto_847300 ) ) ( SURFACE-AT ?auto_847296 ?auto_847302 ) ( CLEAR ?auto_847296 ) ( IS-CRATE ?auto_847297 ) ( AVAILABLE ?auto_847304 ) ( IN ?auto_847297 ?auto_847301 ) ( TRUCK-AT ?auto_847301 ?auto_847303 ) ( ON ?auto_847295 ?auto_847294 ) ( ON ?auto_847296 ?auto_847295 ) ( not ( = ?auto_847294 ?auto_847295 ) ) ( not ( = ?auto_847294 ?auto_847296 ) ) ( not ( = ?auto_847294 ?auto_847297 ) ) ( not ( = ?auto_847294 ?auto_847298 ) ) ( not ( = ?auto_847294 ?auto_847300 ) ) ( not ( = ?auto_847295 ?auto_847296 ) ) ( not ( = ?auto_847295 ?auto_847297 ) ) ( not ( = ?auto_847295 ?auto_847298 ) ) ( not ( = ?auto_847295 ?auto_847300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847296 ?auto_847297 ?auto_847298 )
      ( MAKE-4CRATE-VERIFY ?auto_847294 ?auto_847295 ?auto_847296 ?auto_847297 ?auto_847298 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_847305 - SURFACE
      ?auto_847306 - SURFACE
      ?auto_847307 - SURFACE
      ?auto_847308 - SURFACE
      ?auto_847309 - SURFACE
      ?auto_847310 - SURFACE
    )
    :vars
    (
      ?auto_847316 - HOIST
      ?auto_847314 - PLACE
      ?auto_847315 - PLACE
      ?auto_847311 - HOIST
      ?auto_847312 - SURFACE
      ?auto_847313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847316 ?auto_847314 ) ( IS-CRATE ?auto_847310 ) ( not ( = ?auto_847309 ?auto_847310 ) ) ( not ( = ?auto_847308 ?auto_847309 ) ) ( not ( = ?auto_847308 ?auto_847310 ) ) ( not ( = ?auto_847315 ?auto_847314 ) ) ( HOIST-AT ?auto_847311 ?auto_847315 ) ( not ( = ?auto_847316 ?auto_847311 ) ) ( AVAILABLE ?auto_847311 ) ( SURFACE-AT ?auto_847310 ?auto_847315 ) ( ON ?auto_847310 ?auto_847312 ) ( CLEAR ?auto_847310 ) ( not ( = ?auto_847309 ?auto_847312 ) ) ( not ( = ?auto_847310 ?auto_847312 ) ) ( not ( = ?auto_847308 ?auto_847312 ) ) ( SURFACE-AT ?auto_847308 ?auto_847314 ) ( CLEAR ?auto_847308 ) ( IS-CRATE ?auto_847309 ) ( AVAILABLE ?auto_847316 ) ( IN ?auto_847309 ?auto_847313 ) ( TRUCK-AT ?auto_847313 ?auto_847315 ) ( ON ?auto_847306 ?auto_847305 ) ( ON ?auto_847307 ?auto_847306 ) ( ON ?auto_847308 ?auto_847307 ) ( not ( = ?auto_847305 ?auto_847306 ) ) ( not ( = ?auto_847305 ?auto_847307 ) ) ( not ( = ?auto_847305 ?auto_847308 ) ) ( not ( = ?auto_847305 ?auto_847309 ) ) ( not ( = ?auto_847305 ?auto_847310 ) ) ( not ( = ?auto_847305 ?auto_847312 ) ) ( not ( = ?auto_847306 ?auto_847307 ) ) ( not ( = ?auto_847306 ?auto_847308 ) ) ( not ( = ?auto_847306 ?auto_847309 ) ) ( not ( = ?auto_847306 ?auto_847310 ) ) ( not ( = ?auto_847306 ?auto_847312 ) ) ( not ( = ?auto_847307 ?auto_847308 ) ) ( not ( = ?auto_847307 ?auto_847309 ) ) ( not ( = ?auto_847307 ?auto_847310 ) ) ( not ( = ?auto_847307 ?auto_847312 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847308 ?auto_847309 ?auto_847310 )
      ( MAKE-5CRATE-VERIFY ?auto_847305 ?auto_847306 ?auto_847307 ?auto_847308 ?auto_847309 ?auto_847310 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_847317 - SURFACE
      ?auto_847318 - SURFACE
    )
    :vars
    (
      ?auto_847325 - HOIST
      ?auto_847323 - PLACE
      ?auto_847319 - SURFACE
      ?auto_847324 - PLACE
      ?auto_847320 - HOIST
      ?auto_847321 - SURFACE
      ?auto_847322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847325 ?auto_847323 ) ( IS-CRATE ?auto_847318 ) ( not ( = ?auto_847317 ?auto_847318 ) ) ( not ( = ?auto_847319 ?auto_847317 ) ) ( not ( = ?auto_847319 ?auto_847318 ) ) ( not ( = ?auto_847324 ?auto_847323 ) ) ( HOIST-AT ?auto_847320 ?auto_847324 ) ( not ( = ?auto_847325 ?auto_847320 ) ) ( SURFACE-AT ?auto_847318 ?auto_847324 ) ( ON ?auto_847318 ?auto_847321 ) ( CLEAR ?auto_847318 ) ( not ( = ?auto_847317 ?auto_847321 ) ) ( not ( = ?auto_847318 ?auto_847321 ) ) ( not ( = ?auto_847319 ?auto_847321 ) ) ( SURFACE-AT ?auto_847319 ?auto_847323 ) ( CLEAR ?auto_847319 ) ( IS-CRATE ?auto_847317 ) ( AVAILABLE ?auto_847325 ) ( TRUCK-AT ?auto_847322 ?auto_847324 ) ( LIFTING ?auto_847320 ?auto_847317 ) )
    :subtasks
    ( ( !LOAD ?auto_847320 ?auto_847317 ?auto_847322 ?auto_847324 )
      ( MAKE-2CRATE ?auto_847319 ?auto_847317 ?auto_847318 )
      ( MAKE-1CRATE-VERIFY ?auto_847317 ?auto_847318 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_847326 - SURFACE
      ?auto_847327 - SURFACE
      ?auto_847328 - SURFACE
    )
    :vars
    (
      ?auto_847334 - HOIST
      ?auto_847329 - PLACE
      ?auto_847333 - PLACE
      ?auto_847330 - HOIST
      ?auto_847331 - SURFACE
      ?auto_847332 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847334 ?auto_847329 ) ( IS-CRATE ?auto_847328 ) ( not ( = ?auto_847327 ?auto_847328 ) ) ( not ( = ?auto_847326 ?auto_847327 ) ) ( not ( = ?auto_847326 ?auto_847328 ) ) ( not ( = ?auto_847333 ?auto_847329 ) ) ( HOIST-AT ?auto_847330 ?auto_847333 ) ( not ( = ?auto_847334 ?auto_847330 ) ) ( SURFACE-AT ?auto_847328 ?auto_847333 ) ( ON ?auto_847328 ?auto_847331 ) ( CLEAR ?auto_847328 ) ( not ( = ?auto_847327 ?auto_847331 ) ) ( not ( = ?auto_847328 ?auto_847331 ) ) ( not ( = ?auto_847326 ?auto_847331 ) ) ( SURFACE-AT ?auto_847326 ?auto_847329 ) ( CLEAR ?auto_847326 ) ( IS-CRATE ?auto_847327 ) ( AVAILABLE ?auto_847334 ) ( TRUCK-AT ?auto_847332 ?auto_847333 ) ( LIFTING ?auto_847330 ?auto_847327 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_847327 ?auto_847328 )
      ( MAKE-2CRATE-VERIFY ?auto_847326 ?auto_847327 ?auto_847328 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_847335 - SURFACE
      ?auto_847336 - SURFACE
      ?auto_847337 - SURFACE
      ?auto_847338 - SURFACE
    )
    :vars
    (
      ?auto_847340 - HOIST
      ?auto_847341 - PLACE
      ?auto_847339 - PLACE
      ?auto_847344 - HOIST
      ?auto_847342 - SURFACE
      ?auto_847343 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847340 ?auto_847341 ) ( IS-CRATE ?auto_847338 ) ( not ( = ?auto_847337 ?auto_847338 ) ) ( not ( = ?auto_847336 ?auto_847337 ) ) ( not ( = ?auto_847336 ?auto_847338 ) ) ( not ( = ?auto_847339 ?auto_847341 ) ) ( HOIST-AT ?auto_847344 ?auto_847339 ) ( not ( = ?auto_847340 ?auto_847344 ) ) ( SURFACE-AT ?auto_847338 ?auto_847339 ) ( ON ?auto_847338 ?auto_847342 ) ( CLEAR ?auto_847338 ) ( not ( = ?auto_847337 ?auto_847342 ) ) ( not ( = ?auto_847338 ?auto_847342 ) ) ( not ( = ?auto_847336 ?auto_847342 ) ) ( SURFACE-AT ?auto_847336 ?auto_847341 ) ( CLEAR ?auto_847336 ) ( IS-CRATE ?auto_847337 ) ( AVAILABLE ?auto_847340 ) ( TRUCK-AT ?auto_847343 ?auto_847339 ) ( LIFTING ?auto_847344 ?auto_847337 ) ( ON ?auto_847336 ?auto_847335 ) ( not ( = ?auto_847335 ?auto_847336 ) ) ( not ( = ?auto_847335 ?auto_847337 ) ) ( not ( = ?auto_847335 ?auto_847338 ) ) ( not ( = ?auto_847335 ?auto_847342 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847336 ?auto_847337 ?auto_847338 )
      ( MAKE-3CRATE-VERIFY ?auto_847335 ?auto_847336 ?auto_847337 ?auto_847338 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_847345 - SURFACE
      ?auto_847346 - SURFACE
      ?auto_847347 - SURFACE
      ?auto_847348 - SURFACE
      ?auto_847349 - SURFACE
    )
    :vars
    (
      ?auto_847351 - HOIST
      ?auto_847352 - PLACE
      ?auto_847350 - PLACE
      ?auto_847355 - HOIST
      ?auto_847353 - SURFACE
      ?auto_847354 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847351 ?auto_847352 ) ( IS-CRATE ?auto_847349 ) ( not ( = ?auto_847348 ?auto_847349 ) ) ( not ( = ?auto_847347 ?auto_847348 ) ) ( not ( = ?auto_847347 ?auto_847349 ) ) ( not ( = ?auto_847350 ?auto_847352 ) ) ( HOIST-AT ?auto_847355 ?auto_847350 ) ( not ( = ?auto_847351 ?auto_847355 ) ) ( SURFACE-AT ?auto_847349 ?auto_847350 ) ( ON ?auto_847349 ?auto_847353 ) ( CLEAR ?auto_847349 ) ( not ( = ?auto_847348 ?auto_847353 ) ) ( not ( = ?auto_847349 ?auto_847353 ) ) ( not ( = ?auto_847347 ?auto_847353 ) ) ( SURFACE-AT ?auto_847347 ?auto_847352 ) ( CLEAR ?auto_847347 ) ( IS-CRATE ?auto_847348 ) ( AVAILABLE ?auto_847351 ) ( TRUCK-AT ?auto_847354 ?auto_847350 ) ( LIFTING ?auto_847355 ?auto_847348 ) ( ON ?auto_847346 ?auto_847345 ) ( ON ?auto_847347 ?auto_847346 ) ( not ( = ?auto_847345 ?auto_847346 ) ) ( not ( = ?auto_847345 ?auto_847347 ) ) ( not ( = ?auto_847345 ?auto_847348 ) ) ( not ( = ?auto_847345 ?auto_847349 ) ) ( not ( = ?auto_847345 ?auto_847353 ) ) ( not ( = ?auto_847346 ?auto_847347 ) ) ( not ( = ?auto_847346 ?auto_847348 ) ) ( not ( = ?auto_847346 ?auto_847349 ) ) ( not ( = ?auto_847346 ?auto_847353 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847347 ?auto_847348 ?auto_847349 )
      ( MAKE-4CRATE-VERIFY ?auto_847345 ?auto_847346 ?auto_847347 ?auto_847348 ?auto_847349 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_847356 - SURFACE
      ?auto_847357 - SURFACE
      ?auto_847358 - SURFACE
      ?auto_847359 - SURFACE
      ?auto_847360 - SURFACE
      ?auto_847361 - SURFACE
    )
    :vars
    (
      ?auto_847363 - HOIST
      ?auto_847364 - PLACE
      ?auto_847362 - PLACE
      ?auto_847367 - HOIST
      ?auto_847365 - SURFACE
      ?auto_847366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847363 ?auto_847364 ) ( IS-CRATE ?auto_847361 ) ( not ( = ?auto_847360 ?auto_847361 ) ) ( not ( = ?auto_847359 ?auto_847360 ) ) ( not ( = ?auto_847359 ?auto_847361 ) ) ( not ( = ?auto_847362 ?auto_847364 ) ) ( HOIST-AT ?auto_847367 ?auto_847362 ) ( not ( = ?auto_847363 ?auto_847367 ) ) ( SURFACE-AT ?auto_847361 ?auto_847362 ) ( ON ?auto_847361 ?auto_847365 ) ( CLEAR ?auto_847361 ) ( not ( = ?auto_847360 ?auto_847365 ) ) ( not ( = ?auto_847361 ?auto_847365 ) ) ( not ( = ?auto_847359 ?auto_847365 ) ) ( SURFACE-AT ?auto_847359 ?auto_847364 ) ( CLEAR ?auto_847359 ) ( IS-CRATE ?auto_847360 ) ( AVAILABLE ?auto_847363 ) ( TRUCK-AT ?auto_847366 ?auto_847362 ) ( LIFTING ?auto_847367 ?auto_847360 ) ( ON ?auto_847357 ?auto_847356 ) ( ON ?auto_847358 ?auto_847357 ) ( ON ?auto_847359 ?auto_847358 ) ( not ( = ?auto_847356 ?auto_847357 ) ) ( not ( = ?auto_847356 ?auto_847358 ) ) ( not ( = ?auto_847356 ?auto_847359 ) ) ( not ( = ?auto_847356 ?auto_847360 ) ) ( not ( = ?auto_847356 ?auto_847361 ) ) ( not ( = ?auto_847356 ?auto_847365 ) ) ( not ( = ?auto_847357 ?auto_847358 ) ) ( not ( = ?auto_847357 ?auto_847359 ) ) ( not ( = ?auto_847357 ?auto_847360 ) ) ( not ( = ?auto_847357 ?auto_847361 ) ) ( not ( = ?auto_847357 ?auto_847365 ) ) ( not ( = ?auto_847358 ?auto_847359 ) ) ( not ( = ?auto_847358 ?auto_847360 ) ) ( not ( = ?auto_847358 ?auto_847361 ) ) ( not ( = ?auto_847358 ?auto_847365 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847359 ?auto_847360 ?auto_847361 )
      ( MAKE-5CRATE-VERIFY ?auto_847356 ?auto_847357 ?auto_847358 ?auto_847359 ?auto_847360 ?auto_847361 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_847368 - SURFACE
      ?auto_847369 - SURFACE
    )
    :vars
    (
      ?auto_847372 - HOIST
      ?auto_847373 - PLACE
      ?auto_847371 - SURFACE
      ?auto_847370 - PLACE
      ?auto_847376 - HOIST
      ?auto_847374 - SURFACE
      ?auto_847375 - TRUCK
      ?auto_847377 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_847372 ?auto_847373 ) ( IS-CRATE ?auto_847369 ) ( not ( = ?auto_847368 ?auto_847369 ) ) ( not ( = ?auto_847371 ?auto_847368 ) ) ( not ( = ?auto_847371 ?auto_847369 ) ) ( not ( = ?auto_847370 ?auto_847373 ) ) ( HOIST-AT ?auto_847376 ?auto_847370 ) ( not ( = ?auto_847372 ?auto_847376 ) ) ( SURFACE-AT ?auto_847369 ?auto_847370 ) ( ON ?auto_847369 ?auto_847374 ) ( CLEAR ?auto_847369 ) ( not ( = ?auto_847368 ?auto_847374 ) ) ( not ( = ?auto_847369 ?auto_847374 ) ) ( not ( = ?auto_847371 ?auto_847374 ) ) ( SURFACE-AT ?auto_847371 ?auto_847373 ) ( CLEAR ?auto_847371 ) ( IS-CRATE ?auto_847368 ) ( AVAILABLE ?auto_847372 ) ( TRUCK-AT ?auto_847375 ?auto_847370 ) ( AVAILABLE ?auto_847376 ) ( SURFACE-AT ?auto_847368 ?auto_847370 ) ( ON ?auto_847368 ?auto_847377 ) ( CLEAR ?auto_847368 ) ( not ( = ?auto_847368 ?auto_847377 ) ) ( not ( = ?auto_847369 ?auto_847377 ) ) ( not ( = ?auto_847371 ?auto_847377 ) ) ( not ( = ?auto_847374 ?auto_847377 ) ) )
    :subtasks
    ( ( !LIFT ?auto_847376 ?auto_847368 ?auto_847377 ?auto_847370 )
      ( MAKE-2CRATE ?auto_847371 ?auto_847368 ?auto_847369 )
      ( MAKE-1CRATE-VERIFY ?auto_847368 ?auto_847369 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_847378 - SURFACE
      ?auto_847379 - SURFACE
      ?auto_847380 - SURFACE
    )
    :vars
    (
      ?auto_847383 - HOIST
      ?auto_847387 - PLACE
      ?auto_847382 - PLACE
      ?auto_847384 - HOIST
      ?auto_847381 - SURFACE
      ?auto_847386 - TRUCK
      ?auto_847385 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_847383 ?auto_847387 ) ( IS-CRATE ?auto_847380 ) ( not ( = ?auto_847379 ?auto_847380 ) ) ( not ( = ?auto_847378 ?auto_847379 ) ) ( not ( = ?auto_847378 ?auto_847380 ) ) ( not ( = ?auto_847382 ?auto_847387 ) ) ( HOIST-AT ?auto_847384 ?auto_847382 ) ( not ( = ?auto_847383 ?auto_847384 ) ) ( SURFACE-AT ?auto_847380 ?auto_847382 ) ( ON ?auto_847380 ?auto_847381 ) ( CLEAR ?auto_847380 ) ( not ( = ?auto_847379 ?auto_847381 ) ) ( not ( = ?auto_847380 ?auto_847381 ) ) ( not ( = ?auto_847378 ?auto_847381 ) ) ( SURFACE-AT ?auto_847378 ?auto_847387 ) ( CLEAR ?auto_847378 ) ( IS-CRATE ?auto_847379 ) ( AVAILABLE ?auto_847383 ) ( TRUCK-AT ?auto_847386 ?auto_847382 ) ( AVAILABLE ?auto_847384 ) ( SURFACE-AT ?auto_847379 ?auto_847382 ) ( ON ?auto_847379 ?auto_847385 ) ( CLEAR ?auto_847379 ) ( not ( = ?auto_847379 ?auto_847385 ) ) ( not ( = ?auto_847380 ?auto_847385 ) ) ( not ( = ?auto_847378 ?auto_847385 ) ) ( not ( = ?auto_847381 ?auto_847385 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_847379 ?auto_847380 )
      ( MAKE-2CRATE-VERIFY ?auto_847378 ?auto_847379 ?auto_847380 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_847388 - SURFACE
      ?auto_847389 - SURFACE
      ?auto_847390 - SURFACE
      ?auto_847391 - SURFACE
    )
    :vars
    (
      ?auto_847395 - HOIST
      ?auto_847396 - PLACE
      ?auto_847398 - PLACE
      ?auto_847393 - HOIST
      ?auto_847394 - SURFACE
      ?auto_847392 - TRUCK
      ?auto_847397 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_847395 ?auto_847396 ) ( IS-CRATE ?auto_847391 ) ( not ( = ?auto_847390 ?auto_847391 ) ) ( not ( = ?auto_847389 ?auto_847390 ) ) ( not ( = ?auto_847389 ?auto_847391 ) ) ( not ( = ?auto_847398 ?auto_847396 ) ) ( HOIST-AT ?auto_847393 ?auto_847398 ) ( not ( = ?auto_847395 ?auto_847393 ) ) ( SURFACE-AT ?auto_847391 ?auto_847398 ) ( ON ?auto_847391 ?auto_847394 ) ( CLEAR ?auto_847391 ) ( not ( = ?auto_847390 ?auto_847394 ) ) ( not ( = ?auto_847391 ?auto_847394 ) ) ( not ( = ?auto_847389 ?auto_847394 ) ) ( SURFACE-AT ?auto_847389 ?auto_847396 ) ( CLEAR ?auto_847389 ) ( IS-CRATE ?auto_847390 ) ( AVAILABLE ?auto_847395 ) ( TRUCK-AT ?auto_847392 ?auto_847398 ) ( AVAILABLE ?auto_847393 ) ( SURFACE-AT ?auto_847390 ?auto_847398 ) ( ON ?auto_847390 ?auto_847397 ) ( CLEAR ?auto_847390 ) ( not ( = ?auto_847390 ?auto_847397 ) ) ( not ( = ?auto_847391 ?auto_847397 ) ) ( not ( = ?auto_847389 ?auto_847397 ) ) ( not ( = ?auto_847394 ?auto_847397 ) ) ( ON ?auto_847389 ?auto_847388 ) ( not ( = ?auto_847388 ?auto_847389 ) ) ( not ( = ?auto_847388 ?auto_847390 ) ) ( not ( = ?auto_847388 ?auto_847391 ) ) ( not ( = ?auto_847388 ?auto_847394 ) ) ( not ( = ?auto_847388 ?auto_847397 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847389 ?auto_847390 ?auto_847391 )
      ( MAKE-3CRATE-VERIFY ?auto_847388 ?auto_847389 ?auto_847390 ?auto_847391 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_847399 - SURFACE
      ?auto_847400 - SURFACE
      ?auto_847401 - SURFACE
      ?auto_847402 - SURFACE
      ?auto_847403 - SURFACE
    )
    :vars
    (
      ?auto_847407 - HOIST
      ?auto_847408 - PLACE
      ?auto_847410 - PLACE
      ?auto_847405 - HOIST
      ?auto_847406 - SURFACE
      ?auto_847404 - TRUCK
      ?auto_847409 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_847407 ?auto_847408 ) ( IS-CRATE ?auto_847403 ) ( not ( = ?auto_847402 ?auto_847403 ) ) ( not ( = ?auto_847401 ?auto_847402 ) ) ( not ( = ?auto_847401 ?auto_847403 ) ) ( not ( = ?auto_847410 ?auto_847408 ) ) ( HOIST-AT ?auto_847405 ?auto_847410 ) ( not ( = ?auto_847407 ?auto_847405 ) ) ( SURFACE-AT ?auto_847403 ?auto_847410 ) ( ON ?auto_847403 ?auto_847406 ) ( CLEAR ?auto_847403 ) ( not ( = ?auto_847402 ?auto_847406 ) ) ( not ( = ?auto_847403 ?auto_847406 ) ) ( not ( = ?auto_847401 ?auto_847406 ) ) ( SURFACE-AT ?auto_847401 ?auto_847408 ) ( CLEAR ?auto_847401 ) ( IS-CRATE ?auto_847402 ) ( AVAILABLE ?auto_847407 ) ( TRUCK-AT ?auto_847404 ?auto_847410 ) ( AVAILABLE ?auto_847405 ) ( SURFACE-AT ?auto_847402 ?auto_847410 ) ( ON ?auto_847402 ?auto_847409 ) ( CLEAR ?auto_847402 ) ( not ( = ?auto_847402 ?auto_847409 ) ) ( not ( = ?auto_847403 ?auto_847409 ) ) ( not ( = ?auto_847401 ?auto_847409 ) ) ( not ( = ?auto_847406 ?auto_847409 ) ) ( ON ?auto_847400 ?auto_847399 ) ( ON ?auto_847401 ?auto_847400 ) ( not ( = ?auto_847399 ?auto_847400 ) ) ( not ( = ?auto_847399 ?auto_847401 ) ) ( not ( = ?auto_847399 ?auto_847402 ) ) ( not ( = ?auto_847399 ?auto_847403 ) ) ( not ( = ?auto_847399 ?auto_847406 ) ) ( not ( = ?auto_847399 ?auto_847409 ) ) ( not ( = ?auto_847400 ?auto_847401 ) ) ( not ( = ?auto_847400 ?auto_847402 ) ) ( not ( = ?auto_847400 ?auto_847403 ) ) ( not ( = ?auto_847400 ?auto_847406 ) ) ( not ( = ?auto_847400 ?auto_847409 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847401 ?auto_847402 ?auto_847403 )
      ( MAKE-4CRATE-VERIFY ?auto_847399 ?auto_847400 ?auto_847401 ?auto_847402 ?auto_847403 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_847411 - SURFACE
      ?auto_847412 - SURFACE
      ?auto_847413 - SURFACE
      ?auto_847414 - SURFACE
      ?auto_847415 - SURFACE
      ?auto_847416 - SURFACE
    )
    :vars
    (
      ?auto_847420 - HOIST
      ?auto_847421 - PLACE
      ?auto_847423 - PLACE
      ?auto_847418 - HOIST
      ?auto_847419 - SURFACE
      ?auto_847417 - TRUCK
      ?auto_847422 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_847420 ?auto_847421 ) ( IS-CRATE ?auto_847416 ) ( not ( = ?auto_847415 ?auto_847416 ) ) ( not ( = ?auto_847414 ?auto_847415 ) ) ( not ( = ?auto_847414 ?auto_847416 ) ) ( not ( = ?auto_847423 ?auto_847421 ) ) ( HOIST-AT ?auto_847418 ?auto_847423 ) ( not ( = ?auto_847420 ?auto_847418 ) ) ( SURFACE-AT ?auto_847416 ?auto_847423 ) ( ON ?auto_847416 ?auto_847419 ) ( CLEAR ?auto_847416 ) ( not ( = ?auto_847415 ?auto_847419 ) ) ( not ( = ?auto_847416 ?auto_847419 ) ) ( not ( = ?auto_847414 ?auto_847419 ) ) ( SURFACE-AT ?auto_847414 ?auto_847421 ) ( CLEAR ?auto_847414 ) ( IS-CRATE ?auto_847415 ) ( AVAILABLE ?auto_847420 ) ( TRUCK-AT ?auto_847417 ?auto_847423 ) ( AVAILABLE ?auto_847418 ) ( SURFACE-AT ?auto_847415 ?auto_847423 ) ( ON ?auto_847415 ?auto_847422 ) ( CLEAR ?auto_847415 ) ( not ( = ?auto_847415 ?auto_847422 ) ) ( not ( = ?auto_847416 ?auto_847422 ) ) ( not ( = ?auto_847414 ?auto_847422 ) ) ( not ( = ?auto_847419 ?auto_847422 ) ) ( ON ?auto_847412 ?auto_847411 ) ( ON ?auto_847413 ?auto_847412 ) ( ON ?auto_847414 ?auto_847413 ) ( not ( = ?auto_847411 ?auto_847412 ) ) ( not ( = ?auto_847411 ?auto_847413 ) ) ( not ( = ?auto_847411 ?auto_847414 ) ) ( not ( = ?auto_847411 ?auto_847415 ) ) ( not ( = ?auto_847411 ?auto_847416 ) ) ( not ( = ?auto_847411 ?auto_847419 ) ) ( not ( = ?auto_847411 ?auto_847422 ) ) ( not ( = ?auto_847412 ?auto_847413 ) ) ( not ( = ?auto_847412 ?auto_847414 ) ) ( not ( = ?auto_847412 ?auto_847415 ) ) ( not ( = ?auto_847412 ?auto_847416 ) ) ( not ( = ?auto_847412 ?auto_847419 ) ) ( not ( = ?auto_847412 ?auto_847422 ) ) ( not ( = ?auto_847413 ?auto_847414 ) ) ( not ( = ?auto_847413 ?auto_847415 ) ) ( not ( = ?auto_847413 ?auto_847416 ) ) ( not ( = ?auto_847413 ?auto_847419 ) ) ( not ( = ?auto_847413 ?auto_847422 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847414 ?auto_847415 ?auto_847416 )
      ( MAKE-5CRATE-VERIFY ?auto_847411 ?auto_847412 ?auto_847413 ?auto_847414 ?auto_847415 ?auto_847416 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_847424 - SURFACE
      ?auto_847425 - SURFACE
    )
    :vars
    (
      ?auto_847430 - HOIST
      ?auto_847431 - PLACE
      ?auto_847427 - SURFACE
      ?auto_847433 - PLACE
      ?auto_847428 - HOIST
      ?auto_847429 - SURFACE
      ?auto_847432 - SURFACE
      ?auto_847426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847430 ?auto_847431 ) ( IS-CRATE ?auto_847425 ) ( not ( = ?auto_847424 ?auto_847425 ) ) ( not ( = ?auto_847427 ?auto_847424 ) ) ( not ( = ?auto_847427 ?auto_847425 ) ) ( not ( = ?auto_847433 ?auto_847431 ) ) ( HOIST-AT ?auto_847428 ?auto_847433 ) ( not ( = ?auto_847430 ?auto_847428 ) ) ( SURFACE-AT ?auto_847425 ?auto_847433 ) ( ON ?auto_847425 ?auto_847429 ) ( CLEAR ?auto_847425 ) ( not ( = ?auto_847424 ?auto_847429 ) ) ( not ( = ?auto_847425 ?auto_847429 ) ) ( not ( = ?auto_847427 ?auto_847429 ) ) ( SURFACE-AT ?auto_847427 ?auto_847431 ) ( CLEAR ?auto_847427 ) ( IS-CRATE ?auto_847424 ) ( AVAILABLE ?auto_847430 ) ( AVAILABLE ?auto_847428 ) ( SURFACE-AT ?auto_847424 ?auto_847433 ) ( ON ?auto_847424 ?auto_847432 ) ( CLEAR ?auto_847424 ) ( not ( = ?auto_847424 ?auto_847432 ) ) ( not ( = ?auto_847425 ?auto_847432 ) ) ( not ( = ?auto_847427 ?auto_847432 ) ) ( not ( = ?auto_847429 ?auto_847432 ) ) ( TRUCK-AT ?auto_847426 ?auto_847431 ) )
    :subtasks
    ( ( !DRIVE ?auto_847426 ?auto_847431 ?auto_847433 )
      ( MAKE-2CRATE ?auto_847427 ?auto_847424 ?auto_847425 )
      ( MAKE-1CRATE-VERIFY ?auto_847424 ?auto_847425 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_847434 - SURFACE
      ?auto_847435 - SURFACE
      ?auto_847436 - SURFACE
    )
    :vars
    (
      ?auto_847442 - HOIST
      ?auto_847441 - PLACE
      ?auto_847439 - PLACE
      ?auto_847440 - HOIST
      ?auto_847437 - SURFACE
      ?auto_847438 - SURFACE
      ?auto_847443 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847442 ?auto_847441 ) ( IS-CRATE ?auto_847436 ) ( not ( = ?auto_847435 ?auto_847436 ) ) ( not ( = ?auto_847434 ?auto_847435 ) ) ( not ( = ?auto_847434 ?auto_847436 ) ) ( not ( = ?auto_847439 ?auto_847441 ) ) ( HOIST-AT ?auto_847440 ?auto_847439 ) ( not ( = ?auto_847442 ?auto_847440 ) ) ( SURFACE-AT ?auto_847436 ?auto_847439 ) ( ON ?auto_847436 ?auto_847437 ) ( CLEAR ?auto_847436 ) ( not ( = ?auto_847435 ?auto_847437 ) ) ( not ( = ?auto_847436 ?auto_847437 ) ) ( not ( = ?auto_847434 ?auto_847437 ) ) ( SURFACE-AT ?auto_847434 ?auto_847441 ) ( CLEAR ?auto_847434 ) ( IS-CRATE ?auto_847435 ) ( AVAILABLE ?auto_847442 ) ( AVAILABLE ?auto_847440 ) ( SURFACE-AT ?auto_847435 ?auto_847439 ) ( ON ?auto_847435 ?auto_847438 ) ( CLEAR ?auto_847435 ) ( not ( = ?auto_847435 ?auto_847438 ) ) ( not ( = ?auto_847436 ?auto_847438 ) ) ( not ( = ?auto_847434 ?auto_847438 ) ) ( not ( = ?auto_847437 ?auto_847438 ) ) ( TRUCK-AT ?auto_847443 ?auto_847441 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_847435 ?auto_847436 )
      ( MAKE-2CRATE-VERIFY ?auto_847434 ?auto_847435 ?auto_847436 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_847444 - SURFACE
      ?auto_847445 - SURFACE
      ?auto_847446 - SURFACE
      ?auto_847447 - SURFACE
    )
    :vars
    (
      ?auto_847450 - HOIST
      ?auto_847453 - PLACE
      ?auto_847454 - PLACE
      ?auto_847452 - HOIST
      ?auto_847451 - SURFACE
      ?auto_847449 - SURFACE
      ?auto_847448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847450 ?auto_847453 ) ( IS-CRATE ?auto_847447 ) ( not ( = ?auto_847446 ?auto_847447 ) ) ( not ( = ?auto_847445 ?auto_847446 ) ) ( not ( = ?auto_847445 ?auto_847447 ) ) ( not ( = ?auto_847454 ?auto_847453 ) ) ( HOIST-AT ?auto_847452 ?auto_847454 ) ( not ( = ?auto_847450 ?auto_847452 ) ) ( SURFACE-AT ?auto_847447 ?auto_847454 ) ( ON ?auto_847447 ?auto_847451 ) ( CLEAR ?auto_847447 ) ( not ( = ?auto_847446 ?auto_847451 ) ) ( not ( = ?auto_847447 ?auto_847451 ) ) ( not ( = ?auto_847445 ?auto_847451 ) ) ( SURFACE-AT ?auto_847445 ?auto_847453 ) ( CLEAR ?auto_847445 ) ( IS-CRATE ?auto_847446 ) ( AVAILABLE ?auto_847450 ) ( AVAILABLE ?auto_847452 ) ( SURFACE-AT ?auto_847446 ?auto_847454 ) ( ON ?auto_847446 ?auto_847449 ) ( CLEAR ?auto_847446 ) ( not ( = ?auto_847446 ?auto_847449 ) ) ( not ( = ?auto_847447 ?auto_847449 ) ) ( not ( = ?auto_847445 ?auto_847449 ) ) ( not ( = ?auto_847451 ?auto_847449 ) ) ( TRUCK-AT ?auto_847448 ?auto_847453 ) ( ON ?auto_847445 ?auto_847444 ) ( not ( = ?auto_847444 ?auto_847445 ) ) ( not ( = ?auto_847444 ?auto_847446 ) ) ( not ( = ?auto_847444 ?auto_847447 ) ) ( not ( = ?auto_847444 ?auto_847451 ) ) ( not ( = ?auto_847444 ?auto_847449 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847445 ?auto_847446 ?auto_847447 )
      ( MAKE-3CRATE-VERIFY ?auto_847444 ?auto_847445 ?auto_847446 ?auto_847447 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_847455 - SURFACE
      ?auto_847456 - SURFACE
      ?auto_847457 - SURFACE
      ?auto_847458 - SURFACE
      ?auto_847459 - SURFACE
    )
    :vars
    (
      ?auto_847462 - HOIST
      ?auto_847465 - PLACE
      ?auto_847466 - PLACE
      ?auto_847464 - HOIST
      ?auto_847463 - SURFACE
      ?auto_847461 - SURFACE
      ?auto_847460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847462 ?auto_847465 ) ( IS-CRATE ?auto_847459 ) ( not ( = ?auto_847458 ?auto_847459 ) ) ( not ( = ?auto_847457 ?auto_847458 ) ) ( not ( = ?auto_847457 ?auto_847459 ) ) ( not ( = ?auto_847466 ?auto_847465 ) ) ( HOIST-AT ?auto_847464 ?auto_847466 ) ( not ( = ?auto_847462 ?auto_847464 ) ) ( SURFACE-AT ?auto_847459 ?auto_847466 ) ( ON ?auto_847459 ?auto_847463 ) ( CLEAR ?auto_847459 ) ( not ( = ?auto_847458 ?auto_847463 ) ) ( not ( = ?auto_847459 ?auto_847463 ) ) ( not ( = ?auto_847457 ?auto_847463 ) ) ( SURFACE-AT ?auto_847457 ?auto_847465 ) ( CLEAR ?auto_847457 ) ( IS-CRATE ?auto_847458 ) ( AVAILABLE ?auto_847462 ) ( AVAILABLE ?auto_847464 ) ( SURFACE-AT ?auto_847458 ?auto_847466 ) ( ON ?auto_847458 ?auto_847461 ) ( CLEAR ?auto_847458 ) ( not ( = ?auto_847458 ?auto_847461 ) ) ( not ( = ?auto_847459 ?auto_847461 ) ) ( not ( = ?auto_847457 ?auto_847461 ) ) ( not ( = ?auto_847463 ?auto_847461 ) ) ( TRUCK-AT ?auto_847460 ?auto_847465 ) ( ON ?auto_847456 ?auto_847455 ) ( ON ?auto_847457 ?auto_847456 ) ( not ( = ?auto_847455 ?auto_847456 ) ) ( not ( = ?auto_847455 ?auto_847457 ) ) ( not ( = ?auto_847455 ?auto_847458 ) ) ( not ( = ?auto_847455 ?auto_847459 ) ) ( not ( = ?auto_847455 ?auto_847463 ) ) ( not ( = ?auto_847455 ?auto_847461 ) ) ( not ( = ?auto_847456 ?auto_847457 ) ) ( not ( = ?auto_847456 ?auto_847458 ) ) ( not ( = ?auto_847456 ?auto_847459 ) ) ( not ( = ?auto_847456 ?auto_847463 ) ) ( not ( = ?auto_847456 ?auto_847461 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847457 ?auto_847458 ?auto_847459 )
      ( MAKE-4CRATE-VERIFY ?auto_847455 ?auto_847456 ?auto_847457 ?auto_847458 ?auto_847459 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_847467 - SURFACE
      ?auto_847468 - SURFACE
      ?auto_847469 - SURFACE
      ?auto_847470 - SURFACE
      ?auto_847471 - SURFACE
      ?auto_847472 - SURFACE
    )
    :vars
    (
      ?auto_847475 - HOIST
      ?auto_847478 - PLACE
      ?auto_847479 - PLACE
      ?auto_847477 - HOIST
      ?auto_847476 - SURFACE
      ?auto_847474 - SURFACE
      ?auto_847473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847475 ?auto_847478 ) ( IS-CRATE ?auto_847472 ) ( not ( = ?auto_847471 ?auto_847472 ) ) ( not ( = ?auto_847470 ?auto_847471 ) ) ( not ( = ?auto_847470 ?auto_847472 ) ) ( not ( = ?auto_847479 ?auto_847478 ) ) ( HOIST-AT ?auto_847477 ?auto_847479 ) ( not ( = ?auto_847475 ?auto_847477 ) ) ( SURFACE-AT ?auto_847472 ?auto_847479 ) ( ON ?auto_847472 ?auto_847476 ) ( CLEAR ?auto_847472 ) ( not ( = ?auto_847471 ?auto_847476 ) ) ( not ( = ?auto_847472 ?auto_847476 ) ) ( not ( = ?auto_847470 ?auto_847476 ) ) ( SURFACE-AT ?auto_847470 ?auto_847478 ) ( CLEAR ?auto_847470 ) ( IS-CRATE ?auto_847471 ) ( AVAILABLE ?auto_847475 ) ( AVAILABLE ?auto_847477 ) ( SURFACE-AT ?auto_847471 ?auto_847479 ) ( ON ?auto_847471 ?auto_847474 ) ( CLEAR ?auto_847471 ) ( not ( = ?auto_847471 ?auto_847474 ) ) ( not ( = ?auto_847472 ?auto_847474 ) ) ( not ( = ?auto_847470 ?auto_847474 ) ) ( not ( = ?auto_847476 ?auto_847474 ) ) ( TRUCK-AT ?auto_847473 ?auto_847478 ) ( ON ?auto_847468 ?auto_847467 ) ( ON ?auto_847469 ?auto_847468 ) ( ON ?auto_847470 ?auto_847469 ) ( not ( = ?auto_847467 ?auto_847468 ) ) ( not ( = ?auto_847467 ?auto_847469 ) ) ( not ( = ?auto_847467 ?auto_847470 ) ) ( not ( = ?auto_847467 ?auto_847471 ) ) ( not ( = ?auto_847467 ?auto_847472 ) ) ( not ( = ?auto_847467 ?auto_847476 ) ) ( not ( = ?auto_847467 ?auto_847474 ) ) ( not ( = ?auto_847468 ?auto_847469 ) ) ( not ( = ?auto_847468 ?auto_847470 ) ) ( not ( = ?auto_847468 ?auto_847471 ) ) ( not ( = ?auto_847468 ?auto_847472 ) ) ( not ( = ?auto_847468 ?auto_847476 ) ) ( not ( = ?auto_847468 ?auto_847474 ) ) ( not ( = ?auto_847469 ?auto_847470 ) ) ( not ( = ?auto_847469 ?auto_847471 ) ) ( not ( = ?auto_847469 ?auto_847472 ) ) ( not ( = ?auto_847469 ?auto_847476 ) ) ( not ( = ?auto_847469 ?auto_847474 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847470 ?auto_847471 ?auto_847472 )
      ( MAKE-5CRATE-VERIFY ?auto_847467 ?auto_847468 ?auto_847469 ?auto_847470 ?auto_847471 ?auto_847472 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_847480 - SURFACE
      ?auto_847481 - SURFACE
    )
    :vars
    (
      ?auto_847485 - HOIST
      ?auto_847488 - PLACE
      ?auto_847484 - SURFACE
      ?auto_847489 - PLACE
      ?auto_847487 - HOIST
      ?auto_847486 - SURFACE
      ?auto_847483 - SURFACE
      ?auto_847482 - TRUCK
      ?auto_847490 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_847485 ?auto_847488 ) ( IS-CRATE ?auto_847481 ) ( not ( = ?auto_847480 ?auto_847481 ) ) ( not ( = ?auto_847484 ?auto_847480 ) ) ( not ( = ?auto_847484 ?auto_847481 ) ) ( not ( = ?auto_847489 ?auto_847488 ) ) ( HOIST-AT ?auto_847487 ?auto_847489 ) ( not ( = ?auto_847485 ?auto_847487 ) ) ( SURFACE-AT ?auto_847481 ?auto_847489 ) ( ON ?auto_847481 ?auto_847486 ) ( CLEAR ?auto_847481 ) ( not ( = ?auto_847480 ?auto_847486 ) ) ( not ( = ?auto_847481 ?auto_847486 ) ) ( not ( = ?auto_847484 ?auto_847486 ) ) ( IS-CRATE ?auto_847480 ) ( AVAILABLE ?auto_847487 ) ( SURFACE-AT ?auto_847480 ?auto_847489 ) ( ON ?auto_847480 ?auto_847483 ) ( CLEAR ?auto_847480 ) ( not ( = ?auto_847480 ?auto_847483 ) ) ( not ( = ?auto_847481 ?auto_847483 ) ) ( not ( = ?auto_847484 ?auto_847483 ) ) ( not ( = ?auto_847486 ?auto_847483 ) ) ( TRUCK-AT ?auto_847482 ?auto_847488 ) ( SURFACE-AT ?auto_847490 ?auto_847488 ) ( CLEAR ?auto_847490 ) ( LIFTING ?auto_847485 ?auto_847484 ) ( IS-CRATE ?auto_847484 ) ( not ( = ?auto_847490 ?auto_847484 ) ) ( not ( = ?auto_847480 ?auto_847490 ) ) ( not ( = ?auto_847481 ?auto_847490 ) ) ( not ( = ?auto_847486 ?auto_847490 ) ) ( not ( = ?auto_847483 ?auto_847490 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_847490 ?auto_847484 )
      ( MAKE-2CRATE ?auto_847484 ?auto_847480 ?auto_847481 )
      ( MAKE-1CRATE-VERIFY ?auto_847480 ?auto_847481 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_847491 - SURFACE
      ?auto_847492 - SURFACE
      ?auto_847493 - SURFACE
    )
    :vars
    (
      ?auto_847497 - HOIST
      ?auto_847500 - PLACE
      ?auto_847501 - PLACE
      ?auto_847496 - HOIST
      ?auto_847494 - SURFACE
      ?auto_847495 - SURFACE
      ?auto_847499 - TRUCK
      ?auto_847498 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_847497 ?auto_847500 ) ( IS-CRATE ?auto_847493 ) ( not ( = ?auto_847492 ?auto_847493 ) ) ( not ( = ?auto_847491 ?auto_847492 ) ) ( not ( = ?auto_847491 ?auto_847493 ) ) ( not ( = ?auto_847501 ?auto_847500 ) ) ( HOIST-AT ?auto_847496 ?auto_847501 ) ( not ( = ?auto_847497 ?auto_847496 ) ) ( SURFACE-AT ?auto_847493 ?auto_847501 ) ( ON ?auto_847493 ?auto_847494 ) ( CLEAR ?auto_847493 ) ( not ( = ?auto_847492 ?auto_847494 ) ) ( not ( = ?auto_847493 ?auto_847494 ) ) ( not ( = ?auto_847491 ?auto_847494 ) ) ( IS-CRATE ?auto_847492 ) ( AVAILABLE ?auto_847496 ) ( SURFACE-AT ?auto_847492 ?auto_847501 ) ( ON ?auto_847492 ?auto_847495 ) ( CLEAR ?auto_847492 ) ( not ( = ?auto_847492 ?auto_847495 ) ) ( not ( = ?auto_847493 ?auto_847495 ) ) ( not ( = ?auto_847491 ?auto_847495 ) ) ( not ( = ?auto_847494 ?auto_847495 ) ) ( TRUCK-AT ?auto_847499 ?auto_847500 ) ( SURFACE-AT ?auto_847498 ?auto_847500 ) ( CLEAR ?auto_847498 ) ( LIFTING ?auto_847497 ?auto_847491 ) ( IS-CRATE ?auto_847491 ) ( not ( = ?auto_847498 ?auto_847491 ) ) ( not ( = ?auto_847492 ?auto_847498 ) ) ( not ( = ?auto_847493 ?auto_847498 ) ) ( not ( = ?auto_847494 ?auto_847498 ) ) ( not ( = ?auto_847495 ?auto_847498 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_847492 ?auto_847493 )
      ( MAKE-2CRATE-VERIFY ?auto_847491 ?auto_847492 ?auto_847493 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_847502 - SURFACE
      ?auto_847503 - SURFACE
      ?auto_847504 - SURFACE
      ?auto_847505 - SURFACE
    )
    :vars
    (
      ?auto_847506 - HOIST
      ?auto_847512 - PLACE
      ?auto_847509 - PLACE
      ?auto_847507 - HOIST
      ?auto_847510 - SURFACE
      ?auto_847508 - SURFACE
      ?auto_847511 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847506 ?auto_847512 ) ( IS-CRATE ?auto_847505 ) ( not ( = ?auto_847504 ?auto_847505 ) ) ( not ( = ?auto_847503 ?auto_847504 ) ) ( not ( = ?auto_847503 ?auto_847505 ) ) ( not ( = ?auto_847509 ?auto_847512 ) ) ( HOIST-AT ?auto_847507 ?auto_847509 ) ( not ( = ?auto_847506 ?auto_847507 ) ) ( SURFACE-AT ?auto_847505 ?auto_847509 ) ( ON ?auto_847505 ?auto_847510 ) ( CLEAR ?auto_847505 ) ( not ( = ?auto_847504 ?auto_847510 ) ) ( not ( = ?auto_847505 ?auto_847510 ) ) ( not ( = ?auto_847503 ?auto_847510 ) ) ( IS-CRATE ?auto_847504 ) ( AVAILABLE ?auto_847507 ) ( SURFACE-AT ?auto_847504 ?auto_847509 ) ( ON ?auto_847504 ?auto_847508 ) ( CLEAR ?auto_847504 ) ( not ( = ?auto_847504 ?auto_847508 ) ) ( not ( = ?auto_847505 ?auto_847508 ) ) ( not ( = ?auto_847503 ?auto_847508 ) ) ( not ( = ?auto_847510 ?auto_847508 ) ) ( TRUCK-AT ?auto_847511 ?auto_847512 ) ( SURFACE-AT ?auto_847502 ?auto_847512 ) ( CLEAR ?auto_847502 ) ( LIFTING ?auto_847506 ?auto_847503 ) ( IS-CRATE ?auto_847503 ) ( not ( = ?auto_847502 ?auto_847503 ) ) ( not ( = ?auto_847504 ?auto_847502 ) ) ( not ( = ?auto_847505 ?auto_847502 ) ) ( not ( = ?auto_847510 ?auto_847502 ) ) ( not ( = ?auto_847508 ?auto_847502 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847503 ?auto_847504 ?auto_847505 )
      ( MAKE-3CRATE-VERIFY ?auto_847502 ?auto_847503 ?auto_847504 ?auto_847505 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_847513 - SURFACE
      ?auto_847514 - SURFACE
      ?auto_847515 - SURFACE
      ?auto_847516 - SURFACE
      ?auto_847517 - SURFACE
    )
    :vars
    (
      ?auto_847518 - HOIST
      ?auto_847524 - PLACE
      ?auto_847521 - PLACE
      ?auto_847519 - HOIST
      ?auto_847522 - SURFACE
      ?auto_847520 - SURFACE
      ?auto_847523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847518 ?auto_847524 ) ( IS-CRATE ?auto_847517 ) ( not ( = ?auto_847516 ?auto_847517 ) ) ( not ( = ?auto_847515 ?auto_847516 ) ) ( not ( = ?auto_847515 ?auto_847517 ) ) ( not ( = ?auto_847521 ?auto_847524 ) ) ( HOIST-AT ?auto_847519 ?auto_847521 ) ( not ( = ?auto_847518 ?auto_847519 ) ) ( SURFACE-AT ?auto_847517 ?auto_847521 ) ( ON ?auto_847517 ?auto_847522 ) ( CLEAR ?auto_847517 ) ( not ( = ?auto_847516 ?auto_847522 ) ) ( not ( = ?auto_847517 ?auto_847522 ) ) ( not ( = ?auto_847515 ?auto_847522 ) ) ( IS-CRATE ?auto_847516 ) ( AVAILABLE ?auto_847519 ) ( SURFACE-AT ?auto_847516 ?auto_847521 ) ( ON ?auto_847516 ?auto_847520 ) ( CLEAR ?auto_847516 ) ( not ( = ?auto_847516 ?auto_847520 ) ) ( not ( = ?auto_847517 ?auto_847520 ) ) ( not ( = ?auto_847515 ?auto_847520 ) ) ( not ( = ?auto_847522 ?auto_847520 ) ) ( TRUCK-AT ?auto_847523 ?auto_847524 ) ( SURFACE-AT ?auto_847514 ?auto_847524 ) ( CLEAR ?auto_847514 ) ( LIFTING ?auto_847518 ?auto_847515 ) ( IS-CRATE ?auto_847515 ) ( not ( = ?auto_847514 ?auto_847515 ) ) ( not ( = ?auto_847516 ?auto_847514 ) ) ( not ( = ?auto_847517 ?auto_847514 ) ) ( not ( = ?auto_847522 ?auto_847514 ) ) ( not ( = ?auto_847520 ?auto_847514 ) ) ( ON ?auto_847514 ?auto_847513 ) ( not ( = ?auto_847513 ?auto_847514 ) ) ( not ( = ?auto_847513 ?auto_847515 ) ) ( not ( = ?auto_847513 ?auto_847516 ) ) ( not ( = ?auto_847513 ?auto_847517 ) ) ( not ( = ?auto_847513 ?auto_847522 ) ) ( not ( = ?auto_847513 ?auto_847520 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847515 ?auto_847516 ?auto_847517 )
      ( MAKE-4CRATE-VERIFY ?auto_847513 ?auto_847514 ?auto_847515 ?auto_847516 ?auto_847517 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_847525 - SURFACE
      ?auto_847526 - SURFACE
      ?auto_847527 - SURFACE
      ?auto_847528 - SURFACE
      ?auto_847529 - SURFACE
      ?auto_847530 - SURFACE
    )
    :vars
    (
      ?auto_847531 - HOIST
      ?auto_847537 - PLACE
      ?auto_847534 - PLACE
      ?auto_847532 - HOIST
      ?auto_847535 - SURFACE
      ?auto_847533 - SURFACE
      ?auto_847536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847531 ?auto_847537 ) ( IS-CRATE ?auto_847530 ) ( not ( = ?auto_847529 ?auto_847530 ) ) ( not ( = ?auto_847528 ?auto_847529 ) ) ( not ( = ?auto_847528 ?auto_847530 ) ) ( not ( = ?auto_847534 ?auto_847537 ) ) ( HOIST-AT ?auto_847532 ?auto_847534 ) ( not ( = ?auto_847531 ?auto_847532 ) ) ( SURFACE-AT ?auto_847530 ?auto_847534 ) ( ON ?auto_847530 ?auto_847535 ) ( CLEAR ?auto_847530 ) ( not ( = ?auto_847529 ?auto_847535 ) ) ( not ( = ?auto_847530 ?auto_847535 ) ) ( not ( = ?auto_847528 ?auto_847535 ) ) ( IS-CRATE ?auto_847529 ) ( AVAILABLE ?auto_847532 ) ( SURFACE-AT ?auto_847529 ?auto_847534 ) ( ON ?auto_847529 ?auto_847533 ) ( CLEAR ?auto_847529 ) ( not ( = ?auto_847529 ?auto_847533 ) ) ( not ( = ?auto_847530 ?auto_847533 ) ) ( not ( = ?auto_847528 ?auto_847533 ) ) ( not ( = ?auto_847535 ?auto_847533 ) ) ( TRUCK-AT ?auto_847536 ?auto_847537 ) ( SURFACE-AT ?auto_847527 ?auto_847537 ) ( CLEAR ?auto_847527 ) ( LIFTING ?auto_847531 ?auto_847528 ) ( IS-CRATE ?auto_847528 ) ( not ( = ?auto_847527 ?auto_847528 ) ) ( not ( = ?auto_847529 ?auto_847527 ) ) ( not ( = ?auto_847530 ?auto_847527 ) ) ( not ( = ?auto_847535 ?auto_847527 ) ) ( not ( = ?auto_847533 ?auto_847527 ) ) ( ON ?auto_847526 ?auto_847525 ) ( ON ?auto_847527 ?auto_847526 ) ( not ( = ?auto_847525 ?auto_847526 ) ) ( not ( = ?auto_847525 ?auto_847527 ) ) ( not ( = ?auto_847525 ?auto_847528 ) ) ( not ( = ?auto_847525 ?auto_847529 ) ) ( not ( = ?auto_847525 ?auto_847530 ) ) ( not ( = ?auto_847525 ?auto_847535 ) ) ( not ( = ?auto_847525 ?auto_847533 ) ) ( not ( = ?auto_847526 ?auto_847527 ) ) ( not ( = ?auto_847526 ?auto_847528 ) ) ( not ( = ?auto_847526 ?auto_847529 ) ) ( not ( = ?auto_847526 ?auto_847530 ) ) ( not ( = ?auto_847526 ?auto_847535 ) ) ( not ( = ?auto_847526 ?auto_847533 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_847528 ?auto_847529 ?auto_847530 )
      ( MAKE-5CRATE-VERIFY ?auto_847525 ?auto_847526 ?auto_847527 ?auto_847528 ?auto_847529 ?auto_847530 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848446 - SURFACE
      ?auto_848447 - SURFACE
      ?auto_848448 - SURFACE
      ?auto_848449 - SURFACE
      ?auto_848450 - SURFACE
      ?auto_848451 - SURFACE
      ?auto_848452 - SURFACE
    )
    :vars
    (
      ?auto_848454 - HOIST
      ?auto_848453 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_848454 ?auto_848453 ) ( SURFACE-AT ?auto_848451 ?auto_848453 ) ( CLEAR ?auto_848451 ) ( LIFTING ?auto_848454 ?auto_848452 ) ( IS-CRATE ?auto_848452 ) ( not ( = ?auto_848451 ?auto_848452 ) ) ( ON ?auto_848447 ?auto_848446 ) ( ON ?auto_848448 ?auto_848447 ) ( ON ?auto_848449 ?auto_848448 ) ( ON ?auto_848450 ?auto_848449 ) ( ON ?auto_848451 ?auto_848450 ) ( not ( = ?auto_848446 ?auto_848447 ) ) ( not ( = ?auto_848446 ?auto_848448 ) ) ( not ( = ?auto_848446 ?auto_848449 ) ) ( not ( = ?auto_848446 ?auto_848450 ) ) ( not ( = ?auto_848446 ?auto_848451 ) ) ( not ( = ?auto_848446 ?auto_848452 ) ) ( not ( = ?auto_848447 ?auto_848448 ) ) ( not ( = ?auto_848447 ?auto_848449 ) ) ( not ( = ?auto_848447 ?auto_848450 ) ) ( not ( = ?auto_848447 ?auto_848451 ) ) ( not ( = ?auto_848447 ?auto_848452 ) ) ( not ( = ?auto_848448 ?auto_848449 ) ) ( not ( = ?auto_848448 ?auto_848450 ) ) ( not ( = ?auto_848448 ?auto_848451 ) ) ( not ( = ?auto_848448 ?auto_848452 ) ) ( not ( = ?auto_848449 ?auto_848450 ) ) ( not ( = ?auto_848449 ?auto_848451 ) ) ( not ( = ?auto_848449 ?auto_848452 ) ) ( not ( = ?auto_848450 ?auto_848451 ) ) ( not ( = ?auto_848450 ?auto_848452 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_848451 ?auto_848452 )
      ( MAKE-6CRATE-VERIFY ?auto_848446 ?auto_848447 ?auto_848448 ?auto_848449 ?auto_848450 ?auto_848451 ?auto_848452 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848490 - SURFACE
      ?auto_848491 - SURFACE
      ?auto_848492 - SURFACE
      ?auto_848493 - SURFACE
      ?auto_848494 - SURFACE
      ?auto_848495 - SURFACE
      ?auto_848496 - SURFACE
    )
    :vars
    (
      ?auto_848497 - HOIST
      ?auto_848499 - PLACE
      ?auto_848498 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_848497 ?auto_848499 ) ( SURFACE-AT ?auto_848495 ?auto_848499 ) ( CLEAR ?auto_848495 ) ( IS-CRATE ?auto_848496 ) ( not ( = ?auto_848495 ?auto_848496 ) ) ( TRUCK-AT ?auto_848498 ?auto_848499 ) ( AVAILABLE ?auto_848497 ) ( IN ?auto_848496 ?auto_848498 ) ( ON ?auto_848495 ?auto_848494 ) ( not ( = ?auto_848494 ?auto_848495 ) ) ( not ( = ?auto_848494 ?auto_848496 ) ) ( ON ?auto_848491 ?auto_848490 ) ( ON ?auto_848492 ?auto_848491 ) ( ON ?auto_848493 ?auto_848492 ) ( ON ?auto_848494 ?auto_848493 ) ( not ( = ?auto_848490 ?auto_848491 ) ) ( not ( = ?auto_848490 ?auto_848492 ) ) ( not ( = ?auto_848490 ?auto_848493 ) ) ( not ( = ?auto_848490 ?auto_848494 ) ) ( not ( = ?auto_848490 ?auto_848495 ) ) ( not ( = ?auto_848490 ?auto_848496 ) ) ( not ( = ?auto_848491 ?auto_848492 ) ) ( not ( = ?auto_848491 ?auto_848493 ) ) ( not ( = ?auto_848491 ?auto_848494 ) ) ( not ( = ?auto_848491 ?auto_848495 ) ) ( not ( = ?auto_848491 ?auto_848496 ) ) ( not ( = ?auto_848492 ?auto_848493 ) ) ( not ( = ?auto_848492 ?auto_848494 ) ) ( not ( = ?auto_848492 ?auto_848495 ) ) ( not ( = ?auto_848492 ?auto_848496 ) ) ( not ( = ?auto_848493 ?auto_848494 ) ) ( not ( = ?auto_848493 ?auto_848495 ) ) ( not ( = ?auto_848493 ?auto_848496 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_848494 ?auto_848495 ?auto_848496 )
      ( MAKE-6CRATE-VERIFY ?auto_848490 ?auto_848491 ?auto_848492 ?auto_848493 ?auto_848494 ?auto_848495 ?auto_848496 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848541 - SURFACE
      ?auto_848542 - SURFACE
      ?auto_848543 - SURFACE
      ?auto_848544 - SURFACE
      ?auto_848545 - SURFACE
      ?auto_848546 - SURFACE
      ?auto_848547 - SURFACE
    )
    :vars
    (
      ?auto_848550 - HOIST
      ?auto_848549 - PLACE
      ?auto_848548 - TRUCK
      ?auto_848551 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_848550 ?auto_848549 ) ( SURFACE-AT ?auto_848546 ?auto_848549 ) ( CLEAR ?auto_848546 ) ( IS-CRATE ?auto_848547 ) ( not ( = ?auto_848546 ?auto_848547 ) ) ( AVAILABLE ?auto_848550 ) ( IN ?auto_848547 ?auto_848548 ) ( ON ?auto_848546 ?auto_848545 ) ( not ( = ?auto_848545 ?auto_848546 ) ) ( not ( = ?auto_848545 ?auto_848547 ) ) ( TRUCK-AT ?auto_848548 ?auto_848551 ) ( not ( = ?auto_848551 ?auto_848549 ) ) ( ON ?auto_848542 ?auto_848541 ) ( ON ?auto_848543 ?auto_848542 ) ( ON ?auto_848544 ?auto_848543 ) ( ON ?auto_848545 ?auto_848544 ) ( not ( = ?auto_848541 ?auto_848542 ) ) ( not ( = ?auto_848541 ?auto_848543 ) ) ( not ( = ?auto_848541 ?auto_848544 ) ) ( not ( = ?auto_848541 ?auto_848545 ) ) ( not ( = ?auto_848541 ?auto_848546 ) ) ( not ( = ?auto_848541 ?auto_848547 ) ) ( not ( = ?auto_848542 ?auto_848543 ) ) ( not ( = ?auto_848542 ?auto_848544 ) ) ( not ( = ?auto_848542 ?auto_848545 ) ) ( not ( = ?auto_848542 ?auto_848546 ) ) ( not ( = ?auto_848542 ?auto_848547 ) ) ( not ( = ?auto_848543 ?auto_848544 ) ) ( not ( = ?auto_848543 ?auto_848545 ) ) ( not ( = ?auto_848543 ?auto_848546 ) ) ( not ( = ?auto_848543 ?auto_848547 ) ) ( not ( = ?auto_848544 ?auto_848545 ) ) ( not ( = ?auto_848544 ?auto_848546 ) ) ( not ( = ?auto_848544 ?auto_848547 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_848545 ?auto_848546 ?auto_848547 )
      ( MAKE-6CRATE-VERIFY ?auto_848541 ?auto_848542 ?auto_848543 ?auto_848544 ?auto_848545 ?auto_848546 ?auto_848547 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848598 - SURFACE
      ?auto_848599 - SURFACE
      ?auto_848600 - SURFACE
      ?auto_848601 - SURFACE
      ?auto_848602 - SURFACE
      ?auto_848603 - SURFACE
      ?auto_848604 - SURFACE
    )
    :vars
    (
      ?auto_848608 - HOIST
      ?auto_848607 - PLACE
      ?auto_848609 - TRUCK
      ?auto_848606 - PLACE
      ?auto_848605 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_848608 ?auto_848607 ) ( SURFACE-AT ?auto_848603 ?auto_848607 ) ( CLEAR ?auto_848603 ) ( IS-CRATE ?auto_848604 ) ( not ( = ?auto_848603 ?auto_848604 ) ) ( AVAILABLE ?auto_848608 ) ( ON ?auto_848603 ?auto_848602 ) ( not ( = ?auto_848602 ?auto_848603 ) ) ( not ( = ?auto_848602 ?auto_848604 ) ) ( TRUCK-AT ?auto_848609 ?auto_848606 ) ( not ( = ?auto_848606 ?auto_848607 ) ) ( HOIST-AT ?auto_848605 ?auto_848606 ) ( LIFTING ?auto_848605 ?auto_848604 ) ( not ( = ?auto_848608 ?auto_848605 ) ) ( ON ?auto_848599 ?auto_848598 ) ( ON ?auto_848600 ?auto_848599 ) ( ON ?auto_848601 ?auto_848600 ) ( ON ?auto_848602 ?auto_848601 ) ( not ( = ?auto_848598 ?auto_848599 ) ) ( not ( = ?auto_848598 ?auto_848600 ) ) ( not ( = ?auto_848598 ?auto_848601 ) ) ( not ( = ?auto_848598 ?auto_848602 ) ) ( not ( = ?auto_848598 ?auto_848603 ) ) ( not ( = ?auto_848598 ?auto_848604 ) ) ( not ( = ?auto_848599 ?auto_848600 ) ) ( not ( = ?auto_848599 ?auto_848601 ) ) ( not ( = ?auto_848599 ?auto_848602 ) ) ( not ( = ?auto_848599 ?auto_848603 ) ) ( not ( = ?auto_848599 ?auto_848604 ) ) ( not ( = ?auto_848600 ?auto_848601 ) ) ( not ( = ?auto_848600 ?auto_848602 ) ) ( not ( = ?auto_848600 ?auto_848603 ) ) ( not ( = ?auto_848600 ?auto_848604 ) ) ( not ( = ?auto_848601 ?auto_848602 ) ) ( not ( = ?auto_848601 ?auto_848603 ) ) ( not ( = ?auto_848601 ?auto_848604 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_848602 ?auto_848603 ?auto_848604 )
      ( MAKE-6CRATE-VERIFY ?auto_848598 ?auto_848599 ?auto_848600 ?auto_848601 ?auto_848602 ?auto_848603 ?auto_848604 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848661 - SURFACE
      ?auto_848662 - SURFACE
      ?auto_848663 - SURFACE
      ?auto_848664 - SURFACE
      ?auto_848665 - SURFACE
      ?auto_848666 - SURFACE
      ?auto_848667 - SURFACE
    )
    :vars
    (
      ?auto_848670 - HOIST
      ?auto_848671 - PLACE
      ?auto_848668 - TRUCK
      ?auto_848669 - PLACE
      ?auto_848673 - HOIST
      ?auto_848672 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_848670 ?auto_848671 ) ( SURFACE-AT ?auto_848666 ?auto_848671 ) ( CLEAR ?auto_848666 ) ( IS-CRATE ?auto_848667 ) ( not ( = ?auto_848666 ?auto_848667 ) ) ( AVAILABLE ?auto_848670 ) ( ON ?auto_848666 ?auto_848665 ) ( not ( = ?auto_848665 ?auto_848666 ) ) ( not ( = ?auto_848665 ?auto_848667 ) ) ( TRUCK-AT ?auto_848668 ?auto_848669 ) ( not ( = ?auto_848669 ?auto_848671 ) ) ( HOIST-AT ?auto_848673 ?auto_848669 ) ( not ( = ?auto_848670 ?auto_848673 ) ) ( AVAILABLE ?auto_848673 ) ( SURFACE-AT ?auto_848667 ?auto_848669 ) ( ON ?auto_848667 ?auto_848672 ) ( CLEAR ?auto_848667 ) ( not ( = ?auto_848666 ?auto_848672 ) ) ( not ( = ?auto_848667 ?auto_848672 ) ) ( not ( = ?auto_848665 ?auto_848672 ) ) ( ON ?auto_848662 ?auto_848661 ) ( ON ?auto_848663 ?auto_848662 ) ( ON ?auto_848664 ?auto_848663 ) ( ON ?auto_848665 ?auto_848664 ) ( not ( = ?auto_848661 ?auto_848662 ) ) ( not ( = ?auto_848661 ?auto_848663 ) ) ( not ( = ?auto_848661 ?auto_848664 ) ) ( not ( = ?auto_848661 ?auto_848665 ) ) ( not ( = ?auto_848661 ?auto_848666 ) ) ( not ( = ?auto_848661 ?auto_848667 ) ) ( not ( = ?auto_848661 ?auto_848672 ) ) ( not ( = ?auto_848662 ?auto_848663 ) ) ( not ( = ?auto_848662 ?auto_848664 ) ) ( not ( = ?auto_848662 ?auto_848665 ) ) ( not ( = ?auto_848662 ?auto_848666 ) ) ( not ( = ?auto_848662 ?auto_848667 ) ) ( not ( = ?auto_848662 ?auto_848672 ) ) ( not ( = ?auto_848663 ?auto_848664 ) ) ( not ( = ?auto_848663 ?auto_848665 ) ) ( not ( = ?auto_848663 ?auto_848666 ) ) ( not ( = ?auto_848663 ?auto_848667 ) ) ( not ( = ?auto_848663 ?auto_848672 ) ) ( not ( = ?auto_848664 ?auto_848665 ) ) ( not ( = ?auto_848664 ?auto_848666 ) ) ( not ( = ?auto_848664 ?auto_848667 ) ) ( not ( = ?auto_848664 ?auto_848672 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_848665 ?auto_848666 ?auto_848667 )
      ( MAKE-6CRATE-VERIFY ?auto_848661 ?auto_848662 ?auto_848663 ?auto_848664 ?auto_848665 ?auto_848666 ?auto_848667 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848725 - SURFACE
      ?auto_848726 - SURFACE
      ?auto_848727 - SURFACE
      ?auto_848728 - SURFACE
      ?auto_848729 - SURFACE
      ?auto_848730 - SURFACE
      ?auto_848731 - SURFACE
    )
    :vars
    (
      ?auto_848733 - HOIST
      ?auto_848735 - PLACE
      ?auto_848736 - PLACE
      ?auto_848737 - HOIST
      ?auto_848734 - SURFACE
      ?auto_848732 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_848733 ?auto_848735 ) ( SURFACE-AT ?auto_848730 ?auto_848735 ) ( CLEAR ?auto_848730 ) ( IS-CRATE ?auto_848731 ) ( not ( = ?auto_848730 ?auto_848731 ) ) ( AVAILABLE ?auto_848733 ) ( ON ?auto_848730 ?auto_848729 ) ( not ( = ?auto_848729 ?auto_848730 ) ) ( not ( = ?auto_848729 ?auto_848731 ) ) ( not ( = ?auto_848736 ?auto_848735 ) ) ( HOIST-AT ?auto_848737 ?auto_848736 ) ( not ( = ?auto_848733 ?auto_848737 ) ) ( AVAILABLE ?auto_848737 ) ( SURFACE-AT ?auto_848731 ?auto_848736 ) ( ON ?auto_848731 ?auto_848734 ) ( CLEAR ?auto_848731 ) ( not ( = ?auto_848730 ?auto_848734 ) ) ( not ( = ?auto_848731 ?auto_848734 ) ) ( not ( = ?auto_848729 ?auto_848734 ) ) ( TRUCK-AT ?auto_848732 ?auto_848735 ) ( ON ?auto_848726 ?auto_848725 ) ( ON ?auto_848727 ?auto_848726 ) ( ON ?auto_848728 ?auto_848727 ) ( ON ?auto_848729 ?auto_848728 ) ( not ( = ?auto_848725 ?auto_848726 ) ) ( not ( = ?auto_848725 ?auto_848727 ) ) ( not ( = ?auto_848725 ?auto_848728 ) ) ( not ( = ?auto_848725 ?auto_848729 ) ) ( not ( = ?auto_848725 ?auto_848730 ) ) ( not ( = ?auto_848725 ?auto_848731 ) ) ( not ( = ?auto_848725 ?auto_848734 ) ) ( not ( = ?auto_848726 ?auto_848727 ) ) ( not ( = ?auto_848726 ?auto_848728 ) ) ( not ( = ?auto_848726 ?auto_848729 ) ) ( not ( = ?auto_848726 ?auto_848730 ) ) ( not ( = ?auto_848726 ?auto_848731 ) ) ( not ( = ?auto_848726 ?auto_848734 ) ) ( not ( = ?auto_848727 ?auto_848728 ) ) ( not ( = ?auto_848727 ?auto_848729 ) ) ( not ( = ?auto_848727 ?auto_848730 ) ) ( not ( = ?auto_848727 ?auto_848731 ) ) ( not ( = ?auto_848727 ?auto_848734 ) ) ( not ( = ?auto_848728 ?auto_848729 ) ) ( not ( = ?auto_848728 ?auto_848730 ) ) ( not ( = ?auto_848728 ?auto_848731 ) ) ( not ( = ?auto_848728 ?auto_848734 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_848729 ?auto_848730 ?auto_848731 )
      ( MAKE-6CRATE-VERIFY ?auto_848725 ?auto_848726 ?auto_848727 ?auto_848728 ?auto_848729 ?auto_848730 ?auto_848731 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848789 - SURFACE
      ?auto_848790 - SURFACE
      ?auto_848791 - SURFACE
      ?auto_848792 - SURFACE
      ?auto_848793 - SURFACE
      ?auto_848794 - SURFACE
      ?auto_848795 - SURFACE
    )
    :vars
    (
      ?auto_848800 - HOIST
      ?auto_848797 - PLACE
      ?auto_848801 - PLACE
      ?auto_848798 - HOIST
      ?auto_848796 - SURFACE
      ?auto_848799 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_848800 ?auto_848797 ) ( IS-CRATE ?auto_848795 ) ( not ( = ?auto_848794 ?auto_848795 ) ) ( not ( = ?auto_848793 ?auto_848794 ) ) ( not ( = ?auto_848793 ?auto_848795 ) ) ( not ( = ?auto_848801 ?auto_848797 ) ) ( HOIST-AT ?auto_848798 ?auto_848801 ) ( not ( = ?auto_848800 ?auto_848798 ) ) ( AVAILABLE ?auto_848798 ) ( SURFACE-AT ?auto_848795 ?auto_848801 ) ( ON ?auto_848795 ?auto_848796 ) ( CLEAR ?auto_848795 ) ( not ( = ?auto_848794 ?auto_848796 ) ) ( not ( = ?auto_848795 ?auto_848796 ) ) ( not ( = ?auto_848793 ?auto_848796 ) ) ( TRUCK-AT ?auto_848799 ?auto_848797 ) ( SURFACE-AT ?auto_848793 ?auto_848797 ) ( CLEAR ?auto_848793 ) ( LIFTING ?auto_848800 ?auto_848794 ) ( IS-CRATE ?auto_848794 ) ( ON ?auto_848790 ?auto_848789 ) ( ON ?auto_848791 ?auto_848790 ) ( ON ?auto_848792 ?auto_848791 ) ( ON ?auto_848793 ?auto_848792 ) ( not ( = ?auto_848789 ?auto_848790 ) ) ( not ( = ?auto_848789 ?auto_848791 ) ) ( not ( = ?auto_848789 ?auto_848792 ) ) ( not ( = ?auto_848789 ?auto_848793 ) ) ( not ( = ?auto_848789 ?auto_848794 ) ) ( not ( = ?auto_848789 ?auto_848795 ) ) ( not ( = ?auto_848789 ?auto_848796 ) ) ( not ( = ?auto_848790 ?auto_848791 ) ) ( not ( = ?auto_848790 ?auto_848792 ) ) ( not ( = ?auto_848790 ?auto_848793 ) ) ( not ( = ?auto_848790 ?auto_848794 ) ) ( not ( = ?auto_848790 ?auto_848795 ) ) ( not ( = ?auto_848790 ?auto_848796 ) ) ( not ( = ?auto_848791 ?auto_848792 ) ) ( not ( = ?auto_848791 ?auto_848793 ) ) ( not ( = ?auto_848791 ?auto_848794 ) ) ( not ( = ?auto_848791 ?auto_848795 ) ) ( not ( = ?auto_848791 ?auto_848796 ) ) ( not ( = ?auto_848792 ?auto_848793 ) ) ( not ( = ?auto_848792 ?auto_848794 ) ) ( not ( = ?auto_848792 ?auto_848795 ) ) ( not ( = ?auto_848792 ?auto_848796 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_848793 ?auto_848794 ?auto_848795 )
      ( MAKE-6CRATE-VERIFY ?auto_848789 ?auto_848790 ?auto_848791 ?auto_848792 ?auto_848793 ?auto_848794 ?auto_848795 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_848853 - SURFACE
      ?auto_848854 - SURFACE
      ?auto_848855 - SURFACE
      ?auto_848856 - SURFACE
      ?auto_848857 - SURFACE
      ?auto_848858 - SURFACE
      ?auto_848859 - SURFACE
    )
    :vars
    (
      ?auto_848860 - HOIST
      ?auto_848864 - PLACE
      ?auto_848865 - PLACE
      ?auto_848863 - HOIST
      ?auto_848862 - SURFACE
      ?auto_848861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_848860 ?auto_848864 ) ( IS-CRATE ?auto_848859 ) ( not ( = ?auto_848858 ?auto_848859 ) ) ( not ( = ?auto_848857 ?auto_848858 ) ) ( not ( = ?auto_848857 ?auto_848859 ) ) ( not ( = ?auto_848865 ?auto_848864 ) ) ( HOIST-AT ?auto_848863 ?auto_848865 ) ( not ( = ?auto_848860 ?auto_848863 ) ) ( AVAILABLE ?auto_848863 ) ( SURFACE-AT ?auto_848859 ?auto_848865 ) ( ON ?auto_848859 ?auto_848862 ) ( CLEAR ?auto_848859 ) ( not ( = ?auto_848858 ?auto_848862 ) ) ( not ( = ?auto_848859 ?auto_848862 ) ) ( not ( = ?auto_848857 ?auto_848862 ) ) ( TRUCK-AT ?auto_848861 ?auto_848864 ) ( SURFACE-AT ?auto_848857 ?auto_848864 ) ( CLEAR ?auto_848857 ) ( IS-CRATE ?auto_848858 ) ( AVAILABLE ?auto_848860 ) ( IN ?auto_848858 ?auto_848861 ) ( ON ?auto_848854 ?auto_848853 ) ( ON ?auto_848855 ?auto_848854 ) ( ON ?auto_848856 ?auto_848855 ) ( ON ?auto_848857 ?auto_848856 ) ( not ( = ?auto_848853 ?auto_848854 ) ) ( not ( = ?auto_848853 ?auto_848855 ) ) ( not ( = ?auto_848853 ?auto_848856 ) ) ( not ( = ?auto_848853 ?auto_848857 ) ) ( not ( = ?auto_848853 ?auto_848858 ) ) ( not ( = ?auto_848853 ?auto_848859 ) ) ( not ( = ?auto_848853 ?auto_848862 ) ) ( not ( = ?auto_848854 ?auto_848855 ) ) ( not ( = ?auto_848854 ?auto_848856 ) ) ( not ( = ?auto_848854 ?auto_848857 ) ) ( not ( = ?auto_848854 ?auto_848858 ) ) ( not ( = ?auto_848854 ?auto_848859 ) ) ( not ( = ?auto_848854 ?auto_848862 ) ) ( not ( = ?auto_848855 ?auto_848856 ) ) ( not ( = ?auto_848855 ?auto_848857 ) ) ( not ( = ?auto_848855 ?auto_848858 ) ) ( not ( = ?auto_848855 ?auto_848859 ) ) ( not ( = ?auto_848855 ?auto_848862 ) ) ( not ( = ?auto_848856 ?auto_848857 ) ) ( not ( = ?auto_848856 ?auto_848858 ) ) ( not ( = ?auto_848856 ?auto_848859 ) ) ( not ( = ?auto_848856 ?auto_848862 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_848857 ?auto_848858 ?auto_848859 )
      ( MAKE-6CRATE-VERIFY ?auto_848853 ?auto_848854 ?auto_848855 ?auto_848856 ?auto_848857 ?auto_848858 ?auto_848859 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_849323 - SURFACE
      ?auto_849324 - SURFACE
    )
    :vars
    (
      ?auto_849328 - HOIST
      ?auto_849327 - PLACE
      ?auto_849331 - SURFACE
      ?auto_849325 - PLACE
      ?auto_849326 - HOIST
      ?auto_849329 - SURFACE
      ?auto_849330 - TRUCK
      ?auto_849332 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_849328 ?auto_849327 ) ( SURFACE-AT ?auto_849323 ?auto_849327 ) ( CLEAR ?auto_849323 ) ( IS-CRATE ?auto_849324 ) ( not ( = ?auto_849323 ?auto_849324 ) ) ( ON ?auto_849323 ?auto_849331 ) ( not ( = ?auto_849331 ?auto_849323 ) ) ( not ( = ?auto_849331 ?auto_849324 ) ) ( not ( = ?auto_849325 ?auto_849327 ) ) ( HOIST-AT ?auto_849326 ?auto_849325 ) ( not ( = ?auto_849328 ?auto_849326 ) ) ( AVAILABLE ?auto_849326 ) ( SURFACE-AT ?auto_849324 ?auto_849325 ) ( ON ?auto_849324 ?auto_849329 ) ( CLEAR ?auto_849324 ) ( not ( = ?auto_849323 ?auto_849329 ) ) ( not ( = ?auto_849324 ?auto_849329 ) ) ( not ( = ?auto_849331 ?auto_849329 ) ) ( TRUCK-AT ?auto_849330 ?auto_849327 ) ( LIFTING ?auto_849328 ?auto_849332 ) ( IS-CRATE ?auto_849332 ) ( not ( = ?auto_849323 ?auto_849332 ) ) ( not ( = ?auto_849324 ?auto_849332 ) ) ( not ( = ?auto_849331 ?auto_849332 ) ) ( not ( = ?auto_849329 ?auto_849332 ) ) )
    :subtasks
    ( ( !LOAD ?auto_849328 ?auto_849332 ?auto_849330 ?auto_849327 )
      ( MAKE-1CRATE ?auto_849323 ?auto_849324 )
      ( MAKE-1CRATE-VERIFY ?auto_849323 ?auto_849324 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_850802 - SURFACE
      ?auto_850803 - SURFACE
      ?auto_850804 - SURFACE
      ?auto_850805 - SURFACE
      ?auto_850806 - SURFACE
      ?auto_850807 - SURFACE
      ?auto_850808 - SURFACE
      ?auto_850809 - SURFACE
    )
    :vars
    (
      ?auto_850810 - HOIST
      ?auto_850811 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_850810 ?auto_850811 ) ( SURFACE-AT ?auto_850808 ?auto_850811 ) ( CLEAR ?auto_850808 ) ( LIFTING ?auto_850810 ?auto_850809 ) ( IS-CRATE ?auto_850809 ) ( not ( = ?auto_850808 ?auto_850809 ) ) ( ON ?auto_850803 ?auto_850802 ) ( ON ?auto_850804 ?auto_850803 ) ( ON ?auto_850805 ?auto_850804 ) ( ON ?auto_850806 ?auto_850805 ) ( ON ?auto_850807 ?auto_850806 ) ( ON ?auto_850808 ?auto_850807 ) ( not ( = ?auto_850802 ?auto_850803 ) ) ( not ( = ?auto_850802 ?auto_850804 ) ) ( not ( = ?auto_850802 ?auto_850805 ) ) ( not ( = ?auto_850802 ?auto_850806 ) ) ( not ( = ?auto_850802 ?auto_850807 ) ) ( not ( = ?auto_850802 ?auto_850808 ) ) ( not ( = ?auto_850802 ?auto_850809 ) ) ( not ( = ?auto_850803 ?auto_850804 ) ) ( not ( = ?auto_850803 ?auto_850805 ) ) ( not ( = ?auto_850803 ?auto_850806 ) ) ( not ( = ?auto_850803 ?auto_850807 ) ) ( not ( = ?auto_850803 ?auto_850808 ) ) ( not ( = ?auto_850803 ?auto_850809 ) ) ( not ( = ?auto_850804 ?auto_850805 ) ) ( not ( = ?auto_850804 ?auto_850806 ) ) ( not ( = ?auto_850804 ?auto_850807 ) ) ( not ( = ?auto_850804 ?auto_850808 ) ) ( not ( = ?auto_850804 ?auto_850809 ) ) ( not ( = ?auto_850805 ?auto_850806 ) ) ( not ( = ?auto_850805 ?auto_850807 ) ) ( not ( = ?auto_850805 ?auto_850808 ) ) ( not ( = ?auto_850805 ?auto_850809 ) ) ( not ( = ?auto_850806 ?auto_850807 ) ) ( not ( = ?auto_850806 ?auto_850808 ) ) ( not ( = ?auto_850806 ?auto_850809 ) ) ( not ( = ?auto_850807 ?auto_850808 ) ) ( not ( = ?auto_850807 ?auto_850809 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_850808 ?auto_850809 )
      ( MAKE-7CRATE-VERIFY ?auto_850802 ?auto_850803 ?auto_850804 ?auto_850805 ?auto_850806 ?auto_850807 ?auto_850808 ?auto_850809 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_850857 - SURFACE
      ?auto_850858 - SURFACE
      ?auto_850859 - SURFACE
      ?auto_850860 - SURFACE
      ?auto_850861 - SURFACE
      ?auto_850862 - SURFACE
      ?auto_850863 - SURFACE
      ?auto_850864 - SURFACE
    )
    :vars
    (
      ?auto_850866 - HOIST
      ?auto_850865 - PLACE
      ?auto_850867 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_850866 ?auto_850865 ) ( SURFACE-AT ?auto_850863 ?auto_850865 ) ( CLEAR ?auto_850863 ) ( IS-CRATE ?auto_850864 ) ( not ( = ?auto_850863 ?auto_850864 ) ) ( TRUCK-AT ?auto_850867 ?auto_850865 ) ( AVAILABLE ?auto_850866 ) ( IN ?auto_850864 ?auto_850867 ) ( ON ?auto_850863 ?auto_850862 ) ( not ( = ?auto_850862 ?auto_850863 ) ) ( not ( = ?auto_850862 ?auto_850864 ) ) ( ON ?auto_850858 ?auto_850857 ) ( ON ?auto_850859 ?auto_850858 ) ( ON ?auto_850860 ?auto_850859 ) ( ON ?auto_850861 ?auto_850860 ) ( ON ?auto_850862 ?auto_850861 ) ( not ( = ?auto_850857 ?auto_850858 ) ) ( not ( = ?auto_850857 ?auto_850859 ) ) ( not ( = ?auto_850857 ?auto_850860 ) ) ( not ( = ?auto_850857 ?auto_850861 ) ) ( not ( = ?auto_850857 ?auto_850862 ) ) ( not ( = ?auto_850857 ?auto_850863 ) ) ( not ( = ?auto_850857 ?auto_850864 ) ) ( not ( = ?auto_850858 ?auto_850859 ) ) ( not ( = ?auto_850858 ?auto_850860 ) ) ( not ( = ?auto_850858 ?auto_850861 ) ) ( not ( = ?auto_850858 ?auto_850862 ) ) ( not ( = ?auto_850858 ?auto_850863 ) ) ( not ( = ?auto_850858 ?auto_850864 ) ) ( not ( = ?auto_850859 ?auto_850860 ) ) ( not ( = ?auto_850859 ?auto_850861 ) ) ( not ( = ?auto_850859 ?auto_850862 ) ) ( not ( = ?auto_850859 ?auto_850863 ) ) ( not ( = ?auto_850859 ?auto_850864 ) ) ( not ( = ?auto_850860 ?auto_850861 ) ) ( not ( = ?auto_850860 ?auto_850862 ) ) ( not ( = ?auto_850860 ?auto_850863 ) ) ( not ( = ?auto_850860 ?auto_850864 ) ) ( not ( = ?auto_850861 ?auto_850862 ) ) ( not ( = ?auto_850861 ?auto_850863 ) ) ( not ( = ?auto_850861 ?auto_850864 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_850862 ?auto_850863 ?auto_850864 )
      ( MAKE-7CRATE-VERIFY ?auto_850857 ?auto_850858 ?auto_850859 ?auto_850860 ?auto_850861 ?auto_850862 ?auto_850863 ?auto_850864 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_850920 - SURFACE
      ?auto_850921 - SURFACE
      ?auto_850922 - SURFACE
      ?auto_850923 - SURFACE
      ?auto_850924 - SURFACE
      ?auto_850925 - SURFACE
      ?auto_850926 - SURFACE
      ?auto_850927 - SURFACE
    )
    :vars
    (
      ?auto_850930 - HOIST
      ?auto_850928 - PLACE
      ?auto_850929 - TRUCK
      ?auto_850931 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_850930 ?auto_850928 ) ( SURFACE-AT ?auto_850926 ?auto_850928 ) ( CLEAR ?auto_850926 ) ( IS-CRATE ?auto_850927 ) ( not ( = ?auto_850926 ?auto_850927 ) ) ( AVAILABLE ?auto_850930 ) ( IN ?auto_850927 ?auto_850929 ) ( ON ?auto_850926 ?auto_850925 ) ( not ( = ?auto_850925 ?auto_850926 ) ) ( not ( = ?auto_850925 ?auto_850927 ) ) ( TRUCK-AT ?auto_850929 ?auto_850931 ) ( not ( = ?auto_850931 ?auto_850928 ) ) ( ON ?auto_850921 ?auto_850920 ) ( ON ?auto_850922 ?auto_850921 ) ( ON ?auto_850923 ?auto_850922 ) ( ON ?auto_850924 ?auto_850923 ) ( ON ?auto_850925 ?auto_850924 ) ( not ( = ?auto_850920 ?auto_850921 ) ) ( not ( = ?auto_850920 ?auto_850922 ) ) ( not ( = ?auto_850920 ?auto_850923 ) ) ( not ( = ?auto_850920 ?auto_850924 ) ) ( not ( = ?auto_850920 ?auto_850925 ) ) ( not ( = ?auto_850920 ?auto_850926 ) ) ( not ( = ?auto_850920 ?auto_850927 ) ) ( not ( = ?auto_850921 ?auto_850922 ) ) ( not ( = ?auto_850921 ?auto_850923 ) ) ( not ( = ?auto_850921 ?auto_850924 ) ) ( not ( = ?auto_850921 ?auto_850925 ) ) ( not ( = ?auto_850921 ?auto_850926 ) ) ( not ( = ?auto_850921 ?auto_850927 ) ) ( not ( = ?auto_850922 ?auto_850923 ) ) ( not ( = ?auto_850922 ?auto_850924 ) ) ( not ( = ?auto_850922 ?auto_850925 ) ) ( not ( = ?auto_850922 ?auto_850926 ) ) ( not ( = ?auto_850922 ?auto_850927 ) ) ( not ( = ?auto_850923 ?auto_850924 ) ) ( not ( = ?auto_850923 ?auto_850925 ) ) ( not ( = ?auto_850923 ?auto_850926 ) ) ( not ( = ?auto_850923 ?auto_850927 ) ) ( not ( = ?auto_850924 ?auto_850925 ) ) ( not ( = ?auto_850924 ?auto_850926 ) ) ( not ( = ?auto_850924 ?auto_850927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_850925 ?auto_850926 ?auto_850927 )
      ( MAKE-7CRATE-VERIFY ?auto_850920 ?auto_850921 ?auto_850922 ?auto_850923 ?auto_850924 ?auto_850925 ?auto_850926 ?auto_850927 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_850990 - SURFACE
      ?auto_850991 - SURFACE
      ?auto_850992 - SURFACE
      ?auto_850993 - SURFACE
      ?auto_850994 - SURFACE
      ?auto_850995 - SURFACE
      ?auto_850996 - SURFACE
      ?auto_850997 - SURFACE
    )
    :vars
    (
      ?auto_851000 - HOIST
      ?auto_851002 - PLACE
      ?auto_850998 - TRUCK
      ?auto_850999 - PLACE
      ?auto_851001 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_851000 ?auto_851002 ) ( SURFACE-AT ?auto_850996 ?auto_851002 ) ( CLEAR ?auto_850996 ) ( IS-CRATE ?auto_850997 ) ( not ( = ?auto_850996 ?auto_850997 ) ) ( AVAILABLE ?auto_851000 ) ( ON ?auto_850996 ?auto_850995 ) ( not ( = ?auto_850995 ?auto_850996 ) ) ( not ( = ?auto_850995 ?auto_850997 ) ) ( TRUCK-AT ?auto_850998 ?auto_850999 ) ( not ( = ?auto_850999 ?auto_851002 ) ) ( HOIST-AT ?auto_851001 ?auto_850999 ) ( LIFTING ?auto_851001 ?auto_850997 ) ( not ( = ?auto_851000 ?auto_851001 ) ) ( ON ?auto_850991 ?auto_850990 ) ( ON ?auto_850992 ?auto_850991 ) ( ON ?auto_850993 ?auto_850992 ) ( ON ?auto_850994 ?auto_850993 ) ( ON ?auto_850995 ?auto_850994 ) ( not ( = ?auto_850990 ?auto_850991 ) ) ( not ( = ?auto_850990 ?auto_850992 ) ) ( not ( = ?auto_850990 ?auto_850993 ) ) ( not ( = ?auto_850990 ?auto_850994 ) ) ( not ( = ?auto_850990 ?auto_850995 ) ) ( not ( = ?auto_850990 ?auto_850996 ) ) ( not ( = ?auto_850990 ?auto_850997 ) ) ( not ( = ?auto_850991 ?auto_850992 ) ) ( not ( = ?auto_850991 ?auto_850993 ) ) ( not ( = ?auto_850991 ?auto_850994 ) ) ( not ( = ?auto_850991 ?auto_850995 ) ) ( not ( = ?auto_850991 ?auto_850996 ) ) ( not ( = ?auto_850991 ?auto_850997 ) ) ( not ( = ?auto_850992 ?auto_850993 ) ) ( not ( = ?auto_850992 ?auto_850994 ) ) ( not ( = ?auto_850992 ?auto_850995 ) ) ( not ( = ?auto_850992 ?auto_850996 ) ) ( not ( = ?auto_850992 ?auto_850997 ) ) ( not ( = ?auto_850993 ?auto_850994 ) ) ( not ( = ?auto_850993 ?auto_850995 ) ) ( not ( = ?auto_850993 ?auto_850996 ) ) ( not ( = ?auto_850993 ?auto_850997 ) ) ( not ( = ?auto_850994 ?auto_850995 ) ) ( not ( = ?auto_850994 ?auto_850996 ) ) ( not ( = ?auto_850994 ?auto_850997 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_850995 ?auto_850996 ?auto_850997 )
      ( MAKE-7CRATE-VERIFY ?auto_850990 ?auto_850991 ?auto_850992 ?auto_850993 ?auto_850994 ?auto_850995 ?auto_850996 ?auto_850997 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_851067 - SURFACE
      ?auto_851068 - SURFACE
      ?auto_851069 - SURFACE
      ?auto_851070 - SURFACE
      ?auto_851071 - SURFACE
      ?auto_851072 - SURFACE
      ?auto_851073 - SURFACE
      ?auto_851074 - SURFACE
    )
    :vars
    (
      ?auto_851078 - HOIST
      ?auto_851076 - PLACE
      ?auto_851080 - TRUCK
      ?auto_851075 - PLACE
      ?auto_851079 - HOIST
      ?auto_851077 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_851078 ?auto_851076 ) ( SURFACE-AT ?auto_851073 ?auto_851076 ) ( CLEAR ?auto_851073 ) ( IS-CRATE ?auto_851074 ) ( not ( = ?auto_851073 ?auto_851074 ) ) ( AVAILABLE ?auto_851078 ) ( ON ?auto_851073 ?auto_851072 ) ( not ( = ?auto_851072 ?auto_851073 ) ) ( not ( = ?auto_851072 ?auto_851074 ) ) ( TRUCK-AT ?auto_851080 ?auto_851075 ) ( not ( = ?auto_851075 ?auto_851076 ) ) ( HOIST-AT ?auto_851079 ?auto_851075 ) ( not ( = ?auto_851078 ?auto_851079 ) ) ( AVAILABLE ?auto_851079 ) ( SURFACE-AT ?auto_851074 ?auto_851075 ) ( ON ?auto_851074 ?auto_851077 ) ( CLEAR ?auto_851074 ) ( not ( = ?auto_851073 ?auto_851077 ) ) ( not ( = ?auto_851074 ?auto_851077 ) ) ( not ( = ?auto_851072 ?auto_851077 ) ) ( ON ?auto_851068 ?auto_851067 ) ( ON ?auto_851069 ?auto_851068 ) ( ON ?auto_851070 ?auto_851069 ) ( ON ?auto_851071 ?auto_851070 ) ( ON ?auto_851072 ?auto_851071 ) ( not ( = ?auto_851067 ?auto_851068 ) ) ( not ( = ?auto_851067 ?auto_851069 ) ) ( not ( = ?auto_851067 ?auto_851070 ) ) ( not ( = ?auto_851067 ?auto_851071 ) ) ( not ( = ?auto_851067 ?auto_851072 ) ) ( not ( = ?auto_851067 ?auto_851073 ) ) ( not ( = ?auto_851067 ?auto_851074 ) ) ( not ( = ?auto_851067 ?auto_851077 ) ) ( not ( = ?auto_851068 ?auto_851069 ) ) ( not ( = ?auto_851068 ?auto_851070 ) ) ( not ( = ?auto_851068 ?auto_851071 ) ) ( not ( = ?auto_851068 ?auto_851072 ) ) ( not ( = ?auto_851068 ?auto_851073 ) ) ( not ( = ?auto_851068 ?auto_851074 ) ) ( not ( = ?auto_851068 ?auto_851077 ) ) ( not ( = ?auto_851069 ?auto_851070 ) ) ( not ( = ?auto_851069 ?auto_851071 ) ) ( not ( = ?auto_851069 ?auto_851072 ) ) ( not ( = ?auto_851069 ?auto_851073 ) ) ( not ( = ?auto_851069 ?auto_851074 ) ) ( not ( = ?auto_851069 ?auto_851077 ) ) ( not ( = ?auto_851070 ?auto_851071 ) ) ( not ( = ?auto_851070 ?auto_851072 ) ) ( not ( = ?auto_851070 ?auto_851073 ) ) ( not ( = ?auto_851070 ?auto_851074 ) ) ( not ( = ?auto_851070 ?auto_851077 ) ) ( not ( = ?auto_851071 ?auto_851072 ) ) ( not ( = ?auto_851071 ?auto_851073 ) ) ( not ( = ?auto_851071 ?auto_851074 ) ) ( not ( = ?auto_851071 ?auto_851077 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_851072 ?auto_851073 ?auto_851074 )
      ( MAKE-7CRATE-VERIFY ?auto_851067 ?auto_851068 ?auto_851069 ?auto_851070 ?auto_851071 ?auto_851072 ?auto_851073 ?auto_851074 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_851145 - SURFACE
      ?auto_851146 - SURFACE
      ?auto_851147 - SURFACE
      ?auto_851148 - SURFACE
      ?auto_851149 - SURFACE
      ?auto_851150 - SURFACE
      ?auto_851151 - SURFACE
      ?auto_851152 - SURFACE
    )
    :vars
    (
      ?auto_851153 - HOIST
      ?auto_851155 - PLACE
      ?auto_851154 - PLACE
      ?auto_851156 - HOIST
      ?auto_851157 - SURFACE
      ?auto_851158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_851153 ?auto_851155 ) ( SURFACE-AT ?auto_851151 ?auto_851155 ) ( CLEAR ?auto_851151 ) ( IS-CRATE ?auto_851152 ) ( not ( = ?auto_851151 ?auto_851152 ) ) ( AVAILABLE ?auto_851153 ) ( ON ?auto_851151 ?auto_851150 ) ( not ( = ?auto_851150 ?auto_851151 ) ) ( not ( = ?auto_851150 ?auto_851152 ) ) ( not ( = ?auto_851154 ?auto_851155 ) ) ( HOIST-AT ?auto_851156 ?auto_851154 ) ( not ( = ?auto_851153 ?auto_851156 ) ) ( AVAILABLE ?auto_851156 ) ( SURFACE-AT ?auto_851152 ?auto_851154 ) ( ON ?auto_851152 ?auto_851157 ) ( CLEAR ?auto_851152 ) ( not ( = ?auto_851151 ?auto_851157 ) ) ( not ( = ?auto_851152 ?auto_851157 ) ) ( not ( = ?auto_851150 ?auto_851157 ) ) ( TRUCK-AT ?auto_851158 ?auto_851155 ) ( ON ?auto_851146 ?auto_851145 ) ( ON ?auto_851147 ?auto_851146 ) ( ON ?auto_851148 ?auto_851147 ) ( ON ?auto_851149 ?auto_851148 ) ( ON ?auto_851150 ?auto_851149 ) ( not ( = ?auto_851145 ?auto_851146 ) ) ( not ( = ?auto_851145 ?auto_851147 ) ) ( not ( = ?auto_851145 ?auto_851148 ) ) ( not ( = ?auto_851145 ?auto_851149 ) ) ( not ( = ?auto_851145 ?auto_851150 ) ) ( not ( = ?auto_851145 ?auto_851151 ) ) ( not ( = ?auto_851145 ?auto_851152 ) ) ( not ( = ?auto_851145 ?auto_851157 ) ) ( not ( = ?auto_851146 ?auto_851147 ) ) ( not ( = ?auto_851146 ?auto_851148 ) ) ( not ( = ?auto_851146 ?auto_851149 ) ) ( not ( = ?auto_851146 ?auto_851150 ) ) ( not ( = ?auto_851146 ?auto_851151 ) ) ( not ( = ?auto_851146 ?auto_851152 ) ) ( not ( = ?auto_851146 ?auto_851157 ) ) ( not ( = ?auto_851147 ?auto_851148 ) ) ( not ( = ?auto_851147 ?auto_851149 ) ) ( not ( = ?auto_851147 ?auto_851150 ) ) ( not ( = ?auto_851147 ?auto_851151 ) ) ( not ( = ?auto_851147 ?auto_851152 ) ) ( not ( = ?auto_851147 ?auto_851157 ) ) ( not ( = ?auto_851148 ?auto_851149 ) ) ( not ( = ?auto_851148 ?auto_851150 ) ) ( not ( = ?auto_851148 ?auto_851151 ) ) ( not ( = ?auto_851148 ?auto_851152 ) ) ( not ( = ?auto_851148 ?auto_851157 ) ) ( not ( = ?auto_851149 ?auto_851150 ) ) ( not ( = ?auto_851149 ?auto_851151 ) ) ( not ( = ?auto_851149 ?auto_851152 ) ) ( not ( = ?auto_851149 ?auto_851157 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_851150 ?auto_851151 ?auto_851152 )
      ( MAKE-7CRATE-VERIFY ?auto_851145 ?auto_851146 ?auto_851147 ?auto_851148 ?auto_851149 ?auto_851150 ?auto_851151 ?auto_851152 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_851223 - SURFACE
      ?auto_851224 - SURFACE
      ?auto_851225 - SURFACE
      ?auto_851226 - SURFACE
      ?auto_851227 - SURFACE
      ?auto_851228 - SURFACE
      ?auto_851229 - SURFACE
      ?auto_851230 - SURFACE
    )
    :vars
    (
      ?auto_851235 - HOIST
      ?auto_851236 - PLACE
      ?auto_851233 - PLACE
      ?auto_851231 - HOIST
      ?auto_851234 - SURFACE
      ?auto_851232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_851235 ?auto_851236 ) ( IS-CRATE ?auto_851230 ) ( not ( = ?auto_851229 ?auto_851230 ) ) ( not ( = ?auto_851228 ?auto_851229 ) ) ( not ( = ?auto_851228 ?auto_851230 ) ) ( not ( = ?auto_851233 ?auto_851236 ) ) ( HOIST-AT ?auto_851231 ?auto_851233 ) ( not ( = ?auto_851235 ?auto_851231 ) ) ( AVAILABLE ?auto_851231 ) ( SURFACE-AT ?auto_851230 ?auto_851233 ) ( ON ?auto_851230 ?auto_851234 ) ( CLEAR ?auto_851230 ) ( not ( = ?auto_851229 ?auto_851234 ) ) ( not ( = ?auto_851230 ?auto_851234 ) ) ( not ( = ?auto_851228 ?auto_851234 ) ) ( TRUCK-AT ?auto_851232 ?auto_851236 ) ( SURFACE-AT ?auto_851228 ?auto_851236 ) ( CLEAR ?auto_851228 ) ( LIFTING ?auto_851235 ?auto_851229 ) ( IS-CRATE ?auto_851229 ) ( ON ?auto_851224 ?auto_851223 ) ( ON ?auto_851225 ?auto_851224 ) ( ON ?auto_851226 ?auto_851225 ) ( ON ?auto_851227 ?auto_851226 ) ( ON ?auto_851228 ?auto_851227 ) ( not ( = ?auto_851223 ?auto_851224 ) ) ( not ( = ?auto_851223 ?auto_851225 ) ) ( not ( = ?auto_851223 ?auto_851226 ) ) ( not ( = ?auto_851223 ?auto_851227 ) ) ( not ( = ?auto_851223 ?auto_851228 ) ) ( not ( = ?auto_851223 ?auto_851229 ) ) ( not ( = ?auto_851223 ?auto_851230 ) ) ( not ( = ?auto_851223 ?auto_851234 ) ) ( not ( = ?auto_851224 ?auto_851225 ) ) ( not ( = ?auto_851224 ?auto_851226 ) ) ( not ( = ?auto_851224 ?auto_851227 ) ) ( not ( = ?auto_851224 ?auto_851228 ) ) ( not ( = ?auto_851224 ?auto_851229 ) ) ( not ( = ?auto_851224 ?auto_851230 ) ) ( not ( = ?auto_851224 ?auto_851234 ) ) ( not ( = ?auto_851225 ?auto_851226 ) ) ( not ( = ?auto_851225 ?auto_851227 ) ) ( not ( = ?auto_851225 ?auto_851228 ) ) ( not ( = ?auto_851225 ?auto_851229 ) ) ( not ( = ?auto_851225 ?auto_851230 ) ) ( not ( = ?auto_851225 ?auto_851234 ) ) ( not ( = ?auto_851226 ?auto_851227 ) ) ( not ( = ?auto_851226 ?auto_851228 ) ) ( not ( = ?auto_851226 ?auto_851229 ) ) ( not ( = ?auto_851226 ?auto_851230 ) ) ( not ( = ?auto_851226 ?auto_851234 ) ) ( not ( = ?auto_851227 ?auto_851228 ) ) ( not ( = ?auto_851227 ?auto_851229 ) ) ( not ( = ?auto_851227 ?auto_851230 ) ) ( not ( = ?auto_851227 ?auto_851234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_851228 ?auto_851229 ?auto_851230 )
      ( MAKE-7CRATE-VERIFY ?auto_851223 ?auto_851224 ?auto_851225 ?auto_851226 ?auto_851227 ?auto_851228 ?auto_851229 ?auto_851230 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_851301 - SURFACE
      ?auto_851302 - SURFACE
      ?auto_851303 - SURFACE
      ?auto_851304 - SURFACE
      ?auto_851305 - SURFACE
      ?auto_851306 - SURFACE
      ?auto_851307 - SURFACE
      ?auto_851308 - SURFACE
    )
    :vars
    (
      ?auto_851309 - HOIST
      ?auto_851313 - PLACE
      ?auto_851312 - PLACE
      ?auto_851314 - HOIST
      ?auto_851311 - SURFACE
      ?auto_851310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_851309 ?auto_851313 ) ( IS-CRATE ?auto_851308 ) ( not ( = ?auto_851307 ?auto_851308 ) ) ( not ( = ?auto_851306 ?auto_851307 ) ) ( not ( = ?auto_851306 ?auto_851308 ) ) ( not ( = ?auto_851312 ?auto_851313 ) ) ( HOIST-AT ?auto_851314 ?auto_851312 ) ( not ( = ?auto_851309 ?auto_851314 ) ) ( AVAILABLE ?auto_851314 ) ( SURFACE-AT ?auto_851308 ?auto_851312 ) ( ON ?auto_851308 ?auto_851311 ) ( CLEAR ?auto_851308 ) ( not ( = ?auto_851307 ?auto_851311 ) ) ( not ( = ?auto_851308 ?auto_851311 ) ) ( not ( = ?auto_851306 ?auto_851311 ) ) ( TRUCK-AT ?auto_851310 ?auto_851313 ) ( SURFACE-AT ?auto_851306 ?auto_851313 ) ( CLEAR ?auto_851306 ) ( IS-CRATE ?auto_851307 ) ( AVAILABLE ?auto_851309 ) ( IN ?auto_851307 ?auto_851310 ) ( ON ?auto_851302 ?auto_851301 ) ( ON ?auto_851303 ?auto_851302 ) ( ON ?auto_851304 ?auto_851303 ) ( ON ?auto_851305 ?auto_851304 ) ( ON ?auto_851306 ?auto_851305 ) ( not ( = ?auto_851301 ?auto_851302 ) ) ( not ( = ?auto_851301 ?auto_851303 ) ) ( not ( = ?auto_851301 ?auto_851304 ) ) ( not ( = ?auto_851301 ?auto_851305 ) ) ( not ( = ?auto_851301 ?auto_851306 ) ) ( not ( = ?auto_851301 ?auto_851307 ) ) ( not ( = ?auto_851301 ?auto_851308 ) ) ( not ( = ?auto_851301 ?auto_851311 ) ) ( not ( = ?auto_851302 ?auto_851303 ) ) ( not ( = ?auto_851302 ?auto_851304 ) ) ( not ( = ?auto_851302 ?auto_851305 ) ) ( not ( = ?auto_851302 ?auto_851306 ) ) ( not ( = ?auto_851302 ?auto_851307 ) ) ( not ( = ?auto_851302 ?auto_851308 ) ) ( not ( = ?auto_851302 ?auto_851311 ) ) ( not ( = ?auto_851303 ?auto_851304 ) ) ( not ( = ?auto_851303 ?auto_851305 ) ) ( not ( = ?auto_851303 ?auto_851306 ) ) ( not ( = ?auto_851303 ?auto_851307 ) ) ( not ( = ?auto_851303 ?auto_851308 ) ) ( not ( = ?auto_851303 ?auto_851311 ) ) ( not ( = ?auto_851304 ?auto_851305 ) ) ( not ( = ?auto_851304 ?auto_851306 ) ) ( not ( = ?auto_851304 ?auto_851307 ) ) ( not ( = ?auto_851304 ?auto_851308 ) ) ( not ( = ?auto_851304 ?auto_851311 ) ) ( not ( = ?auto_851305 ?auto_851306 ) ) ( not ( = ?auto_851305 ?auto_851307 ) ) ( not ( = ?auto_851305 ?auto_851308 ) ) ( not ( = ?auto_851305 ?auto_851311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_851306 ?auto_851307 ?auto_851308 )
      ( MAKE-7CRATE-VERIFY ?auto_851301 ?auto_851302 ?auto_851303 ?auto_851304 ?auto_851305 ?auto_851306 ?auto_851307 ?auto_851308 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_854220 - SURFACE
      ?auto_854221 - SURFACE
      ?auto_854222 - SURFACE
      ?auto_854223 - SURFACE
      ?auto_854224 - SURFACE
      ?auto_854225 - SURFACE
      ?auto_854226 - SURFACE
      ?auto_854227 - SURFACE
      ?auto_854228 - SURFACE
    )
    :vars
    (
      ?auto_854229 - HOIST
      ?auto_854230 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_854229 ?auto_854230 ) ( SURFACE-AT ?auto_854227 ?auto_854230 ) ( CLEAR ?auto_854227 ) ( LIFTING ?auto_854229 ?auto_854228 ) ( IS-CRATE ?auto_854228 ) ( not ( = ?auto_854227 ?auto_854228 ) ) ( ON ?auto_854221 ?auto_854220 ) ( ON ?auto_854222 ?auto_854221 ) ( ON ?auto_854223 ?auto_854222 ) ( ON ?auto_854224 ?auto_854223 ) ( ON ?auto_854225 ?auto_854224 ) ( ON ?auto_854226 ?auto_854225 ) ( ON ?auto_854227 ?auto_854226 ) ( not ( = ?auto_854220 ?auto_854221 ) ) ( not ( = ?auto_854220 ?auto_854222 ) ) ( not ( = ?auto_854220 ?auto_854223 ) ) ( not ( = ?auto_854220 ?auto_854224 ) ) ( not ( = ?auto_854220 ?auto_854225 ) ) ( not ( = ?auto_854220 ?auto_854226 ) ) ( not ( = ?auto_854220 ?auto_854227 ) ) ( not ( = ?auto_854220 ?auto_854228 ) ) ( not ( = ?auto_854221 ?auto_854222 ) ) ( not ( = ?auto_854221 ?auto_854223 ) ) ( not ( = ?auto_854221 ?auto_854224 ) ) ( not ( = ?auto_854221 ?auto_854225 ) ) ( not ( = ?auto_854221 ?auto_854226 ) ) ( not ( = ?auto_854221 ?auto_854227 ) ) ( not ( = ?auto_854221 ?auto_854228 ) ) ( not ( = ?auto_854222 ?auto_854223 ) ) ( not ( = ?auto_854222 ?auto_854224 ) ) ( not ( = ?auto_854222 ?auto_854225 ) ) ( not ( = ?auto_854222 ?auto_854226 ) ) ( not ( = ?auto_854222 ?auto_854227 ) ) ( not ( = ?auto_854222 ?auto_854228 ) ) ( not ( = ?auto_854223 ?auto_854224 ) ) ( not ( = ?auto_854223 ?auto_854225 ) ) ( not ( = ?auto_854223 ?auto_854226 ) ) ( not ( = ?auto_854223 ?auto_854227 ) ) ( not ( = ?auto_854223 ?auto_854228 ) ) ( not ( = ?auto_854224 ?auto_854225 ) ) ( not ( = ?auto_854224 ?auto_854226 ) ) ( not ( = ?auto_854224 ?auto_854227 ) ) ( not ( = ?auto_854224 ?auto_854228 ) ) ( not ( = ?auto_854225 ?auto_854226 ) ) ( not ( = ?auto_854225 ?auto_854227 ) ) ( not ( = ?auto_854225 ?auto_854228 ) ) ( not ( = ?auto_854226 ?auto_854227 ) ) ( not ( = ?auto_854226 ?auto_854228 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_854227 ?auto_854228 )
      ( MAKE-8CRATE-VERIFY ?auto_854220 ?auto_854221 ?auto_854222 ?auto_854223 ?auto_854224 ?auto_854225 ?auto_854226 ?auto_854227 ?auto_854228 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_854287 - SURFACE
      ?auto_854288 - SURFACE
      ?auto_854289 - SURFACE
      ?auto_854290 - SURFACE
      ?auto_854291 - SURFACE
      ?auto_854292 - SURFACE
      ?auto_854293 - SURFACE
      ?auto_854294 - SURFACE
      ?auto_854295 - SURFACE
    )
    :vars
    (
      ?auto_854298 - HOIST
      ?auto_854296 - PLACE
      ?auto_854297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_854298 ?auto_854296 ) ( SURFACE-AT ?auto_854294 ?auto_854296 ) ( CLEAR ?auto_854294 ) ( IS-CRATE ?auto_854295 ) ( not ( = ?auto_854294 ?auto_854295 ) ) ( TRUCK-AT ?auto_854297 ?auto_854296 ) ( AVAILABLE ?auto_854298 ) ( IN ?auto_854295 ?auto_854297 ) ( ON ?auto_854294 ?auto_854293 ) ( not ( = ?auto_854293 ?auto_854294 ) ) ( not ( = ?auto_854293 ?auto_854295 ) ) ( ON ?auto_854288 ?auto_854287 ) ( ON ?auto_854289 ?auto_854288 ) ( ON ?auto_854290 ?auto_854289 ) ( ON ?auto_854291 ?auto_854290 ) ( ON ?auto_854292 ?auto_854291 ) ( ON ?auto_854293 ?auto_854292 ) ( not ( = ?auto_854287 ?auto_854288 ) ) ( not ( = ?auto_854287 ?auto_854289 ) ) ( not ( = ?auto_854287 ?auto_854290 ) ) ( not ( = ?auto_854287 ?auto_854291 ) ) ( not ( = ?auto_854287 ?auto_854292 ) ) ( not ( = ?auto_854287 ?auto_854293 ) ) ( not ( = ?auto_854287 ?auto_854294 ) ) ( not ( = ?auto_854287 ?auto_854295 ) ) ( not ( = ?auto_854288 ?auto_854289 ) ) ( not ( = ?auto_854288 ?auto_854290 ) ) ( not ( = ?auto_854288 ?auto_854291 ) ) ( not ( = ?auto_854288 ?auto_854292 ) ) ( not ( = ?auto_854288 ?auto_854293 ) ) ( not ( = ?auto_854288 ?auto_854294 ) ) ( not ( = ?auto_854288 ?auto_854295 ) ) ( not ( = ?auto_854289 ?auto_854290 ) ) ( not ( = ?auto_854289 ?auto_854291 ) ) ( not ( = ?auto_854289 ?auto_854292 ) ) ( not ( = ?auto_854289 ?auto_854293 ) ) ( not ( = ?auto_854289 ?auto_854294 ) ) ( not ( = ?auto_854289 ?auto_854295 ) ) ( not ( = ?auto_854290 ?auto_854291 ) ) ( not ( = ?auto_854290 ?auto_854292 ) ) ( not ( = ?auto_854290 ?auto_854293 ) ) ( not ( = ?auto_854290 ?auto_854294 ) ) ( not ( = ?auto_854290 ?auto_854295 ) ) ( not ( = ?auto_854291 ?auto_854292 ) ) ( not ( = ?auto_854291 ?auto_854293 ) ) ( not ( = ?auto_854291 ?auto_854294 ) ) ( not ( = ?auto_854291 ?auto_854295 ) ) ( not ( = ?auto_854292 ?auto_854293 ) ) ( not ( = ?auto_854292 ?auto_854294 ) ) ( not ( = ?auto_854292 ?auto_854295 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_854293 ?auto_854294 ?auto_854295 )
      ( MAKE-8CRATE-VERIFY ?auto_854287 ?auto_854288 ?auto_854289 ?auto_854290 ?auto_854291 ?auto_854292 ?auto_854293 ?auto_854294 ?auto_854295 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_854363 - SURFACE
      ?auto_854364 - SURFACE
      ?auto_854365 - SURFACE
      ?auto_854366 - SURFACE
      ?auto_854367 - SURFACE
      ?auto_854368 - SURFACE
      ?auto_854369 - SURFACE
      ?auto_854370 - SURFACE
      ?auto_854371 - SURFACE
    )
    :vars
    (
      ?auto_854374 - HOIST
      ?auto_854372 - PLACE
      ?auto_854375 - TRUCK
      ?auto_854373 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_854374 ?auto_854372 ) ( SURFACE-AT ?auto_854370 ?auto_854372 ) ( CLEAR ?auto_854370 ) ( IS-CRATE ?auto_854371 ) ( not ( = ?auto_854370 ?auto_854371 ) ) ( AVAILABLE ?auto_854374 ) ( IN ?auto_854371 ?auto_854375 ) ( ON ?auto_854370 ?auto_854369 ) ( not ( = ?auto_854369 ?auto_854370 ) ) ( not ( = ?auto_854369 ?auto_854371 ) ) ( TRUCK-AT ?auto_854375 ?auto_854373 ) ( not ( = ?auto_854373 ?auto_854372 ) ) ( ON ?auto_854364 ?auto_854363 ) ( ON ?auto_854365 ?auto_854364 ) ( ON ?auto_854366 ?auto_854365 ) ( ON ?auto_854367 ?auto_854366 ) ( ON ?auto_854368 ?auto_854367 ) ( ON ?auto_854369 ?auto_854368 ) ( not ( = ?auto_854363 ?auto_854364 ) ) ( not ( = ?auto_854363 ?auto_854365 ) ) ( not ( = ?auto_854363 ?auto_854366 ) ) ( not ( = ?auto_854363 ?auto_854367 ) ) ( not ( = ?auto_854363 ?auto_854368 ) ) ( not ( = ?auto_854363 ?auto_854369 ) ) ( not ( = ?auto_854363 ?auto_854370 ) ) ( not ( = ?auto_854363 ?auto_854371 ) ) ( not ( = ?auto_854364 ?auto_854365 ) ) ( not ( = ?auto_854364 ?auto_854366 ) ) ( not ( = ?auto_854364 ?auto_854367 ) ) ( not ( = ?auto_854364 ?auto_854368 ) ) ( not ( = ?auto_854364 ?auto_854369 ) ) ( not ( = ?auto_854364 ?auto_854370 ) ) ( not ( = ?auto_854364 ?auto_854371 ) ) ( not ( = ?auto_854365 ?auto_854366 ) ) ( not ( = ?auto_854365 ?auto_854367 ) ) ( not ( = ?auto_854365 ?auto_854368 ) ) ( not ( = ?auto_854365 ?auto_854369 ) ) ( not ( = ?auto_854365 ?auto_854370 ) ) ( not ( = ?auto_854365 ?auto_854371 ) ) ( not ( = ?auto_854366 ?auto_854367 ) ) ( not ( = ?auto_854366 ?auto_854368 ) ) ( not ( = ?auto_854366 ?auto_854369 ) ) ( not ( = ?auto_854366 ?auto_854370 ) ) ( not ( = ?auto_854366 ?auto_854371 ) ) ( not ( = ?auto_854367 ?auto_854368 ) ) ( not ( = ?auto_854367 ?auto_854369 ) ) ( not ( = ?auto_854367 ?auto_854370 ) ) ( not ( = ?auto_854367 ?auto_854371 ) ) ( not ( = ?auto_854368 ?auto_854369 ) ) ( not ( = ?auto_854368 ?auto_854370 ) ) ( not ( = ?auto_854368 ?auto_854371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_854369 ?auto_854370 ?auto_854371 )
      ( MAKE-8CRATE-VERIFY ?auto_854363 ?auto_854364 ?auto_854365 ?auto_854366 ?auto_854367 ?auto_854368 ?auto_854369 ?auto_854370 ?auto_854371 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_854447 - SURFACE
      ?auto_854448 - SURFACE
      ?auto_854449 - SURFACE
      ?auto_854450 - SURFACE
      ?auto_854451 - SURFACE
      ?auto_854452 - SURFACE
      ?auto_854453 - SURFACE
      ?auto_854454 - SURFACE
      ?auto_854455 - SURFACE
    )
    :vars
    (
      ?auto_854460 - HOIST
      ?auto_854457 - PLACE
      ?auto_854459 - TRUCK
      ?auto_854456 - PLACE
      ?auto_854458 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_854460 ?auto_854457 ) ( SURFACE-AT ?auto_854454 ?auto_854457 ) ( CLEAR ?auto_854454 ) ( IS-CRATE ?auto_854455 ) ( not ( = ?auto_854454 ?auto_854455 ) ) ( AVAILABLE ?auto_854460 ) ( ON ?auto_854454 ?auto_854453 ) ( not ( = ?auto_854453 ?auto_854454 ) ) ( not ( = ?auto_854453 ?auto_854455 ) ) ( TRUCK-AT ?auto_854459 ?auto_854456 ) ( not ( = ?auto_854456 ?auto_854457 ) ) ( HOIST-AT ?auto_854458 ?auto_854456 ) ( LIFTING ?auto_854458 ?auto_854455 ) ( not ( = ?auto_854460 ?auto_854458 ) ) ( ON ?auto_854448 ?auto_854447 ) ( ON ?auto_854449 ?auto_854448 ) ( ON ?auto_854450 ?auto_854449 ) ( ON ?auto_854451 ?auto_854450 ) ( ON ?auto_854452 ?auto_854451 ) ( ON ?auto_854453 ?auto_854452 ) ( not ( = ?auto_854447 ?auto_854448 ) ) ( not ( = ?auto_854447 ?auto_854449 ) ) ( not ( = ?auto_854447 ?auto_854450 ) ) ( not ( = ?auto_854447 ?auto_854451 ) ) ( not ( = ?auto_854447 ?auto_854452 ) ) ( not ( = ?auto_854447 ?auto_854453 ) ) ( not ( = ?auto_854447 ?auto_854454 ) ) ( not ( = ?auto_854447 ?auto_854455 ) ) ( not ( = ?auto_854448 ?auto_854449 ) ) ( not ( = ?auto_854448 ?auto_854450 ) ) ( not ( = ?auto_854448 ?auto_854451 ) ) ( not ( = ?auto_854448 ?auto_854452 ) ) ( not ( = ?auto_854448 ?auto_854453 ) ) ( not ( = ?auto_854448 ?auto_854454 ) ) ( not ( = ?auto_854448 ?auto_854455 ) ) ( not ( = ?auto_854449 ?auto_854450 ) ) ( not ( = ?auto_854449 ?auto_854451 ) ) ( not ( = ?auto_854449 ?auto_854452 ) ) ( not ( = ?auto_854449 ?auto_854453 ) ) ( not ( = ?auto_854449 ?auto_854454 ) ) ( not ( = ?auto_854449 ?auto_854455 ) ) ( not ( = ?auto_854450 ?auto_854451 ) ) ( not ( = ?auto_854450 ?auto_854452 ) ) ( not ( = ?auto_854450 ?auto_854453 ) ) ( not ( = ?auto_854450 ?auto_854454 ) ) ( not ( = ?auto_854450 ?auto_854455 ) ) ( not ( = ?auto_854451 ?auto_854452 ) ) ( not ( = ?auto_854451 ?auto_854453 ) ) ( not ( = ?auto_854451 ?auto_854454 ) ) ( not ( = ?auto_854451 ?auto_854455 ) ) ( not ( = ?auto_854452 ?auto_854453 ) ) ( not ( = ?auto_854452 ?auto_854454 ) ) ( not ( = ?auto_854452 ?auto_854455 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_854453 ?auto_854454 ?auto_854455 )
      ( MAKE-8CRATE-VERIFY ?auto_854447 ?auto_854448 ?auto_854449 ?auto_854450 ?auto_854451 ?auto_854452 ?auto_854453 ?auto_854454 ?auto_854455 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_854539 - SURFACE
      ?auto_854540 - SURFACE
      ?auto_854541 - SURFACE
      ?auto_854542 - SURFACE
      ?auto_854543 - SURFACE
      ?auto_854544 - SURFACE
      ?auto_854545 - SURFACE
      ?auto_854546 - SURFACE
      ?auto_854547 - SURFACE
    )
    :vars
    (
      ?auto_854552 - HOIST
      ?auto_854548 - PLACE
      ?auto_854551 - TRUCK
      ?auto_854549 - PLACE
      ?auto_854550 - HOIST
      ?auto_854553 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_854552 ?auto_854548 ) ( SURFACE-AT ?auto_854546 ?auto_854548 ) ( CLEAR ?auto_854546 ) ( IS-CRATE ?auto_854547 ) ( not ( = ?auto_854546 ?auto_854547 ) ) ( AVAILABLE ?auto_854552 ) ( ON ?auto_854546 ?auto_854545 ) ( not ( = ?auto_854545 ?auto_854546 ) ) ( not ( = ?auto_854545 ?auto_854547 ) ) ( TRUCK-AT ?auto_854551 ?auto_854549 ) ( not ( = ?auto_854549 ?auto_854548 ) ) ( HOIST-AT ?auto_854550 ?auto_854549 ) ( not ( = ?auto_854552 ?auto_854550 ) ) ( AVAILABLE ?auto_854550 ) ( SURFACE-AT ?auto_854547 ?auto_854549 ) ( ON ?auto_854547 ?auto_854553 ) ( CLEAR ?auto_854547 ) ( not ( = ?auto_854546 ?auto_854553 ) ) ( not ( = ?auto_854547 ?auto_854553 ) ) ( not ( = ?auto_854545 ?auto_854553 ) ) ( ON ?auto_854540 ?auto_854539 ) ( ON ?auto_854541 ?auto_854540 ) ( ON ?auto_854542 ?auto_854541 ) ( ON ?auto_854543 ?auto_854542 ) ( ON ?auto_854544 ?auto_854543 ) ( ON ?auto_854545 ?auto_854544 ) ( not ( = ?auto_854539 ?auto_854540 ) ) ( not ( = ?auto_854539 ?auto_854541 ) ) ( not ( = ?auto_854539 ?auto_854542 ) ) ( not ( = ?auto_854539 ?auto_854543 ) ) ( not ( = ?auto_854539 ?auto_854544 ) ) ( not ( = ?auto_854539 ?auto_854545 ) ) ( not ( = ?auto_854539 ?auto_854546 ) ) ( not ( = ?auto_854539 ?auto_854547 ) ) ( not ( = ?auto_854539 ?auto_854553 ) ) ( not ( = ?auto_854540 ?auto_854541 ) ) ( not ( = ?auto_854540 ?auto_854542 ) ) ( not ( = ?auto_854540 ?auto_854543 ) ) ( not ( = ?auto_854540 ?auto_854544 ) ) ( not ( = ?auto_854540 ?auto_854545 ) ) ( not ( = ?auto_854540 ?auto_854546 ) ) ( not ( = ?auto_854540 ?auto_854547 ) ) ( not ( = ?auto_854540 ?auto_854553 ) ) ( not ( = ?auto_854541 ?auto_854542 ) ) ( not ( = ?auto_854541 ?auto_854543 ) ) ( not ( = ?auto_854541 ?auto_854544 ) ) ( not ( = ?auto_854541 ?auto_854545 ) ) ( not ( = ?auto_854541 ?auto_854546 ) ) ( not ( = ?auto_854541 ?auto_854547 ) ) ( not ( = ?auto_854541 ?auto_854553 ) ) ( not ( = ?auto_854542 ?auto_854543 ) ) ( not ( = ?auto_854542 ?auto_854544 ) ) ( not ( = ?auto_854542 ?auto_854545 ) ) ( not ( = ?auto_854542 ?auto_854546 ) ) ( not ( = ?auto_854542 ?auto_854547 ) ) ( not ( = ?auto_854542 ?auto_854553 ) ) ( not ( = ?auto_854543 ?auto_854544 ) ) ( not ( = ?auto_854543 ?auto_854545 ) ) ( not ( = ?auto_854543 ?auto_854546 ) ) ( not ( = ?auto_854543 ?auto_854547 ) ) ( not ( = ?auto_854543 ?auto_854553 ) ) ( not ( = ?auto_854544 ?auto_854545 ) ) ( not ( = ?auto_854544 ?auto_854546 ) ) ( not ( = ?auto_854544 ?auto_854547 ) ) ( not ( = ?auto_854544 ?auto_854553 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_854545 ?auto_854546 ?auto_854547 )
      ( MAKE-8CRATE-VERIFY ?auto_854539 ?auto_854540 ?auto_854541 ?auto_854542 ?auto_854543 ?auto_854544 ?auto_854545 ?auto_854546 ?auto_854547 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_854632 - SURFACE
      ?auto_854633 - SURFACE
      ?auto_854634 - SURFACE
      ?auto_854635 - SURFACE
      ?auto_854636 - SURFACE
      ?auto_854637 - SURFACE
      ?auto_854638 - SURFACE
      ?auto_854639 - SURFACE
      ?auto_854640 - SURFACE
    )
    :vars
    (
      ?auto_854641 - HOIST
      ?auto_854642 - PLACE
      ?auto_854646 - PLACE
      ?auto_854645 - HOIST
      ?auto_854644 - SURFACE
      ?auto_854643 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_854641 ?auto_854642 ) ( SURFACE-AT ?auto_854639 ?auto_854642 ) ( CLEAR ?auto_854639 ) ( IS-CRATE ?auto_854640 ) ( not ( = ?auto_854639 ?auto_854640 ) ) ( AVAILABLE ?auto_854641 ) ( ON ?auto_854639 ?auto_854638 ) ( not ( = ?auto_854638 ?auto_854639 ) ) ( not ( = ?auto_854638 ?auto_854640 ) ) ( not ( = ?auto_854646 ?auto_854642 ) ) ( HOIST-AT ?auto_854645 ?auto_854646 ) ( not ( = ?auto_854641 ?auto_854645 ) ) ( AVAILABLE ?auto_854645 ) ( SURFACE-AT ?auto_854640 ?auto_854646 ) ( ON ?auto_854640 ?auto_854644 ) ( CLEAR ?auto_854640 ) ( not ( = ?auto_854639 ?auto_854644 ) ) ( not ( = ?auto_854640 ?auto_854644 ) ) ( not ( = ?auto_854638 ?auto_854644 ) ) ( TRUCK-AT ?auto_854643 ?auto_854642 ) ( ON ?auto_854633 ?auto_854632 ) ( ON ?auto_854634 ?auto_854633 ) ( ON ?auto_854635 ?auto_854634 ) ( ON ?auto_854636 ?auto_854635 ) ( ON ?auto_854637 ?auto_854636 ) ( ON ?auto_854638 ?auto_854637 ) ( not ( = ?auto_854632 ?auto_854633 ) ) ( not ( = ?auto_854632 ?auto_854634 ) ) ( not ( = ?auto_854632 ?auto_854635 ) ) ( not ( = ?auto_854632 ?auto_854636 ) ) ( not ( = ?auto_854632 ?auto_854637 ) ) ( not ( = ?auto_854632 ?auto_854638 ) ) ( not ( = ?auto_854632 ?auto_854639 ) ) ( not ( = ?auto_854632 ?auto_854640 ) ) ( not ( = ?auto_854632 ?auto_854644 ) ) ( not ( = ?auto_854633 ?auto_854634 ) ) ( not ( = ?auto_854633 ?auto_854635 ) ) ( not ( = ?auto_854633 ?auto_854636 ) ) ( not ( = ?auto_854633 ?auto_854637 ) ) ( not ( = ?auto_854633 ?auto_854638 ) ) ( not ( = ?auto_854633 ?auto_854639 ) ) ( not ( = ?auto_854633 ?auto_854640 ) ) ( not ( = ?auto_854633 ?auto_854644 ) ) ( not ( = ?auto_854634 ?auto_854635 ) ) ( not ( = ?auto_854634 ?auto_854636 ) ) ( not ( = ?auto_854634 ?auto_854637 ) ) ( not ( = ?auto_854634 ?auto_854638 ) ) ( not ( = ?auto_854634 ?auto_854639 ) ) ( not ( = ?auto_854634 ?auto_854640 ) ) ( not ( = ?auto_854634 ?auto_854644 ) ) ( not ( = ?auto_854635 ?auto_854636 ) ) ( not ( = ?auto_854635 ?auto_854637 ) ) ( not ( = ?auto_854635 ?auto_854638 ) ) ( not ( = ?auto_854635 ?auto_854639 ) ) ( not ( = ?auto_854635 ?auto_854640 ) ) ( not ( = ?auto_854635 ?auto_854644 ) ) ( not ( = ?auto_854636 ?auto_854637 ) ) ( not ( = ?auto_854636 ?auto_854638 ) ) ( not ( = ?auto_854636 ?auto_854639 ) ) ( not ( = ?auto_854636 ?auto_854640 ) ) ( not ( = ?auto_854636 ?auto_854644 ) ) ( not ( = ?auto_854637 ?auto_854638 ) ) ( not ( = ?auto_854637 ?auto_854639 ) ) ( not ( = ?auto_854637 ?auto_854640 ) ) ( not ( = ?auto_854637 ?auto_854644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_854638 ?auto_854639 ?auto_854640 )
      ( MAKE-8CRATE-VERIFY ?auto_854632 ?auto_854633 ?auto_854634 ?auto_854635 ?auto_854636 ?auto_854637 ?auto_854638 ?auto_854639 ?auto_854640 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_854725 - SURFACE
      ?auto_854726 - SURFACE
      ?auto_854727 - SURFACE
      ?auto_854728 - SURFACE
      ?auto_854729 - SURFACE
      ?auto_854730 - SURFACE
      ?auto_854731 - SURFACE
      ?auto_854732 - SURFACE
      ?auto_854733 - SURFACE
    )
    :vars
    (
      ?auto_854739 - HOIST
      ?auto_854735 - PLACE
      ?auto_854734 - PLACE
      ?auto_854736 - HOIST
      ?auto_854737 - SURFACE
      ?auto_854738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_854739 ?auto_854735 ) ( IS-CRATE ?auto_854733 ) ( not ( = ?auto_854732 ?auto_854733 ) ) ( not ( = ?auto_854731 ?auto_854732 ) ) ( not ( = ?auto_854731 ?auto_854733 ) ) ( not ( = ?auto_854734 ?auto_854735 ) ) ( HOIST-AT ?auto_854736 ?auto_854734 ) ( not ( = ?auto_854739 ?auto_854736 ) ) ( AVAILABLE ?auto_854736 ) ( SURFACE-AT ?auto_854733 ?auto_854734 ) ( ON ?auto_854733 ?auto_854737 ) ( CLEAR ?auto_854733 ) ( not ( = ?auto_854732 ?auto_854737 ) ) ( not ( = ?auto_854733 ?auto_854737 ) ) ( not ( = ?auto_854731 ?auto_854737 ) ) ( TRUCK-AT ?auto_854738 ?auto_854735 ) ( SURFACE-AT ?auto_854731 ?auto_854735 ) ( CLEAR ?auto_854731 ) ( LIFTING ?auto_854739 ?auto_854732 ) ( IS-CRATE ?auto_854732 ) ( ON ?auto_854726 ?auto_854725 ) ( ON ?auto_854727 ?auto_854726 ) ( ON ?auto_854728 ?auto_854727 ) ( ON ?auto_854729 ?auto_854728 ) ( ON ?auto_854730 ?auto_854729 ) ( ON ?auto_854731 ?auto_854730 ) ( not ( = ?auto_854725 ?auto_854726 ) ) ( not ( = ?auto_854725 ?auto_854727 ) ) ( not ( = ?auto_854725 ?auto_854728 ) ) ( not ( = ?auto_854725 ?auto_854729 ) ) ( not ( = ?auto_854725 ?auto_854730 ) ) ( not ( = ?auto_854725 ?auto_854731 ) ) ( not ( = ?auto_854725 ?auto_854732 ) ) ( not ( = ?auto_854725 ?auto_854733 ) ) ( not ( = ?auto_854725 ?auto_854737 ) ) ( not ( = ?auto_854726 ?auto_854727 ) ) ( not ( = ?auto_854726 ?auto_854728 ) ) ( not ( = ?auto_854726 ?auto_854729 ) ) ( not ( = ?auto_854726 ?auto_854730 ) ) ( not ( = ?auto_854726 ?auto_854731 ) ) ( not ( = ?auto_854726 ?auto_854732 ) ) ( not ( = ?auto_854726 ?auto_854733 ) ) ( not ( = ?auto_854726 ?auto_854737 ) ) ( not ( = ?auto_854727 ?auto_854728 ) ) ( not ( = ?auto_854727 ?auto_854729 ) ) ( not ( = ?auto_854727 ?auto_854730 ) ) ( not ( = ?auto_854727 ?auto_854731 ) ) ( not ( = ?auto_854727 ?auto_854732 ) ) ( not ( = ?auto_854727 ?auto_854733 ) ) ( not ( = ?auto_854727 ?auto_854737 ) ) ( not ( = ?auto_854728 ?auto_854729 ) ) ( not ( = ?auto_854728 ?auto_854730 ) ) ( not ( = ?auto_854728 ?auto_854731 ) ) ( not ( = ?auto_854728 ?auto_854732 ) ) ( not ( = ?auto_854728 ?auto_854733 ) ) ( not ( = ?auto_854728 ?auto_854737 ) ) ( not ( = ?auto_854729 ?auto_854730 ) ) ( not ( = ?auto_854729 ?auto_854731 ) ) ( not ( = ?auto_854729 ?auto_854732 ) ) ( not ( = ?auto_854729 ?auto_854733 ) ) ( not ( = ?auto_854729 ?auto_854737 ) ) ( not ( = ?auto_854730 ?auto_854731 ) ) ( not ( = ?auto_854730 ?auto_854732 ) ) ( not ( = ?auto_854730 ?auto_854733 ) ) ( not ( = ?auto_854730 ?auto_854737 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_854731 ?auto_854732 ?auto_854733 )
      ( MAKE-8CRATE-VERIFY ?auto_854725 ?auto_854726 ?auto_854727 ?auto_854728 ?auto_854729 ?auto_854730 ?auto_854731 ?auto_854732 ?auto_854733 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_854818 - SURFACE
      ?auto_854819 - SURFACE
      ?auto_854820 - SURFACE
      ?auto_854821 - SURFACE
      ?auto_854822 - SURFACE
      ?auto_854823 - SURFACE
      ?auto_854824 - SURFACE
      ?auto_854825 - SURFACE
      ?auto_854826 - SURFACE
    )
    :vars
    (
      ?auto_854830 - HOIST
      ?auto_854831 - PLACE
      ?auto_854832 - PLACE
      ?auto_854828 - HOIST
      ?auto_854829 - SURFACE
      ?auto_854827 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_854830 ?auto_854831 ) ( IS-CRATE ?auto_854826 ) ( not ( = ?auto_854825 ?auto_854826 ) ) ( not ( = ?auto_854824 ?auto_854825 ) ) ( not ( = ?auto_854824 ?auto_854826 ) ) ( not ( = ?auto_854832 ?auto_854831 ) ) ( HOIST-AT ?auto_854828 ?auto_854832 ) ( not ( = ?auto_854830 ?auto_854828 ) ) ( AVAILABLE ?auto_854828 ) ( SURFACE-AT ?auto_854826 ?auto_854832 ) ( ON ?auto_854826 ?auto_854829 ) ( CLEAR ?auto_854826 ) ( not ( = ?auto_854825 ?auto_854829 ) ) ( not ( = ?auto_854826 ?auto_854829 ) ) ( not ( = ?auto_854824 ?auto_854829 ) ) ( TRUCK-AT ?auto_854827 ?auto_854831 ) ( SURFACE-AT ?auto_854824 ?auto_854831 ) ( CLEAR ?auto_854824 ) ( IS-CRATE ?auto_854825 ) ( AVAILABLE ?auto_854830 ) ( IN ?auto_854825 ?auto_854827 ) ( ON ?auto_854819 ?auto_854818 ) ( ON ?auto_854820 ?auto_854819 ) ( ON ?auto_854821 ?auto_854820 ) ( ON ?auto_854822 ?auto_854821 ) ( ON ?auto_854823 ?auto_854822 ) ( ON ?auto_854824 ?auto_854823 ) ( not ( = ?auto_854818 ?auto_854819 ) ) ( not ( = ?auto_854818 ?auto_854820 ) ) ( not ( = ?auto_854818 ?auto_854821 ) ) ( not ( = ?auto_854818 ?auto_854822 ) ) ( not ( = ?auto_854818 ?auto_854823 ) ) ( not ( = ?auto_854818 ?auto_854824 ) ) ( not ( = ?auto_854818 ?auto_854825 ) ) ( not ( = ?auto_854818 ?auto_854826 ) ) ( not ( = ?auto_854818 ?auto_854829 ) ) ( not ( = ?auto_854819 ?auto_854820 ) ) ( not ( = ?auto_854819 ?auto_854821 ) ) ( not ( = ?auto_854819 ?auto_854822 ) ) ( not ( = ?auto_854819 ?auto_854823 ) ) ( not ( = ?auto_854819 ?auto_854824 ) ) ( not ( = ?auto_854819 ?auto_854825 ) ) ( not ( = ?auto_854819 ?auto_854826 ) ) ( not ( = ?auto_854819 ?auto_854829 ) ) ( not ( = ?auto_854820 ?auto_854821 ) ) ( not ( = ?auto_854820 ?auto_854822 ) ) ( not ( = ?auto_854820 ?auto_854823 ) ) ( not ( = ?auto_854820 ?auto_854824 ) ) ( not ( = ?auto_854820 ?auto_854825 ) ) ( not ( = ?auto_854820 ?auto_854826 ) ) ( not ( = ?auto_854820 ?auto_854829 ) ) ( not ( = ?auto_854821 ?auto_854822 ) ) ( not ( = ?auto_854821 ?auto_854823 ) ) ( not ( = ?auto_854821 ?auto_854824 ) ) ( not ( = ?auto_854821 ?auto_854825 ) ) ( not ( = ?auto_854821 ?auto_854826 ) ) ( not ( = ?auto_854821 ?auto_854829 ) ) ( not ( = ?auto_854822 ?auto_854823 ) ) ( not ( = ?auto_854822 ?auto_854824 ) ) ( not ( = ?auto_854822 ?auto_854825 ) ) ( not ( = ?auto_854822 ?auto_854826 ) ) ( not ( = ?auto_854822 ?auto_854829 ) ) ( not ( = ?auto_854823 ?auto_854824 ) ) ( not ( = ?auto_854823 ?auto_854825 ) ) ( not ( = ?auto_854823 ?auto_854826 ) ) ( not ( = ?auto_854823 ?auto_854829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_854824 ?auto_854825 ?auto_854826 )
      ( MAKE-8CRATE-VERIFY ?auto_854818 ?auto_854819 ?auto_854820 ?auto_854821 ?auto_854822 ?auto_854823 ?auto_854824 ?auto_854825 ?auto_854826 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_858934 - SURFACE
      ?auto_858935 - SURFACE
      ?auto_858936 - SURFACE
      ?auto_858937 - SURFACE
      ?auto_858938 - SURFACE
      ?auto_858939 - SURFACE
      ?auto_858940 - SURFACE
      ?auto_858941 - SURFACE
      ?auto_858942 - SURFACE
      ?auto_858943 - SURFACE
    )
    :vars
    (
      ?auto_858945 - HOIST
      ?auto_858944 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_858945 ?auto_858944 ) ( SURFACE-AT ?auto_858942 ?auto_858944 ) ( CLEAR ?auto_858942 ) ( LIFTING ?auto_858945 ?auto_858943 ) ( IS-CRATE ?auto_858943 ) ( not ( = ?auto_858942 ?auto_858943 ) ) ( ON ?auto_858935 ?auto_858934 ) ( ON ?auto_858936 ?auto_858935 ) ( ON ?auto_858937 ?auto_858936 ) ( ON ?auto_858938 ?auto_858937 ) ( ON ?auto_858939 ?auto_858938 ) ( ON ?auto_858940 ?auto_858939 ) ( ON ?auto_858941 ?auto_858940 ) ( ON ?auto_858942 ?auto_858941 ) ( not ( = ?auto_858934 ?auto_858935 ) ) ( not ( = ?auto_858934 ?auto_858936 ) ) ( not ( = ?auto_858934 ?auto_858937 ) ) ( not ( = ?auto_858934 ?auto_858938 ) ) ( not ( = ?auto_858934 ?auto_858939 ) ) ( not ( = ?auto_858934 ?auto_858940 ) ) ( not ( = ?auto_858934 ?auto_858941 ) ) ( not ( = ?auto_858934 ?auto_858942 ) ) ( not ( = ?auto_858934 ?auto_858943 ) ) ( not ( = ?auto_858935 ?auto_858936 ) ) ( not ( = ?auto_858935 ?auto_858937 ) ) ( not ( = ?auto_858935 ?auto_858938 ) ) ( not ( = ?auto_858935 ?auto_858939 ) ) ( not ( = ?auto_858935 ?auto_858940 ) ) ( not ( = ?auto_858935 ?auto_858941 ) ) ( not ( = ?auto_858935 ?auto_858942 ) ) ( not ( = ?auto_858935 ?auto_858943 ) ) ( not ( = ?auto_858936 ?auto_858937 ) ) ( not ( = ?auto_858936 ?auto_858938 ) ) ( not ( = ?auto_858936 ?auto_858939 ) ) ( not ( = ?auto_858936 ?auto_858940 ) ) ( not ( = ?auto_858936 ?auto_858941 ) ) ( not ( = ?auto_858936 ?auto_858942 ) ) ( not ( = ?auto_858936 ?auto_858943 ) ) ( not ( = ?auto_858937 ?auto_858938 ) ) ( not ( = ?auto_858937 ?auto_858939 ) ) ( not ( = ?auto_858937 ?auto_858940 ) ) ( not ( = ?auto_858937 ?auto_858941 ) ) ( not ( = ?auto_858937 ?auto_858942 ) ) ( not ( = ?auto_858937 ?auto_858943 ) ) ( not ( = ?auto_858938 ?auto_858939 ) ) ( not ( = ?auto_858938 ?auto_858940 ) ) ( not ( = ?auto_858938 ?auto_858941 ) ) ( not ( = ?auto_858938 ?auto_858942 ) ) ( not ( = ?auto_858938 ?auto_858943 ) ) ( not ( = ?auto_858939 ?auto_858940 ) ) ( not ( = ?auto_858939 ?auto_858941 ) ) ( not ( = ?auto_858939 ?auto_858942 ) ) ( not ( = ?auto_858939 ?auto_858943 ) ) ( not ( = ?auto_858940 ?auto_858941 ) ) ( not ( = ?auto_858940 ?auto_858942 ) ) ( not ( = ?auto_858940 ?auto_858943 ) ) ( not ( = ?auto_858941 ?auto_858942 ) ) ( not ( = ?auto_858941 ?auto_858943 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_858942 ?auto_858943 )
      ( MAKE-9CRATE-VERIFY ?auto_858934 ?auto_858935 ?auto_858936 ?auto_858937 ?auto_858938 ?auto_858939 ?auto_858940 ?auto_858941 ?auto_858942 ?auto_858943 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859014 - SURFACE
      ?auto_859015 - SURFACE
      ?auto_859016 - SURFACE
      ?auto_859017 - SURFACE
      ?auto_859018 - SURFACE
      ?auto_859019 - SURFACE
      ?auto_859020 - SURFACE
      ?auto_859021 - SURFACE
      ?auto_859022 - SURFACE
      ?auto_859023 - SURFACE
    )
    :vars
    (
      ?auto_859024 - HOIST
      ?auto_859025 - PLACE
      ?auto_859026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859024 ?auto_859025 ) ( SURFACE-AT ?auto_859022 ?auto_859025 ) ( CLEAR ?auto_859022 ) ( IS-CRATE ?auto_859023 ) ( not ( = ?auto_859022 ?auto_859023 ) ) ( TRUCK-AT ?auto_859026 ?auto_859025 ) ( AVAILABLE ?auto_859024 ) ( IN ?auto_859023 ?auto_859026 ) ( ON ?auto_859022 ?auto_859021 ) ( not ( = ?auto_859021 ?auto_859022 ) ) ( not ( = ?auto_859021 ?auto_859023 ) ) ( ON ?auto_859015 ?auto_859014 ) ( ON ?auto_859016 ?auto_859015 ) ( ON ?auto_859017 ?auto_859016 ) ( ON ?auto_859018 ?auto_859017 ) ( ON ?auto_859019 ?auto_859018 ) ( ON ?auto_859020 ?auto_859019 ) ( ON ?auto_859021 ?auto_859020 ) ( not ( = ?auto_859014 ?auto_859015 ) ) ( not ( = ?auto_859014 ?auto_859016 ) ) ( not ( = ?auto_859014 ?auto_859017 ) ) ( not ( = ?auto_859014 ?auto_859018 ) ) ( not ( = ?auto_859014 ?auto_859019 ) ) ( not ( = ?auto_859014 ?auto_859020 ) ) ( not ( = ?auto_859014 ?auto_859021 ) ) ( not ( = ?auto_859014 ?auto_859022 ) ) ( not ( = ?auto_859014 ?auto_859023 ) ) ( not ( = ?auto_859015 ?auto_859016 ) ) ( not ( = ?auto_859015 ?auto_859017 ) ) ( not ( = ?auto_859015 ?auto_859018 ) ) ( not ( = ?auto_859015 ?auto_859019 ) ) ( not ( = ?auto_859015 ?auto_859020 ) ) ( not ( = ?auto_859015 ?auto_859021 ) ) ( not ( = ?auto_859015 ?auto_859022 ) ) ( not ( = ?auto_859015 ?auto_859023 ) ) ( not ( = ?auto_859016 ?auto_859017 ) ) ( not ( = ?auto_859016 ?auto_859018 ) ) ( not ( = ?auto_859016 ?auto_859019 ) ) ( not ( = ?auto_859016 ?auto_859020 ) ) ( not ( = ?auto_859016 ?auto_859021 ) ) ( not ( = ?auto_859016 ?auto_859022 ) ) ( not ( = ?auto_859016 ?auto_859023 ) ) ( not ( = ?auto_859017 ?auto_859018 ) ) ( not ( = ?auto_859017 ?auto_859019 ) ) ( not ( = ?auto_859017 ?auto_859020 ) ) ( not ( = ?auto_859017 ?auto_859021 ) ) ( not ( = ?auto_859017 ?auto_859022 ) ) ( not ( = ?auto_859017 ?auto_859023 ) ) ( not ( = ?auto_859018 ?auto_859019 ) ) ( not ( = ?auto_859018 ?auto_859020 ) ) ( not ( = ?auto_859018 ?auto_859021 ) ) ( not ( = ?auto_859018 ?auto_859022 ) ) ( not ( = ?auto_859018 ?auto_859023 ) ) ( not ( = ?auto_859019 ?auto_859020 ) ) ( not ( = ?auto_859019 ?auto_859021 ) ) ( not ( = ?auto_859019 ?auto_859022 ) ) ( not ( = ?auto_859019 ?auto_859023 ) ) ( not ( = ?auto_859020 ?auto_859021 ) ) ( not ( = ?auto_859020 ?auto_859022 ) ) ( not ( = ?auto_859020 ?auto_859023 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859021 ?auto_859022 ?auto_859023 )
      ( MAKE-9CRATE-VERIFY ?auto_859014 ?auto_859015 ?auto_859016 ?auto_859017 ?auto_859018 ?auto_859019 ?auto_859020 ?auto_859021 ?auto_859022 ?auto_859023 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859104 - SURFACE
      ?auto_859105 - SURFACE
      ?auto_859106 - SURFACE
      ?auto_859107 - SURFACE
      ?auto_859108 - SURFACE
      ?auto_859109 - SURFACE
      ?auto_859110 - SURFACE
      ?auto_859111 - SURFACE
      ?auto_859112 - SURFACE
      ?auto_859113 - SURFACE
    )
    :vars
    (
      ?auto_859115 - HOIST
      ?auto_859117 - PLACE
      ?auto_859116 - TRUCK
      ?auto_859114 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_859115 ?auto_859117 ) ( SURFACE-AT ?auto_859112 ?auto_859117 ) ( CLEAR ?auto_859112 ) ( IS-CRATE ?auto_859113 ) ( not ( = ?auto_859112 ?auto_859113 ) ) ( AVAILABLE ?auto_859115 ) ( IN ?auto_859113 ?auto_859116 ) ( ON ?auto_859112 ?auto_859111 ) ( not ( = ?auto_859111 ?auto_859112 ) ) ( not ( = ?auto_859111 ?auto_859113 ) ) ( TRUCK-AT ?auto_859116 ?auto_859114 ) ( not ( = ?auto_859114 ?auto_859117 ) ) ( ON ?auto_859105 ?auto_859104 ) ( ON ?auto_859106 ?auto_859105 ) ( ON ?auto_859107 ?auto_859106 ) ( ON ?auto_859108 ?auto_859107 ) ( ON ?auto_859109 ?auto_859108 ) ( ON ?auto_859110 ?auto_859109 ) ( ON ?auto_859111 ?auto_859110 ) ( not ( = ?auto_859104 ?auto_859105 ) ) ( not ( = ?auto_859104 ?auto_859106 ) ) ( not ( = ?auto_859104 ?auto_859107 ) ) ( not ( = ?auto_859104 ?auto_859108 ) ) ( not ( = ?auto_859104 ?auto_859109 ) ) ( not ( = ?auto_859104 ?auto_859110 ) ) ( not ( = ?auto_859104 ?auto_859111 ) ) ( not ( = ?auto_859104 ?auto_859112 ) ) ( not ( = ?auto_859104 ?auto_859113 ) ) ( not ( = ?auto_859105 ?auto_859106 ) ) ( not ( = ?auto_859105 ?auto_859107 ) ) ( not ( = ?auto_859105 ?auto_859108 ) ) ( not ( = ?auto_859105 ?auto_859109 ) ) ( not ( = ?auto_859105 ?auto_859110 ) ) ( not ( = ?auto_859105 ?auto_859111 ) ) ( not ( = ?auto_859105 ?auto_859112 ) ) ( not ( = ?auto_859105 ?auto_859113 ) ) ( not ( = ?auto_859106 ?auto_859107 ) ) ( not ( = ?auto_859106 ?auto_859108 ) ) ( not ( = ?auto_859106 ?auto_859109 ) ) ( not ( = ?auto_859106 ?auto_859110 ) ) ( not ( = ?auto_859106 ?auto_859111 ) ) ( not ( = ?auto_859106 ?auto_859112 ) ) ( not ( = ?auto_859106 ?auto_859113 ) ) ( not ( = ?auto_859107 ?auto_859108 ) ) ( not ( = ?auto_859107 ?auto_859109 ) ) ( not ( = ?auto_859107 ?auto_859110 ) ) ( not ( = ?auto_859107 ?auto_859111 ) ) ( not ( = ?auto_859107 ?auto_859112 ) ) ( not ( = ?auto_859107 ?auto_859113 ) ) ( not ( = ?auto_859108 ?auto_859109 ) ) ( not ( = ?auto_859108 ?auto_859110 ) ) ( not ( = ?auto_859108 ?auto_859111 ) ) ( not ( = ?auto_859108 ?auto_859112 ) ) ( not ( = ?auto_859108 ?auto_859113 ) ) ( not ( = ?auto_859109 ?auto_859110 ) ) ( not ( = ?auto_859109 ?auto_859111 ) ) ( not ( = ?auto_859109 ?auto_859112 ) ) ( not ( = ?auto_859109 ?auto_859113 ) ) ( not ( = ?auto_859110 ?auto_859111 ) ) ( not ( = ?auto_859110 ?auto_859112 ) ) ( not ( = ?auto_859110 ?auto_859113 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859111 ?auto_859112 ?auto_859113 )
      ( MAKE-9CRATE-VERIFY ?auto_859104 ?auto_859105 ?auto_859106 ?auto_859107 ?auto_859108 ?auto_859109 ?auto_859110 ?auto_859111 ?auto_859112 ?auto_859113 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859203 - SURFACE
      ?auto_859204 - SURFACE
      ?auto_859205 - SURFACE
      ?auto_859206 - SURFACE
      ?auto_859207 - SURFACE
      ?auto_859208 - SURFACE
      ?auto_859209 - SURFACE
      ?auto_859210 - SURFACE
      ?auto_859211 - SURFACE
      ?auto_859212 - SURFACE
    )
    :vars
    (
      ?auto_859215 - HOIST
      ?auto_859217 - PLACE
      ?auto_859213 - TRUCK
      ?auto_859216 - PLACE
      ?auto_859214 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_859215 ?auto_859217 ) ( SURFACE-AT ?auto_859211 ?auto_859217 ) ( CLEAR ?auto_859211 ) ( IS-CRATE ?auto_859212 ) ( not ( = ?auto_859211 ?auto_859212 ) ) ( AVAILABLE ?auto_859215 ) ( ON ?auto_859211 ?auto_859210 ) ( not ( = ?auto_859210 ?auto_859211 ) ) ( not ( = ?auto_859210 ?auto_859212 ) ) ( TRUCK-AT ?auto_859213 ?auto_859216 ) ( not ( = ?auto_859216 ?auto_859217 ) ) ( HOIST-AT ?auto_859214 ?auto_859216 ) ( LIFTING ?auto_859214 ?auto_859212 ) ( not ( = ?auto_859215 ?auto_859214 ) ) ( ON ?auto_859204 ?auto_859203 ) ( ON ?auto_859205 ?auto_859204 ) ( ON ?auto_859206 ?auto_859205 ) ( ON ?auto_859207 ?auto_859206 ) ( ON ?auto_859208 ?auto_859207 ) ( ON ?auto_859209 ?auto_859208 ) ( ON ?auto_859210 ?auto_859209 ) ( not ( = ?auto_859203 ?auto_859204 ) ) ( not ( = ?auto_859203 ?auto_859205 ) ) ( not ( = ?auto_859203 ?auto_859206 ) ) ( not ( = ?auto_859203 ?auto_859207 ) ) ( not ( = ?auto_859203 ?auto_859208 ) ) ( not ( = ?auto_859203 ?auto_859209 ) ) ( not ( = ?auto_859203 ?auto_859210 ) ) ( not ( = ?auto_859203 ?auto_859211 ) ) ( not ( = ?auto_859203 ?auto_859212 ) ) ( not ( = ?auto_859204 ?auto_859205 ) ) ( not ( = ?auto_859204 ?auto_859206 ) ) ( not ( = ?auto_859204 ?auto_859207 ) ) ( not ( = ?auto_859204 ?auto_859208 ) ) ( not ( = ?auto_859204 ?auto_859209 ) ) ( not ( = ?auto_859204 ?auto_859210 ) ) ( not ( = ?auto_859204 ?auto_859211 ) ) ( not ( = ?auto_859204 ?auto_859212 ) ) ( not ( = ?auto_859205 ?auto_859206 ) ) ( not ( = ?auto_859205 ?auto_859207 ) ) ( not ( = ?auto_859205 ?auto_859208 ) ) ( not ( = ?auto_859205 ?auto_859209 ) ) ( not ( = ?auto_859205 ?auto_859210 ) ) ( not ( = ?auto_859205 ?auto_859211 ) ) ( not ( = ?auto_859205 ?auto_859212 ) ) ( not ( = ?auto_859206 ?auto_859207 ) ) ( not ( = ?auto_859206 ?auto_859208 ) ) ( not ( = ?auto_859206 ?auto_859209 ) ) ( not ( = ?auto_859206 ?auto_859210 ) ) ( not ( = ?auto_859206 ?auto_859211 ) ) ( not ( = ?auto_859206 ?auto_859212 ) ) ( not ( = ?auto_859207 ?auto_859208 ) ) ( not ( = ?auto_859207 ?auto_859209 ) ) ( not ( = ?auto_859207 ?auto_859210 ) ) ( not ( = ?auto_859207 ?auto_859211 ) ) ( not ( = ?auto_859207 ?auto_859212 ) ) ( not ( = ?auto_859208 ?auto_859209 ) ) ( not ( = ?auto_859208 ?auto_859210 ) ) ( not ( = ?auto_859208 ?auto_859211 ) ) ( not ( = ?auto_859208 ?auto_859212 ) ) ( not ( = ?auto_859209 ?auto_859210 ) ) ( not ( = ?auto_859209 ?auto_859211 ) ) ( not ( = ?auto_859209 ?auto_859212 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859210 ?auto_859211 ?auto_859212 )
      ( MAKE-9CRATE-VERIFY ?auto_859203 ?auto_859204 ?auto_859205 ?auto_859206 ?auto_859207 ?auto_859208 ?auto_859209 ?auto_859210 ?auto_859211 ?auto_859212 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859311 - SURFACE
      ?auto_859312 - SURFACE
      ?auto_859313 - SURFACE
      ?auto_859314 - SURFACE
      ?auto_859315 - SURFACE
      ?auto_859316 - SURFACE
      ?auto_859317 - SURFACE
      ?auto_859318 - SURFACE
      ?auto_859319 - SURFACE
      ?auto_859320 - SURFACE
    )
    :vars
    (
      ?auto_859325 - HOIST
      ?auto_859321 - PLACE
      ?auto_859323 - TRUCK
      ?auto_859322 - PLACE
      ?auto_859326 - HOIST
      ?auto_859324 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_859325 ?auto_859321 ) ( SURFACE-AT ?auto_859319 ?auto_859321 ) ( CLEAR ?auto_859319 ) ( IS-CRATE ?auto_859320 ) ( not ( = ?auto_859319 ?auto_859320 ) ) ( AVAILABLE ?auto_859325 ) ( ON ?auto_859319 ?auto_859318 ) ( not ( = ?auto_859318 ?auto_859319 ) ) ( not ( = ?auto_859318 ?auto_859320 ) ) ( TRUCK-AT ?auto_859323 ?auto_859322 ) ( not ( = ?auto_859322 ?auto_859321 ) ) ( HOIST-AT ?auto_859326 ?auto_859322 ) ( not ( = ?auto_859325 ?auto_859326 ) ) ( AVAILABLE ?auto_859326 ) ( SURFACE-AT ?auto_859320 ?auto_859322 ) ( ON ?auto_859320 ?auto_859324 ) ( CLEAR ?auto_859320 ) ( not ( = ?auto_859319 ?auto_859324 ) ) ( not ( = ?auto_859320 ?auto_859324 ) ) ( not ( = ?auto_859318 ?auto_859324 ) ) ( ON ?auto_859312 ?auto_859311 ) ( ON ?auto_859313 ?auto_859312 ) ( ON ?auto_859314 ?auto_859313 ) ( ON ?auto_859315 ?auto_859314 ) ( ON ?auto_859316 ?auto_859315 ) ( ON ?auto_859317 ?auto_859316 ) ( ON ?auto_859318 ?auto_859317 ) ( not ( = ?auto_859311 ?auto_859312 ) ) ( not ( = ?auto_859311 ?auto_859313 ) ) ( not ( = ?auto_859311 ?auto_859314 ) ) ( not ( = ?auto_859311 ?auto_859315 ) ) ( not ( = ?auto_859311 ?auto_859316 ) ) ( not ( = ?auto_859311 ?auto_859317 ) ) ( not ( = ?auto_859311 ?auto_859318 ) ) ( not ( = ?auto_859311 ?auto_859319 ) ) ( not ( = ?auto_859311 ?auto_859320 ) ) ( not ( = ?auto_859311 ?auto_859324 ) ) ( not ( = ?auto_859312 ?auto_859313 ) ) ( not ( = ?auto_859312 ?auto_859314 ) ) ( not ( = ?auto_859312 ?auto_859315 ) ) ( not ( = ?auto_859312 ?auto_859316 ) ) ( not ( = ?auto_859312 ?auto_859317 ) ) ( not ( = ?auto_859312 ?auto_859318 ) ) ( not ( = ?auto_859312 ?auto_859319 ) ) ( not ( = ?auto_859312 ?auto_859320 ) ) ( not ( = ?auto_859312 ?auto_859324 ) ) ( not ( = ?auto_859313 ?auto_859314 ) ) ( not ( = ?auto_859313 ?auto_859315 ) ) ( not ( = ?auto_859313 ?auto_859316 ) ) ( not ( = ?auto_859313 ?auto_859317 ) ) ( not ( = ?auto_859313 ?auto_859318 ) ) ( not ( = ?auto_859313 ?auto_859319 ) ) ( not ( = ?auto_859313 ?auto_859320 ) ) ( not ( = ?auto_859313 ?auto_859324 ) ) ( not ( = ?auto_859314 ?auto_859315 ) ) ( not ( = ?auto_859314 ?auto_859316 ) ) ( not ( = ?auto_859314 ?auto_859317 ) ) ( not ( = ?auto_859314 ?auto_859318 ) ) ( not ( = ?auto_859314 ?auto_859319 ) ) ( not ( = ?auto_859314 ?auto_859320 ) ) ( not ( = ?auto_859314 ?auto_859324 ) ) ( not ( = ?auto_859315 ?auto_859316 ) ) ( not ( = ?auto_859315 ?auto_859317 ) ) ( not ( = ?auto_859315 ?auto_859318 ) ) ( not ( = ?auto_859315 ?auto_859319 ) ) ( not ( = ?auto_859315 ?auto_859320 ) ) ( not ( = ?auto_859315 ?auto_859324 ) ) ( not ( = ?auto_859316 ?auto_859317 ) ) ( not ( = ?auto_859316 ?auto_859318 ) ) ( not ( = ?auto_859316 ?auto_859319 ) ) ( not ( = ?auto_859316 ?auto_859320 ) ) ( not ( = ?auto_859316 ?auto_859324 ) ) ( not ( = ?auto_859317 ?auto_859318 ) ) ( not ( = ?auto_859317 ?auto_859319 ) ) ( not ( = ?auto_859317 ?auto_859320 ) ) ( not ( = ?auto_859317 ?auto_859324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859318 ?auto_859319 ?auto_859320 )
      ( MAKE-9CRATE-VERIFY ?auto_859311 ?auto_859312 ?auto_859313 ?auto_859314 ?auto_859315 ?auto_859316 ?auto_859317 ?auto_859318 ?auto_859319 ?auto_859320 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859420 - SURFACE
      ?auto_859421 - SURFACE
      ?auto_859422 - SURFACE
      ?auto_859423 - SURFACE
      ?auto_859424 - SURFACE
      ?auto_859425 - SURFACE
      ?auto_859426 - SURFACE
      ?auto_859427 - SURFACE
      ?auto_859428 - SURFACE
      ?auto_859429 - SURFACE
    )
    :vars
    (
      ?auto_859433 - HOIST
      ?auto_859432 - PLACE
      ?auto_859431 - PLACE
      ?auto_859430 - HOIST
      ?auto_859434 - SURFACE
      ?auto_859435 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859433 ?auto_859432 ) ( SURFACE-AT ?auto_859428 ?auto_859432 ) ( CLEAR ?auto_859428 ) ( IS-CRATE ?auto_859429 ) ( not ( = ?auto_859428 ?auto_859429 ) ) ( AVAILABLE ?auto_859433 ) ( ON ?auto_859428 ?auto_859427 ) ( not ( = ?auto_859427 ?auto_859428 ) ) ( not ( = ?auto_859427 ?auto_859429 ) ) ( not ( = ?auto_859431 ?auto_859432 ) ) ( HOIST-AT ?auto_859430 ?auto_859431 ) ( not ( = ?auto_859433 ?auto_859430 ) ) ( AVAILABLE ?auto_859430 ) ( SURFACE-AT ?auto_859429 ?auto_859431 ) ( ON ?auto_859429 ?auto_859434 ) ( CLEAR ?auto_859429 ) ( not ( = ?auto_859428 ?auto_859434 ) ) ( not ( = ?auto_859429 ?auto_859434 ) ) ( not ( = ?auto_859427 ?auto_859434 ) ) ( TRUCK-AT ?auto_859435 ?auto_859432 ) ( ON ?auto_859421 ?auto_859420 ) ( ON ?auto_859422 ?auto_859421 ) ( ON ?auto_859423 ?auto_859422 ) ( ON ?auto_859424 ?auto_859423 ) ( ON ?auto_859425 ?auto_859424 ) ( ON ?auto_859426 ?auto_859425 ) ( ON ?auto_859427 ?auto_859426 ) ( not ( = ?auto_859420 ?auto_859421 ) ) ( not ( = ?auto_859420 ?auto_859422 ) ) ( not ( = ?auto_859420 ?auto_859423 ) ) ( not ( = ?auto_859420 ?auto_859424 ) ) ( not ( = ?auto_859420 ?auto_859425 ) ) ( not ( = ?auto_859420 ?auto_859426 ) ) ( not ( = ?auto_859420 ?auto_859427 ) ) ( not ( = ?auto_859420 ?auto_859428 ) ) ( not ( = ?auto_859420 ?auto_859429 ) ) ( not ( = ?auto_859420 ?auto_859434 ) ) ( not ( = ?auto_859421 ?auto_859422 ) ) ( not ( = ?auto_859421 ?auto_859423 ) ) ( not ( = ?auto_859421 ?auto_859424 ) ) ( not ( = ?auto_859421 ?auto_859425 ) ) ( not ( = ?auto_859421 ?auto_859426 ) ) ( not ( = ?auto_859421 ?auto_859427 ) ) ( not ( = ?auto_859421 ?auto_859428 ) ) ( not ( = ?auto_859421 ?auto_859429 ) ) ( not ( = ?auto_859421 ?auto_859434 ) ) ( not ( = ?auto_859422 ?auto_859423 ) ) ( not ( = ?auto_859422 ?auto_859424 ) ) ( not ( = ?auto_859422 ?auto_859425 ) ) ( not ( = ?auto_859422 ?auto_859426 ) ) ( not ( = ?auto_859422 ?auto_859427 ) ) ( not ( = ?auto_859422 ?auto_859428 ) ) ( not ( = ?auto_859422 ?auto_859429 ) ) ( not ( = ?auto_859422 ?auto_859434 ) ) ( not ( = ?auto_859423 ?auto_859424 ) ) ( not ( = ?auto_859423 ?auto_859425 ) ) ( not ( = ?auto_859423 ?auto_859426 ) ) ( not ( = ?auto_859423 ?auto_859427 ) ) ( not ( = ?auto_859423 ?auto_859428 ) ) ( not ( = ?auto_859423 ?auto_859429 ) ) ( not ( = ?auto_859423 ?auto_859434 ) ) ( not ( = ?auto_859424 ?auto_859425 ) ) ( not ( = ?auto_859424 ?auto_859426 ) ) ( not ( = ?auto_859424 ?auto_859427 ) ) ( not ( = ?auto_859424 ?auto_859428 ) ) ( not ( = ?auto_859424 ?auto_859429 ) ) ( not ( = ?auto_859424 ?auto_859434 ) ) ( not ( = ?auto_859425 ?auto_859426 ) ) ( not ( = ?auto_859425 ?auto_859427 ) ) ( not ( = ?auto_859425 ?auto_859428 ) ) ( not ( = ?auto_859425 ?auto_859429 ) ) ( not ( = ?auto_859425 ?auto_859434 ) ) ( not ( = ?auto_859426 ?auto_859427 ) ) ( not ( = ?auto_859426 ?auto_859428 ) ) ( not ( = ?auto_859426 ?auto_859429 ) ) ( not ( = ?auto_859426 ?auto_859434 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859427 ?auto_859428 ?auto_859429 )
      ( MAKE-9CRATE-VERIFY ?auto_859420 ?auto_859421 ?auto_859422 ?auto_859423 ?auto_859424 ?auto_859425 ?auto_859426 ?auto_859427 ?auto_859428 ?auto_859429 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859529 - SURFACE
      ?auto_859530 - SURFACE
      ?auto_859531 - SURFACE
      ?auto_859532 - SURFACE
      ?auto_859533 - SURFACE
      ?auto_859534 - SURFACE
      ?auto_859535 - SURFACE
      ?auto_859536 - SURFACE
      ?auto_859537 - SURFACE
      ?auto_859538 - SURFACE
    )
    :vars
    (
      ?auto_859540 - HOIST
      ?auto_859539 - PLACE
      ?auto_859543 - PLACE
      ?auto_859542 - HOIST
      ?auto_859544 - SURFACE
      ?auto_859541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859540 ?auto_859539 ) ( IS-CRATE ?auto_859538 ) ( not ( = ?auto_859537 ?auto_859538 ) ) ( not ( = ?auto_859536 ?auto_859537 ) ) ( not ( = ?auto_859536 ?auto_859538 ) ) ( not ( = ?auto_859543 ?auto_859539 ) ) ( HOIST-AT ?auto_859542 ?auto_859543 ) ( not ( = ?auto_859540 ?auto_859542 ) ) ( AVAILABLE ?auto_859542 ) ( SURFACE-AT ?auto_859538 ?auto_859543 ) ( ON ?auto_859538 ?auto_859544 ) ( CLEAR ?auto_859538 ) ( not ( = ?auto_859537 ?auto_859544 ) ) ( not ( = ?auto_859538 ?auto_859544 ) ) ( not ( = ?auto_859536 ?auto_859544 ) ) ( TRUCK-AT ?auto_859541 ?auto_859539 ) ( SURFACE-AT ?auto_859536 ?auto_859539 ) ( CLEAR ?auto_859536 ) ( LIFTING ?auto_859540 ?auto_859537 ) ( IS-CRATE ?auto_859537 ) ( ON ?auto_859530 ?auto_859529 ) ( ON ?auto_859531 ?auto_859530 ) ( ON ?auto_859532 ?auto_859531 ) ( ON ?auto_859533 ?auto_859532 ) ( ON ?auto_859534 ?auto_859533 ) ( ON ?auto_859535 ?auto_859534 ) ( ON ?auto_859536 ?auto_859535 ) ( not ( = ?auto_859529 ?auto_859530 ) ) ( not ( = ?auto_859529 ?auto_859531 ) ) ( not ( = ?auto_859529 ?auto_859532 ) ) ( not ( = ?auto_859529 ?auto_859533 ) ) ( not ( = ?auto_859529 ?auto_859534 ) ) ( not ( = ?auto_859529 ?auto_859535 ) ) ( not ( = ?auto_859529 ?auto_859536 ) ) ( not ( = ?auto_859529 ?auto_859537 ) ) ( not ( = ?auto_859529 ?auto_859538 ) ) ( not ( = ?auto_859529 ?auto_859544 ) ) ( not ( = ?auto_859530 ?auto_859531 ) ) ( not ( = ?auto_859530 ?auto_859532 ) ) ( not ( = ?auto_859530 ?auto_859533 ) ) ( not ( = ?auto_859530 ?auto_859534 ) ) ( not ( = ?auto_859530 ?auto_859535 ) ) ( not ( = ?auto_859530 ?auto_859536 ) ) ( not ( = ?auto_859530 ?auto_859537 ) ) ( not ( = ?auto_859530 ?auto_859538 ) ) ( not ( = ?auto_859530 ?auto_859544 ) ) ( not ( = ?auto_859531 ?auto_859532 ) ) ( not ( = ?auto_859531 ?auto_859533 ) ) ( not ( = ?auto_859531 ?auto_859534 ) ) ( not ( = ?auto_859531 ?auto_859535 ) ) ( not ( = ?auto_859531 ?auto_859536 ) ) ( not ( = ?auto_859531 ?auto_859537 ) ) ( not ( = ?auto_859531 ?auto_859538 ) ) ( not ( = ?auto_859531 ?auto_859544 ) ) ( not ( = ?auto_859532 ?auto_859533 ) ) ( not ( = ?auto_859532 ?auto_859534 ) ) ( not ( = ?auto_859532 ?auto_859535 ) ) ( not ( = ?auto_859532 ?auto_859536 ) ) ( not ( = ?auto_859532 ?auto_859537 ) ) ( not ( = ?auto_859532 ?auto_859538 ) ) ( not ( = ?auto_859532 ?auto_859544 ) ) ( not ( = ?auto_859533 ?auto_859534 ) ) ( not ( = ?auto_859533 ?auto_859535 ) ) ( not ( = ?auto_859533 ?auto_859536 ) ) ( not ( = ?auto_859533 ?auto_859537 ) ) ( not ( = ?auto_859533 ?auto_859538 ) ) ( not ( = ?auto_859533 ?auto_859544 ) ) ( not ( = ?auto_859534 ?auto_859535 ) ) ( not ( = ?auto_859534 ?auto_859536 ) ) ( not ( = ?auto_859534 ?auto_859537 ) ) ( not ( = ?auto_859534 ?auto_859538 ) ) ( not ( = ?auto_859534 ?auto_859544 ) ) ( not ( = ?auto_859535 ?auto_859536 ) ) ( not ( = ?auto_859535 ?auto_859537 ) ) ( not ( = ?auto_859535 ?auto_859538 ) ) ( not ( = ?auto_859535 ?auto_859544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859536 ?auto_859537 ?auto_859538 )
      ( MAKE-9CRATE-VERIFY ?auto_859529 ?auto_859530 ?auto_859531 ?auto_859532 ?auto_859533 ?auto_859534 ?auto_859535 ?auto_859536 ?auto_859537 ?auto_859538 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_859638 - SURFACE
      ?auto_859639 - SURFACE
      ?auto_859640 - SURFACE
      ?auto_859641 - SURFACE
      ?auto_859642 - SURFACE
      ?auto_859643 - SURFACE
      ?auto_859644 - SURFACE
      ?auto_859645 - SURFACE
      ?auto_859646 - SURFACE
      ?auto_859647 - SURFACE
    )
    :vars
    (
      ?auto_859653 - HOIST
      ?auto_859651 - PLACE
      ?auto_859649 - PLACE
      ?auto_859652 - HOIST
      ?auto_859650 - SURFACE
      ?auto_859648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859653 ?auto_859651 ) ( IS-CRATE ?auto_859647 ) ( not ( = ?auto_859646 ?auto_859647 ) ) ( not ( = ?auto_859645 ?auto_859646 ) ) ( not ( = ?auto_859645 ?auto_859647 ) ) ( not ( = ?auto_859649 ?auto_859651 ) ) ( HOIST-AT ?auto_859652 ?auto_859649 ) ( not ( = ?auto_859653 ?auto_859652 ) ) ( AVAILABLE ?auto_859652 ) ( SURFACE-AT ?auto_859647 ?auto_859649 ) ( ON ?auto_859647 ?auto_859650 ) ( CLEAR ?auto_859647 ) ( not ( = ?auto_859646 ?auto_859650 ) ) ( not ( = ?auto_859647 ?auto_859650 ) ) ( not ( = ?auto_859645 ?auto_859650 ) ) ( TRUCK-AT ?auto_859648 ?auto_859651 ) ( SURFACE-AT ?auto_859645 ?auto_859651 ) ( CLEAR ?auto_859645 ) ( IS-CRATE ?auto_859646 ) ( AVAILABLE ?auto_859653 ) ( IN ?auto_859646 ?auto_859648 ) ( ON ?auto_859639 ?auto_859638 ) ( ON ?auto_859640 ?auto_859639 ) ( ON ?auto_859641 ?auto_859640 ) ( ON ?auto_859642 ?auto_859641 ) ( ON ?auto_859643 ?auto_859642 ) ( ON ?auto_859644 ?auto_859643 ) ( ON ?auto_859645 ?auto_859644 ) ( not ( = ?auto_859638 ?auto_859639 ) ) ( not ( = ?auto_859638 ?auto_859640 ) ) ( not ( = ?auto_859638 ?auto_859641 ) ) ( not ( = ?auto_859638 ?auto_859642 ) ) ( not ( = ?auto_859638 ?auto_859643 ) ) ( not ( = ?auto_859638 ?auto_859644 ) ) ( not ( = ?auto_859638 ?auto_859645 ) ) ( not ( = ?auto_859638 ?auto_859646 ) ) ( not ( = ?auto_859638 ?auto_859647 ) ) ( not ( = ?auto_859638 ?auto_859650 ) ) ( not ( = ?auto_859639 ?auto_859640 ) ) ( not ( = ?auto_859639 ?auto_859641 ) ) ( not ( = ?auto_859639 ?auto_859642 ) ) ( not ( = ?auto_859639 ?auto_859643 ) ) ( not ( = ?auto_859639 ?auto_859644 ) ) ( not ( = ?auto_859639 ?auto_859645 ) ) ( not ( = ?auto_859639 ?auto_859646 ) ) ( not ( = ?auto_859639 ?auto_859647 ) ) ( not ( = ?auto_859639 ?auto_859650 ) ) ( not ( = ?auto_859640 ?auto_859641 ) ) ( not ( = ?auto_859640 ?auto_859642 ) ) ( not ( = ?auto_859640 ?auto_859643 ) ) ( not ( = ?auto_859640 ?auto_859644 ) ) ( not ( = ?auto_859640 ?auto_859645 ) ) ( not ( = ?auto_859640 ?auto_859646 ) ) ( not ( = ?auto_859640 ?auto_859647 ) ) ( not ( = ?auto_859640 ?auto_859650 ) ) ( not ( = ?auto_859641 ?auto_859642 ) ) ( not ( = ?auto_859641 ?auto_859643 ) ) ( not ( = ?auto_859641 ?auto_859644 ) ) ( not ( = ?auto_859641 ?auto_859645 ) ) ( not ( = ?auto_859641 ?auto_859646 ) ) ( not ( = ?auto_859641 ?auto_859647 ) ) ( not ( = ?auto_859641 ?auto_859650 ) ) ( not ( = ?auto_859642 ?auto_859643 ) ) ( not ( = ?auto_859642 ?auto_859644 ) ) ( not ( = ?auto_859642 ?auto_859645 ) ) ( not ( = ?auto_859642 ?auto_859646 ) ) ( not ( = ?auto_859642 ?auto_859647 ) ) ( not ( = ?auto_859642 ?auto_859650 ) ) ( not ( = ?auto_859643 ?auto_859644 ) ) ( not ( = ?auto_859643 ?auto_859645 ) ) ( not ( = ?auto_859643 ?auto_859646 ) ) ( not ( = ?auto_859643 ?auto_859647 ) ) ( not ( = ?auto_859643 ?auto_859650 ) ) ( not ( = ?auto_859644 ?auto_859645 ) ) ( not ( = ?auto_859644 ?auto_859646 ) ) ( not ( = ?auto_859644 ?auto_859647 ) ) ( not ( = ?auto_859644 ?auto_859650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_859645 ?auto_859646 ?auto_859647 )
      ( MAKE-9CRATE-VERIFY ?auto_859638 ?auto_859639 ?auto_859640 ?auto_859641 ?auto_859642 ?auto_859643 ?auto_859644 ?auto_859645 ?auto_859646 ?auto_859647 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_865203 - SURFACE
      ?auto_865204 - SURFACE
      ?auto_865205 - SURFACE
      ?auto_865206 - SURFACE
      ?auto_865207 - SURFACE
      ?auto_865208 - SURFACE
      ?auto_865209 - SURFACE
      ?auto_865210 - SURFACE
      ?auto_865211 - SURFACE
      ?auto_865212 - SURFACE
      ?auto_865213 - SURFACE
    )
    :vars
    (
      ?auto_865215 - HOIST
      ?auto_865214 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_865215 ?auto_865214 ) ( SURFACE-AT ?auto_865212 ?auto_865214 ) ( CLEAR ?auto_865212 ) ( LIFTING ?auto_865215 ?auto_865213 ) ( IS-CRATE ?auto_865213 ) ( not ( = ?auto_865212 ?auto_865213 ) ) ( ON ?auto_865204 ?auto_865203 ) ( ON ?auto_865205 ?auto_865204 ) ( ON ?auto_865206 ?auto_865205 ) ( ON ?auto_865207 ?auto_865206 ) ( ON ?auto_865208 ?auto_865207 ) ( ON ?auto_865209 ?auto_865208 ) ( ON ?auto_865210 ?auto_865209 ) ( ON ?auto_865211 ?auto_865210 ) ( ON ?auto_865212 ?auto_865211 ) ( not ( = ?auto_865203 ?auto_865204 ) ) ( not ( = ?auto_865203 ?auto_865205 ) ) ( not ( = ?auto_865203 ?auto_865206 ) ) ( not ( = ?auto_865203 ?auto_865207 ) ) ( not ( = ?auto_865203 ?auto_865208 ) ) ( not ( = ?auto_865203 ?auto_865209 ) ) ( not ( = ?auto_865203 ?auto_865210 ) ) ( not ( = ?auto_865203 ?auto_865211 ) ) ( not ( = ?auto_865203 ?auto_865212 ) ) ( not ( = ?auto_865203 ?auto_865213 ) ) ( not ( = ?auto_865204 ?auto_865205 ) ) ( not ( = ?auto_865204 ?auto_865206 ) ) ( not ( = ?auto_865204 ?auto_865207 ) ) ( not ( = ?auto_865204 ?auto_865208 ) ) ( not ( = ?auto_865204 ?auto_865209 ) ) ( not ( = ?auto_865204 ?auto_865210 ) ) ( not ( = ?auto_865204 ?auto_865211 ) ) ( not ( = ?auto_865204 ?auto_865212 ) ) ( not ( = ?auto_865204 ?auto_865213 ) ) ( not ( = ?auto_865205 ?auto_865206 ) ) ( not ( = ?auto_865205 ?auto_865207 ) ) ( not ( = ?auto_865205 ?auto_865208 ) ) ( not ( = ?auto_865205 ?auto_865209 ) ) ( not ( = ?auto_865205 ?auto_865210 ) ) ( not ( = ?auto_865205 ?auto_865211 ) ) ( not ( = ?auto_865205 ?auto_865212 ) ) ( not ( = ?auto_865205 ?auto_865213 ) ) ( not ( = ?auto_865206 ?auto_865207 ) ) ( not ( = ?auto_865206 ?auto_865208 ) ) ( not ( = ?auto_865206 ?auto_865209 ) ) ( not ( = ?auto_865206 ?auto_865210 ) ) ( not ( = ?auto_865206 ?auto_865211 ) ) ( not ( = ?auto_865206 ?auto_865212 ) ) ( not ( = ?auto_865206 ?auto_865213 ) ) ( not ( = ?auto_865207 ?auto_865208 ) ) ( not ( = ?auto_865207 ?auto_865209 ) ) ( not ( = ?auto_865207 ?auto_865210 ) ) ( not ( = ?auto_865207 ?auto_865211 ) ) ( not ( = ?auto_865207 ?auto_865212 ) ) ( not ( = ?auto_865207 ?auto_865213 ) ) ( not ( = ?auto_865208 ?auto_865209 ) ) ( not ( = ?auto_865208 ?auto_865210 ) ) ( not ( = ?auto_865208 ?auto_865211 ) ) ( not ( = ?auto_865208 ?auto_865212 ) ) ( not ( = ?auto_865208 ?auto_865213 ) ) ( not ( = ?auto_865209 ?auto_865210 ) ) ( not ( = ?auto_865209 ?auto_865211 ) ) ( not ( = ?auto_865209 ?auto_865212 ) ) ( not ( = ?auto_865209 ?auto_865213 ) ) ( not ( = ?auto_865210 ?auto_865211 ) ) ( not ( = ?auto_865210 ?auto_865212 ) ) ( not ( = ?auto_865210 ?auto_865213 ) ) ( not ( = ?auto_865211 ?auto_865212 ) ) ( not ( = ?auto_865211 ?auto_865213 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_865212 ?auto_865213 )
      ( MAKE-10CRATE-VERIFY ?auto_865203 ?auto_865204 ?auto_865205 ?auto_865206 ?auto_865207 ?auto_865208 ?auto_865209 ?auto_865210 ?auto_865211 ?auto_865212 ?auto_865213 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_865297 - SURFACE
      ?auto_865298 - SURFACE
      ?auto_865299 - SURFACE
      ?auto_865300 - SURFACE
      ?auto_865301 - SURFACE
      ?auto_865302 - SURFACE
      ?auto_865303 - SURFACE
      ?auto_865304 - SURFACE
      ?auto_865305 - SURFACE
      ?auto_865306 - SURFACE
      ?auto_865307 - SURFACE
    )
    :vars
    (
      ?auto_865309 - HOIST
      ?auto_865308 - PLACE
      ?auto_865310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_865309 ?auto_865308 ) ( SURFACE-AT ?auto_865306 ?auto_865308 ) ( CLEAR ?auto_865306 ) ( IS-CRATE ?auto_865307 ) ( not ( = ?auto_865306 ?auto_865307 ) ) ( TRUCK-AT ?auto_865310 ?auto_865308 ) ( AVAILABLE ?auto_865309 ) ( IN ?auto_865307 ?auto_865310 ) ( ON ?auto_865306 ?auto_865305 ) ( not ( = ?auto_865305 ?auto_865306 ) ) ( not ( = ?auto_865305 ?auto_865307 ) ) ( ON ?auto_865298 ?auto_865297 ) ( ON ?auto_865299 ?auto_865298 ) ( ON ?auto_865300 ?auto_865299 ) ( ON ?auto_865301 ?auto_865300 ) ( ON ?auto_865302 ?auto_865301 ) ( ON ?auto_865303 ?auto_865302 ) ( ON ?auto_865304 ?auto_865303 ) ( ON ?auto_865305 ?auto_865304 ) ( not ( = ?auto_865297 ?auto_865298 ) ) ( not ( = ?auto_865297 ?auto_865299 ) ) ( not ( = ?auto_865297 ?auto_865300 ) ) ( not ( = ?auto_865297 ?auto_865301 ) ) ( not ( = ?auto_865297 ?auto_865302 ) ) ( not ( = ?auto_865297 ?auto_865303 ) ) ( not ( = ?auto_865297 ?auto_865304 ) ) ( not ( = ?auto_865297 ?auto_865305 ) ) ( not ( = ?auto_865297 ?auto_865306 ) ) ( not ( = ?auto_865297 ?auto_865307 ) ) ( not ( = ?auto_865298 ?auto_865299 ) ) ( not ( = ?auto_865298 ?auto_865300 ) ) ( not ( = ?auto_865298 ?auto_865301 ) ) ( not ( = ?auto_865298 ?auto_865302 ) ) ( not ( = ?auto_865298 ?auto_865303 ) ) ( not ( = ?auto_865298 ?auto_865304 ) ) ( not ( = ?auto_865298 ?auto_865305 ) ) ( not ( = ?auto_865298 ?auto_865306 ) ) ( not ( = ?auto_865298 ?auto_865307 ) ) ( not ( = ?auto_865299 ?auto_865300 ) ) ( not ( = ?auto_865299 ?auto_865301 ) ) ( not ( = ?auto_865299 ?auto_865302 ) ) ( not ( = ?auto_865299 ?auto_865303 ) ) ( not ( = ?auto_865299 ?auto_865304 ) ) ( not ( = ?auto_865299 ?auto_865305 ) ) ( not ( = ?auto_865299 ?auto_865306 ) ) ( not ( = ?auto_865299 ?auto_865307 ) ) ( not ( = ?auto_865300 ?auto_865301 ) ) ( not ( = ?auto_865300 ?auto_865302 ) ) ( not ( = ?auto_865300 ?auto_865303 ) ) ( not ( = ?auto_865300 ?auto_865304 ) ) ( not ( = ?auto_865300 ?auto_865305 ) ) ( not ( = ?auto_865300 ?auto_865306 ) ) ( not ( = ?auto_865300 ?auto_865307 ) ) ( not ( = ?auto_865301 ?auto_865302 ) ) ( not ( = ?auto_865301 ?auto_865303 ) ) ( not ( = ?auto_865301 ?auto_865304 ) ) ( not ( = ?auto_865301 ?auto_865305 ) ) ( not ( = ?auto_865301 ?auto_865306 ) ) ( not ( = ?auto_865301 ?auto_865307 ) ) ( not ( = ?auto_865302 ?auto_865303 ) ) ( not ( = ?auto_865302 ?auto_865304 ) ) ( not ( = ?auto_865302 ?auto_865305 ) ) ( not ( = ?auto_865302 ?auto_865306 ) ) ( not ( = ?auto_865302 ?auto_865307 ) ) ( not ( = ?auto_865303 ?auto_865304 ) ) ( not ( = ?auto_865303 ?auto_865305 ) ) ( not ( = ?auto_865303 ?auto_865306 ) ) ( not ( = ?auto_865303 ?auto_865307 ) ) ( not ( = ?auto_865304 ?auto_865305 ) ) ( not ( = ?auto_865304 ?auto_865306 ) ) ( not ( = ?auto_865304 ?auto_865307 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_865305 ?auto_865306 ?auto_865307 )
      ( MAKE-10CRATE-VERIFY ?auto_865297 ?auto_865298 ?auto_865299 ?auto_865300 ?auto_865301 ?auto_865302 ?auto_865303 ?auto_865304 ?auto_865305 ?auto_865306 ?auto_865307 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_865402 - SURFACE
      ?auto_865403 - SURFACE
      ?auto_865404 - SURFACE
      ?auto_865405 - SURFACE
      ?auto_865406 - SURFACE
      ?auto_865407 - SURFACE
      ?auto_865408 - SURFACE
      ?auto_865409 - SURFACE
      ?auto_865410 - SURFACE
      ?auto_865411 - SURFACE
      ?auto_865412 - SURFACE
    )
    :vars
    (
      ?auto_865415 - HOIST
      ?auto_865413 - PLACE
      ?auto_865416 - TRUCK
      ?auto_865414 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_865415 ?auto_865413 ) ( SURFACE-AT ?auto_865411 ?auto_865413 ) ( CLEAR ?auto_865411 ) ( IS-CRATE ?auto_865412 ) ( not ( = ?auto_865411 ?auto_865412 ) ) ( AVAILABLE ?auto_865415 ) ( IN ?auto_865412 ?auto_865416 ) ( ON ?auto_865411 ?auto_865410 ) ( not ( = ?auto_865410 ?auto_865411 ) ) ( not ( = ?auto_865410 ?auto_865412 ) ) ( TRUCK-AT ?auto_865416 ?auto_865414 ) ( not ( = ?auto_865414 ?auto_865413 ) ) ( ON ?auto_865403 ?auto_865402 ) ( ON ?auto_865404 ?auto_865403 ) ( ON ?auto_865405 ?auto_865404 ) ( ON ?auto_865406 ?auto_865405 ) ( ON ?auto_865407 ?auto_865406 ) ( ON ?auto_865408 ?auto_865407 ) ( ON ?auto_865409 ?auto_865408 ) ( ON ?auto_865410 ?auto_865409 ) ( not ( = ?auto_865402 ?auto_865403 ) ) ( not ( = ?auto_865402 ?auto_865404 ) ) ( not ( = ?auto_865402 ?auto_865405 ) ) ( not ( = ?auto_865402 ?auto_865406 ) ) ( not ( = ?auto_865402 ?auto_865407 ) ) ( not ( = ?auto_865402 ?auto_865408 ) ) ( not ( = ?auto_865402 ?auto_865409 ) ) ( not ( = ?auto_865402 ?auto_865410 ) ) ( not ( = ?auto_865402 ?auto_865411 ) ) ( not ( = ?auto_865402 ?auto_865412 ) ) ( not ( = ?auto_865403 ?auto_865404 ) ) ( not ( = ?auto_865403 ?auto_865405 ) ) ( not ( = ?auto_865403 ?auto_865406 ) ) ( not ( = ?auto_865403 ?auto_865407 ) ) ( not ( = ?auto_865403 ?auto_865408 ) ) ( not ( = ?auto_865403 ?auto_865409 ) ) ( not ( = ?auto_865403 ?auto_865410 ) ) ( not ( = ?auto_865403 ?auto_865411 ) ) ( not ( = ?auto_865403 ?auto_865412 ) ) ( not ( = ?auto_865404 ?auto_865405 ) ) ( not ( = ?auto_865404 ?auto_865406 ) ) ( not ( = ?auto_865404 ?auto_865407 ) ) ( not ( = ?auto_865404 ?auto_865408 ) ) ( not ( = ?auto_865404 ?auto_865409 ) ) ( not ( = ?auto_865404 ?auto_865410 ) ) ( not ( = ?auto_865404 ?auto_865411 ) ) ( not ( = ?auto_865404 ?auto_865412 ) ) ( not ( = ?auto_865405 ?auto_865406 ) ) ( not ( = ?auto_865405 ?auto_865407 ) ) ( not ( = ?auto_865405 ?auto_865408 ) ) ( not ( = ?auto_865405 ?auto_865409 ) ) ( not ( = ?auto_865405 ?auto_865410 ) ) ( not ( = ?auto_865405 ?auto_865411 ) ) ( not ( = ?auto_865405 ?auto_865412 ) ) ( not ( = ?auto_865406 ?auto_865407 ) ) ( not ( = ?auto_865406 ?auto_865408 ) ) ( not ( = ?auto_865406 ?auto_865409 ) ) ( not ( = ?auto_865406 ?auto_865410 ) ) ( not ( = ?auto_865406 ?auto_865411 ) ) ( not ( = ?auto_865406 ?auto_865412 ) ) ( not ( = ?auto_865407 ?auto_865408 ) ) ( not ( = ?auto_865407 ?auto_865409 ) ) ( not ( = ?auto_865407 ?auto_865410 ) ) ( not ( = ?auto_865407 ?auto_865411 ) ) ( not ( = ?auto_865407 ?auto_865412 ) ) ( not ( = ?auto_865408 ?auto_865409 ) ) ( not ( = ?auto_865408 ?auto_865410 ) ) ( not ( = ?auto_865408 ?auto_865411 ) ) ( not ( = ?auto_865408 ?auto_865412 ) ) ( not ( = ?auto_865409 ?auto_865410 ) ) ( not ( = ?auto_865409 ?auto_865411 ) ) ( not ( = ?auto_865409 ?auto_865412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_865410 ?auto_865411 ?auto_865412 )
      ( MAKE-10CRATE-VERIFY ?auto_865402 ?auto_865403 ?auto_865404 ?auto_865405 ?auto_865406 ?auto_865407 ?auto_865408 ?auto_865409 ?auto_865410 ?auto_865411 ?auto_865412 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_865517 - SURFACE
      ?auto_865518 - SURFACE
      ?auto_865519 - SURFACE
      ?auto_865520 - SURFACE
      ?auto_865521 - SURFACE
      ?auto_865522 - SURFACE
      ?auto_865523 - SURFACE
      ?auto_865524 - SURFACE
      ?auto_865525 - SURFACE
      ?auto_865526 - SURFACE
      ?auto_865527 - SURFACE
    )
    :vars
    (
      ?auto_865532 - HOIST
      ?auto_865530 - PLACE
      ?auto_865531 - TRUCK
      ?auto_865529 - PLACE
      ?auto_865528 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_865532 ?auto_865530 ) ( SURFACE-AT ?auto_865526 ?auto_865530 ) ( CLEAR ?auto_865526 ) ( IS-CRATE ?auto_865527 ) ( not ( = ?auto_865526 ?auto_865527 ) ) ( AVAILABLE ?auto_865532 ) ( ON ?auto_865526 ?auto_865525 ) ( not ( = ?auto_865525 ?auto_865526 ) ) ( not ( = ?auto_865525 ?auto_865527 ) ) ( TRUCK-AT ?auto_865531 ?auto_865529 ) ( not ( = ?auto_865529 ?auto_865530 ) ) ( HOIST-AT ?auto_865528 ?auto_865529 ) ( LIFTING ?auto_865528 ?auto_865527 ) ( not ( = ?auto_865532 ?auto_865528 ) ) ( ON ?auto_865518 ?auto_865517 ) ( ON ?auto_865519 ?auto_865518 ) ( ON ?auto_865520 ?auto_865519 ) ( ON ?auto_865521 ?auto_865520 ) ( ON ?auto_865522 ?auto_865521 ) ( ON ?auto_865523 ?auto_865522 ) ( ON ?auto_865524 ?auto_865523 ) ( ON ?auto_865525 ?auto_865524 ) ( not ( = ?auto_865517 ?auto_865518 ) ) ( not ( = ?auto_865517 ?auto_865519 ) ) ( not ( = ?auto_865517 ?auto_865520 ) ) ( not ( = ?auto_865517 ?auto_865521 ) ) ( not ( = ?auto_865517 ?auto_865522 ) ) ( not ( = ?auto_865517 ?auto_865523 ) ) ( not ( = ?auto_865517 ?auto_865524 ) ) ( not ( = ?auto_865517 ?auto_865525 ) ) ( not ( = ?auto_865517 ?auto_865526 ) ) ( not ( = ?auto_865517 ?auto_865527 ) ) ( not ( = ?auto_865518 ?auto_865519 ) ) ( not ( = ?auto_865518 ?auto_865520 ) ) ( not ( = ?auto_865518 ?auto_865521 ) ) ( not ( = ?auto_865518 ?auto_865522 ) ) ( not ( = ?auto_865518 ?auto_865523 ) ) ( not ( = ?auto_865518 ?auto_865524 ) ) ( not ( = ?auto_865518 ?auto_865525 ) ) ( not ( = ?auto_865518 ?auto_865526 ) ) ( not ( = ?auto_865518 ?auto_865527 ) ) ( not ( = ?auto_865519 ?auto_865520 ) ) ( not ( = ?auto_865519 ?auto_865521 ) ) ( not ( = ?auto_865519 ?auto_865522 ) ) ( not ( = ?auto_865519 ?auto_865523 ) ) ( not ( = ?auto_865519 ?auto_865524 ) ) ( not ( = ?auto_865519 ?auto_865525 ) ) ( not ( = ?auto_865519 ?auto_865526 ) ) ( not ( = ?auto_865519 ?auto_865527 ) ) ( not ( = ?auto_865520 ?auto_865521 ) ) ( not ( = ?auto_865520 ?auto_865522 ) ) ( not ( = ?auto_865520 ?auto_865523 ) ) ( not ( = ?auto_865520 ?auto_865524 ) ) ( not ( = ?auto_865520 ?auto_865525 ) ) ( not ( = ?auto_865520 ?auto_865526 ) ) ( not ( = ?auto_865520 ?auto_865527 ) ) ( not ( = ?auto_865521 ?auto_865522 ) ) ( not ( = ?auto_865521 ?auto_865523 ) ) ( not ( = ?auto_865521 ?auto_865524 ) ) ( not ( = ?auto_865521 ?auto_865525 ) ) ( not ( = ?auto_865521 ?auto_865526 ) ) ( not ( = ?auto_865521 ?auto_865527 ) ) ( not ( = ?auto_865522 ?auto_865523 ) ) ( not ( = ?auto_865522 ?auto_865524 ) ) ( not ( = ?auto_865522 ?auto_865525 ) ) ( not ( = ?auto_865522 ?auto_865526 ) ) ( not ( = ?auto_865522 ?auto_865527 ) ) ( not ( = ?auto_865523 ?auto_865524 ) ) ( not ( = ?auto_865523 ?auto_865525 ) ) ( not ( = ?auto_865523 ?auto_865526 ) ) ( not ( = ?auto_865523 ?auto_865527 ) ) ( not ( = ?auto_865524 ?auto_865525 ) ) ( not ( = ?auto_865524 ?auto_865526 ) ) ( not ( = ?auto_865524 ?auto_865527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_865525 ?auto_865526 ?auto_865527 )
      ( MAKE-10CRATE-VERIFY ?auto_865517 ?auto_865518 ?auto_865519 ?auto_865520 ?auto_865521 ?auto_865522 ?auto_865523 ?auto_865524 ?auto_865525 ?auto_865526 ?auto_865527 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_865642 - SURFACE
      ?auto_865643 - SURFACE
      ?auto_865644 - SURFACE
      ?auto_865645 - SURFACE
      ?auto_865646 - SURFACE
      ?auto_865647 - SURFACE
      ?auto_865648 - SURFACE
      ?auto_865649 - SURFACE
      ?auto_865650 - SURFACE
      ?auto_865651 - SURFACE
      ?auto_865652 - SURFACE
    )
    :vars
    (
      ?auto_865655 - HOIST
      ?auto_865658 - PLACE
      ?auto_865656 - TRUCK
      ?auto_865654 - PLACE
      ?auto_865657 - HOIST
      ?auto_865653 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_865655 ?auto_865658 ) ( SURFACE-AT ?auto_865651 ?auto_865658 ) ( CLEAR ?auto_865651 ) ( IS-CRATE ?auto_865652 ) ( not ( = ?auto_865651 ?auto_865652 ) ) ( AVAILABLE ?auto_865655 ) ( ON ?auto_865651 ?auto_865650 ) ( not ( = ?auto_865650 ?auto_865651 ) ) ( not ( = ?auto_865650 ?auto_865652 ) ) ( TRUCK-AT ?auto_865656 ?auto_865654 ) ( not ( = ?auto_865654 ?auto_865658 ) ) ( HOIST-AT ?auto_865657 ?auto_865654 ) ( not ( = ?auto_865655 ?auto_865657 ) ) ( AVAILABLE ?auto_865657 ) ( SURFACE-AT ?auto_865652 ?auto_865654 ) ( ON ?auto_865652 ?auto_865653 ) ( CLEAR ?auto_865652 ) ( not ( = ?auto_865651 ?auto_865653 ) ) ( not ( = ?auto_865652 ?auto_865653 ) ) ( not ( = ?auto_865650 ?auto_865653 ) ) ( ON ?auto_865643 ?auto_865642 ) ( ON ?auto_865644 ?auto_865643 ) ( ON ?auto_865645 ?auto_865644 ) ( ON ?auto_865646 ?auto_865645 ) ( ON ?auto_865647 ?auto_865646 ) ( ON ?auto_865648 ?auto_865647 ) ( ON ?auto_865649 ?auto_865648 ) ( ON ?auto_865650 ?auto_865649 ) ( not ( = ?auto_865642 ?auto_865643 ) ) ( not ( = ?auto_865642 ?auto_865644 ) ) ( not ( = ?auto_865642 ?auto_865645 ) ) ( not ( = ?auto_865642 ?auto_865646 ) ) ( not ( = ?auto_865642 ?auto_865647 ) ) ( not ( = ?auto_865642 ?auto_865648 ) ) ( not ( = ?auto_865642 ?auto_865649 ) ) ( not ( = ?auto_865642 ?auto_865650 ) ) ( not ( = ?auto_865642 ?auto_865651 ) ) ( not ( = ?auto_865642 ?auto_865652 ) ) ( not ( = ?auto_865642 ?auto_865653 ) ) ( not ( = ?auto_865643 ?auto_865644 ) ) ( not ( = ?auto_865643 ?auto_865645 ) ) ( not ( = ?auto_865643 ?auto_865646 ) ) ( not ( = ?auto_865643 ?auto_865647 ) ) ( not ( = ?auto_865643 ?auto_865648 ) ) ( not ( = ?auto_865643 ?auto_865649 ) ) ( not ( = ?auto_865643 ?auto_865650 ) ) ( not ( = ?auto_865643 ?auto_865651 ) ) ( not ( = ?auto_865643 ?auto_865652 ) ) ( not ( = ?auto_865643 ?auto_865653 ) ) ( not ( = ?auto_865644 ?auto_865645 ) ) ( not ( = ?auto_865644 ?auto_865646 ) ) ( not ( = ?auto_865644 ?auto_865647 ) ) ( not ( = ?auto_865644 ?auto_865648 ) ) ( not ( = ?auto_865644 ?auto_865649 ) ) ( not ( = ?auto_865644 ?auto_865650 ) ) ( not ( = ?auto_865644 ?auto_865651 ) ) ( not ( = ?auto_865644 ?auto_865652 ) ) ( not ( = ?auto_865644 ?auto_865653 ) ) ( not ( = ?auto_865645 ?auto_865646 ) ) ( not ( = ?auto_865645 ?auto_865647 ) ) ( not ( = ?auto_865645 ?auto_865648 ) ) ( not ( = ?auto_865645 ?auto_865649 ) ) ( not ( = ?auto_865645 ?auto_865650 ) ) ( not ( = ?auto_865645 ?auto_865651 ) ) ( not ( = ?auto_865645 ?auto_865652 ) ) ( not ( = ?auto_865645 ?auto_865653 ) ) ( not ( = ?auto_865646 ?auto_865647 ) ) ( not ( = ?auto_865646 ?auto_865648 ) ) ( not ( = ?auto_865646 ?auto_865649 ) ) ( not ( = ?auto_865646 ?auto_865650 ) ) ( not ( = ?auto_865646 ?auto_865651 ) ) ( not ( = ?auto_865646 ?auto_865652 ) ) ( not ( = ?auto_865646 ?auto_865653 ) ) ( not ( = ?auto_865647 ?auto_865648 ) ) ( not ( = ?auto_865647 ?auto_865649 ) ) ( not ( = ?auto_865647 ?auto_865650 ) ) ( not ( = ?auto_865647 ?auto_865651 ) ) ( not ( = ?auto_865647 ?auto_865652 ) ) ( not ( = ?auto_865647 ?auto_865653 ) ) ( not ( = ?auto_865648 ?auto_865649 ) ) ( not ( = ?auto_865648 ?auto_865650 ) ) ( not ( = ?auto_865648 ?auto_865651 ) ) ( not ( = ?auto_865648 ?auto_865652 ) ) ( not ( = ?auto_865648 ?auto_865653 ) ) ( not ( = ?auto_865649 ?auto_865650 ) ) ( not ( = ?auto_865649 ?auto_865651 ) ) ( not ( = ?auto_865649 ?auto_865652 ) ) ( not ( = ?auto_865649 ?auto_865653 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_865650 ?auto_865651 ?auto_865652 )
      ( MAKE-10CRATE-VERIFY ?auto_865642 ?auto_865643 ?auto_865644 ?auto_865645 ?auto_865646 ?auto_865647 ?auto_865648 ?auto_865649 ?auto_865650 ?auto_865651 ?auto_865652 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_865768 - SURFACE
      ?auto_865769 - SURFACE
      ?auto_865770 - SURFACE
      ?auto_865771 - SURFACE
      ?auto_865772 - SURFACE
      ?auto_865773 - SURFACE
      ?auto_865774 - SURFACE
      ?auto_865775 - SURFACE
      ?auto_865776 - SURFACE
      ?auto_865777 - SURFACE
      ?auto_865778 - SURFACE
    )
    :vars
    (
      ?auto_865781 - HOIST
      ?auto_865784 - PLACE
      ?auto_865783 - PLACE
      ?auto_865779 - HOIST
      ?auto_865782 - SURFACE
      ?auto_865780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_865781 ?auto_865784 ) ( SURFACE-AT ?auto_865777 ?auto_865784 ) ( CLEAR ?auto_865777 ) ( IS-CRATE ?auto_865778 ) ( not ( = ?auto_865777 ?auto_865778 ) ) ( AVAILABLE ?auto_865781 ) ( ON ?auto_865777 ?auto_865776 ) ( not ( = ?auto_865776 ?auto_865777 ) ) ( not ( = ?auto_865776 ?auto_865778 ) ) ( not ( = ?auto_865783 ?auto_865784 ) ) ( HOIST-AT ?auto_865779 ?auto_865783 ) ( not ( = ?auto_865781 ?auto_865779 ) ) ( AVAILABLE ?auto_865779 ) ( SURFACE-AT ?auto_865778 ?auto_865783 ) ( ON ?auto_865778 ?auto_865782 ) ( CLEAR ?auto_865778 ) ( not ( = ?auto_865777 ?auto_865782 ) ) ( not ( = ?auto_865778 ?auto_865782 ) ) ( not ( = ?auto_865776 ?auto_865782 ) ) ( TRUCK-AT ?auto_865780 ?auto_865784 ) ( ON ?auto_865769 ?auto_865768 ) ( ON ?auto_865770 ?auto_865769 ) ( ON ?auto_865771 ?auto_865770 ) ( ON ?auto_865772 ?auto_865771 ) ( ON ?auto_865773 ?auto_865772 ) ( ON ?auto_865774 ?auto_865773 ) ( ON ?auto_865775 ?auto_865774 ) ( ON ?auto_865776 ?auto_865775 ) ( not ( = ?auto_865768 ?auto_865769 ) ) ( not ( = ?auto_865768 ?auto_865770 ) ) ( not ( = ?auto_865768 ?auto_865771 ) ) ( not ( = ?auto_865768 ?auto_865772 ) ) ( not ( = ?auto_865768 ?auto_865773 ) ) ( not ( = ?auto_865768 ?auto_865774 ) ) ( not ( = ?auto_865768 ?auto_865775 ) ) ( not ( = ?auto_865768 ?auto_865776 ) ) ( not ( = ?auto_865768 ?auto_865777 ) ) ( not ( = ?auto_865768 ?auto_865778 ) ) ( not ( = ?auto_865768 ?auto_865782 ) ) ( not ( = ?auto_865769 ?auto_865770 ) ) ( not ( = ?auto_865769 ?auto_865771 ) ) ( not ( = ?auto_865769 ?auto_865772 ) ) ( not ( = ?auto_865769 ?auto_865773 ) ) ( not ( = ?auto_865769 ?auto_865774 ) ) ( not ( = ?auto_865769 ?auto_865775 ) ) ( not ( = ?auto_865769 ?auto_865776 ) ) ( not ( = ?auto_865769 ?auto_865777 ) ) ( not ( = ?auto_865769 ?auto_865778 ) ) ( not ( = ?auto_865769 ?auto_865782 ) ) ( not ( = ?auto_865770 ?auto_865771 ) ) ( not ( = ?auto_865770 ?auto_865772 ) ) ( not ( = ?auto_865770 ?auto_865773 ) ) ( not ( = ?auto_865770 ?auto_865774 ) ) ( not ( = ?auto_865770 ?auto_865775 ) ) ( not ( = ?auto_865770 ?auto_865776 ) ) ( not ( = ?auto_865770 ?auto_865777 ) ) ( not ( = ?auto_865770 ?auto_865778 ) ) ( not ( = ?auto_865770 ?auto_865782 ) ) ( not ( = ?auto_865771 ?auto_865772 ) ) ( not ( = ?auto_865771 ?auto_865773 ) ) ( not ( = ?auto_865771 ?auto_865774 ) ) ( not ( = ?auto_865771 ?auto_865775 ) ) ( not ( = ?auto_865771 ?auto_865776 ) ) ( not ( = ?auto_865771 ?auto_865777 ) ) ( not ( = ?auto_865771 ?auto_865778 ) ) ( not ( = ?auto_865771 ?auto_865782 ) ) ( not ( = ?auto_865772 ?auto_865773 ) ) ( not ( = ?auto_865772 ?auto_865774 ) ) ( not ( = ?auto_865772 ?auto_865775 ) ) ( not ( = ?auto_865772 ?auto_865776 ) ) ( not ( = ?auto_865772 ?auto_865777 ) ) ( not ( = ?auto_865772 ?auto_865778 ) ) ( not ( = ?auto_865772 ?auto_865782 ) ) ( not ( = ?auto_865773 ?auto_865774 ) ) ( not ( = ?auto_865773 ?auto_865775 ) ) ( not ( = ?auto_865773 ?auto_865776 ) ) ( not ( = ?auto_865773 ?auto_865777 ) ) ( not ( = ?auto_865773 ?auto_865778 ) ) ( not ( = ?auto_865773 ?auto_865782 ) ) ( not ( = ?auto_865774 ?auto_865775 ) ) ( not ( = ?auto_865774 ?auto_865776 ) ) ( not ( = ?auto_865774 ?auto_865777 ) ) ( not ( = ?auto_865774 ?auto_865778 ) ) ( not ( = ?auto_865774 ?auto_865782 ) ) ( not ( = ?auto_865775 ?auto_865776 ) ) ( not ( = ?auto_865775 ?auto_865777 ) ) ( not ( = ?auto_865775 ?auto_865778 ) ) ( not ( = ?auto_865775 ?auto_865782 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_865776 ?auto_865777 ?auto_865778 )
      ( MAKE-10CRATE-VERIFY ?auto_865768 ?auto_865769 ?auto_865770 ?auto_865771 ?auto_865772 ?auto_865773 ?auto_865774 ?auto_865775 ?auto_865776 ?auto_865777 ?auto_865778 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_865894 - SURFACE
      ?auto_865895 - SURFACE
      ?auto_865896 - SURFACE
      ?auto_865897 - SURFACE
      ?auto_865898 - SURFACE
      ?auto_865899 - SURFACE
      ?auto_865900 - SURFACE
      ?auto_865901 - SURFACE
      ?auto_865902 - SURFACE
      ?auto_865903 - SURFACE
      ?auto_865904 - SURFACE
    )
    :vars
    (
      ?auto_865909 - HOIST
      ?auto_865910 - PLACE
      ?auto_865905 - PLACE
      ?auto_865907 - HOIST
      ?auto_865906 - SURFACE
      ?auto_865908 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_865909 ?auto_865910 ) ( IS-CRATE ?auto_865904 ) ( not ( = ?auto_865903 ?auto_865904 ) ) ( not ( = ?auto_865902 ?auto_865903 ) ) ( not ( = ?auto_865902 ?auto_865904 ) ) ( not ( = ?auto_865905 ?auto_865910 ) ) ( HOIST-AT ?auto_865907 ?auto_865905 ) ( not ( = ?auto_865909 ?auto_865907 ) ) ( AVAILABLE ?auto_865907 ) ( SURFACE-AT ?auto_865904 ?auto_865905 ) ( ON ?auto_865904 ?auto_865906 ) ( CLEAR ?auto_865904 ) ( not ( = ?auto_865903 ?auto_865906 ) ) ( not ( = ?auto_865904 ?auto_865906 ) ) ( not ( = ?auto_865902 ?auto_865906 ) ) ( TRUCK-AT ?auto_865908 ?auto_865910 ) ( SURFACE-AT ?auto_865902 ?auto_865910 ) ( CLEAR ?auto_865902 ) ( LIFTING ?auto_865909 ?auto_865903 ) ( IS-CRATE ?auto_865903 ) ( ON ?auto_865895 ?auto_865894 ) ( ON ?auto_865896 ?auto_865895 ) ( ON ?auto_865897 ?auto_865896 ) ( ON ?auto_865898 ?auto_865897 ) ( ON ?auto_865899 ?auto_865898 ) ( ON ?auto_865900 ?auto_865899 ) ( ON ?auto_865901 ?auto_865900 ) ( ON ?auto_865902 ?auto_865901 ) ( not ( = ?auto_865894 ?auto_865895 ) ) ( not ( = ?auto_865894 ?auto_865896 ) ) ( not ( = ?auto_865894 ?auto_865897 ) ) ( not ( = ?auto_865894 ?auto_865898 ) ) ( not ( = ?auto_865894 ?auto_865899 ) ) ( not ( = ?auto_865894 ?auto_865900 ) ) ( not ( = ?auto_865894 ?auto_865901 ) ) ( not ( = ?auto_865894 ?auto_865902 ) ) ( not ( = ?auto_865894 ?auto_865903 ) ) ( not ( = ?auto_865894 ?auto_865904 ) ) ( not ( = ?auto_865894 ?auto_865906 ) ) ( not ( = ?auto_865895 ?auto_865896 ) ) ( not ( = ?auto_865895 ?auto_865897 ) ) ( not ( = ?auto_865895 ?auto_865898 ) ) ( not ( = ?auto_865895 ?auto_865899 ) ) ( not ( = ?auto_865895 ?auto_865900 ) ) ( not ( = ?auto_865895 ?auto_865901 ) ) ( not ( = ?auto_865895 ?auto_865902 ) ) ( not ( = ?auto_865895 ?auto_865903 ) ) ( not ( = ?auto_865895 ?auto_865904 ) ) ( not ( = ?auto_865895 ?auto_865906 ) ) ( not ( = ?auto_865896 ?auto_865897 ) ) ( not ( = ?auto_865896 ?auto_865898 ) ) ( not ( = ?auto_865896 ?auto_865899 ) ) ( not ( = ?auto_865896 ?auto_865900 ) ) ( not ( = ?auto_865896 ?auto_865901 ) ) ( not ( = ?auto_865896 ?auto_865902 ) ) ( not ( = ?auto_865896 ?auto_865903 ) ) ( not ( = ?auto_865896 ?auto_865904 ) ) ( not ( = ?auto_865896 ?auto_865906 ) ) ( not ( = ?auto_865897 ?auto_865898 ) ) ( not ( = ?auto_865897 ?auto_865899 ) ) ( not ( = ?auto_865897 ?auto_865900 ) ) ( not ( = ?auto_865897 ?auto_865901 ) ) ( not ( = ?auto_865897 ?auto_865902 ) ) ( not ( = ?auto_865897 ?auto_865903 ) ) ( not ( = ?auto_865897 ?auto_865904 ) ) ( not ( = ?auto_865897 ?auto_865906 ) ) ( not ( = ?auto_865898 ?auto_865899 ) ) ( not ( = ?auto_865898 ?auto_865900 ) ) ( not ( = ?auto_865898 ?auto_865901 ) ) ( not ( = ?auto_865898 ?auto_865902 ) ) ( not ( = ?auto_865898 ?auto_865903 ) ) ( not ( = ?auto_865898 ?auto_865904 ) ) ( not ( = ?auto_865898 ?auto_865906 ) ) ( not ( = ?auto_865899 ?auto_865900 ) ) ( not ( = ?auto_865899 ?auto_865901 ) ) ( not ( = ?auto_865899 ?auto_865902 ) ) ( not ( = ?auto_865899 ?auto_865903 ) ) ( not ( = ?auto_865899 ?auto_865904 ) ) ( not ( = ?auto_865899 ?auto_865906 ) ) ( not ( = ?auto_865900 ?auto_865901 ) ) ( not ( = ?auto_865900 ?auto_865902 ) ) ( not ( = ?auto_865900 ?auto_865903 ) ) ( not ( = ?auto_865900 ?auto_865904 ) ) ( not ( = ?auto_865900 ?auto_865906 ) ) ( not ( = ?auto_865901 ?auto_865902 ) ) ( not ( = ?auto_865901 ?auto_865903 ) ) ( not ( = ?auto_865901 ?auto_865904 ) ) ( not ( = ?auto_865901 ?auto_865906 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_865902 ?auto_865903 ?auto_865904 )
      ( MAKE-10CRATE-VERIFY ?auto_865894 ?auto_865895 ?auto_865896 ?auto_865897 ?auto_865898 ?auto_865899 ?auto_865900 ?auto_865901 ?auto_865902 ?auto_865903 ?auto_865904 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_866020 - SURFACE
      ?auto_866021 - SURFACE
      ?auto_866022 - SURFACE
      ?auto_866023 - SURFACE
      ?auto_866024 - SURFACE
      ?auto_866025 - SURFACE
      ?auto_866026 - SURFACE
      ?auto_866027 - SURFACE
      ?auto_866028 - SURFACE
      ?auto_866029 - SURFACE
      ?auto_866030 - SURFACE
    )
    :vars
    (
      ?auto_866031 - HOIST
      ?auto_866033 - PLACE
      ?auto_866036 - PLACE
      ?auto_866034 - HOIST
      ?auto_866032 - SURFACE
      ?auto_866035 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_866031 ?auto_866033 ) ( IS-CRATE ?auto_866030 ) ( not ( = ?auto_866029 ?auto_866030 ) ) ( not ( = ?auto_866028 ?auto_866029 ) ) ( not ( = ?auto_866028 ?auto_866030 ) ) ( not ( = ?auto_866036 ?auto_866033 ) ) ( HOIST-AT ?auto_866034 ?auto_866036 ) ( not ( = ?auto_866031 ?auto_866034 ) ) ( AVAILABLE ?auto_866034 ) ( SURFACE-AT ?auto_866030 ?auto_866036 ) ( ON ?auto_866030 ?auto_866032 ) ( CLEAR ?auto_866030 ) ( not ( = ?auto_866029 ?auto_866032 ) ) ( not ( = ?auto_866030 ?auto_866032 ) ) ( not ( = ?auto_866028 ?auto_866032 ) ) ( TRUCK-AT ?auto_866035 ?auto_866033 ) ( SURFACE-AT ?auto_866028 ?auto_866033 ) ( CLEAR ?auto_866028 ) ( IS-CRATE ?auto_866029 ) ( AVAILABLE ?auto_866031 ) ( IN ?auto_866029 ?auto_866035 ) ( ON ?auto_866021 ?auto_866020 ) ( ON ?auto_866022 ?auto_866021 ) ( ON ?auto_866023 ?auto_866022 ) ( ON ?auto_866024 ?auto_866023 ) ( ON ?auto_866025 ?auto_866024 ) ( ON ?auto_866026 ?auto_866025 ) ( ON ?auto_866027 ?auto_866026 ) ( ON ?auto_866028 ?auto_866027 ) ( not ( = ?auto_866020 ?auto_866021 ) ) ( not ( = ?auto_866020 ?auto_866022 ) ) ( not ( = ?auto_866020 ?auto_866023 ) ) ( not ( = ?auto_866020 ?auto_866024 ) ) ( not ( = ?auto_866020 ?auto_866025 ) ) ( not ( = ?auto_866020 ?auto_866026 ) ) ( not ( = ?auto_866020 ?auto_866027 ) ) ( not ( = ?auto_866020 ?auto_866028 ) ) ( not ( = ?auto_866020 ?auto_866029 ) ) ( not ( = ?auto_866020 ?auto_866030 ) ) ( not ( = ?auto_866020 ?auto_866032 ) ) ( not ( = ?auto_866021 ?auto_866022 ) ) ( not ( = ?auto_866021 ?auto_866023 ) ) ( not ( = ?auto_866021 ?auto_866024 ) ) ( not ( = ?auto_866021 ?auto_866025 ) ) ( not ( = ?auto_866021 ?auto_866026 ) ) ( not ( = ?auto_866021 ?auto_866027 ) ) ( not ( = ?auto_866021 ?auto_866028 ) ) ( not ( = ?auto_866021 ?auto_866029 ) ) ( not ( = ?auto_866021 ?auto_866030 ) ) ( not ( = ?auto_866021 ?auto_866032 ) ) ( not ( = ?auto_866022 ?auto_866023 ) ) ( not ( = ?auto_866022 ?auto_866024 ) ) ( not ( = ?auto_866022 ?auto_866025 ) ) ( not ( = ?auto_866022 ?auto_866026 ) ) ( not ( = ?auto_866022 ?auto_866027 ) ) ( not ( = ?auto_866022 ?auto_866028 ) ) ( not ( = ?auto_866022 ?auto_866029 ) ) ( not ( = ?auto_866022 ?auto_866030 ) ) ( not ( = ?auto_866022 ?auto_866032 ) ) ( not ( = ?auto_866023 ?auto_866024 ) ) ( not ( = ?auto_866023 ?auto_866025 ) ) ( not ( = ?auto_866023 ?auto_866026 ) ) ( not ( = ?auto_866023 ?auto_866027 ) ) ( not ( = ?auto_866023 ?auto_866028 ) ) ( not ( = ?auto_866023 ?auto_866029 ) ) ( not ( = ?auto_866023 ?auto_866030 ) ) ( not ( = ?auto_866023 ?auto_866032 ) ) ( not ( = ?auto_866024 ?auto_866025 ) ) ( not ( = ?auto_866024 ?auto_866026 ) ) ( not ( = ?auto_866024 ?auto_866027 ) ) ( not ( = ?auto_866024 ?auto_866028 ) ) ( not ( = ?auto_866024 ?auto_866029 ) ) ( not ( = ?auto_866024 ?auto_866030 ) ) ( not ( = ?auto_866024 ?auto_866032 ) ) ( not ( = ?auto_866025 ?auto_866026 ) ) ( not ( = ?auto_866025 ?auto_866027 ) ) ( not ( = ?auto_866025 ?auto_866028 ) ) ( not ( = ?auto_866025 ?auto_866029 ) ) ( not ( = ?auto_866025 ?auto_866030 ) ) ( not ( = ?auto_866025 ?auto_866032 ) ) ( not ( = ?auto_866026 ?auto_866027 ) ) ( not ( = ?auto_866026 ?auto_866028 ) ) ( not ( = ?auto_866026 ?auto_866029 ) ) ( not ( = ?auto_866026 ?auto_866030 ) ) ( not ( = ?auto_866026 ?auto_866032 ) ) ( not ( = ?auto_866027 ?auto_866028 ) ) ( not ( = ?auto_866027 ?auto_866029 ) ) ( not ( = ?auto_866027 ?auto_866030 ) ) ( not ( = ?auto_866027 ?auto_866032 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_866028 ?auto_866029 ?auto_866030 )
      ( MAKE-10CRATE-VERIFY ?auto_866020 ?auto_866021 ?auto_866022 ?auto_866023 ?auto_866024 ?auto_866025 ?auto_866026 ?auto_866027 ?auto_866028 ?auto_866029 ?auto_866030 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_873304 - SURFACE
      ?auto_873305 - SURFACE
      ?auto_873306 - SURFACE
      ?auto_873307 - SURFACE
      ?auto_873308 - SURFACE
      ?auto_873309 - SURFACE
      ?auto_873310 - SURFACE
      ?auto_873311 - SURFACE
      ?auto_873312 - SURFACE
      ?auto_873313 - SURFACE
      ?auto_873314 - SURFACE
      ?auto_873315 - SURFACE
    )
    :vars
    (
      ?auto_873316 - HOIST
      ?auto_873317 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_873316 ?auto_873317 ) ( SURFACE-AT ?auto_873314 ?auto_873317 ) ( CLEAR ?auto_873314 ) ( LIFTING ?auto_873316 ?auto_873315 ) ( IS-CRATE ?auto_873315 ) ( not ( = ?auto_873314 ?auto_873315 ) ) ( ON ?auto_873305 ?auto_873304 ) ( ON ?auto_873306 ?auto_873305 ) ( ON ?auto_873307 ?auto_873306 ) ( ON ?auto_873308 ?auto_873307 ) ( ON ?auto_873309 ?auto_873308 ) ( ON ?auto_873310 ?auto_873309 ) ( ON ?auto_873311 ?auto_873310 ) ( ON ?auto_873312 ?auto_873311 ) ( ON ?auto_873313 ?auto_873312 ) ( ON ?auto_873314 ?auto_873313 ) ( not ( = ?auto_873304 ?auto_873305 ) ) ( not ( = ?auto_873304 ?auto_873306 ) ) ( not ( = ?auto_873304 ?auto_873307 ) ) ( not ( = ?auto_873304 ?auto_873308 ) ) ( not ( = ?auto_873304 ?auto_873309 ) ) ( not ( = ?auto_873304 ?auto_873310 ) ) ( not ( = ?auto_873304 ?auto_873311 ) ) ( not ( = ?auto_873304 ?auto_873312 ) ) ( not ( = ?auto_873304 ?auto_873313 ) ) ( not ( = ?auto_873304 ?auto_873314 ) ) ( not ( = ?auto_873304 ?auto_873315 ) ) ( not ( = ?auto_873305 ?auto_873306 ) ) ( not ( = ?auto_873305 ?auto_873307 ) ) ( not ( = ?auto_873305 ?auto_873308 ) ) ( not ( = ?auto_873305 ?auto_873309 ) ) ( not ( = ?auto_873305 ?auto_873310 ) ) ( not ( = ?auto_873305 ?auto_873311 ) ) ( not ( = ?auto_873305 ?auto_873312 ) ) ( not ( = ?auto_873305 ?auto_873313 ) ) ( not ( = ?auto_873305 ?auto_873314 ) ) ( not ( = ?auto_873305 ?auto_873315 ) ) ( not ( = ?auto_873306 ?auto_873307 ) ) ( not ( = ?auto_873306 ?auto_873308 ) ) ( not ( = ?auto_873306 ?auto_873309 ) ) ( not ( = ?auto_873306 ?auto_873310 ) ) ( not ( = ?auto_873306 ?auto_873311 ) ) ( not ( = ?auto_873306 ?auto_873312 ) ) ( not ( = ?auto_873306 ?auto_873313 ) ) ( not ( = ?auto_873306 ?auto_873314 ) ) ( not ( = ?auto_873306 ?auto_873315 ) ) ( not ( = ?auto_873307 ?auto_873308 ) ) ( not ( = ?auto_873307 ?auto_873309 ) ) ( not ( = ?auto_873307 ?auto_873310 ) ) ( not ( = ?auto_873307 ?auto_873311 ) ) ( not ( = ?auto_873307 ?auto_873312 ) ) ( not ( = ?auto_873307 ?auto_873313 ) ) ( not ( = ?auto_873307 ?auto_873314 ) ) ( not ( = ?auto_873307 ?auto_873315 ) ) ( not ( = ?auto_873308 ?auto_873309 ) ) ( not ( = ?auto_873308 ?auto_873310 ) ) ( not ( = ?auto_873308 ?auto_873311 ) ) ( not ( = ?auto_873308 ?auto_873312 ) ) ( not ( = ?auto_873308 ?auto_873313 ) ) ( not ( = ?auto_873308 ?auto_873314 ) ) ( not ( = ?auto_873308 ?auto_873315 ) ) ( not ( = ?auto_873309 ?auto_873310 ) ) ( not ( = ?auto_873309 ?auto_873311 ) ) ( not ( = ?auto_873309 ?auto_873312 ) ) ( not ( = ?auto_873309 ?auto_873313 ) ) ( not ( = ?auto_873309 ?auto_873314 ) ) ( not ( = ?auto_873309 ?auto_873315 ) ) ( not ( = ?auto_873310 ?auto_873311 ) ) ( not ( = ?auto_873310 ?auto_873312 ) ) ( not ( = ?auto_873310 ?auto_873313 ) ) ( not ( = ?auto_873310 ?auto_873314 ) ) ( not ( = ?auto_873310 ?auto_873315 ) ) ( not ( = ?auto_873311 ?auto_873312 ) ) ( not ( = ?auto_873311 ?auto_873313 ) ) ( not ( = ?auto_873311 ?auto_873314 ) ) ( not ( = ?auto_873311 ?auto_873315 ) ) ( not ( = ?auto_873312 ?auto_873313 ) ) ( not ( = ?auto_873312 ?auto_873314 ) ) ( not ( = ?auto_873312 ?auto_873315 ) ) ( not ( = ?auto_873313 ?auto_873314 ) ) ( not ( = ?auto_873313 ?auto_873315 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_873314 ?auto_873315 )
      ( MAKE-11CRATE-VERIFY ?auto_873304 ?auto_873305 ?auto_873306 ?auto_873307 ?auto_873308 ?auto_873309 ?auto_873310 ?auto_873311 ?auto_873312 ?auto_873313 ?auto_873314 ?auto_873315 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_873413 - SURFACE
      ?auto_873414 - SURFACE
      ?auto_873415 - SURFACE
      ?auto_873416 - SURFACE
      ?auto_873417 - SURFACE
      ?auto_873418 - SURFACE
      ?auto_873419 - SURFACE
      ?auto_873420 - SURFACE
      ?auto_873421 - SURFACE
      ?auto_873422 - SURFACE
      ?auto_873423 - SURFACE
      ?auto_873424 - SURFACE
    )
    :vars
    (
      ?auto_873427 - HOIST
      ?auto_873425 - PLACE
      ?auto_873426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_873427 ?auto_873425 ) ( SURFACE-AT ?auto_873423 ?auto_873425 ) ( CLEAR ?auto_873423 ) ( IS-CRATE ?auto_873424 ) ( not ( = ?auto_873423 ?auto_873424 ) ) ( TRUCK-AT ?auto_873426 ?auto_873425 ) ( AVAILABLE ?auto_873427 ) ( IN ?auto_873424 ?auto_873426 ) ( ON ?auto_873423 ?auto_873422 ) ( not ( = ?auto_873422 ?auto_873423 ) ) ( not ( = ?auto_873422 ?auto_873424 ) ) ( ON ?auto_873414 ?auto_873413 ) ( ON ?auto_873415 ?auto_873414 ) ( ON ?auto_873416 ?auto_873415 ) ( ON ?auto_873417 ?auto_873416 ) ( ON ?auto_873418 ?auto_873417 ) ( ON ?auto_873419 ?auto_873418 ) ( ON ?auto_873420 ?auto_873419 ) ( ON ?auto_873421 ?auto_873420 ) ( ON ?auto_873422 ?auto_873421 ) ( not ( = ?auto_873413 ?auto_873414 ) ) ( not ( = ?auto_873413 ?auto_873415 ) ) ( not ( = ?auto_873413 ?auto_873416 ) ) ( not ( = ?auto_873413 ?auto_873417 ) ) ( not ( = ?auto_873413 ?auto_873418 ) ) ( not ( = ?auto_873413 ?auto_873419 ) ) ( not ( = ?auto_873413 ?auto_873420 ) ) ( not ( = ?auto_873413 ?auto_873421 ) ) ( not ( = ?auto_873413 ?auto_873422 ) ) ( not ( = ?auto_873413 ?auto_873423 ) ) ( not ( = ?auto_873413 ?auto_873424 ) ) ( not ( = ?auto_873414 ?auto_873415 ) ) ( not ( = ?auto_873414 ?auto_873416 ) ) ( not ( = ?auto_873414 ?auto_873417 ) ) ( not ( = ?auto_873414 ?auto_873418 ) ) ( not ( = ?auto_873414 ?auto_873419 ) ) ( not ( = ?auto_873414 ?auto_873420 ) ) ( not ( = ?auto_873414 ?auto_873421 ) ) ( not ( = ?auto_873414 ?auto_873422 ) ) ( not ( = ?auto_873414 ?auto_873423 ) ) ( not ( = ?auto_873414 ?auto_873424 ) ) ( not ( = ?auto_873415 ?auto_873416 ) ) ( not ( = ?auto_873415 ?auto_873417 ) ) ( not ( = ?auto_873415 ?auto_873418 ) ) ( not ( = ?auto_873415 ?auto_873419 ) ) ( not ( = ?auto_873415 ?auto_873420 ) ) ( not ( = ?auto_873415 ?auto_873421 ) ) ( not ( = ?auto_873415 ?auto_873422 ) ) ( not ( = ?auto_873415 ?auto_873423 ) ) ( not ( = ?auto_873415 ?auto_873424 ) ) ( not ( = ?auto_873416 ?auto_873417 ) ) ( not ( = ?auto_873416 ?auto_873418 ) ) ( not ( = ?auto_873416 ?auto_873419 ) ) ( not ( = ?auto_873416 ?auto_873420 ) ) ( not ( = ?auto_873416 ?auto_873421 ) ) ( not ( = ?auto_873416 ?auto_873422 ) ) ( not ( = ?auto_873416 ?auto_873423 ) ) ( not ( = ?auto_873416 ?auto_873424 ) ) ( not ( = ?auto_873417 ?auto_873418 ) ) ( not ( = ?auto_873417 ?auto_873419 ) ) ( not ( = ?auto_873417 ?auto_873420 ) ) ( not ( = ?auto_873417 ?auto_873421 ) ) ( not ( = ?auto_873417 ?auto_873422 ) ) ( not ( = ?auto_873417 ?auto_873423 ) ) ( not ( = ?auto_873417 ?auto_873424 ) ) ( not ( = ?auto_873418 ?auto_873419 ) ) ( not ( = ?auto_873418 ?auto_873420 ) ) ( not ( = ?auto_873418 ?auto_873421 ) ) ( not ( = ?auto_873418 ?auto_873422 ) ) ( not ( = ?auto_873418 ?auto_873423 ) ) ( not ( = ?auto_873418 ?auto_873424 ) ) ( not ( = ?auto_873419 ?auto_873420 ) ) ( not ( = ?auto_873419 ?auto_873421 ) ) ( not ( = ?auto_873419 ?auto_873422 ) ) ( not ( = ?auto_873419 ?auto_873423 ) ) ( not ( = ?auto_873419 ?auto_873424 ) ) ( not ( = ?auto_873420 ?auto_873421 ) ) ( not ( = ?auto_873420 ?auto_873422 ) ) ( not ( = ?auto_873420 ?auto_873423 ) ) ( not ( = ?auto_873420 ?auto_873424 ) ) ( not ( = ?auto_873421 ?auto_873422 ) ) ( not ( = ?auto_873421 ?auto_873423 ) ) ( not ( = ?auto_873421 ?auto_873424 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_873422 ?auto_873423 ?auto_873424 )
      ( MAKE-11CRATE-VERIFY ?auto_873413 ?auto_873414 ?auto_873415 ?auto_873416 ?auto_873417 ?auto_873418 ?auto_873419 ?auto_873420 ?auto_873421 ?auto_873422 ?auto_873423 ?auto_873424 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_873534 - SURFACE
      ?auto_873535 - SURFACE
      ?auto_873536 - SURFACE
      ?auto_873537 - SURFACE
      ?auto_873538 - SURFACE
      ?auto_873539 - SURFACE
      ?auto_873540 - SURFACE
      ?auto_873541 - SURFACE
      ?auto_873542 - SURFACE
      ?auto_873543 - SURFACE
      ?auto_873544 - SURFACE
      ?auto_873545 - SURFACE
    )
    :vars
    (
      ?auto_873546 - HOIST
      ?auto_873547 - PLACE
      ?auto_873548 - TRUCK
      ?auto_873549 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_873546 ?auto_873547 ) ( SURFACE-AT ?auto_873544 ?auto_873547 ) ( CLEAR ?auto_873544 ) ( IS-CRATE ?auto_873545 ) ( not ( = ?auto_873544 ?auto_873545 ) ) ( AVAILABLE ?auto_873546 ) ( IN ?auto_873545 ?auto_873548 ) ( ON ?auto_873544 ?auto_873543 ) ( not ( = ?auto_873543 ?auto_873544 ) ) ( not ( = ?auto_873543 ?auto_873545 ) ) ( TRUCK-AT ?auto_873548 ?auto_873549 ) ( not ( = ?auto_873549 ?auto_873547 ) ) ( ON ?auto_873535 ?auto_873534 ) ( ON ?auto_873536 ?auto_873535 ) ( ON ?auto_873537 ?auto_873536 ) ( ON ?auto_873538 ?auto_873537 ) ( ON ?auto_873539 ?auto_873538 ) ( ON ?auto_873540 ?auto_873539 ) ( ON ?auto_873541 ?auto_873540 ) ( ON ?auto_873542 ?auto_873541 ) ( ON ?auto_873543 ?auto_873542 ) ( not ( = ?auto_873534 ?auto_873535 ) ) ( not ( = ?auto_873534 ?auto_873536 ) ) ( not ( = ?auto_873534 ?auto_873537 ) ) ( not ( = ?auto_873534 ?auto_873538 ) ) ( not ( = ?auto_873534 ?auto_873539 ) ) ( not ( = ?auto_873534 ?auto_873540 ) ) ( not ( = ?auto_873534 ?auto_873541 ) ) ( not ( = ?auto_873534 ?auto_873542 ) ) ( not ( = ?auto_873534 ?auto_873543 ) ) ( not ( = ?auto_873534 ?auto_873544 ) ) ( not ( = ?auto_873534 ?auto_873545 ) ) ( not ( = ?auto_873535 ?auto_873536 ) ) ( not ( = ?auto_873535 ?auto_873537 ) ) ( not ( = ?auto_873535 ?auto_873538 ) ) ( not ( = ?auto_873535 ?auto_873539 ) ) ( not ( = ?auto_873535 ?auto_873540 ) ) ( not ( = ?auto_873535 ?auto_873541 ) ) ( not ( = ?auto_873535 ?auto_873542 ) ) ( not ( = ?auto_873535 ?auto_873543 ) ) ( not ( = ?auto_873535 ?auto_873544 ) ) ( not ( = ?auto_873535 ?auto_873545 ) ) ( not ( = ?auto_873536 ?auto_873537 ) ) ( not ( = ?auto_873536 ?auto_873538 ) ) ( not ( = ?auto_873536 ?auto_873539 ) ) ( not ( = ?auto_873536 ?auto_873540 ) ) ( not ( = ?auto_873536 ?auto_873541 ) ) ( not ( = ?auto_873536 ?auto_873542 ) ) ( not ( = ?auto_873536 ?auto_873543 ) ) ( not ( = ?auto_873536 ?auto_873544 ) ) ( not ( = ?auto_873536 ?auto_873545 ) ) ( not ( = ?auto_873537 ?auto_873538 ) ) ( not ( = ?auto_873537 ?auto_873539 ) ) ( not ( = ?auto_873537 ?auto_873540 ) ) ( not ( = ?auto_873537 ?auto_873541 ) ) ( not ( = ?auto_873537 ?auto_873542 ) ) ( not ( = ?auto_873537 ?auto_873543 ) ) ( not ( = ?auto_873537 ?auto_873544 ) ) ( not ( = ?auto_873537 ?auto_873545 ) ) ( not ( = ?auto_873538 ?auto_873539 ) ) ( not ( = ?auto_873538 ?auto_873540 ) ) ( not ( = ?auto_873538 ?auto_873541 ) ) ( not ( = ?auto_873538 ?auto_873542 ) ) ( not ( = ?auto_873538 ?auto_873543 ) ) ( not ( = ?auto_873538 ?auto_873544 ) ) ( not ( = ?auto_873538 ?auto_873545 ) ) ( not ( = ?auto_873539 ?auto_873540 ) ) ( not ( = ?auto_873539 ?auto_873541 ) ) ( not ( = ?auto_873539 ?auto_873542 ) ) ( not ( = ?auto_873539 ?auto_873543 ) ) ( not ( = ?auto_873539 ?auto_873544 ) ) ( not ( = ?auto_873539 ?auto_873545 ) ) ( not ( = ?auto_873540 ?auto_873541 ) ) ( not ( = ?auto_873540 ?auto_873542 ) ) ( not ( = ?auto_873540 ?auto_873543 ) ) ( not ( = ?auto_873540 ?auto_873544 ) ) ( not ( = ?auto_873540 ?auto_873545 ) ) ( not ( = ?auto_873541 ?auto_873542 ) ) ( not ( = ?auto_873541 ?auto_873543 ) ) ( not ( = ?auto_873541 ?auto_873544 ) ) ( not ( = ?auto_873541 ?auto_873545 ) ) ( not ( = ?auto_873542 ?auto_873543 ) ) ( not ( = ?auto_873542 ?auto_873544 ) ) ( not ( = ?auto_873542 ?auto_873545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_873543 ?auto_873544 ?auto_873545 )
      ( MAKE-11CRATE-VERIFY ?auto_873534 ?auto_873535 ?auto_873536 ?auto_873537 ?auto_873538 ?auto_873539 ?auto_873540 ?auto_873541 ?auto_873542 ?auto_873543 ?auto_873544 ?auto_873545 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_873666 - SURFACE
      ?auto_873667 - SURFACE
      ?auto_873668 - SURFACE
      ?auto_873669 - SURFACE
      ?auto_873670 - SURFACE
      ?auto_873671 - SURFACE
      ?auto_873672 - SURFACE
      ?auto_873673 - SURFACE
      ?auto_873674 - SURFACE
      ?auto_873675 - SURFACE
      ?auto_873676 - SURFACE
      ?auto_873677 - SURFACE
    )
    :vars
    (
      ?auto_873682 - HOIST
      ?auto_873679 - PLACE
      ?auto_873680 - TRUCK
      ?auto_873678 - PLACE
      ?auto_873681 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_873682 ?auto_873679 ) ( SURFACE-AT ?auto_873676 ?auto_873679 ) ( CLEAR ?auto_873676 ) ( IS-CRATE ?auto_873677 ) ( not ( = ?auto_873676 ?auto_873677 ) ) ( AVAILABLE ?auto_873682 ) ( ON ?auto_873676 ?auto_873675 ) ( not ( = ?auto_873675 ?auto_873676 ) ) ( not ( = ?auto_873675 ?auto_873677 ) ) ( TRUCK-AT ?auto_873680 ?auto_873678 ) ( not ( = ?auto_873678 ?auto_873679 ) ) ( HOIST-AT ?auto_873681 ?auto_873678 ) ( LIFTING ?auto_873681 ?auto_873677 ) ( not ( = ?auto_873682 ?auto_873681 ) ) ( ON ?auto_873667 ?auto_873666 ) ( ON ?auto_873668 ?auto_873667 ) ( ON ?auto_873669 ?auto_873668 ) ( ON ?auto_873670 ?auto_873669 ) ( ON ?auto_873671 ?auto_873670 ) ( ON ?auto_873672 ?auto_873671 ) ( ON ?auto_873673 ?auto_873672 ) ( ON ?auto_873674 ?auto_873673 ) ( ON ?auto_873675 ?auto_873674 ) ( not ( = ?auto_873666 ?auto_873667 ) ) ( not ( = ?auto_873666 ?auto_873668 ) ) ( not ( = ?auto_873666 ?auto_873669 ) ) ( not ( = ?auto_873666 ?auto_873670 ) ) ( not ( = ?auto_873666 ?auto_873671 ) ) ( not ( = ?auto_873666 ?auto_873672 ) ) ( not ( = ?auto_873666 ?auto_873673 ) ) ( not ( = ?auto_873666 ?auto_873674 ) ) ( not ( = ?auto_873666 ?auto_873675 ) ) ( not ( = ?auto_873666 ?auto_873676 ) ) ( not ( = ?auto_873666 ?auto_873677 ) ) ( not ( = ?auto_873667 ?auto_873668 ) ) ( not ( = ?auto_873667 ?auto_873669 ) ) ( not ( = ?auto_873667 ?auto_873670 ) ) ( not ( = ?auto_873667 ?auto_873671 ) ) ( not ( = ?auto_873667 ?auto_873672 ) ) ( not ( = ?auto_873667 ?auto_873673 ) ) ( not ( = ?auto_873667 ?auto_873674 ) ) ( not ( = ?auto_873667 ?auto_873675 ) ) ( not ( = ?auto_873667 ?auto_873676 ) ) ( not ( = ?auto_873667 ?auto_873677 ) ) ( not ( = ?auto_873668 ?auto_873669 ) ) ( not ( = ?auto_873668 ?auto_873670 ) ) ( not ( = ?auto_873668 ?auto_873671 ) ) ( not ( = ?auto_873668 ?auto_873672 ) ) ( not ( = ?auto_873668 ?auto_873673 ) ) ( not ( = ?auto_873668 ?auto_873674 ) ) ( not ( = ?auto_873668 ?auto_873675 ) ) ( not ( = ?auto_873668 ?auto_873676 ) ) ( not ( = ?auto_873668 ?auto_873677 ) ) ( not ( = ?auto_873669 ?auto_873670 ) ) ( not ( = ?auto_873669 ?auto_873671 ) ) ( not ( = ?auto_873669 ?auto_873672 ) ) ( not ( = ?auto_873669 ?auto_873673 ) ) ( not ( = ?auto_873669 ?auto_873674 ) ) ( not ( = ?auto_873669 ?auto_873675 ) ) ( not ( = ?auto_873669 ?auto_873676 ) ) ( not ( = ?auto_873669 ?auto_873677 ) ) ( not ( = ?auto_873670 ?auto_873671 ) ) ( not ( = ?auto_873670 ?auto_873672 ) ) ( not ( = ?auto_873670 ?auto_873673 ) ) ( not ( = ?auto_873670 ?auto_873674 ) ) ( not ( = ?auto_873670 ?auto_873675 ) ) ( not ( = ?auto_873670 ?auto_873676 ) ) ( not ( = ?auto_873670 ?auto_873677 ) ) ( not ( = ?auto_873671 ?auto_873672 ) ) ( not ( = ?auto_873671 ?auto_873673 ) ) ( not ( = ?auto_873671 ?auto_873674 ) ) ( not ( = ?auto_873671 ?auto_873675 ) ) ( not ( = ?auto_873671 ?auto_873676 ) ) ( not ( = ?auto_873671 ?auto_873677 ) ) ( not ( = ?auto_873672 ?auto_873673 ) ) ( not ( = ?auto_873672 ?auto_873674 ) ) ( not ( = ?auto_873672 ?auto_873675 ) ) ( not ( = ?auto_873672 ?auto_873676 ) ) ( not ( = ?auto_873672 ?auto_873677 ) ) ( not ( = ?auto_873673 ?auto_873674 ) ) ( not ( = ?auto_873673 ?auto_873675 ) ) ( not ( = ?auto_873673 ?auto_873676 ) ) ( not ( = ?auto_873673 ?auto_873677 ) ) ( not ( = ?auto_873674 ?auto_873675 ) ) ( not ( = ?auto_873674 ?auto_873676 ) ) ( not ( = ?auto_873674 ?auto_873677 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_873675 ?auto_873676 ?auto_873677 )
      ( MAKE-11CRATE-VERIFY ?auto_873666 ?auto_873667 ?auto_873668 ?auto_873669 ?auto_873670 ?auto_873671 ?auto_873672 ?auto_873673 ?auto_873674 ?auto_873675 ?auto_873676 ?auto_873677 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_873809 - SURFACE
      ?auto_873810 - SURFACE
      ?auto_873811 - SURFACE
      ?auto_873812 - SURFACE
      ?auto_873813 - SURFACE
      ?auto_873814 - SURFACE
      ?auto_873815 - SURFACE
      ?auto_873816 - SURFACE
      ?auto_873817 - SURFACE
      ?auto_873818 - SURFACE
      ?auto_873819 - SURFACE
      ?auto_873820 - SURFACE
    )
    :vars
    (
      ?auto_873823 - HOIST
      ?auto_873821 - PLACE
      ?auto_873822 - TRUCK
      ?auto_873825 - PLACE
      ?auto_873824 - HOIST
      ?auto_873826 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_873823 ?auto_873821 ) ( SURFACE-AT ?auto_873819 ?auto_873821 ) ( CLEAR ?auto_873819 ) ( IS-CRATE ?auto_873820 ) ( not ( = ?auto_873819 ?auto_873820 ) ) ( AVAILABLE ?auto_873823 ) ( ON ?auto_873819 ?auto_873818 ) ( not ( = ?auto_873818 ?auto_873819 ) ) ( not ( = ?auto_873818 ?auto_873820 ) ) ( TRUCK-AT ?auto_873822 ?auto_873825 ) ( not ( = ?auto_873825 ?auto_873821 ) ) ( HOIST-AT ?auto_873824 ?auto_873825 ) ( not ( = ?auto_873823 ?auto_873824 ) ) ( AVAILABLE ?auto_873824 ) ( SURFACE-AT ?auto_873820 ?auto_873825 ) ( ON ?auto_873820 ?auto_873826 ) ( CLEAR ?auto_873820 ) ( not ( = ?auto_873819 ?auto_873826 ) ) ( not ( = ?auto_873820 ?auto_873826 ) ) ( not ( = ?auto_873818 ?auto_873826 ) ) ( ON ?auto_873810 ?auto_873809 ) ( ON ?auto_873811 ?auto_873810 ) ( ON ?auto_873812 ?auto_873811 ) ( ON ?auto_873813 ?auto_873812 ) ( ON ?auto_873814 ?auto_873813 ) ( ON ?auto_873815 ?auto_873814 ) ( ON ?auto_873816 ?auto_873815 ) ( ON ?auto_873817 ?auto_873816 ) ( ON ?auto_873818 ?auto_873817 ) ( not ( = ?auto_873809 ?auto_873810 ) ) ( not ( = ?auto_873809 ?auto_873811 ) ) ( not ( = ?auto_873809 ?auto_873812 ) ) ( not ( = ?auto_873809 ?auto_873813 ) ) ( not ( = ?auto_873809 ?auto_873814 ) ) ( not ( = ?auto_873809 ?auto_873815 ) ) ( not ( = ?auto_873809 ?auto_873816 ) ) ( not ( = ?auto_873809 ?auto_873817 ) ) ( not ( = ?auto_873809 ?auto_873818 ) ) ( not ( = ?auto_873809 ?auto_873819 ) ) ( not ( = ?auto_873809 ?auto_873820 ) ) ( not ( = ?auto_873809 ?auto_873826 ) ) ( not ( = ?auto_873810 ?auto_873811 ) ) ( not ( = ?auto_873810 ?auto_873812 ) ) ( not ( = ?auto_873810 ?auto_873813 ) ) ( not ( = ?auto_873810 ?auto_873814 ) ) ( not ( = ?auto_873810 ?auto_873815 ) ) ( not ( = ?auto_873810 ?auto_873816 ) ) ( not ( = ?auto_873810 ?auto_873817 ) ) ( not ( = ?auto_873810 ?auto_873818 ) ) ( not ( = ?auto_873810 ?auto_873819 ) ) ( not ( = ?auto_873810 ?auto_873820 ) ) ( not ( = ?auto_873810 ?auto_873826 ) ) ( not ( = ?auto_873811 ?auto_873812 ) ) ( not ( = ?auto_873811 ?auto_873813 ) ) ( not ( = ?auto_873811 ?auto_873814 ) ) ( not ( = ?auto_873811 ?auto_873815 ) ) ( not ( = ?auto_873811 ?auto_873816 ) ) ( not ( = ?auto_873811 ?auto_873817 ) ) ( not ( = ?auto_873811 ?auto_873818 ) ) ( not ( = ?auto_873811 ?auto_873819 ) ) ( not ( = ?auto_873811 ?auto_873820 ) ) ( not ( = ?auto_873811 ?auto_873826 ) ) ( not ( = ?auto_873812 ?auto_873813 ) ) ( not ( = ?auto_873812 ?auto_873814 ) ) ( not ( = ?auto_873812 ?auto_873815 ) ) ( not ( = ?auto_873812 ?auto_873816 ) ) ( not ( = ?auto_873812 ?auto_873817 ) ) ( not ( = ?auto_873812 ?auto_873818 ) ) ( not ( = ?auto_873812 ?auto_873819 ) ) ( not ( = ?auto_873812 ?auto_873820 ) ) ( not ( = ?auto_873812 ?auto_873826 ) ) ( not ( = ?auto_873813 ?auto_873814 ) ) ( not ( = ?auto_873813 ?auto_873815 ) ) ( not ( = ?auto_873813 ?auto_873816 ) ) ( not ( = ?auto_873813 ?auto_873817 ) ) ( not ( = ?auto_873813 ?auto_873818 ) ) ( not ( = ?auto_873813 ?auto_873819 ) ) ( not ( = ?auto_873813 ?auto_873820 ) ) ( not ( = ?auto_873813 ?auto_873826 ) ) ( not ( = ?auto_873814 ?auto_873815 ) ) ( not ( = ?auto_873814 ?auto_873816 ) ) ( not ( = ?auto_873814 ?auto_873817 ) ) ( not ( = ?auto_873814 ?auto_873818 ) ) ( not ( = ?auto_873814 ?auto_873819 ) ) ( not ( = ?auto_873814 ?auto_873820 ) ) ( not ( = ?auto_873814 ?auto_873826 ) ) ( not ( = ?auto_873815 ?auto_873816 ) ) ( not ( = ?auto_873815 ?auto_873817 ) ) ( not ( = ?auto_873815 ?auto_873818 ) ) ( not ( = ?auto_873815 ?auto_873819 ) ) ( not ( = ?auto_873815 ?auto_873820 ) ) ( not ( = ?auto_873815 ?auto_873826 ) ) ( not ( = ?auto_873816 ?auto_873817 ) ) ( not ( = ?auto_873816 ?auto_873818 ) ) ( not ( = ?auto_873816 ?auto_873819 ) ) ( not ( = ?auto_873816 ?auto_873820 ) ) ( not ( = ?auto_873816 ?auto_873826 ) ) ( not ( = ?auto_873817 ?auto_873818 ) ) ( not ( = ?auto_873817 ?auto_873819 ) ) ( not ( = ?auto_873817 ?auto_873820 ) ) ( not ( = ?auto_873817 ?auto_873826 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_873818 ?auto_873819 ?auto_873820 )
      ( MAKE-11CRATE-VERIFY ?auto_873809 ?auto_873810 ?auto_873811 ?auto_873812 ?auto_873813 ?auto_873814 ?auto_873815 ?auto_873816 ?auto_873817 ?auto_873818 ?auto_873819 ?auto_873820 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_873953 - SURFACE
      ?auto_873954 - SURFACE
      ?auto_873955 - SURFACE
      ?auto_873956 - SURFACE
      ?auto_873957 - SURFACE
      ?auto_873958 - SURFACE
      ?auto_873959 - SURFACE
      ?auto_873960 - SURFACE
      ?auto_873961 - SURFACE
      ?auto_873962 - SURFACE
      ?auto_873963 - SURFACE
      ?auto_873964 - SURFACE
    )
    :vars
    (
      ?auto_873965 - HOIST
      ?auto_873970 - PLACE
      ?auto_873968 - PLACE
      ?auto_873969 - HOIST
      ?auto_873966 - SURFACE
      ?auto_873967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_873965 ?auto_873970 ) ( SURFACE-AT ?auto_873963 ?auto_873970 ) ( CLEAR ?auto_873963 ) ( IS-CRATE ?auto_873964 ) ( not ( = ?auto_873963 ?auto_873964 ) ) ( AVAILABLE ?auto_873965 ) ( ON ?auto_873963 ?auto_873962 ) ( not ( = ?auto_873962 ?auto_873963 ) ) ( not ( = ?auto_873962 ?auto_873964 ) ) ( not ( = ?auto_873968 ?auto_873970 ) ) ( HOIST-AT ?auto_873969 ?auto_873968 ) ( not ( = ?auto_873965 ?auto_873969 ) ) ( AVAILABLE ?auto_873969 ) ( SURFACE-AT ?auto_873964 ?auto_873968 ) ( ON ?auto_873964 ?auto_873966 ) ( CLEAR ?auto_873964 ) ( not ( = ?auto_873963 ?auto_873966 ) ) ( not ( = ?auto_873964 ?auto_873966 ) ) ( not ( = ?auto_873962 ?auto_873966 ) ) ( TRUCK-AT ?auto_873967 ?auto_873970 ) ( ON ?auto_873954 ?auto_873953 ) ( ON ?auto_873955 ?auto_873954 ) ( ON ?auto_873956 ?auto_873955 ) ( ON ?auto_873957 ?auto_873956 ) ( ON ?auto_873958 ?auto_873957 ) ( ON ?auto_873959 ?auto_873958 ) ( ON ?auto_873960 ?auto_873959 ) ( ON ?auto_873961 ?auto_873960 ) ( ON ?auto_873962 ?auto_873961 ) ( not ( = ?auto_873953 ?auto_873954 ) ) ( not ( = ?auto_873953 ?auto_873955 ) ) ( not ( = ?auto_873953 ?auto_873956 ) ) ( not ( = ?auto_873953 ?auto_873957 ) ) ( not ( = ?auto_873953 ?auto_873958 ) ) ( not ( = ?auto_873953 ?auto_873959 ) ) ( not ( = ?auto_873953 ?auto_873960 ) ) ( not ( = ?auto_873953 ?auto_873961 ) ) ( not ( = ?auto_873953 ?auto_873962 ) ) ( not ( = ?auto_873953 ?auto_873963 ) ) ( not ( = ?auto_873953 ?auto_873964 ) ) ( not ( = ?auto_873953 ?auto_873966 ) ) ( not ( = ?auto_873954 ?auto_873955 ) ) ( not ( = ?auto_873954 ?auto_873956 ) ) ( not ( = ?auto_873954 ?auto_873957 ) ) ( not ( = ?auto_873954 ?auto_873958 ) ) ( not ( = ?auto_873954 ?auto_873959 ) ) ( not ( = ?auto_873954 ?auto_873960 ) ) ( not ( = ?auto_873954 ?auto_873961 ) ) ( not ( = ?auto_873954 ?auto_873962 ) ) ( not ( = ?auto_873954 ?auto_873963 ) ) ( not ( = ?auto_873954 ?auto_873964 ) ) ( not ( = ?auto_873954 ?auto_873966 ) ) ( not ( = ?auto_873955 ?auto_873956 ) ) ( not ( = ?auto_873955 ?auto_873957 ) ) ( not ( = ?auto_873955 ?auto_873958 ) ) ( not ( = ?auto_873955 ?auto_873959 ) ) ( not ( = ?auto_873955 ?auto_873960 ) ) ( not ( = ?auto_873955 ?auto_873961 ) ) ( not ( = ?auto_873955 ?auto_873962 ) ) ( not ( = ?auto_873955 ?auto_873963 ) ) ( not ( = ?auto_873955 ?auto_873964 ) ) ( not ( = ?auto_873955 ?auto_873966 ) ) ( not ( = ?auto_873956 ?auto_873957 ) ) ( not ( = ?auto_873956 ?auto_873958 ) ) ( not ( = ?auto_873956 ?auto_873959 ) ) ( not ( = ?auto_873956 ?auto_873960 ) ) ( not ( = ?auto_873956 ?auto_873961 ) ) ( not ( = ?auto_873956 ?auto_873962 ) ) ( not ( = ?auto_873956 ?auto_873963 ) ) ( not ( = ?auto_873956 ?auto_873964 ) ) ( not ( = ?auto_873956 ?auto_873966 ) ) ( not ( = ?auto_873957 ?auto_873958 ) ) ( not ( = ?auto_873957 ?auto_873959 ) ) ( not ( = ?auto_873957 ?auto_873960 ) ) ( not ( = ?auto_873957 ?auto_873961 ) ) ( not ( = ?auto_873957 ?auto_873962 ) ) ( not ( = ?auto_873957 ?auto_873963 ) ) ( not ( = ?auto_873957 ?auto_873964 ) ) ( not ( = ?auto_873957 ?auto_873966 ) ) ( not ( = ?auto_873958 ?auto_873959 ) ) ( not ( = ?auto_873958 ?auto_873960 ) ) ( not ( = ?auto_873958 ?auto_873961 ) ) ( not ( = ?auto_873958 ?auto_873962 ) ) ( not ( = ?auto_873958 ?auto_873963 ) ) ( not ( = ?auto_873958 ?auto_873964 ) ) ( not ( = ?auto_873958 ?auto_873966 ) ) ( not ( = ?auto_873959 ?auto_873960 ) ) ( not ( = ?auto_873959 ?auto_873961 ) ) ( not ( = ?auto_873959 ?auto_873962 ) ) ( not ( = ?auto_873959 ?auto_873963 ) ) ( not ( = ?auto_873959 ?auto_873964 ) ) ( not ( = ?auto_873959 ?auto_873966 ) ) ( not ( = ?auto_873960 ?auto_873961 ) ) ( not ( = ?auto_873960 ?auto_873962 ) ) ( not ( = ?auto_873960 ?auto_873963 ) ) ( not ( = ?auto_873960 ?auto_873964 ) ) ( not ( = ?auto_873960 ?auto_873966 ) ) ( not ( = ?auto_873961 ?auto_873962 ) ) ( not ( = ?auto_873961 ?auto_873963 ) ) ( not ( = ?auto_873961 ?auto_873964 ) ) ( not ( = ?auto_873961 ?auto_873966 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_873962 ?auto_873963 ?auto_873964 )
      ( MAKE-11CRATE-VERIFY ?auto_873953 ?auto_873954 ?auto_873955 ?auto_873956 ?auto_873957 ?auto_873958 ?auto_873959 ?auto_873960 ?auto_873961 ?auto_873962 ?auto_873963 ?auto_873964 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_874097 - SURFACE
      ?auto_874098 - SURFACE
      ?auto_874099 - SURFACE
      ?auto_874100 - SURFACE
      ?auto_874101 - SURFACE
      ?auto_874102 - SURFACE
      ?auto_874103 - SURFACE
      ?auto_874104 - SURFACE
      ?auto_874105 - SURFACE
      ?auto_874106 - SURFACE
      ?auto_874107 - SURFACE
      ?auto_874108 - SURFACE
    )
    :vars
    (
      ?auto_874114 - HOIST
      ?auto_874110 - PLACE
      ?auto_874113 - PLACE
      ?auto_874109 - HOIST
      ?auto_874111 - SURFACE
      ?auto_874112 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_874114 ?auto_874110 ) ( IS-CRATE ?auto_874108 ) ( not ( = ?auto_874107 ?auto_874108 ) ) ( not ( = ?auto_874106 ?auto_874107 ) ) ( not ( = ?auto_874106 ?auto_874108 ) ) ( not ( = ?auto_874113 ?auto_874110 ) ) ( HOIST-AT ?auto_874109 ?auto_874113 ) ( not ( = ?auto_874114 ?auto_874109 ) ) ( AVAILABLE ?auto_874109 ) ( SURFACE-AT ?auto_874108 ?auto_874113 ) ( ON ?auto_874108 ?auto_874111 ) ( CLEAR ?auto_874108 ) ( not ( = ?auto_874107 ?auto_874111 ) ) ( not ( = ?auto_874108 ?auto_874111 ) ) ( not ( = ?auto_874106 ?auto_874111 ) ) ( TRUCK-AT ?auto_874112 ?auto_874110 ) ( SURFACE-AT ?auto_874106 ?auto_874110 ) ( CLEAR ?auto_874106 ) ( LIFTING ?auto_874114 ?auto_874107 ) ( IS-CRATE ?auto_874107 ) ( ON ?auto_874098 ?auto_874097 ) ( ON ?auto_874099 ?auto_874098 ) ( ON ?auto_874100 ?auto_874099 ) ( ON ?auto_874101 ?auto_874100 ) ( ON ?auto_874102 ?auto_874101 ) ( ON ?auto_874103 ?auto_874102 ) ( ON ?auto_874104 ?auto_874103 ) ( ON ?auto_874105 ?auto_874104 ) ( ON ?auto_874106 ?auto_874105 ) ( not ( = ?auto_874097 ?auto_874098 ) ) ( not ( = ?auto_874097 ?auto_874099 ) ) ( not ( = ?auto_874097 ?auto_874100 ) ) ( not ( = ?auto_874097 ?auto_874101 ) ) ( not ( = ?auto_874097 ?auto_874102 ) ) ( not ( = ?auto_874097 ?auto_874103 ) ) ( not ( = ?auto_874097 ?auto_874104 ) ) ( not ( = ?auto_874097 ?auto_874105 ) ) ( not ( = ?auto_874097 ?auto_874106 ) ) ( not ( = ?auto_874097 ?auto_874107 ) ) ( not ( = ?auto_874097 ?auto_874108 ) ) ( not ( = ?auto_874097 ?auto_874111 ) ) ( not ( = ?auto_874098 ?auto_874099 ) ) ( not ( = ?auto_874098 ?auto_874100 ) ) ( not ( = ?auto_874098 ?auto_874101 ) ) ( not ( = ?auto_874098 ?auto_874102 ) ) ( not ( = ?auto_874098 ?auto_874103 ) ) ( not ( = ?auto_874098 ?auto_874104 ) ) ( not ( = ?auto_874098 ?auto_874105 ) ) ( not ( = ?auto_874098 ?auto_874106 ) ) ( not ( = ?auto_874098 ?auto_874107 ) ) ( not ( = ?auto_874098 ?auto_874108 ) ) ( not ( = ?auto_874098 ?auto_874111 ) ) ( not ( = ?auto_874099 ?auto_874100 ) ) ( not ( = ?auto_874099 ?auto_874101 ) ) ( not ( = ?auto_874099 ?auto_874102 ) ) ( not ( = ?auto_874099 ?auto_874103 ) ) ( not ( = ?auto_874099 ?auto_874104 ) ) ( not ( = ?auto_874099 ?auto_874105 ) ) ( not ( = ?auto_874099 ?auto_874106 ) ) ( not ( = ?auto_874099 ?auto_874107 ) ) ( not ( = ?auto_874099 ?auto_874108 ) ) ( not ( = ?auto_874099 ?auto_874111 ) ) ( not ( = ?auto_874100 ?auto_874101 ) ) ( not ( = ?auto_874100 ?auto_874102 ) ) ( not ( = ?auto_874100 ?auto_874103 ) ) ( not ( = ?auto_874100 ?auto_874104 ) ) ( not ( = ?auto_874100 ?auto_874105 ) ) ( not ( = ?auto_874100 ?auto_874106 ) ) ( not ( = ?auto_874100 ?auto_874107 ) ) ( not ( = ?auto_874100 ?auto_874108 ) ) ( not ( = ?auto_874100 ?auto_874111 ) ) ( not ( = ?auto_874101 ?auto_874102 ) ) ( not ( = ?auto_874101 ?auto_874103 ) ) ( not ( = ?auto_874101 ?auto_874104 ) ) ( not ( = ?auto_874101 ?auto_874105 ) ) ( not ( = ?auto_874101 ?auto_874106 ) ) ( not ( = ?auto_874101 ?auto_874107 ) ) ( not ( = ?auto_874101 ?auto_874108 ) ) ( not ( = ?auto_874101 ?auto_874111 ) ) ( not ( = ?auto_874102 ?auto_874103 ) ) ( not ( = ?auto_874102 ?auto_874104 ) ) ( not ( = ?auto_874102 ?auto_874105 ) ) ( not ( = ?auto_874102 ?auto_874106 ) ) ( not ( = ?auto_874102 ?auto_874107 ) ) ( not ( = ?auto_874102 ?auto_874108 ) ) ( not ( = ?auto_874102 ?auto_874111 ) ) ( not ( = ?auto_874103 ?auto_874104 ) ) ( not ( = ?auto_874103 ?auto_874105 ) ) ( not ( = ?auto_874103 ?auto_874106 ) ) ( not ( = ?auto_874103 ?auto_874107 ) ) ( not ( = ?auto_874103 ?auto_874108 ) ) ( not ( = ?auto_874103 ?auto_874111 ) ) ( not ( = ?auto_874104 ?auto_874105 ) ) ( not ( = ?auto_874104 ?auto_874106 ) ) ( not ( = ?auto_874104 ?auto_874107 ) ) ( not ( = ?auto_874104 ?auto_874108 ) ) ( not ( = ?auto_874104 ?auto_874111 ) ) ( not ( = ?auto_874105 ?auto_874106 ) ) ( not ( = ?auto_874105 ?auto_874107 ) ) ( not ( = ?auto_874105 ?auto_874108 ) ) ( not ( = ?auto_874105 ?auto_874111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_874106 ?auto_874107 ?auto_874108 )
      ( MAKE-11CRATE-VERIFY ?auto_874097 ?auto_874098 ?auto_874099 ?auto_874100 ?auto_874101 ?auto_874102 ?auto_874103 ?auto_874104 ?auto_874105 ?auto_874106 ?auto_874107 ?auto_874108 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_874241 - SURFACE
      ?auto_874242 - SURFACE
      ?auto_874243 - SURFACE
      ?auto_874244 - SURFACE
      ?auto_874245 - SURFACE
      ?auto_874246 - SURFACE
      ?auto_874247 - SURFACE
      ?auto_874248 - SURFACE
      ?auto_874249 - SURFACE
      ?auto_874250 - SURFACE
      ?auto_874251 - SURFACE
      ?auto_874252 - SURFACE
    )
    :vars
    (
      ?auto_874258 - HOIST
      ?auto_874255 - PLACE
      ?auto_874253 - PLACE
      ?auto_874257 - HOIST
      ?auto_874254 - SURFACE
      ?auto_874256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_874258 ?auto_874255 ) ( IS-CRATE ?auto_874252 ) ( not ( = ?auto_874251 ?auto_874252 ) ) ( not ( = ?auto_874250 ?auto_874251 ) ) ( not ( = ?auto_874250 ?auto_874252 ) ) ( not ( = ?auto_874253 ?auto_874255 ) ) ( HOIST-AT ?auto_874257 ?auto_874253 ) ( not ( = ?auto_874258 ?auto_874257 ) ) ( AVAILABLE ?auto_874257 ) ( SURFACE-AT ?auto_874252 ?auto_874253 ) ( ON ?auto_874252 ?auto_874254 ) ( CLEAR ?auto_874252 ) ( not ( = ?auto_874251 ?auto_874254 ) ) ( not ( = ?auto_874252 ?auto_874254 ) ) ( not ( = ?auto_874250 ?auto_874254 ) ) ( TRUCK-AT ?auto_874256 ?auto_874255 ) ( SURFACE-AT ?auto_874250 ?auto_874255 ) ( CLEAR ?auto_874250 ) ( IS-CRATE ?auto_874251 ) ( AVAILABLE ?auto_874258 ) ( IN ?auto_874251 ?auto_874256 ) ( ON ?auto_874242 ?auto_874241 ) ( ON ?auto_874243 ?auto_874242 ) ( ON ?auto_874244 ?auto_874243 ) ( ON ?auto_874245 ?auto_874244 ) ( ON ?auto_874246 ?auto_874245 ) ( ON ?auto_874247 ?auto_874246 ) ( ON ?auto_874248 ?auto_874247 ) ( ON ?auto_874249 ?auto_874248 ) ( ON ?auto_874250 ?auto_874249 ) ( not ( = ?auto_874241 ?auto_874242 ) ) ( not ( = ?auto_874241 ?auto_874243 ) ) ( not ( = ?auto_874241 ?auto_874244 ) ) ( not ( = ?auto_874241 ?auto_874245 ) ) ( not ( = ?auto_874241 ?auto_874246 ) ) ( not ( = ?auto_874241 ?auto_874247 ) ) ( not ( = ?auto_874241 ?auto_874248 ) ) ( not ( = ?auto_874241 ?auto_874249 ) ) ( not ( = ?auto_874241 ?auto_874250 ) ) ( not ( = ?auto_874241 ?auto_874251 ) ) ( not ( = ?auto_874241 ?auto_874252 ) ) ( not ( = ?auto_874241 ?auto_874254 ) ) ( not ( = ?auto_874242 ?auto_874243 ) ) ( not ( = ?auto_874242 ?auto_874244 ) ) ( not ( = ?auto_874242 ?auto_874245 ) ) ( not ( = ?auto_874242 ?auto_874246 ) ) ( not ( = ?auto_874242 ?auto_874247 ) ) ( not ( = ?auto_874242 ?auto_874248 ) ) ( not ( = ?auto_874242 ?auto_874249 ) ) ( not ( = ?auto_874242 ?auto_874250 ) ) ( not ( = ?auto_874242 ?auto_874251 ) ) ( not ( = ?auto_874242 ?auto_874252 ) ) ( not ( = ?auto_874242 ?auto_874254 ) ) ( not ( = ?auto_874243 ?auto_874244 ) ) ( not ( = ?auto_874243 ?auto_874245 ) ) ( not ( = ?auto_874243 ?auto_874246 ) ) ( not ( = ?auto_874243 ?auto_874247 ) ) ( not ( = ?auto_874243 ?auto_874248 ) ) ( not ( = ?auto_874243 ?auto_874249 ) ) ( not ( = ?auto_874243 ?auto_874250 ) ) ( not ( = ?auto_874243 ?auto_874251 ) ) ( not ( = ?auto_874243 ?auto_874252 ) ) ( not ( = ?auto_874243 ?auto_874254 ) ) ( not ( = ?auto_874244 ?auto_874245 ) ) ( not ( = ?auto_874244 ?auto_874246 ) ) ( not ( = ?auto_874244 ?auto_874247 ) ) ( not ( = ?auto_874244 ?auto_874248 ) ) ( not ( = ?auto_874244 ?auto_874249 ) ) ( not ( = ?auto_874244 ?auto_874250 ) ) ( not ( = ?auto_874244 ?auto_874251 ) ) ( not ( = ?auto_874244 ?auto_874252 ) ) ( not ( = ?auto_874244 ?auto_874254 ) ) ( not ( = ?auto_874245 ?auto_874246 ) ) ( not ( = ?auto_874245 ?auto_874247 ) ) ( not ( = ?auto_874245 ?auto_874248 ) ) ( not ( = ?auto_874245 ?auto_874249 ) ) ( not ( = ?auto_874245 ?auto_874250 ) ) ( not ( = ?auto_874245 ?auto_874251 ) ) ( not ( = ?auto_874245 ?auto_874252 ) ) ( not ( = ?auto_874245 ?auto_874254 ) ) ( not ( = ?auto_874246 ?auto_874247 ) ) ( not ( = ?auto_874246 ?auto_874248 ) ) ( not ( = ?auto_874246 ?auto_874249 ) ) ( not ( = ?auto_874246 ?auto_874250 ) ) ( not ( = ?auto_874246 ?auto_874251 ) ) ( not ( = ?auto_874246 ?auto_874252 ) ) ( not ( = ?auto_874246 ?auto_874254 ) ) ( not ( = ?auto_874247 ?auto_874248 ) ) ( not ( = ?auto_874247 ?auto_874249 ) ) ( not ( = ?auto_874247 ?auto_874250 ) ) ( not ( = ?auto_874247 ?auto_874251 ) ) ( not ( = ?auto_874247 ?auto_874252 ) ) ( not ( = ?auto_874247 ?auto_874254 ) ) ( not ( = ?auto_874248 ?auto_874249 ) ) ( not ( = ?auto_874248 ?auto_874250 ) ) ( not ( = ?auto_874248 ?auto_874251 ) ) ( not ( = ?auto_874248 ?auto_874252 ) ) ( not ( = ?auto_874248 ?auto_874254 ) ) ( not ( = ?auto_874249 ?auto_874250 ) ) ( not ( = ?auto_874249 ?auto_874251 ) ) ( not ( = ?auto_874249 ?auto_874252 ) ) ( not ( = ?auto_874249 ?auto_874254 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_874250 ?auto_874251 ?auto_874252 )
      ( MAKE-11CRATE-VERIFY ?auto_874241 ?auto_874242 ?auto_874243 ?auto_874244 ?auto_874245 ?auto_874246 ?auto_874247 ?auto_874248 ?auto_874249 ?auto_874250 ?auto_874251 ?auto_874252 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_881920 - SURFACE
      ?auto_881921 - SURFACE
    )
    :vars
    (
      ?auto_881922 - HOIST
      ?auto_881926 - PLACE
      ?auto_881928 - SURFACE
      ?auto_881923 - TRUCK
      ?auto_881925 - PLACE
      ?auto_881924 - HOIST
      ?auto_881927 - SURFACE
      ?auto_881929 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_881922 ?auto_881926 ) ( SURFACE-AT ?auto_881920 ?auto_881926 ) ( CLEAR ?auto_881920 ) ( IS-CRATE ?auto_881921 ) ( not ( = ?auto_881920 ?auto_881921 ) ) ( AVAILABLE ?auto_881922 ) ( ON ?auto_881920 ?auto_881928 ) ( not ( = ?auto_881928 ?auto_881920 ) ) ( not ( = ?auto_881928 ?auto_881921 ) ) ( TRUCK-AT ?auto_881923 ?auto_881925 ) ( not ( = ?auto_881925 ?auto_881926 ) ) ( HOIST-AT ?auto_881924 ?auto_881925 ) ( not ( = ?auto_881922 ?auto_881924 ) ) ( SURFACE-AT ?auto_881921 ?auto_881925 ) ( ON ?auto_881921 ?auto_881927 ) ( CLEAR ?auto_881921 ) ( not ( = ?auto_881920 ?auto_881927 ) ) ( not ( = ?auto_881921 ?auto_881927 ) ) ( not ( = ?auto_881928 ?auto_881927 ) ) ( LIFTING ?auto_881924 ?auto_881929 ) ( IS-CRATE ?auto_881929 ) ( not ( = ?auto_881920 ?auto_881929 ) ) ( not ( = ?auto_881921 ?auto_881929 ) ) ( not ( = ?auto_881928 ?auto_881929 ) ) ( not ( = ?auto_881927 ?auto_881929 ) ) )
    :subtasks
    ( ( !LOAD ?auto_881924 ?auto_881929 ?auto_881923 ?auto_881925 )
      ( MAKE-1CRATE ?auto_881920 ?auto_881921 )
      ( MAKE-1CRATE-VERIFY ?auto_881920 ?auto_881921 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_883517 - SURFACE
      ?auto_883518 - SURFACE
      ?auto_883519 - SURFACE
      ?auto_883520 - SURFACE
      ?auto_883521 - SURFACE
      ?auto_883522 - SURFACE
      ?auto_883523 - SURFACE
      ?auto_883524 - SURFACE
      ?auto_883525 - SURFACE
      ?auto_883526 - SURFACE
      ?auto_883527 - SURFACE
      ?auto_883528 - SURFACE
      ?auto_883529 - SURFACE
    )
    :vars
    (
      ?auto_883530 - HOIST
      ?auto_883531 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_883530 ?auto_883531 ) ( SURFACE-AT ?auto_883528 ?auto_883531 ) ( CLEAR ?auto_883528 ) ( LIFTING ?auto_883530 ?auto_883529 ) ( IS-CRATE ?auto_883529 ) ( not ( = ?auto_883528 ?auto_883529 ) ) ( ON ?auto_883518 ?auto_883517 ) ( ON ?auto_883519 ?auto_883518 ) ( ON ?auto_883520 ?auto_883519 ) ( ON ?auto_883521 ?auto_883520 ) ( ON ?auto_883522 ?auto_883521 ) ( ON ?auto_883523 ?auto_883522 ) ( ON ?auto_883524 ?auto_883523 ) ( ON ?auto_883525 ?auto_883524 ) ( ON ?auto_883526 ?auto_883525 ) ( ON ?auto_883527 ?auto_883526 ) ( ON ?auto_883528 ?auto_883527 ) ( not ( = ?auto_883517 ?auto_883518 ) ) ( not ( = ?auto_883517 ?auto_883519 ) ) ( not ( = ?auto_883517 ?auto_883520 ) ) ( not ( = ?auto_883517 ?auto_883521 ) ) ( not ( = ?auto_883517 ?auto_883522 ) ) ( not ( = ?auto_883517 ?auto_883523 ) ) ( not ( = ?auto_883517 ?auto_883524 ) ) ( not ( = ?auto_883517 ?auto_883525 ) ) ( not ( = ?auto_883517 ?auto_883526 ) ) ( not ( = ?auto_883517 ?auto_883527 ) ) ( not ( = ?auto_883517 ?auto_883528 ) ) ( not ( = ?auto_883517 ?auto_883529 ) ) ( not ( = ?auto_883518 ?auto_883519 ) ) ( not ( = ?auto_883518 ?auto_883520 ) ) ( not ( = ?auto_883518 ?auto_883521 ) ) ( not ( = ?auto_883518 ?auto_883522 ) ) ( not ( = ?auto_883518 ?auto_883523 ) ) ( not ( = ?auto_883518 ?auto_883524 ) ) ( not ( = ?auto_883518 ?auto_883525 ) ) ( not ( = ?auto_883518 ?auto_883526 ) ) ( not ( = ?auto_883518 ?auto_883527 ) ) ( not ( = ?auto_883518 ?auto_883528 ) ) ( not ( = ?auto_883518 ?auto_883529 ) ) ( not ( = ?auto_883519 ?auto_883520 ) ) ( not ( = ?auto_883519 ?auto_883521 ) ) ( not ( = ?auto_883519 ?auto_883522 ) ) ( not ( = ?auto_883519 ?auto_883523 ) ) ( not ( = ?auto_883519 ?auto_883524 ) ) ( not ( = ?auto_883519 ?auto_883525 ) ) ( not ( = ?auto_883519 ?auto_883526 ) ) ( not ( = ?auto_883519 ?auto_883527 ) ) ( not ( = ?auto_883519 ?auto_883528 ) ) ( not ( = ?auto_883519 ?auto_883529 ) ) ( not ( = ?auto_883520 ?auto_883521 ) ) ( not ( = ?auto_883520 ?auto_883522 ) ) ( not ( = ?auto_883520 ?auto_883523 ) ) ( not ( = ?auto_883520 ?auto_883524 ) ) ( not ( = ?auto_883520 ?auto_883525 ) ) ( not ( = ?auto_883520 ?auto_883526 ) ) ( not ( = ?auto_883520 ?auto_883527 ) ) ( not ( = ?auto_883520 ?auto_883528 ) ) ( not ( = ?auto_883520 ?auto_883529 ) ) ( not ( = ?auto_883521 ?auto_883522 ) ) ( not ( = ?auto_883521 ?auto_883523 ) ) ( not ( = ?auto_883521 ?auto_883524 ) ) ( not ( = ?auto_883521 ?auto_883525 ) ) ( not ( = ?auto_883521 ?auto_883526 ) ) ( not ( = ?auto_883521 ?auto_883527 ) ) ( not ( = ?auto_883521 ?auto_883528 ) ) ( not ( = ?auto_883521 ?auto_883529 ) ) ( not ( = ?auto_883522 ?auto_883523 ) ) ( not ( = ?auto_883522 ?auto_883524 ) ) ( not ( = ?auto_883522 ?auto_883525 ) ) ( not ( = ?auto_883522 ?auto_883526 ) ) ( not ( = ?auto_883522 ?auto_883527 ) ) ( not ( = ?auto_883522 ?auto_883528 ) ) ( not ( = ?auto_883522 ?auto_883529 ) ) ( not ( = ?auto_883523 ?auto_883524 ) ) ( not ( = ?auto_883523 ?auto_883525 ) ) ( not ( = ?auto_883523 ?auto_883526 ) ) ( not ( = ?auto_883523 ?auto_883527 ) ) ( not ( = ?auto_883523 ?auto_883528 ) ) ( not ( = ?auto_883523 ?auto_883529 ) ) ( not ( = ?auto_883524 ?auto_883525 ) ) ( not ( = ?auto_883524 ?auto_883526 ) ) ( not ( = ?auto_883524 ?auto_883527 ) ) ( not ( = ?auto_883524 ?auto_883528 ) ) ( not ( = ?auto_883524 ?auto_883529 ) ) ( not ( = ?auto_883525 ?auto_883526 ) ) ( not ( = ?auto_883525 ?auto_883527 ) ) ( not ( = ?auto_883525 ?auto_883528 ) ) ( not ( = ?auto_883525 ?auto_883529 ) ) ( not ( = ?auto_883526 ?auto_883527 ) ) ( not ( = ?auto_883526 ?auto_883528 ) ) ( not ( = ?auto_883526 ?auto_883529 ) ) ( not ( = ?auto_883527 ?auto_883528 ) ) ( not ( = ?auto_883527 ?auto_883529 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_883528 ?auto_883529 )
      ( MAKE-12CRATE-VERIFY ?auto_883517 ?auto_883518 ?auto_883519 ?auto_883520 ?auto_883521 ?auto_883522 ?auto_883523 ?auto_883524 ?auto_883525 ?auto_883526 ?auto_883527 ?auto_883528 ?auto_883529 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_883642 - SURFACE
      ?auto_883643 - SURFACE
      ?auto_883644 - SURFACE
      ?auto_883645 - SURFACE
      ?auto_883646 - SURFACE
      ?auto_883647 - SURFACE
      ?auto_883648 - SURFACE
      ?auto_883649 - SURFACE
      ?auto_883650 - SURFACE
      ?auto_883651 - SURFACE
      ?auto_883652 - SURFACE
      ?auto_883653 - SURFACE
      ?auto_883654 - SURFACE
    )
    :vars
    (
      ?auto_883655 - HOIST
      ?auto_883656 - PLACE
      ?auto_883657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_883655 ?auto_883656 ) ( SURFACE-AT ?auto_883653 ?auto_883656 ) ( CLEAR ?auto_883653 ) ( IS-CRATE ?auto_883654 ) ( not ( = ?auto_883653 ?auto_883654 ) ) ( TRUCK-AT ?auto_883657 ?auto_883656 ) ( AVAILABLE ?auto_883655 ) ( IN ?auto_883654 ?auto_883657 ) ( ON ?auto_883653 ?auto_883652 ) ( not ( = ?auto_883652 ?auto_883653 ) ) ( not ( = ?auto_883652 ?auto_883654 ) ) ( ON ?auto_883643 ?auto_883642 ) ( ON ?auto_883644 ?auto_883643 ) ( ON ?auto_883645 ?auto_883644 ) ( ON ?auto_883646 ?auto_883645 ) ( ON ?auto_883647 ?auto_883646 ) ( ON ?auto_883648 ?auto_883647 ) ( ON ?auto_883649 ?auto_883648 ) ( ON ?auto_883650 ?auto_883649 ) ( ON ?auto_883651 ?auto_883650 ) ( ON ?auto_883652 ?auto_883651 ) ( not ( = ?auto_883642 ?auto_883643 ) ) ( not ( = ?auto_883642 ?auto_883644 ) ) ( not ( = ?auto_883642 ?auto_883645 ) ) ( not ( = ?auto_883642 ?auto_883646 ) ) ( not ( = ?auto_883642 ?auto_883647 ) ) ( not ( = ?auto_883642 ?auto_883648 ) ) ( not ( = ?auto_883642 ?auto_883649 ) ) ( not ( = ?auto_883642 ?auto_883650 ) ) ( not ( = ?auto_883642 ?auto_883651 ) ) ( not ( = ?auto_883642 ?auto_883652 ) ) ( not ( = ?auto_883642 ?auto_883653 ) ) ( not ( = ?auto_883642 ?auto_883654 ) ) ( not ( = ?auto_883643 ?auto_883644 ) ) ( not ( = ?auto_883643 ?auto_883645 ) ) ( not ( = ?auto_883643 ?auto_883646 ) ) ( not ( = ?auto_883643 ?auto_883647 ) ) ( not ( = ?auto_883643 ?auto_883648 ) ) ( not ( = ?auto_883643 ?auto_883649 ) ) ( not ( = ?auto_883643 ?auto_883650 ) ) ( not ( = ?auto_883643 ?auto_883651 ) ) ( not ( = ?auto_883643 ?auto_883652 ) ) ( not ( = ?auto_883643 ?auto_883653 ) ) ( not ( = ?auto_883643 ?auto_883654 ) ) ( not ( = ?auto_883644 ?auto_883645 ) ) ( not ( = ?auto_883644 ?auto_883646 ) ) ( not ( = ?auto_883644 ?auto_883647 ) ) ( not ( = ?auto_883644 ?auto_883648 ) ) ( not ( = ?auto_883644 ?auto_883649 ) ) ( not ( = ?auto_883644 ?auto_883650 ) ) ( not ( = ?auto_883644 ?auto_883651 ) ) ( not ( = ?auto_883644 ?auto_883652 ) ) ( not ( = ?auto_883644 ?auto_883653 ) ) ( not ( = ?auto_883644 ?auto_883654 ) ) ( not ( = ?auto_883645 ?auto_883646 ) ) ( not ( = ?auto_883645 ?auto_883647 ) ) ( not ( = ?auto_883645 ?auto_883648 ) ) ( not ( = ?auto_883645 ?auto_883649 ) ) ( not ( = ?auto_883645 ?auto_883650 ) ) ( not ( = ?auto_883645 ?auto_883651 ) ) ( not ( = ?auto_883645 ?auto_883652 ) ) ( not ( = ?auto_883645 ?auto_883653 ) ) ( not ( = ?auto_883645 ?auto_883654 ) ) ( not ( = ?auto_883646 ?auto_883647 ) ) ( not ( = ?auto_883646 ?auto_883648 ) ) ( not ( = ?auto_883646 ?auto_883649 ) ) ( not ( = ?auto_883646 ?auto_883650 ) ) ( not ( = ?auto_883646 ?auto_883651 ) ) ( not ( = ?auto_883646 ?auto_883652 ) ) ( not ( = ?auto_883646 ?auto_883653 ) ) ( not ( = ?auto_883646 ?auto_883654 ) ) ( not ( = ?auto_883647 ?auto_883648 ) ) ( not ( = ?auto_883647 ?auto_883649 ) ) ( not ( = ?auto_883647 ?auto_883650 ) ) ( not ( = ?auto_883647 ?auto_883651 ) ) ( not ( = ?auto_883647 ?auto_883652 ) ) ( not ( = ?auto_883647 ?auto_883653 ) ) ( not ( = ?auto_883647 ?auto_883654 ) ) ( not ( = ?auto_883648 ?auto_883649 ) ) ( not ( = ?auto_883648 ?auto_883650 ) ) ( not ( = ?auto_883648 ?auto_883651 ) ) ( not ( = ?auto_883648 ?auto_883652 ) ) ( not ( = ?auto_883648 ?auto_883653 ) ) ( not ( = ?auto_883648 ?auto_883654 ) ) ( not ( = ?auto_883649 ?auto_883650 ) ) ( not ( = ?auto_883649 ?auto_883651 ) ) ( not ( = ?auto_883649 ?auto_883652 ) ) ( not ( = ?auto_883649 ?auto_883653 ) ) ( not ( = ?auto_883649 ?auto_883654 ) ) ( not ( = ?auto_883650 ?auto_883651 ) ) ( not ( = ?auto_883650 ?auto_883652 ) ) ( not ( = ?auto_883650 ?auto_883653 ) ) ( not ( = ?auto_883650 ?auto_883654 ) ) ( not ( = ?auto_883651 ?auto_883652 ) ) ( not ( = ?auto_883651 ?auto_883653 ) ) ( not ( = ?auto_883651 ?auto_883654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_883652 ?auto_883653 ?auto_883654 )
      ( MAKE-12CRATE-VERIFY ?auto_883642 ?auto_883643 ?auto_883644 ?auto_883645 ?auto_883646 ?auto_883647 ?auto_883648 ?auto_883649 ?auto_883650 ?auto_883651 ?auto_883652 ?auto_883653 ?auto_883654 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_883780 - SURFACE
      ?auto_883781 - SURFACE
      ?auto_883782 - SURFACE
      ?auto_883783 - SURFACE
      ?auto_883784 - SURFACE
      ?auto_883785 - SURFACE
      ?auto_883786 - SURFACE
      ?auto_883787 - SURFACE
      ?auto_883788 - SURFACE
      ?auto_883789 - SURFACE
      ?auto_883790 - SURFACE
      ?auto_883791 - SURFACE
      ?auto_883792 - SURFACE
    )
    :vars
    (
      ?auto_883793 - HOIST
      ?auto_883796 - PLACE
      ?auto_883794 - TRUCK
      ?auto_883795 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_883793 ?auto_883796 ) ( SURFACE-AT ?auto_883791 ?auto_883796 ) ( CLEAR ?auto_883791 ) ( IS-CRATE ?auto_883792 ) ( not ( = ?auto_883791 ?auto_883792 ) ) ( AVAILABLE ?auto_883793 ) ( IN ?auto_883792 ?auto_883794 ) ( ON ?auto_883791 ?auto_883790 ) ( not ( = ?auto_883790 ?auto_883791 ) ) ( not ( = ?auto_883790 ?auto_883792 ) ) ( TRUCK-AT ?auto_883794 ?auto_883795 ) ( not ( = ?auto_883795 ?auto_883796 ) ) ( ON ?auto_883781 ?auto_883780 ) ( ON ?auto_883782 ?auto_883781 ) ( ON ?auto_883783 ?auto_883782 ) ( ON ?auto_883784 ?auto_883783 ) ( ON ?auto_883785 ?auto_883784 ) ( ON ?auto_883786 ?auto_883785 ) ( ON ?auto_883787 ?auto_883786 ) ( ON ?auto_883788 ?auto_883787 ) ( ON ?auto_883789 ?auto_883788 ) ( ON ?auto_883790 ?auto_883789 ) ( not ( = ?auto_883780 ?auto_883781 ) ) ( not ( = ?auto_883780 ?auto_883782 ) ) ( not ( = ?auto_883780 ?auto_883783 ) ) ( not ( = ?auto_883780 ?auto_883784 ) ) ( not ( = ?auto_883780 ?auto_883785 ) ) ( not ( = ?auto_883780 ?auto_883786 ) ) ( not ( = ?auto_883780 ?auto_883787 ) ) ( not ( = ?auto_883780 ?auto_883788 ) ) ( not ( = ?auto_883780 ?auto_883789 ) ) ( not ( = ?auto_883780 ?auto_883790 ) ) ( not ( = ?auto_883780 ?auto_883791 ) ) ( not ( = ?auto_883780 ?auto_883792 ) ) ( not ( = ?auto_883781 ?auto_883782 ) ) ( not ( = ?auto_883781 ?auto_883783 ) ) ( not ( = ?auto_883781 ?auto_883784 ) ) ( not ( = ?auto_883781 ?auto_883785 ) ) ( not ( = ?auto_883781 ?auto_883786 ) ) ( not ( = ?auto_883781 ?auto_883787 ) ) ( not ( = ?auto_883781 ?auto_883788 ) ) ( not ( = ?auto_883781 ?auto_883789 ) ) ( not ( = ?auto_883781 ?auto_883790 ) ) ( not ( = ?auto_883781 ?auto_883791 ) ) ( not ( = ?auto_883781 ?auto_883792 ) ) ( not ( = ?auto_883782 ?auto_883783 ) ) ( not ( = ?auto_883782 ?auto_883784 ) ) ( not ( = ?auto_883782 ?auto_883785 ) ) ( not ( = ?auto_883782 ?auto_883786 ) ) ( not ( = ?auto_883782 ?auto_883787 ) ) ( not ( = ?auto_883782 ?auto_883788 ) ) ( not ( = ?auto_883782 ?auto_883789 ) ) ( not ( = ?auto_883782 ?auto_883790 ) ) ( not ( = ?auto_883782 ?auto_883791 ) ) ( not ( = ?auto_883782 ?auto_883792 ) ) ( not ( = ?auto_883783 ?auto_883784 ) ) ( not ( = ?auto_883783 ?auto_883785 ) ) ( not ( = ?auto_883783 ?auto_883786 ) ) ( not ( = ?auto_883783 ?auto_883787 ) ) ( not ( = ?auto_883783 ?auto_883788 ) ) ( not ( = ?auto_883783 ?auto_883789 ) ) ( not ( = ?auto_883783 ?auto_883790 ) ) ( not ( = ?auto_883783 ?auto_883791 ) ) ( not ( = ?auto_883783 ?auto_883792 ) ) ( not ( = ?auto_883784 ?auto_883785 ) ) ( not ( = ?auto_883784 ?auto_883786 ) ) ( not ( = ?auto_883784 ?auto_883787 ) ) ( not ( = ?auto_883784 ?auto_883788 ) ) ( not ( = ?auto_883784 ?auto_883789 ) ) ( not ( = ?auto_883784 ?auto_883790 ) ) ( not ( = ?auto_883784 ?auto_883791 ) ) ( not ( = ?auto_883784 ?auto_883792 ) ) ( not ( = ?auto_883785 ?auto_883786 ) ) ( not ( = ?auto_883785 ?auto_883787 ) ) ( not ( = ?auto_883785 ?auto_883788 ) ) ( not ( = ?auto_883785 ?auto_883789 ) ) ( not ( = ?auto_883785 ?auto_883790 ) ) ( not ( = ?auto_883785 ?auto_883791 ) ) ( not ( = ?auto_883785 ?auto_883792 ) ) ( not ( = ?auto_883786 ?auto_883787 ) ) ( not ( = ?auto_883786 ?auto_883788 ) ) ( not ( = ?auto_883786 ?auto_883789 ) ) ( not ( = ?auto_883786 ?auto_883790 ) ) ( not ( = ?auto_883786 ?auto_883791 ) ) ( not ( = ?auto_883786 ?auto_883792 ) ) ( not ( = ?auto_883787 ?auto_883788 ) ) ( not ( = ?auto_883787 ?auto_883789 ) ) ( not ( = ?auto_883787 ?auto_883790 ) ) ( not ( = ?auto_883787 ?auto_883791 ) ) ( not ( = ?auto_883787 ?auto_883792 ) ) ( not ( = ?auto_883788 ?auto_883789 ) ) ( not ( = ?auto_883788 ?auto_883790 ) ) ( not ( = ?auto_883788 ?auto_883791 ) ) ( not ( = ?auto_883788 ?auto_883792 ) ) ( not ( = ?auto_883789 ?auto_883790 ) ) ( not ( = ?auto_883789 ?auto_883791 ) ) ( not ( = ?auto_883789 ?auto_883792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_883790 ?auto_883791 ?auto_883792 )
      ( MAKE-12CRATE-VERIFY ?auto_883780 ?auto_883781 ?auto_883782 ?auto_883783 ?auto_883784 ?auto_883785 ?auto_883786 ?auto_883787 ?auto_883788 ?auto_883789 ?auto_883790 ?auto_883791 ?auto_883792 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_883930 - SURFACE
      ?auto_883931 - SURFACE
      ?auto_883932 - SURFACE
      ?auto_883933 - SURFACE
      ?auto_883934 - SURFACE
      ?auto_883935 - SURFACE
      ?auto_883936 - SURFACE
      ?auto_883937 - SURFACE
      ?auto_883938 - SURFACE
      ?auto_883939 - SURFACE
      ?auto_883940 - SURFACE
      ?auto_883941 - SURFACE
      ?auto_883942 - SURFACE
    )
    :vars
    (
      ?auto_883944 - HOIST
      ?auto_883946 - PLACE
      ?auto_883943 - TRUCK
      ?auto_883947 - PLACE
      ?auto_883945 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_883944 ?auto_883946 ) ( SURFACE-AT ?auto_883941 ?auto_883946 ) ( CLEAR ?auto_883941 ) ( IS-CRATE ?auto_883942 ) ( not ( = ?auto_883941 ?auto_883942 ) ) ( AVAILABLE ?auto_883944 ) ( ON ?auto_883941 ?auto_883940 ) ( not ( = ?auto_883940 ?auto_883941 ) ) ( not ( = ?auto_883940 ?auto_883942 ) ) ( TRUCK-AT ?auto_883943 ?auto_883947 ) ( not ( = ?auto_883947 ?auto_883946 ) ) ( HOIST-AT ?auto_883945 ?auto_883947 ) ( LIFTING ?auto_883945 ?auto_883942 ) ( not ( = ?auto_883944 ?auto_883945 ) ) ( ON ?auto_883931 ?auto_883930 ) ( ON ?auto_883932 ?auto_883931 ) ( ON ?auto_883933 ?auto_883932 ) ( ON ?auto_883934 ?auto_883933 ) ( ON ?auto_883935 ?auto_883934 ) ( ON ?auto_883936 ?auto_883935 ) ( ON ?auto_883937 ?auto_883936 ) ( ON ?auto_883938 ?auto_883937 ) ( ON ?auto_883939 ?auto_883938 ) ( ON ?auto_883940 ?auto_883939 ) ( not ( = ?auto_883930 ?auto_883931 ) ) ( not ( = ?auto_883930 ?auto_883932 ) ) ( not ( = ?auto_883930 ?auto_883933 ) ) ( not ( = ?auto_883930 ?auto_883934 ) ) ( not ( = ?auto_883930 ?auto_883935 ) ) ( not ( = ?auto_883930 ?auto_883936 ) ) ( not ( = ?auto_883930 ?auto_883937 ) ) ( not ( = ?auto_883930 ?auto_883938 ) ) ( not ( = ?auto_883930 ?auto_883939 ) ) ( not ( = ?auto_883930 ?auto_883940 ) ) ( not ( = ?auto_883930 ?auto_883941 ) ) ( not ( = ?auto_883930 ?auto_883942 ) ) ( not ( = ?auto_883931 ?auto_883932 ) ) ( not ( = ?auto_883931 ?auto_883933 ) ) ( not ( = ?auto_883931 ?auto_883934 ) ) ( not ( = ?auto_883931 ?auto_883935 ) ) ( not ( = ?auto_883931 ?auto_883936 ) ) ( not ( = ?auto_883931 ?auto_883937 ) ) ( not ( = ?auto_883931 ?auto_883938 ) ) ( not ( = ?auto_883931 ?auto_883939 ) ) ( not ( = ?auto_883931 ?auto_883940 ) ) ( not ( = ?auto_883931 ?auto_883941 ) ) ( not ( = ?auto_883931 ?auto_883942 ) ) ( not ( = ?auto_883932 ?auto_883933 ) ) ( not ( = ?auto_883932 ?auto_883934 ) ) ( not ( = ?auto_883932 ?auto_883935 ) ) ( not ( = ?auto_883932 ?auto_883936 ) ) ( not ( = ?auto_883932 ?auto_883937 ) ) ( not ( = ?auto_883932 ?auto_883938 ) ) ( not ( = ?auto_883932 ?auto_883939 ) ) ( not ( = ?auto_883932 ?auto_883940 ) ) ( not ( = ?auto_883932 ?auto_883941 ) ) ( not ( = ?auto_883932 ?auto_883942 ) ) ( not ( = ?auto_883933 ?auto_883934 ) ) ( not ( = ?auto_883933 ?auto_883935 ) ) ( not ( = ?auto_883933 ?auto_883936 ) ) ( not ( = ?auto_883933 ?auto_883937 ) ) ( not ( = ?auto_883933 ?auto_883938 ) ) ( not ( = ?auto_883933 ?auto_883939 ) ) ( not ( = ?auto_883933 ?auto_883940 ) ) ( not ( = ?auto_883933 ?auto_883941 ) ) ( not ( = ?auto_883933 ?auto_883942 ) ) ( not ( = ?auto_883934 ?auto_883935 ) ) ( not ( = ?auto_883934 ?auto_883936 ) ) ( not ( = ?auto_883934 ?auto_883937 ) ) ( not ( = ?auto_883934 ?auto_883938 ) ) ( not ( = ?auto_883934 ?auto_883939 ) ) ( not ( = ?auto_883934 ?auto_883940 ) ) ( not ( = ?auto_883934 ?auto_883941 ) ) ( not ( = ?auto_883934 ?auto_883942 ) ) ( not ( = ?auto_883935 ?auto_883936 ) ) ( not ( = ?auto_883935 ?auto_883937 ) ) ( not ( = ?auto_883935 ?auto_883938 ) ) ( not ( = ?auto_883935 ?auto_883939 ) ) ( not ( = ?auto_883935 ?auto_883940 ) ) ( not ( = ?auto_883935 ?auto_883941 ) ) ( not ( = ?auto_883935 ?auto_883942 ) ) ( not ( = ?auto_883936 ?auto_883937 ) ) ( not ( = ?auto_883936 ?auto_883938 ) ) ( not ( = ?auto_883936 ?auto_883939 ) ) ( not ( = ?auto_883936 ?auto_883940 ) ) ( not ( = ?auto_883936 ?auto_883941 ) ) ( not ( = ?auto_883936 ?auto_883942 ) ) ( not ( = ?auto_883937 ?auto_883938 ) ) ( not ( = ?auto_883937 ?auto_883939 ) ) ( not ( = ?auto_883937 ?auto_883940 ) ) ( not ( = ?auto_883937 ?auto_883941 ) ) ( not ( = ?auto_883937 ?auto_883942 ) ) ( not ( = ?auto_883938 ?auto_883939 ) ) ( not ( = ?auto_883938 ?auto_883940 ) ) ( not ( = ?auto_883938 ?auto_883941 ) ) ( not ( = ?auto_883938 ?auto_883942 ) ) ( not ( = ?auto_883939 ?auto_883940 ) ) ( not ( = ?auto_883939 ?auto_883941 ) ) ( not ( = ?auto_883939 ?auto_883942 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_883940 ?auto_883941 ?auto_883942 )
      ( MAKE-12CRATE-VERIFY ?auto_883930 ?auto_883931 ?auto_883932 ?auto_883933 ?auto_883934 ?auto_883935 ?auto_883936 ?auto_883937 ?auto_883938 ?auto_883939 ?auto_883940 ?auto_883941 ?auto_883942 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_884092 - SURFACE
      ?auto_884093 - SURFACE
      ?auto_884094 - SURFACE
      ?auto_884095 - SURFACE
      ?auto_884096 - SURFACE
      ?auto_884097 - SURFACE
      ?auto_884098 - SURFACE
      ?auto_884099 - SURFACE
      ?auto_884100 - SURFACE
      ?auto_884101 - SURFACE
      ?auto_884102 - SURFACE
      ?auto_884103 - SURFACE
      ?auto_884104 - SURFACE
    )
    :vars
    (
      ?auto_884107 - HOIST
      ?auto_884105 - PLACE
      ?auto_884110 - TRUCK
      ?auto_884106 - PLACE
      ?auto_884109 - HOIST
      ?auto_884108 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_884107 ?auto_884105 ) ( SURFACE-AT ?auto_884103 ?auto_884105 ) ( CLEAR ?auto_884103 ) ( IS-CRATE ?auto_884104 ) ( not ( = ?auto_884103 ?auto_884104 ) ) ( AVAILABLE ?auto_884107 ) ( ON ?auto_884103 ?auto_884102 ) ( not ( = ?auto_884102 ?auto_884103 ) ) ( not ( = ?auto_884102 ?auto_884104 ) ) ( TRUCK-AT ?auto_884110 ?auto_884106 ) ( not ( = ?auto_884106 ?auto_884105 ) ) ( HOIST-AT ?auto_884109 ?auto_884106 ) ( not ( = ?auto_884107 ?auto_884109 ) ) ( AVAILABLE ?auto_884109 ) ( SURFACE-AT ?auto_884104 ?auto_884106 ) ( ON ?auto_884104 ?auto_884108 ) ( CLEAR ?auto_884104 ) ( not ( = ?auto_884103 ?auto_884108 ) ) ( not ( = ?auto_884104 ?auto_884108 ) ) ( not ( = ?auto_884102 ?auto_884108 ) ) ( ON ?auto_884093 ?auto_884092 ) ( ON ?auto_884094 ?auto_884093 ) ( ON ?auto_884095 ?auto_884094 ) ( ON ?auto_884096 ?auto_884095 ) ( ON ?auto_884097 ?auto_884096 ) ( ON ?auto_884098 ?auto_884097 ) ( ON ?auto_884099 ?auto_884098 ) ( ON ?auto_884100 ?auto_884099 ) ( ON ?auto_884101 ?auto_884100 ) ( ON ?auto_884102 ?auto_884101 ) ( not ( = ?auto_884092 ?auto_884093 ) ) ( not ( = ?auto_884092 ?auto_884094 ) ) ( not ( = ?auto_884092 ?auto_884095 ) ) ( not ( = ?auto_884092 ?auto_884096 ) ) ( not ( = ?auto_884092 ?auto_884097 ) ) ( not ( = ?auto_884092 ?auto_884098 ) ) ( not ( = ?auto_884092 ?auto_884099 ) ) ( not ( = ?auto_884092 ?auto_884100 ) ) ( not ( = ?auto_884092 ?auto_884101 ) ) ( not ( = ?auto_884092 ?auto_884102 ) ) ( not ( = ?auto_884092 ?auto_884103 ) ) ( not ( = ?auto_884092 ?auto_884104 ) ) ( not ( = ?auto_884092 ?auto_884108 ) ) ( not ( = ?auto_884093 ?auto_884094 ) ) ( not ( = ?auto_884093 ?auto_884095 ) ) ( not ( = ?auto_884093 ?auto_884096 ) ) ( not ( = ?auto_884093 ?auto_884097 ) ) ( not ( = ?auto_884093 ?auto_884098 ) ) ( not ( = ?auto_884093 ?auto_884099 ) ) ( not ( = ?auto_884093 ?auto_884100 ) ) ( not ( = ?auto_884093 ?auto_884101 ) ) ( not ( = ?auto_884093 ?auto_884102 ) ) ( not ( = ?auto_884093 ?auto_884103 ) ) ( not ( = ?auto_884093 ?auto_884104 ) ) ( not ( = ?auto_884093 ?auto_884108 ) ) ( not ( = ?auto_884094 ?auto_884095 ) ) ( not ( = ?auto_884094 ?auto_884096 ) ) ( not ( = ?auto_884094 ?auto_884097 ) ) ( not ( = ?auto_884094 ?auto_884098 ) ) ( not ( = ?auto_884094 ?auto_884099 ) ) ( not ( = ?auto_884094 ?auto_884100 ) ) ( not ( = ?auto_884094 ?auto_884101 ) ) ( not ( = ?auto_884094 ?auto_884102 ) ) ( not ( = ?auto_884094 ?auto_884103 ) ) ( not ( = ?auto_884094 ?auto_884104 ) ) ( not ( = ?auto_884094 ?auto_884108 ) ) ( not ( = ?auto_884095 ?auto_884096 ) ) ( not ( = ?auto_884095 ?auto_884097 ) ) ( not ( = ?auto_884095 ?auto_884098 ) ) ( not ( = ?auto_884095 ?auto_884099 ) ) ( not ( = ?auto_884095 ?auto_884100 ) ) ( not ( = ?auto_884095 ?auto_884101 ) ) ( not ( = ?auto_884095 ?auto_884102 ) ) ( not ( = ?auto_884095 ?auto_884103 ) ) ( not ( = ?auto_884095 ?auto_884104 ) ) ( not ( = ?auto_884095 ?auto_884108 ) ) ( not ( = ?auto_884096 ?auto_884097 ) ) ( not ( = ?auto_884096 ?auto_884098 ) ) ( not ( = ?auto_884096 ?auto_884099 ) ) ( not ( = ?auto_884096 ?auto_884100 ) ) ( not ( = ?auto_884096 ?auto_884101 ) ) ( not ( = ?auto_884096 ?auto_884102 ) ) ( not ( = ?auto_884096 ?auto_884103 ) ) ( not ( = ?auto_884096 ?auto_884104 ) ) ( not ( = ?auto_884096 ?auto_884108 ) ) ( not ( = ?auto_884097 ?auto_884098 ) ) ( not ( = ?auto_884097 ?auto_884099 ) ) ( not ( = ?auto_884097 ?auto_884100 ) ) ( not ( = ?auto_884097 ?auto_884101 ) ) ( not ( = ?auto_884097 ?auto_884102 ) ) ( not ( = ?auto_884097 ?auto_884103 ) ) ( not ( = ?auto_884097 ?auto_884104 ) ) ( not ( = ?auto_884097 ?auto_884108 ) ) ( not ( = ?auto_884098 ?auto_884099 ) ) ( not ( = ?auto_884098 ?auto_884100 ) ) ( not ( = ?auto_884098 ?auto_884101 ) ) ( not ( = ?auto_884098 ?auto_884102 ) ) ( not ( = ?auto_884098 ?auto_884103 ) ) ( not ( = ?auto_884098 ?auto_884104 ) ) ( not ( = ?auto_884098 ?auto_884108 ) ) ( not ( = ?auto_884099 ?auto_884100 ) ) ( not ( = ?auto_884099 ?auto_884101 ) ) ( not ( = ?auto_884099 ?auto_884102 ) ) ( not ( = ?auto_884099 ?auto_884103 ) ) ( not ( = ?auto_884099 ?auto_884104 ) ) ( not ( = ?auto_884099 ?auto_884108 ) ) ( not ( = ?auto_884100 ?auto_884101 ) ) ( not ( = ?auto_884100 ?auto_884102 ) ) ( not ( = ?auto_884100 ?auto_884103 ) ) ( not ( = ?auto_884100 ?auto_884104 ) ) ( not ( = ?auto_884100 ?auto_884108 ) ) ( not ( = ?auto_884101 ?auto_884102 ) ) ( not ( = ?auto_884101 ?auto_884103 ) ) ( not ( = ?auto_884101 ?auto_884104 ) ) ( not ( = ?auto_884101 ?auto_884108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_884102 ?auto_884103 ?auto_884104 )
      ( MAKE-12CRATE-VERIFY ?auto_884092 ?auto_884093 ?auto_884094 ?auto_884095 ?auto_884096 ?auto_884097 ?auto_884098 ?auto_884099 ?auto_884100 ?auto_884101 ?auto_884102 ?auto_884103 ?auto_884104 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_884255 - SURFACE
      ?auto_884256 - SURFACE
      ?auto_884257 - SURFACE
      ?auto_884258 - SURFACE
      ?auto_884259 - SURFACE
      ?auto_884260 - SURFACE
      ?auto_884261 - SURFACE
      ?auto_884262 - SURFACE
      ?auto_884263 - SURFACE
      ?auto_884264 - SURFACE
      ?auto_884265 - SURFACE
      ?auto_884266 - SURFACE
      ?auto_884267 - SURFACE
    )
    :vars
    (
      ?auto_884272 - HOIST
      ?auto_884271 - PLACE
      ?auto_884270 - PLACE
      ?auto_884273 - HOIST
      ?auto_884269 - SURFACE
      ?auto_884268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_884272 ?auto_884271 ) ( SURFACE-AT ?auto_884266 ?auto_884271 ) ( CLEAR ?auto_884266 ) ( IS-CRATE ?auto_884267 ) ( not ( = ?auto_884266 ?auto_884267 ) ) ( AVAILABLE ?auto_884272 ) ( ON ?auto_884266 ?auto_884265 ) ( not ( = ?auto_884265 ?auto_884266 ) ) ( not ( = ?auto_884265 ?auto_884267 ) ) ( not ( = ?auto_884270 ?auto_884271 ) ) ( HOIST-AT ?auto_884273 ?auto_884270 ) ( not ( = ?auto_884272 ?auto_884273 ) ) ( AVAILABLE ?auto_884273 ) ( SURFACE-AT ?auto_884267 ?auto_884270 ) ( ON ?auto_884267 ?auto_884269 ) ( CLEAR ?auto_884267 ) ( not ( = ?auto_884266 ?auto_884269 ) ) ( not ( = ?auto_884267 ?auto_884269 ) ) ( not ( = ?auto_884265 ?auto_884269 ) ) ( TRUCK-AT ?auto_884268 ?auto_884271 ) ( ON ?auto_884256 ?auto_884255 ) ( ON ?auto_884257 ?auto_884256 ) ( ON ?auto_884258 ?auto_884257 ) ( ON ?auto_884259 ?auto_884258 ) ( ON ?auto_884260 ?auto_884259 ) ( ON ?auto_884261 ?auto_884260 ) ( ON ?auto_884262 ?auto_884261 ) ( ON ?auto_884263 ?auto_884262 ) ( ON ?auto_884264 ?auto_884263 ) ( ON ?auto_884265 ?auto_884264 ) ( not ( = ?auto_884255 ?auto_884256 ) ) ( not ( = ?auto_884255 ?auto_884257 ) ) ( not ( = ?auto_884255 ?auto_884258 ) ) ( not ( = ?auto_884255 ?auto_884259 ) ) ( not ( = ?auto_884255 ?auto_884260 ) ) ( not ( = ?auto_884255 ?auto_884261 ) ) ( not ( = ?auto_884255 ?auto_884262 ) ) ( not ( = ?auto_884255 ?auto_884263 ) ) ( not ( = ?auto_884255 ?auto_884264 ) ) ( not ( = ?auto_884255 ?auto_884265 ) ) ( not ( = ?auto_884255 ?auto_884266 ) ) ( not ( = ?auto_884255 ?auto_884267 ) ) ( not ( = ?auto_884255 ?auto_884269 ) ) ( not ( = ?auto_884256 ?auto_884257 ) ) ( not ( = ?auto_884256 ?auto_884258 ) ) ( not ( = ?auto_884256 ?auto_884259 ) ) ( not ( = ?auto_884256 ?auto_884260 ) ) ( not ( = ?auto_884256 ?auto_884261 ) ) ( not ( = ?auto_884256 ?auto_884262 ) ) ( not ( = ?auto_884256 ?auto_884263 ) ) ( not ( = ?auto_884256 ?auto_884264 ) ) ( not ( = ?auto_884256 ?auto_884265 ) ) ( not ( = ?auto_884256 ?auto_884266 ) ) ( not ( = ?auto_884256 ?auto_884267 ) ) ( not ( = ?auto_884256 ?auto_884269 ) ) ( not ( = ?auto_884257 ?auto_884258 ) ) ( not ( = ?auto_884257 ?auto_884259 ) ) ( not ( = ?auto_884257 ?auto_884260 ) ) ( not ( = ?auto_884257 ?auto_884261 ) ) ( not ( = ?auto_884257 ?auto_884262 ) ) ( not ( = ?auto_884257 ?auto_884263 ) ) ( not ( = ?auto_884257 ?auto_884264 ) ) ( not ( = ?auto_884257 ?auto_884265 ) ) ( not ( = ?auto_884257 ?auto_884266 ) ) ( not ( = ?auto_884257 ?auto_884267 ) ) ( not ( = ?auto_884257 ?auto_884269 ) ) ( not ( = ?auto_884258 ?auto_884259 ) ) ( not ( = ?auto_884258 ?auto_884260 ) ) ( not ( = ?auto_884258 ?auto_884261 ) ) ( not ( = ?auto_884258 ?auto_884262 ) ) ( not ( = ?auto_884258 ?auto_884263 ) ) ( not ( = ?auto_884258 ?auto_884264 ) ) ( not ( = ?auto_884258 ?auto_884265 ) ) ( not ( = ?auto_884258 ?auto_884266 ) ) ( not ( = ?auto_884258 ?auto_884267 ) ) ( not ( = ?auto_884258 ?auto_884269 ) ) ( not ( = ?auto_884259 ?auto_884260 ) ) ( not ( = ?auto_884259 ?auto_884261 ) ) ( not ( = ?auto_884259 ?auto_884262 ) ) ( not ( = ?auto_884259 ?auto_884263 ) ) ( not ( = ?auto_884259 ?auto_884264 ) ) ( not ( = ?auto_884259 ?auto_884265 ) ) ( not ( = ?auto_884259 ?auto_884266 ) ) ( not ( = ?auto_884259 ?auto_884267 ) ) ( not ( = ?auto_884259 ?auto_884269 ) ) ( not ( = ?auto_884260 ?auto_884261 ) ) ( not ( = ?auto_884260 ?auto_884262 ) ) ( not ( = ?auto_884260 ?auto_884263 ) ) ( not ( = ?auto_884260 ?auto_884264 ) ) ( not ( = ?auto_884260 ?auto_884265 ) ) ( not ( = ?auto_884260 ?auto_884266 ) ) ( not ( = ?auto_884260 ?auto_884267 ) ) ( not ( = ?auto_884260 ?auto_884269 ) ) ( not ( = ?auto_884261 ?auto_884262 ) ) ( not ( = ?auto_884261 ?auto_884263 ) ) ( not ( = ?auto_884261 ?auto_884264 ) ) ( not ( = ?auto_884261 ?auto_884265 ) ) ( not ( = ?auto_884261 ?auto_884266 ) ) ( not ( = ?auto_884261 ?auto_884267 ) ) ( not ( = ?auto_884261 ?auto_884269 ) ) ( not ( = ?auto_884262 ?auto_884263 ) ) ( not ( = ?auto_884262 ?auto_884264 ) ) ( not ( = ?auto_884262 ?auto_884265 ) ) ( not ( = ?auto_884262 ?auto_884266 ) ) ( not ( = ?auto_884262 ?auto_884267 ) ) ( not ( = ?auto_884262 ?auto_884269 ) ) ( not ( = ?auto_884263 ?auto_884264 ) ) ( not ( = ?auto_884263 ?auto_884265 ) ) ( not ( = ?auto_884263 ?auto_884266 ) ) ( not ( = ?auto_884263 ?auto_884267 ) ) ( not ( = ?auto_884263 ?auto_884269 ) ) ( not ( = ?auto_884264 ?auto_884265 ) ) ( not ( = ?auto_884264 ?auto_884266 ) ) ( not ( = ?auto_884264 ?auto_884267 ) ) ( not ( = ?auto_884264 ?auto_884269 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_884265 ?auto_884266 ?auto_884267 )
      ( MAKE-12CRATE-VERIFY ?auto_884255 ?auto_884256 ?auto_884257 ?auto_884258 ?auto_884259 ?auto_884260 ?auto_884261 ?auto_884262 ?auto_884263 ?auto_884264 ?auto_884265 ?auto_884266 ?auto_884267 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_884418 - SURFACE
      ?auto_884419 - SURFACE
      ?auto_884420 - SURFACE
      ?auto_884421 - SURFACE
      ?auto_884422 - SURFACE
      ?auto_884423 - SURFACE
      ?auto_884424 - SURFACE
      ?auto_884425 - SURFACE
      ?auto_884426 - SURFACE
      ?auto_884427 - SURFACE
      ?auto_884428 - SURFACE
      ?auto_884429 - SURFACE
      ?auto_884430 - SURFACE
    )
    :vars
    (
      ?auto_884431 - HOIST
      ?auto_884435 - PLACE
      ?auto_884436 - PLACE
      ?auto_884434 - HOIST
      ?auto_884432 - SURFACE
      ?auto_884433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_884431 ?auto_884435 ) ( IS-CRATE ?auto_884430 ) ( not ( = ?auto_884429 ?auto_884430 ) ) ( not ( = ?auto_884428 ?auto_884429 ) ) ( not ( = ?auto_884428 ?auto_884430 ) ) ( not ( = ?auto_884436 ?auto_884435 ) ) ( HOIST-AT ?auto_884434 ?auto_884436 ) ( not ( = ?auto_884431 ?auto_884434 ) ) ( AVAILABLE ?auto_884434 ) ( SURFACE-AT ?auto_884430 ?auto_884436 ) ( ON ?auto_884430 ?auto_884432 ) ( CLEAR ?auto_884430 ) ( not ( = ?auto_884429 ?auto_884432 ) ) ( not ( = ?auto_884430 ?auto_884432 ) ) ( not ( = ?auto_884428 ?auto_884432 ) ) ( TRUCK-AT ?auto_884433 ?auto_884435 ) ( SURFACE-AT ?auto_884428 ?auto_884435 ) ( CLEAR ?auto_884428 ) ( LIFTING ?auto_884431 ?auto_884429 ) ( IS-CRATE ?auto_884429 ) ( ON ?auto_884419 ?auto_884418 ) ( ON ?auto_884420 ?auto_884419 ) ( ON ?auto_884421 ?auto_884420 ) ( ON ?auto_884422 ?auto_884421 ) ( ON ?auto_884423 ?auto_884422 ) ( ON ?auto_884424 ?auto_884423 ) ( ON ?auto_884425 ?auto_884424 ) ( ON ?auto_884426 ?auto_884425 ) ( ON ?auto_884427 ?auto_884426 ) ( ON ?auto_884428 ?auto_884427 ) ( not ( = ?auto_884418 ?auto_884419 ) ) ( not ( = ?auto_884418 ?auto_884420 ) ) ( not ( = ?auto_884418 ?auto_884421 ) ) ( not ( = ?auto_884418 ?auto_884422 ) ) ( not ( = ?auto_884418 ?auto_884423 ) ) ( not ( = ?auto_884418 ?auto_884424 ) ) ( not ( = ?auto_884418 ?auto_884425 ) ) ( not ( = ?auto_884418 ?auto_884426 ) ) ( not ( = ?auto_884418 ?auto_884427 ) ) ( not ( = ?auto_884418 ?auto_884428 ) ) ( not ( = ?auto_884418 ?auto_884429 ) ) ( not ( = ?auto_884418 ?auto_884430 ) ) ( not ( = ?auto_884418 ?auto_884432 ) ) ( not ( = ?auto_884419 ?auto_884420 ) ) ( not ( = ?auto_884419 ?auto_884421 ) ) ( not ( = ?auto_884419 ?auto_884422 ) ) ( not ( = ?auto_884419 ?auto_884423 ) ) ( not ( = ?auto_884419 ?auto_884424 ) ) ( not ( = ?auto_884419 ?auto_884425 ) ) ( not ( = ?auto_884419 ?auto_884426 ) ) ( not ( = ?auto_884419 ?auto_884427 ) ) ( not ( = ?auto_884419 ?auto_884428 ) ) ( not ( = ?auto_884419 ?auto_884429 ) ) ( not ( = ?auto_884419 ?auto_884430 ) ) ( not ( = ?auto_884419 ?auto_884432 ) ) ( not ( = ?auto_884420 ?auto_884421 ) ) ( not ( = ?auto_884420 ?auto_884422 ) ) ( not ( = ?auto_884420 ?auto_884423 ) ) ( not ( = ?auto_884420 ?auto_884424 ) ) ( not ( = ?auto_884420 ?auto_884425 ) ) ( not ( = ?auto_884420 ?auto_884426 ) ) ( not ( = ?auto_884420 ?auto_884427 ) ) ( not ( = ?auto_884420 ?auto_884428 ) ) ( not ( = ?auto_884420 ?auto_884429 ) ) ( not ( = ?auto_884420 ?auto_884430 ) ) ( not ( = ?auto_884420 ?auto_884432 ) ) ( not ( = ?auto_884421 ?auto_884422 ) ) ( not ( = ?auto_884421 ?auto_884423 ) ) ( not ( = ?auto_884421 ?auto_884424 ) ) ( not ( = ?auto_884421 ?auto_884425 ) ) ( not ( = ?auto_884421 ?auto_884426 ) ) ( not ( = ?auto_884421 ?auto_884427 ) ) ( not ( = ?auto_884421 ?auto_884428 ) ) ( not ( = ?auto_884421 ?auto_884429 ) ) ( not ( = ?auto_884421 ?auto_884430 ) ) ( not ( = ?auto_884421 ?auto_884432 ) ) ( not ( = ?auto_884422 ?auto_884423 ) ) ( not ( = ?auto_884422 ?auto_884424 ) ) ( not ( = ?auto_884422 ?auto_884425 ) ) ( not ( = ?auto_884422 ?auto_884426 ) ) ( not ( = ?auto_884422 ?auto_884427 ) ) ( not ( = ?auto_884422 ?auto_884428 ) ) ( not ( = ?auto_884422 ?auto_884429 ) ) ( not ( = ?auto_884422 ?auto_884430 ) ) ( not ( = ?auto_884422 ?auto_884432 ) ) ( not ( = ?auto_884423 ?auto_884424 ) ) ( not ( = ?auto_884423 ?auto_884425 ) ) ( not ( = ?auto_884423 ?auto_884426 ) ) ( not ( = ?auto_884423 ?auto_884427 ) ) ( not ( = ?auto_884423 ?auto_884428 ) ) ( not ( = ?auto_884423 ?auto_884429 ) ) ( not ( = ?auto_884423 ?auto_884430 ) ) ( not ( = ?auto_884423 ?auto_884432 ) ) ( not ( = ?auto_884424 ?auto_884425 ) ) ( not ( = ?auto_884424 ?auto_884426 ) ) ( not ( = ?auto_884424 ?auto_884427 ) ) ( not ( = ?auto_884424 ?auto_884428 ) ) ( not ( = ?auto_884424 ?auto_884429 ) ) ( not ( = ?auto_884424 ?auto_884430 ) ) ( not ( = ?auto_884424 ?auto_884432 ) ) ( not ( = ?auto_884425 ?auto_884426 ) ) ( not ( = ?auto_884425 ?auto_884427 ) ) ( not ( = ?auto_884425 ?auto_884428 ) ) ( not ( = ?auto_884425 ?auto_884429 ) ) ( not ( = ?auto_884425 ?auto_884430 ) ) ( not ( = ?auto_884425 ?auto_884432 ) ) ( not ( = ?auto_884426 ?auto_884427 ) ) ( not ( = ?auto_884426 ?auto_884428 ) ) ( not ( = ?auto_884426 ?auto_884429 ) ) ( not ( = ?auto_884426 ?auto_884430 ) ) ( not ( = ?auto_884426 ?auto_884432 ) ) ( not ( = ?auto_884427 ?auto_884428 ) ) ( not ( = ?auto_884427 ?auto_884429 ) ) ( not ( = ?auto_884427 ?auto_884430 ) ) ( not ( = ?auto_884427 ?auto_884432 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_884428 ?auto_884429 ?auto_884430 )
      ( MAKE-12CRATE-VERIFY ?auto_884418 ?auto_884419 ?auto_884420 ?auto_884421 ?auto_884422 ?auto_884423 ?auto_884424 ?auto_884425 ?auto_884426 ?auto_884427 ?auto_884428 ?auto_884429 ?auto_884430 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_884581 - SURFACE
      ?auto_884582 - SURFACE
      ?auto_884583 - SURFACE
      ?auto_884584 - SURFACE
      ?auto_884585 - SURFACE
      ?auto_884586 - SURFACE
      ?auto_884587 - SURFACE
      ?auto_884588 - SURFACE
      ?auto_884589 - SURFACE
      ?auto_884590 - SURFACE
      ?auto_884591 - SURFACE
      ?auto_884592 - SURFACE
      ?auto_884593 - SURFACE
    )
    :vars
    (
      ?auto_884596 - HOIST
      ?auto_884599 - PLACE
      ?auto_884597 - PLACE
      ?auto_884598 - HOIST
      ?auto_884594 - SURFACE
      ?auto_884595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_884596 ?auto_884599 ) ( IS-CRATE ?auto_884593 ) ( not ( = ?auto_884592 ?auto_884593 ) ) ( not ( = ?auto_884591 ?auto_884592 ) ) ( not ( = ?auto_884591 ?auto_884593 ) ) ( not ( = ?auto_884597 ?auto_884599 ) ) ( HOIST-AT ?auto_884598 ?auto_884597 ) ( not ( = ?auto_884596 ?auto_884598 ) ) ( AVAILABLE ?auto_884598 ) ( SURFACE-AT ?auto_884593 ?auto_884597 ) ( ON ?auto_884593 ?auto_884594 ) ( CLEAR ?auto_884593 ) ( not ( = ?auto_884592 ?auto_884594 ) ) ( not ( = ?auto_884593 ?auto_884594 ) ) ( not ( = ?auto_884591 ?auto_884594 ) ) ( TRUCK-AT ?auto_884595 ?auto_884599 ) ( SURFACE-AT ?auto_884591 ?auto_884599 ) ( CLEAR ?auto_884591 ) ( IS-CRATE ?auto_884592 ) ( AVAILABLE ?auto_884596 ) ( IN ?auto_884592 ?auto_884595 ) ( ON ?auto_884582 ?auto_884581 ) ( ON ?auto_884583 ?auto_884582 ) ( ON ?auto_884584 ?auto_884583 ) ( ON ?auto_884585 ?auto_884584 ) ( ON ?auto_884586 ?auto_884585 ) ( ON ?auto_884587 ?auto_884586 ) ( ON ?auto_884588 ?auto_884587 ) ( ON ?auto_884589 ?auto_884588 ) ( ON ?auto_884590 ?auto_884589 ) ( ON ?auto_884591 ?auto_884590 ) ( not ( = ?auto_884581 ?auto_884582 ) ) ( not ( = ?auto_884581 ?auto_884583 ) ) ( not ( = ?auto_884581 ?auto_884584 ) ) ( not ( = ?auto_884581 ?auto_884585 ) ) ( not ( = ?auto_884581 ?auto_884586 ) ) ( not ( = ?auto_884581 ?auto_884587 ) ) ( not ( = ?auto_884581 ?auto_884588 ) ) ( not ( = ?auto_884581 ?auto_884589 ) ) ( not ( = ?auto_884581 ?auto_884590 ) ) ( not ( = ?auto_884581 ?auto_884591 ) ) ( not ( = ?auto_884581 ?auto_884592 ) ) ( not ( = ?auto_884581 ?auto_884593 ) ) ( not ( = ?auto_884581 ?auto_884594 ) ) ( not ( = ?auto_884582 ?auto_884583 ) ) ( not ( = ?auto_884582 ?auto_884584 ) ) ( not ( = ?auto_884582 ?auto_884585 ) ) ( not ( = ?auto_884582 ?auto_884586 ) ) ( not ( = ?auto_884582 ?auto_884587 ) ) ( not ( = ?auto_884582 ?auto_884588 ) ) ( not ( = ?auto_884582 ?auto_884589 ) ) ( not ( = ?auto_884582 ?auto_884590 ) ) ( not ( = ?auto_884582 ?auto_884591 ) ) ( not ( = ?auto_884582 ?auto_884592 ) ) ( not ( = ?auto_884582 ?auto_884593 ) ) ( not ( = ?auto_884582 ?auto_884594 ) ) ( not ( = ?auto_884583 ?auto_884584 ) ) ( not ( = ?auto_884583 ?auto_884585 ) ) ( not ( = ?auto_884583 ?auto_884586 ) ) ( not ( = ?auto_884583 ?auto_884587 ) ) ( not ( = ?auto_884583 ?auto_884588 ) ) ( not ( = ?auto_884583 ?auto_884589 ) ) ( not ( = ?auto_884583 ?auto_884590 ) ) ( not ( = ?auto_884583 ?auto_884591 ) ) ( not ( = ?auto_884583 ?auto_884592 ) ) ( not ( = ?auto_884583 ?auto_884593 ) ) ( not ( = ?auto_884583 ?auto_884594 ) ) ( not ( = ?auto_884584 ?auto_884585 ) ) ( not ( = ?auto_884584 ?auto_884586 ) ) ( not ( = ?auto_884584 ?auto_884587 ) ) ( not ( = ?auto_884584 ?auto_884588 ) ) ( not ( = ?auto_884584 ?auto_884589 ) ) ( not ( = ?auto_884584 ?auto_884590 ) ) ( not ( = ?auto_884584 ?auto_884591 ) ) ( not ( = ?auto_884584 ?auto_884592 ) ) ( not ( = ?auto_884584 ?auto_884593 ) ) ( not ( = ?auto_884584 ?auto_884594 ) ) ( not ( = ?auto_884585 ?auto_884586 ) ) ( not ( = ?auto_884585 ?auto_884587 ) ) ( not ( = ?auto_884585 ?auto_884588 ) ) ( not ( = ?auto_884585 ?auto_884589 ) ) ( not ( = ?auto_884585 ?auto_884590 ) ) ( not ( = ?auto_884585 ?auto_884591 ) ) ( not ( = ?auto_884585 ?auto_884592 ) ) ( not ( = ?auto_884585 ?auto_884593 ) ) ( not ( = ?auto_884585 ?auto_884594 ) ) ( not ( = ?auto_884586 ?auto_884587 ) ) ( not ( = ?auto_884586 ?auto_884588 ) ) ( not ( = ?auto_884586 ?auto_884589 ) ) ( not ( = ?auto_884586 ?auto_884590 ) ) ( not ( = ?auto_884586 ?auto_884591 ) ) ( not ( = ?auto_884586 ?auto_884592 ) ) ( not ( = ?auto_884586 ?auto_884593 ) ) ( not ( = ?auto_884586 ?auto_884594 ) ) ( not ( = ?auto_884587 ?auto_884588 ) ) ( not ( = ?auto_884587 ?auto_884589 ) ) ( not ( = ?auto_884587 ?auto_884590 ) ) ( not ( = ?auto_884587 ?auto_884591 ) ) ( not ( = ?auto_884587 ?auto_884592 ) ) ( not ( = ?auto_884587 ?auto_884593 ) ) ( not ( = ?auto_884587 ?auto_884594 ) ) ( not ( = ?auto_884588 ?auto_884589 ) ) ( not ( = ?auto_884588 ?auto_884590 ) ) ( not ( = ?auto_884588 ?auto_884591 ) ) ( not ( = ?auto_884588 ?auto_884592 ) ) ( not ( = ?auto_884588 ?auto_884593 ) ) ( not ( = ?auto_884588 ?auto_884594 ) ) ( not ( = ?auto_884589 ?auto_884590 ) ) ( not ( = ?auto_884589 ?auto_884591 ) ) ( not ( = ?auto_884589 ?auto_884592 ) ) ( not ( = ?auto_884589 ?auto_884593 ) ) ( not ( = ?auto_884589 ?auto_884594 ) ) ( not ( = ?auto_884590 ?auto_884591 ) ) ( not ( = ?auto_884590 ?auto_884592 ) ) ( not ( = ?auto_884590 ?auto_884593 ) ) ( not ( = ?auto_884590 ?auto_884594 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_884591 ?auto_884592 ?auto_884593 )
      ( MAKE-12CRATE-VERIFY ?auto_884581 ?auto_884582 ?auto_884583 ?auto_884584 ?auto_884585 ?auto_884586 ?auto_884587 ?auto_884588 ?auto_884589 ?auto_884590 ?auto_884591 ?auto_884592 ?auto_884593 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_896136 - SURFACE
      ?auto_896137 - SURFACE
      ?auto_896138 - SURFACE
      ?auto_896139 - SURFACE
      ?auto_896140 - SURFACE
      ?auto_896141 - SURFACE
      ?auto_896142 - SURFACE
      ?auto_896143 - SURFACE
      ?auto_896144 - SURFACE
      ?auto_896145 - SURFACE
      ?auto_896146 - SURFACE
      ?auto_896147 - SURFACE
      ?auto_896148 - SURFACE
      ?auto_896149 - SURFACE
    )
    :vars
    (
      ?auto_896150 - HOIST
      ?auto_896151 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_896150 ?auto_896151 ) ( SURFACE-AT ?auto_896148 ?auto_896151 ) ( CLEAR ?auto_896148 ) ( LIFTING ?auto_896150 ?auto_896149 ) ( IS-CRATE ?auto_896149 ) ( not ( = ?auto_896148 ?auto_896149 ) ) ( ON ?auto_896137 ?auto_896136 ) ( ON ?auto_896138 ?auto_896137 ) ( ON ?auto_896139 ?auto_896138 ) ( ON ?auto_896140 ?auto_896139 ) ( ON ?auto_896141 ?auto_896140 ) ( ON ?auto_896142 ?auto_896141 ) ( ON ?auto_896143 ?auto_896142 ) ( ON ?auto_896144 ?auto_896143 ) ( ON ?auto_896145 ?auto_896144 ) ( ON ?auto_896146 ?auto_896145 ) ( ON ?auto_896147 ?auto_896146 ) ( ON ?auto_896148 ?auto_896147 ) ( not ( = ?auto_896136 ?auto_896137 ) ) ( not ( = ?auto_896136 ?auto_896138 ) ) ( not ( = ?auto_896136 ?auto_896139 ) ) ( not ( = ?auto_896136 ?auto_896140 ) ) ( not ( = ?auto_896136 ?auto_896141 ) ) ( not ( = ?auto_896136 ?auto_896142 ) ) ( not ( = ?auto_896136 ?auto_896143 ) ) ( not ( = ?auto_896136 ?auto_896144 ) ) ( not ( = ?auto_896136 ?auto_896145 ) ) ( not ( = ?auto_896136 ?auto_896146 ) ) ( not ( = ?auto_896136 ?auto_896147 ) ) ( not ( = ?auto_896136 ?auto_896148 ) ) ( not ( = ?auto_896136 ?auto_896149 ) ) ( not ( = ?auto_896137 ?auto_896138 ) ) ( not ( = ?auto_896137 ?auto_896139 ) ) ( not ( = ?auto_896137 ?auto_896140 ) ) ( not ( = ?auto_896137 ?auto_896141 ) ) ( not ( = ?auto_896137 ?auto_896142 ) ) ( not ( = ?auto_896137 ?auto_896143 ) ) ( not ( = ?auto_896137 ?auto_896144 ) ) ( not ( = ?auto_896137 ?auto_896145 ) ) ( not ( = ?auto_896137 ?auto_896146 ) ) ( not ( = ?auto_896137 ?auto_896147 ) ) ( not ( = ?auto_896137 ?auto_896148 ) ) ( not ( = ?auto_896137 ?auto_896149 ) ) ( not ( = ?auto_896138 ?auto_896139 ) ) ( not ( = ?auto_896138 ?auto_896140 ) ) ( not ( = ?auto_896138 ?auto_896141 ) ) ( not ( = ?auto_896138 ?auto_896142 ) ) ( not ( = ?auto_896138 ?auto_896143 ) ) ( not ( = ?auto_896138 ?auto_896144 ) ) ( not ( = ?auto_896138 ?auto_896145 ) ) ( not ( = ?auto_896138 ?auto_896146 ) ) ( not ( = ?auto_896138 ?auto_896147 ) ) ( not ( = ?auto_896138 ?auto_896148 ) ) ( not ( = ?auto_896138 ?auto_896149 ) ) ( not ( = ?auto_896139 ?auto_896140 ) ) ( not ( = ?auto_896139 ?auto_896141 ) ) ( not ( = ?auto_896139 ?auto_896142 ) ) ( not ( = ?auto_896139 ?auto_896143 ) ) ( not ( = ?auto_896139 ?auto_896144 ) ) ( not ( = ?auto_896139 ?auto_896145 ) ) ( not ( = ?auto_896139 ?auto_896146 ) ) ( not ( = ?auto_896139 ?auto_896147 ) ) ( not ( = ?auto_896139 ?auto_896148 ) ) ( not ( = ?auto_896139 ?auto_896149 ) ) ( not ( = ?auto_896140 ?auto_896141 ) ) ( not ( = ?auto_896140 ?auto_896142 ) ) ( not ( = ?auto_896140 ?auto_896143 ) ) ( not ( = ?auto_896140 ?auto_896144 ) ) ( not ( = ?auto_896140 ?auto_896145 ) ) ( not ( = ?auto_896140 ?auto_896146 ) ) ( not ( = ?auto_896140 ?auto_896147 ) ) ( not ( = ?auto_896140 ?auto_896148 ) ) ( not ( = ?auto_896140 ?auto_896149 ) ) ( not ( = ?auto_896141 ?auto_896142 ) ) ( not ( = ?auto_896141 ?auto_896143 ) ) ( not ( = ?auto_896141 ?auto_896144 ) ) ( not ( = ?auto_896141 ?auto_896145 ) ) ( not ( = ?auto_896141 ?auto_896146 ) ) ( not ( = ?auto_896141 ?auto_896147 ) ) ( not ( = ?auto_896141 ?auto_896148 ) ) ( not ( = ?auto_896141 ?auto_896149 ) ) ( not ( = ?auto_896142 ?auto_896143 ) ) ( not ( = ?auto_896142 ?auto_896144 ) ) ( not ( = ?auto_896142 ?auto_896145 ) ) ( not ( = ?auto_896142 ?auto_896146 ) ) ( not ( = ?auto_896142 ?auto_896147 ) ) ( not ( = ?auto_896142 ?auto_896148 ) ) ( not ( = ?auto_896142 ?auto_896149 ) ) ( not ( = ?auto_896143 ?auto_896144 ) ) ( not ( = ?auto_896143 ?auto_896145 ) ) ( not ( = ?auto_896143 ?auto_896146 ) ) ( not ( = ?auto_896143 ?auto_896147 ) ) ( not ( = ?auto_896143 ?auto_896148 ) ) ( not ( = ?auto_896143 ?auto_896149 ) ) ( not ( = ?auto_896144 ?auto_896145 ) ) ( not ( = ?auto_896144 ?auto_896146 ) ) ( not ( = ?auto_896144 ?auto_896147 ) ) ( not ( = ?auto_896144 ?auto_896148 ) ) ( not ( = ?auto_896144 ?auto_896149 ) ) ( not ( = ?auto_896145 ?auto_896146 ) ) ( not ( = ?auto_896145 ?auto_896147 ) ) ( not ( = ?auto_896145 ?auto_896148 ) ) ( not ( = ?auto_896145 ?auto_896149 ) ) ( not ( = ?auto_896146 ?auto_896147 ) ) ( not ( = ?auto_896146 ?auto_896148 ) ) ( not ( = ?auto_896146 ?auto_896149 ) ) ( not ( = ?auto_896147 ?auto_896148 ) ) ( not ( = ?auto_896147 ?auto_896149 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_896148 ?auto_896149 )
      ( MAKE-13CRATE-VERIFY ?auto_896136 ?auto_896137 ?auto_896138 ?auto_896139 ?auto_896140 ?auto_896141 ?auto_896142 ?auto_896143 ?auto_896144 ?auto_896145 ?auto_896146 ?auto_896147 ?auto_896148 ?auto_896149 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_896278 - SURFACE
      ?auto_896279 - SURFACE
      ?auto_896280 - SURFACE
      ?auto_896281 - SURFACE
      ?auto_896282 - SURFACE
      ?auto_896283 - SURFACE
      ?auto_896284 - SURFACE
      ?auto_896285 - SURFACE
      ?auto_896286 - SURFACE
      ?auto_896287 - SURFACE
      ?auto_896288 - SURFACE
      ?auto_896289 - SURFACE
      ?auto_896290 - SURFACE
      ?auto_896291 - SURFACE
    )
    :vars
    (
      ?auto_896292 - HOIST
      ?auto_896293 - PLACE
      ?auto_896294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_896292 ?auto_896293 ) ( SURFACE-AT ?auto_896290 ?auto_896293 ) ( CLEAR ?auto_896290 ) ( IS-CRATE ?auto_896291 ) ( not ( = ?auto_896290 ?auto_896291 ) ) ( TRUCK-AT ?auto_896294 ?auto_896293 ) ( AVAILABLE ?auto_896292 ) ( IN ?auto_896291 ?auto_896294 ) ( ON ?auto_896290 ?auto_896289 ) ( not ( = ?auto_896289 ?auto_896290 ) ) ( not ( = ?auto_896289 ?auto_896291 ) ) ( ON ?auto_896279 ?auto_896278 ) ( ON ?auto_896280 ?auto_896279 ) ( ON ?auto_896281 ?auto_896280 ) ( ON ?auto_896282 ?auto_896281 ) ( ON ?auto_896283 ?auto_896282 ) ( ON ?auto_896284 ?auto_896283 ) ( ON ?auto_896285 ?auto_896284 ) ( ON ?auto_896286 ?auto_896285 ) ( ON ?auto_896287 ?auto_896286 ) ( ON ?auto_896288 ?auto_896287 ) ( ON ?auto_896289 ?auto_896288 ) ( not ( = ?auto_896278 ?auto_896279 ) ) ( not ( = ?auto_896278 ?auto_896280 ) ) ( not ( = ?auto_896278 ?auto_896281 ) ) ( not ( = ?auto_896278 ?auto_896282 ) ) ( not ( = ?auto_896278 ?auto_896283 ) ) ( not ( = ?auto_896278 ?auto_896284 ) ) ( not ( = ?auto_896278 ?auto_896285 ) ) ( not ( = ?auto_896278 ?auto_896286 ) ) ( not ( = ?auto_896278 ?auto_896287 ) ) ( not ( = ?auto_896278 ?auto_896288 ) ) ( not ( = ?auto_896278 ?auto_896289 ) ) ( not ( = ?auto_896278 ?auto_896290 ) ) ( not ( = ?auto_896278 ?auto_896291 ) ) ( not ( = ?auto_896279 ?auto_896280 ) ) ( not ( = ?auto_896279 ?auto_896281 ) ) ( not ( = ?auto_896279 ?auto_896282 ) ) ( not ( = ?auto_896279 ?auto_896283 ) ) ( not ( = ?auto_896279 ?auto_896284 ) ) ( not ( = ?auto_896279 ?auto_896285 ) ) ( not ( = ?auto_896279 ?auto_896286 ) ) ( not ( = ?auto_896279 ?auto_896287 ) ) ( not ( = ?auto_896279 ?auto_896288 ) ) ( not ( = ?auto_896279 ?auto_896289 ) ) ( not ( = ?auto_896279 ?auto_896290 ) ) ( not ( = ?auto_896279 ?auto_896291 ) ) ( not ( = ?auto_896280 ?auto_896281 ) ) ( not ( = ?auto_896280 ?auto_896282 ) ) ( not ( = ?auto_896280 ?auto_896283 ) ) ( not ( = ?auto_896280 ?auto_896284 ) ) ( not ( = ?auto_896280 ?auto_896285 ) ) ( not ( = ?auto_896280 ?auto_896286 ) ) ( not ( = ?auto_896280 ?auto_896287 ) ) ( not ( = ?auto_896280 ?auto_896288 ) ) ( not ( = ?auto_896280 ?auto_896289 ) ) ( not ( = ?auto_896280 ?auto_896290 ) ) ( not ( = ?auto_896280 ?auto_896291 ) ) ( not ( = ?auto_896281 ?auto_896282 ) ) ( not ( = ?auto_896281 ?auto_896283 ) ) ( not ( = ?auto_896281 ?auto_896284 ) ) ( not ( = ?auto_896281 ?auto_896285 ) ) ( not ( = ?auto_896281 ?auto_896286 ) ) ( not ( = ?auto_896281 ?auto_896287 ) ) ( not ( = ?auto_896281 ?auto_896288 ) ) ( not ( = ?auto_896281 ?auto_896289 ) ) ( not ( = ?auto_896281 ?auto_896290 ) ) ( not ( = ?auto_896281 ?auto_896291 ) ) ( not ( = ?auto_896282 ?auto_896283 ) ) ( not ( = ?auto_896282 ?auto_896284 ) ) ( not ( = ?auto_896282 ?auto_896285 ) ) ( not ( = ?auto_896282 ?auto_896286 ) ) ( not ( = ?auto_896282 ?auto_896287 ) ) ( not ( = ?auto_896282 ?auto_896288 ) ) ( not ( = ?auto_896282 ?auto_896289 ) ) ( not ( = ?auto_896282 ?auto_896290 ) ) ( not ( = ?auto_896282 ?auto_896291 ) ) ( not ( = ?auto_896283 ?auto_896284 ) ) ( not ( = ?auto_896283 ?auto_896285 ) ) ( not ( = ?auto_896283 ?auto_896286 ) ) ( not ( = ?auto_896283 ?auto_896287 ) ) ( not ( = ?auto_896283 ?auto_896288 ) ) ( not ( = ?auto_896283 ?auto_896289 ) ) ( not ( = ?auto_896283 ?auto_896290 ) ) ( not ( = ?auto_896283 ?auto_896291 ) ) ( not ( = ?auto_896284 ?auto_896285 ) ) ( not ( = ?auto_896284 ?auto_896286 ) ) ( not ( = ?auto_896284 ?auto_896287 ) ) ( not ( = ?auto_896284 ?auto_896288 ) ) ( not ( = ?auto_896284 ?auto_896289 ) ) ( not ( = ?auto_896284 ?auto_896290 ) ) ( not ( = ?auto_896284 ?auto_896291 ) ) ( not ( = ?auto_896285 ?auto_896286 ) ) ( not ( = ?auto_896285 ?auto_896287 ) ) ( not ( = ?auto_896285 ?auto_896288 ) ) ( not ( = ?auto_896285 ?auto_896289 ) ) ( not ( = ?auto_896285 ?auto_896290 ) ) ( not ( = ?auto_896285 ?auto_896291 ) ) ( not ( = ?auto_896286 ?auto_896287 ) ) ( not ( = ?auto_896286 ?auto_896288 ) ) ( not ( = ?auto_896286 ?auto_896289 ) ) ( not ( = ?auto_896286 ?auto_896290 ) ) ( not ( = ?auto_896286 ?auto_896291 ) ) ( not ( = ?auto_896287 ?auto_896288 ) ) ( not ( = ?auto_896287 ?auto_896289 ) ) ( not ( = ?auto_896287 ?auto_896290 ) ) ( not ( = ?auto_896287 ?auto_896291 ) ) ( not ( = ?auto_896288 ?auto_896289 ) ) ( not ( = ?auto_896288 ?auto_896290 ) ) ( not ( = ?auto_896288 ?auto_896291 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_896289 ?auto_896290 ?auto_896291 )
      ( MAKE-13CRATE-VERIFY ?auto_896278 ?auto_896279 ?auto_896280 ?auto_896281 ?auto_896282 ?auto_896283 ?auto_896284 ?auto_896285 ?auto_896286 ?auto_896287 ?auto_896288 ?auto_896289 ?auto_896290 ?auto_896291 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_896434 - SURFACE
      ?auto_896435 - SURFACE
      ?auto_896436 - SURFACE
      ?auto_896437 - SURFACE
      ?auto_896438 - SURFACE
      ?auto_896439 - SURFACE
      ?auto_896440 - SURFACE
      ?auto_896441 - SURFACE
      ?auto_896442 - SURFACE
      ?auto_896443 - SURFACE
      ?auto_896444 - SURFACE
      ?auto_896445 - SURFACE
      ?auto_896446 - SURFACE
      ?auto_896447 - SURFACE
    )
    :vars
    (
      ?auto_896448 - HOIST
      ?auto_896449 - PLACE
      ?auto_896450 - TRUCK
      ?auto_896451 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_896448 ?auto_896449 ) ( SURFACE-AT ?auto_896446 ?auto_896449 ) ( CLEAR ?auto_896446 ) ( IS-CRATE ?auto_896447 ) ( not ( = ?auto_896446 ?auto_896447 ) ) ( AVAILABLE ?auto_896448 ) ( IN ?auto_896447 ?auto_896450 ) ( ON ?auto_896446 ?auto_896445 ) ( not ( = ?auto_896445 ?auto_896446 ) ) ( not ( = ?auto_896445 ?auto_896447 ) ) ( TRUCK-AT ?auto_896450 ?auto_896451 ) ( not ( = ?auto_896451 ?auto_896449 ) ) ( ON ?auto_896435 ?auto_896434 ) ( ON ?auto_896436 ?auto_896435 ) ( ON ?auto_896437 ?auto_896436 ) ( ON ?auto_896438 ?auto_896437 ) ( ON ?auto_896439 ?auto_896438 ) ( ON ?auto_896440 ?auto_896439 ) ( ON ?auto_896441 ?auto_896440 ) ( ON ?auto_896442 ?auto_896441 ) ( ON ?auto_896443 ?auto_896442 ) ( ON ?auto_896444 ?auto_896443 ) ( ON ?auto_896445 ?auto_896444 ) ( not ( = ?auto_896434 ?auto_896435 ) ) ( not ( = ?auto_896434 ?auto_896436 ) ) ( not ( = ?auto_896434 ?auto_896437 ) ) ( not ( = ?auto_896434 ?auto_896438 ) ) ( not ( = ?auto_896434 ?auto_896439 ) ) ( not ( = ?auto_896434 ?auto_896440 ) ) ( not ( = ?auto_896434 ?auto_896441 ) ) ( not ( = ?auto_896434 ?auto_896442 ) ) ( not ( = ?auto_896434 ?auto_896443 ) ) ( not ( = ?auto_896434 ?auto_896444 ) ) ( not ( = ?auto_896434 ?auto_896445 ) ) ( not ( = ?auto_896434 ?auto_896446 ) ) ( not ( = ?auto_896434 ?auto_896447 ) ) ( not ( = ?auto_896435 ?auto_896436 ) ) ( not ( = ?auto_896435 ?auto_896437 ) ) ( not ( = ?auto_896435 ?auto_896438 ) ) ( not ( = ?auto_896435 ?auto_896439 ) ) ( not ( = ?auto_896435 ?auto_896440 ) ) ( not ( = ?auto_896435 ?auto_896441 ) ) ( not ( = ?auto_896435 ?auto_896442 ) ) ( not ( = ?auto_896435 ?auto_896443 ) ) ( not ( = ?auto_896435 ?auto_896444 ) ) ( not ( = ?auto_896435 ?auto_896445 ) ) ( not ( = ?auto_896435 ?auto_896446 ) ) ( not ( = ?auto_896435 ?auto_896447 ) ) ( not ( = ?auto_896436 ?auto_896437 ) ) ( not ( = ?auto_896436 ?auto_896438 ) ) ( not ( = ?auto_896436 ?auto_896439 ) ) ( not ( = ?auto_896436 ?auto_896440 ) ) ( not ( = ?auto_896436 ?auto_896441 ) ) ( not ( = ?auto_896436 ?auto_896442 ) ) ( not ( = ?auto_896436 ?auto_896443 ) ) ( not ( = ?auto_896436 ?auto_896444 ) ) ( not ( = ?auto_896436 ?auto_896445 ) ) ( not ( = ?auto_896436 ?auto_896446 ) ) ( not ( = ?auto_896436 ?auto_896447 ) ) ( not ( = ?auto_896437 ?auto_896438 ) ) ( not ( = ?auto_896437 ?auto_896439 ) ) ( not ( = ?auto_896437 ?auto_896440 ) ) ( not ( = ?auto_896437 ?auto_896441 ) ) ( not ( = ?auto_896437 ?auto_896442 ) ) ( not ( = ?auto_896437 ?auto_896443 ) ) ( not ( = ?auto_896437 ?auto_896444 ) ) ( not ( = ?auto_896437 ?auto_896445 ) ) ( not ( = ?auto_896437 ?auto_896446 ) ) ( not ( = ?auto_896437 ?auto_896447 ) ) ( not ( = ?auto_896438 ?auto_896439 ) ) ( not ( = ?auto_896438 ?auto_896440 ) ) ( not ( = ?auto_896438 ?auto_896441 ) ) ( not ( = ?auto_896438 ?auto_896442 ) ) ( not ( = ?auto_896438 ?auto_896443 ) ) ( not ( = ?auto_896438 ?auto_896444 ) ) ( not ( = ?auto_896438 ?auto_896445 ) ) ( not ( = ?auto_896438 ?auto_896446 ) ) ( not ( = ?auto_896438 ?auto_896447 ) ) ( not ( = ?auto_896439 ?auto_896440 ) ) ( not ( = ?auto_896439 ?auto_896441 ) ) ( not ( = ?auto_896439 ?auto_896442 ) ) ( not ( = ?auto_896439 ?auto_896443 ) ) ( not ( = ?auto_896439 ?auto_896444 ) ) ( not ( = ?auto_896439 ?auto_896445 ) ) ( not ( = ?auto_896439 ?auto_896446 ) ) ( not ( = ?auto_896439 ?auto_896447 ) ) ( not ( = ?auto_896440 ?auto_896441 ) ) ( not ( = ?auto_896440 ?auto_896442 ) ) ( not ( = ?auto_896440 ?auto_896443 ) ) ( not ( = ?auto_896440 ?auto_896444 ) ) ( not ( = ?auto_896440 ?auto_896445 ) ) ( not ( = ?auto_896440 ?auto_896446 ) ) ( not ( = ?auto_896440 ?auto_896447 ) ) ( not ( = ?auto_896441 ?auto_896442 ) ) ( not ( = ?auto_896441 ?auto_896443 ) ) ( not ( = ?auto_896441 ?auto_896444 ) ) ( not ( = ?auto_896441 ?auto_896445 ) ) ( not ( = ?auto_896441 ?auto_896446 ) ) ( not ( = ?auto_896441 ?auto_896447 ) ) ( not ( = ?auto_896442 ?auto_896443 ) ) ( not ( = ?auto_896442 ?auto_896444 ) ) ( not ( = ?auto_896442 ?auto_896445 ) ) ( not ( = ?auto_896442 ?auto_896446 ) ) ( not ( = ?auto_896442 ?auto_896447 ) ) ( not ( = ?auto_896443 ?auto_896444 ) ) ( not ( = ?auto_896443 ?auto_896445 ) ) ( not ( = ?auto_896443 ?auto_896446 ) ) ( not ( = ?auto_896443 ?auto_896447 ) ) ( not ( = ?auto_896444 ?auto_896445 ) ) ( not ( = ?auto_896444 ?auto_896446 ) ) ( not ( = ?auto_896444 ?auto_896447 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_896445 ?auto_896446 ?auto_896447 )
      ( MAKE-13CRATE-VERIFY ?auto_896434 ?auto_896435 ?auto_896436 ?auto_896437 ?auto_896438 ?auto_896439 ?auto_896440 ?auto_896441 ?auto_896442 ?auto_896443 ?auto_896444 ?auto_896445 ?auto_896446 ?auto_896447 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_896603 - SURFACE
      ?auto_896604 - SURFACE
      ?auto_896605 - SURFACE
      ?auto_896606 - SURFACE
      ?auto_896607 - SURFACE
      ?auto_896608 - SURFACE
      ?auto_896609 - SURFACE
      ?auto_896610 - SURFACE
      ?auto_896611 - SURFACE
      ?auto_896612 - SURFACE
      ?auto_896613 - SURFACE
      ?auto_896614 - SURFACE
      ?auto_896615 - SURFACE
      ?auto_896616 - SURFACE
    )
    :vars
    (
      ?auto_896618 - HOIST
      ?auto_896620 - PLACE
      ?auto_896617 - TRUCK
      ?auto_896619 - PLACE
      ?auto_896621 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_896618 ?auto_896620 ) ( SURFACE-AT ?auto_896615 ?auto_896620 ) ( CLEAR ?auto_896615 ) ( IS-CRATE ?auto_896616 ) ( not ( = ?auto_896615 ?auto_896616 ) ) ( AVAILABLE ?auto_896618 ) ( ON ?auto_896615 ?auto_896614 ) ( not ( = ?auto_896614 ?auto_896615 ) ) ( not ( = ?auto_896614 ?auto_896616 ) ) ( TRUCK-AT ?auto_896617 ?auto_896619 ) ( not ( = ?auto_896619 ?auto_896620 ) ) ( HOIST-AT ?auto_896621 ?auto_896619 ) ( LIFTING ?auto_896621 ?auto_896616 ) ( not ( = ?auto_896618 ?auto_896621 ) ) ( ON ?auto_896604 ?auto_896603 ) ( ON ?auto_896605 ?auto_896604 ) ( ON ?auto_896606 ?auto_896605 ) ( ON ?auto_896607 ?auto_896606 ) ( ON ?auto_896608 ?auto_896607 ) ( ON ?auto_896609 ?auto_896608 ) ( ON ?auto_896610 ?auto_896609 ) ( ON ?auto_896611 ?auto_896610 ) ( ON ?auto_896612 ?auto_896611 ) ( ON ?auto_896613 ?auto_896612 ) ( ON ?auto_896614 ?auto_896613 ) ( not ( = ?auto_896603 ?auto_896604 ) ) ( not ( = ?auto_896603 ?auto_896605 ) ) ( not ( = ?auto_896603 ?auto_896606 ) ) ( not ( = ?auto_896603 ?auto_896607 ) ) ( not ( = ?auto_896603 ?auto_896608 ) ) ( not ( = ?auto_896603 ?auto_896609 ) ) ( not ( = ?auto_896603 ?auto_896610 ) ) ( not ( = ?auto_896603 ?auto_896611 ) ) ( not ( = ?auto_896603 ?auto_896612 ) ) ( not ( = ?auto_896603 ?auto_896613 ) ) ( not ( = ?auto_896603 ?auto_896614 ) ) ( not ( = ?auto_896603 ?auto_896615 ) ) ( not ( = ?auto_896603 ?auto_896616 ) ) ( not ( = ?auto_896604 ?auto_896605 ) ) ( not ( = ?auto_896604 ?auto_896606 ) ) ( not ( = ?auto_896604 ?auto_896607 ) ) ( not ( = ?auto_896604 ?auto_896608 ) ) ( not ( = ?auto_896604 ?auto_896609 ) ) ( not ( = ?auto_896604 ?auto_896610 ) ) ( not ( = ?auto_896604 ?auto_896611 ) ) ( not ( = ?auto_896604 ?auto_896612 ) ) ( not ( = ?auto_896604 ?auto_896613 ) ) ( not ( = ?auto_896604 ?auto_896614 ) ) ( not ( = ?auto_896604 ?auto_896615 ) ) ( not ( = ?auto_896604 ?auto_896616 ) ) ( not ( = ?auto_896605 ?auto_896606 ) ) ( not ( = ?auto_896605 ?auto_896607 ) ) ( not ( = ?auto_896605 ?auto_896608 ) ) ( not ( = ?auto_896605 ?auto_896609 ) ) ( not ( = ?auto_896605 ?auto_896610 ) ) ( not ( = ?auto_896605 ?auto_896611 ) ) ( not ( = ?auto_896605 ?auto_896612 ) ) ( not ( = ?auto_896605 ?auto_896613 ) ) ( not ( = ?auto_896605 ?auto_896614 ) ) ( not ( = ?auto_896605 ?auto_896615 ) ) ( not ( = ?auto_896605 ?auto_896616 ) ) ( not ( = ?auto_896606 ?auto_896607 ) ) ( not ( = ?auto_896606 ?auto_896608 ) ) ( not ( = ?auto_896606 ?auto_896609 ) ) ( not ( = ?auto_896606 ?auto_896610 ) ) ( not ( = ?auto_896606 ?auto_896611 ) ) ( not ( = ?auto_896606 ?auto_896612 ) ) ( not ( = ?auto_896606 ?auto_896613 ) ) ( not ( = ?auto_896606 ?auto_896614 ) ) ( not ( = ?auto_896606 ?auto_896615 ) ) ( not ( = ?auto_896606 ?auto_896616 ) ) ( not ( = ?auto_896607 ?auto_896608 ) ) ( not ( = ?auto_896607 ?auto_896609 ) ) ( not ( = ?auto_896607 ?auto_896610 ) ) ( not ( = ?auto_896607 ?auto_896611 ) ) ( not ( = ?auto_896607 ?auto_896612 ) ) ( not ( = ?auto_896607 ?auto_896613 ) ) ( not ( = ?auto_896607 ?auto_896614 ) ) ( not ( = ?auto_896607 ?auto_896615 ) ) ( not ( = ?auto_896607 ?auto_896616 ) ) ( not ( = ?auto_896608 ?auto_896609 ) ) ( not ( = ?auto_896608 ?auto_896610 ) ) ( not ( = ?auto_896608 ?auto_896611 ) ) ( not ( = ?auto_896608 ?auto_896612 ) ) ( not ( = ?auto_896608 ?auto_896613 ) ) ( not ( = ?auto_896608 ?auto_896614 ) ) ( not ( = ?auto_896608 ?auto_896615 ) ) ( not ( = ?auto_896608 ?auto_896616 ) ) ( not ( = ?auto_896609 ?auto_896610 ) ) ( not ( = ?auto_896609 ?auto_896611 ) ) ( not ( = ?auto_896609 ?auto_896612 ) ) ( not ( = ?auto_896609 ?auto_896613 ) ) ( not ( = ?auto_896609 ?auto_896614 ) ) ( not ( = ?auto_896609 ?auto_896615 ) ) ( not ( = ?auto_896609 ?auto_896616 ) ) ( not ( = ?auto_896610 ?auto_896611 ) ) ( not ( = ?auto_896610 ?auto_896612 ) ) ( not ( = ?auto_896610 ?auto_896613 ) ) ( not ( = ?auto_896610 ?auto_896614 ) ) ( not ( = ?auto_896610 ?auto_896615 ) ) ( not ( = ?auto_896610 ?auto_896616 ) ) ( not ( = ?auto_896611 ?auto_896612 ) ) ( not ( = ?auto_896611 ?auto_896613 ) ) ( not ( = ?auto_896611 ?auto_896614 ) ) ( not ( = ?auto_896611 ?auto_896615 ) ) ( not ( = ?auto_896611 ?auto_896616 ) ) ( not ( = ?auto_896612 ?auto_896613 ) ) ( not ( = ?auto_896612 ?auto_896614 ) ) ( not ( = ?auto_896612 ?auto_896615 ) ) ( not ( = ?auto_896612 ?auto_896616 ) ) ( not ( = ?auto_896613 ?auto_896614 ) ) ( not ( = ?auto_896613 ?auto_896615 ) ) ( not ( = ?auto_896613 ?auto_896616 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_896614 ?auto_896615 ?auto_896616 )
      ( MAKE-13CRATE-VERIFY ?auto_896603 ?auto_896604 ?auto_896605 ?auto_896606 ?auto_896607 ?auto_896608 ?auto_896609 ?auto_896610 ?auto_896611 ?auto_896612 ?auto_896613 ?auto_896614 ?auto_896615 ?auto_896616 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_896785 - SURFACE
      ?auto_896786 - SURFACE
      ?auto_896787 - SURFACE
      ?auto_896788 - SURFACE
      ?auto_896789 - SURFACE
      ?auto_896790 - SURFACE
      ?auto_896791 - SURFACE
      ?auto_896792 - SURFACE
      ?auto_896793 - SURFACE
      ?auto_896794 - SURFACE
      ?auto_896795 - SURFACE
      ?auto_896796 - SURFACE
      ?auto_896797 - SURFACE
      ?auto_896798 - SURFACE
    )
    :vars
    (
      ?auto_896800 - HOIST
      ?auto_896803 - PLACE
      ?auto_896799 - TRUCK
      ?auto_896801 - PLACE
      ?auto_896802 - HOIST
      ?auto_896804 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_896800 ?auto_896803 ) ( SURFACE-AT ?auto_896797 ?auto_896803 ) ( CLEAR ?auto_896797 ) ( IS-CRATE ?auto_896798 ) ( not ( = ?auto_896797 ?auto_896798 ) ) ( AVAILABLE ?auto_896800 ) ( ON ?auto_896797 ?auto_896796 ) ( not ( = ?auto_896796 ?auto_896797 ) ) ( not ( = ?auto_896796 ?auto_896798 ) ) ( TRUCK-AT ?auto_896799 ?auto_896801 ) ( not ( = ?auto_896801 ?auto_896803 ) ) ( HOIST-AT ?auto_896802 ?auto_896801 ) ( not ( = ?auto_896800 ?auto_896802 ) ) ( AVAILABLE ?auto_896802 ) ( SURFACE-AT ?auto_896798 ?auto_896801 ) ( ON ?auto_896798 ?auto_896804 ) ( CLEAR ?auto_896798 ) ( not ( = ?auto_896797 ?auto_896804 ) ) ( not ( = ?auto_896798 ?auto_896804 ) ) ( not ( = ?auto_896796 ?auto_896804 ) ) ( ON ?auto_896786 ?auto_896785 ) ( ON ?auto_896787 ?auto_896786 ) ( ON ?auto_896788 ?auto_896787 ) ( ON ?auto_896789 ?auto_896788 ) ( ON ?auto_896790 ?auto_896789 ) ( ON ?auto_896791 ?auto_896790 ) ( ON ?auto_896792 ?auto_896791 ) ( ON ?auto_896793 ?auto_896792 ) ( ON ?auto_896794 ?auto_896793 ) ( ON ?auto_896795 ?auto_896794 ) ( ON ?auto_896796 ?auto_896795 ) ( not ( = ?auto_896785 ?auto_896786 ) ) ( not ( = ?auto_896785 ?auto_896787 ) ) ( not ( = ?auto_896785 ?auto_896788 ) ) ( not ( = ?auto_896785 ?auto_896789 ) ) ( not ( = ?auto_896785 ?auto_896790 ) ) ( not ( = ?auto_896785 ?auto_896791 ) ) ( not ( = ?auto_896785 ?auto_896792 ) ) ( not ( = ?auto_896785 ?auto_896793 ) ) ( not ( = ?auto_896785 ?auto_896794 ) ) ( not ( = ?auto_896785 ?auto_896795 ) ) ( not ( = ?auto_896785 ?auto_896796 ) ) ( not ( = ?auto_896785 ?auto_896797 ) ) ( not ( = ?auto_896785 ?auto_896798 ) ) ( not ( = ?auto_896785 ?auto_896804 ) ) ( not ( = ?auto_896786 ?auto_896787 ) ) ( not ( = ?auto_896786 ?auto_896788 ) ) ( not ( = ?auto_896786 ?auto_896789 ) ) ( not ( = ?auto_896786 ?auto_896790 ) ) ( not ( = ?auto_896786 ?auto_896791 ) ) ( not ( = ?auto_896786 ?auto_896792 ) ) ( not ( = ?auto_896786 ?auto_896793 ) ) ( not ( = ?auto_896786 ?auto_896794 ) ) ( not ( = ?auto_896786 ?auto_896795 ) ) ( not ( = ?auto_896786 ?auto_896796 ) ) ( not ( = ?auto_896786 ?auto_896797 ) ) ( not ( = ?auto_896786 ?auto_896798 ) ) ( not ( = ?auto_896786 ?auto_896804 ) ) ( not ( = ?auto_896787 ?auto_896788 ) ) ( not ( = ?auto_896787 ?auto_896789 ) ) ( not ( = ?auto_896787 ?auto_896790 ) ) ( not ( = ?auto_896787 ?auto_896791 ) ) ( not ( = ?auto_896787 ?auto_896792 ) ) ( not ( = ?auto_896787 ?auto_896793 ) ) ( not ( = ?auto_896787 ?auto_896794 ) ) ( not ( = ?auto_896787 ?auto_896795 ) ) ( not ( = ?auto_896787 ?auto_896796 ) ) ( not ( = ?auto_896787 ?auto_896797 ) ) ( not ( = ?auto_896787 ?auto_896798 ) ) ( not ( = ?auto_896787 ?auto_896804 ) ) ( not ( = ?auto_896788 ?auto_896789 ) ) ( not ( = ?auto_896788 ?auto_896790 ) ) ( not ( = ?auto_896788 ?auto_896791 ) ) ( not ( = ?auto_896788 ?auto_896792 ) ) ( not ( = ?auto_896788 ?auto_896793 ) ) ( not ( = ?auto_896788 ?auto_896794 ) ) ( not ( = ?auto_896788 ?auto_896795 ) ) ( not ( = ?auto_896788 ?auto_896796 ) ) ( not ( = ?auto_896788 ?auto_896797 ) ) ( not ( = ?auto_896788 ?auto_896798 ) ) ( not ( = ?auto_896788 ?auto_896804 ) ) ( not ( = ?auto_896789 ?auto_896790 ) ) ( not ( = ?auto_896789 ?auto_896791 ) ) ( not ( = ?auto_896789 ?auto_896792 ) ) ( not ( = ?auto_896789 ?auto_896793 ) ) ( not ( = ?auto_896789 ?auto_896794 ) ) ( not ( = ?auto_896789 ?auto_896795 ) ) ( not ( = ?auto_896789 ?auto_896796 ) ) ( not ( = ?auto_896789 ?auto_896797 ) ) ( not ( = ?auto_896789 ?auto_896798 ) ) ( not ( = ?auto_896789 ?auto_896804 ) ) ( not ( = ?auto_896790 ?auto_896791 ) ) ( not ( = ?auto_896790 ?auto_896792 ) ) ( not ( = ?auto_896790 ?auto_896793 ) ) ( not ( = ?auto_896790 ?auto_896794 ) ) ( not ( = ?auto_896790 ?auto_896795 ) ) ( not ( = ?auto_896790 ?auto_896796 ) ) ( not ( = ?auto_896790 ?auto_896797 ) ) ( not ( = ?auto_896790 ?auto_896798 ) ) ( not ( = ?auto_896790 ?auto_896804 ) ) ( not ( = ?auto_896791 ?auto_896792 ) ) ( not ( = ?auto_896791 ?auto_896793 ) ) ( not ( = ?auto_896791 ?auto_896794 ) ) ( not ( = ?auto_896791 ?auto_896795 ) ) ( not ( = ?auto_896791 ?auto_896796 ) ) ( not ( = ?auto_896791 ?auto_896797 ) ) ( not ( = ?auto_896791 ?auto_896798 ) ) ( not ( = ?auto_896791 ?auto_896804 ) ) ( not ( = ?auto_896792 ?auto_896793 ) ) ( not ( = ?auto_896792 ?auto_896794 ) ) ( not ( = ?auto_896792 ?auto_896795 ) ) ( not ( = ?auto_896792 ?auto_896796 ) ) ( not ( = ?auto_896792 ?auto_896797 ) ) ( not ( = ?auto_896792 ?auto_896798 ) ) ( not ( = ?auto_896792 ?auto_896804 ) ) ( not ( = ?auto_896793 ?auto_896794 ) ) ( not ( = ?auto_896793 ?auto_896795 ) ) ( not ( = ?auto_896793 ?auto_896796 ) ) ( not ( = ?auto_896793 ?auto_896797 ) ) ( not ( = ?auto_896793 ?auto_896798 ) ) ( not ( = ?auto_896793 ?auto_896804 ) ) ( not ( = ?auto_896794 ?auto_896795 ) ) ( not ( = ?auto_896794 ?auto_896796 ) ) ( not ( = ?auto_896794 ?auto_896797 ) ) ( not ( = ?auto_896794 ?auto_896798 ) ) ( not ( = ?auto_896794 ?auto_896804 ) ) ( not ( = ?auto_896795 ?auto_896796 ) ) ( not ( = ?auto_896795 ?auto_896797 ) ) ( not ( = ?auto_896795 ?auto_896798 ) ) ( not ( = ?auto_896795 ?auto_896804 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_896796 ?auto_896797 ?auto_896798 )
      ( MAKE-13CRATE-VERIFY ?auto_896785 ?auto_896786 ?auto_896787 ?auto_896788 ?auto_896789 ?auto_896790 ?auto_896791 ?auto_896792 ?auto_896793 ?auto_896794 ?auto_896795 ?auto_896796 ?auto_896797 ?auto_896798 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_896968 - SURFACE
      ?auto_896969 - SURFACE
      ?auto_896970 - SURFACE
      ?auto_896971 - SURFACE
      ?auto_896972 - SURFACE
      ?auto_896973 - SURFACE
      ?auto_896974 - SURFACE
      ?auto_896975 - SURFACE
      ?auto_896976 - SURFACE
      ?auto_896977 - SURFACE
      ?auto_896978 - SURFACE
      ?auto_896979 - SURFACE
      ?auto_896980 - SURFACE
      ?auto_896981 - SURFACE
    )
    :vars
    (
      ?auto_896986 - HOIST
      ?auto_896985 - PLACE
      ?auto_896982 - PLACE
      ?auto_896987 - HOIST
      ?auto_896983 - SURFACE
      ?auto_896984 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_896986 ?auto_896985 ) ( SURFACE-AT ?auto_896980 ?auto_896985 ) ( CLEAR ?auto_896980 ) ( IS-CRATE ?auto_896981 ) ( not ( = ?auto_896980 ?auto_896981 ) ) ( AVAILABLE ?auto_896986 ) ( ON ?auto_896980 ?auto_896979 ) ( not ( = ?auto_896979 ?auto_896980 ) ) ( not ( = ?auto_896979 ?auto_896981 ) ) ( not ( = ?auto_896982 ?auto_896985 ) ) ( HOIST-AT ?auto_896987 ?auto_896982 ) ( not ( = ?auto_896986 ?auto_896987 ) ) ( AVAILABLE ?auto_896987 ) ( SURFACE-AT ?auto_896981 ?auto_896982 ) ( ON ?auto_896981 ?auto_896983 ) ( CLEAR ?auto_896981 ) ( not ( = ?auto_896980 ?auto_896983 ) ) ( not ( = ?auto_896981 ?auto_896983 ) ) ( not ( = ?auto_896979 ?auto_896983 ) ) ( TRUCK-AT ?auto_896984 ?auto_896985 ) ( ON ?auto_896969 ?auto_896968 ) ( ON ?auto_896970 ?auto_896969 ) ( ON ?auto_896971 ?auto_896970 ) ( ON ?auto_896972 ?auto_896971 ) ( ON ?auto_896973 ?auto_896972 ) ( ON ?auto_896974 ?auto_896973 ) ( ON ?auto_896975 ?auto_896974 ) ( ON ?auto_896976 ?auto_896975 ) ( ON ?auto_896977 ?auto_896976 ) ( ON ?auto_896978 ?auto_896977 ) ( ON ?auto_896979 ?auto_896978 ) ( not ( = ?auto_896968 ?auto_896969 ) ) ( not ( = ?auto_896968 ?auto_896970 ) ) ( not ( = ?auto_896968 ?auto_896971 ) ) ( not ( = ?auto_896968 ?auto_896972 ) ) ( not ( = ?auto_896968 ?auto_896973 ) ) ( not ( = ?auto_896968 ?auto_896974 ) ) ( not ( = ?auto_896968 ?auto_896975 ) ) ( not ( = ?auto_896968 ?auto_896976 ) ) ( not ( = ?auto_896968 ?auto_896977 ) ) ( not ( = ?auto_896968 ?auto_896978 ) ) ( not ( = ?auto_896968 ?auto_896979 ) ) ( not ( = ?auto_896968 ?auto_896980 ) ) ( not ( = ?auto_896968 ?auto_896981 ) ) ( not ( = ?auto_896968 ?auto_896983 ) ) ( not ( = ?auto_896969 ?auto_896970 ) ) ( not ( = ?auto_896969 ?auto_896971 ) ) ( not ( = ?auto_896969 ?auto_896972 ) ) ( not ( = ?auto_896969 ?auto_896973 ) ) ( not ( = ?auto_896969 ?auto_896974 ) ) ( not ( = ?auto_896969 ?auto_896975 ) ) ( not ( = ?auto_896969 ?auto_896976 ) ) ( not ( = ?auto_896969 ?auto_896977 ) ) ( not ( = ?auto_896969 ?auto_896978 ) ) ( not ( = ?auto_896969 ?auto_896979 ) ) ( not ( = ?auto_896969 ?auto_896980 ) ) ( not ( = ?auto_896969 ?auto_896981 ) ) ( not ( = ?auto_896969 ?auto_896983 ) ) ( not ( = ?auto_896970 ?auto_896971 ) ) ( not ( = ?auto_896970 ?auto_896972 ) ) ( not ( = ?auto_896970 ?auto_896973 ) ) ( not ( = ?auto_896970 ?auto_896974 ) ) ( not ( = ?auto_896970 ?auto_896975 ) ) ( not ( = ?auto_896970 ?auto_896976 ) ) ( not ( = ?auto_896970 ?auto_896977 ) ) ( not ( = ?auto_896970 ?auto_896978 ) ) ( not ( = ?auto_896970 ?auto_896979 ) ) ( not ( = ?auto_896970 ?auto_896980 ) ) ( not ( = ?auto_896970 ?auto_896981 ) ) ( not ( = ?auto_896970 ?auto_896983 ) ) ( not ( = ?auto_896971 ?auto_896972 ) ) ( not ( = ?auto_896971 ?auto_896973 ) ) ( not ( = ?auto_896971 ?auto_896974 ) ) ( not ( = ?auto_896971 ?auto_896975 ) ) ( not ( = ?auto_896971 ?auto_896976 ) ) ( not ( = ?auto_896971 ?auto_896977 ) ) ( not ( = ?auto_896971 ?auto_896978 ) ) ( not ( = ?auto_896971 ?auto_896979 ) ) ( not ( = ?auto_896971 ?auto_896980 ) ) ( not ( = ?auto_896971 ?auto_896981 ) ) ( not ( = ?auto_896971 ?auto_896983 ) ) ( not ( = ?auto_896972 ?auto_896973 ) ) ( not ( = ?auto_896972 ?auto_896974 ) ) ( not ( = ?auto_896972 ?auto_896975 ) ) ( not ( = ?auto_896972 ?auto_896976 ) ) ( not ( = ?auto_896972 ?auto_896977 ) ) ( not ( = ?auto_896972 ?auto_896978 ) ) ( not ( = ?auto_896972 ?auto_896979 ) ) ( not ( = ?auto_896972 ?auto_896980 ) ) ( not ( = ?auto_896972 ?auto_896981 ) ) ( not ( = ?auto_896972 ?auto_896983 ) ) ( not ( = ?auto_896973 ?auto_896974 ) ) ( not ( = ?auto_896973 ?auto_896975 ) ) ( not ( = ?auto_896973 ?auto_896976 ) ) ( not ( = ?auto_896973 ?auto_896977 ) ) ( not ( = ?auto_896973 ?auto_896978 ) ) ( not ( = ?auto_896973 ?auto_896979 ) ) ( not ( = ?auto_896973 ?auto_896980 ) ) ( not ( = ?auto_896973 ?auto_896981 ) ) ( not ( = ?auto_896973 ?auto_896983 ) ) ( not ( = ?auto_896974 ?auto_896975 ) ) ( not ( = ?auto_896974 ?auto_896976 ) ) ( not ( = ?auto_896974 ?auto_896977 ) ) ( not ( = ?auto_896974 ?auto_896978 ) ) ( not ( = ?auto_896974 ?auto_896979 ) ) ( not ( = ?auto_896974 ?auto_896980 ) ) ( not ( = ?auto_896974 ?auto_896981 ) ) ( not ( = ?auto_896974 ?auto_896983 ) ) ( not ( = ?auto_896975 ?auto_896976 ) ) ( not ( = ?auto_896975 ?auto_896977 ) ) ( not ( = ?auto_896975 ?auto_896978 ) ) ( not ( = ?auto_896975 ?auto_896979 ) ) ( not ( = ?auto_896975 ?auto_896980 ) ) ( not ( = ?auto_896975 ?auto_896981 ) ) ( not ( = ?auto_896975 ?auto_896983 ) ) ( not ( = ?auto_896976 ?auto_896977 ) ) ( not ( = ?auto_896976 ?auto_896978 ) ) ( not ( = ?auto_896976 ?auto_896979 ) ) ( not ( = ?auto_896976 ?auto_896980 ) ) ( not ( = ?auto_896976 ?auto_896981 ) ) ( not ( = ?auto_896976 ?auto_896983 ) ) ( not ( = ?auto_896977 ?auto_896978 ) ) ( not ( = ?auto_896977 ?auto_896979 ) ) ( not ( = ?auto_896977 ?auto_896980 ) ) ( not ( = ?auto_896977 ?auto_896981 ) ) ( not ( = ?auto_896977 ?auto_896983 ) ) ( not ( = ?auto_896978 ?auto_896979 ) ) ( not ( = ?auto_896978 ?auto_896980 ) ) ( not ( = ?auto_896978 ?auto_896981 ) ) ( not ( = ?auto_896978 ?auto_896983 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_896979 ?auto_896980 ?auto_896981 )
      ( MAKE-13CRATE-VERIFY ?auto_896968 ?auto_896969 ?auto_896970 ?auto_896971 ?auto_896972 ?auto_896973 ?auto_896974 ?auto_896975 ?auto_896976 ?auto_896977 ?auto_896978 ?auto_896979 ?auto_896980 ?auto_896981 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_897151 - SURFACE
      ?auto_897152 - SURFACE
      ?auto_897153 - SURFACE
      ?auto_897154 - SURFACE
      ?auto_897155 - SURFACE
      ?auto_897156 - SURFACE
      ?auto_897157 - SURFACE
      ?auto_897158 - SURFACE
      ?auto_897159 - SURFACE
      ?auto_897160 - SURFACE
      ?auto_897161 - SURFACE
      ?auto_897162 - SURFACE
      ?auto_897163 - SURFACE
      ?auto_897164 - SURFACE
    )
    :vars
    (
      ?auto_897170 - HOIST
      ?auto_897167 - PLACE
      ?auto_897169 - PLACE
      ?auto_897168 - HOIST
      ?auto_897166 - SURFACE
      ?auto_897165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_897170 ?auto_897167 ) ( IS-CRATE ?auto_897164 ) ( not ( = ?auto_897163 ?auto_897164 ) ) ( not ( = ?auto_897162 ?auto_897163 ) ) ( not ( = ?auto_897162 ?auto_897164 ) ) ( not ( = ?auto_897169 ?auto_897167 ) ) ( HOIST-AT ?auto_897168 ?auto_897169 ) ( not ( = ?auto_897170 ?auto_897168 ) ) ( AVAILABLE ?auto_897168 ) ( SURFACE-AT ?auto_897164 ?auto_897169 ) ( ON ?auto_897164 ?auto_897166 ) ( CLEAR ?auto_897164 ) ( not ( = ?auto_897163 ?auto_897166 ) ) ( not ( = ?auto_897164 ?auto_897166 ) ) ( not ( = ?auto_897162 ?auto_897166 ) ) ( TRUCK-AT ?auto_897165 ?auto_897167 ) ( SURFACE-AT ?auto_897162 ?auto_897167 ) ( CLEAR ?auto_897162 ) ( LIFTING ?auto_897170 ?auto_897163 ) ( IS-CRATE ?auto_897163 ) ( ON ?auto_897152 ?auto_897151 ) ( ON ?auto_897153 ?auto_897152 ) ( ON ?auto_897154 ?auto_897153 ) ( ON ?auto_897155 ?auto_897154 ) ( ON ?auto_897156 ?auto_897155 ) ( ON ?auto_897157 ?auto_897156 ) ( ON ?auto_897158 ?auto_897157 ) ( ON ?auto_897159 ?auto_897158 ) ( ON ?auto_897160 ?auto_897159 ) ( ON ?auto_897161 ?auto_897160 ) ( ON ?auto_897162 ?auto_897161 ) ( not ( = ?auto_897151 ?auto_897152 ) ) ( not ( = ?auto_897151 ?auto_897153 ) ) ( not ( = ?auto_897151 ?auto_897154 ) ) ( not ( = ?auto_897151 ?auto_897155 ) ) ( not ( = ?auto_897151 ?auto_897156 ) ) ( not ( = ?auto_897151 ?auto_897157 ) ) ( not ( = ?auto_897151 ?auto_897158 ) ) ( not ( = ?auto_897151 ?auto_897159 ) ) ( not ( = ?auto_897151 ?auto_897160 ) ) ( not ( = ?auto_897151 ?auto_897161 ) ) ( not ( = ?auto_897151 ?auto_897162 ) ) ( not ( = ?auto_897151 ?auto_897163 ) ) ( not ( = ?auto_897151 ?auto_897164 ) ) ( not ( = ?auto_897151 ?auto_897166 ) ) ( not ( = ?auto_897152 ?auto_897153 ) ) ( not ( = ?auto_897152 ?auto_897154 ) ) ( not ( = ?auto_897152 ?auto_897155 ) ) ( not ( = ?auto_897152 ?auto_897156 ) ) ( not ( = ?auto_897152 ?auto_897157 ) ) ( not ( = ?auto_897152 ?auto_897158 ) ) ( not ( = ?auto_897152 ?auto_897159 ) ) ( not ( = ?auto_897152 ?auto_897160 ) ) ( not ( = ?auto_897152 ?auto_897161 ) ) ( not ( = ?auto_897152 ?auto_897162 ) ) ( not ( = ?auto_897152 ?auto_897163 ) ) ( not ( = ?auto_897152 ?auto_897164 ) ) ( not ( = ?auto_897152 ?auto_897166 ) ) ( not ( = ?auto_897153 ?auto_897154 ) ) ( not ( = ?auto_897153 ?auto_897155 ) ) ( not ( = ?auto_897153 ?auto_897156 ) ) ( not ( = ?auto_897153 ?auto_897157 ) ) ( not ( = ?auto_897153 ?auto_897158 ) ) ( not ( = ?auto_897153 ?auto_897159 ) ) ( not ( = ?auto_897153 ?auto_897160 ) ) ( not ( = ?auto_897153 ?auto_897161 ) ) ( not ( = ?auto_897153 ?auto_897162 ) ) ( not ( = ?auto_897153 ?auto_897163 ) ) ( not ( = ?auto_897153 ?auto_897164 ) ) ( not ( = ?auto_897153 ?auto_897166 ) ) ( not ( = ?auto_897154 ?auto_897155 ) ) ( not ( = ?auto_897154 ?auto_897156 ) ) ( not ( = ?auto_897154 ?auto_897157 ) ) ( not ( = ?auto_897154 ?auto_897158 ) ) ( not ( = ?auto_897154 ?auto_897159 ) ) ( not ( = ?auto_897154 ?auto_897160 ) ) ( not ( = ?auto_897154 ?auto_897161 ) ) ( not ( = ?auto_897154 ?auto_897162 ) ) ( not ( = ?auto_897154 ?auto_897163 ) ) ( not ( = ?auto_897154 ?auto_897164 ) ) ( not ( = ?auto_897154 ?auto_897166 ) ) ( not ( = ?auto_897155 ?auto_897156 ) ) ( not ( = ?auto_897155 ?auto_897157 ) ) ( not ( = ?auto_897155 ?auto_897158 ) ) ( not ( = ?auto_897155 ?auto_897159 ) ) ( not ( = ?auto_897155 ?auto_897160 ) ) ( not ( = ?auto_897155 ?auto_897161 ) ) ( not ( = ?auto_897155 ?auto_897162 ) ) ( not ( = ?auto_897155 ?auto_897163 ) ) ( not ( = ?auto_897155 ?auto_897164 ) ) ( not ( = ?auto_897155 ?auto_897166 ) ) ( not ( = ?auto_897156 ?auto_897157 ) ) ( not ( = ?auto_897156 ?auto_897158 ) ) ( not ( = ?auto_897156 ?auto_897159 ) ) ( not ( = ?auto_897156 ?auto_897160 ) ) ( not ( = ?auto_897156 ?auto_897161 ) ) ( not ( = ?auto_897156 ?auto_897162 ) ) ( not ( = ?auto_897156 ?auto_897163 ) ) ( not ( = ?auto_897156 ?auto_897164 ) ) ( not ( = ?auto_897156 ?auto_897166 ) ) ( not ( = ?auto_897157 ?auto_897158 ) ) ( not ( = ?auto_897157 ?auto_897159 ) ) ( not ( = ?auto_897157 ?auto_897160 ) ) ( not ( = ?auto_897157 ?auto_897161 ) ) ( not ( = ?auto_897157 ?auto_897162 ) ) ( not ( = ?auto_897157 ?auto_897163 ) ) ( not ( = ?auto_897157 ?auto_897164 ) ) ( not ( = ?auto_897157 ?auto_897166 ) ) ( not ( = ?auto_897158 ?auto_897159 ) ) ( not ( = ?auto_897158 ?auto_897160 ) ) ( not ( = ?auto_897158 ?auto_897161 ) ) ( not ( = ?auto_897158 ?auto_897162 ) ) ( not ( = ?auto_897158 ?auto_897163 ) ) ( not ( = ?auto_897158 ?auto_897164 ) ) ( not ( = ?auto_897158 ?auto_897166 ) ) ( not ( = ?auto_897159 ?auto_897160 ) ) ( not ( = ?auto_897159 ?auto_897161 ) ) ( not ( = ?auto_897159 ?auto_897162 ) ) ( not ( = ?auto_897159 ?auto_897163 ) ) ( not ( = ?auto_897159 ?auto_897164 ) ) ( not ( = ?auto_897159 ?auto_897166 ) ) ( not ( = ?auto_897160 ?auto_897161 ) ) ( not ( = ?auto_897160 ?auto_897162 ) ) ( not ( = ?auto_897160 ?auto_897163 ) ) ( not ( = ?auto_897160 ?auto_897164 ) ) ( not ( = ?auto_897160 ?auto_897166 ) ) ( not ( = ?auto_897161 ?auto_897162 ) ) ( not ( = ?auto_897161 ?auto_897163 ) ) ( not ( = ?auto_897161 ?auto_897164 ) ) ( not ( = ?auto_897161 ?auto_897166 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_897162 ?auto_897163 ?auto_897164 )
      ( MAKE-13CRATE-VERIFY ?auto_897151 ?auto_897152 ?auto_897153 ?auto_897154 ?auto_897155 ?auto_897156 ?auto_897157 ?auto_897158 ?auto_897159 ?auto_897160 ?auto_897161 ?auto_897162 ?auto_897163 ?auto_897164 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_897334 - SURFACE
      ?auto_897335 - SURFACE
      ?auto_897336 - SURFACE
      ?auto_897337 - SURFACE
      ?auto_897338 - SURFACE
      ?auto_897339 - SURFACE
      ?auto_897340 - SURFACE
      ?auto_897341 - SURFACE
      ?auto_897342 - SURFACE
      ?auto_897343 - SURFACE
      ?auto_897344 - SURFACE
      ?auto_897345 - SURFACE
      ?auto_897346 - SURFACE
      ?auto_897347 - SURFACE
    )
    :vars
    (
      ?auto_897353 - HOIST
      ?auto_897351 - PLACE
      ?auto_897352 - PLACE
      ?auto_897350 - HOIST
      ?auto_897348 - SURFACE
      ?auto_897349 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_897353 ?auto_897351 ) ( IS-CRATE ?auto_897347 ) ( not ( = ?auto_897346 ?auto_897347 ) ) ( not ( = ?auto_897345 ?auto_897346 ) ) ( not ( = ?auto_897345 ?auto_897347 ) ) ( not ( = ?auto_897352 ?auto_897351 ) ) ( HOIST-AT ?auto_897350 ?auto_897352 ) ( not ( = ?auto_897353 ?auto_897350 ) ) ( AVAILABLE ?auto_897350 ) ( SURFACE-AT ?auto_897347 ?auto_897352 ) ( ON ?auto_897347 ?auto_897348 ) ( CLEAR ?auto_897347 ) ( not ( = ?auto_897346 ?auto_897348 ) ) ( not ( = ?auto_897347 ?auto_897348 ) ) ( not ( = ?auto_897345 ?auto_897348 ) ) ( TRUCK-AT ?auto_897349 ?auto_897351 ) ( SURFACE-AT ?auto_897345 ?auto_897351 ) ( CLEAR ?auto_897345 ) ( IS-CRATE ?auto_897346 ) ( AVAILABLE ?auto_897353 ) ( IN ?auto_897346 ?auto_897349 ) ( ON ?auto_897335 ?auto_897334 ) ( ON ?auto_897336 ?auto_897335 ) ( ON ?auto_897337 ?auto_897336 ) ( ON ?auto_897338 ?auto_897337 ) ( ON ?auto_897339 ?auto_897338 ) ( ON ?auto_897340 ?auto_897339 ) ( ON ?auto_897341 ?auto_897340 ) ( ON ?auto_897342 ?auto_897341 ) ( ON ?auto_897343 ?auto_897342 ) ( ON ?auto_897344 ?auto_897343 ) ( ON ?auto_897345 ?auto_897344 ) ( not ( = ?auto_897334 ?auto_897335 ) ) ( not ( = ?auto_897334 ?auto_897336 ) ) ( not ( = ?auto_897334 ?auto_897337 ) ) ( not ( = ?auto_897334 ?auto_897338 ) ) ( not ( = ?auto_897334 ?auto_897339 ) ) ( not ( = ?auto_897334 ?auto_897340 ) ) ( not ( = ?auto_897334 ?auto_897341 ) ) ( not ( = ?auto_897334 ?auto_897342 ) ) ( not ( = ?auto_897334 ?auto_897343 ) ) ( not ( = ?auto_897334 ?auto_897344 ) ) ( not ( = ?auto_897334 ?auto_897345 ) ) ( not ( = ?auto_897334 ?auto_897346 ) ) ( not ( = ?auto_897334 ?auto_897347 ) ) ( not ( = ?auto_897334 ?auto_897348 ) ) ( not ( = ?auto_897335 ?auto_897336 ) ) ( not ( = ?auto_897335 ?auto_897337 ) ) ( not ( = ?auto_897335 ?auto_897338 ) ) ( not ( = ?auto_897335 ?auto_897339 ) ) ( not ( = ?auto_897335 ?auto_897340 ) ) ( not ( = ?auto_897335 ?auto_897341 ) ) ( not ( = ?auto_897335 ?auto_897342 ) ) ( not ( = ?auto_897335 ?auto_897343 ) ) ( not ( = ?auto_897335 ?auto_897344 ) ) ( not ( = ?auto_897335 ?auto_897345 ) ) ( not ( = ?auto_897335 ?auto_897346 ) ) ( not ( = ?auto_897335 ?auto_897347 ) ) ( not ( = ?auto_897335 ?auto_897348 ) ) ( not ( = ?auto_897336 ?auto_897337 ) ) ( not ( = ?auto_897336 ?auto_897338 ) ) ( not ( = ?auto_897336 ?auto_897339 ) ) ( not ( = ?auto_897336 ?auto_897340 ) ) ( not ( = ?auto_897336 ?auto_897341 ) ) ( not ( = ?auto_897336 ?auto_897342 ) ) ( not ( = ?auto_897336 ?auto_897343 ) ) ( not ( = ?auto_897336 ?auto_897344 ) ) ( not ( = ?auto_897336 ?auto_897345 ) ) ( not ( = ?auto_897336 ?auto_897346 ) ) ( not ( = ?auto_897336 ?auto_897347 ) ) ( not ( = ?auto_897336 ?auto_897348 ) ) ( not ( = ?auto_897337 ?auto_897338 ) ) ( not ( = ?auto_897337 ?auto_897339 ) ) ( not ( = ?auto_897337 ?auto_897340 ) ) ( not ( = ?auto_897337 ?auto_897341 ) ) ( not ( = ?auto_897337 ?auto_897342 ) ) ( not ( = ?auto_897337 ?auto_897343 ) ) ( not ( = ?auto_897337 ?auto_897344 ) ) ( not ( = ?auto_897337 ?auto_897345 ) ) ( not ( = ?auto_897337 ?auto_897346 ) ) ( not ( = ?auto_897337 ?auto_897347 ) ) ( not ( = ?auto_897337 ?auto_897348 ) ) ( not ( = ?auto_897338 ?auto_897339 ) ) ( not ( = ?auto_897338 ?auto_897340 ) ) ( not ( = ?auto_897338 ?auto_897341 ) ) ( not ( = ?auto_897338 ?auto_897342 ) ) ( not ( = ?auto_897338 ?auto_897343 ) ) ( not ( = ?auto_897338 ?auto_897344 ) ) ( not ( = ?auto_897338 ?auto_897345 ) ) ( not ( = ?auto_897338 ?auto_897346 ) ) ( not ( = ?auto_897338 ?auto_897347 ) ) ( not ( = ?auto_897338 ?auto_897348 ) ) ( not ( = ?auto_897339 ?auto_897340 ) ) ( not ( = ?auto_897339 ?auto_897341 ) ) ( not ( = ?auto_897339 ?auto_897342 ) ) ( not ( = ?auto_897339 ?auto_897343 ) ) ( not ( = ?auto_897339 ?auto_897344 ) ) ( not ( = ?auto_897339 ?auto_897345 ) ) ( not ( = ?auto_897339 ?auto_897346 ) ) ( not ( = ?auto_897339 ?auto_897347 ) ) ( not ( = ?auto_897339 ?auto_897348 ) ) ( not ( = ?auto_897340 ?auto_897341 ) ) ( not ( = ?auto_897340 ?auto_897342 ) ) ( not ( = ?auto_897340 ?auto_897343 ) ) ( not ( = ?auto_897340 ?auto_897344 ) ) ( not ( = ?auto_897340 ?auto_897345 ) ) ( not ( = ?auto_897340 ?auto_897346 ) ) ( not ( = ?auto_897340 ?auto_897347 ) ) ( not ( = ?auto_897340 ?auto_897348 ) ) ( not ( = ?auto_897341 ?auto_897342 ) ) ( not ( = ?auto_897341 ?auto_897343 ) ) ( not ( = ?auto_897341 ?auto_897344 ) ) ( not ( = ?auto_897341 ?auto_897345 ) ) ( not ( = ?auto_897341 ?auto_897346 ) ) ( not ( = ?auto_897341 ?auto_897347 ) ) ( not ( = ?auto_897341 ?auto_897348 ) ) ( not ( = ?auto_897342 ?auto_897343 ) ) ( not ( = ?auto_897342 ?auto_897344 ) ) ( not ( = ?auto_897342 ?auto_897345 ) ) ( not ( = ?auto_897342 ?auto_897346 ) ) ( not ( = ?auto_897342 ?auto_897347 ) ) ( not ( = ?auto_897342 ?auto_897348 ) ) ( not ( = ?auto_897343 ?auto_897344 ) ) ( not ( = ?auto_897343 ?auto_897345 ) ) ( not ( = ?auto_897343 ?auto_897346 ) ) ( not ( = ?auto_897343 ?auto_897347 ) ) ( not ( = ?auto_897343 ?auto_897348 ) ) ( not ( = ?auto_897344 ?auto_897345 ) ) ( not ( = ?auto_897344 ?auto_897346 ) ) ( not ( = ?auto_897344 ?auto_897347 ) ) ( not ( = ?auto_897344 ?auto_897348 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_897345 ?auto_897346 ?auto_897347 )
      ( MAKE-13CRATE-VERIFY ?auto_897334 ?auto_897335 ?auto_897336 ?auto_897337 ?auto_897338 ?auto_897339 ?auto_897340 ?auto_897341 ?auto_897342 ?auto_897343 ?auto_897344 ?auto_897345 ?auto_897346 ?auto_897347 ) )
  )

)

