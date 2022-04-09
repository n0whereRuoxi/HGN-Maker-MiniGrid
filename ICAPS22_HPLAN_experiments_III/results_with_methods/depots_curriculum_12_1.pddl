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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11384 - SURFACE
      ?auto_11385 - SURFACE
    )
    :vars
    (
      ?auto_11386 - HOIST
      ?auto_11387 - PLACE
      ?auto_11389 - PLACE
      ?auto_11390 - HOIST
      ?auto_11391 - SURFACE
      ?auto_11388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11386 ?auto_11387 ) ( SURFACE-AT ?auto_11384 ?auto_11387 ) ( CLEAR ?auto_11384 ) ( IS-CRATE ?auto_11385 ) ( AVAILABLE ?auto_11386 ) ( not ( = ?auto_11389 ?auto_11387 ) ) ( HOIST-AT ?auto_11390 ?auto_11389 ) ( AVAILABLE ?auto_11390 ) ( SURFACE-AT ?auto_11385 ?auto_11389 ) ( ON ?auto_11385 ?auto_11391 ) ( CLEAR ?auto_11385 ) ( TRUCK-AT ?auto_11388 ?auto_11387 ) ( not ( = ?auto_11384 ?auto_11385 ) ) ( not ( = ?auto_11384 ?auto_11391 ) ) ( not ( = ?auto_11385 ?auto_11391 ) ) ( not ( = ?auto_11386 ?auto_11390 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11388 ?auto_11387 ?auto_11389 )
      ( !LIFT ?auto_11390 ?auto_11385 ?auto_11391 ?auto_11389 )
      ( !LOAD ?auto_11390 ?auto_11385 ?auto_11388 ?auto_11389 )
      ( !DRIVE ?auto_11388 ?auto_11389 ?auto_11387 )
      ( !UNLOAD ?auto_11386 ?auto_11385 ?auto_11388 ?auto_11387 )
      ( !DROP ?auto_11386 ?auto_11385 ?auto_11384 ?auto_11387 )
      ( MAKE-1CRATE-VERIFY ?auto_11384 ?auto_11385 ) )
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
      ?auto_11402 - PLACE
      ?auto_11400 - PLACE
      ?auto_11403 - HOIST
      ?auto_11401 - SURFACE
      ?auto_11405 - PLACE
      ?auto_11404 - HOIST
      ?auto_11406 - SURFACE
      ?auto_11399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11398 ?auto_11402 ) ( IS-CRATE ?auto_11397 ) ( not ( = ?auto_11400 ?auto_11402 ) ) ( HOIST-AT ?auto_11403 ?auto_11400 ) ( AVAILABLE ?auto_11403 ) ( SURFACE-AT ?auto_11397 ?auto_11400 ) ( ON ?auto_11397 ?auto_11401 ) ( CLEAR ?auto_11397 ) ( not ( = ?auto_11396 ?auto_11397 ) ) ( not ( = ?auto_11396 ?auto_11401 ) ) ( not ( = ?auto_11397 ?auto_11401 ) ) ( not ( = ?auto_11398 ?auto_11403 ) ) ( SURFACE-AT ?auto_11395 ?auto_11402 ) ( CLEAR ?auto_11395 ) ( IS-CRATE ?auto_11396 ) ( AVAILABLE ?auto_11398 ) ( not ( = ?auto_11405 ?auto_11402 ) ) ( HOIST-AT ?auto_11404 ?auto_11405 ) ( AVAILABLE ?auto_11404 ) ( SURFACE-AT ?auto_11396 ?auto_11405 ) ( ON ?auto_11396 ?auto_11406 ) ( CLEAR ?auto_11396 ) ( TRUCK-AT ?auto_11399 ?auto_11402 ) ( not ( = ?auto_11395 ?auto_11396 ) ) ( not ( = ?auto_11395 ?auto_11406 ) ) ( not ( = ?auto_11396 ?auto_11406 ) ) ( not ( = ?auto_11398 ?auto_11404 ) ) ( not ( = ?auto_11395 ?auto_11397 ) ) ( not ( = ?auto_11395 ?auto_11401 ) ) ( not ( = ?auto_11397 ?auto_11406 ) ) ( not ( = ?auto_11400 ?auto_11405 ) ) ( not ( = ?auto_11403 ?auto_11404 ) ) ( not ( = ?auto_11401 ?auto_11406 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11395 ?auto_11396 )
      ( MAKE-1CRATE ?auto_11396 ?auto_11397 )
      ( MAKE-2CRATE-VERIFY ?auto_11395 ?auto_11396 ?auto_11397 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11409 - SURFACE
      ?auto_11410 - SURFACE
    )
    :vars
    (
      ?auto_11411 - HOIST
      ?auto_11412 - PLACE
      ?auto_11414 - PLACE
      ?auto_11415 - HOIST
      ?auto_11416 - SURFACE
      ?auto_11413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11411 ?auto_11412 ) ( SURFACE-AT ?auto_11409 ?auto_11412 ) ( CLEAR ?auto_11409 ) ( IS-CRATE ?auto_11410 ) ( AVAILABLE ?auto_11411 ) ( not ( = ?auto_11414 ?auto_11412 ) ) ( HOIST-AT ?auto_11415 ?auto_11414 ) ( AVAILABLE ?auto_11415 ) ( SURFACE-AT ?auto_11410 ?auto_11414 ) ( ON ?auto_11410 ?auto_11416 ) ( CLEAR ?auto_11410 ) ( TRUCK-AT ?auto_11413 ?auto_11412 ) ( not ( = ?auto_11409 ?auto_11410 ) ) ( not ( = ?auto_11409 ?auto_11416 ) ) ( not ( = ?auto_11410 ?auto_11416 ) ) ( not ( = ?auto_11411 ?auto_11415 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11413 ?auto_11412 ?auto_11414 )
      ( !LIFT ?auto_11415 ?auto_11410 ?auto_11416 ?auto_11414 )
      ( !LOAD ?auto_11415 ?auto_11410 ?auto_11413 ?auto_11414 )
      ( !DRIVE ?auto_11413 ?auto_11414 ?auto_11412 )
      ( !UNLOAD ?auto_11411 ?auto_11410 ?auto_11413 ?auto_11412 )
      ( !DROP ?auto_11411 ?auto_11410 ?auto_11409 ?auto_11412 )
      ( MAKE-1CRATE-VERIFY ?auto_11409 ?auto_11410 ) )
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
      ?auto_11426 - HOIST
      ?auto_11430 - PLACE
      ?auto_11425 - PLACE
      ?auto_11429 - HOIST
      ?auto_11427 - SURFACE
      ?auto_11435 - PLACE
      ?auto_11433 - HOIST
      ?auto_11434 - SURFACE
      ?auto_11432 - PLACE
      ?auto_11436 - HOIST
      ?auto_11431 - SURFACE
      ?auto_11428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11426 ?auto_11430 ) ( IS-CRATE ?auto_11424 ) ( not ( = ?auto_11425 ?auto_11430 ) ) ( HOIST-AT ?auto_11429 ?auto_11425 ) ( AVAILABLE ?auto_11429 ) ( SURFACE-AT ?auto_11424 ?auto_11425 ) ( ON ?auto_11424 ?auto_11427 ) ( CLEAR ?auto_11424 ) ( not ( = ?auto_11423 ?auto_11424 ) ) ( not ( = ?auto_11423 ?auto_11427 ) ) ( not ( = ?auto_11424 ?auto_11427 ) ) ( not ( = ?auto_11426 ?auto_11429 ) ) ( IS-CRATE ?auto_11423 ) ( not ( = ?auto_11435 ?auto_11430 ) ) ( HOIST-AT ?auto_11433 ?auto_11435 ) ( AVAILABLE ?auto_11433 ) ( SURFACE-AT ?auto_11423 ?auto_11435 ) ( ON ?auto_11423 ?auto_11434 ) ( CLEAR ?auto_11423 ) ( not ( = ?auto_11422 ?auto_11423 ) ) ( not ( = ?auto_11422 ?auto_11434 ) ) ( not ( = ?auto_11423 ?auto_11434 ) ) ( not ( = ?auto_11426 ?auto_11433 ) ) ( SURFACE-AT ?auto_11421 ?auto_11430 ) ( CLEAR ?auto_11421 ) ( IS-CRATE ?auto_11422 ) ( AVAILABLE ?auto_11426 ) ( not ( = ?auto_11432 ?auto_11430 ) ) ( HOIST-AT ?auto_11436 ?auto_11432 ) ( AVAILABLE ?auto_11436 ) ( SURFACE-AT ?auto_11422 ?auto_11432 ) ( ON ?auto_11422 ?auto_11431 ) ( CLEAR ?auto_11422 ) ( TRUCK-AT ?auto_11428 ?auto_11430 ) ( not ( = ?auto_11421 ?auto_11422 ) ) ( not ( = ?auto_11421 ?auto_11431 ) ) ( not ( = ?auto_11422 ?auto_11431 ) ) ( not ( = ?auto_11426 ?auto_11436 ) ) ( not ( = ?auto_11421 ?auto_11423 ) ) ( not ( = ?auto_11421 ?auto_11434 ) ) ( not ( = ?auto_11423 ?auto_11431 ) ) ( not ( = ?auto_11435 ?auto_11432 ) ) ( not ( = ?auto_11433 ?auto_11436 ) ) ( not ( = ?auto_11434 ?auto_11431 ) ) ( not ( = ?auto_11421 ?auto_11424 ) ) ( not ( = ?auto_11421 ?auto_11427 ) ) ( not ( = ?auto_11422 ?auto_11424 ) ) ( not ( = ?auto_11422 ?auto_11427 ) ) ( not ( = ?auto_11424 ?auto_11434 ) ) ( not ( = ?auto_11424 ?auto_11431 ) ) ( not ( = ?auto_11425 ?auto_11435 ) ) ( not ( = ?auto_11425 ?auto_11432 ) ) ( not ( = ?auto_11429 ?auto_11433 ) ) ( not ( = ?auto_11429 ?auto_11436 ) ) ( not ( = ?auto_11427 ?auto_11434 ) ) ( not ( = ?auto_11427 ?auto_11431 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11421 ?auto_11422 ?auto_11423 )
      ( MAKE-1CRATE ?auto_11423 ?auto_11424 )
      ( MAKE-3CRATE-VERIFY ?auto_11421 ?auto_11422 ?auto_11423 ?auto_11424 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11439 - SURFACE
      ?auto_11440 - SURFACE
    )
    :vars
    (
      ?auto_11441 - HOIST
      ?auto_11442 - PLACE
      ?auto_11444 - PLACE
      ?auto_11445 - HOIST
      ?auto_11446 - SURFACE
      ?auto_11443 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11441 ?auto_11442 ) ( SURFACE-AT ?auto_11439 ?auto_11442 ) ( CLEAR ?auto_11439 ) ( IS-CRATE ?auto_11440 ) ( AVAILABLE ?auto_11441 ) ( not ( = ?auto_11444 ?auto_11442 ) ) ( HOIST-AT ?auto_11445 ?auto_11444 ) ( AVAILABLE ?auto_11445 ) ( SURFACE-AT ?auto_11440 ?auto_11444 ) ( ON ?auto_11440 ?auto_11446 ) ( CLEAR ?auto_11440 ) ( TRUCK-AT ?auto_11443 ?auto_11442 ) ( not ( = ?auto_11439 ?auto_11440 ) ) ( not ( = ?auto_11439 ?auto_11446 ) ) ( not ( = ?auto_11440 ?auto_11446 ) ) ( not ( = ?auto_11441 ?auto_11445 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11443 ?auto_11442 ?auto_11444 )
      ( !LIFT ?auto_11445 ?auto_11440 ?auto_11446 ?auto_11444 )
      ( !LOAD ?auto_11445 ?auto_11440 ?auto_11443 ?auto_11444 )
      ( !DRIVE ?auto_11443 ?auto_11444 ?auto_11442 )
      ( !UNLOAD ?auto_11441 ?auto_11440 ?auto_11443 ?auto_11442 )
      ( !DROP ?auto_11441 ?auto_11440 ?auto_11439 ?auto_11442 )
      ( MAKE-1CRATE-VERIFY ?auto_11439 ?auto_11440 ) )
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
      ?auto_11460 - HOIST
      ?auto_11461 - PLACE
      ?auto_11459 - PLACE
      ?auto_11458 - HOIST
      ?auto_11462 - SURFACE
      ?auto_11469 - PLACE
      ?auto_11470 - HOIST
      ?auto_11468 - SURFACE
      ?auto_11464 - PLACE
      ?auto_11465 - HOIST
      ?auto_11466 - SURFACE
      ?auto_11463 - PLACE
      ?auto_11471 - HOIST
      ?auto_11467 - SURFACE
      ?auto_11457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11460 ?auto_11461 ) ( IS-CRATE ?auto_11456 ) ( not ( = ?auto_11459 ?auto_11461 ) ) ( HOIST-AT ?auto_11458 ?auto_11459 ) ( AVAILABLE ?auto_11458 ) ( SURFACE-AT ?auto_11456 ?auto_11459 ) ( ON ?auto_11456 ?auto_11462 ) ( CLEAR ?auto_11456 ) ( not ( = ?auto_11455 ?auto_11456 ) ) ( not ( = ?auto_11455 ?auto_11462 ) ) ( not ( = ?auto_11456 ?auto_11462 ) ) ( not ( = ?auto_11460 ?auto_11458 ) ) ( IS-CRATE ?auto_11455 ) ( not ( = ?auto_11469 ?auto_11461 ) ) ( HOIST-AT ?auto_11470 ?auto_11469 ) ( AVAILABLE ?auto_11470 ) ( SURFACE-AT ?auto_11455 ?auto_11469 ) ( ON ?auto_11455 ?auto_11468 ) ( CLEAR ?auto_11455 ) ( not ( = ?auto_11454 ?auto_11455 ) ) ( not ( = ?auto_11454 ?auto_11468 ) ) ( not ( = ?auto_11455 ?auto_11468 ) ) ( not ( = ?auto_11460 ?auto_11470 ) ) ( IS-CRATE ?auto_11454 ) ( not ( = ?auto_11464 ?auto_11461 ) ) ( HOIST-AT ?auto_11465 ?auto_11464 ) ( AVAILABLE ?auto_11465 ) ( SURFACE-AT ?auto_11454 ?auto_11464 ) ( ON ?auto_11454 ?auto_11466 ) ( CLEAR ?auto_11454 ) ( not ( = ?auto_11453 ?auto_11454 ) ) ( not ( = ?auto_11453 ?auto_11466 ) ) ( not ( = ?auto_11454 ?auto_11466 ) ) ( not ( = ?auto_11460 ?auto_11465 ) ) ( SURFACE-AT ?auto_11452 ?auto_11461 ) ( CLEAR ?auto_11452 ) ( IS-CRATE ?auto_11453 ) ( AVAILABLE ?auto_11460 ) ( not ( = ?auto_11463 ?auto_11461 ) ) ( HOIST-AT ?auto_11471 ?auto_11463 ) ( AVAILABLE ?auto_11471 ) ( SURFACE-AT ?auto_11453 ?auto_11463 ) ( ON ?auto_11453 ?auto_11467 ) ( CLEAR ?auto_11453 ) ( TRUCK-AT ?auto_11457 ?auto_11461 ) ( not ( = ?auto_11452 ?auto_11453 ) ) ( not ( = ?auto_11452 ?auto_11467 ) ) ( not ( = ?auto_11453 ?auto_11467 ) ) ( not ( = ?auto_11460 ?auto_11471 ) ) ( not ( = ?auto_11452 ?auto_11454 ) ) ( not ( = ?auto_11452 ?auto_11466 ) ) ( not ( = ?auto_11454 ?auto_11467 ) ) ( not ( = ?auto_11464 ?auto_11463 ) ) ( not ( = ?auto_11465 ?auto_11471 ) ) ( not ( = ?auto_11466 ?auto_11467 ) ) ( not ( = ?auto_11452 ?auto_11455 ) ) ( not ( = ?auto_11452 ?auto_11468 ) ) ( not ( = ?auto_11453 ?auto_11455 ) ) ( not ( = ?auto_11453 ?auto_11468 ) ) ( not ( = ?auto_11455 ?auto_11466 ) ) ( not ( = ?auto_11455 ?auto_11467 ) ) ( not ( = ?auto_11469 ?auto_11464 ) ) ( not ( = ?auto_11469 ?auto_11463 ) ) ( not ( = ?auto_11470 ?auto_11465 ) ) ( not ( = ?auto_11470 ?auto_11471 ) ) ( not ( = ?auto_11468 ?auto_11466 ) ) ( not ( = ?auto_11468 ?auto_11467 ) ) ( not ( = ?auto_11452 ?auto_11456 ) ) ( not ( = ?auto_11452 ?auto_11462 ) ) ( not ( = ?auto_11453 ?auto_11456 ) ) ( not ( = ?auto_11453 ?auto_11462 ) ) ( not ( = ?auto_11454 ?auto_11456 ) ) ( not ( = ?auto_11454 ?auto_11462 ) ) ( not ( = ?auto_11456 ?auto_11468 ) ) ( not ( = ?auto_11456 ?auto_11466 ) ) ( not ( = ?auto_11456 ?auto_11467 ) ) ( not ( = ?auto_11459 ?auto_11469 ) ) ( not ( = ?auto_11459 ?auto_11464 ) ) ( not ( = ?auto_11459 ?auto_11463 ) ) ( not ( = ?auto_11458 ?auto_11470 ) ) ( not ( = ?auto_11458 ?auto_11465 ) ) ( not ( = ?auto_11458 ?auto_11471 ) ) ( not ( = ?auto_11462 ?auto_11468 ) ) ( not ( = ?auto_11462 ?auto_11466 ) ) ( not ( = ?auto_11462 ?auto_11467 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_11452 ?auto_11453 ?auto_11454 ?auto_11455 )
      ( MAKE-1CRATE ?auto_11455 ?auto_11456 )
      ( MAKE-4CRATE-VERIFY ?auto_11452 ?auto_11453 ?auto_11454 ?auto_11455 ?auto_11456 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11474 - SURFACE
      ?auto_11475 - SURFACE
    )
    :vars
    (
      ?auto_11476 - HOIST
      ?auto_11477 - PLACE
      ?auto_11479 - PLACE
      ?auto_11480 - HOIST
      ?auto_11481 - SURFACE
      ?auto_11478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11476 ?auto_11477 ) ( SURFACE-AT ?auto_11474 ?auto_11477 ) ( CLEAR ?auto_11474 ) ( IS-CRATE ?auto_11475 ) ( AVAILABLE ?auto_11476 ) ( not ( = ?auto_11479 ?auto_11477 ) ) ( HOIST-AT ?auto_11480 ?auto_11479 ) ( AVAILABLE ?auto_11480 ) ( SURFACE-AT ?auto_11475 ?auto_11479 ) ( ON ?auto_11475 ?auto_11481 ) ( CLEAR ?auto_11475 ) ( TRUCK-AT ?auto_11478 ?auto_11477 ) ( not ( = ?auto_11474 ?auto_11475 ) ) ( not ( = ?auto_11474 ?auto_11481 ) ) ( not ( = ?auto_11475 ?auto_11481 ) ) ( not ( = ?auto_11476 ?auto_11480 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11478 ?auto_11477 ?auto_11479 )
      ( !LIFT ?auto_11480 ?auto_11475 ?auto_11481 ?auto_11479 )
      ( !LOAD ?auto_11480 ?auto_11475 ?auto_11478 ?auto_11479 )
      ( !DRIVE ?auto_11478 ?auto_11479 ?auto_11477 )
      ( !UNLOAD ?auto_11476 ?auto_11475 ?auto_11478 ?auto_11477 )
      ( !DROP ?auto_11476 ?auto_11475 ?auto_11474 ?auto_11477 )
      ( MAKE-1CRATE-VERIFY ?auto_11474 ?auto_11475 ) )
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
      ?auto_11496 - PLACE
      ?auto_11495 - PLACE
      ?auto_11497 - HOIST
      ?auto_11499 - SURFACE
      ?auto_11505 - SURFACE
      ?auto_11501 - PLACE
      ?auto_11504 - HOIST
      ?auto_11509 - SURFACE
      ?auto_11506 - PLACE
      ?auto_11502 - HOIST
      ?auto_11507 - SURFACE
      ?auto_11503 - PLACE
      ?auto_11500 - HOIST
      ?auto_11508 - SURFACE
      ?auto_11498 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11494 ?auto_11496 ) ( IS-CRATE ?auto_11493 ) ( not ( = ?auto_11495 ?auto_11496 ) ) ( HOIST-AT ?auto_11497 ?auto_11495 ) ( SURFACE-AT ?auto_11493 ?auto_11495 ) ( ON ?auto_11493 ?auto_11499 ) ( CLEAR ?auto_11493 ) ( not ( = ?auto_11492 ?auto_11493 ) ) ( not ( = ?auto_11492 ?auto_11499 ) ) ( not ( = ?auto_11493 ?auto_11499 ) ) ( not ( = ?auto_11494 ?auto_11497 ) ) ( IS-CRATE ?auto_11492 ) ( AVAILABLE ?auto_11497 ) ( SURFACE-AT ?auto_11492 ?auto_11495 ) ( ON ?auto_11492 ?auto_11505 ) ( CLEAR ?auto_11492 ) ( not ( = ?auto_11491 ?auto_11492 ) ) ( not ( = ?auto_11491 ?auto_11505 ) ) ( not ( = ?auto_11492 ?auto_11505 ) ) ( IS-CRATE ?auto_11491 ) ( not ( = ?auto_11501 ?auto_11496 ) ) ( HOIST-AT ?auto_11504 ?auto_11501 ) ( AVAILABLE ?auto_11504 ) ( SURFACE-AT ?auto_11491 ?auto_11501 ) ( ON ?auto_11491 ?auto_11509 ) ( CLEAR ?auto_11491 ) ( not ( = ?auto_11490 ?auto_11491 ) ) ( not ( = ?auto_11490 ?auto_11509 ) ) ( not ( = ?auto_11491 ?auto_11509 ) ) ( not ( = ?auto_11494 ?auto_11504 ) ) ( IS-CRATE ?auto_11490 ) ( not ( = ?auto_11506 ?auto_11496 ) ) ( HOIST-AT ?auto_11502 ?auto_11506 ) ( AVAILABLE ?auto_11502 ) ( SURFACE-AT ?auto_11490 ?auto_11506 ) ( ON ?auto_11490 ?auto_11507 ) ( CLEAR ?auto_11490 ) ( not ( = ?auto_11489 ?auto_11490 ) ) ( not ( = ?auto_11489 ?auto_11507 ) ) ( not ( = ?auto_11490 ?auto_11507 ) ) ( not ( = ?auto_11494 ?auto_11502 ) ) ( SURFACE-AT ?auto_11488 ?auto_11496 ) ( CLEAR ?auto_11488 ) ( IS-CRATE ?auto_11489 ) ( AVAILABLE ?auto_11494 ) ( not ( = ?auto_11503 ?auto_11496 ) ) ( HOIST-AT ?auto_11500 ?auto_11503 ) ( AVAILABLE ?auto_11500 ) ( SURFACE-AT ?auto_11489 ?auto_11503 ) ( ON ?auto_11489 ?auto_11508 ) ( CLEAR ?auto_11489 ) ( TRUCK-AT ?auto_11498 ?auto_11496 ) ( not ( = ?auto_11488 ?auto_11489 ) ) ( not ( = ?auto_11488 ?auto_11508 ) ) ( not ( = ?auto_11489 ?auto_11508 ) ) ( not ( = ?auto_11494 ?auto_11500 ) ) ( not ( = ?auto_11488 ?auto_11490 ) ) ( not ( = ?auto_11488 ?auto_11507 ) ) ( not ( = ?auto_11490 ?auto_11508 ) ) ( not ( = ?auto_11506 ?auto_11503 ) ) ( not ( = ?auto_11502 ?auto_11500 ) ) ( not ( = ?auto_11507 ?auto_11508 ) ) ( not ( = ?auto_11488 ?auto_11491 ) ) ( not ( = ?auto_11488 ?auto_11509 ) ) ( not ( = ?auto_11489 ?auto_11491 ) ) ( not ( = ?auto_11489 ?auto_11509 ) ) ( not ( = ?auto_11491 ?auto_11507 ) ) ( not ( = ?auto_11491 ?auto_11508 ) ) ( not ( = ?auto_11501 ?auto_11506 ) ) ( not ( = ?auto_11501 ?auto_11503 ) ) ( not ( = ?auto_11504 ?auto_11502 ) ) ( not ( = ?auto_11504 ?auto_11500 ) ) ( not ( = ?auto_11509 ?auto_11507 ) ) ( not ( = ?auto_11509 ?auto_11508 ) ) ( not ( = ?auto_11488 ?auto_11492 ) ) ( not ( = ?auto_11488 ?auto_11505 ) ) ( not ( = ?auto_11489 ?auto_11492 ) ) ( not ( = ?auto_11489 ?auto_11505 ) ) ( not ( = ?auto_11490 ?auto_11492 ) ) ( not ( = ?auto_11490 ?auto_11505 ) ) ( not ( = ?auto_11492 ?auto_11509 ) ) ( not ( = ?auto_11492 ?auto_11507 ) ) ( not ( = ?auto_11492 ?auto_11508 ) ) ( not ( = ?auto_11495 ?auto_11501 ) ) ( not ( = ?auto_11495 ?auto_11506 ) ) ( not ( = ?auto_11495 ?auto_11503 ) ) ( not ( = ?auto_11497 ?auto_11504 ) ) ( not ( = ?auto_11497 ?auto_11502 ) ) ( not ( = ?auto_11497 ?auto_11500 ) ) ( not ( = ?auto_11505 ?auto_11509 ) ) ( not ( = ?auto_11505 ?auto_11507 ) ) ( not ( = ?auto_11505 ?auto_11508 ) ) ( not ( = ?auto_11488 ?auto_11493 ) ) ( not ( = ?auto_11488 ?auto_11499 ) ) ( not ( = ?auto_11489 ?auto_11493 ) ) ( not ( = ?auto_11489 ?auto_11499 ) ) ( not ( = ?auto_11490 ?auto_11493 ) ) ( not ( = ?auto_11490 ?auto_11499 ) ) ( not ( = ?auto_11491 ?auto_11493 ) ) ( not ( = ?auto_11491 ?auto_11499 ) ) ( not ( = ?auto_11493 ?auto_11505 ) ) ( not ( = ?auto_11493 ?auto_11509 ) ) ( not ( = ?auto_11493 ?auto_11507 ) ) ( not ( = ?auto_11493 ?auto_11508 ) ) ( not ( = ?auto_11499 ?auto_11505 ) ) ( not ( = ?auto_11499 ?auto_11509 ) ) ( not ( = ?auto_11499 ?auto_11507 ) ) ( not ( = ?auto_11499 ?auto_11508 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_11488 ?auto_11489 ?auto_11490 ?auto_11491 ?auto_11492 )
      ( MAKE-1CRATE ?auto_11492 ?auto_11493 )
      ( MAKE-5CRATE-VERIFY ?auto_11488 ?auto_11489 ?auto_11490 ?auto_11491 ?auto_11492 ?auto_11493 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11512 - SURFACE
      ?auto_11513 - SURFACE
    )
    :vars
    (
      ?auto_11514 - HOIST
      ?auto_11515 - PLACE
      ?auto_11517 - PLACE
      ?auto_11518 - HOIST
      ?auto_11519 - SURFACE
      ?auto_11516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11514 ?auto_11515 ) ( SURFACE-AT ?auto_11512 ?auto_11515 ) ( CLEAR ?auto_11512 ) ( IS-CRATE ?auto_11513 ) ( AVAILABLE ?auto_11514 ) ( not ( = ?auto_11517 ?auto_11515 ) ) ( HOIST-AT ?auto_11518 ?auto_11517 ) ( AVAILABLE ?auto_11518 ) ( SURFACE-AT ?auto_11513 ?auto_11517 ) ( ON ?auto_11513 ?auto_11519 ) ( CLEAR ?auto_11513 ) ( TRUCK-AT ?auto_11516 ?auto_11515 ) ( not ( = ?auto_11512 ?auto_11513 ) ) ( not ( = ?auto_11512 ?auto_11519 ) ) ( not ( = ?auto_11513 ?auto_11519 ) ) ( not ( = ?auto_11514 ?auto_11518 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11516 ?auto_11515 ?auto_11517 )
      ( !LIFT ?auto_11518 ?auto_11513 ?auto_11519 ?auto_11517 )
      ( !LOAD ?auto_11518 ?auto_11513 ?auto_11516 ?auto_11517 )
      ( !DRIVE ?auto_11516 ?auto_11517 ?auto_11515 )
      ( !UNLOAD ?auto_11514 ?auto_11513 ?auto_11516 ?auto_11515 )
      ( !DROP ?auto_11514 ?auto_11513 ?auto_11512 ?auto_11515 )
      ( MAKE-1CRATE-VERIFY ?auto_11512 ?auto_11513 ) )
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
      ?auto_11537 - PLACE
      ?auto_11536 - HOIST
      ?auto_11534 - SURFACE
      ?auto_11541 - SURFACE
      ?auto_11546 - SURFACE
      ?auto_11543 - PLACE
      ?auto_11547 - HOIST
      ?auto_11544 - SURFACE
      ?auto_11545 - PLACE
      ?auto_11548 - HOIST
      ?auto_11549 - SURFACE
      ?auto_11540 - PLACE
      ?auto_11542 - HOIST
      ?auto_11550 - SURFACE
      ?auto_11535 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11539 ?auto_11538 ) ( IS-CRATE ?auto_11533 ) ( not ( = ?auto_11537 ?auto_11538 ) ) ( HOIST-AT ?auto_11536 ?auto_11537 ) ( SURFACE-AT ?auto_11533 ?auto_11537 ) ( ON ?auto_11533 ?auto_11534 ) ( CLEAR ?auto_11533 ) ( not ( = ?auto_11532 ?auto_11533 ) ) ( not ( = ?auto_11532 ?auto_11534 ) ) ( not ( = ?auto_11533 ?auto_11534 ) ) ( not ( = ?auto_11539 ?auto_11536 ) ) ( IS-CRATE ?auto_11532 ) ( SURFACE-AT ?auto_11532 ?auto_11537 ) ( ON ?auto_11532 ?auto_11541 ) ( CLEAR ?auto_11532 ) ( not ( = ?auto_11531 ?auto_11532 ) ) ( not ( = ?auto_11531 ?auto_11541 ) ) ( not ( = ?auto_11532 ?auto_11541 ) ) ( IS-CRATE ?auto_11531 ) ( AVAILABLE ?auto_11536 ) ( SURFACE-AT ?auto_11531 ?auto_11537 ) ( ON ?auto_11531 ?auto_11546 ) ( CLEAR ?auto_11531 ) ( not ( = ?auto_11530 ?auto_11531 ) ) ( not ( = ?auto_11530 ?auto_11546 ) ) ( not ( = ?auto_11531 ?auto_11546 ) ) ( IS-CRATE ?auto_11530 ) ( not ( = ?auto_11543 ?auto_11538 ) ) ( HOIST-AT ?auto_11547 ?auto_11543 ) ( AVAILABLE ?auto_11547 ) ( SURFACE-AT ?auto_11530 ?auto_11543 ) ( ON ?auto_11530 ?auto_11544 ) ( CLEAR ?auto_11530 ) ( not ( = ?auto_11529 ?auto_11530 ) ) ( not ( = ?auto_11529 ?auto_11544 ) ) ( not ( = ?auto_11530 ?auto_11544 ) ) ( not ( = ?auto_11539 ?auto_11547 ) ) ( IS-CRATE ?auto_11529 ) ( not ( = ?auto_11545 ?auto_11538 ) ) ( HOIST-AT ?auto_11548 ?auto_11545 ) ( AVAILABLE ?auto_11548 ) ( SURFACE-AT ?auto_11529 ?auto_11545 ) ( ON ?auto_11529 ?auto_11549 ) ( CLEAR ?auto_11529 ) ( not ( = ?auto_11528 ?auto_11529 ) ) ( not ( = ?auto_11528 ?auto_11549 ) ) ( not ( = ?auto_11529 ?auto_11549 ) ) ( not ( = ?auto_11539 ?auto_11548 ) ) ( SURFACE-AT ?auto_11527 ?auto_11538 ) ( CLEAR ?auto_11527 ) ( IS-CRATE ?auto_11528 ) ( AVAILABLE ?auto_11539 ) ( not ( = ?auto_11540 ?auto_11538 ) ) ( HOIST-AT ?auto_11542 ?auto_11540 ) ( AVAILABLE ?auto_11542 ) ( SURFACE-AT ?auto_11528 ?auto_11540 ) ( ON ?auto_11528 ?auto_11550 ) ( CLEAR ?auto_11528 ) ( TRUCK-AT ?auto_11535 ?auto_11538 ) ( not ( = ?auto_11527 ?auto_11528 ) ) ( not ( = ?auto_11527 ?auto_11550 ) ) ( not ( = ?auto_11528 ?auto_11550 ) ) ( not ( = ?auto_11539 ?auto_11542 ) ) ( not ( = ?auto_11527 ?auto_11529 ) ) ( not ( = ?auto_11527 ?auto_11549 ) ) ( not ( = ?auto_11529 ?auto_11550 ) ) ( not ( = ?auto_11545 ?auto_11540 ) ) ( not ( = ?auto_11548 ?auto_11542 ) ) ( not ( = ?auto_11549 ?auto_11550 ) ) ( not ( = ?auto_11527 ?auto_11530 ) ) ( not ( = ?auto_11527 ?auto_11544 ) ) ( not ( = ?auto_11528 ?auto_11530 ) ) ( not ( = ?auto_11528 ?auto_11544 ) ) ( not ( = ?auto_11530 ?auto_11549 ) ) ( not ( = ?auto_11530 ?auto_11550 ) ) ( not ( = ?auto_11543 ?auto_11545 ) ) ( not ( = ?auto_11543 ?auto_11540 ) ) ( not ( = ?auto_11547 ?auto_11548 ) ) ( not ( = ?auto_11547 ?auto_11542 ) ) ( not ( = ?auto_11544 ?auto_11549 ) ) ( not ( = ?auto_11544 ?auto_11550 ) ) ( not ( = ?auto_11527 ?auto_11531 ) ) ( not ( = ?auto_11527 ?auto_11546 ) ) ( not ( = ?auto_11528 ?auto_11531 ) ) ( not ( = ?auto_11528 ?auto_11546 ) ) ( not ( = ?auto_11529 ?auto_11531 ) ) ( not ( = ?auto_11529 ?auto_11546 ) ) ( not ( = ?auto_11531 ?auto_11544 ) ) ( not ( = ?auto_11531 ?auto_11549 ) ) ( not ( = ?auto_11531 ?auto_11550 ) ) ( not ( = ?auto_11537 ?auto_11543 ) ) ( not ( = ?auto_11537 ?auto_11545 ) ) ( not ( = ?auto_11537 ?auto_11540 ) ) ( not ( = ?auto_11536 ?auto_11547 ) ) ( not ( = ?auto_11536 ?auto_11548 ) ) ( not ( = ?auto_11536 ?auto_11542 ) ) ( not ( = ?auto_11546 ?auto_11544 ) ) ( not ( = ?auto_11546 ?auto_11549 ) ) ( not ( = ?auto_11546 ?auto_11550 ) ) ( not ( = ?auto_11527 ?auto_11532 ) ) ( not ( = ?auto_11527 ?auto_11541 ) ) ( not ( = ?auto_11528 ?auto_11532 ) ) ( not ( = ?auto_11528 ?auto_11541 ) ) ( not ( = ?auto_11529 ?auto_11532 ) ) ( not ( = ?auto_11529 ?auto_11541 ) ) ( not ( = ?auto_11530 ?auto_11532 ) ) ( not ( = ?auto_11530 ?auto_11541 ) ) ( not ( = ?auto_11532 ?auto_11546 ) ) ( not ( = ?auto_11532 ?auto_11544 ) ) ( not ( = ?auto_11532 ?auto_11549 ) ) ( not ( = ?auto_11532 ?auto_11550 ) ) ( not ( = ?auto_11541 ?auto_11546 ) ) ( not ( = ?auto_11541 ?auto_11544 ) ) ( not ( = ?auto_11541 ?auto_11549 ) ) ( not ( = ?auto_11541 ?auto_11550 ) ) ( not ( = ?auto_11527 ?auto_11533 ) ) ( not ( = ?auto_11527 ?auto_11534 ) ) ( not ( = ?auto_11528 ?auto_11533 ) ) ( not ( = ?auto_11528 ?auto_11534 ) ) ( not ( = ?auto_11529 ?auto_11533 ) ) ( not ( = ?auto_11529 ?auto_11534 ) ) ( not ( = ?auto_11530 ?auto_11533 ) ) ( not ( = ?auto_11530 ?auto_11534 ) ) ( not ( = ?auto_11531 ?auto_11533 ) ) ( not ( = ?auto_11531 ?auto_11534 ) ) ( not ( = ?auto_11533 ?auto_11541 ) ) ( not ( = ?auto_11533 ?auto_11546 ) ) ( not ( = ?auto_11533 ?auto_11544 ) ) ( not ( = ?auto_11533 ?auto_11549 ) ) ( not ( = ?auto_11533 ?auto_11550 ) ) ( not ( = ?auto_11534 ?auto_11541 ) ) ( not ( = ?auto_11534 ?auto_11546 ) ) ( not ( = ?auto_11534 ?auto_11544 ) ) ( not ( = ?auto_11534 ?auto_11549 ) ) ( not ( = ?auto_11534 ?auto_11550 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_11527 ?auto_11528 ?auto_11529 ?auto_11530 ?auto_11531 ?auto_11532 )
      ( MAKE-1CRATE ?auto_11532 ?auto_11533 )
      ( MAKE-6CRATE-VERIFY ?auto_11527 ?auto_11528 ?auto_11529 ?auto_11530 ?auto_11531 ?auto_11532 ?auto_11533 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11553 - SURFACE
      ?auto_11554 - SURFACE
    )
    :vars
    (
      ?auto_11555 - HOIST
      ?auto_11556 - PLACE
      ?auto_11558 - PLACE
      ?auto_11559 - HOIST
      ?auto_11560 - SURFACE
      ?auto_11557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11555 ?auto_11556 ) ( SURFACE-AT ?auto_11553 ?auto_11556 ) ( CLEAR ?auto_11553 ) ( IS-CRATE ?auto_11554 ) ( AVAILABLE ?auto_11555 ) ( not ( = ?auto_11558 ?auto_11556 ) ) ( HOIST-AT ?auto_11559 ?auto_11558 ) ( AVAILABLE ?auto_11559 ) ( SURFACE-AT ?auto_11554 ?auto_11558 ) ( ON ?auto_11554 ?auto_11560 ) ( CLEAR ?auto_11554 ) ( TRUCK-AT ?auto_11557 ?auto_11556 ) ( not ( = ?auto_11553 ?auto_11554 ) ) ( not ( = ?auto_11553 ?auto_11560 ) ) ( not ( = ?auto_11554 ?auto_11560 ) ) ( not ( = ?auto_11555 ?auto_11559 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11557 ?auto_11556 ?auto_11558 )
      ( !LIFT ?auto_11559 ?auto_11554 ?auto_11560 ?auto_11558 )
      ( !LOAD ?auto_11559 ?auto_11554 ?auto_11557 ?auto_11558 )
      ( !DRIVE ?auto_11557 ?auto_11558 ?auto_11556 )
      ( !UNLOAD ?auto_11555 ?auto_11554 ?auto_11557 ?auto_11556 )
      ( !DROP ?auto_11555 ?auto_11554 ?auto_11553 ?auto_11556 )
      ( MAKE-1CRATE-VERIFY ?auto_11553 ?auto_11554 ) )
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
      ?auto_11579 - HOIST
      ?auto_11580 - PLACE
      ?auto_11578 - PLACE
      ?auto_11581 - HOIST
      ?auto_11582 - SURFACE
      ?auto_11592 - PLACE
      ?auto_11591 - HOIST
      ?auto_11590 - SURFACE
      ?auto_11594 - SURFACE
      ?auto_11585 - SURFACE
      ?auto_11589 - PLACE
      ?auto_11584 - HOIST
      ?auto_11587 - SURFACE
      ?auto_11586 - PLACE
      ?auto_11595 - HOIST
      ?auto_11583 - SURFACE
      ?auto_11588 - PLACE
      ?auto_11596 - HOIST
      ?auto_11593 - SURFACE
      ?auto_11577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11579 ?auto_11580 ) ( IS-CRATE ?auto_11576 ) ( not ( = ?auto_11578 ?auto_11580 ) ) ( HOIST-AT ?auto_11581 ?auto_11578 ) ( AVAILABLE ?auto_11581 ) ( SURFACE-AT ?auto_11576 ?auto_11578 ) ( ON ?auto_11576 ?auto_11582 ) ( CLEAR ?auto_11576 ) ( not ( = ?auto_11575 ?auto_11576 ) ) ( not ( = ?auto_11575 ?auto_11582 ) ) ( not ( = ?auto_11576 ?auto_11582 ) ) ( not ( = ?auto_11579 ?auto_11581 ) ) ( IS-CRATE ?auto_11575 ) ( not ( = ?auto_11592 ?auto_11580 ) ) ( HOIST-AT ?auto_11591 ?auto_11592 ) ( SURFACE-AT ?auto_11575 ?auto_11592 ) ( ON ?auto_11575 ?auto_11590 ) ( CLEAR ?auto_11575 ) ( not ( = ?auto_11574 ?auto_11575 ) ) ( not ( = ?auto_11574 ?auto_11590 ) ) ( not ( = ?auto_11575 ?auto_11590 ) ) ( not ( = ?auto_11579 ?auto_11591 ) ) ( IS-CRATE ?auto_11574 ) ( SURFACE-AT ?auto_11574 ?auto_11592 ) ( ON ?auto_11574 ?auto_11594 ) ( CLEAR ?auto_11574 ) ( not ( = ?auto_11573 ?auto_11574 ) ) ( not ( = ?auto_11573 ?auto_11594 ) ) ( not ( = ?auto_11574 ?auto_11594 ) ) ( IS-CRATE ?auto_11573 ) ( AVAILABLE ?auto_11591 ) ( SURFACE-AT ?auto_11573 ?auto_11592 ) ( ON ?auto_11573 ?auto_11585 ) ( CLEAR ?auto_11573 ) ( not ( = ?auto_11572 ?auto_11573 ) ) ( not ( = ?auto_11572 ?auto_11585 ) ) ( not ( = ?auto_11573 ?auto_11585 ) ) ( IS-CRATE ?auto_11572 ) ( not ( = ?auto_11589 ?auto_11580 ) ) ( HOIST-AT ?auto_11584 ?auto_11589 ) ( AVAILABLE ?auto_11584 ) ( SURFACE-AT ?auto_11572 ?auto_11589 ) ( ON ?auto_11572 ?auto_11587 ) ( CLEAR ?auto_11572 ) ( not ( = ?auto_11571 ?auto_11572 ) ) ( not ( = ?auto_11571 ?auto_11587 ) ) ( not ( = ?auto_11572 ?auto_11587 ) ) ( not ( = ?auto_11579 ?auto_11584 ) ) ( IS-CRATE ?auto_11571 ) ( not ( = ?auto_11586 ?auto_11580 ) ) ( HOIST-AT ?auto_11595 ?auto_11586 ) ( AVAILABLE ?auto_11595 ) ( SURFACE-AT ?auto_11571 ?auto_11586 ) ( ON ?auto_11571 ?auto_11583 ) ( CLEAR ?auto_11571 ) ( not ( = ?auto_11570 ?auto_11571 ) ) ( not ( = ?auto_11570 ?auto_11583 ) ) ( not ( = ?auto_11571 ?auto_11583 ) ) ( not ( = ?auto_11579 ?auto_11595 ) ) ( SURFACE-AT ?auto_11569 ?auto_11580 ) ( CLEAR ?auto_11569 ) ( IS-CRATE ?auto_11570 ) ( AVAILABLE ?auto_11579 ) ( not ( = ?auto_11588 ?auto_11580 ) ) ( HOIST-AT ?auto_11596 ?auto_11588 ) ( AVAILABLE ?auto_11596 ) ( SURFACE-AT ?auto_11570 ?auto_11588 ) ( ON ?auto_11570 ?auto_11593 ) ( CLEAR ?auto_11570 ) ( TRUCK-AT ?auto_11577 ?auto_11580 ) ( not ( = ?auto_11569 ?auto_11570 ) ) ( not ( = ?auto_11569 ?auto_11593 ) ) ( not ( = ?auto_11570 ?auto_11593 ) ) ( not ( = ?auto_11579 ?auto_11596 ) ) ( not ( = ?auto_11569 ?auto_11571 ) ) ( not ( = ?auto_11569 ?auto_11583 ) ) ( not ( = ?auto_11571 ?auto_11593 ) ) ( not ( = ?auto_11586 ?auto_11588 ) ) ( not ( = ?auto_11595 ?auto_11596 ) ) ( not ( = ?auto_11583 ?auto_11593 ) ) ( not ( = ?auto_11569 ?auto_11572 ) ) ( not ( = ?auto_11569 ?auto_11587 ) ) ( not ( = ?auto_11570 ?auto_11572 ) ) ( not ( = ?auto_11570 ?auto_11587 ) ) ( not ( = ?auto_11572 ?auto_11583 ) ) ( not ( = ?auto_11572 ?auto_11593 ) ) ( not ( = ?auto_11589 ?auto_11586 ) ) ( not ( = ?auto_11589 ?auto_11588 ) ) ( not ( = ?auto_11584 ?auto_11595 ) ) ( not ( = ?auto_11584 ?auto_11596 ) ) ( not ( = ?auto_11587 ?auto_11583 ) ) ( not ( = ?auto_11587 ?auto_11593 ) ) ( not ( = ?auto_11569 ?auto_11573 ) ) ( not ( = ?auto_11569 ?auto_11585 ) ) ( not ( = ?auto_11570 ?auto_11573 ) ) ( not ( = ?auto_11570 ?auto_11585 ) ) ( not ( = ?auto_11571 ?auto_11573 ) ) ( not ( = ?auto_11571 ?auto_11585 ) ) ( not ( = ?auto_11573 ?auto_11587 ) ) ( not ( = ?auto_11573 ?auto_11583 ) ) ( not ( = ?auto_11573 ?auto_11593 ) ) ( not ( = ?auto_11592 ?auto_11589 ) ) ( not ( = ?auto_11592 ?auto_11586 ) ) ( not ( = ?auto_11592 ?auto_11588 ) ) ( not ( = ?auto_11591 ?auto_11584 ) ) ( not ( = ?auto_11591 ?auto_11595 ) ) ( not ( = ?auto_11591 ?auto_11596 ) ) ( not ( = ?auto_11585 ?auto_11587 ) ) ( not ( = ?auto_11585 ?auto_11583 ) ) ( not ( = ?auto_11585 ?auto_11593 ) ) ( not ( = ?auto_11569 ?auto_11574 ) ) ( not ( = ?auto_11569 ?auto_11594 ) ) ( not ( = ?auto_11570 ?auto_11574 ) ) ( not ( = ?auto_11570 ?auto_11594 ) ) ( not ( = ?auto_11571 ?auto_11574 ) ) ( not ( = ?auto_11571 ?auto_11594 ) ) ( not ( = ?auto_11572 ?auto_11574 ) ) ( not ( = ?auto_11572 ?auto_11594 ) ) ( not ( = ?auto_11574 ?auto_11585 ) ) ( not ( = ?auto_11574 ?auto_11587 ) ) ( not ( = ?auto_11574 ?auto_11583 ) ) ( not ( = ?auto_11574 ?auto_11593 ) ) ( not ( = ?auto_11594 ?auto_11585 ) ) ( not ( = ?auto_11594 ?auto_11587 ) ) ( not ( = ?auto_11594 ?auto_11583 ) ) ( not ( = ?auto_11594 ?auto_11593 ) ) ( not ( = ?auto_11569 ?auto_11575 ) ) ( not ( = ?auto_11569 ?auto_11590 ) ) ( not ( = ?auto_11570 ?auto_11575 ) ) ( not ( = ?auto_11570 ?auto_11590 ) ) ( not ( = ?auto_11571 ?auto_11575 ) ) ( not ( = ?auto_11571 ?auto_11590 ) ) ( not ( = ?auto_11572 ?auto_11575 ) ) ( not ( = ?auto_11572 ?auto_11590 ) ) ( not ( = ?auto_11573 ?auto_11575 ) ) ( not ( = ?auto_11573 ?auto_11590 ) ) ( not ( = ?auto_11575 ?auto_11594 ) ) ( not ( = ?auto_11575 ?auto_11585 ) ) ( not ( = ?auto_11575 ?auto_11587 ) ) ( not ( = ?auto_11575 ?auto_11583 ) ) ( not ( = ?auto_11575 ?auto_11593 ) ) ( not ( = ?auto_11590 ?auto_11594 ) ) ( not ( = ?auto_11590 ?auto_11585 ) ) ( not ( = ?auto_11590 ?auto_11587 ) ) ( not ( = ?auto_11590 ?auto_11583 ) ) ( not ( = ?auto_11590 ?auto_11593 ) ) ( not ( = ?auto_11569 ?auto_11576 ) ) ( not ( = ?auto_11569 ?auto_11582 ) ) ( not ( = ?auto_11570 ?auto_11576 ) ) ( not ( = ?auto_11570 ?auto_11582 ) ) ( not ( = ?auto_11571 ?auto_11576 ) ) ( not ( = ?auto_11571 ?auto_11582 ) ) ( not ( = ?auto_11572 ?auto_11576 ) ) ( not ( = ?auto_11572 ?auto_11582 ) ) ( not ( = ?auto_11573 ?auto_11576 ) ) ( not ( = ?auto_11573 ?auto_11582 ) ) ( not ( = ?auto_11574 ?auto_11576 ) ) ( not ( = ?auto_11574 ?auto_11582 ) ) ( not ( = ?auto_11576 ?auto_11590 ) ) ( not ( = ?auto_11576 ?auto_11594 ) ) ( not ( = ?auto_11576 ?auto_11585 ) ) ( not ( = ?auto_11576 ?auto_11587 ) ) ( not ( = ?auto_11576 ?auto_11583 ) ) ( not ( = ?auto_11576 ?auto_11593 ) ) ( not ( = ?auto_11578 ?auto_11592 ) ) ( not ( = ?auto_11578 ?auto_11589 ) ) ( not ( = ?auto_11578 ?auto_11586 ) ) ( not ( = ?auto_11578 ?auto_11588 ) ) ( not ( = ?auto_11581 ?auto_11591 ) ) ( not ( = ?auto_11581 ?auto_11584 ) ) ( not ( = ?auto_11581 ?auto_11595 ) ) ( not ( = ?auto_11581 ?auto_11596 ) ) ( not ( = ?auto_11582 ?auto_11590 ) ) ( not ( = ?auto_11582 ?auto_11594 ) ) ( not ( = ?auto_11582 ?auto_11585 ) ) ( not ( = ?auto_11582 ?auto_11587 ) ) ( not ( = ?auto_11582 ?auto_11583 ) ) ( not ( = ?auto_11582 ?auto_11593 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_11569 ?auto_11570 ?auto_11571 ?auto_11572 ?auto_11573 ?auto_11574 ?auto_11575 )
      ( MAKE-1CRATE ?auto_11575 ?auto_11576 )
      ( MAKE-7CRATE-VERIFY ?auto_11569 ?auto_11570 ?auto_11571 ?auto_11572 ?auto_11573 ?auto_11574 ?auto_11575 ?auto_11576 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11599 - SURFACE
      ?auto_11600 - SURFACE
    )
    :vars
    (
      ?auto_11601 - HOIST
      ?auto_11602 - PLACE
      ?auto_11604 - PLACE
      ?auto_11605 - HOIST
      ?auto_11606 - SURFACE
      ?auto_11603 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11601 ?auto_11602 ) ( SURFACE-AT ?auto_11599 ?auto_11602 ) ( CLEAR ?auto_11599 ) ( IS-CRATE ?auto_11600 ) ( AVAILABLE ?auto_11601 ) ( not ( = ?auto_11604 ?auto_11602 ) ) ( HOIST-AT ?auto_11605 ?auto_11604 ) ( AVAILABLE ?auto_11605 ) ( SURFACE-AT ?auto_11600 ?auto_11604 ) ( ON ?auto_11600 ?auto_11606 ) ( CLEAR ?auto_11600 ) ( TRUCK-AT ?auto_11603 ?auto_11602 ) ( not ( = ?auto_11599 ?auto_11600 ) ) ( not ( = ?auto_11599 ?auto_11606 ) ) ( not ( = ?auto_11600 ?auto_11606 ) ) ( not ( = ?auto_11601 ?auto_11605 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11603 ?auto_11602 ?auto_11604 )
      ( !LIFT ?auto_11605 ?auto_11600 ?auto_11606 ?auto_11604 )
      ( !LOAD ?auto_11605 ?auto_11600 ?auto_11603 ?auto_11604 )
      ( !DRIVE ?auto_11603 ?auto_11604 ?auto_11602 )
      ( !UNLOAD ?auto_11601 ?auto_11600 ?auto_11603 ?auto_11602 )
      ( !DROP ?auto_11601 ?auto_11600 ?auto_11599 ?auto_11602 )
      ( MAKE-1CRATE-VERIFY ?auto_11599 ?auto_11600 ) )
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
      ?auto_11624 - SURFACE
      ?auto_11623 - SURFACE
    )
    :vars
    (
      ?auto_11625 - HOIST
      ?auto_11626 - PLACE
      ?auto_11629 - PLACE
      ?auto_11627 - HOIST
      ?auto_11628 - SURFACE
      ?auto_11642 - PLACE
      ?auto_11644 - HOIST
      ?auto_11643 - SURFACE
      ?auto_11632 - PLACE
      ?auto_11645 - HOIST
      ?auto_11636 - SURFACE
      ?auto_11633 - SURFACE
      ?auto_11646 - SURFACE
      ?auto_11637 - PLACE
      ?auto_11640 - HOIST
      ?auto_11639 - SURFACE
      ?auto_11641 - PLACE
      ?auto_11634 - HOIST
      ?auto_11647 - SURFACE
      ?auto_11638 - PLACE
      ?auto_11635 - HOIST
      ?auto_11631 - SURFACE
      ?auto_11630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11625 ?auto_11626 ) ( IS-CRATE ?auto_11623 ) ( not ( = ?auto_11629 ?auto_11626 ) ) ( HOIST-AT ?auto_11627 ?auto_11629 ) ( AVAILABLE ?auto_11627 ) ( SURFACE-AT ?auto_11623 ?auto_11629 ) ( ON ?auto_11623 ?auto_11628 ) ( CLEAR ?auto_11623 ) ( not ( = ?auto_11624 ?auto_11623 ) ) ( not ( = ?auto_11624 ?auto_11628 ) ) ( not ( = ?auto_11623 ?auto_11628 ) ) ( not ( = ?auto_11625 ?auto_11627 ) ) ( IS-CRATE ?auto_11624 ) ( not ( = ?auto_11642 ?auto_11626 ) ) ( HOIST-AT ?auto_11644 ?auto_11642 ) ( AVAILABLE ?auto_11644 ) ( SURFACE-AT ?auto_11624 ?auto_11642 ) ( ON ?auto_11624 ?auto_11643 ) ( CLEAR ?auto_11624 ) ( not ( = ?auto_11622 ?auto_11624 ) ) ( not ( = ?auto_11622 ?auto_11643 ) ) ( not ( = ?auto_11624 ?auto_11643 ) ) ( not ( = ?auto_11625 ?auto_11644 ) ) ( IS-CRATE ?auto_11622 ) ( not ( = ?auto_11632 ?auto_11626 ) ) ( HOIST-AT ?auto_11645 ?auto_11632 ) ( SURFACE-AT ?auto_11622 ?auto_11632 ) ( ON ?auto_11622 ?auto_11636 ) ( CLEAR ?auto_11622 ) ( not ( = ?auto_11621 ?auto_11622 ) ) ( not ( = ?auto_11621 ?auto_11636 ) ) ( not ( = ?auto_11622 ?auto_11636 ) ) ( not ( = ?auto_11625 ?auto_11645 ) ) ( IS-CRATE ?auto_11621 ) ( SURFACE-AT ?auto_11621 ?auto_11632 ) ( ON ?auto_11621 ?auto_11633 ) ( CLEAR ?auto_11621 ) ( not ( = ?auto_11620 ?auto_11621 ) ) ( not ( = ?auto_11620 ?auto_11633 ) ) ( not ( = ?auto_11621 ?auto_11633 ) ) ( IS-CRATE ?auto_11620 ) ( AVAILABLE ?auto_11645 ) ( SURFACE-AT ?auto_11620 ?auto_11632 ) ( ON ?auto_11620 ?auto_11646 ) ( CLEAR ?auto_11620 ) ( not ( = ?auto_11619 ?auto_11620 ) ) ( not ( = ?auto_11619 ?auto_11646 ) ) ( not ( = ?auto_11620 ?auto_11646 ) ) ( IS-CRATE ?auto_11619 ) ( not ( = ?auto_11637 ?auto_11626 ) ) ( HOIST-AT ?auto_11640 ?auto_11637 ) ( AVAILABLE ?auto_11640 ) ( SURFACE-AT ?auto_11619 ?auto_11637 ) ( ON ?auto_11619 ?auto_11639 ) ( CLEAR ?auto_11619 ) ( not ( = ?auto_11618 ?auto_11619 ) ) ( not ( = ?auto_11618 ?auto_11639 ) ) ( not ( = ?auto_11619 ?auto_11639 ) ) ( not ( = ?auto_11625 ?auto_11640 ) ) ( IS-CRATE ?auto_11618 ) ( not ( = ?auto_11641 ?auto_11626 ) ) ( HOIST-AT ?auto_11634 ?auto_11641 ) ( AVAILABLE ?auto_11634 ) ( SURFACE-AT ?auto_11618 ?auto_11641 ) ( ON ?auto_11618 ?auto_11647 ) ( CLEAR ?auto_11618 ) ( not ( = ?auto_11617 ?auto_11618 ) ) ( not ( = ?auto_11617 ?auto_11647 ) ) ( not ( = ?auto_11618 ?auto_11647 ) ) ( not ( = ?auto_11625 ?auto_11634 ) ) ( SURFACE-AT ?auto_11616 ?auto_11626 ) ( CLEAR ?auto_11616 ) ( IS-CRATE ?auto_11617 ) ( AVAILABLE ?auto_11625 ) ( not ( = ?auto_11638 ?auto_11626 ) ) ( HOIST-AT ?auto_11635 ?auto_11638 ) ( AVAILABLE ?auto_11635 ) ( SURFACE-AT ?auto_11617 ?auto_11638 ) ( ON ?auto_11617 ?auto_11631 ) ( CLEAR ?auto_11617 ) ( TRUCK-AT ?auto_11630 ?auto_11626 ) ( not ( = ?auto_11616 ?auto_11617 ) ) ( not ( = ?auto_11616 ?auto_11631 ) ) ( not ( = ?auto_11617 ?auto_11631 ) ) ( not ( = ?auto_11625 ?auto_11635 ) ) ( not ( = ?auto_11616 ?auto_11618 ) ) ( not ( = ?auto_11616 ?auto_11647 ) ) ( not ( = ?auto_11618 ?auto_11631 ) ) ( not ( = ?auto_11641 ?auto_11638 ) ) ( not ( = ?auto_11634 ?auto_11635 ) ) ( not ( = ?auto_11647 ?auto_11631 ) ) ( not ( = ?auto_11616 ?auto_11619 ) ) ( not ( = ?auto_11616 ?auto_11639 ) ) ( not ( = ?auto_11617 ?auto_11619 ) ) ( not ( = ?auto_11617 ?auto_11639 ) ) ( not ( = ?auto_11619 ?auto_11647 ) ) ( not ( = ?auto_11619 ?auto_11631 ) ) ( not ( = ?auto_11637 ?auto_11641 ) ) ( not ( = ?auto_11637 ?auto_11638 ) ) ( not ( = ?auto_11640 ?auto_11634 ) ) ( not ( = ?auto_11640 ?auto_11635 ) ) ( not ( = ?auto_11639 ?auto_11647 ) ) ( not ( = ?auto_11639 ?auto_11631 ) ) ( not ( = ?auto_11616 ?auto_11620 ) ) ( not ( = ?auto_11616 ?auto_11646 ) ) ( not ( = ?auto_11617 ?auto_11620 ) ) ( not ( = ?auto_11617 ?auto_11646 ) ) ( not ( = ?auto_11618 ?auto_11620 ) ) ( not ( = ?auto_11618 ?auto_11646 ) ) ( not ( = ?auto_11620 ?auto_11639 ) ) ( not ( = ?auto_11620 ?auto_11647 ) ) ( not ( = ?auto_11620 ?auto_11631 ) ) ( not ( = ?auto_11632 ?auto_11637 ) ) ( not ( = ?auto_11632 ?auto_11641 ) ) ( not ( = ?auto_11632 ?auto_11638 ) ) ( not ( = ?auto_11645 ?auto_11640 ) ) ( not ( = ?auto_11645 ?auto_11634 ) ) ( not ( = ?auto_11645 ?auto_11635 ) ) ( not ( = ?auto_11646 ?auto_11639 ) ) ( not ( = ?auto_11646 ?auto_11647 ) ) ( not ( = ?auto_11646 ?auto_11631 ) ) ( not ( = ?auto_11616 ?auto_11621 ) ) ( not ( = ?auto_11616 ?auto_11633 ) ) ( not ( = ?auto_11617 ?auto_11621 ) ) ( not ( = ?auto_11617 ?auto_11633 ) ) ( not ( = ?auto_11618 ?auto_11621 ) ) ( not ( = ?auto_11618 ?auto_11633 ) ) ( not ( = ?auto_11619 ?auto_11621 ) ) ( not ( = ?auto_11619 ?auto_11633 ) ) ( not ( = ?auto_11621 ?auto_11646 ) ) ( not ( = ?auto_11621 ?auto_11639 ) ) ( not ( = ?auto_11621 ?auto_11647 ) ) ( not ( = ?auto_11621 ?auto_11631 ) ) ( not ( = ?auto_11633 ?auto_11646 ) ) ( not ( = ?auto_11633 ?auto_11639 ) ) ( not ( = ?auto_11633 ?auto_11647 ) ) ( not ( = ?auto_11633 ?auto_11631 ) ) ( not ( = ?auto_11616 ?auto_11622 ) ) ( not ( = ?auto_11616 ?auto_11636 ) ) ( not ( = ?auto_11617 ?auto_11622 ) ) ( not ( = ?auto_11617 ?auto_11636 ) ) ( not ( = ?auto_11618 ?auto_11622 ) ) ( not ( = ?auto_11618 ?auto_11636 ) ) ( not ( = ?auto_11619 ?auto_11622 ) ) ( not ( = ?auto_11619 ?auto_11636 ) ) ( not ( = ?auto_11620 ?auto_11622 ) ) ( not ( = ?auto_11620 ?auto_11636 ) ) ( not ( = ?auto_11622 ?auto_11633 ) ) ( not ( = ?auto_11622 ?auto_11646 ) ) ( not ( = ?auto_11622 ?auto_11639 ) ) ( not ( = ?auto_11622 ?auto_11647 ) ) ( not ( = ?auto_11622 ?auto_11631 ) ) ( not ( = ?auto_11636 ?auto_11633 ) ) ( not ( = ?auto_11636 ?auto_11646 ) ) ( not ( = ?auto_11636 ?auto_11639 ) ) ( not ( = ?auto_11636 ?auto_11647 ) ) ( not ( = ?auto_11636 ?auto_11631 ) ) ( not ( = ?auto_11616 ?auto_11624 ) ) ( not ( = ?auto_11616 ?auto_11643 ) ) ( not ( = ?auto_11617 ?auto_11624 ) ) ( not ( = ?auto_11617 ?auto_11643 ) ) ( not ( = ?auto_11618 ?auto_11624 ) ) ( not ( = ?auto_11618 ?auto_11643 ) ) ( not ( = ?auto_11619 ?auto_11624 ) ) ( not ( = ?auto_11619 ?auto_11643 ) ) ( not ( = ?auto_11620 ?auto_11624 ) ) ( not ( = ?auto_11620 ?auto_11643 ) ) ( not ( = ?auto_11621 ?auto_11624 ) ) ( not ( = ?auto_11621 ?auto_11643 ) ) ( not ( = ?auto_11624 ?auto_11636 ) ) ( not ( = ?auto_11624 ?auto_11633 ) ) ( not ( = ?auto_11624 ?auto_11646 ) ) ( not ( = ?auto_11624 ?auto_11639 ) ) ( not ( = ?auto_11624 ?auto_11647 ) ) ( not ( = ?auto_11624 ?auto_11631 ) ) ( not ( = ?auto_11642 ?auto_11632 ) ) ( not ( = ?auto_11642 ?auto_11637 ) ) ( not ( = ?auto_11642 ?auto_11641 ) ) ( not ( = ?auto_11642 ?auto_11638 ) ) ( not ( = ?auto_11644 ?auto_11645 ) ) ( not ( = ?auto_11644 ?auto_11640 ) ) ( not ( = ?auto_11644 ?auto_11634 ) ) ( not ( = ?auto_11644 ?auto_11635 ) ) ( not ( = ?auto_11643 ?auto_11636 ) ) ( not ( = ?auto_11643 ?auto_11633 ) ) ( not ( = ?auto_11643 ?auto_11646 ) ) ( not ( = ?auto_11643 ?auto_11639 ) ) ( not ( = ?auto_11643 ?auto_11647 ) ) ( not ( = ?auto_11643 ?auto_11631 ) ) ( not ( = ?auto_11616 ?auto_11623 ) ) ( not ( = ?auto_11616 ?auto_11628 ) ) ( not ( = ?auto_11617 ?auto_11623 ) ) ( not ( = ?auto_11617 ?auto_11628 ) ) ( not ( = ?auto_11618 ?auto_11623 ) ) ( not ( = ?auto_11618 ?auto_11628 ) ) ( not ( = ?auto_11619 ?auto_11623 ) ) ( not ( = ?auto_11619 ?auto_11628 ) ) ( not ( = ?auto_11620 ?auto_11623 ) ) ( not ( = ?auto_11620 ?auto_11628 ) ) ( not ( = ?auto_11621 ?auto_11623 ) ) ( not ( = ?auto_11621 ?auto_11628 ) ) ( not ( = ?auto_11622 ?auto_11623 ) ) ( not ( = ?auto_11622 ?auto_11628 ) ) ( not ( = ?auto_11623 ?auto_11643 ) ) ( not ( = ?auto_11623 ?auto_11636 ) ) ( not ( = ?auto_11623 ?auto_11633 ) ) ( not ( = ?auto_11623 ?auto_11646 ) ) ( not ( = ?auto_11623 ?auto_11639 ) ) ( not ( = ?auto_11623 ?auto_11647 ) ) ( not ( = ?auto_11623 ?auto_11631 ) ) ( not ( = ?auto_11629 ?auto_11642 ) ) ( not ( = ?auto_11629 ?auto_11632 ) ) ( not ( = ?auto_11629 ?auto_11637 ) ) ( not ( = ?auto_11629 ?auto_11641 ) ) ( not ( = ?auto_11629 ?auto_11638 ) ) ( not ( = ?auto_11627 ?auto_11644 ) ) ( not ( = ?auto_11627 ?auto_11645 ) ) ( not ( = ?auto_11627 ?auto_11640 ) ) ( not ( = ?auto_11627 ?auto_11634 ) ) ( not ( = ?auto_11627 ?auto_11635 ) ) ( not ( = ?auto_11628 ?auto_11643 ) ) ( not ( = ?auto_11628 ?auto_11636 ) ) ( not ( = ?auto_11628 ?auto_11633 ) ) ( not ( = ?auto_11628 ?auto_11646 ) ) ( not ( = ?auto_11628 ?auto_11639 ) ) ( not ( = ?auto_11628 ?auto_11647 ) ) ( not ( = ?auto_11628 ?auto_11631 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_11616 ?auto_11617 ?auto_11618 ?auto_11619 ?auto_11620 ?auto_11621 ?auto_11622 ?auto_11624 )
      ( MAKE-1CRATE ?auto_11624 ?auto_11623 )
      ( MAKE-8CRATE-VERIFY ?auto_11616 ?auto_11617 ?auto_11618 ?auto_11619 ?auto_11620 ?auto_11621 ?auto_11622 ?auto_11624 ?auto_11623 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11650 - SURFACE
      ?auto_11651 - SURFACE
    )
    :vars
    (
      ?auto_11652 - HOIST
      ?auto_11653 - PLACE
      ?auto_11655 - PLACE
      ?auto_11656 - HOIST
      ?auto_11657 - SURFACE
      ?auto_11654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11652 ?auto_11653 ) ( SURFACE-AT ?auto_11650 ?auto_11653 ) ( CLEAR ?auto_11650 ) ( IS-CRATE ?auto_11651 ) ( AVAILABLE ?auto_11652 ) ( not ( = ?auto_11655 ?auto_11653 ) ) ( HOIST-AT ?auto_11656 ?auto_11655 ) ( AVAILABLE ?auto_11656 ) ( SURFACE-AT ?auto_11651 ?auto_11655 ) ( ON ?auto_11651 ?auto_11657 ) ( CLEAR ?auto_11651 ) ( TRUCK-AT ?auto_11654 ?auto_11653 ) ( not ( = ?auto_11650 ?auto_11651 ) ) ( not ( = ?auto_11650 ?auto_11657 ) ) ( not ( = ?auto_11651 ?auto_11657 ) ) ( not ( = ?auto_11652 ?auto_11656 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11654 ?auto_11653 ?auto_11655 )
      ( !LIFT ?auto_11656 ?auto_11651 ?auto_11657 ?auto_11655 )
      ( !LOAD ?auto_11656 ?auto_11651 ?auto_11654 ?auto_11655 )
      ( !DRIVE ?auto_11654 ?auto_11655 ?auto_11653 )
      ( !UNLOAD ?auto_11652 ?auto_11651 ?auto_11654 ?auto_11653 )
      ( !DROP ?auto_11652 ?auto_11651 ?auto_11650 ?auto_11653 )
      ( MAKE-1CRATE-VERIFY ?auto_11650 ?auto_11651 ) )
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
      ?auto_11677 - SURFACE
      ?auto_11676 - SURFACE
      ?auto_11675 - SURFACE
    )
    :vars
    (
      ?auto_11678 - HOIST
      ?auto_11680 - PLACE
      ?auto_11681 - PLACE
      ?auto_11682 - HOIST
      ?auto_11679 - SURFACE
      ?auto_11684 - PLACE
      ?auto_11685 - HOIST
      ?auto_11701 - SURFACE
      ?auto_11695 - PLACE
      ?auto_11697 - HOIST
      ?auto_11696 - SURFACE
      ?auto_11688 - PLACE
      ?auto_11687 - HOIST
      ?auto_11699 - SURFACE
      ?auto_11689 - SURFACE
      ?auto_11692 - SURFACE
      ?auto_11693 - SURFACE
      ?auto_11694 - PLACE
      ?auto_11686 - HOIST
      ?auto_11691 - SURFACE
      ?auto_11698 - PLACE
      ?auto_11700 - HOIST
      ?auto_11690 - SURFACE
      ?auto_11683 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11678 ?auto_11680 ) ( IS-CRATE ?auto_11675 ) ( not ( = ?auto_11681 ?auto_11680 ) ) ( HOIST-AT ?auto_11682 ?auto_11681 ) ( SURFACE-AT ?auto_11675 ?auto_11681 ) ( ON ?auto_11675 ?auto_11679 ) ( CLEAR ?auto_11675 ) ( not ( = ?auto_11676 ?auto_11675 ) ) ( not ( = ?auto_11676 ?auto_11679 ) ) ( not ( = ?auto_11675 ?auto_11679 ) ) ( not ( = ?auto_11678 ?auto_11682 ) ) ( IS-CRATE ?auto_11676 ) ( not ( = ?auto_11684 ?auto_11680 ) ) ( HOIST-AT ?auto_11685 ?auto_11684 ) ( AVAILABLE ?auto_11685 ) ( SURFACE-AT ?auto_11676 ?auto_11684 ) ( ON ?auto_11676 ?auto_11701 ) ( CLEAR ?auto_11676 ) ( not ( = ?auto_11677 ?auto_11676 ) ) ( not ( = ?auto_11677 ?auto_11701 ) ) ( not ( = ?auto_11676 ?auto_11701 ) ) ( not ( = ?auto_11678 ?auto_11685 ) ) ( IS-CRATE ?auto_11677 ) ( not ( = ?auto_11695 ?auto_11680 ) ) ( HOIST-AT ?auto_11697 ?auto_11695 ) ( AVAILABLE ?auto_11697 ) ( SURFACE-AT ?auto_11677 ?auto_11695 ) ( ON ?auto_11677 ?auto_11696 ) ( CLEAR ?auto_11677 ) ( not ( = ?auto_11674 ?auto_11677 ) ) ( not ( = ?auto_11674 ?auto_11696 ) ) ( not ( = ?auto_11677 ?auto_11696 ) ) ( not ( = ?auto_11678 ?auto_11697 ) ) ( IS-CRATE ?auto_11674 ) ( not ( = ?auto_11688 ?auto_11680 ) ) ( HOIST-AT ?auto_11687 ?auto_11688 ) ( SURFACE-AT ?auto_11674 ?auto_11688 ) ( ON ?auto_11674 ?auto_11699 ) ( CLEAR ?auto_11674 ) ( not ( = ?auto_11673 ?auto_11674 ) ) ( not ( = ?auto_11673 ?auto_11699 ) ) ( not ( = ?auto_11674 ?auto_11699 ) ) ( not ( = ?auto_11678 ?auto_11687 ) ) ( IS-CRATE ?auto_11673 ) ( SURFACE-AT ?auto_11673 ?auto_11688 ) ( ON ?auto_11673 ?auto_11689 ) ( CLEAR ?auto_11673 ) ( not ( = ?auto_11672 ?auto_11673 ) ) ( not ( = ?auto_11672 ?auto_11689 ) ) ( not ( = ?auto_11673 ?auto_11689 ) ) ( IS-CRATE ?auto_11672 ) ( AVAILABLE ?auto_11687 ) ( SURFACE-AT ?auto_11672 ?auto_11688 ) ( ON ?auto_11672 ?auto_11692 ) ( CLEAR ?auto_11672 ) ( not ( = ?auto_11671 ?auto_11672 ) ) ( not ( = ?auto_11671 ?auto_11692 ) ) ( not ( = ?auto_11672 ?auto_11692 ) ) ( IS-CRATE ?auto_11671 ) ( AVAILABLE ?auto_11682 ) ( SURFACE-AT ?auto_11671 ?auto_11681 ) ( ON ?auto_11671 ?auto_11693 ) ( CLEAR ?auto_11671 ) ( not ( = ?auto_11670 ?auto_11671 ) ) ( not ( = ?auto_11670 ?auto_11693 ) ) ( not ( = ?auto_11671 ?auto_11693 ) ) ( IS-CRATE ?auto_11670 ) ( not ( = ?auto_11694 ?auto_11680 ) ) ( HOIST-AT ?auto_11686 ?auto_11694 ) ( AVAILABLE ?auto_11686 ) ( SURFACE-AT ?auto_11670 ?auto_11694 ) ( ON ?auto_11670 ?auto_11691 ) ( CLEAR ?auto_11670 ) ( not ( = ?auto_11669 ?auto_11670 ) ) ( not ( = ?auto_11669 ?auto_11691 ) ) ( not ( = ?auto_11670 ?auto_11691 ) ) ( not ( = ?auto_11678 ?auto_11686 ) ) ( SURFACE-AT ?auto_11668 ?auto_11680 ) ( CLEAR ?auto_11668 ) ( IS-CRATE ?auto_11669 ) ( AVAILABLE ?auto_11678 ) ( not ( = ?auto_11698 ?auto_11680 ) ) ( HOIST-AT ?auto_11700 ?auto_11698 ) ( AVAILABLE ?auto_11700 ) ( SURFACE-AT ?auto_11669 ?auto_11698 ) ( ON ?auto_11669 ?auto_11690 ) ( CLEAR ?auto_11669 ) ( TRUCK-AT ?auto_11683 ?auto_11680 ) ( not ( = ?auto_11668 ?auto_11669 ) ) ( not ( = ?auto_11668 ?auto_11690 ) ) ( not ( = ?auto_11669 ?auto_11690 ) ) ( not ( = ?auto_11678 ?auto_11700 ) ) ( not ( = ?auto_11668 ?auto_11670 ) ) ( not ( = ?auto_11668 ?auto_11691 ) ) ( not ( = ?auto_11670 ?auto_11690 ) ) ( not ( = ?auto_11694 ?auto_11698 ) ) ( not ( = ?auto_11686 ?auto_11700 ) ) ( not ( = ?auto_11691 ?auto_11690 ) ) ( not ( = ?auto_11668 ?auto_11671 ) ) ( not ( = ?auto_11668 ?auto_11693 ) ) ( not ( = ?auto_11669 ?auto_11671 ) ) ( not ( = ?auto_11669 ?auto_11693 ) ) ( not ( = ?auto_11671 ?auto_11691 ) ) ( not ( = ?auto_11671 ?auto_11690 ) ) ( not ( = ?auto_11681 ?auto_11694 ) ) ( not ( = ?auto_11681 ?auto_11698 ) ) ( not ( = ?auto_11682 ?auto_11686 ) ) ( not ( = ?auto_11682 ?auto_11700 ) ) ( not ( = ?auto_11693 ?auto_11691 ) ) ( not ( = ?auto_11693 ?auto_11690 ) ) ( not ( = ?auto_11668 ?auto_11672 ) ) ( not ( = ?auto_11668 ?auto_11692 ) ) ( not ( = ?auto_11669 ?auto_11672 ) ) ( not ( = ?auto_11669 ?auto_11692 ) ) ( not ( = ?auto_11670 ?auto_11672 ) ) ( not ( = ?auto_11670 ?auto_11692 ) ) ( not ( = ?auto_11672 ?auto_11693 ) ) ( not ( = ?auto_11672 ?auto_11691 ) ) ( not ( = ?auto_11672 ?auto_11690 ) ) ( not ( = ?auto_11688 ?auto_11681 ) ) ( not ( = ?auto_11688 ?auto_11694 ) ) ( not ( = ?auto_11688 ?auto_11698 ) ) ( not ( = ?auto_11687 ?auto_11682 ) ) ( not ( = ?auto_11687 ?auto_11686 ) ) ( not ( = ?auto_11687 ?auto_11700 ) ) ( not ( = ?auto_11692 ?auto_11693 ) ) ( not ( = ?auto_11692 ?auto_11691 ) ) ( not ( = ?auto_11692 ?auto_11690 ) ) ( not ( = ?auto_11668 ?auto_11673 ) ) ( not ( = ?auto_11668 ?auto_11689 ) ) ( not ( = ?auto_11669 ?auto_11673 ) ) ( not ( = ?auto_11669 ?auto_11689 ) ) ( not ( = ?auto_11670 ?auto_11673 ) ) ( not ( = ?auto_11670 ?auto_11689 ) ) ( not ( = ?auto_11671 ?auto_11673 ) ) ( not ( = ?auto_11671 ?auto_11689 ) ) ( not ( = ?auto_11673 ?auto_11692 ) ) ( not ( = ?auto_11673 ?auto_11693 ) ) ( not ( = ?auto_11673 ?auto_11691 ) ) ( not ( = ?auto_11673 ?auto_11690 ) ) ( not ( = ?auto_11689 ?auto_11692 ) ) ( not ( = ?auto_11689 ?auto_11693 ) ) ( not ( = ?auto_11689 ?auto_11691 ) ) ( not ( = ?auto_11689 ?auto_11690 ) ) ( not ( = ?auto_11668 ?auto_11674 ) ) ( not ( = ?auto_11668 ?auto_11699 ) ) ( not ( = ?auto_11669 ?auto_11674 ) ) ( not ( = ?auto_11669 ?auto_11699 ) ) ( not ( = ?auto_11670 ?auto_11674 ) ) ( not ( = ?auto_11670 ?auto_11699 ) ) ( not ( = ?auto_11671 ?auto_11674 ) ) ( not ( = ?auto_11671 ?auto_11699 ) ) ( not ( = ?auto_11672 ?auto_11674 ) ) ( not ( = ?auto_11672 ?auto_11699 ) ) ( not ( = ?auto_11674 ?auto_11689 ) ) ( not ( = ?auto_11674 ?auto_11692 ) ) ( not ( = ?auto_11674 ?auto_11693 ) ) ( not ( = ?auto_11674 ?auto_11691 ) ) ( not ( = ?auto_11674 ?auto_11690 ) ) ( not ( = ?auto_11699 ?auto_11689 ) ) ( not ( = ?auto_11699 ?auto_11692 ) ) ( not ( = ?auto_11699 ?auto_11693 ) ) ( not ( = ?auto_11699 ?auto_11691 ) ) ( not ( = ?auto_11699 ?auto_11690 ) ) ( not ( = ?auto_11668 ?auto_11677 ) ) ( not ( = ?auto_11668 ?auto_11696 ) ) ( not ( = ?auto_11669 ?auto_11677 ) ) ( not ( = ?auto_11669 ?auto_11696 ) ) ( not ( = ?auto_11670 ?auto_11677 ) ) ( not ( = ?auto_11670 ?auto_11696 ) ) ( not ( = ?auto_11671 ?auto_11677 ) ) ( not ( = ?auto_11671 ?auto_11696 ) ) ( not ( = ?auto_11672 ?auto_11677 ) ) ( not ( = ?auto_11672 ?auto_11696 ) ) ( not ( = ?auto_11673 ?auto_11677 ) ) ( not ( = ?auto_11673 ?auto_11696 ) ) ( not ( = ?auto_11677 ?auto_11699 ) ) ( not ( = ?auto_11677 ?auto_11689 ) ) ( not ( = ?auto_11677 ?auto_11692 ) ) ( not ( = ?auto_11677 ?auto_11693 ) ) ( not ( = ?auto_11677 ?auto_11691 ) ) ( not ( = ?auto_11677 ?auto_11690 ) ) ( not ( = ?auto_11695 ?auto_11688 ) ) ( not ( = ?auto_11695 ?auto_11681 ) ) ( not ( = ?auto_11695 ?auto_11694 ) ) ( not ( = ?auto_11695 ?auto_11698 ) ) ( not ( = ?auto_11697 ?auto_11687 ) ) ( not ( = ?auto_11697 ?auto_11682 ) ) ( not ( = ?auto_11697 ?auto_11686 ) ) ( not ( = ?auto_11697 ?auto_11700 ) ) ( not ( = ?auto_11696 ?auto_11699 ) ) ( not ( = ?auto_11696 ?auto_11689 ) ) ( not ( = ?auto_11696 ?auto_11692 ) ) ( not ( = ?auto_11696 ?auto_11693 ) ) ( not ( = ?auto_11696 ?auto_11691 ) ) ( not ( = ?auto_11696 ?auto_11690 ) ) ( not ( = ?auto_11668 ?auto_11676 ) ) ( not ( = ?auto_11668 ?auto_11701 ) ) ( not ( = ?auto_11669 ?auto_11676 ) ) ( not ( = ?auto_11669 ?auto_11701 ) ) ( not ( = ?auto_11670 ?auto_11676 ) ) ( not ( = ?auto_11670 ?auto_11701 ) ) ( not ( = ?auto_11671 ?auto_11676 ) ) ( not ( = ?auto_11671 ?auto_11701 ) ) ( not ( = ?auto_11672 ?auto_11676 ) ) ( not ( = ?auto_11672 ?auto_11701 ) ) ( not ( = ?auto_11673 ?auto_11676 ) ) ( not ( = ?auto_11673 ?auto_11701 ) ) ( not ( = ?auto_11674 ?auto_11676 ) ) ( not ( = ?auto_11674 ?auto_11701 ) ) ( not ( = ?auto_11676 ?auto_11696 ) ) ( not ( = ?auto_11676 ?auto_11699 ) ) ( not ( = ?auto_11676 ?auto_11689 ) ) ( not ( = ?auto_11676 ?auto_11692 ) ) ( not ( = ?auto_11676 ?auto_11693 ) ) ( not ( = ?auto_11676 ?auto_11691 ) ) ( not ( = ?auto_11676 ?auto_11690 ) ) ( not ( = ?auto_11684 ?auto_11695 ) ) ( not ( = ?auto_11684 ?auto_11688 ) ) ( not ( = ?auto_11684 ?auto_11681 ) ) ( not ( = ?auto_11684 ?auto_11694 ) ) ( not ( = ?auto_11684 ?auto_11698 ) ) ( not ( = ?auto_11685 ?auto_11697 ) ) ( not ( = ?auto_11685 ?auto_11687 ) ) ( not ( = ?auto_11685 ?auto_11682 ) ) ( not ( = ?auto_11685 ?auto_11686 ) ) ( not ( = ?auto_11685 ?auto_11700 ) ) ( not ( = ?auto_11701 ?auto_11696 ) ) ( not ( = ?auto_11701 ?auto_11699 ) ) ( not ( = ?auto_11701 ?auto_11689 ) ) ( not ( = ?auto_11701 ?auto_11692 ) ) ( not ( = ?auto_11701 ?auto_11693 ) ) ( not ( = ?auto_11701 ?auto_11691 ) ) ( not ( = ?auto_11701 ?auto_11690 ) ) ( not ( = ?auto_11668 ?auto_11675 ) ) ( not ( = ?auto_11668 ?auto_11679 ) ) ( not ( = ?auto_11669 ?auto_11675 ) ) ( not ( = ?auto_11669 ?auto_11679 ) ) ( not ( = ?auto_11670 ?auto_11675 ) ) ( not ( = ?auto_11670 ?auto_11679 ) ) ( not ( = ?auto_11671 ?auto_11675 ) ) ( not ( = ?auto_11671 ?auto_11679 ) ) ( not ( = ?auto_11672 ?auto_11675 ) ) ( not ( = ?auto_11672 ?auto_11679 ) ) ( not ( = ?auto_11673 ?auto_11675 ) ) ( not ( = ?auto_11673 ?auto_11679 ) ) ( not ( = ?auto_11674 ?auto_11675 ) ) ( not ( = ?auto_11674 ?auto_11679 ) ) ( not ( = ?auto_11677 ?auto_11675 ) ) ( not ( = ?auto_11677 ?auto_11679 ) ) ( not ( = ?auto_11675 ?auto_11701 ) ) ( not ( = ?auto_11675 ?auto_11696 ) ) ( not ( = ?auto_11675 ?auto_11699 ) ) ( not ( = ?auto_11675 ?auto_11689 ) ) ( not ( = ?auto_11675 ?auto_11692 ) ) ( not ( = ?auto_11675 ?auto_11693 ) ) ( not ( = ?auto_11675 ?auto_11691 ) ) ( not ( = ?auto_11675 ?auto_11690 ) ) ( not ( = ?auto_11679 ?auto_11701 ) ) ( not ( = ?auto_11679 ?auto_11696 ) ) ( not ( = ?auto_11679 ?auto_11699 ) ) ( not ( = ?auto_11679 ?auto_11689 ) ) ( not ( = ?auto_11679 ?auto_11692 ) ) ( not ( = ?auto_11679 ?auto_11693 ) ) ( not ( = ?auto_11679 ?auto_11691 ) ) ( not ( = ?auto_11679 ?auto_11690 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_11668 ?auto_11669 ?auto_11670 ?auto_11671 ?auto_11672 ?auto_11673 ?auto_11674 ?auto_11677 ?auto_11676 )
      ( MAKE-1CRATE ?auto_11676 ?auto_11675 )
      ( MAKE-9CRATE-VERIFY ?auto_11668 ?auto_11669 ?auto_11670 ?auto_11671 ?auto_11672 ?auto_11673 ?auto_11674 ?auto_11677 ?auto_11676 ?auto_11675 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11704 - SURFACE
      ?auto_11705 - SURFACE
    )
    :vars
    (
      ?auto_11706 - HOIST
      ?auto_11707 - PLACE
      ?auto_11709 - PLACE
      ?auto_11710 - HOIST
      ?auto_11711 - SURFACE
      ?auto_11708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11706 ?auto_11707 ) ( SURFACE-AT ?auto_11704 ?auto_11707 ) ( CLEAR ?auto_11704 ) ( IS-CRATE ?auto_11705 ) ( AVAILABLE ?auto_11706 ) ( not ( = ?auto_11709 ?auto_11707 ) ) ( HOIST-AT ?auto_11710 ?auto_11709 ) ( AVAILABLE ?auto_11710 ) ( SURFACE-AT ?auto_11705 ?auto_11709 ) ( ON ?auto_11705 ?auto_11711 ) ( CLEAR ?auto_11705 ) ( TRUCK-AT ?auto_11708 ?auto_11707 ) ( not ( = ?auto_11704 ?auto_11705 ) ) ( not ( = ?auto_11704 ?auto_11711 ) ) ( not ( = ?auto_11705 ?auto_11711 ) ) ( not ( = ?auto_11706 ?auto_11710 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11708 ?auto_11707 ?auto_11709 )
      ( !LIFT ?auto_11710 ?auto_11705 ?auto_11711 ?auto_11709 )
      ( !LOAD ?auto_11710 ?auto_11705 ?auto_11708 ?auto_11709 )
      ( !DRIVE ?auto_11708 ?auto_11709 ?auto_11707 )
      ( !UNLOAD ?auto_11706 ?auto_11705 ?auto_11708 ?auto_11707 )
      ( !DROP ?auto_11706 ?auto_11705 ?auto_11704 ?auto_11707 )
      ( MAKE-1CRATE-VERIFY ?auto_11704 ?auto_11705 ) )
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
      ?auto_11732 - SURFACE
      ?auto_11731 - SURFACE
      ?auto_11730 - SURFACE
      ?auto_11733 - SURFACE
    )
    :vars
    (
      ?auto_11736 - HOIST
      ?auto_11739 - PLACE
      ?auto_11734 - PLACE
      ?auto_11735 - HOIST
      ?auto_11737 - SURFACE
      ?auto_11754 - PLACE
      ?auto_11740 - HOIST
      ?auto_11743 - SURFACE
      ?auto_11741 - PLACE
      ?auto_11742 - HOIST
      ?auto_11751 - SURFACE
      ?auto_11760 - PLACE
      ?auto_11749 - HOIST
      ?auto_11758 - SURFACE
      ?auto_11757 - PLACE
      ?auto_11752 - HOIST
      ?auto_11759 - SURFACE
      ?auto_11756 - SURFACE
      ?auto_11747 - SURFACE
      ?auto_11748 - SURFACE
      ?auto_11746 - PLACE
      ?auto_11745 - HOIST
      ?auto_11750 - SURFACE
      ?auto_11753 - PLACE
      ?auto_11744 - HOIST
      ?auto_11755 - SURFACE
      ?auto_11738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11736 ?auto_11739 ) ( IS-CRATE ?auto_11733 ) ( not ( = ?auto_11734 ?auto_11739 ) ) ( HOIST-AT ?auto_11735 ?auto_11734 ) ( AVAILABLE ?auto_11735 ) ( SURFACE-AT ?auto_11733 ?auto_11734 ) ( ON ?auto_11733 ?auto_11737 ) ( CLEAR ?auto_11733 ) ( not ( = ?auto_11730 ?auto_11733 ) ) ( not ( = ?auto_11730 ?auto_11737 ) ) ( not ( = ?auto_11733 ?auto_11737 ) ) ( not ( = ?auto_11736 ?auto_11735 ) ) ( IS-CRATE ?auto_11730 ) ( not ( = ?auto_11754 ?auto_11739 ) ) ( HOIST-AT ?auto_11740 ?auto_11754 ) ( SURFACE-AT ?auto_11730 ?auto_11754 ) ( ON ?auto_11730 ?auto_11743 ) ( CLEAR ?auto_11730 ) ( not ( = ?auto_11731 ?auto_11730 ) ) ( not ( = ?auto_11731 ?auto_11743 ) ) ( not ( = ?auto_11730 ?auto_11743 ) ) ( not ( = ?auto_11736 ?auto_11740 ) ) ( IS-CRATE ?auto_11731 ) ( not ( = ?auto_11741 ?auto_11739 ) ) ( HOIST-AT ?auto_11742 ?auto_11741 ) ( AVAILABLE ?auto_11742 ) ( SURFACE-AT ?auto_11731 ?auto_11741 ) ( ON ?auto_11731 ?auto_11751 ) ( CLEAR ?auto_11731 ) ( not ( = ?auto_11732 ?auto_11731 ) ) ( not ( = ?auto_11732 ?auto_11751 ) ) ( not ( = ?auto_11731 ?auto_11751 ) ) ( not ( = ?auto_11736 ?auto_11742 ) ) ( IS-CRATE ?auto_11732 ) ( not ( = ?auto_11760 ?auto_11739 ) ) ( HOIST-AT ?auto_11749 ?auto_11760 ) ( AVAILABLE ?auto_11749 ) ( SURFACE-AT ?auto_11732 ?auto_11760 ) ( ON ?auto_11732 ?auto_11758 ) ( CLEAR ?auto_11732 ) ( not ( = ?auto_11729 ?auto_11732 ) ) ( not ( = ?auto_11729 ?auto_11758 ) ) ( not ( = ?auto_11732 ?auto_11758 ) ) ( not ( = ?auto_11736 ?auto_11749 ) ) ( IS-CRATE ?auto_11729 ) ( not ( = ?auto_11757 ?auto_11739 ) ) ( HOIST-AT ?auto_11752 ?auto_11757 ) ( SURFACE-AT ?auto_11729 ?auto_11757 ) ( ON ?auto_11729 ?auto_11759 ) ( CLEAR ?auto_11729 ) ( not ( = ?auto_11728 ?auto_11729 ) ) ( not ( = ?auto_11728 ?auto_11759 ) ) ( not ( = ?auto_11729 ?auto_11759 ) ) ( not ( = ?auto_11736 ?auto_11752 ) ) ( IS-CRATE ?auto_11728 ) ( SURFACE-AT ?auto_11728 ?auto_11757 ) ( ON ?auto_11728 ?auto_11756 ) ( CLEAR ?auto_11728 ) ( not ( = ?auto_11727 ?auto_11728 ) ) ( not ( = ?auto_11727 ?auto_11756 ) ) ( not ( = ?auto_11728 ?auto_11756 ) ) ( IS-CRATE ?auto_11727 ) ( AVAILABLE ?auto_11752 ) ( SURFACE-AT ?auto_11727 ?auto_11757 ) ( ON ?auto_11727 ?auto_11747 ) ( CLEAR ?auto_11727 ) ( not ( = ?auto_11726 ?auto_11727 ) ) ( not ( = ?auto_11726 ?auto_11747 ) ) ( not ( = ?auto_11727 ?auto_11747 ) ) ( IS-CRATE ?auto_11726 ) ( AVAILABLE ?auto_11740 ) ( SURFACE-AT ?auto_11726 ?auto_11754 ) ( ON ?auto_11726 ?auto_11748 ) ( CLEAR ?auto_11726 ) ( not ( = ?auto_11725 ?auto_11726 ) ) ( not ( = ?auto_11725 ?auto_11748 ) ) ( not ( = ?auto_11726 ?auto_11748 ) ) ( IS-CRATE ?auto_11725 ) ( not ( = ?auto_11746 ?auto_11739 ) ) ( HOIST-AT ?auto_11745 ?auto_11746 ) ( AVAILABLE ?auto_11745 ) ( SURFACE-AT ?auto_11725 ?auto_11746 ) ( ON ?auto_11725 ?auto_11750 ) ( CLEAR ?auto_11725 ) ( not ( = ?auto_11724 ?auto_11725 ) ) ( not ( = ?auto_11724 ?auto_11750 ) ) ( not ( = ?auto_11725 ?auto_11750 ) ) ( not ( = ?auto_11736 ?auto_11745 ) ) ( SURFACE-AT ?auto_11723 ?auto_11739 ) ( CLEAR ?auto_11723 ) ( IS-CRATE ?auto_11724 ) ( AVAILABLE ?auto_11736 ) ( not ( = ?auto_11753 ?auto_11739 ) ) ( HOIST-AT ?auto_11744 ?auto_11753 ) ( AVAILABLE ?auto_11744 ) ( SURFACE-AT ?auto_11724 ?auto_11753 ) ( ON ?auto_11724 ?auto_11755 ) ( CLEAR ?auto_11724 ) ( TRUCK-AT ?auto_11738 ?auto_11739 ) ( not ( = ?auto_11723 ?auto_11724 ) ) ( not ( = ?auto_11723 ?auto_11755 ) ) ( not ( = ?auto_11724 ?auto_11755 ) ) ( not ( = ?auto_11736 ?auto_11744 ) ) ( not ( = ?auto_11723 ?auto_11725 ) ) ( not ( = ?auto_11723 ?auto_11750 ) ) ( not ( = ?auto_11725 ?auto_11755 ) ) ( not ( = ?auto_11746 ?auto_11753 ) ) ( not ( = ?auto_11745 ?auto_11744 ) ) ( not ( = ?auto_11750 ?auto_11755 ) ) ( not ( = ?auto_11723 ?auto_11726 ) ) ( not ( = ?auto_11723 ?auto_11748 ) ) ( not ( = ?auto_11724 ?auto_11726 ) ) ( not ( = ?auto_11724 ?auto_11748 ) ) ( not ( = ?auto_11726 ?auto_11750 ) ) ( not ( = ?auto_11726 ?auto_11755 ) ) ( not ( = ?auto_11754 ?auto_11746 ) ) ( not ( = ?auto_11754 ?auto_11753 ) ) ( not ( = ?auto_11740 ?auto_11745 ) ) ( not ( = ?auto_11740 ?auto_11744 ) ) ( not ( = ?auto_11748 ?auto_11750 ) ) ( not ( = ?auto_11748 ?auto_11755 ) ) ( not ( = ?auto_11723 ?auto_11727 ) ) ( not ( = ?auto_11723 ?auto_11747 ) ) ( not ( = ?auto_11724 ?auto_11727 ) ) ( not ( = ?auto_11724 ?auto_11747 ) ) ( not ( = ?auto_11725 ?auto_11727 ) ) ( not ( = ?auto_11725 ?auto_11747 ) ) ( not ( = ?auto_11727 ?auto_11748 ) ) ( not ( = ?auto_11727 ?auto_11750 ) ) ( not ( = ?auto_11727 ?auto_11755 ) ) ( not ( = ?auto_11757 ?auto_11754 ) ) ( not ( = ?auto_11757 ?auto_11746 ) ) ( not ( = ?auto_11757 ?auto_11753 ) ) ( not ( = ?auto_11752 ?auto_11740 ) ) ( not ( = ?auto_11752 ?auto_11745 ) ) ( not ( = ?auto_11752 ?auto_11744 ) ) ( not ( = ?auto_11747 ?auto_11748 ) ) ( not ( = ?auto_11747 ?auto_11750 ) ) ( not ( = ?auto_11747 ?auto_11755 ) ) ( not ( = ?auto_11723 ?auto_11728 ) ) ( not ( = ?auto_11723 ?auto_11756 ) ) ( not ( = ?auto_11724 ?auto_11728 ) ) ( not ( = ?auto_11724 ?auto_11756 ) ) ( not ( = ?auto_11725 ?auto_11728 ) ) ( not ( = ?auto_11725 ?auto_11756 ) ) ( not ( = ?auto_11726 ?auto_11728 ) ) ( not ( = ?auto_11726 ?auto_11756 ) ) ( not ( = ?auto_11728 ?auto_11747 ) ) ( not ( = ?auto_11728 ?auto_11748 ) ) ( not ( = ?auto_11728 ?auto_11750 ) ) ( not ( = ?auto_11728 ?auto_11755 ) ) ( not ( = ?auto_11756 ?auto_11747 ) ) ( not ( = ?auto_11756 ?auto_11748 ) ) ( not ( = ?auto_11756 ?auto_11750 ) ) ( not ( = ?auto_11756 ?auto_11755 ) ) ( not ( = ?auto_11723 ?auto_11729 ) ) ( not ( = ?auto_11723 ?auto_11759 ) ) ( not ( = ?auto_11724 ?auto_11729 ) ) ( not ( = ?auto_11724 ?auto_11759 ) ) ( not ( = ?auto_11725 ?auto_11729 ) ) ( not ( = ?auto_11725 ?auto_11759 ) ) ( not ( = ?auto_11726 ?auto_11729 ) ) ( not ( = ?auto_11726 ?auto_11759 ) ) ( not ( = ?auto_11727 ?auto_11729 ) ) ( not ( = ?auto_11727 ?auto_11759 ) ) ( not ( = ?auto_11729 ?auto_11756 ) ) ( not ( = ?auto_11729 ?auto_11747 ) ) ( not ( = ?auto_11729 ?auto_11748 ) ) ( not ( = ?auto_11729 ?auto_11750 ) ) ( not ( = ?auto_11729 ?auto_11755 ) ) ( not ( = ?auto_11759 ?auto_11756 ) ) ( not ( = ?auto_11759 ?auto_11747 ) ) ( not ( = ?auto_11759 ?auto_11748 ) ) ( not ( = ?auto_11759 ?auto_11750 ) ) ( not ( = ?auto_11759 ?auto_11755 ) ) ( not ( = ?auto_11723 ?auto_11732 ) ) ( not ( = ?auto_11723 ?auto_11758 ) ) ( not ( = ?auto_11724 ?auto_11732 ) ) ( not ( = ?auto_11724 ?auto_11758 ) ) ( not ( = ?auto_11725 ?auto_11732 ) ) ( not ( = ?auto_11725 ?auto_11758 ) ) ( not ( = ?auto_11726 ?auto_11732 ) ) ( not ( = ?auto_11726 ?auto_11758 ) ) ( not ( = ?auto_11727 ?auto_11732 ) ) ( not ( = ?auto_11727 ?auto_11758 ) ) ( not ( = ?auto_11728 ?auto_11732 ) ) ( not ( = ?auto_11728 ?auto_11758 ) ) ( not ( = ?auto_11732 ?auto_11759 ) ) ( not ( = ?auto_11732 ?auto_11756 ) ) ( not ( = ?auto_11732 ?auto_11747 ) ) ( not ( = ?auto_11732 ?auto_11748 ) ) ( not ( = ?auto_11732 ?auto_11750 ) ) ( not ( = ?auto_11732 ?auto_11755 ) ) ( not ( = ?auto_11760 ?auto_11757 ) ) ( not ( = ?auto_11760 ?auto_11754 ) ) ( not ( = ?auto_11760 ?auto_11746 ) ) ( not ( = ?auto_11760 ?auto_11753 ) ) ( not ( = ?auto_11749 ?auto_11752 ) ) ( not ( = ?auto_11749 ?auto_11740 ) ) ( not ( = ?auto_11749 ?auto_11745 ) ) ( not ( = ?auto_11749 ?auto_11744 ) ) ( not ( = ?auto_11758 ?auto_11759 ) ) ( not ( = ?auto_11758 ?auto_11756 ) ) ( not ( = ?auto_11758 ?auto_11747 ) ) ( not ( = ?auto_11758 ?auto_11748 ) ) ( not ( = ?auto_11758 ?auto_11750 ) ) ( not ( = ?auto_11758 ?auto_11755 ) ) ( not ( = ?auto_11723 ?auto_11731 ) ) ( not ( = ?auto_11723 ?auto_11751 ) ) ( not ( = ?auto_11724 ?auto_11731 ) ) ( not ( = ?auto_11724 ?auto_11751 ) ) ( not ( = ?auto_11725 ?auto_11731 ) ) ( not ( = ?auto_11725 ?auto_11751 ) ) ( not ( = ?auto_11726 ?auto_11731 ) ) ( not ( = ?auto_11726 ?auto_11751 ) ) ( not ( = ?auto_11727 ?auto_11731 ) ) ( not ( = ?auto_11727 ?auto_11751 ) ) ( not ( = ?auto_11728 ?auto_11731 ) ) ( not ( = ?auto_11728 ?auto_11751 ) ) ( not ( = ?auto_11729 ?auto_11731 ) ) ( not ( = ?auto_11729 ?auto_11751 ) ) ( not ( = ?auto_11731 ?auto_11758 ) ) ( not ( = ?auto_11731 ?auto_11759 ) ) ( not ( = ?auto_11731 ?auto_11756 ) ) ( not ( = ?auto_11731 ?auto_11747 ) ) ( not ( = ?auto_11731 ?auto_11748 ) ) ( not ( = ?auto_11731 ?auto_11750 ) ) ( not ( = ?auto_11731 ?auto_11755 ) ) ( not ( = ?auto_11741 ?auto_11760 ) ) ( not ( = ?auto_11741 ?auto_11757 ) ) ( not ( = ?auto_11741 ?auto_11754 ) ) ( not ( = ?auto_11741 ?auto_11746 ) ) ( not ( = ?auto_11741 ?auto_11753 ) ) ( not ( = ?auto_11742 ?auto_11749 ) ) ( not ( = ?auto_11742 ?auto_11752 ) ) ( not ( = ?auto_11742 ?auto_11740 ) ) ( not ( = ?auto_11742 ?auto_11745 ) ) ( not ( = ?auto_11742 ?auto_11744 ) ) ( not ( = ?auto_11751 ?auto_11758 ) ) ( not ( = ?auto_11751 ?auto_11759 ) ) ( not ( = ?auto_11751 ?auto_11756 ) ) ( not ( = ?auto_11751 ?auto_11747 ) ) ( not ( = ?auto_11751 ?auto_11748 ) ) ( not ( = ?auto_11751 ?auto_11750 ) ) ( not ( = ?auto_11751 ?auto_11755 ) ) ( not ( = ?auto_11723 ?auto_11730 ) ) ( not ( = ?auto_11723 ?auto_11743 ) ) ( not ( = ?auto_11724 ?auto_11730 ) ) ( not ( = ?auto_11724 ?auto_11743 ) ) ( not ( = ?auto_11725 ?auto_11730 ) ) ( not ( = ?auto_11725 ?auto_11743 ) ) ( not ( = ?auto_11726 ?auto_11730 ) ) ( not ( = ?auto_11726 ?auto_11743 ) ) ( not ( = ?auto_11727 ?auto_11730 ) ) ( not ( = ?auto_11727 ?auto_11743 ) ) ( not ( = ?auto_11728 ?auto_11730 ) ) ( not ( = ?auto_11728 ?auto_11743 ) ) ( not ( = ?auto_11729 ?auto_11730 ) ) ( not ( = ?auto_11729 ?auto_11743 ) ) ( not ( = ?auto_11732 ?auto_11730 ) ) ( not ( = ?auto_11732 ?auto_11743 ) ) ( not ( = ?auto_11730 ?auto_11751 ) ) ( not ( = ?auto_11730 ?auto_11758 ) ) ( not ( = ?auto_11730 ?auto_11759 ) ) ( not ( = ?auto_11730 ?auto_11756 ) ) ( not ( = ?auto_11730 ?auto_11747 ) ) ( not ( = ?auto_11730 ?auto_11748 ) ) ( not ( = ?auto_11730 ?auto_11750 ) ) ( not ( = ?auto_11730 ?auto_11755 ) ) ( not ( = ?auto_11743 ?auto_11751 ) ) ( not ( = ?auto_11743 ?auto_11758 ) ) ( not ( = ?auto_11743 ?auto_11759 ) ) ( not ( = ?auto_11743 ?auto_11756 ) ) ( not ( = ?auto_11743 ?auto_11747 ) ) ( not ( = ?auto_11743 ?auto_11748 ) ) ( not ( = ?auto_11743 ?auto_11750 ) ) ( not ( = ?auto_11743 ?auto_11755 ) ) ( not ( = ?auto_11723 ?auto_11733 ) ) ( not ( = ?auto_11723 ?auto_11737 ) ) ( not ( = ?auto_11724 ?auto_11733 ) ) ( not ( = ?auto_11724 ?auto_11737 ) ) ( not ( = ?auto_11725 ?auto_11733 ) ) ( not ( = ?auto_11725 ?auto_11737 ) ) ( not ( = ?auto_11726 ?auto_11733 ) ) ( not ( = ?auto_11726 ?auto_11737 ) ) ( not ( = ?auto_11727 ?auto_11733 ) ) ( not ( = ?auto_11727 ?auto_11737 ) ) ( not ( = ?auto_11728 ?auto_11733 ) ) ( not ( = ?auto_11728 ?auto_11737 ) ) ( not ( = ?auto_11729 ?auto_11733 ) ) ( not ( = ?auto_11729 ?auto_11737 ) ) ( not ( = ?auto_11732 ?auto_11733 ) ) ( not ( = ?auto_11732 ?auto_11737 ) ) ( not ( = ?auto_11731 ?auto_11733 ) ) ( not ( = ?auto_11731 ?auto_11737 ) ) ( not ( = ?auto_11733 ?auto_11743 ) ) ( not ( = ?auto_11733 ?auto_11751 ) ) ( not ( = ?auto_11733 ?auto_11758 ) ) ( not ( = ?auto_11733 ?auto_11759 ) ) ( not ( = ?auto_11733 ?auto_11756 ) ) ( not ( = ?auto_11733 ?auto_11747 ) ) ( not ( = ?auto_11733 ?auto_11748 ) ) ( not ( = ?auto_11733 ?auto_11750 ) ) ( not ( = ?auto_11733 ?auto_11755 ) ) ( not ( = ?auto_11734 ?auto_11754 ) ) ( not ( = ?auto_11734 ?auto_11741 ) ) ( not ( = ?auto_11734 ?auto_11760 ) ) ( not ( = ?auto_11734 ?auto_11757 ) ) ( not ( = ?auto_11734 ?auto_11746 ) ) ( not ( = ?auto_11734 ?auto_11753 ) ) ( not ( = ?auto_11735 ?auto_11740 ) ) ( not ( = ?auto_11735 ?auto_11742 ) ) ( not ( = ?auto_11735 ?auto_11749 ) ) ( not ( = ?auto_11735 ?auto_11752 ) ) ( not ( = ?auto_11735 ?auto_11745 ) ) ( not ( = ?auto_11735 ?auto_11744 ) ) ( not ( = ?auto_11737 ?auto_11743 ) ) ( not ( = ?auto_11737 ?auto_11751 ) ) ( not ( = ?auto_11737 ?auto_11758 ) ) ( not ( = ?auto_11737 ?auto_11759 ) ) ( not ( = ?auto_11737 ?auto_11756 ) ) ( not ( = ?auto_11737 ?auto_11747 ) ) ( not ( = ?auto_11737 ?auto_11748 ) ) ( not ( = ?auto_11737 ?auto_11750 ) ) ( not ( = ?auto_11737 ?auto_11755 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_11723 ?auto_11724 ?auto_11725 ?auto_11726 ?auto_11727 ?auto_11728 ?auto_11729 ?auto_11732 ?auto_11731 ?auto_11730 )
      ( MAKE-1CRATE ?auto_11730 ?auto_11733 )
      ( MAKE-10CRATE-VERIFY ?auto_11723 ?auto_11724 ?auto_11725 ?auto_11726 ?auto_11727 ?auto_11728 ?auto_11729 ?auto_11732 ?auto_11731 ?auto_11730 ?auto_11733 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11763 - SURFACE
      ?auto_11764 - SURFACE
    )
    :vars
    (
      ?auto_11765 - HOIST
      ?auto_11766 - PLACE
      ?auto_11768 - PLACE
      ?auto_11769 - HOIST
      ?auto_11770 - SURFACE
      ?auto_11767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11765 ?auto_11766 ) ( SURFACE-AT ?auto_11763 ?auto_11766 ) ( CLEAR ?auto_11763 ) ( IS-CRATE ?auto_11764 ) ( AVAILABLE ?auto_11765 ) ( not ( = ?auto_11768 ?auto_11766 ) ) ( HOIST-AT ?auto_11769 ?auto_11768 ) ( AVAILABLE ?auto_11769 ) ( SURFACE-AT ?auto_11764 ?auto_11768 ) ( ON ?auto_11764 ?auto_11770 ) ( CLEAR ?auto_11764 ) ( TRUCK-AT ?auto_11767 ?auto_11766 ) ( not ( = ?auto_11763 ?auto_11764 ) ) ( not ( = ?auto_11763 ?auto_11770 ) ) ( not ( = ?auto_11764 ?auto_11770 ) ) ( not ( = ?auto_11765 ?auto_11769 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11767 ?auto_11766 ?auto_11768 )
      ( !LIFT ?auto_11769 ?auto_11764 ?auto_11770 ?auto_11768 )
      ( !LOAD ?auto_11769 ?auto_11764 ?auto_11767 ?auto_11768 )
      ( !DRIVE ?auto_11767 ?auto_11768 ?auto_11766 )
      ( !UNLOAD ?auto_11765 ?auto_11764 ?auto_11767 ?auto_11766 )
      ( !DROP ?auto_11765 ?auto_11764 ?auto_11763 ?auto_11766 )
      ( MAKE-1CRATE-VERIFY ?auto_11763 ?auto_11764 ) )
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
      ?auto_11792 - SURFACE
      ?auto_11791 - SURFACE
      ?auto_11790 - SURFACE
      ?auto_11793 - SURFACE
      ?auto_11794 - SURFACE
    )
    :vars
    (
      ?auto_11798 - HOIST
      ?auto_11796 - PLACE
      ?auto_11799 - PLACE
      ?auto_11797 - HOIST
      ?auto_11795 - SURFACE
      ?auto_11801 - PLACE
      ?auto_11809 - HOIST
      ?auto_11810 - SURFACE
      ?auto_11802 - PLACE
      ?auto_11813 - HOIST
      ?auto_11815 - SURFACE
      ?auto_11820 - PLACE
      ?auto_11817 - HOIST
      ?auto_11818 - SURFACE
      ?auto_11804 - PLACE
      ?auto_11808 - HOIST
      ?auto_11814 - SURFACE
      ?auto_11819 - PLACE
      ?auto_11807 - HOIST
      ?auto_11805 - SURFACE
      ?auto_11816 - SURFACE
      ?auto_11803 - SURFACE
      ?auto_11811 - SURFACE
      ?auto_11821 - PLACE
      ?auto_11812 - HOIST
      ?auto_11806 - SURFACE
      ?auto_11822 - SURFACE
      ?auto_11800 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11798 ?auto_11796 ) ( IS-CRATE ?auto_11794 ) ( not ( = ?auto_11799 ?auto_11796 ) ) ( HOIST-AT ?auto_11797 ?auto_11799 ) ( SURFACE-AT ?auto_11794 ?auto_11799 ) ( ON ?auto_11794 ?auto_11795 ) ( CLEAR ?auto_11794 ) ( not ( = ?auto_11793 ?auto_11794 ) ) ( not ( = ?auto_11793 ?auto_11795 ) ) ( not ( = ?auto_11794 ?auto_11795 ) ) ( not ( = ?auto_11798 ?auto_11797 ) ) ( IS-CRATE ?auto_11793 ) ( not ( = ?auto_11801 ?auto_11796 ) ) ( HOIST-AT ?auto_11809 ?auto_11801 ) ( AVAILABLE ?auto_11809 ) ( SURFACE-AT ?auto_11793 ?auto_11801 ) ( ON ?auto_11793 ?auto_11810 ) ( CLEAR ?auto_11793 ) ( not ( = ?auto_11790 ?auto_11793 ) ) ( not ( = ?auto_11790 ?auto_11810 ) ) ( not ( = ?auto_11793 ?auto_11810 ) ) ( not ( = ?auto_11798 ?auto_11809 ) ) ( IS-CRATE ?auto_11790 ) ( not ( = ?auto_11802 ?auto_11796 ) ) ( HOIST-AT ?auto_11813 ?auto_11802 ) ( SURFACE-AT ?auto_11790 ?auto_11802 ) ( ON ?auto_11790 ?auto_11815 ) ( CLEAR ?auto_11790 ) ( not ( = ?auto_11791 ?auto_11790 ) ) ( not ( = ?auto_11791 ?auto_11815 ) ) ( not ( = ?auto_11790 ?auto_11815 ) ) ( not ( = ?auto_11798 ?auto_11813 ) ) ( IS-CRATE ?auto_11791 ) ( not ( = ?auto_11820 ?auto_11796 ) ) ( HOIST-AT ?auto_11817 ?auto_11820 ) ( AVAILABLE ?auto_11817 ) ( SURFACE-AT ?auto_11791 ?auto_11820 ) ( ON ?auto_11791 ?auto_11818 ) ( CLEAR ?auto_11791 ) ( not ( = ?auto_11792 ?auto_11791 ) ) ( not ( = ?auto_11792 ?auto_11818 ) ) ( not ( = ?auto_11791 ?auto_11818 ) ) ( not ( = ?auto_11798 ?auto_11817 ) ) ( IS-CRATE ?auto_11792 ) ( not ( = ?auto_11804 ?auto_11796 ) ) ( HOIST-AT ?auto_11808 ?auto_11804 ) ( AVAILABLE ?auto_11808 ) ( SURFACE-AT ?auto_11792 ?auto_11804 ) ( ON ?auto_11792 ?auto_11814 ) ( CLEAR ?auto_11792 ) ( not ( = ?auto_11789 ?auto_11792 ) ) ( not ( = ?auto_11789 ?auto_11814 ) ) ( not ( = ?auto_11792 ?auto_11814 ) ) ( not ( = ?auto_11798 ?auto_11808 ) ) ( IS-CRATE ?auto_11789 ) ( not ( = ?auto_11819 ?auto_11796 ) ) ( HOIST-AT ?auto_11807 ?auto_11819 ) ( SURFACE-AT ?auto_11789 ?auto_11819 ) ( ON ?auto_11789 ?auto_11805 ) ( CLEAR ?auto_11789 ) ( not ( = ?auto_11788 ?auto_11789 ) ) ( not ( = ?auto_11788 ?auto_11805 ) ) ( not ( = ?auto_11789 ?auto_11805 ) ) ( not ( = ?auto_11798 ?auto_11807 ) ) ( IS-CRATE ?auto_11788 ) ( SURFACE-AT ?auto_11788 ?auto_11819 ) ( ON ?auto_11788 ?auto_11816 ) ( CLEAR ?auto_11788 ) ( not ( = ?auto_11787 ?auto_11788 ) ) ( not ( = ?auto_11787 ?auto_11816 ) ) ( not ( = ?auto_11788 ?auto_11816 ) ) ( IS-CRATE ?auto_11787 ) ( AVAILABLE ?auto_11807 ) ( SURFACE-AT ?auto_11787 ?auto_11819 ) ( ON ?auto_11787 ?auto_11803 ) ( CLEAR ?auto_11787 ) ( not ( = ?auto_11786 ?auto_11787 ) ) ( not ( = ?auto_11786 ?auto_11803 ) ) ( not ( = ?auto_11787 ?auto_11803 ) ) ( IS-CRATE ?auto_11786 ) ( AVAILABLE ?auto_11813 ) ( SURFACE-AT ?auto_11786 ?auto_11802 ) ( ON ?auto_11786 ?auto_11811 ) ( CLEAR ?auto_11786 ) ( not ( = ?auto_11785 ?auto_11786 ) ) ( not ( = ?auto_11785 ?auto_11811 ) ) ( not ( = ?auto_11786 ?auto_11811 ) ) ( IS-CRATE ?auto_11785 ) ( not ( = ?auto_11821 ?auto_11796 ) ) ( HOIST-AT ?auto_11812 ?auto_11821 ) ( AVAILABLE ?auto_11812 ) ( SURFACE-AT ?auto_11785 ?auto_11821 ) ( ON ?auto_11785 ?auto_11806 ) ( CLEAR ?auto_11785 ) ( not ( = ?auto_11784 ?auto_11785 ) ) ( not ( = ?auto_11784 ?auto_11806 ) ) ( not ( = ?auto_11785 ?auto_11806 ) ) ( not ( = ?auto_11798 ?auto_11812 ) ) ( SURFACE-AT ?auto_11783 ?auto_11796 ) ( CLEAR ?auto_11783 ) ( IS-CRATE ?auto_11784 ) ( AVAILABLE ?auto_11798 ) ( AVAILABLE ?auto_11797 ) ( SURFACE-AT ?auto_11784 ?auto_11799 ) ( ON ?auto_11784 ?auto_11822 ) ( CLEAR ?auto_11784 ) ( TRUCK-AT ?auto_11800 ?auto_11796 ) ( not ( = ?auto_11783 ?auto_11784 ) ) ( not ( = ?auto_11783 ?auto_11822 ) ) ( not ( = ?auto_11784 ?auto_11822 ) ) ( not ( = ?auto_11783 ?auto_11785 ) ) ( not ( = ?auto_11783 ?auto_11806 ) ) ( not ( = ?auto_11785 ?auto_11822 ) ) ( not ( = ?auto_11821 ?auto_11799 ) ) ( not ( = ?auto_11812 ?auto_11797 ) ) ( not ( = ?auto_11806 ?auto_11822 ) ) ( not ( = ?auto_11783 ?auto_11786 ) ) ( not ( = ?auto_11783 ?auto_11811 ) ) ( not ( = ?auto_11784 ?auto_11786 ) ) ( not ( = ?auto_11784 ?auto_11811 ) ) ( not ( = ?auto_11786 ?auto_11806 ) ) ( not ( = ?auto_11786 ?auto_11822 ) ) ( not ( = ?auto_11802 ?auto_11821 ) ) ( not ( = ?auto_11802 ?auto_11799 ) ) ( not ( = ?auto_11813 ?auto_11812 ) ) ( not ( = ?auto_11813 ?auto_11797 ) ) ( not ( = ?auto_11811 ?auto_11806 ) ) ( not ( = ?auto_11811 ?auto_11822 ) ) ( not ( = ?auto_11783 ?auto_11787 ) ) ( not ( = ?auto_11783 ?auto_11803 ) ) ( not ( = ?auto_11784 ?auto_11787 ) ) ( not ( = ?auto_11784 ?auto_11803 ) ) ( not ( = ?auto_11785 ?auto_11787 ) ) ( not ( = ?auto_11785 ?auto_11803 ) ) ( not ( = ?auto_11787 ?auto_11811 ) ) ( not ( = ?auto_11787 ?auto_11806 ) ) ( not ( = ?auto_11787 ?auto_11822 ) ) ( not ( = ?auto_11819 ?auto_11802 ) ) ( not ( = ?auto_11819 ?auto_11821 ) ) ( not ( = ?auto_11819 ?auto_11799 ) ) ( not ( = ?auto_11807 ?auto_11813 ) ) ( not ( = ?auto_11807 ?auto_11812 ) ) ( not ( = ?auto_11807 ?auto_11797 ) ) ( not ( = ?auto_11803 ?auto_11811 ) ) ( not ( = ?auto_11803 ?auto_11806 ) ) ( not ( = ?auto_11803 ?auto_11822 ) ) ( not ( = ?auto_11783 ?auto_11788 ) ) ( not ( = ?auto_11783 ?auto_11816 ) ) ( not ( = ?auto_11784 ?auto_11788 ) ) ( not ( = ?auto_11784 ?auto_11816 ) ) ( not ( = ?auto_11785 ?auto_11788 ) ) ( not ( = ?auto_11785 ?auto_11816 ) ) ( not ( = ?auto_11786 ?auto_11788 ) ) ( not ( = ?auto_11786 ?auto_11816 ) ) ( not ( = ?auto_11788 ?auto_11803 ) ) ( not ( = ?auto_11788 ?auto_11811 ) ) ( not ( = ?auto_11788 ?auto_11806 ) ) ( not ( = ?auto_11788 ?auto_11822 ) ) ( not ( = ?auto_11816 ?auto_11803 ) ) ( not ( = ?auto_11816 ?auto_11811 ) ) ( not ( = ?auto_11816 ?auto_11806 ) ) ( not ( = ?auto_11816 ?auto_11822 ) ) ( not ( = ?auto_11783 ?auto_11789 ) ) ( not ( = ?auto_11783 ?auto_11805 ) ) ( not ( = ?auto_11784 ?auto_11789 ) ) ( not ( = ?auto_11784 ?auto_11805 ) ) ( not ( = ?auto_11785 ?auto_11789 ) ) ( not ( = ?auto_11785 ?auto_11805 ) ) ( not ( = ?auto_11786 ?auto_11789 ) ) ( not ( = ?auto_11786 ?auto_11805 ) ) ( not ( = ?auto_11787 ?auto_11789 ) ) ( not ( = ?auto_11787 ?auto_11805 ) ) ( not ( = ?auto_11789 ?auto_11816 ) ) ( not ( = ?auto_11789 ?auto_11803 ) ) ( not ( = ?auto_11789 ?auto_11811 ) ) ( not ( = ?auto_11789 ?auto_11806 ) ) ( not ( = ?auto_11789 ?auto_11822 ) ) ( not ( = ?auto_11805 ?auto_11816 ) ) ( not ( = ?auto_11805 ?auto_11803 ) ) ( not ( = ?auto_11805 ?auto_11811 ) ) ( not ( = ?auto_11805 ?auto_11806 ) ) ( not ( = ?auto_11805 ?auto_11822 ) ) ( not ( = ?auto_11783 ?auto_11792 ) ) ( not ( = ?auto_11783 ?auto_11814 ) ) ( not ( = ?auto_11784 ?auto_11792 ) ) ( not ( = ?auto_11784 ?auto_11814 ) ) ( not ( = ?auto_11785 ?auto_11792 ) ) ( not ( = ?auto_11785 ?auto_11814 ) ) ( not ( = ?auto_11786 ?auto_11792 ) ) ( not ( = ?auto_11786 ?auto_11814 ) ) ( not ( = ?auto_11787 ?auto_11792 ) ) ( not ( = ?auto_11787 ?auto_11814 ) ) ( not ( = ?auto_11788 ?auto_11792 ) ) ( not ( = ?auto_11788 ?auto_11814 ) ) ( not ( = ?auto_11792 ?auto_11805 ) ) ( not ( = ?auto_11792 ?auto_11816 ) ) ( not ( = ?auto_11792 ?auto_11803 ) ) ( not ( = ?auto_11792 ?auto_11811 ) ) ( not ( = ?auto_11792 ?auto_11806 ) ) ( not ( = ?auto_11792 ?auto_11822 ) ) ( not ( = ?auto_11804 ?auto_11819 ) ) ( not ( = ?auto_11804 ?auto_11802 ) ) ( not ( = ?auto_11804 ?auto_11821 ) ) ( not ( = ?auto_11804 ?auto_11799 ) ) ( not ( = ?auto_11808 ?auto_11807 ) ) ( not ( = ?auto_11808 ?auto_11813 ) ) ( not ( = ?auto_11808 ?auto_11812 ) ) ( not ( = ?auto_11808 ?auto_11797 ) ) ( not ( = ?auto_11814 ?auto_11805 ) ) ( not ( = ?auto_11814 ?auto_11816 ) ) ( not ( = ?auto_11814 ?auto_11803 ) ) ( not ( = ?auto_11814 ?auto_11811 ) ) ( not ( = ?auto_11814 ?auto_11806 ) ) ( not ( = ?auto_11814 ?auto_11822 ) ) ( not ( = ?auto_11783 ?auto_11791 ) ) ( not ( = ?auto_11783 ?auto_11818 ) ) ( not ( = ?auto_11784 ?auto_11791 ) ) ( not ( = ?auto_11784 ?auto_11818 ) ) ( not ( = ?auto_11785 ?auto_11791 ) ) ( not ( = ?auto_11785 ?auto_11818 ) ) ( not ( = ?auto_11786 ?auto_11791 ) ) ( not ( = ?auto_11786 ?auto_11818 ) ) ( not ( = ?auto_11787 ?auto_11791 ) ) ( not ( = ?auto_11787 ?auto_11818 ) ) ( not ( = ?auto_11788 ?auto_11791 ) ) ( not ( = ?auto_11788 ?auto_11818 ) ) ( not ( = ?auto_11789 ?auto_11791 ) ) ( not ( = ?auto_11789 ?auto_11818 ) ) ( not ( = ?auto_11791 ?auto_11814 ) ) ( not ( = ?auto_11791 ?auto_11805 ) ) ( not ( = ?auto_11791 ?auto_11816 ) ) ( not ( = ?auto_11791 ?auto_11803 ) ) ( not ( = ?auto_11791 ?auto_11811 ) ) ( not ( = ?auto_11791 ?auto_11806 ) ) ( not ( = ?auto_11791 ?auto_11822 ) ) ( not ( = ?auto_11820 ?auto_11804 ) ) ( not ( = ?auto_11820 ?auto_11819 ) ) ( not ( = ?auto_11820 ?auto_11802 ) ) ( not ( = ?auto_11820 ?auto_11821 ) ) ( not ( = ?auto_11820 ?auto_11799 ) ) ( not ( = ?auto_11817 ?auto_11808 ) ) ( not ( = ?auto_11817 ?auto_11807 ) ) ( not ( = ?auto_11817 ?auto_11813 ) ) ( not ( = ?auto_11817 ?auto_11812 ) ) ( not ( = ?auto_11817 ?auto_11797 ) ) ( not ( = ?auto_11818 ?auto_11814 ) ) ( not ( = ?auto_11818 ?auto_11805 ) ) ( not ( = ?auto_11818 ?auto_11816 ) ) ( not ( = ?auto_11818 ?auto_11803 ) ) ( not ( = ?auto_11818 ?auto_11811 ) ) ( not ( = ?auto_11818 ?auto_11806 ) ) ( not ( = ?auto_11818 ?auto_11822 ) ) ( not ( = ?auto_11783 ?auto_11790 ) ) ( not ( = ?auto_11783 ?auto_11815 ) ) ( not ( = ?auto_11784 ?auto_11790 ) ) ( not ( = ?auto_11784 ?auto_11815 ) ) ( not ( = ?auto_11785 ?auto_11790 ) ) ( not ( = ?auto_11785 ?auto_11815 ) ) ( not ( = ?auto_11786 ?auto_11790 ) ) ( not ( = ?auto_11786 ?auto_11815 ) ) ( not ( = ?auto_11787 ?auto_11790 ) ) ( not ( = ?auto_11787 ?auto_11815 ) ) ( not ( = ?auto_11788 ?auto_11790 ) ) ( not ( = ?auto_11788 ?auto_11815 ) ) ( not ( = ?auto_11789 ?auto_11790 ) ) ( not ( = ?auto_11789 ?auto_11815 ) ) ( not ( = ?auto_11792 ?auto_11790 ) ) ( not ( = ?auto_11792 ?auto_11815 ) ) ( not ( = ?auto_11790 ?auto_11818 ) ) ( not ( = ?auto_11790 ?auto_11814 ) ) ( not ( = ?auto_11790 ?auto_11805 ) ) ( not ( = ?auto_11790 ?auto_11816 ) ) ( not ( = ?auto_11790 ?auto_11803 ) ) ( not ( = ?auto_11790 ?auto_11811 ) ) ( not ( = ?auto_11790 ?auto_11806 ) ) ( not ( = ?auto_11790 ?auto_11822 ) ) ( not ( = ?auto_11815 ?auto_11818 ) ) ( not ( = ?auto_11815 ?auto_11814 ) ) ( not ( = ?auto_11815 ?auto_11805 ) ) ( not ( = ?auto_11815 ?auto_11816 ) ) ( not ( = ?auto_11815 ?auto_11803 ) ) ( not ( = ?auto_11815 ?auto_11811 ) ) ( not ( = ?auto_11815 ?auto_11806 ) ) ( not ( = ?auto_11815 ?auto_11822 ) ) ( not ( = ?auto_11783 ?auto_11793 ) ) ( not ( = ?auto_11783 ?auto_11810 ) ) ( not ( = ?auto_11784 ?auto_11793 ) ) ( not ( = ?auto_11784 ?auto_11810 ) ) ( not ( = ?auto_11785 ?auto_11793 ) ) ( not ( = ?auto_11785 ?auto_11810 ) ) ( not ( = ?auto_11786 ?auto_11793 ) ) ( not ( = ?auto_11786 ?auto_11810 ) ) ( not ( = ?auto_11787 ?auto_11793 ) ) ( not ( = ?auto_11787 ?auto_11810 ) ) ( not ( = ?auto_11788 ?auto_11793 ) ) ( not ( = ?auto_11788 ?auto_11810 ) ) ( not ( = ?auto_11789 ?auto_11793 ) ) ( not ( = ?auto_11789 ?auto_11810 ) ) ( not ( = ?auto_11792 ?auto_11793 ) ) ( not ( = ?auto_11792 ?auto_11810 ) ) ( not ( = ?auto_11791 ?auto_11793 ) ) ( not ( = ?auto_11791 ?auto_11810 ) ) ( not ( = ?auto_11793 ?auto_11815 ) ) ( not ( = ?auto_11793 ?auto_11818 ) ) ( not ( = ?auto_11793 ?auto_11814 ) ) ( not ( = ?auto_11793 ?auto_11805 ) ) ( not ( = ?auto_11793 ?auto_11816 ) ) ( not ( = ?auto_11793 ?auto_11803 ) ) ( not ( = ?auto_11793 ?auto_11811 ) ) ( not ( = ?auto_11793 ?auto_11806 ) ) ( not ( = ?auto_11793 ?auto_11822 ) ) ( not ( = ?auto_11801 ?auto_11802 ) ) ( not ( = ?auto_11801 ?auto_11820 ) ) ( not ( = ?auto_11801 ?auto_11804 ) ) ( not ( = ?auto_11801 ?auto_11819 ) ) ( not ( = ?auto_11801 ?auto_11821 ) ) ( not ( = ?auto_11801 ?auto_11799 ) ) ( not ( = ?auto_11809 ?auto_11813 ) ) ( not ( = ?auto_11809 ?auto_11817 ) ) ( not ( = ?auto_11809 ?auto_11808 ) ) ( not ( = ?auto_11809 ?auto_11807 ) ) ( not ( = ?auto_11809 ?auto_11812 ) ) ( not ( = ?auto_11809 ?auto_11797 ) ) ( not ( = ?auto_11810 ?auto_11815 ) ) ( not ( = ?auto_11810 ?auto_11818 ) ) ( not ( = ?auto_11810 ?auto_11814 ) ) ( not ( = ?auto_11810 ?auto_11805 ) ) ( not ( = ?auto_11810 ?auto_11816 ) ) ( not ( = ?auto_11810 ?auto_11803 ) ) ( not ( = ?auto_11810 ?auto_11811 ) ) ( not ( = ?auto_11810 ?auto_11806 ) ) ( not ( = ?auto_11810 ?auto_11822 ) ) ( not ( = ?auto_11783 ?auto_11794 ) ) ( not ( = ?auto_11783 ?auto_11795 ) ) ( not ( = ?auto_11784 ?auto_11794 ) ) ( not ( = ?auto_11784 ?auto_11795 ) ) ( not ( = ?auto_11785 ?auto_11794 ) ) ( not ( = ?auto_11785 ?auto_11795 ) ) ( not ( = ?auto_11786 ?auto_11794 ) ) ( not ( = ?auto_11786 ?auto_11795 ) ) ( not ( = ?auto_11787 ?auto_11794 ) ) ( not ( = ?auto_11787 ?auto_11795 ) ) ( not ( = ?auto_11788 ?auto_11794 ) ) ( not ( = ?auto_11788 ?auto_11795 ) ) ( not ( = ?auto_11789 ?auto_11794 ) ) ( not ( = ?auto_11789 ?auto_11795 ) ) ( not ( = ?auto_11792 ?auto_11794 ) ) ( not ( = ?auto_11792 ?auto_11795 ) ) ( not ( = ?auto_11791 ?auto_11794 ) ) ( not ( = ?auto_11791 ?auto_11795 ) ) ( not ( = ?auto_11790 ?auto_11794 ) ) ( not ( = ?auto_11790 ?auto_11795 ) ) ( not ( = ?auto_11794 ?auto_11810 ) ) ( not ( = ?auto_11794 ?auto_11815 ) ) ( not ( = ?auto_11794 ?auto_11818 ) ) ( not ( = ?auto_11794 ?auto_11814 ) ) ( not ( = ?auto_11794 ?auto_11805 ) ) ( not ( = ?auto_11794 ?auto_11816 ) ) ( not ( = ?auto_11794 ?auto_11803 ) ) ( not ( = ?auto_11794 ?auto_11811 ) ) ( not ( = ?auto_11794 ?auto_11806 ) ) ( not ( = ?auto_11794 ?auto_11822 ) ) ( not ( = ?auto_11795 ?auto_11810 ) ) ( not ( = ?auto_11795 ?auto_11815 ) ) ( not ( = ?auto_11795 ?auto_11818 ) ) ( not ( = ?auto_11795 ?auto_11814 ) ) ( not ( = ?auto_11795 ?auto_11805 ) ) ( not ( = ?auto_11795 ?auto_11816 ) ) ( not ( = ?auto_11795 ?auto_11803 ) ) ( not ( = ?auto_11795 ?auto_11811 ) ) ( not ( = ?auto_11795 ?auto_11806 ) ) ( not ( = ?auto_11795 ?auto_11822 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_11783 ?auto_11784 ?auto_11785 ?auto_11786 ?auto_11787 ?auto_11788 ?auto_11789 ?auto_11792 ?auto_11791 ?auto_11790 ?auto_11793 )
      ( MAKE-1CRATE ?auto_11793 ?auto_11794 )
      ( MAKE-11CRATE-VERIFY ?auto_11783 ?auto_11784 ?auto_11785 ?auto_11786 ?auto_11787 ?auto_11788 ?auto_11789 ?auto_11792 ?auto_11791 ?auto_11790 ?auto_11793 ?auto_11794 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11825 - SURFACE
      ?auto_11826 - SURFACE
    )
    :vars
    (
      ?auto_11827 - HOIST
      ?auto_11828 - PLACE
      ?auto_11830 - PLACE
      ?auto_11831 - HOIST
      ?auto_11832 - SURFACE
      ?auto_11829 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11827 ?auto_11828 ) ( SURFACE-AT ?auto_11825 ?auto_11828 ) ( CLEAR ?auto_11825 ) ( IS-CRATE ?auto_11826 ) ( AVAILABLE ?auto_11827 ) ( not ( = ?auto_11830 ?auto_11828 ) ) ( HOIST-AT ?auto_11831 ?auto_11830 ) ( AVAILABLE ?auto_11831 ) ( SURFACE-AT ?auto_11826 ?auto_11830 ) ( ON ?auto_11826 ?auto_11832 ) ( CLEAR ?auto_11826 ) ( TRUCK-AT ?auto_11829 ?auto_11828 ) ( not ( = ?auto_11825 ?auto_11826 ) ) ( not ( = ?auto_11825 ?auto_11832 ) ) ( not ( = ?auto_11826 ?auto_11832 ) ) ( not ( = ?auto_11827 ?auto_11831 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11829 ?auto_11828 ?auto_11830 )
      ( !LIFT ?auto_11831 ?auto_11826 ?auto_11832 ?auto_11830 )
      ( !LOAD ?auto_11831 ?auto_11826 ?auto_11829 ?auto_11830 )
      ( !DRIVE ?auto_11829 ?auto_11830 ?auto_11828 )
      ( !UNLOAD ?auto_11827 ?auto_11826 ?auto_11829 ?auto_11828 )
      ( !DROP ?auto_11827 ?auto_11826 ?auto_11825 ?auto_11828 )
      ( MAKE-1CRATE-VERIFY ?auto_11825 ?auto_11826 ) )
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
      ?auto_11855 - SURFACE
      ?auto_11854 - SURFACE
      ?auto_11853 - SURFACE
      ?auto_11856 - SURFACE
      ?auto_11857 - SURFACE
      ?auto_11858 - SURFACE
    )
    :vars
    (
      ?auto_11862 - HOIST
      ?auto_11864 - PLACE
      ?auto_11860 - PLACE
      ?auto_11859 - HOIST
      ?auto_11863 - SURFACE
      ?auto_11882 - PLACE
      ?auto_11885 - HOIST
      ?auto_11873 - SURFACE
      ?auto_11877 - PLACE
      ?auto_11876 - HOIST
      ?auto_11875 - SURFACE
      ?auto_11865 - PLACE
      ?auto_11870 - HOIST
      ?auto_11879 - SURFACE
      ?auto_11884 - PLACE
      ?auto_11867 - HOIST
      ?auto_11869 - SURFACE
      ?auto_11883 - SURFACE
      ?auto_11878 - PLACE
      ?auto_11868 - HOIST
      ?auto_11871 - SURFACE
      ?auto_11881 - SURFACE
      ?auto_11866 - SURFACE
      ?auto_11874 - SURFACE
      ?auto_11880 - PLACE
      ?auto_11872 - HOIST
      ?auto_11886 - SURFACE
      ?auto_11887 - SURFACE
      ?auto_11861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11862 ?auto_11864 ) ( IS-CRATE ?auto_11858 ) ( not ( = ?auto_11860 ?auto_11864 ) ) ( HOIST-AT ?auto_11859 ?auto_11860 ) ( SURFACE-AT ?auto_11858 ?auto_11860 ) ( ON ?auto_11858 ?auto_11863 ) ( CLEAR ?auto_11858 ) ( not ( = ?auto_11857 ?auto_11858 ) ) ( not ( = ?auto_11857 ?auto_11863 ) ) ( not ( = ?auto_11858 ?auto_11863 ) ) ( not ( = ?auto_11862 ?auto_11859 ) ) ( IS-CRATE ?auto_11857 ) ( not ( = ?auto_11882 ?auto_11864 ) ) ( HOIST-AT ?auto_11885 ?auto_11882 ) ( SURFACE-AT ?auto_11857 ?auto_11882 ) ( ON ?auto_11857 ?auto_11873 ) ( CLEAR ?auto_11857 ) ( not ( = ?auto_11856 ?auto_11857 ) ) ( not ( = ?auto_11856 ?auto_11873 ) ) ( not ( = ?auto_11857 ?auto_11873 ) ) ( not ( = ?auto_11862 ?auto_11885 ) ) ( IS-CRATE ?auto_11856 ) ( not ( = ?auto_11877 ?auto_11864 ) ) ( HOIST-AT ?auto_11876 ?auto_11877 ) ( AVAILABLE ?auto_11876 ) ( SURFACE-AT ?auto_11856 ?auto_11877 ) ( ON ?auto_11856 ?auto_11875 ) ( CLEAR ?auto_11856 ) ( not ( = ?auto_11853 ?auto_11856 ) ) ( not ( = ?auto_11853 ?auto_11875 ) ) ( not ( = ?auto_11856 ?auto_11875 ) ) ( not ( = ?auto_11862 ?auto_11876 ) ) ( IS-CRATE ?auto_11853 ) ( not ( = ?auto_11865 ?auto_11864 ) ) ( HOIST-AT ?auto_11870 ?auto_11865 ) ( SURFACE-AT ?auto_11853 ?auto_11865 ) ( ON ?auto_11853 ?auto_11879 ) ( CLEAR ?auto_11853 ) ( not ( = ?auto_11854 ?auto_11853 ) ) ( not ( = ?auto_11854 ?auto_11879 ) ) ( not ( = ?auto_11853 ?auto_11879 ) ) ( not ( = ?auto_11862 ?auto_11870 ) ) ( IS-CRATE ?auto_11854 ) ( not ( = ?auto_11884 ?auto_11864 ) ) ( HOIST-AT ?auto_11867 ?auto_11884 ) ( AVAILABLE ?auto_11867 ) ( SURFACE-AT ?auto_11854 ?auto_11884 ) ( ON ?auto_11854 ?auto_11869 ) ( CLEAR ?auto_11854 ) ( not ( = ?auto_11855 ?auto_11854 ) ) ( not ( = ?auto_11855 ?auto_11869 ) ) ( not ( = ?auto_11854 ?auto_11869 ) ) ( not ( = ?auto_11862 ?auto_11867 ) ) ( IS-CRATE ?auto_11855 ) ( AVAILABLE ?auto_11859 ) ( SURFACE-AT ?auto_11855 ?auto_11860 ) ( ON ?auto_11855 ?auto_11883 ) ( CLEAR ?auto_11855 ) ( not ( = ?auto_11852 ?auto_11855 ) ) ( not ( = ?auto_11852 ?auto_11883 ) ) ( not ( = ?auto_11855 ?auto_11883 ) ) ( IS-CRATE ?auto_11852 ) ( not ( = ?auto_11878 ?auto_11864 ) ) ( HOIST-AT ?auto_11868 ?auto_11878 ) ( SURFACE-AT ?auto_11852 ?auto_11878 ) ( ON ?auto_11852 ?auto_11871 ) ( CLEAR ?auto_11852 ) ( not ( = ?auto_11851 ?auto_11852 ) ) ( not ( = ?auto_11851 ?auto_11871 ) ) ( not ( = ?auto_11852 ?auto_11871 ) ) ( not ( = ?auto_11862 ?auto_11868 ) ) ( IS-CRATE ?auto_11851 ) ( SURFACE-AT ?auto_11851 ?auto_11878 ) ( ON ?auto_11851 ?auto_11881 ) ( CLEAR ?auto_11851 ) ( not ( = ?auto_11850 ?auto_11851 ) ) ( not ( = ?auto_11850 ?auto_11881 ) ) ( not ( = ?auto_11851 ?auto_11881 ) ) ( IS-CRATE ?auto_11850 ) ( AVAILABLE ?auto_11868 ) ( SURFACE-AT ?auto_11850 ?auto_11878 ) ( ON ?auto_11850 ?auto_11866 ) ( CLEAR ?auto_11850 ) ( not ( = ?auto_11849 ?auto_11850 ) ) ( not ( = ?auto_11849 ?auto_11866 ) ) ( not ( = ?auto_11850 ?auto_11866 ) ) ( IS-CRATE ?auto_11849 ) ( AVAILABLE ?auto_11870 ) ( SURFACE-AT ?auto_11849 ?auto_11865 ) ( ON ?auto_11849 ?auto_11874 ) ( CLEAR ?auto_11849 ) ( not ( = ?auto_11848 ?auto_11849 ) ) ( not ( = ?auto_11848 ?auto_11874 ) ) ( not ( = ?auto_11849 ?auto_11874 ) ) ( IS-CRATE ?auto_11848 ) ( not ( = ?auto_11880 ?auto_11864 ) ) ( HOIST-AT ?auto_11872 ?auto_11880 ) ( AVAILABLE ?auto_11872 ) ( SURFACE-AT ?auto_11848 ?auto_11880 ) ( ON ?auto_11848 ?auto_11886 ) ( CLEAR ?auto_11848 ) ( not ( = ?auto_11847 ?auto_11848 ) ) ( not ( = ?auto_11847 ?auto_11886 ) ) ( not ( = ?auto_11848 ?auto_11886 ) ) ( not ( = ?auto_11862 ?auto_11872 ) ) ( SURFACE-AT ?auto_11846 ?auto_11864 ) ( CLEAR ?auto_11846 ) ( IS-CRATE ?auto_11847 ) ( AVAILABLE ?auto_11862 ) ( AVAILABLE ?auto_11885 ) ( SURFACE-AT ?auto_11847 ?auto_11882 ) ( ON ?auto_11847 ?auto_11887 ) ( CLEAR ?auto_11847 ) ( TRUCK-AT ?auto_11861 ?auto_11864 ) ( not ( = ?auto_11846 ?auto_11847 ) ) ( not ( = ?auto_11846 ?auto_11887 ) ) ( not ( = ?auto_11847 ?auto_11887 ) ) ( not ( = ?auto_11846 ?auto_11848 ) ) ( not ( = ?auto_11846 ?auto_11886 ) ) ( not ( = ?auto_11848 ?auto_11887 ) ) ( not ( = ?auto_11880 ?auto_11882 ) ) ( not ( = ?auto_11872 ?auto_11885 ) ) ( not ( = ?auto_11886 ?auto_11887 ) ) ( not ( = ?auto_11846 ?auto_11849 ) ) ( not ( = ?auto_11846 ?auto_11874 ) ) ( not ( = ?auto_11847 ?auto_11849 ) ) ( not ( = ?auto_11847 ?auto_11874 ) ) ( not ( = ?auto_11849 ?auto_11886 ) ) ( not ( = ?auto_11849 ?auto_11887 ) ) ( not ( = ?auto_11865 ?auto_11880 ) ) ( not ( = ?auto_11865 ?auto_11882 ) ) ( not ( = ?auto_11870 ?auto_11872 ) ) ( not ( = ?auto_11870 ?auto_11885 ) ) ( not ( = ?auto_11874 ?auto_11886 ) ) ( not ( = ?auto_11874 ?auto_11887 ) ) ( not ( = ?auto_11846 ?auto_11850 ) ) ( not ( = ?auto_11846 ?auto_11866 ) ) ( not ( = ?auto_11847 ?auto_11850 ) ) ( not ( = ?auto_11847 ?auto_11866 ) ) ( not ( = ?auto_11848 ?auto_11850 ) ) ( not ( = ?auto_11848 ?auto_11866 ) ) ( not ( = ?auto_11850 ?auto_11874 ) ) ( not ( = ?auto_11850 ?auto_11886 ) ) ( not ( = ?auto_11850 ?auto_11887 ) ) ( not ( = ?auto_11878 ?auto_11865 ) ) ( not ( = ?auto_11878 ?auto_11880 ) ) ( not ( = ?auto_11878 ?auto_11882 ) ) ( not ( = ?auto_11868 ?auto_11870 ) ) ( not ( = ?auto_11868 ?auto_11872 ) ) ( not ( = ?auto_11868 ?auto_11885 ) ) ( not ( = ?auto_11866 ?auto_11874 ) ) ( not ( = ?auto_11866 ?auto_11886 ) ) ( not ( = ?auto_11866 ?auto_11887 ) ) ( not ( = ?auto_11846 ?auto_11851 ) ) ( not ( = ?auto_11846 ?auto_11881 ) ) ( not ( = ?auto_11847 ?auto_11851 ) ) ( not ( = ?auto_11847 ?auto_11881 ) ) ( not ( = ?auto_11848 ?auto_11851 ) ) ( not ( = ?auto_11848 ?auto_11881 ) ) ( not ( = ?auto_11849 ?auto_11851 ) ) ( not ( = ?auto_11849 ?auto_11881 ) ) ( not ( = ?auto_11851 ?auto_11866 ) ) ( not ( = ?auto_11851 ?auto_11874 ) ) ( not ( = ?auto_11851 ?auto_11886 ) ) ( not ( = ?auto_11851 ?auto_11887 ) ) ( not ( = ?auto_11881 ?auto_11866 ) ) ( not ( = ?auto_11881 ?auto_11874 ) ) ( not ( = ?auto_11881 ?auto_11886 ) ) ( not ( = ?auto_11881 ?auto_11887 ) ) ( not ( = ?auto_11846 ?auto_11852 ) ) ( not ( = ?auto_11846 ?auto_11871 ) ) ( not ( = ?auto_11847 ?auto_11852 ) ) ( not ( = ?auto_11847 ?auto_11871 ) ) ( not ( = ?auto_11848 ?auto_11852 ) ) ( not ( = ?auto_11848 ?auto_11871 ) ) ( not ( = ?auto_11849 ?auto_11852 ) ) ( not ( = ?auto_11849 ?auto_11871 ) ) ( not ( = ?auto_11850 ?auto_11852 ) ) ( not ( = ?auto_11850 ?auto_11871 ) ) ( not ( = ?auto_11852 ?auto_11881 ) ) ( not ( = ?auto_11852 ?auto_11866 ) ) ( not ( = ?auto_11852 ?auto_11874 ) ) ( not ( = ?auto_11852 ?auto_11886 ) ) ( not ( = ?auto_11852 ?auto_11887 ) ) ( not ( = ?auto_11871 ?auto_11881 ) ) ( not ( = ?auto_11871 ?auto_11866 ) ) ( not ( = ?auto_11871 ?auto_11874 ) ) ( not ( = ?auto_11871 ?auto_11886 ) ) ( not ( = ?auto_11871 ?auto_11887 ) ) ( not ( = ?auto_11846 ?auto_11855 ) ) ( not ( = ?auto_11846 ?auto_11883 ) ) ( not ( = ?auto_11847 ?auto_11855 ) ) ( not ( = ?auto_11847 ?auto_11883 ) ) ( not ( = ?auto_11848 ?auto_11855 ) ) ( not ( = ?auto_11848 ?auto_11883 ) ) ( not ( = ?auto_11849 ?auto_11855 ) ) ( not ( = ?auto_11849 ?auto_11883 ) ) ( not ( = ?auto_11850 ?auto_11855 ) ) ( not ( = ?auto_11850 ?auto_11883 ) ) ( not ( = ?auto_11851 ?auto_11855 ) ) ( not ( = ?auto_11851 ?auto_11883 ) ) ( not ( = ?auto_11855 ?auto_11871 ) ) ( not ( = ?auto_11855 ?auto_11881 ) ) ( not ( = ?auto_11855 ?auto_11866 ) ) ( not ( = ?auto_11855 ?auto_11874 ) ) ( not ( = ?auto_11855 ?auto_11886 ) ) ( not ( = ?auto_11855 ?auto_11887 ) ) ( not ( = ?auto_11860 ?auto_11878 ) ) ( not ( = ?auto_11860 ?auto_11865 ) ) ( not ( = ?auto_11860 ?auto_11880 ) ) ( not ( = ?auto_11860 ?auto_11882 ) ) ( not ( = ?auto_11859 ?auto_11868 ) ) ( not ( = ?auto_11859 ?auto_11870 ) ) ( not ( = ?auto_11859 ?auto_11872 ) ) ( not ( = ?auto_11859 ?auto_11885 ) ) ( not ( = ?auto_11883 ?auto_11871 ) ) ( not ( = ?auto_11883 ?auto_11881 ) ) ( not ( = ?auto_11883 ?auto_11866 ) ) ( not ( = ?auto_11883 ?auto_11874 ) ) ( not ( = ?auto_11883 ?auto_11886 ) ) ( not ( = ?auto_11883 ?auto_11887 ) ) ( not ( = ?auto_11846 ?auto_11854 ) ) ( not ( = ?auto_11846 ?auto_11869 ) ) ( not ( = ?auto_11847 ?auto_11854 ) ) ( not ( = ?auto_11847 ?auto_11869 ) ) ( not ( = ?auto_11848 ?auto_11854 ) ) ( not ( = ?auto_11848 ?auto_11869 ) ) ( not ( = ?auto_11849 ?auto_11854 ) ) ( not ( = ?auto_11849 ?auto_11869 ) ) ( not ( = ?auto_11850 ?auto_11854 ) ) ( not ( = ?auto_11850 ?auto_11869 ) ) ( not ( = ?auto_11851 ?auto_11854 ) ) ( not ( = ?auto_11851 ?auto_11869 ) ) ( not ( = ?auto_11852 ?auto_11854 ) ) ( not ( = ?auto_11852 ?auto_11869 ) ) ( not ( = ?auto_11854 ?auto_11883 ) ) ( not ( = ?auto_11854 ?auto_11871 ) ) ( not ( = ?auto_11854 ?auto_11881 ) ) ( not ( = ?auto_11854 ?auto_11866 ) ) ( not ( = ?auto_11854 ?auto_11874 ) ) ( not ( = ?auto_11854 ?auto_11886 ) ) ( not ( = ?auto_11854 ?auto_11887 ) ) ( not ( = ?auto_11884 ?auto_11860 ) ) ( not ( = ?auto_11884 ?auto_11878 ) ) ( not ( = ?auto_11884 ?auto_11865 ) ) ( not ( = ?auto_11884 ?auto_11880 ) ) ( not ( = ?auto_11884 ?auto_11882 ) ) ( not ( = ?auto_11867 ?auto_11859 ) ) ( not ( = ?auto_11867 ?auto_11868 ) ) ( not ( = ?auto_11867 ?auto_11870 ) ) ( not ( = ?auto_11867 ?auto_11872 ) ) ( not ( = ?auto_11867 ?auto_11885 ) ) ( not ( = ?auto_11869 ?auto_11883 ) ) ( not ( = ?auto_11869 ?auto_11871 ) ) ( not ( = ?auto_11869 ?auto_11881 ) ) ( not ( = ?auto_11869 ?auto_11866 ) ) ( not ( = ?auto_11869 ?auto_11874 ) ) ( not ( = ?auto_11869 ?auto_11886 ) ) ( not ( = ?auto_11869 ?auto_11887 ) ) ( not ( = ?auto_11846 ?auto_11853 ) ) ( not ( = ?auto_11846 ?auto_11879 ) ) ( not ( = ?auto_11847 ?auto_11853 ) ) ( not ( = ?auto_11847 ?auto_11879 ) ) ( not ( = ?auto_11848 ?auto_11853 ) ) ( not ( = ?auto_11848 ?auto_11879 ) ) ( not ( = ?auto_11849 ?auto_11853 ) ) ( not ( = ?auto_11849 ?auto_11879 ) ) ( not ( = ?auto_11850 ?auto_11853 ) ) ( not ( = ?auto_11850 ?auto_11879 ) ) ( not ( = ?auto_11851 ?auto_11853 ) ) ( not ( = ?auto_11851 ?auto_11879 ) ) ( not ( = ?auto_11852 ?auto_11853 ) ) ( not ( = ?auto_11852 ?auto_11879 ) ) ( not ( = ?auto_11855 ?auto_11853 ) ) ( not ( = ?auto_11855 ?auto_11879 ) ) ( not ( = ?auto_11853 ?auto_11869 ) ) ( not ( = ?auto_11853 ?auto_11883 ) ) ( not ( = ?auto_11853 ?auto_11871 ) ) ( not ( = ?auto_11853 ?auto_11881 ) ) ( not ( = ?auto_11853 ?auto_11866 ) ) ( not ( = ?auto_11853 ?auto_11874 ) ) ( not ( = ?auto_11853 ?auto_11886 ) ) ( not ( = ?auto_11853 ?auto_11887 ) ) ( not ( = ?auto_11879 ?auto_11869 ) ) ( not ( = ?auto_11879 ?auto_11883 ) ) ( not ( = ?auto_11879 ?auto_11871 ) ) ( not ( = ?auto_11879 ?auto_11881 ) ) ( not ( = ?auto_11879 ?auto_11866 ) ) ( not ( = ?auto_11879 ?auto_11874 ) ) ( not ( = ?auto_11879 ?auto_11886 ) ) ( not ( = ?auto_11879 ?auto_11887 ) ) ( not ( = ?auto_11846 ?auto_11856 ) ) ( not ( = ?auto_11846 ?auto_11875 ) ) ( not ( = ?auto_11847 ?auto_11856 ) ) ( not ( = ?auto_11847 ?auto_11875 ) ) ( not ( = ?auto_11848 ?auto_11856 ) ) ( not ( = ?auto_11848 ?auto_11875 ) ) ( not ( = ?auto_11849 ?auto_11856 ) ) ( not ( = ?auto_11849 ?auto_11875 ) ) ( not ( = ?auto_11850 ?auto_11856 ) ) ( not ( = ?auto_11850 ?auto_11875 ) ) ( not ( = ?auto_11851 ?auto_11856 ) ) ( not ( = ?auto_11851 ?auto_11875 ) ) ( not ( = ?auto_11852 ?auto_11856 ) ) ( not ( = ?auto_11852 ?auto_11875 ) ) ( not ( = ?auto_11855 ?auto_11856 ) ) ( not ( = ?auto_11855 ?auto_11875 ) ) ( not ( = ?auto_11854 ?auto_11856 ) ) ( not ( = ?auto_11854 ?auto_11875 ) ) ( not ( = ?auto_11856 ?auto_11879 ) ) ( not ( = ?auto_11856 ?auto_11869 ) ) ( not ( = ?auto_11856 ?auto_11883 ) ) ( not ( = ?auto_11856 ?auto_11871 ) ) ( not ( = ?auto_11856 ?auto_11881 ) ) ( not ( = ?auto_11856 ?auto_11866 ) ) ( not ( = ?auto_11856 ?auto_11874 ) ) ( not ( = ?auto_11856 ?auto_11886 ) ) ( not ( = ?auto_11856 ?auto_11887 ) ) ( not ( = ?auto_11877 ?auto_11865 ) ) ( not ( = ?auto_11877 ?auto_11884 ) ) ( not ( = ?auto_11877 ?auto_11860 ) ) ( not ( = ?auto_11877 ?auto_11878 ) ) ( not ( = ?auto_11877 ?auto_11880 ) ) ( not ( = ?auto_11877 ?auto_11882 ) ) ( not ( = ?auto_11876 ?auto_11870 ) ) ( not ( = ?auto_11876 ?auto_11867 ) ) ( not ( = ?auto_11876 ?auto_11859 ) ) ( not ( = ?auto_11876 ?auto_11868 ) ) ( not ( = ?auto_11876 ?auto_11872 ) ) ( not ( = ?auto_11876 ?auto_11885 ) ) ( not ( = ?auto_11875 ?auto_11879 ) ) ( not ( = ?auto_11875 ?auto_11869 ) ) ( not ( = ?auto_11875 ?auto_11883 ) ) ( not ( = ?auto_11875 ?auto_11871 ) ) ( not ( = ?auto_11875 ?auto_11881 ) ) ( not ( = ?auto_11875 ?auto_11866 ) ) ( not ( = ?auto_11875 ?auto_11874 ) ) ( not ( = ?auto_11875 ?auto_11886 ) ) ( not ( = ?auto_11875 ?auto_11887 ) ) ( not ( = ?auto_11846 ?auto_11857 ) ) ( not ( = ?auto_11846 ?auto_11873 ) ) ( not ( = ?auto_11847 ?auto_11857 ) ) ( not ( = ?auto_11847 ?auto_11873 ) ) ( not ( = ?auto_11848 ?auto_11857 ) ) ( not ( = ?auto_11848 ?auto_11873 ) ) ( not ( = ?auto_11849 ?auto_11857 ) ) ( not ( = ?auto_11849 ?auto_11873 ) ) ( not ( = ?auto_11850 ?auto_11857 ) ) ( not ( = ?auto_11850 ?auto_11873 ) ) ( not ( = ?auto_11851 ?auto_11857 ) ) ( not ( = ?auto_11851 ?auto_11873 ) ) ( not ( = ?auto_11852 ?auto_11857 ) ) ( not ( = ?auto_11852 ?auto_11873 ) ) ( not ( = ?auto_11855 ?auto_11857 ) ) ( not ( = ?auto_11855 ?auto_11873 ) ) ( not ( = ?auto_11854 ?auto_11857 ) ) ( not ( = ?auto_11854 ?auto_11873 ) ) ( not ( = ?auto_11853 ?auto_11857 ) ) ( not ( = ?auto_11853 ?auto_11873 ) ) ( not ( = ?auto_11857 ?auto_11875 ) ) ( not ( = ?auto_11857 ?auto_11879 ) ) ( not ( = ?auto_11857 ?auto_11869 ) ) ( not ( = ?auto_11857 ?auto_11883 ) ) ( not ( = ?auto_11857 ?auto_11871 ) ) ( not ( = ?auto_11857 ?auto_11881 ) ) ( not ( = ?auto_11857 ?auto_11866 ) ) ( not ( = ?auto_11857 ?auto_11874 ) ) ( not ( = ?auto_11857 ?auto_11886 ) ) ( not ( = ?auto_11857 ?auto_11887 ) ) ( not ( = ?auto_11873 ?auto_11875 ) ) ( not ( = ?auto_11873 ?auto_11879 ) ) ( not ( = ?auto_11873 ?auto_11869 ) ) ( not ( = ?auto_11873 ?auto_11883 ) ) ( not ( = ?auto_11873 ?auto_11871 ) ) ( not ( = ?auto_11873 ?auto_11881 ) ) ( not ( = ?auto_11873 ?auto_11866 ) ) ( not ( = ?auto_11873 ?auto_11874 ) ) ( not ( = ?auto_11873 ?auto_11886 ) ) ( not ( = ?auto_11873 ?auto_11887 ) ) ( not ( = ?auto_11846 ?auto_11858 ) ) ( not ( = ?auto_11846 ?auto_11863 ) ) ( not ( = ?auto_11847 ?auto_11858 ) ) ( not ( = ?auto_11847 ?auto_11863 ) ) ( not ( = ?auto_11848 ?auto_11858 ) ) ( not ( = ?auto_11848 ?auto_11863 ) ) ( not ( = ?auto_11849 ?auto_11858 ) ) ( not ( = ?auto_11849 ?auto_11863 ) ) ( not ( = ?auto_11850 ?auto_11858 ) ) ( not ( = ?auto_11850 ?auto_11863 ) ) ( not ( = ?auto_11851 ?auto_11858 ) ) ( not ( = ?auto_11851 ?auto_11863 ) ) ( not ( = ?auto_11852 ?auto_11858 ) ) ( not ( = ?auto_11852 ?auto_11863 ) ) ( not ( = ?auto_11855 ?auto_11858 ) ) ( not ( = ?auto_11855 ?auto_11863 ) ) ( not ( = ?auto_11854 ?auto_11858 ) ) ( not ( = ?auto_11854 ?auto_11863 ) ) ( not ( = ?auto_11853 ?auto_11858 ) ) ( not ( = ?auto_11853 ?auto_11863 ) ) ( not ( = ?auto_11856 ?auto_11858 ) ) ( not ( = ?auto_11856 ?auto_11863 ) ) ( not ( = ?auto_11858 ?auto_11873 ) ) ( not ( = ?auto_11858 ?auto_11875 ) ) ( not ( = ?auto_11858 ?auto_11879 ) ) ( not ( = ?auto_11858 ?auto_11869 ) ) ( not ( = ?auto_11858 ?auto_11883 ) ) ( not ( = ?auto_11858 ?auto_11871 ) ) ( not ( = ?auto_11858 ?auto_11881 ) ) ( not ( = ?auto_11858 ?auto_11866 ) ) ( not ( = ?auto_11858 ?auto_11874 ) ) ( not ( = ?auto_11858 ?auto_11886 ) ) ( not ( = ?auto_11858 ?auto_11887 ) ) ( not ( = ?auto_11863 ?auto_11873 ) ) ( not ( = ?auto_11863 ?auto_11875 ) ) ( not ( = ?auto_11863 ?auto_11879 ) ) ( not ( = ?auto_11863 ?auto_11869 ) ) ( not ( = ?auto_11863 ?auto_11883 ) ) ( not ( = ?auto_11863 ?auto_11871 ) ) ( not ( = ?auto_11863 ?auto_11881 ) ) ( not ( = ?auto_11863 ?auto_11866 ) ) ( not ( = ?auto_11863 ?auto_11874 ) ) ( not ( = ?auto_11863 ?auto_11886 ) ) ( not ( = ?auto_11863 ?auto_11887 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_11846 ?auto_11847 ?auto_11848 ?auto_11849 ?auto_11850 ?auto_11851 ?auto_11852 ?auto_11855 ?auto_11854 ?auto_11853 ?auto_11856 ?auto_11857 )
      ( MAKE-1CRATE ?auto_11857 ?auto_11858 )
      ( MAKE-12CRATE-VERIFY ?auto_11846 ?auto_11847 ?auto_11848 ?auto_11849 ?auto_11850 ?auto_11851 ?auto_11852 ?auto_11855 ?auto_11854 ?auto_11853 ?auto_11856 ?auto_11857 ?auto_11858 ) )
  )

)

