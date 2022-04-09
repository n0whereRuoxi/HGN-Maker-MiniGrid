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
      ?auto_7540 - SURFACE
      ?auto_7541 - SURFACE
    )
    :vars
    (
      ?auto_7542 - HOIST
      ?auto_7543 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7542 ?auto_7543 ) ( SURFACE-AT ?auto_7540 ?auto_7543 ) ( CLEAR ?auto_7540 ) ( LIFTING ?auto_7542 ?auto_7541 ) ( IS-CRATE ?auto_7541 ) ( not ( = ?auto_7540 ?auto_7541 ) ) )
    :subtasks
    ( ( !DROP ?auto_7542 ?auto_7541 ?auto_7540 ?auto_7543 )
      ( MAKE-1CRATE-VERIFY ?auto_7540 ?auto_7541 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7544 - SURFACE
      ?auto_7545 - SURFACE
    )
    :vars
    (
      ?auto_7546 - HOIST
      ?auto_7547 - PLACE
      ?auto_7548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7546 ?auto_7547 ) ( SURFACE-AT ?auto_7544 ?auto_7547 ) ( CLEAR ?auto_7544 ) ( IS-CRATE ?auto_7545 ) ( not ( = ?auto_7544 ?auto_7545 ) ) ( TRUCK-AT ?auto_7548 ?auto_7547 ) ( AVAILABLE ?auto_7546 ) ( IN ?auto_7545 ?auto_7548 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7546 ?auto_7545 ?auto_7548 ?auto_7547 )
      ( MAKE-1CRATE ?auto_7544 ?auto_7545 )
      ( MAKE-1CRATE-VERIFY ?auto_7544 ?auto_7545 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7549 - SURFACE
      ?auto_7550 - SURFACE
    )
    :vars
    (
      ?auto_7552 - HOIST
      ?auto_7553 - PLACE
      ?auto_7551 - TRUCK
      ?auto_7554 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7552 ?auto_7553 ) ( SURFACE-AT ?auto_7549 ?auto_7553 ) ( CLEAR ?auto_7549 ) ( IS-CRATE ?auto_7550 ) ( not ( = ?auto_7549 ?auto_7550 ) ) ( AVAILABLE ?auto_7552 ) ( IN ?auto_7550 ?auto_7551 ) ( TRUCK-AT ?auto_7551 ?auto_7554 ) ( not ( = ?auto_7554 ?auto_7553 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7551 ?auto_7554 ?auto_7553 )
      ( MAKE-1CRATE ?auto_7549 ?auto_7550 )
      ( MAKE-1CRATE-VERIFY ?auto_7549 ?auto_7550 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7555 - SURFACE
      ?auto_7556 - SURFACE
    )
    :vars
    (
      ?auto_7557 - HOIST
      ?auto_7560 - PLACE
      ?auto_7559 - TRUCK
      ?auto_7558 - PLACE
      ?auto_7561 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7557 ?auto_7560 ) ( SURFACE-AT ?auto_7555 ?auto_7560 ) ( CLEAR ?auto_7555 ) ( IS-CRATE ?auto_7556 ) ( not ( = ?auto_7555 ?auto_7556 ) ) ( AVAILABLE ?auto_7557 ) ( TRUCK-AT ?auto_7559 ?auto_7558 ) ( not ( = ?auto_7558 ?auto_7560 ) ) ( HOIST-AT ?auto_7561 ?auto_7558 ) ( LIFTING ?auto_7561 ?auto_7556 ) ( not ( = ?auto_7557 ?auto_7561 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7561 ?auto_7556 ?auto_7559 ?auto_7558 )
      ( MAKE-1CRATE ?auto_7555 ?auto_7556 )
      ( MAKE-1CRATE-VERIFY ?auto_7555 ?auto_7556 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7562 - SURFACE
      ?auto_7563 - SURFACE
    )
    :vars
    (
      ?auto_7566 - HOIST
      ?auto_7564 - PLACE
      ?auto_7565 - TRUCK
      ?auto_7567 - PLACE
      ?auto_7568 - HOIST
      ?auto_7569 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7566 ?auto_7564 ) ( SURFACE-AT ?auto_7562 ?auto_7564 ) ( CLEAR ?auto_7562 ) ( IS-CRATE ?auto_7563 ) ( not ( = ?auto_7562 ?auto_7563 ) ) ( AVAILABLE ?auto_7566 ) ( TRUCK-AT ?auto_7565 ?auto_7567 ) ( not ( = ?auto_7567 ?auto_7564 ) ) ( HOIST-AT ?auto_7568 ?auto_7567 ) ( not ( = ?auto_7566 ?auto_7568 ) ) ( AVAILABLE ?auto_7568 ) ( SURFACE-AT ?auto_7563 ?auto_7567 ) ( ON ?auto_7563 ?auto_7569 ) ( CLEAR ?auto_7563 ) ( not ( = ?auto_7562 ?auto_7569 ) ) ( not ( = ?auto_7563 ?auto_7569 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7568 ?auto_7563 ?auto_7569 ?auto_7567 )
      ( MAKE-1CRATE ?auto_7562 ?auto_7563 )
      ( MAKE-1CRATE-VERIFY ?auto_7562 ?auto_7563 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7570 - SURFACE
      ?auto_7571 - SURFACE
    )
    :vars
    (
      ?auto_7574 - HOIST
      ?auto_7572 - PLACE
      ?auto_7573 - PLACE
      ?auto_7575 - HOIST
      ?auto_7576 - SURFACE
      ?auto_7577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7574 ?auto_7572 ) ( SURFACE-AT ?auto_7570 ?auto_7572 ) ( CLEAR ?auto_7570 ) ( IS-CRATE ?auto_7571 ) ( not ( = ?auto_7570 ?auto_7571 ) ) ( AVAILABLE ?auto_7574 ) ( not ( = ?auto_7573 ?auto_7572 ) ) ( HOIST-AT ?auto_7575 ?auto_7573 ) ( not ( = ?auto_7574 ?auto_7575 ) ) ( AVAILABLE ?auto_7575 ) ( SURFACE-AT ?auto_7571 ?auto_7573 ) ( ON ?auto_7571 ?auto_7576 ) ( CLEAR ?auto_7571 ) ( not ( = ?auto_7570 ?auto_7576 ) ) ( not ( = ?auto_7571 ?auto_7576 ) ) ( TRUCK-AT ?auto_7577 ?auto_7572 ) )
    :subtasks
    ( ( !DRIVE ?auto_7577 ?auto_7572 ?auto_7573 )
      ( MAKE-1CRATE ?auto_7570 ?auto_7571 )
      ( MAKE-1CRATE-VERIFY ?auto_7570 ?auto_7571 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7583 - SURFACE
      ?auto_7584 - SURFACE
    )
    :vars
    (
      ?auto_7585 - HOIST
      ?auto_7586 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7585 ?auto_7586 ) ( SURFACE-AT ?auto_7583 ?auto_7586 ) ( CLEAR ?auto_7583 ) ( LIFTING ?auto_7585 ?auto_7584 ) ( IS-CRATE ?auto_7584 ) ( not ( = ?auto_7583 ?auto_7584 ) ) )
    :subtasks
    ( ( !DROP ?auto_7585 ?auto_7584 ?auto_7583 ?auto_7586 )
      ( MAKE-1CRATE-VERIFY ?auto_7583 ?auto_7584 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7587 - SURFACE
      ?auto_7588 - SURFACE
      ?auto_7589 - SURFACE
    )
    :vars
    (
      ?auto_7590 - HOIST
      ?auto_7591 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7590 ?auto_7591 ) ( SURFACE-AT ?auto_7588 ?auto_7591 ) ( CLEAR ?auto_7588 ) ( LIFTING ?auto_7590 ?auto_7589 ) ( IS-CRATE ?auto_7589 ) ( not ( = ?auto_7588 ?auto_7589 ) ) ( ON ?auto_7588 ?auto_7587 ) ( not ( = ?auto_7587 ?auto_7588 ) ) ( not ( = ?auto_7587 ?auto_7589 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7588 ?auto_7589 )
      ( MAKE-2CRATE-VERIFY ?auto_7587 ?auto_7588 ?auto_7589 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7592 - SURFACE
      ?auto_7593 - SURFACE
    )
    :vars
    (
      ?auto_7594 - HOIST
      ?auto_7595 - PLACE
      ?auto_7596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7594 ?auto_7595 ) ( SURFACE-AT ?auto_7592 ?auto_7595 ) ( CLEAR ?auto_7592 ) ( IS-CRATE ?auto_7593 ) ( not ( = ?auto_7592 ?auto_7593 ) ) ( TRUCK-AT ?auto_7596 ?auto_7595 ) ( AVAILABLE ?auto_7594 ) ( IN ?auto_7593 ?auto_7596 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7594 ?auto_7593 ?auto_7596 ?auto_7595 )
      ( MAKE-1CRATE ?auto_7592 ?auto_7593 )
      ( MAKE-1CRATE-VERIFY ?auto_7592 ?auto_7593 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7597 - SURFACE
      ?auto_7598 - SURFACE
      ?auto_7599 - SURFACE
    )
    :vars
    (
      ?auto_7602 - HOIST
      ?auto_7601 - PLACE
      ?auto_7600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7602 ?auto_7601 ) ( SURFACE-AT ?auto_7598 ?auto_7601 ) ( CLEAR ?auto_7598 ) ( IS-CRATE ?auto_7599 ) ( not ( = ?auto_7598 ?auto_7599 ) ) ( TRUCK-AT ?auto_7600 ?auto_7601 ) ( AVAILABLE ?auto_7602 ) ( IN ?auto_7599 ?auto_7600 ) ( ON ?auto_7598 ?auto_7597 ) ( not ( = ?auto_7597 ?auto_7598 ) ) ( not ( = ?auto_7597 ?auto_7599 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7598 ?auto_7599 )
      ( MAKE-2CRATE-VERIFY ?auto_7597 ?auto_7598 ?auto_7599 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7603 - SURFACE
      ?auto_7604 - SURFACE
    )
    :vars
    (
      ?auto_7607 - HOIST
      ?auto_7606 - PLACE
      ?auto_7605 - TRUCK
      ?auto_7608 - SURFACE
      ?auto_7609 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7607 ?auto_7606 ) ( SURFACE-AT ?auto_7603 ?auto_7606 ) ( CLEAR ?auto_7603 ) ( IS-CRATE ?auto_7604 ) ( not ( = ?auto_7603 ?auto_7604 ) ) ( AVAILABLE ?auto_7607 ) ( IN ?auto_7604 ?auto_7605 ) ( ON ?auto_7603 ?auto_7608 ) ( not ( = ?auto_7608 ?auto_7603 ) ) ( not ( = ?auto_7608 ?auto_7604 ) ) ( TRUCK-AT ?auto_7605 ?auto_7609 ) ( not ( = ?auto_7609 ?auto_7606 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7605 ?auto_7609 ?auto_7606 )
      ( MAKE-2CRATE ?auto_7608 ?auto_7603 ?auto_7604 )
      ( MAKE-1CRATE-VERIFY ?auto_7603 ?auto_7604 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7610 - SURFACE
      ?auto_7611 - SURFACE
      ?auto_7612 - SURFACE
    )
    :vars
    (
      ?auto_7614 - HOIST
      ?auto_7613 - PLACE
      ?auto_7616 - TRUCK
      ?auto_7615 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7614 ?auto_7613 ) ( SURFACE-AT ?auto_7611 ?auto_7613 ) ( CLEAR ?auto_7611 ) ( IS-CRATE ?auto_7612 ) ( not ( = ?auto_7611 ?auto_7612 ) ) ( AVAILABLE ?auto_7614 ) ( IN ?auto_7612 ?auto_7616 ) ( ON ?auto_7611 ?auto_7610 ) ( not ( = ?auto_7610 ?auto_7611 ) ) ( not ( = ?auto_7610 ?auto_7612 ) ) ( TRUCK-AT ?auto_7616 ?auto_7615 ) ( not ( = ?auto_7615 ?auto_7613 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7611 ?auto_7612 )
      ( MAKE-2CRATE-VERIFY ?auto_7610 ?auto_7611 ?auto_7612 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7617 - SURFACE
      ?auto_7618 - SURFACE
    )
    :vars
    (
      ?auto_7620 - HOIST
      ?auto_7623 - PLACE
      ?auto_7619 - SURFACE
      ?auto_7621 - TRUCK
      ?auto_7622 - PLACE
      ?auto_7624 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7620 ?auto_7623 ) ( SURFACE-AT ?auto_7617 ?auto_7623 ) ( CLEAR ?auto_7617 ) ( IS-CRATE ?auto_7618 ) ( not ( = ?auto_7617 ?auto_7618 ) ) ( AVAILABLE ?auto_7620 ) ( ON ?auto_7617 ?auto_7619 ) ( not ( = ?auto_7619 ?auto_7617 ) ) ( not ( = ?auto_7619 ?auto_7618 ) ) ( TRUCK-AT ?auto_7621 ?auto_7622 ) ( not ( = ?auto_7622 ?auto_7623 ) ) ( HOIST-AT ?auto_7624 ?auto_7622 ) ( LIFTING ?auto_7624 ?auto_7618 ) ( not ( = ?auto_7620 ?auto_7624 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7624 ?auto_7618 ?auto_7621 ?auto_7622 )
      ( MAKE-2CRATE ?auto_7619 ?auto_7617 ?auto_7618 )
      ( MAKE-1CRATE-VERIFY ?auto_7617 ?auto_7618 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7625 - SURFACE
      ?auto_7626 - SURFACE
      ?auto_7627 - SURFACE
    )
    :vars
    (
      ?auto_7631 - HOIST
      ?auto_7632 - PLACE
      ?auto_7628 - TRUCK
      ?auto_7630 - PLACE
      ?auto_7629 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7631 ?auto_7632 ) ( SURFACE-AT ?auto_7626 ?auto_7632 ) ( CLEAR ?auto_7626 ) ( IS-CRATE ?auto_7627 ) ( not ( = ?auto_7626 ?auto_7627 ) ) ( AVAILABLE ?auto_7631 ) ( ON ?auto_7626 ?auto_7625 ) ( not ( = ?auto_7625 ?auto_7626 ) ) ( not ( = ?auto_7625 ?auto_7627 ) ) ( TRUCK-AT ?auto_7628 ?auto_7630 ) ( not ( = ?auto_7630 ?auto_7632 ) ) ( HOIST-AT ?auto_7629 ?auto_7630 ) ( LIFTING ?auto_7629 ?auto_7627 ) ( not ( = ?auto_7631 ?auto_7629 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7626 ?auto_7627 )
      ( MAKE-2CRATE-VERIFY ?auto_7625 ?auto_7626 ?auto_7627 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7633 - SURFACE
      ?auto_7634 - SURFACE
    )
    :vars
    (
      ?auto_7639 - HOIST
      ?auto_7637 - PLACE
      ?auto_7636 - SURFACE
      ?auto_7635 - TRUCK
      ?auto_7638 - PLACE
      ?auto_7640 - HOIST
      ?auto_7641 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7639 ?auto_7637 ) ( SURFACE-AT ?auto_7633 ?auto_7637 ) ( CLEAR ?auto_7633 ) ( IS-CRATE ?auto_7634 ) ( not ( = ?auto_7633 ?auto_7634 ) ) ( AVAILABLE ?auto_7639 ) ( ON ?auto_7633 ?auto_7636 ) ( not ( = ?auto_7636 ?auto_7633 ) ) ( not ( = ?auto_7636 ?auto_7634 ) ) ( TRUCK-AT ?auto_7635 ?auto_7638 ) ( not ( = ?auto_7638 ?auto_7637 ) ) ( HOIST-AT ?auto_7640 ?auto_7638 ) ( not ( = ?auto_7639 ?auto_7640 ) ) ( AVAILABLE ?auto_7640 ) ( SURFACE-AT ?auto_7634 ?auto_7638 ) ( ON ?auto_7634 ?auto_7641 ) ( CLEAR ?auto_7634 ) ( not ( = ?auto_7633 ?auto_7641 ) ) ( not ( = ?auto_7634 ?auto_7641 ) ) ( not ( = ?auto_7636 ?auto_7641 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7640 ?auto_7634 ?auto_7641 ?auto_7638 )
      ( MAKE-2CRATE ?auto_7636 ?auto_7633 ?auto_7634 )
      ( MAKE-1CRATE-VERIFY ?auto_7633 ?auto_7634 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7642 - SURFACE
      ?auto_7643 - SURFACE
      ?auto_7644 - SURFACE
    )
    :vars
    (
      ?auto_7648 - HOIST
      ?auto_7647 - PLACE
      ?auto_7645 - TRUCK
      ?auto_7646 - PLACE
      ?auto_7650 - HOIST
      ?auto_7649 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7648 ?auto_7647 ) ( SURFACE-AT ?auto_7643 ?auto_7647 ) ( CLEAR ?auto_7643 ) ( IS-CRATE ?auto_7644 ) ( not ( = ?auto_7643 ?auto_7644 ) ) ( AVAILABLE ?auto_7648 ) ( ON ?auto_7643 ?auto_7642 ) ( not ( = ?auto_7642 ?auto_7643 ) ) ( not ( = ?auto_7642 ?auto_7644 ) ) ( TRUCK-AT ?auto_7645 ?auto_7646 ) ( not ( = ?auto_7646 ?auto_7647 ) ) ( HOIST-AT ?auto_7650 ?auto_7646 ) ( not ( = ?auto_7648 ?auto_7650 ) ) ( AVAILABLE ?auto_7650 ) ( SURFACE-AT ?auto_7644 ?auto_7646 ) ( ON ?auto_7644 ?auto_7649 ) ( CLEAR ?auto_7644 ) ( not ( = ?auto_7643 ?auto_7649 ) ) ( not ( = ?auto_7644 ?auto_7649 ) ) ( not ( = ?auto_7642 ?auto_7649 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7643 ?auto_7644 )
      ( MAKE-2CRATE-VERIFY ?auto_7642 ?auto_7643 ?auto_7644 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7651 - SURFACE
      ?auto_7652 - SURFACE
    )
    :vars
    (
      ?auto_7657 - HOIST
      ?auto_7659 - PLACE
      ?auto_7655 - SURFACE
      ?auto_7658 - PLACE
      ?auto_7653 - HOIST
      ?auto_7656 - SURFACE
      ?auto_7654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7657 ?auto_7659 ) ( SURFACE-AT ?auto_7651 ?auto_7659 ) ( CLEAR ?auto_7651 ) ( IS-CRATE ?auto_7652 ) ( not ( = ?auto_7651 ?auto_7652 ) ) ( AVAILABLE ?auto_7657 ) ( ON ?auto_7651 ?auto_7655 ) ( not ( = ?auto_7655 ?auto_7651 ) ) ( not ( = ?auto_7655 ?auto_7652 ) ) ( not ( = ?auto_7658 ?auto_7659 ) ) ( HOIST-AT ?auto_7653 ?auto_7658 ) ( not ( = ?auto_7657 ?auto_7653 ) ) ( AVAILABLE ?auto_7653 ) ( SURFACE-AT ?auto_7652 ?auto_7658 ) ( ON ?auto_7652 ?auto_7656 ) ( CLEAR ?auto_7652 ) ( not ( = ?auto_7651 ?auto_7656 ) ) ( not ( = ?auto_7652 ?auto_7656 ) ) ( not ( = ?auto_7655 ?auto_7656 ) ) ( TRUCK-AT ?auto_7654 ?auto_7659 ) )
    :subtasks
    ( ( !DRIVE ?auto_7654 ?auto_7659 ?auto_7658 )
      ( MAKE-2CRATE ?auto_7655 ?auto_7651 ?auto_7652 )
      ( MAKE-1CRATE-VERIFY ?auto_7651 ?auto_7652 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7660 - SURFACE
      ?auto_7661 - SURFACE
      ?auto_7662 - SURFACE
    )
    :vars
    (
      ?auto_7666 - HOIST
      ?auto_7667 - PLACE
      ?auto_7663 - PLACE
      ?auto_7664 - HOIST
      ?auto_7668 - SURFACE
      ?auto_7665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7666 ?auto_7667 ) ( SURFACE-AT ?auto_7661 ?auto_7667 ) ( CLEAR ?auto_7661 ) ( IS-CRATE ?auto_7662 ) ( not ( = ?auto_7661 ?auto_7662 ) ) ( AVAILABLE ?auto_7666 ) ( ON ?auto_7661 ?auto_7660 ) ( not ( = ?auto_7660 ?auto_7661 ) ) ( not ( = ?auto_7660 ?auto_7662 ) ) ( not ( = ?auto_7663 ?auto_7667 ) ) ( HOIST-AT ?auto_7664 ?auto_7663 ) ( not ( = ?auto_7666 ?auto_7664 ) ) ( AVAILABLE ?auto_7664 ) ( SURFACE-AT ?auto_7662 ?auto_7663 ) ( ON ?auto_7662 ?auto_7668 ) ( CLEAR ?auto_7662 ) ( not ( = ?auto_7661 ?auto_7668 ) ) ( not ( = ?auto_7662 ?auto_7668 ) ) ( not ( = ?auto_7660 ?auto_7668 ) ) ( TRUCK-AT ?auto_7665 ?auto_7667 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7661 ?auto_7662 )
      ( MAKE-2CRATE-VERIFY ?auto_7660 ?auto_7661 ?auto_7662 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7669 - SURFACE
      ?auto_7670 - SURFACE
    )
    :vars
    (
      ?auto_7672 - HOIST
      ?auto_7671 - PLACE
      ?auto_7674 - SURFACE
      ?auto_7677 - PLACE
      ?auto_7673 - HOIST
      ?auto_7675 - SURFACE
      ?auto_7676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7672 ?auto_7671 ) ( IS-CRATE ?auto_7670 ) ( not ( = ?auto_7669 ?auto_7670 ) ) ( not ( = ?auto_7674 ?auto_7669 ) ) ( not ( = ?auto_7674 ?auto_7670 ) ) ( not ( = ?auto_7677 ?auto_7671 ) ) ( HOIST-AT ?auto_7673 ?auto_7677 ) ( not ( = ?auto_7672 ?auto_7673 ) ) ( AVAILABLE ?auto_7673 ) ( SURFACE-AT ?auto_7670 ?auto_7677 ) ( ON ?auto_7670 ?auto_7675 ) ( CLEAR ?auto_7670 ) ( not ( = ?auto_7669 ?auto_7675 ) ) ( not ( = ?auto_7670 ?auto_7675 ) ) ( not ( = ?auto_7674 ?auto_7675 ) ) ( TRUCK-AT ?auto_7676 ?auto_7671 ) ( SURFACE-AT ?auto_7674 ?auto_7671 ) ( CLEAR ?auto_7674 ) ( LIFTING ?auto_7672 ?auto_7669 ) ( IS-CRATE ?auto_7669 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7674 ?auto_7669 )
      ( MAKE-2CRATE ?auto_7674 ?auto_7669 ?auto_7670 )
      ( MAKE-1CRATE-VERIFY ?auto_7669 ?auto_7670 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7678 - SURFACE
      ?auto_7679 - SURFACE
      ?auto_7680 - SURFACE
    )
    :vars
    (
      ?auto_7684 - HOIST
      ?auto_7686 - PLACE
      ?auto_7683 - PLACE
      ?auto_7682 - HOIST
      ?auto_7681 - SURFACE
      ?auto_7685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7684 ?auto_7686 ) ( IS-CRATE ?auto_7680 ) ( not ( = ?auto_7679 ?auto_7680 ) ) ( not ( = ?auto_7678 ?auto_7679 ) ) ( not ( = ?auto_7678 ?auto_7680 ) ) ( not ( = ?auto_7683 ?auto_7686 ) ) ( HOIST-AT ?auto_7682 ?auto_7683 ) ( not ( = ?auto_7684 ?auto_7682 ) ) ( AVAILABLE ?auto_7682 ) ( SURFACE-AT ?auto_7680 ?auto_7683 ) ( ON ?auto_7680 ?auto_7681 ) ( CLEAR ?auto_7680 ) ( not ( = ?auto_7679 ?auto_7681 ) ) ( not ( = ?auto_7680 ?auto_7681 ) ) ( not ( = ?auto_7678 ?auto_7681 ) ) ( TRUCK-AT ?auto_7685 ?auto_7686 ) ( SURFACE-AT ?auto_7678 ?auto_7686 ) ( CLEAR ?auto_7678 ) ( LIFTING ?auto_7684 ?auto_7679 ) ( IS-CRATE ?auto_7679 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7679 ?auto_7680 )
      ( MAKE-2CRATE-VERIFY ?auto_7678 ?auto_7679 ?auto_7680 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7687 - SURFACE
      ?auto_7688 - SURFACE
    )
    :vars
    (
      ?auto_7693 - HOIST
      ?auto_7691 - PLACE
      ?auto_7695 - SURFACE
      ?auto_7694 - PLACE
      ?auto_7690 - HOIST
      ?auto_7689 - SURFACE
      ?auto_7692 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7693 ?auto_7691 ) ( IS-CRATE ?auto_7688 ) ( not ( = ?auto_7687 ?auto_7688 ) ) ( not ( = ?auto_7695 ?auto_7687 ) ) ( not ( = ?auto_7695 ?auto_7688 ) ) ( not ( = ?auto_7694 ?auto_7691 ) ) ( HOIST-AT ?auto_7690 ?auto_7694 ) ( not ( = ?auto_7693 ?auto_7690 ) ) ( AVAILABLE ?auto_7690 ) ( SURFACE-AT ?auto_7688 ?auto_7694 ) ( ON ?auto_7688 ?auto_7689 ) ( CLEAR ?auto_7688 ) ( not ( = ?auto_7687 ?auto_7689 ) ) ( not ( = ?auto_7688 ?auto_7689 ) ) ( not ( = ?auto_7695 ?auto_7689 ) ) ( TRUCK-AT ?auto_7692 ?auto_7691 ) ( SURFACE-AT ?auto_7695 ?auto_7691 ) ( CLEAR ?auto_7695 ) ( IS-CRATE ?auto_7687 ) ( AVAILABLE ?auto_7693 ) ( IN ?auto_7687 ?auto_7692 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7693 ?auto_7687 ?auto_7692 ?auto_7691 )
      ( MAKE-2CRATE ?auto_7695 ?auto_7687 ?auto_7688 )
      ( MAKE-1CRATE-VERIFY ?auto_7687 ?auto_7688 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7696 - SURFACE
      ?auto_7697 - SURFACE
      ?auto_7698 - SURFACE
    )
    :vars
    (
      ?auto_7700 - HOIST
      ?auto_7702 - PLACE
      ?auto_7703 - PLACE
      ?auto_7699 - HOIST
      ?auto_7701 - SURFACE
      ?auto_7704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7700 ?auto_7702 ) ( IS-CRATE ?auto_7698 ) ( not ( = ?auto_7697 ?auto_7698 ) ) ( not ( = ?auto_7696 ?auto_7697 ) ) ( not ( = ?auto_7696 ?auto_7698 ) ) ( not ( = ?auto_7703 ?auto_7702 ) ) ( HOIST-AT ?auto_7699 ?auto_7703 ) ( not ( = ?auto_7700 ?auto_7699 ) ) ( AVAILABLE ?auto_7699 ) ( SURFACE-AT ?auto_7698 ?auto_7703 ) ( ON ?auto_7698 ?auto_7701 ) ( CLEAR ?auto_7698 ) ( not ( = ?auto_7697 ?auto_7701 ) ) ( not ( = ?auto_7698 ?auto_7701 ) ) ( not ( = ?auto_7696 ?auto_7701 ) ) ( TRUCK-AT ?auto_7704 ?auto_7702 ) ( SURFACE-AT ?auto_7696 ?auto_7702 ) ( CLEAR ?auto_7696 ) ( IS-CRATE ?auto_7697 ) ( AVAILABLE ?auto_7700 ) ( IN ?auto_7697 ?auto_7704 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7697 ?auto_7698 )
      ( MAKE-2CRATE-VERIFY ?auto_7696 ?auto_7697 ?auto_7698 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7705 - SURFACE
      ?auto_7706 - SURFACE
    )
    :vars
    (
      ?auto_7711 - HOIST
      ?auto_7707 - PLACE
      ?auto_7709 - SURFACE
      ?auto_7712 - PLACE
      ?auto_7710 - HOIST
      ?auto_7708 - SURFACE
      ?auto_7713 - TRUCK
      ?auto_7714 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7711 ?auto_7707 ) ( IS-CRATE ?auto_7706 ) ( not ( = ?auto_7705 ?auto_7706 ) ) ( not ( = ?auto_7709 ?auto_7705 ) ) ( not ( = ?auto_7709 ?auto_7706 ) ) ( not ( = ?auto_7712 ?auto_7707 ) ) ( HOIST-AT ?auto_7710 ?auto_7712 ) ( not ( = ?auto_7711 ?auto_7710 ) ) ( AVAILABLE ?auto_7710 ) ( SURFACE-AT ?auto_7706 ?auto_7712 ) ( ON ?auto_7706 ?auto_7708 ) ( CLEAR ?auto_7706 ) ( not ( = ?auto_7705 ?auto_7708 ) ) ( not ( = ?auto_7706 ?auto_7708 ) ) ( not ( = ?auto_7709 ?auto_7708 ) ) ( SURFACE-AT ?auto_7709 ?auto_7707 ) ( CLEAR ?auto_7709 ) ( IS-CRATE ?auto_7705 ) ( AVAILABLE ?auto_7711 ) ( IN ?auto_7705 ?auto_7713 ) ( TRUCK-AT ?auto_7713 ?auto_7714 ) ( not ( = ?auto_7714 ?auto_7707 ) ) ( not ( = ?auto_7712 ?auto_7714 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7713 ?auto_7714 ?auto_7707 )
      ( MAKE-2CRATE ?auto_7709 ?auto_7705 ?auto_7706 )
      ( MAKE-1CRATE-VERIFY ?auto_7705 ?auto_7706 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7715 - SURFACE
      ?auto_7716 - SURFACE
      ?auto_7717 - SURFACE
    )
    :vars
    (
      ?auto_7722 - HOIST
      ?auto_7723 - PLACE
      ?auto_7719 - PLACE
      ?auto_7720 - HOIST
      ?auto_7718 - SURFACE
      ?auto_7724 - TRUCK
      ?auto_7721 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7722 ?auto_7723 ) ( IS-CRATE ?auto_7717 ) ( not ( = ?auto_7716 ?auto_7717 ) ) ( not ( = ?auto_7715 ?auto_7716 ) ) ( not ( = ?auto_7715 ?auto_7717 ) ) ( not ( = ?auto_7719 ?auto_7723 ) ) ( HOIST-AT ?auto_7720 ?auto_7719 ) ( not ( = ?auto_7722 ?auto_7720 ) ) ( AVAILABLE ?auto_7720 ) ( SURFACE-AT ?auto_7717 ?auto_7719 ) ( ON ?auto_7717 ?auto_7718 ) ( CLEAR ?auto_7717 ) ( not ( = ?auto_7716 ?auto_7718 ) ) ( not ( = ?auto_7717 ?auto_7718 ) ) ( not ( = ?auto_7715 ?auto_7718 ) ) ( SURFACE-AT ?auto_7715 ?auto_7723 ) ( CLEAR ?auto_7715 ) ( IS-CRATE ?auto_7716 ) ( AVAILABLE ?auto_7722 ) ( IN ?auto_7716 ?auto_7724 ) ( TRUCK-AT ?auto_7724 ?auto_7721 ) ( not ( = ?auto_7721 ?auto_7723 ) ) ( not ( = ?auto_7719 ?auto_7721 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7716 ?auto_7717 )
      ( MAKE-2CRATE-VERIFY ?auto_7715 ?auto_7716 ?auto_7717 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7725 - SURFACE
      ?auto_7726 - SURFACE
    )
    :vars
    (
      ?auto_7729 - HOIST
      ?auto_7727 - PLACE
      ?auto_7733 - SURFACE
      ?auto_7734 - PLACE
      ?auto_7731 - HOIST
      ?auto_7728 - SURFACE
      ?auto_7732 - TRUCK
      ?auto_7730 - PLACE
      ?auto_7735 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7729 ?auto_7727 ) ( IS-CRATE ?auto_7726 ) ( not ( = ?auto_7725 ?auto_7726 ) ) ( not ( = ?auto_7733 ?auto_7725 ) ) ( not ( = ?auto_7733 ?auto_7726 ) ) ( not ( = ?auto_7734 ?auto_7727 ) ) ( HOIST-AT ?auto_7731 ?auto_7734 ) ( not ( = ?auto_7729 ?auto_7731 ) ) ( AVAILABLE ?auto_7731 ) ( SURFACE-AT ?auto_7726 ?auto_7734 ) ( ON ?auto_7726 ?auto_7728 ) ( CLEAR ?auto_7726 ) ( not ( = ?auto_7725 ?auto_7728 ) ) ( not ( = ?auto_7726 ?auto_7728 ) ) ( not ( = ?auto_7733 ?auto_7728 ) ) ( SURFACE-AT ?auto_7733 ?auto_7727 ) ( CLEAR ?auto_7733 ) ( IS-CRATE ?auto_7725 ) ( AVAILABLE ?auto_7729 ) ( TRUCK-AT ?auto_7732 ?auto_7730 ) ( not ( = ?auto_7730 ?auto_7727 ) ) ( not ( = ?auto_7734 ?auto_7730 ) ) ( HOIST-AT ?auto_7735 ?auto_7730 ) ( LIFTING ?auto_7735 ?auto_7725 ) ( not ( = ?auto_7729 ?auto_7735 ) ) ( not ( = ?auto_7731 ?auto_7735 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7735 ?auto_7725 ?auto_7732 ?auto_7730 )
      ( MAKE-2CRATE ?auto_7733 ?auto_7725 ?auto_7726 )
      ( MAKE-1CRATE-VERIFY ?auto_7725 ?auto_7726 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7736 - SURFACE
      ?auto_7737 - SURFACE
      ?auto_7738 - SURFACE
    )
    :vars
    (
      ?auto_7743 - HOIST
      ?auto_7746 - PLACE
      ?auto_7741 - PLACE
      ?auto_7740 - HOIST
      ?auto_7739 - SURFACE
      ?auto_7745 - TRUCK
      ?auto_7742 - PLACE
      ?auto_7744 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7743 ?auto_7746 ) ( IS-CRATE ?auto_7738 ) ( not ( = ?auto_7737 ?auto_7738 ) ) ( not ( = ?auto_7736 ?auto_7737 ) ) ( not ( = ?auto_7736 ?auto_7738 ) ) ( not ( = ?auto_7741 ?auto_7746 ) ) ( HOIST-AT ?auto_7740 ?auto_7741 ) ( not ( = ?auto_7743 ?auto_7740 ) ) ( AVAILABLE ?auto_7740 ) ( SURFACE-AT ?auto_7738 ?auto_7741 ) ( ON ?auto_7738 ?auto_7739 ) ( CLEAR ?auto_7738 ) ( not ( = ?auto_7737 ?auto_7739 ) ) ( not ( = ?auto_7738 ?auto_7739 ) ) ( not ( = ?auto_7736 ?auto_7739 ) ) ( SURFACE-AT ?auto_7736 ?auto_7746 ) ( CLEAR ?auto_7736 ) ( IS-CRATE ?auto_7737 ) ( AVAILABLE ?auto_7743 ) ( TRUCK-AT ?auto_7745 ?auto_7742 ) ( not ( = ?auto_7742 ?auto_7746 ) ) ( not ( = ?auto_7741 ?auto_7742 ) ) ( HOIST-AT ?auto_7744 ?auto_7742 ) ( LIFTING ?auto_7744 ?auto_7737 ) ( not ( = ?auto_7743 ?auto_7744 ) ) ( not ( = ?auto_7740 ?auto_7744 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7737 ?auto_7738 )
      ( MAKE-2CRATE-VERIFY ?auto_7736 ?auto_7737 ?auto_7738 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7747 - SURFACE
      ?auto_7748 - SURFACE
    )
    :vars
    (
      ?auto_7756 - HOIST
      ?auto_7749 - PLACE
      ?auto_7750 - SURFACE
      ?auto_7755 - PLACE
      ?auto_7754 - HOIST
      ?auto_7757 - SURFACE
      ?auto_7751 - TRUCK
      ?auto_7753 - PLACE
      ?auto_7752 - HOIST
      ?auto_7758 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7756 ?auto_7749 ) ( IS-CRATE ?auto_7748 ) ( not ( = ?auto_7747 ?auto_7748 ) ) ( not ( = ?auto_7750 ?auto_7747 ) ) ( not ( = ?auto_7750 ?auto_7748 ) ) ( not ( = ?auto_7755 ?auto_7749 ) ) ( HOIST-AT ?auto_7754 ?auto_7755 ) ( not ( = ?auto_7756 ?auto_7754 ) ) ( AVAILABLE ?auto_7754 ) ( SURFACE-AT ?auto_7748 ?auto_7755 ) ( ON ?auto_7748 ?auto_7757 ) ( CLEAR ?auto_7748 ) ( not ( = ?auto_7747 ?auto_7757 ) ) ( not ( = ?auto_7748 ?auto_7757 ) ) ( not ( = ?auto_7750 ?auto_7757 ) ) ( SURFACE-AT ?auto_7750 ?auto_7749 ) ( CLEAR ?auto_7750 ) ( IS-CRATE ?auto_7747 ) ( AVAILABLE ?auto_7756 ) ( TRUCK-AT ?auto_7751 ?auto_7753 ) ( not ( = ?auto_7753 ?auto_7749 ) ) ( not ( = ?auto_7755 ?auto_7753 ) ) ( HOIST-AT ?auto_7752 ?auto_7753 ) ( not ( = ?auto_7756 ?auto_7752 ) ) ( not ( = ?auto_7754 ?auto_7752 ) ) ( AVAILABLE ?auto_7752 ) ( SURFACE-AT ?auto_7747 ?auto_7753 ) ( ON ?auto_7747 ?auto_7758 ) ( CLEAR ?auto_7747 ) ( not ( = ?auto_7747 ?auto_7758 ) ) ( not ( = ?auto_7748 ?auto_7758 ) ) ( not ( = ?auto_7750 ?auto_7758 ) ) ( not ( = ?auto_7757 ?auto_7758 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7752 ?auto_7747 ?auto_7758 ?auto_7753 )
      ( MAKE-2CRATE ?auto_7750 ?auto_7747 ?auto_7748 )
      ( MAKE-1CRATE-VERIFY ?auto_7747 ?auto_7748 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7759 - SURFACE
      ?auto_7760 - SURFACE
      ?auto_7761 - SURFACE
    )
    :vars
    (
      ?auto_7769 - HOIST
      ?auto_7770 - PLACE
      ?auto_7768 - PLACE
      ?auto_7763 - HOIST
      ?auto_7762 - SURFACE
      ?auto_7767 - TRUCK
      ?auto_7766 - PLACE
      ?auto_7765 - HOIST
      ?auto_7764 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7769 ?auto_7770 ) ( IS-CRATE ?auto_7761 ) ( not ( = ?auto_7760 ?auto_7761 ) ) ( not ( = ?auto_7759 ?auto_7760 ) ) ( not ( = ?auto_7759 ?auto_7761 ) ) ( not ( = ?auto_7768 ?auto_7770 ) ) ( HOIST-AT ?auto_7763 ?auto_7768 ) ( not ( = ?auto_7769 ?auto_7763 ) ) ( AVAILABLE ?auto_7763 ) ( SURFACE-AT ?auto_7761 ?auto_7768 ) ( ON ?auto_7761 ?auto_7762 ) ( CLEAR ?auto_7761 ) ( not ( = ?auto_7760 ?auto_7762 ) ) ( not ( = ?auto_7761 ?auto_7762 ) ) ( not ( = ?auto_7759 ?auto_7762 ) ) ( SURFACE-AT ?auto_7759 ?auto_7770 ) ( CLEAR ?auto_7759 ) ( IS-CRATE ?auto_7760 ) ( AVAILABLE ?auto_7769 ) ( TRUCK-AT ?auto_7767 ?auto_7766 ) ( not ( = ?auto_7766 ?auto_7770 ) ) ( not ( = ?auto_7768 ?auto_7766 ) ) ( HOIST-AT ?auto_7765 ?auto_7766 ) ( not ( = ?auto_7769 ?auto_7765 ) ) ( not ( = ?auto_7763 ?auto_7765 ) ) ( AVAILABLE ?auto_7765 ) ( SURFACE-AT ?auto_7760 ?auto_7766 ) ( ON ?auto_7760 ?auto_7764 ) ( CLEAR ?auto_7760 ) ( not ( = ?auto_7760 ?auto_7764 ) ) ( not ( = ?auto_7761 ?auto_7764 ) ) ( not ( = ?auto_7759 ?auto_7764 ) ) ( not ( = ?auto_7762 ?auto_7764 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7760 ?auto_7761 )
      ( MAKE-2CRATE-VERIFY ?auto_7759 ?auto_7760 ?auto_7761 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7771 - SURFACE
      ?auto_7772 - SURFACE
    )
    :vars
    (
      ?auto_7774 - HOIST
      ?auto_7777 - PLACE
      ?auto_7781 - SURFACE
      ?auto_7775 - PLACE
      ?auto_7773 - HOIST
      ?auto_7776 - SURFACE
      ?auto_7780 - PLACE
      ?auto_7779 - HOIST
      ?auto_7782 - SURFACE
      ?auto_7778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7774 ?auto_7777 ) ( IS-CRATE ?auto_7772 ) ( not ( = ?auto_7771 ?auto_7772 ) ) ( not ( = ?auto_7781 ?auto_7771 ) ) ( not ( = ?auto_7781 ?auto_7772 ) ) ( not ( = ?auto_7775 ?auto_7777 ) ) ( HOIST-AT ?auto_7773 ?auto_7775 ) ( not ( = ?auto_7774 ?auto_7773 ) ) ( AVAILABLE ?auto_7773 ) ( SURFACE-AT ?auto_7772 ?auto_7775 ) ( ON ?auto_7772 ?auto_7776 ) ( CLEAR ?auto_7772 ) ( not ( = ?auto_7771 ?auto_7776 ) ) ( not ( = ?auto_7772 ?auto_7776 ) ) ( not ( = ?auto_7781 ?auto_7776 ) ) ( SURFACE-AT ?auto_7781 ?auto_7777 ) ( CLEAR ?auto_7781 ) ( IS-CRATE ?auto_7771 ) ( AVAILABLE ?auto_7774 ) ( not ( = ?auto_7780 ?auto_7777 ) ) ( not ( = ?auto_7775 ?auto_7780 ) ) ( HOIST-AT ?auto_7779 ?auto_7780 ) ( not ( = ?auto_7774 ?auto_7779 ) ) ( not ( = ?auto_7773 ?auto_7779 ) ) ( AVAILABLE ?auto_7779 ) ( SURFACE-AT ?auto_7771 ?auto_7780 ) ( ON ?auto_7771 ?auto_7782 ) ( CLEAR ?auto_7771 ) ( not ( = ?auto_7771 ?auto_7782 ) ) ( not ( = ?auto_7772 ?auto_7782 ) ) ( not ( = ?auto_7781 ?auto_7782 ) ) ( not ( = ?auto_7776 ?auto_7782 ) ) ( TRUCK-AT ?auto_7778 ?auto_7777 ) )
    :subtasks
    ( ( !DRIVE ?auto_7778 ?auto_7777 ?auto_7780 )
      ( MAKE-2CRATE ?auto_7781 ?auto_7771 ?auto_7772 )
      ( MAKE-1CRATE-VERIFY ?auto_7771 ?auto_7772 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7783 - SURFACE
      ?auto_7784 - SURFACE
      ?auto_7785 - SURFACE
    )
    :vars
    (
      ?auto_7786 - HOIST
      ?auto_7790 - PLACE
      ?auto_7787 - PLACE
      ?auto_7794 - HOIST
      ?auto_7792 - SURFACE
      ?auto_7788 - PLACE
      ?auto_7789 - HOIST
      ?auto_7791 - SURFACE
      ?auto_7793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7786 ?auto_7790 ) ( IS-CRATE ?auto_7785 ) ( not ( = ?auto_7784 ?auto_7785 ) ) ( not ( = ?auto_7783 ?auto_7784 ) ) ( not ( = ?auto_7783 ?auto_7785 ) ) ( not ( = ?auto_7787 ?auto_7790 ) ) ( HOIST-AT ?auto_7794 ?auto_7787 ) ( not ( = ?auto_7786 ?auto_7794 ) ) ( AVAILABLE ?auto_7794 ) ( SURFACE-AT ?auto_7785 ?auto_7787 ) ( ON ?auto_7785 ?auto_7792 ) ( CLEAR ?auto_7785 ) ( not ( = ?auto_7784 ?auto_7792 ) ) ( not ( = ?auto_7785 ?auto_7792 ) ) ( not ( = ?auto_7783 ?auto_7792 ) ) ( SURFACE-AT ?auto_7783 ?auto_7790 ) ( CLEAR ?auto_7783 ) ( IS-CRATE ?auto_7784 ) ( AVAILABLE ?auto_7786 ) ( not ( = ?auto_7788 ?auto_7790 ) ) ( not ( = ?auto_7787 ?auto_7788 ) ) ( HOIST-AT ?auto_7789 ?auto_7788 ) ( not ( = ?auto_7786 ?auto_7789 ) ) ( not ( = ?auto_7794 ?auto_7789 ) ) ( AVAILABLE ?auto_7789 ) ( SURFACE-AT ?auto_7784 ?auto_7788 ) ( ON ?auto_7784 ?auto_7791 ) ( CLEAR ?auto_7784 ) ( not ( = ?auto_7784 ?auto_7791 ) ) ( not ( = ?auto_7785 ?auto_7791 ) ) ( not ( = ?auto_7783 ?auto_7791 ) ) ( not ( = ?auto_7792 ?auto_7791 ) ) ( TRUCK-AT ?auto_7793 ?auto_7790 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7784 ?auto_7785 )
      ( MAKE-2CRATE-VERIFY ?auto_7783 ?auto_7784 ?auto_7785 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7804 - SURFACE
      ?auto_7805 - SURFACE
    )
    :vars
    (
      ?auto_7806 - HOIST
      ?auto_7807 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7806 ?auto_7807 ) ( SURFACE-AT ?auto_7804 ?auto_7807 ) ( CLEAR ?auto_7804 ) ( LIFTING ?auto_7806 ?auto_7805 ) ( IS-CRATE ?auto_7805 ) ( not ( = ?auto_7804 ?auto_7805 ) ) )
    :subtasks
    ( ( !DROP ?auto_7806 ?auto_7805 ?auto_7804 ?auto_7807 )
      ( MAKE-1CRATE-VERIFY ?auto_7804 ?auto_7805 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7808 - SURFACE
      ?auto_7809 - SURFACE
      ?auto_7810 - SURFACE
    )
    :vars
    (
      ?auto_7812 - HOIST
      ?auto_7811 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7812 ?auto_7811 ) ( SURFACE-AT ?auto_7809 ?auto_7811 ) ( CLEAR ?auto_7809 ) ( LIFTING ?auto_7812 ?auto_7810 ) ( IS-CRATE ?auto_7810 ) ( not ( = ?auto_7809 ?auto_7810 ) ) ( ON ?auto_7809 ?auto_7808 ) ( not ( = ?auto_7808 ?auto_7809 ) ) ( not ( = ?auto_7808 ?auto_7810 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7809 ?auto_7810 )
      ( MAKE-2CRATE-VERIFY ?auto_7808 ?auto_7809 ?auto_7810 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7813 - SURFACE
      ?auto_7814 - SURFACE
      ?auto_7815 - SURFACE
      ?auto_7816 - SURFACE
    )
    :vars
    (
      ?auto_7818 - HOIST
      ?auto_7817 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7818 ?auto_7817 ) ( SURFACE-AT ?auto_7815 ?auto_7817 ) ( CLEAR ?auto_7815 ) ( LIFTING ?auto_7818 ?auto_7816 ) ( IS-CRATE ?auto_7816 ) ( not ( = ?auto_7815 ?auto_7816 ) ) ( ON ?auto_7814 ?auto_7813 ) ( ON ?auto_7815 ?auto_7814 ) ( not ( = ?auto_7813 ?auto_7814 ) ) ( not ( = ?auto_7813 ?auto_7815 ) ) ( not ( = ?auto_7813 ?auto_7816 ) ) ( not ( = ?auto_7814 ?auto_7815 ) ) ( not ( = ?auto_7814 ?auto_7816 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7815 ?auto_7816 )
      ( MAKE-3CRATE-VERIFY ?auto_7813 ?auto_7814 ?auto_7815 ?auto_7816 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7819 - SURFACE
      ?auto_7820 - SURFACE
    )
    :vars
    (
      ?auto_7822 - HOIST
      ?auto_7821 - PLACE
      ?auto_7823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7822 ?auto_7821 ) ( SURFACE-AT ?auto_7819 ?auto_7821 ) ( CLEAR ?auto_7819 ) ( IS-CRATE ?auto_7820 ) ( not ( = ?auto_7819 ?auto_7820 ) ) ( TRUCK-AT ?auto_7823 ?auto_7821 ) ( AVAILABLE ?auto_7822 ) ( IN ?auto_7820 ?auto_7823 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7822 ?auto_7820 ?auto_7823 ?auto_7821 )
      ( MAKE-1CRATE ?auto_7819 ?auto_7820 )
      ( MAKE-1CRATE-VERIFY ?auto_7819 ?auto_7820 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7824 - SURFACE
      ?auto_7825 - SURFACE
      ?auto_7826 - SURFACE
    )
    :vars
    (
      ?auto_7829 - HOIST
      ?auto_7828 - PLACE
      ?auto_7827 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7829 ?auto_7828 ) ( SURFACE-AT ?auto_7825 ?auto_7828 ) ( CLEAR ?auto_7825 ) ( IS-CRATE ?auto_7826 ) ( not ( = ?auto_7825 ?auto_7826 ) ) ( TRUCK-AT ?auto_7827 ?auto_7828 ) ( AVAILABLE ?auto_7829 ) ( IN ?auto_7826 ?auto_7827 ) ( ON ?auto_7825 ?auto_7824 ) ( not ( = ?auto_7824 ?auto_7825 ) ) ( not ( = ?auto_7824 ?auto_7826 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7825 ?auto_7826 )
      ( MAKE-2CRATE-VERIFY ?auto_7824 ?auto_7825 ?auto_7826 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7830 - SURFACE
      ?auto_7831 - SURFACE
      ?auto_7832 - SURFACE
      ?auto_7833 - SURFACE
    )
    :vars
    (
      ?auto_7834 - HOIST
      ?auto_7836 - PLACE
      ?auto_7835 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7834 ?auto_7836 ) ( SURFACE-AT ?auto_7832 ?auto_7836 ) ( CLEAR ?auto_7832 ) ( IS-CRATE ?auto_7833 ) ( not ( = ?auto_7832 ?auto_7833 ) ) ( TRUCK-AT ?auto_7835 ?auto_7836 ) ( AVAILABLE ?auto_7834 ) ( IN ?auto_7833 ?auto_7835 ) ( ON ?auto_7832 ?auto_7831 ) ( not ( = ?auto_7831 ?auto_7832 ) ) ( not ( = ?auto_7831 ?auto_7833 ) ) ( ON ?auto_7831 ?auto_7830 ) ( not ( = ?auto_7830 ?auto_7831 ) ) ( not ( = ?auto_7830 ?auto_7832 ) ) ( not ( = ?auto_7830 ?auto_7833 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7831 ?auto_7832 ?auto_7833 )
      ( MAKE-3CRATE-VERIFY ?auto_7830 ?auto_7831 ?auto_7832 ?auto_7833 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7837 - SURFACE
      ?auto_7838 - SURFACE
    )
    :vars
    (
      ?auto_7839 - HOIST
      ?auto_7842 - PLACE
      ?auto_7840 - TRUCK
      ?auto_7841 - SURFACE
      ?auto_7843 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7839 ?auto_7842 ) ( SURFACE-AT ?auto_7837 ?auto_7842 ) ( CLEAR ?auto_7837 ) ( IS-CRATE ?auto_7838 ) ( not ( = ?auto_7837 ?auto_7838 ) ) ( AVAILABLE ?auto_7839 ) ( IN ?auto_7838 ?auto_7840 ) ( ON ?auto_7837 ?auto_7841 ) ( not ( = ?auto_7841 ?auto_7837 ) ) ( not ( = ?auto_7841 ?auto_7838 ) ) ( TRUCK-AT ?auto_7840 ?auto_7843 ) ( not ( = ?auto_7843 ?auto_7842 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_7840 ?auto_7843 ?auto_7842 )
      ( MAKE-2CRATE ?auto_7841 ?auto_7837 ?auto_7838 )
      ( MAKE-1CRATE-VERIFY ?auto_7837 ?auto_7838 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7844 - SURFACE
      ?auto_7845 - SURFACE
      ?auto_7846 - SURFACE
    )
    :vars
    (
      ?auto_7849 - HOIST
      ?auto_7848 - PLACE
      ?auto_7850 - TRUCK
      ?auto_7847 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7849 ?auto_7848 ) ( SURFACE-AT ?auto_7845 ?auto_7848 ) ( CLEAR ?auto_7845 ) ( IS-CRATE ?auto_7846 ) ( not ( = ?auto_7845 ?auto_7846 ) ) ( AVAILABLE ?auto_7849 ) ( IN ?auto_7846 ?auto_7850 ) ( ON ?auto_7845 ?auto_7844 ) ( not ( = ?auto_7844 ?auto_7845 ) ) ( not ( = ?auto_7844 ?auto_7846 ) ) ( TRUCK-AT ?auto_7850 ?auto_7847 ) ( not ( = ?auto_7847 ?auto_7848 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7845 ?auto_7846 )
      ( MAKE-2CRATE-VERIFY ?auto_7844 ?auto_7845 ?auto_7846 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7851 - SURFACE
      ?auto_7852 - SURFACE
      ?auto_7853 - SURFACE
      ?auto_7854 - SURFACE
    )
    :vars
    (
      ?auto_7858 - HOIST
      ?auto_7855 - PLACE
      ?auto_7857 - TRUCK
      ?auto_7856 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7858 ?auto_7855 ) ( SURFACE-AT ?auto_7853 ?auto_7855 ) ( CLEAR ?auto_7853 ) ( IS-CRATE ?auto_7854 ) ( not ( = ?auto_7853 ?auto_7854 ) ) ( AVAILABLE ?auto_7858 ) ( IN ?auto_7854 ?auto_7857 ) ( ON ?auto_7853 ?auto_7852 ) ( not ( = ?auto_7852 ?auto_7853 ) ) ( not ( = ?auto_7852 ?auto_7854 ) ) ( TRUCK-AT ?auto_7857 ?auto_7856 ) ( not ( = ?auto_7856 ?auto_7855 ) ) ( ON ?auto_7852 ?auto_7851 ) ( not ( = ?auto_7851 ?auto_7852 ) ) ( not ( = ?auto_7851 ?auto_7853 ) ) ( not ( = ?auto_7851 ?auto_7854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7852 ?auto_7853 ?auto_7854 )
      ( MAKE-3CRATE-VERIFY ?auto_7851 ?auto_7852 ?auto_7853 ?auto_7854 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7859 - SURFACE
      ?auto_7860 - SURFACE
    )
    :vars
    (
      ?auto_7865 - HOIST
      ?auto_7861 - PLACE
      ?auto_7862 - SURFACE
      ?auto_7864 - TRUCK
      ?auto_7863 - PLACE
      ?auto_7866 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7865 ?auto_7861 ) ( SURFACE-AT ?auto_7859 ?auto_7861 ) ( CLEAR ?auto_7859 ) ( IS-CRATE ?auto_7860 ) ( not ( = ?auto_7859 ?auto_7860 ) ) ( AVAILABLE ?auto_7865 ) ( ON ?auto_7859 ?auto_7862 ) ( not ( = ?auto_7862 ?auto_7859 ) ) ( not ( = ?auto_7862 ?auto_7860 ) ) ( TRUCK-AT ?auto_7864 ?auto_7863 ) ( not ( = ?auto_7863 ?auto_7861 ) ) ( HOIST-AT ?auto_7866 ?auto_7863 ) ( LIFTING ?auto_7866 ?auto_7860 ) ( not ( = ?auto_7865 ?auto_7866 ) ) )
    :subtasks
    ( ( !LOAD ?auto_7866 ?auto_7860 ?auto_7864 ?auto_7863 )
      ( MAKE-2CRATE ?auto_7862 ?auto_7859 ?auto_7860 )
      ( MAKE-1CRATE-VERIFY ?auto_7859 ?auto_7860 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7867 - SURFACE
      ?auto_7868 - SURFACE
      ?auto_7869 - SURFACE
    )
    :vars
    (
      ?auto_7872 - HOIST
      ?auto_7870 - PLACE
      ?auto_7871 - TRUCK
      ?auto_7874 - PLACE
      ?auto_7873 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7872 ?auto_7870 ) ( SURFACE-AT ?auto_7868 ?auto_7870 ) ( CLEAR ?auto_7868 ) ( IS-CRATE ?auto_7869 ) ( not ( = ?auto_7868 ?auto_7869 ) ) ( AVAILABLE ?auto_7872 ) ( ON ?auto_7868 ?auto_7867 ) ( not ( = ?auto_7867 ?auto_7868 ) ) ( not ( = ?auto_7867 ?auto_7869 ) ) ( TRUCK-AT ?auto_7871 ?auto_7874 ) ( not ( = ?auto_7874 ?auto_7870 ) ) ( HOIST-AT ?auto_7873 ?auto_7874 ) ( LIFTING ?auto_7873 ?auto_7869 ) ( not ( = ?auto_7872 ?auto_7873 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7868 ?auto_7869 )
      ( MAKE-2CRATE-VERIFY ?auto_7867 ?auto_7868 ?auto_7869 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7875 - SURFACE
      ?auto_7876 - SURFACE
      ?auto_7877 - SURFACE
      ?auto_7878 - SURFACE
    )
    :vars
    (
      ?auto_7880 - HOIST
      ?auto_7882 - PLACE
      ?auto_7879 - TRUCK
      ?auto_7881 - PLACE
      ?auto_7883 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_7880 ?auto_7882 ) ( SURFACE-AT ?auto_7877 ?auto_7882 ) ( CLEAR ?auto_7877 ) ( IS-CRATE ?auto_7878 ) ( not ( = ?auto_7877 ?auto_7878 ) ) ( AVAILABLE ?auto_7880 ) ( ON ?auto_7877 ?auto_7876 ) ( not ( = ?auto_7876 ?auto_7877 ) ) ( not ( = ?auto_7876 ?auto_7878 ) ) ( TRUCK-AT ?auto_7879 ?auto_7881 ) ( not ( = ?auto_7881 ?auto_7882 ) ) ( HOIST-AT ?auto_7883 ?auto_7881 ) ( LIFTING ?auto_7883 ?auto_7878 ) ( not ( = ?auto_7880 ?auto_7883 ) ) ( ON ?auto_7876 ?auto_7875 ) ( not ( = ?auto_7875 ?auto_7876 ) ) ( not ( = ?auto_7875 ?auto_7877 ) ) ( not ( = ?auto_7875 ?auto_7878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7876 ?auto_7877 ?auto_7878 )
      ( MAKE-3CRATE-VERIFY ?auto_7875 ?auto_7876 ?auto_7877 ?auto_7878 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7884 - SURFACE
      ?auto_7885 - SURFACE
    )
    :vars
    (
      ?auto_7888 - HOIST
      ?auto_7890 - PLACE
      ?auto_7887 - SURFACE
      ?auto_7886 - TRUCK
      ?auto_7889 - PLACE
      ?auto_7891 - HOIST
      ?auto_7892 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7888 ?auto_7890 ) ( SURFACE-AT ?auto_7884 ?auto_7890 ) ( CLEAR ?auto_7884 ) ( IS-CRATE ?auto_7885 ) ( not ( = ?auto_7884 ?auto_7885 ) ) ( AVAILABLE ?auto_7888 ) ( ON ?auto_7884 ?auto_7887 ) ( not ( = ?auto_7887 ?auto_7884 ) ) ( not ( = ?auto_7887 ?auto_7885 ) ) ( TRUCK-AT ?auto_7886 ?auto_7889 ) ( not ( = ?auto_7889 ?auto_7890 ) ) ( HOIST-AT ?auto_7891 ?auto_7889 ) ( not ( = ?auto_7888 ?auto_7891 ) ) ( AVAILABLE ?auto_7891 ) ( SURFACE-AT ?auto_7885 ?auto_7889 ) ( ON ?auto_7885 ?auto_7892 ) ( CLEAR ?auto_7885 ) ( not ( = ?auto_7884 ?auto_7892 ) ) ( not ( = ?auto_7885 ?auto_7892 ) ) ( not ( = ?auto_7887 ?auto_7892 ) ) )
    :subtasks
    ( ( !LIFT ?auto_7891 ?auto_7885 ?auto_7892 ?auto_7889 )
      ( MAKE-2CRATE ?auto_7887 ?auto_7884 ?auto_7885 )
      ( MAKE-1CRATE-VERIFY ?auto_7884 ?auto_7885 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7893 - SURFACE
      ?auto_7894 - SURFACE
      ?auto_7895 - SURFACE
    )
    :vars
    (
      ?auto_7898 - HOIST
      ?auto_7899 - PLACE
      ?auto_7901 - TRUCK
      ?auto_7896 - PLACE
      ?auto_7897 - HOIST
      ?auto_7900 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7898 ?auto_7899 ) ( SURFACE-AT ?auto_7894 ?auto_7899 ) ( CLEAR ?auto_7894 ) ( IS-CRATE ?auto_7895 ) ( not ( = ?auto_7894 ?auto_7895 ) ) ( AVAILABLE ?auto_7898 ) ( ON ?auto_7894 ?auto_7893 ) ( not ( = ?auto_7893 ?auto_7894 ) ) ( not ( = ?auto_7893 ?auto_7895 ) ) ( TRUCK-AT ?auto_7901 ?auto_7896 ) ( not ( = ?auto_7896 ?auto_7899 ) ) ( HOIST-AT ?auto_7897 ?auto_7896 ) ( not ( = ?auto_7898 ?auto_7897 ) ) ( AVAILABLE ?auto_7897 ) ( SURFACE-AT ?auto_7895 ?auto_7896 ) ( ON ?auto_7895 ?auto_7900 ) ( CLEAR ?auto_7895 ) ( not ( = ?auto_7894 ?auto_7900 ) ) ( not ( = ?auto_7895 ?auto_7900 ) ) ( not ( = ?auto_7893 ?auto_7900 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7894 ?auto_7895 )
      ( MAKE-2CRATE-VERIFY ?auto_7893 ?auto_7894 ?auto_7895 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7902 - SURFACE
      ?auto_7903 - SURFACE
      ?auto_7904 - SURFACE
      ?auto_7905 - SURFACE
    )
    :vars
    (
      ?auto_7908 - HOIST
      ?auto_7911 - PLACE
      ?auto_7910 - TRUCK
      ?auto_7906 - PLACE
      ?auto_7909 - HOIST
      ?auto_7907 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_7908 ?auto_7911 ) ( SURFACE-AT ?auto_7904 ?auto_7911 ) ( CLEAR ?auto_7904 ) ( IS-CRATE ?auto_7905 ) ( not ( = ?auto_7904 ?auto_7905 ) ) ( AVAILABLE ?auto_7908 ) ( ON ?auto_7904 ?auto_7903 ) ( not ( = ?auto_7903 ?auto_7904 ) ) ( not ( = ?auto_7903 ?auto_7905 ) ) ( TRUCK-AT ?auto_7910 ?auto_7906 ) ( not ( = ?auto_7906 ?auto_7911 ) ) ( HOIST-AT ?auto_7909 ?auto_7906 ) ( not ( = ?auto_7908 ?auto_7909 ) ) ( AVAILABLE ?auto_7909 ) ( SURFACE-AT ?auto_7905 ?auto_7906 ) ( ON ?auto_7905 ?auto_7907 ) ( CLEAR ?auto_7905 ) ( not ( = ?auto_7904 ?auto_7907 ) ) ( not ( = ?auto_7905 ?auto_7907 ) ) ( not ( = ?auto_7903 ?auto_7907 ) ) ( ON ?auto_7903 ?auto_7902 ) ( not ( = ?auto_7902 ?auto_7903 ) ) ( not ( = ?auto_7902 ?auto_7904 ) ) ( not ( = ?auto_7902 ?auto_7905 ) ) ( not ( = ?auto_7902 ?auto_7907 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7903 ?auto_7904 ?auto_7905 )
      ( MAKE-3CRATE-VERIFY ?auto_7902 ?auto_7903 ?auto_7904 ?auto_7905 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7912 - SURFACE
      ?auto_7913 - SURFACE
    )
    :vars
    (
      ?auto_7916 - HOIST
      ?auto_7920 - PLACE
      ?auto_7919 - SURFACE
      ?auto_7914 - PLACE
      ?auto_7917 - HOIST
      ?auto_7915 - SURFACE
      ?auto_7918 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7916 ?auto_7920 ) ( SURFACE-AT ?auto_7912 ?auto_7920 ) ( CLEAR ?auto_7912 ) ( IS-CRATE ?auto_7913 ) ( not ( = ?auto_7912 ?auto_7913 ) ) ( AVAILABLE ?auto_7916 ) ( ON ?auto_7912 ?auto_7919 ) ( not ( = ?auto_7919 ?auto_7912 ) ) ( not ( = ?auto_7919 ?auto_7913 ) ) ( not ( = ?auto_7914 ?auto_7920 ) ) ( HOIST-AT ?auto_7917 ?auto_7914 ) ( not ( = ?auto_7916 ?auto_7917 ) ) ( AVAILABLE ?auto_7917 ) ( SURFACE-AT ?auto_7913 ?auto_7914 ) ( ON ?auto_7913 ?auto_7915 ) ( CLEAR ?auto_7913 ) ( not ( = ?auto_7912 ?auto_7915 ) ) ( not ( = ?auto_7913 ?auto_7915 ) ) ( not ( = ?auto_7919 ?auto_7915 ) ) ( TRUCK-AT ?auto_7918 ?auto_7920 ) )
    :subtasks
    ( ( !DRIVE ?auto_7918 ?auto_7920 ?auto_7914 )
      ( MAKE-2CRATE ?auto_7919 ?auto_7912 ?auto_7913 )
      ( MAKE-1CRATE-VERIFY ?auto_7912 ?auto_7913 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7921 - SURFACE
      ?auto_7922 - SURFACE
      ?auto_7923 - SURFACE
    )
    :vars
    (
      ?auto_7927 - HOIST
      ?auto_7924 - PLACE
      ?auto_7928 - PLACE
      ?auto_7929 - HOIST
      ?auto_7925 - SURFACE
      ?auto_7926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7927 ?auto_7924 ) ( SURFACE-AT ?auto_7922 ?auto_7924 ) ( CLEAR ?auto_7922 ) ( IS-CRATE ?auto_7923 ) ( not ( = ?auto_7922 ?auto_7923 ) ) ( AVAILABLE ?auto_7927 ) ( ON ?auto_7922 ?auto_7921 ) ( not ( = ?auto_7921 ?auto_7922 ) ) ( not ( = ?auto_7921 ?auto_7923 ) ) ( not ( = ?auto_7928 ?auto_7924 ) ) ( HOIST-AT ?auto_7929 ?auto_7928 ) ( not ( = ?auto_7927 ?auto_7929 ) ) ( AVAILABLE ?auto_7929 ) ( SURFACE-AT ?auto_7923 ?auto_7928 ) ( ON ?auto_7923 ?auto_7925 ) ( CLEAR ?auto_7923 ) ( not ( = ?auto_7922 ?auto_7925 ) ) ( not ( = ?auto_7923 ?auto_7925 ) ) ( not ( = ?auto_7921 ?auto_7925 ) ) ( TRUCK-AT ?auto_7926 ?auto_7924 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7922 ?auto_7923 )
      ( MAKE-2CRATE-VERIFY ?auto_7921 ?auto_7922 ?auto_7923 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7930 - SURFACE
      ?auto_7931 - SURFACE
      ?auto_7932 - SURFACE
      ?auto_7933 - SURFACE
    )
    :vars
    (
      ?auto_7939 - HOIST
      ?auto_7935 - PLACE
      ?auto_7938 - PLACE
      ?auto_7936 - HOIST
      ?auto_7934 - SURFACE
      ?auto_7937 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7939 ?auto_7935 ) ( SURFACE-AT ?auto_7932 ?auto_7935 ) ( CLEAR ?auto_7932 ) ( IS-CRATE ?auto_7933 ) ( not ( = ?auto_7932 ?auto_7933 ) ) ( AVAILABLE ?auto_7939 ) ( ON ?auto_7932 ?auto_7931 ) ( not ( = ?auto_7931 ?auto_7932 ) ) ( not ( = ?auto_7931 ?auto_7933 ) ) ( not ( = ?auto_7938 ?auto_7935 ) ) ( HOIST-AT ?auto_7936 ?auto_7938 ) ( not ( = ?auto_7939 ?auto_7936 ) ) ( AVAILABLE ?auto_7936 ) ( SURFACE-AT ?auto_7933 ?auto_7938 ) ( ON ?auto_7933 ?auto_7934 ) ( CLEAR ?auto_7933 ) ( not ( = ?auto_7932 ?auto_7934 ) ) ( not ( = ?auto_7933 ?auto_7934 ) ) ( not ( = ?auto_7931 ?auto_7934 ) ) ( TRUCK-AT ?auto_7937 ?auto_7935 ) ( ON ?auto_7931 ?auto_7930 ) ( not ( = ?auto_7930 ?auto_7931 ) ) ( not ( = ?auto_7930 ?auto_7932 ) ) ( not ( = ?auto_7930 ?auto_7933 ) ) ( not ( = ?auto_7930 ?auto_7934 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7931 ?auto_7932 ?auto_7933 )
      ( MAKE-3CRATE-VERIFY ?auto_7930 ?auto_7931 ?auto_7932 ?auto_7933 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7940 - SURFACE
      ?auto_7941 - SURFACE
    )
    :vars
    (
      ?auto_7948 - HOIST
      ?auto_7943 - PLACE
      ?auto_7947 - SURFACE
      ?auto_7946 - PLACE
      ?auto_7944 - HOIST
      ?auto_7942 - SURFACE
      ?auto_7945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7948 ?auto_7943 ) ( IS-CRATE ?auto_7941 ) ( not ( = ?auto_7940 ?auto_7941 ) ) ( not ( = ?auto_7947 ?auto_7940 ) ) ( not ( = ?auto_7947 ?auto_7941 ) ) ( not ( = ?auto_7946 ?auto_7943 ) ) ( HOIST-AT ?auto_7944 ?auto_7946 ) ( not ( = ?auto_7948 ?auto_7944 ) ) ( AVAILABLE ?auto_7944 ) ( SURFACE-AT ?auto_7941 ?auto_7946 ) ( ON ?auto_7941 ?auto_7942 ) ( CLEAR ?auto_7941 ) ( not ( = ?auto_7940 ?auto_7942 ) ) ( not ( = ?auto_7941 ?auto_7942 ) ) ( not ( = ?auto_7947 ?auto_7942 ) ) ( TRUCK-AT ?auto_7945 ?auto_7943 ) ( SURFACE-AT ?auto_7947 ?auto_7943 ) ( CLEAR ?auto_7947 ) ( LIFTING ?auto_7948 ?auto_7940 ) ( IS-CRATE ?auto_7940 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7947 ?auto_7940 )
      ( MAKE-2CRATE ?auto_7947 ?auto_7940 ?auto_7941 )
      ( MAKE-1CRATE-VERIFY ?auto_7940 ?auto_7941 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7949 - SURFACE
      ?auto_7950 - SURFACE
      ?auto_7951 - SURFACE
    )
    :vars
    (
      ?auto_7953 - HOIST
      ?auto_7955 - PLACE
      ?auto_7954 - PLACE
      ?auto_7956 - HOIST
      ?auto_7957 - SURFACE
      ?auto_7952 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7953 ?auto_7955 ) ( IS-CRATE ?auto_7951 ) ( not ( = ?auto_7950 ?auto_7951 ) ) ( not ( = ?auto_7949 ?auto_7950 ) ) ( not ( = ?auto_7949 ?auto_7951 ) ) ( not ( = ?auto_7954 ?auto_7955 ) ) ( HOIST-AT ?auto_7956 ?auto_7954 ) ( not ( = ?auto_7953 ?auto_7956 ) ) ( AVAILABLE ?auto_7956 ) ( SURFACE-AT ?auto_7951 ?auto_7954 ) ( ON ?auto_7951 ?auto_7957 ) ( CLEAR ?auto_7951 ) ( not ( = ?auto_7950 ?auto_7957 ) ) ( not ( = ?auto_7951 ?auto_7957 ) ) ( not ( = ?auto_7949 ?auto_7957 ) ) ( TRUCK-AT ?auto_7952 ?auto_7955 ) ( SURFACE-AT ?auto_7949 ?auto_7955 ) ( CLEAR ?auto_7949 ) ( LIFTING ?auto_7953 ?auto_7950 ) ( IS-CRATE ?auto_7950 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7950 ?auto_7951 )
      ( MAKE-2CRATE-VERIFY ?auto_7949 ?auto_7950 ?auto_7951 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7958 - SURFACE
      ?auto_7959 - SURFACE
      ?auto_7960 - SURFACE
      ?auto_7961 - SURFACE
    )
    :vars
    (
      ?auto_7964 - HOIST
      ?auto_7966 - PLACE
      ?auto_7962 - PLACE
      ?auto_7967 - HOIST
      ?auto_7965 - SURFACE
      ?auto_7963 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7964 ?auto_7966 ) ( IS-CRATE ?auto_7961 ) ( not ( = ?auto_7960 ?auto_7961 ) ) ( not ( = ?auto_7959 ?auto_7960 ) ) ( not ( = ?auto_7959 ?auto_7961 ) ) ( not ( = ?auto_7962 ?auto_7966 ) ) ( HOIST-AT ?auto_7967 ?auto_7962 ) ( not ( = ?auto_7964 ?auto_7967 ) ) ( AVAILABLE ?auto_7967 ) ( SURFACE-AT ?auto_7961 ?auto_7962 ) ( ON ?auto_7961 ?auto_7965 ) ( CLEAR ?auto_7961 ) ( not ( = ?auto_7960 ?auto_7965 ) ) ( not ( = ?auto_7961 ?auto_7965 ) ) ( not ( = ?auto_7959 ?auto_7965 ) ) ( TRUCK-AT ?auto_7963 ?auto_7966 ) ( SURFACE-AT ?auto_7959 ?auto_7966 ) ( CLEAR ?auto_7959 ) ( LIFTING ?auto_7964 ?auto_7960 ) ( IS-CRATE ?auto_7960 ) ( ON ?auto_7959 ?auto_7958 ) ( not ( = ?auto_7958 ?auto_7959 ) ) ( not ( = ?auto_7958 ?auto_7960 ) ) ( not ( = ?auto_7958 ?auto_7961 ) ) ( not ( = ?auto_7958 ?auto_7965 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7959 ?auto_7960 ?auto_7961 )
      ( MAKE-3CRATE-VERIFY ?auto_7958 ?auto_7959 ?auto_7960 ?auto_7961 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7968 - SURFACE
      ?auto_7969 - SURFACE
    )
    :vars
    (
      ?auto_7973 - HOIST
      ?auto_7975 - PLACE
      ?auto_7970 - SURFACE
      ?auto_7971 - PLACE
      ?auto_7976 - HOIST
      ?auto_7974 - SURFACE
      ?auto_7972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7973 ?auto_7975 ) ( IS-CRATE ?auto_7969 ) ( not ( = ?auto_7968 ?auto_7969 ) ) ( not ( = ?auto_7970 ?auto_7968 ) ) ( not ( = ?auto_7970 ?auto_7969 ) ) ( not ( = ?auto_7971 ?auto_7975 ) ) ( HOIST-AT ?auto_7976 ?auto_7971 ) ( not ( = ?auto_7973 ?auto_7976 ) ) ( AVAILABLE ?auto_7976 ) ( SURFACE-AT ?auto_7969 ?auto_7971 ) ( ON ?auto_7969 ?auto_7974 ) ( CLEAR ?auto_7969 ) ( not ( = ?auto_7968 ?auto_7974 ) ) ( not ( = ?auto_7969 ?auto_7974 ) ) ( not ( = ?auto_7970 ?auto_7974 ) ) ( TRUCK-AT ?auto_7972 ?auto_7975 ) ( SURFACE-AT ?auto_7970 ?auto_7975 ) ( CLEAR ?auto_7970 ) ( IS-CRATE ?auto_7968 ) ( AVAILABLE ?auto_7973 ) ( IN ?auto_7968 ?auto_7972 ) )
    :subtasks
    ( ( !UNLOAD ?auto_7973 ?auto_7968 ?auto_7972 ?auto_7975 )
      ( MAKE-2CRATE ?auto_7970 ?auto_7968 ?auto_7969 )
      ( MAKE-1CRATE-VERIFY ?auto_7968 ?auto_7969 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_7977 - SURFACE
      ?auto_7978 - SURFACE
      ?auto_7979 - SURFACE
    )
    :vars
    (
      ?auto_7981 - HOIST
      ?auto_7983 - PLACE
      ?auto_7980 - PLACE
      ?auto_7985 - HOIST
      ?auto_7984 - SURFACE
      ?auto_7982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7981 ?auto_7983 ) ( IS-CRATE ?auto_7979 ) ( not ( = ?auto_7978 ?auto_7979 ) ) ( not ( = ?auto_7977 ?auto_7978 ) ) ( not ( = ?auto_7977 ?auto_7979 ) ) ( not ( = ?auto_7980 ?auto_7983 ) ) ( HOIST-AT ?auto_7985 ?auto_7980 ) ( not ( = ?auto_7981 ?auto_7985 ) ) ( AVAILABLE ?auto_7985 ) ( SURFACE-AT ?auto_7979 ?auto_7980 ) ( ON ?auto_7979 ?auto_7984 ) ( CLEAR ?auto_7979 ) ( not ( = ?auto_7978 ?auto_7984 ) ) ( not ( = ?auto_7979 ?auto_7984 ) ) ( not ( = ?auto_7977 ?auto_7984 ) ) ( TRUCK-AT ?auto_7982 ?auto_7983 ) ( SURFACE-AT ?auto_7977 ?auto_7983 ) ( CLEAR ?auto_7977 ) ( IS-CRATE ?auto_7978 ) ( AVAILABLE ?auto_7981 ) ( IN ?auto_7978 ?auto_7982 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_7978 ?auto_7979 )
      ( MAKE-2CRATE-VERIFY ?auto_7977 ?auto_7978 ?auto_7979 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_7986 - SURFACE
      ?auto_7987 - SURFACE
      ?auto_7988 - SURFACE
      ?auto_7989 - SURFACE
    )
    :vars
    (
      ?auto_7993 - HOIST
      ?auto_7994 - PLACE
      ?auto_7995 - PLACE
      ?auto_7992 - HOIST
      ?auto_7990 - SURFACE
      ?auto_7991 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_7993 ?auto_7994 ) ( IS-CRATE ?auto_7989 ) ( not ( = ?auto_7988 ?auto_7989 ) ) ( not ( = ?auto_7987 ?auto_7988 ) ) ( not ( = ?auto_7987 ?auto_7989 ) ) ( not ( = ?auto_7995 ?auto_7994 ) ) ( HOIST-AT ?auto_7992 ?auto_7995 ) ( not ( = ?auto_7993 ?auto_7992 ) ) ( AVAILABLE ?auto_7992 ) ( SURFACE-AT ?auto_7989 ?auto_7995 ) ( ON ?auto_7989 ?auto_7990 ) ( CLEAR ?auto_7989 ) ( not ( = ?auto_7988 ?auto_7990 ) ) ( not ( = ?auto_7989 ?auto_7990 ) ) ( not ( = ?auto_7987 ?auto_7990 ) ) ( TRUCK-AT ?auto_7991 ?auto_7994 ) ( SURFACE-AT ?auto_7987 ?auto_7994 ) ( CLEAR ?auto_7987 ) ( IS-CRATE ?auto_7988 ) ( AVAILABLE ?auto_7993 ) ( IN ?auto_7988 ?auto_7991 ) ( ON ?auto_7987 ?auto_7986 ) ( not ( = ?auto_7986 ?auto_7987 ) ) ( not ( = ?auto_7986 ?auto_7988 ) ) ( not ( = ?auto_7986 ?auto_7989 ) ) ( not ( = ?auto_7986 ?auto_7990 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_7987 ?auto_7988 ?auto_7989 )
      ( MAKE-3CRATE-VERIFY ?auto_7986 ?auto_7987 ?auto_7988 ?auto_7989 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_7996 - SURFACE
      ?auto_7997 - SURFACE
    )
    :vars
    (
      ?auto_8002 - HOIST
      ?auto_8003 - PLACE
      ?auto_7999 - SURFACE
      ?auto_8004 - PLACE
      ?auto_8001 - HOIST
      ?auto_7998 - SURFACE
      ?auto_8000 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8002 ?auto_8003 ) ( IS-CRATE ?auto_7997 ) ( not ( = ?auto_7996 ?auto_7997 ) ) ( not ( = ?auto_7999 ?auto_7996 ) ) ( not ( = ?auto_7999 ?auto_7997 ) ) ( not ( = ?auto_8004 ?auto_8003 ) ) ( HOIST-AT ?auto_8001 ?auto_8004 ) ( not ( = ?auto_8002 ?auto_8001 ) ) ( AVAILABLE ?auto_8001 ) ( SURFACE-AT ?auto_7997 ?auto_8004 ) ( ON ?auto_7997 ?auto_7998 ) ( CLEAR ?auto_7997 ) ( not ( = ?auto_7996 ?auto_7998 ) ) ( not ( = ?auto_7997 ?auto_7998 ) ) ( not ( = ?auto_7999 ?auto_7998 ) ) ( SURFACE-AT ?auto_7999 ?auto_8003 ) ( CLEAR ?auto_7999 ) ( IS-CRATE ?auto_7996 ) ( AVAILABLE ?auto_8002 ) ( IN ?auto_7996 ?auto_8000 ) ( TRUCK-AT ?auto_8000 ?auto_8004 ) )
    :subtasks
    ( ( !DRIVE ?auto_8000 ?auto_8004 ?auto_8003 )
      ( MAKE-2CRATE ?auto_7999 ?auto_7996 ?auto_7997 )
      ( MAKE-1CRATE-VERIFY ?auto_7996 ?auto_7997 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8005 - SURFACE
      ?auto_8006 - SURFACE
      ?auto_8007 - SURFACE
    )
    :vars
    (
      ?auto_8009 - HOIST
      ?auto_8013 - PLACE
      ?auto_8010 - PLACE
      ?auto_8008 - HOIST
      ?auto_8012 - SURFACE
      ?auto_8011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8009 ?auto_8013 ) ( IS-CRATE ?auto_8007 ) ( not ( = ?auto_8006 ?auto_8007 ) ) ( not ( = ?auto_8005 ?auto_8006 ) ) ( not ( = ?auto_8005 ?auto_8007 ) ) ( not ( = ?auto_8010 ?auto_8013 ) ) ( HOIST-AT ?auto_8008 ?auto_8010 ) ( not ( = ?auto_8009 ?auto_8008 ) ) ( AVAILABLE ?auto_8008 ) ( SURFACE-AT ?auto_8007 ?auto_8010 ) ( ON ?auto_8007 ?auto_8012 ) ( CLEAR ?auto_8007 ) ( not ( = ?auto_8006 ?auto_8012 ) ) ( not ( = ?auto_8007 ?auto_8012 ) ) ( not ( = ?auto_8005 ?auto_8012 ) ) ( SURFACE-AT ?auto_8005 ?auto_8013 ) ( CLEAR ?auto_8005 ) ( IS-CRATE ?auto_8006 ) ( AVAILABLE ?auto_8009 ) ( IN ?auto_8006 ?auto_8011 ) ( TRUCK-AT ?auto_8011 ?auto_8010 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8006 ?auto_8007 )
      ( MAKE-2CRATE-VERIFY ?auto_8005 ?auto_8006 ?auto_8007 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8014 - SURFACE
      ?auto_8015 - SURFACE
      ?auto_8016 - SURFACE
      ?auto_8017 - SURFACE
    )
    :vars
    (
      ?auto_8020 - HOIST
      ?auto_8023 - PLACE
      ?auto_8019 - PLACE
      ?auto_8021 - HOIST
      ?auto_8018 - SURFACE
      ?auto_8022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8020 ?auto_8023 ) ( IS-CRATE ?auto_8017 ) ( not ( = ?auto_8016 ?auto_8017 ) ) ( not ( = ?auto_8015 ?auto_8016 ) ) ( not ( = ?auto_8015 ?auto_8017 ) ) ( not ( = ?auto_8019 ?auto_8023 ) ) ( HOIST-AT ?auto_8021 ?auto_8019 ) ( not ( = ?auto_8020 ?auto_8021 ) ) ( AVAILABLE ?auto_8021 ) ( SURFACE-AT ?auto_8017 ?auto_8019 ) ( ON ?auto_8017 ?auto_8018 ) ( CLEAR ?auto_8017 ) ( not ( = ?auto_8016 ?auto_8018 ) ) ( not ( = ?auto_8017 ?auto_8018 ) ) ( not ( = ?auto_8015 ?auto_8018 ) ) ( SURFACE-AT ?auto_8015 ?auto_8023 ) ( CLEAR ?auto_8015 ) ( IS-CRATE ?auto_8016 ) ( AVAILABLE ?auto_8020 ) ( IN ?auto_8016 ?auto_8022 ) ( TRUCK-AT ?auto_8022 ?auto_8019 ) ( ON ?auto_8015 ?auto_8014 ) ( not ( = ?auto_8014 ?auto_8015 ) ) ( not ( = ?auto_8014 ?auto_8016 ) ) ( not ( = ?auto_8014 ?auto_8017 ) ) ( not ( = ?auto_8014 ?auto_8018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8015 ?auto_8016 ?auto_8017 )
      ( MAKE-3CRATE-VERIFY ?auto_8014 ?auto_8015 ?auto_8016 ?auto_8017 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8024 - SURFACE
      ?auto_8025 - SURFACE
    )
    :vars
    (
      ?auto_8028 - HOIST
      ?auto_8032 - PLACE
      ?auto_8031 - SURFACE
      ?auto_8027 - PLACE
      ?auto_8029 - HOIST
      ?auto_8026 - SURFACE
      ?auto_8030 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8028 ?auto_8032 ) ( IS-CRATE ?auto_8025 ) ( not ( = ?auto_8024 ?auto_8025 ) ) ( not ( = ?auto_8031 ?auto_8024 ) ) ( not ( = ?auto_8031 ?auto_8025 ) ) ( not ( = ?auto_8027 ?auto_8032 ) ) ( HOIST-AT ?auto_8029 ?auto_8027 ) ( not ( = ?auto_8028 ?auto_8029 ) ) ( SURFACE-AT ?auto_8025 ?auto_8027 ) ( ON ?auto_8025 ?auto_8026 ) ( CLEAR ?auto_8025 ) ( not ( = ?auto_8024 ?auto_8026 ) ) ( not ( = ?auto_8025 ?auto_8026 ) ) ( not ( = ?auto_8031 ?auto_8026 ) ) ( SURFACE-AT ?auto_8031 ?auto_8032 ) ( CLEAR ?auto_8031 ) ( IS-CRATE ?auto_8024 ) ( AVAILABLE ?auto_8028 ) ( TRUCK-AT ?auto_8030 ?auto_8027 ) ( LIFTING ?auto_8029 ?auto_8024 ) )
    :subtasks
    ( ( !LOAD ?auto_8029 ?auto_8024 ?auto_8030 ?auto_8027 )
      ( MAKE-2CRATE ?auto_8031 ?auto_8024 ?auto_8025 )
      ( MAKE-1CRATE-VERIFY ?auto_8024 ?auto_8025 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8033 - SURFACE
      ?auto_8034 - SURFACE
      ?auto_8035 - SURFACE
    )
    :vars
    (
      ?auto_8036 - HOIST
      ?auto_8039 - PLACE
      ?auto_8040 - PLACE
      ?auto_8041 - HOIST
      ?auto_8038 - SURFACE
      ?auto_8037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8036 ?auto_8039 ) ( IS-CRATE ?auto_8035 ) ( not ( = ?auto_8034 ?auto_8035 ) ) ( not ( = ?auto_8033 ?auto_8034 ) ) ( not ( = ?auto_8033 ?auto_8035 ) ) ( not ( = ?auto_8040 ?auto_8039 ) ) ( HOIST-AT ?auto_8041 ?auto_8040 ) ( not ( = ?auto_8036 ?auto_8041 ) ) ( SURFACE-AT ?auto_8035 ?auto_8040 ) ( ON ?auto_8035 ?auto_8038 ) ( CLEAR ?auto_8035 ) ( not ( = ?auto_8034 ?auto_8038 ) ) ( not ( = ?auto_8035 ?auto_8038 ) ) ( not ( = ?auto_8033 ?auto_8038 ) ) ( SURFACE-AT ?auto_8033 ?auto_8039 ) ( CLEAR ?auto_8033 ) ( IS-CRATE ?auto_8034 ) ( AVAILABLE ?auto_8036 ) ( TRUCK-AT ?auto_8037 ?auto_8040 ) ( LIFTING ?auto_8041 ?auto_8034 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8034 ?auto_8035 )
      ( MAKE-2CRATE-VERIFY ?auto_8033 ?auto_8034 ?auto_8035 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8042 - SURFACE
      ?auto_8043 - SURFACE
      ?auto_8044 - SURFACE
      ?auto_8045 - SURFACE
    )
    :vars
    (
      ?auto_8049 - HOIST
      ?auto_8046 - PLACE
      ?auto_8047 - PLACE
      ?auto_8051 - HOIST
      ?auto_8048 - SURFACE
      ?auto_8050 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8049 ?auto_8046 ) ( IS-CRATE ?auto_8045 ) ( not ( = ?auto_8044 ?auto_8045 ) ) ( not ( = ?auto_8043 ?auto_8044 ) ) ( not ( = ?auto_8043 ?auto_8045 ) ) ( not ( = ?auto_8047 ?auto_8046 ) ) ( HOIST-AT ?auto_8051 ?auto_8047 ) ( not ( = ?auto_8049 ?auto_8051 ) ) ( SURFACE-AT ?auto_8045 ?auto_8047 ) ( ON ?auto_8045 ?auto_8048 ) ( CLEAR ?auto_8045 ) ( not ( = ?auto_8044 ?auto_8048 ) ) ( not ( = ?auto_8045 ?auto_8048 ) ) ( not ( = ?auto_8043 ?auto_8048 ) ) ( SURFACE-AT ?auto_8043 ?auto_8046 ) ( CLEAR ?auto_8043 ) ( IS-CRATE ?auto_8044 ) ( AVAILABLE ?auto_8049 ) ( TRUCK-AT ?auto_8050 ?auto_8047 ) ( LIFTING ?auto_8051 ?auto_8044 ) ( ON ?auto_8043 ?auto_8042 ) ( not ( = ?auto_8042 ?auto_8043 ) ) ( not ( = ?auto_8042 ?auto_8044 ) ) ( not ( = ?auto_8042 ?auto_8045 ) ) ( not ( = ?auto_8042 ?auto_8048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8043 ?auto_8044 ?auto_8045 )
      ( MAKE-3CRATE-VERIFY ?auto_8042 ?auto_8043 ?auto_8044 ?auto_8045 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8052 - SURFACE
      ?auto_8053 - SURFACE
    )
    :vars
    (
      ?auto_8057 - HOIST
      ?auto_8054 - PLACE
      ?auto_8060 - SURFACE
      ?auto_8055 - PLACE
      ?auto_8059 - HOIST
      ?auto_8056 - SURFACE
      ?auto_8058 - TRUCK
      ?auto_8061 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8057 ?auto_8054 ) ( IS-CRATE ?auto_8053 ) ( not ( = ?auto_8052 ?auto_8053 ) ) ( not ( = ?auto_8060 ?auto_8052 ) ) ( not ( = ?auto_8060 ?auto_8053 ) ) ( not ( = ?auto_8055 ?auto_8054 ) ) ( HOIST-AT ?auto_8059 ?auto_8055 ) ( not ( = ?auto_8057 ?auto_8059 ) ) ( SURFACE-AT ?auto_8053 ?auto_8055 ) ( ON ?auto_8053 ?auto_8056 ) ( CLEAR ?auto_8053 ) ( not ( = ?auto_8052 ?auto_8056 ) ) ( not ( = ?auto_8053 ?auto_8056 ) ) ( not ( = ?auto_8060 ?auto_8056 ) ) ( SURFACE-AT ?auto_8060 ?auto_8054 ) ( CLEAR ?auto_8060 ) ( IS-CRATE ?auto_8052 ) ( AVAILABLE ?auto_8057 ) ( TRUCK-AT ?auto_8058 ?auto_8055 ) ( AVAILABLE ?auto_8059 ) ( SURFACE-AT ?auto_8052 ?auto_8055 ) ( ON ?auto_8052 ?auto_8061 ) ( CLEAR ?auto_8052 ) ( not ( = ?auto_8052 ?auto_8061 ) ) ( not ( = ?auto_8053 ?auto_8061 ) ) ( not ( = ?auto_8060 ?auto_8061 ) ) ( not ( = ?auto_8056 ?auto_8061 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8059 ?auto_8052 ?auto_8061 ?auto_8055 )
      ( MAKE-2CRATE ?auto_8060 ?auto_8052 ?auto_8053 )
      ( MAKE-1CRATE-VERIFY ?auto_8052 ?auto_8053 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8062 - SURFACE
      ?auto_8063 - SURFACE
      ?auto_8064 - SURFACE
    )
    :vars
    (
      ?auto_8070 - HOIST
      ?auto_8068 - PLACE
      ?auto_8066 - PLACE
      ?auto_8071 - HOIST
      ?auto_8065 - SURFACE
      ?auto_8069 - TRUCK
      ?auto_8067 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8070 ?auto_8068 ) ( IS-CRATE ?auto_8064 ) ( not ( = ?auto_8063 ?auto_8064 ) ) ( not ( = ?auto_8062 ?auto_8063 ) ) ( not ( = ?auto_8062 ?auto_8064 ) ) ( not ( = ?auto_8066 ?auto_8068 ) ) ( HOIST-AT ?auto_8071 ?auto_8066 ) ( not ( = ?auto_8070 ?auto_8071 ) ) ( SURFACE-AT ?auto_8064 ?auto_8066 ) ( ON ?auto_8064 ?auto_8065 ) ( CLEAR ?auto_8064 ) ( not ( = ?auto_8063 ?auto_8065 ) ) ( not ( = ?auto_8064 ?auto_8065 ) ) ( not ( = ?auto_8062 ?auto_8065 ) ) ( SURFACE-AT ?auto_8062 ?auto_8068 ) ( CLEAR ?auto_8062 ) ( IS-CRATE ?auto_8063 ) ( AVAILABLE ?auto_8070 ) ( TRUCK-AT ?auto_8069 ?auto_8066 ) ( AVAILABLE ?auto_8071 ) ( SURFACE-AT ?auto_8063 ?auto_8066 ) ( ON ?auto_8063 ?auto_8067 ) ( CLEAR ?auto_8063 ) ( not ( = ?auto_8063 ?auto_8067 ) ) ( not ( = ?auto_8064 ?auto_8067 ) ) ( not ( = ?auto_8062 ?auto_8067 ) ) ( not ( = ?auto_8065 ?auto_8067 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8063 ?auto_8064 )
      ( MAKE-2CRATE-VERIFY ?auto_8062 ?auto_8063 ?auto_8064 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8072 - SURFACE
      ?auto_8073 - SURFACE
      ?auto_8074 - SURFACE
      ?auto_8075 - SURFACE
    )
    :vars
    (
      ?auto_8081 - HOIST
      ?auto_8077 - PLACE
      ?auto_8078 - PLACE
      ?auto_8079 - HOIST
      ?auto_8080 - SURFACE
      ?auto_8082 - TRUCK
      ?auto_8076 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8081 ?auto_8077 ) ( IS-CRATE ?auto_8075 ) ( not ( = ?auto_8074 ?auto_8075 ) ) ( not ( = ?auto_8073 ?auto_8074 ) ) ( not ( = ?auto_8073 ?auto_8075 ) ) ( not ( = ?auto_8078 ?auto_8077 ) ) ( HOIST-AT ?auto_8079 ?auto_8078 ) ( not ( = ?auto_8081 ?auto_8079 ) ) ( SURFACE-AT ?auto_8075 ?auto_8078 ) ( ON ?auto_8075 ?auto_8080 ) ( CLEAR ?auto_8075 ) ( not ( = ?auto_8074 ?auto_8080 ) ) ( not ( = ?auto_8075 ?auto_8080 ) ) ( not ( = ?auto_8073 ?auto_8080 ) ) ( SURFACE-AT ?auto_8073 ?auto_8077 ) ( CLEAR ?auto_8073 ) ( IS-CRATE ?auto_8074 ) ( AVAILABLE ?auto_8081 ) ( TRUCK-AT ?auto_8082 ?auto_8078 ) ( AVAILABLE ?auto_8079 ) ( SURFACE-AT ?auto_8074 ?auto_8078 ) ( ON ?auto_8074 ?auto_8076 ) ( CLEAR ?auto_8074 ) ( not ( = ?auto_8074 ?auto_8076 ) ) ( not ( = ?auto_8075 ?auto_8076 ) ) ( not ( = ?auto_8073 ?auto_8076 ) ) ( not ( = ?auto_8080 ?auto_8076 ) ) ( ON ?auto_8073 ?auto_8072 ) ( not ( = ?auto_8072 ?auto_8073 ) ) ( not ( = ?auto_8072 ?auto_8074 ) ) ( not ( = ?auto_8072 ?auto_8075 ) ) ( not ( = ?auto_8072 ?auto_8080 ) ) ( not ( = ?auto_8072 ?auto_8076 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8073 ?auto_8074 ?auto_8075 )
      ( MAKE-3CRATE-VERIFY ?auto_8072 ?auto_8073 ?auto_8074 ?auto_8075 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8083 - SURFACE
      ?auto_8084 - SURFACE
    )
    :vars
    (
      ?auto_8091 - HOIST
      ?auto_8086 - PLACE
      ?auto_8088 - SURFACE
      ?auto_8087 - PLACE
      ?auto_8089 - HOIST
      ?auto_8090 - SURFACE
      ?auto_8085 - SURFACE
      ?auto_8092 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8091 ?auto_8086 ) ( IS-CRATE ?auto_8084 ) ( not ( = ?auto_8083 ?auto_8084 ) ) ( not ( = ?auto_8088 ?auto_8083 ) ) ( not ( = ?auto_8088 ?auto_8084 ) ) ( not ( = ?auto_8087 ?auto_8086 ) ) ( HOIST-AT ?auto_8089 ?auto_8087 ) ( not ( = ?auto_8091 ?auto_8089 ) ) ( SURFACE-AT ?auto_8084 ?auto_8087 ) ( ON ?auto_8084 ?auto_8090 ) ( CLEAR ?auto_8084 ) ( not ( = ?auto_8083 ?auto_8090 ) ) ( not ( = ?auto_8084 ?auto_8090 ) ) ( not ( = ?auto_8088 ?auto_8090 ) ) ( SURFACE-AT ?auto_8088 ?auto_8086 ) ( CLEAR ?auto_8088 ) ( IS-CRATE ?auto_8083 ) ( AVAILABLE ?auto_8091 ) ( AVAILABLE ?auto_8089 ) ( SURFACE-AT ?auto_8083 ?auto_8087 ) ( ON ?auto_8083 ?auto_8085 ) ( CLEAR ?auto_8083 ) ( not ( = ?auto_8083 ?auto_8085 ) ) ( not ( = ?auto_8084 ?auto_8085 ) ) ( not ( = ?auto_8088 ?auto_8085 ) ) ( not ( = ?auto_8090 ?auto_8085 ) ) ( TRUCK-AT ?auto_8092 ?auto_8086 ) )
    :subtasks
    ( ( !DRIVE ?auto_8092 ?auto_8086 ?auto_8087 )
      ( MAKE-2CRATE ?auto_8088 ?auto_8083 ?auto_8084 )
      ( MAKE-1CRATE-VERIFY ?auto_8083 ?auto_8084 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8093 - SURFACE
      ?auto_8094 - SURFACE
      ?auto_8095 - SURFACE
    )
    :vars
    (
      ?auto_8097 - HOIST
      ?auto_8096 - PLACE
      ?auto_8100 - PLACE
      ?auto_8099 - HOIST
      ?auto_8098 - SURFACE
      ?auto_8102 - SURFACE
      ?auto_8101 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8097 ?auto_8096 ) ( IS-CRATE ?auto_8095 ) ( not ( = ?auto_8094 ?auto_8095 ) ) ( not ( = ?auto_8093 ?auto_8094 ) ) ( not ( = ?auto_8093 ?auto_8095 ) ) ( not ( = ?auto_8100 ?auto_8096 ) ) ( HOIST-AT ?auto_8099 ?auto_8100 ) ( not ( = ?auto_8097 ?auto_8099 ) ) ( SURFACE-AT ?auto_8095 ?auto_8100 ) ( ON ?auto_8095 ?auto_8098 ) ( CLEAR ?auto_8095 ) ( not ( = ?auto_8094 ?auto_8098 ) ) ( not ( = ?auto_8095 ?auto_8098 ) ) ( not ( = ?auto_8093 ?auto_8098 ) ) ( SURFACE-AT ?auto_8093 ?auto_8096 ) ( CLEAR ?auto_8093 ) ( IS-CRATE ?auto_8094 ) ( AVAILABLE ?auto_8097 ) ( AVAILABLE ?auto_8099 ) ( SURFACE-AT ?auto_8094 ?auto_8100 ) ( ON ?auto_8094 ?auto_8102 ) ( CLEAR ?auto_8094 ) ( not ( = ?auto_8094 ?auto_8102 ) ) ( not ( = ?auto_8095 ?auto_8102 ) ) ( not ( = ?auto_8093 ?auto_8102 ) ) ( not ( = ?auto_8098 ?auto_8102 ) ) ( TRUCK-AT ?auto_8101 ?auto_8096 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8094 ?auto_8095 )
      ( MAKE-2CRATE-VERIFY ?auto_8093 ?auto_8094 ?auto_8095 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8103 - SURFACE
      ?auto_8104 - SURFACE
      ?auto_8105 - SURFACE
      ?auto_8106 - SURFACE
    )
    :vars
    (
      ?auto_8109 - HOIST
      ?auto_8112 - PLACE
      ?auto_8108 - PLACE
      ?auto_8113 - HOIST
      ?auto_8110 - SURFACE
      ?auto_8111 - SURFACE
      ?auto_8107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8109 ?auto_8112 ) ( IS-CRATE ?auto_8106 ) ( not ( = ?auto_8105 ?auto_8106 ) ) ( not ( = ?auto_8104 ?auto_8105 ) ) ( not ( = ?auto_8104 ?auto_8106 ) ) ( not ( = ?auto_8108 ?auto_8112 ) ) ( HOIST-AT ?auto_8113 ?auto_8108 ) ( not ( = ?auto_8109 ?auto_8113 ) ) ( SURFACE-AT ?auto_8106 ?auto_8108 ) ( ON ?auto_8106 ?auto_8110 ) ( CLEAR ?auto_8106 ) ( not ( = ?auto_8105 ?auto_8110 ) ) ( not ( = ?auto_8106 ?auto_8110 ) ) ( not ( = ?auto_8104 ?auto_8110 ) ) ( SURFACE-AT ?auto_8104 ?auto_8112 ) ( CLEAR ?auto_8104 ) ( IS-CRATE ?auto_8105 ) ( AVAILABLE ?auto_8109 ) ( AVAILABLE ?auto_8113 ) ( SURFACE-AT ?auto_8105 ?auto_8108 ) ( ON ?auto_8105 ?auto_8111 ) ( CLEAR ?auto_8105 ) ( not ( = ?auto_8105 ?auto_8111 ) ) ( not ( = ?auto_8106 ?auto_8111 ) ) ( not ( = ?auto_8104 ?auto_8111 ) ) ( not ( = ?auto_8110 ?auto_8111 ) ) ( TRUCK-AT ?auto_8107 ?auto_8112 ) ( ON ?auto_8104 ?auto_8103 ) ( not ( = ?auto_8103 ?auto_8104 ) ) ( not ( = ?auto_8103 ?auto_8105 ) ) ( not ( = ?auto_8103 ?auto_8106 ) ) ( not ( = ?auto_8103 ?auto_8110 ) ) ( not ( = ?auto_8103 ?auto_8111 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8104 ?auto_8105 ?auto_8106 )
      ( MAKE-3CRATE-VERIFY ?auto_8103 ?auto_8104 ?auto_8105 ?auto_8106 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8114 - SURFACE
      ?auto_8115 - SURFACE
    )
    :vars
    (
      ?auto_8118 - HOIST
      ?auto_8121 - PLACE
      ?auto_8122 - SURFACE
      ?auto_8117 - PLACE
      ?auto_8123 - HOIST
      ?auto_8119 - SURFACE
      ?auto_8120 - SURFACE
      ?auto_8116 - TRUCK
      ?auto_8124 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8118 ?auto_8121 ) ( IS-CRATE ?auto_8115 ) ( not ( = ?auto_8114 ?auto_8115 ) ) ( not ( = ?auto_8122 ?auto_8114 ) ) ( not ( = ?auto_8122 ?auto_8115 ) ) ( not ( = ?auto_8117 ?auto_8121 ) ) ( HOIST-AT ?auto_8123 ?auto_8117 ) ( not ( = ?auto_8118 ?auto_8123 ) ) ( SURFACE-AT ?auto_8115 ?auto_8117 ) ( ON ?auto_8115 ?auto_8119 ) ( CLEAR ?auto_8115 ) ( not ( = ?auto_8114 ?auto_8119 ) ) ( not ( = ?auto_8115 ?auto_8119 ) ) ( not ( = ?auto_8122 ?auto_8119 ) ) ( IS-CRATE ?auto_8114 ) ( AVAILABLE ?auto_8123 ) ( SURFACE-AT ?auto_8114 ?auto_8117 ) ( ON ?auto_8114 ?auto_8120 ) ( CLEAR ?auto_8114 ) ( not ( = ?auto_8114 ?auto_8120 ) ) ( not ( = ?auto_8115 ?auto_8120 ) ) ( not ( = ?auto_8122 ?auto_8120 ) ) ( not ( = ?auto_8119 ?auto_8120 ) ) ( TRUCK-AT ?auto_8116 ?auto_8121 ) ( SURFACE-AT ?auto_8124 ?auto_8121 ) ( CLEAR ?auto_8124 ) ( LIFTING ?auto_8118 ?auto_8122 ) ( IS-CRATE ?auto_8122 ) ( not ( = ?auto_8124 ?auto_8122 ) ) ( not ( = ?auto_8114 ?auto_8124 ) ) ( not ( = ?auto_8115 ?auto_8124 ) ) ( not ( = ?auto_8119 ?auto_8124 ) ) ( not ( = ?auto_8120 ?auto_8124 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8124 ?auto_8122 )
      ( MAKE-2CRATE ?auto_8122 ?auto_8114 ?auto_8115 )
      ( MAKE-1CRATE-VERIFY ?auto_8114 ?auto_8115 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8125 - SURFACE
      ?auto_8126 - SURFACE
      ?auto_8127 - SURFACE
    )
    :vars
    (
      ?auto_8135 - HOIST
      ?auto_8134 - PLACE
      ?auto_8132 - PLACE
      ?auto_8128 - HOIST
      ?auto_8130 - SURFACE
      ?auto_8129 - SURFACE
      ?auto_8133 - TRUCK
      ?auto_8131 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8135 ?auto_8134 ) ( IS-CRATE ?auto_8127 ) ( not ( = ?auto_8126 ?auto_8127 ) ) ( not ( = ?auto_8125 ?auto_8126 ) ) ( not ( = ?auto_8125 ?auto_8127 ) ) ( not ( = ?auto_8132 ?auto_8134 ) ) ( HOIST-AT ?auto_8128 ?auto_8132 ) ( not ( = ?auto_8135 ?auto_8128 ) ) ( SURFACE-AT ?auto_8127 ?auto_8132 ) ( ON ?auto_8127 ?auto_8130 ) ( CLEAR ?auto_8127 ) ( not ( = ?auto_8126 ?auto_8130 ) ) ( not ( = ?auto_8127 ?auto_8130 ) ) ( not ( = ?auto_8125 ?auto_8130 ) ) ( IS-CRATE ?auto_8126 ) ( AVAILABLE ?auto_8128 ) ( SURFACE-AT ?auto_8126 ?auto_8132 ) ( ON ?auto_8126 ?auto_8129 ) ( CLEAR ?auto_8126 ) ( not ( = ?auto_8126 ?auto_8129 ) ) ( not ( = ?auto_8127 ?auto_8129 ) ) ( not ( = ?auto_8125 ?auto_8129 ) ) ( not ( = ?auto_8130 ?auto_8129 ) ) ( TRUCK-AT ?auto_8133 ?auto_8134 ) ( SURFACE-AT ?auto_8131 ?auto_8134 ) ( CLEAR ?auto_8131 ) ( LIFTING ?auto_8135 ?auto_8125 ) ( IS-CRATE ?auto_8125 ) ( not ( = ?auto_8131 ?auto_8125 ) ) ( not ( = ?auto_8126 ?auto_8131 ) ) ( not ( = ?auto_8127 ?auto_8131 ) ) ( not ( = ?auto_8130 ?auto_8131 ) ) ( not ( = ?auto_8129 ?auto_8131 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8126 ?auto_8127 )
      ( MAKE-2CRATE-VERIFY ?auto_8125 ?auto_8126 ?auto_8127 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8136 - SURFACE
      ?auto_8137 - SURFACE
      ?auto_8138 - SURFACE
      ?auto_8139 - SURFACE
    )
    :vars
    (
      ?auto_8144 - HOIST
      ?auto_8140 - PLACE
      ?auto_8143 - PLACE
      ?auto_8141 - HOIST
      ?auto_8146 - SURFACE
      ?auto_8145 - SURFACE
      ?auto_8142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8144 ?auto_8140 ) ( IS-CRATE ?auto_8139 ) ( not ( = ?auto_8138 ?auto_8139 ) ) ( not ( = ?auto_8137 ?auto_8138 ) ) ( not ( = ?auto_8137 ?auto_8139 ) ) ( not ( = ?auto_8143 ?auto_8140 ) ) ( HOIST-AT ?auto_8141 ?auto_8143 ) ( not ( = ?auto_8144 ?auto_8141 ) ) ( SURFACE-AT ?auto_8139 ?auto_8143 ) ( ON ?auto_8139 ?auto_8146 ) ( CLEAR ?auto_8139 ) ( not ( = ?auto_8138 ?auto_8146 ) ) ( not ( = ?auto_8139 ?auto_8146 ) ) ( not ( = ?auto_8137 ?auto_8146 ) ) ( IS-CRATE ?auto_8138 ) ( AVAILABLE ?auto_8141 ) ( SURFACE-AT ?auto_8138 ?auto_8143 ) ( ON ?auto_8138 ?auto_8145 ) ( CLEAR ?auto_8138 ) ( not ( = ?auto_8138 ?auto_8145 ) ) ( not ( = ?auto_8139 ?auto_8145 ) ) ( not ( = ?auto_8137 ?auto_8145 ) ) ( not ( = ?auto_8146 ?auto_8145 ) ) ( TRUCK-AT ?auto_8142 ?auto_8140 ) ( SURFACE-AT ?auto_8136 ?auto_8140 ) ( CLEAR ?auto_8136 ) ( LIFTING ?auto_8144 ?auto_8137 ) ( IS-CRATE ?auto_8137 ) ( not ( = ?auto_8136 ?auto_8137 ) ) ( not ( = ?auto_8138 ?auto_8136 ) ) ( not ( = ?auto_8139 ?auto_8136 ) ) ( not ( = ?auto_8146 ?auto_8136 ) ) ( not ( = ?auto_8145 ?auto_8136 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8137 ?auto_8138 ?auto_8139 )
      ( MAKE-3CRATE-VERIFY ?auto_8136 ?auto_8137 ?auto_8138 ?auto_8139 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8147 - SURFACE
      ?auto_8148 - SURFACE
    )
    :vars
    (
      ?auto_8153 - HOIST
      ?auto_8149 - PLACE
      ?auto_8156 - SURFACE
      ?auto_8152 - PLACE
      ?auto_8150 - HOIST
      ?auto_8157 - SURFACE
      ?auto_8154 - SURFACE
      ?auto_8151 - TRUCK
      ?auto_8155 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8153 ?auto_8149 ) ( IS-CRATE ?auto_8148 ) ( not ( = ?auto_8147 ?auto_8148 ) ) ( not ( = ?auto_8156 ?auto_8147 ) ) ( not ( = ?auto_8156 ?auto_8148 ) ) ( not ( = ?auto_8152 ?auto_8149 ) ) ( HOIST-AT ?auto_8150 ?auto_8152 ) ( not ( = ?auto_8153 ?auto_8150 ) ) ( SURFACE-AT ?auto_8148 ?auto_8152 ) ( ON ?auto_8148 ?auto_8157 ) ( CLEAR ?auto_8148 ) ( not ( = ?auto_8147 ?auto_8157 ) ) ( not ( = ?auto_8148 ?auto_8157 ) ) ( not ( = ?auto_8156 ?auto_8157 ) ) ( IS-CRATE ?auto_8147 ) ( AVAILABLE ?auto_8150 ) ( SURFACE-AT ?auto_8147 ?auto_8152 ) ( ON ?auto_8147 ?auto_8154 ) ( CLEAR ?auto_8147 ) ( not ( = ?auto_8147 ?auto_8154 ) ) ( not ( = ?auto_8148 ?auto_8154 ) ) ( not ( = ?auto_8156 ?auto_8154 ) ) ( not ( = ?auto_8157 ?auto_8154 ) ) ( TRUCK-AT ?auto_8151 ?auto_8149 ) ( SURFACE-AT ?auto_8155 ?auto_8149 ) ( CLEAR ?auto_8155 ) ( IS-CRATE ?auto_8156 ) ( not ( = ?auto_8155 ?auto_8156 ) ) ( not ( = ?auto_8147 ?auto_8155 ) ) ( not ( = ?auto_8148 ?auto_8155 ) ) ( not ( = ?auto_8157 ?auto_8155 ) ) ( not ( = ?auto_8154 ?auto_8155 ) ) ( AVAILABLE ?auto_8153 ) ( IN ?auto_8156 ?auto_8151 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8153 ?auto_8156 ?auto_8151 ?auto_8149 )
      ( MAKE-2CRATE ?auto_8156 ?auto_8147 ?auto_8148 )
      ( MAKE-1CRATE-VERIFY ?auto_8147 ?auto_8148 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8158 - SURFACE
      ?auto_8159 - SURFACE
      ?auto_8160 - SURFACE
    )
    :vars
    (
      ?auto_8164 - HOIST
      ?auto_8167 - PLACE
      ?auto_8161 - PLACE
      ?auto_8165 - HOIST
      ?auto_8163 - SURFACE
      ?auto_8168 - SURFACE
      ?auto_8162 - TRUCK
      ?auto_8166 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8164 ?auto_8167 ) ( IS-CRATE ?auto_8160 ) ( not ( = ?auto_8159 ?auto_8160 ) ) ( not ( = ?auto_8158 ?auto_8159 ) ) ( not ( = ?auto_8158 ?auto_8160 ) ) ( not ( = ?auto_8161 ?auto_8167 ) ) ( HOIST-AT ?auto_8165 ?auto_8161 ) ( not ( = ?auto_8164 ?auto_8165 ) ) ( SURFACE-AT ?auto_8160 ?auto_8161 ) ( ON ?auto_8160 ?auto_8163 ) ( CLEAR ?auto_8160 ) ( not ( = ?auto_8159 ?auto_8163 ) ) ( not ( = ?auto_8160 ?auto_8163 ) ) ( not ( = ?auto_8158 ?auto_8163 ) ) ( IS-CRATE ?auto_8159 ) ( AVAILABLE ?auto_8165 ) ( SURFACE-AT ?auto_8159 ?auto_8161 ) ( ON ?auto_8159 ?auto_8168 ) ( CLEAR ?auto_8159 ) ( not ( = ?auto_8159 ?auto_8168 ) ) ( not ( = ?auto_8160 ?auto_8168 ) ) ( not ( = ?auto_8158 ?auto_8168 ) ) ( not ( = ?auto_8163 ?auto_8168 ) ) ( TRUCK-AT ?auto_8162 ?auto_8167 ) ( SURFACE-AT ?auto_8166 ?auto_8167 ) ( CLEAR ?auto_8166 ) ( IS-CRATE ?auto_8158 ) ( not ( = ?auto_8166 ?auto_8158 ) ) ( not ( = ?auto_8159 ?auto_8166 ) ) ( not ( = ?auto_8160 ?auto_8166 ) ) ( not ( = ?auto_8163 ?auto_8166 ) ) ( not ( = ?auto_8168 ?auto_8166 ) ) ( AVAILABLE ?auto_8164 ) ( IN ?auto_8158 ?auto_8162 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8159 ?auto_8160 )
      ( MAKE-2CRATE-VERIFY ?auto_8158 ?auto_8159 ?auto_8160 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8169 - SURFACE
      ?auto_8170 - SURFACE
      ?auto_8171 - SURFACE
      ?auto_8172 - SURFACE
    )
    :vars
    (
      ?auto_8178 - HOIST
      ?auto_8179 - PLACE
      ?auto_8176 - PLACE
      ?auto_8174 - HOIST
      ?auto_8177 - SURFACE
      ?auto_8175 - SURFACE
      ?auto_8173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8178 ?auto_8179 ) ( IS-CRATE ?auto_8172 ) ( not ( = ?auto_8171 ?auto_8172 ) ) ( not ( = ?auto_8170 ?auto_8171 ) ) ( not ( = ?auto_8170 ?auto_8172 ) ) ( not ( = ?auto_8176 ?auto_8179 ) ) ( HOIST-AT ?auto_8174 ?auto_8176 ) ( not ( = ?auto_8178 ?auto_8174 ) ) ( SURFACE-AT ?auto_8172 ?auto_8176 ) ( ON ?auto_8172 ?auto_8177 ) ( CLEAR ?auto_8172 ) ( not ( = ?auto_8171 ?auto_8177 ) ) ( not ( = ?auto_8172 ?auto_8177 ) ) ( not ( = ?auto_8170 ?auto_8177 ) ) ( IS-CRATE ?auto_8171 ) ( AVAILABLE ?auto_8174 ) ( SURFACE-AT ?auto_8171 ?auto_8176 ) ( ON ?auto_8171 ?auto_8175 ) ( CLEAR ?auto_8171 ) ( not ( = ?auto_8171 ?auto_8175 ) ) ( not ( = ?auto_8172 ?auto_8175 ) ) ( not ( = ?auto_8170 ?auto_8175 ) ) ( not ( = ?auto_8177 ?auto_8175 ) ) ( TRUCK-AT ?auto_8173 ?auto_8179 ) ( SURFACE-AT ?auto_8169 ?auto_8179 ) ( CLEAR ?auto_8169 ) ( IS-CRATE ?auto_8170 ) ( not ( = ?auto_8169 ?auto_8170 ) ) ( not ( = ?auto_8171 ?auto_8169 ) ) ( not ( = ?auto_8172 ?auto_8169 ) ) ( not ( = ?auto_8177 ?auto_8169 ) ) ( not ( = ?auto_8175 ?auto_8169 ) ) ( AVAILABLE ?auto_8178 ) ( IN ?auto_8170 ?auto_8173 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8170 ?auto_8171 ?auto_8172 )
      ( MAKE-3CRATE-VERIFY ?auto_8169 ?auto_8170 ?auto_8171 ?auto_8172 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8180 - SURFACE
      ?auto_8181 - SURFACE
    )
    :vars
    (
      ?auto_8189 - HOIST
      ?auto_8190 - PLACE
      ?auto_8187 - SURFACE
      ?auto_8186 - PLACE
      ?auto_8184 - HOIST
      ?auto_8188 - SURFACE
      ?auto_8185 - SURFACE
      ?auto_8183 - SURFACE
      ?auto_8182 - TRUCK
      ?auto_8191 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8189 ?auto_8190 ) ( IS-CRATE ?auto_8181 ) ( not ( = ?auto_8180 ?auto_8181 ) ) ( not ( = ?auto_8187 ?auto_8180 ) ) ( not ( = ?auto_8187 ?auto_8181 ) ) ( not ( = ?auto_8186 ?auto_8190 ) ) ( HOIST-AT ?auto_8184 ?auto_8186 ) ( not ( = ?auto_8189 ?auto_8184 ) ) ( SURFACE-AT ?auto_8181 ?auto_8186 ) ( ON ?auto_8181 ?auto_8188 ) ( CLEAR ?auto_8181 ) ( not ( = ?auto_8180 ?auto_8188 ) ) ( not ( = ?auto_8181 ?auto_8188 ) ) ( not ( = ?auto_8187 ?auto_8188 ) ) ( IS-CRATE ?auto_8180 ) ( AVAILABLE ?auto_8184 ) ( SURFACE-AT ?auto_8180 ?auto_8186 ) ( ON ?auto_8180 ?auto_8185 ) ( CLEAR ?auto_8180 ) ( not ( = ?auto_8180 ?auto_8185 ) ) ( not ( = ?auto_8181 ?auto_8185 ) ) ( not ( = ?auto_8187 ?auto_8185 ) ) ( not ( = ?auto_8188 ?auto_8185 ) ) ( SURFACE-AT ?auto_8183 ?auto_8190 ) ( CLEAR ?auto_8183 ) ( IS-CRATE ?auto_8187 ) ( not ( = ?auto_8183 ?auto_8187 ) ) ( not ( = ?auto_8180 ?auto_8183 ) ) ( not ( = ?auto_8181 ?auto_8183 ) ) ( not ( = ?auto_8188 ?auto_8183 ) ) ( not ( = ?auto_8185 ?auto_8183 ) ) ( AVAILABLE ?auto_8189 ) ( IN ?auto_8187 ?auto_8182 ) ( TRUCK-AT ?auto_8182 ?auto_8191 ) ( not ( = ?auto_8191 ?auto_8190 ) ) ( not ( = ?auto_8186 ?auto_8191 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8182 ?auto_8191 ?auto_8190 )
      ( MAKE-2CRATE ?auto_8187 ?auto_8180 ?auto_8181 )
      ( MAKE-1CRATE-VERIFY ?auto_8180 ?auto_8181 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8192 - SURFACE
      ?auto_8193 - SURFACE
      ?auto_8194 - SURFACE
    )
    :vars
    (
      ?auto_8196 - HOIST
      ?auto_8199 - PLACE
      ?auto_8198 - PLACE
      ?auto_8200 - HOIST
      ?auto_8197 - SURFACE
      ?auto_8195 - SURFACE
      ?auto_8202 - SURFACE
      ?auto_8203 - TRUCK
      ?auto_8201 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8196 ?auto_8199 ) ( IS-CRATE ?auto_8194 ) ( not ( = ?auto_8193 ?auto_8194 ) ) ( not ( = ?auto_8192 ?auto_8193 ) ) ( not ( = ?auto_8192 ?auto_8194 ) ) ( not ( = ?auto_8198 ?auto_8199 ) ) ( HOIST-AT ?auto_8200 ?auto_8198 ) ( not ( = ?auto_8196 ?auto_8200 ) ) ( SURFACE-AT ?auto_8194 ?auto_8198 ) ( ON ?auto_8194 ?auto_8197 ) ( CLEAR ?auto_8194 ) ( not ( = ?auto_8193 ?auto_8197 ) ) ( not ( = ?auto_8194 ?auto_8197 ) ) ( not ( = ?auto_8192 ?auto_8197 ) ) ( IS-CRATE ?auto_8193 ) ( AVAILABLE ?auto_8200 ) ( SURFACE-AT ?auto_8193 ?auto_8198 ) ( ON ?auto_8193 ?auto_8195 ) ( CLEAR ?auto_8193 ) ( not ( = ?auto_8193 ?auto_8195 ) ) ( not ( = ?auto_8194 ?auto_8195 ) ) ( not ( = ?auto_8192 ?auto_8195 ) ) ( not ( = ?auto_8197 ?auto_8195 ) ) ( SURFACE-AT ?auto_8202 ?auto_8199 ) ( CLEAR ?auto_8202 ) ( IS-CRATE ?auto_8192 ) ( not ( = ?auto_8202 ?auto_8192 ) ) ( not ( = ?auto_8193 ?auto_8202 ) ) ( not ( = ?auto_8194 ?auto_8202 ) ) ( not ( = ?auto_8197 ?auto_8202 ) ) ( not ( = ?auto_8195 ?auto_8202 ) ) ( AVAILABLE ?auto_8196 ) ( IN ?auto_8192 ?auto_8203 ) ( TRUCK-AT ?auto_8203 ?auto_8201 ) ( not ( = ?auto_8201 ?auto_8199 ) ) ( not ( = ?auto_8198 ?auto_8201 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8193 ?auto_8194 )
      ( MAKE-2CRATE-VERIFY ?auto_8192 ?auto_8193 ?auto_8194 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8204 - SURFACE
      ?auto_8205 - SURFACE
      ?auto_8206 - SURFACE
      ?auto_8207 - SURFACE
    )
    :vars
    (
      ?auto_8208 - HOIST
      ?auto_8215 - PLACE
      ?auto_8213 - PLACE
      ?auto_8212 - HOIST
      ?auto_8210 - SURFACE
      ?auto_8214 - SURFACE
      ?auto_8209 - TRUCK
      ?auto_8211 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8208 ?auto_8215 ) ( IS-CRATE ?auto_8207 ) ( not ( = ?auto_8206 ?auto_8207 ) ) ( not ( = ?auto_8205 ?auto_8206 ) ) ( not ( = ?auto_8205 ?auto_8207 ) ) ( not ( = ?auto_8213 ?auto_8215 ) ) ( HOIST-AT ?auto_8212 ?auto_8213 ) ( not ( = ?auto_8208 ?auto_8212 ) ) ( SURFACE-AT ?auto_8207 ?auto_8213 ) ( ON ?auto_8207 ?auto_8210 ) ( CLEAR ?auto_8207 ) ( not ( = ?auto_8206 ?auto_8210 ) ) ( not ( = ?auto_8207 ?auto_8210 ) ) ( not ( = ?auto_8205 ?auto_8210 ) ) ( IS-CRATE ?auto_8206 ) ( AVAILABLE ?auto_8212 ) ( SURFACE-AT ?auto_8206 ?auto_8213 ) ( ON ?auto_8206 ?auto_8214 ) ( CLEAR ?auto_8206 ) ( not ( = ?auto_8206 ?auto_8214 ) ) ( not ( = ?auto_8207 ?auto_8214 ) ) ( not ( = ?auto_8205 ?auto_8214 ) ) ( not ( = ?auto_8210 ?auto_8214 ) ) ( SURFACE-AT ?auto_8204 ?auto_8215 ) ( CLEAR ?auto_8204 ) ( IS-CRATE ?auto_8205 ) ( not ( = ?auto_8204 ?auto_8205 ) ) ( not ( = ?auto_8206 ?auto_8204 ) ) ( not ( = ?auto_8207 ?auto_8204 ) ) ( not ( = ?auto_8210 ?auto_8204 ) ) ( not ( = ?auto_8214 ?auto_8204 ) ) ( AVAILABLE ?auto_8208 ) ( IN ?auto_8205 ?auto_8209 ) ( TRUCK-AT ?auto_8209 ?auto_8211 ) ( not ( = ?auto_8211 ?auto_8215 ) ) ( not ( = ?auto_8213 ?auto_8211 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8205 ?auto_8206 ?auto_8207 )
      ( MAKE-3CRATE-VERIFY ?auto_8204 ?auto_8205 ?auto_8206 ?auto_8207 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8216 - SURFACE
      ?auto_8217 - SURFACE
    )
    :vars
    (
      ?auto_8218 - HOIST
      ?auto_8227 - PLACE
      ?auto_8226 - SURFACE
      ?auto_8224 - PLACE
      ?auto_8223 - HOIST
      ?auto_8220 - SURFACE
      ?auto_8225 - SURFACE
      ?auto_8222 - SURFACE
      ?auto_8219 - TRUCK
      ?auto_8221 - PLACE
      ?auto_8228 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8218 ?auto_8227 ) ( IS-CRATE ?auto_8217 ) ( not ( = ?auto_8216 ?auto_8217 ) ) ( not ( = ?auto_8226 ?auto_8216 ) ) ( not ( = ?auto_8226 ?auto_8217 ) ) ( not ( = ?auto_8224 ?auto_8227 ) ) ( HOIST-AT ?auto_8223 ?auto_8224 ) ( not ( = ?auto_8218 ?auto_8223 ) ) ( SURFACE-AT ?auto_8217 ?auto_8224 ) ( ON ?auto_8217 ?auto_8220 ) ( CLEAR ?auto_8217 ) ( not ( = ?auto_8216 ?auto_8220 ) ) ( not ( = ?auto_8217 ?auto_8220 ) ) ( not ( = ?auto_8226 ?auto_8220 ) ) ( IS-CRATE ?auto_8216 ) ( AVAILABLE ?auto_8223 ) ( SURFACE-AT ?auto_8216 ?auto_8224 ) ( ON ?auto_8216 ?auto_8225 ) ( CLEAR ?auto_8216 ) ( not ( = ?auto_8216 ?auto_8225 ) ) ( not ( = ?auto_8217 ?auto_8225 ) ) ( not ( = ?auto_8226 ?auto_8225 ) ) ( not ( = ?auto_8220 ?auto_8225 ) ) ( SURFACE-AT ?auto_8222 ?auto_8227 ) ( CLEAR ?auto_8222 ) ( IS-CRATE ?auto_8226 ) ( not ( = ?auto_8222 ?auto_8226 ) ) ( not ( = ?auto_8216 ?auto_8222 ) ) ( not ( = ?auto_8217 ?auto_8222 ) ) ( not ( = ?auto_8220 ?auto_8222 ) ) ( not ( = ?auto_8225 ?auto_8222 ) ) ( AVAILABLE ?auto_8218 ) ( TRUCK-AT ?auto_8219 ?auto_8221 ) ( not ( = ?auto_8221 ?auto_8227 ) ) ( not ( = ?auto_8224 ?auto_8221 ) ) ( HOIST-AT ?auto_8228 ?auto_8221 ) ( LIFTING ?auto_8228 ?auto_8226 ) ( not ( = ?auto_8218 ?auto_8228 ) ) ( not ( = ?auto_8223 ?auto_8228 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8228 ?auto_8226 ?auto_8219 ?auto_8221 )
      ( MAKE-2CRATE ?auto_8226 ?auto_8216 ?auto_8217 )
      ( MAKE-1CRATE-VERIFY ?auto_8216 ?auto_8217 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8229 - SURFACE
      ?auto_8230 - SURFACE
      ?auto_8231 - SURFACE
    )
    :vars
    (
      ?auto_8235 - HOIST
      ?auto_8241 - PLACE
      ?auto_8240 - PLACE
      ?auto_8232 - HOIST
      ?auto_8238 - SURFACE
      ?auto_8236 - SURFACE
      ?auto_8237 - SURFACE
      ?auto_8234 - TRUCK
      ?auto_8239 - PLACE
      ?auto_8233 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8235 ?auto_8241 ) ( IS-CRATE ?auto_8231 ) ( not ( = ?auto_8230 ?auto_8231 ) ) ( not ( = ?auto_8229 ?auto_8230 ) ) ( not ( = ?auto_8229 ?auto_8231 ) ) ( not ( = ?auto_8240 ?auto_8241 ) ) ( HOIST-AT ?auto_8232 ?auto_8240 ) ( not ( = ?auto_8235 ?auto_8232 ) ) ( SURFACE-AT ?auto_8231 ?auto_8240 ) ( ON ?auto_8231 ?auto_8238 ) ( CLEAR ?auto_8231 ) ( not ( = ?auto_8230 ?auto_8238 ) ) ( not ( = ?auto_8231 ?auto_8238 ) ) ( not ( = ?auto_8229 ?auto_8238 ) ) ( IS-CRATE ?auto_8230 ) ( AVAILABLE ?auto_8232 ) ( SURFACE-AT ?auto_8230 ?auto_8240 ) ( ON ?auto_8230 ?auto_8236 ) ( CLEAR ?auto_8230 ) ( not ( = ?auto_8230 ?auto_8236 ) ) ( not ( = ?auto_8231 ?auto_8236 ) ) ( not ( = ?auto_8229 ?auto_8236 ) ) ( not ( = ?auto_8238 ?auto_8236 ) ) ( SURFACE-AT ?auto_8237 ?auto_8241 ) ( CLEAR ?auto_8237 ) ( IS-CRATE ?auto_8229 ) ( not ( = ?auto_8237 ?auto_8229 ) ) ( not ( = ?auto_8230 ?auto_8237 ) ) ( not ( = ?auto_8231 ?auto_8237 ) ) ( not ( = ?auto_8238 ?auto_8237 ) ) ( not ( = ?auto_8236 ?auto_8237 ) ) ( AVAILABLE ?auto_8235 ) ( TRUCK-AT ?auto_8234 ?auto_8239 ) ( not ( = ?auto_8239 ?auto_8241 ) ) ( not ( = ?auto_8240 ?auto_8239 ) ) ( HOIST-AT ?auto_8233 ?auto_8239 ) ( LIFTING ?auto_8233 ?auto_8229 ) ( not ( = ?auto_8235 ?auto_8233 ) ) ( not ( = ?auto_8232 ?auto_8233 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8230 ?auto_8231 )
      ( MAKE-2CRATE-VERIFY ?auto_8229 ?auto_8230 ?auto_8231 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8242 - SURFACE
      ?auto_8243 - SURFACE
      ?auto_8244 - SURFACE
      ?auto_8245 - SURFACE
    )
    :vars
    (
      ?auto_8251 - HOIST
      ?auto_8246 - PLACE
      ?auto_8253 - PLACE
      ?auto_8252 - HOIST
      ?auto_8248 - SURFACE
      ?auto_8247 - SURFACE
      ?auto_8249 - TRUCK
      ?auto_8250 - PLACE
      ?auto_8254 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8251 ?auto_8246 ) ( IS-CRATE ?auto_8245 ) ( not ( = ?auto_8244 ?auto_8245 ) ) ( not ( = ?auto_8243 ?auto_8244 ) ) ( not ( = ?auto_8243 ?auto_8245 ) ) ( not ( = ?auto_8253 ?auto_8246 ) ) ( HOIST-AT ?auto_8252 ?auto_8253 ) ( not ( = ?auto_8251 ?auto_8252 ) ) ( SURFACE-AT ?auto_8245 ?auto_8253 ) ( ON ?auto_8245 ?auto_8248 ) ( CLEAR ?auto_8245 ) ( not ( = ?auto_8244 ?auto_8248 ) ) ( not ( = ?auto_8245 ?auto_8248 ) ) ( not ( = ?auto_8243 ?auto_8248 ) ) ( IS-CRATE ?auto_8244 ) ( AVAILABLE ?auto_8252 ) ( SURFACE-AT ?auto_8244 ?auto_8253 ) ( ON ?auto_8244 ?auto_8247 ) ( CLEAR ?auto_8244 ) ( not ( = ?auto_8244 ?auto_8247 ) ) ( not ( = ?auto_8245 ?auto_8247 ) ) ( not ( = ?auto_8243 ?auto_8247 ) ) ( not ( = ?auto_8248 ?auto_8247 ) ) ( SURFACE-AT ?auto_8242 ?auto_8246 ) ( CLEAR ?auto_8242 ) ( IS-CRATE ?auto_8243 ) ( not ( = ?auto_8242 ?auto_8243 ) ) ( not ( = ?auto_8244 ?auto_8242 ) ) ( not ( = ?auto_8245 ?auto_8242 ) ) ( not ( = ?auto_8248 ?auto_8242 ) ) ( not ( = ?auto_8247 ?auto_8242 ) ) ( AVAILABLE ?auto_8251 ) ( TRUCK-AT ?auto_8249 ?auto_8250 ) ( not ( = ?auto_8250 ?auto_8246 ) ) ( not ( = ?auto_8253 ?auto_8250 ) ) ( HOIST-AT ?auto_8254 ?auto_8250 ) ( LIFTING ?auto_8254 ?auto_8243 ) ( not ( = ?auto_8251 ?auto_8254 ) ) ( not ( = ?auto_8252 ?auto_8254 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8243 ?auto_8244 ?auto_8245 )
      ( MAKE-3CRATE-VERIFY ?auto_8242 ?auto_8243 ?auto_8244 ?auto_8245 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8255 - SURFACE
      ?auto_8256 - SURFACE
    )
    :vars
    (
      ?auto_8264 - HOIST
      ?auto_8258 - PLACE
      ?auto_8257 - SURFACE
      ?auto_8266 - PLACE
      ?auto_8265 - HOIST
      ?auto_8260 - SURFACE
      ?auto_8259 - SURFACE
      ?auto_8262 - SURFACE
      ?auto_8261 - TRUCK
      ?auto_8263 - PLACE
      ?auto_8267 - HOIST
      ?auto_8268 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8264 ?auto_8258 ) ( IS-CRATE ?auto_8256 ) ( not ( = ?auto_8255 ?auto_8256 ) ) ( not ( = ?auto_8257 ?auto_8255 ) ) ( not ( = ?auto_8257 ?auto_8256 ) ) ( not ( = ?auto_8266 ?auto_8258 ) ) ( HOIST-AT ?auto_8265 ?auto_8266 ) ( not ( = ?auto_8264 ?auto_8265 ) ) ( SURFACE-AT ?auto_8256 ?auto_8266 ) ( ON ?auto_8256 ?auto_8260 ) ( CLEAR ?auto_8256 ) ( not ( = ?auto_8255 ?auto_8260 ) ) ( not ( = ?auto_8256 ?auto_8260 ) ) ( not ( = ?auto_8257 ?auto_8260 ) ) ( IS-CRATE ?auto_8255 ) ( AVAILABLE ?auto_8265 ) ( SURFACE-AT ?auto_8255 ?auto_8266 ) ( ON ?auto_8255 ?auto_8259 ) ( CLEAR ?auto_8255 ) ( not ( = ?auto_8255 ?auto_8259 ) ) ( not ( = ?auto_8256 ?auto_8259 ) ) ( not ( = ?auto_8257 ?auto_8259 ) ) ( not ( = ?auto_8260 ?auto_8259 ) ) ( SURFACE-AT ?auto_8262 ?auto_8258 ) ( CLEAR ?auto_8262 ) ( IS-CRATE ?auto_8257 ) ( not ( = ?auto_8262 ?auto_8257 ) ) ( not ( = ?auto_8255 ?auto_8262 ) ) ( not ( = ?auto_8256 ?auto_8262 ) ) ( not ( = ?auto_8260 ?auto_8262 ) ) ( not ( = ?auto_8259 ?auto_8262 ) ) ( AVAILABLE ?auto_8264 ) ( TRUCK-AT ?auto_8261 ?auto_8263 ) ( not ( = ?auto_8263 ?auto_8258 ) ) ( not ( = ?auto_8266 ?auto_8263 ) ) ( HOIST-AT ?auto_8267 ?auto_8263 ) ( not ( = ?auto_8264 ?auto_8267 ) ) ( not ( = ?auto_8265 ?auto_8267 ) ) ( AVAILABLE ?auto_8267 ) ( SURFACE-AT ?auto_8257 ?auto_8263 ) ( ON ?auto_8257 ?auto_8268 ) ( CLEAR ?auto_8257 ) ( not ( = ?auto_8255 ?auto_8268 ) ) ( not ( = ?auto_8256 ?auto_8268 ) ) ( not ( = ?auto_8257 ?auto_8268 ) ) ( not ( = ?auto_8260 ?auto_8268 ) ) ( not ( = ?auto_8259 ?auto_8268 ) ) ( not ( = ?auto_8262 ?auto_8268 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8267 ?auto_8257 ?auto_8268 ?auto_8263 )
      ( MAKE-2CRATE ?auto_8257 ?auto_8255 ?auto_8256 )
      ( MAKE-1CRATE-VERIFY ?auto_8255 ?auto_8256 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8269 - SURFACE
      ?auto_8270 - SURFACE
      ?auto_8271 - SURFACE
    )
    :vars
    (
      ?auto_8282 - HOIST
      ?auto_8278 - PLACE
      ?auto_8272 - PLACE
      ?auto_8281 - HOIST
      ?auto_8274 - SURFACE
      ?auto_8280 - SURFACE
      ?auto_8275 - SURFACE
      ?auto_8273 - TRUCK
      ?auto_8276 - PLACE
      ?auto_8277 - HOIST
      ?auto_8279 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8282 ?auto_8278 ) ( IS-CRATE ?auto_8271 ) ( not ( = ?auto_8270 ?auto_8271 ) ) ( not ( = ?auto_8269 ?auto_8270 ) ) ( not ( = ?auto_8269 ?auto_8271 ) ) ( not ( = ?auto_8272 ?auto_8278 ) ) ( HOIST-AT ?auto_8281 ?auto_8272 ) ( not ( = ?auto_8282 ?auto_8281 ) ) ( SURFACE-AT ?auto_8271 ?auto_8272 ) ( ON ?auto_8271 ?auto_8274 ) ( CLEAR ?auto_8271 ) ( not ( = ?auto_8270 ?auto_8274 ) ) ( not ( = ?auto_8271 ?auto_8274 ) ) ( not ( = ?auto_8269 ?auto_8274 ) ) ( IS-CRATE ?auto_8270 ) ( AVAILABLE ?auto_8281 ) ( SURFACE-AT ?auto_8270 ?auto_8272 ) ( ON ?auto_8270 ?auto_8280 ) ( CLEAR ?auto_8270 ) ( not ( = ?auto_8270 ?auto_8280 ) ) ( not ( = ?auto_8271 ?auto_8280 ) ) ( not ( = ?auto_8269 ?auto_8280 ) ) ( not ( = ?auto_8274 ?auto_8280 ) ) ( SURFACE-AT ?auto_8275 ?auto_8278 ) ( CLEAR ?auto_8275 ) ( IS-CRATE ?auto_8269 ) ( not ( = ?auto_8275 ?auto_8269 ) ) ( not ( = ?auto_8270 ?auto_8275 ) ) ( not ( = ?auto_8271 ?auto_8275 ) ) ( not ( = ?auto_8274 ?auto_8275 ) ) ( not ( = ?auto_8280 ?auto_8275 ) ) ( AVAILABLE ?auto_8282 ) ( TRUCK-AT ?auto_8273 ?auto_8276 ) ( not ( = ?auto_8276 ?auto_8278 ) ) ( not ( = ?auto_8272 ?auto_8276 ) ) ( HOIST-AT ?auto_8277 ?auto_8276 ) ( not ( = ?auto_8282 ?auto_8277 ) ) ( not ( = ?auto_8281 ?auto_8277 ) ) ( AVAILABLE ?auto_8277 ) ( SURFACE-AT ?auto_8269 ?auto_8276 ) ( ON ?auto_8269 ?auto_8279 ) ( CLEAR ?auto_8269 ) ( not ( = ?auto_8270 ?auto_8279 ) ) ( not ( = ?auto_8271 ?auto_8279 ) ) ( not ( = ?auto_8269 ?auto_8279 ) ) ( not ( = ?auto_8274 ?auto_8279 ) ) ( not ( = ?auto_8280 ?auto_8279 ) ) ( not ( = ?auto_8275 ?auto_8279 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8270 ?auto_8271 )
      ( MAKE-2CRATE-VERIFY ?auto_8269 ?auto_8270 ?auto_8271 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8283 - SURFACE
      ?auto_8284 - SURFACE
      ?auto_8285 - SURFACE
      ?auto_8286 - SURFACE
    )
    :vars
    (
      ?auto_8290 - HOIST
      ?auto_8289 - PLACE
      ?auto_8296 - PLACE
      ?auto_8293 - HOIST
      ?auto_8294 - SURFACE
      ?auto_8288 - SURFACE
      ?auto_8291 - TRUCK
      ?auto_8295 - PLACE
      ?auto_8287 - HOIST
      ?auto_8292 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8290 ?auto_8289 ) ( IS-CRATE ?auto_8286 ) ( not ( = ?auto_8285 ?auto_8286 ) ) ( not ( = ?auto_8284 ?auto_8285 ) ) ( not ( = ?auto_8284 ?auto_8286 ) ) ( not ( = ?auto_8296 ?auto_8289 ) ) ( HOIST-AT ?auto_8293 ?auto_8296 ) ( not ( = ?auto_8290 ?auto_8293 ) ) ( SURFACE-AT ?auto_8286 ?auto_8296 ) ( ON ?auto_8286 ?auto_8294 ) ( CLEAR ?auto_8286 ) ( not ( = ?auto_8285 ?auto_8294 ) ) ( not ( = ?auto_8286 ?auto_8294 ) ) ( not ( = ?auto_8284 ?auto_8294 ) ) ( IS-CRATE ?auto_8285 ) ( AVAILABLE ?auto_8293 ) ( SURFACE-AT ?auto_8285 ?auto_8296 ) ( ON ?auto_8285 ?auto_8288 ) ( CLEAR ?auto_8285 ) ( not ( = ?auto_8285 ?auto_8288 ) ) ( not ( = ?auto_8286 ?auto_8288 ) ) ( not ( = ?auto_8284 ?auto_8288 ) ) ( not ( = ?auto_8294 ?auto_8288 ) ) ( SURFACE-AT ?auto_8283 ?auto_8289 ) ( CLEAR ?auto_8283 ) ( IS-CRATE ?auto_8284 ) ( not ( = ?auto_8283 ?auto_8284 ) ) ( not ( = ?auto_8285 ?auto_8283 ) ) ( not ( = ?auto_8286 ?auto_8283 ) ) ( not ( = ?auto_8294 ?auto_8283 ) ) ( not ( = ?auto_8288 ?auto_8283 ) ) ( AVAILABLE ?auto_8290 ) ( TRUCK-AT ?auto_8291 ?auto_8295 ) ( not ( = ?auto_8295 ?auto_8289 ) ) ( not ( = ?auto_8296 ?auto_8295 ) ) ( HOIST-AT ?auto_8287 ?auto_8295 ) ( not ( = ?auto_8290 ?auto_8287 ) ) ( not ( = ?auto_8293 ?auto_8287 ) ) ( AVAILABLE ?auto_8287 ) ( SURFACE-AT ?auto_8284 ?auto_8295 ) ( ON ?auto_8284 ?auto_8292 ) ( CLEAR ?auto_8284 ) ( not ( = ?auto_8285 ?auto_8292 ) ) ( not ( = ?auto_8286 ?auto_8292 ) ) ( not ( = ?auto_8284 ?auto_8292 ) ) ( not ( = ?auto_8294 ?auto_8292 ) ) ( not ( = ?auto_8288 ?auto_8292 ) ) ( not ( = ?auto_8283 ?auto_8292 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8284 ?auto_8285 ?auto_8286 )
      ( MAKE-3CRATE-VERIFY ?auto_8283 ?auto_8284 ?auto_8285 ?auto_8286 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8297 - SURFACE
      ?auto_8298 - SURFACE
    )
    :vars
    (
      ?auto_8303 - HOIST
      ?auto_8302 - PLACE
      ?auto_8300 - SURFACE
      ?auto_8309 - PLACE
      ?auto_8306 - HOIST
      ?auto_8307 - SURFACE
      ?auto_8301 - SURFACE
      ?auto_8310 - SURFACE
      ?auto_8308 - PLACE
      ?auto_8299 - HOIST
      ?auto_8305 - SURFACE
      ?auto_8304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8303 ?auto_8302 ) ( IS-CRATE ?auto_8298 ) ( not ( = ?auto_8297 ?auto_8298 ) ) ( not ( = ?auto_8300 ?auto_8297 ) ) ( not ( = ?auto_8300 ?auto_8298 ) ) ( not ( = ?auto_8309 ?auto_8302 ) ) ( HOIST-AT ?auto_8306 ?auto_8309 ) ( not ( = ?auto_8303 ?auto_8306 ) ) ( SURFACE-AT ?auto_8298 ?auto_8309 ) ( ON ?auto_8298 ?auto_8307 ) ( CLEAR ?auto_8298 ) ( not ( = ?auto_8297 ?auto_8307 ) ) ( not ( = ?auto_8298 ?auto_8307 ) ) ( not ( = ?auto_8300 ?auto_8307 ) ) ( IS-CRATE ?auto_8297 ) ( AVAILABLE ?auto_8306 ) ( SURFACE-AT ?auto_8297 ?auto_8309 ) ( ON ?auto_8297 ?auto_8301 ) ( CLEAR ?auto_8297 ) ( not ( = ?auto_8297 ?auto_8301 ) ) ( not ( = ?auto_8298 ?auto_8301 ) ) ( not ( = ?auto_8300 ?auto_8301 ) ) ( not ( = ?auto_8307 ?auto_8301 ) ) ( SURFACE-AT ?auto_8310 ?auto_8302 ) ( CLEAR ?auto_8310 ) ( IS-CRATE ?auto_8300 ) ( not ( = ?auto_8310 ?auto_8300 ) ) ( not ( = ?auto_8297 ?auto_8310 ) ) ( not ( = ?auto_8298 ?auto_8310 ) ) ( not ( = ?auto_8307 ?auto_8310 ) ) ( not ( = ?auto_8301 ?auto_8310 ) ) ( AVAILABLE ?auto_8303 ) ( not ( = ?auto_8308 ?auto_8302 ) ) ( not ( = ?auto_8309 ?auto_8308 ) ) ( HOIST-AT ?auto_8299 ?auto_8308 ) ( not ( = ?auto_8303 ?auto_8299 ) ) ( not ( = ?auto_8306 ?auto_8299 ) ) ( AVAILABLE ?auto_8299 ) ( SURFACE-AT ?auto_8300 ?auto_8308 ) ( ON ?auto_8300 ?auto_8305 ) ( CLEAR ?auto_8300 ) ( not ( = ?auto_8297 ?auto_8305 ) ) ( not ( = ?auto_8298 ?auto_8305 ) ) ( not ( = ?auto_8300 ?auto_8305 ) ) ( not ( = ?auto_8307 ?auto_8305 ) ) ( not ( = ?auto_8301 ?auto_8305 ) ) ( not ( = ?auto_8310 ?auto_8305 ) ) ( TRUCK-AT ?auto_8304 ?auto_8302 ) )
    :subtasks
    ( ( !DRIVE ?auto_8304 ?auto_8302 ?auto_8308 )
      ( MAKE-2CRATE ?auto_8300 ?auto_8297 ?auto_8298 )
      ( MAKE-1CRATE-VERIFY ?auto_8297 ?auto_8298 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8311 - SURFACE
      ?auto_8312 - SURFACE
      ?auto_8313 - SURFACE
    )
    :vars
    (
      ?auto_8321 - HOIST
      ?auto_8324 - PLACE
      ?auto_8319 - PLACE
      ?auto_8323 - HOIST
      ?auto_8320 - SURFACE
      ?auto_8315 - SURFACE
      ?auto_8317 - SURFACE
      ?auto_8322 - PLACE
      ?auto_8318 - HOIST
      ?auto_8314 - SURFACE
      ?auto_8316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8321 ?auto_8324 ) ( IS-CRATE ?auto_8313 ) ( not ( = ?auto_8312 ?auto_8313 ) ) ( not ( = ?auto_8311 ?auto_8312 ) ) ( not ( = ?auto_8311 ?auto_8313 ) ) ( not ( = ?auto_8319 ?auto_8324 ) ) ( HOIST-AT ?auto_8323 ?auto_8319 ) ( not ( = ?auto_8321 ?auto_8323 ) ) ( SURFACE-AT ?auto_8313 ?auto_8319 ) ( ON ?auto_8313 ?auto_8320 ) ( CLEAR ?auto_8313 ) ( not ( = ?auto_8312 ?auto_8320 ) ) ( not ( = ?auto_8313 ?auto_8320 ) ) ( not ( = ?auto_8311 ?auto_8320 ) ) ( IS-CRATE ?auto_8312 ) ( AVAILABLE ?auto_8323 ) ( SURFACE-AT ?auto_8312 ?auto_8319 ) ( ON ?auto_8312 ?auto_8315 ) ( CLEAR ?auto_8312 ) ( not ( = ?auto_8312 ?auto_8315 ) ) ( not ( = ?auto_8313 ?auto_8315 ) ) ( not ( = ?auto_8311 ?auto_8315 ) ) ( not ( = ?auto_8320 ?auto_8315 ) ) ( SURFACE-AT ?auto_8317 ?auto_8324 ) ( CLEAR ?auto_8317 ) ( IS-CRATE ?auto_8311 ) ( not ( = ?auto_8317 ?auto_8311 ) ) ( not ( = ?auto_8312 ?auto_8317 ) ) ( not ( = ?auto_8313 ?auto_8317 ) ) ( not ( = ?auto_8320 ?auto_8317 ) ) ( not ( = ?auto_8315 ?auto_8317 ) ) ( AVAILABLE ?auto_8321 ) ( not ( = ?auto_8322 ?auto_8324 ) ) ( not ( = ?auto_8319 ?auto_8322 ) ) ( HOIST-AT ?auto_8318 ?auto_8322 ) ( not ( = ?auto_8321 ?auto_8318 ) ) ( not ( = ?auto_8323 ?auto_8318 ) ) ( AVAILABLE ?auto_8318 ) ( SURFACE-AT ?auto_8311 ?auto_8322 ) ( ON ?auto_8311 ?auto_8314 ) ( CLEAR ?auto_8311 ) ( not ( = ?auto_8312 ?auto_8314 ) ) ( not ( = ?auto_8313 ?auto_8314 ) ) ( not ( = ?auto_8311 ?auto_8314 ) ) ( not ( = ?auto_8320 ?auto_8314 ) ) ( not ( = ?auto_8315 ?auto_8314 ) ) ( not ( = ?auto_8317 ?auto_8314 ) ) ( TRUCK-AT ?auto_8316 ?auto_8324 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8312 ?auto_8313 )
      ( MAKE-2CRATE-VERIFY ?auto_8311 ?auto_8312 ?auto_8313 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8325 - SURFACE
      ?auto_8326 - SURFACE
      ?auto_8327 - SURFACE
      ?auto_8328 - SURFACE
    )
    :vars
    (
      ?auto_8330 - HOIST
      ?auto_8332 - PLACE
      ?auto_8338 - PLACE
      ?auto_8337 - HOIST
      ?auto_8335 - SURFACE
      ?auto_8336 - SURFACE
      ?auto_8333 - PLACE
      ?auto_8334 - HOIST
      ?auto_8329 - SURFACE
      ?auto_8331 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8330 ?auto_8332 ) ( IS-CRATE ?auto_8328 ) ( not ( = ?auto_8327 ?auto_8328 ) ) ( not ( = ?auto_8326 ?auto_8327 ) ) ( not ( = ?auto_8326 ?auto_8328 ) ) ( not ( = ?auto_8338 ?auto_8332 ) ) ( HOIST-AT ?auto_8337 ?auto_8338 ) ( not ( = ?auto_8330 ?auto_8337 ) ) ( SURFACE-AT ?auto_8328 ?auto_8338 ) ( ON ?auto_8328 ?auto_8335 ) ( CLEAR ?auto_8328 ) ( not ( = ?auto_8327 ?auto_8335 ) ) ( not ( = ?auto_8328 ?auto_8335 ) ) ( not ( = ?auto_8326 ?auto_8335 ) ) ( IS-CRATE ?auto_8327 ) ( AVAILABLE ?auto_8337 ) ( SURFACE-AT ?auto_8327 ?auto_8338 ) ( ON ?auto_8327 ?auto_8336 ) ( CLEAR ?auto_8327 ) ( not ( = ?auto_8327 ?auto_8336 ) ) ( not ( = ?auto_8328 ?auto_8336 ) ) ( not ( = ?auto_8326 ?auto_8336 ) ) ( not ( = ?auto_8335 ?auto_8336 ) ) ( SURFACE-AT ?auto_8325 ?auto_8332 ) ( CLEAR ?auto_8325 ) ( IS-CRATE ?auto_8326 ) ( not ( = ?auto_8325 ?auto_8326 ) ) ( not ( = ?auto_8327 ?auto_8325 ) ) ( not ( = ?auto_8328 ?auto_8325 ) ) ( not ( = ?auto_8335 ?auto_8325 ) ) ( not ( = ?auto_8336 ?auto_8325 ) ) ( AVAILABLE ?auto_8330 ) ( not ( = ?auto_8333 ?auto_8332 ) ) ( not ( = ?auto_8338 ?auto_8333 ) ) ( HOIST-AT ?auto_8334 ?auto_8333 ) ( not ( = ?auto_8330 ?auto_8334 ) ) ( not ( = ?auto_8337 ?auto_8334 ) ) ( AVAILABLE ?auto_8334 ) ( SURFACE-AT ?auto_8326 ?auto_8333 ) ( ON ?auto_8326 ?auto_8329 ) ( CLEAR ?auto_8326 ) ( not ( = ?auto_8327 ?auto_8329 ) ) ( not ( = ?auto_8328 ?auto_8329 ) ) ( not ( = ?auto_8326 ?auto_8329 ) ) ( not ( = ?auto_8335 ?auto_8329 ) ) ( not ( = ?auto_8336 ?auto_8329 ) ) ( not ( = ?auto_8325 ?auto_8329 ) ) ( TRUCK-AT ?auto_8331 ?auto_8332 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8326 ?auto_8327 ?auto_8328 )
      ( MAKE-3CRATE-VERIFY ?auto_8325 ?auto_8326 ?auto_8327 ?auto_8328 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8353 - SURFACE
      ?auto_8354 - SURFACE
    )
    :vars
    (
      ?auto_8355 - HOIST
      ?auto_8356 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8355 ?auto_8356 ) ( SURFACE-AT ?auto_8353 ?auto_8356 ) ( CLEAR ?auto_8353 ) ( LIFTING ?auto_8355 ?auto_8354 ) ( IS-CRATE ?auto_8354 ) ( not ( = ?auto_8353 ?auto_8354 ) ) )
    :subtasks
    ( ( !DROP ?auto_8355 ?auto_8354 ?auto_8353 ?auto_8356 )
      ( MAKE-1CRATE-VERIFY ?auto_8353 ?auto_8354 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8357 - SURFACE
      ?auto_8358 - SURFACE
      ?auto_8359 - SURFACE
    )
    :vars
    (
      ?auto_8361 - HOIST
      ?auto_8360 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8361 ?auto_8360 ) ( SURFACE-AT ?auto_8358 ?auto_8360 ) ( CLEAR ?auto_8358 ) ( LIFTING ?auto_8361 ?auto_8359 ) ( IS-CRATE ?auto_8359 ) ( not ( = ?auto_8358 ?auto_8359 ) ) ( ON ?auto_8358 ?auto_8357 ) ( not ( = ?auto_8357 ?auto_8358 ) ) ( not ( = ?auto_8357 ?auto_8359 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8358 ?auto_8359 )
      ( MAKE-2CRATE-VERIFY ?auto_8357 ?auto_8358 ?auto_8359 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8362 - SURFACE
      ?auto_8363 - SURFACE
      ?auto_8364 - SURFACE
      ?auto_8365 - SURFACE
    )
    :vars
    (
      ?auto_8367 - HOIST
      ?auto_8366 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8367 ?auto_8366 ) ( SURFACE-AT ?auto_8364 ?auto_8366 ) ( CLEAR ?auto_8364 ) ( LIFTING ?auto_8367 ?auto_8365 ) ( IS-CRATE ?auto_8365 ) ( not ( = ?auto_8364 ?auto_8365 ) ) ( ON ?auto_8363 ?auto_8362 ) ( ON ?auto_8364 ?auto_8363 ) ( not ( = ?auto_8362 ?auto_8363 ) ) ( not ( = ?auto_8362 ?auto_8364 ) ) ( not ( = ?auto_8362 ?auto_8365 ) ) ( not ( = ?auto_8363 ?auto_8364 ) ) ( not ( = ?auto_8363 ?auto_8365 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8364 ?auto_8365 )
      ( MAKE-3CRATE-VERIFY ?auto_8362 ?auto_8363 ?auto_8364 ?auto_8365 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8368 - SURFACE
      ?auto_8369 - SURFACE
      ?auto_8370 - SURFACE
      ?auto_8371 - SURFACE
      ?auto_8372 - SURFACE
    )
    :vars
    (
      ?auto_8374 - HOIST
      ?auto_8373 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8374 ?auto_8373 ) ( SURFACE-AT ?auto_8371 ?auto_8373 ) ( CLEAR ?auto_8371 ) ( LIFTING ?auto_8374 ?auto_8372 ) ( IS-CRATE ?auto_8372 ) ( not ( = ?auto_8371 ?auto_8372 ) ) ( ON ?auto_8369 ?auto_8368 ) ( ON ?auto_8370 ?auto_8369 ) ( ON ?auto_8371 ?auto_8370 ) ( not ( = ?auto_8368 ?auto_8369 ) ) ( not ( = ?auto_8368 ?auto_8370 ) ) ( not ( = ?auto_8368 ?auto_8371 ) ) ( not ( = ?auto_8368 ?auto_8372 ) ) ( not ( = ?auto_8369 ?auto_8370 ) ) ( not ( = ?auto_8369 ?auto_8371 ) ) ( not ( = ?auto_8369 ?auto_8372 ) ) ( not ( = ?auto_8370 ?auto_8371 ) ) ( not ( = ?auto_8370 ?auto_8372 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8371 ?auto_8372 )
      ( MAKE-4CRATE-VERIFY ?auto_8368 ?auto_8369 ?auto_8370 ?auto_8371 ?auto_8372 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8375 - SURFACE
      ?auto_8376 - SURFACE
    )
    :vars
    (
      ?auto_8378 - HOIST
      ?auto_8377 - PLACE
      ?auto_8379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8378 ?auto_8377 ) ( SURFACE-AT ?auto_8375 ?auto_8377 ) ( CLEAR ?auto_8375 ) ( IS-CRATE ?auto_8376 ) ( not ( = ?auto_8375 ?auto_8376 ) ) ( TRUCK-AT ?auto_8379 ?auto_8377 ) ( AVAILABLE ?auto_8378 ) ( IN ?auto_8376 ?auto_8379 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8378 ?auto_8376 ?auto_8379 ?auto_8377 )
      ( MAKE-1CRATE ?auto_8375 ?auto_8376 )
      ( MAKE-1CRATE-VERIFY ?auto_8375 ?auto_8376 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8380 - SURFACE
      ?auto_8381 - SURFACE
      ?auto_8382 - SURFACE
    )
    :vars
    (
      ?auto_8384 - HOIST
      ?auto_8385 - PLACE
      ?auto_8383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8384 ?auto_8385 ) ( SURFACE-AT ?auto_8381 ?auto_8385 ) ( CLEAR ?auto_8381 ) ( IS-CRATE ?auto_8382 ) ( not ( = ?auto_8381 ?auto_8382 ) ) ( TRUCK-AT ?auto_8383 ?auto_8385 ) ( AVAILABLE ?auto_8384 ) ( IN ?auto_8382 ?auto_8383 ) ( ON ?auto_8381 ?auto_8380 ) ( not ( = ?auto_8380 ?auto_8381 ) ) ( not ( = ?auto_8380 ?auto_8382 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8381 ?auto_8382 )
      ( MAKE-2CRATE-VERIFY ?auto_8380 ?auto_8381 ?auto_8382 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8386 - SURFACE
      ?auto_8387 - SURFACE
      ?auto_8388 - SURFACE
      ?auto_8389 - SURFACE
    )
    :vars
    (
      ?auto_8392 - HOIST
      ?auto_8391 - PLACE
      ?auto_8390 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8392 ?auto_8391 ) ( SURFACE-AT ?auto_8388 ?auto_8391 ) ( CLEAR ?auto_8388 ) ( IS-CRATE ?auto_8389 ) ( not ( = ?auto_8388 ?auto_8389 ) ) ( TRUCK-AT ?auto_8390 ?auto_8391 ) ( AVAILABLE ?auto_8392 ) ( IN ?auto_8389 ?auto_8390 ) ( ON ?auto_8388 ?auto_8387 ) ( not ( = ?auto_8387 ?auto_8388 ) ) ( not ( = ?auto_8387 ?auto_8389 ) ) ( ON ?auto_8387 ?auto_8386 ) ( not ( = ?auto_8386 ?auto_8387 ) ) ( not ( = ?auto_8386 ?auto_8388 ) ) ( not ( = ?auto_8386 ?auto_8389 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8387 ?auto_8388 ?auto_8389 )
      ( MAKE-3CRATE-VERIFY ?auto_8386 ?auto_8387 ?auto_8388 ?auto_8389 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8393 - SURFACE
      ?auto_8394 - SURFACE
      ?auto_8395 - SURFACE
      ?auto_8396 - SURFACE
      ?auto_8397 - SURFACE
    )
    :vars
    (
      ?auto_8400 - HOIST
      ?auto_8399 - PLACE
      ?auto_8398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8400 ?auto_8399 ) ( SURFACE-AT ?auto_8396 ?auto_8399 ) ( CLEAR ?auto_8396 ) ( IS-CRATE ?auto_8397 ) ( not ( = ?auto_8396 ?auto_8397 ) ) ( TRUCK-AT ?auto_8398 ?auto_8399 ) ( AVAILABLE ?auto_8400 ) ( IN ?auto_8397 ?auto_8398 ) ( ON ?auto_8396 ?auto_8395 ) ( not ( = ?auto_8395 ?auto_8396 ) ) ( not ( = ?auto_8395 ?auto_8397 ) ) ( ON ?auto_8394 ?auto_8393 ) ( ON ?auto_8395 ?auto_8394 ) ( not ( = ?auto_8393 ?auto_8394 ) ) ( not ( = ?auto_8393 ?auto_8395 ) ) ( not ( = ?auto_8393 ?auto_8396 ) ) ( not ( = ?auto_8393 ?auto_8397 ) ) ( not ( = ?auto_8394 ?auto_8395 ) ) ( not ( = ?auto_8394 ?auto_8396 ) ) ( not ( = ?auto_8394 ?auto_8397 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8395 ?auto_8396 ?auto_8397 )
      ( MAKE-4CRATE-VERIFY ?auto_8393 ?auto_8394 ?auto_8395 ?auto_8396 ?auto_8397 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8401 - SURFACE
      ?auto_8402 - SURFACE
    )
    :vars
    (
      ?auto_8406 - HOIST
      ?auto_8405 - PLACE
      ?auto_8404 - TRUCK
      ?auto_8403 - SURFACE
      ?auto_8407 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8406 ?auto_8405 ) ( SURFACE-AT ?auto_8401 ?auto_8405 ) ( CLEAR ?auto_8401 ) ( IS-CRATE ?auto_8402 ) ( not ( = ?auto_8401 ?auto_8402 ) ) ( AVAILABLE ?auto_8406 ) ( IN ?auto_8402 ?auto_8404 ) ( ON ?auto_8401 ?auto_8403 ) ( not ( = ?auto_8403 ?auto_8401 ) ) ( not ( = ?auto_8403 ?auto_8402 ) ) ( TRUCK-AT ?auto_8404 ?auto_8407 ) ( not ( = ?auto_8407 ?auto_8405 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8404 ?auto_8407 ?auto_8405 )
      ( MAKE-2CRATE ?auto_8403 ?auto_8401 ?auto_8402 )
      ( MAKE-1CRATE-VERIFY ?auto_8401 ?auto_8402 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8408 - SURFACE
      ?auto_8409 - SURFACE
      ?auto_8410 - SURFACE
    )
    :vars
    (
      ?auto_8412 - HOIST
      ?auto_8413 - PLACE
      ?auto_8411 - TRUCK
      ?auto_8414 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8412 ?auto_8413 ) ( SURFACE-AT ?auto_8409 ?auto_8413 ) ( CLEAR ?auto_8409 ) ( IS-CRATE ?auto_8410 ) ( not ( = ?auto_8409 ?auto_8410 ) ) ( AVAILABLE ?auto_8412 ) ( IN ?auto_8410 ?auto_8411 ) ( ON ?auto_8409 ?auto_8408 ) ( not ( = ?auto_8408 ?auto_8409 ) ) ( not ( = ?auto_8408 ?auto_8410 ) ) ( TRUCK-AT ?auto_8411 ?auto_8414 ) ( not ( = ?auto_8414 ?auto_8413 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8409 ?auto_8410 )
      ( MAKE-2CRATE-VERIFY ?auto_8408 ?auto_8409 ?auto_8410 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8415 - SURFACE
      ?auto_8416 - SURFACE
      ?auto_8417 - SURFACE
      ?auto_8418 - SURFACE
    )
    :vars
    (
      ?auto_8421 - HOIST
      ?auto_8422 - PLACE
      ?auto_8419 - TRUCK
      ?auto_8420 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8421 ?auto_8422 ) ( SURFACE-AT ?auto_8417 ?auto_8422 ) ( CLEAR ?auto_8417 ) ( IS-CRATE ?auto_8418 ) ( not ( = ?auto_8417 ?auto_8418 ) ) ( AVAILABLE ?auto_8421 ) ( IN ?auto_8418 ?auto_8419 ) ( ON ?auto_8417 ?auto_8416 ) ( not ( = ?auto_8416 ?auto_8417 ) ) ( not ( = ?auto_8416 ?auto_8418 ) ) ( TRUCK-AT ?auto_8419 ?auto_8420 ) ( not ( = ?auto_8420 ?auto_8422 ) ) ( ON ?auto_8416 ?auto_8415 ) ( not ( = ?auto_8415 ?auto_8416 ) ) ( not ( = ?auto_8415 ?auto_8417 ) ) ( not ( = ?auto_8415 ?auto_8418 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8416 ?auto_8417 ?auto_8418 )
      ( MAKE-3CRATE-VERIFY ?auto_8415 ?auto_8416 ?auto_8417 ?auto_8418 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8423 - SURFACE
      ?auto_8424 - SURFACE
      ?auto_8425 - SURFACE
      ?auto_8426 - SURFACE
      ?auto_8427 - SURFACE
    )
    :vars
    (
      ?auto_8430 - HOIST
      ?auto_8431 - PLACE
      ?auto_8428 - TRUCK
      ?auto_8429 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8430 ?auto_8431 ) ( SURFACE-AT ?auto_8426 ?auto_8431 ) ( CLEAR ?auto_8426 ) ( IS-CRATE ?auto_8427 ) ( not ( = ?auto_8426 ?auto_8427 ) ) ( AVAILABLE ?auto_8430 ) ( IN ?auto_8427 ?auto_8428 ) ( ON ?auto_8426 ?auto_8425 ) ( not ( = ?auto_8425 ?auto_8426 ) ) ( not ( = ?auto_8425 ?auto_8427 ) ) ( TRUCK-AT ?auto_8428 ?auto_8429 ) ( not ( = ?auto_8429 ?auto_8431 ) ) ( ON ?auto_8424 ?auto_8423 ) ( ON ?auto_8425 ?auto_8424 ) ( not ( = ?auto_8423 ?auto_8424 ) ) ( not ( = ?auto_8423 ?auto_8425 ) ) ( not ( = ?auto_8423 ?auto_8426 ) ) ( not ( = ?auto_8423 ?auto_8427 ) ) ( not ( = ?auto_8424 ?auto_8425 ) ) ( not ( = ?auto_8424 ?auto_8426 ) ) ( not ( = ?auto_8424 ?auto_8427 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8425 ?auto_8426 ?auto_8427 )
      ( MAKE-4CRATE-VERIFY ?auto_8423 ?auto_8424 ?auto_8425 ?auto_8426 ?auto_8427 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8432 - SURFACE
      ?auto_8433 - SURFACE
    )
    :vars
    (
      ?auto_8437 - HOIST
      ?auto_8438 - PLACE
      ?auto_8434 - SURFACE
      ?auto_8435 - TRUCK
      ?auto_8436 - PLACE
      ?auto_8439 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8437 ?auto_8438 ) ( SURFACE-AT ?auto_8432 ?auto_8438 ) ( CLEAR ?auto_8432 ) ( IS-CRATE ?auto_8433 ) ( not ( = ?auto_8432 ?auto_8433 ) ) ( AVAILABLE ?auto_8437 ) ( ON ?auto_8432 ?auto_8434 ) ( not ( = ?auto_8434 ?auto_8432 ) ) ( not ( = ?auto_8434 ?auto_8433 ) ) ( TRUCK-AT ?auto_8435 ?auto_8436 ) ( not ( = ?auto_8436 ?auto_8438 ) ) ( HOIST-AT ?auto_8439 ?auto_8436 ) ( LIFTING ?auto_8439 ?auto_8433 ) ( not ( = ?auto_8437 ?auto_8439 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8439 ?auto_8433 ?auto_8435 ?auto_8436 )
      ( MAKE-2CRATE ?auto_8434 ?auto_8432 ?auto_8433 )
      ( MAKE-1CRATE-VERIFY ?auto_8432 ?auto_8433 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8440 - SURFACE
      ?auto_8441 - SURFACE
      ?auto_8442 - SURFACE
    )
    :vars
    (
      ?auto_8445 - HOIST
      ?auto_8447 - PLACE
      ?auto_8443 - TRUCK
      ?auto_8444 - PLACE
      ?auto_8446 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8445 ?auto_8447 ) ( SURFACE-AT ?auto_8441 ?auto_8447 ) ( CLEAR ?auto_8441 ) ( IS-CRATE ?auto_8442 ) ( not ( = ?auto_8441 ?auto_8442 ) ) ( AVAILABLE ?auto_8445 ) ( ON ?auto_8441 ?auto_8440 ) ( not ( = ?auto_8440 ?auto_8441 ) ) ( not ( = ?auto_8440 ?auto_8442 ) ) ( TRUCK-AT ?auto_8443 ?auto_8444 ) ( not ( = ?auto_8444 ?auto_8447 ) ) ( HOIST-AT ?auto_8446 ?auto_8444 ) ( LIFTING ?auto_8446 ?auto_8442 ) ( not ( = ?auto_8445 ?auto_8446 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8441 ?auto_8442 )
      ( MAKE-2CRATE-VERIFY ?auto_8440 ?auto_8441 ?auto_8442 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8448 - SURFACE
      ?auto_8449 - SURFACE
      ?auto_8450 - SURFACE
      ?auto_8451 - SURFACE
    )
    :vars
    (
      ?auto_8454 - HOIST
      ?auto_8453 - PLACE
      ?auto_8452 - TRUCK
      ?auto_8456 - PLACE
      ?auto_8455 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8454 ?auto_8453 ) ( SURFACE-AT ?auto_8450 ?auto_8453 ) ( CLEAR ?auto_8450 ) ( IS-CRATE ?auto_8451 ) ( not ( = ?auto_8450 ?auto_8451 ) ) ( AVAILABLE ?auto_8454 ) ( ON ?auto_8450 ?auto_8449 ) ( not ( = ?auto_8449 ?auto_8450 ) ) ( not ( = ?auto_8449 ?auto_8451 ) ) ( TRUCK-AT ?auto_8452 ?auto_8456 ) ( not ( = ?auto_8456 ?auto_8453 ) ) ( HOIST-AT ?auto_8455 ?auto_8456 ) ( LIFTING ?auto_8455 ?auto_8451 ) ( not ( = ?auto_8454 ?auto_8455 ) ) ( ON ?auto_8449 ?auto_8448 ) ( not ( = ?auto_8448 ?auto_8449 ) ) ( not ( = ?auto_8448 ?auto_8450 ) ) ( not ( = ?auto_8448 ?auto_8451 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8449 ?auto_8450 ?auto_8451 )
      ( MAKE-3CRATE-VERIFY ?auto_8448 ?auto_8449 ?auto_8450 ?auto_8451 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8457 - SURFACE
      ?auto_8458 - SURFACE
      ?auto_8459 - SURFACE
      ?auto_8460 - SURFACE
      ?auto_8461 - SURFACE
    )
    :vars
    (
      ?auto_8464 - HOIST
      ?auto_8463 - PLACE
      ?auto_8462 - TRUCK
      ?auto_8466 - PLACE
      ?auto_8465 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8464 ?auto_8463 ) ( SURFACE-AT ?auto_8460 ?auto_8463 ) ( CLEAR ?auto_8460 ) ( IS-CRATE ?auto_8461 ) ( not ( = ?auto_8460 ?auto_8461 ) ) ( AVAILABLE ?auto_8464 ) ( ON ?auto_8460 ?auto_8459 ) ( not ( = ?auto_8459 ?auto_8460 ) ) ( not ( = ?auto_8459 ?auto_8461 ) ) ( TRUCK-AT ?auto_8462 ?auto_8466 ) ( not ( = ?auto_8466 ?auto_8463 ) ) ( HOIST-AT ?auto_8465 ?auto_8466 ) ( LIFTING ?auto_8465 ?auto_8461 ) ( not ( = ?auto_8464 ?auto_8465 ) ) ( ON ?auto_8458 ?auto_8457 ) ( ON ?auto_8459 ?auto_8458 ) ( not ( = ?auto_8457 ?auto_8458 ) ) ( not ( = ?auto_8457 ?auto_8459 ) ) ( not ( = ?auto_8457 ?auto_8460 ) ) ( not ( = ?auto_8457 ?auto_8461 ) ) ( not ( = ?auto_8458 ?auto_8459 ) ) ( not ( = ?auto_8458 ?auto_8460 ) ) ( not ( = ?auto_8458 ?auto_8461 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8459 ?auto_8460 ?auto_8461 )
      ( MAKE-4CRATE-VERIFY ?auto_8457 ?auto_8458 ?auto_8459 ?auto_8460 ?auto_8461 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8467 - SURFACE
      ?auto_8468 - SURFACE
    )
    :vars
    (
      ?auto_8472 - HOIST
      ?auto_8471 - PLACE
      ?auto_8469 - SURFACE
      ?auto_8470 - TRUCK
      ?auto_8474 - PLACE
      ?auto_8473 - HOIST
      ?auto_8475 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8472 ?auto_8471 ) ( SURFACE-AT ?auto_8467 ?auto_8471 ) ( CLEAR ?auto_8467 ) ( IS-CRATE ?auto_8468 ) ( not ( = ?auto_8467 ?auto_8468 ) ) ( AVAILABLE ?auto_8472 ) ( ON ?auto_8467 ?auto_8469 ) ( not ( = ?auto_8469 ?auto_8467 ) ) ( not ( = ?auto_8469 ?auto_8468 ) ) ( TRUCK-AT ?auto_8470 ?auto_8474 ) ( not ( = ?auto_8474 ?auto_8471 ) ) ( HOIST-AT ?auto_8473 ?auto_8474 ) ( not ( = ?auto_8472 ?auto_8473 ) ) ( AVAILABLE ?auto_8473 ) ( SURFACE-AT ?auto_8468 ?auto_8474 ) ( ON ?auto_8468 ?auto_8475 ) ( CLEAR ?auto_8468 ) ( not ( = ?auto_8467 ?auto_8475 ) ) ( not ( = ?auto_8468 ?auto_8475 ) ) ( not ( = ?auto_8469 ?auto_8475 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8473 ?auto_8468 ?auto_8475 ?auto_8474 )
      ( MAKE-2CRATE ?auto_8469 ?auto_8467 ?auto_8468 )
      ( MAKE-1CRATE-VERIFY ?auto_8467 ?auto_8468 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8476 - SURFACE
      ?auto_8477 - SURFACE
      ?auto_8478 - SURFACE
    )
    :vars
    (
      ?auto_8480 - HOIST
      ?auto_8484 - PLACE
      ?auto_8483 - TRUCK
      ?auto_8481 - PLACE
      ?auto_8482 - HOIST
      ?auto_8479 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8480 ?auto_8484 ) ( SURFACE-AT ?auto_8477 ?auto_8484 ) ( CLEAR ?auto_8477 ) ( IS-CRATE ?auto_8478 ) ( not ( = ?auto_8477 ?auto_8478 ) ) ( AVAILABLE ?auto_8480 ) ( ON ?auto_8477 ?auto_8476 ) ( not ( = ?auto_8476 ?auto_8477 ) ) ( not ( = ?auto_8476 ?auto_8478 ) ) ( TRUCK-AT ?auto_8483 ?auto_8481 ) ( not ( = ?auto_8481 ?auto_8484 ) ) ( HOIST-AT ?auto_8482 ?auto_8481 ) ( not ( = ?auto_8480 ?auto_8482 ) ) ( AVAILABLE ?auto_8482 ) ( SURFACE-AT ?auto_8478 ?auto_8481 ) ( ON ?auto_8478 ?auto_8479 ) ( CLEAR ?auto_8478 ) ( not ( = ?auto_8477 ?auto_8479 ) ) ( not ( = ?auto_8478 ?auto_8479 ) ) ( not ( = ?auto_8476 ?auto_8479 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8477 ?auto_8478 )
      ( MAKE-2CRATE-VERIFY ?auto_8476 ?auto_8477 ?auto_8478 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8485 - SURFACE
      ?auto_8486 - SURFACE
      ?auto_8487 - SURFACE
      ?auto_8488 - SURFACE
    )
    :vars
    (
      ?auto_8489 - HOIST
      ?auto_8493 - PLACE
      ?auto_8491 - TRUCK
      ?auto_8492 - PLACE
      ?auto_8494 - HOIST
      ?auto_8490 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8489 ?auto_8493 ) ( SURFACE-AT ?auto_8487 ?auto_8493 ) ( CLEAR ?auto_8487 ) ( IS-CRATE ?auto_8488 ) ( not ( = ?auto_8487 ?auto_8488 ) ) ( AVAILABLE ?auto_8489 ) ( ON ?auto_8487 ?auto_8486 ) ( not ( = ?auto_8486 ?auto_8487 ) ) ( not ( = ?auto_8486 ?auto_8488 ) ) ( TRUCK-AT ?auto_8491 ?auto_8492 ) ( not ( = ?auto_8492 ?auto_8493 ) ) ( HOIST-AT ?auto_8494 ?auto_8492 ) ( not ( = ?auto_8489 ?auto_8494 ) ) ( AVAILABLE ?auto_8494 ) ( SURFACE-AT ?auto_8488 ?auto_8492 ) ( ON ?auto_8488 ?auto_8490 ) ( CLEAR ?auto_8488 ) ( not ( = ?auto_8487 ?auto_8490 ) ) ( not ( = ?auto_8488 ?auto_8490 ) ) ( not ( = ?auto_8486 ?auto_8490 ) ) ( ON ?auto_8486 ?auto_8485 ) ( not ( = ?auto_8485 ?auto_8486 ) ) ( not ( = ?auto_8485 ?auto_8487 ) ) ( not ( = ?auto_8485 ?auto_8488 ) ) ( not ( = ?auto_8485 ?auto_8490 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8486 ?auto_8487 ?auto_8488 )
      ( MAKE-3CRATE-VERIFY ?auto_8485 ?auto_8486 ?auto_8487 ?auto_8488 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8495 - SURFACE
      ?auto_8496 - SURFACE
      ?auto_8497 - SURFACE
      ?auto_8498 - SURFACE
      ?auto_8499 - SURFACE
    )
    :vars
    (
      ?auto_8500 - HOIST
      ?auto_8504 - PLACE
      ?auto_8502 - TRUCK
      ?auto_8503 - PLACE
      ?auto_8505 - HOIST
      ?auto_8501 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8500 ?auto_8504 ) ( SURFACE-AT ?auto_8498 ?auto_8504 ) ( CLEAR ?auto_8498 ) ( IS-CRATE ?auto_8499 ) ( not ( = ?auto_8498 ?auto_8499 ) ) ( AVAILABLE ?auto_8500 ) ( ON ?auto_8498 ?auto_8497 ) ( not ( = ?auto_8497 ?auto_8498 ) ) ( not ( = ?auto_8497 ?auto_8499 ) ) ( TRUCK-AT ?auto_8502 ?auto_8503 ) ( not ( = ?auto_8503 ?auto_8504 ) ) ( HOIST-AT ?auto_8505 ?auto_8503 ) ( not ( = ?auto_8500 ?auto_8505 ) ) ( AVAILABLE ?auto_8505 ) ( SURFACE-AT ?auto_8499 ?auto_8503 ) ( ON ?auto_8499 ?auto_8501 ) ( CLEAR ?auto_8499 ) ( not ( = ?auto_8498 ?auto_8501 ) ) ( not ( = ?auto_8499 ?auto_8501 ) ) ( not ( = ?auto_8497 ?auto_8501 ) ) ( ON ?auto_8496 ?auto_8495 ) ( ON ?auto_8497 ?auto_8496 ) ( not ( = ?auto_8495 ?auto_8496 ) ) ( not ( = ?auto_8495 ?auto_8497 ) ) ( not ( = ?auto_8495 ?auto_8498 ) ) ( not ( = ?auto_8495 ?auto_8499 ) ) ( not ( = ?auto_8495 ?auto_8501 ) ) ( not ( = ?auto_8496 ?auto_8497 ) ) ( not ( = ?auto_8496 ?auto_8498 ) ) ( not ( = ?auto_8496 ?auto_8499 ) ) ( not ( = ?auto_8496 ?auto_8501 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8497 ?auto_8498 ?auto_8499 )
      ( MAKE-4CRATE-VERIFY ?auto_8495 ?auto_8496 ?auto_8497 ?auto_8498 ?auto_8499 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8506 - SURFACE
      ?auto_8507 - SURFACE
    )
    :vars
    (
      ?auto_8508 - HOIST
      ?auto_8512 - PLACE
      ?auto_8514 - SURFACE
      ?auto_8511 - PLACE
      ?auto_8513 - HOIST
      ?auto_8509 - SURFACE
      ?auto_8510 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8508 ?auto_8512 ) ( SURFACE-AT ?auto_8506 ?auto_8512 ) ( CLEAR ?auto_8506 ) ( IS-CRATE ?auto_8507 ) ( not ( = ?auto_8506 ?auto_8507 ) ) ( AVAILABLE ?auto_8508 ) ( ON ?auto_8506 ?auto_8514 ) ( not ( = ?auto_8514 ?auto_8506 ) ) ( not ( = ?auto_8514 ?auto_8507 ) ) ( not ( = ?auto_8511 ?auto_8512 ) ) ( HOIST-AT ?auto_8513 ?auto_8511 ) ( not ( = ?auto_8508 ?auto_8513 ) ) ( AVAILABLE ?auto_8513 ) ( SURFACE-AT ?auto_8507 ?auto_8511 ) ( ON ?auto_8507 ?auto_8509 ) ( CLEAR ?auto_8507 ) ( not ( = ?auto_8506 ?auto_8509 ) ) ( not ( = ?auto_8507 ?auto_8509 ) ) ( not ( = ?auto_8514 ?auto_8509 ) ) ( TRUCK-AT ?auto_8510 ?auto_8512 ) )
    :subtasks
    ( ( !DRIVE ?auto_8510 ?auto_8512 ?auto_8511 )
      ( MAKE-2CRATE ?auto_8514 ?auto_8506 ?auto_8507 )
      ( MAKE-1CRATE-VERIFY ?auto_8506 ?auto_8507 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8515 - SURFACE
      ?auto_8516 - SURFACE
      ?auto_8517 - SURFACE
    )
    :vars
    (
      ?auto_8521 - HOIST
      ?auto_8522 - PLACE
      ?auto_8519 - PLACE
      ?auto_8518 - HOIST
      ?auto_8523 - SURFACE
      ?auto_8520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8521 ?auto_8522 ) ( SURFACE-AT ?auto_8516 ?auto_8522 ) ( CLEAR ?auto_8516 ) ( IS-CRATE ?auto_8517 ) ( not ( = ?auto_8516 ?auto_8517 ) ) ( AVAILABLE ?auto_8521 ) ( ON ?auto_8516 ?auto_8515 ) ( not ( = ?auto_8515 ?auto_8516 ) ) ( not ( = ?auto_8515 ?auto_8517 ) ) ( not ( = ?auto_8519 ?auto_8522 ) ) ( HOIST-AT ?auto_8518 ?auto_8519 ) ( not ( = ?auto_8521 ?auto_8518 ) ) ( AVAILABLE ?auto_8518 ) ( SURFACE-AT ?auto_8517 ?auto_8519 ) ( ON ?auto_8517 ?auto_8523 ) ( CLEAR ?auto_8517 ) ( not ( = ?auto_8516 ?auto_8523 ) ) ( not ( = ?auto_8517 ?auto_8523 ) ) ( not ( = ?auto_8515 ?auto_8523 ) ) ( TRUCK-AT ?auto_8520 ?auto_8522 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8516 ?auto_8517 )
      ( MAKE-2CRATE-VERIFY ?auto_8515 ?auto_8516 ?auto_8517 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8524 - SURFACE
      ?auto_8525 - SURFACE
      ?auto_8526 - SURFACE
      ?auto_8527 - SURFACE
    )
    :vars
    (
      ?auto_8529 - HOIST
      ?auto_8531 - PLACE
      ?auto_8532 - PLACE
      ?auto_8528 - HOIST
      ?auto_8533 - SURFACE
      ?auto_8530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8529 ?auto_8531 ) ( SURFACE-AT ?auto_8526 ?auto_8531 ) ( CLEAR ?auto_8526 ) ( IS-CRATE ?auto_8527 ) ( not ( = ?auto_8526 ?auto_8527 ) ) ( AVAILABLE ?auto_8529 ) ( ON ?auto_8526 ?auto_8525 ) ( not ( = ?auto_8525 ?auto_8526 ) ) ( not ( = ?auto_8525 ?auto_8527 ) ) ( not ( = ?auto_8532 ?auto_8531 ) ) ( HOIST-AT ?auto_8528 ?auto_8532 ) ( not ( = ?auto_8529 ?auto_8528 ) ) ( AVAILABLE ?auto_8528 ) ( SURFACE-AT ?auto_8527 ?auto_8532 ) ( ON ?auto_8527 ?auto_8533 ) ( CLEAR ?auto_8527 ) ( not ( = ?auto_8526 ?auto_8533 ) ) ( not ( = ?auto_8527 ?auto_8533 ) ) ( not ( = ?auto_8525 ?auto_8533 ) ) ( TRUCK-AT ?auto_8530 ?auto_8531 ) ( ON ?auto_8525 ?auto_8524 ) ( not ( = ?auto_8524 ?auto_8525 ) ) ( not ( = ?auto_8524 ?auto_8526 ) ) ( not ( = ?auto_8524 ?auto_8527 ) ) ( not ( = ?auto_8524 ?auto_8533 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8525 ?auto_8526 ?auto_8527 )
      ( MAKE-3CRATE-VERIFY ?auto_8524 ?auto_8525 ?auto_8526 ?auto_8527 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8534 - SURFACE
      ?auto_8535 - SURFACE
      ?auto_8536 - SURFACE
      ?auto_8537 - SURFACE
      ?auto_8538 - SURFACE
    )
    :vars
    (
      ?auto_8540 - HOIST
      ?auto_8542 - PLACE
      ?auto_8543 - PLACE
      ?auto_8539 - HOIST
      ?auto_8544 - SURFACE
      ?auto_8541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8540 ?auto_8542 ) ( SURFACE-AT ?auto_8537 ?auto_8542 ) ( CLEAR ?auto_8537 ) ( IS-CRATE ?auto_8538 ) ( not ( = ?auto_8537 ?auto_8538 ) ) ( AVAILABLE ?auto_8540 ) ( ON ?auto_8537 ?auto_8536 ) ( not ( = ?auto_8536 ?auto_8537 ) ) ( not ( = ?auto_8536 ?auto_8538 ) ) ( not ( = ?auto_8543 ?auto_8542 ) ) ( HOIST-AT ?auto_8539 ?auto_8543 ) ( not ( = ?auto_8540 ?auto_8539 ) ) ( AVAILABLE ?auto_8539 ) ( SURFACE-AT ?auto_8538 ?auto_8543 ) ( ON ?auto_8538 ?auto_8544 ) ( CLEAR ?auto_8538 ) ( not ( = ?auto_8537 ?auto_8544 ) ) ( not ( = ?auto_8538 ?auto_8544 ) ) ( not ( = ?auto_8536 ?auto_8544 ) ) ( TRUCK-AT ?auto_8541 ?auto_8542 ) ( ON ?auto_8535 ?auto_8534 ) ( ON ?auto_8536 ?auto_8535 ) ( not ( = ?auto_8534 ?auto_8535 ) ) ( not ( = ?auto_8534 ?auto_8536 ) ) ( not ( = ?auto_8534 ?auto_8537 ) ) ( not ( = ?auto_8534 ?auto_8538 ) ) ( not ( = ?auto_8534 ?auto_8544 ) ) ( not ( = ?auto_8535 ?auto_8536 ) ) ( not ( = ?auto_8535 ?auto_8537 ) ) ( not ( = ?auto_8535 ?auto_8538 ) ) ( not ( = ?auto_8535 ?auto_8544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8536 ?auto_8537 ?auto_8538 )
      ( MAKE-4CRATE-VERIFY ?auto_8534 ?auto_8535 ?auto_8536 ?auto_8537 ?auto_8538 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8545 - SURFACE
      ?auto_8546 - SURFACE
    )
    :vars
    (
      ?auto_8548 - HOIST
      ?auto_8551 - PLACE
      ?auto_8550 - SURFACE
      ?auto_8552 - PLACE
      ?auto_8547 - HOIST
      ?auto_8553 - SURFACE
      ?auto_8549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8548 ?auto_8551 ) ( IS-CRATE ?auto_8546 ) ( not ( = ?auto_8545 ?auto_8546 ) ) ( not ( = ?auto_8550 ?auto_8545 ) ) ( not ( = ?auto_8550 ?auto_8546 ) ) ( not ( = ?auto_8552 ?auto_8551 ) ) ( HOIST-AT ?auto_8547 ?auto_8552 ) ( not ( = ?auto_8548 ?auto_8547 ) ) ( AVAILABLE ?auto_8547 ) ( SURFACE-AT ?auto_8546 ?auto_8552 ) ( ON ?auto_8546 ?auto_8553 ) ( CLEAR ?auto_8546 ) ( not ( = ?auto_8545 ?auto_8553 ) ) ( not ( = ?auto_8546 ?auto_8553 ) ) ( not ( = ?auto_8550 ?auto_8553 ) ) ( TRUCK-AT ?auto_8549 ?auto_8551 ) ( SURFACE-AT ?auto_8550 ?auto_8551 ) ( CLEAR ?auto_8550 ) ( LIFTING ?auto_8548 ?auto_8545 ) ( IS-CRATE ?auto_8545 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8550 ?auto_8545 )
      ( MAKE-2CRATE ?auto_8550 ?auto_8545 ?auto_8546 )
      ( MAKE-1CRATE-VERIFY ?auto_8545 ?auto_8546 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8554 - SURFACE
      ?auto_8555 - SURFACE
      ?auto_8556 - SURFACE
    )
    :vars
    (
      ?auto_8557 - HOIST
      ?auto_8558 - PLACE
      ?auto_8561 - PLACE
      ?auto_8560 - HOIST
      ?auto_8562 - SURFACE
      ?auto_8559 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8557 ?auto_8558 ) ( IS-CRATE ?auto_8556 ) ( not ( = ?auto_8555 ?auto_8556 ) ) ( not ( = ?auto_8554 ?auto_8555 ) ) ( not ( = ?auto_8554 ?auto_8556 ) ) ( not ( = ?auto_8561 ?auto_8558 ) ) ( HOIST-AT ?auto_8560 ?auto_8561 ) ( not ( = ?auto_8557 ?auto_8560 ) ) ( AVAILABLE ?auto_8560 ) ( SURFACE-AT ?auto_8556 ?auto_8561 ) ( ON ?auto_8556 ?auto_8562 ) ( CLEAR ?auto_8556 ) ( not ( = ?auto_8555 ?auto_8562 ) ) ( not ( = ?auto_8556 ?auto_8562 ) ) ( not ( = ?auto_8554 ?auto_8562 ) ) ( TRUCK-AT ?auto_8559 ?auto_8558 ) ( SURFACE-AT ?auto_8554 ?auto_8558 ) ( CLEAR ?auto_8554 ) ( LIFTING ?auto_8557 ?auto_8555 ) ( IS-CRATE ?auto_8555 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8555 ?auto_8556 )
      ( MAKE-2CRATE-VERIFY ?auto_8554 ?auto_8555 ?auto_8556 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8563 - SURFACE
      ?auto_8564 - SURFACE
      ?auto_8565 - SURFACE
      ?auto_8566 - SURFACE
    )
    :vars
    (
      ?auto_8572 - HOIST
      ?auto_8568 - PLACE
      ?auto_8569 - PLACE
      ?auto_8570 - HOIST
      ?auto_8567 - SURFACE
      ?auto_8571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8572 ?auto_8568 ) ( IS-CRATE ?auto_8566 ) ( not ( = ?auto_8565 ?auto_8566 ) ) ( not ( = ?auto_8564 ?auto_8565 ) ) ( not ( = ?auto_8564 ?auto_8566 ) ) ( not ( = ?auto_8569 ?auto_8568 ) ) ( HOIST-AT ?auto_8570 ?auto_8569 ) ( not ( = ?auto_8572 ?auto_8570 ) ) ( AVAILABLE ?auto_8570 ) ( SURFACE-AT ?auto_8566 ?auto_8569 ) ( ON ?auto_8566 ?auto_8567 ) ( CLEAR ?auto_8566 ) ( not ( = ?auto_8565 ?auto_8567 ) ) ( not ( = ?auto_8566 ?auto_8567 ) ) ( not ( = ?auto_8564 ?auto_8567 ) ) ( TRUCK-AT ?auto_8571 ?auto_8568 ) ( SURFACE-AT ?auto_8564 ?auto_8568 ) ( CLEAR ?auto_8564 ) ( LIFTING ?auto_8572 ?auto_8565 ) ( IS-CRATE ?auto_8565 ) ( ON ?auto_8564 ?auto_8563 ) ( not ( = ?auto_8563 ?auto_8564 ) ) ( not ( = ?auto_8563 ?auto_8565 ) ) ( not ( = ?auto_8563 ?auto_8566 ) ) ( not ( = ?auto_8563 ?auto_8567 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8564 ?auto_8565 ?auto_8566 )
      ( MAKE-3CRATE-VERIFY ?auto_8563 ?auto_8564 ?auto_8565 ?auto_8566 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8573 - SURFACE
      ?auto_8574 - SURFACE
      ?auto_8575 - SURFACE
      ?auto_8576 - SURFACE
      ?auto_8577 - SURFACE
    )
    :vars
    (
      ?auto_8583 - HOIST
      ?auto_8579 - PLACE
      ?auto_8580 - PLACE
      ?auto_8581 - HOIST
      ?auto_8578 - SURFACE
      ?auto_8582 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8583 ?auto_8579 ) ( IS-CRATE ?auto_8577 ) ( not ( = ?auto_8576 ?auto_8577 ) ) ( not ( = ?auto_8575 ?auto_8576 ) ) ( not ( = ?auto_8575 ?auto_8577 ) ) ( not ( = ?auto_8580 ?auto_8579 ) ) ( HOIST-AT ?auto_8581 ?auto_8580 ) ( not ( = ?auto_8583 ?auto_8581 ) ) ( AVAILABLE ?auto_8581 ) ( SURFACE-AT ?auto_8577 ?auto_8580 ) ( ON ?auto_8577 ?auto_8578 ) ( CLEAR ?auto_8577 ) ( not ( = ?auto_8576 ?auto_8578 ) ) ( not ( = ?auto_8577 ?auto_8578 ) ) ( not ( = ?auto_8575 ?auto_8578 ) ) ( TRUCK-AT ?auto_8582 ?auto_8579 ) ( SURFACE-AT ?auto_8575 ?auto_8579 ) ( CLEAR ?auto_8575 ) ( LIFTING ?auto_8583 ?auto_8576 ) ( IS-CRATE ?auto_8576 ) ( ON ?auto_8574 ?auto_8573 ) ( ON ?auto_8575 ?auto_8574 ) ( not ( = ?auto_8573 ?auto_8574 ) ) ( not ( = ?auto_8573 ?auto_8575 ) ) ( not ( = ?auto_8573 ?auto_8576 ) ) ( not ( = ?auto_8573 ?auto_8577 ) ) ( not ( = ?auto_8573 ?auto_8578 ) ) ( not ( = ?auto_8574 ?auto_8575 ) ) ( not ( = ?auto_8574 ?auto_8576 ) ) ( not ( = ?auto_8574 ?auto_8577 ) ) ( not ( = ?auto_8574 ?auto_8578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8575 ?auto_8576 ?auto_8577 )
      ( MAKE-4CRATE-VERIFY ?auto_8573 ?auto_8574 ?auto_8575 ?auto_8576 ?auto_8577 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8584 - SURFACE
      ?auto_8585 - SURFACE
    )
    :vars
    (
      ?auto_8592 - HOIST
      ?auto_8588 - PLACE
      ?auto_8586 - SURFACE
      ?auto_8589 - PLACE
      ?auto_8590 - HOIST
      ?auto_8587 - SURFACE
      ?auto_8591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8592 ?auto_8588 ) ( IS-CRATE ?auto_8585 ) ( not ( = ?auto_8584 ?auto_8585 ) ) ( not ( = ?auto_8586 ?auto_8584 ) ) ( not ( = ?auto_8586 ?auto_8585 ) ) ( not ( = ?auto_8589 ?auto_8588 ) ) ( HOIST-AT ?auto_8590 ?auto_8589 ) ( not ( = ?auto_8592 ?auto_8590 ) ) ( AVAILABLE ?auto_8590 ) ( SURFACE-AT ?auto_8585 ?auto_8589 ) ( ON ?auto_8585 ?auto_8587 ) ( CLEAR ?auto_8585 ) ( not ( = ?auto_8584 ?auto_8587 ) ) ( not ( = ?auto_8585 ?auto_8587 ) ) ( not ( = ?auto_8586 ?auto_8587 ) ) ( TRUCK-AT ?auto_8591 ?auto_8588 ) ( SURFACE-AT ?auto_8586 ?auto_8588 ) ( CLEAR ?auto_8586 ) ( IS-CRATE ?auto_8584 ) ( AVAILABLE ?auto_8592 ) ( IN ?auto_8584 ?auto_8591 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8592 ?auto_8584 ?auto_8591 ?auto_8588 )
      ( MAKE-2CRATE ?auto_8586 ?auto_8584 ?auto_8585 )
      ( MAKE-1CRATE-VERIFY ?auto_8584 ?auto_8585 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8593 - SURFACE
      ?auto_8594 - SURFACE
      ?auto_8595 - SURFACE
    )
    :vars
    (
      ?auto_8598 - HOIST
      ?auto_8597 - PLACE
      ?auto_8596 - PLACE
      ?auto_8599 - HOIST
      ?auto_8600 - SURFACE
      ?auto_8601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8598 ?auto_8597 ) ( IS-CRATE ?auto_8595 ) ( not ( = ?auto_8594 ?auto_8595 ) ) ( not ( = ?auto_8593 ?auto_8594 ) ) ( not ( = ?auto_8593 ?auto_8595 ) ) ( not ( = ?auto_8596 ?auto_8597 ) ) ( HOIST-AT ?auto_8599 ?auto_8596 ) ( not ( = ?auto_8598 ?auto_8599 ) ) ( AVAILABLE ?auto_8599 ) ( SURFACE-AT ?auto_8595 ?auto_8596 ) ( ON ?auto_8595 ?auto_8600 ) ( CLEAR ?auto_8595 ) ( not ( = ?auto_8594 ?auto_8600 ) ) ( not ( = ?auto_8595 ?auto_8600 ) ) ( not ( = ?auto_8593 ?auto_8600 ) ) ( TRUCK-AT ?auto_8601 ?auto_8597 ) ( SURFACE-AT ?auto_8593 ?auto_8597 ) ( CLEAR ?auto_8593 ) ( IS-CRATE ?auto_8594 ) ( AVAILABLE ?auto_8598 ) ( IN ?auto_8594 ?auto_8601 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8594 ?auto_8595 )
      ( MAKE-2CRATE-VERIFY ?auto_8593 ?auto_8594 ?auto_8595 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8602 - SURFACE
      ?auto_8603 - SURFACE
      ?auto_8604 - SURFACE
      ?auto_8605 - SURFACE
    )
    :vars
    (
      ?auto_8608 - HOIST
      ?auto_8610 - PLACE
      ?auto_8609 - PLACE
      ?auto_8606 - HOIST
      ?auto_8611 - SURFACE
      ?auto_8607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8608 ?auto_8610 ) ( IS-CRATE ?auto_8605 ) ( not ( = ?auto_8604 ?auto_8605 ) ) ( not ( = ?auto_8603 ?auto_8604 ) ) ( not ( = ?auto_8603 ?auto_8605 ) ) ( not ( = ?auto_8609 ?auto_8610 ) ) ( HOIST-AT ?auto_8606 ?auto_8609 ) ( not ( = ?auto_8608 ?auto_8606 ) ) ( AVAILABLE ?auto_8606 ) ( SURFACE-AT ?auto_8605 ?auto_8609 ) ( ON ?auto_8605 ?auto_8611 ) ( CLEAR ?auto_8605 ) ( not ( = ?auto_8604 ?auto_8611 ) ) ( not ( = ?auto_8605 ?auto_8611 ) ) ( not ( = ?auto_8603 ?auto_8611 ) ) ( TRUCK-AT ?auto_8607 ?auto_8610 ) ( SURFACE-AT ?auto_8603 ?auto_8610 ) ( CLEAR ?auto_8603 ) ( IS-CRATE ?auto_8604 ) ( AVAILABLE ?auto_8608 ) ( IN ?auto_8604 ?auto_8607 ) ( ON ?auto_8603 ?auto_8602 ) ( not ( = ?auto_8602 ?auto_8603 ) ) ( not ( = ?auto_8602 ?auto_8604 ) ) ( not ( = ?auto_8602 ?auto_8605 ) ) ( not ( = ?auto_8602 ?auto_8611 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8603 ?auto_8604 ?auto_8605 )
      ( MAKE-3CRATE-VERIFY ?auto_8602 ?auto_8603 ?auto_8604 ?auto_8605 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8612 - SURFACE
      ?auto_8613 - SURFACE
      ?auto_8614 - SURFACE
      ?auto_8615 - SURFACE
      ?auto_8616 - SURFACE
    )
    :vars
    (
      ?auto_8619 - HOIST
      ?auto_8621 - PLACE
      ?auto_8620 - PLACE
      ?auto_8617 - HOIST
      ?auto_8622 - SURFACE
      ?auto_8618 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8619 ?auto_8621 ) ( IS-CRATE ?auto_8616 ) ( not ( = ?auto_8615 ?auto_8616 ) ) ( not ( = ?auto_8614 ?auto_8615 ) ) ( not ( = ?auto_8614 ?auto_8616 ) ) ( not ( = ?auto_8620 ?auto_8621 ) ) ( HOIST-AT ?auto_8617 ?auto_8620 ) ( not ( = ?auto_8619 ?auto_8617 ) ) ( AVAILABLE ?auto_8617 ) ( SURFACE-AT ?auto_8616 ?auto_8620 ) ( ON ?auto_8616 ?auto_8622 ) ( CLEAR ?auto_8616 ) ( not ( = ?auto_8615 ?auto_8622 ) ) ( not ( = ?auto_8616 ?auto_8622 ) ) ( not ( = ?auto_8614 ?auto_8622 ) ) ( TRUCK-AT ?auto_8618 ?auto_8621 ) ( SURFACE-AT ?auto_8614 ?auto_8621 ) ( CLEAR ?auto_8614 ) ( IS-CRATE ?auto_8615 ) ( AVAILABLE ?auto_8619 ) ( IN ?auto_8615 ?auto_8618 ) ( ON ?auto_8613 ?auto_8612 ) ( ON ?auto_8614 ?auto_8613 ) ( not ( = ?auto_8612 ?auto_8613 ) ) ( not ( = ?auto_8612 ?auto_8614 ) ) ( not ( = ?auto_8612 ?auto_8615 ) ) ( not ( = ?auto_8612 ?auto_8616 ) ) ( not ( = ?auto_8612 ?auto_8622 ) ) ( not ( = ?auto_8613 ?auto_8614 ) ) ( not ( = ?auto_8613 ?auto_8615 ) ) ( not ( = ?auto_8613 ?auto_8616 ) ) ( not ( = ?auto_8613 ?auto_8622 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8614 ?auto_8615 ?auto_8616 )
      ( MAKE-4CRATE-VERIFY ?auto_8612 ?auto_8613 ?auto_8614 ?auto_8615 ?auto_8616 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8623 - SURFACE
      ?auto_8624 - SURFACE
    )
    :vars
    (
      ?auto_8628 - HOIST
      ?auto_8630 - PLACE
      ?auto_8627 - SURFACE
      ?auto_8629 - PLACE
      ?auto_8625 - HOIST
      ?auto_8631 - SURFACE
      ?auto_8626 - TRUCK
      ?auto_8632 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8628 ?auto_8630 ) ( IS-CRATE ?auto_8624 ) ( not ( = ?auto_8623 ?auto_8624 ) ) ( not ( = ?auto_8627 ?auto_8623 ) ) ( not ( = ?auto_8627 ?auto_8624 ) ) ( not ( = ?auto_8629 ?auto_8630 ) ) ( HOIST-AT ?auto_8625 ?auto_8629 ) ( not ( = ?auto_8628 ?auto_8625 ) ) ( AVAILABLE ?auto_8625 ) ( SURFACE-AT ?auto_8624 ?auto_8629 ) ( ON ?auto_8624 ?auto_8631 ) ( CLEAR ?auto_8624 ) ( not ( = ?auto_8623 ?auto_8631 ) ) ( not ( = ?auto_8624 ?auto_8631 ) ) ( not ( = ?auto_8627 ?auto_8631 ) ) ( SURFACE-AT ?auto_8627 ?auto_8630 ) ( CLEAR ?auto_8627 ) ( IS-CRATE ?auto_8623 ) ( AVAILABLE ?auto_8628 ) ( IN ?auto_8623 ?auto_8626 ) ( TRUCK-AT ?auto_8626 ?auto_8632 ) ( not ( = ?auto_8632 ?auto_8630 ) ) ( not ( = ?auto_8629 ?auto_8632 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_8626 ?auto_8632 ?auto_8630 )
      ( MAKE-2CRATE ?auto_8627 ?auto_8623 ?auto_8624 )
      ( MAKE-1CRATE-VERIFY ?auto_8623 ?auto_8624 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8633 - SURFACE
      ?auto_8634 - SURFACE
      ?auto_8635 - SURFACE
    )
    :vars
    (
      ?auto_8641 - HOIST
      ?auto_8637 - PLACE
      ?auto_8640 - PLACE
      ?auto_8639 - HOIST
      ?auto_8636 - SURFACE
      ?auto_8642 - TRUCK
      ?auto_8638 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8641 ?auto_8637 ) ( IS-CRATE ?auto_8635 ) ( not ( = ?auto_8634 ?auto_8635 ) ) ( not ( = ?auto_8633 ?auto_8634 ) ) ( not ( = ?auto_8633 ?auto_8635 ) ) ( not ( = ?auto_8640 ?auto_8637 ) ) ( HOIST-AT ?auto_8639 ?auto_8640 ) ( not ( = ?auto_8641 ?auto_8639 ) ) ( AVAILABLE ?auto_8639 ) ( SURFACE-AT ?auto_8635 ?auto_8640 ) ( ON ?auto_8635 ?auto_8636 ) ( CLEAR ?auto_8635 ) ( not ( = ?auto_8634 ?auto_8636 ) ) ( not ( = ?auto_8635 ?auto_8636 ) ) ( not ( = ?auto_8633 ?auto_8636 ) ) ( SURFACE-AT ?auto_8633 ?auto_8637 ) ( CLEAR ?auto_8633 ) ( IS-CRATE ?auto_8634 ) ( AVAILABLE ?auto_8641 ) ( IN ?auto_8634 ?auto_8642 ) ( TRUCK-AT ?auto_8642 ?auto_8638 ) ( not ( = ?auto_8638 ?auto_8637 ) ) ( not ( = ?auto_8640 ?auto_8638 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8634 ?auto_8635 )
      ( MAKE-2CRATE-VERIFY ?auto_8633 ?auto_8634 ?auto_8635 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8643 - SURFACE
      ?auto_8644 - SURFACE
      ?auto_8645 - SURFACE
      ?auto_8646 - SURFACE
    )
    :vars
    (
      ?auto_8649 - HOIST
      ?auto_8652 - PLACE
      ?auto_8648 - PLACE
      ?auto_8650 - HOIST
      ?auto_8653 - SURFACE
      ?auto_8651 - TRUCK
      ?auto_8647 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8649 ?auto_8652 ) ( IS-CRATE ?auto_8646 ) ( not ( = ?auto_8645 ?auto_8646 ) ) ( not ( = ?auto_8644 ?auto_8645 ) ) ( not ( = ?auto_8644 ?auto_8646 ) ) ( not ( = ?auto_8648 ?auto_8652 ) ) ( HOIST-AT ?auto_8650 ?auto_8648 ) ( not ( = ?auto_8649 ?auto_8650 ) ) ( AVAILABLE ?auto_8650 ) ( SURFACE-AT ?auto_8646 ?auto_8648 ) ( ON ?auto_8646 ?auto_8653 ) ( CLEAR ?auto_8646 ) ( not ( = ?auto_8645 ?auto_8653 ) ) ( not ( = ?auto_8646 ?auto_8653 ) ) ( not ( = ?auto_8644 ?auto_8653 ) ) ( SURFACE-AT ?auto_8644 ?auto_8652 ) ( CLEAR ?auto_8644 ) ( IS-CRATE ?auto_8645 ) ( AVAILABLE ?auto_8649 ) ( IN ?auto_8645 ?auto_8651 ) ( TRUCK-AT ?auto_8651 ?auto_8647 ) ( not ( = ?auto_8647 ?auto_8652 ) ) ( not ( = ?auto_8648 ?auto_8647 ) ) ( ON ?auto_8644 ?auto_8643 ) ( not ( = ?auto_8643 ?auto_8644 ) ) ( not ( = ?auto_8643 ?auto_8645 ) ) ( not ( = ?auto_8643 ?auto_8646 ) ) ( not ( = ?auto_8643 ?auto_8653 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8644 ?auto_8645 ?auto_8646 )
      ( MAKE-3CRATE-VERIFY ?auto_8643 ?auto_8644 ?auto_8645 ?auto_8646 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8654 - SURFACE
      ?auto_8655 - SURFACE
      ?auto_8656 - SURFACE
      ?auto_8657 - SURFACE
      ?auto_8658 - SURFACE
    )
    :vars
    (
      ?auto_8661 - HOIST
      ?auto_8664 - PLACE
      ?auto_8660 - PLACE
      ?auto_8662 - HOIST
      ?auto_8665 - SURFACE
      ?auto_8663 - TRUCK
      ?auto_8659 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8661 ?auto_8664 ) ( IS-CRATE ?auto_8658 ) ( not ( = ?auto_8657 ?auto_8658 ) ) ( not ( = ?auto_8656 ?auto_8657 ) ) ( not ( = ?auto_8656 ?auto_8658 ) ) ( not ( = ?auto_8660 ?auto_8664 ) ) ( HOIST-AT ?auto_8662 ?auto_8660 ) ( not ( = ?auto_8661 ?auto_8662 ) ) ( AVAILABLE ?auto_8662 ) ( SURFACE-AT ?auto_8658 ?auto_8660 ) ( ON ?auto_8658 ?auto_8665 ) ( CLEAR ?auto_8658 ) ( not ( = ?auto_8657 ?auto_8665 ) ) ( not ( = ?auto_8658 ?auto_8665 ) ) ( not ( = ?auto_8656 ?auto_8665 ) ) ( SURFACE-AT ?auto_8656 ?auto_8664 ) ( CLEAR ?auto_8656 ) ( IS-CRATE ?auto_8657 ) ( AVAILABLE ?auto_8661 ) ( IN ?auto_8657 ?auto_8663 ) ( TRUCK-AT ?auto_8663 ?auto_8659 ) ( not ( = ?auto_8659 ?auto_8664 ) ) ( not ( = ?auto_8660 ?auto_8659 ) ) ( ON ?auto_8655 ?auto_8654 ) ( ON ?auto_8656 ?auto_8655 ) ( not ( = ?auto_8654 ?auto_8655 ) ) ( not ( = ?auto_8654 ?auto_8656 ) ) ( not ( = ?auto_8654 ?auto_8657 ) ) ( not ( = ?auto_8654 ?auto_8658 ) ) ( not ( = ?auto_8654 ?auto_8665 ) ) ( not ( = ?auto_8655 ?auto_8656 ) ) ( not ( = ?auto_8655 ?auto_8657 ) ) ( not ( = ?auto_8655 ?auto_8658 ) ) ( not ( = ?auto_8655 ?auto_8665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8656 ?auto_8657 ?auto_8658 )
      ( MAKE-4CRATE-VERIFY ?auto_8654 ?auto_8655 ?auto_8656 ?auto_8657 ?auto_8658 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8666 - SURFACE
      ?auto_8667 - SURFACE
    )
    :vars
    (
      ?auto_8671 - HOIST
      ?auto_8674 - PLACE
      ?auto_8670 - SURFACE
      ?auto_8669 - PLACE
      ?auto_8672 - HOIST
      ?auto_8675 - SURFACE
      ?auto_8673 - TRUCK
      ?auto_8668 - PLACE
      ?auto_8676 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8671 ?auto_8674 ) ( IS-CRATE ?auto_8667 ) ( not ( = ?auto_8666 ?auto_8667 ) ) ( not ( = ?auto_8670 ?auto_8666 ) ) ( not ( = ?auto_8670 ?auto_8667 ) ) ( not ( = ?auto_8669 ?auto_8674 ) ) ( HOIST-AT ?auto_8672 ?auto_8669 ) ( not ( = ?auto_8671 ?auto_8672 ) ) ( AVAILABLE ?auto_8672 ) ( SURFACE-AT ?auto_8667 ?auto_8669 ) ( ON ?auto_8667 ?auto_8675 ) ( CLEAR ?auto_8667 ) ( not ( = ?auto_8666 ?auto_8675 ) ) ( not ( = ?auto_8667 ?auto_8675 ) ) ( not ( = ?auto_8670 ?auto_8675 ) ) ( SURFACE-AT ?auto_8670 ?auto_8674 ) ( CLEAR ?auto_8670 ) ( IS-CRATE ?auto_8666 ) ( AVAILABLE ?auto_8671 ) ( TRUCK-AT ?auto_8673 ?auto_8668 ) ( not ( = ?auto_8668 ?auto_8674 ) ) ( not ( = ?auto_8669 ?auto_8668 ) ) ( HOIST-AT ?auto_8676 ?auto_8668 ) ( LIFTING ?auto_8676 ?auto_8666 ) ( not ( = ?auto_8671 ?auto_8676 ) ) ( not ( = ?auto_8672 ?auto_8676 ) ) )
    :subtasks
    ( ( !LOAD ?auto_8676 ?auto_8666 ?auto_8673 ?auto_8668 )
      ( MAKE-2CRATE ?auto_8670 ?auto_8666 ?auto_8667 )
      ( MAKE-1CRATE-VERIFY ?auto_8666 ?auto_8667 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8677 - SURFACE
      ?auto_8678 - SURFACE
      ?auto_8679 - SURFACE
    )
    :vars
    (
      ?auto_8681 - HOIST
      ?auto_8680 - PLACE
      ?auto_8686 - PLACE
      ?auto_8683 - HOIST
      ?auto_8687 - SURFACE
      ?auto_8684 - TRUCK
      ?auto_8682 - PLACE
      ?auto_8685 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8681 ?auto_8680 ) ( IS-CRATE ?auto_8679 ) ( not ( = ?auto_8678 ?auto_8679 ) ) ( not ( = ?auto_8677 ?auto_8678 ) ) ( not ( = ?auto_8677 ?auto_8679 ) ) ( not ( = ?auto_8686 ?auto_8680 ) ) ( HOIST-AT ?auto_8683 ?auto_8686 ) ( not ( = ?auto_8681 ?auto_8683 ) ) ( AVAILABLE ?auto_8683 ) ( SURFACE-AT ?auto_8679 ?auto_8686 ) ( ON ?auto_8679 ?auto_8687 ) ( CLEAR ?auto_8679 ) ( not ( = ?auto_8678 ?auto_8687 ) ) ( not ( = ?auto_8679 ?auto_8687 ) ) ( not ( = ?auto_8677 ?auto_8687 ) ) ( SURFACE-AT ?auto_8677 ?auto_8680 ) ( CLEAR ?auto_8677 ) ( IS-CRATE ?auto_8678 ) ( AVAILABLE ?auto_8681 ) ( TRUCK-AT ?auto_8684 ?auto_8682 ) ( not ( = ?auto_8682 ?auto_8680 ) ) ( not ( = ?auto_8686 ?auto_8682 ) ) ( HOIST-AT ?auto_8685 ?auto_8682 ) ( LIFTING ?auto_8685 ?auto_8678 ) ( not ( = ?auto_8681 ?auto_8685 ) ) ( not ( = ?auto_8683 ?auto_8685 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8678 ?auto_8679 )
      ( MAKE-2CRATE-VERIFY ?auto_8677 ?auto_8678 ?auto_8679 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8688 - SURFACE
      ?auto_8689 - SURFACE
      ?auto_8690 - SURFACE
      ?auto_8691 - SURFACE
    )
    :vars
    (
      ?auto_8692 - HOIST
      ?auto_8694 - PLACE
      ?auto_8699 - PLACE
      ?auto_8696 - HOIST
      ?auto_8698 - SURFACE
      ?auto_8695 - TRUCK
      ?auto_8693 - PLACE
      ?auto_8697 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8692 ?auto_8694 ) ( IS-CRATE ?auto_8691 ) ( not ( = ?auto_8690 ?auto_8691 ) ) ( not ( = ?auto_8689 ?auto_8690 ) ) ( not ( = ?auto_8689 ?auto_8691 ) ) ( not ( = ?auto_8699 ?auto_8694 ) ) ( HOIST-AT ?auto_8696 ?auto_8699 ) ( not ( = ?auto_8692 ?auto_8696 ) ) ( AVAILABLE ?auto_8696 ) ( SURFACE-AT ?auto_8691 ?auto_8699 ) ( ON ?auto_8691 ?auto_8698 ) ( CLEAR ?auto_8691 ) ( not ( = ?auto_8690 ?auto_8698 ) ) ( not ( = ?auto_8691 ?auto_8698 ) ) ( not ( = ?auto_8689 ?auto_8698 ) ) ( SURFACE-AT ?auto_8689 ?auto_8694 ) ( CLEAR ?auto_8689 ) ( IS-CRATE ?auto_8690 ) ( AVAILABLE ?auto_8692 ) ( TRUCK-AT ?auto_8695 ?auto_8693 ) ( not ( = ?auto_8693 ?auto_8694 ) ) ( not ( = ?auto_8699 ?auto_8693 ) ) ( HOIST-AT ?auto_8697 ?auto_8693 ) ( LIFTING ?auto_8697 ?auto_8690 ) ( not ( = ?auto_8692 ?auto_8697 ) ) ( not ( = ?auto_8696 ?auto_8697 ) ) ( ON ?auto_8689 ?auto_8688 ) ( not ( = ?auto_8688 ?auto_8689 ) ) ( not ( = ?auto_8688 ?auto_8690 ) ) ( not ( = ?auto_8688 ?auto_8691 ) ) ( not ( = ?auto_8688 ?auto_8698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8689 ?auto_8690 ?auto_8691 )
      ( MAKE-3CRATE-VERIFY ?auto_8688 ?auto_8689 ?auto_8690 ?auto_8691 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8700 - SURFACE
      ?auto_8701 - SURFACE
      ?auto_8702 - SURFACE
      ?auto_8703 - SURFACE
      ?auto_8704 - SURFACE
    )
    :vars
    (
      ?auto_8705 - HOIST
      ?auto_8707 - PLACE
      ?auto_8712 - PLACE
      ?auto_8709 - HOIST
      ?auto_8711 - SURFACE
      ?auto_8708 - TRUCK
      ?auto_8706 - PLACE
      ?auto_8710 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_8705 ?auto_8707 ) ( IS-CRATE ?auto_8704 ) ( not ( = ?auto_8703 ?auto_8704 ) ) ( not ( = ?auto_8702 ?auto_8703 ) ) ( not ( = ?auto_8702 ?auto_8704 ) ) ( not ( = ?auto_8712 ?auto_8707 ) ) ( HOIST-AT ?auto_8709 ?auto_8712 ) ( not ( = ?auto_8705 ?auto_8709 ) ) ( AVAILABLE ?auto_8709 ) ( SURFACE-AT ?auto_8704 ?auto_8712 ) ( ON ?auto_8704 ?auto_8711 ) ( CLEAR ?auto_8704 ) ( not ( = ?auto_8703 ?auto_8711 ) ) ( not ( = ?auto_8704 ?auto_8711 ) ) ( not ( = ?auto_8702 ?auto_8711 ) ) ( SURFACE-AT ?auto_8702 ?auto_8707 ) ( CLEAR ?auto_8702 ) ( IS-CRATE ?auto_8703 ) ( AVAILABLE ?auto_8705 ) ( TRUCK-AT ?auto_8708 ?auto_8706 ) ( not ( = ?auto_8706 ?auto_8707 ) ) ( not ( = ?auto_8712 ?auto_8706 ) ) ( HOIST-AT ?auto_8710 ?auto_8706 ) ( LIFTING ?auto_8710 ?auto_8703 ) ( not ( = ?auto_8705 ?auto_8710 ) ) ( not ( = ?auto_8709 ?auto_8710 ) ) ( ON ?auto_8701 ?auto_8700 ) ( ON ?auto_8702 ?auto_8701 ) ( not ( = ?auto_8700 ?auto_8701 ) ) ( not ( = ?auto_8700 ?auto_8702 ) ) ( not ( = ?auto_8700 ?auto_8703 ) ) ( not ( = ?auto_8700 ?auto_8704 ) ) ( not ( = ?auto_8700 ?auto_8711 ) ) ( not ( = ?auto_8701 ?auto_8702 ) ) ( not ( = ?auto_8701 ?auto_8703 ) ) ( not ( = ?auto_8701 ?auto_8704 ) ) ( not ( = ?auto_8701 ?auto_8711 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8702 ?auto_8703 ?auto_8704 )
      ( MAKE-4CRATE-VERIFY ?auto_8700 ?auto_8701 ?auto_8702 ?auto_8703 ?auto_8704 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8713 - SURFACE
      ?auto_8714 - SURFACE
    )
    :vars
    (
      ?auto_8715 - HOIST
      ?auto_8717 - PLACE
      ?auto_8723 - SURFACE
      ?auto_8722 - PLACE
      ?auto_8719 - HOIST
      ?auto_8721 - SURFACE
      ?auto_8718 - TRUCK
      ?auto_8716 - PLACE
      ?auto_8720 - HOIST
      ?auto_8724 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8715 ?auto_8717 ) ( IS-CRATE ?auto_8714 ) ( not ( = ?auto_8713 ?auto_8714 ) ) ( not ( = ?auto_8723 ?auto_8713 ) ) ( not ( = ?auto_8723 ?auto_8714 ) ) ( not ( = ?auto_8722 ?auto_8717 ) ) ( HOIST-AT ?auto_8719 ?auto_8722 ) ( not ( = ?auto_8715 ?auto_8719 ) ) ( AVAILABLE ?auto_8719 ) ( SURFACE-AT ?auto_8714 ?auto_8722 ) ( ON ?auto_8714 ?auto_8721 ) ( CLEAR ?auto_8714 ) ( not ( = ?auto_8713 ?auto_8721 ) ) ( not ( = ?auto_8714 ?auto_8721 ) ) ( not ( = ?auto_8723 ?auto_8721 ) ) ( SURFACE-AT ?auto_8723 ?auto_8717 ) ( CLEAR ?auto_8723 ) ( IS-CRATE ?auto_8713 ) ( AVAILABLE ?auto_8715 ) ( TRUCK-AT ?auto_8718 ?auto_8716 ) ( not ( = ?auto_8716 ?auto_8717 ) ) ( not ( = ?auto_8722 ?auto_8716 ) ) ( HOIST-AT ?auto_8720 ?auto_8716 ) ( not ( = ?auto_8715 ?auto_8720 ) ) ( not ( = ?auto_8719 ?auto_8720 ) ) ( AVAILABLE ?auto_8720 ) ( SURFACE-AT ?auto_8713 ?auto_8716 ) ( ON ?auto_8713 ?auto_8724 ) ( CLEAR ?auto_8713 ) ( not ( = ?auto_8713 ?auto_8724 ) ) ( not ( = ?auto_8714 ?auto_8724 ) ) ( not ( = ?auto_8723 ?auto_8724 ) ) ( not ( = ?auto_8721 ?auto_8724 ) ) )
    :subtasks
    ( ( !LIFT ?auto_8720 ?auto_8713 ?auto_8724 ?auto_8716 )
      ( MAKE-2CRATE ?auto_8723 ?auto_8713 ?auto_8714 )
      ( MAKE-1CRATE-VERIFY ?auto_8713 ?auto_8714 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8725 - SURFACE
      ?auto_8726 - SURFACE
      ?auto_8727 - SURFACE
    )
    :vars
    (
      ?auto_8734 - HOIST
      ?auto_8732 - PLACE
      ?auto_8729 - PLACE
      ?auto_8730 - HOIST
      ?auto_8731 - SURFACE
      ?auto_8728 - TRUCK
      ?auto_8736 - PLACE
      ?auto_8735 - HOIST
      ?auto_8733 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8734 ?auto_8732 ) ( IS-CRATE ?auto_8727 ) ( not ( = ?auto_8726 ?auto_8727 ) ) ( not ( = ?auto_8725 ?auto_8726 ) ) ( not ( = ?auto_8725 ?auto_8727 ) ) ( not ( = ?auto_8729 ?auto_8732 ) ) ( HOIST-AT ?auto_8730 ?auto_8729 ) ( not ( = ?auto_8734 ?auto_8730 ) ) ( AVAILABLE ?auto_8730 ) ( SURFACE-AT ?auto_8727 ?auto_8729 ) ( ON ?auto_8727 ?auto_8731 ) ( CLEAR ?auto_8727 ) ( not ( = ?auto_8726 ?auto_8731 ) ) ( not ( = ?auto_8727 ?auto_8731 ) ) ( not ( = ?auto_8725 ?auto_8731 ) ) ( SURFACE-AT ?auto_8725 ?auto_8732 ) ( CLEAR ?auto_8725 ) ( IS-CRATE ?auto_8726 ) ( AVAILABLE ?auto_8734 ) ( TRUCK-AT ?auto_8728 ?auto_8736 ) ( not ( = ?auto_8736 ?auto_8732 ) ) ( not ( = ?auto_8729 ?auto_8736 ) ) ( HOIST-AT ?auto_8735 ?auto_8736 ) ( not ( = ?auto_8734 ?auto_8735 ) ) ( not ( = ?auto_8730 ?auto_8735 ) ) ( AVAILABLE ?auto_8735 ) ( SURFACE-AT ?auto_8726 ?auto_8736 ) ( ON ?auto_8726 ?auto_8733 ) ( CLEAR ?auto_8726 ) ( not ( = ?auto_8726 ?auto_8733 ) ) ( not ( = ?auto_8727 ?auto_8733 ) ) ( not ( = ?auto_8725 ?auto_8733 ) ) ( not ( = ?auto_8731 ?auto_8733 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8726 ?auto_8727 )
      ( MAKE-2CRATE-VERIFY ?auto_8725 ?auto_8726 ?auto_8727 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8737 - SURFACE
      ?auto_8738 - SURFACE
      ?auto_8739 - SURFACE
      ?auto_8740 - SURFACE
    )
    :vars
    (
      ?auto_8749 - HOIST
      ?auto_8742 - PLACE
      ?auto_8743 - PLACE
      ?auto_8745 - HOIST
      ?auto_8741 - SURFACE
      ?auto_8744 - TRUCK
      ?auto_8747 - PLACE
      ?auto_8748 - HOIST
      ?auto_8746 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8749 ?auto_8742 ) ( IS-CRATE ?auto_8740 ) ( not ( = ?auto_8739 ?auto_8740 ) ) ( not ( = ?auto_8738 ?auto_8739 ) ) ( not ( = ?auto_8738 ?auto_8740 ) ) ( not ( = ?auto_8743 ?auto_8742 ) ) ( HOIST-AT ?auto_8745 ?auto_8743 ) ( not ( = ?auto_8749 ?auto_8745 ) ) ( AVAILABLE ?auto_8745 ) ( SURFACE-AT ?auto_8740 ?auto_8743 ) ( ON ?auto_8740 ?auto_8741 ) ( CLEAR ?auto_8740 ) ( not ( = ?auto_8739 ?auto_8741 ) ) ( not ( = ?auto_8740 ?auto_8741 ) ) ( not ( = ?auto_8738 ?auto_8741 ) ) ( SURFACE-AT ?auto_8738 ?auto_8742 ) ( CLEAR ?auto_8738 ) ( IS-CRATE ?auto_8739 ) ( AVAILABLE ?auto_8749 ) ( TRUCK-AT ?auto_8744 ?auto_8747 ) ( not ( = ?auto_8747 ?auto_8742 ) ) ( not ( = ?auto_8743 ?auto_8747 ) ) ( HOIST-AT ?auto_8748 ?auto_8747 ) ( not ( = ?auto_8749 ?auto_8748 ) ) ( not ( = ?auto_8745 ?auto_8748 ) ) ( AVAILABLE ?auto_8748 ) ( SURFACE-AT ?auto_8739 ?auto_8747 ) ( ON ?auto_8739 ?auto_8746 ) ( CLEAR ?auto_8739 ) ( not ( = ?auto_8739 ?auto_8746 ) ) ( not ( = ?auto_8740 ?auto_8746 ) ) ( not ( = ?auto_8738 ?auto_8746 ) ) ( not ( = ?auto_8741 ?auto_8746 ) ) ( ON ?auto_8738 ?auto_8737 ) ( not ( = ?auto_8737 ?auto_8738 ) ) ( not ( = ?auto_8737 ?auto_8739 ) ) ( not ( = ?auto_8737 ?auto_8740 ) ) ( not ( = ?auto_8737 ?auto_8741 ) ) ( not ( = ?auto_8737 ?auto_8746 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8738 ?auto_8739 ?auto_8740 )
      ( MAKE-3CRATE-VERIFY ?auto_8737 ?auto_8738 ?auto_8739 ?auto_8740 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8750 - SURFACE
      ?auto_8751 - SURFACE
      ?auto_8752 - SURFACE
      ?auto_8753 - SURFACE
      ?auto_8754 - SURFACE
    )
    :vars
    (
      ?auto_8763 - HOIST
      ?auto_8756 - PLACE
      ?auto_8757 - PLACE
      ?auto_8759 - HOIST
      ?auto_8755 - SURFACE
      ?auto_8758 - TRUCK
      ?auto_8761 - PLACE
      ?auto_8762 - HOIST
      ?auto_8760 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8763 ?auto_8756 ) ( IS-CRATE ?auto_8754 ) ( not ( = ?auto_8753 ?auto_8754 ) ) ( not ( = ?auto_8752 ?auto_8753 ) ) ( not ( = ?auto_8752 ?auto_8754 ) ) ( not ( = ?auto_8757 ?auto_8756 ) ) ( HOIST-AT ?auto_8759 ?auto_8757 ) ( not ( = ?auto_8763 ?auto_8759 ) ) ( AVAILABLE ?auto_8759 ) ( SURFACE-AT ?auto_8754 ?auto_8757 ) ( ON ?auto_8754 ?auto_8755 ) ( CLEAR ?auto_8754 ) ( not ( = ?auto_8753 ?auto_8755 ) ) ( not ( = ?auto_8754 ?auto_8755 ) ) ( not ( = ?auto_8752 ?auto_8755 ) ) ( SURFACE-AT ?auto_8752 ?auto_8756 ) ( CLEAR ?auto_8752 ) ( IS-CRATE ?auto_8753 ) ( AVAILABLE ?auto_8763 ) ( TRUCK-AT ?auto_8758 ?auto_8761 ) ( not ( = ?auto_8761 ?auto_8756 ) ) ( not ( = ?auto_8757 ?auto_8761 ) ) ( HOIST-AT ?auto_8762 ?auto_8761 ) ( not ( = ?auto_8763 ?auto_8762 ) ) ( not ( = ?auto_8759 ?auto_8762 ) ) ( AVAILABLE ?auto_8762 ) ( SURFACE-AT ?auto_8753 ?auto_8761 ) ( ON ?auto_8753 ?auto_8760 ) ( CLEAR ?auto_8753 ) ( not ( = ?auto_8753 ?auto_8760 ) ) ( not ( = ?auto_8754 ?auto_8760 ) ) ( not ( = ?auto_8752 ?auto_8760 ) ) ( not ( = ?auto_8755 ?auto_8760 ) ) ( ON ?auto_8751 ?auto_8750 ) ( ON ?auto_8752 ?auto_8751 ) ( not ( = ?auto_8750 ?auto_8751 ) ) ( not ( = ?auto_8750 ?auto_8752 ) ) ( not ( = ?auto_8750 ?auto_8753 ) ) ( not ( = ?auto_8750 ?auto_8754 ) ) ( not ( = ?auto_8750 ?auto_8755 ) ) ( not ( = ?auto_8750 ?auto_8760 ) ) ( not ( = ?auto_8751 ?auto_8752 ) ) ( not ( = ?auto_8751 ?auto_8753 ) ) ( not ( = ?auto_8751 ?auto_8754 ) ) ( not ( = ?auto_8751 ?auto_8755 ) ) ( not ( = ?auto_8751 ?auto_8760 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8752 ?auto_8753 ?auto_8754 )
      ( MAKE-4CRATE-VERIFY ?auto_8750 ?auto_8751 ?auto_8752 ?auto_8753 ?auto_8754 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8764 - SURFACE
      ?auto_8765 - SURFACE
    )
    :vars
    (
      ?auto_8775 - HOIST
      ?auto_8768 - PLACE
      ?auto_8766 - SURFACE
      ?auto_8769 - PLACE
      ?auto_8771 - HOIST
      ?auto_8767 - SURFACE
      ?auto_8773 - PLACE
      ?auto_8774 - HOIST
      ?auto_8772 - SURFACE
      ?auto_8770 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8775 ?auto_8768 ) ( IS-CRATE ?auto_8765 ) ( not ( = ?auto_8764 ?auto_8765 ) ) ( not ( = ?auto_8766 ?auto_8764 ) ) ( not ( = ?auto_8766 ?auto_8765 ) ) ( not ( = ?auto_8769 ?auto_8768 ) ) ( HOIST-AT ?auto_8771 ?auto_8769 ) ( not ( = ?auto_8775 ?auto_8771 ) ) ( AVAILABLE ?auto_8771 ) ( SURFACE-AT ?auto_8765 ?auto_8769 ) ( ON ?auto_8765 ?auto_8767 ) ( CLEAR ?auto_8765 ) ( not ( = ?auto_8764 ?auto_8767 ) ) ( not ( = ?auto_8765 ?auto_8767 ) ) ( not ( = ?auto_8766 ?auto_8767 ) ) ( SURFACE-AT ?auto_8766 ?auto_8768 ) ( CLEAR ?auto_8766 ) ( IS-CRATE ?auto_8764 ) ( AVAILABLE ?auto_8775 ) ( not ( = ?auto_8773 ?auto_8768 ) ) ( not ( = ?auto_8769 ?auto_8773 ) ) ( HOIST-AT ?auto_8774 ?auto_8773 ) ( not ( = ?auto_8775 ?auto_8774 ) ) ( not ( = ?auto_8771 ?auto_8774 ) ) ( AVAILABLE ?auto_8774 ) ( SURFACE-AT ?auto_8764 ?auto_8773 ) ( ON ?auto_8764 ?auto_8772 ) ( CLEAR ?auto_8764 ) ( not ( = ?auto_8764 ?auto_8772 ) ) ( not ( = ?auto_8765 ?auto_8772 ) ) ( not ( = ?auto_8766 ?auto_8772 ) ) ( not ( = ?auto_8767 ?auto_8772 ) ) ( TRUCK-AT ?auto_8770 ?auto_8768 ) )
    :subtasks
    ( ( !DRIVE ?auto_8770 ?auto_8768 ?auto_8773 )
      ( MAKE-2CRATE ?auto_8766 ?auto_8764 ?auto_8765 )
      ( MAKE-1CRATE-VERIFY ?auto_8764 ?auto_8765 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8776 - SURFACE
      ?auto_8777 - SURFACE
      ?auto_8778 - SURFACE
    )
    :vars
    (
      ?auto_8781 - HOIST
      ?auto_8779 - PLACE
      ?auto_8784 - PLACE
      ?auto_8783 - HOIST
      ?auto_8780 - SURFACE
      ?auto_8785 - PLACE
      ?auto_8786 - HOIST
      ?auto_8787 - SURFACE
      ?auto_8782 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8781 ?auto_8779 ) ( IS-CRATE ?auto_8778 ) ( not ( = ?auto_8777 ?auto_8778 ) ) ( not ( = ?auto_8776 ?auto_8777 ) ) ( not ( = ?auto_8776 ?auto_8778 ) ) ( not ( = ?auto_8784 ?auto_8779 ) ) ( HOIST-AT ?auto_8783 ?auto_8784 ) ( not ( = ?auto_8781 ?auto_8783 ) ) ( AVAILABLE ?auto_8783 ) ( SURFACE-AT ?auto_8778 ?auto_8784 ) ( ON ?auto_8778 ?auto_8780 ) ( CLEAR ?auto_8778 ) ( not ( = ?auto_8777 ?auto_8780 ) ) ( not ( = ?auto_8778 ?auto_8780 ) ) ( not ( = ?auto_8776 ?auto_8780 ) ) ( SURFACE-AT ?auto_8776 ?auto_8779 ) ( CLEAR ?auto_8776 ) ( IS-CRATE ?auto_8777 ) ( AVAILABLE ?auto_8781 ) ( not ( = ?auto_8785 ?auto_8779 ) ) ( not ( = ?auto_8784 ?auto_8785 ) ) ( HOIST-AT ?auto_8786 ?auto_8785 ) ( not ( = ?auto_8781 ?auto_8786 ) ) ( not ( = ?auto_8783 ?auto_8786 ) ) ( AVAILABLE ?auto_8786 ) ( SURFACE-AT ?auto_8777 ?auto_8785 ) ( ON ?auto_8777 ?auto_8787 ) ( CLEAR ?auto_8777 ) ( not ( = ?auto_8777 ?auto_8787 ) ) ( not ( = ?auto_8778 ?auto_8787 ) ) ( not ( = ?auto_8776 ?auto_8787 ) ) ( not ( = ?auto_8780 ?auto_8787 ) ) ( TRUCK-AT ?auto_8782 ?auto_8779 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8777 ?auto_8778 )
      ( MAKE-2CRATE-VERIFY ?auto_8776 ?auto_8777 ?auto_8778 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8788 - SURFACE
      ?auto_8789 - SURFACE
      ?auto_8790 - SURFACE
      ?auto_8791 - SURFACE
    )
    :vars
    (
      ?auto_8799 - HOIST
      ?auto_8794 - PLACE
      ?auto_8793 - PLACE
      ?auto_8795 - HOIST
      ?auto_8800 - SURFACE
      ?auto_8796 - PLACE
      ?auto_8798 - HOIST
      ?auto_8792 - SURFACE
      ?auto_8797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8799 ?auto_8794 ) ( IS-CRATE ?auto_8791 ) ( not ( = ?auto_8790 ?auto_8791 ) ) ( not ( = ?auto_8789 ?auto_8790 ) ) ( not ( = ?auto_8789 ?auto_8791 ) ) ( not ( = ?auto_8793 ?auto_8794 ) ) ( HOIST-AT ?auto_8795 ?auto_8793 ) ( not ( = ?auto_8799 ?auto_8795 ) ) ( AVAILABLE ?auto_8795 ) ( SURFACE-AT ?auto_8791 ?auto_8793 ) ( ON ?auto_8791 ?auto_8800 ) ( CLEAR ?auto_8791 ) ( not ( = ?auto_8790 ?auto_8800 ) ) ( not ( = ?auto_8791 ?auto_8800 ) ) ( not ( = ?auto_8789 ?auto_8800 ) ) ( SURFACE-AT ?auto_8789 ?auto_8794 ) ( CLEAR ?auto_8789 ) ( IS-CRATE ?auto_8790 ) ( AVAILABLE ?auto_8799 ) ( not ( = ?auto_8796 ?auto_8794 ) ) ( not ( = ?auto_8793 ?auto_8796 ) ) ( HOIST-AT ?auto_8798 ?auto_8796 ) ( not ( = ?auto_8799 ?auto_8798 ) ) ( not ( = ?auto_8795 ?auto_8798 ) ) ( AVAILABLE ?auto_8798 ) ( SURFACE-AT ?auto_8790 ?auto_8796 ) ( ON ?auto_8790 ?auto_8792 ) ( CLEAR ?auto_8790 ) ( not ( = ?auto_8790 ?auto_8792 ) ) ( not ( = ?auto_8791 ?auto_8792 ) ) ( not ( = ?auto_8789 ?auto_8792 ) ) ( not ( = ?auto_8800 ?auto_8792 ) ) ( TRUCK-AT ?auto_8797 ?auto_8794 ) ( ON ?auto_8789 ?auto_8788 ) ( not ( = ?auto_8788 ?auto_8789 ) ) ( not ( = ?auto_8788 ?auto_8790 ) ) ( not ( = ?auto_8788 ?auto_8791 ) ) ( not ( = ?auto_8788 ?auto_8800 ) ) ( not ( = ?auto_8788 ?auto_8792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8789 ?auto_8790 ?auto_8791 )
      ( MAKE-3CRATE-VERIFY ?auto_8788 ?auto_8789 ?auto_8790 ?auto_8791 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8801 - SURFACE
      ?auto_8802 - SURFACE
      ?auto_8803 - SURFACE
      ?auto_8804 - SURFACE
      ?auto_8805 - SURFACE
    )
    :vars
    (
      ?auto_8813 - HOIST
      ?auto_8808 - PLACE
      ?auto_8807 - PLACE
      ?auto_8809 - HOIST
      ?auto_8814 - SURFACE
      ?auto_8810 - PLACE
      ?auto_8812 - HOIST
      ?auto_8806 - SURFACE
      ?auto_8811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8813 ?auto_8808 ) ( IS-CRATE ?auto_8805 ) ( not ( = ?auto_8804 ?auto_8805 ) ) ( not ( = ?auto_8803 ?auto_8804 ) ) ( not ( = ?auto_8803 ?auto_8805 ) ) ( not ( = ?auto_8807 ?auto_8808 ) ) ( HOIST-AT ?auto_8809 ?auto_8807 ) ( not ( = ?auto_8813 ?auto_8809 ) ) ( AVAILABLE ?auto_8809 ) ( SURFACE-AT ?auto_8805 ?auto_8807 ) ( ON ?auto_8805 ?auto_8814 ) ( CLEAR ?auto_8805 ) ( not ( = ?auto_8804 ?auto_8814 ) ) ( not ( = ?auto_8805 ?auto_8814 ) ) ( not ( = ?auto_8803 ?auto_8814 ) ) ( SURFACE-AT ?auto_8803 ?auto_8808 ) ( CLEAR ?auto_8803 ) ( IS-CRATE ?auto_8804 ) ( AVAILABLE ?auto_8813 ) ( not ( = ?auto_8810 ?auto_8808 ) ) ( not ( = ?auto_8807 ?auto_8810 ) ) ( HOIST-AT ?auto_8812 ?auto_8810 ) ( not ( = ?auto_8813 ?auto_8812 ) ) ( not ( = ?auto_8809 ?auto_8812 ) ) ( AVAILABLE ?auto_8812 ) ( SURFACE-AT ?auto_8804 ?auto_8810 ) ( ON ?auto_8804 ?auto_8806 ) ( CLEAR ?auto_8804 ) ( not ( = ?auto_8804 ?auto_8806 ) ) ( not ( = ?auto_8805 ?auto_8806 ) ) ( not ( = ?auto_8803 ?auto_8806 ) ) ( not ( = ?auto_8814 ?auto_8806 ) ) ( TRUCK-AT ?auto_8811 ?auto_8808 ) ( ON ?auto_8802 ?auto_8801 ) ( ON ?auto_8803 ?auto_8802 ) ( not ( = ?auto_8801 ?auto_8802 ) ) ( not ( = ?auto_8801 ?auto_8803 ) ) ( not ( = ?auto_8801 ?auto_8804 ) ) ( not ( = ?auto_8801 ?auto_8805 ) ) ( not ( = ?auto_8801 ?auto_8814 ) ) ( not ( = ?auto_8801 ?auto_8806 ) ) ( not ( = ?auto_8802 ?auto_8803 ) ) ( not ( = ?auto_8802 ?auto_8804 ) ) ( not ( = ?auto_8802 ?auto_8805 ) ) ( not ( = ?auto_8802 ?auto_8814 ) ) ( not ( = ?auto_8802 ?auto_8806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8803 ?auto_8804 ?auto_8805 )
      ( MAKE-4CRATE-VERIFY ?auto_8801 ?auto_8802 ?auto_8803 ?auto_8804 ?auto_8805 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8815 - SURFACE
      ?auto_8816 - SURFACE
    )
    :vars
    (
      ?auto_8825 - HOIST
      ?auto_8820 - PLACE
      ?auto_8817 - SURFACE
      ?auto_8819 - PLACE
      ?auto_8821 - HOIST
      ?auto_8826 - SURFACE
      ?auto_8822 - PLACE
      ?auto_8824 - HOIST
      ?auto_8818 - SURFACE
      ?auto_8823 - TRUCK
      ?auto_8827 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8825 ?auto_8820 ) ( IS-CRATE ?auto_8816 ) ( not ( = ?auto_8815 ?auto_8816 ) ) ( not ( = ?auto_8817 ?auto_8815 ) ) ( not ( = ?auto_8817 ?auto_8816 ) ) ( not ( = ?auto_8819 ?auto_8820 ) ) ( HOIST-AT ?auto_8821 ?auto_8819 ) ( not ( = ?auto_8825 ?auto_8821 ) ) ( AVAILABLE ?auto_8821 ) ( SURFACE-AT ?auto_8816 ?auto_8819 ) ( ON ?auto_8816 ?auto_8826 ) ( CLEAR ?auto_8816 ) ( not ( = ?auto_8815 ?auto_8826 ) ) ( not ( = ?auto_8816 ?auto_8826 ) ) ( not ( = ?auto_8817 ?auto_8826 ) ) ( IS-CRATE ?auto_8815 ) ( not ( = ?auto_8822 ?auto_8820 ) ) ( not ( = ?auto_8819 ?auto_8822 ) ) ( HOIST-AT ?auto_8824 ?auto_8822 ) ( not ( = ?auto_8825 ?auto_8824 ) ) ( not ( = ?auto_8821 ?auto_8824 ) ) ( AVAILABLE ?auto_8824 ) ( SURFACE-AT ?auto_8815 ?auto_8822 ) ( ON ?auto_8815 ?auto_8818 ) ( CLEAR ?auto_8815 ) ( not ( = ?auto_8815 ?auto_8818 ) ) ( not ( = ?auto_8816 ?auto_8818 ) ) ( not ( = ?auto_8817 ?auto_8818 ) ) ( not ( = ?auto_8826 ?auto_8818 ) ) ( TRUCK-AT ?auto_8823 ?auto_8820 ) ( SURFACE-AT ?auto_8827 ?auto_8820 ) ( CLEAR ?auto_8827 ) ( LIFTING ?auto_8825 ?auto_8817 ) ( IS-CRATE ?auto_8817 ) ( not ( = ?auto_8827 ?auto_8817 ) ) ( not ( = ?auto_8815 ?auto_8827 ) ) ( not ( = ?auto_8816 ?auto_8827 ) ) ( not ( = ?auto_8826 ?auto_8827 ) ) ( not ( = ?auto_8818 ?auto_8827 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8827 ?auto_8817 )
      ( MAKE-2CRATE ?auto_8817 ?auto_8815 ?auto_8816 )
      ( MAKE-1CRATE-VERIFY ?auto_8815 ?auto_8816 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8828 - SURFACE
      ?auto_8829 - SURFACE
      ?auto_8830 - SURFACE
    )
    :vars
    (
      ?auto_8832 - HOIST
      ?auto_8840 - PLACE
      ?auto_8839 - PLACE
      ?auto_8838 - HOIST
      ?auto_8837 - SURFACE
      ?auto_8835 - PLACE
      ?auto_8834 - HOIST
      ?auto_8831 - SURFACE
      ?auto_8833 - TRUCK
      ?auto_8836 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8832 ?auto_8840 ) ( IS-CRATE ?auto_8830 ) ( not ( = ?auto_8829 ?auto_8830 ) ) ( not ( = ?auto_8828 ?auto_8829 ) ) ( not ( = ?auto_8828 ?auto_8830 ) ) ( not ( = ?auto_8839 ?auto_8840 ) ) ( HOIST-AT ?auto_8838 ?auto_8839 ) ( not ( = ?auto_8832 ?auto_8838 ) ) ( AVAILABLE ?auto_8838 ) ( SURFACE-AT ?auto_8830 ?auto_8839 ) ( ON ?auto_8830 ?auto_8837 ) ( CLEAR ?auto_8830 ) ( not ( = ?auto_8829 ?auto_8837 ) ) ( not ( = ?auto_8830 ?auto_8837 ) ) ( not ( = ?auto_8828 ?auto_8837 ) ) ( IS-CRATE ?auto_8829 ) ( not ( = ?auto_8835 ?auto_8840 ) ) ( not ( = ?auto_8839 ?auto_8835 ) ) ( HOIST-AT ?auto_8834 ?auto_8835 ) ( not ( = ?auto_8832 ?auto_8834 ) ) ( not ( = ?auto_8838 ?auto_8834 ) ) ( AVAILABLE ?auto_8834 ) ( SURFACE-AT ?auto_8829 ?auto_8835 ) ( ON ?auto_8829 ?auto_8831 ) ( CLEAR ?auto_8829 ) ( not ( = ?auto_8829 ?auto_8831 ) ) ( not ( = ?auto_8830 ?auto_8831 ) ) ( not ( = ?auto_8828 ?auto_8831 ) ) ( not ( = ?auto_8837 ?auto_8831 ) ) ( TRUCK-AT ?auto_8833 ?auto_8840 ) ( SURFACE-AT ?auto_8836 ?auto_8840 ) ( CLEAR ?auto_8836 ) ( LIFTING ?auto_8832 ?auto_8828 ) ( IS-CRATE ?auto_8828 ) ( not ( = ?auto_8836 ?auto_8828 ) ) ( not ( = ?auto_8829 ?auto_8836 ) ) ( not ( = ?auto_8830 ?auto_8836 ) ) ( not ( = ?auto_8837 ?auto_8836 ) ) ( not ( = ?auto_8831 ?auto_8836 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8829 ?auto_8830 )
      ( MAKE-2CRATE-VERIFY ?auto_8828 ?auto_8829 ?auto_8830 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8841 - SURFACE
      ?auto_8842 - SURFACE
      ?auto_8843 - SURFACE
      ?auto_8844 - SURFACE
    )
    :vars
    (
      ?auto_8849 - HOIST
      ?auto_8848 - PLACE
      ?auto_8852 - PLACE
      ?auto_8845 - HOIST
      ?auto_8851 - SURFACE
      ?auto_8850 - PLACE
      ?auto_8846 - HOIST
      ?auto_8853 - SURFACE
      ?auto_8847 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8849 ?auto_8848 ) ( IS-CRATE ?auto_8844 ) ( not ( = ?auto_8843 ?auto_8844 ) ) ( not ( = ?auto_8842 ?auto_8843 ) ) ( not ( = ?auto_8842 ?auto_8844 ) ) ( not ( = ?auto_8852 ?auto_8848 ) ) ( HOIST-AT ?auto_8845 ?auto_8852 ) ( not ( = ?auto_8849 ?auto_8845 ) ) ( AVAILABLE ?auto_8845 ) ( SURFACE-AT ?auto_8844 ?auto_8852 ) ( ON ?auto_8844 ?auto_8851 ) ( CLEAR ?auto_8844 ) ( not ( = ?auto_8843 ?auto_8851 ) ) ( not ( = ?auto_8844 ?auto_8851 ) ) ( not ( = ?auto_8842 ?auto_8851 ) ) ( IS-CRATE ?auto_8843 ) ( not ( = ?auto_8850 ?auto_8848 ) ) ( not ( = ?auto_8852 ?auto_8850 ) ) ( HOIST-AT ?auto_8846 ?auto_8850 ) ( not ( = ?auto_8849 ?auto_8846 ) ) ( not ( = ?auto_8845 ?auto_8846 ) ) ( AVAILABLE ?auto_8846 ) ( SURFACE-AT ?auto_8843 ?auto_8850 ) ( ON ?auto_8843 ?auto_8853 ) ( CLEAR ?auto_8843 ) ( not ( = ?auto_8843 ?auto_8853 ) ) ( not ( = ?auto_8844 ?auto_8853 ) ) ( not ( = ?auto_8842 ?auto_8853 ) ) ( not ( = ?auto_8851 ?auto_8853 ) ) ( TRUCK-AT ?auto_8847 ?auto_8848 ) ( SURFACE-AT ?auto_8841 ?auto_8848 ) ( CLEAR ?auto_8841 ) ( LIFTING ?auto_8849 ?auto_8842 ) ( IS-CRATE ?auto_8842 ) ( not ( = ?auto_8841 ?auto_8842 ) ) ( not ( = ?auto_8843 ?auto_8841 ) ) ( not ( = ?auto_8844 ?auto_8841 ) ) ( not ( = ?auto_8851 ?auto_8841 ) ) ( not ( = ?auto_8853 ?auto_8841 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8842 ?auto_8843 ?auto_8844 )
      ( MAKE-3CRATE-VERIFY ?auto_8841 ?auto_8842 ?auto_8843 ?auto_8844 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8854 - SURFACE
      ?auto_8855 - SURFACE
      ?auto_8856 - SURFACE
      ?auto_8857 - SURFACE
      ?auto_8858 - SURFACE
    )
    :vars
    (
      ?auto_8863 - HOIST
      ?auto_8862 - PLACE
      ?auto_8866 - PLACE
      ?auto_8859 - HOIST
      ?auto_8865 - SURFACE
      ?auto_8864 - PLACE
      ?auto_8860 - HOIST
      ?auto_8867 - SURFACE
      ?auto_8861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8863 ?auto_8862 ) ( IS-CRATE ?auto_8858 ) ( not ( = ?auto_8857 ?auto_8858 ) ) ( not ( = ?auto_8856 ?auto_8857 ) ) ( not ( = ?auto_8856 ?auto_8858 ) ) ( not ( = ?auto_8866 ?auto_8862 ) ) ( HOIST-AT ?auto_8859 ?auto_8866 ) ( not ( = ?auto_8863 ?auto_8859 ) ) ( AVAILABLE ?auto_8859 ) ( SURFACE-AT ?auto_8858 ?auto_8866 ) ( ON ?auto_8858 ?auto_8865 ) ( CLEAR ?auto_8858 ) ( not ( = ?auto_8857 ?auto_8865 ) ) ( not ( = ?auto_8858 ?auto_8865 ) ) ( not ( = ?auto_8856 ?auto_8865 ) ) ( IS-CRATE ?auto_8857 ) ( not ( = ?auto_8864 ?auto_8862 ) ) ( not ( = ?auto_8866 ?auto_8864 ) ) ( HOIST-AT ?auto_8860 ?auto_8864 ) ( not ( = ?auto_8863 ?auto_8860 ) ) ( not ( = ?auto_8859 ?auto_8860 ) ) ( AVAILABLE ?auto_8860 ) ( SURFACE-AT ?auto_8857 ?auto_8864 ) ( ON ?auto_8857 ?auto_8867 ) ( CLEAR ?auto_8857 ) ( not ( = ?auto_8857 ?auto_8867 ) ) ( not ( = ?auto_8858 ?auto_8867 ) ) ( not ( = ?auto_8856 ?auto_8867 ) ) ( not ( = ?auto_8865 ?auto_8867 ) ) ( TRUCK-AT ?auto_8861 ?auto_8862 ) ( SURFACE-AT ?auto_8855 ?auto_8862 ) ( CLEAR ?auto_8855 ) ( LIFTING ?auto_8863 ?auto_8856 ) ( IS-CRATE ?auto_8856 ) ( not ( = ?auto_8855 ?auto_8856 ) ) ( not ( = ?auto_8857 ?auto_8855 ) ) ( not ( = ?auto_8858 ?auto_8855 ) ) ( not ( = ?auto_8865 ?auto_8855 ) ) ( not ( = ?auto_8867 ?auto_8855 ) ) ( ON ?auto_8855 ?auto_8854 ) ( not ( = ?auto_8854 ?auto_8855 ) ) ( not ( = ?auto_8854 ?auto_8856 ) ) ( not ( = ?auto_8854 ?auto_8857 ) ) ( not ( = ?auto_8854 ?auto_8858 ) ) ( not ( = ?auto_8854 ?auto_8865 ) ) ( not ( = ?auto_8854 ?auto_8867 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8856 ?auto_8857 ?auto_8858 )
      ( MAKE-4CRATE-VERIFY ?auto_8854 ?auto_8855 ?auto_8856 ?auto_8857 ?auto_8858 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8868 - SURFACE
      ?auto_8869 - SURFACE
    )
    :vars
    (
      ?auto_8875 - HOIST
      ?auto_8873 - PLACE
      ?auto_8874 - SURFACE
      ?auto_8878 - PLACE
      ?auto_8870 - HOIST
      ?auto_8877 - SURFACE
      ?auto_8876 - PLACE
      ?auto_8871 - HOIST
      ?auto_8879 - SURFACE
      ?auto_8872 - TRUCK
      ?auto_8880 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8875 ?auto_8873 ) ( IS-CRATE ?auto_8869 ) ( not ( = ?auto_8868 ?auto_8869 ) ) ( not ( = ?auto_8874 ?auto_8868 ) ) ( not ( = ?auto_8874 ?auto_8869 ) ) ( not ( = ?auto_8878 ?auto_8873 ) ) ( HOIST-AT ?auto_8870 ?auto_8878 ) ( not ( = ?auto_8875 ?auto_8870 ) ) ( AVAILABLE ?auto_8870 ) ( SURFACE-AT ?auto_8869 ?auto_8878 ) ( ON ?auto_8869 ?auto_8877 ) ( CLEAR ?auto_8869 ) ( not ( = ?auto_8868 ?auto_8877 ) ) ( not ( = ?auto_8869 ?auto_8877 ) ) ( not ( = ?auto_8874 ?auto_8877 ) ) ( IS-CRATE ?auto_8868 ) ( not ( = ?auto_8876 ?auto_8873 ) ) ( not ( = ?auto_8878 ?auto_8876 ) ) ( HOIST-AT ?auto_8871 ?auto_8876 ) ( not ( = ?auto_8875 ?auto_8871 ) ) ( not ( = ?auto_8870 ?auto_8871 ) ) ( AVAILABLE ?auto_8871 ) ( SURFACE-AT ?auto_8868 ?auto_8876 ) ( ON ?auto_8868 ?auto_8879 ) ( CLEAR ?auto_8868 ) ( not ( = ?auto_8868 ?auto_8879 ) ) ( not ( = ?auto_8869 ?auto_8879 ) ) ( not ( = ?auto_8874 ?auto_8879 ) ) ( not ( = ?auto_8877 ?auto_8879 ) ) ( TRUCK-AT ?auto_8872 ?auto_8873 ) ( SURFACE-AT ?auto_8880 ?auto_8873 ) ( CLEAR ?auto_8880 ) ( IS-CRATE ?auto_8874 ) ( not ( = ?auto_8880 ?auto_8874 ) ) ( not ( = ?auto_8868 ?auto_8880 ) ) ( not ( = ?auto_8869 ?auto_8880 ) ) ( not ( = ?auto_8877 ?auto_8880 ) ) ( not ( = ?auto_8879 ?auto_8880 ) ) ( AVAILABLE ?auto_8875 ) ( IN ?auto_8874 ?auto_8872 ) )
    :subtasks
    ( ( !UNLOAD ?auto_8875 ?auto_8874 ?auto_8872 ?auto_8873 )
      ( MAKE-2CRATE ?auto_8874 ?auto_8868 ?auto_8869 )
      ( MAKE-1CRATE-VERIFY ?auto_8868 ?auto_8869 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8881 - SURFACE
      ?auto_8882 - SURFACE
      ?auto_8883 - SURFACE
    )
    :vars
    (
      ?auto_8889 - HOIST
      ?auto_8892 - PLACE
      ?auto_8891 - PLACE
      ?auto_8888 - HOIST
      ?auto_8884 - SURFACE
      ?auto_8893 - PLACE
      ?auto_8885 - HOIST
      ?auto_8886 - SURFACE
      ?auto_8887 - TRUCK
      ?auto_8890 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_8889 ?auto_8892 ) ( IS-CRATE ?auto_8883 ) ( not ( = ?auto_8882 ?auto_8883 ) ) ( not ( = ?auto_8881 ?auto_8882 ) ) ( not ( = ?auto_8881 ?auto_8883 ) ) ( not ( = ?auto_8891 ?auto_8892 ) ) ( HOIST-AT ?auto_8888 ?auto_8891 ) ( not ( = ?auto_8889 ?auto_8888 ) ) ( AVAILABLE ?auto_8888 ) ( SURFACE-AT ?auto_8883 ?auto_8891 ) ( ON ?auto_8883 ?auto_8884 ) ( CLEAR ?auto_8883 ) ( not ( = ?auto_8882 ?auto_8884 ) ) ( not ( = ?auto_8883 ?auto_8884 ) ) ( not ( = ?auto_8881 ?auto_8884 ) ) ( IS-CRATE ?auto_8882 ) ( not ( = ?auto_8893 ?auto_8892 ) ) ( not ( = ?auto_8891 ?auto_8893 ) ) ( HOIST-AT ?auto_8885 ?auto_8893 ) ( not ( = ?auto_8889 ?auto_8885 ) ) ( not ( = ?auto_8888 ?auto_8885 ) ) ( AVAILABLE ?auto_8885 ) ( SURFACE-AT ?auto_8882 ?auto_8893 ) ( ON ?auto_8882 ?auto_8886 ) ( CLEAR ?auto_8882 ) ( not ( = ?auto_8882 ?auto_8886 ) ) ( not ( = ?auto_8883 ?auto_8886 ) ) ( not ( = ?auto_8881 ?auto_8886 ) ) ( not ( = ?auto_8884 ?auto_8886 ) ) ( TRUCK-AT ?auto_8887 ?auto_8892 ) ( SURFACE-AT ?auto_8890 ?auto_8892 ) ( CLEAR ?auto_8890 ) ( IS-CRATE ?auto_8881 ) ( not ( = ?auto_8890 ?auto_8881 ) ) ( not ( = ?auto_8882 ?auto_8890 ) ) ( not ( = ?auto_8883 ?auto_8890 ) ) ( not ( = ?auto_8884 ?auto_8890 ) ) ( not ( = ?auto_8886 ?auto_8890 ) ) ( AVAILABLE ?auto_8889 ) ( IN ?auto_8881 ?auto_8887 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8882 ?auto_8883 )
      ( MAKE-2CRATE-VERIFY ?auto_8881 ?auto_8882 ?auto_8883 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8894 - SURFACE
      ?auto_8895 - SURFACE
      ?auto_8896 - SURFACE
      ?auto_8897 - SURFACE
    )
    :vars
    (
      ?auto_8906 - HOIST
      ?auto_8905 - PLACE
      ?auto_8904 - PLACE
      ?auto_8902 - HOIST
      ?auto_8903 - SURFACE
      ?auto_8901 - PLACE
      ?auto_8900 - HOIST
      ?auto_8898 - SURFACE
      ?auto_8899 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8906 ?auto_8905 ) ( IS-CRATE ?auto_8897 ) ( not ( = ?auto_8896 ?auto_8897 ) ) ( not ( = ?auto_8895 ?auto_8896 ) ) ( not ( = ?auto_8895 ?auto_8897 ) ) ( not ( = ?auto_8904 ?auto_8905 ) ) ( HOIST-AT ?auto_8902 ?auto_8904 ) ( not ( = ?auto_8906 ?auto_8902 ) ) ( AVAILABLE ?auto_8902 ) ( SURFACE-AT ?auto_8897 ?auto_8904 ) ( ON ?auto_8897 ?auto_8903 ) ( CLEAR ?auto_8897 ) ( not ( = ?auto_8896 ?auto_8903 ) ) ( not ( = ?auto_8897 ?auto_8903 ) ) ( not ( = ?auto_8895 ?auto_8903 ) ) ( IS-CRATE ?auto_8896 ) ( not ( = ?auto_8901 ?auto_8905 ) ) ( not ( = ?auto_8904 ?auto_8901 ) ) ( HOIST-AT ?auto_8900 ?auto_8901 ) ( not ( = ?auto_8906 ?auto_8900 ) ) ( not ( = ?auto_8902 ?auto_8900 ) ) ( AVAILABLE ?auto_8900 ) ( SURFACE-AT ?auto_8896 ?auto_8901 ) ( ON ?auto_8896 ?auto_8898 ) ( CLEAR ?auto_8896 ) ( not ( = ?auto_8896 ?auto_8898 ) ) ( not ( = ?auto_8897 ?auto_8898 ) ) ( not ( = ?auto_8895 ?auto_8898 ) ) ( not ( = ?auto_8903 ?auto_8898 ) ) ( TRUCK-AT ?auto_8899 ?auto_8905 ) ( SURFACE-AT ?auto_8894 ?auto_8905 ) ( CLEAR ?auto_8894 ) ( IS-CRATE ?auto_8895 ) ( not ( = ?auto_8894 ?auto_8895 ) ) ( not ( = ?auto_8896 ?auto_8894 ) ) ( not ( = ?auto_8897 ?auto_8894 ) ) ( not ( = ?auto_8903 ?auto_8894 ) ) ( not ( = ?auto_8898 ?auto_8894 ) ) ( AVAILABLE ?auto_8906 ) ( IN ?auto_8895 ?auto_8899 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8895 ?auto_8896 ?auto_8897 )
      ( MAKE-3CRATE-VERIFY ?auto_8894 ?auto_8895 ?auto_8896 ?auto_8897 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8907 - SURFACE
      ?auto_8908 - SURFACE
      ?auto_8909 - SURFACE
      ?auto_8910 - SURFACE
      ?auto_8911 - SURFACE
    )
    :vars
    (
      ?auto_8920 - HOIST
      ?auto_8919 - PLACE
      ?auto_8918 - PLACE
      ?auto_8916 - HOIST
      ?auto_8917 - SURFACE
      ?auto_8915 - PLACE
      ?auto_8914 - HOIST
      ?auto_8912 - SURFACE
      ?auto_8913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8920 ?auto_8919 ) ( IS-CRATE ?auto_8911 ) ( not ( = ?auto_8910 ?auto_8911 ) ) ( not ( = ?auto_8909 ?auto_8910 ) ) ( not ( = ?auto_8909 ?auto_8911 ) ) ( not ( = ?auto_8918 ?auto_8919 ) ) ( HOIST-AT ?auto_8916 ?auto_8918 ) ( not ( = ?auto_8920 ?auto_8916 ) ) ( AVAILABLE ?auto_8916 ) ( SURFACE-AT ?auto_8911 ?auto_8918 ) ( ON ?auto_8911 ?auto_8917 ) ( CLEAR ?auto_8911 ) ( not ( = ?auto_8910 ?auto_8917 ) ) ( not ( = ?auto_8911 ?auto_8917 ) ) ( not ( = ?auto_8909 ?auto_8917 ) ) ( IS-CRATE ?auto_8910 ) ( not ( = ?auto_8915 ?auto_8919 ) ) ( not ( = ?auto_8918 ?auto_8915 ) ) ( HOIST-AT ?auto_8914 ?auto_8915 ) ( not ( = ?auto_8920 ?auto_8914 ) ) ( not ( = ?auto_8916 ?auto_8914 ) ) ( AVAILABLE ?auto_8914 ) ( SURFACE-AT ?auto_8910 ?auto_8915 ) ( ON ?auto_8910 ?auto_8912 ) ( CLEAR ?auto_8910 ) ( not ( = ?auto_8910 ?auto_8912 ) ) ( not ( = ?auto_8911 ?auto_8912 ) ) ( not ( = ?auto_8909 ?auto_8912 ) ) ( not ( = ?auto_8917 ?auto_8912 ) ) ( TRUCK-AT ?auto_8913 ?auto_8919 ) ( SURFACE-AT ?auto_8908 ?auto_8919 ) ( CLEAR ?auto_8908 ) ( IS-CRATE ?auto_8909 ) ( not ( = ?auto_8908 ?auto_8909 ) ) ( not ( = ?auto_8910 ?auto_8908 ) ) ( not ( = ?auto_8911 ?auto_8908 ) ) ( not ( = ?auto_8917 ?auto_8908 ) ) ( not ( = ?auto_8912 ?auto_8908 ) ) ( AVAILABLE ?auto_8920 ) ( IN ?auto_8909 ?auto_8913 ) ( ON ?auto_8908 ?auto_8907 ) ( not ( = ?auto_8907 ?auto_8908 ) ) ( not ( = ?auto_8907 ?auto_8909 ) ) ( not ( = ?auto_8907 ?auto_8910 ) ) ( not ( = ?auto_8907 ?auto_8911 ) ) ( not ( = ?auto_8907 ?auto_8917 ) ) ( not ( = ?auto_8907 ?auto_8912 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8909 ?auto_8910 ?auto_8911 )
      ( MAKE-4CRATE-VERIFY ?auto_8907 ?auto_8908 ?auto_8909 ?auto_8910 ?auto_8911 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8921 - SURFACE
      ?auto_8922 - SURFACE
    )
    :vars
    (
      ?auto_8933 - HOIST
      ?auto_8932 - PLACE
      ?auto_8931 - SURFACE
      ?auto_8930 - PLACE
      ?auto_8928 - HOIST
      ?auto_8929 - SURFACE
      ?auto_8927 - PLACE
      ?auto_8926 - HOIST
      ?auto_8923 - SURFACE
      ?auto_8925 - SURFACE
      ?auto_8924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8933 ?auto_8932 ) ( IS-CRATE ?auto_8922 ) ( not ( = ?auto_8921 ?auto_8922 ) ) ( not ( = ?auto_8931 ?auto_8921 ) ) ( not ( = ?auto_8931 ?auto_8922 ) ) ( not ( = ?auto_8930 ?auto_8932 ) ) ( HOIST-AT ?auto_8928 ?auto_8930 ) ( not ( = ?auto_8933 ?auto_8928 ) ) ( AVAILABLE ?auto_8928 ) ( SURFACE-AT ?auto_8922 ?auto_8930 ) ( ON ?auto_8922 ?auto_8929 ) ( CLEAR ?auto_8922 ) ( not ( = ?auto_8921 ?auto_8929 ) ) ( not ( = ?auto_8922 ?auto_8929 ) ) ( not ( = ?auto_8931 ?auto_8929 ) ) ( IS-CRATE ?auto_8921 ) ( not ( = ?auto_8927 ?auto_8932 ) ) ( not ( = ?auto_8930 ?auto_8927 ) ) ( HOIST-AT ?auto_8926 ?auto_8927 ) ( not ( = ?auto_8933 ?auto_8926 ) ) ( not ( = ?auto_8928 ?auto_8926 ) ) ( AVAILABLE ?auto_8926 ) ( SURFACE-AT ?auto_8921 ?auto_8927 ) ( ON ?auto_8921 ?auto_8923 ) ( CLEAR ?auto_8921 ) ( not ( = ?auto_8921 ?auto_8923 ) ) ( not ( = ?auto_8922 ?auto_8923 ) ) ( not ( = ?auto_8931 ?auto_8923 ) ) ( not ( = ?auto_8929 ?auto_8923 ) ) ( SURFACE-AT ?auto_8925 ?auto_8932 ) ( CLEAR ?auto_8925 ) ( IS-CRATE ?auto_8931 ) ( not ( = ?auto_8925 ?auto_8931 ) ) ( not ( = ?auto_8921 ?auto_8925 ) ) ( not ( = ?auto_8922 ?auto_8925 ) ) ( not ( = ?auto_8929 ?auto_8925 ) ) ( not ( = ?auto_8923 ?auto_8925 ) ) ( AVAILABLE ?auto_8933 ) ( IN ?auto_8931 ?auto_8924 ) ( TRUCK-AT ?auto_8924 ?auto_8927 ) )
    :subtasks
    ( ( !DRIVE ?auto_8924 ?auto_8927 ?auto_8932 )
      ( MAKE-2CRATE ?auto_8931 ?auto_8921 ?auto_8922 )
      ( MAKE-1CRATE-VERIFY ?auto_8921 ?auto_8922 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8934 - SURFACE
      ?auto_8935 - SURFACE
      ?auto_8936 - SURFACE
    )
    :vars
    (
      ?auto_8940 - HOIST
      ?auto_8944 - PLACE
      ?auto_8937 - PLACE
      ?auto_8942 - HOIST
      ?auto_8943 - SURFACE
      ?auto_8945 - PLACE
      ?auto_8941 - HOIST
      ?auto_8939 - SURFACE
      ?auto_8946 - SURFACE
      ?auto_8938 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8940 ?auto_8944 ) ( IS-CRATE ?auto_8936 ) ( not ( = ?auto_8935 ?auto_8936 ) ) ( not ( = ?auto_8934 ?auto_8935 ) ) ( not ( = ?auto_8934 ?auto_8936 ) ) ( not ( = ?auto_8937 ?auto_8944 ) ) ( HOIST-AT ?auto_8942 ?auto_8937 ) ( not ( = ?auto_8940 ?auto_8942 ) ) ( AVAILABLE ?auto_8942 ) ( SURFACE-AT ?auto_8936 ?auto_8937 ) ( ON ?auto_8936 ?auto_8943 ) ( CLEAR ?auto_8936 ) ( not ( = ?auto_8935 ?auto_8943 ) ) ( not ( = ?auto_8936 ?auto_8943 ) ) ( not ( = ?auto_8934 ?auto_8943 ) ) ( IS-CRATE ?auto_8935 ) ( not ( = ?auto_8945 ?auto_8944 ) ) ( not ( = ?auto_8937 ?auto_8945 ) ) ( HOIST-AT ?auto_8941 ?auto_8945 ) ( not ( = ?auto_8940 ?auto_8941 ) ) ( not ( = ?auto_8942 ?auto_8941 ) ) ( AVAILABLE ?auto_8941 ) ( SURFACE-AT ?auto_8935 ?auto_8945 ) ( ON ?auto_8935 ?auto_8939 ) ( CLEAR ?auto_8935 ) ( not ( = ?auto_8935 ?auto_8939 ) ) ( not ( = ?auto_8936 ?auto_8939 ) ) ( not ( = ?auto_8934 ?auto_8939 ) ) ( not ( = ?auto_8943 ?auto_8939 ) ) ( SURFACE-AT ?auto_8946 ?auto_8944 ) ( CLEAR ?auto_8946 ) ( IS-CRATE ?auto_8934 ) ( not ( = ?auto_8946 ?auto_8934 ) ) ( not ( = ?auto_8935 ?auto_8946 ) ) ( not ( = ?auto_8936 ?auto_8946 ) ) ( not ( = ?auto_8943 ?auto_8946 ) ) ( not ( = ?auto_8939 ?auto_8946 ) ) ( AVAILABLE ?auto_8940 ) ( IN ?auto_8934 ?auto_8938 ) ( TRUCK-AT ?auto_8938 ?auto_8945 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8935 ?auto_8936 )
      ( MAKE-2CRATE-VERIFY ?auto_8934 ?auto_8935 ?auto_8936 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_8947 - SURFACE
      ?auto_8948 - SURFACE
      ?auto_8949 - SURFACE
      ?auto_8950 - SURFACE
    )
    :vars
    (
      ?auto_8957 - HOIST
      ?auto_8951 - PLACE
      ?auto_8956 - PLACE
      ?auto_8952 - HOIST
      ?auto_8959 - SURFACE
      ?auto_8958 - PLACE
      ?auto_8954 - HOIST
      ?auto_8953 - SURFACE
      ?auto_8955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8957 ?auto_8951 ) ( IS-CRATE ?auto_8950 ) ( not ( = ?auto_8949 ?auto_8950 ) ) ( not ( = ?auto_8948 ?auto_8949 ) ) ( not ( = ?auto_8948 ?auto_8950 ) ) ( not ( = ?auto_8956 ?auto_8951 ) ) ( HOIST-AT ?auto_8952 ?auto_8956 ) ( not ( = ?auto_8957 ?auto_8952 ) ) ( AVAILABLE ?auto_8952 ) ( SURFACE-AT ?auto_8950 ?auto_8956 ) ( ON ?auto_8950 ?auto_8959 ) ( CLEAR ?auto_8950 ) ( not ( = ?auto_8949 ?auto_8959 ) ) ( not ( = ?auto_8950 ?auto_8959 ) ) ( not ( = ?auto_8948 ?auto_8959 ) ) ( IS-CRATE ?auto_8949 ) ( not ( = ?auto_8958 ?auto_8951 ) ) ( not ( = ?auto_8956 ?auto_8958 ) ) ( HOIST-AT ?auto_8954 ?auto_8958 ) ( not ( = ?auto_8957 ?auto_8954 ) ) ( not ( = ?auto_8952 ?auto_8954 ) ) ( AVAILABLE ?auto_8954 ) ( SURFACE-AT ?auto_8949 ?auto_8958 ) ( ON ?auto_8949 ?auto_8953 ) ( CLEAR ?auto_8949 ) ( not ( = ?auto_8949 ?auto_8953 ) ) ( not ( = ?auto_8950 ?auto_8953 ) ) ( not ( = ?auto_8948 ?auto_8953 ) ) ( not ( = ?auto_8959 ?auto_8953 ) ) ( SURFACE-AT ?auto_8947 ?auto_8951 ) ( CLEAR ?auto_8947 ) ( IS-CRATE ?auto_8948 ) ( not ( = ?auto_8947 ?auto_8948 ) ) ( not ( = ?auto_8949 ?auto_8947 ) ) ( not ( = ?auto_8950 ?auto_8947 ) ) ( not ( = ?auto_8959 ?auto_8947 ) ) ( not ( = ?auto_8953 ?auto_8947 ) ) ( AVAILABLE ?auto_8957 ) ( IN ?auto_8948 ?auto_8955 ) ( TRUCK-AT ?auto_8955 ?auto_8958 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8948 ?auto_8949 ?auto_8950 )
      ( MAKE-3CRATE-VERIFY ?auto_8947 ?auto_8948 ?auto_8949 ?auto_8950 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_8960 - SURFACE
      ?auto_8961 - SURFACE
      ?auto_8962 - SURFACE
      ?auto_8963 - SURFACE
      ?auto_8964 - SURFACE
    )
    :vars
    (
      ?auto_8971 - HOIST
      ?auto_8965 - PLACE
      ?auto_8970 - PLACE
      ?auto_8966 - HOIST
      ?auto_8973 - SURFACE
      ?auto_8972 - PLACE
      ?auto_8968 - HOIST
      ?auto_8967 - SURFACE
      ?auto_8969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8971 ?auto_8965 ) ( IS-CRATE ?auto_8964 ) ( not ( = ?auto_8963 ?auto_8964 ) ) ( not ( = ?auto_8962 ?auto_8963 ) ) ( not ( = ?auto_8962 ?auto_8964 ) ) ( not ( = ?auto_8970 ?auto_8965 ) ) ( HOIST-AT ?auto_8966 ?auto_8970 ) ( not ( = ?auto_8971 ?auto_8966 ) ) ( AVAILABLE ?auto_8966 ) ( SURFACE-AT ?auto_8964 ?auto_8970 ) ( ON ?auto_8964 ?auto_8973 ) ( CLEAR ?auto_8964 ) ( not ( = ?auto_8963 ?auto_8973 ) ) ( not ( = ?auto_8964 ?auto_8973 ) ) ( not ( = ?auto_8962 ?auto_8973 ) ) ( IS-CRATE ?auto_8963 ) ( not ( = ?auto_8972 ?auto_8965 ) ) ( not ( = ?auto_8970 ?auto_8972 ) ) ( HOIST-AT ?auto_8968 ?auto_8972 ) ( not ( = ?auto_8971 ?auto_8968 ) ) ( not ( = ?auto_8966 ?auto_8968 ) ) ( AVAILABLE ?auto_8968 ) ( SURFACE-AT ?auto_8963 ?auto_8972 ) ( ON ?auto_8963 ?auto_8967 ) ( CLEAR ?auto_8963 ) ( not ( = ?auto_8963 ?auto_8967 ) ) ( not ( = ?auto_8964 ?auto_8967 ) ) ( not ( = ?auto_8962 ?auto_8967 ) ) ( not ( = ?auto_8973 ?auto_8967 ) ) ( SURFACE-AT ?auto_8961 ?auto_8965 ) ( CLEAR ?auto_8961 ) ( IS-CRATE ?auto_8962 ) ( not ( = ?auto_8961 ?auto_8962 ) ) ( not ( = ?auto_8963 ?auto_8961 ) ) ( not ( = ?auto_8964 ?auto_8961 ) ) ( not ( = ?auto_8973 ?auto_8961 ) ) ( not ( = ?auto_8967 ?auto_8961 ) ) ( AVAILABLE ?auto_8971 ) ( IN ?auto_8962 ?auto_8969 ) ( TRUCK-AT ?auto_8969 ?auto_8972 ) ( ON ?auto_8961 ?auto_8960 ) ( not ( = ?auto_8960 ?auto_8961 ) ) ( not ( = ?auto_8960 ?auto_8962 ) ) ( not ( = ?auto_8960 ?auto_8963 ) ) ( not ( = ?auto_8960 ?auto_8964 ) ) ( not ( = ?auto_8960 ?auto_8973 ) ) ( not ( = ?auto_8960 ?auto_8967 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_8962 ?auto_8963 ?auto_8964 )
      ( MAKE-4CRATE-VERIFY ?auto_8960 ?auto_8961 ?auto_8962 ?auto_8963 ?auto_8964 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_8974 - SURFACE
      ?auto_8975 - SURFACE
    )
    :vars
    (
      ?auto_8984 - HOIST
      ?auto_8976 - PLACE
      ?auto_8978 - SURFACE
      ?auto_8983 - PLACE
      ?auto_8979 - HOIST
      ?auto_8986 - SURFACE
      ?auto_8985 - PLACE
      ?auto_8981 - HOIST
      ?auto_8980 - SURFACE
      ?auto_8977 - SURFACE
      ?auto_8982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8984 ?auto_8976 ) ( IS-CRATE ?auto_8975 ) ( not ( = ?auto_8974 ?auto_8975 ) ) ( not ( = ?auto_8978 ?auto_8974 ) ) ( not ( = ?auto_8978 ?auto_8975 ) ) ( not ( = ?auto_8983 ?auto_8976 ) ) ( HOIST-AT ?auto_8979 ?auto_8983 ) ( not ( = ?auto_8984 ?auto_8979 ) ) ( AVAILABLE ?auto_8979 ) ( SURFACE-AT ?auto_8975 ?auto_8983 ) ( ON ?auto_8975 ?auto_8986 ) ( CLEAR ?auto_8975 ) ( not ( = ?auto_8974 ?auto_8986 ) ) ( not ( = ?auto_8975 ?auto_8986 ) ) ( not ( = ?auto_8978 ?auto_8986 ) ) ( IS-CRATE ?auto_8974 ) ( not ( = ?auto_8985 ?auto_8976 ) ) ( not ( = ?auto_8983 ?auto_8985 ) ) ( HOIST-AT ?auto_8981 ?auto_8985 ) ( not ( = ?auto_8984 ?auto_8981 ) ) ( not ( = ?auto_8979 ?auto_8981 ) ) ( SURFACE-AT ?auto_8974 ?auto_8985 ) ( ON ?auto_8974 ?auto_8980 ) ( CLEAR ?auto_8974 ) ( not ( = ?auto_8974 ?auto_8980 ) ) ( not ( = ?auto_8975 ?auto_8980 ) ) ( not ( = ?auto_8978 ?auto_8980 ) ) ( not ( = ?auto_8986 ?auto_8980 ) ) ( SURFACE-AT ?auto_8977 ?auto_8976 ) ( CLEAR ?auto_8977 ) ( IS-CRATE ?auto_8978 ) ( not ( = ?auto_8977 ?auto_8978 ) ) ( not ( = ?auto_8974 ?auto_8977 ) ) ( not ( = ?auto_8975 ?auto_8977 ) ) ( not ( = ?auto_8986 ?auto_8977 ) ) ( not ( = ?auto_8980 ?auto_8977 ) ) ( AVAILABLE ?auto_8984 ) ( TRUCK-AT ?auto_8982 ?auto_8985 ) ( LIFTING ?auto_8981 ?auto_8978 ) )
    :subtasks
    ( ( !LOAD ?auto_8981 ?auto_8978 ?auto_8982 ?auto_8985 )
      ( MAKE-2CRATE ?auto_8978 ?auto_8974 ?auto_8975 )
      ( MAKE-1CRATE-VERIFY ?auto_8974 ?auto_8975 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_8987 - SURFACE
      ?auto_8988 - SURFACE
      ?auto_8989 - SURFACE
    )
    :vars
    (
      ?auto_8996 - HOIST
      ?auto_8992 - PLACE
      ?auto_8990 - PLACE
      ?auto_8998 - HOIST
      ?auto_8991 - SURFACE
      ?auto_8995 - PLACE
      ?auto_8997 - HOIST
      ?auto_8993 - SURFACE
      ?auto_8994 - SURFACE
      ?auto_8999 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_8996 ?auto_8992 ) ( IS-CRATE ?auto_8989 ) ( not ( = ?auto_8988 ?auto_8989 ) ) ( not ( = ?auto_8987 ?auto_8988 ) ) ( not ( = ?auto_8987 ?auto_8989 ) ) ( not ( = ?auto_8990 ?auto_8992 ) ) ( HOIST-AT ?auto_8998 ?auto_8990 ) ( not ( = ?auto_8996 ?auto_8998 ) ) ( AVAILABLE ?auto_8998 ) ( SURFACE-AT ?auto_8989 ?auto_8990 ) ( ON ?auto_8989 ?auto_8991 ) ( CLEAR ?auto_8989 ) ( not ( = ?auto_8988 ?auto_8991 ) ) ( not ( = ?auto_8989 ?auto_8991 ) ) ( not ( = ?auto_8987 ?auto_8991 ) ) ( IS-CRATE ?auto_8988 ) ( not ( = ?auto_8995 ?auto_8992 ) ) ( not ( = ?auto_8990 ?auto_8995 ) ) ( HOIST-AT ?auto_8997 ?auto_8995 ) ( not ( = ?auto_8996 ?auto_8997 ) ) ( not ( = ?auto_8998 ?auto_8997 ) ) ( SURFACE-AT ?auto_8988 ?auto_8995 ) ( ON ?auto_8988 ?auto_8993 ) ( CLEAR ?auto_8988 ) ( not ( = ?auto_8988 ?auto_8993 ) ) ( not ( = ?auto_8989 ?auto_8993 ) ) ( not ( = ?auto_8987 ?auto_8993 ) ) ( not ( = ?auto_8991 ?auto_8993 ) ) ( SURFACE-AT ?auto_8994 ?auto_8992 ) ( CLEAR ?auto_8994 ) ( IS-CRATE ?auto_8987 ) ( not ( = ?auto_8994 ?auto_8987 ) ) ( not ( = ?auto_8988 ?auto_8994 ) ) ( not ( = ?auto_8989 ?auto_8994 ) ) ( not ( = ?auto_8991 ?auto_8994 ) ) ( not ( = ?auto_8993 ?auto_8994 ) ) ( AVAILABLE ?auto_8996 ) ( TRUCK-AT ?auto_8999 ?auto_8995 ) ( LIFTING ?auto_8997 ?auto_8987 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_8988 ?auto_8989 )
      ( MAKE-2CRATE-VERIFY ?auto_8987 ?auto_8988 ?auto_8989 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9000 - SURFACE
      ?auto_9001 - SURFACE
      ?auto_9002 - SURFACE
      ?auto_9003 - SURFACE
    )
    :vars
    (
      ?auto_9006 - HOIST
      ?auto_9012 - PLACE
      ?auto_9005 - PLACE
      ?auto_9004 - HOIST
      ?auto_9009 - SURFACE
      ?auto_9007 - PLACE
      ?auto_9008 - HOIST
      ?auto_9010 - SURFACE
      ?auto_9011 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9006 ?auto_9012 ) ( IS-CRATE ?auto_9003 ) ( not ( = ?auto_9002 ?auto_9003 ) ) ( not ( = ?auto_9001 ?auto_9002 ) ) ( not ( = ?auto_9001 ?auto_9003 ) ) ( not ( = ?auto_9005 ?auto_9012 ) ) ( HOIST-AT ?auto_9004 ?auto_9005 ) ( not ( = ?auto_9006 ?auto_9004 ) ) ( AVAILABLE ?auto_9004 ) ( SURFACE-AT ?auto_9003 ?auto_9005 ) ( ON ?auto_9003 ?auto_9009 ) ( CLEAR ?auto_9003 ) ( not ( = ?auto_9002 ?auto_9009 ) ) ( not ( = ?auto_9003 ?auto_9009 ) ) ( not ( = ?auto_9001 ?auto_9009 ) ) ( IS-CRATE ?auto_9002 ) ( not ( = ?auto_9007 ?auto_9012 ) ) ( not ( = ?auto_9005 ?auto_9007 ) ) ( HOIST-AT ?auto_9008 ?auto_9007 ) ( not ( = ?auto_9006 ?auto_9008 ) ) ( not ( = ?auto_9004 ?auto_9008 ) ) ( SURFACE-AT ?auto_9002 ?auto_9007 ) ( ON ?auto_9002 ?auto_9010 ) ( CLEAR ?auto_9002 ) ( not ( = ?auto_9002 ?auto_9010 ) ) ( not ( = ?auto_9003 ?auto_9010 ) ) ( not ( = ?auto_9001 ?auto_9010 ) ) ( not ( = ?auto_9009 ?auto_9010 ) ) ( SURFACE-AT ?auto_9000 ?auto_9012 ) ( CLEAR ?auto_9000 ) ( IS-CRATE ?auto_9001 ) ( not ( = ?auto_9000 ?auto_9001 ) ) ( not ( = ?auto_9002 ?auto_9000 ) ) ( not ( = ?auto_9003 ?auto_9000 ) ) ( not ( = ?auto_9009 ?auto_9000 ) ) ( not ( = ?auto_9010 ?auto_9000 ) ) ( AVAILABLE ?auto_9006 ) ( TRUCK-AT ?auto_9011 ?auto_9007 ) ( LIFTING ?auto_9008 ?auto_9001 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9001 ?auto_9002 ?auto_9003 )
      ( MAKE-3CRATE-VERIFY ?auto_9000 ?auto_9001 ?auto_9002 ?auto_9003 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9013 - SURFACE
      ?auto_9014 - SURFACE
      ?auto_9015 - SURFACE
      ?auto_9016 - SURFACE
      ?auto_9017 - SURFACE
    )
    :vars
    (
      ?auto_9020 - HOIST
      ?auto_9026 - PLACE
      ?auto_9019 - PLACE
      ?auto_9018 - HOIST
      ?auto_9023 - SURFACE
      ?auto_9021 - PLACE
      ?auto_9022 - HOIST
      ?auto_9024 - SURFACE
      ?auto_9025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9020 ?auto_9026 ) ( IS-CRATE ?auto_9017 ) ( not ( = ?auto_9016 ?auto_9017 ) ) ( not ( = ?auto_9015 ?auto_9016 ) ) ( not ( = ?auto_9015 ?auto_9017 ) ) ( not ( = ?auto_9019 ?auto_9026 ) ) ( HOIST-AT ?auto_9018 ?auto_9019 ) ( not ( = ?auto_9020 ?auto_9018 ) ) ( AVAILABLE ?auto_9018 ) ( SURFACE-AT ?auto_9017 ?auto_9019 ) ( ON ?auto_9017 ?auto_9023 ) ( CLEAR ?auto_9017 ) ( not ( = ?auto_9016 ?auto_9023 ) ) ( not ( = ?auto_9017 ?auto_9023 ) ) ( not ( = ?auto_9015 ?auto_9023 ) ) ( IS-CRATE ?auto_9016 ) ( not ( = ?auto_9021 ?auto_9026 ) ) ( not ( = ?auto_9019 ?auto_9021 ) ) ( HOIST-AT ?auto_9022 ?auto_9021 ) ( not ( = ?auto_9020 ?auto_9022 ) ) ( not ( = ?auto_9018 ?auto_9022 ) ) ( SURFACE-AT ?auto_9016 ?auto_9021 ) ( ON ?auto_9016 ?auto_9024 ) ( CLEAR ?auto_9016 ) ( not ( = ?auto_9016 ?auto_9024 ) ) ( not ( = ?auto_9017 ?auto_9024 ) ) ( not ( = ?auto_9015 ?auto_9024 ) ) ( not ( = ?auto_9023 ?auto_9024 ) ) ( SURFACE-AT ?auto_9014 ?auto_9026 ) ( CLEAR ?auto_9014 ) ( IS-CRATE ?auto_9015 ) ( not ( = ?auto_9014 ?auto_9015 ) ) ( not ( = ?auto_9016 ?auto_9014 ) ) ( not ( = ?auto_9017 ?auto_9014 ) ) ( not ( = ?auto_9023 ?auto_9014 ) ) ( not ( = ?auto_9024 ?auto_9014 ) ) ( AVAILABLE ?auto_9020 ) ( TRUCK-AT ?auto_9025 ?auto_9021 ) ( LIFTING ?auto_9022 ?auto_9015 ) ( ON ?auto_9014 ?auto_9013 ) ( not ( = ?auto_9013 ?auto_9014 ) ) ( not ( = ?auto_9013 ?auto_9015 ) ) ( not ( = ?auto_9013 ?auto_9016 ) ) ( not ( = ?auto_9013 ?auto_9017 ) ) ( not ( = ?auto_9013 ?auto_9023 ) ) ( not ( = ?auto_9013 ?auto_9024 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9015 ?auto_9016 ?auto_9017 )
      ( MAKE-4CRATE-VERIFY ?auto_9013 ?auto_9014 ?auto_9015 ?auto_9016 ?auto_9017 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9027 - SURFACE
      ?auto_9028 - SURFACE
    )
    :vars
    (
      ?auto_9031 - HOIST
      ?auto_9039 - PLACE
      ?auto_9038 - SURFACE
      ?auto_9030 - PLACE
      ?auto_9029 - HOIST
      ?auto_9034 - SURFACE
      ?auto_9032 - PLACE
      ?auto_9033 - HOIST
      ?auto_9035 - SURFACE
      ?auto_9037 - SURFACE
      ?auto_9036 - TRUCK
      ?auto_9040 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9031 ?auto_9039 ) ( IS-CRATE ?auto_9028 ) ( not ( = ?auto_9027 ?auto_9028 ) ) ( not ( = ?auto_9038 ?auto_9027 ) ) ( not ( = ?auto_9038 ?auto_9028 ) ) ( not ( = ?auto_9030 ?auto_9039 ) ) ( HOIST-AT ?auto_9029 ?auto_9030 ) ( not ( = ?auto_9031 ?auto_9029 ) ) ( AVAILABLE ?auto_9029 ) ( SURFACE-AT ?auto_9028 ?auto_9030 ) ( ON ?auto_9028 ?auto_9034 ) ( CLEAR ?auto_9028 ) ( not ( = ?auto_9027 ?auto_9034 ) ) ( not ( = ?auto_9028 ?auto_9034 ) ) ( not ( = ?auto_9038 ?auto_9034 ) ) ( IS-CRATE ?auto_9027 ) ( not ( = ?auto_9032 ?auto_9039 ) ) ( not ( = ?auto_9030 ?auto_9032 ) ) ( HOIST-AT ?auto_9033 ?auto_9032 ) ( not ( = ?auto_9031 ?auto_9033 ) ) ( not ( = ?auto_9029 ?auto_9033 ) ) ( SURFACE-AT ?auto_9027 ?auto_9032 ) ( ON ?auto_9027 ?auto_9035 ) ( CLEAR ?auto_9027 ) ( not ( = ?auto_9027 ?auto_9035 ) ) ( not ( = ?auto_9028 ?auto_9035 ) ) ( not ( = ?auto_9038 ?auto_9035 ) ) ( not ( = ?auto_9034 ?auto_9035 ) ) ( SURFACE-AT ?auto_9037 ?auto_9039 ) ( CLEAR ?auto_9037 ) ( IS-CRATE ?auto_9038 ) ( not ( = ?auto_9037 ?auto_9038 ) ) ( not ( = ?auto_9027 ?auto_9037 ) ) ( not ( = ?auto_9028 ?auto_9037 ) ) ( not ( = ?auto_9034 ?auto_9037 ) ) ( not ( = ?auto_9035 ?auto_9037 ) ) ( AVAILABLE ?auto_9031 ) ( TRUCK-AT ?auto_9036 ?auto_9032 ) ( AVAILABLE ?auto_9033 ) ( SURFACE-AT ?auto_9038 ?auto_9032 ) ( ON ?auto_9038 ?auto_9040 ) ( CLEAR ?auto_9038 ) ( not ( = ?auto_9027 ?auto_9040 ) ) ( not ( = ?auto_9028 ?auto_9040 ) ) ( not ( = ?auto_9038 ?auto_9040 ) ) ( not ( = ?auto_9034 ?auto_9040 ) ) ( not ( = ?auto_9035 ?auto_9040 ) ) ( not ( = ?auto_9037 ?auto_9040 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9033 ?auto_9038 ?auto_9040 ?auto_9032 )
      ( MAKE-2CRATE ?auto_9038 ?auto_9027 ?auto_9028 )
      ( MAKE-1CRATE-VERIFY ?auto_9027 ?auto_9028 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9041 - SURFACE
      ?auto_9042 - SURFACE
      ?auto_9043 - SURFACE
    )
    :vars
    (
      ?auto_9046 - HOIST
      ?auto_9050 - PLACE
      ?auto_9052 - PLACE
      ?auto_9045 - HOIST
      ?auto_9044 - SURFACE
      ?auto_9048 - PLACE
      ?auto_9053 - HOIST
      ?auto_9051 - SURFACE
      ?auto_9049 - SURFACE
      ?auto_9054 - TRUCK
      ?auto_9047 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9046 ?auto_9050 ) ( IS-CRATE ?auto_9043 ) ( not ( = ?auto_9042 ?auto_9043 ) ) ( not ( = ?auto_9041 ?auto_9042 ) ) ( not ( = ?auto_9041 ?auto_9043 ) ) ( not ( = ?auto_9052 ?auto_9050 ) ) ( HOIST-AT ?auto_9045 ?auto_9052 ) ( not ( = ?auto_9046 ?auto_9045 ) ) ( AVAILABLE ?auto_9045 ) ( SURFACE-AT ?auto_9043 ?auto_9052 ) ( ON ?auto_9043 ?auto_9044 ) ( CLEAR ?auto_9043 ) ( not ( = ?auto_9042 ?auto_9044 ) ) ( not ( = ?auto_9043 ?auto_9044 ) ) ( not ( = ?auto_9041 ?auto_9044 ) ) ( IS-CRATE ?auto_9042 ) ( not ( = ?auto_9048 ?auto_9050 ) ) ( not ( = ?auto_9052 ?auto_9048 ) ) ( HOIST-AT ?auto_9053 ?auto_9048 ) ( not ( = ?auto_9046 ?auto_9053 ) ) ( not ( = ?auto_9045 ?auto_9053 ) ) ( SURFACE-AT ?auto_9042 ?auto_9048 ) ( ON ?auto_9042 ?auto_9051 ) ( CLEAR ?auto_9042 ) ( not ( = ?auto_9042 ?auto_9051 ) ) ( not ( = ?auto_9043 ?auto_9051 ) ) ( not ( = ?auto_9041 ?auto_9051 ) ) ( not ( = ?auto_9044 ?auto_9051 ) ) ( SURFACE-AT ?auto_9049 ?auto_9050 ) ( CLEAR ?auto_9049 ) ( IS-CRATE ?auto_9041 ) ( not ( = ?auto_9049 ?auto_9041 ) ) ( not ( = ?auto_9042 ?auto_9049 ) ) ( not ( = ?auto_9043 ?auto_9049 ) ) ( not ( = ?auto_9044 ?auto_9049 ) ) ( not ( = ?auto_9051 ?auto_9049 ) ) ( AVAILABLE ?auto_9046 ) ( TRUCK-AT ?auto_9054 ?auto_9048 ) ( AVAILABLE ?auto_9053 ) ( SURFACE-AT ?auto_9041 ?auto_9048 ) ( ON ?auto_9041 ?auto_9047 ) ( CLEAR ?auto_9041 ) ( not ( = ?auto_9042 ?auto_9047 ) ) ( not ( = ?auto_9043 ?auto_9047 ) ) ( not ( = ?auto_9041 ?auto_9047 ) ) ( not ( = ?auto_9044 ?auto_9047 ) ) ( not ( = ?auto_9051 ?auto_9047 ) ) ( not ( = ?auto_9049 ?auto_9047 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9042 ?auto_9043 )
      ( MAKE-2CRATE-VERIFY ?auto_9041 ?auto_9042 ?auto_9043 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9055 - SURFACE
      ?auto_9056 - SURFACE
      ?auto_9057 - SURFACE
      ?auto_9058 - SURFACE
    )
    :vars
    (
      ?auto_9060 - HOIST
      ?auto_9068 - PLACE
      ?auto_9062 - PLACE
      ?auto_9063 - HOIST
      ?auto_9067 - SURFACE
      ?auto_9059 - PLACE
      ?auto_9065 - HOIST
      ?auto_9061 - SURFACE
      ?auto_9066 - TRUCK
      ?auto_9064 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9060 ?auto_9068 ) ( IS-CRATE ?auto_9058 ) ( not ( = ?auto_9057 ?auto_9058 ) ) ( not ( = ?auto_9056 ?auto_9057 ) ) ( not ( = ?auto_9056 ?auto_9058 ) ) ( not ( = ?auto_9062 ?auto_9068 ) ) ( HOIST-AT ?auto_9063 ?auto_9062 ) ( not ( = ?auto_9060 ?auto_9063 ) ) ( AVAILABLE ?auto_9063 ) ( SURFACE-AT ?auto_9058 ?auto_9062 ) ( ON ?auto_9058 ?auto_9067 ) ( CLEAR ?auto_9058 ) ( not ( = ?auto_9057 ?auto_9067 ) ) ( not ( = ?auto_9058 ?auto_9067 ) ) ( not ( = ?auto_9056 ?auto_9067 ) ) ( IS-CRATE ?auto_9057 ) ( not ( = ?auto_9059 ?auto_9068 ) ) ( not ( = ?auto_9062 ?auto_9059 ) ) ( HOIST-AT ?auto_9065 ?auto_9059 ) ( not ( = ?auto_9060 ?auto_9065 ) ) ( not ( = ?auto_9063 ?auto_9065 ) ) ( SURFACE-AT ?auto_9057 ?auto_9059 ) ( ON ?auto_9057 ?auto_9061 ) ( CLEAR ?auto_9057 ) ( not ( = ?auto_9057 ?auto_9061 ) ) ( not ( = ?auto_9058 ?auto_9061 ) ) ( not ( = ?auto_9056 ?auto_9061 ) ) ( not ( = ?auto_9067 ?auto_9061 ) ) ( SURFACE-AT ?auto_9055 ?auto_9068 ) ( CLEAR ?auto_9055 ) ( IS-CRATE ?auto_9056 ) ( not ( = ?auto_9055 ?auto_9056 ) ) ( not ( = ?auto_9057 ?auto_9055 ) ) ( not ( = ?auto_9058 ?auto_9055 ) ) ( not ( = ?auto_9067 ?auto_9055 ) ) ( not ( = ?auto_9061 ?auto_9055 ) ) ( AVAILABLE ?auto_9060 ) ( TRUCK-AT ?auto_9066 ?auto_9059 ) ( AVAILABLE ?auto_9065 ) ( SURFACE-AT ?auto_9056 ?auto_9059 ) ( ON ?auto_9056 ?auto_9064 ) ( CLEAR ?auto_9056 ) ( not ( = ?auto_9057 ?auto_9064 ) ) ( not ( = ?auto_9058 ?auto_9064 ) ) ( not ( = ?auto_9056 ?auto_9064 ) ) ( not ( = ?auto_9067 ?auto_9064 ) ) ( not ( = ?auto_9061 ?auto_9064 ) ) ( not ( = ?auto_9055 ?auto_9064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9056 ?auto_9057 ?auto_9058 )
      ( MAKE-3CRATE-VERIFY ?auto_9055 ?auto_9056 ?auto_9057 ?auto_9058 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9069 - SURFACE
      ?auto_9070 - SURFACE
      ?auto_9071 - SURFACE
      ?auto_9072 - SURFACE
      ?auto_9073 - SURFACE
    )
    :vars
    (
      ?auto_9075 - HOIST
      ?auto_9083 - PLACE
      ?auto_9077 - PLACE
      ?auto_9078 - HOIST
      ?auto_9082 - SURFACE
      ?auto_9074 - PLACE
      ?auto_9080 - HOIST
      ?auto_9076 - SURFACE
      ?auto_9081 - TRUCK
      ?auto_9079 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9075 ?auto_9083 ) ( IS-CRATE ?auto_9073 ) ( not ( = ?auto_9072 ?auto_9073 ) ) ( not ( = ?auto_9071 ?auto_9072 ) ) ( not ( = ?auto_9071 ?auto_9073 ) ) ( not ( = ?auto_9077 ?auto_9083 ) ) ( HOIST-AT ?auto_9078 ?auto_9077 ) ( not ( = ?auto_9075 ?auto_9078 ) ) ( AVAILABLE ?auto_9078 ) ( SURFACE-AT ?auto_9073 ?auto_9077 ) ( ON ?auto_9073 ?auto_9082 ) ( CLEAR ?auto_9073 ) ( not ( = ?auto_9072 ?auto_9082 ) ) ( not ( = ?auto_9073 ?auto_9082 ) ) ( not ( = ?auto_9071 ?auto_9082 ) ) ( IS-CRATE ?auto_9072 ) ( not ( = ?auto_9074 ?auto_9083 ) ) ( not ( = ?auto_9077 ?auto_9074 ) ) ( HOIST-AT ?auto_9080 ?auto_9074 ) ( not ( = ?auto_9075 ?auto_9080 ) ) ( not ( = ?auto_9078 ?auto_9080 ) ) ( SURFACE-AT ?auto_9072 ?auto_9074 ) ( ON ?auto_9072 ?auto_9076 ) ( CLEAR ?auto_9072 ) ( not ( = ?auto_9072 ?auto_9076 ) ) ( not ( = ?auto_9073 ?auto_9076 ) ) ( not ( = ?auto_9071 ?auto_9076 ) ) ( not ( = ?auto_9082 ?auto_9076 ) ) ( SURFACE-AT ?auto_9070 ?auto_9083 ) ( CLEAR ?auto_9070 ) ( IS-CRATE ?auto_9071 ) ( not ( = ?auto_9070 ?auto_9071 ) ) ( not ( = ?auto_9072 ?auto_9070 ) ) ( not ( = ?auto_9073 ?auto_9070 ) ) ( not ( = ?auto_9082 ?auto_9070 ) ) ( not ( = ?auto_9076 ?auto_9070 ) ) ( AVAILABLE ?auto_9075 ) ( TRUCK-AT ?auto_9081 ?auto_9074 ) ( AVAILABLE ?auto_9080 ) ( SURFACE-AT ?auto_9071 ?auto_9074 ) ( ON ?auto_9071 ?auto_9079 ) ( CLEAR ?auto_9071 ) ( not ( = ?auto_9072 ?auto_9079 ) ) ( not ( = ?auto_9073 ?auto_9079 ) ) ( not ( = ?auto_9071 ?auto_9079 ) ) ( not ( = ?auto_9082 ?auto_9079 ) ) ( not ( = ?auto_9076 ?auto_9079 ) ) ( not ( = ?auto_9070 ?auto_9079 ) ) ( ON ?auto_9070 ?auto_9069 ) ( not ( = ?auto_9069 ?auto_9070 ) ) ( not ( = ?auto_9069 ?auto_9071 ) ) ( not ( = ?auto_9069 ?auto_9072 ) ) ( not ( = ?auto_9069 ?auto_9073 ) ) ( not ( = ?auto_9069 ?auto_9082 ) ) ( not ( = ?auto_9069 ?auto_9076 ) ) ( not ( = ?auto_9069 ?auto_9079 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9071 ?auto_9072 ?auto_9073 )
      ( MAKE-4CRATE-VERIFY ?auto_9069 ?auto_9070 ?auto_9071 ?auto_9072 ?auto_9073 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9084 - SURFACE
      ?auto_9085 - SURFACE
    )
    :vars
    (
      ?auto_9088 - HOIST
      ?auto_9097 - PLACE
      ?auto_9093 - SURFACE
      ?auto_9090 - PLACE
      ?auto_9091 - HOIST
      ?auto_9096 - SURFACE
      ?auto_9086 - PLACE
      ?auto_9094 - HOIST
      ?auto_9089 - SURFACE
      ?auto_9087 - SURFACE
      ?auto_9092 - SURFACE
      ?auto_9095 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9088 ?auto_9097 ) ( IS-CRATE ?auto_9085 ) ( not ( = ?auto_9084 ?auto_9085 ) ) ( not ( = ?auto_9093 ?auto_9084 ) ) ( not ( = ?auto_9093 ?auto_9085 ) ) ( not ( = ?auto_9090 ?auto_9097 ) ) ( HOIST-AT ?auto_9091 ?auto_9090 ) ( not ( = ?auto_9088 ?auto_9091 ) ) ( AVAILABLE ?auto_9091 ) ( SURFACE-AT ?auto_9085 ?auto_9090 ) ( ON ?auto_9085 ?auto_9096 ) ( CLEAR ?auto_9085 ) ( not ( = ?auto_9084 ?auto_9096 ) ) ( not ( = ?auto_9085 ?auto_9096 ) ) ( not ( = ?auto_9093 ?auto_9096 ) ) ( IS-CRATE ?auto_9084 ) ( not ( = ?auto_9086 ?auto_9097 ) ) ( not ( = ?auto_9090 ?auto_9086 ) ) ( HOIST-AT ?auto_9094 ?auto_9086 ) ( not ( = ?auto_9088 ?auto_9094 ) ) ( not ( = ?auto_9091 ?auto_9094 ) ) ( SURFACE-AT ?auto_9084 ?auto_9086 ) ( ON ?auto_9084 ?auto_9089 ) ( CLEAR ?auto_9084 ) ( not ( = ?auto_9084 ?auto_9089 ) ) ( not ( = ?auto_9085 ?auto_9089 ) ) ( not ( = ?auto_9093 ?auto_9089 ) ) ( not ( = ?auto_9096 ?auto_9089 ) ) ( SURFACE-AT ?auto_9087 ?auto_9097 ) ( CLEAR ?auto_9087 ) ( IS-CRATE ?auto_9093 ) ( not ( = ?auto_9087 ?auto_9093 ) ) ( not ( = ?auto_9084 ?auto_9087 ) ) ( not ( = ?auto_9085 ?auto_9087 ) ) ( not ( = ?auto_9096 ?auto_9087 ) ) ( not ( = ?auto_9089 ?auto_9087 ) ) ( AVAILABLE ?auto_9088 ) ( AVAILABLE ?auto_9094 ) ( SURFACE-AT ?auto_9093 ?auto_9086 ) ( ON ?auto_9093 ?auto_9092 ) ( CLEAR ?auto_9093 ) ( not ( = ?auto_9084 ?auto_9092 ) ) ( not ( = ?auto_9085 ?auto_9092 ) ) ( not ( = ?auto_9093 ?auto_9092 ) ) ( not ( = ?auto_9096 ?auto_9092 ) ) ( not ( = ?auto_9089 ?auto_9092 ) ) ( not ( = ?auto_9087 ?auto_9092 ) ) ( TRUCK-AT ?auto_9095 ?auto_9097 ) )
    :subtasks
    ( ( !DRIVE ?auto_9095 ?auto_9097 ?auto_9086 )
      ( MAKE-2CRATE ?auto_9093 ?auto_9084 ?auto_9085 )
      ( MAKE-1CRATE-VERIFY ?auto_9084 ?auto_9085 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9098 - SURFACE
      ?auto_9099 - SURFACE
      ?auto_9100 - SURFACE
    )
    :vars
    (
      ?auto_9106 - HOIST
      ?auto_9110 - PLACE
      ?auto_9107 - PLACE
      ?auto_9105 - HOIST
      ?auto_9104 - SURFACE
      ?auto_9101 - PLACE
      ?auto_9111 - HOIST
      ?auto_9102 - SURFACE
      ?auto_9109 - SURFACE
      ?auto_9103 - SURFACE
      ?auto_9108 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9106 ?auto_9110 ) ( IS-CRATE ?auto_9100 ) ( not ( = ?auto_9099 ?auto_9100 ) ) ( not ( = ?auto_9098 ?auto_9099 ) ) ( not ( = ?auto_9098 ?auto_9100 ) ) ( not ( = ?auto_9107 ?auto_9110 ) ) ( HOIST-AT ?auto_9105 ?auto_9107 ) ( not ( = ?auto_9106 ?auto_9105 ) ) ( AVAILABLE ?auto_9105 ) ( SURFACE-AT ?auto_9100 ?auto_9107 ) ( ON ?auto_9100 ?auto_9104 ) ( CLEAR ?auto_9100 ) ( not ( = ?auto_9099 ?auto_9104 ) ) ( not ( = ?auto_9100 ?auto_9104 ) ) ( not ( = ?auto_9098 ?auto_9104 ) ) ( IS-CRATE ?auto_9099 ) ( not ( = ?auto_9101 ?auto_9110 ) ) ( not ( = ?auto_9107 ?auto_9101 ) ) ( HOIST-AT ?auto_9111 ?auto_9101 ) ( not ( = ?auto_9106 ?auto_9111 ) ) ( not ( = ?auto_9105 ?auto_9111 ) ) ( SURFACE-AT ?auto_9099 ?auto_9101 ) ( ON ?auto_9099 ?auto_9102 ) ( CLEAR ?auto_9099 ) ( not ( = ?auto_9099 ?auto_9102 ) ) ( not ( = ?auto_9100 ?auto_9102 ) ) ( not ( = ?auto_9098 ?auto_9102 ) ) ( not ( = ?auto_9104 ?auto_9102 ) ) ( SURFACE-AT ?auto_9109 ?auto_9110 ) ( CLEAR ?auto_9109 ) ( IS-CRATE ?auto_9098 ) ( not ( = ?auto_9109 ?auto_9098 ) ) ( not ( = ?auto_9099 ?auto_9109 ) ) ( not ( = ?auto_9100 ?auto_9109 ) ) ( not ( = ?auto_9104 ?auto_9109 ) ) ( not ( = ?auto_9102 ?auto_9109 ) ) ( AVAILABLE ?auto_9106 ) ( AVAILABLE ?auto_9111 ) ( SURFACE-AT ?auto_9098 ?auto_9101 ) ( ON ?auto_9098 ?auto_9103 ) ( CLEAR ?auto_9098 ) ( not ( = ?auto_9099 ?auto_9103 ) ) ( not ( = ?auto_9100 ?auto_9103 ) ) ( not ( = ?auto_9098 ?auto_9103 ) ) ( not ( = ?auto_9104 ?auto_9103 ) ) ( not ( = ?auto_9102 ?auto_9103 ) ) ( not ( = ?auto_9109 ?auto_9103 ) ) ( TRUCK-AT ?auto_9108 ?auto_9110 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9099 ?auto_9100 )
      ( MAKE-2CRATE-VERIFY ?auto_9098 ?auto_9099 ?auto_9100 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9112 - SURFACE
      ?auto_9113 - SURFACE
      ?auto_9114 - SURFACE
      ?auto_9115 - SURFACE
    )
    :vars
    (
      ?auto_9116 - HOIST
      ?auto_9123 - PLACE
      ?auto_9118 - PLACE
      ?auto_9121 - HOIST
      ?auto_9120 - SURFACE
      ?auto_9117 - PLACE
      ?auto_9119 - HOIST
      ?auto_9125 - SURFACE
      ?auto_9124 - SURFACE
      ?auto_9122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9116 ?auto_9123 ) ( IS-CRATE ?auto_9115 ) ( not ( = ?auto_9114 ?auto_9115 ) ) ( not ( = ?auto_9113 ?auto_9114 ) ) ( not ( = ?auto_9113 ?auto_9115 ) ) ( not ( = ?auto_9118 ?auto_9123 ) ) ( HOIST-AT ?auto_9121 ?auto_9118 ) ( not ( = ?auto_9116 ?auto_9121 ) ) ( AVAILABLE ?auto_9121 ) ( SURFACE-AT ?auto_9115 ?auto_9118 ) ( ON ?auto_9115 ?auto_9120 ) ( CLEAR ?auto_9115 ) ( not ( = ?auto_9114 ?auto_9120 ) ) ( not ( = ?auto_9115 ?auto_9120 ) ) ( not ( = ?auto_9113 ?auto_9120 ) ) ( IS-CRATE ?auto_9114 ) ( not ( = ?auto_9117 ?auto_9123 ) ) ( not ( = ?auto_9118 ?auto_9117 ) ) ( HOIST-AT ?auto_9119 ?auto_9117 ) ( not ( = ?auto_9116 ?auto_9119 ) ) ( not ( = ?auto_9121 ?auto_9119 ) ) ( SURFACE-AT ?auto_9114 ?auto_9117 ) ( ON ?auto_9114 ?auto_9125 ) ( CLEAR ?auto_9114 ) ( not ( = ?auto_9114 ?auto_9125 ) ) ( not ( = ?auto_9115 ?auto_9125 ) ) ( not ( = ?auto_9113 ?auto_9125 ) ) ( not ( = ?auto_9120 ?auto_9125 ) ) ( SURFACE-AT ?auto_9112 ?auto_9123 ) ( CLEAR ?auto_9112 ) ( IS-CRATE ?auto_9113 ) ( not ( = ?auto_9112 ?auto_9113 ) ) ( not ( = ?auto_9114 ?auto_9112 ) ) ( not ( = ?auto_9115 ?auto_9112 ) ) ( not ( = ?auto_9120 ?auto_9112 ) ) ( not ( = ?auto_9125 ?auto_9112 ) ) ( AVAILABLE ?auto_9116 ) ( AVAILABLE ?auto_9119 ) ( SURFACE-AT ?auto_9113 ?auto_9117 ) ( ON ?auto_9113 ?auto_9124 ) ( CLEAR ?auto_9113 ) ( not ( = ?auto_9114 ?auto_9124 ) ) ( not ( = ?auto_9115 ?auto_9124 ) ) ( not ( = ?auto_9113 ?auto_9124 ) ) ( not ( = ?auto_9120 ?auto_9124 ) ) ( not ( = ?auto_9125 ?auto_9124 ) ) ( not ( = ?auto_9112 ?auto_9124 ) ) ( TRUCK-AT ?auto_9122 ?auto_9123 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9113 ?auto_9114 ?auto_9115 )
      ( MAKE-3CRATE-VERIFY ?auto_9112 ?auto_9113 ?auto_9114 ?auto_9115 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9126 - SURFACE
      ?auto_9127 - SURFACE
      ?auto_9128 - SURFACE
      ?auto_9129 - SURFACE
      ?auto_9130 - SURFACE
    )
    :vars
    (
      ?auto_9131 - HOIST
      ?auto_9138 - PLACE
      ?auto_9133 - PLACE
      ?auto_9136 - HOIST
      ?auto_9135 - SURFACE
      ?auto_9132 - PLACE
      ?auto_9134 - HOIST
      ?auto_9140 - SURFACE
      ?auto_9139 - SURFACE
      ?auto_9137 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9131 ?auto_9138 ) ( IS-CRATE ?auto_9130 ) ( not ( = ?auto_9129 ?auto_9130 ) ) ( not ( = ?auto_9128 ?auto_9129 ) ) ( not ( = ?auto_9128 ?auto_9130 ) ) ( not ( = ?auto_9133 ?auto_9138 ) ) ( HOIST-AT ?auto_9136 ?auto_9133 ) ( not ( = ?auto_9131 ?auto_9136 ) ) ( AVAILABLE ?auto_9136 ) ( SURFACE-AT ?auto_9130 ?auto_9133 ) ( ON ?auto_9130 ?auto_9135 ) ( CLEAR ?auto_9130 ) ( not ( = ?auto_9129 ?auto_9135 ) ) ( not ( = ?auto_9130 ?auto_9135 ) ) ( not ( = ?auto_9128 ?auto_9135 ) ) ( IS-CRATE ?auto_9129 ) ( not ( = ?auto_9132 ?auto_9138 ) ) ( not ( = ?auto_9133 ?auto_9132 ) ) ( HOIST-AT ?auto_9134 ?auto_9132 ) ( not ( = ?auto_9131 ?auto_9134 ) ) ( not ( = ?auto_9136 ?auto_9134 ) ) ( SURFACE-AT ?auto_9129 ?auto_9132 ) ( ON ?auto_9129 ?auto_9140 ) ( CLEAR ?auto_9129 ) ( not ( = ?auto_9129 ?auto_9140 ) ) ( not ( = ?auto_9130 ?auto_9140 ) ) ( not ( = ?auto_9128 ?auto_9140 ) ) ( not ( = ?auto_9135 ?auto_9140 ) ) ( SURFACE-AT ?auto_9127 ?auto_9138 ) ( CLEAR ?auto_9127 ) ( IS-CRATE ?auto_9128 ) ( not ( = ?auto_9127 ?auto_9128 ) ) ( not ( = ?auto_9129 ?auto_9127 ) ) ( not ( = ?auto_9130 ?auto_9127 ) ) ( not ( = ?auto_9135 ?auto_9127 ) ) ( not ( = ?auto_9140 ?auto_9127 ) ) ( AVAILABLE ?auto_9131 ) ( AVAILABLE ?auto_9134 ) ( SURFACE-AT ?auto_9128 ?auto_9132 ) ( ON ?auto_9128 ?auto_9139 ) ( CLEAR ?auto_9128 ) ( not ( = ?auto_9129 ?auto_9139 ) ) ( not ( = ?auto_9130 ?auto_9139 ) ) ( not ( = ?auto_9128 ?auto_9139 ) ) ( not ( = ?auto_9135 ?auto_9139 ) ) ( not ( = ?auto_9140 ?auto_9139 ) ) ( not ( = ?auto_9127 ?auto_9139 ) ) ( TRUCK-AT ?auto_9137 ?auto_9138 ) ( ON ?auto_9127 ?auto_9126 ) ( not ( = ?auto_9126 ?auto_9127 ) ) ( not ( = ?auto_9126 ?auto_9128 ) ) ( not ( = ?auto_9126 ?auto_9129 ) ) ( not ( = ?auto_9126 ?auto_9130 ) ) ( not ( = ?auto_9126 ?auto_9135 ) ) ( not ( = ?auto_9126 ?auto_9140 ) ) ( not ( = ?auto_9126 ?auto_9139 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9128 ?auto_9129 ?auto_9130 )
      ( MAKE-4CRATE-VERIFY ?auto_9126 ?auto_9127 ?auto_9128 ?auto_9129 ?auto_9130 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9141 - SURFACE
      ?auto_9142 - SURFACE
    )
    :vars
    (
      ?auto_9143 - HOIST
      ?auto_9152 - PLACE
      ?auto_9147 - SURFACE
      ?auto_9145 - PLACE
      ?auto_9150 - HOIST
      ?auto_9149 - SURFACE
      ?auto_9144 - PLACE
      ?auto_9148 - HOIST
      ?auto_9154 - SURFACE
      ?auto_9146 - SURFACE
      ?auto_9153 - SURFACE
      ?auto_9151 - TRUCK
      ?auto_9155 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9143 ?auto_9152 ) ( IS-CRATE ?auto_9142 ) ( not ( = ?auto_9141 ?auto_9142 ) ) ( not ( = ?auto_9147 ?auto_9141 ) ) ( not ( = ?auto_9147 ?auto_9142 ) ) ( not ( = ?auto_9145 ?auto_9152 ) ) ( HOIST-AT ?auto_9150 ?auto_9145 ) ( not ( = ?auto_9143 ?auto_9150 ) ) ( AVAILABLE ?auto_9150 ) ( SURFACE-AT ?auto_9142 ?auto_9145 ) ( ON ?auto_9142 ?auto_9149 ) ( CLEAR ?auto_9142 ) ( not ( = ?auto_9141 ?auto_9149 ) ) ( not ( = ?auto_9142 ?auto_9149 ) ) ( not ( = ?auto_9147 ?auto_9149 ) ) ( IS-CRATE ?auto_9141 ) ( not ( = ?auto_9144 ?auto_9152 ) ) ( not ( = ?auto_9145 ?auto_9144 ) ) ( HOIST-AT ?auto_9148 ?auto_9144 ) ( not ( = ?auto_9143 ?auto_9148 ) ) ( not ( = ?auto_9150 ?auto_9148 ) ) ( SURFACE-AT ?auto_9141 ?auto_9144 ) ( ON ?auto_9141 ?auto_9154 ) ( CLEAR ?auto_9141 ) ( not ( = ?auto_9141 ?auto_9154 ) ) ( not ( = ?auto_9142 ?auto_9154 ) ) ( not ( = ?auto_9147 ?auto_9154 ) ) ( not ( = ?auto_9149 ?auto_9154 ) ) ( IS-CRATE ?auto_9147 ) ( not ( = ?auto_9146 ?auto_9147 ) ) ( not ( = ?auto_9141 ?auto_9146 ) ) ( not ( = ?auto_9142 ?auto_9146 ) ) ( not ( = ?auto_9149 ?auto_9146 ) ) ( not ( = ?auto_9154 ?auto_9146 ) ) ( AVAILABLE ?auto_9148 ) ( SURFACE-AT ?auto_9147 ?auto_9144 ) ( ON ?auto_9147 ?auto_9153 ) ( CLEAR ?auto_9147 ) ( not ( = ?auto_9141 ?auto_9153 ) ) ( not ( = ?auto_9142 ?auto_9153 ) ) ( not ( = ?auto_9147 ?auto_9153 ) ) ( not ( = ?auto_9149 ?auto_9153 ) ) ( not ( = ?auto_9154 ?auto_9153 ) ) ( not ( = ?auto_9146 ?auto_9153 ) ) ( TRUCK-AT ?auto_9151 ?auto_9152 ) ( SURFACE-AT ?auto_9155 ?auto_9152 ) ( CLEAR ?auto_9155 ) ( LIFTING ?auto_9143 ?auto_9146 ) ( IS-CRATE ?auto_9146 ) ( not ( = ?auto_9155 ?auto_9146 ) ) ( not ( = ?auto_9141 ?auto_9155 ) ) ( not ( = ?auto_9142 ?auto_9155 ) ) ( not ( = ?auto_9147 ?auto_9155 ) ) ( not ( = ?auto_9149 ?auto_9155 ) ) ( not ( = ?auto_9154 ?auto_9155 ) ) ( not ( = ?auto_9153 ?auto_9155 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9155 ?auto_9146 )
      ( MAKE-2CRATE ?auto_9147 ?auto_9141 ?auto_9142 )
      ( MAKE-1CRATE-VERIFY ?auto_9141 ?auto_9142 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9156 - SURFACE
      ?auto_9157 - SURFACE
      ?auto_9158 - SURFACE
    )
    :vars
    (
      ?auto_9170 - HOIST
      ?auto_9159 - PLACE
      ?auto_9165 - PLACE
      ?auto_9163 - HOIST
      ?auto_9167 - SURFACE
      ?auto_9169 - PLACE
      ?auto_9166 - HOIST
      ?auto_9161 - SURFACE
      ?auto_9164 - SURFACE
      ?auto_9162 - SURFACE
      ?auto_9160 - TRUCK
      ?auto_9168 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9170 ?auto_9159 ) ( IS-CRATE ?auto_9158 ) ( not ( = ?auto_9157 ?auto_9158 ) ) ( not ( = ?auto_9156 ?auto_9157 ) ) ( not ( = ?auto_9156 ?auto_9158 ) ) ( not ( = ?auto_9165 ?auto_9159 ) ) ( HOIST-AT ?auto_9163 ?auto_9165 ) ( not ( = ?auto_9170 ?auto_9163 ) ) ( AVAILABLE ?auto_9163 ) ( SURFACE-AT ?auto_9158 ?auto_9165 ) ( ON ?auto_9158 ?auto_9167 ) ( CLEAR ?auto_9158 ) ( not ( = ?auto_9157 ?auto_9167 ) ) ( not ( = ?auto_9158 ?auto_9167 ) ) ( not ( = ?auto_9156 ?auto_9167 ) ) ( IS-CRATE ?auto_9157 ) ( not ( = ?auto_9169 ?auto_9159 ) ) ( not ( = ?auto_9165 ?auto_9169 ) ) ( HOIST-AT ?auto_9166 ?auto_9169 ) ( not ( = ?auto_9170 ?auto_9166 ) ) ( not ( = ?auto_9163 ?auto_9166 ) ) ( SURFACE-AT ?auto_9157 ?auto_9169 ) ( ON ?auto_9157 ?auto_9161 ) ( CLEAR ?auto_9157 ) ( not ( = ?auto_9157 ?auto_9161 ) ) ( not ( = ?auto_9158 ?auto_9161 ) ) ( not ( = ?auto_9156 ?auto_9161 ) ) ( not ( = ?auto_9167 ?auto_9161 ) ) ( IS-CRATE ?auto_9156 ) ( not ( = ?auto_9164 ?auto_9156 ) ) ( not ( = ?auto_9157 ?auto_9164 ) ) ( not ( = ?auto_9158 ?auto_9164 ) ) ( not ( = ?auto_9167 ?auto_9164 ) ) ( not ( = ?auto_9161 ?auto_9164 ) ) ( AVAILABLE ?auto_9166 ) ( SURFACE-AT ?auto_9156 ?auto_9169 ) ( ON ?auto_9156 ?auto_9162 ) ( CLEAR ?auto_9156 ) ( not ( = ?auto_9157 ?auto_9162 ) ) ( not ( = ?auto_9158 ?auto_9162 ) ) ( not ( = ?auto_9156 ?auto_9162 ) ) ( not ( = ?auto_9167 ?auto_9162 ) ) ( not ( = ?auto_9161 ?auto_9162 ) ) ( not ( = ?auto_9164 ?auto_9162 ) ) ( TRUCK-AT ?auto_9160 ?auto_9159 ) ( SURFACE-AT ?auto_9168 ?auto_9159 ) ( CLEAR ?auto_9168 ) ( LIFTING ?auto_9170 ?auto_9164 ) ( IS-CRATE ?auto_9164 ) ( not ( = ?auto_9168 ?auto_9164 ) ) ( not ( = ?auto_9157 ?auto_9168 ) ) ( not ( = ?auto_9158 ?auto_9168 ) ) ( not ( = ?auto_9156 ?auto_9168 ) ) ( not ( = ?auto_9167 ?auto_9168 ) ) ( not ( = ?auto_9161 ?auto_9168 ) ) ( not ( = ?auto_9162 ?auto_9168 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9157 ?auto_9158 )
      ( MAKE-2CRATE-VERIFY ?auto_9156 ?auto_9157 ?auto_9158 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9171 - SURFACE
      ?auto_9172 - SURFACE
      ?auto_9173 - SURFACE
      ?auto_9174 - SURFACE
    )
    :vars
    (
      ?auto_9184 - HOIST
      ?auto_9176 - PLACE
      ?auto_9175 - PLACE
      ?auto_9179 - HOIST
      ?auto_9183 - SURFACE
      ?auto_9177 - PLACE
      ?auto_9180 - HOIST
      ?auto_9181 - SURFACE
      ?auto_9178 - SURFACE
      ?auto_9185 - TRUCK
      ?auto_9182 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9184 ?auto_9176 ) ( IS-CRATE ?auto_9174 ) ( not ( = ?auto_9173 ?auto_9174 ) ) ( not ( = ?auto_9172 ?auto_9173 ) ) ( not ( = ?auto_9172 ?auto_9174 ) ) ( not ( = ?auto_9175 ?auto_9176 ) ) ( HOIST-AT ?auto_9179 ?auto_9175 ) ( not ( = ?auto_9184 ?auto_9179 ) ) ( AVAILABLE ?auto_9179 ) ( SURFACE-AT ?auto_9174 ?auto_9175 ) ( ON ?auto_9174 ?auto_9183 ) ( CLEAR ?auto_9174 ) ( not ( = ?auto_9173 ?auto_9183 ) ) ( not ( = ?auto_9174 ?auto_9183 ) ) ( not ( = ?auto_9172 ?auto_9183 ) ) ( IS-CRATE ?auto_9173 ) ( not ( = ?auto_9177 ?auto_9176 ) ) ( not ( = ?auto_9175 ?auto_9177 ) ) ( HOIST-AT ?auto_9180 ?auto_9177 ) ( not ( = ?auto_9184 ?auto_9180 ) ) ( not ( = ?auto_9179 ?auto_9180 ) ) ( SURFACE-AT ?auto_9173 ?auto_9177 ) ( ON ?auto_9173 ?auto_9181 ) ( CLEAR ?auto_9173 ) ( not ( = ?auto_9173 ?auto_9181 ) ) ( not ( = ?auto_9174 ?auto_9181 ) ) ( not ( = ?auto_9172 ?auto_9181 ) ) ( not ( = ?auto_9183 ?auto_9181 ) ) ( IS-CRATE ?auto_9172 ) ( not ( = ?auto_9171 ?auto_9172 ) ) ( not ( = ?auto_9173 ?auto_9171 ) ) ( not ( = ?auto_9174 ?auto_9171 ) ) ( not ( = ?auto_9183 ?auto_9171 ) ) ( not ( = ?auto_9181 ?auto_9171 ) ) ( AVAILABLE ?auto_9180 ) ( SURFACE-AT ?auto_9172 ?auto_9177 ) ( ON ?auto_9172 ?auto_9178 ) ( CLEAR ?auto_9172 ) ( not ( = ?auto_9173 ?auto_9178 ) ) ( not ( = ?auto_9174 ?auto_9178 ) ) ( not ( = ?auto_9172 ?auto_9178 ) ) ( not ( = ?auto_9183 ?auto_9178 ) ) ( not ( = ?auto_9181 ?auto_9178 ) ) ( not ( = ?auto_9171 ?auto_9178 ) ) ( TRUCK-AT ?auto_9185 ?auto_9176 ) ( SURFACE-AT ?auto_9182 ?auto_9176 ) ( CLEAR ?auto_9182 ) ( LIFTING ?auto_9184 ?auto_9171 ) ( IS-CRATE ?auto_9171 ) ( not ( = ?auto_9182 ?auto_9171 ) ) ( not ( = ?auto_9173 ?auto_9182 ) ) ( not ( = ?auto_9174 ?auto_9182 ) ) ( not ( = ?auto_9172 ?auto_9182 ) ) ( not ( = ?auto_9183 ?auto_9182 ) ) ( not ( = ?auto_9181 ?auto_9182 ) ) ( not ( = ?auto_9178 ?auto_9182 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9172 ?auto_9173 ?auto_9174 )
      ( MAKE-3CRATE-VERIFY ?auto_9171 ?auto_9172 ?auto_9173 ?auto_9174 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9186 - SURFACE
      ?auto_9187 - SURFACE
      ?auto_9188 - SURFACE
      ?auto_9189 - SURFACE
      ?auto_9190 - SURFACE
    )
    :vars
    (
      ?auto_9199 - HOIST
      ?auto_9192 - PLACE
      ?auto_9191 - PLACE
      ?auto_9195 - HOIST
      ?auto_9198 - SURFACE
      ?auto_9193 - PLACE
      ?auto_9196 - HOIST
      ?auto_9197 - SURFACE
      ?auto_9194 - SURFACE
      ?auto_9200 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9199 ?auto_9192 ) ( IS-CRATE ?auto_9190 ) ( not ( = ?auto_9189 ?auto_9190 ) ) ( not ( = ?auto_9188 ?auto_9189 ) ) ( not ( = ?auto_9188 ?auto_9190 ) ) ( not ( = ?auto_9191 ?auto_9192 ) ) ( HOIST-AT ?auto_9195 ?auto_9191 ) ( not ( = ?auto_9199 ?auto_9195 ) ) ( AVAILABLE ?auto_9195 ) ( SURFACE-AT ?auto_9190 ?auto_9191 ) ( ON ?auto_9190 ?auto_9198 ) ( CLEAR ?auto_9190 ) ( not ( = ?auto_9189 ?auto_9198 ) ) ( not ( = ?auto_9190 ?auto_9198 ) ) ( not ( = ?auto_9188 ?auto_9198 ) ) ( IS-CRATE ?auto_9189 ) ( not ( = ?auto_9193 ?auto_9192 ) ) ( not ( = ?auto_9191 ?auto_9193 ) ) ( HOIST-AT ?auto_9196 ?auto_9193 ) ( not ( = ?auto_9199 ?auto_9196 ) ) ( not ( = ?auto_9195 ?auto_9196 ) ) ( SURFACE-AT ?auto_9189 ?auto_9193 ) ( ON ?auto_9189 ?auto_9197 ) ( CLEAR ?auto_9189 ) ( not ( = ?auto_9189 ?auto_9197 ) ) ( not ( = ?auto_9190 ?auto_9197 ) ) ( not ( = ?auto_9188 ?auto_9197 ) ) ( not ( = ?auto_9198 ?auto_9197 ) ) ( IS-CRATE ?auto_9188 ) ( not ( = ?auto_9187 ?auto_9188 ) ) ( not ( = ?auto_9189 ?auto_9187 ) ) ( not ( = ?auto_9190 ?auto_9187 ) ) ( not ( = ?auto_9198 ?auto_9187 ) ) ( not ( = ?auto_9197 ?auto_9187 ) ) ( AVAILABLE ?auto_9196 ) ( SURFACE-AT ?auto_9188 ?auto_9193 ) ( ON ?auto_9188 ?auto_9194 ) ( CLEAR ?auto_9188 ) ( not ( = ?auto_9189 ?auto_9194 ) ) ( not ( = ?auto_9190 ?auto_9194 ) ) ( not ( = ?auto_9188 ?auto_9194 ) ) ( not ( = ?auto_9198 ?auto_9194 ) ) ( not ( = ?auto_9197 ?auto_9194 ) ) ( not ( = ?auto_9187 ?auto_9194 ) ) ( TRUCK-AT ?auto_9200 ?auto_9192 ) ( SURFACE-AT ?auto_9186 ?auto_9192 ) ( CLEAR ?auto_9186 ) ( LIFTING ?auto_9199 ?auto_9187 ) ( IS-CRATE ?auto_9187 ) ( not ( = ?auto_9186 ?auto_9187 ) ) ( not ( = ?auto_9189 ?auto_9186 ) ) ( not ( = ?auto_9190 ?auto_9186 ) ) ( not ( = ?auto_9188 ?auto_9186 ) ) ( not ( = ?auto_9198 ?auto_9186 ) ) ( not ( = ?auto_9197 ?auto_9186 ) ) ( not ( = ?auto_9194 ?auto_9186 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9188 ?auto_9189 ?auto_9190 )
      ( MAKE-4CRATE-VERIFY ?auto_9186 ?auto_9187 ?auto_9188 ?auto_9189 ?auto_9190 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9201 - SURFACE
      ?auto_9202 - SURFACE
    )
    :vars
    (
      ?auto_9214 - HOIST
      ?auto_9204 - PLACE
      ?auto_9208 - SURFACE
      ?auto_9203 - PLACE
      ?auto_9209 - HOIST
      ?auto_9213 - SURFACE
      ?auto_9205 - PLACE
      ?auto_9210 - HOIST
      ?auto_9211 - SURFACE
      ?auto_9206 - SURFACE
      ?auto_9207 - SURFACE
      ?auto_9215 - TRUCK
      ?auto_9212 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9214 ?auto_9204 ) ( IS-CRATE ?auto_9202 ) ( not ( = ?auto_9201 ?auto_9202 ) ) ( not ( = ?auto_9208 ?auto_9201 ) ) ( not ( = ?auto_9208 ?auto_9202 ) ) ( not ( = ?auto_9203 ?auto_9204 ) ) ( HOIST-AT ?auto_9209 ?auto_9203 ) ( not ( = ?auto_9214 ?auto_9209 ) ) ( AVAILABLE ?auto_9209 ) ( SURFACE-AT ?auto_9202 ?auto_9203 ) ( ON ?auto_9202 ?auto_9213 ) ( CLEAR ?auto_9202 ) ( not ( = ?auto_9201 ?auto_9213 ) ) ( not ( = ?auto_9202 ?auto_9213 ) ) ( not ( = ?auto_9208 ?auto_9213 ) ) ( IS-CRATE ?auto_9201 ) ( not ( = ?auto_9205 ?auto_9204 ) ) ( not ( = ?auto_9203 ?auto_9205 ) ) ( HOIST-AT ?auto_9210 ?auto_9205 ) ( not ( = ?auto_9214 ?auto_9210 ) ) ( not ( = ?auto_9209 ?auto_9210 ) ) ( SURFACE-AT ?auto_9201 ?auto_9205 ) ( ON ?auto_9201 ?auto_9211 ) ( CLEAR ?auto_9201 ) ( not ( = ?auto_9201 ?auto_9211 ) ) ( not ( = ?auto_9202 ?auto_9211 ) ) ( not ( = ?auto_9208 ?auto_9211 ) ) ( not ( = ?auto_9213 ?auto_9211 ) ) ( IS-CRATE ?auto_9208 ) ( not ( = ?auto_9206 ?auto_9208 ) ) ( not ( = ?auto_9201 ?auto_9206 ) ) ( not ( = ?auto_9202 ?auto_9206 ) ) ( not ( = ?auto_9213 ?auto_9206 ) ) ( not ( = ?auto_9211 ?auto_9206 ) ) ( AVAILABLE ?auto_9210 ) ( SURFACE-AT ?auto_9208 ?auto_9205 ) ( ON ?auto_9208 ?auto_9207 ) ( CLEAR ?auto_9208 ) ( not ( = ?auto_9201 ?auto_9207 ) ) ( not ( = ?auto_9202 ?auto_9207 ) ) ( not ( = ?auto_9208 ?auto_9207 ) ) ( not ( = ?auto_9213 ?auto_9207 ) ) ( not ( = ?auto_9211 ?auto_9207 ) ) ( not ( = ?auto_9206 ?auto_9207 ) ) ( TRUCK-AT ?auto_9215 ?auto_9204 ) ( SURFACE-AT ?auto_9212 ?auto_9204 ) ( CLEAR ?auto_9212 ) ( IS-CRATE ?auto_9206 ) ( not ( = ?auto_9212 ?auto_9206 ) ) ( not ( = ?auto_9201 ?auto_9212 ) ) ( not ( = ?auto_9202 ?auto_9212 ) ) ( not ( = ?auto_9208 ?auto_9212 ) ) ( not ( = ?auto_9213 ?auto_9212 ) ) ( not ( = ?auto_9211 ?auto_9212 ) ) ( not ( = ?auto_9207 ?auto_9212 ) ) ( AVAILABLE ?auto_9214 ) ( IN ?auto_9206 ?auto_9215 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9214 ?auto_9206 ?auto_9215 ?auto_9204 )
      ( MAKE-2CRATE ?auto_9208 ?auto_9201 ?auto_9202 )
      ( MAKE-1CRATE-VERIFY ?auto_9201 ?auto_9202 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9216 - SURFACE
      ?auto_9217 - SURFACE
      ?auto_9218 - SURFACE
    )
    :vars
    (
      ?auto_9230 - HOIST
      ?auto_9227 - PLACE
      ?auto_9222 - PLACE
      ?auto_9228 - HOIST
      ?auto_9225 - SURFACE
      ?auto_9224 - PLACE
      ?auto_9229 - HOIST
      ?auto_9220 - SURFACE
      ?auto_9226 - SURFACE
      ?auto_9223 - SURFACE
      ?auto_9219 - TRUCK
      ?auto_9221 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9230 ?auto_9227 ) ( IS-CRATE ?auto_9218 ) ( not ( = ?auto_9217 ?auto_9218 ) ) ( not ( = ?auto_9216 ?auto_9217 ) ) ( not ( = ?auto_9216 ?auto_9218 ) ) ( not ( = ?auto_9222 ?auto_9227 ) ) ( HOIST-AT ?auto_9228 ?auto_9222 ) ( not ( = ?auto_9230 ?auto_9228 ) ) ( AVAILABLE ?auto_9228 ) ( SURFACE-AT ?auto_9218 ?auto_9222 ) ( ON ?auto_9218 ?auto_9225 ) ( CLEAR ?auto_9218 ) ( not ( = ?auto_9217 ?auto_9225 ) ) ( not ( = ?auto_9218 ?auto_9225 ) ) ( not ( = ?auto_9216 ?auto_9225 ) ) ( IS-CRATE ?auto_9217 ) ( not ( = ?auto_9224 ?auto_9227 ) ) ( not ( = ?auto_9222 ?auto_9224 ) ) ( HOIST-AT ?auto_9229 ?auto_9224 ) ( not ( = ?auto_9230 ?auto_9229 ) ) ( not ( = ?auto_9228 ?auto_9229 ) ) ( SURFACE-AT ?auto_9217 ?auto_9224 ) ( ON ?auto_9217 ?auto_9220 ) ( CLEAR ?auto_9217 ) ( not ( = ?auto_9217 ?auto_9220 ) ) ( not ( = ?auto_9218 ?auto_9220 ) ) ( not ( = ?auto_9216 ?auto_9220 ) ) ( not ( = ?auto_9225 ?auto_9220 ) ) ( IS-CRATE ?auto_9216 ) ( not ( = ?auto_9226 ?auto_9216 ) ) ( not ( = ?auto_9217 ?auto_9226 ) ) ( not ( = ?auto_9218 ?auto_9226 ) ) ( not ( = ?auto_9225 ?auto_9226 ) ) ( not ( = ?auto_9220 ?auto_9226 ) ) ( AVAILABLE ?auto_9229 ) ( SURFACE-AT ?auto_9216 ?auto_9224 ) ( ON ?auto_9216 ?auto_9223 ) ( CLEAR ?auto_9216 ) ( not ( = ?auto_9217 ?auto_9223 ) ) ( not ( = ?auto_9218 ?auto_9223 ) ) ( not ( = ?auto_9216 ?auto_9223 ) ) ( not ( = ?auto_9225 ?auto_9223 ) ) ( not ( = ?auto_9220 ?auto_9223 ) ) ( not ( = ?auto_9226 ?auto_9223 ) ) ( TRUCK-AT ?auto_9219 ?auto_9227 ) ( SURFACE-AT ?auto_9221 ?auto_9227 ) ( CLEAR ?auto_9221 ) ( IS-CRATE ?auto_9226 ) ( not ( = ?auto_9221 ?auto_9226 ) ) ( not ( = ?auto_9217 ?auto_9221 ) ) ( not ( = ?auto_9218 ?auto_9221 ) ) ( not ( = ?auto_9216 ?auto_9221 ) ) ( not ( = ?auto_9225 ?auto_9221 ) ) ( not ( = ?auto_9220 ?auto_9221 ) ) ( not ( = ?auto_9223 ?auto_9221 ) ) ( AVAILABLE ?auto_9230 ) ( IN ?auto_9226 ?auto_9219 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9217 ?auto_9218 )
      ( MAKE-2CRATE-VERIFY ?auto_9216 ?auto_9217 ?auto_9218 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9231 - SURFACE
      ?auto_9232 - SURFACE
      ?auto_9233 - SURFACE
      ?auto_9234 - SURFACE
    )
    :vars
    (
      ?auto_9238 - HOIST
      ?auto_9242 - PLACE
      ?auto_9237 - PLACE
      ?auto_9241 - HOIST
      ?auto_9245 - SURFACE
      ?auto_9243 - PLACE
      ?auto_9240 - HOIST
      ?auto_9244 - SURFACE
      ?auto_9239 - SURFACE
      ?auto_9235 - TRUCK
      ?auto_9236 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9238 ?auto_9242 ) ( IS-CRATE ?auto_9234 ) ( not ( = ?auto_9233 ?auto_9234 ) ) ( not ( = ?auto_9232 ?auto_9233 ) ) ( not ( = ?auto_9232 ?auto_9234 ) ) ( not ( = ?auto_9237 ?auto_9242 ) ) ( HOIST-AT ?auto_9241 ?auto_9237 ) ( not ( = ?auto_9238 ?auto_9241 ) ) ( AVAILABLE ?auto_9241 ) ( SURFACE-AT ?auto_9234 ?auto_9237 ) ( ON ?auto_9234 ?auto_9245 ) ( CLEAR ?auto_9234 ) ( not ( = ?auto_9233 ?auto_9245 ) ) ( not ( = ?auto_9234 ?auto_9245 ) ) ( not ( = ?auto_9232 ?auto_9245 ) ) ( IS-CRATE ?auto_9233 ) ( not ( = ?auto_9243 ?auto_9242 ) ) ( not ( = ?auto_9237 ?auto_9243 ) ) ( HOIST-AT ?auto_9240 ?auto_9243 ) ( not ( = ?auto_9238 ?auto_9240 ) ) ( not ( = ?auto_9241 ?auto_9240 ) ) ( SURFACE-AT ?auto_9233 ?auto_9243 ) ( ON ?auto_9233 ?auto_9244 ) ( CLEAR ?auto_9233 ) ( not ( = ?auto_9233 ?auto_9244 ) ) ( not ( = ?auto_9234 ?auto_9244 ) ) ( not ( = ?auto_9232 ?auto_9244 ) ) ( not ( = ?auto_9245 ?auto_9244 ) ) ( IS-CRATE ?auto_9232 ) ( not ( = ?auto_9231 ?auto_9232 ) ) ( not ( = ?auto_9233 ?auto_9231 ) ) ( not ( = ?auto_9234 ?auto_9231 ) ) ( not ( = ?auto_9245 ?auto_9231 ) ) ( not ( = ?auto_9244 ?auto_9231 ) ) ( AVAILABLE ?auto_9240 ) ( SURFACE-AT ?auto_9232 ?auto_9243 ) ( ON ?auto_9232 ?auto_9239 ) ( CLEAR ?auto_9232 ) ( not ( = ?auto_9233 ?auto_9239 ) ) ( not ( = ?auto_9234 ?auto_9239 ) ) ( not ( = ?auto_9232 ?auto_9239 ) ) ( not ( = ?auto_9245 ?auto_9239 ) ) ( not ( = ?auto_9244 ?auto_9239 ) ) ( not ( = ?auto_9231 ?auto_9239 ) ) ( TRUCK-AT ?auto_9235 ?auto_9242 ) ( SURFACE-AT ?auto_9236 ?auto_9242 ) ( CLEAR ?auto_9236 ) ( IS-CRATE ?auto_9231 ) ( not ( = ?auto_9236 ?auto_9231 ) ) ( not ( = ?auto_9233 ?auto_9236 ) ) ( not ( = ?auto_9234 ?auto_9236 ) ) ( not ( = ?auto_9232 ?auto_9236 ) ) ( not ( = ?auto_9245 ?auto_9236 ) ) ( not ( = ?auto_9244 ?auto_9236 ) ) ( not ( = ?auto_9239 ?auto_9236 ) ) ( AVAILABLE ?auto_9238 ) ( IN ?auto_9231 ?auto_9235 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9232 ?auto_9233 ?auto_9234 )
      ( MAKE-3CRATE-VERIFY ?auto_9231 ?auto_9232 ?auto_9233 ?auto_9234 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9246 - SURFACE
      ?auto_9247 - SURFACE
      ?auto_9248 - SURFACE
      ?auto_9249 - SURFACE
      ?auto_9250 - SURFACE
    )
    :vars
    (
      ?auto_9253 - HOIST
      ?auto_9257 - PLACE
      ?auto_9252 - PLACE
      ?auto_9256 - HOIST
      ?auto_9260 - SURFACE
      ?auto_9258 - PLACE
      ?auto_9255 - HOIST
      ?auto_9259 - SURFACE
      ?auto_9254 - SURFACE
      ?auto_9251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9253 ?auto_9257 ) ( IS-CRATE ?auto_9250 ) ( not ( = ?auto_9249 ?auto_9250 ) ) ( not ( = ?auto_9248 ?auto_9249 ) ) ( not ( = ?auto_9248 ?auto_9250 ) ) ( not ( = ?auto_9252 ?auto_9257 ) ) ( HOIST-AT ?auto_9256 ?auto_9252 ) ( not ( = ?auto_9253 ?auto_9256 ) ) ( AVAILABLE ?auto_9256 ) ( SURFACE-AT ?auto_9250 ?auto_9252 ) ( ON ?auto_9250 ?auto_9260 ) ( CLEAR ?auto_9250 ) ( not ( = ?auto_9249 ?auto_9260 ) ) ( not ( = ?auto_9250 ?auto_9260 ) ) ( not ( = ?auto_9248 ?auto_9260 ) ) ( IS-CRATE ?auto_9249 ) ( not ( = ?auto_9258 ?auto_9257 ) ) ( not ( = ?auto_9252 ?auto_9258 ) ) ( HOIST-AT ?auto_9255 ?auto_9258 ) ( not ( = ?auto_9253 ?auto_9255 ) ) ( not ( = ?auto_9256 ?auto_9255 ) ) ( SURFACE-AT ?auto_9249 ?auto_9258 ) ( ON ?auto_9249 ?auto_9259 ) ( CLEAR ?auto_9249 ) ( not ( = ?auto_9249 ?auto_9259 ) ) ( not ( = ?auto_9250 ?auto_9259 ) ) ( not ( = ?auto_9248 ?auto_9259 ) ) ( not ( = ?auto_9260 ?auto_9259 ) ) ( IS-CRATE ?auto_9248 ) ( not ( = ?auto_9247 ?auto_9248 ) ) ( not ( = ?auto_9249 ?auto_9247 ) ) ( not ( = ?auto_9250 ?auto_9247 ) ) ( not ( = ?auto_9260 ?auto_9247 ) ) ( not ( = ?auto_9259 ?auto_9247 ) ) ( AVAILABLE ?auto_9255 ) ( SURFACE-AT ?auto_9248 ?auto_9258 ) ( ON ?auto_9248 ?auto_9254 ) ( CLEAR ?auto_9248 ) ( not ( = ?auto_9249 ?auto_9254 ) ) ( not ( = ?auto_9250 ?auto_9254 ) ) ( not ( = ?auto_9248 ?auto_9254 ) ) ( not ( = ?auto_9260 ?auto_9254 ) ) ( not ( = ?auto_9259 ?auto_9254 ) ) ( not ( = ?auto_9247 ?auto_9254 ) ) ( TRUCK-AT ?auto_9251 ?auto_9257 ) ( SURFACE-AT ?auto_9246 ?auto_9257 ) ( CLEAR ?auto_9246 ) ( IS-CRATE ?auto_9247 ) ( not ( = ?auto_9246 ?auto_9247 ) ) ( not ( = ?auto_9249 ?auto_9246 ) ) ( not ( = ?auto_9250 ?auto_9246 ) ) ( not ( = ?auto_9248 ?auto_9246 ) ) ( not ( = ?auto_9260 ?auto_9246 ) ) ( not ( = ?auto_9259 ?auto_9246 ) ) ( not ( = ?auto_9254 ?auto_9246 ) ) ( AVAILABLE ?auto_9253 ) ( IN ?auto_9247 ?auto_9251 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9248 ?auto_9249 ?auto_9250 )
      ( MAKE-4CRATE-VERIFY ?auto_9246 ?auto_9247 ?auto_9248 ?auto_9249 ?auto_9250 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9261 - SURFACE
      ?auto_9262 - SURFACE
    )
    :vars
    (
      ?auto_9267 - HOIST
      ?auto_9272 - PLACE
      ?auto_9268 - SURFACE
      ?auto_9266 - PLACE
      ?auto_9271 - HOIST
      ?auto_9275 - SURFACE
      ?auto_9273 - PLACE
      ?auto_9270 - HOIST
      ?auto_9274 - SURFACE
      ?auto_9264 - SURFACE
      ?auto_9269 - SURFACE
      ?auto_9265 - SURFACE
      ?auto_9263 - TRUCK
      ?auto_9276 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9267 ?auto_9272 ) ( IS-CRATE ?auto_9262 ) ( not ( = ?auto_9261 ?auto_9262 ) ) ( not ( = ?auto_9268 ?auto_9261 ) ) ( not ( = ?auto_9268 ?auto_9262 ) ) ( not ( = ?auto_9266 ?auto_9272 ) ) ( HOIST-AT ?auto_9271 ?auto_9266 ) ( not ( = ?auto_9267 ?auto_9271 ) ) ( AVAILABLE ?auto_9271 ) ( SURFACE-AT ?auto_9262 ?auto_9266 ) ( ON ?auto_9262 ?auto_9275 ) ( CLEAR ?auto_9262 ) ( not ( = ?auto_9261 ?auto_9275 ) ) ( not ( = ?auto_9262 ?auto_9275 ) ) ( not ( = ?auto_9268 ?auto_9275 ) ) ( IS-CRATE ?auto_9261 ) ( not ( = ?auto_9273 ?auto_9272 ) ) ( not ( = ?auto_9266 ?auto_9273 ) ) ( HOIST-AT ?auto_9270 ?auto_9273 ) ( not ( = ?auto_9267 ?auto_9270 ) ) ( not ( = ?auto_9271 ?auto_9270 ) ) ( SURFACE-AT ?auto_9261 ?auto_9273 ) ( ON ?auto_9261 ?auto_9274 ) ( CLEAR ?auto_9261 ) ( not ( = ?auto_9261 ?auto_9274 ) ) ( not ( = ?auto_9262 ?auto_9274 ) ) ( not ( = ?auto_9268 ?auto_9274 ) ) ( not ( = ?auto_9275 ?auto_9274 ) ) ( IS-CRATE ?auto_9268 ) ( not ( = ?auto_9264 ?auto_9268 ) ) ( not ( = ?auto_9261 ?auto_9264 ) ) ( not ( = ?auto_9262 ?auto_9264 ) ) ( not ( = ?auto_9275 ?auto_9264 ) ) ( not ( = ?auto_9274 ?auto_9264 ) ) ( AVAILABLE ?auto_9270 ) ( SURFACE-AT ?auto_9268 ?auto_9273 ) ( ON ?auto_9268 ?auto_9269 ) ( CLEAR ?auto_9268 ) ( not ( = ?auto_9261 ?auto_9269 ) ) ( not ( = ?auto_9262 ?auto_9269 ) ) ( not ( = ?auto_9268 ?auto_9269 ) ) ( not ( = ?auto_9275 ?auto_9269 ) ) ( not ( = ?auto_9274 ?auto_9269 ) ) ( not ( = ?auto_9264 ?auto_9269 ) ) ( SURFACE-AT ?auto_9265 ?auto_9272 ) ( CLEAR ?auto_9265 ) ( IS-CRATE ?auto_9264 ) ( not ( = ?auto_9265 ?auto_9264 ) ) ( not ( = ?auto_9261 ?auto_9265 ) ) ( not ( = ?auto_9262 ?auto_9265 ) ) ( not ( = ?auto_9268 ?auto_9265 ) ) ( not ( = ?auto_9275 ?auto_9265 ) ) ( not ( = ?auto_9274 ?auto_9265 ) ) ( not ( = ?auto_9269 ?auto_9265 ) ) ( AVAILABLE ?auto_9267 ) ( IN ?auto_9264 ?auto_9263 ) ( TRUCK-AT ?auto_9263 ?auto_9276 ) ( not ( = ?auto_9276 ?auto_9272 ) ) ( not ( = ?auto_9266 ?auto_9276 ) ) ( not ( = ?auto_9273 ?auto_9276 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9263 ?auto_9276 ?auto_9272 )
      ( MAKE-2CRATE ?auto_9268 ?auto_9261 ?auto_9262 )
      ( MAKE-1CRATE-VERIFY ?auto_9261 ?auto_9262 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9277 - SURFACE
      ?auto_9278 - SURFACE
      ?auto_9279 - SURFACE
    )
    :vars
    (
      ?auto_9289 - HOIST
      ?auto_9284 - PLACE
      ?auto_9291 - PLACE
      ?auto_9283 - HOIST
      ?auto_9288 - SURFACE
      ?auto_9286 - PLACE
      ?auto_9292 - HOIST
      ?auto_9280 - SURFACE
      ?auto_9290 - SURFACE
      ?auto_9282 - SURFACE
      ?auto_9281 - SURFACE
      ?auto_9287 - TRUCK
      ?auto_9285 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9289 ?auto_9284 ) ( IS-CRATE ?auto_9279 ) ( not ( = ?auto_9278 ?auto_9279 ) ) ( not ( = ?auto_9277 ?auto_9278 ) ) ( not ( = ?auto_9277 ?auto_9279 ) ) ( not ( = ?auto_9291 ?auto_9284 ) ) ( HOIST-AT ?auto_9283 ?auto_9291 ) ( not ( = ?auto_9289 ?auto_9283 ) ) ( AVAILABLE ?auto_9283 ) ( SURFACE-AT ?auto_9279 ?auto_9291 ) ( ON ?auto_9279 ?auto_9288 ) ( CLEAR ?auto_9279 ) ( not ( = ?auto_9278 ?auto_9288 ) ) ( not ( = ?auto_9279 ?auto_9288 ) ) ( not ( = ?auto_9277 ?auto_9288 ) ) ( IS-CRATE ?auto_9278 ) ( not ( = ?auto_9286 ?auto_9284 ) ) ( not ( = ?auto_9291 ?auto_9286 ) ) ( HOIST-AT ?auto_9292 ?auto_9286 ) ( not ( = ?auto_9289 ?auto_9292 ) ) ( not ( = ?auto_9283 ?auto_9292 ) ) ( SURFACE-AT ?auto_9278 ?auto_9286 ) ( ON ?auto_9278 ?auto_9280 ) ( CLEAR ?auto_9278 ) ( not ( = ?auto_9278 ?auto_9280 ) ) ( not ( = ?auto_9279 ?auto_9280 ) ) ( not ( = ?auto_9277 ?auto_9280 ) ) ( not ( = ?auto_9288 ?auto_9280 ) ) ( IS-CRATE ?auto_9277 ) ( not ( = ?auto_9290 ?auto_9277 ) ) ( not ( = ?auto_9278 ?auto_9290 ) ) ( not ( = ?auto_9279 ?auto_9290 ) ) ( not ( = ?auto_9288 ?auto_9290 ) ) ( not ( = ?auto_9280 ?auto_9290 ) ) ( AVAILABLE ?auto_9292 ) ( SURFACE-AT ?auto_9277 ?auto_9286 ) ( ON ?auto_9277 ?auto_9282 ) ( CLEAR ?auto_9277 ) ( not ( = ?auto_9278 ?auto_9282 ) ) ( not ( = ?auto_9279 ?auto_9282 ) ) ( not ( = ?auto_9277 ?auto_9282 ) ) ( not ( = ?auto_9288 ?auto_9282 ) ) ( not ( = ?auto_9280 ?auto_9282 ) ) ( not ( = ?auto_9290 ?auto_9282 ) ) ( SURFACE-AT ?auto_9281 ?auto_9284 ) ( CLEAR ?auto_9281 ) ( IS-CRATE ?auto_9290 ) ( not ( = ?auto_9281 ?auto_9290 ) ) ( not ( = ?auto_9278 ?auto_9281 ) ) ( not ( = ?auto_9279 ?auto_9281 ) ) ( not ( = ?auto_9277 ?auto_9281 ) ) ( not ( = ?auto_9288 ?auto_9281 ) ) ( not ( = ?auto_9280 ?auto_9281 ) ) ( not ( = ?auto_9282 ?auto_9281 ) ) ( AVAILABLE ?auto_9289 ) ( IN ?auto_9290 ?auto_9287 ) ( TRUCK-AT ?auto_9287 ?auto_9285 ) ( not ( = ?auto_9285 ?auto_9284 ) ) ( not ( = ?auto_9291 ?auto_9285 ) ) ( not ( = ?auto_9286 ?auto_9285 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9278 ?auto_9279 )
      ( MAKE-2CRATE-VERIFY ?auto_9277 ?auto_9278 ?auto_9279 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9293 - SURFACE
      ?auto_9294 - SURFACE
      ?auto_9295 - SURFACE
      ?auto_9296 - SURFACE
    )
    :vars
    (
      ?auto_9307 - HOIST
      ?auto_9301 - PLACE
      ?auto_9305 - PLACE
      ?auto_9306 - HOIST
      ?auto_9297 - SURFACE
      ?auto_9300 - PLACE
      ?auto_9299 - HOIST
      ?auto_9303 - SURFACE
      ?auto_9308 - SURFACE
      ?auto_9304 - SURFACE
      ?auto_9302 - TRUCK
      ?auto_9298 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9307 ?auto_9301 ) ( IS-CRATE ?auto_9296 ) ( not ( = ?auto_9295 ?auto_9296 ) ) ( not ( = ?auto_9294 ?auto_9295 ) ) ( not ( = ?auto_9294 ?auto_9296 ) ) ( not ( = ?auto_9305 ?auto_9301 ) ) ( HOIST-AT ?auto_9306 ?auto_9305 ) ( not ( = ?auto_9307 ?auto_9306 ) ) ( AVAILABLE ?auto_9306 ) ( SURFACE-AT ?auto_9296 ?auto_9305 ) ( ON ?auto_9296 ?auto_9297 ) ( CLEAR ?auto_9296 ) ( not ( = ?auto_9295 ?auto_9297 ) ) ( not ( = ?auto_9296 ?auto_9297 ) ) ( not ( = ?auto_9294 ?auto_9297 ) ) ( IS-CRATE ?auto_9295 ) ( not ( = ?auto_9300 ?auto_9301 ) ) ( not ( = ?auto_9305 ?auto_9300 ) ) ( HOIST-AT ?auto_9299 ?auto_9300 ) ( not ( = ?auto_9307 ?auto_9299 ) ) ( not ( = ?auto_9306 ?auto_9299 ) ) ( SURFACE-AT ?auto_9295 ?auto_9300 ) ( ON ?auto_9295 ?auto_9303 ) ( CLEAR ?auto_9295 ) ( not ( = ?auto_9295 ?auto_9303 ) ) ( not ( = ?auto_9296 ?auto_9303 ) ) ( not ( = ?auto_9294 ?auto_9303 ) ) ( not ( = ?auto_9297 ?auto_9303 ) ) ( IS-CRATE ?auto_9294 ) ( not ( = ?auto_9293 ?auto_9294 ) ) ( not ( = ?auto_9295 ?auto_9293 ) ) ( not ( = ?auto_9296 ?auto_9293 ) ) ( not ( = ?auto_9297 ?auto_9293 ) ) ( not ( = ?auto_9303 ?auto_9293 ) ) ( AVAILABLE ?auto_9299 ) ( SURFACE-AT ?auto_9294 ?auto_9300 ) ( ON ?auto_9294 ?auto_9308 ) ( CLEAR ?auto_9294 ) ( not ( = ?auto_9295 ?auto_9308 ) ) ( not ( = ?auto_9296 ?auto_9308 ) ) ( not ( = ?auto_9294 ?auto_9308 ) ) ( not ( = ?auto_9297 ?auto_9308 ) ) ( not ( = ?auto_9303 ?auto_9308 ) ) ( not ( = ?auto_9293 ?auto_9308 ) ) ( SURFACE-AT ?auto_9304 ?auto_9301 ) ( CLEAR ?auto_9304 ) ( IS-CRATE ?auto_9293 ) ( not ( = ?auto_9304 ?auto_9293 ) ) ( not ( = ?auto_9295 ?auto_9304 ) ) ( not ( = ?auto_9296 ?auto_9304 ) ) ( not ( = ?auto_9294 ?auto_9304 ) ) ( not ( = ?auto_9297 ?auto_9304 ) ) ( not ( = ?auto_9303 ?auto_9304 ) ) ( not ( = ?auto_9308 ?auto_9304 ) ) ( AVAILABLE ?auto_9307 ) ( IN ?auto_9293 ?auto_9302 ) ( TRUCK-AT ?auto_9302 ?auto_9298 ) ( not ( = ?auto_9298 ?auto_9301 ) ) ( not ( = ?auto_9305 ?auto_9298 ) ) ( not ( = ?auto_9300 ?auto_9298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9294 ?auto_9295 ?auto_9296 )
      ( MAKE-3CRATE-VERIFY ?auto_9293 ?auto_9294 ?auto_9295 ?auto_9296 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9309 - SURFACE
      ?auto_9310 - SURFACE
      ?auto_9311 - SURFACE
      ?auto_9312 - SURFACE
      ?auto_9313 - SURFACE
    )
    :vars
    (
      ?auto_9323 - HOIST
      ?auto_9318 - PLACE
      ?auto_9321 - PLACE
      ?auto_9322 - HOIST
      ?auto_9314 - SURFACE
      ?auto_9317 - PLACE
      ?auto_9316 - HOIST
      ?auto_9320 - SURFACE
      ?auto_9324 - SURFACE
      ?auto_9319 - TRUCK
      ?auto_9315 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9323 ?auto_9318 ) ( IS-CRATE ?auto_9313 ) ( not ( = ?auto_9312 ?auto_9313 ) ) ( not ( = ?auto_9311 ?auto_9312 ) ) ( not ( = ?auto_9311 ?auto_9313 ) ) ( not ( = ?auto_9321 ?auto_9318 ) ) ( HOIST-AT ?auto_9322 ?auto_9321 ) ( not ( = ?auto_9323 ?auto_9322 ) ) ( AVAILABLE ?auto_9322 ) ( SURFACE-AT ?auto_9313 ?auto_9321 ) ( ON ?auto_9313 ?auto_9314 ) ( CLEAR ?auto_9313 ) ( not ( = ?auto_9312 ?auto_9314 ) ) ( not ( = ?auto_9313 ?auto_9314 ) ) ( not ( = ?auto_9311 ?auto_9314 ) ) ( IS-CRATE ?auto_9312 ) ( not ( = ?auto_9317 ?auto_9318 ) ) ( not ( = ?auto_9321 ?auto_9317 ) ) ( HOIST-AT ?auto_9316 ?auto_9317 ) ( not ( = ?auto_9323 ?auto_9316 ) ) ( not ( = ?auto_9322 ?auto_9316 ) ) ( SURFACE-AT ?auto_9312 ?auto_9317 ) ( ON ?auto_9312 ?auto_9320 ) ( CLEAR ?auto_9312 ) ( not ( = ?auto_9312 ?auto_9320 ) ) ( not ( = ?auto_9313 ?auto_9320 ) ) ( not ( = ?auto_9311 ?auto_9320 ) ) ( not ( = ?auto_9314 ?auto_9320 ) ) ( IS-CRATE ?auto_9311 ) ( not ( = ?auto_9310 ?auto_9311 ) ) ( not ( = ?auto_9312 ?auto_9310 ) ) ( not ( = ?auto_9313 ?auto_9310 ) ) ( not ( = ?auto_9314 ?auto_9310 ) ) ( not ( = ?auto_9320 ?auto_9310 ) ) ( AVAILABLE ?auto_9316 ) ( SURFACE-AT ?auto_9311 ?auto_9317 ) ( ON ?auto_9311 ?auto_9324 ) ( CLEAR ?auto_9311 ) ( not ( = ?auto_9312 ?auto_9324 ) ) ( not ( = ?auto_9313 ?auto_9324 ) ) ( not ( = ?auto_9311 ?auto_9324 ) ) ( not ( = ?auto_9314 ?auto_9324 ) ) ( not ( = ?auto_9320 ?auto_9324 ) ) ( not ( = ?auto_9310 ?auto_9324 ) ) ( SURFACE-AT ?auto_9309 ?auto_9318 ) ( CLEAR ?auto_9309 ) ( IS-CRATE ?auto_9310 ) ( not ( = ?auto_9309 ?auto_9310 ) ) ( not ( = ?auto_9312 ?auto_9309 ) ) ( not ( = ?auto_9313 ?auto_9309 ) ) ( not ( = ?auto_9311 ?auto_9309 ) ) ( not ( = ?auto_9314 ?auto_9309 ) ) ( not ( = ?auto_9320 ?auto_9309 ) ) ( not ( = ?auto_9324 ?auto_9309 ) ) ( AVAILABLE ?auto_9323 ) ( IN ?auto_9310 ?auto_9319 ) ( TRUCK-AT ?auto_9319 ?auto_9315 ) ( not ( = ?auto_9315 ?auto_9318 ) ) ( not ( = ?auto_9321 ?auto_9315 ) ) ( not ( = ?auto_9317 ?auto_9315 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9311 ?auto_9312 ?auto_9313 )
      ( MAKE-4CRATE-VERIFY ?auto_9309 ?auto_9310 ?auto_9311 ?auto_9312 ?auto_9313 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9325 - SURFACE
      ?auto_9326 - SURFACE
    )
    :vars
    (
      ?auto_9339 - HOIST
      ?auto_9332 - PLACE
      ?auto_9335 - SURFACE
      ?auto_9337 - PLACE
      ?auto_9338 - HOIST
      ?auto_9327 - SURFACE
      ?auto_9331 - PLACE
      ?auto_9330 - HOIST
      ?auto_9334 - SURFACE
      ?auto_9329 - SURFACE
      ?auto_9340 - SURFACE
      ?auto_9336 - SURFACE
      ?auto_9333 - TRUCK
      ?auto_9328 - PLACE
      ?auto_9341 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9339 ?auto_9332 ) ( IS-CRATE ?auto_9326 ) ( not ( = ?auto_9325 ?auto_9326 ) ) ( not ( = ?auto_9335 ?auto_9325 ) ) ( not ( = ?auto_9335 ?auto_9326 ) ) ( not ( = ?auto_9337 ?auto_9332 ) ) ( HOIST-AT ?auto_9338 ?auto_9337 ) ( not ( = ?auto_9339 ?auto_9338 ) ) ( AVAILABLE ?auto_9338 ) ( SURFACE-AT ?auto_9326 ?auto_9337 ) ( ON ?auto_9326 ?auto_9327 ) ( CLEAR ?auto_9326 ) ( not ( = ?auto_9325 ?auto_9327 ) ) ( not ( = ?auto_9326 ?auto_9327 ) ) ( not ( = ?auto_9335 ?auto_9327 ) ) ( IS-CRATE ?auto_9325 ) ( not ( = ?auto_9331 ?auto_9332 ) ) ( not ( = ?auto_9337 ?auto_9331 ) ) ( HOIST-AT ?auto_9330 ?auto_9331 ) ( not ( = ?auto_9339 ?auto_9330 ) ) ( not ( = ?auto_9338 ?auto_9330 ) ) ( SURFACE-AT ?auto_9325 ?auto_9331 ) ( ON ?auto_9325 ?auto_9334 ) ( CLEAR ?auto_9325 ) ( not ( = ?auto_9325 ?auto_9334 ) ) ( not ( = ?auto_9326 ?auto_9334 ) ) ( not ( = ?auto_9335 ?auto_9334 ) ) ( not ( = ?auto_9327 ?auto_9334 ) ) ( IS-CRATE ?auto_9335 ) ( not ( = ?auto_9329 ?auto_9335 ) ) ( not ( = ?auto_9325 ?auto_9329 ) ) ( not ( = ?auto_9326 ?auto_9329 ) ) ( not ( = ?auto_9327 ?auto_9329 ) ) ( not ( = ?auto_9334 ?auto_9329 ) ) ( AVAILABLE ?auto_9330 ) ( SURFACE-AT ?auto_9335 ?auto_9331 ) ( ON ?auto_9335 ?auto_9340 ) ( CLEAR ?auto_9335 ) ( not ( = ?auto_9325 ?auto_9340 ) ) ( not ( = ?auto_9326 ?auto_9340 ) ) ( not ( = ?auto_9335 ?auto_9340 ) ) ( not ( = ?auto_9327 ?auto_9340 ) ) ( not ( = ?auto_9334 ?auto_9340 ) ) ( not ( = ?auto_9329 ?auto_9340 ) ) ( SURFACE-AT ?auto_9336 ?auto_9332 ) ( CLEAR ?auto_9336 ) ( IS-CRATE ?auto_9329 ) ( not ( = ?auto_9336 ?auto_9329 ) ) ( not ( = ?auto_9325 ?auto_9336 ) ) ( not ( = ?auto_9326 ?auto_9336 ) ) ( not ( = ?auto_9335 ?auto_9336 ) ) ( not ( = ?auto_9327 ?auto_9336 ) ) ( not ( = ?auto_9334 ?auto_9336 ) ) ( not ( = ?auto_9340 ?auto_9336 ) ) ( AVAILABLE ?auto_9339 ) ( TRUCK-AT ?auto_9333 ?auto_9328 ) ( not ( = ?auto_9328 ?auto_9332 ) ) ( not ( = ?auto_9337 ?auto_9328 ) ) ( not ( = ?auto_9331 ?auto_9328 ) ) ( HOIST-AT ?auto_9341 ?auto_9328 ) ( LIFTING ?auto_9341 ?auto_9329 ) ( not ( = ?auto_9339 ?auto_9341 ) ) ( not ( = ?auto_9338 ?auto_9341 ) ) ( not ( = ?auto_9330 ?auto_9341 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9341 ?auto_9329 ?auto_9333 ?auto_9328 )
      ( MAKE-2CRATE ?auto_9335 ?auto_9325 ?auto_9326 )
      ( MAKE-1CRATE-VERIFY ?auto_9325 ?auto_9326 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9342 - SURFACE
      ?auto_9343 - SURFACE
      ?auto_9344 - SURFACE
    )
    :vars
    (
      ?auto_9349 - HOIST
      ?auto_9346 - PLACE
      ?auto_9350 - PLACE
      ?auto_9351 - HOIST
      ?auto_9348 - SURFACE
      ?auto_9353 - PLACE
      ?auto_9345 - HOIST
      ?auto_9347 - SURFACE
      ?auto_9356 - SURFACE
      ?auto_9352 - SURFACE
      ?auto_9354 - SURFACE
      ?auto_9355 - TRUCK
      ?auto_9358 - PLACE
      ?auto_9357 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9349 ?auto_9346 ) ( IS-CRATE ?auto_9344 ) ( not ( = ?auto_9343 ?auto_9344 ) ) ( not ( = ?auto_9342 ?auto_9343 ) ) ( not ( = ?auto_9342 ?auto_9344 ) ) ( not ( = ?auto_9350 ?auto_9346 ) ) ( HOIST-AT ?auto_9351 ?auto_9350 ) ( not ( = ?auto_9349 ?auto_9351 ) ) ( AVAILABLE ?auto_9351 ) ( SURFACE-AT ?auto_9344 ?auto_9350 ) ( ON ?auto_9344 ?auto_9348 ) ( CLEAR ?auto_9344 ) ( not ( = ?auto_9343 ?auto_9348 ) ) ( not ( = ?auto_9344 ?auto_9348 ) ) ( not ( = ?auto_9342 ?auto_9348 ) ) ( IS-CRATE ?auto_9343 ) ( not ( = ?auto_9353 ?auto_9346 ) ) ( not ( = ?auto_9350 ?auto_9353 ) ) ( HOIST-AT ?auto_9345 ?auto_9353 ) ( not ( = ?auto_9349 ?auto_9345 ) ) ( not ( = ?auto_9351 ?auto_9345 ) ) ( SURFACE-AT ?auto_9343 ?auto_9353 ) ( ON ?auto_9343 ?auto_9347 ) ( CLEAR ?auto_9343 ) ( not ( = ?auto_9343 ?auto_9347 ) ) ( not ( = ?auto_9344 ?auto_9347 ) ) ( not ( = ?auto_9342 ?auto_9347 ) ) ( not ( = ?auto_9348 ?auto_9347 ) ) ( IS-CRATE ?auto_9342 ) ( not ( = ?auto_9356 ?auto_9342 ) ) ( not ( = ?auto_9343 ?auto_9356 ) ) ( not ( = ?auto_9344 ?auto_9356 ) ) ( not ( = ?auto_9348 ?auto_9356 ) ) ( not ( = ?auto_9347 ?auto_9356 ) ) ( AVAILABLE ?auto_9345 ) ( SURFACE-AT ?auto_9342 ?auto_9353 ) ( ON ?auto_9342 ?auto_9352 ) ( CLEAR ?auto_9342 ) ( not ( = ?auto_9343 ?auto_9352 ) ) ( not ( = ?auto_9344 ?auto_9352 ) ) ( not ( = ?auto_9342 ?auto_9352 ) ) ( not ( = ?auto_9348 ?auto_9352 ) ) ( not ( = ?auto_9347 ?auto_9352 ) ) ( not ( = ?auto_9356 ?auto_9352 ) ) ( SURFACE-AT ?auto_9354 ?auto_9346 ) ( CLEAR ?auto_9354 ) ( IS-CRATE ?auto_9356 ) ( not ( = ?auto_9354 ?auto_9356 ) ) ( not ( = ?auto_9343 ?auto_9354 ) ) ( not ( = ?auto_9344 ?auto_9354 ) ) ( not ( = ?auto_9342 ?auto_9354 ) ) ( not ( = ?auto_9348 ?auto_9354 ) ) ( not ( = ?auto_9347 ?auto_9354 ) ) ( not ( = ?auto_9352 ?auto_9354 ) ) ( AVAILABLE ?auto_9349 ) ( TRUCK-AT ?auto_9355 ?auto_9358 ) ( not ( = ?auto_9358 ?auto_9346 ) ) ( not ( = ?auto_9350 ?auto_9358 ) ) ( not ( = ?auto_9353 ?auto_9358 ) ) ( HOIST-AT ?auto_9357 ?auto_9358 ) ( LIFTING ?auto_9357 ?auto_9356 ) ( not ( = ?auto_9349 ?auto_9357 ) ) ( not ( = ?auto_9351 ?auto_9357 ) ) ( not ( = ?auto_9345 ?auto_9357 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9343 ?auto_9344 )
      ( MAKE-2CRATE-VERIFY ?auto_9342 ?auto_9343 ?auto_9344 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9359 - SURFACE
      ?auto_9360 - SURFACE
      ?auto_9361 - SURFACE
      ?auto_9362 - SURFACE
    )
    :vars
    (
      ?auto_9365 - HOIST
      ?auto_9366 - PLACE
      ?auto_9364 - PLACE
      ?auto_9367 - HOIST
      ?auto_9374 - SURFACE
      ?auto_9370 - PLACE
      ?auto_9363 - HOIST
      ?auto_9375 - SURFACE
      ?auto_9371 - SURFACE
      ?auto_9369 - SURFACE
      ?auto_9372 - TRUCK
      ?auto_9373 - PLACE
      ?auto_9368 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9365 ?auto_9366 ) ( IS-CRATE ?auto_9362 ) ( not ( = ?auto_9361 ?auto_9362 ) ) ( not ( = ?auto_9360 ?auto_9361 ) ) ( not ( = ?auto_9360 ?auto_9362 ) ) ( not ( = ?auto_9364 ?auto_9366 ) ) ( HOIST-AT ?auto_9367 ?auto_9364 ) ( not ( = ?auto_9365 ?auto_9367 ) ) ( AVAILABLE ?auto_9367 ) ( SURFACE-AT ?auto_9362 ?auto_9364 ) ( ON ?auto_9362 ?auto_9374 ) ( CLEAR ?auto_9362 ) ( not ( = ?auto_9361 ?auto_9374 ) ) ( not ( = ?auto_9362 ?auto_9374 ) ) ( not ( = ?auto_9360 ?auto_9374 ) ) ( IS-CRATE ?auto_9361 ) ( not ( = ?auto_9370 ?auto_9366 ) ) ( not ( = ?auto_9364 ?auto_9370 ) ) ( HOIST-AT ?auto_9363 ?auto_9370 ) ( not ( = ?auto_9365 ?auto_9363 ) ) ( not ( = ?auto_9367 ?auto_9363 ) ) ( SURFACE-AT ?auto_9361 ?auto_9370 ) ( ON ?auto_9361 ?auto_9375 ) ( CLEAR ?auto_9361 ) ( not ( = ?auto_9361 ?auto_9375 ) ) ( not ( = ?auto_9362 ?auto_9375 ) ) ( not ( = ?auto_9360 ?auto_9375 ) ) ( not ( = ?auto_9374 ?auto_9375 ) ) ( IS-CRATE ?auto_9360 ) ( not ( = ?auto_9359 ?auto_9360 ) ) ( not ( = ?auto_9361 ?auto_9359 ) ) ( not ( = ?auto_9362 ?auto_9359 ) ) ( not ( = ?auto_9374 ?auto_9359 ) ) ( not ( = ?auto_9375 ?auto_9359 ) ) ( AVAILABLE ?auto_9363 ) ( SURFACE-AT ?auto_9360 ?auto_9370 ) ( ON ?auto_9360 ?auto_9371 ) ( CLEAR ?auto_9360 ) ( not ( = ?auto_9361 ?auto_9371 ) ) ( not ( = ?auto_9362 ?auto_9371 ) ) ( not ( = ?auto_9360 ?auto_9371 ) ) ( not ( = ?auto_9374 ?auto_9371 ) ) ( not ( = ?auto_9375 ?auto_9371 ) ) ( not ( = ?auto_9359 ?auto_9371 ) ) ( SURFACE-AT ?auto_9369 ?auto_9366 ) ( CLEAR ?auto_9369 ) ( IS-CRATE ?auto_9359 ) ( not ( = ?auto_9369 ?auto_9359 ) ) ( not ( = ?auto_9361 ?auto_9369 ) ) ( not ( = ?auto_9362 ?auto_9369 ) ) ( not ( = ?auto_9360 ?auto_9369 ) ) ( not ( = ?auto_9374 ?auto_9369 ) ) ( not ( = ?auto_9375 ?auto_9369 ) ) ( not ( = ?auto_9371 ?auto_9369 ) ) ( AVAILABLE ?auto_9365 ) ( TRUCK-AT ?auto_9372 ?auto_9373 ) ( not ( = ?auto_9373 ?auto_9366 ) ) ( not ( = ?auto_9364 ?auto_9373 ) ) ( not ( = ?auto_9370 ?auto_9373 ) ) ( HOIST-AT ?auto_9368 ?auto_9373 ) ( LIFTING ?auto_9368 ?auto_9359 ) ( not ( = ?auto_9365 ?auto_9368 ) ) ( not ( = ?auto_9367 ?auto_9368 ) ) ( not ( = ?auto_9363 ?auto_9368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9360 ?auto_9361 ?auto_9362 )
      ( MAKE-3CRATE-VERIFY ?auto_9359 ?auto_9360 ?auto_9361 ?auto_9362 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9376 - SURFACE
      ?auto_9377 - SURFACE
      ?auto_9378 - SURFACE
      ?auto_9379 - SURFACE
      ?auto_9380 - SURFACE
    )
    :vars
    (
      ?auto_9383 - HOIST
      ?auto_9384 - PLACE
      ?auto_9382 - PLACE
      ?auto_9385 - HOIST
      ?auto_9391 - SURFACE
      ?auto_9387 - PLACE
      ?auto_9381 - HOIST
      ?auto_9392 - SURFACE
      ?auto_9388 - SURFACE
      ?auto_9389 - TRUCK
      ?auto_9390 - PLACE
      ?auto_9386 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9383 ?auto_9384 ) ( IS-CRATE ?auto_9380 ) ( not ( = ?auto_9379 ?auto_9380 ) ) ( not ( = ?auto_9378 ?auto_9379 ) ) ( not ( = ?auto_9378 ?auto_9380 ) ) ( not ( = ?auto_9382 ?auto_9384 ) ) ( HOIST-AT ?auto_9385 ?auto_9382 ) ( not ( = ?auto_9383 ?auto_9385 ) ) ( AVAILABLE ?auto_9385 ) ( SURFACE-AT ?auto_9380 ?auto_9382 ) ( ON ?auto_9380 ?auto_9391 ) ( CLEAR ?auto_9380 ) ( not ( = ?auto_9379 ?auto_9391 ) ) ( not ( = ?auto_9380 ?auto_9391 ) ) ( not ( = ?auto_9378 ?auto_9391 ) ) ( IS-CRATE ?auto_9379 ) ( not ( = ?auto_9387 ?auto_9384 ) ) ( not ( = ?auto_9382 ?auto_9387 ) ) ( HOIST-AT ?auto_9381 ?auto_9387 ) ( not ( = ?auto_9383 ?auto_9381 ) ) ( not ( = ?auto_9385 ?auto_9381 ) ) ( SURFACE-AT ?auto_9379 ?auto_9387 ) ( ON ?auto_9379 ?auto_9392 ) ( CLEAR ?auto_9379 ) ( not ( = ?auto_9379 ?auto_9392 ) ) ( not ( = ?auto_9380 ?auto_9392 ) ) ( not ( = ?auto_9378 ?auto_9392 ) ) ( not ( = ?auto_9391 ?auto_9392 ) ) ( IS-CRATE ?auto_9378 ) ( not ( = ?auto_9377 ?auto_9378 ) ) ( not ( = ?auto_9379 ?auto_9377 ) ) ( not ( = ?auto_9380 ?auto_9377 ) ) ( not ( = ?auto_9391 ?auto_9377 ) ) ( not ( = ?auto_9392 ?auto_9377 ) ) ( AVAILABLE ?auto_9381 ) ( SURFACE-AT ?auto_9378 ?auto_9387 ) ( ON ?auto_9378 ?auto_9388 ) ( CLEAR ?auto_9378 ) ( not ( = ?auto_9379 ?auto_9388 ) ) ( not ( = ?auto_9380 ?auto_9388 ) ) ( not ( = ?auto_9378 ?auto_9388 ) ) ( not ( = ?auto_9391 ?auto_9388 ) ) ( not ( = ?auto_9392 ?auto_9388 ) ) ( not ( = ?auto_9377 ?auto_9388 ) ) ( SURFACE-AT ?auto_9376 ?auto_9384 ) ( CLEAR ?auto_9376 ) ( IS-CRATE ?auto_9377 ) ( not ( = ?auto_9376 ?auto_9377 ) ) ( not ( = ?auto_9379 ?auto_9376 ) ) ( not ( = ?auto_9380 ?auto_9376 ) ) ( not ( = ?auto_9378 ?auto_9376 ) ) ( not ( = ?auto_9391 ?auto_9376 ) ) ( not ( = ?auto_9392 ?auto_9376 ) ) ( not ( = ?auto_9388 ?auto_9376 ) ) ( AVAILABLE ?auto_9383 ) ( TRUCK-AT ?auto_9389 ?auto_9390 ) ( not ( = ?auto_9390 ?auto_9384 ) ) ( not ( = ?auto_9382 ?auto_9390 ) ) ( not ( = ?auto_9387 ?auto_9390 ) ) ( HOIST-AT ?auto_9386 ?auto_9390 ) ( LIFTING ?auto_9386 ?auto_9377 ) ( not ( = ?auto_9383 ?auto_9386 ) ) ( not ( = ?auto_9385 ?auto_9386 ) ) ( not ( = ?auto_9381 ?auto_9386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9378 ?auto_9379 ?auto_9380 )
      ( MAKE-4CRATE-VERIFY ?auto_9376 ?auto_9377 ?auto_9378 ?auto_9379 ?auto_9380 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9393 - SURFACE
      ?auto_9394 - SURFACE
    )
    :vars
    (
      ?auto_9398 - HOIST
      ?auto_9399 - PLACE
      ?auto_9395 - SURFACE
      ?auto_9397 - PLACE
      ?auto_9400 - HOIST
      ?auto_9407 - SURFACE
      ?auto_9403 - PLACE
      ?auto_9396 - HOIST
      ?auto_9408 - SURFACE
      ?auto_9409 - SURFACE
      ?auto_9404 - SURFACE
      ?auto_9402 - SURFACE
      ?auto_9405 - TRUCK
      ?auto_9406 - PLACE
      ?auto_9401 - HOIST
      ?auto_9410 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9398 ?auto_9399 ) ( IS-CRATE ?auto_9394 ) ( not ( = ?auto_9393 ?auto_9394 ) ) ( not ( = ?auto_9395 ?auto_9393 ) ) ( not ( = ?auto_9395 ?auto_9394 ) ) ( not ( = ?auto_9397 ?auto_9399 ) ) ( HOIST-AT ?auto_9400 ?auto_9397 ) ( not ( = ?auto_9398 ?auto_9400 ) ) ( AVAILABLE ?auto_9400 ) ( SURFACE-AT ?auto_9394 ?auto_9397 ) ( ON ?auto_9394 ?auto_9407 ) ( CLEAR ?auto_9394 ) ( not ( = ?auto_9393 ?auto_9407 ) ) ( not ( = ?auto_9394 ?auto_9407 ) ) ( not ( = ?auto_9395 ?auto_9407 ) ) ( IS-CRATE ?auto_9393 ) ( not ( = ?auto_9403 ?auto_9399 ) ) ( not ( = ?auto_9397 ?auto_9403 ) ) ( HOIST-AT ?auto_9396 ?auto_9403 ) ( not ( = ?auto_9398 ?auto_9396 ) ) ( not ( = ?auto_9400 ?auto_9396 ) ) ( SURFACE-AT ?auto_9393 ?auto_9403 ) ( ON ?auto_9393 ?auto_9408 ) ( CLEAR ?auto_9393 ) ( not ( = ?auto_9393 ?auto_9408 ) ) ( not ( = ?auto_9394 ?auto_9408 ) ) ( not ( = ?auto_9395 ?auto_9408 ) ) ( not ( = ?auto_9407 ?auto_9408 ) ) ( IS-CRATE ?auto_9395 ) ( not ( = ?auto_9409 ?auto_9395 ) ) ( not ( = ?auto_9393 ?auto_9409 ) ) ( not ( = ?auto_9394 ?auto_9409 ) ) ( not ( = ?auto_9407 ?auto_9409 ) ) ( not ( = ?auto_9408 ?auto_9409 ) ) ( AVAILABLE ?auto_9396 ) ( SURFACE-AT ?auto_9395 ?auto_9403 ) ( ON ?auto_9395 ?auto_9404 ) ( CLEAR ?auto_9395 ) ( not ( = ?auto_9393 ?auto_9404 ) ) ( not ( = ?auto_9394 ?auto_9404 ) ) ( not ( = ?auto_9395 ?auto_9404 ) ) ( not ( = ?auto_9407 ?auto_9404 ) ) ( not ( = ?auto_9408 ?auto_9404 ) ) ( not ( = ?auto_9409 ?auto_9404 ) ) ( SURFACE-AT ?auto_9402 ?auto_9399 ) ( CLEAR ?auto_9402 ) ( IS-CRATE ?auto_9409 ) ( not ( = ?auto_9402 ?auto_9409 ) ) ( not ( = ?auto_9393 ?auto_9402 ) ) ( not ( = ?auto_9394 ?auto_9402 ) ) ( not ( = ?auto_9395 ?auto_9402 ) ) ( not ( = ?auto_9407 ?auto_9402 ) ) ( not ( = ?auto_9408 ?auto_9402 ) ) ( not ( = ?auto_9404 ?auto_9402 ) ) ( AVAILABLE ?auto_9398 ) ( TRUCK-AT ?auto_9405 ?auto_9406 ) ( not ( = ?auto_9406 ?auto_9399 ) ) ( not ( = ?auto_9397 ?auto_9406 ) ) ( not ( = ?auto_9403 ?auto_9406 ) ) ( HOIST-AT ?auto_9401 ?auto_9406 ) ( not ( = ?auto_9398 ?auto_9401 ) ) ( not ( = ?auto_9400 ?auto_9401 ) ) ( not ( = ?auto_9396 ?auto_9401 ) ) ( AVAILABLE ?auto_9401 ) ( SURFACE-AT ?auto_9409 ?auto_9406 ) ( ON ?auto_9409 ?auto_9410 ) ( CLEAR ?auto_9409 ) ( not ( = ?auto_9393 ?auto_9410 ) ) ( not ( = ?auto_9394 ?auto_9410 ) ) ( not ( = ?auto_9395 ?auto_9410 ) ) ( not ( = ?auto_9407 ?auto_9410 ) ) ( not ( = ?auto_9408 ?auto_9410 ) ) ( not ( = ?auto_9409 ?auto_9410 ) ) ( not ( = ?auto_9404 ?auto_9410 ) ) ( not ( = ?auto_9402 ?auto_9410 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9401 ?auto_9409 ?auto_9410 ?auto_9406 )
      ( MAKE-2CRATE ?auto_9395 ?auto_9393 ?auto_9394 )
      ( MAKE-1CRATE-VERIFY ?auto_9393 ?auto_9394 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9411 - SURFACE
      ?auto_9412 - SURFACE
      ?auto_9413 - SURFACE
    )
    :vars
    (
      ?auto_9415 - HOIST
      ?auto_9418 - PLACE
      ?auto_9422 - PLACE
      ?auto_9421 - HOIST
      ?auto_9419 - SURFACE
      ?auto_9428 - PLACE
      ?auto_9426 - HOIST
      ?auto_9425 - SURFACE
      ?auto_9416 - SURFACE
      ?auto_9427 - SURFACE
      ?auto_9424 - SURFACE
      ?auto_9417 - TRUCK
      ?auto_9423 - PLACE
      ?auto_9414 - HOIST
      ?auto_9420 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9415 ?auto_9418 ) ( IS-CRATE ?auto_9413 ) ( not ( = ?auto_9412 ?auto_9413 ) ) ( not ( = ?auto_9411 ?auto_9412 ) ) ( not ( = ?auto_9411 ?auto_9413 ) ) ( not ( = ?auto_9422 ?auto_9418 ) ) ( HOIST-AT ?auto_9421 ?auto_9422 ) ( not ( = ?auto_9415 ?auto_9421 ) ) ( AVAILABLE ?auto_9421 ) ( SURFACE-AT ?auto_9413 ?auto_9422 ) ( ON ?auto_9413 ?auto_9419 ) ( CLEAR ?auto_9413 ) ( not ( = ?auto_9412 ?auto_9419 ) ) ( not ( = ?auto_9413 ?auto_9419 ) ) ( not ( = ?auto_9411 ?auto_9419 ) ) ( IS-CRATE ?auto_9412 ) ( not ( = ?auto_9428 ?auto_9418 ) ) ( not ( = ?auto_9422 ?auto_9428 ) ) ( HOIST-AT ?auto_9426 ?auto_9428 ) ( not ( = ?auto_9415 ?auto_9426 ) ) ( not ( = ?auto_9421 ?auto_9426 ) ) ( SURFACE-AT ?auto_9412 ?auto_9428 ) ( ON ?auto_9412 ?auto_9425 ) ( CLEAR ?auto_9412 ) ( not ( = ?auto_9412 ?auto_9425 ) ) ( not ( = ?auto_9413 ?auto_9425 ) ) ( not ( = ?auto_9411 ?auto_9425 ) ) ( not ( = ?auto_9419 ?auto_9425 ) ) ( IS-CRATE ?auto_9411 ) ( not ( = ?auto_9416 ?auto_9411 ) ) ( not ( = ?auto_9412 ?auto_9416 ) ) ( not ( = ?auto_9413 ?auto_9416 ) ) ( not ( = ?auto_9419 ?auto_9416 ) ) ( not ( = ?auto_9425 ?auto_9416 ) ) ( AVAILABLE ?auto_9426 ) ( SURFACE-AT ?auto_9411 ?auto_9428 ) ( ON ?auto_9411 ?auto_9427 ) ( CLEAR ?auto_9411 ) ( not ( = ?auto_9412 ?auto_9427 ) ) ( not ( = ?auto_9413 ?auto_9427 ) ) ( not ( = ?auto_9411 ?auto_9427 ) ) ( not ( = ?auto_9419 ?auto_9427 ) ) ( not ( = ?auto_9425 ?auto_9427 ) ) ( not ( = ?auto_9416 ?auto_9427 ) ) ( SURFACE-AT ?auto_9424 ?auto_9418 ) ( CLEAR ?auto_9424 ) ( IS-CRATE ?auto_9416 ) ( not ( = ?auto_9424 ?auto_9416 ) ) ( not ( = ?auto_9412 ?auto_9424 ) ) ( not ( = ?auto_9413 ?auto_9424 ) ) ( not ( = ?auto_9411 ?auto_9424 ) ) ( not ( = ?auto_9419 ?auto_9424 ) ) ( not ( = ?auto_9425 ?auto_9424 ) ) ( not ( = ?auto_9427 ?auto_9424 ) ) ( AVAILABLE ?auto_9415 ) ( TRUCK-AT ?auto_9417 ?auto_9423 ) ( not ( = ?auto_9423 ?auto_9418 ) ) ( not ( = ?auto_9422 ?auto_9423 ) ) ( not ( = ?auto_9428 ?auto_9423 ) ) ( HOIST-AT ?auto_9414 ?auto_9423 ) ( not ( = ?auto_9415 ?auto_9414 ) ) ( not ( = ?auto_9421 ?auto_9414 ) ) ( not ( = ?auto_9426 ?auto_9414 ) ) ( AVAILABLE ?auto_9414 ) ( SURFACE-AT ?auto_9416 ?auto_9423 ) ( ON ?auto_9416 ?auto_9420 ) ( CLEAR ?auto_9416 ) ( not ( = ?auto_9412 ?auto_9420 ) ) ( not ( = ?auto_9413 ?auto_9420 ) ) ( not ( = ?auto_9411 ?auto_9420 ) ) ( not ( = ?auto_9419 ?auto_9420 ) ) ( not ( = ?auto_9425 ?auto_9420 ) ) ( not ( = ?auto_9416 ?auto_9420 ) ) ( not ( = ?auto_9427 ?auto_9420 ) ) ( not ( = ?auto_9424 ?auto_9420 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9412 ?auto_9413 )
      ( MAKE-2CRATE-VERIFY ?auto_9411 ?auto_9412 ?auto_9413 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9429 - SURFACE
      ?auto_9430 - SURFACE
      ?auto_9431 - SURFACE
      ?auto_9432 - SURFACE
    )
    :vars
    (
      ?auto_9436 - HOIST
      ?auto_9437 - PLACE
      ?auto_9442 - PLACE
      ?auto_9438 - HOIST
      ?auto_9445 - SURFACE
      ?auto_9435 - PLACE
      ?auto_9441 - HOIST
      ?auto_9439 - SURFACE
      ?auto_9440 - SURFACE
      ?auto_9443 - SURFACE
      ?auto_9434 - TRUCK
      ?auto_9444 - PLACE
      ?auto_9433 - HOIST
      ?auto_9446 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9436 ?auto_9437 ) ( IS-CRATE ?auto_9432 ) ( not ( = ?auto_9431 ?auto_9432 ) ) ( not ( = ?auto_9430 ?auto_9431 ) ) ( not ( = ?auto_9430 ?auto_9432 ) ) ( not ( = ?auto_9442 ?auto_9437 ) ) ( HOIST-AT ?auto_9438 ?auto_9442 ) ( not ( = ?auto_9436 ?auto_9438 ) ) ( AVAILABLE ?auto_9438 ) ( SURFACE-AT ?auto_9432 ?auto_9442 ) ( ON ?auto_9432 ?auto_9445 ) ( CLEAR ?auto_9432 ) ( not ( = ?auto_9431 ?auto_9445 ) ) ( not ( = ?auto_9432 ?auto_9445 ) ) ( not ( = ?auto_9430 ?auto_9445 ) ) ( IS-CRATE ?auto_9431 ) ( not ( = ?auto_9435 ?auto_9437 ) ) ( not ( = ?auto_9442 ?auto_9435 ) ) ( HOIST-AT ?auto_9441 ?auto_9435 ) ( not ( = ?auto_9436 ?auto_9441 ) ) ( not ( = ?auto_9438 ?auto_9441 ) ) ( SURFACE-AT ?auto_9431 ?auto_9435 ) ( ON ?auto_9431 ?auto_9439 ) ( CLEAR ?auto_9431 ) ( not ( = ?auto_9431 ?auto_9439 ) ) ( not ( = ?auto_9432 ?auto_9439 ) ) ( not ( = ?auto_9430 ?auto_9439 ) ) ( not ( = ?auto_9445 ?auto_9439 ) ) ( IS-CRATE ?auto_9430 ) ( not ( = ?auto_9429 ?auto_9430 ) ) ( not ( = ?auto_9431 ?auto_9429 ) ) ( not ( = ?auto_9432 ?auto_9429 ) ) ( not ( = ?auto_9445 ?auto_9429 ) ) ( not ( = ?auto_9439 ?auto_9429 ) ) ( AVAILABLE ?auto_9441 ) ( SURFACE-AT ?auto_9430 ?auto_9435 ) ( ON ?auto_9430 ?auto_9440 ) ( CLEAR ?auto_9430 ) ( not ( = ?auto_9431 ?auto_9440 ) ) ( not ( = ?auto_9432 ?auto_9440 ) ) ( not ( = ?auto_9430 ?auto_9440 ) ) ( not ( = ?auto_9445 ?auto_9440 ) ) ( not ( = ?auto_9439 ?auto_9440 ) ) ( not ( = ?auto_9429 ?auto_9440 ) ) ( SURFACE-AT ?auto_9443 ?auto_9437 ) ( CLEAR ?auto_9443 ) ( IS-CRATE ?auto_9429 ) ( not ( = ?auto_9443 ?auto_9429 ) ) ( not ( = ?auto_9431 ?auto_9443 ) ) ( not ( = ?auto_9432 ?auto_9443 ) ) ( not ( = ?auto_9430 ?auto_9443 ) ) ( not ( = ?auto_9445 ?auto_9443 ) ) ( not ( = ?auto_9439 ?auto_9443 ) ) ( not ( = ?auto_9440 ?auto_9443 ) ) ( AVAILABLE ?auto_9436 ) ( TRUCK-AT ?auto_9434 ?auto_9444 ) ( not ( = ?auto_9444 ?auto_9437 ) ) ( not ( = ?auto_9442 ?auto_9444 ) ) ( not ( = ?auto_9435 ?auto_9444 ) ) ( HOIST-AT ?auto_9433 ?auto_9444 ) ( not ( = ?auto_9436 ?auto_9433 ) ) ( not ( = ?auto_9438 ?auto_9433 ) ) ( not ( = ?auto_9441 ?auto_9433 ) ) ( AVAILABLE ?auto_9433 ) ( SURFACE-AT ?auto_9429 ?auto_9444 ) ( ON ?auto_9429 ?auto_9446 ) ( CLEAR ?auto_9429 ) ( not ( = ?auto_9431 ?auto_9446 ) ) ( not ( = ?auto_9432 ?auto_9446 ) ) ( not ( = ?auto_9430 ?auto_9446 ) ) ( not ( = ?auto_9445 ?auto_9446 ) ) ( not ( = ?auto_9439 ?auto_9446 ) ) ( not ( = ?auto_9429 ?auto_9446 ) ) ( not ( = ?auto_9440 ?auto_9446 ) ) ( not ( = ?auto_9443 ?auto_9446 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9430 ?auto_9431 ?auto_9432 )
      ( MAKE-3CRATE-VERIFY ?auto_9429 ?auto_9430 ?auto_9431 ?auto_9432 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9447 - SURFACE
      ?auto_9448 - SURFACE
      ?auto_9449 - SURFACE
      ?auto_9450 - SURFACE
      ?auto_9451 - SURFACE
    )
    :vars
    (
      ?auto_9455 - HOIST
      ?auto_9456 - PLACE
      ?auto_9461 - PLACE
      ?auto_9457 - HOIST
      ?auto_9463 - SURFACE
      ?auto_9454 - PLACE
      ?auto_9460 - HOIST
      ?auto_9458 - SURFACE
      ?auto_9459 - SURFACE
      ?auto_9453 - TRUCK
      ?auto_9462 - PLACE
      ?auto_9452 - HOIST
      ?auto_9464 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9455 ?auto_9456 ) ( IS-CRATE ?auto_9451 ) ( not ( = ?auto_9450 ?auto_9451 ) ) ( not ( = ?auto_9449 ?auto_9450 ) ) ( not ( = ?auto_9449 ?auto_9451 ) ) ( not ( = ?auto_9461 ?auto_9456 ) ) ( HOIST-AT ?auto_9457 ?auto_9461 ) ( not ( = ?auto_9455 ?auto_9457 ) ) ( AVAILABLE ?auto_9457 ) ( SURFACE-AT ?auto_9451 ?auto_9461 ) ( ON ?auto_9451 ?auto_9463 ) ( CLEAR ?auto_9451 ) ( not ( = ?auto_9450 ?auto_9463 ) ) ( not ( = ?auto_9451 ?auto_9463 ) ) ( not ( = ?auto_9449 ?auto_9463 ) ) ( IS-CRATE ?auto_9450 ) ( not ( = ?auto_9454 ?auto_9456 ) ) ( not ( = ?auto_9461 ?auto_9454 ) ) ( HOIST-AT ?auto_9460 ?auto_9454 ) ( not ( = ?auto_9455 ?auto_9460 ) ) ( not ( = ?auto_9457 ?auto_9460 ) ) ( SURFACE-AT ?auto_9450 ?auto_9454 ) ( ON ?auto_9450 ?auto_9458 ) ( CLEAR ?auto_9450 ) ( not ( = ?auto_9450 ?auto_9458 ) ) ( not ( = ?auto_9451 ?auto_9458 ) ) ( not ( = ?auto_9449 ?auto_9458 ) ) ( not ( = ?auto_9463 ?auto_9458 ) ) ( IS-CRATE ?auto_9449 ) ( not ( = ?auto_9448 ?auto_9449 ) ) ( not ( = ?auto_9450 ?auto_9448 ) ) ( not ( = ?auto_9451 ?auto_9448 ) ) ( not ( = ?auto_9463 ?auto_9448 ) ) ( not ( = ?auto_9458 ?auto_9448 ) ) ( AVAILABLE ?auto_9460 ) ( SURFACE-AT ?auto_9449 ?auto_9454 ) ( ON ?auto_9449 ?auto_9459 ) ( CLEAR ?auto_9449 ) ( not ( = ?auto_9450 ?auto_9459 ) ) ( not ( = ?auto_9451 ?auto_9459 ) ) ( not ( = ?auto_9449 ?auto_9459 ) ) ( not ( = ?auto_9463 ?auto_9459 ) ) ( not ( = ?auto_9458 ?auto_9459 ) ) ( not ( = ?auto_9448 ?auto_9459 ) ) ( SURFACE-AT ?auto_9447 ?auto_9456 ) ( CLEAR ?auto_9447 ) ( IS-CRATE ?auto_9448 ) ( not ( = ?auto_9447 ?auto_9448 ) ) ( not ( = ?auto_9450 ?auto_9447 ) ) ( not ( = ?auto_9451 ?auto_9447 ) ) ( not ( = ?auto_9449 ?auto_9447 ) ) ( not ( = ?auto_9463 ?auto_9447 ) ) ( not ( = ?auto_9458 ?auto_9447 ) ) ( not ( = ?auto_9459 ?auto_9447 ) ) ( AVAILABLE ?auto_9455 ) ( TRUCK-AT ?auto_9453 ?auto_9462 ) ( not ( = ?auto_9462 ?auto_9456 ) ) ( not ( = ?auto_9461 ?auto_9462 ) ) ( not ( = ?auto_9454 ?auto_9462 ) ) ( HOIST-AT ?auto_9452 ?auto_9462 ) ( not ( = ?auto_9455 ?auto_9452 ) ) ( not ( = ?auto_9457 ?auto_9452 ) ) ( not ( = ?auto_9460 ?auto_9452 ) ) ( AVAILABLE ?auto_9452 ) ( SURFACE-AT ?auto_9448 ?auto_9462 ) ( ON ?auto_9448 ?auto_9464 ) ( CLEAR ?auto_9448 ) ( not ( = ?auto_9450 ?auto_9464 ) ) ( not ( = ?auto_9451 ?auto_9464 ) ) ( not ( = ?auto_9449 ?auto_9464 ) ) ( not ( = ?auto_9463 ?auto_9464 ) ) ( not ( = ?auto_9458 ?auto_9464 ) ) ( not ( = ?auto_9448 ?auto_9464 ) ) ( not ( = ?auto_9459 ?auto_9464 ) ) ( not ( = ?auto_9447 ?auto_9464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9449 ?auto_9450 ?auto_9451 )
      ( MAKE-4CRATE-VERIFY ?auto_9447 ?auto_9448 ?auto_9449 ?auto_9450 ?auto_9451 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9465 - SURFACE
      ?auto_9466 - SURFACE
    )
    :vars
    (
      ?auto_9470 - HOIST
      ?auto_9471 - PLACE
      ?auto_9482 - SURFACE
      ?auto_9477 - PLACE
      ?auto_9472 - HOIST
      ?auto_9480 - SURFACE
      ?auto_9469 - PLACE
      ?auto_9475 - HOIST
      ?auto_9473 - SURFACE
      ?auto_9476 - SURFACE
      ?auto_9474 - SURFACE
      ?auto_9478 - SURFACE
      ?auto_9479 - PLACE
      ?auto_9467 - HOIST
      ?auto_9481 - SURFACE
      ?auto_9468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9470 ?auto_9471 ) ( IS-CRATE ?auto_9466 ) ( not ( = ?auto_9465 ?auto_9466 ) ) ( not ( = ?auto_9482 ?auto_9465 ) ) ( not ( = ?auto_9482 ?auto_9466 ) ) ( not ( = ?auto_9477 ?auto_9471 ) ) ( HOIST-AT ?auto_9472 ?auto_9477 ) ( not ( = ?auto_9470 ?auto_9472 ) ) ( AVAILABLE ?auto_9472 ) ( SURFACE-AT ?auto_9466 ?auto_9477 ) ( ON ?auto_9466 ?auto_9480 ) ( CLEAR ?auto_9466 ) ( not ( = ?auto_9465 ?auto_9480 ) ) ( not ( = ?auto_9466 ?auto_9480 ) ) ( not ( = ?auto_9482 ?auto_9480 ) ) ( IS-CRATE ?auto_9465 ) ( not ( = ?auto_9469 ?auto_9471 ) ) ( not ( = ?auto_9477 ?auto_9469 ) ) ( HOIST-AT ?auto_9475 ?auto_9469 ) ( not ( = ?auto_9470 ?auto_9475 ) ) ( not ( = ?auto_9472 ?auto_9475 ) ) ( SURFACE-AT ?auto_9465 ?auto_9469 ) ( ON ?auto_9465 ?auto_9473 ) ( CLEAR ?auto_9465 ) ( not ( = ?auto_9465 ?auto_9473 ) ) ( not ( = ?auto_9466 ?auto_9473 ) ) ( not ( = ?auto_9482 ?auto_9473 ) ) ( not ( = ?auto_9480 ?auto_9473 ) ) ( IS-CRATE ?auto_9482 ) ( not ( = ?auto_9476 ?auto_9482 ) ) ( not ( = ?auto_9465 ?auto_9476 ) ) ( not ( = ?auto_9466 ?auto_9476 ) ) ( not ( = ?auto_9480 ?auto_9476 ) ) ( not ( = ?auto_9473 ?auto_9476 ) ) ( AVAILABLE ?auto_9475 ) ( SURFACE-AT ?auto_9482 ?auto_9469 ) ( ON ?auto_9482 ?auto_9474 ) ( CLEAR ?auto_9482 ) ( not ( = ?auto_9465 ?auto_9474 ) ) ( not ( = ?auto_9466 ?auto_9474 ) ) ( not ( = ?auto_9482 ?auto_9474 ) ) ( not ( = ?auto_9480 ?auto_9474 ) ) ( not ( = ?auto_9473 ?auto_9474 ) ) ( not ( = ?auto_9476 ?auto_9474 ) ) ( SURFACE-AT ?auto_9478 ?auto_9471 ) ( CLEAR ?auto_9478 ) ( IS-CRATE ?auto_9476 ) ( not ( = ?auto_9478 ?auto_9476 ) ) ( not ( = ?auto_9465 ?auto_9478 ) ) ( not ( = ?auto_9466 ?auto_9478 ) ) ( not ( = ?auto_9482 ?auto_9478 ) ) ( not ( = ?auto_9480 ?auto_9478 ) ) ( not ( = ?auto_9473 ?auto_9478 ) ) ( not ( = ?auto_9474 ?auto_9478 ) ) ( AVAILABLE ?auto_9470 ) ( not ( = ?auto_9479 ?auto_9471 ) ) ( not ( = ?auto_9477 ?auto_9479 ) ) ( not ( = ?auto_9469 ?auto_9479 ) ) ( HOIST-AT ?auto_9467 ?auto_9479 ) ( not ( = ?auto_9470 ?auto_9467 ) ) ( not ( = ?auto_9472 ?auto_9467 ) ) ( not ( = ?auto_9475 ?auto_9467 ) ) ( AVAILABLE ?auto_9467 ) ( SURFACE-AT ?auto_9476 ?auto_9479 ) ( ON ?auto_9476 ?auto_9481 ) ( CLEAR ?auto_9476 ) ( not ( = ?auto_9465 ?auto_9481 ) ) ( not ( = ?auto_9466 ?auto_9481 ) ) ( not ( = ?auto_9482 ?auto_9481 ) ) ( not ( = ?auto_9480 ?auto_9481 ) ) ( not ( = ?auto_9473 ?auto_9481 ) ) ( not ( = ?auto_9476 ?auto_9481 ) ) ( not ( = ?auto_9474 ?auto_9481 ) ) ( not ( = ?auto_9478 ?auto_9481 ) ) ( TRUCK-AT ?auto_9468 ?auto_9471 ) )
    :subtasks
    ( ( !DRIVE ?auto_9468 ?auto_9471 ?auto_9479 )
      ( MAKE-2CRATE ?auto_9482 ?auto_9465 ?auto_9466 )
      ( MAKE-1CRATE-VERIFY ?auto_9465 ?auto_9466 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9483 - SURFACE
      ?auto_9484 - SURFACE
      ?auto_9485 - SURFACE
    )
    :vars
    (
      ?auto_9489 - HOIST
      ?auto_9495 - PLACE
      ?auto_9500 - PLACE
      ?auto_9488 - HOIST
      ?auto_9493 - SURFACE
      ?auto_9496 - PLACE
      ?auto_9492 - HOIST
      ?auto_9491 - SURFACE
      ?auto_9497 - SURFACE
      ?auto_9498 - SURFACE
      ?auto_9487 - SURFACE
      ?auto_9499 - PLACE
      ?auto_9494 - HOIST
      ?auto_9490 - SURFACE
      ?auto_9486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9489 ?auto_9495 ) ( IS-CRATE ?auto_9485 ) ( not ( = ?auto_9484 ?auto_9485 ) ) ( not ( = ?auto_9483 ?auto_9484 ) ) ( not ( = ?auto_9483 ?auto_9485 ) ) ( not ( = ?auto_9500 ?auto_9495 ) ) ( HOIST-AT ?auto_9488 ?auto_9500 ) ( not ( = ?auto_9489 ?auto_9488 ) ) ( AVAILABLE ?auto_9488 ) ( SURFACE-AT ?auto_9485 ?auto_9500 ) ( ON ?auto_9485 ?auto_9493 ) ( CLEAR ?auto_9485 ) ( not ( = ?auto_9484 ?auto_9493 ) ) ( not ( = ?auto_9485 ?auto_9493 ) ) ( not ( = ?auto_9483 ?auto_9493 ) ) ( IS-CRATE ?auto_9484 ) ( not ( = ?auto_9496 ?auto_9495 ) ) ( not ( = ?auto_9500 ?auto_9496 ) ) ( HOIST-AT ?auto_9492 ?auto_9496 ) ( not ( = ?auto_9489 ?auto_9492 ) ) ( not ( = ?auto_9488 ?auto_9492 ) ) ( SURFACE-AT ?auto_9484 ?auto_9496 ) ( ON ?auto_9484 ?auto_9491 ) ( CLEAR ?auto_9484 ) ( not ( = ?auto_9484 ?auto_9491 ) ) ( not ( = ?auto_9485 ?auto_9491 ) ) ( not ( = ?auto_9483 ?auto_9491 ) ) ( not ( = ?auto_9493 ?auto_9491 ) ) ( IS-CRATE ?auto_9483 ) ( not ( = ?auto_9497 ?auto_9483 ) ) ( not ( = ?auto_9484 ?auto_9497 ) ) ( not ( = ?auto_9485 ?auto_9497 ) ) ( not ( = ?auto_9493 ?auto_9497 ) ) ( not ( = ?auto_9491 ?auto_9497 ) ) ( AVAILABLE ?auto_9492 ) ( SURFACE-AT ?auto_9483 ?auto_9496 ) ( ON ?auto_9483 ?auto_9498 ) ( CLEAR ?auto_9483 ) ( not ( = ?auto_9484 ?auto_9498 ) ) ( not ( = ?auto_9485 ?auto_9498 ) ) ( not ( = ?auto_9483 ?auto_9498 ) ) ( not ( = ?auto_9493 ?auto_9498 ) ) ( not ( = ?auto_9491 ?auto_9498 ) ) ( not ( = ?auto_9497 ?auto_9498 ) ) ( SURFACE-AT ?auto_9487 ?auto_9495 ) ( CLEAR ?auto_9487 ) ( IS-CRATE ?auto_9497 ) ( not ( = ?auto_9487 ?auto_9497 ) ) ( not ( = ?auto_9484 ?auto_9487 ) ) ( not ( = ?auto_9485 ?auto_9487 ) ) ( not ( = ?auto_9483 ?auto_9487 ) ) ( not ( = ?auto_9493 ?auto_9487 ) ) ( not ( = ?auto_9491 ?auto_9487 ) ) ( not ( = ?auto_9498 ?auto_9487 ) ) ( AVAILABLE ?auto_9489 ) ( not ( = ?auto_9499 ?auto_9495 ) ) ( not ( = ?auto_9500 ?auto_9499 ) ) ( not ( = ?auto_9496 ?auto_9499 ) ) ( HOIST-AT ?auto_9494 ?auto_9499 ) ( not ( = ?auto_9489 ?auto_9494 ) ) ( not ( = ?auto_9488 ?auto_9494 ) ) ( not ( = ?auto_9492 ?auto_9494 ) ) ( AVAILABLE ?auto_9494 ) ( SURFACE-AT ?auto_9497 ?auto_9499 ) ( ON ?auto_9497 ?auto_9490 ) ( CLEAR ?auto_9497 ) ( not ( = ?auto_9484 ?auto_9490 ) ) ( not ( = ?auto_9485 ?auto_9490 ) ) ( not ( = ?auto_9483 ?auto_9490 ) ) ( not ( = ?auto_9493 ?auto_9490 ) ) ( not ( = ?auto_9491 ?auto_9490 ) ) ( not ( = ?auto_9497 ?auto_9490 ) ) ( not ( = ?auto_9498 ?auto_9490 ) ) ( not ( = ?auto_9487 ?auto_9490 ) ) ( TRUCK-AT ?auto_9486 ?auto_9495 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9484 ?auto_9485 )
      ( MAKE-2CRATE-VERIFY ?auto_9483 ?auto_9484 ?auto_9485 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9501 - SURFACE
      ?auto_9502 - SURFACE
      ?auto_9503 - SURFACE
      ?auto_9504 - SURFACE
    )
    :vars
    (
      ?auto_9507 - HOIST
      ?auto_9511 - PLACE
      ?auto_9510 - PLACE
      ?auto_9505 - HOIST
      ?auto_9517 - SURFACE
      ?auto_9514 - PLACE
      ?auto_9518 - HOIST
      ?auto_9509 - SURFACE
      ?auto_9513 - SURFACE
      ?auto_9516 - SURFACE
      ?auto_9515 - PLACE
      ?auto_9506 - HOIST
      ?auto_9508 - SURFACE
      ?auto_9512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9507 ?auto_9511 ) ( IS-CRATE ?auto_9504 ) ( not ( = ?auto_9503 ?auto_9504 ) ) ( not ( = ?auto_9502 ?auto_9503 ) ) ( not ( = ?auto_9502 ?auto_9504 ) ) ( not ( = ?auto_9510 ?auto_9511 ) ) ( HOIST-AT ?auto_9505 ?auto_9510 ) ( not ( = ?auto_9507 ?auto_9505 ) ) ( AVAILABLE ?auto_9505 ) ( SURFACE-AT ?auto_9504 ?auto_9510 ) ( ON ?auto_9504 ?auto_9517 ) ( CLEAR ?auto_9504 ) ( not ( = ?auto_9503 ?auto_9517 ) ) ( not ( = ?auto_9504 ?auto_9517 ) ) ( not ( = ?auto_9502 ?auto_9517 ) ) ( IS-CRATE ?auto_9503 ) ( not ( = ?auto_9514 ?auto_9511 ) ) ( not ( = ?auto_9510 ?auto_9514 ) ) ( HOIST-AT ?auto_9518 ?auto_9514 ) ( not ( = ?auto_9507 ?auto_9518 ) ) ( not ( = ?auto_9505 ?auto_9518 ) ) ( SURFACE-AT ?auto_9503 ?auto_9514 ) ( ON ?auto_9503 ?auto_9509 ) ( CLEAR ?auto_9503 ) ( not ( = ?auto_9503 ?auto_9509 ) ) ( not ( = ?auto_9504 ?auto_9509 ) ) ( not ( = ?auto_9502 ?auto_9509 ) ) ( not ( = ?auto_9517 ?auto_9509 ) ) ( IS-CRATE ?auto_9502 ) ( not ( = ?auto_9501 ?auto_9502 ) ) ( not ( = ?auto_9503 ?auto_9501 ) ) ( not ( = ?auto_9504 ?auto_9501 ) ) ( not ( = ?auto_9517 ?auto_9501 ) ) ( not ( = ?auto_9509 ?auto_9501 ) ) ( AVAILABLE ?auto_9518 ) ( SURFACE-AT ?auto_9502 ?auto_9514 ) ( ON ?auto_9502 ?auto_9513 ) ( CLEAR ?auto_9502 ) ( not ( = ?auto_9503 ?auto_9513 ) ) ( not ( = ?auto_9504 ?auto_9513 ) ) ( not ( = ?auto_9502 ?auto_9513 ) ) ( not ( = ?auto_9517 ?auto_9513 ) ) ( not ( = ?auto_9509 ?auto_9513 ) ) ( not ( = ?auto_9501 ?auto_9513 ) ) ( SURFACE-AT ?auto_9516 ?auto_9511 ) ( CLEAR ?auto_9516 ) ( IS-CRATE ?auto_9501 ) ( not ( = ?auto_9516 ?auto_9501 ) ) ( not ( = ?auto_9503 ?auto_9516 ) ) ( not ( = ?auto_9504 ?auto_9516 ) ) ( not ( = ?auto_9502 ?auto_9516 ) ) ( not ( = ?auto_9517 ?auto_9516 ) ) ( not ( = ?auto_9509 ?auto_9516 ) ) ( not ( = ?auto_9513 ?auto_9516 ) ) ( AVAILABLE ?auto_9507 ) ( not ( = ?auto_9515 ?auto_9511 ) ) ( not ( = ?auto_9510 ?auto_9515 ) ) ( not ( = ?auto_9514 ?auto_9515 ) ) ( HOIST-AT ?auto_9506 ?auto_9515 ) ( not ( = ?auto_9507 ?auto_9506 ) ) ( not ( = ?auto_9505 ?auto_9506 ) ) ( not ( = ?auto_9518 ?auto_9506 ) ) ( AVAILABLE ?auto_9506 ) ( SURFACE-AT ?auto_9501 ?auto_9515 ) ( ON ?auto_9501 ?auto_9508 ) ( CLEAR ?auto_9501 ) ( not ( = ?auto_9503 ?auto_9508 ) ) ( not ( = ?auto_9504 ?auto_9508 ) ) ( not ( = ?auto_9502 ?auto_9508 ) ) ( not ( = ?auto_9517 ?auto_9508 ) ) ( not ( = ?auto_9509 ?auto_9508 ) ) ( not ( = ?auto_9501 ?auto_9508 ) ) ( not ( = ?auto_9513 ?auto_9508 ) ) ( not ( = ?auto_9516 ?auto_9508 ) ) ( TRUCK-AT ?auto_9512 ?auto_9511 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9502 ?auto_9503 ?auto_9504 )
      ( MAKE-3CRATE-VERIFY ?auto_9501 ?auto_9502 ?auto_9503 ?auto_9504 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_9519 - SURFACE
      ?auto_9520 - SURFACE
      ?auto_9521 - SURFACE
      ?auto_9522 - SURFACE
      ?auto_9523 - SURFACE
    )
    :vars
    (
      ?auto_9526 - HOIST
      ?auto_9530 - PLACE
      ?auto_9529 - PLACE
      ?auto_9524 - HOIST
      ?auto_9535 - SURFACE
      ?auto_9533 - PLACE
      ?auto_9536 - HOIST
      ?auto_9528 - SURFACE
      ?auto_9532 - SURFACE
      ?auto_9534 - PLACE
      ?auto_9525 - HOIST
      ?auto_9527 - SURFACE
      ?auto_9531 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9526 ?auto_9530 ) ( IS-CRATE ?auto_9523 ) ( not ( = ?auto_9522 ?auto_9523 ) ) ( not ( = ?auto_9521 ?auto_9522 ) ) ( not ( = ?auto_9521 ?auto_9523 ) ) ( not ( = ?auto_9529 ?auto_9530 ) ) ( HOIST-AT ?auto_9524 ?auto_9529 ) ( not ( = ?auto_9526 ?auto_9524 ) ) ( AVAILABLE ?auto_9524 ) ( SURFACE-AT ?auto_9523 ?auto_9529 ) ( ON ?auto_9523 ?auto_9535 ) ( CLEAR ?auto_9523 ) ( not ( = ?auto_9522 ?auto_9535 ) ) ( not ( = ?auto_9523 ?auto_9535 ) ) ( not ( = ?auto_9521 ?auto_9535 ) ) ( IS-CRATE ?auto_9522 ) ( not ( = ?auto_9533 ?auto_9530 ) ) ( not ( = ?auto_9529 ?auto_9533 ) ) ( HOIST-AT ?auto_9536 ?auto_9533 ) ( not ( = ?auto_9526 ?auto_9536 ) ) ( not ( = ?auto_9524 ?auto_9536 ) ) ( SURFACE-AT ?auto_9522 ?auto_9533 ) ( ON ?auto_9522 ?auto_9528 ) ( CLEAR ?auto_9522 ) ( not ( = ?auto_9522 ?auto_9528 ) ) ( not ( = ?auto_9523 ?auto_9528 ) ) ( not ( = ?auto_9521 ?auto_9528 ) ) ( not ( = ?auto_9535 ?auto_9528 ) ) ( IS-CRATE ?auto_9521 ) ( not ( = ?auto_9520 ?auto_9521 ) ) ( not ( = ?auto_9522 ?auto_9520 ) ) ( not ( = ?auto_9523 ?auto_9520 ) ) ( not ( = ?auto_9535 ?auto_9520 ) ) ( not ( = ?auto_9528 ?auto_9520 ) ) ( AVAILABLE ?auto_9536 ) ( SURFACE-AT ?auto_9521 ?auto_9533 ) ( ON ?auto_9521 ?auto_9532 ) ( CLEAR ?auto_9521 ) ( not ( = ?auto_9522 ?auto_9532 ) ) ( not ( = ?auto_9523 ?auto_9532 ) ) ( not ( = ?auto_9521 ?auto_9532 ) ) ( not ( = ?auto_9535 ?auto_9532 ) ) ( not ( = ?auto_9528 ?auto_9532 ) ) ( not ( = ?auto_9520 ?auto_9532 ) ) ( SURFACE-AT ?auto_9519 ?auto_9530 ) ( CLEAR ?auto_9519 ) ( IS-CRATE ?auto_9520 ) ( not ( = ?auto_9519 ?auto_9520 ) ) ( not ( = ?auto_9522 ?auto_9519 ) ) ( not ( = ?auto_9523 ?auto_9519 ) ) ( not ( = ?auto_9521 ?auto_9519 ) ) ( not ( = ?auto_9535 ?auto_9519 ) ) ( not ( = ?auto_9528 ?auto_9519 ) ) ( not ( = ?auto_9532 ?auto_9519 ) ) ( AVAILABLE ?auto_9526 ) ( not ( = ?auto_9534 ?auto_9530 ) ) ( not ( = ?auto_9529 ?auto_9534 ) ) ( not ( = ?auto_9533 ?auto_9534 ) ) ( HOIST-AT ?auto_9525 ?auto_9534 ) ( not ( = ?auto_9526 ?auto_9525 ) ) ( not ( = ?auto_9524 ?auto_9525 ) ) ( not ( = ?auto_9536 ?auto_9525 ) ) ( AVAILABLE ?auto_9525 ) ( SURFACE-AT ?auto_9520 ?auto_9534 ) ( ON ?auto_9520 ?auto_9527 ) ( CLEAR ?auto_9520 ) ( not ( = ?auto_9522 ?auto_9527 ) ) ( not ( = ?auto_9523 ?auto_9527 ) ) ( not ( = ?auto_9521 ?auto_9527 ) ) ( not ( = ?auto_9535 ?auto_9527 ) ) ( not ( = ?auto_9528 ?auto_9527 ) ) ( not ( = ?auto_9520 ?auto_9527 ) ) ( not ( = ?auto_9532 ?auto_9527 ) ) ( not ( = ?auto_9519 ?auto_9527 ) ) ( TRUCK-AT ?auto_9531 ?auto_9530 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9521 ?auto_9522 ?auto_9523 )
      ( MAKE-4CRATE-VERIFY ?auto_9519 ?auto_9520 ?auto_9521 ?auto_9522 ?auto_9523 ) )
  )

)

