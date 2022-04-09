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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7439 - SURFACE
      ?auto_7440 - SURFACE
      ?auto_7441 - SURFACE
    )
    :vars
    (
      ?auto_7446 - HOIST
      ?auto_7447 - PLACE
      ?auto_7442 - PLACE
      ?auto_7444 - HOIST
      ?auto_7443 - SURFACE
      ?auto_7448 - SURFACE
      ?auto_7445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7446 ?auto_7447 ) ( IS-CRATE ?auto_7441 ) ( not ( = ?auto_7442 ?auto_7447 ) ) ( HOIST-AT ?auto_7444 ?auto_7442 ) ( SURFACE-AT ?auto_7441 ?auto_7442 ) ( ON ?auto_7441 ?auto_7443 ) ( CLEAR ?auto_7441 ) ( not ( = ?auto_7440 ?auto_7441 ) ) ( not ( = ?auto_7440 ?auto_7443 ) ) ( not ( = ?auto_7441 ?auto_7443 ) ) ( not ( = ?auto_7446 ?auto_7444 ) ) ( SURFACE-AT ?auto_7439 ?auto_7447 ) ( CLEAR ?auto_7439 ) ( IS-CRATE ?auto_7440 ) ( AVAILABLE ?auto_7446 ) ( AVAILABLE ?auto_7444 ) ( SURFACE-AT ?auto_7440 ?auto_7442 ) ( ON ?auto_7440 ?auto_7448 ) ( CLEAR ?auto_7440 ) ( TRUCK-AT ?auto_7445 ?auto_7447 ) ( not ( = ?auto_7439 ?auto_7440 ) ) ( not ( = ?auto_7439 ?auto_7448 ) ) ( not ( = ?auto_7440 ?auto_7448 ) ) ( not ( = ?auto_7439 ?auto_7441 ) ) ( not ( = ?auto_7439 ?auto_7443 ) ) ( not ( = ?auto_7441 ?auto_7448 ) ) ( not ( = ?auto_7443 ?auto_7448 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7439 ?auto_7440 )
      ( MAKE-1CRATE ?auto_7440 ?auto_7441 )
      ( MAKE-2CRATE-VERIFY ?auto_7439 ?auto_7440 ?auto_7441 ) )
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
      ?auto_7468 - HOIST
      ?auto_7467 - PLACE
      ?auto_7471 - PLACE
      ?auto_7469 - HOIST
      ?auto_7472 - SURFACE
      ?auto_7473 - PLACE
      ?auto_7474 - HOIST
      ?auto_7475 - SURFACE
      ?auto_7476 - SURFACE
      ?auto_7470 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7468 ?auto_7467 ) ( IS-CRATE ?auto_7466 ) ( not ( = ?auto_7471 ?auto_7467 ) ) ( HOIST-AT ?auto_7469 ?auto_7471 ) ( AVAILABLE ?auto_7469 ) ( SURFACE-AT ?auto_7466 ?auto_7471 ) ( ON ?auto_7466 ?auto_7472 ) ( CLEAR ?auto_7466 ) ( not ( = ?auto_7465 ?auto_7466 ) ) ( not ( = ?auto_7465 ?auto_7472 ) ) ( not ( = ?auto_7466 ?auto_7472 ) ) ( not ( = ?auto_7468 ?auto_7469 ) ) ( IS-CRATE ?auto_7465 ) ( not ( = ?auto_7473 ?auto_7467 ) ) ( HOIST-AT ?auto_7474 ?auto_7473 ) ( SURFACE-AT ?auto_7465 ?auto_7473 ) ( ON ?auto_7465 ?auto_7475 ) ( CLEAR ?auto_7465 ) ( not ( = ?auto_7464 ?auto_7465 ) ) ( not ( = ?auto_7464 ?auto_7475 ) ) ( not ( = ?auto_7465 ?auto_7475 ) ) ( not ( = ?auto_7468 ?auto_7474 ) ) ( SURFACE-AT ?auto_7463 ?auto_7467 ) ( CLEAR ?auto_7463 ) ( IS-CRATE ?auto_7464 ) ( AVAILABLE ?auto_7468 ) ( AVAILABLE ?auto_7474 ) ( SURFACE-AT ?auto_7464 ?auto_7473 ) ( ON ?auto_7464 ?auto_7476 ) ( CLEAR ?auto_7464 ) ( TRUCK-AT ?auto_7470 ?auto_7467 ) ( not ( = ?auto_7463 ?auto_7464 ) ) ( not ( = ?auto_7463 ?auto_7476 ) ) ( not ( = ?auto_7464 ?auto_7476 ) ) ( not ( = ?auto_7463 ?auto_7465 ) ) ( not ( = ?auto_7463 ?auto_7475 ) ) ( not ( = ?auto_7465 ?auto_7476 ) ) ( not ( = ?auto_7475 ?auto_7476 ) ) ( not ( = ?auto_7463 ?auto_7466 ) ) ( not ( = ?auto_7463 ?auto_7472 ) ) ( not ( = ?auto_7464 ?auto_7466 ) ) ( not ( = ?auto_7464 ?auto_7472 ) ) ( not ( = ?auto_7466 ?auto_7475 ) ) ( not ( = ?auto_7466 ?auto_7476 ) ) ( not ( = ?auto_7471 ?auto_7473 ) ) ( not ( = ?auto_7469 ?auto_7474 ) ) ( not ( = ?auto_7472 ?auto_7475 ) ) ( not ( = ?auto_7472 ?auto_7476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7463 ?auto_7464 ?auto_7465 )
      ( MAKE-1CRATE ?auto_7465 ?auto_7466 )
      ( MAKE-3CRATE-VERIFY ?auto_7463 ?auto_7464 ?auto_7465 ?auto_7466 ) )
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
      ?auto_7500 - HOIST
      ?auto_7497 - PLACE
      ?auto_7499 - PLACE
      ?auto_7498 - HOIST
      ?auto_7502 - SURFACE
      ?auto_7507 - SURFACE
      ?auto_7506 - PLACE
      ?auto_7503 - HOIST
      ?auto_7504 - SURFACE
      ?auto_7505 - SURFACE
      ?auto_7501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7500 ?auto_7497 ) ( IS-CRATE ?auto_7496 ) ( not ( = ?auto_7499 ?auto_7497 ) ) ( HOIST-AT ?auto_7498 ?auto_7499 ) ( SURFACE-AT ?auto_7496 ?auto_7499 ) ( ON ?auto_7496 ?auto_7502 ) ( CLEAR ?auto_7496 ) ( not ( = ?auto_7495 ?auto_7496 ) ) ( not ( = ?auto_7495 ?auto_7502 ) ) ( not ( = ?auto_7496 ?auto_7502 ) ) ( not ( = ?auto_7500 ?auto_7498 ) ) ( IS-CRATE ?auto_7495 ) ( AVAILABLE ?auto_7498 ) ( SURFACE-AT ?auto_7495 ?auto_7499 ) ( ON ?auto_7495 ?auto_7507 ) ( CLEAR ?auto_7495 ) ( not ( = ?auto_7494 ?auto_7495 ) ) ( not ( = ?auto_7494 ?auto_7507 ) ) ( not ( = ?auto_7495 ?auto_7507 ) ) ( IS-CRATE ?auto_7494 ) ( not ( = ?auto_7506 ?auto_7497 ) ) ( HOIST-AT ?auto_7503 ?auto_7506 ) ( SURFACE-AT ?auto_7494 ?auto_7506 ) ( ON ?auto_7494 ?auto_7504 ) ( CLEAR ?auto_7494 ) ( not ( = ?auto_7493 ?auto_7494 ) ) ( not ( = ?auto_7493 ?auto_7504 ) ) ( not ( = ?auto_7494 ?auto_7504 ) ) ( not ( = ?auto_7500 ?auto_7503 ) ) ( SURFACE-AT ?auto_7492 ?auto_7497 ) ( CLEAR ?auto_7492 ) ( IS-CRATE ?auto_7493 ) ( AVAILABLE ?auto_7500 ) ( AVAILABLE ?auto_7503 ) ( SURFACE-AT ?auto_7493 ?auto_7506 ) ( ON ?auto_7493 ?auto_7505 ) ( CLEAR ?auto_7493 ) ( TRUCK-AT ?auto_7501 ?auto_7497 ) ( not ( = ?auto_7492 ?auto_7493 ) ) ( not ( = ?auto_7492 ?auto_7505 ) ) ( not ( = ?auto_7493 ?auto_7505 ) ) ( not ( = ?auto_7492 ?auto_7494 ) ) ( not ( = ?auto_7492 ?auto_7504 ) ) ( not ( = ?auto_7494 ?auto_7505 ) ) ( not ( = ?auto_7504 ?auto_7505 ) ) ( not ( = ?auto_7492 ?auto_7495 ) ) ( not ( = ?auto_7492 ?auto_7507 ) ) ( not ( = ?auto_7493 ?auto_7495 ) ) ( not ( = ?auto_7493 ?auto_7507 ) ) ( not ( = ?auto_7495 ?auto_7504 ) ) ( not ( = ?auto_7495 ?auto_7505 ) ) ( not ( = ?auto_7499 ?auto_7506 ) ) ( not ( = ?auto_7498 ?auto_7503 ) ) ( not ( = ?auto_7507 ?auto_7504 ) ) ( not ( = ?auto_7507 ?auto_7505 ) ) ( not ( = ?auto_7492 ?auto_7496 ) ) ( not ( = ?auto_7492 ?auto_7502 ) ) ( not ( = ?auto_7493 ?auto_7496 ) ) ( not ( = ?auto_7493 ?auto_7502 ) ) ( not ( = ?auto_7494 ?auto_7496 ) ) ( not ( = ?auto_7494 ?auto_7502 ) ) ( not ( = ?auto_7496 ?auto_7507 ) ) ( not ( = ?auto_7496 ?auto_7504 ) ) ( not ( = ?auto_7496 ?auto_7505 ) ) ( not ( = ?auto_7502 ?auto_7507 ) ) ( not ( = ?auto_7502 ?auto_7504 ) ) ( not ( = ?auto_7502 ?auto_7505 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_7492 ?auto_7493 ?auto_7494 ?auto_7495 )
      ( MAKE-1CRATE ?auto_7495 ?auto_7496 )
      ( MAKE-4CRATE-VERIFY ?auto_7492 ?auto_7493 ?auto_7494 ?auto_7495 ?auto_7496 ) )
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
      ?auto_7530 - HOIST
      ?auto_7535 - PLACE
      ?auto_7532 - PLACE
      ?auto_7534 - HOIST
      ?auto_7531 - SURFACE
      ?auto_7540 - PLACE
      ?auto_7541 - HOIST
      ?auto_7536 - SURFACE
      ?auto_7539 - SURFACE
      ?auto_7537 - PLACE
      ?auto_7542 - HOIST
      ?auto_7538 - SURFACE
      ?auto_7543 - SURFACE
      ?auto_7533 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7530 ?auto_7535 ) ( IS-CRATE ?auto_7529 ) ( not ( = ?auto_7532 ?auto_7535 ) ) ( HOIST-AT ?auto_7534 ?auto_7532 ) ( AVAILABLE ?auto_7534 ) ( SURFACE-AT ?auto_7529 ?auto_7532 ) ( ON ?auto_7529 ?auto_7531 ) ( CLEAR ?auto_7529 ) ( not ( = ?auto_7528 ?auto_7529 ) ) ( not ( = ?auto_7528 ?auto_7531 ) ) ( not ( = ?auto_7529 ?auto_7531 ) ) ( not ( = ?auto_7530 ?auto_7534 ) ) ( IS-CRATE ?auto_7528 ) ( not ( = ?auto_7540 ?auto_7535 ) ) ( HOIST-AT ?auto_7541 ?auto_7540 ) ( SURFACE-AT ?auto_7528 ?auto_7540 ) ( ON ?auto_7528 ?auto_7536 ) ( CLEAR ?auto_7528 ) ( not ( = ?auto_7527 ?auto_7528 ) ) ( not ( = ?auto_7527 ?auto_7536 ) ) ( not ( = ?auto_7528 ?auto_7536 ) ) ( not ( = ?auto_7530 ?auto_7541 ) ) ( IS-CRATE ?auto_7527 ) ( AVAILABLE ?auto_7541 ) ( SURFACE-AT ?auto_7527 ?auto_7540 ) ( ON ?auto_7527 ?auto_7539 ) ( CLEAR ?auto_7527 ) ( not ( = ?auto_7526 ?auto_7527 ) ) ( not ( = ?auto_7526 ?auto_7539 ) ) ( not ( = ?auto_7527 ?auto_7539 ) ) ( IS-CRATE ?auto_7526 ) ( not ( = ?auto_7537 ?auto_7535 ) ) ( HOIST-AT ?auto_7542 ?auto_7537 ) ( SURFACE-AT ?auto_7526 ?auto_7537 ) ( ON ?auto_7526 ?auto_7538 ) ( CLEAR ?auto_7526 ) ( not ( = ?auto_7525 ?auto_7526 ) ) ( not ( = ?auto_7525 ?auto_7538 ) ) ( not ( = ?auto_7526 ?auto_7538 ) ) ( not ( = ?auto_7530 ?auto_7542 ) ) ( SURFACE-AT ?auto_7524 ?auto_7535 ) ( CLEAR ?auto_7524 ) ( IS-CRATE ?auto_7525 ) ( AVAILABLE ?auto_7530 ) ( AVAILABLE ?auto_7542 ) ( SURFACE-AT ?auto_7525 ?auto_7537 ) ( ON ?auto_7525 ?auto_7543 ) ( CLEAR ?auto_7525 ) ( TRUCK-AT ?auto_7533 ?auto_7535 ) ( not ( = ?auto_7524 ?auto_7525 ) ) ( not ( = ?auto_7524 ?auto_7543 ) ) ( not ( = ?auto_7525 ?auto_7543 ) ) ( not ( = ?auto_7524 ?auto_7526 ) ) ( not ( = ?auto_7524 ?auto_7538 ) ) ( not ( = ?auto_7526 ?auto_7543 ) ) ( not ( = ?auto_7538 ?auto_7543 ) ) ( not ( = ?auto_7524 ?auto_7527 ) ) ( not ( = ?auto_7524 ?auto_7539 ) ) ( not ( = ?auto_7525 ?auto_7527 ) ) ( not ( = ?auto_7525 ?auto_7539 ) ) ( not ( = ?auto_7527 ?auto_7538 ) ) ( not ( = ?auto_7527 ?auto_7543 ) ) ( not ( = ?auto_7540 ?auto_7537 ) ) ( not ( = ?auto_7541 ?auto_7542 ) ) ( not ( = ?auto_7539 ?auto_7538 ) ) ( not ( = ?auto_7539 ?auto_7543 ) ) ( not ( = ?auto_7524 ?auto_7528 ) ) ( not ( = ?auto_7524 ?auto_7536 ) ) ( not ( = ?auto_7525 ?auto_7528 ) ) ( not ( = ?auto_7525 ?auto_7536 ) ) ( not ( = ?auto_7526 ?auto_7528 ) ) ( not ( = ?auto_7526 ?auto_7536 ) ) ( not ( = ?auto_7528 ?auto_7539 ) ) ( not ( = ?auto_7528 ?auto_7538 ) ) ( not ( = ?auto_7528 ?auto_7543 ) ) ( not ( = ?auto_7536 ?auto_7539 ) ) ( not ( = ?auto_7536 ?auto_7538 ) ) ( not ( = ?auto_7536 ?auto_7543 ) ) ( not ( = ?auto_7524 ?auto_7529 ) ) ( not ( = ?auto_7524 ?auto_7531 ) ) ( not ( = ?auto_7525 ?auto_7529 ) ) ( not ( = ?auto_7525 ?auto_7531 ) ) ( not ( = ?auto_7526 ?auto_7529 ) ) ( not ( = ?auto_7526 ?auto_7531 ) ) ( not ( = ?auto_7527 ?auto_7529 ) ) ( not ( = ?auto_7527 ?auto_7531 ) ) ( not ( = ?auto_7529 ?auto_7536 ) ) ( not ( = ?auto_7529 ?auto_7539 ) ) ( not ( = ?auto_7529 ?auto_7538 ) ) ( not ( = ?auto_7529 ?auto_7543 ) ) ( not ( = ?auto_7532 ?auto_7540 ) ) ( not ( = ?auto_7532 ?auto_7537 ) ) ( not ( = ?auto_7534 ?auto_7541 ) ) ( not ( = ?auto_7534 ?auto_7542 ) ) ( not ( = ?auto_7531 ?auto_7536 ) ) ( not ( = ?auto_7531 ?auto_7539 ) ) ( not ( = ?auto_7531 ?auto_7538 ) ) ( not ( = ?auto_7531 ?auto_7543 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_7524 ?auto_7525 ?auto_7526 ?auto_7527 ?auto_7528 )
      ( MAKE-1CRATE ?auto_7528 ?auto_7529 )
      ( MAKE-5CRATE-VERIFY ?auto_7524 ?auto_7525 ?auto_7526 ?auto_7527 ?auto_7528 ?auto_7529 ) )
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
      ?auto_7571 - HOIST
      ?auto_7572 - PLACE
      ?auto_7573 - PLACE
      ?auto_7568 - HOIST
      ?auto_7569 - SURFACE
      ?auto_7581 - PLACE
      ?auto_7580 - HOIST
      ?auto_7576 - SURFACE
      ?auto_7579 - PLACE
      ?auto_7575 - HOIST
      ?auto_7582 - SURFACE
      ?auto_7578 - SURFACE
      ?auto_7574 - SURFACE
      ?auto_7577 - SURFACE
      ?auto_7570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7571 ?auto_7572 ) ( IS-CRATE ?auto_7567 ) ( not ( = ?auto_7573 ?auto_7572 ) ) ( HOIST-AT ?auto_7568 ?auto_7573 ) ( SURFACE-AT ?auto_7567 ?auto_7573 ) ( ON ?auto_7567 ?auto_7569 ) ( CLEAR ?auto_7567 ) ( not ( = ?auto_7566 ?auto_7567 ) ) ( not ( = ?auto_7566 ?auto_7569 ) ) ( not ( = ?auto_7567 ?auto_7569 ) ) ( not ( = ?auto_7571 ?auto_7568 ) ) ( IS-CRATE ?auto_7566 ) ( not ( = ?auto_7581 ?auto_7572 ) ) ( HOIST-AT ?auto_7580 ?auto_7581 ) ( AVAILABLE ?auto_7580 ) ( SURFACE-AT ?auto_7566 ?auto_7581 ) ( ON ?auto_7566 ?auto_7576 ) ( CLEAR ?auto_7566 ) ( not ( = ?auto_7565 ?auto_7566 ) ) ( not ( = ?auto_7565 ?auto_7576 ) ) ( not ( = ?auto_7566 ?auto_7576 ) ) ( not ( = ?auto_7571 ?auto_7580 ) ) ( IS-CRATE ?auto_7565 ) ( not ( = ?auto_7579 ?auto_7572 ) ) ( HOIST-AT ?auto_7575 ?auto_7579 ) ( SURFACE-AT ?auto_7565 ?auto_7579 ) ( ON ?auto_7565 ?auto_7582 ) ( CLEAR ?auto_7565 ) ( not ( = ?auto_7564 ?auto_7565 ) ) ( not ( = ?auto_7564 ?auto_7582 ) ) ( not ( = ?auto_7565 ?auto_7582 ) ) ( not ( = ?auto_7571 ?auto_7575 ) ) ( IS-CRATE ?auto_7564 ) ( AVAILABLE ?auto_7575 ) ( SURFACE-AT ?auto_7564 ?auto_7579 ) ( ON ?auto_7564 ?auto_7578 ) ( CLEAR ?auto_7564 ) ( not ( = ?auto_7563 ?auto_7564 ) ) ( not ( = ?auto_7563 ?auto_7578 ) ) ( not ( = ?auto_7564 ?auto_7578 ) ) ( IS-CRATE ?auto_7563 ) ( SURFACE-AT ?auto_7563 ?auto_7573 ) ( ON ?auto_7563 ?auto_7574 ) ( CLEAR ?auto_7563 ) ( not ( = ?auto_7562 ?auto_7563 ) ) ( not ( = ?auto_7562 ?auto_7574 ) ) ( not ( = ?auto_7563 ?auto_7574 ) ) ( SURFACE-AT ?auto_7561 ?auto_7572 ) ( CLEAR ?auto_7561 ) ( IS-CRATE ?auto_7562 ) ( AVAILABLE ?auto_7571 ) ( AVAILABLE ?auto_7568 ) ( SURFACE-AT ?auto_7562 ?auto_7573 ) ( ON ?auto_7562 ?auto_7577 ) ( CLEAR ?auto_7562 ) ( TRUCK-AT ?auto_7570 ?auto_7572 ) ( not ( = ?auto_7561 ?auto_7562 ) ) ( not ( = ?auto_7561 ?auto_7577 ) ) ( not ( = ?auto_7562 ?auto_7577 ) ) ( not ( = ?auto_7561 ?auto_7563 ) ) ( not ( = ?auto_7561 ?auto_7574 ) ) ( not ( = ?auto_7563 ?auto_7577 ) ) ( not ( = ?auto_7574 ?auto_7577 ) ) ( not ( = ?auto_7561 ?auto_7564 ) ) ( not ( = ?auto_7561 ?auto_7578 ) ) ( not ( = ?auto_7562 ?auto_7564 ) ) ( not ( = ?auto_7562 ?auto_7578 ) ) ( not ( = ?auto_7564 ?auto_7574 ) ) ( not ( = ?auto_7564 ?auto_7577 ) ) ( not ( = ?auto_7579 ?auto_7573 ) ) ( not ( = ?auto_7575 ?auto_7568 ) ) ( not ( = ?auto_7578 ?auto_7574 ) ) ( not ( = ?auto_7578 ?auto_7577 ) ) ( not ( = ?auto_7561 ?auto_7565 ) ) ( not ( = ?auto_7561 ?auto_7582 ) ) ( not ( = ?auto_7562 ?auto_7565 ) ) ( not ( = ?auto_7562 ?auto_7582 ) ) ( not ( = ?auto_7563 ?auto_7565 ) ) ( not ( = ?auto_7563 ?auto_7582 ) ) ( not ( = ?auto_7565 ?auto_7578 ) ) ( not ( = ?auto_7565 ?auto_7574 ) ) ( not ( = ?auto_7565 ?auto_7577 ) ) ( not ( = ?auto_7582 ?auto_7578 ) ) ( not ( = ?auto_7582 ?auto_7574 ) ) ( not ( = ?auto_7582 ?auto_7577 ) ) ( not ( = ?auto_7561 ?auto_7566 ) ) ( not ( = ?auto_7561 ?auto_7576 ) ) ( not ( = ?auto_7562 ?auto_7566 ) ) ( not ( = ?auto_7562 ?auto_7576 ) ) ( not ( = ?auto_7563 ?auto_7566 ) ) ( not ( = ?auto_7563 ?auto_7576 ) ) ( not ( = ?auto_7564 ?auto_7566 ) ) ( not ( = ?auto_7564 ?auto_7576 ) ) ( not ( = ?auto_7566 ?auto_7582 ) ) ( not ( = ?auto_7566 ?auto_7578 ) ) ( not ( = ?auto_7566 ?auto_7574 ) ) ( not ( = ?auto_7566 ?auto_7577 ) ) ( not ( = ?auto_7581 ?auto_7579 ) ) ( not ( = ?auto_7581 ?auto_7573 ) ) ( not ( = ?auto_7580 ?auto_7575 ) ) ( not ( = ?auto_7580 ?auto_7568 ) ) ( not ( = ?auto_7576 ?auto_7582 ) ) ( not ( = ?auto_7576 ?auto_7578 ) ) ( not ( = ?auto_7576 ?auto_7574 ) ) ( not ( = ?auto_7576 ?auto_7577 ) ) ( not ( = ?auto_7561 ?auto_7567 ) ) ( not ( = ?auto_7561 ?auto_7569 ) ) ( not ( = ?auto_7562 ?auto_7567 ) ) ( not ( = ?auto_7562 ?auto_7569 ) ) ( not ( = ?auto_7563 ?auto_7567 ) ) ( not ( = ?auto_7563 ?auto_7569 ) ) ( not ( = ?auto_7564 ?auto_7567 ) ) ( not ( = ?auto_7564 ?auto_7569 ) ) ( not ( = ?auto_7565 ?auto_7567 ) ) ( not ( = ?auto_7565 ?auto_7569 ) ) ( not ( = ?auto_7567 ?auto_7576 ) ) ( not ( = ?auto_7567 ?auto_7582 ) ) ( not ( = ?auto_7567 ?auto_7578 ) ) ( not ( = ?auto_7567 ?auto_7574 ) ) ( not ( = ?auto_7567 ?auto_7577 ) ) ( not ( = ?auto_7569 ?auto_7576 ) ) ( not ( = ?auto_7569 ?auto_7582 ) ) ( not ( = ?auto_7569 ?auto_7578 ) ) ( not ( = ?auto_7569 ?auto_7574 ) ) ( not ( = ?auto_7569 ?auto_7577 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_7561 ?auto_7562 ?auto_7563 ?auto_7564 ?auto_7565 ?auto_7566 )
      ( MAKE-1CRATE ?auto_7566 ?auto_7567 )
      ( MAKE-6CRATE-VERIFY ?auto_7561 ?auto_7562 ?auto_7563 ?auto_7564 ?auto_7565 ?auto_7566 ?auto_7567 ) )
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
      ?auto_7607 - SURFACE
      ?auto_7608 - SURFACE
    )
    :vars
    (
      ?auto_7614 - HOIST
      ?auto_7613 - PLACE
      ?auto_7609 - PLACE
      ?auto_7610 - HOIST
      ?auto_7611 - SURFACE
      ?auto_7624 - PLACE
      ?auto_7623 - HOIST
      ?auto_7626 - SURFACE
      ?auto_7619 - PLACE
      ?auto_7620 - HOIST
      ?auto_7615 - SURFACE
      ?auto_7625 - PLACE
      ?auto_7616 - HOIST
      ?auto_7621 - SURFACE
      ?auto_7617 - SURFACE
      ?auto_7622 - SURFACE
      ?auto_7618 - SURFACE
      ?auto_7612 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7614 ?auto_7613 ) ( IS-CRATE ?auto_7608 ) ( not ( = ?auto_7609 ?auto_7613 ) ) ( HOIST-AT ?auto_7610 ?auto_7609 ) ( AVAILABLE ?auto_7610 ) ( SURFACE-AT ?auto_7608 ?auto_7609 ) ( ON ?auto_7608 ?auto_7611 ) ( CLEAR ?auto_7608 ) ( not ( = ?auto_7607 ?auto_7608 ) ) ( not ( = ?auto_7607 ?auto_7611 ) ) ( not ( = ?auto_7608 ?auto_7611 ) ) ( not ( = ?auto_7614 ?auto_7610 ) ) ( IS-CRATE ?auto_7607 ) ( not ( = ?auto_7624 ?auto_7613 ) ) ( HOIST-AT ?auto_7623 ?auto_7624 ) ( SURFACE-AT ?auto_7607 ?auto_7624 ) ( ON ?auto_7607 ?auto_7626 ) ( CLEAR ?auto_7607 ) ( not ( = ?auto_7606 ?auto_7607 ) ) ( not ( = ?auto_7606 ?auto_7626 ) ) ( not ( = ?auto_7607 ?auto_7626 ) ) ( not ( = ?auto_7614 ?auto_7623 ) ) ( IS-CRATE ?auto_7606 ) ( not ( = ?auto_7619 ?auto_7613 ) ) ( HOIST-AT ?auto_7620 ?auto_7619 ) ( AVAILABLE ?auto_7620 ) ( SURFACE-AT ?auto_7606 ?auto_7619 ) ( ON ?auto_7606 ?auto_7615 ) ( CLEAR ?auto_7606 ) ( not ( = ?auto_7605 ?auto_7606 ) ) ( not ( = ?auto_7605 ?auto_7615 ) ) ( not ( = ?auto_7606 ?auto_7615 ) ) ( not ( = ?auto_7614 ?auto_7620 ) ) ( IS-CRATE ?auto_7605 ) ( not ( = ?auto_7625 ?auto_7613 ) ) ( HOIST-AT ?auto_7616 ?auto_7625 ) ( SURFACE-AT ?auto_7605 ?auto_7625 ) ( ON ?auto_7605 ?auto_7621 ) ( CLEAR ?auto_7605 ) ( not ( = ?auto_7604 ?auto_7605 ) ) ( not ( = ?auto_7604 ?auto_7621 ) ) ( not ( = ?auto_7605 ?auto_7621 ) ) ( not ( = ?auto_7614 ?auto_7616 ) ) ( IS-CRATE ?auto_7604 ) ( AVAILABLE ?auto_7616 ) ( SURFACE-AT ?auto_7604 ?auto_7625 ) ( ON ?auto_7604 ?auto_7617 ) ( CLEAR ?auto_7604 ) ( not ( = ?auto_7603 ?auto_7604 ) ) ( not ( = ?auto_7603 ?auto_7617 ) ) ( not ( = ?auto_7604 ?auto_7617 ) ) ( IS-CRATE ?auto_7603 ) ( SURFACE-AT ?auto_7603 ?auto_7624 ) ( ON ?auto_7603 ?auto_7622 ) ( CLEAR ?auto_7603 ) ( not ( = ?auto_7602 ?auto_7603 ) ) ( not ( = ?auto_7602 ?auto_7622 ) ) ( not ( = ?auto_7603 ?auto_7622 ) ) ( SURFACE-AT ?auto_7601 ?auto_7613 ) ( CLEAR ?auto_7601 ) ( IS-CRATE ?auto_7602 ) ( AVAILABLE ?auto_7614 ) ( AVAILABLE ?auto_7623 ) ( SURFACE-AT ?auto_7602 ?auto_7624 ) ( ON ?auto_7602 ?auto_7618 ) ( CLEAR ?auto_7602 ) ( TRUCK-AT ?auto_7612 ?auto_7613 ) ( not ( = ?auto_7601 ?auto_7602 ) ) ( not ( = ?auto_7601 ?auto_7618 ) ) ( not ( = ?auto_7602 ?auto_7618 ) ) ( not ( = ?auto_7601 ?auto_7603 ) ) ( not ( = ?auto_7601 ?auto_7622 ) ) ( not ( = ?auto_7603 ?auto_7618 ) ) ( not ( = ?auto_7622 ?auto_7618 ) ) ( not ( = ?auto_7601 ?auto_7604 ) ) ( not ( = ?auto_7601 ?auto_7617 ) ) ( not ( = ?auto_7602 ?auto_7604 ) ) ( not ( = ?auto_7602 ?auto_7617 ) ) ( not ( = ?auto_7604 ?auto_7622 ) ) ( not ( = ?auto_7604 ?auto_7618 ) ) ( not ( = ?auto_7625 ?auto_7624 ) ) ( not ( = ?auto_7616 ?auto_7623 ) ) ( not ( = ?auto_7617 ?auto_7622 ) ) ( not ( = ?auto_7617 ?auto_7618 ) ) ( not ( = ?auto_7601 ?auto_7605 ) ) ( not ( = ?auto_7601 ?auto_7621 ) ) ( not ( = ?auto_7602 ?auto_7605 ) ) ( not ( = ?auto_7602 ?auto_7621 ) ) ( not ( = ?auto_7603 ?auto_7605 ) ) ( not ( = ?auto_7603 ?auto_7621 ) ) ( not ( = ?auto_7605 ?auto_7617 ) ) ( not ( = ?auto_7605 ?auto_7622 ) ) ( not ( = ?auto_7605 ?auto_7618 ) ) ( not ( = ?auto_7621 ?auto_7617 ) ) ( not ( = ?auto_7621 ?auto_7622 ) ) ( not ( = ?auto_7621 ?auto_7618 ) ) ( not ( = ?auto_7601 ?auto_7606 ) ) ( not ( = ?auto_7601 ?auto_7615 ) ) ( not ( = ?auto_7602 ?auto_7606 ) ) ( not ( = ?auto_7602 ?auto_7615 ) ) ( not ( = ?auto_7603 ?auto_7606 ) ) ( not ( = ?auto_7603 ?auto_7615 ) ) ( not ( = ?auto_7604 ?auto_7606 ) ) ( not ( = ?auto_7604 ?auto_7615 ) ) ( not ( = ?auto_7606 ?auto_7621 ) ) ( not ( = ?auto_7606 ?auto_7617 ) ) ( not ( = ?auto_7606 ?auto_7622 ) ) ( not ( = ?auto_7606 ?auto_7618 ) ) ( not ( = ?auto_7619 ?auto_7625 ) ) ( not ( = ?auto_7619 ?auto_7624 ) ) ( not ( = ?auto_7620 ?auto_7616 ) ) ( not ( = ?auto_7620 ?auto_7623 ) ) ( not ( = ?auto_7615 ?auto_7621 ) ) ( not ( = ?auto_7615 ?auto_7617 ) ) ( not ( = ?auto_7615 ?auto_7622 ) ) ( not ( = ?auto_7615 ?auto_7618 ) ) ( not ( = ?auto_7601 ?auto_7607 ) ) ( not ( = ?auto_7601 ?auto_7626 ) ) ( not ( = ?auto_7602 ?auto_7607 ) ) ( not ( = ?auto_7602 ?auto_7626 ) ) ( not ( = ?auto_7603 ?auto_7607 ) ) ( not ( = ?auto_7603 ?auto_7626 ) ) ( not ( = ?auto_7604 ?auto_7607 ) ) ( not ( = ?auto_7604 ?auto_7626 ) ) ( not ( = ?auto_7605 ?auto_7607 ) ) ( not ( = ?auto_7605 ?auto_7626 ) ) ( not ( = ?auto_7607 ?auto_7615 ) ) ( not ( = ?auto_7607 ?auto_7621 ) ) ( not ( = ?auto_7607 ?auto_7617 ) ) ( not ( = ?auto_7607 ?auto_7622 ) ) ( not ( = ?auto_7607 ?auto_7618 ) ) ( not ( = ?auto_7626 ?auto_7615 ) ) ( not ( = ?auto_7626 ?auto_7621 ) ) ( not ( = ?auto_7626 ?auto_7617 ) ) ( not ( = ?auto_7626 ?auto_7622 ) ) ( not ( = ?auto_7626 ?auto_7618 ) ) ( not ( = ?auto_7601 ?auto_7608 ) ) ( not ( = ?auto_7601 ?auto_7611 ) ) ( not ( = ?auto_7602 ?auto_7608 ) ) ( not ( = ?auto_7602 ?auto_7611 ) ) ( not ( = ?auto_7603 ?auto_7608 ) ) ( not ( = ?auto_7603 ?auto_7611 ) ) ( not ( = ?auto_7604 ?auto_7608 ) ) ( not ( = ?auto_7604 ?auto_7611 ) ) ( not ( = ?auto_7605 ?auto_7608 ) ) ( not ( = ?auto_7605 ?auto_7611 ) ) ( not ( = ?auto_7606 ?auto_7608 ) ) ( not ( = ?auto_7606 ?auto_7611 ) ) ( not ( = ?auto_7608 ?auto_7626 ) ) ( not ( = ?auto_7608 ?auto_7615 ) ) ( not ( = ?auto_7608 ?auto_7621 ) ) ( not ( = ?auto_7608 ?auto_7617 ) ) ( not ( = ?auto_7608 ?auto_7622 ) ) ( not ( = ?auto_7608 ?auto_7618 ) ) ( not ( = ?auto_7609 ?auto_7624 ) ) ( not ( = ?auto_7609 ?auto_7619 ) ) ( not ( = ?auto_7609 ?auto_7625 ) ) ( not ( = ?auto_7610 ?auto_7623 ) ) ( not ( = ?auto_7610 ?auto_7620 ) ) ( not ( = ?auto_7610 ?auto_7616 ) ) ( not ( = ?auto_7611 ?auto_7626 ) ) ( not ( = ?auto_7611 ?auto_7615 ) ) ( not ( = ?auto_7611 ?auto_7621 ) ) ( not ( = ?auto_7611 ?auto_7617 ) ) ( not ( = ?auto_7611 ?auto_7622 ) ) ( not ( = ?auto_7611 ?auto_7618 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_7601 ?auto_7602 ?auto_7603 ?auto_7604 ?auto_7605 ?auto_7606 ?auto_7607 )
      ( MAKE-1CRATE ?auto_7607 ?auto_7608 )
      ( MAKE-7CRATE-VERIFY ?auto_7601 ?auto_7602 ?auto_7603 ?auto_7604 ?auto_7605 ?auto_7606 ?auto_7607 ?auto_7608 ) )
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
      ?auto_7652 - SURFACE
      ?auto_7653 - SURFACE
      ?auto_7654 - SURFACE
    )
    :vars
    (
      ?auto_7659 - HOIST
      ?auto_7655 - PLACE
      ?auto_7657 - PLACE
      ?auto_7656 - HOIST
      ?auto_7658 - SURFACE
      ?auto_7672 - PLACE
      ?auto_7675 - HOIST
      ?auto_7667 - SURFACE
      ?auto_7671 - PLACE
      ?auto_7664 - HOIST
      ?auto_7670 - SURFACE
      ?auto_7661 - PLACE
      ?auto_7665 - HOIST
      ?auto_7666 - SURFACE
      ?auto_7669 - PLACE
      ?auto_7662 - HOIST
      ?auto_7668 - SURFACE
      ?auto_7674 - SURFACE
      ?auto_7673 - SURFACE
      ?auto_7663 - SURFACE
      ?auto_7660 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7659 ?auto_7655 ) ( IS-CRATE ?auto_7654 ) ( not ( = ?auto_7657 ?auto_7655 ) ) ( HOIST-AT ?auto_7656 ?auto_7657 ) ( AVAILABLE ?auto_7656 ) ( SURFACE-AT ?auto_7654 ?auto_7657 ) ( ON ?auto_7654 ?auto_7658 ) ( CLEAR ?auto_7654 ) ( not ( = ?auto_7653 ?auto_7654 ) ) ( not ( = ?auto_7653 ?auto_7658 ) ) ( not ( = ?auto_7654 ?auto_7658 ) ) ( not ( = ?auto_7659 ?auto_7656 ) ) ( IS-CRATE ?auto_7653 ) ( not ( = ?auto_7672 ?auto_7655 ) ) ( HOIST-AT ?auto_7675 ?auto_7672 ) ( AVAILABLE ?auto_7675 ) ( SURFACE-AT ?auto_7653 ?auto_7672 ) ( ON ?auto_7653 ?auto_7667 ) ( CLEAR ?auto_7653 ) ( not ( = ?auto_7652 ?auto_7653 ) ) ( not ( = ?auto_7652 ?auto_7667 ) ) ( not ( = ?auto_7653 ?auto_7667 ) ) ( not ( = ?auto_7659 ?auto_7675 ) ) ( IS-CRATE ?auto_7652 ) ( not ( = ?auto_7671 ?auto_7655 ) ) ( HOIST-AT ?auto_7664 ?auto_7671 ) ( SURFACE-AT ?auto_7652 ?auto_7671 ) ( ON ?auto_7652 ?auto_7670 ) ( CLEAR ?auto_7652 ) ( not ( = ?auto_7651 ?auto_7652 ) ) ( not ( = ?auto_7651 ?auto_7670 ) ) ( not ( = ?auto_7652 ?auto_7670 ) ) ( not ( = ?auto_7659 ?auto_7664 ) ) ( IS-CRATE ?auto_7651 ) ( not ( = ?auto_7661 ?auto_7655 ) ) ( HOIST-AT ?auto_7665 ?auto_7661 ) ( AVAILABLE ?auto_7665 ) ( SURFACE-AT ?auto_7651 ?auto_7661 ) ( ON ?auto_7651 ?auto_7666 ) ( CLEAR ?auto_7651 ) ( not ( = ?auto_7650 ?auto_7651 ) ) ( not ( = ?auto_7650 ?auto_7666 ) ) ( not ( = ?auto_7651 ?auto_7666 ) ) ( not ( = ?auto_7659 ?auto_7665 ) ) ( IS-CRATE ?auto_7650 ) ( not ( = ?auto_7669 ?auto_7655 ) ) ( HOIST-AT ?auto_7662 ?auto_7669 ) ( SURFACE-AT ?auto_7650 ?auto_7669 ) ( ON ?auto_7650 ?auto_7668 ) ( CLEAR ?auto_7650 ) ( not ( = ?auto_7649 ?auto_7650 ) ) ( not ( = ?auto_7649 ?auto_7668 ) ) ( not ( = ?auto_7650 ?auto_7668 ) ) ( not ( = ?auto_7659 ?auto_7662 ) ) ( IS-CRATE ?auto_7649 ) ( AVAILABLE ?auto_7662 ) ( SURFACE-AT ?auto_7649 ?auto_7669 ) ( ON ?auto_7649 ?auto_7674 ) ( CLEAR ?auto_7649 ) ( not ( = ?auto_7648 ?auto_7649 ) ) ( not ( = ?auto_7648 ?auto_7674 ) ) ( not ( = ?auto_7649 ?auto_7674 ) ) ( IS-CRATE ?auto_7648 ) ( SURFACE-AT ?auto_7648 ?auto_7671 ) ( ON ?auto_7648 ?auto_7673 ) ( CLEAR ?auto_7648 ) ( not ( = ?auto_7647 ?auto_7648 ) ) ( not ( = ?auto_7647 ?auto_7673 ) ) ( not ( = ?auto_7648 ?auto_7673 ) ) ( SURFACE-AT ?auto_7646 ?auto_7655 ) ( CLEAR ?auto_7646 ) ( IS-CRATE ?auto_7647 ) ( AVAILABLE ?auto_7659 ) ( AVAILABLE ?auto_7664 ) ( SURFACE-AT ?auto_7647 ?auto_7671 ) ( ON ?auto_7647 ?auto_7663 ) ( CLEAR ?auto_7647 ) ( TRUCK-AT ?auto_7660 ?auto_7655 ) ( not ( = ?auto_7646 ?auto_7647 ) ) ( not ( = ?auto_7646 ?auto_7663 ) ) ( not ( = ?auto_7647 ?auto_7663 ) ) ( not ( = ?auto_7646 ?auto_7648 ) ) ( not ( = ?auto_7646 ?auto_7673 ) ) ( not ( = ?auto_7648 ?auto_7663 ) ) ( not ( = ?auto_7673 ?auto_7663 ) ) ( not ( = ?auto_7646 ?auto_7649 ) ) ( not ( = ?auto_7646 ?auto_7674 ) ) ( not ( = ?auto_7647 ?auto_7649 ) ) ( not ( = ?auto_7647 ?auto_7674 ) ) ( not ( = ?auto_7649 ?auto_7673 ) ) ( not ( = ?auto_7649 ?auto_7663 ) ) ( not ( = ?auto_7669 ?auto_7671 ) ) ( not ( = ?auto_7662 ?auto_7664 ) ) ( not ( = ?auto_7674 ?auto_7673 ) ) ( not ( = ?auto_7674 ?auto_7663 ) ) ( not ( = ?auto_7646 ?auto_7650 ) ) ( not ( = ?auto_7646 ?auto_7668 ) ) ( not ( = ?auto_7647 ?auto_7650 ) ) ( not ( = ?auto_7647 ?auto_7668 ) ) ( not ( = ?auto_7648 ?auto_7650 ) ) ( not ( = ?auto_7648 ?auto_7668 ) ) ( not ( = ?auto_7650 ?auto_7674 ) ) ( not ( = ?auto_7650 ?auto_7673 ) ) ( not ( = ?auto_7650 ?auto_7663 ) ) ( not ( = ?auto_7668 ?auto_7674 ) ) ( not ( = ?auto_7668 ?auto_7673 ) ) ( not ( = ?auto_7668 ?auto_7663 ) ) ( not ( = ?auto_7646 ?auto_7651 ) ) ( not ( = ?auto_7646 ?auto_7666 ) ) ( not ( = ?auto_7647 ?auto_7651 ) ) ( not ( = ?auto_7647 ?auto_7666 ) ) ( not ( = ?auto_7648 ?auto_7651 ) ) ( not ( = ?auto_7648 ?auto_7666 ) ) ( not ( = ?auto_7649 ?auto_7651 ) ) ( not ( = ?auto_7649 ?auto_7666 ) ) ( not ( = ?auto_7651 ?auto_7668 ) ) ( not ( = ?auto_7651 ?auto_7674 ) ) ( not ( = ?auto_7651 ?auto_7673 ) ) ( not ( = ?auto_7651 ?auto_7663 ) ) ( not ( = ?auto_7661 ?auto_7669 ) ) ( not ( = ?auto_7661 ?auto_7671 ) ) ( not ( = ?auto_7665 ?auto_7662 ) ) ( not ( = ?auto_7665 ?auto_7664 ) ) ( not ( = ?auto_7666 ?auto_7668 ) ) ( not ( = ?auto_7666 ?auto_7674 ) ) ( not ( = ?auto_7666 ?auto_7673 ) ) ( not ( = ?auto_7666 ?auto_7663 ) ) ( not ( = ?auto_7646 ?auto_7652 ) ) ( not ( = ?auto_7646 ?auto_7670 ) ) ( not ( = ?auto_7647 ?auto_7652 ) ) ( not ( = ?auto_7647 ?auto_7670 ) ) ( not ( = ?auto_7648 ?auto_7652 ) ) ( not ( = ?auto_7648 ?auto_7670 ) ) ( not ( = ?auto_7649 ?auto_7652 ) ) ( not ( = ?auto_7649 ?auto_7670 ) ) ( not ( = ?auto_7650 ?auto_7652 ) ) ( not ( = ?auto_7650 ?auto_7670 ) ) ( not ( = ?auto_7652 ?auto_7666 ) ) ( not ( = ?auto_7652 ?auto_7668 ) ) ( not ( = ?auto_7652 ?auto_7674 ) ) ( not ( = ?auto_7652 ?auto_7673 ) ) ( not ( = ?auto_7652 ?auto_7663 ) ) ( not ( = ?auto_7670 ?auto_7666 ) ) ( not ( = ?auto_7670 ?auto_7668 ) ) ( not ( = ?auto_7670 ?auto_7674 ) ) ( not ( = ?auto_7670 ?auto_7673 ) ) ( not ( = ?auto_7670 ?auto_7663 ) ) ( not ( = ?auto_7646 ?auto_7653 ) ) ( not ( = ?auto_7646 ?auto_7667 ) ) ( not ( = ?auto_7647 ?auto_7653 ) ) ( not ( = ?auto_7647 ?auto_7667 ) ) ( not ( = ?auto_7648 ?auto_7653 ) ) ( not ( = ?auto_7648 ?auto_7667 ) ) ( not ( = ?auto_7649 ?auto_7653 ) ) ( not ( = ?auto_7649 ?auto_7667 ) ) ( not ( = ?auto_7650 ?auto_7653 ) ) ( not ( = ?auto_7650 ?auto_7667 ) ) ( not ( = ?auto_7651 ?auto_7653 ) ) ( not ( = ?auto_7651 ?auto_7667 ) ) ( not ( = ?auto_7653 ?auto_7670 ) ) ( not ( = ?auto_7653 ?auto_7666 ) ) ( not ( = ?auto_7653 ?auto_7668 ) ) ( not ( = ?auto_7653 ?auto_7674 ) ) ( not ( = ?auto_7653 ?auto_7673 ) ) ( not ( = ?auto_7653 ?auto_7663 ) ) ( not ( = ?auto_7672 ?auto_7671 ) ) ( not ( = ?auto_7672 ?auto_7661 ) ) ( not ( = ?auto_7672 ?auto_7669 ) ) ( not ( = ?auto_7675 ?auto_7664 ) ) ( not ( = ?auto_7675 ?auto_7665 ) ) ( not ( = ?auto_7675 ?auto_7662 ) ) ( not ( = ?auto_7667 ?auto_7670 ) ) ( not ( = ?auto_7667 ?auto_7666 ) ) ( not ( = ?auto_7667 ?auto_7668 ) ) ( not ( = ?auto_7667 ?auto_7674 ) ) ( not ( = ?auto_7667 ?auto_7673 ) ) ( not ( = ?auto_7667 ?auto_7663 ) ) ( not ( = ?auto_7646 ?auto_7654 ) ) ( not ( = ?auto_7646 ?auto_7658 ) ) ( not ( = ?auto_7647 ?auto_7654 ) ) ( not ( = ?auto_7647 ?auto_7658 ) ) ( not ( = ?auto_7648 ?auto_7654 ) ) ( not ( = ?auto_7648 ?auto_7658 ) ) ( not ( = ?auto_7649 ?auto_7654 ) ) ( not ( = ?auto_7649 ?auto_7658 ) ) ( not ( = ?auto_7650 ?auto_7654 ) ) ( not ( = ?auto_7650 ?auto_7658 ) ) ( not ( = ?auto_7651 ?auto_7654 ) ) ( not ( = ?auto_7651 ?auto_7658 ) ) ( not ( = ?auto_7652 ?auto_7654 ) ) ( not ( = ?auto_7652 ?auto_7658 ) ) ( not ( = ?auto_7654 ?auto_7667 ) ) ( not ( = ?auto_7654 ?auto_7670 ) ) ( not ( = ?auto_7654 ?auto_7666 ) ) ( not ( = ?auto_7654 ?auto_7668 ) ) ( not ( = ?auto_7654 ?auto_7674 ) ) ( not ( = ?auto_7654 ?auto_7673 ) ) ( not ( = ?auto_7654 ?auto_7663 ) ) ( not ( = ?auto_7657 ?auto_7672 ) ) ( not ( = ?auto_7657 ?auto_7671 ) ) ( not ( = ?auto_7657 ?auto_7661 ) ) ( not ( = ?auto_7657 ?auto_7669 ) ) ( not ( = ?auto_7656 ?auto_7675 ) ) ( not ( = ?auto_7656 ?auto_7664 ) ) ( not ( = ?auto_7656 ?auto_7665 ) ) ( not ( = ?auto_7656 ?auto_7662 ) ) ( not ( = ?auto_7658 ?auto_7667 ) ) ( not ( = ?auto_7658 ?auto_7670 ) ) ( not ( = ?auto_7658 ?auto_7666 ) ) ( not ( = ?auto_7658 ?auto_7668 ) ) ( not ( = ?auto_7658 ?auto_7674 ) ) ( not ( = ?auto_7658 ?auto_7673 ) ) ( not ( = ?auto_7658 ?auto_7663 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_7646 ?auto_7647 ?auto_7648 ?auto_7649 ?auto_7650 ?auto_7651 ?auto_7652 ?auto_7653 )
      ( MAKE-1CRATE ?auto_7653 ?auto_7654 )
      ( MAKE-8CRATE-VERIFY ?auto_7646 ?auto_7647 ?auto_7648 ?auto_7649 ?auto_7650 ?auto_7651 ?auto_7652 ?auto_7653 ?auto_7654 ) )
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
      ?auto_7702 - SURFACE
      ?auto_7703 - SURFACE
      ?auto_7704 - SURFACE
      ?auto_7705 - SURFACE
    )
    :vars
    (
      ?auto_7708 - HOIST
      ?auto_7710 - PLACE
      ?auto_7709 - PLACE
      ?auto_7711 - HOIST
      ?auto_7707 - SURFACE
      ?auto_7714 - PLACE
      ?auto_7715 - HOIST
      ?auto_7724 - SURFACE
      ?auto_7712 - PLACE
      ?auto_7719 - HOIST
      ?auto_7718 - SURFACE
      ?auto_7713 - SURFACE
      ?auto_7720 - PLACE
      ?auto_7726 - HOIST
      ?auto_7717 - SURFACE
      ?auto_7716 - PLACE
      ?auto_7723 - HOIST
      ?auto_7727 - SURFACE
      ?auto_7721 - SURFACE
      ?auto_7725 - SURFACE
      ?auto_7722 - SURFACE
      ?auto_7706 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7708 ?auto_7710 ) ( IS-CRATE ?auto_7705 ) ( not ( = ?auto_7709 ?auto_7710 ) ) ( HOIST-AT ?auto_7711 ?auto_7709 ) ( SURFACE-AT ?auto_7705 ?auto_7709 ) ( ON ?auto_7705 ?auto_7707 ) ( CLEAR ?auto_7705 ) ( not ( = ?auto_7704 ?auto_7705 ) ) ( not ( = ?auto_7704 ?auto_7707 ) ) ( not ( = ?auto_7705 ?auto_7707 ) ) ( not ( = ?auto_7708 ?auto_7711 ) ) ( IS-CRATE ?auto_7704 ) ( not ( = ?auto_7714 ?auto_7710 ) ) ( HOIST-AT ?auto_7715 ?auto_7714 ) ( AVAILABLE ?auto_7715 ) ( SURFACE-AT ?auto_7704 ?auto_7714 ) ( ON ?auto_7704 ?auto_7724 ) ( CLEAR ?auto_7704 ) ( not ( = ?auto_7703 ?auto_7704 ) ) ( not ( = ?auto_7703 ?auto_7724 ) ) ( not ( = ?auto_7704 ?auto_7724 ) ) ( not ( = ?auto_7708 ?auto_7715 ) ) ( IS-CRATE ?auto_7703 ) ( not ( = ?auto_7712 ?auto_7710 ) ) ( HOIST-AT ?auto_7719 ?auto_7712 ) ( AVAILABLE ?auto_7719 ) ( SURFACE-AT ?auto_7703 ?auto_7712 ) ( ON ?auto_7703 ?auto_7718 ) ( CLEAR ?auto_7703 ) ( not ( = ?auto_7702 ?auto_7703 ) ) ( not ( = ?auto_7702 ?auto_7718 ) ) ( not ( = ?auto_7703 ?auto_7718 ) ) ( not ( = ?auto_7708 ?auto_7719 ) ) ( IS-CRATE ?auto_7702 ) ( SURFACE-AT ?auto_7702 ?auto_7709 ) ( ON ?auto_7702 ?auto_7713 ) ( CLEAR ?auto_7702 ) ( not ( = ?auto_7701 ?auto_7702 ) ) ( not ( = ?auto_7701 ?auto_7713 ) ) ( not ( = ?auto_7702 ?auto_7713 ) ) ( IS-CRATE ?auto_7701 ) ( not ( = ?auto_7720 ?auto_7710 ) ) ( HOIST-AT ?auto_7726 ?auto_7720 ) ( AVAILABLE ?auto_7726 ) ( SURFACE-AT ?auto_7701 ?auto_7720 ) ( ON ?auto_7701 ?auto_7717 ) ( CLEAR ?auto_7701 ) ( not ( = ?auto_7700 ?auto_7701 ) ) ( not ( = ?auto_7700 ?auto_7717 ) ) ( not ( = ?auto_7701 ?auto_7717 ) ) ( not ( = ?auto_7708 ?auto_7726 ) ) ( IS-CRATE ?auto_7700 ) ( not ( = ?auto_7716 ?auto_7710 ) ) ( HOIST-AT ?auto_7723 ?auto_7716 ) ( SURFACE-AT ?auto_7700 ?auto_7716 ) ( ON ?auto_7700 ?auto_7727 ) ( CLEAR ?auto_7700 ) ( not ( = ?auto_7699 ?auto_7700 ) ) ( not ( = ?auto_7699 ?auto_7727 ) ) ( not ( = ?auto_7700 ?auto_7727 ) ) ( not ( = ?auto_7708 ?auto_7723 ) ) ( IS-CRATE ?auto_7699 ) ( AVAILABLE ?auto_7723 ) ( SURFACE-AT ?auto_7699 ?auto_7716 ) ( ON ?auto_7699 ?auto_7721 ) ( CLEAR ?auto_7699 ) ( not ( = ?auto_7698 ?auto_7699 ) ) ( not ( = ?auto_7698 ?auto_7721 ) ) ( not ( = ?auto_7699 ?auto_7721 ) ) ( IS-CRATE ?auto_7698 ) ( SURFACE-AT ?auto_7698 ?auto_7709 ) ( ON ?auto_7698 ?auto_7725 ) ( CLEAR ?auto_7698 ) ( not ( = ?auto_7697 ?auto_7698 ) ) ( not ( = ?auto_7697 ?auto_7725 ) ) ( not ( = ?auto_7698 ?auto_7725 ) ) ( SURFACE-AT ?auto_7696 ?auto_7710 ) ( CLEAR ?auto_7696 ) ( IS-CRATE ?auto_7697 ) ( AVAILABLE ?auto_7708 ) ( AVAILABLE ?auto_7711 ) ( SURFACE-AT ?auto_7697 ?auto_7709 ) ( ON ?auto_7697 ?auto_7722 ) ( CLEAR ?auto_7697 ) ( TRUCK-AT ?auto_7706 ?auto_7710 ) ( not ( = ?auto_7696 ?auto_7697 ) ) ( not ( = ?auto_7696 ?auto_7722 ) ) ( not ( = ?auto_7697 ?auto_7722 ) ) ( not ( = ?auto_7696 ?auto_7698 ) ) ( not ( = ?auto_7696 ?auto_7725 ) ) ( not ( = ?auto_7698 ?auto_7722 ) ) ( not ( = ?auto_7725 ?auto_7722 ) ) ( not ( = ?auto_7696 ?auto_7699 ) ) ( not ( = ?auto_7696 ?auto_7721 ) ) ( not ( = ?auto_7697 ?auto_7699 ) ) ( not ( = ?auto_7697 ?auto_7721 ) ) ( not ( = ?auto_7699 ?auto_7725 ) ) ( not ( = ?auto_7699 ?auto_7722 ) ) ( not ( = ?auto_7716 ?auto_7709 ) ) ( not ( = ?auto_7723 ?auto_7711 ) ) ( not ( = ?auto_7721 ?auto_7725 ) ) ( not ( = ?auto_7721 ?auto_7722 ) ) ( not ( = ?auto_7696 ?auto_7700 ) ) ( not ( = ?auto_7696 ?auto_7727 ) ) ( not ( = ?auto_7697 ?auto_7700 ) ) ( not ( = ?auto_7697 ?auto_7727 ) ) ( not ( = ?auto_7698 ?auto_7700 ) ) ( not ( = ?auto_7698 ?auto_7727 ) ) ( not ( = ?auto_7700 ?auto_7721 ) ) ( not ( = ?auto_7700 ?auto_7725 ) ) ( not ( = ?auto_7700 ?auto_7722 ) ) ( not ( = ?auto_7727 ?auto_7721 ) ) ( not ( = ?auto_7727 ?auto_7725 ) ) ( not ( = ?auto_7727 ?auto_7722 ) ) ( not ( = ?auto_7696 ?auto_7701 ) ) ( not ( = ?auto_7696 ?auto_7717 ) ) ( not ( = ?auto_7697 ?auto_7701 ) ) ( not ( = ?auto_7697 ?auto_7717 ) ) ( not ( = ?auto_7698 ?auto_7701 ) ) ( not ( = ?auto_7698 ?auto_7717 ) ) ( not ( = ?auto_7699 ?auto_7701 ) ) ( not ( = ?auto_7699 ?auto_7717 ) ) ( not ( = ?auto_7701 ?auto_7727 ) ) ( not ( = ?auto_7701 ?auto_7721 ) ) ( not ( = ?auto_7701 ?auto_7725 ) ) ( not ( = ?auto_7701 ?auto_7722 ) ) ( not ( = ?auto_7720 ?auto_7716 ) ) ( not ( = ?auto_7720 ?auto_7709 ) ) ( not ( = ?auto_7726 ?auto_7723 ) ) ( not ( = ?auto_7726 ?auto_7711 ) ) ( not ( = ?auto_7717 ?auto_7727 ) ) ( not ( = ?auto_7717 ?auto_7721 ) ) ( not ( = ?auto_7717 ?auto_7725 ) ) ( not ( = ?auto_7717 ?auto_7722 ) ) ( not ( = ?auto_7696 ?auto_7702 ) ) ( not ( = ?auto_7696 ?auto_7713 ) ) ( not ( = ?auto_7697 ?auto_7702 ) ) ( not ( = ?auto_7697 ?auto_7713 ) ) ( not ( = ?auto_7698 ?auto_7702 ) ) ( not ( = ?auto_7698 ?auto_7713 ) ) ( not ( = ?auto_7699 ?auto_7702 ) ) ( not ( = ?auto_7699 ?auto_7713 ) ) ( not ( = ?auto_7700 ?auto_7702 ) ) ( not ( = ?auto_7700 ?auto_7713 ) ) ( not ( = ?auto_7702 ?auto_7717 ) ) ( not ( = ?auto_7702 ?auto_7727 ) ) ( not ( = ?auto_7702 ?auto_7721 ) ) ( not ( = ?auto_7702 ?auto_7725 ) ) ( not ( = ?auto_7702 ?auto_7722 ) ) ( not ( = ?auto_7713 ?auto_7717 ) ) ( not ( = ?auto_7713 ?auto_7727 ) ) ( not ( = ?auto_7713 ?auto_7721 ) ) ( not ( = ?auto_7713 ?auto_7725 ) ) ( not ( = ?auto_7713 ?auto_7722 ) ) ( not ( = ?auto_7696 ?auto_7703 ) ) ( not ( = ?auto_7696 ?auto_7718 ) ) ( not ( = ?auto_7697 ?auto_7703 ) ) ( not ( = ?auto_7697 ?auto_7718 ) ) ( not ( = ?auto_7698 ?auto_7703 ) ) ( not ( = ?auto_7698 ?auto_7718 ) ) ( not ( = ?auto_7699 ?auto_7703 ) ) ( not ( = ?auto_7699 ?auto_7718 ) ) ( not ( = ?auto_7700 ?auto_7703 ) ) ( not ( = ?auto_7700 ?auto_7718 ) ) ( not ( = ?auto_7701 ?auto_7703 ) ) ( not ( = ?auto_7701 ?auto_7718 ) ) ( not ( = ?auto_7703 ?auto_7713 ) ) ( not ( = ?auto_7703 ?auto_7717 ) ) ( not ( = ?auto_7703 ?auto_7727 ) ) ( not ( = ?auto_7703 ?auto_7721 ) ) ( not ( = ?auto_7703 ?auto_7725 ) ) ( not ( = ?auto_7703 ?auto_7722 ) ) ( not ( = ?auto_7712 ?auto_7709 ) ) ( not ( = ?auto_7712 ?auto_7720 ) ) ( not ( = ?auto_7712 ?auto_7716 ) ) ( not ( = ?auto_7719 ?auto_7711 ) ) ( not ( = ?auto_7719 ?auto_7726 ) ) ( not ( = ?auto_7719 ?auto_7723 ) ) ( not ( = ?auto_7718 ?auto_7713 ) ) ( not ( = ?auto_7718 ?auto_7717 ) ) ( not ( = ?auto_7718 ?auto_7727 ) ) ( not ( = ?auto_7718 ?auto_7721 ) ) ( not ( = ?auto_7718 ?auto_7725 ) ) ( not ( = ?auto_7718 ?auto_7722 ) ) ( not ( = ?auto_7696 ?auto_7704 ) ) ( not ( = ?auto_7696 ?auto_7724 ) ) ( not ( = ?auto_7697 ?auto_7704 ) ) ( not ( = ?auto_7697 ?auto_7724 ) ) ( not ( = ?auto_7698 ?auto_7704 ) ) ( not ( = ?auto_7698 ?auto_7724 ) ) ( not ( = ?auto_7699 ?auto_7704 ) ) ( not ( = ?auto_7699 ?auto_7724 ) ) ( not ( = ?auto_7700 ?auto_7704 ) ) ( not ( = ?auto_7700 ?auto_7724 ) ) ( not ( = ?auto_7701 ?auto_7704 ) ) ( not ( = ?auto_7701 ?auto_7724 ) ) ( not ( = ?auto_7702 ?auto_7704 ) ) ( not ( = ?auto_7702 ?auto_7724 ) ) ( not ( = ?auto_7704 ?auto_7718 ) ) ( not ( = ?auto_7704 ?auto_7713 ) ) ( not ( = ?auto_7704 ?auto_7717 ) ) ( not ( = ?auto_7704 ?auto_7727 ) ) ( not ( = ?auto_7704 ?auto_7721 ) ) ( not ( = ?auto_7704 ?auto_7725 ) ) ( not ( = ?auto_7704 ?auto_7722 ) ) ( not ( = ?auto_7714 ?auto_7712 ) ) ( not ( = ?auto_7714 ?auto_7709 ) ) ( not ( = ?auto_7714 ?auto_7720 ) ) ( not ( = ?auto_7714 ?auto_7716 ) ) ( not ( = ?auto_7715 ?auto_7719 ) ) ( not ( = ?auto_7715 ?auto_7711 ) ) ( not ( = ?auto_7715 ?auto_7726 ) ) ( not ( = ?auto_7715 ?auto_7723 ) ) ( not ( = ?auto_7724 ?auto_7718 ) ) ( not ( = ?auto_7724 ?auto_7713 ) ) ( not ( = ?auto_7724 ?auto_7717 ) ) ( not ( = ?auto_7724 ?auto_7727 ) ) ( not ( = ?auto_7724 ?auto_7721 ) ) ( not ( = ?auto_7724 ?auto_7725 ) ) ( not ( = ?auto_7724 ?auto_7722 ) ) ( not ( = ?auto_7696 ?auto_7705 ) ) ( not ( = ?auto_7696 ?auto_7707 ) ) ( not ( = ?auto_7697 ?auto_7705 ) ) ( not ( = ?auto_7697 ?auto_7707 ) ) ( not ( = ?auto_7698 ?auto_7705 ) ) ( not ( = ?auto_7698 ?auto_7707 ) ) ( not ( = ?auto_7699 ?auto_7705 ) ) ( not ( = ?auto_7699 ?auto_7707 ) ) ( not ( = ?auto_7700 ?auto_7705 ) ) ( not ( = ?auto_7700 ?auto_7707 ) ) ( not ( = ?auto_7701 ?auto_7705 ) ) ( not ( = ?auto_7701 ?auto_7707 ) ) ( not ( = ?auto_7702 ?auto_7705 ) ) ( not ( = ?auto_7702 ?auto_7707 ) ) ( not ( = ?auto_7703 ?auto_7705 ) ) ( not ( = ?auto_7703 ?auto_7707 ) ) ( not ( = ?auto_7705 ?auto_7724 ) ) ( not ( = ?auto_7705 ?auto_7718 ) ) ( not ( = ?auto_7705 ?auto_7713 ) ) ( not ( = ?auto_7705 ?auto_7717 ) ) ( not ( = ?auto_7705 ?auto_7727 ) ) ( not ( = ?auto_7705 ?auto_7721 ) ) ( not ( = ?auto_7705 ?auto_7725 ) ) ( not ( = ?auto_7705 ?auto_7722 ) ) ( not ( = ?auto_7707 ?auto_7724 ) ) ( not ( = ?auto_7707 ?auto_7718 ) ) ( not ( = ?auto_7707 ?auto_7713 ) ) ( not ( = ?auto_7707 ?auto_7717 ) ) ( not ( = ?auto_7707 ?auto_7727 ) ) ( not ( = ?auto_7707 ?auto_7721 ) ) ( not ( = ?auto_7707 ?auto_7725 ) ) ( not ( = ?auto_7707 ?auto_7722 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_7696 ?auto_7697 ?auto_7698 ?auto_7699 ?auto_7700 ?auto_7701 ?auto_7702 ?auto_7703 ?auto_7704 )
      ( MAKE-1CRATE ?auto_7704 ?auto_7705 )
      ( MAKE-9CRATE-VERIFY ?auto_7696 ?auto_7697 ?auto_7698 ?auto_7699 ?auto_7700 ?auto_7701 ?auto_7702 ?auto_7703 ?auto_7704 ?auto_7705 ) )
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
      ?auto_7755 - SURFACE
      ?auto_7756 - SURFACE
      ?auto_7757 - SURFACE
      ?auto_7758 - SURFACE
      ?auto_7759 - SURFACE
    )
    :vars
    (
      ?auto_7761 - HOIST
      ?auto_7760 - PLACE
      ?auto_7763 - PLACE
      ?auto_7765 - HOIST
      ?auto_7764 - SURFACE
      ?auto_7778 - PLACE
      ?auto_7784 - HOIST
      ?auto_7770 - SURFACE
      ?auto_7769 - PLACE
      ?auto_7783 - HOIST
      ?auto_7767 - SURFACE
      ?auto_7771 - PLACE
      ?auto_7775 - HOIST
      ?auto_7776 - SURFACE
      ?auto_7772 - SURFACE
      ?auto_7781 - PLACE
      ?auto_7780 - HOIST
      ?auto_7768 - SURFACE
      ?auto_7774 - PLACE
      ?auto_7779 - HOIST
      ?auto_7782 - SURFACE
      ?auto_7777 - SURFACE
      ?auto_7766 - SURFACE
      ?auto_7773 - SURFACE
      ?auto_7762 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7761 ?auto_7760 ) ( IS-CRATE ?auto_7759 ) ( not ( = ?auto_7763 ?auto_7760 ) ) ( HOIST-AT ?auto_7765 ?auto_7763 ) ( AVAILABLE ?auto_7765 ) ( SURFACE-AT ?auto_7759 ?auto_7763 ) ( ON ?auto_7759 ?auto_7764 ) ( CLEAR ?auto_7759 ) ( not ( = ?auto_7758 ?auto_7759 ) ) ( not ( = ?auto_7758 ?auto_7764 ) ) ( not ( = ?auto_7759 ?auto_7764 ) ) ( not ( = ?auto_7761 ?auto_7765 ) ) ( IS-CRATE ?auto_7758 ) ( not ( = ?auto_7778 ?auto_7760 ) ) ( HOIST-AT ?auto_7784 ?auto_7778 ) ( SURFACE-AT ?auto_7758 ?auto_7778 ) ( ON ?auto_7758 ?auto_7770 ) ( CLEAR ?auto_7758 ) ( not ( = ?auto_7757 ?auto_7758 ) ) ( not ( = ?auto_7757 ?auto_7770 ) ) ( not ( = ?auto_7758 ?auto_7770 ) ) ( not ( = ?auto_7761 ?auto_7784 ) ) ( IS-CRATE ?auto_7757 ) ( not ( = ?auto_7769 ?auto_7760 ) ) ( HOIST-AT ?auto_7783 ?auto_7769 ) ( AVAILABLE ?auto_7783 ) ( SURFACE-AT ?auto_7757 ?auto_7769 ) ( ON ?auto_7757 ?auto_7767 ) ( CLEAR ?auto_7757 ) ( not ( = ?auto_7756 ?auto_7757 ) ) ( not ( = ?auto_7756 ?auto_7767 ) ) ( not ( = ?auto_7757 ?auto_7767 ) ) ( not ( = ?auto_7761 ?auto_7783 ) ) ( IS-CRATE ?auto_7756 ) ( not ( = ?auto_7771 ?auto_7760 ) ) ( HOIST-AT ?auto_7775 ?auto_7771 ) ( AVAILABLE ?auto_7775 ) ( SURFACE-AT ?auto_7756 ?auto_7771 ) ( ON ?auto_7756 ?auto_7776 ) ( CLEAR ?auto_7756 ) ( not ( = ?auto_7755 ?auto_7756 ) ) ( not ( = ?auto_7755 ?auto_7776 ) ) ( not ( = ?auto_7756 ?auto_7776 ) ) ( not ( = ?auto_7761 ?auto_7775 ) ) ( IS-CRATE ?auto_7755 ) ( SURFACE-AT ?auto_7755 ?auto_7778 ) ( ON ?auto_7755 ?auto_7772 ) ( CLEAR ?auto_7755 ) ( not ( = ?auto_7754 ?auto_7755 ) ) ( not ( = ?auto_7754 ?auto_7772 ) ) ( not ( = ?auto_7755 ?auto_7772 ) ) ( IS-CRATE ?auto_7754 ) ( not ( = ?auto_7781 ?auto_7760 ) ) ( HOIST-AT ?auto_7780 ?auto_7781 ) ( AVAILABLE ?auto_7780 ) ( SURFACE-AT ?auto_7754 ?auto_7781 ) ( ON ?auto_7754 ?auto_7768 ) ( CLEAR ?auto_7754 ) ( not ( = ?auto_7753 ?auto_7754 ) ) ( not ( = ?auto_7753 ?auto_7768 ) ) ( not ( = ?auto_7754 ?auto_7768 ) ) ( not ( = ?auto_7761 ?auto_7780 ) ) ( IS-CRATE ?auto_7753 ) ( not ( = ?auto_7774 ?auto_7760 ) ) ( HOIST-AT ?auto_7779 ?auto_7774 ) ( SURFACE-AT ?auto_7753 ?auto_7774 ) ( ON ?auto_7753 ?auto_7782 ) ( CLEAR ?auto_7753 ) ( not ( = ?auto_7752 ?auto_7753 ) ) ( not ( = ?auto_7752 ?auto_7782 ) ) ( not ( = ?auto_7753 ?auto_7782 ) ) ( not ( = ?auto_7761 ?auto_7779 ) ) ( IS-CRATE ?auto_7752 ) ( AVAILABLE ?auto_7779 ) ( SURFACE-AT ?auto_7752 ?auto_7774 ) ( ON ?auto_7752 ?auto_7777 ) ( CLEAR ?auto_7752 ) ( not ( = ?auto_7751 ?auto_7752 ) ) ( not ( = ?auto_7751 ?auto_7777 ) ) ( not ( = ?auto_7752 ?auto_7777 ) ) ( IS-CRATE ?auto_7751 ) ( SURFACE-AT ?auto_7751 ?auto_7778 ) ( ON ?auto_7751 ?auto_7766 ) ( CLEAR ?auto_7751 ) ( not ( = ?auto_7750 ?auto_7751 ) ) ( not ( = ?auto_7750 ?auto_7766 ) ) ( not ( = ?auto_7751 ?auto_7766 ) ) ( SURFACE-AT ?auto_7749 ?auto_7760 ) ( CLEAR ?auto_7749 ) ( IS-CRATE ?auto_7750 ) ( AVAILABLE ?auto_7761 ) ( AVAILABLE ?auto_7784 ) ( SURFACE-AT ?auto_7750 ?auto_7778 ) ( ON ?auto_7750 ?auto_7773 ) ( CLEAR ?auto_7750 ) ( TRUCK-AT ?auto_7762 ?auto_7760 ) ( not ( = ?auto_7749 ?auto_7750 ) ) ( not ( = ?auto_7749 ?auto_7773 ) ) ( not ( = ?auto_7750 ?auto_7773 ) ) ( not ( = ?auto_7749 ?auto_7751 ) ) ( not ( = ?auto_7749 ?auto_7766 ) ) ( not ( = ?auto_7751 ?auto_7773 ) ) ( not ( = ?auto_7766 ?auto_7773 ) ) ( not ( = ?auto_7749 ?auto_7752 ) ) ( not ( = ?auto_7749 ?auto_7777 ) ) ( not ( = ?auto_7750 ?auto_7752 ) ) ( not ( = ?auto_7750 ?auto_7777 ) ) ( not ( = ?auto_7752 ?auto_7766 ) ) ( not ( = ?auto_7752 ?auto_7773 ) ) ( not ( = ?auto_7774 ?auto_7778 ) ) ( not ( = ?auto_7779 ?auto_7784 ) ) ( not ( = ?auto_7777 ?auto_7766 ) ) ( not ( = ?auto_7777 ?auto_7773 ) ) ( not ( = ?auto_7749 ?auto_7753 ) ) ( not ( = ?auto_7749 ?auto_7782 ) ) ( not ( = ?auto_7750 ?auto_7753 ) ) ( not ( = ?auto_7750 ?auto_7782 ) ) ( not ( = ?auto_7751 ?auto_7753 ) ) ( not ( = ?auto_7751 ?auto_7782 ) ) ( not ( = ?auto_7753 ?auto_7777 ) ) ( not ( = ?auto_7753 ?auto_7766 ) ) ( not ( = ?auto_7753 ?auto_7773 ) ) ( not ( = ?auto_7782 ?auto_7777 ) ) ( not ( = ?auto_7782 ?auto_7766 ) ) ( not ( = ?auto_7782 ?auto_7773 ) ) ( not ( = ?auto_7749 ?auto_7754 ) ) ( not ( = ?auto_7749 ?auto_7768 ) ) ( not ( = ?auto_7750 ?auto_7754 ) ) ( not ( = ?auto_7750 ?auto_7768 ) ) ( not ( = ?auto_7751 ?auto_7754 ) ) ( not ( = ?auto_7751 ?auto_7768 ) ) ( not ( = ?auto_7752 ?auto_7754 ) ) ( not ( = ?auto_7752 ?auto_7768 ) ) ( not ( = ?auto_7754 ?auto_7782 ) ) ( not ( = ?auto_7754 ?auto_7777 ) ) ( not ( = ?auto_7754 ?auto_7766 ) ) ( not ( = ?auto_7754 ?auto_7773 ) ) ( not ( = ?auto_7781 ?auto_7774 ) ) ( not ( = ?auto_7781 ?auto_7778 ) ) ( not ( = ?auto_7780 ?auto_7779 ) ) ( not ( = ?auto_7780 ?auto_7784 ) ) ( not ( = ?auto_7768 ?auto_7782 ) ) ( not ( = ?auto_7768 ?auto_7777 ) ) ( not ( = ?auto_7768 ?auto_7766 ) ) ( not ( = ?auto_7768 ?auto_7773 ) ) ( not ( = ?auto_7749 ?auto_7755 ) ) ( not ( = ?auto_7749 ?auto_7772 ) ) ( not ( = ?auto_7750 ?auto_7755 ) ) ( not ( = ?auto_7750 ?auto_7772 ) ) ( not ( = ?auto_7751 ?auto_7755 ) ) ( not ( = ?auto_7751 ?auto_7772 ) ) ( not ( = ?auto_7752 ?auto_7755 ) ) ( not ( = ?auto_7752 ?auto_7772 ) ) ( not ( = ?auto_7753 ?auto_7755 ) ) ( not ( = ?auto_7753 ?auto_7772 ) ) ( not ( = ?auto_7755 ?auto_7768 ) ) ( not ( = ?auto_7755 ?auto_7782 ) ) ( not ( = ?auto_7755 ?auto_7777 ) ) ( not ( = ?auto_7755 ?auto_7766 ) ) ( not ( = ?auto_7755 ?auto_7773 ) ) ( not ( = ?auto_7772 ?auto_7768 ) ) ( not ( = ?auto_7772 ?auto_7782 ) ) ( not ( = ?auto_7772 ?auto_7777 ) ) ( not ( = ?auto_7772 ?auto_7766 ) ) ( not ( = ?auto_7772 ?auto_7773 ) ) ( not ( = ?auto_7749 ?auto_7756 ) ) ( not ( = ?auto_7749 ?auto_7776 ) ) ( not ( = ?auto_7750 ?auto_7756 ) ) ( not ( = ?auto_7750 ?auto_7776 ) ) ( not ( = ?auto_7751 ?auto_7756 ) ) ( not ( = ?auto_7751 ?auto_7776 ) ) ( not ( = ?auto_7752 ?auto_7756 ) ) ( not ( = ?auto_7752 ?auto_7776 ) ) ( not ( = ?auto_7753 ?auto_7756 ) ) ( not ( = ?auto_7753 ?auto_7776 ) ) ( not ( = ?auto_7754 ?auto_7756 ) ) ( not ( = ?auto_7754 ?auto_7776 ) ) ( not ( = ?auto_7756 ?auto_7772 ) ) ( not ( = ?auto_7756 ?auto_7768 ) ) ( not ( = ?auto_7756 ?auto_7782 ) ) ( not ( = ?auto_7756 ?auto_7777 ) ) ( not ( = ?auto_7756 ?auto_7766 ) ) ( not ( = ?auto_7756 ?auto_7773 ) ) ( not ( = ?auto_7771 ?auto_7778 ) ) ( not ( = ?auto_7771 ?auto_7781 ) ) ( not ( = ?auto_7771 ?auto_7774 ) ) ( not ( = ?auto_7775 ?auto_7784 ) ) ( not ( = ?auto_7775 ?auto_7780 ) ) ( not ( = ?auto_7775 ?auto_7779 ) ) ( not ( = ?auto_7776 ?auto_7772 ) ) ( not ( = ?auto_7776 ?auto_7768 ) ) ( not ( = ?auto_7776 ?auto_7782 ) ) ( not ( = ?auto_7776 ?auto_7777 ) ) ( not ( = ?auto_7776 ?auto_7766 ) ) ( not ( = ?auto_7776 ?auto_7773 ) ) ( not ( = ?auto_7749 ?auto_7757 ) ) ( not ( = ?auto_7749 ?auto_7767 ) ) ( not ( = ?auto_7750 ?auto_7757 ) ) ( not ( = ?auto_7750 ?auto_7767 ) ) ( not ( = ?auto_7751 ?auto_7757 ) ) ( not ( = ?auto_7751 ?auto_7767 ) ) ( not ( = ?auto_7752 ?auto_7757 ) ) ( not ( = ?auto_7752 ?auto_7767 ) ) ( not ( = ?auto_7753 ?auto_7757 ) ) ( not ( = ?auto_7753 ?auto_7767 ) ) ( not ( = ?auto_7754 ?auto_7757 ) ) ( not ( = ?auto_7754 ?auto_7767 ) ) ( not ( = ?auto_7755 ?auto_7757 ) ) ( not ( = ?auto_7755 ?auto_7767 ) ) ( not ( = ?auto_7757 ?auto_7776 ) ) ( not ( = ?auto_7757 ?auto_7772 ) ) ( not ( = ?auto_7757 ?auto_7768 ) ) ( not ( = ?auto_7757 ?auto_7782 ) ) ( not ( = ?auto_7757 ?auto_7777 ) ) ( not ( = ?auto_7757 ?auto_7766 ) ) ( not ( = ?auto_7757 ?auto_7773 ) ) ( not ( = ?auto_7769 ?auto_7771 ) ) ( not ( = ?auto_7769 ?auto_7778 ) ) ( not ( = ?auto_7769 ?auto_7781 ) ) ( not ( = ?auto_7769 ?auto_7774 ) ) ( not ( = ?auto_7783 ?auto_7775 ) ) ( not ( = ?auto_7783 ?auto_7784 ) ) ( not ( = ?auto_7783 ?auto_7780 ) ) ( not ( = ?auto_7783 ?auto_7779 ) ) ( not ( = ?auto_7767 ?auto_7776 ) ) ( not ( = ?auto_7767 ?auto_7772 ) ) ( not ( = ?auto_7767 ?auto_7768 ) ) ( not ( = ?auto_7767 ?auto_7782 ) ) ( not ( = ?auto_7767 ?auto_7777 ) ) ( not ( = ?auto_7767 ?auto_7766 ) ) ( not ( = ?auto_7767 ?auto_7773 ) ) ( not ( = ?auto_7749 ?auto_7758 ) ) ( not ( = ?auto_7749 ?auto_7770 ) ) ( not ( = ?auto_7750 ?auto_7758 ) ) ( not ( = ?auto_7750 ?auto_7770 ) ) ( not ( = ?auto_7751 ?auto_7758 ) ) ( not ( = ?auto_7751 ?auto_7770 ) ) ( not ( = ?auto_7752 ?auto_7758 ) ) ( not ( = ?auto_7752 ?auto_7770 ) ) ( not ( = ?auto_7753 ?auto_7758 ) ) ( not ( = ?auto_7753 ?auto_7770 ) ) ( not ( = ?auto_7754 ?auto_7758 ) ) ( not ( = ?auto_7754 ?auto_7770 ) ) ( not ( = ?auto_7755 ?auto_7758 ) ) ( not ( = ?auto_7755 ?auto_7770 ) ) ( not ( = ?auto_7756 ?auto_7758 ) ) ( not ( = ?auto_7756 ?auto_7770 ) ) ( not ( = ?auto_7758 ?auto_7767 ) ) ( not ( = ?auto_7758 ?auto_7776 ) ) ( not ( = ?auto_7758 ?auto_7772 ) ) ( not ( = ?auto_7758 ?auto_7768 ) ) ( not ( = ?auto_7758 ?auto_7782 ) ) ( not ( = ?auto_7758 ?auto_7777 ) ) ( not ( = ?auto_7758 ?auto_7766 ) ) ( not ( = ?auto_7758 ?auto_7773 ) ) ( not ( = ?auto_7770 ?auto_7767 ) ) ( not ( = ?auto_7770 ?auto_7776 ) ) ( not ( = ?auto_7770 ?auto_7772 ) ) ( not ( = ?auto_7770 ?auto_7768 ) ) ( not ( = ?auto_7770 ?auto_7782 ) ) ( not ( = ?auto_7770 ?auto_7777 ) ) ( not ( = ?auto_7770 ?auto_7766 ) ) ( not ( = ?auto_7770 ?auto_7773 ) ) ( not ( = ?auto_7749 ?auto_7759 ) ) ( not ( = ?auto_7749 ?auto_7764 ) ) ( not ( = ?auto_7750 ?auto_7759 ) ) ( not ( = ?auto_7750 ?auto_7764 ) ) ( not ( = ?auto_7751 ?auto_7759 ) ) ( not ( = ?auto_7751 ?auto_7764 ) ) ( not ( = ?auto_7752 ?auto_7759 ) ) ( not ( = ?auto_7752 ?auto_7764 ) ) ( not ( = ?auto_7753 ?auto_7759 ) ) ( not ( = ?auto_7753 ?auto_7764 ) ) ( not ( = ?auto_7754 ?auto_7759 ) ) ( not ( = ?auto_7754 ?auto_7764 ) ) ( not ( = ?auto_7755 ?auto_7759 ) ) ( not ( = ?auto_7755 ?auto_7764 ) ) ( not ( = ?auto_7756 ?auto_7759 ) ) ( not ( = ?auto_7756 ?auto_7764 ) ) ( not ( = ?auto_7757 ?auto_7759 ) ) ( not ( = ?auto_7757 ?auto_7764 ) ) ( not ( = ?auto_7759 ?auto_7770 ) ) ( not ( = ?auto_7759 ?auto_7767 ) ) ( not ( = ?auto_7759 ?auto_7776 ) ) ( not ( = ?auto_7759 ?auto_7772 ) ) ( not ( = ?auto_7759 ?auto_7768 ) ) ( not ( = ?auto_7759 ?auto_7782 ) ) ( not ( = ?auto_7759 ?auto_7777 ) ) ( not ( = ?auto_7759 ?auto_7766 ) ) ( not ( = ?auto_7759 ?auto_7773 ) ) ( not ( = ?auto_7763 ?auto_7778 ) ) ( not ( = ?auto_7763 ?auto_7769 ) ) ( not ( = ?auto_7763 ?auto_7771 ) ) ( not ( = ?auto_7763 ?auto_7781 ) ) ( not ( = ?auto_7763 ?auto_7774 ) ) ( not ( = ?auto_7765 ?auto_7784 ) ) ( not ( = ?auto_7765 ?auto_7783 ) ) ( not ( = ?auto_7765 ?auto_7775 ) ) ( not ( = ?auto_7765 ?auto_7780 ) ) ( not ( = ?auto_7765 ?auto_7779 ) ) ( not ( = ?auto_7764 ?auto_7770 ) ) ( not ( = ?auto_7764 ?auto_7767 ) ) ( not ( = ?auto_7764 ?auto_7776 ) ) ( not ( = ?auto_7764 ?auto_7772 ) ) ( not ( = ?auto_7764 ?auto_7768 ) ) ( not ( = ?auto_7764 ?auto_7782 ) ) ( not ( = ?auto_7764 ?auto_7777 ) ) ( not ( = ?auto_7764 ?auto_7766 ) ) ( not ( = ?auto_7764 ?auto_7773 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_7749 ?auto_7750 ?auto_7751 ?auto_7752 ?auto_7753 ?auto_7754 ?auto_7755 ?auto_7756 ?auto_7757 ?auto_7758 )
      ( MAKE-1CRATE ?auto_7758 ?auto_7759 )
      ( MAKE-10CRATE-VERIFY ?auto_7749 ?auto_7750 ?auto_7751 ?auto_7752 ?auto_7753 ?auto_7754 ?auto_7755 ?auto_7756 ?auto_7757 ?auto_7758 ?auto_7759 ) )
  )

)

