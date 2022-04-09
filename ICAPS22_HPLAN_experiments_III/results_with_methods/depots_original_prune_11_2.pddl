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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_478583 - SURFACE
      ?auto_478584 - SURFACE
    )
    :vars
    (
      ?auto_478585 - HOIST
      ?auto_478586 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_478585 ?auto_478586 ) ( SURFACE-AT ?auto_478583 ?auto_478586 ) ( CLEAR ?auto_478583 ) ( LIFTING ?auto_478585 ?auto_478584 ) ( IS-CRATE ?auto_478584 ) ( not ( = ?auto_478583 ?auto_478584 ) ) )
    :subtasks
    ( ( !DROP ?auto_478585 ?auto_478584 ?auto_478583 ?auto_478586 )
      ( MAKE-1CRATE-VERIFY ?auto_478583 ?auto_478584 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_478587 - SURFACE
      ?auto_478588 - SURFACE
    )
    :vars
    (
      ?auto_478589 - HOIST
      ?auto_478590 - PLACE
      ?auto_478591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_478589 ?auto_478590 ) ( SURFACE-AT ?auto_478587 ?auto_478590 ) ( CLEAR ?auto_478587 ) ( IS-CRATE ?auto_478588 ) ( not ( = ?auto_478587 ?auto_478588 ) ) ( TRUCK-AT ?auto_478591 ?auto_478590 ) ( AVAILABLE ?auto_478589 ) ( IN ?auto_478588 ?auto_478591 ) )
    :subtasks
    ( ( !UNLOAD ?auto_478589 ?auto_478588 ?auto_478591 ?auto_478590 )
      ( MAKE-1CRATE ?auto_478587 ?auto_478588 )
      ( MAKE-1CRATE-VERIFY ?auto_478587 ?auto_478588 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_478592 - SURFACE
      ?auto_478593 - SURFACE
    )
    :vars
    (
      ?auto_478596 - HOIST
      ?auto_478595 - PLACE
      ?auto_478594 - TRUCK
      ?auto_478597 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_478596 ?auto_478595 ) ( SURFACE-AT ?auto_478592 ?auto_478595 ) ( CLEAR ?auto_478592 ) ( IS-CRATE ?auto_478593 ) ( not ( = ?auto_478592 ?auto_478593 ) ) ( AVAILABLE ?auto_478596 ) ( IN ?auto_478593 ?auto_478594 ) ( TRUCK-AT ?auto_478594 ?auto_478597 ) ( not ( = ?auto_478597 ?auto_478595 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_478594 ?auto_478597 ?auto_478595 )
      ( MAKE-1CRATE ?auto_478592 ?auto_478593 )
      ( MAKE-1CRATE-VERIFY ?auto_478592 ?auto_478593 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_478598 - SURFACE
      ?auto_478599 - SURFACE
    )
    :vars
    (
      ?auto_478602 - HOIST
      ?auto_478600 - PLACE
      ?auto_478603 - TRUCK
      ?auto_478601 - PLACE
      ?auto_478604 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_478602 ?auto_478600 ) ( SURFACE-AT ?auto_478598 ?auto_478600 ) ( CLEAR ?auto_478598 ) ( IS-CRATE ?auto_478599 ) ( not ( = ?auto_478598 ?auto_478599 ) ) ( AVAILABLE ?auto_478602 ) ( TRUCK-AT ?auto_478603 ?auto_478601 ) ( not ( = ?auto_478601 ?auto_478600 ) ) ( HOIST-AT ?auto_478604 ?auto_478601 ) ( LIFTING ?auto_478604 ?auto_478599 ) ( not ( = ?auto_478602 ?auto_478604 ) ) )
    :subtasks
    ( ( !LOAD ?auto_478604 ?auto_478599 ?auto_478603 ?auto_478601 )
      ( MAKE-1CRATE ?auto_478598 ?auto_478599 )
      ( MAKE-1CRATE-VERIFY ?auto_478598 ?auto_478599 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_478605 - SURFACE
      ?auto_478606 - SURFACE
    )
    :vars
    (
      ?auto_478609 - HOIST
      ?auto_478611 - PLACE
      ?auto_478607 - TRUCK
      ?auto_478608 - PLACE
      ?auto_478610 - HOIST
      ?auto_478612 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_478609 ?auto_478611 ) ( SURFACE-AT ?auto_478605 ?auto_478611 ) ( CLEAR ?auto_478605 ) ( IS-CRATE ?auto_478606 ) ( not ( = ?auto_478605 ?auto_478606 ) ) ( AVAILABLE ?auto_478609 ) ( TRUCK-AT ?auto_478607 ?auto_478608 ) ( not ( = ?auto_478608 ?auto_478611 ) ) ( HOIST-AT ?auto_478610 ?auto_478608 ) ( not ( = ?auto_478609 ?auto_478610 ) ) ( AVAILABLE ?auto_478610 ) ( SURFACE-AT ?auto_478606 ?auto_478608 ) ( ON ?auto_478606 ?auto_478612 ) ( CLEAR ?auto_478606 ) ( not ( = ?auto_478605 ?auto_478612 ) ) ( not ( = ?auto_478606 ?auto_478612 ) ) )
    :subtasks
    ( ( !LIFT ?auto_478610 ?auto_478606 ?auto_478612 ?auto_478608 )
      ( MAKE-1CRATE ?auto_478605 ?auto_478606 )
      ( MAKE-1CRATE-VERIFY ?auto_478605 ?auto_478606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_478613 - SURFACE
      ?auto_478614 - SURFACE
    )
    :vars
    (
      ?auto_478615 - HOIST
      ?auto_478616 - PLACE
      ?auto_478617 - PLACE
      ?auto_478620 - HOIST
      ?auto_478619 - SURFACE
      ?auto_478618 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_478615 ?auto_478616 ) ( SURFACE-AT ?auto_478613 ?auto_478616 ) ( CLEAR ?auto_478613 ) ( IS-CRATE ?auto_478614 ) ( not ( = ?auto_478613 ?auto_478614 ) ) ( AVAILABLE ?auto_478615 ) ( not ( = ?auto_478617 ?auto_478616 ) ) ( HOIST-AT ?auto_478620 ?auto_478617 ) ( not ( = ?auto_478615 ?auto_478620 ) ) ( AVAILABLE ?auto_478620 ) ( SURFACE-AT ?auto_478614 ?auto_478617 ) ( ON ?auto_478614 ?auto_478619 ) ( CLEAR ?auto_478614 ) ( not ( = ?auto_478613 ?auto_478619 ) ) ( not ( = ?auto_478614 ?auto_478619 ) ) ( TRUCK-AT ?auto_478618 ?auto_478616 ) )
    :subtasks
    ( ( !DRIVE ?auto_478618 ?auto_478616 ?auto_478617 )
      ( MAKE-1CRATE ?auto_478613 ?auto_478614 )
      ( MAKE-1CRATE-VERIFY ?auto_478613 ?auto_478614 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_478630 - SURFACE
      ?auto_478631 - SURFACE
      ?auto_478632 - SURFACE
    )
    :vars
    (
      ?auto_478633 - HOIST
      ?auto_478634 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_478633 ?auto_478634 ) ( SURFACE-AT ?auto_478631 ?auto_478634 ) ( CLEAR ?auto_478631 ) ( LIFTING ?auto_478633 ?auto_478632 ) ( IS-CRATE ?auto_478632 ) ( not ( = ?auto_478631 ?auto_478632 ) ) ( ON ?auto_478631 ?auto_478630 ) ( not ( = ?auto_478630 ?auto_478631 ) ) ( not ( = ?auto_478630 ?auto_478632 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_478631 ?auto_478632 )
      ( MAKE-2CRATE-VERIFY ?auto_478630 ?auto_478631 ?auto_478632 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_478640 - SURFACE
      ?auto_478641 - SURFACE
      ?auto_478642 - SURFACE
    )
    :vars
    (
      ?auto_478644 - HOIST
      ?auto_478645 - PLACE
      ?auto_478643 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_478644 ?auto_478645 ) ( SURFACE-AT ?auto_478641 ?auto_478645 ) ( CLEAR ?auto_478641 ) ( IS-CRATE ?auto_478642 ) ( not ( = ?auto_478641 ?auto_478642 ) ) ( TRUCK-AT ?auto_478643 ?auto_478645 ) ( AVAILABLE ?auto_478644 ) ( IN ?auto_478642 ?auto_478643 ) ( ON ?auto_478641 ?auto_478640 ) ( not ( = ?auto_478640 ?auto_478641 ) ) ( not ( = ?auto_478640 ?auto_478642 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_478641 ?auto_478642 )
      ( MAKE-2CRATE-VERIFY ?auto_478640 ?auto_478641 ?auto_478642 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_478646 - SURFACE
      ?auto_478647 - SURFACE
    )
    :vars
    (
      ?auto_478649 - HOIST
      ?auto_478648 - PLACE
      ?auto_478650 - TRUCK
      ?auto_478651 - SURFACE
      ?auto_478652 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_478649 ?auto_478648 ) ( SURFACE-AT ?auto_478646 ?auto_478648 ) ( CLEAR ?auto_478646 ) ( IS-CRATE ?auto_478647 ) ( not ( = ?auto_478646 ?auto_478647 ) ) ( AVAILABLE ?auto_478649 ) ( IN ?auto_478647 ?auto_478650 ) ( ON ?auto_478646 ?auto_478651 ) ( not ( = ?auto_478651 ?auto_478646 ) ) ( not ( = ?auto_478651 ?auto_478647 ) ) ( TRUCK-AT ?auto_478650 ?auto_478652 ) ( not ( = ?auto_478652 ?auto_478648 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_478650 ?auto_478652 ?auto_478648 )
      ( MAKE-2CRATE ?auto_478651 ?auto_478646 ?auto_478647 )
      ( MAKE-1CRATE-VERIFY ?auto_478646 ?auto_478647 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_478653 - SURFACE
      ?auto_478654 - SURFACE
      ?auto_478655 - SURFACE
    )
    :vars
    (
      ?auto_478659 - HOIST
      ?auto_478656 - PLACE
      ?auto_478658 - TRUCK
      ?auto_478657 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_478659 ?auto_478656 ) ( SURFACE-AT ?auto_478654 ?auto_478656 ) ( CLEAR ?auto_478654 ) ( IS-CRATE ?auto_478655 ) ( not ( = ?auto_478654 ?auto_478655 ) ) ( AVAILABLE ?auto_478659 ) ( IN ?auto_478655 ?auto_478658 ) ( ON ?auto_478654 ?auto_478653 ) ( not ( = ?auto_478653 ?auto_478654 ) ) ( not ( = ?auto_478653 ?auto_478655 ) ) ( TRUCK-AT ?auto_478658 ?auto_478657 ) ( not ( = ?auto_478657 ?auto_478656 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_478654 ?auto_478655 )
      ( MAKE-2CRATE-VERIFY ?auto_478653 ?auto_478654 ?auto_478655 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_478660 - SURFACE
      ?auto_478661 - SURFACE
    )
    :vars
    (
      ?auto_478666 - HOIST
      ?auto_478665 - PLACE
      ?auto_478663 - SURFACE
      ?auto_478662 - TRUCK
      ?auto_478664 - PLACE
      ?auto_478667 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_478666 ?auto_478665 ) ( SURFACE-AT ?auto_478660 ?auto_478665 ) ( CLEAR ?auto_478660 ) ( IS-CRATE ?auto_478661 ) ( not ( = ?auto_478660 ?auto_478661 ) ) ( AVAILABLE ?auto_478666 ) ( ON ?auto_478660 ?auto_478663 ) ( not ( = ?auto_478663 ?auto_478660 ) ) ( not ( = ?auto_478663 ?auto_478661 ) ) ( TRUCK-AT ?auto_478662 ?auto_478664 ) ( not ( = ?auto_478664 ?auto_478665 ) ) ( HOIST-AT ?auto_478667 ?auto_478664 ) ( LIFTING ?auto_478667 ?auto_478661 ) ( not ( = ?auto_478666 ?auto_478667 ) ) )
    :subtasks
    ( ( !LOAD ?auto_478667 ?auto_478661 ?auto_478662 ?auto_478664 )
      ( MAKE-2CRATE ?auto_478663 ?auto_478660 ?auto_478661 )
      ( MAKE-1CRATE-VERIFY ?auto_478660 ?auto_478661 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_478668 - SURFACE
      ?auto_478669 - SURFACE
      ?auto_478670 - SURFACE
    )
    :vars
    (
      ?auto_478674 - HOIST
      ?auto_478671 - PLACE
      ?auto_478672 - TRUCK
      ?auto_478673 - PLACE
      ?auto_478675 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_478674 ?auto_478671 ) ( SURFACE-AT ?auto_478669 ?auto_478671 ) ( CLEAR ?auto_478669 ) ( IS-CRATE ?auto_478670 ) ( not ( = ?auto_478669 ?auto_478670 ) ) ( AVAILABLE ?auto_478674 ) ( ON ?auto_478669 ?auto_478668 ) ( not ( = ?auto_478668 ?auto_478669 ) ) ( not ( = ?auto_478668 ?auto_478670 ) ) ( TRUCK-AT ?auto_478672 ?auto_478673 ) ( not ( = ?auto_478673 ?auto_478671 ) ) ( HOIST-AT ?auto_478675 ?auto_478673 ) ( LIFTING ?auto_478675 ?auto_478670 ) ( not ( = ?auto_478674 ?auto_478675 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_478669 ?auto_478670 )
      ( MAKE-2CRATE-VERIFY ?auto_478668 ?auto_478669 ?auto_478670 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_478676 - SURFACE
      ?auto_478677 - SURFACE
    )
    :vars
    (
      ?auto_478678 - HOIST
      ?auto_478679 - PLACE
      ?auto_478680 - SURFACE
      ?auto_478681 - TRUCK
      ?auto_478683 - PLACE
      ?auto_478682 - HOIST
      ?auto_478684 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_478678 ?auto_478679 ) ( SURFACE-AT ?auto_478676 ?auto_478679 ) ( CLEAR ?auto_478676 ) ( IS-CRATE ?auto_478677 ) ( not ( = ?auto_478676 ?auto_478677 ) ) ( AVAILABLE ?auto_478678 ) ( ON ?auto_478676 ?auto_478680 ) ( not ( = ?auto_478680 ?auto_478676 ) ) ( not ( = ?auto_478680 ?auto_478677 ) ) ( TRUCK-AT ?auto_478681 ?auto_478683 ) ( not ( = ?auto_478683 ?auto_478679 ) ) ( HOIST-AT ?auto_478682 ?auto_478683 ) ( not ( = ?auto_478678 ?auto_478682 ) ) ( AVAILABLE ?auto_478682 ) ( SURFACE-AT ?auto_478677 ?auto_478683 ) ( ON ?auto_478677 ?auto_478684 ) ( CLEAR ?auto_478677 ) ( not ( = ?auto_478676 ?auto_478684 ) ) ( not ( = ?auto_478677 ?auto_478684 ) ) ( not ( = ?auto_478680 ?auto_478684 ) ) )
    :subtasks
    ( ( !LIFT ?auto_478682 ?auto_478677 ?auto_478684 ?auto_478683 )
      ( MAKE-2CRATE ?auto_478680 ?auto_478676 ?auto_478677 )
      ( MAKE-1CRATE-VERIFY ?auto_478676 ?auto_478677 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_478685 - SURFACE
      ?auto_478686 - SURFACE
      ?auto_478687 - SURFACE
    )
    :vars
    (
      ?auto_478688 - HOIST
      ?auto_478692 - PLACE
      ?auto_478693 - TRUCK
      ?auto_478691 - PLACE
      ?auto_478689 - HOIST
      ?auto_478690 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_478688 ?auto_478692 ) ( SURFACE-AT ?auto_478686 ?auto_478692 ) ( CLEAR ?auto_478686 ) ( IS-CRATE ?auto_478687 ) ( not ( = ?auto_478686 ?auto_478687 ) ) ( AVAILABLE ?auto_478688 ) ( ON ?auto_478686 ?auto_478685 ) ( not ( = ?auto_478685 ?auto_478686 ) ) ( not ( = ?auto_478685 ?auto_478687 ) ) ( TRUCK-AT ?auto_478693 ?auto_478691 ) ( not ( = ?auto_478691 ?auto_478692 ) ) ( HOIST-AT ?auto_478689 ?auto_478691 ) ( not ( = ?auto_478688 ?auto_478689 ) ) ( AVAILABLE ?auto_478689 ) ( SURFACE-AT ?auto_478687 ?auto_478691 ) ( ON ?auto_478687 ?auto_478690 ) ( CLEAR ?auto_478687 ) ( not ( = ?auto_478686 ?auto_478690 ) ) ( not ( = ?auto_478687 ?auto_478690 ) ) ( not ( = ?auto_478685 ?auto_478690 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_478686 ?auto_478687 )
      ( MAKE-2CRATE-VERIFY ?auto_478685 ?auto_478686 ?auto_478687 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_478694 - SURFACE
      ?auto_478695 - SURFACE
    )
    :vars
    (
      ?auto_478701 - HOIST
      ?auto_478697 - PLACE
      ?auto_478702 - SURFACE
      ?auto_478700 - PLACE
      ?auto_478699 - HOIST
      ?auto_478698 - SURFACE
      ?auto_478696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_478701 ?auto_478697 ) ( SURFACE-AT ?auto_478694 ?auto_478697 ) ( CLEAR ?auto_478694 ) ( IS-CRATE ?auto_478695 ) ( not ( = ?auto_478694 ?auto_478695 ) ) ( AVAILABLE ?auto_478701 ) ( ON ?auto_478694 ?auto_478702 ) ( not ( = ?auto_478702 ?auto_478694 ) ) ( not ( = ?auto_478702 ?auto_478695 ) ) ( not ( = ?auto_478700 ?auto_478697 ) ) ( HOIST-AT ?auto_478699 ?auto_478700 ) ( not ( = ?auto_478701 ?auto_478699 ) ) ( AVAILABLE ?auto_478699 ) ( SURFACE-AT ?auto_478695 ?auto_478700 ) ( ON ?auto_478695 ?auto_478698 ) ( CLEAR ?auto_478695 ) ( not ( = ?auto_478694 ?auto_478698 ) ) ( not ( = ?auto_478695 ?auto_478698 ) ) ( not ( = ?auto_478702 ?auto_478698 ) ) ( TRUCK-AT ?auto_478696 ?auto_478697 ) )
    :subtasks
    ( ( !DRIVE ?auto_478696 ?auto_478697 ?auto_478700 )
      ( MAKE-2CRATE ?auto_478702 ?auto_478694 ?auto_478695 )
      ( MAKE-1CRATE-VERIFY ?auto_478694 ?auto_478695 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_478703 - SURFACE
      ?auto_478704 - SURFACE
      ?auto_478705 - SURFACE
    )
    :vars
    (
      ?auto_478710 - HOIST
      ?auto_478708 - PLACE
      ?auto_478711 - PLACE
      ?auto_478706 - HOIST
      ?auto_478709 - SURFACE
      ?auto_478707 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_478710 ?auto_478708 ) ( SURFACE-AT ?auto_478704 ?auto_478708 ) ( CLEAR ?auto_478704 ) ( IS-CRATE ?auto_478705 ) ( not ( = ?auto_478704 ?auto_478705 ) ) ( AVAILABLE ?auto_478710 ) ( ON ?auto_478704 ?auto_478703 ) ( not ( = ?auto_478703 ?auto_478704 ) ) ( not ( = ?auto_478703 ?auto_478705 ) ) ( not ( = ?auto_478711 ?auto_478708 ) ) ( HOIST-AT ?auto_478706 ?auto_478711 ) ( not ( = ?auto_478710 ?auto_478706 ) ) ( AVAILABLE ?auto_478706 ) ( SURFACE-AT ?auto_478705 ?auto_478711 ) ( ON ?auto_478705 ?auto_478709 ) ( CLEAR ?auto_478705 ) ( not ( = ?auto_478704 ?auto_478709 ) ) ( not ( = ?auto_478705 ?auto_478709 ) ) ( not ( = ?auto_478703 ?auto_478709 ) ) ( TRUCK-AT ?auto_478707 ?auto_478708 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_478704 ?auto_478705 )
      ( MAKE-2CRATE-VERIFY ?auto_478703 ?auto_478704 ?auto_478705 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_478712 - SURFACE
      ?auto_478713 - SURFACE
    )
    :vars
    (
      ?auto_478715 - HOIST
      ?auto_478714 - PLACE
      ?auto_478719 - SURFACE
      ?auto_478717 - PLACE
      ?auto_478716 - HOIST
      ?auto_478718 - SURFACE
      ?auto_478720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_478715 ?auto_478714 ) ( IS-CRATE ?auto_478713 ) ( not ( = ?auto_478712 ?auto_478713 ) ) ( not ( = ?auto_478719 ?auto_478712 ) ) ( not ( = ?auto_478719 ?auto_478713 ) ) ( not ( = ?auto_478717 ?auto_478714 ) ) ( HOIST-AT ?auto_478716 ?auto_478717 ) ( not ( = ?auto_478715 ?auto_478716 ) ) ( AVAILABLE ?auto_478716 ) ( SURFACE-AT ?auto_478713 ?auto_478717 ) ( ON ?auto_478713 ?auto_478718 ) ( CLEAR ?auto_478713 ) ( not ( = ?auto_478712 ?auto_478718 ) ) ( not ( = ?auto_478713 ?auto_478718 ) ) ( not ( = ?auto_478719 ?auto_478718 ) ) ( TRUCK-AT ?auto_478720 ?auto_478714 ) ( SURFACE-AT ?auto_478719 ?auto_478714 ) ( CLEAR ?auto_478719 ) ( LIFTING ?auto_478715 ?auto_478712 ) ( IS-CRATE ?auto_478712 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_478719 ?auto_478712 )
      ( MAKE-2CRATE ?auto_478719 ?auto_478712 ?auto_478713 )
      ( MAKE-1CRATE-VERIFY ?auto_478712 ?auto_478713 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_478721 - SURFACE
      ?auto_478722 - SURFACE
      ?auto_478723 - SURFACE
    )
    :vars
    (
      ?auto_478728 - HOIST
      ?auto_478726 - PLACE
      ?auto_478729 - PLACE
      ?auto_478724 - HOIST
      ?auto_478727 - SURFACE
      ?auto_478725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_478728 ?auto_478726 ) ( IS-CRATE ?auto_478723 ) ( not ( = ?auto_478722 ?auto_478723 ) ) ( not ( = ?auto_478721 ?auto_478722 ) ) ( not ( = ?auto_478721 ?auto_478723 ) ) ( not ( = ?auto_478729 ?auto_478726 ) ) ( HOIST-AT ?auto_478724 ?auto_478729 ) ( not ( = ?auto_478728 ?auto_478724 ) ) ( AVAILABLE ?auto_478724 ) ( SURFACE-AT ?auto_478723 ?auto_478729 ) ( ON ?auto_478723 ?auto_478727 ) ( CLEAR ?auto_478723 ) ( not ( = ?auto_478722 ?auto_478727 ) ) ( not ( = ?auto_478723 ?auto_478727 ) ) ( not ( = ?auto_478721 ?auto_478727 ) ) ( TRUCK-AT ?auto_478725 ?auto_478726 ) ( SURFACE-AT ?auto_478721 ?auto_478726 ) ( CLEAR ?auto_478721 ) ( LIFTING ?auto_478728 ?auto_478722 ) ( IS-CRATE ?auto_478722 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_478722 ?auto_478723 )
      ( MAKE-2CRATE-VERIFY ?auto_478721 ?auto_478722 ?auto_478723 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_478730 - SURFACE
      ?auto_478731 - SURFACE
    )
    :vars
    (
      ?auto_478734 - HOIST
      ?auto_478733 - PLACE
      ?auto_478737 - SURFACE
      ?auto_478732 - PLACE
      ?auto_478738 - HOIST
      ?auto_478736 - SURFACE
      ?auto_478735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_478734 ?auto_478733 ) ( IS-CRATE ?auto_478731 ) ( not ( = ?auto_478730 ?auto_478731 ) ) ( not ( = ?auto_478737 ?auto_478730 ) ) ( not ( = ?auto_478737 ?auto_478731 ) ) ( not ( = ?auto_478732 ?auto_478733 ) ) ( HOIST-AT ?auto_478738 ?auto_478732 ) ( not ( = ?auto_478734 ?auto_478738 ) ) ( AVAILABLE ?auto_478738 ) ( SURFACE-AT ?auto_478731 ?auto_478732 ) ( ON ?auto_478731 ?auto_478736 ) ( CLEAR ?auto_478731 ) ( not ( = ?auto_478730 ?auto_478736 ) ) ( not ( = ?auto_478731 ?auto_478736 ) ) ( not ( = ?auto_478737 ?auto_478736 ) ) ( TRUCK-AT ?auto_478735 ?auto_478733 ) ( SURFACE-AT ?auto_478737 ?auto_478733 ) ( CLEAR ?auto_478737 ) ( IS-CRATE ?auto_478730 ) ( AVAILABLE ?auto_478734 ) ( IN ?auto_478730 ?auto_478735 ) )
    :subtasks
    ( ( !UNLOAD ?auto_478734 ?auto_478730 ?auto_478735 ?auto_478733 )
      ( MAKE-2CRATE ?auto_478737 ?auto_478730 ?auto_478731 )
      ( MAKE-1CRATE-VERIFY ?auto_478730 ?auto_478731 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_478739 - SURFACE
      ?auto_478740 - SURFACE
      ?auto_478741 - SURFACE
    )
    :vars
    (
      ?auto_478745 - HOIST
      ?auto_478742 - PLACE
      ?auto_478744 - PLACE
      ?auto_478746 - HOIST
      ?auto_478743 - SURFACE
      ?auto_478747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_478745 ?auto_478742 ) ( IS-CRATE ?auto_478741 ) ( not ( = ?auto_478740 ?auto_478741 ) ) ( not ( = ?auto_478739 ?auto_478740 ) ) ( not ( = ?auto_478739 ?auto_478741 ) ) ( not ( = ?auto_478744 ?auto_478742 ) ) ( HOIST-AT ?auto_478746 ?auto_478744 ) ( not ( = ?auto_478745 ?auto_478746 ) ) ( AVAILABLE ?auto_478746 ) ( SURFACE-AT ?auto_478741 ?auto_478744 ) ( ON ?auto_478741 ?auto_478743 ) ( CLEAR ?auto_478741 ) ( not ( = ?auto_478740 ?auto_478743 ) ) ( not ( = ?auto_478741 ?auto_478743 ) ) ( not ( = ?auto_478739 ?auto_478743 ) ) ( TRUCK-AT ?auto_478747 ?auto_478742 ) ( SURFACE-AT ?auto_478739 ?auto_478742 ) ( CLEAR ?auto_478739 ) ( IS-CRATE ?auto_478740 ) ( AVAILABLE ?auto_478745 ) ( IN ?auto_478740 ?auto_478747 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_478740 ?auto_478741 )
      ( MAKE-2CRATE-VERIFY ?auto_478739 ?auto_478740 ?auto_478741 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_478784 - SURFACE
      ?auto_478785 - SURFACE
    )
    :vars
    (
      ?auto_478789 - HOIST
      ?auto_478791 - PLACE
      ?auto_478792 - SURFACE
      ?auto_478787 - PLACE
      ?auto_478788 - HOIST
      ?auto_478790 - SURFACE
      ?auto_478786 - TRUCK
      ?auto_478793 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_478789 ?auto_478791 ) ( SURFACE-AT ?auto_478784 ?auto_478791 ) ( CLEAR ?auto_478784 ) ( IS-CRATE ?auto_478785 ) ( not ( = ?auto_478784 ?auto_478785 ) ) ( AVAILABLE ?auto_478789 ) ( ON ?auto_478784 ?auto_478792 ) ( not ( = ?auto_478792 ?auto_478784 ) ) ( not ( = ?auto_478792 ?auto_478785 ) ) ( not ( = ?auto_478787 ?auto_478791 ) ) ( HOIST-AT ?auto_478788 ?auto_478787 ) ( not ( = ?auto_478789 ?auto_478788 ) ) ( AVAILABLE ?auto_478788 ) ( SURFACE-AT ?auto_478785 ?auto_478787 ) ( ON ?auto_478785 ?auto_478790 ) ( CLEAR ?auto_478785 ) ( not ( = ?auto_478784 ?auto_478790 ) ) ( not ( = ?auto_478785 ?auto_478790 ) ) ( not ( = ?auto_478792 ?auto_478790 ) ) ( TRUCK-AT ?auto_478786 ?auto_478793 ) ( not ( = ?auto_478793 ?auto_478791 ) ) ( not ( = ?auto_478787 ?auto_478793 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_478786 ?auto_478793 ?auto_478791 )
      ( MAKE-1CRATE ?auto_478784 ?auto_478785 )
      ( MAKE-1CRATE-VERIFY ?auto_478784 ?auto_478785 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_478823 - SURFACE
      ?auto_478824 - SURFACE
      ?auto_478825 - SURFACE
      ?auto_478826 - SURFACE
    )
    :vars
    (
      ?auto_478827 - HOIST
      ?auto_478828 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_478827 ?auto_478828 ) ( SURFACE-AT ?auto_478825 ?auto_478828 ) ( CLEAR ?auto_478825 ) ( LIFTING ?auto_478827 ?auto_478826 ) ( IS-CRATE ?auto_478826 ) ( not ( = ?auto_478825 ?auto_478826 ) ) ( ON ?auto_478824 ?auto_478823 ) ( ON ?auto_478825 ?auto_478824 ) ( not ( = ?auto_478823 ?auto_478824 ) ) ( not ( = ?auto_478823 ?auto_478825 ) ) ( not ( = ?auto_478823 ?auto_478826 ) ) ( not ( = ?auto_478824 ?auto_478825 ) ) ( not ( = ?auto_478824 ?auto_478826 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_478825 ?auto_478826 )
      ( MAKE-3CRATE-VERIFY ?auto_478823 ?auto_478824 ?auto_478825 ?auto_478826 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_478840 - SURFACE
      ?auto_478841 - SURFACE
      ?auto_478842 - SURFACE
      ?auto_478843 - SURFACE
    )
    :vars
    (
      ?auto_478844 - HOIST
      ?auto_478846 - PLACE
      ?auto_478845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_478844 ?auto_478846 ) ( SURFACE-AT ?auto_478842 ?auto_478846 ) ( CLEAR ?auto_478842 ) ( IS-CRATE ?auto_478843 ) ( not ( = ?auto_478842 ?auto_478843 ) ) ( TRUCK-AT ?auto_478845 ?auto_478846 ) ( AVAILABLE ?auto_478844 ) ( IN ?auto_478843 ?auto_478845 ) ( ON ?auto_478842 ?auto_478841 ) ( not ( = ?auto_478841 ?auto_478842 ) ) ( not ( = ?auto_478841 ?auto_478843 ) ) ( ON ?auto_478841 ?auto_478840 ) ( not ( = ?auto_478840 ?auto_478841 ) ) ( not ( = ?auto_478840 ?auto_478842 ) ) ( not ( = ?auto_478840 ?auto_478843 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_478841 ?auto_478842 ?auto_478843 )
      ( MAKE-3CRATE-VERIFY ?auto_478840 ?auto_478841 ?auto_478842 ?auto_478843 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_478861 - SURFACE
      ?auto_478862 - SURFACE
      ?auto_478863 - SURFACE
      ?auto_478864 - SURFACE
    )
    :vars
    (
      ?auto_478866 - HOIST
      ?auto_478868 - PLACE
      ?auto_478865 - TRUCK
      ?auto_478867 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_478866 ?auto_478868 ) ( SURFACE-AT ?auto_478863 ?auto_478868 ) ( CLEAR ?auto_478863 ) ( IS-CRATE ?auto_478864 ) ( not ( = ?auto_478863 ?auto_478864 ) ) ( AVAILABLE ?auto_478866 ) ( IN ?auto_478864 ?auto_478865 ) ( ON ?auto_478863 ?auto_478862 ) ( not ( = ?auto_478862 ?auto_478863 ) ) ( not ( = ?auto_478862 ?auto_478864 ) ) ( TRUCK-AT ?auto_478865 ?auto_478867 ) ( not ( = ?auto_478867 ?auto_478868 ) ) ( ON ?auto_478862 ?auto_478861 ) ( not ( = ?auto_478861 ?auto_478862 ) ) ( not ( = ?auto_478861 ?auto_478863 ) ) ( not ( = ?auto_478861 ?auto_478864 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_478862 ?auto_478863 ?auto_478864 )
      ( MAKE-3CRATE-VERIFY ?auto_478861 ?auto_478862 ?auto_478863 ?auto_478864 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_478885 - SURFACE
      ?auto_478886 - SURFACE
      ?auto_478887 - SURFACE
      ?auto_478888 - SURFACE
    )
    :vars
    (
      ?auto_478890 - HOIST
      ?auto_478889 - PLACE
      ?auto_478891 - TRUCK
      ?auto_478893 - PLACE
      ?auto_478892 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_478890 ?auto_478889 ) ( SURFACE-AT ?auto_478887 ?auto_478889 ) ( CLEAR ?auto_478887 ) ( IS-CRATE ?auto_478888 ) ( not ( = ?auto_478887 ?auto_478888 ) ) ( AVAILABLE ?auto_478890 ) ( ON ?auto_478887 ?auto_478886 ) ( not ( = ?auto_478886 ?auto_478887 ) ) ( not ( = ?auto_478886 ?auto_478888 ) ) ( TRUCK-AT ?auto_478891 ?auto_478893 ) ( not ( = ?auto_478893 ?auto_478889 ) ) ( HOIST-AT ?auto_478892 ?auto_478893 ) ( LIFTING ?auto_478892 ?auto_478888 ) ( not ( = ?auto_478890 ?auto_478892 ) ) ( ON ?auto_478886 ?auto_478885 ) ( not ( = ?auto_478885 ?auto_478886 ) ) ( not ( = ?auto_478885 ?auto_478887 ) ) ( not ( = ?auto_478885 ?auto_478888 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_478886 ?auto_478887 ?auto_478888 )
      ( MAKE-3CRATE-VERIFY ?auto_478885 ?auto_478886 ?auto_478887 ?auto_478888 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_478912 - SURFACE
      ?auto_478913 - SURFACE
      ?auto_478914 - SURFACE
      ?auto_478915 - SURFACE
    )
    :vars
    (
      ?auto_478918 - HOIST
      ?auto_478921 - PLACE
      ?auto_478916 - TRUCK
      ?auto_478917 - PLACE
      ?auto_478920 - HOIST
      ?auto_478919 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_478918 ?auto_478921 ) ( SURFACE-AT ?auto_478914 ?auto_478921 ) ( CLEAR ?auto_478914 ) ( IS-CRATE ?auto_478915 ) ( not ( = ?auto_478914 ?auto_478915 ) ) ( AVAILABLE ?auto_478918 ) ( ON ?auto_478914 ?auto_478913 ) ( not ( = ?auto_478913 ?auto_478914 ) ) ( not ( = ?auto_478913 ?auto_478915 ) ) ( TRUCK-AT ?auto_478916 ?auto_478917 ) ( not ( = ?auto_478917 ?auto_478921 ) ) ( HOIST-AT ?auto_478920 ?auto_478917 ) ( not ( = ?auto_478918 ?auto_478920 ) ) ( AVAILABLE ?auto_478920 ) ( SURFACE-AT ?auto_478915 ?auto_478917 ) ( ON ?auto_478915 ?auto_478919 ) ( CLEAR ?auto_478915 ) ( not ( = ?auto_478914 ?auto_478919 ) ) ( not ( = ?auto_478915 ?auto_478919 ) ) ( not ( = ?auto_478913 ?auto_478919 ) ) ( ON ?auto_478913 ?auto_478912 ) ( not ( = ?auto_478912 ?auto_478913 ) ) ( not ( = ?auto_478912 ?auto_478914 ) ) ( not ( = ?auto_478912 ?auto_478915 ) ) ( not ( = ?auto_478912 ?auto_478919 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_478913 ?auto_478914 ?auto_478915 )
      ( MAKE-3CRATE-VERIFY ?auto_478912 ?auto_478913 ?auto_478914 ?auto_478915 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_478940 - SURFACE
      ?auto_478941 - SURFACE
      ?auto_478942 - SURFACE
      ?auto_478943 - SURFACE
    )
    :vars
    (
      ?auto_478948 - HOIST
      ?auto_478947 - PLACE
      ?auto_478944 - PLACE
      ?auto_478946 - HOIST
      ?auto_478945 - SURFACE
      ?auto_478949 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_478948 ?auto_478947 ) ( SURFACE-AT ?auto_478942 ?auto_478947 ) ( CLEAR ?auto_478942 ) ( IS-CRATE ?auto_478943 ) ( not ( = ?auto_478942 ?auto_478943 ) ) ( AVAILABLE ?auto_478948 ) ( ON ?auto_478942 ?auto_478941 ) ( not ( = ?auto_478941 ?auto_478942 ) ) ( not ( = ?auto_478941 ?auto_478943 ) ) ( not ( = ?auto_478944 ?auto_478947 ) ) ( HOIST-AT ?auto_478946 ?auto_478944 ) ( not ( = ?auto_478948 ?auto_478946 ) ) ( AVAILABLE ?auto_478946 ) ( SURFACE-AT ?auto_478943 ?auto_478944 ) ( ON ?auto_478943 ?auto_478945 ) ( CLEAR ?auto_478943 ) ( not ( = ?auto_478942 ?auto_478945 ) ) ( not ( = ?auto_478943 ?auto_478945 ) ) ( not ( = ?auto_478941 ?auto_478945 ) ) ( TRUCK-AT ?auto_478949 ?auto_478947 ) ( ON ?auto_478941 ?auto_478940 ) ( not ( = ?auto_478940 ?auto_478941 ) ) ( not ( = ?auto_478940 ?auto_478942 ) ) ( not ( = ?auto_478940 ?auto_478943 ) ) ( not ( = ?auto_478940 ?auto_478945 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_478941 ?auto_478942 ?auto_478943 )
      ( MAKE-3CRATE-VERIFY ?auto_478940 ?auto_478941 ?auto_478942 ?auto_478943 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_478968 - SURFACE
      ?auto_478969 - SURFACE
      ?auto_478970 - SURFACE
      ?auto_478971 - SURFACE
    )
    :vars
    (
      ?auto_478976 - HOIST
      ?auto_478973 - PLACE
      ?auto_478977 - PLACE
      ?auto_478975 - HOIST
      ?auto_478972 - SURFACE
      ?auto_478974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_478976 ?auto_478973 ) ( IS-CRATE ?auto_478971 ) ( not ( = ?auto_478970 ?auto_478971 ) ) ( not ( = ?auto_478969 ?auto_478970 ) ) ( not ( = ?auto_478969 ?auto_478971 ) ) ( not ( = ?auto_478977 ?auto_478973 ) ) ( HOIST-AT ?auto_478975 ?auto_478977 ) ( not ( = ?auto_478976 ?auto_478975 ) ) ( AVAILABLE ?auto_478975 ) ( SURFACE-AT ?auto_478971 ?auto_478977 ) ( ON ?auto_478971 ?auto_478972 ) ( CLEAR ?auto_478971 ) ( not ( = ?auto_478970 ?auto_478972 ) ) ( not ( = ?auto_478971 ?auto_478972 ) ) ( not ( = ?auto_478969 ?auto_478972 ) ) ( TRUCK-AT ?auto_478974 ?auto_478973 ) ( SURFACE-AT ?auto_478969 ?auto_478973 ) ( CLEAR ?auto_478969 ) ( LIFTING ?auto_478976 ?auto_478970 ) ( IS-CRATE ?auto_478970 ) ( ON ?auto_478969 ?auto_478968 ) ( not ( = ?auto_478968 ?auto_478969 ) ) ( not ( = ?auto_478968 ?auto_478970 ) ) ( not ( = ?auto_478968 ?auto_478971 ) ) ( not ( = ?auto_478968 ?auto_478972 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_478969 ?auto_478970 ?auto_478971 )
      ( MAKE-3CRATE-VERIFY ?auto_478968 ?auto_478969 ?auto_478970 ?auto_478971 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_478996 - SURFACE
      ?auto_478997 - SURFACE
      ?auto_478998 - SURFACE
      ?auto_478999 - SURFACE
    )
    :vars
    (
      ?auto_479005 - HOIST
      ?auto_479001 - PLACE
      ?auto_479003 - PLACE
      ?auto_479000 - HOIST
      ?auto_479002 - SURFACE
      ?auto_479004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479005 ?auto_479001 ) ( IS-CRATE ?auto_478999 ) ( not ( = ?auto_478998 ?auto_478999 ) ) ( not ( = ?auto_478997 ?auto_478998 ) ) ( not ( = ?auto_478997 ?auto_478999 ) ) ( not ( = ?auto_479003 ?auto_479001 ) ) ( HOIST-AT ?auto_479000 ?auto_479003 ) ( not ( = ?auto_479005 ?auto_479000 ) ) ( AVAILABLE ?auto_479000 ) ( SURFACE-AT ?auto_478999 ?auto_479003 ) ( ON ?auto_478999 ?auto_479002 ) ( CLEAR ?auto_478999 ) ( not ( = ?auto_478998 ?auto_479002 ) ) ( not ( = ?auto_478999 ?auto_479002 ) ) ( not ( = ?auto_478997 ?auto_479002 ) ) ( TRUCK-AT ?auto_479004 ?auto_479001 ) ( SURFACE-AT ?auto_478997 ?auto_479001 ) ( CLEAR ?auto_478997 ) ( IS-CRATE ?auto_478998 ) ( AVAILABLE ?auto_479005 ) ( IN ?auto_478998 ?auto_479004 ) ( ON ?auto_478997 ?auto_478996 ) ( not ( = ?auto_478996 ?auto_478997 ) ) ( not ( = ?auto_478996 ?auto_478998 ) ) ( not ( = ?auto_478996 ?auto_478999 ) ) ( not ( = ?auto_478996 ?auto_479002 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_478997 ?auto_478998 ?auto_478999 )
      ( MAKE-3CRATE-VERIFY ?auto_478996 ?auto_478997 ?auto_478998 ?auto_478999 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_479287 - SURFACE
      ?auto_479288 - SURFACE
      ?auto_479289 - SURFACE
      ?auto_479291 - SURFACE
      ?auto_479290 - SURFACE
    )
    :vars
    (
      ?auto_479292 - HOIST
      ?auto_479293 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479292 ?auto_479293 ) ( SURFACE-AT ?auto_479291 ?auto_479293 ) ( CLEAR ?auto_479291 ) ( LIFTING ?auto_479292 ?auto_479290 ) ( IS-CRATE ?auto_479290 ) ( not ( = ?auto_479291 ?auto_479290 ) ) ( ON ?auto_479288 ?auto_479287 ) ( ON ?auto_479289 ?auto_479288 ) ( ON ?auto_479291 ?auto_479289 ) ( not ( = ?auto_479287 ?auto_479288 ) ) ( not ( = ?auto_479287 ?auto_479289 ) ) ( not ( = ?auto_479287 ?auto_479291 ) ) ( not ( = ?auto_479287 ?auto_479290 ) ) ( not ( = ?auto_479288 ?auto_479289 ) ) ( not ( = ?auto_479288 ?auto_479291 ) ) ( not ( = ?auto_479288 ?auto_479290 ) ) ( not ( = ?auto_479289 ?auto_479291 ) ) ( not ( = ?auto_479289 ?auto_479290 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_479291 ?auto_479290 )
      ( MAKE-4CRATE-VERIFY ?auto_479287 ?auto_479288 ?auto_479289 ?auto_479291 ?auto_479290 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_479312 - SURFACE
      ?auto_479313 - SURFACE
      ?auto_479314 - SURFACE
      ?auto_479316 - SURFACE
      ?auto_479315 - SURFACE
    )
    :vars
    (
      ?auto_479319 - HOIST
      ?auto_479318 - PLACE
      ?auto_479317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479319 ?auto_479318 ) ( SURFACE-AT ?auto_479316 ?auto_479318 ) ( CLEAR ?auto_479316 ) ( IS-CRATE ?auto_479315 ) ( not ( = ?auto_479316 ?auto_479315 ) ) ( TRUCK-AT ?auto_479317 ?auto_479318 ) ( AVAILABLE ?auto_479319 ) ( IN ?auto_479315 ?auto_479317 ) ( ON ?auto_479316 ?auto_479314 ) ( not ( = ?auto_479314 ?auto_479316 ) ) ( not ( = ?auto_479314 ?auto_479315 ) ) ( ON ?auto_479313 ?auto_479312 ) ( ON ?auto_479314 ?auto_479313 ) ( not ( = ?auto_479312 ?auto_479313 ) ) ( not ( = ?auto_479312 ?auto_479314 ) ) ( not ( = ?auto_479312 ?auto_479316 ) ) ( not ( = ?auto_479312 ?auto_479315 ) ) ( not ( = ?auto_479313 ?auto_479314 ) ) ( not ( = ?auto_479313 ?auto_479316 ) ) ( not ( = ?auto_479313 ?auto_479315 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479314 ?auto_479316 ?auto_479315 )
      ( MAKE-4CRATE-VERIFY ?auto_479312 ?auto_479313 ?auto_479314 ?auto_479316 ?auto_479315 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_479342 - SURFACE
      ?auto_479343 - SURFACE
      ?auto_479344 - SURFACE
      ?auto_479346 - SURFACE
      ?auto_479345 - SURFACE
    )
    :vars
    (
      ?auto_479348 - HOIST
      ?auto_479347 - PLACE
      ?auto_479349 - TRUCK
      ?auto_479350 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479348 ?auto_479347 ) ( SURFACE-AT ?auto_479346 ?auto_479347 ) ( CLEAR ?auto_479346 ) ( IS-CRATE ?auto_479345 ) ( not ( = ?auto_479346 ?auto_479345 ) ) ( AVAILABLE ?auto_479348 ) ( IN ?auto_479345 ?auto_479349 ) ( ON ?auto_479346 ?auto_479344 ) ( not ( = ?auto_479344 ?auto_479346 ) ) ( not ( = ?auto_479344 ?auto_479345 ) ) ( TRUCK-AT ?auto_479349 ?auto_479350 ) ( not ( = ?auto_479350 ?auto_479347 ) ) ( ON ?auto_479343 ?auto_479342 ) ( ON ?auto_479344 ?auto_479343 ) ( not ( = ?auto_479342 ?auto_479343 ) ) ( not ( = ?auto_479342 ?auto_479344 ) ) ( not ( = ?auto_479342 ?auto_479346 ) ) ( not ( = ?auto_479342 ?auto_479345 ) ) ( not ( = ?auto_479343 ?auto_479344 ) ) ( not ( = ?auto_479343 ?auto_479346 ) ) ( not ( = ?auto_479343 ?auto_479345 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479344 ?auto_479346 ?auto_479345 )
      ( MAKE-4CRATE-VERIFY ?auto_479342 ?auto_479343 ?auto_479344 ?auto_479346 ?auto_479345 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_479376 - SURFACE
      ?auto_479377 - SURFACE
      ?auto_479378 - SURFACE
      ?auto_479380 - SURFACE
      ?auto_479379 - SURFACE
    )
    :vars
    (
      ?auto_479381 - HOIST
      ?auto_479383 - PLACE
      ?auto_479382 - TRUCK
      ?auto_479385 - PLACE
      ?auto_479384 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_479381 ?auto_479383 ) ( SURFACE-AT ?auto_479380 ?auto_479383 ) ( CLEAR ?auto_479380 ) ( IS-CRATE ?auto_479379 ) ( not ( = ?auto_479380 ?auto_479379 ) ) ( AVAILABLE ?auto_479381 ) ( ON ?auto_479380 ?auto_479378 ) ( not ( = ?auto_479378 ?auto_479380 ) ) ( not ( = ?auto_479378 ?auto_479379 ) ) ( TRUCK-AT ?auto_479382 ?auto_479385 ) ( not ( = ?auto_479385 ?auto_479383 ) ) ( HOIST-AT ?auto_479384 ?auto_479385 ) ( LIFTING ?auto_479384 ?auto_479379 ) ( not ( = ?auto_479381 ?auto_479384 ) ) ( ON ?auto_479377 ?auto_479376 ) ( ON ?auto_479378 ?auto_479377 ) ( not ( = ?auto_479376 ?auto_479377 ) ) ( not ( = ?auto_479376 ?auto_479378 ) ) ( not ( = ?auto_479376 ?auto_479380 ) ) ( not ( = ?auto_479376 ?auto_479379 ) ) ( not ( = ?auto_479377 ?auto_479378 ) ) ( not ( = ?auto_479377 ?auto_479380 ) ) ( not ( = ?auto_479377 ?auto_479379 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479378 ?auto_479380 ?auto_479379 )
      ( MAKE-4CRATE-VERIFY ?auto_479376 ?auto_479377 ?auto_479378 ?auto_479380 ?auto_479379 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_479414 - SURFACE
      ?auto_479415 - SURFACE
      ?auto_479416 - SURFACE
      ?auto_479418 - SURFACE
      ?auto_479417 - SURFACE
    )
    :vars
    (
      ?auto_479422 - HOIST
      ?auto_479420 - PLACE
      ?auto_479421 - TRUCK
      ?auto_479419 - PLACE
      ?auto_479423 - HOIST
      ?auto_479424 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_479422 ?auto_479420 ) ( SURFACE-AT ?auto_479418 ?auto_479420 ) ( CLEAR ?auto_479418 ) ( IS-CRATE ?auto_479417 ) ( not ( = ?auto_479418 ?auto_479417 ) ) ( AVAILABLE ?auto_479422 ) ( ON ?auto_479418 ?auto_479416 ) ( not ( = ?auto_479416 ?auto_479418 ) ) ( not ( = ?auto_479416 ?auto_479417 ) ) ( TRUCK-AT ?auto_479421 ?auto_479419 ) ( not ( = ?auto_479419 ?auto_479420 ) ) ( HOIST-AT ?auto_479423 ?auto_479419 ) ( not ( = ?auto_479422 ?auto_479423 ) ) ( AVAILABLE ?auto_479423 ) ( SURFACE-AT ?auto_479417 ?auto_479419 ) ( ON ?auto_479417 ?auto_479424 ) ( CLEAR ?auto_479417 ) ( not ( = ?auto_479418 ?auto_479424 ) ) ( not ( = ?auto_479417 ?auto_479424 ) ) ( not ( = ?auto_479416 ?auto_479424 ) ) ( ON ?auto_479415 ?auto_479414 ) ( ON ?auto_479416 ?auto_479415 ) ( not ( = ?auto_479414 ?auto_479415 ) ) ( not ( = ?auto_479414 ?auto_479416 ) ) ( not ( = ?auto_479414 ?auto_479418 ) ) ( not ( = ?auto_479414 ?auto_479417 ) ) ( not ( = ?auto_479414 ?auto_479424 ) ) ( not ( = ?auto_479415 ?auto_479416 ) ) ( not ( = ?auto_479415 ?auto_479418 ) ) ( not ( = ?auto_479415 ?auto_479417 ) ) ( not ( = ?auto_479415 ?auto_479424 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479416 ?auto_479418 ?auto_479417 )
      ( MAKE-4CRATE-VERIFY ?auto_479414 ?auto_479415 ?auto_479416 ?auto_479418 ?auto_479417 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_479453 - SURFACE
      ?auto_479454 - SURFACE
      ?auto_479455 - SURFACE
      ?auto_479457 - SURFACE
      ?auto_479456 - SURFACE
    )
    :vars
    (
      ?auto_479462 - HOIST
      ?auto_479458 - PLACE
      ?auto_479463 - PLACE
      ?auto_479459 - HOIST
      ?auto_479460 - SURFACE
      ?auto_479461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479462 ?auto_479458 ) ( SURFACE-AT ?auto_479457 ?auto_479458 ) ( CLEAR ?auto_479457 ) ( IS-CRATE ?auto_479456 ) ( not ( = ?auto_479457 ?auto_479456 ) ) ( AVAILABLE ?auto_479462 ) ( ON ?auto_479457 ?auto_479455 ) ( not ( = ?auto_479455 ?auto_479457 ) ) ( not ( = ?auto_479455 ?auto_479456 ) ) ( not ( = ?auto_479463 ?auto_479458 ) ) ( HOIST-AT ?auto_479459 ?auto_479463 ) ( not ( = ?auto_479462 ?auto_479459 ) ) ( AVAILABLE ?auto_479459 ) ( SURFACE-AT ?auto_479456 ?auto_479463 ) ( ON ?auto_479456 ?auto_479460 ) ( CLEAR ?auto_479456 ) ( not ( = ?auto_479457 ?auto_479460 ) ) ( not ( = ?auto_479456 ?auto_479460 ) ) ( not ( = ?auto_479455 ?auto_479460 ) ) ( TRUCK-AT ?auto_479461 ?auto_479458 ) ( ON ?auto_479454 ?auto_479453 ) ( ON ?auto_479455 ?auto_479454 ) ( not ( = ?auto_479453 ?auto_479454 ) ) ( not ( = ?auto_479453 ?auto_479455 ) ) ( not ( = ?auto_479453 ?auto_479457 ) ) ( not ( = ?auto_479453 ?auto_479456 ) ) ( not ( = ?auto_479453 ?auto_479460 ) ) ( not ( = ?auto_479454 ?auto_479455 ) ) ( not ( = ?auto_479454 ?auto_479457 ) ) ( not ( = ?auto_479454 ?auto_479456 ) ) ( not ( = ?auto_479454 ?auto_479460 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479455 ?auto_479457 ?auto_479456 )
      ( MAKE-4CRATE-VERIFY ?auto_479453 ?auto_479454 ?auto_479455 ?auto_479457 ?auto_479456 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_479492 - SURFACE
      ?auto_479493 - SURFACE
      ?auto_479494 - SURFACE
      ?auto_479496 - SURFACE
      ?auto_479495 - SURFACE
    )
    :vars
    (
      ?auto_479497 - HOIST
      ?auto_479499 - PLACE
      ?auto_479498 - PLACE
      ?auto_479502 - HOIST
      ?auto_479500 - SURFACE
      ?auto_479501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479497 ?auto_479499 ) ( IS-CRATE ?auto_479495 ) ( not ( = ?auto_479496 ?auto_479495 ) ) ( not ( = ?auto_479494 ?auto_479496 ) ) ( not ( = ?auto_479494 ?auto_479495 ) ) ( not ( = ?auto_479498 ?auto_479499 ) ) ( HOIST-AT ?auto_479502 ?auto_479498 ) ( not ( = ?auto_479497 ?auto_479502 ) ) ( AVAILABLE ?auto_479502 ) ( SURFACE-AT ?auto_479495 ?auto_479498 ) ( ON ?auto_479495 ?auto_479500 ) ( CLEAR ?auto_479495 ) ( not ( = ?auto_479496 ?auto_479500 ) ) ( not ( = ?auto_479495 ?auto_479500 ) ) ( not ( = ?auto_479494 ?auto_479500 ) ) ( TRUCK-AT ?auto_479501 ?auto_479499 ) ( SURFACE-AT ?auto_479494 ?auto_479499 ) ( CLEAR ?auto_479494 ) ( LIFTING ?auto_479497 ?auto_479496 ) ( IS-CRATE ?auto_479496 ) ( ON ?auto_479493 ?auto_479492 ) ( ON ?auto_479494 ?auto_479493 ) ( not ( = ?auto_479492 ?auto_479493 ) ) ( not ( = ?auto_479492 ?auto_479494 ) ) ( not ( = ?auto_479492 ?auto_479496 ) ) ( not ( = ?auto_479492 ?auto_479495 ) ) ( not ( = ?auto_479492 ?auto_479500 ) ) ( not ( = ?auto_479493 ?auto_479494 ) ) ( not ( = ?auto_479493 ?auto_479496 ) ) ( not ( = ?auto_479493 ?auto_479495 ) ) ( not ( = ?auto_479493 ?auto_479500 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479494 ?auto_479496 ?auto_479495 )
      ( MAKE-4CRATE-VERIFY ?auto_479492 ?auto_479493 ?auto_479494 ?auto_479496 ?auto_479495 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_479531 - SURFACE
      ?auto_479532 - SURFACE
      ?auto_479533 - SURFACE
      ?auto_479535 - SURFACE
      ?auto_479534 - SURFACE
    )
    :vars
    (
      ?auto_479541 - HOIST
      ?auto_479536 - PLACE
      ?auto_479539 - PLACE
      ?auto_479537 - HOIST
      ?auto_479538 - SURFACE
      ?auto_479540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_479541 ?auto_479536 ) ( IS-CRATE ?auto_479534 ) ( not ( = ?auto_479535 ?auto_479534 ) ) ( not ( = ?auto_479533 ?auto_479535 ) ) ( not ( = ?auto_479533 ?auto_479534 ) ) ( not ( = ?auto_479539 ?auto_479536 ) ) ( HOIST-AT ?auto_479537 ?auto_479539 ) ( not ( = ?auto_479541 ?auto_479537 ) ) ( AVAILABLE ?auto_479537 ) ( SURFACE-AT ?auto_479534 ?auto_479539 ) ( ON ?auto_479534 ?auto_479538 ) ( CLEAR ?auto_479534 ) ( not ( = ?auto_479535 ?auto_479538 ) ) ( not ( = ?auto_479534 ?auto_479538 ) ) ( not ( = ?auto_479533 ?auto_479538 ) ) ( TRUCK-AT ?auto_479540 ?auto_479536 ) ( SURFACE-AT ?auto_479533 ?auto_479536 ) ( CLEAR ?auto_479533 ) ( IS-CRATE ?auto_479535 ) ( AVAILABLE ?auto_479541 ) ( IN ?auto_479535 ?auto_479540 ) ( ON ?auto_479532 ?auto_479531 ) ( ON ?auto_479533 ?auto_479532 ) ( not ( = ?auto_479531 ?auto_479532 ) ) ( not ( = ?auto_479531 ?auto_479533 ) ) ( not ( = ?auto_479531 ?auto_479535 ) ) ( not ( = ?auto_479531 ?auto_479534 ) ) ( not ( = ?auto_479531 ?auto_479538 ) ) ( not ( = ?auto_479532 ?auto_479533 ) ) ( not ( = ?auto_479532 ?auto_479535 ) ) ( not ( = ?auto_479532 ?auto_479534 ) ) ( not ( = ?auto_479532 ?auto_479538 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_479533 ?auto_479535 ?auto_479534 )
      ( MAKE-4CRATE-VERIFY ?auto_479531 ?auto_479532 ?auto_479533 ?auto_479535 ?auto_479534 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_480032 - SURFACE
      ?auto_480033 - SURFACE
    )
    :vars
    (
      ?auto_480036 - HOIST
      ?auto_480039 - PLACE
      ?auto_480037 - SURFACE
      ?auto_480040 - TRUCK
      ?auto_480038 - PLACE
      ?auto_480034 - HOIST
      ?auto_480035 - SURFACE
      ?auto_480041 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_480036 ?auto_480039 ) ( SURFACE-AT ?auto_480032 ?auto_480039 ) ( CLEAR ?auto_480032 ) ( IS-CRATE ?auto_480033 ) ( not ( = ?auto_480032 ?auto_480033 ) ) ( AVAILABLE ?auto_480036 ) ( ON ?auto_480032 ?auto_480037 ) ( not ( = ?auto_480037 ?auto_480032 ) ) ( not ( = ?auto_480037 ?auto_480033 ) ) ( TRUCK-AT ?auto_480040 ?auto_480038 ) ( not ( = ?auto_480038 ?auto_480039 ) ) ( HOIST-AT ?auto_480034 ?auto_480038 ) ( not ( = ?auto_480036 ?auto_480034 ) ) ( SURFACE-AT ?auto_480033 ?auto_480038 ) ( ON ?auto_480033 ?auto_480035 ) ( CLEAR ?auto_480033 ) ( not ( = ?auto_480032 ?auto_480035 ) ) ( not ( = ?auto_480033 ?auto_480035 ) ) ( not ( = ?auto_480037 ?auto_480035 ) ) ( LIFTING ?auto_480034 ?auto_480041 ) ( IS-CRATE ?auto_480041 ) ( not ( = ?auto_480032 ?auto_480041 ) ) ( not ( = ?auto_480033 ?auto_480041 ) ) ( not ( = ?auto_480037 ?auto_480041 ) ) ( not ( = ?auto_480035 ?auto_480041 ) ) )
    :subtasks
    ( ( !LOAD ?auto_480034 ?auto_480041 ?auto_480040 ?auto_480038 )
      ( MAKE-1CRATE ?auto_480032 ?auto_480033 )
      ( MAKE-1CRATE-VERIFY ?auto_480032 ?auto_480033 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_480191 - SURFACE
      ?auto_480192 - SURFACE
      ?auto_480193 - SURFACE
      ?auto_480195 - SURFACE
      ?auto_480194 - SURFACE
      ?auto_480196 - SURFACE
    )
    :vars
    (
      ?auto_480198 - HOIST
      ?auto_480197 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_480198 ?auto_480197 ) ( SURFACE-AT ?auto_480194 ?auto_480197 ) ( CLEAR ?auto_480194 ) ( LIFTING ?auto_480198 ?auto_480196 ) ( IS-CRATE ?auto_480196 ) ( not ( = ?auto_480194 ?auto_480196 ) ) ( ON ?auto_480192 ?auto_480191 ) ( ON ?auto_480193 ?auto_480192 ) ( ON ?auto_480195 ?auto_480193 ) ( ON ?auto_480194 ?auto_480195 ) ( not ( = ?auto_480191 ?auto_480192 ) ) ( not ( = ?auto_480191 ?auto_480193 ) ) ( not ( = ?auto_480191 ?auto_480195 ) ) ( not ( = ?auto_480191 ?auto_480194 ) ) ( not ( = ?auto_480191 ?auto_480196 ) ) ( not ( = ?auto_480192 ?auto_480193 ) ) ( not ( = ?auto_480192 ?auto_480195 ) ) ( not ( = ?auto_480192 ?auto_480194 ) ) ( not ( = ?auto_480192 ?auto_480196 ) ) ( not ( = ?auto_480193 ?auto_480195 ) ) ( not ( = ?auto_480193 ?auto_480194 ) ) ( not ( = ?auto_480193 ?auto_480196 ) ) ( not ( = ?auto_480195 ?auto_480194 ) ) ( not ( = ?auto_480195 ?auto_480196 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_480194 ?auto_480196 )
      ( MAKE-5CRATE-VERIFY ?auto_480191 ?auto_480192 ?auto_480193 ?auto_480195 ?auto_480194 ?auto_480196 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_480225 - SURFACE
      ?auto_480226 - SURFACE
      ?auto_480227 - SURFACE
      ?auto_480229 - SURFACE
      ?auto_480228 - SURFACE
      ?auto_480230 - SURFACE
    )
    :vars
    (
      ?auto_480233 - HOIST
      ?auto_480232 - PLACE
      ?auto_480231 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_480233 ?auto_480232 ) ( SURFACE-AT ?auto_480228 ?auto_480232 ) ( CLEAR ?auto_480228 ) ( IS-CRATE ?auto_480230 ) ( not ( = ?auto_480228 ?auto_480230 ) ) ( TRUCK-AT ?auto_480231 ?auto_480232 ) ( AVAILABLE ?auto_480233 ) ( IN ?auto_480230 ?auto_480231 ) ( ON ?auto_480228 ?auto_480229 ) ( not ( = ?auto_480229 ?auto_480228 ) ) ( not ( = ?auto_480229 ?auto_480230 ) ) ( ON ?auto_480226 ?auto_480225 ) ( ON ?auto_480227 ?auto_480226 ) ( ON ?auto_480229 ?auto_480227 ) ( not ( = ?auto_480225 ?auto_480226 ) ) ( not ( = ?auto_480225 ?auto_480227 ) ) ( not ( = ?auto_480225 ?auto_480229 ) ) ( not ( = ?auto_480225 ?auto_480228 ) ) ( not ( = ?auto_480225 ?auto_480230 ) ) ( not ( = ?auto_480226 ?auto_480227 ) ) ( not ( = ?auto_480226 ?auto_480229 ) ) ( not ( = ?auto_480226 ?auto_480228 ) ) ( not ( = ?auto_480226 ?auto_480230 ) ) ( not ( = ?auto_480227 ?auto_480229 ) ) ( not ( = ?auto_480227 ?auto_480228 ) ) ( not ( = ?auto_480227 ?auto_480230 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480229 ?auto_480228 ?auto_480230 )
      ( MAKE-5CRATE-VERIFY ?auto_480225 ?auto_480226 ?auto_480227 ?auto_480229 ?auto_480228 ?auto_480230 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_480265 - SURFACE
      ?auto_480266 - SURFACE
      ?auto_480267 - SURFACE
      ?auto_480269 - SURFACE
      ?auto_480268 - SURFACE
      ?auto_480270 - SURFACE
    )
    :vars
    (
      ?auto_480274 - HOIST
      ?auto_480273 - PLACE
      ?auto_480272 - TRUCK
      ?auto_480271 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_480274 ?auto_480273 ) ( SURFACE-AT ?auto_480268 ?auto_480273 ) ( CLEAR ?auto_480268 ) ( IS-CRATE ?auto_480270 ) ( not ( = ?auto_480268 ?auto_480270 ) ) ( AVAILABLE ?auto_480274 ) ( IN ?auto_480270 ?auto_480272 ) ( ON ?auto_480268 ?auto_480269 ) ( not ( = ?auto_480269 ?auto_480268 ) ) ( not ( = ?auto_480269 ?auto_480270 ) ) ( TRUCK-AT ?auto_480272 ?auto_480271 ) ( not ( = ?auto_480271 ?auto_480273 ) ) ( ON ?auto_480266 ?auto_480265 ) ( ON ?auto_480267 ?auto_480266 ) ( ON ?auto_480269 ?auto_480267 ) ( not ( = ?auto_480265 ?auto_480266 ) ) ( not ( = ?auto_480265 ?auto_480267 ) ) ( not ( = ?auto_480265 ?auto_480269 ) ) ( not ( = ?auto_480265 ?auto_480268 ) ) ( not ( = ?auto_480265 ?auto_480270 ) ) ( not ( = ?auto_480266 ?auto_480267 ) ) ( not ( = ?auto_480266 ?auto_480269 ) ) ( not ( = ?auto_480266 ?auto_480268 ) ) ( not ( = ?auto_480266 ?auto_480270 ) ) ( not ( = ?auto_480267 ?auto_480269 ) ) ( not ( = ?auto_480267 ?auto_480268 ) ) ( not ( = ?auto_480267 ?auto_480270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480269 ?auto_480268 ?auto_480270 )
      ( MAKE-5CRATE-VERIFY ?auto_480265 ?auto_480266 ?auto_480267 ?auto_480269 ?auto_480268 ?auto_480270 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_480310 - SURFACE
      ?auto_480311 - SURFACE
      ?auto_480312 - SURFACE
      ?auto_480314 - SURFACE
      ?auto_480313 - SURFACE
      ?auto_480315 - SURFACE
    )
    :vars
    (
      ?auto_480317 - HOIST
      ?auto_480318 - PLACE
      ?auto_480316 - TRUCK
      ?auto_480319 - PLACE
      ?auto_480320 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_480317 ?auto_480318 ) ( SURFACE-AT ?auto_480313 ?auto_480318 ) ( CLEAR ?auto_480313 ) ( IS-CRATE ?auto_480315 ) ( not ( = ?auto_480313 ?auto_480315 ) ) ( AVAILABLE ?auto_480317 ) ( ON ?auto_480313 ?auto_480314 ) ( not ( = ?auto_480314 ?auto_480313 ) ) ( not ( = ?auto_480314 ?auto_480315 ) ) ( TRUCK-AT ?auto_480316 ?auto_480319 ) ( not ( = ?auto_480319 ?auto_480318 ) ) ( HOIST-AT ?auto_480320 ?auto_480319 ) ( LIFTING ?auto_480320 ?auto_480315 ) ( not ( = ?auto_480317 ?auto_480320 ) ) ( ON ?auto_480311 ?auto_480310 ) ( ON ?auto_480312 ?auto_480311 ) ( ON ?auto_480314 ?auto_480312 ) ( not ( = ?auto_480310 ?auto_480311 ) ) ( not ( = ?auto_480310 ?auto_480312 ) ) ( not ( = ?auto_480310 ?auto_480314 ) ) ( not ( = ?auto_480310 ?auto_480313 ) ) ( not ( = ?auto_480310 ?auto_480315 ) ) ( not ( = ?auto_480311 ?auto_480312 ) ) ( not ( = ?auto_480311 ?auto_480314 ) ) ( not ( = ?auto_480311 ?auto_480313 ) ) ( not ( = ?auto_480311 ?auto_480315 ) ) ( not ( = ?auto_480312 ?auto_480314 ) ) ( not ( = ?auto_480312 ?auto_480313 ) ) ( not ( = ?auto_480312 ?auto_480315 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480314 ?auto_480313 ?auto_480315 )
      ( MAKE-5CRATE-VERIFY ?auto_480310 ?auto_480311 ?auto_480312 ?auto_480314 ?auto_480313 ?auto_480315 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_480360 - SURFACE
      ?auto_480361 - SURFACE
      ?auto_480362 - SURFACE
      ?auto_480364 - SURFACE
      ?auto_480363 - SURFACE
      ?auto_480365 - SURFACE
    )
    :vars
    (
      ?auto_480367 - HOIST
      ?auto_480369 - PLACE
      ?auto_480366 - TRUCK
      ?auto_480371 - PLACE
      ?auto_480370 - HOIST
      ?auto_480368 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_480367 ?auto_480369 ) ( SURFACE-AT ?auto_480363 ?auto_480369 ) ( CLEAR ?auto_480363 ) ( IS-CRATE ?auto_480365 ) ( not ( = ?auto_480363 ?auto_480365 ) ) ( AVAILABLE ?auto_480367 ) ( ON ?auto_480363 ?auto_480364 ) ( not ( = ?auto_480364 ?auto_480363 ) ) ( not ( = ?auto_480364 ?auto_480365 ) ) ( TRUCK-AT ?auto_480366 ?auto_480371 ) ( not ( = ?auto_480371 ?auto_480369 ) ) ( HOIST-AT ?auto_480370 ?auto_480371 ) ( not ( = ?auto_480367 ?auto_480370 ) ) ( AVAILABLE ?auto_480370 ) ( SURFACE-AT ?auto_480365 ?auto_480371 ) ( ON ?auto_480365 ?auto_480368 ) ( CLEAR ?auto_480365 ) ( not ( = ?auto_480363 ?auto_480368 ) ) ( not ( = ?auto_480365 ?auto_480368 ) ) ( not ( = ?auto_480364 ?auto_480368 ) ) ( ON ?auto_480361 ?auto_480360 ) ( ON ?auto_480362 ?auto_480361 ) ( ON ?auto_480364 ?auto_480362 ) ( not ( = ?auto_480360 ?auto_480361 ) ) ( not ( = ?auto_480360 ?auto_480362 ) ) ( not ( = ?auto_480360 ?auto_480364 ) ) ( not ( = ?auto_480360 ?auto_480363 ) ) ( not ( = ?auto_480360 ?auto_480365 ) ) ( not ( = ?auto_480360 ?auto_480368 ) ) ( not ( = ?auto_480361 ?auto_480362 ) ) ( not ( = ?auto_480361 ?auto_480364 ) ) ( not ( = ?auto_480361 ?auto_480363 ) ) ( not ( = ?auto_480361 ?auto_480365 ) ) ( not ( = ?auto_480361 ?auto_480368 ) ) ( not ( = ?auto_480362 ?auto_480364 ) ) ( not ( = ?auto_480362 ?auto_480363 ) ) ( not ( = ?auto_480362 ?auto_480365 ) ) ( not ( = ?auto_480362 ?auto_480368 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480364 ?auto_480363 ?auto_480365 )
      ( MAKE-5CRATE-VERIFY ?auto_480360 ?auto_480361 ?auto_480362 ?auto_480364 ?auto_480363 ?auto_480365 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_480411 - SURFACE
      ?auto_480412 - SURFACE
      ?auto_480413 - SURFACE
      ?auto_480415 - SURFACE
      ?auto_480414 - SURFACE
      ?auto_480416 - SURFACE
    )
    :vars
    (
      ?auto_480418 - HOIST
      ?auto_480417 - PLACE
      ?auto_480419 - PLACE
      ?auto_480420 - HOIST
      ?auto_480421 - SURFACE
      ?auto_480422 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_480418 ?auto_480417 ) ( SURFACE-AT ?auto_480414 ?auto_480417 ) ( CLEAR ?auto_480414 ) ( IS-CRATE ?auto_480416 ) ( not ( = ?auto_480414 ?auto_480416 ) ) ( AVAILABLE ?auto_480418 ) ( ON ?auto_480414 ?auto_480415 ) ( not ( = ?auto_480415 ?auto_480414 ) ) ( not ( = ?auto_480415 ?auto_480416 ) ) ( not ( = ?auto_480419 ?auto_480417 ) ) ( HOIST-AT ?auto_480420 ?auto_480419 ) ( not ( = ?auto_480418 ?auto_480420 ) ) ( AVAILABLE ?auto_480420 ) ( SURFACE-AT ?auto_480416 ?auto_480419 ) ( ON ?auto_480416 ?auto_480421 ) ( CLEAR ?auto_480416 ) ( not ( = ?auto_480414 ?auto_480421 ) ) ( not ( = ?auto_480416 ?auto_480421 ) ) ( not ( = ?auto_480415 ?auto_480421 ) ) ( TRUCK-AT ?auto_480422 ?auto_480417 ) ( ON ?auto_480412 ?auto_480411 ) ( ON ?auto_480413 ?auto_480412 ) ( ON ?auto_480415 ?auto_480413 ) ( not ( = ?auto_480411 ?auto_480412 ) ) ( not ( = ?auto_480411 ?auto_480413 ) ) ( not ( = ?auto_480411 ?auto_480415 ) ) ( not ( = ?auto_480411 ?auto_480414 ) ) ( not ( = ?auto_480411 ?auto_480416 ) ) ( not ( = ?auto_480411 ?auto_480421 ) ) ( not ( = ?auto_480412 ?auto_480413 ) ) ( not ( = ?auto_480412 ?auto_480415 ) ) ( not ( = ?auto_480412 ?auto_480414 ) ) ( not ( = ?auto_480412 ?auto_480416 ) ) ( not ( = ?auto_480412 ?auto_480421 ) ) ( not ( = ?auto_480413 ?auto_480415 ) ) ( not ( = ?auto_480413 ?auto_480414 ) ) ( not ( = ?auto_480413 ?auto_480416 ) ) ( not ( = ?auto_480413 ?auto_480421 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480415 ?auto_480414 ?auto_480416 )
      ( MAKE-5CRATE-VERIFY ?auto_480411 ?auto_480412 ?auto_480413 ?auto_480415 ?auto_480414 ?auto_480416 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_480462 - SURFACE
      ?auto_480463 - SURFACE
      ?auto_480464 - SURFACE
      ?auto_480466 - SURFACE
      ?auto_480465 - SURFACE
      ?auto_480467 - SURFACE
    )
    :vars
    (
      ?auto_480472 - HOIST
      ?auto_480473 - PLACE
      ?auto_480469 - PLACE
      ?auto_480471 - HOIST
      ?auto_480470 - SURFACE
      ?auto_480468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_480472 ?auto_480473 ) ( IS-CRATE ?auto_480467 ) ( not ( = ?auto_480465 ?auto_480467 ) ) ( not ( = ?auto_480466 ?auto_480465 ) ) ( not ( = ?auto_480466 ?auto_480467 ) ) ( not ( = ?auto_480469 ?auto_480473 ) ) ( HOIST-AT ?auto_480471 ?auto_480469 ) ( not ( = ?auto_480472 ?auto_480471 ) ) ( AVAILABLE ?auto_480471 ) ( SURFACE-AT ?auto_480467 ?auto_480469 ) ( ON ?auto_480467 ?auto_480470 ) ( CLEAR ?auto_480467 ) ( not ( = ?auto_480465 ?auto_480470 ) ) ( not ( = ?auto_480467 ?auto_480470 ) ) ( not ( = ?auto_480466 ?auto_480470 ) ) ( TRUCK-AT ?auto_480468 ?auto_480473 ) ( SURFACE-AT ?auto_480466 ?auto_480473 ) ( CLEAR ?auto_480466 ) ( LIFTING ?auto_480472 ?auto_480465 ) ( IS-CRATE ?auto_480465 ) ( ON ?auto_480463 ?auto_480462 ) ( ON ?auto_480464 ?auto_480463 ) ( ON ?auto_480466 ?auto_480464 ) ( not ( = ?auto_480462 ?auto_480463 ) ) ( not ( = ?auto_480462 ?auto_480464 ) ) ( not ( = ?auto_480462 ?auto_480466 ) ) ( not ( = ?auto_480462 ?auto_480465 ) ) ( not ( = ?auto_480462 ?auto_480467 ) ) ( not ( = ?auto_480462 ?auto_480470 ) ) ( not ( = ?auto_480463 ?auto_480464 ) ) ( not ( = ?auto_480463 ?auto_480466 ) ) ( not ( = ?auto_480463 ?auto_480465 ) ) ( not ( = ?auto_480463 ?auto_480467 ) ) ( not ( = ?auto_480463 ?auto_480470 ) ) ( not ( = ?auto_480464 ?auto_480466 ) ) ( not ( = ?auto_480464 ?auto_480465 ) ) ( not ( = ?auto_480464 ?auto_480467 ) ) ( not ( = ?auto_480464 ?auto_480470 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480466 ?auto_480465 ?auto_480467 )
      ( MAKE-5CRATE-VERIFY ?auto_480462 ?auto_480463 ?auto_480464 ?auto_480466 ?auto_480465 ?auto_480467 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_480513 - SURFACE
      ?auto_480514 - SURFACE
      ?auto_480515 - SURFACE
      ?auto_480517 - SURFACE
      ?auto_480516 - SURFACE
      ?auto_480518 - SURFACE
    )
    :vars
    (
      ?auto_480523 - HOIST
      ?auto_480521 - PLACE
      ?auto_480519 - PLACE
      ?auto_480524 - HOIST
      ?auto_480520 - SURFACE
      ?auto_480522 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_480523 ?auto_480521 ) ( IS-CRATE ?auto_480518 ) ( not ( = ?auto_480516 ?auto_480518 ) ) ( not ( = ?auto_480517 ?auto_480516 ) ) ( not ( = ?auto_480517 ?auto_480518 ) ) ( not ( = ?auto_480519 ?auto_480521 ) ) ( HOIST-AT ?auto_480524 ?auto_480519 ) ( not ( = ?auto_480523 ?auto_480524 ) ) ( AVAILABLE ?auto_480524 ) ( SURFACE-AT ?auto_480518 ?auto_480519 ) ( ON ?auto_480518 ?auto_480520 ) ( CLEAR ?auto_480518 ) ( not ( = ?auto_480516 ?auto_480520 ) ) ( not ( = ?auto_480518 ?auto_480520 ) ) ( not ( = ?auto_480517 ?auto_480520 ) ) ( TRUCK-AT ?auto_480522 ?auto_480521 ) ( SURFACE-AT ?auto_480517 ?auto_480521 ) ( CLEAR ?auto_480517 ) ( IS-CRATE ?auto_480516 ) ( AVAILABLE ?auto_480523 ) ( IN ?auto_480516 ?auto_480522 ) ( ON ?auto_480514 ?auto_480513 ) ( ON ?auto_480515 ?auto_480514 ) ( ON ?auto_480517 ?auto_480515 ) ( not ( = ?auto_480513 ?auto_480514 ) ) ( not ( = ?auto_480513 ?auto_480515 ) ) ( not ( = ?auto_480513 ?auto_480517 ) ) ( not ( = ?auto_480513 ?auto_480516 ) ) ( not ( = ?auto_480513 ?auto_480518 ) ) ( not ( = ?auto_480513 ?auto_480520 ) ) ( not ( = ?auto_480514 ?auto_480515 ) ) ( not ( = ?auto_480514 ?auto_480517 ) ) ( not ( = ?auto_480514 ?auto_480516 ) ) ( not ( = ?auto_480514 ?auto_480518 ) ) ( not ( = ?auto_480514 ?auto_480520 ) ) ( not ( = ?auto_480515 ?auto_480517 ) ) ( not ( = ?auto_480515 ?auto_480516 ) ) ( not ( = ?auto_480515 ?auto_480518 ) ) ( not ( = ?auto_480515 ?auto_480520 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_480517 ?auto_480516 ?auto_480518 )
      ( MAKE-5CRATE-VERIFY ?auto_480513 ?auto_480514 ?auto_480515 ?auto_480517 ?auto_480516 ?auto_480518 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_481505 - SURFACE
      ?auto_481506 - SURFACE
    )
    :vars
    (
      ?auto_481507 - HOIST
      ?auto_481512 - PLACE
      ?auto_481509 - SURFACE
      ?auto_481513 - PLACE
      ?auto_481511 - HOIST
      ?auto_481508 - SURFACE
      ?auto_481510 - TRUCK
      ?auto_481514 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_481507 ?auto_481512 ) ( SURFACE-AT ?auto_481505 ?auto_481512 ) ( CLEAR ?auto_481505 ) ( IS-CRATE ?auto_481506 ) ( not ( = ?auto_481505 ?auto_481506 ) ) ( ON ?auto_481505 ?auto_481509 ) ( not ( = ?auto_481509 ?auto_481505 ) ) ( not ( = ?auto_481509 ?auto_481506 ) ) ( not ( = ?auto_481513 ?auto_481512 ) ) ( HOIST-AT ?auto_481511 ?auto_481513 ) ( not ( = ?auto_481507 ?auto_481511 ) ) ( AVAILABLE ?auto_481511 ) ( SURFACE-AT ?auto_481506 ?auto_481513 ) ( ON ?auto_481506 ?auto_481508 ) ( CLEAR ?auto_481506 ) ( not ( = ?auto_481505 ?auto_481508 ) ) ( not ( = ?auto_481506 ?auto_481508 ) ) ( not ( = ?auto_481509 ?auto_481508 ) ) ( TRUCK-AT ?auto_481510 ?auto_481512 ) ( LIFTING ?auto_481507 ?auto_481514 ) ( IS-CRATE ?auto_481514 ) ( not ( = ?auto_481505 ?auto_481514 ) ) ( not ( = ?auto_481506 ?auto_481514 ) ) ( not ( = ?auto_481509 ?auto_481514 ) ) ( not ( = ?auto_481508 ?auto_481514 ) ) )
    :subtasks
    ( ( !LOAD ?auto_481507 ?auto_481514 ?auto_481510 ?auto_481512 )
      ( MAKE-1CRATE ?auto_481505 ?auto_481506 )
      ( MAKE-1CRATE-VERIFY ?auto_481505 ?auto_481506 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_481720 - SURFACE
      ?auto_481721 - SURFACE
      ?auto_481722 - SURFACE
      ?auto_481724 - SURFACE
      ?auto_481723 - SURFACE
      ?auto_481725 - SURFACE
      ?auto_481726 - SURFACE
    )
    :vars
    (
      ?auto_481728 - HOIST
      ?auto_481727 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_481728 ?auto_481727 ) ( SURFACE-AT ?auto_481725 ?auto_481727 ) ( CLEAR ?auto_481725 ) ( LIFTING ?auto_481728 ?auto_481726 ) ( IS-CRATE ?auto_481726 ) ( not ( = ?auto_481725 ?auto_481726 ) ) ( ON ?auto_481721 ?auto_481720 ) ( ON ?auto_481722 ?auto_481721 ) ( ON ?auto_481724 ?auto_481722 ) ( ON ?auto_481723 ?auto_481724 ) ( ON ?auto_481725 ?auto_481723 ) ( not ( = ?auto_481720 ?auto_481721 ) ) ( not ( = ?auto_481720 ?auto_481722 ) ) ( not ( = ?auto_481720 ?auto_481724 ) ) ( not ( = ?auto_481720 ?auto_481723 ) ) ( not ( = ?auto_481720 ?auto_481725 ) ) ( not ( = ?auto_481720 ?auto_481726 ) ) ( not ( = ?auto_481721 ?auto_481722 ) ) ( not ( = ?auto_481721 ?auto_481724 ) ) ( not ( = ?auto_481721 ?auto_481723 ) ) ( not ( = ?auto_481721 ?auto_481725 ) ) ( not ( = ?auto_481721 ?auto_481726 ) ) ( not ( = ?auto_481722 ?auto_481724 ) ) ( not ( = ?auto_481722 ?auto_481723 ) ) ( not ( = ?auto_481722 ?auto_481725 ) ) ( not ( = ?auto_481722 ?auto_481726 ) ) ( not ( = ?auto_481724 ?auto_481723 ) ) ( not ( = ?auto_481724 ?auto_481725 ) ) ( not ( = ?auto_481724 ?auto_481726 ) ) ( not ( = ?auto_481723 ?auto_481725 ) ) ( not ( = ?auto_481723 ?auto_481726 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_481725 ?auto_481726 )
      ( MAKE-6CRATE-VERIFY ?auto_481720 ?auto_481721 ?auto_481722 ?auto_481724 ?auto_481723 ?auto_481725 ?auto_481726 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_481764 - SURFACE
      ?auto_481765 - SURFACE
      ?auto_481766 - SURFACE
      ?auto_481768 - SURFACE
      ?auto_481767 - SURFACE
      ?auto_481769 - SURFACE
      ?auto_481770 - SURFACE
    )
    :vars
    (
      ?auto_481772 - HOIST
      ?auto_481773 - PLACE
      ?auto_481771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_481772 ?auto_481773 ) ( SURFACE-AT ?auto_481769 ?auto_481773 ) ( CLEAR ?auto_481769 ) ( IS-CRATE ?auto_481770 ) ( not ( = ?auto_481769 ?auto_481770 ) ) ( TRUCK-AT ?auto_481771 ?auto_481773 ) ( AVAILABLE ?auto_481772 ) ( IN ?auto_481770 ?auto_481771 ) ( ON ?auto_481769 ?auto_481767 ) ( not ( = ?auto_481767 ?auto_481769 ) ) ( not ( = ?auto_481767 ?auto_481770 ) ) ( ON ?auto_481765 ?auto_481764 ) ( ON ?auto_481766 ?auto_481765 ) ( ON ?auto_481768 ?auto_481766 ) ( ON ?auto_481767 ?auto_481768 ) ( not ( = ?auto_481764 ?auto_481765 ) ) ( not ( = ?auto_481764 ?auto_481766 ) ) ( not ( = ?auto_481764 ?auto_481768 ) ) ( not ( = ?auto_481764 ?auto_481767 ) ) ( not ( = ?auto_481764 ?auto_481769 ) ) ( not ( = ?auto_481764 ?auto_481770 ) ) ( not ( = ?auto_481765 ?auto_481766 ) ) ( not ( = ?auto_481765 ?auto_481768 ) ) ( not ( = ?auto_481765 ?auto_481767 ) ) ( not ( = ?auto_481765 ?auto_481769 ) ) ( not ( = ?auto_481765 ?auto_481770 ) ) ( not ( = ?auto_481766 ?auto_481768 ) ) ( not ( = ?auto_481766 ?auto_481767 ) ) ( not ( = ?auto_481766 ?auto_481769 ) ) ( not ( = ?auto_481766 ?auto_481770 ) ) ( not ( = ?auto_481768 ?auto_481767 ) ) ( not ( = ?auto_481768 ?auto_481769 ) ) ( not ( = ?auto_481768 ?auto_481770 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_481767 ?auto_481769 ?auto_481770 )
      ( MAKE-6CRATE-VERIFY ?auto_481764 ?auto_481765 ?auto_481766 ?auto_481768 ?auto_481767 ?auto_481769 ?auto_481770 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_481815 - SURFACE
      ?auto_481816 - SURFACE
      ?auto_481817 - SURFACE
      ?auto_481819 - SURFACE
      ?auto_481818 - SURFACE
      ?auto_481820 - SURFACE
      ?auto_481821 - SURFACE
    )
    :vars
    (
      ?auto_481823 - HOIST
      ?auto_481824 - PLACE
      ?auto_481825 - TRUCK
      ?auto_481822 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_481823 ?auto_481824 ) ( SURFACE-AT ?auto_481820 ?auto_481824 ) ( CLEAR ?auto_481820 ) ( IS-CRATE ?auto_481821 ) ( not ( = ?auto_481820 ?auto_481821 ) ) ( AVAILABLE ?auto_481823 ) ( IN ?auto_481821 ?auto_481825 ) ( ON ?auto_481820 ?auto_481818 ) ( not ( = ?auto_481818 ?auto_481820 ) ) ( not ( = ?auto_481818 ?auto_481821 ) ) ( TRUCK-AT ?auto_481825 ?auto_481822 ) ( not ( = ?auto_481822 ?auto_481824 ) ) ( ON ?auto_481816 ?auto_481815 ) ( ON ?auto_481817 ?auto_481816 ) ( ON ?auto_481819 ?auto_481817 ) ( ON ?auto_481818 ?auto_481819 ) ( not ( = ?auto_481815 ?auto_481816 ) ) ( not ( = ?auto_481815 ?auto_481817 ) ) ( not ( = ?auto_481815 ?auto_481819 ) ) ( not ( = ?auto_481815 ?auto_481818 ) ) ( not ( = ?auto_481815 ?auto_481820 ) ) ( not ( = ?auto_481815 ?auto_481821 ) ) ( not ( = ?auto_481816 ?auto_481817 ) ) ( not ( = ?auto_481816 ?auto_481819 ) ) ( not ( = ?auto_481816 ?auto_481818 ) ) ( not ( = ?auto_481816 ?auto_481820 ) ) ( not ( = ?auto_481816 ?auto_481821 ) ) ( not ( = ?auto_481817 ?auto_481819 ) ) ( not ( = ?auto_481817 ?auto_481818 ) ) ( not ( = ?auto_481817 ?auto_481820 ) ) ( not ( = ?auto_481817 ?auto_481821 ) ) ( not ( = ?auto_481819 ?auto_481818 ) ) ( not ( = ?auto_481819 ?auto_481820 ) ) ( not ( = ?auto_481819 ?auto_481821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_481818 ?auto_481820 ?auto_481821 )
      ( MAKE-6CRATE-VERIFY ?auto_481815 ?auto_481816 ?auto_481817 ?auto_481819 ?auto_481818 ?auto_481820 ?auto_481821 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_481872 - SURFACE
      ?auto_481873 - SURFACE
      ?auto_481874 - SURFACE
      ?auto_481876 - SURFACE
      ?auto_481875 - SURFACE
      ?auto_481877 - SURFACE
      ?auto_481878 - SURFACE
    )
    :vars
    (
      ?auto_481881 - HOIST
      ?auto_481882 - PLACE
      ?auto_481880 - TRUCK
      ?auto_481879 - PLACE
      ?auto_481883 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_481881 ?auto_481882 ) ( SURFACE-AT ?auto_481877 ?auto_481882 ) ( CLEAR ?auto_481877 ) ( IS-CRATE ?auto_481878 ) ( not ( = ?auto_481877 ?auto_481878 ) ) ( AVAILABLE ?auto_481881 ) ( ON ?auto_481877 ?auto_481875 ) ( not ( = ?auto_481875 ?auto_481877 ) ) ( not ( = ?auto_481875 ?auto_481878 ) ) ( TRUCK-AT ?auto_481880 ?auto_481879 ) ( not ( = ?auto_481879 ?auto_481882 ) ) ( HOIST-AT ?auto_481883 ?auto_481879 ) ( LIFTING ?auto_481883 ?auto_481878 ) ( not ( = ?auto_481881 ?auto_481883 ) ) ( ON ?auto_481873 ?auto_481872 ) ( ON ?auto_481874 ?auto_481873 ) ( ON ?auto_481876 ?auto_481874 ) ( ON ?auto_481875 ?auto_481876 ) ( not ( = ?auto_481872 ?auto_481873 ) ) ( not ( = ?auto_481872 ?auto_481874 ) ) ( not ( = ?auto_481872 ?auto_481876 ) ) ( not ( = ?auto_481872 ?auto_481875 ) ) ( not ( = ?auto_481872 ?auto_481877 ) ) ( not ( = ?auto_481872 ?auto_481878 ) ) ( not ( = ?auto_481873 ?auto_481874 ) ) ( not ( = ?auto_481873 ?auto_481876 ) ) ( not ( = ?auto_481873 ?auto_481875 ) ) ( not ( = ?auto_481873 ?auto_481877 ) ) ( not ( = ?auto_481873 ?auto_481878 ) ) ( not ( = ?auto_481874 ?auto_481876 ) ) ( not ( = ?auto_481874 ?auto_481875 ) ) ( not ( = ?auto_481874 ?auto_481877 ) ) ( not ( = ?auto_481874 ?auto_481878 ) ) ( not ( = ?auto_481876 ?auto_481875 ) ) ( not ( = ?auto_481876 ?auto_481877 ) ) ( not ( = ?auto_481876 ?auto_481878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_481875 ?auto_481877 ?auto_481878 )
      ( MAKE-6CRATE-VERIFY ?auto_481872 ?auto_481873 ?auto_481874 ?auto_481876 ?auto_481875 ?auto_481877 ?auto_481878 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_481935 - SURFACE
      ?auto_481936 - SURFACE
      ?auto_481937 - SURFACE
      ?auto_481939 - SURFACE
      ?auto_481938 - SURFACE
      ?auto_481940 - SURFACE
      ?auto_481941 - SURFACE
    )
    :vars
    (
      ?auto_481943 - HOIST
      ?auto_481944 - PLACE
      ?auto_481945 - TRUCK
      ?auto_481942 - PLACE
      ?auto_481946 - HOIST
      ?auto_481947 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_481943 ?auto_481944 ) ( SURFACE-AT ?auto_481940 ?auto_481944 ) ( CLEAR ?auto_481940 ) ( IS-CRATE ?auto_481941 ) ( not ( = ?auto_481940 ?auto_481941 ) ) ( AVAILABLE ?auto_481943 ) ( ON ?auto_481940 ?auto_481938 ) ( not ( = ?auto_481938 ?auto_481940 ) ) ( not ( = ?auto_481938 ?auto_481941 ) ) ( TRUCK-AT ?auto_481945 ?auto_481942 ) ( not ( = ?auto_481942 ?auto_481944 ) ) ( HOIST-AT ?auto_481946 ?auto_481942 ) ( not ( = ?auto_481943 ?auto_481946 ) ) ( AVAILABLE ?auto_481946 ) ( SURFACE-AT ?auto_481941 ?auto_481942 ) ( ON ?auto_481941 ?auto_481947 ) ( CLEAR ?auto_481941 ) ( not ( = ?auto_481940 ?auto_481947 ) ) ( not ( = ?auto_481941 ?auto_481947 ) ) ( not ( = ?auto_481938 ?auto_481947 ) ) ( ON ?auto_481936 ?auto_481935 ) ( ON ?auto_481937 ?auto_481936 ) ( ON ?auto_481939 ?auto_481937 ) ( ON ?auto_481938 ?auto_481939 ) ( not ( = ?auto_481935 ?auto_481936 ) ) ( not ( = ?auto_481935 ?auto_481937 ) ) ( not ( = ?auto_481935 ?auto_481939 ) ) ( not ( = ?auto_481935 ?auto_481938 ) ) ( not ( = ?auto_481935 ?auto_481940 ) ) ( not ( = ?auto_481935 ?auto_481941 ) ) ( not ( = ?auto_481935 ?auto_481947 ) ) ( not ( = ?auto_481936 ?auto_481937 ) ) ( not ( = ?auto_481936 ?auto_481939 ) ) ( not ( = ?auto_481936 ?auto_481938 ) ) ( not ( = ?auto_481936 ?auto_481940 ) ) ( not ( = ?auto_481936 ?auto_481941 ) ) ( not ( = ?auto_481936 ?auto_481947 ) ) ( not ( = ?auto_481937 ?auto_481939 ) ) ( not ( = ?auto_481937 ?auto_481938 ) ) ( not ( = ?auto_481937 ?auto_481940 ) ) ( not ( = ?auto_481937 ?auto_481941 ) ) ( not ( = ?auto_481937 ?auto_481947 ) ) ( not ( = ?auto_481939 ?auto_481938 ) ) ( not ( = ?auto_481939 ?auto_481940 ) ) ( not ( = ?auto_481939 ?auto_481941 ) ) ( not ( = ?auto_481939 ?auto_481947 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_481938 ?auto_481940 ?auto_481941 )
      ( MAKE-6CRATE-VERIFY ?auto_481935 ?auto_481936 ?auto_481937 ?auto_481939 ?auto_481938 ?auto_481940 ?auto_481941 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_481999 - SURFACE
      ?auto_482000 - SURFACE
      ?auto_482001 - SURFACE
      ?auto_482003 - SURFACE
      ?auto_482002 - SURFACE
      ?auto_482004 - SURFACE
      ?auto_482005 - SURFACE
    )
    :vars
    (
      ?auto_482011 - HOIST
      ?auto_482010 - PLACE
      ?auto_482006 - PLACE
      ?auto_482008 - HOIST
      ?auto_482007 - SURFACE
      ?auto_482009 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_482011 ?auto_482010 ) ( SURFACE-AT ?auto_482004 ?auto_482010 ) ( CLEAR ?auto_482004 ) ( IS-CRATE ?auto_482005 ) ( not ( = ?auto_482004 ?auto_482005 ) ) ( AVAILABLE ?auto_482011 ) ( ON ?auto_482004 ?auto_482002 ) ( not ( = ?auto_482002 ?auto_482004 ) ) ( not ( = ?auto_482002 ?auto_482005 ) ) ( not ( = ?auto_482006 ?auto_482010 ) ) ( HOIST-AT ?auto_482008 ?auto_482006 ) ( not ( = ?auto_482011 ?auto_482008 ) ) ( AVAILABLE ?auto_482008 ) ( SURFACE-AT ?auto_482005 ?auto_482006 ) ( ON ?auto_482005 ?auto_482007 ) ( CLEAR ?auto_482005 ) ( not ( = ?auto_482004 ?auto_482007 ) ) ( not ( = ?auto_482005 ?auto_482007 ) ) ( not ( = ?auto_482002 ?auto_482007 ) ) ( TRUCK-AT ?auto_482009 ?auto_482010 ) ( ON ?auto_482000 ?auto_481999 ) ( ON ?auto_482001 ?auto_482000 ) ( ON ?auto_482003 ?auto_482001 ) ( ON ?auto_482002 ?auto_482003 ) ( not ( = ?auto_481999 ?auto_482000 ) ) ( not ( = ?auto_481999 ?auto_482001 ) ) ( not ( = ?auto_481999 ?auto_482003 ) ) ( not ( = ?auto_481999 ?auto_482002 ) ) ( not ( = ?auto_481999 ?auto_482004 ) ) ( not ( = ?auto_481999 ?auto_482005 ) ) ( not ( = ?auto_481999 ?auto_482007 ) ) ( not ( = ?auto_482000 ?auto_482001 ) ) ( not ( = ?auto_482000 ?auto_482003 ) ) ( not ( = ?auto_482000 ?auto_482002 ) ) ( not ( = ?auto_482000 ?auto_482004 ) ) ( not ( = ?auto_482000 ?auto_482005 ) ) ( not ( = ?auto_482000 ?auto_482007 ) ) ( not ( = ?auto_482001 ?auto_482003 ) ) ( not ( = ?auto_482001 ?auto_482002 ) ) ( not ( = ?auto_482001 ?auto_482004 ) ) ( not ( = ?auto_482001 ?auto_482005 ) ) ( not ( = ?auto_482001 ?auto_482007 ) ) ( not ( = ?auto_482003 ?auto_482002 ) ) ( not ( = ?auto_482003 ?auto_482004 ) ) ( not ( = ?auto_482003 ?auto_482005 ) ) ( not ( = ?auto_482003 ?auto_482007 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_482002 ?auto_482004 ?auto_482005 )
      ( MAKE-6CRATE-VERIFY ?auto_481999 ?auto_482000 ?auto_482001 ?auto_482003 ?auto_482002 ?auto_482004 ?auto_482005 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_482063 - SURFACE
      ?auto_482064 - SURFACE
      ?auto_482065 - SURFACE
      ?auto_482067 - SURFACE
      ?auto_482066 - SURFACE
      ?auto_482068 - SURFACE
      ?auto_482069 - SURFACE
    )
    :vars
    (
      ?auto_482073 - HOIST
      ?auto_482070 - PLACE
      ?auto_482075 - PLACE
      ?auto_482071 - HOIST
      ?auto_482072 - SURFACE
      ?auto_482074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_482073 ?auto_482070 ) ( IS-CRATE ?auto_482069 ) ( not ( = ?auto_482068 ?auto_482069 ) ) ( not ( = ?auto_482066 ?auto_482068 ) ) ( not ( = ?auto_482066 ?auto_482069 ) ) ( not ( = ?auto_482075 ?auto_482070 ) ) ( HOIST-AT ?auto_482071 ?auto_482075 ) ( not ( = ?auto_482073 ?auto_482071 ) ) ( AVAILABLE ?auto_482071 ) ( SURFACE-AT ?auto_482069 ?auto_482075 ) ( ON ?auto_482069 ?auto_482072 ) ( CLEAR ?auto_482069 ) ( not ( = ?auto_482068 ?auto_482072 ) ) ( not ( = ?auto_482069 ?auto_482072 ) ) ( not ( = ?auto_482066 ?auto_482072 ) ) ( TRUCK-AT ?auto_482074 ?auto_482070 ) ( SURFACE-AT ?auto_482066 ?auto_482070 ) ( CLEAR ?auto_482066 ) ( LIFTING ?auto_482073 ?auto_482068 ) ( IS-CRATE ?auto_482068 ) ( ON ?auto_482064 ?auto_482063 ) ( ON ?auto_482065 ?auto_482064 ) ( ON ?auto_482067 ?auto_482065 ) ( ON ?auto_482066 ?auto_482067 ) ( not ( = ?auto_482063 ?auto_482064 ) ) ( not ( = ?auto_482063 ?auto_482065 ) ) ( not ( = ?auto_482063 ?auto_482067 ) ) ( not ( = ?auto_482063 ?auto_482066 ) ) ( not ( = ?auto_482063 ?auto_482068 ) ) ( not ( = ?auto_482063 ?auto_482069 ) ) ( not ( = ?auto_482063 ?auto_482072 ) ) ( not ( = ?auto_482064 ?auto_482065 ) ) ( not ( = ?auto_482064 ?auto_482067 ) ) ( not ( = ?auto_482064 ?auto_482066 ) ) ( not ( = ?auto_482064 ?auto_482068 ) ) ( not ( = ?auto_482064 ?auto_482069 ) ) ( not ( = ?auto_482064 ?auto_482072 ) ) ( not ( = ?auto_482065 ?auto_482067 ) ) ( not ( = ?auto_482065 ?auto_482066 ) ) ( not ( = ?auto_482065 ?auto_482068 ) ) ( not ( = ?auto_482065 ?auto_482069 ) ) ( not ( = ?auto_482065 ?auto_482072 ) ) ( not ( = ?auto_482067 ?auto_482066 ) ) ( not ( = ?auto_482067 ?auto_482068 ) ) ( not ( = ?auto_482067 ?auto_482069 ) ) ( not ( = ?auto_482067 ?auto_482072 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_482066 ?auto_482068 ?auto_482069 )
      ( MAKE-6CRATE-VERIFY ?auto_482063 ?auto_482064 ?auto_482065 ?auto_482067 ?auto_482066 ?auto_482068 ?auto_482069 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_482127 - SURFACE
      ?auto_482128 - SURFACE
      ?auto_482129 - SURFACE
      ?auto_482131 - SURFACE
      ?auto_482130 - SURFACE
      ?auto_482132 - SURFACE
      ?auto_482133 - SURFACE
    )
    :vars
    (
      ?auto_482135 - HOIST
      ?auto_482139 - PLACE
      ?auto_482138 - PLACE
      ?auto_482136 - HOIST
      ?auto_482137 - SURFACE
      ?auto_482134 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_482135 ?auto_482139 ) ( IS-CRATE ?auto_482133 ) ( not ( = ?auto_482132 ?auto_482133 ) ) ( not ( = ?auto_482130 ?auto_482132 ) ) ( not ( = ?auto_482130 ?auto_482133 ) ) ( not ( = ?auto_482138 ?auto_482139 ) ) ( HOIST-AT ?auto_482136 ?auto_482138 ) ( not ( = ?auto_482135 ?auto_482136 ) ) ( AVAILABLE ?auto_482136 ) ( SURFACE-AT ?auto_482133 ?auto_482138 ) ( ON ?auto_482133 ?auto_482137 ) ( CLEAR ?auto_482133 ) ( not ( = ?auto_482132 ?auto_482137 ) ) ( not ( = ?auto_482133 ?auto_482137 ) ) ( not ( = ?auto_482130 ?auto_482137 ) ) ( TRUCK-AT ?auto_482134 ?auto_482139 ) ( SURFACE-AT ?auto_482130 ?auto_482139 ) ( CLEAR ?auto_482130 ) ( IS-CRATE ?auto_482132 ) ( AVAILABLE ?auto_482135 ) ( IN ?auto_482132 ?auto_482134 ) ( ON ?auto_482128 ?auto_482127 ) ( ON ?auto_482129 ?auto_482128 ) ( ON ?auto_482131 ?auto_482129 ) ( ON ?auto_482130 ?auto_482131 ) ( not ( = ?auto_482127 ?auto_482128 ) ) ( not ( = ?auto_482127 ?auto_482129 ) ) ( not ( = ?auto_482127 ?auto_482131 ) ) ( not ( = ?auto_482127 ?auto_482130 ) ) ( not ( = ?auto_482127 ?auto_482132 ) ) ( not ( = ?auto_482127 ?auto_482133 ) ) ( not ( = ?auto_482127 ?auto_482137 ) ) ( not ( = ?auto_482128 ?auto_482129 ) ) ( not ( = ?auto_482128 ?auto_482131 ) ) ( not ( = ?auto_482128 ?auto_482130 ) ) ( not ( = ?auto_482128 ?auto_482132 ) ) ( not ( = ?auto_482128 ?auto_482133 ) ) ( not ( = ?auto_482128 ?auto_482137 ) ) ( not ( = ?auto_482129 ?auto_482131 ) ) ( not ( = ?auto_482129 ?auto_482130 ) ) ( not ( = ?auto_482129 ?auto_482132 ) ) ( not ( = ?auto_482129 ?auto_482133 ) ) ( not ( = ?auto_482129 ?auto_482137 ) ) ( not ( = ?auto_482131 ?auto_482130 ) ) ( not ( = ?auto_482131 ?auto_482132 ) ) ( not ( = ?auto_482131 ?auto_482133 ) ) ( not ( = ?auto_482131 ?auto_482137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_482130 ?auto_482132 ?auto_482133 )
      ( MAKE-6CRATE-VERIFY ?auto_482127 ?auto_482128 ?auto_482129 ?auto_482131 ?auto_482130 ?auto_482132 ?auto_482133 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_484083 - SURFACE
      ?auto_484084 - SURFACE
      ?auto_484085 - SURFACE
      ?auto_484087 - SURFACE
      ?auto_484086 - SURFACE
      ?auto_484088 - SURFACE
      ?auto_484089 - SURFACE
      ?auto_484090 - SURFACE
    )
    :vars
    (
      ?auto_484092 - HOIST
      ?auto_484091 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_484092 ?auto_484091 ) ( SURFACE-AT ?auto_484089 ?auto_484091 ) ( CLEAR ?auto_484089 ) ( LIFTING ?auto_484092 ?auto_484090 ) ( IS-CRATE ?auto_484090 ) ( not ( = ?auto_484089 ?auto_484090 ) ) ( ON ?auto_484084 ?auto_484083 ) ( ON ?auto_484085 ?auto_484084 ) ( ON ?auto_484087 ?auto_484085 ) ( ON ?auto_484086 ?auto_484087 ) ( ON ?auto_484088 ?auto_484086 ) ( ON ?auto_484089 ?auto_484088 ) ( not ( = ?auto_484083 ?auto_484084 ) ) ( not ( = ?auto_484083 ?auto_484085 ) ) ( not ( = ?auto_484083 ?auto_484087 ) ) ( not ( = ?auto_484083 ?auto_484086 ) ) ( not ( = ?auto_484083 ?auto_484088 ) ) ( not ( = ?auto_484083 ?auto_484089 ) ) ( not ( = ?auto_484083 ?auto_484090 ) ) ( not ( = ?auto_484084 ?auto_484085 ) ) ( not ( = ?auto_484084 ?auto_484087 ) ) ( not ( = ?auto_484084 ?auto_484086 ) ) ( not ( = ?auto_484084 ?auto_484088 ) ) ( not ( = ?auto_484084 ?auto_484089 ) ) ( not ( = ?auto_484084 ?auto_484090 ) ) ( not ( = ?auto_484085 ?auto_484087 ) ) ( not ( = ?auto_484085 ?auto_484086 ) ) ( not ( = ?auto_484085 ?auto_484088 ) ) ( not ( = ?auto_484085 ?auto_484089 ) ) ( not ( = ?auto_484085 ?auto_484090 ) ) ( not ( = ?auto_484087 ?auto_484086 ) ) ( not ( = ?auto_484087 ?auto_484088 ) ) ( not ( = ?auto_484087 ?auto_484089 ) ) ( not ( = ?auto_484087 ?auto_484090 ) ) ( not ( = ?auto_484086 ?auto_484088 ) ) ( not ( = ?auto_484086 ?auto_484089 ) ) ( not ( = ?auto_484086 ?auto_484090 ) ) ( not ( = ?auto_484088 ?auto_484089 ) ) ( not ( = ?auto_484088 ?auto_484090 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_484089 ?auto_484090 )
      ( MAKE-7CRATE-VERIFY ?auto_484083 ?auto_484084 ?auto_484085 ?auto_484087 ?auto_484086 ?auto_484088 ?auto_484089 ?auto_484090 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_484138 - SURFACE
      ?auto_484139 - SURFACE
      ?auto_484140 - SURFACE
      ?auto_484142 - SURFACE
      ?auto_484141 - SURFACE
      ?auto_484143 - SURFACE
      ?auto_484144 - SURFACE
      ?auto_484145 - SURFACE
    )
    :vars
    (
      ?auto_484146 - HOIST
      ?auto_484147 - PLACE
      ?auto_484148 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_484146 ?auto_484147 ) ( SURFACE-AT ?auto_484144 ?auto_484147 ) ( CLEAR ?auto_484144 ) ( IS-CRATE ?auto_484145 ) ( not ( = ?auto_484144 ?auto_484145 ) ) ( TRUCK-AT ?auto_484148 ?auto_484147 ) ( AVAILABLE ?auto_484146 ) ( IN ?auto_484145 ?auto_484148 ) ( ON ?auto_484144 ?auto_484143 ) ( not ( = ?auto_484143 ?auto_484144 ) ) ( not ( = ?auto_484143 ?auto_484145 ) ) ( ON ?auto_484139 ?auto_484138 ) ( ON ?auto_484140 ?auto_484139 ) ( ON ?auto_484142 ?auto_484140 ) ( ON ?auto_484141 ?auto_484142 ) ( ON ?auto_484143 ?auto_484141 ) ( not ( = ?auto_484138 ?auto_484139 ) ) ( not ( = ?auto_484138 ?auto_484140 ) ) ( not ( = ?auto_484138 ?auto_484142 ) ) ( not ( = ?auto_484138 ?auto_484141 ) ) ( not ( = ?auto_484138 ?auto_484143 ) ) ( not ( = ?auto_484138 ?auto_484144 ) ) ( not ( = ?auto_484138 ?auto_484145 ) ) ( not ( = ?auto_484139 ?auto_484140 ) ) ( not ( = ?auto_484139 ?auto_484142 ) ) ( not ( = ?auto_484139 ?auto_484141 ) ) ( not ( = ?auto_484139 ?auto_484143 ) ) ( not ( = ?auto_484139 ?auto_484144 ) ) ( not ( = ?auto_484139 ?auto_484145 ) ) ( not ( = ?auto_484140 ?auto_484142 ) ) ( not ( = ?auto_484140 ?auto_484141 ) ) ( not ( = ?auto_484140 ?auto_484143 ) ) ( not ( = ?auto_484140 ?auto_484144 ) ) ( not ( = ?auto_484140 ?auto_484145 ) ) ( not ( = ?auto_484142 ?auto_484141 ) ) ( not ( = ?auto_484142 ?auto_484143 ) ) ( not ( = ?auto_484142 ?auto_484144 ) ) ( not ( = ?auto_484142 ?auto_484145 ) ) ( not ( = ?auto_484141 ?auto_484143 ) ) ( not ( = ?auto_484141 ?auto_484144 ) ) ( not ( = ?auto_484141 ?auto_484145 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_484143 ?auto_484144 ?auto_484145 )
      ( MAKE-7CRATE-VERIFY ?auto_484138 ?auto_484139 ?auto_484140 ?auto_484142 ?auto_484141 ?auto_484143 ?auto_484144 ?auto_484145 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_484201 - SURFACE
      ?auto_484202 - SURFACE
      ?auto_484203 - SURFACE
      ?auto_484205 - SURFACE
      ?auto_484204 - SURFACE
      ?auto_484206 - SURFACE
      ?auto_484207 - SURFACE
      ?auto_484208 - SURFACE
    )
    :vars
    (
      ?auto_484210 - HOIST
      ?auto_484209 - PLACE
      ?auto_484212 - TRUCK
      ?auto_484211 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_484210 ?auto_484209 ) ( SURFACE-AT ?auto_484207 ?auto_484209 ) ( CLEAR ?auto_484207 ) ( IS-CRATE ?auto_484208 ) ( not ( = ?auto_484207 ?auto_484208 ) ) ( AVAILABLE ?auto_484210 ) ( IN ?auto_484208 ?auto_484212 ) ( ON ?auto_484207 ?auto_484206 ) ( not ( = ?auto_484206 ?auto_484207 ) ) ( not ( = ?auto_484206 ?auto_484208 ) ) ( TRUCK-AT ?auto_484212 ?auto_484211 ) ( not ( = ?auto_484211 ?auto_484209 ) ) ( ON ?auto_484202 ?auto_484201 ) ( ON ?auto_484203 ?auto_484202 ) ( ON ?auto_484205 ?auto_484203 ) ( ON ?auto_484204 ?auto_484205 ) ( ON ?auto_484206 ?auto_484204 ) ( not ( = ?auto_484201 ?auto_484202 ) ) ( not ( = ?auto_484201 ?auto_484203 ) ) ( not ( = ?auto_484201 ?auto_484205 ) ) ( not ( = ?auto_484201 ?auto_484204 ) ) ( not ( = ?auto_484201 ?auto_484206 ) ) ( not ( = ?auto_484201 ?auto_484207 ) ) ( not ( = ?auto_484201 ?auto_484208 ) ) ( not ( = ?auto_484202 ?auto_484203 ) ) ( not ( = ?auto_484202 ?auto_484205 ) ) ( not ( = ?auto_484202 ?auto_484204 ) ) ( not ( = ?auto_484202 ?auto_484206 ) ) ( not ( = ?auto_484202 ?auto_484207 ) ) ( not ( = ?auto_484202 ?auto_484208 ) ) ( not ( = ?auto_484203 ?auto_484205 ) ) ( not ( = ?auto_484203 ?auto_484204 ) ) ( not ( = ?auto_484203 ?auto_484206 ) ) ( not ( = ?auto_484203 ?auto_484207 ) ) ( not ( = ?auto_484203 ?auto_484208 ) ) ( not ( = ?auto_484205 ?auto_484204 ) ) ( not ( = ?auto_484205 ?auto_484206 ) ) ( not ( = ?auto_484205 ?auto_484207 ) ) ( not ( = ?auto_484205 ?auto_484208 ) ) ( not ( = ?auto_484204 ?auto_484206 ) ) ( not ( = ?auto_484204 ?auto_484207 ) ) ( not ( = ?auto_484204 ?auto_484208 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_484206 ?auto_484207 ?auto_484208 )
      ( MAKE-7CRATE-VERIFY ?auto_484201 ?auto_484202 ?auto_484203 ?auto_484205 ?auto_484204 ?auto_484206 ?auto_484207 ?auto_484208 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_484271 - SURFACE
      ?auto_484272 - SURFACE
      ?auto_484273 - SURFACE
      ?auto_484275 - SURFACE
      ?auto_484274 - SURFACE
      ?auto_484276 - SURFACE
      ?auto_484277 - SURFACE
      ?auto_484278 - SURFACE
    )
    :vars
    (
      ?auto_484281 - HOIST
      ?auto_484279 - PLACE
      ?auto_484283 - TRUCK
      ?auto_484280 - PLACE
      ?auto_484282 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_484281 ?auto_484279 ) ( SURFACE-AT ?auto_484277 ?auto_484279 ) ( CLEAR ?auto_484277 ) ( IS-CRATE ?auto_484278 ) ( not ( = ?auto_484277 ?auto_484278 ) ) ( AVAILABLE ?auto_484281 ) ( ON ?auto_484277 ?auto_484276 ) ( not ( = ?auto_484276 ?auto_484277 ) ) ( not ( = ?auto_484276 ?auto_484278 ) ) ( TRUCK-AT ?auto_484283 ?auto_484280 ) ( not ( = ?auto_484280 ?auto_484279 ) ) ( HOIST-AT ?auto_484282 ?auto_484280 ) ( LIFTING ?auto_484282 ?auto_484278 ) ( not ( = ?auto_484281 ?auto_484282 ) ) ( ON ?auto_484272 ?auto_484271 ) ( ON ?auto_484273 ?auto_484272 ) ( ON ?auto_484275 ?auto_484273 ) ( ON ?auto_484274 ?auto_484275 ) ( ON ?auto_484276 ?auto_484274 ) ( not ( = ?auto_484271 ?auto_484272 ) ) ( not ( = ?auto_484271 ?auto_484273 ) ) ( not ( = ?auto_484271 ?auto_484275 ) ) ( not ( = ?auto_484271 ?auto_484274 ) ) ( not ( = ?auto_484271 ?auto_484276 ) ) ( not ( = ?auto_484271 ?auto_484277 ) ) ( not ( = ?auto_484271 ?auto_484278 ) ) ( not ( = ?auto_484272 ?auto_484273 ) ) ( not ( = ?auto_484272 ?auto_484275 ) ) ( not ( = ?auto_484272 ?auto_484274 ) ) ( not ( = ?auto_484272 ?auto_484276 ) ) ( not ( = ?auto_484272 ?auto_484277 ) ) ( not ( = ?auto_484272 ?auto_484278 ) ) ( not ( = ?auto_484273 ?auto_484275 ) ) ( not ( = ?auto_484273 ?auto_484274 ) ) ( not ( = ?auto_484273 ?auto_484276 ) ) ( not ( = ?auto_484273 ?auto_484277 ) ) ( not ( = ?auto_484273 ?auto_484278 ) ) ( not ( = ?auto_484275 ?auto_484274 ) ) ( not ( = ?auto_484275 ?auto_484276 ) ) ( not ( = ?auto_484275 ?auto_484277 ) ) ( not ( = ?auto_484275 ?auto_484278 ) ) ( not ( = ?auto_484274 ?auto_484276 ) ) ( not ( = ?auto_484274 ?auto_484277 ) ) ( not ( = ?auto_484274 ?auto_484278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_484276 ?auto_484277 ?auto_484278 )
      ( MAKE-7CRATE-VERIFY ?auto_484271 ?auto_484272 ?auto_484273 ?auto_484275 ?auto_484274 ?auto_484276 ?auto_484277 ?auto_484278 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_484348 - SURFACE
      ?auto_484349 - SURFACE
      ?auto_484350 - SURFACE
      ?auto_484352 - SURFACE
      ?auto_484351 - SURFACE
      ?auto_484353 - SURFACE
      ?auto_484354 - SURFACE
      ?auto_484355 - SURFACE
    )
    :vars
    (
      ?auto_484358 - HOIST
      ?auto_484359 - PLACE
      ?auto_484357 - TRUCK
      ?auto_484356 - PLACE
      ?auto_484361 - HOIST
      ?auto_484360 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_484358 ?auto_484359 ) ( SURFACE-AT ?auto_484354 ?auto_484359 ) ( CLEAR ?auto_484354 ) ( IS-CRATE ?auto_484355 ) ( not ( = ?auto_484354 ?auto_484355 ) ) ( AVAILABLE ?auto_484358 ) ( ON ?auto_484354 ?auto_484353 ) ( not ( = ?auto_484353 ?auto_484354 ) ) ( not ( = ?auto_484353 ?auto_484355 ) ) ( TRUCK-AT ?auto_484357 ?auto_484356 ) ( not ( = ?auto_484356 ?auto_484359 ) ) ( HOIST-AT ?auto_484361 ?auto_484356 ) ( not ( = ?auto_484358 ?auto_484361 ) ) ( AVAILABLE ?auto_484361 ) ( SURFACE-AT ?auto_484355 ?auto_484356 ) ( ON ?auto_484355 ?auto_484360 ) ( CLEAR ?auto_484355 ) ( not ( = ?auto_484354 ?auto_484360 ) ) ( not ( = ?auto_484355 ?auto_484360 ) ) ( not ( = ?auto_484353 ?auto_484360 ) ) ( ON ?auto_484349 ?auto_484348 ) ( ON ?auto_484350 ?auto_484349 ) ( ON ?auto_484352 ?auto_484350 ) ( ON ?auto_484351 ?auto_484352 ) ( ON ?auto_484353 ?auto_484351 ) ( not ( = ?auto_484348 ?auto_484349 ) ) ( not ( = ?auto_484348 ?auto_484350 ) ) ( not ( = ?auto_484348 ?auto_484352 ) ) ( not ( = ?auto_484348 ?auto_484351 ) ) ( not ( = ?auto_484348 ?auto_484353 ) ) ( not ( = ?auto_484348 ?auto_484354 ) ) ( not ( = ?auto_484348 ?auto_484355 ) ) ( not ( = ?auto_484348 ?auto_484360 ) ) ( not ( = ?auto_484349 ?auto_484350 ) ) ( not ( = ?auto_484349 ?auto_484352 ) ) ( not ( = ?auto_484349 ?auto_484351 ) ) ( not ( = ?auto_484349 ?auto_484353 ) ) ( not ( = ?auto_484349 ?auto_484354 ) ) ( not ( = ?auto_484349 ?auto_484355 ) ) ( not ( = ?auto_484349 ?auto_484360 ) ) ( not ( = ?auto_484350 ?auto_484352 ) ) ( not ( = ?auto_484350 ?auto_484351 ) ) ( not ( = ?auto_484350 ?auto_484353 ) ) ( not ( = ?auto_484350 ?auto_484354 ) ) ( not ( = ?auto_484350 ?auto_484355 ) ) ( not ( = ?auto_484350 ?auto_484360 ) ) ( not ( = ?auto_484352 ?auto_484351 ) ) ( not ( = ?auto_484352 ?auto_484353 ) ) ( not ( = ?auto_484352 ?auto_484354 ) ) ( not ( = ?auto_484352 ?auto_484355 ) ) ( not ( = ?auto_484352 ?auto_484360 ) ) ( not ( = ?auto_484351 ?auto_484353 ) ) ( not ( = ?auto_484351 ?auto_484354 ) ) ( not ( = ?auto_484351 ?auto_484355 ) ) ( not ( = ?auto_484351 ?auto_484360 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_484353 ?auto_484354 ?auto_484355 )
      ( MAKE-7CRATE-VERIFY ?auto_484348 ?auto_484349 ?auto_484350 ?auto_484352 ?auto_484351 ?auto_484353 ?auto_484354 ?auto_484355 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_484426 - SURFACE
      ?auto_484427 - SURFACE
      ?auto_484428 - SURFACE
      ?auto_484430 - SURFACE
      ?auto_484429 - SURFACE
      ?auto_484431 - SURFACE
      ?auto_484432 - SURFACE
      ?auto_484433 - SURFACE
    )
    :vars
    (
      ?auto_484437 - HOIST
      ?auto_484436 - PLACE
      ?auto_484439 - PLACE
      ?auto_484435 - HOIST
      ?auto_484438 - SURFACE
      ?auto_484434 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_484437 ?auto_484436 ) ( SURFACE-AT ?auto_484432 ?auto_484436 ) ( CLEAR ?auto_484432 ) ( IS-CRATE ?auto_484433 ) ( not ( = ?auto_484432 ?auto_484433 ) ) ( AVAILABLE ?auto_484437 ) ( ON ?auto_484432 ?auto_484431 ) ( not ( = ?auto_484431 ?auto_484432 ) ) ( not ( = ?auto_484431 ?auto_484433 ) ) ( not ( = ?auto_484439 ?auto_484436 ) ) ( HOIST-AT ?auto_484435 ?auto_484439 ) ( not ( = ?auto_484437 ?auto_484435 ) ) ( AVAILABLE ?auto_484435 ) ( SURFACE-AT ?auto_484433 ?auto_484439 ) ( ON ?auto_484433 ?auto_484438 ) ( CLEAR ?auto_484433 ) ( not ( = ?auto_484432 ?auto_484438 ) ) ( not ( = ?auto_484433 ?auto_484438 ) ) ( not ( = ?auto_484431 ?auto_484438 ) ) ( TRUCK-AT ?auto_484434 ?auto_484436 ) ( ON ?auto_484427 ?auto_484426 ) ( ON ?auto_484428 ?auto_484427 ) ( ON ?auto_484430 ?auto_484428 ) ( ON ?auto_484429 ?auto_484430 ) ( ON ?auto_484431 ?auto_484429 ) ( not ( = ?auto_484426 ?auto_484427 ) ) ( not ( = ?auto_484426 ?auto_484428 ) ) ( not ( = ?auto_484426 ?auto_484430 ) ) ( not ( = ?auto_484426 ?auto_484429 ) ) ( not ( = ?auto_484426 ?auto_484431 ) ) ( not ( = ?auto_484426 ?auto_484432 ) ) ( not ( = ?auto_484426 ?auto_484433 ) ) ( not ( = ?auto_484426 ?auto_484438 ) ) ( not ( = ?auto_484427 ?auto_484428 ) ) ( not ( = ?auto_484427 ?auto_484430 ) ) ( not ( = ?auto_484427 ?auto_484429 ) ) ( not ( = ?auto_484427 ?auto_484431 ) ) ( not ( = ?auto_484427 ?auto_484432 ) ) ( not ( = ?auto_484427 ?auto_484433 ) ) ( not ( = ?auto_484427 ?auto_484438 ) ) ( not ( = ?auto_484428 ?auto_484430 ) ) ( not ( = ?auto_484428 ?auto_484429 ) ) ( not ( = ?auto_484428 ?auto_484431 ) ) ( not ( = ?auto_484428 ?auto_484432 ) ) ( not ( = ?auto_484428 ?auto_484433 ) ) ( not ( = ?auto_484428 ?auto_484438 ) ) ( not ( = ?auto_484430 ?auto_484429 ) ) ( not ( = ?auto_484430 ?auto_484431 ) ) ( not ( = ?auto_484430 ?auto_484432 ) ) ( not ( = ?auto_484430 ?auto_484433 ) ) ( not ( = ?auto_484430 ?auto_484438 ) ) ( not ( = ?auto_484429 ?auto_484431 ) ) ( not ( = ?auto_484429 ?auto_484432 ) ) ( not ( = ?auto_484429 ?auto_484433 ) ) ( not ( = ?auto_484429 ?auto_484438 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_484431 ?auto_484432 ?auto_484433 )
      ( MAKE-7CRATE-VERIFY ?auto_484426 ?auto_484427 ?auto_484428 ?auto_484430 ?auto_484429 ?auto_484431 ?auto_484432 ?auto_484433 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_484504 - SURFACE
      ?auto_484505 - SURFACE
      ?auto_484506 - SURFACE
      ?auto_484508 - SURFACE
      ?auto_484507 - SURFACE
      ?auto_484509 - SURFACE
      ?auto_484510 - SURFACE
      ?auto_484511 - SURFACE
    )
    :vars
    (
      ?auto_484517 - HOIST
      ?auto_484514 - PLACE
      ?auto_484513 - PLACE
      ?auto_484512 - HOIST
      ?auto_484516 - SURFACE
      ?auto_484515 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_484517 ?auto_484514 ) ( IS-CRATE ?auto_484511 ) ( not ( = ?auto_484510 ?auto_484511 ) ) ( not ( = ?auto_484509 ?auto_484510 ) ) ( not ( = ?auto_484509 ?auto_484511 ) ) ( not ( = ?auto_484513 ?auto_484514 ) ) ( HOIST-AT ?auto_484512 ?auto_484513 ) ( not ( = ?auto_484517 ?auto_484512 ) ) ( AVAILABLE ?auto_484512 ) ( SURFACE-AT ?auto_484511 ?auto_484513 ) ( ON ?auto_484511 ?auto_484516 ) ( CLEAR ?auto_484511 ) ( not ( = ?auto_484510 ?auto_484516 ) ) ( not ( = ?auto_484511 ?auto_484516 ) ) ( not ( = ?auto_484509 ?auto_484516 ) ) ( TRUCK-AT ?auto_484515 ?auto_484514 ) ( SURFACE-AT ?auto_484509 ?auto_484514 ) ( CLEAR ?auto_484509 ) ( LIFTING ?auto_484517 ?auto_484510 ) ( IS-CRATE ?auto_484510 ) ( ON ?auto_484505 ?auto_484504 ) ( ON ?auto_484506 ?auto_484505 ) ( ON ?auto_484508 ?auto_484506 ) ( ON ?auto_484507 ?auto_484508 ) ( ON ?auto_484509 ?auto_484507 ) ( not ( = ?auto_484504 ?auto_484505 ) ) ( not ( = ?auto_484504 ?auto_484506 ) ) ( not ( = ?auto_484504 ?auto_484508 ) ) ( not ( = ?auto_484504 ?auto_484507 ) ) ( not ( = ?auto_484504 ?auto_484509 ) ) ( not ( = ?auto_484504 ?auto_484510 ) ) ( not ( = ?auto_484504 ?auto_484511 ) ) ( not ( = ?auto_484504 ?auto_484516 ) ) ( not ( = ?auto_484505 ?auto_484506 ) ) ( not ( = ?auto_484505 ?auto_484508 ) ) ( not ( = ?auto_484505 ?auto_484507 ) ) ( not ( = ?auto_484505 ?auto_484509 ) ) ( not ( = ?auto_484505 ?auto_484510 ) ) ( not ( = ?auto_484505 ?auto_484511 ) ) ( not ( = ?auto_484505 ?auto_484516 ) ) ( not ( = ?auto_484506 ?auto_484508 ) ) ( not ( = ?auto_484506 ?auto_484507 ) ) ( not ( = ?auto_484506 ?auto_484509 ) ) ( not ( = ?auto_484506 ?auto_484510 ) ) ( not ( = ?auto_484506 ?auto_484511 ) ) ( not ( = ?auto_484506 ?auto_484516 ) ) ( not ( = ?auto_484508 ?auto_484507 ) ) ( not ( = ?auto_484508 ?auto_484509 ) ) ( not ( = ?auto_484508 ?auto_484510 ) ) ( not ( = ?auto_484508 ?auto_484511 ) ) ( not ( = ?auto_484508 ?auto_484516 ) ) ( not ( = ?auto_484507 ?auto_484509 ) ) ( not ( = ?auto_484507 ?auto_484510 ) ) ( not ( = ?auto_484507 ?auto_484511 ) ) ( not ( = ?auto_484507 ?auto_484516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_484509 ?auto_484510 ?auto_484511 )
      ( MAKE-7CRATE-VERIFY ?auto_484504 ?auto_484505 ?auto_484506 ?auto_484508 ?auto_484507 ?auto_484509 ?auto_484510 ?auto_484511 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_484582 - SURFACE
      ?auto_484583 - SURFACE
      ?auto_484584 - SURFACE
      ?auto_484586 - SURFACE
      ?auto_484585 - SURFACE
      ?auto_484587 - SURFACE
      ?auto_484588 - SURFACE
      ?auto_484589 - SURFACE
    )
    :vars
    (
      ?auto_484591 - HOIST
      ?auto_484592 - PLACE
      ?auto_484590 - PLACE
      ?auto_484594 - HOIST
      ?auto_484593 - SURFACE
      ?auto_484595 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_484591 ?auto_484592 ) ( IS-CRATE ?auto_484589 ) ( not ( = ?auto_484588 ?auto_484589 ) ) ( not ( = ?auto_484587 ?auto_484588 ) ) ( not ( = ?auto_484587 ?auto_484589 ) ) ( not ( = ?auto_484590 ?auto_484592 ) ) ( HOIST-AT ?auto_484594 ?auto_484590 ) ( not ( = ?auto_484591 ?auto_484594 ) ) ( AVAILABLE ?auto_484594 ) ( SURFACE-AT ?auto_484589 ?auto_484590 ) ( ON ?auto_484589 ?auto_484593 ) ( CLEAR ?auto_484589 ) ( not ( = ?auto_484588 ?auto_484593 ) ) ( not ( = ?auto_484589 ?auto_484593 ) ) ( not ( = ?auto_484587 ?auto_484593 ) ) ( TRUCK-AT ?auto_484595 ?auto_484592 ) ( SURFACE-AT ?auto_484587 ?auto_484592 ) ( CLEAR ?auto_484587 ) ( IS-CRATE ?auto_484588 ) ( AVAILABLE ?auto_484591 ) ( IN ?auto_484588 ?auto_484595 ) ( ON ?auto_484583 ?auto_484582 ) ( ON ?auto_484584 ?auto_484583 ) ( ON ?auto_484586 ?auto_484584 ) ( ON ?auto_484585 ?auto_484586 ) ( ON ?auto_484587 ?auto_484585 ) ( not ( = ?auto_484582 ?auto_484583 ) ) ( not ( = ?auto_484582 ?auto_484584 ) ) ( not ( = ?auto_484582 ?auto_484586 ) ) ( not ( = ?auto_484582 ?auto_484585 ) ) ( not ( = ?auto_484582 ?auto_484587 ) ) ( not ( = ?auto_484582 ?auto_484588 ) ) ( not ( = ?auto_484582 ?auto_484589 ) ) ( not ( = ?auto_484582 ?auto_484593 ) ) ( not ( = ?auto_484583 ?auto_484584 ) ) ( not ( = ?auto_484583 ?auto_484586 ) ) ( not ( = ?auto_484583 ?auto_484585 ) ) ( not ( = ?auto_484583 ?auto_484587 ) ) ( not ( = ?auto_484583 ?auto_484588 ) ) ( not ( = ?auto_484583 ?auto_484589 ) ) ( not ( = ?auto_484583 ?auto_484593 ) ) ( not ( = ?auto_484584 ?auto_484586 ) ) ( not ( = ?auto_484584 ?auto_484585 ) ) ( not ( = ?auto_484584 ?auto_484587 ) ) ( not ( = ?auto_484584 ?auto_484588 ) ) ( not ( = ?auto_484584 ?auto_484589 ) ) ( not ( = ?auto_484584 ?auto_484593 ) ) ( not ( = ?auto_484586 ?auto_484585 ) ) ( not ( = ?auto_484586 ?auto_484587 ) ) ( not ( = ?auto_484586 ?auto_484588 ) ) ( not ( = ?auto_484586 ?auto_484589 ) ) ( not ( = ?auto_484586 ?auto_484593 ) ) ( not ( = ?auto_484585 ?auto_484587 ) ) ( not ( = ?auto_484585 ?auto_484588 ) ) ( not ( = ?auto_484585 ?auto_484589 ) ) ( not ( = ?auto_484585 ?auto_484593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_484587 ?auto_484588 ?auto_484589 )
      ( MAKE-7CRATE-VERIFY ?auto_484582 ?auto_484583 ?auto_484584 ?auto_484586 ?auto_484585 ?auto_484587 ?auto_484588 ?auto_484589 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_487494 - SURFACE
      ?auto_487495 - SURFACE
      ?auto_487496 - SURFACE
      ?auto_487498 - SURFACE
      ?auto_487497 - SURFACE
      ?auto_487499 - SURFACE
      ?auto_487500 - SURFACE
      ?auto_487501 - SURFACE
      ?auto_487502 - SURFACE
    )
    :vars
    (
      ?auto_487503 - HOIST
      ?auto_487504 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_487503 ?auto_487504 ) ( SURFACE-AT ?auto_487501 ?auto_487504 ) ( CLEAR ?auto_487501 ) ( LIFTING ?auto_487503 ?auto_487502 ) ( IS-CRATE ?auto_487502 ) ( not ( = ?auto_487501 ?auto_487502 ) ) ( ON ?auto_487495 ?auto_487494 ) ( ON ?auto_487496 ?auto_487495 ) ( ON ?auto_487498 ?auto_487496 ) ( ON ?auto_487497 ?auto_487498 ) ( ON ?auto_487499 ?auto_487497 ) ( ON ?auto_487500 ?auto_487499 ) ( ON ?auto_487501 ?auto_487500 ) ( not ( = ?auto_487494 ?auto_487495 ) ) ( not ( = ?auto_487494 ?auto_487496 ) ) ( not ( = ?auto_487494 ?auto_487498 ) ) ( not ( = ?auto_487494 ?auto_487497 ) ) ( not ( = ?auto_487494 ?auto_487499 ) ) ( not ( = ?auto_487494 ?auto_487500 ) ) ( not ( = ?auto_487494 ?auto_487501 ) ) ( not ( = ?auto_487494 ?auto_487502 ) ) ( not ( = ?auto_487495 ?auto_487496 ) ) ( not ( = ?auto_487495 ?auto_487498 ) ) ( not ( = ?auto_487495 ?auto_487497 ) ) ( not ( = ?auto_487495 ?auto_487499 ) ) ( not ( = ?auto_487495 ?auto_487500 ) ) ( not ( = ?auto_487495 ?auto_487501 ) ) ( not ( = ?auto_487495 ?auto_487502 ) ) ( not ( = ?auto_487496 ?auto_487498 ) ) ( not ( = ?auto_487496 ?auto_487497 ) ) ( not ( = ?auto_487496 ?auto_487499 ) ) ( not ( = ?auto_487496 ?auto_487500 ) ) ( not ( = ?auto_487496 ?auto_487501 ) ) ( not ( = ?auto_487496 ?auto_487502 ) ) ( not ( = ?auto_487498 ?auto_487497 ) ) ( not ( = ?auto_487498 ?auto_487499 ) ) ( not ( = ?auto_487498 ?auto_487500 ) ) ( not ( = ?auto_487498 ?auto_487501 ) ) ( not ( = ?auto_487498 ?auto_487502 ) ) ( not ( = ?auto_487497 ?auto_487499 ) ) ( not ( = ?auto_487497 ?auto_487500 ) ) ( not ( = ?auto_487497 ?auto_487501 ) ) ( not ( = ?auto_487497 ?auto_487502 ) ) ( not ( = ?auto_487499 ?auto_487500 ) ) ( not ( = ?auto_487499 ?auto_487501 ) ) ( not ( = ?auto_487499 ?auto_487502 ) ) ( not ( = ?auto_487500 ?auto_487501 ) ) ( not ( = ?auto_487500 ?auto_487502 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_487501 ?auto_487502 )
      ( MAKE-8CRATE-VERIFY ?auto_487494 ?auto_487495 ?auto_487496 ?auto_487498 ?auto_487497 ?auto_487499 ?auto_487500 ?auto_487501 ?auto_487502 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_487561 - SURFACE
      ?auto_487562 - SURFACE
      ?auto_487563 - SURFACE
      ?auto_487565 - SURFACE
      ?auto_487564 - SURFACE
      ?auto_487566 - SURFACE
      ?auto_487567 - SURFACE
      ?auto_487568 - SURFACE
      ?auto_487569 - SURFACE
    )
    :vars
    (
      ?auto_487570 - HOIST
      ?auto_487572 - PLACE
      ?auto_487571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_487570 ?auto_487572 ) ( SURFACE-AT ?auto_487568 ?auto_487572 ) ( CLEAR ?auto_487568 ) ( IS-CRATE ?auto_487569 ) ( not ( = ?auto_487568 ?auto_487569 ) ) ( TRUCK-AT ?auto_487571 ?auto_487572 ) ( AVAILABLE ?auto_487570 ) ( IN ?auto_487569 ?auto_487571 ) ( ON ?auto_487568 ?auto_487567 ) ( not ( = ?auto_487567 ?auto_487568 ) ) ( not ( = ?auto_487567 ?auto_487569 ) ) ( ON ?auto_487562 ?auto_487561 ) ( ON ?auto_487563 ?auto_487562 ) ( ON ?auto_487565 ?auto_487563 ) ( ON ?auto_487564 ?auto_487565 ) ( ON ?auto_487566 ?auto_487564 ) ( ON ?auto_487567 ?auto_487566 ) ( not ( = ?auto_487561 ?auto_487562 ) ) ( not ( = ?auto_487561 ?auto_487563 ) ) ( not ( = ?auto_487561 ?auto_487565 ) ) ( not ( = ?auto_487561 ?auto_487564 ) ) ( not ( = ?auto_487561 ?auto_487566 ) ) ( not ( = ?auto_487561 ?auto_487567 ) ) ( not ( = ?auto_487561 ?auto_487568 ) ) ( not ( = ?auto_487561 ?auto_487569 ) ) ( not ( = ?auto_487562 ?auto_487563 ) ) ( not ( = ?auto_487562 ?auto_487565 ) ) ( not ( = ?auto_487562 ?auto_487564 ) ) ( not ( = ?auto_487562 ?auto_487566 ) ) ( not ( = ?auto_487562 ?auto_487567 ) ) ( not ( = ?auto_487562 ?auto_487568 ) ) ( not ( = ?auto_487562 ?auto_487569 ) ) ( not ( = ?auto_487563 ?auto_487565 ) ) ( not ( = ?auto_487563 ?auto_487564 ) ) ( not ( = ?auto_487563 ?auto_487566 ) ) ( not ( = ?auto_487563 ?auto_487567 ) ) ( not ( = ?auto_487563 ?auto_487568 ) ) ( not ( = ?auto_487563 ?auto_487569 ) ) ( not ( = ?auto_487565 ?auto_487564 ) ) ( not ( = ?auto_487565 ?auto_487566 ) ) ( not ( = ?auto_487565 ?auto_487567 ) ) ( not ( = ?auto_487565 ?auto_487568 ) ) ( not ( = ?auto_487565 ?auto_487569 ) ) ( not ( = ?auto_487564 ?auto_487566 ) ) ( not ( = ?auto_487564 ?auto_487567 ) ) ( not ( = ?auto_487564 ?auto_487568 ) ) ( not ( = ?auto_487564 ?auto_487569 ) ) ( not ( = ?auto_487566 ?auto_487567 ) ) ( not ( = ?auto_487566 ?auto_487568 ) ) ( not ( = ?auto_487566 ?auto_487569 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_487567 ?auto_487568 ?auto_487569 )
      ( MAKE-8CRATE-VERIFY ?auto_487561 ?auto_487562 ?auto_487563 ?auto_487565 ?auto_487564 ?auto_487566 ?auto_487567 ?auto_487568 ?auto_487569 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_487637 - SURFACE
      ?auto_487638 - SURFACE
      ?auto_487639 - SURFACE
      ?auto_487641 - SURFACE
      ?auto_487640 - SURFACE
      ?auto_487642 - SURFACE
      ?auto_487643 - SURFACE
      ?auto_487644 - SURFACE
      ?auto_487645 - SURFACE
    )
    :vars
    (
      ?auto_487647 - HOIST
      ?auto_487649 - PLACE
      ?auto_487646 - TRUCK
      ?auto_487648 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_487647 ?auto_487649 ) ( SURFACE-AT ?auto_487644 ?auto_487649 ) ( CLEAR ?auto_487644 ) ( IS-CRATE ?auto_487645 ) ( not ( = ?auto_487644 ?auto_487645 ) ) ( AVAILABLE ?auto_487647 ) ( IN ?auto_487645 ?auto_487646 ) ( ON ?auto_487644 ?auto_487643 ) ( not ( = ?auto_487643 ?auto_487644 ) ) ( not ( = ?auto_487643 ?auto_487645 ) ) ( TRUCK-AT ?auto_487646 ?auto_487648 ) ( not ( = ?auto_487648 ?auto_487649 ) ) ( ON ?auto_487638 ?auto_487637 ) ( ON ?auto_487639 ?auto_487638 ) ( ON ?auto_487641 ?auto_487639 ) ( ON ?auto_487640 ?auto_487641 ) ( ON ?auto_487642 ?auto_487640 ) ( ON ?auto_487643 ?auto_487642 ) ( not ( = ?auto_487637 ?auto_487638 ) ) ( not ( = ?auto_487637 ?auto_487639 ) ) ( not ( = ?auto_487637 ?auto_487641 ) ) ( not ( = ?auto_487637 ?auto_487640 ) ) ( not ( = ?auto_487637 ?auto_487642 ) ) ( not ( = ?auto_487637 ?auto_487643 ) ) ( not ( = ?auto_487637 ?auto_487644 ) ) ( not ( = ?auto_487637 ?auto_487645 ) ) ( not ( = ?auto_487638 ?auto_487639 ) ) ( not ( = ?auto_487638 ?auto_487641 ) ) ( not ( = ?auto_487638 ?auto_487640 ) ) ( not ( = ?auto_487638 ?auto_487642 ) ) ( not ( = ?auto_487638 ?auto_487643 ) ) ( not ( = ?auto_487638 ?auto_487644 ) ) ( not ( = ?auto_487638 ?auto_487645 ) ) ( not ( = ?auto_487639 ?auto_487641 ) ) ( not ( = ?auto_487639 ?auto_487640 ) ) ( not ( = ?auto_487639 ?auto_487642 ) ) ( not ( = ?auto_487639 ?auto_487643 ) ) ( not ( = ?auto_487639 ?auto_487644 ) ) ( not ( = ?auto_487639 ?auto_487645 ) ) ( not ( = ?auto_487641 ?auto_487640 ) ) ( not ( = ?auto_487641 ?auto_487642 ) ) ( not ( = ?auto_487641 ?auto_487643 ) ) ( not ( = ?auto_487641 ?auto_487644 ) ) ( not ( = ?auto_487641 ?auto_487645 ) ) ( not ( = ?auto_487640 ?auto_487642 ) ) ( not ( = ?auto_487640 ?auto_487643 ) ) ( not ( = ?auto_487640 ?auto_487644 ) ) ( not ( = ?auto_487640 ?auto_487645 ) ) ( not ( = ?auto_487642 ?auto_487643 ) ) ( not ( = ?auto_487642 ?auto_487644 ) ) ( not ( = ?auto_487642 ?auto_487645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_487643 ?auto_487644 ?auto_487645 )
      ( MAKE-8CRATE-VERIFY ?auto_487637 ?auto_487638 ?auto_487639 ?auto_487641 ?auto_487640 ?auto_487642 ?auto_487643 ?auto_487644 ?auto_487645 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_487721 - SURFACE
      ?auto_487722 - SURFACE
      ?auto_487723 - SURFACE
      ?auto_487725 - SURFACE
      ?auto_487724 - SURFACE
      ?auto_487726 - SURFACE
      ?auto_487727 - SURFACE
      ?auto_487728 - SURFACE
      ?auto_487729 - SURFACE
    )
    :vars
    (
      ?auto_487732 - HOIST
      ?auto_487730 - PLACE
      ?auto_487734 - TRUCK
      ?auto_487733 - PLACE
      ?auto_487731 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_487732 ?auto_487730 ) ( SURFACE-AT ?auto_487728 ?auto_487730 ) ( CLEAR ?auto_487728 ) ( IS-CRATE ?auto_487729 ) ( not ( = ?auto_487728 ?auto_487729 ) ) ( AVAILABLE ?auto_487732 ) ( ON ?auto_487728 ?auto_487727 ) ( not ( = ?auto_487727 ?auto_487728 ) ) ( not ( = ?auto_487727 ?auto_487729 ) ) ( TRUCK-AT ?auto_487734 ?auto_487733 ) ( not ( = ?auto_487733 ?auto_487730 ) ) ( HOIST-AT ?auto_487731 ?auto_487733 ) ( LIFTING ?auto_487731 ?auto_487729 ) ( not ( = ?auto_487732 ?auto_487731 ) ) ( ON ?auto_487722 ?auto_487721 ) ( ON ?auto_487723 ?auto_487722 ) ( ON ?auto_487725 ?auto_487723 ) ( ON ?auto_487724 ?auto_487725 ) ( ON ?auto_487726 ?auto_487724 ) ( ON ?auto_487727 ?auto_487726 ) ( not ( = ?auto_487721 ?auto_487722 ) ) ( not ( = ?auto_487721 ?auto_487723 ) ) ( not ( = ?auto_487721 ?auto_487725 ) ) ( not ( = ?auto_487721 ?auto_487724 ) ) ( not ( = ?auto_487721 ?auto_487726 ) ) ( not ( = ?auto_487721 ?auto_487727 ) ) ( not ( = ?auto_487721 ?auto_487728 ) ) ( not ( = ?auto_487721 ?auto_487729 ) ) ( not ( = ?auto_487722 ?auto_487723 ) ) ( not ( = ?auto_487722 ?auto_487725 ) ) ( not ( = ?auto_487722 ?auto_487724 ) ) ( not ( = ?auto_487722 ?auto_487726 ) ) ( not ( = ?auto_487722 ?auto_487727 ) ) ( not ( = ?auto_487722 ?auto_487728 ) ) ( not ( = ?auto_487722 ?auto_487729 ) ) ( not ( = ?auto_487723 ?auto_487725 ) ) ( not ( = ?auto_487723 ?auto_487724 ) ) ( not ( = ?auto_487723 ?auto_487726 ) ) ( not ( = ?auto_487723 ?auto_487727 ) ) ( not ( = ?auto_487723 ?auto_487728 ) ) ( not ( = ?auto_487723 ?auto_487729 ) ) ( not ( = ?auto_487725 ?auto_487724 ) ) ( not ( = ?auto_487725 ?auto_487726 ) ) ( not ( = ?auto_487725 ?auto_487727 ) ) ( not ( = ?auto_487725 ?auto_487728 ) ) ( not ( = ?auto_487725 ?auto_487729 ) ) ( not ( = ?auto_487724 ?auto_487726 ) ) ( not ( = ?auto_487724 ?auto_487727 ) ) ( not ( = ?auto_487724 ?auto_487728 ) ) ( not ( = ?auto_487724 ?auto_487729 ) ) ( not ( = ?auto_487726 ?auto_487727 ) ) ( not ( = ?auto_487726 ?auto_487728 ) ) ( not ( = ?auto_487726 ?auto_487729 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_487727 ?auto_487728 ?auto_487729 )
      ( MAKE-8CRATE-VERIFY ?auto_487721 ?auto_487722 ?auto_487723 ?auto_487725 ?auto_487724 ?auto_487726 ?auto_487727 ?auto_487728 ?auto_487729 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_487813 - SURFACE
      ?auto_487814 - SURFACE
      ?auto_487815 - SURFACE
      ?auto_487817 - SURFACE
      ?auto_487816 - SURFACE
      ?auto_487818 - SURFACE
      ?auto_487819 - SURFACE
      ?auto_487820 - SURFACE
      ?auto_487821 - SURFACE
    )
    :vars
    (
      ?auto_487825 - HOIST
      ?auto_487827 - PLACE
      ?auto_487826 - TRUCK
      ?auto_487823 - PLACE
      ?auto_487822 - HOIST
      ?auto_487824 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_487825 ?auto_487827 ) ( SURFACE-AT ?auto_487820 ?auto_487827 ) ( CLEAR ?auto_487820 ) ( IS-CRATE ?auto_487821 ) ( not ( = ?auto_487820 ?auto_487821 ) ) ( AVAILABLE ?auto_487825 ) ( ON ?auto_487820 ?auto_487819 ) ( not ( = ?auto_487819 ?auto_487820 ) ) ( not ( = ?auto_487819 ?auto_487821 ) ) ( TRUCK-AT ?auto_487826 ?auto_487823 ) ( not ( = ?auto_487823 ?auto_487827 ) ) ( HOIST-AT ?auto_487822 ?auto_487823 ) ( not ( = ?auto_487825 ?auto_487822 ) ) ( AVAILABLE ?auto_487822 ) ( SURFACE-AT ?auto_487821 ?auto_487823 ) ( ON ?auto_487821 ?auto_487824 ) ( CLEAR ?auto_487821 ) ( not ( = ?auto_487820 ?auto_487824 ) ) ( not ( = ?auto_487821 ?auto_487824 ) ) ( not ( = ?auto_487819 ?auto_487824 ) ) ( ON ?auto_487814 ?auto_487813 ) ( ON ?auto_487815 ?auto_487814 ) ( ON ?auto_487817 ?auto_487815 ) ( ON ?auto_487816 ?auto_487817 ) ( ON ?auto_487818 ?auto_487816 ) ( ON ?auto_487819 ?auto_487818 ) ( not ( = ?auto_487813 ?auto_487814 ) ) ( not ( = ?auto_487813 ?auto_487815 ) ) ( not ( = ?auto_487813 ?auto_487817 ) ) ( not ( = ?auto_487813 ?auto_487816 ) ) ( not ( = ?auto_487813 ?auto_487818 ) ) ( not ( = ?auto_487813 ?auto_487819 ) ) ( not ( = ?auto_487813 ?auto_487820 ) ) ( not ( = ?auto_487813 ?auto_487821 ) ) ( not ( = ?auto_487813 ?auto_487824 ) ) ( not ( = ?auto_487814 ?auto_487815 ) ) ( not ( = ?auto_487814 ?auto_487817 ) ) ( not ( = ?auto_487814 ?auto_487816 ) ) ( not ( = ?auto_487814 ?auto_487818 ) ) ( not ( = ?auto_487814 ?auto_487819 ) ) ( not ( = ?auto_487814 ?auto_487820 ) ) ( not ( = ?auto_487814 ?auto_487821 ) ) ( not ( = ?auto_487814 ?auto_487824 ) ) ( not ( = ?auto_487815 ?auto_487817 ) ) ( not ( = ?auto_487815 ?auto_487816 ) ) ( not ( = ?auto_487815 ?auto_487818 ) ) ( not ( = ?auto_487815 ?auto_487819 ) ) ( not ( = ?auto_487815 ?auto_487820 ) ) ( not ( = ?auto_487815 ?auto_487821 ) ) ( not ( = ?auto_487815 ?auto_487824 ) ) ( not ( = ?auto_487817 ?auto_487816 ) ) ( not ( = ?auto_487817 ?auto_487818 ) ) ( not ( = ?auto_487817 ?auto_487819 ) ) ( not ( = ?auto_487817 ?auto_487820 ) ) ( not ( = ?auto_487817 ?auto_487821 ) ) ( not ( = ?auto_487817 ?auto_487824 ) ) ( not ( = ?auto_487816 ?auto_487818 ) ) ( not ( = ?auto_487816 ?auto_487819 ) ) ( not ( = ?auto_487816 ?auto_487820 ) ) ( not ( = ?auto_487816 ?auto_487821 ) ) ( not ( = ?auto_487816 ?auto_487824 ) ) ( not ( = ?auto_487818 ?auto_487819 ) ) ( not ( = ?auto_487818 ?auto_487820 ) ) ( not ( = ?auto_487818 ?auto_487821 ) ) ( not ( = ?auto_487818 ?auto_487824 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_487819 ?auto_487820 ?auto_487821 )
      ( MAKE-8CRATE-VERIFY ?auto_487813 ?auto_487814 ?auto_487815 ?auto_487817 ?auto_487816 ?auto_487818 ?auto_487819 ?auto_487820 ?auto_487821 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_487906 - SURFACE
      ?auto_487907 - SURFACE
      ?auto_487908 - SURFACE
      ?auto_487910 - SURFACE
      ?auto_487909 - SURFACE
      ?auto_487911 - SURFACE
      ?auto_487912 - SURFACE
      ?auto_487913 - SURFACE
      ?auto_487914 - SURFACE
    )
    :vars
    (
      ?auto_487918 - HOIST
      ?auto_487920 - PLACE
      ?auto_487917 - PLACE
      ?auto_487919 - HOIST
      ?auto_487915 - SURFACE
      ?auto_487916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_487918 ?auto_487920 ) ( SURFACE-AT ?auto_487913 ?auto_487920 ) ( CLEAR ?auto_487913 ) ( IS-CRATE ?auto_487914 ) ( not ( = ?auto_487913 ?auto_487914 ) ) ( AVAILABLE ?auto_487918 ) ( ON ?auto_487913 ?auto_487912 ) ( not ( = ?auto_487912 ?auto_487913 ) ) ( not ( = ?auto_487912 ?auto_487914 ) ) ( not ( = ?auto_487917 ?auto_487920 ) ) ( HOIST-AT ?auto_487919 ?auto_487917 ) ( not ( = ?auto_487918 ?auto_487919 ) ) ( AVAILABLE ?auto_487919 ) ( SURFACE-AT ?auto_487914 ?auto_487917 ) ( ON ?auto_487914 ?auto_487915 ) ( CLEAR ?auto_487914 ) ( not ( = ?auto_487913 ?auto_487915 ) ) ( not ( = ?auto_487914 ?auto_487915 ) ) ( not ( = ?auto_487912 ?auto_487915 ) ) ( TRUCK-AT ?auto_487916 ?auto_487920 ) ( ON ?auto_487907 ?auto_487906 ) ( ON ?auto_487908 ?auto_487907 ) ( ON ?auto_487910 ?auto_487908 ) ( ON ?auto_487909 ?auto_487910 ) ( ON ?auto_487911 ?auto_487909 ) ( ON ?auto_487912 ?auto_487911 ) ( not ( = ?auto_487906 ?auto_487907 ) ) ( not ( = ?auto_487906 ?auto_487908 ) ) ( not ( = ?auto_487906 ?auto_487910 ) ) ( not ( = ?auto_487906 ?auto_487909 ) ) ( not ( = ?auto_487906 ?auto_487911 ) ) ( not ( = ?auto_487906 ?auto_487912 ) ) ( not ( = ?auto_487906 ?auto_487913 ) ) ( not ( = ?auto_487906 ?auto_487914 ) ) ( not ( = ?auto_487906 ?auto_487915 ) ) ( not ( = ?auto_487907 ?auto_487908 ) ) ( not ( = ?auto_487907 ?auto_487910 ) ) ( not ( = ?auto_487907 ?auto_487909 ) ) ( not ( = ?auto_487907 ?auto_487911 ) ) ( not ( = ?auto_487907 ?auto_487912 ) ) ( not ( = ?auto_487907 ?auto_487913 ) ) ( not ( = ?auto_487907 ?auto_487914 ) ) ( not ( = ?auto_487907 ?auto_487915 ) ) ( not ( = ?auto_487908 ?auto_487910 ) ) ( not ( = ?auto_487908 ?auto_487909 ) ) ( not ( = ?auto_487908 ?auto_487911 ) ) ( not ( = ?auto_487908 ?auto_487912 ) ) ( not ( = ?auto_487908 ?auto_487913 ) ) ( not ( = ?auto_487908 ?auto_487914 ) ) ( not ( = ?auto_487908 ?auto_487915 ) ) ( not ( = ?auto_487910 ?auto_487909 ) ) ( not ( = ?auto_487910 ?auto_487911 ) ) ( not ( = ?auto_487910 ?auto_487912 ) ) ( not ( = ?auto_487910 ?auto_487913 ) ) ( not ( = ?auto_487910 ?auto_487914 ) ) ( not ( = ?auto_487910 ?auto_487915 ) ) ( not ( = ?auto_487909 ?auto_487911 ) ) ( not ( = ?auto_487909 ?auto_487912 ) ) ( not ( = ?auto_487909 ?auto_487913 ) ) ( not ( = ?auto_487909 ?auto_487914 ) ) ( not ( = ?auto_487909 ?auto_487915 ) ) ( not ( = ?auto_487911 ?auto_487912 ) ) ( not ( = ?auto_487911 ?auto_487913 ) ) ( not ( = ?auto_487911 ?auto_487914 ) ) ( not ( = ?auto_487911 ?auto_487915 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_487912 ?auto_487913 ?auto_487914 )
      ( MAKE-8CRATE-VERIFY ?auto_487906 ?auto_487907 ?auto_487908 ?auto_487910 ?auto_487909 ?auto_487911 ?auto_487912 ?auto_487913 ?auto_487914 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_487999 - SURFACE
      ?auto_488000 - SURFACE
      ?auto_488001 - SURFACE
      ?auto_488003 - SURFACE
      ?auto_488002 - SURFACE
      ?auto_488004 - SURFACE
      ?auto_488005 - SURFACE
      ?auto_488006 - SURFACE
      ?auto_488007 - SURFACE
    )
    :vars
    (
      ?auto_488011 - HOIST
      ?auto_488009 - PLACE
      ?auto_488012 - PLACE
      ?auto_488013 - HOIST
      ?auto_488008 - SURFACE
      ?auto_488010 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_488011 ?auto_488009 ) ( IS-CRATE ?auto_488007 ) ( not ( = ?auto_488006 ?auto_488007 ) ) ( not ( = ?auto_488005 ?auto_488006 ) ) ( not ( = ?auto_488005 ?auto_488007 ) ) ( not ( = ?auto_488012 ?auto_488009 ) ) ( HOIST-AT ?auto_488013 ?auto_488012 ) ( not ( = ?auto_488011 ?auto_488013 ) ) ( AVAILABLE ?auto_488013 ) ( SURFACE-AT ?auto_488007 ?auto_488012 ) ( ON ?auto_488007 ?auto_488008 ) ( CLEAR ?auto_488007 ) ( not ( = ?auto_488006 ?auto_488008 ) ) ( not ( = ?auto_488007 ?auto_488008 ) ) ( not ( = ?auto_488005 ?auto_488008 ) ) ( TRUCK-AT ?auto_488010 ?auto_488009 ) ( SURFACE-AT ?auto_488005 ?auto_488009 ) ( CLEAR ?auto_488005 ) ( LIFTING ?auto_488011 ?auto_488006 ) ( IS-CRATE ?auto_488006 ) ( ON ?auto_488000 ?auto_487999 ) ( ON ?auto_488001 ?auto_488000 ) ( ON ?auto_488003 ?auto_488001 ) ( ON ?auto_488002 ?auto_488003 ) ( ON ?auto_488004 ?auto_488002 ) ( ON ?auto_488005 ?auto_488004 ) ( not ( = ?auto_487999 ?auto_488000 ) ) ( not ( = ?auto_487999 ?auto_488001 ) ) ( not ( = ?auto_487999 ?auto_488003 ) ) ( not ( = ?auto_487999 ?auto_488002 ) ) ( not ( = ?auto_487999 ?auto_488004 ) ) ( not ( = ?auto_487999 ?auto_488005 ) ) ( not ( = ?auto_487999 ?auto_488006 ) ) ( not ( = ?auto_487999 ?auto_488007 ) ) ( not ( = ?auto_487999 ?auto_488008 ) ) ( not ( = ?auto_488000 ?auto_488001 ) ) ( not ( = ?auto_488000 ?auto_488003 ) ) ( not ( = ?auto_488000 ?auto_488002 ) ) ( not ( = ?auto_488000 ?auto_488004 ) ) ( not ( = ?auto_488000 ?auto_488005 ) ) ( not ( = ?auto_488000 ?auto_488006 ) ) ( not ( = ?auto_488000 ?auto_488007 ) ) ( not ( = ?auto_488000 ?auto_488008 ) ) ( not ( = ?auto_488001 ?auto_488003 ) ) ( not ( = ?auto_488001 ?auto_488002 ) ) ( not ( = ?auto_488001 ?auto_488004 ) ) ( not ( = ?auto_488001 ?auto_488005 ) ) ( not ( = ?auto_488001 ?auto_488006 ) ) ( not ( = ?auto_488001 ?auto_488007 ) ) ( not ( = ?auto_488001 ?auto_488008 ) ) ( not ( = ?auto_488003 ?auto_488002 ) ) ( not ( = ?auto_488003 ?auto_488004 ) ) ( not ( = ?auto_488003 ?auto_488005 ) ) ( not ( = ?auto_488003 ?auto_488006 ) ) ( not ( = ?auto_488003 ?auto_488007 ) ) ( not ( = ?auto_488003 ?auto_488008 ) ) ( not ( = ?auto_488002 ?auto_488004 ) ) ( not ( = ?auto_488002 ?auto_488005 ) ) ( not ( = ?auto_488002 ?auto_488006 ) ) ( not ( = ?auto_488002 ?auto_488007 ) ) ( not ( = ?auto_488002 ?auto_488008 ) ) ( not ( = ?auto_488004 ?auto_488005 ) ) ( not ( = ?auto_488004 ?auto_488006 ) ) ( not ( = ?auto_488004 ?auto_488007 ) ) ( not ( = ?auto_488004 ?auto_488008 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_488005 ?auto_488006 ?auto_488007 )
      ( MAKE-8CRATE-VERIFY ?auto_487999 ?auto_488000 ?auto_488001 ?auto_488003 ?auto_488002 ?auto_488004 ?auto_488005 ?auto_488006 ?auto_488007 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_488092 - SURFACE
      ?auto_488093 - SURFACE
      ?auto_488094 - SURFACE
      ?auto_488096 - SURFACE
      ?auto_488095 - SURFACE
      ?auto_488097 - SURFACE
      ?auto_488098 - SURFACE
      ?auto_488099 - SURFACE
      ?auto_488100 - SURFACE
    )
    :vars
    (
      ?auto_488105 - HOIST
      ?auto_488104 - PLACE
      ?auto_488103 - PLACE
      ?auto_488101 - HOIST
      ?auto_488102 - SURFACE
      ?auto_488106 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_488105 ?auto_488104 ) ( IS-CRATE ?auto_488100 ) ( not ( = ?auto_488099 ?auto_488100 ) ) ( not ( = ?auto_488098 ?auto_488099 ) ) ( not ( = ?auto_488098 ?auto_488100 ) ) ( not ( = ?auto_488103 ?auto_488104 ) ) ( HOIST-AT ?auto_488101 ?auto_488103 ) ( not ( = ?auto_488105 ?auto_488101 ) ) ( AVAILABLE ?auto_488101 ) ( SURFACE-AT ?auto_488100 ?auto_488103 ) ( ON ?auto_488100 ?auto_488102 ) ( CLEAR ?auto_488100 ) ( not ( = ?auto_488099 ?auto_488102 ) ) ( not ( = ?auto_488100 ?auto_488102 ) ) ( not ( = ?auto_488098 ?auto_488102 ) ) ( TRUCK-AT ?auto_488106 ?auto_488104 ) ( SURFACE-AT ?auto_488098 ?auto_488104 ) ( CLEAR ?auto_488098 ) ( IS-CRATE ?auto_488099 ) ( AVAILABLE ?auto_488105 ) ( IN ?auto_488099 ?auto_488106 ) ( ON ?auto_488093 ?auto_488092 ) ( ON ?auto_488094 ?auto_488093 ) ( ON ?auto_488096 ?auto_488094 ) ( ON ?auto_488095 ?auto_488096 ) ( ON ?auto_488097 ?auto_488095 ) ( ON ?auto_488098 ?auto_488097 ) ( not ( = ?auto_488092 ?auto_488093 ) ) ( not ( = ?auto_488092 ?auto_488094 ) ) ( not ( = ?auto_488092 ?auto_488096 ) ) ( not ( = ?auto_488092 ?auto_488095 ) ) ( not ( = ?auto_488092 ?auto_488097 ) ) ( not ( = ?auto_488092 ?auto_488098 ) ) ( not ( = ?auto_488092 ?auto_488099 ) ) ( not ( = ?auto_488092 ?auto_488100 ) ) ( not ( = ?auto_488092 ?auto_488102 ) ) ( not ( = ?auto_488093 ?auto_488094 ) ) ( not ( = ?auto_488093 ?auto_488096 ) ) ( not ( = ?auto_488093 ?auto_488095 ) ) ( not ( = ?auto_488093 ?auto_488097 ) ) ( not ( = ?auto_488093 ?auto_488098 ) ) ( not ( = ?auto_488093 ?auto_488099 ) ) ( not ( = ?auto_488093 ?auto_488100 ) ) ( not ( = ?auto_488093 ?auto_488102 ) ) ( not ( = ?auto_488094 ?auto_488096 ) ) ( not ( = ?auto_488094 ?auto_488095 ) ) ( not ( = ?auto_488094 ?auto_488097 ) ) ( not ( = ?auto_488094 ?auto_488098 ) ) ( not ( = ?auto_488094 ?auto_488099 ) ) ( not ( = ?auto_488094 ?auto_488100 ) ) ( not ( = ?auto_488094 ?auto_488102 ) ) ( not ( = ?auto_488096 ?auto_488095 ) ) ( not ( = ?auto_488096 ?auto_488097 ) ) ( not ( = ?auto_488096 ?auto_488098 ) ) ( not ( = ?auto_488096 ?auto_488099 ) ) ( not ( = ?auto_488096 ?auto_488100 ) ) ( not ( = ?auto_488096 ?auto_488102 ) ) ( not ( = ?auto_488095 ?auto_488097 ) ) ( not ( = ?auto_488095 ?auto_488098 ) ) ( not ( = ?auto_488095 ?auto_488099 ) ) ( not ( = ?auto_488095 ?auto_488100 ) ) ( not ( = ?auto_488095 ?auto_488102 ) ) ( not ( = ?auto_488097 ?auto_488098 ) ) ( not ( = ?auto_488097 ?auto_488099 ) ) ( not ( = ?auto_488097 ?auto_488100 ) ) ( not ( = ?auto_488097 ?auto_488102 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_488098 ?auto_488099 ?auto_488100 )
      ( MAKE-8CRATE-VERIFY ?auto_488092 ?auto_488093 ?auto_488094 ?auto_488096 ?auto_488095 ?auto_488097 ?auto_488098 ?auto_488099 ?auto_488100 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_492187 - SURFACE
      ?auto_492188 - SURFACE
      ?auto_492189 - SURFACE
      ?auto_492191 - SURFACE
      ?auto_492190 - SURFACE
      ?auto_492192 - SURFACE
      ?auto_492193 - SURFACE
      ?auto_492194 - SURFACE
      ?auto_492195 - SURFACE
      ?auto_492196 - SURFACE
    )
    :vars
    (
      ?auto_492197 - HOIST
      ?auto_492198 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_492197 ?auto_492198 ) ( SURFACE-AT ?auto_492195 ?auto_492198 ) ( CLEAR ?auto_492195 ) ( LIFTING ?auto_492197 ?auto_492196 ) ( IS-CRATE ?auto_492196 ) ( not ( = ?auto_492195 ?auto_492196 ) ) ( ON ?auto_492188 ?auto_492187 ) ( ON ?auto_492189 ?auto_492188 ) ( ON ?auto_492191 ?auto_492189 ) ( ON ?auto_492190 ?auto_492191 ) ( ON ?auto_492192 ?auto_492190 ) ( ON ?auto_492193 ?auto_492192 ) ( ON ?auto_492194 ?auto_492193 ) ( ON ?auto_492195 ?auto_492194 ) ( not ( = ?auto_492187 ?auto_492188 ) ) ( not ( = ?auto_492187 ?auto_492189 ) ) ( not ( = ?auto_492187 ?auto_492191 ) ) ( not ( = ?auto_492187 ?auto_492190 ) ) ( not ( = ?auto_492187 ?auto_492192 ) ) ( not ( = ?auto_492187 ?auto_492193 ) ) ( not ( = ?auto_492187 ?auto_492194 ) ) ( not ( = ?auto_492187 ?auto_492195 ) ) ( not ( = ?auto_492187 ?auto_492196 ) ) ( not ( = ?auto_492188 ?auto_492189 ) ) ( not ( = ?auto_492188 ?auto_492191 ) ) ( not ( = ?auto_492188 ?auto_492190 ) ) ( not ( = ?auto_492188 ?auto_492192 ) ) ( not ( = ?auto_492188 ?auto_492193 ) ) ( not ( = ?auto_492188 ?auto_492194 ) ) ( not ( = ?auto_492188 ?auto_492195 ) ) ( not ( = ?auto_492188 ?auto_492196 ) ) ( not ( = ?auto_492189 ?auto_492191 ) ) ( not ( = ?auto_492189 ?auto_492190 ) ) ( not ( = ?auto_492189 ?auto_492192 ) ) ( not ( = ?auto_492189 ?auto_492193 ) ) ( not ( = ?auto_492189 ?auto_492194 ) ) ( not ( = ?auto_492189 ?auto_492195 ) ) ( not ( = ?auto_492189 ?auto_492196 ) ) ( not ( = ?auto_492191 ?auto_492190 ) ) ( not ( = ?auto_492191 ?auto_492192 ) ) ( not ( = ?auto_492191 ?auto_492193 ) ) ( not ( = ?auto_492191 ?auto_492194 ) ) ( not ( = ?auto_492191 ?auto_492195 ) ) ( not ( = ?auto_492191 ?auto_492196 ) ) ( not ( = ?auto_492190 ?auto_492192 ) ) ( not ( = ?auto_492190 ?auto_492193 ) ) ( not ( = ?auto_492190 ?auto_492194 ) ) ( not ( = ?auto_492190 ?auto_492195 ) ) ( not ( = ?auto_492190 ?auto_492196 ) ) ( not ( = ?auto_492192 ?auto_492193 ) ) ( not ( = ?auto_492192 ?auto_492194 ) ) ( not ( = ?auto_492192 ?auto_492195 ) ) ( not ( = ?auto_492192 ?auto_492196 ) ) ( not ( = ?auto_492193 ?auto_492194 ) ) ( not ( = ?auto_492193 ?auto_492195 ) ) ( not ( = ?auto_492193 ?auto_492196 ) ) ( not ( = ?auto_492194 ?auto_492195 ) ) ( not ( = ?auto_492194 ?auto_492196 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_492195 ?auto_492196 )
      ( MAKE-9CRATE-VERIFY ?auto_492187 ?auto_492188 ?auto_492189 ?auto_492191 ?auto_492190 ?auto_492192 ?auto_492193 ?auto_492194 ?auto_492195 ?auto_492196 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_492267 - SURFACE
      ?auto_492268 - SURFACE
      ?auto_492269 - SURFACE
      ?auto_492271 - SURFACE
      ?auto_492270 - SURFACE
      ?auto_492272 - SURFACE
      ?auto_492273 - SURFACE
      ?auto_492274 - SURFACE
      ?auto_492275 - SURFACE
      ?auto_492276 - SURFACE
    )
    :vars
    (
      ?auto_492277 - HOIST
      ?auto_492278 - PLACE
      ?auto_492279 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_492277 ?auto_492278 ) ( SURFACE-AT ?auto_492275 ?auto_492278 ) ( CLEAR ?auto_492275 ) ( IS-CRATE ?auto_492276 ) ( not ( = ?auto_492275 ?auto_492276 ) ) ( TRUCK-AT ?auto_492279 ?auto_492278 ) ( AVAILABLE ?auto_492277 ) ( IN ?auto_492276 ?auto_492279 ) ( ON ?auto_492275 ?auto_492274 ) ( not ( = ?auto_492274 ?auto_492275 ) ) ( not ( = ?auto_492274 ?auto_492276 ) ) ( ON ?auto_492268 ?auto_492267 ) ( ON ?auto_492269 ?auto_492268 ) ( ON ?auto_492271 ?auto_492269 ) ( ON ?auto_492270 ?auto_492271 ) ( ON ?auto_492272 ?auto_492270 ) ( ON ?auto_492273 ?auto_492272 ) ( ON ?auto_492274 ?auto_492273 ) ( not ( = ?auto_492267 ?auto_492268 ) ) ( not ( = ?auto_492267 ?auto_492269 ) ) ( not ( = ?auto_492267 ?auto_492271 ) ) ( not ( = ?auto_492267 ?auto_492270 ) ) ( not ( = ?auto_492267 ?auto_492272 ) ) ( not ( = ?auto_492267 ?auto_492273 ) ) ( not ( = ?auto_492267 ?auto_492274 ) ) ( not ( = ?auto_492267 ?auto_492275 ) ) ( not ( = ?auto_492267 ?auto_492276 ) ) ( not ( = ?auto_492268 ?auto_492269 ) ) ( not ( = ?auto_492268 ?auto_492271 ) ) ( not ( = ?auto_492268 ?auto_492270 ) ) ( not ( = ?auto_492268 ?auto_492272 ) ) ( not ( = ?auto_492268 ?auto_492273 ) ) ( not ( = ?auto_492268 ?auto_492274 ) ) ( not ( = ?auto_492268 ?auto_492275 ) ) ( not ( = ?auto_492268 ?auto_492276 ) ) ( not ( = ?auto_492269 ?auto_492271 ) ) ( not ( = ?auto_492269 ?auto_492270 ) ) ( not ( = ?auto_492269 ?auto_492272 ) ) ( not ( = ?auto_492269 ?auto_492273 ) ) ( not ( = ?auto_492269 ?auto_492274 ) ) ( not ( = ?auto_492269 ?auto_492275 ) ) ( not ( = ?auto_492269 ?auto_492276 ) ) ( not ( = ?auto_492271 ?auto_492270 ) ) ( not ( = ?auto_492271 ?auto_492272 ) ) ( not ( = ?auto_492271 ?auto_492273 ) ) ( not ( = ?auto_492271 ?auto_492274 ) ) ( not ( = ?auto_492271 ?auto_492275 ) ) ( not ( = ?auto_492271 ?auto_492276 ) ) ( not ( = ?auto_492270 ?auto_492272 ) ) ( not ( = ?auto_492270 ?auto_492273 ) ) ( not ( = ?auto_492270 ?auto_492274 ) ) ( not ( = ?auto_492270 ?auto_492275 ) ) ( not ( = ?auto_492270 ?auto_492276 ) ) ( not ( = ?auto_492272 ?auto_492273 ) ) ( not ( = ?auto_492272 ?auto_492274 ) ) ( not ( = ?auto_492272 ?auto_492275 ) ) ( not ( = ?auto_492272 ?auto_492276 ) ) ( not ( = ?auto_492273 ?auto_492274 ) ) ( not ( = ?auto_492273 ?auto_492275 ) ) ( not ( = ?auto_492273 ?auto_492276 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_492274 ?auto_492275 ?auto_492276 )
      ( MAKE-9CRATE-VERIFY ?auto_492267 ?auto_492268 ?auto_492269 ?auto_492271 ?auto_492270 ?auto_492272 ?auto_492273 ?auto_492274 ?auto_492275 ?auto_492276 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_492357 - SURFACE
      ?auto_492358 - SURFACE
      ?auto_492359 - SURFACE
      ?auto_492361 - SURFACE
      ?auto_492360 - SURFACE
      ?auto_492362 - SURFACE
      ?auto_492363 - SURFACE
      ?auto_492364 - SURFACE
      ?auto_492365 - SURFACE
      ?auto_492366 - SURFACE
    )
    :vars
    (
      ?auto_492370 - HOIST
      ?auto_492367 - PLACE
      ?auto_492368 - TRUCK
      ?auto_492369 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_492370 ?auto_492367 ) ( SURFACE-AT ?auto_492365 ?auto_492367 ) ( CLEAR ?auto_492365 ) ( IS-CRATE ?auto_492366 ) ( not ( = ?auto_492365 ?auto_492366 ) ) ( AVAILABLE ?auto_492370 ) ( IN ?auto_492366 ?auto_492368 ) ( ON ?auto_492365 ?auto_492364 ) ( not ( = ?auto_492364 ?auto_492365 ) ) ( not ( = ?auto_492364 ?auto_492366 ) ) ( TRUCK-AT ?auto_492368 ?auto_492369 ) ( not ( = ?auto_492369 ?auto_492367 ) ) ( ON ?auto_492358 ?auto_492357 ) ( ON ?auto_492359 ?auto_492358 ) ( ON ?auto_492361 ?auto_492359 ) ( ON ?auto_492360 ?auto_492361 ) ( ON ?auto_492362 ?auto_492360 ) ( ON ?auto_492363 ?auto_492362 ) ( ON ?auto_492364 ?auto_492363 ) ( not ( = ?auto_492357 ?auto_492358 ) ) ( not ( = ?auto_492357 ?auto_492359 ) ) ( not ( = ?auto_492357 ?auto_492361 ) ) ( not ( = ?auto_492357 ?auto_492360 ) ) ( not ( = ?auto_492357 ?auto_492362 ) ) ( not ( = ?auto_492357 ?auto_492363 ) ) ( not ( = ?auto_492357 ?auto_492364 ) ) ( not ( = ?auto_492357 ?auto_492365 ) ) ( not ( = ?auto_492357 ?auto_492366 ) ) ( not ( = ?auto_492358 ?auto_492359 ) ) ( not ( = ?auto_492358 ?auto_492361 ) ) ( not ( = ?auto_492358 ?auto_492360 ) ) ( not ( = ?auto_492358 ?auto_492362 ) ) ( not ( = ?auto_492358 ?auto_492363 ) ) ( not ( = ?auto_492358 ?auto_492364 ) ) ( not ( = ?auto_492358 ?auto_492365 ) ) ( not ( = ?auto_492358 ?auto_492366 ) ) ( not ( = ?auto_492359 ?auto_492361 ) ) ( not ( = ?auto_492359 ?auto_492360 ) ) ( not ( = ?auto_492359 ?auto_492362 ) ) ( not ( = ?auto_492359 ?auto_492363 ) ) ( not ( = ?auto_492359 ?auto_492364 ) ) ( not ( = ?auto_492359 ?auto_492365 ) ) ( not ( = ?auto_492359 ?auto_492366 ) ) ( not ( = ?auto_492361 ?auto_492360 ) ) ( not ( = ?auto_492361 ?auto_492362 ) ) ( not ( = ?auto_492361 ?auto_492363 ) ) ( not ( = ?auto_492361 ?auto_492364 ) ) ( not ( = ?auto_492361 ?auto_492365 ) ) ( not ( = ?auto_492361 ?auto_492366 ) ) ( not ( = ?auto_492360 ?auto_492362 ) ) ( not ( = ?auto_492360 ?auto_492363 ) ) ( not ( = ?auto_492360 ?auto_492364 ) ) ( not ( = ?auto_492360 ?auto_492365 ) ) ( not ( = ?auto_492360 ?auto_492366 ) ) ( not ( = ?auto_492362 ?auto_492363 ) ) ( not ( = ?auto_492362 ?auto_492364 ) ) ( not ( = ?auto_492362 ?auto_492365 ) ) ( not ( = ?auto_492362 ?auto_492366 ) ) ( not ( = ?auto_492363 ?auto_492364 ) ) ( not ( = ?auto_492363 ?auto_492365 ) ) ( not ( = ?auto_492363 ?auto_492366 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_492364 ?auto_492365 ?auto_492366 )
      ( MAKE-9CRATE-VERIFY ?auto_492357 ?auto_492358 ?auto_492359 ?auto_492361 ?auto_492360 ?auto_492362 ?auto_492363 ?auto_492364 ?auto_492365 ?auto_492366 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_492456 - SURFACE
      ?auto_492457 - SURFACE
      ?auto_492458 - SURFACE
      ?auto_492460 - SURFACE
      ?auto_492459 - SURFACE
      ?auto_492461 - SURFACE
      ?auto_492462 - SURFACE
      ?auto_492463 - SURFACE
      ?auto_492464 - SURFACE
      ?auto_492465 - SURFACE
    )
    :vars
    (
      ?auto_492469 - HOIST
      ?auto_492466 - PLACE
      ?auto_492470 - TRUCK
      ?auto_492467 - PLACE
      ?auto_492468 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_492469 ?auto_492466 ) ( SURFACE-AT ?auto_492464 ?auto_492466 ) ( CLEAR ?auto_492464 ) ( IS-CRATE ?auto_492465 ) ( not ( = ?auto_492464 ?auto_492465 ) ) ( AVAILABLE ?auto_492469 ) ( ON ?auto_492464 ?auto_492463 ) ( not ( = ?auto_492463 ?auto_492464 ) ) ( not ( = ?auto_492463 ?auto_492465 ) ) ( TRUCK-AT ?auto_492470 ?auto_492467 ) ( not ( = ?auto_492467 ?auto_492466 ) ) ( HOIST-AT ?auto_492468 ?auto_492467 ) ( LIFTING ?auto_492468 ?auto_492465 ) ( not ( = ?auto_492469 ?auto_492468 ) ) ( ON ?auto_492457 ?auto_492456 ) ( ON ?auto_492458 ?auto_492457 ) ( ON ?auto_492460 ?auto_492458 ) ( ON ?auto_492459 ?auto_492460 ) ( ON ?auto_492461 ?auto_492459 ) ( ON ?auto_492462 ?auto_492461 ) ( ON ?auto_492463 ?auto_492462 ) ( not ( = ?auto_492456 ?auto_492457 ) ) ( not ( = ?auto_492456 ?auto_492458 ) ) ( not ( = ?auto_492456 ?auto_492460 ) ) ( not ( = ?auto_492456 ?auto_492459 ) ) ( not ( = ?auto_492456 ?auto_492461 ) ) ( not ( = ?auto_492456 ?auto_492462 ) ) ( not ( = ?auto_492456 ?auto_492463 ) ) ( not ( = ?auto_492456 ?auto_492464 ) ) ( not ( = ?auto_492456 ?auto_492465 ) ) ( not ( = ?auto_492457 ?auto_492458 ) ) ( not ( = ?auto_492457 ?auto_492460 ) ) ( not ( = ?auto_492457 ?auto_492459 ) ) ( not ( = ?auto_492457 ?auto_492461 ) ) ( not ( = ?auto_492457 ?auto_492462 ) ) ( not ( = ?auto_492457 ?auto_492463 ) ) ( not ( = ?auto_492457 ?auto_492464 ) ) ( not ( = ?auto_492457 ?auto_492465 ) ) ( not ( = ?auto_492458 ?auto_492460 ) ) ( not ( = ?auto_492458 ?auto_492459 ) ) ( not ( = ?auto_492458 ?auto_492461 ) ) ( not ( = ?auto_492458 ?auto_492462 ) ) ( not ( = ?auto_492458 ?auto_492463 ) ) ( not ( = ?auto_492458 ?auto_492464 ) ) ( not ( = ?auto_492458 ?auto_492465 ) ) ( not ( = ?auto_492460 ?auto_492459 ) ) ( not ( = ?auto_492460 ?auto_492461 ) ) ( not ( = ?auto_492460 ?auto_492462 ) ) ( not ( = ?auto_492460 ?auto_492463 ) ) ( not ( = ?auto_492460 ?auto_492464 ) ) ( not ( = ?auto_492460 ?auto_492465 ) ) ( not ( = ?auto_492459 ?auto_492461 ) ) ( not ( = ?auto_492459 ?auto_492462 ) ) ( not ( = ?auto_492459 ?auto_492463 ) ) ( not ( = ?auto_492459 ?auto_492464 ) ) ( not ( = ?auto_492459 ?auto_492465 ) ) ( not ( = ?auto_492461 ?auto_492462 ) ) ( not ( = ?auto_492461 ?auto_492463 ) ) ( not ( = ?auto_492461 ?auto_492464 ) ) ( not ( = ?auto_492461 ?auto_492465 ) ) ( not ( = ?auto_492462 ?auto_492463 ) ) ( not ( = ?auto_492462 ?auto_492464 ) ) ( not ( = ?auto_492462 ?auto_492465 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_492463 ?auto_492464 ?auto_492465 )
      ( MAKE-9CRATE-VERIFY ?auto_492456 ?auto_492457 ?auto_492458 ?auto_492460 ?auto_492459 ?auto_492461 ?auto_492462 ?auto_492463 ?auto_492464 ?auto_492465 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_492564 - SURFACE
      ?auto_492565 - SURFACE
      ?auto_492566 - SURFACE
      ?auto_492568 - SURFACE
      ?auto_492567 - SURFACE
      ?auto_492569 - SURFACE
      ?auto_492570 - SURFACE
      ?auto_492571 - SURFACE
      ?auto_492572 - SURFACE
      ?auto_492573 - SURFACE
    )
    :vars
    (
      ?auto_492579 - HOIST
      ?auto_492578 - PLACE
      ?auto_492577 - TRUCK
      ?auto_492574 - PLACE
      ?auto_492576 - HOIST
      ?auto_492575 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_492579 ?auto_492578 ) ( SURFACE-AT ?auto_492572 ?auto_492578 ) ( CLEAR ?auto_492572 ) ( IS-CRATE ?auto_492573 ) ( not ( = ?auto_492572 ?auto_492573 ) ) ( AVAILABLE ?auto_492579 ) ( ON ?auto_492572 ?auto_492571 ) ( not ( = ?auto_492571 ?auto_492572 ) ) ( not ( = ?auto_492571 ?auto_492573 ) ) ( TRUCK-AT ?auto_492577 ?auto_492574 ) ( not ( = ?auto_492574 ?auto_492578 ) ) ( HOIST-AT ?auto_492576 ?auto_492574 ) ( not ( = ?auto_492579 ?auto_492576 ) ) ( AVAILABLE ?auto_492576 ) ( SURFACE-AT ?auto_492573 ?auto_492574 ) ( ON ?auto_492573 ?auto_492575 ) ( CLEAR ?auto_492573 ) ( not ( = ?auto_492572 ?auto_492575 ) ) ( not ( = ?auto_492573 ?auto_492575 ) ) ( not ( = ?auto_492571 ?auto_492575 ) ) ( ON ?auto_492565 ?auto_492564 ) ( ON ?auto_492566 ?auto_492565 ) ( ON ?auto_492568 ?auto_492566 ) ( ON ?auto_492567 ?auto_492568 ) ( ON ?auto_492569 ?auto_492567 ) ( ON ?auto_492570 ?auto_492569 ) ( ON ?auto_492571 ?auto_492570 ) ( not ( = ?auto_492564 ?auto_492565 ) ) ( not ( = ?auto_492564 ?auto_492566 ) ) ( not ( = ?auto_492564 ?auto_492568 ) ) ( not ( = ?auto_492564 ?auto_492567 ) ) ( not ( = ?auto_492564 ?auto_492569 ) ) ( not ( = ?auto_492564 ?auto_492570 ) ) ( not ( = ?auto_492564 ?auto_492571 ) ) ( not ( = ?auto_492564 ?auto_492572 ) ) ( not ( = ?auto_492564 ?auto_492573 ) ) ( not ( = ?auto_492564 ?auto_492575 ) ) ( not ( = ?auto_492565 ?auto_492566 ) ) ( not ( = ?auto_492565 ?auto_492568 ) ) ( not ( = ?auto_492565 ?auto_492567 ) ) ( not ( = ?auto_492565 ?auto_492569 ) ) ( not ( = ?auto_492565 ?auto_492570 ) ) ( not ( = ?auto_492565 ?auto_492571 ) ) ( not ( = ?auto_492565 ?auto_492572 ) ) ( not ( = ?auto_492565 ?auto_492573 ) ) ( not ( = ?auto_492565 ?auto_492575 ) ) ( not ( = ?auto_492566 ?auto_492568 ) ) ( not ( = ?auto_492566 ?auto_492567 ) ) ( not ( = ?auto_492566 ?auto_492569 ) ) ( not ( = ?auto_492566 ?auto_492570 ) ) ( not ( = ?auto_492566 ?auto_492571 ) ) ( not ( = ?auto_492566 ?auto_492572 ) ) ( not ( = ?auto_492566 ?auto_492573 ) ) ( not ( = ?auto_492566 ?auto_492575 ) ) ( not ( = ?auto_492568 ?auto_492567 ) ) ( not ( = ?auto_492568 ?auto_492569 ) ) ( not ( = ?auto_492568 ?auto_492570 ) ) ( not ( = ?auto_492568 ?auto_492571 ) ) ( not ( = ?auto_492568 ?auto_492572 ) ) ( not ( = ?auto_492568 ?auto_492573 ) ) ( not ( = ?auto_492568 ?auto_492575 ) ) ( not ( = ?auto_492567 ?auto_492569 ) ) ( not ( = ?auto_492567 ?auto_492570 ) ) ( not ( = ?auto_492567 ?auto_492571 ) ) ( not ( = ?auto_492567 ?auto_492572 ) ) ( not ( = ?auto_492567 ?auto_492573 ) ) ( not ( = ?auto_492567 ?auto_492575 ) ) ( not ( = ?auto_492569 ?auto_492570 ) ) ( not ( = ?auto_492569 ?auto_492571 ) ) ( not ( = ?auto_492569 ?auto_492572 ) ) ( not ( = ?auto_492569 ?auto_492573 ) ) ( not ( = ?auto_492569 ?auto_492575 ) ) ( not ( = ?auto_492570 ?auto_492571 ) ) ( not ( = ?auto_492570 ?auto_492572 ) ) ( not ( = ?auto_492570 ?auto_492573 ) ) ( not ( = ?auto_492570 ?auto_492575 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_492571 ?auto_492572 ?auto_492573 )
      ( MAKE-9CRATE-VERIFY ?auto_492564 ?auto_492565 ?auto_492566 ?auto_492568 ?auto_492567 ?auto_492569 ?auto_492570 ?auto_492571 ?auto_492572 ?auto_492573 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_492673 - SURFACE
      ?auto_492674 - SURFACE
      ?auto_492675 - SURFACE
      ?auto_492677 - SURFACE
      ?auto_492676 - SURFACE
      ?auto_492678 - SURFACE
      ?auto_492679 - SURFACE
      ?auto_492680 - SURFACE
      ?auto_492681 - SURFACE
      ?auto_492682 - SURFACE
    )
    :vars
    (
      ?auto_492685 - HOIST
      ?auto_492683 - PLACE
      ?auto_492686 - PLACE
      ?auto_492684 - HOIST
      ?auto_492688 - SURFACE
      ?auto_492687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_492685 ?auto_492683 ) ( SURFACE-AT ?auto_492681 ?auto_492683 ) ( CLEAR ?auto_492681 ) ( IS-CRATE ?auto_492682 ) ( not ( = ?auto_492681 ?auto_492682 ) ) ( AVAILABLE ?auto_492685 ) ( ON ?auto_492681 ?auto_492680 ) ( not ( = ?auto_492680 ?auto_492681 ) ) ( not ( = ?auto_492680 ?auto_492682 ) ) ( not ( = ?auto_492686 ?auto_492683 ) ) ( HOIST-AT ?auto_492684 ?auto_492686 ) ( not ( = ?auto_492685 ?auto_492684 ) ) ( AVAILABLE ?auto_492684 ) ( SURFACE-AT ?auto_492682 ?auto_492686 ) ( ON ?auto_492682 ?auto_492688 ) ( CLEAR ?auto_492682 ) ( not ( = ?auto_492681 ?auto_492688 ) ) ( not ( = ?auto_492682 ?auto_492688 ) ) ( not ( = ?auto_492680 ?auto_492688 ) ) ( TRUCK-AT ?auto_492687 ?auto_492683 ) ( ON ?auto_492674 ?auto_492673 ) ( ON ?auto_492675 ?auto_492674 ) ( ON ?auto_492677 ?auto_492675 ) ( ON ?auto_492676 ?auto_492677 ) ( ON ?auto_492678 ?auto_492676 ) ( ON ?auto_492679 ?auto_492678 ) ( ON ?auto_492680 ?auto_492679 ) ( not ( = ?auto_492673 ?auto_492674 ) ) ( not ( = ?auto_492673 ?auto_492675 ) ) ( not ( = ?auto_492673 ?auto_492677 ) ) ( not ( = ?auto_492673 ?auto_492676 ) ) ( not ( = ?auto_492673 ?auto_492678 ) ) ( not ( = ?auto_492673 ?auto_492679 ) ) ( not ( = ?auto_492673 ?auto_492680 ) ) ( not ( = ?auto_492673 ?auto_492681 ) ) ( not ( = ?auto_492673 ?auto_492682 ) ) ( not ( = ?auto_492673 ?auto_492688 ) ) ( not ( = ?auto_492674 ?auto_492675 ) ) ( not ( = ?auto_492674 ?auto_492677 ) ) ( not ( = ?auto_492674 ?auto_492676 ) ) ( not ( = ?auto_492674 ?auto_492678 ) ) ( not ( = ?auto_492674 ?auto_492679 ) ) ( not ( = ?auto_492674 ?auto_492680 ) ) ( not ( = ?auto_492674 ?auto_492681 ) ) ( not ( = ?auto_492674 ?auto_492682 ) ) ( not ( = ?auto_492674 ?auto_492688 ) ) ( not ( = ?auto_492675 ?auto_492677 ) ) ( not ( = ?auto_492675 ?auto_492676 ) ) ( not ( = ?auto_492675 ?auto_492678 ) ) ( not ( = ?auto_492675 ?auto_492679 ) ) ( not ( = ?auto_492675 ?auto_492680 ) ) ( not ( = ?auto_492675 ?auto_492681 ) ) ( not ( = ?auto_492675 ?auto_492682 ) ) ( not ( = ?auto_492675 ?auto_492688 ) ) ( not ( = ?auto_492677 ?auto_492676 ) ) ( not ( = ?auto_492677 ?auto_492678 ) ) ( not ( = ?auto_492677 ?auto_492679 ) ) ( not ( = ?auto_492677 ?auto_492680 ) ) ( not ( = ?auto_492677 ?auto_492681 ) ) ( not ( = ?auto_492677 ?auto_492682 ) ) ( not ( = ?auto_492677 ?auto_492688 ) ) ( not ( = ?auto_492676 ?auto_492678 ) ) ( not ( = ?auto_492676 ?auto_492679 ) ) ( not ( = ?auto_492676 ?auto_492680 ) ) ( not ( = ?auto_492676 ?auto_492681 ) ) ( not ( = ?auto_492676 ?auto_492682 ) ) ( not ( = ?auto_492676 ?auto_492688 ) ) ( not ( = ?auto_492678 ?auto_492679 ) ) ( not ( = ?auto_492678 ?auto_492680 ) ) ( not ( = ?auto_492678 ?auto_492681 ) ) ( not ( = ?auto_492678 ?auto_492682 ) ) ( not ( = ?auto_492678 ?auto_492688 ) ) ( not ( = ?auto_492679 ?auto_492680 ) ) ( not ( = ?auto_492679 ?auto_492681 ) ) ( not ( = ?auto_492679 ?auto_492682 ) ) ( not ( = ?auto_492679 ?auto_492688 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_492680 ?auto_492681 ?auto_492682 )
      ( MAKE-9CRATE-VERIFY ?auto_492673 ?auto_492674 ?auto_492675 ?auto_492677 ?auto_492676 ?auto_492678 ?auto_492679 ?auto_492680 ?auto_492681 ?auto_492682 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_492782 - SURFACE
      ?auto_492783 - SURFACE
      ?auto_492784 - SURFACE
      ?auto_492786 - SURFACE
      ?auto_492785 - SURFACE
      ?auto_492787 - SURFACE
      ?auto_492788 - SURFACE
      ?auto_492789 - SURFACE
      ?auto_492790 - SURFACE
      ?auto_492791 - SURFACE
    )
    :vars
    (
      ?auto_492795 - HOIST
      ?auto_492792 - PLACE
      ?auto_492796 - PLACE
      ?auto_492794 - HOIST
      ?auto_492793 - SURFACE
      ?auto_492797 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_492795 ?auto_492792 ) ( IS-CRATE ?auto_492791 ) ( not ( = ?auto_492790 ?auto_492791 ) ) ( not ( = ?auto_492789 ?auto_492790 ) ) ( not ( = ?auto_492789 ?auto_492791 ) ) ( not ( = ?auto_492796 ?auto_492792 ) ) ( HOIST-AT ?auto_492794 ?auto_492796 ) ( not ( = ?auto_492795 ?auto_492794 ) ) ( AVAILABLE ?auto_492794 ) ( SURFACE-AT ?auto_492791 ?auto_492796 ) ( ON ?auto_492791 ?auto_492793 ) ( CLEAR ?auto_492791 ) ( not ( = ?auto_492790 ?auto_492793 ) ) ( not ( = ?auto_492791 ?auto_492793 ) ) ( not ( = ?auto_492789 ?auto_492793 ) ) ( TRUCK-AT ?auto_492797 ?auto_492792 ) ( SURFACE-AT ?auto_492789 ?auto_492792 ) ( CLEAR ?auto_492789 ) ( LIFTING ?auto_492795 ?auto_492790 ) ( IS-CRATE ?auto_492790 ) ( ON ?auto_492783 ?auto_492782 ) ( ON ?auto_492784 ?auto_492783 ) ( ON ?auto_492786 ?auto_492784 ) ( ON ?auto_492785 ?auto_492786 ) ( ON ?auto_492787 ?auto_492785 ) ( ON ?auto_492788 ?auto_492787 ) ( ON ?auto_492789 ?auto_492788 ) ( not ( = ?auto_492782 ?auto_492783 ) ) ( not ( = ?auto_492782 ?auto_492784 ) ) ( not ( = ?auto_492782 ?auto_492786 ) ) ( not ( = ?auto_492782 ?auto_492785 ) ) ( not ( = ?auto_492782 ?auto_492787 ) ) ( not ( = ?auto_492782 ?auto_492788 ) ) ( not ( = ?auto_492782 ?auto_492789 ) ) ( not ( = ?auto_492782 ?auto_492790 ) ) ( not ( = ?auto_492782 ?auto_492791 ) ) ( not ( = ?auto_492782 ?auto_492793 ) ) ( not ( = ?auto_492783 ?auto_492784 ) ) ( not ( = ?auto_492783 ?auto_492786 ) ) ( not ( = ?auto_492783 ?auto_492785 ) ) ( not ( = ?auto_492783 ?auto_492787 ) ) ( not ( = ?auto_492783 ?auto_492788 ) ) ( not ( = ?auto_492783 ?auto_492789 ) ) ( not ( = ?auto_492783 ?auto_492790 ) ) ( not ( = ?auto_492783 ?auto_492791 ) ) ( not ( = ?auto_492783 ?auto_492793 ) ) ( not ( = ?auto_492784 ?auto_492786 ) ) ( not ( = ?auto_492784 ?auto_492785 ) ) ( not ( = ?auto_492784 ?auto_492787 ) ) ( not ( = ?auto_492784 ?auto_492788 ) ) ( not ( = ?auto_492784 ?auto_492789 ) ) ( not ( = ?auto_492784 ?auto_492790 ) ) ( not ( = ?auto_492784 ?auto_492791 ) ) ( not ( = ?auto_492784 ?auto_492793 ) ) ( not ( = ?auto_492786 ?auto_492785 ) ) ( not ( = ?auto_492786 ?auto_492787 ) ) ( not ( = ?auto_492786 ?auto_492788 ) ) ( not ( = ?auto_492786 ?auto_492789 ) ) ( not ( = ?auto_492786 ?auto_492790 ) ) ( not ( = ?auto_492786 ?auto_492791 ) ) ( not ( = ?auto_492786 ?auto_492793 ) ) ( not ( = ?auto_492785 ?auto_492787 ) ) ( not ( = ?auto_492785 ?auto_492788 ) ) ( not ( = ?auto_492785 ?auto_492789 ) ) ( not ( = ?auto_492785 ?auto_492790 ) ) ( not ( = ?auto_492785 ?auto_492791 ) ) ( not ( = ?auto_492785 ?auto_492793 ) ) ( not ( = ?auto_492787 ?auto_492788 ) ) ( not ( = ?auto_492787 ?auto_492789 ) ) ( not ( = ?auto_492787 ?auto_492790 ) ) ( not ( = ?auto_492787 ?auto_492791 ) ) ( not ( = ?auto_492787 ?auto_492793 ) ) ( not ( = ?auto_492788 ?auto_492789 ) ) ( not ( = ?auto_492788 ?auto_492790 ) ) ( not ( = ?auto_492788 ?auto_492791 ) ) ( not ( = ?auto_492788 ?auto_492793 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_492789 ?auto_492790 ?auto_492791 )
      ( MAKE-9CRATE-VERIFY ?auto_492782 ?auto_492783 ?auto_492784 ?auto_492786 ?auto_492785 ?auto_492787 ?auto_492788 ?auto_492789 ?auto_492790 ?auto_492791 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_492891 - SURFACE
      ?auto_492892 - SURFACE
      ?auto_492893 - SURFACE
      ?auto_492895 - SURFACE
      ?auto_492894 - SURFACE
      ?auto_492896 - SURFACE
      ?auto_492897 - SURFACE
      ?auto_492898 - SURFACE
      ?auto_492899 - SURFACE
      ?auto_492900 - SURFACE
    )
    :vars
    (
      ?auto_492901 - HOIST
      ?auto_492906 - PLACE
      ?auto_492903 - PLACE
      ?auto_492905 - HOIST
      ?auto_492904 - SURFACE
      ?auto_492902 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_492901 ?auto_492906 ) ( IS-CRATE ?auto_492900 ) ( not ( = ?auto_492899 ?auto_492900 ) ) ( not ( = ?auto_492898 ?auto_492899 ) ) ( not ( = ?auto_492898 ?auto_492900 ) ) ( not ( = ?auto_492903 ?auto_492906 ) ) ( HOIST-AT ?auto_492905 ?auto_492903 ) ( not ( = ?auto_492901 ?auto_492905 ) ) ( AVAILABLE ?auto_492905 ) ( SURFACE-AT ?auto_492900 ?auto_492903 ) ( ON ?auto_492900 ?auto_492904 ) ( CLEAR ?auto_492900 ) ( not ( = ?auto_492899 ?auto_492904 ) ) ( not ( = ?auto_492900 ?auto_492904 ) ) ( not ( = ?auto_492898 ?auto_492904 ) ) ( TRUCK-AT ?auto_492902 ?auto_492906 ) ( SURFACE-AT ?auto_492898 ?auto_492906 ) ( CLEAR ?auto_492898 ) ( IS-CRATE ?auto_492899 ) ( AVAILABLE ?auto_492901 ) ( IN ?auto_492899 ?auto_492902 ) ( ON ?auto_492892 ?auto_492891 ) ( ON ?auto_492893 ?auto_492892 ) ( ON ?auto_492895 ?auto_492893 ) ( ON ?auto_492894 ?auto_492895 ) ( ON ?auto_492896 ?auto_492894 ) ( ON ?auto_492897 ?auto_492896 ) ( ON ?auto_492898 ?auto_492897 ) ( not ( = ?auto_492891 ?auto_492892 ) ) ( not ( = ?auto_492891 ?auto_492893 ) ) ( not ( = ?auto_492891 ?auto_492895 ) ) ( not ( = ?auto_492891 ?auto_492894 ) ) ( not ( = ?auto_492891 ?auto_492896 ) ) ( not ( = ?auto_492891 ?auto_492897 ) ) ( not ( = ?auto_492891 ?auto_492898 ) ) ( not ( = ?auto_492891 ?auto_492899 ) ) ( not ( = ?auto_492891 ?auto_492900 ) ) ( not ( = ?auto_492891 ?auto_492904 ) ) ( not ( = ?auto_492892 ?auto_492893 ) ) ( not ( = ?auto_492892 ?auto_492895 ) ) ( not ( = ?auto_492892 ?auto_492894 ) ) ( not ( = ?auto_492892 ?auto_492896 ) ) ( not ( = ?auto_492892 ?auto_492897 ) ) ( not ( = ?auto_492892 ?auto_492898 ) ) ( not ( = ?auto_492892 ?auto_492899 ) ) ( not ( = ?auto_492892 ?auto_492900 ) ) ( not ( = ?auto_492892 ?auto_492904 ) ) ( not ( = ?auto_492893 ?auto_492895 ) ) ( not ( = ?auto_492893 ?auto_492894 ) ) ( not ( = ?auto_492893 ?auto_492896 ) ) ( not ( = ?auto_492893 ?auto_492897 ) ) ( not ( = ?auto_492893 ?auto_492898 ) ) ( not ( = ?auto_492893 ?auto_492899 ) ) ( not ( = ?auto_492893 ?auto_492900 ) ) ( not ( = ?auto_492893 ?auto_492904 ) ) ( not ( = ?auto_492895 ?auto_492894 ) ) ( not ( = ?auto_492895 ?auto_492896 ) ) ( not ( = ?auto_492895 ?auto_492897 ) ) ( not ( = ?auto_492895 ?auto_492898 ) ) ( not ( = ?auto_492895 ?auto_492899 ) ) ( not ( = ?auto_492895 ?auto_492900 ) ) ( not ( = ?auto_492895 ?auto_492904 ) ) ( not ( = ?auto_492894 ?auto_492896 ) ) ( not ( = ?auto_492894 ?auto_492897 ) ) ( not ( = ?auto_492894 ?auto_492898 ) ) ( not ( = ?auto_492894 ?auto_492899 ) ) ( not ( = ?auto_492894 ?auto_492900 ) ) ( not ( = ?auto_492894 ?auto_492904 ) ) ( not ( = ?auto_492896 ?auto_492897 ) ) ( not ( = ?auto_492896 ?auto_492898 ) ) ( not ( = ?auto_492896 ?auto_492899 ) ) ( not ( = ?auto_492896 ?auto_492900 ) ) ( not ( = ?auto_492896 ?auto_492904 ) ) ( not ( = ?auto_492897 ?auto_492898 ) ) ( not ( = ?auto_492897 ?auto_492899 ) ) ( not ( = ?auto_492897 ?auto_492900 ) ) ( not ( = ?auto_492897 ?auto_492904 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_492898 ?auto_492899 ?auto_492900 )
      ( MAKE-9CRATE-VERIFY ?auto_492891 ?auto_492892 ?auto_492893 ?auto_492895 ?auto_492894 ?auto_492896 ?auto_492897 ?auto_492898 ?auto_492899 ?auto_492900 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_498442 - SURFACE
      ?auto_498443 - SURFACE
      ?auto_498444 - SURFACE
      ?auto_498446 - SURFACE
      ?auto_498445 - SURFACE
      ?auto_498447 - SURFACE
      ?auto_498448 - SURFACE
      ?auto_498449 - SURFACE
      ?auto_498450 - SURFACE
      ?auto_498451 - SURFACE
      ?auto_498452 - SURFACE
    )
    :vars
    (
      ?auto_498454 - HOIST
      ?auto_498453 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_498454 ?auto_498453 ) ( SURFACE-AT ?auto_498451 ?auto_498453 ) ( CLEAR ?auto_498451 ) ( LIFTING ?auto_498454 ?auto_498452 ) ( IS-CRATE ?auto_498452 ) ( not ( = ?auto_498451 ?auto_498452 ) ) ( ON ?auto_498443 ?auto_498442 ) ( ON ?auto_498444 ?auto_498443 ) ( ON ?auto_498446 ?auto_498444 ) ( ON ?auto_498445 ?auto_498446 ) ( ON ?auto_498447 ?auto_498445 ) ( ON ?auto_498448 ?auto_498447 ) ( ON ?auto_498449 ?auto_498448 ) ( ON ?auto_498450 ?auto_498449 ) ( ON ?auto_498451 ?auto_498450 ) ( not ( = ?auto_498442 ?auto_498443 ) ) ( not ( = ?auto_498442 ?auto_498444 ) ) ( not ( = ?auto_498442 ?auto_498446 ) ) ( not ( = ?auto_498442 ?auto_498445 ) ) ( not ( = ?auto_498442 ?auto_498447 ) ) ( not ( = ?auto_498442 ?auto_498448 ) ) ( not ( = ?auto_498442 ?auto_498449 ) ) ( not ( = ?auto_498442 ?auto_498450 ) ) ( not ( = ?auto_498442 ?auto_498451 ) ) ( not ( = ?auto_498442 ?auto_498452 ) ) ( not ( = ?auto_498443 ?auto_498444 ) ) ( not ( = ?auto_498443 ?auto_498446 ) ) ( not ( = ?auto_498443 ?auto_498445 ) ) ( not ( = ?auto_498443 ?auto_498447 ) ) ( not ( = ?auto_498443 ?auto_498448 ) ) ( not ( = ?auto_498443 ?auto_498449 ) ) ( not ( = ?auto_498443 ?auto_498450 ) ) ( not ( = ?auto_498443 ?auto_498451 ) ) ( not ( = ?auto_498443 ?auto_498452 ) ) ( not ( = ?auto_498444 ?auto_498446 ) ) ( not ( = ?auto_498444 ?auto_498445 ) ) ( not ( = ?auto_498444 ?auto_498447 ) ) ( not ( = ?auto_498444 ?auto_498448 ) ) ( not ( = ?auto_498444 ?auto_498449 ) ) ( not ( = ?auto_498444 ?auto_498450 ) ) ( not ( = ?auto_498444 ?auto_498451 ) ) ( not ( = ?auto_498444 ?auto_498452 ) ) ( not ( = ?auto_498446 ?auto_498445 ) ) ( not ( = ?auto_498446 ?auto_498447 ) ) ( not ( = ?auto_498446 ?auto_498448 ) ) ( not ( = ?auto_498446 ?auto_498449 ) ) ( not ( = ?auto_498446 ?auto_498450 ) ) ( not ( = ?auto_498446 ?auto_498451 ) ) ( not ( = ?auto_498446 ?auto_498452 ) ) ( not ( = ?auto_498445 ?auto_498447 ) ) ( not ( = ?auto_498445 ?auto_498448 ) ) ( not ( = ?auto_498445 ?auto_498449 ) ) ( not ( = ?auto_498445 ?auto_498450 ) ) ( not ( = ?auto_498445 ?auto_498451 ) ) ( not ( = ?auto_498445 ?auto_498452 ) ) ( not ( = ?auto_498447 ?auto_498448 ) ) ( not ( = ?auto_498447 ?auto_498449 ) ) ( not ( = ?auto_498447 ?auto_498450 ) ) ( not ( = ?auto_498447 ?auto_498451 ) ) ( not ( = ?auto_498447 ?auto_498452 ) ) ( not ( = ?auto_498448 ?auto_498449 ) ) ( not ( = ?auto_498448 ?auto_498450 ) ) ( not ( = ?auto_498448 ?auto_498451 ) ) ( not ( = ?auto_498448 ?auto_498452 ) ) ( not ( = ?auto_498449 ?auto_498450 ) ) ( not ( = ?auto_498449 ?auto_498451 ) ) ( not ( = ?auto_498449 ?auto_498452 ) ) ( not ( = ?auto_498450 ?auto_498451 ) ) ( not ( = ?auto_498450 ?auto_498452 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_498451 ?auto_498452 )
      ( MAKE-10CRATE-VERIFY ?auto_498442 ?auto_498443 ?auto_498444 ?auto_498446 ?auto_498445 ?auto_498447 ?auto_498448 ?auto_498449 ?auto_498450 ?auto_498451 ?auto_498452 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_498536 - SURFACE
      ?auto_498537 - SURFACE
      ?auto_498538 - SURFACE
      ?auto_498540 - SURFACE
      ?auto_498539 - SURFACE
      ?auto_498541 - SURFACE
      ?auto_498542 - SURFACE
      ?auto_498543 - SURFACE
      ?auto_498544 - SURFACE
      ?auto_498545 - SURFACE
      ?auto_498546 - SURFACE
    )
    :vars
    (
      ?auto_498549 - HOIST
      ?auto_498548 - PLACE
      ?auto_498547 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_498549 ?auto_498548 ) ( SURFACE-AT ?auto_498545 ?auto_498548 ) ( CLEAR ?auto_498545 ) ( IS-CRATE ?auto_498546 ) ( not ( = ?auto_498545 ?auto_498546 ) ) ( TRUCK-AT ?auto_498547 ?auto_498548 ) ( AVAILABLE ?auto_498549 ) ( IN ?auto_498546 ?auto_498547 ) ( ON ?auto_498545 ?auto_498544 ) ( not ( = ?auto_498544 ?auto_498545 ) ) ( not ( = ?auto_498544 ?auto_498546 ) ) ( ON ?auto_498537 ?auto_498536 ) ( ON ?auto_498538 ?auto_498537 ) ( ON ?auto_498540 ?auto_498538 ) ( ON ?auto_498539 ?auto_498540 ) ( ON ?auto_498541 ?auto_498539 ) ( ON ?auto_498542 ?auto_498541 ) ( ON ?auto_498543 ?auto_498542 ) ( ON ?auto_498544 ?auto_498543 ) ( not ( = ?auto_498536 ?auto_498537 ) ) ( not ( = ?auto_498536 ?auto_498538 ) ) ( not ( = ?auto_498536 ?auto_498540 ) ) ( not ( = ?auto_498536 ?auto_498539 ) ) ( not ( = ?auto_498536 ?auto_498541 ) ) ( not ( = ?auto_498536 ?auto_498542 ) ) ( not ( = ?auto_498536 ?auto_498543 ) ) ( not ( = ?auto_498536 ?auto_498544 ) ) ( not ( = ?auto_498536 ?auto_498545 ) ) ( not ( = ?auto_498536 ?auto_498546 ) ) ( not ( = ?auto_498537 ?auto_498538 ) ) ( not ( = ?auto_498537 ?auto_498540 ) ) ( not ( = ?auto_498537 ?auto_498539 ) ) ( not ( = ?auto_498537 ?auto_498541 ) ) ( not ( = ?auto_498537 ?auto_498542 ) ) ( not ( = ?auto_498537 ?auto_498543 ) ) ( not ( = ?auto_498537 ?auto_498544 ) ) ( not ( = ?auto_498537 ?auto_498545 ) ) ( not ( = ?auto_498537 ?auto_498546 ) ) ( not ( = ?auto_498538 ?auto_498540 ) ) ( not ( = ?auto_498538 ?auto_498539 ) ) ( not ( = ?auto_498538 ?auto_498541 ) ) ( not ( = ?auto_498538 ?auto_498542 ) ) ( not ( = ?auto_498538 ?auto_498543 ) ) ( not ( = ?auto_498538 ?auto_498544 ) ) ( not ( = ?auto_498538 ?auto_498545 ) ) ( not ( = ?auto_498538 ?auto_498546 ) ) ( not ( = ?auto_498540 ?auto_498539 ) ) ( not ( = ?auto_498540 ?auto_498541 ) ) ( not ( = ?auto_498540 ?auto_498542 ) ) ( not ( = ?auto_498540 ?auto_498543 ) ) ( not ( = ?auto_498540 ?auto_498544 ) ) ( not ( = ?auto_498540 ?auto_498545 ) ) ( not ( = ?auto_498540 ?auto_498546 ) ) ( not ( = ?auto_498539 ?auto_498541 ) ) ( not ( = ?auto_498539 ?auto_498542 ) ) ( not ( = ?auto_498539 ?auto_498543 ) ) ( not ( = ?auto_498539 ?auto_498544 ) ) ( not ( = ?auto_498539 ?auto_498545 ) ) ( not ( = ?auto_498539 ?auto_498546 ) ) ( not ( = ?auto_498541 ?auto_498542 ) ) ( not ( = ?auto_498541 ?auto_498543 ) ) ( not ( = ?auto_498541 ?auto_498544 ) ) ( not ( = ?auto_498541 ?auto_498545 ) ) ( not ( = ?auto_498541 ?auto_498546 ) ) ( not ( = ?auto_498542 ?auto_498543 ) ) ( not ( = ?auto_498542 ?auto_498544 ) ) ( not ( = ?auto_498542 ?auto_498545 ) ) ( not ( = ?auto_498542 ?auto_498546 ) ) ( not ( = ?auto_498543 ?auto_498544 ) ) ( not ( = ?auto_498543 ?auto_498545 ) ) ( not ( = ?auto_498543 ?auto_498546 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_498544 ?auto_498545 ?auto_498546 )
      ( MAKE-10CRATE-VERIFY ?auto_498536 ?auto_498537 ?auto_498538 ?auto_498540 ?auto_498539 ?auto_498541 ?auto_498542 ?auto_498543 ?auto_498544 ?auto_498545 ?auto_498546 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_498641 - SURFACE
      ?auto_498642 - SURFACE
      ?auto_498643 - SURFACE
      ?auto_498645 - SURFACE
      ?auto_498644 - SURFACE
      ?auto_498646 - SURFACE
      ?auto_498647 - SURFACE
      ?auto_498648 - SURFACE
      ?auto_498649 - SURFACE
      ?auto_498650 - SURFACE
      ?auto_498651 - SURFACE
    )
    :vars
    (
      ?auto_498655 - HOIST
      ?auto_498653 - PLACE
      ?auto_498652 - TRUCK
      ?auto_498654 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_498655 ?auto_498653 ) ( SURFACE-AT ?auto_498650 ?auto_498653 ) ( CLEAR ?auto_498650 ) ( IS-CRATE ?auto_498651 ) ( not ( = ?auto_498650 ?auto_498651 ) ) ( AVAILABLE ?auto_498655 ) ( IN ?auto_498651 ?auto_498652 ) ( ON ?auto_498650 ?auto_498649 ) ( not ( = ?auto_498649 ?auto_498650 ) ) ( not ( = ?auto_498649 ?auto_498651 ) ) ( TRUCK-AT ?auto_498652 ?auto_498654 ) ( not ( = ?auto_498654 ?auto_498653 ) ) ( ON ?auto_498642 ?auto_498641 ) ( ON ?auto_498643 ?auto_498642 ) ( ON ?auto_498645 ?auto_498643 ) ( ON ?auto_498644 ?auto_498645 ) ( ON ?auto_498646 ?auto_498644 ) ( ON ?auto_498647 ?auto_498646 ) ( ON ?auto_498648 ?auto_498647 ) ( ON ?auto_498649 ?auto_498648 ) ( not ( = ?auto_498641 ?auto_498642 ) ) ( not ( = ?auto_498641 ?auto_498643 ) ) ( not ( = ?auto_498641 ?auto_498645 ) ) ( not ( = ?auto_498641 ?auto_498644 ) ) ( not ( = ?auto_498641 ?auto_498646 ) ) ( not ( = ?auto_498641 ?auto_498647 ) ) ( not ( = ?auto_498641 ?auto_498648 ) ) ( not ( = ?auto_498641 ?auto_498649 ) ) ( not ( = ?auto_498641 ?auto_498650 ) ) ( not ( = ?auto_498641 ?auto_498651 ) ) ( not ( = ?auto_498642 ?auto_498643 ) ) ( not ( = ?auto_498642 ?auto_498645 ) ) ( not ( = ?auto_498642 ?auto_498644 ) ) ( not ( = ?auto_498642 ?auto_498646 ) ) ( not ( = ?auto_498642 ?auto_498647 ) ) ( not ( = ?auto_498642 ?auto_498648 ) ) ( not ( = ?auto_498642 ?auto_498649 ) ) ( not ( = ?auto_498642 ?auto_498650 ) ) ( not ( = ?auto_498642 ?auto_498651 ) ) ( not ( = ?auto_498643 ?auto_498645 ) ) ( not ( = ?auto_498643 ?auto_498644 ) ) ( not ( = ?auto_498643 ?auto_498646 ) ) ( not ( = ?auto_498643 ?auto_498647 ) ) ( not ( = ?auto_498643 ?auto_498648 ) ) ( not ( = ?auto_498643 ?auto_498649 ) ) ( not ( = ?auto_498643 ?auto_498650 ) ) ( not ( = ?auto_498643 ?auto_498651 ) ) ( not ( = ?auto_498645 ?auto_498644 ) ) ( not ( = ?auto_498645 ?auto_498646 ) ) ( not ( = ?auto_498645 ?auto_498647 ) ) ( not ( = ?auto_498645 ?auto_498648 ) ) ( not ( = ?auto_498645 ?auto_498649 ) ) ( not ( = ?auto_498645 ?auto_498650 ) ) ( not ( = ?auto_498645 ?auto_498651 ) ) ( not ( = ?auto_498644 ?auto_498646 ) ) ( not ( = ?auto_498644 ?auto_498647 ) ) ( not ( = ?auto_498644 ?auto_498648 ) ) ( not ( = ?auto_498644 ?auto_498649 ) ) ( not ( = ?auto_498644 ?auto_498650 ) ) ( not ( = ?auto_498644 ?auto_498651 ) ) ( not ( = ?auto_498646 ?auto_498647 ) ) ( not ( = ?auto_498646 ?auto_498648 ) ) ( not ( = ?auto_498646 ?auto_498649 ) ) ( not ( = ?auto_498646 ?auto_498650 ) ) ( not ( = ?auto_498646 ?auto_498651 ) ) ( not ( = ?auto_498647 ?auto_498648 ) ) ( not ( = ?auto_498647 ?auto_498649 ) ) ( not ( = ?auto_498647 ?auto_498650 ) ) ( not ( = ?auto_498647 ?auto_498651 ) ) ( not ( = ?auto_498648 ?auto_498649 ) ) ( not ( = ?auto_498648 ?auto_498650 ) ) ( not ( = ?auto_498648 ?auto_498651 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_498649 ?auto_498650 ?auto_498651 )
      ( MAKE-10CRATE-VERIFY ?auto_498641 ?auto_498642 ?auto_498643 ?auto_498645 ?auto_498644 ?auto_498646 ?auto_498647 ?auto_498648 ?auto_498649 ?auto_498650 ?auto_498651 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_498756 - SURFACE
      ?auto_498757 - SURFACE
      ?auto_498758 - SURFACE
      ?auto_498760 - SURFACE
      ?auto_498759 - SURFACE
      ?auto_498761 - SURFACE
      ?auto_498762 - SURFACE
      ?auto_498763 - SURFACE
      ?auto_498764 - SURFACE
      ?auto_498765 - SURFACE
      ?auto_498766 - SURFACE
    )
    :vars
    (
      ?auto_498770 - HOIST
      ?auto_498771 - PLACE
      ?auto_498769 - TRUCK
      ?auto_498768 - PLACE
      ?auto_498767 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_498770 ?auto_498771 ) ( SURFACE-AT ?auto_498765 ?auto_498771 ) ( CLEAR ?auto_498765 ) ( IS-CRATE ?auto_498766 ) ( not ( = ?auto_498765 ?auto_498766 ) ) ( AVAILABLE ?auto_498770 ) ( ON ?auto_498765 ?auto_498764 ) ( not ( = ?auto_498764 ?auto_498765 ) ) ( not ( = ?auto_498764 ?auto_498766 ) ) ( TRUCK-AT ?auto_498769 ?auto_498768 ) ( not ( = ?auto_498768 ?auto_498771 ) ) ( HOIST-AT ?auto_498767 ?auto_498768 ) ( LIFTING ?auto_498767 ?auto_498766 ) ( not ( = ?auto_498770 ?auto_498767 ) ) ( ON ?auto_498757 ?auto_498756 ) ( ON ?auto_498758 ?auto_498757 ) ( ON ?auto_498760 ?auto_498758 ) ( ON ?auto_498759 ?auto_498760 ) ( ON ?auto_498761 ?auto_498759 ) ( ON ?auto_498762 ?auto_498761 ) ( ON ?auto_498763 ?auto_498762 ) ( ON ?auto_498764 ?auto_498763 ) ( not ( = ?auto_498756 ?auto_498757 ) ) ( not ( = ?auto_498756 ?auto_498758 ) ) ( not ( = ?auto_498756 ?auto_498760 ) ) ( not ( = ?auto_498756 ?auto_498759 ) ) ( not ( = ?auto_498756 ?auto_498761 ) ) ( not ( = ?auto_498756 ?auto_498762 ) ) ( not ( = ?auto_498756 ?auto_498763 ) ) ( not ( = ?auto_498756 ?auto_498764 ) ) ( not ( = ?auto_498756 ?auto_498765 ) ) ( not ( = ?auto_498756 ?auto_498766 ) ) ( not ( = ?auto_498757 ?auto_498758 ) ) ( not ( = ?auto_498757 ?auto_498760 ) ) ( not ( = ?auto_498757 ?auto_498759 ) ) ( not ( = ?auto_498757 ?auto_498761 ) ) ( not ( = ?auto_498757 ?auto_498762 ) ) ( not ( = ?auto_498757 ?auto_498763 ) ) ( not ( = ?auto_498757 ?auto_498764 ) ) ( not ( = ?auto_498757 ?auto_498765 ) ) ( not ( = ?auto_498757 ?auto_498766 ) ) ( not ( = ?auto_498758 ?auto_498760 ) ) ( not ( = ?auto_498758 ?auto_498759 ) ) ( not ( = ?auto_498758 ?auto_498761 ) ) ( not ( = ?auto_498758 ?auto_498762 ) ) ( not ( = ?auto_498758 ?auto_498763 ) ) ( not ( = ?auto_498758 ?auto_498764 ) ) ( not ( = ?auto_498758 ?auto_498765 ) ) ( not ( = ?auto_498758 ?auto_498766 ) ) ( not ( = ?auto_498760 ?auto_498759 ) ) ( not ( = ?auto_498760 ?auto_498761 ) ) ( not ( = ?auto_498760 ?auto_498762 ) ) ( not ( = ?auto_498760 ?auto_498763 ) ) ( not ( = ?auto_498760 ?auto_498764 ) ) ( not ( = ?auto_498760 ?auto_498765 ) ) ( not ( = ?auto_498760 ?auto_498766 ) ) ( not ( = ?auto_498759 ?auto_498761 ) ) ( not ( = ?auto_498759 ?auto_498762 ) ) ( not ( = ?auto_498759 ?auto_498763 ) ) ( not ( = ?auto_498759 ?auto_498764 ) ) ( not ( = ?auto_498759 ?auto_498765 ) ) ( not ( = ?auto_498759 ?auto_498766 ) ) ( not ( = ?auto_498761 ?auto_498762 ) ) ( not ( = ?auto_498761 ?auto_498763 ) ) ( not ( = ?auto_498761 ?auto_498764 ) ) ( not ( = ?auto_498761 ?auto_498765 ) ) ( not ( = ?auto_498761 ?auto_498766 ) ) ( not ( = ?auto_498762 ?auto_498763 ) ) ( not ( = ?auto_498762 ?auto_498764 ) ) ( not ( = ?auto_498762 ?auto_498765 ) ) ( not ( = ?auto_498762 ?auto_498766 ) ) ( not ( = ?auto_498763 ?auto_498764 ) ) ( not ( = ?auto_498763 ?auto_498765 ) ) ( not ( = ?auto_498763 ?auto_498766 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_498764 ?auto_498765 ?auto_498766 )
      ( MAKE-10CRATE-VERIFY ?auto_498756 ?auto_498757 ?auto_498758 ?auto_498760 ?auto_498759 ?auto_498761 ?auto_498762 ?auto_498763 ?auto_498764 ?auto_498765 ?auto_498766 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_498881 - SURFACE
      ?auto_498882 - SURFACE
      ?auto_498883 - SURFACE
      ?auto_498885 - SURFACE
      ?auto_498884 - SURFACE
      ?auto_498886 - SURFACE
      ?auto_498887 - SURFACE
      ?auto_498888 - SURFACE
      ?auto_498889 - SURFACE
      ?auto_498890 - SURFACE
      ?auto_498891 - SURFACE
    )
    :vars
    (
      ?auto_498894 - HOIST
      ?auto_498893 - PLACE
      ?auto_498895 - TRUCK
      ?auto_498897 - PLACE
      ?auto_498896 - HOIST
      ?auto_498892 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_498894 ?auto_498893 ) ( SURFACE-AT ?auto_498890 ?auto_498893 ) ( CLEAR ?auto_498890 ) ( IS-CRATE ?auto_498891 ) ( not ( = ?auto_498890 ?auto_498891 ) ) ( AVAILABLE ?auto_498894 ) ( ON ?auto_498890 ?auto_498889 ) ( not ( = ?auto_498889 ?auto_498890 ) ) ( not ( = ?auto_498889 ?auto_498891 ) ) ( TRUCK-AT ?auto_498895 ?auto_498897 ) ( not ( = ?auto_498897 ?auto_498893 ) ) ( HOIST-AT ?auto_498896 ?auto_498897 ) ( not ( = ?auto_498894 ?auto_498896 ) ) ( AVAILABLE ?auto_498896 ) ( SURFACE-AT ?auto_498891 ?auto_498897 ) ( ON ?auto_498891 ?auto_498892 ) ( CLEAR ?auto_498891 ) ( not ( = ?auto_498890 ?auto_498892 ) ) ( not ( = ?auto_498891 ?auto_498892 ) ) ( not ( = ?auto_498889 ?auto_498892 ) ) ( ON ?auto_498882 ?auto_498881 ) ( ON ?auto_498883 ?auto_498882 ) ( ON ?auto_498885 ?auto_498883 ) ( ON ?auto_498884 ?auto_498885 ) ( ON ?auto_498886 ?auto_498884 ) ( ON ?auto_498887 ?auto_498886 ) ( ON ?auto_498888 ?auto_498887 ) ( ON ?auto_498889 ?auto_498888 ) ( not ( = ?auto_498881 ?auto_498882 ) ) ( not ( = ?auto_498881 ?auto_498883 ) ) ( not ( = ?auto_498881 ?auto_498885 ) ) ( not ( = ?auto_498881 ?auto_498884 ) ) ( not ( = ?auto_498881 ?auto_498886 ) ) ( not ( = ?auto_498881 ?auto_498887 ) ) ( not ( = ?auto_498881 ?auto_498888 ) ) ( not ( = ?auto_498881 ?auto_498889 ) ) ( not ( = ?auto_498881 ?auto_498890 ) ) ( not ( = ?auto_498881 ?auto_498891 ) ) ( not ( = ?auto_498881 ?auto_498892 ) ) ( not ( = ?auto_498882 ?auto_498883 ) ) ( not ( = ?auto_498882 ?auto_498885 ) ) ( not ( = ?auto_498882 ?auto_498884 ) ) ( not ( = ?auto_498882 ?auto_498886 ) ) ( not ( = ?auto_498882 ?auto_498887 ) ) ( not ( = ?auto_498882 ?auto_498888 ) ) ( not ( = ?auto_498882 ?auto_498889 ) ) ( not ( = ?auto_498882 ?auto_498890 ) ) ( not ( = ?auto_498882 ?auto_498891 ) ) ( not ( = ?auto_498882 ?auto_498892 ) ) ( not ( = ?auto_498883 ?auto_498885 ) ) ( not ( = ?auto_498883 ?auto_498884 ) ) ( not ( = ?auto_498883 ?auto_498886 ) ) ( not ( = ?auto_498883 ?auto_498887 ) ) ( not ( = ?auto_498883 ?auto_498888 ) ) ( not ( = ?auto_498883 ?auto_498889 ) ) ( not ( = ?auto_498883 ?auto_498890 ) ) ( not ( = ?auto_498883 ?auto_498891 ) ) ( not ( = ?auto_498883 ?auto_498892 ) ) ( not ( = ?auto_498885 ?auto_498884 ) ) ( not ( = ?auto_498885 ?auto_498886 ) ) ( not ( = ?auto_498885 ?auto_498887 ) ) ( not ( = ?auto_498885 ?auto_498888 ) ) ( not ( = ?auto_498885 ?auto_498889 ) ) ( not ( = ?auto_498885 ?auto_498890 ) ) ( not ( = ?auto_498885 ?auto_498891 ) ) ( not ( = ?auto_498885 ?auto_498892 ) ) ( not ( = ?auto_498884 ?auto_498886 ) ) ( not ( = ?auto_498884 ?auto_498887 ) ) ( not ( = ?auto_498884 ?auto_498888 ) ) ( not ( = ?auto_498884 ?auto_498889 ) ) ( not ( = ?auto_498884 ?auto_498890 ) ) ( not ( = ?auto_498884 ?auto_498891 ) ) ( not ( = ?auto_498884 ?auto_498892 ) ) ( not ( = ?auto_498886 ?auto_498887 ) ) ( not ( = ?auto_498886 ?auto_498888 ) ) ( not ( = ?auto_498886 ?auto_498889 ) ) ( not ( = ?auto_498886 ?auto_498890 ) ) ( not ( = ?auto_498886 ?auto_498891 ) ) ( not ( = ?auto_498886 ?auto_498892 ) ) ( not ( = ?auto_498887 ?auto_498888 ) ) ( not ( = ?auto_498887 ?auto_498889 ) ) ( not ( = ?auto_498887 ?auto_498890 ) ) ( not ( = ?auto_498887 ?auto_498891 ) ) ( not ( = ?auto_498887 ?auto_498892 ) ) ( not ( = ?auto_498888 ?auto_498889 ) ) ( not ( = ?auto_498888 ?auto_498890 ) ) ( not ( = ?auto_498888 ?auto_498891 ) ) ( not ( = ?auto_498888 ?auto_498892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_498889 ?auto_498890 ?auto_498891 )
      ( MAKE-10CRATE-VERIFY ?auto_498881 ?auto_498882 ?auto_498883 ?auto_498885 ?auto_498884 ?auto_498886 ?auto_498887 ?auto_498888 ?auto_498889 ?auto_498890 ?auto_498891 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_499007 - SURFACE
      ?auto_499008 - SURFACE
      ?auto_499009 - SURFACE
      ?auto_499011 - SURFACE
      ?auto_499010 - SURFACE
      ?auto_499012 - SURFACE
      ?auto_499013 - SURFACE
      ?auto_499014 - SURFACE
      ?auto_499015 - SURFACE
      ?auto_499016 - SURFACE
      ?auto_499017 - SURFACE
    )
    :vars
    (
      ?auto_499022 - HOIST
      ?auto_499021 - PLACE
      ?auto_499023 - PLACE
      ?auto_499018 - HOIST
      ?auto_499020 - SURFACE
      ?auto_499019 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_499022 ?auto_499021 ) ( SURFACE-AT ?auto_499016 ?auto_499021 ) ( CLEAR ?auto_499016 ) ( IS-CRATE ?auto_499017 ) ( not ( = ?auto_499016 ?auto_499017 ) ) ( AVAILABLE ?auto_499022 ) ( ON ?auto_499016 ?auto_499015 ) ( not ( = ?auto_499015 ?auto_499016 ) ) ( not ( = ?auto_499015 ?auto_499017 ) ) ( not ( = ?auto_499023 ?auto_499021 ) ) ( HOIST-AT ?auto_499018 ?auto_499023 ) ( not ( = ?auto_499022 ?auto_499018 ) ) ( AVAILABLE ?auto_499018 ) ( SURFACE-AT ?auto_499017 ?auto_499023 ) ( ON ?auto_499017 ?auto_499020 ) ( CLEAR ?auto_499017 ) ( not ( = ?auto_499016 ?auto_499020 ) ) ( not ( = ?auto_499017 ?auto_499020 ) ) ( not ( = ?auto_499015 ?auto_499020 ) ) ( TRUCK-AT ?auto_499019 ?auto_499021 ) ( ON ?auto_499008 ?auto_499007 ) ( ON ?auto_499009 ?auto_499008 ) ( ON ?auto_499011 ?auto_499009 ) ( ON ?auto_499010 ?auto_499011 ) ( ON ?auto_499012 ?auto_499010 ) ( ON ?auto_499013 ?auto_499012 ) ( ON ?auto_499014 ?auto_499013 ) ( ON ?auto_499015 ?auto_499014 ) ( not ( = ?auto_499007 ?auto_499008 ) ) ( not ( = ?auto_499007 ?auto_499009 ) ) ( not ( = ?auto_499007 ?auto_499011 ) ) ( not ( = ?auto_499007 ?auto_499010 ) ) ( not ( = ?auto_499007 ?auto_499012 ) ) ( not ( = ?auto_499007 ?auto_499013 ) ) ( not ( = ?auto_499007 ?auto_499014 ) ) ( not ( = ?auto_499007 ?auto_499015 ) ) ( not ( = ?auto_499007 ?auto_499016 ) ) ( not ( = ?auto_499007 ?auto_499017 ) ) ( not ( = ?auto_499007 ?auto_499020 ) ) ( not ( = ?auto_499008 ?auto_499009 ) ) ( not ( = ?auto_499008 ?auto_499011 ) ) ( not ( = ?auto_499008 ?auto_499010 ) ) ( not ( = ?auto_499008 ?auto_499012 ) ) ( not ( = ?auto_499008 ?auto_499013 ) ) ( not ( = ?auto_499008 ?auto_499014 ) ) ( not ( = ?auto_499008 ?auto_499015 ) ) ( not ( = ?auto_499008 ?auto_499016 ) ) ( not ( = ?auto_499008 ?auto_499017 ) ) ( not ( = ?auto_499008 ?auto_499020 ) ) ( not ( = ?auto_499009 ?auto_499011 ) ) ( not ( = ?auto_499009 ?auto_499010 ) ) ( not ( = ?auto_499009 ?auto_499012 ) ) ( not ( = ?auto_499009 ?auto_499013 ) ) ( not ( = ?auto_499009 ?auto_499014 ) ) ( not ( = ?auto_499009 ?auto_499015 ) ) ( not ( = ?auto_499009 ?auto_499016 ) ) ( not ( = ?auto_499009 ?auto_499017 ) ) ( not ( = ?auto_499009 ?auto_499020 ) ) ( not ( = ?auto_499011 ?auto_499010 ) ) ( not ( = ?auto_499011 ?auto_499012 ) ) ( not ( = ?auto_499011 ?auto_499013 ) ) ( not ( = ?auto_499011 ?auto_499014 ) ) ( not ( = ?auto_499011 ?auto_499015 ) ) ( not ( = ?auto_499011 ?auto_499016 ) ) ( not ( = ?auto_499011 ?auto_499017 ) ) ( not ( = ?auto_499011 ?auto_499020 ) ) ( not ( = ?auto_499010 ?auto_499012 ) ) ( not ( = ?auto_499010 ?auto_499013 ) ) ( not ( = ?auto_499010 ?auto_499014 ) ) ( not ( = ?auto_499010 ?auto_499015 ) ) ( not ( = ?auto_499010 ?auto_499016 ) ) ( not ( = ?auto_499010 ?auto_499017 ) ) ( not ( = ?auto_499010 ?auto_499020 ) ) ( not ( = ?auto_499012 ?auto_499013 ) ) ( not ( = ?auto_499012 ?auto_499014 ) ) ( not ( = ?auto_499012 ?auto_499015 ) ) ( not ( = ?auto_499012 ?auto_499016 ) ) ( not ( = ?auto_499012 ?auto_499017 ) ) ( not ( = ?auto_499012 ?auto_499020 ) ) ( not ( = ?auto_499013 ?auto_499014 ) ) ( not ( = ?auto_499013 ?auto_499015 ) ) ( not ( = ?auto_499013 ?auto_499016 ) ) ( not ( = ?auto_499013 ?auto_499017 ) ) ( not ( = ?auto_499013 ?auto_499020 ) ) ( not ( = ?auto_499014 ?auto_499015 ) ) ( not ( = ?auto_499014 ?auto_499016 ) ) ( not ( = ?auto_499014 ?auto_499017 ) ) ( not ( = ?auto_499014 ?auto_499020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_499015 ?auto_499016 ?auto_499017 )
      ( MAKE-10CRATE-VERIFY ?auto_499007 ?auto_499008 ?auto_499009 ?auto_499011 ?auto_499010 ?auto_499012 ?auto_499013 ?auto_499014 ?auto_499015 ?auto_499016 ?auto_499017 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_499133 - SURFACE
      ?auto_499134 - SURFACE
      ?auto_499135 - SURFACE
      ?auto_499137 - SURFACE
      ?auto_499136 - SURFACE
      ?auto_499138 - SURFACE
      ?auto_499139 - SURFACE
      ?auto_499140 - SURFACE
      ?auto_499141 - SURFACE
      ?auto_499142 - SURFACE
      ?auto_499143 - SURFACE
    )
    :vars
    (
      ?auto_499148 - HOIST
      ?auto_499147 - PLACE
      ?auto_499145 - PLACE
      ?auto_499146 - HOIST
      ?auto_499149 - SURFACE
      ?auto_499144 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_499148 ?auto_499147 ) ( IS-CRATE ?auto_499143 ) ( not ( = ?auto_499142 ?auto_499143 ) ) ( not ( = ?auto_499141 ?auto_499142 ) ) ( not ( = ?auto_499141 ?auto_499143 ) ) ( not ( = ?auto_499145 ?auto_499147 ) ) ( HOIST-AT ?auto_499146 ?auto_499145 ) ( not ( = ?auto_499148 ?auto_499146 ) ) ( AVAILABLE ?auto_499146 ) ( SURFACE-AT ?auto_499143 ?auto_499145 ) ( ON ?auto_499143 ?auto_499149 ) ( CLEAR ?auto_499143 ) ( not ( = ?auto_499142 ?auto_499149 ) ) ( not ( = ?auto_499143 ?auto_499149 ) ) ( not ( = ?auto_499141 ?auto_499149 ) ) ( TRUCK-AT ?auto_499144 ?auto_499147 ) ( SURFACE-AT ?auto_499141 ?auto_499147 ) ( CLEAR ?auto_499141 ) ( LIFTING ?auto_499148 ?auto_499142 ) ( IS-CRATE ?auto_499142 ) ( ON ?auto_499134 ?auto_499133 ) ( ON ?auto_499135 ?auto_499134 ) ( ON ?auto_499137 ?auto_499135 ) ( ON ?auto_499136 ?auto_499137 ) ( ON ?auto_499138 ?auto_499136 ) ( ON ?auto_499139 ?auto_499138 ) ( ON ?auto_499140 ?auto_499139 ) ( ON ?auto_499141 ?auto_499140 ) ( not ( = ?auto_499133 ?auto_499134 ) ) ( not ( = ?auto_499133 ?auto_499135 ) ) ( not ( = ?auto_499133 ?auto_499137 ) ) ( not ( = ?auto_499133 ?auto_499136 ) ) ( not ( = ?auto_499133 ?auto_499138 ) ) ( not ( = ?auto_499133 ?auto_499139 ) ) ( not ( = ?auto_499133 ?auto_499140 ) ) ( not ( = ?auto_499133 ?auto_499141 ) ) ( not ( = ?auto_499133 ?auto_499142 ) ) ( not ( = ?auto_499133 ?auto_499143 ) ) ( not ( = ?auto_499133 ?auto_499149 ) ) ( not ( = ?auto_499134 ?auto_499135 ) ) ( not ( = ?auto_499134 ?auto_499137 ) ) ( not ( = ?auto_499134 ?auto_499136 ) ) ( not ( = ?auto_499134 ?auto_499138 ) ) ( not ( = ?auto_499134 ?auto_499139 ) ) ( not ( = ?auto_499134 ?auto_499140 ) ) ( not ( = ?auto_499134 ?auto_499141 ) ) ( not ( = ?auto_499134 ?auto_499142 ) ) ( not ( = ?auto_499134 ?auto_499143 ) ) ( not ( = ?auto_499134 ?auto_499149 ) ) ( not ( = ?auto_499135 ?auto_499137 ) ) ( not ( = ?auto_499135 ?auto_499136 ) ) ( not ( = ?auto_499135 ?auto_499138 ) ) ( not ( = ?auto_499135 ?auto_499139 ) ) ( not ( = ?auto_499135 ?auto_499140 ) ) ( not ( = ?auto_499135 ?auto_499141 ) ) ( not ( = ?auto_499135 ?auto_499142 ) ) ( not ( = ?auto_499135 ?auto_499143 ) ) ( not ( = ?auto_499135 ?auto_499149 ) ) ( not ( = ?auto_499137 ?auto_499136 ) ) ( not ( = ?auto_499137 ?auto_499138 ) ) ( not ( = ?auto_499137 ?auto_499139 ) ) ( not ( = ?auto_499137 ?auto_499140 ) ) ( not ( = ?auto_499137 ?auto_499141 ) ) ( not ( = ?auto_499137 ?auto_499142 ) ) ( not ( = ?auto_499137 ?auto_499143 ) ) ( not ( = ?auto_499137 ?auto_499149 ) ) ( not ( = ?auto_499136 ?auto_499138 ) ) ( not ( = ?auto_499136 ?auto_499139 ) ) ( not ( = ?auto_499136 ?auto_499140 ) ) ( not ( = ?auto_499136 ?auto_499141 ) ) ( not ( = ?auto_499136 ?auto_499142 ) ) ( not ( = ?auto_499136 ?auto_499143 ) ) ( not ( = ?auto_499136 ?auto_499149 ) ) ( not ( = ?auto_499138 ?auto_499139 ) ) ( not ( = ?auto_499138 ?auto_499140 ) ) ( not ( = ?auto_499138 ?auto_499141 ) ) ( not ( = ?auto_499138 ?auto_499142 ) ) ( not ( = ?auto_499138 ?auto_499143 ) ) ( not ( = ?auto_499138 ?auto_499149 ) ) ( not ( = ?auto_499139 ?auto_499140 ) ) ( not ( = ?auto_499139 ?auto_499141 ) ) ( not ( = ?auto_499139 ?auto_499142 ) ) ( not ( = ?auto_499139 ?auto_499143 ) ) ( not ( = ?auto_499139 ?auto_499149 ) ) ( not ( = ?auto_499140 ?auto_499141 ) ) ( not ( = ?auto_499140 ?auto_499142 ) ) ( not ( = ?auto_499140 ?auto_499143 ) ) ( not ( = ?auto_499140 ?auto_499149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_499141 ?auto_499142 ?auto_499143 )
      ( MAKE-10CRATE-VERIFY ?auto_499133 ?auto_499134 ?auto_499135 ?auto_499137 ?auto_499136 ?auto_499138 ?auto_499139 ?auto_499140 ?auto_499141 ?auto_499142 ?auto_499143 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_499259 - SURFACE
      ?auto_499260 - SURFACE
      ?auto_499261 - SURFACE
      ?auto_499263 - SURFACE
      ?auto_499262 - SURFACE
      ?auto_499264 - SURFACE
      ?auto_499265 - SURFACE
      ?auto_499266 - SURFACE
      ?auto_499267 - SURFACE
      ?auto_499268 - SURFACE
      ?auto_499269 - SURFACE
    )
    :vars
    (
      ?auto_499275 - HOIST
      ?auto_499270 - PLACE
      ?auto_499271 - PLACE
      ?auto_499272 - HOIST
      ?auto_499273 - SURFACE
      ?auto_499274 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_499275 ?auto_499270 ) ( IS-CRATE ?auto_499269 ) ( not ( = ?auto_499268 ?auto_499269 ) ) ( not ( = ?auto_499267 ?auto_499268 ) ) ( not ( = ?auto_499267 ?auto_499269 ) ) ( not ( = ?auto_499271 ?auto_499270 ) ) ( HOIST-AT ?auto_499272 ?auto_499271 ) ( not ( = ?auto_499275 ?auto_499272 ) ) ( AVAILABLE ?auto_499272 ) ( SURFACE-AT ?auto_499269 ?auto_499271 ) ( ON ?auto_499269 ?auto_499273 ) ( CLEAR ?auto_499269 ) ( not ( = ?auto_499268 ?auto_499273 ) ) ( not ( = ?auto_499269 ?auto_499273 ) ) ( not ( = ?auto_499267 ?auto_499273 ) ) ( TRUCK-AT ?auto_499274 ?auto_499270 ) ( SURFACE-AT ?auto_499267 ?auto_499270 ) ( CLEAR ?auto_499267 ) ( IS-CRATE ?auto_499268 ) ( AVAILABLE ?auto_499275 ) ( IN ?auto_499268 ?auto_499274 ) ( ON ?auto_499260 ?auto_499259 ) ( ON ?auto_499261 ?auto_499260 ) ( ON ?auto_499263 ?auto_499261 ) ( ON ?auto_499262 ?auto_499263 ) ( ON ?auto_499264 ?auto_499262 ) ( ON ?auto_499265 ?auto_499264 ) ( ON ?auto_499266 ?auto_499265 ) ( ON ?auto_499267 ?auto_499266 ) ( not ( = ?auto_499259 ?auto_499260 ) ) ( not ( = ?auto_499259 ?auto_499261 ) ) ( not ( = ?auto_499259 ?auto_499263 ) ) ( not ( = ?auto_499259 ?auto_499262 ) ) ( not ( = ?auto_499259 ?auto_499264 ) ) ( not ( = ?auto_499259 ?auto_499265 ) ) ( not ( = ?auto_499259 ?auto_499266 ) ) ( not ( = ?auto_499259 ?auto_499267 ) ) ( not ( = ?auto_499259 ?auto_499268 ) ) ( not ( = ?auto_499259 ?auto_499269 ) ) ( not ( = ?auto_499259 ?auto_499273 ) ) ( not ( = ?auto_499260 ?auto_499261 ) ) ( not ( = ?auto_499260 ?auto_499263 ) ) ( not ( = ?auto_499260 ?auto_499262 ) ) ( not ( = ?auto_499260 ?auto_499264 ) ) ( not ( = ?auto_499260 ?auto_499265 ) ) ( not ( = ?auto_499260 ?auto_499266 ) ) ( not ( = ?auto_499260 ?auto_499267 ) ) ( not ( = ?auto_499260 ?auto_499268 ) ) ( not ( = ?auto_499260 ?auto_499269 ) ) ( not ( = ?auto_499260 ?auto_499273 ) ) ( not ( = ?auto_499261 ?auto_499263 ) ) ( not ( = ?auto_499261 ?auto_499262 ) ) ( not ( = ?auto_499261 ?auto_499264 ) ) ( not ( = ?auto_499261 ?auto_499265 ) ) ( not ( = ?auto_499261 ?auto_499266 ) ) ( not ( = ?auto_499261 ?auto_499267 ) ) ( not ( = ?auto_499261 ?auto_499268 ) ) ( not ( = ?auto_499261 ?auto_499269 ) ) ( not ( = ?auto_499261 ?auto_499273 ) ) ( not ( = ?auto_499263 ?auto_499262 ) ) ( not ( = ?auto_499263 ?auto_499264 ) ) ( not ( = ?auto_499263 ?auto_499265 ) ) ( not ( = ?auto_499263 ?auto_499266 ) ) ( not ( = ?auto_499263 ?auto_499267 ) ) ( not ( = ?auto_499263 ?auto_499268 ) ) ( not ( = ?auto_499263 ?auto_499269 ) ) ( not ( = ?auto_499263 ?auto_499273 ) ) ( not ( = ?auto_499262 ?auto_499264 ) ) ( not ( = ?auto_499262 ?auto_499265 ) ) ( not ( = ?auto_499262 ?auto_499266 ) ) ( not ( = ?auto_499262 ?auto_499267 ) ) ( not ( = ?auto_499262 ?auto_499268 ) ) ( not ( = ?auto_499262 ?auto_499269 ) ) ( not ( = ?auto_499262 ?auto_499273 ) ) ( not ( = ?auto_499264 ?auto_499265 ) ) ( not ( = ?auto_499264 ?auto_499266 ) ) ( not ( = ?auto_499264 ?auto_499267 ) ) ( not ( = ?auto_499264 ?auto_499268 ) ) ( not ( = ?auto_499264 ?auto_499269 ) ) ( not ( = ?auto_499264 ?auto_499273 ) ) ( not ( = ?auto_499265 ?auto_499266 ) ) ( not ( = ?auto_499265 ?auto_499267 ) ) ( not ( = ?auto_499265 ?auto_499268 ) ) ( not ( = ?auto_499265 ?auto_499269 ) ) ( not ( = ?auto_499265 ?auto_499273 ) ) ( not ( = ?auto_499266 ?auto_499267 ) ) ( not ( = ?auto_499266 ?auto_499268 ) ) ( not ( = ?auto_499266 ?auto_499269 ) ) ( not ( = ?auto_499266 ?auto_499273 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_499267 ?auto_499268 ?auto_499269 )
      ( MAKE-10CRATE-VERIFY ?auto_499259 ?auto_499260 ?auto_499261 ?auto_499263 ?auto_499262 ?auto_499264 ?auto_499265 ?auto_499266 ?auto_499267 ?auto_499268 ?auto_499269 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_506543 - SURFACE
      ?auto_506544 - SURFACE
      ?auto_506545 - SURFACE
      ?auto_506547 - SURFACE
      ?auto_506546 - SURFACE
      ?auto_506548 - SURFACE
      ?auto_506549 - SURFACE
      ?auto_506550 - SURFACE
      ?auto_506551 - SURFACE
      ?auto_506552 - SURFACE
      ?auto_506553 - SURFACE
      ?auto_506554 - SURFACE
    )
    :vars
    (
      ?auto_506555 - HOIST
      ?auto_506556 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_506555 ?auto_506556 ) ( SURFACE-AT ?auto_506553 ?auto_506556 ) ( CLEAR ?auto_506553 ) ( LIFTING ?auto_506555 ?auto_506554 ) ( IS-CRATE ?auto_506554 ) ( not ( = ?auto_506553 ?auto_506554 ) ) ( ON ?auto_506544 ?auto_506543 ) ( ON ?auto_506545 ?auto_506544 ) ( ON ?auto_506547 ?auto_506545 ) ( ON ?auto_506546 ?auto_506547 ) ( ON ?auto_506548 ?auto_506546 ) ( ON ?auto_506549 ?auto_506548 ) ( ON ?auto_506550 ?auto_506549 ) ( ON ?auto_506551 ?auto_506550 ) ( ON ?auto_506552 ?auto_506551 ) ( ON ?auto_506553 ?auto_506552 ) ( not ( = ?auto_506543 ?auto_506544 ) ) ( not ( = ?auto_506543 ?auto_506545 ) ) ( not ( = ?auto_506543 ?auto_506547 ) ) ( not ( = ?auto_506543 ?auto_506546 ) ) ( not ( = ?auto_506543 ?auto_506548 ) ) ( not ( = ?auto_506543 ?auto_506549 ) ) ( not ( = ?auto_506543 ?auto_506550 ) ) ( not ( = ?auto_506543 ?auto_506551 ) ) ( not ( = ?auto_506543 ?auto_506552 ) ) ( not ( = ?auto_506543 ?auto_506553 ) ) ( not ( = ?auto_506543 ?auto_506554 ) ) ( not ( = ?auto_506544 ?auto_506545 ) ) ( not ( = ?auto_506544 ?auto_506547 ) ) ( not ( = ?auto_506544 ?auto_506546 ) ) ( not ( = ?auto_506544 ?auto_506548 ) ) ( not ( = ?auto_506544 ?auto_506549 ) ) ( not ( = ?auto_506544 ?auto_506550 ) ) ( not ( = ?auto_506544 ?auto_506551 ) ) ( not ( = ?auto_506544 ?auto_506552 ) ) ( not ( = ?auto_506544 ?auto_506553 ) ) ( not ( = ?auto_506544 ?auto_506554 ) ) ( not ( = ?auto_506545 ?auto_506547 ) ) ( not ( = ?auto_506545 ?auto_506546 ) ) ( not ( = ?auto_506545 ?auto_506548 ) ) ( not ( = ?auto_506545 ?auto_506549 ) ) ( not ( = ?auto_506545 ?auto_506550 ) ) ( not ( = ?auto_506545 ?auto_506551 ) ) ( not ( = ?auto_506545 ?auto_506552 ) ) ( not ( = ?auto_506545 ?auto_506553 ) ) ( not ( = ?auto_506545 ?auto_506554 ) ) ( not ( = ?auto_506547 ?auto_506546 ) ) ( not ( = ?auto_506547 ?auto_506548 ) ) ( not ( = ?auto_506547 ?auto_506549 ) ) ( not ( = ?auto_506547 ?auto_506550 ) ) ( not ( = ?auto_506547 ?auto_506551 ) ) ( not ( = ?auto_506547 ?auto_506552 ) ) ( not ( = ?auto_506547 ?auto_506553 ) ) ( not ( = ?auto_506547 ?auto_506554 ) ) ( not ( = ?auto_506546 ?auto_506548 ) ) ( not ( = ?auto_506546 ?auto_506549 ) ) ( not ( = ?auto_506546 ?auto_506550 ) ) ( not ( = ?auto_506546 ?auto_506551 ) ) ( not ( = ?auto_506546 ?auto_506552 ) ) ( not ( = ?auto_506546 ?auto_506553 ) ) ( not ( = ?auto_506546 ?auto_506554 ) ) ( not ( = ?auto_506548 ?auto_506549 ) ) ( not ( = ?auto_506548 ?auto_506550 ) ) ( not ( = ?auto_506548 ?auto_506551 ) ) ( not ( = ?auto_506548 ?auto_506552 ) ) ( not ( = ?auto_506548 ?auto_506553 ) ) ( not ( = ?auto_506548 ?auto_506554 ) ) ( not ( = ?auto_506549 ?auto_506550 ) ) ( not ( = ?auto_506549 ?auto_506551 ) ) ( not ( = ?auto_506549 ?auto_506552 ) ) ( not ( = ?auto_506549 ?auto_506553 ) ) ( not ( = ?auto_506549 ?auto_506554 ) ) ( not ( = ?auto_506550 ?auto_506551 ) ) ( not ( = ?auto_506550 ?auto_506552 ) ) ( not ( = ?auto_506550 ?auto_506553 ) ) ( not ( = ?auto_506550 ?auto_506554 ) ) ( not ( = ?auto_506551 ?auto_506552 ) ) ( not ( = ?auto_506551 ?auto_506553 ) ) ( not ( = ?auto_506551 ?auto_506554 ) ) ( not ( = ?auto_506552 ?auto_506553 ) ) ( not ( = ?auto_506552 ?auto_506554 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_506553 ?auto_506554 )
      ( MAKE-11CRATE-VERIFY ?auto_506543 ?auto_506544 ?auto_506545 ?auto_506547 ?auto_506546 ?auto_506548 ?auto_506549 ?auto_506550 ?auto_506551 ?auto_506552 ?auto_506553 ?auto_506554 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_506652 - SURFACE
      ?auto_506653 - SURFACE
      ?auto_506654 - SURFACE
      ?auto_506656 - SURFACE
      ?auto_506655 - SURFACE
      ?auto_506657 - SURFACE
      ?auto_506658 - SURFACE
      ?auto_506659 - SURFACE
      ?auto_506660 - SURFACE
      ?auto_506661 - SURFACE
      ?auto_506662 - SURFACE
      ?auto_506663 - SURFACE
    )
    :vars
    (
      ?auto_506666 - HOIST
      ?auto_506664 - PLACE
      ?auto_506665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_506666 ?auto_506664 ) ( SURFACE-AT ?auto_506662 ?auto_506664 ) ( CLEAR ?auto_506662 ) ( IS-CRATE ?auto_506663 ) ( not ( = ?auto_506662 ?auto_506663 ) ) ( TRUCK-AT ?auto_506665 ?auto_506664 ) ( AVAILABLE ?auto_506666 ) ( IN ?auto_506663 ?auto_506665 ) ( ON ?auto_506662 ?auto_506661 ) ( not ( = ?auto_506661 ?auto_506662 ) ) ( not ( = ?auto_506661 ?auto_506663 ) ) ( ON ?auto_506653 ?auto_506652 ) ( ON ?auto_506654 ?auto_506653 ) ( ON ?auto_506656 ?auto_506654 ) ( ON ?auto_506655 ?auto_506656 ) ( ON ?auto_506657 ?auto_506655 ) ( ON ?auto_506658 ?auto_506657 ) ( ON ?auto_506659 ?auto_506658 ) ( ON ?auto_506660 ?auto_506659 ) ( ON ?auto_506661 ?auto_506660 ) ( not ( = ?auto_506652 ?auto_506653 ) ) ( not ( = ?auto_506652 ?auto_506654 ) ) ( not ( = ?auto_506652 ?auto_506656 ) ) ( not ( = ?auto_506652 ?auto_506655 ) ) ( not ( = ?auto_506652 ?auto_506657 ) ) ( not ( = ?auto_506652 ?auto_506658 ) ) ( not ( = ?auto_506652 ?auto_506659 ) ) ( not ( = ?auto_506652 ?auto_506660 ) ) ( not ( = ?auto_506652 ?auto_506661 ) ) ( not ( = ?auto_506652 ?auto_506662 ) ) ( not ( = ?auto_506652 ?auto_506663 ) ) ( not ( = ?auto_506653 ?auto_506654 ) ) ( not ( = ?auto_506653 ?auto_506656 ) ) ( not ( = ?auto_506653 ?auto_506655 ) ) ( not ( = ?auto_506653 ?auto_506657 ) ) ( not ( = ?auto_506653 ?auto_506658 ) ) ( not ( = ?auto_506653 ?auto_506659 ) ) ( not ( = ?auto_506653 ?auto_506660 ) ) ( not ( = ?auto_506653 ?auto_506661 ) ) ( not ( = ?auto_506653 ?auto_506662 ) ) ( not ( = ?auto_506653 ?auto_506663 ) ) ( not ( = ?auto_506654 ?auto_506656 ) ) ( not ( = ?auto_506654 ?auto_506655 ) ) ( not ( = ?auto_506654 ?auto_506657 ) ) ( not ( = ?auto_506654 ?auto_506658 ) ) ( not ( = ?auto_506654 ?auto_506659 ) ) ( not ( = ?auto_506654 ?auto_506660 ) ) ( not ( = ?auto_506654 ?auto_506661 ) ) ( not ( = ?auto_506654 ?auto_506662 ) ) ( not ( = ?auto_506654 ?auto_506663 ) ) ( not ( = ?auto_506656 ?auto_506655 ) ) ( not ( = ?auto_506656 ?auto_506657 ) ) ( not ( = ?auto_506656 ?auto_506658 ) ) ( not ( = ?auto_506656 ?auto_506659 ) ) ( not ( = ?auto_506656 ?auto_506660 ) ) ( not ( = ?auto_506656 ?auto_506661 ) ) ( not ( = ?auto_506656 ?auto_506662 ) ) ( not ( = ?auto_506656 ?auto_506663 ) ) ( not ( = ?auto_506655 ?auto_506657 ) ) ( not ( = ?auto_506655 ?auto_506658 ) ) ( not ( = ?auto_506655 ?auto_506659 ) ) ( not ( = ?auto_506655 ?auto_506660 ) ) ( not ( = ?auto_506655 ?auto_506661 ) ) ( not ( = ?auto_506655 ?auto_506662 ) ) ( not ( = ?auto_506655 ?auto_506663 ) ) ( not ( = ?auto_506657 ?auto_506658 ) ) ( not ( = ?auto_506657 ?auto_506659 ) ) ( not ( = ?auto_506657 ?auto_506660 ) ) ( not ( = ?auto_506657 ?auto_506661 ) ) ( not ( = ?auto_506657 ?auto_506662 ) ) ( not ( = ?auto_506657 ?auto_506663 ) ) ( not ( = ?auto_506658 ?auto_506659 ) ) ( not ( = ?auto_506658 ?auto_506660 ) ) ( not ( = ?auto_506658 ?auto_506661 ) ) ( not ( = ?auto_506658 ?auto_506662 ) ) ( not ( = ?auto_506658 ?auto_506663 ) ) ( not ( = ?auto_506659 ?auto_506660 ) ) ( not ( = ?auto_506659 ?auto_506661 ) ) ( not ( = ?auto_506659 ?auto_506662 ) ) ( not ( = ?auto_506659 ?auto_506663 ) ) ( not ( = ?auto_506660 ?auto_506661 ) ) ( not ( = ?auto_506660 ?auto_506662 ) ) ( not ( = ?auto_506660 ?auto_506663 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_506661 ?auto_506662 ?auto_506663 )
      ( MAKE-11CRATE-VERIFY ?auto_506652 ?auto_506653 ?auto_506654 ?auto_506656 ?auto_506655 ?auto_506657 ?auto_506658 ?auto_506659 ?auto_506660 ?auto_506661 ?auto_506662 ?auto_506663 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_506773 - SURFACE
      ?auto_506774 - SURFACE
      ?auto_506775 - SURFACE
      ?auto_506777 - SURFACE
      ?auto_506776 - SURFACE
      ?auto_506778 - SURFACE
      ?auto_506779 - SURFACE
      ?auto_506780 - SURFACE
      ?auto_506781 - SURFACE
      ?auto_506782 - SURFACE
      ?auto_506783 - SURFACE
      ?auto_506784 - SURFACE
    )
    :vars
    (
      ?auto_506785 - HOIST
      ?auto_506788 - PLACE
      ?auto_506787 - TRUCK
      ?auto_506786 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_506785 ?auto_506788 ) ( SURFACE-AT ?auto_506783 ?auto_506788 ) ( CLEAR ?auto_506783 ) ( IS-CRATE ?auto_506784 ) ( not ( = ?auto_506783 ?auto_506784 ) ) ( AVAILABLE ?auto_506785 ) ( IN ?auto_506784 ?auto_506787 ) ( ON ?auto_506783 ?auto_506782 ) ( not ( = ?auto_506782 ?auto_506783 ) ) ( not ( = ?auto_506782 ?auto_506784 ) ) ( TRUCK-AT ?auto_506787 ?auto_506786 ) ( not ( = ?auto_506786 ?auto_506788 ) ) ( ON ?auto_506774 ?auto_506773 ) ( ON ?auto_506775 ?auto_506774 ) ( ON ?auto_506777 ?auto_506775 ) ( ON ?auto_506776 ?auto_506777 ) ( ON ?auto_506778 ?auto_506776 ) ( ON ?auto_506779 ?auto_506778 ) ( ON ?auto_506780 ?auto_506779 ) ( ON ?auto_506781 ?auto_506780 ) ( ON ?auto_506782 ?auto_506781 ) ( not ( = ?auto_506773 ?auto_506774 ) ) ( not ( = ?auto_506773 ?auto_506775 ) ) ( not ( = ?auto_506773 ?auto_506777 ) ) ( not ( = ?auto_506773 ?auto_506776 ) ) ( not ( = ?auto_506773 ?auto_506778 ) ) ( not ( = ?auto_506773 ?auto_506779 ) ) ( not ( = ?auto_506773 ?auto_506780 ) ) ( not ( = ?auto_506773 ?auto_506781 ) ) ( not ( = ?auto_506773 ?auto_506782 ) ) ( not ( = ?auto_506773 ?auto_506783 ) ) ( not ( = ?auto_506773 ?auto_506784 ) ) ( not ( = ?auto_506774 ?auto_506775 ) ) ( not ( = ?auto_506774 ?auto_506777 ) ) ( not ( = ?auto_506774 ?auto_506776 ) ) ( not ( = ?auto_506774 ?auto_506778 ) ) ( not ( = ?auto_506774 ?auto_506779 ) ) ( not ( = ?auto_506774 ?auto_506780 ) ) ( not ( = ?auto_506774 ?auto_506781 ) ) ( not ( = ?auto_506774 ?auto_506782 ) ) ( not ( = ?auto_506774 ?auto_506783 ) ) ( not ( = ?auto_506774 ?auto_506784 ) ) ( not ( = ?auto_506775 ?auto_506777 ) ) ( not ( = ?auto_506775 ?auto_506776 ) ) ( not ( = ?auto_506775 ?auto_506778 ) ) ( not ( = ?auto_506775 ?auto_506779 ) ) ( not ( = ?auto_506775 ?auto_506780 ) ) ( not ( = ?auto_506775 ?auto_506781 ) ) ( not ( = ?auto_506775 ?auto_506782 ) ) ( not ( = ?auto_506775 ?auto_506783 ) ) ( not ( = ?auto_506775 ?auto_506784 ) ) ( not ( = ?auto_506777 ?auto_506776 ) ) ( not ( = ?auto_506777 ?auto_506778 ) ) ( not ( = ?auto_506777 ?auto_506779 ) ) ( not ( = ?auto_506777 ?auto_506780 ) ) ( not ( = ?auto_506777 ?auto_506781 ) ) ( not ( = ?auto_506777 ?auto_506782 ) ) ( not ( = ?auto_506777 ?auto_506783 ) ) ( not ( = ?auto_506777 ?auto_506784 ) ) ( not ( = ?auto_506776 ?auto_506778 ) ) ( not ( = ?auto_506776 ?auto_506779 ) ) ( not ( = ?auto_506776 ?auto_506780 ) ) ( not ( = ?auto_506776 ?auto_506781 ) ) ( not ( = ?auto_506776 ?auto_506782 ) ) ( not ( = ?auto_506776 ?auto_506783 ) ) ( not ( = ?auto_506776 ?auto_506784 ) ) ( not ( = ?auto_506778 ?auto_506779 ) ) ( not ( = ?auto_506778 ?auto_506780 ) ) ( not ( = ?auto_506778 ?auto_506781 ) ) ( not ( = ?auto_506778 ?auto_506782 ) ) ( not ( = ?auto_506778 ?auto_506783 ) ) ( not ( = ?auto_506778 ?auto_506784 ) ) ( not ( = ?auto_506779 ?auto_506780 ) ) ( not ( = ?auto_506779 ?auto_506781 ) ) ( not ( = ?auto_506779 ?auto_506782 ) ) ( not ( = ?auto_506779 ?auto_506783 ) ) ( not ( = ?auto_506779 ?auto_506784 ) ) ( not ( = ?auto_506780 ?auto_506781 ) ) ( not ( = ?auto_506780 ?auto_506782 ) ) ( not ( = ?auto_506780 ?auto_506783 ) ) ( not ( = ?auto_506780 ?auto_506784 ) ) ( not ( = ?auto_506781 ?auto_506782 ) ) ( not ( = ?auto_506781 ?auto_506783 ) ) ( not ( = ?auto_506781 ?auto_506784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_506782 ?auto_506783 ?auto_506784 )
      ( MAKE-11CRATE-VERIFY ?auto_506773 ?auto_506774 ?auto_506775 ?auto_506777 ?auto_506776 ?auto_506778 ?auto_506779 ?auto_506780 ?auto_506781 ?auto_506782 ?auto_506783 ?auto_506784 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_506905 - SURFACE
      ?auto_506906 - SURFACE
      ?auto_506907 - SURFACE
      ?auto_506909 - SURFACE
      ?auto_506908 - SURFACE
      ?auto_506910 - SURFACE
      ?auto_506911 - SURFACE
      ?auto_506912 - SURFACE
      ?auto_506913 - SURFACE
      ?auto_506914 - SURFACE
      ?auto_506915 - SURFACE
      ?auto_506916 - SURFACE
    )
    :vars
    (
      ?auto_506920 - HOIST
      ?auto_506918 - PLACE
      ?auto_506917 - TRUCK
      ?auto_506919 - PLACE
      ?auto_506921 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_506920 ?auto_506918 ) ( SURFACE-AT ?auto_506915 ?auto_506918 ) ( CLEAR ?auto_506915 ) ( IS-CRATE ?auto_506916 ) ( not ( = ?auto_506915 ?auto_506916 ) ) ( AVAILABLE ?auto_506920 ) ( ON ?auto_506915 ?auto_506914 ) ( not ( = ?auto_506914 ?auto_506915 ) ) ( not ( = ?auto_506914 ?auto_506916 ) ) ( TRUCK-AT ?auto_506917 ?auto_506919 ) ( not ( = ?auto_506919 ?auto_506918 ) ) ( HOIST-AT ?auto_506921 ?auto_506919 ) ( LIFTING ?auto_506921 ?auto_506916 ) ( not ( = ?auto_506920 ?auto_506921 ) ) ( ON ?auto_506906 ?auto_506905 ) ( ON ?auto_506907 ?auto_506906 ) ( ON ?auto_506909 ?auto_506907 ) ( ON ?auto_506908 ?auto_506909 ) ( ON ?auto_506910 ?auto_506908 ) ( ON ?auto_506911 ?auto_506910 ) ( ON ?auto_506912 ?auto_506911 ) ( ON ?auto_506913 ?auto_506912 ) ( ON ?auto_506914 ?auto_506913 ) ( not ( = ?auto_506905 ?auto_506906 ) ) ( not ( = ?auto_506905 ?auto_506907 ) ) ( not ( = ?auto_506905 ?auto_506909 ) ) ( not ( = ?auto_506905 ?auto_506908 ) ) ( not ( = ?auto_506905 ?auto_506910 ) ) ( not ( = ?auto_506905 ?auto_506911 ) ) ( not ( = ?auto_506905 ?auto_506912 ) ) ( not ( = ?auto_506905 ?auto_506913 ) ) ( not ( = ?auto_506905 ?auto_506914 ) ) ( not ( = ?auto_506905 ?auto_506915 ) ) ( not ( = ?auto_506905 ?auto_506916 ) ) ( not ( = ?auto_506906 ?auto_506907 ) ) ( not ( = ?auto_506906 ?auto_506909 ) ) ( not ( = ?auto_506906 ?auto_506908 ) ) ( not ( = ?auto_506906 ?auto_506910 ) ) ( not ( = ?auto_506906 ?auto_506911 ) ) ( not ( = ?auto_506906 ?auto_506912 ) ) ( not ( = ?auto_506906 ?auto_506913 ) ) ( not ( = ?auto_506906 ?auto_506914 ) ) ( not ( = ?auto_506906 ?auto_506915 ) ) ( not ( = ?auto_506906 ?auto_506916 ) ) ( not ( = ?auto_506907 ?auto_506909 ) ) ( not ( = ?auto_506907 ?auto_506908 ) ) ( not ( = ?auto_506907 ?auto_506910 ) ) ( not ( = ?auto_506907 ?auto_506911 ) ) ( not ( = ?auto_506907 ?auto_506912 ) ) ( not ( = ?auto_506907 ?auto_506913 ) ) ( not ( = ?auto_506907 ?auto_506914 ) ) ( not ( = ?auto_506907 ?auto_506915 ) ) ( not ( = ?auto_506907 ?auto_506916 ) ) ( not ( = ?auto_506909 ?auto_506908 ) ) ( not ( = ?auto_506909 ?auto_506910 ) ) ( not ( = ?auto_506909 ?auto_506911 ) ) ( not ( = ?auto_506909 ?auto_506912 ) ) ( not ( = ?auto_506909 ?auto_506913 ) ) ( not ( = ?auto_506909 ?auto_506914 ) ) ( not ( = ?auto_506909 ?auto_506915 ) ) ( not ( = ?auto_506909 ?auto_506916 ) ) ( not ( = ?auto_506908 ?auto_506910 ) ) ( not ( = ?auto_506908 ?auto_506911 ) ) ( not ( = ?auto_506908 ?auto_506912 ) ) ( not ( = ?auto_506908 ?auto_506913 ) ) ( not ( = ?auto_506908 ?auto_506914 ) ) ( not ( = ?auto_506908 ?auto_506915 ) ) ( not ( = ?auto_506908 ?auto_506916 ) ) ( not ( = ?auto_506910 ?auto_506911 ) ) ( not ( = ?auto_506910 ?auto_506912 ) ) ( not ( = ?auto_506910 ?auto_506913 ) ) ( not ( = ?auto_506910 ?auto_506914 ) ) ( not ( = ?auto_506910 ?auto_506915 ) ) ( not ( = ?auto_506910 ?auto_506916 ) ) ( not ( = ?auto_506911 ?auto_506912 ) ) ( not ( = ?auto_506911 ?auto_506913 ) ) ( not ( = ?auto_506911 ?auto_506914 ) ) ( not ( = ?auto_506911 ?auto_506915 ) ) ( not ( = ?auto_506911 ?auto_506916 ) ) ( not ( = ?auto_506912 ?auto_506913 ) ) ( not ( = ?auto_506912 ?auto_506914 ) ) ( not ( = ?auto_506912 ?auto_506915 ) ) ( not ( = ?auto_506912 ?auto_506916 ) ) ( not ( = ?auto_506913 ?auto_506914 ) ) ( not ( = ?auto_506913 ?auto_506915 ) ) ( not ( = ?auto_506913 ?auto_506916 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_506914 ?auto_506915 ?auto_506916 )
      ( MAKE-11CRATE-VERIFY ?auto_506905 ?auto_506906 ?auto_506907 ?auto_506909 ?auto_506908 ?auto_506910 ?auto_506911 ?auto_506912 ?auto_506913 ?auto_506914 ?auto_506915 ?auto_506916 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_507048 - SURFACE
      ?auto_507049 - SURFACE
      ?auto_507050 - SURFACE
      ?auto_507052 - SURFACE
      ?auto_507051 - SURFACE
      ?auto_507053 - SURFACE
      ?auto_507054 - SURFACE
      ?auto_507055 - SURFACE
      ?auto_507056 - SURFACE
      ?auto_507057 - SURFACE
      ?auto_507058 - SURFACE
      ?auto_507059 - SURFACE
    )
    :vars
    (
      ?auto_507063 - HOIST
      ?auto_507062 - PLACE
      ?auto_507065 - TRUCK
      ?auto_507061 - PLACE
      ?auto_507060 - HOIST
      ?auto_507064 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_507063 ?auto_507062 ) ( SURFACE-AT ?auto_507058 ?auto_507062 ) ( CLEAR ?auto_507058 ) ( IS-CRATE ?auto_507059 ) ( not ( = ?auto_507058 ?auto_507059 ) ) ( AVAILABLE ?auto_507063 ) ( ON ?auto_507058 ?auto_507057 ) ( not ( = ?auto_507057 ?auto_507058 ) ) ( not ( = ?auto_507057 ?auto_507059 ) ) ( TRUCK-AT ?auto_507065 ?auto_507061 ) ( not ( = ?auto_507061 ?auto_507062 ) ) ( HOIST-AT ?auto_507060 ?auto_507061 ) ( not ( = ?auto_507063 ?auto_507060 ) ) ( AVAILABLE ?auto_507060 ) ( SURFACE-AT ?auto_507059 ?auto_507061 ) ( ON ?auto_507059 ?auto_507064 ) ( CLEAR ?auto_507059 ) ( not ( = ?auto_507058 ?auto_507064 ) ) ( not ( = ?auto_507059 ?auto_507064 ) ) ( not ( = ?auto_507057 ?auto_507064 ) ) ( ON ?auto_507049 ?auto_507048 ) ( ON ?auto_507050 ?auto_507049 ) ( ON ?auto_507052 ?auto_507050 ) ( ON ?auto_507051 ?auto_507052 ) ( ON ?auto_507053 ?auto_507051 ) ( ON ?auto_507054 ?auto_507053 ) ( ON ?auto_507055 ?auto_507054 ) ( ON ?auto_507056 ?auto_507055 ) ( ON ?auto_507057 ?auto_507056 ) ( not ( = ?auto_507048 ?auto_507049 ) ) ( not ( = ?auto_507048 ?auto_507050 ) ) ( not ( = ?auto_507048 ?auto_507052 ) ) ( not ( = ?auto_507048 ?auto_507051 ) ) ( not ( = ?auto_507048 ?auto_507053 ) ) ( not ( = ?auto_507048 ?auto_507054 ) ) ( not ( = ?auto_507048 ?auto_507055 ) ) ( not ( = ?auto_507048 ?auto_507056 ) ) ( not ( = ?auto_507048 ?auto_507057 ) ) ( not ( = ?auto_507048 ?auto_507058 ) ) ( not ( = ?auto_507048 ?auto_507059 ) ) ( not ( = ?auto_507048 ?auto_507064 ) ) ( not ( = ?auto_507049 ?auto_507050 ) ) ( not ( = ?auto_507049 ?auto_507052 ) ) ( not ( = ?auto_507049 ?auto_507051 ) ) ( not ( = ?auto_507049 ?auto_507053 ) ) ( not ( = ?auto_507049 ?auto_507054 ) ) ( not ( = ?auto_507049 ?auto_507055 ) ) ( not ( = ?auto_507049 ?auto_507056 ) ) ( not ( = ?auto_507049 ?auto_507057 ) ) ( not ( = ?auto_507049 ?auto_507058 ) ) ( not ( = ?auto_507049 ?auto_507059 ) ) ( not ( = ?auto_507049 ?auto_507064 ) ) ( not ( = ?auto_507050 ?auto_507052 ) ) ( not ( = ?auto_507050 ?auto_507051 ) ) ( not ( = ?auto_507050 ?auto_507053 ) ) ( not ( = ?auto_507050 ?auto_507054 ) ) ( not ( = ?auto_507050 ?auto_507055 ) ) ( not ( = ?auto_507050 ?auto_507056 ) ) ( not ( = ?auto_507050 ?auto_507057 ) ) ( not ( = ?auto_507050 ?auto_507058 ) ) ( not ( = ?auto_507050 ?auto_507059 ) ) ( not ( = ?auto_507050 ?auto_507064 ) ) ( not ( = ?auto_507052 ?auto_507051 ) ) ( not ( = ?auto_507052 ?auto_507053 ) ) ( not ( = ?auto_507052 ?auto_507054 ) ) ( not ( = ?auto_507052 ?auto_507055 ) ) ( not ( = ?auto_507052 ?auto_507056 ) ) ( not ( = ?auto_507052 ?auto_507057 ) ) ( not ( = ?auto_507052 ?auto_507058 ) ) ( not ( = ?auto_507052 ?auto_507059 ) ) ( not ( = ?auto_507052 ?auto_507064 ) ) ( not ( = ?auto_507051 ?auto_507053 ) ) ( not ( = ?auto_507051 ?auto_507054 ) ) ( not ( = ?auto_507051 ?auto_507055 ) ) ( not ( = ?auto_507051 ?auto_507056 ) ) ( not ( = ?auto_507051 ?auto_507057 ) ) ( not ( = ?auto_507051 ?auto_507058 ) ) ( not ( = ?auto_507051 ?auto_507059 ) ) ( not ( = ?auto_507051 ?auto_507064 ) ) ( not ( = ?auto_507053 ?auto_507054 ) ) ( not ( = ?auto_507053 ?auto_507055 ) ) ( not ( = ?auto_507053 ?auto_507056 ) ) ( not ( = ?auto_507053 ?auto_507057 ) ) ( not ( = ?auto_507053 ?auto_507058 ) ) ( not ( = ?auto_507053 ?auto_507059 ) ) ( not ( = ?auto_507053 ?auto_507064 ) ) ( not ( = ?auto_507054 ?auto_507055 ) ) ( not ( = ?auto_507054 ?auto_507056 ) ) ( not ( = ?auto_507054 ?auto_507057 ) ) ( not ( = ?auto_507054 ?auto_507058 ) ) ( not ( = ?auto_507054 ?auto_507059 ) ) ( not ( = ?auto_507054 ?auto_507064 ) ) ( not ( = ?auto_507055 ?auto_507056 ) ) ( not ( = ?auto_507055 ?auto_507057 ) ) ( not ( = ?auto_507055 ?auto_507058 ) ) ( not ( = ?auto_507055 ?auto_507059 ) ) ( not ( = ?auto_507055 ?auto_507064 ) ) ( not ( = ?auto_507056 ?auto_507057 ) ) ( not ( = ?auto_507056 ?auto_507058 ) ) ( not ( = ?auto_507056 ?auto_507059 ) ) ( not ( = ?auto_507056 ?auto_507064 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_507057 ?auto_507058 ?auto_507059 )
      ( MAKE-11CRATE-VERIFY ?auto_507048 ?auto_507049 ?auto_507050 ?auto_507052 ?auto_507051 ?auto_507053 ?auto_507054 ?auto_507055 ?auto_507056 ?auto_507057 ?auto_507058 ?auto_507059 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_507192 - SURFACE
      ?auto_507193 - SURFACE
      ?auto_507194 - SURFACE
      ?auto_507196 - SURFACE
      ?auto_507195 - SURFACE
      ?auto_507197 - SURFACE
      ?auto_507198 - SURFACE
      ?auto_507199 - SURFACE
      ?auto_507200 - SURFACE
      ?auto_507201 - SURFACE
      ?auto_507202 - SURFACE
      ?auto_507203 - SURFACE
    )
    :vars
    (
      ?auto_507208 - HOIST
      ?auto_507204 - PLACE
      ?auto_507205 - PLACE
      ?auto_507209 - HOIST
      ?auto_507207 - SURFACE
      ?auto_507206 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_507208 ?auto_507204 ) ( SURFACE-AT ?auto_507202 ?auto_507204 ) ( CLEAR ?auto_507202 ) ( IS-CRATE ?auto_507203 ) ( not ( = ?auto_507202 ?auto_507203 ) ) ( AVAILABLE ?auto_507208 ) ( ON ?auto_507202 ?auto_507201 ) ( not ( = ?auto_507201 ?auto_507202 ) ) ( not ( = ?auto_507201 ?auto_507203 ) ) ( not ( = ?auto_507205 ?auto_507204 ) ) ( HOIST-AT ?auto_507209 ?auto_507205 ) ( not ( = ?auto_507208 ?auto_507209 ) ) ( AVAILABLE ?auto_507209 ) ( SURFACE-AT ?auto_507203 ?auto_507205 ) ( ON ?auto_507203 ?auto_507207 ) ( CLEAR ?auto_507203 ) ( not ( = ?auto_507202 ?auto_507207 ) ) ( not ( = ?auto_507203 ?auto_507207 ) ) ( not ( = ?auto_507201 ?auto_507207 ) ) ( TRUCK-AT ?auto_507206 ?auto_507204 ) ( ON ?auto_507193 ?auto_507192 ) ( ON ?auto_507194 ?auto_507193 ) ( ON ?auto_507196 ?auto_507194 ) ( ON ?auto_507195 ?auto_507196 ) ( ON ?auto_507197 ?auto_507195 ) ( ON ?auto_507198 ?auto_507197 ) ( ON ?auto_507199 ?auto_507198 ) ( ON ?auto_507200 ?auto_507199 ) ( ON ?auto_507201 ?auto_507200 ) ( not ( = ?auto_507192 ?auto_507193 ) ) ( not ( = ?auto_507192 ?auto_507194 ) ) ( not ( = ?auto_507192 ?auto_507196 ) ) ( not ( = ?auto_507192 ?auto_507195 ) ) ( not ( = ?auto_507192 ?auto_507197 ) ) ( not ( = ?auto_507192 ?auto_507198 ) ) ( not ( = ?auto_507192 ?auto_507199 ) ) ( not ( = ?auto_507192 ?auto_507200 ) ) ( not ( = ?auto_507192 ?auto_507201 ) ) ( not ( = ?auto_507192 ?auto_507202 ) ) ( not ( = ?auto_507192 ?auto_507203 ) ) ( not ( = ?auto_507192 ?auto_507207 ) ) ( not ( = ?auto_507193 ?auto_507194 ) ) ( not ( = ?auto_507193 ?auto_507196 ) ) ( not ( = ?auto_507193 ?auto_507195 ) ) ( not ( = ?auto_507193 ?auto_507197 ) ) ( not ( = ?auto_507193 ?auto_507198 ) ) ( not ( = ?auto_507193 ?auto_507199 ) ) ( not ( = ?auto_507193 ?auto_507200 ) ) ( not ( = ?auto_507193 ?auto_507201 ) ) ( not ( = ?auto_507193 ?auto_507202 ) ) ( not ( = ?auto_507193 ?auto_507203 ) ) ( not ( = ?auto_507193 ?auto_507207 ) ) ( not ( = ?auto_507194 ?auto_507196 ) ) ( not ( = ?auto_507194 ?auto_507195 ) ) ( not ( = ?auto_507194 ?auto_507197 ) ) ( not ( = ?auto_507194 ?auto_507198 ) ) ( not ( = ?auto_507194 ?auto_507199 ) ) ( not ( = ?auto_507194 ?auto_507200 ) ) ( not ( = ?auto_507194 ?auto_507201 ) ) ( not ( = ?auto_507194 ?auto_507202 ) ) ( not ( = ?auto_507194 ?auto_507203 ) ) ( not ( = ?auto_507194 ?auto_507207 ) ) ( not ( = ?auto_507196 ?auto_507195 ) ) ( not ( = ?auto_507196 ?auto_507197 ) ) ( not ( = ?auto_507196 ?auto_507198 ) ) ( not ( = ?auto_507196 ?auto_507199 ) ) ( not ( = ?auto_507196 ?auto_507200 ) ) ( not ( = ?auto_507196 ?auto_507201 ) ) ( not ( = ?auto_507196 ?auto_507202 ) ) ( not ( = ?auto_507196 ?auto_507203 ) ) ( not ( = ?auto_507196 ?auto_507207 ) ) ( not ( = ?auto_507195 ?auto_507197 ) ) ( not ( = ?auto_507195 ?auto_507198 ) ) ( not ( = ?auto_507195 ?auto_507199 ) ) ( not ( = ?auto_507195 ?auto_507200 ) ) ( not ( = ?auto_507195 ?auto_507201 ) ) ( not ( = ?auto_507195 ?auto_507202 ) ) ( not ( = ?auto_507195 ?auto_507203 ) ) ( not ( = ?auto_507195 ?auto_507207 ) ) ( not ( = ?auto_507197 ?auto_507198 ) ) ( not ( = ?auto_507197 ?auto_507199 ) ) ( not ( = ?auto_507197 ?auto_507200 ) ) ( not ( = ?auto_507197 ?auto_507201 ) ) ( not ( = ?auto_507197 ?auto_507202 ) ) ( not ( = ?auto_507197 ?auto_507203 ) ) ( not ( = ?auto_507197 ?auto_507207 ) ) ( not ( = ?auto_507198 ?auto_507199 ) ) ( not ( = ?auto_507198 ?auto_507200 ) ) ( not ( = ?auto_507198 ?auto_507201 ) ) ( not ( = ?auto_507198 ?auto_507202 ) ) ( not ( = ?auto_507198 ?auto_507203 ) ) ( not ( = ?auto_507198 ?auto_507207 ) ) ( not ( = ?auto_507199 ?auto_507200 ) ) ( not ( = ?auto_507199 ?auto_507201 ) ) ( not ( = ?auto_507199 ?auto_507202 ) ) ( not ( = ?auto_507199 ?auto_507203 ) ) ( not ( = ?auto_507199 ?auto_507207 ) ) ( not ( = ?auto_507200 ?auto_507201 ) ) ( not ( = ?auto_507200 ?auto_507202 ) ) ( not ( = ?auto_507200 ?auto_507203 ) ) ( not ( = ?auto_507200 ?auto_507207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_507201 ?auto_507202 ?auto_507203 )
      ( MAKE-11CRATE-VERIFY ?auto_507192 ?auto_507193 ?auto_507194 ?auto_507196 ?auto_507195 ?auto_507197 ?auto_507198 ?auto_507199 ?auto_507200 ?auto_507201 ?auto_507202 ?auto_507203 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_507336 - SURFACE
      ?auto_507337 - SURFACE
      ?auto_507338 - SURFACE
      ?auto_507340 - SURFACE
      ?auto_507339 - SURFACE
      ?auto_507341 - SURFACE
      ?auto_507342 - SURFACE
      ?auto_507343 - SURFACE
      ?auto_507344 - SURFACE
      ?auto_507345 - SURFACE
      ?auto_507346 - SURFACE
      ?auto_507347 - SURFACE
    )
    :vars
    (
      ?auto_507353 - HOIST
      ?auto_507352 - PLACE
      ?auto_507348 - PLACE
      ?auto_507350 - HOIST
      ?auto_507349 - SURFACE
      ?auto_507351 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_507353 ?auto_507352 ) ( IS-CRATE ?auto_507347 ) ( not ( = ?auto_507346 ?auto_507347 ) ) ( not ( = ?auto_507345 ?auto_507346 ) ) ( not ( = ?auto_507345 ?auto_507347 ) ) ( not ( = ?auto_507348 ?auto_507352 ) ) ( HOIST-AT ?auto_507350 ?auto_507348 ) ( not ( = ?auto_507353 ?auto_507350 ) ) ( AVAILABLE ?auto_507350 ) ( SURFACE-AT ?auto_507347 ?auto_507348 ) ( ON ?auto_507347 ?auto_507349 ) ( CLEAR ?auto_507347 ) ( not ( = ?auto_507346 ?auto_507349 ) ) ( not ( = ?auto_507347 ?auto_507349 ) ) ( not ( = ?auto_507345 ?auto_507349 ) ) ( TRUCK-AT ?auto_507351 ?auto_507352 ) ( SURFACE-AT ?auto_507345 ?auto_507352 ) ( CLEAR ?auto_507345 ) ( LIFTING ?auto_507353 ?auto_507346 ) ( IS-CRATE ?auto_507346 ) ( ON ?auto_507337 ?auto_507336 ) ( ON ?auto_507338 ?auto_507337 ) ( ON ?auto_507340 ?auto_507338 ) ( ON ?auto_507339 ?auto_507340 ) ( ON ?auto_507341 ?auto_507339 ) ( ON ?auto_507342 ?auto_507341 ) ( ON ?auto_507343 ?auto_507342 ) ( ON ?auto_507344 ?auto_507343 ) ( ON ?auto_507345 ?auto_507344 ) ( not ( = ?auto_507336 ?auto_507337 ) ) ( not ( = ?auto_507336 ?auto_507338 ) ) ( not ( = ?auto_507336 ?auto_507340 ) ) ( not ( = ?auto_507336 ?auto_507339 ) ) ( not ( = ?auto_507336 ?auto_507341 ) ) ( not ( = ?auto_507336 ?auto_507342 ) ) ( not ( = ?auto_507336 ?auto_507343 ) ) ( not ( = ?auto_507336 ?auto_507344 ) ) ( not ( = ?auto_507336 ?auto_507345 ) ) ( not ( = ?auto_507336 ?auto_507346 ) ) ( not ( = ?auto_507336 ?auto_507347 ) ) ( not ( = ?auto_507336 ?auto_507349 ) ) ( not ( = ?auto_507337 ?auto_507338 ) ) ( not ( = ?auto_507337 ?auto_507340 ) ) ( not ( = ?auto_507337 ?auto_507339 ) ) ( not ( = ?auto_507337 ?auto_507341 ) ) ( not ( = ?auto_507337 ?auto_507342 ) ) ( not ( = ?auto_507337 ?auto_507343 ) ) ( not ( = ?auto_507337 ?auto_507344 ) ) ( not ( = ?auto_507337 ?auto_507345 ) ) ( not ( = ?auto_507337 ?auto_507346 ) ) ( not ( = ?auto_507337 ?auto_507347 ) ) ( not ( = ?auto_507337 ?auto_507349 ) ) ( not ( = ?auto_507338 ?auto_507340 ) ) ( not ( = ?auto_507338 ?auto_507339 ) ) ( not ( = ?auto_507338 ?auto_507341 ) ) ( not ( = ?auto_507338 ?auto_507342 ) ) ( not ( = ?auto_507338 ?auto_507343 ) ) ( not ( = ?auto_507338 ?auto_507344 ) ) ( not ( = ?auto_507338 ?auto_507345 ) ) ( not ( = ?auto_507338 ?auto_507346 ) ) ( not ( = ?auto_507338 ?auto_507347 ) ) ( not ( = ?auto_507338 ?auto_507349 ) ) ( not ( = ?auto_507340 ?auto_507339 ) ) ( not ( = ?auto_507340 ?auto_507341 ) ) ( not ( = ?auto_507340 ?auto_507342 ) ) ( not ( = ?auto_507340 ?auto_507343 ) ) ( not ( = ?auto_507340 ?auto_507344 ) ) ( not ( = ?auto_507340 ?auto_507345 ) ) ( not ( = ?auto_507340 ?auto_507346 ) ) ( not ( = ?auto_507340 ?auto_507347 ) ) ( not ( = ?auto_507340 ?auto_507349 ) ) ( not ( = ?auto_507339 ?auto_507341 ) ) ( not ( = ?auto_507339 ?auto_507342 ) ) ( not ( = ?auto_507339 ?auto_507343 ) ) ( not ( = ?auto_507339 ?auto_507344 ) ) ( not ( = ?auto_507339 ?auto_507345 ) ) ( not ( = ?auto_507339 ?auto_507346 ) ) ( not ( = ?auto_507339 ?auto_507347 ) ) ( not ( = ?auto_507339 ?auto_507349 ) ) ( not ( = ?auto_507341 ?auto_507342 ) ) ( not ( = ?auto_507341 ?auto_507343 ) ) ( not ( = ?auto_507341 ?auto_507344 ) ) ( not ( = ?auto_507341 ?auto_507345 ) ) ( not ( = ?auto_507341 ?auto_507346 ) ) ( not ( = ?auto_507341 ?auto_507347 ) ) ( not ( = ?auto_507341 ?auto_507349 ) ) ( not ( = ?auto_507342 ?auto_507343 ) ) ( not ( = ?auto_507342 ?auto_507344 ) ) ( not ( = ?auto_507342 ?auto_507345 ) ) ( not ( = ?auto_507342 ?auto_507346 ) ) ( not ( = ?auto_507342 ?auto_507347 ) ) ( not ( = ?auto_507342 ?auto_507349 ) ) ( not ( = ?auto_507343 ?auto_507344 ) ) ( not ( = ?auto_507343 ?auto_507345 ) ) ( not ( = ?auto_507343 ?auto_507346 ) ) ( not ( = ?auto_507343 ?auto_507347 ) ) ( not ( = ?auto_507343 ?auto_507349 ) ) ( not ( = ?auto_507344 ?auto_507345 ) ) ( not ( = ?auto_507344 ?auto_507346 ) ) ( not ( = ?auto_507344 ?auto_507347 ) ) ( not ( = ?auto_507344 ?auto_507349 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_507345 ?auto_507346 ?auto_507347 )
      ( MAKE-11CRATE-VERIFY ?auto_507336 ?auto_507337 ?auto_507338 ?auto_507340 ?auto_507339 ?auto_507341 ?auto_507342 ?auto_507343 ?auto_507344 ?auto_507345 ?auto_507346 ?auto_507347 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_507480 - SURFACE
      ?auto_507481 - SURFACE
      ?auto_507482 - SURFACE
      ?auto_507484 - SURFACE
      ?auto_507483 - SURFACE
      ?auto_507485 - SURFACE
      ?auto_507486 - SURFACE
      ?auto_507487 - SURFACE
      ?auto_507488 - SURFACE
      ?auto_507489 - SURFACE
      ?auto_507490 - SURFACE
      ?auto_507491 - SURFACE
    )
    :vars
    (
      ?auto_507496 - HOIST
      ?auto_507492 - PLACE
      ?auto_507493 - PLACE
      ?auto_507495 - HOIST
      ?auto_507497 - SURFACE
      ?auto_507494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_507496 ?auto_507492 ) ( IS-CRATE ?auto_507491 ) ( not ( = ?auto_507490 ?auto_507491 ) ) ( not ( = ?auto_507489 ?auto_507490 ) ) ( not ( = ?auto_507489 ?auto_507491 ) ) ( not ( = ?auto_507493 ?auto_507492 ) ) ( HOIST-AT ?auto_507495 ?auto_507493 ) ( not ( = ?auto_507496 ?auto_507495 ) ) ( AVAILABLE ?auto_507495 ) ( SURFACE-AT ?auto_507491 ?auto_507493 ) ( ON ?auto_507491 ?auto_507497 ) ( CLEAR ?auto_507491 ) ( not ( = ?auto_507490 ?auto_507497 ) ) ( not ( = ?auto_507491 ?auto_507497 ) ) ( not ( = ?auto_507489 ?auto_507497 ) ) ( TRUCK-AT ?auto_507494 ?auto_507492 ) ( SURFACE-AT ?auto_507489 ?auto_507492 ) ( CLEAR ?auto_507489 ) ( IS-CRATE ?auto_507490 ) ( AVAILABLE ?auto_507496 ) ( IN ?auto_507490 ?auto_507494 ) ( ON ?auto_507481 ?auto_507480 ) ( ON ?auto_507482 ?auto_507481 ) ( ON ?auto_507484 ?auto_507482 ) ( ON ?auto_507483 ?auto_507484 ) ( ON ?auto_507485 ?auto_507483 ) ( ON ?auto_507486 ?auto_507485 ) ( ON ?auto_507487 ?auto_507486 ) ( ON ?auto_507488 ?auto_507487 ) ( ON ?auto_507489 ?auto_507488 ) ( not ( = ?auto_507480 ?auto_507481 ) ) ( not ( = ?auto_507480 ?auto_507482 ) ) ( not ( = ?auto_507480 ?auto_507484 ) ) ( not ( = ?auto_507480 ?auto_507483 ) ) ( not ( = ?auto_507480 ?auto_507485 ) ) ( not ( = ?auto_507480 ?auto_507486 ) ) ( not ( = ?auto_507480 ?auto_507487 ) ) ( not ( = ?auto_507480 ?auto_507488 ) ) ( not ( = ?auto_507480 ?auto_507489 ) ) ( not ( = ?auto_507480 ?auto_507490 ) ) ( not ( = ?auto_507480 ?auto_507491 ) ) ( not ( = ?auto_507480 ?auto_507497 ) ) ( not ( = ?auto_507481 ?auto_507482 ) ) ( not ( = ?auto_507481 ?auto_507484 ) ) ( not ( = ?auto_507481 ?auto_507483 ) ) ( not ( = ?auto_507481 ?auto_507485 ) ) ( not ( = ?auto_507481 ?auto_507486 ) ) ( not ( = ?auto_507481 ?auto_507487 ) ) ( not ( = ?auto_507481 ?auto_507488 ) ) ( not ( = ?auto_507481 ?auto_507489 ) ) ( not ( = ?auto_507481 ?auto_507490 ) ) ( not ( = ?auto_507481 ?auto_507491 ) ) ( not ( = ?auto_507481 ?auto_507497 ) ) ( not ( = ?auto_507482 ?auto_507484 ) ) ( not ( = ?auto_507482 ?auto_507483 ) ) ( not ( = ?auto_507482 ?auto_507485 ) ) ( not ( = ?auto_507482 ?auto_507486 ) ) ( not ( = ?auto_507482 ?auto_507487 ) ) ( not ( = ?auto_507482 ?auto_507488 ) ) ( not ( = ?auto_507482 ?auto_507489 ) ) ( not ( = ?auto_507482 ?auto_507490 ) ) ( not ( = ?auto_507482 ?auto_507491 ) ) ( not ( = ?auto_507482 ?auto_507497 ) ) ( not ( = ?auto_507484 ?auto_507483 ) ) ( not ( = ?auto_507484 ?auto_507485 ) ) ( not ( = ?auto_507484 ?auto_507486 ) ) ( not ( = ?auto_507484 ?auto_507487 ) ) ( not ( = ?auto_507484 ?auto_507488 ) ) ( not ( = ?auto_507484 ?auto_507489 ) ) ( not ( = ?auto_507484 ?auto_507490 ) ) ( not ( = ?auto_507484 ?auto_507491 ) ) ( not ( = ?auto_507484 ?auto_507497 ) ) ( not ( = ?auto_507483 ?auto_507485 ) ) ( not ( = ?auto_507483 ?auto_507486 ) ) ( not ( = ?auto_507483 ?auto_507487 ) ) ( not ( = ?auto_507483 ?auto_507488 ) ) ( not ( = ?auto_507483 ?auto_507489 ) ) ( not ( = ?auto_507483 ?auto_507490 ) ) ( not ( = ?auto_507483 ?auto_507491 ) ) ( not ( = ?auto_507483 ?auto_507497 ) ) ( not ( = ?auto_507485 ?auto_507486 ) ) ( not ( = ?auto_507485 ?auto_507487 ) ) ( not ( = ?auto_507485 ?auto_507488 ) ) ( not ( = ?auto_507485 ?auto_507489 ) ) ( not ( = ?auto_507485 ?auto_507490 ) ) ( not ( = ?auto_507485 ?auto_507491 ) ) ( not ( = ?auto_507485 ?auto_507497 ) ) ( not ( = ?auto_507486 ?auto_507487 ) ) ( not ( = ?auto_507486 ?auto_507488 ) ) ( not ( = ?auto_507486 ?auto_507489 ) ) ( not ( = ?auto_507486 ?auto_507490 ) ) ( not ( = ?auto_507486 ?auto_507491 ) ) ( not ( = ?auto_507486 ?auto_507497 ) ) ( not ( = ?auto_507487 ?auto_507488 ) ) ( not ( = ?auto_507487 ?auto_507489 ) ) ( not ( = ?auto_507487 ?auto_507490 ) ) ( not ( = ?auto_507487 ?auto_507491 ) ) ( not ( = ?auto_507487 ?auto_507497 ) ) ( not ( = ?auto_507488 ?auto_507489 ) ) ( not ( = ?auto_507488 ?auto_507490 ) ) ( not ( = ?auto_507488 ?auto_507491 ) ) ( not ( = ?auto_507488 ?auto_507497 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_507489 ?auto_507490 ?auto_507491 )
      ( MAKE-11CRATE-VERIFY ?auto_507480 ?auto_507481 ?auto_507482 ?auto_507484 ?auto_507483 ?auto_507485 ?auto_507486 ?auto_507487 ?auto_507488 ?auto_507489 ?auto_507490 ?auto_507491 ) )
  )

)

