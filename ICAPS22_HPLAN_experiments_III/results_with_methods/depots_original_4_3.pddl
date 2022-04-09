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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11484 - SURFACE
      ?auto_11485 - SURFACE
    )
    :vars
    (
      ?auto_11486 - HOIST
      ?auto_11487 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11486 ?auto_11487 ) ( SURFACE-AT ?auto_11484 ?auto_11487 ) ( CLEAR ?auto_11484 ) ( LIFTING ?auto_11486 ?auto_11485 ) ( IS-CRATE ?auto_11485 ) ( not ( = ?auto_11484 ?auto_11485 ) ) )
    :subtasks
    ( ( !DROP ?auto_11486 ?auto_11485 ?auto_11484 ?auto_11487 )
      ( MAKE-1CRATE-VERIFY ?auto_11484 ?auto_11485 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11488 - SURFACE
      ?auto_11489 - SURFACE
    )
    :vars
    (
      ?auto_11491 - HOIST
      ?auto_11490 - PLACE
      ?auto_11492 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11491 ?auto_11490 ) ( SURFACE-AT ?auto_11488 ?auto_11490 ) ( CLEAR ?auto_11488 ) ( IS-CRATE ?auto_11489 ) ( not ( = ?auto_11488 ?auto_11489 ) ) ( TRUCK-AT ?auto_11492 ?auto_11490 ) ( AVAILABLE ?auto_11491 ) ( IN ?auto_11489 ?auto_11492 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11491 ?auto_11489 ?auto_11492 ?auto_11490 )
      ( MAKE-1CRATE ?auto_11488 ?auto_11489 )
      ( MAKE-1CRATE-VERIFY ?auto_11488 ?auto_11489 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11493 - SURFACE
      ?auto_11494 - SURFACE
    )
    :vars
    (
      ?auto_11497 - HOIST
      ?auto_11496 - PLACE
      ?auto_11495 - TRUCK
      ?auto_11498 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11497 ?auto_11496 ) ( SURFACE-AT ?auto_11493 ?auto_11496 ) ( CLEAR ?auto_11493 ) ( IS-CRATE ?auto_11494 ) ( not ( = ?auto_11493 ?auto_11494 ) ) ( AVAILABLE ?auto_11497 ) ( IN ?auto_11494 ?auto_11495 ) ( TRUCK-AT ?auto_11495 ?auto_11498 ) ( not ( = ?auto_11498 ?auto_11496 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11495 ?auto_11498 ?auto_11496 )
      ( MAKE-1CRATE ?auto_11493 ?auto_11494 )
      ( MAKE-1CRATE-VERIFY ?auto_11493 ?auto_11494 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11499 - SURFACE
      ?auto_11500 - SURFACE
    )
    :vars
    (
      ?auto_11503 - HOIST
      ?auto_11504 - PLACE
      ?auto_11502 - TRUCK
      ?auto_11501 - PLACE
      ?auto_11505 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11503 ?auto_11504 ) ( SURFACE-AT ?auto_11499 ?auto_11504 ) ( CLEAR ?auto_11499 ) ( IS-CRATE ?auto_11500 ) ( not ( = ?auto_11499 ?auto_11500 ) ) ( AVAILABLE ?auto_11503 ) ( TRUCK-AT ?auto_11502 ?auto_11501 ) ( not ( = ?auto_11501 ?auto_11504 ) ) ( HOIST-AT ?auto_11505 ?auto_11501 ) ( LIFTING ?auto_11505 ?auto_11500 ) ( not ( = ?auto_11503 ?auto_11505 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11505 ?auto_11500 ?auto_11502 ?auto_11501 )
      ( MAKE-1CRATE ?auto_11499 ?auto_11500 )
      ( MAKE-1CRATE-VERIFY ?auto_11499 ?auto_11500 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11506 - SURFACE
      ?auto_11507 - SURFACE
    )
    :vars
    (
      ?auto_11512 - HOIST
      ?auto_11509 - PLACE
      ?auto_11510 - TRUCK
      ?auto_11511 - PLACE
      ?auto_11508 - HOIST
      ?auto_11513 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11512 ?auto_11509 ) ( SURFACE-AT ?auto_11506 ?auto_11509 ) ( CLEAR ?auto_11506 ) ( IS-CRATE ?auto_11507 ) ( not ( = ?auto_11506 ?auto_11507 ) ) ( AVAILABLE ?auto_11512 ) ( TRUCK-AT ?auto_11510 ?auto_11511 ) ( not ( = ?auto_11511 ?auto_11509 ) ) ( HOIST-AT ?auto_11508 ?auto_11511 ) ( not ( = ?auto_11512 ?auto_11508 ) ) ( AVAILABLE ?auto_11508 ) ( SURFACE-AT ?auto_11507 ?auto_11511 ) ( ON ?auto_11507 ?auto_11513 ) ( CLEAR ?auto_11507 ) ( not ( = ?auto_11506 ?auto_11513 ) ) ( not ( = ?auto_11507 ?auto_11513 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11508 ?auto_11507 ?auto_11513 ?auto_11511 )
      ( MAKE-1CRATE ?auto_11506 ?auto_11507 )
      ( MAKE-1CRATE-VERIFY ?auto_11506 ?auto_11507 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11514 - SURFACE
      ?auto_11515 - SURFACE
    )
    :vars
    (
      ?auto_11517 - HOIST
      ?auto_11519 - PLACE
      ?auto_11518 - PLACE
      ?auto_11520 - HOIST
      ?auto_11516 - SURFACE
      ?auto_11521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11517 ?auto_11519 ) ( SURFACE-AT ?auto_11514 ?auto_11519 ) ( CLEAR ?auto_11514 ) ( IS-CRATE ?auto_11515 ) ( not ( = ?auto_11514 ?auto_11515 ) ) ( AVAILABLE ?auto_11517 ) ( not ( = ?auto_11518 ?auto_11519 ) ) ( HOIST-AT ?auto_11520 ?auto_11518 ) ( not ( = ?auto_11517 ?auto_11520 ) ) ( AVAILABLE ?auto_11520 ) ( SURFACE-AT ?auto_11515 ?auto_11518 ) ( ON ?auto_11515 ?auto_11516 ) ( CLEAR ?auto_11515 ) ( not ( = ?auto_11514 ?auto_11516 ) ) ( not ( = ?auto_11515 ?auto_11516 ) ) ( TRUCK-AT ?auto_11521 ?auto_11519 ) )
    :subtasks
    ( ( !DRIVE ?auto_11521 ?auto_11519 ?auto_11518 )
      ( MAKE-1CRATE ?auto_11514 ?auto_11515 )
      ( MAKE-1CRATE-VERIFY ?auto_11514 ?auto_11515 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11527 - SURFACE
      ?auto_11528 - SURFACE
    )
    :vars
    (
      ?auto_11529 - HOIST
      ?auto_11530 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11529 ?auto_11530 ) ( SURFACE-AT ?auto_11527 ?auto_11530 ) ( CLEAR ?auto_11527 ) ( LIFTING ?auto_11529 ?auto_11528 ) ( IS-CRATE ?auto_11528 ) ( not ( = ?auto_11527 ?auto_11528 ) ) )
    :subtasks
    ( ( !DROP ?auto_11529 ?auto_11528 ?auto_11527 ?auto_11530 )
      ( MAKE-1CRATE-VERIFY ?auto_11527 ?auto_11528 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11531 - SURFACE
      ?auto_11532 - SURFACE
      ?auto_11533 - SURFACE
    )
    :vars
    (
      ?auto_11535 - HOIST
      ?auto_11534 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11535 ?auto_11534 ) ( SURFACE-AT ?auto_11532 ?auto_11534 ) ( CLEAR ?auto_11532 ) ( LIFTING ?auto_11535 ?auto_11533 ) ( IS-CRATE ?auto_11533 ) ( not ( = ?auto_11532 ?auto_11533 ) ) ( ON ?auto_11532 ?auto_11531 ) ( not ( = ?auto_11531 ?auto_11532 ) ) ( not ( = ?auto_11531 ?auto_11533 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11532 ?auto_11533 )
      ( MAKE-2CRATE-VERIFY ?auto_11531 ?auto_11532 ?auto_11533 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11536 - SURFACE
      ?auto_11537 - SURFACE
    )
    :vars
    (
      ?auto_11539 - HOIST
      ?auto_11538 - PLACE
      ?auto_11540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11539 ?auto_11538 ) ( SURFACE-AT ?auto_11536 ?auto_11538 ) ( CLEAR ?auto_11536 ) ( IS-CRATE ?auto_11537 ) ( not ( = ?auto_11536 ?auto_11537 ) ) ( TRUCK-AT ?auto_11540 ?auto_11538 ) ( AVAILABLE ?auto_11539 ) ( IN ?auto_11537 ?auto_11540 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11539 ?auto_11537 ?auto_11540 ?auto_11538 )
      ( MAKE-1CRATE ?auto_11536 ?auto_11537 )
      ( MAKE-1CRATE-VERIFY ?auto_11536 ?auto_11537 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11541 - SURFACE
      ?auto_11542 - SURFACE
      ?auto_11543 - SURFACE
    )
    :vars
    (
      ?auto_11545 - HOIST
      ?auto_11544 - PLACE
      ?auto_11546 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11545 ?auto_11544 ) ( SURFACE-AT ?auto_11542 ?auto_11544 ) ( CLEAR ?auto_11542 ) ( IS-CRATE ?auto_11543 ) ( not ( = ?auto_11542 ?auto_11543 ) ) ( TRUCK-AT ?auto_11546 ?auto_11544 ) ( AVAILABLE ?auto_11545 ) ( IN ?auto_11543 ?auto_11546 ) ( ON ?auto_11542 ?auto_11541 ) ( not ( = ?auto_11541 ?auto_11542 ) ) ( not ( = ?auto_11541 ?auto_11543 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11542 ?auto_11543 )
      ( MAKE-2CRATE-VERIFY ?auto_11541 ?auto_11542 ?auto_11543 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11547 - SURFACE
      ?auto_11548 - SURFACE
    )
    :vars
    (
      ?auto_11552 - HOIST
      ?auto_11550 - PLACE
      ?auto_11551 - TRUCK
      ?auto_11549 - SURFACE
      ?auto_11553 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11552 ?auto_11550 ) ( SURFACE-AT ?auto_11547 ?auto_11550 ) ( CLEAR ?auto_11547 ) ( IS-CRATE ?auto_11548 ) ( not ( = ?auto_11547 ?auto_11548 ) ) ( AVAILABLE ?auto_11552 ) ( IN ?auto_11548 ?auto_11551 ) ( ON ?auto_11547 ?auto_11549 ) ( not ( = ?auto_11549 ?auto_11547 ) ) ( not ( = ?auto_11549 ?auto_11548 ) ) ( TRUCK-AT ?auto_11551 ?auto_11553 ) ( not ( = ?auto_11553 ?auto_11550 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11551 ?auto_11553 ?auto_11550 )
      ( MAKE-2CRATE ?auto_11549 ?auto_11547 ?auto_11548 )
      ( MAKE-1CRATE-VERIFY ?auto_11547 ?auto_11548 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11554 - SURFACE
      ?auto_11555 - SURFACE
      ?auto_11556 - SURFACE
    )
    :vars
    (
      ?auto_11557 - HOIST
      ?auto_11559 - PLACE
      ?auto_11560 - TRUCK
      ?auto_11558 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11557 ?auto_11559 ) ( SURFACE-AT ?auto_11555 ?auto_11559 ) ( CLEAR ?auto_11555 ) ( IS-CRATE ?auto_11556 ) ( not ( = ?auto_11555 ?auto_11556 ) ) ( AVAILABLE ?auto_11557 ) ( IN ?auto_11556 ?auto_11560 ) ( ON ?auto_11555 ?auto_11554 ) ( not ( = ?auto_11554 ?auto_11555 ) ) ( not ( = ?auto_11554 ?auto_11556 ) ) ( TRUCK-AT ?auto_11560 ?auto_11558 ) ( not ( = ?auto_11558 ?auto_11559 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11555 ?auto_11556 )
      ( MAKE-2CRATE-VERIFY ?auto_11554 ?auto_11555 ?auto_11556 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11561 - SURFACE
      ?auto_11562 - SURFACE
    )
    :vars
    (
      ?auto_11566 - HOIST
      ?auto_11567 - PLACE
      ?auto_11563 - SURFACE
      ?auto_11564 - TRUCK
      ?auto_11565 - PLACE
      ?auto_11568 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11566 ?auto_11567 ) ( SURFACE-AT ?auto_11561 ?auto_11567 ) ( CLEAR ?auto_11561 ) ( IS-CRATE ?auto_11562 ) ( not ( = ?auto_11561 ?auto_11562 ) ) ( AVAILABLE ?auto_11566 ) ( ON ?auto_11561 ?auto_11563 ) ( not ( = ?auto_11563 ?auto_11561 ) ) ( not ( = ?auto_11563 ?auto_11562 ) ) ( TRUCK-AT ?auto_11564 ?auto_11565 ) ( not ( = ?auto_11565 ?auto_11567 ) ) ( HOIST-AT ?auto_11568 ?auto_11565 ) ( LIFTING ?auto_11568 ?auto_11562 ) ( not ( = ?auto_11566 ?auto_11568 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11568 ?auto_11562 ?auto_11564 ?auto_11565 )
      ( MAKE-2CRATE ?auto_11563 ?auto_11561 ?auto_11562 )
      ( MAKE-1CRATE-VERIFY ?auto_11561 ?auto_11562 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11569 - SURFACE
      ?auto_11570 - SURFACE
      ?auto_11571 - SURFACE
    )
    :vars
    (
      ?auto_11576 - HOIST
      ?auto_11572 - PLACE
      ?auto_11575 - TRUCK
      ?auto_11574 - PLACE
      ?auto_11573 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11576 ?auto_11572 ) ( SURFACE-AT ?auto_11570 ?auto_11572 ) ( CLEAR ?auto_11570 ) ( IS-CRATE ?auto_11571 ) ( not ( = ?auto_11570 ?auto_11571 ) ) ( AVAILABLE ?auto_11576 ) ( ON ?auto_11570 ?auto_11569 ) ( not ( = ?auto_11569 ?auto_11570 ) ) ( not ( = ?auto_11569 ?auto_11571 ) ) ( TRUCK-AT ?auto_11575 ?auto_11574 ) ( not ( = ?auto_11574 ?auto_11572 ) ) ( HOIST-AT ?auto_11573 ?auto_11574 ) ( LIFTING ?auto_11573 ?auto_11571 ) ( not ( = ?auto_11576 ?auto_11573 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11570 ?auto_11571 )
      ( MAKE-2CRATE-VERIFY ?auto_11569 ?auto_11570 ?auto_11571 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11577 - SURFACE
      ?auto_11578 - SURFACE
    )
    :vars
    (
      ?auto_11584 - HOIST
      ?auto_11581 - PLACE
      ?auto_11579 - SURFACE
      ?auto_11582 - TRUCK
      ?auto_11583 - PLACE
      ?auto_11580 - HOIST
      ?auto_11585 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11584 ?auto_11581 ) ( SURFACE-AT ?auto_11577 ?auto_11581 ) ( CLEAR ?auto_11577 ) ( IS-CRATE ?auto_11578 ) ( not ( = ?auto_11577 ?auto_11578 ) ) ( AVAILABLE ?auto_11584 ) ( ON ?auto_11577 ?auto_11579 ) ( not ( = ?auto_11579 ?auto_11577 ) ) ( not ( = ?auto_11579 ?auto_11578 ) ) ( TRUCK-AT ?auto_11582 ?auto_11583 ) ( not ( = ?auto_11583 ?auto_11581 ) ) ( HOIST-AT ?auto_11580 ?auto_11583 ) ( not ( = ?auto_11584 ?auto_11580 ) ) ( AVAILABLE ?auto_11580 ) ( SURFACE-AT ?auto_11578 ?auto_11583 ) ( ON ?auto_11578 ?auto_11585 ) ( CLEAR ?auto_11578 ) ( not ( = ?auto_11577 ?auto_11585 ) ) ( not ( = ?auto_11578 ?auto_11585 ) ) ( not ( = ?auto_11579 ?auto_11585 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11580 ?auto_11578 ?auto_11585 ?auto_11583 )
      ( MAKE-2CRATE ?auto_11579 ?auto_11577 ?auto_11578 )
      ( MAKE-1CRATE-VERIFY ?auto_11577 ?auto_11578 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11586 - SURFACE
      ?auto_11587 - SURFACE
      ?auto_11588 - SURFACE
    )
    :vars
    (
      ?auto_11593 - HOIST
      ?auto_11594 - PLACE
      ?auto_11592 - TRUCK
      ?auto_11590 - PLACE
      ?auto_11591 - HOIST
      ?auto_11589 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11593 ?auto_11594 ) ( SURFACE-AT ?auto_11587 ?auto_11594 ) ( CLEAR ?auto_11587 ) ( IS-CRATE ?auto_11588 ) ( not ( = ?auto_11587 ?auto_11588 ) ) ( AVAILABLE ?auto_11593 ) ( ON ?auto_11587 ?auto_11586 ) ( not ( = ?auto_11586 ?auto_11587 ) ) ( not ( = ?auto_11586 ?auto_11588 ) ) ( TRUCK-AT ?auto_11592 ?auto_11590 ) ( not ( = ?auto_11590 ?auto_11594 ) ) ( HOIST-AT ?auto_11591 ?auto_11590 ) ( not ( = ?auto_11593 ?auto_11591 ) ) ( AVAILABLE ?auto_11591 ) ( SURFACE-AT ?auto_11588 ?auto_11590 ) ( ON ?auto_11588 ?auto_11589 ) ( CLEAR ?auto_11588 ) ( not ( = ?auto_11587 ?auto_11589 ) ) ( not ( = ?auto_11588 ?auto_11589 ) ) ( not ( = ?auto_11586 ?auto_11589 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11587 ?auto_11588 )
      ( MAKE-2CRATE-VERIFY ?auto_11586 ?auto_11587 ?auto_11588 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11595 - SURFACE
      ?auto_11596 - SURFACE
    )
    :vars
    (
      ?auto_11598 - HOIST
      ?auto_11601 - PLACE
      ?auto_11603 - SURFACE
      ?auto_11597 - PLACE
      ?auto_11600 - HOIST
      ?auto_11599 - SURFACE
      ?auto_11602 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11598 ?auto_11601 ) ( SURFACE-AT ?auto_11595 ?auto_11601 ) ( CLEAR ?auto_11595 ) ( IS-CRATE ?auto_11596 ) ( not ( = ?auto_11595 ?auto_11596 ) ) ( AVAILABLE ?auto_11598 ) ( ON ?auto_11595 ?auto_11603 ) ( not ( = ?auto_11603 ?auto_11595 ) ) ( not ( = ?auto_11603 ?auto_11596 ) ) ( not ( = ?auto_11597 ?auto_11601 ) ) ( HOIST-AT ?auto_11600 ?auto_11597 ) ( not ( = ?auto_11598 ?auto_11600 ) ) ( AVAILABLE ?auto_11600 ) ( SURFACE-AT ?auto_11596 ?auto_11597 ) ( ON ?auto_11596 ?auto_11599 ) ( CLEAR ?auto_11596 ) ( not ( = ?auto_11595 ?auto_11599 ) ) ( not ( = ?auto_11596 ?auto_11599 ) ) ( not ( = ?auto_11603 ?auto_11599 ) ) ( TRUCK-AT ?auto_11602 ?auto_11601 ) )
    :subtasks
    ( ( !DRIVE ?auto_11602 ?auto_11601 ?auto_11597 )
      ( MAKE-2CRATE ?auto_11603 ?auto_11595 ?auto_11596 )
      ( MAKE-1CRATE-VERIFY ?auto_11595 ?auto_11596 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11604 - SURFACE
      ?auto_11605 - SURFACE
      ?auto_11606 - SURFACE
    )
    :vars
    (
      ?auto_11612 - HOIST
      ?auto_11609 - PLACE
      ?auto_11610 - PLACE
      ?auto_11607 - HOIST
      ?auto_11611 - SURFACE
      ?auto_11608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11612 ?auto_11609 ) ( SURFACE-AT ?auto_11605 ?auto_11609 ) ( CLEAR ?auto_11605 ) ( IS-CRATE ?auto_11606 ) ( not ( = ?auto_11605 ?auto_11606 ) ) ( AVAILABLE ?auto_11612 ) ( ON ?auto_11605 ?auto_11604 ) ( not ( = ?auto_11604 ?auto_11605 ) ) ( not ( = ?auto_11604 ?auto_11606 ) ) ( not ( = ?auto_11610 ?auto_11609 ) ) ( HOIST-AT ?auto_11607 ?auto_11610 ) ( not ( = ?auto_11612 ?auto_11607 ) ) ( AVAILABLE ?auto_11607 ) ( SURFACE-AT ?auto_11606 ?auto_11610 ) ( ON ?auto_11606 ?auto_11611 ) ( CLEAR ?auto_11606 ) ( not ( = ?auto_11605 ?auto_11611 ) ) ( not ( = ?auto_11606 ?auto_11611 ) ) ( not ( = ?auto_11604 ?auto_11611 ) ) ( TRUCK-AT ?auto_11608 ?auto_11609 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11605 ?auto_11606 )
      ( MAKE-2CRATE-VERIFY ?auto_11604 ?auto_11605 ?auto_11606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11613 - SURFACE
      ?auto_11614 - SURFACE
    )
    :vars
    (
      ?auto_11618 - HOIST
      ?auto_11619 - PLACE
      ?auto_11616 - SURFACE
      ?auto_11615 - PLACE
      ?auto_11621 - HOIST
      ?auto_11620 - SURFACE
      ?auto_11617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11618 ?auto_11619 ) ( IS-CRATE ?auto_11614 ) ( not ( = ?auto_11613 ?auto_11614 ) ) ( not ( = ?auto_11616 ?auto_11613 ) ) ( not ( = ?auto_11616 ?auto_11614 ) ) ( not ( = ?auto_11615 ?auto_11619 ) ) ( HOIST-AT ?auto_11621 ?auto_11615 ) ( not ( = ?auto_11618 ?auto_11621 ) ) ( AVAILABLE ?auto_11621 ) ( SURFACE-AT ?auto_11614 ?auto_11615 ) ( ON ?auto_11614 ?auto_11620 ) ( CLEAR ?auto_11614 ) ( not ( = ?auto_11613 ?auto_11620 ) ) ( not ( = ?auto_11614 ?auto_11620 ) ) ( not ( = ?auto_11616 ?auto_11620 ) ) ( TRUCK-AT ?auto_11617 ?auto_11619 ) ( SURFACE-AT ?auto_11616 ?auto_11619 ) ( CLEAR ?auto_11616 ) ( LIFTING ?auto_11618 ?auto_11613 ) ( IS-CRATE ?auto_11613 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11616 ?auto_11613 )
      ( MAKE-2CRATE ?auto_11616 ?auto_11613 ?auto_11614 )
      ( MAKE-1CRATE-VERIFY ?auto_11613 ?auto_11614 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11622 - SURFACE
      ?auto_11623 - SURFACE
      ?auto_11624 - SURFACE
    )
    :vars
    (
      ?auto_11627 - HOIST
      ?auto_11629 - PLACE
      ?auto_11625 - PLACE
      ?auto_11628 - HOIST
      ?auto_11630 - SURFACE
      ?auto_11626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11627 ?auto_11629 ) ( IS-CRATE ?auto_11624 ) ( not ( = ?auto_11623 ?auto_11624 ) ) ( not ( = ?auto_11622 ?auto_11623 ) ) ( not ( = ?auto_11622 ?auto_11624 ) ) ( not ( = ?auto_11625 ?auto_11629 ) ) ( HOIST-AT ?auto_11628 ?auto_11625 ) ( not ( = ?auto_11627 ?auto_11628 ) ) ( AVAILABLE ?auto_11628 ) ( SURFACE-AT ?auto_11624 ?auto_11625 ) ( ON ?auto_11624 ?auto_11630 ) ( CLEAR ?auto_11624 ) ( not ( = ?auto_11623 ?auto_11630 ) ) ( not ( = ?auto_11624 ?auto_11630 ) ) ( not ( = ?auto_11622 ?auto_11630 ) ) ( TRUCK-AT ?auto_11626 ?auto_11629 ) ( SURFACE-AT ?auto_11622 ?auto_11629 ) ( CLEAR ?auto_11622 ) ( LIFTING ?auto_11627 ?auto_11623 ) ( IS-CRATE ?auto_11623 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11623 ?auto_11624 )
      ( MAKE-2CRATE-VERIFY ?auto_11622 ?auto_11623 ?auto_11624 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11631 - SURFACE
      ?auto_11632 - SURFACE
    )
    :vars
    (
      ?auto_11639 - HOIST
      ?auto_11638 - PLACE
      ?auto_11633 - SURFACE
      ?auto_11636 - PLACE
      ?auto_11634 - HOIST
      ?auto_11637 - SURFACE
      ?auto_11635 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11639 ?auto_11638 ) ( IS-CRATE ?auto_11632 ) ( not ( = ?auto_11631 ?auto_11632 ) ) ( not ( = ?auto_11633 ?auto_11631 ) ) ( not ( = ?auto_11633 ?auto_11632 ) ) ( not ( = ?auto_11636 ?auto_11638 ) ) ( HOIST-AT ?auto_11634 ?auto_11636 ) ( not ( = ?auto_11639 ?auto_11634 ) ) ( AVAILABLE ?auto_11634 ) ( SURFACE-AT ?auto_11632 ?auto_11636 ) ( ON ?auto_11632 ?auto_11637 ) ( CLEAR ?auto_11632 ) ( not ( = ?auto_11631 ?auto_11637 ) ) ( not ( = ?auto_11632 ?auto_11637 ) ) ( not ( = ?auto_11633 ?auto_11637 ) ) ( TRUCK-AT ?auto_11635 ?auto_11638 ) ( SURFACE-AT ?auto_11633 ?auto_11638 ) ( CLEAR ?auto_11633 ) ( IS-CRATE ?auto_11631 ) ( AVAILABLE ?auto_11639 ) ( IN ?auto_11631 ?auto_11635 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11639 ?auto_11631 ?auto_11635 ?auto_11638 )
      ( MAKE-2CRATE ?auto_11633 ?auto_11631 ?auto_11632 )
      ( MAKE-1CRATE-VERIFY ?auto_11631 ?auto_11632 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11640 - SURFACE
      ?auto_11641 - SURFACE
      ?auto_11642 - SURFACE
    )
    :vars
    (
      ?auto_11644 - HOIST
      ?auto_11646 - PLACE
      ?auto_11643 - PLACE
      ?auto_11647 - HOIST
      ?auto_11648 - SURFACE
      ?auto_11645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11644 ?auto_11646 ) ( IS-CRATE ?auto_11642 ) ( not ( = ?auto_11641 ?auto_11642 ) ) ( not ( = ?auto_11640 ?auto_11641 ) ) ( not ( = ?auto_11640 ?auto_11642 ) ) ( not ( = ?auto_11643 ?auto_11646 ) ) ( HOIST-AT ?auto_11647 ?auto_11643 ) ( not ( = ?auto_11644 ?auto_11647 ) ) ( AVAILABLE ?auto_11647 ) ( SURFACE-AT ?auto_11642 ?auto_11643 ) ( ON ?auto_11642 ?auto_11648 ) ( CLEAR ?auto_11642 ) ( not ( = ?auto_11641 ?auto_11648 ) ) ( not ( = ?auto_11642 ?auto_11648 ) ) ( not ( = ?auto_11640 ?auto_11648 ) ) ( TRUCK-AT ?auto_11645 ?auto_11646 ) ( SURFACE-AT ?auto_11640 ?auto_11646 ) ( CLEAR ?auto_11640 ) ( IS-CRATE ?auto_11641 ) ( AVAILABLE ?auto_11644 ) ( IN ?auto_11641 ?auto_11645 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11641 ?auto_11642 )
      ( MAKE-2CRATE-VERIFY ?auto_11640 ?auto_11641 ?auto_11642 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11649 - SURFACE
      ?auto_11650 - SURFACE
    )
    :vars
    (
      ?auto_11654 - HOIST
      ?auto_11653 - PLACE
      ?auto_11655 - SURFACE
      ?auto_11651 - PLACE
      ?auto_11652 - HOIST
      ?auto_11657 - SURFACE
      ?auto_11656 - TRUCK
      ?auto_11658 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11654 ?auto_11653 ) ( IS-CRATE ?auto_11650 ) ( not ( = ?auto_11649 ?auto_11650 ) ) ( not ( = ?auto_11655 ?auto_11649 ) ) ( not ( = ?auto_11655 ?auto_11650 ) ) ( not ( = ?auto_11651 ?auto_11653 ) ) ( HOIST-AT ?auto_11652 ?auto_11651 ) ( not ( = ?auto_11654 ?auto_11652 ) ) ( AVAILABLE ?auto_11652 ) ( SURFACE-AT ?auto_11650 ?auto_11651 ) ( ON ?auto_11650 ?auto_11657 ) ( CLEAR ?auto_11650 ) ( not ( = ?auto_11649 ?auto_11657 ) ) ( not ( = ?auto_11650 ?auto_11657 ) ) ( not ( = ?auto_11655 ?auto_11657 ) ) ( SURFACE-AT ?auto_11655 ?auto_11653 ) ( CLEAR ?auto_11655 ) ( IS-CRATE ?auto_11649 ) ( AVAILABLE ?auto_11654 ) ( IN ?auto_11649 ?auto_11656 ) ( TRUCK-AT ?auto_11656 ?auto_11658 ) ( not ( = ?auto_11658 ?auto_11653 ) ) ( not ( = ?auto_11651 ?auto_11658 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11656 ?auto_11658 ?auto_11653 )
      ( MAKE-2CRATE ?auto_11655 ?auto_11649 ?auto_11650 )
      ( MAKE-1CRATE-VERIFY ?auto_11649 ?auto_11650 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11659 - SURFACE
      ?auto_11660 - SURFACE
      ?auto_11661 - SURFACE
    )
    :vars
    (
      ?auto_11668 - HOIST
      ?auto_11662 - PLACE
      ?auto_11663 - PLACE
      ?auto_11665 - HOIST
      ?auto_11666 - SURFACE
      ?auto_11667 - TRUCK
      ?auto_11664 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11668 ?auto_11662 ) ( IS-CRATE ?auto_11661 ) ( not ( = ?auto_11660 ?auto_11661 ) ) ( not ( = ?auto_11659 ?auto_11660 ) ) ( not ( = ?auto_11659 ?auto_11661 ) ) ( not ( = ?auto_11663 ?auto_11662 ) ) ( HOIST-AT ?auto_11665 ?auto_11663 ) ( not ( = ?auto_11668 ?auto_11665 ) ) ( AVAILABLE ?auto_11665 ) ( SURFACE-AT ?auto_11661 ?auto_11663 ) ( ON ?auto_11661 ?auto_11666 ) ( CLEAR ?auto_11661 ) ( not ( = ?auto_11660 ?auto_11666 ) ) ( not ( = ?auto_11661 ?auto_11666 ) ) ( not ( = ?auto_11659 ?auto_11666 ) ) ( SURFACE-AT ?auto_11659 ?auto_11662 ) ( CLEAR ?auto_11659 ) ( IS-CRATE ?auto_11660 ) ( AVAILABLE ?auto_11668 ) ( IN ?auto_11660 ?auto_11667 ) ( TRUCK-AT ?auto_11667 ?auto_11664 ) ( not ( = ?auto_11664 ?auto_11662 ) ) ( not ( = ?auto_11663 ?auto_11664 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11660 ?auto_11661 )
      ( MAKE-2CRATE-VERIFY ?auto_11659 ?auto_11660 ?auto_11661 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11669 - SURFACE
      ?auto_11670 - SURFACE
    )
    :vars
    (
      ?auto_11676 - HOIST
      ?auto_11672 - PLACE
      ?auto_11677 - SURFACE
      ?auto_11673 - PLACE
      ?auto_11671 - HOIST
      ?auto_11678 - SURFACE
      ?auto_11674 - TRUCK
      ?auto_11675 - PLACE
      ?auto_11679 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11676 ?auto_11672 ) ( IS-CRATE ?auto_11670 ) ( not ( = ?auto_11669 ?auto_11670 ) ) ( not ( = ?auto_11677 ?auto_11669 ) ) ( not ( = ?auto_11677 ?auto_11670 ) ) ( not ( = ?auto_11673 ?auto_11672 ) ) ( HOIST-AT ?auto_11671 ?auto_11673 ) ( not ( = ?auto_11676 ?auto_11671 ) ) ( AVAILABLE ?auto_11671 ) ( SURFACE-AT ?auto_11670 ?auto_11673 ) ( ON ?auto_11670 ?auto_11678 ) ( CLEAR ?auto_11670 ) ( not ( = ?auto_11669 ?auto_11678 ) ) ( not ( = ?auto_11670 ?auto_11678 ) ) ( not ( = ?auto_11677 ?auto_11678 ) ) ( SURFACE-AT ?auto_11677 ?auto_11672 ) ( CLEAR ?auto_11677 ) ( IS-CRATE ?auto_11669 ) ( AVAILABLE ?auto_11676 ) ( TRUCK-AT ?auto_11674 ?auto_11675 ) ( not ( = ?auto_11675 ?auto_11672 ) ) ( not ( = ?auto_11673 ?auto_11675 ) ) ( HOIST-AT ?auto_11679 ?auto_11675 ) ( LIFTING ?auto_11679 ?auto_11669 ) ( not ( = ?auto_11676 ?auto_11679 ) ) ( not ( = ?auto_11671 ?auto_11679 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11679 ?auto_11669 ?auto_11674 ?auto_11675 )
      ( MAKE-2CRATE ?auto_11677 ?auto_11669 ?auto_11670 )
      ( MAKE-1CRATE-VERIFY ?auto_11669 ?auto_11670 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11680 - SURFACE
      ?auto_11681 - SURFACE
      ?auto_11682 - SURFACE
    )
    :vars
    (
      ?auto_11690 - HOIST
      ?auto_11685 - PLACE
      ?auto_11689 - PLACE
      ?auto_11683 - HOIST
      ?auto_11687 - SURFACE
      ?auto_11684 - TRUCK
      ?auto_11688 - PLACE
      ?auto_11686 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11690 ?auto_11685 ) ( IS-CRATE ?auto_11682 ) ( not ( = ?auto_11681 ?auto_11682 ) ) ( not ( = ?auto_11680 ?auto_11681 ) ) ( not ( = ?auto_11680 ?auto_11682 ) ) ( not ( = ?auto_11689 ?auto_11685 ) ) ( HOIST-AT ?auto_11683 ?auto_11689 ) ( not ( = ?auto_11690 ?auto_11683 ) ) ( AVAILABLE ?auto_11683 ) ( SURFACE-AT ?auto_11682 ?auto_11689 ) ( ON ?auto_11682 ?auto_11687 ) ( CLEAR ?auto_11682 ) ( not ( = ?auto_11681 ?auto_11687 ) ) ( not ( = ?auto_11682 ?auto_11687 ) ) ( not ( = ?auto_11680 ?auto_11687 ) ) ( SURFACE-AT ?auto_11680 ?auto_11685 ) ( CLEAR ?auto_11680 ) ( IS-CRATE ?auto_11681 ) ( AVAILABLE ?auto_11690 ) ( TRUCK-AT ?auto_11684 ?auto_11688 ) ( not ( = ?auto_11688 ?auto_11685 ) ) ( not ( = ?auto_11689 ?auto_11688 ) ) ( HOIST-AT ?auto_11686 ?auto_11688 ) ( LIFTING ?auto_11686 ?auto_11681 ) ( not ( = ?auto_11690 ?auto_11686 ) ) ( not ( = ?auto_11683 ?auto_11686 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11681 ?auto_11682 )
      ( MAKE-2CRATE-VERIFY ?auto_11680 ?auto_11681 ?auto_11682 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11691 - SURFACE
      ?auto_11692 - SURFACE
    )
    :vars
    (
      ?auto_11701 - HOIST
      ?auto_11693 - PLACE
      ?auto_11696 - SURFACE
      ?auto_11698 - PLACE
      ?auto_11700 - HOIST
      ?auto_11699 - SURFACE
      ?auto_11694 - TRUCK
      ?auto_11695 - PLACE
      ?auto_11697 - HOIST
      ?auto_11702 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11701 ?auto_11693 ) ( IS-CRATE ?auto_11692 ) ( not ( = ?auto_11691 ?auto_11692 ) ) ( not ( = ?auto_11696 ?auto_11691 ) ) ( not ( = ?auto_11696 ?auto_11692 ) ) ( not ( = ?auto_11698 ?auto_11693 ) ) ( HOIST-AT ?auto_11700 ?auto_11698 ) ( not ( = ?auto_11701 ?auto_11700 ) ) ( AVAILABLE ?auto_11700 ) ( SURFACE-AT ?auto_11692 ?auto_11698 ) ( ON ?auto_11692 ?auto_11699 ) ( CLEAR ?auto_11692 ) ( not ( = ?auto_11691 ?auto_11699 ) ) ( not ( = ?auto_11692 ?auto_11699 ) ) ( not ( = ?auto_11696 ?auto_11699 ) ) ( SURFACE-AT ?auto_11696 ?auto_11693 ) ( CLEAR ?auto_11696 ) ( IS-CRATE ?auto_11691 ) ( AVAILABLE ?auto_11701 ) ( TRUCK-AT ?auto_11694 ?auto_11695 ) ( not ( = ?auto_11695 ?auto_11693 ) ) ( not ( = ?auto_11698 ?auto_11695 ) ) ( HOIST-AT ?auto_11697 ?auto_11695 ) ( not ( = ?auto_11701 ?auto_11697 ) ) ( not ( = ?auto_11700 ?auto_11697 ) ) ( AVAILABLE ?auto_11697 ) ( SURFACE-AT ?auto_11691 ?auto_11695 ) ( ON ?auto_11691 ?auto_11702 ) ( CLEAR ?auto_11691 ) ( not ( = ?auto_11691 ?auto_11702 ) ) ( not ( = ?auto_11692 ?auto_11702 ) ) ( not ( = ?auto_11696 ?auto_11702 ) ) ( not ( = ?auto_11699 ?auto_11702 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11697 ?auto_11691 ?auto_11702 ?auto_11695 )
      ( MAKE-2CRATE ?auto_11696 ?auto_11691 ?auto_11692 )
      ( MAKE-1CRATE-VERIFY ?auto_11691 ?auto_11692 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11703 - SURFACE
      ?auto_11704 - SURFACE
      ?auto_11705 - SURFACE
    )
    :vars
    (
      ?auto_11708 - HOIST
      ?auto_11709 - PLACE
      ?auto_11707 - PLACE
      ?auto_11706 - HOIST
      ?auto_11713 - SURFACE
      ?auto_11714 - TRUCK
      ?auto_11710 - PLACE
      ?auto_11711 - HOIST
      ?auto_11712 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11708 ?auto_11709 ) ( IS-CRATE ?auto_11705 ) ( not ( = ?auto_11704 ?auto_11705 ) ) ( not ( = ?auto_11703 ?auto_11704 ) ) ( not ( = ?auto_11703 ?auto_11705 ) ) ( not ( = ?auto_11707 ?auto_11709 ) ) ( HOIST-AT ?auto_11706 ?auto_11707 ) ( not ( = ?auto_11708 ?auto_11706 ) ) ( AVAILABLE ?auto_11706 ) ( SURFACE-AT ?auto_11705 ?auto_11707 ) ( ON ?auto_11705 ?auto_11713 ) ( CLEAR ?auto_11705 ) ( not ( = ?auto_11704 ?auto_11713 ) ) ( not ( = ?auto_11705 ?auto_11713 ) ) ( not ( = ?auto_11703 ?auto_11713 ) ) ( SURFACE-AT ?auto_11703 ?auto_11709 ) ( CLEAR ?auto_11703 ) ( IS-CRATE ?auto_11704 ) ( AVAILABLE ?auto_11708 ) ( TRUCK-AT ?auto_11714 ?auto_11710 ) ( not ( = ?auto_11710 ?auto_11709 ) ) ( not ( = ?auto_11707 ?auto_11710 ) ) ( HOIST-AT ?auto_11711 ?auto_11710 ) ( not ( = ?auto_11708 ?auto_11711 ) ) ( not ( = ?auto_11706 ?auto_11711 ) ) ( AVAILABLE ?auto_11711 ) ( SURFACE-AT ?auto_11704 ?auto_11710 ) ( ON ?auto_11704 ?auto_11712 ) ( CLEAR ?auto_11704 ) ( not ( = ?auto_11704 ?auto_11712 ) ) ( not ( = ?auto_11705 ?auto_11712 ) ) ( not ( = ?auto_11703 ?auto_11712 ) ) ( not ( = ?auto_11713 ?auto_11712 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11704 ?auto_11705 )
      ( MAKE-2CRATE-VERIFY ?auto_11703 ?auto_11704 ?auto_11705 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11715 - SURFACE
      ?auto_11716 - SURFACE
    )
    :vars
    (
      ?auto_11722 - HOIST
      ?auto_11721 - PLACE
      ?auto_11724 - SURFACE
      ?auto_11718 - PLACE
      ?auto_11726 - HOIST
      ?auto_11717 - SURFACE
      ?auto_11719 - PLACE
      ?auto_11720 - HOIST
      ?auto_11725 - SURFACE
      ?auto_11723 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11722 ?auto_11721 ) ( IS-CRATE ?auto_11716 ) ( not ( = ?auto_11715 ?auto_11716 ) ) ( not ( = ?auto_11724 ?auto_11715 ) ) ( not ( = ?auto_11724 ?auto_11716 ) ) ( not ( = ?auto_11718 ?auto_11721 ) ) ( HOIST-AT ?auto_11726 ?auto_11718 ) ( not ( = ?auto_11722 ?auto_11726 ) ) ( AVAILABLE ?auto_11726 ) ( SURFACE-AT ?auto_11716 ?auto_11718 ) ( ON ?auto_11716 ?auto_11717 ) ( CLEAR ?auto_11716 ) ( not ( = ?auto_11715 ?auto_11717 ) ) ( not ( = ?auto_11716 ?auto_11717 ) ) ( not ( = ?auto_11724 ?auto_11717 ) ) ( SURFACE-AT ?auto_11724 ?auto_11721 ) ( CLEAR ?auto_11724 ) ( IS-CRATE ?auto_11715 ) ( AVAILABLE ?auto_11722 ) ( not ( = ?auto_11719 ?auto_11721 ) ) ( not ( = ?auto_11718 ?auto_11719 ) ) ( HOIST-AT ?auto_11720 ?auto_11719 ) ( not ( = ?auto_11722 ?auto_11720 ) ) ( not ( = ?auto_11726 ?auto_11720 ) ) ( AVAILABLE ?auto_11720 ) ( SURFACE-AT ?auto_11715 ?auto_11719 ) ( ON ?auto_11715 ?auto_11725 ) ( CLEAR ?auto_11715 ) ( not ( = ?auto_11715 ?auto_11725 ) ) ( not ( = ?auto_11716 ?auto_11725 ) ) ( not ( = ?auto_11724 ?auto_11725 ) ) ( not ( = ?auto_11717 ?auto_11725 ) ) ( TRUCK-AT ?auto_11723 ?auto_11721 ) )
    :subtasks
    ( ( !DRIVE ?auto_11723 ?auto_11721 ?auto_11719 )
      ( MAKE-2CRATE ?auto_11724 ?auto_11715 ?auto_11716 )
      ( MAKE-1CRATE-VERIFY ?auto_11715 ?auto_11716 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11727 - SURFACE
      ?auto_11728 - SURFACE
      ?auto_11729 - SURFACE
    )
    :vars
    (
      ?auto_11738 - HOIST
      ?auto_11733 - PLACE
      ?auto_11736 - PLACE
      ?auto_11730 - HOIST
      ?auto_11731 - SURFACE
      ?auto_11735 - PLACE
      ?auto_11734 - HOIST
      ?auto_11732 - SURFACE
      ?auto_11737 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11738 ?auto_11733 ) ( IS-CRATE ?auto_11729 ) ( not ( = ?auto_11728 ?auto_11729 ) ) ( not ( = ?auto_11727 ?auto_11728 ) ) ( not ( = ?auto_11727 ?auto_11729 ) ) ( not ( = ?auto_11736 ?auto_11733 ) ) ( HOIST-AT ?auto_11730 ?auto_11736 ) ( not ( = ?auto_11738 ?auto_11730 ) ) ( AVAILABLE ?auto_11730 ) ( SURFACE-AT ?auto_11729 ?auto_11736 ) ( ON ?auto_11729 ?auto_11731 ) ( CLEAR ?auto_11729 ) ( not ( = ?auto_11728 ?auto_11731 ) ) ( not ( = ?auto_11729 ?auto_11731 ) ) ( not ( = ?auto_11727 ?auto_11731 ) ) ( SURFACE-AT ?auto_11727 ?auto_11733 ) ( CLEAR ?auto_11727 ) ( IS-CRATE ?auto_11728 ) ( AVAILABLE ?auto_11738 ) ( not ( = ?auto_11735 ?auto_11733 ) ) ( not ( = ?auto_11736 ?auto_11735 ) ) ( HOIST-AT ?auto_11734 ?auto_11735 ) ( not ( = ?auto_11738 ?auto_11734 ) ) ( not ( = ?auto_11730 ?auto_11734 ) ) ( AVAILABLE ?auto_11734 ) ( SURFACE-AT ?auto_11728 ?auto_11735 ) ( ON ?auto_11728 ?auto_11732 ) ( CLEAR ?auto_11728 ) ( not ( = ?auto_11728 ?auto_11732 ) ) ( not ( = ?auto_11729 ?auto_11732 ) ) ( not ( = ?auto_11727 ?auto_11732 ) ) ( not ( = ?auto_11731 ?auto_11732 ) ) ( TRUCK-AT ?auto_11737 ?auto_11733 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11728 ?auto_11729 )
      ( MAKE-2CRATE-VERIFY ?auto_11727 ?auto_11728 ?auto_11729 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11748 - SURFACE
      ?auto_11749 - SURFACE
    )
    :vars
    (
      ?auto_11750 - HOIST
      ?auto_11751 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11750 ?auto_11751 ) ( SURFACE-AT ?auto_11748 ?auto_11751 ) ( CLEAR ?auto_11748 ) ( LIFTING ?auto_11750 ?auto_11749 ) ( IS-CRATE ?auto_11749 ) ( not ( = ?auto_11748 ?auto_11749 ) ) )
    :subtasks
    ( ( !DROP ?auto_11750 ?auto_11749 ?auto_11748 ?auto_11751 )
      ( MAKE-1CRATE-VERIFY ?auto_11748 ?auto_11749 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11752 - SURFACE
      ?auto_11753 - SURFACE
      ?auto_11754 - SURFACE
    )
    :vars
    (
      ?auto_11756 - HOIST
      ?auto_11755 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11756 ?auto_11755 ) ( SURFACE-AT ?auto_11753 ?auto_11755 ) ( CLEAR ?auto_11753 ) ( LIFTING ?auto_11756 ?auto_11754 ) ( IS-CRATE ?auto_11754 ) ( not ( = ?auto_11753 ?auto_11754 ) ) ( ON ?auto_11753 ?auto_11752 ) ( not ( = ?auto_11752 ?auto_11753 ) ) ( not ( = ?auto_11752 ?auto_11754 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11753 ?auto_11754 )
      ( MAKE-2CRATE-VERIFY ?auto_11752 ?auto_11753 ?auto_11754 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11757 - SURFACE
      ?auto_11758 - SURFACE
      ?auto_11759 - SURFACE
      ?auto_11760 - SURFACE
    )
    :vars
    (
      ?auto_11762 - HOIST
      ?auto_11761 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11762 ?auto_11761 ) ( SURFACE-AT ?auto_11759 ?auto_11761 ) ( CLEAR ?auto_11759 ) ( LIFTING ?auto_11762 ?auto_11760 ) ( IS-CRATE ?auto_11760 ) ( not ( = ?auto_11759 ?auto_11760 ) ) ( ON ?auto_11758 ?auto_11757 ) ( ON ?auto_11759 ?auto_11758 ) ( not ( = ?auto_11757 ?auto_11758 ) ) ( not ( = ?auto_11757 ?auto_11759 ) ) ( not ( = ?auto_11757 ?auto_11760 ) ) ( not ( = ?auto_11758 ?auto_11759 ) ) ( not ( = ?auto_11758 ?auto_11760 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11759 ?auto_11760 )
      ( MAKE-3CRATE-VERIFY ?auto_11757 ?auto_11758 ?auto_11759 ?auto_11760 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11763 - SURFACE
      ?auto_11764 - SURFACE
    )
    :vars
    (
      ?auto_11766 - HOIST
      ?auto_11765 - PLACE
      ?auto_11767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11766 ?auto_11765 ) ( SURFACE-AT ?auto_11763 ?auto_11765 ) ( CLEAR ?auto_11763 ) ( IS-CRATE ?auto_11764 ) ( not ( = ?auto_11763 ?auto_11764 ) ) ( TRUCK-AT ?auto_11767 ?auto_11765 ) ( AVAILABLE ?auto_11766 ) ( IN ?auto_11764 ?auto_11767 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11766 ?auto_11764 ?auto_11767 ?auto_11765 )
      ( MAKE-1CRATE ?auto_11763 ?auto_11764 )
      ( MAKE-1CRATE-VERIFY ?auto_11763 ?auto_11764 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11768 - SURFACE
      ?auto_11769 - SURFACE
      ?auto_11770 - SURFACE
    )
    :vars
    (
      ?auto_11772 - HOIST
      ?auto_11773 - PLACE
      ?auto_11771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11772 ?auto_11773 ) ( SURFACE-AT ?auto_11769 ?auto_11773 ) ( CLEAR ?auto_11769 ) ( IS-CRATE ?auto_11770 ) ( not ( = ?auto_11769 ?auto_11770 ) ) ( TRUCK-AT ?auto_11771 ?auto_11773 ) ( AVAILABLE ?auto_11772 ) ( IN ?auto_11770 ?auto_11771 ) ( ON ?auto_11769 ?auto_11768 ) ( not ( = ?auto_11768 ?auto_11769 ) ) ( not ( = ?auto_11768 ?auto_11770 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11769 ?auto_11770 )
      ( MAKE-2CRATE-VERIFY ?auto_11768 ?auto_11769 ?auto_11770 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11774 - SURFACE
      ?auto_11775 - SURFACE
      ?auto_11776 - SURFACE
      ?auto_11777 - SURFACE
    )
    :vars
    (
      ?auto_11779 - HOIST
      ?auto_11780 - PLACE
      ?auto_11778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11779 ?auto_11780 ) ( SURFACE-AT ?auto_11776 ?auto_11780 ) ( CLEAR ?auto_11776 ) ( IS-CRATE ?auto_11777 ) ( not ( = ?auto_11776 ?auto_11777 ) ) ( TRUCK-AT ?auto_11778 ?auto_11780 ) ( AVAILABLE ?auto_11779 ) ( IN ?auto_11777 ?auto_11778 ) ( ON ?auto_11776 ?auto_11775 ) ( not ( = ?auto_11775 ?auto_11776 ) ) ( not ( = ?auto_11775 ?auto_11777 ) ) ( ON ?auto_11775 ?auto_11774 ) ( not ( = ?auto_11774 ?auto_11775 ) ) ( not ( = ?auto_11774 ?auto_11776 ) ) ( not ( = ?auto_11774 ?auto_11777 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11775 ?auto_11776 ?auto_11777 )
      ( MAKE-3CRATE-VERIFY ?auto_11774 ?auto_11775 ?auto_11776 ?auto_11777 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11781 - SURFACE
      ?auto_11782 - SURFACE
    )
    :vars
    (
      ?auto_11785 - HOIST
      ?auto_11786 - PLACE
      ?auto_11784 - TRUCK
      ?auto_11783 - SURFACE
      ?auto_11787 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11785 ?auto_11786 ) ( SURFACE-AT ?auto_11781 ?auto_11786 ) ( CLEAR ?auto_11781 ) ( IS-CRATE ?auto_11782 ) ( not ( = ?auto_11781 ?auto_11782 ) ) ( AVAILABLE ?auto_11785 ) ( IN ?auto_11782 ?auto_11784 ) ( ON ?auto_11781 ?auto_11783 ) ( not ( = ?auto_11783 ?auto_11781 ) ) ( not ( = ?auto_11783 ?auto_11782 ) ) ( TRUCK-AT ?auto_11784 ?auto_11787 ) ( not ( = ?auto_11787 ?auto_11786 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11784 ?auto_11787 ?auto_11786 )
      ( MAKE-2CRATE ?auto_11783 ?auto_11781 ?auto_11782 )
      ( MAKE-1CRATE-VERIFY ?auto_11781 ?auto_11782 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11788 - SURFACE
      ?auto_11789 - SURFACE
      ?auto_11790 - SURFACE
    )
    :vars
    (
      ?auto_11794 - HOIST
      ?auto_11793 - PLACE
      ?auto_11791 - TRUCK
      ?auto_11792 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11794 ?auto_11793 ) ( SURFACE-AT ?auto_11789 ?auto_11793 ) ( CLEAR ?auto_11789 ) ( IS-CRATE ?auto_11790 ) ( not ( = ?auto_11789 ?auto_11790 ) ) ( AVAILABLE ?auto_11794 ) ( IN ?auto_11790 ?auto_11791 ) ( ON ?auto_11789 ?auto_11788 ) ( not ( = ?auto_11788 ?auto_11789 ) ) ( not ( = ?auto_11788 ?auto_11790 ) ) ( TRUCK-AT ?auto_11791 ?auto_11792 ) ( not ( = ?auto_11792 ?auto_11793 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11789 ?auto_11790 )
      ( MAKE-2CRATE-VERIFY ?auto_11788 ?auto_11789 ?auto_11790 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11795 - SURFACE
      ?auto_11796 - SURFACE
      ?auto_11797 - SURFACE
      ?auto_11798 - SURFACE
    )
    :vars
    (
      ?auto_11802 - HOIST
      ?auto_11800 - PLACE
      ?auto_11799 - TRUCK
      ?auto_11801 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11802 ?auto_11800 ) ( SURFACE-AT ?auto_11797 ?auto_11800 ) ( CLEAR ?auto_11797 ) ( IS-CRATE ?auto_11798 ) ( not ( = ?auto_11797 ?auto_11798 ) ) ( AVAILABLE ?auto_11802 ) ( IN ?auto_11798 ?auto_11799 ) ( ON ?auto_11797 ?auto_11796 ) ( not ( = ?auto_11796 ?auto_11797 ) ) ( not ( = ?auto_11796 ?auto_11798 ) ) ( TRUCK-AT ?auto_11799 ?auto_11801 ) ( not ( = ?auto_11801 ?auto_11800 ) ) ( ON ?auto_11796 ?auto_11795 ) ( not ( = ?auto_11795 ?auto_11796 ) ) ( not ( = ?auto_11795 ?auto_11797 ) ) ( not ( = ?auto_11795 ?auto_11798 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11796 ?auto_11797 ?auto_11798 )
      ( MAKE-3CRATE-VERIFY ?auto_11795 ?auto_11796 ?auto_11797 ?auto_11798 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11803 - SURFACE
      ?auto_11804 - SURFACE
    )
    :vars
    (
      ?auto_11809 - HOIST
      ?auto_11806 - PLACE
      ?auto_11808 - SURFACE
      ?auto_11805 - TRUCK
      ?auto_11807 - PLACE
      ?auto_11810 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11809 ?auto_11806 ) ( SURFACE-AT ?auto_11803 ?auto_11806 ) ( CLEAR ?auto_11803 ) ( IS-CRATE ?auto_11804 ) ( not ( = ?auto_11803 ?auto_11804 ) ) ( AVAILABLE ?auto_11809 ) ( ON ?auto_11803 ?auto_11808 ) ( not ( = ?auto_11808 ?auto_11803 ) ) ( not ( = ?auto_11808 ?auto_11804 ) ) ( TRUCK-AT ?auto_11805 ?auto_11807 ) ( not ( = ?auto_11807 ?auto_11806 ) ) ( HOIST-AT ?auto_11810 ?auto_11807 ) ( LIFTING ?auto_11810 ?auto_11804 ) ( not ( = ?auto_11809 ?auto_11810 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11810 ?auto_11804 ?auto_11805 ?auto_11807 )
      ( MAKE-2CRATE ?auto_11808 ?auto_11803 ?auto_11804 )
      ( MAKE-1CRATE-VERIFY ?auto_11803 ?auto_11804 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11811 - SURFACE
      ?auto_11812 - SURFACE
      ?auto_11813 - SURFACE
    )
    :vars
    (
      ?auto_11818 - HOIST
      ?auto_11817 - PLACE
      ?auto_11815 - TRUCK
      ?auto_11814 - PLACE
      ?auto_11816 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11818 ?auto_11817 ) ( SURFACE-AT ?auto_11812 ?auto_11817 ) ( CLEAR ?auto_11812 ) ( IS-CRATE ?auto_11813 ) ( not ( = ?auto_11812 ?auto_11813 ) ) ( AVAILABLE ?auto_11818 ) ( ON ?auto_11812 ?auto_11811 ) ( not ( = ?auto_11811 ?auto_11812 ) ) ( not ( = ?auto_11811 ?auto_11813 ) ) ( TRUCK-AT ?auto_11815 ?auto_11814 ) ( not ( = ?auto_11814 ?auto_11817 ) ) ( HOIST-AT ?auto_11816 ?auto_11814 ) ( LIFTING ?auto_11816 ?auto_11813 ) ( not ( = ?auto_11818 ?auto_11816 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11812 ?auto_11813 )
      ( MAKE-2CRATE-VERIFY ?auto_11811 ?auto_11812 ?auto_11813 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11819 - SURFACE
      ?auto_11820 - SURFACE
      ?auto_11821 - SURFACE
      ?auto_11822 - SURFACE
    )
    :vars
    (
      ?auto_11827 - HOIST
      ?auto_11825 - PLACE
      ?auto_11826 - TRUCK
      ?auto_11823 - PLACE
      ?auto_11824 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11827 ?auto_11825 ) ( SURFACE-AT ?auto_11821 ?auto_11825 ) ( CLEAR ?auto_11821 ) ( IS-CRATE ?auto_11822 ) ( not ( = ?auto_11821 ?auto_11822 ) ) ( AVAILABLE ?auto_11827 ) ( ON ?auto_11821 ?auto_11820 ) ( not ( = ?auto_11820 ?auto_11821 ) ) ( not ( = ?auto_11820 ?auto_11822 ) ) ( TRUCK-AT ?auto_11826 ?auto_11823 ) ( not ( = ?auto_11823 ?auto_11825 ) ) ( HOIST-AT ?auto_11824 ?auto_11823 ) ( LIFTING ?auto_11824 ?auto_11822 ) ( not ( = ?auto_11827 ?auto_11824 ) ) ( ON ?auto_11820 ?auto_11819 ) ( not ( = ?auto_11819 ?auto_11820 ) ) ( not ( = ?auto_11819 ?auto_11821 ) ) ( not ( = ?auto_11819 ?auto_11822 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11820 ?auto_11821 ?auto_11822 )
      ( MAKE-3CRATE-VERIFY ?auto_11819 ?auto_11820 ?auto_11821 ?auto_11822 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11828 - SURFACE
      ?auto_11829 - SURFACE
    )
    :vars
    (
      ?auto_11835 - HOIST
      ?auto_11832 - PLACE
      ?auto_11834 - SURFACE
      ?auto_11833 - TRUCK
      ?auto_11830 - PLACE
      ?auto_11831 - HOIST
      ?auto_11836 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11835 ?auto_11832 ) ( SURFACE-AT ?auto_11828 ?auto_11832 ) ( CLEAR ?auto_11828 ) ( IS-CRATE ?auto_11829 ) ( not ( = ?auto_11828 ?auto_11829 ) ) ( AVAILABLE ?auto_11835 ) ( ON ?auto_11828 ?auto_11834 ) ( not ( = ?auto_11834 ?auto_11828 ) ) ( not ( = ?auto_11834 ?auto_11829 ) ) ( TRUCK-AT ?auto_11833 ?auto_11830 ) ( not ( = ?auto_11830 ?auto_11832 ) ) ( HOIST-AT ?auto_11831 ?auto_11830 ) ( not ( = ?auto_11835 ?auto_11831 ) ) ( AVAILABLE ?auto_11831 ) ( SURFACE-AT ?auto_11829 ?auto_11830 ) ( ON ?auto_11829 ?auto_11836 ) ( CLEAR ?auto_11829 ) ( not ( = ?auto_11828 ?auto_11836 ) ) ( not ( = ?auto_11829 ?auto_11836 ) ) ( not ( = ?auto_11834 ?auto_11836 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11831 ?auto_11829 ?auto_11836 ?auto_11830 )
      ( MAKE-2CRATE ?auto_11834 ?auto_11828 ?auto_11829 )
      ( MAKE-1CRATE-VERIFY ?auto_11828 ?auto_11829 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11837 - SURFACE
      ?auto_11838 - SURFACE
      ?auto_11839 - SURFACE
    )
    :vars
    (
      ?auto_11842 - HOIST
      ?auto_11841 - PLACE
      ?auto_11845 - TRUCK
      ?auto_11843 - PLACE
      ?auto_11840 - HOIST
      ?auto_11844 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11842 ?auto_11841 ) ( SURFACE-AT ?auto_11838 ?auto_11841 ) ( CLEAR ?auto_11838 ) ( IS-CRATE ?auto_11839 ) ( not ( = ?auto_11838 ?auto_11839 ) ) ( AVAILABLE ?auto_11842 ) ( ON ?auto_11838 ?auto_11837 ) ( not ( = ?auto_11837 ?auto_11838 ) ) ( not ( = ?auto_11837 ?auto_11839 ) ) ( TRUCK-AT ?auto_11845 ?auto_11843 ) ( not ( = ?auto_11843 ?auto_11841 ) ) ( HOIST-AT ?auto_11840 ?auto_11843 ) ( not ( = ?auto_11842 ?auto_11840 ) ) ( AVAILABLE ?auto_11840 ) ( SURFACE-AT ?auto_11839 ?auto_11843 ) ( ON ?auto_11839 ?auto_11844 ) ( CLEAR ?auto_11839 ) ( not ( = ?auto_11838 ?auto_11844 ) ) ( not ( = ?auto_11839 ?auto_11844 ) ) ( not ( = ?auto_11837 ?auto_11844 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11838 ?auto_11839 )
      ( MAKE-2CRATE-VERIFY ?auto_11837 ?auto_11838 ?auto_11839 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11846 - SURFACE
      ?auto_11847 - SURFACE
      ?auto_11848 - SURFACE
      ?auto_11849 - SURFACE
    )
    :vars
    (
      ?auto_11851 - HOIST
      ?auto_11854 - PLACE
      ?auto_11853 - TRUCK
      ?auto_11852 - PLACE
      ?auto_11850 - HOIST
      ?auto_11855 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11851 ?auto_11854 ) ( SURFACE-AT ?auto_11848 ?auto_11854 ) ( CLEAR ?auto_11848 ) ( IS-CRATE ?auto_11849 ) ( not ( = ?auto_11848 ?auto_11849 ) ) ( AVAILABLE ?auto_11851 ) ( ON ?auto_11848 ?auto_11847 ) ( not ( = ?auto_11847 ?auto_11848 ) ) ( not ( = ?auto_11847 ?auto_11849 ) ) ( TRUCK-AT ?auto_11853 ?auto_11852 ) ( not ( = ?auto_11852 ?auto_11854 ) ) ( HOIST-AT ?auto_11850 ?auto_11852 ) ( not ( = ?auto_11851 ?auto_11850 ) ) ( AVAILABLE ?auto_11850 ) ( SURFACE-AT ?auto_11849 ?auto_11852 ) ( ON ?auto_11849 ?auto_11855 ) ( CLEAR ?auto_11849 ) ( not ( = ?auto_11848 ?auto_11855 ) ) ( not ( = ?auto_11849 ?auto_11855 ) ) ( not ( = ?auto_11847 ?auto_11855 ) ) ( ON ?auto_11847 ?auto_11846 ) ( not ( = ?auto_11846 ?auto_11847 ) ) ( not ( = ?auto_11846 ?auto_11848 ) ) ( not ( = ?auto_11846 ?auto_11849 ) ) ( not ( = ?auto_11846 ?auto_11855 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11847 ?auto_11848 ?auto_11849 )
      ( MAKE-3CRATE-VERIFY ?auto_11846 ?auto_11847 ?auto_11848 ?auto_11849 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11856 - SURFACE
      ?auto_11857 - SURFACE
    )
    :vars
    (
      ?auto_11860 - HOIST
      ?auto_11863 - PLACE
      ?auto_11859 - SURFACE
      ?auto_11861 - PLACE
      ?auto_11858 - HOIST
      ?auto_11864 - SURFACE
      ?auto_11862 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11860 ?auto_11863 ) ( SURFACE-AT ?auto_11856 ?auto_11863 ) ( CLEAR ?auto_11856 ) ( IS-CRATE ?auto_11857 ) ( not ( = ?auto_11856 ?auto_11857 ) ) ( AVAILABLE ?auto_11860 ) ( ON ?auto_11856 ?auto_11859 ) ( not ( = ?auto_11859 ?auto_11856 ) ) ( not ( = ?auto_11859 ?auto_11857 ) ) ( not ( = ?auto_11861 ?auto_11863 ) ) ( HOIST-AT ?auto_11858 ?auto_11861 ) ( not ( = ?auto_11860 ?auto_11858 ) ) ( AVAILABLE ?auto_11858 ) ( SURFACE-AT ?auto_11857 ?auto_11861 ) ( ON ?auto_11857 ?auto_11864 ) ( CLEAR ?auto_11857 ) ( not ( = ?auto_11856 ?auto_11864 ) ) ( not ( = ?auto_11857 ?auto_11864 ) ) ( not ( = ?auto_11859 ?auto_11864 ) ) ( TRUCK-AT ?auto_11862 ?auto_11863 ) )
    :subtasks
    ( ( !DRIVE ?auto_11862 ?auto_11863 ?auto_11861 )
      ( MAKE-2CRATE ?auto_11859 ?auto_11856 ?auto_11857 )
      ( MAKE-1CRATE-VERIFY ?auto_11856 ?auto_11857 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11865 - SURFACE
      ?auto_11866 - SURFACE
      ?auto_11867 - SURFACE
    )
    :vars
    (
      ?auto_11868 - HOIST
      ?auto_11871 - PLACE
      ?auto_11872 - PLACE
      ?auto_11870 - HOIST
      ?auto_11873 - SURFACE
      ?auto_11869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11868 ?auto_11871 ) ( SURFACE-AT ?auto_11866 ?auto_11871 ) ( CLEAR ?auto_11866 ) ( IS-CRATE ?auto_11867 ) ( not ( = ?auto_11866 ?auto_11867 ) ) ( AVAILABLE ?auto_11868 ) ( ON ?auto_11866 ?auto_11865 ) ( not ( = ?auto_11865 ?auto_11866 ) ) ( not ( = ?auto_11865 ?auto_11867 ) ) ( not ( = ?auto_11872 ?auto_11871 ) ) ( HOIST-AT ?auto_11870 ?auto_11872 ) ( not ( = ?auto_11868 ?auto_11870 ) ) ( AVAILABLE ?auto_11870 ) ( SURFACE-AT ?auto_11867 ?auto_11872 ) ( ON ?auto_11867 ?auto_11873 ) ( CLEAR ?auto_11867 ) ( not ( = ?auto_11866 ?auto_11873 ) ) ( not ( = ?auto_11867 ?auto_11873 ) ) ( not ( = ?auto_11865 ?auto_11873 ) ) ( TRUCK-AT ?auto_11869 ?auto_11871 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11866 ?auto_11867 )
      ( MAKE-2CRATE-VERIFY ?auto_11865 ?auto_11866 ?auto_11867 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11874 - SURFACE
      ?auto_11875 - SURFACE
      ?auto_11876 - SURFACE
      ?auto_11877 - SURFACE
    )
    :vars
    (
      ?auto_11882 - HOIST
      ?auto_11880 - PLACE
      ?auto_11879 - PLACE
      ?auto_11881 - HOIST
      ?auto_11878 - SURFACE
      ?auto_11883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11882 ?auto_11880 ) ( SURFACE-AT ?auto_11876 ?auto_11880 ) ( CLEAR ?auto_11876 ) ( IS-CRATE ?auto_11877 ) ( not ( = ?auto_11876 ?auto_11877 ) ) ( AVAILABLE ?auto_11882 ) ( ON ?auto_11876 ?auto_11875 ) ( not ( = ?auto_11875 ?auto_11876 ) ) ( not ( = ?auto_11875 ?auto_11877 ) ) ( not ( = ?auto_11879 ?auto_11880 ) ) ( HOIST-AT ?auto_11881 ?auto_11879 ) ( not ( = ?auto_11882 ?auto_11881 ) ) ( AVAILABLE ?auto_11881 ) ( SURFACE-AT ?auto_11877 ?auto_11879 ) ( ON ?auto_11877 ?auto_11878 ) ( CLEAR ?auto_11877 ) ( not ( = ?auto_11876 ?auto_11878 ) ) ( not ( = ?auto_11877 ?auto_11878 ) ) ( not ( = ?auto_11875 ?auto_11878 ) ) ( TRUCK-AT ?auto_11883 ?auto_11880 ) ( ON ?auto_11875 ?auto_11874 ) ( not ( = ?auto_11874 ?auto_11875 ) ) ( not ( = ?auto_11874 ?auto_11876 ) ) ( not ( = ?auto_11874 ?auto_11877 ) ) ( not ( = ?auto_11874 ?auto_11878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11875 ?auto_11876 ?auto_11877 )
      ( MAKE-3CRATE-VERIFY ?auto_11874 ?auto_11875 ?auto_11876 ?auto_11877 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11884 - SURFACE
      ?auto_11885 - SURFACE
    )
    :vars
    (
      ?auto_11891 - HOIST
      ?auto_11889 - PLACE
      ?auto_11886 - SURFACE
      ?auto_11888 - PLACE
      ?auto_11890 - HOIST
      ?auto_11887 - SURFACE
      ?auto_11892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11891 ?auto_11889 ) ( IS-CRATE ?auto_11885 ) ( not ( = ?auto_11884 ?auto_11885 ) ) ( not ( = ?auto_11886 ?auto_11884 ) ) ( not ( = ?auto_11886 ?auto_11885 ) ) ( not ( = ?auto_11888 ?auto_11889 ) ) ( HOIST-AT ?auto_11890 ?auto_11888 ) ( not ( = ?auto_11891 ?auto_11890 ) ) ( AVAILABLE ?auto_11890 ) ( SURFACE-AT ?auto_11885 ?auto_11888 ) ( ON ?auto_11885 ?auto_11887 ) ( CLEAR ?auto_11885 ) ( not ( = ?auto_11884 ?auto_11887 ) ) ( not ( = ?auto_11885 ?auto_11887 ) ) ( not ( = ?auto_11886 ?auto_11887 ) ) ( TRUCK-AT ?auto_11892 ?auto_11889 ) ( SURFACE-AT ?auto_11886 ?auto_11889 ) ( CLEAR ?auto_11886 ) ( LIFTING ?auto_11891 ?auto_11884 ) ( IS-CRATE ?auto_11884 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11886 ?auto_11884 )
      ( MAKE-2CRATE ?auto_11886 ?auto_11884 ?auto_11885 )
      ( MAKE-1CRATE-VERIFY ?auto_11884 ?auto_11885 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11893 - SURFACE
      ?auto_11894 - SURFACE
      ?auto_11895 - SURFACE
    )
    :vars
    (
      ?auto_11901 - HOIST
      ?auto_11896 - PLACE
      ?auto_11900 - PLACE
      ?auto_11899 - HOIST
      ?auto_11897 - SURFACE
      ?auto_11898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11901 ?auto_11896 ) ( IS-CRATE ?auto_11895 ) ( not ( = ?auto_11894 ?auto_11895 ) ) ( not ( = ?auto_11893 ?auto_11894 ) ) ( not ( = ?auto_11893 ?auto_11895 ) ) ( not ( = ?auto_11900 ?auto_11896 ) ) ( HOIST-AT ?auto_11899 ?auto_11900 ) ( not ( = ?auto_11901 ?auto_11899 ) ) ( AVAILABLE ?auto_11899 ) ( SURFACE-AT ?auto_11895 ?auto_11900 ) ( ON ?auto_11895 ?auto_11897 ) ( CLEAR ?auto_11895 ) ( not ( = ?auto_11894 ?auto_11897 ) ) ( not ( = ?auto_11895 ?auto_11897 ) ) ( not ( = ?auto_11893 ?auto_11897 ) ) ( TRUCK-AT ?auto_11898 ?auto_11896 ) ( SURFACE-AT ?auto_11893 ?auto_11896 ) ( CLEAR ?auto_11893 ) ( LIFTING ?auto_11901 ?auto_11894 ) ( IS-CRATE ?auto_11894 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11894 ?auto_11895 )
      ( MAKE-2CRATE-VERIFY ?auto_11893 ?auto_11894 ?auto_11895 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11902 - SURFACE
      ?auto_11903 - SURFACE
      ?auto_11904 - SURFACE
      ?auto_11905 - SURFACE
    )
    :vars
    (
      ?auto_11907 - HOIST
      ?auto_11911 - PLACE
      ?auto_11910 - PLACE
      ?auto_11908 - HOIST
      ?auto_11909 - SURFACE
      ?auto_11906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11907 ?auto_11911 ) ( IS-CRATE ?auto_11905 ) ( not ( = ?auto_11904 ?auto_11905 ) ) ( not ( = ?auto_11903 ?auto_11904 ) ) ( not ( = ?auto_11903 ?auto_11905 ) ) ( not ( = ?auto_11910 ?auto_11911 ) ) ( HOIST-AT ?auto_11908 ?auto_11910 ) ( not ( = ?auto_11907 ?auto_11908 ) ) ( AVAILABLE ?auto_11908 ) ( SURFACE-AT ?auto_11905 ?auto_11910 ) ( ON ?auto_11905 ?auto_11909 ) ( CLEAR ?auto_11905 ) ( not ( = ?auto_11904 ?auto_11909 ) ) ( not ( = ?auto_11905 ?auto_11909 ) ) ( not ( = ?auto_11903 ?auto_11909 ) ) ( TRUCK-AT ?auto_11906 ?auto_11911 ) ( SURFACE-AT ?auto_11903 ?auto_11911 ) ( CLEAR ?auto_11903 ) ( LIFTING ?auto_11907 ?auto_11904 ) ( IS-CRATE ?auto_11904 ) ( ON ?auto_11903 ?auto_11902 ) ( not ( = ?auto_11902 ?auto_11903 ) ) ( not ( = ?auto_11902 ?auto_11904 ) ) ( not ( = ?auto_11902 ?auto_11905 ) ) ( not ( = ?auto_11902 ?auto_11909 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11903 ?auto_11904 ?auto_11905 )
      ( MAKE-3CRATE-VERIFY ?auto_11902 ?auto_11903 ?auto_11904 ?auto_11905 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11912 - SURFACE
      ?auto_11913 - SURFACE
    )
    :vars
    (
      ?auto_11915 - HOIST
      ?auto_11919 - PLACE
      ?auto_11920 - SURFACE
      ?auto_11918 - PLACE
      ?auto_11916 - HOIST
      ?auto_11917 - SURFACE
      ?auto_11914 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11915 ?auto_11919 ) ( IS-CRATE ?auto_11913 ) ( not ( = ?auto_11912 ?auto_11913 ) ) ( not ( = ?auto_11920 ?auto_11912 ) ) ( not ( = ?auto_11920 ?auto_11913 ) ) ( not ( = ?auto_11918 ?auto_11919 ) ) ( HOIST-AT ?auto_11916 ?auto_11918 ) ( not ( = ?auto_11915 ?auto_11916 ) ) ( AVAILABLE ?auto_11916 ) ( SURFACE-AT ?auto_11913 ?auto_11918 ) ( ON ?auto_11913 ?auto_11917 ) ( CLEAR ?auto_11913 ) ( not ( = ?auto_11912 ?auto_11917 ) ) ( not ( = ?auto_11913 ?auto_11917 ) ) ( not ( = ?auto_11920 ?auto_11917 ) ) ( TRUCK-AT ?auto_11914 ?auto_11919 ) ( SURFACE-AT ?auto_11920 ?auto_11919 ) ( CLEAR ?auto_11920 ) ( IS-CRATE ?auto_11912 ) ( AVAILABLE ?auto_11915 ) ( IN ?auto_11912 ?auto_11914 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11915 ?auto_11912 ?auto_11914 ?auto_11919 )
      ( MAKE-2CRATE ?auto_11920 ?auto_11912 ?auto_11913 )
      ( MAKE-1CRATE-VERIFY ?auto_11912 ?auto_11913 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11921 - SURFACE
      ?auto_11922 - SURFACE
      ?auto_11923 - SURFACE
    )
    :vars
    (
      ?auto_11927 - HOIST
      ?auto_11924 - PLACE
      ?auto_11926 - PLACE
      ?auto_11925 - HOIST
      ?auto_11929 - SURFACE
      ?auto_11928 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11927 ?auto_11924 ) ( IS-CRATE ?auto_11923 ) ( not ( = ?auto_11922 ?auto_11923 ) ) ( not ( = ?auto_11921 ?auto_11922 ) ) ( not ( = ?auto_11921 ?auto_11923 ) ) ( not ( = ?auto_11926 ?auto_11924 ) ) ( HOIST-AT ?auto_11925 ?auto_11926 ) ( not ( = ?auto_11927 ?auto_11925 ) ) ( AVAILABLE ?auto_11925 ) ( SURFACE-AT ?auto_11923 ?auto_11926 ) ( ON ?auto_11923 ?auto_11929 ) ( CLEAR ?auto_11923 ) ( not ( = ?auto_11922 ?auto_11929 ) ) ( not ( = ?auto_11923 ?auto_11929 ) ) ( not ( = ?auto_11921 ?auto_11929 ) ) ( TRUCK-AT ?auto_11928 ?auto_11924 ) ( SURFACE-AT ?auto_11921 ?auto_11924 ) ( CLEAR ?auto_11921 ) ( IS-CRATE ?auto_11922 ) ( AVAILABLE ?auto_11927 ) ( IN ?auto_11922 ?auto_11928 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11922 ?auto_11923 )
      ( MAKE-2CRATE-VERIFY ?auto_11921 ?auto_11922 ?auto_11923 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11930 - SURFACE
      ?auto_11931 - SURFACE
      ?auto_11932 - SURFACE
      ?auto_11933 - SURFACE
    )
    :vars
    (
      ?auto_11934 - HOIST
      ?auto_11936 - PLACE
      ?auto_11938 - PLACE
      ?auto_11937 - HOIST
      ?auto_11935 - SURFACE
      ?auto_11939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11934 ?auto_11936 ) ( IS-CRATE ?auto_11933 ) ( not ( = ?auto_11932 ?auto_11933 ) ) ( not ( = ?auto_11931 ?auto_11932 ) ) ( not ( = ?auto_11931 ?auto_11933 ) ) ( not ( = ?auto_11938 ?auto_11936 ) ) ( HOIST-AT ?auto_11937 ?auto_11938 ) ( not ( = ?auto_11934 ?auto_11937 ) ) ( AVAILABLE ?auto_11937 ) ( SURFACE-AT ?auto_11933 ?auto_11938 ) ( ON ?auto_11933 ?auto_11935 ) ( CLEAR ?auto_11933 ) ( not ( = ?auto_11932 ?auto_11935 ) ) ( not ( = ?auto_11933 ?auto_11935 ) ) ( not ( = ?auto_11931 ?auto_11935 ) ) ( TRUCK-AT ?auto_11939 ?auto_11936 ) ( SURFACE-AT ?auto_11931 ?auto_11936 ) ( CLEAR ?auto_11931 ) ( IS-CRATE ?auto_11932 ) ( AVAILABLE ?auto_11934 ) ( IN ?auto_11932 ?auto_11939 ) ( ON ?auto_11931 ?auto_11930 ) ( not ( = ?auto_11930 ?auto_11931 ) ) ( not ( = ?auto_11930 ?auto_11932 ) ) ( not ( = ?auto_11930 ?auto_11933 ) ) ( not ( = ?auto_11930 ?auto_11935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11931 ?auto_11932 ?auto_11933 )
      ( MAKE-3CRATE-VERIFY ?auto_11930 ?auto_11931 ?auto_11932 ?auto_11933 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11940 - SURFACE
      ?auto_11941 - SURFACE
    )
    :vars
    (
      ?auto_11942 - HOIST
      ?auto_11945 - PLACE
      ?auto_11944 - SURFACE
      ?auto_11947 - PLACE
      ?auto_11946 - HOIST
      ?auto_11943 - SURFACE
      ?auto_11948 - TRUCK
      ?auto_11949 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11942 ?auto_11945 ) ( IS-CRATE ?auto_11941 ) ( not ( = ?auto_11940 ?auto_11941 ) ) ( not ( = ?auto_11944 ?auto_11940 ) ) ( not ( = ?auto_11944 ?auto_11941 ) ) ( not ( = ?auto_11947 ?auto_11945 ) ) ( HOIST-AT ?auto_11946 ?auto_11947 ) ( not ( = ?auto_11942 ?auto_11946 ) ) ( AVAILABLE ?auto_11946 ) ( SURFACE-AT ?auto_11941 ?auto_11947 ) ( ON ?auto_11941 ?auto_11943 ) ( CLEAR ?auto_11941 ) ( not ( = ?auto_11940 ?auto_11943 ) ) ( not ( = ?auto_11941 ?auto_11943 ) ) ( not ( = ?auto_11944 ?auto_11943 ) ) ( SURFACE-AT ?auto_11944 ?auto_11945 ) ( CLEAR ?auto_11944 ) ( IS-CRATE ?auto_11940 ) ( AVAILABLE ?auto_11942 ) ( IN ?auto_11940 ?auto_11948 ) ( TRUCK-AT ?auto_11948 ?auto_11949 ) ( not ( = ?auto_11949 ?auto_11945 ) ) ( not ( = ?auto_11947 ?auto_11949 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11948 ?auto_11949 ?auto_11945 )
      ( MAKE-2CRATE ?auto_11944 ?auto_11940 ?auto_11941 )
      ( MAKE-1CRATE-VERIFY ?auto_11940 ?auto_11941 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11950 - SURFACE
      ?auto_11951 - SURFACE
      ?auto_11952 - SURFACE
    )
    :vars
    (
      ?auto_11955 - HOIST
      ?auto_11958 - PLACE
      ?auto_11956 - PLACE
      ?auto_11953 - HOIST
      ?auto_11954 - SURFACE
      ?auto_11957 - TRUCK
      ?auto_11959 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11955 ?auto_11958 ) ( IS-CRATE ?auto_11952 ) ( not ( = ?auto_11951 ?auto_11952 ) ) ( not ( = ?auto_11950 ?auto_11951 ) ) ( not ( = ?auto_11950 ?auto_11952 ) ) ( not ( = ?auto_11956 ?auto_11958 ) ) ( HOIST-AT ?auto_11953 ?auto_11956 ) ( not ( = ?auto_11955 ?auto_11953 ) ) ( AVAILABLE ?auto_11953 ) ( SURFACE-AT ?auto_11952 ?auto_11956 ) ( ON ?auto_11952 ?auto_11954 ) ( CLEAR ?auto_11952 ) ( not ( = ?auto_11951 ?auto_11954 ) ) ( not ( = ?auto_11952 ?auto_11954 ) ) ( not ( = ?auto_11950 ?auto_11954 ) ) ( SURFACE-AT ?auto_11950 ?auto_11958 ) ( CLEAR ?auto_11950 ) ( IS-CRATE ?auto_11951 ) ( AVAILABLE ?auto_11955 ) ( IN ?auto_11951 ?auto_11957 ) ( TRUCK-AT ?auto_11957 ?auto_11959 ) ( not ( = ?auto_11959 ?auto_11958 ) ) ( not ( = ?auto_11956 ?auto_11959 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11951 ?auto_11952 )
      ( MAKE-2CRATE-VERIFY ?auto_11950 ?auto_11951 ?auto_11952 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11960 - SURFACE
      ?auto_11961 - SURFACE
      ?auto_11962 - SURFACE
      ?auto_11963 - SURFACE
    )
    :vars
    (
      ?auto_11968 - HOIST
      ?auto_11967 - PLACE
      ?auto_11969 - PLACE
      ?auto_11964 - HOIST
      ?auto_11970 - SURFACE
      ?auto_11966 - TRUCK
      ?auto_11965 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11968 ?auto_11967 ) ( IS-CRATE ?auto_11963 ) ( not ( = ?auto_11962 ?auto_11963 ) ) ( not ( = ?auto_11961 ?auto_11962 ) ) ( not ( = ?auto_11961 ?auto_11963 ) ) ( not ( = ?auto_11969 ?auto_11967 ) ) ( HOIST-AT ?auto_11964 ?auto_11969 ) ( not ( = ?auto_11968 ?auto_11964 ) ) ( AVAILABLE ?auto_11964 ) ( SURFACE-AT ?auto_11963 ?auto_11969 ) ( ON ?auto_11963 ?auto_11970 ) ( CLEAR ?auto_11963 ) ( not ( = ?auto_11962 ?auto_11970 ) ) ( not ( = ?auto_11963 ?auto_11970 ) ) ( not ( = ?auto_11961 ?auto_11970 ) ) ( SURFACE-AT ?auto_11961 ?auto_11967 ) ( CLEAR ?auto_11961 ) ( IS-CRATE ?auto_11962 ) ( AVAILABLE ?auto_11968 ) ( IN ?auto_11962 ?auto_11966 ) ( TRUCK-AT ?auto_11966 ?auto_11965 ) ( not ( = ?auto_11965 ?auto_11967 ) ) ( not ( = ?auto_11969 ?auto_11965 ) ) ( ON ?auto_11961 ?auto_11960 ) ( not ( = ?auto_11960 ?auto_11961 ) ) ( not ( = ?auto_11960 ?auto_11962 ) ) ( not ( = ?auto_11960 ?auto_11963 ) ) ( not ( = ?auto_11960 ?auto_11970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11961 ?auto_11962 ?auto_11963 )
      ( MAKE-3CRATE-VERIFY ?auto_11960 ?auto_11961 ?auto_11962 ?auto_11963 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11971 - SURFACE
      ?auto_11972 - SURFACE
    )
    :vars
    (
      ?auto_11978 - HOIST
      ?auto_11977 - PLACE
      ?auto_11976 - SURFACE
      ?auto_11979 - PLACE
      ?auto_11973 - HOIST
      ?auto_11980 - SURFACE
      ?auto_11975 - TRUCK
      ?auto_11974 - PLACE
      ?auto_11981 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11978 ?auto_11977 ) ( IS-CRATE ?auto_11972 ) ( not ( = ?auto_11971 ?auto_11972 ) ) ( not ( = ?auto_11976 ?auto_11971 ) ) ( not ( = ?auto_11976 ?auto_11972 ) ) ( not ( = ?auto_11979 ?auto_11977 ) ) ( HOIST-AT ?auto_11973 ?auto_11979 ) ( not ( = ?auto_11978 ?auto_11973 ) ) ( AVAILABLE ?auto_11973 ) ( SURFACE-AT ?auto_11972 ?auto_11979 ) ( ON ?auto_11972 ?auto_11980 ) ( CLEAR ?auto_11972 ) ( not ( = ?auto_11971 ?auto_11980 ) ) ( not ( = ?auto_11972 ?auto_11980 ) ) ( not ( = ?auto_11976 ?auto_11980 ) ) ( SURFACE-AT ?auto_11976 ?auto_11977 ) ( CLEAR ?auto_11976 ) ( IS-CRATE ?auto_11971 ) ( AVAILABLE ?auto_11978 ) ( TRUCK-AT ?auto_11975 ?auto_11974 ) ( not ( = ?auto_11974 ?auto_11977 ) ) ( not ( = ?auto_11979 ?auto_11974 ) ) ( HOIST-AT ?auto_11981 ?auto_11974 ) ( LIFTING ?auto_11981 ?auto_11971 ) ( not ( = ?auto_11978 ?auto_11981 ) ) ( not ( = ?auto_11973 ?auto_11981 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11981 ?auto_11971 ?auto_11975 ?auto_11974 )
      ( MAKE-2CRATE ?auto_11976 ?auto_11971 ?auto_11972 )
      ( MAKE-1CRATE-VERIFY ?auto_11971 ?auto_11972 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11982 - SURFACE
      ?auto_11983 - SURFACE
      ?auto_11984 - SURFACE
    )
    :vars
    (
      ?auto_11987 - HOIST
      ?auto_11991 - PLACE
      ?auto_11985 - PLACE
      ?auto_11988 - HOIST
      ?auto_11992 - SURFACE
      ?auto_11990 - TRUCK
      ?auto_11986 - PLACE
      ?auto_11989 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11987 ?auto_11991 ) ( IS-CRATE ?auto_11984 ) ( not ( = ?auto_11983 ?auto_11984 ) ) ( not ( = ?auto_11982 ?auto_11983 ) ) ( not ( = ?auto_11982 ?auto_11984 ) ) ( not ( = ?auto_11985 ?auto_11991 ) ) ( HOIST-AT ?auto_11988 ?auto_11985 ) ( not ( = ?auto_11987 ?auto_11988 ) ) ( AVAILABLE ?auto_11988 ) ( SURFACE-AT ?auto_11984 ?auto_11985 ) ( ON ?auto_11984 ?auto_11992 ) ( CLEAR ?auto_11984 ) ( not ( = ?auto_11983 ?auto_11992 ) ) ( not ( = ?auto_11984 ?auto_11992 ) ) ( not ( = ?auto_11982 ?auto_11992 ) ) ( SURFACE-AT ?auto_11982 ?auto_11991 ) ( CLEAR ?auto_11982 ) ( IS-CRATE ?auto_11983 ) ( AVAILABLE ?auto_11987 ) ( TRUCK-AT ?auto_11990 ?auto_11986 ) ( not ( = ?auto_11986 ?auto_11991 ) ) ( not ( = ?auto_11985 ?auto_11986 ) ) ( HOIST-AT ?auto_11989 ?auto_11986 ) ( LIFTING ?auto_11989 ?auto_11983 ) ( not ( = ?auto_11987 ?auto_11989 ) ) ( not ( = ?auto_11988 ?auto_11989 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11983 ?auto_11984 )
      ( MAKE-2CRATE-VERIFY ?auto_11982 ?auto_11983 ?auto_11984 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11993 - SURFACE
      ?auto_11994 - SURFACE
      ?auto_11995 - SURFACE
      ?auto_11996 - SURFACE
    )
    :vars
    (
      ?auto_12003 - HOIST
      ?auto_11998 - PLACE
      ?auto_12000 - PLACE
      ?auto_12002 - HOIST
      ?auto_12004 - SURFACE
      ?auto_11999 - TRUCK
      ?auto_11997 - PLACE
      ?auto_12001 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12003 ?auto_11998 ) ( IS-CRATE ?auto_11996 ) ( not ( = ?auto_11995 ?auto_11996 ) ) ( not ( = ?auto_11994 ?auto_11995 ) ) ( not ( = ?auto_11994 ?auto_11996 ) ) ( not ( = ?auto_12000 ?auto_11998 ) ) ( HOIST-AT ?auto_12002 ?auto_12000 ) ( not ( = ?auto_12003 ?auto_12002 ) ) ( AVAILABLE ?auto_12002 ) ( SURFACE-AT ?auto_11996 ?auto_12000 ) ( ON ?auto_11996 ?auto_12004 ) ( CLEAR ?auto_11996 ) ( not ( = ?auto_11995 ?auto_12004 ) ) ( not ( = ?auto_11996 ?auto_12004 ) ) ( not ( = ?auto_11994 ?auto_12004 ) ) ( SURFACE-AT ?auto_11994 ?auto_11998 ) ( CLEAR ?auto_11994 ) ( IS-CRATE ?auto_11995 ) ( AVAILABLE ?auto_12003 ) ( TRUCK-AT ?auto_11999 ?auto_11997 ) ( not ( = ?auto_11997 ?auto_11998 ) ) ( not ( = ?auto_12000 ?auto_11997 ) ) ( HOIST-AT ?auto_12001 ?auto_11997 ) ( LIFTING ?auto_12001 ?auto_11995 ) ( not ( = ?auto_12003 ?auto_12001 ) ) ( not ( = ?auto_12002 ?auto_12001 ) ) ( ON ?auto_11994 ?auto_11993 ) ( not ( = ?auto_11993 ?auto_11994 ) ) ( not ( = ?auto_11993 ?auto_11995 ) ) ( not ( = ?auto_11993 ?auto_11996 ) ) ( not ( = ?auto_11993 ?auto_12004 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11994 ?auto_11995 ?auto_11996 )
      ( MAKE-3CRATE-VERIFY ?auto_11993 ?auto_11994 ?auto_11995 ?auto_11996 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12005 - SURFACE
      ?auto_12006 - SURFACE
    )
    :vars
    (
      ?auto_12014 - HOIST
      ?auto_12009 - PLACE
      ?auto_12007 - SURFACE
      ?auto_12011 - PLACE
      ?auto_12013 - HOIST
      ?auto_12015 - SURFACE
      ?auto_12010 - TRUCK
      ?auto_12008 - PLACE
      ?auto_12012 - HOIST
      ?auto_12016 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12014 ?auto_12009 ) ( IS-CRATE ?auto_12006 ) ( not ( = ?auto_12005 ?auto_12006 ) ) ( not ( = ?auto_12007 ?auto_12005 ) ) ( not ( = ?auto_12007 ?auto_12006 ) ) ( not ( = ?auto_12011 ?auto_12009 ) ) ( HOIST-AT ?auto_12013 ?auto_12011 ) ( not ( = ?auto_12014 ?auto_12013 ) ) ( AVAILABLE ?auto_12013 ) ( SURFACE-AT ?auto_12006 ?auto_12011 ) ( ON ?auto_12006 ?auto_12015 ) ( CLEAR ?auto_12006 ) ( not ( = ?auto_12005 ?auto_12015 ) ) ( not ( = ?auto_12006 ?auto_12015 ) ) ( not ( = ?auto_12007 ?auto_12015 ) ) ( SURFACE-AT ?auto_12007 ?auto_12009 ) ( CLEAR ?auto_12007 ) ( IS-CRATE ?auto_12005 ) ( AVAILABLE ?auto_12014 ) ( TRUCK-AT ?auto_12010 ?auto_12008 ) ( not ( = ?auto_12008 ?auto_12009 ) ) ( not ( = ?auto_12011 ?auto_12008 ) ) ( HOIST-AT ?auto_12012 ?auto_12008 ) ( not ( = ?auto_12014 ?auto_12012 ) ) ( not ( = ?auto_12013 ?auto_12012 ) ) ( AVAILABLE ?auto_12012 ) ( SURFACE-AT ?auto_12005 ?auto_12008 ) ( ON ?auto_12005 ?auto_12016 ) ( CLEAR ?auto_12005 ) ( not ( = ?auto_12005 ?auto_12016 ) ) ( not ( = ?auto_12006 ?auto_12016 ) ) ( not ( = ?auto_12007 ?auto_12016 ) ) ( not ( = ?auto_12015 ?auto_12016 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12012 ?auto_12005 ?auto_12016 ?auto_12008 )
      ( MAKE-2CRATE ?auto_12007 ?auto_12005 ?auto_12006 )
      ( MAKE-1CRATE-VERIFY ?auto_12005 ?auto_12006 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12017 - SURFACE
      ?auto_12018 - SURFACE
      ?auto_12019 - SURFACE
    )
    :vars
    (
      ?auto_12027 - HOIST
      ?auto_12020 - PLACE
      ?auto_12024 - PLACE
      ?auto_12028 - HOIST
      ?auto_12025 - SURFACE
      ?auto_12021 - TRUCK
      ?auto_12022 - PLACE
      ?auto_12026 - HOIST
      ?auto_12023 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12027 ?auto_12020 ) ( IS-CRATE ?auto_12019 ) ( not ( = ?auto_12018 ?auto_12019 ) ) ( not ( = ?auto_12017 ?auto_12018 ) ) ( not ( = ?auto_12017 ?auto_12019 ) ) ( not ( = ?auto_12024 ?auto_12020 ) ) ( HOIST-AT ?auto_12028 ?auto_12024 ) ( not ( = ?auto_12027 ?auto_12028 ) ) ( AVAILABLE ?auto_12028 ) ( SURFACE-AT ?auto_12019 ?auto_12024 ) ( ON ?auto_12019 ?auto_12025 ) ( CLEAR ?auto_12019 ) ( not ( = ?auto_12018 ?auto_12025 ) ) ( not ( = ?auto_12019 ?auto_12025 ) ) ( not ( = ?auto_12017 ?auto_12025 ) ) ( SURFACE-AT ?auto_12017 ?auto_12020 ) ( CLEAR ?auto_12017 ) ( IS-CRATE ?auto_12018 ) ( AVAILABLE ?auto_12027 ) ( TRUCK-AT ?auto_12021 ?auto_12022 ) ( not ( = ?auto_12022 ?auto_12020 ) ) ( not ( = ?auto_12024 ?auto_12022 ) ) ( HOIST-AT ?auto_12026 ?auto_12022 ) ( not ( = ?auto_12027 ?auto_12026 ) ) ( not ( = ?auto_12028 ?auto_12026 ) ) ( AVAILABLE ?auto_12026 ) ( SURFACE-AT ?auto_12018 ?auto_12022 ) ( ON ?auto_12018 ?auto_12023 ) ( CLEAR ?auto_12018 ) ( not ( = ?auto_12018 ?auto_12023 ) ) ( not ( = ?auto_12019 ?auto_12023 ) ) ( not ( = ?auto_12017 ?auto_12023 ) ) ( not ( = ?auto_12025 ?auto_12023 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12018 ?auto_12019 )
      ( MAKE-2CRATE-VERIFY ?auto_12017 ?auto_12018 ?auto_12019 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12029 - SURFACE
      ?auto_12030 - SURFACE
      ?auto_12031 - SURFACE
      ?auto_12032 - SURFACE
    )
    :vars
    (
      ?auto_12036 - HOIST
      ?auto_12037 - PLACE
      ?auto_12040 - PLACE
      ?auto_12041 - HOIST
      ?auto_12034 - SURFACE
      ?auto_12035 - TRUCK
      ?auto_12033 - PLACE
      ?auto_12039 - HOIST
      ?auto_12038 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12036 ?auto_12037 ) ( IS-CRATE ?auto_12032 ) ( not ( = ?auto_12031 ?auto_12032 ) ) ( not ( = ?auto_12030 ?auto_12031 ) ) ( not ( = ?auto_12030 ?auto_12032 ) ) ( not ( = ?auto_12040 ?auto_12037 ) ) ( HOIST-AT ?auto_12041 ?auto_12040 ) ( not ( = ?auto_12036 ?auto_12041 ) ) ( AVAILABLE ?auto_12041 ) ( SURFACE-AT ?auto_12032 ?auto_12040 ) ( ON ?auto_12032 ?auto_12034 ) ( CLEAR ?auto_12032 ) ( not ( = ?auto_12031 ?auto_12034 ) ) ( not ( = ?auto_12032 ?auto_12034 ) ) ( not ( = ?auto_12030 ?auto_12034 ) ) ( SURFACE-AT ?auto_12030 ?auto_12037 ) ( CLEAR ?auto_12030 ) ( IS-CRATE ?auto_12031 ) ( AVAILABLE ?auto_12036 ) ( TRUCK-AT ?auto_12035 ?auto_12033 ) ( not ( = ?auto_12033 ?auto_12037 ) ) ( not ( = ?auto_12040 ?auto_12033 ) ) ( HOIST-AT ?auto_12039 ?auto_12033 ) ( not ( = ?auto_12036 ?auto_12039 ) ) ( not ( = ?auto_12041 ?auto_12039 ) ) ( AVAILABLE ?auto_12039 ) ( SURFACE-AT ?auto_12031 ?auto_12033 ) ( ON ?auto_12031 ?auto_12038 ) ( CLEAR ?auto_12031 ) ( not ( = ?auto_12031 ?auto_12038 ) ) ( not ( = ?auto_12032 ?auto_12038 ) ) ( not ( = ?auto_12030 ?auto_12038 ) ) ( not ( = ?auto_12034 ?auto_12038 ) ) ( ON ?auto_12030 ?auto_12029 ) ( not ( = ?auto_12029 ?auto_12030 ) ) ( not ( = ?auto_12029 ?auto_12031 ) ) ( not ( = ?auto_12029 ?auto_12032 ) ) ( not ( = ?auto_12029 ?auto_12034 ) ) ( not ( = ?auto_12029 ?auto_12038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12030 ?auto_12031 ?auto_12032 )
      ( MAKE-3CRATE-VERIFY ?auto_12029 ?auto_12030 ?auto_12031 ?auto_12032 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12042 - SURFACE
      ?auto_12043 - SURFACE
    )
    :vars
    (
      ?auto_12047 - HOIST
      ?auto_12049 - PLACE
      ?auto_12048 - SURFACE
      ?auto_12052 - PLACE
      ?auto_12053 - HOIST
      ?auto_12045 - SURFACE
      ?auto_12044 - PLACE
      ?auto_12051 - HOIST
      ?auto_12050 - SURFACE
      ?auto_12046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12047 ?auto_12049 ) ( IS-CRATE ?auto_12043 ) ( not ( = ?auto_12042 ?auto_12043 ) ) ( not ( = ?auto_12048 ?auto_12042 ) ) ( not ( = ?auto_12048 ?auto_12043 ) ) ( not ( = ?auto_12052 ?auto_12049 ) ) ( HOIST-AT ?auto_12053 ?auto_12052 ) ( not ( = ?auto_12047 ?auto_12053 ) ) ( AVAILABLE ?auto_12053 ) ( SURFACE-AT ?auto_12043 ?auto_12052 ) ( ON ?auto_12043 ?auto_12045 ) ( CLEAR ?auto_12043 ) ( not ( = ?auto_12042 ?auto_12045 ) ) ( not ( = ?auto_12043 ?auto_12045 ) ) ( not ( = ?auto_12048 ?auto_12045 ) ) ( SURFACE-AT ?auto_12048 ?auto_12049 ) ( CLEAR ?auto_12048 ) ( IS-CRATE ?auto_12042 ) ( AVAILABLE ?auto_12047 ) ( not ( = ?auto_12044 ?auto_12049 ) ) ( not ( = ?auto_12052 ?auto_12044 ) ) ( HOIST-AT ?auto_12051 ?auto_12044 ) ( not ( = ?auto_12047 ?auto_12051 ) ) ( not ( = ?auto_12053 ?auto_12051 ) ) ( AVAILABLE ?auto_12051 ) ( SURFACE-AT ?auto_12042 ?auto_12044 ) ( ON ?auto_12042 ?auto_12050 ) ( CLEAR ?auto_12042 ) ( not ( = ?auto_12042 ?auto_12050 ) ) ( not ( = ?auto_12043 ?auto_12050 ) ) ( not ( = ?auto_12048 ?auto_12050 ) ) ( not ( = ?auto_12045 ?auto_12050 ) ) ( TRUCK-AT ?auto_12046 ?auto_12049 ) )
    :subtasks
    ( ( !DRIVE ?auto_12046 ?auto_12049 ?auto_12044 )
      ( MAKE-2CRATE ?auto_12048 ?auto_12042 ?auto_12043 )
      ( MAKE-1CRATE-VERIFY ?auto_12042 ?auto_12043 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12054 - SURFACE
      ?auto_12055 - SURFACE
      ?auto_12056 - SURFACE
    )
    :vars
    (
      ?auto_12060 - HOIST
      ?auto_12058 - PLACE
      ?auto_12057 - PLACE
      ?auto_12065 - HOIST
      ?auto_12061 - SURFACE
      ?auto_12059 - PLACE
      ?auto_12063 - HOIST
      ?auto_12062 - SURFACE
      ?auto_12064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12060 ?auto_12058 ) ( IS-CRATE ?auto_12056 ) ( not ( = ?auto_12055 ?auto_12056 ) ) ( not ( = ?auto_12054 ?auto_12055 ) ) ( not ( = ?auto_12054 ?auto_12056 ) ) ( not ( = ?auto_12057 ?auto_12058 ) ) ( HOIST-AT ?auto_12065 ?auto_12057 ) ( not ( = ?auto_12060 ?auto_12065 ) ) ( AVAILABLE ?auto_12065 ) ( SURFACE-AT ?auto_12056 ?auto_12057 ) ( ON ?auto_12056 ?auto_12061 ) ( CLEAR ?auto_12056 ) ( not ( = ?auto_12055 ?auto_12061 ) ) ( not ( = ?auto_12056 ?auto_12061 ) ) ( not ( = ?auto_12054 ?auto_12061 ) ) ( SURFACE-AT ?auto_12054 ?auto_12058 ) ( CLEAR ?auto_12054 ) ( IS-CRATE ?auto_12055 ) ( AVAILABLE ?auto_12060 ) ( not ( = ?auto_12059 ?auto_12058 ) ) ( not ( = ?auto_12057 ?auto_12059 ) ) ( HOIST-AT ?auto_12063 ?auto_12059 ) ( not ( = ?auto_12060 ?auto_12063 ) ) ( not ( = ?auto_12065 ?auto_12063 ) ) ( AVAILABLE ?auto_12063 ) ( SURFACE-AT ?auto_12055 ?auto_12059 ) ( ON ?auto_12055 ?auto_12062 ) ( CLEAR ?auto_12055 ) ( not ( = ?auto_12055 ?auto_12062 ) ) ( not ( = ?auto_12056 ?auto_12062 ) ) ( not ( = ?auto_12054 ?auto_12062 ) ) ( not ( = ?auto_12061 ?auto_12062 ) ) ( TRUCK-AT ?auto_12064 ?auto_12058 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12055 ?auto_12056 )
      ( MAKE-2CRATE-VERIFY ?auto_12054 ?auto_12055 ?auto_12056 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12066 - SURFACE
      ?auto_12067 - SURFACE
      ?auto_12068 - SURFACE
      ?auto_12069 - SURFACE
    )
    :vars
    (
      ?auto_12077 - HOIST
      ?auto_12075 - PLACE
      ?auto_12078 - PLACE
      ?auto_12076 - HOIST
      ?auto_12072 - SURFACE
      ?auto_12073 - PLACE
      ?auto_12074 - HOIST
      ?auto_12071 - SURFACE
      ?auto_12070 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12077 ?auto_12075 ) ( IS-CRATE ?auto_12069 ) ( not ( = ?auto_12068 ?auto_12069 ) ) ( not ( = ?auto_12067 ?auto_12068 ) ) ( not ( = ?auto_12067 ?auto_12069 ) ) ( not ( = ?auto_12078 ?auto_12075 ) ) ( HOIST-AT ?auto_12076 ?auto_12078 ) ( not ( = ?auto_12077 ?auto_12076 ) ) ( AVAILABLE ?auto_12076 ) ( SURFACE-AT ?auto_12069 ?auto_12078 ) ( ON ?auto_12069 ?auto_12072 ) ( CLEAR ?auto_12069 ) ( not ( = ?auto_12068 ?auto_12072 ) ) ( not ( = ?auto_12069 ?auto_12072 ) ) ( not ( = ?auto_12067 ?auto_12072 ) ) ( SURFACE-AT ?auto_12067 ?auto_12075 ) ( CLEAR ?auto_12067 ) ( IS-CRATE ?auto_12068 ) ( AVAILABLE ?auto_12077 ) ( not ( = ?auto_12073 ?auto_12075 ) ) ( not ( = ?auto_12078 ?auto_12073 ) ) ( HOIST-AT ?auto_12074 ?auto_12073 ) ( not ( = ?auto_12077 ?auto_12074 ) ) ( not ( = ?auto_12076 ?auto_12074 ) ) ( AVAILABLE ?auto_12074 ) ( SURFACE-AT ?auto_12068 ?auto_12073 ) ( ON ?auto_12068 ?auto_12071 ) ( CLEAR ?auto_12068 ) ( not ( = ?auto_12068 ?auto_12071 ) ) ( not ( = ?auto_12069 ?auto_12071 ) ) ( not ( = ?auto_12067 ?auto_12071 ) ) ( not ( = ?auto_12072 ?auto_12071 ) ) ( TRUCK-AT ?auto_12070 ?auto_12075 ) ( ON ?auto_12067 ?auto_12066 ) ( not ( = ?auto_12066 ?auto_12067 ) ) ( not ( = ?auto_12066 ?auto_12068 ) ) ( not ( = ?auto_12066 ?auto_12069 ) ) ( not ( = ?auto_12066 ?auto_12072 ) ) ( not ( = ?auto_12066 ?auto_12071 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12067 ?auto_12068 ?auto_12069 )
      ( MAKE-3CRATE-VERIFY ?auto_12066 ?auto_12067 ?auto_12068 ?auto_12069 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12079 - SURFACE
      ?auto_12080 - SURFACE
    )
    :vars
    (
      ?auto_12089 - HOIST
      ?auto_12087 - PLACE
      ?auto_12082 - SURFACE
      ?auto_12090 - PLACE
      ?auto_12088 - HOIST
      ?auto_12084 - SURFACE
      ?auto_12085 - PLACE
      ?auto_12086 - HOIST
      ?auto_12083 - SURFACE
      ?auto_12081 - TRUCK
      ?auto_12091 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12089 ?auto_12087 ) ( IS-CRATE ?auto_12080 ) ( not ( = ?auto_12079 ?auto_12080 ) ) ( not ( = ?auto_12082 ?auto_12079 ) ) ( not ( = ?auto_12082 ?auto_12080 ) ) ( not ( = ?auto_12090 ?auto_12087 ) ) ( HOIST-AT ?auto_12088 ?auto_12090 ) ( not ( = ?auto_12089 ?auto_12088 ) ) ( AVAILABLE ?auto_12088 ) ( SURFACE-AT ?auto_12080 ?auto_12090 ) ( ON ?auto_12080 ?auto_12084 ) ( CLEAR ?auto_12080 ) ( not ( = ?auto_12079 ?auto_12084 ) ) ( not ( = ?auto_12080 ?auto_12084 ) ) ( not ( = ?auto_12082 ?auto_12084 ) ) ( IS-CRATE ?auto_12079 ) ( not ( = ?auto_12085 ?auto_12087 ) ) ( not ( = ?auto_12090 ?auto_12085 ) ) ( HOIST-AT ?auto_12086 ?auto_12085 ) ( not ( = ?auto_12089 ?auto_12086 ) ) ( not ( = ?auto_12088 ?auto_12086 ) ) ( AVAILABLE ?auto_12086 ) ( SURFACE-AT ?auto_12079 ?auto_12085 ) ( ON ?auto_12079 ?auto_12083 ) ( CLEAR ?auto_12079 ) ( not ( = ?auto_12079 ?auto_12083 ) ) ( not ( = ?auto_12080 ?auto_12083 ) ) ( not ( = ?auto_12082 ?auto_12083 ) ) ( not ( = ?auto_12084 ?auto_12083 ) ) ( TRUCK-AT ?auto_12081 ?auto_12087 ) ( SURFACE-AT ?auto_12091 ?auto_12087 ) ( CLEAR ?auto_12091 ) ( LIFTING ?auto_12089 ?auto_12082 ) ( IS-CRATE ?auto_12082 ) ( not ( = ?auto_12091 ?auto_12082 ) ) ( not ( = ?auto_12079 ?auto_12091 ) ) ( not ( = ?auto_12080 ?auto_12091 ) ) ( not ( = ?auto_12084 ?auto_12091 ) ) ( not ( = ?auto_12083 ?auto_12091 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12091 ?auto_12082 )
      ( MAKE-2CRATE ?auto_12082 ?auto_12079 ?auto_12080 )
      ( MAKE-1CRATE-VERIFY ?auto_12079 ?auto_12080 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12092 - SURFACE
      ?auto_12093 - SURFACE
      ?auto_12094 - SURFACE
    )
    :vars
    (
      ?auto_12097 - HOIST
      ?auto_12100 - PLACE
      ?auto_12099 - PLACE
      ?auto_12104 - HOIST
      ?auto_12103 - SURFACE
      ?auto_12096 - PLACE
      ?auto_12101 - HOIST
      ?auto_12095 - SURFACE
      ?auto_12098 - TRUCK
      ?auto_12102 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12097 ?auto_12100 ) ( IS-CRATE ?auto_12094 ) ( not ( = ?auto_12093 ?auto_12094 ) ) ( not ( = ?auto_12092 ?auto_12093 ) ) ( not ( = ?auto_12092 ?auto_12094 ) ) ( not ( = ?auto_12099 ?auto_12100 ) ) ( HOIST-AT ?auto_12104 ?auto_12099 ) ( not ( = ?auto_12097 ?auto_12104 ) ) ( AVAILABLE ?auto_12104 ) ( SURFACE-AT ?auto_12094 ?auto_12099 ) ( ON ?auto_12094 ?auto_12103 ) ( CLEAR ?auto_12094 ) ( not ( = ?auto_12093 ?auto_12103 ) ) ( not ( = ?auto_12094 ?auto_12103 ) ) ( not ( = ?auto_12092 ?auto_12103 ) ) ( IS-CRATE ?auto_12093 ) ( not ( = ?auto_12096 ?auto_12100 ) ) ( not ( = ?auto_12099 ?auto_12096 ) ) ( HOIST-AT ?auto_12101 ?auto_12096 ) ( not ( = ?auto_12097 ?auto_12101 ) ) ( not ( = ?auto_12104 ?auto_12101 ) ) ( AVAILABLE ?auto_12101 ) ( SURFACE-AT ?auto_12093 ?auto_12096 ) ( ON ?auto_12093 ?auto_12095 ) ( CLEAR ?auto_12093 ) ( not ( = ?auto_12093 ?auto_12095 ) ) ( not ( = ?auto_12094 ?auto_12095 ) ) ( not ( = ?auto_12092 ?auto_12095 ) ) ( not ( = ?auto_12103 ?auto_12095 ) ) ( TRUCK-AT ?auto_12098 ?auto_12100 ) ( SURFACE-AT ?auto_12102 ?auto_12100 ) ( CLEAR ?auto_12102 ) ( LIFTING ?auto_12097 ?auto_12092 ) ( IS-CRATE ?auto_12092 ) ( not ( = ?auto_12102 ?auto_12092 ) ) ( not ( = ?auto_12093 ?auto_12102 ) ) ( not ( = ?auto_12094 ?auto_12102 ) ) ( not ( = ?auto_12103 ?auto_12102 ) ) ( not ( = ?auto_12095 ?auto_12102 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12093 ?auto_12094 )
      ( MAKE-2CRATE-VERIFY ?auto_12092 ?auto_12093 ?auto_12094 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12105 - SURFACE
      ?auto_12106 - SURFACE
      ?auto_12107 - SURFACE
      ?auto_12108 - SURFACE
    )
    :vars
    (
      ?auto_12112 - HOIST
      ?auto_12113 - PLACE
      ?auto_12114 - PLACE
      ?auto_12115 - HOIST
      ?auto_12110 - SURFACE
      ?auto_12117 - PLACE
      ?auto_12109 - HOIST
      ?auto_12111 - SURFACE
      ?auto_12116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12112 ?auto_12113 ) ( IS-CRATE ?auto_12108 ) ( not ( = ?auto_12107 ?auto_12108 ) ) ( not ( = ?auto_12106 ?auto_12107 ) ) ( not ( = ?auto_12106 ?auto_12108 ) ) ( not ( = ?auto_12114 ?auto_12113 ) ) ( HOIST-AT ?auto_12115 ?auto_12114 ) ( not ( = ?auto_12112 ?auto_12115 ) ) ( AVAILABLE ?auto_12115 ) ( SURFACE-AT ?auto_12108 ?auto_12114 ) ( ON ?auto_12108 ?auto_12110 ) ( CLEAR ?auto_12108 ) ( not ( = ?auto_12107 ?auto_12110 ) ) ( not ( = ?auto_12108 ?auto_12110 ) ) ( not ( = ?auto_12106 ?auto_12110 ) ) ( IS-CRATE ?auto_12107 ) ( not ( = ?auto_12117 ?auto_12113 ) ) ( not ( = ?auto_12114 ?auto_12117 ) ) ( HOIST-AT ?auto_12109 ?auto_12117 ) ( not ( = ?auto_12112 ?auto_12109 ) ) ( not ( = ?auto_12115 ?auto_12109 ) ) ( AVAILABLE ?auto_12109 ) ( SURFACE-AT ?auto_12107 ?auto_12117 ) ( ON ?auto_12107 ?auto_12111 ) ( CLEAR ?auto_12107 ) ( not ( = ?auto_12107 ?auto_12111 ) ) ( not ( = ?auto_12108 ?auto_12111 ) ) ( not ( = ?auto_12106 ?auto_12111 ) ) ( not ( = ?auto_12110 ?auto_12111 ) ) ( TRUCK-AT ?auto_12116 ?auto_12113 ) ( SURFACE-AT ?auto_12105 ?auto_12113 ) ( CLEAR ?auto_12105 ) ( LIFTING ?auto_12112 ?auto_12106 ) ( IS-CRATE ?auto_12106 ) ( not ( = ?auto_12105 ?auto_12106 ) ) ( not ( = ?auto_12107 ?auto_12105 ) ) ( not ( = ?auto_12108 ?auto_12105 ) ) ( not ( = ?auto_12110 ?auto_12105 ) ) ( not ( = ?auto_12111 ?auto_12105 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12106 ?auto_12107 ?auto_12108 )
      ( MAKE-3CRATE-VERIFY ?auto_12105 ?auto_12106 ?auto_12107 ?auto_12108 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12118 - SURFACE
      ?auto_12119 - SURFACE
    )
    :vars
    (
      ?auto_12123 - HOIST
      ?auto_12125 - PLACE
      ?auto_12127 - SURFACE
      ?auto_12126 - PLACE
      ?auto_12128 - HOIST
      ?auto_12121 - SURFACE
      ?auto_12130 - PLACE
      ?auto_12120 - HOIST
      ?auto_12122 - SURFACE
      ?auto_12129 - TRUCK
      ?auto_12124 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12123 ?auto_12125 ) ( IS-CRATE ?auto_12119 ) ( not ( = ?auto_12118 ?auto_12119 ) ) ( not ( = ?auto_12127 ?auto_12118 ) ) ( not ( = ?auto_12127 ?auto_12119 ) ) ( not ( = ?auto_12126 ?auto_12125 ) ) ( HOIST-AT ?auto_12128 ?auto_12126 ) ( not ( = ?auto_12123 ?auto_12128 ) ) ( AVAILABLE ?auto_12128 ) ( SURFACE-AT ?auto_12119 ?auto_12126 ) ( ON ?auto_12119 ?auto_12121 ) ( CLEAR ?auto_12119 ) ( not ( = ?auto_12118 ?auto_12121 ) ) ( not ( = ?auto_12119 ?auto_12121 ) ) ( not ( = ?auto_12127 ?auto_12121 ) ) ( IS-CRATE ?auto_12118 ) ( not ( = ?auto_12130 ?auto_12125 ) ) ( not ( = ?auto_12126 ?auto_12130 ) ) ( HOIST-AT ?auto_12120 ?auto_12130 ) ( not ( = ?auto_12123 ?auto_12120 ) ) ( not ( = ?auto_12128 ?auto_12120 ) ) ( AVAILABLE ?auto_12120 ) ( SURFACE-AT ?auto_12118 ?auto_12130 ) ( ON ?auto_12118 ?auto_12122 ) ( CLEAR ?auto_12118 ) ( not ( = ?auto_12118 ?auto_12122 ) ) ( not ( = ?auto_12119 ?auto_12122 ) ) ( not ( = ?auto_12127 ?auto_12122 ) ) ( not ( = ?auto_12121 ?auto_12122 ) ) ( TRUCK-AT ?auto_12129 ?auto_12125 ) ( SURFACE-AT ?auto_12124 ?auto_12125 ) ( CLEAR ?auto_12124 ) ( IS-CRATE ?auto_12127 ) ( not ( = ?auto_12124 ?auto_12127 ) ) ( not ( = ?auto_12118 ?auto_12124 ) ) ( not ( = ?auto_12119 ?auto_12124 ) ) ( not ( = ?auto_12121 ?auto_12124 ) ) ( not ( = ?auto_12122 ?auto_12124 ) ) ( AVAILABLE ?auto_12123 ) ( IN ?auto_12127 ?auto_12129 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12123 ?auto_12127 ?auto_12129 ?auto_12125 )
      ( MAKE-2CRATE ?auto_12127 ?auto_12118 ?auto_12119 )
      ( MAKE-1CRATE-VERIFY ?auto_12118 ?auto_12119 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12131 - SURFACE
      ?auto_12132 - SURFACE
      ?auto_12133 - SURFACE
    )
    :vars
    (
      ?auto_12140 - HOIST
      ?auto_12141 - PLACE
      ?auto_12143 - PLACE
      ?auto_12137 - HOIST
      ?auto_12142 - SURFACE
      ?auto_12136 - PLACE
      ?auto_12134 - HOIST
      ?auto_12138 - SURFACE
      ?auto_12135 - TRUCK
      ?auto_12139 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12140 ?auto_12141 ) ( IS-CRATE ?auto_12133 ) ( not ( = ?auto_12132 ?auto_12133 ) ) ( not ( = ?auto_12131 ?auto_12132 ) ) ( not ( = ?auto_12131 ?auto_12133 ) ) ( not ( = ?auto_12143 ?auto_12141 ) ) ( HOIST-AT ?auto_12137 ?auto_12143 ) ( not ( = ?auto_12140 ?auto_12137 ) ) ( AVAILABLE ?auto_12137 ) ( SURFACE-AT ?auto_12133 ?auto_12143 ) ( ON ?auto_12133 ?auto_12142 ) ( CLEAR ?auto_12133 ) ( not ( = ?auto_12132 ?auto_12142 ) ) ( not ( = ?auto_12133 ?auto_12142 ) ) ( not ( = ?auto_12131 ?auto_12142 ) ) ( IS-CRATE ?auto_12132 ) ( not ( = ?auto_12136 ?auto_12141 ) ) ( not ( = ?auto_12143 ?auto_12136 ) ) ( HOIST-AT ?auto_12134 ?auto_12136 ) ( not ( = ?auto_12140 ?auto_12134 ) ) ( not ( = ?auto_12137 ?auto_12134 ) ) ( AVAILABLE ?auto_12134 ) ( SURFACE-AT ?auto_12132 ?auto_12136 ) ( ON ?auto_12132 ?auto_12138 ) ( CLEAR ?auto_12132 ) ( not ( = ?auto_12132 ?auto_12138 ) ) ( not ( = ?auto_12133 ?auto_12138 ) ) ( not ( = ?auto_12131 ?auto_12138 ) ) ( not ( = ?auto_12142 ?auto_12138 ) ) ( TRUCK-AT ?auto_12135 ?auto_12141 ) ( SURFACE-AT ?auto_12139 ?auto_12141 ) ( CLEAR ?auto_12139 ) ( IS-CRATE ?auto_12131 ) ( not ( = ?auto_12139 ?auto_12131 ) ) ( not ( = ?auto_12132 ?auto_12139 ) ) ( not ( = ?auto_12133 ?auto_12139 ) ) ( not ( = ?auto_12142 ?auto_12139 ) ) ( not ( = ?auto_12138 ?auto_12139 ) ) ( AVAILABLE ?auto_12140 ) ( IN ?auto_12131 ?auto_12135 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12132 ?auto_12133 )
      ( MAKE-2CRATE-VERIFY ?auto_12131 ?auto_12132 ?auto_12133 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12144 - SURFACE
      ?auto_12145 - SURFACE
      ?auto_12146 - SURFACE
      ?auto_12147 - SURFACE
    )
    :vars
    (
      ?auto_12153 - HOIST
      ?auto_12151 - PLACE
      ?auto_12150 - PLACE
      ?auto_12156 - HOIST
      ?auto_12155 - SURFACE
      ?auto_12154 - PLACE
      ?auto_12152 - HOIST
      ?auto_12149 - SURFACE
      ?auto_12148 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12153 ?auto_12151 ) ( IS-CRATE ?auto_12147 ) ( not ( = ?auto_12146 ?auto_12147 ) ) ( not ( = ?auto_12145 ?auto_12146 ) ) ( not ( = ?auto_12145 ?auto_12147 ) ) ( not ( = ?auto_12150 ?auto_12151 ) ) ( HOIST-AT ?auto_12156 ?auto_12150 ) ( not ( = ?auto_12153 ?auto_12156 ) ) ( AVAILABLE ?auto_12156 ) ( SURFACE-AT ?auto_12147 ?auto_12150 ) ( ON ?auto_12147 ?auto_12155 ) ( CLEAR ?auto_12147 ) ( not ( = ?auto_12146 ?auto_12155 ) ) ( not ( = ?auto_12147 ?auto_12155 ) ) ( not ( = ?auto_12145 ?auto_12155 ) ) ( IS-CRATE ?auto_12146 ) ( not ( = ?auto_12154 ?auto_12151 ) ) ( not ( = ?auto_12150 ?auto_12154 ) ) ( HOIST-AT ?auto_12152 ?auto_12154 ) ( not ( = ?auto_12153 ?auto_12152 ) ) ( not ( = ?auto_12156 ?auto_12152 ) ) ( AVAILABLE ?auto_12152 ) ( SURFACE-AT ?auto_12146 ?auto_12154 ) ( ON ?auto_12146 ?auto_12149 ) ( CLEAR ?auto_12146 ) ( not ( = ?auto_12146 ?auto_12149 ) ) ( not ( = ?auto_12147 ?auto_12149 ) ) ( not ( = ?auto_12145 ?auto_12149 ) ) ( not ( = ?auto_12155 ?auto_12149 ) ) ( TRUCK-AT ?auto_12148 ?auto_12151 ) ( SURFACE-AT ?auto_12144 ?auto_12151 ) ( CLEAR ?auto_12144 ) ( IS-CRATE ?auto_12145 ) ( not ( = ?auto_12144 ?auto_12145 ) ) ( not ( = ?auto_12146 ?auto_12144 ) ) ( not ( = ?auto_12147 ?auto_12144 ) ) ( not ( = ?auto_12155 ?auto_12144 ) ) ( not ( = ?auto_12149 ?auto_12144 ) ) ( AVAILABLE ?auto_12153 ) ( IN ?auto_12145 ?auto_12148 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12145 ?auto_12146 ?auto_12147 )
      ( MAKE-3CRATE-VERIFY ?auto_12144 ?auto_12145 ?auto_12146 ?auto_12147 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12157 - SURFACE
      ?auto_12158 - SURFACE
    )
    :vars
    (
      ?auto_12166 - HOIST
      ?auto_12164 - PLACE
      ?auto_12161 - SURFACE
      ?auto_12163 - PLACE
      ?auto_12169 - HOIST
      ?auto_12168 - SURFACE
      ?auto_12167 - PLACE
      ?auto_12165 - HOIST
      ?auto_12162 - SURFACE
      ?auto_12159 - SURFACE
      ?auto_12160 - TRUCK
      ?auto_12170 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12166 ?auto_12164 ) ( IS-CRATE ?auto_12158 ) ( not ( = ?auto_12157 ?auto_12158 ) ) ( not ( = ?auto_12161 ?auto_12157 ) ) ( not ( = ?auto_12161 ?auto_12158 ) ) ( not ( = ?auto_12163 ?auto_12164 ) ) ( HOIST-AT ?auto_12169 ?auto_12163 ) ( not ( = ?auto_12166 ?auto_12169 ) ) ( AVAILABLE ?auto_12169 ) ( SURFACE-AT ?auto_12158 ?auto_12163 ) ( ON ?auto_12158 ?auto_12168 ) ( CLEAR ?auto_12158 ) ( not ( = ?auto_12157 ?auto_12168 ) ) ( not ( = ?auto_12158 ?auto_12168 ) ) ( not ( = ?auto_12161 ?auto_12168 ) ) ( IS-CRATE ?auto_12157 ) ( not ( = ?auto_12167 ?auto_12164 ) ) ( not ( = ?auto_12163 ?auto_12167 ) ) ( HOIST-AT ?auto_12165 ?auto_12167 ) ( not ( = ?auto_12166 ?auto_12165 ) ) ( not ( = ?auto_12169 ?auto_12165 ) ) ( AVAILABLE ?auto_12165 ) ( SURFACE-AT ?auto_12157 ?auto_12167 ) ( ON ?auto_12157 ?auto_12162 ) ( CLEAR ?auto_12157 ) ( not ( = ?auto_12157 ?auto_12162 ) ) ( not ( = ?auto_12158 ?auto_12162 ) ) ( not ( = ?auto_12161 ?auto_12162 ) ) ( not ( = ?auto_12168 ?auto_12162 ) ) ( SURFACE-AT ?auto_12159 ?auto_12164 ) ( CLEAR ?auto_12159 ) ( IS-CRATE ?auto_12161 ) ( not ( = ?auto_12159 ?auto_12161 ) ) ( not ( = ?auto_12157 ?auto_12159 ) ) ( not ( = ?auto_12158 ?auto_12159 ) ) ( not ( = ?auto_12168 ?auto_12159 ) ) ( not ( = ?auto_12162 ?auto_12159 ) ) ( AVAILABLE ?auto_12166 ) ( IN ?auto_12161 ?auto_12160 ) ( TRUCK-AT ?auto_12160 ?auto_12170 ) ( not ( = ?auto_12170 ?auto_12164 ) ) ( not ( = ?auto_12163 ?auto_12170 ) ) ( not ( = ?auto_12167 ?auto_12170 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12160 ?auto_12170 ?auto_12164 )
      ( MAKE-2CRATE ?auto_12161 ?auto_12157 ?auto_12158 )
      ( MAKE-1CRATE-VERIFY ?auto_12157 ?auto_12158 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12171 - SURFACE
      ?auto_12172 - SURFACE
      ?auto_12173 - SURFACE
    )
    :vars
    (
      ?auto_12176 - HOIST
      ?auto_12179 - PLACE
      ?auto_12180 - PLACE
      ?auto_12178 - HOIST
      ?auto_12184 - SURFACE
      ?auto_12183 - PLACE
      ?auto_12182 - HOIST
      ?auto_12181 - SURFACE
      ?auto_12177 - SURFACE
      ?auto_12174 - TRUCK
      ?auto_12175 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12176 ?auto_12179 ) ( IS-CRATE ?auto_12173 ) ( not ( = ?auto_12172 ?auto_12173 ) ) ( not ( = ?auto_12171 ?auto_12172 ) ) ( not ( = ?auto_12171 ?auto_12173 ) ) ( not ( = ?auto_12180 ?auto_12179 ) ) ( HOIST-AT ?auto_12178 ?auto_12180 ) ( not ( = ?auto_12176 ?auto_12178 ) ) ( AVAILABLE ?auto_12178 ) ( SURFACE-AT ?auto_12173 ?auto_12180 ) ( ON ?auto_12173 ?auto_12184 ) ( CLEAR ?auto_12173 ) ( not ( = ?auto_12172 ?auto_12184 ) ) ( not ( = ?auto_12173 ?auto_12184 ) ) ( not ( = ?auto_12171 ?auto_12184 ) ) ( IS-CRATE ?auto_12172 ) ( not ( = ?auto_12183 ?auto_12179 ) ) ( not ( = ?auto_12180 ?auto_12183 ) ) ( HOIST-AT ?auto_12182 ?auto_12183 ) ( not ( = ?auto_12176 ?auto_12182 ) ) ( not ( = ?auto_12178 ?auto_12182 ) ) ( AVAILABLE ?auto_12182 ) ( SURFACE-AT ?auto_12172 ?auto_12183 ) ( ON ?auto_12172 ?auto_12181 ) ( CLEAR ?auto_12172 ) ( not ( = ?auto_12172 ?auto_12181 ) ) ( not ( = ?auto_12173 ?auto_12181 ) ) ( not ( = ?auto_12171 ?auto_12181 ) ) ( not ( = ?auto_12184 ?auto_12181 ) ) ( SURFACE-AT ?auto_12177 ?auto_12179 ) ( CLEAR ?auto_12177 ) ( IS-CRATE ?auto_12171 ) ( not ( = ?auto_12177 ?auto_12171 ) ) ( not ( = ?auto_12172 ?auto_12177 ) ) ( not ( = ?auto_12173 ?auto_12177 ) ) ( not ( = ?auto_12184 ?auto_12177 ) ) ( not ( = ?auto_12181 ?auto_12177 ) ) ( AVAILABLE ?auto_12176 ) ( IN ?auto_12171 ?auto_12174 ) ( TRUCK-AT ?auto_12174 ?auto_12175 ) ( not ( = ?auto_12175 ?auto_12179 ) ) ( not ( = ?auto_12180 ?auto_12175 ) ) ( not ( = ?auto_12183 ?auto_12175 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12172 ?auto_12173 )
      ( MAKE-2CRATE-VERIFY ?auto_12171 ?auto_12172 ?auto_12173 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12185 - SURFACE
      ?auto_12186 - SURFACE
      ?auto_12187 - SURFACE
      ?auto_12188 - SURFACE
    )
    :vars
    (
      ?auto_12192 - HOIST
      ?auto_12193 - PLACE
      ?auto_12189 - PLACE
      ?auto_12191 - HOIST
      ?auto_12194 - SURFACE
      ?auto_12197 - PLACE
      ?auto_12195 - HOIST
      ?auto_12190 - SURFACE
      ?auto_12196 - TRUCK
      ?auto_12198 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12192 ?auto_12193 ) ( IS-CRATE ?auto_12188 ) ( not ( = ?auto_12187 ?auto_12188 ) ) ( not ( = ?auto_12186 ?auto_12187 ) ) ( not ( = ?auto_12186 ?auto_12188 ) ) ( not ( = ?auto_12189 ?auto_12193 ) ) ( HOIST-AT ?auto_12191 ?auto_12189 ) ( not ( = ?auto_12192 ?auto_12191 ) ) ( AVAILABLE ?auto_12191 ) ( SURFACE-AT ?auto_12188 ?auto_12189 ) ( ON ?auto_12188 ?auto_12194 ) ( CLEAR ?auto_12188 ) ( not ( = ?auto_12187 ?auto_12194 ) ) ( not ( = ?auto_12188 ?auto_12194 ) ) ( not ( = ?auto_12186 ?auto_12194 ) ) ( IS-CRATE ?auto_12187 ) ( not ( = ?auto_12197 ?auto_12193 ) ) ( not ( = ?auto_12189 ?auto_12197 ) ) ( HOIST-AT ?auto_12195 ?auto_12197 ) ( not ( = ?auto_12192 ?auto_12195 ) ) ( not ( = ?auto_12191 ?auto_12195 ) ) ( AVAILABLE ?auto_12195 ) ( SURFACE-AT ?auto_12187 ?auto_12197 ) ( ON ?auto_12187 ?auto_12190 ) ( CLEAR ?auto_12187 ) ( not ( = ?auto_12187 ?auto_12190 ) ) ( not ( = ?auto_12188 ?auto_12190 ) ) ( not ( = ?auto_12186 ?auto_12190 ) ) ( not ( = ?auto_12194 ?auto_12190 ) ) ( SURFACE-AT ?auto_12185 ?auto_12193 ) ( CLEAR ?auto_12185 ) ( IS-CRATE ?auto_12186 ) ( not ( = ?auto_12185 ?auto_12186 ) ) ( not ( = ?auto_12187 ?auto_12185 ) ) ( not ( = ?auto_12188 ?auto_12185 ) ) ( not ( = ?auto_12194 ?auto_12185 ) ) ( not ( = ?auto_12190 ?auto_12185 ) ) ( AVAILABLE ?auto_12192 ) ( IN ?auto_12186 ?auto_12196 ) ( TRUCK-AT ?auto_12196 ?auto_12198 ) ( not ( = ?auto_12198 ?auto_12193 ) ) ( not ( = ?auto_12189 ?auto_12198 ) ) ( not ( = ?auto_12197 ?auto_12198 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12186 ?auto_12187 ?auto_12188 )
      ( MAKE-3CRATE-VERIFY ?auto_12185 ?auto_12186 ?auto_12187 ?auto_12188 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12199 - SURFACE
      ?auto_12200 - SURFACE
    )
    :vars
    (
      ?auto_12205 - HOIST
      ?auto_12206 - PLACE
      ?auto_12201 - SURFACE
      ?auto_12202 - PLACE
      ?auto_12204 - HOIST
      ?auto_12208 - SURFACE
      ?auto_12211 - PLACE
      ?auto_12209 - HOIST
      ?auto_12203 - SURFACE
      ?auto_12207 - SURFACE
      ?auto_12210 - TRUCK
      ?auto_12212 - PLACE
      ?auto_12213 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12205 ?auto_12206 ) ( IS-CRATE ?auto_12200 ) ( not ( = ?auto_12199 ?auto_12200 ) ) ( not ( = ?auto_12201 ?auto_12199 ) ) ( not ( = ?auto_12201 ?auto_12200 ) ) ( not ( = ?auto_12202 ?auto_12206 ) ) ( HOIST-AT ?auto_12204 ?auto_12202 ) ( not ( = ?auto_12205 ?auto_12204 ) ) ( AVAILABLE ?auto_12204 ) ( SURFACE-AT ?auto_12200 ?auto_12202 ) ( ON ?auto_12200 ?auto_12208 ) ( CLEAR ?auto_12200 ) ( not ( = ?auto_12199 ?auto_12208 ) ) ( not ( = ?auto_12200 ?auto_12208 ) ) ( not ( = ?auto_12201 ?auto_12208 ) ) ( IS-CRATE ?auto_12199 ) ( not ( = ?auto_12211 ?auto_12206 ) ) ( not ( = ?auto_12202 ?auto_12211 ) ) ( HOIST-AT ?auto_12209 ?auto_12211 ) ( not ( = ?auto_12205 ?auto_12209 ) ) ( not ( = ?auto_12204 ?auto_12209 ) ) ( AVAILABLE ?auto_12209 ) ( SURFACE-AT ?auto_12199 ?auto_12211 ) ( ON ?auto_12199 ?auto_12203 ) ( CLEAR ?auto_12199 ) ( not ( = ?auto_12199 ?auto_12203 ) ) ( not ( = ?auto_12200 ?auto_12203 ) ) ( not ( = ?auto_12201 ?auto_12203 ) ) ( not ( = ?auto_12208 ?auto_12203 ) ) ( SURFACE-AT ?auto_12207 ?auto_12206 ) ( CLEAR ?auto_12207 ) ( IS-CRATE ?auto_12201 ) ( not ( = ?auto_12207 ?auto_12201 ) ) ( not ( = ?auto_12199 ?auto_12207 ) ) ( not ( = ?auto_12200 ?auto_12207 ) ) ( not ( = ?auto_12208 ?auto_12207 ) ) ( not ( = ?auto_12203 ?auto_12207 ) ) ( AVAILABLE ?auto_12205 ) ( TRUCK-AT ?auto_12210 ?auto_12212 ) ( not ( = ?auto_12212 ?auto_12206 ) ) ( not ( = ?auto_12202 ?auto_12212 ) ) ( not ( = ?auto_12211 ?auto_12212 ) ) ( HOIST-AT ?auto_12213 ?auto_12212 ) ( LIFTING ?auto_12213 ?auto_12201 ) ( not ( = ?auto_12205 ?auto_12213 ) ) ( not ( = ?auto_12204 ?auto_12213 ) ) ( not ( = ?auto_12209 ?auto_12213 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12213 ?auto_12201 ?auto_12210 ?auto_12212 )
      ( MAKE-2CRATE ?auto_12201 ?auto_12199 ?auto_12200 )
      ( MAKE-1CRATE-VERIFY ?auto_12199 ?auto_12200 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12214 - SURFACE
      ?auto_12215 - SURFACE
      ?auto_12216 - SURFACE
    )
    :vars
    (
      ?auto_12225 - HOIST
      ?auto_12217 - PLACE
      ?auto_12228 - PLACE
      ?auto_12223 - HOIST
      ?auto_12219 - SURFACE
      ?auto_12227 - PLACE
      ?auto_12218 - HOIST
      ?auto_12224 - SURFACE
      ?auto_12226 - SURFACE
      ?auto_12222 - TRUCK
      ?auto_12221 - PLACE
      ?auto_12220 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12225 ?auto_12217 ) ( IS-CRATE ?auto_12216 ) ( not ( = ?auto_12215 ?auto_12216 ) ) ( not ( = ?auto_12214 ?auto_12215 ) ) ( not ( = ?auto_12214 ?auto_12216 ) ) ( not ( = ?auto_12228 ?auto_12217 ) ) ( HOIST-AT ?auto_12223 ?auto_12228 ) ( not ( = ?auto_12225 ?auto_12223 ) ) ( AVAILABLE ?auto_12223 ) ( SURFACE-AT ?auto_12216 ?auto_12228 ) ( ON ?auto_12216 ?auto_12219 ) ( CLEAR ?auto_12216 ) ( not ( = ?auto_12215 ?auto_12219 ) ) ( not ( = ?auto_12216 ?auto_12219 ) ) ( not ( = ?auto_12214 ?auto_12219 ) ) ( IS-CRATE ?auto_12215 ) ( not ( = ?auto_12227 ?auto_12217 ) ) ( not ( = ?auto_12228 ?auto_12227 ) ) ( HOIST-AT ?auto_12218 ?auto_12227 ) ( not ( = ?auto_12225 ?auto_12218 ) ) ( not ( = ?auto_12223 ?auto_12218 ) ) ( AVAILABLE ?auto_12218 ) ( SURFACE-AT ?auto_12215 ?auto_12227 ) ( ON ?auto_12215 ?auto_12224 ) ( CLEAR ?auto_12215 ) ( not ( = ?auto_12215 ?auto_12224 ) ) ( not ( = ?auto_12216 ?auto_12224 ) ) ( not ( = ?auto_12214 ?auto_12224 ) ) ( not ( = ?auto_12219 ?auto_12224 ) ) ( SURFACE-AT ?auto_12226 ?auto_12217 ) ( CLEAR ?auto_12226 ) ( IS-CRATE ?auto_12214 ) ( not ( = ?auto_12226 ?auto_12214 ) ) ( not ( = ?auto_12215 ?auto_12226 ) ) ( not ( = ?auto_12216 ?auto_12226 ) ) ( not ( = ?auto_12219 ?auto_12226 ) ) ( not ( = ?auto_12224 ?auto_12226 ) ) ( AVAILABLE ?auto_12225 ) ( TRUCK-AT ?auto_12222 ?auto_12221 ) ( not ( = ?auto_12221 ?auto_12217 ) ) ( not ( = ?auto_12228 ?auto_12221 ) ) ( not ( = ?auto_12227 ?auto_12221 ) ) ( HOIST-AT ?auto_12220 ?auto_12221 ) ( LIFTING ?auto_12220 ?auto_12214 ) ( not ( = ?auto_12225 ?auto_12220 ) ) ( not ( = ?auto_12223 ?auto_12220 ) ) ( not ( = ?auto_12218 ?auto_12220 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12215 ?auto_12216 )
      ( MAKE-2CRATE-VERIFY ?auto_12214 ?auto_12215 ?auto_12216 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12229 - SURFACE
      ?auto_12230 - SURFACE
      ?auto_12231 - SURFACE
      ?auto_12232 - SURFACE
    )
    :vars
    (
      ?auto_12238 - HOIST
      ?auto_12241 - PLACE
      ?auto_12240 - PLACE
      ?auto_12235 - HOIST
      ?auto_12243 - SURFACE
      ?auto_12233 - PLACE
      ?auto_12242 - HOIST
      ?auto_12236 - SURFACE
      ?auto_12239 - TRUCK
      ?auto_12234 - PLACE
      ?auto_12237 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12238 ?auto_12241 ) ( IS-CRATE ?auto_12232 ) ( not ( = ?auto_12231 ?auto_12232 ) ) ( not ( = ?auto_12230 ?auto_12231 ) ) ( not ( = ?auto_12230 ?auto_12232 ) ) ( not ( = ?auto_12240 ?auto_12241 ) ) ( HOIST-AT ?auto_12235 ?auto_12240 ) ( not ( = ?auto_12238 ?auto_12235 ) ) ( AVAILABLE ?auto_12235 ) ( SURFACE-AT ?auto_12232 ?auto_12240 ) ( ON ?auto_12232 ?auto_12243 ) ( CLEAR ?auto_12232 ) ( not ( = ?auto_12231 ?auto_12243 ) ) ( not ( = ?auto_12232 ?auto_12243 ) ) ( not ( = ?auto_12230 ?auto_12243 ) ) ( IS-CRATE ?auto_12231 ) ( not ( = ?auto_12233 ?auto_12241 ) ) ( not ( = ?auto_12240 ?auto_12233 ) ) ( HOIST-AT ?auto_12242 ?auto_12233 ) ( not ( = ?auto_12238 ?auto_12242 ) ) ( not ( = ?auto_12235 ?auto_12242 ) ) ( AVAILABLE ?auto_12242 ) ( SURFACE-AT ?auto_12231 ?auto_12233 ) ( ON ?auto_12231 ?auto_12236 ) ( CLEAR ?auto_12231 ) ( not ( = ?auto_12231 ?auto_12236 ) ) ( not ( = ?auto_12232 ?auto_12236 ) ) ( not ( = ?auto_12230 ?auto_12236 ) ) ( not ( = ?auto_12243 ?auto_12236 ) ) ( SURFACE-AT ?auto_12229 ?auto_12241 ) ( CLEAR ?auto_12229 ) ( IS-CRATE ?auto_12230 ) ( not ( = ?auto_12229 ?auto_12230 ) ) ( not ( = ?auto_12231 ?auto_12229 ) ) ( not ( = ?auto_12232 ?auto_12229 ) ) ( not ( = ?auto_12243 ?auto_12229 ) ) ( not ( = ?auto_12236 ?auto_12229 ) ) ( AVAILABLE ?auto_12238 ) ( TRUCK-AT ?auto_12239 ?auto_12234 ) ( not ( = ?auto_12234 ?auto_12241 ) ) ( not ( = ?auto_12240 ?auto_12234 ) ) ( not ( = ?auto_12233 ?auto_12234 ) ) ( HOIST-AT ?auto_12237 ?auto_12234 ) ( LIFTING ?auto_12237 ?auto_12230 ) ( not ( = ?auto_12238 ?auto_12237 ) ) ( not ( = ?auto_12235 ?auto_12237 ) ) ( not ( = ?auto_12242 ?auto_12237 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12230 ?auto_12231 ?auto_12232 )
      ( MAKE-3CRATE-VERIFY ?auto_12229 ?auto_12230 ?auto_12231 ?auto_12232 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12244 - SURFACE
      ?auto_12245 - SURFACE
    )
    :vars
    (
      ?auto_12253 - HOIST
      ?auto_12256 - PLACE
      ?auto_12246 - SURFACE
      ?auto_12255 - PLACE
      ?auto_12250 - HOIST
      ?auto_12258 - SURFACE
      ?auto_12247 - PLACE
      ?auto_12257 - HOIST
      ?auto_12251 - SURFACE
      ?auto_12248 - SURFACE
      ?auto_12254 - TRUCK
      ?auto_12249 - PLACE
      ?auto_12252 - HOIST
      ?auto_12259 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12253 ?auto_12256 ) ( IS-CRATE ?auto_12245 ) ( not ( = ?auto_12244 ?auto_12245 ) ) ( not ( = ?auto_12246 ?auto_12244 ) ) ( not ( = ?auto_12246 ?auto_12245 ) ) ( not ( = ?auto_12255 ?auto_12256 ) ) ( HOIST-AT ?auto_12250 ?auto_12255 ) ( not ( = ?auto_12253 ?auto_12250 ) ) ( AVAILABLE ?auto_12250 ) ( SURFACE-AT ?auto_12245 ?auto_12255 ) ( ON ?auto_12245 ?auto_12258 ) ( CLEAR ?auto_12245 ) ( not ( = ?auto_12244 ?auto_12258 ) ) ( not ( = ?auto_12245 ?auto_12258 ) ) ( not ( = ?auto_12246 ?auto_12258 ) ) ( IS-CRATE ?auto_12244 ) ( not ( = ?auto_12247 ?auto_12256 ) ) ( not ( = ?auto_12255 ?auto_12247 ) ) ( HOIST-AT ?auto_12257 ?auto_12247 ) ( not ( = ?auto_12253 ?auto_12257 ) ) ( not ( = ?auto_12250 ?auto_12257 ) ) ( AVAILABLE ?auto_12257 ) ( SURFACE-AT ?auto_12244 ?auto_12247 ) ( ON ?auto_12244 ?auto_12251 ) ( CLEAR ?auto_12244 ) ( not ( = ?auto_12244 ?auto_12251 ) ) ( not ( = ?auto_12245 ?auto_12251 ) ) ( not ( = ?auto_12246 ?auto_12251 ) ) ( not ( = ?auto_12258 ?auto_12251 ) ) ( SURFACE-AT ?auto_12248 ?auto_12256 ) ( CLEAR ?auto_12248 ) ( IS-CRATE ?auto_12246 ) ( not ( = ?auto_12248 ?auto_12246 ) ) ( not ( = ?auto_12244 ?auto_12248 ) ) ( not ( = ?auto_12245 ?auto_12248 ) ) ( not ( = ?auto_12258 ?auto_12248 ) ) ( not ( = ?auto_12251 ?auto_12248 ) ) ( AVAILABLE ?auto_12253 ) ( TRUCK-AT ?auto_12254 ?auto_12249 ) ( not ( = ?auto_12249 ?auto_12256 ) ) ( not ( = ?auto_12255 ?auto_12249 ) ) ( not ( = ?auto_12247 ?auto_12249 ) ) ( HOIST-AT ?auto_12252 ?auto_12249 ) ( not ( = ?auto_12253 ?auto_12252 ) ) ( not ( = ?auto_12250 ?auto_12252 ) ) ( not ( = ?auto_12257 ?auto_12252 ) ) ( AVAILABLE ?auto_12252 ) ( SURFACE-AT ?auto_12246 ?auto_12249 ) ( ON ?auto_12246 ?auto_12259 ) ( CLEAR ?auto_12246 ) ( not ( = ?auto_12244 ?auto_12259 ) ) ( not ( = ?auto_12245 ?auto_12259 ) ) ( not ( = ?auto_12246 ?auto_12259 ) ) ( not ( = ?auto_12258 ?auto_12259 ) ) ( not ( = ?auto_12251 ?auto_12259 ) ) ( not ( = ?auto_12248 ?auto_12259 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12252 ?auto_12246 ?auto_12259 ?auto_12249 )
      ( MAKE-2CRATE ?auto_12246 ?auto_12244 ?auto_12245 )
      ( MAKE-1CRATE-VERIFY ?auto_12244 ?auto_12245 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12260 - SURFACE
      ?auto_12261 - SURFACE
      ?auto_12262 - SURFACE
    )
    :vars
    (
      ?auto_12263 - HOIST
      ?auto_12275 - PLACE
      ?auto_12270 - PLACE
      ?auto_12273 - HOIST
      ?auto_12272 - SURFACE
      ?auto_12266 - PLACE
      ?auto_12264 - HOIST
      ?auto_12268 - SURFACE
      ?auto_12274 - SURFACE
      ?auto_12265 - TRUCK
      ?auto_12271 - PLACE
      ?auto_12269 - HOIST
      ?auto_12267 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12263 ?auto_12275 ) ( IS-CRATE ?auto_12262 ) ( not ( = ?auto_12261 ?auto_12262 ) ) ( not ( = ?auto_12260 ?auto_12261 ) ) ( not ( = ?auto_12260 ?auto_12262 ) ) ( not ( = ?auto_12270 ?auto_12275 ) ) ( HOIST-AT ?auto_12273 ?auto_12270 ) ( not ( = ?auto_12263 ?auto_12273 ) ) ( AVAILABLE ?auto_12273 ) ( SURFACE-AT ?auto_12262 ?auto_12270 ) ( ON ?auto_12262 ?auto_12272 ) ( CLEAR ?auto_12262 ) ( not ( = ?auto_12261 ?auto_12272 ) ) ( not ( = ?auto_12262 ?auto_12272 ) ) ( not ( = ?auto_12260 ?auto_12272 ) ) ( IS-CRATE ?auto_12261 ) ( not ( = ?auto_12266 ?auto_12275 ) ) ( not ( = ?auto_12270 ?auto_12266 ) ) ( HOIST-AT ?auto_12264 ?auto_12266 ) ( not ( = ?auto_12263 ?auto_12264 ) ) ( not ( = ?auto_12273 ?auto_12264 ) ) ( AVAILABLE ?auto_12264 ) ( SURFACE-AT ?auto_12261 ?auto_12266 ) ( ON ?auto_12261 ?auto_12268 ) ( CLEAR ?auto_12261 ) ( not ( = ?auto_12261 ?auto_12268 ) ) ( not ( = ?auto_12262 ?auto_12268 ) ) ( not ( = ?auto_12260 ?auto_12268 ) ) ( not ( = ?auto_12272 ?auto_12268 ) ) ( SURFACE-AT ?auto_12274 ?auto_12275 ) ( CLEAR ?auto_12274 ) ( IS-CRATE ?auto_12260 ) ( not ( = ?auto_12274 ?auto_12260 ) ) ( not ( = ?auto_12261 ?auto_12274 ) ) ( not ( = ?auto_12262 ?auto_12274 ) ) ( not ( = ?auto_12272 ?auto_12274 ) ) ( not ( = ?auto_12268 ?auto_12274 ) ) ( AVAILABLE ?auto_12263 ) ( TRUCK-AT ?auto_12265 ?auto_12271 ) ( not ( = ?auto_12271 ?auto_12275 ) ) ( not ( = ?auto_12270 ?auto_12271 ) ) ( not ( = ?auto_12266 ?auto_12271 ) ) ( HOIST-AT ?auto_12269 ?auto_12271 ) ( not ( = ?auto_12263 ?auto_12269 ) ) ( not ( = ?auto_12273 ?auto_12269 ) ) ( not ( = ?auto_12264 ?auto_12269 ) ) ( AVAILABLE ?auto_12269 ) ( SURFACE-AT ?auto_12260 ?auto_12271 ) ( ON ?auto_12260 ?auto_12267 ) ( CLEAR ?auto_12260 ) ( not ( = ?auto_12261 ?auto_12267 ) ) ( not ( = ?auto_12262 ?auto_12267 ) ) ( not ( = ?auto_12260 ?auto_12267 ) ) ( not ( = ?auto_12272 ?auto_12267 ) ) ( not ( = ?auto_12268 ?auto_12267 ) ) ( not ( = ?auto_12274 ?auto_12267 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12261 ?auto_12262 )
      ( MAKE-2CRATE-VERIFY ?auto_12260 ?auto_12261 ?auto_12262 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12276 - SURFACE
      ?auto_12277 - SURFACE
      ?auto_12278 - SURFACE
      ?auto_12279 - SURFACE
    )
    :vars
    (
      ?auto_12284 - HOIST
      ?auto_12281 - PLACE
      ?auto_12285 - PLACE
      ?auto_12286 - HOIST
      ?auto_12287 - SURFACE
      ?auto_12282 - PLACE
      ?auto_12291 - HOIST
      ?auto_12283 - SURFACE
      ?auto_12280 - TRUCK
      ?auto_12289 - PLACE
      ?auto_12288 - HOIST
      ?auto_12290 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12284 ?auto_12281 ) ( IS-CRATE ?auto_12279 ) ( not ( = ?auto_12278 ?auto_12279 ) ) ( not ( = ?auto_12277 ?auto_12278 ) ) ( not ( = ?auto_12277 ?auto_12279 ) ) ( not ( = ?auto_12285 ?auto_12281 ) ) ( HOIST-AT ?auto_12286 ?auto_12285 ) ( not ( = ?auto_12284 ?auto_12286 ) ) ( AVAILABLE ?auto_12286 ) ( SURFACE-AT ?auto_12279 ?auto_12285 ) ( ON ?auto_12279 ?auto_12287 ) ( CLEAR ?auto_12279 ) ( not ( = ?auto_12278 ?auto_12287 ) ) ( not ( = ?auto_12279 ?auto_12287 ) ) ( not ( = ?auto_12277 ?auto_12287 ) ) ( IS-CRATE ?auto_12278 ) ( not ( = ?auto_12282 ?auto_12281 ) ) ( not ( = ?auto_12285 ?auto_12282 ) ) ( HOIST-AT ?auto_12291 ?auto_12282 ) ( not ( = ?auto_12284 ?auto_12291 ) ) ( not ( = ?auto_12286 ?auto_12291 ) ) ( AVAILABLE ?auto_12291 ) ( SURFACE-AT ?auto_12278 ?auto_12282 ) ( ON ?auto_12278 ?auto_12283 ) ( CLEAR ?auto_12278 ) ( not ( = ?auto_12278 ?auto_12283 ) ) ( not ( = ?auto_12279 ?auto_12283 ) ) ( not ( = ?auto_12277 ?auto_12283 ) ) ( not ( = ?auto_12287 ?auto_12283 ) ) ( SURFACE-AT ?auto_12276 ?auto_12281 ) ( CLEAR ?auto_12276 ) ( IS-CRATE ?auto_12277 ) ( not ( = ?auto_12276 ?auto_12277 ) ) ( not ( = ?auto_12278 ?auto_12276 ) ) ( not ( = ?auto_12279 ?auto_12276 ) ) ( not ( = ?auto_12287 ?auto_12276 ) ) ( not ( = ?auto_12283 ?auto_12276 ) ) ( AVAILABLE ?auto_12284 ) ( TRUCK-AT ?auto_12280 ?auto_12289 ) ( not ( = ?auto_12289 ?auto_12281 ) ) ( not ( = ?auto_12285 ?auto_12289 ) ) ( not ( = ?auto_12282 ?auto_12289 ) ) ( HOIST-AT ?auto_12288 ?auto_12289 ) ( not ( = ?auto_12284 ?auto_12288 ) ) ( not ( = ?auto_12286 ?auto_12288 ) ) ( not ( = ?auto_12291 ?auto_12288 ) ) ( AVAILABLE ?auto_12288 ) ( SURFACE-AT ?auto_12277 ?auto_12289 ) ( ON ?auto_12277 ?auto_12290 ) ( CLEAR ?auto_12277 ) ( not ( = ?auto_12278 ?auto_12290 ) ) ( not ( = ?auto_12279 ?auto_12290 ) ) ( not ( = ?auto_12277 ?auto_12290 ) ) ( not ( = ?auto_12287 ?auto_12290 ) ) ( not ( = ?auto_12283 ?auto_12290 ) ) ( not ( = ?auto_12276 ?auto_12290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12277 ?auto_12278 ?auto_12279 )
      ( MAKE-3CRATE-VERIFY ?auto_12276 ?auto_12277 ?auto_12278 ?auto_12279 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12292 - SURFACE
      ?auto_12293 - SURFACE
    )
    :vars
    (
      ?auto_12299 - HOIST
      ?auto_12296 - PLACE
      ?auto_12294 - SURFACE
      ?auto_12300 - PLACE
      ?auto_12301 - HOIST
      ?auto_12302 - SURFACE
      ?auto_12297 - PLACE
      ?auto_12307 - HOIST
      ?auto_12298 - SURFACE
      ?auto_12303 - SURFACE
      ?auto_12305 - PLACE
      ?auto_12304 - HOIST
      ?auto_12306 - SURFACE
      ?auto_12295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12299 ?auto_12296 ) ( IS-CRATE ?auto_12293 ) ( not ( = ?auto_12292 ?auto_12293 ) ) ( not ( = ?auto_12294 ?auto_12292 ) ) ( not ( = ?auto_12294 ?auto_12293 ) ) ( not ( = ?auto_12300 ?auto_12296 ) ) ( HOIST-AT ?auto_12301 ?auto_12300 ) ( not ( = ?auto_12299 ?auto_12301 ) ) ( AVAILABLE ?auto_12301 ) ( SURFACE-AT ?auto_12293 ?auto_12300 ) ( ON ?auto_12293 ?auto_12302 ) ( CLEAR ?auto_12293 ) ( not ( = ?auto_12292 ?auto_12302 ) ) ( not ( = ?auto_12293 ?auto_12302 ) ) ( not ( = ?auto_12294 ?auto_12302 ) ) ( IS-CRATE ?auto_12292 ) ( not ( = ?auto_12297 ?auto_12296 ) ) ( not ( = ?auto_12300 ?auto_12297 ) ) ( HOIST-AT ?auto_12307 ?auto_12297 ) ( not ( = ?auto_12299 ?auto_12307 ) ) ( not ( = ?auto_12301 ?auto_12307 ) ) ( AVAILABLE ?auto_12307 ) ( SURFACE-AT ?auto_12292 ?auto_12297 ) ( ON ?auto_12292 ?auto_12298 ) ( CLEAR ?auto_12292 ) ( not ( = ?auto_12292 ?auto_12298 ) ) ( not ( = ?auto_12293 ?auto_12298 ) ) ( not ( = ?auto_12294 ?auto_12298 ) ) ( not ( = ?auto_12302 ?auto_12298 ) ) ( SURFACE-AT ?auto_12303 ?auto_12296 ) ( CLEAR ?auto_12303 ) ( IS-CRATE ?auto_12294 ) ( not ( = ?auto_12303 ?auto_12294 ) ) ( not ( = ?auto_12292 ?auto_12303 ) ) ( not ( = ?auto_12293 ?auto_12303 ) ) ( not ( = ?auto_12302 ?auto_12303 ) ) ( not ( = ?auto_12298 ?auto_12303 ) ) ( AVAILABLE ?auto_12299 ) ( not ( = ?auto_12305 ?auto_12296 ) ) ( not ( = ?auto_12300 ?auto_12305 ) ) ( not ( = ?auto_12297 ?auto_12305 ) ) ( HOIST-AT ?auto_12304 ?auto_12305 ) ( not ( = ?auto_12299 ?auto_12304 ) ) ( not ( = ?auto_12301 ?auto_12304 ) ) ( not ( = ?auto_12307 ?auto_12304 ) ) ( AVAILABLE ?auto_12304 ) ( SURFACE-AT ?auto_12294 ?auto_12305 ) ( ON ?auto_12294 ?auto_12306 ) ( CLEAR ?auto_12294 ) ( not ( = ?auto_12292 ?auto_12306 ) ) ( not ( = ?auto_12293 ?auto_12306 ) ) ( not ( = ?auto_12294 ?auto_12306 ) ) ( not ( = ?auto_12302 ?auto_12306 ) ) ( not ( = ?auto_12298 ?auto_12306 ) ) ( not ( = ?auto_12303 ?auto_12306 ) ) ( TRUCK-AT ?auto_12295 ?auto_12296 ) )
    :subtasks
    ( ( !DRIVE ?auto_12295 ?auto_12296 ?auto_12305 )
      ( MAKE-2CRATE ?auto_12294 ?auto_12292 ?auto_12293 )
      ( MAKE-1CRATE-VERIFY ?auto_12292 ?auto_12293 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12308 - SURFACE
      ?auto_12309 - SURFACE
      ?auto_12310 - SURFACE
    )
    :vars
    (
      ?auto_12323 - HOIST
      ?auto_12313 - PLACE
      ?auto_12321 - PLACE
      ?auto_12320 - HOIST
      ?auto_12318 - SURFACE
      ?auto_12322 - PLACE
      ?auto_12311 - HOIST
      ?auto_12317 - SURFACE
      ?auto_12312 - SURFACE
      ?auto_12315 - PLACE
      ?auto_12316 - HOIST
      ?auto_12314 - SURFACE
      ?auto_12319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12323 ?auto_12313 ) ( IS-CRATE ?auto_12310 ) ( not ( = ?auto_12309 ?auto_12310 ) ) ( not ( = ?auto_12308 ?auto_12309 ) ) ( not ( = ?auto_12308 ?auto_12310 ) ) ( not ( = ?auto_12321 ?auto_12313 ) ) ( HOIST-AT ?auto_12320 ?auto_12321 ) ( not ( = ?auto_12323 ?auto_12320 ) ) ( AVAILABLE ?auto_12320 ) ( SURFACE-AT ?auto_12310 ?auto_12321 ) ( ON ?auto_12310 ?auto_12318 ) ( CLEAR ?auto_12310 ) ( not ( = ?auto_12309 ?auto_12318 ) ) ( not ( = ?auto_12310 ?auto_12318 ) ) ( not ( = ?auto_12308 ?auto_12318 ) ) ( IS-CRATE ?auto_12309 ) ( not ( = ?auto_12322 ?auto_12313 ) ) ( not ( = ?auto_12321 ?auto_12322 ) ) ( HOIST-AT ?auto_12311 ?auto_12322 ) ( not ( = ?auto_12323 ?auto_12311 ) ) ( not ( = ?auto_12320 ?auto_12311 ) ) ( AVAILABLE ?auto_12311 ) ( SURFACE-AT ?auto_12309 ?auto_12322 ) ( ON ?auto_12309 ?auto_12317 ) ( CLEAR ?auto_12309 ) ( not ( = ?auto_12309 ?auto_12317 ) ) ( not ( = ?auto_12310 ?auto_12317 ) ) ( not ( = ?auto_12308 ?auto_12317 ) ) ( not ( = ?auto_12318 ?auto_12317 ) ) ( SURFACE-AT ?auto_12312 ?auto_12313 ) ( CLEAR ?auto_12312 ) ( IS-CRATE ?auto_12308 ) ( not ( = ?auto_12312 ?auto_12308 ) ) ( not ( = ?auto_12309 ?auto_12312 ) ) ( not ( = ?auto_12310 ?auto_12312 ) ) ( not ( = ?auto_12318 ?auto_12312 ) ) ( not ( = ?auto_12317 ?auto_12312 ) ) ( AVAILABLE ?auto_12323 ) ( not ( = ?auto_12315 ?auto_12313 ) ) ( not ( = ?auto_12321 ?auto_12315 ) ) ( not ( = ?auto_12322 ?auto_12315 ) ) ( HOIST-AT ?auto_12316 ?auto_12315 ) ( not ( = ?auto_12323 ?auto_12316 ) ) ( not ( = ?auto_12320 ?auto_12316 ) ) ( not ( = ?auto_12311 ?auto_12316 ) ) ( AVAILABLE ?auto_12316 ) ( SURFACE-AT ?auto_12308 ?auto_12315 ) ( ON ?auto_12308 ?auto_12314 ) ( CLEAR ?auto_12308 ) ( not ( = ?auto_12309 ?auto_12314 ) ) ( not ( = ?auto_12310 ?auto_12314 ) ) ( not ( = ?auto_12308 ?auto_12314 ) ) ( not ( = ?auto_12318 ?auto_12314 ) ) ( not ( = ?auto_12317 ?auto_12314 ) ) ( not ( = ?auto_12312 ?auto_12314 ) ) ( TRUCK-AT ?auto_12319 ?auto_12313 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12309 ?auto_12310 )
      ( MAKE-2CRATE-VERIFY ?auto_12308 ?auto_12309 ?auto_12310 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12324 - SURFACE
      ?auto_12325 - SURFACE
      ?auto_12326 - SURFACE
      ?auto_12327 - SURFACE
    )
    :vars
    (
      ?auto_12329 - HOIST
      ?auto_12330 - PLACE
      ?auto_12334 - PLACE
      ?auto_12333 - HOIST
      ?auto_12336 - SURFACE
      ?auto_12332 - PLACE
      ?auto_12331 - HOIST
      ?auto_12339 - SURFACE
      ?auto_12337 - PLACE
      ?auto_12338 - HOIST
      ?auto_12328 - SURFACE
      ?auto_12335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12329 ?auto_12330 ) ( IS-CRATE ?auto_12327 ) ( not ( = ?auto_12326 ?auto_12327 ) ) ( not ( = ?auto_12325 ?auto_12326 ) ) ( not ( = ?auto_12325 ?auto_12327 ) ) ( not ( = ?auto_12334 ?auto_12330 ) ) ( HOIST-AT ?auto_12333 ?auto_12334 ) ( not ( = ?auto_12329 ?auto_12333 ) ) ( AVAILABLE ?auto_12333 ) ( SURFACE-AT ?auto_12327 ?auto_12334 ) ( ON ?auto_12327 ?auto_12336 ) ( CLEAR ?auto_12327 ) ( not ( = ?auto_12326 ?auto_12336 ) ) ( not ( = ?auto_12327 ?auto_12336 ) ) ( not ( = ?auto_12325 ?auto_12336 ) ) ( IS-CRATE ?auto_12326 ) ( not ( = ?auto_12332 ?auto_12330 ) ) ( not ( = ?auto_12334 ?auto_12332 ) ) ( HOIST-AT ?auto_12331 ?auto_12332 ) ( not ( = ?auto_12329 ?auto_12331 ) ) ( not ( = ?auto_12333 ?auto_12331 ) ) ( AVAILABLE ?auto_12331 ) ( SURFACE-AT ?auto_12326 ?auto_12332 ) ( ON ?auto_12326 ?auto_12339 ) ( CLEAR ?auto_12326 ) ( not ( = ?auto_12326 ?auto_12339 ) ) ( not ( = ?auto_12327 ?auto_12339 ) ) ( not ( = ?auto_12325 ?auto_12339 ) ) ( not ( = ?auto_12336 ?auto_12339 ) ) ( SURFACE-AT ?auto_12324 ?auto_12330 ) ( CLEAR ?auto_12324 ) ( IS-CRATE ?auto_12325 ) ( not ( = ?auto_12324 ?auto_12325 ) ) ( not ( = ?auto_12326 ?auto_12324 ) ) ( not ( = ?auto_12327 ?auto_12324 ) ) ( not ( = ?auto_12336 ?auto_12324 ) ) ( not ( = ?auto_12339 ?auto_12324 ) ) ( AVAILABLE ?auto_12329 ) ( not ( = ?auto_12337 ?auto_12330 ) ) ( not ( = ?auto_12334 ?auto_12337 ) ) ( not ( = ?auto_12332 ?auto_12337 ) ) ( HOIST-AT ?auto_12338 ?auto_12337 ) ( not ( = ?auto_12329 ?auto_12338 ) ) ( not ( = ?auto_12333 ?auto_12338 ) ) ( not ( = ?auto_12331 ?auto_12338 ) ) ( AVAILABLE ?auto_12338 ) ( SURFACE-AT ?auto_12325 ?auto_12337 ) ( ON ?auto_12325 ?auto_12328 ) ( CLEAR ?auto_12325 ) ( not ( = ?auto_12326 ?auto_12328 ) ) ( not ( = ?auto_12327 ?auto_12328 ) ) ( not ( = ?auto_12325 ?auto_12328 ) ) ( not ( = ?auto_12336 ?auto_12328 ) ) ( not ( = ?auto_12339 ?auto_12328 ) ) ( not ( = ?auto_12324 ?auto_12328 ) ) ( TRUCK-AT ?auto_12335 ?auto_12330 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12325 ?auto_12326 ?auto_12327 )
      ( MAKE-3CRATE-VERIFY ?auto_12324 ?auto_12325 ?auto_12326 ?auto_12327 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12354 - SURFACE
      ?auto_12355 - SURFACE
    )
    :vars
    (
      ?auto_12356 - HOIST
      ?auto_12357 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12356 ?auto_12357 ) ( SURFACE-AT ?auto_12354 ?auto_12357 ) ( CLEAR ?auto_12354 ) ( LIFTING ?auto_12356 ?auto_12355 ) ( IS-CRATE ?auto_12355 ) ( not ( = ?auto_12354 ?auto_12355 ) ) )
    :subtasks
    ( ( !DROP ?auto_12356 ?auto_12355 ?auto_12354 ?auto_12357 )
      ( MAKE-1CRATE-VERIFY ?auto_12354 ?auto_12355 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12358 - SURFACE
      ?auto_12359 - SURFACE
      ?auto_12360 - SURFACE
    )
    :vars
    (
      ?auto_12362 - HOIST
      ?auto_12361 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12362 ?auto_12361 ) ( SURFACE-AT ?auto_12359 ?auto_12361 ) ( CLEAR ?auto_12359 ) ( LIFTING ?auto_12362 ?auto_12360 ) ( IS-CRATE ?auto_12360 ) ( not ( = ?auto_12359 ?auto_12360 ) ) ( ON ?auto_12359 ?auto_12358 ) ( not ( = ?auto_12358 ?auto_12359 ) ) ( not ( = ?auto_12358 ?auto_12360 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12359 ?auto_12360 )
      ( MAKE-2CRATE-VERIFY ?auto_12358 ?auto_12359 ?auto_12360 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12363 - SURFACE
      ?auto_12364 - SURFACE
      ?auto_12365 - SURFACE
      ?auto_12366 - SURFACE
    )
    :vars
    (
      ?auto_12368 - HOIST
      ?auto_12367 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12368 ?auto_12367 ) ( SURFACE-AT ?auto_12365 ?auto_12367 ) ( CLEAR ?auto_12365 ) ( LIFTING ?auto_12368 ?auto_12366 ) ( IS-CRATE ?auto_12366 ) ( not ( = ?auto_12365 ?auto_12366 ) ) ( ON ?auto_12364 ?auto_12363 ) ( ON ?auto_12365 ?auto_12364 ) ( not ( = ?auto_12363 ?auto_12364 ) ) ( not ( = ?auto_12363 ?auto_12365 ) ) ( not ( = ?auto_12363 ?auto_12366 ) ) ( not ( = ?auto_12364 ?auto_12365 ) ) ( not ( = ?auto_12364 ?auto_12366 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12365 ?auto_12366 )
      ( MAKE-3CRATE-VERIFY ?auto_12363 ?auto_12364 ?auto_12365 ?auto_12366 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12369 - SURFACE
      ?auto_12370 - SURFACE
      ?auto_12371 - SURFACE
      ?auto_12372 - SURFACE
      ?auto_12373 - SURFACE
    )
    :vars
    (
      ?auto_12375 - HOIST
      ?auto_12374 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12375 ?auto_12374 ) ( SURFACE-AT ?auto_12372 ?auto_12374 ) ( CLEAR ?auto_12372 ) ( LIFTING ?auto_12375 ?auto_12373 ) ( IS-CRATE ?auto_12373 ) ( not ( = ?auto_12372 ?auto_12373 ) ) ( ON ?auto_12370 ?auto_12369 ) ( ON ?auto_12371 ?auto_12370 ) ( ON ?auto_12372 ?auto_12371 ) ( not ( = ?auto_12369 ?auto_12370 ) ) ( not ( = ?auto_12369 ?auto_12371 ) ) ( not ( = ?auto_12369 ?auto_12372 ) ) ( not ( = ?auto_12369 ?auto_12373 ) ) ( not ( = ?auto_12370 ?auto_12371 ) ) ( not ( = ?auto_12370 ?auto_12372 ) ) ( not ( = ?auto_12370 ?auto_12373 ) ) ( not ( = ?auto_12371 ?auto_12372 ) ) ( not ( = ?auto_12371 ?auto_12373 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12372 ?auto_12373 )
      ( MAKE-4CRATE-VERIFY ?auto_12369 ?auto_12370 ?auto_12371 ?auto_12372 ?auto_12373 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12376 - SURFACE
      ?auto_12377 - SURFACE
    )
    :vars
    (
      ?auto_12379 - HOIST
      ?auto_12378 - PLACE
      ?auto_12380 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12379 ?auto_12378 ) ( SURFACE-AT ?auto_12376 ?auto_12378 ) ( CLEAR ?auto_12376 ) ( IS-CRATE ?auto_12377 ) ( not ( = ?auto_12376 ?auto_12377 ) ) ( TRUCK-AT ?auto_12380 ?auto_12378 ) ( AVAILABLE ?auto_12379 ) ( IN ?auto_12377 ?auto_12380 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12379 ?auto_12377 ?auto_12380 ?auto_12378 )
      ( MAKE-1CRATE ?auto_12376 ?auto_12377 )
      ( MAKE-1CRATE-VERIFY ?auto_12376 ?auto_12377 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12381 - SURFACE
      ?auto_12382 - SURFACE
      ?auto_12383 - SURFACE
    )
    :vars
    (
      ?auto_12386 - HOIST
      ?auto_12385 - PLACE
      ?auto_12384 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12386 ?auto_12385 ) ( SURFACE-AT ?auto_12382 ?auto_12385 ) ( CLEAR ?auto_12382 ) ( IS-CRATE ?auto_12383 ) ( not ( = ?auto_12382 ?auto_12383 ) ) ( TRUCK-AT ?auto_12384 ?auto_12385 ) ( AVAILABLE ?auto_12386 ) ( IN ?auto_12383 ?auto_12384 ) ( ON ?auto_12382 ?auto_12381 ) ( not ( = ?auto_12381 ?auto_12382 ) ) ( not ( = ?auto_12381 ?auto_12383 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12382 ?auto_12383 )
      ( MAKE-2CRATE-VERIFY ?auto_12381 ?auto_12382 ?auto_12383 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12387 - SURFACE
      ?auto_12388 - SURFACE
      ?auto_12389 - SURFACE
      ?auto_12390 - SURFACE
    )
    :vars
    (
      ?auto_12392 - HOIST
      ?auto_12393 - PLACE
      ?auto_12391 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12392 ?auto_12393 ) ( SURFACE-AT ?auto_12389 ?auto_12393 ) ( CLEAR ?auto_12389 ) ( IS-CRATE ?auto_12390 ) ( not ( = ?auto_12389 ?auto_12390 ) ) ( TRUCK-AT ?auto_12391 ?auto_12393 ) ( AVAILABLE ?auto_12392 ) ( IN ?auto_12390 ?auto_12391 ) ( ON ?auto_12389 ?auto_12388 ) ( not ( = ?auto_12388 ?auto_12389 ) ) ( not ( = ?auto_12388 ?auto_12390 ) ) ( ON ?auto_12388 ?auto_12387 ) ( not ( = ?auto_12387 ?auto_12388 ) ) ( not ( = ?auto_12387 ?auto_12389 ) ) ( not ( = ?auto_12387 ?auto_12390 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12388 ?auto_12389 ?auto_12390 )
      ( MAKE-3CRATE-VERIFY ?auto_12387 ?auto_12388 ?auto_12389 ?auto_12390 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12394 - SURFACE
      ?auto_12395 - SURFACE
      ?auto_12396 - SURFACE
      ?auto_12397 - SURFACE
      ?auto_12398 - SURFACE
    )
    :vars
    (
      ?auto_12400 - HOIST
      ?auto_12401 - PLACE
      ?auto_12399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12400 ?auto_12401 ) ( SURFACE-AT ?auto_12397 ?auto_12401 ) ( CLEAR ?auto_12397 ) ( IS-CRATE ?auto_12398 ) ( not ( = ?auto_12397 ?auto_12398 ) ) ( TRUCK-AT ?auto_12399 ?auto_12401 ) ( AVAILABLE ?auto_12400 ) ( IN ?auto_12398 ?auto_12399 ) ( ON ?auto_12397 ?auto_12396 ) ( not ( = ?auto_12396 ?auto_12397 ) ) ( not ( = ?auto_12396 ?auto_12398 ) ) ( ON ?auto_12395 ?auto_12394 ) ( ON ?auto_12396 ?auto_12395 ) ( not ( = ?auto_12394 ?auto_12395 ) ) ( not ( = ?auto_12394 ?auto_12396 ) ) ( not ( = ?auto_12394 ?auto_12397 ) ) ( not ( = ?auto_12394 ?auto_12398 ) ) ( not ( = ?auto_12395 ?auto_12396 ) ) ( not ( = ?auto_12395 ?auto_12397 ) ) ( not ( = ?auto_12395 ?auto_12398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12396 ?auto_12397 ?auto_12398 )
      ( MAKE-4CRATE-VERIFY ?auto_12394 ?auto_12395 ?auto_12396 ?auto_12397 ?auto_12398 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12402 - SURFACE
      ?auto_12403 - SURFACE
    )
    :vars
    (
      ?auto_12406 - HOIST
      ?auto_12407 - PLACE
      ?auto_12405 - TRUCK
      ?auto_12404 - SURFACE
      ?auto_12408 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12406 ?auto_12407 ) ( SURFACE-AT ?auto_12402 ?auto_12407 ) ( CLEAR ?auto_12402 ) ( IS-CRATE ?auto_12403 ) ( not ( = ?auto_12402 ?auto_12403 ) ) ( AVAILABLE ?auto_12406 ) ( IN ?auto_12403 ?auto_12405 ) ( ON ?auto_12402 ?auto_12404 ) ( not ( = ?auto_12404 ?auto_12402 ) ) ( not ( = ?auto_12404 ?auto_12403 ) ) ( TRUCK-AT ?auto_12405 ?auto_12408 ) ( not ( = ?auto_12408 ?auto_12407 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12405 ?auto_12408 ?auto_12407 )
      ( MAKE-2CRATE ?auto_12404 ?auto_12402 ?auto_12403 )
      ( MAKE-1CRATE-VERIFY ?auto_12402 ?auto_12403 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12409 - SURFACE
      ?auto_12410 - SURFACE
      ?auto_12411 - SURFACE
    )
    :vars
    (
      ?auto_12413 - HOIST
      ?auto_12415 - PLACE
      ?auto_12414 - TRUCK
      ?auto_12412 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12413 ?auto_12415 ) ( SURFACE-AT ?auto_12410 ?auto_12415 ) ( CLEAR ?auto_12410 ) ( IS-CRATE ?auto_12411 ) ( not ( = ?auto_12410 ?auto_12411 ) ) ( AVAILABLE ?auto_12413 ) ( IN ?auto_12411 ?auto_12414 ) ( ON ?auto_12410 ?auto_12409 ) ( not ( = ?auto_12409 ?auto_12410 ) ) ( not ( = ?auto_12409 ?auto_12411 ) ) ( TRUCK-AT ?auto_12414 ?auto_12412 ) ( not ( = ?auto_12412 ?auto_12415 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12410 ?auto_12411 )
      ( MAKE-2CRATE-VERIFY ?auto_12409 ?auto_12410 ?auto_12411 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12416 - SURFACE
      ?auto_12417 - SURFACE
      ?auto_12418 - SURFACE
      ?auto_12419 - SURFACE
    )
    :vars
    (
      ?auto_12423 - HOIST
      ?auto_12422 - PLACE
      ?auto_12421 - TRUCK
      ?auto_12420 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12423 ?auto_12422 ) ( SURFACE-AT ?auto_12418 ?auto_12422 ) ( CLEAR ?auto_12418 ) ( IS-CRATE ?auto_12419 ) ( not ( = ?auto_12418 ?auto_12419 ) ) ( AVAILABLE ?auto_12423 ) ( IN ?auto_12419 ?auto_12421 ) ( ON ?auto_12418 ?auto_12417 ) ( not ( = ?auto_12417 ?auto_12418 ) ) ( not ( = ?auto_12417 ?auto_12419 ) ) ( TRUCK-AT ?auto_12421 ?auto_12420 ) ( not ( = ?auto_12420 ?auto_12422 ) ) ( ON ?auto_12417 ?auto_12416 ) ( not ( = ?auto_12416 ?auto_12417 ) ) ( not ( = ?auto_12416 ?auto_12418 ) ) ( not ( = ?auto_12416 ?auto_12419 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12417 ?auto_12418 ?auto_12419 )
      ( MAKE-3CRATE-VERIFY ?auto_12416 ?auto_12417 ?auto_12418 ?auto_12419 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12424 - SURFACE
      ?auto_12425 - SURFACE
      ?auto_12426 - SURFACE
      ?auto_12427 - SURFACE
      ?auto_12428 - SURFACE
    )
    :vars
    (
      ?auto_12432 - HOIST
      ?auto_12431 - PLACE
      ?auto_12430 - TRUCK
      ?auto_12429 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12432 ?auto_12431 ) ( SURFACE-AT ?auto_12427 ?auto_12431 ) ( CLEAR ?auto_12427 ) ( IS-CRATE ?auto_12428 ) ( not ( = ?auto_12427 ?auto_12428 ) ) ( AVAILABLE ?auto_12432 ) ( IN ?auto_12428 ?auto_12430 ) ( ON ?auto_12427 ?auto_12426 ) ( not ( = ?auto_12426 ?auto_12427 ) ) ( not ( = ?auto_12426 ?auto_12428 ) ) ( TRUCK-AT ?auto_12430 ?auto_12429 ) ( not ( = ?auto_12429 ?auto_12431 ) ) ( ON ?auto_12425 ?auto_12424 ) ( ON ?auto_12426 ?auto_12425 ) ( not ( = ?auto_12424 ?auto_12425 ) ) ( not ( = ?auto_12424 ?auto_12426 ) ) ( not ( = ?auto_12424 ?auto_12427 ) ) ( not ( = ?auto_12424 ?auto_12428 ) ) ( not ( = ?auto_12425 ?auto_12426 ) ) ( not ( = ?auto_12425 ?auto_12427 ) ) ( not ( = ?auto_12425 ?auto_12428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12426 ?auto_12427 ?auto_12428 )
      ( MAKE-4CRATE-VERIFY ?auto_12424 ?auto_12425 ?auto_12426 ?auto_12427 ?auto_12428 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12433 - SURFACE
      ?auto_12434 - SURFACE
    )
    :vars
    (
      ?auto_12438 - HOIST
      ?auto_12437 - PLACE
      ?auto_12439 - SURFACE
      ?auto_12436 - TRUCK
      ?auto_12435 - PLACE
      ?auto_12440 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12438 ?auto_12437 ) ( SURFACE-AT ?auto_12433 ?auto_12437 ) ( CLEAR ?auto_12433 ) ( IS-CRATE ?auto_12434 ) ( not ( = ?auto_12433 ?auto_12434 ) ) ( AVAILABLE ?auto_12438 ) ( ON ?auto_12433 ?auto_12439 ) ( not ( = ?auto_12439 ?auto_12433 ) ) ( not ( = ?auto_12439 ?auto_12434 ) ) ( TRUCK-AT ?auto_12436 ?auto_12435 ) ( not ( = ?auto_12435 ?auto_12437 ) ) ( HOIST-AT ?auto_12440 ?auto_12435 ) ( LIFTING ?auto_12440 ?auto_12434 ) ( not ( = ?auto_12438 ?auto_12440 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12440 ?auto_12434 ?auto_12436 ?auto_12435 )
      ( MAKE-2CRATE ?auto_12439 ?auto_12433 ?auto_12434 )
      ( MAKE-1CRATE-VERIFY ?auto_12433 ?auto_12434 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12441 - SURFACE
      ?auto_12442 - SURFACE
      ?auto_12443 - SURFACE
    )
    :vars
    (
      ?auto_12447 - HOIST
      ?auto_12444 - PLACE
      ?auto_12448 - TRUCK
      ?auto_12445 - PLACE
      ?auto_12446 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12447 ?auto_12444 ) ( SURFACE-AT ?auto_12442 ?auto_12444 ) ( CLEAR ?auto_12442 ) ( IS-CRATE ?auto_12443 ) ( not ( = ?auto_12442 ?auto_12443 ) ) ( AVAILABLE ?auto_12447 ) ( ON ?auto_12442 ?auto_12441 ) ( not ( = ?auto_12441 ?auto_12442 ) ) ( not ( = ?auto_12441 ?auto_12443 ) ) ( TRUCK-AT ?auto_12448 ?auto_12445 ) ( not ( = ?auto_12445 ?auto_12444 ) ) ( HOIST-AT ?auto_12446 ?auto_12445 ) ( LIFTING ?auto_12446 ?auto_12443 ) ( not ( = ?auto_12447 ?auto_12446 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12442 ?auto_12443 )
      ( MAKE-2CRATE-VERIFY ?auto_12441 ?auto_12442 ?auto_12443 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12449 - SURFACE
      ?auto_12450 - SURFACE
      ?auto_12451 - SURFACE
      ?auto_12452 - SURFACE
    )
    :vars
    (
      ?auto_12454 - HOIST
      ?auto_12456 - PLACE
      ?auto_12457 - TRUCK
      ?auto_12455 - PLACE
      ?auto_12453 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12454 ?auto_12456 ) ( SURFACE-AT ?auto_12451 ?auto_12456 ) ( CLEAR ?auto_12451 ) ( IS-CRATE ?auto_12452 ) ( not ( = ?auto_12451 ?auto_12452 ) ) ( AVAILABLE ?auto_12454 ) ( ON ?auto_12451 ?auto_12450 ) ( not ( = ?auto_12450 ?auto_12451 ) ) ( not ( = ?auto_12450 ?auto_12452 ) ) ( TRUCK-AT ?auto_12457 ?auto_12455 ) ( not ( = ?auto_12455 ?auto_12456 ) ) ( HOIST-AT ?auto_12453 ?auto_12455 ) ( LIFTING ?auto_12453 ?auto_12452 ) ( not ( = ?auto_12454 ?auto_12453 ) ) ( ON ?auto_12450 ?auto_12449 ) ( not ( = ?auto_12449 ?auto_12450 ) ) ( not ( = ?auto_12449 ?auto_12451 ) ) ( not ( = ?auto_12449 ?auto_12452 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12450 ?auto_12451 ?auto_12452 )
      ( MAKE-3CRATE-VERIFY ?auto_12449 ?auto_12450 ?auto_12451 ?auto_12452 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12458 - SURFACE
      ?auto_12459 - SURFACE
      ?auto_12460 - SURFACE
      ?auto_12461 - SURFACE
      ?auto_12462 - SURFACE
    )
    :vars
    (
      ?auto_12464 - HOIST
      ?auto_12466 - PLACE
      ?auto_12467 - TRUCK
      ?auto_12465 - PLACE
      ?auto_12463 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12464 ?auto_12466 ) ( SURFACE-AT ?auto_12461 ?auto_12466 ) ( CLEAR ?auto_12461 ) ( IS-CRATE ?auto_12462 ) ( not ( = ?auto_12461 ?auto_12462 ) ) ( AVAILABLE ?auto_12464 ) ( ON ?auto_12461 ?auto_12460 ) ( not ( = ?auto_12460 ?auto_12461 ) ) ( not ( = ?auto_12460 ?auto_12462 ) ) ( TRUCK-AT ?auto_12467 ?auto_12465 ) ( not ( = ?auto_12465 ?auto_12466 ) ) ( HOIST-AT ?auto_12463 ?auto_12465 ) ( LIFTING ?auto_12463 ?auto_12462 ) ( not ( = ?auto_12464 ?auto_12463 ) ) ( ON ?auto_12459 ?auto_12458 ) ( ON ?auto_12460 ?auto_12459 ) ( not ( = ?auto_12458 ?auto_12459 ) ) ( not ( = ?auto_12458 ?auto_12460 ) ) ( not ( = ?auto_12458 ?auto_12461 ) ) ( not ( = ?auto_12458 ?auto_12462 ) ) ( not ( = ?auto_12459 ?auto_12460 ) ) ( not ( = ?auto_12459 ?auto_12461 ) ) ( not ( = ?auto_12459 ?auto_12462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12460 ?auto_12461 ?auto_12462 )
      ( MAKE-4CRATE-VERIFY ?auto_12458 ?auto_12459 ?auto_12460 ?auto_12461 ?auto_12462 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12468 - SURFACE
      ?auto_12469 - SURFACE
    )
    :vars
    (
      ?auto_12471 - HOIST
      ?auto_12473 - PLACE
      ?auto_12474 - SURFACE
      ?auto_12475 - TRUCK
      ?auto_12472 - PLACE
      ?auto_12470 - HOIST
      ?auto_12476 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12471 ?auto_12473 ) ( SURFACE-AT ?auto_12468 ?auto_12473 ) ( CLEAR ?auto_12468 ) ( IS-CRATE ?auto_12469 ) ( not ( = ?auto_12468 ?auto_12469 ) ) ( AVAILABLE ?auto_12471 ) ( ON ?auto_12468 ?auto_12474 ) ( not ( = ?auto_12474 ?auto_12468 ) ) ( not ( = ?auto_12474 ?auto_12469 ) ) ( TRUCK-AT ?auto_12475 ?auto_12472 ) ( not ( = ?auto_12472 ?auto_12473 ) ) ( HOIST-AT ?auto_12470 ?auto_12472 ) ( not ( = ?auto_12471 ?auto_12470 ) ) ( AVAILABLE ?auto_12470 ) ( SURFACE-AT ?auto_12469 ?auto_12472 ) ( ON ?auto_12469 ?auto_12476 ) ( CLEAR ?auto_12469 ) ( not ( = ?auto_12468 ?auto_12476 ) ) ( not ( = ?auto_12469 ?auto_12476 ) ) ( not ( = ?auto_12474 ?auto_12476 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12470 ?auto_12469 ?auto_12476 ?auto_12472 )
      ( MAKE-2CRATE ?auto_12474 ?auto_12468 ?auto_12469 )
      ( MAKE-1CRATE-VERIFY ?auto_12468 ?auto_12469 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12477 - SURFACE
      ?auto_12478 - SURFACE
      ?auto_12479 - SURFACE
    )
    :vars
    (
      ?auto_12485 - HOIST
      ?auto_12482 - PLACE
      ?auto_12483 - TRUCK
      ?auto_12481 - PLACE
      ?auto_12484 - HOIST
      ?auto_12480 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12485 ?auto_12482 ) ( SURFACE-AT ?auto_12478 ?auto_12482 ) ( CLEAR ?auto_12478 ) ( IS-CRATE ?auto_12479 ) ( not ( = ?auto_12478 ?auto_12479 ) ) ( AVAILABLE ?auto_12485 ) ( ON ?auto_12478 ?auto_12477 ) ( not ( = ?auto_12477 ?auto_12478 ) ) ( not ( = ?auto_12477 ?auto_12479 ) ) ( TRUCK-AT ?auto_12483 ?auto_12481 ) ( not ( = ?auto_12481 ?auto_12482 ) ) ( HOIST-AT ?auto_12484 ?auto_12481 ) ( not ( = ?auto_12485 ?auto_12484 ) ) ( AVAILABLE ?auto_12484 ) ( SURFACE-AT ?auto_12479 ?auto_12481 ) ( ON ?auto_12479 ?auto_12480 ) ( CLEAR ?auto_12479 ) ( not ( = ?auto_12478 ?auto_12480 ) ) ( not ( = ?auto_12479 ?auto_12480 ) ) ( not ( = ?auto_12477 ?auto_12480 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12478 ?auto_12479 )
      ( MAKE-2CRATE-VERIFY ?auto_12477 ?auto_12478 ?auto_12479 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12486 - SURFACE
      ?auto_12487 - SURFACE
      ?auto_12488 - SURFACE
      ?auto_12489 - SURFACE
    )
    :vars
    (
      ?auto_12495 - HOIST
      ?auto_12494 - PLACE
      ?auto_12493 - TRUCK
      ?auto_12492 - PLACE
      ?auto_12491 - HOIST
      ?auto_12490 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12495 ?auto_12494 ) ( SURFACE-AT ?auto_12488 ?auto_12494 ) ( CLEAR ?auto_12488 ) ( IS-CRATE ?auto_12489 ) ( not ( = ?auto_12488 ?auto_12489 ) ) ( AVAILABLE ?auto_12495 ) ( ON ?auto_12488 ?auto_12487 ) ( not ( = ?auto_12487 ?auto_12488 ) ) ( not ( = ?auto_12487 ?auto_12489 ) ) ( TRUCK-AT ?auto_12493 ?auto_12492 ) ( not ( = ?auto_12492 ?auto_12494 ) ) ( HOIST-AT ?auto_12491 ?auto_12492 ) ( not ( = ?auto_12495 ?auto_12491 ) ) ( AVAILABLE ?auto_12491 ) ( SURFACE-AT ?auto_12489 ?auto_12492 ) ( ON ?auto_12489 ?auto_12490 ) ( CLEAR ?auto_12489 ) ( not ( = ?auto_12488 ?auto_12490 ) ) ( not ( = ?auto_12489 ?auto_12490 ) ) ( not ( = ?auto_12487 ?auto_12490 ) ) ( ON ?auto_12487 ?auto_12486 ) ( not ( = ?auto_12486 ?auto_12487 ) ) ( not ( = ?auto_12486 ?auto_12488 ) ) ( not ( = ?auto_12486 ?auto_12489 ) ) ( not ( = ?auto_12486 ?auto_12490 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12487 ?auto_12488 ?auto_12489 )
      ( MAKE-3CRATE-VERIFY ?auto_12486 ?auto_12487 ?auto_12488 ?auto_12489 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12496 - SURFACE
      ?auto_12497 - SURFACE
      ?auto_12498 - SURFACE
      ?auto_12499 - SURFACE
      ?auto_12500 - SURFACE
    )
    :vars
    (
      ?auto_12506 - HOIST
      ?auto_12505 - PLACE
      ?auto_12504 - TRUCK
      ?auto_12503 - PLACE
      ?auto_12502 - HOIST
      ?auto_12501 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12506 ?auto_12505 ) ( SURFACE-AT ?auto_12499 ?auto_12505 ) ( CLEAR ?auto_12499 ) ( IS-CRATE ?auto_12500 ) ( not ( = ?auto_12499 ?auto_12500 ) ) ( AVAILABLE ?auto_12506 ) ( ON ?auto_12499 ?auto_12498 ) ( not ( = ?auto_12498 ?auto_12499 ) ) ( not ( = ?auto_12498 ?auto_12500 ) ) ( TRUCK-AT ?auto_12504 ?auto_12503 ) ( not ( = ?auto_12503 ?auto_12505 ) ) ( HOIST-AT ?auto_12502 ?auto_12503 ) ( not ( = ?auto_12506 ?auto_12502 ) ) ( AVAILABLE ?auto_12502 ) ( SURFACE-AT ?auto_12500 ?auto_12503 ) ( ON ?auto_12500 ?auto_12501 ) ( CLEAR ?auto_12500 ) ( not ( = ?auto_12499 ?auto_12501 ) ) ( not ( = ?auto_12500 ?auto_12501 ) ) ( not ( = ?auto_12498 ?auto_12501 ) ) ( ON ?auto_12497 ?auto_12496 ) ( ON ?auto_12498 ?auto_12497 ) ( not ( = ?auto_12496 ?auto_12497 ) ) ( not ( = ?auto_12496 ?auto_12498 ) ) ( not ( = ?auto_12496 ?auto_12499 ) ) ( not ( = ?auto_12496 ?auto_12500 ) ) ( not ( = ?auto_12496 ?auto_12501 ) ) ( not ( = ?auto_12497 ?auto_12498 ) ) ( not ( = ?auto_12497 ?auto_12499 ) ) ( not ( = ?auto_12497 ?auto_12500 ) ) ( not ( = ?auto_12497 ?auto_12501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12498 ?auto_12499 ?auto_12500 )
      ( MAKE-4CRATE-VERIFY ?auto_12496 ?auto_12497 ?auto_12498 ?auto_12499 ?auto_12500 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12507 - SURFACE
      ?auto_12508 - SURFACE
    )
    :vars
    (
      ?auto_12515 - HOIST
      ?auto_12514 - PLACE
      ?auto_12509 - SURFACE
      ?auto_12512 - PLACE
      ?auto_12511 - HOIST
      ?auto_12510 - SURFACE
      ?auto_12513 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12515 ?auto_12514 ) ( SURFACE-AT ?auto_12507 ?auto_12514 ) ( CLEAR ?auto_12507 ) ( IS-CRATE ?auto_12508 ) ( not ( = ?auto_12507 ?auto_12508 ) ) ( AVAILABLE ?auto_12515 ) ( ON ?auto_12507 ?auto_12509 ) ( not ( = ?auto_12509 ?auto_12507 ) ) ( not ( = ?auto_12509 ?auto_12508 ) ) ( not ( = ?auto_12512 ?auto_12514 ) ) ( HOIST-AT ?auto_12511 ?auto_12512 ) ( not ( = ?auto_12515 ?auto_12511 ) ) ( AVAILABLE ?auto_12511 ) ( SURFACE-AT ?auto_12508 ?auto_12512 ) ( ON ?auto_12508 ?auto_12510 ) ( CLEAR ?auto_12508 ) ( not ( = ?auto_12507 ?auto_12510 ) ) ( not ( = ?auto_12508 ?auto_12510 ) ) ( not ( = ?auto_12509 ?auto_12510 ) ) ( TRUCK-AT ?auto_12513 ?auto_12514 ) )
    :subtasks
    ( ( !DRIVE ?auto_12513 ?auto_12514 ?auto_12512 )
      ( MAKE-2CRATE ?auto_12509 ?auto_12507 ?auto_12508 )
      ( MAKE-1CRATE-VERIFY ?auto_12507 ?auto_12508 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12516 - SURFACE
      ?auto_12517 - SURFACE
      ?auto_12518 - SURFACE
    )
    :vars
    (
      ?auto_12522 - HOIST
      ?auto_12523 - PLACE
      ?auto_12519 - PLACE
      ?auto_12524 - HOIST
      ?auto_12520 - SURFACE
      ?auto_12521 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12522 ?auto_12523 ) ( SURFACE-AT ?auto_12517 ?auto_12523 ) ( CLEAR ?auto_12517 ) ( IS-CRATE ?auto_12518 ) ( not ( = ?auto_12517 ?auto_12518 ) ) ( AVAILABLE ?auto_12522 ) ( ON ?auto_12517 ?auto_12516 ) ( not ( = ?auto_12516 ?auto_12517 ) ) ( not ( = ?auto_12516 ?auto_12518 ) ) ( not ( = ?auto_12519 ?auto_12523 ) ) ( HOIST-AT ?auto_12524 ?auto_12519 ) ( not ( = ?auto_12522 ?auto_12524 ) ) ( AVAILABLE ?auto_12524 ) ( SURFACE-AT ?auto_12518 ?auto_12519 ) ( ON ?auto_12518 ?auto_12520 ) ( CLEAR ?auto_12518 ) ( not ( = ?auto_12517 ?auto_12520 ) ) ( not ( = ?auto_12518 ?auto_12520 ) ) ( not ( = ?auto_12516 ?auto_12520 ) ) ( TRUCK-AT ?auto_12521 ?auto_12523 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12517 ?auto_12518 )
      ( MAKE-2CRATE-VERIFY ?auto_12516 ?auto_12517 ?auto_12518 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12525 - SURFACE
      ?auto_12526 - SURFACE
      ?auto_12527 - SURFACE
      ?auto_12528 - SURFACE
    )
    :vars
    (
      ?auto_12529 - HOIST
      ?auto_12533 - PLACE
      ?auto_12532 - PLACE
      ?auto_12531 - HOIST
      ?auto_12530 - SURFACE
      ?auto_12534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12529 ?auto_12533 ) ( SURFACE-AT ?auto_12527 ?auto_12533 ) ( CLEAR ?auto_12527 ) ( IS-CRATE ?auto_12528 ) ( not ( = ?auto_12527 ?auto_12528 ) ) ( AVAILABLE ?auto_12529 ) ( ON ?auto_12527 ?auto_12526 ) ( not ( = ?auto_12526 ?auto_12527 ) ) ( not ( = ?auto_12526 ?auto_12528 ) ) ( not ( = ?auto_12532 ?auto_12533 ) ) ( HOIST-AT ?auto_12531 ?auto_12532 ) ( not ( = ?auto_12529 ?auto_12531 ) ) ( AVAILABLE ?auto_12531 ) ( SURFACE-AT ?auto_12528 ?auto_12532 ) ( ON ?auto_12528 ?auto_12530 ) ( CLEAR ?auto_12528 ) ( not ( = ?auto_12527 ?auto_12530 ) ) ( not ( = ?auto_12528 ?auto_12530 ) ) ( not ( = ?auto_12526 ?auto_12530 ) ) ( TRUCK-AT ?auto_12534 ?auto_12533 ) ( ON ?auto_12526 ?auto_12525 ) ( not ( = ?auto_12525 ?auto_12526 ) ) ( not ( = ?auto_12525 ?auto_12527 ) ) ( not ( = ?auto_12525 ?auto_12528 ) ) ( not ( = ?auto_12525 ?auto_12530 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12526 ?auto_12527 ?auto_12528 )
      ( MAKE-3CRATE-VERIFY ?auto_12525 ?auto_12526 ?auto_12527 ?auto_12528 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12535 - SURFACE
      ?auto_12536 - SURFACE
      ?auto_12537 - SURFACE
      ?auto_12538 - SURFACE
      ?auto_12539 - SURFACE
    )
    :vars
    (
      ?auto_12540 - HOIST
      ?auto_12544 - PLACE
      ?auto_12543 - PLACE
      ?auto_12542 - HOIST
      ?auto_12541 - SURFACE
      ?auto_12545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12540 ?auto_12544 ) ( SURFACE-AT ?auto_12538 ?auto_12544 ) ( CLEAR ?auto_12538 ) ( IS-CRATE ?auto_12539 ) ( not ( = ?auto_12538 ?auto_12539 ) ) ( AVAILABLE ?auto_12540 ) ( ON ?auto_12538 ?auto_12537 ) ( not ( = ?auto_12537 ?auto_12538 ) ) ( not ( = ?auto_12537 ?auto_12539 ) ) ( not ( = ?auto_12543 ?auto_12544 ) ) ( HOIST-AT ?auto_12542 ?auto_12543 ) ( not ( = ?auto_12540 ?auto_12542 ) ) ( AVAILABLE ?auto_12542 ) ( SURFACE-AT ?auto_12539 ?auto_12543 ) ( ON ?auto_12539 ?auto_12541 ) ( CLEAR ?auto_12539 ) ( not ( = ?auto_12538 ?auto_12541 ) ) ( not ( = ?auto_12539 ?auto_12541 ) ) ( not ( = ?auto_12537 ?auto_12541 ) ) ( TRUCK-AT ?auto_12545 ?auto_12544 ) ( ON ?auto_12536 ?auto_12535 ) ( ON ?auto_12537 ?auto_12536 ) ( not ( = ?auto_12535 ?auto_12536 ) ) ( not ( = ?auto_12535 ?auto_12537 ) ) ( not ( = ?auto_12535 ?auto_12538 ) ) ( not ( = ?auto_12535 ?auto_12539 ) ) ( not ( = ?auto_12535 ?auto_12541 ) ) ( not ( = ?auto_12536 ?auto_12537 ) ) ( not ( = ?auto_12536 ?auto_12538 ) ) ( not ( = ?auto_12536 ?auto_12539 ) ) ( not ( = ?auto_12536 ?auto_12541 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12537 ?auto_12538 ?auto_12539 )
      ( MAKE-4CRATE-VERIFY ?auto_12535 ?auto_12536 ?auto_12537 ?auto_12538 ?auto_12539 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12546 - SURFACE
      ?auto_12547 - SURFACE
    )
    :vars
    (
      ?auto_12549 - HOIST
      ?auto_12553 - PLACE
      ?auto_12548 - SURFACE
      ?auto_12552 - PLACE
      ?auto_12551 - HOIST
      ?auto_12550 - SURFACE
      ?auto_12554 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12549 ?auto_12553 ) ( IS-CRATE ?auto_12547 ) ( not ( = ?auto_12546 ?auto_12547 ) ) ( not ( = ?auto_12548 ?auto_12546 ) ) ( not ( = ?auto_12548 ?auto_12547 ) ) ( not ( = ?auto_12552 ?auto_12553 ) ) ( HOIST-AT ?auto_12551 ?auto_12552 ) ( not ( = ?auto_12549 ?auto_12551 ) ) ( AVAILABLE ?auto_12551 ) ( SURFACE-AT ?auto_12547 ?auto_12552 ) ( ON ?auto_12547 ?auto_12550 ) ( CLEAR ?auto_12547 ) ( not ( = ?auto_12546 ?auto_12550 ) ) ( not ( = ?auto_12547 ?auto_12550 ) ) ( not ( = ?auto_12548 ?auto_12550 ) ) ( TRUCK-AT ?auto_12554 ?auto_12553 ) ( SURFACE-AT ?auto_12548 ?auto_12553 ) ( CLEAR ?auto_12548 ) ( LIFTING ?auto_12549 ?auto_12546 ) ( IS-CRATE ?auto_12546 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12548 ?auto_12546 )
      ( MAKE-2CRATE ?auto_12548 ?auto_12546 ?auto_12547 )
      ( MAKE-1CRATE-VERIFY ?auto_12546 ?auto_12547 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12555 - SURFACE
      ?auto_12556 - SURFACE
      ?auto_12557 - SURFACE
    )
    :vars
    (
      ?auto_12558 - HOIST
      ?auto_12562 - PLACE
      ?auto_12559 - PLACE
      ?auto_12561 - HOIST
      ?auto_12560 - SURFACE
      ?auto_12563 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12558 ?auto_12562 ) ( IS-CRATE ?auto_12557 ) ( not ( = ?auto_12556 ?auto_12557 ) ) ( not ( = ?auto_12555 ?auto_12556 ) ) ( not ( = ?auto_12555 ?auto_12557 ) ) ( not ( = ?auto_12559 ?auto_12562 ) ) ( HOIST-AT ?auto_12561 ?auto_12559 ) ( not ( = ?auto_12558 ?auto_12561 ) ) ( AVAILABLE ?auto_12561 ) ( SURFACE-AT ?auto_12557 ?auto_12559 ) ( ON ?auto_12557 ?auto_12560 ) ( CLEAR ?auto_12557 ) ( not ( = ?auto_12556 ?auto_12560 ) ) ( not ( = ?auto_12557 ?auto_12560 ) ) ( not ( = ?auto_12555 ?auto_12560 ) ) ( TRUCK-AT ?auto_12563 ?auto_12562 ) ( SURFACE-AT ?auto_12555 ?auto_12562 ) ( CLEAR ?auto_12555 ) ( LIFTING ?auto_12558 ?auto_12556 ) ( IS-CRATE ?auto_12556 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12556 ?auto_12557 )
      ( MAKE-2CRATE-VERIFY ?auto_12555 ?auto_12556 ?auto_12557 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12564 - SURFACE
      ?auto_12565 - SURFACE
      ?auto_12566 - SURFACE
      ?auto_12567 - SURFACE
    )
    :vars
    (
      ?auto_12569 - HOIST
      ?auto_12572 - PLACE
      ?auto_12568 - PLACE
      ?auto_12573 - HOIST
      ?auto_12571 - SURFACE
      ?auto_12570 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12569 ?auto_12572 ) ( IS-CRATE ?auto_12567 ) ( not ( = ?auto_12566 ?auto_12567 ) ) ( not ( = ?auto_12565 ?auto_12566 ) ) ( not ( = ?auto_12565 ?auto_12567 ) ) ( not ( = ?auto_12568 ?auto_12572 ) ) ( HOIST-AT ?auto_12573 ?auto_12568 ) ( not ( = ?auto_12569 ?auto_12573 ) ) ( AVAILABLE ?auto_12573 ) ( SURFACE-AT ?auto_12567 ?auto_12568 ) ( ON ?auto_12567 ?auto_12571 ) ( CLEAR ?auto_12567 ) ( not ( = ?auto_12566 ?auto_12571 ) ) ( not ( = ?auto_12567 ?auto_12571 ) ) ( not ( = ?auto_12565 ?auto_12571 ) ) ( TRUCK-AT ?auto_12570 ?auto_12572 ) ( SURFACE-AT ?auto_12565 ?auto_12572 ) ( CLEAR ?auto_12565 ) ( LIFTING ?auto_12569 ?auto_12566 ) ( IS-CRATE ?auto_12566 ) ( ON ?auto_12565 ?auto_12564 ) ( not ( = ?auto_12564 ?auto_12565 ) ) ( not ( = ?auto_12564 ?auto_12566 ) ) ( not ( = ?auto_12564 ?auto_12567 ) ) ( not ( = ?auto_12564 ?auto_12571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12565 ?auto_12566 ?auto_12567 )
      ( MAKE-3CRATE-VERIFY ?auto_12564 ?auto_12565 ?auto_12566 ?auto_12567 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12574 - SURFACE
      ?auto_12575 - SURFACE
      ?auto_12576 - SURFACE
      ?auto_12577 - SURFACE
      ?auto_12578 - SURFACE
    )
    :vars
    (
      ?auto_12580 - HOIST
      ?auto_12583 - PLACE
      ?auto_12579 - PLACE
      ?auto_12584 - HOIST
      ?auto_12582 - SURFACE
      ?auto_12581 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12580 ?auto_12583 ) ( IS-CRATE ?auto_12578 ) ( not ( = ?auto_12577 ?auto_12578 ) ) ( not ( = ?auto_12576 ?auto_12577 ) ) ( not ( = ?auto_12576 ?auto_12578 ) ) ( not ( = ?auto_12579 ?auto_12583 ) ) ( HOIST-AT ?auto_12584 ?auto_12579 ) ( not ( = ?auto_12580 ?auto_12584 ) ) ( AVAILABLE ?auto_12584 ) ( SURFACE-AT ?auto_12578 ?auto_12579 ) ( ON ?auto_12578 ?auto_12582 ) ( CLEAR ?auto_12578 ) ( not ( = ?auto_12577 ?auto_12582 ) ) ( not ( = ?auto_12578 ?auto_12582 ) ) ( not ( = ?auto_12576 ?auto_12582 ) ) ( TRUCK-AT ?auto_12581 ?auto_12583 ) ( SURFACE-AT ?auto_12576 ?auto_12583 ) ( CLEAR ?auto_12576 ) ( LIFTING ?auto_12580 ?auto_12577 ) ( IS-CRATE ?auto_12577 ) ( ON ?auto_12575 ?auto_12574 ) ( ON ?auto_12576 ?auto_12575 ) ( not ( = ?auto_12574 ?auto_12575 ) ) ( not ( = ?auto_12574 ?auto_12576 ) ) ( not ( = ?auto_12574 ?auto_12577 ) ) ( not ( = ?auto_12574 ?auto_12578 ) ) ( not ( = ?auto_12574 ?auto_12582 ) ) ( not ( = ?auto_12575 ?auto_12576 ) ) ( not ( = ?auto_12575 ?auto_12577 ) ) ( not ( = ?auto_12575 ?auto_12578 ) ) ( not ( = ?auto_12575 ?auto_12582 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12576 ?auto_12577 ?auto_12578 )
      ( MAKE-4CRATE-VERIFY ?auto_12574 ?auto_12575 ?auto_12576 ?auto_12577 ?auto_12578 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12585 - SURFACE
      ?auto_12586 - SURFACE
    )
    :vars
    (
      ?auto_12588 - HOIST
      ?auto_12592 - PLACE
      ?auto_12590 - SURFACE
      ?auto_12587 - PLACE
      ?auto_12593 - HOIST
      ?auto_12591 - SURFACE
      ?auto_12589 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12588 ?auto_12592 ) ( IS-CRATE ?auto_12586 ) ( not ( = ?auto_12585 ?auto_12586 ) ) ( not ( = ?auto_12590 ?auto_12585 ) ) ( not ( = ?auto_12590 ?auto_12586 ) ) ( not ( = ?auto_12587 ?auto_12592 ) ) ( HOIST-AT ?auto_12593 ?auto_12587 ) ( not ( = ?auto_12588 ?auto_12593 ) ) ( AVAILABLE ?auto_12593 ) ( SURFACE-AT ?auto_12586 ?auto_12587 ) ( ON ?auto_12586 ?auto_12591 ) ( CLEAR ?auto_12586 ) ( not ( = ?auto_12585 ?auto_12591 ) ) ( not ( = ?auto_12586 ?auto_12591 ) ) ( not ( = ?auto_12590 ?auto_12591 ) ) ( TRUCK-AT ?auto_12589 ?auto_12592 ) ( SURFACE-AT ?auto_12590 ?auto_12592 ) ( CLEAR ?auto_12590 ) ( IS-CRATE ?auto_12585 ) ( AVAILABLE ?auto_12588 ) ( IN ?auto_12585 ?auto_12589 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12588 ?auto_12585 ?auto_12589 ?auto_12592 )
      ( MAKE-2CRATE ?auto_12590 ?auto_12585 ?auto_12586 )
      ( MAKE-1CRATE-VERIFY ?auto_12585 ?auto_12586 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12594 - SURFACE
      ?auto_12595 - SURFACE
      ?auto_12596 - SURFACE
    )
    :vars
    (
      ?auto_12598 - HOIST
      ?auto_12600 - PLACE
      ?auto_12597 - PLACE
      ?auto_12601 - HOIST
      ?auto_12599 - SURFACE
      ?auto_12602 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12598 ?auto_12600 ) ( IS-CRATE ?auto_12596 ) ( not ( = ?auto_12595 ?auto_12596 ) ) ( not ( = ?auto_12594 ?auto_12595 ) ) ( not ( = ?auto_12594 ?auto_12596 ) ) ( not ( = ?auto_12597 ?auto_12600 ) ) ( HOIST-AT ?auto_12601 ?auto_12597 ) ( not ( = ?auto_12598 ?auto_12601 ) ) ( AVAILABLE ?auto_12601 ) ( SURFACE-AT ?auto_12596 ?auto_12597 ) ( ON ?auto_12596 ?auto_12599 ) ( CLEAR ?auto_12596 ) ( not ( = ?auto_12595 ?auto_12599 ) ) ( not ( = ?auto_12596 ?auto_12599 ) ) ( not ( = ?auto_12594 ?auto_12599 ) ) ( TRUCK-AT ?auto_12602 ?auto_12600 ) ( SURFACE-AT ?auto_12594 ?auto_12600 ) ( CLEAR ?auto_12594 ) ( IS-CRATE ?auto_12595 ) ( AVAILABLE ?auto_12598 ) ( IN ?auto_12595 ?auto_12602 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12595 ?auto_12596 )
      ( MAKE-2CRATE-VERIFY ?auto_12594 ?auto_12595 ?auto_12596 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12603 - SURFACE
      ?auto_12604 - SURFACE
      ?auto_12605 - SURFACE
      ?auto_12606 - SURFACE
    )
    :vars
    (
      ?auto_12612 - HOIST
      ?auto_12611 - PLACE
      ?auto_12609 - PLACE
      ?auto_12610 - HOIST
      ?auto_12608 - SURFACE
      ?auto_12607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12612 ?auto_12611 ) ( IS-CRATE ?auto_12606 ) ( not ( = ?auto_12605 ?auto_12606 ) ) ( not ( = ?auto_12604 ?auto_12605 ) ) ( not ( = ?auto_12604 ?auto_12606 ) ) ( not ( = ?auto_12609 ?auto_12611 ) ) ( HOIST-AT ?auto_12610 ?auto_12609 ) ( not ( = ?auto_12612 ?auto_12610 ) ) ( AVAILABLE ?auto_12610 ) ( SURFACE-AT ?auto_12606 ?auto_12609 ) ( ON ?auto_12606 ?auto_12608 ) ( CLEAR ?auto_12606 ) ( not ( = ?auto_12605 ?auto_12608 ) ) ( not ( = ?auto_12606 ?auto_12608 ) ) ( not ( = ?auto_12604 ?auto_12608 ) ) ( TRUCK-AT ?auto_12607 ?auto_12611 ) ( SURFACE-AT ?auto_12604 ?auto_12611 ) ( CLEAR ?auto_12604 ) ( IS-CRATE ?auto_12605 ) ( AVAILABLE ?auto_12612 ) ( IN ?auto_12605 ?auto_12607 ) ( ON ?auto_12604 ?auto_12603 ) ( not ( = ?auto_12603 ?auto_12604 ) ) ( not ( = ?auto_12603 ?auto_12605 ) ) ( not ( = ?auto_12603 ?auto_12606 ) ) ( not ( = ?auto_12603 ?auto_12608 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12604 ?auto_12605 ?auto_12606 )
      ( MAKE-3CRATE-VERIFY ?auto_12603 ?auto_12604 ?auto_12605 ?auto_12606 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12613 - SURFACE
      ?auto_12614 - SURFACE
      ?auto_12615 - SURFACE
      ?auto_12616 - SURFACE
      ?auto_12617 - SURFACE
    )
    :vars
    (
      ?auto_12623 - HOIST
      ?auto_12622 - PLACE
      ?auto_12620 - PLACE
      ?auto_12621 - HOIST
      ?auto_12619 - SURFACE
      ?auto_12618 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12623 ?auto_12622 ) ( IS-CRATE ?auto_12617 ) ( not ( = ?auto_12616 ?auto_12617 ) ) ( not ( = ?auto_12615 ?auto_12616 ) ) ( not ( = ?auto_12615 ?auto_12617 ) ) ( not ( = ?auto_12620 ?auto_12622 ) ) ( HOIST-AT ?auto_12621 ?auto_12620 ) ( not ( = ?auto_12623 ?auto_12621 ) ) ( AVAILABLE ?auto_12621 ) ( SURFACE-AT ?auto_12617 ?auto_12620 ) ( ON ?auto_12617 ?auto_12619 ) ( CLEAR ?auto_12617 ) ( not ( = ?auto_12616 ?auto_12619 ) ) ( not ( = ?auto_12617 ?auto_12619 ) ) ( not ( = ?auto_12615 ?auto_12619 ) ) ( TRUCK-AT ?auto_12618 ?auto_12622 ) ( SURFACE-AT ?auto_12615 ?auto_12622 ) ( CLEAR ?auto_12615 ) ( IS-CRATE ?auto_12616 ) ( AVAILABLE ?auto_12623 ) ( IN ?auto_12616 ?auto_12618 ) ( ON ?auto_12614 ?auto_12613 ) ( ON ?auto_12615 ?auto_12614 ) ( not ( = ?auto_12613 ?auto_12614 ) ) ( not ( = ?auto_12613 ?auto_12615 ) ) ( not ( = ?auto_12613 ?auto_12616 ) ) ( not ( = ?auto_12613 ?auto_12617 ) ) ( not ( = ?auto_12613 ?auto_12619 ) ) ( not ( = ?auto_12614 ?auto_12615 ) ) ( not ( = ?auto_12614 ?auto_12616 ) ) ( not ( = ?auto_12614 ?auto_12617 ) ) ( not ( = ?auto_12614 ?auto_12619 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12615 ?auto_12616 ?auto_12617 )
      ( MAKE-4CRATE-VERIFY ?auto_12613 ?auto_12614 ?auto_12615 ?auto_12616 ?auto_12617 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12624 - SURFACE
      ?auto_12625 - SURFACE
    )
    :vars
    (
      ?auto_12632 - HOIST
      ?auto_12631 - PLACE
      ?auto_12626 - SURFACE
      ?auto_12629 - PLACE
      ?auto_12630 - HOIST
      ?auto_12628 - SURFACE
      ?auto_12627 - TRUCK
      ?auto_12633 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12632 ?auto_12631 ) ( IS-CRATE ?auto_12625 ) ( not ( = ?auto_12624 ?auto_12625 ) ) ( not ( = ?auto_12626 ?auto_12624 ) ) ( not ( = ?auto_12626 ?auto_12625 ) ) ( not ( = ?auto_12629 ?auto_12631 ) ) ( HOIST-AT ?auto_12630 ?auto_12629 ) ( not ( = ?auto_12632 ?auto_12630 ) ) ( AVAILABLE ?auto_12630 ) ( SURFACE-AT ?auto_12625 ?auto_12629 ) ( ON ?auto_12625 ?auto_12628 ) ( CLEAR ?auto_12625 ) ( not ( = ?auto_12624 ?auto_12628 ) ) ( not ( = ?auto_12625 ?auto_12628 ) ) ( not ( = ?auto_12626 ?auto_12628 ) ) ( SURFACE-AT ?auto_12626 ?auto_12631 ) ( CLEAR ?auto_12626 ) ( IS-CRATE ?auto_12624 ) ( AVAILABLE ?auto_12632 ) ( IN ?auto_12624 ?auto_12627 ) ( TRUCK-AT ?auto_12627 ?auto_12633 ) ( not ( = ?auto_12633 ?auto_12631 ) ) ( not ( = ?auto_12629 ?auto_12633 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12627 ?auto_12633 ?auto_12631 )
      ( MAKE-2CRATE ?auto_12626 ?auto_12624 ?auto_12625 )
      ( MAKE-1CRATE-VERIFY ?auto_12624 ?auto_12625 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12634 - SURFACE
      ?auto_12635 - SURFACE
      ?auto_12636 - SURFACE
    )
    :vars
    (
      ?auto_12637 - HOIST
      ?auto_12640 - PLACE
      ?auto_12643 - PLACE
      ?auto_12639 - HOIST
      ?auto_12641 - SURFACE
      ?auto_12642 - TRUCK
      ?auto_12638 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12637 ?auto_12640 ) ( IS-CRATE ?auto_12636 ) ( not ( = ?auto_12635 ?auto_12636 ) ) ( not ( = ?auto_12634 ?auto_12635 ) ) ( not ( = ?auto_12634 ?auto_12636 ) ) ( not ( = ?auto_12643 ?auto_12640 ) ) ( HOIST-AT ?auto_12639 ?auto_12643 ) ( not ( = ?auto_12637 ?auto_12639 ) ) ( AVAILABLE ?auto_12639 ) ( SURFACE-AT ?auto_12636 ?auto_12643 ) ( ON ?auto_12636 ?auto_12641 ) ( CLEAR ?auto_12636 ) ( not ( = ?auto_12635 ?auto_12641 ) ) ( not ( = ?auto_12636 ?auto_12641 ) ) ( not ( = ?auto_12634 ?auto_12641 ) ) ( SURFACE-AT ?auto_12634 ?auto_12640 ) ( CLEAR ?auto_12634 ) ( IS-CRATE ?auto_12635 ) ( AVAILABLE ?auto_12637 ) ( IN ?auto_12635 ?auto_12642 ) ( TRUCK-AT ?auto_12642 ?auto_12638 ) ( not ( = ?auto_12638 ?auto_12640 ) ) ( not ( = ?auto_12643 ?auto_12638 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12635 ?auto_12636 )
      ( MAKE-2CRATE-VERIFY ?auto_12634 ?auto_12635 ?auto_12636 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12644 - SURFACE
      ?auto_12645 - SURFACE
      ?auto_12646 - SURFACE
      ?auto_12647 - SURFACE
    )
    :vars
    (
      ?auto_12649 - HOIST
      ?auto_12648 - PLACE
      ?auto_12650 - PLACE
      ?auto_12653 - HOIST
      ?auto_12654 - SURFACE
      ?auto_12652 - TRUCK
      ?auto_12651 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12649 ?auto_12648 ) ( IS-CRATE ?auto_12647 ) ( not ( = ?auto_12646 ?auto_12647 ) ) ( not ( = ?auto_12645 ?auto_12646 ) ) ( not ( = ?auto_12645 ?auto_12647 ) ) ( not ( = ?auto_12650 ?auto_12648 ) ) ( HOIST-AT ?auto_12653 ?auto_12650 ) ( not ( = ?auto_12649 ?auto_12653 ) ) ( AVAILABLE ?auto_12653 ) ( SURFACE-AT ?auto_12647 ?auto_12650 ) ( ON ?auto_12647 ?auto_12654 ) ( CLEAR ?auto_12647 ) ( not ( = ?auto_12646 ?auto_12654 ) ) ( not ( = ?auto_12647 ?auto_12654 ) ) ( not ( = ?auto_12645 ?auto_12654 ) ) ( SURFACE-AT ?auto_12645 ?auto_12648 ) ( CLEAR ?auto_12645 ) ( IS-CRATE ?auto_12646 ) ( AVAILABLE ?auto_12649 ) ( IN ?auto_12646 ?auto_12652 ) ( TRUCK-AT ?auto_12652 ?auto_12651 ) ( not ( = ?auto_12651 ?auto_12648 ) ) ( not ( = ?auto_12650 ?auto_12651 ) ) ( ON ?auto_12645 ?auto_12644 ) ( not ( = ?auto_12644 ?auto_12645 ) ) ( not ( = ?auto_12644 ?auto_12646 ) ) ( not ( = ?auto_12644 ?auto_12647 ) ) ( not ( = ?auto_12644 ?auto_12654 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12645 ?auto_12646 ?auto_12647 )
      ( MAKE-3CRATE-VERIFY ?auto_12644 ?auto_12645 ?auto_12646 ?auto_12647 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12655 - SURFACE
      ?auto_12656 - SURFACE
      ?auto_12657 - SURFACE
      ?auto_12658 - SURFACE
      ?auto_12659 - SURFACE
    )
    :vars
    (
      ?auto_12661 - HOIST
      ?auto_12660 - PLACE
      ?auto_12662 - PLACE
      ?auto_12665 - HOIST
      ?auto_12666 - SURFACE
      ?auto_12664 - TRUCK
      ?auto_12663 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12661 ?auto_12660 ) ( IS-CRATE ?auto_12659 ) ( not ( = ?auto_12658 ?auto_12659 ) ) ( not ( = ?auto_12657 ?auto_12658 ) ) ( not ( = ?auto_12657 ?auto_12659 ) ) ( not ( = ?auto_12662 ?auto_12660 ) ) ( HOIST-AT ?auto_12665 ?auto_12662 ) ( not ( = ?auto_12661 ?auto_12665 ) ) ( AVAILABLE ?auto_12665 ) ( SURFACE-AT ?auto_12659 ?auto_12662 ) ( ON ?auto_12659 ?auto_12666 ) ( CLEAR ?auto_12659 ) ( not ( = ?auto_12658 ?auto_12666 ) ) ( not ( = ?auto_12659 ?auto_12666 ) ) ( not ( = ?auto_12657 ?auto_12666 ) ) ( SURFACE-AT ?auto_12657 ?auto_12660 ) ( CLEAR ?auto_12657 ) ( IS-CRATE ?auto_12658 ) ( AVAILABLE ?auto_12661 ) ( IN ?auto_12658 ?auto_12664 ) ( TRUCK-AT ?auto_12664 ?auto_12663 ) ( not ( = ?auto_12663 ?auto_12660 ) ) ( not ( = ?auto_12662 ?auto_12663 ) ) ( ON ?auto_12656 ?auto_12655 ) ( ON ?auto_12657 ?auto_12656 ) ( not ( = ?auto_12655 ?auto_12656 ) ) ( not ( = ?auto_12655 ?auto_12657 ) ) ( not ( = ?auto_12655 ?auto_12658 ) ) ( not ( = ?auto_12655 ?auto_12659 ) ) ( not ( = ?auto_12655 ?auto_12666 ) ) ( not ( = ?auto_12656 ?auto_12657 ) ) ( not ( = ?auto_12656 ?auto_12658 ) ) ( not ( = ?auto_12656 ?auto_12659 ) ) ( not ( = ?auto_12656 ?auto_12666 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12657 ?auto_12658 ?auto_12659 )
      ( MAKE-4CRATE-VERIFY ?auto_12655 ?auto_12656 ?auto_12657 ?auto_12658 ?auto_12659 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12667 - SURFACE
      ?auto_12668 - SURFACE
    )
    :vars
    (
      ?auto_12670 - HOIST
      ?auto_12669 - PLACE
      ?auto_12672 - SURFACE
      ?auto_12671 - PLACE
      ?auto_12675 - HOIST
      ?auto_12676 - SURFACE
      ?auto_12674 - TRUCK
      ?auto_12673 - PLACE
      ?auto_12677 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12670 ?auto_12669 ) ( IS-CRATE ?auto_12668 ) ( not ( = ?auto_12667 ?auto_12668 ) ) ( not ( = ?auto_12672 ?auto_12667 ) ) ( not ( = ?auto_12672 ?auto_12668 ) ) ( not ( = ?auto_12671 ?auto_12669 ) ) ( HOIST-AT ?auto_12675 ?auto_12671 ) ( not ( = ?auto_12670 ?auto_12675 ) ) ( AVAILABLE ?auto_12675 ) ( SURFACE-AT ?auto_12668 ?auto_12671 ) ( ON ?auto_12668 ?auto_12676 ) ( CLEAR ?auto_12668 ) ( not ( = ?auto_12667 ?auto_12676 ) ) ( not ( = ?auto_12668 ?auto_12676 ) ) ( not ( = ?auto_12672 ?auto_12676 ) ) ( SURFACE-AT ?auto_12672 ?auto_12669 ) ( CLEAR ?auto_12672 ) ( IS-CRATE ?auto_12667 ) ( AVAILABLE ?auto_12670 ) ( TRUCK-AT ?auto_12674 ?auto_12673 ) ( not ( = ?auto_12673 ?auto_12669 ) ) ( not ( = ?auto_12671 ?auto_12673 ) ) ( HOIST-AT ?auto_12677 ?auto_12673 ) ( LIFTING ?auto_12677 ?auto_12667 ) ( not ( = ?auto_12670 ?auto_12677 ) ) ( not ( = ?auto_12675 ?auto_12677 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12677 ?auto_12667 ?auto_12674 ?auto_12673 )
      ( MAKE-2CRATE ?auto_12672 ?auto_12667 ?auto_12668 )
      ( MAKE-1CRATE-VERIFY ?auto_12667 ?auto_12668 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12678 - SURFACE
      ?auto_12679 - SURFACE
      ?auto_12680 - SURFACE
    )
    :vars
    (
      ?auto_12686 - HOIST
      ?auto_12684 - PLACE
      ?auto_12682 - PLACE
      ?auto_12687 - HOIST
      ?auto_12688 - SURFACE
      ?auto_12683 - TRUCK
      ?auto_12681 - PLACE
      ?auto_12685 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12686 ?auto_12684 ) ( IS-CRATE ?auto_12680 ) ( not ( = ?auto_12679 ?auto_12680 ) ) ( not ( = ?auto_12678 ?auto_12679 ) ) ( not ( = ?auto_12678 ?auto_12680 ) ) ( not ( = ?auto_12682 ?auto_12684 ) ) ( HOIST-AT ?auto_12687 ?auto_12682 ) ( not ( = ?auto_12686 ?auto_12687 ) ) ( AVAILABLE ?auto_12687 ) ( SURFACE-AT ?auto_12680 ?auto_12682 ) ( ON ?auto_12680 ?auto_12688 ) ( CLEAR ?auto_12680 ) ( not ( = ?auto_12679 ?auto_12688 ) ) ( not ( = ?auto_12680 ?auto_12688 ) ) ( not ( = ?auto_12678 ?auto_12688 ) ) ( SURFACE-AT ?auto_12678 ?auto_12684 ) ( CLEAR ?auto_12678 ) ( IS-CRATE ?auto_12679 ) ( AVAILABLE ?auto_12686 ) ( TRUCK-AT ?auto_12683 ?auto_12681 ) ( not ( = ?auto_12681 ?auto_12684 ) ) ( not ( = ?auto_12682 ?auto_12681 ) ) ( HOIST-AT ?auto_12685 ?auto_12681 ) ( LIFTING ?auto_12685 ?auto_12679 ) ( not ( = ?auto_12686 ?auto_12685 ) ) ( not ( = ?auto_12687 ?auto_12685 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12679 ?auto_12680 )
      ( MAKE-2CRATE-VERIFY ?auto_12678 ?auto_12679 ?auto_12680 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12689 - SURFACE
      ?auto_12690 - SURFACE
      ?auto_12691 - SURFACE
      ?auto_12692 - SURFACE
    )
    :vars
    (
      ?auto_12697 - HOIST
      ?auto_12696 - PLACE
      ?auto_12693 - PLACE
      ?auto_12699 - HOIST
      ?auto_12698 - SURFACE
      ?auto_12695 - TRUCK
      ?auto_12700 - PLACE
      ?auto_12694 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12697 ?auto_12696 ) ( IS-CRATE ?auto_12692 ) ( not ( = ?auto_12691 ?auto_12692 ) ) ( not ( = ?auto_12690 ?auto_12691 ) ) ( not ( = ?auto_12690 ?auto_12692 ) ) ( not ( = ?auto_12693 ?auto_12696 ) ) ( HOIST-AT ?auto_12699 ?auto_12693 ) ( not ( = ?auto_12697 ?auto_12699 ) ) ( AVAILABLE ?auto_12699 ) ( SURFACE-AT ?auto_12692 ?auto_12693 ) ( ON ?auto_12692 ?auto_12698 ) ( CLEAR ?auto_12692 ) ( not ( = ?auto_12691 ?auto_12698 ) ) ( not ( = ?auto_12692 ?auto_12698 ) ) ( not ( = ?auto_12690 ?auto_12698 ) ) ( SURFACE-AT ?auto_12690 ?auto_12696 ) ( CLEAR ?auto_12690 ) ( IS-CRATE ?auto_12691 ) ( AVAILABLE ?auto_12697 ) ( TRUCK-AT ?auto_12695 ?auto_12700 ) ( not ( = ?auto_12700 ?auto_12696 ) ) ( not ( = ?auto_12693 ?auto_12700 ) ) ( HOIST-AT ?auto_12694 ?auto_12700 ) ( LIFTING ?auto_12694 ?auto_12691 ) ( not ( = ?auto_12697 ?auto_12694 ) ) ( not ( = ?auto_12699 ?auto_12694 ) ) ( ON ?auto_12690 ?auto_12689 ) ( not ( = ?auto_12689 ?auto_12690 ) ) ( not ( = ?auto_12689 ?auto_12691 ) ) ( not ( = ?auto_12689 ?auto_12692 ) ) ( not ( = ?auto_12689 ?auto_12698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12690 ?auto_12691 ?auto_12692 )
      ( MAKE-3CRATE-VERIFY ?auto_12689 ?auto_12690 ?auto_12691 ?auto_12692 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12701 - SURFACE
      ?auto_12702 - SURFACE
      ?auto_12703 - SURFACE
      ?auto_12704 - SURFACE
      ?auto_12705 - SURFACE
    )
    :vars
    (
      ?auto_12710 - HOIST
      ?auto_12709 - PLACE
      ?auto_12706 - PLACE
      ?auto_12712 - HOIST
      ?auto_12711 - SURFACE
      ?auto_12708 - TRUCK
      ?auto_12713 - PLACE
      ?auto_12707 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12710 ?auto_12709 ) ( IS-CRATE ?auto_12705 ) ( not ( = ?auto_12704 ?auto_12705 ) ) ( not ( = ?auto_12703 ?auto_12704 ) ) ( not ( = ?auto_12703 ?auto_12705 ) ) ( not ( = ?auto_12706 ?auto_12709 ) ) ( HOIST-AT ?auto_12712 ?auto_12706 ) ( not ( = ?auto_12710 ?auto_12712 ) ) ( AVAILABLE ?auto_12712 ) ( SURFACE-AT ?auto_12705 ?auto_12706 ) ( ON ?auto_12705 ?auto_12711 ) ( CLEAR ?auto_12705 ) ( not ( = ?auto_12704 ?auto_12711 ) ) ( not ( = ?auto_12705 ?auto_12711 ) ) ( not ( = ?auto_12703 ?auto_12711 ) ) ( SURFACE-AT ?auto_12703 ?auto_12709 ) ( CLEAR ?auto_12703 ) ( IS-CRATE ?auto_12704 ) ( AVAILABLE ?auto_12710 ) ( TRUCK-AT ?auto_12708 ?auto_12713 ) ( not ( = ?auto_12713 ?auto_12709 ) ) ( not ( = ?auto_12706 ?auto_12713 ) ) ( HOIST-AT ?auto_12707 ?auto_12713 ) ( LIFTING ?auto_12707 ?auto_12704 ) ( not ( = ?auto_12710 ?auto_12707 ) ) ( not ( = ?auto_12712 ?auto_12707 ) ) ( ON ?auto_12702 ?auto_12701 ) ( ON ?auto_12703 ?auto_12702 ) ( not ( = ?auto_12701 ?auto_12702 ) ) ( not ( = ?auto_12701 ?auto_12703 ) ) ( not ( = ?auto_12701 ?auto_12704 ) ) ( not ( = ?auto_12701 ?auto_12705 ) ) ( not ( = ?auto_12701 ?auto_12711 ) ) ( not ( = ?auto_12702 ?auto_12703 ) ) ( not ( = ?auto_12702 ?auto_12704 ) ) ( not ( = ?auto_12702 ?auto_12705 ) ) ( not ( = ?auto_12702 ?auto_12711 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12703 ?auto_12704 ?auto_12705 )
      ( MAKE-4CRATE-VERIFY ?auto_12701 ?auto_12702 ?auto_12703 ?auto_12704 ?auto_12705 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12714 - SURFACE
      ?auto_12715 - SURFACE
    )
    :vars
    (
      ?auto_12721 - HOIST
      ?auto_12720 - PLACE
      ?auto_12718 - SURFACE
      ?auto_12716 - PLACE
      ?auto_12723 - HOIST
      ?auto_12722 - SURFACE
      ?auto_12719 - TRUCK
      ?auto_12724 - PLACE
      ?auto_12717 - HOIST
      ?auto_12725 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12721 ?auto_12720 ) ( IS-CRATE ?auto_12715 ) ( not ( = ?auto_12714 ?auto_12715 ) ) ( not ( = ?auto_12718 ?auto_12714 ) ) ( not ( = ?auto_12718 ?auto_12715 ) ) ( not ( = ?auto_12716 ?auto_12720 ) ) ( HOIST-AT ?auto_12723 ?auto_12716 ) ( not ( = ?auto_12721 ?auto_12723 ) ) ( AVAILABLE ?auto_12723 ) ( SURFACE-AT ?auto_12715 ?auto_12716 ) ( ON ?auto_12715 ?auto_12722 ) ( CLEAR ?auto_12715 ) ( not ( = ?auto_12714 ?auto_12722 ) ) ( not ( = ?auto_12715 ?auto_12722 ) ) ( not ( = ?auto_12718 ?auto_12722 ) ) ( SURFACE-AT ?auto_12718 ?auto_12720 ) ( CLEAR ?auto_12718 ) ( IS-CRATE ?auto_12714 ) ( AVAILABLE ?auto_12721 ) ( TRUCK-AT ?auto_12719 ?auto_12724 ) ( not ( = ?auto_12724 ?auto_12720 ) ) ( not ( = ?auto_12716 ?auto_12724 ) ) ( HOIST-AT ?auto_12717 ?auto_12724 ) ( not ( = ?auto_12721 ?auto_12717 ) ) ( not ( = ?auto_12723 ?auto_12717 ) ) ( AVAILABLE ?auto_12717 ) ( SURFACE-AT ?auto_12714 ?auto_12724 ) ( ON ?auto_12714 ?auto_12725 ) ( CLEAR ?auto_12714 ) ( not ( = ?auto_12714 ?auto_12725 ) ) ( not ( = ?auto_12715 ?auto_12725 ) ) ( not ( = ?auto_12718 ?auto_12725 ) ) ( not ( = ?auto_12722 ?auto_12725 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12717 ?auto_12714 ?auto_12725 ?auto_12724 )
      ( MAKE-2CRATE ?auto_12718 ?auto_12714 ?auto_12715 )
      ( MAKE-1CRATE-VERIFY ?auto_12714 ?auto_12715 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12726 - SURFACE
      ?auto_12727 - SURFACE
      ?auto_12728 - SURFACE
    )
    :vars
    (
      ?auto_12735 - HOIST
      ?auto_12731 - PLACE
      ?auto_12736 - PLACE
      ?auto_12732 - HOIST
      ?auto_12729 - SURFACE
      ?auto_12730 - TRUCK
      ?auto_12734 - PLACE
      ?auto_12733 - HOIST
      ?auto_12737 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12735 ?auto_12731 ) ( IS-CRATE ?auto_12728 ) ( not ( = ?auto_12727 ?auto_12728 ) ) ( not ( = ?auto_12726 ?auto_12727 ) ) ( not ( = ?auto_12726 ?auto_12728 ) ) ( not ( = ?auto_12736 ?auto_12731 ) ) ( HOIST-AT ?auto_12732 ?auto_12736 ) ( not ( = ?auto_12735 ?auto_12732 ) ) ( AVAILABLE ?auto_12732 ) ( SURFACE-AT ?auto_12728 ?auto_12736 ) ( ON ?auto_12728 ?auto_12729 ) ( CLEAR ?auto_12728 ) ( not ( = ?auto_12727 ?auto_12729 ) ) ( not ( = ?auto_12728 ?auto_12729 ) ) ( not ( = ?auto_12726 ?auto_12729 ) ) ( SURFACE-AT ?auto_12726 ?auto_12731 ) ( CLEAR ?auto_12726 ) ( IS-CRATE ?auto_12727 ) ( AVAILABLE ?auto_12735 ) ( TRUCK-AT ?auto_12730 ?auto_12734 ) ( not ( = ?auto_12734 ?auto_12731 ) ) ( not ( = ?auto_12736 ?auto_12734 ) ) ( HOIST-AT ?auto_12733 ?auto_12734 ) ( not ( = ?auto_12735 ?auto_12733 ) ) ( not ( = ?auto_12732 ?auto_12733 ) ) ( AVAILABLE ?auto_12733 ) ( SURFACE-AT ?auto_12727 ?auto_12734 ) ( ON ?auto_12727 ?auto_12737 ) ( CLEAR ?auto_12727 ) ( not ( = ?auto_12727 ?auto_12737 ) ) ( not ( = ?auto_12728 ?auto_12737 ) ) ( not ( = ?auto_12726 ?auto_12737 ) ) ( not ( = ?auto_12729 ?auto_12737 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12727 ?auto_12728 )
      ( MAKE-2CRATE-VERIFY ?auto_12726 ?auto_12727 ?auto_12728 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12738 - SURFACE
      ?auto_12739 - SURFACE
      ?auto_12740 - SURFACE
      ?auto_12741 - SURFACE
    )
    :vars
    (
      ?auto_12744 - HOIST
      ?auto_12746 - PLACE
      ?auto_12745 - PLACE
      ?auto_12743 - HOIST
      ?auto_12749 - SURFACE
      ?auto_12748 - TRUCK
      ?auto_12750 - PLACE
      ?auto_12747 - HOIST
      ?auto_12742 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12744 ?auto_12746 ) ( IS-CRATE ?auto_12741 ) ( not ( = ?auto_12740 ?auto_12741 ) ) ( not ( = ?auto_12739 ?auto_12740 ) ) ( not ( = ?auto_12739 ?auto_12741 ) ) ( not ( = ?auto_12745 ?auto_12746 ) ) ( HOIST-AT ?auto_12743 ?auto_12745 ) ( not ( = ?auto_12744 ?auto_12743 ) ) ( AVAILABLE ?auto_12743 ) ( SURFACE-AT ?auto_12741 ?auto_12745 ) ( ON ?auto_12741 ?auto_12749 ) ( CLEAR ?auto_12741 ) ( not ( = ?auto_12740 ?auto_12749 ) ) ( not ( = ?auto_12741 ?auto_12749 ) ) ( not ( = ?auto_12739 ?auto_12749 ) ) ( SURFACE-AT ?auto_12739 ?auto_12746 ) ( CLEAR ?auto_12739 ) ( IS-CRATE ?auto_12740 ) ( AVAILABLE ?auto_12744 ) ( TRUCK-AT ?auto_12748 ?auto_12750 ) ( not ( = ?auto_12750 ?auto_12746 ) ) ( not ( = ?auto_12745 ?auto_12750 ) ) ( HOIST-AT ?auto_12747 ?auto_12750 ) ( not ( = ?auto_12744 ?auto_12747 ) ) ( not ( = ?auto_12743 ?auto_12747 ) ) ( AVAILABLE ?auto_12747 ) ( SURFACE-AT ?auto_12740 ?auto_12750 ) ( ON ?auto_12740 ?auto_12742 ) ( CLEAR ?auto_12740 ) ( not ( = ?auto_12740 ?auto_12742 ) ) ( not ( = ?auto_12741 ?auto_12742 ) ) ( not ( = ?auto_12739 ?auto_12742 ) ) ( not ( = ?auto_12749 ?auto_12742 ) ) ( ON ?auto_12739 ?auto_12738 ) ( not ( = ?auto_12738 ?auto_12739 ) ) ( not ( = ?auto_12738 ?auto_12740 ) ) ( not ( = ?auto_12738 ?auto_12741 ) ) ( not ( = ?auto_12738 ?auto_12749 ) ) ( not ( = ?auto_12738 ?auto_12742 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12739 ?auto_12740 ?auto_12741 )
      ( MAKE-3CRATE-VERIFY ?auto_12738 ?auto_12739 ?auto_12740 ?auto_12741 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12751 - SURFACE
      ?auto_12752 - SURFACE
      ?auto_12753 - SURFACE
      ?auto_12754 - SURFACE
      ?auto_12755 - SURFACE
    )
    :vars
    (
      ?auto_12758 - HOIST
      ?auto_12760 - PLACE
      ?auto_12759 - PLACE
      ?auto_12757 - HOIST
      ?auto_12763 - SURFACE
      ?auto_12762 - TRUCK
      ?auto_12764 - PLACE
      ?auto_12761 - HOIST
      ?auto_12756 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12758 ?auto_12760 ) ( IS-CRATE ?auto_12755 ) ( not ( = ?auto_12754 ?auto_12755 ) ) ( not ( = ?auto_12753 ?auto_12754 ) ) ( not ( = ?auto_12753 ?auto_12755 ) ) ( not ( = ?auto_12759 ?auto_12760 ) ) ( HOIST-AT ?auto_12757 ?auto_12759 ) ( not ( = ?auto_12758 ?auto_12757 ) ) ( AVAILABLE ?auto_12757 ) ( SURFACE-AT ?auto_12755 ?auto_12759 ) ( ON ?auto_12755 ?auto_12763 ) ( CLEAR ?auto_12755 ) ( not ( = ?auto_12754 ?auto_12763 ) ) ( not ( = ?auto_12755 ?auto_12763 ) ) ( not ( = ?auto_12753 ?auto_12763 ) ) ( SURFACE-AT ?auto_12753 ?auto_12760 ) ( CLEAR ?auto_12753 ) ( IS-CRATE ?auto_12754 ) ( AVAILABLE ?auto_12758 ) ( TRUCK-AT ?auto_12762 ?auto_12764 ) ( not ( = ?auto_12764 ?auto_12760 ) ) ( not ( = ?auto_12759 ?auto_12764 ) ) ( HOIST-AT ?auto_12761 ?auto_12764 ) ( not ( = ?auto_12758 ?auto_12761 ) ) ( not ( = ?auto_12757 ?auto_12761 ) ) ( AVAILABLE ?auto_12761 ) ( SURFACE-AT ?auto_12754 ?auto_12764 ) ( ON ?auto_12754 ?auto_12756 ) ( CLEAR ?auto_12754 ) ( not ( = ?auto_12754 ?auto_12756 ) ) ( not ( = ?auto_12755 ?auto_12756 ) ) ( not ( = ?auto_12753 ?auto_12756 ) ) ( not ( = ?auto_12763 ?auto_12756 ) ) ( ON ?auto_12752 ?auto_12751 ) ( ON ?auto_12753 ?auto_12752 ) ( not ( = ?auto_12751 ?auto_12752 ) ) ( not ( = ?auto_12751 ?auto_12753 ) ) ( not ( = ?auto_12751 ?auto_12754 ) ) ( not ( = ?auto_12751 ?auto_12755 ) ) ( not ( = ?auto_12751 ?auto_12763 ) ) ( not ( = ?auto_12751 ?auto_12756 ) ) ( not ( = ?auto_12752 ?auto_12753 ) ) ( not ( = ?auto_12752 ?auto_12754 ) ) ( not ( = ?auto_12752 ?auto_12755 ) ) ( not ( = ?auto_12752 ?auto_12763 ) ) ( not ( = ?auto_12752 ?auto_12756 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12753 ?auto_12754 ?auto_12755 )
      ( MAKE-4CRATE-VERIFY ?auto_12751 ?auto_12752 ?auto_12753 ?auto_12754 ?auto_12755 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12765 - SURFACE
      ?auto_12766 - SURFACE
    )
    :vars
    (
      ?auto_12769 - HOIST
      ?auto_12772 - PLACE
      ?auto_12771 - SURFACE
      ?auto_12770 - PLACE
      ?auto_12768 - HOIST
      ?auto_12775 - SURFACE
      ?auto_12776 - PLACE
      ?auto_12773 - HOIST
      ?auto_12767 - SURFACE
      ?auto_12774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12769 ?auto_12772 ) ( IS-CRATE ?auto_12766 ) ( not ( = ?auto_12765 ?auto_12766 ) ) ( not ( = ?auto_12771 ?auto_12765 ) ) ( not ( = ?auto_12771 ?auto_12766 ) ) ( not ( = ?auto_12770 ?auto_12772 ) ) ( HOIST-AT ?auto_12768 ?auto_12770 ) ( not ( = ?auto_12769 ?auto_12768 ) ) ( AVAILABLE ?auto_12768 ) ( SURFACE-AT ?auto_12766 ?auto_12770 ) ( ON ?auto_12766 ?auto_12775 ) ( CLEAR ?auto_12766 ) ( not ( = ?auto_12765 ?auto_12775 ) ) ( not ( = ?auto_12766 ?auto_12775 ) ) ( not ( = ?auto_12771 ?auto_12775 ) ) ( SURFACE-AT ?auto_12771 ?auto_12772 ) ( CLEAR ?auto_12771 ) ( IS-CRATE ?auto_12765 ) ( AVAILABLE ?auto_12769 ) ( not ( = ?auto_12776 ?auto_12772 ) ) ( not ( = ?auto_12770 ?auto_12776 ) ) ( HOIST-AT ?auto_12773 ?auto_12776 ) ( not ( = ?auto_12769 ?auto_12773 ) ) ( not ( = ?auto_12768 ?auto_12773 ) ) ( AVAILABLE ?auto_12773 ) ( SURFACE-AT ?auto_12765 ?auto_12776 ) ( ON ?auto_12765 ?auto_12767 ) ( CLEAR ?auto_12765 ) ( not ( = ?auto_12765 ?auto_12767 ) ) ( not ( = ?auto_12766 ?auto_12767 ) ) ( not ( = ?auto_12771 ?auto_12767 ) ) ( not ( = ?auto_12775 ?auto_12767 ) ) ( TRUCK-AT ?auto_12774 ?auto_12772 ) )
    :subtasks
    ( ( !DRIVE ?auto_12774 ?auto_12772 ?auto_12776 )
      ( MAKE-2CRATE ?auto_12771 ?auto_12765 ?auto_12766 )
      ( MAKE-1CRATE-VERIFY ?auto_12765 ?auto_12766 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12777 - SURFACE
      ?auto_12778 - SURFACE
      ?auto_12779 - SURFACE
    )
    :vars
    (
      ?auto_12787 - HOIST
      ?auto_12783 - PLACE
      ?auto_12786 - PLACE
      ?auto_12782 - HOIST
      ?auto_12785 - SURFACE
      ?auto_12788 - PLACE
      ?auto_12781 - HOIST
      ?auto_12784 - SURFACE
      ?auto_12780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12787 ?auto_12783 ) ( IS-CRATE ?auto_12779 ) ( not ( = ?auto_12778 ?auto_12779 ) ) ( not ( = ?auto_12777 ?auto_12778 ) ) ( not ( = ?auto_12777 ?auto_12779 ) ) ( not ( = ?auto_12786 ?auto_12783 ) ) ( HOIST-AT ?auto_12782 ?auto_12786 ) ( not ( = ?auto_12787 ?auto_12782 ) ) ( AVAILABLE ?auto_12782 ) ( SURFACE-AT ?auto_12779 ?auto_12786 ) ( ON ?auto_12779 ?auto_12785 ) ( CLEAR ?auto_12779 ) ( not ( = ?auto_12778 ?auto_12785 ) ) ( not ( = ?auto_12779 ?auto_12785 ) ) ( not ( = ?auto_12777 ?auto_12785 ) ) ( SURFACE-AT ?auto_12777 ?auto_12783 ) ( CLEAR ?auto_12777 ) ( IS-CRATE ?auto_12778 ) ( AVAILABLE ?auto_12787 ) ( not ( = ?auto_12788 ?auto_12783 ) ) ( not ( = ?auto_12786 ?auto_12788 ) ) ( HOIST-AT ?auto_12781 ?auto_12788 ) ( not ( = ?auto_12787 ?auto_12781 ) ) ( not ( = ?auto_12782 ?auto_12781 ) ) ( AVAILABLE ?auto_12781 ) ( SURFACE-AT ?auto_12778 ?auto_12788 ) ( ON ?auto_12778 ?auto_12784 ) ( CLEAR ?auto_12778 ) ( not ( = ?auto_12778 ?auto_12784 ) ) ( not ( = ?auto_12779 ?auto_12784 ) ) ( not ( = ?auto_12777 ?auto_12784 ) ) ( not ( = ?auto_12785 ?auto_12784 ) ) ( TRUCK-AT ?auto_12780 ?auto_12783 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12778 ?auto_12779 )
      ( MAKE-2CRATE-VERIFY ?auto_12777 ?auto_12778 ?auto_12779 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12789 - SURFACE
      ?auto_12790 - SURFACE
      ?auto_12791 - SURFACE
      ?auto_12792 - SURFACE
    )
    :vars
    (
      ?auto_12794 - HOIST
      ?auto_12797 - PLACE
      ?auto_12798 - PLACE
      ?auto_12795 - HOIST
      ?auto_12793 - SURFACE
      ?auto_12800 - PLACE
      ?auto_12801 - HOIST
      ?auto_12799 - SURFACE
      ?auto_12796 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12794 ?auto_12797 ) ( IS-CRATE ?auto_12792 ) ( not ( = ?auto_12791 ?auto_12792 ) ) ( not ( = ?auto_12790 ?auto_12791 ) ) ( not ( = ?auto_12790 ?auto_12792 ) ) ( not ( = ?auto_12798 ?auto_12797 ) ) ( HOIST-AT ?auto_12795 ?auto_12798 ) ( not ( = ?auto_12794 ?auto_12795 ) ) ( AVAILABLE ?auto_12795 ) ( SURFACE-AT ?auto_12792 ?auto_12798 ) ( ON ?auto_12792 ?auto_12793 ) ( CLEAR ?auto_12792 ) ( not ( = ?auto_12791 ?auto_12793 ) ) ( not ( = ?auto_12792 ?auto_12793 ) ) ( not ( = ?auto_12790 ?auto_12793 ) ) ( SURFACE-AT ?auto_12790 ?auto_12797 ) ( CLEAR ?auto_12790 ) ( IS-CRATE ?auto_12791 ) ( AVAILABLE ?auto_12794 ) ( not ( = ?auto_12800 ?auto_12797 ) ) ( not ( = ?auto_12798 ?auto_12800 ) ) ( HOIST-AT ?auto_12801 ?auto_12800 ) ( not ( = ?auto_12794 ?auto_12801 ) ) ( not ( = ?auto_12795 ?auto_12801 ) ) ( AVAILABLE ?auto_12801 ) ( SURFACE-AT ?auto_12791 ?auto_12800 ) ( ON ?auto_12791 ?auto_12799 ) ( CLEAR ?auto_12791 ) ( not ( = ?auto_12791 ?auto_12799 ) ) ( not ( = ?auto_12792 ?auto_12799 ) ) ( not ( = ?auto_12790 ?auto_12799 ) ) ( not ( = ?auto_12793 ?auto_12799 ) ) ( TRUCK-AT ?auto_12796 ?auto_12797 ) ( ON ?auto_12790 ?auto_12789 ) ( not ( = ?auto_12789 ?auto_12790 ) ) ( not ( = ?auto_12789 ?auto_12791 ) ) ( not ( = ?auto_12789 ?auto_12792 ) ) ( not ( = ?auto_12789 ?auto_12793 ) ) ( not ( = ?auto_12789 ?auto_12799 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12790 ?auto_12791 ?auto_12792 )
      ( MAKE-3CRATE-VERIFY ?auto_12789 ?auto_12790 ?auto_12791 ?auto_12792 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12802 - SURFACE
      ?auto_12803 - SURFACE
      ?auto_12804 - SURFACE
      ?auto_12805 - SURFACE
      ?auto_12806 - SURFACE
    )
    :vars
    (
      ?auto_12808 - HOIST
      ?auto_12811 - PLACE
      ?auto_12812 - PLACE
      ?auto_12809 - HOIST
      ?auto_12807 - SURFACE
      ?auto_12814 - PLACE
      ?auto_12815 - HOIST
      ?auto_12813 - SURFACE
      ?auto_12810 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12808 ?auto_12811 ) ( IS-CRATE ?auto_12806 ) ( not ( = ?auto_12805 ?auto_12806 ) ) ( not ( = ?auto_12804 ?auto_12805 ) ) ( not ( = ?auto_12804 ?auto_12806 ) ) ( not ( = ?auto_12812 ?auto_12811 ) ) ( HOIST-AT ?auto_12809 ?auto_12812 ) ( not ( = ?auto_12808 ?auto_12809 ) ) ( AVAILABLE ?auto_12809 ) ( SURFACE-AT ?auto_12806 ?auto_12812 ) ( ON ?auto_12806 ?auto_12807 ) ( CLEAR ?auto_12806 ) ( not ( = ?auto_12805 ?auto_12807 ) ) ( not ( = ?auto_12806 ?auto_12807 ) ) ( not ( = ?auto_12804 ?auto_12807 ) ) ( SURFACE-AT ?auto_12804 ?auto_12811 ) ( CLEAR ?auto_12804 ) ( IS-CRATE ?auto_12805 ) ( AVAILABLE ?auto_12808 ) ( not ( = ?auto_12814 ?auto_12811 ) ) ( not ( = ?auto_12812 ?auto_12814 ) ) ( HOIST-AT ?auto_12815 ?auto_12814 ) ( not ( = ?auto_12808 ?auto_12815 ) ) ( not ( = ?auto_12809 ?auto_12815 ) ) ( AVAILABLE ?auto_12815 ) ( SURFACE-AT ?auto_12805 ?auto_12814 ) ( ON ?auto_12805 ?auto_12813 ) ( CLEAR ?auto_12805 ) ( not ( = ?auto_12805 ?auto_12813 ) ) ( not ( = ?auto_12806 ?auto_12813 ) ) ( not ( = ?auto_12804 ?auto_12813 ) ) ( not ( = ?auto_12807 ?auto_12813 ) ) ( TRUCK-AT ?auto_12810 ?auto_12811 ) ( ON ?auto_12803 ?auto_12802 ) ( ON ?auto_12804 ?auto_12803 ) ( not ( = ?auto_12802 ?auto_12803 ) ) ( not ( = ?auto_12802 ?auto_12804 ) ) ( not ( = ?auto_12802 ?auto_12805 ) ) ( not ( = ?auto_12802 ?auto_12806 ) ) ( not ( = ?auto_12802 ?auto_12807 ) ) ( not ( = ?auto_12802 ?auto_12813 ) ) ( not ( = ?auto_12803 ?auto_12804 ) ) ( not ( = ?auto_12803 ?auto_12805 ) ) ( not ( = ?auto_12803 ?auto_12806 ) ) ( not ( = ?auto_12803 ?auto_12807 ) ) ( not ( = ?auto_12803 ?auto_12813 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12804 ?auto_12805 ?auto_12806 )
      ( MAKE-4CRATE-VERIFY ?auto_12802 ?auto_12803 ?auto_12804 ?auto_12805 ?auto_12806 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12816 - SURFACE
      ?auto_12817 - SURFACE
    )
    :vars
    (
      ?auto_12820 - HOIST
      ?auto_12823 - PLACE
      ?auto_12818 - SURFACE
      ?auto_12824 - PLACE
      ?auto_12821 - HOIST
      ?auto_12819 - SURFACE
      ?auto_12826 - PLACE
      ?auto_12827 - HOIST
      ?auto_12825 - SURFACE
      ?auto_12822 - TRUCK
      ?auto_12828 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12820 ?auto_12823 ) ( IS-CRATE ?auto_12817 ) ( not ( = ?auto_12816 ?auto_12817 ) ) ( not ( = ?auto_12818 ?auto_12816 ) ) ( not ( = ?auto_12818 ?auto_12817 ) ) ( not ( = ?auto_12824 ?auto_12823 ) ) ( HOIST-AT ?auto_12821 ?auto_12824 ) ( not ( = ?auto_12820 ?auto_12821 ) ) ( AVAILABLE ?auto_12821 ) ( SURFACE-AT ?auto_12817 ?auto_12824 ) ( ON ?auto_12817 ?auto_12819 ) ( CLEAR ?auto_12817 ) ( not ( = ?auto_12816 ?auto_12819 ) ) ( not ( = ?auto_12817 ?auto_12819 ) ) ( not ( = ?auto_12818 ?auto_12819 ) ) ( IS-CRATE ?auto_12816 ) ( not ( = ?auto_12826 ?auto_12823 ) ) ( not ( = ?auto_12824 ?auto_12826 ) ) ( HOIST-AT ?auto_12827 ?auto_12826 ) ( not ( = ?auto_12820 ?auto_12827 ) ) ( not ( = ?auto_12821 ?auto_12827 ) ) ( AVAILABLE ?auto_12827 ) ( SURFACE-AT ?auto_12816 ?auto_12826 ) ( ON ?auto_12816 ?auto_12825 ) ( CLEAR ?auto_12816 ) ( not ( = ?auto_12816 ?auto_12825 ) ) ( not ( = ?auto_12817 ?auto_12825 ) ) ( not ( = ?auto_12818 ?auto_12825 ) ) ( not ( = ?auto_12819 ?auto_12825 ) ) ( TRUCK-AT ?auto_12822 ?auto_12823 ) ( SURFACE-AT ?auto_12828 ?auto_12823 ) ( CLEAR ?auto_12828 ) ( LIFTING ?auto_12820 ?auto_12818 ) ( IS-CRATE ?auto_12818 ) ( not ( = ?auto_12828 ?auto_12818 ) ) ( not ( = ?auto_12816 ?auto_12828 ) ) ( not ( = ?auto_12817 ?auto_12828 ) ) ( not ( = ?auto_12819 ?auto_12828 ) ) ( not ( = ?auto_12825 ?auto_12828 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12828 ?auto_12818 )
      ( MAKE-2CRATE ?auto_12818 ?auto_12816 ?auto_12817 )
      ( MAKE-1CRATE-VERIFY ?auto_12816 ?auto_12817 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12829 - SURFACE
      ?auto_12830 - SURFACE
      ?auto_12831 - SURFACE
    )
    :vars
    (
      ?auto_12834 - HOIST
      ?auto_12836 - PLACE
      ?auto_12841 - PLACE
      ?auto_12833 - HOIST
      ?auto_12839 - SURFACE
      ?auto_12832 - PLACE
      ?auto_12838 - HOIST
      ?auto_12835 - SURFACE
      ?auto_12840 - TRUCK
      ?auto_12837 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12834 ?auto_12836 ) ( IS-CRATE ?auto_12831 ) ( not ( = ?auto_12830 ?auto_12831 ) ) ( not ( = ?auto_12829 ?auto_12830 ) ) ( not ( = ?auto_12829 ?auto_12831 ) ) ( not ( = ?auto_12841 ?auto_12836 ) ) ( HOIST-AT ?auto_12833 ?auto_12841 ) ( not ( = ?auto_12834 ?auto_12833 ) ) ( AVAILABLE ?auto_12833 ) ( SURFACE-AT ?auto_12831 ?auto_12841 ) ( ON ?auto_12831 ?auto_12839 ) ( CLEAR ?auto_12831 ) ( not ( = ?auto_12830 ?auto_12839 ) ) ( not ( = ?auto_12831 ?auto_12839 ) ) ( not ( = ?auto_12829 ?auto_12839 ) ) ( IS-CRATE ?auto_12830 ) ( not ( = ?auto_12832 ?auto_12836 ) ) ( not ( = ?auto_12841 ?auto_12832 ) ) ( HOIST-AT ?auto_12838 ?auto_12832 ) ( not ( = ?auto_12834 ?auto_12838 ) ) ( not ( = ?auto_12833 ?auto_12838 ) ) ( AVAILABLE ?auto_12838 ) ( SURFACE-AT ?auto_12830 ?auto_12832 ) ( ON ?auto_12830 ?auto_12835 ) ( CLEAR ?auto_12830 ) ( not ( = ?auto_12830 ?auto_12835 ) ) ( not ( = ?auto_12831 ?auto_12835 ) ) ( not ( = ?auto_12829 ?auto_12835 ) ) ( not ( = ?auto_12839 ?auto_12835 ) ) ( TRUCK-AT ?auto_12840 ?auto_12836 ) ( SURFACE-AT ?auto_12837 ?auto_12836 ) ( CLEAR ?auto_12837 ) ( LIFTING ?auto_12834 ?auto_12829 ) ( IS-CRATE ?auto_12829 ) ( not ( = ?auto_12837 ?auto_12829 ) ) ( not ( = ?auto_12830 ?auto_12837 ) ) ( not ( = ?auto_12831 ?auto_12837 ) ) ( not ( = ?auto_12839 ?auto_12837 ) ) ( not ( = ?auto_12835 ?auto_12837 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12830 ?auto_12831 )
      ( MAKE-2CRATE-VERIFY ?auto_12829 ?auto_12830 ?auto_12831 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12842 - SURFACE
      ?auto_12843 - SURFACE
      ?auto_12844 - SURFACE
      ?auto_12845 - SURFACE
    )
    :vars
    (
      ?auto_12847 - HOIST
      ?auto_12852 - PLACE
      ?auto_12848 - PLACE
      ?auto_12851 - HOIST
      ?auto_12854 - SURFACE
      ?auto_12850 - PLACE
      ?auto_12853 - HOIST
      ?auto_12846 - SURFACE
      ?auto_12849 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12847 ?auto_12852 ) ( IS-CRATE ?auto_12845 ) ( not ( = ?auto_12844 ?auto_12845 ) ) ( not ( = ?auto_12843 ?auto_12844 ) ) ( not ( = ?auto_12843 ?auto_12845 ) ) ( not ( = ?auto_12848 ?auto_12852 ) ) ( HOIST-AT ?auto_12851 ?auto_12848 ) ( not ( = ?auto_12847 ?auto_12851 ) ) ( AVAILABLE ?auto_12851 ) ( SURFACE-AT ?auto_12845 ?auto_12848 ) ( ON ?auto_12845 ?auto_12854 ) ( CLEAR ?auto_12845 ) ( not ( = ?auto_12844 ?auto_12854 ) ) ( not ( = ?auto_12845 ?auto_12854 ) ) ( not ( = ?auto_12843 ?auto_12854 ) ) ( IS-CRATE ?auto_12844 ) ( not ( = ?auto_12850 ?auto_12852 ) ) ( not ( = ?auto_12848 ?auto_12850 ) ) ( HOIST-AT ?auto_12853 ?auto_12850 ) ( not ( = ?auto_12847 ?auto_12853 ) ) ( not ( = ?auto_12851 ?auto_12853 ) ) ( AVAILABLE ?auto_12853 ) ( SURFACE-AT ?auto_12844 ?auto_12850 ) ( ON ?auto_12844 ?auto_12846 ) ( CLEAR ?auto_12844 ) ( not ( = ?auto_12844 ?auto_12846 ) ) ( not ( = ?auto_12845 ?auto_12846 ) ) ( not ( = ?auto_12843 ?auto_12846 ) ) ( not ( = ?auto_12854 ?auto_12846 ) ) ( TRUCK-AT ?auto_12849 ?auto_12852 ) ( SURFACE-AT ?auto_12842 ?auto_12852 ) ( CLEAR ?auto_12842 ) ( LIFTING ?auto_12847 ?auto_12843 ) ( IS-CRATE ?auto_12843 ) ( not ( = ?auto_12842 ?auto_12843 ) ) ( not ( = ?auto_12844 ?auto_12842 ) ) ( not ( = ?auto_12845 ?auto_12842 ) ) ( not ( = ?auto_12854 ?auto_12842 ) ) ( not ( = ?auto_12846 ?auto_12842 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12843 ?auto_12844 ?auto_12845 )
      ( MAKE-3CRATE-VERIFY ?auto_12842 ?auto_12843 ?auto_12844 ?auto_12845 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12855 - SURFACE
      ?auto_12856 - SURFACE
      ?auto_12857 - SURFACE
      ?auto_12858 - SURFACE
      ?auto_12859 - SURFACE
    )
    :vars
    (
      ?auto_12861 - HOIST
      ?auto_12866 - PLACE
      ?auto_12862 - PLACE
      ?auto_12865 - HOIST
      ?auto_12868 - SURFACE
      ?auto_12864 - PLACE
      ?auto_12867 - HOIST
      ?auto_12860 - SURFACE
      ?auto_12863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12861 ?auto_12866 ) ( IS-CRATE ?auto_12859 ) ( not ( = ?auto_12858 ?auto_12859 ) ) ( not ( = ?auto_12857 ?auto_12858 ) ) ( not ( = ?auto_12857 ?auto_12859 ) ) ( not ( = ?auto_12862 ?auto_12866 ) ) ( HOIST-AT ?auto_12865 ?auto_12862 ) ( not ( = ?auto_12861 ?auto_12865 ) ) ( AVAILABLE ?auto_12865 ) ( SURFACE-AT ?auto_12859 ?auto_12862 ) ( ON ?auto_12859 ?auto_12868 ) ( CLEAR ?auto_12859 ) ( not ( = ?auto_12858 ?auto_12868 ) ) ( not ( = ?auto_12859 ?auto_12868 ) ) ( not ( = ?auto_12857 ?auto_12868 ) ) ( IS-CRATE ?auto_12858 ) ( not ( = ?auto_12864 ?auto_12866 ) ) ( not ( = ?auto_12862 ?auto_12864 ) ) ( HOIST-AT ?auto_12867 ?auto_12864 ) ( not ( = ?auto_12861 ?auto_12867 ) ) ( not ( = ?auto_12865 ?auto_12867 ) ) ( AVAILABLE ?auto_12867 ) ( SURFACE-AT ?auto_12858 ?auto_12864 ) ( ON ?auto_12858 ?auto_12860 ) ( CLEAR ?auto_12858 ) ( not ( = ?auto_12858 ?auto_12860 ) ) ( not ( = ?auto_12859 ?auto_12860 ) ) ( not ( = ?auto_12857 ?auto_12860 ) ) ( not ( = ?auto_12868 ?auto_12860 ) ) ( TRUCK-AT ?auto_12863 ?auto_12866 ) ( SURFACE-AT ?auto_12856 ?auto_12866 ) ( CLEAR ?auto_12856 ) ( LIFTING ?auto_12861 ?auto_12857 ) ( IS-CRATE ?auto_12857 ) ( not ( = ?auto_12856 ?auto_12857 ) ) ( not ( = ?auto_12858 ?auto_12856 ) ) ( not ( = ?auto_12859 ?auto_12856 ) ) ( not ( = ?auto_12868 ?auto_12856 ) ) ( not ( = ?auto_12860 ?auto_12856 ) ) ( ON ?auto_12856 ?auto_12855 ) ( not ( = ?auto_12855 ?auto_12856 ) ) ( not ( = ?auto_12855 ?auto_12857 ) ) ( not ( = ?auto_12855 ?auto_12858 ) ) ( not ( = ?auto_12855 ?auto_12859 ) ) ( not ( = ?auto_12855 ?auto_12868 ) ) ( not ( = ?auto_12855 ?auto_12860 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12857 ?auto_12858 ?auto_12859 )
      ( MAKE-4CRATE-VERIFY ?auto_12855 ?auto_12856 ?auto_12857 ?auto_12858 ?auto_12859 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12869 - SURFACE
      ?auto_12870 - SURFACE
    )
    :vars
    (
      ?auto_12872 - HOIST
      ?auto_12877 - PLACE
      ?auto_12881 - SURFACE
      ?auto_12873 - PLACE
      ?auto_12876 - HOIST
      ?auto_12880 - SURFACE
      ?auto_12875 - PLACE
      ?auto_12878 - HOIST
      ?auto_12871 - SURFACE
      ?auto_12874 - TRUCK
      ?auto_12879 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12872 ?auto_12877 ) ( IS-CRATE ?auto_12870 ) ( not ( = ?auto_12869 ?auto_12870 ) ) ( not ( = ?auto_12881 ?auto_12869 ) ) ( not ( = ?auto_12881 ?auto_12870 ) ) ( not ( = ?auto_12873 ?auto_12877 ) ) ( HOIST-AT ?auto_12876 ?auto_12873 ) ( not ( = ?auto_12872 ?auto_12876 ) ) ( AVAILABLE ?auto_12876 ) ( SURFACE-AT ?auto_12870 ?auto_12873 ) ( ON ?auto_12870 ?auto_12880 ) ( CLEAR ?auto_12870 ) ( not ( = ?auto_12869 ?auto_12880 ) ) ( not ( = ?auto_12870 ?auto_12880 ) ) ( not ( = ?auto_12881 ?auto_12880 ) ) ( IS-CRATE ?auto_12869 ) ( not ( = ?auto_12875 ?auto_12877 ) ) ( not ( = ?auto_12873 ?auto_12875 ) ) ( HOIST-AT ?auto_12878 ?auto_12875 ) ( not ( = ?auto_12872 ?auto_12878 ) ) ( not ( = ?auto_12876 ?auto_12878 ) ) ( AVAILABLE ?auto_12878 ) ( SURFACE-AT ?auto_12869 ?auto_12875 ) ( ON ?auto_12869 ?auto_12871 ) ( CLEAR ?auto_12869 ) ( not ( = ?auto_12869 ?auto_12871 ) ) ( not ( = ?auto_12870 ?auto_12871 ) ) ( not ( = ?auto_12881 ?auto_12871 ) ) ( not ( = ?auto_12880 ?auto_12871 ) ) ( TRUCK-AT ?auto_12874 ?auto_12877 ) ( SURFACE-AT ?auto_12879 ?auto_12877 ) ( CLEAR ?auto_12879 ) ( IS-CRATE ?auto_12881 ) ( not ( = ?auto_12879 ?auto_12881 ) ) ( not ( = ?auto_12869 ?auto_12879 ) ) ( not ( = ?auto_12870 ?auto_12879 ) ) ( not ( = ?auto_12880 ?auto_12879 ) ) ( not ( = ?auto_12871 ?auto_12879 ) ) ( AVAILABLE ?auto_12872 ) ( IN ?auto_12881 ?auto_12874 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12872 ?auto_12881 ?auto_12874 ?auto_12877 )
      ( MAKE-2CRATE ?auto_12881 ?auto_12869 ?auto_12870 )
      ( MAKE-1CRATE-VERIFY ?auto_12869 ?auto_12870 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12882 - SURFACE
      ?auto_12883 - SURFACE
      ?auto_12884 - SURFACE
    )
    :vars
    (
      ?auto_12892 - HOIST
      ?auto_12888 - PLACE
      ?auto_12890 - PLACE
      ?auto_12889 - HOIST
      ?auto_12894 - SURFACE
      ?auto_12887 - PLACE
      ?auto_12893 - HOIST
      ?auto_12891 - SURFACE
      ?auto_12885 - TRUCK
      ?auto_12886 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12892 ?auto_12888 ) ( IS-CRATE ?auto_12884 ) ( not ( = ?auto_12883 ?auto_12884 ) ) ( not ( = ?auto_12882 ?auto_12883 ) ) ( not ( = ?auto_12882 ?auto_12884 ) ) ( not ( = ?auto_12890 ?auto_12888 ) ) ( HOIST-AT ?auto_12889 ?auto_12890 ) ( not ( = ?auto_12892 ?auto_12889 ) ) ( AVAILABLE ?auto_12889 ) ( SURFACE-AT ?auto_12884 ?auto_12890 ) ( ON ?auto_12884 ?auto_12894 ) ( CLEAR ?auto_12884 ) ( not ( = ?auto_12883 ?auto_12894 ) ) ( not ( = ?auto_12884 ?auto_12894 ) ) ( not ( = ?auto_12882 ?auto_12894 ) ) ( IS-CRATE ?auto_12883 ) ( not ( = ?auto_12887 ?auto_12888 ) ) ( not ( = ?auto_12890 ?auto_12887 ) ) ( HOIST-AT ?auto_12893 ?auto_12887 ) ( not ( = ?auto_12892 ?auto_12893 ) ) ( not ( = ?auto_12889 ?auto_12893 ) ) ( AVAILABLE ?auto_12893 ) ( SURFACE-AT ?auto_12883 ?auto_12887 ) ( ON ?auto_12883 ?auto_12891 ) ( CLEAR ?auto_12883 ) ( not ( = ?auto_12883 ?auto_12891 ) ) ( not ( = ?auto_12884 ?auto_12891 ) ) ( not ( = ?auto_12882 ?auto_12891 ) ) ( not ( = ?auto_12894 ?auto_12891 ) ) ( TRUCK-AT ?auto_12885 ?auto_12888 ) ( SURFACE-AT ?auto_12886 ?auto_12888 ) ( CLEAR ?auto_12886 ) ( IS-CRATE ?auto_12882 ) ( not ( = ?auto_12886 ?auto_12882 ) ) ( not ( = ?auto_12883 ?auto_12886 ) ) ( not ( = ?auto_12884 ?auto_12886 ) ) ( not ( = ?auto_12894 ?auto_12886 ) ) ( not ( = ?auto_12891 ?auto_12886 ) ) ( AVAILABLE ?auto_12892 ) ( IN ?auto_12882 ?auto_12885 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12883 ?auto_12884 )
      ( MAKE-2CRATE-VERIFY ?auto_12882 ?auto_12883 ?auto_12884 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12895 - SURFACE
      ?auto_12896 - SURFACE
      ?auto_12897 - SURFACE
      ?auto_12898 - SURFACE
    )
    :vars
    (
      ?auto_12899 - HOIST
      ?auto_12903 - PLACE
      ?auto_12902 - PLACE
      ?auto_12905 - HOIST
      ?auto_12901 - SURFACE
      ?auto_12906 - PLACE
      ?auto_12900 - HOIST
      ?auto_12904 - SURFACE
      ?auto_12907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12899 ?auto_12903 ) ( IS-CRATE ?auto_12898 ) ( not ( = ?auto_12897 ?auto_12898 ) ) ( not ( = ?auto_12896 ?auto_12897 ) ) ( not ( = ?auto_12896 ?auto_12898 ) ) ( not ( = ?auto_12902 ?auto_12903 ) ) ( HOIST-AT ?auto_12905 ?auto_12902 ) ( not ( = ?auto_12899 ?auto_12905 ) ) ( AVAILABLE ?auto_12905 ) ( SURFACE-AT ?auto_12898 ?auto_12902 ) ( ON ?auto_12898 ?auto_12901 ) ( CLEAR ?auto_12898 ) ( not ( = ?auto_12897 ?auto_12901 ) ) ( not ( = ?auto_12898 ?auto_12901 ) ) ( not ( = ?auto_12896 ?auto_12901 ) ) ( IS-CRATE ?auto_12897 ) ( not ( = ?auto_12906 ?auto_12903 ) ) ( not ( = ?auto_12902 ?auto_12906 ) ) ( HOIST-AT ?auto_12900 ?auto_12906 ) ( not ( = ?auto_12899 ?auto_12900 ) ) ( not ( = ?auto_12905 ?auto_12900 ) ) ( AVAILABLE ?auto_12900 ) ( SURFACE-AT ?auto_12897 ?auto_12906 ) ( ON ?auto_12897 ?auto_12904 ) ( CLEAR ?auto_12897 ) ( not ( = ?auto_12897 ?auto_12904 ) ) ( not ( = ?auto_12898 ?auto_12904 ) ) ( not ( = ?auto_12896 ?auto_12904 ) ) ( not ( = ?auto_12901 ?auto_12904 ) ) ( TRUCK-AT ?auto_12907 ?auto_12903 ) ( SURFACE-AT ?auto_12895 ?auto_12903 ) ( CLEAR ?auto_12895 ) ( IS-CRATE ?auto_12896 ) ( not ( = ?auto_12895 ?auto_12896 ) ) ( not ( = ?auto_12897 ?auto_12895 ) ) ( not ( = ?auto_12898 ?auto_12895 ) ) ( not ( = ?auto_12901 ?auto_12895 ) ) ( not ( = ?auto_12904 ?auto_12895 ) ) ( AVAILABLE ?auto_12899 ) ( IN ?auto_12896 ?auto_12907 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12896 ?auto_12897 ?auto_12898 )
      ( MAKE-3CRATE-VERIFY ?auto_12895 ?auto_12896 ?auto_12897 ?auto_12898 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12908 - SURFACE
      ?auto_12909 - SURFACE
      ?auto_12910 - SURFACE
      ?auto_12911 - SURFACE
      ?auto_12912 - SURFACE
    )
    :vars
    (
      ?auto_12913 - HOIST
      ?auto_12917 - PLACE
      ?auto_12916 - PLACE
      ?auto_12919 - HOIST
      ?auto_12915 - SURFACE
      ?auto_12920 - PLACE
      ?auto_12914 - HOIST
      ?auto_12918 - SURFACE
      ?auto_12921 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12913 ?auto_12917 ) ( IS-CRATE ?auto_12912 ) ( not ( = ?auto_12911 ?auto_12912 ) ) ( not ( = ?auto_12910 ?auto_12911 ) ) ( not ( = ?auto_12910 ?auto_12912 ) ) ( not ( = ?auto_12916 ?auto_12917 ) ) ( HOIST-AT ?auto_12919 ?auto_12916 ) ( not ( = ?auto_12913 ?auto_12919 ) ) ( AVAILABLE ?auto_12919 ) ( SURFACE-AT ?auto_12912 ?auto_12916 ) ( ON ?auto_12912 ?auto_12915 ) ( CLEAR ?auto_12912 ) ( not ( = ?auto_12911 ?auto_12915 ) ) ( not ( = ?auto_12912 ?auto_12915 ) ) ( not ( = ?auto_12910 ?auto_12915 ) ) ( IS-CRATE ?auto_12911 ) ( not ( = ?auto_12920 ?auto_12917 ) ) ( not ( = ?auto_12916 ?auto_12920 ) ) ( HOIST-AT ?auto_12914 ?auto_12920 ) ( not ( = ?auto_12913 ?auto_12914 ) ) ( not ( = ?auto_12919 ?auto_12914 ) ) ( AVAILABLE ?auto_12914 ) ( SURFACE-AT ?auto_12911 ?auto_12920 ) ( ON ?auto_12911 ?auto_12918 ) ( CLEAR ?auto_12911 ) ( not ( = ?auto_12911 ?auto_12918 ) ) ( not ( = ?auto_12912 ?auto_12918 ) ) ( not ( = ?auto_12910 ?auto_12918 ) ) ( not ( = ?auto_12915 ?auto_12918 ) ) ( TRUCK-AT ?auto_12921 ?auto_12917 ) ( SURFACE-AT ?auto_12909 ?auto_12917 ) ( CLEAR ?auto_12909 ) ( IS-CRATE ?auto_12910 ) ( not ( = ?auto_12909 ?auto_12910 ) ) ( not ( = ?auto_12911 ?auto_12909 ) ) ( not ( = ?auto_12912 ?auto_12909 ) ) ( not ( = ?auto_12915 ?auto_12909 ) ) ( not ( = ?auto_12918 ?auto_12909 ) ) ( AVAILABLE ?auto_12913 ) ( IN ?auto_12910 ?auto_12921 ) ( ON ?auto_12909 ?auto_12908 ) ( not ( = ?auto_12908 ?auto_12909 ) ) ( not ( = ?auto_12908 ?auto_12910 ) ) ( not ( = ?auto_12908 ?auto_12911 ) ) ( not ( = ?auto_12908 ?auto_12912 ) ) ( not ( = ?auto_12908 ?auto_12915 ) ) ( not ( = ?auto_12908 ?auto_12918 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12910 ?auto_12911 ?auto_12912 )
      ( MAKE-4CRATE-VERIFY ?auto_12908 ?auto_12909 ?auto_12910 ?auto_12911 ?auto_12912 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12922 - SURFACE
      ?auto_12923 - SURFACE
    )
    :vars
    (
      ?auto_12924 - HOIST
      ?auto_12930 - PLACE
      ?auto_12929 - SURFACE
      ?auto_12928 - PLACE
      ?auto_12932 - HOIST
      ?auto_12927 - SURFACE
      ?auto_12933 - PLACE
      ?auto_12925 - HOIST
      ?auto_12931 - SURFACE
      ?auto_12926 - SURFACE
      ?auto_12934 - TRUCK
      ?auto_12935 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12924 ?auto_12930 ) ( IS-CRATE ?auto_12923 ) ( not ( = ?auto_12922 ?auto_12923 ) ) ( not ( = ?auto_12929 ?auto_12922 ) ) ( not ( = ?auto_12929 ?auto_12923 ) ) ( not ( = ?auto_12928 ?auto_12930 ) ) ( HOIST-AT ?auto_12932 ?auto_12928 ) ( not ( = ?auto_12924 ?auto_12932 ) ) ( AVAILABLE ?auto_12932 ) ( SURFACE-AT ?auto_12923 ?auto_12928 ) ( ON ?auto_12923 ?auto_12927 ) ( CLEAR ?auto_12923 ) ( not ( = ?auto_12922 ?auto_12927 ) ) ( not ( = ?auto_12923 ?auto_12927 ) ) ( not ( = ?auto_12929 ?auto_12927 ) ) ( IS-CRATE ?auto_12922 ) ( not ( = ?auto_12933 ?auto_12930 ) ) ( not ( = ?auto_12928 ?auto_12933 ) ) ( HOIST-AT ?auto_12925 ?auto_12933 ) ( not ( = ?auto_12924 ?auto_12925 ) ) ( not ( = ?auto_12932 ?auto_12925 ) ) ( AVAILABLE ?auto_12925 ) ( SURFACE-AT ?auto_12922 ?auto_12933 ) ( ON ?auto_12922 ?auto_12931 ) ( CLEAR ?auto_12922 ) ( not ( = ?auto_12922 ?auto_12931 ) ) ( not ( = ?auto_12923 ?auto_12931 ) ) ( not ( = ?auto_12929 ?auto_12931 ) ) ( not ( = ?auto_12927 ?auto_12931 ) ) ( SURFACE-AT ?auto_12926 ?auto_12930 ) ( CLEAR ?auto_12926 ) ( IS-CRATE ?auto_12929 ) ( not ( = ?auto_12926 ?auto_12929 ) ) ( not ( = ?auto_12922 ?auto_12926 ) ) ( not ( = ?auto_12923 ?auto_12926 ) ) ( not ( = ?auto_12927 ?auto_12926 ) ) ( not ( = ?auto_12931 ?auto_12926 ) ) ( AVAILABLE ?auto_12924 ) ( IN ?auto_12929 ?auto_12934 ) ( TRUCK-AT ?auto_12934 ?auto_12935 ) ( not ( = ?auto_12935 ?auto_12930 ) ) ( not ( = ?auto_12928 ?auto_12935 ) ) ( not ( = ?auto_12933 ?auto_12935 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12934 ?auto_12935 ?auto_12930 )
      ( MAKE-2CRATE ?auto_12929 ?auto_12922 ?auto_12923 )
      ( MAKE-1CRATE-VERIFY ?auto_12922 ?auto_12923 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12936 - SURFACE
      ?auto_12937 - SURFACE
      ?auto_12938 - SURFACE
    )
    :vars
    (
      ?auto_12942 - HOIST
      ?auto_12949 - PLACE
      ?auto_12944 - PLACE
      ?auto_12946 - HOIST
      ?auto_12947 - SURFACE
      ?auto_12941 - PLACE
      ?auto_12943 - HOIST
      ?auto_12948 - SURFACE
      ?auto_12945 - SURFACE
      ?auto_12939 - TRUCK
      ?auto_12940 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12942 ?auto_12949 ) ( IS-CRATE ?auto_12938 ) ( not ( = ?auto_12937 ?auto_12938 ) ) ( not ( = ?auto_12936 ?auto_12937 ) ) ( not ( = ?auto_12936 ?auto_12938 ) ) ( not ( = ?auto_12944 ?auto_12949 ) ) ( HOIST-AT ?auto_12946 ?auto_12944 ) ( not ( = ?auto_12942 ?auto_12946 ) ) ( AVAILABLE ?auto_12946 ) ( SURFACE-AT ?auto_12938 ?auto_12944 ) ( ON ?auto_12938 ?auto_12947 ) ( CLEAR ?auto_12938 ) ( not ( = ?auto_12937 ?auto_12947 ) ) ( not ( = ?auto_12938 ?auto_12947 ) ) ( not ( = ?auto_12936 ?auto_12947 ) ) ( IS-CRATE ?auto_12937 ) ( not ( = ?auto_12941 ?auto_12949 ) ) ( not ( = ?auto_12944 ?auto_12941 ) ) ( HOIST-AT ?auto_12943 ?auto_12941 ) ( not ( = ?auto_12942 ?auto_12943 ) ) ( not ( = ?auto_12946 ?auto_12943 ) ) ( AVAILABLE ?auto_12943 ) ( SURFACE-AT ?auto_12937 ?auto_12941 ) ( ON ?auto_12937 ?auto_12948 ) ( CLEAR ?auto_12937 ) ( not ( = ?auto_12937 ?auto_12948 ) ) ( not ( = ?auto_12938 ?auto_12948 ) ) ( not ( = ?auto_12936 ?auto_12948 ) ) ( not ( = ?auto_12947 ?auto_12948 ) ) ( SURFACE-AT ?auto_12945 ?auto_12949 ) ( CLEAR ?auto_12945 ) ( IS-CRATE ?auto_12936 ) ( not ( = ?auto_12945 ?auto_12936 ) ) ( not ( = ?auto_12937 ?auto_12945 ) ) ( not ( = ?auto_12938 ?auto_12945 ) ) ( not ( = ?auto_12947 ?auto_12945 ) ) ( not ( = ?auto_12948 ?auto_12945 ) ) ( AVAILABLE ?auto_12942 ) ( IN ?auto_12936 ?auto_12939 ) ( TRUCK-AT ?auto_12939 ?auto_12940 ) ( not ( = ?auto_12940 ?auto_12949 ) ) ( not ( = ?auto_12944 ?auto_12940 ) ) ( not ( = ?auto_12941 ?auto_12940 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12937 ?auto_12938 )
      ( MAKE-2CRATE-VERIFY ?auto_12936 ?auto_12937 ?auto_12938 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12950 - SURFACE
      ?auto_12951 - SURFACE
      ?auto_12952 - SURFACE
      ?auto_12953 - SURFACE
    )
    :vars
    (
      ?auto_12963 - HOIST
      ?auto_12962 - PLACE
      ?auto_12956 - PLACE
      ?auto_12960 - HOIST
      ?auto_12961 - SURFACE
      ?auto_12957 - PLACE
      ?auto_12955 - HOIST
      ?auto_12959 - SURFACE
      ?auto_12958 - TRUCK
      ?auto_12954 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12963 ?auto_12962 ) ( IS-CRATE ?auto_12953 ) ( not ( = ?auto_12952 ?auto_12953 ) ) ( not ( = ?auto_12951 ?auto_12952 ) ) ( not ( = ?auto_12951 ?auto_12953 ) ) ( not ( = ?auto_12956 ?auto_12962 ) ) ( HOIST-AT ?auto_12960 ?auto_12956 ) ( not ( = ?auto_12963 ?auto_12960 ) ) ( AVAILABLE ?auto_12960 ) ( SURFACE-AT ?auto_12953 ?auto_12956 ) ( ON ?auto_12953 ?auto_12961 ) ( CLEAR ?auto_12953 ) ( not ( = ?auto_12952 ?auto_12961 ) ) ( not ( = ?auto_12953 ?auto_12961 ) ) ( not ( = ?auto_12951 ?auto_12961 ) ) ( IS-CRATE ?auto_12952 ) ( not ( = ?auto_12957 ?auto_12962 ) ) ( not ( = ?auto_12956 ?auto_12957 ) ) ( HOIST-AT ?auto_12955 ?auto_12957 ) ( not ( = ?auto_12963 ?auto_12955 ) ) ( not ( = ?auto_12960 ?auto_12955 ) ) ( AVAILABLE ?auto_12955 ) ( SURFACE-AT ?auto_12952 ?auto_12957 ) ( ON ?auto_12952 ?auto_12959 ) ( CLEAR ?auto_12952 ) ( not ( = ?auto_12952 ?auto_12959 ) ) ( not ( = ?auto_12953 ?auto_12959 ) ) ( not ( = ?auto_12951 ?auto_12959 ) ) ( not ( = ?auto_12961 ?auto_12959 ) ) ( SURFACE-AT ?auto_12950 ?auto_12962 ) ( CLEAR ?auto_12950 ) ( IS-CRATE ?auto_12951 ) ( not ( = ?auto_12950 ?auto_12951 ) ) ( not ( = ?auto_12952 ?auto_12950 ) ) ( not ( = ?auto_12953 ?auto_12950 ) ) ( not ( = ?auto_12961 ?auto_12950 ) ) ( not ( = ?auto_12959 ?auto_12950 ) ) ( AVAILABLE ?auto_12963 ) ( IN ?auto_12951 ?auto_12958 ) ( TRUCK-AT ?auto_12958 ?auto_12954 ) ( not ( = ?auto_12954 ?auto_12962 ) ) ( not ( = ?auto_12956 ?auto_12954 ) ) ( not ( = ?auto_12957 ?auto_12954 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12951 ?auto_12952 ?auto_12953 )
      ( MAKE-3CRATE-VERIFY ?auto_12950 ?auto_12951 ?auto_12952 ?auto_12953 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12964 - SURFACE
      ?auto_12965 - SURFACE
      ?auto_12966 - SURFACE
      ?auto_12967 - SURFACE
      ?auto_12968 - SURFACE
    )
    :vars
    (
      ?auto_12978 - HOIST
      ?auto_12977 - PLACE
      ?auto_12971 - PLACE
      ?auto_12975 - HOIST
      ?auto_12976 - SURFACE
      ?auto_12972 - PLACE
      ?auto_12970 - HOIST
      ?auto_12974 - SURFACE
      ?auto_12973 - TRUCK
      ?auto_12969 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12978 ?auto_12977 ) ( IS-CRATE ?auto_12968 ) ( not ( = ?auto_12967 ?auto_12968 ) ) ( not ( = ?auto_12966 ?auto_12967 ) ) ( not ( = ?auto_12966 ?auto_12968 ) ) ( not ( = ?auto_12971 ?auto_12977 ) ) ( HOIST-AT ?auto_12975 ?auto_12971 ) ( not ( = ?auto_12978 ?auto_12975 ) ) ( AVAILABLE ?auto_12975 ) ( SURFACE-AT ?auto_12968 ?auto_12971 ) ( ON ?auto_12968 ?auto_12976 ) ( CLEAR ?auto_12968 ) ( not ( = ?auto_12967 ?auto_12976 ) ) ( not ( = ?auto_12968 ?auto_12976 ) ) ( not ( = ?auto_12966 ?auto_12976 ) ) ( IS-CRATE ?auto_12967 ) ( not ( = ?auto_12972 ?auto_12977 ) ) ( not ( = ?auto_12971 ?auto_12972 ) ) ( HOIST-AT ?auto_12970 ?auto_12972 ) ( not ( = ?auto_12978 ?auto_12970 ) ) ( not ( = ?auto_12975 ?auto_12970 ) ) ( AVAILABLE ?auto_12970 ) ( SURFACE-AT ?auto_12967 ?auto_12972 ) ( ON ?auto_12967 ?auto_12974 ) ( CLEAR ?auto_12967 ) ( not ( = ?auto_12967 ?auto_12974 ) ) ( not ( = ?auto_12968 ?auto_12974 ) ) ( not ( = ?auto_12966 ?auto_12974 ) ) ( not ( = ?auto_12976 ?auto_12974 ) ) ( SURFACE-AT ?auto_12965 ?auto_12977 ) ( CLEAR ?auto_12965 ) ( IS-CRATE ?auto_12966 ) ( not ( = ?auto_12965 ?auto_12966 ) ) ( not ( = ?auto_12967 ?auto_12965 ) ) ( not ( = ?auto_12968 ?auto_12965 ) ) ( not ( = ?auto_12976 ?auto_12965 ) ) ( not ( = ?auto_12974 ?auto_12965 ) ) ( AVAILABLE ?auto_12978 ) ( IN ?auto_12966 ?auto_12973 ) ( TRUCK-AT ?auto_12973 ?auto_12969 ) ( not ( = ?auto_12969 ?auto_12977 ) ) ( not ( = ?auto_12971 ?auto_12969 ) ) ( not ( = ?auto_12972 ?auto_12969 ) ) ( ON ?auto_12965 ?auto_12964 ) ( not ( = ?auto_12964 ?auto_12965 ) ) ( not ( = ?auto_12964 ?auto_12966 ) ) ( not ( = ?auto_12964 ?auto_12967 ) ) ( not ( = ?auto_12964 ?auto_12968 ) ) ( not ( = ?auto_12964 ?auto_12976 ) ) ( not ( = ?auto_12964 ?auto_12974 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12966 ?auto_12967 ?auto_12968 )
      ( MAKE-4CRATE-VERIFY ?auto_12964 ?auto_12965 ?auto_12966 ?auto_12967 ?auto_12968 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12979 - SURFACE
      ?auto_12980 - SURFACE
    )
    :vars
    (
      ?auto_12992 - HOIST
      ?auto_12991 - PLACE
      ?auto_12986 - SURFACE
      ?auto_12984 - PLACE
      ?auto_12989 - HOIST
      ?auto_12990 - SURFACE
      ?auto_12985 - PLACE
      ?auto_12982 - HOIST
      ?auto_12988 - SURFACE
      ?auto_12983 - SURFACE
      ?auto_12987 - TRUCK
      ?auto_12981 - PLACE
      ?auto_12993 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12992 ?auto_12991 ) ( IS-CRATE ?auto_12980 ) ( not ( = ?auto_12979 ?auto_12980 ) ) ( not ( = ?auto_12986 ?auto_12979 ) ) ( not ( = ?auto_12986 ?auto_12980 ) ) ( not ( = ?auto_12984 ?auto_12991 ) ) ( HOIST-AT ?auto_12989 ?auto_12984 ) ( not ( = ?auto_12992 ?auto_12989 ) ) ( AVAILABLE ?auto_12989 ) ( SURFACE-AT ?auto_12980 ?auto_12984 ) ( ON ?auto_12980 ?auto_12990 ) ( CLEAR ?auto_12980 ) ( not ( = ?auto_12979 ?auto_12990 ) ) ( not ( = ?auto_12980 ?auto_12990 ) ) ( not ( = ?auto_12986 ?auto_12990 ) ) ( IS-CRATE ?auto_12979 ) ( not ( = ?auto_12985 ?auto_12991 ) ) ( not ( = ?auto_12984 ?auto_12985 ) ) ( HOIST-AT ?auto_12982 ?auto_12985 ) ( not ( = ?auto_12992 ?auto_12982 ) ) ( not ( = ?auto_12989 ?auto_12982 ) ) ( AVAILABLE ?auto_12982 ) ( SURFACE-AT ?auto_12979 ?auto_12985 ) ( ON ?auto_12979 ?auto_12988 ) ( CLEAR ?auto_12979 ) ( not ( = ?auto_12979 ?auto_12988 ) ) ( not ( = ?auto_12980 ?auto_12988 ) ) ( not ( = ?auto_12986 ?auto_12988 ) ) ( not ( = ?auto_12990 ?auto_12988 ) ) ( SURFACE-AT ?auto_12983 ?auto_12991 ) ( CLEAR ?auto_12983 ) ( IS-CRATE ?auto_12986 ) ( not ( = ?auto_12983 ?auto_12986 ) ) ( not ( = ?auto_12979 ?auto_12983 ) ) ( not ( = ?auto_12980 ?auto_12983 ) ) ( not ( = ?auto_12990 ?auto_12983 ) ) ( not ( = ?auto_12988 ?auto_12983 ) ) ( AVAILABLE ?auto_12992 ) ( TRUCK-AT ?auto_12987 ?auto_12981 ) ( not ( = ?auto_12981 ?auto_12991 ) ) ( not ( = ?auto_12984 ?auto_12981 ) ) ( not ( = ?auto_12985 ?auto_12981 ) ) ( HOIST-AT ?auto_12993 ?auto_12981 ) ( LIFTING ?auto_12993 ?auto_12986 ) ( not ( = ?auto_12992 ?auto_12993 ) ) ( not ( = ?auto_12989 ?auto_12993 ) ) ( not ( = ?auto_12982 ?auto_12993 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12993 ?auto_12986 ?auto_12987 ?auto_12981 )
      ( MAKE-2CRATE ?auto_12986 ?auto_12979 ?auto_12980 )
      ( MAKE-1CRATE-VERIFY ?auto_12979 ?auto_12980 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12994 - SURFACE
      ?auto_12995 - SURFACE
      ?auto_12996 - SURFACE
    )
    :vars
    (
      ?auto_12999 - HOIST
      ?auto_12998 - PLACE
      ?auto_13002 - PLACE
      ?auto_13001 - HOIST
      ?auto_13000 - SURFACE
      ?auto_12997 - PLACE
      ?auto_13005 - HOIST
      ?auto_13008 - SURFACE
      ?auto_13006 - SURFACE
      ?auto_13003 - TRUCK
      ?auto_13007 - PLACE
      ?auto_13004 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12999 ?auto_12998 ) ( IS-CRATE ?auto_12996 ) ( not ( = ?auto_12995 ?auto_12996 ) ) ( not ( = ?auto_12994 ?auto_12995 ) ) ( not ( = ?auto_12994 ?auto_12996 ) ) ( not ( = ?auto_13002 ?auto_12998 ) ) ( HOIST-AT ?auto_13001 ?auto_13002 ) ( not ( = ?auto_12999 ?auto_13001 ) ) ( AVAILABLE ?auto_13001 ) ( SURFACE-AT ?auto_12996 ?auto_13002 ) ( ON ?auto_12996 ?auto_13000 ) ( CLEAR ?auto_12996 ) ( not ( = ?auto_12995 ?auto_13000 ) ) ( not ( = ?auto_12996 ?auto_13000 ) ) ( not ( = ?auto_12994 ?auto_13000 ) ) ( IS-CRATE ?auto_12995 ) ( not ( = ?auto_12997 ?auto_12998 ) ) ( not ( = ?auto_13002 ?auto_12997 ) ) ( HOIST-AT ?auto_13005 ?auto_12997 ) ( not ( = ?auto_12999 ?auto_13005 ) ) ( not ( = ?auto_13001 ?auto_13005 ) ) ( AVAILABLE ?auto_13005 ) ( SURFACE-AT ?auto_12995 ?auto_12997 ) ( ON ?auto_12995 ?auto_13008 ) ( CLEAR ?auto_12995 ) ( not ( = ?auto_12995 ?auto_13008 ) ) ( not ( = ?auto_12996 ?auto_13008 ) ) ( not ( = ?auto_12994 ?auto_13008 ) ) ( not ( = ?auto_13000 ?auto_13008 ) ) ( SURFACE-AT ?auto_13006 ?auto_12998 ) ( CLEAR ?auto_13006 ) ( IS-CRATE ?auto_12994 ) ( not ( = ?auto_13006 ?auto_12994 ) ) ( not ( = ?auto_12995 ?auto_13006 ) ) ( not ( = ?auto_12996 ?auto_13006 ) ) ( not ( = ?auto_13000 ?auto_13006 ) ) ( not ( = ?auto_13008 ?auto_13006 ) ) ( AVAILABLE ?auto_12999 ) ( TRUCK-AT ?auto_13003 ?auto_13007 ) ( not ( = ?auto_13007 ?auto_12998 ) ) ( not ( = ?auto_13002 ?auto_13007 ) ) ( not ( = ?auto_12997 ?auto_13007 ) ) ( HOIST-AT ?auto_13004 ?auto_13007 ) ( LIFTING ?auto_13004 ?auto_12994 ) ( not ( = ?auto_12999 ?auto_13004 ) ) ( not ( = ?auto_13001 ?auto_13004 ) ) ( not ( = ?auto_13005 ?auto_13004 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12995 ?auto_12996 )
      ( MAKE-2CRATE-VERIFY ?auto_12994 ?auto_12995 ?auto_12996 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13009 - SURFACE
      ?auto_13010 - SURFACE
      ?auto_13011 - SURFACE
      ?auto_13012 - SURFACE
    )
    :vars
    (
      ?auto_13017 - HOIST
      ?auto_13022 - PLACE
      ?auto_13023 - PLACE
      ?auto_13014 - HOIST
      ?auto_13021 - SURFACE
      ?auto_13013 - PLACE
      ?auto_13016 - HOIST
      ?auto_13020 - SURFACE
      ?auto_13018 - TRUCK
      ?auto_13015 - PLACE
      ?auto_13019 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13017 ?auto_13022 ) ( IS-CRATE ?auto_13012 ) ( not ( = ?auto_13011 ?auto_13012 ) ) ( not ( = ?auto_13010 ?auto_13011 ) ) ( not ( = ?auto_13010 ?auto_13012 ) ) ( not ( = ?auto_13023 ?auto_13022 ) ) ( HOIST-AT ?auto_13014 ?auto_13023 ) ( not ( = ?auto_13017 ?auto_13014 ) ) ( AVAILABLE ?auto_13014 ) ( SURFACE-AT ?auto_13012 ?auto_13023 ) ( ON ?auto_13012 ?auto_13021 ) ( CLEAR ?auto_13012 ) ( not ( = ?auto_13011 ?auto_13021 ) ) ( not ( = ?auto_13012 ?auto_13021 ) ) ( not ( = ?auto_13010 ?auto_13021 ) ) ( IS-CRATE ?auto_13011 ) ( not ( = ?auto_13013 ?auto_13022 ) ) ( not ( = ?auto_13023 ?auto_13013 ) ) ( HOIST-AT ?auto_13016 ?auto_13013 ) ( not ( = ?auto_13017 ?auto_13016 ) ) ( not ( = ?auto_13014 ?auto_13016 ) ) ( AVAILABLE ?auto_13016 ) ( SURFACE-AT ?auto_13011 ?auto_13013 ) ( ON ?auto_13011 ?auto_13020 ) ( CLEAR ?auto_13011 ) ( not ( = ?auto_13011 ?auto_13020 ) ) ( not ( = ?auto_13012 ?auto_13020 ) ) ( not ( = ?auto_13010 ?auto_13020 ) ) ( not ( = ?auto_13021 ?auto_13020 ) ) ( SURFACE-AT ?auto_13009 ?auto_13022 ) ( CLEAR ?auto_13009 ) ( IS-CRATE ?auto_13010 ) ( not ( = ?auto_13009 ?auto_13010 ) ) ( not ( = ?auto_13011 ?auto_13009 ) ) ( not ( = ?auto_13012 ?auto_13009 ) ) ( not ( = ?auto_13021 ?auto_13009 ) ) ( not ( = ?auto_13020 ?auto_13009 ) ) ( AVAILABLE ?auto_13017 ) ( TRUCK-AT ?auto_13018 ?auto_13015 ) ( not ( = ?auto_13015 ?auto_13022 ) ) ( not ( = ?auto_13023 ?auto_13015 ) ) ( not ( = ?auto_13013 ?auto_13015 ) ) ( HOIST-AT ?auto_13019 ?auto_13015 ) ( LIFTING ?auto_13019 ?auto_13010 ) ( not ( = ?auto_13017 ?auto_13019 ) ) ( not ( = ?auto_13014 ?auto_13019 ) ) ( not ( = ?auto_13016 ?auto_13019 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13010 ?auto_13011 ?auto_13012 )
      ( MAKE-3CRATE-VERIFY ?auto_13009 ?auto_13010 ?auto_13011 ?auto_13012 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13024 - SURFACE
      ?auto_13025 - SURFACE
      ?auto_13026 - SURFACE
      ?auto_13027 - SURFACE
      ?auto_13028 - SURFACE
    )
    :vars
    (
      ?auto_13033 - HOIST
      ?auto_13038 - PLACE
      ?auto_13039 - PLACE
      ?auto_13030 - HOIST
      ?auto_13037 - SURFACE
      ?auto_13029 - PLACE
      ?auto_13032 - HOIST
      ?auto_13036 - SURFACE
      ?auto_13034 - TRUCK
      ?auto_13031 - PLACE
      ?auto_13035 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13033 ?auto_13038 ) ( IS-CRATE ?auto_13028 ) ( not ( = ?auto_13027 ?auto_13028 ) ) ( not ( = ?auto_13026 ?auto_13027 ) ) ( not ( = ?auto_13026 ?auto_13028 ) ) ( not ( = ?auto_13039 ?auto_13038 ) ) ( HOIST-AT ?auto_13030 ?auto_13039 ) ( not ( = ?auto_13033 ?auto_13030 ) ) ( AVAILABLE ?auto_13030 ) ( SURFACE-AT ?auto_13028 ?auto_13039 ) ( ON ?auto_13028 ?auto_13037 ) ( CLEAR ?auto_13028 ) ( not ( = ?auto_13027 ?auto_13037 ) ) ( not ( = ?auto_13028 ?auto_13037 ) ) ( not ( = ?auto_13026 ?auto_13037 ) ) ( IS-CRATE ?auto_13027 ) ( not ( = ?auto_13029 ?auto_13038 ) ) ( not ( = ?auto_13039 ?auto_13029 ) ) ( HOIST-AT ?auto_13032 ?auto_13029 ) ( not ( = ?auto_13033 ?auto_13032 ) ) ( not ( = ?auto_13030 ?auto_13032 ) ) ( AVAILABLE ?auto_13032 ) ( SURFACE-AT ?auto_13027 ?auto_13029 ) ( ON ?auto_13027 ?auto_13036 ) ( CLEAR ?auto_13027 ) ( not ( = ?auto_13027 ?auto_13036 ) ) ( not ( = ?auto_13028 ?auto_13036 ) ) ( not ( = ?auto_13026 ?auto_13036 ) ) ( not ( = ?auto_13037 ?auto_13036 ) ) ( SURFACE-AT ?auto_13025 ?auto_13038 ) ( CLEAR ?auto_13025 ) ( IS-CRATE ?auto_13026 ) ( not ( = ?auto_13025 ?auto_13026 ) ) ( not ( = ?auto_13027 ?auto_13025 ) ) ( not ( = ?auto_13028 ?auto_13025 ) ) ( not ( = ?auto_13037 ?auto_13025 ) ) ( not ( = ?auto_13036 ?auto_13025 ) ) ( AVAILABLE ?auto_13033 ) ( TRUCK-AT ?auto_13034 ?auto_13031 ) ( not ( = ?auto_13031 ?auto_13038 ) ) ( not ( = ?auto_13039 ?auto_13031 ) ) ( not ( = ?auto_13029 ?auto_13031 ) ) ( HOIST-AT ?auto_13035 ?auto_13031 ) ( LIFTING ?auto_13035 ?auto_13026 ) ( not ( = ?auto_13033 ?auto_13035 ) ) ( not ( = ?auto_13030 ?auto_13035 ) ) ( not ( = ?auto_13032 ?auto_13035 ) ) ( ON ?auto_13025 ?auto_13024 ) ( not ( = ?auto_13024 ?auto_13025 ) ) ( not ( = ?auto_13024 ?auto_13026 ) ) ( not ( = ?auto_13024 ?auto_13027 ) ) ( not ( = ?auto_13024 ?auto_13028 ) ) ( not ( = ?auto_13024 ?auto_13037 ) ) ( not ( = ?auto_13024 ?auto_13036 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13026 ?auto_13027 ?auto_13028 )
      ( MAKE-4CRATE-VERIFY ?auto_13024 ?auto_13025 ?auto_13026 ?auto_13027 ?auto_13028 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13040 - SURFACE
      ?auto_13041 - SURFACE
    )
    :vars
    (
      ?auto_13047 - HOIST
      ?auto_13052 - PLACE
      ?auto_13053 - SURFACE
      ?auto_13054 - PLACE
      ?auto_13044 - HOIST
      ?auto_13051 - SURFACE
      ?auto_13043 - PLACE
      ?auto_13046 - HOIST
      ?auto_13050 - SURFACE
      ?auto_13042 - SURFACE
      ?auto_13048 - TRUCK
      ?auto_13045 - PLACE
      ?auto_13049 - HOIST
      ?auto_13055 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13047 ?auto_13052 ) ( IS-CRATE ?auto_13041 ) ( not ( = ?auto_13040 ?auto_13041 ) ) ( not ( = ?auto_13053 ?auto_13040 ) ) ( not ( = ?auto_13053 ?auto_13041 ) ) ( not ( = ?auto_13054 ?auto_13052 ) ) ( HOIST-AT ?auto_13044 ?auto_13054 ) ( not ( = ?auto_13047 ?auto_13044 ) ) ( AVAILABLE ?auto_13044 ) ( SURFACE-AT ?auto_13041 ?auto_13054 ) ( ON ?auto_13041 ?auto_13051 ) ( CLEAR ?auto_13041 ) ( not ( = ?auto_13040 ?auto_13051 ) ) ( not ( = ?auto_13041 ?auto_13051 ) ) ( not ( = ?auto_13053 ?auto_13051 ) ) ( IS-CRATE ?auto_13040 ) ( not ( = ?auto_13043 ?auto_13052 ) ) ( not ( = ?auto_13054 ?auto_13043 ) ) ( HOIST-AT ?auto_13046 ?auto_13043 ) ( not ( = ?auto_13047 ?auto_13046 ) ) ( not ( = ?auto_13044 ?auto_13046 ) ) ( AVAILABLE ?auto_13046 ) ( SURFACE-AT ?auto_13040 ?auto_13043 ) ( ON ?auto_13040 ?auto_13050 ) ( CLEAR ?auto_13040 ) ( not ( = ?auto_13040 ?auto_13050 ) ) ( not ( = ?auto_13041 ?auto_13050 ) ) ( not ( = ?auto_13053 ?auto_13050 ) ) ( not ( = ?auto_13051 ?auto_13050 ) ) ( SURFACE-AT ?auto_13042 ?auto_13052 ) ( CLEAR ?auto_13042 ) ( IS-CRATE ?auto_13053 ) ( not ( = ?auto_13042 ?auto_13053 ) ) ( not ( = ?auto_13040 ?auto_13042 ) ) ( not ( = ?auto_13041 ?auto_13042 ) ) ( not ( = ?auto_13051 ?auto_13042 ) ) ( not ( = ?auto_13050 ?auto_13042 ) ) ( AVAILABLE ?auto_13047 ) ( TRUCK-AT ?auto_13048 ?auto_13045 ) ( not ( = ?auto_13045 ?auto_13052 ) ) ( not ( = ?auto_13054 ?auto_13045 ) ) ( not ( = ?auto_13043 ?auto_13045 ) ) ( HOIST-AT ?auto_13049 ?auto_13045 ) ( not ( = ?auto_13047 ?auto_13049 ) ) ( not ( = ?auto_13044 ?auto_13049 ) ) ( not ( = ?auto_13046 ?auto_13049 ) ) ( AVAILABLE ?auto_13049 ) ( SURFACE-AT ?auto_13053 ?auto_13045 ) ( ON ?auto_13053 ?auto_13055 ) ( CLEAR ?auto_13053 ) ( not ( = ?auto_13040 ?auto_13055 ) ) ( not ( = ?auto_13041 ?auto_13055 ) ) ( not ( = ?auto_13053 ?auto_13055 ) ) ( not ( = ?auto_13051 ?auto_13055 ) ) ( not ( = ?auto_13050 ?auto_13055 ) ) ( not ( = ?auto_13042 ?auto_13055 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13049 ?auto_13053 ?auto_13055 ?auto_13045 )
      ( MAKE-2CRATE ?auto_13053 ?auto_13040 ?auto_13041 )
      ( MAKE-1CRATE-VERIFY ?auto_13040 ?auto_13041 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13056 - SURFACE
      ?auto_13057 - SURFACE
      ?auto_13058 - SURFACE
    )
    :vars
    (
      ?auto_13066 - HOIST
      ?auto_13068 - PLACE
      ?auto_13060 - PLACE
      ?auto_13070 - HOIST
      ?auto_13061 - SURFACE
      ?auto_13064 - PLACE
      ?auto_13059 - HOIST
      ?auto_13062 - SURFACE
      ?auto_13069 - SURFACE
      ?auto_13067 - TRUCK
      ?auto_13063 - PLACE
      ?auto_13065 - HOIST
      ?auto_13071 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13066 ?auto_13068 ) ( IS-CRATE ?auto_13058 ) ( not ( = ?auto_13057 ?auto_13058 ) ) ( not ( = ?auto_13056 ?auto_13057 ) ) ( not ( = ?auto_13056 ?auto_13058 ) ) ( not ( = ?auto_13060 ?auto_13068 ) ) ( HOIST-AT ?auto_13070 ?auto_13060 ) ( not ( = ?auto_13066 ?auto_13070 ) ) ( AVAILABLE ?auto_13070 ) ( SURFACE-AT ?auto_13058 ?auto_13060 ) ( ON ?auto_13058 ?auto_13061 ) ( CLEAR ?auto_13058 ) ( not ( = ?auto_13057 ?auto_13061 ) ) ( not ( = ?auto_13058 ?auto_13061 ) ) ( not ( = ?auto_13056 ?auto_13061 ) ) ( IS-CRATE ?auto_13057 ) ( not ( = ?auto_13064 ?auto_13068 ) ) ( not ( = ?auto_13060 ?auto_13064 ) ) ( HOIST-AT ?auto_13059 ?auto_13064 ) ( not ( = ?auto_13066 ?auto_13059 ) ) ( not ( = ?auto_13070 ?auto_13059 ) ) ( AVAILABLE ?auto_13059 ) ( SURFACE-AT ?auto_13057 ?auto_13064 ) ( ON ?auto_13057 ?auto_13062 ) ( CLEAR ?auto_13057 ) ( not ( = ?auto_13057 ?auto_13062 ) ) ( not ( = ?auto_13058 ?auto_13062 ) ) ( not ( = ?auto_13056 ?auto_13062 ) ) ( not ( = ?auto_13061 ?auto_13062 ) ) ( SURFACE-AT ?auto_13069 ?auto_13068 ) ( CLEAR ?auto_13069 ) ( IS-CRATE ?auto_13056 ) ( not ( = ?auto_13069 ?auto_13056 ) ) ( not ( = ?auto_13057 ?auto_13069 ) ) ( not ( = ?auto_13058 ?auto_13069 ) ) ( not ( = ?auto_13061 ?auto_13069 ) ) ( not ( = ?auto_13062 ?auto_13069 ) ) ( AVAILABLE ?auto_13066 ) ( TRUCK-AT ?auto_13067 ?auto_13063 ) ( not ( = ?auto_13063 ?auto_13068 ) ) ( not ( = ?auto_13060 ?auto_13063 ) ) ( not ( = ?auto_13064 ?auto_13063 ) ) ( HOIST-AT ?auto_13065 ?auto_13063 ) ( not ( = ?auto_13066 ?auto_13065 ) ) ( not ( = ?auto_13070 ?auto_13065 ) ) ( not ( = ?auto_13059 ?auto_13065 ) ) ( AVAILABLE ?auto_13065 ) ( SURFACE-AT ?auto_13056 ?auto_13063 ) ( ON ?auto_13056 ?auto_13071 ) ( CLEAR ?auto_13056 ) ( not ( = ?auto_13057 ?auto_13071 ) ) ( not ( = ?auto_13058 ?auto_13071 ) ) ( not ( = ?auto_13056 ?auto_13071 ) ) ( not ( = ?auto_13061 ?auto_13071 ) ) ( not ( = ?auto_13062 ?auto_13071 ) ) ( not ( = ?auto_13069 ?auto_13071 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13057 ?auto_13058 )
      ( MAKE-2CRATE-VERIFY ?auto_13056 ?auto_13057 ?auto_13058 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13072 - SURFACE
      ?auto_13073 - SURFACE
      ?auto_13074 - SURFACE
      ?auto_13075 - SURFACE
    )
    :vars
    (
      ?auto_13078 - HOIST
      ?auto_13076 - PLACE
      ?auto_13081 - PLACE
      ?auto_13086 - HOIST
      ?auto_13083 - SURFACE
      ?auto_13080 - PLACE
      ?auto_13085 - HOIST
      ?auto_13079 - SURFACE
      ?auto_13082 - TRUCK
      ?auto_13084 - PLACE
      ?auto_13077 - HOIST
      ?auto_13087 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13078 ?auto_13076 ) ( IS-CRATE ?auto_13075 ) ( not ( = ?auto_13074 ?auto_13075 ) ) ( not ( = ?auto_13073 ?auto_13074 ) ) ( not ( = ?auto_13073 ?auto_13075 ) ) ( not ( = ?auto_13081 ?auto_13076 ) ) ( HOIST-AT ?auto_13086 ?auto_13081 ) ( not ( = ?auto_13078 ?auto_13086 ) ) ( AVAILABLE ?auto_13086 ) ( SURFACE-AT ?auto_13075 ?auto_13081 ) ( ON ?auto_13075 ?auto_13083 ) ( CLEAR ?auto_13075 ) ( not ( = ?auto_13074 ?auto_13083 ) ) ( not ( = ?auto_13075 ?auto_13083 ) ) ( not ( = ?auto_13073 ?auto_13083 ) ) ( IS-CRATE ?auto_13074 ) ( not ( = ?auto_13080 ?auto_13076 ) ) ( not ( = ?auto_13081 ?auto_13080 ) ) ( HOIST-AT ?auto_13085 ?auto_13080 ) ( not ( = ?auto_13078 ?auto_13085 ) ) ( not ( = ?auto_13086 ?auto_13085 ) ) ( AVAILABLE ?auto_13085 ) ( SURFACE-AT ?auto_13074 ?auto_13080 ) ( ON ?auto_13074 ?auto_13079 ) ( CLEAR ?auto_13074 ) ( not ( = ?auto_13074 ?auto_13079 ) ) ( not ( = ?auto_13075 ?auto_13079 ) ) ( not ( = ?auto_13073 ?auto_13079 ) ) ( not ( = ?auto_13083 ?auto_13079 ) ) ( SURFACE-AT ?auto_13072 ?auto_13076 ) ( CLEAR ?auto_13072 ) ( IS-CRATE ?auto_13073 ) ( not ( = ?auto_13072 ?auto_13073 ) ) ( not ( = ?auto_13074 ?auto_13072 ) ) ( not ( = ?auto_13075 ?auto_13072 ) ) ( not ( = ?auto_13083 ?auto_13072 ) ) ( not ( = ?auto_13079 ?auto_13072 ) ) ( AVAILABLE ?auto_13078 ) ( TRUCK-AT ?auto_13082 ?auto_13084 ) ( not ( = ?auto_13084 ?auto_13076 ) ) ( not ( = ?auto_13081 ?auto_13084 ) ) ( not ( = ?auto_13080 ?auto_13084 ) ) ( HOIST-AT ?auto_13077 ?auto_13084 ) ( not ( = ?auto_13078 ?auto_13077 ) ) ( not ( = ?auto_13086 ?auto_13077 ) ) ( not ( = ?auto_13085 ?auto_13077 ) ) ( AVAILABLE ?auto_13077 ) ( SURFACE-AT ?auto_13073 ?auto_13084 ) ( ON ?auto_13073 ?auto_13087 ) ( CLEAR ?auto_13073 ) ( not ( = ?auto_13074 ?auto_13087 ) ) ( not ( = ?auto_13075 ?auto_13087 ) ) ( not ( = ?auto_13073 ?auto_13087 ) ) ( not ( = ?auto_13083 ?auto_13087 ) ) ( not ( = ?auto_13079 ?auto_13087 ) ) ( not ( = ?auto_13072 ?auto_13087 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13073 ?auto_13074 ?auto_13075 )
      ( MAKE-3CRATE-VERIFY ?auto_13072 ?auto_13073 ?auto_13074 ?auto_13075 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13088 - SURFACE
      ?auto_13089 - SURFACE
      ?auto_13090 - SURFACE
      ?auto_13091 - SURFACE
      ?auto_13092 - SURFACE
    )
    :vars
    (
      ?auto_13095 - HOIST
      ?auto_13093 - PLACE
      ?auto_13098 - PLACE
      ?auto_13103 - HOIST
      ?auto_13100 - SURFACE
      ?auto_13097 - PLACE
      ?auto_13102 - HOIST
      ?auto_13096 - SURFACE
      ?auto_13099 - TRUCK
      ?auto_13101 - PLACE
      ?auto_13094 - HOIST
      ?auto_13104 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13095 ?auto_13093 ) ( IS-CRATE ?auto_13092 ) ( not ( = ?auto_13091 ?auto_13092 ) ) ( not ( = ?auto_13090 ?auto_13091 ) ) ( not ( = ?auto_13090 ?auto_13092 ) ) ( not ( = ?auto_13098 ?auto_13093 ) ) ( HOIST-AT ?auto_13103 ?auto_13098 ) ( not ( = ?auto_13095 ?auto_13103 ) ) ( AVAILABLE ?auto_13103 ) ( SURFACE-AT ?auto_13092 ?auto_13098 ) ( ON ?auto_13092 ?auto_13100 ) ( CLEAR ?auto_13092 ) ( not ( = ?auto_13091 ?auto_13100 ) ) ( not ( = ?auto_13092 ?auto_13100 ) ) ( not ( = ?auto_13090 ?auto_13100 ) ) ( IS-CRATE ?auto_13091 ) ( not ( = ?auto_13097 ?auto_13093 ) ) ( not ( = ?auto_13098 ?auto_13097 ) ) ( HOIST-AT ?auto_13102 ?auto_13097 ) ( not ( = ?auto_13095 ?auto_13102 ) ) ( not ( = ?auto_13103 ?auto_13102 ) ) ( AVAILABLE ?auto_13102 ) ( SURFACE-AT ?auto_13091 ?auto_13097 ) ( ON ?auto_13091 ?auto_13096 ) ( CLEAR ?auto_13091 ) ( not ( = ?auto_13091 ?auto_13096 ) ) ( not ( = ?auto_13092 ?auto_13096 ) ) ( not ( = ?auto_13090 ?auto_13096 ) ) ( not ( = ?auto_13100 ?auto_13096 ) ) ( SURFACE-AT ?auto_13089 ?auto_13093 ) ( CLEAR ?auto_13089 ) ( IS-CRATE ?auto_13090 ) ( not ( = ?auto_13089 ?auto_13090 ) ) ( not ( = ?auto_13091 ?auto_13089 ) ) ( not ( = ?auto_13092 ?auto_13089 ) ) ( not ( = ?auto_13100 ?auto_13089 ) ) ( not ( = ?auto_13096 ?auto_13089 ) ) ( AVAILABLE ?auto_13095 ) ( TRUCK-AT ?auto_13099 ?auto_13101 ) ( not ( = ?auto_13101 ?auto_13093 ) ) ( not ( = ?auto_13098 ?auto_13101 ) ) ( not ( = ?auto_13097 ?auto_13101 ) ) ( HOIST-AT ?auto_13094 ?auto_13101 ) ( not ( = ?auto_13095 ?auto_13094 ) ) ( not ( = ?auto_13103 ?auto_13094 ) ) ( not ( = ?auto_13102 ?auto_13094 ) ) ( AVAILABLE ?auto_13094 ) ( SURFACE-AT ?auto_13090 ?auto_13101 ) ( ON ?auto_13090 ?auto_13104 ) ( CLEAR ?auto_13090 ) ( not ( = ?auto_13091 ?auto_13104 ) ) ( not ( = ?auto_13092 ?auto_13104 ) ) ( not ( = ?auto_13090 ?auto_13104 ) ) ( not ( = ?auto_13100 ?auto_13104 ) ) ( not ( = ?auto_13096 ?auto_13104 ) ) ( not ( = ?auto_13089 ?auto_13104 ) ) ( ON ?auto_13089 ?auto_13088 ) ( not ( = ?auto_13088 ?auto_13089 ) ) ( not ( = ?auto_13088 ?auto_13090 ) ) ( not ( = ?auto_13088 ?auto_13091 ) ) ( not ( = ?auto_13088 ?auto_13092 ) ) ( not ( = ?auto_13088 ?auto_13100 ) ) ( not ( = ?auto_13088 ?auto_13096 ) ) ( not ( = ?auto_13088 ?auto_13104 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13090 ?auto_13091 ?auto_13092 )
      ( MAKE-4CRATE-VERIFY ?auto_13088 ?auto_13089 ?auto_13090 ?auto_13091 ?auto_13092 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13105 - SURFACE
      ?auto_13106 - SURFACE
    )
    :vars
    (
      ?auto_13111 - HOIST
      ?auto_13107 - PLACE
      ?auto_13110 - SURFACE
      ?auto_13114 - PLACE
      ?auto_13119 - HOIST
      ?auto_13116 - SURFACE
      ?auto_13113 - PLACE
      ?auto_13118 - HOIST
      ?auto_13112 - SURFACE
      ?auto_13108 - SURFACE
      ?auto_13117 - PLACE
      ?auto_13109 - HOIST
      ?auto_13120 - SURFACE
      ?auto_13115 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13111 ?auto_13107 ) ( IS-CRATE ?auto_13106 ) ( not ( = ?auto_13105 ?auto_13106 ) ) ( not ( = ?auto_13110 ?auto_13105 ) ) ( not ( = ?auto_13110 ?auto_13106 ) ) ( not ( = ?auto_13114 ?auto_13107 ) ) ( HOIST-AT ?auto_13119 ?auto_13114 ) ( not ( = ?auto_13111 ?auto_13119 ) ) ( AVAILABLE ?auto_13119 ) ( SURFACE-AT ?auto_13106 ?auto_13114 ) ( ON ?auto_13106 ?auto_13116 ) ( CLEAR ?auto_13106 ) ( not ( = ?auto_13105 ?auto_13116 ) ) ( not ( = ?auto_13106 ?auto_13116 ) ) ( not ( = ?auto_13110 ?auto_13116 ) ) ( IS-CRATE ?auto_13105 ) ( not ( = ?auto_13113 ?auto_13107 ) ) ( not ( = ?auto_13114 ?auto_13113 ) ) ( HOIST-AT ?auto_13118 ?auto_13113 ) ( not ( = ?auto_13111 ?auto_13118 ) ) ( not ( = ?auto_13119 ?auto_13118 ) ) ( AVAILABLE ?auto_13118 ) ( SURFACE-AT ?auto_13105 ?auto_13113 ) ( ON ?auto_13105 ?auto_13112 ) ( CLEAR ?auto_13105 ) ( not ( = ?auto_13105 ?auto_13112 ) ) ( not ( = ?auto_13106 ?auto_13112 ) ) ( not ( = ?auto_13110 ?auto_13112 ) ) ( not ( = ?auto_13116 ?auto_13112 ) ) ( SURFACE-AT ?auto_13108 ?auto_13107 ) ( CLEAR ?auto_13108 ) ( IS-CRATE ?auto_13110 ) ( not ( = ?auto_13108 ?auto_13110 ) ) ( not ( = ?auto_13105 ?auto_13108 ) ) ( not ( = ?auto_13106 ?auto_13108 ) ) ( not ( = ?auto_13116 ?auto_13108 ) ) ( not ( = ?auto_13112 ?auto_13108 ) ) ( AVAILABLE ?auto_13111 ) ( not ( = ?auto_13117 ?auto_13107 ) ) ( not ( = ?auto_13114 ?auto_13117 ) ) ( not ( = ?auto_13113 ?auto_13117 ) ) ( HOIST-AT ?auto_13109 ?auto_13117 ) ( not ( = ?auto_13111 ?auto_13109 ) ) ( not ( = ?auto_13119 ?auto_13109 ) ) ( not ( = ?auto_13118 ?auto_13109 ) ) ( AVAILABLE ?auto_13109 ) ( SURFACE-AT ?auto_13110 ?auto_13117 ) ( ON ?auto_13110 ?auto_13120 ) ( CLEAR ?auto_13110 ) ( not ( = ?auto_13105 ?auto_13120 ) ) ( not ( = ?auto_13106 ?auto_13120 ) ) ( not ( = ?auto_13110 ?auto_13120 ) ) ( not ( = ?auto_13116 ?auto_13120 ) ) ( not ( = ?auto_13112 ?auto_13120 ) ) ( not ( = ?auto_13108 ?auto_13120 ) ) ( TRUCK-AT ?auto_13115 ?auto_13107 ) )
    :subtasks
    ( ( !DRIVE ?auto_13115 ?auto_13107 ?auto_13117 )
      ( MAKE-2CRATE ?auto_13110 ?auto_13105 ?auto_13106 )
      ( MAKE-1CRATE-VERIFY ?auto_13105 ?auto_13106 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13121 - SURFACE
      ?auto_13122 - SURFACE
      ?auto_13123 - SURFACE
    )
    :vars
    (
      ?auto_13130 - HOIST
      ?auto_13125 - PLACE
      ?auto_13128 - PLACE
      ?auto_13129 - HOIST
      ?auto_13131 - SURFACE
      ?auto_13136 - PLACE
      ?auto_13127 - HOIST
      ?auto_13132 - SURFACE
      ?auto_13133 - SURFACE
      ?auto_13124 - PLACE
      ?auto_13126 - HOIST
      ?auto_13134 - SURFACE
      ?auto_13135 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13130 ?auto_13125 ) ( IS-CRATE ?auto_13123 ) ( not ( = ?auto_13122 ?auto_13123 ) ) ( not ( = ?auto_13121 ?auto_13122 ) ) ( not ( = ?auto_13121 ?auto_13123 ) ) ( not ( = ?auto_13128 ?auto_13125 ) ) ( HOIST-AT ?auto_13129 ?auto_13128 ) ( not ( = ?auto_13130 ?auto_13129 ) ) ( AVAILABLE ?auto_13129 ) ( SURFACE-AT ?auto_13123 ?auto_13128 ) ( ON ?auto_13123 ?auto_13131 ) ( CLEAR ?auto_13123 ) ( not ( = ?auto_13122 ?auto_13131 ) ) ( not ( = ?auto_13123 ?auto_13131 ) ) ( not ( = ?auto_13121 ?auto_13131 ) ) ( IS-CRATE ?auto_13122 ) ( not ( = ?auto_13136 ?auto_13125 ) ) ( not ( = ?auto_13128 ?auto_13136 ) ) ( HOIST-AT ?auto_13127 ?auto_13136 ) ( not ( = ?auto_13130 ?auto_13127 ) ) ( not ( = ?auto_13129 ?auto_13127 ) ) ( AVAILABLE ?auto_13127 ) ( SURFACE-AT ?auto_13122 ?auto_13136 ) ( ON ?auto_13122 ?auto_13132 ) ( CLEAR ?auto_13122 ) ( not ( = ?auto_13122 ?auto_13132 ) ) ( not ( = ?auto_13123 ?auto_13132 ) ) ( not ( = ?auto_13121 ?auto_13132 ) ) ( not ( = ?auto_13131 ?auto_13132 ) ) ( SURFACE-AT ?auto_13133 ?auto_13125 ) ( CLEAR ?auto_13133 ) ( IS-CRATE ?auto_13121 ) ( not ( = ?auto_13133 ?auto_13121 ) ) ( not ( = ?auto_13122 ?auto_13133 ) ) ( not ( = ?auto_13123 ?auto_13133 ) ) ( not ( = ?auto_13131 ?auto_13133 ) ) ( not ( = ?auto_13132 ?auto_13133 ) ) ( AVAILABLE ?auto_13130 ) ( not ( = ?auto_13124 ?auto_13125 ) ) ( not ( = ?auto_13128 ?auto_13124 ) ) ( not ( = ?auto_13136 ?auto_13124 ) ) ( HOIST-AT ?auto_13126 ?auto_13124 ) ( not ( = ?auto_13130 ?auto_13126 ) ) ( not ( = ?auto_13129 ?auto_13126 ) ) ( not ( = ?auto_13127 ?auto_13126 ) ) ( AVAILABLE ?auto_13126 ) ( SURFACE-AT ?auto_13121 ?auto_13124 ) ( ON ?auto_13121 ?auto_13134 ) ( CLEAR ?auto_13121 ) ( not ( = ?auto_13122 ?auto_13134 ) ) ( not ( = ?auto_13123 ?auto_13134 ) ) ( not ( = ?auto_13121 ?auto_13134 ) ) ( not ( = ?auto_13131 ?auto_13134 ) ) ( not ( = ?auto_13132 ?auto_13134 ) ) ( not ( = ?auto_13133 ?auto_13134 ) ) ( TRUCK-AT ?auto_13135 ?auto_13125 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13122 ?auto_13123 )
      ( MAKE-2CRATE-VERIFY ?auto_13121 ?auto_13122 ?auto_13123 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13137 - SURFACE
      ?auto_13138 - SURFACE
      ?auto_13139 - SURFACE
      ?auto_13140 - SURFACE
    )
    :vars
    (
      ?auto_13141 - HOIST
      ?auto_13150 - PLACE
      ?auto_13149 - PLACE
      ?auto_13147 - HOIST
      ?auto_13144 - SURFACE
      ?auto_13151 - PLACE
      ?auto_13145 - HOIST
      ?auto_13142 - SURFACE
      ?auto_13146 - PLACE
      ?auto_13143 - HOIST
      ?auto_13148 - SURFACE
      ?auto_13152 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13141 ?auto_13150 ) ( IS-CRATE ?auto_13140 ) ( not ( = ?auto_13139 ?auto_13140 ) ) ( not ( = ?auto_13138 ?auto_13139 ) ) ( not ( = ?auto_13138 ?auto_13140 ) ) ( not ( = ?auto_13149 ?auto_13150 ) ) ( HOIST-AT ?auto_13147 ?auto_13149 ) ( not ( = ?auto_13141 ?auto_13147 ) ) ( AVAILABLE ?auto_13147 ) ( SURFACE-AT ?auto_13140 ?auto_13149 ) ( ON ?auto_13140 ?auto_13144 ) ( CLEAR ?auto_13140 ) ( not ( = ?auto_13139 ?auto_13144 ) ) ( not ( = ?auto_13140 ?auto_13144 ) ) ( not ( = ?auto_13138 ?auto_13144 ) ) ( IS-CRATE ?auto_13139 ) ( not ( = ?auto_13151 ?auto_13150 ) ) ( not ( = ?auto_13149 ?auto_13151 ) ) ( HOIST-AT ?auto_13145 ?auto_13151 ) ( not ( = ?auto_13141 ?auto_13145 ) ) ( not ( = ?auto_13147 ?auto_13145 ) ) ( AVAILABLE ?auto_13145 ) ( SURFACE-AT ?auto_13139 ?auto_13151 ) ( ON ?auto_13139 ?auto_13142 ) ( CLEAR ?auto_13139 ) ( not ( = ?auto_13139 ?auto_13142 ) ) ( not ( = ?auto_13140 ?auto_13142 ) ) ( not ( = ?auto_13138 ?auto_13142 ) ) ( not ( = ?auto_13144 ?auto_13142 ) ) ( SURFACE-AT ?auto_13137 ?auto_13150 ) ( CLEAR ?auto_13137 ) ( IS-CRATE ?auto_13138 ) ( not ( = ?auto_13137 ?auto_13138 ) ) ( not ( = ?auto_13139 ?auto_13137 ) ) ( not ( = ?auto_13140 ?auto_13137 ) ) ( not ( = ?auto_13144 ?auto_13137 ) ) ( not ( = ?auto_13142 ?auto_13137 ) ) ( AVAILABLE ?auto_13141 ) ( not ( = ?auto_13146 ?auto_13150 ) ) ( not ( = ?auto_13149 ?auto_13146 ) ) ( not ( = ?auto_13151 ?auto_13146 ) ) ( HOIST-AT ?auto_13143 ?auto_13146 ) ( not ( = ?auto_13141 ?auto_13143 ) ) ( not ( = ?auto_13147 ?auto_13143 ) ) ( not ( = ?auto_13145 ?auto_13143 ) ) ( AVAILABLE ?auto_13143 ) ( SURFACE-AT ?auto_13138 ?auto_13146 ) ( ON ?auto_13138 ?auto_13148 ) ( CLEAR ?auto_13138 ) ( not ( = ?auto_13139 ?auto_13148 ) ) ( not ( = ?auto_13140 ?auto_13148 ) ) ( not ( = ?auto_13138 ?auto_13148 ) ) ( not ( = ?auto_13144 ?auto_13148 ) ) ( not ( = ?auto_13142 ?auto_13148 ) ) ( not ( = ?auto_13137 ?auto_13148 ) ) ( TRUCK-AT ?auto_13152 ?auto_13150 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13138 ?auto_13139 ?auto_13140 )
      ( MAKE-3CRATE-VERIFY ?auto_13137 ?auto_13138 ?auto_13139 ?auto_13140 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13153 - SURFACE
      ?auto_13154 - SURFACE
      ?auto_13155 - SURFACE
      ?auto_13156 - SURFACE
      ?auto_13157 - SURFACE
    )
    :vars
    (
      ?auto_13158 - HOIST
      ?auto_13167 - PLACE
      ?auto_13166 - PLACE
      ?auto_13164 - HOIST
      ?auto_13161 - SURFACE
      ?auto_13168 - PLACE
      ?auto_13162 - HOIST
      ?auto_13159 - SURFACE
      ?auto_13163 - PLACE
      ?auto_13160 - HOIST
      ?auto_13165 - SURFACE
      ?auto_13169 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13158 ?auto_13167 ) ( IS-CRATE ?auto_13157 ) ( not ( = ?auto_13156 ?auto_13157 ) ) ( not ( = ?auto_13155 ?auto_13156 ) ) ( not ( = ?auto_13155 ?auto_13157 ) ) ( not ( = ?auto_13166 ?auto_13167 ) ) ( HOIST-AT ?auto_13164 ?auto_13166 ) ( not ( = ?auto_13158 ?auto_13164 ) ) ( AVAILABLE ?auto_13164 ) ( SURFACE-AT ?auto_13157 ?auto_13166 ) ( ON ?auto_13157 ?auto_13161 ) ( CLEAR ?auto_13157 ) ( not ( = ?auto_13156 ?auto_13161 ) ) ( not ( = ?auto_13157 ?auto_13161 ) ) ( not ( = ?auto_13155 ?auto_13161 ) ) ( IS-CRATE ?auto_13156 ) ( not ( = ?auto_13168 ?auto_13167 ) ) ( not ( = ?auto_13166 ?auto_13168 ) ) ( HOIST-AT ?auto_13162 ?auto_13168 ) ( not ( = ?auto_13158 ?auto_13162 ) ) ( not ( = ?auto_13164 ?auto_13162 ) ) ( AVAILABLE ?auto_13162 ) ( SURFACE-AT ?auto_13156 ?auto_13168 ) ( ON ?auto_13156 ?auto_13159 ) ( CLEAR ?auto_13156 ) ( not ( = ?auto_13156 ?auto_13159 ) ) ( not ( = ?auto_13157 ?auto_13159 ) ) ( not ( = ?auto_13155 ?auto_13159 ) ) ( not ( = ?auto_13161 ?auto_13159 ) ) ( SURFACE-AT ?auto_13154 ?auto_13167 ) ( CLEAR ?auto_13154 ) ( IS-CRATE ?auto_13155 ) ( not ( = ?auto_13154 ?auto_13155 ) ) ( not ( = ?auto_13156 ?auto_13154 ) ) ( not ( = ?auto_13157 ?auto_13154 ) ) ( not ( = ?auto_13161 ?auto_13154 ) ) ( not ( = ?auto_13159 ?auto_13154 ) ) ( AVAILABLE ?auto_13158 ) ( not ( = ?auto_13163 ?auto_13167 ) ) ( not ( = ?auto_13166 ?auto_13163 ) ) ( not ( = ?auto_13168 ?auto_13163 ) ) ( HOIST-AT ?auto_13160 ?auto_13163 ) ( not ( = ?auto_13158 ?auto_13160 ) ) ( not ( = ?auto_13164 ?auto_13160 ) ) ( not ( = ?auto_13162 ?auto_13160 ) ) ( AVAILABLE ?auto_13160 ) ( SURFACE-AT ?auto_13155 ?auto_13163 ) ( ON ?auto_13155 ?auto_13165 ) ( CLEAR ?auto_13155 ) ( not ( = ?auto_13156 ?auto_13165 ) ) ( not ( = ?auto_13157 ?auto_13165 ) ) ( not ( = ?auto_13155 ?auto_13165 ) ) ( not ( = ?auto_13161 ?auto_13165 ) ) ( not ( = ?auto_13159 ?auto_13165 ) ) ( not ( = ?auto_13154 ?auto_13165 ) ) ( TRUCK-AT ?auto_13169 ?auto_13167 ) ( ON ?auto_13154 ?auto_13153 ) ( not ( = ?auto_13153 ?auto_13154 ) ) ( not ( = ?auto_13153 ?auto_13155 ) ) ( not ( = ?auto_13153 ?auto_13156 ) ) ( not ( = ?auto_13153 ?auto_13157 ) ) ( not ( = ?auto_13153 ?auto_13161 ) ) ( not ( = ?auto_13153 ?auto_13159 ) ) ( not ( = ?auto_13153 ?auto_13165 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13155 ?auto_13156 ?auto_13157 )
      ( MAKE-4CRATE-VERIFY ?auto_13153 ?auto_13154 ?auto_13155 ?auto_13156 ?auto_13157 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13170 - SURFACE
      ?auto_13171 - SURFACE
    )
    :vars
    (
      ?auto_13172 - HOIST
      ?auto_13183 - PLACE
      ?auto_13178 - SURFACE
      ?auto_13182 - PLACE
      ?auto_13180 - HOIST
      ?auto_13175 - SURFACE
      ?auto_13184 - PLACE
      ?auto_13176 - HOIST
      ?auto_13173 - SURFACE
      ?auto_13179 - SURFACE
      ?auto_13177 - PLACE
      ?auto_13174 - HOIST
      ?auto_13181 - SURFACE
      ?auto_13185 - TRUCK
      ?auto_13186 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13172 ?auto_13183 ) ( IS-CRATE ?auto_13171 ) ( not ( = ?auto_13170 ?auto_13171 ) ) ( not ( = ?auto_13178 ?auto_13170 ) ) ( not ( = ?auto_13178 ?auto_13171 ) ) ( not ( = ?auto_13182 ?auto_13183 ) ) ( HOIST-AT ?auto_13180 ?auto_13182 ) ( not ( = ?auto_13172 ?auto_13180 ) ) ( AVAILABLE ?auto_13180 ) ( SURFACE-AT ?auto_13171 ?auto_13182 ) ( ON ?auto_13171 ?auto_13175 ) ( CLEAR ?auto_13171 ) ( not ( = ?auto_13170 ?auto_13175 ) ) ( not ( = ?auto_13171 ?auto_13175 ) ) ( not ( = ?auto_13178 ?auto_13175 ) ) ( IS-CRATE ?auto_13170 ) ( not ( = ?auto_13184 ?auto_13183 ) ) ( not ( = ?auto_13182 ?auto_13184 ) ) ( HOIST-AT ?auto_13176 ?auto_13184 ) ( not ( = ?auto_13172 ?auto_13176 ) ) ( not ( = ?auto_13180 ?auto_13176 ) ) ( AVAILABLE ?auto_13176 ) ( SURFACE-AT ?auto_13170 ?auto_13184 ) ( ON ?auto_13170 ?auto_13173 ) ( CLEAR ?auto_13170 ) ( not ( = ?auto_13170 ?auto_13173 ) ) ( not ( = ?auto_13171 ?auto_13173 ) ) ( not ( = ?auto_13178 ?auto_13173 ) ) ( not ( = ?auto_13175 ?auto_13173 ) ) ( IS-CRATE ?auto_13178 ) ( not ( = ?auto_13179 ?auto_13178 ) ) ( not ( = ?auto_13170 ?auto_13179 ) ) ( not ( = ?auto_13171 ?auto_13179 ) ) ( not ( = ?auto_13175 ?auto_13179 ) ) ( not ( = ?auto_13173 ?auto_13179 ) ) ( not ( = ?auto_13177 ?auto_13183 ) ) ( not ( = ?auto_13182 ?auto_13177 ) ) ( not ( = ?auto_13184 ?auto_13177 ) ) ( HOIST-AT ?auto_13174 ?auto_13177 ) ( not ( = ?auto_13172 ?auto_13174 ) ) ( not ( = ?auto_13180 ?auto_13174 ) ) ( not ( = ?auto_13176 ?auto_13174 ) ) ( AVAILABLE ?auto_13174 ) ( SURFACE-AT ?auto_13178 ?auto_13177 ) ( ON ?auto_13178 ?auto_13181 ) ( CLEAR ?auto_13178 ) ( not ( = ?auto_13170 ?auto_13181 ) ) ( not ( = ?auto_13171 ?auto_13181 ) ) ( not ( = ?auto_13178 ?auto_13181 ) ) ( not ( = ?auto_13175 ?auto_13181 ) ) ( not ( = ?auto_13173 ?auto_13181 ) ) ( not ( = ?auto_13179 ?auto_13181 ) ) ( TRUCK-AT ?auto_13185 ?auto_13183 ) ( SURFACE-AT ?auto_13186 ?auto_13183 ) ( CLEAR ?auto_13186 ) ( LIFTING ?auto_13172 ?auto_13179 ) ( IS-CRATE ?auto_13179 ) ( not ( = ?auto_13186 ?auto_13179 ) ) ( not ( = ?auto_13170 ?auto_13186 ) ) ( not ( = ?auto_13171 ?auto_13186 ) ) ( not ( = ?auto_13178 ?auto_13186 ) ) ( not ( = ?auto_13175 ?auto_13186 ) ) ( not ( = ?auto_13173 ?auto_13186 ) ) ( not ( = ?auto_13181 ?auto_13186 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13186 ?auto_13179 )
      ( MAKE-2CRATE ?auto_13178 ?auto_13170 ?auto_13171 )
      ( MAKE-1CRATE-VERIFY ?auto_13170 ?auto_13171 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13187 - SURFACE
      ?auto_13188 - SURFACE
      ?auto_13189 - SURFACE
    )
    :vars
    (
      ?auto_13203 - HOIST
      ?auto_13197 - PLACE
      ?auto_13199 - PLACE
      ?auto_13198 - HOIST
      ?auto_13194 - SURFACE
      ?auto_13191 - PLACE
      ?auto_13193 - HOIST
      ?auto_13202 - SURFACE
      ?auto_13200 - SURFACE
      ?auto_13196 - PLACE
      ?auto_13190 - HOIST
      ?auto_13192 - SURFACE
      ?auto_13195 - TRUCK
      ?auto_13201 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13203 ?auto_13197 ) ( IS-CRATE ?auto_13189 ) ( not ( = ?auto_13188 ?auto_13189 ) ) ( not ( = ?auto_13187 ?auto_13188 ) ) ( not ( = ?auto_13187 ?auto_13189 ) ) ( not ( = ?auto_13199 ?auto_13197 ) ) ( HOIST-AT ?auto_13198 ?auto_13199 ) ( not ( = ?auto_13203 ?auto_13198 ) ) ( AVAILABLE ?auto_13198 ) ( SURFACE-AT ?auto_13189 ?auto_13199 ) ( ON ?auto_13189 ?auto_13194 ) ( CLEAR ?auto_13189 ) ( not ( = ?auto_13188 ?auto_13194 ) ) ( not ( = ?auto_13189 ?auto_13194 ) ) ( not ( = ?auto_13187 ?auto_13194 ) ) ( IS-CRATE ?auto_13188 ) ( not ( = ?auto_13191 ?auto_13197 ) ) ( not ( = ?auto_13199 ?auto_13191 ) ) ( HOIST-AT ?auto_13193 ?auto_13191 ) ( not ( = ?auto_13203 ?auto_13193 ) ) ( not ( = ?auto_13198 ?auto_13193 ) ) ( AVAILABLE ?auto_13193 ) ( SURFACE-AT ?auto_13188 ?auto_13191 ) ( ON ?auto_13188 ?auto_13202 ) ( CLEAR ?auto_13188 ) ( not ( = ?auto_13188 ?auto_13202 ) ) ( not ( = ?auto_13189 ?auto_13202 ) ) ( not ( = ?auto_13187 ?auto_13202 ) ) ( not ( = ?auto_13194 ?auto_13202 ) ) ( IS-CRATE ?auto_13187 ) ( not ( = ?auto_13200 ?auto_13187 ) ) ( not ( = ?auto_13188 ?auto_13200 ) ) ( not ( = ?auto_13189 ?auto_13200 ) ) ( not ( = ?auto_13194 ?auto_13200 ) ) ( not ( = ?auto_13202 ?auto_13200 ) ) ( not ( = ?auto_13196 ?auto_13197 ) ) ( not ( = ?auto_13199 ?auto_13196 ) ) ( not ( = ?auto_13191 ?auto_13196 ) ) ( HOIST-AT ?auto_13190 ?auto_13196 ) ( not ( = ?auto_13203 ?auto_13190 ) ) ( not ( = ?auto_13198 ?auto_13190 ) ) ( not ( = ?auto_13193 ?auto_13190 ) ) ( AVAILABLE ?auto_13190 ) ( SURFACE-AT ?auto_13187 ?auto_13196 ) ( ON ?auto_13187 ?auto_13192 ) ( CLEAR ?auto_13187 ) ( not ( = ?auto_13188 ?auto_13192 ) ) ( not ( = ?auto_13189 ?auto_13192 ) ) ( not ( = ?auto_13187 ?auto_13192 ) ) ( not ( = ?auto_13194 ?auto_13192 ) ) ( not ( = ?auto_13202 ?auto_13192 ) ) ( not ( = ?auto_13200 ?auto_13192 ) ) ( TRUCK-AT ?auto_13195 ?auto_13197 ) ( SURFACE-AT ?auto_13201 ?auto_13197 ) ( CLEAR ?auto_13201 ) ( LIFTING ?auto_13203 ?auto_13200 ) ( IS-CRATE ?auto_13200 ) ( not ( = ?auto_13201 ?auto_13200 ) ) ( not ( = ?auto_13188 ?auto_13201 ) ) ( not ( = ?auto_13189 ?auto_13201 ) ) ( not ( = ?auto_13187 ?auto_13201 ) ) ( not ( = ?auto_13194 ?auto_13201 ) ) ( not ( = ?auto_13202 ?auto_13201 ) ) ( not ( = ?auto_13192 ?auto_13201 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13188 ?auto_13189 )
      ( MAKE-2CRATE-VERIFY ?auto_13187 ?auto_13188 ?auto_13189 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13204 - SURFACE
      ?auto_13205 - SURFACE
      ?auto_13206 - SURFACE
      ?auto_13207 - SURFACE
    )
    :vars
    (
      ?auto_13217 - HOIST
      ?auto_13210 - PLACE
      ?auto_13209 - PLACE
      ?auto_13214 - HOIST
      ?auto_13212 - SURFACE
      ?auto_13216 - PLACE
      ?auto_13218 - HOIST
      ?auto_13219 - SURFACE
      ?auto_13211 - PLACE
      ?auto_13215 - HOIST
      ?auto_13208 - SURFACE
      ?auto_13220 - TRUCK
      ?auto_13213 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13217 ?auto_13210 ) ( IS-CRATE ?auto_13207 ) ( not ( = ?auto_13206 ?auto_13207 ) ) ( not ( = ?auto_13205 ?auto_13206 ) ) ( not ( = ?auto_13205 ?auto_13207 ) ) ( not ( = ?auto_13209 ?auto_13210 ) ) ( HOIST-AT ?auto_13214 ?auto_13209 ) ( not ( = ?auto_13217 ?auto_13214 ) ) ( AVAILABLE ?auto_13214 ) ( SURFACE-AT ?auto_13207 ?auto_13209 ) ( ON ?auto_13207 ?auto_13212 ) ( CLEAR ?auto_13207 ) ( not ( = ?auto_13206 ?auto_13212 ) ) ( not ( = ?auto_13207 ?auto_13212 ) ) ( not ( = ?auto_13205 ?auto_13212 ) ) ( IS-CRATE ?auto_13206 ) ( not ( = ?auto_13216 ?auto_13210 ) ) ( not ( = ?auto_13209 ?auto_13216 ) ) ( HOIST-AT ?auto_13218 ?auto_13216 ) ( not ( = ?auto_13217 ?auto_13218 ) ) ( not ( = ?auto_13214 ?auto_13218 ) ) ( AVAILABLE ?auto_13218 ) ( SURFACE-AT ?auto_13206 ?auto_13216 ) ( ON ?auto_13206 ?auto_13219 ) ( CLEAR ?auto_13206 ) ( not ( = ?auto_13206 ?auto_13219 ) ) ( not ( = ?auto_13207 ?auto_13219 ) ) ( not ( = ?auto_13205 ?auto_13219 ) ) ( not ( = ?auto_13212 ?auto_13219 ) ) ( IS-CRATE ?auto_13205 ) ( not ( = ?auto_13204 ?auto_13205 ) ) ( not ( = ?auto_13206 ?auto_13204 ) ) ( not ( = ?auto_13207 ?auto_13204 ) ) ( not ( = ?auto_13212 ?auto_13204 ) ) ( not ( = ?auto_13219 ?auto_13204 ) ) ( not ( = ?auto_13211 ?auto_13210 ) ) ( not ( = ?auto_13209 ?auto_13211 ) ) ( not ( = ?auto_13216 ?auto_13211 ) ) ( HOIST-AT ?auto_13215 ?auto_13211 ) ( not ( = ?auto_13217 ?auto_13215 ) ) ( not ( = ?auto_13214 ?auto_13215 ) ) ( not ( = ?auto_13218 ?auto_13215 ) ) ( AVAILABLE ?auto_13215 ) ( SURFACE-AT ?auto_13205 ?auto_13211 ) ( ON ?auto_13205 ?auto_13208 ) ( CLEAR ?auto_13205 ) ( not ( = ?auto_13206 ?auto_13208 ) ) ( not ( = ?auto_13207 ?auto_13208 ) ) ( not ( = ?auto_13205 ?auto_13208 ) ) ( not ( = ?auto_13212 ?auto_13208 ) ) ( not ( = ?auto_13219 ?auto_13208 ) ) ( not ( = ?auto_13204 ?auto_13208 ) ) ( TRUCK-AT ?auto_13220 ?auto_13210 ) ( SURFACE-AT ?auto_13213 ?auto_13210 ) ( CLEAR ?auto_13213 ) ( LIFTING ?auto_13217 ?auto_13204 ) ( IS-CRATE ?auto_13204 ) ( not ( = ?auto_13213 ?auto_13204 ) ) ( not ( = ?auto_13206 ?auto_13213 ) ) ( not ( = ?auto_13207 ?auto_13213 ) ) ( not ( = ?auto_13205 ?auto_13213 ) ) ( not ( = ?auto_13212 ?auto_13213 ) ) ( not ( = ?auto_13219 ?auto_13213 ) ) ( not ( = ?auto_13208 ?auto_13213 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13205 ?auto_13206 ?auto_13207 )
      ( MAKE-3CRATE-VERIFY ?auto_13204 ?auto_13205 ?auto_13206 ?auto_13207 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13221 - SURFACE
      ?auto_13222 - SURFACE
      ?auto_13223 - SURFACE
      ?auto_13224 - SURFACE
      ?auto_13225 - SURFACE
    )
    :vars
    (
      ?auto_13234 - HOIST
      ?auto_13228 - PLACE
      ?auto_13227 - PLACE
      ?auto_13231 - HOIST
      ?auto_13230 - SURFACE
      ?auto_13233 - PLACE
      ?auto_13235 - HOIST
      ?auto_13236 - SURFACE
      ?auto_13229 - PLACE
      ?auto_13232 - HOIST
      ?auto_13226 - SURFACE
      ?auto_13237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13234 ?auto_13228 ) ( IS-CRATE ?auto_13225 ) ( not ( = ?auto_13224 ?auto_13225 ) ) ( not ( = ?auto_13223 ?auto_13224 ) ) ( not ( = ?auto_13223 ?auto_13225 ) ) ( not ( = ?auto_13227 ?auto_13228 ) ) ( HOIST-AT ?auto_13231 ?auto_13227 ) ( not ( = ?auto_13234 ?auto_13231 ) ) ( AVAILABLE ?auto_13231 ) ( SURFACE-AT ?auto_13225 ?auto_13227 ) ( ON ?auto_13225 ?auto_13230 ) ( CLEAR ?auto_13225 ) ( not ( = ?auto_13224 ?auto_13230 ) ) ( not ( = ?auto_13225 ?auto_13230 ) ) ( not ( = ?auto_13223 ?auto_13230 ) ) ( IS-CRATE ?auto_13224 ) ( not ( = ?auto_13233 ?auto_13228 ) ) ( not ( = ?auto_13227 ?auto_13233 ) ) ( HOIST-AT ?auto_13235 ?auto_13233 ) ( not ( = ?auto_13234 ?auto_13235 ) ) ( not ( = ?auto_13231 ?auto_13235 ) ) ( AVAILABLE ?auto_13235 ) ( SURFACE-AT ?auto_13224 ?auto_13233 ) ( ON ?auto_13224 ?auto_13236 ) ( CLEAR ?auto_13224 ) ( not ( = ?auto_13224 ?auto_13236 ) ) ( not ( = ?auto_13225 ?auto_13236 ) ) ( not ( = ?auto_13223 ?auto_13236 ) ) ( not ( = ?auto_13230 ?auto_13236 ) ) ( IS-CRATE ?auto_13223 ) ( not ( = ?auto_13222 ?auto_13223 ) ) ( not ( = ?auto_13224 ?auto_13222 ) ) ( not ( = ?auto_13225 ?auto_13222 ) ) ( not ( = ?auto_13230 ?auto_13222 ) ) ( not ( = ?auto_13236 ?auto_13222 ) ) ( not ( = ?auto_13229 ?auto_13228 ) ) ( not ( = ?auto_13227 ?auto_13229 ) ) ( not ( = ?auto_13233 ?auto_13229 ) ) ( HOIST-AT ?auto_13232 ?auto_13229 ) ( not ( = ?auto_13234 ?auto_13232 ) ) ( not ( = ?auto_13231 ?auto_13232 ) ) ( not ( = ?auto_13235 ?auto_13232 ) ) ( AVAILABLE ?auto_13232 ) ( SURFACE-AT ?auto_13223 ?auto_13229 ) ( ON ?auto_13223 ?auto_13226 ) ( CLEAR ?auto_13223 ) ( not ( = ?auto_13224 ?auto_13226 ) ) ( not ( = ?auto_13225 ?auto_13226 ) ) ( not ( = ?auto_13223 ?auto_13226 ) ) ( not ( = ?auto_13230 ?auto_13226 ) ) ( not ( = ?auto_13236 ?auto_13226 ) ) ( not ( = ?auto_13222 ?auto_13226 ) ) ( TRUCK-AT ?auto_13237 ?auto_13228 ) ( SURFACE-AT ?auto_13221 ?auto_13228 ) ( CLEAR ?auto_13221 ) ( LIFTING ?auto_13234 ?auto_13222 ) ( IS-CRATE ?auto_13222 ) ( not ( = ?auto_13221 ?auto_13222 ) ) ( not ( = ?auto_13224 ?auto_13221 ) ) ( not ( = ?auto_13225 ?auto_13221 ) ) ( not ( = ?auto_13223 ?auto_13221 ) ) ( not ( = ?auto_13230 ?auto_13221 ) ) ( not ( = ?auto_13236 ?auto_13221 ) ) ( not ( = ?auto_13226 ?auto_13221 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13223 ?auto_13224 ?auto_13225 )
      ( MAKE-4CRATE-VERIFY ?auto_13221 ?auto_13222 ?auto_13223 ?auto_13224 ?auto_13225 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13238 - SURFACE
      ?auto_13239 - SURFACE
    )
    :vars
    (
      ?auto_13249 - HOIST
      ?auto_13242 - PLACE
      ?auto_13254 - SURFACE
      ?auto_13241 - PLACE
      ?auto_13246 - HOIST
      ?auto_13244 - SURFACE
      ?auto_13248 - PLACE
      ?auto_13250 - HOIST
      ?auto_13251 - SURFACE
      ?auto_13252 - SURFACE
      ?auto_13243 - PLACE
      ?auto_13247 - HOIST
      ?auto_13240 - SURFACE
      ?auto_13253 - TRUCK
      ?auto_13245 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13249 ?auto_13242 ) ( IS-CRATE ?auto_13239 ) ( not ( = ?auto_13238 ?auto_13239 ) ) ( not ( = ?auto_13254 ?auto_13238 ) ) ( not ( = ?auto_13254 ?auto_13239 ) ) ( not ( = ?auto_13241 ?auto_13242 ) ) ( HOIST-AT ?auto_13246 ?auto_13241 ) ( not ( = ?auto_13249 ?auto_13246 ) ) ( AVAILABLE ?auto_13246 ) ( SURFACE-AT ?auto_13239 ?auto_13241 ) ( ON ?auto_13239 ?auto_13244 ) ( CLEAR ?auto_13239 ) ( not ( = ?auto_13238 ?auto_13244 ) ) ( not ( = ?auto_13239 ?auto_13244 ) ) ( not ( = ?auto_13254 ?auto_13244 ) ) ( IS-CRATE ?auto_13238 ) ( not ( = ?auto_13248 ?auto_13242 ) ) ( not ( = ?auto_13241 ?auto_13248 ) ) ( HOIST-AT ?auto_13250 ?auto_13248 ) ( not ( = ?auto_13249 ?auto_13250 ) ) ( not ( = ?auto_13246 ?auto_13250 ) ) ( AVAILABLE ?auto_13250 ) ( SURFACE-AT ?auto_13238 ?auto_13248 ) ( ON ?auto_13238 ?auto_13251 ) ( CLEAR ?auto_13238 ) ( not ( = ?auto_13238 ?auto_13251 ) ) ( not ( = ?auto_13239 ?auto_13251 ) ) ( not ( = ?auto_13254 ?auto_13251 ) ) ( not ( = ?auto_13244 ?auto_13251 ) ) ( IS-CRATE ?auto_13254 ) ( not ( = ?auto_13252 ?auto_13254 ) ) ( not ( = ?auto_13238 ?auto_13252 ) ) ( not ( = ?auto_13239 ?auto_13252 ) ) ( not ( = ?auto_13244 ?auto_13252 ) ) ( not ( = ?auto_13251 ?auto_13252 ) ) ( not ( = ?auto_13243 ?auto_13242 ) ) ( not ( = ?auto_13241 ?auto_13243 ) ) ( not ( = ?auto_13248 ?auto_13243 ) ) ( HOIST-AT ?auto_13247 ?auto_13243 ) ( not ( = ?auto_13249 ?auto_13247 ) ) ( not ( = ?auto_13246 ?auto_13247 ) ) ( not ( = ?auto_13250 ?auto_13247 ) ) ( AVAILABLE ?auto_13247 ) ( SURFACE-AT ?auto_13254 ?auto_13243 ) ( ON ?auto_13254 ?auto_13240 ) ( CLEAR ?auto_13254 ) ( not ( = ?auto_13238 ?auto_13240 ) ) ( not ( = ?auto_13239 ?auto_13240 ) ) ( not ( = ?auto_13254 ?auto_13240 ) ) ( not ( = ?auto_13244 ?auto_13240 ) ) ( not ( = ?auto_13251 ?auto_13240 ) ) ( not ( = ?auto_13252 ?auto_13240 ) ) ( TRUCK-AT ?auto_13253 ?auto_13242 ) ( SURFACE-AT ?auto_13245 ?auto_13242 ) ( CLEAR ?auto_13245 ) ( IS-CRATE ?auto_13252 ) ( not ( = ?auto_13245 ?auto_13252 ) ) ( not ( = ?auto_13238 ?auto_13245 ) ) ( not ( = ?auto_13239 ?auto_13245 ) ) ( not ( = ?auto_13254 ?auto_13245 ) ) ( not ( = ?auto_13244 ?auto_13245 ) ) ( not ( = ?auto_13251 ?auto_13245 ) ) ( not ( = ?auto_13240 ?auto_13245 ) ) ( AVAILABLE ?auto_13249 ) ( IN ?auto_13252 ?auto_13253 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13249 ?auto_13252 ?auto_13253 ?auto_13242 )
      ( MAKE-2CRATE ?auto_13254 ?auto_13238 ?auto_13239 )
      ( MAKE-1CRATE-VERIFY ?auto_13238 ?auto_13239 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13255 - SURFACE
      ?auto_13256 - SURFACE
      ?auto_13257 - SURFACE
    )
    :vars
    (
      ?auto_13261 - HOIST
      ?auto_13271 - PLACE
      ?auto_13260 - PLACE
      ?auto_13269 - HOIST
      ?auto_13259 - SURFACE
      ?auto_13265 - PLACE
      ?auto_13267 - HOIST
      ?auto_13263 - SURFACE
      ?auto_13258 - SURFACE
      ?auto_13270 - PLACE
      ?auto_13264 - HOIST
      ?auto_13262 - SURFACE
      ?auto_13266 - TRUCK
      ?auto_13268 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13261 ?auto_13271 ) ( IS-CRATE ?auto_13257 ) ( not ( = ?auto_13256 ?auto_13257 ) ) ( not ( = ?auto_13255 ?auto_13256 ) ) ( not ( = ?auto_13255 ?auto_13257 ) ) ( not ( = ?auto_13260 ?auto_13271 ) ) ( HOIST-AT ?auto_13269 ?auto_13260 ) ( not ( = ?auto_13261 ?auto_13269 ) ) ( AVAILABLE ?auto_13269 ) ( SURFACE-AT ?auto_13257 ?auto_13260 ) ( ON ?auto_13257 ?auto_13259 ) ( CLEAR ?auto_13257 ) ( not ( = ?auto_13256 ?auto_13259 ) ) ( not ( = ?auto_13257 ?auto_13259 ) ) ( not ( = ?auto_13255 ?auto_13259 ) ) ( IS-CRATE ?auto_13256 ) ( not ( = ?auto_13265 ?auto_13271 ) ) ( not ( = ?auto_13260 ?auto_13265 ) ) ( HOIST-AT ?auto_13267 ?auto_13265 ) ( not ( = ?auto_13261 ?auto_13267 ) ) ( not ( = ?auto_13269 ?auto_13267 ) ) ( AVAILABLE ?auto_13267 ) ( SURFACE-AT ?auto_13256 ?auto_13265 ) ( ON ?auto_13256 ?auto_13263 ) ( CLEAR ?auto_13256 ) ( not ( = ?auto_13256 ?auto_13263 ) ) ( not ( = ?auto_13257 ?auto_13263 ) ) ( not ( = ?auto_13255 ?auto_13263 ) ) ( not ( = ?auto_13259 ?auto_13263 ) ) ( IS-CRATE ?auto_13255 ) ( not ( = ?auto_13258 ?auto_13255 ) ) ( not ( = ?auto_13256 ?auto_13258 ) ) ( not ( = ?auto_13257 ?auto_13258 ) ) ( not ( = ?auto_13259 ?auto_13258 ) ) ( not ( = ?auto_13263 ?auto_13258 ) ) ( not ( = ?auto_13270 ?auto_13271 ) ) ( not ( = ?auto_13260 ?auto_13270 ) ) ( not ( = ?auto_13265 ?auto_13270 ) ) ( HOIST-AT ?auto_13264 ?auto_13270 ) ( not ( = ?auto_13261 ?auto_13264 ) ) ( not ( = ?auto_13269 ?auto_13264 ) ) ( not ( = ?auto_13267 ?auto_13264 ) ) ( AVAILABLE ?auto_13264 ) ( SURFACE-AT ?auto_13255 ?auto_13270 ) ( ON ?auto_13255 ?auto_13262 ) ( CLEAR ?auto_13255 ) ( not ( = ?auto_13256 ?auto_13262 ) ) ( not ( = ?auto_13257 ?auto_13262 ) ) ( not ( = ?auto_13255 ?auto_13262 ) ) ( not ( = ?auto_13259 ?auto_13262 ) ) ( not ( = ?auto_13263 ?auto_13262 ) ) ( not ( = ?auto_13258 ?auto_13262 ) ) ( TRUCK-AT ?auto_13266 ?auto_13271 ) ( SURFACE-AT ?auto_13268 ?auto_13271 ) ( CLEAR ?auto_13268 ) ( IS-CRATE ?auto_13258 ) ( not ( = ?auto_13268 ?auto_13258 ) ) ( not ( = ?auto_13256 ?auto_13268 ) ) ( not ( = ?auto_13257 ?auto_13268 ) ) ( not ( = ?auto_13255 ?auto_13268 ) ) ( not ( = ?auto_13259 ?auto_13268 ) ) ( not ( = ?auto_13263 ?auto_13268 ) ) ( not ( = ?auto_13262 ?auto_13268 ) ) ( AVAILABLE ?auto_13261 ) ( IN ?auto_13258 ?auto_13266 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13256 ?auto_13257 )
      ( MAKE-2CRATE-VERIFY ?auto_13255 ?auto_13256 ?auto_13257 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13272 - SURFACE
      ?auto_13273 - SURFACE
      ?auto_13274 - SURFACE
      ?auto_13275 - SURFACE
    )
    :vars
    (
      ?auto_13288 - HOIST
      ?auto_13283 - PLACE
      ?auto_13286 - PLACE
      ?auto_13285 - HOIST
      ?auto_13277 - SURFACE
      ?auto_13287 - PLACE
      ?auto_13276 - HOIST
      ?auto_13281 - SURFACE
      ?auto_13284 - PLACE
      ?auto_13278 - HOIST
      ?auto_13280 - SURFACE
      ?auto_13279 - TRUCK
      ?auto_13282 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13288 ?auto_13283 ) ( IS-CRATE ?auto_13275 ) ( not ( = ?auto_13274 ?auto_13275 ) ) ( not ( = ?auto_13273 ?auto_13274 ) ) ( not ( = ?auto_13273 ?auto_13275 ) ) ( not ( = ?auto_13286 ?auto_13283 ) ) ( HOIST-AT ?auto_13285 ?auto_13286 ) ( not ( = ?auto_13288 ?auto_13285 ) ) ( AVAILABLE ?auto_13285 ) ( SURFACE-AT ?auto_13275 ?auto_13286 ) ( ON ?auto_13275 ?auto_13277 ) ( CLEAR ?auto_13275 ) ( not ( = ?auto_13274 ?auto_13277 ) ) ( not ( = ?auto_13275 ?auto_13277 ) ) ( not ( = ?auto_13273 ?auto_13277 ) ) ( IS-CRATE ?auto_13274 ) ( not ( = ?auto_13287 ?auto_13283 ) ) ( not ( = ?auto_13286 ?auto_13287 ) ) ( HOIST-AT ?auto_13276 ?auto_13287 ) ( not ( = ?auto_13288 ?auto_13276 ) ) ( not ( = ?auto_13285 ?auto_13276 ) ) ( AVAILABLE ?auto_13276 ) ( SURFACE-AT ?auto_13274 ?auto_13287 ) ( ON ?auto_13274 ?auto_13281 ) ( CLEAR ?auto_13274 ) ( not ( = ?auto_13274 ?auto_13281 ) ) ( not ( = ?auto_13275 ?auto_13281 ) ) ( not ( = ?auto_13273 ?auto_13281 ) ) ( not ( = ?auto_13277 ?auto_13281 ) ) ( IS-CRATE ?auto_13273 ) ( not ( = ?auto_13272 ?auto_13273 ) ) ( not ( = ?auto_13274 ?auto_13272 ) ) ( not ( = ?auto_13275 ?auto_13272 ) ) ( not ( = ?auto_13277 ?auto_13272 ) ) ( not ( = ?auto_13281 ?auto_13272 ) ) ( not ( = ?auto_13284 ?auto_13283 ) ) ( not ( = ?auto_13286 ?auto_13284 ) ) ( not ( = ?auto_13287 ?auto_13284 ) ) ( HOIST-AT ?auto_13278 ?auto_13284 ) ( not ( = ?auto_13288 ?auto_13278 ) ) ( not ( = ?auto_13285 ?auto_13278 ) ) ( not ( = ?auto_13276 ?auto_13278 ) ) ( AVAILABLE ?auto_13278 ) ( SURFACE-AT ?auto_13273 ?auto_13284 ) ( ON ?auto_13273 ?auto_13280 ) ( CLEAR ?auto_13273 ) ( not ( = ?auto_13274 ?auto_13280 ) ) ( not ( = ?auto_13275 ?auto_13280 ) ) ( not ( = ?auto_13273 ?auto_13280 ) ) ( not ( = ?auto_13277 ?auto_13280 ) ) ( not ( = ?auto_13281 ?auto_13280 ) ) ( not ( = ?auto_13272 ?auto_13280 ) ) ( TRUCK-AT ?auto_13279 ?auto_13283 ) ( SURFACE-AT ?auto_13282 ?auto_13283 ) ( CLEAR ?auto_13282 ) ( IS-CRATE ?auto_13272 ) ( not ( = ?auto_13282 ?auto_13272 ) ) ( not ( = ?auto_13274 ?auto_13282 ) ) ( not ( = ?auto_13275 ?auto_13282 ) ) ( not ( = ?auto_13273 ?auto_13282 ) ) ( not ( = ?auto_13277 ?auto_13282 ) ) ( not ( = ?auto_13281 ?auto_13282 ) ) ( not ( = ?auto_13280 ?auto_13282 ) ) ( AVAILABLE ?auto_13288 ) ( IN ?auto_13272 ?auto_13279 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13273 ?auto_13274 ?auto_13275 )
      ( MAKE-3CRATE-VERIFY ?auto_13272 ?auto_13273 ?auto_13274 ?auto_13275 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13289 - SURFACE
      ?auto_13290 - SURFACE
      ?auto_13291 - SURFACE
      ?auto_13292 - SURFACE
      ?auto_13293 - SURFACE
    )
    :vars
    (
      ?auto_13305 - HOIST
      ?auto_13300 - PLACE
      ?auto_13303 - PLACE
      ?auto_13302 - HOIST
      ?auto_13295 - SURFACE
      ?auto_13304 - PLACE
      ?auto_13294 - HOIST
      ?auto_13299 - SURFACE
      ?auto_13301 - PLACE
      ?auto_13296 - HOIST
      ?auto_13298 - SURFACE
      ?auto_13297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13305 ?auto_13300 ) ( IS-CRATE ?auto_13293 ) ( not ( = ?auto_13292 ?auto_13293 ) ) ( not ( = ?auto_13291 ?auto_13292 ) ) ( not ( = ?auto_13291 ?auto_13293 ) ) ( not ( = ?auto_13303 ?auto_13300 ) ) ( HOIST-AT ?auto_13302 ?auto_13303 ) ( not ( = ?auto_13305 ?auto_13302 ) ) ( AVAILABLE ?auto_13302 ) ( SURFACE-AT ?auto_13293 ?auto_13303 ) ( ON ?auto_13293 ?auto_13295 ) ( CLEAR ?auto_13293 ) ( not ( = ?auto_13292 ?auto_13295 ) ) ( not ( = ?auto_13293 ?auto_13295 ) ) ( not ( = ?auto_13291 ?auto_13295 ) ) ( IS-CRATE ?auto_13292 ) ( not ( = ?auto_13304 ?auto_13300 ) ) ( not ( = ?auto_13303 ?auto_13304 ) ) ( HOIST-AT ?auto_13294 ?auto_13304 ) ( not ( = ?auto_13305 ?auto_13294 ) ) ( not ( = ?auto_13302 ?auto_13294 ) ) ( AVAILABLE ?auto_13294 ) ( SURFACE-AT ?auto_13292 ?auto_13304 ) ( ON ?auto_13292 ?auto_13299 ) ( CLEAR ?auto_13292 ) ( not ( = ?auto_13292 ?auto_13299 ) ) ( not ( = ?auto_13293 ?auto_13299 ) ) ( not ( = ?auto_13291 ?auto_13299 ) ) ( not ( = ?auto_13295 ?auto_13299 ) ) ( IS-CRATE ?auto_13291 ) ( not ( = ?auto_13290 ?auto_13291 ) ) ( not ( = ?auto_13292 ?auto_13290 ) ) ( not ( = ?auto_13293 ?auto_13290 ) ) ( not ( = ?auto_13295 ?auto_13290 ) ) ( not ( = ?auto_13299 ?auto_13290 ) ) ( not ( = ?auto_13301 ?auto_13300 ) ) ( not ( = ?auto_13303 ?auto_13301 ) ) ( not ( = ?auto_13304 ?auto_13301 ) ) ( HOIST-AT ?auto_13296 ?auto_13301 ) ( not ( = ?auto_13305 ?auto_13296 ) ) ( not ( = ?auto_13302 ?auto_13296 ) ) ( not ( = ?auto_13294 ?auto_13296 ) ) ( AVAILABLE ?auto_13296 ) ( SURFACE-AT ?auto_13291 ?auto_13301 ) ( ON ?auto_13291 ?auto_13298 ) ( CLEAR ?auto_13291 ) ( not ( = ?auto_13292 ?auto_13298 ) ) ( not ( = ?auto_13293 ?auto_13298 ) ) ( not ( = ?auto_13291 ?auto_13298 ) ) ( not ( = ?auto_13295 ?auto_13298 ) ) ( not ( = ?auto_13299 ?auto_13298 ) ) ( not ( = ?auto_13290 ?auto_13298 ) ) ( TRUCK-AT ?auto_13297 ?auto_13300 ) ( SURFACE-AT ?auto_13289 ?auto_13300 ) ( CLEAR ?auto_13289 ) ( IS-CRATE ?auto_13290 ) ( not ( = ?auto_13289 ?auto_13290 ) ) ( not ( = ?auto_13292 ?auto_13289 ) ) ( not ( = ?auto_13293 ?auto_13289 ) ) ( not ( = ?auto_13291 ?auto_13289 ) ) ( not ( = ?auto_13295 ?auto_13289 ) ) ( not ( = ?auto_13299 ?auto_13289 ) ) ( not ( = ?auto_13298 ?auto_13289 ) ) ( AVAILABLE ?auto_13305 ) ( IN ?auto_13290 ?auto_13297 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13291 ?auto_13292 ?auto_13293 )
      ( MAKE-4CRATE-VERIFY ?auto_13289 ?auto_13290 ?auto_13291 ?auto_13292 ?auto_13293 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13306 - SURFACE
      ?auto_13307 - SURFACE
    )
    :vars
    (
      ?auto_13321 - HOIST
      ?auto_13316 - PLACE
      ?auto_13322 - SURFACE
      ?auto_13319 - PLACE
      ?auto_13318 - HOIST
      ?auto_13309 - SURFACE
      ?auto_13320 - PLACE
      ?auto_13308 - HOIST
      ?auto_13314 - SURFACE
      ?auto_13310 - SURFACE
      ?auto_13317 - PLACE
      ?auto_13311 - HOIST
      ?auto_13313 - SURFACE
      ?auto_13315 - SURFACE
      ?auto_13312 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13321 ?auto_13316 ) ( IS-CRATE ?auto_13307 ) ( not ( = ?auto_13306 ?auto_13307 ) ) ( not ( = ?auto_13322 ?auto_13306 ) ) ( not ( = ?auto_13322 ?auto_13307 ) ) ( not ( = ?auto_13319 ?auto_13316 ) ) ( HOIST-AT ?auto_13318 ?auto_13319 ) ( not ( = ?auto_13321 ?auto_13318 ) ) ( AVAILABLE ?auto_13318 ) ( SURFACE-AT ?auto_13307 ?auto_13319 ) ( ON ?auto_13307 ?auto_13309 ) ( CLEAR ?auto_13307 ) ( not ( = ?auto_13306 ?auto_13309 ) ) ( not ( = ?auto_13307 ?auto_13309 ) ) ( not ( = ?auto_13322 ?auto_13309 ) ) ( IS-CRATE ?auto_13306 ) ( not ( = ?auto_13320 ?auto_13316 ) ) ( not ( = ?auto_13319 ?auto_13320 ) ) ( HOIST-AT ?auto_13308 ?auto_13320 ) ( not ( = ?auto_13321 ?auto_13308 ) ) ( not ( = ?auto_13318 ?auto_13308 ) ) ( AVAILABLE ?auto_13308 ) ( SURFACE-AT ?auto_13306 ?auto_13320 ) ( ON ?auto_13306 ?auto_13314 ) ( CLEAR ?auto_13306 ) ( not ( = ?auto_13306 ?auto_13314 ) ) ( not ( = ?auto_13307 ?auto_13314 ) ) ( not ( = ?auto_13322 ?auto_13314 ) ) ( not ( = ?auto_13309 ?auto_13314 ) ) ( IS-CRATE ?auto_13322 ) ( not ( = ?auto_13310 ?auto_13322 ) ) ( not ( = ?auto_13306 ?auto_13310 ) ) ( not ( = ?auto_13307 ?auto_13310 ) ) ( not ( = ?auto_13309 ?auto_13310 ) ) ( not ( = ?auto_13314 ?auto_13310 ) ) ( not ( = ?auto_13317 ?auto_13316 ) ) ( not ( = ?auto_13319 ?auto_13317 ) ) ( not ( = ?auto_13320 ?auto_13317 ) ) ( HOIST-AT ?auto_13311 ?auto_13317 ) ( not ( = ?auto_13321 ?auto_13311 ) ) ( not ( = ?auto_13318 ?auto_13311 ) ) ( not ( = ?auto_13308 ?auto_13311 ) ) ( AVAILABLE ?auto_13311 ) ( SURFACE-AT ?auto_13322 ?auto_13317 ) ( ON ?auto_13322 ?auto_13313 ) ( CLEAR ?auto_13322 ) ( not ( = ?auto_13306 ?auto_13313 ) ) ( not ( = ?auto_13307 ?auto_13313 ) ) ( not ( = ?auto_13322 ?auto_13313 ) ) ( not ( = ?auto_13309 ?auto_13313 ) ) ( not ( = ?auto_13314 ?auto_13313 ) ) ( not ( = ?auto_13310 ?auto_13313 ) ) ( SURFACE-AT ?auto_13315 ?auto_13316 ) ( CLEAR ?auto_13315 ) ( IS-CRATE ?auto_13310 ) ( not ( = ?auto_13315 ?auto_13310 ) ) ( not ( = ?auto_13306 ?auto_13315 ) ) ( not ( = ?auto_13307 ?auto_13315 ) ) ( not ( = ?auto_13322 ?auto_13315 ) ) ( not ( = ?auto_13309 ?auto_13315 ) ) ( not ( = ?auto_13314 ?auto_13315 ) ) ( not ( = ?auto_13313 ?auto_13315 ) ) ( AVAILABLE ?auto_13321 ) ( IN ?auto_13310 ?auto_13312 ) ( TRUCK-AT ?auto_13312 ?auto_13319 ) )
    :subtasks
    ( ( !DRIVE ?auto_13312 ?auto_13319 ?auto_13316 )
      ( MAKE-2CRATE ?auto_13322 ?auto_13306 ?auto_13307 )
      ( MAKE-1CRATE-VERIFY ?auto_13306 ?auto_13307 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13323 - SURFACE
      ?auto_13324 - SURFACE
      ?auto_13325 - SURFACE
    )
    :vars
    (
      ?auto_13334 - HOIST
      ?auto_13328 - PLACE
      ?auto_13327 - PLACE
      ?auto_13338 - HOIST
      ?auto_13335 - SURFACE
      ?auto_13333 - PLACE
      ?auto_13339 - HOIST
      ?auto_13337 - SURFACE
      ?auto_13331 - SURFACE
      ?auto_13326 - PLACE
      ?auto_13336 - HOIST
      ?auto_13330 - SURFACE
      ?auto_13332 - SURFACE
      ?auto_13329 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13334 ?auto_13328 ) ( IS-CRATE ?auto_13325 ) ( not ( = ?auto_13324 ?auto_13325 ) ) ( not ( = ?auto_13323 ?auto_13324 ) ) ( not ( = ?auto_13323 ?auto_13325 ) ) ( not ( = ?auto_13327 ?auto_13328 ) ) ( HOIST-AT ?auto_13338 ?auto_13327 ) ( not ( = ?auto_13334 ?auto_13338 ) ) ( AVAILABLE ?auto_13338 ) ( SURFACE-AT ?auto_13325 ?auto_13327 ) ( ON ?auto_13325 ?auto_13335 ) ( CLEAR ?auto_13325 ) ( not ( = ?auto_13324 ?auto_13335 ) ) ( not ( = ?auto_13325 ?auto_13335 ) ) ( not ( = ?auto_13323 ?auto_13335 ) ) ( IS-CRATE ?auto_13324 ) ( not ( = ?auto_13333 ?auto_13328 ) ) ( not ( = ?auto_13327 ?auto_13333 ) ) ( HOIST-AT ?auto_13339 ?auto_13333 ) ( not ( = ?auto_13334 ?auto_13339 ) ) ( not ( = ?auto_13338 ?auto_13339 ) ) ( AVAILABLE ?auto_13339 ) ( SURFACE-AT ?auto_13324 ?auto_13333 ) ( ON ?auto_13324 ?auto_13337 ) ( CLEAR ?auto_13324 ) ( not ( = ?auto_13324 ?auto_13337 ) ) ( not ( = ?auto_13325 ?auto_13337 ) ) ( not ( = ?auto_13323 ?auto_13337 ) ) ( not ( = ?auto_13335 ?auto_13337 ) ) ( IS-CRATE ?auto_13323 ) ( not ( = ?auto_13331 ?auto_13323 ) ) ( not ( = ?auto_13324 ?auto_13331 ) ) ( not ( = ?auto_13325 ?auto_13331 ) ) ( not ( = ?auto_13335 ?auto_13331 ) ) ( not ( = ?auto_13337 ?auto_13331 ) ) ( not ( = ?auto_13326 ?auto_13328 ) ) ( not ( = ?auto_13327 ?auto_13326 ) ) ( not ( = ?auto_13333 ?auto_13326 ) ) ( HOIST-AT ?auto_13336 ?auto_13326 ) ( not ( = ?auto_13334 ?auto_13336 ) ) ( not ( = ?auto_13338 ?auto_13336 ) ) ( not ( = ?auto_13339 ?auto_13336 ) ) ( AVAILABLE ?auto_13336 ) ( SURFACE-AT ?auto_13323 ?auto_13326 ) ( ON ?auto_13323 ?auto_13330 ) ( CLEAR ?auto_13323 ) ( not ( = ?auto_13324 ?auto_13330 ) ) ( not ( = ?auto_13325 ?auto_13330 ) ) ( not ( = ?auto_13323 ?auto_13330 ) ) ( not ( = ?auto_13335 ?auto_13330 ) ) ( not ( = ?auto_13337 ?auto_13330 ) ) ( not ( = ?auto_13331 ?auto_13330 ) ) ( SURFACE-AT ?auto_13332 ?auto_13328 ) ( CLEAR ?auto_13332 ) ( IS-CRATE ?auto_13331 ) ( not ( = ?auto_13332 ?auto_13331 ) ) ( not ( = ?auto_13324 ?auto_13332 ) ) ( not ( = ?auto_13325 ?auto_13332 ) ) ( not ( = ?auto_13323 ?auto_13332 ) ) ( not ( = ?auto_13335 ?auto_13332 ) ) ( not ( = ?auto_13337 ?auto_13332 ) ) ( not ( = ?auto_13330 ?auto_13332 ) ) ( AVAILABLE ?auto_13334 ) ( IN ?auto_13331 ?auto_13329 ) ( TRUCK-AT ?auto_13329 ?auto_13327 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13324 ?auto_13325 )
      ( MAKE-2CRATE-VERIFY ?auto_13323 ?auto_13324 ?auto_13325 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13340 - SURFACE
      ?auto_13341 - SURFACE
      ?auto_13342 - SURFACE
      ?auto_13343 - SURFACE
    )
    :vars
    (
      ?auto_13346 - HOIST
      ?auto_13347 - PLACE
      ?auto_13344 - PLACE
      ?auto_13352 - HOIST
      ?auto_13349 - SURFACE
      ?auto_13354 - PLACE
      ?auto_13353 - HOIST
      ?auto_13345 - SURFACE
      ?auto_13355 - PLACE
      ?auto_13351 - HOIST
      ?auto_13348 - SURFACE
      ?auto_13350 - SURFACE
      ?auto_13356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13346 ?auto_13347 ) ( IS-CRATE ?auto_13343 ) ( not ( = ?auto_13342 ?auto_13343 ) ) ( not ( = ?auto_13341 ?auto_13342 ) ) ( not ( = ?auto_13341 ?auto_13343 ) ) ( not ( = ?auto_13344 ?auto_13347 ) ) ( HOIST-AT ?auto_13352 ?auto_13344 ) ( not ( = ?auto_13346 ?auto_13352 ) ) ( AVAILABLE ?auto_13352 ) ( SURFACE-AT ?auto_13343 ?auto_13344 ) ( ON ?auto_13343 ?auto_13349 ) ( CLEAR ?auto_13343 ) ( not ( = ?auto_13342 ?auto_13349 ) ) ( not ( = ?auto_13343 ?auto_13349 ) ) ( not ( = ?auto_13341 ?auto_13349 ) ) ( IS-CRATE ?auto_13342 ) ( not ( = ?auto_13354 ?auto_13347 ) ) ( not ( = ?auto_13344 ?auto_13354 ) ) ( HOIST-AT ?auto_13353 ?auto_13354 ) ( not ( = ?auto_13346 ?auto_13353 ) ) ( not ( = ?auto_13352 ?auto_13353 ) ) ( AVAILABLE ?auto_13353 ) ( SURFACE-AT ?auto_13342 ?auto_13354 ) ( ON ?auto_13342 ?auto_13345 ) ( CLEAR ?auto_13342 ) ( not ( = ?auto_13342 ?auto_13345 ) ) ( not ( = ?auto_13343 ?auto_13345 ) ) ( not ( = ?auto_13341 ?auto_13345 ) ) ( not ( = ?auto_13349 ?auto_13345 ) ) ( IS-CRATE ?auto_13341 ) ( not ( = ?auto_13340 ?auto_13341 ) ) ( not ( = ?auto_13342 ?auto_13340 ) ) ( not ( = ?auto_13343 ?auto_13340 ) ) ( not ( = ?auto_13349 ?auto_13340 ) ) ( not ( = ?auto_13345 ?auto_13340 ) ) ( not ( = ?auto_13355 ?auto_13347 ) ) ( not ( = ?auto_13344 ?auto_13355 ) ) ( not ( = ?auto_13354 ?auto_13355 ) ) ( HOIST-AT ?auto_13351 ?auto_13355 ) ( not ( = ?auto_13346 ?auto_13351 ) ) ( not ( = ?auto_13352 ?auto_13351 ) ) ( not ( = ?auto_13353 ?auto_13351 ) ) ( AVAILABLE ?auto_13351 ) ( SURFACE-AT ?auto_13341 ?auto_13355 ) ( ON ?auto_13341 ?auto_13348 ) ( CLEAR ?auto_13341 ) ( not ( = ?auto_13342 ?auto_13348 ) ) ( not ( = ?auto_13343 ?auto_13348 ) ) ( not ( = ?auto_13341 ?auto_13348 ) ) ( not ( = ?auto_13349 ?auto_13348 ) ) ( not ( = ?auto_13345 ?auto_13348 ) ) ( not ( = ?auto_13340 ?auto_13348 ) ) ( SURFACE-AT ?auto_13350 ?auto_13347 ) ( CLEAR ?auto_13350 ) ( IS-CRATE ?auto_13340 ) ( not ( = ?auto_13350 ?auto_13340 ) ) ( not ( = ?auto_13342 ?auto_13350 ) ) ( not ( = ?auto_13343 ?auto_13350 ) ) ( not ( = ?auto_13341 ?auto_13350 ) ) ( not ( = ?auto_13349 ?auto_13350 ) ) ( not ( = ?auto_13345 ?auto_13350 ) ) ( not ( = ?auto_13348 ?auto_13350 ) ) ( AVAILABLE ?auto_13346 ) ( IN ?auto_13340 ?auto_13356 ) ( TRUCK-AT ?auto_13356 ?auto_13344 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13341 ?auto_13342 ?auto_13343 )
      ( MAKE-3CRATE-VERIFY ?auto_13340 ?auto_13341 ?auto_13342 ?auto_13343 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13357 - SURFACE
      ?auto_13358 - SURFACE
      ?auto_13359 - SURFACE
      ?auto_13360 - SURFACE
      ?auto_13361 - SURFACE
    )
    :vars
    (
      ?auto_13364 - HOIST
      ?auto_13365 - PLACE
      ?auto_13362 - PLACE
      ?auto_13369 - HOIST
      ?auto_13367 - SURFACE
      ?auto_13371 - PLACE
      ?auto_13370 - HOIST
      ?auto_13363 - SURFACE
      ?auto_13372 - PLACE
      ?auto_13368 - HOIST
      ?auto_13366 - SURFACE
      ?auto_13373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13364 ?auto_13365 ) ( IS-CRATE ?auto_13361 ) ( not ( = ?auto_13360 ?auto_13361 ) ) ( not ( = ?auto_13359 ?auto_13360 ) ) ( not ( = ?auto_13359 ?auto_13361 ) ) ( not ( = ?auto_13362 ?auto_13365 ) ) ( HOIST-AT ?auto_13369 ?auto_13362 ) ( not ( = ?auto_13364 ?auto_13369 ) ) ( AVAILABLE ?auto_13369 ) ( SURFACE-AT ?auto_13361 ?auto_13362 ) ( ON ?auto_13361 ?auto_13367 ) ( CLEAR ?auto_13361 ) ( not ( = ?auto_13360 ?auto_13367 ) ) ( not ( = ?auto_13361 ?auto_13367 ) ) ( not ( = ?auto_13359 ?auto_13367 ) ) ( IS-CRATE ?auto_13360 ) ( not ( = ?auto_13371 ?auto_13365 ) ) ( not ( = ?auto_13362 ?auto_13371 ) ) ( HOIST-AT ?auto_13370 ?auto_13371 ) ( not ( = ?auto_13364 ?auto_13370 ) ) ( not ( = ?auto_13369 ?auto_13370 ) ) ( AVAILABLE ?auto_13370 ) ( SURFACE-AT ?auto_13360 ?auto_13371 ) ( ON ?auto_13360 ?auto_13363 ) ( CLEAR ?auto_13360 ) ( not ( = ?auto_13360 ?auto_13363 ) ) ( not ( = ?auto_13361 ?auto_13363 ) ) ( not ( = ?auto_13359 ?auto_13363 ) ) ( not ( = ?auto_13367 ?auto_13363 ) ) ( IS-CRATE ?auto_13359 ) ( not ( = ?auto_13358 ?auto_13359 ) ) ( not ( = ?auto_13360 ?auto_13358 ) ) ( not ( = ?auto_13361 ?auto_13358 ) ) ( not ( = ?auto_13367 ?auto_13358 ) ) ( not ( = ?auto_13363 ?auto_13358 ) ) ( not ( = ?auto_13372 ?auto_13365 ) ) ( not ( = ?auto_13362 ?auto_13372 ) ) ( not ( = ?auto_13371 ?auto_13372 ) ) ( HOIST-AT ?auto_13368 ?auto_13372 ) ( not ( = ?auto_13364 ?auto_13368 ) ) ( not ( = ?auto_13369 ?auto_13368 ) ) ( not ( = ?auto_13370 ?auto_13368 ) ) ( AVAILABLE ?auto_13368 ) ( SURFACE-AT ?auto_13359 ?auto_13372 ) ( ON ?auto_13359 ?auto_13366 ) ( CLEAR ?auto_13359 ) ( not ( = ?auto_13360 ?auto_13366 ) ) ( not ( = ?auto_13361 ?auto_13366 ) ) ( not ( = ?auto_13359 ?auto_13366 ) ) ( not ( = ?auto_13367 ?auto_13366 ) ) ( not ( = ?auto_13363 ?auto_13366 ) ) ( not ( = ?auto_13358 ?auto_13366 ) ) ( SURFACE-AT ?auto_13357 ?auto_13365 ) ( CLEAR ?auto_13357 ) ( IS-CRATE ?auto_13358 ) ( not ( = ?auto_13357 ?auto_13358 ) ) ( not ( = ?auto_13360 ?auto_13357 ) ) ( not ( = ?auto_13361 ?auto_13357 ) ) ( not ( = ?auto_13359 ?auto_13357 ) ) ( not ( = ?auto_13367 ?auto_13357 ) ) ( not ( = ?auto_13363 ?auto_13357 ) ) ( not ( = ?auto_13366 ?auto_13357 ) ) ( AVAILABLE ?auto_13364 ) ( IN ?auto_13358 ?auto_13373 ) ( TRUCK-AT ?auto_13373 ?auto_13362 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13359 ?auto_13360 ?auto_13361 )
      ( MAKE-4CRATE-VERIFY ?auto_13357 ?auto_13358 ?auto_13359 ?auto_13360 ?auto_13361 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13374 - SURFACE
      ?auto_13375 - SURFACE
    )
    :vars
    (
      ?auto_13378 - HOIST
      ?auto_13380 - PLACE
      ?auto_13382 - SURFACE
      ?auto_13376 - PLACE
      ?auto_13386 - HOIST
      ?auto_13383 - SURFACE
      ?auto_13388 - PLACE
      ?auto_13387 - HOIST
      ?auto_13377 - SURFACE
      ?auto_13379 - SURFACE
      ?auto_13389 - PLACE
      ?auto_13385 - HOIST
      ?auto_13381 - SURFACE
      ?auto_13384 - SURFACE
      ?auto_13390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13378 ?auto_13380 ) ( IS-CRATE ?auto_13375 ) ( not ( = ?auto_13374 ?auto_13375 ) ) ( not ( = ?auto_13382 ?auto_13374 ) ) ( not ( = ?auto_13382 ?auto_13375 ) ) ( not ( = ?auto_13376 ?auto_13380 ) ) ( HOIST-AT ?auto_13386 ?auto_13376 ) ( not ( = ?auto_13378 ?auto_13386 ) ) ( SURFACE-AT ?auto_13375 ?auto_13376 ) ( ON ?auto_13375 ?auto_13383 ) ( CLEAR ?auto_13375 ) ( not ( = ?auto_13374 ?auto_13383 ) ) ( not ( = ?auto_13375 ?auto_13383 ) ) ( not ( = ?auto_13382 ?auto_13383 ) ) ( IS-CRATE ?auto_13374 ) ( not ( = ?auto_13388 ?auto_13380 ) ) ( not ( = ?auto_13376 ?auto_13388 ) ) ( HOIST-AT ?auto_13387 ?auto_13388 ) ( not ( = ?auto_13378 ?auto_13387 ) ) ( not ( = ?auto_13386 ?auto_13387 ) ) ( AVAILABLE ?auto_13387 ) ( SURFACE-AT ?auto_13374 ?auto_13388 ) ( ON ?auto_13374 ?auto_13377 ) ( CLEAR ?auto_13374 ) ( not ( = ?auto_13374 ?auto_13377 ) ) ( not ( = ?auto_13375 ?auto_13377 ) ) ( not ( = ?auto_13382 ?auto_13377 ) ) ( not ( = ?auto_13383 ?auto_13377 ) ) ( IS-CRATE ?auto_13382 ) ( not ( = ?auto_13379 ?auto_13382 ) ) ( not ( = ?auto_13374 ?auto_13379 ) ) ( not ( = ?auto_13375 ?auto_13379 ) ) ( not ( = ?auto_13383 ?auto_13379 ) ) ( not ( = ?auto_13377 ?auto_13379 ) ) ( not ( = ?auto_13389 ?auto_13380 ) ) ( not ( = ?auto_13376 ?auto_13389 ) ) ( not ( = ?auto_13388 ?auto_13389 ) ) ( HOIST-AT ?auto_13385 ?auto_13389 ) ( not ( = ?auto_13378 ?auto_13385 ) ) ( not ( = ?auto_13386 ?auto_13385 ) ) ( not ( = ?auto_13387 ?auto_13385 ) ) ( AVAILABLE ?auto_13385 ) ( SURFACE-AT ?auto_13382 ?auto_13389 ) ( ON ?auto_13382 ?auto_13381 ) ( CLEAR ?auto_13382 ) ( not ( = ?auto_13374 ?auto_13381 ) ) ( not ( = ?auto_13375 ?auto_13381 ) ) ( not ( = ?auto_13382 ?auto_13381 ) ) ( not ( = ?auto_13383 ?auto_13381 ) ) ( not ( = ?auto_13377 ?auto_13381 ) ) ( not ( = ?auto_13379 ?auto_13381 ) ) ( SURFACE-AT ?auto_13384 ?auto_13380 ) ( CLEAR ?auto_13384 ) ( IS-CRATE ?auto_13379 ) ( not ( = ?auto_13384 ?auto_13379 ) ) ( not ( = ?auto_13374 ?auto_13384 ) ) ( not ( = ?auto_13375 ?auto_13384 ) ) ( not ( = ?auto_13382 ?auto_13384 ) ) ( not ( = ?auto_13383 ?auto_13384 ) ) ( not ( = ?auto_13377 ?auto_13384 ) ) ( not ( = ?auto_13381 ?auto_13384 ) ) ( AVAILABLE ?auto_13378 ) ( TRUCK-AT ?auto_13390 ?auto_13376 ) ( LIFTING ?auto_13386 ?auto_13379 ) )
    :subtasks
    ( ( !LOAD ?auto_13386 ?auto_13379 ?auto_13390 ?auto_13376 )
      ( MAKE-2CRATE ?auto_13382 ?auto_13374 ?auto_13375 )
      ( MAKE-1CRATE-VERIFY ?auto_13374 ?auto_13375 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13391 - SURFACE
      ?auto_13392 - SURFACE
      ?auto_13393 - SURFACE
    )
    :vars
    (
      ?auto_13405 - HOIST
      ?auto_13395 - PLACE
      ?auto_13397 - PLACE
      ?auto_13402 - HOIST
      ?auto_13394 - SURFACE
      ?auto_13396 - PLACE
      ?auto_13399 - HOIST
      ?auto_13407 - SURFACE
      ?auto_13406 - SURFACE
      ?auto_13400 - PLACE
      ?auto_13398 - HOIST
      ?auto_13404 - SURFACE
      ?auto_13403 - SURFACE
      ?auto_13401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13405 ?auto_13395 ) ( IS-CRATE ?auto_13393 ) ( not ( = ?auto_13392 ?auto_13393 ) ) ( not ( = ?auto_13391 ?auto_13392 ) ) ( not ( = ?auto_13391 ?auto_13393 ) ) ( not ( = ?auto_13397 ?auto_13395 ) ) ( HOIST-AT ?auto_13402 ?auto_13397 ) ( not ( = ?auto_13405 ?auto_13402 ) ) ( SURFACE-AT ?auto_13393 ?auto_13397 ) ( ON ?auto_13393 ?auto_13394 ) ( CLEAR ?auto_13393 ) ( not ( = ?auto_13392 ?auto_13394 ) ) ( not ( = ?auto_13393 ?auto_13394 ) ) ( not ( = ?auto_13391 ?auto_13394 ) ) ( IS-CRATE ?auto_13392 ) ( not ( = ?auto_13396 ?auto_13395 ) ) ( not ( = ?auto_13397 ?auto_13396 ) ) ( HOIST-AT ?auto_13399 ?auto_13396 ) ( not ( = ?auto_13405 ?auto_13399 ) ) ( not ( = ?auto_13402 ?auto_13399 ) ) ( AVAILABLE ?auto_13399 ) ( SURFACE-AT ?auto_13392 ?auto_13396 ) ( ON ?auto_13392 ?auto_13407 ) ( CLEAR ?auto_13392 ) ( not ( = ?auto_13392 ?auto_13407 ) ) ( not ( = ?auto_13393 ?auto_13407 ) ) ( not ( = ?auto_13391 ?auto_13407 ) ) ( not ( = ?auto_13394 ?auto_13407 ) ) ( IS-CRATE ?auto_13391 ) ( not ( = ?auto_13406 ?auto_13391 ) ) ( not ( = ?auto_13392 ?auto_13406 ) ) ( not ( = ?auto_13393 ?auto_13406 ) ) ( not ( = ?auto_13394 ?auto_13406 ) ) ( not ( = ?auto_13407 ?auto_13406 ) ) ( not ( = ?auto_13400 ?auto_13395 ) ) ( not ( = ?auto_13397 ?auto_13400 ) ) ( not ( = ?auto_13396 ?auto_13400 ) ) ( HOIST-AT ?auto_13398 ?auto_13400 ) ( not ( = ?auto_13405 ?auto_13398 ) ) ( not ( = ?auto_13402 ?auto_13398 ) ) ( not ( = ?auto_13399 ?auto_13398 ) ) ( AVAILABLE ?auto_13398 ) ( SURFACE-AT ?auto_13391 ?auto_13400 ) ( ON ?auto_13391 ?auto_13404 ) ( CLEAR ?auto_13391 ) ( not ( = ?auto_13392 ?auto_13404 ) ) ( not ( = ?auto_13393 ?auto_13404 ) ) ( not ( = ?auto_13391 ?auto_13404 ) ) ( not ( = ?auto_13394 ?auto_13404 ) ) ( not ( = ?auto_13407 ?auto_13404 ) ) ( not ( = ?auto_13406 ?auto_13404 ) ) ( SURFACE-AT ?auto_13403 ?auto_13395 ) ( CLEAR ?auto_13403 ) ( IS-CRATE ?auto_13406 ) ( not ( = ?auto_13403 ?auto_13406 ) ) ( not ( = ?auto_13392 ?auto_13403 ) ) ( not ( = ?auto_13393 ?auto_13403 ) ) ( not ( = ?auto_13391 ?auto_13403 ) ) ( not ( = ?auto_13394 ?auto_13403 ) ) ( not ( = ?auto_13407 ?auto_13403 ) ) ( not ( = ?auto_13404 ?auto_13403 ) ) ( AVAILABLE ?auto_13405 ) ( TRUCK-AT ?auto_13401 ?auto_13397 ) ( LIFTING ?auto_13402 ?auto_13406 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13392 ?auto_13393 )
      ( MAKE-2CRATE-VERIFY ?auto_13391 ?auto_13392 ?auto_13393 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13408 - SURFACE
      ?auto_13409 - SURFACE
      ?auto_13410 - SURFACE
      ?auto_13411 - SURFACE
    )
    :vars
    (
      ?auto_13413 - HOIST
      ?auto_13415 - PLACE
      ?auto_13416 - PLACE
      ?auto_13417 - HOIST
      ?auto_13412 - SURFACE
      ?auto_13423 - PLACE
      ?auto_13414 - HOIST
      ?auto_13422 - SURFACE
      ?auto_13418 - PLACE
      ?auto_13419 - HOIST
      ?auto_13421 - SURFACE
      ?auto_13420 - SURFACE
      ?auto_13424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13413 ?auto_13415 ) ( IS-CRATE ?auto_13411 ) ( not ( = ?auto_13410 ?auto_13411 ) ) ( not ( = ?auto_13409 ?auto_13410 ) ) ( not ( = ?auto_13409 ?auto_13411 ) ) ( not ( = ?auto_13416 ?auto_13415 ) ) ( HOIST-AT ?auto_13417 ?auto_13416 ) ( not ( = ?auto_13413 ?auto_13417 ) ) ( SURFACE-AT ?auto_13411 ?auto_13416 ) ( ON ?auto_13411 ?auto_13412 ) ( CLEAR ?auto_13411 ) ( not ( = ?auto_13410 ?auto_13412 ) ) ( not ( = ?auto_13411 ?auto_13412 ) ) ( not ( = ?auto_13409 ?auto_13412 ) ) ( IS-CRATE ?auto_13410 ) ( not ( = ?auto_13423 ?auto_13415 ) ) ( not ( = ?auto_13416 ?auto_13423 ) ) ( HOIST-AT ?auto_13414 ?auto_13423 ) ( not ( = ?auto_13413 ?auto_13414 ) ) ( not ( = ?auto_13417 ?auto_13414 ) ) ( AVAILABLE ?auto_13414 ) ( SURFACE-AT ?auto_13410 ?auto_13423 ) ( ON ?auto_13410 ?auto_13422 ) ( CLEAR ?auto_13410 ) ( not ( = ?auto_13410 ?auto_13422 ) ) ( not ( = ?auto_13411 ?auto_13422 ) ) ( not ( = ?auto_13409 ?auto_13422 ) ) ( not ( = ?auto_13412 ?auto_13422 ) ) ( IS-CRATE ?auto_13409 ) ( not ( = ?auto_13408 ?auto_13409 ) ) ( not ( = ?auto_13410 ?auto_13408 ) ) ( not ( = ?auto_13411 ?auto_13408 ) ) ( not ( = ?auto_13412 ?auto_13408 ) ) ( not ( = ?auto_13422 ?auto_13408 ) ) ( not ( = ?auto_13418 ?auto_13415 ) ) ( not ( = ?auto_13416 ?auto_13418 ) ) ( not ( = ?auto_13423 ?auto_13418 ) ) ( HOIST-AT ?auto_13419 ?auto_13418 ) ( not ( = ?auto_13413 ?auto_13419 ) ) ( not ( = ?auto_13417 ?auto_13419 ) ) ( not ( = ?auto_13414 ?auto_13419 ) ) ( AVAILABLE ?auto_13419 ) ( SURFACE-AT ?auto_13409 ?auto_13418 ) ( ON ?auto_13409 ?auto_13421 ) ( CLEAR ?auto_13409 ) ( not ( = ?auto_13410 ?auto_13421 ) ) ( not ( = ?auto_13411 ?auto_13421 ) ) ( not ( = ?auto_13409 ?auto_13421 ) ) ( not ( = ?auto_13412 ?auto_13421 ) ) ( not ( = ?auto_13422 ?auto_13421 ) ) ( not ( = ?auto_13408 ?auto_13421 ) ) ( SURFACE-AT ?auto_13420 ?auto_13415 ) ( CLEAR ?auto_13420 ) ( IS-CRATE ?auto_13408 ) ( not ( = ?auto_13420 ?auto_13408 ) ) ( not ( = ?auto_13410 ?auto_13420 ) ) ( not ( = ?auto_13411 ?auto_13420 ) ) ( not ( = ?auto_13409 ?auto_13420 ) ) ( not ( = ?auto_13412 ?auto_13420 ) ) ( not ( = ?auto_13422 ?auto_13420 ) ) ( not ( = ?auto_13421 ?auto_13420 ) ) ( AVAILABLE ?auto_13413 ) ( TRUCK-AT ?auto_13424 ?auto_13416 ) ( LIFTING ?auto_13417 ?auto_13408 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13409 ?auto_13410 ?auto_13411 )
      ( MAKE-3CRATE-VERIFY ?auto_13408 ?auto_13409 ?auto_13410 ?auto_13411 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13425 - SURFACE
      ?auto_13426 - SURFACE
      ?auto_13427 - SURFACE
      ?auto_13428 - SURFACE
      ?auto_13429 - SURFACE
    )
    :vars
    (
      ?auto_13431 - HOIST
      ?auto_13433 - PLACE
      ?auto_13434 - PLACE
      ?auto_13435 - HOIST
      ?auto_13430 - SURFACE
      ?auto_13440 - PLACE
      ?auto_13432 - HOIST
      ?auto_13439 - SURFACE
      ?auto_13436 - PLACE
      ?auto_13437 - HOIST
      ?auto_13438 - SURFACE
      ?auto_13441 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13431 ?auto_13433 ) ( IS-CRATE ?auto_13429 ) ( not ( = ?auto_13428 ?auto_13429 ) ) ( not ( = ?auto_13427 ?auto_13428 ) ) ( not ( = ?auto_13427 ?auto_13429 ) ) ( not ( = ?auto_13434 ?auto_13433 ) ) ( HOIST-AT ?auto_13435 ?auto_13434 ) ( not ( = ?auto_13431 ?auto_13435 ) ) ( SURFACE-AT ?auto_13429 ?auto_13434 ) ( ON ?auto_13429 ?auto_13430 ) ( CLEAR ?auto_13429 ) ( not ( = ?auto_13428 ?auto_13430 ) ) ( not ( = ?auto_13429 ?auto_13430 ) ) ( not ( = ?auto_13427 ?auto_13430 ) ) ( IS-CRATE ?auto_13428 ) ( not ( = ?auto_13440 ?auto_13433 ) ) ( not ( = ?auto_13434 ?auto_13440 ) ) ( HOIST-AT ?auto_13432 ?auto_13440 ) ( not ( = ?auto_13431 ?auto_13432 ) ) ( not ( = ?auto_13435 ?auto_13432 ) ) ( AVAILABLE ?auto_13432 ) ( SURFACE-AT ?auto_13428 ?auto_13440 ) ( ON ?auto_13428 ?auto_13439 ) ( CLEAR ?auto_13428 ) ( not ( = ?auto_13428 ?auto_13439 ) ) ( not ( = ?auto_13429 ?auto_13439 ) ) ( not ( = ?auto_13427 ?auto_13439 ) ) ( not ( = ?auto_13430 ?auto_13439 ) ) ( IS-CRATE ?auto_13427 ) ( not ( = ?auto_13426 ?auto_13427 ) ) ( not ( = ?auto_13428 ?auto_13426 ) ) ( not ( = ?auto_13429 ?auto_13426 ) ) ( not ( = ?auto_13430 ?auto_13426 ) ) ( not ( = ?auto_13439 ?auto_13426 ) ) ( not ( = ?auto_13436 ?auto_13433 ) ) ( not ( = ?auto_13434 ?auto_13436 ) ) ( not ( = ?auto_13440 ?auto_13436 ) ) ( HOIST-AT ?auto_13437 ?auto_13436 ) ( not ( = ?auto_13431 ?auto_13437 ) ) ( not ( = ?auto_13435 ?auto_13437 ) ) ( not ( = ?auto_13432 ?auto_13437 ) ) ( AVAILABLE ?auto_13437 ) ( SURFACE-AT ?auto_13427 ?auto_13436 ) ( ON ?auto_13427 ?auto_13438 ) ( CLEAR ?auto_13427 ) ( not ( = ?auto_13428 ?auto_13438 ) ) ( not ( = ?auto_13429 ?auto_13438 ) ) ( not ( = ?auto_13427 ?auto_13438 ) ) ( not ( = ?auto_13430 ?auto_13438 ) ) ( not ( = ?auto_13439 ?auto_13438 ) ) ( not ( = ?auto_13426 ?auto_13438 ) ) ( SURFACE-AT ?auto_13425 ?auto_13433 ) ( CLEAR ?auto_13425 ) ( IS-CRATE ?auto_13426 ) ( not ( = ?auto_13425 ?auto_13426 ) ) ( not ( = ?auto_13428 ?auto_13425 ) ) ( not ( = ?auto_13429 ?auto_13425 ) ) ( not ( = ?auto_13427 ?auto_13425 ) ) ( not ( = ?auto_13430 ?auto_13425 ) ) ( not ( = ?auto_13439 ?auto_13425 ) ) ( not ( = ?auto_13438 ?auto_13425 ) ) ( AVAILABLE ?auto_13431 ) ( TRUCK-AT ?auto_13441 ?auto_13434 ) ( LIFTING ?auto_13435 ?auto_13426 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13427 ?auto_13428 ?auto_13429 )
      ( MAKE-4CRATE-VERIFY ?auto_13425 ?auto_13426 ?auto_13427 ?auto_13428 ?auto_13429 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13442 - SURFACE
      ?auto_13443 - SURFACE
    )
    :vars
    (
      ?auto_13445 - HOIST
      ?auto_13447 - PLACE
      ?auto_13458 - SURFACE
      ?auto_13448 - PLACE
      ?auto_13449 - HOIST
      ?auto_13444 - SURFACE
      ?auto_13456 - PLACE
      ?auto_13446 - HOIST
      ?auto_13455 - SURFACE
      ?auto_13450 - SURFACE
      ?auto_13451 - PLACE
      ?auto_13452 - HOIST
      ?auto_13454 - SURFACE
      ?auto_13453 - SURFACE
      ?auto_13457 - TRUCK
      ?auto_13459 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13445 ?auto_13447 ) ( IS-CRATE ?auto_13443 ) ( not ( = ?auto_13442 ?auto_13443 ) ) ( not ( = ?auto_13458 ?auto_13442 ) ) ( not ( = ?auto_13458 ?auto_13443 ) ) ( not ( = ?auto_13448 ?auto_13447 ) ) ( HOIST-AT ?auto_13449 ?auto_13448 ) ( not ( = ?auto_13445 ?auto_13449 ) ) ( SURFACE-AT ?auto_13443 ?auto_13448 ) ( ON ?auto_13443 ?auto_13444 ) ( CLEAR ?auto_13443 ) ( not ( = ?auto_13442 ?auto_13444 ) ) ( not ( = ?auto_13443 ?auto_13444 ) ) ( not ( = ?auto_13458 ?auto_13444 ) ) ( IS-CRATE ?auto_13442 ) ( not ( = ?auto_13456 ?auto_13447 ) ) ( not ( = ?auto_13448 ?auto_13456 ) ) ( HOIST-AT ?auto_13446 ?auto_13456 ) ( not ( = ?auto_13445 ?auto_13446 ) ) ( not ( = ?auto_13449 ?auto_13446 ) ) ( AVAILABLE ?auto_13446 ) ( SURFACE-AT ?auto_13442 ?auto_13456 ) ( ON ?auto_13442 ?auto_13455 ) ( CLEAR ?auto_13442 ) ( not ( = ?auto_13442 ?auto_13455 ) ) ( not ( = ?auto_13443 ?auto_13455 ) ) ( not ( = ?auto_13458 ?auto_13455 ) ) ( not ( = ?auto_13444 ?auto_13455 ) ) ( IS-CRATE ?auto_13458 ) ( not ( = ?auto_13450 ?auto_13458 ) ) ( not ( = ?auto_13442 ?auto_13450 ) ) ( not ( = ?auto_13443 ?auto_13450 ) ) ( not ( = ?auto_13444 ?auto_13450 ) ) ( not ( = ?auto_13455 ?auto_13450 ) ) ( not ( = ?auto_13451 ?auto_13447 ) ) ( not ( = ?auto_13448 ?auto_13451 ) ) ( not ( = ?auto_13456 ?auto_13451 ) ) ( HOIST-AT ?auto_13452 ?auto_13451 ) ( not ( = ?auto_13445 ?auto_13452 ) ) ( not ( = ?auto_13449 ?auto_13452 ) ) ( not ( = ?auto_13446 ?auto_13452 ) ) ( AVAILABLE ?auto_13452 ) ( SURFACE-AT ?auto_13458 ?auto_13451 ) ( ON ?auto_13458 ?auto_13454 ) ( CLEAR ?auto_13458 ) ( not ( = ?auto_13442 ?auto_13454 ) ) ( not ( = ?auto_13443 ?auto_13454 ) ) ( not ( = ?auto_13458 ?auto_13454 ) ) ( not ( = ?auto_13444 ?auto_13454 ) ) ( not ( = ?auto_13455 ?auto_13454 ) ) ( not ( = ?auto_13450 ?auto_13454 ) ) ( SURFACE-AT ?auto_13453 ?auto_13447 ) ( CLEAR ?auto_13453 ) ( IS-CRATE ?auto_13450 ) ( not ( = ?auto_13453 ?auto_13450 ) ) ( not ( = ?auto_13442 ?auto_13453 ) ) ( not ( = ?auto_13443 ?auto_13453 ) ) ( not ( = ?auto_13458 ?auto_13453 ) ) ( not ( = ?auto_13444 ?auto_13453 ) ) ( not ( = ?auto_13455 ?auto_13453 ) ) ( not ( = ?auto_13454 ?auto_13453 ) ) ( AVAILABLE ?auto_13445 ) ( TRUCK-AT ?auto_13457 ?auto_13448 ) ( AVAILABLE ?auto_13449 ) ( SURFACE-AT ?auto_13450 ?auto_13448 ) ( ON ?auto_13450 ?auto_13459 ) ( CLEAR ?auto_13450 ) ( not ( = ?auto_13442 ?auto_13459 ) ) ( not ( = ?auto_13443 ?auto_13459 ) ) ( not ( = ?auto_13458 ?auto_13459 ) ) ( not ( = ?auto_13444 ?auto_13459 ) ) ( not ( = ?auto_13455 ?auto_13459 ) ) ( not ( = ?auto_13450 ?auto_13459 ) ) ( not ( = ?auto_13454 ?auto_13459 ) ) ( not ( = ?auto_13453 ?auto_13459 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13449 ?auto_13450 ?auto_13459 ?auto_13448 )
      ( MAKE-2CRATE ?auto_13458 ?auto_13442 ?auto_13443 )
      ( MAKE-1CRATE-VERIFY ?auto_13442 ?auto_13443 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13460 - SURFACE
      ?auto_13461 - SURFACE
      ?auto_13462 - SURFACE
    )
    :vars
    (
      ?auto_13467 - HOIST
      ?auto_13474 - PLACE
      ?auto_13473 - PLACE
      ?auto_13464 - HOIST
      ?auto_13477 - SURFACE
      ?auto_13469 - PLACE
      ?auto_13476 - HOIST
      ?auto_13472 - SURFACE
      ?auto_13471 - SURFACE
      ?auto_13463 - PLACE
      ?auto_13466 - HOIST
      ?auto_13465 - SURFACE
      ?auto_13468 - SURFACE
      ?auto_13470 - TRUCK
      ?auto_13475 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13467 ?auto_13474 ) ( IS-CRATE ?auto_13462 ) ( not ( = ?auto_13461 ?auto_13462 ) ) ( not ( = ?auto_13460 ?auto_13461 ) ) ( not ( = ?auto_13460 ?auto_13462 ) ) ( not ( = ?auto_13473 ?auto_13474 ) ) ( HOIST-AT ?auto_13464 ?auto_13473 ) ( not ( = ?auto_13467 ?auto_13464 ) ) ( SURFACE-AT ?auto_13462 ?auto_13473 ) ( ON ?auto_13462 ?auto_13477 ) ( CLEAR ?auto_13462 ) ( not ( = ?auto_13461 ?auto_13477 ) ) ( not ( = ?auto_13462 ?auto_13477 ) ) ( not ( = ?auto_13460 ?auto_13477 ) ) ( IS-CRATE ?auto_13461 ) ( not ( = ?auto_13469 ?auto_13474 ) ) ( not ( = ?auto_13473 ?auto_13469 ) ) ( HOIST-AT ?auto_13476 ?auto_13469 ) ( not ( = ?auto_13467 ?auto_13476 ) ) ( not ( = ?auto_13464 ?auto_13476 ) ) ( AVAILABLE ?auto_13476 ) ( SURFACE-AT ?auto_13461 ?auto_13469 ) ( ON ?auto_13461 ?auto_13472 ) ( CLEAR ?auto_13461 ) ( not ( = ?auto_13461 ?auto_13472 ) ) ( not ( = ?auto_13462 ?auto_13472 ) ) ( not ( = ?auto_13460 ?auto_13472 ) ) ( not ( = ?auto_13477 ?auto_13472 ) ) ( IS-CRATE ?auto_13460 ) ( not ( = ?auto_13471 ?auto_13460 ) ) ( not ( = ?auto_13461 ?auto_13471 ) ) ( not ( = ?auto_13462 ?auto_13471 ) ) ( not ( = ?auto_13477 ?auto_13471 ) ) ( not ( = ?auto_13472 ?auto_13471 ) ) ( not ( = ?auto_13463 ?auto_13474 ) ) ( not ( = ?auto_13473 ?auto_13463 ) ) ( not ( = ?auto_13469 ?auto_13463 ) ) ( HOIST-AT ?auto_13466 ?auto_13463 ) ( not ( = ?auto_13467 ?auto_13466 ) ) ( not ( = ?auto_13464 ?auto_13466 ) ) ( not ( = ?auto_13476 ?auto_13466 ) ) ( AVAILABLE ?auto_13466 ) ( SURFACE-AT ?auto_13460 ?auto_13463 ) ( ON ?auto_13460 ?auto_13465 ) ( CLEAR ?auto_13460 ) ( not ( = ?auto_13461 ?auto_13465 ) ) ( not ( = ?auto_13462 ?auto_13465 ) ) ( not ( = ?auto_13460 ?auto_13465 ) ) ( not ( = ?auto_13477 ?auto_13465 ) ) ( not ( = ?auto_13472 ?auto_13465 ) ) ( not ( = ?auto_13471 ?auto_13465 ) ) ( SURFACE-AT ?auto_13468 ?auto_13474 ) ( CLEAR ?auto_13468 ) ( IS-CRATE ?auto_13471 ) ( not ( = ?auto_13468 ?auto_13471 ) ) ( not ( = ?auto_13461 ?auto_13468 ) ) ( not ( = ?auto_13462 ?auto_13468 ) ) ( not ( = ?auto_13460 ?auto_13468 ) ) ( not ( = ?auto_13477 ?auto_13468 ) ) ( not ( = ?auto_13472 ?auto_13468 ) ) ( not ( = ?auto_13465 ?auto_13468 ) ) ( AVAILABLE ?auto_13467 ) ( TRUCK-AT ?auto_13470 ?auto_13473 ) ( AVAILABLE ?auto_13464 ) ( SURFACE-AT ?auto_13471 ?auto_13473 ) ( ON ?auto_13471 ?auto_13475 ) ( CLEAR ?auto_13471 ) ( not ( = ?auto_13461 ?auto_13475 ) ) ( not ( = ?auto_13462 ?auto_13475 ) ) ( not ( = ?auto_13460 ?auto_13475 ) ) ( not ( = ?auto_13477 ?auto_13475 ) ) ( not ( = ?auto_13472 ?auto_13475 ) ) ( not ( = ?auto_13471 ?auto_13475 ) ) ( not ( = ?auto_13465 ?auto_13475 ) ) ( not ( = ?auto_13468 ?auto_13475 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13461 ?auto_13462 )
      ( MAKE-2CRATE-VERIFY ?auto_13460 ?auto_13461 ?auto_13462 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13478 - SURFACE
      ?auto_13479 - SURFACE
      ?auto_13480 - SURFACE
      ?auto_13481 - SURFACE
    )
    :vars
    (
      ?auto_13482 - HOIST
      ?auto_13490 - PLACE
      ?auto_13483 - PLACE
      ?auto_13485 - HOIST
      ?auto_13492 - SURFACE
      ?auto_13495 - PLACE
      ?auto_13488 - HOIST
      ?auto_13493 - SURFACE
      ?auto_13484 - PLACE
      ?auto_13489 - HOIST
      ?auto_13491 - SURFACE
      ?auto_13486 - SURFACE
      ?auto_13494 - TRUCK
      ?auto_13487 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13482 ?auto_13490 ) ( IS-CRATE ?auto_13481 ) ( not ( = ?auto_13480 ?auto_13481 ) ) ( not ( = ?auto_13479 ?auto_13480 ) ) ( not ( = ?auto_13479 ?auto_13481 ) ) ( not ( = ?auto_13483 ?auto_13490 ) ) ( HOIST-AT ?auto_13485 ?auto_13483 ) ( not ( = ?auto_13482 ?auto_13485 ) ) ( SURFACE-AT ?auto_13481 ?auto_13483 ) ( ON ?auto_13481 ?auto_13492 ) ( CLEAR ?auto_13481 ) ( not ( = ?auto_13480 ?auto_13492 ) ) ( not ( = ?auto_13481 ?auto_13492 ) ) ( not ( = ?auto_13479 ?auto_13492 ) ) ( IS-CRATE ?auto_13480 ) ( not ( = ?auto_13495 ?auto_13490 ) ) ( not ( = ?auto_13483 ?auto_13495 ) ) ( HOIST-AT ?auto_13488 ?auto_13495 ) ( not ( = ?auto_13482 ?auto_13488 ) ) ( not ( = ?auto_13485 ?auto_13488 ) ) ( AVAILABLE ?auto_13488 ) ( SURFACE-AT ?auto_13480 ?auto_13495 ) ( ON ?auto_13480 ?auto_13493 ) ( CLEAR ?auto_13480 ) ( not ( = ?auto_13480 ?auto_13493 ) ) ( not ( = ?auto_13481 ?auto_13493 ) ) ( not ( = ?auto_13479 ?auto_13493 ) ) ( not ( = ?auto_13492 ?auto_13493 ) ) ( IS-CRATE ?auto_13479 ) ( not ( = ?auto_13478 ?auto_13479 ) ) ( not ( = ?auto_13480 ?auto_13478 ) ) ( not ( = ?auto_13481 ?auto_13478 ) ) ( not ( = ?auto_13492 ?auto_13478 ) ) ( not ( = ?auto_13493 ?auto_13478 ) ) ( not ( = ?auto_13484 ?auto_13490 ) ) ( not ( = ?auto_13483 ?auto_13484 ) ) ( not ( = ?auto_13495 ?auto_13484 ) ) ( HOIST-AT ?auto_13489 ?auto_13484 ) ( not ( = ?auto_13482 ?auto_13489 ) ) ( not ( = ?auto_13485 ?auto_13489 ) ) ( not ( = ?auto_13488 ?auto_13489 ) ) ( AVAILABLE ?auto_13489 ) ( SURFACE-AT ?auto_13479 ?auto_13484 ) ( ON ?auto_13479 ?auto_13491 ) ( CLEAR ?auto_13479 ) ( not ( = ?auto_13480 ?auto_13491 ) ) ( not ( = ?auto_13481 ?auto_13491 ) ) ( not ( = ?auto_13479 ?auto_13491 ) ) ( not ( = ?auto_13492 ?auto_13491 ) ) ( not ( = ?auto_13493 ?auto_13491 ) ) ( not ( = ?auto_13478 ?auto_13491 ) ) ( SURFACE-AT ?auto_13486 ?auto_13490 ) ( CLEAR ?auto_13486 ) ( IS-CRATE ?auto_13478 ) ( not ( = ?auto_13486 ?auto_13478 ) ) ( not ( = ?auto_13480 ?auto_13486 ) ) ( not ( = ?auto_13481 ?auto_13486 ) ) ( not ( = ?auto_13479 ?auto_13486 ) ) ( not ( = ?auto_13492 ?auto_13486 ) ) ( not ( = ?auto_13493 ?auto_13486 ) ) ( not ( = ?auto_13491 ?auto_13486 ) ) ( AVAILABLE ?auto_13482 ) ( TRUCK-AT ?auto_13494 ?auto_13483 ) ( AVAILABLE ?auto_13485 ) ( SURFACE-AT ?auto_13478 ?auto_13483 ) ( ON ?auto_13478 ?auto_13487 ) ( CLEAR ?auto_13478 ) ( not ( = ?auto_13480 ?auto_13487 ) ) ( not ( = ?auto_13481 ?auto_13487 ) ) ( not ( = ?auto_13479 ?auto_13487 ) ) ( not ( = ?auto_13492 ?auto_13487 ) ) ( not ( = ?auto_13493 ?auto_13487 ) ) ( not ( = ?auto_13478 ?auto_13487 ) ) ( not ( = ?auto_13491 ?auto_13487 ) ) ( not ( = ?auto_13486 ?auto_13487 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13479 ?auto_13480 ?auto_13481 )
      ( MAKE-3CRATE-VERIFY ?auto_13478 ?auto_13479 ?auto_13480 ?auto_13481 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13496 - SURFACE
      ?auto_13497 - SURFACE
      ?auto_13498 - SURFACE
      ?auto_13499 - SURFACE
      ?auto_13500 - SURFACE
    )
    :vars
    (
      ?auto_13501 - HOIST
      ?auto_13508 - PLACE
      ?auto_13502 - PLACE
      ?auto_13504 - HOIST
      ?auto_13510 - SURFACE
      ?auto_13513 - PLACE
      ?auto_13506 - HOIST
      ?auto_13511 - SURFACE
      ?auto_13503 - PLACE
      ?auto_13507 - HOIST
      ?auto_13509 - SURFACE
      ?auto_13512 - TRUCK
      ?auto_13505 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13501 ?auto_13508 ) ( IS-CRATE ?auto_13500 ) ( not ( = ?auto_13499 ?auto_13500 ) ) ( not ( = ?auto_13498 ?auto_13499 ) ) ( not ( = ?auto_13498 ?auto_13500 ) ) ( not ( = ?auto_13502 ?auto_13508 ) ) ( HOIST-AT ?auto_13504 ?auto_13502 ) ( not ( = ?auto_13501 ?auto_13504 ) ) ( SURFACE-AT ?auto_13500 ?auto_13502 ) ( ON ?auto_13500 ?auto_13510 ) ( CLEAR ?auto_13500 ) ( not ( = ?auto_13499 ?auto_13510 ) ) ( not ( = ?auto_13500 ?auto_13510 ) ) ( not ( = ?auto_13498 ?auto_13510 ) ) ( IS-CRATE ?auto_13499 ) ( not ( = ?auto_13513 ?auto_13508 ) ) ( not ( = ?auto_13502 ?auto_13513 ) ) ( HOIST-AT ?auto_13506 ?auto_13513 ) ( not ( = ?auto_13501 ?auto_13506 ) ) ( not ( = ?auto_13504 ?auto_13506 ) ) ( AVAILABLE ?auto_13506 ) ( SURFACE-AT ?auto_13499 ?auto_13513 ) ( ON ?auto_13499 ?auto_13511 ) ( CLEAR ?auto_13499 ) ( not ( = ?auto_13499 ?auto_13511 ) ) ( not ( = ?auto_13500 ?auto_13511 ) ) ( not ( = ?auto_13498 ?auto_13511 ) ) ( not ( = ?auto_13510 ?auto_13511 ) ) ( IS-CRATE ?auto_13498 ) ( not ( = ?auto_13497 ?auto_13498 ) ) ( not ( = ?auto_13499 ?auto_13497 ) ) ( not ( = ?auto_13500 ?auto_13497 ) ) ( not ( = ?auto_13510 ?auto_13497 ) ) ( not ( = ?auto_13511 ?auto_13497 ) ) ( not ( = ?auto_13503 ?auto_13508 ) ) ( not ( = ?auto_13502 ?auto_13503 ) ) ( not ( = ?auto_13513 ?auto_13503 ) ) ( HOIST-AT ?auto_13507 ?auto_13503 ) ( not ( = ?auto_13501 ?auto_13507 ) ) ( not ( = ?auto_13504 ?auto_13507 ) ) ( not ( = ?auto_13506 ?auto_13507 ) ) ( AVAILABLE ?auto_13507 ) ( SURFACE-AT ?auto_13498 ?auto_13503 ) ( ON ?auto_13498 ?auto_13509 ) ( CLEAR ?auto_13498 ) ( not ( = ?auto_13499 ?auto_13509 ) ) ( not ( = ?auto_13500 ?auto_13509 ) ) ( not ( = ?auto_13498 ?auto_13509 ) ) ( not ( = ?auto_13510 ?auto_13509 ) ) ( not ( = ?auto_13511 ?auto_13509 ) ) ( not ( = ?auto_13497 ?auto_13509 ) ) ( SURFACE-AT ?auto_13496 ?auto_13508 ) ( CLEAR ?auto_13496 ) ( IS-CRATE ?auto_13497 ) ( not ( = ?auto_13496 ?auto_13497 ) ) ( not ( = ?auto_13499 ?auto_13496 ) ) ( not ( = ?auto_13500 ?auto_13496 ) ) ( not ( = ?auto_13498 ?auto_13496 ) ) ( not ( = ?auto_13510 ?auto_13496 ) ) ( not ( = ?auto_13511 ?auto_13496 ) ) ( not ( = ?auto_13509 ?auto_13496 ) ) ( AVAILABLE ?auto_13501 ) ( TRUCK-AT ?auto_13512 ?auto_13502 ) ( AVAILABLE ?auto_13504 ) ( SURFACE-AT ?auto_13497 ?auto_13502 ) ( ON ?auto_13497 ?auto_13505 ) ( CLEAR ?auto_13497 ) ( not ( = ?auto_13499 ?auto_13505 ) ) ( not ( = ?auto_13500 ?auto_13505 ) ) ( not ( = ?auto_13498 ?auto_13505 ) ) ( not ( = ?auto_13510 ?auto_13505 ) ) ( not ( = ?auto_13511 ?auto_13505 ) ) ( not ( = ?auto_13497 ?auto_13505 ) ) ( not ( = ?auto_13509 ?auto_13505 ) ) ( not ( = ?auto_13496 ?auto_13505 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13498 ?auto_13499 ?auto_13500 )
      ( MAKE-4CRATE-VERIFY ?auto_13496 ?auto_13497 ?auto_13498 ?auto_13499 ?auto_13500 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13514 - SURFACE
      ?auto_13515 - SURFACE
    )
    :vars
    (
      ?auto_13516 - HOIST
      ?auto_13524 - PLACE
      ?auto_13531 - SURFACE
      ?auto_13517 - PLACE
      ?auto_13519 - HOIST
      ?auto_13526 - SURFACE
      ?auto_13530 - PLACE
      ?auto_13522 - HOIST
      ?auto_13528 - SURFACE
      ?auto_13527 - SURFACE
      ?auto_13518 - PLACE
      ?auto_13523 - HOIST
      ?auto_13525 - SURFACE
      ?auto_13520 - SURFACE
      ?auto_13521 - SURFACE
      ?auto_13529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13516 ?auto_13524 ) ( IS-CRATE ?auto_13515 ) ( not ( = ?auto_13514 ?auto_13515 ) ) ( not ( = ?auto_13531 ?auto_13514 ) ) ( not ( = ?auto_13531 ?auto_13515 ) ) ( not ( = ?auto_13517 ?auto_13524 ) ) ( HOIST-AT ?auto_13519 ?auto_13517 ) ( not ( = ?auto_13516 ?auto_13519 ) ) ( SURFACE-AT ?auto_13515 ?auto_13517 ) ( ON ?auto_13515 ?auto_13526 ) ( CLEAR ?auto_13515 ) ( not ( = ?auto_13514 ?auto_13526 ) ) ( not ( = ?auto_13515 ?auto_13526 ) ) ( not ( = ?auto_13531 ?auto_13526 ) ) ( IS-CRATE ?auto_13514 ) ( not ( = ?auto_13530 ?auto_13524 ) ) ( not ( = ?auto_13517 ?auto_13530 ) ) ( HOIST-AT ?auto_13522 ?auto_13530 ) ( not ( = ?auto_13516 ?auto_13522 ) ) ( not ( = ?auto_13519 ?auto_13522 ) ) ( AVAILABLE ?auto_13522 ) ( SURFACE-AT ?auto_13514 ?auto_13530 ) ( ON ?auto_13514 ?auto_13528 ) ( CLEAR ?auto_13514 ) ( not ( = ?auto_13514 ?auto_13528 ) ) ( not ( = ?auto_13515 ?auto_13528 ) ) ( not ( = ?auto_13531 ?auto_13528 ) ) ( not ( = ?auto_13526 ?auto_13528 ) ) ( IS-CRATE ?auto_13531 ) ( not ( = ?auto_13527 ?auto_13531 ) ) ( not ( = ?auto_13514 ?auto_13527 ) ) ( not ( = ?auto_13515 ?auto_13527 ) ) ( not ( = ?auto_13526 ?auto_13527 ) ) ( not ( = ?auto_13528 ?auto_13527 ) ) ( not ( = ?auto_13518 ?auto_13524 ) ) ( not ( = ?auto_13517 ?auto_13518 ) ) ( not ( = ?auto_13530 ?auto_13518 ) ) ( HOIST-AT ?auto_13523 ?auto_13518 ) ( not ( = ?auto_13516 ?auto_13523 ) ) ( not ( = ?auto_13519 ?auto_13523 ) ) ( not ( = ?auto_13522 ?auto_13523 ) ) ( AVAILABLE ?auto_13523 ) ( SURFACE-AT ?auto_13531 ?auto_13518 ) ( ON ?auto_13531 ?auto_13525 ) ( CLEAR ?auto_13531 ) ( not ( = ?auto_13514 ?auto_13525 ) ) ( not ( = ?auto_13515 ?auto_13525 ) ) ( not ( = ?auto_13531 ?auto_13525 ) ) ( not ( = ?auto_13526 ?auto_13525 ) ) ( not ( = ?auto_13528 ?auto_13525 ) ) ( not ( = ?auto_13527 ?auto_13525 ) ) ( SURFACE-AT ?auto_13520 ?auto_13524 ) ( CLEAR ?auto_13520 ) ( IS-CRATE ?auto_13527 ) ( not ( = ?auto_13520 ?auto_13527 ) ) ( not ( = ?auto_13514 ?auto_13520 ) ) ( not ( = ?auto_13515 ?auto_13520 ) ) ( not ( = ?auto_13531 ?auto_13520 ) ) ( not ( = ?auto_13526 ?auto_13520 ) ) ( not ( = ?auto_13528 ?auto_13520 ) ) ( not ( = ?auto_13525 ?auto_13520 ) ) ( AVAILABLE ?auto_13516 ) ( AVAILABLE ?auto_13519 ) ( SURFACE-AT ?auto_13527 ?auto_13517 ) ( ON ?auto_13527 ?auto_13521 ) ( CLEAR ?auto_13527 ) ( not ( = ?auto_13514 ?auto_13521 ) ) ( not ( = ?auto_13515 ?auto_13521 ) ) ( not ( = ?auto_13531 ?auto_13521 ) ) ( not ( = ?auto_13526 ?auto_13521 ) ) ( not ( = ?auto_13528 ?auto_13521 ) ) ( not ( = ?auto_13527 ?auto_13521 ) ) ( not ( = ?auto_13525 ?auto_13521 ) ) ( not ( = ?auto_13520 ?auto_13521 ) ) ( TRUCK-AT ?auto_13529 ?auto_13524 ) )
    :subtasks
    ( ( !DRIVE ?auto_13529 ?auto_13524 ?auto_13517 )
      ( MAKE-2CRATE ?auto_13531 ?auto_13514 ?auto_13515 )
      ( MAKE-1CRATE-VERIFY ?auto_13514 ?auto_13515 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13532 - SURFACE
      ?auto_13533 - SURFACE
      ?auto_13534 - SURFACE
    )
    :vars
    (
      ?auto_13543 - HOIST
      ?auto_13541 - PLACE
      ?auto_13535 - PLACE
      ?auto_13539 - HOIST
      ?auto_13549 - SURFACE
      ?auto_13540 - PLACE
      ?auto_13538 - HOIST
      ?auto_13548 - SURFACE
      ?auto_13536 - SURFACE
      ?auto_13545 - PLACE
      ?auto_13547 - HOIST
      ?auto_13546 - SURFACE
      ?auto_13544 - SURFACE
      ?auto_13537 - SURFACE
      ?auto_13542 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13543 ?auto_13541 ) ( IS-CRATE ?auto_13534 ) ( not ( = ?auto_13533 ?auto_13534 ) ) ( not ( = ?auto_13532 ?auto_13533 ) ) ( not ( = ?auto_13532 ?auto_13534 ) ) ( not ( = ?auto_13535 ?auto_13541 ) ) ( HOIST-AT ?auto_13539 ?auto_13535 ) ( not ( = ?auto_13543 ?auto_13539 ) ) ( SURFACE-AT ?auto_13534 ?auto_13535 ) ( ON ?auto_13534 ?auto_13549 ) ( CLEAR ?auto_13534 ) ( not ( = ?auto_13533 ?auto_13549 ) ) ( not ( = ?auto_13534 ?auto_13549 ) ) ( not ( = ?auto_13532 ?auto_13549 ) ) ( IS-CRATE ?auto_13533 ) ( not ( = ?auto_13540 ?auto_13541 ) ) ( not ( = ?auto_13535 ?auto_13540 ) ) ( HOIST-AT ?auto_13538 ?auto_13540 ) ( not ( = ?auto_13543 ?auto_13538 ) ) ( not ( = ?auto_13539 ?auto_13538 ) ) ( AVAILABLE ?auto_13538 ) ( SURFACE-AT ?auto_13533 ?auto_13540 ) ( ON ?auto_13533 ?auto_13548 ) ( CLEAR ?auto_13533 ) ( not ( = ?auto_13533 ?auto_13548 ) ) ( not ( = ?auto_13534 ?auto_13548 ) ) ( not ( = ?auto_13532 ?auto_13548 ) ) ( not ( = ?auto_13549 ?auto_13548 ) ) ( IS-CRATE ?auto_13532 ) ( not ( = ?auto_13536 ?auto_13532 ) ) ( not ( = ?auto_13533 ?auto_13536 ) ) ( not ( = ?auto_13534 ?auto_13536 ) ) ( not ( = ?auto_13549 ?auto_13536 ) ) ( not ( = ?auto_13548 ?auto_13536 ) ) ( not ( = ?auto_13545 ?auto_13541 ) ) ( not ( = ?auto_13535 ?auto_13545 ) ) ( not ( = ?auto_13540 ?auto_13545 ) ) ( HOIST-AT ?auto_13547 ?auto_13545 ) ( not ( = ?auto_13543 ?auto_13547 ) ) ( not ( = ?auto_13539 ?auto_13547 ) ) ( not ( = ?auto_13538 ?auto_13547 ) ) ( AVAILABLE ?auto_13547 ) ( SURFACE-AT ?auto_13532 ?auto_13545 ) ( ON ?auto_13532 ?auto_13546 ) ( CLEAR ?auto_13532 ) ( not ( = ?auto_13533 ?auto_13546 ) ) ( not ( = ?auto_13534 ?auto_13546 ) ) ( not ( = ?auto_13532 ?auto_13546 ) ) ( not ( = ?auto_13549 ?auto_13546 ) ) ( not ( = ?auto_13548 ?auto_13546 ) ) ( not ( = ?auto_13536 ?auto_13546 ) ) ( SURFACE-AT ?auto_13544 ?auto_13541 ) ( CLEAR ?auto_13544 ) ( IS-CRATE ?auto_13536 ) ( not ( = ?auto_13544 ?auto_13536 ) ) ( not ( = ?auto_13533 ?auto_13544 ) ) ( not ( = ?auto_13534 ?auto_13544 ) ) ( not ( = ?auto_13532 ?auto_13544 ) ) ( not ( = ?auto_13549 ?auto_13544 ) ) ( not ( = ?auto_13548 ?auto_13544 ) ) ( not ( = ?auto_13546 ?auto_13544 ) ) ( AVAILABLE ?auto_13543 ) ( AVAILABLE ?auto_13539 ) ( SURFACE-AT ?auto_13536 ?auto_13535 ) ( ON ?auto_13536 ?auto_13537 ) ( CLEAR ?auto_13536 ) ( not ( = ?auto_13533 ?auto_13537 ) ) ( not ( = ?auto_13534 ?auto_13537 ) ) ( not ( = ?auto_13532 ?auto_13537 ) ) ( not ( = ?auto_13549 ?auto_13537 ) ) ( not ( = ?auto_13548 ?auto_13537 ) ) ( not ( = ?auto_13536 ?auto_13537 ) ) ( not ( = ?auto_13546 ?auto_13537 ) ) ( not ( = ?auto_13544 ?auto_13537 ) ) ( TRUCK-AT ?auto_13542 ?auto_13541 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13533 ?auto_13534 )
      ( MAKE-2CRATE-VERIFY ?auto_13532 ?auto_13533 ?auto_13534 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13550 - SURFACE
      ?auto_13551 - SURFACE
      ?auto_13552 - SURFACE
      ?auto_13553 - SURFACE
    )
    :vars
    (
      ?auto_13559 - HOIST
      ?auto_13565 - PLACE
      ?auto_13556 - PLACE
      ?auto_13558 - HOIST
      ?auto_13554 - SURFACE
      ?auto_13555 - PLACE
      ?auto_13560 - HOIST
      ?auto_13562 - SURFACE
      ?auto_13561 - PLACE
      ?auto_13567 - HOIST
      ?auto_13563 - SURFACE
      ?auto_13557 - SURFACE
      ?auto_13566 - SURFACE
      ?auto_13564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13559 ?auto_13565 ) ( IS-CRATE ?auto_13553 ) ( not ( = ?auto_13552 ?auto_13553 ) ) ( not ( = ?auto_13551 ?auto_13552 ) ) ( not ( = ?auto_13551 ?auto_13553 ) ) ( not ( = ?auto_13556 ?auto_13565 ) ) ( HOIST-AT ?auto_13558 ?auto_13556 ) ( not ( = ?auto_13559 ?auto_13558 ) ) ( SURFACE-AT ?auto_13553 ?auto_13556 ) ( ON ?auto_13553 ?auto_13554 ) ( CLEAR ?auto_13553 ) ( not ( = ?auto_13552 ?auto_13554 ) ) ( not ( = ?auto_13553 ?auto_13554 ) ) ( not ( = ?auto_13551 ?auto_13554 ) ) ( IS-CRATE ?auto_13552 ) ( not ( = ?auto_13555 ?auto_13565 ) ) ( not ( = ?auto_13556 ?auto_13555 ) ) ( HOIST-AT ?auto_13560 ?auto_13555 ) ( not ( = ?auto_13559 ?auto_13560 ) ) ( not ( = ?auto_13558 ?auto_13560 ) ) ( AVAILABLE ?auto_13560 ) ( SURFACE-AT ?auto_13552 ?auto_13555 ) ( ON ?auto_13552 ?auto_13562 ) ( CLEAR ?auto_13552 ) ( not ( = ?auto_13552 ?auto_13562 ) ) ( not ( = ?auto_13553 ?auto_13562 ) ) ( not ( = ?auto_13551 ?auto_13562 ) ) ( not ( = ?auto_13554 ?auto_13562 ) ) ( IS-CRATE ?auto_13551 ) ( not ( = ?auto_13550 ?auto_13551 ) ) ( not ( = ?auto_13552 ?auto_13550 ) ) ( not ( = ?auto_13553 ?auto_13550 ) ) ( not ( = ?auto_13554 ?auto_13550 ) ) ( not ( = ?auto_13562 ?auto_13550 ) ) ( not ( = ?auto_13561 ?auto_13565 ) ) ( not ( = ?auto_13556 ?auto_13561 ) ) ( not ( = ?auto_13555 ?auto_13561 ) ) ( HOIST-AT ?auto_13567 ?auto_13561 ) ( not ( = ?auto_13559 ?auto_13567 ) ) ( not ( = ?auto_13558 ?auto_13567 ) ) ( not ( = ?auto_13560 ?auto_13567 ) ) ( AVAILABLE ?auto_13567 ) ( SURFACE-AT ?auto_13551 ?auto_13561 ) ( ON ?auto_13551 ?auto_13563 ) ( CLEAR ?auto_13551 ) ( not ( = ?auto_13552 ?auto_13563 ) ) ( not ( = ?auto_13553 ?auto_13563 ) ) ( not ( = ?auto_13551 ?auto_13563 ) ) ( not ( = ?auto_13554 ?auto_13563 ) ) ( not ( = ?auto_13562 ?auto_13563 ) ) ( not ( = ?auto_13550 ?auto_13563 ) ) ( SURFACE-AT ?auto_13557 ?auto_13565 ) ( CLEAR ?auto_13557 ) ( IS-CRATE ?auto_13550 ) ( not ( = ?auto_13557 ?auto_13550 ) ) ( not ( = ?auto_13552 ?auto_13557 ) ) ( not ( = ?auto_13553 ?auto_13557 ) ) ( not ( = ?auto_13551 ?auto_13557 ) ) ( not ( = ?auto_13554 ?auto_13557 ) ) ( not ( = ?auto_13562 ?auto_13557 ) ) ( not ( = ?auto_13563 ?auto_13557 ) ) ( AVAILABLE ?auto_13559 ) ( AVAILABLE ?auto_13558 ) ( SURFACE-AT ?auto_13550 ?auto_13556 ) ( ON ?auto_13550 ?auto_13566 ) ( CLEAR ?auto_13550 ) ( not ( = ?auto_13552 ?auto_13566 ) ) ( not ( = ?auto_13553 ?auto_13566 ) ) ( not ( = ?auto_13551 ?auto_13566 ) ) ( not ( = ?auto_13554 ?auto_13566 ) ) ( not ( = ?auto_13562 ?auto_13566 ) ) ( not ( = ?auto_13550 ?auto_13566 ) ) ( not ( = ?auto_13563 ?auto_13566 ) ) ( not ( = ?auto_13557 ?auto_13566 ) ) ( TRUCK-AT ?auto_13564 ?auto_13565 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13551 ?auto_13552 ?auto_13553 )
      ( MAKE-3CRATE-VERIFY ?auto_13550 ?auto_13551 ?auto_13552 ?auto_13553 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13568 - SURFACE
      ?auto_13569 - SURFACE
      ?auto_13570 - SURFACE
      ?auto_13571 - SURFACE
      ?auto_13572 - SURFACE
    )
    :vars
    (
      ?auto_13577 - HOIST
      ?auto_13583 - PLACE
      ?auto_13575 - PLACE
      ?auto_13576 - HOIST
      ?auto_13573 - SURFACE
      ?auto_13574 - PLACE
      ?auto_13578 - HOIST
      ?auto_13580 - SURFACE
      ?auto_13579 - PLACE
      ?auto_13585 - HOIST
      ?auto_13581 - SURFACE
      ?auto_13584 - SURFACE
      ?auto_13582 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13577 ?auto_13583 ) ( IS-CRATE ?auto_13572 ) ( not ( = ?auto_13571 ?auto_13572 ) ) ( not ( = ?auto_13570 ?auto_13571 ) ) ( not ( = ?auto_13570 ?auto_13572 ) ) ( not ( = ?auto_13575 ?auto_13583 ) ) ( HOIST-AT ?auto_13576 ?auto_13575 ) ( not ( = ?auto_13577 ?auto_13576 ) ) ( SURFACE-AT ?auto_13572 ?auto_13575 ) ( ON ?auto_13572 ?auto_13573 ) ( CLEAR ?auto_13572 ) ( not ( = ?auto_13571 ?auto_13573 ) ) ( not ( = ?auto_13572 ?auto_13573 ) ) ( not ( = ?auto_13570 ?auto_13573 ) ) ( IS-CRATE ?auto_13571 ) ( not ( = ?auto_13574 ?auto_13583 ) ) ( not ( = ?auto_13575 ?auto_13574 ) ) ( HOIST-AT ?auto_13578 ?auto_13574 ) ( not ( = ?auto_13577 ?auto_13578 ) ) ( not ( = ?auto_13576 ?auto_13578 ) ) ( AVAILABLE ?auto_13578 ) ( SURFACE-AT ?auto_13571 ?auto_13574 ) ( ON ?auto_13571 ?auto_13580 ) ( CLEAR ?auto_13571 ) ( not ( = ?auto_13571 ?auto_13580 ) ) ( not ( = ?auto_13572 ?auto_13580 ) ) ( not ( = ?auto_13570 ?auto_13580 ) ) ( not ( = ?auto_13573 ?auto_13580 ) ) ( IS-CRATE ?auto_13570 ) ( not ( = ?auto_13569 ?auto_13570 ) ) ( not ( = ?auto_13571 ?auto_13569 ) ) ( not ( = ?auto_13572 ?auto_13569 ) ) ( not ( = ?auto_13573 ?auto_13569 ) ) ( not ( = ?auto_13580 ?auto_13569 ) ) ( not ( = ?auto_13579 ?auto_13583 ) ) ( not ( = ?auto_13575 ?auto_13579 ) ) ( not ( = ?auto_13574 ?auto_13579 ) ) ( HOIST-AT ?auto_13585 ?auto_13579 ) ( not ( = ?auto_13577 ?auto_13585 ) ) ( not ( = ?auto_13576 ?auto_13585 ) ) ( not ( = ?auto_13578 ?auto_13585 ) ) ( AVAILABLE ?auto_13585 ) ( SURFACE-AT ?auto_13570 ?auto_13579 ) ( ON ?auto_13570 ?auto_13581 ) ( CLEAR ?auto_13570 ) ( not ( = ?auto_13571 ?auto_13581 ) ) ( not ( = ?auto_13572 ?auto_13581 ) ) ( not ( = ?auto_13570 ?auto_13581 ) ) ( not ( = ?auto_13573 ?auto_13581 ) ) ( not ( = ?auto_13580 ?auto_13581 ) ) ( not ( = ?auto_13569 ?auto_13581 ) ) ( SURFACE-AT ?auto_13568 ?auto_13583 ) ( CLEAR ?auto_13568 ) ( IS-CRATE ?auto_13569 ) ( not ( = ?auto_13568 ?auto_13569 ) ) ( not ( = ?auto_13571 ?auto_13568 ) ) ( not ( = ?auto_13572 ?auto_13568 ) ) ( not ( = ?auto_13570 ?auto_13568 ) ) ( not ( = ?auto_13573 ?auto_13568 ) ) ( not ( = ?auto_13580 ?auto_13568 ) ) ( not ( = ?auto_13581 ?auto_13568 ) ) ( AVAILABLE ?auto_13577 ) ( AVAILABLE ?auto_13576 ) ( SURFACE-AT ?auto_13569 ?auto_13575 ) ( ON ?auto_13569 ?auto_13584 ) ( CLEAR ?auto_13569 ) ( not ( = ?auto_13571 ?auto_13584 ) ) ( not ( = ?auto_13572 ?auto_13584 ) ) ( not ( = ?auto_13570 ?auto_13584 ) ) ( not ( = ?auto_13573 ?auto_13584 ) ) ( not ( = ?auto_13580 ?auto_13584 ) ) ( not ( = ?auto_13569 ?auto_13584 ) ) ( not ( = ?auto_13581 ?auto_13584 ) ) ( not ( = ?auto_13568 ?auto_13584 ) ) ( TRUCK-AT ?auto_13582 ?auto_13583 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13570 ?auto_13571 ?auto_13572 )
      ( MAKE-4CRATE-VERIFY ?auto_13568 ?auto_13569 ?auto_13570 ?auto_13571 ?auto_13572 ) )
  )

)

