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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11374 - SURFACE
      ?auto_11375 - SURFACE
    )
    :vars
    (
      ?auto_11376 - HOIST
      ?auto_11377 - PLACE
      ?auto_11379 - PLACE
      ?auto_11380 - HOIST
      ?auto_11381 - SURFACE
      ?auto_11378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11376 ?auto_11377 ) ( SURFACE-AT ?auto_11374 ?auto_11377 ) ( CLEAR ?auto_11374 ) ( IS-CRATE ?auto_11375 ) ( AVAILABLE ?auto_11376 ) ( not ( = ?auto_11379 ?auto_11377 ) ) ( HOIST-AT ?auto_11380 ?auto_11379 ) ( AVAILABLE ?auto_11380 ) ( SURFACE-AT ?auto_11375 ?auto_11379 ) ( ON ?auto_11375 ?auto_11381 ) ( CLEAR ?auto_11375 ) ( TRUCK-AT ?auto_11378 ?auto_11377 ) ( not ( = ?auto_11374 ?auto_11375 ) ) ( not ( = ?auto_11374 ?auto_11381 ) ) ( not ( = ?auto_11375 ?auto_11381 ) ) ( not ( = ?auto_11376 ?auto_11380 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11378 ?auto_11377 ?auto_11379 )
      ( !LIFT ?auto_11380 ?auto_11375 ?auto_11381 ?auto_11379 )
      ( !LOAD ?auto_11380 ?auto_11375 ?auto_11378 ?auto_11379 )
      ( !DRIVE ?auto_11378 ?auto_11379 ?auto_11377 )
      ( !UNLOAD ?auto_11376 ?auto_11375 ?auto_11378 ?auto_11377 )
      ( !DROP ?auto_11376 ?auto_11375 ?auto_11374 ?auto_11377 )
      ( MAKE-1CRATE-VERIFY ?auto_11374 ?auto_11375 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11395 - SURFACE
      ?auto_11396 - SURFACE
      ?auto_11397 - SURFACE
    )
    :vars
    (
      ?auto_11398 - HOIST
      ?auto_11399 - PLACE
      ?auto_11403 - PLACE
      ?auto_11402 - HOIST
      ?auto_11400 - SURFACE
      ?auto_11404 - PLACE
      ?auto_11406 - HOIST
      ?auto_11405 - SURFACE
      ?auto_11401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11398 ?auto_11399 ) ( IS-CRATE ?auto_11397 ) ( not ( = ?auto_11403 ?auto_11399 ) ) ( HOIST-AT ?auto_11402 ?auto_11403 ) ( AVAILABLE ?auto_11402 ) ( SURFACE-AT ?auto_11397 ?auto_11403 ) ( ON ?auto_11397 ?auto_11400 ) ( CLEAR ?auto_11397 ) ( not ( = ?auto_11396 ?auto_11397 ) ) ( not ( = ?auto_11396 ?auto_11400 ) ) ( not ( = ?auto_11397 ?auto_11400 ) ) ( not ( = ?auto_11398 ?auto_11402 ) ) ( SURFACE-AT ?auto_11395 ?auto_11399 ) ( CLEAR ?auto_11395 ) ( IS-CRATE ?auto_11396 ) ( AVAILABLE ?auto_11398 ) ( not ( = ?auto_11404 ?auto_11399 ) ) ( HOIST-AT ?auto_11406 ?auto_11404 ) ( AVAILABLE ?auto_11406 ) ( SURFACE-AT ?auto_11396 ?auto_11404 ) ( ON ?auto_11396 ?auto_11405 ) ( CLEAR ?auto_11396 ) ( TRUCK-AT ?auto_11401 ?auto_11399 ) ( not ( = ?auto_11395 ?auto_11396 ) ) ( not ( = ?auto_11395 ?auto_11405 ) ) ( not ( = ?auto_11396 ?auto_11405 ) ) ( not ( = ?auto_11398 ?auto_11406 ) ) ( not ( = ?auto_11395 ?auto_11397 ) ) ( not ( = ?auto_11395 ?auto_11400 ) ) ( not ( = ?auto_11397 ?auto_11405 ) ) ( not ( = ?auto_11403 ?auto_11404 ) ) ( not ( = ?auto_11402 ?auto_11406 ) ) ( not ( = ?auto_11400 ?auto_11405 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11395 ?auto_11396 )
      ( MAKE-1CRATE ?auto_11396 ?auto_11397 )
      ( MAKE-2CRATE-VERIFY ?auto_11395 ?auto_11396 ?auto_11397 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11421 - SURFACE
      ?auto_11422 - SURFACE
      ?auto_11423 - SURFACE
      ?auto_11424 - SURFACE
    )
    :vars
    (
      ?auto_11427 - HOIST
      ?auto_11429 - PLACE
      ?auto_11430 - PLACE
      ?auto_11428 - HOIST
      ?auto_11425 - SURFACE
      ?auto_11434 - PLACE
      ?auto_11432 - HOIST
      ?auto_11433 - SURFACE
      ?auto_11431 - PLACE
      ?auto_11436 - HOIST
      ?auto_11435 - SURFACE
      ?auto_11426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11427 ?auto_11429 ) ( IS-CRATE ?auto_11424 ) ( not ( = ?auto_11430 ?auto_11429 ) ) ( HOIST-AT ?auto_11428 ?auto_11430 ) ( AVAILABLE ?auto_11428 ) ( SURFACE-AT ?auto_11424 ?auto_11430 ) ( ON ?auto_11424 ?auto_11425 ) ( CLEAR ?auto_11424 ) ( not ( = ?auto_11423 ?auto_11424 ) ) ( not ( = ?auto_11423 ?auto_11425 ) ) ( not ( = ?auto_11424 ?auto_11425 ) ) ( not ( = ?auto_11427 ?auto_11428 ) ) ( IS-CRATE ?auto_11423 ) ( not ( = ?auto_11434 ?auto_11429 ) ) ( HOIST-AT ?auto_11432 ?auto_11434 ) ( AVAILABLE ?auto_11432 ) ( SURFACE-AT ?auto_11423 ?auto_11434 ) ( ON ?auto_11423 ?auto_11433 ) ( CLEAR ?auto_11423 ) ( not ( = ?auto_11422 ?auto_11423 ) ) ( not ( = ?auto_11422 ?auto_11433 ) ) ( not ( = ?auto_11423 ?auto_11433 ) ) ( not ( = ?auto_11427 ?auto_11432 ) ) ( SURFACE-AT ?auto_11421 ?auto_11429 ) ( CLEAR ?auto_11421 ) ( IS-CRATE ?auto_11422 ) ( AVAILABLE ?auto_11427 ) ( not ( = ?auto_11431 ?auto_11429 ) ) ( HOIST-AT ?auto_11436 ?auto_11431 ) ( AVAILABLE ?auto_11436 ) ( SURFACE-AT ?auto_11422 ?auto_11431 ) ( ON ?auto_11422 ?auto_11435 ) ( CLEAR ?auto_11422 ) ( TRUCK-AT ?auto_11426 ?auto_11429 ) ( not ( = ?auto_11421 ?auto_11422 ) ) ( not ( = ?auto_11421 ?auto_11435 ) ) ( not ( = ?auto_11422 ?auto_11435 ) ) ( not ( = ?auto_11427 ?auto_11436 ) ) ( not ( = ?auto_11421 ?auto_11423 ) ) ( not ( = ?auto_11421 ?auto_11433 ) ) ( not ( = ?auto_11423 ?auto_11435 ) ) ( not ( = ?auto_11434 ?auto_11431 ) ) ( not ( = ?auto_11432 ?auto_11436 ) ) ( not ( = ?auto_11433 ?auto_11435 ) ) ( not ( = ?auto_11421 ?auto_11424 ) ) ( not ( = ?auto_11421 ?auto_11425 ) ) ( not ( = ?auto_11422 ?auto_11424 ) ) ( not ( = ?auto_11422 ?auto_11425 ) ) ( not ( = ?auto_11424 ?auto_11433 ) ) ( not ( = ?auto_11424 ?auto_11435 ) ) ( not ( = ?auto_11430 ?auto_11434 ) ) ( not ( = ?auto_11430 ?auto_11431 ) ) ( not ( = ?auto_11428 ?auto_11432 ) ) ( not ( = ?auto_11428 ?auto_11436 ) ) ( not ( = ?auto_11425 ?auto_11433 ) ) ( not ( = ?auto_11425 ?auto_11435 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11421 ?auto_11422 ?auto_11423 )
      ( MAKE-1CRATE ?auto_11423 ?auto_11424 )
      ( MAKE-3CRATE-VERIFY ?auto_11421 ?auto_11422 ?auto_11423 ?auto_11424 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11452 - SURFACE
      ?auto_11453 - SURFACE
      ?auto_11454 - SURFACE
      ?auto_11455 - SURFACE
      ?auto_11456 - SURFACE
    )
    :vars
    (
      ?auto_11462 - HOIST
      ?auto_11458 - PLACE
      ?auto_11457 - PLACE
      ?auto_11460 - HOIST
      ?auto_11461 - SURFACE
      ?auto_11467 - PLACE
      ?auto_11471 - HOIST
      ?auto_11468 - SURFACE
      ?auto_11470 - PLACE
      ?auto_11469 - HOIST
      ?auto_11465 - SURFACE
      ?auto_11463 - PLACE
      ?auto_11466 - HOIST
      ?auto_11464 - SURFACE
      ?auto_11459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11462 ?auto_11458 ) ( IS-CRATE ?auto_11456 ) ( not ( = ?auto_11457 ?auto_11458 ) ) ( HOIST-AT ?auto_11460 ?auto_11457 ) ( AVAILABLE ?auto_11460 ) ( SURFACE-AT ?auto_11456 ?auto_11457 ) ( ON ?auto_11456 ?auto_11461 ) ( CLEAR ?auto_11456 ) ( not ( = ?auto_11455 ?auto_11456 ) ) ( not ( = ?auto_11455 ?auto_11461 ) ) ( not ( = ?auto_11456 ?auto_11461 ) ) ( not ( = ?auto_11462 ?auto_11460 ) ) ( IS-CRATE ?auto_11455 ) ( not ( = ?auto_11467 ?auto_11458 ) ) ( HOIST-AT ?auto_11471 ?auto_11467 ) ( AVAILABLE ?auto_11471 ) ( SURFACE-AT ?auto_11455 ?auto_11467 ) ( ON ?auto_11455 ?auto_11468 ) ( CLEAR ?auto_11455 ) ( not ( = ?auto_11454 ?auto_11455 ) ) ( not ( = ?auto_11454 ?auto_11468 ) ) ( not ( = ?auto_11455 ?auto_11468 ) ) ( not ( = ?auto_11462 ?auto_11471 ) ) ( IS-CRATE ?auto_11454 ) ( not ( = ?auto_11470 ?auto_11458 ) ) ( HOIST-AT ?auto_11469 ?auto_11470 ) ( AVAILABLE ?auto_11469 ) ( SURFACE-AT ?auto_11454 ?auto_11470 ) ( ON ?auto_11454 ?auto_11465 ) ( CLEAR ?auto_11454 ) ( not ( = ?auto_11453 ?auto_11454 ) ) ( not ( = ?auto_11453 ?auto_11465 ) ) ( not ( = ?auto_11454 ?auto_11465 ) ) ( not ( = ?auto_11462 ?auto_11469 ) ) ( SURFACE-AT ?auto_11452 ?auto_11458 ) ( CLEAR ?auto_11452 ) ( IS-CRATE ?auto_11453 ) ( AVAILABLE ?auto_11462 ) ( not ( = ?auto_11463 ?auto_11458 ) ) ( HOIST-AT ?auto_11466 ?auto_11463 ) ( AVAILABLE ?auto_11466 ) ( SURFACE-AT ?auto_11453 ?auto_11463 ) ( ON ?auto_11453 ?auto_11464 ) ( CLEAR ?auto_11453 ) ( TRUCK-AT ?auto_11459 ?auto_11458 ) ( not ( = ?auto_11452 ?auto_11453 ) ) ( not ( = ?auto_11452 ?auto_11464 ) ) ( not ( = ?auto_11453 ?auto_11464 ) ) ( not ( = ?auto_11462 ?auto_11466 ) ) ( not ( = ?auto_11452 ?auto_11454 ) ) ( not ( = ?auto_11452 ?auto_11465 ) ) ( not ( = ?auto_11454 ?auto_11464 ) ) ( not ( = ?auto_11470 ?auto_11463 ) ) ( not ( = ?auto_11469 ?auto_11466 ) ) ( not ( = ?auto_11465 ?auto_11464 ) ) ( not ( = ?auto_11452 ?auto_11455 ) ) ( not ( = ?auto_11452 ?auto_11468 ) ) ( not ( = ?auto_11453 ?auto_11455 ) ) ( not ( = ?auto_11453 ?auto_11468 ) ) ( not ( = ?auto_11455 ?auto_11465 ) ) ( not ( = ?auto_11455 ?auto_11464 ) ) ( not ( = ?auto_11467 ?auto_11470 ) ) ( not ( = ?auto_11467 ?auto_11463 ) ) ( not ( = ?auto_11471 ?auto_11469 ) ) ( not ( = ?auto_11471 ?auto_11466 ) ) ( not ( = ?auto_11468 ?auto_11465 ) ) ( not ( = ?auto_11468 ?auto_11464 ) ) ( not ( = ?auto_11452 ?auto_11456 ) ) ( not ( = ?auto_11452 ?auto_11461 ) ) ( not ( = ?auto_11453 ?auto_11456 ) ) ( not ( = ?auto_11453 ?auto_11461 ) ) ( not ( = ?auto_11454 ?auto_11456 ) ) ( not ( = ?auto_11454 ?auto_11461 ) ) ( not ( = ?auto_11456 ?auto_11468 ) ) ( not ( = ?auto_11456 ?auto_11465 ) ) ( not ( = ?auto_11456 ?auto_11464 ) ) ( not ( = ?auto_11457 ?auto_11467 ) ) ( not ( = ?auto_11457 ?auto_11470 ) ) ( not ( = ?auto_11457 ?auto_11463 ) ) ( not ( = ?auto_11460 ?auto_11471 ) ) ( not ( = ?auto_11460 ?auto_11469 ) ) ( not ( = ?auto_11460 ?auto_11466 ) ) ( not ( = ?auto_11461 ?auto_11468 ) ) ( not ( = ?auto_11461 ?auto_11465 ) ) ( not ( = ?auto_11461 ?auto_11464 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_11452 ?auto_11453 ?auto_11454 ?auto_11455 )
      ( MAKE-1CRATE ?auto_11455 ?auto_11456 )
      ( MAKE-4CRATE-VERIFY ?auto_11452 ?auto_11453 ?auto_11454 ?auto_11455 ?auto_11456 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_11488 - SURFACE
      ?auto_11489 - SURFACE
      ?auto_11490 - SURFACE
      ?auto_11491 - SURFACE
      ?auto_11492 - SURFACE
      ?auto_11493 - SURFACE
    )
    :vars
    (
      ?auto_11494 - HOIST
      ?auto_11498 - PLACE
      ?auto_11499 - PLACE
      ?auto_11497 - HOIST
      ?auto_11495 - SURFACE
      ?auto_11508 - SURFACE
      ?auto_11506 - PLACE
      ?auto_11500 - HOIST
      ?auto_11503 - SURFACE
      ?auto_11501 - PLACE
      ?auto_11502 - HOIST
      ?auto_11504 - SURFACE
      ?auto_11505 - PLACE
      ?auto_11507 - HOIST
      ?auto_11509 - SURFACE
      ?auto_11496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11494 ?auto_11498 ) ( IS-CRATE ?auto_11493 ) ( not ( = ?auto_11499 ?auto_11498 ) ) ( HOIST-AT ?auto_11497 ?auto_11499 ) ( SURFACE-AT ?auto_11493 ?auto_11499 ) ( ON ?auto_11493 ?auto_11495 ) ( CLEAR ?auto_11493 ) ( not ( = ?auto_11492 ?auto_11493 ) ) ( not ( = ?auto_11492 ?auto_11495 ) ) ( not ( = ?auto_11493 ?auto_11495 ) ) ( not ( = ?auto_11494 ?auto_11497 ) ) ( IS-CRATE ?auto_11492 ) ( AVAILABLE ?auto_11497 ) ( SURFACE-AT ?auto_11492 ?auto_11499 ) ( ON ?auto_11492 ?auto_11508 ) ( CLEAR ?auto_11492 ) ( not ( = ?auto_11491 ?auto_11492 ) ) ( not ( = ?auto_11491 ?auto_11508 ) ) ( not ( = ?auto_11492 ?auto_11508 ) ) ( IS-CRATE ?auto_11491 ) ( not ( = ?auto_11506 ?auto_11498 ) ) ( HOIST-AT ?auto_11500 ?auto_11506 ) ( AVAILABLE ?auto_11500 ) ( SURFACE-AT ?auto_11491 ?auto_11506 ) ( ON ?auto_11491 ?auto_11503 ) ( CLEAR ?auto_11491 ) ( not ( = ?auto_11490 ?auto_11491 ) ) ( not ( = ?auto_11490 ?auto_11503 ) ) ( not ( = ?auto_11491 ?auto_11503 ) ) ( not ( = ?auto_11494 ?auto_11500 ) ) ( IS-CRATE ?auto_11490 ) ( not ( = ?auto_11501 ?auto_11498 ) ) ( HOIST-AT ?auto_11502 ?auto_11501 ) ( AVAILABLE ?auto_11502 ) ( SURFACE-AT ?auto_11490 ?auto_11501 ) ( ON ?auto_11490 ?auto_11504 ) ( CLEAR ?auto_11490 ) ( not ( = ?auto_11489 ?auto_11490 ) ) ( not ( = ?auto_11489 ?auto_11504 ) ) ( not ( = ?auto_11490 ?auto_11504 ) ) ( not ( = ?auto_11494 ?auto_11502 ) ) ( SURFACE-AT ?auto_11488 ?auto_11498 ) ( CLEAR ?auto_11488 ) ( IS-CRATE ?auto_11489 ) ( AVAILABLE ?auto_11494 ) ( not ( = ?auto_11505 ?auto_11498 ) ) ( HOIST-AT ?auto_11507 ?auto_11505 ) ( AVAILABLE ?auto_11507 ) ( SURFACE-AT ?auto_11489 ?auto_11505 ) ( ON ?auto_11489 ?auto_11509 ) ( CLEAR ?auto_11489 ) ( TRUCK-AT ?auto_11496 ?auto_11498 ) ( not ( = ?auto_11488 ?auto_11489 ) ) ( not ( = ?auto_11488 ?auto_11509 ) ) ( not ( = ?auto_11489 ?auto_11509 ) ) ( not ( = ?auto_11494 ?auto_11507 ) ) ( not ( = ?auto_11488 ?auto_11490 ) ) ( not ( = ?auto_11488 ?auto_11504 ) ) ( not ( = ?auto_11490 ?auto_11509 ) ) ( not ( = ?auto_11501 ?auto_11505 ) ) ( not ( = ?auto_11502 ?auto_11507 ) ) ( not ( = ?auto_11504 ?auto_11509 ) ) ( not ( = ?auto_11488 ?auto_11491 ) ) ( not ( = ?auto_11488 ?auto_11503 ) ) ( not ( = ?auto_11489 ?auto_11491 ) ) ( not ( = ?auto_11489 ?auto_11503 ) ) ( not ( = ?auto_11491 ?auto_11504 ) ) ( not ( = ?auto_11491 ?auto_11509 ) ) ( not ( = ?auto_11506 ?auto_11501 ) ) ( not ( = ?auto_11506 ?auto_11505 ) ) ( not ( = ?auto_11500 ?auto_11502 ) ) ( not ( = ?auto_11500 ?auto_11507 ) ) ( not ( = ?auto_11503 ?auto_11504 ) ) ( not ( = ?auto_11503 ?auto_11509 ) ) ( not ( = ?auto_11488 ?auto_11492 ) ) ( not ( = ?auto_11488 ?auto_11508 ) ) ( not ( = ?auto_11489 ?auto_11492 ) ) ( not ( = ?auto_11489 ?auto_11508 ) ) ( not ( = ?auto_11490 ?auto_11492 ) ) ( not ( = ?auto_11490 ?auto_11508 ) ) ( not ( = ?auto_11492 ?auto_11503 ) ) ( not ( = ?auto_11492 ?auto_11504 ) ) ( not ( = ?auto_11492 ?auto_11509 ) ) ( not ( = ?auto_11499 ?auto_11506 ) ) ( not ( = ?auto_11499 ?auto_11501 ) ) ( not ( = ?auto_11499 ?auto_11505 ) ) ( not ( = ?auto_11497 ?auto_11500 ) ) ( not ( = ?auto_11497 ?auto_11502 ) ) ( not ( = ?auto_11497 ?auto_11507 ) ) ( not ( = ?auto_11508 ?auto_11503 ) ) ( not ( = ?auto_11508 ?auto_11504 ) ) ( not ( = ?auto_11508 ?auto_11509 ) ) ( not ( = ?auto_11488 ?auto_11493 ) ) ( not ( = ?auto_11488 ?auto_11495 ) ) ( not ( = ?auto_11489 ?auto_11493 ) ) ( not ( = ?auto_11489 ?auto_11495 ) ) ( not ( = ?auto_11490 ?auto_11493 ) ) ( not ( = ?auto_11490 ?auto_11495 ) ) ( not ( = ?auto_11491 ?auto_11493 ) ) ( not ( = ?auto_11491 ?auto_11495 ) ) ( not ( = ?auto_11493 ?auto_11508 ) ) ( not ( = ?auto_11493 ?auto_11503 ) ) ( not ( = ?auto_11493 ?auto_11504 ) ) ( not ( = ?auto_11493 ?auto_11509 ) ) ( not ( = ?auto_11495 ?auto_11508 ) ) ( not ( = ?auto_11495 ?auto_11503 ) ) ( not ( = ?auto_11495 ?auto_11504 ) ) ( not ( = ?auto_11495 ?auto_11509 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_11488 ?auto_11489 ?auto_11490 ?auto_11491 ?auto_11492 )
      ( MAKE-1CRATE ?auto_11492 ?auto_11493 )
      ( MAKE-5CRATE-VERIFY ?auto_11488 ?auto_11489 ?auto_11490 ?auto_11491 ?auto_11492 ?auto_11493 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_11527 - SURFACE
      ?auto_11528 - SURFACE
      ?auto_11529 - SURFACE
      ?auto_11530 - SURFACE
      ?auto_11531 - SURFACE
      ?auto_11532 - SURFACE
      ?auto_11533 - SURFACE
    )
    :vars
    (
      ?auto_11539 - HOIST
      ?auto_11538 - PLACE
      ?auto_11534 - PLACE
      ?auto_11535 - HOIST
      ?auto_11537 - SURFACE
      ?auto_11549 - SURFACE
      ?auto_11543 - SURFACE
      ?auto_11541 - PLACE
      ?auto_11544 - HOIST
      ?auto_11547 - SURFACE
      ?auto_11545 - PLACE
      ?auto_11546 - HOIST
      ?auto_11542 - SURFACE
      ?auto_11548 - PLACE
      ?auto_11540 - HOIST
      ?auto_11550 - SURFACE
      ?auto_11536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11539 ?auto_11538 ) ( IS-CRATE ?auto_11533 ) ( not ( = ?auto_11534 ?auto_11538 ) ) ( HOIST-AT ?auto_11535 ?auto_11534 ) ( SURFACE-AT ?auto_11533 ?auto_11534 ) ( ON ?auto_11533 ?auto_11537 ) ( CLEAR ?auto_11533 ) ( not ( = ?auto_11532 ?auto_11533 ) ) ( not ( = ?auto_11532 ?auto_11537 ) ) ( not ( = ?auto_11533 ?auto_11537 ) ) ( not ( = ?auto_11539 ?auto_11535 ) ) ( IS-CRATE ?auto_11532 ) ( SURFACE-AT ?auto_11532 ?auto_11534 ) ( ON ?auto_11532 ?auto_11549 ) ( CLEAR ?auto_11532 ) ( not ( = ?auto_11531 ?auto_11532 ) ) ( not ( = ?auto_11531 ?auto_11549 ) ) ( not ( = ?auto_11532 ?auto_11549 ) ) ( IS-CRATE ?auto_11531 ) ( AVAILABLE ?auto_11535 ) ( SURFACE-AT ?auto_11531 ?auto_11534 ) ( ON ?auto_11531 ?auto_11543 ) ( CLEAR ?auto_11531 ) ( not ( = ?auto_11530 ?auto_11531 ) ) ( not ( = ?auto_11530 ?auto_11543 ) ) ( not ( = ?auto_11531 ?auto_11543 ) ) ( IS-CRATE ?auto_11530 ) ( not ( = ?auto_11541 ?auto_11538 ) ) ( HOIST-AT ?auto_11544 ?auto_11541 ) ( AVAILABLE ?auto_11544 ) ( SURFACE-AT ?auto_11530 ?auto_11541 ) ( ON ?auto_11530 ?auto_11547 ) ( CLEAR ?auto_11530 ) ( not ( = ?auto_11529 ?auto_11530 ) ) ( not ( = ?auto_11529 ?auto_11547 ) ) ( not ( = ?auto_11530 ?auto_11547 ) ) ( not ( = ?auto_11539 ?auto_11544 ) ) ( IS-CRATE ?auto_11529 ) ( not ( = ?auto_11545 ?auto_11538 ) ) ( HOIST-AT ?auto_11546 ?auto_11545 ) ( AVAILABLE ?auto_11546 ) ( SURFACE-AT ?auto_11529 ?auto_11545 ) ( ON ?auto_11529 ?auto_11542 ) ( CLEAR ?auto_11529 ) ( not ( = ?auto_11528 ?auto_11529 ) ) ( not ( = ?auto_11528 ?auto_11542 ) ) ( not ( = ?auto_11529 ?auto_11542 ) ) ( not ( = ?auto_11539 ?auto_11546 ) ) ( SURFACE-AT ?auto_11527 ?auto_11538 ) ( CLEAR ?auto_11527 ) ( IS-CRATE ?auto_11528 ) ( AVAILABLE ?auto_11539 ) ( not ( = ?auto_11548 ?auto_11538 ) ) ( HOIST-AT ?auto_11540 ?auto_11548 ) ( AVAILABLE ?auto_11540 ) ( SURFACE-AT ?auto_11528 ?auto_11548 ) ( ON ?auto_11528 ?auto_11550 ) ( CLEAR ?auto_11528 ) ( TRUCK-AT ?auto_11536 ?auto_11538 ) ( not ( = ?auto_11527 ?auto_11528 ) ) ( not ( = ?auto_11527 ?auto_11550 ) ) ( not ( = ?auto_11528 ?auto_11550 ) ) ( not ( = ?auto_11539 ?auto_11540 ) ) ( not ( = ?auto_11527 ?auto_11529 ) ) ( not ( = ?auto_11527 ?auto_11542 ) ) ( not ( = ?auto_11529 ?auto_11550 ) ) ( not ( = ?auto_11545 ?auto_11548 ) ) ( not ( = ?auto_11546 ?auto_11540 ) ) ( not ( = ?auto_11542 ?auto_11550 ) ) ( not ( = ?auto_11527 ?auto_11530 ) ) ( not ( = ?auto_11527 ?auto_11547 ) ) ( not ( = ?auto_11528 ?auto_11530 ) ) ( not ( = ?auto_11528 ?auto_11547 ) ) ( not ( = ?auto_11530 ?auto_11542 ) ) ( not ( = ?auto_11530 ?auto_11550 ) ) ( not ( = ?auto_11541 ?auto_11545 ) ) ( not ( = ?auto_11541 ?auto_11548 ) ) ( not ( = ?auto_11544 ?auto_11546 ) ) ( not ( = ?auto_11544 ?auto_11540 ) ) ( not ( = ?auto_11547 ?auto_11542 ) ) ( not ( = ?auto_11547 ?auto_11550 ) ) ( not ( = ?auto_11527 ?auto_11531 ) ) ( not ( = ?auto_11527 ?auto_11543 ) ) ( not ( = ?auto_11528 ?auto_11531 ) ) ( not ( = ?auto_11528 ?auto_11543 ) ) ( not ( = ?auto_11529 ?auto_11531 ) ) ( not ( = ?auto_11529 ?auto_11543 ) ) ( not ( = ?auto_11531 ?auto_11547 ) ) ( not ( = ?auto_11531 ?auto_11542 ) ) ( not ( = ?auto_11531 ?auto_11550 ) ) ( not ( = ?auto_11534 ?auto_11541 ) ) ( not ( = ?auto_11534 ?auto_11545 ) ) ( not ( = ?auto_11534 ?auto_11548 ) ) ( not ( = ?auto_11535 ?auto_11544 ) ) ( not ( = ?auto_11535 ?auto_11546 ) ) ( not ( = ?auto_11535 ?auto_11540 ) ) ( not ( = ?auto_11543 ?auto_11547 ) ) ( not ( = ?auto_11543 ?auto_11542 ) ) ( not ( = ?auto_11543 ?auto_11550 ) ) ( not ( = ?auto_11527 ?auto_11532 ) ) ( not ( = ?auto_11527 ?auto_11549 ) ) ( not ( = ?auto_11528 ?auto_11532 ) ) ( not ( = ?auto_11528 ?auto_11549 ) ) ( not ( = ?auto_11529 ?auto_11532 ) ) ( not ( = ?auto_11529 ?auto_11549 ) ) ( not ( = ?auto_11530 ?auto_11532 ) ) ( not ( = ?auto_11530 ?auto_11549 ) ) ( not ( = ?auto_11532 ?auto_11543 ) ) ( not ( = ?auto_11532 ?auto_11547 ) ) ( not ( = ?auto_11532 ?auto_11542 ) ) ( not ( = ?auto_11532 ?auto_11550 ) ) ( not ( = ?auto_11549 ?auto_11543 ) ) ( not ( = ?auto_11549 ?auto_11547 ) ) ( not ( = ?auto_11549 ?auto_11542 ) ) ( not ( = ?auto_11549 ?auto_11550 ) ) ( not ( = ?auto_11527 ?auto_11533 ) ) ( not ( = ?auto_11527 ?auto_11537 ) ) ( not ( = ?auto_11528 ?auto_11533 ) ) ( not ( = ?auto_11528 ?auto_11537 ) ) ( not ( = ?auto_11529 ?auto_11533 ) ) ( not ( = ?auto_11529 ?auto_11537 ) ) ( not ( = ?auto_11530 ?auto_11533 ) ) ( not ( = ?auto_11530 ?auto_11537 ) ) ( not ( = ?auto_11531 ?auto_11533 ) ) ( not ( = ?auto_11531 ?auto_11537 ) ) ( not ( = ?auto_11533 ?auto_11549 ) ) ( not ( = ?auto_11533 ?auto_11543 ) ) ( not ( = ?auto_11533 ?auto_11547 ) ) ( not ( = ?auto_11533 ?auto_11542 ) ) ( not ( = ?auto_11533 ?auto_11550 ) ) ( not ( = ?auto_11537 ?auto_11549 ) ) ( not ( = ?auto_11537 ?auto_11543 ) ) ( not ( = ?auto_11537 ?auto_11547 ) ) ( not ( = ?auto_11537 ?auto_11542 ) ) ( not ( = ?auto_11537 ?auto_11550 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_11527 ?auto_11528 ?auto_11529 ?auto_11530 ?auto_11531 ?auto_11532 )
      ( MAKE-1CRATE ?auto_11532 ?auto_11533 )
      ( MAKE-6CRATE-VERIFY ?auto_11527 ?auto_11528 ?auto_11529 ?auto_11530 ?auto_11531 ?auto_11532 ?auto_11533 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_11569 - SURFACE
      ?auto_11570 - SURFACE
      ?auto_11571 - SURFACE
      ?auto_11572 - SURFACE
      ?auto_11573 - SURFACE
      ?auto_11574 - SURFACE
      ?auto_11575 - SURFACE
      ?auto_11576 - SURFACE
    )
    :vars
    (
      ?auto_11577 - HOIST
      ?auto_11580 - PLACE
      ?auto_11578 - PLACE
      ?auto_11581 - HOIST
      ?auto_11582 - SURFACE
      ?auto_11583 - PLACE
      ?auto_11593 - HOIST
      ?auto_11594 - SURFACE
      ?auto_11586 - SURFACE
      ?auto_11588 - SURFACE
      ?auto_11585 - PLACE
      ?auto_11590 - HOIST
      ?auto_11596 - SURFACE
      ?auto_11591 - PLACE
      ?auto_11589 - HOIST
      ?auto_11587 - SURFACE
      ?auto_11584 - PLACE
      ?auto_11592 - HOIST
      ?auto_11595 - SURFACE
      ?auto_11579 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11577 ?auto_11580 ) ( IS-CRATE ?auto_11576 ) ( not ( = ?auto_11578 ?auto_11580 ) ) ( HOIST-AT ?auto_11581 ?auto_11578 ) ( AVAILABLE ?auto_11581 ) ( SURFACE-AT ?auto_11576 ?auto_11578 ) ( ON ?auto_11576 ?auto_11582 ) ( CLEAR ?auto_11576 ) ( not ( = ?auto_11575 ?auto_11576 ) ) ( not ( = ?auto_11575 ?auto_11582 ) ) ( not ( = ?auto_11576 ?auto_11582 ) ) ( not ( = ?auto_11577 ?auto_11581 ) ) ( IS-CRATE ?auto_11575 ) ( not ( = ?auto_11583 ?auto_11580 ) ) ( HOIST-AT ?auto_11593 ?auto_11583 ) ( SURFACE-AT ?auto_11575 ?auto_11583 ) ( ON ?auto_11575 ?auto_11594 ) ( CLEAR ?auto_11575 ) ( not ( = ?auto_11574 ?auto_11575 ) ) ( not ( = ?auto_11574 ?auto_11594 ) ) ( not ( = ?auto_11575 ?auto_11594 ) ) ( not ( = ?auto_11577 ?auto_11593 ) ) ( IS-CRATE ?auto_11574 ) ( SURFACE-AT ?auto_11574 ?auto_11583 ) ( ON ?auto_11574 ?auto_11586 ) ( CLEAR ?auto_11574 ) ( not ( = ?auto_11573 ?auto_11574 ) ) ( not ( = ?auto_11573 ?auto_11586 ) ) ( not ( = ?auto_11574 ?auto_11586 ) ) ( IS-CRATE ?auto_11573 ) ( AVAILABLE ?auto_11593 ) ( SURFACE-AT ?auto_11573 ?auto_11583 ) ( ON ?auto_11573 ?auto_11588 ) ( CLEAR ?auto_11573 ) ( not ( = ?auto_11572 ?auto_11573 ) ) ( not ( = ?auto_11572 ?auto_11588 ) ) ( not ( = ?auto_11573 ?auto_11588 ) ) ( IS-CRATE ?auto_11572 ) ( not ( = ?auto_11585 ?auto_11580 ) ) ( HOIST-AT ?auto_11590 ?auto_11585 ) ( AVAILABLE ?auto_11590 ) ( SURFACE-AT ?auto_11572 ?auto_11585 ) ( ON ?auto_11572 ?auto_11596 ) ( CLEAR ?auto_11572 ) ( not ( = ?auto_11571 ?auto_11572 ) ) ( not ( = ?auto_11571 ?auto_11596 ) ) ( not ( = ?auto_11572 ?auto_11596 ) ) ( not ( = ?auto_11577 ?auto_11590 ) ) ( IS-CRATE ?auto_11571 ) ( not ( = ?auto_11591 ?auto_11580 ) ) ( HOIST-AT ?auto_11589 ?auto_11591 ) ( AVAILABLE ?auto_11589 ) ( SURFACE-AT ?auto_11571 ?auto_11591 ) ( ON ?auto_11571 ?auto_11587 ) ( CLEAR ?auto_11571 ) ( not ( = ?auto_11570 ?auto_11571 ) ) ( not ( = ?auto_11570 ?auto_11587 ) ) ( not ( = ?auto_11571 ?auto_11587 ) ) ( not ( = ?auto_11577 ?auto_11589 ) ) ( SURFACE-AT ?auto_11569 ?auto_11580 ) ( CLEAR ?auto_11569 ) ( IS-CRATE ?auto_11570 ) ( AVAILABLE ?auto_11577 ) ( not ( = ?auto_11584 ?auto_11580 ) ) ( HOIST-AT ?auto_11592 ?auto_11584 ) ( AVAILABLE ?auto_11592 ) ( SURFACE-AT ?auto_11570 ?auto_11584 ) ( ON ?auto_11570 ?auto_11595 ) ( CLEAR ?auto_11570 ) ( TRUCK-AT ?auto_11579 ?auto_11580 ) ( not ( = ?auto_11569 ?auto_11570 ) ) ( not ( = ?auto_11569 ?auto_11595 ) ) ( not ( = ?auto_11570 ?auto_11595 ) ) ( not ( = ?auto_11577 ?auto_11592 ) ) ( not ( = ?auto_11569 ?auto_11571 ) ) ( not ( = ?auto_11569 ?auto_11587 ) ) ( not ( = ?auto_11571 ?auto_11595 ) ) ( not ( = ?auto_11591 ?auto_11584 ) ) ( not ( = ?auto_11589 ?auto_11592 ) ) ( not ( = ?auto_11587 ?auto_11595 ) ) ( not ( = ?auto_11569 ?auto_11572 ) ) ( not ( = ?auto_11569 ?auto_11596 ) ) ( not ( = ?auto_11570 ?auto_11572 ) ) ( not ( = ?auto_11570 ?auto_11596 ) ) ( not ( = ?auto_11572 ?auto_11587 ) ) ( not ( = ?auto_11572 ?auto_11595 ) ) ( not ( = ?auto_11585 ?auto_11591 ) ) ( not ( = ?auto_11585 ?auto_11584 ) ) ( not ( = ?auto_11590 ?auto_11589 ) ) ( not ( = ?auto_11590 ?auto_11592 ) ) ( not ( = ?auto_11596 ?auto_11587 ) ) ( not ( = ?auto_11596 ?auto_11595 ) ) ( not ( = ?auto_11569 ?auto_11573 ) ) ( not ( = ?auto_11569 ?auto_11588 ) ) ( not ( = ?auto_11570 ?auto_11573 ) ) ( not ( = ?auto_11570 ?auto_11588 ) ) ( not ( = ?auto_11571 ?auto_11573 ) ) ( not ( = ?auto_11571 ?auto_11588 ) ) ( not ( = ?auto_11573 ?auto_11596 ) ) ( not ( = ?auto_11573 ?auto_11587 ) ) ( not ( = ?auto_11573 ?auto_11595 ) ) ( not ( = ?auto_11583 ?auto_11585 ) ) ( not ( = ?auto_11583 ?auto_11591 ) ) ( not ( = ?auto_11583 ?auto_11584 ) ) ( not ( = ?auto_11593 ?auto_11590 ) ) ( not ( = ?auto_11593 ?auto_11589 ) ) ( not ( = ?auto_11593 ?auto_11592 ) ) ( not ( = ?auto_11588 ?auto_11596 ) ) ( not ( = ?auto_11588 ?auto_11587 ) ) ( not ( = ?auto_11588 ?auto_11595 ) ) ( not ( = ?auto_11569 ?auto_11574 ) ) ( not ( = ?auto_11569 ?auto_11586 ) ) ( not ( = ?auto_11570 ?auto_11574 ) ) ( not ( = ?auto_11570 ?auto_11586 ) ) ( not ( = ?auto_11571 ?auto_11574 ) ) ( not ( = ?auto_11571 ?auto_11586 ) ) ( not ( = ?auto_11572 ?auto_11574 ) ) ( not ( = ?auto_11572 ?auto_11586 ) ) ( not ( = ?auto_11574 ?auto_11588 ) ) ( not ( = ?auto_11574 ?auto_11596 ) ) ( not ( = ?auto_11574 ?auto_11587 ) ) ( not ( = ?auto_11574 ?auto_11595 ) ) ( not ( = ?auto_11586 ?auto_11588 ) ) ( not ( = ?auto_11586 ?auto_11596 ) ) ( not ( = ?auto_11586 ?auto_11587 ) ) ( not ( = ?auto_11586 ?auto_11595 ) ) ( not ( = ?auto_11569 ?auto_11575 ) ) ( not ( = ?auto_11569 ?auto_11594 ) ) ( not ( = ?auto_11570 ?auto_11575 ) ) ( not ( = ?auto_11570 ?auto_11594 ) ) ( not ( = ?auto_11571 ?auto_11575 ) ) ( not ( = ?auto_11571 ?auto_11594 ) ) ( not ( = ?auto_11572 ?auto_11575 ) ) ( not ( = ?auto_11572 ?auto_11594 ) ) ( not ( = ?auto_11573 ?auto_11575 ) ) ( not ( = ?auto_11573 ?auto_11594 ) ) ( not ( = ?auto_11575 ?auto_11586 ) ) ( not ( = ?auto_11575 ?auto_11588 ) ) ( not ( = ?auto_11575 ?auto_11596 ) ) ( not ( = ?auto_11575 ?auto_11587 ) ) ( not ( = ?auto_11575 ?auto_11595 ) ) ( not ( = ?auto_11594 ?auto_11586 ) ) ( not ( = ?auto_11594 ?auto_11588 ) ) ( not ( = ?auto_11594 ?auto_11596 ) ) ( not ( = ?auto_11594 ?auto_11587 ) ) ( not ( = ?auto_11594 ?auto_11595 ) ) ( not ( = ?auto_11569 ?auto_11576 ) ) ( not ( = ?auto_11569 ?auto_11582 ) ) ( not ( = ?auto_11570 ?auto_11576 ) ) ( not ( = ?auto_11570 ?auto_11582 ) ) ( not ( = ?auto_11571 ?auto_11576 ) ) ( not ( = ?auto_11571 ?auto_11582 ) ) ( not ( = ?auto_11572 ?auto_11576 ) ) ( not ( = ?auto_11572 ?auto_11582 ) ) ( not ( = ?auto_11573 ?auto_11576 ) ) ( not ( = ?auto_11573 ?auto_11582 ) ) ( not ( = ?auto_11574 ?auto_11576 ) ) ( not ( = ?auto_11574 ?auto_11582 ) ) ( not ( = ?auto_11576 ?auto_11594 ) ) ( not ( = ?auto_11576 ?auto_11586 ) ) ( not ( = ?auto_11576 ?auto_11588 ) ) ( not ( = ?auto_11576 ?auto_11596 ) ) ( not ( = ?auto_11576 ?auto_11587 ) ) ( not ( = ?auto_11576 ?auto_11595 ) ) ( not ( = ?auto_11578 ?auto_11583 ) ) ( not ( = ?auto_11578 ?auto_11585 ) ) ( not ( = ?auto_11578 ?auto_11591 ) ) ( not ( = ?auto_11578 ?auto_11584 ) ) ( not ( = ?auto_11581 ?auto_11593 ) ) ( not ( = ?auto_11581 ?auto_11590 ) ) ( not ( = ?auto_11581 ?auto_11589 ) ) ( not ( = ?auto_11581 ?auto_11592 ) ) ( not ( = ?auto_11582 ?auto_11594 ) ) ( not ( = ?auto_11582 ?auto_11586 ) ) ( not ( = ?auto_11582 ?auto_11588 ) ) ( not ( = ?auto_11582 ?auto_11596 ) ) ( not ( = ?auto_11582 ?auto_11587 ) ) ( not ( = ?auto_11582 ?auto_11595 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_11569 ?auto_11570 ?auto_11571 ?auto_11572 ?auto_11573 ?auto_11574 ?auto_11575 )
      ( MAKE-1CRATE ?auto_11575 ?auto_11576 )
      ( MAKE-7CRATE-VERIFY ?auto_11569 ?auto_11570 ?auto_11571 ?auto_11572 ?auto_11573 ?auto_11574 ?auto_11575 ?auto_11576 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_11616 - SURFACE
      ?auto_11617 - SURFACE
      ?auto_11618 - SURFACE
      ?auto_11619 - SURFACE
      ?auto_11620 - SURFACE
      ?auto_11621 - SURFACE
      ?auto_11622 - SURFACE
      ?auto_11623 - SURFACE
      ?auto_11624 - SURFACE
    )
    :vars
    (
      ?auto_11630 - HOIST
      ?auto_11628 - PLACE
      ?auto_11629 - PLACE
      ?auto_11627 - HOIST
      ?auto_11625 - SURFACE
      ?auto_11642 - PLACE
      ?auto_11643 - HOIST
      ?auto_11637 - SURFACE
      ?auto_11641 - PLACE
      ?auto_11634 - HOIST
      ?auto_11632 - SURFACE
      ?auto_11640 - SURFACE
      ?auto_11636 - SURFACE
      ?auto_11644 - PLACE
      ?auto_11645 - HOIST
      ?auto_11631 - SURFACE
      ?auto_11647 - PLACE
      ?auto_11635 - HOIST
      ?auto_11638 - SURFACE
      ?auto_11646 - PLACE
      ?auto_11639 - HOIST
      ?auto_11633 - SURFACE
      ?auto_11626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11630 ?auto_11628 ) ( IS-CRATE ?auto_11624 ) ( not ( = ?auto_11629 ?auto_11628 ) ) ( HOIST-AT ?auto_11627 ?auto_11629 ) ( AVAILABLE ?auto_11627 ) ( SURFACE-AT ?auto_11624 ?auto_11629 ) ( ON ?auto_11624 ?auto_11625 ) ( CLEAR ?auto_11624 ) ( not ( = ?auto_11623 ?auto_11624 ) ) ( not ( = ?auto_11623 ?auto_11625 ) ) ( not ( = ?auto_11624 ?auto_11625 ) ) ( not ( = ?auto_11630 ?auto_11627 ) ) ( IS-CRATE ?auto_11623 ) ( not ( = ?auto_11642 ?auto_11628 ) ) ( HOIST-AT ?auto_11643 ?auto_11642 ) ( AVAILABLE ?auto_11643 ) ( SURFACE-AT ?auto_11623 ?auto_11642 ) ( ON ?auto_11623 ?auto_11637 ) ( CLEAR ?auto_11623 ) ( not ( = ?auto_11622 ?auto_11623 ) ) ( not ( = ?auto_11622 ?auto_11637 ) ) ( not ( = ?auto_11623 ?auto_11637 ) ) ( not ( = ?auto_11630 ?auto_11643 ) ) ( IS-CRATE ?auto_11622 ) ( not ( = ?auto_11641 ?auto_11628 ) ) ( HOIST-AT ?auto_11634 ?auto_11641 ) ( SURFACE-AT ?auto_11622 ?auto_11641 ) ( ON ?auto_11622 ?auto_11632 ) ( CLEAR ?auto_11622 ) ( not ( = ?auto_11621 ?auto_11622 ) ) ( not ( = ?auto_11621 ?auto_11632 ) ) ( not ( = ?auto_11622 ?auto_11632 ) ) ( not ( = ?auto_11630 ?auto_11634 ) ) ( IS-CRATE ?auto_11621 ) ( SURFACE-AT ?auto_11621 ?auto_11641 ) ( ON ?auto_11621 ?auto_11640 ) ( CLEAR ?auto_11621 ) ( not ( = ?auto_11620 ?auto_11621 ) ) ( not ( = ?auto_11620 ?auto_11640 ) ) ( not ( = ?auto_11621 ?auto_11640 ) ) ( IS-CRATE ?auto_11620 ) ( AVAILABLE ?auto_11634 ) ( SURFACE-AT ?auto_11620 ?auto_11641 ) ( ON ?auto_11620 ?auto_11636 ) ( CLEAR ?auto_11620 ) ( not ( = ?auto_11619 ?auto_11620 ) ) ( not ( = ?auto_11619 ?auto_11636 ) ) ( not ( = ?auto_11620 ?auto_11636 ) ) ( IS-CRATE ?auto_11619 ) ( not ( = ?auto_11644 ?auto_11628 ) ) ( HOIST-AT ?auto_11645 ?auto_11644 ) ( AVAILABLE ?auto_11645 ) ( SURFACE-AT ?auto_11619 ?auto_11644 ) ( ON ?auto_11619 ?auto_11631 ) ( CLEAR ?auto_11619 ) ( not ( = ?auto_11618 ?auto_11619 ) ) ( not ( = ?auto_11618 ?auto_11631 ) ) ( not ( = ?auto_11619 ?auto_11631 ) ) ( not ( = ?auto_11630 ?auto_11645 ) ) ( IS-CRATE ?auto_11618 ) ( not ( = ?auto_11647 ?auto_11628 ) ) ( HOIST-AT ?auto_11635 ?auto_11647 ) ( AVAILABLE ?auto_11635 ) ( SURFACE-AT ?auto_11618 ?auto_11647 ) ( ON ?auto_11618 ?auto_11638 ) ( CLEAR ?auto_11618 ) ( not ( = ?auto_11617 ?auto_11618 ) ) ( not ( = ?auto_11617 ?auto_11638 ) ) ( not ( = ?auto_11618 ?auto_11638 ) ) ( not ( = ?auto_11630 ?auto_11635 ) ) ( SURFACE-AT ?auto_11616 ?auto_11628 ) ( CLEAR ?auto_11616 ) ( IS-CRATE ?auto_11617 ) ( AVAILABLE ?auto_11630 ) ( not ( = ?auto_11646 ?auto_11628 ) ) ( HOIST-AT ?auto_11639 ?auto_11646 ) ( AVAILABLE ?auto_11639 ) ( SURFACE-AT ?auto_11617 ?auto_11646 ) ( ON ?auto_11617 ?auto_11633 ) ( CLEAR ?auto_11617 ) ( TRUCK-AT ?auto_11626 ?auto_11628 ) ( not ( = ?auto_11616 ?auto_11617 ) ) ( not ( = ?auto_11616 ?auto_11633 ) ) ( not ( = ?auto_11617 ?auto_11633 ) ) ( not ( = ?auto_11630 ?auto_11639 ) ) ( not ( = ?auto_11616 ?auto_11618 ) ) ( not ( = ?auto_11616 ?auto_11638 ) ) ( not ( = ?auto_11618 ?auto_11633 ) ) ( not ( = ?auto_11647 ?auto_11646 ) ) ( not ( = ?auto_11635 ?auto_11639 ) ) ( not ( = ?auto_11638 ?auto_11633 ) ) ( not ( = ?auto_11616 ?auto_11619 ) ) ( not ( = ?auto_11616 ?auto_11631 ) ) ( not ( = ?auto_11617 ?auto_11619 ) ) ( not ( = ?auto_11617 ?auto_11631 ) ) ( not ( = ?auto_11619 ?auto_11638 ) ) ( not ( = ?auto_11619 ?auto_11633 ) ) ( not ( = ?auto_11644 ?auto_11647 ) ) ( not ( = ?auto_11644 ?auto_11646 ) ) ( not ( = ?auto_11645 ?auto_11635 ) ) ( not ( = ?auto_11645 ?auto_11639 ) ) ( not ( = ?auto_11631 ?auto_11638 ) ) ( not ( = ?auto_11631 ?auto_11633 ) ) ( not ( = ?auto_11616 ?auto_11620 ) ) ( not ( = ?auto_11616 ?auto_11636 ) ) ( not ( = ?auto_11617 ?auto_11620 ) ) ( not ( = ?auto_11617 ?auto_11636 ) ) ( not ( = ?auto_11618 ?auto_11620 ) ) ( not ( = ?auto_11618 ?auto_11636 ) ) ( not ( = ?auto_11620 ?auto_11631 ) ) ( not ( = ?auto_11620 ?auto_11638 ) ) ( not ( = ?auto_11620 ?auto_11633 ) ) ( not ( = ?auto_11641 ?auto_11644 ) ) ( not ( = ?auto_11641 ?auto_11647 ) ) ( not ( = ?auto_11641 ?auto_11646 ) ) ( not ( = ?auto_11634 ?auto_11645 ) ) ( not ( = ?auto_11634 ?auto_11635 ) ) ( not ( = ?auto_11634 ?auto_11639 ) ) ( not ( = ?auto_11636 ?auto_11631 ) ) ( not ( = ?auto_11636 ?auto_11638 ) ) ( not ( = ?auto_11636 ?auto_11633 ) ) ( not ( = ?auto_11616 ?auto_11621 ) ) ( not ( = ?auto_11616 ?auto_11640 ) ) ( not ( = ?auto_11617 ?auto_11621 ) ) ( not ( = ?auto_11617 ?auto_11640 ) ) ( not ( = ?auto_11618 ?auto_11621 ) ) ( not ( = ?auto_11618 ?auto_11640 ) ) ( not ( = ?auto_11619 ?auto_11621 ) ) ( not ( = ?auto_11619 ?auto_11640 ) ) ( not ( = ?auto_11621 ?auto_11636 ) ) ( not ( = ?auto_11621 ?auto_11631 ) ) ( not ( = ?auto_11621 ?auto_11638 ) ) ( not ( = ?auto_11621 ?auto_11633 ) ) ( not ( = ?auto_11640 ?auto_11636 ) ) ( not ( = ?auto_11640 ?auto_11631 ) ) ( not ( = ?auto_11640 ?auto_11638 ) ) ( not ( = ?auto_11640 ?auto_11633 ) ) ( not ( = ?auto_11616 ?auto_11622 ) ) ( not ( = ?auto_11616 ?auto_11632 ) ) ( not ( = ?auto_11617 ?auto_11622 ) ) ( not ( = ?auto_11617 ?auto_11632 ) ) ( not ( = ?auto_11618 ?auto_11622 ) ) ( not ( = ?auto_11618 ?auto_11632 ) ) ( not ( = ?auto_11619 ?auto_11622 ) ) ( not ( = ?auto_11619 ?auto_11632 ) ) ( not ( = ?auto_11620 ?auto_11622 ) ) ( not ( = ?auto_11620 ?auto_11632 ) ) ( not ( = ?auto_11622 ?auto_11640 ) ) ( not ( = ?auto_11622 ?auto_11636 ) ) ( not ( = ?auto_11622 ?auto_11631 ) ) ( not ( = ?auto_11622 ?auto_11638 ) ) ( not ( = ?auto_11622 ?auto_11633 ) ) ( not ( = ?auto_11632 ?auto_11640 ) ) ( not ( = ?auto_11632 ?auto_11636 ) ) ( not ( = ?auto_11632 ?auto_11631 ) ) ( not ( = ?auto_11632 ?auto_11638 ) ) ( not ( = ?auto_11632 ?auto_11633 ) ) ( not ( = ?auto_11616 ?auto_11623 ) ) ( not ( = ?auto_11616 ?auto_11637 ) ) ( not ( = ?auto_11617 ?auto_11623 ) ) ( not ( = ?auto_11617 ?auto_11637 ) ) ( not ( = ?auto_11618 ?auto_11623 ) ) ( not ( = ?auto_11618 ?auto_11637 ) ) ( not ( = ?auto_11619 ?auto_11623 ) ) ( not ( = ?auto_11619 ?auto_11637 ) ) ( not ( = ?auto_11620 ?auto_11623 ) ) ( not ( = ?auto_11620 ?auto_11637 ) ) ( not ( = ?auto_11621 ?auto_11623 ) ) ( not ( = ?auto_11621 ?auto_11637 ) ) ( not ( = ?auto_11623 ?auto_11632 ) ) ( not ( = ?auto_11623 ?auto_11640 ) ) ( not ( = ?auto_11623 ?auto_11636 ) ) ( not ( = ?auto_11623 ?auto_11631 ) ) ( not ( = ?auto_11623 ?auto_11638 ) ) ( not ( = ?auto_11623 ?auto_11633 ) ) ( not ( = ?auto_11642 ?auto_11641 ) ) ( not ( = ?auto_11642 ?auto_11644 ) ) ( not ( = ?auto_11642 ?auto_11647 ) ) ( not ( = ?auto_11642 ?auto_11646 ) ) ( not ( = ?auto_11643 ?auto_11634 ) ) ( not ( = ?auto_11643 ?auto_11645 ) ) ( not ( = ?auto_11643 ?auto_11635 ) ) ( not ( = ?auto_11643 ?auto_11639 ) ) ( not ( = ?auto_11637 ?auto_11632 ) ) ( not ( = ?auto_11637 ?auto_11640 ) ) ( not ( = ?auto_11637 ?auto_11636 ) ) ( not ( = ?auto_11637 ?auto_11631 ) ) ( not ( = ?auto_11637 ?auto_11638 ) ) ( not ( = ?auto_11637 ?auto_11633 ) ) ( not ( = ?auto_11616 ?auto_11624 ) ) ( not ( = ?auto_11616 ?auto_11625 ) ) ( not ( = ?auto_11617 ?auto_11624 ) ) ( not ( = ?auto_11617 ?auto_11625 ) ) ( not ( = ?auto_11618 ?auto_11624 ) ) ( not ( = ?auto_11618 ?auto_11625 ) ) ( not ( = ?auto_11619 ?auto_11624 ) ) ( not ( = ?auto_11619 ?auto_11625 ) ) ( not ( = ?auto_11620 ?auto_11624 ) ) ( not ( = ?auto_11620 ?auto_11625 ) ) ( not ( = ?auto_11621 ?auto_11624 ) ) ( not ( = ?auto_11621 ?auto_11625 ) ) ( not ( = ?auto_11622 ?auto_11624 ) ) ( not ( = ?auto_11622 ?auto_11625 ) ) ( not ( = ?auto_11624 ?auto_11637 ) ) ( not ( = ?auto_11624 ?auto_11632 ) ) ( not ( = ?auto_11624 ?auto_11640 ) ) ( not ( = ?auto_11624 ?auto_11636 ) ) ( not ( = ?auto_11624 ?auto_11631 ) ) ( not ( = ?auto_11624 ?auto_11638 ) ) ( not ( = ?auto_11624 ?auto_11633 ) ) ( not ( = ?auto_11629 ?auto_11642 ) ) ( not ( = ?auto_11629 ?auto_11641 ) ) ( not ( = ?auto_11629 ?auto_11644 ) ) ( not ( = ?auto_11629 ?auto_11647 ) ) ( not ( = ?auto_11629 ?auto_11646 ) ) ( not ( = ?auto_11627 ?auto_11643 ) ) ( not ( = ?auto_11627 ?auto_11634 ) ) ( not ( = ?auto_11627 ?auto_11645 ) ) ( not ( = ?auto_11627 ?auto_11635 ) ) ( not ( = ?auto_11627 ?auto_11639 ) ) ( not ( = ?auto_11625 ?auto_11637 ) ) ( not ( = ?auto_11625 ?auto_11632 ) ) ( not ( = ?auto_11625 ?auto_11640 ) ) ( not ( = ?auto_11625 ?auto_11636 ) ) ( not ( = ?auto_11625 ?auto_11631 ) ) ( not ( = ?auto_11625 ?auto_11638 ) ) ( not ( = ?auto_11625 ?auto_11633 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_11616 ?auto_11617 ?auto_11618 ?auto_11619 ?auto_11620 ?auto_11621 ?auto_11622 ?auto_11623 )
      ( MAKE-1CRATE ?auto_11623 ?auto_11624 )
      ( MAKE-8CRATE-VERIFY ?auto_11616 ?auto_11617 ?auto_11618 ?auto_11619 ?auto_11620 ?auto_11621 ?auto_11622 ?auto_11623 ?auto_11624 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_11668 - SURFACE
      ?auto_11669 - SURFACE
      ?auto_11670 - SURFACE
      ?auto_11671 - SURFACE
      ?auto_11672 - SURFACE
      ?auto_11673 - SURFACE
      ?auto_11674 - SURFACE
      ?auto_11675 - SURFACE
      ?auto_11676 - SURFACE
      ?auto_11677 - SURFACE
    )
    :vars
    (
      ?auto_11683 - HOIST
      ?auto_11682 - PLACE
      ?auto_11680 - PLACE
      ?auto_11681 - HOIST
      ?auto_11679 - SURFACE
      ?auto_11684 - PLACE
      ?auto_11687 - HOIST
      ?auto_11699 - SURFACE
      ?auto_11689 - PLACE
      ?auto_11700 - HOIST
      ?auto_11688 - SURFACE
      ?auto_11694 - PLACE
      ?auto_11698 - HOIST
      ?auto_11690 - SURFACE
      ?auto_11686 - SURFACE
      ?auto_11701 - SURFACE
      ?auto_11693 - SURFACE
      ?auto_11695 - PLACE
      ?auto_11692 - HOIST
      ?auto_11697 - SURFACE
      ?auto_11685 - PLACE
      ?auto_11691 - HOIST
      ?auto_11696 - SURFACE
      ?auto_11678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11683 ?auto_11682 ) ( IS-CRATE ?auto_11677 ) ( not ( = ?auto_11680 ?auto_11682 ) ) ( HOIST-AT ?auto_11681 ?auto_11680 ) ( SURFACE-AT ?auto_11677 ?auto_11680 ) ( ON ?auto_11677 ?auto_11679 ) ( CLEAR ?auto_11677 ) ( not ( = ?auto_11676 ?auto_11677 ) ) ( not ( = ?auto_11676 ?auto_11679 ) ) ( not ( = ?auto_11677 ?auto_11679 ) ) ( not ( = ?auto_11683 ?auto_11681 ) ) ( IS-CRATE ?auto_11676 ) ( not ( = ?auto_11684 ?auto_11682 ) ) ( HOIST-AT ?auto_11687 ?auto_11684 ) ( AVAILABLE ?auto_11687 ) ( SURFACE-AT ?auto_11676 ?auto_11684 ) ( ON ?auto_11676 ?auto_11699 ) ( CLEAR ?auto_11676 ) ( not ( = ?auto_11675 ?auto_11676 ) ) ( not ( = ?auto_11675 ?auto_11699 ) ) ( not ( = ?auto_11676 ?auto_11699 ) ) ( not ( = ?auto_11683 ?auto_11687 ) ) ( IS-CRATE ?auto_11675 ) ( not ( = ?auto_11689 ?auto_11682 ) ) ( HOIST-AT ?auto_11700 ?auto_11689 ) ( AVAILABLE ?auto_11700 ) ( SURFACE-AT ?auto_11675 ?auto_11689 ) ( ON ?auto_11675 ?auto_11688 ) ( CLEAR ?auto_11675 ) ( not ( = ?auto_11674 ?auto_11675 ) ) ( not ( = ?auto_11674 ?auto_11688 ) ) ( not ( = ?auto_11675 ?auto_11688 ) ) ( not ( = ?auto_11683 ?auto_11700 ) ) ( IS-CRATE ?auto_11674 ) ( not ( = ?auto_11694 ?auto_11682 ) ) ( HOIST-AT ?auto_11698 ?auto_11694 ) ( SURFACE-AT ?auto_11674 ?auto_11694 ) ( ON ?auto_11674 ?auto_11690 ) ( CLEAR ?auto_11674 ) ( not ( = ?auto_11673 ?auto_11674 ) ) ( not ( = ?auto_11673 ?auto_11690 ) ) ( not ( = ?auto_11674 ?auto_11690 ) ) ( not ( = ?auto_11683 ?auto_11698 ) ) ( IS-CRATE ?auto_11673 ) ( SURFACE-AT ?auto_11673 ?auto_11694 ) ( ON ?auto_11673 ?auto_11686 ) ( CLEAR ?auto_11673 ) ( not ( = ?auto_11672 ?auto_11673 ) ) ( not ( = ?auto_11672 ?auto_11686 ) ) ( not ( = ?auto_11673 ?auto_11686 ) ) ( IS-CRATE ?auto_11672 ) ( AVAILABLE ?auto_11698 ) ( SURFACE-AT ?auto_11672 ?auto_11694 ) ( ON ?auto_11672 ?auto_11701 ) ( CLEAR ?auto_11672 ) ( not ( = ?auto_11671 ?auto_11672 ) ) ( not ( = ?auto_11671 ?auto_11701 ) ) ( not ( = ?auto_11672 ?auto_11701 ) ) ( IS-CRATE ?auto_11671 ) ( AVAILABLE ?auto_11681 ) ( SURFACE-AT ?auto_11671 ?auto_11680 ) ( ON ?auto_11671 ?auto_11693 ) ( CLEAR ?auto_11671 ) ( not ( = ?auto_11670 ?auto_11671 ) ) ( not ( = ?auto_11670 ?auto_11693 ) ) ( not ( = ?auto_11671 ?auto_11693 ) ) ( IS-CRATE ?auto_11670 ) ( not ( = ?auto_11695 ?auto_11682 ) ) ( HOIST-AT ?auto_11692 ?auto_11695 ) ( AVAILABLE ?auto_11692 ) ( SURFACE-AT ?auto_11670 ?auto_11695 ) ( ON ?auto_11670 ?auto_11697 ) ( CLEAR ?auto_11670 ) ( not ( = ?auto_11669 ?auto_11670 ) ) ( not ( = ?auto_11669 ?auto_11697 ) ) ( not ( = ?auto_11670 ?auto_11697 ) ) ( not ( = ?auto_11683 ?auto_11692 ) ) ( SURFACE-AT ?auto_11668 ?auto_11682 ) ( CLEAR ?auto_11668 ) ( IS-CRATE ?auto_11669 ) ( AVAILABLE ?auto_11683 ) ( not ( = ?auto_11685 ?auto_11682 ) ) ( HOIST-AT ?auto_11691 ?auto_11685 ) ( AVAILABLE ?auto_11691 ) ( SURFACE-AT ?auto_11669 ?auto_11685 ) ( ON ?auto_11669 ?auto_11696 ) ( CLEAR ?auto_11669 ) ( TRUCK-AT ?auto_11678 ?auto_11682 ) ( not ( = ?auto_11668 ?auto_11669 ) ) ( not ( = ?auto_11668 ?auto_11696 ) ) ( not ( = ?auto_11669 ?auto_11696 ) ) ( not ( = ?auto_11683 ?auto_11691 ) ) ( not ( = ?auto_11668 ?auto_11670 ) ) ( not ( = ?auto_11668 ?auto_11697 ) ) ( not ( = ?auto_11670 ?auto_11696 ) ) ( not ( = ?auto_11695 ?auto_11685 ) ) ( not ( = ?auto_11692 ?auto_11691 ) ) ( not ( = ?auto_11697 ?auto_11696 ) ) ( not ( = ?auto_11668 ?auto_11671 ) ) ( not ( = ?auto_11668 ?auto_11693 ) ) ( not ( = ?auto_11669 ?auto_11671 ) ) ( not ( = ?auto_11669 ?auto_11693 ) ) ( not ( = ?auto_11671 ?auto_11697 ) ) ( not ( = ?auto_11671 ?auto_11696 ) ) ( not ( = ?auto_11680 ?auto_11695 ) ) ( not ( = ?auto_11680 ?auto_11685 ) ) ( not ( = ?auto_11681 ?auto_11692 ) ) ( not ( = ?auto_11681 ?auto_11691 ) ) ( not ( = ?auto_11693 ?auto_11697 ) ) ( not ( = ?auto_11693 ?auto_11696 ) ) ( not ( = ?auto_11668 ?auto_11672 ) ) ( not ( = ?auto_11668 ?auto_11701 ) ) ( not ( = ?auto_11669 ?auto_11672 ) ) ( not ( = ?auto_11669 ?auto_11701 ) ) ( not ( = ?auto_11670 ?auto_11672 ) ) ( not ( = ?auto_11670 ?auto_11701 ) ) ( not ( = ?auto_11672 ?auto_11693 ) ) ( not ( = ?auto_11672 ?auto_11697 ) ) ( not ( = ?auto_11672 ?auto_11696 ) ) ( not ( = ?auto_11694 ?auto_11680 ) ) ( not ( = ?auto_11694 ?auto_11695 ) ) ( not ( = ?auto_11694 ?auto_11685 ) ) ( not ( = ?auto_11698 ?auto_11681 ) ) ( not ( = ?auto_11698 ?auto_11692 ) ) ( not ( = ?auto_11698 ?auto_11691 ) ) ( not ( = ?auto_11701 ?auto_11693 ) ) ( not ( = ?auto_11701 ?auto_11697 ) ) ( not ( = ?auto_11701 ?auto_11696 ) ) ( not ( = ?auto_11668 ?auto_11673 ) ) ( not ( = ?auto_11668 ?auto_11686 ) ) ( not ( = ?auto_11669 ?auto_11673 ) ) ( not ( = ?auto_11669 ?auto_11686 ) ) ( not ( = ?auto_11670 ?auto_11673 ) ) ( not ( = ?auto_11670 ?auto_11686 ) ) ( not ( = ?auto_11671 ?auto_11673 ) ) ( not ( = ?auto_11671 ?auto_11686 ) ) ( not ( = ?auto_11673 ?auto_11701 ) ) ( not ( = ?auto_11673 ?auto_11693 ) ) ( not ( = ?auto_11673 ?auto_11697 ) ) ( not ( = ?auto_11673 ?auto_11696 ) ) ( not ( = ?auto_11686 ?auto_11701 ) ) ( not ( = ?auto_11686 ?auto_11693 ) ) ( not ( = ?auto_11686 ?auto_11697 ) ) ( not ( = ?auto_11686 ?auto_11696 ) ) ( not ( = ?auto_11668 ?auto_11674 ) ) ( not ( = ?auto_11668 ?auto_11690 ) ) ( not ( = ?auto_11669 ?auto_11674 ) ) ( not ( = ?auto_11669 ?auto_11690 ) ) ( not ( = ?auto_11670 ?auto_11674 ) ) ( not ( = ?auto_11670 ?auto_11690 ) ) ( not ( = ?auto_11671 ?auto_11674 ) ) ( not ( = ?auto_11671 ?auto_11690 ) ) ( not ( = ?auto_11672 ?auto_11674 ) ) ( not ( = ?auto_11672 ?auto_11690 ) ) ( not ( = ?auto_11674 ?auto_11686 ) ) ( not ( = ?auto_11674 ?auto_11701 ) ) ( not ( = ?auto_11674 ?auto_11693 ) ) ( not ( = ?auto_11674 ?auto_11697 ) ) ( not ( = ?auto_11674 ?auto_11696 ) ) ( not ( = ?auto_11690 ?auto_11686 ) ) ( not ( = ?auto_11690 ?auto_11701 ) ) ( not ( = ?auto_11690 ?auto_11693 ) ) ( not ( = ?auto_11690 ?auto_11697 ) ) ( not ( = ?auto_11690 ?auto_11696 ) ) ( not ( = ?auto_11668 ?auto_11675 ) ) ( not ( = ?auto_11668 ?auto_11688 ) ) ( not ( = ?auto_11669 ?auto_11675 ) ) ( not ( = ?auto_11669 ?auto_11688 ) ) ( not ( = ?auto_11670 ?auto_11675 ) ) ( not ( = ?auto_11670 ?auto_11688 ) ) ( not ( = ?auto_11671 ?auto_11675 ) ) ( not ( = ?auto_11671 ?auto_11688 ) ) ( not ( = ?auto_11672 ?auto_11675 ) ) ( not ( = ?auto_11672 ?auto_11688 ) ) ( not ( = ?auto_11673 ?auto_11675 ) ) ( not ( = ?auto_11673 ?auto_11688 ) ) ( not ( = ?auto_11675 ?auto_11690 ) ) ( not ( = ?auto_11675 ?auto_11686 ) ) ( not ( = ?auto_11675 ?auto_11701 ) ) ( not ( = ?auto_11675 ?auto_11693 ) ) ( not ( = ?auto_11675 ?auto_11697 ) ) ( not ( = ?auto_11675 ?auto_11696 ) ) ( not ( = ?auto_11689 ?auto_11694 ) ) ( not ( = ?auto_11689 ?auto_11680 ) ) ( not ( = ?auto_11689 ?auto_11695 ) ) ( not ( = ?auto_11689 ?auto_11685 ) ) ( not ( = ?auto_11700 ?auto_11698 ) ) ( not ( = ?auto_11700 ?auto_11681 ) ) ( not ( = ?auto_11700 ?auto_11692 ) ) ( not ( = ?auto_11700 ?auto_11691 ) ) ( not ( = ?auto_11688 ?auto_11690 ) ) ( not ( = ?auto_11688 ?auto_11686 ) ) ( not ( = ?auto_11688 ?auto_11701 ) ) ( not ( = ?auto_11688 ?auto_11693 ) ) ( not ( = ?auto_11688 ?auto_11697 ) ) ( not ( = ?auto_11688 ?auto_11696 ) ) ( not ( = ?auto_11668 ?auto_11676 ) ) ( not ( = ?auto_11668 ?auto_11699 ) ) ( not ( = ?auto_11669 ?auto_11676 ) ) ( not ( = ?auto_11669 ?auto_11699 ) ) ( not ( = ?auto_11670 ?auto_11676 ) ) ( not ( = ?auto_11670 ?auto_11699 ) ) ( not ( = ?auto_11671 ?auto_11676 ) ) ( not ( = ?auto_11671 ?auto_11699 ) ) ( not ( = ?auto_11672 ?auto_11676 ) ) ( not ( = ?auto_11672 ?auto_11699 ) ) ( not ( = ?auto_11673 ?auto_11676 ) ) ( not ( = ?auto_11673 ?auto_11699 ) ) ( not ( = ?auto_11674 ?auto_11676 ) ) ( not ( = ?auto_11674 ?auto_11699 ) ) ( not ( = ?auto_11676 ?auto_11688 ) ) ( not ( = ?auto_11676 ?auto_11690 ) ) ( not ( = ?auto_11676 ?auto_11686 ) ) ( not ( = ?auto_11676 ?auto_11701 ) ) ( not ( = ?auto_11676 ?auto_11693 ) ) ( not ( = ?auto_11676 ?auto_11697 ) ) ( not ( = ?auto_11676 ?auto_11696 ) ) ( not ( = ?auto_11684 ?auto_11689 ) ) ( not ( = ?auto_11684 ?auto_11694 ) ) ( not ( = ?auto_11684 ?auto_11680 ) ) ( not ( = ?auto_11684 ?auto_11695 ) ) ( not ( = ?auto_11684 ?auto_11685 ) ) ( not ( = ?auto_11687 ?auto_11700 ) ) ( not ( = ?auto_11687 ?auto_11698 ) ) ( not ( = ?auto_11687 ?auto_11681 ) ) ( not ( = ?auto_11687 ?auto_11692 ) ) ( not ( = ?auto_11687 ?auto_11691 ) ) ( not ( = ?auto_11699 ?auto_11688 ) ) ( not ( = ?auto_11699 ?auto_11690 ) ) ( not ( = ?auto_11699 ?auto_11686 ) ) ( not ( = ?auto_11699 ?auto_11701 ) ) ( not ( = ?auto_11699 ?auto_11693 ) ) ( not ( = ?auto_11699 ?auto_11697 ) ) ( not ( = ?auto_11699 ?auto_11696 ) ) ( not ( = ?auto_11668 ?auto_11677 ) ) ( not ( = ?auto_11668 ?auto_11679 ) ) ( not ( = ?auto_11669 ?auto_11677 ) ) ( not ( = ?auto_11669 ?auto_11679 ) ) ( not ( = ?auto_11670 ?auto_11677 ) ) ( not ( = ?auto_11670 ?auto_11679 ) ) ( not ( = ?auto_11671 ?auto_11677 ) ) ( not ( = ?auto_11671 ?auto_11679 ) ) ( not ( = ?auto_11672 ?auto_11677 ) ) ( not ( = ?auto_11672 ?auto_11679 ) ) ( not ( = ?auto_11673 ?auto_11677 ) ) ( not ( = ?auto_11673 ?auto_11679 ) ) ( not ( = ?auto_11674 ?auto_11677 ) ) ( not ( = ?auto_11674 ?auto_11679 ) ) ( not ( = ?auto_11675 ?auto_11677 ) ) ( not ( = ?auto_11675 ?auto_11679 ) ) ( not ( = ?auto_11677 ?auto_11699 ) ) ( not ( = ?auto_11677 ?auto_11688 ) ) ( not ( = ?auto_11677 ?auto_11690 ) ) ( not ( = ?auto_11677 ?auto_11686 ) ) ( not ( = ?auto_11677 ?auto_11701 ) ) ( not ( = ?auto_11677 ?auto_11693 ) ) ( not ( = ?auto_11677 ?auto_11697 ) ) ( not ( = ?auto_11677 ?auto_11696 ) ) ( not ( = ?auto_11679 ?auto_11699 ) ) ( not ( = ?auto_11679 ?auto_11688 ) ) ( not ( = ?auto_11679 ?auto_11690 ) ) ( not ( = ?auto_11679 ?auto_11686 ) ) ( not ( = ?auto_11679 ?auto_11701 ) ) ( not ( = ?auto_11679 ?auto_11693 ) ) ( not ( = ?auto_11679 ?auto_11697 ) ) ( not ( = ?auto_11679 ?auto_11696 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_11668 ?auto_11669 ?auto_11670 ?auto_11671 ?auto_11672 ?auto_11673 ?auto_11674 ?auto_11675 ?auto_11676 )
      ( MAKE-1CRATE ?auto_11676 ?auto_11677 )
      ( MAKE-9CRATE-VERIFY ?auto_11668 ?auto_11669 ?auto_11670 ?auto_11671 ?auto_11672 ?auto_11673 ?auto_11674 ?auto_11675 ?auto_11676 ?auto_11677 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_11723 - SURFACE
      ?auto_11724 - SURFACE
      ?auto_11725 - SURFACE
      ?auto_11726 - SURFACE
      ?auto_11727 - SURFACE
      ?auto_11728 - SURFACE
      ?auto_11729 - SURFACE
      ?auto_11730 - SURFACE
      ?auto_11731 - SURFACE
      ?auto_11732 - SURFACE
      ?auto_11733 - SURFACE
    )
    :vars
    (
      ?auto_11739 - HOIST
      ?auto_11738 - PLACE
      ?auto_11736 - PLACE
      ?auto_11737 - HOIST
      ?auto_11734 - SURFACE
      ?auto_11741 - PLACE
      ?auto_11756 - HOIST
      ?auto_11755 - SURFACE
      ?auto_11746 - PLACE
      ?auto_11743 - HOIST
      ?auto_11745 - SURFACE
      ?auto_11753 - PLACE
      ?auto_11757 - HOIST
      ?auto_11760 - SURFACE
      ?auto_11749 - PLACE
      ?auto_11754 - HOIST
      ?auto_11744 - SURFACE
      ?auto_11758 - SURFACE
      ?auto_11748 - SURFACE
      ?auto_11740 - SURFACE
      ?auto_11752 - PLACE
      ?auto_11750 - HOIST
      ?auto_11751 - SURFACE
      ?auto_11747 - PLACE
      ?auto_11759 - HOIST
      ?auto_11742 - SURFACE
      ?auto_11735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11739 ?auto_11738 ) ( IS-CRATE ?auto_11733 ) ( not ( = ?auto_11736 ?auto_11738 ) ) ( HOIST-AT ?auto_11737 ?auto_11736 ) ( AVAILABLE ?auto_11737 ) ( SURFACE-AT ?auto_11733 ?auto_11736 ) ( ON ?auto_11733 ?auto_11734 ) ( CLEAR ?auto_11733 ) ( not ( = ?auto_11732 ?auto_11733 ) ) ( not ( = ?auto_11732 ?auto_11734 ) ) ( not ( = ?auto_11733 ?auto_11734 ) ) ( not ( = ?auto_11739 ?auto_11737 ) ) ( IS-CRATE ?auto_11732 ) ( not ( = ?auto_11741 ?auto_11738 ) ) ( HOIST-AT ?auto_11756 ?auto_11741 ) ( SURFACE-AT ?auto_11732 ?auto_11741 ) ( ON ?auto_11732 ?auto_11755 ) ( CLEAR ?auto_11732 ) ( not ( = ?auto_11731 ?auto_11732 ) ) ( not ( = ?auto_11731 ?auto_11755 ) ) ( not ( = ?auto_11732 ?auto_11755 ) ) ( not ( = ?auto_11739 ?auto_11756 ) ) ( IS-CRATE ?auto_11731 ) ( not ( = ?auto_11746 ?auto_11738 ) ) ( HOIST-AT ?auto_11743 ?auto_11746 ) ( AVAILABLE ?auto_11743 ) ( SURFACE-AT ?auto_11731 ?auto_11746 ) ( ON ?auto_11731 ?auto_11745 ) ( CLEAR ?auto_11731 ) ( not ( = ?auto_11730 ?auto_11731 ) ) ( not ( = ?auto_11730 ?auto_11745 ) ) ( not ( = ?auto_11731 ?auto_11745 ) ) ( not ( = ?auto_11739 ?auto_11743 ) ) ( IS-CRATE ?auto_11730 ) ( not ( = ?auto_11753 ?auto_11738 ) ) ( HOIST-AT ?auto_11757 ?auto_11753 ) ( AVAILABLE ?auto_11757 ) ( SURFACE-AT ?auto_11730 ?auto_11753 ) ( ON ?auto_11730 ?auto_11760 ) ( CLEAR ?auto_11730 ) ( not ( = ?auto_11729 ?auto_11730 ) ) ( not ( = ?auto_11729 ?auto_11760 ) ) ( not ( = ?auto_11730 ?auto_11760 ) ) ( not ( = ?auto_11739 ?auto_11757 ) ) ( IS-CRATE ?auto_11729 ) ( not ( = ?auto_11749 ?auto_11738 ) ) ( HOIST-AT ?auto_11754 ?auto_11749 ) ( SURFACE-AT ?auto_11729 ?auto_11749 ) ( ON ?auto_11729 ?auto_11744 ) ( CLEAR ?auto_11729 ) ( not ( = ?auto_11728 ?auto_11729 ) ) ( not ( = ?auto_11728 ?auto_11744 ) ) ( not ( = ?auto_11729 ?auto_11744 ) ) ( not ( = ?auto_11739 ?auto_11754 ) ) ( IS-CRATE ?auto_11728 ) ( SURFACE-AT ?auto_11728 ?auto_11749 ) ( ON ?auto_11728 ?auto_11758 ) ( CLEAR ?auto_11728 ) ( not ( = ?auto_11727 ?auto_11728 ) ) ( not ( = ?auto_11727 ?auto_11758 ) ) ( not ( = ?auto_11728 ?auto_11758 ) ) ( IS-CRATE ?auto_11727 ) ( AVAILABLE ?auto_11754 ) ( SURFACE-AT ?auto_11727 ?auto_11749 ) ( ON ?auto_11727 ?auto_11748 ) ( CLEAR ?auto_11727 ) ( not ( = ?auto_11726 ?auto_11727 ) ) ( not ( = ?auto_11726 ?auto_11748 ) ) ( not ( = ?auto_11727 ?auto_11748 ) ) ( IS-CRATE ?auto_11726 ) ( AVAILABLE ?auto_11756 ) ( SURFACE-AT ?auto_11726 ?auto_11741 ) ( ON ?auto_11726 ?auto_11740 ) ( CLEAR ?auto_11726 ) ( not ( = ?auto_11725 ?auto_11726 ) ) ( not ( = ?auto_11725 ?auto_11740 ) ) ( not ( = ?auto_11726 ?auto_11740 ) ) ( IS-CRATE ?auto_11725 ) ( not ( = ?auto_11752 ?auto_11738 ) ) ( HOIST-AT ?auto_11750 ?auto_11752 ) ( AVAILABLE ?auto_11750 ) ( SURFACE-AT ?auto_11725 ?auto_11752 ) ( ON ?auto_11725 ?auto_11751 ) ( CLEAR ?auto_11725 ) ( not ( = ?auto_11724 ?auto_11725 ) ) ( not ( = ?auto_11724 ?auto_11751 ) ) ( not ( = ?auto_11725 ?auto_11751 ) ) ( not ( = ?auto_11739 ?auto_11750 ) ) ( SURFACE-AT ?auto_11723 ?auto_11738 ) ( CLEAR ?auto_11723 ) ( IS-CRATE ?auto_11724 ) ( AVAILABLE ?auto_11739 ) ( not ( = ?auto_11747 ?auto_11738 ) ) ( HOIST-AT ?auto_11759 ?auto_11747 ) ( AVAILABLE ?auto_11759 ) ( SURFACE-AT ?auto_11724 ?auto_11747 ) ( ON ?auto_11724 ?auto_11742 ) ( CLEAR ?auto_11724 ) ( TRUCK-AT ?auto_11735 ?auto_11738 ) ( not ( = ?auto_11723 ?auto_11724 ) ) ( not ( = ?auto_11723 ?auto_11742 ) ) ( not ( = ?auto_11724 ?auto_11742 ) ) ( not ( = ?auto_11739 ?auto_11759 ) ) ( not ( = ?auto_11723 ?auto_11725 ) ) ( not ( = ?auto_11723 ?auto_11751 ) ) ( not ( = ?auto_11725 ?auto_11742 ) ) ( not ( = ?auto_11752 ?auto_11747 ) ) ( not ( = ?auto_11750 ?auto_11759 ) ) ( not ( = ?auto_11751 ?auto_11742 ) ) ( not ( = ?auto_11723 ?auto_11726 ) ) ( not ( = ?auto_11723 ?auto_11740 ) ) ( not ( = ?auto_11724 ?auto_11726 ) ) ( not ( = ?auto_11724 ?auto_11740 ) ) ( not ( = ?auto_11726 ?auto_11751 ) ) ( not ( = ?auto_11726 ?auto_11742 ) ) ( not ( = ?auto_11741 ?auto_11752 ) ) ( not ( = ?auto_11741 ?auto_11747 ) ) ( not ( = ?auto_11756 ?auto_11750 ) ) ( not ( = ?auto_11756 ?auto_11759 ) ) ( not ( = ?auto_11740 ?auto_11751 ) ) ( not ( = ?auto_11740 ?auto_11742 ) ) ( not ( = ?auto_11723 ?auto_11727 ) ) ( not ( = ?auto_11723 ?auto_11748 ) ) ( not ( = ?auto_11724 ?auto_11727 ) ) ( not ( = ?auto_11724 ?auto_11748 ) ) ( not ( = ?auto_11725 ?auto_11727 ) ) ( not ( = ?auto_11725 ?auto_11748 ) ) ( not ( = ?auto_11727 ?auto_11740 ) ) ( not ( = ?auto_11727 ?auto_11751 ) ) ( not ( = ?auto_11727 ?auto_11742 ) ) ( not ( = ?auto_11749 ?auto_11741 ) ) ( not ( = ?auto_11749 ?auto_11752 ) ) ( not ( = ?auto_11749 ?auto_11747 ) ) ( not ( = ?auto_11754 ?auto_11756 ) ) ( not ( = ?auto_11754 ?auto_11750 ) ) ( not ( = ?auto_11754 ?auto_11759 ) ) ( not ( = ?auto_11748 ?auto_11740 ) ) ( not ( = ?auto_11748 ?auto_11751 ) ) ( not ( = ?auto_11748 ?auto_11742 ) ) ( not ( = ?auto_11723 ?auto_11728 ) ) ( not ( = ?auto_11723 ?auto_11758 ) ) ( not ( = ?auto_11724 ?auto_11728 ) ) ( not ( = ?auto_11724 ?auto_11758 ) ) ( not ( = ?auto_11725 ?auto_11728 ) ) ( not ( = ?auto_11725 ?auto_11758 ) ) ( not ( = ?auto_11726 ?auto_11728 ) ) ( not ( = ?auto_11726 ?auto_11758 ) ) ( not ( = ?auto_11728 ?auto_11748 ) ) ( not ( = ?auto_11728 ?auto_11740 ) ) ( not ( = ?auto_11728 ?auto_11751 ) ) ( not ( = ?auto_11728 ?auto_11742 ) ) ( not ( = ?auto_11758 ?auto_11748 ) ) ( not ( = ?auto_11758 ?auto_11740 ) ) ( not ( = ?auto_11758 ?auto_11751 ) ) ( not ( = ?auto_11758 ?auto_11742 ) ) ( not ( = ?auto_11723 ?auto_11729 ) ) ( not ( = ?auto_11723 ?auto_11744 ) ) ( not ( = ?auto_11724 ?auto_11729 ) ) ( not ( = ?auto_11724 ?auto_11744 ) ) ( not ( = ?auto_11725 ?auto_11729 ) ) ( not ( = ?auto_11725 ?auto_11744 ) ) ( not ( = ?auto_11726 ?auto_11729 ) ) ( not ( = ?auto_11726 ?auto_11744 ) ) ( not ( = ?auto_11727 ?auto_11729 ) ) ( not ( = ?auto_11727 ?auto_11744 ) ) ( not ( = ?auto_11729 ?auto_11758 ) ) ( not ( = ?auto_11729 ?auto_11748 ) ) ( not ( = ?auto_11729 ?auto_11740 ) ) ( not ( = ?auto_11729 ?auto_11751 ) ) ( not ( = ?auto_11729 ?auto_11742 ) ) ( not ( = ?auto_11744 ?auto_11758 ) ) ( not ( = ?auto_11744 ?auto_11748 ) ) ( not ( = ?auto_11744 ?auto_11740 ) ) ( not ( = ?auto_11744 ?auto_11751 ) ) ( not ( = ?auto_11744 ?auto_11742 ) ) ( not ( = ?auto_11723 ?auto_11730 ) ) ( not ( = ?auto_11723 ?auto_11760 ) ) ( not ( = ?auto_11724 ?auto_11730 ) ) ( not ( = ?auto_11724 ?auto_11760 ) ) ( not ( = ?auto_11725 ?auto_11730 ) ) ( not ( = ?auto_11725 ?auto_11760 ) ) ( not ( = ?auto_11726 ?auto_11730 ) ) ( not ( = ?auto_11726 ?auto_11760 ) ) ( not ( = ?auto_11727 ?auto_11730 ) ) ( not ( = ?auto_11727 ?auto_11760 ) ) ( not ( = ?auto_11728 ?auto_11730 ) ) ( not ( = ?auto_11728 ?auto_11760 ) ) ( not ( = ?auto_11730 ?auto_11744 ) ) ( not ( = ?auto_11730 ?auto_11758 ) ) ( not ( = ?auto_11730 ?auto_11748 ) ) ( not ( = ?auto_11730 ?auto_11740 ) ) ( not ( = ?auto_11730 ?auto_11751 ) ) ( not ( = ?auto_11730 ?auto_11742 ) ) ( not ( = ?auto_11753 ?auto_11749 ) ) ( not ( = ?auto_11753 ?auto_11741 ) ) ( not ( = ?auto_11753 ?auto_11752 ) ) ( not ( = ?auto_11753 ?auto_11747 ) ) ( not ( = ?auto_11757 ?auto_11754 ) ) ( not ( = ?auto_11757 ?auto_11756 ) ) ( not ( = ?auto_11757 ?auto_11750 ) ) ( not ( = ?auto_11757 ?auto_11759 ) ) ( not ( = ?auto_11760 ?auto_11744 ) ) ( not ( = ?auto_11760 ?auto_11758 ) ) ( not ( = ?auto_11760 ?auto_11748 ) ) ( not ( = ?auto_11760 ?auto_11740 ) ) ( not ( = ?auto_11760 ?auto_11751 ) ) ( not ( = ?auto_11760 ?auto_11742 ) ) ( not ( = ?auto_11723 ?auto_11731 ) ) ( not ( = ?auto_11723 ?auto_11745 ) ) ( not ( = ?auto_11724 ?auto_11731 ) ) ( not ( = ?auto_11724 ?auto_11745 ) ) ( not ( = ?auto_11725 ?auto_11731 ) ) ( not ( = ?auto_11725 ?auto_11745 ) ) ( not ( = ?auto_11726 ?auto_11731 ) ) ( not ( = ?auto_11726 ?auto_11745 ) ) ( not ( = ?auto_11727 ?auto_11731 ) ) ( not ( = ?auto_11727 ?auto_11745 ) ) ( not ( = ?auto_11728 ?auto_11731 ) ) ( not ( = ?auto_11728 ?auto_11745 ) ) ( not ( = ?auto_11729 ?auto_11731 ) ) ( not ( = ?auto_11729 ?auto_11745 ) ) ( not ( = ?auto_11731 ?auto_11760 ) ) ( not ( = ?auto_11731 ?auto_11744 ) ) ( not ( = ?auto_11731 ?auto_11758 ) ) ( not ( = ?auto_11731 ?auto_11748 ) ) ( not ( = ?auto_11731 ?auto_11740 ) ) ( not ( = ?auto_11731 ?auto_11751 ) ) ( not ( = ?auto_11731 ?auto_11742 ) ) ( not ( = ?auto_11746 ?auto_11753 ) ) ( not ( = ?auto_11746 ?auto_11749 ) ) ( not ( = ?auto_11746 ?auto_11741 ) ) ( not ( = ?auto_11746 ?auto_11752 ) ) ( not ( = ?auto_11746 ?auto_11747 ) ) ( not ( = ?auto_11743 ?auto_11757 ) ) ( not ( = ?auto_11743 ?auto_11754 ) ) ( not ( = ?auto_11743 ?auto_11756 ) ) ( not ( = ?auto_11743 ?auto_11750 ) ) ( not ( = ?auto_11743 ?auto_11759 ) ) ( not ( = ?auto_11745 ?auto_11760 ) ) ( not ( = ?auto_11745 ?auto_11744 ) ) ( not ( = ?auto_11745 ?auto_11758 ) ) ( not ( = ?auto_11745 ?auto_11748 ) ) ( not ( = ?auto_11745 ?auto_11740 ) ) ( not ( = ?auto_11745 ?auto_11751 ) ) ( not ( = ?auto_11745 ?auto_11742 ) ) ( not ( = ?auto_11723 ?auto_11732 ) ) ( not ( = ?auto_11723 ?auto_11755 ) ) ( not ( = ?auto_11724 ?auto_11732 ) ) ( not ( = ?auto_11724 ?auto_11755 ) ) ( not ( = ?auto_11725 ?auto_11732 ) ) ( not ( = ?auto_11725 ?auto_11755 ) ) ( not ( = ?auto_11726 ?auto_11732 ) ) ( not ( = ?auto_11726 ?auto_11755 ) ) ( not ( = ?auto_11727 ?auto_11732 ) ) ( not ( = ?auto_11727 ?auto_11755 ) ) ( not ( = ?auto_11728 ?auto_11732 ) ) ( not ( = ?auto_11728 ?auto_11755 ) ) ( not ( = ?auto_11729 ?auto_11732 ) ) ( not ( = ?auto_11729 ?auto_11755 ) ) ( not ( = ?auto_11730 ?auto_11732 ) ) ( not ( = ?auto_11730 ?auto_11755 ) ) ( not ( = ?auto_11732 ?auto_11745 ) ) ( not ( = ?auto_11732 ?auto_11760 ) ) ( not ( = ?auto_11732 ?auto_11744 ) ) ( not ( = ?auto_11732 ?auto_11758 ) ) ( not ( = ?auto_11732 ?auto_11748 ) ) ( not ( = ?auto_11732 ?auto_11740 ) ) ( not ( = ?auto_11732 ?auto_11751 ) ) ( not ( = ?auto_11732 ?auto_11742 ) ) ( not ( = ?auto_11755 ?auto_11745 ) ) ( not ( = ?auto_11755 ?auto_11760 ) ) ( not ( = ?auto_11755 ?auto_11744 ) ) ( not ( = ?auto_11755 ?auto_11758 ) ) ( not ( = ?auto_11755 ?auto_11748 ) ) ( not ( = ?auto_11755 ?auto_11740 ) ) ( not ( = ?auto_11755 ?auto_11751 ) ) ( not ( = ?auto_11755 ?auto_11742 ) ) ( not ( = ?auto_11723 ?auto_11733 ) ) ( not ( = ?auto_11723 ?auto_11734 ) ) ( not ( = ?auto_11724 ?auto_11733 ) ) ( not ( = ?auto_11724 ?auto_11734 ) ) ( not ( = ?auto_11725 ?auto_11733 ) ) ( not ( = ?auto_11725 ?auto_11734 ) ) ( not ( = ?auto_11726 ?auto_11733 ) ) ( not ( = ?auto_11726 ?auto_11734 ) ) ( not ( = ?auto_11727 ?auto_11733 ) ) ( not ( = ?auto_11727 ?auto_11734 ) ) ( not ( = ?auto_11728 ?auto_11733 ) ) ( not ( = ?auto_11728 ?auto_11734 ) ) ( not ( = ?auto_11729 ?auto_11733 ) ) ( not ( = ?auto_11729 ?auto_11734 ) ) ( not ( = ?auto_11730 ?auto_11733 ) ) ( not ( = ?auto_11730 ?auto_11734 ) ) ( not ( = ?auto_11731 ?auto_11733 ) ) ( not ( = ?auto_11731 ?auto_11734 ) ) ( not ( = ?auto_11733 ?auto_11755 ) ) ( not ( = ?auto_11733 ?auto_11745 ) ) ( not ( = ?auto_11733 ?auto_11760 ) ) ( not ( = ?auto_11733 ?auto_11744 ) ) ( not ( = ?auto_11733 ?auto_11758 ) ) ( not ( = ?auto_11733 ?auto_11748 ) ) ( not ( = ?auto_11733 ?auto_11740 ) ) ( not ( = ?auto_11733 ?auto_11751 ) ) ( not ( = ?auto_11733 ?auto_11742 ) ) ( not ( = ?auto_11736 ?auto_11741 ) ) ( not ( = ?auto_11736 ?auto_11746 ) ) ( not ( = ?auto_11736 ?auto_11753 ) ) ( not ( = ?auto_11736 ?auto_11749 ) ) ( not ( = ?auto_11736 ?auto_11752 ) ) ( not ( = ?auto_11736 ?auto_11747 ) ) ( not ( = ?auto_11737 ?auto_11756 ) ) ( not ( = ?auto_11737 ?auto_11743 ) ) ( not ( = ?auto_11737 ?auto_11757 ) ) ( not ( = ?auto_11737 ?auto_11754 ) ) ( not ( = ?auto_11737 ?auto_11750 ) ) ( not ( = ?auto_11737 ?auto_11759 ) ) ( not ( = ?auto_11734 ?auto_11755 ) ) ( not ( = ?auto_11734 ?auto_11745 ) ) ( not ( = ?auto_11734 ?auto_11760 ) ) ( not ( = ?auto_11734 ?auto_11744 ) ) ( not ( = ?auto_11734 ?auto_11758 ) ) ( not ( = ?auto_11734 ?auto_11748 ) ) ( not ( = ?auto_11734 ?auto_11740 ) ) ( not ( = ?auto_11734 ?auto_11751 ) ) ( not ( = ?auto_11734 ?auto_11742 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_11723 ?auto_11724 ?auto_11725 ?auto_11726 ?auto_11727 ?auto_11728 ?auto_11729 ?auto_11730 ?auto_11731 ?auto_11732 )
      ( MAKE-1CRATE ?auto_11732 ?auto_11733 )
      ( MAKE-10CRATE-VERIFY ?auto_11723 ?auto_11724 ?auto_11725 ?auto_11726 ?auto_11727 ?auto_11728 ?auto_11729 ?auto_11730 ?auto_11731 ?auto_11732 ?auto_11733 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_11783 - SURFACE
      ?auto_11784 - SURFACE
      ?auto_11785 - SURFACE
      ?auto_11786 - SURFACE
      ?auto_11787 - SURFACE
      ?auto_11788 - SURFACE
      ?auto_11789 - SURFACE
      ?auto_11790 - SURFACE
      ?auto_11791 - SURFACE
      ?auto_11792 - SURFACE
      ?auto_11793 - SURFACE
      ?auto_11794 - SURFACE
    )
    :vars
    (
      ?auto_11796 - HOIST
      ?auto_11800 - PLACE
      ?auto_11797 - PLACE
      ?auto_11795 - HOIST
      ?auto_11799 - SURFACE
      ?auto_11804 - PLACE
      ?auto_11814 - HOIST
      ?auto_11816 - SURFACE
      ?auto_11820 - PLACE
      ?auto_11818 - HOIST
      ?auto_11808 - SURFACE
      ?auto_11807 - PLACE
      ?auto_11802 - HOIST
      ?auto_11819 - SURFACE
      ?auto_11809 - PLACE
      ?auto_11813 - HOIST
      ?auto_11815 - SURFACE
      ?auto_11810 - PLACE
      ?auto_11817 - HOIST
      ?auto_11812 - SURFACE
      ?auto_11805 - SURFACE
      ?auto_11821 - SURFACE
      ?auto_11811 - SURFACE
      ?auto_11801 - PLACE
      ?auto_11822 - HOIST
      ?auto_11803 - SURFACE
      ?auto_11806 - SURFACE
      ?auto_11798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11796 ?auto_11800 ) ( IS-CRATE ?auto_11794 ) ( not ( = ?auto_11797 ?auto_11800 ) ) ( HOIST-AT ?auto_11795 ?auto_11797 ) ( SURFACE-AT ?auto_11794 ?auto_11797 ) ( ON ?auto_11794 ?auto_11799 ) ( CLEAR ?auto_11794 ) ( not ( = ?auto_11793 ?auto_11794 ) ) ( not ( = ?auto_11793 ?auto_11799 ) ) ( not ( = ?auto_11794 ?auto_11799 ) ) ( not ( = ?auto_11796 ?auto_11795 ) ) ( IS-CRATE ?auto_11793 ) ( not ( = ?auto_11804 ?auto_11800 ) ) ( HOIST-AT ?auto_11814 ?auto_11804 ) ( AVAILABLE ?auto_11814 ) ( SURFACE-AT ?auto_11793 ?auto_11804 ) ( ON ?auto_11793 ?auto_11816 ) ( CLEAR ?auto_11793 ) ( not ( = ?auto_11792 ?auto_11793 ) ) ( not ( = ?auto_11792 ?auto_11816 ) ) ( not ( = ?auto_11793 ?auto_11816 ) ) ( not ( = ?auto_11796 ?auto_11814 ) ) ( IS-CRATE ?auto_11792 ) ( not ( = ?auto_11820 ?auto_11800 ) ) ( HOIST-AT ?auto_11818 ?auto_11820 ) ( SURFACE-AT ?auto_11792 ?auto_11820 ) ( ON ?auto_11792 ?auto_11808 ) ( CLEAR ?auto_11792 ) ( not ( = ?auto_11791 ?auto_11792 ) ) ( not ( = ?auto_11791 ?auto_11808 ) ) ( not ( = ?auto_11792 ?auto_11808 ) ) ( not ( = ?auto_11796 ?auto_11818 ) ) ( IS-CRATE ?auto_11791 ) ( not ( = ?auto_11807 ?auto_11800 ) ) ( HOIST-AT ?auto_11802 ?auto_11807 ) ( AVAILABLE ?auto_11802 ) ( SURFACE-AT ?auto_11791 ?auto_11807 ) ( ON ?auto_11791 ?auto_11819 ) ( CLEAR ?auto_11791 ) ( not ( = ?auto_11790 ?auto_11791 ) ) ( not ( = ?auto_11790 ?auto_11819 ) ) ( not ( = ?auto_11791 ?auto_11819 ) ) ( not ( = ?auto_11796 ?auto_11802 ) ) ( IS-CRATE ?auto_11790 ) ( not ( = ?auto_11809 ?auto_11800 ) ) ( HOIST-AT ?auto_11813 ?auto_11809 ) ( AVAILABLE ?auto_11813 ) ( SURFACE-AT ?auto_11790 ?auto_11809 ) ( ON ?auto_11790 ?auto_11815 ) ( CLEAR ?auto_11790 ) ( not ( = ?auto_11789 ?auto_11790 ) ) ( not ( = ?auto_11789 ?auto_11815 ) ) ( not ( = ?auto_11790 ?auto_11815 ) ) ( not ( = ?auto_11796 ?auto_11813 ) ) ( IS-CRATE ?auto_11789 ) ( not ( = ?auto_11810 ?auto_11800 ) ) ( HOIST-AT ?auto_11817 ?auto_11810 ) ( SURFACE-AT ?auto_11789 ?auto_11810 ) ( ON ?auto_11789 ?auto_11812 ) ( CLEAR ?auto_11789 ) ( not ( = ?auto_11788 ?auto_11789 ) ) ( not ( = ?auto_11788 ?auto_11812 ) ) ( not ( = ?auto_11789 ?auto_11812 ) ) ( not ( = ?auto_11796 ?auto_11817 ) ) ( IS-CRATE ?auto_11788 ) ( SURFACE-AT ?auto_11788 ?auto_11810 ) ( ON ?auto_11788 ?auto_11805 ) ( CLEAR ?auto_11788 ) ( not ( = ?auto_11787 ?auto_11788 ) ) ( not ( = ?auto_11787 ?auto_11805 ) ) ( not ( = ?auto_11788 ?auto_11805 ) ) ( IS-CRATE ?auto_11787 ) ( AVAILABLE ?auto_11817 ) ( SURFACE-AT ?auto_11787 ?auto_11810 ) ( ON ?auto_11787 ?auto_11821 ) ( CLEAR ?auto_11787 ) ( not ( = ?auto_11786 ?auto_11787 ) ) ( not ( = ?auto_11786 ?auto_11821 ) ) ( not ( = ?auto_11787 ?auto_11821 ) ) ( IS-CRATE ?auto_11786 ) ( AVAILABLE ?auto_11818 ) ( SURFACE-AT ?auto_11786 ?auto_11820 ) ( ON ?auto_11786 ?auto_11811 ) ( CLEAR ?auto_11786 ) ( not ( = ?auto_11785 ?auto_11786 ) ) ( not ( = ?auto_11785 ?auto_11811 ) ) ( not ( = ?auto_11786 ?auto_11811 ) ) ( IS-CRATE ?auto_11785 ) ( not ( = ?auto_11801 ?auto_11800 ) ) ( HOIST-AT ?auto_11822 ?auto_11801 ) ( AVAILABLE ?auto_11822 ) ( SURFACE-AT ?auto_11785 ?auto_11801 ) ( ON ?auto_11785 ?auto_11803 ) ( CLEAR ?auto_11785 ) ( not ( = ?auto_11784 ?auto_11785 ) ) ( not ( = ?auto_11784 ?auto_11803 ) ) ( not ( = ?auto_11785 ?auto_11803 ) ) ( not ( = ?auto_11796 ?auto_11822 ) ) ( SURFACE-AT ?auto_11783 ?auto_11800 ) ( CLEAR ?auto_11783 ) ( IS-CRATE ?auto_11784 ) ( AVAILABLE ?auto_11796 ) ( AVAILABLE ?auto_11795 ) ( SURFACE-AT ?auto_11784 ?auto_11797 ) ( ON ?auto_11784 ?auto_11806 ) ( CLEAR ?auto_11784 ) ( TRUCK-AT ?auto_11798 ?auto_11800 ) ( not ( = ?auto_11783 ?auto_11784 ) ) ( not ( = ?auto_11783 ?auto_11806 ) ) ( not ( = ?auto_11784 ?auto_11806 ) ) ( not ( = ?auto_11783 ?auto_11785 ) ) ( not ( = ?auto_11783 ?auto_11803 ) ) ( not ( = ?auto_11785 ?auto_11806 ) ) ( not ( = ?auto_11801 ?auto_11797 ) ) ( not ( = ?auto_11822 ?auto_11795 ) ) ( not ( = ?auto_11803 ?auto_11806 ) ) ( not ( = ?auto_11783 ?auto_11786 ) ) ( not ( = ?auto_11783 ?auto_11811 ) ) ( not ( = ?auto_11784 ?auto_11786 ) ) ( not ( = ?auto_11784 ?auto_11811 ) ) ( not ( = ?auto_11786 ?auto_11803 ) ) ( not ( = ?auto_11786 ?auto_11806 ) ) ( not ( = ?auto_11820 ?auto_11801 ) ) ( not ( = ?auto_11820 ?auto_11797 ) ) ( not ( = ?auto_11818 ?auto_11822 ) ) ( not ( = ?auto_11818 ?auto_11795 ) ) ( not ( = ?auto_11811 ?auto_11803 ) ) ( not ( = ?auto_11811 ?auto_11806 ) ) ( not ( = ?auto_11783 ?auto_11787 ) ) ( not ( = ?auto_11783 ?auto_11821 ) ) ( not ( = ?auto_11784 ?auto_11787 ) ) ( not ( = ?auto_11784 ?auto_11821 ) ) ( not ( = ?auto_11785 ?auto_11787 ) ) ( not ( = ?auto_11785 ?auto_11821 ) ) ( not ( = ?auto_11787 ?auto_11811 ) ) ( not ( = ?auto_11787 ?auto_11803 ) ) ( not ( = ?auto_11787 ?auto_11806 ) ) ( not ( = ?auto_11810 ?auto_11820 ) ) ( not ( = ?auto_11810 ?auto_11801 ) ) ( not ( = ?auto_11810 ?auto_11797 ) ) ( not ( = ?auto_11817 ?auto_11818 ) ) ( not ( = ?auto_11817 ?auto_11822 ) ) ( not ( = ?auto_11817 ?auto_11795 ) ) ( not ( = ?auto_11821 ?auto_11811 ) ) ( not ( = ?auto_11821 ?auto_11803 ) ) ( not ( = ?auto_11821 ?auto_11806 ) ) ( not ( = ?auto_11783 ?auto_11788 ) ) ( not ( = ?auto_11783 ?auto_11805 ) ) ( not ( = ?auto_11784 ?auto_11788 ) ) ( not ( = ?auto_11784 ?auto_11805 ) ) ( not ( = ?auto_11785 ?auto_11788 ) ) ( not ( = ?auto_11785 ?auto_11805 ) ) ( not ( = ?auto_11786 ?auto_11788 ) ) ( not ( = ?auto_11786 ?auto_11805 ) ) ( not ( = ?auto_11788 ?auto_11821 ) ) ( not ( = ?auto_11788 ?auto_11811 ) ) ( not ( = ?auto_11788 ?auto_11803 ) ) ( not ( = ?auto_11788 ?auto_11806 ) ) ( not ( = ?auto_11805 ?auto_11821 ) ) ( not ( = ?auto_11805 ?auto_11811 ) ) ( not ( = ?auto_11805 ?auto_11803 ) ) ( not ( = ?auto_11805 ?auto_11806 ) ) ( not ( = ?auto_11783 ?auto_11789 ) ) ( not ( = ?auto_11783 ?auto_11812 ) ) ( not ( = ?auto_11784 ?auto_11789 ) ) ( not ( = ?auto_11784 ?auto_11812 ) ) ( not ( = ?auto_11785 ?auto_11789 ) ) ( not ( = ?auto_11785 ?auto_11812 ) ) ( not ( = ?auto_11786 ?auto_11789 ) ) ( not ( = ?auto_11786 ?auto_11812 ) ) ( not ( = ?auto_11787 ?auto_11789 ) ) ( not ( = ?auto_11787 ?auto_11812 ) ) ( not ( = ?auto_11789 ?auto_11805 ) ) ( not ( = ?auto_11789 ?auto_11821 ) ) ( not ( = ?auto_11789 ?auto_11811 ) ) ( not ( = ?auto_11789 ?auto_11803 ) ) ( not ( = ?auto_11789 ?auto_11806 ) ) ( not ( = ?auto_11812 ?auto_11805 ) ) ( not ( = ?auto_11812 ?auto_11821 ) ) ( not ( = ?auto_11812 ?auto_11811 ) ) ( not ( = ?auto_11812 ?auto_11803 ) ) ( not ( = ?auto_11812 ?auto_11806 ) ) ( not ( = ?auto_11783 ?auto_11790 ) ) ( not ( = ?auto_11783 ?auto_11815 ) ) ( not ( = ?auto_11784 ?auto_11790 ) ) ( not ( = ?auto_11784 ?auto_11815 ) ) ( not ( = ?auto_11785 ?auto_11790 ) ) ( not ( = ?auto_11785 ?auto_11815 ) ) ( not ( = ?auto_11786 ?auto_11790 ) ) ( not ( = ?auto_11786 ?auto_11815 ) ) ( not ( = ?auto_11787 ?auto_11790 ) ) ( not ( = ?auto_11787 ?auto_11815 ) ) ( not ( = ?auto_11788 ?auto_11790 ) ) ( not ( = ?auto_11788 ?auto_11815 ) ) ( not ( = ?auto_11790 ?auto_11812 ) ) ( not ( = ?auto_11790 ?auto_11805 ) ) ( not ( = ?auto_11790 ?auto_11821 ) ) ( not ( = ?auto_11790 ?auto_11811 ) ) ( not ( = ?auto_11790 ?auto_11803 ) ) ( not ( = ?auto_11790 ?auto_11806 ) ) ( not ( = ?auto_11809 ?auto_11810 ) ) ( not ( = ?auto_11809 ?auto_11820 ) ) ( not ( = ?auto_11809 ?auto_11801 ) ) ( not ( = ?auto_11809 ?auto_11797 ) ) ( not ( = ?auto_11813 ?auto_11817 ) ) ( not ( = ?auto_11813 ?auto_11818 ) ) ( not ( = ?auto_11813 ?auto_11822 ) ) ( not ( = ?auto_11813 ?auto_11795 ) ) ( not ( = ?auto_11815 ?auto_11812 ) ) ( not ( = ?auto_11815 ?auto_11805 ) ) ( not ( = ?auto_11815 ?auto_11821 ) ) ( not ( = ?auto_11815 ?auto_11811 ) ) ( not ( = ?auto_11815 ?auto_11803 ) ) ( not ( = ?auto_11815 ?auto_11806 ) ) ( not ( = ?auto_11783 ?auto_11791 ) ) ( not ( = ?auto_11783 ?auto_11819 ) ) ( not ( = ?auto_11784 ?auto_11791 ) ) ( not ( = ?auto_11784 ?auto_11819 ) ) ( not ( = ?auto_11785 ?auto_11791 ) ) ( not ( = ?auto_11785 ?auto_11819 ) ) ( not ( = ?auto_11786 ?auto_11791 ) ) ( not ( = ?auto_11786 ?auto_11819 ) ) ( not ( = ?auto_11787 ?auto_11791 ) ) ( not ( = ?auto_11787 ?auto_11819 ) ) ( not ( = ?auto_11788 ?auto_11791 ) ) ( not ( = ?auto_11788 ?auto_11819 ) ) ( not ( = ?auto_11789 ?auto_11791 ) ) ( not ( = ?auto_11789 ?auto_11819 ) ) ( not ( = ?auto_11791 ?auto_11815 ) ) ( not ( = ?auto_11791 ?auto_11812 ) ) ( not ( = ?auto_11791 ?auto_11805 ) ) ( not ( = ?auto_11791 ?auto_11821 ) ) ( not ( = ?auto_11791 ?auto_11811 ) ) ( not ( = ?auto_11791 ?auto_11803 ) ) ( not ( = ?auto_11791 ?auto_11806 ) ) ( not ( = ?auto_11807 ?auto_11809 ) ) ( not ( = ?auto_11807 ?auto_11810 ) ) ( not ( = ?auto_11807 ?auto_11820 ) ) ( not ( = ?auto_11807 ?auto_11801 ) ) ( not ( = ?auto_11807 ?auto_11797 ) ) ( not ( = ?auto_11802 ?auto_11813 ) ) ( not ( = ?auto_11802 ?auto_11817 ) ) ( not ( = ?auto_11802 ?auto_11818 ) ) ( not ( = ?auto_11802 ?auto_11822 ) ) ( not ( = ?auto_11802 ?auto_11795 ) ) ( not ( = ?auto_11819 ?auto_11815 ) ) ( not ( = ?auto_11819 ?auto_11812 ) ) ( not ( = ?auto_11819 ?auto_11805 ) ) ( not ( = ?auto_11819 ?auto_11821 ) ) ( not ( = ?auto_11819 ?auto_11811 ) ) ( not ( = ?auto_11819 ?auto_11803 ) ) ( not ( = ?auto_11819 ?auto_11806 ) ) ( not ( = ?auto_11783 ?auto_11792 ) ) ( not ( = ?auto_11783 ?auto_11808 ) ) ( not ( = ?auto_11784 ?auto_11792 ) ) ( not ( = ?auto_11784 ?auto_11808 ) ) ( not ( = ?auto_11785 ?auto_11792 ) ) ( not ( = ?auto_11785 ?auto_11808 ) ) ( not ( = ?auto_11786 ?auto_11792 ) ) ( not ( = ?auto_11786 ?auto_11808 ) ) ( not ( = ?auto_11787 ?auto_11792 ) ) ( not ( = ?auto_11787 ?auto_11808 ) ) ( not ( = ?auto_11788 ?auto_11792 ) ) ( not ( = ?auto_11788 ?auto_11808 ) ) ( not ( = ?auto_11789 ?auto_11792 ) ) ( not ( = ?auto_11789 ?auto_11808 ) ) ( not ( = ?auto_11790 ?auto_11792 ) ) ( not ( = ?auto_11790 ?auto_11808 ) ) ( not ( = ?auto_11792 ?auto_11819 ) ) ( not ( = ?auto_11792 ?auto_11815 ) ) ( not ( = ?auto_11792 ?auto_11812 ) ) ( not ( = ?auto_11792 ?auto_11805 ) ) ( not ( = ?auto_11792 ?auto_11821 ) ) ( not ( = ?auto_11792 ?auto_11811 ) ) ( not ( = ?auto_11792 ?auto_11803 ) ) ( not ( = ?auto_11792 ?auto_11806 ) ) ( not ( = ?auto_11808 ?auto_11819 ) ) ( not ( = ?auto_11808 ?auto_11815 ) ) ( not ( = ?auto_11808 ?auto_11812 ) ) ( not ( = ?auto_11808 ?auto_11805 ) ) ( not ( = ?auto_11808 ?auto_11821 ) ) ( not ( = ?auto_11808 ?auto_11811 ) ) ( not ( = ?auto_11808 ?auto_11803 ) ) ( not ( = ?auto_11808 ?auto_11806 ) ) ( not ( = ?auto_11783 ?auto_11793 ) ) ( not ( = ?auto_11783 ?auto_11816 ) ) ( not ( = ?auto_11784 ?auto_11793 ) ) ( not ( = ?auto_11784 ?auto_11816 ) ) ( not ( = ?auto_11785 ?auto_11793 ) ) ( not ( = ?auto_11785 ?auto_11816 ) ) ( not ( = ?auto_11786 ?auto_11793 ) ) ( not ( = ?auto_11786 ?auto_11816 ) ) ( not ( = ?auto_11787 ?auto_11793 ) ) ( not ( = ?auto_11787 ?auto_11816 ) ) ( not ( = ?auto_11788 ?auto_11793 ) ) ( not ( = ?auto_11788 ?auto_11816 ) ) ( not ( = ?auto_11789 ?auto_11793 ) ) ( not ( = ?auto_11789 ?auto_11816 ) ) ( not ( = ?auto_11790 ?auto_11793 ) ) ( not ( = ?auto_11790 ?auto_11816 ) ) ( not ( = ?auto_11791 ?auto_11793 ) ) ( not ( = ?auto_11791 ?auto_11816 ) ) ( not ( = ?auto_11793 ?auto_11808 ) ) ( not ( = ?auto_11793 ?auto_11819 ) ) ( not ( = ?auto_11793 ?auto_11815 ) ) ( not ( = ?auto_11793 ?auto_11812 ) ) ( not ( = ?auto_11793 ?auto_11805 ) ) ( not ( = ?auto_11793 ?auto_11821 ) ) ( not ( = ?auto_11793 ?auto_11811 ) ) ( not ( = ?auto_11793 ?auto_11803 ) ) ( not ( = ?auto_11793 ?auto_11806 ) ) ( not ( = ?auto_11804 ?auto_11820 ) ) ( not ( = ?auto_11804 ?auto_11807 ) ) ( not ( = ?auto_11804 ?auto_11809 ) ) ( not ( = ?auto_11804 ?auto_11810 ) ) ( not ( = ?auto_11804 ?auto_11801 ) ) ( not ( = ?auto_11804 ?auto_11797 ) ) ( not ( = ?auto_11814 ?auto_11818 ) ) ( not ( = ?auto_11814 ?auto_11802 ) ) ( not ( = ?auto_11814 ?auto_11813 ) ) ( not ( = ?auto_11814 ?auto_11817 ) ) ( not ( = ?auto_11814 ?auto_11822 ) ) ( not ( = ?auto_11814 ?auto_11795 ) ) ( not ( = ?auto_11816 ?auto_11808 ) ) ( not ( = ?auto_11816 ?auto_11819 ) ) ( not ( = ?auto_11816 ?auto_11815 ) ) ( not ( = ?auto_11816 ?auto_11812 ) ) ( not ( = ?auto_11816 ?auto_11805 ) ) ( not ( = ?auto_11816 ?auto_11821 ) ) ( not ( = ?auto_11816 ?auto_11811 ) ) ( not ( = ?auto_11816 ?auto_11803 ) ) ( not ( = ?auto_11816 ?auto_11806 ) ) ( not ( = ?auto_11783 ?auto_11794 ) ) ( not ( = ?auto_11783 ?auto_11799 ) ) ( not ( = ?auto_11784 ?auto_11794 ) ) ( not ( = ?auto_11784 ?auto_11799 ) ) ( not ( = ?auto_11785 ?auto_11794 ) ) ( not ( = ?auto_11785 ?auto_11799 ) ) ( not ( = ?auto_11786 ?auto_11794 ) ) ( not ( = ?auto_11786 ?auto_11799 ) ) ( not ( = ?auto_11787 ?auto_11794 ) ) ( not ( = ?auto_11787 ?auto_11799 ) ) ( not ( = ?auto_11788 ?auto_11794 ) ) ( not ( = ?auto_11788 ?auto_11799 ) ) ( not ( = ?auto_11789 ?auto_11794 ) ) ( not ( = ?auto_11789 ?auto_11799 ) ) ( not ( = ?auto_11790 ?auto_11794 ) ) ( not ( = ?auto_11790 ?auto_11799 ) ) ( not ( = ?auto_11791 ?auto_11794 ) ) ( not ( = ?auto_11791 ?auto_11799 ) ) ( not ( = ?auto_11792 ?auto_11794 ) ) ( not ( = ?auto_11792 ?auto_11799 ) ) ( not ( = ?auto_11794 ?auto_11816 ) ) ( not ( = ?auto_11794 ?auto_11808 ) ) ( not ( = ?auto_11794 ?auto_11819 ) ) ( not ( = ?auto_11794 ?auto_11815 ) ) ( not ( = ?auto_11794 ?auto_11812 ) ) ( not ( = ?auto_11794 ?auto_11805 ) ) ( not ( = ?auto_11794 ?auto_11821 ) ) ( not ( = ?auto_11794 ?auto_11811 ) ) ( not ( = ?auto_11794 ?auto_11803 ) ) ( not ( = ?auto_11794 ?auto_11806 ) ) ( not ( = ?auto_11799 ?auto_11816 ) ) ( not ( = ?auto_11799 ?auto_11808 ) ) ( not ( = ?auto_11799 ?auto_11819 ) ) ( not ( = ?auto_11799 ?auto_11815 ) ) ( not ( = ?auto_11799 ?auto_11812 ) ) ( not ( = ?auto_11799 ?auto_11805 ) ) ( not ( = ?auto_11799 ?auto_11821 ) ) ( not ( = ?auto_11799 ?auto_11811 ) ) ( not ( = ?auto_11799 ?auto_11803 ) ) ( not ( = ?auto_11799 ?auto_11806 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_11783 ?auto_11784 ?auto_11785 ?auto_11786 ?auto_11787 ?auto_11788 ?auto_11789 ?auto_11790 ?auto_11791 ?auto_11792 ?auto_11793 )
      ( MAKE-1CRATE ?auto_11793 ?auto_11794 )
      ( MAKE-11CRATE-VERIFY ?auto_11783 ?auto_11784 ?auto_11785 ?auto_11786 ?auto_11787 ?auto_11788 ?auto_11789 ?auto_11790 ?auto_11791 ?auto_11792 ?auto_11793 ?auto_11794 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_11846 - SURFACE
      ?auto_11847 - SURFACE
      ?auto_11848 - SURFACE
      ?auto_11849 - SURFACE
      ?auto_11850 - SURFACE
      ?auto_11851 - SURFACE
      ?auto_11852 - SURFACE
      ?auto_11853 - SURFACE
      ?auto_11854 - SURFACE
      ?auto_11855 - SURFACE
      ?auto_11856 - SURFACE
      ?auto_11857 - SURFACE
      ?auto_11858 - SURFACE
    )
    :vars
    (
      ?auto_11863 - HOIST
      ?auto_11860 - PLACE
      ?auto_11864 - PLACE
      ?auto_11862 - HOIST
      ?auto_11861 - SURFACE
      ?auto_11882 - PLACE
      ?auto_11878 - HOIST
      ?auto_11875 - SURFACE
      ?auto_11871 - PLACE
      ?auto_11873 - HOIST
      ?auto_11877 - SURFACE
      ?auto_11874 - PLACE
      ?auto_11884 - HOIST
      ?auto_11876 - SURFACE
      ?auto_11869 - PLACE
      ?auto_11872 - HOIST
      ?auto_11887 - SURFACE
      ?auto_11868 - SURFACE
      ?auto_11881 - PLACE
      ?auto_11870 - HOIST
      ?auto_11885 - SURFACE
      ?auto_11867 - SURFACE
      ?auto_11879 - SURFACE
      ?auto_11880 - SURFACE
      ?auto_11866 - PLACE
      ?auto_11886 - HOIST
      ?auto_11883 - SURFACE
      ?auto_11865 - SURFACE
      ?auto_11859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11863 ?auto_11860 ) ( IS-CRATE ?auto_11858 ) ( not ( = ?auto_11864 ?auto_11860 ) ) ( HOIST-AT ?auto_11862 ?auto_11864 ) ( SURFACE-AT ?auto_11858 ?auto_11864 ) ( ON ?auto_11858 ?auto_11861 ) ( CLEAR ?auto_11858 ) ( not ( = ?auto_11857 ?auto_11858 ) ) ( not ( = ?auto_11857 ?auto_11861 ) ) ( not ( = ?auto_11858 ?auto_11861 ) ) ( not ( = ?auto_11863 ?auto_11862 ) ) ( IS-CRATE ?auto_11857 ) ( not ( = ?auto_11882 ?auto_11860 ) ) ( HOIST-AT ?auto_11878 ?auto_11882 ) ( SURFACE-AT ?auto_11857 ?auto_11882 ) ( ON ?auto_11857 ?auto_11875 ) ( CLEAR ?auto_11857 ) ( not ( = ?auto_11856 ?auto_11857 ) ) ( not ( = ?auto_11856 ?auto_11875 ) ) ( not ( = ?auto_11857 ?auto_11875 ) ) ( not ( = ?auto_11863 ?auto_11878 ) ) ( IS-CRATE ?auto_11856 ) ( not ( = ?auto_11871 ?auto_11860 ) ) ( HOIST-AT ?auto_11873 ?auto_11871 ) ( AVAILABLE ?auto_11873 ) ( SURFACE-AT ?auto_11856 ?auto_11871 ) ( ON ?auto_11856 ?auto_11877 ) ( CLEAR ?auto_11856 ) ( not ( = ?auto_11855 ?auto_11856 ) ) ( not ( = ?auto_11855 ?auto_11877 ) ) ( not ( = ?auto_11856 ?auto_11877 ) ) ( not ( = ?auto_11863 ?auto_11873 ) ) ( IS-CRATE ?auto_11855 ) ( not ( = ?auto_11874 ?auto_11860 ) ) ( HOIST-AT ?auto_11884 ?auto_11874 ) ( SURFACE-AT ?auto_11855 ?auto_11874 ) ( ON ?auto_11855 ?auto_11876 ) ( CLEAR ?auto_11855 ) ( not ( = ?auto_11854 ?auto_11855 ) ) ( not ( = ?auto_11854 ?auto_11876 ) ) ( not ( = ?auto_11855 ?auto_11876 ) ) ( not ( = ?auto_11863 ?auto_11884 ) ) ( IS-CRATE ?auto_11854 ) ( not ( = ?auto_11869 ?auto_11860 ) ) ( HOIST-AT ?auto_11872 ?auto_11869 ) ( AVAILABLE ?auto_11872 ) ( SURFACE-AT ?auto_11854 ?auto_11869 ) ( ON ?auto_11854 ?auto_11887 ) ( CLEAR ?auto_11854 ) ( not ( = ?auto_11853 ?auto_11854 ) ) ( not ( = ?auto_11853 ?auto_11887 ) ) ( not ( = ?auto_11854 ?auto_11887 ) ) ( not ( = ?auto_11863 ?auto_11872 ) ) ( IS-CRATE ?auto_11853 ) ( AVAILABLE ?auto_11862 ) ( SURFACE-AT ?auto_11853 ?auto_11864 ) ( ON ?auto_11853 ?auto_11868 ) ( CLEAR ?auto_11853 ) ( not ( = ?auto_11852 ?auto_11853 ) ) ( not ( = ?auto_11852 ?auto_11868 ) ) ( not ( = ?auto_11853 ?auto_11868 ) ) ( IS-CRATE ?auto_11852 ) ( not ( = ?auto_11881 ?auto_11860 ) ) ( HOIST-AT ?auto_11870 ?auto_11881 ) ( SURFACE-AT ?auto_11852 ?auto_11881 ) ( ON ?auto_11852 ?auto_11885 ) ( CLEAR ?auto_11852 ) ( not ( = ?auto_11851 ?auto_11852 ) ) ( not ( = ?auto_11851 ?auto_11885 ) ) ( not ( = ?auto_11852 ?auto_11885 ) ) ( not ( = ?auto_11863 ?auto_11870 ) ) ( IS-CRATE ?auto_11851 ) ( SURFACE-AT ?auto_11851 ?auto_11881 ) ( ON ?auto_11851 ?auto_11867 ) ( CLEAR ?auto_11851 ) ( not ( = ?auto_11850 ?auto_11851 ) ) ( not ( = ?auto_11850 ?auto_11867 ) ) ( not ( = ?auto_11851 ?auto_11867 ) ) ( IS-CRATE ?auto_11850 ) ( AVAILABLE ?auto_11870 ) ( SURFACE-AT ?auto_11850 ?auto_11881 ) ( ON ?auto_11850 ?auto_11879 ) ( CLEAR ?auto_11850 ) ( not ( = ?auto_11849 ?auto_11850 ) ) ( not ( = ?auto_11849 ?auto_11879 ) ) ( not ( = ?auto_11850 ?auto_11879 ) ) ( IS-CRATE ?auto_11849 ) ( AVAILABLE ?auto_11884 ) ( SURFACE-AT ?auto_11849 ?auto_11874 ) ( ON ?auto_11849 ?auto_11880 ) ( CLEAR ?auto_11849 ) ( not ( = ?auto_11848 ?auto_11849 ) ) ( not ( = ?auto_11848 ?auto_11880 ) ) ( not ( = ?auto_11849 ?auto_11880 ) ) ( IS-CRATE ?auto_11848 ) ( not ( = ?auto_11866 ?auto_11860 ) ) ( HOIST-AT ?auto_11886 ?auto_11866 ) ( AVAILABLE ?auto_11886 ) ( SURFACE-AT ?auto_11848 ?auto_11866 ) ( ON ?auto_11848 ?auto_11883 ) ( CLEAR ?auto_11848 ) ( not ( = ?auto_11847 ?auto_11848 ) ) ( not ( = ?auto_11847 ?auto_11883 ) ) ( not ( = ?auto_11848 ?auto_11883 ) ) ( not ( = ?auto_11863 ?auto_11886 ) ) ( SURFACE-AT ?auto_11846 ?auto_11860 ) ( CLEAR ?auto_11846 ) ( IS-CRATE ?auto_11847 ) ( AVAILABLE ?auto_11863 ) ( AVAILABLE ?auto_11878 ) ( SURFACE-AT ?auto_11847 ?auto_11882 ) ( ON ?auto_11847 ?auto_11865 ) ( CLEAR ?auto_11847 ) ( TRUCK-AT ?auto_11859 ?auto_11860 ) ( not ( = ?auto_11846 ?auto_11847 ) ) ( not ( = ?auto_11846 ?auto_11865 ) ) ( not ( = ?auto_11847 ?auto_11865 ) ) ( not ( = ?auto_11846 ?auto_11848 ) ) ( not ( = ?auto_11846 ?auto_11883 ) ) ( not ( = ?auto_11848 ?auto_11865 ) ) ( not ( = ?auto_11866 ?auto_11882 ) ) ( not ( = ?auto_11886 ?auto_11878 ) ) ( not ( = ?auto_11883 ?auto_11865 ) ) ( not ( = ?auto_11846 ?auto_11849 ) ) ( not ( = ?auto_11846 ?auto_11880 ) ) ( not ( = ?auto_11847 ?auto_11849 ) ) ( not ( = ?auto_11847 ?auto_11880 ) ) ( not ( = ?auto_11849 ?auto_11883 ) ) ( not ( = ?auto_11849 ?auto_11865 ) ) ( not ( = ?auto_11874 ?auto_11866 ) ) ( not ( = ?auto_11874 ?auto_11882 ) ) ( not ( = ?auto_11884 ?auto_11886 ) ) ( not ( = ?auto_11884 ?auto_11878 ) ) ( not ( = ?auto_11880 ?auto_11883 ) ) ( not ( = ?auto_11880 ?auto_11865 ) ) ( not ( = ?auto_11846 ?auto_11850 ) ) ( not ( = ?auto_11846 ?auto_11879 ) ) ( not ( = ?auto_11847 ?auto_11850 ) ) ( not ( = ?auto_11847 ?auto_11879 ) ) ( not ( = ?auto_11848 ?auto_11850 ) ) ( not ( = ?auto_11848 ?auto_11879 ) ) ( not ( = ?auto_11850 ?auto_11880 ) ) ( not ( = ?auto_11850 ?auto_11883 ) ) ( not ( = ?auto_11850 ?auto_11865 ) ) ( not ( = ?auto_11881 ?auto_11874 ) ) ( not ( = ?auto_11881 ?auto_11866 ) ) ( not ( = ?auto_11881 ?auto_11882 ) ) ( not ( = ?auto_11870 ?auto_11884 ) ) ( not ( = ?auto_11870 ?auto_11886 ) ) ( not ( = ?auto_11870 ?auto_11878 ) ) ( not ( = ?auto_11879 ?auto_11880 ) ) ( not ( = ?auto_11879 ?auto_11883 ) ) ( not ( = ?auto_11879 ?auto_11865 ) ) ( not ( = ?auto_11846 ?auto_11851 ) ) ( not ( = ?auto_11846 ?auto_11867 ) ) ( not ( = ?auto_11847 ?auto_11851 ) ) ( not ( = ?auto_11847 ?auto_11867 ) ) ( not ( = ?auto_11848 ?auto_11851 ) ) ( not ( = ?auto_11848 ?auto_11867 ) ) ( not ( = ?auto_11849 ?auto_11851 ) ) ( not ( = ?auto_11849 ?auto_11867 ) ) ( not ( = ?auto_11851 ?auto_11879 ) ) ( not ( = ?auto_11851 ?auto_11880 ) ) ( not ( = ?auto_11851 ?auto_11883 ) ) ( not ( = ?auto_11851 ?auto_11865 ) ) ( not ( = ?auto_11867 ?auto_11879 ) ) ( not ( = ?auto_11867 ?auto_11880 ) ) ( not ( = ?auto_11867 ?auto_11883 ) ) ( not ( = ?auto_11867 ?auto_11865 ) ) ( not ( = ?auto_11846 ?auto_11852 ) ) ( not ( = ?auto_11846 ?auto_11885 ) ) ( not ( = ?auto_11847 ?auto_11852 ) ) ( not ( = ?auto_11847 ?auto_11885 ) ) ( not ( = ?auto_11848 ?auto_11852 ) ) ( not ( = ?auto_11848 ?auto_11885 ) ) ( not ( = ?auto_11849 ?auto_11852 ) ) ( not ( = ?auto_11849 ?auto_11885 ) ) ( not ( = ?auto_11850 ?auto_11852 ) ) ( not ( = ?auto_11850 ?auto_11885 ) ) ( not ( = ?auto_11852 ?auto_11867 ) ) ( not ( = ?auto_11852 ?auto_11879 ) ) ( not ( = ?auto_11852 ?auto_11880 ) ) ( not ( = ?auto_11852 ?auto_11883 ) ) ( not ( = ?auto_11852 ?auto_11865 ) ) ( not ( = ?auto_11885 ?auto_11867 ) ) ( not ( = ?auto_11885 ?auto_11879 ) ) ( not ( = ?auto_11885 ?auto_11880 ) ) ( not ( = ?auto_11885 ?auto_11883 ) ) ( not ( = ?auto_11885 ?auto_11865 ) ) ( not ( = ?auto_11846 ?auto_11853 ) ) ( not ( = ?auto_11846 ?auto_11868 ) ) ( not ( = ?auto_11847 ?auto_11853 ) ) ( not ( = ?auto_11847 ?auto_11868 ) ) ( not ( = ?auto_11848 ?auto_11853 ) ) ( not ( = ?auto_11848 ?auto_11868 ) ) ( not ( = ?auto_11849 ?auto_11853 ) ) ( not ( = ?auto_11849 ?auto_11868 ) ) ( not ( = ?auto_11850 ?auto_11853 ) ) ( not ( = ?auto_11850 ?auto_11868 ) ) ( not ( = ?auto_11851 ?auto_11853 ) ) ( not ( = ?auto_11851 ?auto_11868 ) ) ( not ( = ?auto_11853 ?auto_11885 ) ) ( not ( = ?auto_11853 ?auto_11867 ) ) ( not ( = ?auto_11853 ?auto_11879 ) ) ( not ( = ?auto_11853 ?auto_11880 ) ) ( not ( = ?auto_11853 ?auto_11883 ) ) ( not ( = ?auto_11853 ?auto_11865 ) ) ( not ( = ?auto_11864 ?auto_11881 ) ) ( not ( = ?auto_11864 ?auto_11874 ) ) ( not ( = ?auto_11864 ?auto_11866 ) ) ( not ( = ?auto_11864 ?auto_11882 ) ) ( not ( = ?auto_11862 ?auto_11870 ) ) ( not ( = ?auto_11862 ?auto_11884 ) ) ( not ( = ?auto_11862 ?auto_11886 ) ) ( not ( = ?auto_11862 ?auto_11878 ) ) ( not ( = ?auto_11868 ?auto_11885 ) ) ( not ( = ?auto_11868 ?auto_11867 ) ) ( not ( = ?auto_11868 ?auto_11879 ) ) ( not ( = ?auto_11868 ?auto_11880 ) ) ( not ( = ?auto_11868 ?auto_11883 ) ) ( not ( = ?auto_11868 ?auto_11865 ) ) ( not ( = ?auto_11846 ?auto_11854 ) ) ( not ( = ?auto_11846 ?auto_11887 ) ) ( not ( = ?auto_11847 ?auto_11854 ) ) ( not ( = ?auto_11847 ?auto_11887 ) ) ( not ( = ?auto_11848 ?auto_11854 ) ) ( not ( = ?auto_11848 ?auto_11887 ) ) ( not ( = ?auto_11849 ?auto_11854 ) ) ( not ( = ?auto_11849 ?auto_11887 ) ) ( not ( = ?auto_11850 ?auto_11854 ) ) ( not ( = ?auto_11850 ?auto_11887 ) ) ( not ( = ?auto_11851 ?auto_11854 ) ) ( not ( = ?auto_11851 ?auto_11887 ) ) ( not ( = ?auto_11852 ?auto_11854 ) ) ( not ( = ?auto_11852 ?auto_11887 ) ) ( not ( = ?auto_11854 ?auto_11868 ) ) ( not ( = ?auto_11854 ?auto_11885 ) ) ( not ( = ?auto_11854 ?auto_11867 ) ) ( not ( = ?auto_11854 ?auto_11879 ) ) ( not ( = ?auto_11854 ?auto_11880 ) ) ( not ( = ?auto_11854 ?auto_11883 ) ) ( not ( = ?auto_11854 ?auto_11865 ) ) ( not ( = ?auto_11869 ?auto_11864 ) ) ( not ( = ?auto_11869 ?auto_11881 ) ) ( not ( = ?auto_11869 ?auto_11874 ) ) ( not ( = ?auto_11869 ?auto_11866 ) ) ( not ( = ?auto_11869 ?auto_11882 ) ) ( not ( = ?auto_11872 ?auto_11862 ) ) ( not ( = ?auto_11872 ?auto_11870 ) ) ( not ( = ?auto_11872 ?auto_11884 ) ) ( not ( = ?auto_11872 ?auto_11886 ) ) ( not ( = ?auto_11872 ?auto_11878 ) ) ( not ( = ?auto_11887 ?auto_11868 ) ) ( not ( = ?auto_11887 ?auto_11885 ) ) ( not ( = ?auto_11887 ?auto_11867 ) ) ( not ( = ?auto_11887 ?auto_11879 ) ) ( not ( = ?auto_11887 ?auto_11880 ) ) ( not ( = ?auto_11887 ?auto_11883 ) ) ( not ( = ?auto_11887 ?auto_11865 ) ) ( not ( = ?auto_11846 ?auto_11855 ) ) ( not ( = ?auto_11846 ?auto_11876 ) ) ( not ( = ?auto_11847 ?auto_11855 ) ) ( not ( = ?auto_11847 ?auto_11876 ) ) ( not ( = ?auto_11848 ?auto_11855 ) ) ( not ( = ?auto_11848 ?auto_11876 ) ) ( not ( = ?auto_11849 ?auto_11855 ) ) ( not ( = ?auto_11849 ?auto_11876 ) ) ( not ( = ?auto_11850 ?auto_11855 ) ) ( not ( = ?auto_11850 ?auto_11876 ) ) ( not ( = ?auto_11851 ?auto_11855 ) ) ( not ( = ?auto_11851 ?auto_11876 ) ) ( not ( = ?auto_11852 ?auto_11855 ) ) ( not ( = ?auto_11852 ?auto_11876 ) ) ( not ( = ?auto_11853 ?auto_11855 ) ) ( not ( = ?auto_11853 ?auto_11876 ) ) ( not ( = ?auto_11855 ?auto_11887 ) ) ( not ( = ?auto_11855 ?auto_11868 ) ) ( not ( = ?auto_11855 ?auto_11885 ) ) ( not ( = ?auto_11855 ?auto_11867 ) ) ( not ( = ?auto_11855 ?auto_11879 ) ) ( not ( = ?auto_11855 ?auto_11880 ) ) ( not ( = ?auto_11855 ?auto_11883 ) ) ( not ( = ?auto_11855 ?auto_11865 ) ) ( not ( = ?auto_11876 ?auto_11887 ) ) ( not ( = ?auto_11876 ?auto_11868 ) ) ( not ( = ?auto_11876 ?auto_11885 ) ) ( not ( = ?auto_11876 ?auto_11867 ) ) ( not ( = ?auto_11876 ?auto_11879 ) ) ( not ( = ?auto_11876 ?auto_11880 ) ) ( not ( = ?auto_11876 ?auto_11883 ) ) ( not ( = ?auto_11876 ?auto_11865 ) ) ( not ( = ?auto_11846 ?auto_11856 ) ) ( not ( = ?auto_11846 ?auto_11877 ) ) ( not ( = ?auto_11847 ?auto_11856 ) ) ( not ( = ?auto_11847 ?auto_11877 ) ) ( not ( = ?auto_11848 ?auto_11856 ) ) ( not ( = ?auto_11848 ?auto_11877 ) ) ( not ( = ?auto_11849 ?auto_11856 ) ) ( not ( = ?auto_11849 ?auto_11877 ) ) ( not ( = ?auto_11850 ?auto_11856 ) ) ( not ( = ?auto_11850 ?auto_11877 ) ) ( not ( = ?auto_11851 ?auto_11856 ) ) ( not ( = ?auto_11851 ?auto_11877 ) ) ( not ( = ?auto_11852 ?auto_11856 ) ) ( not ( = ?auto_11852 ?auto_11877 ) ) ( not ( = ?auto_11853 ?auto_11856 ) ) ( not ( = ?auto_11853 ?auto_11877 ) ) ( not ( = ?auto_11854 ?auto_11856 ) ) ( not ( = ?auto_11854 ?auto_11877 ) ) ( not ( = ?auto_11856 ?auto_11876 ) ) ( not ( = ?auto_11856 ?auto_11887 ) ) ( not ( = ?auto_11856 ?auto_11868 ) ) ( not ( = ?auto_11856 ?auto_11885 ) ) ( not ( = ?auto_11856 ?auto_11867 ) ) ( not ( = ?auto_11856 ?auto_11879 ) ) ( not ( = ?auto_11856 ?auto_11880 ) ) ( not ( = ?auto_11856 ?auto_11883 ) ) ( not ( = ?auto_11856 ?auto_11865 ) ) ( not ( = ?auto_11871 ?auto_11874 ) ) ( not ( = ?auto_11871 ?auto_11869 ) ) ( not ( = ?auto_11871 ?auto_11864 ) ) ( not ( = ?auto_11871 ?auto_11881 ) ) ( not ( = ?auto_11871 ?auto_11866 ) ) ( not ( = ?auto_11871 ?auto_11882 ) ) ( not ( = ?auto_11873 ?auto_11884 ) ) ( not ( = ?auto_11873 ?auto_11872 ) ) ( not ( = ?auto_11873 ?auto_11862 ) ) ( not ( = ?auto_11873 ?auto_11870 ) ) ( not ( = ?auto_11873 ?auto_11886 ) ) ( not ( = ?auto_11873 ?auto_11878 ) ) ( not ( = ?auto_11877 ?auto_11876 ) ) ( not ( = ?auto_11877 ?auto_11887 ) ) ( not ( = ?auto_11877 ?auto_11868 ) ) ( not ( = ?auto_11877 ?auto_11885 ) ) ( not ( = ?auto_11877 ?auto_11867 ) ) ( not ( = ?auto_11877 ?auto_11879 ) ) ( not ( = ?auto_11877 ?auto_11880 ) ) ( not ( = ?auto_11877 ?auto_11883 ) ) ( not ( = ?auto_11877 ?auto_11865 ) ) ( not ( = ?auto_11846 ?auto_11857 ) ) ( not ( = ?auto_11846 ?auto_11875 ) ) ( not ( = ?auto_11847 ?auto_11857 ) ) ( not ( = ?auto_11847 ?auto_11875 ) ) ( not ( = ?auto_11848 ?auto_11857 ) ) ( not ( = ?auto_11848 ?auto_11875 ) ) ( not ( = ?auto_11849 ?auto_11857 ) ) ( not ( = ?auto_11849 ?auto_11875 ) ) ( not ( = ?auto_11850 ?auto_11857 ) ) ( not ( = ?auto_11850 ?auto_11875 ) ) ( not ( = ?auto_11851 ?auto_11857 ) ) ( not ( = ?auto_11851 ?auto_11875 ) ) ( not ( = ?auto_11852 ?auto_11857 ) ) ( not ( = ?auto_11852 ?auto_11875 ) ) ( not ( = ?auto_11853 ?auto_11857 ) ) ( not ( = ?auto_11853 ?auto_11875 ) ) ( not ( = ?auto_11854 ?auto_11857 ) ) ( not ( = ?auto_11854 ?auto_11875 ) ) ( not ( = ?auto_11855 ?auto_11857 ) ) ( not ( = ?auto_11855 ?auto_11875 ) ) ( not ( = ?auto_11857 ?auto_11877 ) ) ( not ( = ?auto_11857 ?auto_11876 ) ) ( not ( = ?auto_11857 ?auto_11887 ) ) ( not ( = ?auto_11857 ?auto_11868 ) ) ( not ( = ?auto_11857 ?auto_11885 ) ) ( not ( = ?auto_11857 ?auto_11867 ) ) ( not ( = ?auto_11857 ?auto_11879 ) ) ( not ( = ?auto_11857 ?auto_11880 ) ) ( not ( = ?auto_11857 ?auto_11883 ) ) ( not ( = ?auto_11857 ?auto_11865 ) ) ( not ( = ?auto_11875 ?auto_11877 ) ) ( not ( = ?auto_11875 ?auto_11876 ) ) ( not ( = ?auto_11875 ?auto_11887 ) ) ( not ( = ?auto_11875 ?auto_11868 ) ) ( not ( = ?auto_11875 ?auto_11885 ) ) ( not ( = ?auto_11875 ?auto_11867 ) ) ( not ( = ?auto_11875 ?auto_11879 ) ) ( not ( = ?auto_11875 ?auto_11880 ) ) ( not ( = ?auto_11875 ?auto_11883 ) ) ( not ( = ?auto_11875 ?auto_11865 ) ) ( not ( = ?auto_11846 ?auto_11858 ) ) ( not ( = ?auto_11846 ?auto_11861 ) ) ( not ( = ?auto_11847 ?auto_11858 ) ) ( not ( = ?auto_11847 ?auto_11861 ) ) ( not ( = ?auto_11848 ?auto_11858 ) ) ( not ( = ?auto_11848 ?auto_11861 ) ) ( not ( = ?auto_11849 ?auto_11858 ) ) ( not ( = ?auto_11849 ?auto_11861 ) ) ( not ( = ?auto_11850 ?auto_11858 ) ) ( not ( = ?auto_11850 ?auto_11861 ) ) ( not ( = ?auto_11851 ?auto_11858 ) ) ( not ( = ?auto_11851 ?auto_11861 ) ) ( not ( = ?auto_11852 ?auto_11858 ) ) ( not ( = ?auto_11852 ?auto_11861 ) ) ( not ( = ?auto_11853 ?auto_11858 ) ) ( not ( = ?auto_11853 ?auto_11861 ) ) ( not ( = ?auto_11854 ?auto_11858 ) ) ( not ( = ?auto_11854 ?auto_11861 ) ) ( not ( = ?auto_11855 ?auto_11858 ) ) ( not ( = ?auto_11855 ?auto_11861 ) ) ( not ( = ?auto_11856 ?auto_11858 ) ) ( not ( = ?auto_11856 ?auto_11861 ) ) ( not ( = ?auto_11858 ?auto_11875 ) ) ( not ( = ?auto_11858 ?auto_11877 ) ) ( not ( = ?auto_11858 ?auto_11876 ) ) ( not ( = ?auto_11858 ?auto_11887 ) ) ( not ( = ?auto_11858 ?auto_11868 ) ) ( not ( = ?auto_11858 ?auto_11885 ) ) ( not ( = ?auto_11858 ?auto_11867 ) ) ( not ( = ?auto_11858 ?auto_11879 ) ) ( not ( = ?auto_11858 ?auto_11880 ) ) ( not ( = ?auto_11858 ?auto_11883 ) ) ( not ( = ?auto_11858 ?auto_11865 ) ) ( not ( = ?auto_11861 ?auto_11875 ) ) ( not ( = ?auto_11861 ?auto_11877 ) ) ( not ( = ?auto_11861 ?auto_11876 ) ) ( not ( = ?auto_11861 ?auto_11887 ) ) ( not ( = ?auto_11861 ?auto_11868 ) ) ( not ( = ?auto_11861 ?auto_11885 ) ) ( not ( = ?auto_11861 ?auto_11867 ) ) ( not ( = ?auto_11861 ?auto_11879 ) ) ( not ( = ?auto_11861 ?auto_11880 ) ) ( not ( = ?auto_11861 ?auto_11883 ) ) ( not ( = ?auto_11861 ?auto_11865 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_11846 ?auto_11847 ?auto_11848 ?auto_11849 ?auto_11850 ?auto_11851 ?auto_11852 ?auto_11853 ?auto_11854 ?auto_11855 ?auto_11856 ?auto_11857 )
      ( MAKE-1CRATE ?auto_11857 ?auto_11858 )
      ( MAKE-12CRATE-VERIFY ?auto_11846 ?auto_11847 ?auto_11848 ?auto_11849 ?auto_11850 ?auto_11851 ?auto_11852 ?auto_11853 ?auto_11854 ?auto_11855 ?auto_11856 ?auto_11857 ?auto_11858 ) )
  )

)

