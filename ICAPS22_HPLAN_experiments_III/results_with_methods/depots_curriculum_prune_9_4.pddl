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
      ?auto_6353 - PLACE
      ?auto_6352 - PLACE
      ?auto_6355 - HOIST
      ?auto_6350 - SURFACE
      ?auto_6358 - PLACE
      ?auto_6357 - HOIST
      ?auto_6356 - SURFACE
      ?auto_6351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6354 ?auto_6353 ) ( IS-CRATE ?auto_6349 ) ( not ( = ?auto_6352 ?auto_6353 ) ) ( HOIST-AT ?auto_6355 ?auto_6352 ) ( AVAILABLE ?auto_6355 ) ( SURFACE-AT ?auto_6349 ?auto_6352 ) ( ON ?auto_6349 ?auto_6350 ) ( CLEAR ?auto_6349 ) ( not ( = ?auto_6348 ?auto_6349 ) ) ( not ( = ?auto_6348 ?auto_6350 ) ) ( not ( = ?auto_6349 ?auto_6350 ) ) ( not ( = ?auto_6354 ?auto_6355 ) ) ( SURFACE-AT ?auto_6347 ?auto_6353 ) ( CLEAR ?auto_6347 ) ( IS-CRATE ?auto_6348 ) ( AVAILABLE ?auto_6354 ) ( not ( = ?auto_6358 ?auto_6353 ) ) ( HOIST-AT ?auto_6357 ?auto_6358 ) ( AVAILABLE ?auto_6357 ) ( SURFACE-AT ?auto_6348 ?auto_6358 ) ( ON ?auto_6348 ?auto_6356 ) ( CLEAR ?auto_6348 ) ( TRUCK-AT ?auto_6351 ?auto_6353 ) ( not ( = ?auto_6347 ?auto_6348 ) ) ( not ( = ?auto_6347 ?auto_6356 ) ) ( not ( = ?auto_6348 ?auto_6356 ) ) ( not ( = ?auto_6354 ?auto_6357 ) ) ( not ( = ?auto_6347 ?auto_6349 ) ) ( not ( = ?auto_6347 ?auto_6350 ) ) ( not ( = ?auto_6349 ?auto_6356 ) ) ( not ( = ?auto_6352 ?auto_6358 ) ) ( not ( = ?auto_6355 ?auto_6357 ) ) ( not ( = ?auto_6350 ?auto_6356 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_6347 ?auto_6348 )
      ( MAKE-1CRATE ?auto_6348 ?auto_6349 )
      ( MAKE-2CRATE-VERIFY ?auto_6347 ?auto_6348 ?auto_6349 ) )
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
      ?auto_6379 - PLACE
      ?auto_6377 - PLACE
      ?auto_6380 - HOIST
      ?auto_6378 - SURFACE
      ?auto_6387 - PLACE
      ?auto_6388 - HOIST
      ?auto_6383 - SURFACE
      ?auto_6384 - PLACE
      ?auto_6386 - HOIST
      ?auto_6385 - SURFACE
      ?auto_6381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6382 ?auto_6379 ) ( IS-CRATE ?auto_6376 ) ( not ( = ?auto_6377 ?auto_6379 ) ) ( HOIST-AT ?auto_6380 ?auto_6377 ) ( AVAILABLE ?auto_6380 ) ( SURFACE-AT ?auto_6376 ?auto_6377 ) ( ON ?auto_6376 ?auto_6378 ) ( CLEAR ?auto_6376 ) ( not ( = ?auto_6375 ?auto_6376 ) ) ( not ( = ?auto_6375 ?auto_6378 ) ) ( not ( = ?auto_6376 ?auto_6378 ) ) ( not ( = ?auto_6382 ?auto_6380 ) ) ( IS-CRATE ?auto_6375 ) ( not ( = ?auto_6387 ?auto_6379 ) ) ( HOIST-AT ?auto_6388 ?auto_6387 ) ( AVAILABLE ?auto_6388 ) ( SURFACE-AT ?auto_6375 ?auto_6387 ) ( ON ?auto_6375 ?auto_6383 ) ( CLEAR ?auto_6375 ) ( not ( = ?auto_6374 ?auto_6375 ) ) ( not ( = ?auto_6374 ?auto_6383 ) ) ( not ( = ?auto_6375 ?auto_6383 ) ) ( not ( = ?auto_6382 ?auto_6388 ) ) ( SURFACE-AT ?auto_6373 ?auto_6379 ) ( CLEAR ?auto_6373 ) ( IS-CRATE ?auto_6374 ) ( AVAILABLE ?auto_6382 ) ( not ( = ?auto_6384 ?auto_6379 ) ) ( HOIST-AT ?auto_6386 ?auto_6384 ) ( AVAILABLE ?auto_6386 ) ( SURFACE-AT ?auto_6374 ?auto_6384 ) ( ON ?auto_6374 ?auto_6385 ) ( CLEAR ?auto_6374 ) ( TRUCK-AT ?auto_6381 ?auto_6379 ) ( not ( = ?auto_6373 ?auto_6374 ) ) ( not ( = ?auto_6373 ?auto_6385 ) ) ( not ( = ?auto_6374 ?auto_6385 ) ) ( not ( = ?auto_6382 ?auto_6386 ) ) ( not ( = ?auto_6373 ?auto_6375 ) ) ( not ( = ?auto_6373 ?auto_6383 ) ) ( not ( = ?auto_6375 ?auto_6385 ) ) ( not ( = ?auto_6387 ?auto_6384 ) ) ( not ( = ?auto_6388 ?auto_6386 ) ) ( not ( = ?auto_6383 ?auto_6385 ) ) ( not ( = ?auto_6373 ?auto_6376 ) ) ( not ( = ?auto_6373 ?auto_6378 ) ) ( not ( = ?auto_6374 ?auto_6376 ) ) ( not ( = ?auto_6374 ?auto_6378 ) ) ( not ( = ?auto_6376 ?auto_6383 ) ) ( not ( = ?auto_6376 ?auto_6385 ) ) ( not ( = ?auto_6377 ?auto_6387 ) ) ( not ( = ?auto_6377 ?auto_6384 ) ) ( not ( = ?auto_6380 ?auto_6388 ) ) ( not ( = ?auto_6380 ?auto_6386 ) ) ( not ( = ?auto_6378 ?auto_6383 ) ) ( not ( = ?auto_6378 ?auto_6385 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_6373 ?auto_6374 ?auto_6375 )
      ( MAKE-1CRATE ?auto_6375 ?auto_6376 )
      ( MAKE-3CRATE-VERIFY ?auto_6373 ?auto_6374 ?auto_6375 ?auto_6376 ) )
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
      ?auto_6411 - HOIST
      ?auto_6414 - PLACE
      ?auto_6410 - PLACE
      ?auto_6409 - HOIST
      ?auto_6412 - SURFACE
      ?auto_6422 - PLACE
      ?auto_6416 - HOIST
      ?auto_6417 - SURFACE
      ?auto_6415 - PLACE
      ?auto_6420 - HOIST
      ?auto_6418 - SURFACE
      ?auto_6419 - PLACE
      ?auto_6423 - HOIST
      ?auto_6421 - SURFACE
      ?auto_6413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6411 ?auto_6414 ) ( IS-CRATE ?auto_6408 ) ( not ( = ?auto_6410 ?auto_6414 ) ) ( HOIST-AT ?auto_6409 ?auto_6410 ) ( AVAILABLE ?auto_6409 ) ( SURFACE-AT ?auto_6408 ?auto_6410 ) ( ON ?auto_6408 ?auto_6412 ) ( CLEAR ?auto_6408 ) ( not ( = ?auto_6407 ?auto_6408 ) ) ( not ( = ?auto_6407 ?auto_6412 ) ) ( not ( = ?auto_6408 ?auto_6412 ) ) ( not ( = ?auto_6411 ?auto_6409 ) ) ( IS-CRATE ?auto_6407 ) ( not ( = ?auto_6422 ?auto_6414 ) ) ( HOIST-AT ?auto_6416 ?auto_6422 ) ( AVAILABLE ?auto_6416 ) ( SURFACE-AT ?auto_6407 ?auto_6422 ) ( ON ?auto_6407 ?auto_6417 ) ( CLEAR ?auto_6407 ) ( not ( = ?auto_6406 ?auto_6407 ) ) ( not ( = ?auto_6406 ?auto_6417 ) ) ( not ( = ?auto_6407 ?auto_6417 ) ) ( not ( = ?auto_6411 ?auto_6416 ) ) ( IS-CRATE ?auto_6406 ) ( not ( = ?auto_6415 ?auto_6414 ) ) ( HOIST-AT ?auto_6420 ?auto_6415 ) ( AVAILABLE ?auto_6420 ) ( SURFACE-AT ?auto_6406 ?auto_6415 ) ( ON ?auto_6406 ?auto_6418 ) ( CLEAR ?auto_6406 ) ( not ( = ?auto_6405 ?auto_6406 ) ) ( not ( = ?auto_6405 ?auto_6418 ) ) ( not ( = ?auto_6406 ?auto_6418 ) ) ( not ( = ?auto_6411 ?auto_6420 ) ) ( SURFACE-AT ?auto_6404 ?auto_6414 ) ( CLEAR ?auto_6404 ) ( IS-CRATE ?auto_6405 ) ( AVAILABLE ?auto_6411 ) ( not ( = ?auto_6419 ?auto_6414 ) ) ( HOIST-AT ?auto_6423 ?auto_6419 ) ( AVAILABLE ?auto_6423 ) ( SURFACE-AT ?auto_6405 ?auto_6419 ) ( ON ?auto_6405 ?auto_6421 ) ( CLEAR ?auto_6405 ) ( TRUCK-AT ?auto_6413 ?auto_6414 ) ( not ( = ?auto_6404 ?auto_6405 ) ) ( not ( = ?auto_6404 ?auto_6421 ) ) ( not ( = ?auto_6405 ?auto_6421 ) ) ( not ( = ?auto_6411 ?auto_6423 ) ) ( not ( = ?auto_6404 ?auto_6406 ) ) ( not ( = ?auto_6404 ?auto_6418 ) ) ( not ( = ?auto_6406 ?auto_6421 ) ) ( not ( = ?auto_6415 ?auto_6419 ) ) ( not ( = ?auto_6420 ?auto_6423 ) ) ( not ( = ?auto_6418 ?auto_6421 ) ) ( not ( = ?auto_6404 ?auto_6407 ) ) ( not ( = ?auto_6404 ?auto_6417 ) ) ( not ( = ?auto_6405 ?auto_6407 ) ) ( not ( = ?auto_6405 ?auto_6417 ) ) ( not ( = ?auto_6407 ?auto_6418 ) ) ( not ( = ?auto_6407 ?auto_6421 ) ) ( not ( = ?auto_6422 ?auto_6415 ) ) ( not ( = ?auto_6422 ?auto_6419 ) ) ( not ( = ?auto_6416 ?auto_6420 ) ) ( not ( = ?auto_6416 ?auto_6423 ) ) ( not ( = ?auto_6417 ?auto_6418 ) ) ( not ( = ?auto_6417 ?auto_6421 ) ) ( not ( = ?auto_6404 ?auto_6408 ) ) ( not ( = ?auto_6404 ?auto_6412 ) ) ( not ( = ?auto_6405 ?auto_6408 ) ) ( not ( = ?auto_6405 ?auto_6412 ) ) ( not ( = ?auto_6406 ?auto_6408 ) ) ( not ( = ?auto_6406 ?auto_6412 ) ) ( not ( = ?auto_6408 ?auto_6417 ) ) ( not ( = ?auto_6408 ?auto_6418 ) ) ( not ( = ?auto_6408 ?auto_6421 ) ) ( not ( = ?auto_6410 ?auto_6422 ) ) ( not ( = ?auto_6410 ?auto_6415 ) ) ( not ( = ?auto_6410 ?auto_6419 ) ) ( not ( = ?auto_6409 ?auto_6416 ) ) ( not ( = ?auto_6409 ?auto_6420 ) ) ( not ( = ?auto_6409 ?auto_6423 ) ) ( not ( = ?auto_6412 ?auto_6417 ) ) ( not ( = ?auto_6412 ?auto_6418 ) ) ( not ( = ?auto_6412 ?auto_6421 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_6404 ?auto_6405 ?auto_6406 ?auto_6407 )
      ( MAKE-1CRATE ?auto_6407 ?auto_6408 )
      ( MAKE-4CRATE-VERIFY ?auto_6404 ?auto_6405 ?auto_6406 ?auto_6407 ?auto_6408 ) )
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
      ?auto_6446 - HOIST
      ?auto_6449 - PLACE
      ?auto_6447 - PLACE
      ?auto_6450 - HOIST
      ?auto_6451 - SURFACE
      ?auto_6452 - SURFACE
      ?auto_6457 - PLACE
      ?auto_6456 - HOIST
      ?auto_6455 - SURFACE
      ?auto_6453 - PLACE
      ?auto_6458 - HOIST
      ?auto_6460 - SURFACE
      ?auto_6461 - PLACE
      ?auto_6454 - HOIST
      ?auto_6459 - SURFACE
      ?auto_6448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6446 ?auto_6449 ) ( IS-CRATE ?auto_6445 ) ( not ( = ?auto_6447 ?auto_6449 ) ) ( HOIST-AT ?auto_6450 ?auto_6447 ) ( SURFACE-AT ?auto_6445 ?auto_6447 ) ( ON ?auto_6445 ?auto_6451 ) ( CLEAR ?auto_6445 ) ( not ( = ?auto_6444 ?auto_6445 ) ) ( not ( = ?auto_6444 ?auto_6451 ) ) ( not ( = ?auto_6445 ?auto_6451 ) ) ( not ( = ?auto_6446 ?auto_6450 ) ) ( IS-CRATE ?auto_6444 ) ( AVAILABLE ?auto_6450 ) ( SURFACE-AT ?auto_6444 ?auto_6447 ) ( ON ?auto_6444 ?auto_6452 ) ( CLEAR ?auto_6444 ) ( not ( = ?auto_6443 ?auto_6444 ) ) ( not ( = ?auto_6443 ?auto_6452 ) ) ( not ( = ?auto_6444 ?auto_6452 ) ) ( IS-CRATE ?auto_6443 ) ( not ( = ?auto_6457 ?auto_6449 ) ) ( HOIST-AT ?auto_6456 ?auto_6457 ) ( AVAILABLE ?auto_6456 ) ( SURFACE-AT ?auto_6443 ?auto_6457 ) ( ON ?auto_6443 ?auto_6455 ) ( CLEAR ?auto_6443 ) ( not ( = ?auto_6442 ?auto_6443 ) ) ( not ( = ?auto_6442 ?auto_6455 ) ) ( not ( = ?auto_6443 ?auto_6455 ) ) ( not ( = ?auto_6446 ?auto_6456 ) ) ( IS-CRATE ?auto_6442 ) ( not ( = ?auto_6453 ?auto_6449 ) ) ( HOIST-AT ?auto_6458 ?auto_6453 ) ( AVAILABLE ?auto_6458 ) ( SURFACE-AT ?auto_6442 ?auto_6453 ) ( ON ?auto_6442 ?auto_6460 ) ( CLEAR ?auto_6442 ) ( not ( = ?auto_6441 ?auto_6442 ) ) ( not ( = ?auto_6441 ?auto_6460 ) ) ( not ( = ?auto_6442 ?auto_6460 ) ) ( not ( = ?auto_6446 ?auto_6458 ) ) ( SURFACE-AT ?auto_6440 ?auto_6449 ) ( CLEAR ?auto_6440 ) ( IS-CRATE ?auto_6441 ) ( AVAILABLE ?auto_6446 ) ( not ( = ?auto_6461 ?auto_6449 ) ) ( HOIST-AT ?auto_6454 ?auto_6461 ) ( AVAILABLE ?auto_6454 ) ( SURFACE-AT ?auto_6441 ?auto_6461 ) ( ON ?auto_6441 ?auto_6459 ) ( CLEAR ?auto_6441 ) ( TRUCK-AT ?auto_6448 ?auto_6449 ) ( not ( = ?auto_6440 ?auto_6441 ) ) ( not ( = ?auto_6440 ?auto_6459 ) ) ( not ( = ?auto_6441 ?auto_6459 ) ) ( not ( = ?auto_6446 ?auto_6454 ) ) ( not ( = ?auto_6440 ?auto_6442 ) ) ( not ( = ?auto_6440 ?auto_6460 ) ) ( not ( = ?auto_6442 ?auto_6459 ) ) ( not ( = ?auto_6453 ?auto_6461 ) ) ( not ( = ?auto_6458 ?auto_6454 ) ) ( not ( = ?auto_6460 ?auto_6459 ) ) ( not ( = ?auto_6440 ?auto_6443 ) ) ( not ( = ?auto_6440 ?auto_6455 ) ) ( not ( = ?auto_6441 ?auto_6443 ) ) ( not ( = ?auto_6441 ?auto_6455 ) ) ( not ( = ?auto_6443 ?auto_6460 ) ) ( not ( = ?auto_6443 ?auto_6459 ) ) ( not ( = ?auto_6457 ?auto_6453 ) ) ( not ( = ?auto_6457 ?auto_6461 ) ) ( not ( = ?auto_6456 ?auto_6458 ) ) ( not ( = ?auto_6456 ?auto_6454 ) ) ( not ( = ?auto_6455 ?auto_6460 ) ) ( not ( = ?auto_6455 ?auto_6459 ) ) ( not ( = ?auto_6440 ?auto_6444 ) ) ( not ( = ?auto_6440 ?auto_6452 ) ) ( not ( = ?auto_6441 ?auto_6444 ) ) ( not ( = ?auto_6441 ?auto_6452 ) ) ( not ( = ?auto_6442 ?auto_6444 ) ) ( not ( = ?auto_6442 ?auto_6452 ) ) ( not ( = ?auto_6444 ?auto_6455 ) ) ( not ( = ?auto_6444 ?auto_6460 ) ) ( not ( = ?auto_6444 ?auto_6459 ) ) ( not ( = ?auto_6447 ?auto_6457 ) ) ( not ( = ?auto_6447 ?auto_6453 ) ) ( not ( = ?auto_6447 ?auto_6461 ) ) ( not ( = ?auto_6450 ?auto_6456 ) ) ( not ( = ?auto_6450 ?auto_6458 ) ) ( not ( = ?auto_6450 ?auto_6454 ) ) ( not ( = ?auto_6452 ?auto_6455 ) ) ( not ( = ?auto_6452 ?auto_6460 ) ) ( not ( = ?auto_6452 ?auto_6459 ) ) ( not ( = ?auto_6440 ?auto_6445 ) ) ( not ( = ?auto_6440 ?auto_6451 ) ) ( not ( = ?auto_6441 ?auto_6445 ) ) ( not ( = ?auto_6441 ?auto_6451 ) ) ( not ( = ?auto_6442 ?auto_6445 ) ) ( not ( = ?auto_6442 ?auto_6451 ) ) ( not ( = ?auto_6443 ?auto_6445 ) ) ( not ( = ?auto_6443 ?auto_6451 ) ) ( not ( = ?auto_6445 ?auto_6452 ) ) ( not ( = ?auto_6445 ?auto_6455 ) ) ( not ( = ?auto_6445 ?auto_6460 ) ) ( not ( = ?auto_6445 ?auto_6459 ) ) ( not ( = ?auto_6451 ?auto_6452 ) ) ( not ( = ?auto_6451 ?auto_6455 ) ) ( not ( = ?auto_6451 ?auto_6460 ) ) ( not ( = ?auto_6451 ?auto_6459 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_6440 ?auto_6441 ?auto_6442 ?auto_6443 ?auto_6444 )
      ( MAKE-1CRATE ?auto_6444 ?auto_6445 )
      ( MAKE-5CRATE-VERIFY ?auto_6440 ?auto_6441 ?auto_6442 ?auto_6443 ?auto_6444 ?auto_6445 ) )
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
      ?auto_6486 - HOIST
      ?auto_6489 - PLACE
      ?auto_6490 - PLACE
      ?auto_6488 - HOIST
      ?auto_6487 - SURFACE
      ?auto_6493 - PLACE
      ?auto_6502 - HOIST
      ?auto_6498 - SURFACE
      ?auto_6494 - SURFACE
      ?auto_6496 - PLACE
      ?auto_6499 - HOIST
      ?auto_6495 - SURFACE
      ?auto_6492 - PLACE
      ?auto_6500 - HOIST
      ?auto_6501 - SURFACE
      ?auto_6497 - SURFACE
      ?auto_6491 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6486 ?auto_6489 ) ( IS-CRATE ?auto_6485 ) ( not ( = ?auto_6490 ?auto_6489 ) ) ( HOIST-AT ?auto_6488 ?auto_6490 ) ( SURFACE-AT ?auto_6485 ?auto_6490 ) ( ON ?auto_6485 ?auto_6487 ) ( CLEAR ?auto_6485 ) ( not ( = ?auto_6484 ?auto_6485 ) ) ( not ( = ?auto_6484 ?auto_6487 ) ) ( not ( = ?auto_6485 ?auto_6487 ) ) ( not ( = ?auto_6486 ?auto_6488 ) ) ( IS-CRATE ?auto_6484 ) ( not ( = ?auto_6493 ?auto_6489 ) ) ( HOIST-AT ?auto_6502 ?auto_6493 ) ( SURFACE-AT ?auto_6484 ?auto_6493 ) ( ON ?auto_6484 ?auto_6498 ) ( CLEAR ?auto_6484 ) ( not ( = ?auto_6483 ?auto_6484 ) ) ( not ( = ?auto_6483 ?auto_6498 ) ) ( not ( = ?auto_6484 ?auto_6498 ) ) ( not ( = ?auto_6486 ?auto_6502 ) ) ( IS-CRATE ?auto_6483 ) ( AVAILABLE ?auto_6502 ) ( SURFACE-AT ?auto_6483 ?auto_6493 ) ( ON ?auto_6483 ?auto_6494 ) ( CLEAR ?auto_6483 ) ( not ( = ?auto_6482 ?auto_6483 ) ) ( not ( = ?auto_6482 ?auto_6494 ) ) ( not ( = ?auto_6483 ?auto_6494 ) ) ( IS-CRATE ?auto_6482 ) ( not ( = ?auto_6496 ?auto_6489 ) ) ( HOIST-AT ?auto_6499 ?auto_6496 ) ( AVAILABLE ?auto_6499 ) ( SURFACE-AT ?auto_6482 ?auto_6496 ) ( ON ?auto_6482 ?auto_6495 ) ( CLEAR ?auto_6482 ) ( not ( = ?auto_6481 ?auto_6482 ) ) ( not ( = ?auto_6481 ?auto_6495 ) ) ( not ( = ?auto_6482 ?auto_6495 ) ) ( not ( = ?auto_6486 ?auto_6499 ) ) ( IS-CRATE ?auto_6481 ) ( not ( = ?auto_6492 ?auto_6489 ) ) ( HOIST-AT ?auto_6500 ?auto_6492 ) ( AVAILABLE ?auto_6500 ) ( SURFACE-AT ?auto_6481 ?auto_6492 ) ( ON ?auto_6481 ?auto_6501 ) ( CLEAR ?auto_6481 ) ( not ( = ?auto_6480 ?auto_6481 ) ) ( not ( = ?auto_6480 ?auto_6501 ) ) ( not ( = ?auto_6481 ?auto_6501 ) ) ( not ( = ?auto_6486 ?auto_6500 ) ) ( SURFACE-AT ?auto_6479 ?auto_6489 ) ( CLEAR ?auto_6479 ) ( IS-CRATE ?auto_6480 ) ( AVAILABLE ?auto_6486 ) ( AVAILABLE ?auto_6488 ) ( SURFACE-AT ?auto_6480 ?auto_6490 ) ( ON ?auto_6480 ?auto_6497 ) ( CLEAR ?auto_6480 ) ( TRUCK-AT ?auto_6491 ?auto_6489 ) ( not ( = ?auto_6479 ?auto_6480 ) ) ( not ( = ?auto_6479 ?auto_6497 ) ) ( not ( = ?auto_6480 ?auto_6497 ) ) ( not ( = ?auto_6479 ?auto_6481 ) ) ( not ( = ?auto_6479 ?auto_6501 ) ) ( not ( = ?auto_6481 ?auto_6497 ) ) ( not ( = ?auto_6492 ?auto_6490 ) ) ( not ( = ?auto_6500 ?auto_6488 ) ) ( not ( = ?auto_6501 ?auto_6497 ) ) ( not ( = ?auto_6479 ?auto_6482 ) ) ( not ( = ?auto_6479 ?auto_6495 ) ) ( not ( = ?auto_6480 ?auto_6482 ) ) ( not ( = ?auto_6480 ?auto_6495 ) ) ( not ( = ?auto_6482 ?auto_6501 ) ) ( not ( = ?auto_6482 ?auto_6497 ) ) ( not ( = ?auto_6496 ?auto_6492 ) ) ( not ( = ?auto_6496 ?auto_6490 ) ) ( not ( = ?auto_6499 ?auto_6500 ) ) ( not ( = ?auto_6499 ?auto_6488 ) ) ( not ( = ?auto_6495 ?auto_6501 ) ) ( not ( = ?auto_6495 ?auto_6497 ) ) ( not ( = ?auto_6479 ?auto_6483 ) ) ( not ( = ?auto_6479 ?auto_6494 ) ) ( not ( = ?auto_6480 ?auto_6483 ) ) ( not ( = ?auto_6480 ?auto_6494 ) ) ( not ( = ?auto_6481 ?auto_6483 ) ) ( not ( = ?auto_6481 ?auto_6494 ) ) ( not ( = ?auto_6483 ?auto_6495 ) ) ( not ( = ?auto_6483 ?auto_6501 ) ) ( not ( = ?auto_6483 ?auto_6497 ) ) ( not ( = ?auto_6493 ?auto_6496 ) ) ( not ( = ?auto_6493 ?auto_6492 ) ) ( not ( = ?auto_6493 ?auto_6490 ) ) ( not ( = ?auto_6502 ?auto_6499 ) ) ( not ( = ?auto_6502 ?auto_6500 ) ) ( not ( = ?auto_6502 ?auto_6488 ) ) ( not ( = ?auto_6494 ?auto_6495 ) ) ( not ( = ?auto_6494 ?auto_6501 ) ) ( not ( = ?auto_6494 ?auto_6497 ) ) ( not ( = ?auto_6479 ?auto_6484 ) ) ( not ( = ?auto_6479 ?auto_6498 ) ) ( not ( = ?auto_6480 ?auto_6484 ) ) ( not ( = ?auto_6480 ?auto_6498 ) ) ( not ( = ?auto_6481 ?auto_6484 ) ) ( not ( = ?auto_6481 ?auto_6498 ) ) ( not ( = ?auto_6482 ?auto_6484 ) ) ( not ( = ?auto_6482 ?auto_6498 ) ) ( not ( = ?auto_6484 ?auto_6494 ) ) ( not ( = ?auto_6484 ?auto_6495 ) ) ( not ( = ?auto_6484 ?auto_6501 ) ) ( not ( = ?auto_6484 ?auto_6497 ) ) ( not ( = ?auto_6498 ?auto_6494 ) ) ( not ( = ?auto_6498 ?auto_6495 ) ) ( not ( = ?auto_6498 ?auto_6501 ) ) ( not ( = ?auto_6498 ?auto_6497 ) ) ( not ( = ?auto_6479 ?auto_6485 ) ) ( not ( = ?auto_6479 ?auto_6487 ) ) ( not ( = ?auto_6480 ?auto_6485 ) ) ( not ( = ?auto_6480 ?auto_6487 ) ) ( not ( = ?auto_6481 ?auto_6485 ) ) ( not ( = ?auto_6481 ?auto_6487 ) ) ( not ( = ?auto_6482 ?auto_6485 ) ) ( not ( = ?auto_6482 ?auto_6487 ) ) ( not ( = ?auto_6483 ?auto_6485 ) ) ( not ( = ?auto_6483 ?auto_6487 ) ) ( not ( = ?auto_6485 ?auto_6498 ) ) ( not ( = ?auto_6485 ?auto_6494 ) ) ( not ( = ?auto_6485 ?auto_6495 ) ) ( not ( = ?auto_6485 ?auto_6501 ) ) ( not ( = ?auto_6485 ?auto_6497 ) ) ( not ( = ?auto_6487 ?auto_6498 ) ) ( not ( = ?auto_6487 ?auto_6494 ) ) ( not ( = ?auto_6487 ?auto_6495 ) ) ( not ( = ?auto_6487 ?auto_6501 ) ) ( not ( = ?auto_6487 ?auto_6497 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_6479 ?auto_6480 ?auto_6481 ?auto_6482 ?auto_6483 ?auto_6484 )
      ( MAKE-1CRATE ?auto_6484 ?auto_6485 )
      ( MAKE-6CRATE-VERIFY ?auto_6479 ?auto_6480 ?auto_6481 ?auto_6482 ?auto_6483 ?auto_6484 ?auto_6485 ) )
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
      ?auto_6527 - SURFACE
      ?auto_6528 - SURFACE
    )
    :vars
    (
      ?auto_6530 - HOIST
      ?auto_6531 - PLACE
      ?auto_6529 - PLACE
      ?auto_6532 - HOIST
      ?auto_6533 - SURFACE
      ?auto_6536 - SURFACE
      ?auto_6545 - PLACE
      ?auto_6544 - HOIST
      ?auto_6542 - SURFACE
      ?auto_6540 - SURFACE
      ?auto_6535 - PLACE
      ?auto_6537 - HOIST
      ?auto_6541 - SURFACE
      ?auto_6546 - PLACE
      ?auto_6543 - HOIST
      ?auto_6539 - SURFACE
      ?auto_6538 - SURFACE
      ?auto_6534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6530 ?auto_6531 ) ( IS-CRATE ?auto_6528 ) ( not ( = ?auto_6529 ?auto_6531 ) ) ( HOIST-AT ?auto_6532 ?auto_6529 ) ( SURFACE-AT ?auto_6528 ?auto_6529 ) ( ON ?auto_6528 ?auto_6533 ) ( CLEAR ?auto_6528 ) ( not ( = ?auto_6527 ?auto_6528 ) ) ( not ( = ?auto_6527 ?auto_6533 ) ) ( not ( = ?auto_6528 ?auto_6533 ) ) ( not ( = ?auto_6530 ?auto_6532 ) ) ( IS-CRATE ?auto_6527 ) ( SURFACE-AT ?auto_6527 ?auto_6529 ) ( ON ?auto_6527 ?auto_6536 ) ( CLEAR ?auto_6527 ) ( not ( = ?auto_6526 ?auto_6527 ) ) ( not ( = ?auto_6526 ?auto_6536 ) ) ( not ( = ?auto_6527 ?auto_6536 ) ) ( IS-CRATE ?auto_6526 ) ( not ( = ?auto_6545 ?auto_6531 ) ) ( HOIST-AT ?auto_6544 ?auto_6545 ) ( SURFACE-AT ?auto_6526 ?auto_6545 ) ( ON ?auto_6526 ?auto_6542 ) ( CLEAR ?auto_6526 ) ( not ( = ?auto_6525 ?auto_6526 ) ) ( not ( = ?auto_6525 ?auto_6542 ) ) ( not ( = ?auto_6526 ?auto_6542 ) ) ( not ( = ?auto_6530 ?auto_6544 ) ) ( IS-CRATE ?auto_6525 ) ( AVAILABLE ?auto_6544 ) ( SURFACE-AT ?auto_6525 ?auto_6545 ) ( ON ?auto_6525 ?auto_6540 ) ( CLEAR ?auto_6525 ) ( not ( = ?auto_6524 ?auto_6525 ) ) ( not ( = ?auto_6524 ?auto_6540 ) ) ( not ( = ?auto_6525 ?auto_6540 ) ) ( IS-CRATE ?auto_6524 ) ( not ( = ?auto_6535 ?auto_6531 ) ) ( HOIST-AT ?auto_6537 ?auto_6535 ) ( AVAILABLE ?auto_6537 ) ( SURFACE-AT ?auto_6524 ?auto_6535 ) ( ON ?auto_6524 ?auto_6541 ) ( CLEAR ?auto_6524 ) ( not ( = ?auto_6523 ?auto_6524 ) ) ( not ( = ?auto_6523 ?auto_6541 ) ) ( not ( = ?auto_6524 ?auto_6541 ) ) ( not ( = ?auto_6530 ?auto_6537 ) ) ( IS-CRATE ?auto_6523 ) ( not ( = ?auto_6546 ?auto_6531 ) ) ( HOIST-AT ?auto_6543 ?auto_6546 ) ( AVAILABLE ?auto_6543 ) ( SURFACE-AT ?auto_6523 ?auto_6546 ) ( ON ?auto_6523 ?auto_6539 ) ( CLEAR ?auto_6523 ) ( not ( = ?auto_6522 ?auto_6523 ) ) ( not ( = ?auto_6522 ?auto_6539 ) ) ( not ( = ?auto_6523 ?auto_6539 ) ) ( not ( = ?auto_6530 ?auto_6543 ) ) ( SURFACE-AT ?auto_6521 ?auto_6531 ) ( CLEAR ?auto_6521 ) ( IS-CRATE ?auto_6522 ) ( AVAILABLE ?auto_6530 ) ( AVAILABLE ?auto_6532 ) ( SURFACE-AT ?auto_6522 ?auto_6529 ) ( ON ?auto_6522 ?auto_6538 ) ( CLEAR ?auto_6522 ) ( TRUCK-AT ?auto_6534 ?auto_6531 ) ( not ( = ?auto_6521 ?auto_6522 ) ) ( not ( = ?auto_6521 ?auto_6538 ) ) ( not ( = ?auto_6522 ?auto_6538 ) ) ( not ( = ?auto_6521 ?auto_6523 ) ) ( not ( = ?auto_6521 ?auto_6539 ) ) ( not ( = ?auto_6523 ?auto_6538 ) ) ( not ( = ?auto_6546 ?auto_6529 ) ) ( not ( = ?auto_6543 ?auto_6532 ) ) ( not ( = ?auto_6539 ?auto_6538 ) ) ( not ( = ?auto_6521 ?auto_6524 ) ) ( not ( = ?auto_6521 ?auto_6541 ) ) ( not ( = ?auto_6522 ?auto_6524 ) ) ( not ( = ?auto_6522 ?auto_6541 ) ) ( not ( = ?auto_6524 ?auto_6539 ) ) ( not ( = ?auto_6524 ?auto_6538 ) ) ( not ( = ?auto_6535 ?auto_6546 ) ) ( not ( = ?auto_6535 ?auto_6529 ) ) ( not ( = ?auto_6537 ?auto_6543 ) ) ( not ( = ?auto_6537 ?auto_6532 ) ) ( not ( = ?auto_6541 ?auto_6539 ) ) ( not ( = ?auto_6541 ?auto_6538 ) ) ( not ( = ?auto_6521 ?auto_6525 ) ) ( not ( = ?auto_6521 ?auto_6540 ) ) ( not ( = ?auto_6522 ?auto_6525 ) ) ( not ( = ?auto_6522 ?auto_6540 ) ) ( not ( = ?auto_6523 ?auto_6525 ) ) ( not ( = ?auto_6523 ?auto_6540 ) ) ( not ( = ?auto_6525 ?auto_6541 ) ) ( not ( = ?auto_6525 ?auto_6539 ) ) ( not ( = ?auto_6525 ?auto_6538 ) ) ( not ( = ?auto_6545 ?auto_6535 ) ) ( not ( = ?auto_6545 ?auto_6546 ) ) ( not ( = ?auto_6545 ?auto_6529 ) ) ( not ( = ?auto_6544 ?auto_6537 ) ) ( not ( = ?auto_6544 ?auto_6543 ) ) ( not ( = ?auto_6544 ?auto_6532 ) ) ( not ( = ?auto_6540 ?auto_6541 ) ) ( not ( = ?auto_6540 ?auto_6539 ) ) ( not ( = ?auto_6540 ?auto_6538 ) ) ( not ( = ?auto_6521 ?auto_6526 ) ) ( not ( = ?auto_6521 ?auto_6542 ) ) ( not ( = ?auto_6522 ?auto_6526 ) ) ( not ( = ?auto_6522 ?auto_6542 ) ) ( not ( = ?auto_6523 ?auto_6526 ) ) ( not ( = ?auto_6523 ?auto_6542 ) ) ( not ( = ?auto_6524 ?auto_6526 ) ) ( not ( = ?auto_6524 ?auto_6542 ) ) ( not ( = ?auto_6526 ?auto_6540 ) ) ( not ( = ?auto_6526 ?auto_6541 ) ) ( not ( = ?auto_6526 ?auto_6539 ) ) ( not ( = ?auto_6526 ?auto_6538 ) ) ( not ( = ?auto_6542 ?auto_6540 ) ) ( not ( = ?auto_6542 ?auto_6541 ) ) ( not ( = ?auto_6542 ?auto_6539 ) ) ( not ( = ?auto_6542 ?auto_6538 ) ) ( not ( = ?auto_6521 ?auto_6527 ) ) ( not ( = ?auto_6521 ?auto_6536 ) ) ( not ( = ?auto_6522 ?auto_6527 ) ) ( not ( = ?auto_6522 ?auto_6536 ) ) ( not ( = ?auto_6523 ?auto_6527 ) ) ( not ( = ?auto_6523 ?auto_6536 ) ) ( not ( = ?auto_6524 ?auto_6527 ) ) ( not ( = ?auto_6524 ?auto_6536 ) ) ( not ( = ?auto_6525 ?auto_6527 ) ) ( not ( = ?auto_6525 ?auto_6536 ) ) ( not ( = ?auto_6527 ?auto_6542 ) ) ( not ( = ?auto_6527 ?auto_6540 ) ) ( not ( = ?auto_6527 ?auto_6541 ) ) ( not ( = ?auto_6527 ?auto_6539 ) ) ( not ( = ?auto_6527 ?auto_6538 ) ) ( not ( = ?auto_6536 ?auto_6542 ) ) ( not ( = ?auto_6536 ?auto_6540 ) ) ( not ( = ?auto_6536 ?auto_6541 ) ) ( not ( = ?auto_6536 ?auto_6539 ) ) ( not ( = ?auto_6536 ?auto_6538 ) ) ( not ( = ?auto_6521 ?auto_6528 ) ) ( not ( = ?auto_6521 ?auto_6533 ) ) ( not ( = ?auto_6522 ?auto_6528 ) ) ( not ( = ?auto_6522 ?auto_6533 ) ) ( not ( = ?auto_6523 ?auto_6528 ) ) ( not ( = ?auto_6523 ?auto_6533 ) ) ( not ( = ?auto_6524 ?auto_6528 ) ) ( not ( = ?auto_6524 ?auto_6533 ) ) ( not ( = ?auto_6525 ?auto_6528 ) ) ( not ( = ?auto_6525 ?auto_6533 ) ) ( not ( = ?auto_6526 ?auto_6528 ) ) ( not ( = ?auto_6526 ?auto_6533 ) ) ( not ( = ?auto_6528 ?auto_6536 ) ) ( not ( = ?auto_6528 ?auto_6542 ) ) ( not ( = ?auto_6528 ?auto_6540 ) ) ( not ( = ?auto_6528 ?auto_6541 ) ) ( not ( = ?auto_6528 ?auto_6539 ) ) ( not ( = ?auto_6528 ?auto_6538 ) ) ( not ( = ?auto_6533 ?auto_6536 ) ) ( not ( = ?auto_6533 ?auto_6542 ) ) ( not ( = ?auto_6533 ?auto_6540 ) ) ( not ( = ?auto_6533 ?auto_6541 ) ) ( not ( = ?auto_6533 ?auto_6539 ) ) ( not ( = ?auto_6533 ?auto_6538 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_6521 ?auto_6522 ?auto_6523 ?auto_6524 ?auto_6525 ?auto_6526 ?auto_6527 )
      ( MAKE-1CRATE ?auto_6527 ?auto_6528 )
      ( MAKE-7CRATE-VERIFY ?auto_6521 ?auto_6522 ?auto_6523 ?auto_6524 ?auto_6525 ?auto_6526 ?auto_6527 ?auto_6528 ) )
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
      ?auto_6572 - SURFACE
      ?auto_6573 - SURFACE
      ?auto_6574 - SURFACE
    )
    :vars
    (
      ?auto_6579 - HOIST
      ?auto_6577 - PLACE
      ?auto_6576 - PLACE
      ?auto_6575 - HOIST
      ?auto_6580 - SURFACE
      ?auto_6588 - PLACE
      ?auto_6591 - HOIST
      ?auto_6592 - SURFACE
      ?auto_6594 - SURFACE
      ?auto_6587 - PLACE
      ?auto_6593 - HOIST
      ?auto_6583 - SURFACE
      ?auto_6582 - SURFACE
      ?auto_6586 - PLACE
      ?auto_6590 - HOIST
      ?auto_6584 - SURFACE
      ?auto_6585 - PLACE
      ?auto_6581 - HOIST
      ?auto_6595 - SURFACE
      ?auto_6589 - SURFACE
      ?auto_6578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6579 ?auto_6577 ) ( IS-CRATE ?auto_6574 ) ( not ( = ?auto_6576 ?auto_6577 ) ) ( HOIST-AT ?auto_6575 ?auto_6576 ) ( AVAILABLE ?auto_6575 ) ( SURFACE-AT ?auto_6574 ?auto_6576 ) ( ON ?auto_6574 ?auto_6580 ) ( CLEAR ?auto_6574 ) ( not ( = ?auto_6573 ?auto_6574 ) ) ( not ( = ?auto_6573 ?auto_6580 ) ) ( not ( = ?auto_6574 ?auto_6580 ) ) ( not ( = ?auto_6579 ?auto_6575 ) ) ( IS-CRATE ?auto_6573 ) ( not ( = ?auto_6588 ?auto_6577 ) ) ( HOIST-AT ?auto_6591 ?auto_6588 ) ( SURFACE-AT ?auto_6573 ?auto_6588 ) ( ON ?auto_6573 ?auto_6592 ) ( CLEAR ?auto_6573 ) ( not ( = ?auto_6572 ?auto_6573 ) ) ( not ( = ?auto_6572 ?auto_6592 ) ) ( not ( = ?auto_6573 ?auto_6592 ) ) ( not ( = ?auto_6579 ?auto_6591 ) ) ( IS-CRATE ?auto_6572 ) ( SURFACE-AT ?auto_6572 ?auto_6588 ) ( ON ?auto_6572 ?auto_6594 ) ( CLEAR ?auto_6572 ) ( not ( = ?auto_6571 ?auto_6572 ) ) ( not ( = ?auto_6571 ?auto_6594 ) ) ( not ( = ?auto_6572 ?auto_6594 ) ) ( IS-CRATE ?auto_6571 ) ( not ( = ?auto_6587 ?auto_6577 ) ) ( HOIST-AT ?auto_6593 ?auto_6587 ) ( SURFACE-AT ?auto_6571 ?auto_6587 ) ( ON ?auto_6571 ?auto_6583 ) ( CLEAR ?auto_6571 ) ( not ( = ?auto_6570 ?auto_6571 ) ) ( not ( = ?auto_6570 ?auto_6583 ) ) ( not ( = ?auto_6571 ?auto_6583 ) ) ( not ( = ?auto_6579 ?auto_6593 ) ) ( IS-CRATE ?auto_6570 ) ( AVAILABLE ?auto_6593 ) ( SURFACE-AT ?auto_6570 ?auto_6587 ) ( ON ?auto_6570 ?auto_6582 ) ( CLEAR ?auto_6570 ) ( not ( = ?auto_6569 ?auto_6570 ) ) ( not ( = ?auto_6569 ?auto_6582 ) ) ( not ( = ?auto_6570 ?auto_6582 ) ) ( IS-CRATE ?auto_6569 ) ( not ( = ?auto_6586 ?auto_6577 ) ) ( HOIST-AT ?auto_6590 ?auto_6586 ) ( AVAILABLE ?auto_6590 ) ( SURFACE-AT ?auto_6569 ?auto_6586 ) ( ON ?auto_6569 ?auto_6584 ) ( CLEAR ?auto_6569 ) ( not ( = ?auto_6568 ?auto_6569 ) ) ( not ( = ?auto_6568 ?auto_6584 ) ) ( not ( = ?auto_6569 ?auto_6584 ) ) ( not ( = ?auto_6579 ?auto_6590 ) ) ( IS-CRATE ?auto_6568 ) ( not ( = ?auto_6585 ?auto_6577 ) ) ( HOIST-AT ?auto_6581 ?auto_6585 ) ( AVAILABLE ?auto_6581 ) ( SURFACE-AT ?auto_6568 ?auto_6585 ) ( ON ?auto_6568 ?auto_6595 ) ( CLEAR ?auto_6568 ) ( not ( = ?auto_6567 ?auto_6568 ) ) ( not ( = ?auto_6567 ?auto_6595 ) ) ( not ( = ?auto_6568 ?auto_6595 ) ) ( not ( = ?auto_6579 ?auto_6581 ) ) ( SURFACE-AT ?auto_6566 ?auto_6577 ) ( CLEAR ?auto_6566 ) ( IS-CRATE ?auto_6567 ) ( AVAILABLE ?auto_6579 ) ( AVAILABLE ?auto_6591 ) ( SURFACE-AT ?auto_6567 ?auto_6588 ) ( ON ?auto_6567 ?auto_6589 ) ( CLEAR ?auto_6567 ) ( TRUCK-AT ?auto_6578 ?auto_6577 ) ( not ( = ?auto_6566 ?auto_6567 ) ) ( not ( = ?auto_6566 ?auto_6589 ) ) ( not ( = ?auto_6567 ?auto_6589 ) ) ( not ( = ?auto_6566 ?auto_6568 ) ) ( not ( = ?auto_6566 ?auto_6595 ) ) ( not ( = ?auto_6568 ?auto_6589 ) ) ( not ( = ?auto_6585 ?auto_6588 ) ) ( not ( = ?auto_6581 ?auto_6591 ) ) ( not ( = ?auto_6595 ?auto_6589 ) ) ( not ( = ?auto_6566 ?auto_6569 ) ) ( not ( = ?auto_6566 ?auto_6584 ) ) ( not ( = ?auto_6567 ?auto_6569 ) ) ( not ( = ?auto_6567 ?auto_6584 ) ) ( not ( = ?auto_6569 ?auto_6595 ) ) ( not ( = ?auto_6569 ?auto_6589 ) ) ( not ( = ?auto_6586 ?auto_6585 ) ) ( not ( = ?auto_6586 ?auto_6588 ) ) ( not ( = ?auto_6590 ?auto_6581 ) ) ( not ( = ?auto_6590 ?auto_6591 ) ) ( not ( = ?auto_6584 ?auto_6595 ) ) ( not ( = ?auto_6584 ?auto_6589 ) ) ( not ( = ?auto_6566 ?auto_6570 ) ) ( not ( = ?auto_6566 ?auto_6582 ) ) ( not ( = ?auto_6567 ?auto_6570 ) ) ( not ( = ?auto_6567 ?auto_6582 ) ) ( not ( = ?auto_6568 ?auto_6570 ) ) ( not ( = ?auto_6568 ?auto_6582 ) ) ( not ( = ?auto_6570 ?auto_6584 ) ) ( not ( = ?auto_6570 ?auto_6595 ) ) ( not ( = ?auto_6570 ?auto_6589 ) ) ( not ( = ?auto_6587 ?auto_6586 ) ) ( not ( = ?auto_6587 ?auto_6585 ) ) ( not ( = ?auto_6587 ?auto_6588 ) ) ( not ( = ?auto_6593 ?auto_6590 ) ) ( not ( = ?auto_6593 ?auto_6581 ) ) ( not ( = ?auto_6593 ?auto_6591 ) ) ( not ( = ?auto_6582 ?auto_6584 ) ) ( not ( = ?auto_6582 ?auto_6595 ) ) ( not ( = ?auto_6582 ?auto_6589 ) ) ( not ( = ?auto_6566 ?auto_6571 ) ) ( not ( = ?auto_6566 ?auto_6583 ) ) ( not ( = ?auto_6567 ?auto_6571 ) ) ( not ( = ?auto_6567 ?auto_6583 ) ) ( not ( = ?auto_6568 ?auto_6571 ) ) ( not ( = ?auto_6568 ?auto_6583 ) ) ( not ( = ?auto_6569 ?auto_6571 ) ) ( not ( = ?auto_6569 ?auto_6583 ) ) ( not ( = ?auto_6571 ?auto_6582 ) ) ( not ( = ?auto_6571 ?auto_6584 ) ) ( not ( = ?auto_6571 ?auto_6595 ) ) ( not ( = ?auto_6571 ?auto_6589 ) ) ( not ( = ?auto_6583 ?auto_6582 ) ) ( not ( = ?auto_6583 ?auto_6584 ) ) ( not ( = ?auto_6583 ?auto_6595 ) ) ( not ( = ?auto_6583 ?auto_6589 ) ) ( not ( = ?auto_6566 ?auto_6572 ) ) ( not ( = ?auto_6566 ?auto_6594 ) ) ( not ( = ?auto_6567 ?auto_6572 ) ) ( not ( = ?auto_6567 ?auto_6594 ) ) ( not ( = ?auto_6568 ?auto_6572 ) ) ( not ( = ?auto_6568 ?auto_6594 ) ) ( not ( = ?auto_6569 ?auto_6572 ) ) ( not ( = ?auto_6569 ?auto_6594 ) ) ( not ( = ?auto_6570 ?auto_6572 ) ) ( not ( = ?auto_6570 ?auto_6594 ) ) ( not ( = ?auto_6572 ?auto_6583 ) ) ( not ( = ?auto_6572 ?auto_6582 ) ) ( not ( = ?auto_6572 ?auto_6584 ) ) ( not ( = ?auto_6572 ?auto_6595 ) ) ( not ( = ?auto_6572 ?auto_6589 ) ) ( not ( = ?auto_6594 ?auto_6583 ) ) ( not ( = ?auto_6594 ?auto_6582 ) ) ( not ( = ?auto_6594 ?auto_6584 ) ) ( not ( = ?auto_6594 ?auto_6595 ) ) ( not ( = ?auto_6594 ?auto_6589 ) ) ( not ( = ?auto_6566 ?auto_6573 ) ) ( not ( = ?auto_6566 ?auto_6592 ) ) ( not ( = ?auto_6567 ?auto_6573 ) ) ( not ( = ?auto_6567 ?auto_6592 ) ) ( not ( = ?auto_6568 ?auto_6573 ) ) ( not ( = ?auto_6568 ?auto_6592 ) ) ( not ( = ?auto_6569 ?auto_6573 ) ) ( not ( = ?auto_6569 ?auto_6592 ) ) ( not ( = ?auto_6570 ?auto_6573 ) ) ( not ( = ?auto_6570 ?auto_6592 ) ) ( not ( = ?auto_6571 ?auto_6573 ) ) ( not ( = ?auto_6571 ?auto_6592 ) ) ( not ( = ?auto_6573 ?auto_6594 ) ) ( not ( = ?auto_6573 ?auto_6583 ) ) ( not ( = ?auto_6573 ?auto_6582 ) ) ( not ( = ?auto_6573 ?auto_6584 ) ) ( not ( = ?auto_6573 ?auto_6595 ) ) ( not ( = ?auto_6573 ?auto_6589 ) ) ( not ( = ?auto_6592 ?auto_6594 ) ) ( not ( = ?auto_6592 ?auto_6583 ) ) ( not ( = ?auto_6592 ?auto_6582 ) ) ( not ( = ?auto_6592 ?auto_6584 ) ) ( not ( = ?auto_6592 ?auto_6595 ) ) ( not ( = ?auto_6592 ?auto_6589 ) ) ( not ( = ?auto_6566 ?auto_6574 ) ) ( not ( = ?auto_6566 ?auto_6580 ) ) ( not ( = ?auto_6567 ?auto_6574 ) ) ( not ( = ?auto_6567 ?auto_6580 ) ) ( not ( = ?auto_6568 ?auto_6574 ) ) ( not ( = ?auto_6568 ?auto_6580 ) ) ( not ( = ?auto_6569 ?auto_6574 ) ) ( not ( = ?auto_6569 ?auto_6580 ) ) ( not ( = ?auto_6570 ?auto_6574 ) ) ( not ( = ?auto_6570 ?auto_6580 ) ) ( not ( = ?auto_6571 ?auto_6574 ) ) ( not ( = ?auto_6571 ?auto_6580 ) ) ( not ( = ?auto_6572 ?auto_6574 ) ) ( not ( = ?auto_6572 ?auto_6580 ) ) ( not ( = ?auto_6574 ?auto_6592 ) ) ( not ( = ?auto_6574 ?auto_6594 ) ) ( not ( = ?auto_6574 ?auto_6583 ) ) ( not ( = ?auto_6574 ?auto_6582 ) ) ( not ( = ?auto_6574 ?auto_6584 ) ) ( not ( = ?auto_6574 ?auto_6595 ) ) ( not ( = ?auto_6574 ?auto_6589 ) ) ( not ( = ?auto_6576 ?auto_6588 ) ) ( not ( = ?auto_6576 ?auto_6587 ) ) ( not ( = ?auto_6576 ?auto_6586 ) ) ( not ( = ?auto_6576 ?auto_6585 ) ) ( not ( = ?auto_6575 ?auto_6591 ) ) ( not ( = ?auto_6575 ?auto_6593 ) ) ( not ( = ?auto_6575 ?auto_6590 ) ) ( not ( = ?auto_6575 ?auto_6581 ) ) ( not ( = ?auto_6580 ?auto_6592 ) ) ( not ( = ?auto_6580 ?auto_6594 ) ) ( not ( = ?auto_6580 ?auto_6583 ) ) ( not ( = ?auto_6580 ?auto_6582 ) ) ( not ( = ?auto_6580 ?auto_6584 ) ) ( not ( = ?auto_6580 ?auto_6595 ) ) ( not ( = ?auto_6580 ?auto_6589 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_6566 ?auto_6567 ?auto_6568 ?auto_6569 ?auto_6570 ?auto_6571 ?auto_6572 ?auto_6573 )
      ( MAKE-1CRATE ?auto_6573 ?auto_6574 )
      ( MAKE-8CRATE-VERIFY ?auto_6566 ?auto_6567 ?auto_6568 ?auto_6569 ?auto_6570 ?auto_6571 ?auto_6572 ?auto_6573 ?auto_6574 ) )
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
      ?auto_6622 - SURFACE
      ?auto_6623 - SURFACE
      ?auto_6624 - SURFACE
      ?auto_6625 - SURFACE
    )
    :vars
    (
      ?auto_6630 - HOIST
      ?auto_6626 - PLACE
      ?auto_6631 - PLACE
      ?auto_6627 - HOIST
      ?auto_6629 - SURFACE
      ?auto_6642 - PLACE
      ?auto_6632 - HOIST
      ?auto_6643 - SURFACE
      ?auto_6637 - PLACE
      ?auto_6635 - HOIST
      ?auto_6640 - SURFACE
      ?auto_6641 - SURFACE
      ?auto_6644 - PLACE
      ?auto_6639 - HOIST
      ?auto_6638 - SURFACE
      ?auto_6647 - SURFACE
      ?auto_6634 - SURFACE
      ?auto_6646 - PLACE
      ?auto_6633 - HOIST
      ?auto_6636 - SURFACE
      ?auto_6645 - SURFACE
      ?auto_6628 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6630 ?auto_6626 ) ( IS-CRATE ?auto_6625 ) ( not ( = ?auto_6631 ?auto_6626 ) ) ( HOIST-AT ?auto_6627 ?auto_6631 ) ( SURFACE-AT ?auto_6625 ?auto_6631 ) ( ON ?auto_6625 ?auto_6629 ) ( CLEAR ?auto_6625 ) ( not ( = ?auto_6624 ?auto_6625 ) ) ( not ( = ?auto_6624 ?auto_6629 ) ) ( not ( = ?auto_6625 ?auto_6629 ) ) ( not ( = ?auto_6630 ?auto_6627 ) ) ( IS-CRATE ?auto_6624 ) ( not ( = ?auto_6642 ?auto_6626 ) ) ( HOIST-AT ?auto_6632 ?auto_6642 ) ( AVAILABLE ?auto_6632 ) ( SURFACE-AT ?auto_6624 ?auto_6642 ) ( ON ?auto_6624 ?auto_6643 ) ( CLEAR ?auto_6624 ) ( not ( = ?auto_6623 ?auto_6624 ) ) ( not ( = ?auto_6623 ?auto_6643 ) ) ( not ( = ?auto_6624 ?auto_6643 ) ) ( not ( = ?auto_6630 ?auto_6632 ) ) ( IS-CRATE ?auto_6623 ) ( not ( = ?auto_6637 ?auto_6626 ) ) ( HOIST-AT ?auto_6635 ?auto_6637 ) ( SURFACE-AT ?auto_6623 ?auto_6637 ) ( ON ?auto_6623 ?auto_6640 ) ( CLEAR ?auto_6623 ) ( not ( = ?auto_6622 ?auto_6623 ) ) ( not ( = ?auto_6622 ?auto_6640 ) ) ( not ( = ?auto_6623 ?auto_6640 ) ) ( not ( = ?auto_6630 ?auto_6635 ) ) ( IS-CRATE ?auto_6622 ) ( SURFACE-AT ?auto_6622 ?auto_6637 ) ( ON ?auto_6622 ?auto_6641 ) ( CLEAR ?auto_6622 ) ( not ( = ?auto_6621 ?auto_6622 ) ) ( not ( = ?auto_6621 ?auto_6641 ) ) ( not ( = ?auto_6622 ?auto_6641 ) ) ( IS-CRATE ?auto_6621 ) ( not ( = ?auto_6644 ?auto_6626 ) ) ( HOIST-AT ?auto_6639 ?auto_6644 ) ( SURFACE-AT ?auto_6621 ?auto_6644 ) ( ON ?auto_6621 ?auto_6638 ) ( CLEAR ?auto_6621 ) ( not ( = ?auto_6620 ?auto_6621 ) ) ( not ( = ?auto_6620 ?auto_6638 ) ) ( not ( = ?auto_6621 ?auto_6638 ) ) ( not ( = ?auto_6630 ?auto_6639 ) ) ( IS-CRATE ?auto_6620 ) ( AVAILABLE ?auto_6639 ) ( SURFACE-AT ?auto_6620 ?auto_6644 ) ( ON ?auto_6620 ?auto_6647 ) ( CLEAR ?auto_6620 ) ( not ( = ?auto_6619 ?auto_6620 ) ) ( not ( = ?auto_6619 ?auto_6647 ) ) ( not ( = ?auto_6620 ?auto_6647 ) ) ( IS-CRATE ?auto_6619 ) ( AVAILABLE ?auto_6627 ) ( SURFACE-AT ?auto_6619 ?auto_6631 ) ( ON ?auto_6619 ?auto_6634 ) ( CLEAR ?auto_6619 ) ( not ( = ?auto_6618 ?auto_6619 ) ) ( not ( = ?auto_6618 ?auto_6634 ) ) ( not ( = ?auto_6619 ?auto_6634 ) ) ( IS-CRATE ?auto_6618 ) ( not ( = ?auto_6646 ?auto_6626 ) ) ( HOIST-AT ?auto_6633 ?auto_6646 ) ( AVAILABLE ?auto_6633 ) ( SURFACE-AT ?auto_6618 ?auto_6646 ) ( ON ?auto_6618 ?auto_6636 ) ( CLEAR ?auto_6618 ) ( not ( = ?auto_6617 ?auto_6618 ) ) ( not ( = ?auto_6617 ?auto_6636 ) ) ( not ( = ?auto_6618 ?auto_6636 ) ) ( not ( = ?auto_6630 ?auto_6633 ) ) ( SURFACE-AT ?auto_6616 ?auto_6626 ) ( CLEAR ?auto_6616 ) ( IS-CRATE ?auto_6617 ) ( AVAILABLE ?auto_6630 ) ( AVAILABLE ?auto_6635 ) ( SURFACE-AT ?auto_6617 ?auto_6637 ) ( ON ?auto_6617 ?auto_6645 ) ( CLEAR ?auto_6617 ) ( TRUCK-AT ?auto_6628 ?auto_6626 ) ( not ( = ?auto_6616 ?auto_6617 ) ) ( not ( = ?auto_6616 ?auto_6645 ) ) ( not ( = ?auto_6617 ?auto_6645 ) ) ( not ( = ?auto_6616 ?auto_6618 ) ) ( not ( = ?auto_6616 ?auto_6636 ) ) ( not ( = ?auto_6618 ?auto_6645 ) ) ( not ( = ?auto_6646 ?auto_6637 ) ) ( not ( = ?auto_6633 ?auto_6635 ) ) ( not ( = ?auto_6636 ?auto_6645 ) ) ( not ( = ?auto_6616 ?auto_6619 ) ) ( not ( = ?auto_6616 ?auto_6634 ) ) ( not ( = ?auto_6617 ?auto_6619 ) ) ( not ( = ?auto_6617 ?auto_6634 ) ) ( not ( = ?auto_6619 ?auto_6636 ) ) ( not ( = ?auto_6619 ?auto_6645 ) ) ( not ( = ?auto_6631 ?auto_6646 ) ) ( not ( = ?auto_6631 ?auto_6637 ) ) ( not ( = ?auto_6627 ?auto_6633 ) ) ( not ( = ?auto_6627 ?auto_6635 ) ) ( not ( = ?auto_6634 ?auto_6636 ) ) ( not ( = ?auto_6634 ?auto_6645 ) ) ( not ( = ?auto_6616 ?auto_6620 ) ) ( not ( = ?auto_6616 ?auto_6647 ) ) ( not ( = ?auto_6617 ?auto_6620 ) ) ( not ( = ?auto_6617 ?auto_6647 ) ) ( not ( = ?auto_6618 ?auto_6620 ) ) ( not ( = ?auto_6618 ?auto_6647 ) ) ( not ( = ?auto_6620 ?auto_6634 ) ) ( not ( = ?auto_6620 ?auto_6636 ) ) ( not ( = ?auto_6620 ?auto_6645 ) ) ( not ( = ?auto_6644 ?auto_6631 ) ) ( not ( = ?auto_6644 ?auto_6646 ) ) ( not ( = ?auto_6644 ?auto_6637 ) ) ( not ( = ?auto_6639 ?auto_6627 ) ) ( not ( = ?auto_6639 ?auto_6633 ) ) ( not ( = ?auto_6639 ?auto_6635 ) ) ( not ( = ?auto_6647 ?auto_6634 ) ) ( not ( = ?auto_6647 ?auto_6636 ) ) ( not ( = ?auto_6647 ?auto_6645 ) ) ( not ( = ?auto_6616 ?auto_6621 ) ) ( not ( = ?auto_6616 ?auto_6638 ) ) ( not ( = ?auto_6617 ?auto_6621 ) ) ( not ( = ?auto_6617 ?auto_6638 ) ) ( not ( = ?auto_6618 ?auto_6621 ) ) ( not ( = ?auto_6618 ?auto_6638 ) ) ( not ( = ?auto_6619 ?auto_6621 ) ) ( not ( = ?auto_6619 ?auto_6638 ) ) ( not ( = ?auto_6621 ?auto_6647 ) ) ( not ( = ?auto_6621 ?auto_6634 ) ) ( not ( = ?auto_6621 ?auto_6636 ) ) ( not ( = ?auto_6621 ?auto_6645 ) ) ( not ( = ?auto_6638 ?auto_6647 ) ) ( not ( = ?auto_6638 ?auto_6634 ) ) ( not ( = ?auto_6638 ?auto_6636 ) ) ( not ( = ?auto_6638 ?auto_6645 ) ) ( not ( = ?auto_6616 ?auto_6622 ) ) ( not ( = ?auto_6616 ?auto_6641 ) ) ( not ( = ?auto_6617 ?auto_6622 ) ) ( not ( = ?auto_6617 ?auto_6641 ) ) ( not ( = ?auto_6618 ?auto_6622 ) ) ( not ( = ?auto_6618 ?auto_6641 ) ) ( not ( = ?auto_6619 ?auto_6622 ) ) ( not ( = ?auto_6619 ?auto_6641 ) ) ( not ( = ?auto_6620 ?auto_6622 ) ) ( not ( = ?auto_6620 ?auto_6641 ) ) ( not ( = ?auto_6622 ?auto_6638 ) ) ( not ( = ?auto_6622 ?auto_6647 ) ) ( not ( = ?auto_6622 ?auto_6634 ) ) ( not ( = ?auto_6622 ?auto_6636 ) ) ( not ( = ?auto_6622 ?auto_6645 ) ) ( not ( = ?auto_6641 ?auto_6638 ) ) ( not ( = ?auto_6641 ?auto_6647 ) ) ( not ( = ?auto_6641 ?auto_6634 ) ) ( not ( = ?auto_6641 ?auto_6636 ) ) ( not ( = ?auto_6641 ?auto_6645 ) ) ( not ( = ?auto_6616 ?auto_6623 ) ) ( not ( = ?auto_6616 ?auto_6640 ) ) ( not ( = ?auto_6617 ?auto_6623 ) ) ( not ( = ?auto_6617 ?auto_6640 ) ) ( not ( = ?auto_6618 ?auto_6623 ) ) ( not ( = ?auto_6618 ?auto_6640 ) ) ( not ( = ?auto_6619 ?auto_6623 ) ) ( not ( = ?auto_6619 ?auto_6640 ) ) ( not ( = ?auto_6620 ?auto_6623 ) ) ( not ( = ?auto_6620 ?auto_6640 ) ) ( not ( = ?auto_6621 ?auto_6623 ) ) ( not ( = ?auto_6621 ?auto_6640 ) ) ( not ( = ?auto_6623 ?auto_6641 ) ) ( not ( = ?auto_6623 ?auto_6638 ) ) ( not ( = ?auto_6623 ?auto_6647 ) ) ( not ( = ?auto_6623 ?auto_6634 ) ) ( not ( = ?auto_6623 ?auto_6636 ) ) ( not ( = ?auto_6623 ?auto_6645 ) ) ( not ( = ?auto_6640 ?auto_6641 ) ) ( not ( = ?auto_6640 ?auto_6638 ) ) ( not ( = ?auto_6640 ?auto_6647 ) ) ( not ( = ?auto_6640 ?auto_6634 ) ) ( not ( = ?auto_6640 ?auto_6636 ) ) ( not ( = ?auto_6640 ?auto_6645 ) ) ( not ( = ?auto_6616 ?auto_6624 ) ) ( not ( = ?auto_6616 ?auto_6643 ) ) ( not ( = ?auto_6617 ?auto_6624 ) ) ( not ( = ?auto_6617 ?auto_6643 ) ) ( not ( = ?auto_6618 ?auto_6624 ) ) ( not ( = ?auto_6618 ?auto_6643 ) ) ( not ( = ?auto_6619 ?auto_6624 ) ) ( not ( = ?auto_6619 ?auto_6643 ) ) ( not ( = ?auto_6620 ?auto_6624 ) ) ( not ( = ?auto_6620 ?auto_6643 ) ) ( not ( = ?auto_6621 ?auto_6624 ) ) ( not ( = ?auto_6621 ?auto_6643 ) ) ( not ( = ?auto_6622 ?auto_6624 ) ) ( not ( = ?auto_6622 ?auto_6643 ) ) ( not ( = ?auto_6624 ?auto_6640 ) ) ( not ( = ?auto_6624 ?auto_6641 ) ) ( not ( = ?auto_6624 ?auto_6638 ) ) ( not ( = ?auto_6624 ?auto_6647 ) ) ( not ( = ?auto_6624 ?auto_6634 ) ) ( not ( = ?auto_6624 ?auto_6636 ) ) ( not ( = ?auto_6624 ?auto_6645 ) ) ( not ( = ?auto_6642 ?auto_6637 ) ) ( not ( = ?auto_6642 ?auto_6644 ) ) ( not ( = ?auto_6642 ?auto_6631 ) ) ( not ( = ?auto_6642 ?auto_6646 ) ) ( not ( = ?auto_6632 ?auto_6635 ) ) ( not ( = ?auto_6632 ?auto_6639 ) ) ( not ( = ?auto_6632 ?auto_6627 ) ) ( not ( = ?auto_6632 ?auto_6633 ) ) ( not ( = ?auto_6643 ?auto_6640 ) ) ( not ( = ?auto_6643 ?auto_6641 ) ) ( not ( = ?auto_6643 ?auto_6638 ) ) ( not ( = ?auto_6643 ?auto_6647 ) ) ( not ( = ?auto_6643 ?auto_6634 ) ) ( not ( = ?auto_6643 ?auto_6636 ) ) ( not ( = ?auto_6643 ?auto_6645 ) ) ( not ( = ?auto_6616 ?auto_6625 ) ) ( not ( = ?auto_6616 ?auto_6629 ) ) ( not ( = ?auto_6617 ?auto_6625 ) ) ( not ( = ?auto_6617 ?auto_6629 ) ) ( not ( = ?auto_6618 ?auto_6625 ) ) ( not ( = ?auto_6618 ?auto_6629 ) ) ( not ( = ?auto_6619 ?auto_6625 ) ) ( not ( = ?auto_6619 ?auto_6629 ) ) ( not ( = ?auto_6620 ?auto_6625 ) ) ( not ( = ?auto_6620 ?auto_6629 ) ) ( not ( = ?auto_6621 ?auto_6625 ) ) ( not ( = ?auto_6621 ?auto_6629 ) ) ( not ( = ?auto_6622 ?auto_6625 ) ) ( not ( = ?auto_6622 ?auto_6629 ) ) ( not ( = ?auto_6623 ?auto_6625 ) ) ( not ( = ?auto_6623 ?auto_6629 ) ) ( not ( = ?auto_6625 ?auto_6643 ) ) ( not ( = ?auto_6625 ?auto_6640 ) ) ( not ( = ?auto_6625 ?auto_6641 ) ) ( not ( = ?auto_6625 ?auto_6638 ) ) ( not ( = ?auto_6625 ?auto_6647 ) ) ( not ( = ?auto_6625 ?auto_6634 ) ) ( not ( = ?auto_6625 ?auto_6636 ) ) ( not ( = ?auto_6625 ?auto_6645 ) ) ( not ( = ?auto_6629 ?auto_6643 ) ) ( not ( = ?auto_6629 ?auto_6640 ) ) ( not ( = ?auto_6629 ?auto_6641 ) ) ( not ( = ?auto_6629 ?auto_6638 ) ) ( not ( = ?auto_6629 ?auto_6647 ) ) ( not ( = ?auto_6629 ?auto_6634 ) ) ( not ( = ?auto_6629 ?auto_6636 ) ) ( not ( = ?auto_6629 ?auto_6645 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_6616 ?auto_6617 ?auto_6618 ?auto_6619 ?auto_6620 ?auto_6621 ?auto_6622 ?auto_6623 ?auto_6624 )
      ( MAKE-1CRATE ?auto_6624 ?auto_6625 )
      ( MAKE-9CRATE-VERIFY ?auto_6616 ?auto_6617 ?auto_6618 ?auto_6619 ?auto_6620 ?auto_6621 ?auto_6622 ?auto_6623 ?auto_6624 ?auto_6625 ) )
  )

)

