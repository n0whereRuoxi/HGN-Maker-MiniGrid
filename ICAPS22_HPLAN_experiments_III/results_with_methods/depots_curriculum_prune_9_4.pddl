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
      ?auto_6351 - HOIST
      ?auto_6354 - PLACE
      ?auto_6352 - PLACE
      ?auto_6355 - HOIST
      ?auto_6350 - SURFACE
      ?auto_6357 - PLACE
      ?auto_6356 - HOIST
      ?auto_6358 - SURFACE
      ?auto_6353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6351 ?auto_6354 ) ( IS-CRATE ?auto_6349 ) ( not ( = ?auto_6352 ?auto_6354 ) ) ( HOIST-AT ?auto_6355 ?auto_6352 ) ( AVAILABLE ?auto_6355 ) ( SURFACE-AT ?auto_6349 ?auto_6352 ) ( ON ?auto_6349 ?auto_6350 ) ( CLEAR ?auto_6349 ) ( not ( = ?auto_6348 ?auto_6349 ) ) ( not ( = ?auto_6348 ?auto_6350 ) ) ( not ( = ?auto_6349 ?auto_6350 ) ) ( not ( = ?auto_6351 ?auto_6355 ) ) ( SURFACE-AT ?auto_6347 ?auto_6354 ) ( CLEAR ?auto_6347 ) ( IS-CRATE ?auto_6348 ) ( AVAILABLE ?auto_6351 ) ( not ( = ?auto_6357 ?auto_6354 ) ) ( HOIST-AT ?auto_6356 ?auto_6357 ) ( AVAILABLE ?auto_6356 ) ( SURFACE-AT ?auto_6348 ?auto_6357 ) ( ON ?auto_6348 ?auto_6358 ) ( CLEAR ?auto_6348 ) ( TRUCK-AT ?auto_6353 ?auto_6354 ) ( not ( = ?auto_6347 ?auto_6348 ) ) ( not ( = ?auto_6347 ?auto_6358 ) ) ( not ( = ?auto_6348 ?auto_6358 ) ) ( not ( = ?auto_6351 ?auto_6356 ) ) ( not ( = ?auto_6347 ?auto_6349 ) ) ( not ( = ?auto_6347 ?auto_6350 ) ) ( not ( = ?auto_6349 ?auto_6358 ) ) ( not ( = ?auto_6352 ?auto_6357 ) ) ( not ( = ?auto_6355 ?auto_6356 ) ) ( not ( = ?auto_6350 ?auto_6358 ) ) )
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
      ?auto_6379 - HOIST
      ?auto_6380 - PLACE
      ?auto_6381 - PLACE
      ?auto_6377 - HOIST
      ?auto_6378 - SURFACE
      ?auto_6385 - PLACE
      ?auto_6383 - HOIST
      ?auto_6384 - SURFACE
      ?auto_6388 - PLACE
      ?auto_6386 - HOIST
      ?auto_6387 - SURFACE
      ?auto_6382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6379 ?auto_6380 ) ( IS-CRATE ?auto_6376 ) ( not ( = ?auto_6381 ?auto_6380 ) ) ( HOIST-AT ?auto_6377 ?auto_6381 ) ( AVAILABLE ?auto_6377 ) ( SURFACE-AT ?auto_6376 ?auto_6381 ) ( ON ?auto_6376 ?auto_6378 ) ( CLEAR ?auto_6376 ) ( not ( = ?auto_6375 ?auto_6376 ) ) ( not ( = ?auto_6375 ?auto_6378 ) ) ( not ( = ?auto_6376 ?auto_6378 ) ) ( not ( = ?auto_6379 ?auto_6377 ) ) ( IS-CRATE ?auto_6375 ) ( not ( = ?auto_6385 ?auto_6380 ) ) ( HOIST-AT ?auto_6383 ?auto_6385 ) ( AVAILABLE ?auto_6383 ) ( SURFACE-AT ?auto_6375 ?auto_6385 ) ( ON ?auto_6375 ?auto_6384 ) ( CLEAR ?auto_6375 ) ( not ( = ?auto_6374 ?auto_6375 ) ) ( not ( = ?auto_6374 ?auto_6384 ) ) ( not ( = ?auto_6375 ?auto_6384 ) ) ( not ( = ?auto_6379 ?auto_6383 ) ) ( SURFACE-AT ?auto_6373 ?auto_6380 ) ( CLEAR ?auto_6373 ) ( IS-CRATE ?auto_6374 ) ( AVAILABLE ?auto_6379 ) ( not ( = ?auto_6388 ?auto_6380 ) ) ( HOIST-AT ?auto_6386 ?auto_6388 ) ( AVAILABLE ?auto_6386 ) ( SURFACE-AT ?auto_6374 ?auto_6388 ) ( ON ?auto_6374 ?auto_6387 ) ( CLEAR ?auto_6374 ) ( TRUCK-AT ?auto_6382 ?auto_6380 ) ( not ( = ?auto_6373 ?auto_6374 ) ) ( not ( = ?auto_6373 ?auto_6387 ) ) ( not ( = ?auto_6374 ?auto_6387 ) ) ( not ( = ?auto_6379 ?auto_6386 ) ) ( not ( = ?auto_6373 ?auto_6375 ) ) ( not ( = ?auto_6373 ?auto_6384 ) ) ( not ( = ?auto_6375 ?auto_6387 ) ) ( not ( = ?auto_6385 ?auto_6388 ) ) ( not ( = ?auto_6383 ?auto_6386 ) ) ( not ( = ?auto_6384 ?auto_6387 ) ) ( not ( = ?auto_6373 ?auto_6376 ) ) ( not ( = ?auto_6373 ?auto_6378 ) ) ( not ( = ?auto_6374 ?auto_6376 ) ) ( not ( = ?auto_6374 ?auto_6378 ) ) ( not ( = ?auto_6376 ?auto_6384 ) ) ( not ( = ?auto_6376 ?auto_6387 ) ) ( not ( = ?auto_6381 ?auto_6385 ) ) ( not ( = ?auto_6381 ?auto_6388 ) ) ( not ( = ?auto_6377 ?auto_6383 ) ) ( not ( = ?auto_6377 ?auto_6386 ) ) ( not ( = ?auto_6378 ?auto_6384 ) ) ( not ( = ?auto_6378 ?auto_6387 ) ) )
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
      ?auto_6413 - HOIST
      ?auto_6412 - PLACE
      ?auto_6409 - PLACE
      ?auto_6411 - HOIST
      ?auto_6414 - SURFACE
      ?auto_6415 - PLACE
      ?auto_6423 - HOIST
      ?auto_6422 - SURFACE
      ?auto_6421 - PLACE
      ?auto_6416 - HOIST
      ?auto_6417 - SURFACE
      ?auto_6420 - PLACE
      ?auto_6419 - HOIST
      ?auto_6418 - SURFACE
      ?auto_6410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6413 ?auto_6412 ) ( IS-CRATE ?auto_6408 ) ( not ( = ?auto_6409 ?auto_6412 ) ) ( HOIST-AT ?auto_6411 ?auto_6409 ) ( AVAILABLE ?auto_6411 ) ( SURFACE-AT ?auto_6408 ?auto_6409 ) ( ON ?auto_6408 ?auto_6414 ) ( CLEAR ?auto_6408 ) ( not ( = ?auto_6407 ?auto_6408 ) ) ( not ( = ?auto_6407 ?auto_6414 ) ) ( not ( = ?auto_6408 ?auto_6414 ) ) ( not ( = ?auto_6413 ?auto_6411 ) ) ( IS-CRATE ?auto_6407 ) ( not ( = ?auto_6415 ?auto_6412 ) ) ( HOIST-AT ?auto_6423 ?auto_6415 ) ( AVAILABLE ?auto_6423 ) ( SURFACE-AT ?auto_6407 ?auto_6415 ) ( ON ?auto_6407 ?auto_6422 ) ( CLEAR ?auto_6407 ) ( not ( = ?auto_6406 ?auto_6407 ) ) ( not ( = ?auto_6406 ?auto_6422 ) ) ( not ( = ?auto_6407 ?auto_6422 ) ) ( not ( = ?auto_6413 ?auto_6423 ) ) ( IS-CRATE ?auto_6406 ) ( not ( = ?auto_6421 ?auto_6412 ) ) ( HOIST-AT ?auto_6416 ?auto_6421 ) ( AVAILABLE ?auto_6416 ) ( SURFACE-AT ?auto_6406 ?auto_6421 ) ( ON ?auto_6406 ?auto_6417 ) ( CLEAR ?auto_6406 ) ( not ( = ?auto_6405 ?auto_6406 ) ) ( not ( = ?auto_6405 ?auto_6417 ) ) ( not ( = ?auto_6406 ?auto_6417 ) ) ( not ( = ?auto_6413 ?auto_6416 ) ) ( SURFACE-AT ?auto_6404 ?auto_6412 ) ( CLEAR ?auto_6404 ) ( IS-CRATE ?auto_6405 ) ( AVAILABLE ?auto_6413 ) ( not ( = ?auto_6420 ?auto_6412 ) ) ( HOIST-AT ?auto_6419 ?auto_6420 ) ( AVAILABLE ?auto_6419 ) ( SURFACE-AT ?auto_6405 ?auto_6420 ) ( ON ?auto_6405 ?auto_6418 ) ( CLEAR ?auto_6405 ) ( TRUCK-AT ?auto_6410 ?auto_6412 ) ( not ( = ?auto_6404 ?auto_6405 ) ) ( not ( = ?auto_6404 ?auto_6418 ) ) ( not ( = ?auto_6405 ?auto_6418 ) ) ( not ( = ?auto_6413 ?auto_6419 ) ) ( not ( = ?auto_6404 ?auto_6406 ) ) ( not ( = ?auto_6404 ?auto_6417 ) ) ( not ( = ?auto_6406 ?auto_6418 ) ) ( not ( = ?auto_6421 ?auto_6420 ) ) ( not ( = ?auto_6416 ?auto_6419 ) ) ( not ( = ?auto_6417 ?auto_6418 ) ) ( not ( = ?auto_6404 ?auto_6407 ) ) ( not ( = ?auto_6404 ?auto_6422 ) ) ( not ( = ?auto_6405 ?auto_6407 ) ) ( not ( = ?auto_6405 ?auto_6422 ) ) ( not ( = ?auto_6407 ?auto_6417 ) ) ( not ( = ?auto_6407 ?auto_6418 ) ) ( not ( = ?auto_6415 ?auto_6421 ) ) ( not ( = ?auto_6415 ?auto_6420 ) ) ( not ( = ?auto_6423 ?auto_6416 ) ) ( not ( = ?auto_6423 ?auto_6419 ) ) ( not ( = ?auto_6422 ?auto_6417 ) ) ( not ( = ?auto_6422 ?auto_6418 ) ) ( not ( = ?auto_6404 ?auto_6408 ) ) ( not ( = ?auto_6404 ?auto_6414 ) ) ( not ( = ?auto_6405 ?auto_6408 ) ) ( not ( = ?auto_6405 ?auto_6414 ) ) ( not ( = ?auto_6406 ?auto_6408 ) ) ( not ( = ?auto_6406 ?auto_6414 ) ) ( not ( = ?auto_6408 ?auto_6422 ) ) ( not ( = ?auto_6408 ?auto_6417 ) ) ( not ( = ?auto_6408 ?auto_6418 ) ) ( not ( = ?auto_6409 ?auto_6415 ) ) ( not ( = ?auto_6409 ?auto_6421 ) ) ( not ( = ?auto_6409 ?auto_6420 ) ) ( not ( = ?auto_6411 ?auto_6423 ) ) ( not ( = ?auto_6411 ?auto_6416 ) ) ( not ( = ?auto_6411 ?auto_6419 ) ) ( not ( = ?auto_6414 ?auto_6422 ) ) ( not ( = ?auto_6414 ?auto_6417 ) ) ( not ( = ?auto_6414 ?auto_6418 ) ) )
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
      ?auto_6447 - HOIST
      ?auto_6451 - PLACE
      ?auto_6449 - PLACE
      ?auto_6450 - HOIST
      ?auto_6446 - SURFACE
      ?auto_6457 - SURFACE
      ?auto_6453 - PLACE
      ?auto_6455 - HOIST
      ?auto_6454 - SURFACE
      ?auto_6452 - PLACE
      ?auto_6456 - HOIST
      ?auto_6458 - SURFACE
      ?auto_6460 - PLACE
      ?auto_6459 - HOIST
      ?auto_6461 - SURFACE
      ?auto_6448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6447 ?auto_6451 ) ( IS-CRATE ?auto_6445 ) ( not ( = ?auto_6449 ?auto_6451 ) ) ( HOIST-AT ?auto_6450 ?auto_6449 ) ( SURFACE-AT ?auto_6445 ?auto_6449 ) ( ON ?auto_6445 ?auto_6446 ) ( CLEAR ?auto_6445 ) ( not ( = ?auto_6444 ?auto_6445 ) ) ( not ( = ?auto_6444 ?auto_6446 ) ) ( not ( = ?auto_6445 ?auto_6446 ) ) ( not ( = ?auto_6447 ?auto_6450 ) ) ( IS-CRATE ?auto_6444 ) ( AVAILABLE ?auto_6450 ) ( SURFACE-AT ?auto_6444 ?auto_6449 ) ( ON ?auto_6444 ?auto_6457 ) ( CLEAR ?auto_6444 ) ( not ( = ?auto_6443 ?auto_6444 ) ) ( not ( = ?auto_6443 ?auto_6457 ) ) ( not ( = ?auto_6444 ?auto_6457 ) ) ( IS-CRATE ?auto_6443 ) ( not ( = ?auto_6453 ?auto_6451 ) ) ( HOIST-AT ?auto_6455 ?auto_6453 ) ( AVAILABLE ?auto_6455 ) ( SURFACE-AT ?auto_6443 ?auto_6453 ) ( ON ?auto_6443 ?auto_6454 ) ( CLEAR ?auto_6443 ) ( not ( = ?auto_6442 ?auto_6443 ) ) ( not ( = ?auto_6442 ?auto_6454 ) ) ( not ( = ?auto_6443 ?auto_6454 ) ) ( not ( = ?auto_6447 ?auto_6455 ) ) ( IS-CRATE ?auto_6442 ) ( not ( = ?auto_6452 ?auto_6451 ) ) ( HOIST-AT ?auto_6456 ?auto_6452 ) ( AVAILABLE ?auto_6456 ) ( SURFACE-AT ?auto_6442 ?auto_6452 ) ( ON ?auto_6442 ?auto_6458 ) ( CLEAR ?auto_6442 ) ( not ( = ?auto_6441 ?auto_6442 ) ) ( not ( = ?auto_6441 ?auto_6458 ) ) ( not ( = ?auto_6442 ?auto_6458 ) ) ( not ( = ?auto_6447 ?auto_6456 ) ) ( SURFACE-AT ?auto_6440 ?auto_6451 ) ( CLEAR ?auto_6440 ) ( IS-CRATE ?auto_6441 ) ( AVAILABLE ?auto_6447 ) ( not ( = ?auto_6460 ?auto_6451 ) ) ( HOIST-AT ?auto_6459 ?auto_6460 ) ( AVAILABLE ?auto_6459 ) ( SURFACE-AT ?auto_6441 ?auto_6460 ) ( ON ?auto_6441 ?auto_6461 ) ( CLEAR ?auto_6441 ) ( TRUCK-AT ?auto_6448 ?auto_6451 ) ( not ( = ?auto_6440 ?auto_6441 ) ) ( not ( = ?auto_6440 ?auto_6461 ) ) ( not ( = ?auto_6441 ?auto_6461 ) ) ( not ( = ?auto_6447 ?auto_6459 ) ) ( not ( = ?auto_6440 ?auto_6442 ) ) ( not ( = ?auto_6440 ?auto_6458 ) ) ( not ( = ?auto_6442 ?auto_6461 ) ) ( not ( = ?auto_6452 ?auto_6460 ) ) ( not ( = ?auto_6456 ?auto_6459 ) ) ( not ( = ?auto_6458 ?auto_6461 ) ) ( not ( = ?auto_6440 ?auto_6443 ) ) ( not ( = ?auto_6440 ?auto_6454 ) ) ( not ( = ?auto_6441 ?auto_6443 ) ) ( not ( = ?auto_6441 ?auto_6454 ) ) ( not ( = ?auto_6443 ?auto_6458 ) ) ( not ( = ?auto_6443 ?auto_6461 ) ) ( not ( = ?auto_6453 ?auto_6452 ) ) ( not ( = ?auto_6453 ?auto_6460 ) ) ( not ( = ?auto_6455 ?auto_6456 ) ) ( not ( = ?auto_6455 ?auto_6459 ) ) ( not ( = ?auto_6454 ?auto_6458 ) ) ( not ( = ?auto_6454 ?auto_6461 ) ) ( not ( = ?auto_6440 ?auto_6444 ) ) ( not ( = ?auto_6440 ?auto_6457 ) ) ( not ( = ?auto_6441 ?auto_6444 ) ) ( not ( = ?auto_6441 ?auto_6457 ) ) ( not ( = ?auto_6442 ?auto_6444 ) ) ( not ( = ?auto_6442 ?auto_6457 ) ) ( not ( = ?auto_6444 ?auto_6454 ) ) ( not ( = ?auto_6444 ?auto_6458 ) ) ( not ( = ?auto_6444 ?auto_6461 ) ) ( not ( = ?auto_6449 ?auto_6453 ) ) ( not ( = ?auto_6449 ?auto_6452 ) ) ( not ( = ?auto_6449 ?auto_6460 ) ) ( not ( = ?auto_6450 ?auto_6455 ) ) ( not ( = ?auto_6450 ?auto_6456 ) ) ( not ( = ?auto_6450 ?auto_6459 ) ) ( not ( = ?auto_6457 ?auto_6454 ) ) ( not ( = ?auto_6457 ?auto_6458 ) ) ( not ( = ?auto_6457 ?auto_6461 ) ) ( not ( = ?auto_6440 ?auto_6445 ) ) ( not ( = ?auto_6440 ?auto_6446 ) ) ( not ( = ?auto_6441 ?auto_6445 ) ) ( not ( = ?auto_6441 ?auto_6446 ) ) ( not ( = ?auto_6442 ?auto_6445 ) ) ( not ( = ?auto_6442 ?auto_6446 ) ) ( not ( = ?auto_6443 ?auto_6445 ) ) ( not ( = ?auto_6443 ?auto_6446 ) ) ( not ( = ?auto_6445 ?auto_6457 ) ) ( not ( = ?auto_6445 ?auto_6454 ) ) ( not ( = ?auto_6445 ?auto_6458 ) ) ( not ( = ?auto_6445 ?auto_6461 ) ) ( not ( = ?auto_6446 ?auto_6457 ) ) ( not ( = ?auto_6446 ?auto_6454 ) ) ( not ( = ?auto_6446 ?auto_6458 ) ) ( not ( = ?auto_6446 ?auto_6461 ) ) )
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
      ?auto_6490 - HOIST
      ?auto_6488 - PLACE
      ?auto_6491 - PLACE
      ?auto_6486 - HOIST
      ?auto_6487 - SURFACE
      ?auto_6495 - PLACE
      ?auto_6497 - HOIST
      ?auto_6496 - SURFACE
      ?auto_6499 - SURFACE
      ?auto_6494 - PLACE
      ?auto_6492 - HOIST
      ?auto_6498 - SURFACE
      ?auto_6502 - PLACE
      ?auto_6501 - HOIST
      ?auto_6500 - SURFACE
      ?auto_6493 - SURFACE
      ?auto_6489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6490 ?auto_6488 ) ( IS-CRATE ?auto_6485 ) ( not ( = ?auto_6491 ?auto_6488 ) ) ( HOIST-AT ?auto_6486 ?auto_6491 ) ( SURFACE-AT ?auto_6485 ?auto_6491 ) ( ON ?auto_6485 ?auto_6487 ) ( CLEAR ?auto_6485 ) ( not ( = ?auto_6484 ?auto_6485 ) ) ( not ( = ?auto_6484 ?auto_6487 ) ) ( not ( = ?auto_6485 ?auto_6487 ) ) ( not ( = ?auto_6490 ?auto_6486 ) ) ( IS-CRATE ?auto_6484 ) ( not ( = ?auto_6495 ?auto_6488 ) ) ( HOIST-AT ?auto_6497 ?auto_6495 ) ( SURFACE-AT ?auto_6484 ?auto_6495 ) ( ON ?auto_6484 ?auto_6496 ) ( CLEAR ?auto_6484 ) ( not ( = ?auto_6483 ?auto_6484 ) ) ( not ( = ?auto_6483 ?auto_6496 ) ) ( not ( = ?auto_6484 ?auto_6496 ) ) ( not ( = ?auto_6490 ?auto_6497 ) ) ( IS-CRATE ?auto_6483 ) ( AVAILABLE ?auto_6497 ) ( SURFACE-AT ?auto_6483 ?auto_6495 ) ( ON ?auto_6483 ?auto_6499 ) ( CLEAR ?auto_6483 ) ( not ( = ?auto_6482 ?auto_6483 ) ) ( not ( = ?auto_6482 ?auto_6499 ) ) ( not ( = ?auto_6483 ?auto_6499 ) ) ( IS-CRATE ?auto_6482 ) ( not ( = ?auto_6494 ?auto_6488 ) ) ( HOIST-AT ?auto_6492 ?auto_6494 ) ( AVAILABLE ?auto_6492 ) ( SURFACE-AT ?auto_6482 ?auto_6494 ) ( ON ?auto_6482 ?auto_6498 ) ( CLEAR ?auto_6482 ) ( not ( = ?auto_6481 ?auto_6482 ) ) ( not ( = ?auto_6481 ?auto_6498 ) ) ( not ( = ?auto_6482 ?auto_6498 ) ) ( not ( = ?auto_6490 ?auto_6492 ) ) ( IS-CRATE ?auto_6481 ) ( not ( = ?auto_6502 ?auto_6488 ) ) ( HOIST-AT ?auto_6501 ?auto_6502 ) ( AVAILABLE ?auto_6501 ) ( SURFACE-AT ?auto_6481 ?auto_6502 ) ( ON ?auto_6481 ?auto_6500 ) ( CLEAR ?auto_6481 ) ( not ( = ?auto_6480 ?auto_6481 ) ) ( not ( = ?auto_6480 ?auto_6500 ) ) ( not ( = ?auto_6481 ?auto_6500 ) ) ( not ( = ?auto_6490 ?auto_6501 ) ) ( SURFACE-AT ?auto_6479 ?auto_6488 ) ( CLEAR ?auto_6479 ) ( IS-CRATE ?auto_6480 ) ( AVAILABLE ?auto_6490 ) ( AVAILABLE ?auto_6486 ) ( SURFACE-AT ?auto_6480 ?auto_6491 ) ( ON ?auto_6480 ?auto_6493 ) ( CLEAR ?auto_6480 ) ( TRUCK-AT ?auto_6489 ?auto_6488 ) ( not ( = ?auto_6479 ?auto_6480 ) ) ( not ( = ?auto_6479 ?auto_6493 ) ) ( not ( = ?auto_6480 ?auto_6493 ) ) ( not ( = ?auto_6479 ?auto_6481 ) ) ( not ( = ?auto_6479 ?auto_6500 ) ) ( not ( = ?auto_6481 ?auto_6493 ) ) ( not ( = ?auto_6502 ?auto_6491 ) ) ( not ( = ?auto_6501 ?auto_6486 ) ) ( not ( = ?auto_6500 ?auto_6493 ) ) ( not ( = ?auto_6479 ?auto_6482 ) ) ( not ( = ?auto_6479 ?auto_6498 ) ) ( not ( = ?auto_6480 ?auto_6482 ) ) ( not ( = ?auto_6480 ?auto_6498 ) ) ( not ( = ?auto_6482 ?auto_6500 ) ) ( not ( = ?auto_6482 ?auto_6493 ) ) ( not ( = ?auto_6494 ?auto_6502 ) ) ( not ( = ?auto_6494 ?auto_6491 ) ) ( not ( = ?auto_6492 ?auto_6501 ) ) ( not ( = ?auto_6492 ?auto_6486 ) ) ( not ( = ?auto_6498 ?auto_6500 ) ) ( not ( = ?auto_6498 ?auto_6493 ) ) ( not ( = ?auto_6479 ?auto_6483 ) ) ( not ( = ?auto_6479 ?auto_6499 ) ) ( not ( = ?auto_6480 ?auto_6483 ) ) ( not ( = ?auto_6480 ?auto_6499 ) ) ( not ( = ?auto_6481 ?auto_6483 ) ) ( not ( = ?auto_6481 ?auto_6499 ) ) ( not ( = ?auto_6483 ?auto_6498 ) ) ( not ( = ?auto_6483 ?auto_6500 ) ) ( not ( = ?auto_6483 ?auto_6493 ) ) ( not ( = ?auto_6495 ?auto_6494 ) ) ( not ( = ?auto_6495 ?auto_6502 ) ) ( not ( = ?auto_6495 ?auto_6491 ) ) ( not ( = ?auto_6497 ?auto_6492 ) ) ( not ( = ?auto_6497 ?auto_6501 ) ) ( not ( = ?auto_6497 ?auto_6486 ) ) ( not ( = ?auto_6499 ?auto_6498 ) ) ( not ( = ?auto_6499 ?auto_6500 ) ) ( not ( = ?auto_6499 ?auto_6493 ) ) ( not ( = ?auto_6479 ?auto_6484 ) ) ( not ( = ?auto_6479 ?auto_6496 ) ) ( not ( = ?auto_6480 ?auto_6484 ) ) ( not ( = ?auto_6480 ?auto_6496 ) ) ( not ( = ?auto_6481 ?auto_6484 ) ) ( not ( = ?auto_6481 ?auto_6496 ) ) ( not ( = ?auto_6482 ?auto_6484 ) ) ( not ( = ?auto_6482 ?auto_6496 ) ) ( not ( = ?auto_6484 ?auto_6499 ) ) ( not ( = ?auto_6484 ?auto_6498 ) ) ( not ( = ?auto_6484 ?auto_6500 ) ) ( not ( = ?auto_6484 ?auto_6493 ) ) ( not ( = ?auto_6496 ?auto_6499 ) ) ( not ( = ?auto_6496 ?auto_6498 ) ) ( not ( = ?auto_6496 ?auto_6500 ) ) ( not ( = ?auto_6496 ?auto_6493 ) ) ( not ( = ?auto_6479 ?auto_6485 ) ) ( not ( = ?auto_6479 ?auto_6487 ) ) ( not ( = ?auto_6480 ?auto_6485 ) ) ( not ( = ?auto_6480 ?auto_6487 ) ) ( not ( = ?auto_6481 ?auto_6485 ) ) ( not ( = ?auto_6481 ?auto_6487 ) ) ( not ( = ?auto_6482 ?auto_6485 ) ) ( not ( = ?auto_6482 ?auto_6487 ) ) ( not ( = ?auto_6483 ?auto_6485 ) ) ( not ( = ?auto_6483 ?auto_6487 ) ) ( not ( = ?auto_6485 ?auto_6496 ) ) ( not ( = ?auto_6485 ?auto_6499 ) ) ( not ( = ?auto_6485 ?auto_6498 ) ) ( not ( = ?auto_6485 ?auto_6500 ) ) ( not ( = ?auto_6485 ?auto_6493 ) ) ( not ( = ?auto_6487 ?auto_6496 ) ) ( not ( = ?auto_6487 ?auto_6499 ) ) ( not ( = ?auto_6487 ?auto_6498 ) ) ( not ( = ?auto_6487 ?auto_6500 ) ) ( not ( = ?auto_6487 ?auto_6493 ) ) )
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
      ?auto_6533 - HOIST
      ?auto_6532 - PLACE
      ?auto_6534 - PLACE
      ?auto_6529 - HOIST
      ?auto_6530 - SURFACE
      ?auto_6538 - SURFACE
      ?auto_6546 - PLACE
      ?auto_6540 - HOIST
      ?auto_6537 - SURFACE
      ?auto_6541 - SURFACE
      ?auto_6536 - PLACE
      ?auto_6544 - HOIST
      ?auto_6543 - SURFACE
      ?auto_6545 - PLACE
      ?auto_6535 - HOIST
      ?auto_6539 - SURFACE
      ?auto_6542 - SURFACE
      ?auto_6531 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6533 ?auto_6532 ) ( IS-CRATE ?auto_6528 ) ( not ( = ?auto_6534 ?auto_6532 ) ) ( HOIST-AT ?auto_6529 ?auto_6534 ) ( SURFACE-AT ?auto_6528 ?auto_6534 ) ( ON ?auto_6528 ?auto_6530 ) ( CLEAR ?auto_6528 ) ( not ( = ?auto_6527 ?auto_6528 ) ) ( not ( = ?auto_6527 ?auto_6530 ) ) ( not ( = ?auto_6528 ?auto_6530 ) ) ( not ( = ?auto_6533 ?auto_6529 ) ) ( IS-CRATE ?auto_6527 ) ( SURFACE-AT ?auto_6527 ?auto_6534 ) ( ON ?auto_6527 ?auto_6538 ) ( CLEAR ?auto_6527 ) ( not ( = ?auto_6526 ?auto_6527 ) ) ( not ( = ?auto_6526 ?auto_6538 ) ) ( not ( = ?auto_6527 ?auto_6538 ) ) ( IS-CRATE ?auto_6526 ) ( not ( = ?auto_6546 ?auto_6532 ) ) ( HOIST-AT ?auto_6540 ?auto_6546 ) ( SURFACE-AT ?auto_6526 ?auto_6546 ) ( ON ?auto_6526 ?auto_6537 ) ( CLEAR ?auto_6526 ) ( not ( = ?auto_6525 ?auto_6526 ) ) ( not ( = ?auto_6525 ?auto_6537 ) ) ( not ( = ?auto_6526 ?auto_6537 ) ) ( not ( = ?auto_6533 ?auto_6540 ) ) ( IS-CRATE ?auto_6525 ) ( AVAILABLE ?auto_6540 ) ( SURFACE-AT ?auto_6525 ?auto_6546 ) ( ON ?auto_6525 ?auto_6541 ) ( CLEAR ?auto_6525 ) ( not ( = ?auto_6524 ?auto_6525 ) ) ( not ( = ?auto_6524 ?auto_6541 ) ) ( not ( = ?auto_6525 ?auto_6541 ) ) ( IS-CRATE ?auto_6524 ) ( not ( = ?auto_6536 ?auto_6532 ) ) ( HOIST-AT ?auto_6544 ?auto_6536 ) ( AVAILABLE ?auto_6544 ) ( SURFACE-AT ?auto_6524 ?auto_6536 ) ( ON ?auto_6524 ?auto_6543 ) ( CLEAR ?auto_6524 ) ( not ( = ?auto_6523 ?auto_6524 ) ) ( not ( = ?auto_6523 ?auto_6543 ) ) ( not ( = ?auto_6524 ?auto_6543 ) ) ( not ( = ?auto_6533 ?auto_6544 ) ) ( IS-CRATE ?auto_6523 ) ( not ( = ?auto_6545 ?auto_6532 ) ) ( HOIST-AT ?auto_6535 ?auto_6545 ) ( AVAILABLE ?auto_6535 ) ( SURFACE-AT ?auto_6523 ?auto_6545 ) ( ON ?auto_6523 ?auto_6539 ) ( CLEAR ?auto_6523 ) ( not ( = ?auto_6522 ?auto_6523 ) ) ( not ( = ?auto_6522 ?auto_6539 ) ) ( not ( = ?auto_6523 ?auto_6539 ) ) ( not ( = ?auto_6533 ?auto_6535 ) ) ( SURFACE-AT ?auto_6521 ?auto_6532 ) ( CLEAR ?auto_6521 ) ( IS-CRATE ?auto_6522 ) ( AVAILABLE ?auto_6533 ) ( AVAILABLE ?auto_6529 ) ( SURFACE-AT ?auto_6522 ?auto_6534 ) ( ON ?auto_6522 ?auto_6542 ) ( CLEAR ?auto_6522 ) ( TRUCK-AT ?auto_6531 ?auto_6532 ) ( not ( = ?auto_6521 ?auto_6522 ) ) ( not ( = ?auto_6521 ?auto_6542 ) ) ( not ( = ?auto_6522 ?auto_6542 ) ) ( not ( = ?auto_6521 ?auto_6523 ) ) ( not ( = ?auto_6521 ?auto_6539 ) ) ( not ( = ?auto_6523 ?auto_6542 ) ) ( not ( = ?auto_6545 ?auto_6534 ) ) ( not ( = ?auto_6535 ?auto_6529 ) ) ( not ( = ?auto_6539 ?auto_6542 ) ) ( not ( = ?auto_6521 ?auto_6524 ) ) ( not ( = ?auto_6521 ?auto_6543 ) ) ( not ( = ?auto_6522 ?auto_6524 ) ) ( not ( = ?auto_6522 ?auto_6543 ) ) ( not ( = ?auto_6524 ?auto_6539 ) ) ( not ( = ?auto_6524 ?auto_6542 ) ) ( not ( = ?auto_6536 ?auto_6545 ) ) ( not ( = ?auto_6536 ?auto_6534 ) ) ( not ( = ?auto_6544 ?auto_6535 ) ) ( not ( = ?auto_6544 ?auto_6529 ) ) ( not ( = ?auto_6543 ?auto_6539 ) ) ( not ( = ?auto_6543 ?auto_6542 ) ) ( not ( = ?auto_6521 ?auto_6525 ) ) ( not ( = ?auto_6521 ?auto_6541 ) ) ( not ( = ?auto_6522 ?auto_6525 ) ) ( not ( = ?auto_6522 ?auto_6541 ) ) ( not ( = ?auto_6523 ?auto_6525 ) ) ( not ( = ?auto_6523 ?auto_6541 ) ) ( not ( = ?auto_6525 ?auto_6543 ) ) ( not ( = ?auto_6525 ?auto_6539 ) ) ( not ( = ?auto_6525 ?auto_6542 ) ) ( not ( = ?auto_6546 ?auto_6536 ) ) ( not ( = ?auto_6546 ?auto_6545 ) ) ( not ( = ?auto_6546 ?auto_6534 ) ) ( not ( = ?auto_6540 ?auto_6544 ) ) ( not ( = ?auto_6540 ?auto_6535 ) ) ( not ( = ?auto_6540 ?auto_6529 ) ) ( not ( = ?auto_6541 ?auto_6543 ) ) ( not ( = ?auto_6541 ?auto_6539 ) ) ( not ( = ?auto_6541 ?auto_6542 ) ) ( not ( = ?auto_6521 ?auto_6526 ) ) ( not ( = ?auto_6521 ?auto_6537 ) ) ( not ( = ?auto_6522 ?auto_6526 ) ) ( not ( = ?auto_6522 ?auto_6537 ) ) ( not ( = ?auto_6523 ?auto_6526 ) ) ( not ( = ?auto_6523 ?auto_6537 ) ) ( not ( = ?auto_6524 ?auto_6526 ) ) ( not ( = ?auto_6524 ?auto_6537 ) ) ( not ( = ?auto_6526 ?auto_6541 ) ) ( not ( = ?auto_6526 ?auto_6543 ) ) ( not ( = ?auto_6526 ?auto_6539 ) ) ( not ( = ?auto_6526 ?auto_6542 ) ) ( not ( = ?auto_6537 ?auto_6541 ) ) ( not ( = ?auto_6537 ?auto_6543 ) ) ( not ( = ?auto_6537 ?auto_6539 ) ) ( not ( = ?auto_6537 ?auto_6542 ) ) ( not ( = ?auto_6521 ?auto_6527 ) ) ( not ( = ?auto_6521 ?auto_6538 ) ) ( not ( = ?auto_6522 ?auto_6527 ) ) ( not ( = ?auto_6522 ?auto_6538 ) ) ( not ( = ?auto_6523 ?auto_6527 ) ) ( not ( = ?auto_6523 ?auto_6538 ) ) ( not ( = ?auto_6524 ?auto_6527 ) ) ( not ( = ?auto_6524 ?auto_6538 ) ) ( not ( = ?auto_6525 ?auto_6527 ) ) ( not ( = ?auto_6525 ?auto_6538 ) ) ( not ( = ?auto_6527 ?auto_6537 ) ) ( not ( = ?auto_6527 ?auto_6541 ) ) ( not ( = ?auto_6527 ?auto_6543 ) ) ( not ( = ?auto_6527 ?auto_6539 ) ) ( not ( = ?auto_6527 ?auto_6542 ) ) ( not ( = ?auto_6538 ?auto_6537 ) ) ( not ( = ?auto_6538 ?auto_6541 ) ) ( not ( = ?auto_6538 ?auto_6543 ) ) ( not ( = ?auto_6538 ?auto_6539 ) ) ( not ( = ?auto_6538 ?auto_6542 ) ) ( not ( = ?auto_6521 ?auto_6528 ) ) ( not ( = ?auto_6521 ?auto_6530 ) ) ( not ( = ?auto_6522 ?auto_6528 ) ) ( not ( = ?auto_6522 ?auto_6530 ) ) ( not ( = ?auto_6523 ?auto_6528 ) ) ( not ( = ?auto_6523 ?auto_6530 ) ) ( not ( = ?auto_6524 ?auto_6528 ) ) ( not ( = ?auto_6524 ?auto_6530 ) ) ( not ( = ?auto_6525 ?auto_6528 ) ) ( not ( = ?auto_6525 ?auto_6530 ) ) ( not ( = ?auto_6526 ?auto_6528 ) ) ( not ( = ?auto_6526 ?auto_6530 ) ) ( not ( = ?auto_6528 ?auto_6538 ) ) ( not ( = ?auto_6528 ?auto_6537 ) ) ( not ( = ?auto_6528 ?auto_6541 ) ) ( not ( = ?auto_6528 ?auto_6543 ) ) ( not ( = ?auto_6528 ?auto_6539 ) ) ( not ( = ?auto_6528 ?auto_6542 ) ) ( not ( = ?auto_6530 ?auto_6538 ) ) ( not ( = ?auto_6530 ?auto_6537 ) ) ( not ( = ?auto_6530 ?auto_6541 ) ) ( not ( = ?auto_6530 ?auto_6543 ) ) ( not ( = ?auto_6530 ?auto_6539 ) ) ( not ( = ?auto_6530 ?auto_6542 ) ) )
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
      ?auto_6578 - HOIST
      ?auto_6580 - PLACE
      ?auto_6575 - PLACE
      ?auto_6576 - HOIST
      ?auto_6577 - SURFACE
      ?auto_6594 - PLACE
      ?auto_6589 - HOIST
      ?auto_6590 - SURFACE
      ?auto_6593 - SURFACE
      ?auto_6585 - PLACE
      ?auto_6592 - HOIST
      ?auto_6588 - SURFACE
      ?auto_6582 - SURFACE
      ?auto_6587 - PLACE
      ?auto_6586 - HOIST
      ?auto_6584 - SURFACE
      ?auto_6583 - PLACE
      ?auto_6581 - HOIST
      ?auto_6591 - SURFACE
      ?auto_6595 - SURFACE
      ?auto_6579 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6578 ?auto_6580 ) ( IS-CRATE ?auto_6574 ) ( not ( = ?auto_6575 ?auto_6580 ) ) ( HOIST-AT ?auto_6576 ?auto_6575 ) ( AVAILABLE ?auto_6576 ) ( SURFACE-AT ?auto_6574 ?auto_6575 ) ( ON ?auto_6574 ?auto_6577 ) ( CLEAR ?auto_6574 ) ( not ( = ?auto_6573 ?auto_6574 ) ) ( not ( = ?auto_6573 ?auto_6577 ) ) ( not ( = ?auto_6574 ?auto_6577 ) ) ( not ( = ?auto_6578 ?auto_6576 ) ) ( IS-CRATE ?auto_6573 ) ( not ( = ?auto_6594 ?auto_6580 ) ) ( HOIST-AT ?auto_6589 ?auto_6594 ) ( SURFACE-AT ?auto_6573 ?auto_6594 ) ( ON ?auto_6573 ?auto_6590 ) ( CLEAR ?auto_6573 ) ( not ( = ?auto_6572 ?auto_6573 ) ) ( not ( = ?auto_6572 ?auto_6590 ) ) ( not ( = ?auto_6573 ?auto_6590 ) ) ( not ( = ?auto_6578 ?auto_6589 ) ) ( IS-CRATE ?auto_6572 ) ( SURFACE-AT ?auto_6572 ?auto_6594 ) ( ON ?auto_6572 ?auto_6593 ) ( CLEAR ?auto_6572 ) ( not ( = ?auto_6571 ?auto_6572 ) ) ( not ( = ?auto_6571 ?auto_6593 ) ) ( not ( = ?auto_6572 ?auto_6593 ) ) ( IS-CRATE ?auto_6571 ) ( not ( = ?auto_6585 ?auto_6580 ) ) ( HOIST-AT ?auto_6592 ?auto_6585 ) ( SURFACE-AT ?auto_6571 ?auto_6585 ) ( ON ?auto_6571 ?auto_6588 ) ( CLEAR ?auto_6571 ) ( not ( = ?auto_6570 ?auto_6571 ) ) ( not ( = ?auto_6570 ?auto_6588 ) ) ( not ( = ?auto_6571 ?auto_6588 ) ) ( not ( = ?auto_6578 ?auto_6592 ) ) ( IS-CRATE ?auto_6570 ) ( AVAILABLE ?auto_6592 ) ( SURFACE-AT ?auto_6570 ?auto_6585 ) ( ON ?auto_6570 ?auto_6582 ) ( CLEAR ?auto_6570 ) ( not ( = ?auto_6569 ?auto_6570 ) ) ( not ( = ?auto_6569 ?auto_6582 ) ) ( not ( = ?auto_6570 ?auto_6582 ) ) ( IS-CRATE ?auto_6569 ) ( not ( = ?auto_6587 ?auto_6580 ) ) ( HOIST-AT ?auto_6586 ?auto_6587 ) ( AVAILABLE ?auto_6586 ) ( SURFACE-AT ?auto_6569 ?auto_6587 ) ( ON ?auto_6569 ?auto_6584 ) ( CLEAR ?auto_6569 ) ( not ( = ?auto_6568 ?auto_6569 ) ) ( not ( = ?auto_6568 ?auto_6584 ) ) ( not ( = ?auto_6569 ?auto_6584 ) ) ( not ( = ?auto_6578 ?auto_6586 ) ) ( IS-CRATE ?auto_6568 ) ( not ( = ?auto_6583 ?auto_6580 ) ) ( HOIST-AT ?auto_6581 ?auto_6583 ) ( AVAILABLE ?auto_6581 ) ( SURFACE-AT ?auto_6568 ?auto_6583 ) ( ON ?auto_6568 ?auto_6591 ) ( CLEAR ?auto_6568 ) ( not ( = ?auto_6567 ?auto_6568 ) ) ( not ( = ?auto_6567 ?auto_6591 ) ) ( not ( = ?auto_6568 ?auto_6591 ) ) ( not ( = ?auto_6578 ?auto_6581 ) ) ( SURFACE-AT ?auto_6566 ?auto_6580 ) ( CLEAR ?auto_6566 ) ( IS-CRATE ?auto_6567 ) ( AVAILABLE ?auto_6578 ) ( AVAILABLE ?auto_6589 ) ( SURFACE-AT ?auto_6567 ?auto_6594 ) ( ON ?auto_6567 ?auto_6595 ) ( CLEAR ?auto_6567 ) ( TRUCK-AT ?auto_6579 ?auto_6580 ) ( not ( = ?auto_6566 ?auto_6567 ) ) ( not ( = ?auto_6566 ?auto_6595 ) ) ( not ( = ?auto_6567 ?auto_6595 ) ) ( not ( = ?auto_6566 ?auto_6568 ) ) ( not ( = ?auto_6566 ?auto_6591 ) ) ( not ( = ?auto_6568 ?auto_6595 ) ) ( not ( = ?auto_6583 ?auto_6594 ) ) ( not ( = ?auto_6581 ?auto_6589 ) ) ( not ( = ?auto_6591 ?auto_6595 ) ) ( not ( = ?auto_6566 ?auto_6569 ) ) ( not ( = ?auto_6566 ?auto_6584 ) ) ( not ( = ?auto_6567 ?auto_6569 ) ) ( not ( = ?auto_6567 ?auto_6584 ) ) ( not ( = ?auto_6569 ?auto_6591 ) ) ( not ( = ?auto_6569 ?auto_6595 ) ) ( not ( = ?auto_6587 ?auto_6583 ) ) ( not ( = ?auto_6587 ?auto_6594 ) ) ( not ( = ?auto_6586 ?auto_6581 ) ) ( not ( = ?auto_6586 ?auto_6589 ) ) ( not ( = ?auto_6584 ?auto_6591 ) ) ( not ( = ?auto_6584 ?auto_6595 ) ) ( not ( = ?auto_6566 ?auto_6570 ) ) ( not ( = ?auto_6566 ?auto_6582 ) ) ( not ( = ?auto_6567 ?auto_6570 ) ) ( not ( = ?auto_6567 ?auto_6582 ) ) ( not ( = ?auto_6568 ?auto_6570 ) ) ( not ( = ?auto_6568 ?auto_6582 ) ) ( not ( = ?auto_6570 ?auto_6584 ) ) ( not ( = ?auto_6570 ?auto_6591 ) ) ( not ( = ?auto_6570 ?auto_6595 ) ) ( not ( = ?auto_6585 ?auto_6587 ) ) ( not ( = ?auto_6585 ?auto_6583 ) ) ( not ( = ?auto_6585 ?auto_6594 ) ) ( not ( = ?auto_6592 ?auto_6586 ) ) ( not ( = ?auto_6592 ?auto_6581 ) ) ( not ( = ?auto_6592 ?auto_6589 ) ) ( not ( = ?auto_6582 ?auto_6584 ) ) ( not ( = ?auto_6582 ?auto_6591 ) ) ( not ( = ?auto_6582 ?auto_6595 ) ) ( not ( = ?auto_6566 ?auto_6571 ) ) ( not ( = ?auto_6566 ?auto_6588 ) ) ( not ( = ?auto_6567 ?auto_6571 ) ) ( not ( = ?auto_6567 ?auto_6588 ) ) ( not ( = ?auto_6568 ?auto_6571 ) ) ( not ( = ?auto_6568 ?auto_6588 ) ) ( not ( = ?auto_6569 ?auto_6571 ) ) ( not ( = ?auto_6569 ?auto_6588 ) ) ( not ( = ?auto_6571 ?auto_6582 ) ) ( not ( = ?auto_6571 ?auto_6584 ) ) ( not ( = ?auto_6571 ?auto_6591 ) ) ( not ( = ?auto_6571 ?auto_6595 ) ) ( not ( = ?auto_6588 ?auto_6582 ) ) ( not ( = ?auto_6588 ?auto_6584 ) ) ( not ( = ?auto_6588 ?auto_6591 ) ) ( not ( = ?auto_6588 ?auto_6595 ) ) ( not ( = ?auto_6566 ?auto_6572 ) ) ( not ( = ?auto_6566 ?auto_6593 ) ) ( not ( = ?auto_6567 ?auto_6572 ) ) ( not ( = ?auto_6567 ?auto_6593 ) ) ( not ( = ?auto_6568 ?auto_6572 ) ) ( not ( = ?auto_6568 ?auto_6593 ) ) ( not ( = ?auto_6569 ?auto_6572 ) ) ( not ( = ?auto_6569 ?auto_6593 ) ) ( not ( = ?auto_6570 ?auto_6572 ) ) ( not ( = ?auto_6570 ?auto_6593 ) ) ( not ( = ?auto_6572 ?auto_6588 ) ) ( not ( = ?auto_6572 ?auto_6582 ) ) ( not ( = ?auto_6572 ?auto_6584 ) ) ( not ( = ?auto_6572 ?auto_6591 ) ) ( not ( = ?auto_6572 ?auto_6595 ) ) ( not ( = ?auto_6593 ?auto_6588 ) ) ( not ( = ?auto_6593 ?auto_6582 ) ) ( not ( = ?auto_6593 ?auto_6584 ) ) ( not ( = ?auto_6593 ?auto_6591 ) ) ( not ( = ?auto_6593 ?auto_6595 ) ) ( not ( = ?auto_6566 ?auto_6573 ) ) ( not ( = ?auto_6566 ?auto_6590 ) ) ( not ( = ?auto_6567 ?auto_6573 ) ) ( not ( = ?auto_6567 ?auto_6590 ) ) ( not ( = ?auto_6568 ?auto_6573 ) ) ( not ( = ?auto_6568 ?auto_6590 ) ) ( not ( = ?auto_6569 ?auto_6573 ) ) ( not ( = ?auto_6569 ?auto_6590 ) ) ( not ( = ?auto_6570 ?auto_6573 ) ) ( not ( = ?auto_6570 ?auto_6590 ) ) ( not ( = ?auto_6571 ?auto_6573 ) ) ( not ( = ?auto_6571 ?auto_6590 ) ) ( not ( = ?auto_6573 ?auto_6593 ) ) ( not ( = ?auto_6573 ?auto_6588 ) ) ( not ( = ?auto_6573 ?auto_6582 ) ) ( not ( = ?auto_6573 ?auto_6584 ) ) ( not ( = ?auto_6573 ?auto_6591 ) ) ( not ( = ?auto_6573 ?auto_6595 ) ) ( not ( = ?auto_6590 ?auto_6593 ) ) ( not ( = ?auto_6590 ?auto_6588 ) ) ( not ( = ?auto_6590 ?auto_6582 ) ) ( not ( = ?auto_6590 ?auto_6584 ) ) ( not ( = ?auto_6590 ?auto_6591 ) ) ( not ( = ?auto_6590 ?auto_6595 ) ) ( not ( = ?auto_6566 ?auto_6574 ) ) ( not ( = ?auto_6566 ?auto_6577 ) ) ( not ( = ?auto_6567 ?auto_6574 ) ) ( not ( = ?auto_6567 ?auto_6577 ) ) ( not ( = ?auto_6568 ?auto_6574 ) ) ( not ( = ?auto_6568 ?auto_6577 ) ) ( not ( = ?auto_6569 ?auto_6574 ) ) ( not ( = ?auto_6569 ?auto_6577 ) ) ( not ( = ?auto_6570 ?auto_6574 ) ) ( not ( = ?auto_6570 ?auto_6577 ) ) ( not ( = ?auto_6571 ?auto_6574 ) ) ( not ( = ?auto_6571 ?auto_6577 ) ) ( not ( = ?auto_6572 ?auto_6574 ) ) ( not ( = ?auto_6572 ?auto_6577 ) ) ( not ( = ?auto_6574 ?auto_6590 ) ) ( not ( = ?auto_6574 ?auto_6593 ) ) ( not ( = ?auto_6574 ?auto_6588 ) ) ( not ( = ?auto_6574 ?auto_6582 ) ) ( not ( = ?auto_6574 ?auto_6584 ) ) ( not ( = ?auto_6574 ?auto_6591 ) ) ( not ( = ?auto_6574 ?auto_6595 ) ) ( not ( = ?auto_6575 ?auto_6594 ) ) ( not ( = ?auto_6575 ?auto_6585 ) ) ( not ( = ?auto_6575 ?auto_6587 ) ) ( not ( = ?auto_6575 ?auto_6583 ) ) ( not ( = ?auto_6576 ?auto_6589 ) ) ( not ( = ?auto_6576 ?auto_6592 ) ) ( not ( = ?auto_6576 ?auto_6586 ) ) ( not ( = ?auto_6576 ?auto_6581 ) ) ( not ( = ?auto_6577 ?auto_6590 ) ) ( not ( = ?auto_6577 ?auto_6593 ) ) ( not ( = ?auto_6577 ?auto_6588 ) ) ( not ( = ?auto_6577 ?auto_6582 ) ) ( not ( = ?auto_6577 ?auto_6584 ) ) ( not ( = ?auto_6577 ?auto_6591 ) ) ( not ( = ?auto_6577 ?auto_6595 ) ) )
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
      ?auto_6629 - HOIST
      ?auto_6631 - PLACE
      ?auto_6630 - PLACE
      ?auto_6627 - HOIST
      ?auto_6628 - SURFACE
      ?auto_6642 - PLACE
      ?auto_6647 - HOIST
      ?auto_6638 - SURFACE
      ?auto_6641 - PLACE
      ?auto_6643 - HOIST
      ?auto_6639 - SURFACE
      ?auto_6646 - SURFACE
      ?auto_6632 - PLACE
      ?auto_6644 - HOIST
      ?auto_6635 - SURFACE
      ?auto_6634 - SURFACE
      ?auto_6637 - SURFACE
      ?auto_6636 - PLACE
      ?auto_6640 - HOIST
      ?auto_6633 - SURFACE
      ?auto_6645 - SURFACE
      ?auto_6626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_6629 ?auto_6631 ) ( IS-CRATE ?auto_6625 ) ( not ( = ?auto_6630 ?auto_6631 ) ) ( HOIST-AT ?auto_6627 ?auto_6630 ) ( SURFACE-AT ?auto_6625 ?auto_6630 ) ( ON ?auto_6625 ?auto_6628 ) ( CLEAR ?auto_6625 ) ( not ( = ?auto_6624 ?auto_6625 ) ) ( not ( = ?auto_6624 ?auto_6628 ) ) ( not ( = ?auto_6625 ?auto_6628 ) ) ( not ( = ?auto_6629 ?auto_6627 ) ) ( IS-CRATE ?auto_6624 ) ( not ( = ?auto_6642 ?auto_6631 ) ) ( HOIST-AT ?auto_6647 ?auto_6642 ) ( AVAILABLE ?auto_6647 ) ( SURFACE-AT ?auto_6624 ?auto_6642 ) ( ON ?auto_6624 ?auto_6638 ) ( CLEAR ?auto_6624 ) ( not ( = ?auto_6623 ?auto_6624 ) ) ( not ( = ?auto_6623 ?auto_6638 ) ) ( not ( = ?auto_6624 ?auto_6638 ) ) ( not ( = ?auto_6629 ?auto_6647 ) ) ( IS-CRATE ?auto_6623 ) ( not ( = ?auto_6641 ?auto_6631 ) ) ( HOIST-AT ?auto_6643 ?auto_6641 ) ( SURFACE-AT ?auto_6623 ?auto_6641 ) ( ON ?auto_6623 ?auto_6639 ) ( CLEAR ?auto_6623 ) ( not ( = ?auto_6622 ?auto_6623 ) ) ( not ( = ?auto_6622 ?auto_6639 ) ) ( not ( = ?auto_6623 ?auto_6639 ) ) ( not ( = ?auto_6629 ?auto_6643 ) ) ( IS-CRATE ?auto_6622 ) ( SURFACE-AT ?auto_6622 ?auto_6641 ) ( ON ?auto_6622 ?auto_6646 ) ( CLEAR ?auto_6622 ) ( not ( = ?auto_6621 ?auto_6622 ) ) ( not ( = ?auto_6621 ?auto_6646 ) ) ( not ( = ?auto_6622 ?auto_6646 ) ) ( IS-CRATE ?auto_6621 ) ( not ( = ?auto_6632 ?auto_6631 ) ) ( HOIST-AT ?auto_6644 ?auto_6632 ) ( SURFACE-AT ?auto_6621 ?auto_6632 ) ( ON ?auto_6621 ?auto_6635 ) ( CLEAR ?auto_6621 ) ( not ( = ?auto_6620 ?auto_6621 ) ) ( not ( = ?auto_6620 ?auto_6635 ) ) ( not ( = ?auto_6621 ?auto_6635 ) ) ( not ( = ?auto_6629 ?auto_6644 ) ) ( IS-CRATE ?auto_6620 ) ( AVAILABLE ?auto_6644 ) ( SURFACE-AT ?auto_6620 ?auto_6632 ) ( ON ?auto_6620 ?auto_6634 ) ( CLEAR ?auto_6620 ) ( not ( = ?auto_6619 ?auto_6620 ) ) ( not ( = ?auto_6619 ?auto_6634 ) ) ( not ( = ?auto_6620 ?auto_6634 ) ) ( IS-CRATE ?auto_6619 ) ( AVAILABLE ?auto_6627 ) ( SURFACE-AT ?auto_6619 ?auto_6630 ) ( ON ?auto_6619 ?auto_6637 ) ( CLEAR ?auto_6619 ) ( not ( = ?auto_6618 ?auto_6619 ) ) ( not ( = ?auto_6618 ?auto_6637 ) ) ( not ( = ?auto_6619 ?auto_6637 ) ) ( IS-CRATE ?auto_6618 ) ( not ( = ?auto_6636 ?auto_6631 ) ) ( HOIST-AT ?auto_6640 ?auto_6636 ) ( AVAILABLE ?auto_6640 ) ( SURFACE-AT ?auto_6618 ?auto_6636 ) ( ON ?auto_6618 ?auto_6633 ) ( CLEAR ?auto_6618 ) ( not ( = ?auto_6617 ?auto_6618 ) ) ( not ( = ?auto_6617 ?auto_6633 ) ) ( not ( = ?auto_6618 ?auto_6633 ) ) ( not ( = ?auto_6629 ?auto_6640 ) ) ( SURFACE-AT ?auto_6616 ?auto_6631 ) ( CLEAR ?auto_6616 ) ( IS-CRATE ?auto_6617 ) ( AVAILABLE ?auto_6629 ) ( AVAILABLE ?auto_6643 ) ( SURFACE-AT ?auto_6617 ?auto_6641 ) ( ON ?auto_6617 ?auto_6645 ) ( CLEAR ?auto_6617 ) ( TRUCK-AT ?auto_6626 ?auto_6631 ) ( not ( = ?auto_6616 ?auto_6617 ) ) ( not ( = ?auto_6616 ?auto_6645 ) ) ( not ( = ?auto_6617 ?auto_6645 ) ) ( not ( = ?auto_6616 ?auto_6618 ) ) ( not ( = ?auto_6616 ?auto_6633 ) ) ( not ( = ?auto_6618 ?auto_6645 ) ) ( not ( = ?auto_6636 ?auto_6641 ) ) ( not ( = ?auto_6640 ?auto_6643 ) ) ( not ( = ?auto_6633 ?auto_6645 ) ) ( not ( = ?auto_6616 ?auto_6619 ) ) ( not ( = ?auto_6616 ?auto_6637 ) ) ( not ( = ?auto_6617 ?auto_6619 ) ) ( not ( = ?auto_6617 ?auto_6637 ) ) ( not ( = ?auto_6619 ?auto_6633 ) ) ( not ( = ?auto_6619 ?auto_6645 ) ) ( not ( = ?auto_6630 ?auto_6636 ) ) ( not ( = ?auto_6630 ?auto_6641 ) ) ( not ( = ?auto_6627 ?auto_6640 ) ) ( not ( = ?auto_6627 ?auto_6643 ) ) ( not ( = ?auto_6637 ?auto_6633 ) ) ( not ( = ?auto_6637 ?auto_6645 ) ) ( not ( = ?auto_6616 ?auto_6620 ) ) ( not ( = ?auto_6616 ?auto_6634 ) ) ( not ( = ?auto_6617 ?auto_6620 ) ) ( not ( = ?auto_6617 ?auto_6634 ) ) ( not ( = ?auto_6618 ?auto_6620 ) ) ( not ( = ?auto_6618 ?auto_6634 ) ) ( not ( = ?auto_6620 ?auto_6637 ) ) ( not ( = ?auto_6620 ?auto_6633 ) ) ( not ( = ?auto_6620 ?auto_6645 ) ) ( not ( = ?auto_6632 ?auto_6630 ) ) ( not ( = ?auto_6632 ?auto_6636 ) ) ( not ( = ?auto_6632 ?auto_6641 ) ) ( not ( = ?auto_6644 ?auto_6627 ) ) ( not ( = ?auto_6644 ?auto_6640 ) ) ( not ( = ?auto_6644 ?auto_6643 ) ) ( not ( = ?auto_6634 ?auto_6637 ) ) ( not ( = ?auto_6634 ?auto_6633 ) ) ( not ( = ?auto_6634 ?auto_6645 ) ) ( not ( = ?auto_6616 ?auto_6621 ) ) ( not ( = ?auto_6616 ?auto_6635 ) ) ( not ( = ?auto_6617 ?auto_6621 ) ) ( not ( = ?auto_6617 ?auto_6635 ) ) ( not ( = ?auto_6618 ?auto_6621 ) ) ( not ( = ?auto_6618 ?auto_6635 ) ) ( not ( = ?auto_6619 ?auto_6621 ) ) ( not ( = ?auto_6619 ?auto_6635 ) ) ( not ( = ?auto_6621 ?auto_6634 ) ) ( not ( = ?auto_6621 ?auto_6637 ) ) ( not ( = ?auto_6621 ?auto_6633 ) ) ( not ( = ?auto_6621 ?auto_6645 ) ) ( not ( = ?auto_6635 ?auto_6634 ) ) ( not ( = ?auto_6635 ?auto_6637 ) ) ( not ( = ?auto_6635 ?auto_6633 ) ) ( not ( = ?auto_6635 ?auto_6645 ) ) ( not ( = ?auto_6616 ?auto_6622 ) ) ( not ( = ?auto_6616 ?auto_6646 ) ) ( not ( = ?auto_6617 ?auto_6622 ) ) ( not ( = ?auto_6617 ?auto_6646 ) ) ( not ( = ?auto_6618 ?auto_6622 ) ) ( not ( = ?auto_6618 ?auto_6646 ) ) ( not ( = ?auto_6619 ?auto_6622 ) ) ( not ( = ?auto_6619 ?auto_6646 ) ) ( not ( = ?auto_6620 ?auto_6622 ) ) ( not ( = ?auto_6620 ?auto_6646 ) ) ( not ( = ?auto_6622 ?auto_6635 ) ) ( not ( = ?auto_6622 ?auto_6634 ) ) ( not ( = ?auto_6622 ?auto_6637 ) ) ( not ( = ?auto_6622 ?auto_6633 ) ) ( not ( = ?auto_6622 ?auto_6645 ) ) ( not ( = ?auto_6646 ?auto_6635 ) ) ( not ( = ?auto_6646 ?auto_6634 ) ) ( not ( = ?auto_6646 ?auto_6637 ) ) ( not ( = ?auto_6646 ?auto_6633 ) ) ( not ( = ?auto_6646 ?auto_6645 ) ) ( not ( = ?auto_6616 ?auto_6623 ) ) ( not ( = ?auto_6616 ?auto_6639 ) ) ( not ( = ?auto_6617 ?auto_6623 ) ) ( not ( = ?auto_6617 ?auto_6639 ) ) ( not ( = ?auto_6618 ?auto_6623 ) ) ( not ( = ?auto_6618 ?auto_6639 ) ) ( not ( = ?auto_6619 ?auto_6623 ) ) ( not ( = ?auto_6619 ?auto_6639 ) ) ( not ( = ?auto_6620 ?auto_6623 ) ) ( not ( = ?auto_6620 ?auto_6639 ) ) ( not ( = ?auto_6621 ?auto_6623 ) ) ( not ( = ?auto_6621 ?auto_6639 ) ) ( not ( = ?auto_6623 ?auto_6646 ) ) ( not ( = ?auto_6623 ?auto_6635 ) ) ( not ( = ?auto_6623 ?auto_6634 ) ) ( not ( = ?auto_6623 ?auto_6637 ) ) ( not ( = ?auto_6623 ?auto_6633 ) ) ( not ( = ?auto_6623 ?auto_6645 ) ) ( not ( = ?auto_6639 ?auto_6646 ) ) ( not ( = ?auto_6639 ?auto_6635 ) ) ( not ( = ?auto_6639 ?auto_6634 ) ) ( not ( = ?auto_6639 ?auto_6637 ) ) ( not ( = ?auto_6639 ?auto_6633 ) ) ( not ( = ?auto_6639 ?auto_6645 ) ) ( not ( = ?auto_6616 ?auto_6624 ) ) ( not ( = ?auto_6616 ?auto_6638 ) ) ( not ( = ?auto_6617 ?auto_6624 ) ) ( not ( = ?auto_6617 ?auto_6638 ) ) ( not ( = ?auto_6618 ?auto_6624 ) ) ( not ( = ?auto_6618 ?auto_6638 ) ) ( not ( = ?auto_6619 ?auto_6624 ) ) ( not ( = ?auto_6619 ?auto_6638 ) ) ( not ( = ?auto_6620 ?auto_6624 ) ) ( not ( = ?auto_6620 ?auto_6638 ) ) ( not ( = ?auto_6621 ?auto_6624 ) ) ( not ( = ?auto_6621 ?auto_6638 ) ) ( not ( = ?auto_6622 ?auto_6624 ) ) ( not ( = ?auto_6622 ?auto_6638 ) ) ( not ( = ?auto_6624 ?auto_6639 ) ) ( not ( = ?auto_6624 ?auto_6646 ) ) ( not ( = ?auto_6624 ?auto_6635 ) ) ( not ( = ?auto_6624 ?auto_6634 ) ) ( not ( = ?auto_6624 ?auto_6637 ) ) ( not ( = ?auto_6624 ?auto_6633 ) ) ( not ( = ?auto_6624 ?auto_6645 ) ) ( not ( = ?auto_6642 ?auto_6641 ) ) ( not ( = ?auto_6642 ?auto_6632 ) ) ( not ( = ?auto_6642 ?auto_6630 ) ) ( not ( = ?auto_6642 ?auto_6636 ) ) ( not ( = ?auto_6647 ?auto_6643 ) ) ( not ( = ?auto_6647 ?auto_6644 ) ) ( not ( = ?auto_6647 ?auto_6627 ) ) ( not ( = ?auto_6647 ?auto_6640 ) ) ( not ( = ?auto_6638 ?auto_6639 ) ) ( not ( = ?auto_6638 ?auto_6646 ) ) ( not ( = ?auto_6638 ?auto_6635 ) ) ( not ( = ?auto_6638 ?auto_6634 ) ) ( not ( = ?auto_6638 ?auto_6637 ) ) ( not ( = ?auto_6638 ?auto_6633 ) ) ( not ( = ?auto_6638 ?auto_6645 ) ) ( not ( = ?auto_6616 ?auto_6625 ) ) ( not ( = ?auto_6616 ?auto_6628 ) ) ( not ( = ?auto_6617 ?auto_6625 ) ) ( not ( = ?auto_6617 ?auto_6628 ) ) ( not ( = ?auto_6618 ?auto_6625 ) ) ( not ( = ?auto_6618 ?auto_6628 ) ) ( not ( = ?auto_6619 ?auto_6625 ) ) ( not ( = ?auto_6619 ?auto_6628 ) ) ( not ( = ?auto_6620 ?auto_6625 ) ) ( not ( = ?auto_6620 ?auto_6628 ) ) ( not ( = ?auto_6621 ?auto_6625 ) ) ( not ( = ?auto_6621 ?auto_6628 ) ) ( not ( = ?auto_6622 ?auto_6625 ) ) ( not ( = ?auto_6622 ?auto_6628 ) ) ( not ( = ?auto_6623 ?auto_6625 ) ) ( not ( = ?auto_6623 ?auto_6628 ) ) ( not ( = ?auto_6625 ?auto_6638 ) ) ( not ( = ?auto_6625 ?auto_6639 ) ) ( not ( = ?auto_6625 ?auto_6646 ) ) ( not ( = ?auto_6625 ?auto_6635 ) ) ( not ( = ?auto_6625 ?auto_6634 ) ) ( not ( = ?auto_6625 ?auto_6637 ) ) ( not ( = ?auto_6625 ?auto_6633 ) ) ( not ( = ?auto_6625 ?auto_6645 ) ) ( not ( = ?auto_6628 ?auto_6638 ) ) ( not ( = ?auto_6628 ?auto_6639 ) ) ( not ( = ?auto_6628 ?auto_6646 ) ) ( not ( = ?auto_6628 ?auto_6635 ) ) ( not ( = ?auto_6628 ?auto_6634 ) ) ( not ( = ?auto_6628 ?auto_6637 ) ) ( not ( = ?auto_6628 ?auto_6633 ) ) ( not ( = ?auto_6628 ?auto_6645 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_6616 ?auto_6617 ?auto_6618 ?auto_6619 ?auto_6620 ?auto_6621 ?auto_6622 ?auto_6623 ?auto_6624 )
      ( MAKE-1CRATE ?auto_6624 ?auto_6625 )
      ( MAKE-9CRATE-VERIFY ?auto_6616 ?auto_6617 ?auto_6618 ?auto_6619 ?auto_6620 ?auto_6621 ?auto_6622 ?auto_6623 ?auto_6624 ?auto_6625 ) )
  )

)

