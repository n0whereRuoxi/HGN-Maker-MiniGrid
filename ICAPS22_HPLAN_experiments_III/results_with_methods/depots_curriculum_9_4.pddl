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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6326 - SURFACE
      ?auto_6327 - SURFACE
    )
    :vars
    (
      ?auto_6328 - HOIST
      ?auto_6329 - PLACE
      ?auto_6331 - PLACE
      ?auto_6332 - HOIST
      ?auto_6333 - SURFACE
      ?auto_6330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6328 ?auto_6329 ) ( SURFACE-AT ?auto_6326 ?auto_6329 ) ( CLEAR ?auto_6326 ) ( IS-CRATE ?auto_6327 ) ( AVAILABLE ?auto_6328 ) ( not ( = ?auto_6331 ?auto_6329 ) ) ( HOIST-AT ?auto_6332 ?auto_6331 ) ( AVAILABLE ?auto_6332 ) ( SURFACE-AT ?auto_6327 ?auto_6331 ) ( ON ?auto_6327 ?auto_6333 ) ( CLEAR ?auto_6327 ) ( TRUCK-AT ?auto_6330 ?auto_6329 ) ( not ( = ?auto_6326 ?auto_6327 ) ) ( not ( = ?auto_6326 ?auto_6333 ) ) ( not ( = ?auto_6327 ?auto_6333 ) ) ( not ( = ?auto_6328 ?auto_6332 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6330 ?auto_6329 ?auto_6331 )
      ( !LIFT ?auto_6332 ?auto_6327 ?auto_6333 ?auto_6331 )
      ( !LOAD ?auto_6332 ?auto_6327 ?auto_6330 ?auto_6331 )
      ( !DRIVE ?auto_6330 ?auto_6331 ?auto_6329 )
      ( !UNLOAD ?auto_6328 ?auto_6327 ?auto_6330 ?auto_6329 )
      ( !DROP ?auto_6328 ?auto_6327 ?auto_6326 ?auto_6329 )
      ( MAKE-1CRATE-VERIFY ?auto_6326 ?auto_6327 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6336 - SURFACE
      ?auto_6337 - SURFACE
    )
    :vars
    (
      ?auto_6338 - HOIST
      ?auto_6339 - PLACE
      ?auto_6341 - PLACE
      ?auto_6342 - HOIST
      ?auto_6343 - SURFACE
      ?auto_6340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6338 ?auto_6339 ) ( SURFACE-AT ?auto_6336 ?auto_6339 ) ( CLEAR ?auto_6336 ) ( IS-CRATE ?auto_6337 ) ( AVAILABLE ?auto_6338 ) ( not ( = ?auto_6341 ?auto_6339 ) ) ( HOIST-AT ?auto_6342 ?auto_6341 ) ( AVAILABLE ?auto_6342 ) ( SURFACE-AT ?auto_6337 ?auto_6341 ) ( ON ?auto_6337 ?auto_6343 ) ( CLEAR ?auto_6337 ) ( TRUCK-AT ?auto_6340 ?auto_6339 ) ( not ( = ?auto_6336 ?auto_6337 ) ) ( not ( = ?auto_6336 ?auto_6343 ) ) ( not ( = ?auto_6337 ?auto_6343 ) ) ( not ( = ?auto_6338 ?auto_6342 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6340 ?auto_6339 ?auto_6341 )
      ( !LIFT ?auto_6342 ?auto_6337 ?auto_6343 ?auto_6341 )
      ( !LOAD ?auto_6342 ?auto_6337 ?auto_6340 ?auto_6341 )
      ( !DRIVE ?auto_6340 ?auto_6341 ?auto_6339 )
      ( !UNLOAD ?auto_6338 ?auto_6337 ?auto_6340 ?auto_6339 )
      ( !DROP ?auto_6338 ?auto_6337 ?auto_6336 ?auto_6339 )
      ( MAKE-1CRATE-VERIFY ?auto_6336 ?auto_6337 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_6347 - SURFACE
      ?auto_6348 - SURFACE
      ?auto_6349 - SURFACE
    )
    :vars
    (
      ?auto_6354 - HOIST
      ?auto_6355 - PLACE
      ?auto_6353 - PLACE
      ?auto_6350 - HOIST
      ?auto_6351 - SURFACE
      ?auto_6357 - PLACE
      ?auto_6356 - HOIST
      ?auto_6358 - SURFACE
      ?auto_6352 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6354 ?auto_6355 ) ( IS-CRATE ?auto_6349 ) ( not ( = ?auto_6353 ?auto_6355 ) ) ( HOIST-AT ?auto_6350 ?auto_6353 ) ( AVAILABLE ?auto_6350 ) ( SURFACE-AT ?auto_6349 ?auto_6353 ) ( ON ?auto_6349 ?auto_6351 ) ( CLEAR ?auto_6349 ) ( not ( = ?auto_6348 ?auto_6349 ) ) ( not ( = ?auto_6348 ?auto_6351 ) ) ( not ( = ?auto_6349 ?auto_6351 ) ) ( not ( = ?auto_6354 ?auto_6350 ) ) ( SURFACE-AT ?auto_6347 ?auto_6355 ) ( CLEAR ?auto_6347 ) ( IS-CRATE ?auto_6348 ) ( AVAILABLE ?auto_6354 ) ( not ( = ?auto_6357 ?auto_6355 ) ) ( HOIST-AT ?auto_6356 ?auto_6357 ) ( AVAILABLE ?auto_6356 ) ( SURFACE-AT ?auto_6348 ?auto_6357 ) ( ON ?auto_6348 ?auto_6358 ) ( CLEAR ?auto_6348 ) ( TRUCK-AT ?auto_6352 ?auto_6355 ) ( not ( = ?auto_6347 ?auto_6348 ) ) ( not ( = ?auto_6347 ?auto_6358 ) ) ( not ( = ?auto_6348 ?auto_6358 ) ) ( not ( = ?auto_6354 ?auto_6356 ) ) ( not ( = ?auto_6347 ?auto_6349 ) ) ( not ( = ?auto_6347 ?auto_6351 ) ) ( not ( = ?auto_6349 ?auto_6358 ) ) ( not ( = ?auto_6353 ?auto_6357 ) ) ( not ( = ?auto_6350 ?auto_6356 ) ) ( not ( = ?auto_6351 ?auto_6358 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6347 ?auto_6348 )
      ( MAKE-1CRATE ?auto_6348 ?auto_6349 )
      ( MAKE-2CRATE-VERIFY ?auto_6347 ?auto_6348 ?auto_6349 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6361 - SURFACE
      ?auto_6362 - SURFACE
    )
    :vars
    (
      ?auto_6363 - HOIST
      ?auto_6364 - PLACE
      ?auto_6366 - PLACE
      ?auto_6367 - HOIST
      ?auto_6368 - SURFACE
      ?auto_6365 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6363 ?auto_6364 ) ( SURFACE-AT ?auto_6361 ?auto_6364 ) ( CLEAR ?auto_6361 ) ( IS-CRATE ?auto_6362 ) ( AVAILABLE ?auto_6363 ) ( not ( = ?auto_6366 ?auto_6364 ) ) ( HOIST-AT ?auto_6367 ?auto_6366 ) ( AVAILABLE ?auto_6367 ) ( SURFACE-AT ?auto_6362 ?auto_6366 ) ( ON ?auto_6362 ?auto_6368 ) ( CLEAR ?auto_6362 ) ( TRUCK-AT ?auto_6365 ?auto_6364 ) ( not ( = ?auto_6361 ?auto_6362 ) ) ( not ( = ?auto_6361 ?auto_6368 ) ) ( not ( = ?auto_6362 ?auto_6368 ) ) ( not ( = ?auto_6363 ?auto_6367 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6365 ?auto_6364 ?auto_6366 )
      ( !LIFT ?auto_6367 ?auto_6362 ?auto_6368 ?auto_6366 )
      ( !LOAD ?auto_6367 ?auto_6362 ?auto_6365 ?auto_6366 )
      ( !DRIVE ?auto_6365 ?auto_6366 ?auto_6364 )
      ( !UNLOAD ?auto_6363 ?auto_6362 ?auto_6365 ?auto_6364 )
      ( !DROP ?auto_6363 ?auto_6362 ?auto_6361 ?auto_6364 )
      ( MAKE-1CRATE-VERIFY ?auto_6361 ?auto_6362 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_6373 - SURFACE
      ?auto_6374 - SURFACE
      ?auto_6375 - SURFACE
      ?auto_6376 - SURFACE
    )
    :vars
    (
      ?auto_6382 - HOIST
      ?auto_6378 - PLACE
      ?auto_6377 - PLACE
      ?auto_6381 - HOIST
      ?auto_6380 - SURFACE
      ?auto_6388 - PLACE
      ?auto_6385 - HOIST
      ?auto_6383 - SURFACE
      ?auto_6387 - PLACE
      ?auto_6384 - HOIST
      ?auto_6386 - SURFACE
      ?auto_6379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6382 ?auto_6378 ) ( IS-CRATE ?auto_6376 ) ( not ( = ?auto_6377 ?auto_6378 ) ) ( HOIST-AT ?auto_6381 ?auto_6377 ) ( AVAILABLE ?auto_6381 ) ( SURFACE-AT ?auto_6376 ?auto_6377 ) ( ON ?auto_6376 ?auto_6380 ) ( CLEAR ?auto_6376 ) ( not ( = ?auto_6375 ?auto_6376 ) ) ( not ( = ?auto_6375 ?auto_6380 ) ) ( not ( = ?auto_6376 ?auto_6380 ) ) ( not ( = ?auto_6382 ?auto_6381 ) ) ( IS-CRATE ?auto_6375 ) ( not ( = ?auto_6388 ?auto_6378 ) ) ( HOIST-AT ?auto_6385 ?auto_6388 ) ( AVAILABLE ?auto_6385 ) ( SURFACE-AT ?auto_6375 ?auto_6388 ) ( ON ?auto_6375 ?auto_6383 ) ( CLEAR ?auto_6375 ) ( not ( = ?auto_6374 ?auto_6375 ) ) ( not ( = ?auto_6374 ?auto_6383 ) ) ( not ( = ?auto_6375 ?auto_6383 ) ) ( not ( = ?auto_6382 ?auto_6385 ) ) ( SURFACE-AT ?auto_6373 ?auto_6378 ) ( CLEAR ?auto_6373 ) ( IS-CRATE ?auto_6374 ) ( AVAILABLE ?auto_6382 ) ( not ( = ?auto_6387 ?auto_6378 ) ) ( HOIST-AT ?auto_6384 ?auto_6387 ) ( AVAILABLE ?auto_6384 ) ( SURFACE-AT ?auto_6374 ?auto_6387 ) ( ON ?auto_6374 ?auto_6386 ) ( CLEAR ?auto_6374 ) ( TRUCK-AT ?auto_6379 ?auto_6378 ) ( not ( = ?auto_6373 ?auto_6374 ) ) ( not ( = ?auto_6373 ?auto_6386 ) ) ( not ( = ?auto_6374 ?auto_6386 ) ) ( not ( = ?auto_6382 ?auto_6384 ) ) ( not ( = ?auto_6373 ?auto_6375 ) ) ( not ( = ?auto_6373 ?auto_6383 ) ) ( not ( = ?auto_6375 ?auto_6386 ) ) ( not ( = ?auto_6388 ?auto_6387 ) ) ( not ( = ?auto_6385 ?auto_6384 ) ) ( not ( = ?auto_6383 ?auto_6386 ) ) ( not ( = ?auto_6373 ?auto_6376 ) ) ( not ( = ?auto_6373 ?auto_6380 ) ) ( not ( = ?auto_6374 ?auto_6376 ) ) ( not ( = ?auto_6374 ?auto_6380 ) ) ( not ( = ?auto_6376 ?auto_6383 ) ) ( not ( = ?auto_6376 ?auto_6386 ) ) ( not ( = ?auto_6377 ?auto_6388 ) ) ( not ( = ?auto_6377 ?auto_6387 ) ) ( not ( = ?auto_6381 ?auto_6385 ) ) ( not ( = ?auto_6381 ?auto_6384 ) ) ( not ( = ?auto_6380 ?auto_6383 ) ) ( not ( = ?auto_6380 ?auto_6386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6373 ?auto_6374 ?auto_6375 )
      ( MAKE-1CRATE ?auto_6375 ?auto_6376 )
      ( MAKE-3CRATE-VERIFY ?auto_6373 ?auto_6374 ?auto_6375 ?auto_6376 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6391 - SURFACE
      ?auto_6392 - SURFACE
    )
    :vars
    (
      ?auto_6393 - HOIST
      ?auto_6394 - PLACE
      ?auto_6396 - PLACE
      ?auto_6397 - HOIST
      ?auto_6398 - SURFACE
      ?auto_6395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6393 ?auto_6394 ) ( SURFACE-AT ?auto_6391 ?auto_6394 ) ( CLEAR ?auto_6391 ) ( IS-CRATE ?auto_6392 ) ( AVAILABLE ?auto_6393 ) ( not ( = ?auto_6396 ?auto_6394 ) ) ( HOIST-AT ?auto_6397 ?auto_6396 ) ( AVAILABLE ?auto_6397 ) ( SURFACE-AT ?auto_6392 ?auto_6396 ) ( ON ?auto_6392 ?auto_6398 ) ( CLEAR ?auto_6392 ) ( TRUCK-AT ?auto_6395 ?auto_6394 ) ( not ( = ?auto_6391 ?auto_6392 ) ) ( not ( = ?auto_6391 ?auto_6398 ) ) ( not ( = ?auto_6392 ?auto_6398 ) ) ( not ( = ?auto_6393 ?auto_6397 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6395 ?auto_6394 ?auto_6396 )
      ( !LIFT ?auto_6397 ?auto_6392 ?auto_6398 ?auto_6396 )
      ( !LOAD ?auto_6397 ?auto_6392 ?auto_6395 ?auto_6396 )
      ( !DRIVE ?auto_6395 ?auto_6396 ?auto_6394 )
      ( !UNLOAD ?auto_6393 ?auto_6392 ?auto_6395 ?auto_6394 )
      ( !DROP ?auto_6393 ?auto_6392 ?auto_6391 ?auto_6394 )
      ( MAKE-1CRATE-VERIFY ?auto_6391 ?auto_6392 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_6404 - SURFACE
      ?auto_6405 - SURFACE
      ?auto_6406 - SURFACE
      ?auto_6407 - SURFACE
      ?auto_6408 - SURFACE
    )
    :vars
    (
      ?auto_6413 - HOIST
      ?auto_6414 - PLACE
      ?auto_6412 - PLACE
      ?auto_6411 - HOIST
      ?auto_6409 - SURFACE
      ?auto_6421 - PLACE
      ?auto_6422 - HOIST
      ?auto_6415 - SURFACE
      ?auto_6417 - PLACE
      ?auto_6420 - HOIST
      ?auto_6418 - SURFACE
      ?auto_6423 - PLACE
      ?auto_6419 - HOIST
      ?auto_6416 - SURFACE
      ?auto_6410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6413 ?auto_6414 ) ( IS-CRATE ?auto_6408 ) ( not ( = ?auto_6412 ?auto_6414 ) ) ( HOIST-AT ?auto_6411 ?auto_6412 ) ( AVAILABLE ?auto_6411 ) ( SURFACE-AT ?auto_6408 ?auto_6412 ) ( ON ?auto_6408 ?auto_6409 ) ( CLEAR ?auto_6408 ) ( not ( = ?auto_6407 ?auto_6408 ) ) ( not ( = ?auto_6407 ?auto_6409 ) ) ( not ( = ?auto_6408 ?auto_6409 ) ) ( not ( = ?auto_6413 ?auto_6411 ) ) ( IS-CRATE ?auto_6407 ) ( not ( = ?auto_6421 ?auto_6414 ) ) ( HOIST-AT ?auto_6422 ?auto_6421 ) ( AVAILABLE ?auto_6422 ) ( SURFACE-AT ?auto_6407 ?auto_6421 ) ( ON ?auto_6407 ?auto_6415 ) ( CLEAR ?auto_6407 ) ( not ( = ?auto_6406 ?auto_6407 ) ) ( not ( = ?auto_6406 ?auto_6415 ) ) ( not ( = ?auto_6407 ?auto_6415 ) ) ( not ( = ?auto_6413 ?auto_6422 ) ) ( IS-CRATE ?auto_6406 ) ( not ( = ?auto_6417 ?auto_6414 ) ) ( HOIST-AT ?auto_6420 ?auto_6417 ) ( AVAILABLE ?auto_6420 ) ( SURFACE-AT ?auto_6406 ?auto_6417 ) ( ON ?auto_6406 ?auto_6418 ) ( CLEAR ?auto_6406 ) ( not ( = ?auto_6405 ?auto_6406 ) ) ( not ( = ?auto_6405 ?auto_6418 ) ) ( not ( = ?auto_6406 ?auto_6418 ) ) ( not ( = ?auto_6413 ?auto_6420 ) ) ( SURFACE-AT ?auto_6404 ?auto_6414 ) ( CLEAR ?auto_6404 ) ( IS-CRATE ?auto_6405 ) ( AVAILABLE ?auto_6413 ) ( not ( = ?auto_6423 ?auto_6414 ) ) ( HOIST-AT ?auto_6419 ?auto_6423 ) ( AVAILABLE ?auto_6419 ) ( SURFACE-AT ?auto_6405 ?auto_6423 ) ( ON ?auto_6405 ?auto_6416 ) ( CLEAR ?auto_6405 ) ( TRUCK-AT ?auto_6410 ?auto_6414 ) ( not ( = ?auto_6404 ?auto_6405 ) ) ( not ( = ?auto_6404 ?auto_6416 ) ) ( not ( = ?auto_6405 ?auto_6416 ) ) ( not ( = ?auto_6413 ?auto_6419 ) ) ( not ( = ?auto_6404 ?auto_6406 ) ) ( not ( = ?auto_6404 ?auto_6418 ) ) ( not ( = ?auto_6406 ?auto_6416 ) ) ( not ( = ?auto_6417 ?auto_6423 ) ) ( not ( = ?auto_6420 ?auto_6419 ) ) ( not ( = ?auto_6418 ?auto_6416 ) ) ( not ( = ?auto_6404 ?auto_6407 ) ) ( not ( = ?auto_6404 ?auto_6415 ) ) ( not ( = ?auto_6405 ?auto_6407 ) ) ( not ( = ?auto_6405 ?auto_6415 ) ) ( not ( = ?auto_6407 ?auto_6418 ) ) ( not ( = ?auto_6407 ?auto_6416 ) ) ( not ( = ?auto_6421 ?auto_6417 ) ) ( not ( = ?auto_6421 ?auto_6423 ) ) ( not ( = ?auto_6422 ?auto_6420 ) ) ( not ( = ?auto_6422 ?auto_6419 ) ) ( not ( = ?auto_6415 ?auto_6418 ) ) ( not ( = ?auto_6415 ?auto_6416 ) ) ( not ( = ?auto_6404 ?auto_6408 ) ) ( not ( = ?auto_6404 ?auto_6409 ) ) ( not ( = ?auto_6405 ?auto_6408 ) ) ( not ( = ?auto_6405 ?auto_6409 ) ) ( not ( = ?auto_6406 ?auto_6408 ) ) ( not ( = ?auto_6406 ?auto_6409 ) ) ( not ( = ?auto_6408 ?auto_6415 ) ) ( not ( = ?auto_6408 ?auto_6418 ) ) ( not ( = ?auto_6408 ?auto_6416 ) ) ( not ( = ?auto_6412 ?auto_6421 ) ) ( not ( = ?auto_6412 ?auto_6417 ) ) ( not ( = ?auto_6412 ?auto_6423 ) ) ( not ( = ?auto_6411 ?auto_6422 ) ) ( not ( = ?auto_6411 ?auto_6420 ) ) ( not ( = ?auto_6411 ?auto_6419 ) ) ( not ( = ?auto_6409 ?auto_6415 ) ) ( not ( = ?auto_6409 ?auto_6418 ) ) ( not ( = ?auto_6409 ?auto_6416 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_6404 ?auto_6405 ?auto_6406 ?auto_6407 )
      ( MAKE-1CRATE ?auto_6407 ?auto_6408 )
      ( MAKE-4CRATE-VERIFY ?auto_6404 ?auto_6405 ?auto_6406 ?auto_6407 ?auto_6408 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6426 - SURFACE
      ?auto_6427 - SURFACE
    )
    :vars
    (
      ?auto_6428 - HOIST
      ?auto_6429 - PLACE
      ?auto_6431 - PLACE
      ?auto_6432 - HOIST
      ?auto_6433 - SURFACE
      ?auto_6430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6428 ?auto_6429 ) ( SURFACE-AT ?auto_6426 ?auto_6429 ) ( CLEAR ?auto_6426 ) ( IS-CRATE ?auto_6427 ) ( AVAILABLE ?auto_6428 ) ( not ( = ?auto_6431 ?auto_6429 ) ) ( HOIST-AT ?auto_6432 ?auto_6431 ) ( AVAILABLE ?auto_6432 ) ( SURFACE-AT ?auto_6427 ?auto_6431 ) ( ON ?auto_6427 ?auto_6433 ) ( CLEAR ?auto_6427 ) ( TRUCK-AT ?auto_6430 ?auto_6429 ) ( not ( = ?auto_6426 ?auto_6427 ) ) ( not ( = ?auto_6426 ?auto_6433 ) ) ( not ( = ?auto_6427 ?auto_6433 ) ) ( not ( = ?auto_6428 ?auto_6432 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6430 ?auto_6429 ?auto_6431 )
      ( !LIFT ?auto_6432 ?auto_6427 ?auto_6433 ?auto_6431 )
      ( !LOAD ?auto_6432 ?auto_6427 ?auto_6430 ?auto_6431 )
      ( !DRIVE ?auto_6430 ?auto_6431 ?auto_6429 )
      ( !UNLOAD ?auto_6428 ?auto_6427 ?auto_6430 ?auto_6429 )
      ( !DROP ?auto_6428 ?auto_6427 ?auto_6426 ?auto_6429 )
      ( MAKE-1CRATE-VERIFY ?auto_6426 ?auto_6427 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_6440 - SURFACE
      ?auto_6441 - SURFACE
      ?auto_6442 - SURFACE
      ?auto_6443 - SURFACE
      ?auto_6444 - SURFACE
      ?auto_6445 - SURFACE
    )
    :vars
    (
      ?auto_6447 - HOIST
      ?auto_6449 - PLACE
      ?auto_6448 - PLACE
      ?auto_6451 - HOIST
      ?auto_6446 - SURFACE
      ?auto_6452 - SURFACE
      ?auto_6458 - PLACE
      ?auto_6459 - HOIST
      ?auto_6453 - SURFACE
      ?auto_6454 - PLACE
      ?auto_6461 - HOIST
      ?auto_6456 - SURFACE
      ?auto_6457 - PLACE
      ?auto_6460 - HOIST
      ?auto_6455 - SURFACE
      ?auto_6450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6447 ?auto_6449 ) ( IS-CRATE ?auto_6445 ) ( not ( = ?auto_6448 ?auto_6449 ) ) ( HOIST-AT ?auto_6451 ?auto_6448 ) ( SURFACE-AT ?auto_6445 ?auto_6448 ) ( ON ?auto_6445 ?auto_6446 ) ( CLEAR ?auto_6445 ) ( not ( = ?auto_6444 ?auto_6445 ) ) ( not ( = ?auto_6444 ?auto_6446 ) ) ( not ( = ?auto_6445 ?auto_6446 ) ) ( not ( = ?auto_6447 ?auto_6451 ) ) ( IS-CRATE ?auto_6444 ) ( AVAILABLE ?auto_6451 ) ( SURFACE-AT ?auto_6444 ?auto_6448 ) ( ON ?auto_6444 ?auto_6452 ) ( CLEAR ?auto_6444 ) ( not ( = ?auto_6443 ?auto_6444 ) ) ( not ( = ?auto_6443 ?auto_6452 ) ) ( not ( = ?auto_6444 ?auto_6452 ) ) ( IS-CRATE ?auto_6443 ) ( not ( = ?auto_6458 ?auto_6449 ) ) ( HOIST-AT ?auto_6459 ?auto_6458 ) ( AVAILABLE ?auto_6459 ) ( SURFACE-AT ?auto_6443 ?auto_6458 ) ( ON ?auto_6443 ?auto_6453 ) ( CLEAR ?auto_6443 ) ( not ( = ?auto_6442 ?auto_6443 ) ) ( not ( = ?auto_6442 ?auto_6453 ) ) ( not ( = ?auto_6443 ?auto_6453 ) ) ( not ( = ?auto_6447 ?auto_6459 ) ) ( IS-CRATE ?auto_6442 ) ( not ( = ?auto_6454 ?auto_6449 ) ) ( HOIST-AT ?auto_6461 ?auto_6454 ) ( AVAILABLE ?auto_6461 ) ( SURFACE-AT ?auto_6442 ?auto_6454 ) ( ON ?auto_6442 ?auto_6456 ) ( CLEAR ?auto_6442 ) ( not ( = ?auto_6441 ?auto_6442 ) ) ( not ( = ?auto_6441 ?auto_6456 ) ) ( not ( = ?auto_6442 ?auto_6456 ) ) ( not ( = ?auto_6447 ?auto_6461 ) ) ( SURFACE-AT ?auto_6440 ?auto_6449 ) ( CLEAR ?auto_6440 ) ( IS-CRATE ?auto_6441 ) ( AVAILABLE ?auto_6447 ) ( not ( = ?auto_6457 ?auto_6449 ) ) ( HOIST-AT ?auto_6460 ?auto_6457 ) ( AVAILABLE ?auto_6460 ) ( SURFACE-AT ?auto_6441 ?auto_6457 ) ( ON ?auto_6441 ?auto_6455 ) ( CLEAR ?auto_6441 ) ( TRUCK-AT ?auto_6450 ?auto_6449 ) ( not ( = ?auto_6440 ?auto_6441 ) ) ( not ( = ?auto_6440 ?auto_6455 ) ) ( not ( = ?auto_6441 ?auto_6455 ) ) ( not ( = ?auto_6447 ?auto_6460 ) ) ( not ( = ?auto_6440 ?auto_6442 ) ) ( not ( = ?auto_6440 ?auto_6456 ) ) ( not ( = ?auto_6442 ?auto_6455 ) ) ( not ( = ?auto_6454 ?auto_6457 ) ) ( not ( = ?auto_6461 ?auto_6460 ) ) ( not ( = ?auto_6456 ?auto_6455 ) ) ( not ( = ?auto_6440 ?auto_6443 ) ) ( not ( = ?auto_6440 ?auto_6453 ) ) ( not ( = ?auto_6441 ?auto_6443 ) ) ( not ( = ?auto_6441 ?auto_6453 ) ) ( not ( = ?auto_6443 ?auto_6456 ) ) ( not ( = ?auto_6443 ?auto_6455 ) ) ( not ( = ?auto_6458 ?auto_6454 ) ) ( not ( = ?auto_6458 ?auto_6457 ) ) ( not ( = ?auto_6459 ?auto_6461 ) ) ( not ( = ?auto_6459 ?auto_6460 ) ) ( not ( = ?auto_6453 ?auto_6456 ) ) ( not ( = ?auto_6453 ?auto_6455 ) ) ( not ( = ?auto_6440 ?auto_6444 ) ) ( not ( = ?auto_6440 ?auto_6452 ) ) ( not ( = ?auto_6441 ?auto_6444 ) ) ( not ( = ?auto_6441 ?auto_6452 ) ) ( not ( = ?auto_6442 ?auto_6444 ) ) ( not ( = ?auto_6442 ?auto_6452 ) ) ( not ( = ?auto_6444 ?auto_6453 ) ) ( not ( = ?auto_6444 ?auto_6456 ) ) ( not ( = ?auto_6444 ?auto_6455 ) ) ( not ( = ?auto_6448 ?auto_6458 ) ) ( not ( = ?auto_6448 ?auto_6454 ) ) ( not ( = ?auto_6448 ?auto_6457 ) ) ( not ( = ?auto_6451 ?auto_6459 ) ) ( not ( = ?auto_6451 ?auto_6461 ) ) ( not ( = ?auto_6451 ?auto_6460 ) ) ( not ( = ?auto_6452 ?auto_6453 ) ) ( not ( = ?auto_6452 ?auto_6456 ) ) ( not ( = ?auto_6452 ?auto_6455 ) ) ( not ( = ?auto_6440 ?auto_6445 ) ) ( not ( = ?auto_6440 ?auto_6446 ) ) ( not ( = ?auto_6441 ?auto_6445 ) ) ( not ( = ?auto_6441 ?auto_6446 ) ) ( not ( = ?auto_6442 ?auto_6445 ) ) ( not ( = ?auto_6442 ?auto_6446 ) ) ( not ( = ?auto_6443 ?auto_6445 ) ) ( not ( = ?auto_6443 ?auto_6446 ) ) ( not ( = ?auto_6445 ?auto_6452 ) ) ( not ( = ?auto_6445 ?auto_6453 ) ) ( not ( = ?auto_6445 ?auto_6456 ) ) ( not ( = ?auto_6445 ?auto_6455 ) ) ( not ( = ?auto_6446 ?auto_6452 ) ) ( not ( = ?auto_6446 ?auto_6453 ) ) ( not ( = ?auto_6446 ?auto_6456 ) ) ( not ( = ?auto_6446 ?auto_6455 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_6440 ?auto_6441 ?auto_6442 ?auto_6443 ?auto_6444 )
      ( MAKE-1CRATE ?auto_6444 ?auto_6445 )
      ( MAKE-5CRATE-VERIFY ?auto_6440 ?auto_6441 ?auto_6442 ?auto_6443 ?auto_6444 ?auto_6445 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6464 - SURFACE
      ?auto_6465 - SURFACE
    )
    :vars
    (
      ?auto_6466 - HOIST
      ?auto_6467 - PLACE
      ?auto_6469 - PLACE
      ?auto_6470 - HOIST
      ?auto_6471 - SURFACE
      ?auto_6468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6466 ?auto_6467 ) ( SURFACE-AT ?auto_6464 ?auto_6467 ) ( CLEAR ?auto_6464 ) ( IS-CRATE ?auto_6465 ) ( AVAILABLE ?auto_6466 ) ( not ( = ?auto_6469 ?auto_6467 ) ) ( HOIST-AT ?auto_6470 ?auto_6469 ) ( AVAILABLE ?auto_6470 ) ( SURFACE-AT ?auto_6465 ?auto_6469 ) ( ON ?auto_6465 ?auto_6471 ) ( CLEAR ?auto_6465 ) ( TRUCK-AT ?auto_6468 ?auto_6467 ) ( not ( = ?auto_6464 ?auto_6465 ) ) ( not ( = ?auto_6464 ?auto_6471 ) ) ( not ( = ?auto_6465 ?auto_6471 ) ) ( not ( = ?auto_6466 ?auto_6470 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6468 ?auto_6467 ?auto_6469 )
      ( !LIFT ?auto_6470 ?auto_6465 ?auto_6471 ?auto_6469 )
      ( !LOAD ?auto_6470 ?auto_6465 ?auto_6468 ?auto_6469 )
      ( !DRIVE ?auto_6468 ?auto_6469 ?auto_6467 )
      ( !UNLOAD ?auto_6466 ?auto_6465 ?auto_6468 ?auto_6467 )
      ( !DROP ?auto_6466 ?auto_6465 ?auto_6464 ?auto_6467 )
      ( MAKE-1CRATE-VERIFY ?auto_6464 ?auto_6465 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_6479 - SURFACE
      ?auto_6480 - SURFACE
      ?auto_6481 - SURFACE
      ?auto_6482 - SURFACE
      ?auto_6483 - SURFACE
      ?auto_6484 - SURFACE
      ?auto_6485 - SURFACE
    )
    :vars
    (
      ?auto_6490 - HOIST
      ?auto_6489 - PLACE
      ?auto_6491 - PLACE
      ?auto_6486 - HOIST
      ?auto_6487 - SURFACE
      ?auto_6493 - PLACE
      ?auto_6494 - HOIST
      ?auto_6495 - SURFACE
      ?auto_6496 - SURFACE
      ?auto_6501 - PLACE
      ?auto_6498 - HOIST
      ?auto_6500 - SURFACE
      ?auto_6497 - PLACE
      ?auto_6502 - HOIST
      ?auto_6492 - SURFACE
      ?auto_6499 - SURFACE
      ?auto_6488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6490 ?auto_6489 ) ( IS-CRATE ?auto_6485 ) ( not ( = ?auto_6491 ?auto_6489 ) ) ( HOIST-AT ?auto_6486 ?auto_6491 ) ( SURFACE-AT ?auto_6485 ?auto_6491 ) ( ON ?auto_6485 ?auto_6487 ) ( CLEAR ?auto_6485 ) ( not ( = ?auto_6484 ?auto_6485 ) ) ( not ( = ?auto_6484 ?auto_6487 ) ) ( not ( = ?auto_6485 ?auto_6487 ) ) ( not ( = ?auto_6490 ?auto_6486 ) ) ( IS-CRATE ?auto_6484 ) ( not ( = ?auto_6493 ?auto_6489 ) ) ( HOIST-AT ?auto_6494 ?auto_6493 ) ( SURFACE-AT ?auto_6484 ?auto_6493 ) ( ON ?auto_6484 ?auto_6495 ) ( CLEAR ?auto_6484 ) ( not ( = ?auto_6483 ?auto_6484 ) ) ( not ( = ?auto_6483 ?auto_6495 ) ) ( not ( = ?auto_6484 ?auto_6495 ) ) ( not ( = ?auto_6490 ?auto_6494 ) ) ( IS-CRATE ?auto_6483 ) ( AVAILABLE ?auto_6494 ) ( SURFACE-AT ?auto_6483 ?auto_6493 ) ( ON ?auto_6483 ?auto_6496 ) ( CLEAR ?auto_6483 ) ( not ( = ?auto_6482 ?auto_6483 ) ) ( not ( = ?auto_6482 ?auto_6496 ) ) ( not ( = ?auto_6483 ?auto_6496 ) ) ( IS-CRATE ?auto_6482 ) ( not ( = ?auto_6501 ?auto_6489 ) ) ( HOIST-AT ?auto_6498 ?auto_6501 ) ( AVAILABLE ?auto_6498 ) ( SURFACE-AT ?auto_6482 ?auto_6501 ) ( ON ?auto_6482 ?auto_6500 ) ( CLEAR ?auto_6482 ) ( not ( = ?auto_6481 ?auto_6482 ) ) ( not ( = ?auto_6481 ?auto_6500 ) ) ( not ( = ?auto_6482 ?auto_6500 ) ) ( not ( = ?auto_6490 ?auto_6498 ) ) ( IS-CRATE ?auto_6481 ) ( not ( = ?auto_6497 ?auto_6489 ) ) ( HOIST-AT ?auto_6502 ?auto_6497 ) ( AVAILABLE ?auto_6502 ) ( SURFACE-AT ?auto_6481 ?auto_6497 ) ( ON ?auto_6481 ?auto_6492 ) ( CLEAR ?auto_6481 ) ( not ( = ?auto_6480 ?auto_6481 ) ) ( not ( = ?auto_6480 ?auto_6492 ) ) ( not ( = ?auto_6481 ?auto_6492 ) ) ( not ( = ?auto_6490 ?auto_6502 ) ) ( SURFACE-AT ?auto_6479 ?auto_6489 ) ( CLEAR ?auto_6479 ) ( IS-CRATE ?auto_6480 ) ( AVAILABLE ?auto_6490 ) ( AVAILABLE ?auto_6486 ) ( SURFACE-AT ?auto_6480 ?auto_6491 ) ( ON ?auto_6480 ?auto_6499 ) ( CLEAR ?auto_6480 ) ( TRUCK-AT ?auto_6488 ?auto_6489 ) ( not ( = ?auto_6479 ?auto_6480 ) ) ( not ( = ?auto_6479 ?auto_6499 ) ) ( not ( = ?auto_6480 ?auto_6499 ) ) ( not ( = ?auto_6479 ?auto_6481 ) ) ( not ( = ?auto_6479 ?auto_6492 ) ) ( not ( = ?auto_6481 ?auto_6499 ) ) ( not ( = ?auto_6497 ?auto_6491 ) ) ( not ( = ?auto_6502 ?auto_6486 ) ) ( not ( = ?auto_6492 ?auto_6499 ) ) ( not ( = ?auto_6479 ?auto_6482 ) ) ( not ( = ?auto_6479 ?auto_6500 ) ) ( not ( = ?auto_6480 ?auto_6482 ) ) ( not ( = ?auto_6480 ?auto_6500 ) ) ( not ( = ?auto_6482 ?auto_6492 ) ) ( not ( = ?auto_6482 ?auto_6499 ) ) ( not ( = ?auto_6501 ?auto_6497 ) ) ( not ( = ?auto_6501 ?auto_6491 ) ) ( not ( = ?auto_6498 ?auto_6502 ) ) ( not ( = ?auto_6498 ?auto_6486 ) ) ( not ( = ?auto_6500 ?auto_6492 ) ) ( not ( = ?auto_6500 ?auto_6499 ) ) ( not ( = ?auto_6479 ?auto_6483 ) ) ( not ( = ?auto_6479 ?auto_6496 ) ) ( not ( = ?auto_6480 ?auto_6483 ) ) ( not ( = ?auto_6480 ?auto_6496 ) ) ( not ( = ?auto_6481 ?auto_6483 ) ) ( not ( = ?auto_6481 ?auto_6496 ) ) ( not ( = ?auto_6483 ?auto_6500 ) ) ( not ( = ?auto_6483 ?auto_6492 ) ) ( not ( = ?auto_6483 ?auto_6499 ) ) ( not ( = ?auto_6493 ?auto_6501 ) ) ( not ( = ?auto_6493 ?auto_6497 ) ) ( not ( = ?auto_6493 ?auto_6491 ) ) ( not ( = ?auto_6494 ?auto_6498 ) ) ( not ( = ?auto_6494 ?auto_6502 ) ) ( not ( = ?auto_6494 ?auto_6486 ) ) ( not ( = ?auto_6496 ?auto_6500 ) ) ( not ( = ?auto_6496 ?auto_6492 ) ) ( not ( = ?auto_6496 ?auto_6499 ) ) ( not ( = ?auto_6479 ?auto_6484 ) ) ( not ( = ?auto_6479 ?auto_6495 ) ) ( not ( = ?auto_6480 ?auto_6484 ) ) ( not ( = ?auto_6480 ?auto_6495 ) ) ( not ( = ?auto_6481 ?auto_6484 ) ) ( not ( = ?auto_6481 ?auto_6495 ) ) ( not ( = ?auto_6482 ?auto_6484 ) ) ( not ( = ?auto_6482 ?auto_6495 ) ) ( not ( = ?auto_6484 ?auto_6496 ) ) ( not ( = ?auto_6484 ?auto_6500 ) ) ( not ( = ?auto_6484 ?auto_6492 ) ) ( not ( = ?auto_6484 ?auto_6499 ) ) ( not ( = ?auto_6495 ?auto_6496 ) ) ( not ( = ?auto_6495 ?auto_6500 ) ) ( not ( = ?auto_6495 ?auto_6492 ) ) ( not ( = ?auto_6495 ?auto_6499 ) ) ( not ( = ?auto_6479 ?auto_6485 ) ) ( not ( = ?auto_6479 ?auto_6487 ) ) ( not ( = ?auto_6480 ?auto_6485 ) ) ( not ( = ?auto_6480 ?auto_6487 ) ) ( not ( = ?auto_6481 ?auto_6485 ) ) ( not ( = ?auto_6481 ?auto_6487 ) ) ( not ( = ?auto_6482 ?auto_6485 ) ) ( not ( = ?auto_6482 ?auto_6487 ) ) ( not ( = ?auto_6483 ?auto_6485 ) ) ( not ( = ?auto_6483 ?auto_6487 ) ) ( not ( = ?auto_6485 ?auto_6495 ) ) ( not ( = ?auto_6485 ?auto_6496 ) ) ( not ( = ?auto_6485 ?auto_6500 ) ) ( not ( = ?auto_6485 ?auto_6492 ) ) ( not ( = ?auto_6485 ?auto_6499 ) ) ( not ( = ?auto_6487 ?auto_6495 ) ) ( not ( = ?auto_6487 ?auto_6496 ) ) ( not ( = ?auto_6487 ?auto_6500 ) ) ( not ( = ?auto_6487 ?auto_6492 ) ) ( not ( = ?auto_6487 ?auto_6499 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_6479 ?auto_6480 ?auto_6481 ?auto_6482 ?auto_6483 ?auto_6484 )
      ( MAKE-1CRATE ?auto_6484 ?auto_6485 )
      ( MAKE-6CRATE-VERIFY ?auto_6479 ?auto_6480 ?auto_6481 ?auto_6482 ?auto_6483 ?auto_6484 ?auto_6485 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6505 - SURFACE
      ?auto_6506 - SURFACE
    )
    :vars
    (
      ?auto_6507 - HOIST
      ?auto_6508 - PLACE
      ?auto_6510 - PLACE
      ?auto_6511 - HOIST
      ?auto_6512 - SURFACE
      ?auto_6509 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6507 ?auto_6508 ) ( SURFACE-AT ?auto_6505 ?auto_6508 ) ( CLEAR ?auto_6505 ) ( IS-CRATE ?auto_6506 ) ( AVAILABLE ?auto_6507 ) ( not ( = ?auto_6510 ?auto_6508 ) ) ( HOIST-AT ?auto_6511 ?auto_6510 ) ( AVAILABLE ?auto_6511 ) ( SURFACE-AT ?auto_6506 ?auto_6510 ) ( ON ?auto_6506 ?auto_6512 ) ( CLEAR ?auto_6506 ) ( TRUCK-AT ?auto_6509 ?auto_6508 ) ( not ( = ?auto_6505 ?auto_6506 ) ) ( not ( = ?auto_6505 ?auto_6512 ) ) ( not ( = ?auto_6506 ?auto_6512 ) ) ( not ( = ?auto_6507 ?auto_6511 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6509 ?auto_6508 ?auto_6510 )
      ( !LIFT ?auto_6511 ?auto_6506 ?auto_6512 ?auto_6510 )
      ( !LOAD ?auto_6511 ?auto_6506 ?auto_6509 ?auto_6510 )
      ( !DRIVE ?auto_6509 ?auto_6510 ?auto_6508 )
      ( !UNLOAD ?auto_6507 ?auto_6506 ?auto_6509 ?auto_6508 )
      ( !DROP ?auto_6507 ?auto_6506 ?auto_6505 ?auto_6508 )
      ( MAKE-1CRATE-VERIFY ?auto_6505 ?auto_6506 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_6521 - SURFACE
      ?auto_6522 - SURFACE
      ?auto_6523 - SURFACE
      ?auto_6524 - SURFACE
      ?auto_6525 - SURFACE
      ?auto_6526 - SURFACE
      ?auto_6528 - SURFACE
      ?auto_6527 - SURFACE
    )
    :vars
    (
      ?auto_6530 - HOIST
      ?auto_6531 - PLACE
      ?auto_6534 - PLACE
      ?auto_6533 - HOIST
      ?auto_6532 - SURFACE
      ?auto_6542 - SURFACE
      ?auto_6543 - PLACE
      ?auto_6545 - HOIST
      ?auto_6544 - SURFACE
      ?auto_6541 - SURFACE
      ?auto_6538 - PLACE
      ?auto_6539 - HOIST
      ?auto_6537 - SURFACE
      ?auto_6535 - PLACE
      ?auto_6536 - HOIST
      ?auto_6546 - SURFACE
      ?auto_6540 - SURFACE
      ?auto_6529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6530 ?auto_6531 ) ( IS-CRATE ?auto_6527 ) ( not ( = ?auto_6534 ?auto_6531 ) ) ( HOIST-AT ?auto_6533 ?auto_6534 ) ( SURFACE-AT ?auto_6527 ?auto_6534 ) ( ON ?auto_6527 ?auto_6532 ) ( CLEAR ?auto_6527 ) ( not ( = ?auto_6528 ?auto_6527 ) ) ( not ( = ?auto_6528 ?auto_6532 ) ) ( not ( = ?auto_6527 ?auto_6532 ) ) ( not ( = ?auto_6530 ?auto_6533 ) ) ( IS-CRATE ?auto_6528 ) ( SURFACE-AT ?auto_6528 ?auto_6534 ) ( ON ?auto_6528 ?auto_6542 ) ( CLEAR ?auto_6528 ) ( not ( = ?auto_6526 ?auto_6528 ) ) ( not ( = ?auto_6526 ?auto_6542 ) ) ( not ( = ?auto_6528 ?auto_6542 ) ) ( IS-CRATE ?auto_6526 ) ( not ( = ?auto_6543 ?auto_6531 ) ) ( HOIST-AT ?auto_6545 ?auto_6543 ) ( SURFACE-AT ?auto_6526 ?auto_6543 ) ( ON ?auto_6526 ?auto_6544 ) ( CLEAR ?auto_6526 ) ( not ( = ?auto_6525 ?auto_6526 ) ) ( not ( = ?auto_6525 ?auto_6544 ) ) ( not ( = ?auto_6526 ?auto_6544 ) ) ( not ( = ?auto_6530 ?auto_6545 ) ) ( IS-CRATE ?auto_6525 ) ( AVAILABLE ?auto_6545 ) ( SURFACE-AT ?auto_6525 ?auto_6543 ) ( ON ?auto_6525 ?auto_6541 ) ( CLEAR ?auto_6525 ) ( not ( = ?auto_6524 ?auto_6525 ) ) ( not ( = ?auto_6524 ?auto_6541 ) ) ( not ( = ?auto_6525 ?auto_6541 ) ) ( IS-CRATE ?auto_6524 ) ( not ( = ?auto_6538 ?auto_6531 ) ) ( HOIST-AT ?auto_6539 ?auto_6538 ) ( AVAILABLE ?auto_6539 ) ( SURFACE-AT ?auto_6524 ?auto_6538 ) ( ON ?auto_6524 ?auto_6537 ) ( CLEAR ?auto_6524 ) ( not ( = ?auto_6523 ?auto_6524 ) ) ( not ( = ?auto_6523 ?auto_6537 ) ) ( not ( = ?auto_6524 ?auto_6537 ) ) ( not ( = ?auto_6530 ?auto_6539 ) ) ( IS-CRATE ?auto_6523 ) ( not ( = ?auto_6535 ?auto_6531 ) ) ( HOIST-AT ?auto_6536 ?auto_6535 ) ( AVAILABLE ?auto_6536 ) ( SURFACE-AT ?auto_6523 ?auto_6535 ) ( ON ?auto_6523 ?auto_6546 ) ( CLEAR ?auto_6523 ) ( not ( = ?auto_6522 ?auto_6523 ) ) ( not ( = ?auto_6522 ?auto_6546 ) ) ( not ( = ?auto_6523 ?auto_6546 ) ) ( not ( = ?auto_6530 ?auto_6536 ) ) ( SURFACE-AT ?auto_6521 ?auto_6531 ) ( CLEAR ?auto_6521 ) ( IS-CRATE ?auto_6522 ) ( AVAILABLE ?auto_6530 ) ( AVAILABLE ?auto_6533 ) ( SURFACE-AT ?auto_6522 ?auto_6534 ) ( ON ?auto_6522 ?auto_6540 ) ( CLEAR ?auto_6522 ) ( TRUCK-AT ?auto_6529 ?auto_6531 ) ( not ( = ?auto_6521 ?auto_6522 ) ) ( not ( = ?auto_6521 ?auto_6540 ) ) ( not ( = ?auto_6522 ?auto_6540 ) ) ( not ( = ?auto_6521 ?auto_6523 ) ) ( not ( = ?auto_6521 ?auto_6546 ) ) ( not ( = ?auto_6523 ?auto_6540 ) ) ( not ( = ?auto_6535 ?auto_6534 ) ) ( not ( = ?auto_6536 ?auto_6533 ) ) ( not ( = ?auto_6546 ?auto_6540 ) ) ( not ( = ?auto_6521 ?auto_6524 ) ) ( not ( = ?auto_6521 ?auto_6537 ) ) ( not ( = ?auto_6522 ?auto_6524 ) ) ( not ( = ?auto_6522 ?auto_6537 ) ) ( not ( = ?auto_6524 ?auto_6546 ) ) ( not ( = ?auto_6524 ?auto_6540 ) ) ( not ( = ?auto_6538 ?auto_6535 ) ) ( not ( = ?auto_6538 ?auto_6534 ) ) ( not ( = ?auto_6539 ?auto_6536 ) ) ( not ( = ?auto_6539 ?auto_6533 ) ) ( not ( = ?auto_6537 ?auto_6546 ) ) ( not ( = ?auto_6537 ?auto_6540 ) ) ( not ( = ?auto_6521 ?auto_6525 ) ) ( not ( = ?auto_6521 ?auto_6541 ) ) ( not ( = ?auto_6522 ?auto_6525 ) ) ( not ( = ?auto_6522 ?auto_6541 ) ) ( not ( = ?auto_6523 ?auto_6525 ) ) ( not ( = ?auto_6523 ?auto_6541 ) ) ( not ( = ?auto_6525 ?auto_6537 ) ) ( not ( = ?auto_6525 ?auto_6546 ) ) ( not ( = ?auto_6525 ?auto_6540 ) ) ( not ( = ?auto_6543 ?auto_6538 ) ) ( not ( = ?auto_6543 ?auto_6535 ) ) ( not ( = ?auto_6543 ?auto_6534 ) ) ( not ( = ?auto_6545 ?auto_6539 ) ) ( not ( = ?auto_6545 ?auto_6536 ) ) ( not ( = ?auto_6545 ?auto_6533 ) ) ( not ( = ?auto_6541 ?auto_6537 ) ) ( not ( = ?auto_6541 ?auto_6546 ) ) ( not ( = ?auto_6541 ?auto_6540 ) ) ( not ( = ?auto_6521 ?auto_6526 ) ) ( not ( = ?auto_6521 ?auto_6544 ) ) ( not ( = ?auto_6522 ?auto_6526 ) ) ( not ( = ?auto_6522 ?auto_6544 ) ) ( not ( = ?auto_6523 ?auto_6526 ) ) ( not ( = ?auto_6523 ?auto_6544 ) ) ( not ( = ?auto_6524 ?auto_6526 ) ) ( not ( = ?auto_6524 ?auto_6544 ) ) ( not ( = ?auto_6526 ?auto_6541 ) ) ( not ( = ?auto_6526 ?auto_6537 ) ) ( not ( = ?auto_6526 ?auto_6546 ) ) ( not ( = ?auto_6526 ?auto_6540 ) ) ( not ( = ?auto_6544 ?auto_6541 ) ) ( not ( = ?auto_6544 ?auto_6537 ) ) ( not ( = ?auto_6544 ?auto_6546 ) ) ( not ( = ?auto_6544 ?auto_6540 ) ) ( not ( = ?auto_6521 ?auto_6528 ) ) ( not ( = ?auto_6521 ?auto_6542 ) ) ( not ( = ?auto_6522 ?auto_6528 ) ) ( not ( = ?auto_6522 ?auto_6542 ) ) ( not ( = ?auto_6523 ?auto_6528 ) ) ( not ( = ?auto_6523 ?auto_6542 ) ) ( not ( = ?auto_6524 ?auto_6528 ) ) ( not ( = ?auto_6524 ?auto_6542 ) ) ( not ( = ?auto_6525 ?auto_6528 ) ) ( not ( = ?auto_6525 ?auto_6542 ) ) ( not ( = ?auto_6528 ?auto_6544 ) ) ( not ( = ?auto_6528 ?auto_6541 ) ) ( not ( = ?auto_6528 ?auto_6537 ) ) ( not ( = ?auto_6528 ?auto_6546 ) ) ( not ( = ?auto_6528 ?auto_6540 ) ) ( not ( = ?auto_6542 ?auto_6544 ) ) ( not ( = ?auto_6542 ?auto_6541 ) ) ( not ( = ?auto_6542 ?auto_6537 ) ) ( not ( = ?auto_6542 ?auto_6546 ) ) ( not ( = ?auto_6542 ?auto_6540 ) ) ( not ( = ?auto_6521 ?auto_6527 ) ) ( not ( = ?auto_6521 ?auto_6532 ) ) ( not ( = ?auto_6522 ?auto_6527 ) ) ( not ( = ?auto_6522 ?auto_6532 ) ) ( not ( = ?auto_6523 ?auto_6527 ) ) ( not ( = ?auto_6523 ?auto_6532 ) ) ( not ( = ?auto_6524 ?auto_6527 ) ) ( not ( = ?auto_6524 ?auto_6532 ) ) ( not ( = ?auto_6525 ?auto_6527 ) ) ( not ( = ?auto_6525 ?auto_6532 ) ) ( not ( = ?auto_6526 ?auto_6527 ) ) ( not ( = ?auto_6526 ?auto_6532 ) ) ( not ( = ?auto_6527 ?auto_6542 ) ) ( not ( = ?auto_6527 ?auto_6544 ) ) ( not ( = ?auto_6527 ?auto_6541 ) ) ( not ( = ?auto_6527 ?auto_6537 ) ) ( not ( = ?auto_6527 ?auto_6546 ) ) ( not ( = ?auto_6527 ?auto_6540 ) ) ( not ( = ?auto_6532 ?auto_6542 ) ) ( not ( = ?auto_6532 ?auto_6544 ) ) ( not ( = ?auto_6532 ?auto_6541 ) ) ( not ( = ?auto_6532 ?auto_6537 ) ) ( not ( = ?auto_6532 ?auto_6546 ) ) ( not ( = ?auto_6532 ?auto_6540 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_6521 ?auto_6522 ?auto_6523 ?auto_6524 ?auto_6525 ?auto_6526 ?auto_6528 )
      ( MAKE-1CRATE ?auto_6528 ?auto_6527 )
      ( MAKE-7CRATE-VERIFY ?auto_6521 ?auto_6522 ?auto_6523 ?auto_6524 ?auto_6525 ?auto_6526 ?auto_6528 ?auto_6527 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6549 - SURFACE
      ?auto_6550 - SURFACE
    )
    :vars
    (
      ?auto_6551 - HOIST
      ?auto_6552 - PLACE
      ?auto_6554 - PLACE
      ?auto_6555 - HOIST
      ?auto_6556 - SURFACE
      ?auto_6553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6551 ?auto_6552 ) ( SURFACE-AT ?auto_6549 ?auto_6552 ) ( CLEAR ?auto_6549 ) ( IS-CRATE ?auto_6550 ) ( AVAILABLE ?auto_6551 ) ( not ( = ?auto_6554 ?auto_6552 ) ) ( HOIST-AT ?auto_6555 ?auto_6554 ) ( AVAILABLE ?auto_6555 ) ( SURFACE-AT ?auto_6550 ?auto_6554 ) ( ON ?auto_6550 ?auto_6556 ) ( CLEAR ?auto_6550 ) ( TRUCK-AT ?auto_6553 ?auto_6552 ) ( not ( = ?auto_6549 ?auto_6550 ) ) ( not ( = ?auto_6549 ?auto_6556 ) ) ( not ( = ?auto_6550 ?auto_6556 ) ) ( not ( = ?auto_6551 ?auto_6555 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6553 ?auto_6552 ?auto_6554 )
      ( !LIFT ?auto_6555 ?auto_6550 ?auto_6556 ?auto_6554 )
      ( !LOAD ?auto_6555 ?auto_6550 ?auto_6553 ?auto_6554 )
      ( !DRIVE ?auto_6553 ?auto_6554 ?auto_6552 )
      ( !UNLOAD ?auto_6551 ?auto_6550 ?auto_6553 ?auto_6552 )
      ( !DROP ?auto_6551 ?auto_6550 ?auto_6549 ?auto_6552 )
      ( MAKE-1CRATE-VERIFY ?auto_6549 ?auto_6550 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_6566 - SURFACE
      ?auto_6567 - SURFACE
      ?auto_6568 - SURFACE
      ?auto_6569 - SURFACE
      ?auto_6570 - SURFACE
      ?auto_6571 - SURFACE
      ?auto_6574 - SURFACE
      ?auto_6573 - SURFACE
      ?auto_6572 - SURFACE
    )
    :vars
    (
      ?auto_6580 - HOIST
      ?auto_6578 - PLACE
      ?auto_6579 - PLACE
      ?auto_6577 - HOIST
      ?auto_6576 - SURFACE
      ?auto_6594 - PLACE
      ?auto_6588 - HOIST
      ?auto_6589 - SURFACE
      ?auto_6590 - SURFACE
      ?auto_6581 - PLACE
      ?auto_6585 - HOIST
      ?auto_6586 - SURFACE
      ?auto_6591 - SURFACE
      ?auto_6584 - PLACE
      ?auto_6593 - HOIST
      ?auto_6582 - SURFACE
      ?auto_6595 - PLACE
      ?auto_6583 - HOIST
      ?auto_6587 - SURFACE
      ?auto_6592 - SURFACE
      ?auto_6575 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6580 ?auto_6578 ) ( IS-CRATE ?auto_6572 ) ( not ( = ?auto_6579 ?auto_6578 ) ) ( HOIST-AT ?auto_6577 ?auto_6579 ) ( AVAILABLE ?auto_6577 ) ( SURFACE-AT ?auto_6572 ?auto_6579 ) ( ON ?auto_6572 ?auto_6576 ) ( CLEAR ?auto_6572 ) ( not ( = ?auto_6573 ?auto_6572 ) ) ( not ( = ?auto_6573 ?auto_6576 ) ) ( not ( = ?auto_6572 ?auto_6576 ) ) ( not ( = ?auto_6580 ?auto_6577 ) ) ( IS-CRATE ?auto_6573 ) ( not ( = ?auto_6594 ?auto_6578 ) ) ( HOIST-AT ?auto_6588 ?auto_6594 ) ( SURFACE-AT ?auto_6573 ?auto_6594 ) ( ON ?auto_6573 ?auto_6589 ) ( CLEAR ?auto_6573 ) ( not ( = ?auto_6574 ?auto_6573 ) ) ( not ( = ?auto_6574 ?auto_6589 ) ) ( not ( = ?auto_6573 ?auto_6589 ) ) ( not ( = ?auto_6580 ?auto_6588 ) ) ( IS-CRATE ?auto_6574 ) ( SURFACE-AT ?auto_6574 ?auto_6594 ) ( ON ?auto_6574 ?auto_6590 ) ( CLEAR ?auto_6574 ) ( not ( = ?auto_6571 ?auto_6574 ) ) ( not ( = ?auto_6571 ?auto_6590 ) ) ( not ( = ?auto_6574 ?auto_6590 ) ) ( IS-CRATE ?auto_6571 ) ( not ( = ?auto_6581 ?auto_6578 ) ) ( HOIST-AT ?auto_6585 ?auto_6581 ) ( SURFACE-AT ?auto_6571 ?auto_6581 ) ( ON ?auto_6571 ?auto_6586 ) ( CLEAR ?auto_6571 ) ( not ( = ?auto_6570 ?auto_6571 ) ) ( not ( = ?auto_6570 ?auto_6586 ) ) ( not ( = ?auto_6571 ?auto_6586 ) ) ( not ( = ?auto_6580 ?auto_6585 ) ) ( IS-CRATE ?auto_6570 ) ( AVAILABLE ?auto_6585 ) ( SURFACE-AT ?auto_6570 ?auto_6581 ) ( ON ?auto_6570 ?auto_6591 ) ( CLEAR ?auto_6570 ) ( not ( = ?auto_6569 ?auto_6570 ) ) ( not ( = ?auto_6569 ?auto_6591 ) ) ( not ( = ?auto_6570 ?auto_6591 ) ) ( IS-CRATE ?auto_6569 ) ( not ( = ?auto_6584 ?auto_6578 ) ) ( HOIST-AT ?auto_6593 ?auto_6584 ) ( AVAILABLE ?auto_6593 ) ( SURFACE-AT ?auto_6569 ?auto_6584 ) ( ON ?auto_6569 ?auto_6582 ) ( CLEAR ?auto_6569 ) ( not ( = ?auto_6568 ?auto_6569 ) ) ( not ( = ?auto_6568 ?auto_6582 ) ) ( not ( = ?auto_6569 ?auto_6582 ) ) ( not ( = ?auto_6580 ?auto_6593 ) ) ( IS-CRATE ?auto_6568 ) ( not ( = ?auto_6595 ?auto_6578 ) ) ( HOIST-AT ?auto_6583 ?auto_6595 ) ( AVAILABLE ?auto_6583 ) ( SURFACE-AT ?auto_6568 ?auto_6595 ) ( ON ?auto_6568 ?auto_6587 ) ( CLEAR ?auto_6568 ) ( not ( = ?auto_6567 ?auto_6568 ) ) ( not ( = ?auto_6567 ?auto_6587 ) ) ( not ( = ?auto_6568 ?auto_6587 ) ) ( not ( = ?auto_6580 ?auto_6583 ) ) ( SURFACE-AT ?auto_6566 ?auto_6578 ) ( CLEAR ?auto_6566 ) ( IS-CRATE ?auto_6567 ) ( AVAILABLE ?auto_6580 ) ( AVAILABLE ?auto_6588 ) ( SURFACE-AT ?auto_6567 ?auto_6594 ) ( ON ?auto_6567 ?auto_6592 ) ( CLEAR ?auto_6567 ) ( TRUCK-AT ?auto_6575 ?auto_6578 ) ( not ( = ?auto_6566 ?auto_6567 ) ) ( not ( = ?auto_6566 ?auto_6592 ) ) ( not ( = ?auto_6567 ?auto_6592 ) ) ( not ( = ?auto_6566 ?auto_6568 ) ) ( not ( = ?auto_6566 ?auto_6587 ) ) ( not ( = ?auto_6568 ?auto_6592 ) ) ( not ( = ?auto_6595 ?auto_6594 ) ) ( not ( = ?auto_6583 ?auto_6588 ) ) ( not ( = ?auto_6587 ?auto_6592 ) ) ( not ( = ?auto_6566 ?auto_6569 ) ) ( not ( = ?auto_6566 ?auto_6582 ) ) ( not ( = ?auto_6567 ?auto_6569 ) ) ( not ( = ?auto_6567 ?auto_6582 ) ) ( not ( = ?auto_6569 ?auto_6587 ) ) ( not ( = ?auto_6569 ?auto_6592 ) ) ( not ( = ?auto_6584 ?auto_6595 ) ) ( not ( = ?auto_6584 ?auto_6594 ) ) ( not ( = ?auto_6593 ?auto_6583 ) ) ( not ( = ?auto_6593 ?auto_6588 ) ) ( not ( = ?auto_6582 ?auto_6587 ) ) ( not ( = ?auto_6582 ?auto_6592 ) ) ( not ( = ?auto_6566 ?auto_6570 ) ) ( not ( = ?auto_6566 ?auto_6591 ) ) ( not ( = ?auto_6567 ?auto_6570 ) ) ( not ( = ?auto_6567 ?auto_6591 ) ) ( not ( = ?auto_6568 ?auto_6570 ) ) ( not ( = ?auto_6568 ?auto_6591 ) ) ( not ( = ?auto_6570 ?auto_6582 ) ) ( not ( = ?auto_6570 ?auto_6587 ) ) ( not ( = ?auto_6570 ?auto_6592 ) ) ( not ( = ?auto_6581 ?auto_6584 ) ) ( not ( = ?auto_6581 ?auto_6595 ) ) ( not ( = ?auto_6581 ?auto_6594 ) ) ( not ( = ?auto_6585 ?auto_6593 ) ) ( not ( = ?auto_6585 ?auto_6583 ) ) ( not ( = ?auto_6585 ?auto_6588 ) ) ( not ( = ?auto_6591 ?auto_6582 ) ) ( not ( = ?auto_6591 ?auto_6587 ) ) ( not ( = ?auto_6591 ?auto_6592 ) ) ( not ( = ?auto_6566 ?auto_6571 ) ) ( not ( = ?auto_6566 ?auto_6586 ) ) ( not ( = ?auto_6567 ?auto_6571 ) ) ( not ( = ?auto_6567 ?auto_6586 ) ) ( not ( = ?auto_6568 ?auto_6571 ) ) ( not ( = ?auto_6568 ?auto_6586 ) ) ( not ( = ?auto_6569 ?auto_6571 ) ) ( not ( = ?auto_6569 ?auto_6586 ) ) ( not ( = ?auto_6571 ?auto_6591 ) ) ( not ( = ?auto_6571 ?auto_6582 ) ) ( not ( = ?auto_6571 ?auto_6587 ) ) ( not ( = ?auto_6571 ?auto_6592 ) ) ( not ( = ?auto_6586 ?auto_6591 ) ) ( not ( = ?auto_6586 ?auto_6582 ) ) ( not ( = ?auto_6586 ?auto_6587 ) ) ( not ( = ?auto_6586 ?auto_6592 ) ) ( not ( = ?auto_6566 ?auto_6574 ) ) ( not ( = ?auto_6566 ?auto_6590 ) ) ( not ( = ?auto_6567 ?auto_6574 ) ) ( not ( = ?auto_6567 ?auto_6590 ) ) ( not ( = ?auto_6568 ?auto_6574 ) ) ( not ( = ?auto_6568 ?auto_6590 ) ) ( not ( = ?auto_6569 ?auto_6574 ) ) ( not ( = ?auto_6569 ?auto_6590 ) ) ( not ( = ?auto_6570 ?auto_6574 ) ) ( not ( = ?auto_6570 ?auto_6590 ) ) ( not ( = ?auto_6574 ?auto_6586 ) ) ( not ( = ?auto_6574 ?auto_6591 ) ) ( not ( = ?auto_6574 ?auto_6582 ) ) ( not ( = ?auto_6574 ?auto_6587 ) ) ( not ( = ?auto_6574 ?auto_6592 ) ) ( not ( = ?auto_6590 ?auto_6586 ) ) ( not ( = ?auto_6590 ?auto_6591 ) ) ( not ( = ?auto_6590 ?auto_6582 ) ) ( not ( = ?auto_6590 ?auto_6587 ) ) ( not ( = ?auto_6590 ?auto_6592 ) ) ( not ( = ?auto_6566 ?auto_6573 ) ) ( not ( = ?auto_6566 ?auto_6589 ) ) ( not ( = ?auto_6567 ?auto_6573 ) ) ( not ( = ?auto_6567 ?auto_6589 ) ) ( not ( = ?auto_6568 ?auto_6573 ) ) ( not ( = ?auto_6568 ?auto_6589 ) ) ( not ( = ?auto_6569 ?auto_6573 ) ) ( not ( = ?auto_6569 ?auto_6589 ) ) ( not ( = ?auto_6570 ?auto_6573 ) ) ( not ( = ?auto_6570 ?auto_6589 ) ) ( not ( = ?auto_6571 ?auto_6573 ) ) ( not ( = ?auto_6571 ?auto_6589 ) ) ( not ( = ?auto_6573 ?auto_6590 ) ) ( not ( = ?auto_6573 ?auto_6586 ) ) ( not ( = ?auto_6573 ?auto_6591 ) ) ( not ( = ?auto_6573 ?auto_6582 ) ) ( not ( = ?auto_6573 ?auto_6587 ) ) ( not ( = ?auto_6573 ?auto_6592 ) ) ( not ( = ?auto_6589 ?auto_6590 ) ) ( not ( = ?auto_6589 ?auto_6586 ) ) ( not ( = ?auto_6589 ?auto_6591 ) ) ( not ( = ?auto_6589 ?auto_6582 ) ) ( not ( = ?auto_6589 ?auto_6587 ) ) ( not ( = ?auto_6589 ?auto_6592 ) ) ( not ( = ?auto_6566 ?auto_6572 ) ) ( not ( = ?auto_6566 ?auto_6576 ) ) ( not ( = ?auto_6567 ?auto_6572 ) ) ( not ( = ?auto_6567 ?auto_6576 ) ) ( not ( = ?auto_6568 ?auto_6572 ) ) ( not ( = ?auto_6568 ?auto_6576 ) ) ( not ( = ?auto_6569 ?auto_6572 ) ) ( not ( = ?auto_6569 ?auto_6576 ) ) ( not ( = ?auto_6570 ?auto_6572 ) ) ( not ( = ?auto_6570 ?auto_6576 ) ) ( not ( = ?auto_6571 ?auto_6572 ) ) ( not ( = ?auto_6571 ?auto_6576 ) ) ( not ( = ?auto_6574 ?auto_6572 ) ) ( not ( = ?auto_6574 ?auto_6576 ) ) ( not ( = ?auto_6572 ?auto_6589 ) ) ( not ( = ?auto_6572 ?auto_6590 ) ) ( not ( = ?auto_6572 ?auto_6586 ) ) ( not ( = ?auto_6572 ?auto_6591 ) ) ( not ( = ?auto_6572 ?auto_6582 ) ) ( not ( = ?auto_6572 ?auto_6587 ) ) ( not ( = ?auto_6572 ?auto_6592 ) ) ( not ( = ?auto_6579 ?auto_6594 ) ) ( not ( = ?auto_6579 ?auto_6581 ) ) ( not ( = ?auto_6579 ?auto_6584 ) ) ( not ( = ?auto_6579 ?auto_6595 ) ) ( not ( = ?auto_6577 ?auto_6588 ) ) ( not ( = ?auto_6577 ?auto_6585 ) ) ( not ( = ?auto_6577 ?auto_6593 ) ) ( not ( = ?auto_6577 ?auto_6583 ) ) ( not ( = ?auto_6576 ?auto_6589 ) ) ( not ( = ?auto_6576 ?auto_6590 ) ) ( not ( = ?auto_6576 ?auto_6586 ) ) ( not ( = ?auto_6576 ?auto_6591 ) ) ( not ( = ?auto_6576 ?auto_6582 ) ) ( not ( = ?auto_6576 ?auto_6587 ) ) ( not ( = ?auto_6576 ?auto_6592 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_6566 ?auto_6567 ?auto_6568 ?auto_6569 ?auto_6570 ?auto_6571 ?auto_6574 ?auto_6573 )
      ( MAKE-1CRATE ?auto_6573 ?auto_6572 )
      ( MAKE-8CRATE-VERIFY ?auto_6566 ?auto_6567 ?auto_6568 ?auto_6569 ?auto_6570 ?auto_6571 ?auto_6574 ?auto_6573 ?auto_6572 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_6598 - SURFACE
      ?auto_6599 - SURFACE
    )
    :vars
    (
      ?auto_6600 - HOIST
      ?auto_6601 - PLACE
      ?auto_6603 - PLACE
      ?auto_6604 - HOIST
      ?auto_6605 - SURFACE
      ?auto_6602 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6600 ?auto_6601 ) ( SURFACE-AT ?auto_6598 ?auto_6601 ) ( CLEAR ?auto_6598 ) ( IS-CRATE ?auto_6599 ) ( AVAILABLE ?auto_6600 ) ( not ( = ?auto_6603 ?auto_6601 ) ) ( HOIST-AT ?auto_6604 ?auto_6603 ) ( AVAILABLE ?auto_6604 ) ( SURFACE-AT ?auto_6599 ?auto_6603 ) ( ON ?auto_6599 ?auto_6605 ) ( CLEAR ?auto_6599 ) ( TRUCK-AT ?auto_6602 ?auto_6601 ) ( not ( = ?auto_6598 ?auto_6599 ) ) ( not ( = ?auto_6598 ?auto_6605 ) ) ( not ( = ?auto_6599 ?auto_6605 ) ) ( not ( = ?auto_6600 ?auto_6604 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_6602 ?auto_6601 ?auto_6603 )
      ( !LIFT ?auto_6604 ?auto_6599 ?auto_6605 ?auto_6603 )
      ( !LOAD ?auto_6604 ?auto_6599 ?auto_6602 ?auto_6603 )
      ( !DRIVE ?auto_6602 ?auto_6603 ?auto_6601 )
      ( !UNLOAD ?auto_6600 ?auto_6599 ?auto_6602 ?auto_6601 )
      ( !DROP ?auto_6600 ?auto_6599 ?auto_6598 ?auto_6601 )
      ( MAKE-1CRATE-VERIFY ?auto_6598 ?auto_6599 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_6616 - SURFACE
      ?auto_6617 - SURFACE
      ?auto_6618 - SURFACE
      ?auto_6619 - SURFACE
      ?auto_6620 - SURFACE
      ?auto_6621 - SURFACE
      ?auto_6624 - SURFACE
      ?auto_6623 - SURFACE
      ?auto_6622 - SURFACE
      ?auto_6625 - SURFACE
    )
    :vars
    (
      ?auto_6627 - HOIST
      ?auto_6626 - PLACE
      ?auto_6629 - PLACE
      ?auto_6631 - HOIST
      ?auto_6628 - SURFACE
      ?auto_6642 - PLACE
      ?auto_6645 - HOIST
      ?auto_6643 - SURFACE
      ?auto_6637 - PLACE
      ?auto_6638 - HOIST
      ?auto_6633 - SURFACE
      ?auto_6635 - SURFACE
      ?auto_6632 - PLACE
      ?auto_6641 - HOIST
      ?auto_6640 - SURFACE
      ?auto_6634 - SURFACE
      ?auto_6644 - SURFACE
      ?auto_6646 - PLACE
      ?auto_6647 - HOIST
      ?auto_6639 - SURFACE
      ?auto_6636 - SURFACE
      ?auto_6630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6627 ?auto_6626 ) ( IS-CRATE ?auto_6625 ) ( not ( = ?auto_6629 ?auto_6626 ) ) ( HOIST-AT ?auto_6631 ?auto_6629 ) ( SURFACE-AT ?auto_6625 ?auto_6629 ) ( ON ?auto_6625 ?auto_6628 ) ( CLEAR ?auto_6625 ) ( not ( = ?auto_6622 ?auto_6625 ) ) ( not ( = ?auto_6622 ?auto_6628 ) ) ( not ( = ?auto_6625 ?auto_6628 ) ) ( not ( = ?auto_6627 ?auto_6631 ) ) ( IS-CRATE ?auto_6622 ) ( not ( = ?auto_6642 ?auto_6626 ) ) ( HOIST-AT ?auto_6645 ?auto_6642 ) ( AVAILABLE ?auto_6645 ) ( SURFACE-AT ?auto_6622 ?auto_6642 ) ( ON ?auto_6622 ?auto_6643 ) ( CLEAR ?auto_6622 ) ( not ( = ?auto_6623 ?auto_6622 ) ) ( not ( = ?auto_6623 ?auto_6643 ) ) ( not ( = ?auto_6622 ?auto_6643 ) ) ( not ( = ?auto_6627 ?auto_6645 ) ) ( IS-CRATE ?auto_6623 ) ( not ( = ?auto_6637 ?auto_6626 ) ) ( HOIST-AT ?auto_6638 ?auto_6637 ) ( SURFACE-AT ?auto_6623 ?auto_6637 ) ( ON ?auto_6623 ?auto_6633 ) ( CLEAR ?auto_6623 ) ( not ( = ?auto_6624 ?auto_6623 ) ) ( not ( = ?auto_6624 ?auto_6633 ) ) ( not ( = ?auto_6623 ?auto_6633 ) ) ( not ( = ?auto_6627 ?auto_6638 ) ) ( IS-CRATE ?auto_6624 ) ( SURFACE-AT ?auto_6624 ?auto_6637 ) ( ON ?auto_6624 ?auto_6635 ) ( CLEAR ?auto_6624 ) ( not ( = ?auto_6621 ?auto_6624 ) ) ( not ( = ?auto_6621 ?auto_6635 ) ) ( not ( = ?auto_6624 ?auto_6635 ) ) ( IS-CRATE ?auto_6621 ) ( not ( = ?auto_6632 ?auto_6626 ) ) ( HOIST-AT ?auto_6641 ?auto_6632 ) ( SURFACE-AT ?auto_6621 ?auto_6632 ) ( ON ?auto_6621 ?auto_6640 ) ( CLEAR ?auto_6621 ) ( not ( = ?auto_6620 ?auto_6621 ) ) ( not ( = ?auto_6620 ?auto_6640 ) ) ( not ( = ?auto_6621 ?auto_6640 ) ) ( not ( = ?auto_6627 ?auto_6641 ) ) ( IS-CRATE ?auto_6620 ) ( AVAILABLE ?auto_6641 ) ( SURFACE-AT ?auto_6620 ?auto_6632 ) ( ON ?auto_6620 ?auto_6634 ) ( CLEAR ?auto_6620 ) ( not ( = ?auto_6619 ?auto_6620 ) ) ( not ( = ?auto_6619 ?auto_6634 ) ) ( not ( = ?auto_6620 ?auto_6634 ) ) ( IS-CRATE ?auto_6619 ) ( AVAILABLE ?auto_6631 ) ( SURFACE-AT ?auto_6619 ?auto_6629 ) ( ON ?auto_6619 ?auto_6644 ) ( CLEAR ?auto_6619 ) ( not ( = ?auto_6618 ?auto_6619 ) ) ( not ( = ?auto_6618 ?auto_6644 ) ) ( not ( = ?auto_6619 ?auto_6644 ) ) ( IS-CRATE ?auto_6618 ) ( not ( = ?auto_6646 ?auto_6626 ) ) ( HOIST-AT ?auto_6647 ?auto_6646 ) ( AVAILABLE ?auto_6647 ) ( SURFACE-AT ?auto_6618 ?auto_6646 ) ( ON ?auto_6618 ?auto_6639 ) ( CLEAR ?auto_6618 ) ( not ( = ?auto_6617 ?auto_6618 ) ) ( not ( = ?auto_6617 ?auto_6639 ) ) ( not ( = ?auto_6618 ?auto_6639 ) ) ( not ( = ?auto_6627 ?auto_6647 ) ) ( SURFACE-AT ?auto_6616 ?auto_6626 ) ( CLEAR ?auto_6616 ) ( IS-CRATE ?auto_6617 ) ( AVAILABLE ?auto_6627 ) ( AVAILABLE ?auto_6638 ) ( SURFACE-AT ?auto_6617 ?auto_6637 ) ( ON ?auto_6617 ?auto_6636 ) ( CLEAR ?auto_6617 ) ( TRUCK-AT ?auto_6630 ?auto_6626 ) ( not ( = ?auto_6616 ?auto_6617 ) ) ( not ( = ?auto_6616 ?auto_6636 ) ) ( not ( = ?auto_6617 ?auto_6636 ) ) ( not ( = ?auto_6616 ?auto_6618 ) ) ( not ( = ?auto_6616 ?auto_6639 ) ) ( not ( = ?auto_6618 ?auto_6636 ) ) ( not ( = ?auto_6646 ?auto_6637 ) ) ( not ( = ?auto_6647 ?auto_6638 ) ) ( not ( = ?auto_6639 ?auto_6636 ) ) ( not ( = ?auto_6616 ?auto_6619 ) ) ( not ( = ?auto_6616 ?auto_6644 ) ) ( not ( = ?auto_6617 ?auto_6619 ) ) ( not ( = ?auto_6617 ?auto_6644 ) ) ( not ( = ?auto_6619 ?auto_6639 ) ) ( not ( = ?auto_6619 ?auto_6636 ) ) ( not ( = ?auto_6629 ?auto_6646 ) ) ( not ( = ?auto_6629 ?auto_6637 ) ) ( not ( = ?auto_6631 ?auto_6647 ) ) ( not ( = ?auto_6631 ?auto_6638 ) ) ( not ( = ?auto_6644 ?auto_6639 ) ) ( not ( = ?auto_6644 ?auto_6636 ) ) ( not ( = ?auto_6616 ?auto_6620 ) ) ( not ( = ?auto_6616 ?auto_6634 ) ) ( not ( = ?auto_6617 ?auto_6620 ) ) ( not ( = ?auto_6617 ?auto_6634 ) ) ( not ( = ?auto_6618 ?auto_6620 ) ) ( not ( = ?auto_6618 ?auto_6634 ) ) ( not ( = ?auto_6620 ?auto_6644 ) ) ( not ( = ?auto_6620 ?auto_6639 ) ) ( not ( = ?auto_6620 ?auto_6636 ) ) ( not ( = ?auto_6632 ?auto_6629 ) ) ( not ( = ?auto_6632 ?auto_6646 ) ) ( not ( = ?auto_6632 ?auto_6637 ) ) ( not ( = ?auto_6641 ?auto_6631 ) ) ( not ( = ?auto_6641 ?auto_6647 ) ) ( not ( = ?auto_6641 ?auto_6638 ) ) ( not ( = ?auto_6634 ?auto_6644 ) ) ( not ( = ?auto_6634 ?auto_6639 ) ) ( not ( = ?auto_6634 ?auto_6636 ) ) ( not ( = ?auto_6616 ?auto_6621 ) ) ( not ( = ?auto_6616 ?auto_6640 ) ) ( not ( = ?auto_6617 ?auto_6621 ) ) ( not ( = ?auto_6617 ?auto_6640 ) ) ( not ( = ?auto_6618 ?auto_6621 ) ) ( not ( = ?auto_6618 ?auto_6640 ) ) ( not ( = ?auto_6619 ?auto_6621 ) ) ( not ( = ?auto_6619 ?auto_6640 ) ) ( not ( = ?auto_6621 ?auto_6634 ) ) ( not ( = ?auto_6621 ?auto_6644 ) ) ( not ( = ?auto_6621 ?auto_6639 ) ) ( not ( = ?auto_6621 ?auto_6636 ) ) ( not ( = ?auto_6640 ?auto_6634 ) ) ( not ( = ?auto_6640 ?auto_6644 ) ) ( not ( = ?auto_6640 ?auto_6639 ) ) ( not ( = ?auto_6640 ?auto_6636 ) ) ( not ( = ?auto_6616 ?auto_6624 ) ) ( not ( = ?auto_6616 ?auto_6635 ) ) ( not ( = ?auto_6617 ?auto_6624 ) ) ( not ( = ?auto_6617 ?auto_6635 ) ) ( not ( = ?auto_6618 ?auto_6624 ) ) ( not ( = ?auto_6618 ?auto_6635 ) ) ( not ( = ?auto_6619 ?auto_6624 ) ) ( not ( = ?auto_6619 ?auto_6635 ) ) ( not ( = ?auto_6620 ?auto_6624 ) ) ( not ( = ?auto_6620 ?auto_6635 ) ) ( not ( = ?auto_6624 ?auto_6640 ) ) ( not ( = ?auto_6624 ?auto_6634 ) ) ( not ( = ?auto_6624 ?auto_6644 ) ) ( not ( = ?auto_6624 ?auto_6639 ) ) ( not ( = ?auto_6624 ?auto_6636 ) ) ( not ( = ?auto_6635 ?auto_6640 ) ) ( not ( = ?auto_6635 ?auto_6634 ) ) ( not ( = ?auto_6635 ?auto_6644 ) ) ( not ( = ?auto_6635 ?auto_6639 ) ) ( not ( = ?auto_6635 ?auto_6636 ) ) ( not ( = ?auto_6616 ?auto_6623 ) ) ( not ( = ?auto_6616 ?auto_6633 ) ) ( not ( = ?auto_6617 ?auto_6623 ) ) ( not ( = ?auto_6617 ?auto_6633 ) ) ( not ( = ?auto_6618 ?auto_6623 ) ) ( not ( = ?auto_6618 ?auto_6633 ) ) ( not ( = ?auto_6619 ?auto_6623 ) ) ( not ( = ?auto_6619 ?auto_6633 ) ) ( not ( = ?auto_6620 ?auto_6623 ) ) ( not ( = ?auto_6620 ?auto_6633 ) ) ( not ( = ?auto_6621 ?auto_6623 ) ) ( not ( = ?auto_6621 ?auto_6633 ) ) ( not ( = ?auto_6623 ?auto_6635 ) ) ( not ( = ?auto_6623 ?auto_6640 ) ) ( not ( = ?auto_6623 ?auto_6634 ) ) ( not ( = ?auto_6623 ?auto_6644 ) ) ( not ( = ?auto_6623 ?auto_6639 ) ) ( not ( = ?auto_6623 ?auto_6636 ) ) ( not ( = ?auto_6633 ?auto_6635 ) ) ( not ( = ?auto_6633 ?auto_6640 ) ) ( not ( = ?auto_6633 ?auto_6634 ) ) ( not ( = ?auto_6633 ?auto_6644 ) ) ( not ( = ?auto_6633 ?auto_6639 ) ) ( not ( = ?auto_6633 ?auto_6636 ) ) ( not ( = ?auto_6616 ?auto_6622 ) ) ( not ( = ?auto_6616 ?auto_6643 ) ) ( not ( = ?auto_6617 ?auto_6622 ) ) ( not ( = ?auto_6617 ?auto_6643 ) ) ( not ( = ?auto_6618 ?auto_6622 ) ) ( not ( = ?auto_6618 ?auto_6643 ) ) ( not ( = ?auto_6619 ?auto_6622 ) ) ( not ( = ?auto_6619 ?auto_6643 ) ) ( not ( = ?auto_6620 ?auto_6622 ) ) ( not ( = ?auto_6620 ?auto_6643 ) ) ( not ( = ?auto_6621 ?auto_6622 ) ) ( not ( = ?auto_6621 ?auto_6643 ) ) ( not ( = ?auto_6624 ?auto_6622 ) ) ( not ( = ?auto_6624 ?auto_6643 ) ) ( not ( = ?auto_6622 ?auto_6633 ) ) ( not ( = ?auto_6622 ?auto_6635 ) ) ( not ( = ?auto_6622 ?auto_6640 ) ) ( not ( = ?auto_6622 ?auto_6634 ) ) ( not ( = ?auto_6622 ?auto_6644 ) ) ( not ( = ?auto_6622 ?auto_6639 ) ) ( not ( = ?auto_6622 ?auto_6636 ) ) ( not ( = ?auto_6642 ?auto_6637 ) ) ( not ( = ?auto_6642 ?auto_6632 ) ) ( not ( = ?auto_6642 ?auto_6629 ) ) ( not ( = ?auto_6642 ?auto_6646 ) ) ( not ( = ?auto_6645 ?auto_6638 ) ) ( not ( = ?auto_6645 ?auto_6641 ) ) ( not ( = ?auto_6645 ?auto_6631 ) ) ( not ( = ?auto_6645 ?auto_6647 ) ) ( not ( = ?auto_6643 ?auto_6633 ) ) ( not ( = ?auto_6643 ?auto_6635 ) ) ( not ( = ?auto_6643 ?auto_6640 ) ) ( not ( = ?auto_6643 ?auto_6634 ) ) ( not ( = ?auto_6643 ?auto_6644 ) ) ( not ( = ?auto_6643 ?auto_6639 ) ) ( not ( = ?auto_6643 ?auto_6636 ) ) ( not ( = ?auto_6616 ?auto_6625 ) ) ( not ( = ?auto_6616 ?auto_6628 ) ) ( not ( = ?auto_6617 ?auto_6625 ) ) ( not ( = ?auto_6617 ?auto_6628 ) ) ( not ( = ?auto_6618 ?auto_6625 ) ) ( not ( = ?auto_6618 ?auto_6628 ) ) ( not ( = ?auto_6619 ?auto_6625 ) ) ( not ( = ?auto_6619 ?auto_6628 ) ) ( not ( = ?auto_6620 ?auto_6625 ) ) ( not ( = ?auto_6620 ?auto_6628 ) ) ( not ( = ?auto_6621 ?auto_6625 ) ) ( not ( = ?auto_6621 ?auto_6628 ) ) ( not ( = ?auto_6624 ?auto_6625 ) ) ( not ( = ?auto_6624 ?auto_6628 ) ) ( not ( = ?auto_6623 ?auto_6625 ) ) ( not ( = ?auto_6623 ?auto_6628 ) ) ( not ( = ?auto_6625 ?auto_6643 ) ) ( not ( = ?auto_6625 ?auto_6633 ) ) ( not ( = ?auto_6625 ?auto_6635 ) ) ( not ( = ?auto_6625 ?auto_6640 ) ) ( not ( = ?auto_6625 ?auto_6634 ) ) ( not ( = ?auto_6625 ?auto_6644 ) ) ( not ( = ?auto_6625 ?auto_6639 ) ) ( not ( = ?auto_6625 ?auto_6636 ) ) ( not ( = ?auto_6628 ?auto_6643 ) ) ( not ( = ?auto_6628 ?auto_6633 ) ) ( not ( = ?auto_6628 ?auto_6635 ) ) ( not ( = ?auto_6628 ?auto_6640 ) ) ( not ( = ?auto_6628 ?auto_6634 ) ) ( not ( = ?auto_6628 ?auto_6644 ) ) ( not ( = ?auto_6628 ?auto_6639 ) ) ( not ( = ?auto_6628 ?auto_6636 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_6616 ?auto_6617 ?auto_6618 ?auto_6619 ?auto_6620 ?auto_6621 ?auto_6624 ?auto_6623 ?auto_6622 )
      ( MAKE-1CRATE ?auto_6622 ?auto_6625 )
      ( MAKE-9CRATE-VERIFY ?auto_6616 ?auto_6617 ?auto_6618 ?auto_6619 ?auto_6620 ?auto_6621 ?auto_6624 ?auto_6623 ?auto_6622 ?auto_6625 ) )
  )

)

