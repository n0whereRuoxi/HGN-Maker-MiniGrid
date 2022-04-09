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
      ?auto_11362 - SURFACE
      ?auto_11363 - SURFACE
    )
    :vars
    (
      ?auto_11364 - HOIST
      ?auto_11365 - PLACE
      ?auto_11367 - PLACE
      ?auto_11368 - HOIST
      ?auto_11369 - SURFACE
      ?auto_11366 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11364 ?auto_11365 ) ( SURFACE-AT ?auto_11362 ?auto_11365 ) ( CLEAR ?auto_11362 ) ( IS-CRATE ?auto_11363 ) ( AVAILABLE ?auto_11364 ) ( not ( = ?auto_11367 ?auto_11365 ) ) ( HOIST-AT ?auto_11368 ?auto_11367 ) ( AVAILABLE ?auto_11368 ) ( SURFACE-AT ?auto_11363 ?auto_11367 ) ( ON ?auto_11363 ?auto_11369 ) ( CLEAR ?auto_11363 ) ( TRUCK-AT ?auto_11366 ?auto_11365 ) ( not ( = ?auto_11362 ?auto_11363 ) ) ( not ( = ?auto_11362 ?auto_11369 ) ) ( not ( = ?auto_11363 ?auto_11369 ) ) ( not ( = ?auto_11364 ?auto_11368 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11366 ?auto_11365 ?auto_11367 )
      ( !LIFT ?auto_11368 ?auto_11363 ?auto_11369 ?auto_11367 )
      ( !LOAD ?auto_11368 ?auto_11363 ?auto_11366 ?auto_11367 )
      ( !DRIVE ?auto_11366 ?auto_11367 ?auto_11365 )
      ( !UNLOAD ?auto_11364 ?auto_11363 ?auto_11366 ?auto_11365 )
      ( !DROP ?auto_11364 ?auto_11363 ?auto_11362 ?auto_11365 )
      ( MAKE-1CRATE-VERIFY ?auto_11362 ?auto_11363 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11383 - SURFACE
      ?auto_11384 - SURFACE
      ?auto_11385 - SURFACE
    )
    :vars
    (
      ?auto_11389 - HOIST
      ?auto_11387 - PLACE
      ?auto_11391 - PLACE
      ?auto_11388 - HOIST
      ?auto_11386 - SURFACE
      ?auto_11392 - SURFACE
      ?auto_11390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11389 ?auto_11387 ) ( IS-CRATE ?auto_11385 ) ( not ( = ?auto_11391 ?auto_11387 ) ) ( HOIST-AT ?auto_11388 ?auto_11391 ) ( SURFACE-AT ?auto_11385 ?auto_11391 ) ( ON ?auto_11385 ?auto_11386 ) ( CLEAR ?auto_11385 ) ( not ( = ?auto_11384 ?auto_11385 ) ) ( not ( = ?auto_11384 ?auto_11386 ) ) ( not ( = ?auto_11385 ?auto_11386 ) ) ( not ( = ?auto_11389 ?auto_11388 ) ) ( SURFACE-AT ?auto_11383 ?auto_11387 ) ( CLEAR ?auto_11383 ) ( IS-CRATE ?auto_11384 ) ( AVAILABLE ?auto_11389 ) ( AVAILABLE ?auto_11388 ) ( SURFACE-AT ?auto_11384 ?auto_11391 ) ( ON ?auto_11384 ?auto_11392 ) ( CLEAR ?auto_11384 ) ( TRUCK-AT ?auto_11390 ?auto_11387 ) ( not ( = ?auto_11383 ?auto_11384 ) ) ( not ( = ?auto_11383 ?auto_11392 ) ) ( not ( = ?auto_11384 ?auto_11392 ) ) ( not ( = ?auto_11383 ?auto_11385 ) ) ( not ( = ?auto_11383 ?auto_11386 ) ) ( not ( = ?auto_11385 ?auto_11392 ) ) ( not ( = ?auto_11386 ?auto_11392 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11383 ?auto_11384 )
      ( MAKE-1CRATE ?auto_11384 ?auto_11385 )
      ( MAKE-2CRATE-VERIFY ?auto_11383 ?auto_11384 ?auto_11385 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11407 - SURFACE
      ?auto_11408 - SURFACE
      ?auto_11409 - SURFACE
      ?auto_11410 - SURFACE
    )
    :vars
    (
      ?auto_11414 - HOIST
      ?auto_11415 - PLACE
      ?auto_11413 - PLACE
      ?auto_11416 - HOIST
      ?auto_11411 - SURFACE
      ?auto_11417 - PLACE
      ?auto_11419 - HOIST
      ?auto_11418 - SURFACE
      ?auto_11420 - SURFACE
      ?auto_11412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11414 ?auto_11415 ) ( IS-CRATE ?auto_11410 ) ( not ( = ?auto_11413 ?auto_11415 ) ) ( HOIST-AT ?auto_11416 ?auto_11413 ) ( AVAILABLE ?auto_11416 ) ( SURFACE-AT ?auto_11410 ?auto_11413 ) ( ON ?auto_11410 ?auto_11411 ) ( CLEAR ?auto_11410 ) ( not ( = ?auto_11409 ?auto_11410 ) ) ( not ( = ?auto_11409 ?auto_11411 ) ) ( not ( = ?auto_11410 ?auto_11411 ) ) ( not ( = ?auto_11414 ?auto_11416 ) ) ( IS-CRATE ?auto_11409 ) ( not ( = ?auto_11417 ?auto_11415 ) ) ( HOIST-AT ?auto_11419 ?auto_11417 ) ( SURFACE-AT ?auto_11409 ?auto_11417 ) ( ON ?auto_11409 ?auto_11418 ) ( CLEAR ?auto_11409 ) ( not ( = ?auto_11408 ?auto_11409 ) ) ( not ( = ?auto_11408 ?auto_11418 ) ) ( not ( = ?auto_11409 ?auto_11418 ) ) ( not ( = ?auto_11414 ?auto_11419 ) ) ( SURFACE-AT ?auto_11407 ?auto_11415 ) ( CLEAR ?auto_11407 ) ( IS-CRATE ?auto_11408 ) ( AVAILABLE ?auto_11414 ) ( AVAILABLE ?auto_11419 ) ( SURFACE-AT ?auto_11408 ?auto_11417 ) ( ON ?auto_11408 ?auto_11420 ) ( CLEAR ?auto_11408 ) ( TRUCK-AT ?auto_11412 ?auto_11415 ) ( not ( = ?auto_11407 ?auto_11408 ) ) ( not ( = ?auto_11407 ?auto_11420 ) ) ( not ( = ?auto_11408 ?auto_11420 ) ) ( not ( = ?auto_11407 ?auto_11409 ) ) ( not ( = ?auto_11407 ?auto_11418 ) ) ( not ( = ?auto_11409 ?auto_11420 ) ) ( not ( = ?auto_11418 ?auto_11420 ) ) ( not ( = ?auto_11407 ?auto_11410 ) ) ( not ( = ?auto_11407 ?auto_11411 ) ) ( not ( = ?auto_11408 ?auto_11410 ) ) ( not ( = ?auto_11408 ?auto_11411 ) ) ( not ( = ?auto_11410 ?auto_11418 ) ) ( not ( = ?auto_11410 ?auto_11420 ) ) ( not ( = ?auto_11413 ?auto_11417 ) ) ( not ( = ?auto_11416 ?auto_11419 ) ) ( not ( = ?auto_11411 ?auto_11418 ) ) ( not ( = ?auto_11411 ?auto_11420 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11407 ?auto_11408 ?auto_11409 )
      ( MAKE-1CRATE ?auto_11409 ?auto_11410 )
      ( MAKE-3CRATE-VERIFY ?auto_11407 ?auto_11408 ?auto_11409 ?auto_11410 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11436 - SURFACE
      ?auto_11437 - SURFACE
      ?auto_11438 - SURFACE
      ?auto_11439 - SURFACE
      ?auto_11440 - SURFACE
    )
    :vars
    (
      ?auto_11442 - HOIST
      ?auto_11446 - PLACE
      ?auto_11444 - PLACE
      ?auto_11443 - HOIST
      ?auto_11441 - SURFACE
      ?auto_11452 - PLACE
      ?auto_11451 - HOIST
      ?auto_11453 - SURFACE
      ?auto_11450 - PLACE
      ?auto_11448 - HOIST
      ?auto_11449 - SURFACE
      ?auto_11447 - SURFACE
      ?auto_11445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11442 ?auto_11446 ) ( IS-CRATE ?auto_11440 ) ( not ( = ?auto_11444 ?auto_11446 ) ) ( HOIST-AT ?auto_11443 ?auto_11444 ) ( AVAILABLE ?auto_11443 ) ( SURFACE-AT ?auto_11440 ?auto_11444 ) ( ON ?auto_11440 ?auto_11441 ) ( CLEAR ?auto_11440 ) ( not ( = ?auto_11439 ?auto_11440 ) ) ( not ( = ?auto_11439 ?auto_11441 ) ) ( not ( = ?auto_11440 ?auto_11441 ) ) ( not ( = ?auto_11442 ?auto_11443 ) ) ( IS-CRATE ?auto_11439 ) ( not ( = ?auto_11452 ?auto_11446 ) ) ( HOIST-AT ?auto_11451 ?auto_11452 ) ( AVAILABLE ?auto_11451 ) ( SURFACE-AT ?auto_11439 ?auto_11452 ) ( ON ?auto_11439 ?auto_11453 ) ( CLEAR ?auto_11439 ) ( not ( = ?auto_11438 ?auto_11439 ) ) ( not ( = ?auto_11438 ?auto_11453 ) ) ( not ( = ?auto_11439 ?auto_11453 ) ) ( not ( = ?auto_11442 ?auto_11451 ) ) ( IS-CRATE ?auto_11438 ) ( not ( = ?auto_11450 ?auto_11446 ) ) ( HOIST-AT ?auto_11448 ?auto_11450 ) ( SURFACE-AT ?auto_11438 ?auto_11450 ) ( ON ?auto_11438 ?auto_11449 ) ( CLEAR ?auto_11438 ) ( not ( = ?auto_11437 ?auto_11438 ) ) ( not ( = ?auto_11437 ?auto_11449 ) ) ( not ( = ?auto_11438 ?auto_11449 ) ) ( not ( = ?auto_11442 ?auto_11448 ) ) ( SURFACE-AT ?auto_11436 ?auto_11446 ) ( CLEAR ?auto_11436 ) ( IS-CRATE ?auto_11437 ) ( AVAILABLE ?auto_11442 ) ( AVAILABLE ?auto_11448 ) ( SURFACE-AT ?auto_11437 ?auto_11450 ) ( ON ?auto_11437 ?auto_11447 ) ( CLEAR ?auto_11437 ) ( TRUCK-AT ?auto_11445 ?auto_11446 ) ( not ( = ?auto_11436 ?auto_11437 ) ) ( not ( = ?auto_11436 ?auto_11447 ) ) ( not ( = ?auto_11437 ?auto_11447 ) ) ( not ( = ?auto_11436 ?auto_11438 ) ) ( not ( = ?auto_11436 ?auto_11449 ) ) ( not ( = ?auto_11438 ?auto_11447 ) ) ( not ( = ?auto_11449 ?auto_11447 ) ) ( not ( = ?auto_11436 ?auto_11439 ) ) ( not ( = ?auto_11436 ?auto_11453 ) ) ( not ( = ?auto_11437 ?auto_11439 ) ) ( not ( = ?auto_11437 ?auto_11453 ) ) ( not ( = ?auto_11439 ?auto_11449 ) ) ( not ( = ?auto_11439 ?auto_11447 ) ) ( not ( = ?auto_11452 ?auto_11450 ) ) ( not ( = ?auto_11451 ?auto_11448 ) ) ( not ( = ?auto_11453 ?auto_11449 ) ) ( not ( = ?auto_11453 ?auto_11447 ) ) ( not ( = ?auto_11436 ?auto_11440 ) ) ( not ( = ?auto_11436 ?auto_11441 ) ) ( not ( = ?auto_11437 ?auto_11440 ) ) ( not ( = ?auto_11437 ?auto_11441 ) ) ( not ( = ?auto_11438 ?auto_11440 ) ) ( not ( = ?auto_11438 ?auto_11441 ) ) ( not ( = ?auto_11440 ?auto_11453 ) ) ( not ( = ?auto_11440 ?auto_11449 ) ) ( not ( = ?auto_11440 ?auto_11447 ) ) ( not ( = ?auto_11444 ?auto_11452 ) ) ( not ( = ?auto_11444 ?auto_11450 ) ) ( not ( = ?auto_11443 ?auto_11451 ) ) ( not ( = ?auto_11443 ?auto_11448 ) ) ( not ( = ?auto_11441 ?auto_11453 ) ) ( not ( = ?auto_11441 ?auto_11449 ) ) ( not ( = ?auto_11441 ?auto_11447 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_11436 ?auto_11437 ?auto_11438 ?auto_11439 )
      ( MAKE-1CRATE ?auto_11439 ?auto_11440 )
      ( MAKE-4CRATE-VERIFY ?auto_11436 ?auto_11437 ?auto_11438 ?auto_11439 ?auto_11440 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_11470 - SURFACE
      ?auto_11471 - SURFACE
      ?auto_11472 - SURFACE
      ?auto_11473 - SURFACE
      ?auto_11474 - SURFACE
      ?auto_11475 - SURFACE
    )
    :vars
    (
      ?auto_11477 - HOIST
      ?auto_11479 - PLACE
      ?auto_11476 - PLACE
      ?auto_11480 - HOIST
      ?auto_11478 - SURFACE
      ?auto_11486 - PLACE
      ?auto_11482 - HOIST
      ?auto_11485 - SURFACE
      ?auto_11484 - PLACE
      ?auto_11483 - HOIST
      ?auto_11487 - SURFACE
      ?auto_11491 - PLACE
      ?auto_11490 - HOIST
      ?auto_11489 - SURFACE
      ?auto_11488 - SURFACE
      ?auto_11481 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11477 ?auto_11479 ) ( IS-CRATE ?auto_11475 ) ( not ( = ?auto_11476 ?auto_11479 ) ) ( HOIST-AT ?auto_11480 ?auto_11476 ) ( AVAILABLE ?auto_11480 ) ( SURFACE-AT ?auto_11475 ?auto_11476 ) ( ON ?auto_11475 ?auto_11478 ) ( CLEAR ?auto_11475 ) ( not ( = ?auto_11474 ?auto_11475 ) ) ( not ( = ?auto_11474 ?auto_11478 ) ) ( not ( = ?auto_11475 ?auto_11478 ) ) ( not ( = ?auto_11477 ?auto_11480 ) ) ( IS-CRATE ?auto_11474 ) ( not ( = ?auto_11486 ?auto_11479 ) ) ( HOIST-AT ?auto_11482 ?auto_11486 ) ( AVAILABLE ?auto_11482 ) ( SURFACE-AT ?auto_11474 ?auto_11486 ) ( ON ?auto_11474 ?auto_11485 ) ( CLEAR ?auto_11474 ) ( not ( = ?auto_11473 ?auto_11474 ) ) ( not ( = ?auto_11473 ?auto_11485 ) ) ( not ( = ?auto_11474 ?auto_11485 ) ) ( not ( = ?auto_11477 ?auto_11482 ) ) ( IS-CRATE ?auto_11473 ) ( not ( = ?auto_11484 ?auto_11479 ) ) ( HOIST-AT ?auto_11483 ?auto_11484 ) ( AVAILABLE ?auto_11483 ) ( SURFACE-AT ?auto_11473 ?auto_11484 ) ( ON ?auto_11473 ?auto_11487 ) ( CLEAR ?auto_11473 ) ( not ( = ?auto_11472 ?auto_11473 ) ) ( not ( = ?auto_11472 ?auto_11487 ) ) ( not ( = ?auto_11473 ?auto_11487 ) ) ( not ( = ?auto_11477 ?auto_11483 ) ) ( IS-CRATE ?auto_11472 ) ( not ( = ?auto_11491 ?auto_11479 ) ) ( HOIST-AT ?auto_11490 ?auto_11491 ) ( SURFACE-AT ?auto_11472 ?auto_11491 ) ( ON ?auto_11472 ?auto_11489 ) ( CLEAR ?auto_11472 ) ( not ( = ?auto_11471 ?auto_11472 ) ) ( not ( = ?auto_11471 ?auto_11489 ) ) ( not ( = ?auto_11472 ?auto_11489 ) ) ( not ( = ?auto_11477 ?auto_11490 ) ) ( SURFACE-AT ?auto_11470 ?auto_11479 ) ( CLEAR ?auto_11470 ) ( IS-CRATE ?auto_11471 ) ( AVAILABLE ?auto_11477 ) ( AVAILABLE ?auto_11490 ) ( SURFACE-AT ?auto_11471 ?auto_11491 ) ( ON ?auto_11471 ?auto_11488 ) ( CLEAR ?auto_11471 ) ( TRUCK-AT ?auto_11481 ?auto_11479 ) ( not ( = ?auto_11470 ?auto_11471 ) ) ( not ( = ?auto_11470 ?auto_11488 ) ) ( not ( = ?auto_11471 ?auto_11488 ) ) ( not ( = ?auto_11470 ?auto_11472 ) ) ( not ( = ?auto_11470 ?auto_11489 ) ) ( not ( = ?auto_11472 ?auto_11488 ) ) ( not ( = ?auto_11489 ?auto_11488 ) ) ( not ( = ?auto_11470 ?auto_11473 ) ) ( not ( = ?auto_11470 ?auto_11487 ) ) ( not ( = ?auto_11471 ?auto_11473 ) ) ( not ( = ?auto_11471 ?auto_11487 ) ) ( not ( = ?auto_11473 ?auto_11489 ) ) ( not ( = ?auto_11473 ?auto_11488 ) ) ( not ( = ?auto_11484 ?auto_11491 ) ) ( not ( = ?auto_11483 ?auto_11490 ) ) ( not ( = ?auto_11487 ?auto_11489 ) ) ( not ( = ?auto_11487 ?auto_11488 ) ) ( not ( = ?auto_11470 ?auto_11474 ) ) ( not ( = ?auto_11470 ?auto_11485 ) ) ( not ( = ?auto_11471 ?auto_11474 ) ) ( not ( = ?auto_11471 ?auto_11485 ) ) ( not ( = ?auto_11472 ?auto_11474 ) ) ( not ( = ?auto_11472 ?auto_11485 ) ) ( not ( = ?auto_11474 ?auto_11487 ) ) ( not ( = ?auto_11474 ?auto_11489 ) ) ( not ( = ?auto_11474 ?auto_11488 ) ) ( not ( = ?auto_11486 ?auto_11484 ) ) ( not ( = ?auto_11486 ?auto_11491 ) ) ( not ( = ?auto_11482 ?auto_11483 ) ) ( not ( = ?auto_11482 ?auto_11490 ) ) ( not ( = ?auto_11485 ?auto_11487 ) ) ( not ( = ?auto_11485 ?auto_11489 ) ) ( not ( = ?auto_11485 ?auto_11488 ) ) ( not ( = ?auto_11470 ?auto_11475 ) ) ( not ( = ?auto_11470 ?auto_11478 ) ) ( not ( = ?auto_11471 ?auto_11475 ) ) ( not ( = ?auto_11471 ?auto_11478 ) ) ( not ( = ?auto_11472 ?auto_11475 ) ) ( not ( = ?auto_11472 ?auto_11478 ) ) ( not ( = ?auto_11473 ?auto_11475 ) ) ( not ( = ?auto_11473 ?auto_11478 ) ) ( not ( = ?auto_11475 ?auto_11485 ) ) ( not ( = ?auto_11475 ?auto_11487 ) ) ( not ( = ?auto_11475 ?auto_11489 ) ) ( not ( = ?auto_11475 ?auto_11488 ) ) ( not ( = ?auto_11476 ?auto_11486 ) ) ( not ( = ?auto_11476 ?auto_11484 ) ) ( not ( = ?auto_11476 ?auto_11491 ) ) ( not ( = ?auto_11480 ?auto_11482 ) ) ( not ( = ?auto_11480 ?auto_11483 ) ) ( not ( = ?auto_11480 ?auto_11490 ) ) ( not ( = ?auto_11478 ?auto_11485 ) ) ( not ( = ?auto_11478 ?auto_11487 ) ) ( not ( = ?auto_11478 ?auto_11489 ) ) ( not ( = ?auto_11478 ?auto_11488 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_11470 ?auto_11471 ?auto_11472 ?auto_11473 ?auto_11474 )
      ( MAKE-1CRATE ?auto_11474 ?auto_11475 )
      ( MAKE-5CRATE-VERIFY ?auto_11470 ?auto_11471 ?auto_11472 ?auto_11473 ?auto_11474 ?auto_11475 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_11509 - SURFACE
      ?auto_11510 - SURFACE
      ?auto_11511 - SURFACE
      ?auto_11512 - SURFACE
      ?auto_11513 - SURFACE
      ?auto_11514 - SURFACE
      ?auto_11515 - SURFACE
    )
    :vars
    (
      ?auto_11517 - HOIST
      ?auto_11518 - PLACE
      ?auto_11516 - PLACE
      ?auto_11521 - HOIST
      ?auto_11519 - SURFACE
      ?auto_11526 - PLACE
      ?auto_11534 - HOIST
      ?auto_11529 - SURFACE
      ?auto_11522 - PLACE
      ?auto_11528 - HOIST
      ?auto_11530 - SURFACE
      ?auto_11525 - PLACE
      ?auto_11532 - HOIST
      ?auto_11531 - SURFACE
      ?auto_11527 - PLACE
      ?auto_11533 - HOIST
      ?auto_11524 - SURFACE
      ?auto_11523 - SURFACE
      ?auto_11520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11517 ?auto_11518 ) ( IS-CRATE ?auto_11515 ) ( not ( = ?auto_11516 ?auto_11518 ) ) ( HOIST-AT ?auto_11521 ?auto_11516 ) ( AVAILABLE ?auto_11521 ) ( SURFACE-AT ?auto_11515 ?auto_11516 ) ( ON ?auto_11515 ?auto_11519 ) ( CLEAR ?auto_11515 ) ( not ( = ?auto_11514 ?auto_11515 ) ) ( not ( = ?auto_11514 ?auto_11519 ) ) ( not ( = ?auto_11515 ?auto_11519 ) ) ( not ( = ?auto_11517 ?auto_11521 ) ) ( IS-CRATE ?auto_11514 ) ( not ( = ?auto_11526 ?auto_11518 ) ) ( HOIST-AT ?auto_11534 ?auto_11526 ) ( AVAILABLE ?auto_11534 ) ( SURFACE-AT ?auto_11514 ?auto_11526 ) ( ON ?auto_11514 ?auto_11529 ) ( CLEAR ?auto_11514 ) ( not ( = ?auto_11513 ?auto_11514 ) ) ( not ( = ?auto_11513 ?auto_11529 ) ) ( not ( = ?auto_11514 ?auto_11529 ) ) ( not ( = ?auto_11517 ?auto_11534 ) ) ( IS-CRATE ?auto_11513 ) ( not ( = ?auto_11522 ?auto_11518 ) ) ( HOIST-AT ?auto_11528 ?auto_11522 ) ( AVAILABLE ?auto_11528 ) ( SURFACE-AT ?auto_11513 ?auto_11522 ) ( ON ?auto_11513 ?auto_11530 ) ( CLEAR ?auto_11513 ) ( not ( = ?auto_11512 ?auto_11513 ) ) ( not ( = ?auto_11512 ?auto_11530 ) ) ( not ( = ?auto_11513 ?auto_11530 ) ) ( not ( = ?auto_11517 ?auto_11528 ) ) ( IS-CRATE ?auto_11512 ) ( not ( = ?auto_11525 ?auto_11518 ) ) ( HOIST-AT ?auto_11532 ?auto_11525 ) ( AVAILABLE ?auto_11532 ) ( SURFACE-AT ?auto_11512 ?auto_11525 ) ( ON ?auto_11512 ?auto_11531 ) ( CLEAR ?auto_11512 ) ( not ( = ?auto_11511 ?auto_11512 ) ) ( not ( = ?auto_11511 ?auto_11531 ) ) ( not ( = ?auto_11512 ?auto_11531 ) ) ( not ( = ?auto_11517 ?auto_11532 ) ) ( IS-CRATE ?auto_11511 ) ( not ( = ?auto_11527 ?auto_11518 ) ) ( HOIST-AT ?auto_11533 ?auto_11527 ) ( SURFACE-AT ?auto_11511 ?auto_11527 ) ( ON ?auto_11511 ?auto_11524 ) ( CLEAR ?auto_11511 ) ( not ( = ?auto_11510 ?auto_11511 ) ) ( not ( = ?auto_11510 ?auto_11524 ) ) ( not ( = ?auto_11511 ?auto_11524 ) ) ( not ( = ?auto_11517 ?auto_11533 ) ) ( SURFACE-AT ?auto_11509 ?auto_11518 ) ( CLEAR ?auto_11509 ) ( IS-CRATE ?auto_11510 ) ( AVAILABLE ?auto_11517 ) ( AVAILABLE ?auto_11533 ) ( SURFACE-AT ?auto_11510 ?auto_11527 ) ( ON ?auto_11510 ?auto_11523 ) ( CLEAR ?auto_11510 ) ( TRUCK-AT ?auto_11520 ?auto_11518 ) ( not ( = ?auto_11509 ?auto_11510 ) ) ( not ( = ?auto_11509 ?auto_11523 ) ) ( not ( = ?auto_11510 ?auto_11523 ) ) ( not ( = ?auto_11509 ?auto_11511 ) ) ( not ( = ?auto_11509 ?auto_11524 ) ) ( not ( = ?auto_11511 ?auto_11523 ) ) ( not ( = ?auto_11524 ?auto_11523 ) ) ( not ( = ?auto_11509 ?auto_11512 ) ) ( not ( = ?auto_11509 ?auto_11531 ) ) ( not ( = ?auto_11510 ?auto_11512 ) ) ( not ( = ?auto_11510 ?auto_11531 ) ) ( not ( = ?auto_11512 ?auto_11524 ) ) ( not ( = ?auto_11512 ?auto_11523 ) ) ( not ( = ?auto_11525 ?auto_11527 ) ) ( not ( = ?auto_11532 ?auto_11533 ) ) ( not ( = ?auto_11531 ?auto_11524 ) ) ( not ( = ?auto_11531 ?auto_11523 ) ) ( not ( = ?auto_11509 ?auto_11513 ) ) ( not ( = ?auto_11509 ?auto_11530 ) ) ( not ( = ?auto_11510 ?auto_11513 ) ) ( not ( = ?auto_11510 ?auto_11530 ) ) ( not ( = ?auto_11511 ?auto_11513 ) ) ( not ( = ?auto_11511 ?auto_11530 ) ) ( not ( = ?auto_11513 ?auto_11531 ) ) ( not ( = ?auto_11513 ?auto_11524 ) ) ( not ( = ?auto_11513 ?auto_11523 ) ) ( not ( = ?auto_11522 ?auto_11525 ) ) ( not ( = ?auto_11522 ?auto_11527 ) ) ( not ( = ?auto_11528 ?auto_11532 ) ) ( not ( = ?auto_11528 ?auto_11533 ) ) ( not ( = ?auto_11530 ?auto_11531 ) ) ( not ( = ?auto_11530 ?auto_11524 ) ) ( not ( = ?auto_11530 ?auto_11523 ) ) ( not ( = ?auto_11509 ?auto_11514 ) ) ( not ( = ?auto_11509 ?auto_11529 ) ) ( not ( = ?auto_11510 ?auto_11514 ) ) ( not ( = ?auto_11510 ?auto_11529 ) ) ( not ( = ?auto_11511 ?auto_11514 ) ) ( not ( = ?auto_11511 ?auto_11529 ) ) ( not ( = ?auto_11512 ?auto_11514 ) ) ( not ( = ?auto_11512 ?auto_11529 ) ) ( not ( = ?auto_11514 ?auto_11530 ) ) ( not ( = ?auto_11514 ?auto_11531 ) ) ( not ( = ?auto_11514 ?auto_11524 ) ) ( not ( = ?auto_11514 ?auto_11523 ) ) ( not ( = ?auto_11526 ?auto_11522 ) ) ( not ( = ?auto_11526 ?auto_11525 ) ) ( not ( = ?auto_11526 ?auto_11527 ) ) ( not ( = ?auto_11534 ?auto_11528 ) ) ( not ( = ?auto_11534 ?auto_11532 ) ) ( not ( = ?auto_11534 ?auto_11533 ) ) ( not ( = ?auto_11529 ?auto_11530 ) ) ( not ( = ?auto_11529 ?auto_11531 ) ) ( not ( = ?auto_11529 ?auto_11524 ) ) ( not ( = ?auto_11529 ?auto_11523 ) ) ( not ( = ?auto_11509 ?auto_11515 ) ) ( not ( = ?auto_11509 ?auto_11519 ) ) ( not ( = ?auto_11510 ?auto_11515 ) ) ( not ( = ?auto_11510 ?auto_11519 ) ) ( not ( = ?auto_11511 ?auto_11515 ) ) ( not ( = ?auto_11511 ?auto_11519 ) ) ( not ( = ?auto_11512 ?auto_11515 ) ) ( not ( = ?auto_11512 ?auto_11519 ) ) ( not ( = ?auto_11513 ?auto_11515 ) ) ( not ( = ?auto_11513 ?auto_11519 ) ) ( not ( = ?auto_11515 ?auto_11529 ) ) ( not ( = ?auto_11515 ?auto_11530 ) ) ( not ( = ?auto_11515 ?auto_11531 ) ) ( not ( = ?auto_11515 ?auto_11524 ) ) ( not ( = ?auto_11515 ?auto_11523 ) ) ( not ( = ?auto_11516 ?auto_11526 ) ) ( not ( = ?auto_11516 ?auto_11522 ) ) ( not ( = ?auto_11516 ?auto_11525 ) ) ( not ( = ?auto_11516 ?auto_11527 ) ) ( not ( = ?auto_11521 ?auto_11534 ) ) ( not ( = ?auto_11521 ?auto_11528 ) ) ( not ( = ?auto_11521 ?auto_11532 ) ) ( not ( = ?auto_11521 ?auto_11533 ) ) ( not ( = ?auto_11519 ?auto_11529 ) ) ( not ( = ?auto_11519 ?auto_11530 ) ) ( not ( = ?auto_11519 ?auto_11531 ) ) ( not ( = ?auto_11519 ?auto_11524 ) ) ( not ( = ?auto_11519 ?auto_11523 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_11509 ?auto_11510 ?auto_11511 ?auto_11512 ?auto_11513 ?auto_11514 )
      ( MAKE-1CRATE ?auto_11514 ?auto_11515 )
      ( MAKE-6CRATE-VERIFY ?auto_11509 ?auto_11510 ?auto_11511 ?auto_11512 ?auto_11513 ?auto_11514 ?auto_11515 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_11553 - SURFACE
      ?auto_11554 - SURFACE
      ?auto_11555 - SURFACE
      ?auto_11556 - SURFACE
      ?auto_11557 - SURFACE
      ?auto_11558 - SURFACE
      ?auto_11559 - SURFACE
      ?auto_11560 - SURFACE
    )
    :vars
    (
      ?auto_11561 - HOIST
      ?auto_11563 - PLACE
      ?auto_11565 - PLACE
      ?auto_11566 - HOIST
      ?auto_11564 - SURFACE
      ?auto_11580 - PLACE
      ?auto_11567 - HOIST
      ?auto_11577 - SURFACE
      ?auto_11578 - SURFACE
      ?auto_11576 - PLACE
      ?auto_11571 - HOIST
      ?auto_11572 - SURFACE
      ?auto_11574 - PLACE
      ?auto_11575 - HOIST
      ?auto_11568 - SURFACE
      ?auto_11573 - PLACE
      ?auto_11570 - HOIST
      ?auto_11579 - SURFACE
      ?auto_11569 - SURFACE
      ?auto_11562 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11561 ?auto_11563 ) ( IS-CRATE ?auto_11560 ) ( not ( = ?auto_11565 ?auto_11563 ) ) ( HOIST-AT ?auto_11566 ?auto_11565 ) ( SURFACE-AT ?auto_11560 ?auto_11565 ) ( ON ?auto_11560 ?auto_11564 ) ( CLEAR ?auto_11560 ) ( not ( = ?auto_11559 ?auto_11560 ) ) ( not ( = ?auto_11559 ?auto_11564 ) ) ( not ( = ?auto_11560 ?auto_11564 ) ) ( not ( = ?auto_11561 ?auto_11566 ) ) ( IS-CRATE ?auto_11559 ) ( not ( = ?auto_11580 ?auto_11563 ) ) ( HOIST-AT ?auto_11567 ?auto_11580 ) ( AVAILABLE ?auto_11567 ) ( SURFACE-AT ?auto_11559 ?auto_11580 ) ( ON ?auto_11559 ?auto_11577 ) ( CLEAR ?auto_11559 ) ( not ( = ?auto_11558 ?auto_11559 ) ) ( not ( = ?auto_11558 ?auto_11577 ) ) ( not ( = ?auto_11559 ?auto_11577 ) ) ( not ( = ?auto_11561 ?auto_11567 ) ) ( IS-CRATE ?auto_11558 ) ( AVAILABLE ?auto_11566 ) ( SURFACE-AT ?auto_11558 ?auto_11565 ) ( ON ?auto_11558 ?auto_11578 ) ( CLEAR ?auto_11558 ) ( not ( = ?auto_11557 ?auto_11558 ) ) ( not ( = ?auto_11557 ?auto_11578 ) ) ( not ( = ?auto_11558 ?auto_11578 ) ) ( IS-CRATE ?auto_11557 ) ( not ( = ?auto_11576 ?auto_11563 ) ) ( HOIST-AT ?auto_11571 ?auto_11576 ) ( AVAILABLE ?auto_11571 ) ( SURFACE-AT ?auto_11557 ?auto_11576 ) ( ON ?auto_11557 ?auto_11572 ) ( CLEAR ?auto_11557 ) ( not ( = ?auto_11556 ?auto_11557 ) ) ( not ( = ?auto_11556 ?auto_11572 ) ) ( not ( = ?auto_11557 ?auto_11572 ) ) ( not ( = ?auto_11561 ?auto_11571 ) ) ( IS-CRATE ?auto_11556 ) ( not ( = ?auto_11574 ?auto_11563 ) ) ( HOIST-AT ?auto_11575 ?auto_11574 ) ( AVAILABLE ?auto_11575 ) ( SURFACE-AT ?auto_11556 ?auto_11574 ) ( ON ?auto_11556 ?auto_11568 ) ( CLEAR ?auto_11556 ) ( not ( = ?auto_11555 ?auto_11556 ) ) ( not ( = ?auto_11555 ?auto_11568 ) ) ( not ( = ?auto_11556 ?auto_11568 ) ) ( not ( = ?auto_11561 ?auto_11575 ) ) ( IS-CRATE ?auto_11555 ) ( not ( = ?auto_11573 ?auto_11563 ) ) ( HOIST-AT ?auto_11570 ?auto_11573 ) ( SURFACE-AT ?auto_11555 ?auto_11573 ) ( ON ?auto_11555 ?auto_11579 ) ( CLEAR ?auto_11555 ) ( not ( = ?auto_11554 ?auto_11555 ) ) ( not ( = ?auto_11554 ?auto_11579 ) ) ( not ( = ?auto_11555 ?auto_11579 ) ) ( not ( = ?auto_11561 ?auto_11570 ) ) ( SURFACE-AT ?auto_11553 ?auto_11563 ) ( CLEAR ?auto_11553 ) ( IS-CRATE ?auto_11554 ) ( AVAILABLE ?auto_11561 ) ( AVAILABLE ?auto_11570 ) ( SURFACE-AT ?auto_11554 ?auto_11573 ) ( ON ?auto_11554 ?auto_11569 ) ( CLEAR ?auto_11554 ) ( TRUCK-AT ?auto_11562 ?auto_11563 ) ( not ( = ?auto_11553 ?auto_11554 ) ) ( not ( = ?auto_11553 ?auto_11569 ) ) ( not ( = ?auto_11554 ?auto_11569 ) ) ( not ( = ?auto_11553 ?auto_11555 ) ) ( not ( = ?auto_11553 ?auto_11579 ) ) ( not ( = ?auto_11555 ?auto_11569 ) ) ( not ( = ?auto_11579 ?auto_11569 ) ) ( not ( = ?auto_11553 ?auto_11556 ) ) ( not ( = ?auto_11553 ?auto_11568 ) ) ( not ( = ?auto_11554 ?auto_11556 ) ) ( not ( = ?auto_11554 ?auto_11568 ) ) ( not ( = ?auto_11556 ?auto_11579 ) ) ( not ( = ?auto_11556 ?auto_11569 ) ) ( not ( = ?auto_11574 ?auto_11573 ) ) ( not ( = ?auto_11575 ?auto_11570 ) ) ( not ( = ?auto_11568 ?auto_11579 ) ) ( not ( = ?auto_11568 ?auto_11569 ) ) ( not ( = ?auto_11553 ?auto_11557 ) ) ( not ( = ?auto_11553 ?auto_11572 ) ) ( not ( = ?auto_11554 ?auto_11557 ) ) ( not ( = ?auto_11554 ?auto_11572 ) ) ( not ( = ?auto_11555 ?auto_11557 ) ) ( not ( = ?auto_11555 ?auto_11572 ) ) ( not ( = ?auto_11557 ?auto_11568 ) ) ( not ( = ?auto_11557 ?auto_11579 ) ) ( not ( = ?auto_11557 ?auto_11569 ) ) ( not ( = ?auto_11576 ?auto_11574 ) ) ( not ( = ?auto_11576 ?auto_11573 ) ) ( not ( = ?auto_11571 ?auto_11575 ) ) ( not ( = ?auto_11571 ?auto_11570 ) ) ( not ( = ?auto_11572 ?auto_11568 ) ) ( not ( = ?auto_11572 ?auto_11579 ) ) ( not ( = ?auto_11572 ?auto_11569 ) ) ( not ( = ?auto_11553 ?auto_11558 ) ) ( not ( = ?auto_11553 ?auto_11578 ) ) ( not ( = ?auto_11554 ?auto_11558 ) ) ( not ( = ?auto_11554 ?auto_11578 ) ) ( not ( = ?auto_11555 ?auto_11558 ) ) ( not ( = ?auto_11555 ?auto_11578 ) ) ( not ( = ?auto_11556 ?auto_11558 ) ) ( not ( = ?auto_11556 ?auto_11578 ) ) ( not ( = ?auto_11558 ?auto_11572 ) ) ( not ( = ?auto_11558 ?auto_11568 ) ) ( not ( = ?auto_11558 ?auto_11579 ) ) ( not ( = ?auto_11558 ?auto_11569 ) ) ( not ( = ?auto_11565 ?auto_11576 ) ) ( not ( = ?auto_11565 ?auto_11574 ) ) ( not ( = ?auto_11565 ?auto_11573 ) ) ( not ( = ?auto_11566 ?auto_11571 ) ) ( not ( = ?auto_11566 ?auto_11575 ) ) ( not ( = ?auto_11566 ?auto_11570 ) ) ( not ( = ?auto_11578 ?auto_11572 ) ) ( not ( = ?auto_11578 ?auto_11568 ) ) ( not ( = ?auto_11578 ?auto_11579 ) ) ( not ( = ?auto_11578 ?auto_11569 ) ) ( not ( = ?auto_11553 ?auto_11559 ) ) ( not ( = ?auto_11553 ?auto_11577 ) ) ( not ( = ?auto_11554 ?auto_11559 ) ) ( not ( = ?auto_11554 ?auto_11577 ) ) ( not ( = ?auto_11555 ?auto_11559 ) ) ( not ( = ?auto_11555 ?auto_11577 ) ) ( not ( = ?auto_11556 ?auto_11559 ) ) ( not ( = ?auto_11556 ?auto_11577 ) ) ( not ( = ?auto_11557 ?auto_11559 ) ) ( not ( = ?auto_11557 ?auto_11577 ) ) ( not ( = ?auto_11559 ?auto_11578 ) ) ( not ( = ?auto_11559 ?auto_11572 ) ) ( not ( = ?auto_11559 ?auto_11568 ) ) ( not ( = ?auto_11559 ?auto_11579 ) ) ( not ( = ?auto_11559 ?auto_11569 ) ) ( not ( = ?auto_11580 ?auto_11565 ) ) ( not ( = ?auto_11580 ?auto_11576 ) ) ( not ( = ?auto_11580 ?auto_11574 ) ) ( not ( = ?auto_11580 ?auto_11573 ) ) ( not ( = ?auto_11567 ?auto_11566 ) ) ( not ( = ?auto_11567 ?auto_11571 ) ) ( not ( = ?auto_11567 ?auto_11575 ) ) ( not ( = ?auto_11567 ?auto_11570 ) ) ( not ( = ?auto_11577 ?auto_11578 ) ) ( not ( = ?auto_11577 ?auto_11572 ) ) ( not ( = ?auto_11577 ?auto_11568 ) ) ( not ( = ?auto_11577 ?auto_11579 ) ) ( not ( = ?auto_11577 ?auto_11569 ) ) ( not ( = ?auto_11553 ?auto_11560 ) ) ( not ( = ?auto_11553 ?auto_11564 ) ) ( not ( = ?auto_11554 ?auto_11560 ) ) ( not ( = ?auto_11554 ?auto_11564 ) ) ( not ( = ?auto_11555 ?auto_11560 ) ) ( not ( = ?auto_11555 ?auto_11564 ) ) ( not ( = ?auto_11556 ?auto_11560 ) ) ( not ( = ?auto_11556 ?auto_11564 ) ) ( not ( = ?auto_11557 ?auto_11560 ) ) ( not ( = ?auto_11557 ?auto_11564 ) ) ( not ( = ?auto_11558 ?auto_11560 ) ) ( not ( = ?auto_11558 ?auto_11564 ) ) ( not ( = ?auto_11560 ?auto_11577 ) ) ( not ( = ?auto_11560 ?auto_11578 ) ) ( not ( = ?auto_11560 ?auto_11572 ) ) ( not ( = ?auto_11560 ?auto_11568 ) ) ( not ( = ?auto_11560 ?auto_11579 ) ) ( not ( = ?auto_11560 ?auto_11569 ) ) ( not ( = ?auto_11564 ?auto_11577 ) ) ( not ( = ?auto_11564 ?auto_11578 ) ) ( not ( = ?auto_11564 ?auto_11572 ) ) ( not ( = ?auto_11564 ?auto_11568 ) ) ( not ( = ?auto_11564 ?auto_11579 ) ) ( not ( = ?auto_11564 ?auto_11569 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_11553 ?auto_11554 ?auto_11555 ?auto_11556 ?auto_11557 ?auto_11558 ?auto_11559 )
      ( MAKE-1CRATE ?auto_11559 ?auto_11560 )
      ( MAKE-7CRATE-VERIFY ?auto_11553 ?auto_11554 ?auto_11555 ?auto_11556 ?auto_11557 ?auto_11558 ?auto_11559 ?auto_11560 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_11600 - SURFACE
      ?auto_11601 - SURFACE
      ?auto_11602 - SURFACE
      ?auto_11603 - SURFACE
      ?auto_11604 - SURFACE
      ?auto_11605 - SURFACE
      ?auto_11606 - SURFACE
      ?auto_11607 - SURFACE
      ?auto_11608 - SURFACE
    )
    :vars
    (
      ?auto_11610 - HOIST
      ?auto_11611 - PLACE
      ?auto_11612 - PLACE
      ?auto_11614 - HOIST
      ?auto_11609 - SURFACE
      ?auto_11617 - PLACE
      ?auto_11626 - HOIST
      ?auto_11628 - SURFACE
      ?auto_11620 - PLACE
      ?auto_11624 - HOIST
      ?auto_11623 - SURFACE
      ?auto_11621 - SURFACE
      ?auto_11615 - PLACE
      ?auto_11618 - HOIST
      ?auto_11627 - SURFACE
      ?auto_11629 - SURFACE
      ?auto_11622 - PLACE
      ?auto_11619 - HOIST
      ?auto_11616 - SURFACE
      ?auto_11625 - SURFACE
      ?auto_11613 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11610 ?auto_11611 ) ( IS-CRATE ?auto_11608 ) ( not ( = ?auto_11612 ?auto_11611 ) ) ( HOIST-AT ?auto_11614 ?auto_11612 ) ( SURFACE-AT ?auto_11608 ?auto_11612 ) ( ON ?auto_11608 ?auto_11609 ) ( CLEAR ?auto_11608 ) ( not ( = ?auto_11607 ?auto_11608 ) ) ( not ( = ?auto_11607 ?auto_11609 ) ) ( not ( = ?auto_11608 ?auto_11609 ) ) ( not ( = ?auto_11610 ?auto_11614 ) ) ( IS-CRATE ?auto_11607 ) ( not ( = ?auto_11617 ?auto_11611 ) ) ( HOIST-AT ?auto_11626 ?auto_11617 ) ( SURFACE-AT ?auto_11607 ?auto_11617 ) ( ON ?auto_11607 ?auto_11628 ) ( CLEAR ?auto_11607 ) ( not ( = ?auto_11606 ?auto_11607 ) ) ( not ( = ?auto_11606 ?auto_11628 ) ) ( not ( = ?auto_11607 ?auto_11628 ) ) ( not ( = ?auto_11610 ?auto_11626 ) ) ( IS-CRATE ?auto_11606 ) ( not ( = ?auto_11620 ?auto_11611 ) ) ( HOIST-AT ?auto_11624 ?auto_11620 ) ( AVAILABLE ?auto_11624 ) ( SURFACE-AT ?auto_11606 ?auto_11620 ) ( ON ?auto_11606 ?auto_11623 ) ( CLEAR ?auto_11606 ) ( not ( = ?auto_11605 ?auto_11606 ) ) ( not ( = ?auto_11605 ?auto_11623 ) ) ( not ( = ?auto_11606 ?auto_11623 ) ) ( not ( = ?auto_11610 ?auto_11624 ) ) ( IS-CRATE ?auto_11605 ) ( AVAILABLE ?auto_11626 ) ( SURFACE-AT ?auto_11605 ?auto_11617 ) ( ON ?auto_11605 ?auto_11621 ) ( CLEAR ?auto_11605 ) ( not ( = ?auto_11604 ?auto_11605 ) ) ( not ( = ?auto_11604 ?auto_11621 ) ) ( not ( = ?auto_11605 ?auto_11621 ) ) ( IS-CRATE ?auto_11604 ) ( not ( = ?auto_11615 ?auto_11611 ) ) ( HOIST-AT ?auto_11618 ?auto_11615 ) ( AVAILABLE ?auto_11618 ) ( SURFACE-AT ?auto_11604 ?auto_11615 ) ( ON ?auto_11604 ?auto_11627 ) ( CLEAR ?auto_11604 ) ( not ( = ?auto_11603 ?auto_11604 ) ) ( not ( = ?auto_11603 ?auto_11627 ) ) ( not ( = ?auto_11604 ?auto_11627 ) ) ( not ( = ?auto_11610 ?auto_11618 ) ) ( IS-CRATE ?auto_11603 ) ( AVAILABLE ?auto_11614 ) ( SURFACE-AT ?auto_11603 ?auto_11612 ) ( ON ?auto_11603 ?auto_11629 ) ( CLEAR ?auto_11603 ) ( not ( = ?auto_11602 ?auto_11603 ) ) ( not ( = ?auto_11602 ?auto_11629 ) ) ( not ( = ?auto_11603 ?auto_11629 ) ) ( IS-CRATE ?auto_11602 ) ( not ( = ?auto_11622 ?auto_11611 ) ) ( HOIST-AT ?auto_11619 ?auto_11622 ) ( SURFACE-AT ?auto_11602 ?auto_11622 ) ( ON ?auto_11602 ?auto_11616 ) ( CLEAR ?auto_11602 ) ( not ( = ?auto_11601 ?auto_11602 ) ) ( not ( = ?auto_11601 ?auto_11616 ) ) ( not ( = ?auto_11602 ?auto_11616 ) ) ( not ( = ?auto_11610 ?auto_11619 ) ) ( SURFACE-AT ?auto_11600 ?auto_11611 ) ( CLEAR ?auto_11600 ) ( IS-CRATE ?auto_11601 ) ( AVAILABLE ?auto_11610 ) ( AVAILABLE ?auto_11619 ) ( SURFACE-AT ?auto_11601 ?auto_11622 ) ( ON ?auto_11601 ?auto_11625 ) ( CLEAR ?auto_11601 ) ( TRUCK-AT ?auto_11613 ?auto_11611 ) ( not ( = ?auto_11600 ?auto_11601 ) ) ( not ( = ?auto_11600 ?auto_11625 ) ) ( not ( = ?auto_11601 ?auto_11625 ) ) ( not ( = ?auto_11600 ?auto_11602 ) ) ( not ( = ?auto_11600 ?auto_11616 ) ) ( not ( = ?auto_11602 ?auto_11625 ) ) ( not ( = ?auto_11616 ?auto_11625 ) ) ( not ( = ?auto_11600 ?auto_11603 ) ) ( not ( = ?auto_11600 ?auto_11629 ) ) ( not ( = ?auto_11601 ?auto_11603 ) ) ( not ( = ?auto_11601 ?auto_11629 ) ) ( not ( = ?auto_11603 ?auto_11616 ) ) ( not ( = ?auto_11603 ?auto_11625 ) ) ( not ( = ?auto_11612 ?auto_11622 ) ) ( not ( = ?auto_11614 ?auto_11619 ) ) ( not ( = ?auto_11629 ?auto_11616 ) ) ( not ( = ?auto_11629 ?auto_11625 ) ) ( not ( = ?auto_11600 ?auto_11604 ) ) ( not ( = ?auto_11600 ?auto_11627 ) ) ( not ( = ?auto_11601 ?auto_11604 ) ) ( not ( = ?auto_11601 ?auto_11627 ) ) ( not ( = ?auto_11602 ?auto_11604 ) ) ( not ( = ?auto_11602 ?auto_11627 ) ) ( not ( = ?auto_11604 ?auto_11629 ) ) ( not ( = ?auto_11604 ?auto_11616 ) ) ( not ( = ?auto_11604 ?auto_11625 ) ) ( not ( = ?auto_11615 ?auto_11612 ) ) ( not ( = ?auto_11615 ?auto_11622 ) ) ( not ( = ?auto_11618 ?auto_11614 ) ) ( not ( = ?auto_11618 ?auto_11619 ) ) ( not ( = ?auto_11627 ?auto_11629 ) ) ( not ( = ?auto_11627 ?auto_11616 ) ) ( not ( = ?auto_11627 ?auto_11625 ) ) ( not ( = ?auto_11600 ?auto_11605 ) ) ( not ( = ?auto_11600 ?auto_11621 ) ) ( not ( = ?auto_11601 ?auto_11605 ) ) ( not ( = ?auto_11601 ?auto_11621 ) ) ( not ( = ?auto_11602 ?auto_11605 ) ) ( not ( = ?auto_11602 ?auto_11621 ) ) ( not ( = ?auto_11603 ?auto_11605 ) ) ( not ( = ?auto_11603 ?auto_11621 ) ) ( not ( = ?auto_11605 ?auto_11627 ) ) ( not ( = ?auto_11605 ?auto_11629 ) ) ( not ( = ?auto_11605 ?auto_11616 ) ) ( not ( = ?auto_11605 ?auto_11625 ) ) ( not ( = ?auto_11617 ?auto_11615 ) ) ( not ( = ?auto_11617 ?auto_11612 ) ) ( not ( = ?auto_11617 ?auto_11622 ) ) ( not ( = ?auto_11626 ?auto_11618 ) ) ( not ( = ?auto_11626 ?auto_11614 ) ) ( not ( = ?auto_11626 ?auto_11619 ) ) ( not ( = ?auto_11621 ?auto_11627 ) ) ( not ( = ?auto_11621 ?auto_11629 ) ) ( not ( = ?auto_11621 ?auto_11616 ) ) ( not ( = ?auto_11621 ?auto_11625 ) ) ( not ( = ?auto_11600 ?auto_11606 ) ) ( not ( = ?auto_11600 ?auto_11623 ) ) ( not ( = ?auto_11601 ?auto_11606 ) ) ( not ( = ?auto_11601 ?auto_11623 ) ) ( not ( = ?auto_11602 ?auto_11606 ) ) ( not ( = ?auto_11602 ?auto_11623 ) ) ( not ( = ?auto_11603 ?auto_11606 ) ) ( not ( = ?auto_11603 ?auto_11623 ) ) ( not ( = ?auto_11604 ?auto_11606 ) ) ( not ( = ?auto_11604 ?auto_11623 ) ) ( not ( = ?auto_11606 ?auto_11621 ) ) ( not ( = ?auto_11606 ?auto_11627 ) ) ( not ( = ?auto_11606 ?auto_11629 ) ) ( not ( = ?auto_11606 ?auto_11616 ) ) ( not ( = ?auto_11606 ?auto_11625 ) ) ( not ( = ?auto_11620 ?auto_11617 ) ) ( not ( = ?auto_11620 ?auto_11615 ) ) ( not ( = ?auto_11620 ?auto_11612 ) ) ( not ( = ?auto_11620 ?auto_11622 ) ) ( not ( = ?auto_11624 ?auto_11626 ) ) ( not ( = ?auto_11624 ?auto_11618 ) ) ( not ( = ?auto_11624 ?auto_11614 ) ) ( not ( = ?auto_11624 ?auto_11619 ) ) ( not ( = ?auto_11623 ?auto_11621 ) ) ( not ( = ?auto_11623 ?auto_11627 ) ) ( not ( = ?auto_11623 ?auto_11629 ) ) ( not ( = ?auto_11623 ?auto_11616 ) ) ( not ( = ?auto_11623 ?auto_11625 ) ) ( not ( = ?auto_11600 ?auto_11607 ) ) ( not ( = ?auto_11600 ?auto_11628 ) ) ( not ( = ?auto_11601 ?auto_11607 ) ) ( not ( = ?auto_11601 ?auto_11628 ) ) ( not ( = ?auto_11602 ?auto_11607 ) ) ( not ( = ?auto_11602 ?auto_11628 ) ) ( not ( = ?auto_11603 ?auto_11607 ) ) ( not ( = ?auto_11603 ?auto_11628 ) ) ( not ( = ?auto_11604 ?auto_11607 ) ) ( not ( = ?auto_11604 ?auto_11628 ) ) ( not ( = ?auto_11605 ?auto_11607 ) ) ( not ( = ?auto_11605 ?auto_11628 ) ) ( not ( = ?auto_11607 ?auto_11623 ) ) ( not ( = ?auto_11607 ?auto_11621 ) ) ( not ( = ?auto_11607 ?auto_11627 ) ) ( not ( = ?auto_11607 ?auto_11629 ) ) ( not ( = ?auto_11607 ?auto_11616 ) ) ( not ( = ?auto_11607 ?auto_11625 ) ) ( not ( = ?auto_11628 ?auto_11623 ) ) ( not ( = ?auto_11628 ?auto_11621 ) ) ( not ( = ?auto_11628 ?auto_11627 ) ) ( not ( = ?auto_11628 ?auto_11629 ) ) ( not ( = ?auto_11628 ?auto_11616 ) ) ( not ( = ?auto_11628 ?auto_11625 ) ) ( not ( = ?auto_11600 ?auto_11608 ) ) ( not ( = ?auto_11600 ?auto_11609 ) ) ( not ( = ?auto_11601 ?auto_11608 ) ) ( not ( = ?auto_11601 ?auto_11609 ) ) ( not ( = ?auto_11602 ?auto_11608 ) ) ( not ( = ?auto_11602 ?auto_11609 ) ) ( not ( = ?auto_11603 ?auto_11608 ) ) ( not ( = ?auto_11603 ?auto_11609 ) ) ( not ( = ?auto_11604 ?auto_11608 ) ) ( not ( = ?auto_11604 ?auto_11609 ) ) ( not ( = ?auto_11605 ?auto_11608 ) ) ( not ( = ?auto_11605 ?auto_11609 ) ) ( not ( = ?auto_11606 ?auto_11608 ) ) ( not ( = ?auto_11606 ?auto_11609 ) ) ( not ( = ?auto_11608 ?auto_11628 ) ) ( not ( = ?auto_11608 ?auto_11623 ) ) ( not ( = ?auto_11608 ?auto_11621 ) ) ( not ( = ?auto_11608 ?auto_11627 ) ) ( not ( = ?auto_11608 ?auto_11629 ) ) ( not ( = ?auto_11608 ?auto_11616 ) ) ( not ( = ?auto_11608 ?auto_11625 ) ) ( not ( = ?auto_11609 ?auto_11628 ) ) ( not ( = ?auto_11609 ?auto_11623 ) ) ( not ( = ?auto_11609 ?auto_11621 ) ) ( not ( = ?auto_11609 ?auto_11627 ) ) ( not ( = ?auto_11609 ?auto_11629 ) ) ( not ( = ?auto_11609 ?auto_11616 ) ) ( not ( = ?auto_11609 ?auto_11625 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_11600 ?auto_11601 ?auto_11602 ?auto_11603 ?auto_11604 ?auto_11605 ?auto_11606 ?auto_11607 )
      ( MAKE-1CRATE ?auto_11607 ?auto_11608 )
      ( MAKE-8CRATE-VERIFY ?auto_11600 ?auto_11601 ?auto_11602 ?auto_11603 ?auto_11604 ?auto_11605 ?auto_11606 ?auto_11607 ?auto_11608 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_11650 - SURFACE
      ?auto_11651 - SURFACE
      ?auto_11652 - SURFACE
      ?auto_11653 - SURFACE
      ?auto_11654 - SURFACE
      ?auto_11655 - SURFACE
      ?auto_11656 - SURFACE
      ?auto_11657 - SURFACE
      ?auto_11658 - SURFACE
      ?auto_11659 - SURFACE
    )
    :vars
    (
      ?auto_11663 - HOIST
      ?auto_11662 - PLACE
      ?auto_11664 - PLACE
      ?auto_11665 - HOIST
      ?auto_11661 - SURFACE
      ?auto_11679 - PLACE
      ?auto_11682 - HOIST
      ?auto_11681 - SURFACE
      ?auto_11675 - PLACE
      ?auto_11678 - HOIST
      ?auto_11676 - SURFACE
      ?auto_11667 - PLACE
      ?auto_11680 - HOIST
      ?auto_11670 - SURFACE
      ?auto_11668 - SURFACE
      ?auto_11669 - PLACE
      ?auto_11674 - HOIST
      ?auto_11672 - SURFACE
      ?auto_11683 - SURFACE
      ?auto_11673 - PLACE
      ?auto_11677 - HOIST
      ?auto_11666 - SURFACE
      ?auto_11671 - SURFACE
      ?auto_11660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11663 ?auto_11662 ) ( IS-CRATE ?auto_11659 ) ( not ( = ?auto_11664 ?auto_11662 ) ) ( HOIST-AT ?auto_11665 ?auto_11664 ) ( AVAILABLE ?auto_11665 ) ( SURFACE-AT ?auto_11659 ?auto_11664 ) ( ON ?auto_11659 ?auto_11661 ) ( CLEAR ?auto_11659 ) ( not ( = ?auto_11658 ?auto_11659 ) ) ( not ( = ?auto_11658 ?auto_11661 ) ) ( not ( = ?auto_11659 ?auto_11661 ) ) ( not ( = ?auto_11663 ?auto_11665 ) ) ( IS-CRATE ?auto_11658 ) ( not ( = ?auto_11679 ?auto_11662 ) ) ( HOIST-AT ?auto_11682 ?auto_11679 ) ( SURFACE-AT ?auto_11658 ?auto_11679 ) ( ON ?auto_11658 ?auto_11681 ) ( CLEAR ?auto_11658 ) ( not ( = ?auto_11657 ?auto_11658 ) ) ( not ( = ?auto_11657 ?auto_11681 ) ) ( not ( = ?auto_11658 ?auto_11681 ) ) ( not ( = ?auto_11663 ?auto_11682 ) ) ( IS-CRATE ?auto_11657 ) ( not ( = ?auto_11675 ?auto_11662 ) ) ( HOIST-AT ?auto_11678 ?auto_11675 ) ( SURFACE-AT ?auto_11657 ?auto_11675 ) ( ON ?auto_11657 ?auto_11676 ) ( CLEAR ?auto_11657 ) ( not ( = ?auto_11656 ?auto_11657 ) ) ( not ( = ?auto_11656 ?auto_11676 ) ) ( not ( = ?auto_11657 ?auto_11676 ) ) ( not ( = ?auto_11663 ?auto_11678 ) ) ( IS-CRATE ?auto_11656 ) ( not ( = ?auto_11667 ?auto_11662 ) ) ( HOIST-AT ?auto_11680 ?auto_11667 ) ( AVAILABLE ?auto_11680 ) ( SURFACE-AT ?auto_11656 ?auto_11667 ) ( ON ?auto_11656 ?auto_11670 ) ( CLEAR ?auto_11656 ) ( not ( = ?auto_11655 ?auto_11656 ) ) ( not ( = ?auto_11655 ?auto_11670 ) ) ( not ( = ?auto_11656 ?auto_11670 ) ) ( not ( = ?auto_11663 ?auto_11680 ) ) ( IS-CRATE ?auto_11655 ) ( AVAILABLE ?auto_11678 ) ( SURFACE-AT ?auto_11655 ?auto_11675 ) ( ON ?auto_11655 ?auto_11668 ) ( CLEAR ?auto_11655 ) ( not ( = ?auto_11654 ?auto_11655 ) ) ( not ( = ?auto_11654 ?auto_11668 ) ) ( not ( = ?auto_11655 ?auto_11668 ) ) ( IS-CRATE ?auto_11654 ) ( not ( = ?auto_11669 ?auto_11662 ) ) ( HOIST-AT ?auto_11674 ?auto_11669 ) ( AVAILABLE ?auto_11674 ) ( SURFACE-AT ?auto_11654 ?auto_11669 ) ( ON ?auto_11654 ?auto_11672 ) ( CLEAR ?auto_11654 ) ( not ( = ?auto_11653 ?auto_11654 ) ) ( not ( = ?auto_11653 ?auto_11672 ) ) ( not ( = ?auto_11654 ?auto_11672 ) ) ( not ( = ?auto_11663 ?auto_11674 ) ) ( IS-CRATE ?auto_11653 ) ( AVAILABLE ?auto_11682 ) ( SURFACE-AT ?auto_11653 ?auto_11679 ) ( ON ?auto_11653 ?auto_11683 ) ( CLEAR ?auto_11653 ) ( not ( = ?auto_11652 ?auto_11653 ) ) ( not ( = ?auto_11652 ?auto_11683 ) ) ( not ( = ?auto_11653 ?auto_11683 ) ) ( IS-CRATE ?auto_11652 ) ( not ( = ?auto_11673 ?auto_11662 ) ) ( HOIST-AT ?auto_11677 ?auto_11673 ) ( SURFACE-AT ?auto_11652 ?auto_11673 ) ( ON ?auto_11652 ?auto_11666 ) ( CLEAR ?auto_11652 ) ( not ( = ?auto_11651 ?auto_11652 ) ) ( not ( = ?auto_11651 ?auto_11666 ) ) ( not ( = ?auto_11652 ?auto_11666 ) ) ( not ( = ?auto_11663 ?auto_11677 ) ) ( SURFACE-AT ?auto_11650 ?auto_11662 ) ( CLEAR ?auto_11650 ) ( IS-CRATE ?auto_11651 ) ( AVAILABLE ?auto_11663 ) ( AVAILABLE ?auto_11677 ) ( SURFACE-AT ?auto_11651 ?auto_11673 ) ( ON ?auto_11651 ?auto_11671 ) ( CLEAR ?auto_11651 ) ( TRUCK-AT ?auto_11660 ?auto_11662 ) ( not ( = ?auto_11650 ?auto_11651 ) ) ( not ( = ?auto_11650 ?auto_11671 ) ) ( not ( = ?auto_11651 ?auto_11671 ) ) ( not ( = ?auto_11650 ?auto_11652 ) ) ( not ( = ?auto_11650 ?auto_11666 ) ) ( not ( = ?auto_11652 ?auto_11671 ) ) ( not ( = ?auto_11666 ?auto_11671 ) ) ( not ( = ?auto_11650 ?auto_11653 ) ) ( not ( = ?auto_11650 ?auto_11683 ) ) ( not ( = ?auto_11651 ?auto_11653 ) ) ( not ( = ?auto_11651 ?auto_11683 ) ) ( not ( = ?auto_11653 ?auto_11666 ) ) ( not ( = ?auto_11653 ?auto_11671 ) ) ( not ( = ?auto_11679 ?auto_11673 ) ) ( not ( = ?auto_11682 ?auto_11677 ) ) ( not ( = ?auto_11683 ?auto_11666 ) ) ( not ( = ?auto_11683 ?auto_11671 ) ) ( not ( = ?auto_11650 ?auto_11654 ) ) ( not ( = ?auto_11650 ?auto_11672 ) ) ( not ( = ?auto_11651 ?auto_11654 ) ) ( not ( = ?auto_11651 ?auto_11672 ) ) ( not ( = ?auto_11652 ?auto_11654 ) ) ( not ( = ?auto_11652 ?auto_11672 ) ) ( not ( = ?auto_11654 ?auto_11683 ) ) ( not ( = ?auto_11654 ?auto_11666 ) ) ( not ( = ?auto_11654 ?auto_11671 ) ) ( not ( = ?auto_11669 ?auto_11679 ) ) ( not ( = ?auto_11669 ?auto_11673 ) ) ( not ( = ?auto_11674 ?auto_11682 ) ) ( not ( = ?auto_11674 ?auto_11677 ) ) ( not ( = ?auto_11672 ?auto_11683 ) ) ( not ( = ?auto_11672 ?auto_11666 ) ) ( not ( = ?auto_11672 ?auto_11671 ) ) ( not ( = ?auto_11650 ?auto_11655 ) ) ( not ( = ?auto_11650 ?auto_11668 ) ) ( not ( = ?auto_11651 ?auto_11655 ) ) ( not ( = ?auto_11651 ?auto_11668 ) ) ( not ( = ?auto_11652 ?auto_11655 ) ) ( not ( = ?auto_11652 ?auto_11668 ) ) ( not ( = ?auto_11653 ?auto_11655 ) ) ( not ( = ?auto_11653 ?auto_11668 ) ) ( not ( = ?auto_11655 ?auto_11672 ) ) ( not ( = ?auto_11655 ?auto_11683 ) ) ( not ( = ?auto_11655 ?auto_11666 ) ) ( not ( = ?auto_11655 ?auto_11671 ) ) ( not ( = ?auto_11675 ?auto_11669 ) ) ( not ( = ?auto_11675 ?auto_11679 ) ) ( not ( = ?auto_11675 ?auto_11673 ) ) ( not ( = ?auto_11678 ?auto_11674 ) ) ( not ( = ?auto_11678 ?auto_11682 ) ) ( not ( = ?auto_11678 ?auto_11677 ) ) ( not ( = ?auto_11668 ?auto_11672 ) ) ( not ( = ?auto_11668 ?auto_11683 ) ) ( not ( = ?auto_11668 ?auto_11666 ) ) ( not ( = ?auto_11668 ?auto_11671 ) ) ( not ( = ?auto_11650 ?auto_11656 ) ) ( not ( = ?auto_11650 ?auto_11670 ) ) ( not ( = ?auto_11651 ?auto_11656 ) ) ( not ( = ?auto_11651 ?auto_11670 ) ) ( not ( = ?auto_11652 ?auto_11656 ) ) ( not ( = ?auto_11652 ?auto_11670 ) ) ( not ( = ?auto_11653 ?auto_11656 ) ) ( not ( = ?auto_11653 ?auto_11670 ) ) ( not ( = ?auto_11654 ?auto_11656 ) ) ( not ( = ?auto_11654 ?auto_11670 ) ) ( not ( = ?auto_11656 ?auto_11668 ) ) ( not ( = ?auto_11656 ?auto_11672 ) ) ( not ( = ?auto_11656 ?auto_11683 ) ) ( not ( = ?auto_11656 ?auto_11666 ) ) ( not ( = ?auto_11656 ?auto_11671 ) ) ( not ( = ?auto_11667 ?auto_11675 ) ) ( not ( = ?auto_11667 ?auto_11669 ) ) ( not ( = ?auto_11667 ?auto_11679 ) ) ( not ( = ?auto_11667 ?auto_11673 ) ) ( not ( = ?auto_11680 ?auto_11678 ) ) ( not ( = ?auto_11680 ?auto_11674 ) ) ( not ( = ?auto_11680 ?auto_11682 ) ) ( not ( = ?auto_11680 ?auto_11677 ) ) ( not ( = ?auto_11670 ?auto_11668 ) ) ( not ( = ?auto_11670 ?auto_11672 ) ) ( not ( = ?auto_11670 ?auto_11683 ) ) ( not ( = ?auto_11670 ?auto_11666 ) ) ( not ( = ?auto_11670 ?auto_11671 ) ) ( not ( = ?auto_11650 ?auto_11657 ) ) ( not ( = ?auto_11650 ?auto_11676 ) ) ( not ( = ?auto_11651 ?auto_11657 ) ) ( not ( = ?auto_11651 ?auto_11676 ) ) ( not ( = ?auto_11652 ?auto_11657 ) ) ( not ( = ?auto_11652 ?auto_11676 ) ) ( not ( = ?auto_11653 ?auto_11657 ) ) ( not ( = ?auto_11653 ?auto_11676 ) ) ( not ( = ?auto_11654 ?auto_11657 ) ) ( not ( = ?auto_11654 ?auto_11676 ) ) ( not ( = ?auto_11655 ?auto_11657 ) ) ( not ( = ?auto_11655 ?auto_11676 ) ) ( not ( = ?auto_11657 ?auto_11670 ) ) ( not ( = ?auto_11657 ?auto_11668 ) ) ( not ( = ?auto_11657 ?auto_11672 ) ) ( not ( = ?auto_11657 ?auto_11683 ) ) ( not ( = ?auto_11657 ?auto_11666 ) ) ( not ( = ?auto_11657 ?auto_11671 ) ) ( not ( = ?auto_11676 ?auto_11670 ) ) ( not ( = ?auto_11676 ?auto_11668 ) ) ( not ( = ?auto_11676 ?auto_11672 ) ) ( not ( = ?auto_11676 ?auto_11683 ) ) ( not ( = ?auto_11676 ?auto_11666 ) ) ( not ( = ?auto_11676 ?auto_11671 ) ) ( not ( = ?auto_11650 ?auto_11658 ) ) ( not ( = ?auto_11650 ?auto_11681 ) ) ( not ( = ?auto_11651 ?auto_11658 ) ) ( not ( = ?auto_11651 ?auto_11681 ) ) ( not ( = ?auto_11652 ?auto_11658 ) ) ( not ( = ?auto_11652 ?auto_11681 ) ) ( not ( = ?auto_11653 ?auto_11658 ) ) ( not ( = ?auto_11653 ?auto_11681 ) ) ( not ( = ?auto_11654 ?auto_11658 ) ) ( not ( = ?auto_11654 ?auto_11681 ) ) ( not ( = ?auto_11655 ?auto_11658 ) ) ( not ( = ?auto_11655 ?auto_11681 ) ) ( not ( = ?auto_11656 ?auto_11658 ) ) ( not ( = ?auto_11656 ?auto_11681 ) ) ( not ( = ?auto_11658 ?auto_11676 ) ) ( not ( = ?auto_11658 ?auto_11670 ) ) ( not ( = ?auto_11658 ?auto_11668 ) ) ( not ( = ?auto_11658 ?auto_11672 ) ) ( not ( = ?auto_11658 ?auto_11683 ) ) ( not ( = ?auto_11658 ?auto_11666 ) ) ( not ( = ?auto_11658 ?auto_11671 ) ) ( not ( = ?auto_11681 ?auto_11676 ) ) ( not ( = ?auto_11681 ?auto_11670 ) ) ( not ( = ?auto_11681 ?auto_11668 ) ) ( not ( = ?auto_11681 ?auto_11672 ) ) ( not ( = ?auto_11681 ?auto_11683 ) ) ( not ( = ?auto_11681 ?auto_11666 ) ) ( not ( = ?auto_11681 ?auto_11671 ) ) ( not ( = ?auto_11650 ?auto_11659 ) ) ( not ( = ?auto_11650 ?auto_11661 ) ) ( not ( = ?auto_11651 ?auto_11659 ) ) ( not ( = ?auto_11651 ?auto_11661 ) ) ( not ( = ?auto_11652 ?auto_11659 ) ) ( not ( = ?auto_11652 ?auto_11661 ) ) ( not ( = ?auto_11653 ?auto_11659 ) ) ( not ( = ?auto_11653 ?auto_11661 ) ) ( not ( = ?auto_11654 ?auto_11659 ) ) ( not ( = ?auto_11654 ?auto_11661 ) ) ( not ( = ?auto_11655 ?auto_11659 ) ) ( not ( = ?auto_11655 ?auto_11661 ) ) ( not ( = ?auto_11656 ?auto_11659 ) ) ( not ( = ?auto_11656 ?auto_11661 ) ) ( not ( = ?auto_11657 ?auto_11659 ) ) ( not ( = ?auto_11657 ?auto_11661 ) ) ( not ( = ?auto_11659 ?auto_11681 ) ) ( not ( = ?auto_11659 ?auto_11676 ) ) ( not ( = ?auto_11659 ?auto_11670 ) ) ( not ( = ?auto_11659 ?auto_11668 ) ) ( not ( = ?auto_11659 ?auto_11672 ) ) ( not ( = ?auto_11659 ?auto_11683 ) ) ( not ( = ?auto_11659 ?auto_11666 ) ) ( not ( = ?auto_11659 ?auto_11671 ) ) ( not ( = ?auto_11664 ?auto_11679 ) ) ( not ( = ?auto_11664 ?auto_11675 ) ) ( not ( = ?auto_11664 ?auto_11667 ) ) ( not ( = ?auto_11664 ?auto_11669 ) ) ( not ( = ?auto_11664 ?auto_11673 ) ) ( not ( = ?auto_11665 ?auto_11682 ) ) ( not ( = ?auto_11665 ?auto_11678 ) ) ( not ( = ?auto_11665 ?auto_11680 ) ) ( not ( = ?auto_11665 ?auto_11674 ) ) ( not ( = ?auto_11665 ?auto_11677 ) ) ( not ( = ?auto_11661 ?auto_11681 ) ) ( not ( = ?auto_11661 ?auto_11676 ) ) ( not ( = ?auto_11661 ?auto_11670 ) ) ( not ( = ?auto_11661 ?auto_11668 ) ) ( not ( = ?auto_11661 ?auto_11672 ) ) ( not ( = ?auto_11661 ?auto_11683 ) ) ( not ( = ?auto_11661 ?auto_11666 ) ) ( not ( = ?auto_11661 ?auto_11671 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_11650 ?auto_11651 ?auto_11652 ?auto_11653 ?auto_11654 ?auto_11655 ?auto_11656 ?auto_11657 ?auto_11658 )
      ( MAKE-1CRATE ?auto_11658 ?auto_11659 )
      ( MAKE-9CRATE-VERIFY ?auto_11650 ?auto_11651 ?auto_11652 ?auto_11653 ?auto_11654 ?auto_11655 ?auto_11656 ?auto_11657 ?auto_11658 ?auto_11659 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_11705 - SURFACE
      ?auto_11706 - SURFACE
      ?auto_11707 - SURFACE
      ?auto_11708 - SURFACE
      ?auto_11709 - SURFACE
      ?auto_11710 - SURFACE
      ?auto_11711 - SURFACE
      ?auto_11712 - SURFACE
      ?auto_11713 - SURFACE
      ?auto_11714 - SURFACE
      ?auto_11715 - SURFACE
    )
    :vars
    (
      ?auto_11719 - HOIST
      ?auto_11720 - PLACE
      ?auto_11716 - PLACE
      ?auto_11718 - HOIST
      ?auto_11717 - SURFACE
      ?auto_11727 - SURFACE
      ?auto_11737 - PLACE
      ?auto_11738 - HOIST
      ?auto_11740 - SURFACE
      ?auto_11726 - PLACE
      ?auto_11729 - HOIST
      ?auto_11728 - SURFACE
      ?auto_11732 - PLACE
      ?auto_11735 - HOIST
      ?auto_11730 - SURFACE
      ?auto_11736 - SURFACE
      ?auto_11724 - PLACE
      ?auto_11739 - HOIST
      ?auto_11734 - SURFACE
      ?auto_11725 - SURFACE
      ?auto_11733 - PLACE
      ?auto_11723 - HOIST
      ?auto_11731 - SURFACE
      ?auto_11722 - SURFACE
      ?auto_11721 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11719 ?auto_11720 ) ( IS-CRATE ?auto_11715 ) ( not ( = ?auto_11716 ?auto_11720 ) ) ( HOIST-AT ?auto_11718 ?auto_11716 ) ( SURFACE-AT ?auto_11715 ?auto_11716 ) ( ON ?auto_11715 ?auto_11717 ) ( CLEAR ?auto_11715 ) ( not ( = ?auto_11714 ?auto_11715 ) ) ( not ( = ?auto_11714 ?auto_11717 ) ) ( not ( = ?auto_11715 ?auto_11717 ) ) ( not ( = ?auto_11719 ?auto_11718 ) ) ( IS-CRATE ?auto_11714 ) ( AVAILABLE ?auto_11718 ) ( SURFACE-AT ?auto_11714 ?auto_11716 ) ( ON ?auto_11714 ?auto_11727 ) ( CLEAR ?auto_11714 ) ( not ( = ?auto_11713 ?auto_11714 ) ) ( not ( = ?auto_11713 ?auto_11727 ) ) ( not ( = ?auto_11714 ?auto_11727 ) ) ( IS-CRATE ?auto_11713 ) ( not ( = ?auto_11737 ?auto_11720 ) ) ( HOIST-AT ?auto_11738 ?auto_11737 ) ( SURFACE-AT ?auto_11713 ?auto_11737 ) ( ON ?auto_11713 ?auto_11740 ) ( CLEAR ?auto_11713 ) ( not ( = ?auto_11712 ?auto_11713 ) ) ( not ( = ?auto_11712 ?auto_11740 ) ) ( not ( = ?auto_11713 ?auto_11740 ) ) ( not ( = ?auto_11719 ?auto_11738 ) ) ( IS-CRATE ?auto_11712 ) ( not ( = ?auto_11726 ?auto_11720 ) ) ( HOIST-AT ?auto_11729 ?auto_11726 ) ( SURFACE-AT ?auto_11712 ?auto_11726 ) ( ON ?auto_11712 ?auto_11728 ) ( CLEAR ?auto_11712 ) ( not ( = ?auto_11711 ?auto_11712 ) ) ( not ( = ?auto_11711 ?auto_11728 ) ) ( not ( = ?auto_11712 ?auto_11728 ) ) ( not ( = ?auto_11719 ?auto_11729 ) ) ( IS-CRATE ?auto_11711 ) ( not ( = ?auto_11732 ?auto_11720 ) ) ( HOIST-AT ?auto_11735 ?auto_11732 ) ( AVAILABLE ?auto_11735 ) ( SURFACE-AT ?auto_11711 ?auto_11732 ) ( ON ?auto_11711 ?auto_11730 ) ( CLEAR ?auto_11711 ) ( not ( = ?auto_11710 ?auto_11711 ) ) ( not ( = ?auto_11710 ?auto_11730 ) ) ( not ( = ?auto_11711 ?auto_11730 ) ) ( not ( = ?auto_11719 ?auto_11735 ) ) ( IS-CRATE ?auto_11710 ) ( AVAILABLE ?auto_11729 ) ( SURFACE-AT ?auto_11710 ?auto_11726 ) ( ON ?auto_11710 ?auto_11736 ) ( CLEAR ?auto_11710 ) ( not ( = ?auto_11709 ?auto_11710 ) ) ( not ( = ?auto_11709 ?auto_11736 ) ) ( not ( = ?auto_11710 ?auto_11736 ) ) ( IS-CRATE ?auto_11709 ) ( not ( = ?auto_11724 ?auto_11720 ) ) ( HOIST-AT ?auto_11739 ?auto_11724 ) ( AVAILABLE ?auto_11739 ) ( SURFACE-AT ?auto_11709 ?auto_11724 ) ( ON ?auto_11709 ?auto_11734 ) ( CLEAR ?auto_11709 ) ( not ( = ?auto_11708 ?auto_11709 ) ) ( not ( = ?auto_11708 ?auto_11734 ) ) ( not ( = ?auto_11709 ?auto_11734 ) ) ( not ( = ?auto_11719 ?auto_11739 ) ) ( IS-CRATE ?auto_11708 ) ( AVAILABLE ?auto_11738 ) ( SURFACE-AT ?auto_11708 ?auto_11737 ) ( ON ?auto_11708 ?auto_11725 ) ( CLEAR ?auto_11708 ) ( not ( = ?auto_11707 ?auto_11708 ) ) ( not ( = ?auto_11707 ?auto_11725 ) ) ( not ( = ?auto_11708 ?auto_11725 ) ) ( IS-CRATE ?auto_11707 ) ( not ( = ?auto_11733 ?auto_11720 ) ) ( HOIST-AT ?auto_11723 ?auto_11733 ) ( SURFACE-AT ?auto_11707 ?auto_11733 ) ( ON ?auto_11707 ?auto_11731 ) ( CLEAR ?auto_11707 ) ( not ( = ?auto_11706 ?auto_11707 ) ) ( not ( = ?auto_11706 ?auto_11731 ) ) ( not ( = ?auto_11707 ?auto_11731 ) ) ( not ( = ?auto_11719 ?auto_11723 ) ) ( SURFACE-AT ?auto_11705 ?auto_11720 ) ( CLEAR ?auto_11705 ) ( IS-CRATE ?auto_11706 ) ( AVAILABLE ?auto_11719 ) ( AVAILABLE ?auto_11723 ) ( SURFACE-AT ?auto_11706 ?auto_11733 ) ( ON ?auto_11706 ?auto_11722 ) ( CLEAR ?auto_11706 ) ( TRUCK-AT ?auto_11721 ?auto_11720 ) ( not ( = ?auto_11705 ?auto_11706 ) ) ( not ( = ?auto_11705 ?auto_11722 ) ) ( not ( = ?auto_11706 ?auto_11722 ) ) ( not ( = ?auto_11705 ?auto_11707 ) ) ( not ( = ?auto_11705 ?auto_11731 ) ) ( not ( = ?auto_11707 ?auto_11722 ) ) ( not ( = ?auto_11731 ?auto_11722 ) ) ( not ( = ?auto_11705 ?auto_11708 ) ) ( not ( = ?auto_11705 ?auto_11725 ) ) ( not ( = ?auto_11706 ?auto_11708 ) ) ( not ( = ?auto_11706 ?auto_11725 ) ) ( not ( = ?auto_11708 ?auto_11731 ) ) ( not ( = ?auto_11708 ?auto_11722 ) ) ( not ( = ?auto_11737 ?auto_11733 ) ) ( not ( = ?auto_11738 ?auto_11723 ) ) ( not ( = ?auto_11725 ?auto_11731 ) ) ( not ( = ?auto_11725 ?auto_11722 ) ) ( not ( = ?auto_11705 ?auto_11709 ) ) ( not ( = ?auto_11705 ?auto_11734 ) ) ( not ( = ?auto_11706 ?auto_11709 ) ) ( not ( = ?auto_11706 ?auto_11734 ) ) ( not ( = ?auto_11707 ?auto_11709 ) ) ( not ( = ?auto_11707 ?auto_11734 ) ) ( not ( = ?auto_11709 ?auto_11725 ) ) ( not ( = ?auto_11709 ?auto_11731 ) ) ( not ( = ?auto_11709 ?auto_11722 ) ) ( not ( = ?auto_11724 ?auto_11737 ) ) ( not ( = ?auto_11724 ?auto_11733 ) ) ( not ( = ?auto_11739 ?auto_11738 ) ) ( not ( = ?auto_11739 ?auto_11723 ) ) ( not ( = ?auto_11734 ?auto_11725 ) ) ( not ( = ?auto_11734 ?auto_11731 ) ) ( not ( = ?auto_11734 ?auto_11722 ) ) ( not ( = ?auto_11705 ?auto_11710 ) ) ( not ( = ?auto_11705 ?auto_11736 ) ) ( not ( = ?auto_11706 ?auto_11710 ) ) ( not ( = ?auto_11706 ?auto_11736 ) ) ( not ( = ?auto_11707 ?auto_11710 ) ) ( not ( = ?auto_11707 ?auto_11736 ) ) ( not ( = ?auto_11708 ?auto_11710 ) ) ( not ( = ?auto_11708 ?auto_11736 ) ) ( not ( = ?auto_11710 ?auto_11734 ) ) ( not ( = ?auto_11710 ?auto_11725 ) ) ( not ( = ?auto_11710 ?auto_11731 ) ) ( not ( = ?auto_11710 ?auto_11722 ) ) ( not ( = ?auto_11726 ?auto_11724 ) ) ( not ( = ?auto_11726 ?auto_11737 ) ) ( not ( = ?auto_11726 ?auto_11733 ) ) ( not ( = ?auto_11729 ?auto_11739 ) ) ( not ( = ?auto_11729 ?auto_11738 ) ) ( not ( = ?auto_11729 ?auto_11723 ) ) ( not ( = ?auto_11736 ?auto_11734 ) ) ( not ( = ?auto_11736 ?auto_11725 ) ) ( not ( = ?auto_11736 ?auto_11731 ) ) ( not ( = ?auto_11736 ?auto_11722 ) ) ( not ( = ?auto_11705 ?auto_11711 ) ) ( not ( = ?auto_11705 ?auto_11730 ) ) ( not ( = ?auto_11706 ?auto_11711 ) ) ( not ( = ?auto_11706 ?auto_11730 ) ) ( not ( = ?auto_11707 ?auto_11711 ) ) ( not ( = ?auto_11707 ?auto_11730 ) ) ( not ( = ?auto_11708 ?auto_11711 ) ) ( not ( = ?auto_11708 ?auto_11730 ) ) ( not ( = ?auto_11709 ?auto_11711 ) ) ( not ( = ?auto_11709 ?auto_11730 ) ) ( not ( = ?auto_11711 ?auto_11736 ) ) ( not ( = ?auto_11711 ?auto_11734 ) ) ( not ( = ?auto_11711 ?auto_11725 ) ) ( not ( = ?auto_11711 ?auto_11731 ) ) ( not ( = ?auto_11711 ?auto_11722 ) ) ( not ( = ?auto_11732 ?auto_11726 ) ) ( not ( = ?auto_11732 ?auto_11724 ) ) ( not ( = ?auto_11732 ?auto_11737 ) ) ( not ( = ?auto_11732 ?auto_11733 ) ) ( not ( = ?auto_11735 ?auto_11729 ) ) ( not ( = ?auto_11735 ?auto_11739 ) ) ( not ( = ?auto_11735 ?auto_11738 ) ) ( not ( = ?auto_11735 ?auto_11723 ) ) ( not ( = ?auto_11730 ?auto_11736 ) ) ( not ( = ?auto_11730 ?auto_11734 ) ) ( not ( = ?auto_11730 ?auto_11725 ) ) ( not ( = ?auto_11730 ?auto_11731 ) ) ( not ( = ?auto_11730 ?auto_11722 ) ) ( not ( = ?auto_11705 ?auto_11712 ) ) ( not ( = ?auto_11705 ?auto_11728 ) ) ( not ( = ?auto_11706 ?auto_11712 ) ) ( not ( = ?auto_11706 ?auto_11728 ) ) ( not ( = ?auto_11707 ?auto_11712 ) ) ( not ( = ?auto_11707 ?auto_11728 ) ) ( not ( = ?auto_11708 ?auto_11712 ) ) ( not ( = ?auto_11708 ?auto_11728 ) ) ( not ( = ?auto_11709 ?auto_11712 ) ) ( not ( = ?auto_11709 ?auto_11728 ) ) ( not ( = ?auto_11710 ?auto_11712 ) ) ( not ( = ?auto_11710 ?auto_11728 ) ) ( not ( = ?auto_11712 ?auto_11730 ) ) ( not ( = ?auto_11712 ?auto_11736 ) ) ( not ( = ?auto_11712 ?auto_11734 ) ) ( not ( = ?auto_11712 ?auto_11725 ) ) ( not ( = ?auto_11712 ?auto_11731 ) ) ( not ( = ?auto_11712 ?auto_11722 ) ) ( not ( = ?auto_11728 ?auto_11730 ) ) ( not ( = ?auto_11728 ?auto_11736 ) ) ( not ( = ?auto_11728 ?auto_11734 ) ) ( not ( = ?auto_11728 ?auto_11725 ) ) ( not ( = ?auto_11728 ?auto_11731 ) ) ( not ( = ?auto_11728 ?auto_11722 ) ) ( not ( = ?auto_11705 ?auto_11713 ) ) ( not ( = ?auto_11705 ?auto_11740 ) ) ( not ( = ?auto_11706 ?auto_11713 ) ) ( not ( = ?auto_11706 ?auto_11740 ) ) ( not ( = ?auto_11707 ?auto_11713 ) ) ( not ( = ?auto_11707 ?auto_11740 ) ) ( not ( = ?auto_11708 ?auto_11713 ) ) ( not ( = ?auto_11708 ?auto_11740 ) ) ( not ( = ?auto_11709 ?auto_11713 ) ) ( not ( = ?auto_11709 ?auto_11740 ) ) ( not ( = ?auto_11710 ?auto_11713 ) ) ( not ( = ?auto_11710 ?auto_11740 ) ) ( not ( = ?auto_11711 ?auto_11713 ) ) ( not ( = ?auto_11711 ?auto_11740 ) ) ( not ( = ?auto_11713 ?auto_11728 ) ) ( not ( = ?auto_11713 ?auto_11730 ) ) ( not ( = ?auto_11713 ?auto_11736 ) ) ( not ( = ?auto_11713 ?auto_11734 ) ) ( not ( = ?auto_11713 ?auto_11725 ) ) ( not ( = ?auto_11713 ?auto_11731 ) ) ( not ( = ?auto_11713 ?auto_11722 ) ) ( not ( = ?auto_11740 ?auto_11728 ) ) ( not ( = ?auto_11740 ?auto_11730 ) ) ( not ( = ?auto_11740 ?auto_11736 ) ) ( not ( = ?auto_11740 ?auto_11734 ) ) ( not ( = ?auto_11740 ?auto_11725 ) ) ( not ( = ?auto_11740 ?auto_11731 ) ) ( not ( = ?auto_11740 ?auto_11722 ) ) ( not ( = ?auto_11705 ?auto_11714 ) ) ( not ( = ?auto_11705 ?auto_11727 ) ) ( not ( = ?auto_11706 ?auto_11714 ) ) ( not ( = ?auto_11706 ?auto_11727 ) ) ( not ( = ?auto_11707 ?auto_11714 ) ) ( not ( = ?auto_11707 ?auto_11727 ) ) ( not ( = ?auto_11708 ?auto_11714 ) ) ( not ( = ?auto_11708 ?auto_11727 ) ) ( not ( = ?auto_11709 ?auto_11714 ) ) ( not ( = ?auto_11709 ?auto_11727 ) ) ( not ( = ?auto_11710 ?auto_11714 ) ) ( not ( = ?auto_11710 ?auto_11727 ) ) ( not ( = ?auto_11711 ?auto_11714 ) ) ( not ( = ?auto_11711 ?auto_11727 ) ) ( not ( = ?auto_11712 ?auto_11714 ) ) ( not ( = ?auto_11712 ?auto_11727 ) ) ( not ( = ?auto_11714 ?auto_11740 ) ) ( not ( = ?auto_11714 ?auto_11728 ) ) ( not ( = ?auto_11714 ?auto_11730 ) ) ( not ( = ?auto_11714 ?auto_11736 ) ) ( not ( = ?auto_11714 ?auto_11734 ) ) ( not ( = ?auto_11714 ?auto_11725 ) ) ( not ( = ?auto_11714 ?auto_11731 ) ) ( not ( = ?auto_11714 ?auto_11722 ) ) ( not ( = ?auto_11716 ?auto_11737 ) ) ( not ( = ?auto_11716 ?auto_11726 ) ) ( not ( = ?auto_11716 ?auto_11732 ) ) ( not ( = ?auto_11716 ?auto_11724 ) ) ( not ( = ?auto_11716 ?auto_11733 ) ) ( not ( = ?auto_11718 ?auto_11738 ) ) ( not ( = ?auto_11718 ?auto_11729 ) ) ( not ( = ?auto_11718 ?auto_11735 ) ) ( not ( = ?auto_11718 ?auto_11739 ) ) ( not ( = ?auto_11718 ?auto_11723 ) ) ( not ( = ?auto_11727 ?auto_11740 ) ) ( not ( = ?auto_11727 ?auto_11728 ) ) ( not ( = ?auto_11727 ?auto_11730 ) ) ( not ( = ?auto_11727 ?auto_11736 ) ) ( not ( = ?auto_11727 ?auto_11734 ) ) ( not ( = ?auto_11727 ?auto_11725 ) ) ( not ( = ?auto_11727 ?auto_11731 ) ) ( not ( = ?auto_11727 ?auto_11722 ) ) ( not ( = ?auto_11705 ?auto_11715 ) ) ( not ( = ?auto_11705 ?auto_11717 ) ) ( not ( = ?auto_11706 ?auto_11715 ) ) ( not ( = ?auto_11706 ?auto_11717 ) ) ( not ( = ?auto_11707 ?auto_11715 ) ) ( not ( = ?auto_11707 ?auto_11717 ) ) ( not ( = ?auto_11708 ?auto_11715 ) ) ( not ( = ?auto_11708 ?auto_11717 ) ) ( not ( = ?auto_11709 ?auto_11715 ) ) ( not ( = ?auto_11709 ?auto_11717 ) ) ( not ( = ?auto_11710 ?auto_11715 ) ) ( not ( = ?auto_11710 ?auto_11717 ) ) ( not ( = ?auto_11711 ?auto_11715 ) ) ( not ( = ?auto_11711 ?auto_11717 ) ) ( not ( = ?auto_11712 ?auto_11715 ) ) ( not ( = ?auto_11712 ?auto_11717 ) ) ( not ( = ?auto_11713 ?auto_11715 ) ) ( not ( = ?auto_11713 ?auto_11717 ) ) ( not ( = ?auto_11715 ?auto_11727 ) ) ( not ( = ?auto_11715 ?auto_11740 ) ) ( not ( = ?auto_11715 ?auto_11728 ) ) ( not ( = ?auto_11715 ?auto_11730 ) ) ( not ( = ?auto_11715 ?auto_11736 ) ) ( not ( = ?auto_11715 ?auto_11734 ) ) ( not ( = ?auto_11715 ?auto_11725 ) ) ( not ( = ?auto_11715 ?auto_11731 ) ) ( not ( = ?auto_11715 ?auto_11722 ) ) ( not ( = ?auto_11717 ?auto_11727 ) ) ( not ( = ?auto_11717 ?auto_11740 ) ) ( not ( = ?auto_11717 ?auto_11728 ) ) ( not ( = ?auto_11717 ?auto_11730 ) ) ( not ( = ?auto_11717 ?auto_11736 ) ) ( not ( = ?auto_11717 ?auto_11734 ) ) ( not ( = ?auto_11717 ?auto_11725 ) ) ( not ( = ?auto_11717 ?auto_11731 ) ) ( not ( = ?auto_11717 ?auto_11722 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_11705 ?auto_11706 ?auto_11707 ?auto_11708 ?auto_11709 ?auto_11710 ?auto_11711 ?auto_11712 ?auto_11713 ?auto_11714 )
      ( MAKE-1CRATE ?auto_11714 ?auto_11715 )
      ( MAKE-10CRATE-VERIFY ?auto_11705 ?auto_11706 ?auto_11707 ?auto_11708 ?auto_11709 ?auto_11710 ?auto_11711 ?auto_11712 ?auto_11713 ?auto_11714 ?auto_11715 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_11763 - SURFACE
      ?auto_11764 - SURFACE
      ?auto_11765 - SURFACE
      ?auto_11766 - SURFACE
      ?auto_11767 - SURFACE
      ?auto_11768 - SURFACE
      ?auto_11769 - SURFACE
      ?auto_11770 - SURFACE
      ?auto_11771 - SURFACE
      ?auto_11772 - SURFACE
      ?auto_11773 - SURFACE
      ?auto_11774 - SURFACE
    )
    :vars
    (
      ?auto_11776 - HOIST
      ?auto_11778 - PLACE
      ?auto_11780 - PLACE
      ?auto_11779 - HOIST
      ?auto_11775 - SURFACE
      ?auto_11801 - PLACE
      ?auto_11789 - HOIST
      ?auto_11800 - SURFACE
      ?auto_11782 - SURFACE
      ?auto_11798 - PLACE
      ?auto_11796 - HOIST
      ?auto_11783 - SURFACE
      ?auto_11787 - PLACE
      ?auto_11788 - HOIST
      ?auto_11794 - SURFACE
      ?auto_11790 - PLACE
      ?auto_11799 - HOIST
      ?auto_11795 - SURFACE
      ?auto_11802 - SURFACE
      ?auto_11784 - PLACE
      ?auto_11781 - HOIST
      ?auto_11791 - SURFACE
      ?auto_11785 - SURFACE
      ?auto_11786 - PLACE
      ?auto_11793 - HOIST
      ?auto_11792 - SURFACE
      ?auto_11797 - SURFACE
      ?auto_11777 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11776 ?auto_11778 ) ( IS-CRATE ?auto_11774 ) ( not ( = ?auto_11780 ?auto_11778 ) ) ( HOIST-AT ?auto_11779 ?auto_11780 ) ( AVAILABLE ?auto_11779 ) ( SURFACE-AT ?auto_11774 ?auto_11780 ) ( ON ?auto_11774 ?auto_11775 ) ( CLEAR ?auto_11774 ) ( not ( = ?auto_11773 ?auto_11774 ) ) ( not ( = ?auto_11773 ?auto_11775 ) ) ( not ( = ?auto_11774 ?auto_11775 ) ) ( not ( = ?auto_11776 ?auto_11779 ) ) ( IS-CRATE ?auto_11773 ) ( not ( = ?auto_11801 ?auto_11778 ) ) ( HOIST-AT ?auto_11789 ?auto_11801 ) ( SURFACE-AT ?auto_11773 ?auto_11801 ) ( ON ?auto_11773 ?auto_11800 ) ( CLEAR ?auto_11773 ) ( not ( = ?auto_11772 ?auto_11773 ) ) ( not ( = ?auto_11772 ?auto_11800 ) ) ( not ( = ?auto_11773 ?auto_11800 ) ) ( not ( = ?auto_11776 ?auto_11789 ) ) ( IS-CRATE ?auto_11772 ) ( AVAILABLE ?auto_11789 ) ( SURFACE-AT ?auto_11772 ?auto_11801 ) ( ON ?auto_11772 ?auto_11782 ) ( CLEAR ?auto_11772 ) ( not ( = ?auto_11771 ?auto_11772 ) ) ( not ( = ?auto_11771 ?auto_11782 ) ) ( not ( = ?auto_11772 ?auto_11782 ) ) ( IS-CRATE ?auto_11771 ) ( not ( = ?auto_11798 ?auto_11778 ) ) ( HOIST-AT ?auto_11796 ?auto_11798 ) ( SURFACE-AT ?auto_11771 ?auto_11798 ) ( ON ?auto_11771 ?auto_11783 ) ( CLEAR ?auto_11771 ) ( not ( = ?auto_11770 ?auto_11771 ) ) ( not ( = ?auto_11770 ?auto_11783 ) ) ( not ( = ?auto_11771 ?auto_11783 ) ) ( not ( = ?auto_11776 ?auto_11796 ) ) ( IS-CRATE ?auto_11770 ) ( not ( = ?auto_11787 ?auto_11778 ) ) ( HOIST-AT ?auto_11788 ?auto_11787 ) ( SURFACE-AT ?auto_11770 ?auto_11787 ) ( ON ?auto_11770 ?auto_11794 ) ( CLEAR ?auto_11770 ) ( not ( = ?auto_11769 ?auto_11770 ) ) ( not ( = ?auto_11769 ?auto_11794 ) ) ( not ( = ?auto_11770 ?auto_11794 ) ) ( not ( = ?auto_11776 ?auto_11788 ) ) ( IS-CRATE ?auto_11769 ) ( not ( = ?auto_11790 ?auto_11778 ) ) ( HOIST-AT ?auto_11799 ?auto_11790 ) ( AVAILABLE ?auto_11799 ) ( SURFACE-AT ?auto_11769 ?auto_11790 ) ( ON ?auto_11769 ?auto_11795 ) ( CLEAR ?auto_11769 ) ( not ( = ?auto_11768 ?auto_11769 ) ) ( not ( = ?auto_11768 ?auto_11795 ) ) ( not ( = ?auto_11769 ?auto_11795 ) ) ( not ( = ?auto_11776 ?auto_11799 ) ) ( IS-CRATE ?auto_11768 ) ( AVAILABLE ?auto_11788 ) ( SURFACE-AT ?auto_11768 ?auto_11787 ) ( ON ?auto_11768 ?auto_11802 ) ( CLEAR ?auto_11768 ) ( not ( = ?auto_11767 ?auto_11768 ) ) ( not ( = ?auto_11767 ?auto_11802 ) ) ( not ( = ?auto_11768 ?auto_11802 ) ) ( IS-CRATE ?auto_11767 ) ( not ( = ?auto_11784 ?auto_11778 ) ) ( HOIST-AT ?auto_11781 ?auto_11784 ) ( AVAILABLE ?auto_11781 ) ( SURFACE-AT ?auto_11767 ?auto_11784 ) ( ON ?auto_11767 ?auto_11791 ) ( CLEAR ?auto_11767 ) ( not ( = ?auto_11766 ?auto_11767 ) ) ( not ( = ?auto_11766 ?auto_11791 ) ) ( not ( = ?auto_11767 ?auto_11791 ) ) ( not ( = ?auto_11776 ?auto_11781 ) ) ( IS-CRATE ?auto_11766 ) ( AVAILABLE ?auto_11796 ) ( SURFACE-AT ?auto_11766 ?auto_11798 ) ( ON ?auto_11766 ?auto_11785 ) ( CLEAR ?auto_11766 ) ( not ( = ?auto_11765 ?auto_11766 ) ) ( not ( = ?auto_11765 ?auto_11785 ) ) ( not ( = ?auto_11766 ?auto_11785 ) ) ( IS-CRATE ?auto_11765 ) ( not ( = ?auto_11786 ?auto_11778 ) ) ( HOIST-AT ?auto_11793 ?auto_11786 ) ( SURFACE-AT ?auto_11765 ?auto_11786 ) ( ON ?auto_11765 ?auto_11792 ) ( CLEAR ?auto_11765 ) ( not ( = ?auto_11764 ?auto_11765 ) ) ( not ( = ?auto_11764 ?auto_11792 ) ) ( not ( = ?auto_11765 ?auto_11792 ) ) ( not ( = ?auto_11776 ?auto_11793 ) ) ( SURFACE-AT ?auto_11763 ?auto_11778 ) ( CLEAR ?auto_11763 ) ( IS-CRATE ?auto_11764 ) ( AVAILABLE ?auto_11776 ) ( AVAILABLE ?auto_11793 ) ( SURFACE-AT ?auto_11764 ?auto_11786 ) ( ON ?auto_11764 ?auto_11797 ) ( CLEAR ?auto_11764 ) ( TRUCK-AT ?auto_11777 ?auto_11778 ) ( not ( = ?auto_11763 ?auto_11764 ) ) ( not ( = ?auto_11763 ?auto_11797 ) ) ( not ( = ?auto_11764 ?auto_11797 ) ) ( not ( = ?auto_11763 ?auto_11765 ) ) ( not ( = ?auto_11763 ?auto_11792 ) ) ( not ( = ?auto_11765 ?auto_11797 ) ) ( not ( = ?auto_11792 ?auto_11797 ) ) ( not ( = ?auto_11763 ?auto_11766 ) ) ( not ( = ?auto_11763 ?auto_11785 ) ) ( not ( = ?auto_11764 ?auto_11766 ) ) ( not ( = ?auto_11764 ?auto_11785 ) ) ( not ( = ?auto_11766 ?auto_11792 ) ) ( not ( = ?auto_11766 ?auto_11797 ) ) ( not ( = ?auto_11798 ?auto_11786 ) ) ( not ( = ?auto_11796 ?auto_11793 ) ) ( not ( = ?auto_11785 ?auto_11792 ) ) ( not ( = ?auto_11785 ?auto_11797 ) ) ( not ( = ?auto_11763 ?auto_11767 ) ) ( not ( = ?auto_11763 ?auto_11791 ) ) ( not ( = ?auto_11764 ?auto_11767 ) ) ( not ( = ?auto_11764 ?auto_11791 ) ) ( not ( = ?auto_11765 ?auto_11767 ) ) ( not ( = ?auto_11765 ?auto_11791 ) ) ( not ( = ?auto_11767 ?auto_11785 ) ) ( not ( = ?auto_11767 ?auto_11792 ) ) ( not ( = ?auto_11767 ?auto_11797 ) ) ( not ( = ?auto_11784 ?auto_11798 ) ) ( not ( = ?auto_11784 ?auto_11786 ) ) ( not ( = ?auto_11781 ?auto_11796 ) ) ( not ( = ?auto_11781 ?auto_11793 ) ) ( not ( = ?auto_11791 ?auto_11785 ) ) ( not ( = ?auto_11791 ?auto_11792 ) ) ( not ( = ?auto_11791 ?auto_11797 ) ) ( not ( = ?auto_11763 ?auto_11768 ) ) ( not ( = ?auto_11763 ?auto_11802 ) ) ( not ( = ?auto_11764 ?auto_11768 ) ) ( not ( = ?auto_11764 ?auto_11802 ) ) ( not ( = ?auto_11765 ?auto_11768 ) ) ( not ( = ?auto_11765 ?auto_11802 ) ) ( not ( = ?auto_11766 ?auto_11768 ) ) ( not ( = ?auto_11766 ?auto_11802 ) ) ( not ( = ?auto_11768 ?auto_11791 ) ) ( not ( = ?auto_11768 ?auto_11785 ) ) ( not ( = ?auto_11768 ?auto_11792 ) ) ( not ( = ?auto_11768 ?auto_11797 ) ) ( not ( = ?auto_11787 ?auto_11784 ) ) ( not ( = ?auto_11787 ?auto_11798 ) ) ( not ( = ?auto_11787 ?auto_11786 ) ) ( not ( = ?auto_11788 ?auto_11781 ) ) ( not ( = ?auto_11788 ?auto_11796 ) ) ( not ( = ?auto_11788 ?auto_11793 ) ) ( not ( = ?auto_11802 ?auto_11791 ) ) ( not ( = ?auto_11802 ?auto_11785 ) ) ( not ( = ?auto_11802 ?auto_11792 ) ) ( not ( = ?auto_11802 ?auto_11797 ) ) ( not ( = ?auto_11763 ?auto_11769 ) ) ( not ( = ?auto_11763 ?auto_11795 ) ) ( not ( = ?auto_11764 ?auto_11769 ) ) ( not ( = ?auto_11764 ?auto_11795 ) ) ( not ( = ?auto_11765 ?auto_11769 ) ) ( not ( = ?auto_11765 ?auto_11795 ) ) ( not ( = ?auto_11766 ?auto_11769 ) ) ( not ( = ?auto_11766 ?auto_11795 ) ) ( not ( = ?auto_11767 ?auto_11769 ) ) ( not ( = ?auto_11767 ?auto_11795 ) ) ( not ( = ?auto_11769 ?auto_11802 ) ) ( not ( = ?auto_11769 ?auto_11791 ) ) ( not ( = ?auto_11769 ?auto_11785 ) ) ( not ( = ?auto_11769 ?auto_11792 ) ) ( not ( = ?auto_11769 ?auto_11797 ) ) ( not ( = ?auto_11790 ?auto_11787 ) ) ( not ( = ?auto_11790 ?auto_11784 ) ) ( not ( = ?auto_11790 ?auto_11798 ) ) ( not ( = ?auto_11790 ?auto_11786 ) ) ( not ( = ?auto_11799 ?auto_11788 ) ) ( not ( = ?auto_11799 ?auto_11781 ) ) ( not ( = ?auto_11799 ?auto_11796 ) ) ( not ( = ?auto_11799 ?auto_11793 ) ) ( not ( = ?auto_11795 ?auto_11802 ) ) ( not ( = ?auto_11795 ?auto_11791 ) ) ( not ( = ?auto_11795 ?auto_11785 ) ) ( not ( = ?auto_11795 ?auto_11792 ) ) ( not ( = ?auto_11795 ?auto_11797 ) ) ( not ( = ?auto_11763 ?auto_11770 ) ) ( not ( = ?auto_11763 ?auto_11794 ) ) ( not ( = ?auto_11764 ?auto_11770 ) ) ( not ( = ?auto_11764 ?auto_11794 ) ) ( not ( = ?auto_11765 ?auto_11770 ) ) ( not ( = ?auto_11765 ?auto_11794 ) ) ( not ( = ?auto_11766 ?auto_11770 ) ) ( not ( = ?auto_11766 ?auto_11794 ) ) ( not ( = ?auto_11767 ?auto_11770 ) ) ( not ( = ?auto_11767 ?auto_11794 ) ) ( not ( = ?auto_11768 ?auto_11770 ) ) ( not ( = ?auto_11768 ?auto_11794 ) ) ( not ( = ?auto_11770 ?auto_11795 ) ) ( not ( = ?auto_11770 ?auto_11802 ) ) ( not ( = ?auto_11770 ?auto_11791 ) ) ( not ( = ?auto_11770 ?auto_11785 ) ) ( not ( = ?auto_11770 ?auto_11792 ) ) ( not ( = ?auto_11770 ?auto_11797 ) ) ( not ( = ?auto_11794 ?auto_11795 ) ) ( not ( = ?auto_11794 ?auto_11802 ) ) ( not ( = ?auto_11794 ?auto_11791 ) ) ( not ( = ?auto_11794 ?auto_11785 ) ) ( not ( = ?auto_11794 ?auto_11792 ) ) ( not ( = ?auto_11794 ?auto_11797 ) ) ( not ( = ?auto_11763 ?auto_11771 ) ) ( not ( = ?auto_11763 ?auto_11783 ) ) ( not ( = ?auto_11764 ?auto_11771 ) ) ( not ( = ?auto_11764 ?auto_11783 ) ) ( not ( = ?auto_11765 ?auto_11771 ) ) ( not ( = ?auto_11765 ?auto_11783 ) ) ( not ( = ?auto_11766 ?auto_11771 ) ) ( not ( = ?auto_11766 ?auto_11783 ) ) ( not ( = ?auto_11767 ?auto_11771 ) ) ( not ( = ?auto_11767 ?auto_11783 ) ) ( not ( = ?auto_11768 ?auto_11771 ) ) ( not ( = ?auto_11768 ?auto_11783 ) ) ( not ( = ?auto_11769 ?auto_11771 ) ) ( not ( = ?auto_11769 ?auto_11783 ) ) ( not ( = ?auto_11771 ?auto_11794 ) ) ( not ( = ?auto_11771 ?auto_11795 ) ) ( not ( = ?auto_11771 ?auto_11802 ) ) ( not ( = ?auto_11771 ?auto_11791 ) ) ( not ( = ?auto_11771 ?auto_11785 ) ) ( not ( = ?auto_11771 ?auto_11792 ) ) ( not ( = ?auto_11771 ?auto_11797 ) ) ( not ( = ?auto_11783 ?auto_11794 ) ) ( not ( = ?auto_11783 ?auto_11795 ) ) ( not ( = ?auto_11783 ?auto_11802 ) ) ( not ( = ?auto_11783 ?auto_11791 ) ) ( not ( = ?auto_11783 ?auto_11785 ) ) ( not ( = ?auto_11783 ?auto_11792 ) ) ( not ( = ?auto_11783 ?auto_11797 ) ) ( not ( = ?auto_11763 ?auto_11772 ) ) ( not ( = ?auto_11763 ?auto_11782 ) ) ( not ( = ?auto_11764 ?auto_11772 ) ) ( not ( = ?auto_11764 ?auto_11782 ) ) ( not ( = ?auto_11765 ?auto_11772 ) ) ( not ( = ?auto_11765 ?auto_11782 ) ) ( not ( = ?auto_11766 ?auto_11772 ) ) ( not ( = ?auto_11766 ?auto_11782 ) ) ( not ( = ?auto_11767 ?auto_11772 ) ) ( not ( = ?auto_11767 ?auto_11782 ) ) ( not ( = ?auto_11768 ?auto_11772 ) ) ( not ( = ?auto_11768 ?auto_11782 ) ) ( not ( = ?auto_11769 ?auto_11772 ) ) ( not ( = ?auto_11769 ?auto_11782 ) ) ( not ( = ?auto_11770 ?auto_11772 ) ) ( not ( = ?auto_11770 ?auto_11782 ) ) ( not ( = ?auto_11772 ?auto_11783 ) ) ( not ( = ?auto_11772 ?auto_11794 ) ) ( not ( = ?auto_11772 ?auto_11795 ) ) ( not ( = ?auto_11772 ?auto_11802 ) ) ( not ( = ?auto_11772 ?auto_11791 ) ) ( not ( = ?auto_11772 ?auto_11785 ) ) ( not ( = ?auto_11772 ?auto_11792 ) ) ( not ( = ?auto_11772 ?auto_11797 ) ) ( not ( = ?auto_11801 ?auto_11798 ) ) ( not ( = ?auto_11801 ?auto_11787 ) ) ( not ( = ?auto_11801 ?auto_11790 ) ) ( not ( = ?auto_11801 ?auto_11784 ) ) ( not ( = ?auto_11801 ?auto_11786 ) ) ( not ( = ?auto_11789 ?auto_11796 ) ) ( not ( = ?auto_11789 ?auto_11788 ) ) ( not ( = ?auto_11789 ?auto_11799 ) ) ( not ( = ?auto_11789 ?auto_11781 ) ) ( not ( = ?auto_11789 ?auto_11793 ) ) ( not ( = ?auto_11782 ?auto_11783 ) ) ( not ( = ?auto_11782 ?auto_11794 ) ) ( not ( = ?auto_11782 ?auto_11795 ) ) ( not ( = ?auto_11782 ?auto_11802 ) ) ( not ( = ?auto_11782 ?auto_11791 ) ) ( not ( = ?auto_11782 ?auto_11785 ) ) ( not ( = ?auto_11782 ?auto_11792 ) ) ( not ( = ?auto_11782 ?auto_11797 ) ) ( not ( = ?auto_11763 ?auto_11773 ) ) ( not ( = ?auto_11763 ?auto_11800 ) ) ( not ( = ?auto_11764 ?auto_11773 ) ) ( not ( = ?auto_11764 ?auto_11800 ) ) ( not ( = ?auto_11765 ?auto_11773 ) ) ( not ( = ?auto_11765 ?auto_11800 ) ) ( not ( = ?auto_11766 ?auto_11773 ) ) ( not ( = ?auto_11766 ?auto_11800 ) ) ( not ( = ?auto_11767 ?auto_11773 ) ) ( not ( = ?auto_11767 ?auto_11800 ) ) ( not ( = ?auto_11768 ?auto_11773 ) ) ( not ( = ?auto_11768 ?auto_11800 ) ) ( not ( = ?auto_11769 ?auto_11773 ) ) ( not ( = ?auto_11769 ?auto_11800 ) ) ( not ( = ?auto_11770 ?auto_11773 ) ) ( not ( = ?auto_11770 ?auto_11800 ) ) ( not ( = ?auto_11771 ?auto_11773 ) ) ( not ( = ?auto_11771 ?auto_11800 ) ) ( not ( = ?auto_11773 ?auto_11782 ) ) ( not ( = ?auto_11773 ?auto_11783 ) ) ( not ( = ?auto_11773 ?auto_11794 ) ) ( not ( = ?auto_11773 ?auto_11795 ) ) ( not ( = ?auto_11773 ?auto_11802 ) ) ( not ( = ?auto_11773 ?auto_11791 ) ) ( not ( = ?auto_11773 ?auto_11785 ) ) ( not ( = ?auto_11773 ?auto_11792 ) ) ( not ( = ?auto_11773 ?auto_11797 ) ) ( not ( = ?auto_11800 ?auto_11782 ) ) ( not ( = ?auto_11800 ?auto_11783 ) ) ( not ( = ?auto_11800 ?auto_11794 ) ) ( not ( = ?auto_11800 ?auto_11795 ) ) ( not ( = ?auto_11800 ?auto_11802 ) ) ( not ( = ?auto_11800 ?auto_11791 ) ) ( not ( = ?auto_11800 ?auto_11785 ) ) ( not ( = ?auto_11800 ?auto_11792 ) ) ( not ( = ?auto_11800 ?auto_11797 ) ) ( not ( = ?auto_11763 ?auto_11774 ) ) ( not ( = ?auto_11763 ?auto_11775 ) ) ( not ( = ?auto_11764 ?auto_11774 ) ) ( not ( = ?auto_11764 ?auto_11775 ) ) ( not ( = ?auto_11765 ?auto_11774 ) ) ( not ( = ?auto_11765 ?auto_11775 ) ) ( not ( = ?auto_11766 ?auto_11774 ) ) ( not ( = ?auto_11766 ?auto_11775 ) ) ( not ( = ?auto_11767 ?auto_11774 ) ) ( not ( = ?auto_11767 ?auto_11775 ) ) ( not ( = ?auto_11768 ?auto_11774 ) ) ( not ( = ?auto_11768 ?auto_11775 ) ) ( not ( = ?auto_11769 ?auto_11774 ) ) ( not ( = ?auto_11769 ?auto_11775 ) ) ( not ( = ?auto_11770 ?auto_11774 ) ) ( not ( = ?auto_11770 ?auto_11775 ) ) ( not ( = ?auto_11771 ?auto_11774 ) ) ( not ( = ?auto_11771 ?auto_11775 ) ) ( not ( = ?auto_11772 ?auto_11774 ) ) ( not ( = ?auto_11772 ?auto_11775 ) ) ( not ( = ?auto_11774 ?auto_11800 ) ) ( not ( = ?auto_11774 ?auto_11782 ) ) ( not ( = ?auto_11774 ?auto_11783 ) ) ( not ( = ?auto_11774 ?auto_11794 ) ) ( not ( = ?auto_11774 ?auto_11795 ) ) ( not ( = ?auto_11774 ?auto_11802 ) ) ( not ( = ?auto_11774 ?auto_11791 ) ) ( not ( = ?auto_11774 ?auto_11785 ) ) ( not ( = ?auto_11774 ?auto_11792 ) ) ( not ( = ?auto_11774 ?auto_11797 ) ) ( not ( = ?auto_11780 ?auto_11801 ) ) ( not ( = ?auto_11780 ?auto_11798 ) ) ( not ( = ?auto_11780 ?auto_11787 ) ) ( not ( = ?auto_11780 ?auto_11790 ) ) ( not ( = ?auto_11780 ?auto_11784 ) ) ( not ( = ?auto_11780 ?auto_11786 ) ) ( not ( = ?auto_11779 ?auto_11789 ) ) ( not ( = ?auto_11779 ?auto_11796 ) ) ( not ( = ?auto_11779 ?auto_11788 ) ) ( not ( = ?auto_11779 ?auto_11799 ) ) ( not ( = ?auto_11779 ?auto_11781 ) ) ( not ( = ?auto_11779 ?auto_11793 ) ) ( not ( = ?auto_11775 ?auto_11800 ) ) ( not ( = ?auto_11775 ?auto_11782 ) ) ( not ( = ?auto_11775 ?auto_11783 ) ) ( not ( = ?auto_11775 ?auto_11794 ) ) ( not ( = ?auto_11775 ?auto_11795 ) ) ( not ( = ?auto_11775 ?auto_11802 ) ) ( not ( = ?auto_11775 ?auto_11791 ) ) ( not ( = ?auto_11775 ?auto_11785 ) ) ( not ( = ?auto_11775 ?auto_11792 ) ) ( not ( = ?auto_11775 ?auto_11797 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_11763 ?auto_11764 ?auto_11765 ?auto_11766 ?auto_11767 ?auto_11768 ?auto_11769 ?auto_11770 ?auto_11771 ?auto_11772 ?auto_11773 )
      ( MAKE-1CRATE ?auto_11773 ?auto_11774 )
      ( MAKE-11CRATE-VERIFY ?auto_11763 ?auto_11764 ?auto_11765 ?auto_11766 ?auto_11767 ?auto_11768 ?auto_11769 ?auto_11770 ?auto_11771 ?auto_11772 ?auto_11773 ?auto_11774 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_11826 - SURFACE
      ?auto_11827 - SURFACE
      ?auto_11828 - SURFACE
      ?auto_11829 - SURFACE
      ?auto_11830 - SURFACE
      ?auto_11831 - SURFACE
      ?auto_11832 - SURFACE
      ?auto_11833 - SURFACE
      ?auto_11834 - SURFACE
      ?auto_11835 - SURFACE
      ?auto_11836 - SURFACE
      ?auto_11837 - SURFACE
      ?auto_11838 - SURFACE
    )
    :vars
    (
      ?auto_11844 - HOIST
      ?auto_11842 - PLACE
      ?auto_11840 - PLACE
      ?auto_11839 - HOIST
      ?auto_11841 - SURFACE
      ?auto_11867 - PLACE
      ?auto_11852 - HOIST
      ?auto_11855 - SURFACE
      ?auto_11856 - PLACE
      ?auto_11863 - HOIST
      ?auto_11846 - SURFACE
      ?auto_11866 - SURFACE
      ?auto_11862 - PLACE
      ?auto_11864 - HOIST
      ?auto_11853 - SURFACE
      ?auto_11851 - PLACE
      ?auto_11865 - HOIST
      ?auto_11850 - SURFACE
      ?auto_11859 - PLACE
      ?auto_11845 - HOIST
      ?auto_11861 - SURFACE
      ?auto_11849 - SURFACE
      ?auto_11860 - SURFACE
      ?auto_11858 - SURFACE
      ?auto_11847 - PLACE
      ?auto_11854 - HOIST
      ?auto_11857 - SURFACE
      ?auto_11848 - SURFACE
      ?auto_11843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11844 ?auto_11842 ) ( IS-CRATE ?auto_11838 ) ( not ( = ?auto_11840 ?auto_11842 ) ) ( HOIST-AT ?auto_11839 ?auto_11840 ) ( SURFACE-AT ?auto_11838 ?auto_11840 ) ( ON ?auto_11838 ?auto_11841 ) ( CLEAR ?auto_11838 ) ( not ( = ?auto_11837 ?auto_11838 ) ) ( not ( = ?auto_11837 ?auto_11841 ) ) ( not ( = ?auto_11838 ?auto_11841 ) ) ( not ( = ?auto_11844 ?auto_11839 ) ) ( IS-CRATE ?auto_11837 ) ( not ( = ?auto_11867 ?auto_11842 ) ) ( HOIST-AT ?auto_11852 ?auto_11867 ) ( AVAILABLE ?auto_11852 ) ( SURFACE-AT ?auto_11837 ?auto_11867 ) ( ON ?auto_11837 ?auto_11855 ) ( CLEAR ?auto_11837 ) ( not ( = ?auto_11836 ?auto_11837 ) ) ( not ( = ?auto_11836 ?auto_11855 ) ) ( not ( = ?auto_11837 ?auto_11855 ) ) ( not ( = ?auto_11844 ?auto_11852 ) ) ( IS-CRATE ?auto_11836 ) ( not ( = ?auto_11856 ?auto_11842 ) ) ( HOIST-AT ?auto_11863 ?auto_11856 ) ( SURFACE-AT ?auto_11836 ?auto_11856 ) ( ON ?auto_11836 ?auto_11846 ) ( CLEAR ?auto_11836 ) ( not ( = ?auto_11835 ?auto_11836 ) ) ( not ( = ?auto_11835 ?auto_11846 ) ) ( not ( = ?auto_11836 ?auto_11846 ) ) ( not ( = ?auto_11844 ?auto_11863 ) ) ( IS-CRATE ?auto_11835 ) ( AVAILABLE ?auto_11863 ) ( SURFACE-AT ?auto_11835 ?auto_11856 ) ( ON ?auto_11835 ?auto_11866 ) ( CLEAR ?auto_11835 ) ( not ( = ?auto_11834 ?auto_11835 ) ) ( not ( = ?auto_11834 ?auto_11866 ) ) ( not ( = ?auto_11835 ?auto_11866 ) ) ( IS-CRATE ?auto_11834 ) ( not ( = ?auto_11862 ?auto_11842 ) ) ( HOIST-AT ?auto_11864 ?auto_11862 ) ( SURFACE-AT ?auto_11834 ?auto_11862 ) ( ON ?auto_11834 ?auto_11853 ) ( CLEAR ?auto_11834 ) ( not ( = ?auto_11833 ?auto_11834 ) ) ( not ( = ?auto_11833 ?auto_11853 ) ) ( not ( = ?auto_11834 ?auto_11853 ) ) ( not ( = ?auto_11844 ?auto_11864 ) ) ( IS-CRATE ?auto_11833 ) ( not ( = ?auto_11851 ?auto_11842 ) ) ( HOIST-AT ?auto_11865 ?auto_11851 ) ( SURFACE-AT ?auto_11833 ?auto_11851 ) ( ON ?auto_11833 ?auto_11850 ) ( CLEAR ?auto_11833 ) ( not ( = ?auto_11832 ?auto_11833 ) ) ( not ( = ?auto_11832 ?auto_11850 ) ) ( not ( = ?auto_11833 ?auto_11850 ) ) ( not ( = ?auto_11844 ?auto_11865 ) ) ( IS-CRATE ?auto_11832 ) ( not ( = ?auto_11859 ?auto_11842 ) ) ( HOIST-AT ?auto_11845 ?auto_11859 ) ( AVAILABLE ?auto_11845 ) ( SURFACE-AT ?auto_11832 ?auto_11859 ) ( ON ?auto_11832 ?auto_11861 ) ( CLEAR ?auto_11832 ) ( not ( = ?auto_11831 ?auto_11832 ) ) ( not ( = ?auto_11831 ?auto_11861 ) ) ( not ( = ?auto_11832 ?auto_11861 ) ) ( not ( = ?auto_11844 ?auto_11845 ) ) ( IS-CRATE ?auto_11831 ) ( AVAILABLE ?auto_11865 ) ( SURFACE-AT ?auto_11831 ?auto_11851 ) ( ON ?auto_11831 ?auto_11849 ) ( CLEAR ?auto_11831 ) ( not ( = ?auto_11830 ?auto_11831 ) ) ( not ( = ?auto_11830 ?auto_11849 ) ) ( not ( = ?auto_11831 ?auto_11849 ) ) ( IS-CRATE ?auto_11830 ) ( AVAILABLE ?auto_11839 ) ( SURFACE-AT ?auto_11830 ?auto_11840 ) ( ON ?auto_11830 ?auto_11860 ) ( CLEAR ?auto_11830 ) ( not ( = ?auto_11829 ?auto_11830 ) ) ( not ( = ?auto_11829 ?auto_11860 ) ) ( not ( = ?auto_11830 ?auto_11860 ) ) ( IS-CRATE ?auto_11829 ) ( AVAILABLE ?auto_11864 ) ( SURFACE-AT ?auto_11829 ?auto_11862 ) ( ON ?auto_11829 ?auto_11858 ) ( CLEAR ?auto_11829 ) ( not ( = ?auto_11828 ?auto_11829 ) ) ( not ( = ?auto_11828 ?auto_11858 ) ) ( not ( = ?auto_11829 ?auto_11858 ) ) ( IS-CRATE ?auto_11828 ) ( not ( = ?auto_11847 ?auto_11842 ) ) ( HOIST-AT ?auto_11854 ?auto_11847 ) ( SURFACE-AT ?auto_11828 ?auto_11847 ) ( ON ?auto_11828 ?auto_11857 ) ( CLEAR ?auto_11828 ) ( not ( = ?auto_11827 ?auto_11828 ) ) ( not ( = ?auto_11827 ?auto_11857 ) ) ( not ( = ?auto_11828 ?auto_11857 ) ) ( not ( = ?auto_11844 ?auto_11854 ) ) ( SURFACE-AT ?auto_11826 ?auto_11842 ) ( CLEAR ?auto_11826 ) ( IS-CRATE ?auto_11827 ) ( AVAILABLE ?auto_11844 ) ( AVAILABLE ?auto_11854 ) ( SURFACE-AT ?auto_11827 ?auto_11847 ) ( ON ?auto_11827 ?auto_11848 ) ( CLEAR ?auto_11827 ) ( TRUCK-AT ?auto_11843 ?auto_11842 ) ( not ( = ?auto_11826 ?auto_11827 ) ) ( not ( = ?auto_11826 ?auto_11848 ) ) ( not ( = ?auto_11827 ?auto_11848 ) ) ( not ( = ?auto_11826 ?auto_11828 ) ) ( not ( = ?auto_11826 ?auto_11857 ) ) ( not ( = ?auto_11828 ?auto_11848 ) ) ( not ( = ?auto_11857 ?auto_11848 ) ) ( not ( = ?auto_11826 ?auto_11829 ) ) ( not ( = ?auto_11826 ?auto_11858 ) ) ( not ( = ?auto_11827 ?auto_11829 ) ) ( not ( = ?auto_11827 ?auto_11858 ) ) ( not ( = ?auto_11829 ?auto_11857 ) ) ( not ( = ?auto_11829 ?auto_11848 ) ) ( not ( = ?auto_11862 ?auto_11847 ) ) ( not ( = ?auto_11864 ?auto_11854 ) ) ( not ( = ?auto_11858 ?auto_11857 ) ) ( not ( = ?auto_11858 ?auto_11848 ) ) ( not ( = ?auto_11826 ?auto_11830 ) ) ( not ( = ?auto_11826 ?auto_11860 ) ) ( not ( = ?auto_11827 ?auto_11830 ) ) ( not ( = ?auto_11827 ?auto_11860 ) ) ( not ( = ?auto_11828 ?auto_11830 ) ) ( not ( = ?auto_11828 ?auto_11860 ) ) ( not ( = ?auto_11830 ?auto_11858 ) ) ( not ( = ?auto_11830 ?auto_11857 ) ) ( not ( = ?auto_11830 ?auto_11848 ) ) ( not ( = ?auto_11840 ?auto_11862 ) ) ( not ( = ?auto_11840 ?auto_11847 ) ) ( not ( = ?auto_11839 ?auto_11864 ) ) ( not ( = ?auto_11839 ?auto_11854 ) ) ( not ( = ?auto_11860 ?auto_11858 ) ) ( not ( = ?auto_11860 ?auto_11857 ) ) ( not ( = ?auto_11860 ?auto_11848 ) ) ( not ( = ?auto_11826 ?auto_11831 ) ) ( not ( = ?auto_11826 ?auto_11849 ) ) ( not ( = ?auto_11827 ?auto_11831 ) ) ( not ( = ?auto_11827 ?auto_11849 ) ) ( not ( = ?auto_11828 ?auto_11831 ) ) ( not ( = ?auto_11828 ?auto_11849 ) ) ( not ( = ?auto_11829 ?auto_11831 ) ) ( not ( = ?auto_11829 ?auto_11849 ) ) ( not ( = ?auto_11831 ?auto_11860 ) ) ( not ( = ?auto_11831 ?auto_11858 ) ) ( not ( = ?auto_11831 ?auto_11857 ) ) ( not ( = ?auto_11831 ?auto_11848 ) ) ( not ( = ?auto_11851 ?auto_11840 ) ) ( not ( = ?auto_11851 ?auto_11862 ) ) ( not ( = ?auto_11851 ?auto_11847 ) ) ( not ( = ?auto_11865 ?auto_11839 ) ) ( not ( = ?auto_11865 ?auto_11864 ) ) ( not ( = ?auto_11865 ?auto_11854 ) ) ( not ( = ?auto_11849 ?auto_11860 ) ) ( not ( = ?auto_11849 ?auto_11858 ) ) ( not ( = ?auto_11849 ?auto_11857 ) ) ( not ( = ?auto_11849 ?auto_11848 ) ) ( not ( = ?auto_11826 ?auto_11832 ) ) ( not ( = ?auto_11826 ?auto_11861 ) ) ( not ( = ?auto_11827 ?auto_11832 ) ) ( not ( = ?auto_11827 ?auto_11861 ) ) ( not ( = ?auto_11828 ?auto_11832 ) ) ( not ( = ?auto_11828 ?auto_11861 ) ) ( not ( = ?auto_11829 ?auto_11832 ) ) ( not ( = ?auto_11829 ?auto_11861 ) ) ( not ( = ?auto_11830 ?auto_11832 ) ) ( not ( = ?auto_11830 ?auto_11861 ) ) ( not ( = ?auto_11832 ?auto_11849 ) ) ( not ( = ?auto_11832 ?auto_11860 ) ) ( not ( = ?auto_11832 ?auto_11858 ) ) ( not ( = ?auto_11832 ?auto_11857 ) ) ( not ( = ?auto_11832 ?auto_11848 ) ) ( not ( = ?auto_11859 ?auto_11851 ) ) ( not ( = ?auto_11859 ?auto_11840 ) ) ( not ( = ?auto_11859 ?auto_11862 ) ) ( not ( = ?auto_11859 ?auto_11847 ) ) ( not ( = ?auto_11845 ?auto_11865 ) ) ( not ( = ?auto_11845 ?auto_11839 ) ) ( not ( = ?auto_11845 ?auto_11864 ) ) ( not ( = ?auto_11845 ?auto_11854 ) ) ( not ( = ?auto_11861 ?auto_11849 ) ) ( not ( = ?auto_11861 ?auto_11860 ) ) ( not ( = ?auto_11861 ?auto_11858 ) ) ( not ( = ?auto_11861 ?auto_11857 ) ) ( not ( = ?auto_11861 ?auto_11848 ) ) ( not ( = ?auto_11826 ?auto_11833 ) ) ( not ( = ?auto_11826 ?auto_11850 ) ) ( not ( = ?auto_11827 ?auto_11833 ) ) ( not ( = ?auto_11827 ?auto_11850 ) ) ( not ( = ?auto_11828 ?auto_11833 ) ) ( not ( = ?auto_11828 ?auto_11850 ) ) ( not ( = ?auto_11829 ?auto_11833 ) ) ( not ( = ?auto_11829 ?auto_11850 ) ) ( not ( = ?auto_11830 ?auto_11833 ) ) ( not ( = ?auto_11830 ?auto_11850 ) ) ( not ( = ?auto_11831 ?auto_11833 ) ) ( not ( = ?auto_11831 ?auto_11850 ) ) ( not ( = ?auto_11833 ?auto_11861 ) ) ( not ( = ?auto_11833 ?auto_11849 ) ) ( not ( = ?auto_11833 ?auto_11860 ) ) ( not ( = ?auto_11833 ?auto_11858 ) ) ( not ( = ?auto_11833 ?auto_11857 ) ) ( not ( = ?auto_11833 ?auto_11848 ) ) ( not ( = ?auto_11850 ?auto_11861 ) ) ( not ( = ?auto_11850 ?auto_11849 ) ) ( not ( = ?auto_11850 ?auto_11860 ) ) ( not ( = ?auto_11850 ?auto_11858 ) ) ( not ( = ?auto_11850 ?auto_11857 ) ) ( not ( = ?auto_11850 ?auto_11848 ) ) ( not ( = ?auto_11826 ?auto_11834 ) ) ( not ( = ?auto_11826 ?auto_11853 ) ) ( not ( = ?auto_11827 ?auto_11834 ) ) ( not ( = ?auto_11827 ?auto_11853 ) ) ( not ( = ?auto_11828 ?auto_11834 ) ) ( not ( = ?auto_11828 ?auto_11853 ) ) ( not ( = ?auto_11829 ?auto_11834 ) ) ( not ( = ?auto_11829 ?auto_11853 ) ) ( not ( = ?auto_11830 ?auto_11834 ) ) ( not ( = ?auto_11830 ?auto_11853 ) ) ( not ( = ?auto_11831 ?auto_11834 ) ) ( not ( = ?auto_11831 ?auto_11853 ) ) ( not ( = ?auto_11832 ?auto_11834 ) ) ( not ( = ?auto_11832 ?auto_11853 ) ) ( not ( = ?auto_11834 ?auto_11850 ) ) ( not ( = ?auto_11834 ?auto_11861 ) ) ( not ( = ?auto_11834 ?auto_11849 ) ) ( not ( = ?auto_11834 ?auto_11860 ) ) ( not ( = ?auto_11834 ?auto_11858 ) ) ( not ( = ?auto_11834 ?auto_11857 ) ) ( not ( = ?auto_11834 ?auto_11848 ) ) ( not ( = ?auto_11853 ?auto_11850 ) ) ( not ( = ?auto_11853 ?auto_11861 ) ) ( not ( = ?auto_11853 ?auto_11849 ) ) ( not ( = ?auto_11853 ?auto_11860 ) ) ( not ( = ?auto_11853 ?auto_11858 ) ) ( not ( = ?auto_11853 ?auto_11857 ) ) ( not ( = ?auto_11853 ?auto_11848 ) ) ( not ( = ?auto_11826 ?auto_11835 ) ) ( not ( = ?auto_11826 ?auto_11866 ) ) ( not ( = ?auto_11827 ?auto_11835 ) ) ( not ( = ?auto_11827 ?auto_11866 ) ) ( not ( = ?auto_11828 ?auto_11835 ) ) ( not ( = ?auto_11828 ?auto_11866 ) ) ( not ( = ?auto_11829 ?auto_11835 ) ) ( not ( = ?auto_11829 ?auto_11866 ) ) ( not ( = ?auto_11830 ?auto_11835 ) ) ( not ( = ?auto_11830 ?auto_11866 ) ) ( not ( = ?auto_11831 ?auto_11835 ) ) ( not ( = ?auto_11831 ?auto_11866 ) ) ( not ( = ?auto_11832 ?auto_11835 ) ) ( not ( = ?auto_11832 ?auto_11866 ) ) ( not ( = ?auto_11833 ?auto_11835 ) ) ( not ( = ?auto_11833 ?auto_11866 ) ) ( not ( = ?auto_11835 ?auto_11853 ) ) ( not ( = ?auto_11835 ?auto_11850 ) ) ( not ( = ?auto_11835 ?auto_11861 ) ) ( not ( = ?auto_11835 ?auto_11849 ) ) ( not ( = ?auto_11835 ?auto_11860 ) ) ( not ( = ?auto_11835 ?auto_11858 ) ) ( not ( = ?auto_11835 ?auto_11857 ) ) ( not ( = ?auto_11835 ?auto_11848 ) ) ( not ( = ?auto_11856 ?auto_11862 ) ) ( not ( = ?auto_11856 ?auto_11851 ) ) ( not ( = ?auto_11856 ?auto_11859 ) ) ( not ( = ?auto_11856 ?auto_11840 ) ) ( not ( = ?auto_11856 ?auto_11847 ) ) ( not ( = ?auto_11863 ?auto_11864 ) ) ( not ( = ?auto_11863 ?auto_11865 ) ) ( not ( = ?auto_11863 ?auto_11845 ) ) ( not ( = ?auto_11863 ?auto_11839 ) ) ( not ( = ?auto_11863 ?auto_11854 ) ) ( not ( = ?auto_11866 ?auto_11853 ) ) ( not ( = ?auto_11866 ?auto_11850 ) ) ( not ( = ?auto_11866 ?auto_11861 ) ) ( not ( = ?auto_11866 ?auto_11849 ) ) ( not ( = ?auto_11866 ?auto_11860 ) ) ( not ( = ?auto_11866 ?auto_11858 ) ) ( not ( = ?auto_11866 ?auto_11857 ) ) ( not ( = ?auto_11866 ?auto_11848 ) ) ( not ( = ?auto_11826 ?auto_11836 ) ) ( not ( = ?auto_11826 ?auto_11846 ) ) ( not ( = ?auto_11827 ?auto_11836 ) ) ( not ( = ?auto_11827 ?auto_11846 ) ) ( not ( = ?auto_11828 ?auto_11836 ) ) ( not ( = ?auto_11828 ?auto_11846 ) ) ( not ( = ?auto_11829 ?auto_11836 ) ) ( not ( = ?auto_11829 ?auto_11846 ) ) ( not ( = ?auto_11830 ?auto_11836 ) ) ( not ( = ?auto_11830 ?auto_11846 ) ) ( not ( = ?auto_11831 ?auto_11836 ) ) ( not ( = ?auto_11831 ?auto_11846 ) ) ( not ( = ?auto_11832 ?auto_11836 ) ) ( not ( = ?auto_11832 ?auto_11846 ) ) ( not ( = ?auto_11833 ?auto_11836 ) ) ( not ( = ?auto_11833 ?auto_11846 ) ) ( not ( = ?auto_11834 ?auto_11836 ) ) ( not ( = ?auto_11834 ?auto_11846 ) ) ( not ( = ?auto_11836 ?auto_11866 ) ) ( not ( = ?auto_11836 ?auto_11853 ) ) ( not ( = ?auto_11836 ?auto_11850 ) ) ( not ( = ?auto_11836 ?auto_11861 ) ) ( not ( = ?auto_11836 ?auto_11849 ) ) ( not ( = ?auto_11836 ?auto_11860 ) ) ( not ( = ?auto_11836 ?auto_11858 ) ) ( not ( = ?auto_11836 ?auto_11857 ) ) ( not ( = ?auto_11836 ?auto_11848 ) ) ( not ( = ?auto_11846 ?auto_11866 ) ) ( not ( = ?auto_11846 ?auto_11853 ) ) ( not ( = ?auto_11846 ?auto_11850 ) ) ( not ( = ?auto_11846 ?auto_11861 ) ) ( not ( = ?auto_11846 ?auto_11849 ) ) ( not ( = ?auto_11846 ?auto_11860 ) ) ( not ( = ?auto_11846 ?auto_11858 ) ) ( not ( = ?auto_11846 ?auto_11857 ) ) ( not ( = ?auto_11846 ?auto_11848 ) ) ( not ( = ?auto_11826 ?auto_11837 ) ) ( not ( = ?auto_11826 ?auto_11855 ) ) ( not ( = ?auto_11827 ?auto_11837 ) ) ( not ( = ?auto_11827 ?auto_11855 ) ) ( not ( = ?auto_11828 ?auto_11837 ) ) ( not ( = ?auto_11828 ?auto_11855 ) ) ( not ( = ?auto_11829 ?auto_11837 ) ) ( not ( = ?auto_11829 ?auto_11855 ) ) ( not ( = ?auto_11830 ?auto_11837 ) ) ( not ( = ?auto_11830 ?auto_11855 ) ) ( not ( = ?auto_11831 ?auto_11837 ) ) ( not ( = ?auto_11831 ?auto_11855 ) ) ( not ( = ?auto_11832 ?auto_11837 ) ) ( not ( = ?auto_11832 ?auto_11855 ) ) ( not ( = ?auto_11833 ?auto_11837 ) ) ( not ( = ?auto_11833 ?auto_11855 ) ) ( not ( = ?auto_11834 ?auto_11837 ) ) ( not ( = ?auto_11834 ?auto_11855 ) ) ( not ( = ?auto_11835 ?auto_11837 ) ) ( not ( = ?auto_11835 ?auto_11855 ) ) ( not ( = ?auto_11837 ?auto_11846 ) ) ( not ( = ?auto_11837 ?auto_11866 ) ) ( not ( = ?auto_11837 ?auto_11853 ) ) ( not ( = ?auto_11837 ?auto_11850 ) ) ( not ( = ?auto_11837 ?auto_11861 ) ) ( not ( = ?auto_11837 ?auto_11849 ) ) ( not ( = ?auto_11837 ?auto_11860 ) ) ( not ( = ?auto_11837 ?auto_11858 ) ) ( not ( = ?auto_11837 ?auto_11857 ) ) ( not ( = ?auto_11837 ?auto_11848 ) ) ( not ( = ?auto_11867 ?auto_11856 ) ) ( not ( = ?auto_11867 ?auto_11862 ) ) ( not ( = ?auto_11867 ?auto_11851 ) ) ( not ( = ?auto_11867 ?auto_11859 ) ) ( not ( = ?auto_11867 ?auto_11840 ) ) ( not ( = ?auto_11867 ?auto_11847 ) ) ( not ( = ?auto_11852 ?auto_11863 ) ) ( not ( = ?auto_11852 ?auto_11864 ) ) ( not ( = ?auto_11852 ?auto_11865 ) ) ( not ( = ?auto_11852 ?auto_11845 ) ) ( not ( = ?auto_11852 ?auto_11839 ) ) ( not ( = ?auto_11852 ?auto_11854 ) ) ( not ( = ?auto_11855 ?auto_11846 ) ) ( not ( = ?auto_11855 ?auto_11866 ) ) ( not ( = ?auto_11855 ?auto_11853 ) ) ( not ( = ?auto_11855 ?auto_11850 ) ) ( not ( = ?auto_11855 ?auto_11861 ) ) ( not ( = ?auto_11855 ?auto_11849 ) ) ( not ( = ?auto_11855 ?auto_11860 ) ) ( not ( = ?auto_11855 ?auto_11858 ) ) ( not ( = ?auto_11855 ?auto_11857 ) ) ( not ( = ?auto_11855 ?auto_11848 ) ) ( not ( = ?auto_11826 ?auto_11838 ) ) ( not ( = ?auto_11826 ?auto_11841 ) ) ( not ( = ?auto_11827 ?auto_11838 ) ) ( not ( = ?auto_11827 ?auto_11841 ) ) ( not ( = ?auto_11828 ?auto_11838 ) ) ( not ( = ?auto_11828 ?auto_11841 ) ) ( not ( = ?auto_11829 ?auto_11838 ) ) ( not ( = ?auto_11829 ?auto_11841 ) ) ( not ( = ?auto_11830 ?auto_11838 ) ) ( not ( = ?auto_11830 ?auto_11841 ) ) ( not ( = ?auto_11831 ?auto_11838 ) ) ( not ( = ?auto_11831 ?auto_11841 ) ) ( not ( = ?auto_11832 ?auto_11838 ) ) ( not ( = ?auto_11832 ?auto_11841 ) ) ( not ( = ?auto_11833 ?auto_11838 ) ) ( not ( = ?auto_11833 ?auto_11841 ) ) ( not ( = ?auto_11834 ?auto_11838 ) ) ( not ( = ?auto_11834 ?auto_11841 ) ) ( not ( = ?auto_11835 ?auto_11838 ) ) ( not ( = ?auto_11835 ?auto_11841 ) ) ( not ( = ?auto_11836 ?auto_11838 ) ) ( not ( = ?auto_11836 ?auto_11841 ) ) ( not ( = ?auto_11838 ?auto_11855 ) ) ( not ( = ?auto_11838 ?auto_11846 ) ) ( not ( = ?auto_11838 ?auto_11866 ) ) ( not ( = ?auto_11838 ?auto_11853 ) ) ( not ( = ?auto_11838 ?auto_11850 ) ) ( not ( = ?auto_11838 ?auto_11861 ) ) ( not ( = ?auto_11838 ?auto_11849 ) ) ( not ( = ?auto_11838 ?auto_11860 ) ) ( not ( = ?auto_11838 ?auto_11858 ) ) ( not ( = ?auto_11838 ?auto_11857 ) ) ( not ( = ?auto_11838 ?auto_11848 ) ) ( not ( = ?auto_11841 ?auto_11855 ) ) ( not ( = ?auto_11841 ?auto_11846 ) ) ( not ( = ?auto_11841 ?auto_11866 ) ) ( not ( = ?auto_11841 ?auto_11853 ) ) ( not ( = ?auto_11841 ?auto_11850 ) ) ( not ( = ?auto_11841 ?auto_11861 ) ) ( not ( = ?auto_11841 ?auto_11849 ) ) ( not ( = ?auto_11841 ?auto_11860 ) ) ( not ( = ?auto_11841 ?auto_11858 ) ) ( not ( = ?auto_11841 ?auto_11857 ) ) ( not ( = ?auto_11841 ?auto_11848 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_11826 ?auto_11827 ?auto_11828 ?auto_11829 ?auto_11830 ?auto_11831 ?auto_11832 ?auto_11833 ?auto_11834 ?auto_11835 ?auto_11836 ?auto_11837 )
      ( MAKE-1CRATE ?auto_11837 ?auto_11838 )
      ( MAKE-12CRATE-VERIFY ?auto_11826 ?auto_11827 ?auto_11828 ?auto_11829 ?auto_11830 ?auto_11831 ?auto_11832 ?auto_11833 ?auto_11834 ?auto_11835 ?auto_11836 ?auto_11837 ?auto_11838 ) )
  )

)

