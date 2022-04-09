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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139456 - SURFACE
      ?auto_139457 - SURFACE
    )
    :vars
    (
      ?auto_139458 - HOIST
      ?auto_139459 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139458 ?auto_139459 ) ( SURFACE-AT ?auto_139456 ?auto_139459 ) ( CLEAR ?auto_139456 ) ( LIFTING ?auto_139458 ?auto_139457 ) ( IS-CRATE ?auto_139457 ) ( not ( = ?auto_139456 ?auto_139457 ) ) )
    :subtasks
    ( ( !DROP ?auto_139458 ?auto_139457 ?auto_139456 ?auto_139459 )
      ( MAKE-1CRATE-VERIFY ?auto_139456 ?auto_139457 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139460 - SURFACE
      ?auto_139461 - SURFACE
    )
    :vars
    (
      ?auto_139462 - HOIST
      ?auto_139463 - PLACE
      ?auto_139464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139462 ?auto_139463 ) ( SURFACE-AT ?auto_139460 ?auto_139463 ) ( CLEAR ?auto_139460 ) ( IS-CRATE ?auto_139461 ) ( not ( = ?auto_139460 ?auto_139461 ) ) ( TRUCK-AT ?auto_139464 ?auto_139463 ) ( AVAILABLE ?auto_139462 ) ( IN ?auto_139461 ?auto_139464 ) )
    :subtasks
    ( ( !UNLOAD ?auto_139462 ?auto_139461 ?auto_139464 ?auto_139463 )
      ( MAKE-1CRATE ?auto_139460 ?auto_139461 )
      ( MAKE-1CRATE-VERIFY ?auto_139460 ?auto_139461 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139465 - SURFACE
      ?auto_139466 - SURFACE
    )
    :vars
    (
      ?auto_139467 - HOIST
      ?auto_139468 - PLACE
      ?auto_139469 - TRUCK
      ?auto_139470 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139467 ?auto_139468 ) ( SURFACE-AT ?auto_139465 ?auto_139468 ) ( CLEAR ?auto_139465 ) ( IS-CRATE ?auto_139466 ) ( not ( = ?auto_139465 ?auto_139466 ) ) ( AVAILABLE ?auto_139467 ) ( IN ?auto_139466 ?auto_139469 ) ( TRUCK-AT ?auto_139469 ?auto_139470 ) ( not ( = ?auto_139470 ?auto_139468 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_139469 ?auto_139470 ?auto_139468 )
      ( MAKE-1CRATE ?auto_139465 ?auto_139466 )
      ( MAKE-1CRATE-VERIFY ?auto_139465 ?auto_139466 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139471 - SURFACE
      ?auto_139472 - SURFACE
    )
    :vars
    (
      ?auto_139475 - HOIST
      ?auto_139473 - PLACE
      ?auto_139476 - TRUCK
      ?auto_139474 - PLACE
      ?auto_139477 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_139475 ?auto_139473 ) ( SURFACE-AT ?auto_139471 ?auto_139473 ) ( CLEAR ?auto_139471 ) ( IS-CRATE ?auto_139472 ) ( not ( = ?auto_139471 ?auto_139472 ) ) ( AVAILABLE ?auto_139475 ) ( TRUCK-AT ?auto_139476 ?auto_139474 ) ( not ( = ?auto_139474 ?auto_139473 ) ) ( HOIST-AT ?auto_139477 ?auto_139474 ) ( LIFTING ?auto_139477 ?auto_139472 ) ( not ( = ?auto_139475 ?auto_139477 ) ) )
    :subtasks
    ( ( !LOAD ?auto_139477 ?auto_139472 ?auto_139476 ?auto_139474 )
      ( MAKE-1CRATE ?auto_139471 ?auto_139472 )
      ( MAKE-1CRATE-VERIFY ?auto_139471 ?auto_139472 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139478 - SURFACE
      ?auto_139479 - SURFACE
    )
    :vars
    (
      ?auto_139481 - HOIST
      ?auto_139483 - PLACE
      ?auto_139482 - TRUCK
      ?auto_139480 - PLACE
      ?auto_139484 - HOIST
      ?auto_139485 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139481 ?auto_139483 ) ( SURFACE-AT ?auto_139478 ?auto_139483 ) ( CLEAR ?auto_139478 ) ( IS-CRATE ?auto_139479 ) ( not ( = ?auto_139478 ?auto_139479 ) ) ( AVAILABLE ?auto_139481 ) ( TRUCK-AT ?auto_139482 ?auto_139480 ) ( not ( = ?auto_139480 ?auto_139483 ) ) ( HOIST-AT ?auto_139484 ?auto_139480 ) ( not ( = ?auto_139481 ?auto_139484 ) ) ( AVAILABLE ?auto_139484 ) ( SURFACE-AT ?auto_139479 ?auto_139480 ) ( ON ?auto_139479 ?auto_139485 ) ( CLEAR ?auto_139479 ) ( not ( = ?auto_139478 ?auto_139485 ) ) ( not ( = ?auto_139479 ?auto_139485 ) ) )
    :subtasks
    ( ( !LIFT ?auto_139484 ?auto_139479 ?auto_139485 ?auto_139480 )
      ( MAKE-1CRATE ?auto_139478 ?auto_139479 )
      ( MAKE-1CRATE-VERIFY ?auto_139478 ?auto_139479 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139486 - SURFACE
      ?auto_139487 - SURFACE
    )
    :vars
    (
      ?auto_139488 - HOIST
      ?auto_139492 - PLACE
      ?auto_139493 - PLACE
      ?auto_139489 - HOIST
      ?auto_139491 - SURFACE
      ?auto_139490 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139488 ?auto_139492 ) ( SURFACE-AT ?auto_139486 ?auto_139492 ) ( CLEAR ?auto_139486 ) ( IS-CRATE ?auto_139487 ) ( not ( = ?auto_139486 ?auto_139487 ) ) ( AVAILABLE ?auto_139488 ) ( not ( = ?auto_139493 ?auto_139492 ) ) ( HOIST-AT ?auto_139489 ?auto_139493 ) ( not ( = ?auto_139488 ?auto_139489 ) ) ( AVAILABLE ?auto_139489 ) ( SURFACE-AT ?auto_139487 ?auto_139493 ) ( ON ?auto_139487 ?auto_139491 ) ( CLEAR ?auto_139487 ) ( not ( = ?auto_139486 ?auto_139491 ) ) ( not ( = ?auto_139487 ?auto_139491 ) ) ( TRUCK-AT ?auto_139490 ?auto_139492 ) )
    :subtasks
    ( ( !DRIVE ?auto_139490 ?auto_139492 ?auto_139493 )
      ( MAKE-1CRATE ?auto_139486 ?auto_139487 )
      ( MAKE-1CRATE-VERIFY ?auto_139486 ?auto_139487 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139503 - SURFACE
      ?auto_139504 - SURFACE
      ?auto_139505 - SURFACE
    )
    :vars
    (
      ?auto_139506 - HOIST
      ?auto_139507 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139506 ?auto_139507 ) ( SURFACE-AT ?auto_139504 ?auto_139507 ) ( CLEAR ?auto_139504 ) ( LIFTING ?auto_139506 ?auto_139505 ) ( IS-CRATE ?auto_139505 ) ( not ( = ?auto_139504 ?auto_139505 ) ) ( ON ?auto_139504 ?auto_139503 ) ( not ( = ?auto_139503 ?auto_139504 ) ) ( not ( = ?auto_139503 ?auto_139505 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139504 ?auto_139505 )
      ( MAKE-2CRATE-VERIFY ?auto_139503 ?auto_139504 ?auto_139505 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139513 - SURFACE
      ?auto_139514 - SURFACE
      ?auto_139515 - SURFACE
    )
    :vars
    (
      ?auto_139517 - HOIST
      ?auto_139518 - PLACE
      ?auto_139516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139517 ?auto_139518 ) ( SURFACE-AT ?auto_139514 ?auto_139518 ) ( CLEAR ?auto_139514 ) ( IS-CRATE ?auto_139515 ) ( not ( = ?auto_139514 ?auto_139515 ) ) ( TRUCK-AT ?auto_139516 ?auto_139518 ) ( AVAILABLE ?auto_139517 ) ( IN ?auto_139515 ?auto_139516 ) ( ON ?auto_139514 ?auto_139513 ) ( not ( = ?auto_139513 ?auto_139514 ) ) ( not ( = ?auto_139513 ?auto_139515 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139514 ?auto_139515 )
      ( MAKE-2CRATE-VERIFY ?auto_139513 ?auto_139514 ?auto_139515 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139519 - SURFACE
      ?auto_139520 - SURFACE
    )
    :vars
    (
      ?auto_139521 - HOIST
      ?auto_139522 - PLACE
      ?auto_139523 - TRUCK
      ?auto_139524 - SURFACE
      ?auto_139525 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139521 ?auto_139522 ) ( SURFACE-AT ?auto_139519 ?auto_139522 ) ( CLEAR ?auto_139519 ) ( IS-CRATE ?auto_139520 ) ( not ( = ?auto_139519 ?auto_139520 ) ) ( AVAILABLE ?auto_139521 ) ( IN ?auto_139520 ?auto_139523 ) ( ON ?auto_139519 ?auto_139524 ) ( not ( = ?auto_139524 ?auto_139519 ) ) ( not ( = ?auto_139524 ?auto_139520 ) ) ( TRUCK-AT ?auto_139523 ?auto_139525 ) ( not ( = ?auto_139525 ?auto_139522 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_139523 ?auto_139525 ?auto_139522 )
      ( MAKE-2CRATE ?auto_139524 ?auto_139519 ?auto_139520 )
      ( MAKE-1CRATE-VERIFY ?auto_139519 ?auto_139520 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139526 - SURFACE
      ?auto_139527 - SURFACE
      ?auto_139528 - SURFACE
    )
    :vars
    (
      ?auto_139532 - HOIST
      ?auto_139530 - PLACE
      ?auto_139529 - TRUCK
      ?auto_139531 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139532 ?auto_139530 ) ( SURFACE-AT ?auto_139527 ?auto_139530 ) ( CLEAR ?auto_139527 ) ( IS-CRATE ?auto_139528 ) ( not ( = ?auto_139527 ?auto_139528 ) ) ( AVAILABLE ?auto_139532 ) ( IN ?auto_139528 ?auto_139529 ) ( ON ?auto_139527 ?auto_139526 ) ( not ( = ?auto_139526 ?auto_139527 ) ) ( not ( = ?auto_139526 ?auto_139528 ) ) ( TRUCK-AT ?auto_139529 ?auto_139531 ) ( not ( = ?auto_139531 ?auto_139530 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139527 ?auto_139528 )
      ( MAKE-2CRATE-VERIFY ?auto_139526 ?auto_139527 ?auto_139528 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139533 - SURFACE
      ?auto_139534 - SURFACE
    )
    :vars
    (
      ?auto_139536 - HOIST
      ?auto_139535 - PLACE
      ?auto_139537 - SURFACE
      ?auto_139539 - TRUCK
      ?auto_139538 - PLACE
      ?auto_139540 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_139536 ?auto_139535 ) ( SURFACE-AT ?auto_139533 ?auto_139535 ) ( CLEAR ?auto_139533 ) ( IS-CRATE ?auto_139534 ) ( not ( = ?auto_139533 ?auto_139534 ) ) ( AVAILABLE ?auto_139536 ) ( ON ?auto_139533 ?auto_139537 ) ( not ( = ?auto_139537 ?auto_139533 ) ) ( not ( = ?auto_139537 ?auto_139534 ) ) ( TRUCK-AT ?auto_139539 ?auto_139538 ) ( not ( = ?auto_139538 ?auto_139535 ) ) ( HOIST-AT ?auto_139540 ?auto_139538 ) ( LIFTING ?auto_139540 ?auto_139534 ) ( not ( = ?auto_139536 ?auto_139540 ) ) )
    :subtasks
    ( ( !LOAD ?auto_139540 ?auto_139534 ?auto_139539 ?auto_139538 )
      ( MAKE-2CRATE ?auto_139537 ?auto_139533 ?auto_139534 )
      ( MAKE-1CRATE-VERIFY ?auto_139533 ?auto_139534 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139541 - SURFACE
      ?auto_139542 - SURFACE
      ?auto_139543 - SURFACE
    )
    :vars
    (
      ?auto_139545 - HOIST
      ?auto_139544 - PLACE
      ?auto_139547 - TRUCK
      ?auto_139546 - PLACE
      ?auto_139548 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_139545 ?auto_139544 ) ( SURFACE-AT ?auto_139542 ?auto_139544 ) ( CLEAR ?auto_139542 ) ( IS-CRATE ?auto_139543 ) ( not ( = ?auto_139542 ?auto_139543 ) ) ( AVAILABLE ?auto_139545 ) ( ON ?auto_139542 ?auto_139541 ) ( not ( = ?auto_139541 ?auto_139542 ) ) ( not ( = ?auto_139541 ?auto_139543 ) ) ( TRUCK-AT ?auto_139547 ?auto_139546 ) ( not ( = ?auto_139546 ?auto_139544 ) ) ( HOIST-AT ?auto_139548 ?auto_139546 ) ( LIFTING ?auto_139548 ?auto_139543 ) ( not ( = ?auto_139545 ?auto_139548 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139542 ?auto_139543 )
      ( MAKE-2CRATE-VERIFY ?auto_139541 ?auto_139542 ?auto_139543 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139549 - SURFACE
      ?auto_139550 - SURFACE
    )
    :vars
    (
      ?auto_139552 - HOIST
      ?auto_139553 - PLACE
      ?auto_139555 - SURFACE
      ?auto_139554 - TRUCK
      ?auto_139551 - PLACE
      ?auto_139556 - HOIST
      ?auto_139557 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139552 ?auto_139553 ) ( SURFACE-AT ?auto_139549 ?auto_139553 ) ( CLEAR ?auto_139549 ) ( IS-CRATE ?auto_139550 ) ( not ( = ?auto_139549 ?auto_139550 ) ) ( AVAILABLE ?auto_139552 ) ( ON ?auto_139549 ?auto_139555 ) ( not ( = ?auto_139555 ?auto_139549 ) ) ( not ( = ?auto_139555 ?auto_139550 ) ) ( TRUCK-AT ?auto_139554 ?auto_139551 ) ( not ( = ?auto_139551 ?auto_139553 ) ) ( HOIST-AT ?auto_139556 ?auto_139551 ) ( not ( = ?auto_139552 ?auto_139556 ) ) ( AVAILABLE ?auto_139556 ) ( SURFACE-AT ?auto_139550 ?auto_139551 ) ( ON ?auto_139550 ?auto_139557 ) ( CLEAR ?auto_139550 ) ( not ( = ?auto_139549 ?auto_139557 ) ) ( not ( = ?auto_139550 ?auto_139557 ) ) ( not ( = ?auto_139555 ?auto_139557 ) ) )
    :subtasks
    ( ( !LIFT ?auto_139556 ?auto_139550 ?auto_139557 ?auto_139551 )
      ( MAKE-2CRATE ?auto_139555 ?auto_139549 ?auto_139550 )
      ( MAKE-1CRATE-VERIFY ?auto_139549 ?auto_139550 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139558 - SURFACE
      ?auto_139559 - SURFACE
      ?auto_139560 - SURFACE
    )
    :vars
    (
      ?auto_139562 - HOIST
      ?auto_139566 - PLACE
      ?auto_139561 - TRUCK
      ?auto_139563 - PLACE
      ?auto_139564 - HOIST
      ?auto_139565 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139562 ?auto_139566 ) ( SURFACE-AT ?auto_139559 ?auto_139566 ) ( CLEAR ?auto_139559 ) ( IS-CRATE ?auto_139560 ) ( not ( = ?auto_139559 ?auto_139560 ) ) ( AVAILABLE ?auto_139562 ) ( ON ?auto_139559 ?auto_139558 ) ( not ( = ?auto_139558 ?auto_139559 ) ) ( not ( = ?auto_139558 ?auto_139560 ) ) ( TRUCK-AT ?auto_139561 ?auto_139563 ) ( not ( = ?auto_139563 ?auto_139566 ) ) ( HOIST-AT ?auto_139564 ?auto_139563 ) ( not ( = ?auto_139562 ?auto_139564 ) ) ( AVAILABLE ?auto_139564 ) ( SURFACE-AT ?auto_139560 ?auto_139563 ) ( ON ?auto_139560 ?auto_139565 ) ( CLEAR ?auto_139560 ) ( not ( = ?auto_139559 ?auto_139565 ) ) ( not ( = ?auto_139560 ?auto_139565 ) ) ( not ( = ?auto_139558 ?auto_139565 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139559 ?auto_139560 )
      ( MAKE-2CRATE-VERIFY ?auto_139558 ?auto_139559 ?auto_139560 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139567 - SURFACE
      ?auto_139568 - SURFACE
    )
    :vars
    (
      ?auto_139569 - HOIST
      ?auto_139573 - PLACE
      ?auto_139575 - SURFACE
      ?auto_139574 - PLACE
      ?auto_139571 - HOIST
      ?auto_139570 - SURFACE
      ?auto_139572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139569 ?auto_139573 ) ( SURFACE-AT ?auto_139567 ?auto_139573 ) ( CLEAR ?auto_139567 ) ( IS-CRATE ?auto_139568 ) ( not ( = ?auto_139567 ?auto_139568 ) ) ( AVAILABLE ?auto_139569 ) ( ON ?auto_139567 ?auto_139575 ) ( not ( = ?auto_139575 ?auto_139567 ) ) ( not ( = ?auto_139575 ?auto_139568 ) ) ( not ( = ?auto_139574 ?auto_139573 ) ) ( HOIST-AT ?auto_139571 ?auto_139574 ) ( not ( = ?auto_139569 ?auto_139571 ) ) ( AVAILABLE ?auto_139571 ) ( SURFACE-AT ?auto_139568 ?auto_139574 ) ( ON ?auto_139568 ?auto_139570 ) ( CLEAR ?auto_139568 ) ( not ( = ?auto_139567 ?auto_139570 ) ) ( not ( = ?auto_139568 ?auto_139570 ) ) ( not ( = ?auto_139575 ?auto_139570 ) ) ( TRUCK-AT ?auto_139572 ?auto_139573 ) )
    :subtasks
    ( ( !DRIVE ?auto_139572 ?auto_139573 ?auto_139574 )
      ( MAKE-2CRATE ?auto_139575 ?auto_139567 ?auto_139568 )
      ( MAKE-1CRATE-VERIFY ?auto_139567 ?auto_139568 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139576 - SURFACE
      ?auto_139577 - SURFACE
      ?auto_139578 - SURFACE
    )
    :vars
    (
      ?auto_139580 - HOIST
      ?auto_139581 - PLACE
      ?auto_139584 - PLACE
      ?auto_139583 - HOIST
      ?auto_139579 - SURFACE
      ?auto_139582 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139580 ?auto_139581 ) ( SURFACE-AT ?auto_139577 ?auto_139581 ) ( CLEAR ?auto_139577 ) ( IS-CRATE ?auto_139578 ) ( not ( = ?auto_139577 ?auto_139578 ) ) ( AVAILABLE ?auto_139580 ) ( ON ?auto_139577 ?auto_139576 ) ( not ( = ?auto_139576 ?auto_139577 ) ) ( not ( = ?auto_139576 ?auto_139578 ) ) ( not ( = ?auto_139584 ?auto_139581 ) ) ( HOIST-AT ?auto_139583 ?auto_139584 ) ( not ( = ?auto_139580 ?auto_139583 ) ) ( AVAILABLE ?auto_139583 ) ( SURFACE-AT ?auto_139578 ?auto_139584 ) ( ON ?auto_139578 ?auto_139579 ) ( CLEAR ?auto_139578 ) ( not ( = ?auto_139577 ?auto_139579 ) ) ( not ( = ?auto_139578 ?auto_139579 ) ) ( not ( = ?auto_139576 ?auto_139579 ) ) ( TRUCK-AT ?auto_139582 ?auto_139581 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139577 ?auto_139578 )
      ( MAKE-2CRATE-VERIFY ?auto_139576 ?auto_139577 ?auto_139578 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139585 - SURFACE
      ?auto_139586 - SURFACE
    )
    :vars
    (
      ?auto_139592 - HOIST
      ?auto_139589 - PLACE
      ?auto_139593 - SURFACE
      ?auto_139588 - PLACE
      ?auto_139587 - HOIST
      ?auto_139591 - SURFACE
      ?auto_139590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139592 ?auto_139589 ) ( IS-CRATE ?auto_139586 ) ( not ( = ?auto_139585 ?auto_139586 ) ) ( not ( = ?auto_139593 ?auto_139585 ) ) ( not ( = ?auto_139593 ?auto_139586 ) ) ( not ( = ?auto_139588 ?auto_139589 ) ) ( HOIST-AT ?auto_139587 ?auto_139588 ) ( not ( = ?auto_139592 ?auto_139587 ) ) ( AVAILABLE ?auto_139587 ) ( SURFACE-AT ?auto_139586 ?auto_139588 ) ( ON ?auto_139586 ?auto_139591 ) ( CLEAR ?auto_139586 ) ( not ( = ?auto_139585 ?auto_139591 ) ) ( not ( = ?auto_139586 ?auto_139591 ) ) ( not ( = ?auto_139593 ?auto_139591 ) ) ( TRUCK-AT ?auto_139590 ?auto_139589 ) ( SURFACE-AT ?auto_139593 ?auto_139589 ) ( CLEAR ?auto_139593 ) ( LIFTING ?auto_139592 ?auto_139585 ) ( IS-CRATE ?auto_139585 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139593 ?auto_139585 )
      ( MAKE-2CRATE ?auto_139593 ?auto_139585 ?auto_139586 )
      ( MAKE-1CRATE-VERIFY ?auto_139585 ?auto_139586 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139594 - SURFACE
      ?auto_139595 - SURFACE
      ?auto_139596 - SURFACE
    )
    :vars
    (
      ?auto_139599 - HOIST
      ?auto_139600 - PLACE
      ?auto_139601 - PLACE
      ?auto_139602 - HOIST
      ?auto_139597 - SURFACE
      ?auto_139598 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139599 ?auto_139600 ) ( IS-CRATE ?auto_139596 ) ( not ( = ?auto_139595 ?auto_139596 ) ) ( not ( = ?auto_139594 ?auto_139595 ) ) ( not ( = ?auto_139594 ?auto_139596 ) ) ( not ( = ?auto_139601 ?auto_139600 ) ) ( HOIST-AT ?auto_139602 ?auto_139601 ) ( not ( = ?auto_139599 ?auto_139602 ) ) ( AVAILABLE ?auto_139602 ) ( SURFACE-AT ?auto_139596 ?auto_139601 ) ( ON ?auto_139596 ?auto_139597 ) ( CLEAR ?auto_139596 ) ( not ( = ?auto_139595 ?auto_139597 ) ) ( not ( = ?auto_139596 ?auto_139597 ) ) ( not ( = ?auto_139594 ?auto_139597 ) ) ( TRUCK-AT ?auto_139598 ?auto_139600 ) ( SURFACE-AT ?auto_139594 ?auto_139600 ) ( CLEAR ?auto_139594 ) ( LIFTING ?auto_139599 ?auto_139595 ) ( IS-CRATE ?auto_139595 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139595 ?auto_139596 )
      ( MAKE-2CRATE-VERIFY ?auto_139594 ?auto_139595 ?auto_139596 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139603 - SURFACE
      ?auto_139604 - SURFACE
    )
    :vars
    (
      ?auto_139611 - HOIST
      ?auto_139610 - PLACE
      ?auto_139607 - SURFACE
      ?auto_139609 - PLACE
      ?auto_139605 - HOIST
      ?auto_139606 - SURFACE
      ?auto_139608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139611 ?auto_139610 ) ( IS-CRATE ?auto_139604 ) ( not ( = ?auto_139603 ?auto_139604 ) ) ( not ( = ?auto_139607 ?auto_139603 ) ) ( not ( = ?auto_139607 ?auto_139604 ) ) ( not ( = ?auto_139609 ?auto_139610 ) ) ( HOIST-AT ?auto_139605 ?auto_139609 ) ( not ( = ?auto_139611 ?auto_139605 ) ) ( AVAILABLE ?auto_139605 ) ( SURFACE-AT ?auto_139604 ?auto_139609 ) ( ON ?auto_139604 ?auto_139606 ) ( CLEAR ?auto_139604 ) ( not ( = ?auto_139603 ?auto_139606 ) ) ( not ( = ?auto_139604 ?auto_139606 ) ) ( not ( = ?auto_139607 ?auto_139606 ) ) ( TRUCK-AT ?auto_139608 ?auto_139610 ) ( SURFACE-AT ?auto_139607 ?auto_139610 ) ( CLEAR ?auto_139607 ) ( IS-CRATE ?auto_139603 ) ( AVAILABLE ?auto_139611 ) ( IN ?auto_139603 ?auto_139608 ) )
    :subtasks
    ( ( !UNLOAD ?auto_139611 ?auto_139603 ?auto_139608 ?auto_139610 )
      ( MAKE-2CRATE ?auto_139607 ?auto_139603 ?auto_139604 )
      ( MAKE-1CRATE-VERIFY ?auto_139603 ?auto_139604 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_139612 - SURFACE
      ?auto_139613 - SURFACE
      ?auto_139614 - SURFACE
    )
    :vars
    (
      ?auto_139620 - HOIST
      ?auto_139615 - PLACE
      ?auto_139618 - PLACE
      ?auto_139616 - HOIST
      ?auto_139617 - SURFACE
      ?auto_139619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139620 ?auto_139615 ) ( IS-CRATE ?auto_139614 ) ( not ( = ?auto_139613 ?auto_139614 ) ) ( not ( = ?auto_139612 ?auto_139613 ) ) ( not ( = ?auto_139612 ?auto_139614 ) ) ( not ( = ?auto_139618 ?auto_139615 ) ) ( HOIST-AT ?auto_139616 ?auto_139618 ) ( not ( = ?auto_139620 ?auto_139616 ) ) ( AVAILABLE ?auto_139616 ) ( SURFACE-AT ?auto_139614 ?auto_139618 ) ( ON ?auto_139614 ?auto_139617 ) ( CLEAR ?auto_139614 ) ( not ( = ?auto_139613 ?auto_139617 ) ) ( not ( = ?auto_139614 ?auto_139617 ) ) ( not ( = ?auto_139612 ?auto_139617 ) ) ( TRUCK-AT ?auto_139619 ?auto_139615 ) ( SURFACE-AT ?auto_139612 ?auto_139615 ) ( CLEAR ?auto_139612 ) ( IS-CRATE ?auto_139613 ) ( AVAILABLE ?auto_139620 ) ( IN ?auto_139613 ?auto_139619 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139613 ?auto_139614 )
      ( MAKE-2CRATE-VERIFY ?auto_139612 ?auto_139613 ?auto_139614 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_139657 - SURFACE
      ?auto_139658 - SURFACE
    )
    :vars
    (
      ?auto_139660 - HOIST
      ?auto_139663 - PLACE
      ?auto_139659 - SURFACE
      ?auto_139665 - PLACE
      ?auto_139662 - HOIST
      ?auto_139661 - SURFACE
      ?auto_139664 - TRUCK
      ?auto_139666 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139660 ?auto_139663 ) ( SURFACE-AT ?auto_139657 ?auto_139663 ) ( CLEAR ?auto_139657 ) ( IS-CRATE ?auto_139658 ) ( not ( = ?auto_139657 ?auto_139658 ) ) ( AVAILABLE ?auto_139660 ) ( ON ?auto_139657 ?auto_139659 ) ( not ( = ?auto_139659 ?auto_139657 ) ) ( not ( = ?auto_139659 ?auto_139658 ) ) ( not ( = ?auto_139665 ?auto_139663 ) ) ( HOIST-AT ?auto_139662 ?auto_139665 ) ( not ( = ?auto_139660 ?auto_139662 ) ) ( AVAILABLE ?auto_139662 ) ( SURFACE-AT ?auto_139658 ?auto_139665 ) ( ON ?auto_139658 ?auto_139661 ) ( CLEAR ?auto_139658 ) ( not ( = ?auto_139657 ?auto_139661 ) ) ( not ( = ?auto_139658 ?auto_139661 ) ) ( not ( = ?auto_139659 ?auto_139661 ) ) ( TRUCK-AT ?auto_139664 ?auto_139666 ) ( not ( = ?auto_139666 ?auto_139663 ) ) ( not ( = ?auto_139665 ?auto_139666 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_139664 ?auto_139666 ?auto_139663 )
      ( MAKE-1CRATE ?auto_139657 ?auto_139658 )
      ( MAKE-1CRATE-VERIFY ?auto_139657 ?auto_139658 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139696 - SURFACE
      ?auto_139697 - SURFACE
      ?auto_139698 - SURFACE
      ?auto_139699 - SURFACE
    )
    :vars
    (
      ?auto_139701 - HOIST
      ?auto_139700 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139701 ?auto_139700 ) ( SURFACE-AT ?auto_139698 ?auto_139700 ) ( CLEAR ?auto_139698 ) ( LIFTING ?auto_139701 ?auto_139699 ) ( IS-CRATE ?auto_139699 ) ( not ( = ?auto_139698 ?auto_139699 ) ) ( ON ?auto_139697 ?auto_139696 ) ( ON ?auto_139698 ?auto_139697 ) ( not ( = ?auto_139696 ?auto_139697 ) ) ( not ( = ?auto_139696 ?auto_139698 ) ) ( not ( = ?auto_139696 ?auto_139699 ) ) ( not ( = ?auto_139697 ?auto_139698 ) ) ( not ( = ?auto_139697 ?auto_139699 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_139698 ?auto_139699 )
      ( MAKE-3CRATE-VERIFY ?auto_139696 ?auto_139697 ?auto_139698 ?auto_139699 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139713 - SURFACE
      ?auto_139714 - SURFACE
      ?auto_139715 - SURFACE
      ?auto_139716 - SURFACE
    )
    :vars
    (
      ?auto_139719 - HOIST
      ?auto_139718 - PLACE
      ?auto_139717 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139719 ?auto_139718 ) ( SURFACE-AT ?auto_139715 ?auto_139718 ) ( CLEAR ?auto_139715 ) ( IS-CRATE ?auto_139716 ) ( not ( = ?auto_139715 ?auto_139716 ) ) ( TRUCK-AT ?auto_139717 ?auto_139718 ) ( AVAILABLE ?auto_139719 ) ( IN ?auto_139716 ?auto_139717 ) ( ON ?auto_139715 ?auto_139714 ) ( not ( = ?auto_139714 ?auto_139715 ) ) ( not ( = ?auto_139714 ?auto_139716 ) ) ( ON ?auto_139714 ?auto_139713 ) ( not ( = ?auto_139713 ?auto_139714 ) ) ( not ( = ?auto_139713 ?auto_139715 ) ) ( not ( = ?auto_139713 ?auto_139716 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139714 ?auto_139715 ?auto_139716 )
      ( MAKE-3CRATE-VERIFY ?auto_139713 ?auto_139714 ?auto_139715 ?auto_139716 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139734 - SURFACE
      ?auto_139735 - SURFACE
      ?auto_139736 - SURFACE
      ?auto_139737 - SURFACE
    )
    :vars
    (
      ?auto_139741 - HOIST
      ?auto_139740 - PLACE
      ?auto_139739 - TRUCK
      ?auto_139738 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139741 ?auto_139740 ) ( SURFACE-AT ?auto_139736 ?auto_139740 ) ( CLEAR ?auto_139736 ) ( IS-CRATE ?auto_139737 ) ( not ( = ?auto_139736 ?auto_139737 ) ) ( AVAILABLE ?auto_139741 ) ( IN ?auto_139737 ?auto_139739 ) ( ON ?auto_139736 ?auto_139735 ) ( not ( = ?auto_139735 ?auto_139736 ) ) ( not ( = ?auto_139735 ?auto_139737 ) ) ( TRUCK-AT ?auto_139739 ?auto_139738 ) ( not ( = ?auto_139738 ?auto_139740 ) ) ( ON ?auto_139735 ?auto_139734 ) ( not ( = ?auto_139734 ?auto_139735 ) ) ( not ( = ?auto_139734 ?auto_139736 ) ) ( not ( = ?auto_139734 ?auto_139737 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139735 ?auto_139736 ?auto_139737 )
      ( MAKE-3CRATE-VERIFY ?auto_139734 ?auto_139735 ?auto_139736 ?auto_139737 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139758 - SURFACE
      ?auto_139759 - SURFACE
      ?auto_139760 - SURFACE
      ?auto_139761 - SURFACE
    )
    :vars
    (
      ?auto_139763 - HOIST
      ?auto_139765 - PLACE
      ?auto_139762 - TRUCK
      ?auto_139766 - PLACE
      ?auto_139764 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_139763 ?auto_139765 ) ( SURFACE-AT ?auto_139760 ?auto_139765 ) ( CLEAR ?auto_139760 ) ( IS-CRATE ?auto_139761 ) ( not ( = ?auto_139760 ?auto_139761 ) ) ( AVAILABLE ?auto_139763 ) ( ON ?auto_139760 ?auto_139759 ) ( not ( = ?auto_139759 ?auto_139760 ) ) ( not ( = ?auto_139759 ?auto_139761 ) ) ( TRUCK-AT ?auto_139762 ?auto_139766 ) ( not ( = ?auto_139766 ?auto_139765 ) ) ( HOIST-AT ?auto_139764 ?auto_139766 ) ( LIFTING ?auto_139764 ?auto_139761 ) ( not ( = ?auto_139763 ?auto_139764 ) ) ( ON ?auto_139759 ?auto_139758 ) ( not ( = ?auto_139758 ?auto_139759 ) ) ( not ( = ?auto_139758 ?auto_139760 ) ) ( not ( = ?auto_139758 ?auto_139761 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139759 ?auto_139760 ?auto_139761 )
      ( MAKE-3CRATE-VERIFY ?auto_139758 ?auto_139759 ?auto_139760 ?auto_139761 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139785 - SURFACE
      ?auto_139786 - SURFACE
      ?auto_139787 - SURFACE
      ?auto_139788 - SURFACE
    )
    :vars
    (
      ?auto_139793 - HOIST
      ?auto_139794 - PLACE
      ?auto_139791 - TRUCK
      ?auto_139790 - PLACE
      ?auto_139792 - HOIST
      ?auto_139789 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_139793 ?auto_139794 ) ( SURFACE-AT ?auto_139787 ?auto_139794 ) ( CLEAR ?auto_139787 ) ( IS-CRATE ?auto_139788 ) ( not ( = ?auto_139787 ?auto_139788 ) ) ( AVAILABLE ?auto_139793 ) ( ON ?auto_139787 ?auto_139786 ) ( not ( = ?auto_139786 ?auto_139787 ) ) ( not ( = ?auto_139786 ?auto_139788 ) ) ( TRUCK-AT ?auto_139791 ?auto_139790 ) ( not ( = ?auto_139790 ?auto_139794 ) ) ( HOIST-AT ?auto_139792 ?auto_139790 ) ( not ( = ?auto_139793 ?auto_139792 ) ) ( AVAILABLE ?auto_139792 ) ( SURFACE-AT ?auto_139788 ?auto_139790 ) ( ON ?auto_139788 ?auto_139789 ) ( CLEAR ?auto_139788 ) ( not ( = ?auto_139787 ?auto_139789 ) ) ( not ( = ?auto_139788 ?auto_139789 ) ) ( not ( = ?auto_139786 ?auto_139789 ) ) ( ON ?auto_139786 ?auto_139785 ) ( not ( = ?auto_139785 ?auto_139786 ) ) ( not ( = ?auto_139785 ?auto_139787 ) ) ( not ( = ?auto_139785 ?auto_139788 ) ) ( not ( = ?auto_139785 ?auto_139789 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139786 ?auto_139787 ?auto_139788 )
      ( MAKE-3CRATE-VERIFY ?auto_139785 ?auto_139786 ?auto_139787 ?auto_139788 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139813 - SURFACE
      ?auto_139814 - SURFACE
      ?auto_139815 - SURFACE
      ?auto_139816 - SURFACE
    )
    :vars
    (
      ?auto_139819 - HOIST
      ?auto_139820 - PLACE
      ?auto_139817 - PLACE
      ?auto_139822 - HOIST
      ?auto_139821 - SURFACE
      ?auto_139818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139819 ?auto_139820 ) ( SURFACE-AT ?auto_139815 ?auto_139820 ) ( CLEAR ?auto_139815 ) ( IS-CRATE ?auto_139816 ) ( not ( = ?auto_139815 ?auto_139816 ) ) ( AVAILABLE ?auto_139819 ) ( ON ?auto_139815 ?auto_139814 ) ( not ( = ?auto_139814 ?auto_139815 ) ) ( not ( = ?auto_139814 ?auto_139816 ) ) ( not ( = ?auto_139817 ?auto_139820 ) ) ( HOIST-AT ?auto_139822 ?auto_139817 ) ( not ( = ?auto_139819 ?auto_139822 ) ) ( AVAILABLE ?auto_139822 ) ( SURFACE-AT ?auto_139816 ?auto_139817 ) ( ON ?auto_139816 ?auto_139821 ) ( CLEAR ?auto_139816 ) ( not ( = ?auto_139815 ?auto_139821 ) ) ( not ( = ?auto_139816 ?auto_139821 ) ) ( not ( = ?auto_139814 ?auto_139821 ) ) ( TRUCK-AT ?auto_139818 ?auto_139820 ) ( ON ?auto_139814 ?auto_139813 ) ( not ( = ?auto_139813 ?auto_139814 ) ) ( not ( = ?auto_139813 ?auto_139815 ) ) ( not ( = ?auto_139813 ?auto_139816 ) ) ( not ( = ?auto_139813 ?auto_139821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139814 ?auto_139815 ?auto_139816 )
      ( MAKE-3CRATE-VERIFY ?auto_139813 ?auto_139814 ?auto_139815 ?auto_139816 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139841 - SURFACE
      ?auto_139842 - SURFACE
      ?auto_139843 - SURFACE
      ?auto_139844 - SURFACE
    )
    :vars
    (
      ?auto_139845 - HOIST
      ?auto_139847 - PLACE
      ?auto_139850 - PLACE
      ?auto_139849 - HOIST
      ?auto_139846 - SURFACE
      ?auto_139848 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139845 ?auto_139847 ) ( IS-CRATE ?auto_139844 ) ( not ( = ?auto_139843 ?auto_139844 ) ) ( not ( = ?auto_139842 ?auto_139843 ) ) ( not ( = ?auto_139842 ?auto_139844 ) ) ( not ( = ?auto_139850 ?auto_139847 ) ) ( HOIST-AT ?auto_139849 ?auto_139850 ) ( not ( = ?auto_139845 ?auto_139849 ) ) ( AVAILABLE ?auto_139849 ) ( SURFACE-AT ?auto_139844 ?auto_139850 ) ( ON ?auto_139844 ?auto_139846 ) ( CLEAR ?auto_139844 ) ( not ( = ?auto_139843 ?auto_139846 ) ) ( not ( = ?auto_139844 ?auto_139846 ) ) ( not ( = ?auto_139842 ?auto_139846 ) ) ( TRUCK-AT ?auto_139848 ?auto_139847 ) ( SURFACE-AT ?auto_139842 ?auto_139847 ) ( CLEAR ?auto_139842 ) ( LIFTING ?auto_139845 ?auto_139843 ) ( IS-CRATE ?auto_139843 ) ( ON ?auto_139842 ?auto_139841 ) ( not ( = ?auto_139841 ?auto_139842 ) ) ( not ( = ?auto_139841 ?auto_139843 ) ) ( not ( = ?auto_139841 ?auto_139844 ) ) ( not ( = ?auto_139841 ?auto_139846 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139842 ?auto_139843 ?auto_139844 )
      ( MAKE-3CRATE-VERIFY ?auto_139841 ?auto_139842 ?auto_139843 ?auto_139844 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_139869 - SURFACE
      ?auto_139870 - SURFACE
      ?auto_139871 - SURFACE
      ?auto_139872 - SURFACE
    )
    :vars
    (
      ?auto_139874 - HOIST
      ?auto_139877 - PLACE
      ?auto_139873 - PLACE
      ?auto_139878 - HOIST
      ?auto_139876 - SURFACE
      ?auto_139875 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_139874 ?auto_139877 ) ( IS-CRATE ?auto_139872 ) ( not ( = ?auto_139871 ?auto_139872 ) ) ( not ( = ?auto_139870 ?auto_139871 ) ) ( not ( = ?auto_139870 ?auto_139872 ) ) ( not ( = ?auto_139873 ?auto_139877 ) ) ( HOIST-AT ?auto_139878 ?auto_139873 ) ( not ( = ?auto_139874 ?auto_139878 ) ) ( AVAILABLE ?auto_139878 ) ( SURFACE-AT ?auto_139872 ?auto_139873 ) ( ON ?auto_139872 ?auto_139876 ) ( CLEAR ?auto_139872 ) ( not ( = ?auto_139871 ?auto_139876 ) ) ( not ( = ?auto_139872 ?auto_139876 ) ) ( not ( = ?auto_139870 ?auto_139876 ) ) ( TRUCK-AT ?auto_139875 ?auto_139877 ) ( SURFACE-AT ?auto_139870 ?auto_139877 ) ( CLEAR ?auto_139870 ) ( IS-CRATE ?auto_139871 ) ( AVAILABLE ?auto_139874 ) ( IN ?auto_139871 ?auto_139875 ) ( ON ?auto_139870 ?auto_139869 ) ( not ( = ?auto_139869 ?auto_139870 ) ) ( not ( = ?auto_139869 ?auto_139871 ) ) ( not ( = ?auto_139869 ?auto_139872 ) ) ( not ( = ?auto_139869 ?auto_139876 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_139870 ?auto_139871 ?auto_139872 )
      ( MAKE-3CRATE-VERIFY ?auto_139869 ?auto_139870 ?auto_139871 ?auto_139872 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140160 - SURFACE
      ?auto_140161 - SURFACE
      ?auto_140162 - SURFACE
      ?auto_140163 - SURFACE
      ?auto_140164 - SURFACE
    )
    :vars
    (
      ?auto_140166 - HOIST
      ?auto_140165 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_140166 ?auto_140165 ) ( SURFACE-AT ?auto_140163 ?auto_140165 ) ( CLEAR ?auto_140163 ) ( LIFTING ?auto_140166 ?auto_140164 ) ( IS-CRATE ?auto_140164 ) ( not ( = ?auto_140163 ?auto_140164 ) ) ( ON ?auto_140161 ?auto_140160 ) ( ON ?auto_140162 ?auto_140161 ) ( ON ?auto_140163 ?auto_140162 ) ( not ( = ?auto_140160 ?auto_140161 ) ) ( not ( = ?auto_140160 ?auto_140162 ) ) ( not ( = ?auto_140160 ?auto_140163 ) ) ( not ( = ?auto_140160 ?auto_140164 ) ) ( not ( = ?auto_140161 ?auto_140162 ) ) ( not ( = ?auto_140161 ?auto_140163 ) ) ( not ( = ?auto_140161 ?auto_140164 ) ) ( not ( = ?auto_140162 ?auto_140163 ) ) ( not ( = ?auto_140162 ?auto_140164 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_140163 ?auto_140164 )
      ( MAKE-4CRATE-VERIFY ?auto_140160 ?auto_140161 ?auto_140162 ?auto_140163 ?auto_140164 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140185 - SURFACE
      ?auto_140186 - SURFACE
      ?auto_140187 - SURFACE
      ?auto_140188 - SURFACE
      ?auto_140189 - SURFACE
    )
    :vars
    (
      ?auto_140190 - HOIST
      ?auto_140191 - PLACE
      ?auto_140192 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140190 ?auto_140191 ) ( SURFACE-AT ?auto_140188 ?auto_140191 ) ( CLEAR ?auto_140188 ) ( IS-CRATE ?auto_140189 ) ( not ( = ?auto_140188 ?auto_140189 ) ) ( TRUCK-AT ?auto_140192 ?auto_140191 ) ( AVAILABLE ?auto_140190 ) ( IN ?auto_140189 ?auto_140192 ) ( ON ?auto_140188 ?auto_140187 ) ( not ( = ?auto_140187 ?auto_140188 ) ) ( not ( = ?auto_140187 ?auto_140189 ) ) ( ON ?auto_140186 ?auto_140185 ) ( ON ?auto_140187 ?auto_140186 ) ( not ( = ?auto_140185 ?auto_140186 ) ) ( not ( = ?auto_140185 ?auto_140187 ) ) ( not ( = ?auto_140185 ?auto_140188 ) ) ( not ( = ?auto_140185 ?auto_140189 ) ) ( not ( = ?auto_140186 ?auto_140187 ) ) ( not ( = ?auto_140186 ?auto_140188 ) ) ( not ( = ?auto_140186 ?auto_140189 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140187 ?auto_140188 ?auto_140189 )
      ( MAKE-4CRATE-VERIFY ?auto_140185 ?auto_140186 ?auto_140187 ?auto_140188 ?auto_140189 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140215 - SURFACE
      ?auto_140216 - SURFACE
      ?auto_140217 - SURFACE
      ?auto_140218 - SURFACE
      ?auto_140219 - SURFACE
    )
    :vars
    (
      ?auto_140223 - HOIST
      ?auto_140222 - PLACE
      ?auto_140221 - TRUCK
      ?auto_140220 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_140223 ?auto_140222 ) ( SURFACE-AT ?auto_140218 ?auto_140222 ) ( CLEAR ?auto_140218 ) ( IS-CRATE ?auto_140219 ) ( not ( = ?auto_140218 ?auto_140219 ) ) ( AVAILABLE ?auto_140223 ) ( IN ?auto_140219 ?auto_140221 ) ( ON ?auto_140218 ?auto_140217 ) ( not ( = ?auto_140217 ?auto_140218 ) ) ( not ( = ?auto_140217 ?auto_140219 ) ) ( TRUCK-AT ?auto_140221 ?auto_140220 ) ( not ( = ?auto_140220 ?auto_140222 ) ) ( ON ?auto_140216 ?auto_140215 ) ( ON ?auto_140217 ?auto_140216 ) ( not ( = ?auto_140215 ?auto_140216 ) ) ( not ( = ?auto_140215 ?auto_140217 ) ) ( not ( = ?auto_140215 ?auto_140218 ) ) ( not ( = ?auto_140215 ?auto_140219 ) ) ( not ( = ?auto_140216 ?auto_140217 ) ) ( not ( = ?auto_140216 ?auto_140218 ) ) ( not ( = ?auto_140216 ?auto_140219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140217 ?auto_140218 ?auto_140219 )
      ( MAKE-4CRATE-VERIFY ?auto_140215 ?auto_140216 ?auto_140217 ?auto_140218 ?auto_140219 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140249 - SURFACE
      ?auto_140250 - SURFACE
      ?auto_140251 - SURFACE
      ?auto_140252 - SURFACE
      ?auto_140253 - SURFACE
    )
    :vars
    (
      ?auto_140256 - HOIST
      ?auto_140254 - PLACE
      ?auto_140257 - TRUCK
      ?auto_140255 - PLACE
      ?auto_140258 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_140256 ?auto_140254 ) ( SURFACE-AT ?auto_140252 ?auto_140254 ) ( CLEAR ?auto_140252 ) ( IS-CRATE ?auto_140253 ) ( not ( = ?auto_140252 ?auto_140253 ) ) ( AVAILABLE ?auto_140256 ) ( ON ?auto_140252 ?auto_140251 ) ( not ( = ?auto_140251 ?auto_140252 ) ) ( not ( = ?auto_140251 ?auto_140253 ) ) ( TRUCK-AT ?auto_140257 ?auto_140255 ) ( not ( = ?auto_140255 ?auto_140254 ) ) ( HOIST-AT ?auto_140258 ?auto_140255 ) ( LIFTING ?auto_140258 ?auto_140253 ) ( not ( = ?auto_140256 ?auto_140258 ) ) ( ON ?auto_140250 ?auto_140249 ) ( ON ?auto_140251 ?auto_140250 ) ( not ( = ?auto_140249 ?auto_140250 ) ) ( not ( = ?auto_140249 ?auto_140251 ) ) ( not ( = ?auto_140249 ?auto_140252 ) ) ( not ( = ?auto_140249 ?auto_140253 ) ) ( not ( = ?auto_140250 ?auto_140251 ) ) ( not ( = ?auto_140250 ?auto_140252 ) ) ( not ( = ?auto_140250 ?auto_140253 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140251 ?auto_140252 ?auto_140253 )
      ( MAKE-4CRATE-VERIFY ?auto_140249 ?auto_140250 ?auto_140251 ?auto_140252 ?auto_140253 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140287 - SURFACE
      ?auto_140288 - SURFACE
      ?auto_140289 - SURFACE
      ?auto_140290 - SURFACE
      ?auto_140291 - SURFACE
    )
    :vars
    (
      ?auto_140295 - HOIST
      ?auto_140296 - PLACE
      ?auto_140292 - TRUCK
      ?auto_140293 - PLACE
      ?auto_140294 - HOIST
      ?auto_140297 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_140295 ?auto_140296 ) ( SURFACE-AT ?auto_140290 ?auto_140296 ) ( CLEAR ?auto_140290 ) ( IS-CRATE ?auto_140291 ) ( not ( = ?auto_140290 ?auto_140291 ) ) ( AVAILABLE ?auto_140295 ) ( ON ?auto_140290 ?auto_140289 ) ( not ( = ?auto_140289 ?auto_140290 ) ) ( not ( = ?auto_140289 ?auto_140291 ) ) ( TRUCK-AT ?auto_140292 ?auto_140293 ) ( not ( = ?auto_140293 ?auto_140296 ) ) ( HOIST-AT ?auto_140294 ?auto_140293 ) ( not ( = ?auto_140295 ?auto_140294 ) ) ( AVAILABLE ?auto_140294 ) ( SURFACE-AT ?auto_140291 ?auto_140293 ) ( ON ?auto_140291 ?auto_140297 ) ( CLEAR ?auto_140291 ) ( not ( = ?auto_140290 ?auto_140297 ) ) ( not ( = ?auto_140291 ?auto_140297 ) ) ( not ( = ?auto_140289 ?auto_140297 ) ) ( ON ?auto_140288 ?auto_140287 ) ( ON ?auto_140289 ?auto_140288 ) ( not ( = ?auto_140287 ?auto_140288 ) ) ( not ( = ?auto_140287 ?auto_140289 ) ) ( not ( = ?auto_140287 ?auto_140290 ) ) ( not ( = ?auto_140287 ?auto_140291 ) ) ( not ( = ?auto_140287 ?auto_140297 ) ) ( not ( = ?auto_140288 ?auto_140289 ) ) ( not ( = ?auto_140288 ?auto_140290 ) ) ( not ( = ?auto_140288 ?auto_140291 ) ) ( not ( = ?auto_140288 ?auto_140297 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140289 ?auto_140290 ?auto_140291 )
      ( MAKE-4CRATE-VERIFY ?auto_140287 ?auto_140288 ?auto_140289 ?auto_140290 ?auto_140291 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140326 - SURFACE
      ?auto_140327 - SURFACE
      ?auto_140328 - SURFACE
      ?auto_140329 - SURFACE
      ?auto_140330 - SURFACE
    )
    :vars
    (
      ?auto_140335 - HOIST
      ?auto_140331 - PLACE
      ?auto_140334 - PLACE
      ?auto_140333 - HOIST
      ?auto_140332 - SURFACE
      ?auto_140336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140335 ?auto_140331 ) ( SURFACE-AT ?auto_140329 ?auto_140331 ) ( CLEAR ?auto_140329 ) ( IS-CRATE ?auto_140330 ) ( not ( = ?auto_140329 ?auto_140330 ) ) ( AVAILABLE ?auto_140335 ) ( ON ?auto_140329 ?auto_140328 ) ( not ( = ?auto_140328 ?auto_140329 ) ) ( not ( = ?auto_140328 ?auto_140330 ) ) ( not ( = ?auto_140334 ?auto_140331 ) ) ( HOIST-AT ?auto_140333 ?auto_140334 ) ( not ( = ?auto_140335 ?auto_140333 ) ) ( AVAILABLE ?auto_140333 ) ( SURFACE-AT ?auto_140330 ?auto_140334 ) ( ON ?auto_140330 ?auto_140332 ) ( CLEAR ?auto_140330 ) ( not ( = ?auto_140329 ?auto_140332 ) ) ( not ( = ?auto_140330 ?auto_140332 ) ) ( not ( = ?auto_140328 ?auto_140332 ) ) ( TRUCK-AT ?auto_140336 ?auto_140331 ) ( ON ?auto_140327 ?auto_140326 ) ( ON ?auto_140328 ?auto_140327 ) ( not ( = ?auto_140326 ?auto_140327 ) ) ( not ( = ?auto_140326 ?auto_140328 ) ) ( not ( = ?auto_140326 ?auto_140329 ) ) ( not ( = ?auto_140326 ?auto_140330 ) ) ( not ( = ?auto_140326 ?auto_140332 ) ) ( not ( = ?auto_140327 ?auto_140328 ) ) ( not ( = ?auto_140327 ?auto_140329 ) ) ( not ( = ?auto_140327 ?auto_140330 ) ) ( not ( = ?auto_140327 ?auto_140332 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140328 ?auto_140329 ?auto_140330 )
      ( MAKE-4CRATE-VERIFY ?auto_140326 ?auto_140327 ?auto_140328 ?auto_140329 ?auto_140330 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140365 - SURFACE
      ?auto_140366 - SURFACE
      ?auto_140367 - SURFACE
      ?auto_140368 - SURFACE
      ?auto_140369 - SURFACE
    )
    :vars
    (
      ?auto_140371 - HOIST
      ?auto_140374 - PLACE
      ?auto_140372 - PLACE
      ?auto_140370 - HOIST
      ?auto_140373 - SURFACE
      ?auto_140375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140371 ?auto_140374 ) ( IS-CRATE ?auto_140369 ) ( not ( = ?auto_140368 ?auto_140369 ) ) ( not ( = ?auto_140367 ?auto_140368 ) ) ( not ( = ?auto_140367 ?auto_140369 ) ) ( not ( = ?auto_140372 ?auto_140374 ) ) ( HOIST-AT ?auto_140370 ?auto_140372 ) ( not ( = ?auto_140371 ?auto_140370 ) ) ( AVAILABLE ?auto_140370 ) ( SURFACE-AT ?auto_140369 ?auto_140372 ) ( ON ?auto_140369 ?auto_140373 ) ( CLEAR ?auto_140369 ) ( not ( = ?auto_140368 ?auto_140373 ) ) ( not ( = ?auto_140369 ?auto_140373 ) ) ( not ( = ?auto_140367 ?auto_140373 ) ) ( TRUCK-AT ?auto_140375 ?auto_140374 ) ( SURFACE-AT ?auto_140367 ?auto_140374 ) ( CLEAR ?auto_140367 ) ( LIFTING ?auto_140371 ?auto_140368 ) ( IS-CRATE ?auto_140368 ) ( ON ?auto_140366 ?auto_140365 ) ( ON ?auto_140367 ?auto_140366 ) ( not ( = ?auto_140365 ?auto_140366 ) ) ( not ( = ?auto_140365 ?auto_140367 ) ) ( not ( = ?auto_140365 ?auto_140368 ) ) ( not ( = ?auto_140365 ?auto_140369 ) ) ( not ( = ?auto_140365 ?auto_140373 ) ) ( not ( = ?auto_140366 ?auto_140367 ) ) ( not ( = ?auto_140366 ?auto_140368 ) ) ( not ( = ?auto_140366 ?auto_140369 ) ) ( not ( = ?auto_140366 ?auto_140373 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140367 ?auto_140368 ?auto_140369 )
      ( MAKE-4CRATE-VERIFY ?auto_140365 ?auto_140366 ?auto_140367 ?auto_140368 ?auto_140369 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140404 - SURFACE
      ?auto_140405 - SURFACE
      ?auto_140406 - SURFACE
      ?auto_140407 - SURFACE
      ?auto_140408 - SURFACE
    )
    :vars
    (
      ?auto_140412 - HOIST
      ?auto_140414 - PLACE
      ?auto_140411 - PLACE
      ?auto_140409 - HOIST
      ?auto_140413 - SURFACE
      ?auto_140410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140412 ?auto_140414 ) ( IS-CRATE ?auto_140408 ) ( not ( = ?auto_140407 ?auto_140408 ) ) ( not ( = ?auto_140406 ?auto_140407 ) ) ( not ( = ?auto_140406 ?auto_140408 ) ) ( not ( = ?auto_140411 ?auto_140414 ) ) ( HOIST-AT ?auto_140409 ?auto_140411 ) ( not ( = ?auto_140412 ?auto_140409 ) ) ( AVAILABLE ?auto_140409 ) ( SURFACE-AT ?auto_140408 ?auto_140411 ) ( ON ?auto_140408 ?auto_140413 ) ( CLEAR ?auto_140408 ) ( not ( = ?auto_140407 ?auto_140413 ) ) ( not ( = ?auto_140408 ?auto_140413 ) ) ( not ( = ?auto_140406 ?auto_140413 ) ) ( TRUCK-AT ?auto_140410 ?auto_140414 ) ( SURFACE-AT ?auto_140406 ?auto_140414 ) ( CLEAR ?auto_140406 ) ( IS-CRATE ?auto_140407 ) ( AVAILABLE ?auto_140412 ) ( IN ?auto_140407 ?auto_140410 ) ( ON ?auto_140405 ?auto_140404 ) ( ON ?auto_140406 ?auto_140405 ) ( not ( = ?auto_140404 ?auto_140405 ) ) ( not ( = ?auto_140404 ?auto_140406 ) ) ( not ( = ?auto_140404 ?auto_140407 ) ) ( not ( = ?auto_140404 ?auto_140408 ) ) ( not ( = ?auto_140404 ?auto_140413 ) ) ( not ( = ?auto_140405 ?auto_140406 ) ) ( not ( = ?auto_140405 ?auto_140407 ) ) ( not ( = ?auto_140405 ?auto_140408 ) ) ( not ( = ?auto_140405 ?auto_140413 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140406 ?auto_140407 ?auto_140408 )
      ( MAKE-4CRATE-VERIFY ?auto_140404 ?auto_140405 ?auto_140406 ?auto_140407 ?auto_140408 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_140415 - SURFACE
      ?auto_140416 - SURFACE
    )
    :vars
    (
      ?auto_140421 - HOIST
      ?auto_140423 - PLACE
      ?auto_140419 - SURFACE
      ?auto_140420 - PLACE
      ?auto_140417 - HOIST
      ?auto_140422 - SURFACE
      ?auto_140418 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140421 ?auto_140423 ) ( IS-CRATE ?auto_140416 ) ( not ( = ?auto_140415 ?auto_140416 ) ) ( not ( = ?auto_140419 ?auto_140415 ) ) ( not ( = ?auto_140419 ?auto_140416 ) ) ( not ( = ?auto_140420 ?auto_140423 ) ) ( HOIST-AT ?auto_140417 ?auto_140420 ) ( not ( = ?auto_140421 ?auto_140417 ) ) ( AVAILABLE ?auto_140417 ) ( SURFACE-AT ?auto_140416 ?auto_140420 ) ( ON ?auto_140416 ?auto_140422 ) ( CLEAR ?auto_140416 ) ( not ( = ?auto_140415 ?auto_140422 ) ) ( not ( = ?auto_140416 ?auto_140422 ) ) ( not ( = ?auto_140419 ?auto_140422 ) ) ( SURFACE-AT ?auto_140419 ?auto_140423 ) ( CLEAR ?auto_140419 ) ( IS-CRATE ?auto_140415 ) ( AVAILABLE ?auto_140421 ) ( IN ?auto_140415 ?auto_140418 ) ( TRUCK-AT ?auto_140418 ?auto_140420 ) )
    :subtasks
    ( ( !DRIVE ?auto_140418 ?auto_140420 ?auto_140423 )
      ( MAKE-2CRATE ?auto_140419 ?auto_140415 ?auto_140416 )
      ( MAKE-1CRATE-VERIFY ?auto_140415 ?auto_140416 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_140424 - SURFACE
      ?auto_140425 - SURFACE
      ?auto_140426 - SURFACE
    )
    :vars
    (
      ?auto_140429 - HOIST
      ?auto_140431 - PLACE
      ?auto_140432 - PLACE
      ?auto_140430 - HOIST
      ?auto_140427 - SURFACE
      ?auto_140428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140429 ?auto_140431 ) ( IS-CRATE ?auto_140426 ) ( not ( = ?auto_140425 ?auto_140426 ) ) ( not ( = ?auto_140424 ?auto_140425 ) ) ( not ( = ?auto_140424 ?auto_140426 ) ) ( not ( = ?auto_140432 ?auto_140431 ) ) ( HOIST-AT ?auto_140430 ?auto_140432 ) ( not ( = ?auto_140429 ?auto_140430 ) ) ( AVAILABLE ?auto_140430 ) ( SURFACE-AT ?auto_140426 ?auto_140432 ) ( ON ?auto_140426 ?auto_140427 ) ( CLEAR ?auto_140426 ) ( not ( = ?auto_140425 ?auto_140427 ) ) ( not ( = ?auto_140426 ?auto_140427 ) ) ( not ( = ?auto_140424 ?auto_140427 ) ) ( SURFACE-AT ?auto_140424 ?auto_140431 ) ( CLEAR ?auto_140424 ) ( IS-CRATE ?auto_140425 ) ( AVAILABLE ?auto_140429 ) ( IN ?auto_140425 ?auto_140428 ) ( TRUCK-AT ?auto_140428 ?auto_140432 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_140425 ?auto_140426 )
      ( MAKE-2CRATE-VERIFY ?auto_140424 ?auto_140425 ?auto_140426 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_140433 - SURFACE
      ?auto_140434 - SURFACE
      ?auto_140435 - SURFACE
      ?auto_140436 - SURFACE
    )
    :vars
    (
      ?auto_140439 - HOIST
      ?auto_140442 - PLACE
      ?auto_140441 - PLACE
      ?auto_140438 - HOIST
      ?auto_140437 - SURFACE
      ?auto_140440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140439 ?auto_140442 ) ( IS-CRATE ?auto_140436 ) ( not ( = ?auto_140435 ?auto_140436 ) ) ( not ( = ?auto_140434 ?auto_140435 ) ) ( not ( = ?auto_140434 ?auto_140436 ) ) ( not ( = ?auto_140441 ?auto_140442 ) ) ( HOIST-AT ?auto_140438 ?auto_140441 ) ( not ( = ?auto_140439 ?auto_140438 ) ) ( AVAILABLE ?auto_140438 ) ( SURFACE-AT ?auto_140436 ?auto_140441 ) ( ON ?auto_140436 ?auto_140437 ) ( CLEAR ?auto_140436 ) ( not ( = ?auto_140435 ?auto_140437 ) ) ( not ( = ?auto_140436 ?auto_140437 ) ) ( not ( = ?auto_140434 ?auto_140437 ) ) ( SURFACE-AT ?auto_140434 ?auto_140442 ) ( CLEAR ?auto_140434 ) ( IS-CRATE ?auto_140435 ) ( AVAILABLE ?auto_140439 ) ( IN ?auto_140435 ?auto_140440 ) ( TRUCK-AT ?auto_140440 ?auto_140441 ) ( ON ?auto_140434 ?auto_140433 ) ( not ( = ?auto_140433 ?auto_140434 ) ) ( not ( = ?auto_140433 ?auto_140435 ) ) ( not ( = ?auto_140433 ?auto_140436 ) ) ( not ( = ?auto_140433 ?auto_140437 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140434 ?auto_140435 ?auto_140436 )
      ( MAKE-3CRATE-VERIFY ?auto_140433 ?auto_140434 ?auto_140435 ?auto_140436 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140443 - SURFACE
      ?auto_140444 - SURFACE
      ?auto_140445 - SURFACE
      ?auto_140446 - SURFACE
      ?auto_140447 - SURFACE
    )
    :vars
    (
      ?auto_140450 - HOIST
      ?auto_140453 - PLACE
      ?auto_140452 - PLACE
      ?auto_140449 - HOIST
      ?auto_140448 - SURFACE
      ?auto_140451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140450 ?auto_140453 ) ( IS-CRATE ?auto_140447 ) ( not ( = ?auto_140446 ?auto_140447 ) ) ( not ( = ?auto_140445 ?auto_140446 ) ) ( not ( = ?auto_140445 ?auto_140447 ) ) ( not ( = ?auto_140452 ?auto_140453 ) ) ( HOIST-AT ?auto_140449 ?auto_140452 ) ( not ( = ?auto_140450 ?auto_140449 ) ) ( AVAILABLE ?auto_140449 ) ( SURFACE-AT ?auto_140447 ?auto_140452 ) ( ON ?auto_140447 ?auto_140448 ) ( CLEAR ?auto_140447 ) ( not ( = ?auto_140446 ?auto_140448 ) ) ( not ( = ?auto_140447 ?auto_140448 ) ) ( not ( = ?auto_140445 ?auto_140448 ) ) ( SURFACE-AT ?auto_140445 ?auto_140453 ) ( CLEAR ?auto_140445 ) ( IS-CRATE ?auto_140446 ) ( AVAILABLE ?auto_140450 ) ( IN ?auto_140446 ?auto_140451 ) ( TRUCK-AT ?auto_140451 ?auto_140452 ) ( ON ?auto_140444 ?auto_140443 ) ( ON ?auto_140445 ?auto_140444 ) ( not ( = ?auto_140443 ?auto_140444 ) ) ( not ( = ?auto_140443 ?auto_140445 ) ) ( not ( = ?auto_140443 ?auto_140446 ) ) ( not ( = ?auto_140443 ?auto_140447 ) ) ( not ( = ?auto_140443 ?auto_140448 ) ) ( not ( = ?auto_140444 ?auto_140445 ) ) ( not ( = ?auto_140444 ?auto_140446 ) ) ( not ( = ?auto_140444 ?auto_140447 ) ) ( not ( = ?auto_140444 ?auto_140448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140445 ?auto_140446 ?auto_140447 )
      ( MAKE-4CRATE-VERIFY ?auto_140443 ?auto_140444 ?auto_140445 ?auto_140446 ?auto_140447 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_140454 - SURFACE
      ?auto_140455 - SURFACE
    )
    :vars
    (
      ?auto_140458 - HOIST
      ?auto_140461 - PLACE
      ?auto_140462 - SURFACE
      ?auto_140460 - PLACE
      ?auto_140457 - HOIST
      ?auto_140456 - SURFACE
      ?auto_140459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140458 ?auto_140461 ) ( IS-CRATE ?auto_140455 ) ( not ( = ?auto_140454 ?auto_140455 ) ) ( not ( = ?auto_140462 ?auto_140454 ) ) ( not ( = ?auto_140462 ?auto_140455 ) ) ( not ( = ?auto_140460 ?auto_140461 ) ) ( HOIST-AT ?auto_140457 ?auto_140460 ) ( not ( = ?auto_140458 ?auto_140457 ) ) ( SURFACE-AT ?auto_140455 ?auto_140460 ) ( ON ?auto_140455 ?auto_140456 ) ( CLEAR ?auto_140455 ) ( not ( = ?auto_140454 ?auto_140456 ) ) ( not ( = ?auto_140455 ?auto_140456 ) ) ( not ( = ?auto_140462 ?auto_140456 ) ) ( SURFACE-AT ?auto_140462 ?auto_140461 ) ( CLEAR ?auto_140462 ) ( IS-CRATE ?auto_140454 ) ( AVAILABLE ?auto_140458 ) ( TRUCK-AT ?auto_140459 ?auto_140460 ) ( LIFTING ?auto_140457 ?auto_140454 ) )
    :subtasks
    ( ( !LOAD ?auto_140457 ?auto_140454 ?auto_140459 ?auto_140460 )
      ( MAKE-2CRATE ?auto_140462 ?auto_140454 ?auto_140455 )
      ( MAKE-1CRATE-VERIFY ?auto_140454 ?auto_140455 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_140463 - SURFACE
      ?auto_140464 - SURFACE
      ?auto_140465 - SURFACE
    )
    :vars
    (
      ?auto_140467 - HOIST
      ?auto_140466 - PLACE
      ?auto_140470 - PLACE
      ?auto_140469 - HOIST
      ?auto_140471 - SURFACE
      ?auto_140468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140467 ?auto_140466 ) ( IS-CRATE ?auto_140465 ) ( not ( = ?auto_140464 ?auto_140465 ) ) ( not ( = ?auto_140463 ?auto_140464 ) ) ( not ( = ?auto_140463 ?auto_140465 ) ) ( not ( = ?auto_140470 ?auto_140466 ) ) ( HOIST-AT ?auto_140469 ?auto_140470 ) ( not ( = ?auto_140467 ?auto_140469 ) ) ( SURFACE-AT ?auto_140465 ?auto_140470 ) ( ON ?auto_140465 ?auto_140471 ) ( CLEAR ?auto_140465 ) ( not ( = ?auto_140464 ?auto_140471 ) ) ( not ( = ?auto_140465 ?auto_140471 ) ) ( not ( = ?auto_140463 ?auto_140471 ) ) ( SURFACE-AT ?auto_140463 ?auto_140466 ) ( CLEAR ?auto_140463 ) ( IS-CRATE ?auto_140464 ) ( AVAILABLE ?auto_140467 ) ( TRUCK-AT ?auto_140468 ?auto_140470 ) ( LIFTING ?auto_140469 ?auto_140464 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_140464 ?auto_140465 )
      ( MAKE-2CRATE-VERIFY ?auto_140463 ?auto_140464 ?auto_140465 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_140472 - SURFACE
      ?auto_140473 - SURFACE
      ?auto_140474 - SURFACE
      ?auto_140475 - SURFACE
    )
    :vars
    (
      ?auto_140480 - HOIST
      ?auto_140479 - PLACE
      ?auto_140476 - PLACE
      ?auto_140481 - HOIST
      ?auto_140477 - SURFACE
      ?auto_140478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140480 ?auto_140479 ) ( IS-CRATE ?auto_140475 ) ( not ( = ?auto_140474 ?auto_140475 ) ) ( not ( = ?auto_140473 ?auto_140474 ) ) ( not ( = ?auto_140473 ?auto_140475 ) ) ( not ( = ?auto_140476 ?auto_140479 ) ) ( HOIST-AT ?auto_140481 ?auto_140476 ) ( not ( = ?auto_140480 ?auto_140481 ) ) ( SURFACE-AT ?auto_140475 ?auto_140476 ) ( ON ?auto_140475 ?auto_140477 ) ( CLEAR ?auto_140475 ) ( not ( = ?auto_140474 ?auto_140477 ) ) ( not ( = ?auto_140475 ?auto_140477 ) ) ( not ( = ?auto_140473 ?auto_140477 ) ) ( SURFACE-AT ?auto_140473 ?auto_140479 ) ( CLEAR ?auto_140473 ) ( IS-CRATE ?auto_140474 ) ( AVAILABLE ?auto_140480 ) ( TRUCK-AT ?auto_140478 ?auto_140476 ) ( LIFTING ?auto_140481 ?auto_140474 ) ( ON ?auto_140473 ?auto_140472 ) ( not ( = ?auto_140472 ?auto_140473 ) ) ( not ( = ?auto_140472 ?auto_140474 ) ) ( not ( = ?auto_140472 ?auto_140475 ) ) ( not ( = ?auto_140472 ?auto_140477 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140473 ?auto_140474 ?auto_140475 )
      ( MAKE-3CRATE-VERIFY ?auto_140472 ?auto_140473 ?auto_140474 ?auto_140475 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140482 - SURFACE
      ?auto_140483 - SURFACE
      ?auto_140484 - SURFACE
      ?auto_140485 - SURFACE
      ?auto_140486 - SURFACE
    )
    :vars
    (
      ?auto_140491 - HOIST
      ?auto_140490 - PLACE
      ?auto_140487 - PLACE
      ?auto_140492 - HOIST
      ?auto_140488 - SURFACE
      ?auto_140489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140491 ?auto_140490 ) ( IS-CRATE ?auto_140486 ) ( not ( = ?auto_140485 ?auto_140486 ) ) ( not ( = ?auto_140484 ?auto_140485 ) ) ( not ( = ?auto_140484 ?auto_140486 ) ) ( not ( = ?auto_140487 ?auto_140490 ) ) ( HOIST-AT ?auto_140492 ?auto_140487 ) ( not ( = ?auto_140491 ?auto_140492 ) ) ( SURFACE-AT ?auto_140486 ?auto_140487 ) ( ON ?auto_140486 ?auto_140488 ) ( CLEAR ?auto_140486 ) ( not ( = ?auto_140485 ?auto_140488 ) ) ( not ( = ?auto_140486 ?auto_140488 ) ) ( not ( = ?auto_140484 ?auto_140488 ) ) ( SURFACE-AT ?auto_140484 ?auto_140490 ) ( CLEAR ?auto_140484 ) ( IS-CRATE ?auto_140485 ) ( AVAILABLE ?auto_140491 ) ( TRUCK-AT ?auto_140489 ?auto_140487 ) ( LIFTING ?auto_140492 ?auto_140485 ) ( ON ?auto_140483 ?auto_140482 ) ( ON ?auto_140484 ?auto_140483 ) ( not ( = ?auto_140482 ?auto_140483 ) ) ( not ( = ?auto_140482 ?auto_140484 ) ) ( not ( = ?auto_140482 ?auto_140485 ) ) ( not ( = ?auto_140482 ?auto_140486 ) ) ( not ( = ?auto_140482 ?auto_140488 ) ) ( not ( = ?auto_140483 ?auto_140484 ) ) ( not ( = ?auto_140483 ?auto_140485 ) ) ( not ( = ?auto_140483 ?auto_140486 ) ) ( not ( = ?auto_140483 ?auto_140488 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140484 ?auto_140485 ?auto_140486 )
      ( MAKE-4CRATE-VERIFY ?auto_140482 ?auto_140483 ?auto_140484 ?auto_140485 ?auto_140486 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_140493 - SURFACE
      ?auto_140494 - SURFACE
    )
    :vars
    (
      ?auto_140500 - HOIST
      ?auto_140498 - PLACE
      ?auto_140499 - SURFACE
      ?auto_140495 - PLACE
      ?auto_140501 - HOIST
      ?auto_140496 - SURFACE
      ?auto_140497 - TRUCK
      ?auto_140502 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_140500 ?auto_140498 ) ( IS-CRATE ?auto_140494 ) ( not ( = ?auto_140493 ?auto_140494 ) ) ( not ( = ?auto_140499 ?auto_140493 ) ) ( not ( = ?auto_140499 ?auto_140494 ) ) ( not ( = ?auto_140495 ?auto_140498 ) ) ( HOIST-AT ?auto_140501 ?auto_140495 ) ( not ( = ?auto_140500 ?auto_140501 ) ) ( SURFACE-AT ?auto_140494 ?auto_140495 ) ( ON ?auto_140494 ?auto_140496 ) ( CLEAR ?auto_140494 ) ( not ( = ?auto_140493 ?auto_140496 ) ) ( not ( = ?auto_140494 ?auto_140496 ) ) ( not ( = ?auto_140499 ?auto_140496 ) ) ( SURFACE-AT ?auto_140499 ?auto_140498 ) ( CLEAR ?auto_140499 ) ( IS-CRATE ?auto_140493 ) ( AVAILABLE ?auto_140500 ) ( TRUCK-AT ?auto_140497 ?auto_140495 ) ( AVAILABLE ?auto_140501 ) ( SURFACE-AT ?auto_140493 ?auto_140495 ) ( ON ?auto_140493 ?auto_140502 ) ( CLEAR ?auto_140493 ) ( not ( = ?auto_140493 ?auto_140502 ) ) ( not ( = ?auto_140494 ?auto_140502 ) ) ( not ( = ?auto_140499 ?auto_140502 ) ) ( not ( = ?auto_140496 ?auto_140502 ) ) )
    :subtasks
    ( ( !LIFT ?auto_140501 ?auto_140493 ?auto_140502 ?auto_140495 )
      ( MAKE-2CRATE ?auto_140499 ?auto_140493 ?auto_140494 )
      ( MAKE-1CRATE-VERIFY ?auto_140493 ?auto_140494 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_140503 - SURFACE
      ?auto_140504 - SURFACE
      ?auto_140505 - SURFACE
    )
    :vars
    (
      ?auto_140510 - HOIST
      ?auto_140508 - PLACE
      ?auto_140511 - PLACE
      ?auto_140507 - HOIST
      ?auto_140506 - SURFACE
      ?auto_140509 - TRUCK
      ?auto_140512 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_140510 ?auto_140508 ) ( IS-CRATE ?auto_140505 ) ( not ( = ?auto_140504 ?auto_140505 ) ) ( not ( = ?auto_140503 ?auto_140504 ) ) ( not ( = ?auto_140503 ?auto_140505 ) ) ( not ( = ?auto_140511 ?auto_140508 ) ) ( HOIST-AT ?auto_140507 ?auto_140511 ) ( not ( = ?auto_140510 ?auto_140507 ) ) ( SURFACE-AT ?auto_140505 ?auto_140511 ) ( ON ?auto_140505 ?auto_140506 ) ( CLEAR ?auto_140505 ) ( not ( = ?auto_140504 ?auto_140506 ) ) ( not ( = ?auto_140505 ?auto_140506 ) ) ( not ( = ?auto_140503 ?auto_140506 ) ) ( SURFACE-AT ?auto_140503 ?auto_140508 ) ( CLEAR ?auto_140503 ) ( IS-CRATE ?auto_140504 ) ( AVAILABLE ?auto_140510 ) ( TRUCK-AT ?auto_140509 ?auto_140511 ) ( AVAILABLE ?auto_140507 ) ( SURFACE-AT ?auto_140504 ?auto_140511 ) ( ON ?auto_140504 ?auto_140512 ) ( CLEAR ?auto_140504 ) ( not ( = ?auto_140504 ?auto_140512 ) ) ( not ( = ?auto_140505 ?auto_140512 ) ) ( not ( = ?auto_140503 ?auto_140512 ) ) ( not ( = ?auto_140506 ?auto_140512 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_140504 ?auto_140505 )
      ( MAKE-2CRATE-VERIFY ?auto_140503 ?auto_140504 ?auto_140505 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_140513 - SURFACE
      ?auto_140514 - SURFACE
      ?auto_140515 - SURFACE
      ?auto_140516 - SURFACE
    )
    :vars
    (
      ?auto_140517 - HOIST
      ?auto_140519 - PLACE
      ?auto_140520 - PLACE
      ?auto_140518 - HOIST
      ?auto_140523 - SURFACE
      ?auto_140522 - TRUCK
      ?auto_140521 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_140517 ?auto_140519 ) ( IS-CRATE ?auto_140516 ) ( not ( = ?auto_140515 ?auto_140516 ) ) ( not ( = ?auto_140514 ?auto_140515 ) ) ( not ( = ?auto_140514 ?auto_140516 ) ) ( not ( = ?auto_140520 ?auto_140519 ) ) ( HOIST-AT ?auto_140518 ?auto_140520 ) ( not ( = ?auto_140517 ?auto_140518 ) ) ( SURFACE-AT ?auto_140516 ?auto_140520 ) ( ON ?auto_140516 ?auto_140523 ) ( CLEAR ?auto_140516 ) ( not ( = ?auto_140515 ?auto_140523 ) ) ( not ( = ?auto_140516 ?auto_140523 ) ) ( not ( = ?auto_140514 ?auto_140523 ) ) ( SURFACE-AT ?auto_140514 ?auto_140519 ) ( CLEAR ?auto_140514 ) ( IS-CRATE ?auto_140515 ) ( AVAILABLE ?auto_140517 ) ( TRUCK-AT ?auto_140522 ?auto_140520 ) ( AVAILABLE ?auto_140518 ) ( SURFACE-AT ?auto_140515 ?auto_140520 ) ( ON ?auto_140515 ?auto_140521 ) ( CLEAR ?auto_140515 ) ( not ( = ?auto_140515 ?auto_140521 ) ) ( not ( = ?auto_140516 ?auto_140521 ) ) ( not ( = ?auto_140514 ?auto_140521 ) ) ( not ( = ?auto_140523 ?auto_140521 ) ) ( ON ?auto_140514 ?auto_140513 ) ( not ( = ?auto_140513 ?auto_140514 ) ) ( not ( = ?auto_140513 ?auto_140515 ) ) ( not ( = ?auto_140513 ?auto_140516 ) ) ( not ( = ?auto_140513 ?auto_140523 ) ) ( not ( = ?auto_140513 ?auto_140521 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140514 ?auto_140515 ?auto_140516 )
      ( MAKE-3CRATE-VERIFY ?auto_140513 ?auto_140514 ?auto_140515 ?auto_140516 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140524 - SURFACE
      ?auto_140525 - SURFACE
      ?auto_140526 - SURFACE
      ?auto_140527 - SURFACE
      ?auto_140528 - SURFACE
    )
    :vars
    (
      ?auto_140529 - HOIST
      ?auto_140531 - PLACE
      ?auto_140532 - PLACE
      ?auto_140530 - HOIST
      ?auto_140535 - SURFACE
      ?auto_140534 - TRUCK
      ?auto_140533 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_140529 ?auto_140531 ) ( IS-CRATE ?auto_140528 ) ( not ( = ?auto_140527 ?auto_140528 ) ) ( not ( = ?auto_140526 ?auto_140527 ) ) ( not ( = ?auto_140526 ?auto_140528 ) ) ( not ( = ?auto_140532 ?auto_140531 ) ) ( HOIST-AT ?auto_140530 ?auto_140532 ) ( not ( = ?auto_140529 ?auto_140530 ) ) ( SURFACE-AT ?auto_140528 ?auto_140532 ) ( ON ?auto_140528 ?auto_140535 ) ( CLEAR ?auto_140528 ) ( not ( = ?auto_140527 ?auto_140535 ) ) ( not ( = ?auto_140528 ?auto_140535 ) ) ( not ( = ?auto_140526 ?auto_140535 ) ) ( SURFACE-AT ?auto_140526 ?auto_140531 ) ( CLEAR ?auto_140526 ) ( IS-CRATE ?auto_140527 ) ( AVAILABLE ?auto_140529 ) ( TRUCK-AT ?auto_140534 ?auto_140532 ) ( AVAILABLE ?auto_140530 ) ( SURFACE-AT ?auto_140527 ?auto_140532 ) ( ON ?auto_140527 ?auto_140533 ) ( CLEAR ?auto_140527 ) ( not ( = ?auto_140527 ?auto_140533 ) ) ( not ( = ?auto_140528 ?auto_140533 ) ) ( not ( = ?auto_140526 ?auto_140533 ) ) ( not ( = ?auto_140535 ?auto_140533 ) ) ( ON ?auto_140525 ?auto_140524 ) ( ON ?auto_140526 ?auto_140525 ) ( not ( = ?auto_140524 ?auto_140525 ) ) ( not ( = ?auto_140524 ?auto_140526 ) ) ( not ( = ?auto_140524 ?auto_140527 ) ) ( not ( = ?auto_140524 ?auto_140528 ) ) ( not ( = ?auto_140524 ?auto_140535 ) ) ( not ( = ?auto_140524 ?auto_140533 ) ) ( not ( = ?auto_140525 ?auto_140526 ) ) ( not ( = ?auto_140525 ?auto_140527 ) ) ( not ( = ?auto_140525 ?auto_140528 ) ) ( not ( = ?auto_140525 ?auto_140535 ) ) ( not ( = ?auto_140525 ?auto_140533 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140526 ?auto_140527 ?auto_140528 )
      ( MAKE-4CRATE-VERIFY ?auto_140524 ?auto_140525 ?auto_140526 ?auto_140527 ?auto_140528 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_140536 - SURFACE
      ?auto_140537 - SURFACE
    )
    :vars
    (
      ?auto_140538 - HOIST
      ?auto_140540 - PLACE
      ?auto_140545 - SURFACE
      ?auto_140541 - PLACE
      ?auto_140539 - HOIST
      ?auto_140544 - SURFACE
      ?auto_140542 - SURFACE
      ?auto_140543 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140538 ?auto_140540 ) ( IS-CRATE ?auto_140537 ) ( not ( = ?auto_140536 ?auto_140537 ) ) ( not ( = ?auto_140545 ?auto_140536 ) ) ( not ( = ?auto_140545 ?auto_140537 ) ) ( not ( = ?auto_140541 ?auto_140540 ) ) ( HOIST-AT ?auto_140539 ?auto_140541 ) ( not ( = ?auto_140538 ?auto_140539 ) ) ( SURFACE-AT ?auto_140537 ?auto_140541 ) ( ON ?auto_140537 ?auto_140544 ) ( CLEAR ?auto_140537 ) ( not ( = ?auto_140536 ?auto_140544 ) ) ( not ( = ?auto_140537 ?auto_140544 ) ) ( not ( = ?auto_140545 ?auto_140544 ) ) ( SURFACE-AT ?auto_140545 ?auto_140540 ) ( CLEAR ?auto_140545 ) ( IS-CRATE ?auto_140536 ) ( AVAILABLE ?auto_140538 ) ( AVAILABLE ?auto_140539 ) ( SURFACE-AT ?auto_140536 ?auto_140541 ) ( ON ?auto_140536 ?auto_140542 ) ( CLEAR ?auto_140536 ) ( not ( = ?auto_140536 ?auto_140542 ) ) ( not ( = ?auto_140537 ?auto_140542 ) ) ( not ( = ?auto_140545 ?auto_140542 ) ) ( not ( = ?auto_140544 ?auto_140542 ) ) ( TRUCK-AT ?auto_140543 ?auto_140540 ) )
    :subtasks
    ( ( !DRIVE ?auto_140543 ?auto_140540 ?auto_140541 )
      ( MAKE-2CRATE ?auto_140545 ?auto_140536 ?auto_140537 )
      ( MAKE-1CRATE-VERIFY ?auto_140536 ?auto_140537 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_140546 - SURFACE
      ?auto_140547 - SURFACE
      ?auto_140548 - SURFACE
    )
    :vars
    (
      ?auto_140553 - HOIST
      ?auto_140554 - PLACE
      ?auto_140555 - PLACE
      ?auto_140549 - HOIST
      ?auto_140552 - SURFACE
      ?auto_140551 - SURFACE
      ?auto_140550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140553 ?auto_140554 ) ( IS-CRATE ?auto_140548 ) ( not ( = ?auto_140547 ?auto_140548 ) ) ( not ( = ?auto_140546 ?auto_140547 ) ) ( not ( = ?auto_140546 ?auto_140548 ) ) ( not ( = ?auto_140555 ?auto_140554 ) ) ( HOIST-AT ?auto_140549 ?auto_140555 ) ( not ( = ?auto_140553 ?auto_140549 ) ) ( SURFACE-AT ?auto_140548 ?auto_140555 ) ( ON ?auto_140548 ?auto_140552 ) ( CLEAR ?auto_140548 ) ( not ( = ?auto_140547 ?auto_140552 ) ) ( not ( = ?auto_140548 ?auto_140552 ) ) ( not ( = ?auto_140546 ?auto_140552 ) ) ( SURFACE-AT ?auto_140546 ?auto_140554 ) ( CLEAR ?auto_140546 ) ( IS-CRATE ?auto_140547 ) ( AVAILABLE ?auto_140553 ) ( AVAILABLE ?auto_140549 ) ( SURFACE-AT ?auto_140547 ?auto_140555 ) ( ON ?auto_140547 ?auto_140551 ) ( CLEAR ?auto_140547 ) ( not ( = ?auto_140547 ?auto_140551 ) ) ( not ( = ?auto_140548 ?auto_140551 ) ) ( not ( = ?auto_140546 ?auto_140551 ) ) ( not ( = ?auto_140552 ?auto_140551 ) ) ( TRUCK-AT ?auto_140550 ?auto_140554 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_140547 ?auto_140548 )
      ( MAKE-2CRATE-VERIFY ?auto_140546 ?auto_140547 ?auto_140548 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_140556 - SURFACE
      ?auto_140557 - SURFACE
      ?auto_140558 - SURFACE
      ?auto_140559 - SURFACE
    )
    :vars
    (
      ?auto_140560 - HOIST
      ?auto_140563 - PLACE
      ?auto_140565 - PLACE
      ?auto_140566 - HOIST
      ?auto_140561 - SURFACE
      ?auto_140564 - SURFACE
      ?auto_140562 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140560 ?auto_140563 ) ( IS-CRATE ?auto_140559 ) ( not ( = ?auto_140558 ?auto_140559 ) ) ( not ( = ?auto_140557 ?auto_140558 ) ) ( not ( = ?auto_140557 ?auto_140559 ) ) ( not ( = ?auto_140565 ?auto_140563 ) ) ( HOIST-AT ?auto_140566 ?auto_140565 ) ( not ( = ?auto_140560 ?auto_140566 ) ) ( SURFACE-AT ?auto_140559 ?auto_140565 ) ( ON ?auto_140559 ?auto_140561 ) ( CLEAR ?auto_140559 ) ( not ( = ?auto_140558 ?auto_140561 ) ) ( not ( = ?auto_140559 ?auto_140561 ) ) ( not ( = ?auto_140557 ?auto_140561 ) ) ( SURFACE-AT ?auto_140557 ?auto_140563 ) ( CLEAR ?auto_140557 ) ( IS-CRATE ?auto_140558 ) ( AVAILABLE ?auto_140560 ) ( AVAILABLE ?auto_140566 ) ( SURFACE-AT ?auto_140558 ?auto_140565 ) ( ON ?auto_140558 ?auto_140564 ) ( CLEAR ?auto_140558 ) ( not ( = ?auto_140558 ?auto_140564 ) ) ( not ( = ?auto_140559 ?auto_140564 ) ) ( not ( = ?auto_140557 ?auto_140564 ) ) ( not ( = ?auto_140561 ?auto_140564 ) ) ( TRUCK-AT ?auto_140562 ?auto_140563 ) ( ON ?auto_140557 ?auto_140556 ) ( not ( = ?auto_140556 ?auto_140557 ) ) ( not ( = ?auto_140556 ?auto_140558 ) ) ( not ( = ?auto_140556 ?auto_140559 ) ) ( not ( = ?auto_140556 ?auto_140561 ) ) ( not ( = ?auto_140556 ?auto_140564 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140557 ?auto_140558 ?auto_140559 )
      ( MAKE-3CRATE-VERIFY ?auto_140556 ?auto_140557 ?auto_140558 ?auto_140559 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140567 - SURFACE
      ?auto_140568 - SURFACE
      ?auto_140569 - SURFACE
      ?auto_140570 - SURFACE
      ?auto_140571 - SURFACE
    )
    :vars
    (
      ?auto_140572 - HOIST
      ?auto_140575 - PLACE
      ?auto_140577 - PLACE
      ?auto_140578 - HOIST
      ?auto_140573 - SURFACE
      ?auto_140576 - SURFACE
      ?auto_140574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140572 ?auto_140575 ) ( IS-CRATE ?auto_140571 ) ( not ( = ?auto_140570 ?auto_140571 ) ) ( not ( = ?auto_140569 ?auto_140570 ) ) ( not ( = ?auto_140569 ?auto_140571 ) ) ( not ( = ?auto_140577 ?auto_140575 ) ) ( HOIST-AT ?auto_140578 ?auto_140577 ) ( not ( = ?auto_140572 ?auto_140578 ) ) ( SURFACE-AT ?auto_140571 ?auto_140577 ) ( ON ?auto_140571 ?auto_140573 ) ( CLEAR ?auto_140571 ) ( not ( = ?auto_140570 ?auto_140573 ) ) ( not ( = ?auto_140571 ?auto_140573 ) ) ( not ( = ?auto_140569 ?auto_140573 ) ) ( SURFACE-AT ?auto_140569 ?auto_140575 ) ( CLEAR ?auto_140569 ) ( IS-CRATE ?auto_140570 ) ( AVAILABLE ?auto_140572 ) ( AVAILABLE ?auto_140578 ) ( SURFACE-AT ?auto_140570 ?auto_140577 ) ( ON ?auto_140570 ?auto_140576 ) ( CLEAR ?auto_140570 ) ( not ( = ?auto_140570 ?auto_140576 ) ) ( not ( = ?auto_140571 ?auto_140576 ) ) ( not ( = ?auto_140569 ?auto_140576 ) ) ( not ( = ?auto_140573 ?auto_140576 ) ) ( TRUCK-AT ?auto_140574 ?auto_140575 ) ( ON ?auto_140568 ?auto_140567 ) ( ON ?auto_140569 ?auto_140568 ) ( not ( = ?auto_140567 ?auto_140568 ) ) ( not ( = ?auto_140567 ?auto_140569 ) ) ( not ( = ?auto_140567 ?auto_140570 ) ) ( not ( = ?auto_140567 ?auto_140571 ) ) ( not ( = ?auto_140567 ?auto_140573 ) ) ( not ( = ?auto_140567 ?auto_140576 ) ) ( not ( = ?auto_140568 ?auto_140569 ) ) ( not ( = ?auto_140568 ?auto_140570 ) ) ( not ( = ?auto_140568 ?auto_140571 ) ) ( not ( = ?auto_140568 ?auto_140573 ) ) ( not ( = ?auto_140568 ?auto_140576 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140569 ?auto_140570 ?auto_140571 )
      ( MAKE-4CRATE-VERIFY ?auto_140567 ?auto_140568 ?auto_140569 ?auto_140570 ?auto_140571 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_140579 - SURFACE
      ?auto_140580 - SURFACE
    )
    :vars
    (
      ?auto_140582 - HOIST
      ?auto_140585 - PLACE
      ?auto_140581 - SURFACE
      ?auto_140587 - PLACE
      ?auto_140588 - HOIST
      ?auto_140583 - SURFACE
      ?auto_140586 - SURFACE
      ?auto_140584 - TRUCK
      ?auto_140589 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_140582 ?auto_140585 ) ( IS-CRATE ?auto_140580 ) ( not ( = ?auto_140579 ?auto_140580 ) ) ( not ( = ?auto_140581 ?auto_140579 ) ) ( not ( = ?auto_140581 ?auto_140580 ) ) ( not ( = ?auto_140587 ?auto_140585 ) ) ( HOIST-AT ?auto_140588 ?auto_140587 ) ( not ( = ?auto_140582 ?auto_140588 ) ) ( SURFACE-AT ?auto_140580 ?auto_140587 ) ( ON ?auto_140580 ?auto_140583 ) ( CLEAR ?auto_140580 ) ( not ( = ?auto_140579 ?auto_140583 ) ) ( not ( = ?auto_140580 ?auto_140583 ) ) ( not ( = ?auto_140581 ?auto_140583 ) ) ( IS-CRATE ?auto_140579 ) ( AVAILABLE ?auto_140588 ) ( SURFACE-AT ?auto_140579 ?auto_140587 ) ( ON ?auto_140579 ?auto_140586 ) ( CLEAR ?auto_140579 ) ( not ( = ?auto_140579 ?auto_140586 ) ) ( not ( = ?auto_140580 ?auto_140586 ) ) ( not ( = ?auto_140581 ?auto_140586 ) ) ( not ( = ?auto_140583 ?auto_140586 ) ) ( TRUCK-AT ?auto_140584 ?auto_140585 ) ( SURFACE-AT ?auto_140589 ?auto_140585 ) ( CLEAR ?auto_140589 ) ( LIFTING ?auto_140582 ?auto_140581 ) ( IS-CRATE ?auto_140581 ) ( not ( = ?auto_140589 ?auto_140581 ) ) ( not ( = ?auto_140579 ?auto_140589 ) ) ( not ( = ?auto_140580 ?auto_140589 ) ) ( not ( = ?auto_140583 ?auto_140589 ) ) ( not ( = ?auto_140586 ?auto_140589 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_140589 ?auto_140581 )
      ( MAKE-2CRATE ?auto_140581 ?auto_140579 ?auto_140580 )
      ( MAKE-1CRATE-VERIFY ?auto_140579 ?auto_140580 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_140590 - SURFACE
      ?auto_140591 - SURFACE
      ?auto_140592 - SURFACE
    )
    :vars
    (
      ?auto_140600 - HOIST
      ?auto_140597 - PLACE
      ?auto_140599 - PLACE
      ?auto_140593 - HOIST
      ?auto_140596 - SURFACE
      ?auto_140595 - SURFACE
      ?auto_140598 - TRUCK
      ?auto_140594 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_140600 ?auto_140597 ) ( IS-CRATE ?auto_140592 ) ( not ( = ?auto_140591 ?auto_140592 ) ) ( not ( = ?auto_140590 ?auto_140591 ) ) ( not ( = ?auto_140590 ?auto_140592 ) ) ( not ( = ?auto_140599 ?auto_140597 ) ) ( HOIST-AT ?auto_140593 ?auto_140599 ) ( not ( = ?auto_140600 ?auto_140593 ) ) ( SURFACE-AT ?auto_140592 ?auto_140599 ) ( ON ?auto_140592 ?auto_140596 ) ( CLEAR ?auto_140592 ) ( not ( = ?auto_140591 ?auto_140596 ) ) ( not ( = ?auto_140592 ?auto_140596 ) ) ( not ( = ?auto_140590 ?auto_140596 ) ) ( IS-CRATE ?auto_140591 ) ( AVAILABLE ?auto_140593 ) ( SURFACE-AT ?auto_140591 ?auto_140599 ) ( ON ?auto_140591 ?auto_140595 ) ( CLEAR ?auto_140591 ) ( not ( = ?auto_140591 ?auto_140595 ) ) ( not ( = ?auto_140592 ?auto_140595 ) ) ( not ( = ?auto_140590 ?auto_140595 ) ) ( not ( = ?auto_140596 ?auto_140595 ) ) ( TRUCK-AT ?auto_140598 ?auto_140597 ) ( SURFACE-AT ?auto_140594 ?auto_140597 ) ( CLEAR ?auto_140594 ) ( LIFTING ?auto_140600 ?auto_140590 ) ( IS-CRATE ?auto_140590 ) ( not ( = ?auto_140594 ?auto_140590 ) ) ( not ( = ?auto_140591 ?auto_140594 ) ) ( not ( = ?auto_140592 ?auto_140594 ) ) ( not ( = ?auto_140596 ?auto_140594 ) ) ( not ( = ?auto_140595 ?auto_140594 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_140591 ?auto_140592 )
      ( MAKE-2CRATE-VERIFY ?auto_140590 ?auto_140591 ?auto_140592 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_140601 - SURFACE
      ?auto_140602 - SURFACE
      ?auto_140603 - SURFACE
      ?auto_140604 - SURFACE
    )
    :vars
    (
      ?auto_140606 - HOIST
      ?auto_140611 - PLACE
      ?auto_140605 - PLACE
      ?auto_140610 - HOIST
      ?auto_140609 - SURFACE
      ?auto_140608 - SURFACE
      ?auto_140607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140606 ?auto_140611 ) ( IS-CRATE ?auto_140604 ) ( not ( = ?auto_140603 ?auto_140604 ) ) ( not ( = ?auto_140602 ?auto_140603 ) ) ( not ( = ?auto_140602 ?auto_140604 ) ) ( not ( = ?auto_140605 ?auto_140611 ) ) ( HOIST-AT ?auto_140610 ?auto_140605 ) ( not ( = ?auto_140606 ?auto_140610 ) ) ( SURFACE-AT ?auto_140604 ?auto_140605 ) ( ON ?auto_140604 ?auto_140609 ) ( CLEAR ?auto_140604 ) ( not ( = ?auto_140603 ?auto_140609 ) ) ( not ( = ?auto_140604 ?auto_140609 ) ) ( not ( = ?auto_140602 ?auto_140609 ) ) ( IS-CRATE ?auto_140603 ) ( AVAILABLE ?auto_140610 ) ( SURFACE-AT ?auto_140603 ?auto_140605 ) ( ON ?auto_140603 ?auto_140608 ) ( CLEAR ?auto_140603 ) ( not ( = ?auto_140603 ?auto_140608 ) ) ( not ( = ?auto_140604 ?auto_140608 ) ) ( not ( = ?auto_140602 ?auto_140608 ) ) ( not ( = ?auto_140609 ?auto_140608 ) ) ( TRUCK-AT ?auto_140607 ?auto_140611 ) ( SURFACE-AT ?auto_140601 ?auto_140611 ) ( CLEAR ?auto_140601 ) ( LIFTING ?auto_140606 ?auto_140602 ) ( IS-CRATE ?auto_140602 ) ( not ( = ?auto_140601 ?auto_140602 ) ) ( not ( = ?auto_140603 ?auto_140601 ) ) ( not ( = ?auto_140604 ?auto_140601 ) ) ( not ( = ?auto_140609 ?auto_140601 ) ) ( not ( = ?auto_140608 ?auto_140601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140602 ?auto_140603 ?auto_140604 )
      ( MAKE-3CRATE-VERIFY ?auto_140601 ?auto_140602 ?auto_140603 ?auto_140604 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_140612 - SURFACE
      ?auto_140613 - SURFACE
      ?auto_140614 - SURFACE
      ?auto_140615 - SURFACE
      ?auto_140616 - SURFACE
    )
    :vars
    (
      ?auto_140618 - HOIST
      ?auto_140623 - PLACE
      ?auto_140617 - PLACE
      ?auto_140622 - HOIST
      ?auto_140621 - SURFACE
      ?auto_140620 - SURFACE
      ?auto_140619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_140618 ?auto_140623 ) ( IS-CRATE ?auto_140616 ) ( not ( = ?auto_140615 ?auto_140616 ) ) ( not ( = ?auto_140614 ?auto_140615 ) ) ( not ( = ?auto_140614 ?auto_140616 ) ) ( not ( = ?auto_140617 ?auto_140623 ) ) ( HOIST-AT ?auto_140622 ?auto_140617 ) ( not ( = ?auto_140618 ?auto_140622 ) ) ( SURFACE-AT ?auto_140616 ?auto_140617 ) ( ON ?auto_140616 ?auto_140621 ) ( CLEAR ?auto_140616 ) ( not ( = ?auto_140615 ?auto_140621 ) ) ( not ( = ?auto_140616 ?auto_140621 ) ) ( not ( = ?auto_140614 ?auto_140621 ) ) ( IS-CRATE ?auto_140615 ) ( AVAILABLE ?auto_140622 ) ( SURFACE-AT ?auto_140615 ?auto_140617 ) ( ON ?auto_140615 ?auto_140620 ) ( CLEAR ?auto_140615 ) ( not ( = ?auto_140615 ?auto_140620 ) ) ( not ( = ?auto_140616 ?auto_140620 ) ) ( not ( = ?auto_140614 ?auto_140620 ) ) ( not ( = ?auto_140621 ?auto_140620 ) ) ( TRUCK-AT ?auto_140619 ?auto_140623 ) ( SURFACE-AT ?auto_140613 ?auto_140623 ) ( CLEAR ?auto_140613 ) ( LIFTING ?auto_140618 ?auto_140614 ) ( IS-CRATE ?auto_140614 ) ( not ( = ?auto_140613 ?auto_140614 ) ) ( not ( = ?auto_140615 ?auto_140613 ) ) ( not ( = ?auto_140616 ?auto_140613 ) ) ( not ( = ?auto_140621 ?auto_140613 ) ) ( not ( = ?auto_140620 ?auto_140613 ) ) ( ON ?auto_140613 ?auto_140612 ) ( not ( = ?auto_140612 ?auto_140613 ) ) ( not ( = ?auto_140612 ?auto_140614 ) ) ( not ( = ?auto_140612 ?auto_140615 ) ) ( not ( = ?auto_140612 ?auto_140616 ) ) ( not ( = ?auto_140612 ?auto_140621 ) ) ( not ( = ?auto_140612 ?auto_140620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_140614 ?auto_140615 ?auto_140616 )
      ( MAKE-4CRATE-VERIFY ?auto_140612 ?auto_140613 ?auto_140614 ?auto_140615 ?auto_140616 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_141059 - SURFACE
      ?auto_141060 - SURFACE
      ?auto_141061 - SURFACE
      ?auto_141062 - SURFACE
      ?auto_141063 - SURFACE
      ?auto_141064 - SURFACE
    )
    :vars
    (
      ?auto_141066 - HOIST
      ?auto_141065 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_141066 ?auto_141065 ) ( SURFACE-AT ?auto_141063 ?auto_141065 ) ( CLEAR ?auto_141063 ) ( LIFTING ?auto_141066 ?auto_141064 ) ( IS-CRATE ?auto_141064 ) ( not ( = ?auto_141063 ?auto_141064 ) ) ( ON ?auto_141060 ?auto_141059 ) ( ON ?auto_141061 ?auto_141060 ) ( ON ?auto_141062 ?auto_141061 ) ( ON ?auto_141063 ?auto_141062 ) ( not ( = ?auto_141059 ?auto_141060 ) ) ( not ( = ?auto_141059 ?auto_141061 ) ) ( not ( = ?auto_141059 ?auto_141062 ) ) ( not ( = ?auto_141059 ?auto_141063 ) ) ( not ( = ?auto_141059 ?auto_141064 ) ) ( not ( = ?auto_141060 ?auto_141061 ) ) ( not ( = ?auto_141060 ?auto_141062 ) ) ( not ( = ?auto_141060 ?auto_141063 ) ) ( not ( = ?auto_141060 ?auto_141064 ) ) ( not ( = ?auto_141061 ?auto_141062 ) ) ( not ( = ?auto_141061 ?auto_141063 ) ) ( not ( = ?auto_141061 ?auto_141064 ) ) ( not ( = ?auto_141062 ?auto_141063 ) ) ( not ( = ?auto_141062 ?auto_141064 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_141063 ?auto_141064 )
      ( MAKE-5CRATE-VERIFY ?auto_141059 ?auto_141060 ?auto_141061 ?auto_141062 ?auto_141063 ?auto_141064 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_141093 - SURFACE
      ?auto_141094 - SURFACE
      ?auto_141095 - SURFACE
      ?auto_141096 - SURFACE
      ?auto_141097 - SURFACE
      ?auto_141098 - SURFACE
    )
    :vars
    (
      ?auto_141101 - HOIST
      ?auto_141100 - PLACE
      ?auto_141099 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_141101 ?auto_141100 ) ( SURFACE-AT ?auto_141097 ?auto_141100 ) ( CLEAR ?auto_141097 ) ( IS-CRATE ?auto_141098 ) ( not ( = ?auto_141097 ?auto_141098 ) ) ( TRUCK-AT ?auto_141099 ?auto_141100 ) ( AVAILABLE ?auto_141101 ) ( IN ?auto_141098 ?auto_141099 ) ( ON ?auto_141097 ?auto_141096 ) ( not ( = ?auto_141096 ?auto_141097 ) ) ( not ( = ?auto_141096 ?auto_141098 ) ) ( ON ?auto_141094 ?auto_141093 ) ( ON ?auto_141095 ?auto_141094 ) ( ON ?auto_141096 ?auto_141095 ) ( not ( = ?auto_141093 ?auto_141094 ) ) ( not ( = ?auto_141093 ?auto_141095 ) ) ( not ( = ?auto_141093 ?auto_141096 ) ) ( not ( = ?auto_141093 ?auto_141097 ) ) ( not ( = ?auto_141093 ?auto_141098 ) ) ( not ( = ?auto_141094 ?auto_141095 ) ) ( not ( = ?auto_141094 ?auto_141096 ) ) ( not ( = ?auto_141094 ?auto_141097 ) ) ( not ( = ?auto_141094 ?auto_141098 ) ) ( not ( = ?auto_141095 ?auto_141096 ) ) ( not ( = ?auto_141095 ?auto_141097 ) ) ( not ( = ?auto_141095 ?auto_141098 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_141096 ?auto_141097 ?auto_141098 )
      ( MAKE-5CRATE-VERIFY ?auto_141093 ?auto_141094 ?auto_141095 ?auto_141096 ?auto_141097 ?auto_141098 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_141133 - SURFACE
      ?auto_141134 - SURFACE
      ?auto_141135 - SURFACE
      ?auto_141136 - SURFACE
      ?auto_141137 - SURFACE
      ?auto_141138 - SURFACE
    )
    :vars
    (
      ?auto_141142 - HOIST
      ?auto_141139 - PLACE
      ?auto_141141 - TRUCK
      ?auto_141140 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_141142 ?auto_141139 ) ( SURFACE-AT ?auto_141137 ?auto_141139 ) ( CLEAR ?auto_141137 ) ( IS-CRATE ?auto_141138 ) ( not ( = ?auto_141137 ?auto_141138 ) ) ( AVAILABLE ?auto_141142 ) ( IN ?auto_141138 ?auto_141141 ) ( ON ?auto_141137 ?auto_141136 ) ( not ( = ?auto_141136 ?auto_141137 ) ) ( not ( = ?auto_141136 ?auto_141138 ) ) ( TRUCK-AT ?auto_141141 ?auto_141140 ) ( not ( = ?auto_141140 ?auto_141139 ) ) ( ON ?auto_141134 ?auto_141133 ) ( ON ?auto_141135 ?auto_141134 ) ( ON ?auto_141136 ?auto_141135 ) ( not ( = ?auto_141133 ?auto_141134 ) ) ( not ( = ?auto_141133 ?auto_141135 ) ) ( not ( = ?auto_141133 ?auto_141136 ) ) ( not ( = ?auto_141133 ?auto_141137 ) ) ( not ( = ?auto_141133 ?auto_141138 ) ) ( not ( = ?auto_141134 ?auto_141135 ) ) ( not ( = ?auto_141134 ?auto_141136 ) ) ( not ( = ?auto_141134 ?auto_141137 ) ) ( not ( = ?auto_141134 ?auto_141138 ) ) ( not ( = ?auto_141135 ?auto_141136 ) ) ( not ( = ?auto_141135 ?auto_141137 ) ) ( not ( = ?auto_141135 ?auto_141138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_141136 ?auto_141137 ?auto_141138 )
      ( MAKE-5CRATE-VERIFY ?auto_141133 ?auto_141134 ?auto_141135 ?auto_141136 ?auto_141137 ?auto_141138 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_141178 - SURFACE
      ?auto_141179 - SURFACE
      ?auto_141180 - SURFACE
      ?auto_141181 - SURFACE
      ?auto_141182 - SURFACE
      ?auto_141183 - SURFACE
    )
    :vars
    (
      ?auto_141186 - HOIST
      ?auto_141188 - PLACE
      ?auto_141184 - TRUCK
      ?auto_141187 - PLACE
      ?auto_141185 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_141186 ?auto_141188 ) ( SURFACE-AT ?auto_141182 ?auto_141188 ) ( CLEAR ?auto_141182 ) ( IS-CRATE ?auto_141183 ) ( not ( = ?auto_141182 ?auto_141183 ) ) ( AVAILABLE ?auto_141186 ) ( ON ?auto_141182 ?auto_141181 ) ( not ( = ?auto_141181 ?auto_141182 ) ) ( not ( = ?auto_141181 ?auto_141183 ) ) ( TRUCK-AT ?auto_141184 ?auto_141187 ) ( not ( = ?auto_141187 ?auto_141188 ) ) ( HOIST-AT ?auto_141185 ?auto_141187 ) ( LIFTING ?auto_141185 ?auto_141183 ) ( not ( = ?auto_141186 ?auto_141185 ) ) ( ON ?auto_141179 ?auto_141178 ) ( ON ?auto_141180 ?auto_141179 ) ( ON ?auto_141181 ?auto_141180 ) ( not ( = ?auto_141178 ?auto_141179 ) ) ( not ( = ?auto_141178 ?auto_141180 ) ) ( not ( = ?auto_141178 ?auto_141181 ) ) ( not ( = ?auto_141178 ?auto_141182 ) ) ( not ( = ?auto_141178 ?auto_141183 ) ) ( not ( = ?auto_141179 ?auto_141180 ) ) ( not ( = ?auto_141179 ?auto_141181 ) ) ( not ( = ?auto_141179 ?auto_141182 ) ) ( not ( = ?auto_141179 ?auto_141183 ) ) ( not ( = ?auto_141180 ?auto_141181 ) ) ( not ( = ?auto_141180 ?auto_141182 ) ) ( not ( = ?auto_141180 ?auto_141183 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_141181 ?auto_141182 ?auto_141183 )
      ( MAKE-5CRATE-VERIFY ?auto_141178 ?auto_141179 ?auto_141180 ?auto_141181 ?auto_141182 ?auto_141183 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_141228 - SURFACE
      ?auto_141229 - SURFACE
      ?auto_141230 - SURFACE
      ?auto_141231 - SURFACE
      ?auto_141232 - SURFACE
      ?auto_141233 - SURFACE
    )
    :vars
    (
      ?auto_141238 - HOIST
      ?auto_141236 - PLACE
      ?auto_141237 - TRUCK
      ?auto_141235 - PLACE
      ?auto_141234 - HOIST
      ?auto_141239 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_141238 ?auto_141236 ) ( SURFACE-AT ?auto_141232 ?auto_141236 ) ( CLEAR ?auto_141232 ) ( IS-CRATE ?auto_141233 ) ( not ( = ?auto_141232 ?auto_141233 ) ) ( AVAILABLE ?auto_141238 ) ( ON ?auto_141232 ?auto_141231 ) ( not ( = ?auto_141231 ?auto_141232 ) ) ( not ( = ?auto_141231 ?auto_141233 ) ) ( TRUCK-AT ?auto_141237 ?auto_141235 ) ( not ( = ?auto_141235 ?auto_141236 ) ) ( HOIST-AT ?auto_141234 ?auto_141235 ) ( not ( = ?auto_141238 ?auto_141234 ) ) ( AVAILABLE ?auto_141234 ) ( SURFACE-AT ?auto_141233 ?auto_141235 ) ( ON ?auto_141233 ?auto_141239 ) ( CLEAR ?auto_141233 ) ( not ( = ?auto_141232 ?auto_141239 ) ) ( not ( = ?auto_141233 ?auto_141239 ) ) ( not ( = ?auto_141231 ?auto_141239 ) ) ( ON ?auto_141229 ?auto_141228 ) ( ON ?auto_141230 ?auto_141229 ) ( ON ?auto_141231 ?auto_141230 ) ( not ( = ?auto_141228 ?auto_141229 ) ) ( not ( = ?auto_141228 ?auto_141230 ) ) ( not ( = ?auto_141228 ?auto_141231 ) ) ( not ( = ?auto_141228 ?auto_141232 ) ) ( not ( = ?auto_141228 ?auto_141233 ) ) ( not ( = ?auto_141228 ?auto_141239 ) ) ( not ( = ?auto_141229 ?auto_141230 ) ) ( not ( = ?auto_141229 ?auto_141231 ) ) ( not ( = ?auto_141229 ?auto_141232 ) ) ( not ( = ?auto_141229 ?auto_141233 ) ) ( not ( = ?auto_141229 ?auto_141239 ) ) ( not ( = ?auto_141230 ?auto_141231 ) ) ( not ( = ?auto_141230 ?auto_141232 ) ) ( not ( = ?auto_141230 ?auto_141233 ) ) ( not ( = ?auto_141230 ?auto_141239 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_141231 ?auto_141232 ?auto_141233 )
      ( MAKE-5CRATE-VERIFY ?auto_141228 ?auto_141229 ?auto_141230 ?auto_141231 ?auto_141232 ?auto_141233 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_141279 - SURFACE
      ?auto_141280 - SURFACE
      ?auto_141281 - SURFACE
      ?auto_141282 - SURFACE
      ?auto_141283 - SURFACE
      ?auto_141284 - SURFACE
    )
    :vars
    (
      ?auto_141285 - HOIST
      ?auto_141289 - PLACE
      ?auto_141290 - PLACE
      ?auto_141288 - HOIST
      ?auto_141286 - SURFACE
      ?auto_141287 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_141285 ?auto_141289 ) ( SURFACE-AT ?auto_141283 ?auto_141289 ) ( CLEAR ?auto_141283 ) ( IS-CRATE ?auto_141284 ) ( not ( = ?auto_141283 ?auto_141284 ) ) ( AVAILABLE ?auto_141285 ) ( ON ?auto_141283 ?auto_141282 ) ( not ( = ?auto_141282 ?auto_141283 ) ) ( not ( = ?auto_141282 ?auto_141284 ) ) ( not ( = ?auto_141290 ?auto_141289 ) ) ( HOIST-AT ?auto_141288 ?auto_141290 ) ( not ( = ?auto_141285 ?auto_141288 ) ) ( AVAILABLE ?auto_141288 ) ( SURFACE-AT ?auto_141284 ?auto_141290 ) ( ON ?auto_141284 ?auto_141286 ) ( CLEAR ?auto_141284 ) ( not ( = ?auto_141283 ?auto_141286 ) ) ( not ( = ?auto_141284 ?auto_141286 ) ) ( not ( = ?auto_141282 ?auto_141286 ) ) ( TRUCK-AT ?auto_141287 ?auto_141289 ) ( ON ?auto_141280 ?auto_141279 ) ( ON ?auto_141281 ?auto_141280 ) ( ON ?auto_141282 ?auto_141281 ) ( not ( = ?auto_141279 ?auto_141280 ) ) ( not ( = ?auto_141279 ?auto_141281 ) ) ( not ( = ?auto_141279 ?auto_141282 ) ) ( not ( = ?auto_141279 ?auto_141283 ) ) ( not ( = ?auto_141279 ?auto_141284 ) ) ( not ( = ?auto_141279 ?auto_141286 ) ) ( not ( = ?auto_141280 ?auto_141281 ) ) ( not ( = ?auto_141280 ?auto_141282 ) ) ( not ( = ?auto_141280 ?auto_141283 ) ) ( not ( = ?auto_141280 ?auto_141284 ) ) ( not ( = ?auto_141280 ?auto_141286 ) ) ( not ( = ?auto_141281 ?auto_141282 ) ) ( not ( = ?auto_141281 ?auto_141283 ) ) ( not ( = ?auto_141281 ?auto_141284 ) ) ( not ( = ?auto_141281 ?auto_141286 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_141282 ?auto_141283 ?auto_141284 )
      ( MAKE-5CRATE-VERIFY ?auto_141279 ?auto_141280 ?auto_141281 ?auto_141282 ?auto_141283 ?auto_141284 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_141330 - SURFACE
      ?auto_141331 - SURFACE
      ?auto_141332 - SURFACE
      ?auto_141333 - SURFACE
      ?auto_141334 - SURFACE
      ?auto_141335 - SURFACE
    )
    :vars
    (
      ?auto_141340 - HOIST
      ?auto_141339 - PLACE
      ?auto_141338 - PLACE
      ?auto_141341 - HOIST
      ?auto_141337 - SURFACE
      ?auto_141336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_141340 ?auto_141339 ) ( IS-CRATE ?auto_141335 ) ( not ( = ?auto_141334 ?auto_141335 ) ) ( not ( = ?auto_141333 ?auto_141334 ) ) ( not ( = ?auto_141333 ?auto_141335 ) ) ( not ( = ?auto_141338 ?auto_141339 ) ) ( HOIST-AT ?auto_141341 ?auto_141338 ) ( not ( = ?auto_141340 ?auto_141341 ) ) ( AVAILABLE ?auto_141341 ) ( SURFACE-AT ?auto_141335 ?auto_141338 ) ( ON ?auto_141335 ?auto_141337 ) ( CLEAR ?auto_141335 ) ( not ( = ?auto_141334 ?auto_141337 ) ) ( not ( = ?auto_141335 ?auto_141337 ) ) ( not ( = ?auto_141333 ?auto_141337 ) ) ( TRUCK-AT ?auto_141336 ?auto_141339 ) ( SURFACE-AT ?auto_141333 ?auto_141339 ) ( CLEAR ?auto_141333 ) ( LIFTING ?auto_141340 ?auto_141334 ) ( IS-CRATE ?auto_141334 ) ( ON ?auto_141331 ?auto_141330 ) ( ON ?auto_141332 ?auto_141331 ) ( ON ?auto_141333 ?auto_141332 ) ( not ( = ?auto_141330 ?auto_141331 ) ) ( not ( = ?auto_141330 ?auto_141332 ) ) ( not ( = ?auto_141330 ?auto_141333 ) ) ( not ( = ?auto_141330 ?auto_141334 ) ) ( not ( = ?auto_141330 ?auto_141335 ) ) ( not ( = ?auto_141330 ?auto_141337 ) ) ( not ( = ?auto_141331 ?auto_141332 ) ) ( not ( = ?auto_141331 ?auto_141333 ) ) ( not ( = ?auto_141331 ?auto_141334 ) ) ( not ( = ?auto_141331 ?auto_141335 ) ) ( not ( = ?auto_141331 ?auto_141337 ) ) ( not ( = ?auto_141332 ?auto_141333 ) ) ( not ( = ?auto_141332 ?auto_141334 ) ) ( not ( = ?auto_141332 ?auto_141335 ) ) ( not ( = ?auto_141332 ?auto_141337 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_141333 ?auto_141334 ?auto_141335 )
      ( MAKE-5CRATE-VERIFY ?auto_141330 ?auto_141331 ?auto_141332 ?auto_141333 ?auto_141334 ?auto_141335 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_141381 - SURFACE
      ?auto_141382 - SURFACE
      ?auto_141383 - SURFACE
      ?auto_141384 - SURFACE
      ?auto_141385 - SURFACE
      ?auto_141386 - SURFACE
    )
    :vars
    (
      ?auto_141390 - HOIST
      ?auto_141391 - PLACE
      ?auto_141387 - PLACE
      ?auto_141392 - HOIST
      ?auto_141388 - SURFACE
      ?auto_141389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_141390 ?auto_141391 ) ( IS-CRATE ?auto_141386 ) ( not ( = ?auto_141385 ?auto_141386 ) ) ( not ( = ?auto_141384 ?auto_141385 ) ) ( not ( = ?auto_141384 ?auto_141386 ) ) ( not ( = ?auto_141387 ?auto_141391 ) ) ( HOIST-AT ?auto_141392 ?auto_141387 ) ( not ( = ?auto_141390 ?auto_141392 ) ) ( AVAILABLE ?auto_141392 ) ( SURFACE-AT ?auto_141386 ?auto_141387 ) ( ON ?auto_141386 ?auto_141388 ) ( CLEAR ?auto_141386 ) ( not ( = ?auto_141385 ?auto_141388 ) ) ( not ( = ?auto_141386 ?auto_141388 ) ) ( not ( = ?auto_141384 ?auto_141388 ) ) ( TRUCK-AT ?auto_141389 ?auto_141391 ) ( SURFACE-AT ?auto_141384 ?auto_141391 ) ( CLEAR ?auto_141384 ) ( IS-CRATE ?auto_141385 ) ( AVAILABLE ?auto_141390 ) ( IN ?auto_141385 ?auto_141389 ) ( ON ?auto_141382 ?auto_141381 ) ( ON ?auto_141383 ?auto_141382 ) ( ON ?auto_141384 ?auto_141383 ) ( not ( = ?auto_141381 ?auto_141382 ) ) ( not ( = ?auto_141381 ?auto_141383 ) ) ( not ( = ?auto_141381 ?auto_141384 ) ) ( not ( = ?auto_141381 ?auto_141385 ) ) ( not ( = ?auto_141381 ?auto_141386 ) ) ( not ( = ?auto_141381 ?auto_141388 ) ) ( not ( = ?auto_141382 ?auto_141383 ) ) ( not ( = ?auto_141382 ?auto_141384 ) ) ( not ( = ?auto_141382 ?auto_141385 ) ) ( not ( = ?auto_141382 ?auto_141386 ) ) ( not ( = ?auto_141382 ?auto_141388 ) ) ( not ( = ?auto_141383 ?auto_141384 ) ) ( not ( = ?auto_141383 ?auto_141385 ) ) ( not ( = ?auto_141383 ?auto_141386 ) ) ( not ( = ?auto_141383 ?auto_141388 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_141384 ?auto_141385 ?auto_141386 )
      ( MAKE-5CRATE-VERIFY ?auto_141381 ?auto_141382 ?auto_141383 ?auto_141384 ?auto_141385 ?auto_141386 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_141749 - SURFACE
      ?auto_141750 - SURFACE
    )
    :vars
    (
      ?auto_141757 - HOIST
      ?auto_141755 - PLACE
      ?auto_141753 - SURFACE
      ?auto_141751 - PLACE
      ?auto_141752 - HOIST
      ?auto_141756 - SURFACE
      ?auto_141754 - TRUCK
      ?auto_141758 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_141757 ?auto_141755 ) ( SURFACE-AT ?auto_141749 ?auto_141755 ) ( CLEAR ?auto_141749 ) ( IS-CRATE ?auto_141750 ) ( not ( = ?auto_141749 ?auto_141750 ) ) ( ON ?auto_141749 ?auto_141753 ) ( not ( = ?auto_141753 ?auto_141749 ) ) ( not ( = ?auto_141753 ?auto_141750 ) ) ( not ( = ?auto_141751 ?auto_141755 ) ) ( HOIST-AT ?auto_141752 ?auto_141751 ) ( not ( = ?auto_141757 ?auto_141752 ) ) ( AVAILABLE ?auto_141752 ) ( SURFACE-AT ?auto_141750 ?auto_141751 ) ( ON ?auto_141750 ?auto_141756 ) ( CLEAR ?auto_141750 ) ( not ( = ?auto_141749 ?auto_141756 ) ) ( not ( = ?auto_141750 ?auto_141756 ) ) ( not ( = ?auto_141753 ?auto_141756 ) ) ( TRUCK-AT ?auto_141754 ?auto_141755 ) ( LIFTING ?auto_141757 ?auto_141758 ) ( IS-CRATE ?auto_141758 ) ( not ( = ?auto_141749 ?auto_141758 ) ) ( not ( = ?auto_141750 ?auto_141758 ) ) ( not ( = ?auto_141753 ?auto_141758 ) ) ( not ( = ?auto_141756 ?auto_141758 ) ) )
    :subtasks
    ( ( !LOAD ?auto_141757 ?auto_141758 ?auto_141754 ?auto_141755 )
      ( MAKE-1CRATE ?auto_141749 ?auto_141750 )
      ( MAKE-1CRATE-VERIFY ?auto_141749 ?auto_141750 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_142057 - SURFACE
      ?auto_142058 - SURFACE
    )
    :vars
    (
      ?auto_142065 - HOIST
      ?auto_142062 - PLACE
      ?auto_142063 - SURFACE
      ?auto_142059 - TRUCK
      ?auto_142060 - PLACE
      ?auto_142061 - HOIST
      ?auto_142064 - SURFACE
      ?auto_142066 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_142065 ?auto_142062 ) ( SURFACE-AT ?auto_142057 ?auto_142062 ) ( CLEAR ?auto_142057 ) ( IS-CRATE ?auto_142058 ) ( not ( = ?auto_142057 ?auto_142058 ) ) ( AVAILABLE ?auto_142065 ) ( ON ?auto_142057 ?auto_142063 ) ( not ( = ?auto_142063 ?auto_142057 ) ) ( not ( = ?auto_142063 ?auto_142058 ) ) ( TRUCK-AT ?auto_142059 ?auto_142060 ) ( not ( = ?auto_142060 ?auto_142062 ) ) ( HOIST-AT ?auto_142061 ?auto_142060 ) ( not ( = ?auto_142065 ?auto_142061 ) ) ( SURFACE-AT ?auto_142058 ?auto_142060 ) ( ON ?auto_142058 ?auto_142064 ) ( CLEAR ?auto_142058 ) ( not ( = ?auto_142057 ?auto_142064 ) ) ( not ( = ?auto_142058 ?auto_142064 ) ) ( not ( = ?auto_142063 ?auto_142064 ) ) ( LIFTING ?auto_142061 ?auto_142066 ) ( IS-CRATE ?auto_142066 ) ( not ( = ?auto_142057 ?auto_142066 ) ) ( not ( = ?auto_142058 ?auto_142066 ) ) ( not ( = ?auto_142063 ?auto_142066 ) ) ( not ( = ?auto_142064 ?auto_142066 ) ) )
    :subtasks
    ( ( !LOAD ?auto_142061 ?auto_142066 ?auto_142059 ?auto_142060 )
      ( MAKE-1CRATE ?auto_142057 ?auto_142058 )
      ( MAKE-1CRATE-VERIFY ?auto_142057 ?auto_142058 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142583 - SURFACE
      ?auto_142584 - SURFACE
      ?auto_142585 - SURFACE
      ?auto_142586 - SURFACE
      ?auto_142587 - SURFACE
      ?auto_142588 - SURFACE
      ?auto_142589 - SURFACE
    )
    :vars
    (
      ?auto_142591 - HOIST
      ?auto_142590 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_142591 ?auto_142590 ) ( SURFACE-AT ?auto_142588 ?auto_142590 ) ( CLEAR ?auto_142588 ) ( LIFTING ?auto_142591 ?auto_142589 ) ( IS-CRATE ?auto_142589 ) ( not ( = ?auto_142588 ?auto_142589 ) ) ( ON ?auto_142584 ?auto_142583 ) ( ON ?auto_142585 ?auto_142584 ) ( ON ?auto_142586 ?auto_142585 ) ( ON ?auto_142587 ?auto_142586 ) ( ON ?auto_142588 ?auto_142587 ) ( not ( = ?auto_142583 ?auto_142584 ) ) ( not ( = ?auto_142583 ?auto_142585 ) ) ( not ( = ?auto_142583 ?auto_142586 ) ) ( not ( = ?auto_142583 ?auto_142587 ) ) ( not ( = ?auto_142583 ?auto_142588 ) ) ( not ( = ?auto_142583 ?auto_142589 ) ) ( not ( = ?auto_142584 ?auto_142585 ) ) ( not ( = ?auto_142584 ?auto_142586 ) ) ( not ( = ?auto_142584 ?auto_142587 ) ) ( not ( = ?auto_142584 ?auto_142588 ) ) ( not ( = ?auto_142584 ?auto_142589 ) ) ( not ( = ?auto_142585 ?auto_142586 ) ) ( not ( = ?auto_142585 ?auto_142587 ) ) ( not ( = ?auto_142585 ?auto_142588 ) ) ( not ( = ?auto_142585 ?auto_142589 ) ) ( not ( = ?auto_142586 ?auto_142587 ) ) ( not ( = ?auto_142586 ?auto_142588 ) ) ( not ( = ?auto_142586 ?auto_142589 ) ) ( not ( = ?auto_142587 ?auto_142588 ) ) ( not ( = ?auto_142587 ?auto_142589 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_142588 ?auto_142589 )
      ( MAKE-6CRATE-VERIFY ?auto_142583 ?auto_142584 ?auto_142585 ?auto_142586 ?auto_142587 ?auto_142588 ?auto_142589 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142627 - SURFACE
      ?auto_142628 - SURFACE
      ?auto_142629 - SURFACE
      ?auto_142630 - SURFACE
      ?auto_142631 - SURFACE
      ?auto_142632 - SURFACE
      ?auto_142633 - SURFACE
    )
    :vars
    (
      ?auto_142635 - HOIST
      ?auto_142636 - PLACE
      ?auto_142634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_142635 ?auto_142636 ) ( SURFACE-AT ?auto_142632 ?auto_142636 ) ( CLEAR ?auto_142632 ) ( IS-CRATE ?auto_142633 ) ( not ( = ?auto_142632 ?auto_142633 ) ) ( TRUCK-AT ?auto_142634 ?auto_142636 ) ( AVAILABLE ?auto_142635 ) ( IN ?auto_142633 ?auto_142634 ) ( ON ?auto_142632 ?auto_142631 ) ( not ( = ?auto_142631 ?auto_142632 ) ) ( not ( = ?auto_142631 ?auto_142633 ) ) ( ON ?auto_142628 ?auto_142627 ) ( ON ?auto_142629 ?auto_142628 ) ( ON ?auto_142630 ?auto_142629 ) ( ON ?auto_142631 ?auto_142630 ) ( not ( = ?auto_142627 ?auto_142628 ) ) ( not ( = ?auto_142627 ?auto_142629 ) ) ( not ( = ?auto_142627 ?auto_142630 ) ) ( not ( = ?auto_142627 ?auto_142631 ) ) ( not ( = ?auto_142627 ?auto_142632 ) ) ( not ( = ?auto_142627 ?auto_142633 ) ) ( not ( = ?auto_142628 ?auto_142629 ) ) ( not ( = ?auto_142628 ?auto_142630 ) ) ( not ( = ?auto_142628 ?auto_142631 ) ) ( not ( = ?auto_142628 ?auto_142632 ) ) ( not ( = ?auto_142628 ?auto_142633 ) ) ( not ( = ?auto_142629 ?auto_142630 ) ) ( not ( = ?auto_142629 ?auto_142631 ) ) ( not ( = ?auto_142629 ?auto_142632 ) ) ( not ( = ?auto_142629 ?auto_142633 ) ) ( not ( = ?auto_142630 ?auto_142631 ) ) ( not ( = ?auto_142630 ?auto_142632 ) ) ( not ( = ?auto_142630 ?auto_142633 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142631 ?auto_142632 ?auto_142633 )
      ( MAKE-6CRATE-VERIFY ?auto_142627 ?auto_142628 ?auto_142629 ?auto_142630 ?auto_142631 ?auto_142632 ?auto_142633 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142678 - SURFACE
      ?auto_142679 - SURFACE
      ?auto_142680 - SURFACE
      ?auto_142681 - SURFACE
      ?auto_142682 - SURFACE
      ?auto_142683 - SURFACE
      ?auto_142684 - SURFACE
    )
    :vars
    (
      ?auto_142685 - HOIST
      ?auto_142688 - PLACE
      ?auto_142687 - TRUCK
      ?auto_142686 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_142685 ?auto_142688 ) ( SURFACE-AT ?auto_142683 ?auto_142688 ) ( CLEAR ?auto_142683 ) ( IS-CRATE ?auto_142684 ) ( not ( = ?auto_142683 ?auto_142684 ) ) ( AVAILABLE ?auto_142685 ) ( IN ?auto_142684 ?auto_142687 ) ( ON ?auto_142683 ?auto_142682 ) ( not ( = ?auto_142682 ?auto_142683 ) ) ( not ( = ?auto_142682 ?auto_142684 ) ) ( TRUCK-AT ?auto_142687 ?auto_142686 ) ( not ( = ?auto_142686 ?auto_142688 ) ) ( ON ?auto_142679 ?auto_142678 ) ( ON ?auto_142680 ?auto_142679 ) ( ON ?auto_142681 ?auto_142680 ) ( ON ?auto_142682 ?auto_142681 ) ( not ( = ?auto_142678 ?auto_142679 ) ) ( not ( = ?auto_142678 ?auto_142680 ) ) ( not ( = ?auto_142678 ?auto_142681 ) ) ( not ( = ?auto_142678 ?auto_142682 ) ) ( not ( = ?auto_142678 ?auto_142683 ) ) ( not ( = ?auto_142678 ?auto_142684 ) ) ( not ( = ?auto_142679 ?auto_142680 ) ) ( not ( = ?auto_142679 ?auto_142681 ) ) ( not ( = ?auto_142679 ?auto_142682 ) ) ( not ( = ?auto_142679 ?auto_142683 ) ) ( not ( = ?auto_142679 ?auto_142684 ) ) ( not ( = ?auto_142680 ?auto_142681 ) ) ( not ( = ?auto_142680 ?auto_142682 ) ) ( not ( = ?auto_142680 ?auto_142683 ) ) ( not ( = ?auto_142680 ?auto_142684 ) ) ( not ( = ?auto_142681 ?auto_142682 ) ) ( not ( = ?auto_142681 ?auto_142683 ) ) ( not ( = ?auto_142681 ?auto_142684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142682 ?auto_142683 ?auto_142684 )
      ( MAKE-6CRATE-VERIFY ?auto_142678 ?auto_142679 ?auto_142680 ?auto_142681 ?auto_142682 ?auto_142683 ?auto_142684 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142735 - SURFACE
      ?auto_142736 - SURFACE
      ?auto_142737 - SURFACE
      ?auto_142738 - SURFACE
      ?auto_142739 - SURFACE
      ?auto_142740 - SURFACE
      ?auto_142741 - SURFACE
    )
    :vars
    (
      ?auto_142746 - HOIST
      ?auto_142744 - PLACE
      ?auto_142742 - TRUCK
      ?auto_142745 - PLACE
      ?auto_142743 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_142746 ?auto_142744 ) ( SURFACE-AT ?auto_142740 ?auto_142744 ) ( CLEAR ?auto_142740 ) ( IS-CRATE ?auto_142741 ) ( not ( = ?auto_142740 ?auto_142741 ) ) ( AVAILABLE ?auto_142746 ) ( ON ?auto_142740 ?auto_142739 ) ( not ( = ?auto_142739 ?auto_142740 ) ) ( not ( = ?auto_142739 ?auto_142741 ) ) ( TRUCK-AT ?auto_142742 ?auto_142745 ) ( not ( = ?auto_142745 ?auto_142744 ) ) ( HOIST-AT ?auto_142743 ?auto_142745 ) ( LIFTING ?auto_142743 ?auto_142741 ) ( not ( = ?auto_142746 ?auto_142743 ) ) ( ON ?auto_142736 ?auto_142735 ) ( ON ?auto_142737 ?auto_142736 ) ( ON ?auto_142738 ?auto_142737 ) ( ON ?auto_142739 ?auto_142738 ) ( not ( = ?auto_142735 ?auto_142736 ) ) ( not ( = ?auto_142735 ?auto_142737 ) ) ( not ( = ?auto_142735 ?auto_142738 ) ) ( not ( = ?auto_142735 ?auto_142739 ) ) ( not ( = ?auto_142735 ?auto_142740 ) ) ( not ( = ?auto_142735 ?auto_142741 ) ) ( not ( = ?auto_142736 ?auto_142737 ) ) ( not ( = ?auto_142736 ?auto_142738 ) ) ( not ( = ?auto_142736 ?auto_142739 ) ) ( not ( = ?auto_142736 ?auto_142740 ) ) ( not ( = ?auto_142736 ?auto_142741 ) ) ( not ( = ?auto_142737 ?auto_142738 ) ) ( not ( = ?auto_142737 ?auto_142739 ) ) ( not ( = ?auto_142737 ?auto_142740 ) ) ( not ( = ?auto_142737 ?auto_142741 ) ) ( not ( = ?auto_142738 ?auto_142739 ) ) ( not ( = ?auto_142738 ?auto_142740 ) ) ( not ( = ?auto_142738 ?auto_142741 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142739 ?auto_142740 ?auto_142741 )
      ( MAKE-6CRATE-VERIFY ?auto_142735 ?auto_142736 ?auto_142737 ?auto_142738 ?auto_142739 ?auto_142740 ?auto_142741 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142798 - SURFACE
      ?auto_142799 - SURFACE
      ?auto_142800 - SURFACE
      ?auto_142801 - SURFACE
      ?auto_142802 - SURFACE
      ?auto_142803 - SURFACE
      ?auto_142804 - SURFACE
    )
    :vars
    (
      ?auto_142806 - HOIST
      ?auto_142807 - PLACE
      ?auto_142805 - TRUCK
      ?auto_142808 - PLACE
      ?auto_142809 - HOIST
      ?auto_142810 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_142806 ?auto_142807 ) ( SURFACE-AT ?auto_142803 ?auto_142807 ) ( CLEAR ?auto_142803 ) ( IS-CRATE ?auto_142804 ) ( not ( = ?auto_142803 ?auto_142804 ) ) ( AVAILABLE ?auto_142806 ) ( ON ?auto_142803 ?auto_142802 ) ( not ( = ?auto_142802 ?auto_142803 ) ) ( not ( = ?auto_142802 ?auto_142804 ) ) ( TRUCK-AT ?auto_142805 ?auto_142808 ) ( not ( = ?auto_142808 ?auto_142807 ) ) ( HOIST-AT ?auto_142809 ?auto_142808 ) ( not ( = ?auto_142806 ?auto_142809 ) ) ( AVAILABLE ?auto_142809 ) ( SURFACE-AT ?auto_142804 ?auto_142808 ) ( ON ?auto_142804 ?auto_142810 ) ( CLEAR ?auto_142804 ) ( not ( = ?auto_142803 ?auto_142810 ) ) ( not ( = ?auto_142804 ?auto_142810 ) ) ( not ( = ?auto_142802 ?auto_142810 ) ) ( ON ?auto_142799 ?auto_142798 ) ( ON ?auto_142800 ?auto_142799 ) ( ON ?auto_142801 ?auto_142800 ) ( ON ?auto_142802 ?auto_142801 ) ( not ( = ?auto_142798 ?auto_142799 ) ) ( not ( = ?auto_142798 ?auto_142800 ) ) ( not ( = ?auto_142798 ?auto_142801 ) ) ( not ( = ?auto_142798 ?auto_142802 ) ) ( not ( = ?auto_142798 ?auto_142803 ) ) ( not ( = ?auto_142798 ?auto_142804 ) ) ( not ( = ?auto_142798 ?auto_142810 ) ) ( not ( = ?auto_142799 ?auto_142800 ) ) ( not ( = ?auto_142799 ?auto_142801 ) ) ( not ( = ?auto_142799 ?auto_142802 ) ) ( not ( = ?auto_142799 ?auto_142803 ) ) ( not ( = ?auto_142799 ?auto_142804 ) ) ( not ( = ?auto_142799 ?auto_142810 ) ) ( not ( = ?auto_142800 ?auto_142801 ) ) ( not ( = ?auto_142800 ?auto_142802 ) ) ( not ( = ?auto_142800 ?auto_142803 ) ) ( not ( = ?auto_142800 ?auto_142804 ) ) ( not ( = ?auto_142800 ?auto_142810 ) ) ( not ( = ?auto_142801 ?auto_142802 ) ) ( not ( = ?auto_142801 ?auto_142803 ) ) ( not ( = ?auto_142801 ?auto_142804 ) ) ( not ( = ?auto_142801 ?auto_142810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142802 ?auto_142803 ?auto_142804 )
      ( MAKE-6CRATE-VERIFY ?auto_142798 ?auto_142799 ?auto_142800 ?auto_142801 ?auto_142802 ?auto_142803 ?auto_142804 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142862 - SURFACE
      ?auto_142863 - SURFACE
      ?auto_142864 - SURFACE
      ?auto_142865 - SURFACE
      ?auto_142866 - SURFACE
      ?auto_142867 - SURFACE
      ?auto_142868 - SURFACE
    )
    :vars
    (
      ?auto_142871 - HOIST
      ?auto_142869 - PLACE
      ?auto_142874 - PLACE
      ?auto_142872 - HOIST
      ?auto_142870 - SURFACE
      ?auto_142873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_142871 ?auto_142869 ) ( SURFACE-AT ?auto_142867 ?auto_142869 ) ( CLEAR ?auto_142867 ) ( IS-CRATE ?auto_142868 ) ( not ( = ?auto_142867 ?auto_142868 ) ) ( AVAILABLE ?auto_142871 ) ( ON ?auto_142867 ?auto_142866 ) ( not ( = ?auto_142866 ?auto_142867 ) ) ( not ( = ?auto_142866 ?auto_142868 ) ) ( not ( = ?auto_142874 ?auto_142869 ) ) ( HOIST-AT ?auto_142872 ?auto_142874 ) ( not ( = ?auto_142871 ?auto_142872 ) ) ( AVAILABLE ?auto_142872 ) ( SURFACE-AT ?auto_142868 ?auto_142874 ) ( ON ?auto_142868 ?auto_142870 ) ( CLEAR ?auto_142868 ) ( not ( = ?auto_142867 ?auto_142870 ) ) ( not ( = ?auto_142868 ?auto_142870 ) ) ( not ( = ?auto_142866 ?auto_142870 ) ) ( TRUCK-AT ?auto_142873 ?auto_142869 ) ( ON ?auto_142863 ?auto_142862 ) ( ON ?auto_142864 ?auto_142863 ) ( ON ?auto_142865 ?auto_142864 ) ( ON ?auto_142866 ?auto_142865 ) ( not ( = ?auto_142862 ?auto_142863 ) ) ( not ( = ?auto_142862 ?auto_142864 ) ) ( not ( = ?auto_142862 ?auto_142865 ) ) ( not ( = ?auto_142862 ?auto_142866 ) ) ( not ( = ?auto_142862 ?auto_142867 ) ) ( not ( = ?auto_142862 ?auto_142868 ) ) ( not ( = ?auto_142862 ?auto_142870 ) ) ( not ( = ?auto_142863 ?auto_142864 ) ) ( not ( = ?auto_142863 ?auto_142865 ) ) ( not ( = ?auto_142863 ?auto_142866 ) ) ( not ( = ?auto_142863 ?auto_142867 ) ) ( not ( = ?auto_142863 ?auto_142868 ) ) ( not ( = ?auto_142863 ?auto_142870 ) ) ( not ( = ?auto_142864 ?auto_142865 ) ) ( not ( = ?auto_142864 ?auto_142866 ) ) ( not ( = ?auto_142864 ?auto_142867 ) ) ( not ( = ?auto_142864 ?auto_142868 ) ) ( not ( = ?auto_142864 ?auto_142870 ) ) ( not ( = ?auto_142865 ?auto_142866 ) ) ( not ( = ?auto_142865 ?auto_142867 ) ) ( not ( = ?auto_142865 ?auto_142868 ) ) ( not ( = ?auto_142865 ?auto_142870 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142866 ?auto_142867 ?auto_142868 )
      ( MAKE-6CRATE-VERIFY ?auto_142862 ?auto_142863 ?auto_142864 ?auto_142865 ?auto_142866 ?auto_142867 ?auto_142868 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142926 - SURFACE
      ?auto_142927 - SURFACE
      ?auto_142928 - SURFACE
      ?auto_142929 - SURFACE
      ?auto_142930 - SURFACE
      ?auto_142931 - SURFACE
      ?auto_142932 - SURFACE
    )
    :vars
    (
      ?auto_142934 - HOIST
      ?auto_142936 - PLACE
      ?auto_142933 - PLACE
      ?auto_142935 - HOIST
      ?auto_142938 - SURFACE
      ?auto_142937 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_142934 ?auto_142936 ) ( IS-CRATE ?auto_142932 ) ( not ( = ?auto_142931 ?auto_142932 ) ) ( not ( = ?auto_142930 ?auto_142931 ) ) ( not ( = ?auto_142930 ?auto_142932 ) ) ( not ( = ?auto_142933 ?auto_142936 ) ) ( HOIST-AT ?auto_142935 ?auto_142933 ) ( not ( = ?auto_142934 ?auto_142935 ) ) ( AVAILABLE ?auto_142935 ) ( SURFACE-AT ?auto_142932 ?auto_142933 ) ( ON ?auto_142932 ?auto_142938 ) ( CLEAR ?auto_142932 ) ( not ( = ?auto_142931 ?auto_142938 ) ) ( not ( = ?auto_142932 ?auto_142938 ) ) ( not ( = ?auto_142930 ?auto_142938 ) ) ( TRUCK-AT ?auto_142937 ?auto_142936 ) ( SURFACE-AT ?auto_142930 ?auto_142936 ) ( CLEAR ?auto_142930 ) ( LIFTING ?auto_142934 ?auto_142931 ) ( IS-CRATE ?auto_142931 ) ( ON ?auto_142927 ?auto_142926 ) ( ON ?auto_142928 ?auto_142927 ) ( ON ?auto_142929 ?auto_142928 ) ( ON ?auto_142930 ?auto_142929 ) ( not ( = ?auto_142926 ?auto_142927 ) ) ( not ( = ?auto_142926 ?auto_142928 ) ) ( not ( = ?auto_142926 ?auto_142929 ) ) ( not ( = ?auto_142926 ?auto_142930 ) ) ( not ( = ?auto_142926 ?auto_142931 ) ) ( not ( = ?auto_142926 ?auto_142932 ) ) ( not ( = ?auto_142926 ?auto_142938 ) ) ( not ( = ?auto_142927 ?auto_142928 ) ) ( not ( = ?auto_142927 ?auto_142929 ) ) ( not ( = ?auto_142927 ?auto_142930 ) ) ( not ( = ?auto_142927 ?auto_142931 ) ) ( not ( = ?auto_142927 ?auto_142932 ) ) ( not ( = ?auto_142927 ?auto_142938 ) ) ( not ( = ?auto_142928 ?auto_142929 ) ) ( not ( = ?auto_142928 ?auto_142930 ) ) ( not ( = ?auto_142928 ?auto_142931 ) ) ( not ( = ?auto_142928 ?auto_142932 ) ) ( not ( = ?auto_142928 ?auto_142938 ) ) ( not ( = ?auto_142929 ?auto_142930 ) ) ( not ( = ?auto_142929 ?auto_142931 ) ) ( not ( = ?auto_142929 ?auto_142932 ) ) ( not ( = ?auto_142929 ?auto_142938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142930 ?auto_142931 ?auto_142932 )
      ( MAKE-6CRATE-VERIFY ?auto_142926 ?auto_142927 ?auto_142928 ?auto_142929 ?auto_142930 ?auto_142931 ?auto_142932 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_142990 - SURFACE
      ?auto_142991 - SURFACE
      ?auto_142992 - SURFACE
      ?auto_142993 - SURFACE
      ?auto_142994 - SURFACE
      ?auto_142995 - SURFACE
      ?auto_142996 - SURFACE
    )
    :vars
    (
      ?auto_142999 - HOIST
      ?auto_143001 - PLACE
      ?auto_142997 - PLACE
      ?auto_142998 - HOIST
      ?auto_143000 - SURFACE
      ?auto_143002 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_142999 ?auto_143001 ) ( IS-CRATE ?auto_142996 ) ( not ( = ?auto_142995 ?auto_142996 ) ) ( not ( = ?auto_142994 ?auto_142995 ) ) ( not ( = ?auto_142994 ?auto_142996 ) ) ( not ( = ?auto_142997 ?auto_143001 ) ) ( HOIST-AT ?auto_142998 ?auto_142997 ) ( not ( = ?auto_142999 ?auto_142998 ) ) ( AVAILABLE ?auto_142998 ) ( SURFACE-AT ?auto_142996 ?auto_142997 ) ( ON ?auto_142996 ?auto_143000 ) ( CLEAR ?auto_142996 ) ( not ( = ?auto_142995 ?auto_143000 ) ) ( not ( = ?auto_142996 ?auto_143000 ) ) ( not ( = ?auto_142994 ?auto_143000 ) ) ( TRUCK-AT ?auto_143002 ?auto_143001 ) ( SURFACE-AT ?auto_142994 ?auto_143001 ) ( CLEAR ?auto_142994 ) ( IS-CRATE ?auto_142995 ) ( AVAILABLE ?auto_142999 ) ( IN ?auto_142995 ?auto_143002 ) ( ON ?auto_142991 ?auto_142990 ) ( ON ?auto_142992 ?auto_142991 ) ( ON ?auto_142993 ?auto_142992 ) ( ON ?auto_142994 ?auto_142993 ) ( not ( = ?auto_142990 ?auto_142991 ) ) ( not ( = ?auto_142990 ?auto_142992 ) ) ( not ( = ?auto_142990 ?auto_142993 ) ) ( not ( = ?auto_142990 ?auto_142994 ) ) ( not ( = ?auto_142990 ?auto_142995 ) ) ( not ( = ?auto_142990 ?auto_142996 ) ) ( not ( = ?auto_142990 ?auto_143000 ) ) ( not ( = ?auto_142991 ?auto_142992 ) ) ( not ( = ?auto_142991 ?auto_142993 ) ) ( not ( = ?auto_142991 ?auto_142994 ) ) ( not ( = ?auto_142991 ?auto_142995 ) ) ( not ( = ?auto_142991 ?auto_142996 ) ) ( not ( = ?auto_142991 ?auto_143000 ) ) ( not ( = ?auto_142992 ?auto_142993 ) ) ( not ( = ?auto_142992 ?auto_142994 ) ) ( not ( = ?auto_142992 ?auto_142995 ) ) ( not ( = ?auto_142992 ?auto_142996 ) ) ( not ( = ?auto_142992 ?auto_143000 ) ) ( not ( = ?auto_142993 ?auto_142994 ) ) ( not ( = ?auto_142993 ?auto_142995 ) ) ( not ( = ?auto_142993 ?auto_142996 ) ) ( not ( = ?auto_142993 ?auto_143000 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_142994 ?auto_142995 ?auto_142996 )
      ( MAKE-6CRATE-VERIFY ?auto_142990 ?auto_142991 ?auto_142992 ?auto_142993 ?auto_142994 ?auto_142995 ?auto_142996 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_144921 - SURFACE
      ?auto_144922 - SURFACE
      ?auto_144923 - SURFACE
      ?auto_144924 - SURFACE
      ?auto_144925 - SURFACE
      ?auto_144926 - SURFACE
      ?auto_144927 - SURFACE
      ?auto_144928 - SURFACE
    )
    :vars
    (
      ?auto_144929 - HOIST
      ?auto_144930 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_144929 ?auto_144930 ) ( SURFACE-AT ?auto_144927 ?auto_144930 ) ( CLEAR ?auto_144927 ) ( LIFTING ?auto_144929 ?auto_144928 ) ( IS-CRATE ?auto_144928 ) ( not ( = ?auto_144927 ?auto_144928 ) ) ( ON ?auto_144922 ?auto_144921 ) ( ON ?auto_144923 ?auto_144922 ) ( ON ?auto_144924 ?auto_144923 ) ( ON ?auto_144925 ?auto_144924 ) ( ON ?auto_144926 ?auto_144925 ) ( ON ?auto_144927 ?auto_144926 ) ( not ( = ?auto_144921 ?auto_144922 ) ) ( not ( = ?auto_144921 ?auto_144923 ) ) ( not ( = ?auto_144921 ?auto_144924 ) ) ( not ( = ?auto_144921 ?auto_144925 ) ) ( not ( = ?auto_144921 ?auto_144926 ) ) ( not ( = ?auto_144921 ?auto_144927 ) ) ( not ( = ?auto_144921 ?auto_144928 ) ) ( not ( = ?auto_144922 ?auto_144923 ) ) ( not ( = ?auto_144922 ?auto_144924 ) ) ( not ( = ?auto_144922 ?auto_144925 ) ) ( not ( = ?auto_144922 ?auto_144926 ) ) ( not ( = ?auto_144922 ?auto_144927 ) ) ( not ( = ?auto_144922 ?auto_144928 ) ) ( not ( = ?auto_144923 ?auto_144924 ) ) ( not ( = ?auto_144923 ?auto_144925 ) ) ( not ( = ?auto_144923 ?auto_144926 ) ) ( not ( = ?auto_144923 ?auto_144927 ) ) ( not ( = ?auto_144923 ?auto_144928 ) ) ( not ( = ?auto_144924 ?auto_144925 ) ) ( not ( = ?auto_144924 ?auto_144926 ) ) ( not ( = ?auto_144924 ?auto_144927 ) ) ( not ( = ?auto_144924 ?auto_144928 ) ) ( not ( = ?auto_144925 ?auto_144926 ) ) ( not ( = ?auto_144925 ?auto_144927 ) ) ( not ( = ?auto_144925 ?auto_144928 ) ) ( not ( = ?auto_144926 ?auto_144927 ) ) ( not ( = ?auto_144926 ?auto_144928 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_144927 ?auto_144928 )
      ( MAKE-7CRATE-VERIFY ?auto_144921 ?auto_144922 ?auto_144923 ?auto_144924 ?auto_144925 ?auto_144926 ?auto_144927 ?auto_144928 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_144976 - SURFACE
      ?auto_144977 - SURFACE
      ?auto_144978 - SURFACE
      ?auto_144979 - SURFACE
      ?auto_144980 - SURFACE
      ?auto_144981 - SURFACE
      ?auto_144982 - SURFACE
      ?auto_144983 - SURFACE
    )
    :vars
    (
      ?auto_144985 - HOIST
      ?auto_144984 - PLACE
      ?auto_144986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_144985 ?auto_144984 ) ( SURFACE-AT ?auto_144982 ?auto_144984 ) ( CLEAR ?auto_144982 ) ( IS-CRATE ?auto_144983 ) ( not ( = ?auto_144982 ?auto_144983 ) ) ( TRUCK-AT ?auto_144986 ?auto_144984 ) ( AVAILABLE ?auto_144985 ) ( IN ?auto_144983 ?auto_144986 ) ( ON ?auto_144982 ?auto_144981 ) ( not ( = ?auto_144981 ?auto_144982 ) ) ( not ( = ?auto_144981 ?auto_144983 ) ) ( ON ?auto_144977 ?auto_144976 ) ( ON ?auto_144978 ?auto_144977 ) ( ON ?auto_144979 ?auto_144978 ) ( ON ?auto_144980 ?auto_144979 ) ( ON ?auto_144981 ?auto_144980 ) ( not ( = ?auto_144976 ?auto_144977 ) ) ( not ( = ?auto_144976 ?auto_144978 ) ) ( not ( = ?auto_144976 ?auto_144979 ) ) ( not ( = ?auto_144976 ?auto_144980 ) ) ( not ( = ?auto_144976 ?auto_144981 ) ) ( not ( = ?auto_144976 ?auto_144982 ) ) ( not ( = ?auto_144976 ?auto_144983 ) ) ( not ( = ?auto_144977 ?auto_144978 ) ) ( not ( = ?auto_144977 ?auto_144979 ) ) ( not ( = ?auto_144977 ?auto_144980 ) ) ( not ( = ?auto_144977 ?auto_144981 ) ) ( not ( = ?auto_144977 ?auto_144982 ) ) ( not ( = ?auto_144977 ?auto_144983 ) ) ( not ( = ?auto_144978 ?auto_144979 ) ) ( not ( = ?auto_144978 ?auto_144980 ) ) ( not ( = ?auto_144978 ?auto_144981 ) ) ( not ( = ?auto_144978 ?auto_144982 ) ) ( not ( = ?auto_144978 ?auto_144983 ) ) ( not ( = ?auto_144979 ?auto_144980 ) ) ( not ( = ?auto_144979 ?auto_144981 ) ) ( not ( = ?auto_144979 ?auto_144982 ) ) ( not ( = ?auto_144979 ?auto_144983 ) ) ( not ( = ?auto_144980 ?auto_144981 ) ) ( not ( = ?auto_144980 ?auto_144982 ) ) ( not ( = ?auto_144980 ?auto_144983 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_144981 ?auto_144982 ?auto_144983 )
      ( MAKE-7CRATE-VERIFY ?auto_144976 ?auto_144977 ?auto_144978 ?auto_144979 ?auto_144980 ?auto_144981 ?auto_144982 ?auto_144983 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_145039 - SURFACE
      ?auto_145040 - SURFACE
      ?auto_145041 - SURFACE
      ?auto_145042 - SURFACE
      ?auto_145043 - SURFACE
      ?auto_145044 - SURFACE
      ?auto_145045 - SURFACE
      ?auto_145046 - SURFACE
    )
    :vars
    (
      ?auto_145049 - HOIST
      ?auto_145047 - PLACE
      ?auto_145050 - TRUCK
      ?auto_145048 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_145049 ?auto_145047 ) ( SURFACE-AT ?auto_145045 ?auto_145047 ) ( CLEAR ?auto_145045 ) ( IS-CRATE ?auto_145046 ) ( not ( = ?auto_145045 ?auto_145046 ) ) ( AVAILABLE ?auto_145049 ) ( IN ?auto_145046 ?auto_145050 ) ( ON ?auto_145045 ?auto_145044 ) ( not ( = ?auto_145044 ?auto_145045 ) ) ( not ( = ?auto_145044 ?auto_145046 ) ) ( TRUCK-AT ?auto_145050 ?auto_145048 ) ( not ( = ?auto_145048 ?auto_145047 ) ) ( ON ?auto_145040 ?auto_145039 ) ( ON ?auto_145041 ?auto_145040 ) ( ON ?auto_145042 ?auto_145041 ) ( ON ?auto_145043 ?auto_145042 ) ( ON ?auto_145044 ?auto_145043 ) ( not ( = ?auto_145039 ?auto_145040 ) ) ( not ( = ?auto_145039 ?auto_145041 ) ) ( not ( = ?auto_145039 ?auto_145042 ) ) ( not ( = ?auto_145039 ?auto_145043 ) ) ( not ( = ?auto_145039 ?auto_145044 ) ) ( not ( = ?auto_145039 ?auto_145045 ) ) ( not ( = ?auto_145039 ?auto_145046 ) ) ( not ( = ?auto_145040 ?auto_145041 ) ) ( not ( = ?auto_145040 ?auto_145042 ) ) ( not ( = ?auto_145040 ?auto_145043 ) ) ( not ( = ?auto_145040 ?auto_145044 ) ) ( not ( = ?auto_145040 ?auto_145045 ) ) ( not ( = ?auto_145040 ?auto_145046 ) ) ( not ( = ?auto_145041 ?auto_145042 ) ) ( not ( = ?auto_145041 ?auto_145043 ) ) ( not ( = ?auto_145041 ?auto_145044 ) ) ( not ( = ?auto_145041 ?auto_145045 ) ) ( not ( = ?auto_145041 ?auto_145046 ) ) ( not ( = ?auto_145042 ?auto_145043 ) ) ( not ( = ?auto_145042 ?auto_145044 ) ) ( not ( = ?auto_145042 ?auto_145045 ) ) ( not ( = ?auto_145042 ?auto_145046 ) ) ( not ( = ?auto_145043 ?auto_145044 ) ) ( not ( = ?auto_145043 ?auto_145045 ) ) ( not ( = ?auto_145043 ?auto_145046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_145044 ?auto_145045 ?auto_145046 )
      ( MAKE-7CRATE-VERIFY ?auto_145039 ?auto_145040 ?auto_145041 ?auto_145042 ?auto_145043 ?auto_145044 ?auto_145045 ?auto_145046 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_145109 - SURFACE
      ?auto_145110 - SURFACE
      ?auto_145111 - SURFACE
      ?auto_145112 - SURFACE
      ?auto_145113 - SURFACE
      ?auto_145114 - SURFACE
      ?auto_145115 - SURFACE
      ?auto_145116 - SURFACE
    )
    :vars
    (
      ?auto_145121 - HOIST
      ?auto_145118 - PLACE
      ?auto_145117 - TRUCK
      ?auto_145120 - PLACE
      ?auto_145119 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_145121 ?auto_145118 ) ( SURFACE-AT ?auto_145115 ?auto_145118 ) ( CLEAR ?auto_145115 ) ( IS-CRATE ?auto_145116 ) ( not ( = ?auto_145115 ?auto_145116 ) ) ( AVAILABLE ?auto_145121 ) ( ON ?auto_145115 ?auto_145114 ) ( not ( = ?auto_145114 ?auto_145115 ) ) ( not ( = ?auto_145114 ?auto_145116 ) ) ( TRUCK-AT ?auto_145117 ?auto_145120 ) ( not ( = ?auto_145120 ?auto_145118 ) ) ( HOIST-AT ?auto_145119 ?auto_145120 ) ( LIFTING ?auto_145119 ?auto_145116 ) ( not ( = ?auto_145121 ?auto_145119 ) ) ( ON ?auto_145110 ?auto_145109 ) ( ON ?auto_145111 ?auto_145110 ) ( ON ?auto_145112 ?auto_145111 ) ( ON ?auto_145113 ?auto_145112 ) ( ON ?auto_145114 ?auto_145113 ) ( not ( = ?auto_145109 ?auto_145110 ) ) ( not ( = ?auto_145109 ?auto_145111 ) ) ( not ( = ?auto_145109 ?auto_145112 ) ) ( not ( = ?auto_145109 ?auto_145113 ) ) ( not ( = ?auto_145109 ?auto_145114 ) ) ( not ( = ?auto_145109 ?auto_145115 ) ) ( not ( = ?auto_145109 ?auto_145116 ) ) ( not ( = ?auto_145110 ?auto_145111 ) ) ( not ( = ?auto_145110 ?auto_145112 ) ) ( not ( = ?auto_145110 ?auto_145113 ) ) ( not ( = ?auto_145110 ?auto_145114 ) ) ( not ( = ?auto_145110 ?auto_145115 ) ) ( not ( = ?auto_145110 ?auto_145116 ) ) ( not ( = ?auto_145111 ?auto_145112 ) ) ( not ( = ?auto_145111 ?auto_145113 ) ) ( not ( = ?auto_145111 ?auto_145114 ) ) ( not ( = ?auto_145111 ?auto_145115 ) ) ( not ( = ?auto_145111 ?auto_145116 ) ) ( not ( = ?auto_145112 ?auto_145113 ) ) ( not ( = ?auto_145112 ?auto_145114 ) ) ( not ( = ?auto_145112 ?auto_145115 ) ) ( not ( = ?auto_145112 ?auto_145116 ) ) ( not ( = ?auto_145113 ?auto_145114 ) ) ( not ( = ?auto_145113 ?auto_145115 ) ) ( not ( = ?auto_145113 ?auto_145116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_145114 ?auto_145115 ?auto_145116 )
      ( MAKE-7CRATE-VERIFY ?auto_145109 ?auto_145110 ?auto_145111 ?auto_145112 ?auto_145113 ?auto_145114 ?auto_145115 ?auto_145116 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_145186 - SURFACE
      ?auto_145187 - SURFACE
      ?auto_145188 - SURFACE
      ?auto_145189 - SURFACE
      ?auto_145190 - SURFACE
      ?auto_145191 - SURFACE
      ?auto_145192 - SURFACE
      ?auto_145193 - SURFACE
    )
    :vars
    (
      ?auto_145197 - HOIST
      ?auto_145194 - PLACE
      ?auto_145198 - TRUCK
      ?auto_145199 - PLACE
      ?auto_145195 - HOIST
      ?auto_145196 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_145197 ?auto_145194 ) ( SURFACE-AT ?auto_145192 ?auto_145194 ) ( CLEAR ?auto_145192 ) ( IS-CRATE ?auto_145193 ) ( not ( = ?auto_145192 ?auto_145193 ) ) ( AVAILABLE ?auto_145197 ) ( ON ?auto_145192 ?auto_145191 ) ( not ( = ?auto_145191 ?auto_145192 ) ) ( not ( = ?auto_145191 ?auto_145193 ) ) ( TRUCK-AT ?auto_145198 ?auto_145199 ) ( not ( = ?auto_145199 ?auto_145194 ) ) ( HOIST-AT ?auto_145195 ?auto_145199 ) ( not ( = ?auto_145197 ?auto_145195 ) ) ( AVAILABLE ?auto_145195 ) ( SURFACE-AT ?auto_145193 ?auto_145199 ) ( ON ?auto_145193 ?auto_145196 ) ( CLEAR ?auto_145193 ) ( not ( = ?auto_145192 ?auto_145196 ) ) ( not ( = ?auto_145193 ?auto_145196 ) ) ( not ( = ?auto_145191 ?auto_145196 ) ) ( ON ?auto_145187 ?auto_145186 ) ( ON ?auto_145188 ?auto_145187 ) ( ON ?auto_145189 ?auto_145188 ) ( ON ?auto_145190 ?auto_145189 ) ( ON ?auto_145191 ?auto_145190 ) ( not ( = ?auto_145186 ?auto_145187 ) ) ( not ( = ?auto_145186 ?auto_145188 ) ) ( not ( = ?auto_145186 ?auto_145189 ) ) ( not ( = ?auto_145186 ?auto_145190 ) ) ( not ( = ?auto_145186 ?auto_145191 ) ) ( not ( = ?auto_145186 ?auto_145192 ) ) ( not ( = ?auto_145186 ?auto_145193 ) ) ( not ( = ?auto_145186 ?auto_145196 ) ) ( not ( = ?auto_145187 ?auto_145188 ) ) ( not ( = ?auto_145187 ?auto_145189 ) ) ( not ( = ?auto_145187 ?auto_145190 ) ) ( not ( = ?auto_145187 ?auto_145191 ) ) ( not ( = ?auto_145187 ?auto_145192 ) ) ( not ( = ?auto_145187 ?auto_145193 ) ) ( not ( = ?auto_145187 ?auto_145196 ) ) ( not ( = ?auto_145188 ?auto_145189 ) ) ( not ( = ?auto_145188 ?auto_145190 ) ) ( not ( = ?auto_145188 ?auto_145191 ) ) ( not ( = ?auto_145188 ?auto_145192 ) ) ( not ( = ?auto_145188 ?auto_145193 ) ) ( not ( = ?auto_145188 ?auto_145196 ) ) ( not ( = ?auto_145189 ?auto_145190 ) ) ( not ( = ?auto_145189 ?auto_145191 ) ) ( not ( = ?auto_145189 ?auto_145192 ) ) ( not ( = ?auto_145189 ?auto_145193 ) ) ( not ( = ?auto_145189 ?auto_145196 ) ) ( not ( = ?auto_145190 ?auto_145191 ) ) ( not ( = ?auto_145190 ?auto_145192 ) ) ( not ( = ?auto_145190 ?auto_145193 ) ) ( not ( = ?auto_145190 ?auto_145196 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_145191 ?auto_145192 ?auto_145193 )
      ( MAKE-7CRATE-VERIFY ?auto_145186 ?auto_145187 ?auto_145188 ?auto_145189 ?auto_145190 ?auto_145191 ?auto_145192 ?auto_145193 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_145264 - SURFACE
      ?auto_145265 - SURFACE
      ?auto_145266 - SURFACE
      ?auto_145267 - SURFACE
      ?auto_145268 - SURFACE
      ?auto_145269 - SURFACE
      ?auto_145270 - SURFACE
      ?auto_145271 - SURFACE
    )
    :vars
    (
      ?auto_145273 - HOIST
      ?auto_145277 - PLACE
      ?auto_145276 - PLACE
      ?auto_145272 - HOIST
      ?auto_145274 - SURFACE
      ?auto_145275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_145273 ?auto_145277 ) ( SURFACE-AT ?auto_145270 ?auto_145277 ) ( CLEAR ?auto_145270 ) ( IS-CRATE ?auto_145271 ) ( not ( = ?auto_145270 ?auto_145271 ) ) ( AVAILABLE ?auto_145273 ) ( ON ?auto_145270 ?auto_145269 ) ( not ( = ?auto_145269 ?auto_145270 ) ) ( not ( = ?auto_145269 ?auto_145271 ) ) ( not ( = ?auto_145276 ?auto_145277 ) ) ( HOIST-AT ?auto_145272 ?auto_145276 ) ( not ( = ?auto_145273 ?auto_145272 ) ) ( AVAILABLE ?auto_145272 ) ( SURFACE-AT ?auto_145271 ?auto_145276 ) ( ON ?auto_145271 ?auto_145274 ) ( CLEAR ?auto_145271 ) ( not ( = ?auto_145270 ?auto_145274 ) ) ( not ( = ?auto_145271 ?auto_145274 ) ) ( not ( = ?auto_145269 ?auto_145274 ) ) ( TRUCK-AT ?auto_145275 ?auto_145277 ) ( ON ?auto_145265 ?auto_145264 ) ( ON ?auto_145266 ?auto_145265 ) ( ON ?auto_145267 ?auto_145266 ) ( ON ?auto_145268 ?auto_145267 ) ( ON ?auto_145269 ?auto_145268 ) ( not ( = ?auto_145264 ?auto_145265 ) ) ( not ( = ?auto_145264 ?auto_145266 ) ) ( not ( = ?auto_145264 ?auto_145267 ) ) ( not ( = ?auto_145264 ?auto_145268 ) ) ( not ( = ?auto_145264 ?auto_145269 ) ) ( not ( = ?auto_145264 ?auto_145270 ) ) ( not ( = ?auto_145264 ?auto_145271 ) ) ( not ( = ?auto_145264 ?auto_145274 ) ) ( not ( = ?auto_145265 ?auto_145266 ) ) ( not ( = ?auto_145265 ?auto_145267 ) ) ( not ( = ?auto_145265 ?auto_145268 ) ) ( not ( = ?auto_145265 ?auto_145269 ) ) ( not ( = ?auto_145265 ?auto_145270 ) ) ( not ( = ?auto_145265 ?auto_145271 ) ) ( not ( = ?auto_145265 ?auto_145274 ) ) ( not ( = ?auto_145266 ?auto_145267 ) ) ( not ( = ?auto_145266 ?auto_145268 ) ) ( not ( = ?auto_145266 ?auto_145269 ) ) ( not ( = ?auto_145266 ?auto_145270 ) ) ( not ( = ?auto_145266 ?auto_145271 ) ) ( not ( = ?auto_145266 ?auto_145274 ) ) ( not ( = ?auto_145267 ?auto_145268 ) ) ( not ( = ?auto_145267 ?auto_145269 ) ) ( not ( = ?auto_145267 ?auto_145270 ) ) ( not ( = ?auto_145267 ?auto_145271 ) ) ( not ( = ?auto_145267 ?auto_145274 ) ) ( not ( = ?auto_145268 ?auto_145269 ) ) ( not ( = ?auto_145268 ?auto_145270 ) ) ( not ( = ?auto_145268 ?auto_145271 ) ) ( not ( = ?auto_145268 ?auto_145274 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_145269 ?auto_145270 ?auto_145271 )
      ( MAKE-7CRATE-VERIFY ?auto_145264 ?auto_145265 ?auto_145266 ?auto_145267 ?auto_145268 ?auto_145269 ?auto_145270 ?auto_145271 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_145342 - SURFACE
      ?auto_145343 - SURFACE
      ?auto_145344 - SURFACE
      ?auto_145345 - SURFACE
      ?auto_145346 - SURFACE
      ?auto_145347 - SURFACE
      ?auto_145348 - SURFACE
      ?auto_145349 - SURFACE
    )
    :vars
    (
      ?auto_145354 - HOIST
      ?auto_145350 - PLACE
      ?auto_145353 - PLACE
      ?auto_145352 - HOIST
      ?auto_145351 - SURFACE
      ?auto_145355 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_145354 ?auto_145350 ) ( IS-CRATE ?auto_145349 ) ( not ( = ?auto_145348 ?auto_145349 ) ) ( not ( = ?auto_145347 ?auto_145348 ) ) ( not ( = ?auto_145347 ?auto_145349 ) ) ( not ( = ?auto_145353 ?auto_145350 ) ) ( HOIST-AT ?auto_145352 ?auto_145353 ) ( not ( = ?auto_145354 ?auto_145352 ) ) ( AVAILABLE ?auto_145352 ) ( SURFACE-AT ?auto_145349 ?auto_145353 ) ( ON ?auto_145349 ?auto_145351 ) ( CLEAR ?auto_145349 ) ( not ( = ?auto_145348 ?auto_145351 ) ) ( not ( = ?auto_145349 ?auto_145351 ) ) ( not ( = ?auto_145347 ?auto_145351 ) ) ( TRUCK-AT ?auto_145355 ?auto_145350 ) ( SURFACE-AT ?auto_145347 ?auto_145350 ) ( CLEAR ?auto_145347 ) ( LIFTING ?auto_145354 ?auto_145348 ) ( IS-CRATE ?auto_145348 ) ( ON ?auto_145343 ?auto_145342 ) ( ON ?auto_145344 ?auto_145343 ) ( ON ?auto_145345 ?auto_145344 ) ( ON ?auto_145346 ?auto_145345 ) ( ON ?auto_145347 ?auto_145346 ) ( not ( = ?auto_145342 ?auto_145343 ) ) ( not ( = ?auto_145342 ?auto_145344 ) ) ( not ( = ?auto_145342 ?auto_145345 ) ) ( not ( = ?auto_145342 ?auto_145346 ) ) ( not ( = ?auto_145342 ?auto_145347 ) ) ( not ( = ?auto_145342 ?auto_145348 ) ) ( not ( = ?auto_145342 ?auto_145349 ) ) ( not ( = ?auto_145342 ?auto_145351 ) ) ( not ( = ?auto_145343 ?auto_145344 ) ) ( not ( = ?auto_145343 ?auto_145345 ) ) ( not ( = ?auto_145343 ?auto_145346 ) ) ( not ( = ?auto_145343 ?auto_145347 ) ) ( not ( = ?auto_145343 ?auto_145348 ) ) ( not ( = ?auto_145343 ?auto_145349 ) ) ( not ( = ?auto_145343 ?auto_145351 ) ) ( not ( = ?auto_145344 ?auto_145345 ) ) ( not ( = ?auto_145344 ?auto_145346 ) ) ( not ( = ?auto_145344 ?auto_145347 ) ) ( not ( = ?auto_145344 ?auto_145348 ) ) ( not ( = ?auto_145344 ?auto_145349 ) ) ( not ( = ?auto_145344 ?auto_145351 ) ) ( not ( = ?auto_145345 ?auto_145346 ) ) ( not ( = ?auto_145345 ?auto_145347 ) ) ( not ( = ?auto_145345 ?auto_145348 ) ) ( not ( = ?auto_145345 ?auto_145349 ) ) ( not ( = ?auto_145345 ?auto_145351 ) ) ( not ( = ?auto_145346 ?auto_145347 ) ) ( not ( = ?auto_145346 ?auto_145348 ) ) ( not ( = ?auto_145346 ?auto_145349 ) ) ( not ( = ?auto_145346 ?auto_145351 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_145347 ?auto_145348 ?auto_145349 )
      ( MAKE-7CRATE-VERIFY ?auto_145342 ?auto_145343 ?auto_145344 ?auto_145345 ?auto_145346 ?auto_145347 ?auto_145348 ?auto_145349 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_145420 - SURFACE
      ?auto_145421 - SURFACE
      ?auto_145422 - SURFACE
      ?auto_145423 - SURFACE
      ?auto_145424 - SURFACE
      ?auto_145425 - SURFACE
      ?auto_145426 - SURFACE
      ?auto_145427 - SURFACE
    )
    :vars
    (
      ?auto_145431 - HOIST
      ?auto_145433 - PLACE
      ?auto_145428 - PLACE
      ?auto_145430 - HOIST
      ?auto_145429 - SURFACE
      ?auto_145432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_145431 ?auto_145433 ) ( IS-CRATE ?auto_145427 ) ( not ( = ?auto_145426 ?auto_145427 ) ) ( not ( = ?auto_145425 ?auto_145426 ) ) ( not ( = ?auto_145425 ?auto_145427 ) ) ( not ( = ?auto_145428 ?auto_145433 ) ) ( HOIST-AT ?auto_145430 ?auto_145428 ) ( not ( = ?auto_145431 ?auto_145430 ) ) ( AVAILABLE ?auto_145430 ) ( SURFACE-AT ?auto_145427 ?auto_145428 ) ( ON ?auto_145427 ?auto_145429 ) ( CLEAR ?auto_145427 ) ( not ( = ?auto_145426 ?auto_145429 ) ) ( not ( = ?auto_145427 ?auto_145429 ) ) ( not ( = ?auto_145425 ?auto_145429 ) ) ( TRUCK-AT ?auto_145432 ?auto_145433 ) ( SURFACE-AT ?auto_145425 ?auto_145433 ) ( CLEAR ?auto_145425 ) ( IS-CRATE ?auto_145426 ) ( AVAILABLE ?auto_145431 ) ( IN ?auto_145426 ?auto_145432 ) ( ON ?auto_145421 ?auto_145420 ) ( ON ?auto_145422 ?auto_145421 ) ( ON ?auto_145423 ?auto_145422 ) ( ON ?auto_145424 ?auto_145423 ) ( ON ?auto_145425 ?auto_145424 ) ( not ( = ?auto_145420 ?auto_145421 ) ) ( not ( = ?auto_145420 ?auto_145422 ) ) ( not ( = ?auto_145420 ?auto_145423 ) ) ( not ( = ?auto_145420 ?auto_145424 ) ) ( not ( = ?auto_145420 ?auto_145425 ) ) ( not ( = ?auto_145420 ?auto_145426 ) ) ( not ( = ?auto_145420 ?auto_145427 ) ) ( not ( = ?auto_145420 ?auto_145429 ) ) ( not ( = ?auto_145421 ?auto_145422 ) ) ( not ( = ?auto_145421 ?auto_145423 ) ) ( not ( = ?auto_145421 ?auto_145424 ) ) ( not ( = ?auto_145421 ?auto_145425 ) ) ( not ( = ?auto_145421 ?auto_145426 ) ) ( not ( = ?auto_145421 ?auto_145427 ) ) ( not ( = ?auto_145421 ?auto_145429 ) ) ( not ( = ?auto_145422 ?auto_145423 ) ) ( not ( = ?auto_145422 ?auto_145424 ) ) ( not ( = ?auto_145422 ?auto_145425 ) ) ( not ( = ?auto_145422 ?auto_145426 ) ) ( not ( = ?auto_145422 ?auto_145427 ) ) ( not ( = ?auto_145422 ?auto_145429 ) ) ( not ( = ?auto_145423 ?auto_145424 ) ) ( not ( = ?auto_145423 ?auto_145425 ) ) ( not ( = ?auto_145423 ?auto_145426 ) ) ( not ( = ?auto_145423 ?auto_145427 ) ) ( not ( = ?auto_145423 ?auto_145429 ) ) ( not ( = ?auto_145424 ?auto_145425 ) ) ( not ( = ?auto_145424 ?auto_145426 ) ) ( not ( = ?auto_145424 ?auto_145427 ) ) ( not ( = ?auto_145424 ?auto_145429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_145425 ?auto_145426 ?auto_145427 )
      ( MAKE-7CRATE-VERIFY ?auto_145420 ?auto_145421 ?auto_145422 ?auto_145423 ?auto_145424 ?auto_145425 ?auto_145426 ?auto_145427 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148300 - SURFACE
      ?auto_148301 - SURFACE
      ?auto_148302 - SURFACE
      ?auto_148303 - SURFACE
      ?auto_148304 - SURFACE
      ?auto_148305 - SURFACE
      ?auto_148306 - SURFACE
      ?auto_148307 - SURFACE
      ?auto_148308 - SURFACE
    )
    :vars
    (
      ?auto_148310 - HOIST
      ?auto_148309 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_148310 ?auto_148309 ) ( SURFACE-AT ?auto_148307 ?auto_148309 ) ( CLEAR ?auto_148307 ) ( LIFTING ?auto_148310 ?auto_148308 ) ( IS-CRATE ?auto_148308 ) ( not ( = ?auto_148307 ?auto_148308 ) ) ( ON ?auto_148301 ?auto_148300 ) ( ON ?auto_148302 ?auto_148301 ) ( ON ?auto_148303 ?auto_148302 ) ( ON ?auto_148304 ?auto_148303 ) ( ON ?auto_148305 ?auto_148304 ) ( ON ?auto_148306 ?auto_148305 ) ( ON ?auto_148307 ?auto_148306 ) ( not ( = ?auto_148300 ?auto_148301 ) ) ( not ( = ?auto_148300 ?auto_148302 ) ) ( not ( = ?auto_148300 ?auto_148303 ) ) ( not ( = ?auto_148300 ?auto_148304 ) ) ( not ( = ?auto_148300 ?auto_148305 ) ) ( not ( = ?auto_148300 ?auto_148306 ) ) ( not ( = ?auto_148300 ?auto_148307 ) ) ( not ( = ?auto_148300 ?auto_148308 ) ) ( not ( = ?auto_148301 ?auto_148302 ) ) ( not ( = ?auto_148301 ?auto_148303 ) ) ( not ( = ?auto_148301 ?auto_148304 ) ) ( not ( = ?auto_148301 ?auto_148305 ) ) ( not ( = ?auto_148301 ?auto_148306 ) ) ( not ( = ?auto_148301 ?auto_148307 ) ) ( not ( = ?auto_148301 ?auto_148308 ) ) ( not ( = ?auto_148302 ?auto_148303 ) ) ( not ( = ?auto_148302 ?auto_148304 ) ) ( not ( = ?auto_148302 ?auto_148305 ) ) ( not ( = ?auto_148302 ?auto_148306 ) ) ( not ( = ?auto_148302 ?auto_148307 ) ) ( not ( = ?auto_148302 ?auto_148308 ) ) ( not ( = ?auto_148303 ?auto_148304 ) ) ( not ( = ?auto_148303 ?auto_148305 ) ) ( not ( = ?auto_148303 ?auto_148306 ) ) ( not ( = ?auto_148303 ?auto_148307 ) ) ( not ( = ?auto_148303 ?auto_148308 ) ) ( not ( = ?auto_148304 ?auto_148305 ) ) ( not ( = ?auto_148304 ?auto_148306 ) ) ( not ( = ?auto_148304 ?auto_148307 ) ) ( not ( = ?auto_148304 ?auto_148308 ) ) ( not ( = ?auto_148305 ?auto_148306 ) ) ( not ( = ?auto_148305 ?auto_148307 ) ) ( not ( = ?auto_148305 ?auto_148308 ) ) ( not ( = ?auto_148306 ?auto_148307 ) ) ( not ( = ?auto_148306 ?auto_148308 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_148307 ?auto_148308 )
      ( MAKE-8CRATE-VERIFY ?auto_148300 ?auto_148301 ?auto_148302 ?auto_148303 ?auto_148304 ?auto_148305 ?auto_148306 ?auto_148307 ?auto_148308 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148367 - SURFACE
      ?auto_148368 - SURFACE
      ?auto_148369 - SURFACE
      ?auto_148370 - SURFACE
      ?auto_148371 - SURFACE
      ?auto_148372 - SURFACE
      ?auto_148373 - SURFACE
      ?auto_148374 - SURFACE
      ?auto_148375 - SURFACE
    )
    :vars
    (
      ?auto_148378 - HOIST
      ?auto_148377 - PLACE
      ?auto_148376 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_148378 ?auto_148377 ) ( SURFACE-AT ?auto_148374 ?auto_148377 ) ( CLEAR ?auto_148374 ) ( IS-CRATE ?auto_148375 ) ( not ( = ?auto_148374 ?auto_148375 ) ) ( TRUCK-AT ?auto_148376 ?auto_148377 ) ( AVAILABLE ?auto_148378 ) ( IN ?auto_148375 ?auto_148376 ) ( ON ?auto_148374 ?auto_148373 ) ( not ( = ?auto_148373 ?auto_148374 ) ) ( not ( = ?auto_148373 ?auto_148375 ) ) ( ON ?auto_148368 ?auto_148367 ) ( ON ?auto_148369 ?auto_148368 ) ( ON ?auto_148370 ?auto_148369 ) ( ON ?auto_148371 ?auto_148370 ) ( ON ?auto_148372 ?auto_148371 ) ( ON ?auto_148373 ?auto_148372 ) ( not ( = ?auto_148367 ?auto_148368 ) ) ( not ( = ?auto_148367 ?auto_148369 ) ) ( not ( = ?auto_148367 ?auto_148370 ) ) ( not ( = ?auto_148367 ?auto_148371 ) ) ( not ( = ?auto_148367 ?auto_148372 ) ) ( not ( = ?auto_148367 ?auto_148373 ) ) ( not ( = ?auto_148367 ?auto_148374 ) ) ( not ( = ?auto_148367 ?auto_148375 ) ) ( not ( = ?auto_148368 ?auto_148369 ) ) ( not ( = ?auto_148368 ?auto_148370 ) ) ( not ( = ?auto_148368 ?auto_148371 ) ) ( not ( = ?auto_148368 ?auto_148372 ) ) ( not ( = ?auto_148368 ?auto_148373 ) ) ( not ( = ?auto_148368 ?auto_148374 ) ) ( not ( = ?auto_148368 ?auto_148375 ) ) ( not ( = ?auto_148369 ?auto_148370 ) ) ( not ( = ?auto_148369 ?auto_148371 ) ) ( not ( = ?auto_148369 ?auto_148372 ) ) ( not ( = ?auto_148369 ?auto_148373 ) ) ( not ( = ?auto_148369 ?auto_148374 ) ) ( not ( = ?auto_148369 ?auto_148375 ) ) ( not ( = ?auto_148370 ?auto_148371 ) ) ( not ( = ?auto_148370 ?auto_148372 ) ) ( not ( = ?auto_148370 ?auto_148373 ) ) ( not ( = ?auto_148370 ?auto_148374 ) ) ( not ( = ?auto_148370 ?auto_148375 ) ) ( not ( = ?auto_148371 ?auto_148372 ) ) ( not ( = ?auto_148371 ?auto_148373 ) ) ( not ( = ?auto_148371 ?auto_148374 ) ) ( not ( = ?auto_148371 ?auto_148375 ) ) ( not ( = ?auto_148372 ?auto_148373 ) ) ( not ( = ?auto_148372 ?auto_148374 ) ) ( not ( = ?auto_148372 ?auto_148375 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148373 ?auto_148374 ?auto_148375 )
      ( MAKE-8CRATE-VERIFY ?auto_148367 ?auto_148368 ?auto_148369 ?auto_148370 ?auto_148371 ?auto_148372 ?auto_148373 ?auto_148374 ?auto_148375 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148443 - SURFACE
      ?auto_148444 - SURFACE
      ?auto_148445 - SURFACE
      ?auto_148446 - SURFACE
      ?auto_148447 - SURFACE
      ?auto_148448 - SURFACE
      ?auto_148449 - SURFACE
      ?auto_148450 - SURFACE
      ?auto_148451 - SURFACE
    )
    :vars
    (
      ?auto_148455 - HOIST
      ?auto_148452 - PLACE
      ?auto_148454 - TRUCK
      ?auto_148453 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_148455 ?auto_148452 ) ( SURFACE-AT ?auto_148450 ?auto_148452 ) ( CLEAR ?auto_148450 ) ( IS-CRATE ?auto_148451 ) ( not ( = ?auto_148450 ?auto_148451 ) ) ( AVAILABLE ?auto_148455 ) ( IN ?auto_148451 ?auto_148454 ) ( ON ?auto_148450 ?auto_148449 ) ( not ( = ?auto_148449 ?auto_148450 ) ) ( not ( = ?auto_148449 ?auto_148451 ) ) ( TRUCK-AT ?auto_148454 ?auto_148453 ) ( not ( = ?auto_148453 ?auto_148452 ) ) ( ON ?auto_148444 ?auto_148443 ) ( ON ?auto_148445 ?auto_148444 ) ( ON ?auto_148446 ?auto_148445 ) ( ON ?auto_148447 ?auto_148446 ) ( ON ?auto_148448 ?auto_148447 ) ( ON ?auto_148449 ?auto_148448 ) ( not ( = ?auto_148443 ?auto_148444 ) ) ( not ( = ?auto_148443 ?auto_148445 ) ) ( not ( = ?auto_148443 ?auto_148446 ) ) ( not ( = ?auto_148443 ?auto_148447 ) ) ( not ( = ?auto_148443 ?auto_148448 ) ) ( not ( = ?auto_148443 ?auto_148449 ) ) ( not ( = ?auto_148443 ?auto_148450 ) ) ( not ( = ?auto_148443 ?auto_148451 ) ) ( not ( = ?auto_148444 ?auto_148445 ) ) ( not ( = ?auto_148444 ?auto_148446 ) ) ( not ( = ?auto_148444 ?auto_148447 ) ) ( not ( = ?auto_148444 ?auto_148448 ) ) ( not ( = ?auto_148444 ?auto_148449 ) ) ( not ( = ?auto_148444 ?auto_148450 ) ) ( not ( = ?auto_148444 ?auto_148451 ) ) ( not ( = ?auto_148445 ?auto_148446 ) ) ( not ( = ?auto_148445 ?auto_148447 ) ) ( not ( = ?auto_148445 ?auto_148448 ) ) ( not ( = ?auto_148445 ?auto_148449 ) ) ( not ( = ?auto_148445 ?auto_148450 ) ) ( not ( = ?auto_148445 ?auto_148451 ) ) ( not ( = ?auto_148446 ?auto_148447 ) ) ( not ( = ?auto_148446 ?auto_148448 ) ) ( not ( = ?auto_148446 ?auto_148449 ) ) ( not ( = ?auto_148446 ?auto_148450 ) ) ( not ( = ?auto_148446 ?auto_148451 ) ) ( not ( = ?auto_148447 ?auto_148448 ) ) ( not ( = ?auto_148447 ?auto_148449 ) ) ( not ( = ?auto_148447 ?auto_148450 ) ) ( not ( = ?auto_148447 ?auto_148451 ) ) ( not ( = ?auto_148448 ?auto_148449 ) ) ( not ( = ?auto_148448 ?auto_148450 ) ) ( not ( = ?auto_148448 ?auto_148451 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148449 ?auto_148450 ?auto_148451 )
      ( MAKE-8CRATE-VERIFY ?auto_148443 ?auto_148444 ?auto_148445 ?auto_148446 ?auto_148447 ?auto_148448 ?auto_148449 ?auto_148450 ?auto_148451 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148527 - SURFACE
      ?auto_148528 - SURFACE
      ?auto_148529 - SURFACE
      ?auto_148530 - SURFACE
      ?auto_148531 - SURFACE
      ?auto_148532 - SURFACE
      ?auto_148533 - SURFACE
      ?auto_148534 - SURFACE
      ?auto_148535 - SURFACE
    )
    :vars
    (
      ?auto_148536 - HOIST
      ?auto_148537 - PLACE
      ?auto_148538 - TRUCK
      ?auto_148539 - PLACE
      ?auto_148540 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_148536 ?auto_148537 ) ( SURFACE-AT ?auto_148534 ?auto_148537 ) ( CLEAR ?auto_148534 ) ( IS-CRATE ?auto_148535 ) ( not ( = ?auto_148534 ?auto_148535 ) ) ( AVAILABLE ?auto_148536 ) ( ON ?auto_148534 ?auto_148533 ) ( not ( = ?auto_148533 ?auto_148534 ) ) ( not ( = ?auto_148533 ?auto_148535 ) ) ( TRUCK-AT ?auto_148538 ?auto_148539 ) ( not ( = ?auto_148539 ?auto_148537 ) ) ( HOIST-AT ?auto_148540 ?auto_148539 ) ( LIFTING ?auto_148540 ?auto_148535 ) ( not ( = ?auto_148536 ?auto_148540 ) ) ( ON ?auto_148528 ?auto_148527 ) ( ON ?auto_148529 ?auto_148528 ) ( ON ?auto_148530 ?auto_148529 ) ( ON ?auto_148531 ?auto_148530 ) ( ON ?auto_148532 ?auto_148531 ) ( ON ?auto_148533 ?auto_148532 ) ( not ( = ?auto_148527 ?auto_148528 ) ) ( not ( = ?auto_148527 ?auto_148529 ) ) ( not ( = ?auto_148527 ?auto_148530 ) ) ( not ( = ?auto_148527 ?auto_148531 ) ) ( not ( = ?auto_148527 ?auto_148532 ) ) ( not ( = ?auto_148527 ?auto_148533 ) ) ( not ( = ?auto_148527 ?auto_148534 ) ) ( not ( = ?auto_148527 ?auto_148535 ) ) ( not ( = ?auto_148528 ?auto_148529 ) ) ( not ( = ?auto_148528 ?auto_148530 ) ) ( not ( = ?auto_148528 ?auto_148531 ) ) ( not ( = ?auto_148528 ?auto_148532 ) ) ( not ( = ?auto_148528 ?auto_148533 ) ) ( not ( = ?auto_148528 ?auto_148534 ) ) ( not ( = ?auto_148528 ?auto_148535 ) ) ( not ( = ?auto_148529 ?auto_148530 ) ) ( not ( = ?auto_148529 ?auto_148531 ) ) ( not ( = ?auto_148529 ?auto_148532 ) ) ( not ( = ?auto_148529 ?auto_148533 ) ) ( not ( = ?auto_148529 ?auto_148534 ) ) ( not ( = ?auto_148529 ?auto_148535 ) ) ( not ( = ?auto_148530 ?auto_148531 ) ) ( not ( = ?auto_148530 ?auto_148532 ) ) ( not ( = ?auto_148530 ?auto_148533 ) ) ( not ( = ?auto_148530 ?auto_148534 ) ) ( not ( = ?auto_148530 ?auto_148535 ) ) ( not ( = ?auto_148531 ?auto_148532 ) ) ( not ( = ?auto_148531 ?auto_148533 ) ) ( not ( = ?auto_148531 ?auto_148534 ) ) ( not ( = ?auto_148531 ?auto_148535 ) ) ( not ( = ?auto_148532 ?auto_148533 ) ) ( not ( = ?auto_148532 ?auto_148534 ) ) ( not ( = ?auto_148532 ?auto_148535 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148533 ?auto_148534 ?auto_148535 )
      ( MAKE-8CRATE-VERIFY ?auto_148527 ?auto_148528 ?auto_148529 ?auto_148530 ?auto_148531 ?auto_148532 ?auto_148533 ?auto_148534 ?auto_148535 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148619 - SURFACE
      ?auto_148620 - SURFACE
      ?auto_148621 - SURFACE
      ?auto_148622 - SURFACE
      ?auto_148623 - SURFACE
      ?auto_148624 - SURFACE
      ?auto_148625 - SURFACE
      ?auto_148626 - SURFACE
      ?auto_148627 - SURFACE
    )
    :vars
    (
      ?auto_148633 - HOIST
      ?auto_148629 - PLACE
      ?auto_148631 - TRUCK
      ?auto_148628 - PLACE
      ?auto_148632 - HOIST
      ?auto_148630 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_148633 ?auto_148629 ) ( SURFACE-AT ?auto_148626 ?auto_148629 ) ( CLEAR ?auto_148626 ) ( IS-CRATE ?auto_148627 ) ( not ( = ?auto_148626 ?auto_148627 ) ) ( AVAILABLE ?auto_148633 ) ( ON ?auto_148626 ?auto_148625 ) ( not ( = ?auto_148625 ?auto_148626 ) ) ( not ( = ?auto_148625 ?auto_148627 ) ) ( TRUCK-AT ?auto_148631 ?auto_148628 ) ( not ( = ?auto_148628 ?auto_148629 ) ) ( HOIST-AT ?auto_148632 ?auto_148628 ) ( not ( = ?auto_148633 ?auto_148632 ) ) ( AVAILABLE ?auto_148632 ) ( SURFACE-AT ?auto_148627 ?auto_148628 ) ( ON ?auto_148627 ?auto_148630 ) ( CLEAR ?auto_148627 ) ( not ( = ?auto_148626 ?auto_148630 ) ) ( not ( = ?auto_148627 ?auto_148630 ) ) ( not ( = ?auto_148625 ?auto_148630 ) ) ( ON ?auto_148620 ?auto_148619 ) ( ON ?auto_148621 ?auto_148620 ) ( ON ?auto_148622 ?auto_148621 ) ( ON ?auto_148623 ?auto_148622 ) ( ON ?auto_148624 ?auto_148623 ) ( ON ?auto_148625 ?auto_148624 ) ( not ( = ?auto_148619 ?auto_148620 ) ) ( not ( = ?auto_148619 ?auto_148621 ) ) ( not ( = ?auto_148619 ?auto_148622 ) ) ( not ( = ?auto_148619 ?auto_148623 ) ) ( not ( = ?auto_148619 ?auto_148624 ) ) ( not ( = ?auto_148619 ?auto_148625 ) ) ( not ( = ?auto_148619 ?auto_148626 ) ) ( not ( = ?auto_148619 ?auto_148627 ) ) ( not ( = ?auto_148619 ?auto_148630 ) ) ( not ( = ?auto_148620 ?auto_148621 ) ) ( not ( = ?auto_148620 ?auto_148622 ) ) ( not ( = ?auto_148620 ?auto_148623 ) ) ( not ( = ?auto_148620 ?auto_148624 ) ) ( not ( = ?auto_148620 ?auto_148625 ) ) ( not ( = ?auto_148620 ?auto_148626 ) ) ( not ( = ?auto_148620 ?auto_148627 ) ) ( not ( = ?auto_148620 ?auto_148630 ) ) ( not ( = ?auto_148621 ?auto_148622 ) ) ( not ( = ?auto_148621 ?auto_148623 ) ) ( not ( = ?auto_148621 ?auto_148624 ) ) ( not ( = ?auto_148621 ?auto_148625 ) ) ( not ( = ?auto_148621 ?auto_148626 ) ) ( not ( = ?auto_148621 ?auto_148627 ) ) ( not ( = ?auto_148621 ?auto_148630 ) ) ( not ( = ?auto_148622 ?auto_148623 ) ) ( not ( = ?auto_148622 ?auto_148624 ) ) ( not ( = ?auto_148622 ?auto_148625 ) ) ( not ( = ?auto_148622 ?auto_148626 ) ) ( not ( = ?auto_148622 ?auto_148627 ) ) ( not ( = ?auto_148622 ?auto_148630 ) ) ( not ( = ?auto_148623 ?auto_148624 ) ) ( not ( = ?auto_148623 ?auto_148625 ) ) ( not ( = ?auto_148623 ?auto_148626 ) ) ( not ( = ?auto_148623 ?auto_148627 ) ) ( not ( = ?auto_148623 ?auto_148630 ) ) ( not ( = ?auto_148624 ?auto_148625 ) ) ( not ( = ?auto_148624 ?auto_148626 ) ) ( not ( = ?auto_148624 ?auto_148627 ) ) ( not ( = ?auto_148624 ?auto_148630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148625 ?auto_148626 ?auto_148627 )
      ( MAKE-8CRATE-VERIFY ?auto_148619 ?auto_148620 ?auto_148621 ?auto_148622 ?auto_148623 ?auto_148624 ?auto_148625 ?auto_148626 ?auto_148627 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148712 - SURFACE
      ?auto_148713 - SURFACE
      ?auto_148714 - SURFACE
      ?auto_148715 - SURFACE
      ?auto_148716 - SURFACE
      ?auto_148717 - SURFACE
      ?auto_148718 - SURFACE
      ?auto_148719 - SURFACE
      ?auto_148720 - SURFACE
    )
    :vars
    (
      ?auto_148721 - HOIST
      ?auto_148725 - PLACE
      ?auto_148723 - PLACE
      ?auto_148724 - HOIST
      ?auto_148722 - SURFACE
      ?auto_148726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_148721 ?auto_148725 ) ( SURFACE-AT ?auto_148719 ?auto_148725 ) ( CLEAR ?auto_148719 ) ( IS-CRATE ?auto_148720 ) ( not ( = ?auto_148719 ?auto_148720 ) ) ( AVAILABLE ?auto_148721 ) ( ON ?auto_148719 ?auto_148718 ) ( not ( = ?auto_148718 ?auto_148719 ) ) ( not ( = ?auto_148718 ?auto_148720 ) ) ( not ( = ?auto_148723 ?auto_148725 ) ) ( HOIST-AT ?auto_148724 ?auto_148723 ) ( not ( = ?auto_148721 ?auto_148724 ) ) ( AVAILABLE ?auto_148724 ) ( SURFACE-AT ?auto_148720 ?auto_148723 ) ( ON ?auto_148720 ?auto_148722 ) ( CLEAR ?auto_148720 ) ( not ( = ?auto_148719 ?auto_148722 ) ) ( not ( = ?auto_148720 ?auto_148722 ) ) ( not ( = ?auto_148718 ?auto_148722 ) ) ( TRUCK-AT ?auto_148726 ?auto_148725 ) ( ON ?auto_148713 ?auto_148712 ) ( ON ?auto_148714 ?auto_148713 ) ( ON ?auto_148715 ?auto_148714 ) ( ON ?auto_148716 ?auto_148715 ) ( ON ?auto_148717 ?auto_148716 ) ( ON ?auto_148718 ?auto_148717 ) ( not ( = ?auto_148712 ?auto_148713 ) ) ( not ( = ?auto_148712 ?auto_148714 ) ) ( not ( = ?auto_148712 ?auto_148715 ) ) ( not ( = ?auto_148712 ?auto_148716 ) ) ( not ( = ?auto_148712 ?auto_148717 ) ) ( not ( = ?auto_148712 ?auto_148718 ) ) ( not ( = ?auto_148712 ?auto_148719 ) ) ( not ( = ?auto_148712 ?auto_148720 ) ) ( not ( = ?auto_148712 ?auto_148722 ) ) ( not ( = ?auto_148713 ?auto_148714 ) ) ( not ( = ?auto_148713 ?auto_148715 ) ) ( not ( = ?auto_148713 ?auto_148716 ) ) ( not ( = ?auto_148713 ?auto_148717 ) ) ( not ( = ?auto_148713 ?auto_148718 ) ) ( not ( = ?auto_148713 ?auto_148719 ) ) ( not ( = ?auto_148713 ?auto_148720 ) ) ( not ( = ?auto_148713 ?auto_148722 ) ) ( not ( = ?auto_148714 ?auto_148715 ) ) ( not ( = ?auto_148714 ?auto_148716 ) ) ( not ( = ?auto_148714 ?auto_148717 ) ) ( not ( = ?auto_148714 ?auto_148718 ) ) ( not ( = ?auto_148714 ?auto_148719 ) ) ( not ( = ?auto_148714 ?auto_148720 ) ) ( not ( = ?auto_148714 ?auto_148722 ) ) ( not ( = ?auto_148715 ?auto_148716 ) ) ( not ( = ?auto_148715 ?auto_148717 ) ) ( not ( = ?auto_148715 ?auto_148718 ) ) ( not ( = ?auto_148715 ?auto_148719 ) ) ( not ( = ?auto_148715 ?auto_148720 ) ) ( not ( = ?auto_148715 ?auto_148722 ) ) ( not ( = ?auto_148716 ?auto_148717 ) ) ( not ( = ?auto_148716 ?auto_148718 ) ) ( not ( = ?auto_148716 ?auto_148719 ) ) ( not ( = ?auto_148716 ?auto_148720 ) ) ( not ( = ?auto_148716 ?auto_148722 ) ) ( not ( = ?auto_148717 ?auto_148718 ) ) ( not ( = ?auto_148717 ?auto_148719 ) ) ( not ( = ?auto_148717 ?auto_148720 ) ) ( not ( = ?auto_148717 ?auto_148722 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148718 ?auto_148719 ?auto_148720 )
      ( MAKE-8CRATE-VERIFY ?auto_148712 ?auto_148713 ?auto_148714 ?auto_148715 ?auto_148716 ?auto_148717 ?auto_148718 ?auto_148719 ?auto_148720 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148805 - SURFACE
      ?auto_148806 - SURFACE
      ?auto_148807 - SURFACE
      ?auto_148808 - SURFACE
      ?auto_148809 - SURFACE
      ?auto_148810 - SURFACE
      ?auto_148811 - SURFACE
      ?auto_148812 - SURFACE
      ?auto_148813 - SURFACE
    )
    :vars
    (
      ?auto_148814 - HOIST
      ?auto_148816 - PLACE
      ?auto_148817 - PLACE
      ?auto_148819 - HOIST
      ?auto_148815 - SURFACE
      ?auto_148818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_148814 ?auto_148816 ) ( IS-CRATE ?auto_148813 ) ( not ( = ?auto_148812 ?auto_148813 ) ) ( not ( = ?auto_148811 ?auto_148812 ) ) ( not ( = ?auto_148811 ?auto_148813 ) ) ( not ( = ?auto_148817 ?auto_148816 ) ) ( HOIST-AT ?auto_148819 ?auto_148817 ) ( not ( = ?auto_148814 ?auto_148819 ) ) ( AVAILABLE ?auto_148819 ) ( SURFACE-AT ?auto_148813 ?auto_148817 ) ( ON ?auto_148813 ?auto_148815 ) ( CLEAR ?auto_148813 ) ( not ( = ?auto_148812 ?auto_148815 ) ) ( not ( = ?auto_148813 ?auto_148815 ) ) ( not ( = ?auto_148811 ?auto_148815 ) ) ( TRUCK-AT ?auto_148818 ?auto_148816 ) ( SURFACE-AT ?auto_148811 ?auto_148816 ) ( CLEAR ?auto_148811 ) ( LIFTING ?auto_148814 ?auto_148812 ) ( IS-CRATE ?auto_148812 ) ( ON ?auto_148806 ?auto_148805 ) ( ON ?auto_148807 ?auto_148806 ) ( ON ?auto_148808 ?auto_148807 ) ( ON ?auto_148809 ?auto_148808 ) ( ON ?auto_148810 ?auto_148809 ) ( ON ?auto_148811 ?auto_148810 ) ( not ( = ?auto_148805 ?auto_148806 ) ) ( not ( = ?auto_148805 ?auto_148807 ) ) ( not ( = ?auto_148805 ?auto_148808 ) ) ( not ( = ?auto_148805 ?auto_148809 ) ) ( not ( = ?auto_148805 ?auto_148810 ) ) ( not ( = ?auto_148805 ?auto_148811 ) ) ( not ( = ?auto_148805 ?auto_148812 ) ) ( not ( = ?auto_148805 ?auto_148813 ) ) ( not ( = ?auto_148805 ?auto_148815 ) ) ( not ( = ?auto_148806 ?auto_148807 ) ) ( not ( = ?auto_148806 ?auto_148808 ) ) ( not ( = ?auto_148806 ?auto_148809 ) ) ( not ( = ?auto_148806 ?auto_148810 ) ) ( not ( = ?auto_148806 ?auto_148811 ) ) ( not ( = ?auto_148806 ?auto_148812 ) ) ( not ( = ?auto_148806 ?auto_148813 ) ) ( not ( = ?auto_148806 ?auto_148815 ) ) ( not ( = ?auto_148807 ?auto_148808 ) ) ( not ( = ?auto_148807 ?auto_148809 ) ) ( not ( = ?auto_148807 ?auto_148810 ) ) ( not ( = ?auto_148807 ?auto_148811 ) ) ( not ( = ?auto_148807 ?auto_148812 ) ) ( not ( = ?auto_148807 ?auto_148813 ) ) ( not ( = ?auto_148807 ?auto_148815 ) ) ( not ( = ?auto_148808 ?auto_148809 ) ) ( not ( = ?auto_148808 ?auto_148810 ) ) ( not ( = ?auto_148808 ?auto_148811 ) ) ( not ( = ?auto_148808 ?auto_148812 ) ) ( not ( = ?auto_148808 ?auto_148813 ) ) ( not ( = ?auto_148808 ?auto_148815 ) ) ( not ( = ?auto_148809 ?auto_148810 ) ) ( not ( = ?auto_148809 ?auto_148811 ) ) ( not ( = ?auto_148809 ?auto_148812 ) ) ( not ( = ?auto_148809 ?auto_148813 ) ) ( not ( = ?auto_148809 ?auto_148815 ) ) ( not ( = ?auto_148810 ?auto_148811 ) ) ( not ( = ?auto_148810 ?auto_148812 ) ) ( not ( = ?auto_148810 ?auto_148813 ) ) ( not ( = ?auto_148810 ?auto_148815 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148811 ?auto_148812 ?auto_148813 )
      ( MAKE-8CRATE-VERIFY ?auto_148805 ?auto_148806 ?auto_148807 ?auto_148808 ?auto_148809 ?auto_148810 ?auto_148811 ?auto_148812 ?auto_148813 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_148898 - SURFACE
      ?auto_148899 - SURFACE
      ?auto_148900 - SURFACE
      ?auto_148901 - SURFACE
      ?auto_148902 - SURFACE
      ?auto_148903 - SURFACE
      ?auto_148904 - SURFACE
      ?auto_148905 - SURFACE
      ?auto_148906 - SURFACE
    )
    :vars
    (
      ?auto_148909 - HOIST
      ?auto_148910 - PLACE
      ?auto_148911 - PLACE
      ?auto_148907 - HOIST
      ?auto_148908 - SURFACE
      ?auto_148912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_148909 ?auto_148910 ) ( IS-CRATE ?auto_148906 ) ( not ( = ?auto_148905 ?auto_148906 ) ) ( not ( = ?auto_148904 ?auto_148905 ) ) ( not ( = ?auto_148904 ?auto_148906 ) ) ( not ( = ?auto_148911 ?auto_148910 ) ) ( HOIST-AT ?auto_148907 ?auto_148911 ) ( not ( = ?auto_148909 ?auto_148907 ) ) ( AVAILABLE ?auto_148907 ) ( SURFACE-AT ?auto_148906 ?auto_148911 ) ( ON ?auto_148906 ?auto_148908 ) ( CLEAR ?auto_148906 ) ( not ( = ?auto_148905 ?auto_148908 ) ) ( not ( = ?auto_148906 ?auto_148908 ) ) ( not ( = ?auto_148904 ?auto_148908 ) ) ( TRUCK-AT ?auto_148912 ?auto_148910 ) ( SURFACE-AT ?auto_148904 ?auto_148910 ) ( CLEAR ?auto_148904 ) ( IS-CRATE ?auto_148905 ) ( AVAILABLE ?auto_148909 ) ( IN ?auto_148905 ?auto_148912 ) ( ON ?auto_148899 ?auto_148898 ) ( ON ?auto_148900 ?auto_148899 ) ( ON ?auto_148901 ?auto_148900 ) ( ON ?auto_148902 ?auto_148901 ) ( ON ?auto_148903 ?auto_148902 ) ( ON ?auto_148904 ?auto_148903 ) ( not ( = ?auto_148898 ?auto_148899 ) ) ( not ( = ?auto_148898 ?auto_148900 ) ) ( not ( = ?auto_148898 ?auto_148901 ) ) ( not ( = ?auto_148898 ?auto_148902 ) ) ( not ( = ?auto_148898 ?auto_148903 ) ) ( not ( = ?auto_148898 ?auto_148904 ) ) ( not ( = ?auto_148898 ?auto_148905 ) ) ( not ( = ?auto_148898 ?auto_148906 ) ) ( not ( = ?auto_148898 ?auto_148908 ) ) ( not ( = ?auto_148899 ?auto_148900 ) ) ( not ( = ?auto_148899 ?auto_148901 ) ) ( not ( = ?auto_148899 ?auto_148902 ) ) ( not ( = ?auto_148899 ?auto_148903 ) ) ( not ( = ?auto_148899 ?auto_148904 ) ) ( not ( = ?auto_148899 ?auto_148905 ) ) ( not ( = ?auto_148899 ?auto_148906 ) ) ( not ( = ?auto_148899 ?auto_148908 ) ) ( not ( = ?auto_148900 ?auto_148901 ) ) ( not ( = ?auto_148900 ?auto_148902 ) ) ( not ( = ?auto_148900 ?auto_148903 ) ) ( not ( = ?auto_148900 ?auto_148904 ) ) ( not ( = ?auto_148900 ?auto_148905 ) ) ( not ( = ?auto_148900 ?auto_148906 ) ) ( not ( = ?auto_148900 ?auto_148908 ) ) ( not ( = ?auto_148901 ?auto_148902 ) ) ( not ( = ?auto_148901 ?auto_148903 ) ) ( not ( = ?auto_148901 ?auto_148904 ) ) ( not ( = ?auto_148901 ?auto_148905 ) ) ( not ( = ?auto_148901 ?auto_148906 ) ) ( not ( = ?auto_148901 ?auto_148908 ) ) ( not ( = ?auto_148902 ?auto_148903 ) ) ( not ( = ?auto_148902 ?auto_148904 ) ) ( not ( = ?auto_148902 ?auto_148905 ) ) ( not ( = ?auto_148902 ?auto_148906 ) ) ( not ( = ?auto_148902 ?auto_148908 ) ) ( not ( = ?auto_148903 ?auto_148904 ) ) ( not ( = ?auto_148903 ?auto_148905 ) ) ( not ( = ?auto_148903 ?auto_148906 ) ) ( not ( = ?auto_148903 ?auto_148908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_148904 ?auto_148905 ?auto_148906 )
      ( MAKE-8CRATE-VERIFY ?auto_148898 ?auto_148899 ?auto_148900 ?auto_148901 ?auto_148902 ?auto_148903 ?auto_148904 ?auto_148905 ?auto_148906 ) )
  )

)

