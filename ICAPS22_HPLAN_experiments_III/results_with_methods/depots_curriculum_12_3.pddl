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
      ?auto_12416 - SURFACE
      ?auto_12417 - SURFACE
    )
    :vars
    (
      ?auto_12418 - HOIST
      ?auto_12419 - PLACE
      ?auto_12421 - PLACE
      ?auto_12422 - HOIST
      ?auto_12423 - SURFACE
      ?auto_12420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12418 ?auto_12419 ) ( SURFACE-AT ?auto_12416 ?auto_12419 ) ( CLEAR ?auto_12416 ) ( IS-CRATE ?auto_12417 ) ( AVAILABLE ?auto_12418 ) ( not ( = ?auto_12421 ?auto_12419 ) ) ( HOIST-AT ?auto_12422 ?auto_12421 ) ( AVAILABLE ?auto_12422 ) ( SURFACE-AT ?auto_12417 ?auto_12421 ) ( ON ?auto_12417 ?auto_12423 ) ( CLEAR ?auto_12417 ) ( TRUCK-AT ?auto_12420 ?auto_12419 ) ( not ( = ?auto_12416 ?auto_12417 ) ) ( not ( = ?auto_12416 ?auto_12423 ) ) ( not ( = ?auto_12417 ?auto_12423 ) ) ( not ( = ?auto_12418 ?auto_12422 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12420 ?auto_12419 ?auto_12421 )
      ( !LIFT ?auto_12422 ?auto_12417 ?auto_12423 ?auto_12421 )
      ( !LOAD ?auto_12422 ?auto_12417 ?auto_12420 ?auto_12421 )
      ( !DRIVE ?auto_12420 ?auto_12421 ?auto_12419 )
      ( !UNLOAD ?auto_12418 ?auto_12417 ?auto_12420 ?auto_12419 )
      ( !DROP ?auto_12418 ?auto_12417 ?auto_12416 ?auto_12419 )
      ( MAKE-1CRATE-VERIFY ?auto_12416 ?auto_12417 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12426 - SURFACE
      ?auto_12427 - SURFACE
    )
    :vars
    (
      ?auto_12428 - HOIST
      ?auto_12429 - PLACE
      ?auto_12431 - PLACE
      ?auto_12432 - HOIST
      ?auto_12433 - SURFACE
      ?auto_12430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12428 ?auto_12429 ) ( SURFACE-AT ?auto_12426 ?auto_12429 ) ( CLEAR ?auto_12426 ) ( IS-CRATE ?auto_12427 ) ( AVAILABLE ?auto_12428 ) ( not ( = ?auto_12431 ?auto_12429 ) ) ( HOIST-AT ?auto_12432 ?auto_12431 ) ( AVAILABLE ?auto_12432 ) ( SURFACE-AT ?auto_12427 ?auto_12431 ) ( ON ?auto_12427 ?auto_12433 ) ( CLEAR ?auto_12427 ) ( TRUCK-AT ?auto_12430 ?auto_12429 ) ( not ( = ?auto_12426 ?auto_12427 ) ) ( not ( = ?auto_12426 ?auto_12433 ) ) ( not ( = ?auto_12427 ?auto_12433 ) ) ( not ( = ?auto_12428 ?auto_12432 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12430 ?auto_12429 ?auto_12431 )
      ( !LIFT ?auto_12432 ?auto_12427 ?auto_12433 ?auto_12431 )
      ( !LOAD ?auto_12432 ?auto_12427 ?auto_12430 ?auto_12431 )
      ( !DRIVE ?auto_12430 ?auto_12431 ?auto_12429 )
      ( !UNLOAD ?auto_12428 ?auto_12427 ?auto_12430 ?auto_12429 )
      ( !DROP ?auto_12428 ?auto_12427 ?auto_12426 ?auto_12429 )
      ( MAKE-1CRATE-VERIFY ?auto_12426 ?auto_12427 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12437 - SURFACE
      ?auto_12438 - SURFACE
      ?auto_12439 - SURFACE
    )
    :vars
    (
      ?auto_12443 - HOIST
      ?auto_12445 - PLACE
      ?auto_12442 - PLACE
      ?auto_12441 - HOIST
      ?auto_12440 - SURFACE
      ?auto_12446 - PLACE
      ?auto_12447 - HOIST
      ?auto_12448 - SURFACE
      ?auto_12444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12443 ?auto_12445 ) ( IS-CRATE ?auto_12439 ) ( not ( = ?auto_12442 ?auto_12445 ) ) ( HOIST-AT ?auto_12441 ?auto_12442 ) ( AVAILABLE ?auto_12441 ) ( SURFACE-AT ?auto_12439 ?auto_12442 ) ( ON ?auto_12439 ?auto_12440 ) ( CLEAR ?auto_12439 ) ( not ( = ?auto_12438 ?auto_12439 ) ) ( not ( = ?auto_12438 ?auto_12440 ) ) ( not ( = ?auto_12439 ?auto_12440 ) ) ( not ( = ?auto_12443 ?auto_12441 ) ) ( SURFACE-AT ?auto_12437 ?auto_12445 ) ( CLEAR ?auto_12437 ) ( IS-CRATE ?auto_12438 ) ( AVAILABLE ?auto_12443 ) ( not ( = ?auto_12446 ?auto_12445 ) ) ( HOIST-AT ?auto_12447 ?auto_12446 ) ( AVAILABLE ?auto_12447 ) ( SURFACE-AT ?auto_12438 ?auto_12446 ) ( ON ?auto_12438 ?auto_12448 ) ( CLEAR ?auto_12438 ) ( TRUCK-AT ?auto_12444 ?auto_12445 ) ( not ( = ?auto_12437 ?auto_12438 ) ) ( not ( = ?auto_12437 ?auto_12448 ) ) ( not ( = ?auto_12438 ?auto_12448 ) ) ( not ( = ?auto_12443 ?auto_12447 ) ) ( not ( = ?auto_12437 ?auto_12439 ) ) ( not ( = ?auto_12437 ?auto_12440 ) ) ( not ( = ?auto_12439 ?auto_12448 ) ) ( not ( = ?auto_12442 ?auto_12446 ) ) ( not ( = ?auto_12441 ?auto_12447 ) ) ( not ( = ?auto_12440 ?auto_12448 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12437 ?auto_12438 )
      ( MAKE-1CRATE ?auto_12438 ?auto_12439 )
      ( MAKE-2CRATE-VERIFY ?auto_12437 ?auto_12438 ?auto_12439 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12451 - SURFACE
      ?auto_12452 - SURFACE
    )
    :vars
    (
      ?auto_12453 - HOIST
      ?auto_12454 - PLACE
      ?auto_12456 - PLACE
      ?auto_12457 - HOIST
      ?auto_12458 - SURFACE
      ?auto_12455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12453 ?auto_12454 ) ( SURFACE-AT ?auto_12451 ?auto_12454 ) ( CLEAR ?auto_12451 ) ( IS-CRATE ?auto_12452 ) ( AVAILABLE ?auto_12453 ) ( not ( = ?auto_12456 ?auto_12454 ) ) ( HOIST-AT ?auto_12457 ?auto_12456 ) ( AVAILABLE ?auto_12457 ) ( SURFACE-AT ?auto_12452 ?auto_12456 ) ( ON ?auto_12452 ?auto_12458 ) ( CLEAR ?auto_12452 ) ( TRUCK-AT ?auto_12455 ?auto_12454 ) ( not ( = ?auto_12451 ?auto_12452 ) ) ( not ( = ?auto_12451 ?auto_12458 ) ) ( not ( = ?auto_12452 ?auto_12458 ) ) ( not ( = ?auto_12453 ?auto_12457 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12455 ?auto_12454 ?auto_12456 )
      ( !LIFT ?auto_12457 ?auto_12452 ?auto_12458 ?auto_12456 )
      ( !LOAD ?auto_12457 ?auto_12452 ?auto_12455 ?auto_12456 )
      ( !DRIVE ?auto_12455 ?auto_12456 ?auto_12454 )
      ( !UNLOAD ?auto_12453 ?auto_12452 ?auto_12455 ?auto_12454 )
      ( !DROP ?auto_12453 ?auto_12452 ?auto_12451 ?auto_12454 )
      ( MAKE-1CRATE-VERIFY ?auto_12451 ?auto_12452 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12463 - SURFACE
      ?auto_12464 - SURFACE
      ?auto_12465 - SURFACE
      ?auto_12466 - SURFACE
    )
    :vars
    (
      ?auto_12468 - HOIST
      ?auto_12470 - PLACE
      ?auto_12472 - PLACE
      ?auto_12469 - HOIST
      ?auto_12471 - SURFACE
      ?auto_12473 - PLACE
      ?auto_12475 - HOIST
      ?auto_12476 - SURFACE
      ?auto_12478 - PLACE
      ?auto_12477 - HOIST
      ?auto_12474 - SURFACE
      ?auto_12467 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12468 ?auto_12470 ) ( IS-CRATE ?auto_12466 ) ( not ( = ?auto_12472 ?auto_12470 ) ) ( HOIST-AT ?auto_12469 ?auto_12472 ) ( AVAILABLE ?auto_12469 ) ( SURFACE-AT ?auto_12466 ?auto_12472 ) ( ON ?auto_12466 ?auto_12471 ) ( CLEAR ?auto_12466 ) ( not ( = ?auto_12465 ?auto_12466 ) ) ( not ( = ?auto_12465 ?auto_12471 ) ) ( not ( = ?auto_12466 ?auto_12471 ) ) ( not ( = ?auto_12468 ?auto_12469 ) ) ( IS-CRATE ?auto_12465 ) ( not ( = ?auto_12473 ?auto_12470 ) ) ( HOIST-AT ?auto_12475 ?auto_12473 ) ( AVAILABLE ?auto_12475 ) ( SURFACE-AT ?auto_12465 ?auto_12473 ) ( ON ?auto_12465 ?auto_12476 ) ( CLEAR ?auto_12465 ) ( not ( = ?auto_12464 ?auto_12465 ) ) ( not ( = ?auto_12464 ?auto_12476 ) ) ( not ( = ?auto_12465 ?auto_12476 ) ) ( not ( = ?auto_12468 ?auto_12475 ) ) ( SURFACE-AT ?auto_12463 ?auto_12470 ) ( CLEAR ?auto_12463 ) ( IS-CRATE ?auto_12464 ) ( AVAILABLE ?auto_12468 ) ( not ( = ?auto_12478 ?auto_12470 ) ) ( HOIST-AT ?auto_12477 ?auto_12478 ) ( AVAILABLE ?auto_12477 ) ( SURFACE-AT ?auto_12464 ?auto_12478 ) ( ON ?auto_12464 ?auto_12474 ) ( CLEAR ?auto_12464 ) ( TRUCK-AT ?auto_12467 ?auto_12470 ) ( not ( = ?auto_12463 ?auto_12464 ) ) ( not ( = ?auto_12463 ?auto_12474 ) ) ( not ( = ?auto_12464 ?auto_12474 ) ) ( not ( = ?auto_12468 ?auto_12477 ) ) ( not ( = ?auto_12463 ?auto_12465 ) ) ( not ( = ?auto_12463 ?auto_12476 ) ) ( not ( = ?auto_12465 ?auto_12474 ) ) ( not ( = ?auto_12473 ?auto_12478 ) ) ( not ( = ?auto_12475 ?auto_12477 ) ) ( not ( = ?auto_12476 ?auto_12474 ) ) ( not ( = ?auto_12463 ?auto_12466 ) ) ( not ( = ?auto_12463 ?auto_12471 ) ) ( not ( = ?auto_12464 ?auto_12466 ) ) ( not ( = ?auto_12464 ?auto_12471 ) ) ( not ( = ?auto_12466 ?auto_12476 ) ) ( not ( = ?auto_12466 ?auto_12474 ) ) ( not ( = ?auto_12472 ?auto_12473 ) ) ( not ( = ?auto_12472 ?auto_12478 ) ) ( not ( = ?auto_12469 ?auto_12475 ) ) ( not ( = ?auto_12469 ?auto_12477 ) ) ( not ( = ?auto_12471 ?auto_12476 ) ) ( not ( = ?auto_12471 ?auto_12474 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12463 ?auto_12464 ?auto_12465 )
      ( MAKE-1CRATE ?auto_12465 ?auto_12466 )
      ( MAKE-3CRATE-VERIFY ?auto_12463 ?auto_12464 ?auto_12465 ?auto_12466 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12481 - SURFACE
      ?auto_12482 - SURFACE
    )
    :vars
    (
      ?auto_12483 - HOIST
      ?auto_12484 - PLACE
      ?auto_12486 - PLACE
      ?auto_12487 - HOIST
      ?auto_12488 - SURFACE
      ?auto_12485 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12483 ?auto_12484 ) ( SURFACE-AT ?auto_12481 ?auto_12484 ) ( CLEAR ?auto_12481 ) ( IS-CRATE ?auto_12482 ) ( AVAILABLE ?auto_12483 ) ( not ( = ?auto_12486 ?auto_12484 ) ) ( HOIST-AT ?auto_12487 ?auto_12486 ) ( AVAILABLE ?auto_12487 ) ( SURFACE-AT ?auto_12482 ?auto_12486 ) ( ON ?auto_12482 ?auto_12488 ) ( CLEAR ?auto_12482 ) ( TRUCK-AT ?auto_12485 ?auto_12484 ) ( not ( = ?auto_12481 ?auto_12482 ) ) ( not ( = ?auto_12481 ?auto_12488 ) ) ( not ( = ?auto_12482 ?auto_12488 ) ) ( not ( = ?auto_12483 ?auto_12487 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12485 ?auto_12484 ?auto_12486 )
      ( !LIFT ?auto_12487 ?auto_12482 ?auto_12488 ?auto_12486 )
      ( !LOAD ?auto_12487 ?auto_12482 ?auto_12485 ?auto_12486 )
      ( !DRIVE ?auto_12485 ?auto_12486 ?auto_12484 )
      ( !UNLOAD ?auto_12483 ?auto_12482 ?auto_12485 ?auto_12484 )
      ( !DROP ?auto_12483 ?auto_12482 ?auto_12481 ?auto_12484 )
      ( MAKE-1CRATE-VERIFY ?auto_12481 ?auto_12482 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12494 - SURFACE
      ?auto_12495 - SURFACE
      ?auto_12496 - SURFACE
      ?auto_12497 - SURFACE
      ?auto_12498 - SURFACE
    )
    :vars
    (
      ?auto_12503 - HOIST
      ?auto_12499 - PLACE
      ?auto_12502 - PLACE
      ?auto_12504 - HOIST
      ?auto_12501 - SURFACE
      ?auto_12513 - PLACE
      ?auto_12510 - HOIST
      ?auto_12512 - SURFACE
      ?auto_12508 - PLACE
      ?auto_12509 - HOIST
      ?auto_12507 - SURFACE
      ?auto_12505 - PLACE
      ?auto_12506 - HOIST
      ?auto_12511 - SURFACE
      ?auto_12500 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12503 ?auto_12499 ) ( IS-CRATE ?auto_12498 ) ( not ( = ?auto_12502 ?auto_12499 ) ) ( HOIST-AT ?auto_12504 ?auto_12502 ) ( AVAILABLE ?auto_12504 ) ( SURFACE-AT ?auto_12498 ?auto_12502 ) ( ON ?auto_12498 ?auto_12501 ) ( CLEAR ?auto_12498 ) ( not ( = ?auto_12497 ?auto_12498 ) ) ( not ( = ?auto_12497 ?auto_12501 ) ) ( not ( = ?auto_12498 ?auto_12501 ) ) ( not ( = ?auto_12503 ?auto_12504 ) ) ( IS-CRATE ?auto_12497 ) ( not ( = ?auto_12513 ?auto_12499 ) ) ( HOIST-AT ?auto_12510 ?auto_12513 ) ( AVAILABLE ?auto_12510 ) ( SURFACE-AT ?auto_12497 ?auto_12513 ) ( ON ?auto_12497 ?auto_12512 ) ( CLEAR ?auto_12497 ) ( not ( = ?auto_12496 ?auto_12497 ) ) ( not ( = ?auto_12496 ?auto_12512 ) ) ( not ( = ?auto_12497 ?auto_12512 ) ) ( not ( = ?auto_12503 ?auto_12510 ) ) ( IS-CRATE ?auto_12496 ) ( not ( = ?auto_12508 ?auto_12499 ) ) ( HOIST-AT ?auto_12509 ?auto_12508 ) ( AVAILABLE ?auto_12509 ) ( SURFACE-AT ?auto_12496 ?auto_12508 ) ( ON ?auto_12496 ?auto_12507 ) ( CLEAR ?auto_12496 ) ( not ( = ?auto_12495 ?auto_12496 ) ) ( not ( = ?auto_12495 ?auto_12507 ) ) ( not ( = ?auto_12496 ?auto_12507 ) ) ( not ( = ?auto_12503 ?auto_12509 ) ) ( SURFACE-AT ?auto_12494 ?auto_12499 ) ( CLEAR ?auto_12494 ) ( IS-CRATE ?auto_12495 ) ( AVAILABLE ?auto_12503 ) ( not ( = ?auto_12505 ?auto_12499 ) ) ( HOIST-AT ?auto_12506 ?auto_12505 ) ( AVAILABLE ?auto_12506 ) ( SURFACE-AT ?auto_12495 ?auto_12505 ) ( ON ?auto_12495 ?auto_12511 ) ( CLEAR ?auto_12495 ) ( TRUCK-AT ?auto_12500 ?auto_12499 ) ( not ( = ?auto_12494 ?auto_12495 ) ) ( not ( = ?auto_12494 ?auto_12511 ) ) ( not ( = ?auto_12495 ?auto_12511 ) ) ( not ( = ?auto_12503 ?auto_12506 ) ) ( not ( = ?auto_12494 ?auto_12496 ) ) ( not ( = ?auto_12494 ?auto_12507 ) ) ( not ( = ?auto_12496 ?auto_12511 ) ) ( not ( = ?auto_12508 ?auto_12505 ) ) ( not ( = ?auto_12509 ?auto_12506 ) ) ( not ( = ?auto_12507 ?auto_12511 ) ) ( not ( = ?auto_12494 ?auto_12497 ) ) ( not ( = ?auto_12494 ?auto_12512 ) ) ( not ( = ?auto_12495 ?auto_12497 ) ) ( not ( = ?auto_12495 ?auto_12512 ) ) ( not ( = ?auto_12497 ?auto_12507 ) ) ( not ( = ?auto_12497 ?auto_12511 ) ) ( not ( = ?auto_12513 ?auto_12508 ) ) ( not ( = ?auto_12513 ?auto_12505 ) ) ( not ( = ?auto_12510 ?auto_12509 ) ) ( not ( = ?auto_12510 ?auto_12506 ) ) ( not ( = ?auto_12512 ?auto_12507 ) ) ( not ( = ?auto_12512 ?auto_12511 ) ) ( not ( = ?auto_12494 ?auto_12498 ) ) ( not ( = ?auto_12494 ?auto_12501 ) ) ( not ( = ?auto_12495 ?auto_12498 ) ) ( not ( = ?auto_12495 ?auto_12501 ) ) ( not ( = ?auto_12496 ?auto_12498 ) ) ( not ( = ?auto_12496 ?auto_12501 ) ) ( not ( = ?auto_12498 ?auto_12512 ) ) ( not ( = ?auto_12498 ?auto_12507 ) ) ( not ( = ?auto_12498 ?auto_12511 ) ) ( not ( = ?auto_12502 ?auto_12513 ) ) ( not ( = ?auto_12502 ?auto_12508 ) ) ( not ( = ?auto_12502 ?auto_12505 ) ) ( not ( = ?auto_12504 ?auto_12510 ) ) ( not ( = ?auto_12504 ?auto_12509 ) ) ( not ( = ?auto_12504 ?auto_12506 ) ) ( not ( = ?auto_12501 ?auto_12512 ) ) ( not ( = ?auto_12501 ?auto_12507 ) ) ( not ( = ?auto_12501 ?auto_12511 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_12494 ?auto_12495 ?auto_12496 ?auto_12497 )
      ( MAKE-1CRATE ?auto_12497 ?auto_12498 )
      ( MAKE-4CRATE-VERIFY ?auto_12494 ?auto_12495 ?auto_12496 ?auto_12497 ?auto_12498 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12516 - SURFACE
      ?auto_12517 - SURFACE
    )
    :vars
    (
      ?auto_12518 - HOIST
      ?auto_12519 - PLACE
      ?auto_12521 - PLACE
      ?auto_12522 - HOIST
      ?auto_12523 - SURFACE
      ?auto_12520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12518 ?auto_12519 ) ( SURFACE-AT ?auto_12516 ?auto_12519 ) ( CLEAR ?auto_12516 ) ( IS-CRATE ?auto_12517 ) ( AVAILABLE ?auto_12518 ) ( not ( = ?auto_12521 ?auto_12519 ) ) ( HOIST-AT ?auto_12522 ?auto_12521 ) ( AVAILABLE ?auto_12522 ) ( SURFACE-AT ?auto_12517 ?auto_12521 ) ( ON ?auto_12517 ?auto_12523 ) ( CLEAR ?auto_12517 ) ( TRUCK-AT ?auto_12520 ?auto_12519 ) ( not ( = ?auto_12516 ?auto_12517 ) ) ( not ( = ?auto_12516 ?auto_12523 ) ) ( not ( = ?auto_12517 ?auto_12523 ) ) ( not ( = ?auto_12518 ?auto_12522 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12520 ?auto_12519 ?auto_12521 )
      ( !LIFT ?auto_12522 ?auto_12517 ?auto_12523 ?auto_12521 )
      ( !LOAD ?auto_12522 ?auto_12517 ?auto_12520 ?auto_12521 )
      ( !DRIVE ?auto_12520 ?auto_12521 ?auto_12519 )
      ( !UNLOAD ?auto_12518 ?auto_12517 ?auto_12520 ?auto_12519 )
      ( !DROP ?auto_12518 ?auto_12517 ?auto_12516 ?auto_12519 )
      ( MAKE-1CRATE-VERIFY ?auto_12516 ?auto_12517 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_12530 - SURFACE
      ?auto_12531 - SURFACE
      ?auto_12532 - SURFACE
      ?auto_12533 - SURFACE
      ?auto_12534 - SURFACE
      ?auto_12535 - SURFACE
    )
    :vars
    (
      ?auto_12538 - HOIST
      ?auto_12536 - PLACE
      ?auto_12540 - PLACE
      ?auto_12541 - HOIST
      ?auto_12537 - SURFACE
      ?auto_12546 - PLACE
      ?auto_12545 - HOIST
      ?auto_12547 - SURFACE
      ?auto_12550 - PLACE
      ?auto_12548 - HOIST
      ?auto_12543 - SURFACE
      ?auto_12553 - PLACE
      ?auto_12549 - HOIST
      ?auto_12551 - SURFACE
      ?auto_12542 - PLACE
      ?auto_12552 - HOIST
      ?auto_12544 - SURFACE
      ?auto_12539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12538 ?auto_12536 ) ( IS-CRATE ?auto_12535 ) ( not ( = ?auto_12540 ?auto_12536 ) ) ( HOIST-AT ?auto_12541 ?auto_12540 ) ( AVAILABLE ?auto_12541 ) ( SURFACE-AT ?auto_12535 ?auto_12540 ) ( ON ?auto_12535 ?auto_12537 ) ( CLEAR ?auto_12535 ) ( not ( = ?auto_12534 ?auto_12535 ) ) ( not ( = ?auto_12534 ?auto_12537 ) ) ( not ( = ?auto_12535 ?auto_12537 ) ) ( not ( = ?auto_12538 ?auto_12541 ) ) ( IS-CRATE ?auto_12534 ) ( not ( = ?auto_12546 ?auto_12536 ) ) ( HOIST-AT ?auto_12545 ?auto_12546 ) ( AVAILABLE ?auto_12545 ) ( SURFACE-AT ?auto_12534 ?auto_12546 ) ( ON ?auto_12534 ?auto_12547 ) ( CLEAR ?auto_12534 ) ( not ( = ?auto_12533 ?auto_12534 ) ) ( not ( = ?auto_12533 ?auto_12547 ) ) ( not ( = ?auto_12534 ?auto_12547 ) ) ( not ( = ?auto_12538 ?auto_12545 ) ) ( IS-CRATE ?auto_12533 ) ( not ( = ?auto_12550 ?auto_12536 ) ) ( HOIST-AT ?auto_12548 ?auto_12550 ) ( AVAILABLE ?auto_12548 ) ( SURFACE-AT ?auto_12533 ?auto_12550 ) ( ON ?auto_12533 ?auto_12543 ) ( CLEAR ?auto_12533 ) ( not ( = ?auto_12532 ?auto_12533 ) ) ( not ( = ?auto_12532 ?auto_12543 ) ) ( not ( = ?auto_12533 ?auto_12543 ) ) ( not ( = ?auto_12538 ?auto_12548 ) ) ( IS-CRATE ?auto_12532 ) ( not ( = ?auto_12553 ?auto_12536 ) ) ( HOIST-AT ?auto_12549 ?auto_12553 ) ( AVAILABLE ?auto_12549 ) ( SURFACE-AT ?auto_12532 ?auto_12553 ) ( ON ?auto_12532 ?auto_12551 ) ( CLEAR ?auto_12532 ) ( not ( = ?auto_12531 ?auto_12532 ) ) ( not ( = ?auto_12531 ?auto_12551 ) ) ( not ( = ?auto_12532 ?auto_12551 ) ) ( not ( = ?auto_12538 ?auto_12549 ) ) ( SURFACE-AT ?auto_12530 ?auto_12536 ) ( CLEAR ?auto_12530 ) ( IS-CRATE ?auto_12531 ) ( AVAILABLE ?auto_12538 ) ( not ( = ?auto_12542 ?auto_12536 ) ) ( HOIST-AT ?auto_12552 ?auto_12542 ) ( AVAILABLE ?auto_12552 ) ( SURFACE-AT ?auto_12531 ?auto_12542 ) ( ON ?auto_12531 ?auto_12544 ) ( CLEAR ?auto_12531 ) ( TRUCK-AT ?auto_12539 ?auto_12536 ) ( not ( = ?auto_12530 ?auto_12531 ) ) ( not ( = ?auto_12530 ?auto_12544 ) ) ( not ( = ?auto_12531 ?auto_12544 ) ) ( not ( = ?auto_12538 ?auto_12552 ) ) ( not ( = ?auto_12530 ?auto_12532 ) ) ( not ( = ?auto_12530 ?auto_12551 ) ) ( not ( = ?auto_12532 ?auto_12544 ) ) ( not ( = ?auto_12553 ?auto_12542 ) ) ( not ( = ?auto_12549 ?auto_12552 ) ) ( not ( = ?auto_12551 ?auto_12544 ) ) ( not ( = ?auto_12530 ?auto_12533 ) ) ( not ( = ?auto_12530 ?auto_12543 ) ) ( not ( = ?auto_12531 ?auto_12533 ) ) ( not ( = ?auto_12531 ?auto_12543 ) ) ( not ( = ?auto_12533 ?auto_12551 ) ) ( not ( = ?auto_12533 ?auto_12544 ) ) ( not ( = ?auto_12550 ?auto_12553 ) ) ( not ( = ?auto_12550 ?auto_12542 ) ) ( not ( = ?auto_12548 ?auto_12549 ) ) ( not ( = ?auto_12548 ?auto_12552 ) ) ( not ( = ?auto_12543 ?auto_12551 ) ) ( not ( = ?auto_12543 ?auto_12544 ) ) ( not ( = ?auto_12530 ?auto_12534 ) ) ( not ( = ?auto_12530 ?auto_12547 ) ) ( not ( = ?auto_12531 ?auto_12534 ) ) ( not ( = ?auto_12531 ?auto_12547 ) ) ( not ( = ?auto_12532 ?auto_12534 ) ) ( not ( = ?auto_12532 ?auto_12547 ) ) ( not ( = ?auto_12534 ?auto_12543 ) ) ( not ( = ?auto_12534 ?auto_12551 ) ) ( not ( = ?auto_12534 ?auto_12544 ) ) ( not ( = ?auto_12546 ?auto_12550 ) ) ( not ( = ?auto_12546 ?auto_12553 ) ) ( not ( = ?auto_12546 ?auto_12542 ) ) ( not ( = ?auto_12545 ?auto_12548 ) ) ( not ( = ?auto_12545 ?auto_12549 ) ) ( not ( = ?auto_12545 ?auto_12552 ) ) ( not ( = ?auto_12547 ?auto_12543 ) ) ( not ( = ?auto_12547 ?auto_12551 ) ) ( not ( = ?auto_12547 ?auto_12544 ) ) ( not ( = ?auto_12530 ?auto_12535 ) ) ( not ( = ?auto_12530 ?auto_12537 ) ) ( not ( = ?auto_12531 ?auto_12535 ) ) ( not ( = ?auto_12531 ?auto_12537 ) ) ( not ( = ?auto_12532 ?auto_12535 ) ) ( not ( = ?auto_12532 ?auto_12537 ) ) ( not ( = ?auto_12533 ?auto_12535 ) ) ( not ( = ?auto_12533 ?auto_12537 ) ) ( not ( = ?auto_12535 ?auto_12547 ) ) ( not ( = ?auto_12535 ?auto_12543 ) ) ( not ( = ?auto_12535 ?auto_12551 ) ) ( not ( = ?auto_12535 ?auto_12544 ) ) ( not ( = ?auto_12540 ?auto_12546 ) ) ( not ( = ?auto_12540 ?auto_12550 ) ) ( not ( = ?auto_12540 ?auto_12553 ) ) ( not ( = ?auto_12540 ?auto_12542 ) ) ( not ( = ?auto_12541 ?auto_12545 ) ) ( not ( = ?auto_12541 ?auto_12548 ) ) ( not ( = ?auto_12541 ?auto_12549 ) ) ( not ( = ?auto_12541 ?auto_12552 ) ) ( not ( = ?auto_12537 ?auto_12547 ) ) ( not ( = ?auto_12537 ?auto_12543 ) ) ( not ( = ?auto_12537 ?auto_12551 ) ) ( not ( = ?auto_12537 ?auto_12544 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_12530 ?auto_12531 ?auto_12532 ?auto_12533 ?auto_12534 )
      ( MAKE-1CRATE ?auto_12534 ?auto_12535 )
      ( MAKE-5CRATE-VERIFY ?auto_12530 ?auto_12531 ?auto_12532 ?auto_12533 ?auto_12534 ?auto_12535 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12556 - SURFACE
      ?auto_12557 - SURFACE
    )
    :vars
    (
      ?auto_12558 - HOIST
      ?auto_12559 - PLACE
      ?auto_12561 - PLACE
      ?auto_12562 - HOIST
      ?auto_12563 - SURFACE
      ?auto_12560 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12558 ?auto_12559 ) ( SURFACE-AT ?auto_12556 ?auto_12559 ) ( CLEAR ?auto_12556 ) ( IS-CRATE ?auto_12557 ) ( AVAILABLE ?auto_12558 ) ( not ( = ?auto_12561 ?auto_12559 ) ) ( HOIST-AT ?auto_12562 ?auto_12561 ) ( AVAILABLE ?auto_12562 ) ( SURFACE-AT ?auto_12557 ?auto_12561 ) ( ON ?auto_12557 ?auto_12563 ) ( CLEAR ?auto_12557 ) ( TRUCK-AT ?auto_12560 ?auto_12559 ) ( not ( = ?auto_12556 ?auto_12557 ) ) ( not ( = ?auto_12556 ?auto_12563 ) ) ( not ( = ?auto_12557 ?auto_12563 ) ) ( not ( = ?auto_12558 ?auto_12562 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12560 ?auto_12559 ?auto_12561 )
      ( !LIFT ?auto_12562 ?auto_12557 ?auto_12563 ?auto_12561 )
      ( !LOAD ?auto_12562 ?auto_12557 ?auto_12560 ?auto_12561 )
      ( !DRIVE ?auto_12560 ?auto_12561 ?auto_12559 )
      ( !UNLOAD ?auto_12558 ?auto_12557 ?auto_12560 ?auto_12559 )
      ( !DROP ?auto_12558 ?auto_12557 ?auto_12556 ?auto_12559 )
      ( MAKE-1CRATE-VERIFY ?auto_12556 ?auto_12557 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_12571 - SURFACE
      ?auto_12572 - SURFACE
      ?auto_12573 - SURFACE
      ?auto_12574 - SURFACE
      ?auto_12575 - SURFACE
      ?auto_12576 - SURFACE
      ?auto_12577 - SURFACE
    )
    :vars
    (
      ?auto_12583 - HOIST
      ?auto_12581 - PLACE
      ?auto_12582 - PLACE
      ?auto_12578 - HOIST
      ?auto_12580 - SURFACE
      ?auto_12585 - PLACE
      ?auto_12590 - HOIST
      ?auto_12584 - SURFACE
      ?auto_12589 - PLACE
      ?auto_12592 - HOIST
      ?auto_12588 - SURFACE
      ?auto_12595 - PLACE
      ?auto_12587 - HOIST
      ?auto_12593 - SURFACE
      ?auto_12596 - PLACE
      ?auto_12586 - HOIST
      ?auto_12591 - SURFACE
      ?auto_12597 - PLACE
      ?auto_12598 - HOIST
      ?auto_12594 - SURFACE
      ?auto_12579 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12583 ?auto_12581 ) ( IS-CRATE ?auto_12577 ) ( not ( = ?auto_12582 ?auto_12581 ) ) ( HOIST-AT ?auto_12578 ?auto_12582 ) ( AVAILABLE ?auto_12578 ) ( SURFACE-AT ?auto_12577 ?auto_12582 ) ( ON ?auto_12577 ?auto_12580 ) ( CLEAR ?auto_12577 ) ( not ( = ?auto_12576 ?auto_12577 ) ) ( not ( = ?auto_12576 ?auto_12580 ) ) ( not ( = ?auto_12577 ?auto_12580 ) ) ( not ( = ?auto_12583 ?auto_12578 ) ) ( IS-CRATE ?auto_12576 ) ( not ( = ?auto_12585 ?auto_12581 ) ) ( HOIST-AT ?auto_12590 ?auto_12585 ) ( AVAILABLE ?auto_12590 ) ( SURFACE-AT ?auto_12576 ?auto_12585 ) ( ON ?auto_12576 ?auto_12584 ) ( CLEAR ?auto_12576 ) ( not ( = ?auto_12575 ?auto_12576 ) ) ( not ( = ?auto_12575 ?auto_12584 ) ) ( not ( = ?auto_12576 ?auto_12584 ) ) ( not ( = ?auto_12583 ?auto_12590 ) ) ( IS-CRATE ?auto_12575 ) ( not ( = ?auto_12589 ?auto_12581 ) ) ( HOIST-AT ?auto_12592 ?auto_12589 ) ( AVAILABLE ?auto_12592 ) ( SURFACE-AT ?auto_12575 ?auto_12589 ) ( ON ?auto_12575 ?auto_12588 ) ( CLEAR ?auto_12575 ) ( not ( = ?auto_12574 ?auto_12575 ) ) ( not ( = ?auto_12574 ?auto_12588 ) ) ( not ( = ?auto_12575 ?auto_12588 ) ) ( not ( = ?auto_12583 ?auto_12592 ) ) ( IS-CRATE ?auto_12574 ) ( not ( = ?auto_12595 ?auto_12581 ) ) ( HOIST-AT ?auto_12587 ?auto_12595 ) ( AVAILABLE ?auto_12587 ) ( SURFACE-AT ?auto_12574 ?auto_12595 ) ( ON ?auto_12574 ?auto_12593 ) ( CLEAR ?auto_12574 ) ( not ( = ?auto_12573 ?auto_12574 ) ) ( not ( = ?auto_12573 ?auto_12593 ) ) ( not ( = ?auto_12574 ?auto_12593 ) ) ( not ( = ?auto_12583 ?auto_12587 ) ) ( IS-CRATE ?auto_12573 ) ( not ( = ?auto_12596 ?auto_12581 ) ) ( HOIST-AT ?auto_12586 ?auto_12596 ) ( AVAILABLE ?auto_12586 ) ( SURFACE-AT ?auto_12573 ?auto_12596 ) ( ON ?auto_12573 ?auto_12591 ) ( CLEAR ?auto_12573 ) ( not ( = ?auto_12572 ?auto_12573 ) ) ( not ( = ?auto_12572 ?auto_12591 ) ) ( not ( = ?auto_12573 ?auto_12591 ) ) ( not ( = ?auto_12583 ?auto_12586 ) ) ( SURFACE-AT ?auto_12571 ?auto_12581 ) ( CLEAR ?auto_12571 ) ( IS-CRATE ?auto_12572 ) ( AVAILABLE ?auto_12583 ) ( not ( = ?auto_12597 ?auto_12581 ) ) ( HOIST-AT ?auto_12598 ?auto_12597 ) ( AVAILABLE ?auto_12598 ) ( SURFACE-AT ?auto_12572 ?auto_12597 ) ( ON ?auto_12572 ?auto_12594 ) ( CLEAR ?auto_12572 ) ( TRUCK-AT ?auto_12579 ?auto_12581 ) ( not ( = ?auto_12571 ?auto_12572 ) ) ( not ( = ?auto_12571 ?auto_12594 ) ) ( not ( = ?auto_12572 ?auto_12594 ) ) ( not ( = ?auto_12583 ?auto_12598 ) ) ( not ( = ?auto_12571 ?auto_12573 ) ) ( not ( = ?auto_12571 ?auto_12591 ) ) ( not ( = ?auto_12573 ?auto_12594 ) ) ( not ( = ?auto_12596 ?auto_12597 ) ) ( not ( = ?auto_12586 ?auto_12598 ) ) ( not ( = ?auto_12591 ?auto_12594 ) ) ( not ( = ?auto_12571 ?auto_12574 ) ) ( not ( = ?auto_12571 ?auto_12593 ) ) ( not ( = ?auto_12572 ?auto_12574 ) ) ( not ( = ?auto_12572 ?auto_12593 ) ) ( not ( = ?auto_12574 ?auto_12591 ) ) ( not ( = ?auto_12574 ?auto_12594 ) ) ( not ( = ?auto_12595 ?auto_12596 ) ) ( not ( = ?auto_12595 ?auto_12597 ) ) ( not ( = ?auto_12587 ?auto_12586 ) ) ( not ( = ?auto_12587 ?auto_12598 ) ) ( not ( = ?auto_12593 ?auto_12591 ) ) ( not ( = ?auto_12593 ?auto_12594 ) ) ( not ( = ?auto_12571 ?auto_12575 ) ) ( not ( = ?auto_12571 ?auto_12588 ) ) ( not ( = ?auto_12572 ?auto_12575 ) ) ( not ( = ?auto_12572 ?auto_12588 ) ) ( not ( = ?auto_12573 ?auto_12575 ) ) ( not ( = ?auto_12573 ?auto_12588 ) ) ( not ( = ?auto_12575 ?auto_12593 ) ) ( not ( = ?auto_12575 ?auto_12591 ) ) ( not ( = ?auto_12575 ?auto_12594 ) ) ( not ( = ?auto_12589 ?auto_12595 ) ) ( not ( = ?auto_12589 ?auto_12596 ) ) ( not ( = ?auto_12589 ?auto_12597 ) ) ( not ( = ?auto_12592 ?auto_12587 ) ) ( not ( = ?auto_12592 ?auto_12586 ) ) ( not ( = ?auto_12592 ?auto_12598 ) ) ( not ( = ?auto_12588 ?auto_12593 ) ) ( not ( = ?auto_12588 ?auto_12591 ) ) ( not ( = ?auto_12588 ?auto_12594 ) ) ( not ( = ?auto_12571 ?auto_12576 ) ) ( not ( = ?auto_12571 ?auto_12584 ) ) ( not ( = ?auto_12572 ?auto_12576 ) ) ( not ( = ?auto_12572 ?auto_12584 ) ) ( not ( = ?auto_12573 ?auto_12576 ) ) ( not ( = ?auto_12573 ?auto_12584 ) ) ( not ( = ?auto_12574 ?auto_12576 ) ) ( not ( = ?auto_12574 ?auto_12584 ) ) ( not ( = ?auto_12576 ?auto_12588 ) ) ( not ( = ?auto_12576 ?auto_12593 ) ) ( not ( = ?auto_12576 ?auto_12591 ) ) ( not ( = ?auto_12576 ?auto_12594 ) ) ( not ( = ?auto_12585 ?auto_12589 ) ) ( not ( = ?auto_12585 ?auto_12595 ) ) ( not ( = ?auto_12585 ?auto_12596 ) ) ( not ( = ?auto_12585 ?auto_12597 ) ) ( not ( = ?auto_12590 ?auto_12592 ) ) ( not ( = ?auto_12590 ?auto_12587 ) ) ( not ( = ?auto_12590 ?auto_12586 ) ) ( not ( = ?auto_12590 ?auto_12598 ) ) ( not ( = ?auto_12584 ?auto_12588 ) ) ( not ( = ?auto_12584 ?auto_12593 ) ) ( not ( = ?auto_12584 ?auto_12591 ) ) ( not ( = ?auto_12584 ?auto_12594 ) ) ( not ( = ?auto_12571 ?auto_12577 ) ) ( not ( = ?auto_12571 ?auto_12580 ) ) ( not ( = ?auto_12572 ?auto_12577 ) ) ( not ( = ?auto_12572 ?auto_12580 ) ) ( not ( = ?auto_12573 ?auto_12577 ) ) ( not ( = ?auto_12573 ?auto_12580 ) ) ( not ( = ?auto_12574 ?auto_12577 ) ) ( not ( = ?auto_12574 ?auto_12580 ) ) ( not ( = ?auto_12575 ?auto_12577 ) ) ( not ( = ?auto_12575 ?auto_12580 ) ) ( not ( = ?auto_12577 ?auto_12584 ) ) ( not ( = ?auto_12577 ?auto_12588 ) ) ( not ( = ?auto_12577 ?auto_12593 ) ) ( not ( = ?auto_12577 ?auto_12591 ) ) ( not ( = ?auto_12577 ?auto_12594 ) ) ( not ( = ?auto_12582 ?auto_12585 ) ) ( not ( = ?auto_12582 ?auto_12589 ) ) ( not ( = ?auto_12582 ?auto_12595 ) ) ( not ( = ?auto_12582 ?auto_12596 ) ) ( not ( = ?auto_12582 ?auto_12597 ) ) ( not ( = ?auto_12578 ?auto_12590 ) ) ( not ( = ?auto_12578 ?auto_12592 ) ) ( not ( = ?auto_12578 ?auto_12587 ) ) ( not ( = ?auto_12578 ?auto_12586 ) ) ( not ( = ?auto_12578 ?auto_12598 ) ) ( not ( = ?auto_12580 ?auto_12584 ) ) ( not ( = ?auto_12580 ?auto_12588 ) ) ( not ( = ?auto_12580 ?auto_12593 ) ) ( not ( = ?auto_12580 ?auto_12591 ) ) ( not ( = ?auto_12580 ?auto_12594 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_12571 ?auto_12572 ?auto_12573 ?auto_12574 ?auto_12575 ?auto_12576 )
      ( MAKE-1CRATE ?auto_12576 ?auto_12577 )
      ( MAKE-6CRATE-VERIFY ?auto_12571 ?auto_12572 ?auto_12573 ?auto_12574 ?auto_12575 ?auto_12576 ?auto_12577 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12601 - SURFACE
      ?auto_12602 - SURFACE
    )
    :vars
    (
      ?auto_12603 - HOIST
      ?auto_12604 - PLACE
      ?auto_12606 - PLACE
      ?auto_12607 - HOIST
      ?auto_12608 - SURFACE
      ?auto_12605 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12603 ?auto_12604 ) ( SURFACE-AT ?auto_12601 ?auto_12604 ) ( CLEAR ?auto_12601 ) ( IS-CRATE ?auto_12602 ) ( AVAILABLE ?auto_12603 ) ( not ( = ?auto_12606 ?auto_12604 ) ) ( HOIST-AT ?auto_12607 ?auto_12606 ) ( AVAILABLE ?auto_12607 ) ( SURFACE-AT ?auto_12602 ?auto_12606 ) ( ON ?auto_12602 ?auto_12608 ) ( CLEAR ?auto_12602 ) ( TRUCK-AT ?auto_12605 ?auto_12604 ) ( not ( = ?auto_12601 ?auto_12602 ) ) ( not ( = ?auto_12601 ?auto_12608 ) ) ( not ( = ?auto_12602 ?auto_12608 ) ) ( not ( = ?auto_12603 ?auto_12607 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12605 ?auto_12604 ?auto_12606 )
      ( !LIFT ?auto_12607 ?auto_12602 ?auto_12608 ?auto_12606 )
      ( !LOAD ?auto_12607 ?auto_12602 ?auto_12605 ?auto_12606 )
      ( !DRIVE ?auto_12605 ?auto_12606 ?auto_12604 )
      ( !UNLOAD ?auto_12603 ?auto_12602 ?auto_12605 ?auto_12604 )
      ( !DROP ?auto_12603 ?auto_12602 ?auto_12601 ?auto_12604 )
      ( MAKE-1CRATE-VERIFY ?auto_12601 ?auto_12602 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_12617 - SURFACE
      ?auto_12618 - SURFACE
      ?auto_12619 - SURFACE
      ?auto_12620 - SURFACE
      ?auto_12621 - SURFACE
      ?auto_12622 - SURFACE
      ?auto_12623 - SURFACE
      ?auto_12624 - SURFACE
    )
    :vars
    (
      ?auto_12625 - HOIST
      ?auto_12629 - PLACE
      ?auto_12628 - PLACE
      ?auto_12627 - HOIST
      ?auto_12630 - SURFACE
      ?auto_12636 - PLACE
      ?auto_12637 - HOIST
      ?auto_12631 - SURFACE
      ?auto_12639 - PLACE
      ?auto_12633 - HOIST
      ?auto_12642 - SURFACE
      ?auto_12634 - PLACE
      ?auto_12643 - HOIST
      ?auto_12635 - SURFACE
      ?auto_12646 - PLACE
      ?auto_12638 - HOIST
      ?auto_12645 - SURFACE
      ?auto_12647 - PLACE
      ?auto_12640 - HOIST
      ?auto_12632 - SURFACE
      ?auto_12648 - PLACE
      ?auto_12641 - HOIST
      ?auto_12644 - SURFACE
      ?auto_12626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12625 ?auto_12629 ) ( IS-CRATE ?auto_12624 ) ( not ( = ?auto_12628 ?auto_12629 ) ) ( HOIST-AT ?auto_12627 ?auto_12628 ) ( AVAILABLE ?auto_12627 ) ( SURFACE-AT ?auto_12624 ?auto_12628 ) ( ON ?auto_12624 ?auto_12630 ) ( CLEAR ?auto_12624 ) ( not ( = ?auto_12623 ?auto_12624 ) ) ( not ( = ?auto_12623 ?auto_12630 ) ) ( not ( = ?auto_12624 ?auto_12630 ) ) ( not ( = ?auto_12625 ?auto_12627 ) ) ( IS-CRATE ?auto_12623 ) ( not ( = ?auto_12636 ?auto_12629 ) ) ( HOIST-AT ?auto_12637 ?auto_12636 ) ( AVAILABLE ?auto_12637 ) ( SURFACE-AT ?auto_12623 ?auto_12636 ) ( ON ?auto_12623 ?auto_12631 ) ( CLEAR ?auto_12623 ) ( not ( = ?auto_12622 ?auto_12623 ) ) ( not ( = ?auto_12622 ?auto_12631 ) ) ( not ( = ?auto_12623 ?auto_12631 ) ) ( not ( = ?auto_12625 ?auto_12637 ) ) ( IS-CRATE ?auto_12622 ) ( not ( = ?auto_12639 ?auto_12629 ) ) ( HOIST-AT ?auto_12633 ?auto_12639 ) ( AVAILABLE ?auto_12633 ) ( SURFACE-AT ?auto_12622 ?auto_12639 ) ( ON ?auto_12622 ?auto_12642 ) ( CLEAR ?auto_12622 ) ( not ( = ?auto_12621 ?auto_12622 ) ) ( not ( = ?auto_12621 ?auto_12642 ) ) ( not ( = ?auto_12622 ?auto_12642 ) ) ( not ( = ?auto_12625 ?auto_12633 ) ) ( IS-CRATE ?auto_12621 ) ( not ( = ?auto_12634 ?auto_12629 ) ) ( HOIST-AT ?auto_12643 ?auto_12634 ) ( AVAILABLE ?auto_12643 ) ( SURFACE-AT ?auto_12621 ?auto_12634 ) ( ON ?auto_12621 ?auto_12635 ) ( CLEAR ?auto_12621 ) ( not ( = ?auto_12620 ?auto_12621 ) ) ( not ( = ?auto_12620 ?auto_12635 ) ) ( not ( = ?auto_12621 ?auto_12635 ) ) ( not ( = ?auto_12625 ?auto_12643 ) ) ( IS-CRATE ?auto_12620 ) ( not ( = ?auto_12646 ?auto_12629 ) ) ( HOIST-AT ?auto_12638 ?auto_12646 ) ( AVAILABLE ?auto_12638 ) ( SURFACE-AT ?auto_12620 ?auto_12646 ) ( ON ?auto_12620 ?auto_12645 ) ( CLEAR ?auto_12620 ) ( not ( = ?auto_12619 ?auto_12620 ) ) ( not ( = ?auto_12619 ?auto_12645 ) ) ( not ( = ?auto_12620 ?auto_12645 ) ) ( not ( = ?auto_12625 ?auto_12638 ) ) ( IS-CRATE ?auto_12619 ) ( not ( = ?auto_12647 ?auto_12629 ) ) ( HOIST-AT ?auto_12640 ?auto_12647 ) ( AVAILABLE ?auto_12640 ) ( SURFACE-AT ?auto_12619 ?auto_12647 ) ( ON ?auto_12619 ?auto_12632 ) ( CLEAR ?auto_12619 ) ( not ( = ?auto_12618 ?auto_12619 ) ) ( not ( = ?auto_12618 ?auto_12632 ) ) ( not ( = ?auto_12619 ?auto_12632 ) ) ( not ( = ?auto_12625 ?auto_12640 ) ) ( SURFACE-AT ?auto_12617 ?auto_12629 ) ( CLEAR ?auto_12617 ) ( IS-CRATE ?auto_12618 ) ( AVAILABLE ?auto_12625 ) ( not ( = ?auto_12648 ?auto_12629 ) ) ( HOIST-AT ?auto_12641 ?auto_12648 ) ( AVAILABLE ?auto_12641 ) ( SURFACE-AT ?auto_12618 ?auto_12648 ) ( ON ?auto_12618 ?auto_12644 ) ( CLEAR ?auto_12618 ) ( TRUCK-AT ?auto_12626 ?auto_12629 ) ( not ( = ?auto_12617 ?auto_12618 ) ) ( not ( = ?auto_12617 ?auto_12644 ) ) ( not ( = ?auto_12618 ?auto_12644 ) ) ( not ( = ?auto_12625 ?auto_12641 ) ) ( not ( = ?auto_12617 ?auto_12619 ) ) ( not ( = ?auto_12617 ?auto_12632 ) ) ( not ( = ?auto_12619 ?auto_12644 ) ) ( not ( = ?auto_12647 ?auto_12648 ) ) ( not ( = ?auto_12640 ?auto_12641 ) ) ( not ( = ?auto_12632 ?auto_12644 ) ) ( not ( = ?auto_12617 ?auto_12620 ) ) ( not ( = ?auto_12617 ?auto_12645 ) ) ( not ( = ?auto_12618 ?auto_12620 ) ) ( not ( = ?auto_12618 ?auto_12645 ) ) ( not ( = ?auto_12620 ?auto_12632 ) ) ( not ( = ?auto_12620 ?auto_12644 ) ) ( not ( = ?auto_12646 ?auto_12647 ) ) ( not ( = ?auto_12646 ?auto_12648 ) ) ( not ( = ?auto_12638 ?auto_12640 ) ) ( not ( = ?auto_12638 ?auto_12641 ) ) ( not ( = ?auto_12645 ?auto_12632 ) ) ( not ( = ?auto_12645 ?auto_12644 ) ) ( not ( = ?auto_12617 ?auto_12621 ) ) ( not ( = ?auto_12617 ?auto_12635 ) ) ( not ( = ?auto_12618 ?auto_12621 ) ) ( not ( = ?auto_12618 ?auto_12635 ) ) ( not ( = ?auto_12619 ?auto_12621 ) ) ( not ( = ?auto_12619 ?auto_12635 ) ) ( not ( = ?auto_12621 ?auto_12645 ) ) ( not ( = ?auto_12621 ?auto_12632 ) ) ( not ( = ?auto_12621 ?auto_12644 ) ) ( not ( = ?auto_12634 ?auto_12646 ) ) ( not ( = ?auto_12634 ?auto_12647 ) ) ( not ( = ?auto_12634 ?auto_12648 ) ) ( not ( = ?auto_12643 ?auto_12638 ) ) ( not ( = ?auto_12643 ?auto_12640 ) ) ( not ( = ?auto_12643 ?auto_12641 ) ) ( not ( = ?auto_12635 ?auto_12645 ) ) ( not ( = ?auto_12635 ?auto_12632 ) ) ( not ( = ?auto_12635 ?auto_12644 ) ) ( not ( = ?auto_12617 ?auto_12622 ) ) ( not ( = ?auto_12617 ?auto_12642 ) ) ( not ( = ?auto_12618 ?auto_12622 ) ) ( not ( = ?auto_12618 ?auto_12642 ) ) ( not ( = ?auto_12619 ?auto_12622 ) ) ( not ( = ?auto_12619 ?auto_12642 ) ) ( not ( = ?auto_12620 ?auto_12622 ) ) ( not ( = ?auto_12620 ?auto_12642 ) ) ( not ( = ?auto_12622 ?auto_12635 ) ) ( not ( = ?auto_12622 ?auto_12645 ) ) ( not ( = ?auto_12622 ?auto_12632 ) ) ( not ( = ?auto_12622 ?auto_12644 ) ) ( not ( = ?auto_12639 ?auto_12634 ) ) ( not ( = ?auto_12639 ?auto_12646 ) ) ( not ( = ?auto_12639 ?auto_12647 ) ) ( not ( = ?auto_12639 ?auto_12648 ) ) ( not ( = ?auto_12633 ?auto_12643 ) ) ( not ( = ?auto_12633 ?auto_12638 ) ) ( not ( = ?auto_12633 ?auto_12640 ) ) ( not ( = ?auto_12633 ?auto_12641 ) ) ( not ( = ?auto_12642 ?auto_12635 ) ) ( not ( = ?auto_12642 ?auto_12645 ) ) ( not ( = ?auto_12642 ?auto_12632 ) ) ( not ( = ?auto_12642 ?auto_12644 ) ) ( not ( = ?auto_12617 ?auto_12623 ) ) ( not ( = ?auto_12617 ?auto_12631 ) ) ( not ( = ?auto_12618 ?auto_12623 ) ) ( not ( = ?auto_12618 ?auto_12631 ) ) ( not ( = ?auto_12619 ?auto_12623 ) ) ( not ( = ?auto_12619 ?auto_12631 ) ) ( not ( = ?auto_12620 ?auto_12623 ) ) ( not ( = ?auto_12620 ?auto_12631 ) ) ( not ( = ?auto_12621 ?auto_12623 ) ) ( not ( = ?auto_12621 ?auto_12631 ) ) ( not ( = ?auto_12623 ?auto_12642 ) ) ( not ( = ?auto_12623 ?auto_12635 ) ) ( not ( = ?auto_12623 ?auto_12645 ) ) ( not ( = ?auto_12623 ?auto_12632 ) ) ( not ( = ?auto_12623 ?auto_12644 ) ) ( not ( = ?auto_12636 ?auto_12639 ) ) ( not ( = ?auto_12636 ?auto_12634 ) ) ( not ( = ?auto_12636 ?auto_12646 ) ) ( not ( = ?auto_12636 ?auto_12647 ) ) ( not ( = ?auto_12636 ?auto_12648 ) ) ( not ( = ?auto_12637 ?auto_12633 ) ) ( not ( = ?auto_12637 ?auto_12643 ) ) ( not ( = ?auto_12637 ?auto_12638 ) ) ( not ( = ?auto_12637 ?auto_12640 ) ) ( not ( = ?auto_12637 ?auto_12641 ) ) ( not ( = ?auto_12631 ?auto_12642 ) ) ( not ( = ?auto_12631 ?auto_12635 ) ) ( not ( = ?auto_12631 ?auto_12645 ) ) ( not ( = ?auto_12631 ?auto_12632 ) ) ( not ( = ?auto_12631 ?auto_12644 ) ) ( not ( = ?auto_12617 ?auto_12624 ) ) ( not ( = ?auto_12617 ?auto_12630 ) ) ( not ( = ?auto_12618 ?auto_12624 ) ) ( not ( = ?auto_12618 ?auto_12630 ) ) ( not ( = ?auto_12619 ?auto_12624 ) ) ( not ( = ?auto_12619 ?auto_12630 ) ) ( not ( = ?auto_12620 ?auto_12624 ) ) ( not ( = ?auto_12620 ?auto_12630 ) ) ( not ( = ?auto_12621 ?auto_12624 ) ) ( not ( = ?auto_12621 ?auto_12630 ) ) ( not ( = ?auto_12622 ?auto_12624 ) ) ( not ( = ?auto_12622 ?auto_12630 ) ) ( not ( = ?auto_12624 ?auto_12631 ) ) ( not ( = ?auto_12624 ?auto_12642 ) ) ( not ( = ?auto_12624 ?auto_12635 ) ) ( not ( = ?auto_12624 ?auto_12645 ) ) ( not ( = ?auto_12624 ?auto_12632 ) ) ( not ( = ?auto_12624 ?auto_12644 ) ) ( not ( = ?auto_12628 ?auto_12636 ) ) ( not ( = ?auto_12628 ?auto_12639 ) ) ( not ( = ?auto_12628 ?auto_12634 ) ) ( not ( = ?auto_12628 ?auto_12646 ) ) ( not ( = ?auto_12628 ?auto_12647 ) ) ( not ( = ?auto_12628 ?auto_12648 ) ) ( not ( = ?auto_12627 ?auto_12637 ) ) ( not ( = ?auto_12627 ?auto_12633 ) ) ( not ( = ?auto_12627 ?auto_12643 ) ) ( not ( = ?auto_12627 ?auto_12638 ) ) ( not ( = ?auto_12627 ?auto_12640 ) ) ( not ( = ?auto_12627 ?auto_12641 ) ) ( not ( = ?auto_12630 ?auto_12631 ) ) ( not ( = ?auto_12630 ?auto_12642 ) ) ( not ( = ?auto_12630 ?auto_12635 ) ) ( not ( = ?auto_12630 ?auto_12645 ) ) ( not ( = ?auto_12630 ?auto_12632 ) ) ( not ( = ?auto_12630 ?auto_12644 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_12617 ?auto_12618 ?auto_12619 ?auto_12620 ?auto_12621 ?auto_12622 ?auto_12623 )
      ( MAKE-1CRATE ?auto_12623 ?auto_12624 )
      ( MAKE-7CRATE-VERIFY ?auto_12617 ?auto_12618 ?auto_12619 ?auto_12620 ?auto_12621 ?auto_12622 ?auto_12623 ?auto_12624 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12651 - SURFACE
      ?auto_12652 - SURFACE
    )
    :vars
    (
      ?auto_12653 - HOIST
      ?auto_12654 - PLACE
      ?auto_12656 - PLACE
      ?auto_12657 - HOIST
      ?auto_12658 - SURFACE
      ?auto_12655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12653 ?auto_12654 ) ( SURFACE-AT ?auto_12651 ?auto_12654 ) ( CLEAR ?auto_12651 ) ( IS-CRATE ?auto_12652 ) ( AVAILABLE ?auto_12653 ) ( not ( = ?auto_12656 ?auto_12654 ) ) ( HOIST-AT ?auto_12657 ?auto_12656 ) ( AVAILABLE ?auto_12657 ) ( SURFACE-AT ?auto_12652 ?auto_12656 ) ( ON ?auto_12652 ?auto_12658 ) ( CLEAR ?auto_12652 ) ( TRUCK-AT ?auto_12655 ?auto_12654 ) ( not ( = ?auto_12651 ?auto_12652 ) ) ( not ( = ?auto_12651 ?auto_12658 ) ) ( not ( = ?auto_12652 ?auto_12658 ) ) ( not ( = ?auto_12653 ?auto_12657 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12655 ?auto_12654 ?auto_12656 )
      ( !LIFT ?auto_12657 ?auto_12652 ?auto_12658 ?auto_12656 )
      ( !LOAD ?auto_12657 ?auto_12652 ?auto_12655 ?auto_12656 )
      ( !DRIVE ?auto_12655 ?auto_12656 ?auto_12654 )
      ( !UNLOAD ?auto_12653 ?auto_12652 ?auto_12655 ?auto_12654 )
      ( !DROP ?auto_12653 ?auto_12652 ?auto_12651 ?auto_12654 )
      ( MAKE-1CRATE-VERIFY ?auto_12651 ?auto_12652 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_12668 - SURFACE
      ?auto_12669 - SURFACE
      ?auto_12670 - SURFACE
      ?auto_12671 - SURFACE
      ?auto_12672 - SURFACE
      ?auto_12673 - SURFACE
      ?auto_12674 - SURFACE
      ?auto_12676 - SURFACE
      ?auto_12675 - SURFACE
    )
    :vars
    (
      ?auto_12679 - HOIST
      ?auto_12680 - PLACE
      ?auto_12681 - PLACE
      ?auto_12682 - HOIST
      ?auto_12677 - SURFACE
      ?auto_12696 - PLACE
      ?auto_12683 - HOIST
      ?auto_12695 - SURFACE
      ?auto_12700 - PLACE
      ?auto_12699 - HOIST
      ?auto_12689 - SURFACE
      ?auto_12691 - PLACE
      ?auto_12686 - HOIST
      ?auto_12693 - SURFACE
      ?auto_12684 - PLACE
      ?auto_12694 - HOIST
      ?auto_12701 - SURFACE
      ?auto_12690 - PLACE
      ?auto_12698 - HOIST
      ?auto_12687 - SURFACE
      ?auto_12685 - SURFACE
      ?auto_12688 - PLACE
      ?auto_12692 - HOIST
      ?auto_12697 - SURFACE
      ?auto_12678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12679 ?auto_12680 ) ( IS-CRATE ?auto_12675 ) ( not ( = ?auto_12681 ?auto_12680 ) ) ( HOIST-AT ?auto_12682 ?auto_12681 ) ( SURFACE-AT ?auto_12675 ?auto_12681 ) ( ON ?auto_12675 ?auto_12677 ) ( CLEAR ?auto_12675 ) ( not ( = ?auto_12676 ?auto_12675 ) ) ( not ( = ?auto_12676 ?auto_12677 ) ) ( not ( = ?auto_12675 ?auto_12677 ) ) ( not ( = ?auto_12679 ?auto_12682 ) ) ( IS-CRATE ?auto_12676 ) ( not ( = ?auto_12696 ?auto_12680 ) ) ( HOIST-AT ?auto_12683 ?auto_12696 ) ( AVAILABLE ?auto_12683 ) ( SURFACE-AT ?auto_12676 ?auto_12696 ) ( ON ?auto_12676 ?auto_12695 ) ( CLEAR ?auto_12676 ) ( not ( = ?auto_12674 ?auto_12676 ) ) ( not ( = ?auto_12674 ?auto_12695 ) ) ( not ( = ?auto_12676 ?auto_12695 ) ) ( not ( = ?auto_12679 ?auto_12683 ) ) ( IS-CRATE ?auto_12674 ) ( not ( = ?auto_12700 ?auto_12680 ) ) ( HOIST-AT ?auto_12699 ?auto_12700 ) ( AVAILABLE ?auto_12699 ) ( SURFACE-AT ?auto_12674 ?auto_12700 ) ( ON ?auto_12674 ?auto_12689 ) ( CLEAR ?auto_12674 ) ( not ( = ?auto_12673 ?auto_12674 ) ) ( not ( = ?auto_12673 ?auto_12689 ) ) ( not ( = ?auto_12674 ?auto_12689 ) ) ( not ( = ?auto_12679 ?auto_12699 ) ) ( IS-CRATE ?auto_12673 ) ( not ( = ?auto_12691 ?auto_12680 ) ) ( HOIST-AT ?auto_12686 ?auto_12691 ) ( AVAILABLE ?auto_12686 ) ( SURFACE-AT ?auto_12673 ?auto_12691 ) ( ON ?auto_12673 ?auto_12693 ) ( CLEAR ?auto_12673 ) ( not ( = ?auto_12672 ?auto_12673 ) ) ( not ( = ?auto_12672 ?auto_12693 ) ) ( not ( = ?auto_12673 ?auto_12693 ) ) ( not ( = ?auto_12679 ?auto_12686 ) ) ( IS-CRATE ?auto_12672 ) ( not ( = ?auto_12684 ?auto_12680 ) ) ( HOIST-AT ?auto_12694 ?auto_12684 ) ( AVAILABLE ?auto_12694 ) ( SURFACE-AT ?auto_12672 ?auto_12684 ) ( ON ?auto_12672 ?auto_12701 ) ( CLEAR ?auto_12672 ) ( not ( = ?auto_12671 ?auto_12672 ) ) ( not ( = ?auto_12671 ?auto_12701 ) ) ( not ( = ?auto_12672 ?auto_12701 ) ) ( not ( = ?auto_12679 ?auto_12694 ) ) ( IS-CRATE ?auto_12671 ) ( not ( = ?auto_12690 ?auto_12680 ) ) ( HOIST-AT ?auto_12698 ?auto_12690 ) ( AVAILABLE ?auto_12698 ) ( SURFACE-AT ?auto_12671 ?auto_12690 ) ( ON ?auto_12671 ?auto_12687 ) ( CLEAR ?auto_12671 ) ( not ( = ?auto_12670 ?auto_12671 ) ) ( not ( = ?auto_12670 ?auto_12687 ) ) ( not ( = ?auto_12671 ?auto_12687 ) ) ( not ( = ?auto_12679 ?auto_12698 ) ) ( IS-CRATE ?auto_12670 ) ( AVAILABLE ?auto_12682 ) ( SURFACE-AT ?auto_12670 ?auto_12681 ) ( ON ?auto_12670 ?auto_12685 ) ( CLEAR ?auto_12670 ) ( not ( = ?auto_12669 ?auto_12670 ) ) ( not ( = ?auto_12669 ?auto_12685 ) ) ( not ( = ?auto_12670 ?auto_12685 ) ) ( SURFACE-AT ?auto_12668 ?auto_12680 ) ( CLEAR ?auto_12668 ) ( IS-CRATE ?auto_12669 ) ( AVAILABLE ?auto_12679 ) ( not ( = ?auto_12688 ?auto_12680 ) ) ( HOIST-AT ?auto_12692 ?auto_12688 ) ( AVAILABLE ?auto_12692 ) ( SURFACE-AT ?auto_12669 ?auto_12688 ) ( ON ?auto_12669 ?auto_12697 ) ( CLEAR ?auto_12669 ) ( TRUCK-AT ?auto_12678 ?auto_12680 ) ( not ( = ?auto_12668 ?auto_12669 ) ) ( not ( = ?auto_12668 ?auto_12697 ) ) ( not ( = ?auto_12669 ?auto_12697 ) ) ( not ( = ?auto_12679 ?auto_12692 ) ) ( not ( = ?auto_12668 ?auto_12670 ) ) ( not ( = ?auto_12668 ?auto_12685 ) ) ( not ( = ?auto_12670 ?auto_12697 ) ) ( not ( = ?auto_12681 ?auto_12688 ) ) ( not ( = ?auto_12682 ?auto_12692 ) ) ( not ( = ?auto_12685 ?auto_12697 ) ) ( not ( = ?auto_12668 ?auto_12671 ) ) ( not ( = ?auto_12668 ?auto_12687 ) ) ( not ( = ?auto_12669 ?auto_12671 ) ) ( not ( = ?auto_12669 ?auto_12687 ) ) ( not ( = ?auto_12671 ?auto_12685 ) ) ( not ( = ?auto_12671 ?auto_12697 ) ) ( not ( = ?auto_12690 ?auto_12681 ) ) ( not ( = ?auto_12690 ?auto_12688 ) ) ( not ( = ?auto_12698 ?auto_12682 ) ) ( not ( = ?auto_12698 ?auto_12692 ) ) ( not ( = ?auto_12687 ?auto_12685 ) ) ( not ( = ?auto_12687 ?auto_12697 ) ) ( not ( = ?auto_12668 ?auto_12672 ) ) ( not ( = ?auto_12668 ?auto_12701 ) ) ( not ( = ?auto_12669 ?auto_12672 ) ) ( not ( = ?auto_12669 ?auto_12701 ) ) ( not ( = ?auto_12670 ?auto_12672 ) ) ( not ( = ?auto_12670 ?auto_12701 ) ) ( not ( = ?auto_12672 ?auto_12687 ) ) ( not ( = ?auto_12672 ?auto_12685 ) ) ( not ( = ?auto_12672 ?auto_12697 ) ) ( not ( = ?auto_12684 ?auto_12690 ) ) ( not ( = ?auto_12684 ?auto_12681 ) ) ( not ( = ?auto_12684 ?auto_12688 ) ) ( not ( = ?auto_12694 ?auto_12698 ) ) ( not ( = ?auto_12694 ?auto_12682 ) ) ( not ( = ?auto_12694 ?auto_12692 ) ) ( not ( = ?auto_12701 ?auto_12687 ) ) ( not ( = ?auto_12701 ?auto_12685 ) ) ( not ( = ?auto_12701 ?auto_12697 ) ) ( not ( = ?auto_12668 ?auto_12673 ) ) ( not ( = ?auto_12668 ?auto_12693 ) ) ( not ( = ?auto_12669 ?auto_12673 ) ) ( not ( = ?auto_12669 ?auto_12693 ) ) ( not ( = ?auto_12670 ?auto_12673 ) ) ( not ( = ?auto_12670 ?auto_12693 ) ) ( not ( = ?auto_12671 ?auto_12673 ) ) ( not ( = ?auto_12671 ?auto_12693 ) ) ( not ( = ?auto_12673 ?auto_12701 ) ) ( not ( = ?auto_12673 ?auto_12687 ) ) ( not ( = ?auto_12673 ?auto_12685 ) ) ( not ( = ?auto_12673 ?auto_12697 ) ) ( not ( = ?auto_12691 ?auto_12684 ) ) ( not ( = ?auto_12691 ?auto_12690 ) ) ( not ( = ?auto_12691 ?auto_12681 ) ) ( not ( = ?auto_12691 ?auto_12688 ) ) ( not ( = ?auto_12686 ?auto_12694 ) ) ( not ( = ?auto_12686 ?auto_12698 ) ) ( not ( = ?auto_12686 ?auto_12682 ) ) ( not ( = ?auto_12686 ?auto_12692 ) ) ( not ( = ?auto_12693 ?auto_12701 ) ) ( not ( = ?auto_12693 ?auto_12687 ) ) ( not ( = ?auto_12693 ?auto_12685 ) ) ( not ( = ?auto_12693 ?auto_12697 ) ) ( not ( = ?auto_12668 ?auto_12674 ) ) ( not ( = ?auto_12668 ?auto_12689 ) ) ( not ( = ?auto_12669 ?auto_12674 ) ) ( not ( = ?auto_12669 ?auto_12689 ) ) ( not ( = ?auto_12670 ?auto_12674 ) ) ( not ( = ?auto_12670 ?auto_12689 ) ) ( not ( = ?auto_12671 ?auto_12674 ) ) ( not ( = ?auto_12671 ?auto_12689 ) ) ( not ( = ?auto_12672 ?auto_12674 ) ) ( not ( = ?auto_12672 ?auto_12689 ) ) ( not ( = ?auto_12674 ?auto_12693 ) ) ( not ( = ?auto_12674 ?auto_12701 ) ) ( not ( = ?auto_12674 ?auto_12687 ) ) ( not ( = ?auto_12674 ?auto_12685 ) ) ( not ( = ?auto_12674 ?auto_12697 ) ) ( not ( = ?auto_12700 ?auto_12691 ) ) ( not ( = ?auto_12700 ?auto_12684 ) ) ( not ( = ?auto_12700 ?auto_12690 ) ) ( not ( = ?auto_12700 ?auto_12681 ) ) ( not ( = ?auto_12700 ?auto_12688 ) ) ( not ( = ?auto_12699 ?auto_12686 ) ) ( not ( = ?auto_12699 ?auto_12694 ) ) ( not ( = ?auto_12699 ?auto_12698 ) ) ( not ( = ?auto_12699 ?auto_12682 ) ) ( not ( = ?auto_12699 ?auto_12692 ) ) ( not ( = ?auto_12689 ?auto_12693 ) ) ( not ( = ?auto_12689 ?auto_12701 ) ) ( not ( = ?auto_12689 ?auto_12687 ) ) ( not ( = ?auto_12689 ?auto_12685 ) ) ( not ( = ?auto_12689 ?auto_12697 ) ) ( not ( = ?auto_12668 ?auto_12676 ) ) ( not ( = ?auto_12668 ?auto_12695 ) ) ( not ( = ?auto_12669 ?auto_12676 ) ) ( not ( = ?auto_12669 ?auto_12695 ) ) ( not ( = ?auto_12670 ?auto_12676 ) ) ( not ( = ?auto_12670 ?auto_12695 ) ) ( not ( = ?auto_12671 ?auto_12676 ) ) ( not ( = ?auto_12671 ?auto_12695 ) ) ( not ( = ?auto_12672 ?auto_12676 ) ) ( not ( = ?auto_12672 ?auto_12695 ) ) ( not ( = ?auto_12673 ?auto_12676 ) ) ( not ( = ?auto_12673 ?auto_12695 ) ) ( not ( = ?auto_12676 ?auto_12689 ) ) ( not ( = ?auto_12676 ?auto_12693 ) ) ( not ( = ?auto_12676 ?auto_12701 ) ) ( not ( = ?auto_12676 ?auto_12687 ) ) ( not ( = ?auto_12676 ?auto_12685 ) ) ( not ( = ?auto_12676 ?auto_12697 ) ) ( not ( = ?auto_12696 ?auto_12700 ) ) ( not ( = ?auto_12696 ?auto_12691 ) ) ( not ( = ?auto_12696 ?auto_12684 ) ) ( not ( = ?auto_12696 ?auto_12690 ) ) ( not ( = ?auto_12696 ?auto_12681 ) ) ( not ( = ?auto_12696 ?auto_12688 ) ) ( not ( = ?auto_12683 ?auto_12699 ) ) ( not ( = ?auto_12683 ?auto_12686 ) ) ( not ( = ?auto_12683 ?auto_12694 ) ) ( not ( = ?auto_12683 ?auto_12698 ) ) ( not ( = ?auto_12683 ?auto_12682 ) ) ( not ( = ?auto_12683 ?auto_12692 ) ) ( not ( = ?auto_12695 ?auto_12689 ) ) ( not ( = ?auto_12695 ?auto_12693 ) ) ( not ( = ?auto_12695 ?auto_12701 ) ) ( not ( = ?auto_12695 ?auto_12687 ) ) ( not ( = ?auto_12695 ?auto_12685 ) ) ( not ( = ?auto_12695 ?auto_12697 ) ) ( not ( = ?auto_12668 ?auto_12675 ) ) ( not ( = ?auto_12668 ?auto_12677 ) ) ( not ( = ?auto_12669 ?auto_12675 ) ) ( not ( = ?auto_12669 ?auto_12677 ) ) ( not ( = ?auto_12670 ?auto_12675 ) ) ( not ( = ?auto_12670 ?auto_12677 ) ) ( not ( = ?auto_12671 ?auto_12675 ) ) ( not ( = ?auto_12671 ?auto_12677 ) ) ( not ( = ?auto_12672 ?auto_12675 ) ) ( not ( = ?auto_12672 ?auto_12677 ) ) ( not ( = ?auto_12673 ?auto_12675 ) ) ( not ( = ?auto_12673 ?auto_12677 ) ) ( not ( = ?auto_12674 ?auto_12675 ) ) ( not ( = ?auto_12674 ?auto_12677 ) ) ( not ( = ?auto_12675 ?auto_12695 ) ) ( not ( = ?auto_12675 ?auto_12689 ) ) ( not ( = ?auto_12675 ?auto_12693 ) ) ( not ( = ?auto_12675 ?auto_12701 ) ) ( not ( = ?auto_12675 ?auto_12687 ) ) ( not ( = ?auto_12675 ?auto_12685 ) ) ( not ( = ?auto_12675 ?auto_12697 ) ) ( not ( = ?auto_12677 ?auto_12695 ) ) ( not ( = ?auto_12677 ?auto_12689 ) ) ( not ( = ?auto_12677 ?auto_12693 ) ) ( not ( = ?auto_12677 ?auto_12701 ) ) ( not ( = ?auto_12677 ?auto_12687 ) ) ( not ( = ?auto_12677 ?auto_12685 ) ) ( not ( = ?auto_12677 ?auto_12697 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_12668 ?auto_12669 ?auto_12670 ?auto_12671 ?auto_12672 ?auto_12673 ?auto_12674 ?auto_12676 )
      ( MAKE-1CRATE ?auto_12676 ?auto_12675 )
      ( MAKE-8CRATE-VERIFY ?auto_12668 ?auto_12669 ?auto_12670 ?auto_12671 ?auto_12672 ?auto_12673 ?auto_12674 ?auto_12676 ?auto_12675 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12704 - SURFACE
      ?auto_12705 - SURFACE
    )
    :vars
    (
      ?auto_12706 - HOIST
      ?auto_12707 - PLACE
      ?auto_12709 - PLACE
      ?auto_12710 - HOIST
      ?auto_12711 - SURFACE
      ?auto_12708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12706 ?auto_12707 ) ( SURFACE-AT ?auto_12704 ?auto_12707 ) ( CLEAR ?auto_12704 ) ( IS-CRATE ?auto_12705 ) ( AVAILABLE ?auto_12706 ) ( not ( = ?auto_12709 ?auto_12707 ) ) ( HOIST-AT ?auto_12710 ?auto_12709 ) ( AVAILABLE ?auto_12710 ) ( SURFACE-AT ?auto_12705 ?auto_12709 ) ( ON ?auto_12705 ?auto_12711 ) ( CLEAR ?auto_12705 ) ( TRUCK-AT ?auto_12708 ?auto_12707 ) ( not ( = ?auto_12704 ?auto_12705 ) ) ( not ( = ?auto_12704 ?auto_12711 ) ) ( not ( = ?auto_12705 ?auto_12711 ) ) ( not ( = ?auto_12706 ?auto_12710 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12708 ?auto_12707 ?auto_12709 )
      ( !LIFT ?auto_12710 ?auto_12705 ?auto_12711 ?auto_12709 )
      ( !LOAD ?auto_12710 ?auto_12705 ?auto_12708 ?auto_12709 )
      ( !DRIVE ?auto_12708 ?auto_12709 ?auto_12707 )
      ( !UNLOAD ?auto_12706 ?auto_12705 ?auto_12708 ?auto_12707 )
      ( !DROP ?auto_12706 ?auto_12705 ?auto_12704 ?auto_12707 )
      ( MAKE-1CRATE-VERIFY ?auto_12704 ?auto_12705 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_12722 - SURFACE
      ?auto_12723 - SURFACE
      ?auto_12724 - SURFACE
      ?auto_12725 - SURFACE
      ?auto_12726 - SURFACE
      ?auto_12727 - SURFACE
      ?auto_12728 - SURFACE
      ?auto_12731 - SURFACE
      ?auto_12730 - SURFACE
      ?auto_12729 - SURFACE
    )
    :vars
    (
      ?auto_12734 - HOIST
      ?auto_12735 - PLACE
      ?auto_12733 - PLACE
      ?auto_12736 - HOIST
      ?auto_12737 - SURFACE
      ?auto_12739 - PLACE
      ?auto_12740 - HOIST
      ?auto_12741 - SURFACE
      ?auto_12754 - PLACE
      ?auto_12745 - HOIST
      ?auto_12753 - SURFACE
      ?auto_12744 - PLACE
      ?auto_12746 - HOIST
      ?auto_12756 - SURFACE
      ?auto_12749 - PLACE
      ?auto_12759 - HOIST
      ?auto_12750 - SURFACE
      ?auto_12758 - PLACE
      ?auto_12752 - HOIST
      ?auto_12747 - SURFACE
      ?auto_12755 - PLACE
      ?auto_12748 - HOIST
      ?auto_12738 - SURFACE
      ?auto_12742 - SURFACE
      ?auto_12757 - PLACE
      ?auto_12751 - HOIST
      ?auto_12743 - SURFACE
      ?auto_12732 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12734 ?auto_12735 ) ( IS-CRATE ?auto_12729 ) ( not ( = ?auto_12733 ?auto_12735 ) ) ( HOIST-AT ?auto_12736 ?auto_12733 ) ( AVAILABLE ?auto_12736 ) ( SURFACE-AT ?auto_12729 ?auto_12733 ) ( ON ?auto_12729 ?auto_12737 ) ( CLEAR ?auto_12729 ) ( not ( = ?auto_12730 ?auto_12729 ) ) ( not ( = ?auto_12730 ?auto_12737 ) ) ( not ( = ?auto_12729 ?auto_12737 ) ) ( not ( = ?auto_12734 ?auto_12736 ) ) ( IS-CRATE ?auto_12730 ) ( not ( = ?auto_12739 ?auto_12735 ) ) ( HOIST-AT ?auto_12740 ?auto_12739 ) ( SURFACE-AT ?auto_12730 ?auto_12739 ) ( ON ?auto_12730 ?auto_12741 ) ( CLEAR ?auto_12730 ) ( not ( = ?auto_12731 ?auto_12730 ) ) ( not ( = ?auto_12731 ?auto_12741 ) ) ( not ( = ?auto_12730 ?auto_12741 ) ) ( not ( = ?auto_12734 ?auto_12740 ) ) ( IS-CRATE ?auto_12731 ) ( not ( = ?auto_12754 ?auto_12735 ) ) ( HOIST-AT ?auto_12745 ?auto_12754 ) ( AVAILABLE ?auto_12745 ) ( SURFACE-AT ?auto_12731 ?auto_12754 ) ( ON ?auto_12731 ?auto_12753 ) ( CLEAR ?auto_12731 ) ( not ( = ?auto_12728 ?auto_12731 ) ) ( not ( = ?auto_12728 ?auto_12753 ) ) ( not ( = ?auto_12731 ?auto_12753 ) ) ( not ( = ?auto_12734 ?auto_12745 ) ) ( IS-CRATE ?auto_12728 ) ( not ( = ?auto_12744 ?auto_12735 ) ) ( HOIST-AT ?auto_12746 ?auto_12744 ) ( AVAILABLE ?auto_12746 ) ( SURFACE-AT ?auto_12728 ?auto_12744 ) ( ON ?auto_12728 ?auto_12756 ) ( CLEAR ?auto_12728 ) ( not ( = ?auto_12727 ?auto_12728 ) ) ( not ( = ?auto_12727 ?auto_12756 ) ) ( not ( = ?auto_12728 ?auto_12756 ) ) ( not ( = ?auto_12734 ?auto_12746 ) ) ( IS-CRATE ?auto_12727 ) ( not ( = ?auto_12749 ?auto_12735 ) ) ( HOIST-AT ?auto_12759 ?auto_12749 ) ( AVAILABLE ?auto_12759 ) ( SURFACE-AT ?auto_12727 ?auto_12749 ) ( ON ?auto_12727 ?auto_12750 ) ( CLEAR ?auto_12727 ) ( not ( = ?auto_12726 ?auto_12727 ) ) ( not ( = ?auto_12726 ?auto_12750 ) ) ( not ( = ?auto_12727 ?auto_12750 ) ) ( not ( = ?auto_12734 ?auto_12759 ) ) ( IS-CRATE ?auto_12726 ) ( not ( = ?auto_12758 ?auto_12735 ) ) ( HOIST-AT ?auto_12752 ?auto_12758 ) ( AVAILABLE ?auto_12752 ) ( SURFACE-AT ?auto_12726 ?auto_12758 ) ( ON ?auto_12726 ?auto_12747 ) ( CLEAR ?auto_12726 ) ( not ( = ?auto_12725 ?auto_12726 ) ) ( not ( = ?auto_12725 ?auto_12747 ) ) ( not ( = ?auto_12726 ?auto_12747 ) ) ( not ( = ?auto_12734 ?auto_12752 ) ) ( IS-CRATE ?auto_12725 ) ( not ( = ?auto_12755 ?auto_12735 ) ) ( HOIST-AT ?auto_12748 ?auto_12755 ) ( AVAILABLE ?auto_12748 ) ( SURFACE-AT ?auto_12725 ?auto_12755 ) ( ON ?auto_12725 ?auto_12738 ) ( CLEAR ?auto_12725 ) ( not ( = ?auto_12724 ?auto_12725 ) ) ( not ( = ?auto_12724 ?auto_12738 ) ) ( not ( = ?auto_12725 ?auto_12738 ) ) ( not ( = ?auto_12734 ?auto_12748 ) ) ( IS-CRATE ?auto_12724 ) ( AVAILABLE ?auto_12740 ) ( SURFACE-AT ?auto_12724 ?auto_12739 ) ( ON ?auto_12724 ?auto_12742 ) ( CLEAR ?auto_12724 ) ( not ( = ?auto_12723 ?auto_12724 ) ) ( not ( = ?auto_12723 ?auto_12742 ) ) ( not ( = ?auto_12724 ?auto_12742 ) ) ( SURFACE-AT ?auto_12722 ?auto_12735 ) ( CLEAR ?auto_12722 ) ( IS-CRATE ?auto_12723 ) ( AVAILABLE ?auto_12734 ) ( not ( = ?auto_12757 ?auto_12735 ) ) ( HOIST-AT ?auto_12751 ?auto_12757 ) ( AVAILABLE ?auto_12751 ) ( SURFACE-AT ?auto_12723 ?auto_12757 ) ( ON ?auto_12723 ?auto_12743 ) ( CLEAR ?auto_12723 ) ( TRUCK-AT ?auto_12732 ?auto_12735 ) ( not ( = ?auto_12722 ?auto_12723 ) ) ( not ( = ?auto_12722 ?auto_12743 ) ) ( not ( = ?auto_12723 ?auto_12743 ) ) ( not ( = ?auto_12734 ?auto_12751 ) ) ( not ( = ?auto_12722 ?auto_12724 ) ) ( not ( = ?auto_12722 ?auto_12742 ) ) ( not ( = ?auto_12724 ?auto_12743 ) ) ( not ( = ?auto_12739 ?auto_12757 ) ) ( not ( = ?auto_12740 ?auto_12751 ) ) ( not ( = ?auto_12742 ?auto_12743 ) ) ( not ( = ?auto_12722 ?auto_12725 ) ) ( not ( = ?auto_12722 ?auto_12738 ) ) ( not ( = ?auto_12723 ?auto_12725 ) ) ( not ( = ?auto_12723 ?auto_12738 ) ) ( not ( = ?auto_12725 ?auto_12742 ) ) ( not ( = ?auto_12725 ?auto_12743 ) ) ( not ( = ?auto_12755 ?auto_12739 ) ) ( not ( = ?auto_12755 ?auto_12757 ) ) ( not ( = ?auto_12748 ?auto_12740 ) ) ( not ( = ?auto_12748 ?auto_12751 ) ) ( not ( = ?auto_12738 ?auto_12742 ) ) ( not ( = ?auto_12738 ?auto_12743 ) ) ( not ( = ?auto_12722 ?auto_12726 ) ) ( not ( = ?auto_12722 ?auto_12747 ) ) ( not ( = ?auto_12723 ?auto_12726 ) ) ( not ( = ?auto_12723 ?auto_12747 ) ) ( not ( = ?auto_12724 ?auto_12726 ) ) ( not ( = ?auto_12724 ?auto_12747 ) ) ( not ( = ?auto_12726 ?auto_12738 ) ) ( not ( = ?auto_12726 ?auto_12742 ) ) ( not ( = ?auto_12726 ?auto_12743 ) ) ( not ( = ?auto_12758 ?auto_12755 ) ) ( not ( = ?auto_12758 ?auto_12739 ) ) ( not ( = ?auto_12758 ?auto_12757 ) ) ( not ( = ?auto_12752 ?auto_12748 ) ) ( not ( = ?auto_12752 ?auto_12740 ) ) ( not ( = ?auto_12752 ?auto_12751 ) ) ( not ( = ?auto_12747 ?auto_12738 ) ) ( not ( = ?auto_12747 ?auto_12742 ) ) ( not ( = ?auto_12747 ?auto_12743 ) ) ( not ( = ?auto_12722 ?auto_12727 ) ) ( not ( = ?auto_12722 ?auto_12750 ) ) ( not ( = ?auto_12723 ?auto_12727 ) ) ( not ( = ?auto_12723 ?auto_12750 ) ) ( not ( = ?auto_12724 ?auto_12727 ) ) ( not ( = ?auto_12724 ?auto_12750 ) ) ( not ( = ?auto_12725 ?auto_12727 ) ) ( not ( = ?auto_12725 ?auto_12750 ) ) ( not ( = ?auto_12727 ?auto_12747 ) ) ( not ( = ?auto_12727 ?auto_12738 ) ) ( not ( = ?auto_12727 ?auto_12742 ) ) ( not ( = ?auto_12727 ?auto_12743 ) ) ( not ( = ?auto_12749 ?auto_12758 ) ) ( not ( = ?auto_12749 ?auto_12755 ) ) ( not ( = ?auto_12749 ?auto_12739 ) ) ( not ( = ?auto_12749 ?auto_12757 ) ) ( not ( = ?auto_12759 ?auto_12752 ) ) ( not ( = ?auto_12759 ?auto_12748 ) ) ( not ( = ?auto_12759 ?auto_12740 ) ) ( not ( = ?auto_12759 ?auto_12751 ) ) ( not ( = ?auto_12750 ?auto_12747 ) ) ( not ( = ?auto_12750 ?auto_12738 ) ) ( not ( = ?auto_12750 ?auto_12742 ) ) ( not ( = ?auto_12750 ?auto_12743 ) ) ( not ( = ?auto_12722 ?auto_12728 ) ) ( not ( = ?auto_12722 ?auto_12756 ) ) ( not ( = ?auto_12723 ?auto_12728 ) ) ( not ( = ?auto_12723 ?auto_12756 ) ) ( not ( = ?auto_12724 ?auto_12728 ) ) ( not ( = ?auto_12724 ?auto_12756 ) ) ( not ( = ?auto_12725 ?auto_12728 ) ) ( not ( = ?auto_12725 ?auto_12756 ) ) ( not ( = ?auto_12726 ?auto_12728 ) ) ( not ( = ?auto_12726 ?auto_12756 ) ) ( not ( = ?auto_12728 ?auto_12750 ) ) ( not ( = ?auto_12728 ?auto_12747 ) ) ( not ( = ?auto_12728 ?auto_12738 ) ) ( not ( = ?auto_12728 ?auto_12742 ) ) ( not ( = ?auto_12728 ?auto_12743 ) ) ( not ( = ?auto_12744 ?auto_12749 ) ) ( not ( = ?auto_12744 ?auto_12758 ) ) ( not ( = ?auto_12744 ?auto_12755 ) ) ( not ( = ?auto_12744 ?auto_12739 ) ) ( not ( = ?auto_12744 ?auto_12757 ) ) ( not ( = ?auto_12746 ?auto_12759 ) ) ( not ( = ?auto_12746 ?auto_12752 ) ) ( not ( = ?auto_12746 ?auto_12748 ) ) ( not ( = ?auto_12746 ?auto_12740 ) ) ( not ( = ?auto_12746 ?auto_12751 ) ) ( not ( = ?auto_12756 ?auto_12750 ) ) ( not ( = ?auto_12756 ?auto_12747 ) ) ( not ( = ?auto_12756 ?auto_12738 ) ) ( not ( = ?auto_12756 ?auto_12742 ) ) ( not ( = ?auto_12756 ?auto_12743 ) ) ( not ( = ?auto_12722 ?auto_12731 ) ) ( not ( = ?auto_12722 ?auto_12753 ) ) ( not ( = ?auto_12723 ?auto_12731 ) ) ( not ( = ?auto_12723 ?auto_12753 ) ) ( not ( = ?auto_12724 ?auto_12731 ) ) ( not ( = ?auto_12724 ?auto_12753 ) ) ( not ( = ?auto_12725 ?auto_12731 ) ) ( not ( = ?auto_12725 ?auto_12753 ) ) ( not ( = ?auto_12726 ?auto_12731 ) ) ( not ( = ?auto_12726 ?auto_12753 ) ) ( not ( = ?auto_12727 ?auto_12731 ) ) ( not ( = ?auto_12727 ?auto_12753 ) ) ( not ( = ?auto_12731 ?auto_12756 ) ) ( not ( = ?auto_12731 ?auto_12750 ) ) ( not ( = ?auto_12731 ?auto_12747 ) ) ( not ( = ?auto_12731 ?auto_12738 ) ) ( not ( = ?auto_12731 ?auto_12742 ) ) ( not ( = ?auto_12731 ?auto_12743 ) ) ( not ( = ?auto_12754 ?auto_12744 ) ) ( not ( = ?auto_12754 ?auto_12749 ) ) ( not ( = ?auto_12754 ?auto_12758 ) ) ( not ( = ?auto_12754 ?auto_12755 ) ) ( not ( = ?auto_12754 ?auto_12739 ) ) ( not ( = ?auto_12754 ?auto_12757 ) ) ( not ( = ?auto_12745 ?auto_12746 ) ) ( not ( = ?auto_12745 ?auto_12759 ) ) ( not ( = ?auto_12745 ?auto_12752 ) ) ( not ( = ?auto_12745 ?auto_12748 ) ) ( not ( = ?auto_12745 ?auto_12740 ) ) ( not ( = ?auto_12745 ?auto_12751 ) ) ( not ( = ?auto_12753 ?auto_12756 ) ) ( not ( = ?auto_12753 ?auto_12750 ) ) ( not ( = ?auto_12753 ?auto_12747 ) ) ( not ( = ?auto_12753 ?auto_12738 ) ) ( not ( = ?auto_12753 ?auto_12742 ) ) ( not ( = ?auto_12753 ?auto_12743 ) ) ( not ( = ?auto_12722 ?auto_12730 ) ) ( not ( = ?auto_12722 ?auto_12741 ) ) ( not ( = ?auto_12723 ?auto_12730 ) ) ( not ( = ?auto_12723 ?auto_12741 ) ) ( not ( = ?auto_12724 ?auto_12730 ) ) ( not ( = ?auto_12724 ?auto_12741 ) ) ( not ( = ?auto_12725 ?auto_12730 ) ) ( not ( = ?auto_12725 ?auto_12741 ) ) ( not ( = ?auto_12726 ?auto_12730 ) ) ( not ( = ?auto_12726 ?auto_12741 ) ) ( not ( = ?auto_12727 ?auto_12730 ) ) ( not ( = ?auto_12727 ?auto_12741 ) ) ( not ( = ?auto_12728 ?auto_12730 ) ) ( not ( = ?auto_12728 ?auto_12741 ) ) ( not ( = ?auto_12730 ?auto_12753 ) ) ( not ( = ?auto_12730 ?auto_12756 ) ) ( not ( = ?auto_12730 ?auto_12750 ) ) ( not ( = ?auto_12730 ?auto_12747 ) ) ( not ( = ?auto_12730 ?auto_12738 ) ) ( not ( = ?auto_12730 ?auto_12742 ) ) ( not ( = ?auto_12730 ?auto_12743 ) ) ( not ( = ?auto_12741 ?auto_12753 ) ) ( not ( = ?auto_12741 ?auto_12756 ) ) ( not ( = ?auto_12741 ?auto_12750 ) ) ( not ( = ?auto_12741 ?auto_12747 ) ) ( not ( = ?auto_12741 ?auto_12738 ) ) ( not ( = ?auto_12741 ?auto_12742 ) ) ( not ( = ?auto_12741 ?auto_12743 ) ) ( not ( = ?auto_12722 ?auto_12729 ) ) ( not ( = ?auto_12722 ?auto_12737 ) ) ( not ( = ?auto_12723 ?auto_12729 ) ) ( not ( = ?auto_12723 ?auto_12737 ) ) ( not ( = ?auto_12724 ?auto_12729 ) ) ( not ( = ?auto_12724 ?auto_12737 ) ) ( not ( = ?auto_12725 ?auto_12729 ) ) ( not ( = ?auto_12725 ?auto_12737 ) ) ( not ( = ?auto_12726 ?auto_12729 ) ) ( not ( = ?auto_12726 ?auto_12737 ) ) ( not ( = ?auto_12727 ?auto_12729 ) ) ( not ( = ?auto_12727 ?auto_12737 ) ) ( not ( = ?auto_12728 ?auto_12729 ) ) ( not ( = ?auto_12728 ?auto_12737 ) ) ( not ( = ?auto_12731 ?auto_12729 ) ) ( not ( = ?auto_12731 ?auto_12737 ) ) ( not ( = ?auto_12729 ?auto_12741 ) ) ( not ( = ?auto_12729 ?auto_12753 ) ) ( not ( = ?auto_12729 ?auto_12756 ) ) ( not ( = ?auto_12729 ?auto_12750 ) ) ( not ( = ?auto_12729 ?auto_12747 ) ) ( not ( = ?auto_12729 ?auto_12738 ) ) ( not ( = ?auto_12729 ?auto_12742 ) ) ( not ( = ?auto_12729 ?auto_12743 ) ) ( not ( = ?auto_12733 ?auto_12739 ) ) ( not ( = ?auto_12733 ?auto_12754 ) ) ( not ( = ?auto_12733 ?auto_12744 ) ) ( not ( = ?auto_12733 ?auto_12749 ) ) ( not ( = ?auto_12733 ?auto_12758 ) ) ( not ( = ?auto_12733 ?auto_12755 ) ) ( not ( = ?auto_12733 ?auto_12757 ) ) ( not ( = ?auto_12736 ?auto_12740 ) ) ( not ( = ?auto_12736 ?auto_12745 ) ) ( not ( = ?auto_12736 ?auto_12746 ) ) ( not ( = ?auto_12736 ?auto_12759 ) ) ( not ( = ?auto_12736 ?auto_12752 ) ) ( not ( = ?auto_12736 ?auto_12748 ) ) ( not ( = ?auto_12736 ?auto_12751 ) ) ( not ( = ?auto_12737 ?auto_12741 ) ) ( not ( = ?auto_12737 ?auto_12753 ) ) ( not ( = ?auto_12737 ?auto_12756 ) ) ( not ( = ?auto_12737 ?auto_12750 ) ) ( not ( = ?auto_12737 ?auto_12747 ) ) ( not ( = ?auto_12737 ?auto_12738 ) ) ( not ( = ?auto_12737 ?auto_12742 ) ) ( not ( = ?auto_12737 ?auto_12743 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_12722 ?auto_12723 ?auto_12724 ?auto_12725 ?auto_12726 ?auto_12727 ?auto_12728 ?auto_12731 ?auto_12730 )
      ( MAKE-1CRATE ?auto_12730 ?auto_12729 )
      ( MAKE-9CRATE-VERIFY ?auto_12722 ?auto_12723 ?auto_12724 ?auto_12725 ?auto_12726 ?auto_12727 ?auto_12728 ?auto_12731 ?auto_12730 ?auto_12729 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12762 - SURFACE
      ?auto_12763 - SURFACE
    )
    :vars
    (
      ?auto_12764 - HOIST
      ?auto_12765 - PLACE
      ?auto_12767 - PLACE
      ?auto_12768 - HOIST
      ?auto_12769 - SURFACE
      ?auto_12766 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12764 ?auto_12765 ) ( SURFACE-AT ?auto_12762 ?auto_12765 ) ( CLEAR ?auto_12762 ) ( IS-CRATE ?auto_12763 ) ( AVAILABLE ?auto_12764 ) ( not ( = ?auto_12767 ?auto_12765 ) ) ( HOIST-AT ?auto_12768 ?auto_12767 ) ( AVAILABLE ?auto_12768 ) ( SURFACE-AT ?auto_12763 ?auto_12767 ) ( ON ?auto_12763 ?auto_12769 ) ( CLEAR ?auto_12763 ) ( TRUCK-AT ?auto_12766 ?auto_12765 ) ( not ( = ?auto_12762 ?auto_12763 ) ) ( not ( = ?auto_12762 ?auto_12769 ) ) ( not ( = ?auto_12763 ?auto_12769 ) ) ( not ( = ?auto_12764 ?auto_12768 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12766 ?auto_12765 ?auto_12767 )
      ( !LIFT ?auto_12768 ?auto_12763 ?auto_12769 ?auto_12767 )
      ( !LOAD ?auto_12768 ?auto_12763 ?auto_12766 ?auto_12767 )
      ( !DRIVE ?auto_12766 ?auto_12767 ?auto_12765 )
      ( !UNLOAD ?auto_12764 ?auto_12763 ?auto_12766 ?auto_12765 )
      ( !DROP ?auto_12764 ?auto_12763 ?auto_12762 ?auto_12765 )
      ( MAKE-1CRATE-VERIFY ?auto_12762 ?auto_12763 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_12781 - SURFACE
      ?auto_12782 - SURFACE
      ?auto_12783 - SURFACE
      ?auto_12784 - SURFACE
      ?auto_12785 - SURFACE
      ?auto_12786 - SURFACE
      ?auto_12787 - SURFACE
      ?auto_12790 - SURFACE
      ?auto_12789 - SURFACE
      ?auto_12788 - SURFACE
      ?auto_12791 - SURFACE
    )
    :vars
    (
      ?auto_12794 - HOIST
      ?auto_12797 - PLACE
      ?auto_12795 - PLACE
      ?auto_12792 - HOIST
      ?auto_12796 - SURFACE
      ?auto_12812 - PLACE
      ?auto_12816 - HOIST
      ?auto_12813 - SURFACE
      ?auto_12802 - PLACE
      ?auto_12805 - HOIST
      ?auto_12818 - SURFACE
      ?auto_12806 - PLACE
      ?auto_12814 - HOIST
      ?auto_12819 - SURFACE
      ?auto_12808 - PLACE
      ?auto_12798 - HOIST
      ?auto_12803 - SURFACE
      ?auto_12799 - SURFACE
      ?auto_12807 - PLACE
      ?auto_12815 - HOIST
      ?auto_12820 - SURFACE
      ?auto_12817 - PLACE
      ?auto_12804 - HOIST
      ?auto_12811 - SURFACE
      ?auto_12810 - SURFACE
      ?auto_12801 - PLACE
      ?auto_12800 - HOIST
      ?auto_12809 - SURFACE
      ?auto_12793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12794 ?auto_12797 ) ( IS-CRATE ?auto_12791 ) ( not ( = ?auto_12795 ?auto_12797 ) ) ( HOIST-AT ?auto_12792 ?auto_12795 ) ( SURFACE-AT ?auto_12791 ?auto_12795 ) ( ON ?auto_12791 ?auto_12796 ) ( CLEAR ?auto_12791 ) ( not ( = ?auto_12788 ?auto_12791 ) ) ( not ( = ?auto_12788 ?auto_12796 ) ) ( not ( = ?auto_12791 ?auto_12796 ) ) ( not ( = ?auto_12794 ?auto_12792 ) ) ( IS-CRATE ?auto_12788 ) ( not ( = ?auto_12812 ?auto_12797 ) ) ( HOIST-AT ?auto_12816 ?auto_12812 ) ( AVAILABLE ?auto_12816 ) ( SURFACE-AT ?auto_12788 ?auto_12812 ) ( ON ?auto_12788 ?auto_12813 ) ( CLEAR ?auto_12788 ) ( not ( = ?auto_12789 ?auto_12788 ) ) ( not ( = ?auto_12789 ?auto_12813 ) ) ( not ( = ?auto_12788 ?auto_12813 ) ) ( not ( = ?auto_12794 ?auto_12816 ) ) ( IS-CRATE ?auto_12789 ) ( not ( = ?auto_12802 ?auto_12797 ) ) ( HOIST-AT ?auto_12805 ?auto_12802 ) ( SURFACE-AT ?auto_12789 ?auto_12802 ) ( ON ?auto_12789 ?auto_12818 ) ( CLEAR ?auto_12789 ) ( not ( = ?auto_12790 ?auto_12789 ) ) ( not ( = ?auto_12790 ?auto_12818 ) ) ( not ( = ?auto_12789 ?auto_12818 ) ) ( not ( = ?auto_12794 ?auto_12805 ) ) ( IS-CRATE ?auto_12790 ) ( not ( = ?auto_12806 ?auto_12797 ) ) ( HOIST-AT ?auto_12814 ?auto_12806 ) ( AVAILABLE ?auto_12814 ) ( SURFACE-AT ?auto_12790 ?auto_12806 ) ( ON ?auto_12790 ?auto_12819 ) ( CLEAR ?auto_12790 ) ( not ( = ?auto_12787 ?auto_12790 ) ) ( not ( = ?auto_12787 ?auto_12819 ) ) ( not ( = ?auto_12790 ?auto_12819 ) ) ( not ( = ?auto_12794 ?auto_12814 ) ) ( IS-CRATE ?auto_12787 ) ( not ( = ?auto_12808 ?auto_12797 ) ) ( HOIST-AT ?auto_12798 ?auto_12808 ) ( AVAILABLE ?auto_12798 ) ( SURFACE-AT ?auto_12787 ?auto_12808 ) ( ON ?auto_12787 ?auto_12803 ) ( CLEAR ?auto_12787 ) ( not ( = ?auto_12786 ?auto_12787 ) ) ( not ( = ?auto_12786 ?auto_12803 ) ) ( not ( = ?auto_12787 ?auto_12803 ) ) ( not ( = ?auto_12794 ?auto_12798 ) ) ( IS-CRATE ?auto_12786 ) ( AVAILABLE ?auto_12792 ) ( SURFACE-AT ?auto_12786 ?auto_12795 ) ( ON ?auto_12786 ?auto_12799 ) ( CLEAR ?auto_12786 ) ( not ( = ?auto_12785 ?auto_12786 ) ) ( not ( = ?auto_12785 ?auto_12799 ) ) ( not ( = ?auto_12786 ?auto_12799 ) ) ( IS-CRATE ?auto_12785 ) ( not ( = ?auto_12807 ?auto_12797 ) ) ( HOIST-AT ?auto_12815 ?auto_12807 ) ( AVAILABLE ?auto_12815 ) ( SURFACE-AT ?auto_12785 ?auto_12807 ) ( ON ?auto_12785 ?auto_12820 ) ( CLEAR ?auto_12785 ) ( not ( = ?auto_12784 ?auto_12785 ) ) ( not ( = ?auto_12784 ?auto_12820 ) ) ( not ( = ?auto_12785 ?auto_12820 ) ) ( not ( = ?auto_12794 ?auto_12815 ) ) ( IS-CRATE ?auto_12784 ) ( not ( = ?auto_12817 ?auto_12797 ) ) ( HOIST-AT ?auto_12804 ?auto_12817 ) ( AVAILABLE ?auto_12804 ) ( SURFACE-AT ?auto_12784 ?auto_12817 ) ( ON ?auto_12784 ?auto_12811 ) ( CLEAR ?auto_12784 ) ( not ( = ?auto_12783 ?auto_12784 ) ) ( not ( = ?auto_12783 ?auto_12811 ) ) ( not ( = ?auto_12784 ?auto_12811 ) ) ( not ( = ?auto_12794 ?auto_12804 ) ) ( IS-CRATE ?auto_12783 ) ( AVAILABLE ?auto_12805 ) ( SURFACE-AT ?auto_12783 ?auto_12802 ) ( ON ?auto_12783 ?auto_12810 ) ( CLEAR ?auto_12783 ) ( not ( = ?auto_12782 ?auto_12783 ) ) ( not ( = ?auto_12782 ?auto_12810 ) ) ( not ( = ?auto_12783 ?auto_12810 ) ) ( SURFACE-AT ?auto_12781 ?auto_12797 ) ( CLEAR ?auto_12781 ) ( IS-CRATE ?auto_12782 ) ( AVAILABLE ?auto_12794 ) ( not ( = ?auto_12801 ?auto_12797 ) ) ( HOIST-AT ?auto_12800 ?auto_12801 ) ( AVAILABLE ?auto_12800 ) ( SURFACE-AT ?auto_12782 ?auto_12801 ) ( ON ?auto_12782 ?auto_12809 ) ( CLEAR ?auto_12782 ) ( TRUCK-AT ?auto_12793 ?auto_12797 ) ( not ( = ?auto_12781 ?auto_12782 ) ) ( not ( = ?auto_12781 ?auto_12809 ) ) ( not ( = ?auto_12782 ?auto_12809 ) ) ( not ( = ?auto_12794 ?auto_12800 ) ) ( not ( = ?auto_12781 ?auto_12783 ) ) ( not ( = ?auto_12781 ?auto_12810 ) ) ( not ( = ?auto_12783 ?auto_12809 ) ) ( not ( = ?auto_12802 ?auto_12801 ) ) ( not ( = ?auto_12805 ?auto_12800 ) ) ( not ( = ?auto_12810 ?auto_12809 ) ) ( not ( = ?auto_12781 ?auto_12784 ) ) ( not ( = ?auto_12781 ?auto_12811 ) ) ( not ( = ?auto_12782 ?auto_12784 ) ) ( not ( = ?auto_12782 ?auto_12811 ) ) ( not ( = ?auto_12784 ?auto_12810 ) ) ( not ( = ?auto_12784 ?auto_12809 ) ) ( not ( = ?auto_12817 ?auto_12802 ) ) ( not ( = ?auto_12817 ?auto_12801 ) ) ( not ( = ?auto_12804 ?auto_12805 ) ) ( not ( = ?auto_12804 ?auto_12800 ) ) ( not ( = ?auto_12811 ?auto_12810 ) ) ( not ( = ?auto_12811 ?auto_12809 ) ) ( not ( = ?auto_12781 ?auto_12785 ) ) ( not ( = ?auto_12781 ?auto_12820 ) ) ( not ( = ?auto_12782 ?auto_12785 ) ) ( not ( = ?auto_12782 ?auto_12820 ) ) ( not ( = ?auto_12783 ?auto_12785 ) ) ( not ( = ?auto_12783 ?auto_12820 ) ) ( not ( = ?auto_12785 ?auto_12811 ) ) ( not ( = ?auto_12785 ?auto_12810 ) ) ( not ( = ?auto_12785 ?auto_12809 ) ) ( not ( = ?auto_12807 ?auto_12817 ) ) ( not ( = ?auto_12807 ?auto_12802 ) ) ( not ( = ?auto_12807 ?auto_12801 ) ) ( not ( = ?auto_12815 ?auto_12804 ) ) ( not ( = ?auto_12815 ?auto_12805 ) ) ( not ( = ?auto_12815 ?auto_12800 ) ) ( not ( = ?auto_12820 ?auto_12811 ) ) ( not ( = ?auto_12820 ?auto_12810 ) ) ( not ( = ?auto_12820 ?auto_12809 ) ) ( not ( = ?auto_12781 ?auto_12786 ) ) ( not ( = ?auto_12781 ?auto_12799 ) ) ( not ( = ?auto_12782 ?auto_12786 ) ) ( not ( = ?auto_12782 ?auto_12799 ) ) ( not ( = ?auto_12783 ?auto_12786 ) ) ( not ( = ?auto_12783 ?auto_12799 ) ) ( not ( = ?auto_12784 ?auto_12786 ) ) ( not ( = ?auto_12784 ?auto_12799 ) ) ( not ( = ?auto_12786 ?auto_12820 ) ) ( not ( = ?auto_12786 ?auto_12811 ) ) ( not ( = ?auto_12786 ?auto_12810 ) ) ( not ( = ?auto_12786 ?auto_12809 ) ) ( not ( = ?auto_12795 ?auto_12807 ) ) ( not ( = ?auto_12795 ?auto_12817 ) ) ( not ( = ?auto_12795 ?auto_12802 ) ) ( not ( = ?auto_12795 ?auto_12801 ) ) ( not ( = ?auto_12792 ?auto_12815 ) ) ( not ( = ?auto_12792 ?auto_12804 ) ) ( not ( = ?auto_12792 ?auto_12805 ) ) ( not ( = ?auto_12792 ?auto_12800 ) ) ( not ( = ?auto_12799 ?auto_12820 ) ) ( not ( = ?auto_12799 ?auto_12811 ) ) ( not ( = ?auto_12799 ?auto_12810 ) ) ( not ( = ?auto_12799 ?auto_12809 ) ) ( not ( = ?auto_12781 ?auto_12787 ) ) ( not ( = ?auto_12781 ?auto_12803 ) ) ( not ( = ?auto_12782 ?auto_12787 ) ) ( not ( = ?auto_12782 ?auto_12803 ) ) ( not ( = ?auto_12783 ?auto_12787 ) ) ( not ( = ?auto_12783 ?auto_12803 ) ) ( not ( = ?auto_12784 ?auto_12787 ) ) ( not ( = ?auto_12784 ?auto_12803 ) ) ( not ( = ?auto_12785 ?auto_12787 ) ) ( not ( = ?auto_12785 ?auto_12803 ) ) ( not ( = ?auto_12787 ?auto_12799 ) ) ( not ( = ?auto_12787 ?auto_12820 ) ) ( not ( = ?auto_12787 ?auto_12811 ) ) ( not ( = ?auto_12787 ?auto_12810 ) ) ( not ( = ?auto_12787 ?auto_12809 ) ) ( not ( = ?auto_12808 ?auto_12795 ) ) ( not ( = ?auto_12808 ?auto_12807 ) ) ( not ( = ?auto_12808 ?auto_12817 ) ) ( not ( = ?auto_12808 ?auto_12802 ) ) ( not ( = ?auto_12808 ?auto_12801 ) ) ( not ( = ?auto_12798 ?auto_12792 ) ) ( not ( = ?auto_12798 ?auto_12815 ) ) ( not ( = ?auto_12798 ?auto_12804 ) ) ( not ( = ?auto_12798 ?auto_12805 ) ) ( not ( = ?auto_12798 ?auto_12800 ) ) ( not ( = ?auto_12803 ?auto_12799 ) ) ( not ( = ?auto_12803 ?auto_12820 ) ) ( not ( = ?auto_12803 ?auto_12811 ) ) ( not ( = ?auto_12803 ?auto_12810 ) ) ( not ( = ?auto_12803 ?auto_12809 ) ) ( not ( = ?auto_12781 ?auto_12790 ) ) ( not ( = ?auto_12781 ?auto_12819 ) ) ( not ( = ?auto_12782 ?auto_12790 ) ) ( not ( = ?auto_12782 ?auto_12819 ) ) ( not ( = ?auto_12783 ?auto_12790 ) ) ( not ( = ?auto_12783 ?auto_12819 ) ) ( not ( = ?auto_12784 ?auto_12790 ) ) ( not ( = ?auto_12784 ?auto_12819 ) ) ( not ( = ?auto_12785 ?auto_12790 ) ) ( not ( = ?auto_12785 ?auto_12819 ) ) ( not ( = ?auto_12786 ?auto_12790 ) ) ( not ( = ?auto_12786 ?auto_12819 ) ) ( not ( = ?auto_12790 ?auto_12803 ) ) ( not ( = ?auto_12790 ?auto_12799 ) ) ( not ( = ?auto_12790 ?auto_12820 ) ) ( not ( = ?auto_12790 ?auto_12811 ) ) ( not ( = ?auto_12790 ?auto_12810 ) ) ( not ( = ?auto_12790 ?auto_12809 ) ) ( not ( = ?auto_12806 ?auto_12808 ) ) ( not ( = ?auto_12806 ?auto_12795 ) ) ( not ( = ?auto_12806 ?auto_12807 ) ) ( not ( = ?auto_12806 ?auto_12817 ) ) ( not ( = ?auto_12806 ?auto_12802 ) ) ( not ( = ?auto_12806 ?auto_12801 ) ) ( not ( = ?auto_12814 ?auto_12798 ) ) ( not ( = ?auto_12814 ?auto_12792 ) ) ( not ( = ?auto_12814 ?auto_12815 ) ) ( not ( = ?auto_12814 ?auto_12804 ) ) ( not ( = ?auto_12814 ?auto_12805 ) ) ( not ( = ?auto_12814 ?auto_12800 ) ) ( not ( = ?auto_12819 ?auto_12803 ) ) ( not ( = ?auto_12819 ?auto_12799 ) ) ( not ( = ?auto_12819 ?auto_12820 ) ) ( not ( = ?auto_12819 ?auto_12811 ) ) ( not ( = ?auto_12819 ?auto_12810 ) ) ( not ( = ?auto_12819 ?auto_12809 ) ) ( not ( = ?auto_12781 ?auto_12789 ) ) ( not ( = ?auto_12781 ?auto_12818 ) ) ( not ( = ?auto_12782 ?auto_12789 ) ) ( not ( = ?auto_12782 ?auto_12818 ) ) ( not ( = ?auto_12783 ?auto_12789 ) ) ( not ( = ?auto_12783 ?auto_12818 ) ) ( not ( = ?auto_12784 ?auto_12789 ) ) ( not ( = ?auto_12784 ?auto_12818 ) ) ( not ( = ?auto_12785 ?auto_12789 ) ) ( not ( = ?auto_12785 ?auto_12818 ) ) ( not ( = ?auto_12786 ?auto_12789 ) ) ( not ( = ?auto_12786 ?auto_12818 ) ) ( not ( = ?auto_12787 ?auto_12789 ) ) ( not ( = ?auto_12787 ?auto_12818 ) ) ( not ( = ?auto_12789 ?auto_12819 ) ) ( not ( = ?auto_12789 ?auto_12803 ) ) ( not ( = ?auto_12789 ?auto_12799 ) ) ( not ( = ?auto_12789 ?auto_12820 ) ) ( not ( = ?auto_12789 ?auto_12811 ) ) ( not ( = ?auto_12789 ?auto_12810 ) ) ( not ( = ?auto_12789 ?auto_12809 ) ) ( not ( = ?auto_12818 ?auto_12819 ) ) ( not ( = ?auto_12818 ?auto_12803 ) ) ( not ( = ?auto_12818 ?auto_12799 ) ) ( not ( = ?auto_12818 ?auto_12820 ) ) ( not ( = ?auto_12818 ?auto_12811 ) ) ( not ( = ?auto_12818 ?auto_12810 ) ) ( not ( = ?auto_12818 ?auto_12809 ) ) ( not ( = ?auto_12781 ?auto_12788 ) ) ( not ( = ?auto_12781 ?auto_12813 ) ) ( not ( = ?auto_12782 ?auto_12788 ) ) ( not ( = ?auto_12782 ?auto_12813 ) ) ( not ( = ?auto_12783 ?auto_12788 ) ) ( not ( = ?auto_12783 ?auto_12813 ) ) ( not ( = ?auto_12784 ?auto_12788 ) ) ( not ( = ?auto_12784 ?auto_12813 ) ) ( not ( = ?auto_12785 ?auto_12788 ) ) ( not ( = ?auto_12785 ?auto_12813 ) ) ( not ( = ?auto_12786 ?auto_12788 ) ) ( not ( = ?auto_12786 ?auto_12813 ) ) ( not ( = ?auto_12787 ?auto_12788 ) ) ( not ( = ?auto_12787 ?auto_12813 ) ) ( not ( = ?auto_12790 ?auto_12788 ) ) ( not ( = ?auto_12790 ?auto_12813 ) ) ( not ( = ?auto_12788 ?auto_12818 ) ) ( not ( = ?auto_12788 ?auto_12819 ) ) ( not ( = ?auto_12788 ?auto_12803 ) ) ( not ( = ?auto_12788 ?auto_12799 ) ) ( not ( = ?auto_12788 ?auto_12820 ) ) ( not ( = ?auto_12788 ?auto_12811 ) ) ( not ( = ?auto_12788 ?auto_12810 ) ) ( not ( = ?auto_12788 ?auto_12809 ) ) ( not ( = ?auto_12812 ?auto_12802 ) ) ( not ( = ?auto_12812 ?auto_12806 ) ) ( not ( = ?auto_12812 ?auto_12808 ) ) ( not ( = ?auto_12812 ?auto_12795 ) ) ( not ( = ?auto_12812 ?auto_12807 ) ) ( not ( = ?auto_12812 ?auto_12817 ) ) ( not ( = ?auto_12812 ?auto_12801 ) ) ( not ( = ?auto_12816 ?auto_12805 ) ) ( not ( = ?auto_12816 ?auto_12814 ) ) ( not ( = ?auto_12816 ?auto_12798 ) ) ( not ( = ?auto_12816 ?auto_12792 ) ) ( not ( = ?auto_12816 ?auto_12815 ) ) ( not ( = ?auto_12816 ?auto_12804 ) ) ( not ( = ?auto_12816 ?auto_12800 ) ) ( not ( = ?auto_12813 ?auto_12818 ) ) ( not ( = ?auto_12813 ?auto_12819 ) ) ( not ( = ?auto_12813 ?auto_12803 ) ) ( not ( = ?auto_12813 ?auto_12799 ) ) ( not ( = ?auto_12813 ?auto_12820 ) ) ( not ( = ?auto_12813 ?auto_12811 ) ) ( not ( = ?auto_12813 ?auto_12810 ) ) ( not ( = ?auto_12813 ?auto_12809 ) ) ( not ( = ?auto_12781 ?auto_12791 ) ) ( not ( = ?auto_12781 ?auto_12796 ) ) ( not ( = ?auto_12782 ?auto_12791 ) ) ( not ( = ?auto_12782 ?auto_12796 ) ) ( not ( = ?auto_12783 ?auto_12791 ) ) ( not ( = ?auto_12783 ?auto_12796 ) ) ( not ( = ?auto_12784 ?auto_12791 ) ) ( not ( = ?auto_12784 ?auto_12796 ) ) ( not ( = ?auto_12785 ?auto_12791 ) ) ( not ( = ?auto_12785 ?auto_12796 ) ) ( not ( = ?auto_12786 ?auto_12791 ) ) ( not ( = ?auto_12786 ?auto_12796 ) ) ( not ( = ?auto_12787 ?auto_12791 ) ) ( not ( = ?auto_12787 ?auto_12796 ) ) ( not ( = ?auto_12790 ?auto_12791 ) ) ( not ( = ?auto_12790 ?auto_12796 ) ) ( not ( = ?auto_12789 ?auto_12791 ) ) ( not ( = ?auto_12789 ?auto_12796 ) ) ( not ( = ?auto_12791 ?auto_12813 ) ) ( not ( = ?auto_12791 ?auto_12818 ) ) ( not ( = ?auto_12791 ?auto_12819 ) ) ( not ( = ?auto_12791 ?auto_12803 ) ) ( not ( = ?auto_12791 ?auto_12799 ) ) ( not ( = ?auto_12791 ?auto_12820 ) ) ( not ( = ?auto_12791 ?auto_12811 ) ) ( not ( = ?auto_12791 ?auto_12810 ) ) ( not ( = ?auto_12791 ?auto_12809 ) ) ( not ( = ?auto_12796 ?auto_12813 ) ) ( not ( = ?auto_12796 ?auto_12818 ) ) ( not ( = ?auto_12796 ?auto_12819 ) ) ( not ( = ?auto_12796 ?auto_12803 ) ) ( not ( = ?auto_12796 ?auto_12799 ) ) ( not ( = ?auto_12796 ?auto_12820 ) ) ( not ( = ?auto_12796 ?auto_12811 ) ) ( not ( = ?auto_12796 ?auto_12810 ) ) ( not ( = ?auto_12796 ?auto_12809 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_12781 ?auto_12782 ?auto_12783 ?auto_12784 ?auto_12785 ?auto_12786 ?auto_12787 ?auto_12790 ?auto_12789 ?auto_12788 )
      ( MAKE-1CRATE ?auto_12788 ?auto_12791 )
      ( MAKE-10CRATE-VERIFY ?auto_12781 ?auto_12782 ?auto_12783 ?auto_12784 ?auto_12785 ?auto_12786 ?auto_12787 ?auto_12790 ?auto_12789 ?auto_12788 ?auto_12791 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12823 - SURFACE
      ?auto_12824 - SURFACE
    )
    :vars
    (
      ?auto_12825 - HOIST
      ?auto_12826 - PLACE
      ?auto_12828 - PLACE
      ?auto_12829 - HOIST
      ?auto_12830 - SURFACE
      ?auto_12827 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12825 ?auto_12826 ) ( SURFACE-AT ?auto_12823 ?auto_12826 ) ( CLEAR ?auto_12823 ) ( IS-CRATE ?auto_12824 ) ( AVAILABLE ?auto_12825 ) ( not ( = ?auto_12828 ?auto_12826 ) ) ( HOIST-AT ?auto_12829 ?auto_12828 ) ( AVAILABLE ?auto_12829 ) ( SURFACE-AT ?auto_12824 ?auto_12828 ) ( ON ?auto_12824 ?auto_12830 ) ( CLEAR ?auto_12824 ) ( TRUCK-AT ?auto_12827 ?auto_12826 ) ( not ( = ?auto_12823 ?auto_12824 ) ) ( not ( = ?auto_12823 ?auto_12830 ) ) ( not ( = ?auto_12824 ?auto_12830 ) ) ( not ( = ?auto_12825 ?auto_12829 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12827 ?auto_12826 ?auto_12828 )
      ( !LIFT ?auto_12829 ?auto_12824 ?auto_12830 ?auto_12828 )
      ( !LOAD ?auto_12829 ?auto_12824 ?auto_12827 ?auto_12828 )
      ( !DRIVE ?auto_12827 ?auto_12828 ?auto_12826 )
      ( !UNLOAD ?auto_12825 ?auto_12824 ?auto_12827 ?auto_12826 )
      ( !DROP ?auto_12825 ?auto_12824 ?auto_12823 ?auto_12826 )
      ( MAKE-1CRATE-VERIFY ?auto_12823 ?auto_12824 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_12843 - SURFACE
      ?auto_12844 - SURFACE
      ?auto_12845 - SURFACE
      ?auto_12846 - SURFACE
      ?auto_12847 - SURFACE
      ?auto_12848 - SURFACE
      ?auto_12849 - SURFACE
      ?auto_12852 - SURFACE
      ?auto_12851 - SURFACE
      ?auto_12850 - SURFACE
      ?auto_12853 - SURFACE
      ?auto_12854 - SURFACE
    )
    :vars
    (
      ?auto_12857 - HOIST
      ?auto_12859 - PLACE
      ?auto_12856 - PLACE
      ?auto_12855 - HOIST
      ?auto_12858 - SURFACE
      ?auto_12861 - PLACE
      ?auto_12882 - HOIST
      ?auto_12884 - SURFACE
      ?auto_12862 - PLACE
      ?auto_12866 - HOIST
      ?auto_12878 - SURFACE
      ?auto_12881 - PLACE
      ?auto_12873 - HOIST
      ?auto_12874 - SURFACE
      ?auto_12867 - PLACE
      ?auto_12864 - HOIST
      ?auto_12875 - SURFACE
      ?auto_12883 - PLACE
      ?auto_12869 - HOIST
      ?auto_12868 - SURFACE
      ?auto_12876 - SURFACE
      ?auto_12871 - SURFACE
      ?auto_12872 - PLACE
      ?auto_12877 - HOIST
      ?auto_12880 - SURFACE
      ?auto_12879 - SURFACE
      ?auto_12870 - PLACE
      ?auto_12865 - HOIST
      ?auto_12863 - SURFACE
      ?auto_12860 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12857 ?auto_12859 ) ( IS-CRATE ?auto_12854 ) ( not ( = ?auto_12856 ?auto_12859 ) ) ( HOIST-AT ?auto_12855 ?auto_12856 ) ( SURFACE-AT ?auto_12854 ?auto_12856 ) ( ON ?auto_12854 ?auto_12858 ) ( CLEAR ?auto_12854 ) ( not ( = ?auto_12853 ?auto_12854 ) ) ( not ( = ?auto_12853 ?auto_12858 ) ) ( not ( = ?auto_12854 ?auto_12858 ) ) ( not ( = ?auto_12857 ?auto_12855 ) ) ( IS-CRATE ?auto_12853 ) ( not ( = ?auto_12861 ?auto_12859 ) ) ( HOIST-AT ?auto_12882 ?auto_12861 ) ( SURFACE-AT ?auto_12853 ?auto_12861 ) ( ON ?auto_12853 ?auto_12884 ) ( CLEAR ?auto_12853 ) ( not ( = ?auto_12850 ?auto_12853 ) ) ( not ( = ?auto_12850 ?auto_12884 ) ) ( not ( = ?auto_12853 ?auto_12884 ) ) ( not ( = ?auto_12857 ?auto_12882 ) ) ( IS-CRATE ?auto_12850 ) ( not ( = ?auto_12862 ?auto_12859 ) ) ( HOIST-AT ?auto_12866 ?auto_12862 ) ( AVAILABLE ?auto_12866 ) ( SURFACE-AT ?auto_12850 ?auto_12862 ) ( ON ?auto_12850 ?auto_12878 ) ( CLEAR ?auto_12850 ) ( not ( = ?auto_12851 ?auto_12850 ) ) ( not ( = ?auto_12851 ?auto_12878 ) ) ( not ( = ?auto_12850 ?auto_12878 ) ) ( not ( = ?auto_12857 ?auto_12866 ) ) ( IS-CRATE ?auto_12851 ) ( not ( = ?auto_12881 ?auto_12859 ) ) ( HOIST-AT ?auto_12873 ?auto_12881 ) ( SURFACE-AT ?auto_12851 ?auto_12881 ) ( ON ?auto_12851 ?auto_12874 ) ( CLEAR ?auto_12851 ) ( not ( = ?auto_12852 ?auto_12851 ) ) ( not ( = ?auto_12852 ?auto_12874 ) ) ( not ( = ?auto_12851 ?auto_12874 ) ) ( not ( = ?auto_12857 ?auto_12873 ) ) ( IS-CRATE ?auto_12852 ) ( not ( = ?auto_12867 ?auto_12859 ) ) ( HOIST-AT ?auto_12864 ?auto_12867 ) ( AVAILABLE ?auto_12864 ) ( SURFACE-AT ?auto_12852 ?auto_12867 ) ( ON ?auto_12852 ?auto_12875 ) ( CLEAR ?auto_12852 ) ( not ( = ?auto_12849 ?auto_12852 ) ) ( not ( = ?auto_12849 ?auto_12875 ) ) ( not ( = ?auto_12852 ?auto_12875 ) ) ( not ( = ?auto_12857 ?auto_12864 ) ) ( IS-CRATE ?auto_12849 ) ( not ( = ?auto_12883 ?auto_12859 ) ) ( HOIST-AT ?auto_12869 ?auto_12883 ) ( AVAILABLE ?auto_12869 ) ( SURFACE-AT ?auto_12849 ?auto_12883 ) ( ON ?auto_12849 ?auto_12868 ) ( CLEAR ?auto_12849 ) ( not ( = ?auto_12848 ?auto_12849 ) ) ( not ( = ?auto_12848 ?auto_12868 ) ) ( not ( = ?auto_12849 ?auto_12868 ) ) ( not ( = ?auto_12857 ?auto_12869 ) ) ( IS-CRATE ?auto_12848 ) ( AVAILABLE ?auto_12882 ) ( SURFACE-AT ?auto_12848 ?auto_12861 ) ( ON ?auto_12848 ?auto_12876 ) ( CLEAR ?auto_12848 ) ( not ( = ?auto_12847 ?auto_12848 ) ) ( not ( = ?auto_12847 ?auto_12876 ) ) ( not ( = ?auto_12848 ?auto_12876 ) ) ( IS-CRATE ?auto_12847 ) ( AVAILABLE ?auto_12855 ) ( SURFACE-AT ?auto_12847 ?auto_12856 ) ( ON ?auto_12847 ?auto_12871 ) ( CLEAR ?auto_12847 ) ( not ( = ?auto_12846 ?auto_12847 ) ) ( not ( = ?auto_12846 ?auto_12871 ) ) ( not ( = ?auto_12847 ?auto_12871 ) ) ( IS-CRATE ?auto_12846 ) ( not ( = ?auto_12872 ?auto_12859 ) ) ( HOIST-AT ?auto_12877 ?auto_12872 ) ( AVAILABLE ?auto_12877 ) ( SURFACE-AT ?auto_12846 ?auto_12872 ) ( ON ?auto_12846 ?auto_12880 ) ( CLEAR ?auto_12846 ) ( not ( = ?auto_12845 ?auto_12846 ) ) ( not ( = ?auto_12845 ?auto_12880 ) ) ( not ( = ?auto_12846 ?auto_12880 ) ) ( not ( = ?auto_12857 ?auto_12877 ) ) ( IS-CRATE ?auto_12845 ) ( AVAILABLE ?auto_12873 ) ( SURFACE-AT ?auto_12845 ?auto_12881 ) ( ON ?auto_12845 ?auto_12879 ) ( CLEAR ?auto_12845 ) ( not ( = ?auto_12844 ?auto_12845 ) ) ( not ( = ?auto_12844 ?auto_12879 ) ) ( not ( = ?auto_12845 ?auto_12879 ) ) ( SURFACE-AT ?auto_12843 ?auto_12859 ) ( CLEAR ?auto_12843 ) ( IS-CRATE ?auto_12844 ) ( AVAILABLE ?auto_12857 ) ( not ( = ?auto_12870 ?auto_12859 ) ) ( HOIST-AT ?auto_12865 ?auto_12870 ) ( AVAILABLE ?auto_12865 ) ( SURFACE-AT ?auto_12844 ?auto_12870 ) ( ON ?auto_12844 ?auto_12863 ) ( CLEAR ?auto_12844 ) ( TRUCK-AT ?auto_12860 ?auto_12859 ) ( not ( = ?auto_12843 ?auto_12844 ) ) ( not ( = ?auto_12843 ?auto_12863 ) ) ( not ( = ?auto_12844 ?auto_12863 ) ) ( not ( = ?auto_12857 ?auto_12865 ) ) ( not ( = ?auto_12843 ?auto_12845 ) ) ( not ( = ?auto_12843 ?auto_12879 ) ) ( not ( = ?auto_12845 ?auto_12863 ) ) ( not ( = ?auto_12881 ?auto_12870 ) ) ( not ( = ?auto_12873 ?auto_12865 ) ) ( not ( = ?auto_12879 ?auto_12863 ) ) ( not ( = ?auto_12843 ?auto_12846 ) ) ( not ( = ?auto_12843 ?auto_12880 ) ) ( not ( = ?auto_12844 ?auto_12846 ) ) ( not ( = ?auto_12844 ?auto_12880 ) ) ( not ( = ?auto_12846 ?auto_12879 ) ) ( not ( = ?auto_12846 ?auto_12863 ) ) ( not ( = ?auto_12872 ?auto_12881 ) ) ( not ( = ?auto_12872 ?auto_12870 ) ) ( not ( = ?auto_12877 ?auto_12873 ) ) ( not ( = ?auto_12877 ?auto_12865 ) ) ( not ( = ?auto_12880 ?auto_12879 ) ) ( not ( = ?auto_12880 ?auto_12863 ) ) ( not ( = ?auto_12843 ?auto_12847 ) ) ( not ( = ?auto_12843 ?auto_12871 ) ) ( not ( = ?auto_12844 ?auto_12847 ) ) ( not ( = ?auto_12844 ?auto_12871 ) ) ( not ( = ?auto_12845 ?auto_12847 ) ) ( not ( = ?auto_12845 ?auto_12871 ) ) ( not ( = ?auto_12847 ?auto_12880 ) ) ( not ( = ?auto_12847 ?auto_12879 ) ) ( not ( = ?auto_12847 ?auto_12863 ) ) ( not ( = ?auto_12856 ?auto_12872 ) ) ( not ( = ?auto_12856 ?auto_12881 ) ) ( not ( = ?auto_12856 ?auto_12870 ) ) ( not ( = ?auto_12855 ?auto_12877 ) ) ( not ( = ?auto_12855 ?auto_12873 ) ) ( not ( = ?auto_12855 ?auto_12865 ) ) ( not ( = ?auto_12871 ?auto_12880 ) ) ( not ( = ?auto_12871 ?auto_12879 ) ) ( not ( = ?auto_12871 ?auto_12863 ) ) ( not ( = ?auto_12843 ?auto_12848 ) ) ( not ( = ?auto_12843 ?auto_12876 ) ) ( not ( = ?auto_12844 ?auto_12848 ) ) ( not ( = ?auto_12844 ?auto_12876 ) ) ( not ( = ?auto_12845 ?auto_12848 ) ) ( not ( = ?auto_12845 ?auto_12876 ) ) ( not ( = ?auto_12846 ?auto_12848 ) ) ( not ( = ?auto_12846 ?auto_12876 ) ) ( not ( = ?auto_12848 ?auto_12871 ) ) ( not ( = ?auto_12848 ?auto_12880 ) ) ( not ( = ?auto_12848 ?auto_12879 ) ) ( not ( = ?auto_12848 ?auto_12863 ) ) ( not ( = ?auto_12861 ?auto_12856 ) ) ( not ( = ?auto_12861 ?auto_12872 ) ) ( not ( = ?auto_12861 ?auto_12881 ) ) ( not ( = ?auto_12861 ?auto_12870 ) ) ( not ( = ?auto_12882 ?auto_12855 ) ) ( not ( = ?auto_12882 ?auto_12877 ) ) ( not ( = ?auto_12882 ?auto_12873 ) ) ( not ( = ?auto_12882 ?auto_12865 ) ) ( not ( = ?auto_12876 ?auto_12871 ) ) ( not ( = ?auto_12876 ?auto_12880 ) ) ( not ( = ?auto_12876 ?auto_12879 ) ) ( not ( = ?auto_12876 ?auto_12863 ) ) ( not ( = ?auto_12843 ?auto_12849 ) ) ( not ( = ?auto_12843 ?auto_12868 ) ) ( not ( = ?auto_12844 ?auto_12849 ) ) ( not ( = ?auto_12844 ?auto_12868 ) ) ( not ( = ?auto_12845 ?auto_12849 ) ) ( not ( = ?auto_12845 ?auto_12868 ) ) ( not ( = ?auto_12846 ?auto_12849 ) ) ( not ( = ?auto_12846 ?auto_12868 ) ) ( not ( = ?auto_12847 ?auto_12849 ) ) ( not ( = ?auto_12847 ?auto_12868 ) ) ( not ( = ?auto_12849 ?auto_12876 ) ) ( not ( = ?auto_12849 ?auto_12871 ) ) ( not ( = ?auto_12849 ?auto_12880 ) ) ( not ( = ?auto_12849 ?auto_12879 ) ) ( not ( = ?auto_12849 ?auto_12863 ) ) ( not ( = ?auto_12883 ?auto_12861 ) ) ( not ( = ?auto_12883 ?auto_12856 ) ) ( not ( = ?auto_12883 ?auto_12872 ) ) ( not ( = ?auto_12883 ?auto_12881 ) ) ( not ( = ?auto_12883 ?auto_12870 ) ) ( not ( = ?auto_12869 ?auto_12882 ) ) ( not ( = ?auto_12869 ?auto_12855 ) ) ( not ( = ?auto_12869 ?auto_12877 ) ) ( not ( = ?auto_12869 ?auto_12873 ) ) ( not ( = ?auto_12869 ?auto_12865 ) ) ( not ( = ?auto_12868 ?auto_12876 ) ) ( not ( = ?auto_12868 ?auto_12871 ) ) ( not ( = ?auto_12868 ?auto_12880 ) ) ( not ( = ?auto_12868 ?auto_12879 ) ) ( not ( = ?auto_12868 ?auto_12863 ) ) ( not ( = ?auto_12843 ?auto_12852 ) ) ( not ( = ?auto_12843 ?auto_12875 ) ) ( not ( = ?auto_12844 ?auto_12852 ) ) ( not ( = ?auto_12844 ?auto_12875 ) ) ( not ( = ?auto_12845 ?auto_12852 ) ) ( not ( = ?auto_12845 ?auto_12875 ) ) ( not ( = ?auto_12846 ?auto_12852 ) ) ( not ( = ?auto_12846 ?auto_12875 ) ) ( not ( = ?auto_12847 ?auto_12852 ) ) ( not ( = ?auto_12847 ?auto_12875 ) ) ( not ( = ?auto_12848 ?auto_12852 ) ) ( not ( = ?auto_12848 ?auto_12875 ) ) ( not ( = ?auto_12852 ?auto_12868 ) ) ( not ( = ?auto_12852 ?auto_12876 ) ) ( not ( = ?auto_12852 ?auto_12871 ) ) ( not ( = ?auto_12852 ?auto_12880 ) ) ( not ( = ?auto_12852 ?auto_12879 ) ) ( not ( = ?auto_12852 ?auto_12863 ) ) ( not ( = ?auto_12867 ?auto_12883 ) ) ( not ( = ?auto_12867 ?auto_12861 ) ) ( not ( = ?auto_12867 ?auto_12856 ) ) ( not ( = ?auto_12867 ?auto_12872 ) ) ( not ( = ?auto_12867 ?auto_12881 ) ) ( not ( = ?auto_12867 ?auto_12870 ) ) ( not ( = ?auto_12864 ?auto_12869 ) ) ( not ( = ?auto_12864 ?auto_12882 ) ) ( not ( = ?auto_12864 ?auto_12855 ) ) ( not ( = ?auto_12864 ?auto_12877 ) ) ( not ( = ?auto_12864 ?auto_12873 ) ) ( not ( = ?auto_12864 ?auto_12865 ) ) ( not ( = ?auto_12875 ?auto_12868 ) ) ( not ( = ?auto_12875 ?auto_12876 ) ) ( not ( = ?auto_12875 ?auto_12871 ) ) ( not ( = ?auto_12875 ?auto_12880 ) ) ( not ( = ?auto_12875 ?auto_12879 ) ) ( not ( = ?auto_12875 ?auto_12863 ) ) ( not ( = ?auto_12843 ?auto_12851 ) ) ( not ( = ?auto_12843 ?auto_12874 ) ) ( not ( = ?auto_12844 ?auto_12851 ) ) ( not ( = ?auto_12844 ?auto_12874 ) ) ( not ( = ?auto_12845 ?auto_12851 ) ) ( not ( = ?auto_12845 ?auto_12874 ) ) ( not ( = ?auto_12846 ?auto_12851 ) ) ( not ( = ?auto_12846 ?auto_12874 ) ) ( not ( = ?auto_12847 ?auto_12851 ) ) ( not ( = ?auto_12847 ?auto_12874 ) ) ( not ( = ?auto_12848 ?auto_12851 ) ) ( not ( = ?auto_12848 ?auto_12874 ) ) ( not ( = ?auto_12849 ?auto_12851 ) ) ( not ( = ?auto_12849 ?auto_12874 ) ) ( not ( = ?auto_12851 ?auto_12875 ) ) ( not ( = ?auto_12851 ?auto_12868 ) ) ( not ( = ?auto_12851 ?auto_12876 ) ) ( not ( = ?auto_12851 ?auto_12871 ) ) ( not ( = ?auto_12851 ?auto_12880 ) ) ( not ( = ?auto_12851 ?auto_12879 ) ) ( not ( = ?auto_12851 ?auto_12863 ) ) ( not ( = ?auto_12874 ?auto_12875 ) ) ( not ( = ?auto_12874 ?auto_12868 ) ) ( not ( = ?auto_12874 ?auto_12876 ) ) ( not ( = ?auto_12874 ?auto_12871 ) ) ( not ( = ?auto_12874 ?auto_12880 ) ) ( not ( = ?auto_12874 ?auto_12879 ) ) ( not ( = ?auto_12874 ?auto_12863 ) ) ( not ( = ?auto_12843 ?auto_12850 ) ) ( not ( = ?auto_12843 ?auto_12878 ) ) ( not ( = ?auto_12844 ?auto_12850 ) ) ( not ( = ?auto_12844 ?auto_12878 ) ) ( not ( = ?auto_12845 ?auto_12850 ) ) ( not ( = ?auto_12845 ?auto_12878 ) ) ( not ( = ?auto_12846 ?auto_12850 ) ) ( not ( = ?auto_12846 ?auto_12878 ) ) ( not ( = ?auto_12847 ?auto_12850 ) ) ( not ( = ?auto_12847 ?auto_12878 ) ) ( not ( = ?auto_12848 ?auto_12850 ) ) ( not ( = ?auto_12848 ?auto_12878 ) ) ( not ( = ?auto_12849 ?auto_12850 ) ) ( not ( = ?auto_12849 ?auto_12878 ) ) ( not ( = ?auto_12852 ?auto_12850 ) ) ( not ( = ?auto_12852 ?auto_12878 ) ) ( not ( = ?auto_12850 ?auto_12874 ) ) ( not ( = ?auto_12850 ?auto_12875 ) ) ( not ( = ?auto_12850 ?auto_12868 ) ) ( not ( = ?auto_12850 ?auto_12876 ) ) ( not ( = ?auto_12850 ?auto_12871 ) ) ( not ( = ?auto_12850 ?auto_12880 ) ) ( not ( = ?auto_12850 ?auto_12879 ) ) ( not ( = ?auto_12850 ?auto_12863 ) ) ( not ( = ?auto_12862 ?auto_12881 ) ) ( not ( = ?auto_12862 ?auto_12867 ) ) ( not ( = ?auto_12862 ?auto_12883 ) ) ( not ( = ?auto_12862 ?auto_12861 ) ) ( not ( = ?auto_12862 ?auto_12856 ) ) ( not ( = ?auto_12862 ?auto_12872 ) ) ( not ( = ?auto_12862 ?auto_12870 ) ) ( not ( = ?auto_12866 ?auto_12873 ) ) ( not ( = ?auto_12866 ?auto_12864 ) ) ( not ( = ?auto_12866 ?auto_12869 ) ) ( not ( = ?auto_12866 ?auto_12882 ) ) ( not ( = ?auto_12866 ?auto_12855 ) ) ( not ( = ?auto_12866 ?auto_12877 ) ) ( not ( = ?auto_12866 ?auto_12865 ) ) ( not ( = ?auto_12878 ?auto_12874 ) ) ( not ( = ?auto_12878 ?auto_12875 ) ) ( not ( = ?auto_12878 ?auto_12868 ) ) ( not ( = ?auto_12878 ?auto_12876 ) ) ( not ( = ?auto_12878 ?auto_12871 ) ) ( not ( = ?auto_12878 ?auto_12880 ) ) ( not ( = ?auto_12878 ?auto_12879 ) ) ( not ( = ?auto_12878 ?auto_12863 ) ) ( not ( = ?auto_12843 ?auto_12853 ) ) ( not ( = ?auto_12843 ?auto_12884 ) ) ( not ( = ?auto_12844 ?auto_12853 ) ) ( not ( = ?auto_12844 ?auto_12884 ) ) ( not ( = ?auto_12845 ?auto_12853 ) ) ( not ( = ?auto_12845 ?auto_12884 ) ) ( not ( = ?auto_12846 ?auto_12853 ) ) ( not ( = ?auto_12846 ?auto_12884 ) ) ( not ( = ?auto_12847 ?auto_12853 ) ) ( not ( = ?auto_12847 ?auto_12884 ) ) ( not ( = ?auto_12848 ?auto_12853 ) ) ( not ( = ?auto_12848 ?auto_12884 ) ) ( not ( = ?auto_12849 ?auto_12853 ) ) ( not ( = ?auto_12849 ?auto_12884 ) ) ( not ( = ?auto_12852 ?auto_12853 ) ) ( not ( = ?auto_12852 ?auto_12884 ) ) ( not ( = ?auto_12851 ?auto_12853 ) ) ( not ( = ?auto_12851 ?auto_12884 ) ) ( not ( = ?auto_12853 ?auto_12878 ) ) ( not ( = ?auto_12853 ?auto_12874 ) ) ( not ( = ?auto_12853 ?auto_12875 ) ) ( not ( = ?auto_12853 ?auto_12868 ) ) ( not ( = ?auto_12853 ?auto_12876 ) ) ( not ( = ?auto_12853 ?auto_12871 ) ) ( not ( = ?auto_12853 ?auto_12880 ) ) ( not ( = ?auto_12853 ?auto_12879 ) ) ( not ( = ?auto_12853 ?auto_12863 ) ) ( not ( = ?auto_12884 ?auto_12878 ) ) ( not ( = ?auto_12884 ?auto_12874 ) ) ( not ( = ?auto_12884 ?auto_12875 ) ) ( not ( = ?auto_12884 ?auto_12868 ) ) ( not ( = ?auto_12884 ?auto_12876 ) ) ( not ( = ?auto_12884 ?auto_12871 ) ) ( not ( = ?auto_12884 ?auto_12880 ) ) ( not ( = ?auto_12884 ?auto_12879 ) ) ( not ( = ?auto_12884 ?auto_12863 ) ) ( not ( = ?auto_12843 ?auto_12854 ) ) ( not ( = ?auto_12843 ?auto_12858 ) ) ( not ( = ?auto_12844 ?auto_12854 ) ) ( not ( = ?auto_12844 ?auto_12858 ) ) ( not ( = ?auto_12845 ?auto_12854 ) ) ( not ( = ?auto_12845 ?auto_12858 ) ) ( not ( = ?auto_12846 ?auto_12854 ) ) ( not ( = ?auto_12846 ?auto_12858 ) ) ( not ( = ?auto_12847 ?auto_12854 ) ) ( not ( = ?auto_12847 ?auto_12858 ) ) ( not ( = ?auto_12848 ?auto_12854 ) ) ( not ( = ?auto_12848 ?auto_12858 ) ) ( not ( = ?auto_12849 ?auto_12854 ) ) ( not ( = ?auto_12849 ?auto_12858 ) ) ( not ( = ?auto_12852 ?auto_12854 ) ) ( not ( = ?auto_12852 ?auto_12858 ) ) ( not ( = ?auto_12851 ?auto_12854 ) ) ( not ( = ?auto_12851 ?auto_12858 ) ) ( not ( = ?auto_12850 ?auto_12854 ) ) ( not ( = ?auto_12850 ?auto_12858 ) ) ( not ( = ?auto_12854 ?auto_12884 ) ) ( not ( = ?auto_12854 ?auto_12878 ) ) ( not ( = ?auto_12854 ?auto_12874 ) ) ( not ( = ?auto_12854 ?auto_12875 ) ) ( not ( = ?auto_12854 ?auto_12868 ) ) ( not ( = ?auto_12854 ?auto_12876 ) ) ( not ( = ?auto_12854 ?auto_12871 ) ) ( not ( = ?auto_12854 ?auto_12880 ) ) ( not ( = ?auto_12854 ?auto_12879 ) ) ( not ( = ?auto_12854 ?auto_12863 ) ) ( not ( = ?auto_12858 ?auto_12884 ) ) ( not ( = ?auto_12858 ?auto_12878 ) ) ( not ( = ?auto_12858 ?auto_12874 ) ) ( not ( = ?auto_12858 ?auto_12875 ) ) ( not ( = ?auto_12858 ?auto_12868 ) ) ( not ( = ?auto_12858 ?auto_12876 ) ) ( not ( = ?auto_12858 ?auto_12871 ) ) ( not ( = ?auto_12858 ?auto_12880 ) ) ( not ( = ?auto_12858 ?auto_12879 ) ) ( not ( = ?auto_12858 ?auto_12863 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_12843 ?auto_12844 ?auto_12845 ?auto_12846 ?auto_12847 ?auto_12848 ?auto_12849 ?auto_12852 ?auto_12851 ?auto_12850 ?auto_12853 )
      ( MAKE-1CRATE ?auto_12853 ?auto_12854 )
      ( MAKE-11CRATE-VERIFY ?auto_12843 ?auto_12844 ?auto_12845 ?auto_12846 ?auto_12847 ?auto_12848 ?auto_12849 ?auto_12852 ?auto_12851 ?auto_12850 ?auto_12853 ?auto_12854 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12887 - SURFACE
      ?auto_12888 - SURFACE
    )
    :vars
    (
      ?auto_12889 - HOIST
      ?auto_12890 - PLACE
      ?auto_12892 - PLACE
      ?auto_12893 - HOIST
      ?auto_12894 - SURFACE
      ?auto_12891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12889 ?auto_12890 ) ( SURFACE-AT ?auto_12887 ?auto_12890 ) ( CLEAR ?auto_12887 ) ( IS-CRATE ?auto_12888 ) ( AVAILABLE ?auto_12889 ) ( not ( = ?auto_12892 ?auto_12890 ) ) ( HOIST-AT ?auto_12893 ?auto_12892 ) ( AVAILABLE ?auto_12893 ) ( SURFACE-AT ?auto_12888 ?auto_12892 ) ( ON ?auto_12888 ?auto_12894 ) ( CLEAR ?auto_12888 ) ( TRUCK-AT ?auto_12891 ?auto_12890 ) ( not ( = ?auto_12887 ?auto_12888 ) ) ( not ( = ?auto_12887 ?auto_12894 ) ) ( not ( = ?auto_12888 ?auto_12894 ) ) ( not ( = ?auto_12889 ?auto_12893 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12891 ?auto_12890 ?auto_12892 )
      ( !LIFT ?auto_12893 ?auto_12888 ?auto_12894 ?auto_12892 )
      ( !LOAD ?auto_12893 ?auto_12888 ?auto_12891 ?auto_12892 )
      ( !DRIVE ?auto_12891 ?auto_12892 ?auto_12890 )
      ( !UNLOAD ?auto_12889 ?auto_12888 ?auto_12891 ?auto_12890 )
      ( !DROP ?auto_12889 ?auto_12888 ?auto_12887 ?auto_12890 )
      ( MAKE-1CRATE-VERIFY ?auto_12887 ?auto_12888 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_12908 - SURFACE
      ?auto_12909 - SURFACE
      ?auto_12910 - SURFACE
      ?auto_12911 - SURFACE
      ?auto_12912 - SURFACE
      ?auto_12913 - SURFACE
      ?auto_12914 - SURFACE
      ?auto_12917 - SURFACE
      ?auto_12916 - SURFACE
      ?auto_12915 - SURFACE
      ?auto_12918 - SURFACE
      ?auto_12919 - SURFACE
      ?auto_12920 - SURFACE
    )
    :vars
    (
      ?auto_12922 - HOIST
      ?auto_12923 - PLACE
      ?auto_12924 - PLACE
      ?auto_12926 - HOIST
      ?auto_12925 - SURFACE
      ?auto_12936 - PLACE
      ?auto_12940 - HOIST
      ?auto_12949 - SURFACE
      ?auto_12937 - PLACE
      ?auto_12948 - HOIST
      ?auto_12950 - SURFACE
      ?auto_12934 - PLACE
      ?auto_12944 - HOIST
      ?auto_12945 - SURFACE
      ?auto_12941 - PLACE
      ?auto_12947 - HOIST
      ?auto_12939 - SURFACE
      ?auto_12927 - SURFACE
      ?auto_12938 - PLACE
      ?auto_12930 - HOIST
      ?auto_12946 - SURFACE
      ?auto_12933 - SURFACE
      ?auto_12942 - SURFACE
      ?auto_12932 - PLACE
      ?auto_12931 - HOIST
      ?auto_12935 - SURFACE
      ?auto_12929 - SURFACE
      ?auto_12951 - PLACE
      ?auto_12943 - HOIST
      ?auto_12928 - SURFACE
      ?auto_12921 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12922 ?auto_12923 ) ( IS-CRATE ?auto_12920 ) ( not ( = ?auto_12924 ?auto_12923 ) ) ( HOIST-AT ?auto_12926 ?auto_12924 ) ( SURFACE-AT ?auto_12920 ?auto_12924 ) ( ON ?auto_12920 ?auto_12925 ) ( CLEAR ?auto_12920 ) ( not ( = ?auto_12919 ?auto_12920 ) ) ( not ( = ?auto_12919 ?auto_12925 ) ) ( not ( = ?auto_12920 ?auto_12925 ) ) ( not ( = ?auto_12922 ?auto_12926 ) ) ( IS-CRATE ?auto_12919 ) ( not ( = ?auto_12936 ?auto_12923 ) ) ( HOIST-AT ?auto_12940 ?auto_12936 ) ( SURFACE-AT ?auto_12919 ?auto_12936 ) ( ON ?auto_12919 ?auto_12949 ) ( CLEAR ?auto_12919 ) ( not ( = ?auto_12918 ?auto_12919 ) ) ( not ( = ?auto_12918 ?auto_12949 ) ) ( not ( = ?auto_12919 ?auto_12949 ) ) ( not ( = ?auto_12922 ?auto_12940 ) ) ( IS-CRATE ?auto_12918 ) ( not ( = ?auto_12937 ?auto_12923 ) ) ( HOIST-AT ?auto_12948 ?auto_12937 ) ( SURFACE-AT ?auto_12918 ?auto_12937 ) ( ON ?auto_12918 ?auto_12950 ) ( CLEAR ?auto_12918 ) ( not ( = ?auto_12915 ?auto_12918 ) ) ( not ( = ?auto_12915 ?auto_12950 ) ) ( not ( = ?auto_12918 ?auto_12950 ) ) ( not ( = ?auto_12922 ?auto_12948 ) ) ( IS-CRATE ?auto_12915 ) ( not ( = ?auto_12934 ?auto_12923 ) ) ( HOIST-AT ?auto_12944 ?auto_12934 ) ( AVAILABLE ?auto_12944 ) ( SURFACE-AT ?auto_12915 ?auto_12934 ) ( ON ?auto_12915 ?auto_12945 ) ( CLEAR ?auto_12915 ) ( not ( = ?auto_12916 ?auto_12915 ) ) ( not ( = ?auto_12916 ?auto_12945 ) ) ( not ( = ?auto_12915 ?auto_12945 ) ) ( not ( = ?auto_12922 ?auto_12944 ) ) ( IS-CRATE ?auto_12916 ) ( not ( = ?auto_12941 ?auto_12923 ) ) ( HOIST-AT ?auto_12947 ?auto_12941 ) ( SURFACE-AT ?auto_12916 ?auto_12941 ) ( ON ?auto_12916 ?auto_12939 ) ( CLEAR ?auto_12916 ) ( not ( = ?auto_12917 ?auto_12916 ) ) ( not ( = ?auto_12917 ?auto_12939 ) ) ( not ( = ?auto_12916 ?auto_12939 ) ) ( not ( = ?auto_12922 ?auto_12947 ) ) ( IS-CRATE ?auto_12917 ) ( AVAILABLE ?auto_12926 ) ( SURFACE-AT ?auto_12917 ?auto_12924 ) ( ON ?auto_12917 ?auto_12927 ) ( CLEAR ?auto_12917 ) ( not ( = ?auto_12914 ?auto_12917 ) ) ( not ( = ?auto_12914 ?auto_12927 ) ) ( not ( = ?auto_12917 ?auto_12927 ) ) ( IS-CRATE ?auto_12914 ) ( not ( = ?auto_12938 ?auto_12923 ) ) ( HOIST-AT ?auto_12930 ?auto_12938 ) ( AVAILABLE ?auto_12930 ) ( SURFACE-AT ?auto_12914 ?auto_12938 ) ( ON ?auto_12914 ?auto_12946 ) ( CLEAR ?auto_12914 ) ( not ( = ?auto_12913 ?auto_12914 ) ) ( not ( = ?auto_12913 ?auto_12946 ) ) ( not ( = ?auto_12914 ?auto_12946 ) ) ( not ( = ?auto_12922 ?auto_12930 ) ) ( IS-CRATE ?auto_12913 ) ( AVAILABLE ?auto_12948 ) ( SURFACE-AT ?auto_12913 ?auto_12937 ) ( ON ?auto_12913 ?auto_12933 ) ( CLEAR ?auto_12913 ) ( not ( = ?auto_12912 ?auto_12913 ) ) ( not ( = ?auto_12912 ?auto_12933 ) ) ( not ( = ?auto_12913 ?auto_12933 ) ) ( IS-CRATE ?auto_12912 ) ( AVAILABLE ?auto_12940 ) ( SURFACE-AT ?auto_12912 ?auto_12936 ) ( ON ?auto_12912 ?auto_12942 ) ( CLEAR ?auto_12912 ) ( not ( = ?auto_12911 ?auto_12912 ) ) ( not ( = ?auto_12911 ?auto_12942 ) ) ( not ( = ?auto_12912 ?auto_12942 ) ) ( IS-CRATE ?auto_12911 ) ( not ( = ?auto_12932 ?auto_12923 ) ) ( HOIST-AT ?auto_12931 ?auto_12932 ) ( AVAILABLE ?auto_12931 ) ( SURFACE-AT ?auto_12911 ?auto_12932 ) ( ON ?auto_12911 ?auto_12935 ) ( CLEAR ?auto_12911 ) ( not ( = ?auto_12910 ?auto_12911 ) ) ( not ( = ?auto_12910 ?auto_12935 ) ) ( not ( = ?auto_12911 ?auto_12935 ) ) ( not ( = ?auto_12922 ?auto_12931 ) ) ( IS-CRATE ?auto_12910 ) ( AVAILABLE ?auto_12947 ) ( SURFACE-AT ?auto_12910 ?auto_12941 ) ( ON ?auto_12910 ?auto_12929 ) ( CLEAR ?auto_12910 ) ( not ( = ?auto_12909 ?auto_12910 ) ) ( not ( = ?auto_12909 ?auto_12929 ) ) ( not ( = ?auto_12910 ?auto_12929 ) ) ( SURFACE-AT ?auto_12908 ?auto_12923 ) ( CLEAR ?auto_12908 ) ( IS-CRATE ?auto_12909 ) ( AVAILABLE ?auto_12922 ) ( not ( = ?auto_12951 ?auto_12923 ) ) ( HOIST-AT ?auto_12943 ?auto_12951 ) ( AVAILABLE ?auto_12943 ) ( SURFACE-AT ?auto_12909 ?auto_12951 ) ( ON ?auto_12909 ?auto_12928 ) ( CLEAR ?auto_12909 ) ( TRUCK-AT ?auto_12921 ?auto_12923 ) ( not ( = ?auto_12908 ?auto_12909 ) ) ( not ( = ?auto_12908 ?auto_12928 ) ) ( not ( = ?auto_12909 ?auto_12928 ) ) ( not ( = ?auto_12922 ?auto_12943 ) ) ( not ( = ?auto_12908 ?auto_12910 ) ) ( not ( = ?auto_12908 ?auto_12929 ) ) ( not ( = ?auto_12910 ?auto_12928 ) ) ( not ( = ?auto_12941 ?auto_12951 ) ) ( not ( = ?auto_12947 ?auto_12943 ) ) ( not ( = ?auto_12929 ?auto_12928 ) ) ( not ( = ?auto_12908 ?auto_12911 ) ) ( not ( = ?auto_12908 ?auto_12935 ) ) ( not ( = ?auto_12909 ?auto_12911 ) ) ( not ( = ?auto_12909 ?auto_12935 ) ) ( not ( = ?auto_12911 ?auto_12929 ) ) ( not ( = ?auto_12911 ?auto_12928 ) ) ( not ( = ?auto_12932 ?auto_12941 ) ) ( not ( = ?auto_12932 ?auto_12951 ) ) ( not ( = ?auto_12931 ?auto_12947 ) ) ( not ( = ?auto_12931 ?auto_12943 ) ) ( not ( = ?auto_12935 ?auto_12929 ) ) ( not ( = ?auto_12935 ?auto_12928 ) ) ( not ( = ?auto_12908 ?auto_12912 ) ) ( not ( = ?auto_12908 ?auto_12942 ) ) ( not ( = ?auto_12909 ?auto_12912 ) ) ( not ( = ?auto_12909 ?auto_12942 ) ) ( not ( = ?auto_12910 ?auto_12912 ) ) ( not ( = ?auto_12910 ?auto_12942 ) ) ( not ( = ?auto_12912 ?auto_12935 ) ) ( not ( = ?auto_12912 ?auto_12929 ) ) ( not ( = ?auto_12912 ?auto_12928 ) ) ( not ( = ?auto_12936 ?auto_12932 ) ) ( not ( = ?auto_12936 ?auto_12941 ) ) ( not ( = ?auto_12936 ?auto_12951 ) ) ( not ( = ?auto_12940 ?auto_12931 ) ) ( not ( = ?auto_12940 ?auto_12947 ) ) ( not ( = ?auto_12940 ?auto_12943 ) ) ( not ( = ?auto_12942 ?auto_12935 ) ) ( not ( = ?auto_12942 ?auto_12929 ) ) ( not ( = ?auto_12942 ?auto_12928 ) ) ( not ( = ?auto_12908 ?auto_12913 ) ) ( not ( = ?auto_12908 ?auto_12933 ) ) ( not ( = ?auto_12909 ?auto_12913 ) ) ( not ( = ?auto_12909 ?auto_12933 ) ) ( not ( = ?auto_12910 ?auto_12913 ) ) ( not ( = ?auto_12910 ?auto_12933 ) ) ( not ( = ?auto_12911 ?auto_12913 ) ) ( not ( = ?auto_12911 ?auto_12933 ) ) ( not ( = ?auto_12913 ?auto_12942 ) ) ( not ( = ?auto_12913 ?auto_12935 ) ) ( not ( = ?auto_12913 ?auto_12929 ) ) ( not ( = ?auto_12913 ?auto_12928 ) ) ( not ( = ?auto_12937 ?auto_12936 ) ) ( not ( = ?auto_12937 ?auto_12932 ) ) ( not ( = ?auto_12937 ?auto_12941 ) ) ( not ( = ?auto_12937 ?auto_12951 ) ) ( not ( = ?auto_12948 ?auto_12940 ) ) ( not ( = ?auto_12948 ?auto_12931 ) ) ( not ( = ?auto_12948 ?auto_12947 ) ) ( not ( = ?auto_12948 ?auto_12943 ) ) ( not ( = ?auto_12933 ?auto_12942 ) ) ( not ( = ?auto_12933 ?auto_12935 ) ) ( not ( = ?auto_12933 ?auto_12929 ) ) ( not ( = ?auto_12933 ?auto_12928 ) ) ( not ( = ?auto_12908 ?auto_12914 ) ) ( not ( = ?auto_12908 ?auto_12946 ) ) ( not ( = ?auto_12909 ?auto_12914 ) ) ( not ( = ?auto_12909 ?auto_12946 ) ) ( not ( = ?auto_12910 ?auto_12914 ) ) ( not ( = ?auto_12910 ?auto_12946 ) ) ( not ( = ?auto_12911 ?auto_12914 ) ) ( not ( = ?auto_12911 ?auto_12946 ) ) ( not ( = ?auto_12912 ?auto_12914 ) ) ( not ( = ?auto_12912 ?auto_12946 ) ) ( not ( = ?auto_12914 ?auto_12933 ) ) ( not ( = ?auto_12914 ?auto_12942 ) ) ( not ( = ?auto_12914 ?auto_12935 ) ) ( not ( = ?auto_12914 ?auto_12929 ) ) ( not ( = ?auto_12914 ?auto_12928 ) ) ( not ( = ?auto_12938 ?auto_12937 ) ) ( not ( = ?auto_12938 ?auto_12936 ) ) ( not ( = ?auto_12938 ?auto_12932 ) ) ( not ( = ?auto_12938 ?auto_12941 ) ) ( not ( = ?auto_12938 ?auto_12951 ) ) ( not ( = ?auto_12930 ?auto_12948 ) ) ( not ( = ?auto_12930 ?auto_12940 ) ) ( not ( = ?auto_12930 ?auto_12931 ) ) ( not ( = ?auto_12930 ?auto_12947 ) ) ( not ( = ?auto_12930 ?auto_12943 ) ) ( not ( = ?auto_12946 ?auto_12933 ) ) ( not ( = ?auto_12946 ?auto_12942 ) ) ( not ( = ?auto_12946 ?auto_12935 ) ) ( not ( = ?auto_12946 ?auto_12929 ) ) ( not ( = ?auto_12946 ?auto_12928 ) ) ( not ( = ?auto_12908 ?auto_12917 ) ) ( not ( = ?auto_12908 ?auto_12927 ) ) ( not ( = ?auto_12909 ?auto_12917 ) ) ( not ( = ?auto_12909 ?auto_12927 ) ) ( not ( = ?auto_12910 ?auto_12917 ) ) ( not ( = ?auto_12910 ?auto_12927 ) ) ( not ( = ?auto_12911 ?auto_12917 ) ) ( not ( = ?auto_12911 ?auto_12927 ) ) ( not ( = ?auto_12912 ?auto_12917 ) ) ( not ( = ?auto_12912 ?auto_12927 ) ) ( not ( = ?auto_12913 ?auto_12917 ) ) ( not ( = ?auto_12913 ?auto_12927 ) ) ( not ( = ?auto_12917 ?auto_12946 ) ) ( not ( = ?auto_12917 ?auto_12933 ) ) ( not ( = ?auto_12917 ?auto_12942 ) ) ( not ( = ?auto_12917 ?auto_12935 ) ) ( not ( = ?auto_12917 ?auto_12929 ) ) ( not ( = ?auto_12917 ?auto_12928 ) ) ( not ( = ?auto_12924 ?auto_12938 ) ) ( not ( = ?auto_12924 ?auto_12937 ) ) ( not ( = ?auto_12924 ?auto_12936 ) ) ( not ( = ?auto_12924 ?auto_12932 ) ) ( not ( = ?auto_12924 ?auto_12941 ) ) ( not ( = ?auto_12924 ?auto_12951 ) ) ( not ( = ?auto_12926 ?auto_12930 ) ) ( not ( = ?auto_12926 ?auto_12948 ) ) ( not ( = ?auto_12926 ?auto_12940 ) ) ( not ( = ?auto_12926 ?auto_12931 ) ) ( not ( = ?auto_12926 ?auto_12947 ) ) ( not ( = ?auto_12926 ?auto_12943 ) ) ( not ( = ?auto_12927 ?auto_12946 ) ) ( not ( = ?auto_12927 ?auto_12933 ) ) ( not ( = ?auto_12927 ?auto_12942 ) ) ( not ( = ?auto_12927 ?auto_12935 ) ) ( not ( = ?auto_12927 ?auto_12929 ) ) ( not ( = ?auto_12927 ?auto_12928 ) ) ( not ( = ?auto_12908 ?auto_12916 ) ) ( not ( = ?auto_12908 ?auto_12939 ) ) ( not ( = ?auto_12909 ?auto_12916 ) ) ( not ( = ?auto_12909 ?auto_12939 ) ) ( not ( = ?auto_12910 ?auto_12916 ) ) ( not ( = ?auto_12910 ?auto_12939 ) ) ( not ( = ?auto_12911 ?auto_12916 ) ) ( not ( = ?auto_12911 ?auto_12939 ) ) ( not ( = ?auto_12912 ?auto_12916 ) ) ( not ( = ?auto_12912 ?auto_12939 ) ) ( not ( = ?auto_12913 ?auto_12916 ) ) ( not ( = ?auto_12913 ?auto_12939 ) ) ( not ( = ?auto_12914 ?auto_12916 ) ) ( not ( = ?auto_12914 ?auto_12939 ) ) ( not ( = ?auto_12916 ?auto_12927 ) ) ( not ( = ?auto_12916 ?auto_12946 ) ) ( not ( = ?auto_12916 ?auto_12933 ) ) ( not ( = ?auto_12916 ?auto_12942 ) ) ( not ( = ?auto_12916 ?auto_12935 ) ) ( not ( = ?auto_12916 ?auto_12929 ) ) ( not ( = ?auto_12916 ?auto_12928 ) ) ( not ( = ?auto_12939 ?auto_12927 ) ) ( not ( = ?auto_12939 ?auto_12946 ) ) ( not ( = ?auto_12939 ?auto_12933 ) ) ( not ( = ?auto_12939 ?auto_12942 ) ) ( not ( = ?auto_12939 ?auto_12935 ) ) ( not ( = ?auto_12939 ?auto_12929 ) ) ( not ( = ?auto_12939 ?auto_12928 ) ) ( not ( = ?auto_12908 ?auto_12915 ) ) ( not ( = ?auto_12908 ?auto_12945 ) ) ( not ( = ?auto_12909 ?auto_12915 ) ) ( not ( = ?auto_12909 ?auto_12945 ) ) ( not ( = ?auto_12910 ?auto_12915 ) ) ( not ( = ?auto_12910 ?auto_12945 ) ) ( not ( = ?auto_12911 ?auto_12915 ) ) ( not ( = ?auto_12911 ?auto_12945 ) ) ( not ( = ?auto_12912 ?auto_12915 ) ) ( not ( = ?auto_12912 ?auto_12945 ) ) ( not ( = ?auto_12913 ?auto_12915 ) ) ( not ( = ?auto_12913 ?auto_12945 ) ) ( not ( = ?auto_12914 ?auto_12915 ) ) ( not ( = ?auto_12914 ?auto_12945 ) ) ( not ( = ?auto_12917 ?auto_12915 ) ) ( not ( = ?auto_12917 ?auto_12945 ) ) ( not ( = ?auto_12915 ?auto_12939 ) ) ( not ( = ?auto_12915 ?auto_12927 ) ) ( not ( = ?auto_12915 ?auto_12946 ) ) ( not ( = ?auto_12915 ?auto_12933 ) ) ( not ( = ?auto_12915 ?auto_12942 ) ) ( not ( = ?auto_12915 ?auto_12935 ) ) ( not ( = ?auto_12915 ?auto_12929 ) ) ( not ( = ?auto_12915 ?auto_12928 ) ) ( not ( = ?auto_12934 ?auto_12941 ) ) ( not ( = ?auto_12934 ?auto_12924 ) ) ( not ( = ?auto_12934 ?auto_12938 ) ) ( not ( = ?auto_12934 ?auto_12937 ) ) ( not ( = ?auto_12934 ?auto_12936 ) ) ( not ( = ?auto_12934 ?auto_12932 ) ) ( not ( = ?auto_12934 ?auto_12951 ) ) ( not ( = ?auto_12944 ?auto_12947 ) ) ( not ( = ?auto_12944 ?auto_12926 ) ) ( not ( = ?auto_12944 ?auto_12930 ) ) ( not ( = ?auto_12944 ?auto_12948 ) ) ( not ( = ?auto_12944 ?auto_12940 ) ) ( not ( = ?auto_12944 ?auto_12931 ) ) ( not ( = ?auto_12944 ?auto_12943 ) ) ( not ( = ?auto_12945 ?auto_12939 ) ) ( not ( = ?auto_12945 ?auto_12927 ) ) ( not ( = ?auto_12945 ?auto_12946 ) ) ( not ( = ?auto_12945 ?auto_12933 ) ) ( not ( = ?auto_12945 ?auto_12942 ) ) ( not ( = ?auto_12945 ?auto_12935 ) ) ( not ( = ?auto_12945 ?auto_12929 ) ) ( not ( = ?auto_12945 ?auto_12928 ) ) ( not ( = ?auto_12908 ?auto_12918 ) ) ( not ( = ?auto_12908 ?auto_12950 ) ) ( not ( = ?auto_12909 ?auto_12918 ) ) ( not ( = ?auto_12909 ?auto_12950 ) ) ( not ( = ?auto_12910 ?auto_12918 ) ) ( not ( = ?auto_12910 ?auto_12950 ) ) ( not ( = ?auto_12911 ?auto_12918 ) ) ( not ( = ?auto_12911 ?auto_12950 ) ) ( not ( = ?auto_12912 ?auto_12918 ) ) ( not ( = ?auto_12912 ?auto_12950 ) ) ( not ( = ?auto_12913 ?auto_12918 ) ) ( not ( = ?auto_12913 ?auto_12950 ) ) ( not ( = ?auto_12914 ?auto_12918 ) ) ( not ( = ?auto_12914 ?auto_12950 ) ) ( not ( = ?auto_12917 ?auto_12918 ) ) ( not ( = ?auto_12917 ?auto_12950 ) ) ( not ( = ?auto_12916 ?auto_12918 ) ) ( not ( = ?auto_12916 ?auto_12950 ) ) ( not ( = ?auto_12918 ?auto_12945 ) ) ( not ( = ?auto_12918 ?auto_12939 ) ) ( not ( = ?auto_12918 ?auto_12927 ) ) ( not ( = ?auto_12918 ?auto_12946 ) ) ( not ( = ?auto_12918 ?auto_12933 ) ) ( not ( = ?auto_12918 ?auto_12942 ) ) ( not ( = ?auto_12918 ?auto_12935 ) ) ( not ( = ?auto_12918 ?auto_12929 ) ) ( not ( = ?auto_12918 ?auto_12928 ) ) ( not ( = ?auto_12950 ?auto_12945 ) ) ( not ( = ?auto_12950 ?auto_12939 ) ) ( not ( = ?auto_12950 ?auto_12927 ) ) ( not ( = ?auto_12950 ?auto_12946 ) ) ( not ( = ?auto_12950 ?auto_12933 ) ) ( not ( = ?auto_12950 ?auto_12942 ) ) ( not ( = ?auto_12950 ?auto_12935 ) ) ( not ( = ?auto_12950 ?auto_12929 ) ) ( not ( = ?auto_12950 ?auto_12928 ) ) ( not ( = ?auto_12908 ?auto_12919 ) ) ( not ( = ?auto_12908 ?auto_12949 ) ) ( not ( = ?auto_12909 ?auto_12919 ) ) ( not ( = ?auto_12909 ?auto_12949 ) ) ( not ( = ?auto_12910 ?auto_12919 ) ) ( not ( = ?auto_12910 ?auto_12949 ) ) ( not ( = ?auto_12911 ?auto_12919 ) ) ( not ( = ?auto_12911 ?auto_12949 ) ) ( not ( = ?auto_12912 ?auto_12919 ) ) ( not ( = ?auto_12912 ?auto_12949 ) ) ( not ( = ?auto_12913 ?auto_12919 ) ) ( not ( = ?auto_12913 ?auto_12949 ) ) ( not ( = ?auto_12914 ?auto_12919 ) ) ( not ( = ?auto_12914 ?auto_12949 ) ) ( not ( = ?auto_12917 ?auto_12919 ) ) ( not ( = ?auto_12917 ?auto_12949 ) ) ( not ( = ?auto_12916 ?auto_12919 ) ) ( not ( = ?auto_12916 ?auto_12949 ) ) ( not ( = ?auto_12915 ?auto_12919 ) ) ( not ( = ?auto_12915 ?auto_12949 ) ) ( not ( = ?auto_12919 ?auto_12950 ) ) ( not ( = ?auto_12919 ?auto_12945 ) ) ( not ( = ?auto_12919 ?auto_12939 ) ) ( not ( = ?auto_12919 ?auto_12927 ) ) ( not ( = ?auto_12919 ?auto_12946 ) ) ( not ( = ?auto_12919 ?auto_12933 ) ) ( not ( = ?auto_12919 ?auto_12942 ) ) ( not ( = ?auto_12919 ?auto_12935 ) ) ( not ( = ?auto_12919 ?auto_12929 ) ) ( not ( = ?auto_12919 ?auto_12928 ) ) ( not ( = ?auto_12949 ?auto_12950 ) ) ( not ( = ?auto_12949 ?auto_12945 ) ) ( not ( = ?auto_12949 ?auto_12939 ) ) ( not ( = ?auto_12949 ?auto_12927 ) ) ( not ( = ?auto_12949 ?auto_12946 ) ) ( not ( = ?auto_12949 ?auto_12933 ) ) ( not ( = ?auto_12949 ?auto_12942 ) ) ( not ( = ?auto_12949 ?auto_12935 ) ) ( not ( = ?auto_12949 ?auto_12929 ) ) ( not ( = ?auto_12949 ?auto_12928 ) ) ( not ( = ?auto_12908 ?auto_12920 ) ) ( not ( = ?auto_12908 ?auto_12925 ) ) ( not ( = ?auto_12909 ?auto_12920 ) ) ( not ( = ?auto_12909 ?auto_12925 ) ) ( not ( = ?auto_12910 ?auto_12920 ) ) ( not ( = ?auto_12910 ?auto_12925 ) ) ( not ( = ?auto_12911 ?auto_12920 ) ) ( not ( = ?auto_12911 ?auto_12925 ) ) ( not ( = ?auto_12912 ?auto_12920 ) ) ( not ( = ?auto_12912 ?auto_12925 ) ) ( not ( = ?auto_12913 ?auto_12920 ) ) ( not ( = ?auto_12913 ?auto_12925 ) ) ( not ( = ?auto_12914 ?auto_12920 ) ) ( not ( = ?auto_12914 ?auto_12925 ) ) ( not ( = ?auto_12917 ?auto_12920 ) ) ( not ( = ?auto_12917 ?auto_12925 ) ) ( not ( = ?auto_12916 ?auto_12920 ) ) ( not ( = ?auto_12916 ?auto_12925 ) ) ( not ( = ?auto_12915 ?auto_12920 ) ) ( not ( = ?auto_12915 ?auto_12925 ) ) ( not ( = ?auto_12918 ?auto_12920 ) ) ( not ( = ?auto_12918 ?auto_12925 ) ) ( not ( = ?auto_12920 ?auto_12949 ) ) ( not ( = ?auto_12920 ?auto_12950 ) ) ( not ( = ?auto_12920 ?auto_12945 ) ) ( not ( = ?auto_12920 ?auto_12939 ) ) ( not ( = ?auto_12920 ?auto_12927 ) ) ( not ( = ?auto_12920 ?auto_12946 ) ) ( not ( = ?auto_12920 ?auto_12933 ) ) ( not ( = ?auto_12920 ?auto_12942 ) ) ( not ( = ?auto_12920 ?auto_12935 ) ) ( not ( = ?auto_12920 ?auto_12929 ) ) ( not ( = ?auto_12920 ?auto_12928 ) ) ( not ( = ?auto_12925 ?auto_12949 ) ) ( not ( = ?auto_12925 ?auto_12950 ) ) ( not ( = ?auto_12925 ?auto_12945 ) ) ( not ( = ?auto_12925 ?auto_12939 ) ) ( not ( = ?auto_12925 ?auto_12927 ) ) ( not ( = ?auto_12925 ?auto_12946 ) ) ( not ( = ?auto_12925 ?auto_12933 ) ) ( not ( = ?auto_12925 ?auto_12942 ) ) ( not ( = ?auto_12925 ?auto_12935 ) ) ( not ( = ?auto_12925 ?auto_12929 ) ) ( not ( = ?auto_12925 ?auto_12928 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_12908 ?auto_12909 ?auto_12910 ?auto_12911 ?auto_12912 ?auto_12913 ?auto_12914 ?auto_12917 ?auto_12916 ?auto_12915 ?auto_12918 ?auto_12919 )
      ( MAKE-1CRATE ?auto_12919 ?auto_12920 )
      ( MAKE-12CRATE-VERIFY ?auto_12908 ?auto_12909 ?auto_12910 ?auto_12911 ?auto_12912 ?auto_12913 ?auto_12914 ?auto_12917 ?auto_12916 ?auto_12915 ?auto_12918 ?auto_12919 ?auto_12920 ) )
  )

)

