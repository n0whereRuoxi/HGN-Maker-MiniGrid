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
      ?auto_7418 - SURFACE
      ?auto_7419 - SURFACE
    )
    :vars
    (
      ?auto_7420 - HOIST
      ?auto_7421 - PLACE
      ?auto_7423 - PLACE
      ?auto_7424 - HOIST
      ?auto_7425 - SURFACE
      ?auto_7422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7420 ?auto_7421 ) ( SURFACE-AT ?auto_7418 ?auto_7421 ) ( CLEAR ?auto_7418 ) ( IS-CRATE ?auto_7419 ) ( AVAILABLE ?auto_7420 ) ( not ( = ?auto_7423 ?auto_7421 ) ) ( HOIST-AT ?auto_7424 ?auto_7423 ) ( AVAILABLE ?auto_7424 ) ( SURFACE-AT ?auto_7419 ?auto_7423 ) ( ON ?auto_7419 ?auto_7425 ) ( CLEAR ?auto_7419 ) ( TRUCK-AT ?auto_7422 ?auto_7421 ) ( not ( = ?auto_7418 ?auto_7419 ) ) ( not ( = ?auto_7418 ?auto_7425 ) ) ( not ( = ?auto_7419 ?auto_7425 ) ) ( not ( = ?auto_7420 ?auto_7424 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7422 ?auto_7421 ?auto_7423 )
      ( !LIFT ?auto_7424 ?auto_7419 ?auto_7425 ?auto_7423 )
      ( !LOAD ?auto_7424 ?auto_7419 ?auto_7422 ?auto_7423 )
      ( !DRIVE ?auto_7422 ?auto_7423 ?auto_7421 )
      ( !UNLOAD ?auto_7420 ?auto_7419 ?auto_7422 ?auto_7421 )
      ( !DROP ?auto_7420 ?auto_7419 ?auto_7418 ?auto_7421 )
      ( MAKE-1CRATE-VERIFY ?auto_7418 ?auto_7419 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7428 - SURFACE
      ?auto_7429 - SURFACE
    )
    :vars
    (
      ?auto_7430 - HOIST
      ?auto_7431 - PLACE
      ?auto_7433 - PLACE
      ?auto_7434 - HOIST
      ?auto_7435 - SURFACE
      ?auto_7432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7430 ?auto_7431 ) ( SURFACE-AT ?auto_7428 ?auto_7431 ) ( CLEAR ?auto_7428 ) ( IS-CRATE ?auto_7429 ) ( AVAILABLE ?auto_7430 ) ( not ( = ?auto_7433 ?auto_7431 ) ) ( HOIST-AT ?auto_7434 ?auto_7433 ) ( AVAILABLE ?auto_7434 ) ( SURFACE-AT ?auto_7429 ?auto_7433 ) ( ON ?auto_7429 ?auto_7435 ) ( CLEAR ?auto_7429 ) ( TRUCK-AT ?auto_7432 ?auto_7431 ) ( not ( = ?auto_7428 ?auto_7429 ) ) ( not ( = ?auto_7428 ?auto_7435 ) ) ( not ( = ?auto_7429 ?auto_7435 ) ) ( not ( = ?auto_7430 ?auto_7434 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7432 ?auto_7431 ?auto_7433 )
      ( !LIFT ?auto_7434 ?auto_7429 ?auto_7435 ?auto_7433 )
      ( !LOAD ?auto_7434 ?auto_7429 ?auto_7432 ?auto_7433 )
      ( !DRIVE ?auto_7432 ?auto_7433 ?auto_7431 )
      ( !UNLOAD ?auto_7430 ?auto_7429 ?auto_7432 ?auto_7431 )
      ( !DROP ?auto_7430 ?auto_7429 ?auto_7428 ?auto_7431 )
      ( MAKE-1CRATE-VERIFY ?auto_7428 ?auto_7429 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7439 - SURFACE
      ?auto_7440 - SURFACE
      ?auto_7441 - SURFACE
    )
    :vars
    (
      ?auto_7442 - HOIST
      ?auto_7443 - PLACE
      ?auto_7444 - PLACE
      ?auto_7447 - HOIST
      ?auto_7446 - SURFACE
      ?auto_7448 - SURFACE
      ?auto_7445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7442 ?auto_7443 ) ( IS-CRATE ?auto_7441 ) ( not ( = ?auto_7444 ?auto_7443 ) ) ( HOIST-AT ?auto_7447 ?auto_7444 ) ( SURFACE-AT ?auto_7441 ?auto_7444 ) ( ON ?auto_7441 ?auto_7446 ) ( CLEAR ?auto_7441 ) ( not ( = ?auto_7440 ?auto_7441 ) ) ( not ( = ?auto_7440 ?auto_7446 ) ) ( not ( = ?auto_7441 ?auto_7446 ) ) ( not ( = ?auto_7442 ?auto_7447 ) ) ( SURFACE-AT ?auto_7439 ?auto_7443 ) ( CLEAR ?auto_7439 ) ( IS-CRATE ?auto_7440 ) ( AVAILABLE ?auto_7442 ) ( AVAILABLE ?auto_7447 ) ( SURFACE-AT ?auto_7440 ?auto_7444 ) ( ON ?auto_7440 ?auto_7448 ) ( CLEAR ?auto_7440 ) ( TRUCK-AT ?auto_7445 ?auto_7443 ) ( not ( = ?auto_7439 ?auto_7440 ) ) ( not ( = ?auto_7439 ?auto_7448 ) ) ( not ( = ?auto_7440 ?auto_7448 ) ) ( not ( = ?auto_7439 ?auto_7441 ) ) ( not ( = ?auto_7439 ?auto_7446 ) ) ( not ( = ?auto_7441 ?auto_7448 ) ) ( not ( = ?auto_7446 ?auto_7448 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7439 ?auto_7440 )
      ( MAKE-1CRATE ?auto_7440 ?auto_7441 )
      ( MAKE-2CRATE-VERIFY ?auto_7439 ?auto_7440 ?auto_7441 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7451 - SURFACE
      ?auto_7452 - SURFACE
    )
    :vars
    (
      ?auto_7453 - HOIST
      ?auto_7454 - PLACE
      ?auto_7456 - PLACE
      ?auto_7457 - HOIST
      ?auto_7458 - SURFACE
      ?auto_7455 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7453 ?auto_7454 ) ( SURFACE-AT ?auto_7451 ?auto_7454 ) ( CLEAR ?auto_7451 ) ( IS-CRATE ?auto_7452 ) ( AVAILABLE ?auto_7453 ) ( not ( = ?auto_7456 ?auto_7454 ) ) ( HOIST-AT ?auto_7457 ?auto_7456 ) ( AVAILABLE ?auto_7457 ) ( SURFACE-AT ?auto_7452 ?auto_7456 ) ( ON ?auto_7452 ?auto_7458 ) ( CLEAR ?auto_7452 ) ( TRUCK-AT ?auto_7455 ?auto_7454 ) ( not ( = ?auto_7451 ?auto_7452 ) ) ( not ( = ?auto_7451 ?auto_7458 ) ) ( not ( = ?auto_7452 ?auto_7458 ) ) ( not ( = ?auto_7453 ?auto_7457 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7455 ?auto_7454 ?auto_7456 )
      ( !LIFT ?auto_7457 ?auto_7452 ?auto_7458 ?auto_7456 )
      ( !LOAD ?auto_7457 ?auto_7452 ?auto_7455 ?auto_7456 )
      ( !DRIVE ?auto_7455 ?auto_7456 ?auto_7454 )
      ( !UNLOAD ?auto_7453 ?auto_7452 ?auto_7455 ?auto_7454 )
      ( !DROP ?auto_7453 ?auto_7452 ?auto_7451 ?auto_7454 )
      ( MAKE-1CRATE-VERIFY ?auto_7451 ?auto_7452 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7463 - SURFACE
      ?auto_7464 - SURFACE
      ?auto_7465 - SURFACE
      ?auto_7466 - SURFACE
    )
    :vars
    (
      ?auto_7469 - HOIST
      ?auto_7467 - PLACE
      ?auto_7471 - PLACE
      ?auto_7472 - HOIST
      ?auto_7470 - SURFACE
      ?auto_7474 - PLACE
      ?auto_7473 - HOIST
      ?auto_7476 - SURFACE
      ?auto_7475 - SURFACE
      ?auto_7468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7469 ?auto_7467 ) ( IS-CRATE ?auto_7466 ) ( not ( = ?auto_7471 ?auto_7467 ) ) ( HOIST-AT ?auto_7472 ?auto_7471 ) ( AVAILABLE ?auto_7472 ) ( SURFACE-AT ?auto_7466 ?auto_7471 ) ( ON ?auto_7466 ?auto_7470 ) ( CLEAR ?auto_7466 ) ( not ( = ?auto_7465 ?auto_7466 ) ) ( not ( = ?auto_7465 ?auto_7470 ) ) ( not ( = ?auto_7466 ?auto_7470 ) ) ( not ( = ?auto_7469 ?auto_7472 ) ) ( IS-CRATE ?auto_7465 ) ( not ( = ?auto_7474 ?auto_7467 ) ) ( HOIST-AT ?auto_7473 ?auto_7474 ) ( SURFACE-AT ?auto_7465 ?auto_7474 ) ( ON ?auto_7465 ?auto_7476 ) ( CLEAR ?auto_7465 ) ( not ( = ?auto_7464 ?auto_7465 ) ) ( not ( = ?auto_7464 ?auto_7476 ) ) ( not ( = ?auto_7465 ?auto_7476 ) ) ( not ( = ?auto_7469 ?auto_7473 ) ) ( SURFACE-AT ?auto_7463 ?auto_7467 ) ( CLEAR ?auto_7463 ) ( IS-CRATE ?auto_7464 ) ( AVAILABLE ?auto_7469 ) ( AVAILABLE ?auto_7473 ) ( SURFACE-AT ?auto_7464 ?auto_7474 ) ( ON ?auto_7464 ?auto_7475 ) ( CLEAR ?auto_7464 ) ( TRUCK-AT ?auto_7468 ?auto_7467 ) ( not ( = ?auto_7463 ?auto_7464 ) ) ( not ( = ?auto_7463 ?auto_7475 ) ) ( not ( = ?auto_7464 ?auto_7475 ) ) ( not ( = ?auto_7463 ?auto_7465 ) ) ( not ( = ?auto_7463 ?auto_7476 ) ) ( not ( = ?auto_7465 ?auto_7475 ) ) ( not ( = ?auto_7476 ?auto_7475 ) ) ( not ( = ?auto_7463 ?auto_7466 ) ) ( not ( = ?auto_7463 ?auto_7470 ) ) ( not ( = ?auto_7464 ?auto_7466 ) ) ( not ( = ?auto_7464 ?auto_7470 ) ) ( not ( = ?auto_7466 ?auto_7476 ) ) ( not ( = ?auto_7466 ?auto_7475 ) ) ( not ( = ?auto_7471 ?auto_7474 ) ) ( not ( = ?auto_7472 ?auto_7473 ) ) ( not ( = ?auto_7470 ?auto_7476 ) ) ( not ( = ?auto_7470 ?auto_7475 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7463 ?auto_7464 ?auto_7465 )
      ( MAKE-1CRATE ?auto_7465 ?auto_7466 )
      ( MAKE-3CRATE-VERIFY ?auto_7463 ?auto_7464 ?auto_7465 ?auto_7466 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7479 - SURFACE
      ?auto_7480 - SURFACE
    )
    :vars
    (
      ?auto_7481 - HOIST
      ?auto_7482 - PLACE
      ?auto_7484 - PLACE
      ?auto_7485 - HOIST
      ?auto_7486 - SURFACE
      ?auto_7483 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7481 ?auto_7482 ) ( SURFACE-AT ?auto_7479 ?auto_7482 ) ( CLEAR ?auto_7479 ) ( IS-CRATE ?auto_7480 ) ( AVAILABLE ?auto_7481 ) ( not ( = ?auto_7484 ?auto_7482 ) ) ( HOIST-AT ?auto_7485 ?auto_7484 ) ( AVAILABLE ?auto_7485 ) ( SURFACE-AT ?auto_7480 ?auto_7484 ) ( ON ?auto_7480 ?auto_7486 ) ( CLEAR ?auto_7480 ) ( TRUCK-AT ?auto_7483 ?auto_7482 ) ( not ( = ?auto_7479 ?auto_7480 ) ) ( not ( = ?auto_7479 ?auto_7486 ) ) ( not ( = ?auto_7480 ?auto_7486 ) ) ( not ( = ?auto_7481 ?auto_7485 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7483 ?auto_7482 ?auto_7484 )
      ( !LIFT ?auto_7485 ?auto_7480 ?auto_7486 ?auto_7484 )
      ( !LOAD ?auto_7485 ?auto_7480 ?auto_7483 ?auto_7484 )
      ( !DRIVE ?auto_7483 ?auto_7484 ?auto_7482 )
      ( !UNLOAD ?auto_7481 ?auto_7480 ?auto_7483 ?auto_7482 )
      ( !DROP ?auto_7481 ?auto_7480 ?auto_7479 ?auto_7482 )
      ( MAKE-1CRATE-VERIFY ?auto_7479 ?auto_7480 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_7492 - SURFACE
      ?auto_7493 - SURFACE
      ?auto_7494 - SURFACE
      ?auto_7495 - SURFACE
      ?auto_7496 - SURFACE
    )
    :vars
    (
      ?auto_7499 - HOIST
      ?auto_7500 - PLACE
      ?auto_7498 - PLACE
      ?auto_7497 - HOIST
      ?auto_7501 - SURFACE
      ?auto_7503 - SURFACE
      ?auto_7506 - PLACE
      ?auto_7507 - HOIST
      ?auto_7505 - SURFACE
      ?auto_7504 - SURFACE
      ?auto_7502 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7499 ?auto_7500 ) ( IS-CRATE ?auto_7496 ) ( not ( = ?auto_7498 ?auto_7500 ) ) ( HOIST-AT ?auto_7497 ?auto_7498 ) ( SURFACE-AT ?auto_7496 ?auto_7498 ) ( ON ?auto_7496 ?auto_7501 ) ( CLEAR ?auto_7496 ) ( not ( = ?auto_7495 ?auto_7496 ) ) ( not ( = ?auto_7495 ?auto_7501 ) ) ( not ( = ?auto_7496 ?auto_7501 ) ) ( not ( = ?auto_7499 ?auto_7497 ) ) ( IS-CRATE ?auto_7495 ) ( AVAILABLE ?auto_7497 ) ( SURFACE-AT ?auto_7495 ?auto_7498 ) ( ON ?auto_7495 ?auto_7503 ) ( CLEAR ?auto_7495 ) ( not ( = ?auto_7494 ?auto_7495 ) ) ( not ( = ?auto_7494 ?auto_7503 ) ) ( not ( = ?auto_7495 ?auto_7503 ) ) ( IS-CRATE ?auto_7494 ) ( not ( = ?auto_7506 ?auto_7500 ) ) ( HOIST-AT ?auto_7507 ?auto_7506 ) ( SURFACE-AT ?auto_7494 ?auto_7506 ) ( ON ?auto_7494 ?auto_7505 ) ( CLEAR ?auto_7494 ) ( not ( = ?auto_7493 ?auto_7494 ) ) ( not ( = ?auto_7493 ?auto_7505 ) ) ( not ( = ?auto_7494 ?auto_7505 ) ) ( not ( = ?auto_7499 ?auto_7507 ) ) ( SURFACE-AT ?auto_7492 ?auto_7500 ) ( CLEAR ?auto_7492 ) ( IS-CRATE ?auto_7493 ) ( AVAILABLE ?auto_7499 ) ( AVAILABLE ?auto_7507 ) ( SURFACE-AT ?auto_7493 ?auto_7506 ) ( ON ?auto_7493 ?auto_7504 ) ( CLEAR ?auto_7493 ) ( TRUCK-AT ?auto_7502 ?auto_7500 ) ( not ( = ?auto_7492 ?auto_7493 ) ) ( not ( = ?auto_7492 ?auto_7504 ) ) ( not ( = ?auto_7493 ?auto_7504 ) ) ( not ( = ?auto_7492 ?auto_7494 ) ) ( not ( = ?auto_7492 ?auto_7505 ) ) ( not ( = ?auto_7494 ?auto_7504 ) ) ( not ( = ?auto_7505 ?auto_7504 ) ) ( not ( = ?auto_7492 ?auto_7495 ) ) ( not ( = ?auto_7492 ?auto_7503 ) ) ( not ( = ?auto_7493 ?auto_7495 ) ) ( not ( = ?auto_7493 ?auto_7503 ) ) ( not ( = ?auto_7495 ?auto_7505 ) ) ( not ( = ?auto_7495 ?auto_7504 ) ) ( not ( = ?auto_7498 ?auto_7506 ) ) ( not ( = ?auto_7497 ?auto_7507 ) ) ( not ( = ?auto_7503 ?auto_7505 ) ) ( not ( = ?auto_7503 ?auto_7504 ) ) ( not ( = ?auto_7492 ?auto_7496 ) ) ( not ( = ?auto_7492 ?auto_7501 ) ) ( not ( = ?auto_7493 ?auto_7496 ) ) ( not ( = ?auto_7493 ?auto_7501 ) ) ( not ( = ?auto_7494 ?auto_7496 ) ) ( not ( = ?auto_7494 ?auto_7501 ) ) ( not ( = ?auto_7496 ?auto_7503 ) ) ( not ( = ?auto_7496 ?auto_7505 ) ) ( not ( = ?auto_7496 ?auto_7504 ) ) ( not ( = ?auto_7501 ?auto_7503 ) ) ( not ( = ?auto_7501 ?auto_7505 ) ) ( not ( = ?auto_7501 ?auto_7504 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_7492 ?auto_7493 ?auto_7494 ?auto_7495 )
      ( MAKE-1CRATE ?auto_7495 ?auto_7496 )
      ( MAKE-4CRATE-VERIFY ?auto_7492 ?auto_7493 ?auto_7494 ?auto_7495 ?auto_7496 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7510 - SURFACE
      ?auto_7511 - SURFACE
    )
    :vars
    (
      ?auto_7512 - HOIST
      ?auto_7513 - PLACE
      ?auto_7515 - PLACE
      ?auto_7516 - HOIST
      ?auto_7517 - SURFACE
      ?auto_7514 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7512 ?auto_7513 ) ( SURFACE-AT ?auto_7510 ?auto_7513 ) ( CLEAR ?auto_7510 ) ( IS-CRATE ?auto_7511 ) ( AVAILABLE ?auto_7512 ) ( not ( = ?auto_7515 ?auto_7513 ) ) ( HOIST-AT ?auto_7516 ?auto_7515 ) ( AVAILABLE ?auto_7516 ) ( SURFACE-AT ?auto_7511 ?auto_7515 ) ( ON ?auto_7511 ?auto_7517 ) ( CLEAR ?auto_7511 ) ( TRUCK-AT ?auto_7514 ?auto_7513 ) ( not ( = ?auto_7510 ?auto_7511 ) ) ( not ( = ?auto_7510 ?auto_7517 ) ) ( not ( = ?auto_7511 ?auto_7517 ) ) ( not ( = ?auto_7512 ?auto_7516 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7514 ?auto_7513 ?auto_7515 )
      ( !LIFT ?auto_7516 ?auto_7511 ?auto_7517 ?auto_7515 )
      ( !LOAD ?auto_7516 ?auto_7511 ?auto_7514 ?auto_7515 )
      ( !DRIVE ?auto_7514 ?auto_7515 ?auto_7513 )
      ( !UNLOAD ?auto_7512 ?auto_7511 ?auto_7514 ?auto_7513 )
      ( !DROP ?auto_7512 ?auto_7511 ?auto_7510 ?auto_7513 )
      ( MAKE-1CRATE-VERIFY ?auto_7510 ?auto_7511 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_7524 - SURFACE
      ?auto_7525 - SURFACE
      ?auto_7526 - SURFACE
      ?auto_7527 - SURFACE
      ?auto_7528 - SURFACE
      ?auto_7529 - SURFACE
    )
    :vars
    (
      ?auto_7531 - HOIST
      ?auto_7535 - PLACE
      ?auto_7533 - PLACE
      ?auto_7534 - HOIST
      ?auto_7530 - SURFACE
      ?auto_7541 - PLACE
      ?auto_7536 - HOIST
      ?auto_7539 - SURFACE
      ?auto_7540 - SURFACE
      ?auto_7543 - PLACE
      ?auto_7542 - HOIST
      ?auto_7537 - SURFACE
      ?auto_7538 - SURFACE
      ?auto_7532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7531 ?auto_7535 ) ( IS-CRATE ?auto_7529 ) ( not ( = ?auto_7533 ?auto_7535 ) ) ( HOIST-AT ?auto_7534 ?auto_7533 ) ( AVAILABLE ?auto_7534 ) ( SURFACE-AT ?auto_7529 ?auto_7533 ) ( ON ?auto_7529 ?auto_7530 ) ( CLEAR ?auto_7529 ) ( not ( = ?auto_7528 ?auto_7529 ) ) ( not ( = ?auto_7528 ?auto_7530 ) ) ( not ( = ?auto_7529 ?auto_7530 ) ) ( not ( = ?auto_7531 ?auto_7534 ) ) ( IS-CRATE ?auto_7528 ) ( not ( = ?auto_7541 ?auto_7535 ) ) ( HOIST-AT ?auto_7536 ?auto_7541 ) ( SURFACE-AT ?auto_7528 ?auto_7541 ) ( ON ?auto_7528 ?auto_7539 ) ( CLEAR ?auto_7528 ) ( not ( = ?auto_7527 ?auto_7528 ) ) ( not ( = ?auto_7527 ?auto_7539 ) ) ( not ( = ?auto_7528 ?auto_7539 ) ) ( not ( = ?auto_7531 ?auto_7536 ) ) ( IS-CRATE ?auto_7527 ) ( AVAILABLE ?auto_7536 ) ( SURFACE-AT ?auto_7527 ?auto_7541 ) ( ON ?auto_7527 ?auto_7540 ) ( CLEAR ?auto_7527 ) ( not ( = ?auto_7526 ?auto_7527 ) ) ( not ( = ?auto_7526 ?auto_7540 ) ) ( not ( = ?auto_7527 ?auto_7540 ) ) ( IS-CRATE ?auto_7526 ) ( not ( = ?auto_7543 ?auto_7535 ) ) ( HOIST-AT ?auto_7542 ?auto_7543 ) ( SURFACE-AT ?auto_7526 ?auto_7543 ) ( ON ?auto_7526 ?auto_7537 ) ( CLEAR ?auto_7526 ) ( not ( = ?auto_7525 ?auto_7526 ) ) ( not ( = ?auto_7525 ?auto_7537 ) ) ( not ( = ?auto_7526 ?auto_7537 ) ) ( not ( = ?auto_7531 ?auto_7542 ) ) ( SURFACE-AT ?auto_7524 ?auto_7535 ) ( CLEAR ?auto_7524 ) ( IS-CRATE ?auto_7525 ) ( AVAILABLE ?auto_7531 ) ( AVAILABLE ?auto_7542 ) ( SURFACE-AT ?auto_7525 ?auto_7543 ) ( ON ?auto_7525 ?auto_7538 ) ( CLEAR ?auto_7525 ) ( TRUCK-AT ?auto_7532 ?auto_7535 ) ( not ( = ?auto_7524 ?auto_7525 ) ) ( not ( = ?auto_7524 ?auto_7538 ) ) ( not ( = ?auto_7525 ?auto_7538 ) ) ( not ( = ?auto_7524 ?auto_7526 ) ) ( not ( = ?auto_7524 ?auto_7537 ) ) ( not ( = ?auto_7526 ?auto_7538 ) ) ( not ( = ?auto_7537 ?auto_7538 ) ) ( not ( = ?auto_7524 ?auto_7527 ) ) ( not ( = ?auto_7524 ?auto_7540 ) ) ( not ( = ?auto_7525 ?auto_7527 ) ) ( not ( = ?auto_7525 ?auto_7540 ) ) ( not ( = ?auto_7527 ?auto_7537 ) ) ( not ( = ?auto_7527 ?auto_7538 ) ) ( not ( = ?auto_7541 ?auto_7543 ) ) ( not ( = ?auto_7536 ?auto_7542 ) ) ( not ( = ?auto_7540 ?auto_7537 ) ) ( not ( = ?auto_7540 ?auto_7538 ) ) ( not ( = ?auto_7524 ?auto_7528 ) ) ( not ( = ?auto_7524 ?auto_7539 ) ) ( not ( = ?auto_7525 ?auto_7528 ) ) ( not ( = ?auto_7525 ?auto_7539 ) ) ( not ( = ?auto_7526 ?auto_7528 ) ) ( not ( = ?auto_7526 ?auto_7539 ) ) ( not ( = ?auto_7528 ?auto_7540 ) ) ( not ( = ?auto_7528 ?auto_7537 ) ) ( not ( = ?auto_7528 ?auto_7538 ) ) ( not ( = ?auto_7539 ?auto_7540 ) ) ( not ( = ?auto_7539 ?auto_7537 ) ) ( not ( = ?auto_7539 ?auto_7538 ) ) ( not ( = ?auto_7524 ?auto_7529 ) ) ( not ( = ?auto_7524 ?auto_7530 ) ) ( not ( = ?auto_7525 ?auto_7529 ) ) ( not ( = ?auto_7525 ?auto_7530 ) ) ( not ( = ?auto_7526 ?auto_7529 ) ) ( not ( = ?auto_7526 ?auto_7530 ) ) ( not ( = ?auto_7527 ?auto_7529 ) ) ( not ( = ?auto_7527 ?auto_7530 ) ) ( not ( = ?auto_7529 ?auto_7539 ) ) ( not ( = ?auto_7529 ?auto_7540 ) ) ( not ( = ?auto_7529 ?auto_7537 ) ) ( not ( = ?auto_7529 ?auto_7538 ) ) ( not ( = ?auto_7533 ?auto_7541 ) ) ( not ( = ?auto_7533 ?auto_7543 ) ) ( not ( = ?auto_7534 ?auto_7536 ) ) ( not ( = ?auto_7534 ?auto_7542 ) ) ( not ( = ?auto_7530 ?auto_7539 ) ) ( not ( = ?auto_7530 ?auto_7540 ) ) ( not ( = ?auto_7530 ?auto_7537 ) ) ( not ( = ?auto_7530 ?auto_7538 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_7524 ?auto_7525 ?auto_7526 ?auto_7527 ?auto_7528 )
      ( MAKE-1CRATE ?auto_7528 ?auto_7529 )
      ( MAKE-5CRATE-VERIFY ?auto_7524 ?auto_7525 ?auto_7526 ?auto_7527 ?auto_7528 ?auto_7529 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7546 - SURFACE
      ?auto_7547 - SURFACE
    )
    :vars
    (
      ?auto_7548 - HOIST
      ?auto_7549 - PLACE
      ?auto_7551 - PLACE
      ?auto_7552 - HOIST
      ?auto_7553 - SURFACE
      ?auto_7550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7548 ?auto_7549 ) ( SURFACE-AT ?auto_7546 ?auto_7549 ) ( CLEAR ?auto_7546 ) ( IS-CRATE ?auto_7547 ) ( AVAILABLE ?auto_7548 ) ( not ( = ?auto_7551 ?auto_7549 ) ) ( HOIST-AT ?auto_7552 ?auto_7551 ) ( AVAILABLE ?auto_7552 ) ( SURFACE-AT ?auto_7547 ?auto_7551 ) ( ON ?auto_7547 ?auto_7553 ) ( CLEAR ?auto_7547 ) ( TRUCK-AT ?auto_7550 ?auto_7549 ) ( not ( = ?auto_7546 ?auto_7547 ) ) ( not ( = ?auto_7546 ?auto_7553 ) ) ( not ( = ?auto_7547 ?auto_7553 ) ) ( not ( = ?auto_7548 ?auto_7552 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7550 ?auto_7549 ?auto_7551 )
      ( !LIFT ?auto_7552 ?auto_7547 ?auto_7553 ?auto_7551 )
      ( !LOAD ?auto_7552 ?auto_7547 ?auto_7550 ?auto_7551 )
      ( !DRIVE ?auto_7550 ?auto_7551 ?auto_7549 )
      ( !UNLOAD ?auto_7548 ?auto_7547 ?auto_7550 ?auto_7549 )
      ( !DROP ?auto_7548 ?auto_7547 ?auto_7546 ?auto_7549 )
      ( MAKE-1CRATE-VERIFY ?auto_7546 ?auto_7547 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_7561 - SURFACE
      ?auto_7562 - SURFACE
      ?auto_7563 - SURFACE
      ?auto_7564 - SURFACE
      ?auto_7565 - SURFACE
      ?auto_7566 - SURFACE
      ?auto_7567 - SURFACE
    )
    :vars
    (
      ?auto_7572 - HOIST
      ?auto_7571 - PLACE
      ?auto_7569 - PLACE
      ?auto_7570 - HOIST
      ?auto_7568 - SURFACE
      ?auto_7580 - PLACE
      ?auto_7579 - HOIST
      ?auto_7581 - SURFACE
      ?auto_7574 - PLACE
      ?auto_7576 - HOIST
      ?auto_7578 - SURFACE
      ?auto_7582 - SURFACE
      ?auto_7575 - SURFACE
      ?auto_7577 - SURFACE
      ?auto_7573 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7572 ?auto_7571 ) ( IS-CRATE ?auto_7567 ) ( not ( = ?auto_7569 ?auto_7571 ) ) ( HOIST-AT ?auto_7570 ?auto_7569 ) ( SURFACE-AT ?auto_7567 ?auto_7569 ) ( ON ?auto_7567 ?auto_7568 ) ( CLEAR ?auto_7567 ) ( not ( = ?auto_7566 ?auto_7567 ) ) ( not ( = ?auto_7566 ?auto_7568 ) ) ( not ( = ?auto_7567 ?auto_7568 ) ) ( not ( = ?auto_7572 ?auto_7570 ) ) ( IS-CRATE ?auto_7566 ) ( not ( = ?auto_7580 ?auto_7571 ) ) ( HOIST-AT ?auto_7579 ?auto_7580 ) ( AVAILABLE ?auto_7579 ) ( SURFACE-AT ?auto_7566 ?auto_7580 ) ( ON ?auto_7566 ?auto_7581 ) ( CLEAR ?auto_7566 ) ( not ( = ?auto_7565 ?auto_7566 ) ) ( not ( = ?auto_7565 ?auto_7581 ) ) ( not ( = ?auto_7566 ?auto_7581 ) ) ( not ( = ?auto_7572 ?auto_7579 ) ) ( IS-CRATE ?auto_7565 ) ( not ( = ?auto_7574 ?auto_7571 ) ) ( HOIST-AT ?auto_7576 ?auto_7574 ) ( SURFACE-AT ?auto_7565 ?auto_7574 ) ( ON ?auto_7565 ?auto_7578 ) ( CLEAR ?auto_7565 ) ( not ( = ?auto_7564 ?auto_7565 ) ) ( not ( = ?auto_7564 ?auto_7578 ) ) ( not ( = ?auto_7565 ?auto_7578 ) ) ( not ( = ?auto_7572 ?auto_7576 ) ) ( IS-CRATE ?auto_7564 ) ( AVAILABLE ?auto_7576 ) ( SURFACE-AT ?auto_7564 ?auto_7574 ) ( ON ?auto_7564 ?auto_7582 ) ( CLEAR ?auto_7564 ) ( not ( = ?auto_7563 ?auto_7564 ) ) ( not ( = ?auto_7563 ?auto_7582 ) ) ( not ( = ?auto_7564 ?auto_7582 ) ) ( IS-CRATE ?auto_7563 ) ( SURFACE-AT ?auto_7563 ?auto_7569 ) ( ON ?auto_7563 ?auto_7575 ) ( CLEAR ?auto_7563 ) ( not ( = ?auto_7562 ?auto_7563 ) ) ( not ( = ?auto_7562 ?auto_7575 ) ) ( not ( = ?auto_7563 ?auto_7575 ) ) ( SURFACE-AT ?auto_7561 ?auto_7571 ) ( CLEAR ?auto_7561 ) ( IS-CRATE ?auto_7562 ) ( AVAILABLE ?auto_7572 ) ( AVAILABLE ?auto_7570 ) ( SURFACE-AT ?auto_7562 ?auto_7569 ) ( ON ?auto_7562 ?auto_7577 ) ( CLEAR ?auto_7562 ) ( TRUCK-AT ?auto_7573 ?auto_7571 ) ( not ( = ?auto_7561 ?auto_7562 ) ) ( not ( = ?auto_7561 ?auto_7577 ) ) ( not ( = ?auto_7562 ?auto_7577 ) ) ( not ( = ?auto_7561 ?auto_7563 ) ) ( not ( = ?auto_7561 ?auto_7575 ) ) ( not ( = ?auto_7563 ?auto_7577 ) ) ( not ( = ?auto_7575 ?auto_7577 ) ) ( not ( = ?auto_7561 ?auto_7564 ) ) ( not ( = ?auto_7561 ?auto_7582 ) ) ( not ( = ?auto_7562 ?auto_7564 ) ) ( not ( = ?auto_7562 ?auto_7582 ) ) ( not ( = ?auto_7564 ?auto_7575 ) ) ( not ( = ?auto_7564 ?auto_7577 ) ) ( not ( = ?auto_7574 ?auto_7569 ) ) ( not ( = ?auto_7576 ?auto_7570 ) ) ( not ( = ?auto_7582 ?auto_7575 ) ) ( not ( = ?auto_7582 ?auto_7577 ) ) ( not ( = ?auto_7561 ?auto_7565 ) ) ( not ( = ?auto_7561 ?auto_7578 ) ) ( not ( = ?auto_7562 ?auto_7565 ) ) ( not ( = ?auto_7562 ?auto_7578 ) ) ( not ( = ?auto_7563 ?auto_7565 ) ) ( not ( = ?auto_7563 ?auto_7578 ) ) ( not ( = ?auto_7565 ?auto_7582 ) ) ( not ( = ?auto_7565 ?auto_7575 ) ) ( not ( = ?auto_7565 ?auto_7577 ) ) ( not ( = ?auto_7578 ?auto_7582 ) ) ( not ( = ?auto_7578 ?auto_7575 ) ) ( not ( = ?auto_7578 ?auto_7577 ) ) ( not ( = ?auto_7561 ?auto_7566 ) ) ( not ( = ?auto_7561 ?auto_7581 ) ) ( not ( = ?auto_7562 ?auto_7566 ) ) ( not ( = ?auto_7562 ?auto_7581 ) ) ( not ( = ?auto_7563 ?auto_7566 ) ) ( not ( = ?auto_7563 ?auto_7581 ) ) ( not ( = ?auto_7564 ?auto_7566 ) ) ( not ( = ?auto_7564 ?auto_7581 ) ) ( not ( = ?auto_7566 ?auto_7578 ) ) ( not ( = ?auto_7566 ?auto_7582 ) ) ( not ( = ?auto_7566 ?auto_7575 ) ) ( not ( = ?auto_7566 ?auto_7577 ) ) ( not ( = ?auto_7580 ?auto_7574 ) ) ( not ( = ?auto_7580 ?auto_7569 ) ) ( not ( = ?auto_7579 ?auto_7576 ) ) ( not ( = ?auto_7579 ?auto_7570 ) ) ( not ( = ?auto_7581 ?auto_7578 ) ) ( not ( = ?auto_7581 ?auto_7582 ) ) ( not ( = ?auto_7581 ?auto_7575 ) ) ( not ( = ?auto_7581 ?auto_7577 ) ) ( not ( = ?auto_7561 ?auto_7567 ) ) ( not ( = ?auto_7561 ?auto_7568 ) ) ( not ( = ?auto_7562 ?auto_7567 ) ) ( not ( = ?auto_7562 ?auto_7568 ) ) ( not ( = ?auto_7563 ?auto_7567 ) ) ( not ( = ?auto_7563 ?auto_7568 ) ) ( not ( = ?auto_7564 ?auto_7567 ) ) ( not ( = ?auto_7564 ?auto_7568 ) ) ( not ( = ?auto_7565 ?auto_7567 ) ) ( not ( = ?auto_7565 ?auto_7568 ) ) ( not ( = ?auto_7567 ?auto_7581 ) ) ( not ( = ?auto_7567 ?auto_7578 ) ) ( not ( = ?auto_7567 ?auto_7582 ) ) ( not ( = ?auto_7567 ?auto_7575 ) ) ( not ( = ?auto_7567 ?auto_7577 ) ) ( not ( = ?auto_7568 ?auto_7581 ) ) ( not ( = ?auto_7568 ?auto_7578 ) ) ( not ( = ?auto_7568 ?auto_7582 ) ) ( not ( = ?auto_7568 ?auto_7575 ) ) ( not ( = ?auto_7568 ?auto_7577 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_7561 ?auto_7562 ?auto_7563 ?auto_7564 ?auto_7565 ?auto_7566 )
      ( MAKE-1CRATE ?auto_7566 ?auto_7567 )
      ( MAKE-6CRATE-VERIFY ?auto_7561 ?auto_7562 ?auto_7563 ?auto_7564 ?auto_7565 ?auto_7566 ?auto_7567 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7585 - SURFACE
      ?auto_7586 - SURFACE
    )
    :vars
    (
      ?auto_7587 - HOIST
      ?auto_7588 - PLACE
      ?auto_7590 - PLACE
      ?auto_7591 - HOIST
      ?auto_7592 - SURFACE
      ?auto_7589 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7587 ?auto_7588 ) ( SURFACE-AT ?auto_7585 ?auto_7588 ) ( CLEAR ?auto_7585 ) ( IS-CRATE ?auto_7586 ) ( AVAILABLE ?auto_7587 ) ( not ( = ?auto_7590 ?auto_7588 ) ) ( HOIST-AT ?auto_7591 ?auto_7590 ) ( AVAILABLE ?auto_7591 ) ( SURFACE-AT ?auto_7586 ?auto_7590 ) ( ON ?auto_7586 ?auto_7592 ) ( CLEAR ?auto_7586 ) ( TRUCK-AT ?auto_7589 ?auto_7588 ) ( not ( = ?auto_7585 ?auto_7586 ) ) ( not ( = ?auto_7585 ?auto_7592 ) ) ( not ( = ?auto_7586 ?auto_7592 ) ) ( not ( = ?auto_7587 ?auto_7591 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7589 ?auto_7588 ?auto_7590 )
      ( !LIFT ?auto_7591 ?auto_7586 ?auto_7592 ?auto_7590 )
      ( !LOAD ?auto_7591 ?auto_7586 ?auto_7589 ?auto_7590 )
      ( !DRIVE ?auto_7589 ?auto_7590 ?auto_7588 )
      ( !UNLOAD ?auto_7587 ?auto_7586 ?auto_7589 ?auto_7588 )
      ( !DROP ?auto_7587 ?auto_7586 ?auto_7585 ?auto_7588 )
      ( MAKE-1CRATE-VERIFY ?auto_7585 ?auto_7586 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_7601 - SURFACE
      ?auto_7602 - SURFACE
      ?auto_7603 - SURFACE
      ?auto_7604 - SURFACE
      ?auto_7605 - SURFACE
      ?auto_7606 - SURFACE
      ?auto_7608 - SURFACE
      ?auto_7607 - SURFACE
    )
    :vars
    (
      ?auto_7611 - HOIST
      ?auto_7614 - PLACE
      ?auto_7610 - PLACE
      ?auto_7609 - HOIST
      ?auto_7613 - SURFACE
      ?auto_7621 - PLACE
      ?auto_7620 - HOIST
      ?auto_7619 - SURFACE
      ?auto_7625 - PLACE
      ?auto_7626 - HOIST
      ?auto_7618 - SURFACE
      ?auto_7616 - PLACE
      ?auto_7623 - HOIST
      ?auto_7617 - SURFACE
      ?auto_7622 - SURFACE
      ?auto_7624 - SURFACE
      ?auto_7615 - SURFACE
      ?auto_7612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7611 ?auto_7614 ) ( IS-CRATE ?auto_7607 ) ( not ( = ?auto_7610 ?auto_7614 ) ) ( HOIST-AT ?auto_7609 ?auto_7610 ) ( AVAILABLE ?auto_7609 ) ( SURFACE-AT ?auto_7607 ?auto_7610 ) ( ON ?auto_7607 ?auto_7613 ) ( CLEAR ?auto_7607 ) ( not ( = ?auto_7608 ?auto_7607 ) ) ( not ( = ?auto_7608 ?auto_7613 ) ) ( not ( = ?auto_7607 ?auto_7613 ) ) ( not ( = ?auto_7611 ?auto_7609 ) ) ( IS-CRATE ?auto_7608 ) ( not ( = ?auto_7621 ?auto_7614 ) ) ( HOIST-AT ?auto_7620 ?auto_7621 ) ( SURFACE-AT ?auto_7608 ?auto_7621 ) ( ON ?auto_7608 ?auto_7619 ) ( CLEAR ?auto_7608 ) ( not ( = ?auto_7606 ?auto_7608 ) ) ( not ( = ?auto_7606 ?auto_7619 ) ) ( not ( = ?auto_7608 ?auto_7619 ) ) ( not ( = ?auto_7611 ?auto_7620 ) ) ( IS-CRATE ?auto_7606 ) ( not ( = ?auto_7625 ?auto_7614 ) ) ( HOIST-AT ?auto_7626 ?auto_7625 ) ( AVAILABLE ?auto_7626 ) ( SURFACE-AT ?auto_7606 ?auto_7625 ) ( ON ?auto_7606 ?auto_7618 ) ( CLEAR ?auto_7606 ) ( not ( = ?auto_7605 ?auto_7606 ) ) ( not ( = ?auto_7605 ?auto_7618 ) ) ( not ( = ?auto_7606 ?auto_7618 ) ) ( not ( = ?auto_7611 ?auto_7626 ) ) ( IS-CRATE ?auto_7605 ) ( not ( = ?auto_7616 ?auto_7614 ) ) ( HOIST-AT ?auto_7623 ?auto_7616 ) ( SURFACE-AT ?auto_7605 ?auto_7616 ) ( ON ?auto_7605 ?auto_7617 ) ( CLEAR ?auto_7605 ) ( not ( = ?auto_7604 ?auto_7605 ) ) ( not ( = ?auto_7604 ?auto_7617 ) ) ( not ( = ?auto_7605 ?auto_7617 ) ) ( not ( = ?auto_7611 ?auto_7623 ) ) ( IS-CRATE ?auto_7604 ) ( AVAILABLE ?auto_7623 ) ( SURFACE-AT ?auto_7604 ?auto_7616 ) ( ON ?auto_7604 ?auto_7622 ) ( CLEAR ?auto_7604 ) ( not ( = ?auto_7603 ?auto_7604 ) ) ( not ( = ?auto_7603 ?auto_7622 ) ) ( not ( = ?auto_7604 ?auto_7622 ) ) ( IS-CRATE ?auto_7603 ) ( SURFACE-AT ?auto_7603 ?auto_7621 ) ( ON ?auto_7603 ?auto_7624 ) ( CLEAR ?auto_7603 ) ( not ( = ?auto_7602 ?auto_7603 ) ) ( not ( = ?auto_7602 ?auto_7624 ) ) ( not ( = ?auto_7603 ?auto_7624 ) ) ( SURFACE-AT ?auto_7601 ?auto_7614 ) ( CLEAR ?auto_7601 ) ( IS-CRATE ?auto_7602 ) ( AVAILABLE ?auto_7611 ) ( AVAILABLE ?auto_7620 ) ( SURFACE-AT ?auto_7602 ?auto_7621 ) ( ON ?auto_7602 ?auto_7615 ) ( CLEAR ?auto_7602 ) ( TRUCK-AT ?auto_7612 ?auto_7614 ) ( not ( = ?auto_7601 ?auto_7602 ) ) ( not ( = ?auto_7601 ?auto_7615 ) ) ( not ( = ?auto_7602 ?auto_7615 ) ) ( not ( = ?auto_7601 ?auto_7603 ) ) ( not ( = ?auto_7601 ?auto_7624 ) ) ( not ( = ?auto_7603 ?auto_7615 ) ) ( not ( = ?auto_7624 ?auto_7615 ) ) ( not ( = ?auto_7601 ?auto_7604 ) ) ( not ( = ?auto_7601 ?auto_7622 ) ) ( not ( = ?auto_7602 ?auto_7604 ) ) ( not ( = ?auto_7602 ?auto_7622 ) ) ( not ( = ?auto_7604 ?auto_7624 ) ) ( not ( = ?auto_7604 ?auto_7615 ) ) ( not ( = ?auto_7616 ?auto_7621 ) ) ( not ( = ?auto_7623 ?auto_7620 ) ) ( not ( = ?auto_7622 ?auto_7624 ) ) ( not ( = ?auto_7622 ?auto_7615 ) ) ( not ( = ?auto_7601 ?auto_7605 ) ) ( not ( = ?auto_7601 ?auto_7617 ) ) ( not ( = ?auto_7602 ?auto_7605 ) ) ( not ( = ?auto_7602 ?auto_7617 ) ) ( not ( = ?auto_7603 ?auto_7605 ) ) ( not ( = ?auto_7603 ?auto_7617 ) ) ( not ( = ?auto_7605 ?auto_7622 ) ) ( not ( = ?auto_7605 ?auto_7624 ) ) ( not ( = ?auto_7605 ?auto_7615 ) ) ( not ( = ?auto_7617 ?auto_7622 ) ) ( not ( = ?auto_7617 ?auto_7624 ) ) ( not ( = ?auto_7617 ?auto_7615 ) ) ( not ( = ?auto_7601 ?auto_7606 ) ) ( not ( = ?auto_7601 ?auto_7618 ) ) ( not ( = ?auto_7602 ?auto_7606 ) ) ( not ( = ?auto_7602 ?auto_7618 ) ) ( not ( = ?auto_7603 ?auto_7606 ) ) ( not ( = ?auto_7603 ?auto_7618 ) ) ( not ( = ?auto_7604 ?auto_7606 ) ) ( not ( = ?auto_7604 ?auto_7618 ) ) ( not ( = ?auto_7606 ?auto_7617 ) ) ( not ( = ?auto_7606 ?auto_7622 ) ) ( not ( = ?auto_7606 ?auto_7624 ) ) ( not ( = ?auto_7606 ?auto_7615 ) ) ( not ( = ?auto_7625 ?auto_7616 ) ) ( not ( = ?auto_7625 ?auto_7621 ) ) ( not ( = ?auto_7626 ?auto_7623 ) ) ( not ( = ?auto_7626 ?auto_7620 ) ) ( not ( = ?auto_7618 ?auto_7617 ) ) ( not ( = ?auto_7618 ?auto_7622 ) ) ( not ( = ?auto_7618 ?auto_7624 ) ) ( not ( = ?auto_7618 ?auto_7615 ) ) ( not ( = ?auto_7601 ?auto_7608 ) ) ( not ( = ?auto_7601 ?auto_7619 ) ) ( not ( = ?auto_7602 ?auto_7608 ) ) ( not ( = ?auto_7602 ?auto_7619 ) ) ( not ( = ?auto_7603 ?auto_7608 ) ) ( not ( = ?auto_7603 ?auto_7619 ) ) ( not ( = ?auto_7604 ?auto_7608 ) ) ( not ( = ?auto_7604 ?auto_7619 ) ) ( not ( = ?auto_7605 ?auto_7608 ) ) ( not ( = ?auto_7605 ?auto_7619 ) ) ( not ( = ?auto_7608 ?auto_7618 ) ) ( not ( = ?auto_7608 ?auto_7617 ) ) ( not ( = ?auto_7608 ?auto_7622 ) ) ( not ( = ?auto_7608 ?auto_7624 ) ) ( not ( = ?auto_7608 ?auto_7615 ) ) ( not ( = ?auto_7619 ?auto_7618 ) ) ( not ( = ?auto_7619 ?auto_7617 ) ) ( not ( = ?auto_7619 ?auto_7622 ) ) ( not ( = ?auto_7619 ?auto_7624 ) ) ( not ( = ?auto_7619 ?auto_7615 ) ) ( not ( = ?auto_7601 ?auto_7607 ) ) ( not ( = ?auto_7601 ?auto_7613 ) ) ( not ( = ?auto_7602 ?auto_7607 ) ) ( not ( = ?auto_7602 ?auto_7613 ) ) ( not ( = ?auto_7603 ?auto_7607 ) ) ( not ( = ?auto_7603 ?auto_7613 ) ) ( not ( = ?auto_7604 ?auto_7607 ) ) ( not ( = ?auto_7604 ?auto_7613 ) ) ( not ( = ?auto_7605 ?auto_7607 ) ) ( not ( = ?auto_7605 ?auto_7613 ) ) ( not ( = ?auto_7606 ?auto_7607 ) ) ( not ( = ?auto_7606 ?auto_7613 ) ) ( not ( = ?auto_7607 ?auto_7619 ) ) ( not ( = ?auto_7607 ?auto_7618 ) ) ( not ( = ?auto_7607 ?auto_7617 ) ) ( not ( = ?auto_7607 ?auto_7622 ) ) ( not ( = ?auto_7607 ?auto_7624 ) ) ( not ( = ?auto_7607 ?auto_7615 ) ) ( not ( = ?auto_7610 ?auto_7621 ) ) ( not ( = ?auto_7610 ?auto_7625 ) ) ( not ( = ?auto_7610 ?auto_7616 ) ) ( not ( = ?auto_7609 ?auto_7620 ) ) ( not ( = ?auto_7609 ?auto_7626 ) ) ( not ( = ?auto_7609 ?auto_7623 ) ) ( not ( = ?auto_7613 ?auto_7619 ) ) ( not ( = ?auto_7613 ?auto_7618 ) ) ( not ( = ?auto_7613 ?auto_7617 ) ) ( not ( = ?auto_7613 ?auto_7622 ) ) ( not ( = ?auto_7613 ?auto_7624 ) ) ( not ( = ?auto_7613 ?auto_7615 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_7601 ?auto_7602 ?auto_7603 ?auto_7604 ?auto_7605 ?auto_7606 ?auto_7608 )
      ( MAKE-1CRATE ?auto_7608 ?auto_7607 )
      ( MAKE-7CRATE-VERIFY ?auto_7601 ?auto_7602 ?auto_7603 ?auto_7604 ?auto_7605 ?auto_7606 ?auto_7608 ?auto_7607 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7629 - SURFACE
      ?auto_7630 - SURFACE
    )
    :vars
    (
      ?auto_7631 - HOIST
      ?auto_7632 - PLACE
      ?auto_7634 - PLACE
      ?auto_7635 - HOIST
      ?auto_7636 - SURFACE
      ?auto_7633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7631 ?auto_7632 ) ( SURFACE-AT ?auto_7629 ?auto_7632 ) ( CLEAR ?auto_7629 ) ( IS-CRATE ?auto_7630 ) ( AVAILABLE ?auto_7631 ) ( not ( = ?auto_7634 ?auto_7632 ) ) ( HOIST-AT ?auto_7635 ?auto_7634 ) ( AVAILABLE ?auto_7635 ) ( SURFACE-AT ?auto_7630 ?auto_7634 ) ( ON ?auto_7630 ?auto_7636 ) ( CLEAR ?auto_7630 ) ( TRUCK-AT ?auto_7633 ?auto_7632 ) ( not ( = ?auto_7629 ?auto_7630 ) ) ( not ( = ?auto_7629 ?auto_7636 ) ) ( not ( = ?auto_7630 ?auto_7636 ) ) ( not ( = ?auto_7631 ?auto_7635 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7633 ?auto_7632 ?auto_7634 )
      ( !LIFT ?auto_7635 ?auto_7630 ?auto_7636 ?auto_7634 )
      ( !LOAD ?auto_7635 ?auto_7630 ?auto_7633 ?auto_7634 )
      ( !DRIVE ?auto_7633 ?auto_7634 ?auto_7632 )
      ( !UNLOAD ?auto_7631 ?auto_7630 ?auto_7633 ?auto_7632 )
      ( !DROP ?auto_7631 ?auto_7630 ?auto_7629 ?auto_7632 )
      ( MAKE-1CRATE-VERIFY ?auto_7629 ?auto_7630 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_7646 - SURFACE
      ?auto_7647 - SURFACE
      ?auto_7648 - SURFACE
      ?auto_7649 - SURFACE
      ?auto_7650 - SURFACE
      ?auto_7651 - SURFACE
      ?auto_7654 - SURFACE
      ?auto_7653 - SURFACE
      ?auto_7652 - SURFACE
    )
    :vars
    (
      ?auto_7660 - HOIST
      ?auto_7659 - PLACE
      ?auto_7656 - PLACE
      ?auto_7655 - HOIST
      ?auto_7657 - SURFACE
      ?auto_7661 - PLACE
      ?auto_7663 - HOIST
      ?auto_7662 - SURFACE
      ?auto_7672 - PLACE
      ?auto_7673 - HOIST
      ?auto_7674 - SURFACE
      ?auto_7668 - PLACE
      ?auto_7670 - HOIST
      ?auto_7664 - SURFACE
      ?auto_7675 - PLACE
      ?auto_7667 - HOIST
      ?auto_7665 - SURFACE
      ?auto_7671 - SURFACE
      ?auto_7669 - SURFACE
      ?auto_7666 - SURFACE
      ?auto_7658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7660 ?auto_7659 ) ( IS-CRATE ?auto_7652 ) ( not ( = ?auto_7656 ?auto_7659 ) ) ( HOIST-AT ?auto_7655 ?auto_7656 ) ( AVAILABLE ?auto_7655 ) ( SURFACE-AT ?auto_7652 ?auto_7656 ) ( ON ?auto_7652 ?auto_7657 ) ( CLEAR ?auto_7652 ) ( not ( = ?auto_7653 ?auto_7652 ) ) ( not ( = ?auto_7653 ?auto_7657 ) ) ( not ( = ?auto_7652 ?auto_7657 ) ) ( not ( = ?auto_7660 ?auto_7655 ) ) ( IS-CRATE ?auto_7653 ) ( not ( = ?auto_7661 ?auto_7659 ) ) ( HOIST-AT ?auto_7663 ?auto_7661 ) ( AVAILABLE ?auto_7663 ) ( SURFACE-AT ?auto_7653 ?auto_7661 ) ( ON ?auto_7653 ?auto_7662 ) ( CLEAR ?auto_7653 ) ( not ( = ?auto_7654 ?auto_7653 ) ) ( not ( = ?auto_7654 ?auto_7662 ) ) ( not ( = ?auto_7653 ?auto_7662 ) ) ( not ( = ?auto_7660 ?auto_7663 ) ) ( IS-CRATE ?auto_7654 ) ( not ( = ?auto_7672 ?auto_7659 ) ) ( HOIST-AT ?auto_7673 ?auto_7672 ) ( SURFACE-AT ?auto_7654 ?auto_7672 ) ( ON ?auto_7654 ?auto_7674 ) ( CLEAR ?auto_7654 ) ( not ( = ?auto_7651 ?auto_7654 ) ) ( not ( = ?auto_7651 ?auto_7674 ) ) ( not ( = ?auto_7654 ?auto_7674 ) ) ( not ( = ?auto_7660 ?auto_7673 ) ) ( IS-CRATE ?auto_7651 ) ( not ( = ?auto_7668 ?auto_7659 ) ) ( HOIST-AT ?auto_7670 ?auto_7668 ) ( AVAILABLE ?auto_7670 ) ( SURFACE-AT ?auto_7651 ?auto_7668 ) ( ON ?auto_7651 ?auto_7664 ) ( CLEAR ?auto_7651 ) ( not ( = ?auto_7650 ?auto_7651 ) ) ( not ( = ?auto_7650 ?auto_7664 ) ) ( not ( = ?auto_7651 ?auto_7664 ) ) ( not ( = ?auto_7660 ?auto_7670 ) ) ( IS-CRATE ?auto_7650 ) ( not ( = ?auto_7675 ?auto_7659 ) ) ( HOIST-AT ?auto_7667 ?auto_7675 ) ( SURFACE-AT ?auto_7650 ?auto_7675 ) ( ON ?auto_7650 ?auto_7665 ) ( CLEAR ?auto_7650 ) ( not ( = ?auto_7649 ?auto_7650 ) ) ( not ( = ?auto_7649 ?auto_7665 ) ) ( not ( = ?auto_7650 ?auto_7665 ) ) ( not ( = ?auto_7660 ?auto_7667 ) ) ( IS-CRATE ?auto_7649 ) ( AVAILABLE ?auto_7667 ) ( SURFACE-AT ?auto_7649 ?auto_7675 ) ( ON ?auto_7649 ?auto_7671 ) ( CLEAR ?auto_7649 ) ( not ( = ?auto_7648 ?auto_7649 ) ) ( not ( = ?auto_7648 ?auto_7671 ) ) ( not ( = ?auto_7649 ?auto_7671 ) ) ( IS-CRATE ?auto_7648 ) ( SURFACE-AT ?auto_7648 ?auto_7672 ) ( ON ?auto_7648 ?auto_7669 ) ( CLEAR ?auto_7648 ) ( not ( = ?auto_7647 ?auto_7648 ) ) ( not ( = ?auto_7647 ?auto_7669 ) ) ( not ( = ?auto_7648 ?auto_7669 ) ) ( SURFACE-AT ?auto_7646 ?auto_7659 ) ( CLEAR ?auto_7646 ) ( IS-CRATE ?auto_7647 ) ( AVAILABLE ?auto_7660 ) ( AVAILABLE ?auto_7673 ) ( SURFACE-AT ?auto_7647 ?auto_7672 ) ( ON ?auto_7647 ?auto_7666 ) ( CLEAR ?auto_7647 ) ( TRUCK-AT ?auto_7658 ?auto_7659 ) ( not ( = ?auto_7646 ?auto_7647 ) ) ( not ( = ?auto_7646 ?auto_7666 ) ) ( not ( = ?auto_7647 ?auto_7666 ) ) ( not ( = ?auto_7646 ?auto_7648 ) ) ( not ( = ?auto_7646 ?auto_7669 ) ) ( not ( = ?auto_7648 ?auto_7666 ) ) ( not ( = ?auto_7669 ?auto_7666 ) ) ( not ( = ?auto_7646 ?auto_7649 ) ) ( not ( = ?auto_7646 ?auto_7671 ) ) ( not ( = ?auto_7647 ?auto_7649 ) ) ( not ( = ?auto_7647 ?auto_7671 ) ) ( not ( = ?auto_7649 ?auto_7669 ) ) ( not ( = ?auto_7649 ?auto_7666 ) ) ( not ( = ?auto_7675 ?auto_7672 ) ) ( not ( = ?auto_7667 ?auto_7673 ) ) ( not ( = ?auto_7671 ?auto_7669 ) ) ( not ( = ?auto_7671 ?auto_7666 ) ) ( not ( = ?auto_7646 ?auto_7650 ) ) ( not ( = ?auto_7646 ?auto_7665 ) ) ( not ( = ?auto_7647 ?auto_7650 ) ) ( not ( = ?auto_7647 ?auto_7665 ) ) ( not ( = ?auto_7648 ?auto_7650 ) ) ( not ( = ?auto_7648 ?auto_7665 ) ) ( not ( = ?auto_7650 ?auto_7671 ) ) ( not ( = ?auto_7650 ?auto_7669 ) ) ( not ( = ?auto_7650 ?auto_7666 ) ) ( not ( = ?auto_7665 ?auto_7671 ) ) ( not ( = ?auto_7665 ?auto_7669 ) ) ( not ( = ?auto_7665 ?auto_7666 ) ) ( not ( = ?auto_7646 ?auto_7651 ) ) ( not ( = ?auto_7646 ?auto_7664 ) ) ( not ( = ?auto_7647 ?auto_7651 ) ) ( not ( = ?auto_7647 ?auto_7664 ) ) ( not ( = ?auto_7648 ?auto_7651 ) ) ( not ( = ?auto_7648 ?auto_7664 ) ) ( not ( = ?auto_7649 ?auto_7651 ) ) ( not ( = ?auto_7649 ?auto_7664 ) ) ( not ( = ?auto_7651 ?auto_7665 ) ) ( not ( = ?auto_7651 ?auto_7671 ) ) ( not ( = ?auto_7651 ?auto_7669 ) ) ( not ( = ?auto_7651 ?auto_7666 ) ) ( not ( = ?auto_7668 ?auto_7675 ) ) ( not ( = ?auto_7668 ?auto_7672 ) ) ( not ( = ?auto_7670 ?auto_7667 ) ) ( not ( = ?auto_7670 ?auto_7673 ) ) ( not ( = ?auto_7664 ?auto_7665 ) ) ( not ( = ?auto_7664 ?auto_7671 ) ) ( not ( = ?auto_7664 ?auto_7669 ) ) ( not ( = ?auto_7664 ?auto_7666 ) ) ( not ( = ?auto_7646 ?auto_7654 ) ) ( not ( = ?auto_7646 ?auto_7674 ) ) ( not ( = ?auto_7647 ?auto_7654 ) ) ( not ( = ?auto_7647 ?auto_7674 ) ) ( not ( = ?auto_7648 ?auto_7654 ) ) ( not ( = ?auto_7648 ?auto_7674 ) ) ( not ( = ?auto_7649 ?auto_7654 ) ) ( not ( = ?auto_7649 ?auto_7674 ) ) ( not ( = ?auto_7650 ?auto_7654 ) ) ( not ( = ?auto_7650 ?auto_7674 ) ) ( not ( = ?auto_7654 ?auto_7664 ) ) ( not ( = ?auto_7654 ?auto_7665 ) ) ( not ( = ?auto_7654 ?auto_7671 ) ) ( not ( = ?auto_7654 ?auto_7669 ) ) ( not ( = ?auto_7654 ?auto_7666 ) ) ( not ( = ?auto_7674 ?auto_7664 ) ) ( not ( = ?auto_7674 ?auto_7665 ) ) ( not ( = ?auto_7674 ?auto_7671 ) ) ( not ( = ?auto_7674 ?auto_7669 ) ) ( not ( = ?auto_7674 ?auto_7666 ) ) ( not ( = ?auto_7646 ?auto_7653 ) ) ( not ( = ?auto_7646 ?auto_7662 ) ) ( not ( = ?auto_7647 ?auto_7653 ) ) ( not ( = ?auto_7647 ?auto_7662 ) ) ( not ( = ?auto_7648 ?auto_7653 ) ) ( not ( = ?auto_7648 ?auto_7662 ) ) ( not ( = ?auto_7649 ?auto_7653 ) ) ( not ( = ?auto_7649 ?auto_7662 ) ) ( not ( = ?auto_7650 ?auto_7653 ) ) ( not ( = ?auto_7650 ?auto_7662 ) ) ( not ( = ?auto_7651 ?auto_7653 ) ) ( not ( = ?auto_7651 ?auto_7662 ) ) ( not ( = ?auto_7653 ?auto_7674 ) ) ( not ( = ?auto_7653 ?auto_7664 ) ) ( not ( = ?auto_7653 ?auto_7665 ) ) ( not ( = ?auto_7653 ?auto_7671 ) ) ( not ( = ?auto_7653 ?auto_7669 ) ) ( not ( = ?auto_7653 ?auto_7666 ) ) ( not ( = ?auto_7661 ?auto_7672 ) ) ( not ( = ?auto_7661 ?auto_7668 ) ) ( not ( = ?auto_7661 ?auto_7675 ) ) ( not ( = ?auto_7663 ?auto_7673 ) ) ( not ( = ?auto_7663 ?auto_7670 ) ) ( not ( = ?auto_7663 ?auto_7667 ) ) ( not ( = ?auto_7662 ?auto_7674 ) ) ( not ( = ?auto_7662 ?auto_7664 ) ) ( not ( = ?auto_7662 ?auto_7665 ) ) ( not ( = ?auto_7662 ?auto_7671 ) ) ( not ( = ?auto_7662 ?auto_7669 ) ) ( not ( = ?auto_7662 ?auto_7666 ) ) ( not ( = ?auto_7646 ?auto_7652 ) ) ( not ( = ?auto_7646 ?auto_7657 ) ) ( not ( = ?auto_7647 ?auto_7652 ) ) ( not ( = ?auto_7647 ?auto_7657 ) ) ( not ( = ?auto_7648 ?auto_7652 ) ) ( not ( = ?auto_7648 ?auto_7657 ) ) ( not ( = ?auto_7649 ?auto_7652 ) ) ( not ( = ?auto_7649 ?auto_7657 ) ) ( not ( = ?auto_7650 ?auto_7652 ) ) ( not ( = ?auto_7650 ?auto_7657 ) ) ( not ( = ?auto_7651 ?auto_7652 ) ) ( not ( = ?auto_7651 ?auto_7657 ) ) ( not ( = ?auto_7654 ?auto_7652 ) ) ( not ( = ?auto_7654 ?auto_7657 ) ) ( not ( = ?auto_7652 ?auto_7662 ) ) ( not ( = ?auto_7652 ?auto_7674 ) ) ( not ( = ?auto_7652 ?auto_7664 ) ) ( not ( = ?auto_7652 ?auto_7665 ) ) ( not ( = ?auto_7652 ?auto_7671 ) ) ( not ( = ?auto_7652 ?auto_7669 ) ) ( not ( = ?auto_7652 ?auto_7666 ) ) ( not ( = ?auto_7656 ?auto_7661 ) ) ( not ( = ?auto_7656 ?auto_7672 ) ) ( not ( = ?auto_7656 ?auto_7668 ) ) ( not ( = ?auto_7656 ?auto_7675 ) ) ( not ( = ?auto_7655 ?auto_7663 ) ) ( not ( = ?auto_7655 ?auto_7673 ) ) ( not ( = ?auto_7655 ?auto_7670 ) ) ( not ( = ?auto_7655 ?auto_7667 ) ) ( not ( = ?auto_7657 ?auto_7662 ) ) ( not ( = ?auto_7657 ?auto_7674 ) ) ( not ( = ?auto_7657 ?auto_7664 ) ) ( not ( = ?auto_7657 ?auto_7665 ) ) ( not ( = ?auto_7657 ?auto_7671 ) ) ( not ( = ?auto_7657 ?auto_7669 ) ) ( not ( = ?auto_7657 ?auto_7666 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_7646 ?auto_7647 ?auto_7648 ?auto_7649 ?auto_7650 ?auto_7651 ?auto_7654 ?auto_7653 )
      ( MAKE-1CRATE ?auto_7653 ?auto_7652 )
      ( MAKE-8CRATE-VERIFY ?auto_7646 ?auto_7647 ?auto_7648 ?auto_7649 ?auto_7650 ?auto_7651 ?auto_7654 ?auto_7653 ?auto_7652 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7678 - SURFACE
      ?auto_7679 - SURFACE
    )
    :vars
    (
      ?auto_7680 - HOIST
      ?auto_7681 - PLACE
      ?auto_7683 - PLACE
      ?auto_7684 - HOIST
      ?auto_7685 - SURFACE
      ?auto_7682 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7680 ?auto_7681 ) ( SURFACE-AT ?auto_7678 ?auto_7681 ) ( CLEAR ?auto_7678 ) ( IS-CRATE ?auto_7679 ) ( AVAILABLE ?auto_7680 ) ( not ( = ?auto_7683 ?auto_7681 ) ) ( HOIST-AT ?auto_7684 ?auto_7683 ) ( AVAILABLE ?auto_7684 ) ( SURFACE-AT ?auto_7679 ?auto_7683 ) ( ON ?auto_7679 ?auto_7685 ) ( CLEAR ?auto_7679 ) ( TRUCK-AT ?auto_7682 ?auto_7681 ) ( not ( = ?auto_7678 ?auto_7679 ) ) ( not ( = ?auto_7678 ?auto_7685 ) ) ( not ( = ?auto_7679 ?auto_7685 ) ) ( not ( = ?auto_7680 ?auto_7684 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7682 ?auto_7681 ?auto_7683 )
      ( !LIFT ?auto_7684 ?auto_7679 ?auto_7685 ?auto_7683 )
      ( !LOAD ?auto_7684 ?auto_7679 ?auto_7682 ?auto_7683 )
      ( !DRIVE ?auto_7682 ?auto_7683 ?auto_7681 )
      ( !UNLOAD ?auto_7680 ?auto_7679 ?auto_7682 ?auto_7681 )
      ( !DROP ?auto_7680 ?auto_7679 ?auto_7678 ?auto_7681 )
      ( MAKE-1CRATE-VERIFY ?auto_7678 ?auto_7679 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_7696 - SURFACE
      ?auto_7697 - SURFACE
      ?auto_7698 - SURFACE
      ?auto_7699 - SURFACE
      ?auto_7700 - SURFACE
      ?auto_7701 - SURFACE
      ?auto_7704 - SURFACE
      ?auto_7703 - SURFACE
      ?auto_7702 - SURFACE
      ?auto_7705 - SURFACE
    )
    :vars
    (
      ?auto_7706 - HOIST
      ?auto_7708 - PLACE
      ?auto_7707 - PLACE
      ?auto_7711 - HOIST
      ?auto_7709 - SURFACE
      ?auto_7725 - PLACE
      ?auto_7712 - HOIST
      ?auto_7723 - SURFACE
      ?auto_7713 - PLACE
      ?auto_7724 - HOIST
      ?auto_7727 - SURFACE
      ?auto_7717 - SURFACE
      ?auto_7718 - PLACE
      ?auto_7716 - HOIST
      ?auto_7722 - SURFACE
      ?auto_7726 - PLACE
      ?auto_7719 - HOIST
      ?auto_7721 - SURFACE
      ?auto_7715 - SURFACE
      ?auto_7714 - SURFACE
      ?auto_7720 - SURFACE
      ?auto_7710 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7706 ?auto_7708 ) ( IS-CRATE ?auto_7705 ) ( not ( = ?auto_7707 ?auto_7708 ) ) ( HOIST-AT ?auto_7711 ?auto_7707 ) ( SURFACE-AT ?auto_7705 ?auto_7707 ) ( ON ?auto_7705 ?auto_7709 ) ( CLEAR ?auto_7705 ) ( not ( = ?auto_7702 ?auto_7705 ) ) ( not ( = ?auto_7702 ?auto_7709 ) ) ( not ( = ?auto_7705 ?auto_7709 ) ) ( not ( = ?auto_7706 ?auto_7711 ) ) ( IS-CRATE ?auto_7702 ) ( not ( = ?auto_7725 ?auto_7708 ) ) ( HOIST-AT ?auto_7712 ?auto_7725 ) ( AVAILABLE ?auto_7712 ) ( SURFACE-AT ?auto_7702 ?auto_7725 ) ( ON ?auto_7702 ?auto_7723 ) ( CLEAR ?auto_7702 ) ( not ( = ?auto_7703 ?auto_7702 ) ) ( not ( = ?auto_7703 ?auto_7723 ) ) ( not ( = ?auto_7702 ?auto_7723 ) ) ( not ( = ?auto_7706 ?auto_7712 ) ) ( IS-CRATE ?auto_7703 ) ( not ( = ?auto_7713 ?auto_7708 ) ) ( HOIST-AT ?auto_7724 ?auto_7713 ) ( AVAILABLE ?auto_7724 ) ( SURFACE-AT ?auto_7703 ?auto_7713 ) ( ON ?auto_7703 ?auto_7727 ) ( CLEAR ?auto_7703 ) ( not ( = ?auto_7704 ?auto_7703 ) ) ( not ( = ?auto_7704 ?auto_7727 ) ) ( not ( = ?auto_7703 ?auto_7727 ) ) ( not ( = ?auto_7706 ?auto_7724 ) ) ( IS-CRATE ?auto_7704 ) ( SURFACE-AT ?auto_7704 ?auto_7707 ) ( ON ?auto_7704 ?auto_7717 ) ( CLEAR ?auto_7704 ) ( not ( = ?auto_7701 ?auto_7704 ) ) ( not ( = ?auto_7701 ?auto_7717 ) ) ( not ( = ?auto_7704 ?auto_7717 ) ) ( IS-CRATE ?auto_7701 ) ( not ( = ?auto_7718 ?auto_7708 ) ) ( HOIST-AT ?auto_7716 ?auto_7718 ) ( AVAILABLE ?auto_7716 ) ( SURFACE-AT ?auto_7701 ?auto_7718 ) ( ON ?auto_7701 ?auto_7722 ) ( CLEAR ?auto_7701 ) ( not ( = ?auto_7700 ?auto_7701 ) ) ( not ( = ?auto_7700 ?auto_7722 ) ) ( not ( = ?auto_7701 ?auto_7722 ) ) ( not ( = ?auto_7706 ?auto_7716 ) ) ( IS-CRATE ?auto_7700 ) ( not ( = ?auto_7726 ?auto_7708 ) ) ( HOIST-AT ?auto_7719 ?auto_7726 ) ( SURFACE-AT ?auto_7700 ?auto_7726 ) ( ON ?auto_7700 ?auto_7721 ) ( CLEAR ?auto_7700 ) ( not ( = ?auto_7699 ?auto_7700 ) ) ( not ( = ?auto_7699 ?auto_7721 ) ) ( not ( = ?auto_7700 ?auto_7721 ) ) ( not ( = ?auto_7706 ?auto_7719 ) ) ( IS-CRATE ?auto_7699 ) ( AVAILABLE ?auto_7719 ) ( SURFACE-AT ?auto_7699 ?auto_7726 ) ( ON ?auto_7699 ?auto_7715 ) ( CLEAR ?auto_7699 ) ( not ( = ?auto_7698 ?auto_7699 ) ) ( not ( = ?auto_7698 ?auto_7715 ) ) ( not ( = ?auto_7699 ?auto_7715 ) ) ( IS-CRATE ?auto_7698 ) ( SURFACE-AT ?auto_7698 ?auto_7707 ) ( ON ?auto_7698 ?auto_7714 ) ( CLEAR ?auto_7698 ) ( not ( = ?auto_7697 ?auto_7698 ) ) ( not ( = ?auto_7697 ?auto_7714 ) ) ( not ( = ?auto_7698 ?auto_7714 ) ) ( SURFACE-AT ?auto_7696 ?auto_7708 ) ( CLEAR ?auto_7696 ) ( IS-CRATE ?auto_7697 ) ( AVAILABLE ?auto_7706 ) ( AVAILABLE ?auto_7711 ) ( SURFACE-AT ?auto_7697 ?auto_7707 ) ( ON ?auto_7697 ?auto_7720 ) ( CLEAR ?auto_7697 ) ( TRUCK-AT ?auto_7710 ?auto_7708 ) ( not ( = ?auto_7696 ?auto_7697 ) ) ( not ( = ?auto_7696 ?auto_7720 ) ) ( not ( = ?auto_7697 ?auto_7720 ) ) ( not ( = ?auto_7696 ?auto_7698 ) ) ( not ( = ?auto_7696 ?auto_7714 ) ) ( not ( = ?auto_7698 ?auto_7720 ) ) ( not ( = ?auto_7714 ?auto_7720 ) ) ( not ( = ?auto_7696 ?auto_7699 ) ) ( not ( = ?auto_7696 ?auto_7715 ) ) ( not ( = ?auto_7697 ?auto_7699 ) ) ( not ( = ?auto_7697 ?auto_7715 ) ) ( not ( = ?auto_7699 ?auto_7714 ) ) ( not ( = ?auto_7699 ?auto_7720 ) ) ( not ( = ?auto_7726 ?auto_7707 ) ) ( not ( = ?auto_7719 ?auto_7711 ) ) ( not ( = ?auto_7715 ?auto_7714 ) ) ( not ( = ?auto_7715 ?auto_7720 ) ) ( not ( = ?auto_7696 ?auto_7700 ) ) ( not ( = ?auto_7696 ?auto_7721 ) ) ( not ( = ?auto_7697 ?auto_7700 ) ) ( not ( = ?auto_7697 ?auto_7721 ) ) ( not ( = ?auto_7698 ?auto_7700 ) ) ( not ( = ?auto_7698 ?auto_7721 ) ) ( not ( = ?auto_7700 ?auto_7715 ) ) ( not ( = ?auto_7700 ?auto_7714 ) ) ( not ( = ?auto_7700 ?auto_7720 ) ) ( not ( = ?auto_7721 ?auto_7715 ) ) ( not ( = ?auto_7721 ?auto_7714 ) ) ( not ( = ?auto_7721 ?auto_7720 ) ) ( not ( = ?auto_7696 ?auto_7701 ) ) ( not ( = ?auto_7696 ?auto_7722 ) ) ( not ( = ?auto_7697 ?auto_7701 ) ) ( not ( = ?auto_7697 ?auto_7722 ) ) ( not ( = ?auto_7698 ?auto_7701 ) ) ( not ( = ?auto_7698 ?auto_7722 ) ) ( not ( = ?auto_7699 ?auto_7701 ) ) ( not ( = ?auto_7699 ?auto_7722 ) ) ( not ( = ?auto_7701 ?auto_7721 ) ) ( not ( = ?auto_7701 ?auto_7715 ) ) ( not ( = ?auto_7701 ?auto_7714 ) ) ( not ( = ?auto_7701 ?auto_7720 ) ) ( not ( = ?auto_7718 ?auto_7726 ) ) ( not ( = ?auto_7718 ?auto_7707 ) ) ( not ( = ?auto_7716 ?auto_7719 ) ) ( not ( = ?auto_7716 ?auto_7711 ) ) ( not ( = ?auto_7722 ?auto_7721 ) ) ( not ( = ?auto_7722 ?auto_7715 ) ) ( not ( = ?auto_7722 ?auto_7714 ) ) ( not ( = ?auto_7722 ?auto_7720 ) ) ( not ( = ?auto_7696 ?auto_7704 ) ) ( not ( = ?auto_7696 ?auto_7717 ) ) ( not ( = ?auto_7697 ?auto_7704 ) ) ( not ( = ?auto_7697 ?auto_7717 ) ) ( not ( = ?auto_7698 ?auto_7704 ) ) ( not ( = ?auto_7698 ?auto_7717 ) ) ( not ( = ?auto_7699 ?auto_7704 ) ) ( not ( = ?auto_7699 ?auto_7717 ) ) ( not ( = ?auto_7700 ?auto_7704 ) ) ( not ( = ?auto_7700 ?auto_7717 ) ) ( not ( = ?auto_7704 ?auto_7722 ) ) ( not ( = ?auto_7704 ?auto_7721 ) ) ( not ( = ?auto_7704 ?auto_7715 ) ) ( not ( = ?auto_7704 ?auto_7714 ) ) ( not ( = ?auto_7704 ?auto_7720 ) ) ( not ( = ?auto_7717 ?auto_7722 ) ) ( not ( = ?auto_7717 ?auto_7721 ) ) ( not ( = ?auto_7717 ?auto_7715 ) ) ( not ( = ?auto_7717 ?auto_7714 ) ) ( not ( = ?auto_7717 ?auto_7720 ) ) ( not ( = ?auto_7696 ?auto_7703 ) ) ( not ( = ?auto_7696 ?auto_7727 ) ) ( not ( = ?auto_7697 ?auto_7703 ) ) ( not ( = ?auto_7697 ?auto_7727 ) ) ( not ( = ?auto_7698 ?auto_7703 ) ) ( not ( = ?auto_7698 ?auto_7727 ) ) ( not ( = ?auto_7699 ?auto_7703 ) ) ( not ( = ?auto_7699 ?auto_7727 ) ) ( not ( = ?auto_7700 ?auto_7703 ) ) ( not ( = ?auto_7700 ?auto_7727 ) ) ( not ( = ?auto_7701 ?auto_7703 ) ) ( not ( = ?auto_7701 ?auto_7727 ) ) ( not ( = ?auto_7703 ?auto_7717 ) ) ( not ( = ?auto_7703 ?auto_7722 ) ) ( not ( = ?auto_7703 ?auto_7721 ) ) ( not ( = ?auto_7703 ?auto_7715 ) ) ( not ( = ?auto_7703 ?auto_7714 ) ) ( not ( = ?auto_7703 ?auto_7720 ) ) ( not ( = ?auto_7713 ?auto_7707 ) ) ( not ( = ?auto_7713 ?auto_7718 ) ) ( not ( = ?auto_7713 ?auto_7726 ) ) ( not ( = ?auto_7724 ?auto_7711 ) ) ( not ( = ?auto_7724 ?auto_7716 ) ) ( not ( = ?auto_7724 ?auto_7719 ) ) ( not ( = ?auto_7727 ?auto_7717 ) ) ( not ( = ?auto_7727 ?auto_7722 ) ) ( not ( = ?auto_7727 ?auto_7721 ) ) ( not ( = ?auto_7727 ?auto_7715 ) ) ( not ( = ?auto_7727 ?auto_7714 ) ) ( not ( = ?auto_7727 ?auto_7720 ) ) ( not ( = ?auto_7696 ?auto_7702 ) ) ( not ( = ?auto_7696 ?auto_7723 ) ) ( not ( = ?auto_7697 ?auto_7702 ) ) ( not ( = ?auto_7697 ?auto_7723 ) ) ( not ( = ?auto_7698 ?auto_7702 ) ) ( not ( = ?auto_7698 ?auto_7723 ) ) ( not ( = ?auto_7699 ?auto_7702 ) ) ( not ( = ?auto_7699 ?auto_7723 ) ) ( not ( = ?auto_7700 ?auto_7702 ) ) ( not ( = ?auto_7700 ?auto_7723 ) ) ( not ( = ?auto_7701 ?auto_7702 ) ) ( not ( = ?auto_7701 ?auto_7723 ) ) ( not ( = ?auto_7704 ?auto_7702 ) ) ( not ( = ?auto_7704 ?auto_7723 ) ) ( not ( = ?auto_7702 ?auto_7727 ) ) ( not ( = ?auto_7702 ?auto_7717 ) ) ( not ( = ?auto_7702 ?auto_7722 ) ) ( not ( = ?auto_7702 ?auto_7721 ) ) ( not ( = ?auto_7702 ?auto_7715 ) ) ( not ( = ?auto_7702 ?auto_7714 ) ) ( not ( = ?auto_7702 ?auto_7720 ) ) ( not ( = ?auto_7725 ?auto_7713 ) ) ( not ( = ?auto_7725 ?auto_7707 ) ) ( not ( = ?auto_7725 ?auto_7718 ) ) ( not ( = ?auto_7725 ?auto_7726 ) ) ( not ( = ?auto_7712 ?auto_7724 ) ) ( not ( = ?auto_7712 ?auto_7711 ) ) ( not ( = ?auto_7712 ?auto_7716 ) ) ( not ( = ?auto_7712 ?auto_7719 ) ) ( not ( = ?auto_7723 ?auto_7727 ) ) ( not ( = ?auto_7723 ?auto_7717 ) ) ( not ( = ?auto_7723 ?auto_7722 ) ) ( not ( = ?auto_7723 ?auto_7721 ) ) ( not ( = ?auto_7723 ?auto_7715 ) ) ( not ( = ?auto_7723 ?auto_7714 ) ) ( not ( = ?auto_7723 ?auto_7720 ) ) ( not ( = ?auto_7696 ?auto_7705 ) ) ( not ( = ?auto_7696 ?auto_7709 ) ) ( not ( = ?auto_7697 ?auto_7705 ) ) ( not ( = ?auto_7697 ?auto_7709 ) ) ( not ( = ?auto_7698 ?auto_7705 ) ) ( not ( = ?auto_7698 ?auto_7709 ) ) ( not ( = ?auto_7699 ?auto_7705 ) ) ( not ( = ?auto_7699 ?auto_7709 ) ) ( not ( = ?auto_7700 ?auto_7705 ) ) ( not ( = ?auto_7700 ?auto_7709 ) ) ( not ( = ?auto_7701 ?auto_7705 ) ) ( not ( = ?auto_7701 ?auto_7709 ) ) ( not ( = ?auto_7704 ?auto_7705 ) ) ( not ( = ?auto_7704 ?auto_7709 ) ) ( not ( = ?auto_7703 ?auto_7705 ) ) ( not ( = ?auto_7703 ?auto_7709 ) ) ( not ( = ?auto_7705 ?auto_7723 ) ) ( not ( = ?auto_7705 ?auto_7727 ) ) ( not ( = ?auto_7705 ?auto_7717 ) ) ( not ( = ?auto_7705 ?auto_7722 ) ) ( not ( = ?auto_7705 ?auto_7721 ) ) ( not ( = ?auto_7705 ?auto_7715 ) ) ( not ( = ?auto_7705 ?auto_7714 ) ) ( not ( = ?auto_7705 ?auto_7720 ) ) ( not ( = ?auto_7709 ?auto_7723 ) ) ( not ( = ?auto_7709 ?auto_7727 ) ) ( not ( = ?auto_7709 ?auto_7717 ) ) ( not ( = ?auto_7709 ?auto_7722 ) ) ( not ( = ?auto_7709 ?auto_7721 ) ) ( not ( = ?auto_7709 ?auto_7715 ) ) ( not ( = ?auto_7709 ?auto_7714 ) ) ( not ( = ?auto_7709 ?auto_7720 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_7696 ?auto_7697 ?auto_7698 ?auto_7699 ?auto_7700 ?auto_7701 ?auto_7704 ?auto_7703 ?auto_7702 )
      ( MAKE-1CRATE ?auto_7702 ?auto_7705 )
      ( MAKE-9CRATE-VERIFY ?auto_7696 ?auto_7697 ?auto_7698 ?auto_7699 ?auto_7700 ?auto_7701 ?auto_7704 ?auto_7703 ?auto_7702 ?auto_7705 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7730 - SURFACE
      ?auto_7731 - SURFACE
    )
    :vars
    (
      ?auto_7732 - HOIST
      ?auto_7733 - PLACE
      ?auto_7735 - PLACE
      ?auto_7736 - HOIST
      ?auto_7737 - SURFACE
      ?auto_7734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7732 ?auto_7733 ) ( SURFACE-AT ?auto_7730 ?auto_7733 ) ( CLEAR ?auto_7730 ) ( IS-CRATE ?auto_7731 ) ( AVAILABLE ?auto_7732 ) ( not ( = ?auto_7735 ?auto_7733 ) ) ( HOIST-AT ?auto_7736 ?auto_7735 ) ( AVAILABLE ?auto_7736 ) ( SURFACE-AT ?auto_7731 ?auto_7735 ) ( ON ?auto_7731 ?auto_7737 ) ( CLEAR ?auto_7731 ) ( TRUCK-AT ?auto_7734 ?auto_7733 ) ( not ( = ?auto_7730 ?auto_7731 ) ) ( not ( = ?auto_7730 ?auto_7737 ) ) ( not ( = ?auto_7731 ?auto_7737 ) ) ( not ( = ?auto_7732 ?auto_7736 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7734 ?auto_7733 ?auto_7735 )
      ( !LIFT ?auto_7736 ?auto_7731 ?auto_7737 ?auto_7735 )
      ( !LOAD ?auto_7736 ?auto_7731 ?auto_7734 ?auto_7735 )
      ( !DRIVE ?auto_7734 ?auto_7735 ?auto_7733 )
      ( !UNLOAD ?auto_7732 ?auto_7731 ?auto_7734 ?auto_7733 )
      ( !DROP ?auto_7732 ?auto_7731 ?auto_7730 ?auto_7733 )
      ( MAKE-1CRATE-VERIFY ?auto_7730 ?auto_7731 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_7749 - SURFACE
      ?auto_7750 - SURFACE
      ?auto_7751 - SURFACE
      ?auto_7752 - SURFACE
      ?auto_7753 - SURFACE
      ?auto_7754 - SURFACE
      ?auto_7757 - SURFACE
      ?auto_7756 - SURFACE
      ?auto_7755 - SURFACE
      ?auto_7758 - SURFACE
      ?auto_7759 - SURFACE
    )
    :vars
    (
      ?auto_7762 - HOIST
      ?auto_7765 - PLACE
      ?auto_7760 - PLACE
      ?auto_7763 - HOIST
      ?auto_7764 - SURFACE
      ?auto_7784 - PLACE
      ?auto_7780 - HOIST
      ?auto_7782 - SURFACE
      ?auto_7774 - PLACE
      ?auto_7766 - HOIST
      ?auto_7777 - SURFACE
      ?auto_7770 - PLACE
      ?auto_7779 - HOIST
      ?auto_7778 - SURFACE
      ?auto_7776 - SURFACE
      ?auto_7767 - PLACE
      ?auto_7771 - HOIST
      ?auto_7768 - SURFACE
      ?auto_7783 - PLACE
      ?auto_7775 - HOIST
      ?auto_7773 - SURFACE
      ?auto_7781 - SURFACE
      ?auto_7769 - SURFACE
      ?auto_7772 - SURFACE
      ?auto_7761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7762 ?auto_7765 ) ( IS-CRATE ?auto_7759 ) ( not ( = ?auto_7760 ?auto_7765 ) ) ( HOIST-AT ?auto_7763 ?auto_7760 ) ( AVAILABLE ?auto_7763 ) ( SURFACE-AT ?auto_7759 ?auto_7760 ) ( ON ?auto_7759 ?auto_7764 ) ( CLEAR ?auto_7759 ) ( not ( = ?auto_7758 ?auto_7759 ) ) ( not ( = ?auto_7758 ?auto_7764 ) ) ( not ( = ?auto_7759 ?auto_7764 ) ) ( not ( = ?auto_7762 ?auto_7763 ) ) ( IS-CRATE ?auto_7758 ) ( not ( = ?auto_7784 ?auto_7765 ) ) ( HOIST-AT ?auto_7780 ?auto_7784 ) ( SURFACE-AT ?auto_7758 ?auto_7784 ) ( ON ?auto_7758 ?auto_7782 ) ( CLEAR ?auto_7758 ) ( not ( = ?auto_7755 ?auto_7758 ) ) ( not ( = ?auto_7755 ?auto_7782 ) ) ( not ( = ?auto_7758 ?auto_7782 ) ) ( not ( = ?auto_7762 ?auto_7780 ) ) ( IS-CRATE ?auto_7755 ) ( not ( = ?auto_7774 ?auto_7765 ) ) ( HOIST-AT ?auto_7766 ?auto_7774 ) ( AVAILABLE ?auto_7766 ) ( SURFACE-AT ?auto_7755 ?auto_7774 ) ( ON ?auto_7755 ?auto_7777 ) ( CLEAR ?auto_7755 ) ( not ( = ?auto_7756 ?auto_7755 ) ) ( not ( = ?auto_7756 ?auto_7777 ) ) ( not ( = ?auto_7755 ?auto_7777 ) ) ( not ( = ?auto_7762 ?auto_7766 ) ) ( IS-CRATE ?auto_7756 ) ( not ( = ?auto_7770 ?auto_7765 ) ) ( HOIST-AT ?auto_7779 ?auto_7770 ) ( AVAILABLE ?auto_7779 ) ( SURFACE-AT ?auto_7756 ?auto_7770 ) ( ON ?auto_7756 ?auto_7778 ) ( CLEAR ?auto_7756 ) ( not ( = ?auto_7757 ?auto_7756 ) ) ( not ( = ?auto_7757 ?auto_7778 ) ) ( not ( = ?auto_7756 ?auto_7778 ) ) ( not ( = ?auto_7762 ?auto_7779 ) ) ( IS-CRATE ?auto_7757 ) ( SURFACE-AT ?auto_7757 ?auto_7784 ) ( ON ?auto_7757 ?auto_7776 ) ( CLEAR ?auto_7757 ) ( not ( = ?auto_7754 ?auto_7757 ) ) ( not ( = ?auto_7754 ?auto_7776 ) ) ( not ( = ?auto_7757 ?auto_7776 ) ) ( IS-CRATE ?auto_7754 ) ( not ( = ?auto_7767 ?auto_7765 ) ) ( HOIST-AT ?auto_7771 ?auto_7767 ) ( AVAILABLE ?auto_7771 ) ( SURFACE-AT ?auto_7754 ?auto_7767 ) ( ON ?auto_7754 ?auto_7768 ) ( CLEAR ?auto_7754 ) ( not ( = ?auto_7753 ?auto_7754 ) ) ( not ( = ?auto_7753 ?auto_7768 ) ) ( not ( = ?auto_7754 ?auto_7768 ) ) ( not ( = ?auto_7762 ?auto_7771 ) ) ( IS-CRATE ?auto_7753 ) ( not ( = ?auto_7783 ?auto_7765 ) ) ( HOIST-AT ?auto_7775 ?auto_7783 ) ( SURFACE-AT ?auto_7753 ?auto_7783 ) ( ON ?auto_7753 ?auto_7773 ) ( CLEAR ?auto_7753 ) ( not ( = ?auto_7752 ?auto_7753 ) ) ( not ( = ?auto_7752 ?auto_7773 ) ) ( not ( = ?auto_7753 ?auto_7773 ) ) ( not ( = ?auto_7762 ?auto_7775 ) ) ( IS-CRATE ?auto_7752 ) ( AVAILABLE ?auto_7775 ) ( SURFACE-AT ?auto_7752 ?auto_7783 ) ( ON ?auto_7752 ?auto_7781 ) ( CLEAR ?auto_7752 ) ( not ( = ?auto_7751 ?auto_7752 ) ) ( not ( = ?auto_7751 ?auto_7781 ) ) ( not ( = ?auto_7752 ?auto_7781 ) ) ( IS-CRATE ?auto_7751 ) ( SURFACE-AT ?auto_7751 ?auto_7784 ) ( ON ?auto_7751 ?auto_7769 ) ( CLEAR ?auto_7751 ) ( not ( = ?auto_7750 ?auto_7751 ) ) ( not ( = ?auto_7750 ?auto_7769 ) ) ( not ( = ?auto_7751 ?auto_7769 ) ) ( SURFACE-AT ?auto_7749 ?auto_7765 ) ( CLEAR ?auto_7749 ) ( IS-CRATE ?auto_7750 ) ( AVAILABLE ?auto_7762 ) ( AVAILABLE ?auto_7780 ) ( SURFACE-AT ?auto_7750 ?auto_7784 ) ( ON ?auto_7750 ?auto_7772 ) ( CLEAR ?auto_7750 ) ( TRUCK-AT ?auto_7761 ?auto_7765 ) ( not ( = ?auto_7749 ?auto_7750 ) ) ( not ( = ?auto_7749 ?auto_7772 ) ) ( not ( = ?auto_7750 ?auto_7772 ) ) ( not ( = ?auto_7749 ?auto_7751 ) ) ( not ( = ?auto_7749 ?auto_7769 ) ) ( not ( = ?auto_7751 ?auto_7772 ) ) ( not ( = ?auto_7769 ?auto_7772 ) ) ( not ( = ?auto_7749 ?auto_7752 ) ) ( not ( = ?auto_7749 ?auto_7781 ) ) ( not ( = ?auto_7750 ?auto_7752 ) ) ( not ( = ?auto_7750 ?auto_7781 ) ) ( not ( = ?auto_7752 ?auto_7769 ) ) ( not ( = ?auto_7752 ?auto_7772 ) ) ( not ( = ?auto_7783 ?auto_7784 ) ) ( not ( = ?auto_7775 ?auto_7780 ) ) ( not ( = ?auto_7781 ?auto_7769 ) ) ( not ( = ?auto_7781 ?auto_7772 ) ) ( not ( = ?auto_7749 ?auto_7753 ) ) ( not ( = ?auto_7749 ?auto_7773 ) ) ( not ( = ?auto_7750 ?auto_7753 ) ) ( not ( = ?auto_7750 ?auto_7773 ) ) ( not ( = ?auto_7751 ?auto_7753 ) ) ( not ( = ?auto_7751 ?auto_7773 ) ) ( not ( = ?auto_7753 ?auto_7781 ) ) ( not ( = ?auto_7753 ?auto_7769 ) ) ( not ( = ?auto_7753 ?auto_7772 ) ) ( not ( = ?auto_7773 ?auto_7781 ) ) ( not ( = ?auto_7773 ?auto_7769 ) ) ( not ( = ?auto_7773 ?auto_7772 ) ) ( not ( = ?auto_7749 ?auto_7754 ) ) ( not ( = ?auto_7749 ?auto_7768 ) ) ( not ( = ?auto_7750 ?auto_7754 ) ) ( not ( = ?auto_7750 ?auto_7768 ) ) ( not ( = ?auto_7751 ?auto_7754 ) ) ( not ( = ?auto_7751 ?auto_7768 ) ) ( not ( = ?auto_7752 ?auto_7754 ) ) ( not ( = ?auto_7752 ?auto_7768 ) ) ( not ( = ?auto_7754 ?auto_7773 ) ) ( not ( = ?auto_7754 ?auto_7781 ) ) ( not ( = ?auto_7754 ?auto_7769 ) ) ( not ( = ?auto_7754 ?auto_7772 ) ) ( not ( = ?auto_7767 ?auto_7783 ) ) ( not ( = ?auto_7767 ?auto_7784 ) ) ( not ( = ?auto_7771 ?auto_7775 ) ) ( not ( = ?auto_7771 ?auto_7780 ) ) ( not ( = ?auto_7768 ?auto_7773 ) ) ( not ( = ?auto_7768 ?auto_7781 ) ) ( not ( = ?auto_7768 ?auto_7769 ) ) ( not ( = ?auto_7768 ?auto_7772 ) ) ( not ( = ?auto_7749 ?auto_7757 ) ) ( not ( = ?auto_7749 ?auto_7776 ) ) ( not ( = ?auto_7750 ?auto_7757 ) ) ( not ( = ?auto_7750 ?auto_7776 ) ) ( not ( = ?auto_7751 ?auto_7757 ) ) ( not ( = ?auto_7751 ?auto_7776 ) ) ( not ( = ?auto_7752 ?auto_7757 ) ) ( not ( = ?auto_7752 ?auto_7776 ) ) ( not ( = ?auto_7753 ?auto_7757 ) ) ( not ( = ?auto_7753 ?auto_7776 ) ) ( not ( = ?auto_7757 ?auto_7768 ) ) ( not ( = ?auto_7757 ?auto_7773 ) ) ( not ( = ?auto_7757 ?auto_7781 ) ) ( not ( = ?auto_7757 ?auto_7769 ) ) ( not ( = ?auto_7757 ?auto_7772 ) ) ( not ( = ?auto_7776 ?auto_7768 ) ) ( not ( = ?auto_7776 ?auto_7773 ) ) ( not ( = ?auto_7776 ?auto_7781 ) ) ( not ( = ?auto_7776 ?auto_7769 ) ) ( not ( = ?auto_7776 ?auto_7772 ) ) ( not ( = ?auto_7749 ?auto_7756 ) ) ( not ( = ?auto_7749 ?auto_7778 ) ) ( not ( = ?auto_7750 ?auto_7756 ) ) ( not ( = ?auto_7750 ?auto_7778 ) ) ( not ( = ?auto_7751 ?auto_7756 ) ) ( not ( = ?auto_7751 ?auto_7778 ) ) ( not ( = ?auto_7752 ?auto_7756 ) ) ( not ( = ?auto_7752 ?auto_7778 ) ) ( not ( = ?auto_7753 ?auto_7756 ) ) ( not ( = ?auto_7753 ?auto_7778 ) ) ( not ( = ?auto_7754 ?auto_7756 ) ) ( not ( = ?auto_7754 ?auto_7778 ) ) ( not ( = ?auto_7756 ?auto_7776 ) ) ( not ( = ?auto_7756 ?auto_7768 ) ) ( not ( = ?auto_7756 ?auto_7773 ) ) ( not ( = ?auto_7756 ?auto_7781 ) ) ( not ( = ?auto_7756 ?auto_7769 ) ) ( not ( = ?auto_7756 ?auto_7772 ) ) ( not ( = ?auto_7770 ?auto_7784 ) ) ( not ( = ?auto_7770 ?auto_7767 ) ) ( not ( = ?auto_7770 ?auto_7783 ) ) ( not ( = ?auto_7779 ?auto_7780 ) ) ( not ( = ?auto_7779 ?auto_7771 ) ) ( not ( = ?auto_7779 ?auto_7775 ) ) ( not ( = ?auto_7778 ?auto_7776 ) ) ( not ( = ?auto_7778 ?auto_7768 ) ) ( not ( = ?auto_7778 ?auto_7773 ) ) ( not ( = ?auto_7778 ?auto_7781 ) ) ( not ( = ?auto_7778 ?auto_7769 ) ) ( not ( = ?auto_7778 ?auto_7772 ) ) ( not ( = ?auto_7749 ?auto_7755 ) ) ( not ( = ?auto_7749 ?auto_7777 ) ) ( not ( = ?auto_7750 ?auto_7755 ) ) ( not ( = ?auto_7750 ?auto_7777 ) ) ( not ( = ?auto_7751 ?auto_7755 ) ) ( not ( = ?auto_7751 ?auto_7777 ) ) ( not ( = ?auto_7752 ?auto_7755 ) ) ( not ( = ?auto_7752 ?auto_7777 ) ) ( not ( = ?auto_7753 ?auto_7755 ) ) ( not ( = ?auto_7753 ?auto_7777 ) ) ( not ( = ?auto_7754 ?auto_7755 ) ) ( not ( = ?auto_7754 ?auto_7777 ) ) ( not ( = ?auto_7757 ?auto_7755 ) ) ( not ( = ?auto_7757 ?auto_7777 ) ) ( not ( = ?auto_7755 ?auto_7778 ) ) ( not ( = ?auto_7755 ?auto_7776 ) ) ( not ( = ?auto_7755 ?auto_7768 ) ) ( not ( = ?auto_7755 ?auto_7773 ) ) ( not ( = ?auto_7755 ?auto_7781 ) ) ( not ( = ?auto_7755 ?auto_7769 ) ) ( not ( = ?auto_7755 ?auto_7772 ) ) ( not ( = ?auto_7774 ?auto_7770 ) ) ( not ( = ?auto_7774 ?auto_7784 ) ) ( not ( = ?auto_7774 ?auto_7767 ) ) ( not ( = ?auto_7774 ?auto_7783 ) ) ( not ( = ?auto_7766 ?auto_7779 ) ) ( not ( = ?auto_7766 ?auto_7780 ) ) ( not ( = ?auto_7766 ?auto_7771 ) ) ( not ( = ?auto_7766 ?auto_7775 ) ) ( not ( = ?auto_7777 ?auto_7778 ) ) ( not ( = ?auto_7777 ?auto_7776 ) ) ( not ( = ?auto_7777 ?auto_7768 ) ) ( not ( = ?auto_7777 ?auto_7773 ) ) ( not ( = ?auto_7777 ?auto_7781 ) ) ( not ( = ?auto_7777 ?auto_7769 ) ) ( not ( = ?auto_7777 ?auto_7772 ) ) ( not ( = ?auto_7749 ?auto_7758 ) ) ( not ( = ?auto_7749 ?auto_7782 ) ) ( not ( = ?auto_7750 ?auto_7758 ) ) ( not ( = ?auto_7750 ?auto_7782 ) ) ( not ( = ?auto_7751 ?auto_7758 ) ) ( not ( = ?auto_7751 ?auto_7782 ) ) ( not ( = ?auto_7752 ?auto_7758 ) ) ( not ( = ?auto_7752 ?auto_7782 ) ) ( not ( = ?auto_7753 ?auto_7758 ) ) ( not ( = ?auto_7753 ?auto_7782 ) ) ( not ( = ?auto_7754 ?auto_7758 ) ) ( not ( = ?auto_7754 ?auto_7782 ) ) ( not ( = ?auto_7757 ?auto_7758 ) ) ( not ( = ?auto_7757 ?auto_7782 ) ) ( not ( = ?auto_7756 ?auto_7758 ) ) ( not ( = ?auto_7756 ?auto_7782 ) ) ( not ( = ?auto_7758 ?auto_7777 ) ) ( not ( = ?auto_7758 ?auto_7778 ) ) ( not ( = ?auto_7758 ?auto_7776 ) ) ( not ( = ?auto_7758 ?auto_7768 ) ) ( not ( = ?auto_7758 ?auto_7773 ) ) ( not ( = ?auto_7758 ?auto_7781 ) ) ( not ( = ?auto_7758 ?auto_7769 ) ) ( not ( = ?auto_7758 ?auto_7772 ) ) ( not ( = ?auto_7782 ?auto_7777 ) ) ( not ( = ?auto_7782 ?auto_7778 ) ) ( not ( = ?auto_7782 ?auto_7776 ) ) ( not ( = ?auto_7782 ?auto_7768 ) ) ( not ( = ?auto_7782 ?auto_7773 ) ) ( not ( = ?auto_7782 ?auto_7781 ) ) ( not ( = ?auto_7782 ?auto_7769 ) ) ( not ( = ?auto_7782 ?auto_7772 ) ) ( not ( = ?auto_7749 ?auto_7759 ) ) ( not ( = ?auto_7749 ?auto_7764 ) ) ( not ( = ?auto_7750 ?auto_7759 ) ) ( not ( = ?auto_7750 ?auto_7764 ) ) ( not ( = ?auto_7751 ?auto_7759 ) ) ( not ( = ?auto_7751 ?auto_7764 ) ) ( not ( = ?auto_7752 ?auto_7759 ) ) ( not ( = ?auto_7752 ?auto_7764 ) ) ( not ( = ?auto_7753 ?auto_7759 ) ) ( not ( = ?auto_7753 ?auto_7764 ) ) ( not ( = ?auto_7754 ?auto_7759 ) ) ( not ( = ?auto_7754 ?auto_7764 ) ) ( not ( = ?auto_7757 ?auto_7759 ) ) ( not ( = ?auto_7757 ?auto_7764 ) ) ( not ( = ?auto_7756 ?auto_7759 ) ) ( not ( = ?auto_7756 ?auto_7764 ) ) ( not ( = ?auto_7755 ?auto_7759 ) ) ( not ( = ?auto_7755 ?auto_7764 ) ) ( not ( = ?auto_7759 ?auto_7782 ) ) ( not ( = ?auto_7759 ?auto_7777 ) ) ( not ( = ?auto_7759 ?auto_7778 ) ) ( not ( = ?auto_7759 ?auto_7776 ) ) ( not ( = ?auto_7759 ?auto_7768 ) ) ( not ( = ?auto_7759 ?auto_7773 ) ) ( not ( = ?auto_7759 ?auto_7781 ) ) ( not ( = ?auto_7759 ?auto_7769 ) ) ( not ( = ?auto_7759 ?auto_7772 ) ) ( not ( = ?auto_7760 ?auto_7784 ) ) ( not ( = ?auto_7760 ?auto_7774 ) ) ( not ( = ?auto_7760 ?auto_7770 ) ) ( not ( = ?auto_7760 ?auto_7767 ) ) ( not ( = ?auto_7760 ?auto_7783 ) ) ( not ( = ?auto_7763 ?auto_7780 ) ) ( not ( = ?auto_7763 ?auto_7766 ) ) ( not ( = ?auto_7763 ?auto_7779 ) ) ( not ( = ?auto_7763 ?auto_7771 ) ) ( not ( = ?auto_7763 ?auto_7775 ) ) ( not ( = ?auto_7764 ?auto_7782 ) ) ( not ( = ?auto_7764 ?auto_7777 ) ) ( not ( = ?auto_7764 ?auto_7778 ) ) ( not ( = ?auto_7764 ?auto_7776 ) ) ( not ( = ?auto_7764 ?auto_7768 ) ) ( not ( = ?auto_7764 ?auto_7773 ) ) ( not ( = ?auto_7764 ?auto_7781 ) ) ( not ( = ?auto_7764 ?auto_7769 ) ) ( not ( = ?auto_7764 ?auto_7772 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_7749 ?auto_7750 ?auto_7751 ?auto_7752 ?auto_7753 ?auto_7754 ?auto_7757 ?auto_7756 ?auto_7755 ?auto_7758 )
      ( MAKE-1CRATE ?auto_7758 ?auto_7759 )
      ( MAKE-10CRATE-VERIFY ?auto_7749 ?auto_7750 ?auto_7751 ?auto_7752 ?auto_7753 ?auto_7754 ?auto_7757 ?auto_7756 ?auto_7755 ?auto_7758 ?auto_7759 ) )
  )

)

