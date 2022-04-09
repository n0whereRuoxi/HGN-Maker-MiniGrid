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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7444 - SURFACE
      ?auto_7445 - SURFACE
    )
    :vars
    (
      ?auto_7446 - HOIST
      ?auto_7447 - PLACE
      ?auto_7449 - PLACE
      ?auto_7450 - HOIST
      ?auto_7451 - SURFACE
      ?auto_7448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7446 ?auto_7447 ) ( SURFACE-AT ?auto_7444 ?auto_7447 ) ( CLEAR ?auto_7444 ) ( IS-CRATE ?auto_7445 ) ( AVAILABLE ?auto_7446 ) ( not ( = ?auto_7449 ?auto_7447 ) ) ( HOIST-AT ?auto_7450 ?auto_7449 ) ( AVAILABLE ?auto_7450 ) ( SURFACE-AT ?auto_7445 ?auto_7449 ) ( ON ?auto_7445 ?auto_7451 ) ( CLEAR ?auto_7445 ) ( TRUCK-AT ?auto_7448 ?auto_7447 ) ( not ( = ?auto_7444 ?auto_7445 ) ) ( not ( = ?auto_7444 ?auto_7451 ) ) ( not ( = ?auto_7445 ?auto_7451 ) ) ( not ( = ?auto_7446 ?auto_7450 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7448 ?auto_7447 ?auto_7449 )
      ( !LIFT ?auto_7450 ?auto_7445 ?auto_7451 ?auto_7449 )
      ( !LOAD ?auto_7450 ?auto_7445 ?auto_7448 ?auto_7449 )
      ( !DRIVE ?auto_7448 ?auto_7449 ?auto_7447 )
      ( !UNLOAD ?auto_7446 ?auto_7445 ?auto_7448 ?auto_7447 )
      ( !DROP ?auto_7446 ?auto_7445 ?auto_7444 ?auto_7447 )
      ( MAKE-1CRATE-VERIFY ?auto_7444 ?auto_7445 ) )
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
      ?auto_7460 - HOIST
      ?auto_7463 - PLACE
      ?auto_7461 - PLACE
      ?auto_7458 - HOIST
      ?auto_7459 - SURFACE
      ?auto_7464 - PLACE
      ?auto_7465 - HOIST
      ?auto_7466 - SURFACE
      ?auto_7462 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7460 ?auto_7463 ) ( IS-CRATE ?auto_7457 ) ( not ( = ?auto_7461 ?auto_7463 ) ) ( HOIST-AT ?auto_7458 ?auto_7461 ) ( AVAILABLE ?auto_7458 ) ( SURFACE-AT ?auto_7457 ?auto_7461 ) ( ON ?auto_7457 ?auto_7459 ) ( CLEAR ?auto_7457 ) ( not ( = ?auto_7456 ?auto_7457 ) ) ( not ( = ?auto_7456 ?auto_7459 ) ) ( not ( = ?auto_7457 ?auto_7459 ) ) ( not ( = ?auto_7460 ?auto_7458 ) ) ( SURFACE-AT ?auto_7455 ?auto_7463 ) ( CLEAR ?auto_7455 ) ( IS-CRATE ?auto_7456 ) ( AVAILABLE ?auto_7460 ) ( not ( = ?auto_7464 ?auto_7463 ) ) ( HOIST-AT ?auto_7465 ?auto_7464 ) ( AVAILABLE ?auto_7465 ) ( SURFACE-AT ?auto_7456 ?auto_7464 ) ( ON ?auto_7456 ?auto_7466 ) ( CLEAR ?auto_7456 ) ( TRUCK-AT ?auto_7462 ?auto_7463 ) ( not ( = ?auto_7455 ?auto_7456 ) ) ( not ( = ?auto_7455 ?auto_7466 ) ) ( not ( = ?auto_7456 ?auto_7466 ) ) ( not ( = ?auto_7460 ?auto_7465 ) ) ( not ( = ?auto_7455 ?auto_7457 ) ) ( not ( = ?auto_7455 ?auto_7459 ) ) ( not ( = ?auto_7457 ?auto_7466 ) ) ( not ( = ?auto_7461 ?auto_7464 ) ) ( not ( = ?auto_7458 ?auto_7465 ) ) ( not ( = ?auto_7459 ?auto_7466 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7455 ?auto_7456 )
      ( MAKE-1CRATE ?auto_7456 ?auto_7457 )
      ( MAKE-2CRATE-VERIFY ?auto_7455 ?auto_7456 ?auto_7457 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7469 - SURFACE
      ?auto_7470 - SURFACE
    )
    :vars
    (
      ?auto_7471 - HOIST
      ?auto_7472 - PLACE
      ?auto_7474 - PLACE
      ?auto_7475 - HOIST
      ?auto_7476 - SURFACE
      ?auto_7473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7471 ?auto_7472 ) ( SURFACE-AT ?auto_7469 ?auto_7472 ) ( CLEAR ?auto_7469 ) ( IS-CRATE ?auto_7470 ) ( AVAILABLE ?auto_7471 ) ( not ( = ?auto_7474 ?auto_7472 ) ) ( HOIST-AT ?auto_7475 ?auto_7474 ) ( AVAILABLE ?auto_7475 ) ( SURFACE-AT ?auto_7470 ?auto_7474 ) ( ON ?auto_7470 ?auto_7476 ) ( CLEAR ?auto_7470 ) ( TRUCK-AT ?auto_7473 ?auto_7472 ) ( not ( = ?auto_7469 ?auto_7470 ) ) ( not ( = ?auto_7469 ?auto_7476 ) ) ( not ( = ?auto_7470 ?auto_7476 ) ) ( not ( = ?auto_7471 ?auto_7475 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7473 ?auto_7472 ?auto_7474 )
      ( !LIFT ?auto_7475 ?auto_7470 ?auto_7476 ?auto_7474 )
      ( !LOAD ?auto_7475 ?auto_7470 ?auto_7473 ?auto_7474 )
      ( !DRIVE ?auto_7473 ?auto_7474 ?auto_7472 )
      ( !UNLOAD ?auto_7471 ?auto_7470 ?auto_7473 ?auto_7472 )
      ( !DROP ?auto_7471 ?auto_7470 ?auto_7469 ?auto_7472 )
      ( MAKE-1CRATE-VERIFY ?auto_7469 ?auto_7470 ) )
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
      ?auto_7488 - HOIST
      ?auto_7487 - PLACE
      ?auto_7485 - PLACE
      ?auto_7490 - HOIST
      ?auto_7486 - SURFACE
      ?auto_7495 - PLACE
      ?auto_7492 - HOIST
      ?auto_7496 - SURFACE
      ?auto_7491 - PLACE
      ?auto_7494 - HOIST
      ?auto_7493 - SURFACE
      ?auto_7489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7488 ?auto_7487 ) ( IS-CRATE ?auto_7484 ) ( not ( = ?auto_7485 ?auto_7487 ) ) ( HOIST-AT ?auto_7490 ?auto_7485 ) ( AVAILABLE ?auto_7490 ) ( SURFACE-AT ?auto_7484 ?auto_7485 ) ( ON ?auto_7484 ?auto_7486 ) ( CLEAR ?auto_7484 ) ( not ( = ?auto_7483 ?auto_7484 ) ) ( not ( = ?auto_7483 ?auto_7486 ) ) ( not ( = ?auto_7484 ?auto_7486 ) ) ( not ( = ?auto_7488 ?auto_7490 ) ) ( IS-CRATE ?auto_7483 ) ( not ( = ?auto_7495 ?auto_7487 ) ) ( HOIST-AT ?auto_7492 ?auto_7495 ) ( AVAILABLE ?auto_7492 ) ( SURFACE-AT ?auto_7483 ?auto_7495 ) ( ON ?auto_7483 ?auto_7496 ) ( CLEAR ?auto_7483 ) ( not ( = ?auto_7482 ?auto_7483 ) ) ( not ( = ?auto_7482 ?auto_7496 ) ) ( not ( = ?auto_7483 ?auto_7496 ) ) ( not ( = ?auto_7488 ?auto_7492 ) ) ( SURFACE-AT ?auto_7481 ?auto_7487 ) ( CLEAR ?auto_7481 ) ( IS-CRATE ?auto_7482 ) ( AVAILABLE ?auto_7488 ) ( not ( = ?auto_7491 ?auto_7487 ) ) ( HOIST-AT ?auto_7494 ?auto_7491 ) ( AVAILABLE ?auto_7494 ) ( SURFACE-AT ?auto_7482 ?auto_7491 ) ( ON ?auto_7482 ?auto_7493 ) ( CLEAR ?auto_7482 ) ( TRUCK-AT ?auto_7489 ?auto_7487 ) ( not ( = ?auto_7481 ?auto_7482 ) ) ( not ( = ?auto_7481 ?auto_7493 ) ) ( not ( = ?auto_7482 ?auto_7493 ) ) ( not ( = ?auto_7488 ?auto_7494 ) ) ( not ( = ?auto_7481 ?auto_7483 ) ) ( not ( = ?auto_7481 ?auto_7496 ) ) ( not ( = ?auto_7483 ?auto_7493 ) ) ( not ( = ?auto_7495 ?auto_7491 ) ) ( not ( = ?auto_7492 ?auto_7494 ) ) ( not ( = ?auto_7496 ?auto_7493 ) ) ( not ( = ?auto_7481 ?auto_7484 ) ) ( not ( = ?auto_7481 ?auto_7486 ) ) ( not ( = ?auto_7482 ?auto_7484 ) ) ( not ( = ?auto_7482 ?auto_7486 ) ) ( not ( = ?auto_7484 ?auto_7496 ) ) ( not ( = ?auto_7484 ?auto_7493 ) ) ( not ( = ?auto_7485 ?auto_7495 ) ) ( not ( = ?auto_7485 ?auto_7491 ) ) ( not ( = ?auto_7490 ?auto_7492 ) ) ( not ( = ?auto_7490 ?auto_7494 ) ) ( not ( = ?auto_7486 ?auto_7496 ) ) ( not ( = ?auto_7486 ?auto_7493 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7481 ?auto_7482 ?auto_7483 )
      ( MAKE-1CRATE ?auto_7483 ?auto_7484 )
      ( MAKE-3CRATE-VERIFY ?auto_7481 ?auto_7482 ?auto_7483 ?auto_7484 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7499 - SURFACE
      ?auto_7500 - SURFACE
    )
    :vars
    (
      ?auto_7501 - HOIST
      ?auto_7502 - PLACE
      ?auto_7504 - PLACE
      ?auto_7505 - HOIST
      ?auto_7506 - SURFACE
      ?auto_7503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7501 ?auto_7502 ) ( SURFACE-AT ?auto_7499 ?auto_7502 ) ( CLEAR ?auto_7499 ) ( IS-CRATE ?auto_7500 ) ( AVAILABLE ?auto_7501 ) ( not ( = ?auto_7504 ?auto_7502 ) ) ( HOIST-AT ?auto_7505 ?auto_7504 ) ( AVAILABLE ?auto_7505 ) ( SURFACE-AT ?auto_7500 ?auto_7504 ) ( ON ?auto_7500 ?auto_7506 ) ( CLEAR ?auto_7500 ) ( TRUCK-AT ?auto_7503 ?auto_7502 ) ( not ( = ?auto_7499 ?auto_7500 ) ) ( not ( = ?auto_7499 ?auto_7506 ) ) ( not ( = ?auto_7500 ?auto_7506 ) ) ( not ( = ?auto_7501 ?auto_7505 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7503 ?auto_7502 ?auto_7504 )
      ( !LIFT ?auto_7505 ?auto_7500 ?auto_7506 ?auto_7504 )
      ( !LOAD ?auto_7505 ?auto_7500 ?auto_7503 ?auto_7504 )
      ( !DRIVE ?auto_7503 ?auto_7504 ?auto_7502 )
      ( !UNLOAD ?auto_7501 ?auto_7500 ?auto_7503 ?auto_7502 )
      ( !DROP ?auto_7501 ?auto_7500 ?auto_7499 ?auto_7502 )
      ( MAKE-1CRATE-VERIFY ?auto_7499 ?auto_7500 ) )
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
      ?auto_7517 - HOIST
      ?auto_7520 - PLACE
      ?auto_7521 - PLACE
      ?auto_7519 - HOIST
      ?auto_7518 - SURFACE
      ?auto_7530 - PLACE
      ?auto_7531 - HOIST
      ?auto_7527 - SURFACE
      ?auto_7523 - PLACE
      ?auto_7528 - HOIST
      ?auto_7525 - SURFACE
      ?auto_7529 - PLACE
      ?auto_7526 - HOIST
      ?auto_7524 - SURFACE
      ?auto_7522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7517 ?auto_7520 ) ( IS-CRATE ?auto_7516 ) ( not ( = ?auto_7521 ?auto_7520 ) ) ( HOIST-AT ?auto_7519 ?auto_7521 ) ( AVAILABLE ?auto_7519 ) ( SURFACE-AT ?auto_7516 ?auto_7521 ) ( ON ?auto_7516 ?auto_7518 ) ( CLEAR ?auto_7516 ) ( not ( = ?auto_7515 ?auto_7516 ) ) ( not ( = ?auto_7515 ?auto_7518 ) ) ( not ( = ?auto_7516 ?auto_7518 ) ) ( not ( = ?auto_7517 ?auto_7519 ) ) ( IS-CRATE ?auto_7515 ) ( not ( = ?auto_7530 ?auto_7520 ) ) ( HOIST-AT ?auto_7531 ?auto_7530 ) ( AVAILABLE ?auto_7531 ) ( SURFACE-AT ?auto_7515 ?auto_7530 ) ( ON ?auto_7515 ?auto_7527 ) ( CLEAR ?auto_7515 ) ( not ( = ?auto_7514 ?auto_7515 ) ) ( not ( = ?auto_7514 ?auto_7527 ) ) ( not ( = ?auto_7515 ?auto_7527 ) ) ( not ( = ?auto_7517 ?auto_7531 ) ) ( IS-CRATE ?auto_7514 ) ( not ( = ?auto_7523 ?auto_7520 ) ) ( HOIST-AT ?auto_7528 ?auto_7523 ) ( AVAILABLE ?auto_7528 ) ( SURFACE-AT ?auto_7514 ?auto_7523 ) ( ON ?auto_7514 ?auto_7525 ) ( CLEAR ?auto_7514 ) ( not ( = ?auto_7513 ?auto_7514 ) ) ( not ( = ?auto_7513 ?auto_7525 ) ) ( not ( = ?auto_7514 ?auto_7525 ) ) ( not ( = ?auto_7517 ?auto_7528 ) ) ( SURFACE-AT ?auto_7512 ?auto_7520 ) ( CLEAR ?auto_7512 ) ( IS-CRATE ?auto_7513 ) ( AVAILABLE ?auto_7517 ) ( not ( = ?auto_7529 ?auto_7520 ) ) ( HOIST-AT ?auto_7526 ?auto_7529 ) ( AVAILABLE ?auto_7526 ) ( SURFACE-AT ?auto_7513 ?auto_7529 ) ( ON ?auto_7513 ?auto_7524 ) ( CLEAR ?auto_7513 ) ( TRUCK-AT ?auto_7522 ?auto_7520 ) ( not ( = ?auto_7512 ?auto_7513 ) ) ( not ( = ?auto_7512 ?auto_7524 ) ) ( not ( = ?auto_7513 ?auto_7524 ) ) ( not ( = ?auto_7517 ?auto_7526 ) ) ( not ( = ?auto_7512 ?auto_7514 ) ) ( not ( = ?auto_7512 ?auto_7525 ) ) ( not ( = ?auto_7514 ?auto_7524 ) ) ( not ( = ?auto_7523 ?auto_7529 ) ) ( not ( = ?auto_7528 ?auto_7526 ) ) ( not ( = ?auto_7525 ?auto_7524 ) ) ( not ( = ?auto_7512 ?auto_7515 ) ) ( not ( = ?auto_7512 ?auto_7527 ) ) ( not ( = ?auto_7513 ?auto_7515 ) ) ( not ( = ?auto_7513 ?auto_7527 ) ) ( not ( = ?auto_7515 ?auto_7525 ) ) ( not ( = ?auto_7515 ?auto_7524 ) ) ( not ( = ?auto_7530 ?auto_7523 ) ) ( not ( = ?auto_7530 ?auto_7529 ) ) ( not ( = ?auto_7531 ?auto_7528 ) ) ( not ( = ?auto_7531 ?auto_7526 ) ) ( not ( = ?auto_7527 ?auto_7525 ) ) ( not ( = ?auto_7527 ?auto_7524 ) ) ( not ( = ?auto_7512 ?auto_7516 ) ) ( not ( = ?auto_7512 ?auto_7518 ) ) ( not ( = ?auto_7513 ?auto_7516 ) ) ( not ( = ?auto_7513 ?auto_7518 ) ) ( not ( = ?auto_7514 ?auto_7516 ) ) ( not ( = ?auto_7514 ?auto_7518 ) ) ( not ( = ?auto_7516 ?auto_7527 ) ) ( not ( = ?auto_7516 ?auto_7525 ) ) ( not ( = ?auto_7516 ?auto_7524 ) ) ( not ( = ?auto_7521 ?auto_7530 ) ) ( not ( = ?auto_7521 ?auto_7523 ) ) ( not ( = ?auto_7521 ?auto_7529 ) ) ( not ( = ?auto_7519 ?auto_7531 ) ) ( not ( = ?auto_7519 ?auto_7528 ) ) ( not ( = ?auto_7519 ?auto_7526 ) ) ( not ( = ?auto_7518 ?auto_7527 ) ) ( not ( = ?auto_7518 ?auto_7525 ) ) ( not ( = ?auto_7518 ?auto_7524 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_7512 ?auto_7513 ?auto_7514 ?auto_7515 )
      ( MAKE-1CRATE ?auto_7515 ?auto_7516 )
      ( MAKE-4CRATE-VERIFY ?auto_7512 ?auto_7513 ?auto_7514 ?auto_7515 ?auto_7516 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7534 - SURFACE
      ?auto_7535 - SURFACE
    )
    :vars
    (
      ?auto_7536 - HOIST
      ?auto_7537 - PLACE
      ?auto_7539 - PLACE
      ?auto_7540 - HOIST
      ?auto_7541 - SURFACE
      ?auto_7538 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7536 ?auto_7537 ) ( SURFACE-AT ?auto_7534 ?auto_7537 ) ( CLEAR ?auto_7534 ) ( IS-CRATE ?auto_7535 ) ( AVAILABLE ?auto_7536 ) ( not ( = ?auto_7539 ?auto_7537 ) ) ( HOIST-AT ?auto_7540 ?auto_7539 ) ( AVAILABLE ?auto_7540 ) ( SURFACE-AT ?auto_7535 ?auto_7539 ) ( ON ?auto_7535 ?auto_7541 ) ( CLEAR ?auto_7535 ) ( TRUCK-AT ?auto_7538 ?auto_7537 ) ( not ( = ?auto_7534 ?auto_7535 ) ) ( not ( = ?auto_7534 ?auto_7541 ) ) ( not ( = ?auto_7535 ?auto_7541 ) ) ( not ( = ?auto_7536 ?auto_7540 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7538 ?auto_7537 ?auto_7539 )
      ( !LIFT ?auto_7540 ?auto_7535 ?auto_7541 ?auto_7539 )
      ( !LOAD ?auto_7540 ?auto_7535 ?auto_7538 ?auto_7539 )
      ( !DRIVE ?auto_7538 ?auto_7539 ?auto_7537 )
      ( !UNLOAD ?auto_7536 ?auto_7535 ?auto_7538 ?auto_7537 )
      ( !DROP ?auto_7536 ?auto_7535 ?auto_7534 ?auto_7537 )
      ( MAKE-1CRATE-VERIFY ?auto_7534 ?auto_7535 ) )
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
      ?auto_7556 - HOIST
      ?auto_7558 - PLACE
      ?auto_7559 - PLACE
      ?auto_7557 - HOIST
      ?auto_7554 - SURFACE
      ?auto_7565 - PLACE
      ?auto_7570 - HOIST
      ?auto_7567 - SURFACE
      ?auto_7571 - PLACE
      ?auto_7562 - HOIST
      ?auto_7563 - SURFACE
      ?auto_7560 - PLACE
      ?auto_7564 - HOIST
      ?auto_7561 - SURFACE
      ?auto_7566 - PLACE
      ?auto_7568 - HOIST
      ?auto_7569 - SURFACE
      ?auto_7555 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7556 ?auto_7558 ) ( IS-CRATE ?auto_7553 ) ( not ( = ?auto_7559 ?auto_7558 ) ) ( HOIST-AT ?auto_7557 ?auto_7559 ) ( AVAILABLE ?auto_7557 ) ( SURFACE-AT ?auto_7553 ?auto_7559 ) ( ON ?auto_7553 ?auto_7554 ) ( CLEAR ?auto_7553 ) ( not ( = ?auto_7552 ?auto_7553 ) ) ( not ( = ?auto_7552 ?auto_7554 ) ) ( not ( = ?auto_7553 ?auto_7554 ) ) ( not ( = ?auto_7556 ?auto_7557 ) ) ( IS-CRATE ?auto_7552 ) ( not ( = ?auto_7565 ?auto_7558 ) ) ( HOIST-AT ?auto_7570 ?auto_7565 ) ( AVAILABLE ?auto_7570 ) ( SURFACE-AT ?auto_7552 ?auto_7565 ) ( ON ?auto_7552 ?auto_7567 ) ( CLEAR ?auto_7552 ) ( not ( = ?auto_7551 ?auto_7552 ) ) ( not ( = ?auto_7551 ?auto_7567 ) ) ( not ( = ?auto_7552 ?auto_7567 ) ) ( not ( = ?auto_7556 ?auto_7570 ) ) ( IS-CRATE ?auto_7551 ) ( not ( = ?auto_7571 ?auto_7558 ) ) ( HOIST-AT ?auto_7562 ?auto_7571 ) ( AVAILABLE ?auto_7562 ) ( SURFACE-AT ?auto_7551 ?auto_7571 ) ( ON ?auto_7551 ?auto_7563 ) ( CLEAR ?auto_7551 ) ( not ( = ?auto_7550 ?auto_7551 ) ) ( not ( = ?auto_7550 ?auto_7563 ) ) ( not ( = ?auto_7551 ?auto_7563 ) ) ( not ( = ?auto_7556 ?auto_7562 ) ) ( IS-CRATE ?auto_7550 ) ( not ( = ?auto_7560 ?auto_7558 ) ) ( HOIST-AT ?auto_7564 ?auto_7560 ) ( AVAILABLE ?auto_7564 ) ( SURFACE-AT ?auto_7550 ?auto_7560 ) ( ON ?auto_7550 ?auto_7561 ) ( CLEAR ?auto_7550 ) ( not ( = ?auto_7549 ?auto_7550 ) ) ( not ( = ?auto_7549 ?auto_7561 ) ) ( not ( = ?auto_7550 ?auto_7561 ) ) ( not ( = ?auto_7556 ?auto_7564 ) ) ( SURFACE-AT ?auto_7548 ?auto_7558 ) ( CLEAR ?auto_7548 ) ( IS-CRATE ?auto_7549 ) ( AVAILABLE ?auto_7556 ) ( not ( = ?auto_7566 ?auto_7558 ) ) ( HOIST-AT ?auto_7568 ?auto_7566 ) ( AVAILABLE ?auto_7568 ) ( SURFACE-AT ?auto_7549 ?auto_7566 ) ( ON ?auto_7549 ?auto_7569 ) ( CLEAR ?auto_7549 ) ( TRUCK-AT ?auto_7555 ?auto_7558 ) ( not ( = ?auto_7548 ?auto_7549 ) ) ( not ( = ?auto_7548 ?auto_7569 ) ) ( not ( = ?auto_7549 ?auto_7569 ) ) ( not ( = ?auto_7556 ?auto_7568 ) ) ( not ( = ?auto_7548 ?auto_7550 ) ) ( not ( = ?auto_7548 ?auto_7561 ) ) ( not ( = ?auto_7550 ?auto_7569 ) ) ( not ( = ?auto_7560 ?auto_7566 ) ) ( not ( = ?auto_7564 ?auto_7568 ) ) ( not ( = ?auto_7561 ?auto_7569 ) ) ( not ( = ?auto_7548 ?auto_7551 ) ) ( not ( = ?auto_7548 ?auto_7563 ) ) ( not ( = ?auto_7549 ?auto_7551 ) ) ( not ( = ?auto_7549 ?auto_7563 ) ) ( not ( = ?auto_7551 ?auto_7561 ) ) ( not ( = ?auto_7551 ?auto_7569 ) ) ( not ( = ?auto_7571 ?auto_7560 ) ) ( not ( = ?auto_7571 ?auto_7566 ) ) ( not ( = ?auto_7562 ?auto_7564 ) ) ( not ( = ?auto_7562 ?auto_7568 ) ) ( not ( = ?auto_7563 ?auto_7561 ) ) ( not ( = ?auto_7563 ?auto_7569 ) ) ( not ( = ?auto_7548 ?auto_7552 ) ) ( not ( = ?auto_7548 ?auto_7567 ) ) ( not ( = ?auto_7549 ?auto_7552 ) ) ( not ( = ?auto_7549 ?auto_7567 ) ) ( not ( = ?auto_7550 ?auto_7552 ) ) ( not ( = ?auto_7550 ?auto_7567 ) ) ( not ( = ?auto_7552 ?auto_7563 ) ) ( not ( = ?auto_7552 ?auto_7561 ) ) ( not ( = ?auto_7552 ?auto_7569 ) ) ( not ( = ?auto_7565 ?auto_7571 ) ) ( not ( = ?auto_7565 ?auto_7560 ) ) ( not ( = ?auto_7565 ?auto_7566 ) ) ( not ( = ?auto_7570 ?auto_7562 ) ) ( not ( = ?auto_7570 ?auto_7564 ) ) ( not ( = ?auto_7570 ?auto_7568 ) ) ( not ( = ?auto_7567 ?auto_7563 ) ) ( not ( = ?auto_7567 ?auto_7561 ) ) ( not ( = ?auto_7567 ?auto_7569 ) ) ( not ( = ?auto_7548 ?auto_7553 ) ) ( not ( = ?auto_7548 ?auto_7554 ) ) ( not ( = ?auto_7549 ?auto_7553 ) ) ( not ( = ?auto_7549 ?auto_7554 ) ) ( not ( = ?auto_7550 ?auto_7553 ) ) ( not ( = ?auto_7550 ?auto_7554 ) ) ( not ( = ?auto_7551 ?auto_7553 ) ) ( not ( = ?auto_7551 ?auto_7554 ) ) ( not ( = ?auto_7553 ?auto_7567 ) ) ( not ( = ?auto_7553 ?auto_7563 ) ) ( not ( = ?auto_7553 ?auto_7561 ) ) ( not ( = ?auto_7553 ?auto_7569 ) ) ( not ( = ?auto_7559 ?auto_7565 ) ) ( not ( = ?auto_7559 ?auto_7571 ) ) ( not ( = ?auto_7559 ?auto_7560 ) ) ( not ( = ?auto_7559 ?auto_7566 ) ) ( not ( = ?auto_7557 ?auto_7570 ) ) ( not ( = ?auto_7557 ?auto_7562 ) ) ( not ( = ?auto_7557 ?auto_7564 ) ) ( not ( = ?auto_7557 ?auto_7568 ) ) ( not ( = ?auto_7554 ?auto_7567 ) ) ( not ( = ?auto_7554 ?auto_7563 ) ) ( not ( = ?auto_7554 ?auto_7561 ) ) ( not ( = ?auto_7554 ?auto_7569 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_7548 ?auto_7549 ?auto_7550 ?auto_7551 ?auto_7552 )
      ( MAKE-1CRATE ?auto_7552 ?auto_7553 )
      ( MAKE-5CRATE-VERIFY ?auto_7548 ?auto_7549 ?auto_7550 ?auto_7551 ?auto_7552 ?auto_7553 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7574 - SURFACE
      ?auto_7575 - SURFACE
    )
    :vars
    (
      ?auto_7576 - HOIST
      ?auto_7577 - PLACE
      ?auto_7579 - PLACE
      ?auto_7580 - HOIST
      ?auto_7581 - SURFACE
      ?auto_7578 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7576 ?auto_7577 ) ( SURFACE-AT ?auto_7574 ?auto_7577 ) ( CLEAR ?auto_7574 ) ( IS-CRATE ?auto_7575 ) ( AVAILABLE ?auto_7576 ) ( not ( = ?auto_7579 ?auto_7577 ) ) ( HOIST-AT ?auto_7580 ?auto_7579 ) ( AVAILABLE ?auto_7580 ) ( SURFACE-AT ?auto_7575 ?auto_7579 ) ( ON ?auto_7575 ?auto_7581 ) ( CLEAR ?auto_7575 ) ( TRUCK-AT ?auto_7578 ?auto_7577 ) ( not ( = ?auto_7574 ?auto_7575 ) ) ( not ( = ?auto_7574 ?auto_7581 ) ) ( not ( = ?auto_7575 ?auto_7581 ) ) ( not ( = ?auto_7576 ?auto_7580 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7578 ?auto_7577 ?auto_7579 )
      ( !LIFT ?auto_7580 ?auto_7575 ?auto_7581 ?auto_7579 )
      ( !LOAD ?auto_7580 ?auto_7575 ?auto_7578 ?auto_7579 )
      ( !DRIVE ?auto_7578 ?auto_7579 ?auto_7577 )
      ( !UNLOAD ?auto_7576 ?auto_7575 ?auto_7578 ?auto_7577 )
      ( !DROP ?auto_7576 ?auto_7575 ?auto_7574 ?auto_7577 )
      ( MAKE-1CRATE-VERIFY ?auto_7574 ?auto_7575 ) )
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
      ?auto_7601 - PLACE
      ?auto_7600 - HOIST
      ?auto_7598 - SURFACE
      ?auto_7612 - PLACE
      ?auto_7609 - HOIST
      ?auto_7608 - SURFACE
      ?auto_7604 - PLACE
      ?auto_7602 - HOIST
      ?auto_7606 - SURFACE
      ?auto_7611 - PLACE
      ?auto_7607 - HOIST
      ?auto_7610 - SURFACE
      ?auto_7603 - PLACE
      ?auto_7605 - HOIST
      ?auto_7614 - SURFACE
      ?auto_7613 - SURFACE
      ?auto_7599 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7597 ?auto_7596 ) ( IS-CRATE ?auto_7595 ) ( not ( = ?auto_7601 ?auto_7596 ) ) ( HOIST-AT ?auto_7600 ?auto_7601 ) ( SURFACE-AT ?auto_7595 ?auto_7601 ) ( ON ?auto_7595 ?auto_7598 ) ( CLEAR ?auto_7595 ) ( not ( = ?auto_7594 ?auto_7595 ) ) ( not ( = ?auto_7594 ?auto_7598 ) ) ( not ( = ?auto_7595 ?auto_7598 ) ) ( not ( = ?auto_7597 ?auto_7600 ) ) ( IS-CRATE ?auto_7594 ) ( not ( = ?auto_7612 ?auto_7596 ) ) ( HOIST-AT ?auto_7609 ?auto_7612 ) ( AVAILABLE ?auto_7609 ) ( SURFACE-AT ?auto_7594 ?auto_7612 ) ( ON ?auto_7594 ?auto_7608 ) ( CLEAR ?auto_7594 ) ( not ( = ?auto_7593 ?auto_7594 ) ) ( not ( = ?auto_7593 ?auto_7608 ) ) ( not ( = ?auto_7594 ?auto_7608 ) ) ( not ( = ?auto_7597 ?auto_7609 ) ) ( IS-CRATE ?auto_7593 ) ( not ( = ?auto_7604 ?auto_7596 ) ) ( HOIST-AT ?auto_7602 ?auto_7604 ) ( AVAILABLE ?auto_7602 ) ( SURFACE-AT ?auto_7593 ?auto_7604 ) ( ON ?auto_7593 ?auto_7606 ) ( CLEAR ?auto_7593 ) ( not ( = ?auto_7592 ?auto_7593 ) ) ( not ( = ?auto_7592 ?auto_7606 ) ) ( not ( = ?auto_7593 ?auto_7606 ) ) ( not ( = ?auto_7597 ?auto_7602 ) ) ( IS-CRATE ?auto_7592 ) ( not ( = ?auto_7611 ?auto_7596 ) ) ( HOIST-AT ?auto_7607 ?auto_7611 ) ( AVAILABLE ?auto_7607 ) ( SURFACE-AT ?auto_7592 ?auto_7611 ) ( ON ?auto_7592 ?auto_7610 ) ( CLEAR ?auto_7592 ) ( not ( = ?auto_7591 ?auto_7592 ) ) ( not ( = ?auto_7591 ?auto_7610 ) ) ( not ( = ?auto_7592 ?auto_7610 ) ) ( not ( = ?auto_7597 ?auto_7607 ) ) ( IS-CRATE ?auto_7591 ) ( not ( = ?auto_7603 ?auto_7596 ) ) ( HOIST-AT ?auto_7605 ?auto_7603 ) ( AVAILABLE ?auto_7605 ) ( SURFACE-AT ?auto_7591 ?auto_7603 ) ( ON ?auto_7591 ?auto_7614 ) ( CLEAR ?auto_7591 ) ( not ( = ?auto_7590 ?auto_7591 ) ) ( not ( = ?auto_7590 ?auto_7614 ) ) ( not ( = ?auto_7591 ?auto_7614 ) ) ( not ( = ?auto_7597 ?auto_7605 ) ) ( SURFACE-AT ?auto_7589 ?auto_7596 ) ( CLEAR ?auto_7589 ) ( IS-CRATE ?auto_7590 ) ( AVAILABLE ?auto_7597 ) ( AVAILABLE ?auto_7600 ) ( SURFACE-AT ?auto_7590 ?auto_7601 ) ( ON ?auto_7590 ?auto_7613 ) ( CLEAR ?auto_7590 ) ( TRUCK-AT ?auto_7599 ?auto_7596 ) ( not ( = ?auto_7589 ?auto_7590 ) ) ( not ( = ?auto_7589 ?auto_7613 ) ) ( not ( = ?auto_7590 ?auto_7613 ) ) ( not ( = ?auto_7589 ?auto_7591 ) ) ( not ( = ?auto_7589 ?auto_7614 ) ) ( not ( = ?auto_7591 ?auto_7613 ) ) ( not ( = ?auto_7603 ?auto_7601 ) ) ( not ( = ?auto_7605 ?auto_7600 ) ) ( not ( = ?auto_7614 ?auto_7613 ) ) ( not ( = ?auto_7589 ?auto_7592 ) ) ( not ( = ?auto_7589 ?auto_7610 ) ) ( not ( = ?auto_7590 ?auto_7592 ) ) ( not ( = ?auto_7590 ?auto_7610 ) ) ( not ( = ?auto_7592 ?auto_7614 ) ) ( not ( = ?auto_7592 ?auto_7613 ) ) ( not ( = ?auto_7611 ?auto_7603 ) ) ( not ( = ?auto_7611 ?auto_7601 ) ) ( not ( = ?auto_7607 ?auto_7605 ) ) ( not ( = ?auto_7607 ?auto_7600 ) ) ( not ( = ?auto_7610 ?auto_7614 ) ) ( not ( = ?auto_7610 ?auto_7613 ) ) ( not ( = ?auto_7589 ?auto_7593 ) ) ( not ( = ?auto_7589 ?auto_7606 ) ) ( not ( = ?auto_7590 ?auto_7593 ) ) ( not ( = ?auto_7590 ?auto_7606 ) ) ( not ( = ?auto_7591 ?auto_7593 ) ) ( not ( = ?auto_7591 ?auto_7606 ) ) ( not ( = ?auto_7593 ?auto_7610 ) ) ( not ( = ?auto_7593 ?auto_7614 ) ) ( not ( = ?auto_7593 ?auto_7613 ) ) ( not ( = ?auto_7604 ?auto_7611 ) ) ( not ( = ?auto_7604 ?auto_7603 ) ) ( not ( = ?auto_7604 ?auto_7601 ) ) ( not ( = ?auto_7602 ?auto_7607 ) ) ( not ( = ?auto_7602 ?auto_7605 ) ) ( not ( = ?auto_7602 ?auto_7600 ) ) ( not ( = ?auto_7606 ?auto_7610 ) ) ( not ( = ?auto_7606 ?auto_7614 ) ) ( not ( = ?auto_7606 ?auto_7613 ) ) ( not ( = ?auto_7589 ?auto_7594 ) ) ( not ( = ?auto_7589 ?auto_7608 ) ) ( not ( = ?auto_7590 ?auto_7594 ) ) ( not ( = ?auto_7590 ?auto_7608 ) ) ( not ( = ?auto_7591 ?auto_7594 ) ) ( not ( = ?auto_7591 ?auto_7608 ) ) ( not ( = ?auto_7592 ?auto_7594 ) ) ( not ( = ?auto_7592 ?auto_7608 ) ) ( not ( = ?auto_7594 ?auto_7606 ) ) ( not ( = ?auto_7594 ?auto_7610 ) ) ( not ( = ?auto_7594 ?auto_7614 ) ) ( not ( = ?auto_7594 ?auto_7613 ) ) ( not ( = ?auto_7612 ?auto_7604 ) ) ( not ( = ?auto_7612 ?auto_7611 ) ) ( not ( = ?auto_7612 ?auto_7603 ) ) ( not ( = ?auto_7612 ?auto_7601 ) ) ( not ( = ?auto_7609 ?auto_7602 ) ) ( not ( = ?auto_7609 ?auto_7607 ) ) ( not ( = ?auto_7609 ?auto_7605 ) ) ( not ( = ?auto_7609 ?auto_7600 ) ) ( not ( = ?auto_7608 ?auto_7606 ) ) ( not ( = ?auto_7608 ?auto_7610 ) ) ( not ( = ?auto_7608 ?auto_7614 ) ) ( not ( = ?auto_7608 ?auto_7613 ) ) ( not ( = ?auto_7589 ?auto_7595 ) ) ( not ( = ?auto_7589 ?auto_7598 ) ) ( not ( = ?auto_7590 ?auto_7595 ) ) ( not ( = ?auto_7590 ?auto_7598 ) ) ( not ( = ?auto_7591 ?auto_7595 ) ) ( not ( = ?auto_7591 ?auto_7598 ) ) ( not ( = ?auto_7592 ?auto_7595 ) ) ( not ( = ?auto_7592 ?auto_7598 ) ) ( not ( = ?auto_7593 ?auto_7595 ) ) ( not ( = ?auto_7593 ?auto_7598 ) ) ( not ( = ?auto_7595 ?auto_7608 ) ) ( not ( = ?auto_7595 ?auto_7606 ) ) ( not ( = ?auto_7595 ?auto_7610 ) ) ( not ( = ?auto_7595 ?auto_7614 ) ) ( not ( = ?auto_7595 ?auto_7613 ) ) ( not ( = ?auto_7598 ?auto_7608 ) ) ( not ( = ?auto_7598 ?auto_7606 ) ) ( not ( = ?auto_7598 ?auto_7610 ) ) ( not ( = ?auto_7598 ?auto_7614 ) ) ( not ( = ?auto_7598 ?auto_7613 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_7589 ?auto_7590 ?auto_7591 ?auto_7592 ?auto_7593 ?auto_7594 )
      ( MAKE-1CRATE ?auto_7594 ?auto_7595 )
      ( MAKE-6CRATE-VERIFY ?auto_7589 ?auto_7590 ?auto_7591 ?auto_7592 ?auto_7593 ?auto_7594 ?auto_7595 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7617 - SURFACE
      ?auto_7618 - SURFACE
    )
    :vars
    (
      ?auto_7619 - HOIST
      ?auto_7620 - PLACE
      ?auto_7622 - PLACE
      ?auto_7623 - HOIST
      ?auto_7624 - SURFACE
      ?auto_7621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7619 ?auto_7620 ) ( SURFACE-AT ?auto_7617 ?auto_7620 ) ( CLEAR ?auto_7617 ) ( IS-CRATE ?auto_7618 ) ( AVAILABLE ?auto_7619 ) ( not ( = ?auto_7622 ?auto_7620 ) ) ( HOIST-AT ?auto_7623 ?auto_7622 ) ( AVAILABLE ?auto_7623 ) ( SURFACE-AT ?auto_7618 ?auto_7622 ) ( ON ?auto_7618 ?auto_7624 ) ( CLEAR ?auto_7618 ) ( TRUCK-AT ?auto_7621 ?auto_7620 ) ( not ( = ?auto_7617 ?auto_7618 ) ) ( not ( = ?auto_7617 ?auto_7624 ) ) ( not ( = ?auto_7618 ?auto_7624 ) ) ( not ( = ?auto_7619 ?auto_7623 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7621 ?auto_7620 ?auto_7622 )
      ( !LIFT ?auto_7623 ?auto_7618 ?auto_7624 ?auto_7622 )
      ( !LOAD ?auto_7623 ?auto_7618 ?auto_7621 ?auto_7622 )
      ( !DRIVE ?auto_7621 ?auto_7622 ?auto_7620 )
      ( !UNLOAD ?auto_7619 ?auto_7618 ?auto_7621 ?auto_7620 )
      ( !DROP ?auto_7619 ?auto_7618 ?auto_7617 ?auto_7620 )
      ( MAKE-1CRATE-VERIFY ?auto_7617 ?auto_7618 ) )
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
      ?auto_7644 - HOIST
      ?auto_7646 - PLACE
      ?auto_7642 - PLACE
      ?auto_7643 - HOIST
      ?auto_7641 - SURFACE
      ?auto_7662 - PLACE
      ?auto_7647 - HOIST
      ?auto_7648 - SURFACE
      ?auto_7653 - PLACE
      ?auto_7661 - HOIST
      ?auto_7656 - SURFACE
      ?auto_7660 - PLACE
      ?auto_7650 - HOIST
      ?auto_7657 - SURFACE
      ?auto_7651 - PLACE
      ?auto_7658 - HOIST
      ?auto_7649 - SURFACE
      ?auto_7659 - PLACE
      ?auto_7655 - HOIST
      ?auto_7654 - SURFACE
      ?auto_7652 - SURFACE
      ?auto_7645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7644 ?auto_7646 ) ( IS-CRATE ?auto_7640 ) ( not ( = ?auto_7642 ?auto_7646 ) ) ( HOIST-AT ?auto_7643 ?auto_7642 ) ( AVAILABLE ?auto_7643 ) ( SURFACE-AT ?auto_7640 ?auto_7642 ) ( ON ?auto_7640 ?auto_7641 ) ( CLEAR ?auto_7640 ) ( not ( = ?auto_7639 ?auto_7640 ) ) ( not ( = ?auto_7639 ?auto_7641 ) ) ( not ( = ?auto_7640 ?auto_7641 ) ) ( not ( = ?auto_7644 ?auto_7643 ) ) ( IS-CRATE ?auto_7639 ) ( not ( = ?auto_7662 ?auto_7646 ) ) ( HOIST-AT ?auto_7647 ?auto_7662 ) ( SURFACE-AT ?auto_7639 ?auto_7662 ) ( ON ?auto_7639 ?auto_7648 ) ( CLEAR ?auto_7639 ) ( not ( = ?auto_7638 ?auto_7639 ) ) ( not ( = ?auto_7638 ?auto_7648 ) ) ( not ( = ?auto_7639 ?auto_7648 ) ) ( not ( = ?auto_7644 ?auto_7647 ) ) ( IS-CRATE ?auto_7638 ) ( not ( = ?auto_7653 ?auto_7646 ) ) ( HOIST-AT ?auto_7661 ?auto_7653 ) ( AVAILABLE ?auto_7661 ) ( SURFACE-AT ?auto_7638 ?auto_7653 ) ( ON ?auto_7638 ?auto_7656 ) ( CLEAR ?auto_7638 ) ( not ( = ?auto_7637 ?auto_7638 ) ) ( not ( = ?auto_7637 ?auto_7656 ) ) ( not ( = ?auto_7638 ?auto_7656 ) ) ( not ( = ?auto_7644 ?auto_7661 ) ) ( IS-CRATE ?auto_7637 ) ( not ( = ?auto_7660 ?auto_7646 ) ) ( HOIST-AT ?auto_7650 ?auto_7660 ) ( AVAILABLE ?auto_7650 ) ( SURFACE-AT ?auto_7637 ?auto_7660 ) ( ON ?auto_7637 ?auto_7657 ) ( CLEAR ?auto_7637 ) ( not ( = ?auto_7636 ?auto_7637 ) ) ( not ( = ?auto_7636 ?auto_7657 ) ) ( not ( = ?auto_7637 ?auto_7657 ) ) ( not ( = ?auto_7644 ?auto_7650 ) ) ( IS-CRATE ?auto_7636 ) ( not ( = ?auto_7651 ?auto_7646 ) ) ( HOIST-AT ?auto_7658 ?auto_7651 ) ( AVAILABLE ?auto_7658 ) ( SURFACE-AT ?auto_7636 ?auto_7651 ) ( ON ?auto_7636 ?auto_7649 ) ( CLEAR ?auto_7636 ) ( not ( = ?auto_7635 ?auto_7636 ) ) ( not ( = ?auto_7635 ?auto_7649 ) ) ( not ( = ?auto_7636 ?auto_7649 ) ) ( not ( = ?auto_7644 ?auto_7658 ) ) ( IS-CRATE ?auto_7635 ) ( not ( = ?auto_7659 ?auto_7646 ) ) ( HOIST-AT ?auto_7655 ?auto_7659 ) ( AVAILABLE ?auto_7655 ) ( SURFACE-AT ?auto_7635 ?auto_7659 ) ( ON ?auto_7635 ?auto_7654 ) ( CLEAR ?auto_7635 ) ( not ( = ?auto_7634 ?auto_7635 ) ) ( not ( = ?auto_7634 ?auto_7654 ) ) ( not ( = ?auto_7635 ?auto_7654 ) ) ( not ( = ?auto_7644 ?auto_7655 ) ) ( SURFACE-AT ?auto_7633 ?auto_7646 ) ( CLEAR ?auto_7633 ) ( IS-CRATE ?auto_7634 ) ( AVAILABLE ?auto_7644 ) ( AVAILABLE ?auto_7647 ) ( SURFACE-AT ?auto_7634 ?auto_7662 ) ( ON ?auto_7634 ?auto_7652 ) ( CLEAR ?auto_7634 ) ( TRUCK-AT ?auto_7645 ?auto_7646 ) ( not ( = ?auto_7633 ?auto_7634 ) ) ( not ( = ?auto_7633 ?auto_7652 ) ) ( not ( = ?auto_7634 ?auto_7652 ) ) ( not ( = ?auto_7633 ?auto_7635 ) ) ( not ( = ?auto_7633 ?auto_7654 ) ) ( not ( = ?auto_7635 ?auto_7652 ) ) ( not ( = ?auto_7659 ?auto_7662 ) ) ( not ( = ?auto_7655 ?auto_7647 ) ) ( not ( = ?auto_7654 ?auto_7652 ) ) ( not ( = ?auto_7633 ?auto_7636 ) ) ( not ( = ?auto_7633 ?auto_7649 ) ) ( not ( = ?auto_7634 ?auto_7636 ) ) ( not ( = ?auto_7634 ?auto_7649 ) ) ( not ( = ?auto_7636 ?auto_7654 ) ) ( not ( = ?auto_7636 ?auto_7652 ) ) ( not ( = ?auto_7651 ?auto_7659 ) ) ( not ( = ?auto_7651 ?auto_7662 ) ) ( not ( = ?auto_7658 ?auto_7655 ) ) ( not ( = ?auto_7658 ?auto_7647 ) ) ( not ( = ?auto_7649 ?auto_7654 ) ) ( not ( = ?auto_7649 ?auto_7652 ) ) ( not ( = ?auto_7633 ?auto_7637 ) ) ( not ( = ?auto_7633 ?auto_7657 ) ) ( not ( = ?auto_7634 ?auto_7637 ) ) ( not ( = ?auto_7634 ?auto_7657 ) ) ( not ( = ?auto_7635 ?auto_7637 ) ) ( not ( = ?auto_7635 ?auto_7657 ) ) ( not ( = ?auto_7637 ?auto_7649 ) ) ( not ( = ?auto_7637 ?auto_7654 ) ) ( not ( = ?auto_7637 ?auto_7652 ) ) ( not ( = ?auto_7660 ?auto_7651 ) ) ( not ( = ?auto_7660 ?auto_7659 ) ) ( not ( = ?auto_7660 ?auto_7662 ) ) ( not ( = ?auto_7650 ?auto_7658 ) ) ( not ( = ?auto_7650 ?auto_7655 ) ) ( not ( = ?auto_7650 ?auto_7647 ) ) ( not ( = ?auto_7657 ?auto_7649 ) ) ( not ( = ?auto_7657 ?auto_7654 ) ) ( not ( = ?auto_7657 ?auto_7652 ) ) ( not ( = ?auto_7633 ?auto_7638 ) ) ( not ( = ?auto_7633 ?auto_7656 ) ) ( not ( = ?auto_7634 ?auto_7638 ) ) ( not ( = ?auto_7634 ?auto_7656 ) ) ( not ( = ?auto_7635 ?auto_7638 ) ) ( not ( = ?auto_7635 ?auto_7656 ) ) ( not ( = ?auto_7636 ?auto_7638 ) ) ( not ( = ?auto_7636 ?auto_7656 ) ) ( not ( = ?auto_7638 ?auto_7657 ) ) ( not ( = ?auto_7638 ?auto_7649 ) ) ( not ( = ?auto_7638 ?auto_7654 ) ) ( not ( = ?auto_7638 ?auto_7652 ) ) ( not ( = ?auto_7653 ?auto_7660 ) ) ( not ( = ?auto_7653 ?auto_7651 ) ) ( not ( = ?auto_7653 ?auto_7659 ) ) ( not ( = ?auto_7653 ?auto_7662 ) ) ( not ( = ?auto_7661 ?auto_7650 ) ) ( not ( = ?auto_7661 ?auto_7658 ) ) ( not ( = ?auto_7661 ?auto_7655 ) ) ( not ( = ?auto_7661 ?auto_7647 ) ) ( not ( = ?auto_7656 ?auto_7657 ) ) ( not ( = ?auto_7656 ?auto_7649 ) ) ( not ( = ?auto_7656 ?auto_7654 ) ) ( not ( = ?auto_7656 ?auto_7652 ) ) ( not ( = ?auto_7633 ?auto_7639 ) ) ( not ( = ?auto_7633 ?auto_7648 ) ) ( not ( = ?auto_7634 ?auto_7639 ) ) ( not ( = ?auto_7634 ?auto_7648 ) ) ( not ( = ?auto_7635 ?auto_7639 ) ) ( not ( = ?auto_7635 ?auto_7648 ) ) ( not ( = ?auto_7636 ?auto_7639 ) ) ( not ( = ?auto_7636 ?auto_7648 ) ) ( not ( = ?auto_7637 ?auto_7639 ) ) ( not ( = ?auto_7637 ?auto_7648 ) ) ( not ( = ?auto_7639 ?auto_7656 ) ) ( not ( = ?auto_7639 ?auto_7657 ) ) ( not ( = ?auto_7639 ?auto_7649 ) ) ( not ( = ?auto_7639 ?auto_7654 ) ) ( not ( = ?auto_7639 ?auto_7652 ) ) ( not ( = ?auto_7648 ?auto_7656 ) ) ( not ( = ?auto_7648 ?auto_7657 ) ) ( not ( = ?auto_7648 ?auto_7649 ) ) ( not ( = ?auto_7648 ?auto_7654 ) ) ( not ( = ?auto_7648 ?auto_7652 ) ) ( not ( = ?auto_7633 ?auto_7640 ) ) ( not ( = ?auto_7633 ?auto_7641 ) ) ( not ( = ?auto_7634 ?auto_7640 ) ) ( not ( = ?auto_7634 ?auto_7641 ) ) ( not ( = ?auto_7635 ?auto_7640 ) ) ( not ( = ?auto_7635 ?auto_7641 ) ) ( not ( = ?auto_7636 ?auto_7640 ) ) ( not ( = ?auto_7636 ?auto_7641 ) ) ( not ( = ?auto_7637 ?auto_7640 ) ) ( not ( = ?auto_7637 ?auto_7641 ) ) ( not ( = ?auto_7638 ?auto_7640 ) ) ( not ( = ?auto_7638 ?auto_7641 ) ) ( not ( = ?auto_7640 ?auto_7648 ) ) ( not ( = ?auto_7640 ?auto_7656 ) ) ( not ( = ?auto_7640 ?auto_7657 ) ) ( not ( = ?auto_7640 ?auto_7649 ) ) ( not ( = ?auto_7640 ?auto_7654 ) ) ( not ( = ?auto_7640 ?auto_7652 ) ) ( not ( = ?auto_7642 ?auto_7662 ) ) ( not ( = ?auto_7642 ?auto_7653 ) ) ( not ( = ?auto_7642 ?auto_7660 ) ) ( not ( = ?auto_7642 ?auto_7651 ) ) ( not ( = ?auto_7642 ?auto_7659 ) ) ( not ( = ?auto_7643 ?auto_7647 ) ) ( not ( = ?auto_7643 ?auto_7661 ) ) ( not ( = ?auto_7643 ?auto_7650 ) ) ( not ( = ?auto_7643 ?auto_7658 ) ) ( not ( = ?auto_7643 ?auto_7655 ) ) ( not ( = ?auto_7641 ?auto_7648 ) ) ( not ( = ?auto_7641 ?auto_7656 ) ) ( not ( = ?auto_7641 ?auto_7657 ) ) ( not ( = ?auto_7641 ?auto_7649 ) ) ( not ( = ?auto_7641 ?auto_7654 ) ) ( not ( = ?auto_7641 ?auto_7652 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_7633 ?auto_7634 ?auto_7635 ?auto_7636 ?auto_7637 ?auto_7638 ?auto_7639 )
      ( MAKE-1CRATE ?auto_7639 ?auto_7640 )
      ( MAKE-7CRATE-VERIFY ?auto_7633 ?auto_7634 ?auto_7635 ?auto_7636 ?auto_7637 ?auto_7638 ?auto_7639 ?auto_7640 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7665 - SURFACE
      ?auto_7666 - SURFACE
    )
    :vars
    (
      ?auto_7667 - HOIST
      ?auto_7668 - PLACE
      ?auto_7670 - PLACE
      ?auto_7671 - HOIST
      ?auto_7672 - SURFACE
      ?auto_7669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7667 ?auto_7668 ) ( SURFACE-AT ?auto_7665 ?auto_7668 ) ( CLEAR ?auto_7665 ) ( IS-CRATE ?auto_7666 ) ( AVAILABLE ?auto_7667 ) ( not ( = ?auto_7670 ?auto_7668 ) ) ( HOIST-AT ?auto_7671 ?auto_7670 ) ( AVAILABLE ?auto_7671 ) ( SURFACE-AT ?auto_7666 ?auto_7670 ) ( ON ?auto_7666 ?auto_7672 ) ( CLEAR ?auto_7666 ) ( TRUCK-AT ?auto_7669 ?auto_7668 ) ( not ( = ?auto_7665 ?auto_7666 ) ) ( not ( = ?auto_7665 ?auto_7672 ) ) ( not ( = ?auto_7666 ?auto_7672 ) ) ( not ( = ?auto_7667 ?auto_7671 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7669 ?auto_7668 ?auto_7670 )
      ( !LIFT ?auto_7671 ?auto_7666 ?auto_7672 ?auto_7670 )
      ( !LOAD ?auto_7671 ?auto_7666 ?auto_7669 ?auto_7670 )
      ( !DRIVE ?auto_7669 ?auto_7670 ?auto_7668 )
      ( !UNLOAD ?auto_7667 ?auto_7666 ?auto_7669 ?auto_7668 )
      ( !DROP ?auto_7667 ?auto_7666 ?auto_7665 ?auto_7668 )
      ( MAKE-1CRATE-VERIFY ?auto_7665 ?auto_7666 ) )
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
      ?auto_7690 - SURFACE
      ?auto_7689 - SURFACE
    )
    :vars
    (
      ?auto_7693 - HOIST
      ?auto_7691 - PLACE
      ?auto_7694 - PLACE
      ?auto_7695 - HOIST
      ?auto_7696 - SURFACE
      ?auto_7697 - PLACE
      ?auto_7700 - HOIST
      ?auto_7699 - SURFACE
      ?auto_7702 - PLACE
      ?auto_7701 - HOIST
      ?auto_7713 - SURFACE
      ?auto_7710 - PLACE
      ?auto_7715 - HOIST
      ?auto_7705 - SURFACE
      ?auto_7708 - PLACE
      ?auto_7698 - HOIST
      ?auto_7704 - SURFACE
      ?auto_7712 - PLACE
      ?auto_7706 - HOIST
      ?auto_7714 - SURFACE
      ?auto_7707 - PLACE
      ?auto_7703 - HOIST
      ?auto_7709 - SURFACE
      ?auto_7711 - SURFACE
      ?auto_7692 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7693 ?auto_7691 ) ( IS-CRATE ?auto_7689 ) ( not ( = ?auto_7694 ?auto_7691 ) ) ( HOIST-AT ?auto_7695 ?auto_7694 ) ( AVAILABLE ?auto_7695 ) ( SURFACE-AT ?auto_7689 ?auto_7694 ) ( ON ?auto_7689 ?auto_7696 ) ( CLEAR ?auto_7689 ) ( not ( = ?auto_7690 ?auto_7689 ) ) ( not ( = ?auto_7690 ?auto_7696 ) ) ( not ( = ?auto_7689 ?auto_7696 ) ) ( not ( = ?auto_7693 ?auto_7695 ) ) ( IS-CRATE ?auto_7690 ) ( not ( = ?auto_7697 ?auto_7691 ) ) ( HOIST-AT ?auto_7700 ?auto_7697 ) ( AVAILABLE ?auto_7700 ) ( SURFACE-AT ?auto_7690 ?auto_7697 ) ( ON ?auto_7690 ?auto_7699 ) ( CLEAR ?auto_7690 ) ( not ( = ?auto_7688 ?auto_7690 ) ) ( not ( = ?auto_7688 ?auto_7699 ) ) ( not ( = ?auto_7690 ?auto_7699 ) ) ( not ( = ?auto_7693 ?auto_7700 ) ) ( IS-CRATE ?auto_7688 ) ( not ( = ?auto_7702 ?auto_7691 ) ) ( HOIST-AT ?auto_7701 ?auto_7702 ) ( SURFACE-AT ?auto_7688 ?auto_7702 ) ( ON ?auto_7688 ?auto_7713 ) ( CLEAR ?auto_7688 ) ( not ( = ?auto_7687 ?auto_7688 ) ) ( not ( = ?auto_7687 ?auto_7713 ) ) ( not ( = ?auto_7688 ?auto_7713 ) ) ( not ( = ?auto_7693 ?auto_7701 ) ) ( IS-CRATE ?auto_7687 ) ( not ( = ?auto_7710 ?auto_7691 ) ) ( HOIST-AT ?auto_7715 ?auto_7710 ) ( AVAILABLE ?auto_7715 ) ( SURFACE-AT ?auto_7687 ?auto_7710 ) ( ON ?auto_7687 ?auto_7705 ) ( CLEAR ?auto_7687 ) ( not ( = ?auto_7686 ?auto_7687 ) ) ( not ( = ?auto_7686 ?auto_7705 ) ) ( not ( = ?auto_7687 ?auto_7705 ) ) ( not ( = ?auto_7693 ?auto_7715 ) ) ( IS-CRATE ?auto_7686 ) ( not ( = ?auto_7708 ?auto_7691 ) ) ( HOIST-AT ?auto_7698 ?auto_7708 ) ( AVAILABLE ?auto_7698 ) ( SURFACE-AT ?auto_7686 ?auto_7708 ) ( ON ?auto_7686 ?auto_7704 ) ( CLEAR ?auto_7686 ) ( not ( = ?auto_7685 ?auto_7686 ) ) ( not ( = ?auto_7685 ?auto_7704 ) ) ( not ( = ?auto_7686 ?auto_7704 ) ) ( not ( = ?auto_7693 ?auto_7698 ) ) ( IS-CRATE ?auto_7685 ) ( not ( = ?auto_7712 ?auto_7691 ) ) ( HOIST-AT ?auto_7706 ?auto_7712 ) ( AVAILABLE ?auto_7706 ) ( SURFACE-AT ?auto_7685 ?auto_7712 ) ( ON ?auto_7685 ?auto_7714 ) ( CLEAR ?auto_7685 ) ( not ( = ?auto_7684 ?auto_7685 ) ) ( not ( = ?auto_7684 ?auto_7714 ) ) ( not ( = ?auto_7685 ?auto_7714 ) ) ( not ( = ?auto_7693 ?auto_7706 ) ) ( IS-CRATE ?auto_7684 ) ( not ( = ?auto_7707 ?auto_7691 ) ) ( HOIST-AT ?auto_7703 ?auto_7707 ) ( AVAILABLE ?auto_7703 ) ( SURFACE-AT ?auto_7684 ?auto_7707 ) ( ON ?auto_7684 ?auto_7709 ) ( CLEAR ?auto_7684 ) ( not ( = ?auto_7683 ?auto_7684 ) ) ( not ( = ?auto_7683 ?auto_7709 ) ) ( not ( = ?auto_7684 ?auto_7709 ) ) ( not ( = ?auto_7693 ?auto_7703 ) ) ( SURFACE-AT ?auto_7682 ?auto_7691 ) ( CLEAR ?auto_7682 ) ( IS-CRATE ?auto_7683 ) ( AVAILABLE ?auto_7693 ) ( AVAILABLE ?auto_7701 ) ( SURFACE-AT ?auto_7683 ?auto_7702 ) ( ON ?auto_7683 ?auto_7711 ) ( CLEAR ?auto_7683 ) ( TRUCK-AT ?auto_7692 ?auto_7691 ) ( not ( = ?auto_7682 ?auto_7683 ) ) ( not ( = ?auto_7682 ?auto_7711 ) ) ( not ( = ?auto_7683 ?auto_7711 ) ) ( not ( = ?auto_7682 ?auto_7684 ) ) ( not ( = ?auto_7682 ?auto_7709 ) ) ( not ( = ?auto_7684 ?auto_7711 ) ) ( not ( = ?auto_7707 ?auto_7702 ) ) ( not ( = ?auto_7703 ?auto_7701 ) ) ( not ( = ?auto_7709 ?auto_7711 ) ) ( not ( = ?auto_7682 ?auto_7685 ) ) ( not ( = ?auto_7682 ?auto_7714 ) ) ( not ( = ?auto_7683 ?auto_7685 ) ) ( not ( = ?auto_7683 ?auto_7714 ) ) ( not ( = ?auto_7685 ?auto_7709 ) ) ( not ( = ?auto_7685 ?auto_7711 ) ) ( not ( = ?auto_7712 ?auto_7707 ) ) ( not ( = ?auto_7712 ?auto_7702 ) ) ( not ( = ?auto_7706 ?auto_7703 ) ) ( not ( = ?auto_7706 ?auto_7701 ) ) ( not ( = ?auto_7714 ?auto_7709 ) ) ( not ( = ?auto_7714 ?auto_7711 ) ) ( not ( = ?auto_7682 ?auto_7686 ) ) ( not ( = ?auto_7682 ?auto_7704 ) ) ( not ( = ?auto_7683 ?auto_7686 ) ) ( not ( = ?auto_7683 ?auto_7704 ) ) ( not ( = ?auto_7684 ?auto_7686 ) ) ( not ( = ?auto_7684 ?auto_7704 ) ) ( not ( = ?auto_7686 ?auto_7714 ) ) ( not ( = ?auto_7686 ?auto_7709 ) ) ( not ( = ?auto_7686 ?auto_7711 ) ) ( not ( = ?auto_7708 ?auto_7712 ) ) ( not ( = ?auto_7708 ?auto_7707 ) ) ( not ( = ?auto_7708 ?auto_7702 ) ) ( not ( = ?auto_7698 ?auto_7706 ) ) ( not ( = ?auto_7698 ?auto_7703 ) ) ( not ( = ?auto_7698 ?auto_7701 ) ) ( not ( = ?auto_7704 ?auto_7714 ) ) ( not ( = ?auto_7704 ?auto_7709 ) ) ( not ( = ?auto_7704 ?auto_7711 ) ) ( not ( = ?auto_7682 ?auto_7687 ) ) ( not ( = ?auto_7682 ?auto_7705 ) ) ( not ( = ?auto_7683 ?auto_7687 ) ) ( not ( = ?auto_7683 ?auto_7705 ) ) ( not ( = ?auto_7684 ?auto_7687 ) ) ( not ( = ?auto_7684 ?auto_7705 ) ) ( not ( = ?auto_7685 ?auto_7687 ) ) ( not ( = ?auto_7685 ?auto_7705 ) ) ( not ( = ?auto_7687 ?auto_7704 ) ) ( not ( = ?auto_7687 ?auto_7714 ) ) ( not ( = ?auto_7687 ?auto_7709 ) ) ( not ( = ?auto_7687 ?auto_7711 ) ) ( not ( = ?auto_7710 ?auto_7708 ) ) ( not ( = ?auto_7710 ?auto_7712 ) ) ( not ( = ?auto_7710 ?auto_7707 ) ) ( not ( = ?auto_7710 ?auto_7702 ) ) ( not ( = ?auto_7715 ?auto_7698 ) ) ( not ( = ?auto_7715 ?auto_7706 ) ) ( not ( = ?auto_7715 ?auto_7703 ) ) ( not ( = ?auto_7715 ?auto_7701 ) ) ( not ( = ?auto_7705 ?auto_7704 ) ) ( not ( = ?auto_7705 ?auto_7714 ) ) ( not ( = ?auto_7705 ?auto_7709 ) ) ( not ( = ?auto_7705 ?auto_7711 ) ) ( not ( = ?auto_7682 ?auto_7688 ) ) ( not ( = ?auto_7682 ?auto_7713 ) ) ( not ( = ?auto_7683 ?auto_7688 ) ) ( not ( = ?auto_7683 ?auto_7713 ) ) ( not ( = ?auto_7684 ?auto_7688 ) ) ( not ( = ?auto_7684 ?auto_7713 ) ) ( not ( = ?auto_7685 ?auto_7688 ) ) ( not ( = ?auto_7685 ?auto_7713 ) ) ( not ( = ?auto_7686 ?auto_7688 ) ) ( not ( = ?auto_7686 ?auto_7713 ) ) ( not ( = ?auto_7688 ?auto_7705 ) ) ( not ( = ?auto_7688 ?auto_7704 ) ) ( not ( = ?auto_7688 ?auto_7714 ) ) ( not ( = ?auto_7688 ?auto_7709 ) ) ( not ( = ?auto_7688 ?auto_7711 ) ) ( not ( = ?auto_7713 ?auto_7705 ) ) ( not ( = ?auto_7713 ?auto_7704 ) ) ( not ( = ?auto_7713 ?auto_7714 ) ) ( not ( = ?auto_7713 ?auto_7709 ) ) ( not ( = ?auto_7713 ?auto_7711 ) ) ( not ( = ?auto_7682 ?auto_7690 ) ) ( not ( = ?auto_7682 ?auto_7699 ) ) ( not ( = ?auto_7683 ?auto_7690 ) ) ( not ( = ?auto_7683 ?auto_7699 ) ) ( not ( = ?auto_7684 ?auto_7690 ) ) ( not ( = ?auto_7684 ?auto_7699 ) ) ( not ( = ?auto_7685 ?auto_7690 ) ) ( not ( = ?auto_7685 ?auto_7699 ) ) ( not ( = ?auto_7686 ?auto_7690 ) ) ( not ( = ?auto_7686 ?auto_7699 ) ) ( not ( = ?auto_7687 ?auto_7690 ) ) ( not ( = ?auto_7687 ?auto_7699 ) ) ( not ( = ?auto_7690 ?auto_7713 ) ) ( not ( = ?auto_7690 ?auto_7705 ) ) ( not ( = ?auto_7690 ?auto_7704 ) ) ( not ( = ?auto_7690 ?auto_7714 ) ) ( not ( = ?auto_7690 ?auto_7709 ) ) ( not ( = ?auto_7690 ?auto_7711 ) ) ( not ( = ?auto_7697 ?auto_7702 ) ) ( not ( = ?auto_7697 ?auto_7710 ) ) ( not ( = ?auto_7697 ?auto_7708 ) ) ( not ( = ?auto_7697 ?auto_7712 ) ) ( not ( = ?auto_7697 ?auto_7707 ) ) ( not ( = ?auto_7700 ?auto_7701 ) ) ( not ( = ?auto_7700 ?auto_7715 ) ) ( not ( = ?auto_7700 ?auto_7698 ) ) ( not ( = ?auto_7700 ?auto_7706 ) ) ( not ( = ?auto_7700 ?auto_7703 ) ) ( not ( = ?auto_7699 ?auto_7713 ) ) ( not ( = ?auto_7699 ?auto_7705 ) ) ( not ( = ?auto_7699 ?auto_7704 ) ) ( not ( = ?auto_7699 ?auto_7714 ) ) ( not ( = ?auto_7699 ?auto_7709 ) ) ( not ( = ?auto_7699 ?auto_7711 ) ) ( not ( = ?auto_7682 ?auto_7689 ) ) ( not ( = ?auto_7682 ?auto_7696 ) ) ( not ( = ?auto_7683 ?auto_7689 ) ) ( not ( = ?auto_7683 ?auto_7696 ) ) ( not ( = ?auto_7684 ?auto_7689 ) ) ( not ( = ?auto_7684 ?auto_7696 ) ) ( not ( = ?auto_7685 ?auto_7689 ) ) ( not ( = ?auto_7685 ?auto_7696 ) ) ( not ( = ?auto_7686 ?auto_7689 ) ) ( not ( = ?auto_7686 ?auto_7696 ) ) ( not ( = ?auto_7687 ?auto_7689 ) ) ( not ( = ?auto_7687 ?auto_7696 ) ) ( not ( = ?auto_7688 ?auto_7689 ) ) ( not ( = ?auto_7688 ?auto_7696 ) ) ( not ( = ?auto_7689 ?auto_7699 ) ) ( not ( = ?auto_7689 ?auto_7713 ) ) ( not ( = ?auto_7689 ?auto_7705 ) ) ( not ( = ?auto_7689 ?auto_7704 ) ) ( not ( = ?auto_7689 ?auto_7714 ) ) ( not ( = ?auto_7689 ?auto_7709 ) ) ( not ( = ?auto_7689 ?auto_7711 ) ) ( not ( = ?auto_7694 ?auto_7697 ) ) ( not ( = ?auto_7694 ?auto_7702 ) ) ( not ( = ?auto_7694 ?auto_7710 ) ) ( not ( = ?auto_7694 ?auto_7708 ) ) ( not ( = ?auto_7694 ?auto_7712 ) ) ( not ( = ?auto_7694 ?auto_7707 ) ) ( not ( = ?auto_7695 ?auto_7700 ) ) ( not ( = ?auto_7695 ?auto_7701 ) ) ( not ( = ?auto_7695 ?auto_7715 ) ) ( not ( = ?auto_7695 ?auto_7698 ) ) ( not ( = ?auto_7695 ?auto_7706 ) ) ( not ( = ?auto_7695 ?auto_7703 ) ) ( not ( = ?auto_7696 ?auto_7699 ) ) ( not ( = ?auto_7696 ?auto_7713 ) ) ( not ( = ?auto_7696 ?auto_7705 ) ) ( not ( = ?auto_7696 ?auto_7704 ) ) ( not ( = ?auto_7696 ?auto_7714 ) ) ( not ( = ?auto_7696 ?auto_7709 ) ) ( not ( = ?auto_7696 ?auto_7711 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_7682 ?auto_7683 ?auto_7684 ?auto_7685 ?auto_7686 ?auto_7687 ?auto_7688 ?auto_7690 )
      ( MAKE-1CRATE ?auto_7690 ?auto_7689 )
      ( MAKE-8CRATE-VERIFY ?auto_7682 ?auto_7683 ?auto_7684 ?auto_7685 ?auto_7686 ?auto_7687 ?auto_7688 ?auto_7690 ?auto_7689 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7718 - SURFACE
      ?auto_7719 - SURFACE
    )
    :vars
    (
      ?auto_7720 - HOIST
      ?auto_7721 - PLACE
      ?auto_7723 - PLACE
      ?auto_7724 - HOIST
      ?auto_7725 - SURFACE
      ?auto_7722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7720 ?auto_7721 ) ( SURFACE-AT ?auto_7718 ?auto_7721 ) ( CLEAR ?auto_7718 ) ( IS-CRATE ?auto_7719 ) ( AVAILABLE ?auto_7720 ) ( not ( = ?auto_7723 ?auto_7721 ) ) ( HOIST-AT ?auto_7724 ?auto_7723 ) ( AVAILABLE ?auto_7724 ) ( SURFACE-AT ?auto_7719 ?auto_7723 ) ( ON ?auto_7719 ?auto_7725 ) ( CLEAR ?auto_7719 ) ( TRUCK-AT ?auto_7722 ?auto_7721 ) ( not ( = ?auto_7718 ?auto_7719 ) ) ( not ( = ?auto_7718 ?auto_7725 ) ) ( not ( = ?auto_7719 ?auto_7725 ) ) ( not ( = ?auto_7720 ?auto_7724 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7722 ?auto_7721 ?auto_7723 )
      ( !LIFT ?auto_7724 ?auto_7719 ?auto_7725 ?auto_7723 )
      ( !LOAD ?auto_7724 ?auto_7719 ?auto_7722 ?auto_7723 )
      ( !DRIVE ?auto_7722 ?auto_7723 ?auto_7721 )
      ( !UNLOAD ?auto_7720 ?auto_7719 ?auto_7722 ?auto_7721 )
      ( !DROP ?auto_7720 ?auto_7719 ?auto_7718 ?auto_7721 )
      ( MAKE-1CRATE-VERIFY ?auto_7718 ?auto_7719 ) )
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
      ?auto_7745 - SURFACE
      ?auto_7744 - SURFACE
      ?auto_7743 - SURFACE
    )
    :vars
    (
      ?auto_7747 - HOIST
      ?auto_7749 - PLACE
      ?auto_7748 - PLACE
      ?auto_7746 - HOIST
      ?auto_7751 - SURFACE
      ?auto_7770 - PLACE
      ?auto_7757 - HOIST
      ?auto_7771 - SURFACE
      ?auto_7759 - PLACE
      ?auto_7772 - HOIST
      ?auto_7773 - SURFACE
      ?auto_7756 - PLACE
      ?auto_7753 - HOIST
      ?auto_7760 - SURFACE
      ?auto_7768 - PLACE
      ?auto_7761 - HOIST
      ?auto_7763 - SURFACE
      ?auto_7766 - PLACE
      ?auto_7754 - HOIST
      ?auto_7769 - SURFACE
      ?auto_7762 - PLACE
      ?auto_7765 - HOIST
      ?auto_7758 - SURFACE
      ?auto_7764 - PLACE
      ?auto_7755 - HOIST
      ?auto_7767 - SURFACE
      ?auto_7752 - SURFACE
      ?auto_7750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7747 ?auto_7749 ) ( IS-CRATE ?auto_7743 ) ( not ( = ?auto_7748 ?auto_7749 ) ) ( HOIST-AT ?auto_7746 ?auto_7748 ) ( AVAILABLE ?auto_7746 ) ( SURFACE-AT ?auto_7743 ?auto_7748 ) ( ON ?auto_7743 ?auto_7751 ) ( CLEAR ?auto_7743 ) ( not ( = ?auto_7744 ?auto_7743 ) ) ( not ( = ?auto_7744 ?auto_7751 ) ) ( not ( = ?auto_7743 ?auto_7751 ) ) ( not ( = ?auto_7747 ?auto_7746 ) ) ( IS-CRATE ?auto_7744 ) ( not ( = ?auto_7770 ?auto_7749 ) ) ( HOIST-AT ?auto_7757 ?auto_7770 ) ( AVAILABLE ?auto_7757 ) ( SURFACE-AT ?auto_7744 ?auto_7770 ) ( ON ?auto_7744 ?auto_7771 ) ( CLEAR ?auto_7744 ) ( not ( = ?auto_7745 ?auto_7744 ) ) ( not ( = ?auto_7745 ?auto_7771 ) ) ( not ( = ?auto_7744 ?auto_7771 ) ) ( not ( = ?auto_7747 ?auto_7757 ) ) ( IS-CRATE ?auto_7745 ) ( not ( = ?auto_7759 ?auto_7749 ) ) ( HOIST-AT ?auto_7772 ?auto_7759 ) ( AVAILABLE ?auto_7772 ) ( SURFACE-AT ?auto_7745 ?auto_7759 ) ( ON ?auto_7745 ?auto_7773 ) ( CLEAR ?auto_7745 ) ( not ( = ?auto_7742 ?auto_7745 ) ) ( not ( = ?auto_7742 ?auto_7773 ) ) ( not ( = ?auto_7745 ?auto_7773 ) ) ( not ( = ?auto_7747 ?auto_7772 ) ) ( IS-CRATE ?auto_7742 ) ( not ( = ?auto_7756 ?auto_7749 ) ) ( HOIST-AT ?auto_7753 ?auto_7756 ) ( SURFACE-AT ?auto_7742 ?auto_7756 ) ( ON ?auto_7742 ?auto_7760 ) ( CLEAR ?auto_7742 ) ( not ( = ?auto_7741 ?auto_7742 ) ) ( not ( = ?auto_7741 ?auto_7760 ) ) ( not ( = ?auto_7742 ?auto_7760 ) ) ( not ( = ?auto_7747 ?auto_7753 ) ) ( IS-CRATE ?auto_7741 ) ( not ( = ?auto_7768 ?auto_7749 ) ) ( HOIST-AT ?auto_7761 ?auto_7768 ) ( AVAILABLE ?auto_7761 ) ( SURFACE-AT ?auto_7741 ?auto_7768 ) ( ON ?auto_7741 ?auto_7763 ) ( CLEAR ?auto_7741 ) ( not ( = ?auto_7740 ?auto_7741 ) ) ( not ( = ?auto_7740 ?auto_7763 ) ) ( not ( = ?auto_7741 ?auto_7763 ) ) ( not ( = ?auto_7747 ?auto_7761 ) ) ( IS-CRATE ?auto_7740 ) ( not ( = ?auto_7766 ?auto_7749 ) ) ( HOIST-AT ?auto_7754 ?auto_7766 ) ( AVAILABLE ?auto_7754 ) ( SURFACE-AT ?auto_7740 ?auto_7766 ) ( ON ?auto_7740 ?auto_7769 ) ( CLEAR ?auto_7740 ) ( not ( = ?auto_7739 ?auto_7740 ) ) ( not ( = ?auto_7739 ?auto_7769 ) ) ( not ( = ?auto_7740 ?auto_7769 ) ) ( not ( = ?auto_7747 ?auto_7754 ) ) ( IS-CRATE ?auto_7739 ) ( not ( = ?auto_7762 ?auto_7749 ) ) ( HOIST-AT ?auto_7765 ?auto_7762 ) ( AVAILABLE ?auto_7765 ) ( SURFACE-AT ?auto_7739 ?auto_7762 ) ( ON ?auto_7739 ?auto_7758 ) ( CLEAR ?auto_7739 ) ( not ( = ?auto_7738 ?auto_7739 ) ) ( not ( = ?auto_7738 ?auto_7758 ) ) ( not ( = ?auto_7739 ?auto_7758 ) ) ( not ( = ?auto_7747 ?auto_7765 ) ) ( IS-CRATE ?auto_7738 ) ( not ( = ?auto_7764 ?auto_7749 ) ) ( HOIST-AT ?auto_7755 ?auto_7764 ) ( AVAILABLE ?auto_7755 ) ( SURFACE-AT ?auto_7738 ?auto_7764 ) ( ON ?auto_7738 ?auto_7767 ) ( CLEAR ?auto_7738 ) ( not ( = ?auto_7737 ?auto_7738 ) ) ( not ( = ?auto_7737 ?auto_7767 ) ) ( not ( = ?auto_7738 ?auto_7767 ) ) ( not ( = ?auto_7747 ?auto_7755 ) ) ( SURFACE-AT ?auto_7736 ?auto_7749 ) ( CLEAR ?auto_7736 ) ( IS-CRATE ?auto_7737 ) ( AVAILABLE ?auto_7747 ) ( AVAILABLE ?auto_7753 ) ( SURFACE-AT ?auto_7737 ?auto_7756 ) ( ON ?auto_7737 ?auto_7752 ) ( CLEAR ?auto_7737 ) ( TRUCK-AT ?auto_7750 ?auto_7749 ) ( not ( = ?auto_7736 ?auto_7737 ) ) ( not ( = ?auto_7736 ?auto_7752 ) ) ( not ( = ?auto_7737 ?auto_7752 ) ) ( not ( = ?auto_7736 ?auto_7738 ) ) ( not ( = ?auto_7736 ?auto_7767 ) ) ( not ( = ?auto_7738 ?auto_7752 ) ) ( not ( = ?auto_7764 ?auto_7756 ) ) ( not ( = ?auto_7755 ?auto_7753 ) ) ( not ( = ?auto_7767 ?auto_7752 ) ) ( not ( = ?auto_7736 ?auto_7739 ) ) ( not ( = ?auto_7736 ?auto_7758 ) ) ( not ( = ?auto_7737 ?auto_7739 ) ) ( not ( = ?auto_7737 ?auto_7758 ) ) ( not ( = ?auto_7739 ?auto_7767 ) ) ( not ( = ?auto_7739 ?auto_7752 ) ) ( not ( = ?auto_7762 ?auto_7764 ) ) ( not ( = ?auto_7762 ?auto_7756 ) ) ( not ( = ?auto_7765 ?auto_7755 ) ) ( not ( = ?auto_7765 ?auto_7753 ) ) ( not ( = ?auto_7758 ?auto_7767 ) ) ( not ( = ?auto_7758 ?auto_7752 ) ) ( not ( = ?auto_7736 ?auto_7740 ) ) ( not ( = ?auto_7736 ?auto_7769 ) ) ( not ( = ?auto_7737 ?auto_7740 ) ) ( not ( = ?auto_7737 ?auto_7769 ) ) ( not ( = ?auto_7738 ?auto_7740 ) ) ( not ( = ?auto_7738 ?auto_7769 ) ) ( not ( = ?auto_7740 ?auto_7758 ) ) ( not ( = ?auto_7740 ?auto_7767 ) ) ( not ( = ?auto_7740 ?auto_7752 ) ) ( not ( = ?auto_7766 ?auto_7762 ) ) ( not ( = ?auto_7766 ?auto_7764 ) ) ( not ( = ?auto_7766 ?auto_7756 ) ) ( not ( = ?auto_7754 ?auto_7765 ) ) ( not ( = ?auto_7754 ?auto_7755 ) ) ( not ( = ?auto_7754 ?auto_7753 ) ) ( not ( = ?auto_7769 ?auto_7758 ) ) ( not ( = ?auto_7769 ?auto_7767 ) ) ( not ( = ?auto_7769 ?auto_7752 ) ) ( not ( = ?auto_7736 ?auto_7741 ) ) ( not ( = ?auto_7736 ?auto_7763 ) ) ( not ( = ?auto_7737 ?auto_7741 ) ) ( not ( = ?auto_7737 ?auto_7763 ) ) ( not ( = ?auto_7738 ?auto_7741 ) ) ( not ( = ?auto_7738 ?auto_7763 ) ) ( not ( = ?auto_7739 ?auto_7741 ) ) ( not ( = ?auto_7739 ?auto_7763 ) ) ( not ( = ?auto_7741 ?auto_7769 ) ) ( not ( = ?auto_7741 ?auto_7758 ) ) ( not ( = ?auto_7741 ?auto_7767 ) ) ( not ( = ?auto_7741 ?auto_7752 ) ) ( not ( = ?auto_7768 ?auto_7766 ) ) ( not ( = ?auto_7768 ?auto_7762 ) ) ( not ( = ?auto_7768 ?auto_7764 ) ) ( not ( = ?auto_7768 ?auto_7756 ) ) ( not ( = ?auto_7761 ?auto_7754 ) ) ( not ( = ?auto_7761 ?auto_7765 ) ) ( not ( = ?auto_7761 ?auto_7755 ) ) ( not ( = ?auto_7761 ?auto_7753 ) ) ( not ( = ?auto_7763 ?auto_7769 ) ) ( not ( = ?auto_7763 ?auto_7758 ) ) ( not ( = ?auto_7763 ?auto_7767 ) ) ( not ( = ?auto_7763 ?auto_7752 ) ) ( not ( = ?auto_7736 ?auto_7742 ) ) ( not ( = ?auto_7736 ?auto_7760 ) ) ( not ( = ?auto_7737 ?auto_7742 ) ) ( not ( = ?auto_7737 ?auto_7760 ) ) ( not ( = ?auto_7738 ?auto_7742 ) ) ( not ( = ?auto_7738 ?auto_7760 ) ) ( not ( = ?auto_7739 ?auto_7742 ) ) ( not ( = ?auto_7739 ?auto_7760 ) ) ( not ( = ?auto_7740 ?auto_7742 ) ) ( not ( = ?auto_7740 ?auto_7760 ) ) ( not ( = ?auto_7742 ?auto_7763 ) ) ( not ( = ?auto_7742 ?auto_7769 ) ) ( not ( = ?auto_7742 ?auto_7758 ) ) ( not ( = ?auto_7742 ?auto_7767 ) ) ( not ( = ?auto_7742 ?auto_7752 ) ) ( not ( = ?auto_7760 ?auto_7763 ) ) ( not ( = ?auto_7760 ?auto_7769 ) ) ( not ( = ?auto_7760 ?auto_7758 ) ) ( not ( = ?auto_7760 ?auto_7767 ) ) ( not ( = ?auto_7760 ?auto_7752 ) ) ( not ( = ?auto_7736 ?auto_7745 ) ) ( not ( = ?auto_7736 ?auto_7773 ) ) ( not ( = ?auto_7737 ?auto_7745 ) ) ( not ( = ?auto_7737 ?auto_7773 ) ) ( not ( = ?auto_7738 ?auto_7745 ) ) ( not ( = ?auto_7738 ?auto_7773 ) ) ( not ( = ?auto_7739 ?auto_7745 ) ) ( not ( = ?auto_7739 ?auto_7773 ) ) ( not ( = ?auto_7740 ?auto_7745 ) ) ( not ( = ?auto_7740 ?auto_7773 ) ) ( not ( = ?auto_7741 ?auto_7745 ) ) ( not ( = ?auto_7741 ?auto_7773 ) ) ( not ( = ?auto_7745 ?auto_7760 ) ) ( not ( = ?auto_7745 ?auto_7763 ) ) ( not ( = ?auto_7745 ?auto_7769 ) ) ( not ( = ?auto_7745 ?auto_7758 ) ) ( not ( = ?auto_7745 ?auto_7767 ) ) ( not ( = ?auto_7745 ?auto_7752 ) ) ( not ( = ?auto_7759 ?auto_7756 ) ) ( not ( = ?auto_7759 ?auto_7768 ) ) ( not ( = ?auto_7759 ?auto_7766 ) ) ( not ( = ?auto_7759 ?auto_7762 ) ) ( not ( = ?auto_7759 ?auto_7764 ) ) ( not ( = ?auto_7772 ?auto_7753 ) ) ( not ( = ?auto_7772 ?auto_7761 ) ) ( not ( = ?auto_7772 ?auto_7754 ) ) ( not ( = ?auto_7772 ?auto_7765 ) ) ( not ( = ?auto_7772 ?auto_7755 ) ) ( not ( = ?auto_7773 ?auto_7760 ) ) ( not ( = ?auto_7773 ?auto_7763 ) ) ( not ( = ?auto_7773 ?auto_7769 ) ) ( not ( = ?auto_7773 ?auto_7758 ) ) ( not ( = ?auto_7773 ?auto_7767 ) ) ( not ( = ?auto_7773 ?auto_7752 ) ) ( not ( = ?auto_7736 ?auto_7744 ) ) ( not ( = ?auto_7736 ?auto_7771 ) ) ( not ( = ?auto_7737 ?auto_7744 ) ) ( not ( = ?auto_7737 ?auto_7771 ) ) ( not ( = ?auto_7738 ?auto_7744 ) ) ( not ( = ?auto_7738 ?auto_7771 ) ) ( not ( = ?auto_7739 ?auto_7744 ) ) ( not ( = ?auto_7739 ?auto_7771 ) ) ( not ( = ?auto_7740 ?auto_7744 ) ) ( not ( = ?auto_7740 ?auto_7771 ) ) ( not ( = ?auto_7741 ?auto_7744 ) ) ( not ( = ?auto_7741 ?auto_7771 ) ) ( not ( = ?auto_7742 ?auto_7744 ) ) ( not ( = ?auto_7742 ?auto_7771 ) ) ( not ( = ?auto_7744 ?auto_7773 ) ) ( not ( = ?auto_7744 ?auto_7760 ) ) ( not ( = ?auto_7744 ?auto_7763 ) ) ( not ( = ?auto_7744 ?auto_7769 ) ) ( not ( = ?auto_7744 ?auto_7758 ) ) ( not ( = ?auto_7744 ?auto_7767 ) ) ( not ( = ?auto_7744 ?auto_7752 ) ) ( not ( = ?auto_7770 ?auto_7759 ) ) ( not ( = ?auto_7770 ?auto_7756 ) ) ( not ( = ?auto_7770 ?auto_7768 ) ) ( not ( = ?auto_7770 ?auto_7766 ) ) ( not ( = ?auto_7770 ?auto_7762 ) ) ( not ( = ?auto_7770 ?auto_7764 ) ) ( not ( = ?auto_7757 ?auto_7772 ) ) ( not ( = ?auto_7757 ?auto_7753 ) ) ( not ( = ?auto_7757 ?auto_7761 ) ) ( not ( = ?auto_7757 ?auto_7754 ) ) ( not ( = ?auto_7757 ?auto_7765 ) ) ( not ( = ?auto_7757 ?auto_7755 ) ) ( not ( = ?auto_7771 ?auto_7773 ) ) ( not ( = ?auto_7771 ?auto_7760 ) ) ( not ( = ?auto_7771 ?auto_7763 ) ) ( not ( = ?auto_7771 ?auto_7769 ) ) ( not ( = ?auto_7771 ?auto_7758 ) ) ( not ( = ?auto_7771 ?auto_7767 ) ) ( not ( = ?auto_7771 ?auto_7752 ) ) ( not ( = ?auto_7736 ?auto_7743 ) ) ( not ( = ?auto_7736 ?auto_7751 ) ) ( not ( = ?auto_7737 ?auto_7743 ) ) ( not ( = ?auto_7737 ?auto_7751 ) ) ( not ( = ?auto_7738 ?auto_7743 ) ) ( not ( = ?auto_7738 ?auto_7751 ) ) ( not ( = ?auto_7739 ?auto_7743 ) ) ( not ( = ?auto_7739 ?auto_7751 ) ) ( not ( = ?auto_7740 ?auto_7743 ) ) ( not ( = ?auto_7740 ?auto_7751 ) ) ( not ( = ?auto_7741 ?auto_7743 ) ) ( not ( = ?auto_7741 ?auto_7751 ) ) ( not ( = ?auto_7742 ?auto_7743 ) ) ( not ( = ?auto_7742 ?auto_7751 ) ) ( not ( = ?auto_7745 ?auto_7743 ) ) ( not ( = ?auto_7745 ?auto_7751 ) ) ( not ( = ?auto_7743 ?auto_7771 ) ) ( not ( = ?auto_7743 ?auto_7773 ) ) ( not ( = ?auto_7743 ?auto_7760 ) ) ( not ( = ?auto_7743 ?auto_7763 ) ) ( not ( = ?auto_7743 ?auto_7769 ) ) ( not ( = ?auto_7743 ?auto_7758 ) ) ( not ( = ?auto_7743 ?auto_7767 ) ) ( not ( = ?auto_7743 ?auto_7752 ) ) ( not ( = ?auto_7748 ?auto_7770 ) ) ( not ( = ?auto_7748 ?auto_7759 ) ) ( not ( = ?auto_7748 ?auto_7756 ) ) ( not ( = ?auto_7748 ?auto_7768 ) ) ( not ( = ?auto_7748 ?auto_7766 ) ) ( not ( = ?auto_7748 ?auto_7762 ) ) ( not ( = ?auto_7748 ?auto_7764 ) ) ( not ( = ?auto_7746 ?auto_7757 ) ) ( not ( = ?auto_7746 ?auto_7772 ) ) ( not ( = ?auto_7746 ?auto_7753 ) ) ( not ( = ?auto_7746 ?auto_7761 ) ) ( not ( = ?auto_7746 ?auto_7754 ) ) ( not ( = ?auto_7746 ?auto_7765 ) ) ( not ( = ?auto_7746 ?auto_7755 ) ) ( not ( = ?auto_7751 ?auto_7771 ) ) ( not ( = ?auto_7751 ?auto_7773 ) ) ( not ( = ?auto_7751 ?auto_7760 ) ) ( not ( = ?auto_7751 ?auto_7763 ) ) ( not ( = ?auto_7751 ?auto_7769 ) ) ( not ( = ?auto_7751 ?auto_7758 ) ) ( not ( = ?auto_7751 ?auto_7767 ) ) ( not ( = ?auto_7751 ?auto_7752 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_7736 ?auto_7737 ?auto_7738 ?auto_7739 ?auto_7740 ?auto_7741 ?auto_7742 ?auto_7745 ?auto_7744 )
      ( MAKE-1CRATE ?auto_7744 ?auto_7743 )
      ( MAKE-9CRATE-VERIFY ?auto_7736 ?auto_7737 ?auto_7738 ?auto_7739 ?auto_7740 ?auto_7741 ?auto_7742 ?auto_7745 ?auto_7744 ?auto_7743 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7776 - SURFACE
      ?auto_7777 - SURFACE
    )
    :vars
    (
      ?auto_7778 - HOIST
      ?auto_7779 - PLACE
      ?auto_7781 - PLACE
      ?auto_7782 - HOIST
      ?auto_7783 - SURFACE
      ?auto_7780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7778 ?auto_7779 ) ( SURFACE-AT ?auto_7776 ?auto_7779 ) ( CLEAR ?auto_7776 ) ( IS-CRATE ?auto_7777 ) ( AVAILABLE ?auto_7778 ) ( not ( = ?auto_7781 ?auto_7779 ) ) ( HOIST-AT ?auto_7782 ?auto_7781 ) ( AVAILABLE ?auto_7782 ) ( SURFACE-AT ?auto_7777 ?auto_7781 ) ( ON ?auto_7777 ?auto_7783 ) ( CLEAR ?auto_7777 ) ( TRUCK-AT ?auto_7780 ?auto_7779 ) ( not ( = ?auto_7776 ?auto_7777 ) ) ( not ( = ?auto_7776 ?auto_7783 ) ) ( not ( = ?auto_7777 ?auto_7783 ) ) ( not ( = ?auto_7778 ?auto_7782 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7780 ?auto_7779 ?auto_7781 )
      ( !LIFT ?auto_7782 ?auto_7777 ?auto_7783 ?auto_7781 )
      ( !LOAD ?auto_7782 ?auto_7777 ?auto_7780 ?auto_7781 )
      ( !DRIVE ?auto_7780 ?auto_7781 ?auto_7779 )
      ( !UNLOAD ?auto_7778 ?auto_7777 ?auto_7780 ?auto_7779 )
      ( !DROP ?auto_7778 ?auto_7777 ?auto_7776 ?auto_7779 )
      ( MAKE-1CRATE-VERIFY ?auto_7776 ?auto_7777 ) )
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
      ?auto_7804 - SURFACE
      ?auto_7803 - SURFACE
      ?auto_7802 - SURFACE
      ?auto_7805 - SURFACE
    )
    :vars
    (
      ?auto_7808 - HOIST
      ?auto_7810 - PLACE
      ?auto_7809 - PLACE
      ?auto_7811 - HOIST
      ?auto_7806 - SURFACE
      ?auto_7822 - PLACE
      ?auto_7835 - HOIST
      ?auto_7812 - SURFACE
      ?auto_7831 - PLACE
      ?auto_7828 - HOIST
      ?auto_7825 - SURFACE
      ?auto_7823 - PLACE
      ?auto_7830 - HOIST
      ?auto_7836 - SURFACE
      ?auto_7829 - PLACE
      ?auto_7820 - HOIST
      ?auto_7813 - SURFACE
      ?auto_7824 - PLACE
      ?auto_7816 - HOIST
      ?auto_7832 - SURFACE
      ?auto_7821 - PLACE
      ?auto_7833 - HOIST
      ?auto_7819 - SURFACE
      ?auto_7834 - PLACE
      ?auto_7815 - HOIST
      ?auto_7827 - SURFACE
      ?auto_7814 - PLACE
      ?auto_7818 - HOIST
      ?auto_7817 - SURFACE
      ?auto_7826 - SURFACE
      ?auto_7807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7808 ?auto_7810 ) ( IS-CRATE ?auto_7805 ) ( not ( = ?auto_7809 ?auto_7810 ) ) ( HOIST-AT ?auto_7811 ?auto_7809 ) ( AVAILABLE ?auto_7811 ) ( SURFACE-AT ?auto_7805 ?auto_7809 ) ( ON ?auto_7805 ?auto_7806 ) ( CLEAR ?auto_7805 ) ( not ( = ?auto_7802 ?auto_7805 ) ) ( not ( = ?auto_7802 ?auto_7806 ) ) ( not ( = ?auto_7805 ?auto_7806 ) ) ( not ( = ?auto_7808 ?auto_7811 ) ) ( IS-CRATE ?auto_7802 ) ( not ( = ?auto_7822 ?auto_7810 ) ) ( HOIST-AT ?auto_7835 ?auto_7822 ) ( AVAILABLE ?auto_7835 ) ( SURFACE-AT ?auto_7802 ?auto_7822 ) ( ON ?auto_7802 ?auto_7812 ) ( CLEAR ?auto_7802 ) ( not ( = ?auto_7803 ?auto_7802 ) ) ( not ( = ?auto_7803 ?auto_7812 ) ) ( not ( = ?auto_7802 ?auto_7812 ) ) ( not ( = ?auto_7808 ?auto_7835 ) ) ( IS-CRATE ?auto_7803 ) ( not ( = ?auto_7831 ?auto_7810 ) ) ( HOIST-AT ?auto_7828 ?auto_7831 ) ( AVAILABLE ?auto_7828 ) ( SURFACE-AT ?auto_7803 ?auto_7831 ) ( ON ?auto_7803 ?auto_7825 ) ( CLEAR ?auto_7803 ) ( not ( = ?auto_7804 ?auto_7803 ) ) ( not ( = ?auto_7804 ?auto_7825 ) ) ( not ( = ?auto_7803 ?auto_7825 ) ) ( not ( = ?auto_7808 ?auto_7828 ) ) ( IS-CRATE ?auto_7804 ) ( not ( = ?auto_7823 ?auto_7810 ) ) ( HOIST-AT ?auto_7830 ?auto_7823 ) ( AVAILABLE ?auto_7830 ) ( SURFACE-AT ?auto_7804 ?auto_7823 ) ( ON ?auto_7804 ?auto_7836 ) ( CLEAR ?auto_7804 ) ( not ( = ?auto_7801 ?auto_7804 ) ) ( not ( = ?auto_7801 ?auto_7836 ) ) ( not ( = ?auto_7804 ?auto_7836 ) ) ( not ( = ?auto_7808 ?auto_7830 ) ) ( IS-CRATE ?auto_7801 ) ( not ( = ?auto_7829 ?auto_7810 ) ) ( HOIST-AT ?auto_7820 ?auto_7829 ) ( SURFACE-AT ?auto_7801 ?auto_7829 ) ( ON ?auto_7801 ?auto_7813 ) ( CLEAR ?auto_7801 ) ( not ( = ?auto_7800 ?auto_7801 ) ) ( not ( = ?auto_7800 ?auto_7813 ) ) ( not ( = ?auto_7801 ?auto_7813 ) ) ( not ( = ?auto_7808 ?auto_7820 ) ) ( IS-CRATE ?auto_7800 ) ( not ( = ?auto_7824 ?auto_7810 ) ) ( HOIST-AT ?auto_7816 ?auto_7824 ) ( AVAILABLE ?auto_7816 ) ( SURFACE-AT ?auto_7800 ?auto_7824 ) ( ON ?auto_7800 ?auto_7832 ) ( CLEAR ?auto_7800 ) ( not ( = ?auto_7799 ?auto_7800 ) ) ( not ( = ?auto_7799 ?auto_7832 ) ) ( not ( = ?auto_7800 ?auto_7832 ) ) ( not ( = ?auto_7808 ?auto_7816 ) ) ( IS-CRATE ?auto_7799 ) ( not ( = ?auto_7821 ?auto_7810 ) ) ( HOIST-AT ?auto_7833 ?auto_7821 ) ( AVAILABLE ?auto_7833 ) ( SURFACE-AT ?auto_7799 ?auto_7821 ) ( ON ?auto_7799 ?auto_7819 ) ( CLEAR ?auto_7799 ) ( not ( = ?auto_7798 ?auto_7799 ) ) ( not ( = ?auto_7798 ?auto_7819 ) ) ( not ( = ?auto_7799 ?auto_7819 ) ) ( not ( = ?auto_7808 ?auto_7833 ) ) ( IS-CRATE ?auto_7798 ) ( not ( = ?auto_7834 ?auto_7810 ) ) ( HOIST-AT ?auto_7815 ?auto_7834 ) ( AVAILABLE ?auto_7815 ) ( SURFACE-AT ?auto_7798 ?auto_7834 ) ( ON ?auto_7798 ?auto_7827 ) ( CLEAR ?auto_7798 ) ( not ( = ?auto_7797 ?auto_7798 ) ) ( not ( = ?auto_7797 ?auto_7827 ) ) ( not ( = ?auto_7798 ?auto_7827 ) ) ( not ( = ?auto_7808 ?auto_7815 ) ) ( IS-CRATE ?auto_7797 ) ( not ( = ?auto_7814 ?auto_7810 ) ) ( HOIST-AT ?auto_7818 ?auto_7814 ) ( AVAILABLE ?auto_7818 ) ( SURFACE-AT ?auto_7797 ?auto_7814 ) ( ON ?auto_7797 ?auto_7817 ) ( CLEAR ?auto_7797 ) ( not ( = ?auto_7796 ?auto_7797 ) ) ( not ( = ?auto_7796 ?auto_7817 ) ) ( not ( = ?auto_7797 ?auto_7817 ) ) ( not ( = ?auto_7808 ?auto_7818 ) ) ( SURFACE-AT ?auto_7795 ?auto_7810 ) ( CLEAR ?auto_7795 ) ( IS-CRATE ?auto_7796 ) ( AVAILABLE ?auto_7808 ) ( AVAILABLE ?auto_7820 ) ( SURFACE-AT ?auto_7796 ?auto_7829 ) ( ON ?auto_7796 ?auto_7826 ) ( CLEAR ?auto_7796 ) ( TRUCK-AT ?auto_7807 ?auto_7810 ) ( not ( = ?auto_7795 ?auto_7796 ) ) ( not ( = ?auto_7795 ?auto_7826 ) ) ( not ( = ?auto_7796 ?auto_7826 ) ) ( not ( = ?auto_7795 ?auto_7797 ) ) ( not ( = ?auto_7795 ?auto_7817 ) ) ( not ( = ?auto_7797 ?auto_7826 ) ) ( not ( = ?auto_7814 ?auto_7829 ) ) ( not ( = ?auto_7818 ?auto_7820 ) ) ( not ( = ?auto_7817 ?auto_7826 ) ) ( not ( = ?auto_7795 ?auto_7798 ) ) ( not ( = ?auto_7795 ?auto_7827 ) ) ( not ( = ?auto_7796 ?auto_7798 ) ) ( not ( = ?auto_7796 ?auto_7827 ) ) ( not ( = ?auto_7798 ?auto_7817 ) ) ( not ( = ?auto_7798 ?auto_7826 ) ) ( not ( = ?auto_7834 ?auto_7814 ) ) ( not ( = ?auto_7834 ?auto_7829 ) ) ( not ( = ?auto_7815 ?auto_7818 ) ) ( not ( = ?auto_7815 ?auto_7820 ) ) ( not ( = ?auto_7827 ?auto_7817 ) ) ( not ( = ?auto_7827 ?auto_7826 ) ) ( not ( = ?auto_7795 ?auto_7799 ) ) ( not ( = ?auto_7795 ?auto_7819 ) ) ( not ( = ?auto_7796 ?auto_7799 ) ) ( not ( = ?auto_7796 ?auto_7819 ) ) ( not ( = ?auto_7797 ?auto_7799 ) ) ( not ( = ?auto_7797 ?auto_7819 ) ) ( not ( = ?auto_7799 ?auto_7827 ) ) ( not ( = ?auto_7799 ?auto_7817 ) ) ( not ( = ?auto_7799 ?auto_7826 ) ) ( not ( = ?auto_7821 ?auto_7834 ) ) ( not ( = ?auto_7821 ?auto_7814 ) ) ( not ( = ?auto_7821 ?auto_7829 ) ) ( not ( = ?auto_7833 ?auto_7815 ) ) ( not ( = ?auto_7833 ?auto_7818 ) ) ( not ( = ?auto_7833 ?auto_7820 ) ) ( not ( = ?auto_7819 ?auto_7827 ) ) ( not ( = ?auto_7819 ?auto_7817 ) ) ( not ( = ?auto_7819 ?auto_7826 ) ) ( not ( = ?auto_7795 ?auto_7800 ) ) ( not ( = ?auto_7795 ?auto_7832 ) ) ( not ( = ?auto_7796 ?auto_7800 ) ) ( not ( = ?auto_7796 ?auto_7832 ) ) ( not ( = ?auto_7797 ?auto_7800 ) ) ( not ( = ?auto_7797 ?auto_7832 ) ) ( not ( = ?auto_7798 ?auto_7800 ) ) ( not ( = ?auto_7798 ?auto_7832 ) ) ( not ( = ?auto_7800 ?auto_7819 ) ) ( not ( = ?auto_7800 ?auto_7827 ) ) ( not ( = ?auto_7800 ?auto_7817 ) ) ( not ( = ?auto_7800 ?auto_7826 ) ) ( not ( = ?auto_7824 ?auto_7821 ) ) ( not ( = ?auto_7824 ?auto_7834 ) ) ( not ( = ?auto_7824 ?auto_7814 ) ) ( not ( = ?auto_7824 ?auto_7829 ) ) ( not ( = ?auto_7816 ?auto_7833 ) ) ( not ( = ?auto_7816 ?auto_7815 ) ) ( not ( = ?auto_7816 ?auto_7818 ) ) ( not ( = ?auto_7816 ?auto_7820 ) ) ( not ( = ?auto_7832 ?auto_7819 ) ) ( not ( = ?auto_7832 ?auto_7827 ) ) ( not ( = ?auto_7832 ?auto_7817 ) ) ( not ( = ?auto_7832 ?auto_7826 ) ) ( not ( = ?auto_7795 ?auto_7801 ) ) ( not ( = ?auto_7795 ?auto_7813 ) ) ( not ( = ?auto_7796 ?auto_7801 ) ) ( not ( = ?auto_7796 ?auto_7813 ) ) ( not ( = ?auto_7797 ?auto_7801 ) ) ( not ( = ?auto_7797 ?auto_7813 ) ) ( not ( = ?auto_7798 ?auto_7801 ) ) ( not ( = ?auto_7798 ?auto_7813 ) ) ( not ( = ?auto_7799 ?auto_7801 ) ) ( not ( = ?auto_7799 ?auto_7813 ) ) ( not ( = ?auto_7801 ?auto_7832 ) ) ( not ( = ?auto_7801 ?auto_7819 ) ) ( not ( = ?auto_7801 ?auto_7827 ) ) ( not ( = ?auto_7801 ?auto_7817 ) ) ( not ( = ?auto_7801 ?auto_7826 ) ) ( not ( = ?auto_7813 ?auto_7832 ) ) ( not ( = ?auto_7813 ?auto_7819 ) ) ( not ( = ?auto_7813 ?auto_7827 ) ) ( not ( = ?auto_7813 ?auto_7817 ) ) ( not ( = ?auto_7813 ?auto_7826 ) ) ( not ( = ?auto_7795 ?auto_7804 ) ) ( not ( = ?auto_7795 ?auto_7836 ) ) ( not ( = ?auto_7796 ?auto_7804 ) ) ( not ( = ?auto_7796 ?auto_7836 ) ) ( not ( = ?auto_7797 ?auto_7804 ) ) ( not ( = ?auto_7797 ?auto_7836 ) ) ( not ( = ?auto_7798 ?auto_7804 ) ) ( not ( = ?auto_7798 ?auto_7836 ) ) ( not ( = ?auto_7799 ?auto_7804 ) ) ( not ( = ?auto_7799 ?auto_7836 ) ) ( not ( = ?auto_7800 ?auto_7804 ) ) ( not ( = ?auto_7800 ?auto_7836 ) ) ( not ( = ?auto_7804 ?auto_7813 ) ) ( not ( = ?auto_7804 ?auto_7832 ) ) ( not ( = ?auto_7804 ?auto_7819 ) ) ( not ( = ?auto_7804 ?auto_7827 ) ) ( not ( = ?auto_7804 ?auto_7817 ) ) ( not ( = ?auto_7804 ?auto_7826 ) ) ( not ( = ?auto_7823 ?auto_7829 ) ) ( not ( = ?auto_7823 ?auto_7824 ) ) ( not ( = ?auto_7823 ?auto_7821 ) ) ( not ( = ?auto_7823 ?auto_7834 ) ) ( not ( = ?auto_7823 ?auto_7814 ) ) ( not ( = ?auto_7830 ?auto_7820 ) ) ( not ( = ?auto_7830 ?auto_7816 ) ) ( not ( = ?auto_7830 ?auto_7833 ) ) ( not ( = ?auto_7830 ?auto_7815 ) ) ( not ( = ?auto_7830 ?auto_7818 ) ) ( not ( = ?auto_7836 ?auto_7813 ) ) ( not ( = ?auto_7836 ?auto_7832 ) ) ( not ( = ?auto_7836 ?auto_7819 ) ) ( not ( = ?auto_7836 ?auto_7827 ) ) ( not ( = ?auto_7836 ?auto_7817 ) ) ( not ( = ?auto_7836 ?auto_7826 ) ) ( not ( = ?auto_7795 ?auto_7803 ) ) ( not ( = ?auto_7795 ?auto_7825 ) ) ( not ( = ?auto_7796 ?auto_7803 ) ) ( not ( = ?auto_7796 ?auto_7825 ) ) ( not ( = ?auto_7797 ?auto_7803 ) ) ( not ( = ?auto_7797 ?auto_7825 ) ) ( not ( = ?auto_7798 ?auto_7803 ) ) ( not ( = ?auto_7798 ?auto_7825 ) ) ( not ( = ?auto_7799 ?auto_7803 ) ) ( not ( = ?auto_7799 ?auto_7825 ) ) ( not ( = ?auto_7800 ?auto_7803 ) ) ( not ( = ?auto_7800 ?auto_7825 ) ) ( not ( = ?auto_7801 ?auto_7803 ) ) ( not ( = ?auto_7801 ?auto_7825 ) ) ( not ( = ?auto_7803 ?auto_7836 ) ) ( not ( = ?auto_7803 ?auto_7813 ) ) ( not ( = ?auto_7803 ?auto_7832 ) ) ( not ( = ?auto_7803 ?auto_7819 ) ) ( not ( = ?auto_7803 ?auto_7827 ) ) ( not ( = ?auto_7803 ?auto_7817 ) ) ( not ( = ?auto_7803 ?auto_7826 ) ) ( not ( = ?auto_7831 ?auto_7823 ) ) ( not ( = ?auto_7831 ?auto_7829 ) ) ( not ( = ?auto_7831 ?auto_7824 ) ) ( not ( = ?auto_7831 ?auto_7821 ) ) ( not ( = ?auto_7831 ?auto_7834 ) ) ( not ( = ?auto_7831 ?auto_7814 ) ) ( not ( = ?auto_7828 ?auto_7830 ) ) ( not ( = ?auto_7828 ?auto_7820 ) ) ( not ( = ?auto_7828 ?auto_7816 ) ) ( not ( = ?auto_7828 ?auto_7833 ) ) ( not ( = ?auto_7828 ?auto_7815 ) ) ( not ( = ?auto_7828 ?auto_7818 ) ) ( not ( = ?auto_7825 ?auto_7836 ) ) ( not ( = ?auto_7825 ?auto_7813 ) ) ( not ( = ?auto_7825 ?auto_7832 ) ) ( not ( = ?auto_7825 ?auto_7819 ) ) ( not ( = ?auto_7825 ?auto_7827 ) ) ( not ( = ?auto_7825 ?auto_7817 ) ) ( not ( = ?auto_7825 ?auto_7826 ) ) ( not ( = ?auto_7795 ?auto_7802 ) ) ( not ( = ?auto_7795 ?auto_7812 ) ) ( not ( = ?auto_7796 ?auto_7802 ) ) ( not ( = ?auto_7796 ?auto_7812 ) ) ( not ( = ?auto_7797 ?auto_7802 ) ) ( not ( = ?auto_7797 ?auto_7812 ) ) ( not ( = ?auto_7798 ?auto_7802 ) ) ( not ( = ?auto_7798 ?auto_7812 ) ) ( not ( = ?auto_7799 ?auto_7802 ) ) ( not ( = ?auto_7799 ?auto_7812 ) ) ( not ( = ?auto_7800 ?auto_7802 ) ) ( not ( = ?auto_7800 ?auto_7812 ) ) ( not ( = ?auto_7801 ?auto_7802 ) ) ( not ( = ?auto_7801 ?auto_7812 ) ) ( not ( = ?auto_7804 ?auto_7802 ) ) ( not ( = ?auto_7804 ?auto_7812 ) ) ( not ( = ?auto_7802 ?auto_7825 ) ) ( not ( = ?auto_7802 ?auto_7836 ) ) ( not ( = ?auto_7802 ?auto_7813 ) ) ( not ( = ?auto_7802 ?auto_7832 ) ) ( not ( = ?auto_7802 ?auto_7819 ) ) ( not ( = ?auto_7802 ?auto_7827 ) ) ( not ( = ?auto_7802 ?auto_7817 ) ) ( not ( = ?auto_7802 ?auto_7826 ) ) ( not ( = ?auto_7822 ?auto_7831 ) ) ( not ( = ?auto_7822 ?auto_7823 ) ) ( not ( = ?auto_7822 ?auto_7829 ) ) ( not ( = ?auto_7822 ?auto_7824 ) ) ( not ( = ?auto_7822 ?auto_7821 ) ) ( not ( = ?auto_7822 ?auto_7834 ) ) ( not ( = ?auto_7822 ?auto_7814 ) ) ( not ( = ?auto_7835 ?auto_7828 ) ) ( not ( = ?auto_7835 ?auto_7830 ) ) ( not ( = ?auto_7835 ?auto_7820 ) ) ( not ( = ?auto_7835 ?auto_7816 ) ) ( not ( = ?auto_7835 ?auto_7833 ) ) ( not ( = ?auto_7835 ?auto_7815 ) ) ( not ( = ?auto_7835 ?auto_7818 ) ) ( not ( = ?auto_7812 ?auto_7825 ) ) ( not ( = ?auto_7812 ?auto_7836 ) ) ( not ( = ?auto_7812 ?auto_7813 ) ) ( not ( = ?auto_7812 ?auto_7832 ) ) ( not ( = ?auto_7812 ?auto_7819 ) ) ( not ( = ?auto_7812 ?auto_7827 ) ) ( not ( = ?auto_7812 ?auto_7817 ) ) ( not ( = ?auto_7812 ?auto_7826 ) ) ( not ( = ?auto_7795 ?auto_7805 ) ) ( not ( = ?auto_7795 ?auto_7806 ) ) ( not ( = ?auto_7796 ?auto_7805 ) ) ( not ( = ?auto_7796 ?auto_7806 ) ) ( not ( = ?auto_7797 ?auto_7805 ) ) ( not ( = ?auto_7797 ?auto_7806 ) ) ( not ( = ?auto_7798 ?auto_7805 ) ) ( not ( = ?auto_7798 ?auto_7806 ) ) ( not ( = ?auto_7799 ?auto_7805 ) ) ( not ( = ?auto_7799 ?auto_7806 ) ) ( not ( = ?auto_7800 ?auto_7805 ) ) ( not ( = ?auto_7800 ?auto_7806 ) ) ( not ( = ?auto_7801 ?auto_7805 ) ) ( not ( = ?auto_7801 ?auto_7806 ) ) ( not ( = ?auto_7804 ?auto_7805 ) ) ( not ( = ?auto_7804 ?auto_7806 ) ) ( not ( = ?auto_7803 ?auto_7805 ) ) ( not ( = ?auto_7803 ?auto_7806 ) ) ( not ( = ?auto_7805 ?auto_7812 ) ) ( not ( = ?auto_7805 ?auto_7825 ) ) ( not ( = ?auto_7805 ?auto_7836 ) ) ( not ( = ?auto_7805 ?auto_7813 ) ) ( not ( = ?auto_7805 ?auto_7832 ) ) ( not ( = ?auto_7805 ?auto_7819 ) ) ( not ( = ?auto_7805 ?auto_7827 ) ) ( not ( = ?auto_7805 ?auto_7817 ) ) ( not ( = ?auto_7805 ?auto_7826 ) ) ( not ( = ?auto_7809 ?auto_7822 ) ) ( not ( = ?auto_7809 ?auto_7831 ) ) ( not ( = ?auto_7809 ?auto_7823 ) ) ( not ( = ?auto_7809 ?auto_7829 ) ) ( not ( = ?auto_7809 ?auto_7824 ) ) ( not ( = ?auto_7809 ?auto_7821 ) ) ( not ( = ?auto_7809 ?auto_7834 ) ) ( not ( = ?auto_7809 ?auto_7814 ) ) ( not ( = ?auto_7811 ?auto_7835 ) ) ( not ( = ?auto_7811 ?auto_7828 ) ) ( not ( = ?auto_7811 ?auto_7830 ) ) ( not ( = ?auto_7811 ?auto_7820 ) ) ( not ( = ?auto_7811 ?auto_7816 ) ) ( not ( = ?auto_7811 ?auto_7833 ) ) ( not ( = ?auto_7811 ?auto_7815 ) ) ( not ( = ?auto_7811 ?auto_7818 ) ) ( not ( = ?auto_7806 ?auto_7812 ) ) ( not ( = ?auto_7806 ?auto_7825 ) ) ( not ( = ?auto_7806 ?auto_7836 ) ) ( not ( = ?auto_7806 ?auto_7813 ) ) ( not ( = ?auto_7806 ?auto_7832 ) ) ( not ( = ?auto_7806 ?auto_7819 ) ) ( not ( = ?auto_7806 ?auto_7827 ) ) ( not ( = ?auto_7806 ?auto_7817 ) ) ( not ( = ?auto_7806 ?auto_7826 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_7795 ?auto_7796 ?auto_7797 ?auto_7798 ?auto_7799 ?auto_7800 ?auto_7801 ?auto_7804 ?auto_7803 ?auto_7802 )
      ( MAKE-1CRATE ?auto_7802 ?auto_7805 )
      ( MAKE-10CRATE-VERIFY ?auto_7795 ?auto_7796 ?auto_7797 ?auto_7798 ?auto_7799 ?auto_7800 ?auto_7801 ?auto_7804 ?auto_7803 ?auto_7802 ?auto_7805 ) )
  )

)

