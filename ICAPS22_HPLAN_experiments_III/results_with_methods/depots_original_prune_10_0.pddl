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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264386 - SURFACE
      ?auto_264387 - SURFACE
    )
    :vars
    (
      ?auto_264388 - HOIST
      ?auto_264389 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264388 ?auto_264389 ) ( SURFACE-AT ?auto_264386 ?auto_264389 ) ( CLEAR ?auto_264386 ) ( LIFTING ?auto_264388 ?auto_264387 ) ( IS-CRATE ?auto_264387 ) ( not ( = ?auto_264386 ?auto_264387 ) ) )
    :subtasks
    ( ( !DROP ?auto_264388 ?auto_264387 ?auto_264386 ?auto_264389 )
      ( MAKE-1CRATE-VERIFY ?auto_264386 ?auto_264387 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264390 - SURFACE
      ?auto_264391 - SURFACE
    )
    :vars
    (
      ?auto_264392 - HOIST
      ?auto_264393 - PLACE
      ?auto_264394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264392 ?auto_264393 ) ( SURFACE-AT ?auto_264390 ?auto_264393 ) ( CLEAR ?auto_264390 ) ( IS-CRATE ?auto_264391 ) ( not ( = ?auto_264390 ?auto_264391 ) ) ( TRUCK-AT ?auto_264394 ?auto_264393 ) ( AVAILABLE ?auto_264392 ) ( IN ?auto_264391 ?auto_264394 ) )
    :subtasks
    ( ( !UNLOAD ?auto_264392 ?auto_264391 ?auto_264394 ?auto_264393 )
      ( MAKE-1CRATE ?auto_264390 ?auto_264391 )
      ( MAKE-1CRATE-VERIFY ?auto_264390 ?auto_264391 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264395 - SURFACE
      ?auto_264396 - SURFACE
    )
    :vars
    (
      ?auto_264397 - HOIST
      ?auto_264398 - PLACE
      ?auto_264399 - TRUCK
      ?auto_264400 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264397 ?auto_264398 ) ( SURFACE-AT ?auto_264395 ?auto_264398 ) ( CLEAR ?auto_264395 ) ( IS-CRATE ?auto_264396 ) ( not ( = ?auto_264395 ?auto_264396 ) ) ( AVAILABLE ?auto_264397 ) ( IN ?auto_264396 ?auto_264399 ) ( TRUCK-AT ?auto_264399 ?auto_264400 ) ( not ( = ?auto_264400 ?auto_264398 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_264399 ?auto_264400 ?auto_264398 )
      ( MAKE-1CRATE ?auto_264395 ?auto_264396 )
      ( MAKE-1CRATE-VERIFY ?auto_264395 ?auto_264396 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264401 - SURFACE
      ?auto_264402 - SURFACE
    )
    :vars
    (
      ?auto_264403 - HOIST
      ?auto_264404 - PLACE
      ?auto_264405 - TRUCK
      ?auto_264406 - PLACE
      ?auto_264407 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_264403 ?auto_264404 ) ( SURFACE-AT ?auto_264401 ?auto_264404 ) ( CLEAR ?auto_264401 ) ( IS-CRATE ?auto_264402 ) ( not ( = ?auto_264401 ?auto_264402 ) ) ( AVAILABLE ?auto_264403 ) ( TRUCK-AT ?auto_264405 ?auto_264406 ) ( not ( = ?auto_264406 ?auto_264404 ) ) ( HOIST-AT ?auto_264407 ?auto_264406 ) ( LIFTING ?auto_264407 ?auto_264402 ) ( not ( = ?auto_264403 ?auto_264407 ) ) )
    :subtasks
    ( ( !LOAD ?auto_264407 ?auto_264402 ?auto_264405 ?auto_264406 )
      ( MAKE-1CRATE ?auto_264401 ?auto_264402 )
      ( MAKE-1CRATE-VERIFY ?auto_264401 ?auto_264402 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264408 - SURFACE
      ?auto_264409 - SURFACE
    )
    :vars
    (
      ?auto_264414 - HOIST
      ?auto_264411 - PLACE
      ?auto_264410 - TRUCK
      ?auto_264412 - PLACE
      ?auto_264413 - HOIST
      ?auto_264415 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264414 ?auto_264411 ) ( SURFACE-AT ?auto_264408 ?auto_264411 ) ( CLEAR ?auto_264408 ) ( IS-CRATE ?auto_264409 ) ( not ( = ?auto_264408 ?auto_264409 ) ) ( AVAILABLE ?auto_264414 ) ( TRUCK-AT ?auto_264410 ?auto_264412 ) ( not ( = ?auto_264412 ?auto_264411 ) ) ( HOIST-AT ?auto_264413 ?auto_264412 ) ( not ( = ?auto_264414 ?auto_264413 ) ) ( AVAILABLE ?auto_264413 ) ( SURFACE-AT ?auto_264409 ?auto_264412 ) ( ON ?auto_264409 ?auto_264415 ) ( CLEAR ?auto_264409 ) ( not ( = ?auto_264408 ?auto_264415 ) ) ( not ( = ?auto_264409 ?auto_264415 ) ) )
    :subtasks
    ( ( !LIFT ?auto_264413 ?auto_264409 ?auto_264415 ?auto_264412 )
      ( MAKE-1CRATE ?auto_264408 ?auto_264409 )
      ( MAKE-1CRATE-VERIFY ?auto_264408 ?auto_264409 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264416 - SURFACE
      ?auto_264417 - SURFACE
    )
    :vars
    (
      ?auto_264422 - HOIST
      ?auto_264421 - PLACE
      ?auto_264420 - PLACE
      ?auto_264423 - HOIST
      ?auto_264419 - SURFACE
      ?auto_264418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264422 ?auto_264421 ) ( SURFACE-AT ?auto_264416 ?auto_264421 ) ( CLEAR ?auto_264416 ) ( IS-CRATE ?auto_264417 ) ( not ( = ?auto_264416 ?auto_264417 ) ) ( AVAILABLE ?auto_264422 ) ( not ( = ?auto_264420 ?auto_264421 ) ) ( HOIST-AT ?auto_264423 ?auto_264420 ) ( not ( = ?auto_264422 ?auto_264423 ) ) ( AVAILABLE ?auto_264423 ) ( SURFACE-AT ?auto_264417 ?auto_264420 ) ( ON ?auto_264417 ?auto_264419 ) ( CLEAR ?auto_264417 ) ( not ( = ?auto_264416 ?auto_264419 ) ) ( not ( = ?auto_264417 ?auto_264419 ) ) ( TRUCK-AT ?auto_264418 ?auto_264421 ) )
    :subtasks
    ( ( !DRIVE ?auto_264418 ?auto_264421 ?auto_264420 )
      ( MAKE-1CRATE ?auto_264416 ?auto_264417 )
      ( MAKE-1CRATE-VERIFY ?auto_264416 ?auto_264417 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264433 - SURFACE
      ?auto_264434 - SURFACE
      ?auto_264435 - SURFACE
    )
    :vars
    (
      ?auto_264437 - HOIST
      ?auto_264436 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264437 ?auto_264436 ) ( SURFACE-AT ?auto_264434 ?auto_264436 ) ( CLEAR ?auto_264434 ) ( LIFTING ?auto_264437 ?auto_264435 ) ( IS-CRATE ?auto_264435 ) ( not ( = ?auto_264434 ?auto_264435 ) ) ( ON ?auto_264434 ?auto_264433 ) ( not ( = ?auto_264433 ?auto_264434 ) ) ( not ( = ?auto_264433 ?auto_264435 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264434 ?auto_264435 )
      ( MAKE-2CRATE-VERIFY ?auto_264433 ?auto_264434 ?auto_264435 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264443 - SURFACE
      ?auto_264444 - SURFACE
      ?auto_264445 - SURFACE
    )
    :vars
    (
      ?auto_264448 - HOIST
      ?auto_264447 - PLACE
      ?auto_264446 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264448 ?auto_264447 ) ( SURFACE-AT ?auto_264444 ?auto_264447 ) ( CLEAR ?auto_264444 ) ( IS-CRATE ?auto_264445 ) ( not ( = ?auto_264444 ?auto_264445 ) ) ( TRUCK-AT ?auto_264446 ?auto_264447 ) ( AVAILABLE ?auto_264448 ) ( IN ?auto_264445 ?auto_264446 ) ( ON ?auto_264444 ?auto_264443 ) ( not ( = ?auto_264443 ?auto_264444 ) ) ( not ( = ?auto_264443 ?auto_264445 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264444 ?auto_264445 )
      ( MAKE-2CRATE-VERIFY ?auto_264443 ?auto_264444 ?auto_264445 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264449 - SURFACE
      ?auto_264450 - SURFACE
    )
    :vars
    (
      ?auto_264453 - HOIST
      ?auto_264451 - PLACE
      ?auto_264454 - TRUCK
      ?auto_264452 - SURFACE
      ?auto_264455 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264453 ?auto_264451 ) ( SURFACE-AT ?auto_264449 ?auto_264451 ) ( CLEAR ?auto_264449 ) ( IS-CRATE ?auto_264450 ) ( not ( = ?auto_264449 ?auto_264450 ) ) ( AVAILABLE ?auto_264453 ) ( IN ?auto_264450 ?auto_264454 ) ( ON ?auto_264449 ?auto_264452 ) ( not ( = ?auto_264452 ?auto_264449 ) ) ( not ( = ?auto_264452 ?auto_264450 ) ) ( TRUCK-AT ?auto_264454 ?auto_264455 ) ( not ( = ?auto_264455 ?auto_264451 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_264454 ?auto_264455 ?auto_264451 )
      ( MAKE-2CRATE ?auto_264452 ?auto_264449 ?auto_264450 )
      ( MAKE-1CRATE-VERIFY ?auto_264449 ?auto_264450 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264456 - SURFACE
      ?auto_264457 - SURFACE
      ?auto_264458 - SURFACE
    )
    :vars
    (
      ?auto_264459 - HOIST
      ?auto_264460 - PLACE
      ?auto_264462 - TRUCK
      ?auto_264461 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264459 ?auto_264460 ) ( SURFACE-AT ?auto_264457 ?auto_264460 ) ( CLEAR ?auto_264457 ) ( IS-CRATE ?auto_264458 ) ( not ( = ?auto_264457 ?auto_264458 ) ) ( AVAILABLE ?auto_264459 ) ( IN ?auto_264458 ?auto_264462 ) ( ON ?auto_264457 ?auto_264456 ) ( not ( = ?auto_264456 ?auto_264457 ) ) ( not ( = ?auto_264456 ?auto_264458 ) ) ( TRUCK-AT ?auto_264462 ?auto_264461 ) ( not ( = ?auto_264461 ?auto_264460 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264457 ?auto_264458 )
      ( MAKE-2CRATE-VERIFY ?auto_264456 ?auto_264457 ?auto_264458 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264463 - SURFACE
      ?auto_264464 - SURFACE
    )
    :vars
    (
      ?auto_264468 - HOIST
      ?auto_264469 - PLACE
      ?auto_264467 - SURFACE
      ?auto_264465 - TRUCK
      ?auto_264466 - PLACE
      ?auto_264470 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_264468 ?auto_264469 ) ( SURFACE-AT ?auto_264463 ?auto_264469 ) ( CLEAR ?auto_264463 ) ( IS-CRATE ?auto_264464 ) ( not ( = ?auto_264463 ?auto_264464 ) ) ( AVAILABLE ?auto_264468 ) ( ON ?auto_264463 ?auto_264467 ) ( not ( = ?auto_264467 ?auto_264463 ) ) ( not ( = ?auto_264467 ?auto_264464 ) ) ( TRUCK-AT ?auto_264465 ?auto_264466 ) ( not ( = ?auto_264466 ?auto_264469 ) ) ( HOIST-AT ?auto_264470 ?auto_264466 ) ( LIFTING ?auto_264470 ?auto_264464 ) ( not ( = ?auto_264468 ?auto_264470 ) ) )
    :subtasks
    ( ( !LOAD ?auto_264470 ?auto_264464 ?auto_264465 ?auto_264466 )
      ( MAKE-2CRATE ?auto_264467 ?auto_264463 ?auto_264464 )
      ( MAKE-1CRATE-VERIFY ?auto_264463 ?auto_264464 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264471 - SURFACE
      ?auto_264472 - SURFACE
      ?auto_264473 - SURFACE
    )
    :vars
    (
      ?auto_264477 - HOIST
      ?auto_264475 - PLACE
      ?auto_264476 - TRUCK
      ?auto_264474 - PLACE
      ?auto_264478 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_264477 ?auto_264475 ) ( SURFACE-AT ?auto_264472 ?auto_264475 ) ( CLEAR ?auto_264472 ) ( IS-CRATE ?auto_264473 ) ( not ( = ?auto_264472 ?auto_264473 ) ) ( AVAILABLE ?auto_264477 ) ( ON ?auto_264472 ?auto_264471 ) ( not ( = ?auto_264471 ?auto_264472 ) ) ( not ( = ?auto_264471 ?auto_264473 ) ) ( TRUCK-AT ?auto_264476 ?auto_264474 ) ( not ( = ?auto_264474 ?auto_264475 ) ) ( HOIST-AT ?auto_264478 ?auto_264474 ) ( LIFTING ?auto_264478 ?auto_264473 ) ( not ( = ?auto_264477 ?auto_264478 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264472 ?auto_264473 )
      ( MAKE-2CRATE-VERIFY ?auto_264471 ?auto_264472 ?auto_264473 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264479 - SURFACE
      ?auto_264480 - SURFACE
    )
    :vars
    (
      ?auto_264485 - HOIST
      ?auto_264486 - PLACE
      ?auto_264481 - SURFACE
      ?auto_264483 - TRUCK
      ?auto_264484 - PLACE
      ?auto_264482 - HOIST
      ?auto_264487 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264485 ?auto_264486 ) ( SURFACE-AT ?auto_264479 ?auto_264486 ) ( CLEAR ?auto_264479 ) ( IS-CRATE ?auto_264480 ) ( not ( = ?auto_264479 ?auto_264480 ) ) ( AVAILABLE ?auto_264485 ) ( ON ?auto_264479 ?auto_264481 ) ( not ( = ?auto_264481 ?auto_264479 ) ) ( not ( = ?auto_264481 ?auto_264480 ) ) ( TRUCK-AT ?auto_264483 ?auto_264484 ) ( not ( = ?auto_264484 ?auto_264486 ) ) ( HOIST-AT ?auto_264482 ?auto_264484 ) ( not ( = ?auto_264485 ?auto_264482 ) ) ( AVAILABLE ?auto_264482 ) ( SURFACE-AT ?auto_264480 ?auto_264484 ) ( ON ?auto_264480 ?auto_264487 ) ( CLEAR ?auto_264480 ) ( not ( = ?auto_264479 ?auto_264487 ) ) ( not ( = ?auto_264480 ?auto_264487 ) ) ( not ( = ?auto_264481 ?auto_264487 ) ) )
    :subtasks
    ( ( !LIFT ?auto_264482 ?auto_264480 ?auto_264487 ?auto_264484 )
      ( MAKE-2CRATE ?auto_264481 ?auto_264479 ?auto_264480 )
      ( MAKE-1CRATE-VERIFY ?auto_264479 ?auto_264480 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264488 - SURFACE
      ?auto_264489 - SURFACE
      ?auto_264490 - SURFACE
    )
    :vars
    (
      ?auto_264496 - HOIST
      ?auto_264494 - PLACE
      ?auto_264491 - TRUCK
      ?auto_264495 - PLACE
      ?auto_264492 - HOIST
      ?auto_264493 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264496 ?auto_264494 ) ( SURFACE-AT ?auto_264489 ?auto_264494 ) ( CLEAR ?auto_264489 ) ( IS-CRATE ?auto_264490 ) ( not ( = ?auto_264489 ?auto_264490 ) ) ( AVAILABLE ?auto_264496 ) ( ON ?auto_264489 ?auto_264488 ) ( not ( = ?auto_264488 ?auto_264489 ) ) ( not ( = ?auto_264488 ?auto_264490 ) ) ( TRUCK-AT ?auto_264491 ?auto_264495 ) ( not ( = ?auto_264495 ?auto_264494 ) ) ( HOIST-AT ?auto_264492 ?auto_264495 ) ( not ( = ?auto_264496 ?auto_264492 ) ) ( AVAILABLE ?auto_264492 ) ( SURFACE-AT ?auto_264490 ?auto_264495 ) ( ON ?auto_264490 ?auto_264493 ) ( CLEAR ?auto_264490 ) ( not ( = ?auto_264489 ?auto_264493 ) ) ( not ( = ?auto_264490 ?auto_264493 ) ) ( not ( = ?auto_264488 ?auto_264493 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264489 ?auto_264490 )
      ( MAKE-2CRATE-VERIFY ?auto_264488 ?auto_264489 ?auto_264490 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264497 - SURFACE
      ?auto_264498 - SURFACE
    )
    :vars
    (
      ?auto_264499 - HOIST
      ?auto_264504 - PLACE
      ?auto_264501 - SURFACE
      ?auto_264502 - PLACE
      ?auto_264505 - HOIST
      ?auto_264500 - SURFACE
      ?auto_264503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264499 ?auto_264504 ) ( SURFACE-AT ?auto_264497 ?auto_264504 ) ( CLEAR ?auto_264497 ) ( IS-CRATE ?auto_264498 ) ( not ( = ?auto_264497 ?auto_264498 ) ) ( AVAILABLE ?auto_264499 ) ( ON ?auto_264497 ?auto_264501 ) ( not ( = ?auto_264501 ?auto_264497 ) ) ( not ( = ?auto_264501 ?auto_264498 ) ) ( not ( = ?auto_264502 ?auto_264504 ) ) ( HOIST-AT ?auto_264505 ?auto_264502 ) ( not ( = ?auto_264499 ?auto_264505 ) ) ( AVAILABLE ?auto_264505 ) ( SURFACE-AT ?auto_264498 ?auto_264502 ) ( ON ?auto_264498 ?auto_264500 ) ( CLEAR ?auto_264498 ) ( not ( = ?auto_264497 ?auto_264500 ) ) ( not ( = ?auto_264498 ?auto_264500 ) ) ( not ( = ?auto_264501 ?auto_264500 ) ) ( TRUCK-AT ?auto_264503 ?auto_264504 ) )
    :subtasks
    ( ( !DRIVE ?auto_264503 ?auto_264504 ?auto_264502 )
      ( MAKE-2CRATE ?auto_264501 ?auto_264497 ?auto_264498 )
      ( MAKE-1CRATE-VERIFY ?auto_264497 ?auto_264498 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264506 - SURFACE
      ?auto_264507 - SURFACE
      ?auto_264508 - SURFACE
    )
    :vars
    (
      ?auto_264514 - HOIST
      ?auto_264509 - PLACE
      ?auto_264512 - PLACE
      ?auto_264513 - HOIST
      ?auto_264511 - SURFACE
      ?auto_264510 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264514 ?auto_264509 ) ( SURFACE-AT ?auto_264507 ?auto_264509 ) ( CLEAR ?auto_264507 ) ( IS-CRATE ?auto_264508 ) ( not ( = ?auto_264507 ?auto_264508 ) ) ( AVAILABLE ?auto_264514 ) ( ON ?auto_264507 ?auto_264506 ) ( not ( = ?auto_264506 ?auto_264507 ) ) ( not ( = ?auto_264506 ?auto_264508 ) ) ( not ( = ?auto_264512 ?auto_264509 ) ) ( HOIST-AT ?auto_264513 ?auto_264512 ) ( not ( = ?auto_264514 ?auto_264513 ) ) ( AVAILABLE ?auto_264513 ) ( SURFACE-AT ?auto_264508 ?auto_264512 ) ( ON ?auto_264508 ?auto_264511 ) ( CLEAR ?auto_264508 ) ( not ( = ?auto_264507 ?auto_264511 ) ) ( not ( = ?auto_264508 ?auto_264511 ) ) ( not ( = ?auto_264506 ?auto_264511 ) ) ( TRUCK-AT ?auto_264510 ?auto_264509 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264507 ?auto_264508 )
      ( MAKE-2CRATE-VERIFY ?auto_264506 ?auto_264507 ?auto_264508 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264515 - SURFACE
      ?auto_264516 - SURFACE
    )
    :vars
    (
      ?auto_264522 - HOIST
      ?auto_264520 - PLACE
      ?auto_264523 - SURFACE
      ?auto_264517 - PLACE
      ?auto_264521 - HOIST
      ?auto_264518 - SURFACE
      ?auto_264519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264522 ?auto_264520 ) ( IS-CRATE ?auto_264516 ) ( not ( = ?auto_264515 ?auto_264516 ) ) ( not ( = ?auto_264523 ?auto_264515 ) ) ( not ( = ?auto_264523 ?auto_264516 ) ) ( not ( = ?auto_264517 ?auto_264520 ) ) ( HOIST-AT ?auto_264521 ?auto_264517 ) ( not ( = ?auto_264522 ?auto_264521 ) ) ( AVAILABLE ?auto_264521 ) ( SURFACE-AT ?auto_264516 ?auto_264517 ) ( ON ?auto_264516 ?auto_264518 ) ( CLEAR ?auto_264516 ) ( not ( = ?auto_264515 ?auto_264518 ) ) ( not ( = ?auto_264516 ?auto_264518 ) ) ( not ( = ?auto_264523 ?auto_264518 ) ) ( TRUCK-AT ?auto_264519 ?auto_264520 ) ( SURFACE-AT ?auto_264523 ?auto_264520 ) ( CLEAR ?auto_264523 ) ( LIFTING ?auto_264522 ?auto_264515 ) ( IS-CRATE ?auto_264515 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264523 ?auto_264515 )
      ( MAKE-2CRATE ?auto_264523 ?auto_264515 ?auto_264516 )
      ( MAKE-1CRATE-VERIFY ?auto_264515 ?auto_264516 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264524 - SURFACE
      ?auto_264525 - SURFACE
      ?auto_264526 - SURFACE
    )
    :vars
    (
      ?auto_264530 - HOIST
      ?auto_264528 - PLACE
      ?auto_264529 - PLACE
      ?auto_264531 - HOIST
      ?auto_264527 - SURFACE
      ?auto_264532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264530 ?auto_264528 ) ( IS-CRATE ?auto_264526 ) ( not ( = ?auto_264525 ?auto_264526 ) ) ( not ( = ?auto_264524 ?auto_264525 ) ) ( not ( = ?auto_264524 ?auto_264526 ) ) ( not ( = ?auto_264529 ?auto_264528 ) ) ( HOIST-AT ?auto_264531 ?auto_264529 ) ( not ( = ?auto_264530 ?auto_264531 ) ) ( AVAILABLE ?auto_264531 ) ( SURFACE-AT ?auto_264526 ?auto_264529 ) ( ON ?auto_264526 ?auto_264527 ) ( CLEAR ?auto_264526 ) ( not ( = ?auto_264525 ?auto_264527 ) ) ( not ( = ?auto_264526 ?auto_264527 ) ) ( not ( = ?auto_264524 ?auto_264527 ) ) ( TRUCK-AT ?auto_264532 ?auto_264528 ) ( SURFACE-AT ?auto_264524 ?auto_264528 ) ( CLEAR ?auto_264524 ) ( LIFTING ?auto_264530 ?auto_264525 ) ( IS-CRATE ?auto_264525 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264525 ?auto_264526 )
      ( MAKE-2CRATE-VERIFY ?auto_264524 ?auto_264525 ?auto_264526 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264533 - SURFACE
      ?auto_264534 - SURFACE
    )
    :vars
    (
      ?auto_264539 - HOIST
      ?auto_264535 - PLACE
      ?auto_264537 - SURFACE
      ?auto_264540 - PLACE
      ?auto_264538 - HOIST
      ?auto_264536 - SURFACE
      ?auto_264541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264539 ?auto_264535 ) ( IS-CRATE ?auto_264534 ) ( not ( = ?auto_264533 ?auto_264534 ) ) ( not ( = ?auto_264537 ?auto_264533 ) ) ( not ( = ?auto_264537 ?auto_264534 ) ) ( not ( = ?auto_264540 ?auto_264535 ) ) ( HOIST-AT ?auto_264538 ?auto_264540 ) ( not ( = ?auto_264539 ?auto_264538 ) ) ( AVAILABLE ?auto_264538 ) ( SURFACE-AT ?auto_264534 ?auto_264540 ) ( ON ?auto_264534 ?auto_264536 ) ( CLEAR ?auto_264534 ) ( not ( = ?auto_264533 ?auto_264536 ) ) ( not ( = ?auto_264534 ?auto_264536 ) ) ( not ( = ?auto_264537 ?auto_264536 ) ) ( TRUCK-AT ?auto_264541 ?auto_264535 ) ( SURFACE-AT ?auto_264537 ?auto_264535 ) ( CLEAR ?auto_264537 ) ( IS-CRATE ?auto_264533 ) ( AVAILABLE ?auto_264539 ) ( IN ?auto_264533 ?auto_264541 ) )
    :subtasks
    ( ( !UNLOAD ?auto_264539 ?auto_264533 ?auto_264541 ?auto_264535 )
      ( MAKE-2CRATE ?auto_264537 ?auto_264533 ?auto_264534 )
      ( MAKE-1CRATE-VERIFY ?auto_264533 ?auto_264534 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_264542 - SURFACE
      ?auto_264543 - SURFACE
      ?auto_264544 - SURFACE
    )
    :vars
    (
      ?auto_264547 - HOIST
      ?auto_264550 - PLACE
      ?auto_264546 - PLACE
      ?auto_264545 - HOIST
      ?auto_264549 - SURFACE
      ?auto_264548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264547 ?auto_264550 ) ( IS-CRATE ?auto_264544 ) ( not ( = ?auto_264543 ?auto_264544 ) ) ( not ( = ?auto_264542 ?auto_264543 ) ) ( not ( = ?auto_264542 ?auto_264544 ) ) ( not ( = ?auto_264546 ?auto_264550 ) ) ( HOIST-AT ?auto_264545 ?auto_264546 ) ( not ( = ?auto_264547 ?auto_264545 ) ) ( AVAILABLE ?auto_264545 ) ( SURFACE-AT ?auto_264544 ?auto_264546 ) ( ON ?auto_264544 ?auto_264549 ) ( CLEAR ?auto_264544 ) ( not ( = ?auto_264543 ?auto_264549 ) ) ( not ( = ?auto_264544 ?auto_264549 ) ) ( not ( = ?auto_264542 ?auto_264549 ) ) ( TRUCK-AT ?auto_264548 ?auto_264550 ) ( SURFACE-AT ?auto_264542 ?auto_264550 ) ( CLEAR ?auto_264542 ) ( IS-CRATE ?auto_264543 ) ( AVAILABLE ?auto_264547 ) ( IN ?auto_264543 ?auto_264548 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264543 ?auto_264544 )
      ( MAKE-2CRATE-VERIFY ?auto_264542 ?auto_264543 ?auto_264544 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_264587 - SURFACE
      ?auto_264588 - SURFACE
    )
    :vars
    (
      ?auto_264591 - HOIST
      ?auto_264595 - PLACE
      ?auto_264594 - SURFACE
      ?auto_264593 - PLACE
      ?auto_264589 - HOIST
      ?auto_264592 - SURFACE
      ?auto_264590 - TRUCK
      ?auto_264596 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264591 ?auto_264595 ) ( SURFACE-AT ?auto_264587 ?auto_264595 ) ( CLEAR ?auto_264587 ) ( IS-CRATE ?auto_264588 ) ( not ( = ?auto_264587 ?auto_264588 ) ) ( AVAILABLE ?auto_264591 ) ( ON ?auto_264587 ?auto_264594 ) ( not ( = ?auto_264594 ?auto_264587 ) ) ( not ( = ?auto_264594 ?auto_264588 ) ) ( not ( = ?auto_264593 ?auto_264595 ) ) ( HOIST-AT ?auto_264589 ?auto_264593 ) ( not ( = ?auto_264591 ?auto_264589 ) ) ( AVAILABLE ?auto_264589 ) ( SURFACE-AT ?auto_264588 ?auto_264593 ) ( ON ?auto_264588 ?auto_264592 ) ( CLEAR ?auto_264588 ) ( not ( = ?auto_264587 ?auto_264592 ) ) ( not ( = ?auto_264588 ?auto_264592 ) ) ( not ( = ?auto_264594 ?auto_264592 ) ) ( TRUCK-AT ?auto_264590 ?auto_264596 ) ( not ( = ?auto_264596 ?auto_264595 ) ) ( not ( = ?auto_264593 ?auto_264596 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_264590 ?auto_264596 ?auto_264595 )
      ( MAKE-1CRATE ?auto_264587 ?auto_264588 )
      ( MAKE-1CRATE-VERIFY ?auto_264587 ?auto_264588 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_264626 - SURFACE
      ?auto_264627 - SURFACE
      ?auto_264628 - SURFACE
      ?auto_264629 - SURFACE
    )
    :vars
    (
      ?auto_264631 - HOIST
      ?auto_264630 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264631 ?auto_264630 ) ( SURFACE-AT ?auto_264628 ?auto_264630 ) ( CLEAR ?auto_264628 ) ( LIFTING ?auto_264631 ?auto_264629 ) ( IS-CRATE ?auto_264629 ) ( not ( = ?auto_264628 ?auto_264629 ) ) ( ON ?auto_264627 ?auto_264626 ) ( ON ?auto_264628 ?auto_264627 ) ( not ( = ?auto_264626 ?auto_264627 ) ) ( not ( = ?auto_264626 ?auto_264628 ) ) ( not ( = ?auto_264626 ?auto_264629 ) ) ( not ( = ?auto_264627 ?auto_264628 ) ) ( not ( = ?auto_264627 ?auto_264629 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_264628 ?auto_264629 )
      ( MAKE-3CRATE-VERIFY ?auto_264626 ?auto_264627 ?auto_264628 ?auto_264629 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_264643 - SURFACE
      ?auto_264644 - SURFACE
      ?auto_264645 - SURFACE
      ?auto_264646 - SURFACE
    )
    :vars
    (
      ?auto_264649 - HOIST
      ?auto_264648 - PLACE
      ?auto_264647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264649 ?auto_264648 ) ( SURFACE-AT ?auto_264645 ?auto_264648 ) ( CLEAR ?auto_264645 ) ( IS-CRATE ?auto_264646 ) ( not ( = ?auto_264645 ?auto_264646 ) ) ( TRUCK-AT ?auto_264647 ?auto_264648 ) ( AVAILABLE ?auto_264649 ) ( IN ?auto_264646 ?auto_264647 ) ( ON ?auto_264645 ?auto_264644 ) ( not ( = ?auto_264644 ?auto_264645 ) ) ( not ( = ?auto_264644 ?auto_264646 ) ) ( ON ?auto_264644 ?auto_264643 ) ( not ( = ?auto_264643 ?auto_264644 ) ) ( not ( = ?auto_264643 ?auto_264645 ) ) ( not ( = ?auto_264643 ?auto_264646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_264644 ?auto_264645 ?auto_264646 )
      ( MAKE-3CRATE-VERIFY ?auto_264643 ?auto_264644 ?auto_264645 ?auto_264646 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_264664 - SURFACE
      ?auto_264665 - SURFACE
      ?auto_264666 - SURFACE
      ?auto_264667 - SURFACE
    )
    :vars
    (
      ?auto_264668 - HOIST
      ?auto_264671 - PLACE
      ?auto_264670 - TRUCK
      ?auto_264669 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264668 ?auto_264671 ) ( SURFACE-AT ?auto_264666 ?auto_264671 ) ( CLEAR ?auto_264666 ) ( IS-CRATE ?auto_264667 ) ( not ( = ?auto_264666 ?auto_264667 ) ) ( AVAILABLE ?auto_264668 ) ( IN ?auto_264667 ?auto_264670 ) ( ON ?auto_264666 ?auto_264665 ) ( not ( = ?auto_264665 ?auto_264666 ) ) ( not ( = ?auto_264665 ?auto_264667 ) ) ( TRUCK-AT ?auto_264670 ?auto_264669 ) ( not ( = ?auto_264669 ?auto_264671 ) ) ( ON ?auto_264665 ?auto_264664 ) ( not ( = ?auto_264664 ?auto_264665 ) ) ( not ( = ?auto_264664 ?auto_264666 ) ) ( not ( = ?auto_264664 ?auto_264667 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_264665 ?auto_264666 ?auto_264667 )
      ( MAKE-3CRATE-VERIFY ?auto_264664 ?auto_264665 ?auto_264666 ?auto_264667 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_264688 - SURFACE
      ?auto_264689 - SURFACE
      ?auto_264690 - SURFACE
      ?auto_264691 - SURFACE
    )
    :vars
    (
      ?auto_264694 - HOIST
      ?auto_264696 - PLACE
      ?auto_264692 - TRUCK
      ?auto_264695 - PLACE
      ?auto_264693 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_264694 ?auto_264696 ) ( SURFACE-AT ?auto_264690 ?auto_264696 ) ( CLEAR ?auto_264690 ) ( IS-CRATE ?auto_264691 ) ( not ( = ?auto_264690 ?auto_264691 ) ) ( AVAILABLE ?auto_264694 ) ( ON ?auto_264690 ?auto_264689 ) ( not ( = ?auto_264689 ?auto_264690 ) ) ( not ( = ?auto_264689 ?auto_264691 ) ) ( TRUCK-AT ?auto_264692 ?auto_264695 ) ( not ( = ?auto_264695 ?auto_264696 ) ) ( HOIST-AT ?auto_264693 ?auto_264695 ) ( LIFTING ?auto_264693 ?auto_264691 ) ( not ( = ?auto_264694 ?auto_264693 ) ) ( ON ?auto_264689 ?auto_264688 ) ( not ( = ?auto_264688 ?auto_264689 ) ) ( not ( = ?auto_264688 ?auto_264690 ) ) ( not ( = ?auto_264688 ?auto_264691 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_264689 ?auto_264690 ?auto_264691 )
      ( MAKE-3CRATE-VERIFY ?auto_264688 ?auto_264689 ?auto_264690 ?auto_264691 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_264715 - SURFACE
      ?auto_264716 - SURFACE
      ?auto_264717 - SURFACE
      ?auto_264718 - SURFACE
    )
    :vars
    (
      ?auto_264720 - HOIST
      ?auto_264724 - PLACE
      ?auto_264721 - TRUCK
      ?auto_264722 - PLACE
      ?auto_264723 - HOIST
      ?auto_264719 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_264720 ?auto_264724 ) ( SURFACE-AT ?auto_264717 ?auto_264724 ) ( CLEAR ?auto_264717 ) ( IS-CRATE ?auto_264718 ) ( not ( = ?auto_264717 ?auto_264718 ) ) ( AVAILABLE ?auto_264720 ) ( ON ?auto_264717 ?auto_264716 ) ( not ( = ?auto_264716 ?auto_264717 ) ) ( not ( = ?auto_264716 ?auto_264718 ) ) ( TRUCK-AT ?auto_264721 ?auto_264722 ) ( not ( = ?auto_264722 ?auto_264724 ) ) ( HOIST-AT ?auto_264723 ?auto_264722 ) ( not ( = ?auto_264720 ?auto_264723 ) ) ( AVAILABLE ?auto_264723 ) ( SURFACE-AT ?auto_264718 ?auto_264722 ) ( ON ?auto_264718 ?auto_264719 ) ( CLEAR ?auto_264718 ) ( not ( = ?auto_264717 ?auto_264719 ) ) ( not ( = ?auto_264718 ?auto_264719 ) ) ( not ( = ?auto_264716 ?auto_264719 ) ) ( ON ?auto_264716 ?auto_264715 ) ( not ( = ?auto_264715 ?auto_264716 ) ) ( not ( = ?auto_264715 ?auto_264717 ) ) ( not ( = ?auto_264715 ?auto_264718 ) ) ( not ( = ?auto_264715 ?auto_264719 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_264716 ?auto_264717 ?auto_264718 )
      ( MAKE-3CRATE-VERIFY ?auto_264715 ?auto_264716 ?auto_264717 ?auto_264718 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_264743 - SURFACE
      ?auto_264744 - SURFACE
      ?auto_264745 - SURFACE
      ?auto_264746 - SURFACE
    )
    :vars
    (
      ?auto_264748 - HOIST
      ?auto_264749 - PLACE
      ?auto_264751 - PLACE
      ?auto_264752 - HOIST
      ?auto_264750 - SURFACE
      ?auto_264747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264748 ?auto_264749 ) ( SURFACE-AT ?auto_264745 ?auto_264749 ) ( CLEAR ?auto_264745 ) ( IS-CRATE ?auto_264746 ) ( not ( = ?auto_264745 ?auto_264746 ) ) ( AVAILABLE ?auto_264748 ) ( ON ?auto_264745 ?auto_264744 ) ( not ( = ?auto_264744 ?auto_264745 ) ) ( not ( = ?auto_264744 ?auto_264746 ) ) ( not ( = ?auto_264751 ?auto_264749 ) ) ( HOIST-AT ?auto_264752 ?auto_264751 ) ( not ( = ?auto_264748 ?auto_264752 ) ) ( AVAILABLE ?auto_264752 ) ( SURFACE-AT ?auto_264746 ?auto_264751 ) ( ON ?auto_264746 ?auto_264750 ) ( CLEAR ?auto_264746 ) ( not ( = ?auto_264745 ?auto_264750 ) ) ( not ( = ?auto_264746 ?auto_264750 ) ) ( not ( = ?auto_264744 ?auto_264750 ) ) ( TRUCK-AT ?auto_264747 ?auto_264749 ) ( ON ?auto_264744 ?auto_264743 ) ( not ( = ?auto_264743 ?auto_264744 ) ) ( not ( = ?auto_264743 ?auto_264745 ) ) ( not ( = ?auto_264743 ?auto_264746 ) ) ( not ( = ?auto_264743 ?auto_264750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_264744 ?auto_264745 ?auto_264746 )
      ( MAKE-3CRATE-VERIFY ?auto_264743 ?auto_264744 ?auto_264745 ?auto_264746 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_264771 - SURFACE
      ?auto_264772 - SURFACE
      ?auto_264773 - SURFACE
      ?auto_264774 - SURFACE
    )
    :vars
    (
      ?auto_264780 - HOIST
      ?auto_264775 - PLACE
      ?auto_264779 - PLACE
      ?auto_264778 - HOIST
      ?auto_264776 - SURFACE
      ?auto_264777 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264780 ?auto_264775 ) ( IS-CRATE ?auto_264774 ) ( not ( = ?auto_264773 ?auto_264774 ) ) ( not ( = ?auto_264772 ?auto_264773 ) ) ( not ( = ?auto_264772 ?auto_264774 ) ) ( not ( = ?auto_264779 ?auto_264775 ) ) ( HOIST-AT ?auto_264778 ?auto_264779 ) ( not ( = ?auto_264780 ?auto_264778 ) ) ( AVAILABLE ?auto_264778 ) ( SURFACE-AT ?auto_264774 ?auto_264779 ) ( ON ?auto_264774 ?auto_264776 ) ( CLEAR ?auto_264774 ) ( not ( = ?auto_264773 ?auto_264776 ) ) ( not ( = ?auto_264774 ?auto_264776 ) ) ( not ( = ?auto_264772 ?auto_264776 ) ) ( TRUCK-AT ?auto_264777 ?auto_264775 ) ( SURFACE-AT ?auto_264772 ?auto_264775 ) ( CLEAR ?auto_264772 ) ( LIFTING ?auto_264780 ?auto_264773 ) ( IS-CRATE ?auto_264773 ) ( ON ?auto_264772 ?auto_264771 ) ( not ( = ?auto_264771 ?auto_264772 ) ) ( not ( = ?auto_264771 ?auto_264773 ) ) ( not ( = ?auto_264771 ?auto_264774 ) ) ( not ( = ?auto_264771 ?auto_264776 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_264772 ?auto_264773 ?auto_264774 )
      ( MAKE-3CRATE-VERIFY ?auto_264771 ?auto_264772 ?auto_264773 ?auto_264774 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_264799 - SURFACE
      ?auto_264800 - SURFACE
      ?auto_264801 - SURFACE
      ?auto_264802 - SURFACE
    )
    :vars
    (
      ?auto_264807 - HOIST
      ?auto_264805 - PLACE
      ?auto_264806 - PLACE
      ?auto_264808 - HOIST
      ?auto_264803 - SURFACE
      ?auto_264804 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_264807 ?auto_264805 ) ( IS-CRATE ?auto_264802 ) ( not ( = ?auto_264801 ?auto_264802 ) ) ( not ( = ?auto_264800 ?auto_264801 ) ) ( not ( = ?auto_264800 ?auto_264802 ) ) ( not ( = ?auto_264806 ?auto_264805 ) ) ( HOIST-AT ?auto_264808 ?auto_264806 ) ( not ( = ?auto_264807 ?auto_264808 ) ) ( AVAILABLE ?auto_264808 ) ( SURFACE-AT ?auto_264802 ?auto_264806 ) ( ON ?auto_264802 ?auto_264803 ) ( CLEAR ?auto_264802 ) ( not ( = ?auto_264801 ?auto_264803 ) ) ( not ( = ?auto_264802 ?auto_264803 ) ) ( not ( = ?auto_264800 ?auto_264803 ) ) ( TRUCK-AT ?auto_264804 ?auto_264805 ) ( SURFACE-AT ?auto_264800 ?auto_264805 ) ( CLEAR ?auto_264800 ) ( IS-CRATE ?auto_264801 ) ( AVAILABLE ?auto_264807 ) ( IN ?auto_264801 ?auto_264804 ) ( ON ?auto_264800 ?auto_264799 ) ( not ( = ?auto_264799 ?auto_264800 ) ) ( not ( = ?auto_264799 ?auto_264801 ) ) ( not ( = ?auto_264799 ?auto_264802 ) ) ( not ( = ?auto_264799 ?auto_264803 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_264800 ?auto_264801 ?auto_264802 )
      ( MAKE-3CRATE-VERIFY ?auto_264799 ?auto_264800 ?auto_264801 ?auto_264802 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265090 - SURFACE
      ?auto_265091 - SURFACE
      ?auto_265092 - SURFACE
      ?auto_265093 - SURFACE
      ?auto_265094 - SURFACE
    )
    :vars
    (
      ?auto_265096 - HOIST
      ?auto_265095 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265096 ?auto_265095 ) ( SURFACE-AT ?auto_265093 ?auto_265095 ) ( CLEAR ?auto_265093 ) ( LIFTING ?auto_265096 ?auto_265094 ) ( IS-CRATE ?auto_265094 ) ( not ( = ?auto_265093 ?auto_265094 ) ) ( ON ?auto_265091 ?auto_265090 ) ( ON ?auto_265092 ?auto_265091 ) ( ON ?auto_265093 ?auto_265092 ) ( not ( = ?auto_265090 ?auto_265091 ) ) ( not ( = ?auto_265090 ?auto_265092 ) ) ( not ( = ?auto_265090 ?auto_265093 ) ) ( not ( = ?auto_265090 ?auto_265094 ) ) ( not ( = ?auto_265091 ?auto_265092 ) ) ( not ( = ?auto_265091 ?auto_265093 ) ) ( not ( = ?auto_265091 ?auto_265094 ) ) ( not ( = ?auto_265092 ?auto_265093 ) ) ( not ( = ?auto_265092 ?auto_265094 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_265093 ?auto_265094 )
      ( MAKE-4CRATE-VERIFY ?auto_265090 ?auto_265091 ?auto_265092 ?auto_265093 ?auto_265094 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265115 - SURFACE
      ?auto_265116 - SURFACE
      ?auto_265117 - SURFACE
      ?auto_265118 - SURFACE
      ?auto_265119 - SURFACE
    )
    :vars
    (
      ?auto_265120 - HOIST
      ?auto_265122 - PLACE
      ?auto_265121 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265120 ?auto_265122 ) ( SURFACE-AT ?auto_265118 ?auto_265122 ) ( CLEAR ?auto_265118 ) ( IS-CRATE ?auto_265119 ) ( not ( = ?auto_265118 ?auto_265119 ) ) ( TRUCK-AT ?auto_265121 ?auto_265122 ) ( AVAILABLE ?auto_265120 ) ( IN ?auto_265119 ?auto_265121 ) ( ON ?auto_265118 ?auto_265117 ) ( not ( = ?auto_265117 ?auto_265118 ) ) ( not ( = ?auto_265117 ?auto_265119 ) ) ( ON ?auto_265116 ?auto_265115 ) ( ON ?auto_265117 ?auto_265116 ) ( not ( = ?auto_265115 ?auto_265116 ) ) ( not ( = ?auto_265115 ?auto_265117 ) ) ( not ( = ?auto_265115 ?auto_265118 ) ) ( not ( = ?auto_265115 ?auto_265119 ) ) ( not ( = ?auto_265116 ?auto_265117 ) ) ( not ( = ?auto_265116 ?auto_265118 ) ) ( not ( = ?auto_265116 ?auto_265119 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265117 ?auto_265118 ?auto_265119 )
      ( MAKE-4CRATE-VERIFY ?auto_265115 ?auto_265116 ?auto_265117 ?auto_265118 ?auto_265119 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265145 - SURFACE
      ?auto_265146 - SURFACE
      ?auto_265147 - SURFACE
      ?auto_265148 - SURFACE
      ?auto_265149 - SURFACE
    )
    :vars
    (
      ?auto_265150 - HOIST
      ?auto_265152 - PLACE
      ?auto_265151 - TRUCK
      ?auto_265153 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265150 ?auto_265152 ) ( SURFACE-AT ?auto_265148 ?auto_265152 ) ( CLEAR ?auto_265148 ) ( IS-CRATE ?auto_265149 ) ( not ( = ?auto_265148 ?auto_265149 ) ) ( AVAILABLE ?auto_265150 ) ( IN ?auto_265149 ?auto_265151 ) ( ON ?auto_265148 ?auto_265147 ) ( not ( = ?auto_265147 ?auto_265148 ) ) ( not ( = ?auto_265147 ?auto_265149 ) ) ( TRUCK-AT ?auto_265151 ?auto_265153 ) ( not ( = ?auto_265153 ?auto_265152 ) ) ( ON ?auto_265146 ?auto_265145 ) ( ON ?auto_265147 ?auto_265146 ) ( not ( = ?auto_265145 ?auto_265146 ) ) ( not ( = ?auto_265145 ?auto_265147 ) ) ( not ( = ?auto_265145 ?auto_265148 ) ) ( not ( = ?auto_265145 ?auto_265149 ) ) ( not ( = ?auto_265146 ?auto_265147 ) ) ( not ( = ?auto_265146 ?auto_265148 ) ) ( not ( = ?auto_265146 ?auto_265149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265147 ?auto_265148 ?auto_265149 )
      ( MAKE-4CRATE-VERIFY ?auto_265145 ?auto_265146 ?auto_265147 ?auto_265148 ?auto_265149 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265179 - SURFACE
      ?auto_265180 - SURFACE
      ?auto_265181 - SURFACE
      ?auto_265182 - SURFACE
      ?auto_265183 - SURFACE
    )
    :vars
    (
      ?auto_265188 - HOIST
      ?auto_265187 - PLACE
      ?auto_265185 - TRUCK
      ?auto_265186 - PLACE
      ?auto_265184 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_265188 ?auto_265187 ) ( SURFACE-AT ?auto_265182 ?auto_265187 ) ( CLEAR ?auto_265182 ) ( IS-CRATE ?auto_265183 ) ( not ( = ?auto_265182 ?auto_265183 ) ) ( AVAILABLE ?auto_265188 ) ( ON ?auto_265182 ?auto_265181 ) ( not ( = ?auto_265181 ?auto_265182 ) ) ( not ( = ?auto_265181 ?auto_265183 ) ) ( TRUCK-AT ?auto_265185 ?auto_265186 ) ( not ( = ?auto_265186 ?auto_265187 ) ) ( HOIST-AT ?auto_265184 ?auto_265186 ) ( LIFTING ?auto_265184 ?auto_265183 ) ( not ( = ?auto_265188 ?auto_265184 ) ) ( ON ?auto_265180 ?auto_265179 ) ( ON ?auto_265181 ?auto_265180 ) ( not ( = ?auto_265179 ?auto_265180 ) ) ( not ( = ?auto_265179 ?auto_265181 ) ) ( not ( = ?auto_265179 ?auto_265182 ) ) ( not ( = ?auto_265179 ?auto_265183 ) ) ( not ( = ?auto_265180 ?auto_265181 ) ) ( not ( = ?auto_265180 ?auto_265182 ) ) ( not ( = ?auto_265180 ?auto_265183 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265181 ?auto_265182 ?auto_265183 )
      ( MAKE-4CRATE-VERIFY ?auto_265179 ?auto_265180 ?auto_265181 ?auto_265182 ?auto_265183 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265217 - SURFACE
      ?auto_265218 - SURFACE
      ?auto_265219 - SURFACE
      ?auto_265220 - SURFACE
      ?auto_265221 - SURFACE
    )
    :vars
    (
      ?auto_265226 - HOIST
      ?auto_265222 - PLACE
      ?auto_265225 - TRUCK
      ?auto_265224 - PLACE
      ?auto_265227 - HOIST
      ?auto_265223 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_265226 ?auto_265222 ) ( SURFACE-AT ?auto_265220 ?auto_265222 ) ( CLEAR ?auto_265220 ) ( IS-CRATE ?auto_265221 ) ( not ( = ?auto_265220 ?auto_265221 ) ) ( AVAILABLE ?auto_265226 ) ( ON ?auto_265220 ?auto_265219 ) ( not ( = ?auto_265219 ?auto_265220 ) ) ( not ( = ?auto_265219 ?auto_265221 ) ) ( TRUCK-AT ?auto_265225 ?auto_265224 ) ( not ( = ?auto_265224 ?auto_265222 ) ) ( HOIST-AT ?auto_265227 ?auto_265224 ) ( not ( = ?auto_265226 ?auto_265227 ) ) ( AVAILABLE ?auto_265227 ) ( SURFACE-AT ?auto_265221 ?auto_265224 ) ( ON ?auto_265221 ?auto_265223 ) ( CLEAR ?auto_265221 ) ( not ( = ?auto_265220 ?auto_265223 ) ) ( not ( = ?auto_265221 ?auto_265223 ) ) ( not ( = ?auto_265219 ?auto_265223 ) ) ( ON ?auto_265218 ?auto_265217 ) ( ON ?auto_265219 ?auto_265218 ) ( not ( = ?auto_265217 ?auto_265218 ) ) ( not ( = ?auto_265217 ?auto_265219 ) ) ( not ( = ?auto_265217 ?auto_265220 ) ) ( not ( = ?auto_265217 ?auto_265221 ) ) ( not ( = ?auto_265217 ?auto_265223 ) ) ( not ( = ?auto_265218 ?auto_265219 ) ) ( not ( = ?auto_265218 ?auto_265220 ) ) ( not ( = ?auto_265218 ?auto_265221 ) ) ( not ( = ?auto_265218 ?auto_265223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265219 ?auto_265220 ?auto_265221 )
      ( MAKE-4CRATE-VERIFY ?auto_265217 ?auto_265218 ?auto_265219 ?auto_265220 ?auto_265221 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265256 - SURFACE
      ?auto_265257 - SURFACE
      ?auto_265258 - SURFACE
      ?auto_265259 - SURFACE
      ?auto_265260 - SURFACE
    )
    :vars
    (
      ?auto_265264 - HOIST
      ?auto_265266 - PLACE
      ?auto_265265 - PLACE
      ?auto_265262 - HOIST
      ?auto_265261 - SURFACE
      ?auto_265263 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265264 ?auto_265266 ) ( SURFACE-AT ?auto_265259 ?auto_265266 ) ( CLEAR ?auto_265259 ) ( IS-CRATE ?auto_265260 ) ( not ( = ?auto_265259 ?auto_265260 ) ) ( AVAILABLE ?auto_265264 ) ( ON ?auto_265259 ?auto_265258 ) ( not ( = ?auto_265258 ?auto_265259 ) ) ( not ( = ?auto_265258 ?auto_265260 ) ) ( not ( = ?auto_265265 ?auto_265266 ) ) ( HOIST-AT ?auto_265262 ?auto_265265 ) ( not ( = ?auto_265264 ?auto_265262 ) ) ( AVAILABLE ?auto_265262 ) ( SURFACE-AT ?auto_265260 ?auto_265265 ) ( ON ?auto_265260 ?auto_265261 ) ( CLEAR ?auto_265260 ) ( not ( = ?auto_265259 ?auto_265261 ) ) ( not ( = ?auto_265260 ?auto_265261 ) ) ( not ( = ?auto_265258 ?auto_265261 ) ) ( TRUCK-AT ?auto_265263 ?auto_265266 ) ( ON ?auto_265257 ?auto_265256 ) ( ON ?auto_265258 ?auto_265257 ) ( not ( = ?auto_265256 ?auto_265257 ) ) ( not ( = ?auto_265256 ?auto_265258 ) ) ( not ( = ?auto_265256 ?auto_265259 ) ) ( not ( = ?auto_265256 ?auto_265260 ) ) ( not ( = ?auto_265256 ?auto_265261 ) ) ( not ( = ?auto_265257 ?auto_265258 ) ) ( not ( = ?auto_265257 ?auto_265259 ) ) ( not ( = ?auto_265257 ?auto_265260 ) ) ( not ( = ?auto_265257 ?auto_265261 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265258 ?auto_265259 ?auto_265260 )
      ( MAKE-4CRATE-VERIFY ?auto_265256 ?auto_265257 ?auto_265258 ?auto_265259 ?auto_265260 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265295 - SURFACE
      ?auto_265296 - SURFACE
      ?auto_265297 - SURFACE
      ?auto_265298 - SURFACE
      ?auto_265299 - SURFACE
    )
    :vars
    (
      ?auto_265302 - HOIST
      ?auto_265305 - PLACE
      ?auto_265300 - PLACE
      ?auto_265301 - HOIST
      ?auto_265304 - SURFACE
      ?auto_265303 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265302 ?auto_265305 ) ( IS-CRATE ?auto_265299 ) ( not ( = ?auto_265298 ?auto_265299 ) ) ( not ( = ?auto_265297 ?auto_265298 ) ) ( not ( = ?auto_265297 ?auto_265299 ) ) ( not ( = ?auto_265300 ?auto_265305 ) ) ( HOIST-AT ?auto_265301 ?auto_265300 ) ( not ( = ?auto_265302 ?auto_265301 ) ) ( AVAILABLE ?auto_265301 ) ( SURFACE-AT ?auto_265299 ?auto_265300 ) ( ON ?auto_265299 ?auto_265304 ) ( CLEAR ?auto_265299 ) ( not ( = ?auto_265298 ?auto_265304 ) ) ( not ( = ?auto_265299 ?auto_265304 ) ) ( not ( = ?auto_265297 ?auto_265304 ) ) ( TRUCK-AT ?auto_265303 ?auto_265305 ) ( SURFACE-AT ?auto_265297 ?auto_265305 ) ( CLEAR ?auto_265297 ) ( LIFTING ?auto_265302 ?auto_265298 ) ( IS-CRATE ?auto_265298 ) ( ON ?auto_265296 ?auto_265295 ) ( ON ?auto_265297 ?auto_265296 ) ( not ( = ?auto_265295 ?auto_265296 ) ) ( not ( = ?auto_265295 ?auto_265297 ) ) ( not ( = ?auto_265295 ?auto_265298 ) ) ( not ( = ?auto_265295 ?auto_265299 ) ) ( not ( = ?auto_265295 ?auto_265304 ) ) ( not ( = ?auto_265296 ?auto_265297 ) ) ( not ( = ?auto_265296 ?auto_265298 ) ) ( not ( = ?auto_265296 ?auto_265299 ) ) ( not ( = ?auto_265296 ?auto_265304 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265297 ?auto_265298 ?auto_265299 )
      ( MAKE-4CRATE-VERIFY ?auto_265295 ?auto_265296 ?auto_265297 ?auto_265298 ?auto_265299 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_265334 - SURFACE
      ?auto_265335 - SURFACE
      ?auto_265336 - SURFACE
      ?auto_265337 - SURFACE
      ?auto_265338 - SURFACE
    )
    :vars
    (
      ?auto_265344 - HOIST
      ?auto_265342 - PLACE
      ?auto_265343 - PLACE
      ?auto_265340 - HOIST
      ?auto_265339 - SURFACE
      ?auto_265341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_265344 ?auto_265342 ) ( IS-CRATE ?auto_265338 ) ( not ( = ?auto_265337 ?auto_265338 ) ) ( not ( = ?auto_265336 ?auto_265337 ) ) ( not ( = ?auto_265336 ?auto_265338 ) ) ( not ( = ?auto_265343 ?auto_265342 ) ) ( HOIST-AT ?auto_265340 ?auto_265343 ) ( not ( = ?auto_265344 ?auto_265340 ) ) ( AVAILABLE ?auto_265340 ) ( SURFACE-AT ?auto_265338 ?auto_265343 ) ( ON ?auto_265338 ?auto_265339 ) ( CLEAR ?auto_265338 ) ( not ( = ?auto_265337 ?auto_265339 ) ) ( not ( = ?auto_265338 ?auto_265339 ) ) ( not ( = ?auto_265336 ?auto_265339 ) ) ( TRUCK-AT ?auto_265341 ?auto_265342 ) ( SURFACE-AT ?auto_265336 ?auto_265342 ) ( CLEAR ?auto_265336 ) ( IS-CRATE ?auto_265337 ) ( AVAILABLE ?auto_265344 ) ( IN ?auto_265337 ?auto_265341 ) ( ON ?auto_265335 ?auto_265334 ) ( ON ?auto_265336 ?auto_265335 ) ( not ( = ?auto_265334 ?auto_265335 ) ) ( not ( = ?auto_265334 ?auto_265336 ) ) ( not ( = ?auto_265334 ?auto_265337 ) ) ( not ( = ?auto_265334 ?auto_265338 ) ) ( not ( = ?auto_265334 ?auto_265339 ) ) ( not ( = ?auto_265335 ?auto_265336 ) ) ( not ( = ?auto_265335 ?auto_265337 ) ) ( not ( = ?auto_265335 ?auto_265338 ) ) ( not ( = ?auto_265335 ?auto_265339 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_265336 ?auto_265337 ?auto_265338 )
      ( MAKE-4CRATE-VERIFY ?auto_265334 ?auto_265335 ?auto_265336 ?auto_265337 ?auto_265338 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_265994 - SURFACE
      ?auto_265995 - SURFACE
      ?auto_265996 - SURFACE
      ?auto_265997 - SURFACE
      ?auto_265998 - SURFACE
      ?auto_265999 - SURFACE
    )
    :vars
    (
      ?auto_266001 - HOIST
      ?auto_266000 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_266001 ?auto_266000 ) ( SURFACE-AT ?auto_265998 ?auto_266000 ) ( CLEAR ?auto_265998 ) ( LIFTING ?auto_266001 ?auto_265999 ) ( IS-CRATE ?auto_265999 ) ( not ( = ?auto_265998 ?auto_265999 ) ) ( ON ?auto_265995 ?auto_265994 ) ( ON ?auto_265996 ?auto_265995 ) ( ON ?auto_265997 ?auto_265996 ) ( ON ?auto_265998 ?auto_265997 ) ( not ( = ?auto_265994 ?auto_265995 ) ) ( not ( = ?auto_265994 ?auto_265996 ) ) ( not ( = ?auto_265994 ?auto_265997 ) ) ( not ( = ?auto_265994 ?auto_265998 ) ) ( not ( = ?auto_265994 ?auto_265999 ) ) ( not ( = ?auto_265995 ?auto_265996 ) ) ( not ( = ?auto_265995 ?auto_265997 ) ) ( not ( = ?auto_265995 ?auto_265998 ) ) ( not ( = ?auto_265995 ?auto_265999 ) ) ( not ( = ?auto_265996 ?auto_265997 ) ) ( not ( = ?auto_265996 ?auto_265998 ) ) ( not ( = ?auto_265996 ?auto_265999 ) ) ( not ( = ?auto_265997 ?auto_265998 ) ) ( not ( = ?auto_265997 ?auto_265999 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_265998 ?auto_265999 )
      ( MAKE-5CRATE-VERIFY ?auto_265994 ?auto_265995 ?auto_265996 ?auto_265997 ?auto_265998 ?auto_265999 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266028 - SURFACE
      ?auto_266029 - SURFACE
      ?auto_266030 - SURFACE
      ?auto_266031 - SURFACE
      ?auto_266032 - SURFACE
      ?auto_266033 - SURFACE
    )
    :vars
    (
      ?auto_266036 - HOIST
      ?auto_266034 - PLACE
      ?auto_266035 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_266036 ?auto_266034 ) ( SURFACE-AT ?auto_266032 ?auto_266034 ) ( CLEAR ?auto_266032 ) ( IS-CRATE ?auto_266033 ) ( not ( = ?auto_266032 ?auto_266033 ) ) ( TRUCK-AT ?auto_266035 ?auto_266034 ) ( AVAILABLE ?auto_266036 ) ( IN ?auto_266033 ?auto_266035 ) ( ON ?auto_266032 ?auto_266031 ) ( not ( = ?auto_266031 ?auto_266032 ) ) ( not ( = ?auto_266031 ?auto_266033 ) ) ( ON ?auto_266029 ?auto_266028 ) ( ON ?auto_266030 ?auto_266029 ) ( ON ?auto_266031 ?auto_266030 ) ( not ( = ?auto_266028 ?auto_266029 ) ) ( not ( = ?auto_266028 ?auto_266030 ) ) ( not ( = ?auto_266028 ?auto_266031 ) ) ( not ( = ?auto_266028 ?auto_266032 ) ) ( not ( = ?auto_266028 ?auto_266033 ) ) ( not ( = ?auto_266029 ?auto_266030 ) ) ( not ( = ?auto_266029 ?auto_266031 ) ) ( not ( = ?auto_266029 ?auto_266032 ) ) ( not ( = ?auto_266029 ?auto_266033 ) ) ( not ( = ?auto_266030 ?auto_266031 ) ) ( not ( = ?auto_266030 ?auto_266032 ) ) ( not ( = ?auto_266030 ?auto_266033 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266031 ?auto_266032 ?auto_266033 )
      ( MAKE-5CRATE-VERIFY ?auto_266028 ?auto_266029 ?auto_266030 ?auto_266031 ?auto_266032 ?auto_266033 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266068 - SURFACE
      ?auto_266069 - SURFACE
      ?auto_266070 - SURFACE
      ?auto_266071 - SURFACE
      ?auto_266072 - SURFACE
      ?auto_266073 - SURFACE
    )
    :vars
    (
      ?auto_266076 - HOIST
      ?auto_266074 - PLACE
      ?auto_266077 - TRUCK
      ?auto_266075 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_266076 ?auto_266074 ) ( SURFACE-AT ?auto_266072 ?auto_266074 ) ( CLEAR ?auto_266072 ) ( IS-CRATE ?auto_266073 ) ( not ( = ?auto_266072 ?auto_266073 ) ) ( AVAILABLE ?auto_266076 ) ( IN ?auto_266073 ?auto_266077 ) ( ON ?auto_266072 ?auto_266071 ) ( not ( = ?auto_266071 ?auto_266072 ) ) ( not ( = ?auto_266071 ?auto_266073 ) ) ( TRUCK-AT ?auto_266077 ?auto_266075 ) ( not ( = ?auto_266075 ?auto_266074 ) ) ( ON ?auto_266069 ?auto_266068 ) ( ON ?auto_266070 ?auto_266069 ) ( ON ?auto_266071 ?auto_266070 ) ( not ( = ?auto_266068 ?auto_266069 ) ) ( not ( = ?auto_266068 ?auto_266070 ) ) ( not ( = ?auto_266068 ?auto_266071 ) ) ( not ( = ?auto_266068 ?auto_266072 ) ) ( not ( = ?auto_266068 ?auto_266073 ) ) ( not ( = ?auto_266069 ?auto_266070 ) ) ( not ( = ?auto_266069 ?auto_266071 ) ) ( not ( = ?auto_266069 ?auto_266072 ) ) ( not ( = ?auto_266069 ?auto_266073 ) ) ( not ( = ?auto_266070 ?auto_266071 ) ) ( not ( = ?auto_266070 ?auto_266072 ) ) ( not ( = ?auto_266070 ?auto_266073 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266071 ?auto_266072 ?auto_266073 )
      ( MAKE-5CRATE-VERIFY ?auto_266068 ?auto_266069 ?auto_266070 ?auto_266071 ?auto_266072 ?auto_266073 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266113 - SURFACE
      ?auto_266114 - SURFACE
      ?auto_266115 - SURFACE
      ?auto_266116 - SURFACE
      ?auto_266117 - SURFACE
      ?auto_266118 - SURFACE
    )
    :vars
    (
      ?auto_266123 - HOIST
      ?auto_266119 - PLACE
      ?auto_266122 - TRUCK
      ?auto_266120 - PLACE
      ?auto_266121 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_266123 ?auto_266119 ) ( SURFACE-AT ?auto_266117 ?auto_266119 ) ( CLEAR ?auto_266117 ) ( IS-CRATE ?auto_266118 ) ( not ( = ?auto_266117 ?auto_266118 ) ) ( AVAILABLE ?auto_266123 ) ( ON ?auto_266117 ?auto_266116 ) ( not ( = ?auto_266116 ?auto_266117 ) ) ( not ( = ?auto_266116 ?auto_266118 ) ) ( TRUCK-AT ?auto_266122 ?auto_266120 ) ( not ( = ?auto_266120 ?auto_266119 ) ) ( HOIST-AT ?auto_266121 ?auto_266120 ) ( LIFTING ?auto_266121 ?auto_266118 ) ( not ( = ?auto_266123 ?auto_266121 ) ) ( ON ?auto_266114 ?auto_266113 ) ( ON ?auto_266115 ?auto_266114 ) ( ON ?auto_266116 ?auto_266115 ) ( not ( = ?auto_266113 ?auto_266114 ) ) ( not ( = ?auto_266113 ?auto_266115 ) ) ( not ( = ?auto_266113 ?auto_266116 ) ) ( not ( = ?auto_266113 ?auto_266117 ) ) ( not ( = ?auto_266113 ?auto_266118 ) ) ( not ( = ?auto_266114 ?auto_266115 ) ) ( not ( = ?auto_266114 ?auto_266116 ) ) ( not ( = ?auto_266114 ?auto_266117 ) ) ( not ( = ?auto_266114 ?auto_266118 ) ) ( not ( = ?auto_266115 ?auto_266116 ) ) ( not ( = ?auto_266115 ?auto_266117 ) ) ( not ( = ?auto_266115 ?auto_266118 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266116 ?auto_266117 ?auto_266118 )
      ( MAKE-5CRATE-VERIFY ?auto_266113 ?auto_266114 ?auto_266115 ?auto_266116 ?auto_266117 ?auto_266118 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266163 - SURFACE
      ?auto_266164 - SURFACE
      ?auto_266165 - SURFACE
      ?auto_266166 - SURFACE
      ?auto_266167 - SURFACE
      ?auto_266168 - SURFACE
    )
    :vars
    (
      ?auto_266170 - HOIST
      ?auto_266171 - PLACE
      ?auto_266173 - TRUCK
      ?auto_266172 - PLACE
      ?auto_266174 - HOIST
      ?auto_266169 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_266170 ?auto_266171 ) ( SURFACE-AT ?auto_266167 ?auto_266171 ) ( CLEAR ?auto_266167 ) ( IS-CRATE ?auto_266168 ) ( not ( = ?auto_266167 ?auto_266168 ) ) ( AVAILABLE ?auto_266170 ) ( ON ?auto_266167 ?auto_266166 ) ( not ( = ?auto_266166 ?auto_266167 ) ) ( not ( = ?auto_266166 ?auto_266168 ) ) ( TRUCK-AT ?auto_266173 ?auto_266172 ) ( not ( = ?auto_266172 ?auto_266171 ) ) ( HOIST-AT ?auto_266174 ?auto_266172 ) ( not ( = ?auto_266170 ?auto_266174 ) ) ( AVAILABLE ?auto_266174 ) ( SURFACE-AT ?auto_266168 ?auto_266172 ) ( ON ?auto_266168 ?auto_266169 ) ( CLEAR ?auto_266168 ) ( not ( = ?auto_266167 ?auto_266169 ) ) ( not ( = ?auto_266168 ?auto_266169 ) ) ( not ( = ?auto_266166 ?auto_266169 ) ) ( ON ?auto_266164 ?auto_266163 ) ( ON ?auto_266165 ?auto_266164 ) ( ON ?auto_266166 ?auto_266165 ) ( not ( = ?auto_266163 ?auto_266164 ) ) ( not ( = ?auto_266163 ?auto_266165 ) ) ( not ( = ?auto_266163 ?auto_266166 ) ) ( not ( = ?auto_266163 ?auto_266167 ) ) ( not ( = ?auto_266163 ?auto_266168 ) ) ( not ( = ?auto_266163 ?auto_266169 ) ) ( not ( = ?auto_266164 ?auto_266165 ) ) ( not ( = ?auto_266164 ?auto_266166 ) ) ( not ( = ?auto_266164 ?auto_266167 ) ) ( not ( = ?auto_266164 ?auto_266168 ) ) ( not ( = ?auto_266164 ?auto_266169 ) ) ( not ( = ?auto_266165 ?auto_266166 ) ) ( not ( = ?auto_266165 ?auto_266167 ) ) ( not ( = ?auto_266165 ?auto_266168 ) ) ( not ( = ?auto_266165 ?auto_266169 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266166 ?auto_266167 ?auto_266168 )
      ( MAKE-5CRATE-VERIFY ?auto_266163 ?auto_266164 ?auto_266165 ?auto_266166 ?auto_266167 ?auto_266168 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266214 - SURFACE
      ?auto_266215 - SURFACE
      ?auto_266216 - SURFACE
      ?auto_266217 - SURFACE
      ?auto_266218 - SURFACE
      ?auto_266219 - SURFACE
    )
    :vars
    (
      ?auto_266225 - HOIST
      ?auto_266224 - PLACE
      ?auto_266222 - PLACE
      ?auto_266220 - HOIST
      ?auto_266221 - SURFACE
      ?auto_266223 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_266225 ?auto_266224 ) ( SURFACE-AT ?auto_266218 ?auto_266224 ) ( CLEAR ?auto_266218 ) ( IS-CRATE ?auto_266219 ) ( not ( = ?auto_266218 ?auto_266219 ) ) ( AVAILABLE ?auto_266225 ) ( ON ?auto_266218 ?auto_266217 ) ( not ( = ?auto_266217 ?auto_266218 ) ) ( not ( = ?auto_266217 ?auto_266219 ) ) ( not ( = ?auto_266222 ?auto_266224 ) ) ( HOIST-AT ?auto_266220 ?auto_266222 ) ( not ( = ?auto_266225 ?auto_266220 ) ) ( AVAILABLE ?auto_266220 ) ( SURFACE-AT ?auto_266219 ?auto_266222 ) ( ON ?auto_266219 ?auto_266221 ) ( CLEAR ?auto_266219 ) ( not ( = ?auto_266218 ?auto_266221 ) ) ( not ( = ?auto_266219 ?auto_266221 ) ) ( not ( = ?auto_266217 ?auto_266221 ) ) ( TRUCK-AT ?auto_266223 ?auto_266224 ) ( ON ?auto_266215 ?auto_266214 ) ( ON ?auto_266216 ?auto_266215 ) ( ON ?auto_266217 ?auto_266216 ) ( not ( = ?auto_266214 ?auto_266215 ) ) ( not ( = ?auto_266214 ?auto_266216 ) ) ( not ( = ?auto_266214 ?auto_266217 ) ) ( not ( = ?auto_266214 ?auto_266218 ) ) ( not ( = ?auto_266214 ?auto_266219 ) ) ( not ( = ?auto_266214 ?auto_266221 ) ) ( not ( = ?auto_266215 ?auto_266216 ) ) ( not ( = ?auto_266215 ?auto_266217 ) ) ( not ( = ?auto_266215 ?auto_266218 ) ) ( not ( = ?auto_266215 ?auto_266219 ) ) ( not ( = ?auto_266215 ?auto_266221 ) ) ( not ( = ?auto_266216 ?auto_266217 ) ) ( not ( = ?auto_266216 ?auto_266218 ) ) ( not ( = ?auto_266216 ?auto_266219 ) ) ( not ( = ?auto_266216 ?auto_266221 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266217 ?auto_266218 ?auto_266219 )
      ( MAKE-5CRATE-VERIFY ?auto_266214 ?auto_266215 ?auto_266216 ?auto_266217 ?auto_266218 ?auto_266219 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266265 - SURFACE
      ?auto_266266 - SURFACE
      ?auto_266267 - SURFACE
      ?auto_266268 - SURFACE
      ?auto_266269 - SURFACE
      ?auto_266270 - SURFACE
    )
    :vars
    (
      ?auto_266272 - HOIST
      ?auto_266274 - PLACE
      ?auto_266275 - PLACE
      ?auto_266276 - HOIST
      ?auto_266271 - SURFACE
      ?auto_266273 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_266272 ?auto_266274 ) ( IS-CRATE ?auto_266270 ) ( not ( = ?auto_266269 ?auto_266270 ) ) ( not ( = ?auto_266268 ?auto_266269 ) ) ( not ( = ?auto_266268 ?auto_266270 ) ) ( not ( = ?auto_266275 ?auto_266274 ) ) ( HOIST-AT ?auto_266276 ?auto_266275 ) ( not ( = ?auto_266272 ?auto_266276 ) ) ( AVAILABLE ?auto_266276 ) ( SURFACE-AT ?auto_266270 ?auto_266275 ) ( ON ?auto_266270 ?auto_266271 ) ( CLEAR ?auto_266270 ) ( not ( = ?auto_266269 ?auto_266271 ) ) ( not ( = ?auto_266270 ?auto_266271 ) ) ( not ( = ?auto_266268 ?auto_266271 ) ) ( TRUCK-AT ?auto_266273 ?auto_266274 ) ( SURFACE-AT ?auto_266268 ?auto_266274 ) ( CLEAR ?auto_266268 ) ( LIFTING ?auto_266272 ?auto_266269 ) ( IS-CRATE ?auto_266269 ) ( ON ?auto_266266 ?auto_266265 ) ( ON ?auto_266267 ?auto_266266 ) ( ON ?auto_266268 ?auto_266267 ) ( not ( = ?auto_266265 ?auto_266266 ) ) ( not ( = ?auto_266265 ?auto_266267 ) ) ( not ( = ?auto_266265 ?auto_266268 ) ) ( not ( = ?auto_266265 ?auto_266269 ) ) ( not ( = ?auto_266265 ?auto_266270 ) ) ( not ( = ?auto_266265 ?auto_266271 ) ) ( not ( = ?auto_266266 ?auto_266267 ) ) ( not ( = ?auto_266266 ?auto_266268 ) ) ( not ( = ?auto_266266 ?auto_266269 ) ) ( not ( = ?auto_266266 ?auto_266270 ) ) ( not ( = ?auto_266266 ?auto_266271 ) ) ( not ( = ?auto_266267 ?auto_266268 ) ) ( not ( = ?auto_266267 ?auto_266269 ) ) ( not ( = ?auto_266267 ?auto_266270 ) ) ( not ( = ?auto_266267 ?auto_266271 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266268 ?auto_266269 ?auto_266270 )
      ( MAKE-5CRATE-VERIFY ?auto_266265 ?auto_266266 ?auto_266267 ?auto_266268 ?auto_266269 ?auto_266270 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_266316 - SURFACE
      ?auto_266317 - SURFACE
      ?auto_266318 - SURFACE
      ?auto_266319 - SURFACE
      ?auto_266320 - SURFACE
      ?auto_266321 - SURFACE
    )
    :vars
    (
      ?auto_266323 - HOIST
      ?auto_266325 - PLACE
      ?auto_266324 - PLACE
      ?auto_266326 - HOIST
      ?auto_266322 - SURFACE
      ?auto_266327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_266323 ?auto_266325 ) ( IS-CRATE ?auto_266321 ) ( not ( = ?auto_266320 ?auto_266321 ) ) ( not ( = ?auto_266319 ?auto_266320 ) ) ( not ( = ?auto_266319 ?auto_266321 ) ) ( not ( = ?auto_266324 ?auto_266325 ) ) ( HOIST-AT ?auto_266326 ?auto_266324 ) ( not ( = ?auto_266323 ?auto_266326 ) ) ( AVAILABLE ?auto_266326 ) ( SURFACE-AT ?auto_266321 ?auto_266324 ) ( ON ?auto_266321 ?auto_266322 ) ( CLEAR ?auto_266321 ) ( not ( = ?auto_266320 ?auto_266322 ) ) ( not ( = ?auto_266321 ?auto_266322 ) ) ( not ( = ?auto_266319 ?auto_266322 ) ) ( TRUCK-AT ?auto_266327 ?auto_266325 ) ( SURFACE-AT ?auto_266319 ?auto_266325 ) ( CLEAR ?auto_266319 ) ( IS-CRATE ?auto_266320 ) ( AVAILABLE ?auto_266323 ) ( IN ?auto_266320 ?auto_266327 ) ( ON ?auto_266317 ?auto_266316 ) ( ON ?auto_266318 ?auto_266317 ) ( ON ?auto_266319 ?auto_266318 ) ( not ( = ?auto_266316 ?auto_266317 ) ) ( not ( = ?auto_266316 ?auto_266318 ) ) ( not ( = ?auto_266316 ?auto_266319 ) ) ( not ( = ?auto_266316 ?auto_266320 ) ) ( not ( = ?auto_266316 ?auto_266321 ) ) ( not ( = ?auto_266316 ?auto_266322 ) ) ( not ( = ?auto_266317 ?auto_266318 ) ) ( not ( = ?auto_266317 ?auto_266319 ) ) ( not ( = ?auto_266317 ?auto_266320 ) ) ( not ( = ?auto_266317 ?auto_266321 ) ) ( not ( = ?auto_266317 ?auto_266322 ) ) ( not ( = ?auto_266318 ?auto_266319 ) ) ( not ( = ?auto_266318 ?auto_266320 ) ) ( not ( = ?auto_266318 ?auto_266321 ) ) ( not ( = ?auto_266318 ?auto_266322 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_266319 ?auto_266320 ?auto_266321 )
      ( MAKE-5CRATE-VERIFY ?auto_266316 ?auto_266317 ?auto_266318 ?auto_266319 ?auto_266320 ?auto_266321 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_267525 - SURFACE
      ?auto_267526 - SURFACE
      ?auto_267527 - SURFACE
      ?auto_267528 - SURFACE
      ?auto_267529 - SURFACE
      ?auto_267530 - SURFACE
      ?auto_267531 - SURFACE
    )
    :vars
    (
      ?auto_267533 - HOIST
      ?auto_267532 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_267533 ?auto_267532 ) ( SURFACE-AT ?auto_267530 ?auto_267532 ) ( CLEAR ?auto_267530 ) ( LIFTING ?auto_267533 ?auto_267531 ) ( IS-CRATE ?auto_267531 ) ( not ( = ?auto_267530 ?auto_267531 ) ) ( ON ?auto_267526 ?auto_267525 ) ( ON ?auto_267527 ?auto_267526 ) ( ON ?auto_267528 ?auto_267527 ) ( ON ?auto_267529 ?auto_267528 ) ( ON ?auto_267530 ?auto_267529 ) ( not ( = ?auto_267525 ?auto_267526 ) ) ( not ( = ?auto_267525 ?auto_267527 ) ) ( not ( = ?auto_267525 ?auto_267528 ) ) ( not ( = ?auto_267525 ?auto_267529 ) ) ( not ( = ?auto_267525 ?auto_267530 ) ) ( not ( = ?auto_267525 ?auto_267531 ) ) ( not ( = ?auto_267526 ?auto_267527 ) ) ( not ( = ?auto_267526 ?auto_267528 ) ) ( not ( = ?auto_267526 ?auto_267529 ) ) ( not ( = ?auto_267526 ?auto_267530 ) ) ( not ( = ?auto_267526 ?auto_267531 ) ) ( not ( = ?auto_267527 ?auto_267528 ) ) ( not ( = ?auto_267527 ?auto_267529 ) ) ( not ( = ?auto_267527 ?auto_267530 ) ) ( not ( = ?auto_267527 ?auto_267531 ) ) ( not ( = ?auto_267528 ?auto_267529 ) ) ( not ( = ?auto_267528 ?auto_267530 ) ) ( not ( = ?auto_267528 ?auto_267531 ) ) ( not ( = ?auto_267529 ?auto_267530 ) ) ( not ( = ?auto_267529 ?auto_267531 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_267530 ?auto_267531 )
      ( MAKE-6CRATE-VERIFY ?auto_267525 ?auto_267526 ?auto_267527 ?auto_267528 ?auto_267529 ?auto_267530 ?auto_267531 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_267569 - SURFACE
      ?auto_267570 - SURFACE
      ?auto_267571 - SURFACE
      ?auto_267572 - SURFACE
      ?auto_267573 - SURFACE
      ?auto_267574 - SURFACE
      ?auto_267575 - SURFACE
    )
    :vars
    (
      ?auto_267577 - HOIST
      ?auto_267578 - PLACE
      ?auto_267576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_267577 ?auto_267578 ) ( SURFACE-AT ?auto_267574 ?auto_267578 ) ( CLEAR ?auto_267574 ) ( IS-CRATE ?auto_267575 ) ( not ( = ?auto_267574 ?auto_267575 ) ) ( TRUCK-AT ?auto_267576 ?auto_267578 ) ( AVAILABLE ?auto_267577 ) ( IN ?auto_267575 ?auto_267576 ) ( ON ?auto_267574 ?auto_267573 ) ( not ( = ?auto_267573 ?auto_267574 ) ) ( not ( = ?auto_267573 ?auto_267575 ) ) ( ON ?auto_267570 ?auto_267569 ) ( ON ?auto_267571 ?auto_267570 ) ( ON ?auto_267572 ?auto_267571 ) ( ON ?auto_267573 ?auto_267572 ) ( not ( = ?auto_267569 ?auto_267570 ) ) ( not ( = ?auto_267569 ?auto_267571 ) ) ( not ( = ?auto_267569 ?auto_267572 ) ) ( not ( = ?auto_267569 ?auto_267573 ) ) ( not ( = ?auto_267569 ?auto_267574 ) ) ( not ( = ?auto_267569 ?auto_267575 ) ) ( not ( = ?auto_267570 ?auto_267571 ) ) ( not ( = ?auto_267570 ?auto_267572 ) ) ( not ( = ?auto_267570 ?auto_267573 ) ) ( not ( = ?auto_267570 ?auto_267574 ) ) ( not ( = ?auto_267570 ?auto_267575 ) ) ( not ( = ?auto_267571 ?auto_267572 ) ) ( not ( = ?auto_267571 ?auto_267573 ) ) ( not ( = ?auto_267571 ?auto_267574 ) ) ( not ( = ?auto_267571 ?auto_267575 ) ) ( not ( = ?auto_267572 ?auto_267573 ) ) ( not ( = ?auto_267572 ?auto_267574 ) ) ( not ( = ?auto_267572 ?auto_267575 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_267573 ?auto_267574 ?auto_267575 )
      ( MAKE-6CRATE-VERIFY ?auto_267569 ?auto_267570 ?auto_267571 ?auto_267572 ?auto_267573 ?auto_267574 ?auto_267575 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_267620 - SURFACE
      ?auto_267621 - SURFACE
      ?auto_267622 - SURFACE
      ?auto_267623 - SURFACE
      ?auto_267624 - SURFACE
      ?auto_267625 - SURFACE
      ?auto_267626 - SURFACE
    )
    :vars
    (
      ?auto_267629 - HOIST
      ?auto_267628 - PLACE
      ?auto_267630 - TRUCK
      ?auto_267627 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_267629 ?auto_267628 ) ( SURFACE-AT ?auto_267625 ?auto_267628 ) ( CLEAR ?auto_267625 ) ( IS-CRATE ?auto_267626 ) ( not ( = ?auto_267625 ?auto_267626 ) ) ( AVAILABLE ?auto_267629 ) ( IN ?auto_267626 ?auto_267630 ) ( ON ?auto_267625 ?auto_267624 ) ( not ( = ?auto_267624 ?auto_267625 ) ) ( not ( = ?auto_267624 ?auto_267626 ) ) ( TRUCK-AT ?auto_267630 ?auto_267627 ) ( not ( = ?auto_267627 ?auto_267628 ) ) ( ON ?auto_267621 ?auto_267620 ) ( ON ?auto_267622 ?auto_267621 ) ( ON ?auto_267623 ?auto_267622 ) ( ON ?auto_267624 ?auto_267623 ) ( not ( = ?auto_267620 ?auto_267621 ) ) ( not ( = ?auto_267620 ?auto_267622 ) ) ( not ( = ?auto_267620 ?auto_267623 ) ) ( not ( = ?auto_267620 ?auto_267624 ) ) ( not ( = ?auto_267620 ?auto_267625 ) ) ( not ( = ?auto_267620 ?auto_267626 ) ) ( not ( = ?auto_267621 ?auto_267622 ) ) ( not ( = ?auto_267621 ?auto_267623 ) ) ( not ( = ?auto_267621 ?auto_267624 ) ) ( not ( = ?auto_267621 ?auto_267625 ) ) ( not ( = ?auto_267621 ?auto_267626 ) ) ( not ( = ?auto_267622 ?auto_267623 ) ) ( not ( = ?auto_267622 ?auto_267624 ) ) ( not ( = ?auto_267622 ?auto_267625 ) ) ( not ( = ?auto_267622 ?auto_267626 ) ) ( not ( = ?auto_267623 ?auto_267624 ) ) ( not ( = ?auto_267623 ?auto_267625 ) ) ( not ( = ?auto_267623 ?auto_267626 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_267624 ?auto_267625 ?auto_267626 )
      ( MAKE-6CRATE-VERIFY ?auto_267620 ?auto_267621 ?auto_267622 ?auto_267623 ?auto_267624 ?auto_267625 ?auto_267626 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_267677 - SURFACE
      ?auto_267678 - SURFACE
      ?auto_267679 - SURFACE
      ?auto_267680 - SURFACE
      ?auto_267681 - SURFACE
      ?auto_267682 - SURFACE
      ?auto_267683 - SURFACE
    )
    :vars
    (
      ?auto_267688 - HOIST
      ?auto_267687 - PLACE
      ?auto_267684 - TRUCK
      ?auto_267686 - PLACE
      ?auto_267685 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_267688 ?auto_267687 ) ( SURFACE-AT ?auto_267682 ?auto_267687 ) ( CLEAR ?auto_267682 ) ( IS-CRATE ?auto_267683 ) ( not ( = ?auto_267682 ?auto_267683 ) ) ( AVAILABLE ?auto_267688 ) ( ON ?auto_267682 ?auto_267681 ) ( not ( = ?auto_267681 ?auto_267682 ) ) ( not ( = ?auto_267681 ?auto_267683 ) ) ( TRUCK-AT ?auto_267684 ?auto_267686 ) ( not ( = ?auto_267686 ?auto_267687 ) ) ( HOIST-AT ?auto_267685 ?auto_267686 ) ( LIFTING ?auto_267685 ?auto_267683 ) ( not ( = ?auto_267688 ?auto_267685 ) ) ( ON ?auto_267678 ?auto_267677 ) ( ON ?auto_267679 ?auto_267678 ) ( ON ?auto_267680 ?auto_267679 ) ( ON ?auto_267681 ?auto_267680 ) ( not ( = ?auto_267677 ?auto_267678 ) ) ( not ( = ?auto_267677 ?auto_267679 ) ) ( not ( = ?auto_267677 ?auto_267680 ) ) ( not ( = ?auto_267677 ?auto_267681 ) ) ( not ( = ?auto_267677 ?auto_267682 ) ) ( not ( = ?auto_267677 ?auto_267683 ) ) ( not ( = ?auto_267678 ?auto_267679 ) ) ( not ( = ?auto_267678 ?auto_267680 ) ) ( not ( = ?auto_267678 ?auto_267681 ) ) ( not ( = ?auto_267678 ?auto_267682 ) ) ( not ( = ?auto_267678 ?auto_267683 ) ) ( not ( = ?auto_267679 ?auto_267680 ) ) ( not ( = ?auto_267679 ?auto_267681 ) ) ( not ( = ?auto_267679 ?auto_267682 ) ) ( not ( = ?auto_267679 ?auto_267683 ) ) ( not ( = ?auto_267680 ?auto_267681 ) ) ( not ( = ?auto_267680 ?auto_267682 ) ) ( not ( = ?auto_267680 ?auto_267683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_267681 ?auto_267682 ?auto_267683 )
      ( MAKE-6CRATE-VERIFY ?auto_267677 ?auto_267678 ?auto_267679 ?auto_267680 ?auto_267681 ?auto_267682 ?auto_267683 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_267740 - SURFACE
      ?auto_267741 - SURFACE
      ?auto_267742 - SURFACE
      ?auto_267743 - SURFACE
      ?auto_267744 - SURFACE
      ?auto_267745 - SURFACE
      ?auto_267746 - SURFACE
    )
    :vars
    (
      ?auto_267751 - HOIST
      ?auto_267750 - PLACE
      ?auto_267749 - TRUCK
      ?auto_267752 - PLACE
      ?auto_267748 - HOIST
      ?auto_267747 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_267751 ?auto_267750 ) ( SURFACE-AT ?auto_267745 ?auto_267750 ) ( CLEAR ?auto_267745 ) ( IS-CRATE ?auto_267746 ) ( not ( = ?auto_267745 ?auto_267746 ) ) ( AVAILABLE ?auto_267751 ) ( ON ?auto_267745 ?auto_267744 ) ( not ( = ?auto_267744 ?auto_267745 ) ) ( not ( = ?auto_267744 ?auto_267746 ) ) ( TRUCK-AT ?auto_267749 ?auto_267752 ) ( not ( = ?auto_267752 ?auto_267750 ) ) ( HOIST-AT ?auto_267748 ?auto_267752 ) ( not ( = ?auto_267751 ?auto_267748 ) ) ( AVAILABLE ?auto_267748 ) ( SURFACE-AT ?auto_267746 ?auto_267752 ) ( ON ?auto_267746 ?auto_267747 ) ( CLEAR ?auto_267746 ) ( not ( = ?auto_267745 ?auto_267747 ) ) ( not ( = ?auto_267746 ?auto_267747 ) ) ( not ( = ?auto_267744 ?auto_267747 ) ) ( ON ?auto_267741 ?auto_267740 ) ( ON ?auto_267742 ?auto_267741 ) ( ON ?auto_267743 ?auto_267742 ) ( ON ?auto_267744 ?auto_267743 ) ( not ( = ?auto_267740 ?auto_267741 ) ) ( not ( = ?auto_267740 ?auto_267742 ) ) ( not ( = ?auto_267740 ?auto_267743 ) ) ( not ( = ?auto_267740 ?auto_267744 ) ) ( not ( = ?auto_267740 ?auto_267745 ) ) ( not ( = ?auto_267740 ?auto_267746 ) ) ( not ( = ?auto_267740 ?auto_267747 ) ) ( not ( = ?auto_267741 ?auto_267742 ) ) ( not ( = ?auto_267741 ?auto_267743 ) ) ( not ( = ?auto_267741 ?auto_267744 ) ) ( not ( = ?auto_267741 ?auto_267745 ) ) ( not ( = ?auto_267741 ?auto_267746 ) ) ( not ( = ?auto_267741 ?auto_267747 ) ) ( not ( = ?auto_267742 ?auto_267743 ) ) ( not ( = ?auto_267742 ?auto_267744 ) ) ( not ( = ?auto_267742 ?auto_267745 ) ) ( not ( = ?auto_267742 ?auto_267746 ) ) ( not ( = ?auto_267742 ?auto_267747 ) ) ( not ( = ?auto_267743 ?auto_267744 ) ) ( not ( = ?auto_267743 ?auto_267745 ) ) ( not ( = ?auto_267743 ?auto_267746 ) ) ( not ( = ?auto_267743 ?auto_267747 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_267744 ?auto_267745 ?auto_267746 )
      ( MAKE-6CRATE-VERIFY ?auto_267740 ?auto_267741 ?auto_267742 ?auto_267743 ?auto_267744 ?auto_267745 ?auto_267746 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_267804 - SURFACE
      ?auto_267805 - SURFACE
      ?auto_267806 - SURFACE
      ?auto_267807 - SURFACE
      ?auto_267808 - SURFACE
      ?auto_267809 - SURFACE
      ?auto_267810 - SURFACE
    )
    :vars
    (
      ?auto_267811 - HOIST
      ?auto_267814 - PLACE
      ?auto_267816 - PLACE
      ?auto_267812 - HOIST
      ?auto_267813 - SURFACE
      ?auto_267815 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_267811 ?auto_267814 ) ( SURFACE-AT ?auto_267809 ?auto_267814 ) ( CLEAR ?auto_267809 ) ( IS-CRATE ?auto_267810 ) ( not ( = ?auto_267809 ?auto_267810 ) ) ( AVAILABLE ?auto_267811 ) ( ON ?auto_267809 ?auto_267808 ) ( not ( = ?auto_267808 ?auto_267809 ) ) ( not ( = ?auto_267808 ?auto_267810 ) ) ( not ( = ?auto_267816 ?auto_267814 ) ) ( HOIST-AT ?auto_267812 ?auto_267816 ) ( not ( = ?auto_267811 ?auto_267812 ) ) ( AVAILABLE ?auto_267812 ) ( SURFACE-AT ?auto_267810 ?auto_267816 ) ( ON ?auto_267810 ?auto_267813 ) ( CLEAR ?auto_267810 ) ( not ( = ?auto_267809 ?auto_267813 ) ) ( not ( = ?auto_267810 ?auto_267813 ) ) ( not ( = ?auto_267808 ?auto_267813 ) ) ( TRUCK-AT ?auto_267815 ?auto_267814 ) ( ON ?auto_267805 ?auto_267804 ) ( ON ?auto_267806 ?auto_267805 ) ( ON ?auto_267807 ?auto_267806 ) ( ON ?auto_267808 ?auto_267807 ) ( not ( = ?auto_267804 ?auto_267805 ) ) ( not ( = ?auto_267804 ?auto_267806 ) ) ( not ( = ?auto_267804 ?auto_267807 ) ) ( not ( = ?auto_267804 ?auto_267808 ) ) ( not ( = ?auto_267804 ?auto_267809 ) ) ( not ( = ?auto_267804 ?auto_267810 ) ) ( not ( = ?auto_267804 ?auto_267813 ) ) ( not ( = ?auto_267805 ?auto_267806 ) ) ( not ( = ?auto_267805 ?auto_267807 ) ) ( not ( = ?auto_267805 ?auto_267808 ) ) ( not ( = ?auto_267805 ?auto_267809 ) ) ( not ( = ?auto_267805 ?auto_267810 ) ) ( not ( = ?auto_267805 ?auto_267813 ) ) ( not ( = ?auto_267806 ?auto_267807 ) ) ( not ( = ?auto_267806 ?auto_267808 ) ) ( not ( = ?auto_267806 ?auto_267809 ) ) ( not ( = ?auto_267806 ?auto_267810 ) ) ( not ( = ?auto_267806 ?auto_267813 ) ) ( not ( = ?auto_267807 ?auto_267808 ) ) ( not ( = ?auto_267807 ?auto_267809 ) ) ( not ( = ?auto_267807 ?auto_267810 ) ) ( not ( = ?auto_267807 ?auto_267813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_267808 ?auto_267809 ?auto_267810 )
      ( MAKE-6CRATE-VERIFY ?auto_267804 ?auto_267805 ?auto_267806 ?auto_267807 ?auto_267808 ?auto_267809 ?auto_267810 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_267868 - SURFACE
      ?auto_267869 - SURFACE
      ?auto_267870 - SURFACE
      ?auto_267871 - SURFACE
      ?auto_267872 - SURFACE
      ?auto_267873 - SURFACE
      ?auto_267874 - SURFACE
    )
    :vars
    (
      ?auto_267880 - HOIST
      ?auto_267878 - PLACE
      ?auto_267879 - PLACE
      ?auto_267877 - HOIST
      ?auto_267876 - SURFACE
      ?auto_267875 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_267880 ?auto_267878 ) ( IS-CRATE ?auto_267874 ) ( not ( = ?auto_267873 ?auto_267874 ) ) ( not ( = ?auto_267872 ?auto_267873 ) ) ( not ( = ?auto_267872 ?auto_267874 ) ) ( not ( = ?auto_267879 ?auto_267878 ) ) ( HOIST-AT ?auto_267877 ?auto_267879 ) ( not ( = ?auto_267880 ?auto_267877 ) ) ( AVAILABLE ?auto_267877 ) ( SURFACE-AT ?auto_267874 ?auto_267879 ) ( ON ?auto_267874 ?auto_267876 ) ( CLEAR ?auto_267874 ) ( not ( = ?auto_267873 ?auto_267876 ) ) ( not ( = ?auto_267874 ?auto_267876 ) ) ( not ( = ?auto_267872 ?auto_267876 ) ) ( TRUCK-AT ?auto_267875 ?auto_267878 ) ( SURFACE-AT ?auto_267872 ?auto_267878 ) ( CLEAR ?auto_267872 ) ( LIFTING ?auto_267880 ?auto_267873 ) ( IS-CRATE ?auto_267873 ) ( ON ?auto_267869 ?auto_267868 ) ( ON ?auto_267870 ?auto_267869 ) ( ON ?auto_267871 ?auto_267870 ) ( ON ?auto_267872 ?auto_267871 ) ( not ( = ?auto_267868 ?auto_267869 ) ) ( not ( = ?auto_267868 ?auto_267870 ) ) ( not ( = ?auto_267868 ?auto_267871 ) ) ( not ( = ?auto_267868 ?auto_267872 ) ) ( not ( = ?auto_267868 ?auto_267873 ) ) ( not ( = ?auto_267868 ?auto_267874 ) ) ( not ( = ?auto_267868 ?auto_267876 ) ) ( not ( = ?auto_267869 ?auto_267870 ) ) ( not ( = ?auto_267869 ?auto_267871 ) ) ( not ( = ?auto_267869 ?auto_267872 ) ) ( not ( = ?auto_267869 ?auto_267873 ) ) ( not ( = ?auto_267869 ?auto_267874 ) ) ( not ( = ?auto_267869 ?auto_267876 ) ) ( not ( = ?auto_267870 ?auto_267871 ) ) ( not ( = ?auto_267870 ?auto_267872 ) ) ( not ( = ?auto_267870 ?auto_267873 ) ) ( not ( = ?auto_267870 ?auto_267874 ) ) ( not ( = ?auto_267870 ?auto_267876 ) ) ( not ( = ?auto_267871 ?auto_267872 ) ) ( not ( = ?auto_267871 ?auto_267873 ) ) ( not ( = ?auto_267871 ?auto_267874 ) ) ( not ( = ?auto_267871 ?auto_267876 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_267872 ?auto_267873 ?auto_267874 )
      ( MAKE-6CRATE-VERIFY ?auto_267868 ?auto_267869 ?auto_267870 ?auto_267871 ?auto_267872 ?auto_267873 ?auto_267874 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_267932 - SURFACE
      ?auto_267933 - SURFACE
      ?auto_267934 - SURFACE
      ?auto_267935 - SURFACE
      ?auto_267936 - SURFACE
      ?auto_267937 - SURFACE
      ?auto_267938 - SURFACE
    )
    :vars
    (
      ?auto_267941 - HOIST
      ?auto_267944 - PLACE
      ?auto_267943 - PLACE
      ?auto_267942 - HOIST
      ?auto_267939 - SURFACE
      ?auto_267940 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_267941 ?auto_267944 ) ( IS-CRATE ?auto_267938 ) ( not ( = ?auto_267937 ?auto_267938 ) ) ( not ( = ?auto_267936 ?auto_267937 ) ) ( not ( = ?auto_267936 ?auto_267938 ) ) ( not ( = ?auto_267943 ?auto_267944 ) ) ( HOIST-AT ?auto_267942 ?auto_267943 ) ( not ( = ?auto_267941 ?auto_267942 ) ) ( AVAILABLE ?auto_267942 ) ( SURFACE-AT ?auto_267938 ?auto_267943 ) ( ON ?auto_267938 ?auto_267939 ) ( CLEAR ?auto_267938 ) ( not ( = ?auto_267937 ?auto_267939 ) ) ( not ( = ?auto_267938 ?auto_267939 ) ) ( not ( = ?auto_267936 ?auto_267939 ) ) ( TRUCK-AT ?auto_267940 ?auto_267944 ) ( SURFACE-AT ?auto_267936 ?auto_267944 ) ( CLEAR ?auto_267936 ) ( IS-CRATE ?auto_267937 ) ( AVAILABLE ?auto_267941 ) ( IN ?auto_267937 ?auto_267940 ) ( ON ?auto_267933 ?auto_267932 ) ( ON ?auto_267934 ?auto_267933 ) ( ON ?auto_267935 ?auto_267934 ) ( ON ?auto_267936 ?auto_267935 ) ( not ( = ?auto_267932 ?auto_267933 ) ) ( not ( = ?auto_267932 ?auto_267934 ) ) ( not ( = ?auto_267932 ?auto_267935 ) ) ( not ( = ?auto_267932 ?auto_267936 ) ) ( not ( = ?auto_267932 ?auto_267937 ) ) ( not ( = ?auto_267932 ?auto_267938 ) ) ( not ( = ?auto_267932 ?auto_267939 ) ) ( not ( = ?auto_267933 ?auto_267934 ) ) ( not ( = ?auto_267933 ?auto_267935 ) ) ( not ( = ?auto_267933 ?auto_267936 ) ) ( not ( = ?auto_267933 ?auto_267937 ) ) ( not ( = ?auto_267933 ?auto_267938 ) ) ( not ( = ?auto_267933 ?auto_267939 ) ) ( not ( = ?auto_267934 ?auto_267935 ) ) ( not ( = ?auto_267934 ?auto_267936 ) ) ( not ( = ?auto_267934 ?auto_267937 ) ) ( not ( = ?auto_267934 ?auto_267938 ) ) ( not ( = ?auto_267934 ?auto_267939 ) ) ( not ( = ?auto_267935 ?auto_267936 ) ) ( not ( = ?auto_267935 ?auto_267937 ) ) ( not ( = ?auto_267935 ?auto_267938 ) ) ( not ( = ?auto_267935 ?auto_267939 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_267936 ?auto_267937 ?auto_267938 )
      ( MAKE-6CRATE-VERIFY ?auto_267932 ?auto_267933 ?auto_267934 ?auto_267935 ?auto_267936 ?auto_267937 ?auto_267938 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_269888 - SURFACE
      ?auto_269889 - SURFACE
      ?auto_269890 - SURFACE
      ?auto_269891 - SURFACE
      ?auto_269892 - SURFACE
      ?auto_269893 - SURFACE
      ?auto_269894 - SURFACE
      ?auto_269895 - SURFACE
    )
    :vars
    (
      ?auto_269897 - HOIST
      ?auto_269896 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_269897 ?auto_269896 ) ( SURFACE-AT ?auto_269894 ?auto_269896 ) ( CLEAR ?auto_269894 ) ( LIFTING ?auto_269897 ?auto_269895 ) ( IS-CRATE ?auto_269895 ) ( not ( = ?auto_269894 ?auto_269895 ) ) ( ON ?auto_269889 ?auto_269888 ) ( ON ?auto_269890 ?auto_269889 ) ( ON ?auto_269891 ?auto_269890 ) ( ON ?auto_269892 ?auto_269891 ) ( ON ?auto_269893 ?auto_269892 ) ( ON ?auto_269894 ?auto_269893 ) ( not ( = ?auto_269888 ?auto_269889 ) ) ( not ( = ?auto_269888 ?auto_269890 ) ) ( not ( = ?auto_269888 ?auto_269891 ) ) ( not ( = ?auto_269888 ?auto_269892 ) ) ( not ( = ?auto_269888 ?auto_269893 ) ) ( not ( = ?auto_269888 ?auto_269894 ) ) ( not ( = ?auto_269888 ?auto_269895 ) ) ( not ( = ?auto_269889 ?auto_269890 ) ) ( not ( = ?auto_269889 ?auto_269891 ) ) ( not ( = ?auto_269889 ?auto_269892 ) ) ( not ( = ?auto_269889 ?auto_269893 ) ) ( not ( = ?auto_269889 ?auto_269894 ) ) ( not ( = ?auto_269889 ?auto_269895 ) ) ( not ( = ?auto_269890 ?auto_269891 ) ) ( not ( = ?auto_269890 ?auto_269892 ) ) ( not ( = ?auto_269890 ?auto_269893 ) ) ( not ( = ?auto_269890 ?auto_269894 ) ) ( not ( = ?auto_269890 ?auto_269895 ) ) ( not ( = ?auto_269891 ?auto_269892 ) ) ( not ( = ?auto_269891 ?auto_269893 ) ) ( not ( = ?auto_269891 ?auto_269894 ) ) ( not ( = ?auto_269891 ?auto_269895 ) ) ( not ( = ?auto_269892 ?auto_269893 ) ) ( not ( = ?auto_269892 ?auto_269894 ) ) ( not ( = ?auto_269892 ?auto_269895 ) ) ( not ( = ?auto_269893 ?auto_269894 ) ) ( not ( = ?auto_269893 ?auto_269895 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_269894 ?auto_269895 )
      ( MAKE-7CRATE-VERIFY ?auto_269888 ?auto_269889 ?auto_269890 ?auto_269891 ?auto_269892 ?auto_269893 ?auto_269894 ?auto_269895 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_269943 - SURFACE
      ?auto_269944 - SURFACE
      ?auto_269945 - SURFACE
      ?auto_269946 - SURFACE
      ?auto_269947 - SURFACE
      ?auto_269948 - SURFACE
      ?auto_269949 - SURFACE
      ?auto_269950 - SURFACE
    )
    :vars
    (
      ?auto_269952 - HOIST
      ?auto_269951 - PLACE
      ?auto_269953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_269952 ?auto_269951 ) ( SURFACE-AT ?auto_269949 ?auto_269951 ) ( CLEAR ?auto_269949 ) ( IS-CRATE ?auto_269950 ) ( not ( = ?auto_269949 ?auto_269950 ) ) ( TRUCK-AT ?auto_269953 ?auto_269951 ) ( AVAILABLE ?auto_269952 ) ( IN ?auto_269950 ?auto_269953 ) ( ON ?auto_269949 ?auto_269948 ) ( not ( = ?auto_269948 ?auto_269949 ) ) ( not ( = ?auto_269948 ?auto_269950 ) ) ( ON ?auto_269944 ?auto_269943 ) ( ON ?auto_269945 ?auto_269944 ) ( ON ?auto_269946 ?auto_269945 ) ( ON ?auto_269947 ?auto_269946 ) ( ON ?auto_269948 ?auto_269947 ) ( not ( = ?auto_269943 ?auto_269944 ) ) ( not ( = ?auto_269943 ?auto_269945 ) ) ( not ( = ?auto_269943 ?auto_269946 ) ) ( not ( = ?auto_269943 ?auto_269947 ) ) ( not ( = ?auto_269943 ?auto_269948 ) ) ( not ( = ?auto_269943 ?auto_269949 ) ) ( not ( = ?auto_269943 ?auto_269950 ) ) ( not ( = ?auto_269944 ?auto_269945 ) ) ( not ( = ?auto_269944 ?auto_269946 ) ) ( not ( = ?auto_269944 ?auto_269947 ) ) ( not ( = ?auto_269944 ?auto_269948 ) ) ( not ( = ?auto_269944 ?auto_269949 ) ) ( not ( = ?auto_269944 ?auto_269950 ) ) ( not ( = ?auto_269945 ?auto_269946 ) ) ( not ( = ?auto_269945 ?auto_269947 ) ) ( not ( = ?auto_269945 ?auto_269948 ) ) ( not ( = ?auto_269945 ?auto_269949 ) ) ( not ( = ?auto_269945 ?auto_269950 ) ) ( not ( = ?auto_269946 ?auto_269947 ) ) ( not ( = ?auto_269946 ?auto_269948 ) ) ( not ( = ?auto_269946 ?auto_269949 ) ) ( not ( = ?auto_269946 ?auto_269950 ) ) ( not ( = ?auto_269947 ?auto_269948 ) ) ( not ( = ?auto_269947 ?auto_269949 ) ) ( not ( = ?auto_269947 ?auto_269950 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_269948 ?auto_269949 ?auto_269950 )
      ( MAKE-7CRATE-VERIFY ?auto_269943 ?auto_269944 ?auto_269945 ?auto_269946 ?auto_269947 ?auto_269948 ?auto_269949 ?auto_269950 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_270006 - SURFACE
      ?auto_270007 - SURFACE
      ?auto_270008 - SURFACE
      ?auto_270009 - SURFACE
      ?auto_270010 - SURFACE
      ?auto_270011 - SURFACE
      ?auto_270012 - SURFACE
      ?auto_270013 - SURFACE
    )
    :vars
    (
      ?auto_270017 - HOIST
      ?auto_270014 - PLACE
      ?auto_270016 - TRUCK
      ?auto_270015 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_270017 ?auto_270014 ) ( SURFACE-AT ?auto_270012 ?auto_270014 ) ( CLEAR ?auto_270012 ) ( IS-CRATE ?auto_270013 ) ( not ( = ?auto_270012 ?auto_270013 ) ) ( AVAILABLE ?auto_270017 ) ( IN ?auto_270013 ?auto_270016 ) ( ON ?auto_270012 ?auto_270011 ) ( not ( = ?auto_270011 ?auto_270012 ) ) ( not ( = ?auto_270011 ?auto_270013 ) ) ( TRUCK-AT ?auto_270016 ?auto_270015 ) ( not ( = ?auto_270015 ?auto_270014 ) ) ( ON ?auto_270007 ?auto_270006 ) ( ON ?auto_270008 ?auto_270007 ) ( ON ?auto_270009 ?auto_270008 ) ( ON ?auto_270010 ?auto_270009 ) ( ON ?auto_270011 ?auto_270010 ) ( not ( = ?auto_270006 ?auto_270007 ) ) ( not ( = ?auto_270006 ?auto_270008 ) ) ( not ( = ?auto_270006 ?auto_270009 ) ) ( not ( = ?auto_270006 ?auto_270010 ) ) ( not ( = ?auto_270006 ?auto_270011 ) ) ( not ( = ?auto_270006 ?auto_270012 ) ) ( not ( = ?auto_270006 ?auto_270013 ) ) ( not ( = ?auto_270007 ?auto_270008 ) ) ( not ( = ?auto_270007 ?auto_270009 ) ) ( not ( = ?auto_270007 ?auto_270010 ) ) ( not ( = ?auto_270007 ?auto_270011 ) ) ( not ( = ?auto_270007 ?auto_270012 ) ) ( not ( = ?auto_270007 ?auto_270013 ) ) ( not ( = ?auto_270008 ?auto_270009 ) ) ( not ( = ?auto_270008 ?auto_270010 ) ) ( not ( = ?auto_270008 ?auto_270011 ) ) ( not ( = ?auto_270008 ?auto_270012 ) ) ( not ( = ?auto_270008 ?auto_270013 ) ) ( not ( = ?auto_270009 ?auto_270010 ) ) ( not ( = ?auto_270009 ?auto_270011 ) ) ( not ( = ?auto_270009 ?auto_270012 ) ) ( not ( = ?auto_270009 ?auto_270013 ) ) ( not ( = ?auto_270010 ?auto_270011 ) ) ( not ( = ?auto_270010 ?auto_270012 ) ) ( not ( = ?auto_270010 ?auto_270013 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_270011 ?auto_270012 ?auto_270013 )
      ( MAKE-7CRATE-VERIFY ?auto_270006 ?auto_270007 ?auto_270008 ?auto_270009 ?auto_270010 ?auto_270011 ?auto_270012 ?auto_270013 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_270076 - SURFACE
      ?auto_270077 - SURFACE
      ?auto_270078 - SURFACE
      ?auto_270079 - SURFACE
      ?auto_270080 - SURFACE
      ?auto_270081 - SURFACE
      ?auto_270082 - SURFACE
      ?auto_270083 - SURFACE
    )
    :vars
    (
      ?auto_270086 - HOIST
      ?auto_270088 - PLACE
      ?auto_270085 - TRUCK
      ?auto_270087 - PLACE
      ?auto_270084 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_270086 ?auto_270088 ) ( SURFACE-AT ?auto_270082 ?auto_270088 ) ( CLEAR ?auto_270082 ) ( IS-CRATE ?auto_270083 ) ( not ( = ?auto_270082 ?auto_270083 ) ) ( AVAILABLE ?auto_270086 ) ( ON ?auto_270082 ?auto_270081 ) ( not ( = ?auto_270081 ?auto_270082 ) ) ( not ( = ?auto_270081 ?auto_270083 ) ) ( TRUCK-AT ?auto_270085 ?auto_270087 ) ( not ( = ?auto_270087 ?auto_270088 ) ) ( HOIST-AT ?auto_270084 ?auto_270087 ) ( LIFTING ?auto_270084 ?auto_270083 ) ( not ( = ?auto_270086 ?auto_270084 ) ) ( ON ?auto_270077 ?auto_270076 ) ( ON ?auto_270078 ?auto_270077 ) ( ON ?auto_270079 ?auto_270078 ) ( ON ?auto_270080 ?auto_270079 ) ( ON ?auto_270081 ?auto_270080 ) ( not ( = ?auto_270076 ?auto_270077 ) ) ( not ( = ?auto_270076 ?auto_270078 ) ) ( not ( = ?auto_270076 ?auto_270079 ) ) ( not ( = ?auto_270076 ?auto_270080 ) ) ( not ( = ?auto_270076 ?auto_270081 ) ) ( not ( = ?auto_270076 ?auto_270082 ) ) ( not ( = ?auto_270076 ?auto_270083 ) ) ( not ( = ?auto_270077 ?auto_270078 ) ) ( not ( = ?auto_270077 ?auto_270079 ) ) ( not ( = ?auto_270077 ?auto_270080 ) ) ( not ( = ?auto_270077 ?auto_270081 ) ) ( not ( = ?auto_270077 ?auto_270082 ) ) ( not ( = ?auto_270077 ?auto_270083 ) ) ( not ( = ?auto_270078 ?auto_270079 ) ) ( not ( = ?auto_270078 ?auto_270080 ) ) ( not ( = ?auto_270078 ?auto_270081 ) ) ( not ( = ?auto_270078 ?auto_270082 ) ) ( not ( = ?auto_270078 ?auto_270083 ) ) ( not ( = ?auto_270079 ?auto_270080 ) ) ( not ( = ?auto_270079 ?auto_270081 ) ) ( not ( = ?auto_270079 ?auto_270082 ) ) ( not ( = ?auto_270079 ?auto_270083 ) ) ( not ( = ?auto_270080 ?auto_270081 ) ) ( not ( = ?auto_270080 ?auto_270082 ) ) ( not ( = ?auto_270080 ?auto_270083 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_270081 ?auto_270082 ?auto_270083 )
      ( MAKE-7CRATE-VERIFY ?auto_270076 ?auto_270077 ?auto_270078 ?auto_270079 ?auto_270080 ?auto_270081 ?auto_270082 ?auto_270083 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_270153 - SURFACE
      ?auto_270154 - SURFACE
      ?auto_270155 - SURFACE
      ?auto_270156 - SURFACE
      ?auto_270157 - SURFACE
      ?auto_270158 - SURFACE
      ?auto_270159 - SURFACE
      ?auto_270160 - SURFACE
    )
    :vars
    (
      ?auto_270166 - HOIST
      ?auto_270162 - PLACE
      ?auto_270161 - TRUCK
      ?auto_270163 - PLACE
      ?auto_270165 - HOIST
      ?auto_270164 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_270166 ?auto_270162 ) ( SURFACE-AT ?auto_270159 ?auto_270162 ) ( CLEAR ?auto_270159 ) ( IS-CRATE ?auto_270160 ) ( not ( = ?auto_270159 ?auto_270160 ) ) ( AVAILABLE ?auto_270166 ) ( ON ?auto_270159 ?auto_270158 ) ( not ( = ?auto_270158 ?auto_270159 ) ) ( not ( = ?auto_270158 ?auto_270160 ) ) ( TRUCK-AT ?auto_270161 ?auto_270163 ) ( not ( = ?auto_270163 ?auto_270162 ) ) ( HOIST-AT ?auto_270165 ?auto_270163 ) ( not ( = ?auto_270166 ?auto_270165 ) ) ( AVAILABLE ?auto_270165 ) ( SURFACE-AT ?auto_270160 ?auto_270163 ) ( ON ?auto_270160 ?auto_270164 ) ( CLEAR ?auto_270160 ) ( not ( = ?auto_270159 ?auto_270164 ) ) ( not ( = ?auto_270160 ?auto_270164 ) ) ( not ( = ?auto_270158 ?auto_270164 ) ) ( ON ?auto_270154 ?auto_270153 ) ( ON ?auto_270155 ?auto_270154 ) ( ON ?auto_270156 ?auto_270155 ) ( ON ?auto_270157 ?auto_270156 ) ( ON ?auto_270158 ?auto_270157 ) ( not ( = ?auto_270153 ?auto_270154 ) ) ( not ( = ?auto_270153 ?auto_270155 ) ) ( not ( = ?auto_270153 ?auto_270156 ) ) ( not ( = ?auto_270153 ?auto_270157 ) ) ( not ( = ?auto_270153 ?auto_270158 ) ) ( not ( = ?auto_270153 ?auto_270159 ) ) ( not ( = ?auto_270153 ?auto_270160 ) ) ( not ( = ?auto_270153 ?auto_270164 ) ) ( not ( = ?auto_270154 ?auto_270155 ) ) ( not ( = ?auto_270154 ?auto_270156 ) ) ( not ( = ?auto_270154 ?auto_270157 ) ) ( not ( = ?auto_270154 ?auto_270158 ) ) ( not ( = ?auto_270154 ?auto_270159 ) ) ( not ( = ?auto_270154 ?auto_270160 ) ) ( not ( = ?auto_270154 ?auto_270164 ) ) ( not ( = ?auto_270155 ?auto_270156 ) ) ( not ( = ?auto_270155 ?auto_270157 ) ) ( not ( = ?auto_270155 ?auto_270158 ) ) ( not ( = ?auto_270155 ?auto_270159 ) ) ( not ( = ?auto_270155 ?auto_270160 ) ) ( not ( = ?auto_270155 ?auto_270164 ) ) ( not ( = ?auto_270156 ?auto_270157 ) ) ( not ( = ?auto_270156 ?auto_270158 ) ) ( not ( = ?auto_270156 ?auto_270159 ) ) ( not ( = ?auto_270156 ?auto_270160 ) ) ( not ( = ?auto_270156 ?auto_270164 ) ) ( not ( = ?auto_270157 ?auto_270158 ) ) ( not ( = ?auto_270157 ?auto_270159 ) ) ( not ( = ?auto_270157 ?auto_270160 ) ) ( not ( = ?auto_270157 ?auto_270164 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_270158 ?auto_270159 ?auto_270160 )
      ( MAKE-7CRATE-VERIFY ?auto_270153 ?auto_270154 ?auto_270155 ?auto_270156 ?auto_270157 ?auto_270158 ?auto_270159 ?auto_270160 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_270231 - SURFACE
      ?auto_270232 - SURFACE
      ?auto_270233 - SURFACE
      ?auto_270234 - SURFACE
      ?auto_270235 - SURFACE
      ?auto_270236 - SURFACE
      ?auto_270237 - SURFACE
      ?auto_270238 - SURFACE
    )
    :vars
    (
      ?auto_270239 - HOIST
      ?auto_270243 - PLACE
      ?auto_270241 - PLACE
      ?auto_270242 - HOIST
      ?auto_270240 - SURFACE
      ?auto_270244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_270239 ?auto_270243 ) ( SURFACE-AT ?auto_270237 ?auto_270243 ) ( CLEAR ?auto_270237 ) ( IS-CRATE ?auto_270238 ) ( not ( = ?auto_270237 ?auto_270238 ) ) ( AVAILABLE ?auto_270239 ) ( ON ?auto_270237 ?auto_270236 ) ( not ( = ?auto_270236 ?auto_270237 ) ) ( not ( = ?auto_270236 ?auto_270238 ) ) ( not ( = ?auto_270241 ?auto_270243 ) ) ( HOIST-AT ?auto_270242 ?auto_270241 ) ( not ( = ?auto_270239 ?auto_270242 ) ) ( AVAILABLE ?auto_270242 ) ( SURFACE-AT ?auto_270238 ?auto_270241 ) ( ON ?auto_270238 ?auto_270240 ) ( CLEAR ?auto_270238 ) ( not ( = ?auto_270237 ?auto_270240 ) ) ( not ( = ?auto_270238 ?auto_270240 ) ) ( not ( = ?auto_270236 ?auto_270240 ) ) ( TRUCK-AT ?auto_270244 ?auto_270243 ) ( ON ?auto_270232 ?auto_270231 ) ( ON ?auto_270233 ?auto_270232 ) ( ON ?auto_270234 ?auto_270233 ) ( ON ?auto_270235 ?auto_270234 ) ( ON ?auto_270236 ?auto_270235 ) ( not ( = ?auto_270231 ?auto_270232 ) ) ( not ( = ?auto_270231 ?auto_270233 ) ) ( not ( = ?auto_270231 ?auto_270234 ) ) ( not ( = ?auto_270231 ?auto_270235 ) ) ( not ( = ?auto_270231 ?auto_270236 ) ) ( not ( = ?auto_270231 ?auto_270237 ) ) ( not ( = ?auto_270231 ?auto_270238 ) ) ( not ( = ?auto_270231 ?auto_270240 ) ) ( not ( = ?auto_270232 ?auto_270233 ) ) ( not ( = ?auto_270232 ?auto_270234 ) ) ( not ( = ?auto_270232 ?auto_270235 ) ) ( not ( = ?auto_270232 ?auto_270236 ) ) ( not ( = ?auto_270232 ?auto_270237 ) ) ( not ( = ?auto_270232 ?auto_270238 ) ) ( not ( = ?auto_270232 ?auto_270240 ) ) ( not ( = ?auto_270233 ?auto_270234 ) ) ( not ( = ?auto_270233 ?auto_270235 ) ) ( not ( = ?auto_270233 ?auto_270236 ) ) ( not ( = ?auto_270233 ?auto_270237 ) ) ( not ( = ?auto_270233 ?auto_270238 ) ) ( not ( = ?auto_270233 ?auto_270240 ) ) ( not ( = ?auto_270234 ?auto_270235 ) ) ( not ( = ?auto_270234 ?auto_270236 ) ) ( not ( = ?auto_270234 ?auto_270237 ) ) ( not ( = ?auto_270234 ?auto_270238 ) ) ( not ( = ?auto_270234 ?auto_270240 ) ) ( not ( = ?auto_270235 ?auto_270236 ) ) ( not ( = ?auto_270235 ?auto_270237 ) ) ( not ( = ?auto_270235 ?auto_270238 ) ) ( not ( = ?auto_270235 ?auto_270240 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_270236 ?auto_270237 ?auto_270238 )
      ( MAKE-7CRATE-VERIFY ?auto_270231 ?auto_270232 ?auto_270233 ?auto_270234 ?auto_270235 ?auto_270236 ?auto_270237 ?auto_270238 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_270309 - SURFACE
      ?auto_270310 - SURFACE
      ?auto_270311 - SURFACE
      ?auto_270312 - SURFACE
      ?auto_270313 - SURFACE
      ?auto_270314 - SURFACE
      ?auto_270315 - SURFACE
      ?auto_270316 - SURFACE
    )
    :vars
    (
      ?auto_270320 - HOIST
      ?auto_270317 - PLACE
      ?auto_270322 - PLACE
      ?auto_270318 - HOIST
      ?auto_270321 - SURFACE
      ?auto_270319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_270320 ?auto_270317 ) ( IS-CRATE ?auto_270316 ) ( not ( = ?auto_270315 ?auto_270316 ) ) ( not ( = ?auto_270314 ?auto_270315 ) ) ( not ( = ?auto_270314 ?auto_270316 ) ) ( not ( = ?auto_270322 ?auto_270317 ) ) ( HOIST-AT ?auto_270318 ?auto_270322 ) ( not ( = ?auto_270320 ?auto_270318 ) ) ( AVAILABLE ?auto_270318 ) ( SURFACE-AT ?auto_270316 ?auto_270322 ) ( ON ?auto_270316 ?auto_270321 ) ( CLEAR ?auto_270316 ) ( not ( = ?auto_270315 ?auto_270321 ) ) ( not ( = ?auto_270316 ?auto_270321 ) ) ( not ( = ?auto_270314 ?auto_270321 ) ) ( TRUCK-AT ?auto_270319 ?auto_270317 ) ( SURFACE-AT ?auto_270314 ?auto_270317 ) ( CLEAR ?auto_270314 ) ( LIFTING ?auto_270320 ?auto_270315 ) ( IS-CRATE ?auto_270315 ) ( ON ?auto_270310 ?auto_270309 ) ( ON ?auto_270311 ?auto_270310 ) ( ON ?auto_270312 ?auto_270311 ) ( ON ?auto_270313 ?auto_270312 ) ( ON ?auto_270314 ?auto_270313 ) ( not ( = ?auto_270309 ?auto_270310 ) ) ( not ( = ?auto_270309 ?auto_270311 ) ) ( not ( = ?auto_270309 ?auto_270312 ) ) ( not ( = ?auto_270309 ?auto_270313 ) ) ( not ( = ?auto_270309 ?auto_270314 ) ) ( not ( = ?auto_270309 ?auto_270315 ) ) ( not ( = ?auto_270309 ?auto_270316 ) ) ( not ( = ?auto_270309 ?auto_270321 ) ) ( not ( = ?auto_270310 ?auto_270311 ) ) ( not ( = ?auto_270310 ?auto_270312 ) ) ( not ( = ?auto_270310 ?auto_270313 ) ) ( not ( = ?auto_270310 ?auto_270314 ) ) ( not ( = ?auto_270310 ?auto_270315 ) ) ( not ( = ?auto_270310 ?auto_270316 ) ) ( not ( = ?auto_270310 ?auto_270321 ) ) ( not ( = ?auto_270311 ?auto_270312 ) ) ( not ( = ?auto_270311 ?auto_270313 ) ) ( not ( = ?auto_270311 ?auto_270314 ) ) ( not ( = ?auto_270311 ?auto_270315 ) ) ( not ( = ?auto_270311 ?auto_270316 ) ) ( not ( = ?auto_270311 ?auto_270321 ) ) ( not ( = ?auto_270312 ?auto_270313 ) ) ( not ( = ?auto_270312 ?auto_270314 ) ) ( not ( = ?auto_270312 ?auto_270315 ) ) ( not ( = ?auto_270312 ?auto_270316 ) ) ( not ( = ?auto_270312 ?auto_270321 ) ) ( not ( = ?auto_270313 ?auto_270314 ) ) ( not ( = ?auto_270313 ?auto_270315 ) ) ( not ( = ?auto_270313 ?auto_270316 ) ) ( not ( = ?auto_270313 ?auto_270321 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_270314 ?auto_270315 ?auto_270316 )
      ( MAKE-7CRATE-VERIFY ?auto_270309 ?auto_270310 ?auto_270311 ?auto_270312 ?auto_270313 ?auto_270314 ?auto_270315 ?auto_270316 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_270387 - SURFACE
      ?auto_270388 - SURFACE
      ?auto_270389 - SURFACE
      ?auto_270390 - SURFACE
      ?auto_270391 - SURFACE
      ?auto_270392 - SURFACE
      ?auto_270393 - SURFACE
      ?auto_270394 - SURFACE
    )
    :vars
    (
      ?auto_270400 - HOIST
      ?auto_270396 - PLACE
      ?auto_270395 - PLACE
      ?auto_270397 - HOIST
      ?auto_270399 - SURFACE
      ?auto_270398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_270400 ?auto_270396 ) ( IS-CRATE ?auto_270394 ) ( not ( = ?auto_270393 ?auto_270394 ) ) ( not ( = ?auto_270392 ?auto_270393 ) ) ( not ( = ?auto_270392 ?auto_270394 ) ) ( not ( = ?auto_270395 ?auto_270396 ) ) ( HOIST-AT ?auto_270397 ?auto_270395 ) ( not ( = ?auto_270400 ?auto_270397 ) ) ( AVAILABLE ?auto_270397 ) ( SURFACE-AT ?auto_270394 ?auto_270395 ) ( ON ?auto_270394 ?auto_270399 ) ( CLEAR ?auto_270394 ) ( not ( = ?auto_270393 ?auto_270399 ) ) ( not ( = ?auto_270394 ?auto_270399 ) ) ( not ( = ?auto_270392 ?auto_270399 ) ) ( TRUCK-AT ?auto_270398 ?auto_270396 ) ( SURFACE-AT ?auto_270392 ?auto_270396 ) ( CLEAR ?auto_270392 ) ( IS-CRATE ?auto_270393 ) ( AVAILABLE ?auto_270400 ) ( IN ?auto_270393 ?auto_270398 ) ( ON ?auto_270388 ?auto_270387 ) ( ON ?auto_270389 ?auto_270388 ) ( ON ?auto_270390 ?auto_270389 ) ( ON ?auto_270391 ?auto_270390 ) ( ON ?auto_270392 ?auto_270391 ) ( not ( = ?auto_270387 ?auto_270388 ) ) ( not ( = ?auto_270387 ?auto_270389 ) ) ( not ( = ?auto_270387 ?auto_270390 ) ) ( not ( = ?auto_270387 ?auto_270391 ) ) ( not ( = ?auto_270387 ?auto_270392 ) ) ( not ( = ?auto_270387 ?auto_270393 ) ) ( not ( = ?auto_270387 ?auto_270394 ) ) ( not ( = ?auto_270387 ?auto_270399 ) ) ( not ( = ?auto_270388 ?auto_270389 ) ) ( not ( = ?auto_270388 ?auto_270390 ) ) ( not ( = ?auto_270388 ?auto_270391 ) ) ( not ( = ?auto_270388 ?auto_270392 ) ) ( not ( = ?auto_270388 ?auto_270393 ) ) ( not ( = ?auto_270388 ?auto_270394 ) ) ( not ( = ?auto_270388 ?auto_270399 ) ) ( not ( = ?auto_270389 ?auto_270390 ) ) ( not ( = ?auto_270389 ?auto_270391 ) ) ( not ( = ?auto_270389 ?auto_270392 ) ) ( not ( = ?auto_270389 ?auto_270393 ) ) ( not ( = ?auto_270389 ?auto_270394 ) ) ( not ( = ?auto_270389 ?auto_270399 ) ) ( not ( = ?auto_270390 ?auto_270391 ) ) ( not ( = ?auto_270390 ?auto_270392 ) ) ( not ( = ?auto_270390 ?auto_270393 ) ) ( not ( = ?auto_270390 ?auto_270394 ) ) ( not ( = ?auto_270390 ?auto_270399 ) ) ( not ( = ?auto_270391 ?auto_270392 ) ) ( not ( = ?auto_270391 ?auto_270393 ) ) ( not ( = ?auto_270391 ?auto_270394 ) ) ( not ( = ?auto_270391 ?auto_270399 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_270392 ?auto_270393 ?auto_270394 )
      ( MAKE-7CRATE-VERIFY ?auto_270387 ?auto_270388 ?auto_270389 ?auto_270390 ?auto_270391 ?auto_270392 ?auto_270393 ?auto_270394 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273306 - SURFACE
      ?auto_273307 - SURFACE
      ?auto_273308 - SURFACE
      ?auto_273309 - SURFACE
      ?auto_273310 - SURFACE
      ?auto_273311 - SURFACE
      ?auto_273312 - SURFACE
      ?auto_273313 - SURFACE
      ?auto_273314 - SURFACE
    )
    :vars
    (
      ?auto_273315 - HOIST
      ?auto_273316 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_273315 ?auto_273316 ) ( SURFACE-AT ?auto_273313 ?auto_273316 ) ( CLEAR ?auto_273313 ) ( LIFTING ?auto_273315 ?auto_273314 ) ( IS-CRATE ?auto_273314 ) ( not ( = ?auto_273313 ?auto_273314 ) ) ( ON ?auto_273307 ?auto_273306 ) ( ON ?auto_273308 ?auto_273307 ) ( ON ?auto_273309 ?auto_273308 ) ( ON ?auto_273310 ?auto_273309 ) ( ON ?auto_273311 ?auto_273310 ) ( ON ?auto_273312 ?auto_273311 ) ( ON ?auto_273313 ?auto_273312 ) ( not ( = ?auto_273306 ?auto_273307 ) ) ( not ( = ?auto_273306 ?auto_273308 ) ) ( not ( = ?auto_273306 ?auto_273309 ) ) ( not ( = ?auto_273306 ?auto_273310 ) ) ( not ( = ?auto_273306 ?auto_273311 ) ) ( not ( = ?auto_273306 ?auto_273312 ) ) ( not ( = ?auto_273306 ?auto_273313 ) ) ( not ( = ?auto_273306 ?auto_273314 ) ) ( not ( = ?auto_273307 ?auto_273308 ) ) ( not ( = ?auto_273307 ?auto_273309 ) ) ( not ( = ?auto_273307 ?auto_273310 ) ) ( not ( = ?auto_273307 ?auto_273311 ) ) ( not ( = ?auto_273307 ?auto_273312 ) ) ( not ( = ?auto_273307 ?auto_273313 ) ) ( not ( = ?auto_273307 ?auto_273314 ) ) ( not ( = ?auto_273308 ?auto_273309 ) ) ( not ( = ?auto_273308 ?auto_273310 ) ) ( not ( = ?auto_273308 ?auto_273311 ) ) ( not ( = ?auto_273308 ?auto_273312 ) ) ( not ( = ?auto_273308 ?auto_273313 ) ) ( not ( = ?auto_273308 ?auto_273314 ) ) ( not ( = ?auto_273309 ?auto_273310 ) ) ( not ( = ?auto_273309 ?auto_273311 ) ) ( not ( = ?auto_273309 ?auto_273312 ) ) ( not ( = ?auto_273309 ?auto_273313 ) ) ( not ( = ?auto_273309 ?auto_273314 ) ) ( not ( = ?auto_273310 ?auto_273311 ) ) ( not ( = ?auto_273310 ?auto_273312 ) ) ( not ( = ?auto_273310 ?auto_273313 ) ) ( not ( = ?auto_273310 ?auto_273314 ) ) ( not ( = ?auto_273311 ?auto_273312 ) ) ( not ( = ?auto_273311 ?auto_273313 ) ) ( not ( = ?auto_273311 ?auto_273314 ) ) ( not ( = ?auto_273312 ?auto_273313 ) ) ( not ( = ?auto_273312 ?auto_273314 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_273313 ?auto_273314 )
      ( MAKE-8CRATE-VERIFY ?auto_273306 ?auto_273307 ?auto_273308 ?auto_273309 ?auto_273310 ?auto_273311 ?auto_273312 ?auto_273313 ?auto_273314 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273373 - SURFACE
      ?auto_273374 - SURFACE
      ?auto_273375 - SURFACE
      ?auto_273376 - SURFACE
      ?auto_273377 - SURFACE
      ?auto_273378 - SURFACE
      ?auto_273379 - SURFACE
      ?auto_273380 - SURFACE
      ?auto_273381 - SURFACE
    )
    :vars
    (
      ?auto_273383 - HOIST
      ?auto_273384 - PLACE
      ?auto_273382 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_273383 ?auto_273384 ) ( SURFACE-AT ?auto_273380 ?auto_273384 ) ( CLEAR ?auto_273380 ) ( IS-CRATE ?auto_273381 ) ( not ( = ?auto_273380 ?auto_273381 ) ) ( TRUCK-AT ?auto_273382 ?auto_273384 ) ( AVAILABLE ?auto_273383 ) ( IN ?auto_273381 ?auto_273382 ) ( ON ?auto_273380 ?auto_273379 ) ( not ( = ?auto_273379 ?auto_273380 ) ) ( not ( = ?auto_273379 ?auto_273381 ) ) ( ON ?auto_273374 ?auto_273373 ) ( ON ?auto_273375 ?auto_273374 ) ( ON ?auto_273376 ?auto_273375 ) ( ON ?auto_273377 ?auto_273376 ) ( ON ?auto_273378 ?auto_273377 ) ( ON ?auto_273379 ?auto_273378 ) ( not ( = ?auto_273373 ?auto_273374 ) ) ( not ( = ?auto_273373 ?auto_273375 ) ) ( not ( = ?auto_273373 ?auto_273376 ) ) ( not ( = ?auto_273373 ?auto_273377 ) ) ( not ( = ?auto_273373 ?auto_273378 ) ) ( not ( = ?auto_273373 ?auto_273379 ) ) ( not ( = ?auto_273373 ?auto_273380 ) ) ( not ( = ?auto_273373 ?auto_273381 ) ) ( not ( = ?auto_273374 ?auto_273375 ) ) ( not ( = ?auto_273374 ?auto_273376 ) ) ( not ( = ?auto_273374 ?auto_273377 ) ) ( not ( = ?auto_273374 ?auto_273378 ) ) ( not ( = ?auto_273374 ?auto_273379 ) ) ( not ( = ?auto_273374 ?auto_273380 ) ) ( not ( = ?auto_273374 ?auto_273381 ) ) ( not ( = ?auto_273375 ?auto_273376 ) ) ( not ( = ?auto_273375 ?auto_273377 ) ) ( not ( = ?auto_273375 ?auto_273378 ) ) ( not ( = ?auto_273375 ?auto_273379 ) ) ( not ( = ?auto_273375 ?auto_273380 ) ) ( not ( = ?auto_273375 ?auto_273381 ) ) ( not ( = ?auto_273376 ?auto_273377 ) ) ( not ( = ?auto_273376 ?auto_273378 ) ) ( not ( = ?auto_273376 ?auto_273379 ) ) ( not ( = ?auto_273376 ?auto_273380 ) ) ( not ( = ?auto_273376 ?auto_273381 ) ) ( not ( = ?auto_273377 ?auto_273378 ) ) ( not ( = ?auto_273377 ?auto_273379 ) ) ( not ( = ?auto_273377 ?auto_273380 ) ) ( not ( = ?auto_273377 ?auto_273381 ) ) ( not ( = ?auto_273378 ?auto_273379 ) ) ( not ( = ?auto_273378 ?auto_273380 ) ) ( not ( = ?auto_273378 ?auto_273381 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_273379 ?auto_273380 ?auto_273381 )
      ( MAKE-8CRATE-VERIFY ?auto_273373 ?auto_273374 ?auto_273375 ?auto_273376 ?auto_273377 ?auto_273378 ?auto_273379 ?auto_273380 ?auto_273381 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273449 - SURFACE
      ?auto_273450 - SURFACE
      ?auto_273451 - SURFACE
      ?auto_273452 - SURFACE
      ?auto_273453 - SURFACE
      ?auto_273454 - SURFACE
      ?auto_273455 - SURFACE
      ?auto_273456 - SURFACE
      ?auto_273457 - SURFACE
    )
    :vars
    (
      ?auto_273460 - HOIST
      ?auto_273459 - PLACE
      ?auto_273458 - TRUCK
      ?auto_273461 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_273460 ?auto_273459 ) ( SURFACE-AT ?auto_273456 ?auto_273459 ) ( CLEAR ?auto_273456 ) ( IS-CRATE ?auto_273457 ) ( not ( = ?auto_273456 ?auto_273457 ) ) ( AVAILABLE ?auto_273460 ) ( IN ?auto_273457 ?auto_273458 ) ( ON ?auto_273456 ?auto_273455 ) ( not ( = ?auto_273455 ?auto_273456 ) ) ( not ( = ?auto_273455 ?auto_273457 ) ) ( TRUCK-AT ?auto_273458 ?auto_273461 ) ( not ( = ?auto_273461 ?auto_273459 ) ) ( ON ?auto_273450 ?auto_273449 ) ( ON ?auto_273451 ?auto_273450 ) ( ON ?auto_273452 ?auto_273451 ) ( ON ?auto_273453 ?auto_273452 ) ( ON ?auto_273454 ?auto_273453 ) ( ON ?auto_273455 ?auto_273454 ) ( not ( = ?auto_273449 ?auto_273450 ) ) ( not ( = ?auto_273449 ?auto_273451 ) ) ( not ( = ?auto_273449 ?auto_273452 ) ) ( not ( = ?auto_273449 ?auto_273453 ) ) ( not ( = ?auto_273449 ?auto_273454 ) ) ( not ( = ?auto_273449 ?auto_273455 ) ) ( not ( = ?auto_273449 ?auto_273456 ) ) ( not ( = ?auto_273449 ?auto_273457 ) ) ( not ( = ?auto_273450 ?auto_273451 ) ) ( not ( = ?auto_273450 ?auto_273452 ) ) ( not ( = ?auto_273450 ?auto_273453 ) ) ( not ( = ?auto_273450 ?auto_273454 ) ) ( not ( = ?auto_273450 ?auto_273455 ) ) ( not ( = ?auto_273450 ?auto_273456 ) ) ( not ( = ?auto_273450 ?auto_273457 ) ) ( not ( = ?auto_273451 ?auto_273452 ) ) ( not ( = ?auto_273451 ?auto_273453 ) ) ( not ( = ?auto_273451 ?auto_273454 ) ) ( not ( = ?auto_273451 ?auto_273455 ) ) ( not ( = ?auto_273451 ?auto_273456 ) ) ( not ( = ?auto_273451 ?auto_273457 ) ) ( not ( = ?auto_273452 ?auto_273453 ) ) ( not ( = ?auto_273452 ?auto_273454 ) ) ( not ( = ?auto_273452 ?auto_273455 ) ) ( not ( = ?auto_273452 ?auto_273456 ) ) ( not ( = ?auto_273452 ?auto_273457 ) ) ( not ( = ?auto_273453 ?auto_273454 ) ) ( not ( = ?auto_273453 ?auto_273455 ) ) ( not ( = ?auto_273453 ?auto_273456 ) ) ( not ( = ?auto_273453 ?auto_273457 ) ) ( not ( = ?auto_273454 ?auto_273455 ) ) ( not ( = ?auto_273454 ?auto_273456 ) ) ( not ( = ?auto_273454 ?auto_273457 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_273455 ?auto_273456 ?auto_273457 )
      ( MAKE-8CRATE-VERIFY ?auto_273449 ?auto_273450 ?auto_273451 ?auto_273452 ?auto_273453 ?auto_273454 ?auto_273455 ?auto_273456 ?auto_273457 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273533 - SURFACE
      ?auto_273534 - SURFACE
      ?auto_273535 - SURFACE
      ?auto_273536 - SURFACE
      ?auto_273537 - SURFACE
      ?auto_273538 - SURFACE
      ?auto_273539 - SURFACE
      ?auto_273540 - SURFACE
      ?auto_273541 - SURFACE
    )
    :vars
    (
      ?auto_273542 - HOIST
      ?auto_273543 - PLACE
      ?auto_273545 - TRUCK
      ?auto_273544 - PLACE
      ?auto_273546 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_273542 ?auto_273543 ) ( SURFACE-AT ?auto_273540 ?auto_273543 ) ( CLEAR ?auto_273540 ) ( IS-CRATE ?auto_273541 ) ( not ( = ?auto_273540 ?auto_273541 ) ) ( AVAILABLE ?auto_273542 ) ( ON ?auto_273540 ?auto_273539 ) ( not ( = ?auto_273539 ?auto_273540 ) ) ( not ( = ?auto_273539 ?auto_273541 ) ) ( TRUCK-AT ?auto_273545 ?auto_273544 ) ( not ( = ?auto_273544 ?auto_273543 ) ) ( HOIST-AT ?auto_273546 ?auto_273544 ) ( LIFTING ?auto_273546 ?auto_273541 ) ( not ( = ?auto_273542 ?auto_273546 ) ) ( ON ?auto_273534 ?auto_273533 ) ( ON ?auto_273535 ?auto_273534 ) ( ON ?auto_273536 ?auto_273535 ) ( ON ?auto_273537 ?auto_273536 ) ( ON ?auto_273538 ?auto_273537 ) ( ON ?auto_273539 ?auto_273538 ) ( not ( = ?auto_273533 ?auto_273534 ) ) ( not ( = ?auto_273533 ?auto_273535 ) ) ( not ( = ?auto_273533 ?auto_273536 ) ) ( not ( = ?auto_273533 ?auto_273537 ) ) ( not ( = ?auto_273533 ?auto_273538 ) ) ( not ( = ?auto_273533 ?auto_273539 ) ) ( not ( = ?auto_273533 ?auto_273540 ) ) ( not ( = ?auto_273533 ?auto_273541 ) ) ( not ( = ?auto_273534 ?auto_273535 ) ) ( not ( = ?auto_273534 ?auto_273536 ) ) ( not ( = ?auto_273534 ?auto_273537 ) ) ( not ( = ?auto_273534 ?auto_273538 ) ) ( not ( = ?auto_273534 ?auto_273539 ) ) ( not ( = ?auto_273534 ?auto_273540 ) ) ( not ( = ?auto_273534 ?auto_273541 ) ) ( not ( = ?auto_273535 ?auto_273536 ) ) ( not ( = ?auto_273535 ?auto_273537 ) ) ( not ( = ?auto_273535 ?auto_273538 ) ) ( not ( = ?auto_273535 ?auto_273539 ) ) ( not ( = ?auto_273535 ?auto_273540 ) ) ( not ( = ?auto_273535 ?auto_273541 ) ) ( not ( = ?auto_273536 ?auto_273537 ) ) ( not ( = ?auto_273536 ?auto_273538 ) ) ( not ( = ?auto_273536 ?auto_273539 ) ) ( not ( = ?auto_273536 ?auto_273540 ) ) ( not ( = ?auto_273536 ?auto_273541 ) ) ( not ( = ?auto_273537 ?auto_273538 ) ) ( not ( = ?auto_273537 ?auto_273539 ) ) ( not ( = ?auto_273537 ?auto_273540 ) ) ( not ( = ?auto_273537 ?auto_273541 ) ) ( not ( = ?auto_273538 ?auto_273539 ) ) ( not ( = ?auto_273538 ?auto_273540 ) ) ( not ( = ?auto_273538 ?auto_273541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_273539 ?auto_273540 ?auto_273541 )
      ( MAKE-8CRATE-VERIFY ?auto_273533 ?auto_273534 ?auto_273535 ?auto_273536 ?auto_273537 ?auto_273538 ?auto_273539 ?auto_273540 ?auto_273541 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273625 - SURFACE
      ?auto_273626 - SURFACE
      ?auto_273627 - SURFACE
      ?auto_273628 - SURFACE
      ?auto_273629 - SURFACE
      ?auto_273630 - SURFACE
      ?auto_273631 - SURFACE
      ?auto_273632 - SURFACE
      ?auto_273633 - SURFACE
    )
    :vars
    (
      ?auto_273635 - HOIST
      ?auto_273638 - PLACE
      ?auto_273636 - TRUCK
      ?auto_273639 - PLACE
      ?auto_273634 - HOIST
      ?auto_273637 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_273635 ?auto_273638 ) ( SURFACE-AT ?auto_273632 ?auto_273638 ) ( CLEAR ?auto_273632 ) ( IS-CRATE ?auto_273633 ) ( not ( = ?auto_273632 ?auto_273633 ) ) ( AVAILABLE ?auto_273635 ) ( ON ?auto_273632 ?auto_273631 ) ( not ( = ?auto_273631 ?auto_273632 ) ) ( not ( = ?auto_273631 ?auto_273633 ) ) ( TRUCK-AT ?auto_273636 ?auto_273639 ) ( not ( = ?auto_273639 ?auto_273638 ) ) ( HOIST-AT ?auto_273634 ?auto_273639 ) ( not ( = ?auto_273635 ?auto_273634 ) ) ( AVAILABLE ?auto_273634 ) ( SURFACE-AT ?auto_273633 ?auto_273639 ) ( ON ?auto_273633 ?auto_273637 ) ( CLEAR ?auto_273633 ) ( not ( = ?auto_273632 ?auto_273637 ) ) ( not ( = ?auto_273633 ?auto_273637 ) ) ( not ( = ?auto_273631 ?auto_273637 ) ) ( ON ?auto_273626 ?auto_273625 ) ( ON ?auto_273627 ?auto_273626 ) ( ON ?auto_273628 ?auto_273627 ) ( ON ?auto_273629 ?auto_273628 ) ( ON ?auto_273630 ?auto_273629 ) ( ON ?auto_273631 ?auto_273630 ) ( not ( = ?auto_273625 ?auto_273626 ) ) ( not ( = ?auto_273625 ?auto_273627 ) ) ( not ( = ?auto_273625 ?auto_273628 ) ) ( not ( = ?auto_273625 ?auto_273629 ) ) ( not ( = ?auto_273625 ?auto_273630 ) ) ( not ( = ?auto_273625 ?auto_273631 ) ) ( not ( = ?auto_273625 ?auto_273632 ) ) ( not ( = ?auto_273625 ?auto_273633 ) ) ( not ( = ?auto_273625 ?auto_273637 ) ) ( not ( = ?auto_273626 ?auto_273627 ) ) ( not ( = ?auto_273626 ?auto_273628 ) ) ( not ( = ?auto_273626 ?auto_273629 ) ) ( not ( = ?auto_273626 ?auto_273630 ) ) ( not ( = ?auto_273626 ?auto_273631 ) ) ( not ( = ?auto_273626 ?auto_273632 ) ) ( not ( = ?auto_273626 ?auto_273633 ) ) ( not ( = ?auto_273626 ?auto_273637 ) ) ( not ( = ?auto_273627 ?auto_273628 ) ) ( not ( = ?auto_273627 ?auto_273629 ) ) ( not ( = ?auto_273627 ?auto_273630 ) ) ( not ( = ?auto_273627 ?auto_273631 ) ) ( not ( = ?auto_273627 ?auto_273632 ) ) ( not ( = ?auto_273627 ?auto_273633 ) ) ( not ( = ?auto_273627 ?auto_273637 ) ) ( not ( = ?auto_273628 ?auto_273629 ) ) ( not ( = ?auto_273628 ?auto_273630 ) ) ( not ( = ?auto_273628 ?auto_273631 ) ) ( not ( = ?auto_273628 ?auto_273632 ) ) ( not ( = ?auto_273628 ?auto_273633 ) ) ( not ( = ?auto_273628 ?auto_273637 ) ) ( not ( = ?auto_273629 ?auto_273630 ) ) ( not ( = ?auto_273629 ?auto_273631 ) ) ( not ( = ?auto_273629 ?auto_273632 ) ) ( not ( = ?auto_273629 ?auto_273633 ) ) ( not ( = ?auto_273629 ?auto_273637 ) ) ( not ( = ?auto_273630 ?auto_273631 ) ) ( not ( = ?auto_273630 ?auto_273632 ) ) ( not ( = ?auto_273630 ?auto_273633 ) ) ( not ( = ?auto_273630 ?auto_273637 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_273631 ?auto_273632 ?auto_273633 )
      ( MAKE-8CRATE-VERIFY ?auto_273625 ?auto_273626 ?auto_273627 ?auto_273628 ?auto_273629 ?auto_273630 ?auto_273631 ?auto_273632 ?auto_273633 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273718 - SURFACE
      ?auto_273719 - SURFACE
      ?auto_273720 - SURFACE
      ?auto_273721 - SURFACE
      ?auto_273722 - SURFACE
      ?auto_273723 - SURFACE
      ?auto_273724 - SURFACE
      ?auto_273725 - SURFACE
      ?auto_273726 - SURFACE
    )
    :vars
    (
      ?auto_273732 - HOIST
      ?auto_273731 - PLACE
      ?auto_273729 - PLACE
      ?auto_273727 - HOIST
      ?auto_273730 - SURFACE
      ?auto_273728 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_273732 ?auto_273731 ) ( SURFACE-AT ?auto_273725 ?auto_273731 ) ( CLEAR ?auto_273725 ) ( IS-CRATE ?auto_273726 ) ( not ( = ?auto_273725 ?auto_273726 ) ) ( AVAILABLE ?auto_273732 ) ( ON ?auto_273725 ?auto_273724 ) ( not ( = ?auto_273724 ?auto_273725 ) ) ( not ( = ?auto_273724 ?auto_273726 ) ) ( not ( = ?auto_273729 ?auto_273731 ) ) ( HOIST-AT ?auto_273727 ?auto_273729 ) ( not ( = ?auto_273732 ?auto_273727 ) ) ( AVAILABLE ?auto_273727 ) ( SURFACE-AT ?auto_273726 ?auto_273729 ) ( ON ?auto_273726 ?auto_273730 ) ( CLEAR ?auto_273726 ) ( not ( = ?auto_273725 ?auto_273730 ) ) ( not ( = ?auto_273726 ?auto_273730 ) ) ( not ( = ?auto_273724 ?auto_273730 ) ) ( TRUCK-AT ?auto_273728 ?auto_273731 ) ( ON ?auto_273719 ?auto_273718 ) ( ON ?auto_273720 ?auto_273719 ) ( ON ?auto_273721 ?auto_273720 ) ( ON ?auto_273722 ?auto_273721 ) ( ON ?auto_273723 ?auto_273722 ) ( ON ?auto_273724 ?auto_273723 ) ( not ( = ?auto_273718 ?auto_273719 ) ) ( not ( = ?auto_273718 ?auto_273720 ) ) ( not ( = ?auto_273718 ?auto_273721 ) ) ( not ( = ?auto_273718 ?auto_273722 ) ) ( not ( = ?auto_273718 ?auto_273723 ) ) ( not ( = ?auto_273718 ?auto_273724 ) ) ( not ( = ?auto_273718 ?auto_273725 ) ) ( not ( = ?auto_273718 ?auto_273726 ) ) ( not ( = ?auto_273718 ?auto_273730 ) ) ( not ( = ?auto_273719 ?auto_273720 ) ) ( not ( = ?auto_273719 ?auto_273721 ) ) ( not ( = ?auto_273719 ?auto_273722 ) ) ( not ( = ?auto_273719 ?auto_273723 ) ) ( not ( = ?auto_273719 ?auto_273724 ) ) ( not ( = ?auto_273719 ?auto_273725 ) ) ( not ( = ?auto_273719 ?auto_273726 ) ) ( not ( = ?auto_273719 ?auto_273730 ) ) ( not ( = ?auto_273720 ?auto_273721 ) ) ( not ( = ?auto_273720 ?auto_273722 ) ) ( not ( = ?auto_273720 ?auto_273723 ) ) ( not ( = ?auto_273720 ?auto_273724 ) ) ( not ( = ?auto_273720 ?auto_273725 ) ) ( not ( = ?auto_273720 ?auto_273726 ) ) ( not ( = ?auto_273720 ?auto_273730 ) ) ( not ( = ?auto_273721 ?auto_273722 ) ) ( not ( = ?auto_273721 ?auto_273723 ) ) ( not ( = ?auto_273721 ?auto_273724 ) ) ( not ( = ?auto_273721 ?auto_273725 ) ) ( not ( = ?auto_273721 ?auto_273726 ) ) ( not ( = ?auto_273721 ?auto_273730 ) ) ( not ( = ?auto_273722 ?auto_273723 ) ) ( not ( = ?auto_273722 ?auto_273724 ) ) ( not ( = ?auto_273722 ?auto_273725 ) ) ( not ( = ?auto_273722 ?auto_273726 ) ) ( not ( = ?auto_273722 ?auto_273730 ) ) ( not ( = ?auto_273723 ?auto_273724 ) ) ( not ( = ?auto_273723 ?auto_273725 ) ) ( not ( = ?auto_273723 ?auto_273726 ) ) ( not ( = ?auto_273723 ?auto_273730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_273724 ?auto_273725 ?auto_273726 )
      ( MAKE-8CRATE-VERIFY ?auto_273718 ?auto_273719 ?auto_273720 ?auto_273721 ?auto_273722 ?auto_273723 ?auto_273724 ?auto_273725 ?auto_273726 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273811 - SURFACE
      ?auto_273812 - SURFACE
      ?auto_273813 - SURFACE
      ?auto_273814 - SURFACE
      ?auto_273815 - SURFACE
      ?auto_273816 - SURFACE
      ?auto_273817 - SURFACE
      ?auto_273818 - SURFACE
      ?auto_273819 - SURFACE
    )
    :vars
    (
      ?auto_273825 - HOIST
      ?auto_273823 - PLACE
      ?auto_273824 - PLACE
      ?auto_273822 - HOIST
      ?auto_273820 - SURFACE
      ?auto_273821 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_273825 ?auto_273823 ) ( IS-CRATE ?auto_273819 ) ( not ( = ?auto_273818 ?auto_273819 ) ) ( not ( = ?auto_273817 ?auto_273818 ) ) ( not ( = ?auto_273817 ?auto_273819 ) ) ( not ( = ?auto_273824 ?auto_273823 ) ) ( HOIST-AT ?auto_273822 ?auto_273824 ) ( not ( = ?auto_273825 ?auto_273822 ) ) ( AVAILABLE ?auto_273822 ) ( SURFACE-AT ?auto_273819 ?auto_273824 ) ( ON ?auto_273819 ?auto_273820 ) ( CLEAR ?auto_273819 ) ( not ( = ?auto_273818 ?auto_273820 ) ) ( not ( = ?auto_273819 ?auto_273820 ) ) ( not ( = ?auto_273817 ?auto_273820 ) ) ( TRUCK-AT ?auto_273821 ?auto_273823 ) ( SURFACE-AT ?auto_273817 ?auto_273823 ) ( CLEAR ?auto_273817 ) ( LIFTING ?auto_273825 ?auto_273818 ) ( IS-CRATE ?auto_273818 ) ( ON ?auto_273812 ?auto_273811 ) ( ON ?auto_273813 ?auto_273812 ) ( ON ?auto_273814 ?auto_273813 ) ( ON ?auto_273815 ?auto_273814 ) ( ON ?auto_273816 ?auto_273815 ) ( ON ?auto_273817 ?auto_273816 ) ( not ( = ?auto_273811 ?auto_273812 ) ) ( not ( = ?auto_273811 ?auto_273813 ) ) ( not ( = ?auto_273811 ?auto_273814 ) ) ( not ( = ?auto_273811 ?auto_273815 ) ) ( not ( = ?auto_273811 ?auto_273816 ) ) ( not ( = ?auto_273811 ?auto_273817 ) ) ( not ( = ?auto_273811 ?auto_273818 ) ) ( not ( = ?auto_273811 ?auto_273819 ) ) ( not ( = ?auto_273811 ?auto_273820 ) ) ( not ( = ?auto_273812 ?auto_273813 ) ) ( not ( = ?auto_273812 ?auto_273814 ) ) ( not ( = ?auto_273812 ?auto_273815 ) ) ( not ( = ?auto_273812 ?auto_273816 ) ) ( not ( = ?auto_273812 ?auto_273817 ) ) ( not ( = ?auto_273812 ?auto_273818 ) ) ( not ( = ?auto_273812 ?auto_273819 ) ) ( not ( = ?auto_273812 ?auto_273820 ) ) ( not ( = ?auto_273813 ?auto_273814 ) ) ( not ( = ?auto_273813 ?auto_273815 ) ) ( not ( = ?auto_273813 ?auto_273816 ) ) ( not ( = ?auto_273813 ?auto_273817 ) ) ( not ( = ?auto_273813 ?auto_273818 ) ) ( not ( = ?auto_273813 ?auto_273819 ) ) ( not ( = ?auto_273813 ?auto_273820 ) ) ( not ( = ?auto_273814 ?auto_273815 ) ) ( not ( = ?auto_273814 ?auto_273816 ) ) ( not ( = ?auto_273814 ?auto_273817 ) ) ( not ( = ?auto_273814 ?auto_273818 ) ) ( not ( = ?auto_273814 ?auto_273819 ) ) ( not ( = ?auto_273814 ?auto_273820 ) ) ( not ( = ?auto_273815 ?auto_273816 ) ) ( not ( = ?auto_273815 ?auto_273817 ) ) ( not ( = ?auto_273815 ?auto_273818 ) ) ( not ( = ?auto_273815 ?auto_273819 ) ) ( not ( = ?auto_273815 ?auto_273820 ) ) ( not ( = ?auto_273816 ?auto_273817 ) ) ( not ( = ?auto_273816 ?auto_273818 ) ) ( not ( = ?auto_273816 ?auto_273819 ) ) ( not ( = ?auto_273816 ?auto_273820 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_273817 ?auto_273818 ?auto_273819 )
      ( MAKE-8CRATE-VERIFY ?auto_273811 ?auto_273812 ?auto_273813 ?auto_273814 ?auto_273815 ?auto_273816 ?auto_273817 ?auto_273818 ?auto_273819 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_273904 - SURFACE
      ?auto_273905 - SURFACE
      ?auto_273906 - SURFACE
      ?auto_273907 - SURFACE
      ?auto_273908 - SURFACE
      ?auto_273909 - SURFACE
      ?auto_273910 - SURFACE
      ?auto_273911 - SURFACE
      ?auto_273912 - SURFACE
    )
    :vars
    (
      ?auto_273913 - HOIST
      ?auto_273915 - PLACE
      ?auto_273917 - PLACE
      ?auto_273916 - HOIST
      ?auto_273918 - SURFACE
      ?auto_273914 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_273913 ?auto_273915 ) ( IS-CRATE ?auto_273912 ) ( not ( = ?auto_273911 ?auto_273912 ) ) ( not ( = ?auto_273910 ?auto_273911 ) ) ( not ( = ?auto_273910 ?auto_273912 ) ) ( not ( = ?auto_273917 ?auto_273915 ) ) ( HOIST-AT ?auto_273916 ?auto_273917 ) ( not ( = ?auto_273913 ?auto_273916 ) ) ( AVAILABLE ?auto_273916 ) ( SURFACE-AT ?auto_273912 ?auto_273917 ) ( ON ?auto_273912 ?auto_273918 ) ( CLEAR ?auto_273912 ) ( not ( = ?auto_273911 ?auto_273918 ) ) ( not ( = ?auto_273912 ?auto_273918 ) ) ( not ( = ?auto_273910 ?auto_273918 ) ) ( TRUCK-AT ?auto_273914 ?auto_273915 ) ( SURFACE-AT ?auto_273910 ?auto_273915 ) ( CLEAR ?auto_273910 ) ( IS-CRATE ?auto_273911 ) ( AVAILABLE ?auto_273913 ) ( IN ?auto_273911 ?auto_273914 ) ( ON ?auto_273905 ?auto_273904 ) ( ON ?auto_273906 ?auto_273905 ) ( ON ?auto_273907 ?auto_273906 ) ( ON ?auto_273908 ?auto_273907 ) ( ON ?auto_273909 ?auto_273908 ) ( ON ?auto_273910 ?auto_273909 ) ( not ( = ?auto_273904 ?auto_273905 ) ) ( not ( = ?auto_273904 ?auto_273906 ) ) ( not ( = ?auto_273904 ?auto_273907 ) ) ( not ( = ?auto_273904 ?auto_273908 ) ) ( not ( = ?auto_273904 ?auto_273909 ) ) ( not ( = ?auto_273904 ?auto_273910 ) ) ( not ( = ?auto_273904 ?auto_273911 ) ) ( not ( = ?auto_273904 ?auto_273912 ) ) ( not ( = ?auto_273904 ?auto_273918 ) ) ( not ( = ?auto_273905 ?auto_273906 ) ) ( not ( = ?auto_273905 ?auto_273907 ) ) ( not ( = ?auto_273905 ?auto_273908 ) ) ( not ( = ?auto_273905 ?auto_273909 ) ) ( not ( = ?auto_273905 ?auto_273910 ) ) ( not ( = ?auto_273905 ?auto_273911 ) ) ( not ( = ?auto_273905 ?auto_273912 ) ) ( not ( = ?auto_273905 ?auto_273918 ) ) ( not ( = ?auto_273906 ?auto_273907 ) ) ( not ( = ?auto_273906 ?auto_273908 ) ) ( not ( = ?auto_273906 ?auto_273909 ) ) ( not ( = ?auto_273906 ?auto_273910 ) ) ( not ( = ?auto_273906 ?auto_273911 ) ) ( not ( = ?auto_273906 ?auto_273912 ) ) ( not ( = ?auto_273906 ?auto_273918 ) ) ( not ( = ?auto_273907 ?auto_273908 ) ) ( not ( = ?auto_273907 ?auto_273909 ) ) ( not ( = ?auto_273907 ?auto_273910 ) ) ( not ( = ?auto_273907 ?auto_273911 ) ) ( not ( = ?auto_273907 ?auto_273912 ) ) ( not ( = ?auto_273907 ?auto_273918 ) ) ( not ( = ?auto_273908 ?auto_273909 ) ) ( not ( = ?auto_273908 ?auto_273910 ) ) ( not ( = ?auto_273908 ?auto_273911 ) ) ( not ( = ?auto_273908 ?auto_273912 ) ) ( not ( = ?auto_273908 ?auto_273918 ) ) ( not ( = ?auto_273909 ?auto_273910 ) ) ( not ( = ?auto_273909 ?auto_273911 ) ) ( not ( = ?auto_273909 ?auto_273912 ) ) ( not ( = ?auto_273909 ?auto_273918 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_273910 ?auto_273911 ?auto_273912 )
      ( MAKE-8CRATE-VERIFY ?auto_273904 ?auto_273905 ?auto_273906 ?auto_273907 ?auto_273908 ?auto_273909 ?auto_273910 ?auto_273911 ?auto_273912 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278020 - SURFACE
      ?auto_278021 - SURFACE
      ?auto_278022 - SURFACE
      ?auto_278023 - SURFACE
      ?auto_278024 - SURFACE
      ?auto_278025 - SURFACE
      ?auto_278026 - SURFACE
      ?auto_278027 - SURFACE
      ?auto_278028 - SURFACE
      ?auto_278029 - SURFACE
    )
    :vars
    (
      ?auto_278031 - HOIST
      ?auto_278030 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_278031 ?auto_278030 ) ( SURFACE-AT ?auto_278028 ?auto_278030 ) ( CLEAR ?auto_278028 ) ( LIFTING ?auto_278031 ?auto_278029 ) ( IS-CRATE ?auto_278029 ) ( not ( = ?auto_278028 ?auto_278029 ) ) ( ON ?auto_278021 ?auto_278020 ) ( ON ?auto_278022 ?auto_278021 ) ( ON ?auto_278023 ?auto_278022 ) ( ON ?auto_278024 ?auto_278023 ) ( ON ?auto_278025 ?auto_278024 ) ( ON ?auto_278026 ?auto_278025 ) ( ON ?auto_278027 ?auto_278026 ) ( ON ?auto_278028 ?auto_278027 ) ( not ( = ?auto_278020 ?auto_278021 ) ) ( not ( = ?auto_278020 ?auto_278022 ) ) ( not ( = ?auto_278020 ?auto_278023 ) ) ( not ( = ?auto_278020 ?auto_278024 ) ) ( not ( = ?auto_278020 ?auto_278025 ) ) ( not ( = ?auto_278020 ?auto_278026 ) ) ( not ( = ?auto_278020 ?auto_278027 ) ) ( not ( = ?auto_278020 ?auto_278028 ) ) ( not ( = ?auto_278020 ?auto_278029 ) ) ( not ( = ?auto_278021 ?auto_278022 ) ) ( not ( = ?auto_278021 ?auto_278023 ) ) ( not ( = ?auto_278021 ?auto_278024 ) ) ( not ( = ?auto_278021 ?auto_278025 ) ) ( not ( = ?auto_278021 ?auto_278026 ) ) ( not ( = ?auto_278021 ?auto_278027 ) ) ( not ( = ?auto_278021 ?auto_278028 ) ) ( not ( = ?auto_278021 ?auto_278029 ) ) ( not ( = ?auto_278022 ?auto_278023 ) ) ( not ( = ?auto_278022 ?auto_278024 ) ) ( not ( = ?auto_278022 ?auto_278025 ) ) ( not ( = ?auto_278022 ?auto_278026 ) ) ( not ( = ?auto_278022 ?auto_278027 ) ) ( not ( = ?auto_278022 ?auto_278028 ) ) ( not ( = ?auto_278022 ?auto_278029 ) ) ( not ( = ?auto_278023 ?auto_278024 ) ) ( not ( = ?auto_278023 ?auto_278025 ) ) ( not ( = ?auto_278023 ?auto_278026 ) ) ( not ( = ?auto_278023 ?auto_278027 ) ) ( not ( = ?auto_278023 ?auto_278028 ) ) ( not ( = ?auto_278023 ?auto_278029 ) ) ( not ( = ?auto_278024 ?auto_278025 ) ) ( not ( = ?auto_278024 ?auto_278026 ) ) ( not ( = ?auto_278024 ?auto_278027 ) ) ( not ( = ?auto_278024 ?auto_278028 ) ) ( not ( = ?auto_278024 ?auto_278029 ) ) ( not ( = ?auto_278025 ?auto_278026 ) ) ( not ( = ?auto_278025 ?auto_278027 ) ) ( not ( = ?auto_278025 ?auto_278028 ) ) ( not ( = ?auto_278025 ?auto_278029 ) ) ( not ( = ?auto_278026 ?auto_278027 ) ) ( not ( = ?auto_278026 ?auto_278028 ) ) ( not ( = ?auto_278026 ?auto_278029 ) ) ( not ( = ?auto_278027 ?auto_278028 ) ) ( not ( = ?auto_278027 ?auto_278029 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_278028 ?auto_278029 )
      ( MAKE-9CRATE-VERIFY ?auto_278020 ?auto_278021 ?auto_278022 ?auto_278023 ?auto_278024 ?auto_278025 ?auto_278026 ?auto_278027 ?auto_278028 ?auto_278029 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278100 - SURFACE
      ?auto_278101 - SURFACE
      ?auto_278102 - SURFACE
      ?auto_278103 - SURFACE
      ?auto_278104 - SURFACE
      ?auto_278105 - SURFACE
      ?auto_278106 - SURFACE
      ?auto_278107 - SURFACE
      ?auto_278108 - SURFACE
      ?auto_278109 - SURFACE
    )
    :vars
    (
      ?auto_278112 - HOIST
      ?auto_278111 - PLACE
      ?auto_278110 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_278112 ?auto_278111 ) ( SURFACE-AT ?auto_278108 ?auto_278111 ) ( CLEAR ?auto_278108 ) ( IS-CRATE ?auto_278109 ) ( not ( = ?auto_278108 ?auto_278109 ) ) ( TRUCK-AT ?auto_278110 ?auto_278111 ) ( AVAILABLE ?auto_278112 ) ( IN ?auto_278109 ?auto_278110 ) ( ON ?auto_278108 ?auto_278107 ) ( not ( = ?auto_278107 ?auto_278108 ) ) ( not ( = ?auto_278107 ?auto_278109 ) ) ( ON ?auto_278101 ?auto_278100 ) ( ON ?auto_278102 ?auto_278101 ) ( ON ?auto_278103 ?auto_278102 ) ( ON ?auto_278104 ?auto_278103 ) ( ON ?auto_278105 ?auto_278104 ) ( ON ?auto_278106 ?auto_278105 ) ( ON ?auto_278107 ?auto_278106 ) ( not ( = ?auto_278100 ?auto_278101 ) ) ( not ( = ?auto_278100 ?auto_278102 ) ) ( not ( = ?auto_278100 ?auto_278103 ) ) ( not ( = ?auto_278100 ?auto_278104 ) ) ( not ( = ?auto_278100 ?auto_278105 ) ) ( not ( = ?auto_278100 ?auto_278106 ) ) ( not ( = ?auto_278100 ?auto_278107 ) ) ( not ( = ?auto_278100 ?auto_278108 ) ) ( not ( = ?auto_278100 ?auto_278109 ) ) ( not ( = ?auto_278101 ?auto_278102 ) ) ( not ( = ?auto_278101 ?auto_278103 ) ) ( not ( = ?auto_278101 ?auto_278104 ) ) ( not ( = ?auto_278101 ?auto_278105 ) ) ( not ( = ?auto_278101 ?auto_278106 ) ) ( not ( = ?auto_278101 ?auto_278107 ) ) ( not ( = ?auto_278101 ?auto_278108 ) ) ( not ( = ?auto_278101 ?auto_278109 ) ) ( not ( = ?auto_278102 ?auto_278103 ) ) ( not ( = ?auto_278102 ?auto_278104 ) ) ( not ( = ?auto_278102 ?auto_278105 ) ) ( not ( = ?auto_278102 ?auto_278106 ) ) ( not ( = ?auto_278102 ?auto_278107 ) ) ( not ( = ?auto_278102 ?auto_278108 ) ) ( not ( = ?auto_278102 ?auto_278109 ) ) ( not ( = ?auto_278103 ?auto_278104 ) ) ( not ( = ?auto_278103 ?auto_278105 ) ) ( not ( = ?auto_278103 ?auto_278106 ) ) ( not ( = ?auto_278103 ?auto_278107 ) ) ( not ( = ?auto_278103 ?auto_278108 ) ) ( not ( = ?auto_278103 ?auto_278109 ) ) ( not ( = ?auto_278104 ?auto_278105 ) ) ( not ( = ?auto_278104 ?auto_278106 ) ) ( not ( = ?auto_278104 ?auto_278107 ) ) ( not ( = ?auto_278104 ?auto_278108 ) ) ( not ( = ?auto_278104 ?auto_278109 ) ) ( not ( = ?auto_278105 ?auto_278106 ) ) ( not ( = ?auto_278105 ?auto_278107 ) ) ( not ( = ?auto_278105 ?auto_278108 ) ) ( not ( = ?auto_278105 ?auto_278109 ) ) ( not ( = ?auto_278106 ?auto_278107 ) ) ( not ( = ?auto_278106 ?auto_278108 ) ) ( not ( = ?auto_278106 ?auto_278109 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_278107 ?auto_278108 ?auto_278109 )
      ( MAKE-9CRATE-VERIFY ?auto_278100 ?auto_278101 ?auto_278102 ?auto_278103 ?auto_278104 ?auto_278105 ?auto_278106 ?auto_278107 ?auto_278108 ?auto_278109 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278190 - SURFACE
      ?auto_278191 - SURFACE
      ?auto_278192 - SURFACE
      ?auto_278193 - SURFACE
      ?auto_278194 - SURFACE
      ?auto_278195 - SURFACE
      ?auto_278196 - SURFACE
      ?auto_278197 - SURFACE
      ?auto_278198 - SURFACE
      ?auto_278199 - SURFACE
    )
    :vars
    (
      ?auto_278201 - HOIST
      ?auto_278202 - PLACE
      ?auto_278200 - TRUCK
      ?auto_278203 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_278201 ?auto_278202 ) ( SURFACE-AT ?auto_278198 ?auto_278202 ) ( CLEAR ?auto_278198 ) ( IS-CRATE ?auto_278199 ) ( not ( = ?auto_278198 ?auto_278199 ) ) ( AVAILABLE ?auto_278201 ) ( IN ?auto_278199 ?auto_278200 ) ( ON ?auto_278198 ?auto_278197 ) ( not ( = ?auto_278197 ?auto_278198 ) ) ( not ( = ?auto_278197 ?auto_278199 ) ) ( TRUCK-AT ?auto_278200 ?auto_278203 ) ( not ( = ?auto_278203 ?auto_278202 ) ) ( ON ?auto_278191 ?auto_278190 ) ( ON ?auto_278192 ?auto_278191 ) ( ON ?auto_278193 ?auto_278192 ) ( ON ?auto_278194 ?auto_278193 ) ( ON ?auto_278195 ?auto_278194 ) ( ON ?auto_278196 ?auto_278195 ) ( ON ?auto_278197 ?auto_278196 ) ( not ( = ?auto_278190 ?auto_278191 ) ) ( not ( = ?auto_278190 ?auto_278192 ) ) ( not ( = ?auto_278190 ?auto_278193 ) ) ( not ( = ?auto_278190 ?auto_278194 ) ) ( not ( = ?auto_278190 ?auto_278195 ) ) ( not ( = ?auto_278190 ?auto_278196 ) ) ( not ( = ?auto_278190 ?auto_278197 ) ) ( not ( = ?auto_278190 ?auto_278198 ) ) ( not ( = ?auto_278190 ?auto_278199 ) ) ( not ( = ?auto_278191 ?auto_278192 ) ) ( not ( = ?auto_278191 ?auto_278193 ) ) ( not ( = ?auto_278191 ?auto_278194 ) ) ( not ( = ?auto_278191 ?auto_278195 ) ) ( not ( = ?auto_278191 ?auto_278196 ) ) ( not ( = ?auto_278191 ?auto_278197 ) ) ( not ( = ?auto_278191 ?auto_278198 ) ) ( not ( = ?auto_278191 ?auto_278199 ) ) ( not ( = ?auto_278192 ?auto_278193 ) ) ( not ( = ?auto_278192 ?auto_278194 ) ) ( not ( = ?auto_278192 ?auto_278195 ) ) ( not ( = ?auto_278192 ?auto_278196 ) ) ( not ( = ?auto_278192 ?auto_278197 ) ) ( not ( = ?auto_278192 ?auto_278198 ) ) ( not ( = ?auto_278192 ?auto_278199 ) ) ( not ( = ?auto_278193 ?auto_278194 ) ) ( not ( = ?auto_278193 ?auto_278195 ) ) ( not ( = ?auto_278193 ?auto_278196 ) ) ( not ( = ?auto_278193 ?auto_278197 ) ) ( not ( = ?auto_278193 ?auto_278198 ) ) ( not ( = ?auto_278193 ?auto_278199 ) ) ( not ( = ?auto_278194 ?auto_278195 ) ) ( not ( = ?auto_278194 ?auto_278196 ) ) ( not ( = ?auto_278194 ?auto_278197 ) ) ( not ( = ?auto_278194 ?auto_278198 ) ) ( not ( = ?auto_278194 ?auto_278199 ) ) ( not ( = ?auto_278195 ?auto_278196 ) ) ( not ( = ?auto_278195 ?auto_278197 ) ) ( not ( = ?auto_278195 ?auto_278198 ) ) ( not ( = ?auto_278195 ?auto_278199 ) ) ( not ( = ?auto_278196 ?auto_278197 ) ) ( not ( = ?auto_278196 ?auto_278198 ) ) ( not ( = ?auto_278196 ?auto_278199 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_278197 ?auto_278198 ?auto_278199 )
      ( MAKE-9CRATE-VERIFY ?auto_278190 ?auto_278191 ?auto_278192 ?auto_278193 ?auto_278194 ?auto_278195 ?auto_278196 ?auto_278197 ?auto_278198 ?auto_278199 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278289 - SURFACE
      ?auto_278290 - SURFACE
      ?auto_278291 - SURFACE
      ?auto_278292 - SURFACE
      ?auto_278293 - SURFACE
      ?auto_278294 - SURFACE
      ?auto_278295 - SURFACE
      ?auto_278296 - SURFACE
      ?auto_278297 - SURFACE
      ?auto_278298 - SURFACE
    )
    :vars
    (
      ?auto_278299 - HOIST
      ?auto_278302 - PLACE
      ?auto_278301 - TRUCK
      ?auto_278303 - PLACE
      ?auto_278300 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_278299 ?auto_278302 ) ( SURFACE-AT ?auto_278297 ?auto_278302 ) ( CLEAR ?auto_278297 ) ( IS-CRATE ?auto_278298 ) ( not ( = ?auto_278297 ?auto_278298 ) ) ( AVAILABLE ?auto_278299 ) ( ON ?auto_278297 ?auto_278296 ) ( not ( = ?auto_278296 ?auto_278297 ) ) ( not ( = ?auto_278296 ?auto_278298 ) ) ( TRUCK-AT ?auto_278301 ?auto_278303 ) ( not ( = ?auto_278303 ?auto_278302 ) ) ( HOIST-AT ?auto_278300 ?auto_278303 ) ( LIFTING ?auto_278300 ?auto_278298 ) ( not ( = ?auto_278299 ?auto_278300 ) ) ( ON ?auto_278290 ?auto_278289 ) ( ON ?auto_278291 ?auto_278290 ) ( ON ?auto_278292 ?auto_278291 ) ( ON ?auto_278293 ?auto_278292 ) ( ON ?auto_278294 ?auto_278293 ) ( ON ?auto_278295 ?auto_278294 ) ( ON ?auto_278296 ?auto_278295 ) ( not ( = ?auto_278289 ?auto_278290 ) ) ( not ( = ?auto_278289 ?auto_278291 ) ) ( not ( = ?auto_278289 ?auto_278292 ) ) ( not ( = ?auto_278289 ?auto_278293 ) ) ( not ( = ?auto_278289 ?auto_278294 ) ) ( not ( = ?auto_278289 ?auto_278295 ) ) ( not ( = ?auto_278289 ?auto_278296 ) ) ( not ( = ?auto_278289 ?auto_278297 ) ) ( not ( = ?auto_278289 ?auto_278298 ) ) ( not ( = ?auto_278290 ?auto_278291 ) ) ( not ( = ?auto_278290 ?auto_278292 ) ) ( not ( = ?auto_278290 ?auto_278293 ) ) ( not ( = ?auto_278290 ?auto_278294 ) ) ( not ( = ?auto_278290 ?auto_278295 ) ) ( not ( = ?auto_278290 ?auto_278296 ) ) ( not ( = ?auto_278290 ?auto_278297 ) ) ( not ( = ?auto_278290 ?auto_278298 ) ) ( not ( = ?auto_278291 ?auto_278292 ) ) ( not ( = ?auto_278291 ?auto_278293 ) ) ( not ( = ?auto_278291 ?auto_278294 ) ) ( not ( = ?auto_278291 ?auto_278295 ) ) ( not ( = ?auto_278291 ?auto_278296 ) ) ( not ( = ?auto_278291 ?auto_278297 ) ) ( not ( = ?auto_278291 ?auto_278298 ) ) ( not ( = ?auto_278292 ?auto_278293 ) ) ( not ( = ?auto_278292 ?auto_278294 ) ) ( not ( = ?auto_278292 ?auto_278295 ) ) ( not ( = ?auto_278292 ?auto_278296 ) ) ( not ( = ?auto_278292 ?auto_278297 ) ) ( not ( = ?auto_278292 ?auto_278298 ) ) ( not ( = ?auto_278293 ?auto_278294 ) ) ( not ( = ?auto_278293 ?auto_278295 ) ) ( not ( = ?auto_278293 ?auto_278296 ) ) ( not ( = ?auto_278293 ?auto_278297 ) ) ( not ( = ?auto_278293 ?auto_278298 ) ) ( not ( = ?auto_278294 ?auto_278295 ) ) ( not ( = ?auto_278294 ?auto_278296 ) ) ( not ( = ?auto_278294 ?auto_278297 ) ) ( not ( = ?auto_278294 ?auto_278298 ) ) ( not ( = ?auto_278295 ?auto_278296 ) ) ( not ( = ?auto_278295 ?auto_278297 ) ) ( not ( = ?auto_278295 ?auto_278298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_278296 ?auto_278297 ?auto_278298 )
      ( MAKE-9CRATE-VERIFY ?auto_278289 ?auto_278290 ?auto_278291 ?auto_278292 ?auto_278293 ?auto_278294 ?auto_278295 ?auto_278296 ?auto_278297 ?auto_278298 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278397 - SURFACE
      ?auto_278398 - SURFACE
      ?auto_278399 - SURFACE
      ?auto_278400 - SURFACE
      ?auto_278401 - SURFACE
      ?auto_278402 - SURFACE
      ?auto_278403 - SURFACE
      ?auto_278404 - SURFACE
      ?auto_278405 - SURFACE
      ?auto_278406 - SURFACE
    )
    :vars
    (
      ?auto_278412 - HOIST
      ?auto_278410 - PLACE
      ?auto_278408 - TRUCK
      ?auto_278409 - PLACE
      ?auto_278407 - HOIST
      ?auto_278411 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_278412 ?auto_278410 ) ( SURFACE-AT ?auto_278405 ?auto_278410 ) ( CLEAR ?auto_278405 ) ( IS-CRATE ?auto_278406 ) ( not ( = ?auto_278405 ?auto_278406 ) ) ( AVAILABLE ?auto_278412 ) ( ON ?auto_278405 ?auto_278404 ) ( not ( = ?auto_278404 ?auto_278405 ) ) ( not ( = ?auto_278404 ?auto_278406 ) ) ( TRUCK-AT ?auto_278408 ?auto_278409 ) ( not ( = ?auto_278409 ?auto_278410 ) ) ( HOIST-AT ?auto_278407 ?auto_278409 ) ( not ( = ?auto_278412 ?auto_278407 ) ) ( AVAILABLE ?auto_278407 ) ( SURFACE-AT ?auto_278406 ?auto_278409 ) ( ON ?auto_278406 ?auto_278411 ) ( CLEAR ?auto_278406 ) ( not ( = ?auto_278405 ?auto_278411 ) ) ( not ( = ?auto_278406 ?auto_278411 ) ) ( not ( = ?auto_278404 ?auto_278411 ) ) ( ON ?auto_278398 ?auto_278397 ) ( ON ?auto_278399 ?auto_278398 ) ( ON ?auto_278400 ?auto_278399 ) ( ON ?auto_278401 ?auto_278400 ) ( ON ?auto_278402 ?auto_278401 ) ( ON ?auto_278403 ?auto_278402 ) ( ON ?auto_278404 ?auto_278403 ) ( not ( = ?auto_278397 ?auto_278398 ) ) ( not ( = ?auto_278397 ?auto_278399 ) ) ( not ( = ?auto_278397 ?auto_278400 ) ) ( not ( = ?auto_278397 ?auto_278401 ) ) ( not ( = ?auto_278397 ?auto_278402 ) ) ( not ( = ?auto_278397 ?auto_278403 ) ) ( not ( = ?auto_278397 ?auto_278404 ) ) ( not ( = ?auto_278397 ?auto_278405 ) ) ( not ( = ?auto_278397 ?auto_278406 ) ) ( not ( = ?auto_278397 ?auto_278411 ) ) ( not ( = ?auto_278398 ?auto_278399 ) ) ( not ( = ?auto_278398 ?auto_278400 ) ) ( not ( = ?auto_278398 ?auto_278401 ) ) ( not ( = ?auto_278398 ?auto_278402 ) ) ( not ( = ?auto_278398 ?auto_278403 ) ) ( not ( = ?auto_278398 ?auto_278404 ) ) ( not ( = ?auto_278398 ?auto_278405 ) ) ( not ( = ?auto_278398 ?auto_278406 ) ) ( not ( = ?auto_278398 ?auto_278411 ) ) ( not ( = ?auto_278399 ?auto_278400 ) ) ( not ( = ?auto_278399 ?auto_278401 ) ) ( not ( = ?auto_278399 ?auto_278402 ) ) ( not ( = ?auto_278399 ?auto_278403 ) ) ( not ( = ?auto_278399 ?auto_278404 ) ) ( not ( = ?auto_278399 ?auto_278405 ) ) ( not ( = ?auto_278399 ?auto_278406 ) ) ( not ( = ?auto_278399 ?auto_278411 ) ) ( not ( = ?auto_278400 ?auto_278401 ) ) ( not ( = ?auto_278400 ?auto_278402 ) ) ( not ( = ?auto_278400 ?auto_278403 ) ) ( not ( = ?auto_278400 ?auto_278404 ) ) ( not ( = ?auto_278400 ?auto_278405 ) ) ( not ( = ?auto_278400 ?auto_278406 ) ) ( not ( = ?auto_278400 ?auto_278411 ) ) ( not ( = ?auto_278401 ?auto_278402 ) ) ( not ( = ?auto_278401 ?auto_278403 ) ) ( not ( = ?auto_278401 ?auto_278404 ) ) ( not ( = ?auto_278401 ?auto_278405 ) ) ( not ( = ?auto_278401 ?auto_278406 ) ) ( not ( = ?auto_278401 ?auto_278411 ) ) ( not ( = ?auto_278402 ?auto_278403 ) ) ( not ( = ?auto_278402 ?auto_278404 ) ) ( not ( = ?auto_278402 ?auto_278405 ) ) ( not ( = ?auto_278402 ?auto_278406 ) ) ( not ( = ?auto_278402 ?auto_278411 ) ) ( not ( = ?auto_278403 ?auto_278404 ) ) ( not ( = ?auto_278403 ?auto_278405 ) ) ( not ( = ?auto_278403 ?auto_278406 ) ) ( not ( = ?auto_278403 ?auto_278411 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_278404 ?auto_278405 ?auto_278406 )
      ( MAKE-9CRATE-VERIFY ?auto_278397 ?auto_278398 ?auto_278399 ?auto_278400 ?auto_278401 ?auto_278402 ?auto_278403 ?auto_278404 ?auto_278405 ?auto_278406 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278506 - SURFACE
      ?auto_278507 - SURFACE
      ?auto_278508 - SURFACE
      ?auto_278509 - SURFACE
      ?auto_278510 - SURFACE
      ?auto_278511 - SURFACE
      ?auto_278512 - SURFACE
      ?auto_278513 - SURFACE
      ?auto_278514 - SURFACE
      ?auto_278515 - SURFACE
    )
    :vars
    (
      ?auto_278516 - HOIST
      ?auto_278518 - PLACE
      ?auto_278517 - PLACE
      ?auto_278520 - HOIST
      ?auto_278519 - SURFACE
      ?auto_278521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_278516 ?auto_278518 ) ( SURFACE-AT ?auto_278514 ?auto_278518 ) ( CLEAR ?auto_278514 ) ( IS-CRATE ?auto_278515 ) ( not ( = ?auto_278514 ?auto_278515 ) ) ( AVAILABLE ?auto_278516 ) ( ON ?auto_278514 ?auto_278513 ) ( not ( = ?auto_278513 ?auto_278514 ) ) ( not ( = ?auto_278513 ?auto_278515 ) ) ( not ( = ?auto_278517 ?auto_278518 ) ) ( HOIST-AT ?auto_278520 ?auto_278517 ) ( not ( = ?auto_278516 ?auto_278520 ) ) ( AVAILABLE ?auto_278520 ) ( SURFACE-AT ?auto_278515 ?auto_278517 ) ( ON ?auto_278515 ?auto_278519 ) ( CLEAR ?auto_278515 ) ( not ( = ?auto_278514 ?auto_278519 ) ) ( not ( = ?auto_278515 ?auto_278519 ) ) ( not ( = ?auto_278513 ?auto_278519 ) ) ( TRUCK-AT ?auto_278521 ?auto_278518 ) ( ON ?auto_278507 ?auto_278506 ) ( ON ?auto_278508 ?auto_278507 ) ( ON ?auto_278509 ?auto_278508 ) ( ON ?auto_278510 ?auto_278509 ) ( ON ?auto_278511 ?auto_278510 ) ( ON ?auto_278512 ?auto_278511 ) ( ON ?auto_278513 ?auto_278512 ) ( not ( = ?auto_278506 ?auto_278507 ) ) ( not ( = ?auto_278506 ?auto_278508 ) ) ( not ( = ?auto_278506 ?auto_278509 ) ) ( not ( = ?auto_278506 ?auto_278510 ) ) ( not ( = ?auto_278506 ?auto_278511 ) ) ( not ( = ?auto_278506 ?auto_278512 ) ) ( not ( = ?auto_278506 ?auto_278513 ) ) ( not ( = ?auto_278506 ?auto_278514 ) ) ( not ( = ?auto_278506 ?auto_278515 ) ) ( not ( = ?auto_278506 ?auto_278519 ) ) ( not ( = ?auto_278507 ?auto_278508 ) ) ( not ( = ?auto_278507 ?auto_278509 ) ) ( not ( = ?auto_278507 ?auto_278510 ) ) ( not ( = ?auto_278507 ?auto_278511 ) ) ( not ( = ?auto_278507 ?auto_278512 ) ) ( not ( = ?auto_278507 ?auto_278513 ) ) ( not ( = ?auto_278507 ?auto_278514 ) ) ( not ( = ?auto_278507 ?auto_278515 ) ) ( not ( = ?auto_278507 ?auto_278519 ) ) ( not ( = ?auto_278508 ?auto_278509 ) ) ( not ( = ?auto_278508 ?auto_278510 ) ) ( not ( = ?auto_278508 ?auto_278511 ) ) ( not ( = ?auto_278508 ?auto_278512 ) ) ( not ( = ?auto_278508 ?auto_278513 ) ) ( not ( = ?auto_278508 ?auto_278514 ) ) ( not ( = ?auto_278508 ?auto_278515 ) ) ( not ( = ?auto_278508 ?auto_278519 ) ) ( not ( = ?auto_278509 ?auto_278510 ) ) ( not ( = ?auto_278509 ?auto_278511 ) ) ( not ( = ?auto_278509 ?auto_278512 ) ) ( not ( = ?auto_278509 ?auto_278513 ) ) ( not ( = ?auto_278509 ?auto_278514 ) ) ( not ( = ?auto_278509 ?auto_278515 ) ) ( not ( = ?auto_278509 ?auto_278519 ) ) ( not ( = ?auto_278510 ?auto_278511 ) ) ( not ( = ?auto_278510 ?auto_278512 ) ) ( not ( = ?auto_278510 ?auto_278513 ) ) ( not ( = ?auto_278510 ?auto_278514 ) ) ( not ( = ?auto_278510 ?auto_278515 ) ) ( not ( = ?auto_278510 ?auto_278519 ) ) ( not ( = ?auto_278511 ?auto_278512 ) ) ( not ( = ?auto_278511 ?auto_278513 ) ) ( not ( = ?auto_278511 ?auto_278514 ) ) ( not ( = ?auto_278511 ?auto_278515 ) ) ( not ( = ?auto_278511 ?auto_278519 ) ) ( not ( = ?auto_278512 ?auto_278513 ) ) ( not ( = ?auto_278512 ?auto_278514 ) ) ( not ( = ?auto_278512 ?auto_278515 ) ) ( not ( = ?auto_278512 ?auto_278519 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_278513 ?auto_278514 ?auto_278515 )
      ( MAKE-9CRATE-VERIFY ?auto_278506 ?auto_278507 ?auto_278508 ?auto_278509 ?auto_278510 ?auto_278511 ?auto_278512 ?auto_278513 ?auto_278514 ?auto_278515 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278615 - SURFACE
      ?auto_278616 - SURFACE
      ?auto_278617 - SURFACE
      ?auto_278618 - SURFACE
      ?auto_278619 - SURFACE
      ?auto_278620 - SURFACE
      ?auto_278621 - SURFACE
      ?auto_278622 - SURFACE
      ?auto_278623 - SURFACE
      ?auto_278624 - SURFACE
    )
    :vars
    (
      ?auto_278628 - HOIST
      ?auto_278630 - PLACE
      ?auto_278625 - PLACE
      ?auto_278627 - HOIST
      ?auto_278629 - SURFACE
      ?auto_278626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_278628 ?auto_278630 ) ( IS-CRATE ?auto_278624 ) ( not ( = ?auto_278623 ?auto_278624 ) ) ( not ( = ?auto_278622 ?auto_278623 ) ) ( not ( = ?auto_278622 ?auto_278624 ) ) ( not ( = ?auto_278625 ?auto_278630 ) ) ( HOIST-AT ?auto_278627 ?auto_278625 ) ( not ( = ?auto_278628 ?auto_278627 ) ) ( AVAILABLE ?auto_278627 ) ( SURFACE-AT ?auto_278624 ?auto_278625 ) ( ON ?auto_278624 ?auto_278629 ) ( CLEAR ?auto_278624 ) ( not ( = ?auto_278623 ?auto_278629 ) ) ( not ( = ?auto_278624 ?auto_278629 ) ) ( not ( = ?auto_278622 ?auto_278629 ) ) ( TRUCK-AT ?auto_278626 ?auto_278630 ) ( SURFACE-AT ?auto_278622 ?auto_278630 ) ( CLEAR ?auto_278622 ) ( LIFTING ?auto_278628 ?auto_278623 ) ( IS-CRATE ?auto_278623 ) ( ON ?auto_278616 ?auto_278615 ) ( ON ?auto_278617 ?auto_278616 ) ( ON ?auto_278618 ?auto_278617 ) ( ON ?auto_278619 ?auto_278618 ) ( ON ?auto_278620 ?auto_278619 ) ( ON ?auto_278621 ?auto_278620 ) ( ON ?auto_278622 ?auto_278621 ) ( not ( = ?auto_278615 ?auto_278616 ) ) ( not ( = ?auto_278615 ?auto_278617 ) ) ( not ( = ?auto_278615 ?auto_278618 ) ) ( not ( = ?auto_278615 ?auto_278619 ) ) ( not ( = ?auto_278615 ?auto_278620 ) ) ( not ( = ?auto_278615 ?auto_278621 ) ) ( not ( = ?auto_278615 ?auto_278622 ) ) ( not ( = ?auto_278615 ?auto_278623 ) ) ( not ( = ?auto_278615 ?auto_278624 ) ) ( not ( = ?auto_278615 ?auto_278629 ) ) ( not ( = ?auto_278616 ?auto_278617 ) ) ( not ( = ?auto_278616 ?auto_278618 ) ) ( not ( = ?auto_278616 ?auto_278619 ) ) ( not ( = ?auto_278616 ?auto_278620 ) ) ( not ( = ?auto_278616 ?auto_278621 ) ) ( not ( = ?auto_278616 ?auto_278622 ) ) ( not ( = ?auto_278616 ?auto_278623 ) ) ( not ( = ?auto_278616 ?auto_278624 ) ) ( not ( = ?auto_278616 ?auto_278629 ) ) ( not ( = ?auto_278617 ?auto_278618 ) ) ( not ( = ?auto_278617 ?auto_278619 ) ) ( not ( = ?auto_278617 ?auto_278620 ) ) ( not ( = ?auto_278617 ?auto_278621 ) ) ( not ( = ?auto_278617 ?auto_278622 ) ) ( not ( = ?auto_278617 ?auto_278623 ) ) ( not ( = ?auto_278617 ?auto_278624 ) ) ( not ( = ?auto_278617 ?auto_278629 ) ) ( not ( = ?auto_278618 ?auto_278619 ) ) ( not ( = ?auto_278618 ?auto_278620 ) ) ( not ( = ?auto_278618 ?auto_278621 ) ) ( not ( = ?auto_278618 ?auto_278622 ) ) ( not ( = ?auto_278618 ?auto_278623 ) ) ( not ( = ?auto_278618 ?auto_278624 ) ) ( not ( = ?auto_278618 ?auto_278629 ) ) ( not ( = ?auto_278619 ?auto_278620 ) ) ( not ( = ?auto_278619 ?auto_278621 ) ) ( not ( = ?auto_278619 ?auto_278622 ) ) ( not ( = ?auto_278619 ?auto_278623 ) ) ( not ( = ?auto_278619 ?auto_278624 ) ) ( not ( = ?auto_278619 ?auto_278629 ) ) ( not ( = ?auto_278620 ?auto_278621 ) ) ( not ( = ?auto_278620 ?auto_278622 ) ) ( not ( = ?auto_278620 ?auto_278623 ) ) ( not ( = ?auto_278620 ?auto_278624 ) ) ( not ( = ?auto_278620 ?auto_278629 ) ) ( not ( = ?auto_278621 ?auto_278622 ) ) ( not ( = ?auto_278621 ?auto_278623 ) ) ( not ( = ?auto_278621 ?auto_278624 ) ) ( not ( = ?auto_278621 ?auto_278629 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_278622 ?auto_278623 ?auto_278624 )
      ( MAKE-9CRATE-VERIFY ?auto_278615 ?auto_278616 ?auto_278617 ?auto_278618 ?auto_278619 ?auto_278620 ?auto_278621 ?auto_278622 ?auto_278623 ?auto_278624 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_278724 - SURFACE
      ?auto_278725 - SURFACE
      ?auto_278726 - SURFACE
      ?auto_278727 - SURFACE
      ?auto_278728 - SURFACE
      ?auto_278729 - SURFACE
      ?auto_278730 - SURFACE
      ?auto_278731 - SURFACE
      ?auto_278732 - SURFACE
      ?auto_278733 - SURFACE
    )
    :vars
    (
      ?auto_278736 - HOIST
      ?auto_278734 - PLACE
      ?auto_278738 - PLACE
      ?auto_278735 - HOIST
      ?auto_278737 - SURFACE
      ?auto_278739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_278736 ?auto_278734 ) ( IS-CRATE ?auto_278733 ) ( not ( = ?auto_278732 ?auto_278733 ) ) ( not ( = ?auto_278731 ?auto_278732 ) ) ( not ( = ?auto_278731 ?auto_278733 ) ) ( not ( = ?auto_278738 ?auto_278734 ) ) ( HOIST-AT ?auto_278735 ?auto_278738 ) ( not ( = ?auto_278736 ?auto_278735 ) ) ( AVAILABLE ?auto_278735 ) ( SURFACE-AT ?auto_278733 ?auto_278738 ) ( ON ?auto_278733 ?auto_278737 ) ( CLEAR ?auto_278733 ) ( not ( = ?auto_278732 ?auto_278737 ) ) ( not ( = ?auto_278733 ?auto_278737 ) ) ( not ( = ?auto_278731 ?auto_278737 ) ) ( TRUCK-AT ?auto_278739 ?auto_278734 ) ( SURFACE-AT ?auto_278731 ?auto_278734 ) ( CLEAR ?auto_278731 ) ( IS-CRATE ?auto_278732 ) ( AVAILABLE ?auto_278736 ) ( IN ?auto_278732 ?auto_278739 ) ( ON ?auto_278725 ?auto_278724 ) ( ON ?auto_278726 ?auto_278725 ) ( ON ?auto_278727 ?auto_278726 ) ( ON ?auto_278728 ?auto_278727 ) ( ON ?auto_278729 ?auto_278728 ) ( ON ?auto_278730 ?auto_278729 ) ( ON ?auto_278731 ?auto_278730 ) ( not ( = ?auto_278724 ?auto_278725 ) ) ( not ( = ?auto_278724 ?auto_278726 ) ) ( not ( = ?auto_278724 ?auto_278727 ) ) ( not ( = ?auto_278724 ?auto_278728 ) ) ( not ( = ?auto_278724 ?auto_278729 ) ) ( not ( = ?auto_278724 ?auto_278730 ) ) ( not ( = ?auto_278724 ?auto_278731 ) ) ( not ( = ?auto_278724 ?auto_278732 ) ) ( not ( = ?auto_278724 ?auto_278733 ) ) ( not ( = ?auto_278724 ?auto_278737 ) ) ( not ( = ?auto_278725 ?auto_278726 ) ) ( not ( = ?auto_278725 ?auto_278727 ) ) ( not ( = ?auto_278725 ?auto_278728 ) ) ( not ( = ?auto_278725 ?auto_278729 ) ) ( not ( = ?auto_278725 ?auto_278730 ) ) ( not ( = ?auto_278725 ?auto_278731 ) ) ( not ( = ?auto_278725 ?auto_278732 ) ) ( not ( = ?auto_278725 ?auto_278733 ) ) ( not ( = ?auto_278725 ?auto_278737 ) ) ( not ( = ?auto_278726 ?auto_278727 ) ) ( not ( = ?auto_278726 ?auto_278728 ) ) ( not ( = ?auto_278726 ?auto_278729 ) ) ( not ( = ?auto_278726 ?auto_278730 ) ) ( not ( = ?auto_278726 ?auto_278731 ) ) ( not ( = ?auto_278726 ?auto_278732 ) ) ( not ( = ?auto_278726 ?auto_278733 ) ) ( not ( = ?auto_278726 ?auto_278737 ) ) ( not ( = ?auto_278727 ?auto_278728 ) ) ( not ( = ?auto_278727 ?auto_278729 ) ) ( not ( = ?auto_278727 ?auto_278730 ) ) ( not ( = ?auto_278727 ?auto_278731 ) ) ( not ( = ?auto_278727 ?auto_278732 ) ) ( not ( = ?auto_278727 ?auto_278733 ) ) ( not ( = ?auto_278727 ?auto_278737 ) ) ( not ( = ?auto_278728 ?auto_278729 ) ) ( not ( = ?auto_278728 ?auto_278730 ) ) ( not ( = ?auto_278728 ?auto_278731 ) ) ( not ( = ?auto_278728 ?auto_278732 ) ) ( not ( = ?auto_278728 ?auto_278733 ) ) ( not ( = ?auto_278728 ?auto_278737 ) ) ( not ( = ?auto_278729 ?auto_278730 ) ) ( not ( = ?auto_278729 ?auto_278731 ) ) ( not ( = ?auto_278729 ?auto_278732 ) ) ( not ( = ?auto_278729 ?auto_278733 ) ) ( not ( = ?auto_278729 ?auto_278737 ) ) ( not ( = ?auto_278730 ?auto_278731 ) ) ( not ( = ?auto_278730 ?auto_278732 ) ) ( not ( = ?auto_278730 ?auto_278733 ) ) ( not ( = ?auto_278730 ?auto_278737 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_278731 ?auto_278732 ?auto_278733 )
      ( MAKE-9CRATE-VERIFY ?auto_278724 ?auto_278725 ?auto_278726 ?auto_278727 ?auto_278728 ?auto_278729 ?auto_278730 ?auto_278731 ?auto_278732 ?auto_278733 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_284289 - SURFACE
      ?auto_284290 - SURFACE
      ?auto_284291 - SURFACE
      ?auto_284292 - SURFACE
      ?auto_284293 - SURFACE
      ?auto_284294 - SURFACE
      ?auto_284295 - SURFACE
      ?auto_284296 - SURFACE
      ?auto_284297 - SURFACE
      ?auto_284298 - SURFACE
      ?auto_284299 - SURFACE
    )
    :vars
    (
      ?auto_284301 - HOIST
      ?auto_284300 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_284301 ?auto_284300 ) ( SURFACE-AT ?auto_284298 ?auto_284300 ) ( CLEAR ?auto_284298 ) ( LIFTING ?auto_284301 ?auto_284299 ) ( IS-CRATE ?auto_284299 ) ( not ( = ?auto_284298 ?auto_284299 ) ) ( ON ?auto_284290 ?auto_284289 ) ( ON ?auto_284291 ?auto_284290 ) ( ON ?auto_284292 ?auto_284291 ) ( ON ?auto_284293 ?auto_284292 ) ( ON ?auto_284294 ?auto_284293 ) ( ON ?auto_284295 ?auto_284294 ) ( ON ?auto_284296 ?auto_284295 ) ( ON ?auto_284297 ?auto_284296 ) ( ON ?auto_284298 ?auto_284297 ) ( not ( = ?auto_284289 ?auto_284290 ) ) ( not ( = ?auto_284289 ?auto_284291 ) ) ( not ( = ?auto_284289 ?auto_284292 ) ) ( not ( = ?auto_284289 ?auto_284293 ) ) ( not ( = ?auto_284289 ?auto_284294 ) ) ( not ( = ?auto_284289 ?auto_284295 ) ) ( not ( = ?auto_284289 ?auto_284296 ) ) ( not ( = ?auto_284289 ?auto_284297 ) ) ( not ( = ?auto_284289 ?auto_284298 ) ) ( not ( = ?auto_284289 ?auto_284299 ) ) ( not ( = ?auto_284290 ?auto_284291 ) ) ( not ( = ?auto_284290 ?auto_284292 ) ) ( not ( = ?auto_284290 ?auto_284293 ) ) ( not ( = ?auto_284290 ?auto_284294 ) ) ( not ( = ?auto_284290 ?auto_284295 ) ) ( not ( = ?auto_284290 ?auto_284296 ) ) ( not ( = ?auto_284290 ?auto_284297 ) ) ( not ( = ?auto_284290 ?auto_284298 ) ) ( not ( = ?auto_284290 ?auto_284299 ) ) ( not ( = ?auto_284291 ?auto_284292 ) ) ( not ( = ?auto_284291 ?auto_284293 ) ) ( not ( = ?auto_284291 ?auto_284294 ) ) ( not ( = ?auto_284291 ?auto_284295 ) ) ( not ( = ?auto_284291 ?auto_284296 ) ) ( not ( = ?auto_284291 ?auto_284297 ) ) ( not ( = ?auto_284291 ?auto_284298 ) ) ( not ( = ?auto_284291 ?auto_284299 ) ) ( not ( = ?auto_284292 ?auto_284293 ) ) ( not ( = ?auto_284292 ?auto_284294 ) ) ( not ( = ?auto_284292 ?auto_284295 ) ) ( not ( = ?auto_284292 ?auto_284296 ) ) ( not ( = ?auto_284292 ?auto_284297 ) ) ( not ( = ?auto_284292 ?auto_284298 ) ) ( not ( = ?auto_284292 ?auto_284299 ) ) ( not ( = ?auto_284293 ?auto_284294 ) ) ( not ( = ?auto_284293 ?auto_284295 ) ) ( not ( = ?auto_284293 ?auto_284296 ) ) ( not ( = ?auto_284293 ?auto_284297 ) ) ( not ( = ?auto_284293 ?auto_284298 ) ) ( not ( = ?auto_284293 ?auto_284299 ) ) ( not ( = ?auto_284294 ?auto_284295 ) ) ( not ( = ?auto_284294 ?auto_284296 ) ) ( not ( = ?auto_284294 ?auto_284297 ) ) ( not ( = ?auto_284294 ?auto_284298 ) ) ( not ( = ?auto_284294 ?auto_284299 ) ) ( not ( = ?auto_284295 ?auto_284296 ) ) ( not ( = ?auto_284295 ?auto_284297 ) ) ( not ( = ?auto_284295 ?auto_284298 ) ) ( not ( = ?auto_284295 ?auto_284299 ) ) ( not ( = ?auto_284296 ?auto_284297 ) ) ( not ( = ?auto_284296 ?auto_284298 ) ) ( not ( = ?auto_284296 ?auto_284299 ) ) ( not ( = ?auto_284297 ?auto_284298 ) ) ( not ( = ?auto_284297 ?auto_284299 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_284298 ?auto_284299 )
      ( MAKE-10CRATE-VERIFY ?auto_284289 ?auto_284290 ?auto_284291 ?auto_284292 ?auto_284293 ?auto_284294 ?auto_284295 ?auto_284296 ?auto_284297 ?auto_284298 ?auto_284299 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_284383 - SURFACE
      ?auto_284384 - SURFACE
      ?auto_284385 - SURFACE
      ?auto_284386 - SURFACE
      ?auto_284387 - SURFACE
      ?auto_284388 - SURFACE
      ?auto_284389 - SURFACE
      ?auto_284390 - SURFACE
      ?auto_284391 - SURFACE
      ?auto_284392 - SURFACE
      ?auto_284393 - SURFACE
    )
    :vars
    (
      ?auto_284394 - HOIST
      ?auto_284396 - PLACE
      ?auto_284395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_284394 ?auto_284396 ) ( SURFACE-AT ?auto_284392 ?auto_284396 ) ( CLEAR ?auto_284392 ) ( IS-CRATE ?auto_284393 ) ( not ( = ?auto_284392 ?auto_284393 ) ) ( TRUCK-AT ?auto_284395 ?auto_284396 ) ( AVAILABLE ?auto_284394 ) ( IN ?auto_284393 ?auto_284395 ) ( ON ?auto_284392 ?auto_284391 ) ( not ( = ?auto_284391 ?auto_284392 ) ) ( not ( = ?auto_284391 ?auto_284393 ) ) ( ON ?auto_284384 ?auto_284383 ) ( ON ?auto_284385 ?auto_284384 ) ( ON ?auto_284386 ?auto_284385 ) ( ON ?auto_284387 ?auto_284386 ) ( ON ?auto_284388 ?auto_284387 ) ( ON ?auto_284389 ?auto_284388 ) ( ON ?auto_284390 ?auto_284389 ) ( ON ?auto_284391 ?auto_284390 ) ( not ( = ?auto_284383 ?auto_284384 ) ) ( not ( = ?auto_284383 ?auto_284385 ) ) ( not ( = ?auto_284383 ?auto_284386 ) ) ( not ( = ?auto_284383 ?auto_284387 ) ) ( not ( = ?auto_284383 ?auto_284388 ) ) ( not ( = ?auto_284383 ?auto_284389 ) ) ( not ( = ?auto_284383 ?auto_284390 ) ) ( not ( = ?auto_284383 ?auto_284391 ) ) ( not ( = ?auto_284383 ?auto_284392 ) ) ( not ( = ?auto_284383 ?auto_284393 ) ) ( not ( = ?auto_284384 ?auto_284385 ) ) ( not ( = ?auto_284384 ?auto_284386 ) ) ( not ( = ?auto_284384 ?auto_284387 ) ) ( not ( = ?auto_284384 ?auto_284388 ) ) ( not ( = ?auto_284384 ?auto_284389 ) ) ( not ( = ?auto_284384 ?auto_284390 ) ) ( not ( = ?auto_284384 ?auto_284391 ) ) ( not ( = ?auto_284384 ?auto_284392 ) ) ( not ( = ?auto_284384 ?auto_284393 ) ) ( not ( = ?auto_284385 ?auto_284386 ) ) ( not ( = ?auto_284385 ?auto_284387 ) ) ( not ( = ?auto_284385 ?auto_284388 ) ) ( not ( = ?auto_284385 ?auto_284389 ) ) ( not ( = ?auto_284385 ?auto_284390 ) ) ( not ( = ?auto_284385 ?auto_284391 ) ) ( not ( = ?auto_284385 ?auto_284392 ) ) ( not ( = ?auto_284385 ?auto_284393 ) ) ( not ( = ?auto_284386 ?auto_284387 ) ) ( not ( = ?auto_284386 ?auto_284388 ) ) ( not ( = ?auto_284386 ?auto_284389 ) ) ( not ( = ?auto_284386 ?auto_284390 ) ) ( not ( = ?auto_284386 ?auto_284391 ) ) ( not ( = ?auto_284386 ?auto_284392 ) ) ( not ( = ?auto_284386 ?auto_284393 ) ) ( not ( = ?auto_284387 ?auto_284388 ) ) ( not ( = ?auto_284387 ?auto_284389 ) ) ( not ( = ?auto_284387 ?auto_284390 ) ) ( not ( = ?auto_284387 ?auto_284391 ) ) ( not ( = ?auto_284387 ?auto_284392 ) ) ( not ( = ?auto_284387 ?auto_284393 ) ) ( not ( = ?auto_284388 ?auto_284389 ) ) ( not ( = ?auto_284388 ?auto_284390 ) ) ( not ( = ?auto_284388 ?auto_284391 ) ) ( not ( = ?auto_284388 ?auto_284392 ) ) ( not ( = ?auto_284388 ?auto_284393 ) ) ( not ( = ?auto_284389 ?auto_284390 ) ) ( not ( = ?auto_284389 ?auto_284391 ) ) ( not ( = ?auto_284389 ?auto_284392 ) ) ( not ( = ?auto_284389 ?auto_284393 ) ) ( not ( = ?auto_284390 ?auto_284391 ) ) ( not ( = ?auto_284390 ?auto_284392 ) ) ( not ( = ?auto_284390 ?auto_284393 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_284391 ?auto_284392 ?auto_284393 )
      ( MAKE-10CRATE-VERIFY ?auto_284383 ?auto_284384 ?auto_284385 ?auto_284386 ?auto_284387 ?auto_284388 ?auto_284389 ?auto_284390 ?auto_284391 ?auto_284392 ?auto_284393 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_284488 - SURFACE
      ?auto_284489 - SURFACE
      ?auto_284490 - SURFACE
      ?auto_284491 - SURFACE
      ?auto_284492 - SURFACE
      ?auto_284493 - SURFACE
      ?auto_284494 - SURFACE
      ?auto_284495 - SURFACE
      ?auto_284496 - SURFACE
      ?auto_284497 - SURFACE
      ?auto_284498 - SURFACE
    )
    :vars
    (
      ?auto_284502 - HOIST
      ?auto_284501 - PLACE
      ?auto_284499 - TRUCK
      ?auto_284500 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_284502 ?auto_284501 ) ( SURFACE-AT ?auto_284497 ?auto_284501 ) ( CLEAR ?auto_284497 ) ( IS-CRATE ?auto_284498 ) ( not ( = ?auto_284497 ?auto_284498 ) ) ( AVAILABLE ?auto_284502 ) ( IN ?auto_284498 ?auto_284499 ) ( ON ?auto_284497 ?auto_284496 ) ( not ( = ?auto_284496 ?auto_284497 ) ) ( not ( = ?auto_284496 ?auto_284498 ) ) ( TRUCK-AT ?auto_284499 ?auto_284500 ) ( not ( = ?auto_284500 ?auto_284501 ) ) ( ON ?auto_284489 ?auto_284488 ) ( ON ?auto_284490 ?auto_284489 ) ( ON ?auto_284491 ?auto_284490 ) ( ON ?auto_284492 ?auto_284491 ) ( ON ?auto_284493 ?auto_284492 ) ( ON ?auto_284494 ?auto_284493 ) ( ON ?auto_284495 ?auto_284494 ) ( ON ?auto_284496 ?auto_284495 ) ( not ( = ?auto_284488 ?auto_284489 ) ) ( not ( = ?auto_284488 ?auto_284490 ) ) ( not ( = ?auto_284488 ?auto_284491 ) ) ( not ( = ?auto_284488 ?auto_284492 ) ) ( not ( = ?auto_284488 ?auto_284493 ) ) ( not ( = ?auto_284488 ?auto_284494 ) ) ( not ( = ?auto_284488 ?auto_284495 ) ) ( not ( = ?auto_284488 ?auto_284496 ) ) ( not ( = ?auto_284488 ?auto_284497 ) ) ( not ( = ?auto_284488 ?auto_284498 ) ) ( not ( = ?auto_284489 ?auto_284490 ) ) ( not ( = ?auto_284489 ?auto_284491 ) ) ( not ( = ?auto_284489 ?auto_284492 ) ) ( not ( = ?auto_284489 ?auto_284493 ) ) ( not ( = ?auto_284489 ?auto_284494 ) ) ( not ( = ?auto_284489 ?auto_284495 ) ) ( not ( = ?auto_284489 ?auto_284496 ) ) ( not ( = ?auto_284489 ?auto_284497 ) ) ( not ( = ?auto_284489 ?auto_284498 ) ) ( not ( = ?auto_284490 ?auto_284491 ) ) ( not ( = ?auto_284490 ?auto_284492 ) ) ( not ( = ?auto_284490 ?auto_284493 ) ) ( not ( = ?auto_284490 ?auto_284494 ) ) ( not ( = ?auto_284490 ?auto_284495 ) ) ( not ( = ?auto_284490 ?auto_284496 ) ) ( not ( = ?auto_284490 ?auto_284497 ) ) ( not ( = ?auto_284490 ?auto_284498 ) ) ( not ( = ?auto_284491 ?auto_284492 ) ) ( not ( = ?auto_284491 ?auto_284493 ) ) ( not ( = ?auto_284491 ?auto_284494 ) ) ( not ( = ?auto_284491 ?auto_284495 ) ) ( not ( = ?auto_284491 ?auto_284496 ) ) ( not ( = ?auto_284491 ?auto_284497 ) ) ( not ( = ?auto_284491 ?auto_284498 ) ) ( not ( = ?auto_284492 ?auto_284493 ) ) ( not ( = ?auto_284492 ?auto_284494 ) ) ( not ( = ?auto_284492 ?auto_284495 ) ) ( not ( = ?auto_284492 ?auto_284496 ) ) ( not ( = ?auto_284492 ?auto_284497 ) ) ( not ( = ?auto_284492 ?auto_284498 ) ) ( not ( = ?auto_284493 ?auto_284494 ) ) ( not ( = ?auto_284493 ?auto_284495 ) ) ( not ( = ?auto_284493 ?auto_284496 ) ) ( not ( = ?auto_284493 ?auto_284497 ) ) ( not ( = ?auto_284493 ?auto_284498 ) ) ( not ( = ?auto_284494 ?auto_284495 ) ) ( not ( = ?auto_284494 ?auto_284496 ) ) ( not ( = ?auto_284494 ?auto_284497 ) ) ( not ( = ?auto_284494 ?auto_284498 ) ) ( not ( = ?auto_284495 ?auto_284496 ) ) ( not ( = ?auto_284495 ?auto_284497 ) ) ( not ( = ?auto_284495 ?auto_284498 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_284496 ?auto_284497 ?auto_284498 )
      ( MAKE-10CRATE-VERIFY ?auto_284488 ?auto_284489 ?auto_284490 ?auto_284491 ?auto_284492 ?auto_284493 ?auto_284494 ?auto_284495 ?auto_284496 ?auto_284497 ?auto_284498 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_284603 - SURFACE
      ?auto_284604 - SURFACE
      ?auto_284605 - SURFACE
      ?auto_284606 - SURFACE
      ?auto_284607 - SURFACE
      ?auto_284608 - SURFACE
      ?auto_284609 - SURFACE
      ?auto_284610 - SURFACE
      ?auto_284611 - SURFACE
      ?auto_284612 - SURFACE
      ?auto_284613 - SURFACE
    )
    :vars
    (
      ?auto_284617 - HOIST
      ?auto_284615 - PLACE
      ?auto_284616 - TRUCK
      ?auto_284618 - PLACE
      ?auto_284614 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_284617 ?auto_284615 ) ( SURFACE-AT ?auto_284612 ?auto_284615 ) ( CLEAR ?auto_284612 ) ( IS-CRATE ?auto_284613 ) ( not ( = ?auto_284612 ?auto_284613 ) ) ( AVAILABLE ?auto_284617 ) ( ON ?auto_284612 ?auto_284611 ) ( not ( = ?auto_284611 ?auto_284612 ) ) ( not ( = ?auto_284611 ?auto_284613 ) ) ( TRUCK-AT ?auto_284616 ?auto_284618 ) ( not ( = ?auto_284618 ?auto_284615 ) ) ( HOIST-AT ?auto_284614 ?auto_284618 ) ( LIFTING ?auto_284614 ?auto_284613 ) ( not ( = ?auto_284617 ?auto_284614 ) ) ( ON ?auto_284604 ?auto_284603 ) ( ON ?auto_284605 ?auto_284604 ) ( ON ?auto_284606 ?auto_284605 ) ( ON ?auto_284607 ?auto_284606 ) ( ON ?auto_284608 ?auto_284607 ) ( ON ?auto_284609 ?auto_284608 ) ( ON ?auto_284610 ?auto_284609 ) ( ON ?auto_284611 ?auto_284610 ) ( not ( = ?auto_284603 ?auto_284604 ) ) ( not ( = ?auto_284603 ?auto_284605 ) ) ( not ( = ?auto_284603 ?auto_284606 ) ) ( not ( = ?auto_284603 ?auto_284607 ) ) ( not ( = ?auto_284603 ?auto_284608 ) ) ( not ( = ?auto_284603 ?auto_284609 ) ) ( not ( = ?auto_284603 ?auto_284610 ) ) ( not ( = ?auto_284603 ?auto_284611 ) ) ( not ( = ?auto_284603 ?auto_284612 ) ) ( not ( = ?auto_284603 ?auto_284613 ) ) ( not ( = ?auto_284604 ?auto_284605 ) ) ( not ( = ?auto_284604 ?auto_284606 ) ) ( not ( = ?auto_284604 ?auto_284607 ) ) ( not ( = ?auto_284604 ?auto_284608 ) ) ( not ( = ?auto_284604 ?auto_284609 ) ) ( not ( = ?auto_284604 ?auto_284610 ) ) ( not ( = ?auto_284604 ?auto_284611 ) ) ( not ( = ?auto_284604 ?auto_284612 ) ) ( not ( = ?auto_284604 ?auto_284613 ) ) ( not ( = ?auto_284605 ?auto_284606 ) ) ( not ( = ?auto_284605 ?auto_284607 ) ) ( not ( = ?auto_284605 ?auto_284608 ) ) ( not ( = ?auto_284605 ?auto_284609 ) ) ( not ( = ?auto_284605 ?auto_284610 ) ) ( not ( = ?auto_284605 ?auto_284611 ) ) ( not ( = ?auto_284605 ?auto_284612 ) ) ( not ( = ?auto_284605 ?auto_284613 ) ) ( not ( = ?auto_284606 ?auto_284607 ) ) ( not ( = ?auto_284606 ?auto_284608 ) ) ( not ( = ?auto_284606 ?auto_284609 ) ) ( not ( = ?auto_284606 ?auto_284610 ) ) ( not ( = ?auto_284606 ?auto_284611 ) ) ( not ( = ?auto_284606 ?auto_284612 ) ) ( not ( = ?auto_284606 ?auto_284613 ) ) ( not ( = ?auto_284607 ?auto_284608 ) ) ( not ( = ?auto_284607 ?auto_284609 ) ) ( not ( = ?auto_284607 ?auto_284610 ) ) ( not ( = ?auto_284607 ?auto_284611 ) ) ( not ( = ?auto_284607 ?auto_284612 ) ) ( not ( = ?auto_284607 ?auto_284613 ) ) ( not ( = ?auto_284608 ?auto_284609 ) ) ( not ( = ?auto_284608 ?auto_284610 ) ) ( not ( = ?auto_284608 ?auto_284611 ) ) ( not ( = ?auto_284608 ?auto_284612 ) ) ( not ( = ?auto_284608 ?auto_284613 ) ) ( not ( = ?auto_284609 ?auto_284610 ) ) ( not ( = ?auto_284609 ?auto_284611 ) ) ( not ( = ?auto_284609 ?auto_284612 ) ) ( not ( = ?auto_284609 ?auto_284613 ) ) ( not ( = ?auto_284610 ?auto_284611 ) ) ( not ( = ?auto_284610 ?auto_284612 ) ) ( not ( = ?auto_284610 ?auto_284613 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_284611 ?auto_284612 ?auto_284613 )
      ( MAKE-10CRATE-VERIFY ?auto_284603 ?auto_284604 ?auto_284605 ?auto_284606 ?auto_284607 ?auto_284608 ?auto_284609 ?auto_284610 ?auto_284611 ?auto_284612 ?auto_284613 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_284728 - SURFACE
      ?auto_284729 - SURFACE
      ?auto_284730 - SURFACE
      ?auto_284731 - SURFACE
      ?auto_284732 - SURFACE
      ?auto_284733 - SURFACE
      ?auto_284734 - SURFACE
      ?auto_284735 - SURFACE
      ?auto_284736 - SURFACE
      ?auto_284737 - SURFACE
      ?auto_284738 - SURFACE
    )
    :vars
    (
      ?auto_284741 - HOIST
      ?auto_284744 - PLACE
      ?auto_284740 - TRUCK
      ?auto_284743 - PLACE
      ?auto_284739 - HOIST
      ?auto_284742 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_284741 ?auto_284744 ) ( SURFACE-AT ?auto_284737 ?auto_284744 ) ( CLEAR ?auto_284737 ) ( IS-CRATE ?auto_284738 ) ( not ( = ?auto_284737 ?auto_284738 ) ) ( AVAILABLE ?auto_284741 ) ( ON ?auto_284737 ?auto_284736 ) ( not ( = ?auto_284736 ?auto_284737 ) ) ( not ( = ?auto_284736 ?auto_284738 ) ) ( TRUCK-AT ?auto_284740 ?auto_284743 ) ( not ( = ?auto_284743 ?auto_284744 ) ) ( HOIST-AT ?auto_284739 ?auto_284743 ) ( not ( = ?auto_284741 ?auto_284739 ) ) ( AVAILABLE ?auto_284739 ) ( SURFACE-AT ?auto_284738 ?auto_284743 ) ( ON ?auto_284738 ?auto_284742 ) ( CLEAR ?auto_284738 ) ( not ( = ?auto_284737 ?auto_284742 ) ) ( not ( = ?auto_284738 ?auto_284742 ) ) ( not ( = ?auto_284736 ?auto_284742 ) ) ( ON ?auto_284729 ?auto_284728 ) ( ON ?auto_284730 ?auto_284729 ) ( ON ?auto_284731 ?auto_284730 ) ( ON ?auto_284732 ?auto_284731 ) ( ON ?auto_284733 ?auto_284732 ) ( ON ?auto_284734 ?auto_284733 ) ( ON ?auto_284735 ?auto_284734 ) ( ON ?auto_284736 ?auto_284735 ) ( not ( = ?auto_284728 ?auto_284729 ) ) ( not ( = ?auto_284728 ?auto_284730 ) ) ( not ( = ?auto_284728 ?auto_284731 ) ) ( not ( = ?auto_284728 ?auto_284732 ) ) ( not ( = ?auto_284728 ?auto_284733 ) ) ( not ( = ?auto_284728 ?auto_284734 ) ) ( not ( = ?auto_284728 ?auto_284735 ) ) ( not ( = ?auto_284728 ?auto_284736 ) ) ( not ( = ?auto_284728 ?auto_284737 ) ) ( not ( = ?auto_284728 ?auto_284738 ) ) ( not ( = ?auto_284728 ?auto_284742 ) ) ( not ( = ?auto_284729 ?auto_284730 ) ) ( not ( = ?auto_284729 ?auto_284731 ) ) ( not ( = ?auto_284729 ?auto_284732 ) ) ( not ( = ?auto_284729 ?auto_284733 ) ) ( not ( = ?auto_284729 ?auto_284734 ) ) ( not ( = ?auto_284729 ?auto_284735 ) ) ( not ( = ?auto_284729 ?auto_284736 ) ) ( not ( = ?auto_284729 ?auto_284737 ) ) ( not ( = ?auto_284729 ?auto_284738 ) ) ( not ( = ?auto_284729 ?auto_284742 ) ) ( not ( = ?auto_284730 ?auto_284731 ) ) ( not ( = ?auto_284730 ?auto_284732 ) ) ( not ( = ?auto_284730 ?auto_284733 ) ) ( not ( = ?auto_284730 ?auto_284734 ) ) ( not ( = ?auto_284730 ?auto_284735 ) ) ( not ( = ?auto_284730 ?auto_284736 ) ) ( not ( = ?auto_284730 ?auto_284737 ) ) ( not ( = ?auto_284730 ?auto_284738 ) ) ( not ( = ?auto_284730 ?auto_284742 ) ) ( not ( = ?auto_284731 ?auto_284732 ) ) ( not ( = ?auto_284731 ?auto_284733 ) ) ( not ( = ?auto_284731 ?auto_284734 ) ) ( not ( = ?auto_284731 ?auto_284735 ) ) ( not ( = ?auto_284731 ?auto_284736 ) ) ( not ( = ?auto_284731 ?auto_284737 ) ) ( not ( = ?auto_284731 ?auto_284738 ) ) ( not ( = ?auto_284731 ?auto_284742 ) ) ( not ( = ?auto_284732 ?auto_284733 ) ) ( not ( = ?auto_284732 ?auto_284734 ) ) ( not ( = ?auto_284732 ?auto_284735 ) ) ( not ( = ?auto_284732 ?auto_284736 ) ) ( not ( = ?auto_284732 ?auto_284737 ) ) ( not ( = ?auto_284732 ?auto_284738 ) ) ( not ( = ?auto_284732 ?auto_284742 ) ) ( not ( = ?auto_284733 ?auto_284734 ) ) ( not ( = ?auto_284733 ?auto_284735 ) ) ( not ( = ?auto_284733 ?auto_284736 ) ) ( not ( = ?auto_284733 ?auto_284737 ) ) ( not ( = ?auto_284733 ?auto_284738 ) ) ( not ( = ?auto_284733 ?auto_284742 ) ) ( not ( = ?auto_284734 ?auto_284735 ) ) ( not ( = ?auto_284734 ?auto_284736 ) ) ( not ( = ?auto_284734 ?auto_284737 ) ) ( not ( = ?auto_284734 ?auto_284738 ) ) ( not ( = ?auto_284734 ?auto_284742 ) ) ( not ( = ?auto_284735 ?auto_284736 ) ) ( not ( = ?auto_284735 ?auto_284737 ) ) ( not ( = ?auto_284735 ?auto_284738 ) ) ( not ( = ?auto_284735 ?auto_284742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_284736 ?auto_284737 ?auto_284738 )
      ( MAKE-10CRATE-VERIFY ?auto_284728 ?auto_284729 ?auto_284730 ?auto_284731 ?auto_284732 ?auto_284733 ?auto_284734 ?auto_284735 ?auto_284736 ?auto_284737 ?auto_284738 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_284854 - SURFACE
      ?auto_284855 - SURFACE
      ?auto_284856 - SURFACE
      ?auto_284857 - SURFACE
      ?auto_284858 - SURFACE
      ?auto_284859 - SURFACE
      ?auto_284860 - SURFACE
      ?auto_284861 - SURFACE
      ?auto_284862 - SURFACE
      ?auto_284863 - SURFACE
      ?auto_284864 - SURFACE
    )
    :vars
    (
      ?auto_284865 - HOIST
      ?auto_284870 - PLACE
      ?auto_284869 - PLACE
      ?auto_284867 - HOIST
      ?auto_284866 - SURFACE
      ?auto_284868 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_284865 ?auto_284870 ) ( SURFACE-AT ?auto_284863 ?auto_284870 ) ( CLEAR ?auto_284863 ) ( IS-CRATE ?auto_284864 ) ( not ( = ?auto_284863 ?auto_284864 ) ) ( AVAILABLE ?auto_284865 ) ( ON ?auto_284863 ?auto_284862 ) ( not ( = ?auto_284862 ?auto_284863 ) ) ( not ( = ?auto_284862 ?auto_284864 ) ) ( not ( = ?auto_284869 ?auto_284870 ) ) ( HOIST-AT ?auto_284867 ?auto_284869 ) ( not ( = ?auto_284865 ?auto_284867 ) ) ( AVAILABLE ?auto_284867 ) ( SURFACE-AT ?auto_284864 ?auto_284869 ) ( ON ?auto_284864 ?auto_284866 ) ( CLEAR ?auto_284864 ) ( not ( = ?auto_284863 ?auto_284866 ) ) ( not ( = ?auto_284864 ?auto_284866 ) ) ( not ( = ?auto_284862 ?auto_284866 ) ) ( TRUCK-AT ?auto_284868 ?auto_284870 ) ( ON ?auto_284855 ?auto_284854 ) ( ON ?auto_284856 ?auto_284855 ) ( ON ?auto_284857 ?auto_284856 ) ( ON ?auto_284858 ?auto_284857 ) ( ON ?auto_284859 ?auto_284858 ) ( ON ?auto_284860 ?auto_284859 ) ( ON ?auto_284861 ?auto_284860 ) ( ON ?auto_284862 ?auto_284861 ) ( not ( = ?auto_284854 ?auto_284855 ) ) ( not ( = ?auto_284854 ?auto_284856 ) ) ( not ( = ?auto_284854 ?auto_284857 ) ) ( not ( = ?auto_284854 ?auto_284858 ) ) ( not ( = ?auto_284854 ?auto_284859 ) ) ( not ( = ?auto_284854 ?auto_284860 ) ) ( not ( = ?auto_284854 ?auto_284861 ) ) ( not ( = ?auto_284854 ?auto_284862 ) ) ( not ( = ?auto_284854 ?auto_284863 ) ) ( not ( = ?auto_284854 ?auto_284864 ) ) ( not ( = ?auto_284854 ?auto_284866 ) ) ( not ( = ?auto_284855 ?auto_284856 ) ) ( not ( = ?auto_284855 ?auto_284857 ) ) ( not ( = ?auto_284855 ?auto_284858 ) ) ( not ( = ?auto_284855 ?auto_284859 ) ) ( not ( = ?auto_284855 ?auto_284860 ) ) ( not ( = ?auto_284855 ?auto_284861 ) ) ( not ( = ?auto_284855 ?auto_284862 ) ) ( not ( = ?auto_284855 ?auto_284863 ) ) ( not ( = ?auto_284855 ?auto_284864 ) ) ( not ( = ?auto_284855 ?auto_284866 ) ) ( not ( = ?auto_284856 ?auto_284857 ) ) ( not ( = ?auto_284856 ?auto_284858 ) ) ( not ( = ?auto_284856 ?auto_284859 ) ) ( not ( = ?auto_284856 ?auto_284860 ) ) ( not ( = ?auto_284856 ?auto_284861 ) ) ( not ( = ?auto_284856 ?auto_284862 ) ) ( not ( = ?auto_284856 ?auto_284863 ) ) ( not ( = ?auto_284856 ?auto_284864 ) ) ( not ( = ?auto_284856 ?auto_284866 ) ) ( not ( = ?auto_284857 ?auto_284858 ) ) ( not ( = ?auto_284857 ?auto_284859 ) ) ( not ( = ?auto_284857 ?auto_284860 ) ) ( not ( = ?auto_284857 ?auto_284861 ) ) ( not ( = ?auto_284857 ?auto_284862 ) ) ( not ( = ?auto_284857 ?auto_284863 ) ) ( not ( = ?auto_284857 ?auto_284864 ) ) ( not ( = ?auto_284857 ?auto_284866 ) ) ( not ( = ?auto_284858 ?auto_284859 ) ) ( not ( = ?auto_284858 ?auto_284860 ) ) ( not ( = ?auto_284858 ?auto_284861 ) ) ( not ( = ?auto_284858 ?auto_284862 ) ) ( not ( = ?auto_284858 ?auto_284863 ) ) ( not ( = ?auto_284858 ?auto_284864 ) ) ( not ( = ?auto_284858 ?auto_284866 ) ) ( not ( = ?auto_284859 ?auto_284860 ) ) ( not ( = ?auto_284859 ?auto_284861 ) ) ( not ( = ?auto_284859 ?auto_284862 ) ) ( not ( = ?auto_284859 ?auto_284863 ) ) ( not ( = ?auto_284859 ?auto_284864 ) ) ( not ( = ?auto_284859 ?auto_284866 ) ) ( not ( = ?auto_284860 ?auto_284861 ) ) ( not ( = ?auto_284860 ?auto_284862 ) ) ( not ( = ?auto_284860 ?auto_284863 ) ) ( not ( = ?auto_284860 ?auto_284864 ) ) ( not ( = ?auto_284860 ?auto_284866 ) ) ( not ( = ?auto_284861 ?auto_284862 ) ) ( not ( = ?auto_284861 ?auto_284863 ) ) ( not ( = ?auto_284861 ?auto_284864 ) ) ( not ( = ?auto_284861 ?auto_284866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_284862 ?auto_284863 ?auto_284864 )
      ( MAKE-10CRATE-VERIFY ?auto_284854 ?auto_284855 ?auto_284856 ?auto_284857 ?auto_284858 ?auto_284859 ?auto_284860 ?auto_284861 ?auto_284862 ?auto_284863 ?auto_284864 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_284980 - SURFACE
      ?auto_284981 - SURFACE
      ?auto_284982 - SURFACE
      ?auto_284983 - SURFACE
      ?auto_284984 - SURFACE
      ?auto_284985 - SURFACE
      ?auto_284986 - SURFACE
      ?auto_284987 - SURFACE
      ?auto_284988 - SURFACE
      ?auto_284989 - SURFACE
      ?auto_284990 - SURFACE
    )
    :vars
    (
      ?auto_284993 - HOIST
      ?auto_284992 - PLACE
      ?auto_284991 - PLACE
      ?auto_284995 - HOIST
      ?auto_284996 - SURFACE
      ?auto_284994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_284993 ?auto_284992 ) ( IS-CRATE ?auto_284990 ) ( not ( = ?auto_284989 ?auto_284990 ) ) ( not ( = ?auto_284988 ?auto_284989 ) ) ( not ( = ?auto_284988 ?auto_284990 ) ) ( not ( = ?auto_284991 ?auto_284992 ) ) ( HOIST-AT ?auto_284995 ?auto_284991 ) ( not ( = ?auto_284993 ?auto_284995 ) ) ( AVAILABLE ?auto_284995 ) ( SURFACE-AT ?auto_284990 ?auto_284991 ) ( ON ?auto_284990 ?auto_284996 ) ( CLEAR ?auto_284990 ) ( not ( = ?auto_284989 ?auto_284996 ) ) ( not ( = ?auto_284990 ?auto_284996 ) ) ( not ( = ?auto_284988 ?auto_284996 ) ) ( TRUCK-AT ?auto_284994 ?auto_284992 ) ( SURFACE-AT ?auto_284988 ?auto_284992 ) ( CLEAR ?auto_284988 ) ( LIFTING ?auto_284993 ?auto_284989 ) ( IS-CRATE ?auto_284989 ) ( ON ?auto_284981 ?auto_284980 ) ( ON ?auto_284982 ?auto_284981 ) ( ON ?auto_284983 ?auto_284982 ) ( ON ?auto_284984 ?auto_284983 ) ( ON ?auto_284985 ?auto_284984 ) ( ON ?auto_284986 ?auto_284985 ) ( ON ?auto_284987 ?auto_284986 ) ( ON ?auto_284988 ?auto_284987 ) ( not ( = ?auto_284980 ?auto_284981 ) ) ( not ( = ?auto_284980 ?auto_284982 ) ) ( not ( = ?auto_284980 ?auto_284983 ) ) ( not ( = ?auto_284980 ?auto_284984 ) ) ( not ( = ?auto_284980 ?auto_284985 ) ) ( not ( = ?auto_284980 ?auto_284986 ) ) ( not ( = ?auto_284980 ?auto_284987 ) ) ( not ( = ?auto_284980 ?auto_284988 ) ) ( not ( = ?auto_284980 ?auto_284989 ) ) ( not ( = ?auto_284980 ?auto_284990 ) ) ( not ( = ?auto_284980 ?auto_284996 ) ) ( not ( = ?auto_284981 ?auto_284982 ) ) ( not ( = ?auto_284981 ?auto_284983 ) ) ( not ( = ?auto_284981 ?auto_284984 ) ) ( not ( = ?auto_284981 ?auto_284985 ) ) ( not ( = ?auto_284981 ?auto_284986 ) ) ( not ( = ?auto_284981 ?auto_284987 ) ) ( not ( = ?auto_284981 ?auto_284988 ) ) ( not ( = ?auto_284981 ?auto_284989 ) ) ( not ( = ?auto_284981 ?auto_284990 ) ) ( not ( = ?auto_284981 ?auto_284996 ) ) ( not ( = ?auto_284982 ?auto_284983 ) ) ( not ( = ?auto_284982 ?auto_284984 ) ) ( not ( = ?auto_284982 ?auto_284985 ) ) ( not ( = ?auto_284982 ?auto_284986 ) ) ( not ( = ?auto_284982 ?auto_284987 ) ) ( not ( = ?auto_284982 ?auto_284988 ) ) ( not ( = ?auto_284982 ?auto_284989 ) ) ( not ( = ?auto_284982 ?auto_284990 ) ) ( not ( = ?auto_284982 ?auto_284996 ) ) ( not ( = ?auto_284983 ?auto_284984 ) ) ( not ( = ?auto_284983 ?auto_284985 ) ) ( not ( = ?auto_284983 ?auto_284986 ) ) ( not ( = ?auto_284983 ?auto_284987 ) ) ( not ( = ?auto_284983 ?auto_284988 ) ) ( not ( = ?auto_284983 ?auto_284989 ) ) ( not ( = ?auto_284983 ?auto_284990 ) ) ( not ( = ?auto_284983 ?auto_284996 ) ) ( not ( = ?auto_284984 ?auto_284985 ) ) ( not ( = ?auto_284984 ?auto_284986 ) ) ( not ( = ?auto_284984 ?auto_284987 ) ) ( not ( = ?auto_284984 ?auto_284988 ) ) ( not ( = ?auto_284984 ?auto_284989 ) ) ( not ( = ?auto_284984 ?auto_284990 ) ) ( not ( = ?auto_284984 ?auto_284996 ) ) ( not ( = ?auto_284985 ?auto_284986 ) ) ( not ( = ?auto_284985 ?auto_284987 ) ) ( not ( = ?auto_284985 ?auto_284988 ) ) ( not ( = ?auto_284985 ?auto_284989 ) ) ( not ( = ?auto_284985 ?auto_284990 ) ) ( not ( = ?auto_284985 ?auto_284996 ) ) ( not ( = ?auto_284986 ?auto_284987 ) ) ( not ( = ?auto_284986 ?auto_284988 ) ) ( not ( = ?auto_284986 ?auto_284989 ) ) ( not ( = ?auto_284986 ?auto_284990 ) ) ( not ( = ?auto_284986 ?auto_284996 ) ) ( not ( = ?auto_284987 ?auto_284988 ) ) ( not ( = ?auto_284987 ?auto_284989 ) ) ( not ( = ?auto_284987 ?auto_284990 ) ) ( not ( = ?auto_284987 ?auto_284996 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_284988 ?auto_284989 ?auto_284990 )
      ( MAKE-10CRATE-VERIFY ?auto_284980 ?auto_284981 ?auto_284982 ?auto_284983 ?auto_284984 ?auto_284985 ?auto_284986 ?auto_284987 ?auto_284988 ?auto_284989 ?auto_284990 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_285106 - SURFACE
      ?auto_285107 - SURFACE
      ?auto_285108 - SURFACE
      ?auto_285109 - SURFACE
      ?auto_285110 - SURFACE
      ?auto_285111 - SURFACE
      ?auto_285112 - SURFACE
      ?auto_285113 - SURFACE
      ?auto_285114 - SURFACE
      ?auto_285115 - SURFACE
      ?auto_285116 - SURFACE
    )
    :vars
    (
      ?auto_285118 - HOIST
      ?auto_285117 - PLACE
      ?auto_285120 - PLACE
      ?auto_285119 - HOIST
      ?auto_285122 - SURFACE
      ?auto_285121 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285118 ?auto_285117 ) ( IS-CRATE ?auto_285116 ) ( not ( = ?auto_285115 ?auto_285116 ) ) ( not ( = ?auto_285114 ?auto_285115 ) ) ( not ( = ?auto_285114 ?auto_285116 ) ) ( not ( = ?auto_285120 ?auto_285117 ) ) ( HOIST-AT ?auto_285119 ?auto_285120 ) ( not ( = ?auto_285118 ?auto_285119 ) ) ( AVAILABLE ?auto_285119 ) ( SURFACE-AT ?auto_285116 ?auto_285120 ) ( ON ?auto_285116 ?auto_285122 ) ( CLEAR ?auto_285116 ) ( not ( = ?auto_285115 ?auto_285122 ) ) ( not ( = ?auto_285116 ?auto_285122 ) ) ( not ( = ?auto_285114 ?auto_285122 ) ) ( TRUCK-AT ?auto_285121 ?auto_285117 ) ( SURFACE-AT ?auto_285114 ?auto_285117 ) ( CLEAR ?auto_285114 ) ( IS-CRATE ?auto_285115 ) ( AVAILABLE ?auto_285118 ) ( IN ?auto_285115 ?auto_285121 ) ( ON ?auto_285107 ?auto_285106 ) ( ON ?auto_285108 ?auto_285107 ) ( ON ?auto_285109 ?auto_285108 ) ( ON ?auto_285110 ?auto_285109 ) ( ON ?auto_285111 ?auto_285110 ) ( ON ?auto_285112 ?auto_285111 ) ( ON ?auto_285113 ?auto_285112 ) ( ON ?auto_285114 ?auto_285113 ) ( not ( = ?auto_285106 ?auto_285107 ) ) ( not ( = ?auto_285106 ?auto_285108 ) ) ( not ( = ?auto_285106 ?auto_285109 ) ) ( not ( = ?auto_285106 ?auto_285110 ) ) ( not ( = ?auto_285106 ?auto_285111 ) ) ( not ( = ?auto_285106 ?auto_285112 ) ) ( not ( = ?auto_285106 ?auto_285113 ) ) ( not ( = ?auto_285106 ?auto_285114 ) ) ( not ( = ?auto_285106 ?auto_285115 ) ) ( not ( = ?auto_285106 ?auto_285116 ) ) ( not ( = ?auto_285106 ?auto_285122 ) ) ( not ( = ?auto_285107 ?auto_285108 ) ) ( not ( = ?auto_285107 ?auto_285109 ) ) ( not ( = ?auto_285107 ?auto_285110 ) ) ( not ( = ?auto_285107 ?auto_285111 ) ) ( not ( = ?auto_285107 ?auto_285112 ) ) ( not ( = ?auto_285107 ?auto_285113 ) ) ( not ( = ?auto_285107 ?auto_285114 ) ) ( not ( = ?auto_285107 ?auto_285115 ) ) ( not ( = ?auto_285107 ?auto_285116 ) ) ( not ( = ?auto_285107 ?auto_285122 ) ) ( not ( = ?auto_285108 ?auto_285109 ) ) ( not ( = ?auto_285108 ?auto_285110 ) ) ( not ( = ?auto_285108 ?auto_285111 ) ) ( not ( = ?auto_285108 ?auto_285112 ) ) ( not ( = ?auto_285108 ?auto_285113 ) ) ( not ( = ?auto_285108 ?auto_285114 ) ) ( not ( = ?auto_285108 ?auto_285115 ) ) ( not ( = ?auto_285108 ?auto_285116 ) ) ( not ( = ?auto_285108 ?auto_285122 ) ) ( not ( = ?auto_285109 ?auto_285110 ) ) ( not ( = ?auto_285109 ?auto_285111 ) ) ( not ( = ?auto_285109 ?auto_285112 ) ) ( not ( = ?auto_285109 ?auto_285113 ) ) ( not ( = ?auto_285109 ?auto_285114 ) ) ( not ( = ?auto_285109 ?auto_285115 ) ) ( not ( = ?auto_285109 ?auto_285116 ) ) ( not ( = ?auto_285109 ?auto_285122 ) ) ( not ( = ?auto_285110 ?auto_285111 ) ) ( not ( = ?auto_285110 ?auto_285112 ) ) ( not ( = ?auto_285110 ?auto_285113 ) ) ( not ( = ?auto_285110 ?auto_285114 ) ) ( not ( = ?auto_285110 ?auto_285115 ) ) ( not ( = ?auto_285110 ?auto_285116 ) ) ( not ( = ?auto_285110 ?auto_285122 ) ) ( not ( = ?auto_285111 ?auto_285112 ) ) ( not ( = ?auto_285111 ?auto_285113 ) ) ( not ( = ?auto_285111 ?auto_285114 ) ) ( not ( = ?auto_285111 ?auto_285115 ) ) ( not ( = ?auto_285111 ?auto_285116 ) ) ( not ( = ?auto_285111 ?auto_285122 ) ) ( not ( = ?auto_285112 ?auto_285113 ) ) ( not ( = ?auto_285112 ?auto_285114 ) ) ( not ( = ?auto_285112 ?auto_285115 ) ) ( not ( = ?auto_285112 ?auto_285116 ) ) ( not ( = ?auto_285112 ?auto_285122 ) ) ( not ( = ?auto_285113 ?auto_285114 ) ) ( not ( = ?auto_285113 ?auto_285115 ) ) ( not ( = ?auto_285113 ?auto_285116 ) ) ( not ( = ?auto_285113 ?auto_285122 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285114 ?auto_285115 ?auto_285116 )
      ( MAKE-10CRATE-VERIFY ?auto_285106 ?auto_285107 ?auto_285108 ?auto_285109 ?auto_285110 ?auto_285111 ?auto_285112 ?auto_285113 ?auto_285114 ?auto_285115 ?auto_285116 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_285123 - SURFACE
      ?auto_285124 - SURFACE
    )
    :vars
    (
      ?auto_285127 - HOIST
      ?auto_285126 - PLACE
      ?auto_285125 - SURFACE
      ?auto_285129 - PLACE
      ?auto_285128 - HOIST
      ?auto_285131 - SURFACE
      ?auto_285130 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285127 ?auto_285126 ) ( IS-CRATE ?auto_285124 ) ( not ( = ?auto_285123 ?auto_285124 ) ) ( not ( = ?auto_285125 ?auto_285123 ) ) ( not ( = ?auto_285125 ?auto_285124 ) ) ( not ( = ?auto_285129 ?auto_285126 ) ) ( HOIST-AT ?auto_285128 ?auto_285129 ) ( not ( = ?auto_285127 ?auto_285128 ) ) ( AVAILABLE ?auto_285128 ) ( SURFACE-AT ?auto_285124 ?auto_285129 ) ( ON ?auto_285124 ?auto_285131 ) ( CLEAR ?auto_285124 ) ( not ( = ?auto_285123 ?auto_285131 ) ) ( not ( = ?auto_285124 ?auto_285131 ) ) ( not ( = ?auto_285125 ?auto_285131 ) ) ( SURFACE-AT ?auto_285125 ?auto_285126 ) ( CLEAR ?auto_285125 ) ( IS-CRATE ?auto_285123 ) ( AVAILABLE ?auto_285127 ) ( IN ?auto_285123 ?auto_285130 ) ( TRUCK-AT ?auto_285130 ?auto_285129 ) )
    :subtasks
    ( ( !DRIVE ?auto_285130 ?auto_285129 ?auto_285126 )
      ( MAKE-2CRATE ?auto_285125 ?auto_285123 ?auto_285124 )
      ( MAKE-1CRATE-VERIFY ?auto_285123 ?auto_285124 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_285132 - SURFACE
      ?auto_285133 - SURFACE
      ?auto_285134 - SURFACE
    )
    :vars
    (
      ?auto_285135 - HOIST
      ?auto_285138 - PLACE
      ?auto_285139 - PLACE
      ?auto_285136 - HOIST
      ?auto_285137 - SURFACE
      ?auto_285140 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285135 ?auto_285138 ) ( IS-CRATE ?auto_285134 ) ( not ( = ?auto_285133 ?auto_285134 ) ) ( not ( = ?auto_285132 ?auto_285133 ) ) ( not ( = ?auto_285132 ?auto_285134 ) ) ( not ( = ?auto_285139 ?auto_285138 ) ) ( HOIST-AT ?auto_285136 ?auto_285139 ) ( not ( = ?auto_285135 ?auto_285136 ) ) ( AVAILABLE ?auto_285136 ) ( SURFACE-AT ?auto_285134 ?auto_285139 ) ( ON ?auto_285134 ?auto_285137 ) ( CLEAR ?auto_285134 ) ( not ( = ?auto_285133 ?auto_285137 ) ) ( not ( = ?auto_285134 ?auto_285137 ) ) ( not ( = ?auto_285132 ?auto_285137 ) ) ( SURFACE-AT ?auto_285132 ?auto_285138 ) ( CLEAR ?auto_285132 ) ( IS-CRATE ?auto_285133 ) ( AVAILABLE ?auto_285135 ) ( IN ?auto_285133 ?auto_285140 ) ( TRUCK-AT ?auto_285140 ?auto_285139 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_285133 ?auto_285134 )
      ( MAKE-2CRATE-VERIFY ?auto_285132 ?auto_285133 ?auto_285134 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_285141 - SURFACE
      ?auto_285142 - SURFACE
      ?auto_285143 - SURFACE
      ?auto_285144 - SURFACE
    )
    :vars
    (
      ?auto_285150 - HOIST
      ?auto_285148 - PLACE
      ?auto_285147 - PLACE
      ?auto_285146 - HOIST
      ?auto_285145 - SURFACE
      ?auto_285149 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285150 ?auto_285148 ) ( IS-CRATE ?auto_285144 ) ( not ( = ?auto_285143 ?auto_285144 ) ) ( not ( = ?auto_285142 ?auto_285143 ) ) ( not ( = ?auto_285142 ?auto_285144 ) ) ( not ( = ?auto_285147 ?auto_285148 ) ) ( HOIST-AT ?auto_285146 ?auto_285147 ) ( not ( = ?auto_285150 ?auto_285146 ) ) ( AVAILABLE ?auto_285146 ) ( SURFACE-AT ?auto_285144 ?auto_285147 ) ( ON ?auto_285144 ?auto_285145 ) ( CLEAR ?auto_285144 ) ( not ( = ?auto_285143 ?auto_285145 ) ) ( not ( = ?auto_285144 ?auto_285145 ) ) ( not ( = ?auto_285142 ?auto_285145 ) ) ( SURFACE-AT ?auto_285142 ?auto_285148 ) ( CLEAR ?auto_285142 ) ( IS-CRATE ?auto_285143 ) ( AVAILABLE ?auto_285150 ) ( IN ?auto_285143 ?auto_285149 ) ( TRUCK-AT ?auto_285149 ?auto_285147 ) ( ON ?auto_285142 ?auto_285141 ) ( not ( = ?auto_285141 ?auto_285142 ) ) ( not ( = ?auto_285141 ?auto_285143 ) ) ( not ( = ?auto_285141 ?auto_285144 ) ) ( not ( = ?auto_285141 ?auto_285145 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285142 ?auto_285143 ?auto_285144 )
      ( MAKE-3CRATE-VERIFY ?auto_285141 ?auto_285142 ?auto_285143 ?auto_285144 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_285151 - SURFACE
      ?auto_285152 - SURFACE
      ?auto_285153 - SURFACE
      ?auto_285154 - SURFACE
      ?auto_285155 - SURFACE
    )
    :vars
    (
      ?auto_285161 - HOIST
      ?auto_285159 - PLACE
      ?auto_285158 - PLACE
      ?auto_285157 - HOIST
      ?auto_285156 - SURFACE
      ?auto_285160 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285161 ?auto_285159 ) ( IS-CRATE ?auto_285155 ) ( not ( = ?auto_285154 ?auto_285155 ) ) ( not ( = ?auto_285153 ?auto_285154 ) ) ( not ( = ?auto_285153 ?auto_285155 ) ) ( not ( = ?auto_285158 ?auto_285159 ) ) ( HOIST-AT ?auto_285157 ?auto_285158 ) ( not ( = ?auto_285161 ?auto_285157 ) ) ( AVAILABLE ?auto_285157 ) ( SURFACE-AT ?auto_285155 ?auto_285158 ) ( ON ?auto_285155 ?auto_285156 ) ( CLEAR ?auto_285155 ) ( not ( = ?auto_285154 ?auto_285156 ) ) ( not ( = ?auto_285155 ?auto_285156 ) ) ( not ( = ?auto_285153 ?auto_285156 ) ) ( SURFACE-AT ?auto_285153 ?auto_285159 ) ( CLEAR ?auto_285153 ) ( IS-CRATE ?auto_285154 ) ( AVAILABLE ?auto_285161 ) ( IN ?auto_285154 ?auto_285160 ) ( TRUCK-AT ?auto_285160 ?auto_285158 ) ( ON ?auto_285152 ?auto_285151 ) ( ON ?auto_285153 ?auto_285152 ) ( not ( = ?auto_285151 ?auto_285152 ) ) ( not ( = ?auto_285151 ?auto_285153 ) ) ( not ( = ?auto_285151 ?auto_285154 ) ) ( not ( = ?auto_285151 ?auto_285155 ) ) ( not ( = ?auto_285151 ?auto_285156 ) ) ( not ( = ?auto_285152 ?auto_285153 ) ) ( not ( = ?auto_285152 ?auto_285154 ) ) ( not ( = ?auto_285152 ?auto_285155 ) ) ( not ( = ?auto_285152 ?auto_285156 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285153 ?auto_285154 ?auto_285155 )
      ( MAKE-4CRATE-VERIFY ?auto_285151 ?auto_285152 ?auto_285153 ?auto_285154 ?auto_285155 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_285162 - SURFACE
      ?auto_285163 - SURFACE
      ?auto_285164 - SURFACE
      ?auto_285165 - SURFACE
      ?auto_285166 - SURFACE
      ?auto_285167 - SURFACE
    )
    :vars
    (
      ?auto_285173 - HOIST
      ?auto_285171 - PLACE
      ?auto_285170 - PLACE
      ?auto_285169 - HOIST
      ?auto_285168 - SURFACE
      ?auto_285172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285173 ?auto_285171 ) ( IS-CRATE ?auto_285167 ) ( not ( = ?auto_285166 ?auto_285167 ) ) ( not ( = ?auto_285165 ?auto_285166 ) ) ( not ( = ?auto_285165 ?auto_285167 ) ) ( not ( = ?auto_285170 ?auto_285171 ) ) ( HOIST-AT ?auto_285169 ?auto_285170 ) ( not ( = ?auto_285173 ?auto_285169 ) ) ( AVAILABLE ?auto_285169 ) ( SURFACE-AT ?auto_285167 ?auto_285170 ) ( ON ?auto_285167 ?auto_285168 ) ( CLEAR ?auto_285167 ) ( not ( = ?auto_285166 ?auto_285168 ) ) ( not ( = ?auto_285167 ?auto_285168 ) ) ( not ( = ?auto_285165 ?auto_285168 ) ) ( SURFACE-AT ?auto_285165 ?auto_285171 ) ( CLEAR ?auto_285165 ) ( IS-CRATE ?auto_285166 ) ( AVAILABLE ?auto_285173 ) ( IN ?auto_285166 ?auto_285172 ) ( TRUCK-AT ?auto_285172 ?auto_285170 ) ( ON ?auto_285163 ?auto_285162 ) ( ON ?auto_285164 ?auto_285163 ) ( ON ?auto_285165 ?auto_285164 ) ( not ( = ?auto_285162 ?auto_285163 ) ) ( not ( = ?auto_285162 ?auto_285164 ) ) ( not ( = ?auto_285162 ?auto_285165 ) ) ( not ( = ?auto_285162 ?auto_285166 ) ) ( not ( = ?auto_285162 ?auto_285167 ) ) ( not ( = ?auto_285162 ?auto_285168 ) ) ( not ( = ?auto_285163 ?auto_285164 ) ) ( not ( = ?auto_285163 ?auto_285165 ) ) ( not ( = ?auto_285163 ?auto_285166 ) ) ( not ( = ?auto_285163 ?auto_285167 ) ) ( not ( = ?auto_285163 ?auto_285168 ) ) ( not ( = ?auto_285164 ?auto_285165 ) ) ( not ( = ?auto_285164 ?auto_285166 ) ) ( not ( = ?auto_285164 ?auto_285167 ) ) ( not ( = ?auto_285164 ?auto_285168 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285165 ?auto_285166 ?auto_285167 )
      ( MAKE-5CRATE-VERIFY ?auto_285162 ?auto_285163 ?auto_285164 ?auto_285165 ?auto_285166 ?auto_285167 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_285174 - SURFACE
      ?auto_285175 - SURFACE
      ?auto_285176 - SURFACE
      ?auto_285177 - SURFACE
      ?auto_285178 - SURFACE
      ?auto_285179 - SURFACE
      ?auto_285180 - SURFACE
    )
    :vars
    (
      ?auto_285186 - HOIST
      ?auto_285184 - PLACE
      ?auto_285183 - PLACE
      ?auto_285182 - HOIST
      ?auto_285181 - SURFACE
      ?auto_285185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285186 ?auto_285184 ) ( IS-CRATE ?auto_285180 ) ( not ( = ?auto_285179 ?auto_285180 ) ) ( not ( = ?auto_285178 ?auto_285179 ) ) ( not ( = ?auto_285178 ?auto_285180 ) ) ( not ( = ?auto_285183 ?auto_285184 ) ) ( HOIST-AT ?auto_285182 ?auto_285183 ) ( not ( = ?auto_285186 ?auto_285182 ) ) ( AVAILABLE ?auto_285182 ) ( SURFACE-AT ?auto_285180 ?auto_285183 ) ( ON ?auto_285180 ?auto_285181 ) ( CLEAR ?auto_285180 ) ( not ( = ?auto_285179 ?auto_285181 ) ) ( not ( = ?auto_285180 ?auto_285181 ) ) ( not ( = ?auto_285178 ?auto_285181 ) ) ( SURFACE-AT ?auto_285178 ?auto_285184 ) ( CLEAR ?auto_285178 ) ( IS-CRATE ?auto_285179 ) ( AVAILABLE ?auto_285186 ) ( IN ?auto_285179 ?auto_285185 ) ( TRUCK-AT ?auto_285185 ?auto_285183 ) ( ON ?auto_285175 ?auto_285174 ) ( ON ?auto_285176 ?auto_285175 ) ( ON ?auto_285177 ?auto_285176 ) ( ON ?auto_285178 ?auto_285177 ) ( not ( = ?auto_285174 ?auto_285175 ) ) ( not ( = ?auto_285174 ?auto_285176 ) ) ( not ( = ?auto_285174 ?auto_285177 ) ) ( not ( = ?auto_285174 ?auto_285178 ) ) ( not ( = ?auto_285174 ?auto_285179 ) ) ( not ( = ?auto_285174 ?auto_285180 ) ) ( not ( = ?auto_285174 ?auto_285181 ) ) ( not ( = ?auto_285175 ?auto_285176 ) ) ( not ( = ?auto_285175 ?auto_285177 ) ) ( not ( = ?auto_285175 ?auto_285178 ) ) ( not ( = ?auto_285175 ?auto_285179 ) ) ( not ( = ?auto_285175 ?auto_285180 ) ) ( not ( = ?auto_285175 ?auto_285181 ) ) ( not ( = ?auto_285176 ?auto_285177 ) ) ( not ( = ?auto_285176 ?auto_285178 ) ) ( not ( = ?auto_285176 ?auto_285179 ) ) ( not ( = ?auto_285176 ?auto_285180 ) ) ( not ( = ?auto_285176 ?auto_285181 ) ) ( not ( = ?auto_285177 ?auto_285178 ) ) ( not ( = ?auto_285177 ?auto_285179 ) ) ( not ( = ?auto_285177 ?auto_285180 ) ) ( not ( = ?auto_285177 ?auto_285181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285178 ?auto_285179 ?auto_285180 )
      ( MAKE-6CRATE-VERIFY ?auto_285174 ?auto_285175 ?auto_285176 ?auto_285177 ?auto_285178 ?auto_285179 ?auto_285180 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_285187 - SURFACE
      ?auto_285188 - SURFACE
      ?auto_285189 - SURFACE
      ?auto_285190 - SURFACE
      ?auto_285191 - SURFACE
      ?auto_285192 - SURFACE
      ?auto_285193 - SURFACE
      ?auto_285194 - SURFACE
    )
    :vars
    (
      ?auto_285200 - HOIST
      ?auto_285198 - PLACE
      ?auto_285197 - PLACE
      ?auto_285196 - HOIST
      ?auto_285195 - SURFACE
      ?auto_285199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285200 ?auto_285198 ) ( IS-CRATE ?auto_285194 ) ( not ( = ?auto_285193 ?auto_285194 ) ) ( not ( = ?auto_285192 ?auto_285193 ) ) ( not ( = ?auto_285192 ?auto_285194 ) ) ( not ( = ?auto_285197 ?auto_285198 ) ) ( HOIST-AT ?auto_285196 ?auto_285197 ) ( not ( = ?auto_285200 ?auto_285196 ) ) ( AVAILABLE ?auto_285196 ) ( SURFACE-AT ?auto_285194 ?auto_285197 ) ( ON ?auto_285194 ?auto_285195 ) ( CLEAR ?auto_285194 ) ( not ( = ?auto_285193 ?auto_285195 ) ) ( not ( = ?auto_285194 ?auto_285195 ) ) ( not ( = ?auto_285192 ?auto_285195 ) ) ( SURFACE-AT ?auto_285192 ?auto_285198 ) ( CLEAR ?auto_285192 ) ( IS-CRATE ?auto_285193 ) ( AVAILABLE ?auto_285200 ) ( IN ?auto_285193 ?auto_285199 ) ( TRUCK-AT ?auto_285199 ?auto_285197 ) ( ON ?auto_285188 ?auto_285187 ) ( ON ?auto_285189 ?auto_285188 ) ( ON ?auto_285190 ?auto_285189 ) ( ON ?auto_285191 ?auto_285190 ) ( ON ?auto_285192 ?auto_285191 ) ( not ( = ?auto_285187 ?auto_285188 ) ) ( not ( = ?auto_285187 ?auto_285189 ) ) ( not ( = ?auto_285187 ?auto_285190 ) ) ( not ( = ?auto_285187 ?auto_285191 ) ) ( not ( = ?auto_285187 ?auto_285192 ) ) ( not ( = ?auto_285187 ?auto_285193 ) ) ( not ( = ?auto_285187 ?auto_285194 ) ) ( not ( = ?auto_285187 ?auto_285195 ) ) ( not ( = ?auto_285188 ?auto_285189 ) ) ( not ( = ?auto_285188 ?auto_285190 ) ) ( not ( = ?auto_285188 ?auto_285191 ) ) ( not ( = ?auto_285188 ?auto_285192 ) ) ( not ( = ?auto_285188 ?auto_285193 ) ) ( not ( = ?auto_285188 ?auto_285194 ) ) ( not ( = ?auto_285188 ?auto_285195 ) ) ( not ( = ?auto_285189 ?auto_285190 ) ) ( not ( = ?auto_285189 ?auto_285191 ) ) ( not ( = ?auto_285189 ?auto_285192 ) ) ( not ( = ?auto_285189 ?auto_285193 ) ) ( not ( = ?auto_285189 ?auto_285194 ) ) ( not ( = ?auto_285189 ?auto_285195 ) ) ( not ( = ?auto_285190 ?auto_285191 ) ) ( not ( = ?auto_285190 ?auto_285192 ) ) ( not ( = ?auto_285190 ?auto_285193 ) ) ( not ( = ?auto_285190 ?auto_285194 ) ) ( not ( = ?auto_285190 ?auto_285195 ) ) ( not ( = ?auto_285191 ?auto_285192 ) ) ( not ( = ?auto_285191 ?auto_285193 ) ) ( not ( = ?auto_285191 ?auto_285194 ) ) ( not ( = ?auto_285191 ?auto_285195 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285192 ?auto_285193 ?auto_285194 )
      ( MAKE-7CRATE-VERIFY ?auto_285187 ?auto_285188 ?auto_285189 ?auto_285190 ?auto_285191 ?auto_285192 ?auto_285193 ?auto_285194 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_285201 - SURFACE
      ?auto_285202 - SURFACE
      ?auto_285203 - SURFACE
      ?auto_285204 - SURFACE
      ?auto_285205 - SURFACE
      ?auto_285206 - SURFACE
      ?auto_285207 - SURFACE
      ?auto_285208 - SURFACE
      ?auto_285209 - SURFACE
    )
    :vars
    (
      ?auto_285215 - HOIST
      ?auto_285213 - PLACE
      ?auto_285212 - PLACE
      ?auto_285211 - HOIST
      ?auto_285210 - SURFACE
      ?auto_285214 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285215 ?auto_285213 ) ( IS-CRATE ?auto_285209 ) ( not ( = ?auto_285208 ?auto_285209 ) ) ( not ( = ?auto_285207 ?auto_285208 ) ) ( not ( = ?auto_285207 ?auto_285209 ) ) ( not ( = ?auto_285212 ?auto_285213 ) ) ( HOIST-AT ?auto_285211 ?auto_285212 ) ( not ( = ?auto_285215 ?auto_285211 ) ) ( AVAILABLE ?auto_285211 ) ( SURFACE-AT ?auto_285209 ?auto_285212 ) ( ON ?auto_285209 ?auto_285210 ) ( CLEAR ?auto_285209 ) ( not ( = ?auto_285208 ?auto_285210 ) ) ( not ( = ?auto_285209 ?auto_285210 ) ) ( not ( = ?auto_285207 ?auto_285210 ) ) ( SURFACE-AT ?auto_285207 ?auto_285213 ) ( CLEAR ?auto_285207 ) ( IS-CRATE ?auto_285208 ) ( AVAILABLE ?auto_285215 ) ( IN ?auto_285208 ?auto_285214 ) ( TRUCK-AT ?auto_285214 ?auto_285212 ) ( ON ?auto_285202 ?auto_285201 ) ( ON ?auto_285203 ?auto_285202 ) ( ON ?auto_285204 ?auto_285203 ) ( ON ?auto_285205 ?auto_285204 ) ( ON ?auto_285206 ?auto_285205 ) ( ON ?auto_285207 ?auto_285206 ) ( not ( = ?auto_285201 ?auto_285202 ) ) ( not ( = ?auto_285201 ?auto_285203 ) ) ( not ( = ?auto_285201 ?auto_285204 ) ) ( not ( = ?auto_285201 ?auto_285205 ) ) ( not ( = ?auto_285201 ?auto_285206 ) ) ( not ( = ?auto_285201 ?auto_285207 ) ) ( not ( = ?auto_285201 ?auto_285208 ) ) ( not ( = ?auto_285201 ?auto_285209 ) ) ( not ( = ?auto_285201 ?auto_285210 ) ) ( not ( = ?auto_285202 ?auto_285203 ) ) ( not ( = ?auto_285202 ?auto_285204 ) ) ( not ( = ?auto_285202 ?auto_285205 ) ) ( not ( = ?auto_285202 ?auto_285206 ) ) ( not ( = ?auto_285202 ?auto_285207 ) ) ( not ( = ?auto_285202 ?auto_285208 ) ) ( not ( = ?auto_285202 ?auto_285209 ) ) ( not ( = ?auto_285202 ?auto_285210 ) ) ( not ( = ?auto_285203 ?auto_285204 ) ) ( not ( = ?auto_285203 ?auto_285205 ) ) ( not ( = ?auto_285203 ?auto_285206 ) ) ( not ( = ?auto_285203 ?auto_285207 ) ) ( not ( = ?auto_285203 ?auto_285208 ) ) ( not ( = ?auto_285203 ?auto_285209 ) ) ( not ( = ?auto_285203 ?auto_285210 ) ) ( not ( = ?auto_285204 ?auto_285205 ) ) ( not ( = ?auto_285204 ?auto_285206 ) ) ( not ( = ?auto_285204 ?auto_285207 ) ) ( not ( = ?auto_285204 ?auto_285208 ) ) ( not ( = ?auto_285204 ?auto_285209 ) ) ( not ( = ?auto_285204 ?auto_285210 ) ) ( not ( = ?auto_285205 ?auto_285206 ) ) ( not ( = ?auto_285205 ?auto_285207 ) ) ( not ( = ?auto_285205 ?auto_285208 ) ) ( not ( = ?auto_285205 ?auto_285209 ) ) ( not ( = ?auto_285205 ?auto_285210 ) ) ( not ( = ?auto_285206 ?auto_285207 ) ) ( not ( = ?auto_285206 ?auto_285208 ) ) ( not ( = ?auto_285206 ?auto_285209 ) ) ( not ( = ?auto_285206 ?auto_285210 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285207 ?auto_285208 ?auto_285209 )
      ( MAKE-8CRATE-VERIFY ?auto_285201 ?auto_285202 ?auto_285203 ?auto_285204 ?auto_285205 ?auto_285206 ?auto_285207 ?auto_285208 ?auto_285209 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_285216 - SURFACE
      ?auto_285217 - SURFACE
      ?auto_285218 - SURFACE
      ?auto_285219 - SURFACE
      ?auto_285220 - SURFACE
      ?auto_285221 - SURFACE
      ?auto_285222 - SURFACE
      ?auto_285223 - SURFACE
      ?auto_285224 - SURFACE
      ?auto_285225 - SURFACE
    )
    :vars
    (
      ?auto_285231 - HOIST
      ?auto_285229 - PLACE
      ?auto_285228 - PLACE
      ?auto_285227 - HOIST
      ?auto_285226 - SURFACE
      ?auto_285230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285231 ?auto_285229 ) ( IS-CRATE ?auto_285225 ) ( not ( = ?auto_285224 ?auto_285225 ) ) ( not ( = ?auto_285223 ?auto_285224 ) ) ( not ( = ?auto_285223 ?auto_285225 ) ) ( not ( = ?auto_285228 ?auto_285229 ) ) ( HOIST-AT ?auto_285227 ?auto_285228 ) ( not ( = ?auto_285231 ?auto_285227 ) ) ( AVAILABLE ?auto_285227 ) ( SURFACE-AT ?auto_285225 ?auto_285228 ) ( ON ?auto_285225 ?auto_285226 ) ( CLEAR ?auto_285225 ) ( not ( = ?auto_285224 ?auto_285226 ) ) ( not ( = ?auto_285225 ?auto_285226 ) ) ( not ( = ?auto_285223 ?auto_285226 ) ) ( SURFACE-AT ?auto_285223 ?auto_285229 ) ( CLEAR ?auto_285223 ) ( IS-CRATE ?auto_285224 ) ( AVAILABLE ?auto_285231 ) ( IN ?auto_285224 ?auto_285230 ) ( TRUCK-AT ?auto_285230 ?auto_285228 ) ( ON ?auto_285217 ?auto_285216 ) ( ON ?auto_285218 ?auto_285217 ) ( ON ?auto_285219 ?auto_285218 ) ( ON ?auto_285220 ?auto_285219 ) ( ON ?auto_285221 ?auto_285220 ) ( ON ?auto_285222 ?auto_285221 ) ( ON ?auto_285223 ?auto_285222 ) ( not ( = ?auto_285216 ?auto_285217 ) ) ( not ( = ?auto_285216 ?auto_285218 ) ) ( not ( = ?auto_285216 ?auto_285219 ) ) ( not ( = ?auto_285216 ?auto_285220 ) ) ( not ( = ?auto_285216 ?auto_285221 ) ) ( not ( = ?auto_285216 ?auto_285222 ) ) ( not ( = ?auto_285216 ?auto_285223 ) ) ( not ( = ?auto_285216 ?auto_285224 ) ) ( not ( = ?auto_285216 ?auto_285225 ) ) ( not ( = ?auto_285216 ?auto_285226 ) ) ( not ( = ?auto_285217 ?auto_285218 ) ) ( not ( = ?auto_285217 ?auto_285219 ) ) ( not ( = ?auto_285217 ?auto_285220 ) ) ( not ( = ?auto_285217 ?auto_285221 ) ) ( not ( = ?auto_285217 ?auto_285222 ) ) ( not ( = ?auto_285217 ?auto_285223 ) ) ( not ( = ?auto_285217 ?auto_285224 ) ) ( not ( = ?auto_285217 ?auto_285225 ) ) ( not ( = ?auto_285217 ?auto_285226 ) ) ( not ( = ?auto_285218 ?auto_285219 ) ) ( not ( = ?auto_285218 ?auto_285220 ) ) ( not ( = ?auto_285218 ?auto_285221 ) ) ( not ( = ?auto_285218 ?auto_285222 ) ) ( not ( = ?auto_285218 ?auto_285223 ) ) ( not ( = ?auto_285218 ?auto_285224 ) ) ( not ( = ?auto_285218 ?auto_285225 ) ) ( not ( = ?auto_285218 ?auto_285226 ) ) ( not ( = ?auto_285219 ?auto_285220 ) ) ( not ( = ?auto_285219 ?auto_285221 ) ) ( not ( = ?auto_285219 ?auto_285222 ) ) ( not ( = ?auto_285219 ?auto_285223 ) ) ( not ( = ?auto_285219 ?auto_285224 ) ) ( not ( = ?auto_285219 ?auto_285225 ) ) ( not ( = ?auto_285219 ?auto_285226 ) ) ( not ( = ?auto_285220 ?auto_285221 ) ) ( not ( = ?auto_285220 ?auto_285222 ) ) ( not ( = ?auto_285220 ?auto_285223 ) ) ( not ( = ?auto_285220 ?auto_285224 ) ) ( not ( = ?auto_285220 ?auto_285225 ) ) ( not ( = ?auto_285220 ?auto_285226 ) ) ( not ( = ?auto_285221 ?auto_285222 ) ) ( not ( = ?auto_285221 ?auto_285223 ) ) ( not ( = ?auto_285221 ?auto_285224 ) ) ( not ( = ?auto_285221 ?auto_285225 ) ) ( not ( = ?auto_285221 ?auto_285226 ) ) ( not ( = ?auto_285222 ?auto_285223 ) ) ( not ( = ?auto_285222 ?auto_285224 ) ) ( not ( = ?auto_285222 ?auto_285225 ) ) ( not ( = ?auto_285222 ?auto_285226 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285223 ?auto_285224 ?auto_285225 )
      ( MAKE-9CRATE-VERIFY ?auto_285216 ?auto_285217 ?auto_285218 ?auto_285219 ?auto_285220 ?auto_285221 ?auto_285222 ?auto_285223 ?auto_285224 ?auto_285225 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_285232 - SURFACE
      ?auto_285233 - SURFACE
      ?auto_285234 - SURFACE
      ?auto_285235 - SURFACE
      ?auto_285236 - SURFACE
      ?auto_285237 - SURFACE
      ?auto_285238 - SURFACE
      ?auto_285239 - SURFACE
      ?auto_285240 - SURFACE
      ?auto_285241 - SURFACE
      ?auto_285242 - SURFACE
    )
    :vars
    (
      ?auto_285248 - HOIST
      ?auto_285246 - PLACE
      ?auto_285245 - PLACE
      ?auto_285244 - HOIST
      ?auto_285243 - SURFACE
      ?auto_285247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285248 ?auto_285246 ) ( IS-CRATE ?auto_285242 ) ( not ( = ?auto_285241 ?auto_285242 ) ) ( not ( = ?auto_285240 ?auto_285241 ) ) ( not ( = ?auto_285240 ?auto_285242 ) ) ( not ( = ?auto_285245 ?auto_285246 ) ) ( HOIST-AT ?auto_285244 ?auto_285245 ) ( not ( = ?auto_285248 ?auto_285244 ) ) ( AVAILABLE ?auto_285244 ) ( SURFACE-AT ?auto_285242 ?auto_285245 ) ( ON ?auto_285242 ?auto_285243 ) ( CLEAR ?auto_285242 ) ( not ( = ?auto_285241 ?auto_285243 ) ) ( not ( = ?auto_285242 ?auto_285243 ) ) ( not ( = ?auto_285240 ?auto_285243 ) ) ( SURFACE-AT ?auto_285240 ?auto_285246 ) ( CLEAR ?auto_285240 ) ( IS-CRATE ?auto_285241 ) ( AVAILABLE ?auto_285248 ) ( IN ?auto_285241 ?auto_285247 ) ( TRUCK-AT ?auto_285247 ?auto_285245 ) ( ON ?auto_285233 ?auto_285232 ) ( ON ?auto_285234 ?auto_285233 ) ( ON ?auto_285235 ?auto_285234 ) ( ON ?auto_285236 ?auto_285235 ) ( ON ?auto_285237 ?auto_285236 ) ( ON ?auto_285238 ?auto_285237 ) ( ON ?auto_285239 ?auto_285238 ) ( ON ?auto_285240 ?auto_285239 ) ( not ( = ?auto_285232 ?auto_285233 ) ) ( not ( = ?auto_285232 ?auto_285234 ) ) ( not ( = ?auto_285232 ?auto_285235 ) ) ( not ( = ?auto_285232 ?auto_285236 ) ) ( not ( = ?auto_285232 ?auto_285237 ) ) ( not ( = ?auto_285232 ?auto_285238 ) ) ( not ( = ?auto_285232 ?auto_285239 ) ) ( not ( = ?auto_285232 ?auto_285240 ) ) ( not ( = ?auto_285232 ?auto_285241 ) ) ( not ( = ?auto_285232 ?auto_285242 ) ) ( not ( = ?auto_285232 ?auto_285243 ) ) ( not ( = ?auto_285233 ?auto_285234 ) ) ( not ( = ?auto_285233 ?auto_285235 ) ) ( not ( = ?auto_285233 ?auto_285236 ) ) ( not ( = ?auto_285233 ?auto_285237 ) ) ( not ( = ?auto_285233 ?auto_285238 ) ) ( not ( = ?auto_285233 ?auto_285239 ) ) ( not ( = ?auto_285233 ?auto_285240 ) ) ( not ( = ?auto_285233 ?auto_285241 ) ) ( not ( = ?auto_285233 ?auto_285242 ) ) ( not ( = ?auto_285233 ?auto_285243 ) ) ( not ( = ?auto_285234 ?auto_285235 ) ) ( not ( = ?auto_285234 ?auto_285236 ) ) ( not ( = ?auto_285234 ?auto_285237 ) ) ( not ( = ?auto_285234 ?auto_285238 ) ) ( not ( = ?auto_285234 ?auto_285239 ) ) ( not ( = ?auto_285234 ?auto_285240 ) ) ( not ( = ?auto_285234 ?auto_285241 ) ) ( not ( = ?auto_285234 ?auto_285242 ) ) ( not ( = ?auto_285234 ?auto_285243 ) ) ( not ( = ?auto_285235 ?auto_285236 ) ) ( not ( = ?auto_285235 ?auto_285237 ) ) ( not ( = ?auto_285235 ?auto_285238 ) ) ( not ( = ?auto_285235 ?auto_285239 ) ) ( not ( = ?auto_285235 ?auto_285240 ) ) ( not ( = ?auto_285235 ?auto_285241 ) ) ( not ( = ?auto_285235 ?auto_285242 ) ) ( not ( = ?auto_285235 ?auto_285243 ) ) ( not ( = ?auto_285236 ?auto_285237 ) ) ( not ( = ?auto_285236 ?auto_285238 ) ) ( not ( = ?auto_285236 ?auto_285239 ) ) ( not ( = ?auto_285236 ?auto_285240 ) ) ( not ( = ?auto_285236 ?auto_285241 ) ) ( not ( = ?auto_285236 ?auto_285242 ) ) ( not ( = ?auto_285236 ?auto_285243 ) ) ( not ( = ?auto_285237 ?auto_285238 ) ) ( not ( = ?auto_285237 ?auto_285239 ) ) ( not ( = ?auto_285237 ?auto_285240 ) ) ( not ( = ?auto_285237 ?auto_285241 ) ) ( not ( = ?auto_285237 ?auto_285242 ) ) ( not ( = ?auto_285237 ?auto_285243 ) ) ( not ( = ?auto_285238 ?auto_285239 ) ) ( not ( = ?auto_285238 ?auto_285240 ) ) ( not ( = ?auto_285238 ?auto_285241 ) ) ( not ( = ?auto_285238 ?auto_285242 ) ) ( not ( = ?auto_285238 ?auto_285243 ) ) ( not ( = ?auto_285239 ?auto_285240 ) ) ( not ( = ?auto_285239 ?auto_285241 ) ) ( not ( = ?auto_285239 ?auto_285242 ) ) ( not ( = ?auto_285239 ?auto_285243 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285240 ?auto_285241 ?auto_285242 )
      ( MAKE-10CRATE-VERIFY ?auto_285232 ?auto_285233 ?auto_285234 ?auto_285235 ?auto_285236 ?auto_285237 ?auto_285238 ?auto_285239 ?auto_285240 ?auto_285241 ?auto_285242 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_285249 - SURFACE
      ?auto_285250 - SURFACE
    )
    :vars
    (
      ?auto_285257 - HOIST
      ?auto_285255 - PLACE
      ?auto_285253 - SURFACE
      ?auto_285254 - PLACE
      ?auto_285252 - HOIST
      ?auto_285251 - SURFACE
      ?auto_285256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285257 ?auto_285255 ) ( IS-CRATE ?auto_285250 ) ( not ( = ?auto_285249 ?auto_285250 ) ) ( not ( = ?auto_285253 ?auto_285249 ) ) ( not ( = ?auto_285253 ?auto_285250 ) ) ( not ( = ?auto_285254 ?auto_285255 ) ) ( HOIST-AT ?auto_285252 ?auto_285254 ) ( not ( = ?auto_285257 ?auto_285252 ) ) ( SURFACE-AT ?auto_285250 ?auto_285254 ) ( ON ?auto_285250 ?auto_285251 ) ( CLEAR ?auto_285250 ) ( not ( = ?auto_285249 ?auto_285251 ) ) ( not ( = ?auto_285250 ?auto_285251 ) ) ( not ( = ?auto_285253 ?auto_285251 ) ) ( SURFACE-AT ?auto_285253 ?auto_285255 ) ( CLEAR ?auto_285253 ) ( IS-CRATE ?auto_285249 ) ( AVAILABLE ?auto_285257 ) ( TRUCK-AT ?auto_285256 ?auto_285254 ) ( LIFTING ?auto_285252 ?auto_285249 ) )
    :subtasks
    ( ( !LOAD ?auto_285252 ?auto_285249 ?auto_285256 ?auto_285254 )
      ( MAKE-2CRATE ?auto_285253 ?auto_285249 ?auto_285250 )
      ( MAKE-1CRATE-VERIFY ?auto_285249 ?auto_285250 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_285258 - SURFACE
      ?auto_285259 - SURFACE
      ?auto_285260 - SURFACE
    )
    :vars
    (
      ?auto_285262 - HOIST
      ?auto_285263 - PLACE
      ?auto_285261 - PLACE
      ?auto_285265 - HOIST
      ?auto_285266 - SURFACE
      ?auto_285264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285262 ?auto_285263 ) ( IS-CRATE ?auto_285260 ) ( not ( = ?auto_285259 ?auto_285260 ) ) ( not ( = ?auto_285258 ?auto_285259 ) ) ( not ( = ?auto_285258 ?auto_285260 ) ) ( not ( = ?auto_285261 ?auto_285263 ) ) ( HOIST-AT ?auto_285265 ?auto_285261 ) ( not ( = ?auto_285262 ?auto_285265 ) ) ( SURFACE-AT ?auto_285260 ?auto_285261 ) ( ON ?auto_285260 ?auto_285266 ) ( CLEAR ?auto_285260 ) ( not ( = ?auto_285259 ?auto_285266 ) ) ( not ( = ?auto_285260 ?auto_285266 ) ) ( not ( = ?auto_285258 ?auto_285266 ) ) ( SURFACE-AT ?auto_285258 ?auto_285263 ) ( CLEAR ?auto_285258 ) ( IS-CRATE ?auto_285259 ) ( AVAILABLE ?auto_285262 ) ( TRUCK-AT ?auto_285264 ?auto_285261 ) ( LIFTING ?auto_285265 ?auto_285259 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_285259 ?auto_285260 )
      ( MAKE-2CRATE-VERIFY ?auto_285258 ?auto_285259 ?auto_285260 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_285267 - SURFACE
      ?auto_285268 - SURFACE
      ?auto_285269 - SURFACE
      ?auto_285270 - SURFACE
    )
    :vars
    (
      ?auto_285272 - HOIST
      ?auto_285273 - PLACE
      ?auto_285271 - PLACE
      ?auto_285276 - HOIST
      ?auto_285274 - SURFACE
      ?auto_285275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285272 ?auto_285273 ) ( IS-CRATE ?auto_285270 ) ( not ( = ?auto_285269 ?auto_285270 ) ) ( not ( = ?auto_285268 ?auto_285269 ) ) ( not ( = ?auto_285268 ?auto_285270 ) ) ( not ( = ?auto_285271 ?auto_285273 ) ) ( HOIST-AT ?auto_285276 ?auto_285271 ) ( not ( = ?auto_285272 ?auto_285276 ) ) ( SURFACE-AT ?auto_285270 ?auto_285271 ) ( ON ?auto_285270 ?auto_285274 ) ( CLEAR ?auto_285270 ) ( not ( = ?auto_285269 ?auto_285274 ) ) ( not ( = ?auto_285270 ?auto_285274 ) ) ( not ( = ?auto_285268 ?auto_285274 ) ) ( SURFACE-AT ?auto_285268 ?auto_285273 ) ( CLEAR ?auto_285268 ) ( IS-CRATE ?auto_285269 ) ( AVAILABLE ?auto_285272 ) ( TRUCK-AT ?auto_285275 ?auto_285271 ) ( LIFTING ?auto_285276 ?auto_285269 ) ( ON ?auto_285268 ?auto_285267 ) ( not ( = ?auto_285267 ?auto_285268 ) ) ( not ( = ?auto_285267 ?auto_285269 ) ) ( not ( = ?auto_285267 ?auto_285270 ) ) ( not ( = ?auto_285267 ?auto_285274 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285268 ?auto_285269 ?auto_285270 )
      ( MAKE-3CRATE-VERIFY ?auto_285267 ?auto_285268 ?auto_285269 ?auto_285270 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_285277 - SURFACE
      ?auto_285278 - SURFACE
      ?auto_285279 - SURFACE
      ?auto_285280 - SURFACE
      ?auto_285281 - SURFACE
    )
    :vars
    (
      ?auto_285283 - HOIST
      ?auto_285284 - PLACE
      ?auto_285282 - PLACE
      ?auto_285287 - HOIST
      ?auto_285285 - SURFACE
      ?auto_285286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285283 ?auto_285284 ) ( IS-CRATE ?auto_285281 ) ( not ( = ?auto_285280 ?auto_285281 ) ) ( not ( = ?auto_285279 ?auto_285280 ) ) ( not ( = ?auto_285279 ?auto_285281 ) ) ( not ( = ?auto_285282 ?auto_285284 ) ) ( HOIST-AT ?auto_285287 ?auto_285282 ) ( not ( = ?auto_285283 ?auto_285287 ) ) ( SURFACE-AT ?auto_285281 ?auto_285282 ) ( ON ?auto_285281 ?auto_285285 ) ( CLEAR ?auto_285281 ) ( not ( = ?auto_285280 ?auto_285285 ) ) ( not ( = ?auto_285281 ?auto_285285 ) ) ( not ( = ?auto_285279 ?auto_285285 ) ) ( SURFACE-AT ?auto_285279 ?auto_285284 ) ( CLEAR ?auto_285279 ) ( IS-CRATE ?auto_285280 ) ( AVAILABLE ?auto_285283 ) ( TRUCK-AT ?auto_285286 ?auto_285282 ) ( LIFTING ?auto_285287 ?auto_285280 ) ( ON ?auto_285278 ?auto_285277 ) ( ON ?auto_285279 ?auto_285278 ) ( not ( = ?auto_285277 ?auto_285278 ) ) ( not ( = ?auto_285277 ?auto_285279 ) ) ( not ( = ?auto_285277 ?auto_285280 ) ) ( not ( = ?auto_285277 ?auto_285281 ) ) ( not ( = ?auto_285277 ?auto_285285 ) ) ( not ( = ?auto_285278 ?auto_285279 ) ) ( not ( = ?auto_285278 ?auto_285280 ) ) ( not ( = ?auto_285278 ?auto_285281 ) ) ( not ( = ?auto_285278 ?auto_285285 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285279 ?auto_285280 ?auto_285281 )
      ( MAKE-4CRATE-VERIFY ?auto_285277 ?auto_285278 ?auto_285279 ?auto_285280 ?auto_285281 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_285288 - SURFACE
      ?auto_285289 - SURFACE
      ?auto_285290 - SURFACE
      ?auto_285291 - SURFACE
      ?auto_285292 - SURFACE
      ?auto_285293 - SURFACE
    )
    :vars
    (
      ?auto_285295 - HOIST
      ?auto_285296 - PLACE
      ?auto_285294 - PLACE
      ?auto_285299 - HOIST
      ?auto_285297 - SURFACE
      ?auto_285298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285295 ?auto_285296 ) ( IS-CRATE ?auto_285293 ) ( not ( = ?auto_285292 ?auto_285293 ) ) ( not ( = ?auto_285291 ?auto_285292 ) ) ( not ( = ?auto_285291 ?auto_285293 ) ) ( not ( = ?auto_285294 ?auto_285296 ) ) ( HOIST-AT ?auto_285299 ?auto_285294 ) ( not ( = ?auto_285295 ?auto_285299 ) ) ( SURFACE-AT ?auto_285293 ?auto_285294 ) ( ON ?auto_285293 ?auto_285297 ) ( CLEAR ?auto_285293 ) ( not ( = ?auto_285292 ?auto_285297 ) ) ( not ( = ?auto_285293 ?auto_285297 ) ) ( not ( = ?auto_285291 ?auto_285297 ) ) ( SURFACE-AT ?auto_285291 ?auto_285296 ) ( CLEAR ?auto_285291 ) ( IS-CRATE ?auto_285292 ) ( AVAILABLE ?auto_285295 ) ( TRUCK-AT ?auto_285298 ?auto_285294 ) ( LIFTING ?auto_285299 ?auto_285292 ) ( ON ?auto_285289 ?auto_285288 ) ( ON ?auto_285290 ?auto_285289 ) ( ON ?auto_285291 ?auto_285290 ) ( not ( = ?auto_285288 ?auto_285289 ) ) ( not ( = ?auto_285288 ?auto_285290 ) ) ( not ( = ?auto_285288 ?auto_285291 ) ) ( not ( = ?auto_285288 ?auto_285292 ) ) ( not ( = ?auto_285288 ?auto_285293 ) ) ( not ( = ?auto_285288 ?auto_285297 ) ) ( not ( = ?auto_285289 ?auto_285290 ) ) ( not ( = ?auto_285289 ?auto_285291 ) ) ( not ( = ?auto_285289 ?auto_285292 ) ) ( not ( = ?auto_285289 ?auto_285293 ) ) ( not ( = ?auto_285289 ?auto_285297 ) ) ( not ( = ?auto_285290 ?auto_285291 ) ) ( not ( = ?auto_285290 ?auto_285292 ) ) ( not ( = ?auto_285290 ?auto_285293 ) ) ( not ( = ?auto_285290 ?auto_285297 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285291 ?auto_285292 ?auto_285293 )
      ( MAKE-5CRATE-VERIFY ?auto_285288 ?auto_285289 ?auto_285290 ?auto_285291 ?auto_285292 ?auto_285293 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_285300 - SURFACE
      ?auto_285301 - SURFACE
      ?auto_285302 - SURFACE
      ?auto_285303 - SURFACE
      ?auto_285304 - SURFACE
      ?auto_285305 - SURFACE
      ?auto_285306 - SURFACE
    )
    :vars
    (
      ?auto_285308 - HOIST
      ?auto_285309 - PLACE
      ?auto_285307 - PLACE
      ?auto_285312 - HOIST
      ?auto_285310 - SURFACE
      ?auto_285311 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285308 ?auto_285309 ) ( IS-CRATE ?auto_285306 ) ( not ( = ?auto_285305 ?auto_285306 ) ) ( not ( = ?auto_285304 ?auto_285305 ) ) ( not ( = ?auto_285304 ?auto_285306 ) ) ( not ( = ?auto_285307 ?auto_285309 ) ) ( HOIST-AT ?auto_285312 ?auto_285307 ) ( not ( = ?auto_285308 ?auto_285312 ) ) ( SURFACE-AT ?auto_285306 ?auto_285307 ) ( ON ?auto_285306 ?auto_285310 ) ( CLEAR ?auto_285306 ) ( not ( = ?auto_285305 ?auto_285310 ) ) ( not ( = ?auto_285306 ?auto_285310 ) ) ( not ( = ?auto_285304 ?auto_285310 ) ) ( SURFACE-AT ?auto_285304 ?auto_285309 ) ( CLEAR ?auto_285304 ) ( IS-CRATE ?auto_285305 ) ( AVAILABLE ?auto_285308 ) ( TRUCK-AT ?auto_285311 ?auto_285307 ) ( LIFTING ?auto_285312 ?auto_285305 ) ( ON ?auto_285301 ?auto_285300 ) ( ON ?auto_285302 ?auto_285301 ) ( ON ?auto_285303 ?auto_285302 ) ( ON ?auto_285304 ?auto_285303 ) ( not ( = ?auto_285300 ?auto_285301 ) ) ( not ( = ?auto_285300 ?auto_285302 ) ) ( not ( = ?auto_285300 ?auto_285303 ) ) ( not ( = ?auto_285300 ?auto_285304 ) ) ( not ( = ?auto_285300 ?auto_285305 ) ) ( not ( = ?auto_285300 ?auto_285306 ) ) ( not ( = ?auto_285300 ?auto_285310 ) ) ( not ( = ?auto_285301 ?auto_285302 ) ) ( not ( = ?auto_285301 ?auto_285303 ) ) ( not ( = ?auto_285301 ?auto_285304 ) ) ( not ( = ?auto_285301 ?auto_285305 ) ) ( not ( = ?auto_285301 ?auto_285306 ) ) ( not ( = ?auto_285301 ?auto_285310 ) ) ( not ( = ?auto_285302 ?auto_285303 ) ) ( not ( = ?auto_285302 ?auto_285304 ) ) ( not ( = ?auto_285302 ?auto_285305 ) ) ( not ( = ?auto_285302 ?auto_285306 ) ) ( not ( = ?auto_285302 ?auto_285310 ) ) ( not ( = ?auto_285303 ?auto_285304 ) ) ( not ( = ?auto_285303 ?auto_285305 ) ) ( not ( = ?auto_285303 ?auto_285306 ) ) ( not ( = ?auto_285303 ?auto_285310 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285304 ?auto_285305 ?auto_285306 )
      ( MAKE-6CRATE-VERIFY ?auto_285300 ?auto_285301 ?auto_285302 ?auto_285303 ?auto_285304 ?auto_285305 ?auto_285306 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_285313 - SURFACE
      ?auto_285314 - SURFACE
      ?auto_285315 - SURFACE
      ?auto_285316 - SURFACE
      ?auto_285317 - SURFACE
      ?auto_285318 - SURFACE
      ?auto_285319 - SURFACE
      ?auto_285320 - SURFACE
    )
    :vars
    (
      ?auto_285322 - HOIST
      ?auto_285323 - PLACE
      ?auto_285321 - PLACE
      ?auto_285326 - HOIST
      ?auto_285324 - SURFACE
      ?auto_285325 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285322 ?auto_285323 ) ( IS-CRATE ?auto_285320 ) ( not ( = ?auto_285319 ?auto_285320 ) ) ( not ( = ?auto_285318 ?auto_285319 ) ) ( not ( = ?auto_285318 ?auto_285320 ) ) ( not ( = ?auto_285321 ?auto_285323 ) ) ( HOIST-AT ?auto_285326 ?auto_285321 ) ( not ( = ?auto_285322 ?auto_285326 ) ) ( SURFACE-AT ?auto_285320 ?auto_285321 ) ( ON ?auto_285320 ?auto_285324 ) ( CLEAR ?auto_285320 ) ( not ( = ?auto_285319 ?auto_285324 ) ) ( not ( = ?auto_285320 ?auto_285324 ) ) ( not ( = ?auto_285318 ?auto_285324 ) ) ( SURFACE-AT ?auto_285318 ?auto_285323 ) ( CLEAR ?auto_285318 ) ( IS-CRATE ?auto_285319 ) ( AVAILABLE ?auto_285322 ) ( TRUCK-AT ?auto_285325 ?auto_285321 ) ( LIFTING ?auto_285326 ?auto_285319 ) ( ON ?auto_285314 ?auto_285313 ) ( ON ?auto_285315 ?auto_285314 ) ( ON ?auto_285316 ?auto_285315 ) ( ON ?auto_285317 ?auto_285316 ) ( ON ?auto_285318 ?auto_285317 ) ( not ( = ?auto_285313 ?auto_285314 ) ) ( not ( = ?auto_285313 ?auto_285315 ) ) ( not ( = ?auto_285313 ?auto_285316 ) ) ( not ( = ?auto_285313 ?auto_285317 ) ) ( not ( = ?auto_285313 ?auto_285318 ) ) ( not ( = ?auto_285313 ?auto_285319 ) ) ( not ( = ?auto_285313 ?auto_285320 ) ) ( not ( = ?auto_285313 ?auto_285324 ) ) ( not ( = ?auto_285314 ?auto_285315 ) ) ( not ( = ?auto_285314 ?auto_285316 ) ) ( not ( = ?auto_285314 ?auto_285317 ) ) ( not ( = ?auto_285314 ?auto_285318 ) ) ( not ( = ?auto_285314 ?auto_285319 ) ) ( not ( = ?auto_285314 ?auto_285320 ) ) ( not ( = ?auto_285314 ?auto_285324 ) ) ( not ( = ?auto_285315 ?auto_285316 ) ) ( not ( = ?auto_285315 ?auto_285317 ) ) ( not ( = ?auto_285315 ?auto_285318 ) ) ( not ( = ?auto_285315 ?auto_285319 ) ) ( not ( = ?auto_285315 ?auto_285320 ) ) ( not ( = ?auto_285315 ?auto_285324 ) ) ( not ( = ?auto_285316 ?auto_285317 ) ) ( not ( = ?auto_285316 ?auto_285318 ) ) ( not ( = ?auto_285316 ?auto_285319 ) ) ( not ( = ?auto_285316 ?auto_285320 ) ) ( not ( = ?auto_285316 ?auto_285324 ) ) ( not ( = ?auto_285317 ?auto_285318 ) ) ( not ( = ?auto_285317 ?auto_285319 ) ) ( not ( = ?auto_285317 ?auto_285320 ) ) ( not ( = ?auto_285317 ?auto_285324 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285318 ?auto_285319 ?auto_285320 )
      ( MAKE-7CRATE-VERIFY ?auto_285313 ?auto_285314 ?auto_285315 ?auto_285316 ?auto_285317 ?auto_285318 ?auto_285319 ?auto_285320 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_285327 - SURFACE
      ?auto_285328 - SURFACE
      ?auto_285329 - SURFACE
      ?auto_285330 - SURFACE
      ?auto_285331 - SURFACE
      ?auto_285332 - SURFACE
      ?auto_285333 - SURFACE
      ?auto_285334 - SURFACE
      ?auto_285335 - SURFACE
    )
    :vars
    (
      ?auto_285337 - HOIST
      ?auto_285338 - PLACE
      ?auto_285336 - PLACE
      ?auto_285341 - HOIST
      ?auto_285339 - SURFACE
      ?auto_285340 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285337 ?auto_285338 ) ( IS-CRATE ?auto_285335 ) ( not ( = ?auto_285334 ?auto_285335 ) ) ( not ( = ?auto_285333 ?auto_285334 ) ) ( not ( = ?auto_285333 ?auto_285335 ) ) ( not ( = ?auto_285336 ?auto_285338 ) ) ( HOIST-AT ?auto_285341 ?auto_285336 ) ( not ( = ?auto_285337 ?auto_285341 ) ) ( SURFACE-AT ?auto_285335 ?auto_285336 ) ( ON ?auto_285335 ?auto_285339 ) ( CLEAR ?auto_285335 ) ( not ( = ?auto_285334 ?auto_285339 ) ) ( not ( = ?auto_285335 ?auto_285339 ) ) ( not ( = ?auto_285333 ?auto_285339 ) ) ( SURFACE-AT ?auto_285333 ?auto_285338 ) ( CLEAR ?auto_285333 ) ( IS-CRATE ?auto_285334 ) ( AVAILABLE ?auto_285337 ) ( TRUCK-AT ?auto_285340 ?auto_285336 ) ( LIFTING ?auto_285341 ?auto_285334 ) ( ON ?auto_285328 ?auto_285327 ) ( ON ?auto_285329 ?auto_285328 ) ( ON ?auto_285330 ?auto_285329 ) ( ON ?auto_285331 ?auto_285330 ) ( ON ?auto_285332 ?auto_285331 ) ( ON ?auto_285333 ?auto_285332 ) ( not ( = ?auto_285327 ?auto_285328 ) ) ( not ( = ?auto_285327 ?auto_285329 ) ) ( not ( = ?auto_285327 ?auto_285330 ) ) ( not ( = ?auto_285327 ?auto_285331 ) ) ( not ( = ?auto_285327 ?auto_285332 ) ) ( not ( = ?auto_285327 ?auto_285333 ) ) ( not ( = ?auto_285327 ?auto_285334 ) ) ( not ( = ?auto_285327 ?auto_285335 ) ) ( not ( = ?auto_285327 ?auto_285339 ) ) ( not ( = ?auto_285328 ?auto_285329 ) ) ( not ( = ?auto_285328 ?auto_285330 ) ) ( not ( = ?auto_285328 ?auto_285331 ) ) ( not ( = ?auto_285328 ?auto_285332 ) ) ( not ( = ?auto_285328 ?auto_285333 ) ) ( not ( = ?auto_285328 ?auto_285334 ) ) ( not ( = ?auto_285328 ?auto_285335 ) ) ( not ( = ?auto_285328 ?auto_285339 ) ) ( not ( = ?auto_285329 ?auto_285330 ) ) ( not ( = ?auto_285329 ?auto_285331 ) ) ( not ( = ?auto_285329 ?auto_285332 ) ) ( not ( = ?auto_285329 ?auto_285333 ) ) ( not ( = ?auto_285329 ?auto_285334 ) ) ( not ( = ?auto_285329 ?auto_285335 ) ) ( not ( = ?auto_285329 ?auto_285339 ) ) ( not ( = ?auto_285330 ?auto_285331 ) ) ( not ( = ?auto_285330 ?auto_285332 ) ) ( not ( = ?auto_285330 ?auto_285333 ) ) ( not ( = ?auto_285330 ?auto_285334 ) ) ( not ( = ?auto_285330 ?auto_285335 ) ) ( not ( = ?auto_285330 ?auto_285339 ) ) ( not ( = ?auto_285331 ?auto_285332 ) ) ( not ( = ?auto_285331 ?auto_285333 ) ) ( not ( = ?auto_285331 ?auto_285334 ) ) ( not ( = ?auto_285331 ?auto_285335 ) ) ( not ( = ?auto_285331 ?auto_285339 ) ) ( not ( = ?auto_285332 ?auto_285333 ) ) ( not ( = ?auto_285332 ?auto_285334 ) ) ( not ( = ?auto_285332 ?auto_285335 ) ) ( not ( = ?auto_285332 ?auto_285339 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285333 ?auto_285334 ?auto_285335 )
      ( MAKE-8CRATE-VERIFY ?auto_285327 ?auto_285328 ?auto_285329 ?auto_285330 ?auto_285331 ?auto_285332 ?auto_285333 ?auto_285334 ?auto_285335 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_285342 - SURFACE
      ?auto_285343 - SURFACE
      ?auto_285344 - SURFACE
      ?auto_285345 - SURFACE
      ?auto_285346 - SURFACE
      ?auto_285347 - SURFACE
      ?auto_285348 - SURFACE
      ?auto_285349 - SURFACE
      ?auto_285350 - SURFACE
      ?auto_285351 - SURFACE
    )
    :vars
    (
      ?auto_285353 - HOIST
      ?auto_285354 - PLACE
      ?auto_285352 - PLACE
      ?auto_285357 - HOIST
      ?auto_285355 - SURFACE
      ?auto_285356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285353 ?auto_285354 ) ( IS-CRATE ?auto_285351 ) ( not ( = ?auto_285350 ?auto_285351 ) ) ( not ( = ?auto_285349 ?auto_285350 ) ) ( not ( = ?auto_285349 ?auto_285351 ) ) ( not ( = ?auto_285352 ?auto_285354 ) ) ( HOIST-AT ?auto_285357 ?auto_285352 ) ( not ( = ?auto_285353 ?auto_285357 ) ) ( SURFACE-AT ?auto_285351 ?auto_285352 ) ( ON ?auto_285351 ?auto_285355 ) ( CLEAR ?auto_285351 ) ( not ( = ?auto_285350 ?auto_285355 ) ) ( not ( = ?auto_285351 ?auto_285355 ) ) ( not ( = ?auto_285349 ?auto_285355 ) ) ( SURFACE-AT ?auto_285349 ?auto_285354 ) ( CLEAR ?auto_285349 ) ( IS-CRATE ?auto_285350 ) ( AVAILABLE ?auto_285353 ) ( TRUCK-AT ?auto_285356 ?auto_285352 ) ( LIFTING ?auto_285357 ?auto_285350 ) ( ON ?auto_285343 ?auto_285342 ) ( ON ?auto_285344 ?auto_285343 ) ( ON ?auto_285345 ?auto_285344 ) ( ON ?auto_285346 ?auto_285345 ) ( ON ?auto_285347 ?auto_285346 ) ( ON ?auto_285348 ?auto_285347 ) ( ON ?auto_285349 ?auto_285348 ) ( not ( = ?auto_285342 ?auto_285343 ) ) ( not ( = ?auto_285342 ?auto_285344 ) ) ( not ( = ?auto_285342 ?auto_285345 ) ) ( not ( = ?auto_285342 ?auto_285346 ) ) ( not ( = ?auto_285342 ?auto_285347 ) ) ( not ( = ?auto_285342 ?auto_285348 ) ) ( not ( = ?auto_285342 ?auto_285349 ) ) ( not ( = ?auto_285342 ?auto_285350 ) ) ( not ( = ?auto_285342 ?auto_285351 ) ) ( not ( = ?auto_285342 ?auto_285355 ) ) ( not ( = ?auto_285343 ?auto_285344 ) ) ( not ( = ?auto_285343 ?auto_285345 ) ) ( not ( = ?auto_285343 ?auto_285346 ) ) ( not ( = ?auto_285343 ?auto_285347 ) ) ( not ( = ?auto_285343 ?auto_285348 ) ) ( not ( = ?auto_285343 ?auto_285349 ) ) ( not ( = ?auto_285343 ?auto_285350 ) ) ( not ( = ?auto_285343 ?auto_285351 ) ) ( not ( = ?auto_285343 ?auto_285355 ) ) ( not ( = ?auto_285344 ?auto_285345 ) ) ( not ( = ?auto_285344 ?auto_285346 ) ) ( not ( = ?auto_285344 ?auto_285347 ) ) ( not ( = ?auto_285344 ?auto_285348 ) ) ( not ( = ?auto_285344 ?auto_285349 ) ) ( not ( = ?auto_285344 ?auto_285350 ) ) ( not ( = ?auto_285344 ?auto_285351 ) ) ( not ( = ?auto_285344 ?auto_285355 ) ) ( not ( = ?auto_285345 ?auto_285346 ) ) ( not ( = ?auto_285345 ?auto_285347 ) ) ( not ( = ?auto_285345 ?auto_285348 ) ) ( not ( = ?auto_285345 ?auto_285349 ) ) ( not ( = ?auto_285345 ?auto_285350 ) ) ( not ( = ?auto_285345 ?auto_285351 ) ) ( not ( = ?auto_285345 ?auto_285355 ) ) ( not ( = ?auto_285346 ?auto_285347 ) ) ( not ( = ?auto_285346 ?auto_285348 ) ) ( not ( = ?auto_285346 ?auto_285349 ) ) ( not ( = ?auto_285346 ?auto_285350 ) ) ( not ( = ?auto_285346 ?auto_285351 ) ) ( not ( = ?auto_285346 ?auto_285355 ) ) ( not ( = ?auto_285347 ?auto_285348 ) ) ( not ( = ?auto_285347 ?auto_285349 ) ) ( not ( = ?auto_285347 ?auto_285350 ) ) ( not ( = ?auto_285347 ?auto_285351 ) ) ( not ( = ?auto_285347 ?auto_285355 ) ) ( not ( = ?auto_285348 ?auto_285349 ) ) ( not ( = ?auto_285348 ?auto_285350 ) ) ( not ( = ?auto_285348 ?auto_285351 ) ) ( not ( = ?auto_285348 ?auto_285355 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285349 ?auto_285350 ?auto_285351 )
      ( MAKE-9CRATE-VERIFY ?auto_285342 ?auto_285343 ?auto_285344 ?auto_285345 ?auto_285346 ?auto_285347 ?auto_285348 ?auto_285349 ?auto_285350 ?auto_285351 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_285358 - SURFACE
      ?auto_285359 - SURFACE
      ?auto_285360 - SURFACE
      ?auto_285361 - SURFACE
      ?auto_285362 - SURFACE
      ?auto_285363 - SURFACE
      ?auto_285364 - SURFACE
      ?auto_285365 - SURFACE
      ?auto_285366 - SURFACE
      ?auto_285367 - SURFACE
      ?auto_285368 - SURFACE
    )
    :vars
    (
      ?auto_285370 - HOIST
      ?auto_285371 - PLACE
      ?auto_285369 - PLACE
      ?auto_285374 - HOIST
      ?auto_285372 - SURFACE
      ?auto_285373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285370 ?auto_285371 ) ( IS-CRATE ?auto_285368 ) ( not ( = ?auto_285367 ?auto_285368 ) ) ( not ( = ?auto_285366 ?auto_285367 ) ) ( not ( = ?auto_285366 ?auto_285368 ) ) ( not ( = ?auto_285369 ?auto_285371 ) ) ( HOIST-AT ?auto_285374 ?auto_285369 ) ( not ( = ?auto_285370 ?auto_285374 ) ) ( SURFACE-AT ?auto_285368 ?auto_285369 ) ( ON ?auto_285368 ?auto_285372 ) ( CLEAR ?auto_285368 ) ( not ( = ?auto_285367 ?auto_285372 ) ) ( not ( = ?auto_285368 ?auto_285372 ) ) ( not ( = ?auto_285366 ?auto_285372 ) ) ( SURFACE-AT ?auto_285366 ?auto_285371 ) ( CLEAR ?auto_285366 ) ( IS-CRATE ?auto_285367 ) ( AVAILABLE ?auto_285370 ) ( TRUCK-AT ?auto_285373 ?auto_285369 ) ( LIFTING ?auto_285374 ?auto_285367 ) ( ON ?auto_285359 ?auto_285358 ) ( ON ?auto_285360 ?auto_285359 ) ( ON ?auto_285361 ?auto_285360 ) ( ON ?auto_285362 ?auto_285361 ) ( ON ?auto_285363 ?auto_285362 ) ( ON ?auto_285364 ?auto_285363 ) ( ON ?auto_285365 ?auto_285364 ) ( ON ?auto_285366 ?auto_285365 ) ( not ( = ?auto_285358 ?auto_285359 ) ) ( not ( = ?auto_285358 ?auto_285360 ) ) ( not ( = ?auto_285358 ?auto_285361 ) ) ( not ( = ?auto_285358 ?auto_285362 ) ) ( not ( = ?auto_285358 ?auto_285363 ) ) ( not ( = ?auto_285358 ?auto_285364 ) ) ( not ( = ?auto_285358 ?auto_285365 ) ) ( not ( = ?auto_285358 ?auto_285366 ) ) ( not ( = ?auto_285358 ?auto_285367 ) ) ( not ( = ?auto_285358 ?auto_285368 ) ) ( not ( = ?auto_285358 ?auto_285372 ) ) ( not ( = ?auto_285359 ?auto_285360 ) ) ( not ( = ?auto_285359 ?auto_285361 ) ) ( not ( = ?auto_285359 ?auto_285362 ) ) ( not ( = ?auto_285359 ?auto_285363 ) ) ( not ( = ?auto_285359 ?auto_285364 ) ) ( not ( = ?auto_285359 ?auto_285365 ) ) ( not ( = ?auto_285359 ?auto_285366 ) ) ( not ( = ?auto_285359 ?auto_285367 ) ) ( not ( = ?auto_285359 ?auto_285368 ) ) ( not ( = ?auto_285359 ?auto_285372 ) ) ( not ( = ?auto_285360 ?auto_285361 ) ) ( not ( = ?auto_285360 ?auto_285362 ) ) ( not ( = ?auto_285360 ?auto_285363 ) ) ( not ( = ?auto_285360 ?auto_285364 ) ) ( not ( = ?auto_285360 ?auto_285365 ) ) ( not ( = ?auto_285360 ?auto_285366 ) ) ( not ( = ?auto_285360 ?auto_285367 ) ) ( not ( = ?auto_285360 ?auto_285368 ) ) ( not ( = ?auto_285360 ?auto_285372 ) ) ( not ( = ?auto_285361 ?auto_285362 ) ) ( not ( = ?auto_285361 ?auto_285363 ) ) ( not ( = ?auto_285361 ?auto_285364 ) ) ( not ( = ?auto_285361 ?auto_285365 ) ) ( not ( = ?auto_285361 ?auto_285366 ) ) ( not ( = ?auto_285361 ?auto_285367 ) ) ( not ( = ?auto_285361 ?auto_285368 ) ) ( not ( = ?auto_285361 ?auto_285372 ) ) ( not ( = ?auto_285362 ?auto_285363 ) ) ( not ( = ?auto_285362 ?auto_285364 ) ) ( not ( = ?auto_285362 ?auto_285365 ) ) ( not ( = ?auto_285362 ?auto_285366 ) ) ( not ( = ?auto_285362 ?auto_285367 ) ) ( not ( = ?auto_285362 ?auto_285368 ) ) ( not ( = ?auto_285362 ?auto_285372 ) ) ( not ( = ?auto_285363 ?auto_285364 ) ) ( not ( = ?auto_285363 ?auto_285365 ) ) ( not ( = ?auto_285363 ?auto_285366 ) ) ( not ( = ?auto_285363 ?auto_285367 ) ) ( not ( = ?auto_285363 ?auto_285368 ) ) ( not ( = ?auto_285363 ?auto_285372 ) ) ( not ( = ?auto_285364 ?auto_285365 ) ) ( not ( = ?auto_285364 ?auto_285366 ) ) ( not ( = ?auto_285364 ?auto_285367 ) ) ( not ( = ?auto_285364 ?auto_285368 ) ) ( not ( = ?auto_285364 ?auto_285372 ) ) ( not ( = ?auto_285365 ?auto_285366 ) ) ( not ( = ?auto_285365 ?auto_285367 ) ) ( not ( = ?auto_285365 ?auto_285368 ) ) ( not ( = ?auto_285365 ?auto_285372 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285366 ?auto_285367 ?auto_285368 )
      ( MAKE-10CRATE-VERIFY ?auto_285358 ?auto_285359 ?auto_285360 ?auto_285361 ?auto_285362 ?auto_285363 ?auto_285364 ?auto_285365 ?auto_285366 ?auto_285367 ?auto_285368 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_285375 - SURFACE
      ?auto_285376 - SURFACE
    )
    :vars
    (
      ?auto_285379 - HOIST
      ?auto_285380 - PLACE
      ?auto_285377 - SURFACE
      ?auto_285378 - PLACE
      ?auto_285383 - HOIST
      ?auto_285381 - SURFACE
      ?auto_285382 - TRUCK
      ?auto_285384 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_285379 ?auto_285380 ) ( IS-CRATE ?auto_285376 ) ( not ( = ?auto_285375 ?auto_285376 ) ) ( not ( = ?auto_285377 ?auto_285375 ) ) ( not ( = ?auto_285377 ?auto_285376 ) ) ( not ( = ?auto_285378 ?auto_285380 ) ) ( HOIST-AT ?auto_285383 ?auto_285378 ) ( not ( = ?auto_285379 ?auto_285383 ) ) ( SURFACE-AT ?auto_285376 ?auto_285378 ) ( ON ?auto_285376 ?auto_285381 ) ( CLEAR ?auto_285376 ) ( not ( = ?auto_285375 ?auto_285381 ) ) ( not ( = ?auto_285376 ?auto_285381 ) ) ( not ( = ?auto_285377 ?auto_285381 ) ) ( SURFACE-AT ?auto_285377 ?auto_285380 ) ( CLEAR ?auto_285377 ) ( IS-CRATE ?auto_285375 ) ( AVAILABLE ?auto_285379 ) ( TRUCK-AT ?auto_285382 ?auto_285378 ) ( AVAILABLE ?auto_285383 ) ( SURFACE-AT ?auto_285375 ?auto_285378 ) ( ON ?auto_285375 ?auto_285384 ) ( CLEAR ?auto_285375 ) ( not ( = ?auto_285375 ?auto_285384 ) ) ( not ( = ?auto_285376 ?auto_285384 ) ) ( not ( = ?auto_285377 ?auto_285384 ) ) ( not ( = ?auto_285381 ?auto_285384 ) ) )
    :subtasks
    ( ( !LIFT ?auto_285383 ?auto_285375 ?auto_285384 ?auto_285378 )
      ( MAKE-2CRATE ?auto_285377 ?auto_285375 ?auto_285376 )
      ( MAKE-1CRATE-VERIFY ?auto_285375 ?auto_285376 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_285385 - SURFACE
      ?auto_285386 - SURFACE
      ?auto_285387 - SURFACE
    )
    :vars
    (
      ?auto_285389 - HOIST
      ?auto_285393 - PLACE
      ?auto_285394 - PLACE
      ?auto_285390 - HOIST
      ?auto_285388 - SURFACE
      ?auto_285391 - TRUCK
      ?auto_285392 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_285389 ?auto_285393 ) ( IS-CRATE ?auto_285387 ) ( not ( = ?auto_285386 ?auto_285387 ) ) ( not ( = ?auto_285385 ?auto_285386 ) ) ( not ( = ?auto_285385 ?auto_285387 ) ) ( not ( = ?auto_285394 ?auto_285393 ) ) ( HOIST-AT ?auto_285390 ?auto_285394 ) ( not ( = ?auto_285389 ?auto_285390 ) ) ( SURFACE-AT ?auto_285387 ?auto_285394 ) ( ON ?auto_285387 ?auto_285388 ) ( CLEAR ?auto_285387 ) ( not ( = ?auto_285386 ?auto_285388 ) ) ( not ( = ?auto_285387 ?auto_285388 ) ) ( not ( = ?auto_285385 ?auto_285388 ) ) ( SURFACE-AT ?auto_285385 ?auto_285393 ) ( CLEAR ?auto_285385 ) ( IS-CRATE ?auto_285386 ) ( AVAILABLE ?auto_285389 ) ( TRUCK-AT ?auto_285391 ?auto_285394 ) ( AVAILABLE ?auto_285390 ) ( SURFACE-AT ?auto_285386 ?auto_285394 ) ( ON ?auto_285386 ?auto_285392 ) ( CLEAR ?auto_285386 ) ( not ( = ?auto_285386 ?auto_285392 ) ) ( not ( = ?auto_285387 ?auto_285392 ) ) ( not ( = ?auto_285385 ?auto_285392 ) ) ( not ( = ?auto_285388 ?auto_285392 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_285386 ?auto_285387 )
      ( MAKE-2CRATE-VERIFY ?auto_285385 ?auto_285386 ?auto_285387 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_285395 - SURFACE
      ?auto_285396 - SURFACE
      ?auto_285397 - SURFACE
      ?auto_285398 - SURFACE
    )
    :vars
    (
      ?auto_285400 - HOIST
      ?auto_285402 - PLACE
      ?auto_285401 - PLACE
      ?auto_285405 - HOIST
      ?auto_285403 - SURFACE
      ?auto_285399 - TRUCK
      ?auto_285404 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_285400 ?auto_285402 ) ( IS-CRATE ?auto_285398 ) ( not ( = ?auto_285397 ?auto_285398 ) ) ( not ( = ?auto_285396 ?auto_285397 ) ) ( not ( = ?auto_285396 ?auto_285398 ) ) ( not ( = ?auto_285401 ?auto_285402 ) ) ( HOIST-AT ?auto_285405 ?auto_285401 ) ( not ( = ?auto_285400 ?auto_285405 ) ) ( SURFACE-AT ?auto_285398 ?auto_285401 ) ( ON ?auto_285398 ?auto_285403 ) ( CLEAR ?auto_285398 ) ( not ( = ?auto_285397 ?auto_285403 ) ) ( not ( = ?auto_285398 ?auto_285403 ) ) ( not ( = ?auto_285396 ?auto_285403 ) ) ( SURFACE-AT ?auto_285396 ?auto_285402 ) ( CLEAR ?auto_285396 ) ( IS-CRATE ?auto_285397 ) ( AVAILABLE ?auto_285400 ) ( TRUCK-AT ?auto_285399 ?auto_285401 ) ( AVAILABLE ?auto_285405 ) ( SURFACE-AT ?auto_285397 ?auto_285401 ) ( ON ?auto_285397 ?auto_285404 ) ( CLEAR ?auto_285397 ) ( not ( = ?auto_285397 ?auto_285404 ) ) ( not ( = ?auto_285398 ?auto_285404 ) ) ( not ( = ?auto_285396 ?auto_285404 ) ) ( not ( = ?auto_285403 ?auto_285404 ) ) ( ON ?auto_285396 ?auto_285395 ) ( not ( = ?auto_285395 ?auto_285396 ) ) ( not ( = ?auto_285395 ?auto_285397 ) ) ( not ( = ?auto_285395 ?auto_285398 ) ) ( not ( = ?auto_285395 ?auto_285403 ) ) ( not ( = ?auto_285395 ?auto_285404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285396 ?auto_285397 ?auto_285398 )
      ( MAKE-3CRATE-VERIFY ?auto_285395 ?auto_285396 ?auto_285397 ?auto_285398 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_285406 - SURFACE
      ?auto_285407 - SURFACE
      ?auto_285408 - SURFACE
      ?auto_285409 - SURFACE
      ?auto_285410 - SURFACE
    )
    :vars
    (
      ?auto_285412 - HOIST
      ?auto_285414 - PLACE
      ?auto_285413 - PLACE
      ?auto_285417 - HOIST
      ?auto_285415 - SURFACE
      ?auto_285411 - TRUCK
      ?auto_285416 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_285412 ?auto_285414 ) ( IS-CRATE ?auto_285410 ) ( not ( = ?auto_285409 ?auto_285410 ) ) ( not ( = ?auto_285408 ?auto_285409 ) ) ( not ( = ?auto_285408 ?auto_285410 ) ) ( not ( = ?auto_285413 ?auto_285414 ) ) ( HOIST-AT ?auto_285417 ?auto_285413 ) ( not ( = ?auto_285412 ?auto_285417 ) ) ( SURFACE-AT ?auto_285410 ?auto_285413 ) ( ON ?auto_285410 ?auto_285415 ) ( CLEAR ?auto_285410 ) ( not ( = ?auto_285409 ?auto_285415 ) ) ( not ( = ?auto_285410 ?auto_285415 ) ) ( not ( = ?auto_285408 ?auto_285415 ) ) ( SURFACE-AT ?auto_285408 ?auto_285414 ) ( CLEAR ?auto_285408 ) ( IS-CRATE ?auto_285409 ) ( AVAILABLE ?auto_285412 ) ( TRUCK-AT ?auto_285411 ?auto_285413 ) ( AVAILABLE ?auto_285417 ) ( SURFACE-AT ?auto_285409 ?auto_285413 ) ( ON ?auto_285409 ?auto_285416 ) ( CLEAR ?auto_285409 ) ( not ( = ?auto_285409 ?auto_285416 ) ) ( not ( = ?auto_285410 ?auto_285416 ) ) ( not ( = ?auto_285408 ?auto_285416 ) ) ( not ( = ?auto_285415 ?auto_285416 ) ) ( ON ?auto_285407 ?auto_285406 ) ( ON ?auto_285408 ?auto_285407 ) ( not ( = ?auto_285406 ?auto_285407 ) ) ( not ( = ?auto_285406 ?auto_285408 ) ) ( not ( = ?auto_285406 ?auto_285409 ) ) ( not ( = ?auto_285406 ?auto_285410 ) ) ( not ( = ?auto_285406 ?auto_285415 ) ) ( not ( = ?auto_285406 ?auto_285416 ) ) ( not ( = ?auto_285407 ?auto_285408 ) ) ( not ( = ?auto_285407 ?auto_285409 ) ) ( not ( = ?auto_285407 ?auto_285410 ) ) ( not ( = ?auto_285407 ?auto_285415 ) ) ( not ( = ?auto_285407 ?auto_285416 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285408 ?auto_285409 ?auto_285410 )
      ( MAKE-4CRATE-VERIFY ?auto_285406 ?auto_285407 ?auto_285408 ?auto_285409 ?auto_285410 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_285418 - SURFACE
      ?auto_285419 - SURFACE
      ?auto_285420 - SURFACE
      ?auto_285421 - SURFACE
      ?auto_285422 - SURFACE
      ?auto_285423 - SURFACE
    )
    :vars
    (
      ?auto_285425 - HOIST
      ?auto_285427 - PLACE
      ?auto_285426 - PLACE
      ?auto_285430 - HOIST
      ?auto_285428 - SURFACE
      ?auto_285424 - TRUCK
      ?auto_285429 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_285425 ?auto_285427 ) ( IS-CRATE ?auto_285423 ) ( not ( = ?auto_285422 ?auto_285423 ) ) ( not ( = ?auto_285421 ?auto_285422 ) ) ( not ( = ?auto_285421 ?auto_285423 ) ) ( not ( = ?auto_285426 ?auto_285427 ) ) ( HOIST-AT ?auto_285430 ?auto_285426 ) ( not ( = ?auto_285425 ?auto_285430 ) ) ( SURFACE-AT ?auto_285423 ?auto_285426 ) ( ON ?auto_285423 ?auto_285428 ) ( CLEAR ?auto_285423 ) ( not ( = ?auto_285422 ?auto_285428 ) ) ( not ( = ?auto_285423 ?auto_285428 ) ) ( not ( = ?auto_285421 ?auto_285428 ) ) ( SURFACE-AT ?auto_285421 ?auto_285427 ) ( CLEAR ?auto_285421 ) ( IS-CRATE ?auto_285422 ) ( AVAILABLE ?auto_285425 ) ( TRUCK-AT ?auto_285424 ?auto_285426 ) ( AVAILABLE ?auto_285430 ) ( SURFACE-AT ?auto_285422 ?auto_285426 ) ( ON ?auto_285422 ?auto_285429 ) ( CLEAR ?auto_285422 ) ( not ( = ?auto_285422 ?auto_285429 ) ) ( not ( = ?auto_285423 ?auto_285429 ) ) ( not ( = ?auto_285421 ?auto_285429 ) ) ( not ( = ?auto_285428 ?auto_285429 ) ) ( ON ?auto_285419 ?auto_285418 ) ( ON ?auto_285420 ?auto_285419 ) ( ON ?auto_285421 ?auto_285420 ) ( not ( = ?auto_285418 ?auto_285419 ) ) ( not ( = ?auto_285418 ?auto_285420 ) ) ( not ( = ?auto_285418 ?auto_285421 ) ) ( not ( = ?auto_285418 ?auto_285422 ) ) ( not ( = ?auto_285418 ?auto_285423 ) ) ( not ( = ?auto_285418 ?auto_285428 ) ) ( not ( = ?auto_285418 ?auto_285429 ) ) ( not ( = ?auto_285419 ?auto_285420 ) ) ( not ( = ?auto_285419 ?auto_285421 ) ) ( not ( = ?auto_285419 ?auto_285422 ) ) ( not ( = ?auto_285419 ?auto_285423 ) ) ( not ( = ?auto_285419 ?auto_285428 ) ) ( not ( = ?auto_285419 ?auto_285429 ) ) ( not ( = ?auto_285420 ?auto_285421 ) ) ( not ( = ?auto_285420 ?auto_285422 ) ) ( not ( = ?auto_285420 ?auto_285423 ) ) ( not ( = ?auto_285420 ?auto_285428 ) ) ( not ( = ?auto_285420 ?auto_285429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285421 ?auto_285422 ?auto_285423 )
      ( MAKE-5CRATE-VERIFY ?auto_285418 ?auto_285419 ?auto_285420 ?auto_285421 ?auto_285422 ?auto_285423 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_285431 - SURFACE
      ?auto_285432 - SURFACE
      ?auto_285433 - SURFACE
      ?auto_285434 - SURFACE
      ?auto_285435 - SURFACE
      ?auto_285436 - SURFACE
      ?auto_285437 - SURFACE
    )
    :vars
    (
      ?auto_285439 - HOIST
      ?auto_285441 - PLACE
      ?auto_285440 - PLACE
      ?auto_285444 - HOIST
      ?auto_285442 - SURFACE
      ?auto_285438 - TRUCK
      ?auto_285443 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_285439 ?auto_285441 ) ( IS-CRATE ?auto_285437 ) ( not ( = ?auto_285436 ?auto_285437 ) ) ( not ( = ?auto_285435 ?auto_285436 ) ) ( not ( = ?auto_285435 ?auto_285437 ) ) ( not ( = ?auto_285440 ?auto_285441 ) ) ( HOIST-AT ?auto_285444 ?auto_285440 ) ( not ( = ?auto_285439 ?auto_285444 ) ) ( SURFACE-AT ?auto_285437 ?auto_285440 ) ( ON ?auto_285437 ?auto_285442 ) ( CLEAR ?auto_285437 ) ( not ( = ?auto_285436 ?auto_285442 ) ) ( not ( = ?auto_285437 ?auto_285442 ) ) ( not ( = ?auto_285435 ?auto_285442 ) ) ( SURFACE-AT ?auto_285435 ?auto_285441 ) ( CLEAR ?auto_285435 ) ( IS-CRATE ?auto_285436 ) ( AVAILABLE ?auto_285439 ) ( TRUCK-AT ?auto_285438 ?auto_285440 ) ( AVAILABLE ?auto_285444 ) ( SURFACE-AT ?auto_285436 ?auto_285440 ) ( ON ?auto_285436 ?auto_285443 ) ( CLEAR ?auto_285436 ) ( not ( = ?auto_285436 ?auto_285443 ) ) ( not ( = ?auto_285437 ?auto_285443 ) ) ( not ( = ?auto_285435 ?auto_285443 ) ) ( not ( = ?auto_285442 ?auto_285443 ) ) ( ON ?auto_285432 ?auto_285431 ) ( ON ?auto_285433 ?auto_285432 ) ( ON ?auto_285434 ?auto_285433 ) ( ON ?auto_285435 ?auto_285434 ) ( not ( = ?auto_285431 ?auto_285432 ) ) ( not ( = ?auto_285431 ?auto_285433 ) ) ( not ( = ?auto_285431 ?auto_285434 ) ) ( not ( = ?auto_285431 ?auto_285435 ) ) ( not ( = ?auto_285431 ?auto_285436 ) ) ( not ( = ?auto_285431 ?auto_285437 ) ) ( not ( = ?auto_285431 ?auto_285442 ) ) ( not ( = ?auto_285431 ?auto_285443 ) ) ( not ( = ?auto_285432 ?auto_285433 ) ) ( not ( = ?auto_285432 ?auto_285434 ) ) ( not ( = ?auto_285432 ?auto_285435 ) ) ( not ( = ?auto_285432 ?auto_285436 ) ) ( not ( = ?auto_285432 ?auto_285437 ) ) ( not ( = ?auto_285432 ?auto_285442 ) ) ( not ( = ?auto_285432 ?auto_285443 ) ) ( not ( = ?auto_285433 ?auto_285434 ) ) ( not ( = ?auto_285433 ?auto_285435 ) ) ( not ( = ?auto_285433 ?auto_285436 ) ) ( not ( = ?auto_285433 ?auto_285437 ) ) ( not ( = ?auto_285433 ?auto_285442 ) ) ( not ( = ?auto_285433 ?auto_285443 ) ) ( not ( = ?auto_285434 ?auto_285435 ) ) ( not ( = ?auto_285434 ?auto_285436 ) ) ( not ( = ?auto_285434 ?auto_285437 ) ) ( not ( = ?auto_285434 ?auto_285442 ) ) ( not ( = ?auto_285434 ?auto_285443 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285435 ?auto_285436 ?auto_285437 )
      ( MAKE-6CRATE-VERIFY ?auto_285431 ?auto_285432 ?auto_285433 ?auto_285434 ?auto_285435 ?auto_285436 ?auto_285437 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_285445 - SURFACE
      ?auto_285446 - SURFACE
      ?auto_285447 - SURFACE
      ?auto_285448 - SURFACE
      ?auto_285449 - SURFACE
      ?auto_285450 - SURFACE
      ?auto_285451 - SURFACE
      ?auto_285452 - SURFACE
    )
    :vars
    (
      ?auto_285454 - HOIST
      ?auto_285456 - PLACE
      ?auto_285455 - PLACE
      ?auto_285459 - HOIST
      ?auto_285457 - SURFACE
      ?auto_285453 - TRUCK
      ?auto_285458 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_285454 ?auto_285456 ) ( IS-CRATE ?auto_285452 ) ( not ( = ?auto_285451 ?auto_285452 ) ) ( not ( = ?auto_285450 ?auto_285451 ) ) ( not ( = ?auto_285450 ?auto_285452 ) ) ( not ( = ?auto_285455 ?auto_285456 ) ) ( HOIST-AT ?auto_285459 ?auto_285455 ) ( not ( = ?auto_285454 ?auto_285459 ) ) ( SURFACE-AT ?auto_285452 ?auto_285455 ) ( ON ?auto_285452 ?auto_285457 ) ( CLEAR ?auto_285452 ) ( not ( = ?auto_285451 ?auto_285457 ) ) ( not ( = ?auto_285452 ?auto_285457 ) ) ( not ( = ?auto_285450 ?auto_285457 ) ) ( SURFACE-AT ?auto_285450 ?auto_285456 ) ( CLEAR ?auto_285450 ) ( IS-CRATE ?auto_285451 ) ( AVAILABLE ?auto_285454 ) ( TRUCK-AT ?auto_285453 ?auto_285455 ) ( AVAILABLE ?auto_285459 ) ( SURFACE-AT ?auto_285451 ?auto_285455 ) ( ON ?auto_285451 ?auto_285458 ) ( CLEAR ?auto_285451 ) ( not ( = ?auto_285451 ?auto_285458 ) ) ( not ( = ?auto_285452 ?auto_285458 ) ) ( not ( = ?auto_285450 ?auto_285458 ) ) ( not ( = ?auto_285457 ?auto_285458 ) ) ( ON ?auto_285446 ?auto_285445 ) ( ON ?auto_285447 ?auto_285446 ) ( ON ?auto_285448 ?auto_285447 ) ( ON ?auto_285449 ?auto_285448 ) ( ON ?auto_285450 ?auto_285449 ) ( not ( = ?auto_285445 ?auto_285446 ) ) ( not ( = ?auto_285445 ?auto_285447 ) ) ( not ( = ?auto_285445 ?auto_285448 ) ) ( not ( = ?auto_285445 ?auto_285449 ) ) ( not ( = ?auto_285445 ?auto_285450 ) ) ( not ( = ?auto_285445 ?auto_285451 ) ) ( not ( = ?auto_285445 ?auto_285452 ) ) ( not ( = ?auto_285445 ?auto_285457 ) ) ( not ( = ?auto_285445 ?auto_285458 ) ) ( not ( = ?auto_285446 ?auto_285447 ) ) ( not ( = ?auto_285446 ?auto_285448 ) ) ( not ( = ?auto_285446 ?auto_285449 ) ) ( not ( = ?auto_285446 ?auto_285450 ) ) ( not ( = ?auto_285446 ?auto_285451 ) ) ( not ( = ?auto_285446 ?auto_285452 ) ) ( not ( = ?auto_285446 ?auto_285457 ) ) ( not ( = ?auto_285446 ?auto_285458 ) ) ( not ( = ?auto_285447 ?auto_285448 ) ) ( not ( = ?auto_285447 ?auto_285449 ) ) ( not ( = ?auto_285447 ?auto_285450 ) ) ( not ( = ?auto_285447 ?auto_285451 ) ) ( not ( = ?auto_285447 ?auto_285452 ) ) ( not ( = ?auto_285447 ?auto_285457 ) ) ( not ( = ?auto_285447 ?auto_285458 ) ) ( not ( = ?auto_285448 ?auto_285449 ) ) ( not ( = ?auto_285448 ?auto_285450 ) ) ( not ( = ?auto_285448 ?auto_285451 ) ) ( not ( = ?auto_285448 ?auto_285452 ) ) ( not ( = ?auto_285448 ?auto_285457 ) ) ( not ( = ?auto_285448 ?auto_285458 ) ) ( not ( = ?auto_285449 ?auto_285450 ) ) ( not ( = ?auto_285449 ?auto_285451 ) ) ( not ( = ?auto_285449 ?auto_285452 ) ) ( not ( = ?auto_285449 ?auto_285457 ) ) ( not ( = ?auto_285449 ?auto_285458 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285450 ?auto_285451 ?auto_285452 )
      ( MAKE-7CRATE-VERIFY ?auto_285445 ?auto_285446 ?auto_285447 ?auto_285448 ?auto_285449 ?auto_285450 ?auto_285451 ?auto_285452 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_285460 - SURFACE
      ?auto_285461 - SURFACE
      ?auto_285462 - SURFACE
      ?auto_285463 - SURFACE
      ?auto_285464 - SURFACE
      ?auto_285465 - SURFACE
      ?auto_285466 - SURFACE
      ?auto_285467 - SURFACE
      ?auto_285468 - SURFACE
    )
    :vars
    (
      ?auto_285470 - HOIST
      ?auto_285472 - PLACE
      ?auto_285471 - PLACE
      ?auto_285475 - HOIST
      ?auto_285473 - SURFACE
      ?auto_285469 - TRUCK
      ?auto_285474 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_285470 ?auto_285472 ) ( IS-CRATE ?auto_285468 ) ( not ( = ?auto_285467 ?auto_285468 ) ) ( not ( = ?auto_285466 ?auto_285467 ) ) ( not ( = ?auto_285466 ?auto_285468 ) ) ( not ( = ?auto_285471 ?auto_285472 ) ) ( HOIST-AT ?auto_285475 ?auto_285471 ) ( not ( = ?auto_285470 ?auto_285475 ) ) ( SURFACE-AT ?auto_285468 ?auto_285471 ) ( ON ?auto_285468 ?auto_285473 ) ( CLEAR ?auto_285468 ) ( not ( = ?auto_285467 ?auto_285473 ) ) ( not ( = ?auto_285468 ?auto_285473 ) ) ( not ( = ?auto_285466 ?auto_285473 ) ) ( SURFACE-AT ?auto_285466 ?auto_285472 ) ( CLEAR ?auto_285466 ) ( IS-CRATE ?auto_285467 ) ( AVAILABLE ?auto_285470 ) ( TRUCK-AT ?auto_285469 ?auto_285471 ) ( AVAILABLE ?auto_285475 ) ( SURFACE-AT ?auto_285467 ?auto_285471 ) ( ON ?auto_285467 ?auto_285474 ) ( CLEAR ?auto_285467 ) ( not ( = ?auto_285467 ?auto_285474 ) ) ( not ( = ?auto_285468 ?auto_285474 ) ) ( not ( = ?auto_285466 ?auto_285474 ) ) ( not ( = ?auto_285473 ?auto_285474 ) ) ( ON ?auto_285461 ?auto_285460 ) ( ON ?auto_285462 ?auto_285461 ) ( ON ?auto_285463 ?auto_285462 ) ( ON ?auto_285464 ?auto_285463 ) ( ON ?auto_285465 ?auto_285464 ) ( ON ?auto_285466 ?auto_285465 ) ( not ( = ?auto_285460 ?auto_285461 ) ) ( not ( = ?auto_285460 ?auto_285462 ) ) ( not ( = ?auto_285460 ?auto_285463 ) ) ( not ( = ?auto_285460 ?auto_285464 ) ) ( not ( = ?auto_285460 ?auto_285465 ) ) ( not ( = ?auto_285460 ?auto_285466 ) ) ( not ( = ?auto_285460 ?auto_285467 ) ) ( not ( = ?auto_285460 ?auto_285468 ) ) ( not ( = ?auto_285460 ?auto_285473 ) ) ( not ( = ?auto_285460 ?auto_285474 ) ) ( not ( = ?auto_285461 ?auto_285462 ) ) ( not ( = ?auto_285461 ?auto_285463 ) ) ( not ( = ?auto_285461 ?auto_285464 ) ) ( not ( = ?auto_285461 ?auto_285465 ) ) ( not ( = ?auto_285461 ?auto_285466 ) ) ( not ( = ?auto_285461 ?auto_285467 ) ) ( not ( = ?auto_285461 ?auto_285468 ) ) ( not ( = ?auto_285461 ?auto_285473 ) ) ( not ( = ?auto_285461 ?auto_285474 ) ) ( not ( = ?auto_285462 ?auto_285463 ) ) ( not ( = ?auto_285462 ?auto_285464 ) ) ( not ( = ?auto_285462 ?auto_285465 ) ) ( not ( = ?auto_285462 ?auto_285466 ) ) ( not ( = ?auto_285462 ?auto_285467 ) ) ( not ( = ?auto_285462 ?auto_285468 ) ) ( not ( = ?auto_285462 ?auto_285473 ) ) ( not ( = ?auto_285462 ?auto_285474 ) ) ( not ( = ?auto_285463 ?auto_285464 ) ) ( not ( = ?auto_285463 ?auto_285465 ) ) ( not ( = ?auto_285463 ?auto_285466 ) ) ( not ( = ?auto_285463 ?auto_285467 ) ) ( not ( = ?auto_285463 ?auto_285468 ) ) ( not ( = ?auto_285463 ?auto_285473 ) ) ( not ( = ?auto_285463 ?auto_285474 ) ) ( not ( = ?auto_285464 ?auto_285465 ) ) ( not ( = ?auto_285464 ?auto_285466 ) ) ( not ( = ?auto_285464 ?auto_285467 ) ) ( not ( = ?auto_285464 ?auto_285468 ) ) ( not ( = ?auto_285464 ?auto_285473 ) ) ( not ( = ?auto_285464 ?auto_285474 ) ) ( not ( = ?auto_285465 ?auto_285466 ) ) ( not ( = ?auto_285465 ?auto_285467 ) ) ( not ( = ?auto_285465 ?auto_285468 ) ) ( not ( = ?auto_285465 ?auto_285473 ) ) ( not ( = ?auto_285465 ?auto_285474 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285466 ?auto_285467 ?auto_285468 )
      ( MAKE-8CRATE-VERIFY ?auto_285460 ?auto_285461 ?auto_285462 ?auto_285463 ?auto_285464 ?auto_285465 ?auto_285466 ?auto_285467 ?auto_285468 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_285476 - SURFACE
      ?auto_285477 - SURFACE
      ?auto_285478 - SURFACE
      ?auto_285479 - SURFACE
      ?auto_285480 - SURFACE
      ?auto_285481 - SURFACE
      ?auto_285482 - SURFACE
      ?auto_285483 - SURFACE
      ?auto_285484 - SURFACE
      ?auto_285485 - SURFACE
    )
    :vars
    (
      ?auto_285487 - HOIST
      ?auto_285489 - PLACE
      ?auto_285488 - PLACE
      ?auto_285492 - HOIST
      ?auto_285490 - SURFACE
      ?auto_285486 - TRUCK
      ?auto_285491 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_285487 ?auto_285489 ) ( IS-CRATE ?auto_285485 ) ( not ( = ?auto_285484 ?auto_285485 ) ) ( not ( = ?auto_285483 ?auto_285484 ) ) ( not ( = ?auto_285483 ?auto_285485 ) ) ( not ( = ?auto_285488 ?auto_285489 ) ) ( HOIST-AT ?auto_285492 ?auto_285488 ) ( not ( = ?auto_285487 ?auto_285492 ) ) ( SURFACE-AT ?auto_285485 ?auto_285488 ) ( ON ?auto_285485 ?auto_285490 ) ( CLEAR ?auto_285485 ) ( not ( = ?auto_285484 ?auto_285490 ) ) ( not ( = ?auto_285485 ?auto_285490 ) ) ( not ( = ?auto_285483 ?auto_285490 ) ) ( SURFACE-AT ?auto_285483 ?auto_285489 ) ( CLEAR ?auto_285483 ) ( IS-CRATE ?auto_285484 ) ( AVAILABLE ?auto_285487 ) ( TRUCK-AT ?auto_285486 ?auto_285488 ) ( AVAILABLE ?auto_285492 ) ( SURFACE-AT ?auto_285484 ?auto_285488 ) ( ON ?auto_285484 ?auto_285491 ) ( CLEAR ?auto_285484 ) ( not ( = ?auto_285484 ?auto_285491 ) ) ( not ( = ?auto_285485 ?auto_285491 ) ) ( not ( = ?auto_285483 ?auto_285491 ) ) ( not ( = ?auto_285490 ?auto_285491 ) ) ( ON ?auto_285477 ?auto_285476 ) ( ON ?auto_285478 ?auto_285477 ) ( ON ?auto_285479 ?auto_285478 ) ( ON ?auto_285480 ?auto_285479 ) ( ON ?auto_285481 ?auto_285480 ) ( ON ?auto_285482 ?auto_285481 ) ( ON ?auto_285483 ?auto_285482 ) ( not ( = ?auto_285476 ?auto_285477 ) ) ( not ( = ?auto_285476 ?auto_285478 ) ) ( not ( = ?auto_285476 ?auto_285479 ) ) ( not ( = ?auto_285476 ?auto_285480 ) ) ( not ( = ?auto_285476 ?auto_285481 ) ) ( not ( = ?auto_285476 ?auto_285482 ) ) ( not ( = ?auto_285476 ?auto_285483 ) ) ( not ( = ?auto_285476 ?auto_285484 ) ) ( not ( = ?auto_285476 ?auto_285485 ) ) ( not ( = ?auto_285476 ?auto_285490 ) ) ( not ( = ?auto_285476 ?auto_285491 ) ) ( not ( = ?auto_285477 ?auto_285478 ) ) ( not ( = ?auto_285477 ?auto_285479 ) ) ( not ( = ?auto_285477 ?auto_285480 ) ) ( not ( = ?auto_285477 ?auto_285481 ) ) ( not ( = ?auto_285477 ?auto_285482 ) ) ( not ( = ?auto_285477 ?auto_285483 ) ) ( not ( = ?auto_285477 ?auto_285484 ) ) ( not ( = ?auto_285477 ?auto_285485 ) ) ( not ( = ?auto_285477 ?auto_285490 ) ) ( not ( = ?auto_285477 ?auto_285491 ) ) ( not ( = ?auto_285478 ?auto_285479 ) ) ( not ( = ?auto_285478 ?auto_285480 ) ) ( not ( = ?auto_285478 ?auto_285481 ) ) ( not ( = ?auto_285478 ?auto_285482 ) ) ( not ( = ?auto_285478 ?auto_285483 ) ) ( not ( = ?auto_285478 ?auto_285484 ) ) ( not ( = ?auto_285478 ?auto_285485 ) ) ( not ( = ?auto_285478 ?auto_285490 ) ) ( not ( = ?auto_285478 ?auto_285491 ) ) ( not ( = ?auto_285479 ?auto_285480 ) ) ( not ( = ?auto_285479 ?auto_285481 ) ) ( not ( = ?auto_285479 ?auto_285482 ) ) ( not ( = ?auto_285479 ?auto_285483 ) ) ( not ( = ?auto_285479 ?auto_285484 ) ) ( not ( = ?auto_285479 ?auto_285485 ) ) ( not ( = ?auto_285479 ?auto_285490 ) ) ( not ( = ?auto_285479 ?auto_285491 ) ) ( not ( = ?auto_285480 ?auto_285481 ) ) ( not ( = ?auto_285480 ?auto_285482 ) ) ( not ( = ?auto_285480 ?auto_285483 ) ) ( not ( = ?auto_285480 ?auto_285484 ) ) ( not ( = ?auto_285480 ?auto_285485 ) ) ( not ( = ?auto_285480 ?auto_285490 ) ) ( not ( = ?auto_285480 ?auto_285491 ) ) ( not ( = ?auto_285481 ?auto_285482 ) ) ( not ( = ?auto_285481 ?auto_285483 ) ) ( not ( = ?auto_285481 ?auto_285484 ) ) ( not ( = ?auto_285481 ?auto_285485 ) ) ( not ( = ?auto_285481 ?auto_285490 ) ) ( not ( = ?auto_285481 ?auto_285491 ) ) ( not ( = ?auto_285482 ?auto_285483 ) ) ( not ( = ?auto_285482 ?auto_285484 ) ) ( not ( = ?auto_285482 ?auto_285485 ) ) ( not ( = ?auto_285482 ?auto_285490 ) ) ( not ( = ?auto_285482 ?auto_285491 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285483 ?auto_285484 ?auto_285485 )
      ( MAKE-9CRATE-VERIFY ?auto_285476 ?auto_285477 ?auto_285478 ?auto_285479 ?auto_285480 ?auto_285481 ?auto_285482 ?auto_285483 ?auto_285484 ?auto_285485 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_285493 - SURFACE
      ?auto_285494 - SURFACE
      ?auto_285495 - SURFACE
      ?auto_285496 - SURFACE
      ?auto_285497 - SURFACE
      ?auto_285498 - SURFACE
      ?auto_285499 - SURFACE
      ?auto_285500 - SURFACE
      ?auto_285501 - SURFACE
      ?auto_285502 - SURFACE
      ?auto_285503 - SURFACE
    )
    :vars
    (
      ?auto_285505 - HOIST
      ?auto_285507 - PLACE
      ?auto_285506 - PLACE
      ?auto_285510 - HOIST
      ?auto_285508 - SURFACE
      ?auto_285504 - TRUCK
      ?auto_285509 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_285505 ?auto_285507 ) ( IS-CRATE ?auto_285503 ) ( not ( = ?auto_285502 ?auto_285503 ) ) ( not ( = ?auto_285501 ?auto_285502 ) ) ( not ( = ?auto_285501 ?auto_285503 ) ) ( not ( = ?auto_285506 ?auto_285507 ) ) ( HOIST-AT ?auto_285510 ?auto_285506 ) ( not ( = ?auto_285505 ?auto_285510 ) ) ( SURFACE-AT ?auto_285503 ?auto_285506 ) ( ON ?auto_285503 ?auto_285508 ) ( CLEAR ?auto_285503 ) ( not ( = ?auto_285502 ?auto_285508 ) ) ( not ( = ?auto_285503 ?auto_285508 ) ) ( not ( = ?auto_285501 ?auto_285508 ) ) ( SURFACE-AT ?auto_285501 ?auto_285507 ) ( CLEAR ?auto_285501 ) ( IS-CRATE ?auto_285502 ) ( AVAILABLE ?auto_285505 ) ( TRUCK-AT ?auto_285504 ?auto_285506 ) ( AVAILABLE ?auto_285510 ) ( SURFACE-AT ?auto_285502 ?auto_285506 ) ( ON ?auto_285502 ?auto_285509 ) ( CLEAR ?auto_285502 ) ( not ( = ?auto_285502 ?auto_285509 ) ) ( not ( = ?auto_285503 ?auto_285509 ) ) ( not ( = ?auto_285501 ?auto_285509 ) ) ( not ( = ?auto_285508 ?auto_285509 ) ) ( ON ?auto_285494 ?auto_285493 ) ( ON ?auto_285495 ?auto_285494 ) ( ON ?auto_285496 ?auto_285495 ) ( ON ?auto_285497 ?auto_285496 ) ( ON ?auto_285498 ?auto_285497 ) ( ON ?auto_285499 ?auto_285498 ) ( ON ?auto_285500 ?auto_285499 ) ( ON ?auto_285501 ?auto_285500 ) ( not ( = ?auto_285493 ?auto_285494 ) ) ( not ( = ?auto_285493 ?auto_285495 ) ) ( not ( = ?auto_285493 ?auto_285496 ) ) ( not ( = ?auto_285493 ?auto_285497 ) ) ( not ( = ?auto_285493 ?auto_285498 ) ) ( not ( = ?auto_285493 ?auto_285499 ) ) ( not ( = ?auto_285493 ?auto_285500 ) ) ( not ( = ?auto_285493 ?auto_285501 ) ) ( not ( = ?auto_285493 ?auto_285502 ) ) ( not ( = ?auto_285493 ?auto_285503 ) ) ( not ( = ?auto_285493 ?auto_285508 ) ) ( not ( = ?auto_285493 ?auto_285509 ) ) ( not ( = ?auto_285494 ?auto_285495 ) ) ( not ( = ?auto_285494 ?auto_285496 ) ) ( not ( = ?auto_285494 ?auto_285497 ) ) ( not ( = ?auto_285494 ?auto_285498 ) ) ( not ( = ?auto_285494 ?auto_285499 ) ) ( not ( = ?auto_285494 ?auto_285500 ) ) ( not ( = ?auto_285494 ?auto_285501 ) ) ( not ( = ?auto_285494 ?auto_285502 ) ) ( not ( = ?auto_285494 ?auto_285503 ) ) ( not ( = ?auto_285494 ?auto_285508 ) ) ( not ( = ?auto_285494 ?auto_285509 ) ) ( not ( = ?auto_285495 ?auto_285496 ) ) ( not ( = ?auto_285495 ?auto_285497 ) ) ( not ( = ?auto_285495 ?auto_285498 ) ) ( not ( = ?auto_285495 ?auto_285499 ) ) ( not ( = ?auto_285495 ?auto_285500 ) ) ( not ( = ?auto_285495 ?auto_285501 ) ) ( not ( = ?auto_285495 ?auto_285502 ) ) ( not ( = ?auto_285495 ?auto_285503 ) ) ( not ( = ?auto_285495 ?auto_285508 ) ) ( not ( = ?auto_285495 ?auto_285509 ) ) ( not ( = ?auto_285496 ?auto_285497 ) ) ( not ( = ?auto_285496 ?auto_285498 ) ) ( not ( = ?auto_285496 ?auto_285499 ) ) ( not ( = ?auto_285496 ?auto_285500 ) ) ( not ( = ?auto_285496 ?auto_285501 ) ) ( not ( = ?auto_285496 ?auto_285502 ) ) ( not ( = ?auto_285496 ?auto_285503 ) ) ( not ( = ?auto_285496 ?auto_285508 ) ) ( not ( = ?auto_285496 ?auto_285509 ) ) ( not ( = ?auto_285497 ?auto_285498 ) ) ( not ( = ?auto_285497 ?auto_285499 ) ) ( not ( = ?auto_285497 ?auto_285500 ) ) ( not ( = ?auto_285497 ?auto_285501 ) ) ( not ( = ?auto_285497 ?auto_285502 ) ) ( not ( = ?auto_285497 ?auto_285503 ) ) ( not ( = ?auto_285497 ?auto_285508 ) ) ( not ( = ?auto_285497 ?auto_285509 ) ) ( not ( = ?auto_285498 ?auto_285499 ) ) ( not ( = ?auto_285498 ?auto_285500 ) ) ( not ( = ?auto_285498 ?auto_285501 ) ) ( not ( = ?auto_285498 ?auto_285502 ) ) ( not ( = ?auto_285498 ?auto_285503 ) ) ( not ( = ?auto_285498 ?auto_285508 ) ) ( not ( = ?auto_285498 ?auto_285509 ) ) ( not ( = ?auto_285499 ?auto_285500 ) ) ( not ( = ?auto_285499 ?auto_285501 ) ) ( not ( = ?auto_285499 ?auto_285502 ) ) ( not ( = ?auto_285499 ?auto_285503 ) ) ( not ( = ?auto_285499 ?auto_285508 ) ) ( not ( = ?auto_285499 ?auto_285509 ) ) ( not ( = ?auto_285500 ?auto_285501 ) ) ( not ( = ?auto_285500 ?auto_285502 ) ) ( not ( = ?auto_285500 ?auto_285503 ) ) ( not ( = ?auto_285500 ?auto_285508 ) ) ( not ( = ?auto_285500 ?auto_285509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285501 ?auto_285502 ?auto_285503 )
      ( MAKE-10CRATE-VERIFY ?auto_285493 ?auto_285494 ?auto_285495 ?auto_285496 ?auto_285497 ?auto_285498 ?auto_285499 ?auto_285500 ?auto_285501 ?auto_285502 ?auto_285503 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_285511 - SURFACE
      ?auto_285512 - SURFACE
    )
    :vars
    (
      ?auto_285515 - HOIST
      ?auto_285517 - PLACE
      ?auto_285514 - SURFACE
      ?auto_285516 - PLACE
      ?auto_285520 - HOIST
      ?auto_285518 - SURFACE
      ?auto_285519 - SURFACE
      ?auto_285513 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285515 ?auto_285517 ) ( IS-CRATE ?auto_285512 ) ( not ( = ?auto_285511 ?auto_285512 ) ) ( not ( = ?auto_285514 ?auto_285511 ) ) ( not ( = ?auto_285514 ?auto_285512 ) ) ( not ( = ?auto_285516 ?auto_285517 ) ) ( HOIST-AT ?auto_285520 ?auto_285516 ) ( not ( = ?auto_285515 ?auto_285520 ) ) ( SURFACE-AT ?auto_285512 ?auto_285516 ) ( ON ?auto_285512 ?auto_285518 ) ( CLEAR ?auto_285512 ) ( not ( = ?auto_285511 ?auto_285518 ) ) ( not ( = ?auto_285512 ?auto_285518 ) ) ( not ( = ?auto_285514 ?auto_285518 ) ) ( SURFACE-AT ?auto_285514 ?auto_285517 ) ( CLEAR ?auto_285514 ) ( IS-CRATE ?auto_285511 ) ( AVAILABLE ?auto_285515 ) ( AVAILABLE ?auto_285520 ) ( SURFACE-AT ?auto_285511 ?auto_285516 ) ( ON ?auto_285511 ?auto_285519 ) ( CLEAR ?auto_285511 ) ( not ( = ?auto_285511 ?auto_285519 ) ) ( not ( = ?auto_285512 ?auto_285519 ) ) ( not ( = ?auto_285514 ?auto_285519 ) ) ( not ( = ?auto_285518 ?auto_285519 ) ) ( TRUCK-AT ?auto_285513 ?auto_285517 ) )
    :subtasks
    ( ( !DRIVE ?auto_285513 ?auto_285517 ?auto_285516 )
      ( MAKE-2CRATE ?auto_285514 ?auto_285511 ?auto_285512 )
      ( MAKE-1CRATE-VERIFY ?auto_285511 ?auto_285512 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_285521 - SURFACE
      ?auto_285522 - SURFACE
      ?auto_285523 - SURFACE
    )
    :vars
    (
      ?auto_285526 - HOIST
      ?auto_285527 - PLACE
      ?auto_285530 - PLACE
      ?auto_285528 - HOIST
      ?auto_285524 - SURFACE
      ?auto_285525 - SURFACE
      ?auto_285529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285526 ?auto_285527 ) ( IS-CRATE ?auto_285523 ) ( not ( = ?auto_285522 ?auto_285523 ) ) ( not ( = ?auto_285521 ?auto_285522 ) ) ( not ( = ?auto_285521 ?auto_285523 ) ) ( not ( = ?auto_285530 ?auto_285527 ) ) ( HOIST-AT ?auto_285528 ?auto_285530 ) ( not ( = ?auto_285526 ?auto_285528 ) ) ( SURFACE-AT ?auto_285523 ?auto_285530 ) ( ON ?auto_285523 ?auto_285524 ) ( CLEAR ?auto_285523 ) ( not ( = ?auto_285522 ?auto_285524 ) ) ( not ( = ?auto_285523 ?auto_285524 ) ) ( not ( = ?auto_285521 ?auto_285524 ) ) ( SURFACE-AT ?auto_285521 ?auto_285527 ) ( CLEAR ?auto_285521 ) ( IS-CRATE ?auto_285522 ) ( AVAILABLE ?auto_285526 ) ( AVAILABLE ?auto_285528 ) ( SURFACE-AT ?auto_285522 ?auto_285530 ) ( ON ?auto_285522 ?auto_285525 ) ( CLEAR ?auto_285522 ) ( not ( = ?auto_285522 ?auto_285525 ) ) ( not ( = ?auto_285523 ?auto_285525 ) ) ( not ( = ?auto_285521 ?auto_285525 ) ) ( not ( = ?auto_285524 ?auto_285525 ) ) ( TRUCK-AT ?auto_285529 ?auto_285527 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_285522 ?auto_285523 )
      ( MAKE-2CRATE-VERIFY ?auto_285521 ?auto_285522 ?auto_285523 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_285531 - SURFACE
      ?auto_285532 - SURFACE
      ?auto_285533 - SURFACE
      ?auto_285534 - SURFACE
    )
    :vars
    (
      ?auto_285535 - HOIST
      ?auto_285538 - PLACE
      ?auto_285537 - PLACE
      ?auto_285540 - HOIST
      ?auto_285541 - SURFACE
      ?auto_285539 - SURFACE
      ?auto_285536 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285535 ?auto_285538 ) ( IS-CRATE ?auto_285534 ) ( not ( = ?auto_285533 ?auto_285534 ) ) ( not ( = ?auto_285532 ?auto_285533 ) ) ( not ( = ?auto_285532 ?auto_285534 ) ) ( not ( = ?auto_285537 ?auto_285538 ) ) ( HOIST-AT ?auto_285540 ?auto_285537 ) ( not ( = ?auto_285535 ?auto_285540 ) ) ( SURFACE-AT ?auto_285534 ?auto_285537 ) ( ON ?auto_285534 ?auto_285541 ) ( CLEAR ?auto_285534 ) ( not ( = ?auto_285533 ?auto_285541 ) ) ( not ( = ?auto_285534 ?auto_285541 ) ) ( not ( = ?auto_285532 ?auto_285541 ) ) ( SURFACE-AT ?auto_285532 ?auto_285538 ) ( CLEAR ?auto_285532 ) ( IS-CRATE ?auto_285533 ) ( AVAILABLE ?auto_285535 ) ( AVAILABLE ?auto_285540 ) ( SURFACE-AT ?auto_285533 ?auto_285537 ) ( ON ?auto_285533 ?auto_285539 ) ( CLEAR ?auto_285533 ) ( not ( = ?auto_285533 ?auto_285539 ) ) ( not ( = ?auto_285534 ?auto_285539 ) ) ( not ( = ?auto_285532 ?auto_285539 ) ) ( not ( = ?auto_285541 ?auto_285539 ) ) ( TRUCK-AT ?auto_285536 ?auto_285538 ) ( ON ?auto_285532 ?auto_285531 ) ( not ( = ?auto_285531 ?auto_285532 ) ) ( not ( = ?auto_285531 ?auto_285533 ) ) ( not ( = ?auto_285531 ?auto_285534 ) ) ( not ( = ?auto_285531 ?auto_285541 ) ) ( not ( = ?auto_285531 ?auto_285539 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285532 ?auto_285533 ?auto_285534 )
      ( MAKE-3CRATE-VERIFY ?auto_285531 ?auto_285532 ?auto_285533 ?auto_285534 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_285542 - SURFACE
      ?auto_285543 - SURFACE
      ?auto_285544 - SURFACE
      ?auto_285545 - SURFACE
      ?auto_285546 - SURFACE
    )
    :vars
    (
      ?auto_285547 - HOIST
      ?auto_285550 - PLACE
      ?auto_285549 - PLACE
      ?auto_285552 - HOIST
      ?auto_285553 - SURFACE
      ?auto_285551 - SURFACE
      ?auto_285548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285547 ?auto_285550 ) ( IS-CRATE ?auto_285546 ) ( not ( = ?auto_285545 ?auto_285546 ) ) ( not ( = ?auto_285544 ?auto_285545 ) ) ( not ( = ?auto_285544 ?auto_285546 ) ) ( not ( = ?auto_285549 ?auto_285550 ) ) ( HOIST-AT ?auto_285552 ?auto_285549 ) ( not ( = ?auto_285547 ?auto_285552 ) ) ( SURFACE-AT ?auto_285546 ?auto_285549 ) ( ON ?auto_285546 ?auto_285553 ) ( CLEAR ?auto_285546 ) ( not ( = ?auto_285545 ?auto_285553 ) ) ( not ( = ?auto_285546 ?auto_285553 ) ) ( not ( = ?auto_285544 ?auto_285553 ) ) ( SURFACE-AT ?auto_285544 ?auto_285550 ) ( CLEAR ?auto_285544 ) ( IS-CRATE ?auto_285545 ) ( AVAILABLE ?auto_285547 ) ( AVAILABLE ?auto_285552 ) ( SURFACE-AT ?auto_285545 ?auto_285549 ) ( ON ?auto_285545 ?auto_285551 ) ( CLEAR ?auto_285545 ) ( not ( = ?auto_285545 ?auto_285551 ) ) ( not ( = ?auto_285546 ?auto_285551 ) ) ( not ( = ?auto_285544 ?auto_285551 ) ) ( not ( = ?auto_285553 ?auto_285551 ) ) ( TRUCK-AT ?auto_285548 ?auto_285550 ) ( ON ?auto_285543 ?auto_285542 ) ( ON ?auto_285544 ?auto_285543 ) ( not ( = ?auto_285542 ?auto_285543 ) ) ( not ( = ?auto_285542 ?auto_285544 ) ) ( not ( = ?auto_285542 ?auto_285545 ) ) ( not ( = ?auto_285542 ?auto_285546 ) ) ( not ( = ?auto_285542 ?auto_285553 ) ) ( not ( = ?auto_285542 ?auto_285551 ) ) ( not ( = ?auto_285543 ?auto_285544 ) ) ( not ( = ?auto_285543 ?auto_285545 ) ) ( not ( = ?auto_285543 ?auto_285546 ) ) ( not ( = ?auto_285543 ?auto_285553 ) ) ( not ( = ?auto_285543 ?auto_285551 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285544 ?auto_285545 ?auto_285546 )
      ( MAKE-4CRATE-VERIFY ?auto_285542 ?auto_285543 ?auto_285544 ?auto_285545 ?auto_285546 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_285554 - SURFACE
      ?auto_285555 - SURFACE
      ?auto_285556 - SURFACE
      ?auto_285557 - SURFACE
      ?auto_285558 - SURFACE
      ?auto_285559 - SURFACE
    )
    :vars
    (
      ?auto_285560 - HOIST
      ?auto_285563 - PLACE
      ?auto_285562 - PLACE
      ?auto_285565 - HOIST
      ?auto_285566 - SURFACE
      ?auto_285564 - SURFACE
      ?auto_285561 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285560 ?auto_285563 ) ( IS-CRATE ?auto_285559 ) ( not ( = ?auto_285558 ?auto_285559 ) ) ( not ( = ?auto_285557 ?auto_285558 ) ) ( not ( = ?auto_285557 ?auto_285559 ) ) ( not ( = ?auto_285562 ?auto_285563 ) ) ( HOIST-AT ?auto_285565 ?auto_285562 ) ( not ( = ?auto_285560 ?auto_285565 ) ) ( SURFACE-AT ?auto_285559 ?auto_285562 ) ( ON ?auto_285559 ?auto_285566 ) ( CLEAR ?auto_285559 ) ( not ( = ?auto_285558 ?auto_285566 ) ) ( not ( = ?auto_285559 ?auto_285566 ) ) ( not ( = ?auto_285557 ?auto_285566 ) ) ( SURFACE-AT ?auto_285557 ?auto_285563 ) ( CLEAR ?auto_285557 ) ( IS-CRATE ?auto_285558 ) ( AVAILABLE ?auto_285560 ) ( AVAILABLE ?auto_285565 ) ( SURFACE-AT ?auto_285558 ?auto_285562 ) ( ON ?auto_285558 ?auto_285564 ) ( CLEAR ?auto_285558 ) ( not ( = ?auto_285558 ?auto_285564 ) ) ( not ( = ?auto_285559 ?auto_285564 ) ) ( not ( = ?auto_285557 ?auto_285564 ) ) ( not ( = ?auto_285566 ?auto_285564 ) ) ( TRUCK-AT ?auto_285561 ?auto_285563 ) ( ON ?auto_285555 ?auto_285554 ) ( ON ?auto_285556 ?auto_285555 ) ( ON ?auto_285557 ?auto_285556 ) ( not ( = ?auto_285554 ?auto_285555 ) ) ( not ( = ?auto_285554 ?auto_285556 ) ) ( not ( = ?auto_285554 ?auto_285557 ) ) ( not ( = ?auto_285554 ?auto_285558 ) ) ( not ( = ?auto_285554 ?auto_285559 ) ) ( not ( = ?auto_285554 ?auto_285566 ) ) ( not ( = ?auto_285554 ?auto_285564 ) ) ( not ( = ?auto_285555 ?auto_285556 ) ) ( not ( = ?auto_285555 ?auto_285557 ) ) ( not ( = ?auto_285555 ?auto_285558 ) ) ( not ( = ?auto_285555 ?auto_285559 ) ) ( not ( = ?auto_285555 ?auto_285566 ) ) ( not ( = ?auto_285555 ?auto_285564 ) ) ( not ( = ?auto_285556 ?auto_285557 ) ) ( not ( = ?auto_285556 ?auto_285558 ) ) ( not ( = ?auto_285556 ?auto_285559 ) ) ( not ( = ?auto_285556 ?auto_285566 ) ) ( not ( = ?auto_285556 ?auto_285564 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285557 ?auto_285558 ?auto_285559 )
      ( MAKE-5CRATE-VERIFY ?auto_285554 ?auto_285555 ?auto_285556 ?auto_285557 ?auto_285558 ?auto_285559 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_285567 - SURFACE
      ?auto_285568 - SURFACE
      ?auto_285569 - SURFACE
      ?auto_285570 - SURFACE
      ?auto_285571 - SURFACE
      ?auto_285572 - SURFACE
      ?auto_285573 - SURFACE
    )
    :vars
    (
      ?auto_285574 - HOIST
      ?auto_285577 - PLACE
      ?auto_285576 - PLACE
      ?auto_285579 - HOIST
      ?auto_285580 - SURFACE
      ?auto_285578 - SURFACE
      ?auto_285575 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285574 ?auto_285577 ) ( IS-CRATE ?auto_285573 ) ( not ( = ?auto_285572 ?auto_285573 ) ) ( not ( = ?auto_285571 ?auto_285572 ) ) ( not ( = ?auto_285571 ?auto_285573 ) ) ( not ( = ?auto_285576 ?auto_285577 ) ) ( HOIST-AT ?auto_285579 ?auto_285576 ) ( not ( = ?auto_285574 ?auto_285579 ) ) ( SURFACE-AT ?auto_285573 ?auto_285576 ) ( ON ?auto_285573 ?auto_285580 ) ( CLEAR ?auto_285573 ) ( not ( = ?auto_285572 ?auto_285580 ) ) ( not ( = ?auto_285573 ?auto_285580 ) ) ( not ( = ?auto_285571 ?auto_285580 ) ) ( SURFACE-AT ?auto_285571 ?auto_285577 ) ( CLEAR ?auto_285571 ) ( IS-CRATE ?auto_285572 ) ( AVAILABLE ?auto_285574 ) ( AVAILABLE ?auto_285579 ) ( SURFACE-AT ?auto_285572 ?auto_285576 ) ( ON ?auto_285572 ?auto_285578 ) ( CLEAR ?auto_285572 ) ( not ( = ?auto_285572 ?auto_285578 ) ) ( not ( = ?auto_285573 ?auto_285578 ) ) ( not ( = ?auto_285571 ?auto_285578 ) ) ( not ( = ?auto_285580 ?auto_285578 ) ) ( TRUCK-AT ?auto_285575 ?auto_285577 ) ( ON ?auto_285568 ?auto_285567 ) ( ON ?auto_285569 ?auto_285568 ) ( ON ?auto_285570 ?auto_285569 ) ( ON ?auto_285571 ?auto_285570 ) ( not ( = ?auto_285567 ?auto_285568 ) ) ( not ( = ?auto_285567 ?auto_285569 ) ) ( not ( = ?auto_285567 ?auto_285570 ) ) ( not ( = ?auto_285567 ?auto_285571 ) ) ( not ( = ?auto_285567 ?auto_285572 ) ) ( not ( = ?auto_285567 ?auto_285573 ) ) ( not ( = ?auto_285567 ?auto_285580 ) ) ( not ( = ?auto_285567 ?auto_285578 ) ) ( not ( = ?auto_285568 ?auto_285569 ) ) ( not ( = ?auto_285568 ?auto_285570 ) ) ( not ( = ?auto_285568 ?auto_285571 ) ) ( not ( = ?auto_285568 ?auto_285572 ) ) ( not ( = ?auto_285568 ?auto_285573 ) ) ( not ( = ?auto_285568 ?auto_285580 ) ) ( not ( = ?auto_285568 ?auto_285578 ) ) ( not ( = ?auto_285569 ?auto_285570 ) ) ( not ( = ?auto_285569 ?auto_285571 ) ) ( not ( = ?auto_285569 ?auto_285572 ) ) ( not ( = ?auto_285569 ?auto_285573 ) ) ( not ( = ?auto_285569 ?auto_285580 ) ) ( not ( = ?auto_285569 ?auto_285578 ) ) ( not ( = ?auto_285570 ?auto_285571 ) ) ( not ( = ?auto_285570 ?auto_285572 ) ) ( not ( = ?auto_285570 ?auto_285573 ) ) ( not ( = ?auto_285570 ?auto_285580 ) ) ( not ( = ?auto_285570 ?auto_285578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285571 ?auto_285572 ?auto_285573 )
      ( MAKE-6CRATE-VERIFY ?auto_285567 ?auto_285568 ?auto_285569 ?auto_285570 ?auto_285571 ?auto_285572 ?auto_285573 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_285581 - SURFACE
      ?auto_285582 - SURFACE
      ?auto_285583 - SURFACE
      ?auto_285584 - SURFACE
      ?auto_285585 - SURFACE
      ?auto_285586 - SURFACE
      ?auto_285587 - SURFACE
      ?auto_285588 - SURFACE
    )
    :vars
    (
      ?auto_285589 - HOIST
      ?auto_285592 - PLACE
      ?auto_285591 - PLACE
      ?auto_285594 - HOIST
      ?auto_285595 - SURFACE
      ?auto_285593 - SURFACE
      ?auto_285590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285589 ?auto_285592 ) ( IS-CRATE ?auto_285588 ) ( not ( = ?auto_285587 ?auto_285588 ) ) ( not ( = ?auto_285586 ?auto_285587 ) ) ( not ( = ?auto_285586 ?auto_285588 ) ) ( not ( = ?auto_285591 ?auto_285592 ) ) ( HOIST-AT ?auto_285594 ?auto_285591 ) ( not ( = ?auto_285589 ?auto_285594 ) ) ( SURFACE-AT ?auto_285588 ?auto_285591 ) ( ON ?auto_285588 ?auto_285595 ) ( CLEAR ?auto_285588 ) ( not ( = ?auto_285587 ?auto_285595 ) ) ( not ( = ?auto_285588 ?auto_285595 ) ) ( not ( = ?auto_285586 ?auto_285595 ) ) ( SURFACE-AT ?auto_285586 ?auto_285592 ) ( CLEAR ?auto_285586 ) ( IS-CRATE ?auto_285587 ) ( AVAILABLE ?auto_285589 ) ( AVAILABLE ?auto_285594 ) ( SURFACE-AT ?auto_285587 ?auto_285591 ) ( ON ?auto_285587 ?auto_285593 ) ( CLEAR ?auto_285587 ) ( not ( = ?auto_285587 ?auto_285593 ) ) ( not ( = ?auto_285588 ?auto_285593 ) ) ( not ( = ?auto_285586 ?auto_285593 ) ) ( not ( = ?auto_285595 ?auto_285593 ) ) ( TRUCK-AT ?auto_285590 ?auto_285592 ) ( ON ?auto_285582 ?auto_285581 ) ( ON ?auto_285583 ?auto_285582 ) ( ON ?auto_285584 ?auto_285583 ) ( ON ?auto_285585 ?auto_285584 ) ( ON ?auto_285586 ?auto_285585 ) ( not ( = ?auto_285581 ?auto_285582 ) ) ( not ( = ?auto_285581 ?auto_285583 ) ) ( not ( = ?auto_285581 ?auto_285584 ) ) ( not ( = ?auto_285581 ?auto_285585 ) ) ( not ( = ?auto_285581 ?auto_285586 ) ) ( not ( = ?auto_285581 ?auto_285587 ) ) ( not ( = ?auto_285581 ?auto_285588 ) ) ( not ( = ?auto_285581 ?auto_285595 ) ) ( not ( = ?auto_285581 ?auto_285593 ) ) ( not ( = ?auto_285582 ?auto_285583 ) ) ( not ( = ?auto_285582 ?auto_285584 ) ) ( not ( = ?auto_285582 ?auto_285585 ) ) ( not ( = ?auto_285582 ?auto_285586 ) ) ( not ( = ?auto_285582 ?auto_285587 ) ) ( not ( = ?auto_285582 ?auto_285588 ) ) ( not ( = ?auto_285582 ?auto_285595 ) ) ( not ( = ?auto_285582 ?auto_285593 ) ) ( not ( = ?auto_285583 ?auto_285584 ) ) ( not ( = ?auto_285583 ?auto_285585 ) ) ( not ( = ?auto_285583 ?auto_285586 ) ) ( not ( = ?auto_285583 ?auto_285587 ) ) ( not ( = ?auto_285583 ?auto_285588 ) ) ( not ( = ?auto_285583 ?auto_285595 ) ) ( not ( = ?auto_285583 ?auto_285593 ) ) ( not ( = ?auto_285584 ?auto_285585 ) ) ( not ( = ?auto_285584 ?auto_285586 ) ) ( not ( = ?auto_285584 ?auto_285587 ) ) ( not ( = ?auto_285584 ?auto_285588 ) ) ( not ( = ?auto_285584 ?auto_285595 ) ) ( not ( = ?auto_285584 ?auto_285593 ) ) ( not ( = ?auto_285585 ?auto_285586 ) ) ( not ( = ?auto_285585 ?auto_285587 ) ) ( not ( = ?auto_285585 ?auto_285588 ) ) ( not ( = ?auto_285585 ?auto_285595 ) ) ( not ( = ?auto_285585 ?auto_285593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285586 ?auto_285587 ?auto_285588 )
      ( MAKE-7CRATE-VERIFY ?auto_285581 ?auto_285582 ?auto_285583 ?auto_285584 ?auto_285585 ?auto_285586 ?auto_285587 ?auto_285588 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_285596 - SURFACE
      ?auto_285597 - SURFACE
      ?auto_285598 - SURFACE
      ?auto_285599 - SURFACE
      ?auto_285600 - SURFACE
      ?auto_285601 - SURFACE
      ?auto_285602 - SURFACE
      ?auto_285603 - SURFACE
      ?auto_285604 - SURFACE
    )
    :vars
    (
      ?auto_285605 - HOIST
      ?auto_285608 - PLACE
      ?auto_285607 - PLACE
      ?auto_285610 - HOIST
      ?auto_285611 - SURFACE
      ?auto_285609 - SURFACE
      ?auto_285606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285605 ?auto_285608 ) ( IS-CRATE ?auto_285604 ) ( not ( = ?auto_285603 ?auto_285604 ) ) ( not ( = ?auto_285602 ?auto_285603 ) ) ( not ( = ?auto_285602 ?auto_285604 ) ) ( not ( = ?auto_285607 ?auto_285608 ) ) ( HOIST-AT ?auto_285610 ?auto_285607 ) ( not ( = ?auto_285605 ?auto_285610 ) ) ( SURFACE-AT ?auto_285604 ?auto_285607 ) ( ON ?auto_285604 ?auto_285611 ) ( CLEAR ?auto_285604 ) ( not ( = ?auto_285603 ?auto_285611 ) ) ( not ( = ?auto_285604 ?auto_285611 ) ) ( not ( = ?auto_285602 ?auto_285611 ) ) ( SURFACE-AT ?auto_285602 ?auto_285608 ) ( CLEAR ?auto_285602 ) ( IS-CRATE ?auto_285603 ) ( AVAILABLE ?auto_285605 ) ( AVAILABLE ?auto_285610 ) ( SURFACE-AT ?auto_285603 ?auto_285607 ) ( ON ?auto_285603 ?auto_285609 ) ( CLEAR ?auto_285603 ) ( not ( = ?auto_285603 ?auto_285609 ) ) ( not ( = ?auto_285604 ?auto_285609 ) ) ( not ( = ?auto_285602 ?auto_285609 ) ) ( not ( = ?auto_285611 ?auto_285609 ) ) ( TRUCK-AT ?auto_285606 ?auto_285608 ) ( ON ?auto_285597 ?auto_285596 ) ( ON ?auto_285598 ?auto_285597 ) ( ON ?auto_285599 ?auto_285598 ) ( ON ?auto_285600 ?auto_285599 ) ( ON ?auto_285601 ?auto_285600 ) ( ON ?auto_285602 ?auto_285601 ) ( not ( = ?auto_285596 ?auto_285597 ) ) ( not ( = ?auto_285596 ?auto_285598 ) ) ( not ( = ?auto_285596 ?auto_285599 ) ) ( not ( = ?auto_285596 ?auto_285600 ) ) ( not ( = ?auto_285596 ?auto_285601 ) ) ( not ( = ?auto_285596 ?auto_285602 ) ) ( not ( = ?auto_285596 ?auto_285603 ) ) ( not ( = ?auto_285596 ?auto_285604 ) ) ( not ( = ?auto_285596 ?auto_285611 ) ) ( not ( = ?auto_285596 ?auto_285609 ) ) ( not ( = ?auto_285597 ?auto_285598 ) ) ( not ( = ?auto_285597 ?auto_285599 ) ) ( not ( = ?auto_285597 ?auto_285600 ) ) ( not ( = ?auto_285597 ?auto_285601 ) ) ( not ( = ?auto_285597 ?auto_285602 ) ) ( not ( = ?auto_285597 ?auto_285603 ) ) ( not ( = ?auto_285597 ?auto_285604 ) ) ( not ( = ?auto_285597 ?auto_285611 ) ) ( not ( = ?auto_285597 ?auto_285609 ) ) ( not ( = ?auto_285598 ?auto_285599 ) ) ( not ( = ?auto_285598 ?auto_285600 ) ) ( not ( = ?auto_285598 ?auto_285601 ) ) ( not ( = ?auto_285598 ?auto_285602 ) ) ( not ( = ?auto_285598 ?auto_285603 ) ) ( not ( = ?auto_285598 ?auto_285604 ) ) ( not ( = ?auto_285598 ?auto_285611 ) ) ( not ( = ?auto_285598 ?auto_285609 ) ) ( not ( = ?auto_285599 ?auto_285600 ) ) ( not ( = ?auto_285599 ?auto_285601 ) ) ( not ( = ?auto_285599 ?auto_285602 ) ) ( not ( = ?auto_285599 ?auto_285603 ) ) ( not ( = ?auto_285599 ?auto_285604 ) ) ( not ( = ?auto_285599 ?auto_285611 ) ) ( not ( = ?auto_285599 ?auto_285609 ) ) ( not ( = ?auto_285600 ?auto_285601 ) ) ( not ( = ?auto_285600 ?auto_285602 ) ) ( not ( = ?auto_285600 ?auto_285603 ) ) ( not ( = ?auto_285600 ?auto_285604 ) ) ( not ( = ?auto_285600 ?auto_285611 ) ) ( not ( = ?auto_285600 ?auto_285609 ) ) ( not ( = ?auto_285601 ?auto_285602 ) ) ( not ( = ?auto_285601 ?auto_285603 ) ) ( not ( = ?auto_285601 ?auto_285604 ) ) ( not ( = ?auto_285601 ?auto_285611 ) ) ( not ( = ?auto_285601 ?auto_285609 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285602 ?auto_285603 ?auto_285604 )
      ( MAKE-8CRATE-VERIFY ?auto_285596 ?auto_285597 ?auto_285598 ?auto_285599 ?auto_285600 ?auto_285601 ?auto_285602 ?auto_285603 ?auto_285604 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_285612 - SURFACE
      ?auto_285613 - SURFACE
      ?auto_285614 - SURFACE
      ?auto_285615 - SURFACE
      ?auto_285616 - SURFACE
      ?auto_285617 - SURFACE
      ?auto_285618 - SURFACE
      ?auto_285619 - SURFACE
      ?auto_285620 - SURFACE
      ?auto_285621 - SURFACE
    )
    :vars
    (
      ?auto_285622 - HOIST
      ?auto_285625 - PLACE
      ?auto_285624 - PLACE
      ?auto_285627 - HOIST
      ?auto_285628 - SURFACE
      ?auto_285626 - SURFACE
      ?auto_285623 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285622 ?auto_285625 ) ( IS-CRATE ?auto_285621 ) ( not ( = ?auto_285620 ?auto_285621 ) ) ( not ( = ?auto_285619 ?auto_285620 ) ) ( not ( = ?auto_285619 ?auto_285621 ) ) ( not ( = ?auto_285624 ?auto_285625 ) ) ( HOIST-AT ?auto_285627 ?auto_285624 ) ( not ( = ?auto_285622 ?auto_285627 ) ) ( SURFACE-AT ?auto_285621 ?auto_285624 ) ( ON ?auto_285621 ?auto_285628 ) ( CLEAR ?auto_285621 ) ( not ( = ?auto_285620 ?auto_285628 ) ) ( not ( = ?auto_285621 ?auto_285628 ) ) ( not ( = ?auto_285619 ?auto_285628 ) ) ( SURFACE-AT ?auto_285619 ?auto_285625 ) ( CLEAR ?auto_285619 ) ( IS-CRATE ?auto_285620 ) ( AVAILABLE ?auto_285622 ) ( AVAILABLE ?auto_285627 ) ( SURFACE-AT ?auto_285620 ?auto_285624 ) ( ON ?auto_285620 ?auto_285626 ) ( CLEAR ?auto_285620 ) ( not ( = ?auto_285620 ?auto_285626 ) ) ( not ( = ?auto_285621 ?auto_285626 ) ) ( not ( = ?auto_285619 ?auto_285626 ) ) ( not ( = ?auto_285628 ?auto_285626 ) ) ( TRUCK-AT ?auto_285623 ?auto_285625 ) ( ON ?auto_285613 ?auto_285612 ) ( ON ?auto_285614 ?auto_285613 ) ( ON ?auto_285615 ?auto_285614 ) ( ON ?auto_285616 ?auto_285615 ) ( ON ?auto_285617 ?auto_285616 ) ( ON ?auto_285618 ?auto_285617 ) ( ON ?auto_285619 ?auto_285618 ) ( not ( = ?auto_285612 ?auto_285613 ) ) ( not ( = ?auto_285612 ?auto_285614 ) ) ( not ( = ?auto_285612 ?auto_285615 ) ) ( not ( = ?auto_285612 ?auto_285616 ) ) ( not ( = ?auto_285612 ?auto_285617 ) ) ( not ( = ?auto_285612 ?auto_285618 ) ) ( not ( = ?auto_285612 ?auto_285619 ) ) ( not ( = ?auto_285612 ?auto_285620 ) ) ( not ( = ?auto_285612 ?auto_285621 ) ) ( not ( = ?auto_285612 ?auto_285628 ) ) ( not ( = ?auto_285612 ?auto_285626 ) ) ( not ( = ?auto_285613 ?auto_285614 ) ) ( not ( = ?auto_285613 ?auto_285615 ) ) ( not ( = ?auto_285613 ?auto_285616 ) ) ( not ( = ?auto_285613 ?auto_285617 ) ) ( not ( = ?auto_285613 ?auto_285618 ) ) ( not ( = ?auto_285613 ?auto_285619 ) ) ( not ( = ?auto_285613 ?auto_285620 ) ) ( not ( = ?auto_285613 ?auto_285621 ) ) ( not ( = ?auto_285613 ?auto_285628 ) ) ( not ( = ?auto_285613 ?auto_285626 ) ) ( not ( = ?auto_285614 ?auto_285615 ) ) ( not ( = ?auto_285614 ?auto_285616 ) ) ( not ( = ?auto_285614 ?auto_285617 ) ) ( not ( = ?auto_285614 ?auto_285618 ) ) ( not ( = ?auto_285614 ?auto_285619 ) ) ( not ( = ?auto_285614 ?auto_285620 ) ) ( not ( = ?auto_285614 ?auto_285621 ) ) ( not ( = ?auto_285614 ?auto_285628 ) ) ( not ( = ?auto_285614 ?auto_285626 ) ) ( not ( = ?auto_285615 ?auto_285616 ) ) ( not ( = ?auto_285615 ?auto_285617 ) ) ( not ( = ?auto_285615 ?auto_285618 ) ) ( not ( = ?auto_285615 ?auto_285619 ) ) ( not ( = ?auto_285615 ?auto_285620 ) ) ( not ( = ?auto_285615 ?auto_285621 ) ) ( not ( = ?auto_285615 ?auto_285628 ) ) ( not ( = ?auto_285615 ?auto_285626 ) ) ( not ( = ?auto_285616 ?auto_285617 ) ) ( not ( = ?auto_285616 ?auto_285618 ) ) ( not ( = ?auto_285616 ?auto_285619 ) ) ( not ( = ?auto_285616 ?auto_285620 ) ) ( not ( = ?auto_285616 ?auto_285621 ) ) ( not ( = ?auto_285616 ?auto_285628 ) ) ( not ( = ?auto_285616 ?auto_285626 ) ) ( not ( = ?auto_285617 ?auto_285618 ) ) ( not ( = ?auto_285617 ?auto_285619 ) ) ( not ( = ?auto_285617 ?auto_285620 ) ) ( not ( = ?auto_285617 ?auto_285621 ) ) ( not ( = ?auto_285617 ?auto_285628 ) ) ( not ( = ?auto_285617 ?auto_285626 ) ) ( not ( = ?auto_285618 ?auto_285619 ) ) ( not ( = ?auto_285618 ?auto_285620 ) ) ( not ( = ?auto_285618 ?auto_285621 ) ) ( not ( = ?auto_285618 ?auto_285628 ) ) ( not ( = ?auto_285618 ?auto_285626 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285619 ?auto_285620 ?auto_285621 )
      ( MAKE-9CRATE-VERIFY ?auto_285612 ?auto_285613 ?auto_285614 ?auto_285615 ?auto_285616 ?auto_285617 ?auto_285618 ?auto_285619 ?auto_285620 ?auto_285621 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_285629 - SURFACE
      ?auto_285630 - SURFACE
      ?auto_285631 - SURFACE
      ?auto_285632 - SURFACE
      ?auto_285633 - SURFACE
      ?auto_285634 - SURFACE
      ?auto_285635 - SURFACE
      ?auto_285636 - SURFACE
      ?auto_285637 - SURFACE
      ?auto_285638 - SURFACE
      ?auto_285639 - SURFACE
    )
    :vars
    (
      ?auto_285640 - HOIST
      ?auto_285643 - PLACE
      ?auto_285642 - PLACE
      ?auto_285645 - HOIST
      ?auto_285646 - SURFACE
      ?auto_285644 - SURFACE
      ?auto_285641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285640 ?auto_285643 ) ( IS-CRATE ?auto_285639 ) ( not ( = ?auto_285638 ?auto_285639 ) ) ( not ( = ?auto_285637 ?auto_285638 ) ) ( not ( = ?auto_285637 ?auto_285639 ) ) ( not ( = ?auto_285642 ?auto_285643 ) ) ( HOIST-AT ?auto_285645 ?auto_285642 ) ( not ( = ?auto_285640 ?auto_285645 ) ) ( SURFACE-AT ?auto_285639 ?auto_285642 ) ( ON ?auto_285639 ?auto_285646 ) ( CLEAR ?auto_285639 ) ( not ( = ?auto_285638 ?auto_285646 ) ) ( not ( = ?auto_285639 ?auto_285646 ) ) ( not ( = ?auto_285637 ?auto_285646 ) ) ( SURFACE-AT ?auto_285637 ?auto_285643 ) ( CLEAR ?auto_285637 ) ( IS-CRATE ?auto_285638 ) ( AVAILABLE ?auto_285640 ) ( AVAILABLE ?auto_285645 ) ( SURFACE-AT ?auto_285638 ?auto_285642 ) ( ON ?auto_285638 ?auto_285644 ) ( CLEAR ?auto_285638 ) ( not ( = ?auto_285638 ?auto_285644 ) ) ( not ( = ?auto_285639 ?auto_285644 ) ) ( not ( = ?auto_285637 ?auto_285644 ) ) ( not ( = ?auto_285646 ?auto_285644 ) ) ( TRUCK-AT ?auto_285641 ?auto_285643 ) ( ON ?auto_285630 ?auto_285629 ) ( ON ?auto_285631 ?auto_285630 ) ( ON ?auto_285632 ?auto_285631 ) ( ON ?auto_285633 ?auto_285632 ) ( ON ?auto_285634 ?auto_285633 ) ( ON ?auto_285635 ?auto_285634 ) ( ON ?auto_285636 ?auto_285635 ) ( ON ?auto_285637 ?auto_285636 ) ( not ( = ?auto_285629 ?auto_285630 ) ) ( not ( = ?auto_285629 ?auto_285631 ) ) ( not ( = ?auto_285629 ?auto_285632 ) ) ( not ( = ?auto_285629 ?auto_285633 ) ) ( not ( = ?auto_285629 ?auto_285634 ) ) ( not ( = ?auto_285629 ?auto_285635 ) ) ( not ( = ?auto_285629 ?auto_285636 ) ) ( not ( = ?auto_285629 ?auto_285637 ) ) ( not ( = ?auto_285629 ?auto_285638 ) ) ( not ( = ?auto_285629 ?auto_285639 ) ) ( not ( = ?auto_285629 ?auto_285646 ) ) ( not ( = ?auto_285629 ?auto_285644 ) ) ( not ( = ?auto_285630 ?auto_285631 ) ) ( not ( = ?auto_285630 ?auto_285632 ) ) ( not ( = ?auto_285630 ?auto_285633 ) ) ( not ( = ?auto_285630 ?auto_285634 ) ) ( not ( = ?auto_285630 ?auto_285635 ) ) ( not ( = ?auto_285630 ?auto_285636 ) ) ( not ( = ?auto_285630 ?auto_285637 ) ) ( not ( = ?auto_285630 ?auto_285638 ) ) ( not ( = ?auto_285630 ?auto_285639 ) ) ( not ( = ?auto_285630 ?auto_285646 ) ) ( not ( = ?auto_285630 ?auto_285644 ) ) ( not ( = ?auto_285631 ?auto_285632 ) ) ( not ( = ?auto_285631 ?auto_285633 ) ) ( not ( = ?auto_285631 ?auto_285634 ) ) ( not ( = ?auto_285631 ?auto_285635 ) ) ( not ( = ?auto_285631 ?auto_285636 ) ) ( not ( = ?auto_285631 ?auto_285637 ) ) ( not ( = ?auto_285631 ?auto_285638 ) ) ( not ( = ?auto_285631 ?auto_285639 ) ) ( not ( = ?auto_285631 ?auto_285646 ) ) ( not ( = ?auto_285631 ?auto_285644 ) ) ( not ( = ?auto_285632 ?auto_285633 ) ) ( not ( = ?auto_285632 ?auto_285634 ) ) ( not ( = ?auto_285632 ?auto_285635 ) ) ( not ( = ?auto_285632 ?auto_285636 ) ) ( not ( = ?auto_285632 ?auto_285637 ) ) ( not ( = ?auto_285632 ?auto_285638 ) ) ( not ( = ?auto_285632 ?auto_285639 ) ) ( not ( = ?auto_285632 ?auto_285646 ) ) ( not ( = ?auto_285632 ?auto_285644 ) ) ( not ( = ?auto_285633 ?auto_285634 ) ) ( not ( = ?auto_285633 ?auto_285635 ) ) ( not ( = ?auto_285633 ?auto_285636 ) ) ( not ( = ?auto_285633 ?auto_285637 ) ) ( not ( = ?auto_285633 ?auto_285638 ) ) ( not ( = ?auto_285633 ?auto_285639 ) ) ( not ( = ?auto_285633 ?auto_285646 ) ) ( not ( = ?auto_285633 ?auto_285644 ) ) ( not ( = ?auto_285634 ?auto_285635 ) ) ( not ( = ?auto_285634 ?auto_285636 ) ) ( not ( = ?auto_285634 ?auto_285637 ) ) ( not ( = ?auto_285634 ?auto_285638 ) ) ( not ( = ?auto_285634 ?auto_285639 ) ) ( not ( = ?auto_285634 ?auto_285646 ) ) ( not ( = ?auto_285634 ?auto_285644 ) ) ( not ( = ?auto_285635 ?auto_285636 ) ) ( not ( = ?auto_285635 ?auto_285637 ) ) ( not ( = ?auto_285635 ?auto_285638 ) ) ( not ( = ?auto_285635 ?auto_285639 ) ) ( not ( = ?auto_285635 ?auto_285646 ) ) ( not ( = ?auto_285635 ?auto_285644 ) ) ( not ( = ?auto_285636 ?auto_285637 ) ) ( not ( = ?auto_285636 ?auto_285638 ) ) ( not ( = ?auto_285636 ?auto_285639 ) ) ( not ( = ?auto_285636 ?auto_285646 ) ) ( not ( = ?auto_285636 ?auto_285644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285637 ?auto_285638 ?auto_285639 )
      ( MAKE-10CRATE-VERIFY ?auto_285629 ?auto_285630 ?auto_285631 ?auto_285632 ?auto_285633 ?auto_285634 ?auto_285635 ?auto_285636 ?auto_285637 ?auto_285638 ?auto_285639 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_285647 - SURFACE
      ?auto_285648 - SURFACE
    )
    :vars
    (
      ?auto_285649 - HOIST
      ?auto_285652 - PLACE
      ?auto_285653 - SURFACE
      ?auto_285651 - PLACE
      ?auto_285655 - HOIST
      ?auto_285656 - SURFACE
      ?auto_285654 - SURFACE
      ?auto_285650 - TRUCK
      ?auto_285657 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_285649 ?auto_285652 ) ( IS-CRATE ?auto_285648 ) ( not ( = ?auto_285647 ?auto_285648 ) ) ( not ( = ?auto_285653 ?auto_285647 ) ) ( not ( = ?auto_285653 ?auto_285648 ) ) ( not ( = ?auto_285651 ?auto_285652 ) ) ( HOIST-AT ?auto_285655 ?auto_285651 ) ( not ( = ?auto_285649 ?auto_285655 ) ) ( SURFACE-AT ?auto_285648 ?auto_285651 ) ( ON ?auto_285648 ?auto_285656 ) ( CLEAR ?auto_285648 ) ( not ( = ?auto_285647 ?auto_285656 ) ) ( not ( = ?auto_285648 ?auto_285656 ) ) ( not ( = ?auto_285653 ?auto_285656 ) ) ( IS-CRATE ?auto_285647 ) ( AVAILABLE ?auto_285655 ) ( SURFACE-AT ?auto_285647 ?auto_285651 ) ( ON ?auto_285647 ?auto_285654 ) ( CLEAR ?auto_285647 ) ( not ( = ?auto_285647 ?auto_285654 ) ) ( not ( = ?auto_285648 ?auto_285654 ) ) ( not ( = ?auto_285653 ?auto_285654 ) ) ( not ( = ?auto_285656 ?auto_285654 ) ) ( TRUCK-AT ?auto_285650 ?auto_285652 ) ( SURFACE-AT ?auto_285657 ?auto_285652 ) ( CLEAR ?auto_285657 ) ( LIFTING ?auto_285649 ?auto_285653 ) ( IS-CRATE ?auto_285653 ) ( not ( = ?auto_285657 ?auto_285653 ) ) ( not ( = ?auto_285647 ?auto_285657 ) ) ( not ( = ?auto_285648 ?auto_285657 ) ) ( not ( = ?auto_285656 ?auto_285657 ) ) ( not ( = ?auto_285654 ?auto_285657 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_285657 ?auto_285653 )
      ( MAKE-2CRATE ?auto_285653 ?auto_285647 ?auto_285648 )
      ( MAKE-1CRATE-VERIFY ?auto_285647 ?auto_285648 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_285658 - SURFACE
      ?auto_285659 - SURFACE
      ?auto_285660 - SURFACE
    )
    :vars
    (
      ?auto_285668 - HOIST
      ?auto_285663 - PLACE
      ?auto_285666 - PLACE
      ?auto_285667 - HOIST
      ?auto_285661 - SURFACE
      ?auto_285662 - SURFACE
      ?auto_285664 - TRUCK
      ?auto_285665 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_285668 ?auto_285663 ) ( IS-CRATE ?auto_285660 ) ( not ( = ?auto_285659 ?auto_285660 ) ) ( not ( = ?auto_285658 ?auto_285659 ) ) ( not ( = ?auto_285658 ?auto_285660 ) ) ( not ( = ?auto_285666 ?auto_285663 ) ) ( HOIST-AT ?auto_285667 ?auto_285666 ) ( not ( = ?auto_285668 ?auto_285667 ) ) ( SURFACE-AT ?auto_285660 ?auto_285666 ) ( ON ?auto_285660 ?auto_285661 ) ( CLEAR ?auto_285660 ) ( not ( = ?auto_285659 ?auto_285661 ) ) ( not ( = ?auto_285660 ?auto_285661 ) ) ( not ( = ?auto_285658 ?auto_285661 ) ) ( IS-CRATE ?auto_285659 ) ( AVAILABLE ?auto_285667 ) ( SURFACE-AT ?auto_285659 ?auto_285666 ) ( ON ?auto_285659 ?auto_285662 ) ( CLEAR ?auto_285659 ) ( not ( = ?auto_285659 ?auto_285662 ) ) ( not ( = ?auto_285660 ?auto_285662 ) ) ( not ( = ?auto_285658 ?auto_285662 ) ) ( not ( = ?auto_285661 ?auto_285662 ) ) ( TRUCK-AT ?auto_285664 ?auto_285663 ) ( SURFACE-AT ?auto_285665 ?auto_285663 ) ( CLEAR ?auto_285665 ) ( LIFTING ?auto_285668 ?auto_285658 ) ( IS-CRATE ?auto_285658 ) ( not ( = ?auto_285665 ?auto_285658 ) ) ( not ( = ?auto_285659 ?auto_285665 ) ) ( not ( = ?auto_285660 ?auto_285665 ) ) ( not ( = ?auto_285661 ?auto_285665 ) ) ( not ( = ?auto_285662 ?auto_285665 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_285659 ?auto_285660 )
      ( MAKE-2CRATE-VERIFY ?auto_285658 ?auto_285659 ?auto_285660 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_285669 - SURFACE
      ?auto_285670 - SURFACE
      ?auto_285671 - SURFACE
      ?auto_285672 - SURFACE
    )
    :vars
    (
      ?auto_285678 - HOIST
      ?auto_285674 - PLACE
      ?auto_285675 - PLACE
      ?auto_285677 - HOIST
      ?auto_285679 - SURFACE
      ?auto_285676 - SURFACE
      ?auto_285673 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285678 ?auto_285674 ) ( IS-CRATE ?auto_285672 ) ( not ( = ?auto_285671 ?auto_285672 ) ) ( not ( = ?auto_285670 ?auto_285671 ) ) ( not ( = ?auto_285670 ?auto_285672 ) ) ( not ( = ?auto_285675 ?auto_285674 ) ) ( HOIST-AT ?auto_285677 ?auto_285675 ) ( not ( = ?auto_285678 ?auto_285677 ) ) ( SURFACE-AT ?auto_285672 ?auto_285675 ) ( ON ?auto_285672 ?auto_285679 ) ( CLEAR ?auto_285672 ) ( not ( = ?auto_285671 ?auto_285679 ) ) ( not ( = ?auto_285672 ?auto_285679 ) ) ( not ( = ?auto_285670 ?auto_285679 ) ) ( IS-CRATE ?auto_285671 ) ( AVAILABLE ?auto_285677 ) ( SURFACE-AT ?auto_285671 ?auto_285675 ) ( ON ?auto_285671 ?auto_285676 ) ( CLEAR ?auto_285671 ) ( not ( = ?auto_285671 ?auto_285676 ) ) ( not ( = ?auto_285672 ?auto_285676 ) ) ( not ( = ?auto_285670 ?auto_285676 ) ) ( not ( = ?auto_285679 ?auto_285676 ) ) ( TRUCK-AT ?auto_285673 ?auto_285674 ) ( SURFACE-AT ?auto_285669 ?auto_285674 ) ( CLEAR ?auto_285669 ) ( LIFTING ?auto_285678 ?auto_285670 ) ( IS-CRATE ?auto_285670 ) ( not ( = ?auto_285669 ?auto_285670 ) ) ( not ( = ?auto_285671 ?auto_285669 ) ) ( not ( = ?auto_285672 ?auto_285669 ) ) ( not ( = ?auto_285679 ?auto_285669 ) ) ( not ( = ?auto_285676 ?auto_285669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285670 ?auto_285671 ?auto_285672 )
      ( MAKE-3CRATE-VERIFY ?auto_285669 ?auto_285670 ?auto_285671 ?auto_285672 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_285680 - SURFACE
      ?auto_285681 - SURFACE
      ?auto_285682 - SURFACE
      ?auto_285683 - SURFACE
      ?auto_285684 - SURFACE
    )
    :vars
    (
      ?auto_285690 - HOIST
      ?auto_285686 - PLACE
      ?auto_285687 - PLACE
      ?auto_285689 - HOIST
      ?auto_285691 - SURFACE
      ?auto_285688 - SURFACE
      ?auto_285685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285690 ?auto_285686 ) ( IS-CRATE ?auto_285684 ) ( not ( = ?auto_285683 ?auto_285684 ) ) ( not ( = ?auto_285682 ?auto_285683 ) ) ( not ( = ?auto_285682 ?auto_285684 ) ) ( not ( = ?auto_285687 ?auto_285686 ) ) ( HOIST-AT ?auto_285689 ?auto_285687 ) ( not ( = ?auto_285690 ?auto_285689 ) ) ( SURFACE-AT ?auto_285684 ?auto_285687 ) ( ON ?auto_285684 ?auto_285691 ) ( CLEAR ?auto_285684 ) ( not ( = ?auto_285683 ?auto_285691 ) ) ( not ( = ?auto_285684 ?auto_285691 ) ) ( not ( = ?auto_285682 ?auto_285691 ) ) ( IS-CRATE ?auto_285683 ) ( AVAILABLE ?auto_285689 ) ( SURFACE-AT ?auto_285683 ?auto_285687 ) ( ON ?auto_285683 ?auto_285688 ) ( CLEAR ?auto_285683 ) ( not ( = ?auto_285683 ?auto_285688 ) ) ( not ( = ?auto_285684 ?auto_285688 ) ) ( not ( = ?auto_285682 ?auto_285688 ) ) ( not ( = ?auto_285691 ?auto_285688 ) ) ( TRUCK-AT ?auto_285685 ?auto_285686 ) ( SURFACE-AT ?auto_285681 ?auto_285686 ) ( CLEAR ?auto_285681 ) ( LIFTING ?auto_285690 ?auto_285682 ) ( IS-CRATE ?auto_285682 ) ( not ( = ?auto_285681 ?auto_285682 ) ) ( not ( = ?auto_285683 ?auto_285681 ) ) ( not ( = ?auto_285684 ?auto_285681 ) ) ( not ( = ?auto_285691 ?auto_285681 ) ) ( not ( = ?auto_285688 ?auto_285681 ) ) ( ON ?auto_285681 ?auto_285680 ) ( not ( = ?auto_285680 ?auto_285681 ) ) ( not ( = ?auto_285680 ?auto_285682 ) ) ( not ( = ?auto_285680 ?auto_285683 ) ) ( not ( = ?auto_285680 ?auto_285684 ) ) ( not ( = ?auto_285680 ?auto_285691 ) ) ( not ( = ?auto_285680 ?auto_285688 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285682 ?auto_285683 ?auto_285684 )
      ( MAKE-4CRATE-VERIFY ?auto_285680 ?auto_285681 ?auto_285682 ?auto_285683 ?auto_285684 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_285692 - SURFACE
      ?auto_285693 - SURFACE
      ?auto_285694 - SURFACE
      ?auto_285695 - SURFACE
      ?auto_285696 - SURFACE
      ?auto_285697 - SURFACE
    )
    :vars
    (
      ?auto_285703 - HOIST
      ?auto_285699 - PLACE
      ?auto_285700 - PLACE
      ?auto_285702 - HOIST
      ?auto_285704 - SURFACE
      ?auto_285701 - SURFACE
      ?auto_285698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285703 ?auto_285699 ) ( IS-CRATE ?auto_285697 ) ( not ( = ?auto_285696 ?auto_285697 ) ) ( not ( = ?auto_285695 ?auto_285696 ) ) ( not ( = ?auto_285695 ?auto_285697 ) ) ( not ( = ?auto_285700 ?auto_285699 ) ) ( HOIST-AT ?auto_285702 ?auto_285700 ) ( not ( = ?auto_285703 ?auto_285702 ) ) ( SURFACE-AT ?auto_285697 ?auto_285700 ) ( ON ?auto_285697 ?auto_285704 ) ( CLEAR ?auto_285697 ) ( not ( = ?auto_285696 ?auto_285704 ) ) ( not ( = ?auto_285697 ?auto_285704 ) ) ( not ( = ?auto_285695 ?auto_285704 ) ) ( IS-CRATE ?auto_285696 ) ( AVAILABLE ?auto_285702 ) ( SURFACE-AT ?auto_285696 ?auto_285700 ) ( ON ?auto_285696 ?auto_285701 ) ( CLEAR ?auto_285696 ) ( not ( = ?auto_285696 ?auto_285701 ) ) ( not ( = ?auto_285697 ?auto_285701 ) ) ( not ( = ?auto_285695 ?auto_285701 ) ) ( not ( = ?auto_285704 ?auto_285701 ) ) ( TRUCK-AT ?auto_285698 ?auto_285699 ) ( SURFACE-AT ?auto_285694 ?auto_285699 ) ( CLEAR ?auto_285694 ) ( LIFTING ?auto_285703 ?auto_285695 ) ( IS-CRATE ?auto_285695 ) ( not ( = ?auto_285694 ?auto_285695 ) ) ( not ( = ?auto_285696 ?auto_285694 ) ) ( not ( = ?auto_285697 ?auto_285694 ) ) ( not ( = ?auto_285704 ?auto_285694 ) ) ( not ( = ?auto_285701 ?auto_285694 ) ) ( ON ?auto_285693 ?auto_285692 ) ( ON ?auto_285694 ?auto_285693 ) ( not ( = ?auto_285692 ?auto_285693 ) ) ( not ( = ?auto_285692 ?auto_285694 ) ) ( not ( = ?auto_285692 ?auto_285695 ) ) ( not ( = ?auto_285692 ?auto_285696 ) ) ( not ( = ?auto_285692 ?auto_285697 ) ) ( not ( = ?auto_285692 ?auto_285704 ) ) ( not ( = ?auto_285692 ?auto_285701 ) ) ( not ( = ?auto_285693 ?auto_285694 ) ) ( not ( = ?auto_285693 ?auto_285695 ) ) ( not ( = ?auto_285693 ?auto_285696 ) ) ( not ( = ?auto_285693 ?auto_285697 ) ) ( not ( = ?auto_285693 ?auto_285704 ) ) ( not ( = ?auto_285693 ?auto_285701 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285695 ?auto_285696 ?auto_285697 )
      ( MAKE-5CRATE-VERIFY ?auto_285692 ?auto_285693 ?auto_285694 ?auto_285695 ?auto_285696 ?auto_285697 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_285705 - SURFACE
      ?auto_285706 - SURFACE
      ?auto_285707 - SURFACE
      ?auto_285708 - SURFACE
      ?auto_285709 - SURFACE
      ?auto_285710 - SURFACE
      ?auto_285711 - SURFACE
    )
    :vars
    (
      ?auto_285717 - HOIST
      ?auto_285713 - PLACE
      ?auto_285714 - PLACE
      ?auto_285716 - HOIST
      ?auto_285718 - SURFACE
      ?auto_285715 - SURFACE
      ?auto_285712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285717 ?auto_285713 ) ( IS-CRATE ?auto_285711 ) ( not ( = ?auto_285710 ?auto_285711 ) ) ( not ( = ?auto_285709 ?auto_285710 ) ) ( not ( = ?auto_285709 ?auto_285711 ) ) ( not ( = ?auto_285714 ?auto_285713 ) ) ( HOIST-AT ?auto_285716 ?auto_285714 ) ( not ( = ?auto_285717 ?auto_285716 ) ) ( SURFACE-AT ?auto_285711 ?auto_285714 ) ( ON ?auto_285711 ?auto_285718 ) ( CLEAR ?auto_285711 ) ( not ( = ?auto_285710 ?auto_285718 ) ) ( not ( = ?auto_285711 ?auto_285718 ) ) ( not ( = ?auto_285709 ?auto_285718 ) ) ( IS-CRATE ?auto_285710 ) ( AVAILABLE ?auto_285716 ) ( SURFACE-AT ?auto_285710 ?auto_285714 ) ( ON ?auto_285710 ?auto_285715 ) ( CLEAR ?auto_285710 ) ( not ( = ?auto_285710 ?auto_285715 ) ) ( not ( = ?auto_285711 ?auto_285715 ) ) ( not ( = ?auto_285709 ?auto_285715 ) ) ( not ( = ?auto_285718 ?auto_285715 ) ) ( TRUCK-AT ?auto_285712 ?auto_285713 ) ( SURFACE-AT ?auto_285708 ?auto_285713 ) ( CLEAR ?auto_285708 ) ( LIFTING ?auto_285717 ?auto_285709 ) ( IS-CRATE ?auto_285709 ) ( not ( = ?auto_285708 ?auto_285709 ) ) ( not ( = ?auto_285710 ?auto_285708 ) ) ( not ( = ?auto_285711 ?auto_285708 ) ) ( not ( = ?auto_285718 ?auto_285708 ) ) ( not ( = ?auto_285715 ?auto_285708 ) ) ( ON ?auto_285706 ?auto_285705 ) ( ON ?auto_285707 ?auto_285706 ) ( ON ?auto_285708 ?auto_285707 ) ( not ( = ?auto_285705 ?auto_285706 ) ) ( not ( = ?auto_285705 ?auto_285707 ) ) ( not ( = ?auto_285705 ?auto_285708 ) ) ( not ( = ?auto_285705 ?auto_285709 ) ) ( not ( = ?auto_285705 ?auto_285710 ) ) ( not ( = ?auto_285705 ?auto_285711 ) ) ( not ( = ?auto_285705 ?auto_285718 ) ) ( not ( = ?auto_285705 ?auto_285715 ) ) ( not ( = ?auto_285706 ?auto_285707 ) ) ( not ( = ?auto_285706 ?auto_285708 ) ) ( not ( = ?auto_285706 ?auto_285709 ) ) ( not ( = ?auto_285706 ?auto_285710 ) ) ( not ( = ?auto_285706 ?auto_285711 ) ) ( not ( = ?auto_285706 ?auto_285718 ) ) ( not ( = ?auto_285706 ?auto_285715 ) ) ( not ( = ?auto_285707 ?auto_285708 ) ) ( not ( = ?auto_285707 ?auto_285709 ) ) ( not ( = ?auto_285707 ?auto_285710 ) ) ( not ( = ?auto_285707 ?auto_285711 ) ) ( not ( = ?auto_285707 ?auto_285718 ) ) ( not ( = ?auto_285707 ?auto_285715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285709 ?auto_285710 ?auto_285711 )
      ( MAKE-6CRATE-VERIFY ?auto_285705 ?auto_285706 ?auto_285707 ?auto_285708 ?auto_285709 ?auto_285710 ?auto_285711 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_285719 - SURFACE
      ?auto_285720 - SURFACE
      ?auto_285721 - SURFACE
      ?auto_285722 - SURFACE
      ?auto_285723 - SURFACE
      ?auto_285724 - SURFACE
      ?auto_285725 - SURFACE
      ?auto_285726 - SURFACE
    )
    :vars
    (
      ?auto_285732 - HOIST
      ?auto_285728 - PLACE
      ?auto_285729 - PLACE
      ?auto_285731 - HOIST
      ?auto_285733 - SURFACE
      ?auto_285730 - SURFACE
      ?auto_285727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285732 ?auto_285728 ) ( IS-CRATE ?auto_285726 ) ( not ( = ?auto_285725 ?auto_285726 ) ) ( not ( = ?auto_285724 ?auto_285725 ) ) ( not ( = ?auto_285724 ?auto_285726 ) ) ( not ( = ?auto_285729 ?auto_285728 ) ) ( HOIST-AT ?auto_285731 ?auto_285729 ) ( not ( = ?auto_285732 ?auto_285731 ) ) ( SURFACE-AT ?auto_285726 ?auto_285729 ) ( ON ?auto_285726 ?auto_285733 ) ( CLEAR ?auto_285726 ) ( not ( = ?auto_285725 ?auto_285733 ) ) ( not ( = ?auto_285726 ?auto_285733 ) ) ( not ( = ?auto_285724 ?auto_285733 ) ) ( IS-CRATE ?auto_285725 ) ( AVAILABLE ?auto_285731 ) ( SURFACE-AT ?auto_285725 ?auto_285729 ) ( ON ?auto_285725 ?auto_285730 ) ( CLEAR ?auto_285725 ) ( not ( = ?auto_285725 ?auto_285730 ) ) ( not ( = ?auto_285726 ?auto_285730 ) ) ( not ( = ?auto_285724 ?auto_285730 ) ) ( not ( = ?auto_285733 ?auto_285730 ) ) ( TRUCK-AT ?auto_285727 ?auto_285728 ) ( SURFACE-AT ?auto_285723 ?auto_285728 ) ( CLEAR ?auto_285723 ) ( LIFTING ?auto_285732 ?auto_285724 ) ( IS-CRATE ?auto_285724 ) ( not ( = ?auto_285723 ?auto_285724 ) ) ( not ( = ?auto_285725 ?auto_285723 ) ) ( not ( = ?auto_285726 ?auto_285723 ) ) ( not ( = ?auto_285733 ?auto_285723 ) ) ( not ( = ?auto_285730 ?auto_285723 ) ) ( ON ?auto_285720 ?auto_285719 ) ( ON ?auto_285721 ?auto_285720 ) ( ON ?auto_285722 ?auto_285721 ) ( ON ?auto_285723 ?auto_285722 ) ( not ( = ?auto_285719 ?auto_285720 ) ) ( not ( = ?auto_285719 ?auto_285721 ) ) ( not ( = ?auto_285719 ?auto_285722 ) ) ( not ( = ?auto_285719 ?auto_285723 ) ) ( not ( = ?auto_285719 ?auto_285724 ) ) ( not ( = ?auto_285719 ?auto_285725 ) ) ( not ( = ?auto_285719 ?auto_285726 ) ) ( not ( = ?auto_285719 ?auto_285733 ) ) ( not ( = ?auto_285719 ?auto_285730 ) ) ( not ( = ?auto_285720 ?auto_285721 ) ) ( not ( = ?auto_285720 ?auto_285722 ) ) ( not ( = ?auto_285720 ?auto_285723 ) ) ( not ( = ?auto_285720 ?auto_285724 ) ) ( not ( = ?auto_285720 ?auto_285725 ) ) ( not ( = ?auto_285720 ?auto_285726 ) ) ( not ( = ?auto_285720 ?auto_285733 ) ) ( not ( = ?auto_285720 ?auto_285730 ) ) ( not ( = ?auto_285721 ?auto_285722 ) ) ( not ( = ?auto_285721 ?auto_285723 ) ) ( not ( = ?auto_285721 ?auto_285724 ) ) ( not ( = ?auto_285721 ?auto_285725 ) ) ( not ( = ?auto_285721 ?auto_285726 ) ) ( not ( = ?auto_285721 ?auto_285733 ) ) ( not ( = ?auto_285721 ?auto_285730 ) ) ( not ( = ?auto_285722 ?auto_285723 ) ) ( not ( = ?auto_285722 ?auto_285724 ) ) ( not ( = ?auto_285722 ?auto_285725 ) ) ( not ( = ?auto_285722 ?auto_285726 ) ) ( not ( = ?auto_285722 ?auto_285733 ) ) ( not ( = ?auto_285722 ?auto_285730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285724 ?auto_285725 ?auto_285726 )
      ( MAKE-7CRATE-VERIFY ?auto_285719 ?auto_285720 ?auto_285721 ?auto_285722 ?auto_285723 ?auto_285724 ?auto_285725 ?auto_285726 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_285734 - SURFACE
      ?auto_285735 - SURFACE
      ?auto_285736 - SURFACE
      ?auto_285737 - SURFACE
      ?auto_285738 - SURFACE
      ?auto_285739 - SURFACE
      ?auto_285740 - SURFACE
      ?auto_285741 - SURFACE
      ?auto_285742 - SURFACE
    )
    :vars
    (
      ?auto_285748 - HOIST
      ?auto_285744 - PLACE
      ?auto_285745 - PLACE
      ?auto_285747 - HOIST
      ?auto_285749 - SURFACE
      ?auto_285746 - SURFACE
      ?auto_285743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285748 ?auto_285744 ) ( IS-CRATE ?auto_285742 ) ( not ( = ?auto_285741 ?auto_285742 ) ) ( not ( = ?auto_285740 ?auto_285741 ) ) ( not ( = ?auto_285740 ?auto_285742 ) ) ( not ( = ?auto_285745 ?auto_285744 ) ) ( HOIST-AT ?auto_285747 ?auto_285745 ) ( not ( = ?auto_285748 ?auto_285747 ) ) ( SURFACE-AT ?auto_285742 ?auto_285745 ) ( ON ?auto_285742 ?auto_285749 ) ( CLEAR ?auto_285742 ) ( not ( = ?auto_285741 ?auto_285749 ) ) ( not ( = ?auto_285742 ?auto_285749 ) ) ( not ( = ?auto_285740 ?auto_285749 ) ) ( IS-CRATE ?auto_285741 ) ( AVAILABLE ?auto_285747 ) ( SURFACE-AT ?auto_285741 ?auto_285745 ) ( ON ?auto_285741 ?auto_285746 ) ( CLEAR ?auto_285741 ) ( not ( = ?auto_285741 ?auto_285746 ) ) ( not ( = ?auto_285742 ?auto_285746 ) ) ( not ( = ?auto_285740 ?auto_285746 ) ) ( not ( = ?auto_285749 ?auto_285746 ) ) ( TRUCK-AT ?auto_285743 ?auto_285744 ) ( SURFACE-AT ?auto_285739 ?auto_285744 ) ( CLEAR ?auto_285739 ) ( LIFTING ?auto_285748 ?auto_285740 ) ( IS-CRATE ?auto_285740 ) ( not ( = ?auto_285739 ?auto_285740 ) ) ( not ( = ?auto_285741 ?auto_285739 ) ) ( not ( = ?auto_285742 ?auto_285739 ) ) ( not ( = ?auto_285749 ?auto_285739 ) ) ( not ( = ?auto_285746 ?auto_285739 ) ) ( ON ?auto_285735 ?auto_285734 ) ( ON ?auto_285736 ?auto_285735 ) ( ON ?auto_285737 ?auto_285736 ) ( ON ?auto_285738 ?auto_285737 ) ( ON ?auto_285739 ?auto_285738 ) ( not ( = ?auto_285734 ?auto_285735 ) ) ( not ( = ?auto_285734 ?auto_285736 ) ) ( not ( = ?auto_285734 ?auto_285737 ) ) ( not ( = ?auto_285734 ?auto_285738 ) ) ( not ( = ?auto_285734 ?auto_285739 ) ) ( not ( = ?auto_285734 ?auto_285740 ) ) ( not ( = ?auto_285734 ?auto_285741 ) ) ( not ( = ?auto_285734 ?auto_285742 ) ) ( not ( = ?auto_285734 ?auto_285749 ) ) ( not ( = ?auto_285734 ?auto_285746 ) ) ( not ( = ?auto_285735 ?auto_285736 ) ) ( not ( = ?auto_285735 ?auto_285737 ) ) ( not ( = ?auto_285735 ?auto_285738 ) ) ( not ( = ?auto_285735 ?auto_285739 ) ) ( not ( = ?auto_285735 ?auto_285740 ) ) ( not ( = ?auto_285735 ?auto_285741 ) ) ( not ( = ?auto_285735 ?auto_285742 ) ) ( not ( = ?auto_285735 ?auto_285749 ) ) ( not ( = ?auto_285735 ?auto_285746 ) ) ( not ( = ?auto_285736 ?auto_285737 ) ) ( not ( = ?auto_285736 ?auto_285738 ) ) ( not ( = ?auto_285736 ?auto_285739 ) ) ( not ( = ?auto_285736 ?auto_285740 ) ) ( not ( = ?auto_285736 ?auto_285741 ) ) ( not ( = ?auto_285736 ?auto_285742 ) ) ( not ( = ?auto_285736 ?auto_285749 ) ) ( not ( = ?auto_285736 ?auto_285746 ) ) ( not ( = ?auto_285737 ?auto_285738 ) ) ( not ( = ?auto_285737 ?auto_285739 ) ) ( not ( = ?auto_285737 ?auto_285740 ) ) ( not ( = ?auto_285737 ?auto_285741 ) ) ( not ( = ?auto_285737 ?auto_285742 ) ) ( not ( = ?auto_285737 ?auto_285749 ) ) ( not ( = ?auto_285737 ?auto_285746 ) ) ( not ( = ?auto_285738 ?auto_285739 ) ) ( not ( = ?auto_285738 ?auto_285740 ) ) ( not ( = ?auto_285738 ?auto_285741 ) ) ( not ( = ?auto_285738 ?auto_285742 ) ) ( not ( = ?auto_285738 ?auto_285749 ) ) ( not ( = ?auto_285738 ?auto_285746 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285740 ?auto_285741 ?auto_285742 )
      ( MAKE-8CRATE-VERIFY ?auto_285734 ?auto_285735 ?auto_285736 ?auto_285737 ?auto_285738 ?auto_285739 ?auto_285740 ?auto_285741 ?auto_285742 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_285750 - SURFACE
      ?auto_285751 - SURFACE
      ?auto_285752 - SURFACE
      ?auto_285753 - SURFACE
      ?auto_285754 - SURFACE
      ?auto_285755 - SURFACE
      ?auto_285756 - SURFACE
      ?auto_285757 - SURFACE
      ?auto_285758 - SURFACE
      ?auto_285759 - SURFACE
    )
    :vars
    (
      ?auto_285765 - HOIST
      ?auto_285761 - PLACE
      ?auto_285762 - PLACE
      ?auto_285764 - HOIST
      ?auto_285766 - SURFACE
      ?auto_285763 - SURFACE
      ?auto_285760 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285765 ?auto_285761 ) ( IS-CRATE ?auto_285759 ) ( not ( = ?auto_285758 ?auto_285759 ) ) ( not ( = ?auto_285757 ?auto_285758 ) ) ( not ( = ?auto_285757 ?auto_285759 ) ) ( not ( = ?auto_285762 ?auto_285761 ) ) ( HOIST-AT ?auto_285764 ?auto_285762 ) ( not ( = ?auto_285765 ?auto_285764 ) ) ( SURFACE-AT ?auto_285759 ?auto_285762 ) ( ON ?auto_285759 ?auto_285766 ) ( CLEAR ?auto_285759 ) ( not ( = ?auto_285758 ?auto_285766 ) ) ( not ( = ?auto_285759 ?auto_285766 ) ) ( not ( = ?auto_285757 ?auto_285766 ) ) ( IS-CRATE ?auto_285758 ) ( AVAILABLE ?auto_285764 ) ( SURFACE-AT ?auto_285758 ?auto_285762 ) ( ON ?auto_285758 ?auto_285763 ) ( CLEAR ?auto_285758 ) ( not ( = ?auto_285758 ?auto_285763 ) ) ( not ( = ?auto_285759 ?auto_285763 ) ) ( not ( = ?auto_285757 ?auto_285763 ) ) ( not ( = ?auto_285766 ?auto_285763 ) ) ( TRUCK-AT ?auto_285760 ?auto_285761 ) ( SURFACE-AT ?auto_285756 ?auto_285761 ) ( CLEAR ?auto_285756 ) ( LIFTING ?auto_285765 ?auto_285757 ) ( IS-CRATE ?auto_285757 ) ( not ( = ?auto_285756 ?auto_285757 ) ) ( not ( = ?auto_285758 ?auto_285756 ) ) ( not ( = ?auto_285759 ?auto_285756 ) ) ( not ( = ?auto_285766 ?auto_285756 ) ) ( not ( = ?auto_285763 ?auto_285756 ) ) ( ON ?auto_285751 ?auto_285750 ) ( ON ?auto_285752 ?auto_285751 ) ( ON ?auto_285753 ?auto_285752 ) ( ON ?auto_285754 ?auto_285753 ) ( ON ?auto_285755 ?auto_285754 ) ( ON ?auto_285756 ?auto_285755 ) ( not ( = ?auto_285750 ?auto_285751 ) ) ( not ( = ?auto_285750 ?auto_285752 ) ) ( not ( = ?auto_285750 ?auto_285753 ) ) ( not ( = ?auto_285750 ?auto_285754 ) ) ( not ( = ?auto_285750 ?auto_285755 ) ) ( not ( = ?auto_285750 ?auto_285756 ) ) ( not ( = ?auto_285750 ?auto_285757 ) ) ( not ( = ?auto_285750 ?auto_285758 ) ) ( not ( = ?auto_285750 ?auto_285759 ) ) ( not ( = ?auto_285750 ?auto_285766 ) ) ( not ( = ?auto_285750 ?auto_285763 ) ) ( not ( = ?auto_285751 ?auto_285752 ) ) ( not ( = ?auto_285751 ?auto_285753 ) ) ( not ( = ?auto_285751 ?auto_285754 ) ) ( not ( = ?auto_285751 ?auto_285755 ) ) ( not ( = ?auto_285751 ?auto_285756 ) ) ( not ( = ?auto_285751 ?auto_285757 ) ) ( not ( = ?auto_285751 ?auto_285758 ) ) ( not ( = ?auto_285751 ?auto_285759 ) ) ( not ( = ?auto_285751 ?auto_285766 ) ) ( not ( = ?auto_285751 ?auto_285763 ) ) ( not ( = ?auto_285752 ?auto_285753 ) ) ( not ( = ?auto_285752 ?auto_285754 ) ) ( not ( = ?auto_285752 ?auto_285755 ) ) ( not ( = ?auto_285752 ?auto_285756 ) ) ( not ( = ?auto_285752 ?auto_285757 ) ) ( not ( = ?auto_285752 ?auto_285758 ) ) ( not ( = ?auto_285752 ?auto_285759 ) ) ( not ( = ?auto_285752 ?auto_285766 ) ) ( not ( = ?auto_285752 ?auto_285763 ) ) ( not ( = ?auto_285753 ?auto_285754 ) ) ( not ( = ?auto_285753 ?auto_285755 ) ) ( not ( = ?auto_285753 ?auto_285756 ) ) ( not ( = ?auto_285753 ?auto_285757 ) ) ( not ( = ?auto_285753 ?auto_285758 ) ) ( not ( = ?auto_285753 ?auto_285759 ) ) ( not ( = ?auto_285753 ?auto_285766 ) ) ( not ( = ?auto_285753 ?auto_285763 ) ) ( not ( = ?auto_285754 ?auto_285755 ) ) ( not ( = ?auto_285754 ?auto_285756 ) ) ( not ( = ?auto_285754 ?auto_285757 ) ) ( not ( = ?auto_285754 ?auto_285758 ) ) ( not ( = ?auto_285754 ?auto_285759 ) ) ( not ( = ?auto_285754 ?auto_285766 ) ) ( not ( = ?auto_285754 ?auto_285763 ) ) ( not ( = ?auto_285755 ?auto_285756 ) ) ( not ( = ?auto_285755 ?auto_285757 ) ) ( not ( = ?auto_285755 ?auto_285758 ) ) ( not ( = ?auto_285755 ?auto_285759 ) ) ( not ( = ?auto_285755 ?auto_285766 ) ) ( not ( = ?auto_285755 ?auto_285763 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285757 ?auto_285758 ?auto_285759 )
      ( MAKE-9CRATE-VERIFY ?auto_285750 ?auto_285751 ?auto_285752 ?auto_285753 ?auto_285754 ?auto_285755 ?auto_285756 ?auto_285757 ?auto_285758 ?auto_285759 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_285767 - SURFACE
      ?auto_285768 - SURFACE
      ?auto_285769 - SURFACE
      ?auto_285770 - SURFACE
      ?auto_285771 - SURFACE
      ?auto_285772 - SURFACE
      ?auto_285773 - SURFACE
      ?auto_285774 - SURFACE
      ?auto_285775 - SURFACE
      ?auto_285776 - SURFACE
      ?auto_285777 - SURFACE
    )
    :vars
    (
      ?auto_285783 - HOIST
      ?auto_285779 - PLACE
      ?auto_285780 - PLACE
      ?auto_285782 - HOIST
      ?auto_285784 - SURFACE
      ?auto_285781 - SURFACE
      ?auto_285778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_285783 ?auto_285779 ) ( IS-CRATE ?auto_285777 ) ( not ( = ?auto_285776 ?auto_285777 ) ) ( not ( = ?auto_285775 ?auto_285776 ) ) ( not ( = ?auto_285775 ?auto_285777 ) ) ( not ( = ?auto_285780 ?auto_285779 ) ) ( HOIST-AT ?auto_285782 ?auto_285780 ) ( not ( = ?auto_285783 ?auto_285782 ) ) ( SURFACE-AT ?auto_285777 ?auto_285780 ) ( ON ?auto_285777 ?auto_285784 ) ( CLEAR ?auto_285777 ) ( not ( = ?auto_285776 ?auto_285784 ) ) ( not ( = ?auto_285777 ?auto_285784 ) ) ( not ( = ?auto_285775 ?auto_285784 ) ) ( IS-CRATE ?auto_285776 ) ( AVAILABLE ?auto_285782 ) ( SURFACE-AT ?auto_285776 ?auto_285780 ) ( ON ?auto_285776 ?auto_285781 ) ( CLEAR ?auto_285776 ) ( not ( = ?auto_285776 ?auto_285781 ) ) ( not ( = ?auto_285777 ?auto_285781 ) ) ( not ( = ?auto_285775 ?auto_285781 ) ) ( not ( = ?auto_285784 ?auto_285781 ) ) ( TRUCK-AT ?auto_285778 ?auto_285779 ) ( SURFACE-AT ?auto_285774 ?auto_285779 ) ( CLEAR ?auto_285774 ) ( LIFTING ?auto_285783 ?auto_285775 ) ( IS-CRATE ?auto_285775 ) ( not ( = ?auto_285774 ?auto_285775 ) ) ( not ( = ?auto_285776 ?auto_285774 ) ) ( not ( = ?auto_285777 ?auto_285774 ) ) ( not ( = ?auto_285784 ?auto_285774 ) ) ( not ( = ?auto_285781 ?auto_285774 ) ) ( ON ?auto_285768 ?auto_285767 ) ( ON ?auto_285769 ?auto_285768 ) ( ON ?auto_285770 ?auto_285769 ) ( ON ?auto_285771 ?auto_285770 ) ( ON ?auto_285772 ?auto_285771 ) ( ON ?auto_285773 ?auto_285772 ) ( ON ?auto_285774 ?auto_285773 ) ( not ( = ?auto_285767 ?auto_285768 ) ) ( not ( = ?auto_285767 ?auto_285769 ) ) ( not ( = ?auto_285767 ?auto_285770 ) ) ( not ( = ?auto_285767 ?auto_285771 ) ) ( not ( = ?auto_285767 ?auto_285772 ) ) ( not ( = ?auto_285767 ?auto_285773 ) ) ( not ( = ?auto_285767 ?auto_285774 ) ) ( not ( = ?auto_285767 ?auto_285775 ) ) ( not ( = ?auto_285767 ?auto_285776 ) ) ( not ( = ?auto_285767 ?auto_285777 ) ) ( not ( = ?auto_285767 ?auto_285784 ) ) ( not ( = ?auto_285767 ?auto_285781 ) ) ( not ( = ?auto_285768 ?auto_285769 ) ) ( not ( = ?auto_285768 ?auto_285770 ) ) ( not ( = ?auto_285768 ?auto_285771 ) ) ( not ( = ?auto_285768 ?auto_285772 ) ) ( not ( = ?auto_285768 ?auto_285773 ) ) ( not ( = ?auto_285768 ?auto_285774 ) ) ( not ( = ?auto_285768 ?auto_285775 ) ) ( not ( = ?auto_285768 ?auto_285776 ) ) ( not ( = ?auto_285768 ?auto_285777 ) ) ( not ( = ?auto_285768 ?auto_285784 ) ) ( not ( = ?auto_285768 ?auto_285781 ) ) ( not ( = ?auto_285769 ?auto_285770 ) ) ( not ( = ?auto_285769 ?auto_285771 ) ) ( not ( = ?auto_285769 ?auto_285772 ) ) ( not ( = ?auto_285769 ?auto_285773 ) ) ( not ( = ?auto_285769 ?auto_285774 ) ) ( not ( = ?auto_285769 ?auto_285775 ) ) ( not ( = ?auto_285769 ?auto_285776 ) ) ( not ( = ?auto_285769 ?auto_285777 ) ) ( not ( = ?auto_285769 ?auto_285784 ) ) ( not ( = ?auto_285769 ?auto_285781 ) ) ( not ( = ?auto_285770 ?auto_285771 ) ) ( not ( = ?auto_285770 ?auto_285772 ) ) ( not ( = ?auto_285770 ?auto_285773 ) ) ( not ( = ?auto_285770 ?auto_285774 ) ) ( not ( = ?auto_285770 ?auto_285775 ) ) ( not ( = ?auto_285770 ?auto_285776 ) ) ( not ( = ?auto_285770 ?auto_285777 ) ) ( not ( = ?auto_285770 ?auto_285784 ) ) ( not ( = ?auto_285770 ?auto_285781 ) ) ( not ( = ?auto_285771 ?auto_285772 ) ) ( not ( = ?auto_285771 ?auto_285773 ) ) ( not ( = ?auto_285771 ?auto_285774 ) ) ( not ( = ?auto_285771 ?auto_285775 ) ) ( not ( = ?auto_285771 ?auto_285776 ) ) ( not ( = ?auto_285771 ?auto_285777 ) ) ( not ( = ?auto_285771 ?auto_285784 ) ) ( not ( = ?auto_285771 ?auto_285781 ) ) ( not ( = ?auto_285772 ?auto_285773 ) ) ( not ( = ?auto_285772 ?auto_285774 ) ) ( not ( = ?auto_285772 ?auto_285775 ) ) ( not ( = ?auto_285772 ?auto_285776 ) ) ( not ( = ?auto_285772 ?auto_285777 ) ) ( not ( = ?auto_285772 ?auto_285784 ) ) ( not ( = ?auto_285772 ?auto_285781 ) ) ( not ( = ?auto_285773 ?auto_285774 ) ) ( not ( = ?auto_285773 ?auto_285775 ) ) ( not ( = ?auto_285773 ?auto_285776 ) ) ( not ( = ?auto_285773 ?auto_285777 ) ) ( not ( = ?auto_285773 ?auto_285784 ) ) ( not ( = ?auto_285773 ?auto_285781 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_285775 ?auto_285776 ?auto_285777 )
      ( MAKE-10CRATE-VERIFY ?auto_285767 ?auto_285768 ?auto_285769 ?auto_285770 ?auto_285771 ?auto_285772 ?auto_285773 ?auto_285774 ?auto_285775 ?auto_285776 ?auto_285777 ) )
  )

)

