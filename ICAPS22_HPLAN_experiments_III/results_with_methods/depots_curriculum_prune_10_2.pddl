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
      ?auto_7434 - SURFACE
      ?auto_7435 - SURFACE
    )
    :vars
    (
      ?auto_7436 - HOIST
      ?auto_7437 - PLACE
      ?auto_7439 - PLACE
      ?auto_7440 - HOIST
      ?auto_7441 - SURFACE
      ?auto_7438 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7436 ?auto_7437 ) ( SURFACE-AT ?auto_7434 ?auto_7437 ) ( CLEAR ?auto_7434 ) ( IS-CRATE ?auto_7435 ) ( AVAILABLE ?auto_7436 ) ( not ( = ?auto_7439 ?auto_7437 ) ) ( HOIST-AT ?auto_7440 ?auto_7439 ) ( AVAILABLE ?auto_7440 ) ( SURFACE-AT ?auto_7435 ?auto_7439 ) ( ON ?auto_7435 ?auto_7441 ) ( CLEAR ?auto_7435 ) ( TRUCK-AT ?auto_7438 ?auto_7437 ) ( not ( = ?auto_7434 ?auto_7435 ) ) ( not ( = ?auto_7434 ?auto_7441 ) ) ( not ( = ?auto_7435 ?auto_7441 ) ) ( not ( = ?auto_7436 ?auto_7440 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7438 ?auto_7437 ?auto_7439 )
      ( !LIFT ?auto_7440 ?auto_7435 ?auto_7441 ?auto_7439 )
      ( !LOAD ?auto_7440 ?auto_7435 ?auto_7438 ?auto_7439 )
      ( !DRIVE ?auto_7438 ?auto_7439 ?auto_7437 )
      ( !UNLOAD ?auto_7436 ?auto_7435 ?auto_7438 ?auto_7437 )
      ( !DROP ?auto_7436 ?auto_7435 ?auto_7434 ?auto_7437 )
      ( MAKE-1CRATE-VERIFY ?auto_7434 ?auto_7435 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7455 - SURFACE
      ?auto_7456 - SURFACE
      ?auto_7457 - SURFACE
    )
    :vars
    (
      ?auto_7462 - HOIST
      ?auto_7459 - PLACE
      ?auto_7458 - PLACE
      ?auto_7463 - HOIST
      ?auto_7460 - SURFACE
      ?auto_7466 - PLACE
      ?auto_7464 - HOIST
      ?auto_7465 - SURFACE
      ?auto_7461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7462 ?auto_7459 ) ( IS-CRATE ?auto_7457 ) ( not ( = ?auto_7458 ?auto_7459 ) ) ( HOIST-AT ?auto_7463 ?auto_7458 ) ( AVAILABLE ?auto_7463 ) ( SURFACE-AT ?auto_7457 ?auto_7458 ) ( ON ?auto_7457 ?auto_7460 ) ( CLEAR ?auto_7457 ) ( not ( = ?auto_7456 ?auto_7457 ) ) ( not ( = ?auto_7456 ?auto_7460 ) ) ( not ( = ?auto_7457 ?auto_7460 ) ) ( not ( = ?auto_7462 ?auto_7463 ) ) ( SURFACE-AT ?auto_7455 ?auto_7459 ) ( CLEAR ?auto_7455 ) ( IS-CRATE ?auto_7456 ) ( AVAILABLE ?auto_7462 ) ( not ( = ?auto_7466 ?auto_7459 ) ) ( HOIST-AT ?auto_7464 ?auto_7466 ) ( AVAILABLE ?auto_7464 ) ( SURFACE-AT ?auto_7456 ?auto_7466 ) ( ON ?auto_7456 ?auto_7465 ) ( CLEAR ?auto_7456 ) ( TRUCK-AT ?auto_7461 ?auto_7459 ) ( not ( = ?auto_7455 ?auto_7456 ) ) ( not ( = ?auto_7455 ?auto_7465 ) ) ( not ( = ?auto_7456 ?auto_7465 ) ) ( not ( = ?auto_7462 ?auto_7464 ) ) ( not ( = ?auto_7455 ?auto_7457 ) ) ( not ( = ?auto_7455 ?auto_7460 ) ) ( not ( = ?auto_7457 ?auto_7465 ) ) ( not ( = ?auto_7458 ?auto_7466 ) ) ( not ( = ?auto_7463 ?auto_7464 ) ) ( not ( = ?auto_7460 ?auto_7465 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7455 ?auto_7456 )
      ( MAKE-1CRATE ?auto_7456 ?auto_7457 )
      ( MAKE-2CRATE-VERIFY ?auto_7455 ?auto_7456 ?auto_7457 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7481 - SURFACE
      ?auto_7482 - SURFACE
      ?auto_7483 - SURFACE
      ?auto_7484 - SURFACE
    )
    :vars
    (
      ?auto_7486 - HOIST
      ?auto_7487 - PLACE
      ?auto_7488 - PLACE
      ?auto_7490 - HOIST
      ?auto_7489 - SURFACE
      ?auto_7495 - PLACE
      ?auto_7491 - HOIST
      ?auto_7494 - SURFACE
      ?auto_7492 - PLACE
      ?auto_7496 - HOIST
      ?auto_7493 - SURFACE
      ?auto_7485 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7486 ?auto_7487 ) ( IS-CRATE ?auto_7484 ) ( not ( = ?auto_7488 ?auto_7487 ) ) ( HOIST-AT ?auto_7490 ?auto_7488 ) ( AVAILABLE ?auto_7490 ) ( SURFACE-AT ?auto_7484 ?auto_7488 ) ( ON ?auto_7484 ?auto_7489 ) ( CLEAR ?auto_7484 ) ( not ( = ?auto_7483 ?auto_7484 ) ) ( not ( = ?auto_7483 ?auto_7489 ) ) ( not ( = ?auto_7484 ?auto_7489 ) ) ( not ( = ?auto_7486 ?auto_7490 ) ) ( IS-CRATE ?auto_7483 ) ( not ( = ?auto_7495 ?auto_7487 ) ) ( HOIST-AT ?auto_7491 ?auto_7495 ) ( AVAILABLE ?auto_7491 ) ( SURFACE-AT ?auto_7483 ?auto_7495 ) ( ON ?auto_7483 ?auto_7494 ) ( CLEAR ?auto_7483 ) ( not ( = ?auto_7482 ?auto_7483 ) ) ( not ( = ?auto_7482 ?auto_7494 ) ) ( not ( = ?auto_7483 ?auto_7494 ) ) ( not ( = ?auto_7486 ?auto_7491 ) ) ( SURFACE-AT ?auto_7481 ?auto_7487 ) ( CLEAR ?auto_7481 ) ( IS-CRATE ?auto_7482 ) ( AVAILABLE ?auto_7486 ) ( not ( = ?auto_7492 ?auto_7487 ) ) ( HOIST-AT ?auto_7496 ?auto_7492 ) ( AVAILABLE ?auto_7496 ) ( SURFACE-AT ?auto_7482 ?auto_7492 ) ( ON ?auto_7482 ?auto_7493 ) ( CLEAR ?auto_7482 ) ( TRUCK-AT ?auto_7485 ?auto_7487 ) ( not ( = ?auto_7481 ?auto_7482 ) ) ( not ( = ?auto_7481 ?auto_7493 ) ) ( not ( = ?auto_7482 ?auto_7493 ) ) ( not ( = ?auto_7486 ?auto_7496 ) ) ( not ( = ?auto_7481 ?auto_7483 ) ) ( not ( = ?auto_7481 ?auto_7494 ) ) ( not ( = ?auto_7483 ?auto_7493 ) ) ( not ( = ?auto_7495 ?auto_7492 ) ) ( not ( = ?auto_7491 ?auto_7496 ) ) ( not ( = ?auto_7494 ?auto_7493 ) ) ( not ( = ?auto_7481 ?auto_7484 ) ) ( not ( = ?auto_7481 ?auto_7489 ) ) ( not ( = ?auto_7482 ?auto_7484 ) ) ( not ( = ?auto_7482 ?auto_7489 ) ) ( not ( = ?auto_7484 ?auto_7494 ) ) ( not ( = ?auto_7484 ?auto_7493 ) ) ( not ( = ?auto_7488 ?auto_7495 ) ) ( not ( = ?auto_7488 ?auto_7492 ) ) ( not ( = ?auto_7490 ?auto_7491 ) ) ( not ( = ?auto_7490 ?auto_7496 ) ) ( not ( = ?auto_7489 ?auto_7494 ) ) ( not ( = ?auto_7489 ?auto_7493 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7481 ?auto_7482 ?auto_7483 )
      ( MAKE-1CRATE ?auto_7483 ?auto_7484 )
      ( MAKE-3CRATE-VERIFY ?auto_7481 ?auto_7482 ?auto_7483 ?auto_7484 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7512 - SURFACE
      ?auto_7513 - SURFACE
      ?auto_7514 - SURFACE
      ?auto_7515 - SURFACE
      ?auto_7516 - SURFACE
    )
    :vars
    (
      ?auto_7520 - HOIST
      ?auto_7519 - PLACE
      ?auto_7522 - PLACE
      ?auto_7517 - HOIST
      ?auto_7518 - SURFACE
      ?auto_7529 - PLACE
      ?auto_7530 - HOIST
      ?auto_7528 - SURFACE
      ?auto_7525 - PLACE
      ?auto_7527 - HOIST
      ?auto_7524 - SURFACE
      ?auto_7523 - PLACE
      ?auto_7531 - HOIST
      ?auto_7526 - SURFACE
      ?auto_7521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7520 ?auto_7519 ) ( IS-CRATE ?auto_7516 ) ( not ( = ?auto_7522 ?auto_7519 ) ) ( HOIST-AT ?auto_7517 ?auto_7522 ) ( AVAILABLE ?auto_7517 ) ( SURFACE-AT ?auto_7516 ?auto_7522 ) ( ON ?auto_7516 ?auto_7518 ) ( CLEAR ?auto_7516 ) ( not ( = ?auto_7515 ?auto_7516 ) ) ( not ( = ?auto_7515 ?auto_7518 ) ) ( not ( = ?auto_7516 ?auto_7518 ) ) ( not ( = ?auto_7520 ?auto_7517 ) ) ( IS-CRATE ?auto_7515 ) ( not ( = ?auto_7529 ?auto_7519 ) ) ( HOIST-AT ?auto_7530 ?auto_7529 ) ( AVAILABLE ?auto_7530 ) ( SURFACE-AT ?auto_7515 ?auto_7529 ) ( ON ?auto_7515 ?auto_7528 ) ( CLEAR ?auto_7515 ) ( not ( = ?auto_7514 ?auto_7515 ) ) ( not ( = ?auto_7514 ?auto_7528 ) ) ( not ( = ?auto_7515 ?auto_7528 ) ) ( not ( = ?auto_7520 ?auto_7530 ) ) ( IS-CRATE ?auto_7514 ) ( not ( = ?auto_7525 ?auto_7519 ) ) ( HOIST-AT ?auto_7527 ?auto_7525 ) ( AVAILABLE ?auto_7527 ) ( SURFACE-AT ?auto_7514 ?auto_7525 ) ( ON ?auto_7514 ?auto_7524 ) ( CLEAR ?auto_7514 ) ( not ( = ?auto_7513 ?auto_7514 ) ) ( not ( = ?auto_7513 ?auto_7524 ) ) ( not ( = ?auto_7514 ?auto_7524 ) ) ( not ( = ?auto_7520 ?auto_7527 ) ) ( SURFACE-AT ?auto_7512 ?auto_7519 ) ( CLEAR ?auto_7512 ) ( IS-CRATE ?auto_7513 ) ( AVAILABLE ?auto_7520 ) ( not ( = ?auto_7523 ?auto_7519 ) ) ( HOIST-AT ?auto_7531 ?auto_7523 ) ( AVAILABLE ?auto_7531 ) ( SURFACE-AT ?auto_7513 ?auto_7523 ) ( ON ?auto_7513 ?auto_7526 ) ( CLEAR ?auto_7513 ) ( TRUCK-AT ?auto_7521 ?auto_7519 ) ( not ( = ?auto_7512 ?auto_7513 ) ) ( not ( = ?auto_7512 ?auto_7526 ) ) ( not ( = ?auto_7513 ?auto_7526 ) ) ( not ( = ?auto_7520 ?auto_7531 ) ) ( not ( = ?auto_7512 ?auto_7514 ) ) ( not ( = ?auto_7512 ?auto_7524 ) ) ( not ( = ?auto_7514 ?auto_7526 ) ) ( not ( = ?auto_7525 ?auto_7523 ) ) ( not ( = ?auto_7527 ?auto_7531 ) ) ( not ( = ?auto_7524 ?auto_7526 ) ) ( not ( = ?auto_7512 ?auto_7515 ) ) ( not ( = ?auto_7512 ?auto_7528 ) ) ( not ( = ?auto_7513 ?auto_7515 ) ) ( not ( = ?auto_7513 ?auto_7528 ) ) ( not ( = ?auto_7515 ?auto_7524 ) ) ( not ( = ?auto_7515 ?auto_7526 ) ) ( not ( = ?auto_7529 ?auto_7525 ) ) ( not ( = ?auto_7529 ?auto_7523 ) ) ( not ( = ?auto_7530 ?auto_7527 ) ) ( not ( = ?auto_7530 ?auto_7531 ) ) ( not ( = ?auto_7528 ?auto_7524 ) ) ( not ( = ?auto_7528 ?auto_7526 ) ) ( not ( = ?auto_7512 ?auto_7516 ) ) ( not ( = ?auto_7512 ?auto_7518 ) ) ( not ( = ?auto_7513 ?auto_7516 ) ) ( not ( = ?auto_7513 ?auto_7518 ) ) ( not ( = ?auto_7514 ?auto_7516 ) ) ( not ( = ?auto_7514 ?auto_7518 ) ) ( not ( = ?auto_7516 ?auto_7528 ) ) ( not ( = ?auto_7516 ?auto_7524 ) ) ( not ( = ?auto_7516 ?auto_7526 ) ) ( not ( = ?auto_7522 ?auto_7529 ) ) ( not ( = ?auto_7522 ?auto_7525 ) ) ( not ( = ?auto_7522 ?auto_7523 ) ) ( not ( = ?auto_7517 ?auto_7530 ) ) ( not ( = ?auto_7517 ?auto_7527 ) ) ( not ( = ?auto_7517 ?auto_7531 ) ) ( not ( = ?auto_7518 ?auto_7528 ) ) ( not ( = ?auto_7518 ?auto_7524 ) ) ( not ( = ?auto_7518 ?auto_7526 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_7512 ?auto_7513 ?auto_7514 ?auto_7515 )
      ( MAKE-1CRATE ?auto_7515 ?auto_7516 )
      ( MAKE-4CRATE-VERIFY ?auto_7512 ?auto_7513 ?auto_7514 ?auto_7515 ?auto_7516 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_7548 - SURFACE
      ?auto_7549 - SURFACE
      ?auto_7550 - SURFACE
      ?auto_7551 - SURFACE
      ?auto_7552 - SURFACE
      ?auto_7553 - SURFACE
    )
    :vars
    (
      ?auto_7555 - HOIST
      ?auto_7557 - PLACE
      ?auto_7559 - PLACE
      ?auto_7556 - HOIST
      ?auto_7558 - SURFACE
      ?auto_7566 - PLACE
      ?auto_7568 - HOIST
      ?auto_7569 - SURFACE
      ?auto_7565 - PLACE
      ?auto_7562 - HOIST
      ?auto_7564 - SURFACE
      ?auto_7570 - PLACE
      ?auto_7563 - HOIST
      ?auto_7560 - SURFACE
      ?auto_7561 - PLACE
      ?auto_7571 - HOIST
      ?auto_7567 - SURFACE
      ?auto_7554 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7555 ?auto_7557 ) ( IS-CRATE ?auto_7553 ) ( not ( = ?auto_7559 ?auto_7557 ) ) ( HOIST-AT ?auto_7556 ?auto_7559 ) ( AVAILABLE ?auto_7556 ) ( SURFACE-AT ?auto_7553 ?auto_7559 ) ( ON ?auto_7553 ?auto_7558 ) ( CLEAR ?auto_7553 ) ( not ( = ?auto_7552 ?auto_7553 ) ) ( not ( = ?auto_7552 ?auto_7558 ) ) ( not ( = ?auto_7553 ?auto_7558 ) ) ( not ( = ?auto_7555 ?auto_7556 ) ) ( IS-CRATE ?auto_7552 ) ( not ( = ?auto_7566 ?auto_7557 ) ) ( HOIST-AT ?auto_7568 ?auto_7566 ) ( AVAILABLE ?auto_7568 ) ( SURFACE-AT ?auto_7552 ?auto_7566 ) ( ON ?auto_7552 ?auto_7569 ) ( CLEAR ?auto_7552 ) ( not ( = ?auto_7551 ?auto_7552 ) ) ( not ( = ?auto_7551 ?auto_7569 ) ) ( not ( = ?auto_7552 ?auto_7569 ) ) ( not ( = ?auto_7555 ?auto_7568 ) ) ( IS-CRATE ?auto_7551 ) ( not ( = ?auto_7565 ?auto_7557 ) ) ( HOIST-AT ?auto_7562 ?auto_7565 ) ( AVAILABLE ?auto_7562 ) ( SURFACE-AT ?auto_7551 ?auto_7565 ) ( ON ?auto_7551 ?auto_7564 ) ( CLEAR ?auto_7551 ) ( not ( = ?auto_7550 ?auto_7551 ) ) ( not ( = ?auto_7550 ?auto_7564 ) ) ( not ( = ?auto_7551 ?auto_7564 ) ) ( not ( = ?auto_7555 ?auto_7562 ) ) ( IS-CRATE ?auto_7550 ) ( not ( = ?auto_7570 ?auto_7557 ) ) ( HOIST-AT ?auto_7563 ?auto_7570 ) ( AVAILABLE ?auto_7563 ) ( SURFACE-AT ?auto_7550 ?auto_7570 ) ( ON ?auto_7550 ?auto_7560 ) ( CLEAR ?auto_7550 ) ( not ( = ?auto_7549 ?auto_7550 ) ) ( not ( = ?auto_7549 ?auto_7560 ) ) ( not ( = ?auto_7550 ?auto_7560 ) ) ( not ( = ?auto_7555 ?auto_7563 ) ) ( SURFACE-AT ?auto_7548 ?auto_7557 ) ( CLEAR ?auto_7548 ) ( IS-CRATE ?auto_7549 ) ( AVAILABLE ?auto_7555 ) ( not ( = ?auto_7561 ?auto_7557 ) ) ( HOIST-AT ?auto_7571 ?auto_7561 ) ( AVAILABLE ?auto_7571 ) ( SURFACE-AT ?auto_7549 ?auto_7561 ) ( ON ?auto_7549 ?auto_7567 ) ( CLEAR ?auto_7549 ) ( TRUCK-AT ?auto_7554 ?auto_7557 ) ( not ( = ?auto_7548 ?auto_7549 ) ) ( not ( = ?auto_7548 ?auto_7567 ) ) ( not ( = ?auto_7549 ?auto_7567 ) ) ( not ( = ?auto_7555 ?auto_7571 ) ) ( not ( = ?auto_7548 ?auto_7550 ) ) ( not ( = ?auto_7548 ?auto_7560 ) ) ( not ( = ?auto_7550 ?auto_7567 ) ) ( not ( = ?auto_7570 ?auto_7561 ) ) ( not ( = ?auto_7563 ?auto_7571 ) ) ( not ( = ?auto_7560 ?auto_7567 ) ) ( not ( = ?auto_7548 ?auto_7551 ) ) ( not ( = ?auto_7548 ?auto_7564 ) ) ( not ( = ?auto_7549 ?auto_7551 ) ) ( not ( = ?auto_7549 ?auto_7564 ) ) ( not ( = ?auto_7551 ?auto_7560 ) ) ( not ( = ?auto_7551 ?auto_7567 ) ) ( not ( = ?auto_7565 ?auto_7570 ) ) ( not ( = ?auto_7565 ?auto_7561 ) ) ( not ( = ?auto_7562 ?auto_7563 ) ) ( not ( = ?auto_7562 ?auto_7571 ) ) ( not ( = ?auto_7564 ?auto_7560 ) ) ( not ( = ?auto_7564 ?auto_7567 ) ) ( not ( = ?auto_7548 ?auto_7552 ) ) ( not ( = ?auto_7548 ?auto_7569 ) ) ( not ( = ?auto_7549 ?auto_7552 ) ) ( not ( = ?auto_7549 ?auto_7569 ) ) ( not ( = ?auto_7550 ?auto_7552 ) ) ( not ( = ?auto_7550 ?auto_7569 ) ) ( not ( = ?auto_7552 ?auto_7564 ) ) ( not ( = ?auto_7552 ?auto_7560 ) ) ( not ( = ?auto_7552 ?auto_7567 ) ) ( not ( = ?auto_7566 ?auto_7565 ) ) ( not ( = ?auto_7566 ?auto_7570 ) ) ( not ( = ?auto_7566 ?auto_7561 ) ) ( not ( = ?auto_7568 ?auto_7562 ) ) ( not ( = ?auto_7568 ?auto_7563 ) ) ( not ( = ?auto_7568 ?auto_7571 ) ) ( not ( = ?auto_7569 ?auto_7564 ) ) ( not ( = ?auto_7569 ?auto_7560 ) ) ( not ( = ?auto_7569 ?auto_7567 ) ) ( not ( = ?auto_7548 ?auto_7553 ) ) ( not ( = ?auto_7548 ?auto_7558 ) ) ( not ( = ?auto_7549 ?auto_7553 ) ) ( not ( = ?auto_7549 ?auto_7558 ) ) ( not ( = ?auto_7550 ?auto_7553 ) ) ( not ( = ?auto_7550 ?auto_7558 ) ) ( not ( = ?auto_7551 ?auto_7553 ) ) ( not ( = ?auto_7551 ?auto_7558 ) ) ( not ( = ?auto_7553 ?auto_7569 ) ) ( not ( = ?auto_7553 ?auto_7564 ) ) ( not ( = ?auto_7553 ?auto_7560 ) ) ( not ( = ?auto_7553 ?auto_7567 ) ) ( not ( = ?auto_7559 ?auto_7566 ) ) ( not ( = ?auto_7559 ?auto_7565 ) ) ( not ( = ?auto_7559 ?auto_7570 ) ) ( not ( = ?auto_7559 ?auto_7561 ) ) ( not ( = ?auto_7556 ?auto_7568 ) ) ( not ( = ?auto_7556 ?auto_7562 ) ) ( not ( = ?auto_7556 ?auto_7563 ) ) ( not ( = ?auto_7556 ?auto_7571 ) ) ( not ( = ?auto_7558 ?auto_7569 ) ) ( not ( = ?auto_7558 ?auto_7564 ) ) ( not ( = ?auto_7558 ?auto_7560 ) ) ( not ( = ?auto_7558 ?auto_7567 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_7548 ?auto_7549 ?auto_7550 ?auto_7551 ?auto_7552 )
      ( MAKE-1CRATE ?auto_7552 ?auto_7553 )
      ( MAKE-5CRATE-VERIFY ?auto_7548 ?auto_7549 ?auto_7550 ?auto_7551 ?auto_7552 ?auto_7553 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_7589 - SURFACE
      ?auto_7590 - SURFACE
      ?auto_7591 - SURFACE
      ?auto_7592 - SURFACE
      ?auto_7593 - SURFACE
      ?auto_7594 - SURFACE
      ?auto_7595 - SURFACE
    )
    :vars
    (
      ?auto_7597 - HOIST
      ?auto_7596 - PLACE
      ?auto_7598 - PLACE
      ?auto_7600 - HOIST
      ?auto_7599 - SURFACE
      ?auto_7608 - PLACE
      ?auto_7602 - HOIST
      ?auto_7603 - SURFACE
      ?auto_7606 - PLACE
      ?auto_7604 - HOIST
      ?auto_7611 - SURFACE
      ?auto_7605 - PLACE
      ?auto_7613 - HOIST
      ?auto_7609 - SURFACE
      ?auto_7610 - PLACE
      ?auto_7614 - HOIST
      ?auto_7612 - SURFACE
      ?auto_7607 - SURFACE
      ?auto_7601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7597 ?auto_7596 ) ( IS-CRATE ?auto_7595 ) ( not ( = ?auto_7598 ?auto_7596 ) ) ( HOIST-AT ?auto_7600 ?auto_7598 ) ( SURFACE-AT ?auto_7595 ?auto_7598 ) ( ON ?auto_7595 ?auto_7599 ) ( CLEAR ?auto_7595 ) ( not ( = ?auto_7594 ?auto_7595 ) ) ( not ( = ?auto_7594 ?auto_7599 ) ) ( not ( = ?auto_7595 ?auto_7599 ) ) ( not ( = ?auto_7597 ?auto_7600 ) ) ( IS-CRATE ?auto_7594 ) ( not ( = ?auto_7608 ?auto_7596 ) ) ( HOIST-AT ?auto_7602 ?auto_7608 ) ( AVAILABLE ?auto_7602 ) ( SURFACE-AT ?auto_7594 ?auto_7608 ) ( ON ?auto_7594 ?auto_7603 ) ( CLEAR ?auto_7594 ) ( not ( = ?auto_7593 ?auto_7594 ) ) ( not ( = ?auto_7593 ?auto_7603 ) ) ( not ( = ?auto_7594 ?auto_7603 ) ) ( not ( = ?auto_7597 ?auto_7602 ) ) ( IS-CRATE ?auto_7593 ) ( not ( = ?auto_7606 ?auto_7596 ) ) ( HOIST-AT ?auto_7604 ?auto_7606 ) ( AVAILABLE ?auto_7604 ) ( SURFACE-AT ?auto_7593 ?auto_7606 ) ( ON ?auto_7593 ?auto_7611 ) ( CLEAR ?auto_7593 ) ( not ( = ?auto_7592 ?auto_7593 ) ) ( not ( = ?auto_7592 ?auto_7611 ) ) ( not ( = ?auto_7593 ?auto_7611 ) ) ( not ( = ?auto_7597 ?auto_7604 ) ) ( IS-CRATE ?auto_7592 ) ( not ( = ?auto_7605 ?auto_7596 ) ) ( HOIST-AT ?auto_7613 ?auto_7605 ) ( AVAILABLE ?auto_7613 ) ( SURFACE-AT ?auto_7592 ?auto_7605 ) ( ON ?auto_7592 ?auto_7609 ) ( CLEAR ?auto_7592 ) ( not ( = ?auto_7591 ?auto_7592 ) ) ( not ( = ?auto_7591 ?auto_7609 ) ) ( not ( = ?auto_7592 ?auto_7609 ) ) ( not ( = ?auto_7597 ?auto_7613 ) ) ( IS-CRATE ?auto_7591 ) ( not ( = ?auto_7610 ?auto_7596 ) ) ( HOIST-AT ?auto_7614 ?auto_7610 ) ( AVAILABLE ?auto_7614 ) ( SURFACE-AT ?auto_7591 ?auto_7610 ) ( ON ?auto_7591 ?auto_7612 ) ( CLEAR ?auto_7591 ) ( not ( = ?auto_7590 ?auto_7591 ) ) ( not ( = ?auto_7590 ?auto_7612 ) ) ( not ( = ?auto_7591 ?auto_7612 ) ) ( not ( = ?auto_7597 ?auto_7614 ) ) ( SURFACE-AT ?auto_7589 ?auto_7596 ) ( CLEAR ?auto_7589 ) ( IS-CRATE ?auto_7590 ) ( AVAILABLE ?auto_7597 ) ( AVAILABLE ?auto_7600 ) ( SURFACE-AT ?auto_7590 ?auto_7598 ) ( ON ?auto_7590 ?auto_7607 ) ( CLEAR ?auto_7590 ) ( TRUCK-AT ?auto_7601 ?auto_7596 ) ( not ( = ?auto_7589 ?auto_7590 ) ) ( not ( = ?auto_7589 ?auto_7607 ) ) ( not ( = ?auto_7590 ?auto_7607 ) ) ( not ( = ?auto_7589 ?auto_7591 ) ) ( not ( = ?auto_7589 ?auto_7612 ) ) ( not ( = ?auto_7591 ?auto_7607 ) ) ( not ( = ?auto_7610 ?auto_7598 ) ) ( not ( = ?auto_7614 ?auto_7600 ) ) ( not ( = ?auto_7612 ?auto_7607 ) ) ( not ( = ?auto_7589 ?auto_7592 ) ) ( not ( = ?auto_7589 ?auto_7609 ) ) ( not ( = ?auto_7590 ?auto_7592 ) ) ( not ( = ?auto_7590 ?auto_7609 ) ) ( not ( = ?auto_7592 ?auto_7612 ) ) ( not ( = ?auto_7592 ?auto_7607 ) ) ( not ( = ?auto_7605 ?auto_7610 ) ) ( not ( = ?auto_7605 ?auto_7598 ) ) ( not ( = ?auto_7613 ?auto_7614 ) ) ( not ( = ?auto_7613 ?auto_7600 ) ) ( not ( = ?auto_7609 ?auto_7612 ) ) ( not ( = ?auto_7609 ?auto_7607 ) ) ( not ( = ?auto_7589 ?auto_7593 ) ) ( not ( = ?auto_7589 ?auto_7611 ) ) ( not ( = ?auto_7590 ?auto_7593 ) ) ( not ( = ?auto_7590 ?auto_7611 ) ) ( not ( = ?auto_7591 ?auto_7593 ) ) ( not ( = ?auto_7591 ?auto_7611 ) ) ( not ( = ?auto_7593 ?auto_7609 ) ) ( not ( = ?auto_7593 ?auto_7612 ) ) ( not ( = ?auto_7593 ?auto_7607 ) ) ( not ( = ?auto_7606 ?auto_7605 ) ) ( not ( = ?auto_7606 ?auto_7610 ) ) ( not ( = ?auto_7606 ?auto_7598 ) ) ( not ( = ?auto_7604 ?auto_7613 ) ) ( not ( = ?auto_7604 ?auto_7614 ) ) ( not ( = ?auto_7604 ?auto_7600 ) ) ( not ( = ?auto_7611 ?auto_7609 ) ) ( not ( = ?auto_7611 ?auto_7612 ) ) ( not ( = ?auto_7611 ?auto_7607 ) ) ( not ( = ?auto_7589 ?auto_7594 ) ) ( not ( = ?auto_7589 ?auto_7603 ) ) ( not ( = ?auto_7590 ?auto_7594 ) ) ( not ( = ?auto_7590 ?auto_7603 ) ) ( not ( = ?auto_7591 ?auto_7594 ) ) ( not ( = ?auto_7591 ?auto_7603 ) ) ( not ( = ?auto_7592 ?auto_7594 ) ) ( not ( = ?auto_7592 ?auto_7603 ) ) ( not ( = ?auto_7594 ?auto_7611 ) ) ( not ( = ?auto_7594 ?auto_7609 ) ) ( not ( = ?auto_7594 ?auto_7612 ) ) ( not ( = ?auto_7594 ?auto_7607 ) ) ( not ( = ?auto_7608 ?auto_7606 ) ) ( not ( = ?auto_7608 ?auto_7605 ) ) ( not ( = ?auto_7608 ?auto_7610 ) ) ( not ( = ?auto_7608 ?auto_7598 ) ) ( not ( = ?auto_7602 ?auto_7604 ) ) ( not ( = ?auto_7602 ?auto_7613 ) ) ( not ( = ?auto_7602 ?auto_7614 ) ) ( not ( = ?auto_7602 ?auto_7600 ) ) ( not ( = ?auto_7603 ?auto_7611 ) ) ( not ( = ?auto_7603 ?auto_7609 ) ) ( not ( = ?auto_7603 ?auto_7612 ) ) ( not ( = ?auto_7603 ?auto_7607 ) ) ( not ( = ?auto_7589 ?auto_7595 ) ) ( not ( = ?auto_7589 ?auto_7599 ) ) ( not ( = ?auto_7590 ?auto_7595 ) ) ( not ( = ?auto_7590 ?auto_7599 ) ) ( not ( = ?auto_7591 ?auto_7595 ) ) ( not ( = ?auto_7591 ?auto_7599 ) ) ( not ( = ?auto_7592 ?auto_7595 ) ) ( not ( = ?auto_7592 ?auto_7599 ) ) ( not ( = ?auto_7593 ?auto_7595 ) ) ( not ( = ?auto_7593 ?auto_7599 ) ) ( not ( = ?auto_7595 ?auto_7603 ) ) ( not ( = ?auto_7595 ?auto_7611 ) ) ( not ( = ?auto_7595 ?auto_7609 ) ) ( not ( = ?auto_7595 ?auto_7612 ) ) ( not ( = ?auto_7595 ?auto_7607 ) ) ( not ( = ?auto_7599 ?auto_7603 ) ) ( not ( = ?auto_7599 ?auto_7611 ) ) ( not ( = ?auto_7599 ?auto_7609 ) ) ( not ( = ?auto_7599 ?auto_7612 ) ) ( not ( = ?auto_7599 ?auto_7607 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_7589 ?auto_7590 ?auto_7591 ?auto_7592 ?auto_7593 ?auto_7594 )
      ( MAKE-1CRATE ?auto_7594 ?auto_7595 )
      ( MAKE-6CRATE-VERIFY ?auto_7589 ?auto_7590 ?auto_7591 ?auto_7592 ?auto_7593 ?auto_7594 ?auto_7595 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_7633 - SURFACE
      ?auto_7634 - SURFACE
      ?auto_7635 - SURFACE
      ?auto_7636 - SURFACE
      ?auto_7637 - SURFACE
      ?auto_7638 - SURFACE
      ?auto_7639 - SURFACE
      ?auto_7640 - SURFACE
    )
    :vars
    (
      ?auto_7641 - HOIST
      ?auto_7643 - PLACE
      ?auto_7645 - PLACE
      ?auto_7646 - HOIST
      ?auto_7644 - SURFACE
      ?auto_7647 - PLACE
      ?auto_7656 - HOIST
      ?auto_7653 - SURFACE
      ?auto_7660 - PLACE
      ?auto_7654 - HOIST
      ?auto_7650 - SURFACE
      ?auto_7662 - PLACE
      ?auto_7652 - HOIST
      ?auto_7651 - SURFACE
      ?auto_7661 - PLACE
      ?auto_7659 - HOIST
      ?auto_7648 - SURFACE
      ?auto_7649 - PLACE
      ?auto_7655 - HOIST
      ?auto_7658 - SURFACE
      ?auto_7657 - SURFACE
      ?auto_7642 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7641 ?auto_7643 ) ( IS-CRATE ?auto_7640 ) ( not ( = ?auto_7645 ?auto_7643 ) ) ( HOIST-AT ?auto_7646 ?auto_7645 ) ( AVAILABLE ?auto_7646 ) ( SURFACE-AT ?auto_7640 ?auto_7645 ) ( ON ?auto_7640 ?auto_7644 ) ( CLEAR ?auto_7640 ) ( not ( = ?auto_7639 ?auto_7640 ) ) ( not ( = ?auto_7639 ?auto_7644 ) ) ( not ( = ?auto_7640 ?auto_7644 ) ) ( not ( = ?auto_7641 ?auto_7646 ) ) ( IS-CRATE ?auto_7639 ) ( not ( = ?auto_7647 ?auto_7643 ) ) ( HOIST-AT ?auto_7656 ?auto_7647 ) ( SURFACE-AT ?auto_7639 ?auto_7647 ) ( ON ?auto_7639 ?auto_7653 ) ( CLEAR ?auto_7639 ) ( not ( = ?auto_7638 ?auto_7639 ) ) ( not ( = ?auto_7638 ?auto_7653 ) ) ( not ( = ?auto_7639 ?auto_7653 ) ) ( not ( = ?auto_7641 ?auto_7656 ) ) ( IS-CRATE ?auto_7638 ) ( not ( = ?auto_7660 ?auto_7643 ) ) ( HOIST-AT ?auto_7654 ?auto_7660 ) ( AVAILABLE ?auto_7654 ) ( SURFACE-AT ?auto_7638 ?auto_7660 ) ( ON ?auto_7638 ?auto_7650 ) ( CLEAR ?auto_7638 ) ( not ( = ?auto_7637 ?auto_7638 ) ) ( not ( = ?auto_7637 ?auto_7650 ) ) ( not ( = ?auto_7638 ?auto_7650 ) ) ( not ( = ?auto_7641 ?auto_7654 ) ) ( IS-CRATE ?auto_7637 ) ( not ( = ?auto_7662 ?auto_7643 ) ) ( HOIST-AT ?auto_7652 ?auto_7662 ) ( AVAILABLE ?auto_7652 ) ( SURFACE-AT ?auto_7637 ?auto_7662 ) ( ON ?auto_7637 ?auto_7651 ) ( CLEAR ?auto_7637 ) ( not ( = ?auto_7636 ?auto_7637 ) ) ( not ( = ?auto_7636 ?auto_7651 ) ) ( not ( = ?auto_7637 ?auto_7651 ) ) ( not ( = ?auto_7641 ?auto_7652 ) ) ( IS-CRATE ?auto_7636 ) ( not ( = ?auto_7661 ?auto_7643 ) ) ( HOIST-AT ?auto_7659 ?auto_7661 ) ( AVAILABLE ?auto_7659 ) ( SURFACE-AT ?auto_7636 ?auto_7661 ) ( ON ?auto_7636 ?auto_7648 ) ( CLEAR ?auto_7636 ) ( not ( = ?auto_7635 ?auto_7636 ) ) ( not ( = ?auto_7635 ?auto_7648 ) ) ( not ( = ?auto_7636 ?auto_7648 ) ) ( not ( = ?auto_7641 ?auto_7659 ) ) ( IS-CRATE ?auto_7635 ) ( not ( = ?auto_7649 ?auto_7643 ) ) ( HOIST-AT ?auto_7655 ?auto_7649 ) ( AVAILABLE ?auto_7655 ) ( SURFACE-AT ?auto_7635 ?auto_7649 ) ( ON ?auto_7635 ?auto_7658 ) ( CLEAR ?auto_7635 ) ( not ( = ?auto_7634 ?auto_7635 ) ) ( not ( = ?auto_7634 ?auto_7658 ) ) ( not ( = ?auto_7635 ?auto_7658 ) ) ( not ( = ?auto_7641 ?auto_7655 ) ) ( SURFACE-AT ?auto_7633 ?auto_7643 ) ( CLEAR ?auto_7633 ) ( IS-CRATE ?auto_7634 ) ( AVAILABLE ?auto_7641 ) ( AVAILABLE ?auto_7656 ) ( SURFACE-AT ?auto_7634 ?auto_7647 ) ( ON ?auto_7634 ?auto_7657 ) ( CLEAR ?auto_7634 ) ( TRUCK-AT ?auto_7642 ?auto_7643 ) ( not ( = ?auto_7633 ?auto_7634 ) ) ( not ( = ?auto_7633 ?auto_7657 ) ) ( not ( = ?auto_7634 ?auto_7657 ) ) ( not ( = ?auto_7633 ?auto_7635 ) ) ( not ( = ?auto_7633 ?auto_7658 ) ) ( not ( = ?auto_7635 ?auto_7657 ) ) ( not ( = ?auto_7649 ?auto_7647 ) ) ( not ( = ?auto_7655 ?auto_7656 ) ) ( not ( = ?auto_7658 ?auto_7657 ) ) ( not ( = ?auto_7633 ?auto_7636 ) ) ( not ( = ?auto_7633 ?auto_7648 ) ) ( not ( = ?auto_7634 ?auto_7636 ) ) ( not ( = ?auto_7634 ?auto_7648 ) ) ( not ( = ?auto_7636 ?auto_7658 ) ) ( not ( = ?auto_7636 ?auto_7657 ) ) ( not ( = ?auto_7661 ?auto_7649 ) ) ( not ( = ?auto_7661 ?auto_7647 ) ) ( not ( = ?auto_7659 ?auto_7655 ) ) ( not ( = ?auto_7659 ?auto_7656 ) ) ( not ( = ?auto_7648 ?auto_7658 ) ) ( not ( = ?auto_7648 ?auto_7657 ) ) ( not ( = ?auto_7633 ?auto_7637 ) ) ( not ( = ?auto_7633 ?auto_7651 ) ) ( not ( = ?auto_7634 ?auto_7637 ) ) ( not ( = ?auto_7634 ?auto_7651 ) ) ( not ( = ?auto_7635 ?auto_7637 ) ) ( not ( = ?auto_7635 ?auto_7651 ) ) ( not ( = ?auto_7637 ?auto_7648 ) ) ( not ( = ?auto_7637 ?auto_7658 ) ) ( not ( = ?auto_7637 ?auto_7657 ) ) ( not ( = ?auto_7662 ?auto_7661 ) ) ( not ( = ?auto_7662 ?auto_7649 ) ) ( not ( = ?auto_7662 ?auto_7647 ) ) ( not ( = ?auto_7652 ?auto_7659 ) ) ( not ( = ?auto_7652 ?auto_7655 ) ) ( not ( = ?auto_7652 ?auto_7656 ) ) ( not ( = ?auto_7651 ?auto_7648 ) ) ( not ( = ?auto_7651 ?auto_7658 ) ) ( not ( = ?auto_7651 ?auto_7657 ) ) ( not ( = ?auto_7633 ?auto_7638 ) ) ( not ( = ?auto_7633 ?auto_7650 ) ) ( not ( = ?auto_7634 ?auto_7638 ) ) ( not ( = ?auto_7634 ?auto_7650 ) ) ( not ( = ?auto_7635 ?auto_7638 ) ) ( not ( = ?auto_7635 ?auto_7650 ) ) ( not ( = ?auto_7636 ?auto_7638 ) ) ( not ( = ?auto_7636 ?auto_7650 ) ) ( not ( = ?auto_7638 ?auto_7651 ) ) ( not ( = ?auto_7638 ?auto_7648 ) ) ( not ( = ?auto_7638 ?auto_7658 ) ) ( not ( = ?auto_7638 ?auto_7657 ) ) ( not ( = ?auto_7660 ?auto_7662 ) ) ( not ( = ?auto_7660 ?auto_7661 ) ) ( not ( = ?auto_7660 ?auto_7649 ) ) ( not ( = ?auto_7660 ?auto_7647 ) ) ( not ( = ?auto_7654 ?auto_7652 ) ) ( not ( = ?auto_7654 ?auto_7659 ) ) ( not ( = ?auto_7654 ?auto_7655 ) ) ( not ( = ?auto_7654 ?auto_7656 ) ) ( not ( = ?auto_7650 ?auto_7651 ) ) ( not ( = ?auto_7650 ?auto_7648 ) ) ( not ( = ?auto_7650 ?auto_7658 ) ) ( not ( = ?auto_7650 ?auto_7657 ) ) ( not ( = ?auto_7633 ?auto_7639 ) ) ( not ( = ?auto_7633 ?auto_7653 ) ) ( not ( = ?auto_7634 ?auto_7639 ) ) ( not ( = ?auto_7634 ?auto_7653 ) ) ( not ( = ?auto_7635 ?auto_7639 ) ) ( not ( = ?auto_7635 ?auto_7653 ) ) ( not ( = ?auto_7636 ?auto_7639 ) ) ( not ( = ?auto_7636 ?auto_7653 ) ) ( not ( = ?auto_7637 ?auto_7639 ) ) ( not ( = ?auto_7637 ?auto_7653 ) ) ( not ( = ?auto_7639 ?auto_7650 ) ) ( not ( = ?auto_7639 ?auto_7651 ) ) ( not ( = ?auto_7639 ?auto_7648 ) ) ( not ( = ?auto_7639 ?auto_7658 ) ) ( not ( = ?auto_7639 ?auto_7657 ) ) ( not ( = ?auto_7653 ?auto_7650 ) ) ( not ( = ?auto_7653 ?auto_7651 ) ) ( not ( = ?auto_7653 ?auto_7648 ) ) ( not ( = ?auto_7653 ?auto_7658 ) ) ( not ( = ?auto_7653 ?auto_7657 ) ) ( not ( = ?auto_7633 ?auto_7640 ) ) ( not ( = ?auto_7633 ?auto_7644 ) ) ( not ( = ?auto_7634 ?auto_7640 ) ) ( not ( = ?auto_7634 ?auto_7644 ) ) ( not ( = ?auto_7635 ?auto_7640 ) ) ( not ( = ?auto_7635 ?auto_7644 ) ) ( not ( = ?auto_7636 ?auto_7640 ) ) ( not ( = ?auto_7636 ?auto_7644 ) ) ( not ( = ?auto_7637 ?auto_7640 ) ) ( not ( = ?auto_7637 ?auto_7644 ) ) ( not ( = ?auto_7638 ?auto_7640 ) ) ( not ( = ?auto_7638 ?auto_7644 ) ) ( not ( = ?auto_7640 ?auto_7653 ) ) ( not ( = ?auto_7640 ?auto_7650 ) ) ( not ( = ?auto_7640 ?auto_7651 ) ) ( not ( = ?auto_7640 ?auto_7648 ) ) ( not ( = ?auto_7640 ?auto_7658 ) ) ( not ( = ?auto_7640 ?auto_7657 ) ) ( not ( = ?auto_7645 ?auto_7647 ) ) ( not ( = ?auto_7645 ?auto_7660 ) ) ( not ( = ?auto_7645 ?auto_7662 ) ) ( not ( = ?auto_7645 ?auto_7661 ) ) ( not ( = ?auto_7645 ?auto_7649 ) ) ( not ( = ?auto_7646 ?auto_7656 ) ) ( not ( = ?auto_7646 ?auto_7654 ) ) ( not ( = ?auto_7646 ?auto_7652 ) ) ( not ( = ?auto_7646 ?auto_7659 ) ) ( not ( = ?auto_7646 ?auto_7655 ) ) ( not ( = ?auto_7644 ?auto_7653 ) ) ( not ( = ?auto_7644 ?auto_7650 ) ) ( not ( = ?auto_7644 ?auto_7651 ) ) ( not ( = ?auto_7644 ?auto_7648 ) ) ( not ( = ?auto_7644 ?auto_7658 ) ) ( not ( = ?auto_7644 ?auto_7657 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_7633 ?auto_7634 ?auto_7635 ?auto_7636 ?auto_7637 ?auto_7638 ?auto_7639 )
      ( MAKE-1CRATE ?auto_7639 ?auto_7640 )
      ( MAKE-7CRATE-VERIFY ?auto_7633 ?auto_7634 ?auto_7635 ?auto_7636 ?auto_7637 ?auto_7638 ?auto_7639 ?auto_7640 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_7682 - SURFACE
      ?auto_7683 - SURFACE
      ?auto_7684 - SURFACE
      ?auto_7685 - SURFACE
      ?auto_7686 - SURFACE
      ?auto_7687 - SURFACE
      ?auto_7688 - SURFACE
      ?auto_7689 - SURFACE
      ?auto_7690 - SURFACE
    )
    :vars
    (
      ?auto_7696 - HOIST
      ?auto_7695 - PLACE
      ?auto_7691 - PLACE
      ?auto_7694 - HOIST
      ?auto_7693 - SURFACE
      ?auto_7707 - PLACE
      ?auto_7710 - HOIST
      ?auto_7701 - SURFACE
      ?auto_7702 - PLACE
      ?auto_7709 - HOIST
      ?auto_7711 - SURFACE
      ?auto_7706 - PLACE
      ?auto_7715 - HOIST
      ?auto_7705 - SURFACE
      ?auto_7712 - PLACE
      ?auto_7700 - HOIST
      ?auto_7699 - SURFACE
      ?auto_7713 - PLACE
      ?auto_7704 - HOIST
      ?auto_7697 - SURFACE
      ?auto_7714 - PLACE
      ?auto_7703 - HOIST
      ?auto_7708 - SURFACE
      ?auto_7698 - SURFACE
      ?auto_7692 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7696 ?auto_7695 ) ( IS-CRATE ?auto_7690 ) ( not ( = ?auto_7691 ?auto_7695 ) ) ( HOIST-AT ?auto_7694 ?auto_7691 ) ( AVAILABLE ?auto_7694 ) ( SURFACE-AT ?auto_7690 ?auto_7691 ) ( ON ?auto_7690 ?auto_7693 ) ( CLEAR ?auto_7690 ) ( not ( = ?auto_7689 ?auto_7690 ) ) ( not ( = ?auto_7689 ?auto_7693 ) ) ( not ( = ?auto_7690 ?auto_7693 ) ) ( not ( = ?auto_7696 ?auto_7694 ) ) ( IS-CRATE ?auto_7689 ) ( not ( = ?auto_7707 ?auto_7695 ) ) ( HOIST-AT ?auto_7710 ?auto_7707 ) ( AVAILABLE ?auto_7710 ) ( SURFACE-AT ?auto_7689 ?auto_7707 ) ( ON ?auto_7689 ?auto_7701 ) ( CLEAR ?auto_7689 ) ( not ( = ?auto_7688 ?auto_7689 ) ) ( not ( = ?auto_7688 ?auto_7701 ) ) ( not ( = ?auto_7689 ?auto_7701 ) ) ( not ( = ?auto_7696 ?auto_7710 ) ) ( IS-CRATE ?auto_7688 ) ( not ( = ?auto_7702 ?auto_7695 ) ) ( HOIST-AT ?auto_7709 ?auto_7702 ) ( SURFACE-AT ?auto_7688 ?auto_7702 ) ( ON ?auto_7688 ?auto_7711 ) ( CLEAR ?auto_7688 ) ( not ( = ?auto_7687 ?auto_7688 ) ) ( not ( = ?auto_7687 ?auto_7711 ) ) ( not ( = ?auto_7688 ?auto_7711 ) ) ( not ( = ?auto_7696 ?auto_7709 ) ) ( IS-CRATE ?auto_7687 ) ( not ( = ?auto_7706 ?auto_7695 ) ) ( HOIST-AT ?auto_7715 ?auto_7706 ) ( AVAILABLE ?auto_7715 ) ( SURFACE-AT ?auto_7687 ?auto_7706 ) ( ON ?auto_7687 ?auto_7705 ) ( CLEAR ?auto_7687 ) ( not ( = ?auto_7686 ?auto_7687 ) ) ( not ( = ?auto_7686 ?auto_7705 ) ) ( not ( = ?auto_7687 ?auto_7705 ) ) ( not ( = ?auto_7696 ?auto_7715 ) ) ( IS-CRATE ?auto_7686 ) ( not ( = ?auto_7712 ?auto_7695 ) ) ( HOIST-AT ?auto_7700 ?auto_7712 ) ( AVAILABLE ?auto_7700 ) ( SURFACE-AT ?auto_7686 ?auto_7712 ) ( ON ?auto_7686 ?auto_7699 ) ( CLEAR ?auto_7686 ) ( not ( = ?auto_7685 ?auto_7686 ) ) ( not ( = ?auto_7685 ?auto_7699 ) ) ( not ( = ?auto_7686 ?auto_7699 ) ) ( not ( = ?auto_7696 ?auto_7700 ) ) ( IS-CRATE ?auto_7685 ) ( not ( = ?auto_7713 ?auto_7695 ) ) ( HOIST-AT ?auto_7704 ?auto_7713 ) ( AVAILABLE ?auto_7704 ) ( SURFACE-AT ?auto_7685 ?auto_7713 ) ( ON ?auto_7685 ?auto_7697 ) ( CLEAR ?auto_7685 ) ( not ( = ?auto_7684 ?auto_7685 ) ) ( not ( = ?auto_7684 ?auto_7697 ) ) ( not ( = ?auto_7685 ?auto_7697 ) ) ( not ( = ?auto_7696 ?auto_7704 ) ) ( IS-CRATE ?auto_7684 ) ( not ( = ?auto_7714 ?auto_7695 ) ) ( HOIST-AT ?auto_7703 ?auto_7714 ) ( AVAILABLE ?auto_7703 ) ( SURFACE-AT ?auto_7684 ?auto_7714 ) ( ON ?auto_7684 ?auto_7708 ) ( CLEAR ?auto_7684 ) ( not ( = ?auto_7683 ?auto_7684 ) ) ( not ( = ?auto_7683 ?auto_7708 ) ) ( not ( = ?auto_7684 ?auto_7708 ) ) ( not ( = ?auto_7696 ?auto_7703 ) ) ( SURFACE-AT ?auto_7682 ?auto_7695 ) ( CLEAR ?auto_7682 ) ( IS-CRATE ?auto_7683 ) ( AVAILABLE ?auto_7696 ) ( AVAILABLE ?auto_7709 ) ( SURFACE-AT ?auto_7683 ?auto_7702 ) ( ON ?auto_7683 ?auto_7698 ) ( CLEAR ?auto_7683 ) ( TRUCK-AT ?auto_7692 ?auto_7695 ) ( not ( = ?auto_7682 ?auto_7683 ) ) ( not ( = ?auto_7682 ?auto_7698 ) ) ( not ( = ?auto_7683 ?auto_7698 ) ) ( not ( = ?auto_7682 ?auto_7684 ) ) ( not ( = ?auto_7682 ?auto_7708 ) ) ( not ( = ?auto_7684 ?auto_7698 ) ) ( not ( = ?auto_7714 ?auto_7702 ) ) ( not ( = ?auto_7703 ?auto_7709 ) ) ( not ( = ?auto_7708 ?auto_7698 ) ) ( not ( = ?auto_7682 ?auto_7685 ) ) ( not ( = ?auto_7682 ?auto_7697 ) ) ( not ( = ?auto_7683 ?auto_7685 ) ) ( not ( = ?auto_7683 ?auto_7697 ) ) ( not ( = ?auto_7685 ?auto_7708 ) ) ( not ( = ?auto_7685 ?auto_7698 ) ) ( not ( = ?auto_7713 ?auto_7714 ) ) ( not ( = ?auto_7713 ?auto_7702 ) ) ( not ( = ?auto_7704 ?auto_7703 ) ) ( not ( = ?auto_7704 ?auto_7709 ) ) ( not ( = ?auto_7697 ?auto_7708 ) ) ( not ( = ?auto_7697 ?auto_7698 ) ) ( not ( = ?auto_7682 ?auto_7686 ) ) ( not ( = ?auto_7682 ?auto_7699 ) ) ( not ( = ?auto_7683 ?auto_7686 ) ) ( not ( = ?auto_7683 ?auto_7699 ) ) ( not ( = ?auto_7684 ?auto_7686 ) ) ( not ( = ?auto_7684 ?auto_7699 ) ) ( not ( = ?auto_7686 ?auto_7697 ) ) ( not ( = ?auto_7686 ?auto_7708 ) ) ( not ( = ?auto_7686 ?auto_7698 ) ) ( not ( = ?auto_7712 ?auto_7713 ) ) ( not ( = ?auto_7712 ?auto_7714 ) ) ( not ( = ?auto_7712 ?auto_7702 ) ) ( not ( = ?auto_7700 ?auto_7704 ) ) ( not ( = ?auto_7700 ?auto_7703 ) ) ( not ( = ?auto_7700 ?auto_7709 ) ) ( not ( = ?auto_7699 ?auto_7697 ) ) ( not ( = ?auto_7699 ?auto_7708 ) ) ( not ( = ?auto_7699 ?auto_7698 ) ) ( not ( = ?auto_7682 ?auto_7687 ) ) ( not ( = ?auto_7682 ?auto_7705 ) ) ( not ( = ?auto_7683 ?auto_7687 ) ) ( not ( = ?auto_7683 ?auto_7705 ) ) ( not ( = ?auto_7684 ?auto_7687 ) ) ( not ( = ?auto_7684 ?auto_7705 ) ) ( not ( = ?auto_7685 ?auto_7687 ) ) ( not ( = ?auto_7685 ?auto_7705 ) ) ( not ( = ?auto_7687 ?auto_7699 ) ) ( not ( = ?auto_7687 ?auto_7697 ) ) ( not ( = ?auto_7687 ?auto_7708 ) ) ( not ( = ?auto_7687 ?auto_7698 ) ) ( not ( = ?auto_7706 ?auto_7712 ) ) ( not ( = ?auto_7706 ?auto_7713 ) ) ( not ( = ?auto_7706 ?auto_7714 ) ) ( not ( = ?auto_7706 ?auto_7702 ) ) ( not ( = ?auto_7715 ?auto_7700 ) ) ( not ( = ?auto_7715 ?auto_7704 ) ) ( not ( = ?auto_7715 ?auto_7703 ) ) ( not ( = ?auto_7715 ?auto_7709 ) ) ( not ( = ?auto_7705 ?auto_7699 ) ) ( not ( = ?auto_7705 ?auto_7697 ) ) ( not ( = ?auto_7705 ?auto_7708 ) ) ( not ( = ?auto_7705 ?auto_7698 ) ) ( not ( = ?auto_7682 ?auto_7688 ) ) ( not ( = ?auto_7682 ?auto_7711 ) ) ( not ( = ?auto_7683 ?auto_7688 ) ) ( not ( = ?auto_7683 ?auto_7711 ) ) ( not ( = ?auto_7684 ?auto_7688 ) ) ( not ( = ?auto_7684 ?auto_7711 ) ) ( not ( = ?auto_7685 ?auto_7688 ) ) ( not ( = ?auto_7685 ?auto_7711 ) ) ( not ( = ?auto_7686 ?auto_7688 ) ) ( not ( = ?auto_7686 ?auto_7711 ) ) ( not ( = ?auto_7688 ?auto_7705 ) ) ( not ( = ?auto_7688 ?auto_7699 ) ) ( not ( = ?auto_7688 ?auto_7697 ) ) ( not ( = ?auto_7688 ?auto_7708 ) ) ( not ( = ?auto_7688 ?auto_7698 ) ) ( not ( = ?auto_7711 ?auto_7705 ) ) ( not ( = ?auto_7711 ?auto_7699 ) ) ( not ( = ?auto_7711 ?auto_7697 ) ) ( not ( = ?auto_7711 ?auto_7708 ) ) ( not ( = ?auto_7711 ?auto_7698 ) ) ( not ( = ?auto_7682 ?auto_7689 ) ) ( not ( = ?auto_7682 ?auto_7701 ) ) ( not ( = ?auto_7683 ?auto_7689 ) ) ( not ( = ?auto_7683 ?auto_7701 ) ) ( not ( = ?auto_7684 ?auto_7689 ) ) ( not ( = ?auto_7684 ?auto_7701 ) ) ( not ( = ?auto_7685 ?auto_7689 ) ) ( not ( = ?auto_7685 ?auto_7701 ) ) ( not ( = ?auto_7686 ?auto_7689 ) ) ( not ( = ?auto_7686 ?auto_7701 ) ) ( not ( = ?auto_7687 ?auto_7689 ) ) ( not ( = ?auto_7687 ?auto_7701 ) ) ( not ( = ?auto_7689 ?auto_7711 ) ) ( not ( = ?auto_7689 ?auto_7705 ) ) ( not ( = ?auto_7689 ?auto_7699 ) ) ( not ( = ?auto_7689 ?auto_7697 ) ) ( not ( = ?auto_7689 ?auto_7708 ) ) ( not ( = ?auto_7689 ?auto_7698 ) ) ( not ( = ?auto_7707 ?auto_7702 ) ) ( not ( = ?auto_7707 ?auto_7706 ) ) ( not ( = ?auto_7707 ?auto_7712 ) ) ( not ( = ?auto_7707 ?auto_7713 ) ) ( not ( = ?auto_7707 ?auto_7714 ) ) ( not ( = ?auto_7710 ?auto_7709 ) ) ( not ( = ?auto_7710 ?auto_7715 ) ) ( not ( = ?auto_7710 ?auto_7700 ) ) ( not ( = ?auto_7710 ?auto_7704 ) ) ( not ( = ?auto_7710 ?auto_7703 ) ) ( not ( = ?auto_7701 ?auto_7711 ) ) ( not ( = ?auto_7701 ?auto_7705 ) ) ( not ( = ?auto_7701 ?auto_7699 ) ) ( not ( = ?auto_7701 ?auto_7697 ) ) ( not ( = ?auto_7701 ?auto_7708 ) ) ( not ( = ?auto_7701 ?auto_7698 ) ) ( not ( = ?auto_7682 ?auto_7690 ) ) ( not ( = ?auto_7682 ?auto_7693 ) ) ( not ( = ?auto_7683 ?auto_7690 ) ) ( not ( = ?auto_7683 ?auto_7693 ) ) ( not ( = ?auto_7684 ?auto_7690 ) ) ( not ( = ?auto_7684 ?auto_7693 ) ) ( not ( = ?auto_7685 ?auto_7690 ) ) ( not ( = ?auto_7685 ?auto_7693 ) ) ( not ( = ?auto_7686 ?auto_7690 ) ) ( not ( = ?auto_7686 ?auto_7693 ) ) ( not ( = ?auto_7687 ?auto_7690 ) ) ( not ( = ?auto_7687 ?auto_7693 ) ) ( not ( = ?auto_7688 ?auto_7690 ) ) ( not ( = ?auto_7688 ?auto_7693 ) ) ( not ( = ?auto_7690 ?auto_7701 ) ) ( not ( = ?auto_7690 ?auto_7711 ) ) ( not ( = ?auto_7690 ?auto_7705 ) ) ( not ( = ?auto_7690 ?auto_7699 ) ) ( not ( = ?auto_7690 ?auto_7697 ) ) ( not ( = ?auto_7690 ?auto_7708 ) ) ( not ( = ?auto_7690 ?auto_7698 ) ) ( not ( = ?auto_7691 ?auto_7707 ) ) ( not ( = ?auto_7691 ?auto_7702 ) ) ( not ( = ?auto_7691 ?auto_7706 ) ) ( not ( = ?auto_7691 ?auto_7712 ) ) ( not ( = ?auto_7691 ?auto_7713 ) ) ( not ( = ?auto_7691 ?auto_7714 ) ) ( not ( = ?auto_7694 ?auto_7710 ) ) ( not ( = ?auto_7694 ?auto_7709 ) ) ( not ( = ?auto_7694 ?auto_7715 ) ) ( not ( = ?auto_7694 ?auto_7700 ) ) ( not ( = ?auto_7694 ?auto_7704 ) ) ( not ( = ?auto_7694 ?auto_7703 ) ) ( not ( = ?auto_7693 ?auto_7701 ) ) ( not ( = ?auto_7693 ?auto_7711 ) ) ( not ( = ?auto_7693 ?auto_7705 ) ) ( not ( = ?auto_7693 ?auto_7699 ) ) ( not ( = ?auto_7693 ?auto_7697 ) ) ( not ( = ?auto_7693 ?auto_7708 ) ) ( not ( = ?auto_7693 ?auto_7698 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_7682 ?auto_7683 ?auto_7684 ?auto_7685 ?auto_7686 ?auto_7687 ?auto_7688 ?auto_7689 )
      ( MAKE-1CRATE ?auto_7689 ?auto_7690 )
      ( MAKE-8CRATE-VERIFY ?auto_7682 ?auto_7683 ?auto_7684 ?auto_7685 ?auto_7686 ?auto_7687 ?auto_7688 ?auto_7689 ?auto_7690 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_7736 - SURFACE
      ?auto_7737 - SURFACE
      ?auto_7738 - SURFACE
      ?auto_7739 - SURFACE
      ?auto_7740 - SURFACE
      ?auto_7741 - SURFACE
      ?auto_7742 - SURFACE
      ?auto_7743 - SURFACE
      ?auto_7744 - SURFACE
      ?auto_7745 - SURFACE
    )
    :vars
    (
      ?auto_7748 - HOIST
      ?auto_7750 - PLACE
      ?auto_7749 - PLACE
      ?auto_7751 - HOIST
      ?auto_7747 - SURFACE
      ?auto_7770 - PLACE
      ?auto_7771 - HOIST
      ?auto_7768 - SURFACE
      ?auto_7773 - PLACE
      ?auto_7756 - HOIST
      ?auto_7762 - SURFACE
      ?auto_7754 - PLACE
      ?auto_7761 - HOIST
      ?auto_7769 - SURFACE
      ?auto_7772 - PLACE
      ?auto_7763 - HOIST
      ?auto_7764 - SURFACE
      ?auto_7755 - PLACE
      ?auto_7767 - HOIST
      ?auto_7766 - SURFACE
      ?auto_7759 - PLACE
      ?auto_7765 - HOIST
      ?auto_7760 - SURFACE
      ?auto_7757 - PLACE
      ?auto_7758 - HOIST
      ?auto_7752 - SURFACE
      ?auto_7753 - SURFACE
      ?auto_7746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7748 ?auto_7750 ) ( IS-CRATE ?auto_7745 ) ( not ( = ?auto_7749 ?auto_7750 ) ) ( HOIST-AT ?auto_7751 ?auto_7749 ) ( AVAILABLE ?auto_7751 ) ( SURFACE-AT ?auto_7745 ?auto_7749 ) ( ON ?auto_7745 ?auto_7747 ) ( CLEAR ?auto_7745 ) ( not ( = ?auto_7744 ?auto_7745 ) ) ( not ( = ?auto_7744 ?auto_7747 ) ) ( not ( = ?auto_7745 ?auto_7747 ) ) ( not ( = ?auto_7748 ?auto_7751 ) ) ( IS-CRATE ?auto_7744 ) ( not ( = ?auto_7770 ?auto_7750 ) ) ( HOIST-AT ?auto_7771 ?auto_7770 ) ( AVAILABLE ?auto_7771 ) ( SURFACE-AT ?auto_7744 ?auto_7770 ) ( ON ?auto_7744 ?auto_7768 ) ( CLEAR ?auto_7744 ) ( not ( = ?auto_7743 ?auto_7744 ) ) ( not ( = ?auto_7743 ?auto_7768 ) ) ( not ( = ?auto_7744 ?auto_7768 ) ) ( not ( = ?auto_7748 ?auto_7771 ) ) ( IS-CRATE ?auto_7743 ) ( not ( = ?auto_7773 ?auto_7750 ) ) ( HOIST-AT ?auto_7756 ?auto_7773 ) ( AVAILABLE ?auto_7756 ) ( SURFACE-AT ?auto_7743 ?auto_7773 ) ( ON ?auto_7743 ?auto_7762 ) ( CLEAR ?auto_7743 ) ( not ( = ?auto_7742 ?auto_7743 ) ) ( not ( = ?auto_7742 ?auto_7762 ) ) ( not ( = ?auto_7743 ?auto_7762 ) ) ( not ( = ?auto_7748 ?auto_7756 ) ) ( IS-CRATE ?auto_7742 ) ( not ( = ?auto_7754 ?auto_7750 ) ) ( HOIST-AT ?auto_7761 ?auto_7754 ) ( SURFACE-AT ?auto_7742 ?auto_7754 ) ( ON ?auto_7742 ?auto_7769 ) ( CLEAR ?auto_7742 ) ( not ( = ?auto_7741 ?auto_7742 ) ) ( not ( = ?auto_7741 ?auto_7769 ) ) ( not ( = ?auto_7742 ?auto_7769 ) ) ( not ( = ?auto_7748 ?auto_7761 ) ) ( IS-CRATE ?auto_7741 ) ( not ( = ?auto_7772 ?auto_7750 ) ) ( HOIST-AT ?auto_7763 ?auto_7772 ) ( AVAILABLE ?auto_7763 ) ( SURFACE-AT ?auto_7741 ?auto_7772 ) ( ON ?auto_7741 ?auto_7764 ) ( CLEAR ?auto_7741 ) ( not ( = ?auto_7740 ?auto_7741 ) ) ( not ( = ?auto_7740 ?auto_7764 ) ) ( not ( = ?auto_7741 ?auto_7764 ) ) ( not ( = ?auto_7748 ?auto_7763 ) ) ( IS-CRATE ?auto_7740 ) ( not ( = ?auto_7755 ?auto_7750 ) ) ( HOIST-AT ?auto_7767 ?auto_7755 ) ( AVAILABLE ?auto_7767 ) ( SURFACE-AT ?auto_7740 ?auto_7755 ) ( ON ?auto_7740 ?auto_7766 ) ( CLEAR ?auto_7740 ) ( not ( = ?auto_7739 ?auto_7740 ) ) ( not ( = ?auto_7739 ?auto_7766 ) ) ( not ( = ?auto_7740 ?auto_7766 ) ) ( not ( = ?auto_7748 ?auto_7767 ) ) ( IS-CRATE ?auto_7739 ) ( not ( = ?auto_7759 ?auto_7750 ) ) ( HOIST-AT ?auto_7765 ?auto_7759 ) ( AVAILABLE ?auto_7765 ) ( SURFACE-AT ?auto_7739 ?auto_7759 ) ( ON ?auto_7739 ?auto_7760 ) ( CLEAR ?auto_7739 ) ( not ( = ?auto_7738 ?auto_7739 ) ) ( not ( = ?auto_7738 ?auto_7760 ) ) ( not ( = ?auto_7739 ?auto_7760 ) ) ( not ( = ?auto_7748 ?auto_7765 ) ) ( IS-CRATE ?auto_7738 ) ( not ( = ?auto_7757 ?auto_7750 ) ) ( HOIST-AT ?auto_7758 ?auto_7757 ) ( AVAILABLE ?auto_7758 ) ( SURFACE-AT ?auto_7738 ?auto_7757 ) ( ON ?auto_7738 ?auto_7752 ) ( CLEAR ?auto_7738 ) ( not ( = ?auto_7737 ?auto_7738 ) ) ( not ( = ?auto_7737 ?auto_7752 ) ) ( not ( = ?auto_7738 ?auto_7752 ) ) ( not ( = ?auto_7748 ?auto_7758 ) ) ( SURFACE-AT ?auto_7736 ?auto_7750 ) ( CLEAR ?auto_7736 ) ( IS-CRATE ?auto_7737 ) ( AVAILABLE ?auto_7748 ) ( AVAILABLE ?auto_7761 ) ( SURFACE-AT ?auto_7737 ?auto_7754 ) ( ON ?auto_7737 ?auto_7753 ) ( CLEAR ?auto_7737 ) ( TRUCK-AT ?auto_7746 ?auto_7750 ) ( not ( = ?auto_7736 ?auto_7737 ) ) ( not ( = ?auto_7736 ?auto_7753 ) ) ( not ( = ?auto_7737 ?auto_7753 ) ) ( not ( = ?auto_7736 ?auto_7738 ) ) ( not ( = ?auto_7736 ?auto_7752 ) ) ( not ( = ?auto_7738 ?auto_7753 ) ) ( not ( = ?auto_7757 ?auto_7754 ) ) ( not ( = ?auto_7758 ?auto_7761 ) ) ( not ( = ?auto_7752 ?auto_7753 ) ) ( not ( = ?auto_7736 ?auto_7739 ) ) ( not ( = ?auto_7736 ?auto_7760 ) ) ( not ( = ?auto_7737 ?auto_7739 ) ) ( not ( = ?auto_7737 ?auto_7760 ) ) ( not ( = ?auto_7739 ?auto_7752 ) ) ( not ( = ?auto_7739 ?auto_7753 ) ) ( not ( = ?auto_7759 ?auto_7757 ) ) ( not ( = ?auto_7759 ?auto_7754 ) ) ( not ( = ?auto_7765 ?auto_7758 ) ) ( not ( = ?auto_7765 ?auto_7761 ) ) ( not ( = ?auto_7760 ?auto_7752 ) ) ( not ( = ?auto_7760 ?auto_7753 ) ) ( not ( = ?auto_7736 ?auto_7740 ) ) ( not ( = ?auto_7736 ?auto_7766 ) ) ( not ( = ?auto_7737 ?auto_7740 ) ) ( not ( = ?auto_7737 ?auto_7766 ) ) ( not ( = ?auto_7738 ?auto_7740 ) ) ( not ( = ?auto_7738 ?auto_7766 ) ) ( not ( = ?auto_7740 ?auto_7760 ) ) ( not ( = ?auto_7740 ?auto_7752 ) ) ( not ( = ?auto_7740 ?auto_7753 ) ) ( not ( = ?auto_7755 ?auto_7759 ) ) ( not ( = ?auto_7755 ?auto_7757 ) ) ( not ( = ?auto_7755 ?auto_7754 ) ) ( not ( = ?auto_7767 ?auto_7765 ) ) ( not ( = ?auto_7767 ?auto_7758 ) ) ( not ( = ?auto_7767 ?auto_7761 ) ) ( not ( = ?auto_7766 ?auto_7760 ) ) ( not ( = ?auto_7766 ?auto_7752 ) ) ( not ( = ?auto_7766 ?auto_7753 ) ) ( not ( = ?auto_7736 ?auto_7741 ) ) ( not ( = ?auto_7736 ?auto_7764 ) ) ( not ( = ?auto_7737 ?auto_7741 ) ) ( not ( = ?auto_7737 ?auto_7764 ) ) ( not ( = ?auto_7738 ?auto_7741 ) ) ( not ( = ?auto_7738 ?auto_7764 ) ) ( not ( = ?auto_7739 ?auto_7741 ) ) ( not ( = ?auto_7739 ?auto_7764 ) ) ( not ( = ?auto_7741 ?auto_7766 ) ) ( not ( = ?auto_7741 ?auto_7760 ) ) ( not ( = ?auto_7741 ?auto_7752 ) ) ( not ( = ?auto_7741 ?auto_7753 ) ) ( not ( = ?auto_7772 ?auto_7755 ) ) ( not ( = ?auto_7772 ?auto_7759 ) ) ( not ( = ?auto_7772 ?auto_7757 ) ) ( not ( = ?auto_7772 ?auto_7754 ) ) ( not ( = ?auto_7763 ?auto_7767 ) ) ( not ( = ?auto_7763 ?auto_7765 ) ) ( not ( = ?auto_7763 ?auto_7758 ) ) ( not ( = ?auto_7763 ?auto_7761 ) ) ( not ( = ?auto_7764 ?auto_7766 ) ) ( not ( = ?auto_7764 ?auto_7760 ) ) ( not ( = ?auto_7764 ?auto_7752 ) ) ( not ( = ?auto_7764 ?auto_7753 ) ) ( not ( = ?auto_7736 ?auto_7742 ) ) ( not ( = ?auto_7736 ?auto_7769 ) ) ( not ( = ?auto_7737 ?auto_7742 ) ) ( not ( = ?auto_7737 ?auto_7769 ) ) ( not ( = ?auto_7738 ?auto_7742 ) ) ( not ( = ?auto_7738 ?auto_7769 ) ) ( not ( = ?auto_7739 ?auto_7742 ) ) ( not ( = ?auto_7739 ?auto_7769 ) ) ( not ( = ?auto_7740 ?auto_7742 ) ) ( not ( = ?auto_7740 ?auto_7769 ) ) ( not ( = ?auto_7742 ?auto_7764 ) ) ( not ( = ?auto_7742 ?auto_7766 ) ) ( not ( = ?auto_7742 ?auto_7760 ) ) ( not ( = ?auto_7742 ?auto_7752 ) ) ( not ( = ?auto_7742 ?auto_7753 ) ) ( not ( = ?auto_7769 ?auto_7764 ) ) ( not ( = ?auto_7769 ?auto_7766 ) ) ( not ( = ?auto_7769 ?auto_7760 ) ) ( not ( = ?auto_7769 ?auto_7752 ) ) ( not ( = ?auto_7769 ?auto_7753 ) ) ( not ( = ?auto_7736 ?auto_7743 ) ) ( not ( = ?auto_7736 ?auto_7762 ) ) ( not ( = ?auto_7737 ?auto_7743 ) ) ( not ( = ?auto_7737 ?auto_7762 ) ) ( not ( = ?auto_7738 ?auto_7743 ) ) ( not ( = ?auto_7738 ?auto_7762 ) ) ( not ( = ?auto_7739 ?auto_7743 ) ) ( not ( = ?auto_7739 ?auto_7762 ) ) ( not ( = ?auto_7740 ?auto_7743 ) ) ( not ( = ?auto_7740 ?auto_7762 ) ) ( not ( = ?auto_7741 ?auto_7743 ) ) ( not ( = ?auto_7741 ?auto_7762 ) ) ( not ( = ?auto_7743 ?auto_7769 ) ) ( not ( = ?auto_7743 ?auto_7764 ) ) ( not ( = ?auto_7743 ?auto_7766 ) ) ( not ( = ?auto_7743 ?auto_7760 ) ) ( not ( = ?auto_7743 ?auto_7752 ) ) ( not ( = ?auto_7743 ?auto_7753 ) ) ( not ( = ?auto_7773 ?auto_7754 ) ) ( not ( = ?auto_7773 ?auto_7772 ) ) ( not ( = ?auto_7773 ?auto_7755 ) ) ( not ( = ?auto_7773 ?auto_7759 ) ) ( not ( = ?auto_7773 ?auto_7757 ) ) ( not ( = ?auto_7756 ?auto_7761 ) ) ( not ( = ?auto_7756 ?auto_7763 ) ) ( not ( = ?auto_7756 ?auto_7767 ) ) ( not ( = ?auto_7756 ?auto_7765 ) ) ( not ( = ?auto_7756 ?auto_7758 ) ) ( not ( = ?auto_7762 ?auto_7769 ) ) ( not ( = ?auto_7762 ?auto_7764 ) ) ( not ( = ?auto_7762 ?auto_7766 ) ) ( not ( = ?auto_7762 ?auto_7760 ) ) ( not ( = ?auto_7762 ?auto_7752 ) ) ( not ( = ?auto_7762 ?auto_7753 ) ) ( not ( = ?auto_7736 ?auto_7744 ) ) ( not ( = ?auto_7736 ?auto_7768 ) ) ( not ( = ?auto_7737 ?auto_7744 ) ) ( not ( = ?auto_7737 ?auto_7768 ) ) ( not ( = ?auto_7738 ?auto_7744 ) ) ( not ( = ?auto_7738 ?auto_7768 ) ) ( not ( = ?auto_7739 ?auto_7744 ) ) ( not ( = ?auto_7739 ?auto_7768 ) ) ( not ( = ?auto_7740 ?auto_7744 ) ) ( not ( = ?auto_7740 ?auto_7768 ) ) ( not ( = ?auto_7741 ?auto_7744 ) ) ( not ( = ?auto_7741 ?auto_7768 ) ) ( not ( = ?auto_7742 ?auto_7744 ) ) ( not ( = ?auto_7742 ?auto_7768 ) ) ( not ( = ?auto_7744 ?auto_7762 ) ) ( not ( = ?auto_7744 ?auto_7769 ) ) ( not ( = ?auto_7744 ?auto_7764 ) ) ( not ( = ?auto_7744 ?auto_7766 ) ) ( not ( = ?auto_7744 ?auto_7760 ) ) ( not ( = ?auto_7744 ?auto_7752 ) ) ( not ( = ?auto_7744 ?auto_7753 ) ) ( not ( = ?auto_7770 ?auto_7773 ) ) ( not ( = ?auto_7770 ?auto_7754 ) ) ( not ( = ?auto_7770 ?auto_7772 ) ) ( not ( = ?auto_7770 ?auto_7755 ) ) ( not ( = ?auto_7770 ?auto_7759 ) ) ( not ( = ?auto_7770 ?auto_7757 ) ) ( not ( = ?auto_7771 ?auto_7756 ) ) ( not ( = ?auto_7771 ?auto_7761 ) ) ( not ( = ?auto_7771 ?auto_7763 ) ) ( not ( = ?auto_7771 ?auto_7767 ) ) ( not ( = ?auto_7771 ?auto_7765 ) ) ( not ( = ?auto_7771 ?auto_7758 ) ) ( not ( = ?auto_7768 ?auto_7762 ) ) ( not ( = ?auto_7768 ?auto_7769 ) ) ( not ( = ?auto_7768 ?auto_7764 ) ) ( not ( = ?auto_7768 ?auto_7766 ) ) ( not ( = ?auto_7768 ?auto_7760 ) ) ( not ( = ?auto_7768 ?auto_7752 ) ) ( not ( = ?auto_7768 ?auto_7753 ) ) ( not ( = ?auto_7736 ?auto_7745 ) ) ( not ( = ?auto_7736 ?auto_7747 ) ) ( not ( = ?auto_7737 ?auto_7745 ) ) ( not ( = ?auto_7737 ?auto_7747 ) ) ( not ( = ?auto_7738 ?auto_7745 ) ) ( not ( = ?auto_7738 ?auto_7747 ) ) ( not ( = ?auto_7739 ?auto_7745 ) ) ( not ( = ?auto_7739 ?auto_7747 ) ) ( not ( = ?auto_7740 ?auto_7745 ) ) ( not ( = ?auto_7740 ?auto_7747 ) ) ( not ( = ?auto_7741 ?auto_7745 ) ) ( not ( = ?auto_7741 ?auto_7747 ) ) ( not ( = ?auto_7742 ?auto_7745 ) ) ( not ( = ?auto_7742 ?auto_7747 ) ) ( not ( = ?auto_7743 ?auto_7745 ) ) ( not ( = ?auto_7743 ?auto_7747 ) ) ( not ( = ?auto_7745 ?auto_7768 ) ) ( not ( = ?auto_7745 ?auto_7762 ) ) ( not ( = ?auto_7745 ?auto_7769 ) ) ( not ( = ?auto_7745 ?auto_7764 ) ) ( not ( = ?auto_7745 ?auto_7766 ) ) ( not ( = ?auto_7745 ?auto_7760 ) ) ( not ( = ?auto_7745 ?auto_7752 ) ) ( not ( = ?auto_7745 ?auto_7753 ) ) ( not ( = ?auto_7749 ?auto_7770 ) ) ( not ( = ?auto_7749 ?auto_7773 ) ) ( not ( = ?auto_7749 ?auto_7754 ) ) ( not ( = ?auto_7749 ?auto_7772 ) ) ( not ( = ?auto_7749 ?auto_7755 ) ) ( not ( = ?auto_7749 ?auto_7759 ) ) ( not ( = ?auto_7749 ?auto_7757 ) ) ( not ( = ?auto_7751 ?auto_7771 ) ) ( not ( = ?auto_7751 ?auto_7756 ) ) ( not ( = ?auto_7751 ?auto_7761 ) ) ( not ( = ?auto_7751 ?auto_7763 ) ) ( not ( = ?auto_7751 ?auto_7767 ) ) ( not ( = ?auto_7751 ?auto_7765 ) ) ( not ( = ?auto_7751 ?auto_7758 ) ) ( not ( = ?auto_7747 ?auto_7768 ) ) ( not ( = ?auto_7747 ?auto_7762 ) ) ( not ( = ?auto_7747 ?auto_7769 ) ) ( not ( = ?auto_7747 ?auto_7764 ) ) ( not ( = ?auto_7747 ?auto_7766 ) ) ( not ( = ?auto_7747 ?auto_7760 ) ) ( not ( = ?auto_7747 ?auto_7752 ) ) ( not ( = ?auto_7747 ?auto_7753 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_7736 ?auto_7737 ?auto_7738 ?auto_7739 ?auto_7740 ?auto_7741 ?auto_7742 ?auto_7743 ?auto_7744 )
      ( MAKE-1CRATE ?auto_7744 ?auto_7745 )
      ( MAKE-9CRATE-VERIFY ?auto_7736 ?auto_7737 ?auto_7738 ?auto_7739 ?auto_7740 ?auto_7741 ?auto_7742 ?auto_7743 ?auto_7744 ?auto_7745 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_7795 - SURFACE
      ?auto_7796 - SURFACE
      ?auto_7797 - SURFACE
      ?auto_7798 - SURFACE
      ?auto_7799 - SURFACE
      ?auto_7800 - SURFACE
      ?auto_7801 - SURFACE
      ?auto_7802 - SURFACE
      ?auto_7803 - SURFACE
      ?auto_7804 - SURFACE
      ?auto_7805 - SURFACE
    )
    :vars
    (
      ?auto_7809 - HOIST
      ?auto_7811 - PLACE
      ?auto_7806 - PLACE
      ?auto_7808 - HOIST
      ?auto_7810 - SURFACE
      ?auto_7817 - PLACE
      ?auto_7834 - HOIST
      ?auto_7818 - SURFACE
      ?auto_7816 - PLACE
      ?auto_7835 - HOIST
      ?auto_7814 - SURFACE
      ?auto_7812 - PLACE
      ?auto_7815 - HOIST
      ?auto_7830 - SURFACE
      ?auto_7822 - PLACE
      ?auto_7827 - HOIST
      ?auto_7823 - SURFACE
      ?auto_7824 - PLACE
      ?auto_7836 - HOIST
      ?auto_7826 - SURFACE
      ?auto_7831 - PLACE
      ?auto_7825 - HOIST
      ?auto_7819 - SURFACE
      ?auto_7813 - PLACE
      ?auto_7820 - HOIST
      ?auto_7821 - SURFACE
      ?auto_7833 - PLACE
      ?auto_7832 - HOIST
      ?auto_7828 - SURFACE
      ?auto_7829 - SURFACE
      ?auto_7807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7809 ?auto_7811 ) ( IS-CRATE ?auto_7805 ) ( not ( = ?auto_7806 ?auto_7811 ) ) ( HOIST-AT ?auto_7808 ?auto_7806 ) ( AVAILABLE ?auto_7808 ) ( SURFACE-AT ?auto_7805 ?auto_7806 ) ( ON ?auto_7805 ?auto_7810 ) ( CLEAR ?auto_7805 ) ( not ( = ?auto_7804 ?auto_7805 ) ) ( not ( = ?auto_7804 ?auto_7810 ) ) ( not ( = ?auto_7805 ?auto_7810 ) ) ( not ( = ?auto_7809 ?auto_7808 ) ) ( IS-CRATE ?auto_7804 ) ( not ( = ?auto_7817 ?auto_7811 ) ) ( HOIST-AT ?auto_7834 ?auto_7817 ) ( AVAILABLE ?auto_7834 ) ( SURFACE-AT ?auto_7804 ?auto_7817 ) ( ON ?auto_7804 ?auto_7818 ) ( CLEAR ?auto_7804 ) ( not ( = ?auto_7803 ?auto_7804 ) ) ( not ( = ?auto_7803 ?auto_7818 ) ) ( not ( = ?auto_7804 ?auto_7818 ) ) ( not ( = ?auto_7809 ?auto_7834 ) ) ( IS-CRATE ?auto_7803 ) ( not ( = ?auto_7816 ?auto_7811 ) ) ( HOIST-AT ?auto_7835 ?auto_7816 ) ( AVAILABLE ?auto_7835 ) ( SURFACE-AT ?auto_7803 ?auto_7816 ) ( ON ?auto_7803 ?auto_7814 ) ( CLEAR ?auto_7803 ) ( not ( = ?auto_7802 ?auto_7803 ) ) ( not ( = ?auto_7802 ?auto_7814 ) ) ( not ( = ?auto_7803 ?auto_7814 ) ) ( not ( = ?auto_7809 ?auto_7835 ) ) ( IS-CRATE ?auto_7802 ) ( not ( = ?auto_7812 ?auto_7811 ) ) ( HOIST-AT ?auto_7815 ?auto_7812 ) ( AVAILABLE ?auto_7815 ) ( SURFACE-AT ?auto_7802 ?auto_7812 ) ( ON ?auto_7802 ?auto_7830 ) ( CLEAR ?auto_7802 ) ( not ( = ?auto_7801 ?auto_7802 ) ) ( not ( = ?auto_7801 ?auto_7830 ) ) ( not ( = ?auto_7802 ?auto_7830 ) ) ( not ( = ?auto_7809 ?auto_7815 ) ) ( IS-CRATE ?auto_7801 ) ( not ( = ?auto_7822 ?auto_7811 ) ) ( HOIST-AT ?auto_7827 ?auto_7822 ) ( SURFACE-AT ?auto_7801 ?auto_7822 ) ( ON ?auto_7801 ?auto_7823 ) ( CLEAR ?auto_7801 ) ( not ( = ?auto_7800 ?auto_7801 ) ) ( not ( = ?auto_7800 ?auto_7823 ) ) ( not ( = ?auto_7801 ?auto_7823 ) ) ( not ( = ?auto_7809 ?auto_7827 ) ) ( IS-CRATE ?auto_7800 ) ( not ( = ?auto_7824 ?auto_7811 ) ) ( HOIST-AT ?auto_7836 ?auto_7824 ) ( AVAILABLE ?auto_7836 ) ( SURFACE-AT ?auto_7800 ?auto_7824 ) ( ON ?auto_7800 ?auto_7826 ) ( CLEAR ?auto_7800 ) ( not ( = ?auto_7799 ?auto_7800 ) ) ( not ( = ?auto_7799 ?auto_7826 ) ) ( not ( = ?auto_7800 ?auto_7826 ) ) ( not ( = ?auto_7809 ?auto_7836 ) ) ( IS-CRATE ?auto_7799 ) ( not ( = ?auto_7831 ?auto_7811 ) ) ( HOIST-AT ?auto_7825 ?auto_7831 ) ( AVAILABLE ?auto_7825 ) ( SURFACE-AT ?auto_7799 ?auto_7831 ) ( ON ?auto_7799 ?auto_7819 ) ( CLEAR ?auto_7799 ) ( not ( = ?auto_7798 ?auto_7799 ) ) ( not ( = ?auto_7798 ?auto_7819 ) ) ( not ( = ?auto_7799 ?auto_7819 ) ) ( not ( = ?auto_7809 ?auto_7825 ) ) ( IS-CRATE ?auto_7798 ) ( not ( = ?auto_7813 ?auto_7811 ) ) ( HOIST-AT ?auto_7820 ?auto_7813 ) ( AVAILABLE ?auto_7820 ) ( SURFACE-AT ?auto_7798 ?auto_7813 ) ( ON ?auto_7798 ?auto_7821 ) ( CLEAR ?auto_7798 ) ( not ( = ?auto_7797 ?auto_7798 ) ) ( not ( = ?auto_7797 ?auto_7821 ) ) ( not ( = ?auto_7798 ?auto_7821 ) ) ( not ( = ?auto_7809 ?auto_7820 ) ) ( IS-CRATE ?auto_7797 ) ( not ( = ?auto_7833 ?auto_7811 ) ) ( HOIST-AT ?auto_7832 ?auto_7833 ) ( AVAILABLE ?auto_7832 ) ( SURFACE-AT ?auto_7797 ?auto_7833 ) ( ON ?auto_7797 ?auto_7828 ) ( CLEAR ?auto_7797 ) ( not ( = ?auto_7796 ?auto_7797 ) ) ( not ( = ?auto_7796 ?auto_7828 ) ) ( not ( = ?auto_7797 ?auto_7828 ) ) ( not ( = ?auto_7809 ?auto_7832 ) ) ( SURFACE-AT ?auto_7795 ?auto_7811 ) ( CLEAR ?auto_7795 ) ( IS-CRATE ?auto_7796 ) ( AVAILABLE ?auto_7809 ) ( AVAILABLE ?auto_7827 ) ( SURFACE-AT ?auto_7796 ?auto_7822 ) ( ON ?auto_7796 ?auto_7829 ) ( CLEAR ?auto_7796 ) ( TRUCK-AT ?auto_7807 ?auto_7811 ) ( not ( = ?auto_7795 ?auto_7796 ) ) ( not ( = ?auto_7795 ?auto_7829 ) ) ( not ( = ?auto_7796 ?auto_7829 ) ) ( not ( = ?auto_7795 ?auto_7797 ) ) ( not ( = ?auto_7795 ?auto_7828 ) ) ( not ( = ?auto_7797 ?auto_7829 ) ) ( not ( = ?auto_7833 ?auto_7822 ) ) ( not ( = ?auto_7832 ?auto_7827 ) ) ( not ( = ?auto_7828 ?auto_7829 ) ) ( not ( = ?auto_7795 ?auto_7798 ) ) ( not ( = ?auto_7795 ?auto_7821 ) ) ( not ( = ?auto_7796 ?auto_7798 ) ) ( not ( = ?auto_7796 ?auto_7821 ) ) ( not ( = ?auto_7798 ?auto_7828 ) ) ( not ( = ?auto_7798 ?auto_7829 ) ) ( not ( = ?auto_7813 ?auto_7833 ) ) ( not ( = ?auto_7813 ?auto_7822 ) ) ( not ( = ?auto_7820 ?auto_7832 ) ) ( not ( = ?auto_7820 ?auto_7827 ) ) ( not ( = ?auto_7821 ?auto_7828 ) ) ( not ( = ?auto_7821 ?auto_7829 ) ) ( not ( = ?auto_7795 ?auto_7799 ) ) ( not ( = ?auto_7795 ?auto_7819 ) ) ( not ( = ?auto_7796 ?auto_7799 ) ) ( not ( = ?auto_7796 ?auto_7819 ) ) ( not ( = ?auto_7797 ?auto_7799 ) ) ( not ( = ?auto_7797 ?auto_7819 ) ) ( not ( = ?auto_7799 ?auto_7821 ) ) ( not ( = ?auto_7799 ?auto_7828 ) ) ( not ( = ?auto_7799 ?auto_7829 ) ) ( not ( = ?auto_7831 ?auto_7813 ) ) ( not ( = ?auto_7831 ?auto_7833 ) ) ( not ( = ?auto_7831 ?auto_7822 ) ) ( not ( = ?auto_7825 ?auto_7820 ) ) ( not ( = ?auto_7825 ?auto_7832 ) ) ( not ( = ?auto_7825 ?auto_7827 ) ) ( not ( = ?auto_7819 ?auto_7821 ) ) ( not ( = ?auto_7819 ?auto_7828 ) ) ( not ( = ?auto_7819 ?auto_7829 ) ) ( not ( = ?auto_7795 ?auto_7800 ) ) ( not ( = ?auto_7795 ?auto_7826 ) ) ( not ( = ?auto_7796 ?auto_7800 ) ) ( not ( = ?auto_7796 ?auto_7826 ) ) ( not ( = ?auto_7797 ?auto_7800 ) ) ( not ( = ?auto_7797 ?auto_7826 ) ) ( not ( = ?auto_7798 ?auto_7800 ) ) ( not ( = ?auto_7798 ?auto_7826 ) ) ( not ( = ?auto_7800 ?auto_7819 ) ) ( not ( = ?auto_7800 ?auto_7821 ) ) ( not ( = ?auto_7800 ?auto_7828 ) ) ( not ( = ?auto_7800 ?auto_7829 ) ) ( not ( = ?auto_7824 ?auto_7831 ) ) ( not ( = ?auto_7824 ?auto_7813 ) ) ( not ( = ?auto_7824 ?auto_7833 ) ) ( not ( = ?auto_7824 ?auto_7822 ) ) ( not ( = ?auto_7836 ?auto_7825 ) ) ( not ( = ?auto_7836 ?auto_7820 ) ) ( not ( = ?auto_7836 ?auto_7832 ) ) ( not ( = ?auto_7836 ?auto_7827 ) ) ( not ( = ?auto_7826 ?auto_7819 ) ) ( not ( = ?auto_7826 ?auto_7821 ) ) ( not ( = ?auto_7826 ?auto_7828 ) ) ( not ( = ?auto_7826 ?auto_7829 ) ) ( not ( = ?auto_7795 ?auto_7801 ) ) ( not ( = ?auto_7795 ?auto_7823 ) ) ( not ( = ?auto_7796 ?auto_7801 ) ) ( not ( = ?auto_7796 ?auto_7823 ) ) ( not ( = ?auto_7797 ?auto_7801 ) ) ( not ( = ?auto_7797 ?auto_7823 ) ) ( not ( = ?auto_7798 ?auto_7801 ) ) ( not ( = ?auto_7798 ?auto_7823 ) ) ( not ( = ?auto_7799 ?auto_7801 ) ) ( not ( = ?auto_7799 ?auto_7823 ) ) ( not ( = ?auto_7801 ?auto_7826 ) ) ( not ( = ?auto_7801 ?auto_7819 ) ) ( not ( = ?auto_7801 ?auto_7821 ) ) ( not ( = ?auto_7801 ?auto_7828 ) ) ( not ( = ?auto_7801 ?auto_7829 ) ) ( not ( = ?auto_7823 ?auto_7826 ) ) ( not ( = ?auto_7823 ?auto_7819 ) ) ( not ( = ?auto_7823 ?auto_7821 ) ) ( not ( = ?auto_7823 ?auto_7828 ) ) ( not ( = ?auto_7823 ?auto_7829 ) ) ( not ( = ?auto_7795 ?auto_7802 ) ) ( not ( = ?auto_7795 ?auto_7830 ) ) ( not ( = ?auto_7796 ?auto_7802 ) ) ( not ( = ?auto_7796 ?auto_7830 ) ) ( not ( = ?auto_7797 ?auto_7802 ) ) ( not ( = ?auto_7797 ?auto_7830 ) ) ( not ( = ?auto_7798 ?auto_7802 ) ) ( not ( = ?auto_7798 ?auto_7830 ) ) ( not ( = ?auto_7799 ?auto_7802 ) ) ( not ( = ?auto_7799 ?auto_7830 ) ) ( not ( = ?auto_7800 ?auto_7802 ) ) ( not ( = ?auto_7800 ?auto_7830 ) ) ( not ( = ?auto_7802 ?auto_7823 ) ) ( not ( = ?auto_7802 ?auto_7826 ) ) ( not ( = ?auto_7802 ?auto_7819 ) ) ( not ( = ?auto_7802 ?auto_7821 ) ) ( not ( = ?auto_7802 ?auto_7828 ) ) ( not ( = ?auto_7802 ?auto_7829 ) ) ( not ( = ?auto_7812 ?auto_7822 ) ) ( not ( = ?auto_7812 ?auto_7824 ) ) ( not ( = ?auto_7812 ?auto_7831 ) ) ( not ( = ?auto_7812 ?auto_7813 ) ) ( not ( = ?auto_7812 ?auto_7833 ) ) ( not ( = ?auto_7815 ?auto_7827 ) ) ( not ( = ?auto_7815 ?auto_7836 ) ) ( not ( = ?auto_7815 ?auto_7825 ) ) ( not ( = ?auto_7815 ?auto_7820 ) ) ( not ( = ?auto_7815 ?auto_7832 ) ) ( not ( = ?auto_7830 ?auto_7823 ) ) ( not ( = ?auto_7830 ?auto_7826 ) ) ( not ( = ?auto_7830 ?auto_7819 ) ) ( not ( = ?auto_7830 ?auto_7821 ) ) ( not ( = ?auto_7830 ?auto_7828 ) ) ( not ( = ?auto_7830 ?auto_7829 ) ) ( not ( = ?auto_7795 ?auto_7803 ) ) ( not ( = ?auto_7795 ?auto_7814 ) ) ( not ( = ?auto_7796 ?auto_7803 ) ) ( not ( = ?auto_7796 ?auto_7814 ) ) ( not ( = ?auto_7797 ?auto_7803 ) ) ( not ( = ?auto_7797 ?auto_7814 ) ) ( not ( = ?auto_7798 ?auto_7803 ) ) ( not ( = ?auto_7798 ?auto_7814 ) ) ( not ( = ?auto_7799 ?auto_7803 ) ) ( not ( = ?auto_7799 ?auto_7814 ) ) ( not ( = ?auto_7800 ?auto_7803 ) ) ( not ( = ?auto_7800 ?auto_7814 ) ) ( not ( = ?auto_7801 ?auto_7803 ) ) ( not ( = ?auto_7801 ?auto_7814 ) ) ( not ( = ?auto_7803 ?auto_7830 ) ) ( not ( = ?auto_7803 ?auto_7823 ) ) ( not ( = ?auto_7803 ?auto_7826 ) ) ( not ( = ?auto_7803 ?auto_7819 ) ) ( not ( = ?auto_7803 ?auto_7821 ) ) ( not ( = ?auto_7803 ?auto_7828 ) ) ( not ( = ?auto_7803 ?auto_7829 ) ) ( not ( = ?auto_7816 ?auto_7812 ) ) ( not ( = ?auto_7816 ?auto_7822 ) ) ( not ( = ?auto_7816 ?auto_7824 ) ) ( not ( = ?auto_7816 ?auto_7831 ) ) ( not ( = ?auto_7816 ?auto_7813 ) ) ( not ( = ?auto_7816 ?auto_7833 ) ) ( not ( = ?auto_7835 ?auto_7815 ) ) ( not ( = ?auto_7835 ?auto_7827 ) ) ( not ( = ?auto_7835 ?auto_7836 ) ) ( not ( = ?auto_7835 ?auto_7825 ) ) ( not ( = ?auto_7835 ?auto_7820 ) ) ( not ( = ?auto_7835 ?auto_7832 ) ) ( not ( = ?auto_7814 ?auto_7830 ) ) ( not ( = ?auto_7814 ?auto_7823 ) ) ( not ( = ?auto_7814 ?auto_7826 ) ) ( not ( = ?auto_7814 ?auto_7819 ) ) ( not ( = ?auto_7814 ?auto_7821 ) ) ( not ( = ?auto_7814 ?auto_7828 ) ) ( not ( = ?auto_7814 ?auto_7829 ) ) ( not ( = ?auto_7795 ?auto_7804 ) ) ( not ( = ?auto_7795 ?auto_7818 ) ) ( not ( = ?auto_7796 ?auto_7804 ) ) ( not ( = ?auto_7796 ?auto_7818 ) ) ( not ( = ?auto_7797 ?auto_7804 ) ) ( not ( = ?auto_7797 ?auto_7818 ) ) ( not ( = ?auto_7798 ?auto_7804 ) ) ( not ( = ?auto_7798 ?auto_7818 ) ) ( not ( = ?auto_7799 ?auto_7804 ) ) ( not ( = ?auto_7799 ?auto_7818 ) ) ( not ( = ?auto_7800 ?auto_7804 ) ) ( not ( = ?auto_7800 ?auto_7818 ) ) ( not ( = ?auto_7801 ?auto_7804 ) ) ( not ( = ?auto_7801 ?auto_7818 ) ) ( not ( = ?auto_7802 ?auto_7804 ) ) ( not ( = ?auto_7802 ?auto_7818 ) ) ( not ( = ?auto_7804 ?auto_7814 ) ) ( not ( = ?auto_7804 ?auto_7830 ) ) ( not ( = ?auto_7804 ?auto_7823 ) ) ( not ( = ?auto_7804 ?auto_7826 ) ) ( not ( = ?auto_7804 ?auto_7819 ) ) ( not ( = ?auto_7804 ?auto_7821 ) ) ( not ( = ?auto_7804 ?auto_7828 ) ) ( not ( = ?auto_7804 ?auto_7829 ) ) ( not ( = ?auto_7817 ?auto_7816 ) ) ( not ( = ?auto_7817 ?auto_7812 ) ) ( not ( = ?auto_7817 ?auto_7822 ) ) ( not ( = ?auto_7817 ?auto_7824 ) ) ( not ( = ?auto_7817 ?auto_7831 ) ) ( not ( = ?auto_7817 ?auto_7813 ) ) ( not ( = ?auto_7817 ?auto_7833 ) ) ( not ( = ?auto_7834 ?auto_7835 ) ) ( not ( = ?auto_7834 ?auto_7815 ) ) ( not ( = ?auto_7834 ?auto_7827 ) ) ( not ( = ?auto_7834 ?auto_7836 ) ) ( not ( = ?auto_7834 ?auto_7825 ) ) ( not ( = ?auto_7834 ?auto_7820 ) ) ( not ( = ?auto_7834 ?auto_7832 ) ) ( not ( = ?auto_7818 ?auto_7814 ) ) ( not ( = ?auto_7818 ?auto_7830 ) ) ( not ( = ?auto_7818 ?auto_7823 ) ) ( not ( = ?auto_7818 ?auto_7826 ) ) ( not ( = ?auto_7818 ?auto_7819 ) ) ( not ( = ?auto_7818 ?auto_7821 ) ) ( not ( = ?auto_7818 ?auto_7828 ) ) ( not ( = ?auto_7818 ?auto_7829 ) ) ( not ( = ?auto_7795 ?auto_7805 ) ) ( not ( = ?auto_7795 ?auto_7810 ) ) ( not ( = ?auto_7796 ?auto_7805 ) ) ( not ( = ?auto_7796 ?auto_7810 ) ) ( not ( = ?auto_7797 ?auto_7805 ) ) ( not ( = ?auto_7797 ?auto_7810 ) ) ( not ( = ?auto_7798 ?auto_7805 ) ) ( not ( = ?auto_7798 ?auto_7810 ) ) ( not ( = ?auto_7799 ?auto_7805 ) ) ( not ( = ?auto_7799 ?auto_7810 ) ) ( not ( = ?auto_7800 ?auto_7805 ) ) ( not ( = ?auto_7800 ?auto_7810 ) ) ( not ( = ?auto_7801 ?auto_7805 ) ) ( not ( = ?auto_7801 ?auto_7810 ) ) ( not ( = ?auto_7802 ?auto_7805 ) ) ( not ( = ?auto_7802 ?auto_7810 ) ) ( not ( = ?auto_7803 ?auto_7805 ) ) ( not ( = ?auto_7803 ?auto_7810 ) ) ( not ( = ?auto_7805 ?auto_7818 ) ) ( not ( = ?auto_7805 ?auto_7814 ) ) ( not ( = ?auto_7805 ?auto_7830 ) ) ( not ( = ?auto_7805 ?auto_7823 ) ) ( not ( = ?auto_7805 ?auto_7826 ) ) ( not ( = ?auto_7805 ?auto_7819 ) ) ( not ( = ?auto_7805 ?auto_7821 ) ) ( not ( = ?auto_7805 ?auto_7828 ) ) ( not ( = ?auto_7805 ?auto_7829 ) ) ( not ( = ?auto_7806 ?auto_7817 ) ) ( not ( = ?auto_7806 ?auto_7816 ) ) ( not ( = ?auto_7806 ?auto_7812 ) ) ( not ( = ?auto_7806 ?auto_7822 ) ) ( not ( = ?auto_7806 ?auto_7824 ) ) ( not ( = ?auto_7806 ?auto_7831 ) ) ( not ( = ?auto_7806 ?auto_7813 ) ) ( not ( = ?auto_7806 ?auto_7833 ) ) ( not ( = ?auto_7808 ?auto_7834 ) ) ( not ( = ?auto_7808 ?auto_7835 ) ) ( not ( = ?auto_7808 ?auto_7815 ) ) ( not ( = ?auto_7808 ?auto_7827 ) ) ( not ( = ?auto_7808 ?auto_7836 ) ) ( not ( = ?auto_7808 ?auto_7825 ) ) ( not ( = ?auto_7808 ?auto_7820 ) ) ( not ( = ?auto_7808 ?auto_7832 ) ) ( not ( = ?auto_7810 ?auto_7818 ) ) ( not ( = ?auto_7810 ?auto_7814 ) ) ( not ( = ?auto_7810 ?auto_7830 ) ) ( not ( = ?auto_7810 ?auto_7823 ) ) ( not ( = ?auto_7810 ?auto_7826 ) ) ( not ( = ?auto_7810 ?auto_7819 ) ) ( not ( = ?auto_7810 ?auto_7821 ) ) ( not ( = ?auto_7810 ?auto_7828 ) ) ( not ( = ?auto_7810 ?auto_7829 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_7795 ?auto_7796 ?auto_7797 ?auto_7798 ?auto_7799 ?auto_7800 ?auto_7801 ?auto_7802 ?auto_7803 ?auto_7804 )
      ( MAKE-1CRATE ?auto_7804 ?auto_7805 )
      ( MAKE-10CRATE-VERIFY ?auto_7795 ?auto_7796 ?auto_7797 ?auto_7798 ?auto_7799 ?auto_7800 ?auto_7801 ?auto_7802 ?auto_7803 ?auto_7804 ?auto_7805 ) )
  )

)

